FILE **cqdb_writer(FILE *a1, int a2)
{
  FILE **v4;
  FILE **v5;
  int v6;
  uint64_t i;

  v4 = (FILE **)malloc_type_calloc(1uLL, 0x1028uLL, 0x1030040A4FE97ADuLL);
  v5 = v4;
  if (v4)
  {
    bzero((char *)v4 + 4, 0x1024uLL);
    *(_DWORD *)v5 = a2;
    v5[1] = a1;
    v6 = MEMORY[0x20BD069EC](a1);
    *((_DWORD *)v5 + 4) = v6;
    *((_DWORD *)v5 + 5) = 2072;
    for (i = 4; i != 516; i += 2)
      v5[i] = 0;
    *(_OWORD *)(v5 + 515) = 0u;
    if (fseek(v5[1], (v6 + 2072), 0))
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t cqdb_writer_put(uint64_t a1, char *__s, unsigned int a3)
{
  int v6;
  unint64_t v7;
  int v8;
  int v9;
  uint64_t result;
  unsigned int *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  char *v15;
  char *v16;
  int v17;
  unsigned int v18;
  _DWORD *v19;
  unsigned int v20;
  unsigned int __ptr;
  int v22;

  v6 = strlen(__s);
  v7 = (v6 + 1);
  v8 = hashlittle((unsigned __int8 *)__s, v7, 0);
  if ((a3 & 0x80000000) != 0)
  {
    result = 4294966278;
    goto LABEL_5;
  }
  v9 = v8;
  __ptr = a3;
  fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
  v22 = v6 + 1;
  fwrite(&v22, 1uLL, 4uLL, *(FILE **)(a1 + 8));
  fwrite(__s, v7, 1uLL, *(FILE **)(a1 + 8));
  if (!ferror(*(FILE **)(a1 + 8)))
  {
    v11 = (unsigned int *)(a1 + 16 * v9 + 24);
    v12 = a1 + 16 * v9;
    v13 = *(_DWORD *)(v12 + 28);
    v14 = *v11;
    if (v13 <= *v11)
    {
      *(_DWORD *)(v12 + 28) = 2 * v13 + 2;
      v15 = (char *)malloc_type_realloc(*(void **)(v12 + 32), 8 * (2 * v13 + 2), 0x100004000313F17uLL);
      *(_QWORD *)(v12 + 32) = v15;
      if (!v15)
      {
LABEL_15:
        result = 4294966274;
        goto LABEL_5;
      }
      v14 = *v11;
    }
    else
    {
      v15 = *(char **)(v12 + 32);
    }
    v16 = &v15[8 * v14];
    v17 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)v16 = v9;
    *((_DWORD *)v16 + 1) = v17;
    *v11 = v14 + 1;
    if ((*(_BYTE *)a1 & 1) == 0)
    {
      v18 = *(_DWORD *)(a1 + 4132);
      if (v18 <= a3)
      {
        do
          v18 = 2 * v18 + 2;
        while (v18 <= a3);
        v19 = malloc_type_realloc(*(void **)(a1 + 4120), 4 * v18, 0x100004052888210uLL);
        *(_QWORD *)(a1 + 4120) = v19;
        if (!v19)
          goto LABEL_15;
        while (1)
        {
          v20 = *(_DWORD *)(a1 + 4132);
          if (v20 >= v18)
            break;
          *(_DWORD *)(a1 + 4132) = v20 + 1;
          v19[v20] = 0;
        }
      }
      if (*(_DWORD *)(a1 + 4128) <= a3)
        *(_DWORD *)(a1 + 4128) = a3 + 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 4120) + 4 * a3) = *(_DWORD *)(a1 + 20);
      v17 = *(_DWORD *)(a1 + 20);
    }
    result = 0;
    *(_DWORD *)(a1 + 20) = v6 + v17 + 9;
    return result;
  }
  result = 4294966275;
LABEL_5:
  *(_DWORD *)a1 |= 0x10000u;
  return result;
}

size_t write_uint32(uint64_t a1, int a2)
{
  int __ptr;

  __ptr = a2;
  return fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
}

uint64_t cqdb_writer_close(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char *v15;
  _DWORD *v16;
  int v17;
  char *v18;
  int v19;
  int *v20;
  int v21;
  unint64_t v22;
  FILE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  int v29;
  FILE *v30;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int __ptr;

  if ((*(_BYTE *)(a1 + 2) & 1) == 0)
  {
    v2 = 0;
    v33 = 0;
    v32 = 1111773507;
    v3 = *(_DWORD *)(a1 + 4128);
    v34 = 1648644977;
    v35 = v3;
    v36 = 0;
    do
    {
      v4 = a1 + 16 * v2;
      v6 = *(_QWORD *)(v4 + 32);
      v5 = (_QWORD *)(v4 + 32);
      if (v6)
      {
        v7 = (2 * *((_DWORD *)v5 - 2));
        v8 = (int *)malloc_type_calloc((int)v7, 8uLL, 0x100004000313F17uLL);
        if (!v8)
        {
          v24 = 4294966274;
          goto LABEL_28;
        }
        v9 = v8;
        v10 = *((unsigned int *)v5 - 2);
        if ((_DWORD)v10)
        {
          v11 = 0;
          v12 = *v5;
          do
          {
            v13 = *(_DWORD *)(v12 + 8 * v11);
            v14 = (v13 >> 8) % v7;
            v15 = (char *)&v8[2 * v14];
            v17 = *((_DWORD *)v15 + 1);
            v16 = v15 + 4;
            if (v17)
            {
              do
              {
                LODWORD(v14) = ((int)v14 + 1) % (int)v7;
                v18 = (char *)&v8[2 * (int)v14];
                v19 = *((_DWORD *)v18 + 1);
                v16 = v18 + 4;
              }
              while (v19);
              v14 = (int)v14;
            }
            v8[2 * v14] = v13;
            *v16 = *(_DWORD *)(v12 + 8 * v11++ + 4);
          }
          while (v11 != v10);
        }
        if ((int)v7 >= 1)
        {
          v20 = v8 + 1;
          do
          {
            __ptr = *(v20 - 1);
            fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
            v21 = *v20;
            v20 += 2;
            __ptr = v21;
            fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
            --v7;
          }
          while (v7);
        }
        free(v9);
      }
      ++v2;
    }
    while (v2 != 256);
    if ((*(_BYTE *)a1 & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 4132))
      {
        v36 = MEMORY[0x20BD069EC](*(_QWORD *)(a1 + 8)) - *(_DWORD *)(a1 + 16);
        if (*(_DWORD *)(a1 + 4128))
        {
          v22 = 0;
          do
          {
            __ptr = *(_DWORD *)(*(_QWORD *)(a1 + 4120) + 4 * v22);
            fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
            ++v22;
          }
          while (v22 < *(unsigned int *)(a1 + 4128));
        }
      }
    }
    v23 = *(FILE **)(a1 + 8);
    if (ferror(v23))
    {
LABEL_22:
      v24 = 4294966275;
LABEL_28:
      fseek(*(FILE **)(a1 + 8), *(unsigned int *)(a1 + 16), 0);
      cqdb_writer_delete((void **)a1);
      return v24;
    }
    v25 = MEMORY[0x20BD069EC](v23);
    if (v25 == -1)
    {
      v24 = 4294966276;
      goto LABEL_28;
    }
    v26 = v25;
    v27 = *(unsigned int *)(a1 + 16);
    LODWORD(v33) = v25 - v27;
    if (fseek(*(FILE **)(a1 + 8), v27, 0))
      goto LABEL_26;
    fwrite(&v32, 4uLL, 1uLL, *(FILE **)(a1 + 8));
    write_uint32(a1, v33);
    write_uint32(a1, SHIDWORD(v33));
    write_uint32(a1, v34);
    write_uint32(a1, v35);
    write_uint32(a1, v36);
    for (i = 24; i != 4120; i += 16)
    {
      v29 = *(_DWORD *)(a1 + i);
      if (v29)
        v29 = *(_DWORD *)(a1 + 20);
      __ptr = v29;
      fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
      __ptr = 2 * *(_DWORD *)(a1 + i);
      fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
      *(_DWORD *)(a1 + 20) += 16 * *(_DWORD *)(a1 + i);
    }
    v30 = *(FILE **)(a1 + 8);
    if (ferror(v30))
      goto LABEL_22;
    if (fseek(v30, v26, 0))
    {
LABEL_26:
      v24 = 4294966277;
      goto LABEL_28;
    }
  }
  cqdb_writer_delete((void **)a1);
  return 0;
}

void cqdb_writer_delete(void **a1)
{
  uint64_t i;

  for (i = 4; i != 516; i += 2)
    free(a1[i]);
  free(a1[515]);
  free(a1);
}

_QWORD *cqdb_reader(uint64_t a1, unint64_t a2)
{
  void *v4;
  _QWORD *v5;
  unint64_t v6;
  int v7;
  size_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _DWORD *v16;
  _DWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  int *v24;
  _DWORD *v25;
  int v26;

  if (a2 < 0x818 || *(_DWORD *)a1 != 1111773507)
    return 0;
  v4 = malloc_type_calloc(1uLL, 0x1038uLL, 0x103004030E487C9uLL);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4 = a1;
    *((_QWORD *)v4 + 1) = a2;
    strncpy((char *)v4 + 16, (const char *)a1, 4uLL);
    v6 = *(unsigned int *)(a1 + 4);
    *((_DWORD *)v5 + 5) = v6;
    *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    *((_DWORD *)v5 + 7) = v7;
    *((_DWORD *)v5 + 8) = *(_DWORD *)(a1 + 16);
    *((_DWORD *)v5 + 9) = *(_DWORD *)(a1 + 20);
    if (v7 != 1648644977 || v6 > a2)
    {
      free(v5);
      return 0;
    }
    LODWORD(v9) = 0;
    v10 = 0;
    *((_DWORD *)v5 + 1036) = 0;
    v11 = (unsigned int *)(a1 + 24);
    do
    {
      v13 = *v11;
      v12 = v11[1];
      if ((_DWORD)v13)
      {
        v14 = *v5;
        v15 = (char *)malloc_type_calloc(v11[1], 8uLL, 0x100004000313F17uLL);
        if ((_DWORD)v12)
        {
          v16 = (_DWORD *)(v14 + v13);
          v17 = v15 + 4;
          v18 = v12;
          do
          {
            *(v17 - 1) = *v16;
            *v17 = v16[1];
            v17 += 2;
            v16 += 2;
            --v18;
          }
          while (v18);
        }
        v19 = &v5[2 * v10];
        v19[6] = v15;
        *((_DWORD *)v19 + 10) = v12;
        LODWORD(v9) = *((_DWORD *)v5 + 1036);
      }
      else
      {
        v20 = &v5[2 * v10];
        v20[6] = 0;
        *((_DWORD *)v20 + 10) = 0;
      }
      v11 += 2;
      v9 = v9 + (v12 >> 1);
      *((_DWORD *)v5 + 1036) = v9;
      ++v10;
    }
    while (v10 != 256);
    v21 = *((unsigned int *)v5 + 9);
    if ((_DWORD)v21)
    {
      v22 = *v5;
      v23 = malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
      if ((_DWORD)v9)
      {
        v24 = (int *)(v22 + v21);
        v25 = v23;
        do
        {
          v26 = *v24++;
          *v25++ = v26;
          --v9;
        }
        while (v9);
      }
      v5[517] = v23;
    }
    else
    {
      v5[517] = 0;
    }
  }
  return v5;
}

void cqdb_delete(void **a1)
{
  uint64_t i;

  if (a1)
  {
    for (i = 6; i != 518; i += 2)
      free(a1[i]);
    free(a1[517]);
    free(a1);
  }
}

uint64_t cqdb_to_id(_QWORD *a1, char *__s)
{
  size_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;

  v4 = strlen(__s);
  v5 = hashlittle((unsigned __int8 *)__s, v4 + 1, 0);
  v6 = a1[2 * v5 + 5];
  if (!v6)
    return 4294966273;
  v7 = a1[2 * v5 + 6];
  if (!v7)
    return 4294966273;
  v8 = v5;
  v9 = (v5 >> 8) % v6;
  v10 = *(unsigned int *)(v7 + 8 * v9 + 4);
  if (!(_DWORD)v10)
    return 4294966273;
  v11 = (v5 >> 8) % v6;
  while (1)
  {
    if (*(_DWORD *)(v7 + 8 * v9) == v8)
    {
      v12 = (const char *)(*a1 + v10);
      if (!strcmp(__s, v12 + 8))
        break;
    }
    v11 = (v11 + 1) % v6;
    v9 = v11;
    v10 = *(unsigned int *)(v7 + 8 * v11 + 4);
    if (!(_DWORD)v10)
      return 4294966273;
  }
  return *(unsigned int *)v12;
}

uint64_t cqdb_to_string(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 4136);
  if (v2 && *(_DWORD *)(a1 + 32) > a2 && (v3 = *(unsigned int *)(v2 + 4 * (int)a2), (_DWORD)v3))
    return *(_QWORD *)a1 + v3 + 8;
  else
    return 0;
}

uint64_t cqdb_num(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4144);
}

uint64_t hashword(_DWORD *a1, unint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;

  v3 = (a3 + 4 * a2 - 559038737);
  if (a2 < 4)
  {
    v5 = a3 + 4 * a2 - 559038737;
    v4 = v5;
  }
  else
  {
    v4 = a3 + 4 * a2 - 559038737;
    v5 = v4;
    do
    {
      v6 = a1[1] + v4;
      v7 = a1[2] + v3;
      v8 = (*a1 + v5 - v7) ^ __ROR4__(v7, 28);
      v9 = v7 + v6;
      v10 = (v6 - v8) ^ __ROR4__(v8, 26);
      v11 = v8 + v9;
      v12 = (v9 - v10) ^ __ROR4__(v10, 24);
      v13 = v10 + v11;
      v14 = (v11 - v12) ^ __ROR4__(v12, 16);
      v15 = v12 + v13;
      v16 = (v13 - v14) ^ __ROR4__(v14, 13);
      v5 = v14 + v15;
      v3 = (v15 - v16) ^ __ROR4__(v16, 28);
      v4 = v16 + v5;
      a2 -= 3;
      a1 += 3;
    }
    while (a2 > 3);
  }
  switch(a2)
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
LABEL_10:
      v4 += a1[1];
LABEL_11:
      HIDWORD(v17) = v4;
      LODWORD(v17) = v4;
      v18 = (v3 ^ v4) - (v17 >> 18);
      HIDWORD(v17) = v18;
      LODWORD(v17) = v18;
      v19 = ((*a1 + v5) ^ v18) - (v17 >> 21);
      HIDWORD(v17) = v19;
      LODWORD(v17) = v19;
      v20 = (v19 ^ v4) - (v17 >> 7);
      HIDWORD(v17) = v20;
      LODWORD(v17) = v20;
      v21 = (v20 ^ v18) - (v17 >> 16);
      HIDWORD(v17) = v21;
      LODWORD(v17) = v21;
      HIDWORD(v17) = (v21 ^ v19) - (v17 >> 28);
      LODWORD(v17) = HIDWORD(v17);
      HIDWORD(v17) = (HIDWORD(v17) ^ v20) - (v17 >> 18);
      LODWORD(v17) = HIDWORD(v17);
      return (HIDWORD(v17) ^ v21) - (v17 >> 8);
    case 3uLL:
      LODWORD(v3) = a1[2] + v3;
      goto LABEL_10;
  }
  return v3;
}

_DWORD *hashword2(_DWORD *result, unint64_t a2, int *a3, _DWORD *a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;

  v4 = *a3 + 4 * a2 - 559038737;
  v5 = v4 + *a4;
  v6 = v4;
  if (a2 >= 4)
  {
    do
    {
      v7 = result[1] + v4;
      v8 = result[2] + v5;
      v9 = (*result + v6 - v8) ^ __ROR4__(v8, 28);
      v10 = v8 + v7;
      v11 = (v7 - v9) ^ __ROR4__(v9, 26);
      v12 = v9 + v10;
      v13 = (v10 - v11) ^ __ROR4__(v11, 24);
      v14 = v11 + v12;
      v15 = (v12 - v13) ^ __ROR4__(v13, 16);
      v16 = v13 + v14;
      v17 = (v14 - v15) ^ __ROR4__(v15, 13);
      v6 = v15 + v16;
      v5 = (v16 - v17) ^ __ROR4__(v17, 28);
      v4 = v17 + v6;
      a2 -= 3;
      result += 3;
    }
    while (a2 > 3);
  }
  switch(a2)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
LABEL_7:
      v4 += result[1];
LABEL_8:
      HIDWORD(v18) = v4;
      LODWORD(v18) = v4;
      v19 = (v5 ^ v4) - (v18 >> 18);
      HIDWORD(v18) = v19;
      LODWORD(v18) = v19;
      v20 = ((*result + v6) ^ v19) - (v18 >> 21);
      HIDWORD(v18) = v20;
      LODWORD(v18) = v20;
      v21 = (v20 ^ v4) - (v18 >> 7);
      HIDWORD(v18) = v21;
      LODWORD(v18) = v21;
      v22 = (v21 ^ v19) - (v18 >> 16);
      HIDWORD(v18) = v22;
      LODWORD(v18) = v22;
      HIDWORD(v18) = (v22 ^ v20) - (v18 >> 28);
      LODWORD(v18) = HIDWORD(v18);
      v4 = (HIDWORD(v18) ^ v21) - (v18 >> 18);
      HIDWORD(v18) = v4;
      LODWORD(v18) = v4;
      v5 = (v4 ^ v22) - (v18 >> 8);
      break;
    case 3uLL:
      v5 += result[2];
      goto LABEL_7;
  }
  *a3 = v5;
  *a4 = v4;
  return result;
}

uint64_t hashlittle(unsigned __int8 *a1, unint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;

  v3 = (a2 + a3 - 559038737);
  if (a2 < 0xD)
  {
    v5 = a2 + a3 - 559038737;
    v4 = v5;
  }
  else
  {
    v4 = a2 + a3 - 559038737;
    v5 = v4;
    do
    {
      v6 = v4 + a1[4] + (a1[5] << 8) + (a1[6] << 16) + (a1[7] << 24);
      v7 = v3 + a1[8] + (a1[9] << 8) + (a1[10] << 16) + (a1[11] << 24);
      v8 = (v5 + *a1 + (a1[1] << 8) + (a1[2] << 16) + (a1[3] << 24) - v7) ^ __ROR4__(v7, 28);
      v9 = v7 + v6;
      v10 = (v6 - v8) ^ __ROR4__(v8, 26);
      v11 = v8 + v9;
      v12 = (v9 - v10) ^ __ROR4__(v10, 24);
      v13 = v10 + v11;
      v14 = (v11 - v12) ^ __ROR4__(v12, 16);
      v15 = v12 + v13;
      v16 = (v13 - v14) ^ __ROR4__(v14, 13);
      v5 = v14 + v15;
      v3 = (v15 - v16) ^ __ROR4__(v16, 28);
      v4 = v16 + v5;
      a2 -= 12;
      a1 += 12;
    }
    while (a2 > 0xC);
  }
  switch(a2)
  {
    case 0uLL:
      return v3;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
      goto LABEL_17;
    case 3uLL:
      goto LABEL_16;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      goto LABEL_14;
    case 6uLL:
      goto LABEL_13;
    case 7uLL:
      goto LABEL_12;
    case 8uLL:
      goto LABEL_11;
    case 9uLL:
      goto LABEL_10;
    case 0xAuLL:
      goto LABEL_9;
    case 0xBuLL:
      goto LABEL_8;
    case 0xCuLL:
      LODWORD(v3) = v3 + (a1[11] << 24);
LABEL_8:
      LODWORD(v3) = v3 + (a1[10] << 16);
LABEL_9:
      LODWORD(v3) = v3 + (a1[9] << 8);
LABEL_10:
      LODWORD(v3) = v3 + a1[8];
LABEL_11:
      v4 += a1[7] << 24;
LABEL_12:
      v4 += a1[6] << 16;
LABEL_13:
      v4 += a1[5] << 8;
LABEL_14:
      v4 += a1[4];
LABEL_15:
      v5 += a1[3] << 24;
LABEL_16:
      v5 += a1[2] << 16;
LABEL_17:
      v5 += a1[1] << 8;
LABEL_18:
      v5 += *a1;
      break;
    default:
      break;
  }
  HIDWORD(v17) = v4;
  LODWORD(v17) = v4;
  v18 = (v3 ^ v4) - (v17 >> 18);
  HIDWORD(v17) = v18;
  LODWORD(v17) = v18;
  v19 = (v18 ^ v5) - (v17 >> 21);
  HIDWORD(v17) = v19;
  LODWORD(v17) = v19;
  v20 = (v19 ^ v4) - (v17 >> 7);
  HIDWORD(v17) = v20;
  LODWORD(v17) = v20;
  v21 = (v20 ^ v18) - (v17 >> 16);
  HIDWORD(v17) = v21;
  LODWORD(v17) = v21;
  HIDWORD(v17) = (v21 ^ v19) - (v17 >> 28);
  LODWORD(v17) = HIDWORD(v17);
  HIDWORD(v17) = (HIDWORD(v17) ^ v20) - (v17 >> 18);
  LODWORD(v17) = HIDWORD(v17);
  return (HIDWORD(v17) ^ v21) - (v17 >> 8);
}

unsigned __int8 *hashlittle2(unsigned __int8 *result, unint64_t a2, int *a3, _DWORD *a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;

  v4 = a2 - 559038737 + *a3;
  v5 = v4 + *a4;
  v6 = v4;
  if (a2 >= 0xD)
  {
    do
    {
      v7 = v4 + result[4] + (result[5] << 8) + (result[6] << 16) + (result[7] << 24);
      v8 = v5 + result[8] + (result[9] << 8) + (result[10] << 16) + (result[11] << 24);
      v9 = (v6 + *result + (result[1] << 8) + (result[2] << 16) + (result[3] << 24) - v8) ^ __ROR4__(v8, 28);
      v10 = v8 + v7;
      v11 = (v7 - v9) ^ __ROR4__(v9, 26);
      v12 = v9 + v10;
      v13 = (v10 - v11) ^ __ROR4__(v11, 24);
      v14 = v11 + v12;
      v15 = (v12 - v13) ^ __ROR4__(v13, 16);
      v16 = v13 + v14;
      v17 = (v14 - v15) ^ __ROR4__(v15, 13);
      v6 = v15 + v16;
      v5 = (v16 - v17) ^ __ROR4__(v17, 28);
      v4 = v17 + v6;
      a2 -= 12;
      result += 12;
    }
    while (a2 > 0xC);
  }
  switch(a2)
  {
    case 0uLL:
      goto LABEL_17;
    case 1uLL:
      goto LABEL_15;
    case 2uLL:
      goto LABEL_14;
    case 3uLL:
      goto LABEL_13;
    case 4uLL:
      goto LABEL_12;
    case 5uLL:
      goto LABEL_11;
    case 6uLL:
      goto LABEL_10;
    case 7uLL:
      goto LABEL_9;
    case 8uLL:
      goto LABEL_8;
    case 9uLL:
      goto LABEL_7;
    case 0xAuLL:
      goto LABEL_6;
    case 0xBuLL:
      goto LABEL_5;
    case 0xCuLL:
      v5 += result[11] << 24;
LABEL_5:
      v5 += result[10] << 16;
LABEL_6:
      v5 += result[9] << 8;
LABEL_7:
      v5 += result[8];
LABEL_8:
      v4 += result[7] << 24;
LABEL_9:
      v4 += result[6] << 16;
LABEL_10:
      v4 += result[5] << 8;
LABEL_11:
      v4 += result[4];
LABEL_12:
      v6 += result[3] << 24;
LABEL_13:
      v6 += result[2] << 16;
LABEL_14:
      v6 += result[1] << 8;
LABEL_15:
      v6 += *result;
      break;
    default:
      break;
  }
  HIDWORD(v18) = v4;
  LODWORD(v18) = v4;
  v19 = (v5 ^ v4) - (v18 >> 18);
  HIDWORD(v18) = v19;
  LODWORD(v18) = v19;
  v20 = (v19 ^ v6) - (v18 >> 21);
  HIDWORD(v18) = v20;
  LODWORD(v18) = v20;
  v21 = (v20 ^ v4) - (v18 >> 7);
  HIDWORD(v18) = v21;
  LODWORD(v18) = v21;
  v22 = (v21 ^ v19) - (v18 >> 16);
  HIDWORD(v18) = v22;
  LODWORD(v18) = v22;
  HIDWORD(v18) = (v22 ^ v20) - (v18 >> 28);
  LODWORD(v18) = HIDWORD(v18);
  v4 = (HIDWORD(v18) ^ v21) - (v18 >> 18);
  HIDWORD(v18) = v4;
  LODWORD(v18) = v4;
  v5 = (v4 ^ v22) - (v18 >> 8);
LABEL_17:
  *a3 = v5;
  *a4 = v4;
  return result;
}

uint64_t hashbig(unsigned __int8 *a1, unint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;

  v3 = (a2 + a3 - 559038737);
  if (a2 < 0xD)
  {
    v5 = a2 + a3 - 559038737;
    v4 = v5;
  }
  else
  {
    v4 = a2 + a3 - 559038737;
    v5 = v4;
    do
    {
      v6 = v4 + (a1[4] << 24) + (a1[5] << 16) + (a1[6] << 8) + a1[7];
      v7 = v3 + (a1[8] << 24) + (a1[9] << 16) + (a1[10] << 8) + a1[11];
      v8 = (v5 + (*a1 << 24) + (a1[1] << 16) + (a1[2] << 8) + a1[3] - v7) ^ __ROR4__(v7, 28);
      v9 = v7 + v6;
      v10 = (v6 - v8) ^ __ROR4__(v8, 26);
      v11 = v8 + v9;
      v12 = (v9 - v10) ^ __ROR4__(v10, 24);
      v13 = v10 + v11;
      v14 = (v11 - v12) ^ __ROR4__(v12, 16);
      v15 = v12 + v13;
      v16 = (v13 - v14) ^ __ROR4__(v14, 13);
      v5 = v14 + v15;
      v3 = (v15 - v16) ^ __ROR4__(v16, 28);
      v4 = v16 + v5;
      a2 -= 12;
      a1 += 12;
    }
    while (a2 > 0xC);
  }
  switch(a2)
  {
    case 0uLL:
      return v3;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
      goto LABEL_17;
    case 3uLL:
      goto LABEL_16;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      goto LABEL_14;
    case 6uLL:
      goto LABEL_13;
    case 7uLL:
      goto LABEL_12;
    case 8uLL:
      goto LABEL_11;
    case 9uLL:
      goto LABEL_10;
    case 0xAuLL:
      goto LABEL_9;
    case 0xBuLL:
      goto LABEL_8;
    case 0xCuLL:
      LODWORD(v3) = v3 + a1[11];
LABEL_8:
      LODWORD(v3) = v3 + (a1[10] << 8);
LABEL_9:
      LODWORD(v3) = v3 + (a1[9] << 16);
LABEL_10:
      LODWORD(v3) = v3 + (a1[8] << 24);
LABEL_11:
      v4 += a1[7];
LABEL_12:
      v4 += a1[6] << 8;
LABEL_13:
      v4 += a1[5] << 16;
LABEL_14:
      v4 += a1[4] << 24;
LABEL_15:
      v5 += a1[3];
LABEL_16:
      v5 += a1[2] << 8;
LABEL_17:
      v5 += a1[1] << 16;
LABEL_18:
      v5 += *a1 << 24;
      break;
    default:
      break;
  }
  HIDWORD(v17) = v4;
  LODWORD(v17) = v4;
  v18 = (v3 ^ v4) - (v17 >> 18);
  HIDWORD(v17) = v18;
  LODWORD(v17) = v18;
  v19 = (v18 ^ v5) - (v17 >> 21);
  HIDWORD(v17) = v19;
  LODWORD(v17) = v19;
  v20 = (v19 ^ v4) - (v17 >> 7);
  HIDWORD(v17) = v20;
  LODWORD(v17) = v20;
  v21 = (v20 ^ v18) - (v17 >> 16);
  HIDWORD(v17) = v21;
  LODWORD(v17) = v21;
  HIDWORD(v17) = (v21 ^ v19) - (v17 >> 28);
  LODWORD(v17) = HIDWORD(v17);
  HIDWORD(v17) = (HIDWORD(v17) ^ v20) - (v17 >> 18);
  LODWORD(v17) = HIDWORD(v17);
  return (HIDWORD(v17) ^ v21) - (v17 >> 8);
}

uint64_t crf1dc_new(int a1, int a2, int a3)
{
  _DWORD *v6;
  uint64_t v7;
  size_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *memptr;

  v6 = malloc_type_calloc(1uLL, 0x70uLL, 0x109004037870131uLL);
  v7 = (uint64_t)v6;
  if (v6)
  {
    *v6 = a1;
    v6[1] = a2;
    v8 = (a2 * a2);
    v9 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
    *(_QWORD *)(v7 + 32) = v9;
    if (!v9)
      goto LABEL_9;
    if ((*(_BYTE *)v7 & 2) != 0)
    {
      memptr = 0;
      v10 = malloc_type_posix_memalign(&memptr, 0x10uLL, 8 * (v8 + 4), 0xF3D5F88CuLL);
      v11 = memptr;
      if (v10)
        v11 = 0;
      *(_QWORD *)(v7 + 88) = v11;
      if (!v11)
        goto LABEL_9;
      v12 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
      *(_QWORD *)(v7 + 104) = v12;
      if (!v12)
        goto LABEL_9;
    }
    if (!crf1dc_set_num_items(v7, a3))
    {
      *(_DWORD *)(v7 + 8) = 0;
    }
    else
    {
LABEL_9:
      crf1dc_delete((void **)v7);
      return 0;
    }
  }
  return v7;
}

uint64_t crf1dc_set_num_items(uint64_t a1, int a2)
{
  size_t v2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t result;
  void *memptr;

  v2 = *(int *)(a1 + 4);
  *(_DWORD *)(a1 + 8) = a2;
  if (*(_DWORD *)(a1 + 12) >= a2)
    return 0;
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 40));
  v5 = malloc_type_calloc((int)v2 * (uint64_t)a2, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 40) = v5;
  if (!v5)
    return 2147483649;
  v6 = malloc_type_calloc((int)v2 * (uint64_t)a2, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 48) = v6;
  if (!v6)
    return 2147483649;
  v7 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 56) = v7;
  if (!v7)
    return 2147483649;
  v8 = malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 64) = v8;
  if (!v8)
    return 2147483649;
  if ((*(_BYTE *)a1 & 1) != 0)
  {
    v9 = malloc_type_calloc((int)v2 * (uint64_t)a2, 4uLL, 0x100004052888210uLL);
    *(_QWORD *)(a1 + 72) = v9;
    if (!v9)
      return 2147483649;
  }
  v10 = malloc_type_calloc((int)v2 * (uint64_t)a2, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 24) = v10;
  if (!v10)
    return 2147483649;
  if ((*(_BYTE *)a1 & 2) != 0)
  {
    memptr = 0;
    v11 = malloc_type_posix_memalign(&memptr, 0x10uLL, 8 * ((int)v2 * a2 + 4), 0xF3D5F88CuLL);
    v12 = memptr;
    if (v11)
      v12 = 0;
    *(_QWORD *)(a1 + 80) = v12;
    if (!v12)
      return 2147483649;
    v13 = malloc_type_calloc((int)v2 * (uint64_t)a2, 8uLL, 0x100004000313F17uLL);
    *(_QWORD *)(a1 + 96) = v13;
    if (!v13)
      return 2147483649;
  }
  result = 0;
  *(_DWORD *)(a1 + 12) = a2;
  return result;
}

void crf1dc_delete(void **a1)
{
  if (a1)
  {
    free(a1[9]);
    free(a1[12]);
    free(a1[10]);
    free(a1[3]);
    free(a1[7]);
    free(a1[8]);
    free(a1[6]);
    free(a1[5]);
    free(a1[13]);
    free(a1[11]);
    free(a1[4]);
  }
  free(a1);
}

void crf1dc_reset(uint64_t a1, char a2)
{
  int v4;
  int v5;

  v4 = *(_DWORD *)(a1 + 4);
  v5 = *(_DWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
    bzero(*(void **)(a1 + 24), 8 * v4 * v5);
  if ((a2 & 2) != 0)
    bzero(*(void **)(a1 + 32), 8 * (v4 * v4));
  if ((*(_BYTE *)a1 & 2) != 0)
  {
    bzero(*(void **)(a1 + 96), 8 * v4 * v5);
    bzero(*(void **)(a1 + 104), 8 * (v4 * v4));
    *(_QWORD *)(a1 + 16) = 0;
  }
}

void crf1dc_exp_state(uint64_t a1)
{
  uint64_t v2;
  long double *v3;

  v2 = (*(_DWORD *)(a1 + 4) * *(_DWORD *)(a1 + 8));
  memcpy(*(void **)(a1 + 80), *(const void **)(a1 + 24), 8 * (int)v2);
  if ((int)v2 >= 1)
  {
    v3 = *(long double **)(a1 + 80);
    do
    {
      *v3 = exp(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
}

void crf1dc_exp_transition(uint64_t a1)
{
  int v2;
  uint64_t v3;
  long double *v4;

  v2 = *(_DWORD *)(a1 + 4);
  v3 = (v2 * v2);
  memcpy(*(void **)(a1 + 88), *(const void **)(a1 + 32), 8 * v3);
  if (v2)
  {
    v4 = *(long double **)(a1 + 88);
    do
    {
      *v4 = exp(*v4);
      ++v4;
      --v3;
    }
    while (v3);
  }
}

double crf1dc_alpha_score(uint64_t a1)
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  double v7;
  double *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  double v22;
  double *v23;
  double *v24;
  uint64_t v25;
  double v26;
  double *v27;
  double *v28;
  uint64_t v29;
  double v30;
  double v31;
  double *v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  double *v37;
  double v38;
  long double v39;
  double result;
  uint64_t v41;

  v2 = *(double **)(a1 + 56);
  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(int *)(a1 + 4);
  v5 = *(unsigned int *)(a1 + 4);
  v6 = *(double **)(a1 + 40);
  v41 = 8 * v4;
  memcpy(v6, *(const void **)(a1 + 80), 8 * v4);
  if ((int)v4 <= 0)
  {
    *v2 = 1.0;
  }
  else
  {
    v7 = 0.0;
    v8 = v6;
    v9 = v5;
    do
    {
      v10 = *v8++;
      v7 = v7 + v10;
      --v9;
    }
    while (v9);
    if (v7 == 0.0)
      v11 = 1.0;
    else
      v11 = 1.0 / v7;
    *v2 = v11;
    v12 = v5;
    do
    {
      *v6 = v11 * *v6;
      ++v6;
      --v12;
    }
    while (v12);
  }
  if ((int)v3 > 1)
  {
    v13 = 1;
    do
    {
      ++v2;
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_DWORD *)(a1 + 4);
      v16 = v15 * v13;
      v17 = (double *)(v14 + 8 * v15 * v13);
      v18 = *(_QWORD *)(a1 + 80);
      bzero(v17, v41);
      if ((int)v5 < 1)
      {
        *v2 = 1.0;
      }
      else
      {
        v19 = 0;
        v20 = *(double **)(a1 + 88);
        v21 = 8 * *(int *)(a1 + 4);
        do
        {
          v22 = *(double *)(v14 + 8 * v15 * (v13 - 1) + 8 * v19);
          v23 = v20;
          v24 = (double *)(v14 + 8 * v16);
          v25 = v5;
          do
          {
            v26 = *v23++;
            *v24 = *v24 + v22 * v26;
            ++v24;
            --v25;
          }
          while (v25);
          ++v19;
          v20 = (double *)((char *)v20 + v21);
        }
        while (v19 != v5);
        v27 = (double *)(v18 + 8 * v16);
        v28 = (double *)(v14 + 8 * v16);
        v29 = v5;
        do
        {
          v30 = *v27++;
          *v28 = v30 * *v28;
          ++v28;
          --v29;
        }
        while (v29);
        v31 = 0.0;
        v32 = (double *)(v14 + 8 * v16);
        v33 = v5;
        do
        {
          v34 = *v32++;
          v31 = v31 + v34;
          --v33;
        }
        while (v33);
        if (v31 == 0.0)
          v35 = 1.0;
        else
          v35 = 1.0 / v31;
        *v2 = v35;
        v36 = v5;
        do
        {
          *v17 = v35 * *v17;
          ++v17;
          --v36;
        }
        while (v36);
      }
      ++v13;
    }
    while (v13 != (_DWORD)v3);
  }
  if ((int)v3 < 1)
  {
    v38 = 0.0;
  }
  else
  {
    v37 = *(double **)(a1 + 56);
    v38 = 0.0;
    do
    {
      v39 = *v37++;
      v38 = v38 + log(v39);
      --v3;
    }
    while (v3);
  }
  result = -v38;
  *(double *)(a1 + 16) = -v38;
  return result;
}

unsigned int *crf1dc_beta_score(unsigned int *result)
{
  unsigned int *v1;
  int v2;
  uint64_t v3;
  void *v4;
  int v5;
  double *v6;
  double *v7;
  double v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  double v22;
  double *v23;
  double *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v32;

  v1 = result;
  v2 = result[2];
  v3 = result[1];
  v4 = (void *)*((_QWORD *)result + 8);
  v5 = v2 - 1;
  v6 = (double *)(*((_QWORD *)result + 7) + 8 * (v2 - 1));
  v32 = (int)result[1];
  if ((int)v32 >= 1)
  {
    v7 = (double *)(*((_QWORD *)result + 6) + 8 * (int)v32 * v5);
    v8 = *v6;
    v9 = result[1];
    do
    {
      *v7++ = v8;
      --v9;
    }
    while (v9);
  }
  if (v2 > 1)
  {
    v10 = v2 - 2;
    do
    {
      --v6;
      v11 = *((_QWORD *)v1 + 6);
      v12 = v1[1];
      v13 = *((_QWORD *)v1 + 10);
      result = (unsigned int *)memcpy(v4, (const void *)(v11 + 8 * (int)(v12 + v12 * v10)), 8 * v32);
      if ((int)v3 >= 1)
      {
        v14 = (double *)(v11 + 8 * (int)(v12 * v10));
        v15 = (double *)(v13 + 8 * (int)(v12 * v5));
        v16 = (double *)v4;
        v17 = v3;
        do
        {
          v18 = *v15++;
          *v16 = v18 * *v16;
          ++v16;
          --v17;
        }
        while (v17);
        if ((int)v32 >= 1)
        {
          v19 = 0;
          v20 = (double *)*((_QWORD *)v1 + 11);
          v21 = 8 * (int)v1[1];
          do
          {
            v22 = 0.0;
            v23 = v20;
            v24 = (double *)v4;
            v25 = v3;
            do
            {
              v26 = *v23++;
              v27 = v26;
              v28 = *v24++;
              v22 = v22 + v27 * v28;
              --v25;
            }
            while (v25);
            v14[v19++] = v22;
            v20 = (double *)((char *)v20 + v21);
          }
          while (v19 != v3);
          v29 = *v6;
          v30 = v3;
          do
          {
            *v14 = v29 * *v14;
            ++v14;
            --v30;
          }
          while (v30);
        }
      }
      --v5;
    }
    while (v10-- > 0);
  }
  return result;
}

unsigned int *crf1dc_marginals(unsigned int *result)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  double *v7;
  double *v8;
  double *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double *v20;
  double *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double *v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  double *v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  int v36;

  v1 = result[2];
  if ((int)v1 >= 1)
  {
    v2 = result;
    v3 = 0;
    v4 = result[1];
    do
    {
      v5 = v2[1] * v3;
      v6 = *((_QWORD *)v2 + 6);
      v7 = (double *)(*((_QWORD *)v2 + 12) + 8 * v5);
      result = (unsigned int *)memcpy(v7, (const void *)(*((_QWORD *)v2 + 5) + 8 * v5), 8 * (int)v4);
      if ((int)v4 >= 1)
      {
        v8 = (double *)(v6 + 8 * v5);
        v9 = v7;
        v10 = v4;
        do
        {
          v11 = *v8++;
          *v9 = v11 * *v9;
          ++v9;
          --v10;
        }
        while (v10);
        v12 = 1.0 / *(double *)(*((_QWORD *)v2 + 7) + 8 * v3);
        v13 = v4;
        do
        {
          *v7 = v12 * *v7;
          ++v7;
          --v13;
        }
        while (v13);
      }
      ++v3;
    }
    while (v3 != v1);
    if ((int)v1 >= 2)
    {
      v14 = 0;
      v36 = v1 - 2;
      v15 = 1;
      do
      {
        v16 = v2[1];
        v17 = *((_QWORD *)v2 + 10);
        v18 = *((_QWORD *)v2 + 5);
        v19 = (void *)*((_QWORD *)v2 + 8);
        result = (unsigned int *)memcpy(v19, (const void *)(*((_QWORD *)v2 + 6) + 8 * (int)(v16 * (v14 + 1))), 8 * (int)v4);
        if ((int)v4 >= 1)
        {
          v20 = (double *)(v17 + 8 * (int)(v16 * v15));
          v21 = (double *)v19;
          v22 = v4;
          do
          {
            v23 = *v20++;
            *v21 = v23 * *v21;
            ++v21;
            --v22;
          }
          while (v22);
          v24 = 0;
          v25 = (double *)*((_QWORD *)v2 + 11);
          v26 = (double *)*((_QWORD *)v2 + 13);
          v27 = 8 * (int)v2[1];
          do
          {
            v28 = v4;
            v29 = v25;
            v30 = (double *)v19;
            v31 = v26;
            do
            {
              v32 = *v29++;
              v33 = v32;
              v34 = *v30++;
              *v31 = *v31 + *(double *)(v18 + 8 * (int)(v16 * v14) + 8 * v24) * v33 * v34;
              ++v31;
              --v28;
            }
            while (v28);
            ++v24;
            v26 = (double *)((char *)v26 + v27);
            v25 = (double *)((char *)v25 + v27);
          }
          while (v24 != v4);
        }
        ++v15;
      }
      while (v14++ != v36);
    }
  }
  return result;
}

double crf1dc_marginal_point(uint64_t a1, int a2, int a3)
{
  return *(double *)(*(_QWORD *)(a1 + 40) + 8 * *(_DWORD *)(a1 + 4) * a3 + 8 * a2)
       * *(double *)(*(_QWORD *)(a1 + 48) + 8 * *(_DWORD *)(a1 + 4) * a3 + 8 * a2)
       / *(double *)(*(_QWORD *)(a1 + 56) + 8 * a3);
}

double crf1dc_marginal_path(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  double *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  double v14;
  double v15;

  v4 = *(int *)(a1 + 4);
  v5 = *(int *)(a2 + 4 * a3);
  v6 = *(_QWORD *)(a1 + 56);
  result = *(double *)(*(_QWORD *)(a1 + 40) + 8 * (int)v4 * a3 + 8 * v5)
         * *(double *)(*(_QWORD *)(a1 + 48) + 8 * (int)v4 * (a4 - 1) + 8 * *(int *)(a2 + 4 * (a4 - 1)))
         / *(double *)(v6 + 8 * a3);
  if (a4 - 1 > a3)
  {
    v8 = (double *)(v6 + 8 * a3);
    v9 = ~(uint64_t)a3 + a4;
    v10 = (int *)(a2 + 4 * a3 + 4);
    v11 = *(_QWORD *)(a1 + 80) + 8 * (v4 + (int)v4 * (uint64_t)a3);
    do
    {
      v12 = v5 * v4;
      v13 = *v10++;
      LODWORD(v5) = v13;
      v14 = *(double *)(*(_QWORD *)(a1 + 88) + 8 * v12 + 8 * v13) * *(double *)(v11 + 8 * v13);
      v15 = *v8++;
      result = result * (v14 * v15);
      v11 += 8 * v4;
      --v9;
    }
    while (v9);
  }
  return result;
}

double crf1dc_score(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(unsigned int *)(a1 + 8);
  v3 = *a2;
  v4 = *(_QWORD *)(a1 + 24);
  result = *(double *)(v4 + 8 * v3);
  if ((int)v2 >= 2)
  {
    v6 = *(int *)(a1 + 4);
    v7 = v4 + 8 * v6;
    v8 = a2 + 1;
    v9 = v2 - 1;
    do
    {
      v10 = *v8++;
      result = result
             + *(double *)(*(_QWORD *)(a1 + 32) + 8 * (int)v6 * (int)v3 + 8 * v10)
             + *(double *)(v7 + 8 * v10);
      v7 += 8 * v6;
      LODWORD(v3) = v10;
      --v9;
    }
    while (v9);
  }
  return result;
}

double crf1dc_lognorm(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t crf1dc_viterbi(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  v2 = *(unsigned int *)(result + 4);
  v3 = *(int *)(result + 8);
  v4 = *(_QWORD *)(result + 40);
  v5 = *(_QWORD *)(result + 24);
  if ((int)v2 >= 1)
  {
    v6 = *(unsigned int *)(result + 4);
    v7 = *(uint64_t **)(result + 24);
    v8 = *(_QWORD **)(result + 40);
    do
    {
      v9 = *v7++;
      *v8++ = v9;
      --v6;
    }
    while (v6);
  }
  v10 = v2;
  if ((int)v3 > 1)
  {
    v11 = 0;
    v12 = *(_QWORD *)(result + 72);
    v13 = 1;
    do
    {
      if ((int)v2 >= 1)
      {
        v14 = 0;
        v15 = *(_DWORD *)(result + 4);
        v16 = v4 + 8 * v15 * v13;
        v17 = v5 + 8 * v15 * v13;
        v18 = v12 + 4 * v15 * v13;
        v19 = *(_QWORD *)(result + 32);
        v20 = v4 + 8 * v15 * v11;
        do
        {
          v21 = 0;
          v22 = -1.79769313e308;
          do
          {
            v23 = *(double *)(v20 + 8 * v21) + *(double *)(v19 + 8 * v14 + 8 * *(_DWORD *)(result + 4) * (int)v21);
            if (v22 < v23)
            {
              *(_DWORD *)(v18 + 4 * v14) = v21;
              v22 = v23;
            }
            ++v21;
          }
          while (v2 != v21);
          *(double *)(v16 + 8 * v14) = v22 + *(double *)(v17 + 8 * v14);
          ++v14;
        }
        while (v14 != v2);
      }
      ++v13;
      ++v11;
    }
    while (v13 != (_DWORD)v3);
    v10 = *(_DWORD *)(result + 4);
  }
  if ((int)v2 >= 1)
  {
    v24 = 0;
    v25 = v4 + 8 * v10 * ((int)v3 - 1);
    v26 = -1.79769313e308;
    do
    {
      v27 = *(double *)(v25 + 8 * v24);
      if (v26 < v27)
      {
        *(_DWORD *)(a2 + 4 * (v3 - 1)) = v24;
        v26 = v27;
      }
      ++v24;
    }
    while (v2 != v24);
  }
  if ((int)v3 > 1)
  {
    v28 = *(_QWORD *)(result + 72);
    v29 = 4 * (v3 - 2);
    v30 = v3 - 1;
    do
    {
      *(_DWORD *)(a2 + v29) = *(_DWORD *)(v28 + 4 * *(_DWORD *)(result + 4) * v30 + 4 * *(int *)(a2 + v29 + 4));
      v29 -= 4;
      --v30;
    }
    while (v29 != -4);
  }
  return result;
}

uint64_t crf1dc_debug_context(FILE *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  double v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t i;
  double v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t j;
  long double v33;
  double v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  double v38;
  _BYTE *v39;
  uint64_t k;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  double v47;
  _BYTE *v48;
  uint64_t m;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  double v57;
  _BYTE *v58;
  uint64_t n;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t result;
  int v87[3];
  _BYTE v88[216];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v2 = crf1dc_new(2, 3, 3);
  v3 = *(_QWORD *)(v2 + 80);
  *(_OWORD *)v3 = xmmword_2084195B0;
  *(_QWORD *)(v3 + 16) = 0x3FB999999999999ALL;
  v4 = *(int *)(v2 + 4);
  v5 = v3 + 8 * v4;
  *(_QWORD *)v5 = 0x3FD999999999999ALL;
  *(_OWORD *)(v5 + 8) = xmmword_2084195C0;
  v6 = v3 + 16 * v4;
  *(_QWORD *)v6 = 0x3FD999999999999ALL;
  *(_OWORD *)(v6 + 8) = xmmword_2084195C0;
  v7 = *(_QWORD *)(v2 + 88);
  *(_OWORD *)v7 = xmmword_2084195D0;
  *(_QWORD *)(v7 + 16) = 0x3FD999999999999ALL;
  v8 = v7 + 8 * v4;
  *(_QWORD *)v8 = 0x3FE3333333333333;
  *(_OWORD *)(v8 + 8) = xmmword_2084195E0;
  v9 = v7 + 16 * v4;
  *(_QWORD *)v9 = 0x3FE0000000000000;
  *(_OWORD *)(v9 + 8) = xmmword_2084195E0;
  *(_DWORD *)(v2 + 8) = *(_DWORD *)(v2 + 12);
  crf1dc_alpha_score(v2);
  crf1dc_beta_score((unsigned int *)v2);
  v10 = 0;
  v11 = *(_QWORD *)(v2 + 80);
  v12 = *(_QWORD *)(v2 + 88);
  v13 = *(int *)(v2 + 4);
  v14 = v88;
  do
  {
    v15 = 0;
    v16 = *(double *)(v11 + 8 * v10);
    v17 = v14;
    v18 = v12;
    do
    {
      v19 = 0;
      v20 = v16 * *(double *)(v12 + 8 * v10 * v13 + 8 * v15) * *(double *)(v11 + 8 * v13 + 8 * v15);
      do
      {
        *(double *)&v17[v19] = v20 * *(double *)(v18 + v19) * *(double *)(v11 + 16 * v13 + v19);
        v19 += 8;
      }
      while (v19 != 24);
      ++v15;
      v18 += 8 * v13;
      v17 += 24;
    }
    while (v15 != 3);
    ++v10;
    v14 += 72;
  }
  while (v10 != 3);
  v21 = 0;
  v22 = 0.0;
  v23 = v88;
  do
  {
    v24 = 0;
    v25 = v23;
    do
    {
      for (i = 0; i != 24; i += 8)
        v22 = v22 + *(double *)&v25[i];
      ++v24;
      v25 += 24;
    }
    while (v24 != 3);
    ++v21;
    v23 += 72;
  }
  while (v21 != 3);
  fwrite("Check for the partition factor... ", 0x22uLL, 1uLL, a1);
  v27 = exp(*(long double *)(v2 + 16));
  check_values(a1, v27, v22);
  v28 = 0;
  v29 = v88;
  do
  {
    v30 = 0;
    v31 = v29;
    do
    {
      for (j = 0; j != 3; ++j)
      {
        v87[0] = v28;
        v87[1] = v30;
        v87[2] = j;
        v33 = crf1dc_score(v2, v87) - *(double *)(v2 + 16);
        fprintf(a1, "Check for the sequence %d-%d-%d... ", v28, v30, j);
        v34 = exp(v33);
        check_values(a1, v34, *(double *)&v31[8 * j] / v22);
      }
      ++v30;
      v31 += 24;
    }
    while (v30 != 3);
    ++v28;
    v29 += 72;
  }
  while (v28 != 3);
  v35 = 0;
  v36 = v88;
  do
  {
    v37 = 0;
    v38 = 0.0;
    v39 = v36;
    do
    {
      for (k = 0; k != 24; k += 8)
        v38 = v38 + *(double *)&v39[k];
      ++v37;
      v39 += 24;
    }
    while (v37 != 3);
    v41 = *(double *)(*(_QWORD *)(v2 + 40) + 8 * v35);
    v42 = *(double *)(*(_QWORD *)(v2 + 48) + 8 * v35);
    v43 = 1.0 / **(double **)(v2 + 56);
    fprintf(a1, "Check for the marginal probability (0,%d)... ", v35);
    check_values(a1, v41 * v42 * v43, v38 / v22);
    ++v35;
    v36 += 72;
  }
  while (v35 != 3);
  v44 = 0;
  v45 = v88;
  do
  {
    v46 = 0;
    v47 = 0.0;
    v48 = v45;
    do
    {
      for (m = 0; m != 24; m += 8)
        v47 = v47 + *(double *)&v48[m];
      ++v46;
      v48 += 72;
    }
    while (v46 != 3);
    v50 = *(int *)(v2 + 4);
    v51 = *(double *)(*(_QWORD *)(v2 + 40) + 8 * v50 + 8 * v44);
    v52 = *(double *)(*(_QWORD *)(v2 + 48) + 8 * v50 + 8 * v44);
    v53 = 1.0 / *(double *)(*(_QWORD *)(v2 + 56) + 8);
    fprintf(a1, "Check for the marginal probability (1,%d)... ", v44);
    check_values(a1, v51 * v52 * v53, v47 / v22);
    ++v44;
    v45 += 24;
  }
  while (v44 != 3);
  v54 = 0;
  v55 = v88;
  do
  {
    v56 = 0;
    v57 = 0.0;
    v58 = v55;
    do
    {
      for (n = 0; n != 72; n += 24)
        v57 = v57 + *(double *)&v58[n];
      ++v56;
      v58 += 72;
    }
    while (v56 != 3);
    v60 = *(int *)(v2 + 4);
    v61 = *(double *)(*(_QWORD *)(v2 + 40) + 16 * v60 + 8 * v54);
    v62 = *(double *)(*(_QWORD *)(v2 + 48) + 16 * v60 + 8 * v54);
    v63 = 1.0 / *(double *)(*(_QWORD *)(v2 + 56) + 16);
    fprintf(a1, "Check for the marginal probability (2,%d)... ", v54);
    check_values(a1, v61 * v62 * v63, v57 / v22);
    ++v54;
    v55 += 8;
  }
  while (v54 != 3);
  v64 = 0;
  v65 = v88;
  do
  {
    v66 = 0;
    v67 = v65;
    do
    {
      v68 = 0;
      v69 = 0.0;
      do
      {
        v69 = v69 + *(double *)&v67[v68];
        v68 += 8;
      }
      while (v68 != 24);
      v70 = *(int *)(v2 + 4);
      v71 = *(double *)(*(_QWORD *)(v2 + 40) + 8 * v64);
      v72 = *(double *)(*(_QWORD *)(v2 + 48) + 8 * v70 + 8 * v66);
      v73 = *(double *)(*(_QWORD *)(v2 + 80) + 8 * v70 + 8 * v66);
      v74 = *(double *)(*(_QWORD *)(v2 + 88) + 8 * (int)v70 * (int)v64 + 8 * v66);
      fprintf(a1, "Check for the marginal probability (0,%d)-(1,%d)... ", v64, v66);
      check_values(a1, v72 * (v73 * (v71 * v74)), v69 / v22);
      ++v66;
      v67 += 24;
    }
    while (v66 != 3);
    ++v64;
    v65 += 72;
  }
  while (v64 != 3);
  v75 = 0;
  v76 = v88;
  do
  {
    v77 = 0;
    v78 = v76;
    do
    {
      v79 = 0;
      v80 = 0.0;
      do
      {
        v80 = v80 + *(double *)&v78[v79];
        v79 += 72;
      }
      while (v79 != 216);
      v81 = *(int *)(v2 + 4);
      v82 = *(double *)(*(_QWORD *)(v2 + 40) + 8 * v81 + 8 * v75);
      v83 = *(double *)(*(_QWORD *)(v2 + 48) + 16 * v81 + 8 * v77);
      v84 = *(double *)(*(_QWORD *)(v2 + 80) + 16 * v81 + 8 * v77);
      v85 = *(double *)(*(_QWORD *)(v2 + 88) + 8 * (int)v81 * (int)v75 + 8 * v77);
      fprintf(a1, "Check for the marginal probability (1,%d)-(2,%d)... ", v75, v77);
      result = check_values(a1, v83 * (v84 * (v82 * v85)), v80 / v22);
      ++v77;
      v78 += 8;
    }
    while (v77 != 3);
    ++v75;
    v76 += 24;
  }
  while (v75 != 3);
  return result;
}

uint64_t check_values(FILE *a1, double a2, double a3)
{
  if (vabdd_f64(a2, a3) >= 0.000000001)
    return fprintf(a1, "FAIL: %f (%f)\n");
  else
    return fprintf(a1, "OK (%f)\n");
}

_QWORD *crf1d_create_encoder()
{
  _QWORD *v0;
  _OWORD *v1;

  v0 = malloc_type_calloc(1uLL, 0xA0uLL, 0x10E004068B496E0uLL);
  if (v0)
  {
    v1 = malloc_type_calloc(1uLL, 0x40uLL, 0x1020040C0EB2904uLL);
    if (v1)
    {
      v1[1] = 0u;
      v1[2] = 0u;
      *v1 = 0u;
      v0[7] = encoder_exchange_options;
      v0[8] = encoder_initialize;
      v0[17] = encoder_save_model;
      v0[18] = encoder_save_model_to_file_pointer;
      v0[9] = encoder_objective_and_gradients_batch;
      v0[10] = encoder_features_on_path;
      v0[11] = encoder_set_weights;
      v0[12] = encoder_set_instance;
      v0[13] = encoder_score;
      v0[14] = encoder_viterbi;
      v0[15] = encoder_partition_factor;
      v0[16] = encoder_objective_and_gradients;
      *v0 = v1;
      v0[19] = encoder_release;
    }
  }
  return v0;
}

uint64_t encoder_exchange_options(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v4;

  v4 = *a1;
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a2 + 96))(a2, "feature.minfreq", v4 + 48);
    (*(void (**)(uint64_t, const char *, uint64_t))(a2 + 88))(a2, "feature.possible_states", v4 + 56);
    (*(void (**)(uint64_t, const char *, uint64_t))(a2 + 88))(a2, "feature.possible_transitions", v4 + 60);
  }
  else if (a3)
  {
    (*(void (**)(uint64_t, const char *, double))(a2 + 72))(a2, "feature.minfreq", *(double *)(v4 + 48));
    (*(void (**)(uint64_t, const char *, _QWORD))(a2 + 64))(a2, "feature.possible_states", *(unsigned int *)(v4 + 56));
    (*(void (**)(uint64_t, const char *, _QWORD))(a2 + 64))(a2, "feature.possible_transitions", *(unsigned int *)(v4 + 60));
  }
  else
  {
    params_add_float((int **)a2, "feature.minfreq", "The minimum frequency of features.", 0.0);
    params_add_int((int **)a2, "feature.possible_states", 0, "Force to generate possible state features.");
    params_add_int((int **)a2, "feature.possible_transitions", 0, "Force to generate possible transition features.");
  }
  return 0;
}

uint64_t encoder_initialize(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int i;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  clock_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  clock_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t result;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v6 = *a1;
  v7 = *(_DWORD *)(a2 + 20);
  v8 = *(unsigned int *)(a2 + 24);
  v9 = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(v6 + 40) = 0;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_DWORD *)v6 = v7;
  *(_DWORD *)(v6 + 4) = v8;
  if (v9 < 1)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    for (i = 0; i != v9; ++i)
    {
      v12 = *(_DWORD *)dataset_get((_QWORD *)a2, i);
      if (v10 <= v12)
        v10 = v12;
    }
  }
  v13 = crf1dc_new(3, v7, v10);
  *(_QWORD *)(v6 + 40) = v13;
  if (!v13)
    goto LABEL_13;
  logging(a3, (uint64_t)"Feature generation\n", v14, v15, v16, v17, v18, v19, v67);
  logging(a3, (uint64_t)"type: CRF1d\n", v20, v21, v22, v23, v24, v25, v68);
  logging(a3, (uint64_t)"feature.minfreq: %f\n", v26, v27, v28, v29, v30, v31, *(_QWORD *)(v6 + 48));
  logging(a3, (uint64_t)"feature.possible_states: %d\n", v32, v33, v34, v35, v36, v37, *(unsigned int *)(v6 + 56));
  logging(a3, (uint64_t)"feature.possible_transitions: %d\n", v38, v39, v40, v41, v42, v43, *(unsigned int *)(v6 + 60));
  v44 = clock();
  v45 = crf1df_generate(v6 + 12, a2, v7, *(double *)(v6 + 48), v8, *(_DWORD *)(v6 + 56) != 0, *(_DWORD *)(v6 + 60) != 0, a3[1], *a3);
  *(_QWORD *)(v6 + 16) = v45;
  if (!v45)
    goto LABEL_13;
  logging(a3, (uint64_t)"Number of features: %d\n", v46, v47, v48, v49, v50, v51, *(unsigned int *)(v6 + 12));
  v52 = clock();
  logging(a3, (uint64_t)"Seconds required: %.3f\n", v53, v54, v55, v56, v57, v58, COERCE__INT64((double)(v52 - v44) / 1000000.0));
  logging(a3, (uint64_t)"\n", v59, v60, v61, v62, v63, v64, v69);
  crf1df_init_references((void ***)(v6 + 24), (void ***)(v6 + 32), *(_QWORD *)(v6 + 16), *(_DWORD *)(v6 + 12), v8, v7);
  if (*(_QWORD *)(v6 + 24) && *(_QWORD *)(v6 + 32))
  {
    result = 0;
  }
  else
  {
LABEL_13:
    crf1de_finish((int *)v6);
    result = 2147483649;
  }
  a1[3] = a2;
  v66 = *(_DWORD *)(*(_QWORD *)(v6 + 40) + 12);
  *((_DWORD *)a1 + 11) = *(_DWORD *)(v6 + 12);
  *((_DWORD *)a1 + 12) = v66;
  return result;
}

uint64_t encoder_objective_and_gradients_batch(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, uint64_t a5)
{
  _QWORD *v9;
  int v10;
  uint64_t v11;
  double *v12;
  double *v13;
  double v14;
  int v15;
  double v16;
  uint64_t v17;
  double v18;

  v9 = *(_QWORD **)a1;
  v10 = *(_DWORD *)(a2 + 16);
  v11 = *(unsigned int *)(*(_QWORD *)a1 + 12);
  if ((int)v11 >= 1)
  {
    v12 = (double *)(v9[2] + 16);
    v13 = (double *)a5;
    do
    {
      v14 = *v12;
      v12 += 3;
      *v13++ = -v14;
      --v11;
    }
    while (v11);
  }
  crf1dc_reset(v9[5], 2);
  crf1de_transition_score(v9, a3);
  crf1dc_exp_transition(v9[5]);
  if (v10 < 1)
  {
    v16 = 0.0;
  }
  else
  {
    v15 = 0;
    v16 = 0.0;
    do
    {
      v17 = dataset_get((_QWORD *)a2, v15);
      crf1dc_set_num_items(v9[5], *(_DWORD *)v17);
      crf1dc_reset(v9[5], 1);
      crf1de_state_score(v9, (unsigned int *)v17, a3);
      crf1dc_exp_state(v9[5]);
      crf1dc_alpha_score(v9[5]);
      crf1dc_beta_score((unsigned int *)v9[5]);
      crf1dc_marginals((unsigned int *)v9[5]);
      v18 = crf1dc_score(v9[5], *(int **)(v17 + 16));
      v16 = v16 + v18 - crf1dc_lognorm(v9[5]);
      crf1de_model_expectation(v9, (unsigned int *)v17, a5, 1.0);
      ++v15;
    }
    while (v10 != v15);
  }
  *a4 = -v16;
  return 0;
}

uint64_t encoder_save_model(uint64_t a1, const char *a2, uint64_t a3, _QWORD *a4)
{
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;

  v6 = *(unsigned int **)a1;
  v7 = **(_QWORD **)(a1 + 24);
  v8 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  v10 = crf1mmw(a2);
  if (!v10)
    return 2147483652;
  v12 = (unsigned int *)v10;
  v13 = crf1de_write_model(v6, v10, a3, v8, v9, a4, 0, v11);
  crf1dmw_close(v12);
  return v13;
}

uint64_t encoder_save_model_to_file_pointer(unsigned int **a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  FILE *v12;
  const char *v13;
  size_t v14;
  uint64_t v16;
  _QWORD *compact_model_writer_from_file_pointer;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  void (**v30)(_QWORD);
  clock_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  int v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  clock_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  clock_t v126;

  v9 = *a1;
  v10 = *(_QWORD *)a1[3];
  v11 = *(_QWORD *)(v10 + 16);
  if ((a5 & 1) != 0)
  {
    if (v11)
    {
      fwrite("Warning: attributes will not be stored, because \"crfsuite_training_do_not_store_attributes\" is specified.\n", 0x6AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      v10 = *(_QWORD *)a1[3];
    }
  }
  else if (!v11)
  {
    v12 = (FILE *)*MEMORY[0x24BDAC8D8];
    v13 = "Error: missing attribute dictionary.\n";
    v14 = 37;
LABEL_15:
    fwrite(v13, v14, 1uLL, v12);
    return 2147483651;
  }
  v16 = *(_QWORD *)(v10 + 24);
  if (!v16)
  {
    v12 = (FILE *)*MEMORY[0x24BDAC8D8];
    v13 = "Error: missing label dictionary.\n";
    v14 = 33;
    goto LABEL_15;
  }
  if ((a5 & 0x14) == 0)
  {
    v24 = *(_QWORD *)(v10 + 16);
    v25 = (unsigned int *)crf1mmw_from_file_pointer(a2);
    if (v25)
    {
      v27 = v25;
      v28 = crf1de_write_model(v9, v25, a3, v24, v16, a4, a5, v26);
      crf1dmw_close(v27);
      return v28;
    }
    return 2147483652;
  }
  if ((~(_DWORD)a5 & 3) != 0)
  {
    v12 = (FILE *)*MEMORY[0x24BDAC8D8];
    v13 = "To use compact or quantized format, you must store attributes and labels out side of crfsuite model.\n";
    v14 = 101;
    goto LABEL_15;
  }
  if ((a5 & 4) != 0)
    compact_model_writer_from_file_pointer = create_compact_model_writer_from_file_pointer(a2);
  else
    compact_model_writer_from_file_pointer = create_quantized_model_writer_from_file_pointer(a2);
  v30 = (void (**)(_QWORD))compact_model_writer_from_file_pointer;
  if (!compact_model_writer_from_file_pointer)
    return 2147483652;
  logging(a4, (uint64_t)"Storing the model\n", v18, v19, v20, v21, v22, v23, v121);
  v31 = clock();
  logging(a4, (uint64_t)"Writing label features\n", v32, v33, v34, v35, v36, v37, v122);
  v38 = malloc_type_calloc(8uLL, *v9 * *v9, 0x60F1FD01uLL);
  v39 = v38;
  v40 = *v9;
  if ((int)v40 < 1)
  {
    v42 = 0;
  }
  else
  {
    v41 = 0;
    v42 = 0;
    v43 = *((_QWORD *)v9 + 4);
    do
    {
      v44 = *(unsigned int *)(v43 + 16 * v41);
      if ((int)v44 >= 1)
      {
        v45 = *(int **)(v43 + 16 * v41 + 8);
        do
        {
          v47 = *v45++;
          v46 = v47;
          v48 = *(double *)(a3 + 8 * v47);
          if (v48 != 0.0)
          {
            v49 = *((_QWORD *)v9 + 2);
            if (*(_DWORD *)(v49 + 24 * v46) != 1)
              encoder_save_model_to_file_pointer_cold_1();
            v42 = (v42 + 1);
            *((double *)v38 + *(_DWORD *)(v49 + 24 * v46 + 8) + (int)v40 * (int)v41) = v48;
          }
          --v44;
        }
        while (v44);
      }
      ++v41;
    }
    while (v41 != v40);
  }
  write_label_features((uint64_t)v30);
  free(v39);
  logging(a4, (uint64_t)"Writing attribute feature counts and offsets.\n", v50, v51, v52, v53, v54, v55, v123);
  v56 = malloc_type_calloc(4uLL, (int)v9[1], 0x3AA60A3EuLL);
  v57 = malloc_type_calloc(4uLL, (int)v9[1], 0x5C9E4E1CuLL);
  v58 = v57;
  v126 = v31;
  if ((int)v9[1] < 1)
  {
    v60 = 0;
  }
  else
  {
    v59 = 0;
    v60 = 0;
    v61 = *((_QWORD *)v9 + 3);
    do
    {
      *((_DWORD *)v57 + v59) = v60;
      v62 = *(unsigned int *)(v61 + 16 * v59);
      if ((int)v62 < 1)
      {
        v63 = 0;
      }
      else
      {
        v63 = 0;
        v64 = *(int **)(v61 + 16 * v59 + 8);
        do
        {
          v65 = *v64++;
          v66 = *(double *)(a3 + 8 * v65);
          if (v66 == 0.0)
            v60 = v60;
          else
            v60 = (v60 + 1);
          if (v66 != 0.0)
            ++v63;
          --v62;
        }
        while (v62);
      }
      v56[v59++] = v63;
    }
    while (v59 < (int)v9[1]);
  }
  write_attribute_feature_counts_and_offsets((uint64_t)v30);
  free(v56);
  free(v58);
  logging(a4, (uint64_t)"Writing attribute features.\n", v67, v68, v69, v70, v71, v72, v124);
  open_attribute_features((uint64_t)v30);
  v79 = v9[1];
  if ((int)v79 >= 1)
  {
    v80 = 0;
    do
    {
      v81 = *((_QWORD *)v9 + 3) + 16 * v80;
      v82 = *(_DWORD *)v81;
      if (*(int *)v81 >= 1)
      {
        v83 = 0;
        do
        {
          if (*(double *)(a3 + 8 * *(int *)(*(_QWORD *)(v81 + 8) + 4 * v83)) != 0.0)
          {
            write_attribute_feature((uint64_t)v30);
            v82 = *(_DWORD *)v81;
          }
          ++v83;
        }
        while (v83 < v82);
        v79 = v9[1];
      }
      ++v80;
    }
    while (v80 < (int)v79);
  }
  logging(a4, (uint64_t)"Number of attributes: %d\n", v73, v74, v75, v76, v77, v78, v79);
  logging(a4, (uint64_t)"Number of labels: %d\n", v84, v85, v86, v87, v88, v89, *v9);
  logging(a4, (uint64_t)"Number of features: %d\n", v90, v91, v92, v93, v94, v95, v9[3]);
  logging(a4, (uint64_t)"Number of active label features: %d\n", v96, v97, v98, v99, v100, v101, v42);
  logging(a4, (uint64_t)"Number of active attribute features: %d\n", v102, v103, v104, v105, v106, v107, v60);
  v108 = clock();
  logging(a4, (uint64_t)"Seconds required: %.3f\n", v109, v110, v111, v112, v113, v114, COERCE__INT64((double)(v108 - v126) / 1000000.0));
  logging(a4, (uint64_t)"\n", v115, v116, v117, v118, v119, v120, v125);
  close_writer(v30);
  return 0;
}

uint64_t encoder_features_on_path(_QWORD *a1, unsigned int *a2, uint64_t a3, void (*a4)(uint64_t, double), uint64_t a5)
{
  uint64_t v7;
  _QWORD *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  int *v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v24 = *a2;
  if ((int)v24 >= 1)
  {
    v7 = 0;
    v8 = (_QWORD *)*a1;
    v9 = -1;
    do
    {
      v27 = v9;
      v28 = v7;
      v10 = *(_DWORD *)(a3 + 4 * v7);
      v29 = *((_QWORD *)a2 + 1) + 16 * v7;
      v11 = *(_DWORD *)v29;
      if (*(int *)v29 >= 1)
      {
        v12 = 0;
        do
        {
          v13 = (double *)(*(_QWORD *)(v29 + 8) + 16 * v12);
          v14 = v8[3] + 16 * *(int *)v13;
          v15 = *(_DWORD *)v14;
          if (*(int *)v14 >= 1)
          {
            v16 = 0;
            v17 = v13[1];
            do
            {
              if (*(_DWORD *)(v8[2] + 24 * *(int *)(*(_QWORD *)(v14 + 8) + 4 * v16) + 8) == v10)
              {
                a4(a5, v17);
                v15 = *(_DWORD *)v14;
              }
              ++v16;
            }
            while (v16 < v15);
            v11 = *(_DWORD *)v29;
          }
          ++v12;
        }
        while (v12 < v11);
      }
      if (v27 != -1)
      {
        v18 = v8[4];
        v19 = (int *)(v18 + 16 * v27);
        v20 = *v19;
        if (*v19 >= 1)
        {
          v21 = 0;
          v22 = (_QWORD *)(v18 + 16 * v27 + 8);
          do
          {
            if (*(_DWORD *)(v8[2] + 24 * *(int *)(*v22 + 4 * v21) + 8) == v10)
            {
              a4(a5, 1.0);
              v20 = *v19;
            }
            ++v21;
          }
          while (v21 < v20);
        }
      }
      v7 = v28 + 1;
      v9 = v10;
    }
    while (v28 + 1 != v24);
  }
  return 0;
}

uint64_t encoder_set_weights(uint64_t a1, uint64_t a2, double a3)
{
  *(_QWORD *)(a1 + 8) = a2;
  *(double *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 40) = 0;
  set_level(a1, 1);
  return 0;
}

uint64_t encoder_set_instance(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = a2;
  *(_DWORD *)(a1 + 40) = 1;
  set_level(a1, 2);
  return 0;
}

uint64_t encoder_score(uint64_t a1, int *a2, double *a3)
{
  *a3 = crf1dc_score(*(_QWORD *)(*(_QWORD *)a1 + 40), a2);
  return 0;
}

uint64_t encoder_viterbi(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  crf1dc_viterbi(*(_QWORD *)(*(_QWORD *)a1 + 40), a2);
  if (a3)
    *a3 = v4;
  return 0;
}

uint64_t encoder_partition_factor(uint64_t *a1, double *a2)
{
  uint64_t v3;

  v3 = *a1;
  set_level((uint64_t)a1, 3);
  *a2 = crf1dc_lognorm(*(_QWORD *)(v3 + 40));
  return 0;
}

uint64_t encoder_objective_and_gradients(_QWORD *a1, double *a2, uint64_t a3, double a4)
{
  _QWORD *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;

  v8 = (_QWORD *)*a1;
  set_level((uint64_t)a1, 4);
  v9 = (unsigned int *)a1[4];
  v10 = *v9;
  if ((int)v10 >= 1)
  {
    v11 = 0;
    v13 = *((_QWORD *)v9 + 1);
    v12 = *((_QWORD *)v9 + 2);
    v14 = -1;
    do
    {
      v15 = *(_DWORD *)(v12 + 4 * v11);
      v16 = *(unsigned int *)(v13 + 16 * v11);
      if ((int)v16 >= 1)
      {
        v17 = 0;
        v18 = *(_QWORD *)(v13 + 16 * v11 + 8);
        v19 = v8[3];
        do
        {
          v20 = (double *)(v18 + 16 * v17);
          v21 = *(int *)v20;
          v22 = *(unsigned int *)(v19 + 16 * v21);
          if ((int)v22 >= 1)
          {
            v23 = v20[1];
            v24 = *(int **)(v19 + 16 * v21 + 8);
            v25 = v8[2];
            do
            {
              v27 = *v24++;
              v26 = v27;
              if (*(_DWORD *)(v25 + 24 * (int)v27 + 8) == v15)
                *(double *)(a3 + 8 * v26) = *(double *)(a3 + 8 * v26) + v23 * a4;
              --v22;
            }
            while (v22);
          }
          ++v17;
        }
        while (v17 != v16);
      }
      if (v14 != -1)
      {
        v28 = v8[4];
        v29 = *(unsigned int *)(v28 + 16 * v14);
        if ((int)v29 >= 1)
        {
          v30 = *(int **)(v28 + 16 * v14 + 8);
          v31 = v8[2];
          do
          {
            v33 = *v30++;
            v32 = v33;
            if (*(_DWORD *)(v31 + 24 * (int)v33 + 8) == v15)
              *(double *)(a3 + 8 * v32) = *(double *)(a3 + 8 * v32) + a4;
            --v29;
          }
          while (v29);
        }
      }
      ++v11;
      v14 = v15;
    }
    while (v11 != v10);
  }
  crf1de_model_expectation(v8, v9, a3, -a4);
  v34 = crf1dc_score(v8[5], *(int **)(a1[4] + 16));
  *a2 = crf1dc_lognorm(v8[5]) - v34;
  return 0;
}

void encoder_release(int **a1)
{
  int *v2;

  v2 = *a1;
  crf1de_finish(*a1);
  free(v2);
  free(a1);
}

void crf1de_finish(int *a1)
{
  void **v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void **)*((_QWORD *)a1 + 5);
  if (v2)
  {
    crf1dc_delete(v2);
    *((_QWORD *)a1 + 5) = 0;
  }
  v3 = (void *)*((_QWORD *)a1 + 2);
  if (v3)
  {
    free(v3);
    *((_QWORD *)a1 + 2) = 0;
  }
  v4 = (void *)*((_QWORD *)a1 + 3);
  if (v4)
  {
    if (a1[1] >= 1)
    {
      v5 = 0;
      v6 = 8;
      do
      {
        free(*(void **)(*((_QWORD *)a1 + 3) + v6));
        ++v5;
        v6 += 16;
      }
      while (v5 < a1[1]);
      v4 = (void *)*((_QWORD *)a1 + 3);
    }
    free(v4);
    *((_QWORD *)a1 + 3) = 0;
  }
  v7 = (void *)*((_QWORD *)a1 + 4);
  if (v7)
  {
    if (*a1 >= 1)
    {
      v8 = 0;
      v9 = 8;
      do
      {
        free(*(void **)(*((_QWORD *)a1 + 4) + v9));
        ++v8;
        v9 += 16;
      }
      while (v8 < *a1);
      v7 = (void *)*((_QWORD *)a1 + 4);
    }
    free(v7);
    *((_QWORD *)a1 + 4) = 0;
  }
}

_QWORD *crf1de_transition_score(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(unsigned int *)result;
  if ((int)v2 >= 1)
  {
    v3 = 0;
    v4 = result[4];
    v5 = result[5];
    v6 = *(_QWORD *)(v5 + 32);
    v7 = *(int *)(v5 + 4);
    do
    {
      v8 = *(unsigned int *)(v4 + 16 * v3);
      if ((int)v8 >= 1)
      {
        v9 = *(int **)(v4 + 16 * v3 + 8);
        v10 = result[2];
        do
        {
          v11 = *v9++;
          *(_QWORD *)(v6 + 8 * v3 * v7 + 8 * *(int *)(v10 + 24 * (int)v11 + 8)) = *(_QWORD *)(a2 + 8 * v11);
          --v8;
        }
        while (v8);
      }
      ++v3;
    }
    while (v3 != v2);
  }
  return result;
}

_QWORD *crf1de_state_score(_QWORD *result, unsigned int *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *a2;
  if ((int)v3 >= 1)
  {
    v4 = 0;
    v5 = result[5];
    v6 = *((_QWORD *)a2 + 1);
    v7 = *(_QWORD *)(v5 + 24);
    v8 = *(int *)(v5 + 4);
    do
    {
      v9 = *(unsigned int *)(v6 + 16 * v4);
      if ((int)v9 >= 1)
      {
        v10 = 0;
        v11 = *(_QWORD *)(v6 + 16 * v4 + 8);
        v12 = result[3];
        do
        {
          v13 = (double *)(v11 + 16 * v10);
          v14 = *(int *)v13;
          v15 = *(unsigned int *)(v12 + 16 * v14);
          if ((int)v15 >= 1)
          {
            v16 = v13[1];
            v17 = *(int **)(v12 + 16 * v14 + 8);
            v18 = result[2];
            do
            {
              v19 = *v17++;
              v20 = *(int *)(v18 + 24 * (int)v19 + 8);
              *(double *)(v7 + 8 * v4 * v8 + 8 * v20) = *(double *)(v7 + 8 * v4 * v8 + 8 * v20)
                                                      + *(double *)(a3 + 8 * v19) * v16;
              --v15;
            }
            while (v15);
          }
          ++v10;
        }
        while (v10 != v9);
      }
      ++v4;
    }
    while (v4 != v3);
  }
  return result;
}

_QWORD *crf1de_model_expectation(_QWORD *result, unsigned int *a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = result[5];
  v5 = *a2;
  v6 = *(unsigned int *)result;
  if ((int)v5 >= 1)
  {
    v7 = 0;
    v8 = *(_QWORD *)(v4 + 96);
    v9 = *(int *)(v4 + 4);
    v10 = *((_QWORD *)a2 + 1);
    do
    {
      v11 = *(unsigned int *)(v10 + 16 * v7);
      if ((int)v11 >= 1)
      {
        v12 = 0;
        v13 = *(_QWORD *)(v10 + 16 * v7 + 8);
        v14 = result[3];
        do
        {
          v15 = (double *)(v13 + 16 * v12);
          v16 = *(int *)v15;
          v17 = *(unsigned int *)(v14 + 16 * v16);
          if ((int)v17 >= 1)
          {
            v18 = v15[1];
            v19 = *(int **)(v14 + 16 * v16 + 8);
            v20 = result[2];
            do
            {
              v21 = *v19++;
              *(double *)(a3 + 8 * v21) = *(double *)(a3 + 8 * v21)
                                        + v18
                                        * *(double *)(v8 + 8 * v7 * v9 + 8 * *(int *)(v20 + 24 * (int)v21 + 8))
                                        * a4;
              --v17;
            }
            while (v17);
          }
          ++v12;
        }
        while (v12 != v11);
      }
      ++v7;
    }
    while (v7 != v5);
  }
  if ((int)v6 >= 1)
  {
    v22 = 0;
    v23 = *(_QWORD *)(v4 + 104);
    v24 = *(int *)(v4 + 4);
    v25 = result[4];
    do
    {
      v26 = *(unsigned int *)(v25 + 16 * v22);
      if ((int)v26 >= 1)
      {
        v27 = *(int **)(v25 + 16 * v22 + 8);
        v28 = result[2];
        do
        {
          v29 = *v27++;
          *(double *)(a3 + 8 * v29) = *(double *)(a3 + 8 * v29)
                                    + *(double *)(v23 + 8 * v22 * v24 + 8 * *(int *)(v28 + 24 * (int)v29 + 8)) * a4;
          --v26;
        }
        while (v26);
      }
      ++v22;
    }
    while (v22 != v6);
  }
  return result;
}

uint64_t crf1de_write_model(unsigned int *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  double *v10;
  uint64_t v13;
  size_t v14;
  size_t v15;
  clock_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  double v26;
  uint64_t v27;
  unsigned int v28;
  int *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int *v83;
  int v84;
  int v85;
  clock_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  clock_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v110;
  _QWORD *v111;
  char *__s;
  uint64_t v113;
  double v114;

  v110 = a7;
  v10 = (double *)a3;
  v13 = *a1;
  v14 = (int)a1[1];
  v15 = (int)a1[3];
  logging(a6, (uint64_t)"Storing the model\n", a3, a4, a5, (uint64_t)a6, a7, a8, v100);
  v16 = clock();
  v17 = malloc_type_calloc(v15, 4uLL, 0x100004052888210uLL);
  if (v17)
  {
    v18 = v17;
    v108 = a4;
    v19 = v15;
    if ((int)v15 >= 1)
      memset(v17, 255, 4 * v15);
    v20 = (int *)malloc_type_calloc(v14, 4uLL, 0x100004052888210uLL);
    if (!v20)
    {
      v22 = 1;
LABEL_64:
      free(v18);
      return v22;
    }
    v21 = v20;
    v106 = v13;
    if ((int)v14 >= 1)
      memset(v20, 255, 4 * v14);
    v22 = crf1dmw_open_features(a2);
    if (!(_DWORD)v22)
    {
      v104 = v16;
      v105 = a6;
      v111 = a2;
      if ((int)v19 >= 1)
      {
        v23 = 0;
        v107 = 0;
        v24 = 0;
        v25 = (int *)v18;
        while (1)
        {
          v26 = *v10;
          if (*v10 != 0.0)
          {
            v27 = *((_QWORD *)a1 + 2);
            __s = 0;
            v113 = 0;
            v114 = 0.0;
            *v25 = v24;
            v29 = (int *)(v27 + v23 + 4);
            v28 = *(_DWORD *)(v27 + v23);
            if (v28)
            {
              v30 = v24;
            }
            else
            {
              v31 = *v29;
              if (v21[v31] < 0)
              {
                v21[v31] = v107;
                v31 = *v29;
                v28 = *(_DWORD *)(v27 + v23);
                v30 = *v25;
                v107 = (v107 + 1);
              }
              else
              {
                v28 = 0;
                v30 = v24;
              }
              v29 = &v21[v31];
            }
            __s = (char *)__PAIR64__(*v29, v28);
            LODWORD(v113) = *(_DWORD *)(v27 + v23 + 8);
            v114 = v26;
            v32 = crf1dmw_put_feature((uint64_t)v111, v30, (uint64_t)&__s);
            if ((_DWORD)v32)
              goto LABEL_62;
            v24 = (v24 + 1);
          }
          ++v25;
          ++v10;
          v23 += 24;
          if (24 * v19 == v23)
            goto LABEL_24;
        }
      }
      v24 = 0;
      v107 = 0;
LABEL_24:
      v33 = v111;
      v22 = crf1dmw_close_features(v111);
      if (!(_DWORD)v22)
      {
        logging(v105, (uint64_t)"Number of active features: %d (%d)\n", v34, v35, v36, v37, v38, v39, v24);
        logging(v105, (uint64_t)"Number of active attributes: %d (%d)\n", v40, v41, v42, v43, v44, v45, v107);
        logging(v105, (uint64_t)"Number of active labels: %d (%d)\n", v46, v47, v48, v49, v50, v51, v106);
        if ((v110 & 2) != 0)
        {
          crf1dmw_set_no_labels((uint64_t)v111, v106);
        }
        else
        {
          logging(v105, (uint64_t)"Writing labels\n", v52, v53, v54, v55, v56, v57, v106);
          v22 = crf1dmw_open_labels((uint64_t)v111, v106);
          if ((_DWORD)v22)
            goto LABEL_63;
          v58 = v106;
          if ((int)v106 >= 1)
          {
            v59 = 0;
            do
            {
              __s = 0;
              (*(void (**)(uint64_t, uint64_t, char **))(a5 + 48))(a5, v59, &__s);
              if (__s)
              {
                v32 = crf1dmw_put_label((uint64_t)v111, v59, __s);
                if ((_DWORD)v32)
                  goto LABEL_62;
                (*(void (**)(uint64_t, char *))(a5 + 64))(a5, __s);
                v58 = v106;
              }
              v59 = (v59 + 1);
            }
            while (v58 != (_DWORD)v59);
          }
          v22 = crf1dmw_close_labels((uint64_t)v111);
          if ((_DWORD)v22)
            goto LABEL_63;
        }
        if ((v110 & 1) != 0)
        {
          crf1dmw_set_no_attributes((uint64_t)v111, v107);
        }
        else
        {
          logging(v105, (uint64_t)"Writing attributes\n", v60, v61, v62, v63, v64, v65, v101);
          v22 = crf1dmw_open_attrs((uint64_t)v111, v107);
          if ((_DWORD)v22)
            goto LABEL_63;
          v66 = v14;
          if ((int)v14 >= 1)
          {
            v67 = 0;
            do
            {
              if ((v21[v67] & 0x80000000) == 0)
              {
                __s = 0;
                (*(void (**)(uint64_t, uint64_t, char **))(v108 + 48))(v108, v67, &__s);
                if (__s)
                {
                  v32 = crf1dmw_put_attr((uint64_t)v111, v21[v67], __s);
                  if ((_DWORD)v32)
                    goto LABEL_62;
                  (*(void (**)(uint64_t, char *))(v108 + 64))(v108, __s);
                  v66 = v14;
                }
              }
              ++v67;
            }
            while (v66 != v67);
          }
          v33 = v111;
          v22 = crf1dmw_close_attrs((uint64_t)v111);
          if ((_DWORD)v22)
            goto LABEL_63;
        }
        logging(v105, (uint64_t)"Writing feature references for transitions\n", v68, v69, v70, v71, v72, v73, v101);
        v22 = crf1dmw_open_labelrefs(v33, (int)v106 + 2);
        if (!(_DWORD)v22)
        {
          if ((int)v106 < 1)
          {
LABEL_53:
            v22 = crf1dmw_close_labelrefs(v111);
            if ((_DWORD)v22)
              goto LABEL_63;
            logging(v105, (uint64_t)"Writing feature references for attributes\n", v76, v77, v78, v79, v80, v81, v102);
            v22 = crf1dmw_open_attrrefs(v111, v107);
            if ((_DWORD)v22)
              goto LABEL_63;
            if ((int)v14 < 1)
            {
LABEL_60:
              v22 = crf1dmw_close_attrrefs(v111);
              if (!(_DWORD)v22)
              {
                v86 = clock();
                logging(v105, (uint64_t)"Seconds required: %.3f\n", v87, v88, v89, v90, v91, v92, COERCE__INT64((double)(v86 - v104) / 1000000.0));
                logging(v105, (uint64_t)"\n", v93, v94, v95, v96, v97, v98, v103);
              }
              goto LABEL_63;
            }
            v82 = 0;
            v83 = v21;
            while (1)
            {
              v85 = *v83++;
              v84 = v85;
              if ((v85 & 0x80000000) == 0)
              {
                v32 = crf1dmw_put_attrref(v111, v84, (unsigned int *)(*((_QWORD *)a1 + 3) + v82), (uint64_t)v18);
                if ((_DWORD)v32)
                  break;
              }
              v82 += 16;
              if (16 * v14 == v82)
                goto LABEL_60;
            }
          }
          else
          {
            v74 = 0;
            v75 = 0;
            while (1)
            {
              v32 = crf1dmw_put_labelref(v111, v75, (unsigned int *)(*((_QWORD *)a1 + 4) + v74), (uint64_t)v18);
              if ((_DWORD)v32)
                break;
              ++v75;
              v74 += 16;
              if (16 * v106 == v74)
                goto LABEL_53;
            }
          }
LABEL_62:
          v22 = v32;
        }
      }
    }
LABEL_63:
    free(v21);
    goto LABEL_64;
  }
  return 1;
}

void set_level(uint64_t a1, int a2)
{
  int v4;
  _QWORD *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = *(_DWORD *)(a1 + 40);
  v5 = *(_QWORD **)a1;
  if (v4 < 1)
  {
    crf1dc_reset(v5[5], 2);
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(double *)(a1 + 16);
    if (v7 == 1.0)
    {
      crf1de_transition_score(v5, v6);
    }
    else
    {
      v8 = *(unsigned int *)v5;
      if ((int)v8 >= 1)
      {
        v9 = 0;
        v10 = v5[4];
        v11 = v5[5];
        v12 = *(_QWORD *)(v11 + 32);
        v13 = *(int *)(v11 + 4);
        do
        {
          v14 = *(unsigned int *)(v10 + 16 * v9);
          if ((int)v14 >= 1)
          {
            v15 = *(int **)(v10 + 16 * v9 + 8);
            v16 = v5[2];
            do
            {
              v17 = *v15++;
              *(double *)(v12 + 8 * v9 * v13 + 8 * *(int *)(v16 + 24 * (int)v17 + 8)) = v7
                                                                                          * *(double *)(v6 + 8 * v17);
              --v14;
            }
            while (v14);
          }
          ++v9;
        }
        while (v9 != v8);
      }
    }
  }
  if (a2 > 1 && v4 < 2)
  {
    crf1dc_set_num_items(v5[5], **(_DWORD **)(a1 + 32));
    crf1dc_reset(v5[5], 1);
    v18 = *(unsigned int **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 8);
    v20 = *(double *)(a1 + 16);
    if (v20 == 1.0)
    {
      crf1de_state_score(v5, v18, v19);
    }
    else
    {
      v21 = *v18;
      if ((int)v21 >= 1)
      {
        v22 = 0;
        v23 = v5[5];
        v24 = *((_QWORD *)v18 + 1);
        v25 = *(_QWORD *)(v23 + 24);
        v26 = *(int *)(v23 + 4);
        do
        {
          v27 = *(unsigned int *)(v24 + 16 * v22);
          if ((int)v27 >= 1)
          {
            v28 = 0;
            v29 = *(_QWORD *)(v24 + 16 * v22 + 8);
            v30 = v5[3];
            do
            {
              v31 = (double *)(v29 + 16 * v28);
              v32 = *(int *)v31;
              v33 = *(unsigned int *)(v30 + 16 * v32);
              if ((int)v33 >= 1)
              {
                v34 = v20 * v31[1];
                v35 = *(int **)(v30 + 16 * v32 + 8);
                v36 = v5[2];
                do
                {
                  v37 = *v35++;
                  v38 = *(int *)(v36 + 24 * (int)v37 + 8);
                  *(double *)(v25 + 8 * v22 * v26 + 8 * v38) = *(double *)(v25 + 8 * v22 * v26 + 8 * v38)
                                                             + *(double *)(v19 + 8 * v37) * v34;
                  --v33;
                }
                while (v33);
              }
              ++v28;
            }
            while (v28 != v27);
          }
          ++v22;
        }
        while (v22 != v21);
      }
    }
  }
  if (a2 > 2 && v4 < 3)
  {
    crf1dc_exp_transition(v5[5]);
    crf1dc_exp_state(v5[5]);
    crf1dc_alpha_score(v5[5]);
    crf1dc_beta_score((unsigned int *)v5[5]);
  }
  if (a2 > 3 && v4 <= 3)
    crf1dc_marginals((unsigned int *)v5[5]);
  *(_DWORD *)(a1 + 40) = a2;
}

void ME_Efficient_Model_Trainer::regularized_func_grad(ME_Efficient_Model_Trainer *this, double a2, uint64_t **a3, double **a4)
{
  double v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = ME_Efficient_Model_Trainer::FunctionGradient(this, a3, a4);
  v7 = a3[1];
  v8 = (char *)v7 - (char *)*a3;
  if (v7 != *a3)
  {
    v9 = 0;
    v10 = v8 >> 3;
    if (v10 <= 1)
      v10 = 1;
    do
    {
      v6 = v6 + a2 * fabs(*(double *)((char *)*a3 + (v9 >> 29)));
      v9 += 0x100000000;
      --v10;
    }
    while (v10);
  }
}

double ME_Efficient_Model_Trainer::constrained_line_search(ME_Efficient_Model_Trainer *this, double a2, const Vec *a3, const Vec *a4, double a5, const Vec *a6, Vec *a7, double **a8)
{
  double *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  _BYTE *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v48;
  _BYTE *v49;
  void *__p;
  _BYTE *v51;
  void *v52;
  _BYTE *v53;
  uint64_t v54;

  v52 = 0;
  v53 = 0;
  v54 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v52, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  v16 = (double *)v52;
  if (v53 != v52)
  {
    v17 = 0;
    v18 = (v53 - (_BYTE *)v52) >> 3;
    v19 = *(_QWORD *)a4;
    if (v18 <= 1)
      v18 = 1;
    do
    {
      if (*(double *)((char *)v16 + (v17 >> 29)) == 0.0)
        v16[v17 >> 32] = -*(double *)(v19 + 8 * (v17 >> 32));
      v17 += 0x100000000;
      --v18;
    }
    while (v18);
  }
  v20 = 2.0;
  do
  {
    while (1)
    {
      Vec::Vec((Vec *)&v48, (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 3, 0.0);
      v20 = v20 * 0.5;
      v21 = *(_QWORD *)a6;
      v22 = *((_QWORD *)a6 + 1);
      v23 = v22 - *(_QWORD *)a6;
      if (v22 != *(_QWORD *)a6)
      {
        v24 = 0;
        v25 = v23 >> 3;
        v26 = (char *)v48;
        if (v25 <= 1)
          v25 = 1;
        do
        {
          *(double *)&v26[v24 >> 29] = v20 * *(double *)(v21 + (v24 >> 29));
          v24 += 0x100000000;
          --v25;
        }
        while (v25);
      }
      Vec::Vec((Vec *)&__p, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3, 0.0);
      v27 = *(char **)a3;
      v28 = (char *)*((_QWORD *)a3 + 1);
      v29 = (uint64_t)&v28[-*(_QWORD *)a3] >> 3;
      v30 = (char *)v48;
      if (v29 != (v49 - (_BYTE *)v48) >> 3)
        __assert_rtn("operator+", "mathvec.h", 64, "a.Size() == b.Size()");
      if (v28 != v27)
      {
        v31 = 0;
        v32 = (char *)__p;
        if (v29 <= 1)
          v29 = 1;
        do
        {
          *(double *)&v32[v31 >> 29] = *(double *)&v27[v31 >> 29] + *(double *)&v30[v31 >> 29];
          v31 += 0x100000000;
          --v29;
        }
        while (v29);
      }
      v33 = __p;
      if (&__p != (void **)a7)
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)a7, (char *)__p, (uint64_t)v51, (v51 - (_BYTE *)__p) >> 3);
        v33 = __p;
      }
      if (v33)
      {
        v51 = v33;
        operator delete(v33);
      }
      if (v48)
      {
        v49 = v48;
        operator delete(v48);
      }
      Vec::Project((uint64_t)a7, (uint64_t *)&v52);
      ME_Efficient_Model_Trainer::regularized_func_grad(this, a2, (uint64_t **)a7, a8);
      v35 = v34;
      Vec::Vec((Vec *)&__p, (uint64_t)(*((_QWORD *)a7 + 1) - *(_QWORD *)a7) >> 3, 0.0);
      v36 = *(_QWORD *)a7;
      v37 = *((_QWORD *)a7 + 1);
      v38 = (v37 - *(_QWORD *)a7) >> 3;
      v39 = *(char **)a3;
      if (v38 != (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3)
        __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
      if (v37 != v36)
      {
        v40 = 0;
        v41 = (char *)__p;
        if (v38 <= 1)
          v38 = 1;
        do
        {
          *(double *)&v41[v40 >> 29] = *(double *)(v36 + (v40 >> 29)) - *(double *)&v39[v40 >> 29];
          v40 += 0x100000000;
          --v38;
        }
        while (v38);
      }
      v42 = v51 - (_BYTE *)__p;
      if (v51 == __p)
        break;
      v43 = 0;
      v44 = v42 >> 3;
      if ((unint64_t)(v42 >> 3) <= 1)
        v44 = 1;
      v45 = 0.0;
      do
      {
        v45 = v45 + *(double *)((char *)__p + (v43 >> 29)) * *(double *)(*(_QWORD *)a4 + (v43 >> 29));
        v43 += 0x100000000;
        --v44;
      }
      while (v44);
      v46 = a5 + v45 * 0.1;
      v51 = __p;
      operator delete(__p);
      if (v35 <= v46)
        goto LABEL_38;
    }
    if (v51)
      operator delete(v51);
  }
  while (v35 > a5 + 0.0);
LABEL_38:
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  return v35;
}

void sub_2083EC538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a10)
    operator delete(a10);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t Vec::Project(uint64_t result, uint64_t *a2)
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v2 = *(double **)result;
  v3 = *(_QWORD *)(result + 8);
  v4 = v3 - *(_QWORD *)result;
  if (v3 != *(_QWORD *)result)
  {
    v5 = 0;
    v6 = v4 >> 3;
    v7 = *a2;
    if (v6 <= 1)
      v6 = 1;
    do
    {
      if (*v2 * *(double *)(v7 + (v5 >> 29)) <= 0.0)
        *v2 = 0.0;
      ++v2;
      v5 += 0x100000000;
      --v6;
    }
    while (v6);
  }
  return result;
}

void ME_Efficient_Model_Trainer::perform_OWLQN(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>)
{
  const void *v7;
  uint64_t v8;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  uint64_t j;
  unsigned int v15;
  FILE **v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  double *v20;
  double *v21;
  uint64_t v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  unsigned int v28;
  double v29;
  _BYTE *v30;
  uint64_t v31;
  unint64_t v32;
  double v33;
  double v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  double *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  void **v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  void **v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  uint64_t k;
  void *v69;
  uint64_t m;
  void *v71;
  _QWORD *v72;
  void *v73;
  _BYTE *v74;
  void *v75;
  _BYTE *v76;
  void *__p;
  _BYTE *v78;
  void *v79;
  _BYTE *v80;
  uint64_t v81;
  void *v82;
  _BYTE *v83;
  void *v84;
  _BYTE *v85;
  void *v86;
  _BYTE *v87;
  uint64_t v88;
  double v89[10];
  char v90[240];
  char v91[240];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v7 = *(const void **)a2;
  v8 = *(_QWORD *)(a2 + 8);
  v10 = (v8 - (uint64_t)v7) >> 3;
  v86 = 0;
  v87 = 0;
  v88 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v86, v7, v8, v10);
  Vec::Vec((Vec *)&v84, v10, 0.0);
  Vec::Vec((Vec *)&v82, v10, 0.0);
  ME_Efficient_Model_Trainer::regularized_func_grad((ME_Efficient_Model_Trainer *)a1, a4, (uint64_t **)&v86, (double **)&v84);
  v12 = v11;
  for (i = 0; i != 240; i += 24)
    Vec::Vec((Vec *)&v91[i], 0, 0.0);
  v72 = a3;
  for (j = 0; j != 240; j += 24)
    Vec::Vec((Vec *)&v90[j], 0, 0.0);
  v15 = 0;
  v16 = (FILE **)MEMORY[0x24BDAC8D8];
  while (v15 != 300)
  {
    v79 = 0;
    v80 = 0;
    v81 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v79, v84, (uint64_t)v85, (v85 - (_BYTE *)v84) >> 3);
    v17 = (char *)v86;
    if (v87 != v86)
    {
      v18 = 0;
      v19 = (v87 - (_BYTE *)v86) >> 3;
      v20 = (double *)v84;
      v21 = (double *)v79;
      if (v19 <= 1)
        v19 = 1;
      do
      {
        v22 = v18 >> 32;
        v23 = *(double *)&v17[v18 >> 29];
        v24 = v23 <= 0.0;
        if (v23 == 0.0)
        {
          v27 = v20[v22];
          if (v27 - a4 > 0.0)
          {
            v21[v22] = v27 - a4;
            goto LABEL_22;
          }
          v26 = v27 + a4;
          if (v26 >= 0.0)
          {
            v21[v22] = 0.0;
            goto LABEL_22;
          }
        }
        else
        {
          if (v23 >= 0.0)
            v25 = 0.0;
          else
            v25 = -1.0;
          if (!v24)
            v25 = 1.0;
          v26 = v21[v22] + a4 * v25;
        }
        v21[v22] = v26;
LABEL_22:
        v18 += 0x100000000;
        --v19;
      }
      while (v19);
    }
    v28 = v15 + 1;
    fprintf(*v16, "%3d  obj(err) = %f (%6.4f)", v15 + 1, -v12, *(double *)(a1 + 336));
    if (*(int *)(a1 + 352) >= 1)
    {
      v29 = ME_Efficient_Model_Trainer::heldout_likelihood((ME_Efficient_Model_Trainer *)a1);
      fprintf(*v16, "  heldout_logl(err) = %f (%6.4f)", v29, *(double *)(a1 + 344));
    }
    fputc(10, *v16);
    v30 = v79;
    if (v80 == v79)
    {
      v33 = 0.0;
    }
    else
    {
      v31 = 0;
      v32 = (v80 - (_BYTE *)v79) >> 3;
      if (v32 <= 1)
        v32 = 1;
      v33 = 0.0;
      do
      {
        v33 = v33 + *(double *)((char *)v79 + (v31 >> 29)) * *(double *)((char *)v79 + (v31 >> 29));
        v31 += 0x100000000;
        --v32;
      }
      while (v32);
    }
    v34 = sqrt(v33);
    if (v34 >= 0.0001)
    {
      approximate_Hg((const Vec *)&v79, (const Vec *)v91, (const Vec *)v90, v89, v15, (double **)&v75);
      Vec::Vec((Vec *)&__p, (v76 - (_BYTE *)v75) >> 3, 0.0);
      v35 = (char *)v75;
      if (v76 != v75)
      {
        v36 = 0;
        v37 = (v76 - (_BYTE *)v75) >> 3;
        v38 = (char *)__p;
        if (v37 <= 1)
          v37 = 1;
        do
        {
          *(double *)&v38[v36 >> 29] = -*(double *)&v35[v36 >> 29];
          v36 += 0x100000000;
          --v37;
        }
        while (v37);
      }
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v82, (char *)__p, (uint64_t)v78, (v78 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        v78 = __p;
        operator delete(__p);
      }
      if (v75)
      {
        v76 = v75;
        operator delete(v75);
      }
      if (v83 == v82)
        goto LABEL_47;
      v39 = 0;
      v40 = (v83 - (_BYTE *)v82) >> 3;
      if (v40 <= 1)
        v40 = 1;
      v41 = 0.0;
      do
      {
        v41 = v41 + *(double *)((char *)v82 + (v39 >> 29)) * *(double *)((char *)v79 + (v39 >> 29));
        v39 += 0x100000000;
        --v40;
      }
      while (v40);
      if (v41 >= 0.0)
      {
LABEL_47:
        Vec::Vec((Vec *)&__p, (v80 - (_BYTE *)v79) >> 3, 0.0);
        v42 = (char *)v79;
        if (v80 != v79)
        {
          v43 = 0;
          v44 = (v80 - (_BYTE *)v79) >> 3;
          v45 = (char *)__p;
          if (v44 <= 1)
            v44 = 1;
          do
          {
            *(double *)&v45[v43 >> 29] = -*(double *)&v42[v43 >> 29];
            v43 += 0x100000000;
            --v44;
          }
          while (v44);
        }
        v46 = (double *)v82;
        v47 = (char *)__p;
        if (v83 != v82)
        {
          v48 = 0;
          v49 = (v83 - (_BYTE *)v82) >> 3;
          if (v49 <= 1)
            v49 = 1;
          do
          {
            if (*v46 * *(double *)&v47[v48 >> 29] <= 0.0)
              *v46 = 0.0;
            v48 += 0x100000000;
            ++v46;
            --v49;
          }
          while (v49);
          v47 = (char *)__p;
        }
        if (v47)
        {
          v78 = v47;
          operator delete(v47);
        }
      }
      Vec::Vec((Vec *)&__p, v10, 0.0);
      Vec::Vec((Vec *)&v75, v10, 0.0);
      v12 = ME_Efficient_Model_Trainer::constrained_line_search((ME_Efficient_Model_Trainer *)a1, a4, (const Vec *)&v86, (const Vec *)&v79, v12, (const Vec *)&v82, (Vec *)&__p, (double **)&v75);
      Vec::Vec((Vec *)&v73, (v78 - (_BYTE *)__p) >> 3, 0.0);
      v50 = (char *)__p;
      v51 = (v78 - (_BYTE *)__p) >> 3;
      v52 = (char *)v86;
      if (v51 != (v87 - (_BYTE *)v86) >> 3)
        __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
      if (v78 != __p)
      {
        v53 = 0;
        v54 = (char *)v73;
        if (v51 <= 1)
          v51 = 1;
        do
        {
          *(double *)&v54[v53 >> 29] = *(double *)&v50[v53 >> 29] - *(double *)&v52[v53 >> 29];
          v53 += 0x100000000;
          --v51;
        }
        while (v51);
      }
      v55 = v15 % 0xA;
      v56 = (void **)&v91[24 * v55];
      if (v56 != &v73)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v91[24 * v55], (char *)v73, (uint64_t)v74, (v74 - (_BYTE *)v73) >> 3);
      if (v73)
      {
        v74 = v73;
        operator delete(v73);
      }
      Vec::Vec((Vec *)&v73, (v76 - (_BYTE *)v75) >> 3, 0.0);
      v57 = (char *)v75;
      v58 = (v76 - (_BYTE *)v75) >> 3;
      v59 = (char *)v84;
      if (v58 != (v85 - (_BYTE *)v84) >> 3)
        __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
      if (v76 != v75)
      {
        v60 = 0;
        v61 = (char *)v73;
        if (v58 <= 1)
          v58 = 1;
        do
        {
          *(double *)&v61[v60 >> 29] = *(double *)&v57[v60 >> 29] - *(double *)&v59[v60 >> 29];
          v60 += 0x100000000;
          --v58;
        }
        while (v58);
      }
      v62 = (void **)&v90[24 * v55];
      if (v62 != &v73)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v90[24 * v55], (char *)v73, (uint64_t)v74, (v74 - (_BYTE *)v73) >> 3);
      if (v73)
      {
        v74 = v73;
        operator delete(v73);
      }
      v63 = v62[1];
      v64 = v63 - (_BYTE *)*v62;
      if (v63 == *v62)
      {
        v67 = 0.0;
      }
      else
      {
        v65 = 0;
        v66 = v64 >> 3;
        if ((unint64_t)(v64 >> 3) <= 1)
          v66 = 1;
        v67 = 0.0;
        do
        {
          v67 = v67 + *(double *)((char *)*v62 + (v65 >> 29)) * *(double *)((char *)*v56 + (v65 >> 29));
          v65 += 0x100000000;
          --v66;
        }
        while (v66);
      }
      v89[v55] = 1.0 / v67;
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v86, (char *)__p, (uint64_t)v78, (v78 - (_BYTE *)__p) >> 3);
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v84, (char *)v75, (uint64_t)v76, (v76 - (_BYTE *)v75) >> 3);
      if (v75)
      {
        v76 = v75;
        operator delete(v75);
      }
      if (__p)
      {
        v78 = __p;
        operator delete(__p);
      }
      v30 = v79;
    }
    if (v30)
    {
      v80 = v30;
      operator delete(v30);
    }
    v15 = v28;
    if (v34 < 0.0001)
      break;
  }
  *v72 = 0;
  v72[1] = 0;
  v72[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v72, v86, (uint64_t)v87, (v87 - (_BYTE *)v86) >> 3);
  for (k = 0; k != -240; k -= 24)
  {
    v69 = *(void **)&v90[k + 216];
    if (v69)
    {
      *(_QWORD *)&v90[k + 224] = v69;
      operator delete(v69);
    }
  }
  for (m = 0; m != -240; m -= 24)
  {
    v71 = *(void **)&v91[m + 216];
    if (v71)
    {
      *(_QWORD *)&v91[m + 224] = v71;
      operator delete(v71);
    }
  }
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  if (v84)
  {
    v85 = v84;
    operator delete(v84);
  }
  if (v86)
  {
    v87 = v86;
    operator delete(v86);
  }
}

void sub_2083ECD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;

  v46 = 0;
  while (1)
  {
    v47 = *(void **)(&a45 + v46 + 216);
    if (v47)
    {
      *(_QWORD *)(&a45 + v46 + 224) = v47;
      operator delete(v47);
    }
    v46 -= 24;
    if (v46 == -240)
    {
      v48 = 0;
      while (1)
      {
        v49 = *(void **)((char *)&STACK[0x210] + v48 + 216);
        if (v49)
        {
          *(unint64_t *)((char *)&STACK[0x210] + v48 + 224) = (unint64_t)v49;
          operator delete(v49);
        }
        v48 -= 24;
        if (v48 == -240)
        {
          if (__p)
            operator delete(__p);
          if (a29)
            operator delete(a29);
          if (a32)
            operator delete(a32);
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C09D380, MEMORY[0x24BEDAAF0]);
}

void sub_2083ED110(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void Vec::Vec(Vec *this, unint64_t a2, double a3)
{
  double v3;

  v3 = a3;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
  std::vector<double>::resize((uint64_t)this, a2, &v3);
}

void sub_2083ED1AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<double>::__append(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2083ED364(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *crf1df_generate(uint64_t a1, uint64_t a2, int a3, double a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t **v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  char v33;
  unsigned int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  int *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  __int128 v61;
  char *v62;
  uint64_t v64;
  unsigned int *v65;
  int v66;
  int v68;
  int v69;
  uint64_t v70;
  _QWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double *v75;

  v72 = 0;
  v73 = 0;
  v74 = 0;
  v68 = *(_DWORD *)(a2 + 16);
  v71[1] = a8;
  v71[2] = 0;
  v71[0] = a9;
  v14 = (uint64_t **)malloc_type_calloc(1uLL, 0x10uLL, 0x10200403A5D3213uLL);
  v22 = v14;
  v66 = a7;
  if (v14)
  {
    *((_DWORD *)v14 + 2) = 0;
    v23 = rumavl_new((_QWORD *)0x18, (int (__cdecl *)(const void *, const void *, size_t))featureset_comp, 0, 0);
    *v22 = v23;
    if (!v23)
    {
      free(v22);
      v22 = 0;
    }
  }
  logging_progress_start((uint64_t)v71, v15, v16, v17, v18, v19, v20, v21, a1);
  if (v68 >= 1)
  {
    v31 = 0;
    if (a6)
      v32 = a3 < 1;
    else
      v32 = 1;
    v33 = v32;
    do
    {
      v69 = v31;
      v34 = (unsigned int *)dataset_get((_QWORD *)a2, v31);
      v70 = *v34;
      if ((int)v70 >= 1)
      {
        v41 = v34;
        v42 = 0;
        v43 = a3;
        do
        {
          v44 = *((_QWORD *)v41 + 1);
          v45 = *(_DWORD *)(*((_QWORD *)v41 + 2) + 4 * v42);
          if (v43 != a3)
          {
            LODWORD(v72) = 1;
            HIDWORD(v72) = v43;
            LODWORD(v73) = v45;
            v74 = 0x3FF0000000000000;
            featureset_add((uint64_t)v22, (double *)&v72);
          }
          v46 = (int *)(v44 + 16 * v42);
          if (*v46 >= 1)
          {
            v47 = 0;
            v48 = (_QWORD *)(v44 + 16 * v42 + 8);
            do
            {
              LODWORD(v72) = 0;
              v49 = *v48 + 16 * v47;
              HIDWORD(v72) = *(_DWORD *)v49;
              LODWORD(v73) = v45;
              v74 = *(_QWORD *)(v49 + 8);
              featureset_add((uint64_t)v22, (double *)&v72);
              if ((v33 & 1) == 0)
              {
                v50 = 0;
                do
                {
                  LODWORD(v72) = 0;
                  HIDWORD(v72) = *(_DWORD *)(*v48 + 16 * v47);
                  LODWORD(v73) = v50;
                  v74 = 0;
                  featureset_add((uint64_t)v22, (double *)&v72);
                  ++v50;
                }
                while (a3 != v50);
              }
              ++v47;
            }
            while (v47 < *v46);
          }
          ++v42;
          v43 = v45;
        }
        while (v42 != v70);
      }
      logging_progress(v71, 100 * v69 / v68, v35, v36, v37, v38, v39, v40);
      v31 = v69 + 1;
    }
    while (v69 + 1 != v68);
  }
  logging_progress_end(v71, v24, v25, v26, v27, v28, v29, v30, v64);
  if (v66 && a3 >= 1)
  {
    v51 = 0;
    do
    {
      v52 = 0;
      do
      {
        LODWORD(v72) = 1;
        HIDWORD(v72) = v51;
        LODWORD(v73) = v52;
        v74 = 0;
        featureset_add((uint64_t)v22, (double *)&v72);
        ++v52;
      }
      while (a3 != v52);
      ++v51;
    }
    while (v51 != a3);
  }
  v75 = 0;
  v53 = rumavl_node_next(*v22, 0, 1, &v75);
  if (v53)
  {
    v54 = v53;
    v55 = 0;
    v56 = v65;
    do
    {
      if (v75[2] >= a4)
        ++v55;
      v54 = rumavl_node_next(*v22, v54, 1, &v75);
    }
    while (v54);
  }
  else
  {
    v55 = 0;
    v56 = v65;
  }
  v57 = (char *)malloc_type_calloc(v55, 0x18uLL, 0x10000401E56706BuLL);
  if (v57)
  {
    v58 = rumavl_node_next(*v22, 0, 1, &v75);
    if (v58)
    {
      v59 = v58;
      v60 = 0;
      do
      {
        if (v75[2] >= a4)
        {
          v61 = *(_OWORD *)v75;
          v62 = &v57[24 * v60];
          *((double *)v62 + 2) = v75[2];
          *(_OWORD *)v62 = v61;
          ++v60;
        }
        v59 = rumavl_node_next(*v22, v59, 1, &v75);
      }
      while (v59);
    }
  }
  else
  {
    v55 = 0;
  }
  *v56 = v55;
  rumavl_destroy((uint64_t **)*v22);
  free(v22);
  return v57;
}

uint64_t featureset_add(uint64_t a1, double *a2)
{
  uint64_t result;

  result = rumavl_find(*(uint64_t **)a1, (uint64_t)a2);
  if (result)
  {
    *(double *)(result + 16) = a2[2] + *(double *)(result + 16);
  }
  else
  {
    result = rumavl_insert(*(_QWORD *)a1, a2);
    ++*(_DWORD *)(a1 + 8);
  }
  return result;
}

uint64_t crf1df_init_references(void ***a1, void ***a2, uint64_t a3, int a4, int a5, int a6)
{
  uint64_t v7;
  void **v12;
  void **v13;
  void **v14;
  uint64_t v15;
  int *v16;
  int v17;
  void **v18;
  uint64_t v19;
  void **v20;
  void *v21;
  uint64_t v22;
  void **v23;
  void *v24;
  uint64_t v25;
  int *v26;
  int v27;
  void **v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t result;
  void **v32;
  void *v33;
  uint64_t v34;
  void **v35;
  void *v36;

  LODWORD(v7) = a5;
  v12 = (void **)malloc_type_calloc(a5, 0x10uLL, 0x101004082113244uLL);
  if (!v12)
    goto LABEL_35;
  v13 = (void **)malloc_type_calloc(a6, 0x10uLL, 0x101004082113244uLL);
  v14 = v13;
  if (!v13)
  {
LABEL_27:
    if ((int)v7 >= 1)
    {
      v7 = v7;
      v32 = v12 + 1;
      do
      {
        v33 = *v32;
        v32 += 2;
        free(v33);
        --v7;
      }
      while (v7);
    }
    free(v12);
    if (!v14)
    {
      v12 = 0;
      goto LABEL_36;
    }
    if (a6 >= 1)
    {
      v34 = a6;
      v35 = v14 + 1;
      do
      {
        v36 = *v35;
        v35 += 2;
        free(v36);
        --v34;
      }
      while (v34);
    }
    free(v14);
    v12 = 0;
LABEL_35:
    v14 = 0;
LABEL_36:
    result = 0xFFFFFFFFLL;
    goto LABEL_37;
  }
  if (a4 >= 1)
  {
    v15 = a4;
    v16 = (int *)(a3 + 4);
    while (1)
    {
      v17 = *(v16 - 1);
      v18 = v12;
      if (!v17)
        goto LABEL_8;
      if (v17 == 1)
        break;
LABEL_9:
      v16 += 6;
      if (!--v15)
        goto LABEL_10;
    }
    v18 = v13;
LABEL_8:
    ++LODWORD(v18[2 * *v16]);
    goto LABEL_9;
  }
LABEL_10:
  if ((int)v7 >= 1)
  {
    v19 = v7;
    v20 = v12;
    do
    {
      v21 = malloc_type_calloc(*(int *)v20, 4uLL, 0x100004052888210uLL);
      v20[1] = v21;
      if (!v21)
        goto LABEL_27;
      *(_DWORD *)v20 = 0;
      v20 += 2;
    }
    while (--v19);
  }
  if (a6 >= 1)
  {
    v22 = a6;
    v23 = v14;
    do
    {
      v24 = malloc_type_calloc(*(int *)v23, 4uLL, 0x100004052888210uLL);
      v23[1] = v24;
      if (!v24)
        goto LABEL_27;
      *(_DWORD *)v23 = 0;
      v23 += 2;
    }
    while (--v22);
  }
  if (a4 >= 1)
  {
    v25 = 0;
    v26 = (int *)(a3 + 4);
    while (1)
    {
      v27 = *(v26 - 1);
      if (v27 == 1)
        break;
      if (!v27)
      {
        v28 = &v12[2 * *v26];
LABEL_24:
        v29 = v28[1];
        v30 = *(int *)v28;
        *(_DWORD *)v28 = v30 + 1;
        v29[v30] = v25;
      }
      v26 += 6;
      if (a4 == ++v25)
        goto LABEL_26;
    }
    v28 = &v14[2 * *v26];
    goto LABEL_24;
  }
LABEL_26:
  result = 0;
LABEL_37:
  *a1 = v12;
  *a2 = v14;
  return result;
}

uint64_t featureset_comp(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  BOOL v5;
  BOOL v6;
  _BOOL4 v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v2 = (*a1 > *a2) - (*a1 < *a2);
  if (!(_DWORD)v2)
  {
    v3 = a1[1];
    v4 = a2[1];
    v6 = __OFSUB__(v3, v4);
    v5 = v3 - v4 < 0;
    v7 = v3 > v4;
    v8 = v5 ^ v6;
    v2 = (v7 - v8);
    if (!(_DWORD)v2)
    {
      v9 = a1[2];
      v10 = a2[2];
      v6 = __OFSUB__(v9, v10);
      v5 = v9 - v10 < 0;
      v11 = v9 > v10;
      v12 = v5 != v6;
      return (v11 - v12);
    }
  }
  return v2;
}

uint64_t crf1mmw_get_offset_in_file(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 104) + a2;
}

uint64_t crf1mmw_get_offset_from_beginning_of_model(uint64_t a1)
{
  return MEMORY[0x20BD069EC](*(_QWORD *)a1) - *(_DWORD *)(a1 + 104);
}

FILE *crf1mmw_close_file_pointer(FILE *result)
{
  if (LOBYTE(result->_ur))
  {
    result = (FILE *)result->_p;
    if (result)
      return (FILE *)fclose(result);
  }
  return result;
}

uint64_t crf1mmw_initialize_header(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 1179796332;
  *(_QWORD *)(a1 + 20) = 0x66434D4F46;
  *(_DWORD *)(a1 + 64) = 0;
  if (fseek(*(FILE **)a1, 48, 1))
    return 2147483651;
  else
    return 0;
}

char *crf1mmw(const char *a1)
{
  char *v2;
  FILE *v3;

  v2 = (char *)malloc_type_calloc(1uLL, 0x78uLL, 0x10A0040501B4AF5uLL);
  if (v2)
  {
    v3 = fopen(a1, "wb");
    *(_QWORD *)v2 = v3;
    if (!v3
      || (v2[112] = 1,
          *((_QWORD *)v2 + 13) = 0,
          *((_DWORD *)v2 + 3) = 1179796332,
          *(_QWORD *)(v2 + 20) = 0x66434D4F46,
          *((_DWORD *)v2 + 16) = 0,
          fseek(v3, 48, 1)))
    {
      if (v2[112] && *(_QWORD *)v2)
        fclose(*(FILE **)v2);
      free(v2);
      return 0;
    }
  }
  return v2;
}

_BYTE *crf1mmw_from_file_pointer(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;

  if (!a1)
    return 0;
  v2 = malloc_type_calloc(1uLL, 0x78uLL, 0x10A0040501B4AF5uLL);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)v2 = a1;
    v2[112] = 0;
    *((_QWORD *)v2 + 13) = MEMORY[0x20BD069EC](a1);
    *((_DWORD *)v3 + 3) = 1179796332;
    *(_QWORD *)(v3 + 20) = 0x66434D4F46;
    *((_DWORD *)v3 + 16) = 0;
    if (fseek(*(FILE **)v3, 48, 1))
    {
      if (v3[112] && *(_QWORD *)v3)
        fclose(*(FILE **)v3);
      free(v3);
      return 0;
    }
  }
  return v3;
}

size_t write_header_to_file(FILE *a1, _DWORD *a2)
{
  int __ptr;

  write_uint8_array(a1, (uint64_t)a2);
  __ptr = a2[1];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  write_uint8_array(a1, (uint64_t)(a2 + 2));
  __ptr = a2[3];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[4];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[5];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[6];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[7];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[8];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[9];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[10];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[11];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[12];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  __ptr = a2[13];
  return fwrite(&__ptr, 4uLL, 1uLL, a1);
}

size_t write_uint8_array(FILE *__stream, uint64_t a2)
{
  uint64_t i;
  size_t result;
  char __ptr;

  for (i = 0; i != 4; ++i)
  {
    __ptr = *(_BYTE *)(a2 + i);
    result = fwrite(&__ptr, 1uLL, 1uLL, __stream);
  }
  return result;
}

uint64_t crf1dmw_close(unsigned int *a1)
{
  FILE *v2;
  int v3;
  uint64_t v4;
  FILE *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(FILE **)a1;
  v3 = MEMORY[0x20BD069EC](*(_QWORD *)a1);
  v4 = *((_QWORD *)a1 + 13);
  a1[4] = v3 - v4;
  if (!fseek(v2, v4, 0))
  {
    write_header_to_file(v2, a1 + 3);
    if (!ferror(v2))
    {
      fseek(v2, *((_QWORD *)a1 + 13) + a1[4], 0);
      if (!*((_BYTE *)a1 + 112))
      {
        v7 = 0;
        goto LABEL_7;
      }
      v6 = 0;
      v7 = 0;
      v5 = *(FILE **)a1;
      if (!*(_QWORD *)a1)
        goto LABEL_7;
LABEL_5:
      fclose(v5);
      v7 = v6;
      goto LABEL_7;
    }
  }
  if (!*((_BYTE *)a1 + 112))
  {
    v7 = 1;
    goto LABEL_7;
  }
  v5 = *(FILE **)a1;
  v6 = 1;
  v7 = 1;
  if (*(_QWORD *)a1)
    goto LABEL_5;
LABEL_7:
  free(a1);
  return v7;
}

uint64_t crf1dmw_open_labels(uint64_t a1, int a2)
{
  uint64_t result;
  FILE **v5;

  if (*(_DWORD *)(a1 + 8))
    return 1;
  *(_DWORD *)(a1 + 44) = MEMORY[0x20BD069EC](*(_QWORD *)a1) - *(_DWORD *)(a1 + 104);
  v5 = cqdb_writer(*(FILE **)a1, 0);
  *(_QWORD *)(a1 + 72) = v5;
  if (!v5)
  {
    *(_DWORD *)(a1 + 44) = 0;
    return 1;
  }
  result = 0;
  *(_DWORD *)(a1 + 8) = 1;
  *(_DWORD *)(a1 + 32) = a2;
  return result;
}

uint64_t crf1dmw_close_labels(uint64_t a1)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return 1;
  result = cqdb_writer_close(*(_QWORD *)(a1 + 72));
  if ((_DWORD)result)
    return 1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 8) = 0;
  return result;
}

BOOL crf1dmw_put_label(uint64_t a1, unsigned int a2, char *__s)
{
  return *(_DWORD *)(a1 + 8) != 1 || cqdb_writer_put(*(_QWORD *)(a1 + 72), __s, a2) != 0;
}

uint64_t crf1dmw_set_no_labels(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

uint64_t crf1dmw_open_attrs(uint64_t a1, int a2)
{
  uint64_t result;
  FILE **v5;

  if (*(_DWORD *)(a1 + 8))
    return 1;
  *(_DWORD *)(a1 + 48) = MEMORY[0x20BD069EC](*(_QWORD *)a1) - *(_DWORD *)(a1 + 104);
  v5 = cqdb_writer(*(FILE **)a1, 0);
  *(_QWORD *)(a1 + 72) = v5;
  if (!v5)
  {
    *(_DWORD *)(a1 + 48) = 0;
    return 1;
  }
  result = 0;
  *(_DWORD *)(a1 + 8) = 2;
  *(_DWORD *)(a1 + 36) = a2;
  return result;
}

uint64_t crf1dmw_close_attrs(uint64_t a1)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return 1;
  result = cqdb_writer_close(*(_QWORD *)(a1 + 72));
  if ((_DWORD)result)
    return 1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 8) = 0;
  return result;
}

BOOL crf1dmw_put_attr(uint64_t a1, unsigned int a2, char *__s)
{
  return *(_DWORD *)(a1 + 8) != 2 || cqdb_writer_put(*(_QWORD *)(a1 + 72), __s, a2) != 0;
}

uint64_t crf1dmw_open_labelrefs(_QWORD *a1, int a2)
{
  uint64_t result;
  FILE *v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  int v10;
  char __ptr;

  if (*((_DWORD *)a1 + 2))
    return 2147483652;
  v5 = (FILE *)*a1;
  v6 = 4 * a2 + 12;
  v7 = malloc_type_calloc(v6, 1uLL, 0x2D6936BFuLL);
  if (!v7)
    return 2147483649;
  v8 = v7;
  v9 = MEMORY[0x20BD069EC](v5);
  if ((v9 & 3) != 0)
  {
    v10 = v9 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, v5);
    }
    while ((v10++ & 3) != 0);
  }
  *((_DWORD *)a1 + 14) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 26);
  fseek(v5, v6, 1);
  result = 0;
  *(_QWORD *)v8 = 1179797068;
  v8[2] = a2;
  a1[11] = v8;
  *((_DWORD *)a1 + 2) = 3;
  return result;
}

uint64_t crf1dmw_close_labelrefs(_QWORD *a1)
{
  FILE *v2;
  _DWORD *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t result;
  int __ptr;
  int v11;
  int v12;

  if (*((_DWORD *)a1 + 2) != 3)
    return 2147483652;
  v2 = (FILE *)*a1;
  v3 = (_DWORD *)a1[11];
  v4 = *((unsigned int *)a1 + 14);
  v5 = MEMORY[0x20BD069EC](*a1);
  v6 = a1[13];
  v7 = v5 - v6;
  v3[1] = v5 - v6 - v4;
  fseek(v2, v6 + v4, 0);
  write_uint8_array(v2, (uint64_t)v3);
  __ptr = v3[1];
  fwrite(&__ptr, 4uLL, 1uLL, v2);
  v11 = v3[2];
  fwrite(&v11, 4uLL, 1uLL, v2);
  if (v3[2])
  {
    v8 = 0;
    do
    {
      v12 = v3[v8 + 3];
      fwrite(&v12, 4uLL, 1uLL, v2);
      ++v8;
    }
    while (v8 < v3[2]);
  }
  fseek(v2, a1[13] + v7, 0);
  free(v3);
  result = 0;
  a1[11] = 0;
  *((_DWORD *)a1 + 2) = 0;
  return result;
}

uint64_t crf1dmw_put_labelref(_QWORD *a1, int a2, unsigned int *a3, uint64_t a4)
{
  FILE *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  int __ptr;
  int v16;

  if (*((_DWORD *)a1 + 2) != 3)
    return 2147483652;
  v6 = (FILE *)*a1;
  v7 = a1[11];
  *(_DWORD *)(v7 + 4 * a2 + 12) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 26);
  v8 = *a3;
  if ((int)v8 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = (int *)*((_QWORD *)a3 + 1);
    do
    {
      v11 = *v10++;
      v9 += *(_DWORD *)(a4 + 4 * v11) >= 0;
      --v8;
    }
    while (v8);
  }
  __ptr = v9;
  fwrite(&__ptr, 4uLL, 1uLL, v6);
  v13 = *a3;
  if ((int)*a3 >= 1)
  {
    v14 = 0;
    do
    {
      if ((*(_DWORD *)(a4 + 4 * *(int *)(*((_QWORD *)a3 + 1) + 4 * v14)) & 0x80000000) == 0)
      {
        v16 = *(_DWORD *)(a4 + 4 * *(int *)(*((_QWORD *)a3 + 1) + 4 * v14));
        fwrite(&v16, 4uLL, 1uLL, v6);
        v13 = *a3;
      }
      ++v14;
    }
    while (v14 < v13);
  }
  return 0;
}

uint64_t crf1dmw_open_attrrefs(_QWORD *a1, int a2)
{
  uint64_t result;
  FILE *v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  int v10;
  char __ptr;

  if (*((_DWORD *)a1 + 2))
    return 2147483652;
  v5 = (FILE *)*a1;
  v6 = 4 * a2 + 12;
  v7 = malloc_type_calloc(v6, 1uLL, 0x5B280B74uLL);
  if (!v7)
    return 2147483649;
  v8 = v7;
  v9 = MEMORY[0x20BD069EC](v5);
  if ((v9 & 3) != 0)
  {
    v10 = v9 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, v5);
    }
    while ((v10++ & 3) != 0);
  }
  *((_DWORD *)a1 + 15) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 26);
  fseek(v5, v6, 1);
  result = 0;
  *(_QWORD *)v8 = 1179797057;
  v8[2] = a2;
  a1[11] = v8;
  *((_DWORD *)a1 + 2) = 4;
  return result;
}

uint64_t crf1dmw_close_attrrefs(_QWORD *a1)
{
  FILE *v2;
  _DWORD *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t result;
  int __ptr;
  int v11;
  int v12;

  if (*((_DWORD *)a1 + 2) != 4)
    return 2147483652;
  v2 = (FILE *)*a1;
  v3 = (_DWORD *)a1[11];
  v4 = *((unsigned int *)a1 + 15);
  v5 = MEMORY[0x20BD069EC](*a1);
  v6 = a1[13];
  v7 = v5 - v6;
  v3[1] = v5 - v6 - v4;
  fseek(v2, v6 + v4, 0);
  write_uint8_array(v2, (uint64_t)v3);
  __ptr = v3[1];
  fwrite(&__ptr, 4uLL, 1uLL, v2);
  v11 = v3[2];
  fwrite(&v11, 4uLL, 1uLL, v2);
  if (v3[2])
  {
    v8 = 0;
    do
    {
      v12 = v3[v8 + 3];
      fwrite(&v12, 4uLL, 1uLL, v2);
      ++v8;
    }
    while (v8 < v3[2]);
  }
  fseek(v2, a1[13] + v7, 0);
  free(v3);
  result = 0;
  a1[11] = 0;
  *((_DWORD *)a1 + 2) = 0;
  return result;
}

uint64_t crf1dmw_put_attrref(_QWORD *a1, int a2, unsigned int *a3, uint64_t a4)
{
  FILE *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  int __ptr;
  int v16;

  if (*((_DWORD *)a1 + 2) != 4)
    return 2147483652;
  v6 = (FILE *)*a1;
  v7 = a1[11];
  *(_DWORD *)(v7 + 4 * a2 + 12) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 26);
  v8 = *a3;
  if ((int)v8 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = (int *)*((_QWORD *)a3 + 1);
    do
    {
      v11 = *v10++;
      v9 += *(_DWORD *)(a4 + 4 * v11) >= 0;
      --v8;
    }
    while (v8);
  }
  __ptr = v9;
  fwrite(&__ptr, 4uLL, 1uLL, v6);
  v13 = *a3;
  if ((int)*a3 >= 1)
  {
    v14 = 0;
    do
    {
      if ((*(_DWORD *)(a4 + 4 * *(int *)(*((_QWORD *)a3 + 1) + 4 * v14)) & 0x80000000) == 0)
      {
        v16 = *(_DWORD *)(a4 + 4 * *(int *)(*((_QWORD *)a3 + 1) + 4 * v14));
        fwrite(&v16, 4uLL, 1uLL, v6);
        v13 = *a3;
      }
      ++v14;
    }
    while (v14 < v13);
  }
  return 0;
}

uint64_t crf1dmw_set_no_attributes(uint64_t result, int a2)
{
  *(_DWORD *)(result + 36) = a2;
  *(_DWORD *)(result + 48) = 0;
  return result;
}

uint64_t crf1dmw_open_features(_QWORD *a1)
{
  uint64_t result;
  FILE *v3;
  _DWORD *v4;
  _DWORD *v5;

  if (*((_DWORD *)a1 + 2))
    return 2147483652;
  v3 = (FILE *)*a1;
  v4 = malloc_type_calloc(0xCuLL, 1uLL, 0x9A5400B7uLL);
  if (!v4)
    return 2147483649;
  v5 = v4;
  *((_DWORD *)a1 + 10) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 26);
  fseek(v3, 12, 1);
  result = 0;
  *v5 = 1413563718;
  a1[12] = v5;
  *((_DWORD *)a1 + 2) = 5;
  return result;
}

uint64_t crf1dmw_close_features(_QWORD *a1)
{
  uint64_t v2;
  _DWORD *v3;
  FILE *v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  int __ptr;
  int v10;

  if (*((_DWORD *)a1 + 2) != 5)
    return 2147483652;
  v2 = *((unsigned int *)a1 + 10);
  v3 = (_DWORD *)a1[12];
  v4 = (FILE *)*a1;
  v5 = MEMORY[0x20BD069EC](*a1);
  v6 = a1[13];
  v7 = v5 - v6;
  v3[1] = v5 - v6 - v2;
  fseek(v4, v6 + v2, 0);
  write_uint8_array(v4, (uint64_t)v3);
  __ptr = v3[1];
  fwrite(&__ptr, 4uLL, 1uLL, v4);
  v10 = v3[2];
  fwrite(&v10, 4uLL, 1uLL, v4);
  fseek(v4, a1[13] + v7, 0);
  free(v3);
  result = 0;
  a1[12] = 0;
  *((_DWORD *)a1 + 2) = 0;
  return result;
}

uint64_t crf1dmw_put_feature(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  FILE *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  result = 2147483652;
  if (*(_DWORD *)(a1 + 8) == 5)
  {
    v5 = *(_QWORD *)(a1 + 96);
    if (*(_DWORD *)(v5 + 8) == a2)
    {
      v7 = *(FILE **)a1;
      LODWORD(v8[0]) = *(_DWORD *)a3;
      fwrite(v8, 4uLL, 1uLL, v7);
      LODWORD(v8[0]) = *(_DWORD *)(a3 + 4);
      fwrite(v8, 4uLL, 1uLL, v7);
      LODWORD(v8[0]) = *(_DWORD *)(a3 + 8);
      fwrite(v8, 4uLL, 1uLL, v7);
      v8[0] = *(_QWORD *)(a3 + 16);
      fwrite(v8, 1uLL, 8uLL, v7);
      result = 0;
      ++*(_DWORD *)(v5 + 8);
    }
  }
  return result;
}

uint64_t read_attributes(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int v4;
  uint64_t result;

  v2 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 36);
  if (!(_DWORD)v2)
  {
    v4 = 1;
    goto LABEL_5;
  }
  v3 = cqdb_reader(*(_QWORD *)(a1 + 16) + v2, (*(_DWORD *)(a1 + 24) - v2));
  *(_QWORD *)(a1 + 64) = v3;
  if (v3)
  {
    v4 = 0;
LABEL_5:
    result = 0;
    *(_DWORD *)(a1 + 4) = v4;
    return result;
  }
  return 1;
}

void *create_buffer_from_file(FILE *a1, _DWORD *a2)
{
  void *v4;

  if (!a1)
    return 0;
  fseek(a1, 0, 2);
  *a2 = MEMORY[0x20BD069EC](a1);
  fseek(a1, 0, 0);
  v4 = malloc_type_malloc(*a2, 0x7CC69E4uLL);
  if (fread(v4, 1uLL, *a2, a1) != *a2)
  {
    free(v4);
    return 0;
  }
  return v4;
}

BOOL read_header_from_buffer(_DWORD *a1, char *__s1)
{
  uint64_t i;
  int v5;
  uint64_t v6;

  for (i = 0; i != 4; ++i)
    __s1[i] = *((_BYTE *)a1 + i);
  v5 = strncmp(__s1, "lCRF", 4uLL);
  if (!v5)
  {
    v6 = 0;
    *((_DWORD *)__s1 + 1) = a1[1];
    do
    {
      __s1[v6 + 8] = *((_BYTE *)a1 + v6 + 8);
      ++v6;
    }
    while (v6 != 4);
    *((_DWORD *)__s1 + 3) = a1[3];
    *((_DWORD *)__s1 + 4) = a1[4];
    *((_DWORD *)__s1 + 5) = a1[5];
    *((_DWORD *)__s1 + 6) = a1[6];
    *((_DWORD *)__s1 + 7) = a1[7];
    *((_DWORD *)__s1 + 8) = a1[8];
    *((_DWORD *)__s1 + 9) = a1[9];
    *((_DWORD *)__s1 + 10) = a1[10];
    *((_DWORD *)__s1 + 11) = a1[11];
    *((_DWORD *)__s1 + 12) = a1[12];
    *((_DWORD *)__s1 + 13) = a1[13];
  }
  return v5 == 0;
}

uint64_t crf1dm_initialize_header(uint64_t a1)
{
  uint64_t v2;
  int v4;
  char *v5;
  char *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;

  if (*(_DWORD *)(a1 + 24) < 0x10u)
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  if (strncmp((const char *)v2, "lCRF", 4uLL))
    return 0;
  v4 = *(_DWORD *)(v2 + 12);
  *(_DWORD *)a1 = v4;
  switch(v4)
  {
    case 210:
      *(_QWORD *)(a1 + 32) = 0;
      *(_QWORD *)(a1 + 40) = 0;
      v6 = (char *)malloc_type_calloc(1uLL, 0x37uLL, 0x1000040DA929A6CuLL);
      *(_QWORD *)(a1 + 48) = v6;
      v7 = *(__int128 **)(a1 + 16);
      v9 = v7[1];
      v8 = v7[2];
      v10 = *v7;
      *(_QWORD *)(v6 + 47) = *(_QWORD *)((char *)v7 + 47);
      *(_OWORD *)v6 = v10;
      *((_OWORD *)v6 + 1) = v9;
      *((_OWORD *)v6 + 2) = v8;
      break;
    case 200:
      *(_QWORD *)(a1 + 32) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      v11 = malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL);
      *(_QWORD *)(a1 + 40) = v11;
      v12 = *(__int128 **)(a1 + 16);
      v13 = *v12;
      v14 = v12[2];
      v11[1] = v12[1];
      v11[2] = v14;
      *v11 = v13;
      break;
    case 102:
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      v5 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004021716A34uLL);
      *(_QWORD *)(a1 + 32) = v5;
      if (!read_header_from_buffer(*(_DWORD **)(a1 + 16), v5))
        return 0;
      break;
    default:
      return 0;
  }
  return 1;
}

uint64_t crf1dm_instantiate_internal(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 16))
    {
      result = crf1dm_initialize_header(result);
      if ((_DWORD)result)
      {
        if (*(_DWORD *)v1 == 102)
        {
          v2 = *(unsigned int *)(*(_QWORD *)(v1 + 32) + 32);
          *(_QWORD *)(v1 + 56) = cqdb_reader(*(_QWORD *)(v1 + 16) + v2, (*(_DWORD *)(v1 + 24) - v2));
          read_attributes(v1);
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_DWORD *crf1dm_new(const char *a1)
{
  _DWORD *v2;
  FILE *v3;
  FILE *v4;
  void *buffer_from_file;

  v2 = malloc_type_calloc(1uLL, 0x58uLL, 0x10B00405FED4E8AuLL);
  if (v2)
  {
    v3 = fopen(a1, "rb");
    if (!v3
      || (v4 = v3,
          buffer_from_file = create_buffer_from_file(v3, v2 + 6),
          *((_QWORD *)v2 + 1) = buffer_from_file,
          *((_QWORD *)v2 + 2) = buffer_from_file,
          *((_BYTE *)v2 + 80) = 1,
          fclose(v4),
          (crf1dm_instantiate_internal((uint64_t)v2) & 1) == 0))
    {
      crf1dm_close(v2);
      return 0;
    }
  }
  return v2;
}

void crf1dm_close(_QWORD *a1)
{
  void **v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v2 = (void **)a1[7];
    if (v2)
      cqdb_delete(v2);
    v3 = (void **)a1[8];
    if (v3 && !*((_DWORD *)a1 + 1))
      cqdb_delete(v3);
    v4 = (void *)a1[4];
    if (v4)
      free(v4);
    v5 = (void *)a1[5];
    if (v5)
      free(v5);
    v6 = (void *)a1[6];
    if (v6)
      free(v6);
    v7 = (void *)a1[1];
    if (v7)
    {
      if (*((_BYTE *)a1 + 80))
        free(v7);
    }
    free(a1);
  }
}

_QWORD *crf1dm_new_from_buffer(uint64_t a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;

  if (!a1)
    return 0;
  v4 = malloc_type_calloc(1uLL, 0x58uLL, 0x10B00405FED4E8AuLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = a1;
    v4[2] = a1;
    *((_DWORD *)v4 + 6) = a2;
    *((_BYTE *)v4 + 80) = 0;
    if ((crf1dm_instantiate_internal((uint64_t)v4) & 1) == 0)
    {
      crf1dm_close(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t crf1dm_get_num_attrs@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  unsigned int *v3;

  v2 = *a1;
  if (*a1 == 210)
  {
    v3 = (unsigned int *)(*((_QWORD *)a1 + 6) + 35);
    return *v3;
  }
  if (v2 == 200)
  {
    v3 = (unsigned int *)(*((_QWORD *)a1 + 5) + 28);
    return *v3;
  }
  if (v2 == 102)
  {
    v3 = (unsigned int *)(*((_QWORD *)a1 + 4) + 24);
    return *v3;
  }
  return a2;
}

uint64_t crf1dm_get_num_labels@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v2;

  v2 = *a1;
  if (*a1 == 210)
    return *(unsigned __int8 *)(*((_QWORD *)a1 + 6) + 34);
  if (v2 == 200)
    return *(unsigned int *)(*((_QWORD *)a1 + 5) + 24);
  if (v2 == 102)
    return *(unsigned int *)(*((_QWORD *)a1 + 4) + 20);
  return a2;
}

uint64_t crf1dm_to_label(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return cqdb_to_string(result, a2);
  return result;
}

uint64_t crf1dm_to_lid(uint64_t a1, char *a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 56);
  if (v2)
    return cqdb_to_id(v2, a2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t crf1dm_to_aid(uint64_t a1, char *a2)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(a1 + 64);
  if (v3 && !*(_DWORD *)(a1 + 4))
    return cqdb_to_id(v3, a2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t crf1dm_to_attr(uint64_t a1, unsigned int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 64);
  if (v3 && !*(_DWORD *)(a1 + 4))
    return cqdb_to_string(v3, a2);
  else
    return 0;
}

uint64_t crf1dm_get_labelref(uint64_t a1, int a2, uint64_t a3)
{
  _DWORD *v3;

  v3 = (_DWORD *)(*(_QWORD *)(a1 + 16)
                + *(unsigned int *)(*(_QWORD *)(a1 + 16) + *(unsigned int *)(*(_QWORD *)(a1 + 32) + 44) + 4 * a2 + 12));
  *(_DWORD *)a3 = *v3;
  *(_QWORD *)(a3 + 8) = v3 + 1;
  return 0;
}

uint64_t crf1dm_get_attrref(uint64_t a1, int a2, uint64_t a3)
{
  _DWORD *v3;

  v3 = (_DWORD *)(*(_QWORD *)(a1 + 16)
                + *(unsigned int *)(*(_QWORD *)(a1 + 16) + *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48) + 4 * a2 + 12));
  *(_DWORD *)a3 = *v3;
  *(_QWORD *)(a3 + 8) = v3 + 1;
  return 0;
}

uint64_t crf1dm_get_featureid(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 8) + 4 * a2);
}

uint64_t crf1dm_get_feature(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16) + (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) + 20 * a2 + 12);
  *(_DWORD *)a3 = *(_DWORD *)v3;
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(v3 + 4);
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(v3 + 8);
  *(_QWORD *)(a3 + 16) = *(_QWORD *)(v3 + 12);
  return 0;
}

uint64_t crf1dm_dump(uint64_t a1, FILE *__stream)
{
  unsigned __int8 *v4;
  unsigned int v5;
  const char *v6;
  unsigned int v7;
  const char *v8;
  unsigned int v9;
  unsigned int i;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  const char *v17;
  unsigned int v18;
  unsigned int j;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v29;
  uint64_t v30;
  double v31;

  v4 = *(unsigned __int8 **)(a1 + 32);
  fwrite("FILEHEADER = {\n", 0xFuLL, 1uLL, __stream);
  fprintf(__stream, "  magic: %c%c%c%c\n", *v4, v4[1], v4[2], v4[3]);
  fprintf(__stream, "  size: %d\n", *((_DWORD *)v4 + 1));
  fprintf(__stream, "  type: %c%c%c%c\n", v4[8], v4[9], v4[10], v4[11]);
  fprintf(__stream, "  version: %d\n", *((_DWORD *)v4 + 3));
  fprintf(__stream, "  num_features: %d\n", *((_DWORD *)v4 + 4));
  fprintf(__stream, "  num_labels: %d\n", *((_DWORD *)v4 + 5));
  fprintf(__stream, "  num_attrs: %d\n", *((_DWORD *)v4 + 6));
  fprintf(__stream, "  off_features: 0x%X\n", *((_DWORD *)v4 + 7));
  fprintf(__stream, "  off_labels: 0x%X\n", *((_DWORD *)v4 + 8));
  fprintf(__stream, "  off_attrs: 0x%X\n", *((_DWORD *)v4 + 9));
  fprintf(__stream, "  off_labelrefs: 0x%X\n", *((_DWORD *)v4 + 11));
  fprintf(__stream, "  off_attrrefs: 0x%X\n", *((_DWORD *)v4 + 12));
  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("LABELS = {\n", 0xBuLL, 1uLL, __stream);
  if (*((_DWORD *)v4 + 5))
  {
    v5 = 0;
    do
    {
      v6 = *(const char **)(a1 + 56);
      if (v6)
        v6 = (const char *)cqdb_to_string((uint64_t)v6, v5);
      fprintf(__stream, "  %5d: %s\n", v5++, v6);
    }
    while (v5 < *((_DWORD *)v4 + 5));
  }
  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("ATTRIBUTES = {\n", 0xFuLL, 1uLL, __stream);
  if (*((_DWORD *)v4 + 6))
  {
    v7 = 0;
    do
    {
      v8 = *(const char **)(a1 + 64);
      if (v8)
      {
        if (*(_DWORD *)(a1 + 4))
          v8 = 0;
        else
          v8 = (const char *)cqdb_to_string((uint64_t)v8, v7);
      }
      fprintf(__stream, "  %5d: %s\n", v7++, v8);
    }
    while (v7 < *((_DWORD *)v4 + 6));
  }
  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("TRANSITIONS = {\n", 0x10uLL, 1uLL, __stream);
  v9 = *((_DWORD *)v4 + 5);
  if (v9)
  {
    for (i = 0; i < v9; ++i)
    {
      v11 = *(_QWORD *)(a1 + 16);
      v12 = *(unsigned int *)(v11 + *(unsigned int *)(*(_QWORD *)(a1 + 32) + 44) + 4 * (int)i + 12);
      v13 = (int *)(v11 + v12 + 4);
      v14 = *(unsigned int *)(v11 + v12);
      if ((int)v14 >= 1)
      {
        do
        {
          v29 = 0;
          v30 = 0;
          v31 = 0.0;
          v15 = *v13++;
          crf1dm_get_feature(a1, v15, (uint64_t)&v29);
          v16 = *(const char **)(a1 + 56);
          if (v16)
          {
            v17 = (const char *)cqdb_to_string((uint64_t)v16, HIDWORD(v29));
            v16 = *(const char **)(a1 + 56);
            if (v16)
              v16 = (const char *)cqdb_to_string((uint64_t)v16, v30);
          }
          else
          {
            v17 = 0;
          }
          fprintf(__stream, "  (%d) %s --> %s: %f\n", v29, v17, v16, v31);
          --v14;
        }
        while (v14);
        v9 = *((_DWORD *)v4 + 5);
      }
    }
  }
  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("STATE_FEATURES = {\n", 0x13uLL, 1uLL, __stream);
  v18 = *((_DWORD *)v4 + 6);
  if (v18)
  {
    for (j = 0; j < v18; ++j)
    {
      v20 = *(_QWORD *)(a1 + 16);
      v21 = *(unsigned int *)(v20 + *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48) + 4 * (int)j + 12);
      v22 = (int *)(v20 + v21 + 4);
      v23 = *(unsigned int *)(v20 + v21);
      if ((int)v23 >= 1)
      {
        do
        {
          v29 = 0;
          v30 = 0;
          v31 = 0.0;
          v24 = *v22++;
          crf1dm_get_feature(a1, v24, (uint64_t)&v29);
          v25 = *(_QWORD *)(a1 + 64);
          if (v25 && !*(_DWORD *)(a1 + 4))
            v26 = (const char *)cqdb_to_string(v25, HIDWORD(v29));
          else
            v26 = 0;
          v27 = *(const char **)(a1 + 56);
          if (v27)
            v27 = (const char *)cqdb_to_string((uint64_t)v27, v30);
          fprintf(__stream, "  (%d) %s --> %s: %f\n", v29, v26, v27, v31);
          --v23;
        }
        while (v23);
        v18 = *((_DWORD *)v4 + 6);
      }
    }
  }
  fwrite("}\n", 2uLL, 1uLL, __stream);
  return fputc(10, __stream);
}

uint64_t crf1dm_get_version(unsigned int *a1)
{
  return *a1;
}

uint64_t crf1dm_get_number_of_labels(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 20);
}

uint64_t crf1dm_get_number_of_attributes(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t crf1dm_initialize_transition_scores(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 210)
  {
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(unsigned __int8 *)(v16 + 34);
    if (*(_BYTE *)(v16 + 34))
    {
      v18 = 0;
      v19 = (char *)(*(_QWORD *)(a1 + 16) + *(unsigned int *)(v16 + 39));
      do
      {
        memcpy((void *)(*(_QWORD *)(a2 + 32) + 8 * *(_DWORD *)(a2 + 4) * (int)v18++), v19, 8 * v17);
        v19 += 8 * v17;
      }
      while (v17 != v18);
    }
  }
  else if (v4 == 200)
  {
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(unsigned int *)(v20 + 24);
    if ((int)v21 >= 1)
    {
      v22 = 0;
      v23 = (char *)(*(_QWORD *)(a1 + 16) + *(unsigned int *)(v20 + 32));
      do
      {
        memcpy((void *)(*(_QWORD *)(a2 + 32) + 8 * v22 * *(int *)(a2 + 4)), v23, 8 * v21);
        ++v22;
        v23 += 8 * v21;
      }
      while (v21 != v22);
    }
  }
  else if (v4 == 102)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(unsigned int *)(v5 + 20);
    v25 = 0;
    v26 = 0;
    v27 = 0;
    if ((int)v6 >= 1)
    {
      v7 = 0;
      v8 = *(_QWORD *)(a2 + 32);
      v9 = *(int *)(a2 + 4);
      v10 = *(_QWORD *)(a1 + 16);
      v11 = v10 + *(unsigned int *)(v5 + 44) + 12;
      do
      {
        v12 = *(unsigned int *)(v11 + 4 * v7);
        v13 = (int *)(v10 + v12 + 4);
        v14 = *(unsigned int *)(v10 + v12);
        if ((int)v14 >= 1)
        {
          do
          {
            v15 = *v13++;
            crf1dm_get_feature(a1, v15, (uint64_t)&v25);
            *(_QWORD *)(v8 + 8 * v7 * v9 + 8 * v26) = v27;
            --v14;
          }
          while (v14);
        }
        ++v7;
      }
      while (v7 != v6);
    }
  }
  return 0;
}

uint64_t get_quantized_weight(double a1, double a2, double a3, double a4)
{
  if (a1 <= a3)
    return 0;
  if (a1 >= a4)
    return 0xFFFFLL;
  return (int)rint((a1 - a3) / a2);
}

double get_unquantized_weight(unsigned int a1, double a2, double a3)
{
  return a3 + (double)a1 * a2;
}

uint64_t crf1dm_initialize_state_scores(uint64_t a1, uint64_t a2, unsigned int *a3, double a4, double a5, double a6)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  double v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  unsigned __int8 *v38;
  unsigned int v39;
  unsigned int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double *v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;

  v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 210)
  {
    v20 = *(_QWORD *)(a1 + 48);
    if (!v20)
      crf1dm_initialize_state_scores_cold_2();
    v21 = *a3;
    if ((int)v21 >= 1)
    {
      v22 = 0;
      v23 = *(_QWORD *)(a1 + 16);
      v24 = v23 + *(unsigned int *)(v20 + 47);
      v25 = v23 + *(unsigned int *)(v20 + 51);
      v26 = *((_QWORD *)a3 + 1);
      v27 = *(_QWORD *)(a2 + 24);
      v28 = *(int *)(a2 + 4);
      v29 = *(unsigned int *)(v20 + 43) + v23 + 2;
      do
      {
        v30 = *(unsigned int *)(v26 + 16 * v22);
        if ((int)v30 >= 1)
        {
          v31 = 0;
          v32 = v27 + 8 * v22 * v28;
          v33 = *(_QWORD *)(v26 + 16 * v22 + 8);
          do
          {
            v34 = *(int *)(v33 + 16 * v31);
            v35 = *(unsigned __int8 *)(v24 + v34);
            if (*(_BYTE *)(v24 + v34))
            {
              v36 = *(float *)(v20 + 16);
              v37 = *(float *)(v20 + 20);
              v38 = (unsigned __int8 *)(v29 + 3 * *(unsigned int *)(v25 + 4 * v34));
              do
              {
                LOWORD(a6) = *((_WORD *)v38 - 1);
                v39 = *v38;
                v38 += 3;
                a6 = *(double *)(v32 + 8 * v39) + v37 + (double)*(unint64_t *)&a6 * v36;
                *(double *)(v32 + 8 * v39) = a6;
                --v35;
              }
              while (v35);
            }
            ++v31;
          }
          while (v31 != v30);
        }
        ++v22;
      }
      while (v22 != v21);
    }
  }
  else if (v7 == 200)
  {
    v40 = *(unsigned int **)(a1 + 40);
    if (!v40)
      crf1dm_initialize_state_scores_cold_1();
    v41 = *a3;
    if ((int)v41 >= 1)
    {
      v42 = 0;
      v43 = *(_QWORD *)(a1 + 16);
      v44 = v40[9];
      v45 = v43 + v40[10];
      v46 = v43 + v40[11];
      v47 = *((_QWORD *)a3 + 1);
      v48 = *(_QWORD *)(a2 + 24);
      v49 = *(int *)(a2 + 4);
      v50 = v44 + v43 + 8;
      do
      {
        v51 = *(unsigned int *)(v47 + 16 * v42);
        if ((int)v51 >= 1)
        {
          v52 = 0;
          v53 = *(_QWORD *)(v47 + 16 * v42 + 8);
          do
          {
            v54 = (double *)(v53 + 16 * v52);
            v55 = *(int *)v54;
            v56 = *(unsigned int *)(v45 + 4 * v55);
            if ((_DWORD)v56)
            {
              v57 = v54[1];
              v58 = (double *)(v50 + 12 * *(unsigned int *)(v46 + 4 * v55));
              do
              {
                *(double *)(v48 + 8 * v42 * v49 + 8 * *(unsigned int *)v58) = *(double *)(v48
                                                                                          + 8 * v42 * v49
                                                                                          + 8 * *(unsigned int *)v58)
                                                                              + *(v58 - 1) * v57;
                v58 = (double *)((char *)v58 + 12);
                --v56;
              }
              while (v56);
            }
            ++v52;
          }
          while (v52 != v51);
        }
        ++v42;
      }
      while (v42 != v41);
    }
  }
  else if (v7 == 102)
  {
    v62 = *a3;
    if ((int)v62 >= 1)
    {
      v8 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0.0;
      v63 = *((_QWORD *)a3 + 1);
      v60 = *(int *)(a2 + 4);
      v61 = *(_QWORD *)(a2 + 24);
      do
      {
        v64 = v8;
        v9 = *(unsigned int *)(v63 + 16 * v8);
        if ((int)v9 >= 1)
        {
          v10 = 0;
          v11 = *(_QWORD *)(a1 + 16);
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(_QWORD *)(v63 + 16 * v8 + 8);
          do
          {
            v14 = (double *)(v13 + 16 * v10);
            v15 = *(unsigned int *)(v11 + 12 + *(unsigned int *)(v12 + 48) + 4 * *(int *)v14);
            v17 = (int *)(v11 + v15 + 4);
            v16 = *(unsigned int *)(v11 + v15);
            if ((int)v16 >= 1)
            {
              v18 = v14[1];
              do
              {
                v19 = *v17++;
                crf1dm_get_feature(a1, v19, (uint64_t)&v65);
                *(double *)(v61 + 8 * v64 * v60 + 8 * (int)v66) = *(double *)(v61 + 8 * v64 * v60 + 8 * (int)v66)
                                                                  + v67 * v18;
                --v16;
              }
              while (v16);
            }
            ++v10;
          }
          while (v10 != v9);
        }
        v8 = v64 + 1;
      }
      while (v64 + 1 != v62);
    }
  }
  return 0;
}

uint64_t cmw_initialize_header(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 1179796332;
  *(_QWORD *)(a1 + 16) = 0xC8434D4F46;
  if (fseek(*(FILE **)a1, 48, 1))
    return 2147483651;
  else
    return 0;
}

uint64_t cmw_close(FILE **a1)
{
  FILE *v2;
  int v3;
  FILE *v4;
  FILE *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = MEMORY[0x20BD069EC](*a1);
  v4 = a1[7];
  *((_DWORD *)a1 + 3) = v3 - (_DWORD)v4;
  if (!fseek(v2, v4, 0))
  {
    fwrite(a1 + 1, 0x30uLL, 1uLL, v2);
    if (!ferror(v2))
    {
      fseek(v2, (*((_DWORD *)a1 + 3) + *((_DWORD *)a1 + 14)), 0);
      if (!*((_BYTE *)a1 + 64))
      {
        v7 = 0;
        goto LABEL_7;
      }
      v6 = 0;
      v7 = 0;
      v5 = *a1;
      if (!*a1)
        goto LABEL_7;
LABEL_5:
      fclose(v5);
      v7 = v6;
      goto LABEL_7;
    }
  }
  if (!*((_BYTE *)a1 + 64))
  {
    v7 = 1;
    goto LABEL_7;
  }
  v5 = *a1;
  v6 = 1;
  v7 = 1;
  if (*a1)
    goto LABEL_5;
LABEL_7:
  free(a1);
  return v7;
}

_BYTE *cmw_create_from_file_pointer(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;

  if (!a1)
    return 0;
  v2 = malloc_type_calloc(1uLL, 0x48uLL, 0x10200406F0ECAEBuLL);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)v2 = a1;
    v2[64] = 0;
    *((_QWORD *)v2 + 7) = MEMORY[0x20BD069EC](a1);
    *((_DWORD *)v3 + 2) = 1179796332;
    *((_QWORD *)v3 + 2) = 0xC8434D4F46;
    if (fseek(*(FILE **)v3, 48, 1))
    {
      cmw_close((FILE **)v3);
      free(v3);
      return 0;
    }
  }
  return v3;
}

uint64_t cmw_write_label_features(_QWORD *a1, int a2, int a3, const void *a4)
{
  unsigned int v7;
  uint64_t v8;
  char __ptr;

  *((_DWORD *)a1 + 8) = a2;
  *((_DWORD *)a1 + 6) = a3;
  v7 = MEMORY[0x20BD069EC](*a1);
  if ((v7 & 3) != 0)
  {
    v8 = v7 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }
    while ((v8++ & 3) != 0);
  }
  *((_DWORD *)a1 + 10) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 14);
  fwrite(a4, 8uLL, (a2 * a2), (FILE *)*a1);
  fseek((FILE *)*a1, 0, 2);
  return 0;
}

uint64_t cmw_write_attribute_feature_counts_and_offsets(_QWORD *a1, unsigned int a2, const void *a3, const void *a4)
{
  unsigned int v8;
  uint64_t v9;
  char __ptr;

  *((_DWORD *)a1 + 9) = a2;
  v8 = MEMORY[0x20BD069EC](*a1);
  if ((v8 & 3) != 0)
  {
    v9 = v8 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }
    while ((v9++ & 3) != 0);
  }
  *((_DWORD *)a1 + 12) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 14);
  fwrite(a3, 4uLL, a2, (FILE *)*a1);
  *((_DWORD *)a1 + 13) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 14);
  fwrite(a4, 4uLL, a2, (FILE *)*a1);
  fseek((FILE *)*a1, 0, 2);
  return 0;
}

uint64_t cmw_open_attribute_features(_QWORD *a1, int a2)
{
  unsigned int v3;
  uint64_t v4;
  char __ptr;

  *((_DWORD *)a1 + 7) = a2;
  v3 = MEMORY[0x20BD069EC](*a1);
  if ((v3 & 3) != 0)
  {
    v4 = v3 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }
    while ((v4++ & 3) != 0);
  }
  *((_DWORD *)a1 + 11) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 14);
  return 0;
}

uint64_t cmw_write_attribute_feature(FILE **a1, int a2, double a3)
{
  double v4;
  int v5;

  v4 = a3;
  v5 = a2;
  if (fwrite(&v4, 1uLL, 0xCuLL, *a1) != 12)
    cmw_write_attribute_feature_cold_1();
  return 0;
}

uint64_t qmw_initialize_header(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 1179796332;
  *(_DWORD *)(a1 + 32) = 1077936128;
  *(_QWORD *)(a1 + 16) = 0xD2434D4F46;
  *(_QWORD *)(a1 + 24) = 0xC040000038C000C0;
  if (fseek(*(FILE **)a1, 55, 1))
    return 2147483651;
  else
    return 0;
}

uint64_t qmw_close(FILE **a1)
{
  FILE *v2;
  int v3;
  FILE *v4;
  FILE *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = MEMORY[0x20BD069EC](*a1);
  v4 = a1[8];
  *((_DWORD *)a1 + 3) = v3 - (_DWORD)v4;
  if (!fseek(v2, v4, 0))
  {
    fwrite(a1 + 1, 0x37uLL, 1uLL, v2);
    if (!ferror(v2))
    {
      fseek(v2, (*((_DWORD *)a1 + 3) + *((_DWORD *)a1 + 16)), 0);
      if (!*((_BYTE *)a1 + 72))
      {
        v7 = 0;
        goto LABEL_7;
      }
      v6 = 0;
      v7 = 0;
      v5 = *a1;
      if (!*a1)
        goto LABEL_7;
LABEL_5:
      fclose(v5);
      v7 = v6;
      goto LABEL_7;
    }
  }
  if (!*((_BYTE *)a1 + 72))
  {
    v7 = 1;
    goto LABEL_7;
  }
  v5 = *a1;
  v6 = 1;
  v7 = 1;
  if (*a1)
    goto LABEL_5;
LABEL_7:
  free(a1);
  return v7;
}

_BYTE *qmw_create_from_file_pointer(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;

  if (!a1)
    return 0;
  v2 = malloc_type_calloc(1uLL, 0x48uLL, 0x10200406F0ECAEBuLL);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)v2 = a1;
    v2[72] = 0;
    *((_QWORD *)v2 + 8) = MEMORY[0x20BD069EC](a1);
    *((_DWORD *)v3 + 2) = 1179796332;
    *((_DWORD *)v3 + 8) = 1077936128;
    *((_QWORD *)v3 + 2) = 0xD2434D4F46;
    *((_QWORD *)v3 + 3) = 0xC040000038C000C0;
    if (fseek(*(FILE **)v3, 55, 1))
    {
      qmw_close((FILE **)v3);
      free(v3);
      return 0;
    }
  }
  return v3;
}

_QWORD *create_compact_model_writer_from_file_pointer(uint64_t a1)
{
  _QWORD *v2;

  v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x800407D3415B1uLL);
  *v2 = cmw_create_from_file_pointer(a1);
  v2[1] = cmw_write_label_features;
  v2[2] = cmw_write_attribute_feature_counts_and_offsets;
  v2[3] = cmw_open_attribute_features;
  v2[4] = cmw_write_attribute_feature;
  v2[5] = cmw_close;
  return v2;
}

uint64_t qmw_write_label_features(_QWORD *a1, unsigned int a2, __int16 a3, const void *a4)
{
  unsigned int v7;
  uint64_t v8;
  char __ptr;

  if (a2 >= 0x100)
    qmw_write_label_features_cold_1();
  *((_BYTE *)a1 + 42) = a2;
  *((_WORD *)a1 + 18) = a3;
  v7 = MEMORY[0x20BD069EC](*a1);
  if ((v7 & 3) != 0)
  {
    v8 = v7 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }
    while ((v8++ & 3) != 0);
  }
  *(_DWORD *)((char *)a1 + 47) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 16);
  fwrite(a4, 8uLL, a2 * a2, (FILE *)*a1);
  fseek((FILE *)*a1, 0, 2);
  return 0;
}

uint64_t qmw_open_attribute_features(_QWORD *a1, int a2)
{
  unsigned int v3;
  uint64_t v4;
  char __ptr;

  *(_DWORD *)((char *)a1 + 38) = a2;
  v3 = MEMORY[0x20BD069EC](*a1);
  if ((v3 & 3) != 0)
  {
    v4 = v3 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }
    while ((v4++ & 3) != 0);
  }
  *(_DWORD *)((char *)a1 + 51) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 16);
  return 0;
}

uint64_t qmw_write_attribute_feature_counts_and_offsets(_QWORD *a1, int a2, unsigned int *a3, const void *a4)
{
  size_t v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  unsigned int v13;
  char v15;
  char __ptr;

  LODWORD(v6) = a2;
  *(_DWORD *)((char *)a1 + 43) = a2;
  v8 = MEMORY[0x20BD069EC](*a1);
  if ((v8 & 3) != 0)
  {
    v9 = v8 + 1;
    do
    {
      __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }
    while ((v9++ & 3) != 0);
  }
  *(_DWORD *)((char *)a1 + 55) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 16);
  if ((_DWORD)v6)
  {
    v6 = v6;
    v11 = v6;
    do
    {
      v13 = *a3++;
      v12 = v13;
      if (v13 >= 0x100)
        qmw_write_attribute_feature_counts_and_offsets_cold_1();
      v15 = v12;
      fwrite(&v15, 1uLL, 1uLL, (FILE *)*a1);
      --v11;
    }
    while (v11);
  }
  else
  {
    v6 = 0;
  }
  *(_DWORD *)((char *)a1 + 59) = MEMORY[0x20BD069EC](*a1) - *((_DWORD *)a1 + 16);
  fwrite(a4, 4uLL, v6, (FILE *)*a1);
  fseek((FILE *)*a1, 0, 2);
  return 0;
}

uint64_t qmw_write_attribute_feature(uint64_t a1, unsigned int a2, double a3)
{
  double v3;
  int v4;
  __int16 __ptr;
  char v7;

  if (a2 >= 0x100)
    qmw_write_attribute_feature_cold_1();
  v3 = *(float *)(a1 + 28);
  if (v3 >= a3)
  {
    LOWORD(v4) = 0;
  }
  else if (*(float *)(a1 + 32) <= a3)
  {
    LOWORD(v4) = -1;
  }
  else
  {
    v4 = (int)rint((a3 - v3) / *(float *)(a1 + 24));
  }
  __ptr = v4;
  v7 = a2;
  if (fwrite(&__ptr, 1uLL, 3uLL, *(FILE **)a1) != 3)
    qmw_write_attribute_feature_cold_2();
  return 0;
}

_QWORD *create_quantized_model_writer_from_file_pointer(uint64_t a1)
{
  _QWORD *v2;

  v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x800407D3415B1uLL);
  *v2 = qmw_create_from_file_pointer(a1);
  v2[1] = qmw_write_label_features;
  v2[2] = qmw_write_attribute_feature_counts_and_offsets;
  v2[3] = qmw_open_attribute_features;
  v2[4] = qmw_write_attribute_feature;
  v2[5] = qmw_close;
  return v2;
}

uint64_t write_label_features(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 8))(*(_QWORD *)a1);
}

uint64_t write_attribute_feature_counts_and_offsets(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 16))(*(_QWORD *)a1);
}

uint64_t open_attribute_features(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 24))(*(_QWORD *)a1);
}

uint64_t write_attribute_feature(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)a1);
}

uint64_t close_writer(void (**a1)(_QWORD))
{
  a1[5](*a1);
  free(a1);
  return 0;
}

uint64_t crf1m_create_instance_from_file(const char *a1, _QWORD *a2)
{
  int *v3;
  int *v4;
  uint64_t v5;

  *a2 = 0;
  v3 = crf1dm_new(a1);
  if (!v3)
    return 2147483651;
  v4 = v3;
  v5 = crf1m_model_initialize(v3, a2);
  if ((_DWORD)v5)
    crf1dm_close(v4);
  return v5;
}

uint64_t crf1m_create_instance_from_buffer(uint64_t a1, int a2, _QWORD *a3)
{
  int *v4;
  int *v5;
  uint64_t v6;

  *a3 = 0;
  v4 = (int *)crf1dm_new_from_buffer(a1, a2);
  if (!v4)
    return 2147483651;
  v5 = v4;
  v6 = crf1m_model_initialize(v4, a3);
  if ((_DWORD)v6)
    crf1dm_close(v5);
  return v6;
}

uint64_t crf1m_model_initialize(int *a1, _QWORD *a2)
{
  char v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _DWORD *v16;
  _DWORD *v17;
  uint64_t result;

  v4 = 1;
  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x10200401C4E69EBuLL);
  if (!v6)
  {
    v9 = 0;
LABEL_12:
    v15 = 0;
    v11 = 0;
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  *((_DWORD *)v6 + 4) = crf1dm_get_num_labels(a1, v5);
  *((_DWORD *)v6 + 5) = crf1dm_get_num_attrs(a1, v7);
  *v6 = a1;
  v8 = crf1dc_new(3, *((_DWORD *)v6 + 4), 0);
  v6[1] = v8;
  if (!v8)
  {
    crf1dt_delete(v6);
    v6 = 0;
    v9 = 0;
    v15 = 0;
    v11 = 0;
    v13 = 0;
    v4 = 1;
    goto LABEL_14;
  }
  crf1dc_reset(v8, 2);
  crf1dm_initialize_transition_scores((uint64_t)a1, v6[1]);
  crf1dc_exp_transition(v6[1]);
  *((_DWORD *)v6 + 6) = 0;
  v9 = malloc_type_calloc(1uLL, 0x30uLL, 0xA004059E6D2FFuLL);
  if (!v9)
  {
    v4 = 0;
    goto LABEL_12;
  }
  v10 = malloc_type_calloc(1uLL, 0x48uLL, 0x1080040D23F5C74uLL);
  v11 = v10;
  if (!v10)
  {
    v4 = 0;
    v15 = 0;
    goto LABEL_13;
  }
  *((_DWORD *)v10 + 2) = 1;
  v10[2] = model_attrs_addref;
  v10[3] = model_attrs_release;
  v10[4] = model_attrs_get;
  v10[5] = model_attrs_to_id;
  *v10 = a1;
  v10[6] = model_attrs_to_string;
  v10[7] = model_attrs_num;
  v10[8] = model_attrs_free;
  v12 = malloc_type_calloc(1uLL, 0x48uLL, 0x1080040D23F5C74uLL);
  v13 = v12;
  if (v12)
  {
    *v12 = a1;
    v12[2] = model_labels_addref;
    v12[3] = model_labels_release;
    v12[4] = model_labels_get;
    v12[5] = model_labels_to_id;
    *((_DWORD *)v12 + 2) = 1;
    v12[6] = model_labels_to_string;
    v12[7] = model_labels_num;
    v12[8] = model_labels_free;
    v14 = malloc_type_calloc(1uLL, 0x60uLL, 0x108004000789A1EuLL);
    v15 = v14;
    if (v14)
    {
      *v14 = v6;
      *((_DWORD *)v14 + 2) = 1;
      v14[2] = tagger_addref;
      v14[3] = tagger_release;
      v14[4] = tagger_set;
      v14[5] = tagger_length;
      v14[6] = tagger_viterbi;
      v14[7] = tagger_score;
      v14[8] = tagger_lognorm;
      v14[9] = tagger_marginal_point;
      v14[10] = tagger_marginal_path;
      v14[11] = tagger_tag_paragraph;
      *v9 = a1;
      v9[1] = v11;
      v9[4] = v13;
      v9[5] = v14;
      v16 = malloc_type_calloc(1uLL, 0x58uLL, 0x10800404DCD22FDuLL);
      if (v16)
      {
        v17 = v16;
        result = 0;
        *(_QWORD *)v17 = v9;
        v17[2] = 1;
        *((_QWORD *)v17 + 2) = model_addref;
        *((_QWORD *)v17 + 3) = model_release;
        *((_QWORD *)v17 + 4) = model_get_tagger;
        *((_QWORD *)v17 + 5) = model_get_labels;
        *((_QWORD *)v17 + 6) = model_get_attrs;
        *((_QWORD *)v17 + 7) = model_dump;
        *((_QWORD *)v17 + 8) = 0;
        *((_QWORD *)v17 + 9) = model_get_number_of_labels;
        *((_QWORD *)v17 + 10) = model_get_number_of_attributes;
        *a2 = v17;
        return result;
      }
    }
    v4 = 0;
  }
  else
  {
    v4 = 0;
    v15 = 0;
  }
LABEL_14:
  free(v15);
  free(v13);
  free(v11);
  free(v9);
  if ((v4 & 1) == 0)
    crf1dt_delete(v6);
  return 2147483649;
}

uint64_t model_attrs_addref(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_attrs_release(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_attrs_get()
{
  return 2147483650;
}

uint64_t model_attrs_to_id(uint64_t *a1, char *a2)
{
  return crf1dm_to_aid(*a1, a2);
}

uint64_t model_attrs_to_string(uint64_t *a1, unsigned int a2, uint64_t *a3)
{
  *a3 = crf1dm_to_attr(*a1, a2);
  return 0;
}

uint64_t model_attrs_num@<X0>(int **a1@<X0>, uint64_t a2@<X8>)
{
  return crf1dm_get_num_attrs(*a1, a2);
}

uint64_t model_labels_addref(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_labels_release(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_labels_get()
{
  return 2147483650;
}

uint64_t model_labels_to_id(uint64_t *a1, char *a2)
{
  return crf1dm_to_lid(*a1, a2);
}

uint64_t model_labels_to_string(uint64_t *a1, unsigned int a2, uint64_t *a3)
{
  *a3 = crf1dm_to_label(*a1, a2);
  return 0;
}

uint64_t model_labels_num@<X0>(int **a1@<X0>, uint64_t a2@<X8>)
{
  return crf1dm_get_num_labels(*a1, a2);
}

uint64_t tagger_addref(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t tagger_release(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t tagger_set(uint64_t *a1, int *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  v3 = *a1;
  crf1dc_set_num_items(*(_QWORD *)(*a1 + 8), *a2);
  crf1dc_reset(*(_QWORD *)(v3 + 8), 1);
  crf1dm_initialize_state_scores(*(_QWORD *)v3, *(_QWORD *)(v3 + 8), (unsigned int *)a2, v4, v5, v6);
  *(_DWORD *)(v3 + 24) = 1;
  return 0;
}

uint64_t tagger_length(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 8);
}

uint64_t tagger_viterbi(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  crf1dc_viterbi(*(_QWORD *)(*(_QWORD *)a1 + 8), a2);
  if (a3)
    *a3 = v4;
  return 0;
}

uint64_t tagger_score(uint64_t a1, int *a2, double *a3)
{
  double v4;

  v4 = crf1dc_score(*(_QWORD *)(*(_QWORD *)a1 + 8), a2);
  if (a3)
    *a3 = v4;
  return 0;
}

uint64_t tagger_lognorm(unsigned int **a1, double *a2)
{
  unsigned int *v3;

  v3 = *a1;
  crf1dt_set_level(*a1);
  *a2 = crf1dc_lognorm(*((_QWORD *)v3 + 1));
  return 0;
}

uint64_t tagger_marginal_point(unsigned int **a1, int a2, int a3, double *a4)
{
  unsigned int *v7;

  v7 = *a1;
  crf1dt_set_level(*a1);
  *a4 = crf1dc_marginal_point(*((_QWORD *)v7 + 1), a2, a3);
  return 0;
}

uint64_t tagger_marginal_path(unsigned int **a1, uint64_t a2, int a3, int a4, double *a5)
{
  unsigned int *v9;

  v9 = *a1;
  crf1dt_set_level(*a1);
  *a5 = crf1dc_marginal_path(*((_QWORD *)v9 + 1), a2, a3, a4);
  return 0;
}

uint64_t tagger_tag_paragraph(uint64_t *a1, int *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  int item_count_for_sentence;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int i;
  int id;
  int v19;
  int featureid;
  uint64_t v21;
  _QWORD *v24;
  uint64_t v25;
  int v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  double v30;

  v7 = *a1;
  v8 = *(_QWORD *)(*a1 + 8);
  item_count_for_sentence = crf_paragraph_get_item_count_for_sentence((uint64_t)a2, a3);
  v24 = a4;
  crf_output_init_n(a4, item_count_for_sentence);
  crf1dc_set_num_items(v8, item_count_for_sentence);
  crf1dc_reset(*(_QWORD *)(v7 + 8), 1);
  v11 = *(_QWORD *)v7;
  v10 = *(_QWORD *)(v7 + 8);
  v25 = v7;
  v26 = crf_paragraph_get_item_count_for_sentence((uint64_t)a2, a3);
  if (v26 >= 1)
  {
    v12 = 0;
    v13 = *a2;
    v29 = 0;
    v30 = 0.0;
    v27[1] = 0;
    v28 = 0;
    v27[0] = 0;
    v14 = *(unsigned int *)(v7 + 16);
    do
    {
      v15 = *(_QWORD *)(v10 + 24);
      v16 = v15 + 8 * *(_DWORD *)(v10 + 4) * v12;
      if ((int)v14 >= 1)
        bzero((void *)(v15 + 8 * *(_DWORD *)(v10 + 4) * v12), 8 * v14);
      if (v13 >= 1)
      {
        for (i = 0; i != v13; ++i)
        {
          id = crf_paragraph_get_id((uint64_t)a2, a3, v12, i);
          if (id >= 1)
          {
            crf1dm_get_attrref(v11, id - 1, (uint64_t)v27);
            if (SLODWORD(v27[0]) >= 1)
            {
              v19 = 0;
              do
              {
                featureid = crf1dm_get_featureid((uint64_t)v27, v19);
                crf1dm_get_feature(v11, featureid, (uint64_t)&v28);
                *(double *)(v16 + 8 * (int)v29) = v30 + *(double *)(v16 + 8 * (int)v29);
                ++v19;
              }
              while (v19 < SLODWORD(v27[0]));
            }
          }
        }
      }
      ++v12;
    }
    while (v12 != v26);
  }
  *(_DWORD *)(v25 + 24) = 1;
  crf1dc_viterbi(*(_QWORD *)(*a1 + 8), v24[1]);
  v24[2] = v21;
  return 0;
}

uint64_t model_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t model_release(_DWORD *a1)
{
  uint64_t v2;
  void **v3;

  v2 = crfsuite_interlocked_decrement(a1 + 2);
  if (!(_DWORD)v2)
  {
    v3 = *(void ***)a1;
    crf1dt_delete(**(_QWORD ***)(*(_QWORD *)a1 + 40));
    free(v3[5]);
    free(v3[4]);
    free(v3[1]);
    crf1dm_close(*v3);
    free(v3);
    free(a1);
  }
  return v2;
}

uint64_t model_get_attrs(uint64_t a1, _QWORD *a2)
{
  *a2 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  return 0;
}

uint64_t model_get_labels(uint64_t a1, _QWORD *a2)
{
  *a2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  return 0;
}

uint64_t model_get_tagger(uint64_t a1, _QWORD *a2)
{
  *a2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  return 0;
}

uint64_t model_dump(uint64_t **a1, FILE *a2)
{
  crf1dm_dump(**a1, a2);
  return 0;
}

uint64_t model_get_number_of_labels(int ***a1)
{
  return crf1dm_get_num_labels(**a1, (uint64_t)*a1);
}

uint64_t model_get_number_of_attributes(int ***a1)
{
  return crf1dm_get_num_attrs(**a1, (uint64_t)*a1);
}

void crf1dt_delete(_QWORD *a1)
{
  void **v2;

  v2 = (void **)a1[1];
  if (v2)
    crf1dc_delete(v2);
  free(a1);
}

unsigned int *crf1dt_set_level(unsigned int *result)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = result;
  if ((int)result[6] <= 1)
  {
    v2 = (unsigned int *)*((_QWORD *)result + 1);
    crf1dc_exp_state((uint64_t)v2);
    crf1dc_alpha_score((uint64_t)v2);
    result = crf1dc_beta_score(v2);
  }
  v1[6] = 2;
  return result;
}

uint64_t crf1de_create_instance(const char *a1, _QWORD *a2)
{
  uint64_t v4;
  const char *v6;
  int v7;
  _DWORD *v8;
  _DWORD *v9;
  _QWORD *v10;

  if (strncmp(a1, "train/", 6uLL) || strncmp(a1 + 6, "crf1d/", 6uLL))
    return 1;
  v6 = a1 + 12;
  if (!strcmp(v6, "lbfgs"))
  {
    v7 = 1;
  }
  else if (!strcmp(v6, "l2sgd"))
  {
    v7 = 2;
  }
  else if (!strcmp(v6, "averaged-perceptron"))
  {
    v7 = 3;
  }
  else if (!strcmp(v6, "passive-aggressive"))
  {
    v7 = 4;
  }
  else
  {
    if (strcmp(v6, "arow"))
      return 1;
    v7 = 5;
  }
  v4 = 1;
  v8 = malloc_type_calloc(1uLL, 0x40uLL, 0x1080040150B6343uLL);
  if (!v8)
    return v4;
  v9 = v8;
  v10 = crfsuite_train_new(v7);
  *(_QWORD *)v9 = v10;
  if (v10)
  {
    v4 = 0;
    v9[2] = 1;
    *((_QWORD *)v9 + 2) = crfsuite_train_addref;
    *((_QWORD *)v9 + 3) = crfsuite_train_release;
    *((_QWORD *)v9 + 4) = crfsuite_train_params;
    *((_QWORD *)v9 + 5) = crfsuite_train_set_message_callback;
    *((_QWORD *)v9 + 6) = crfsuite_train_to_file;
    *((_QWORD *)v9 + 7) = crfsuite_train_to_file_pointer;
    *a2 = v9;
    return v4;
  }
  free(v9);
  return 1;
}

_QWORD *crfsuite_train_new(int a1)
{
  _QWORD *v2;
  _QWORD *encoder;

  v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x102004016EE4530uLL);
  if (v2)
  {
    v2[2] = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040622C3295uLL);
    v2[1] = params_create_instance();
    *((_DWORD *)v2 + 6) = 1;
    *((_DWORD *)v2 + 7) = a1;
    encoder = crf1d_create_encoder();
    *v2 = encoder;
    ((void (*)(_QWORD *, _QWORD, _QWORD))encoder[7])(encoder, v2[1], 0);
    switch(a1)
    {
      case 1:
        crfsuite_train_lbfgs_init(v2[1]);
        break;
      case 2:
        crfsuite_train_l2sgd_init(v2[1]);
        break;
      case 3:
        crfsuite_train_averaged_perceptron_init((int **)v2[1]);
        break;
      case 4:
        crfsuite_train_passive_aggressive_init(v2[1]);
        break;
      case 5:
        crfsuite_train_arow_init(v2[1]);
        break;
      default:
        return v2;
    }
  }
  return v2;
}

uint64_t crfsuite_train_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t crfsuite_train_release(_DWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = crfsuite_interlocked_decrement(a1 + 2);
  if (!(_DWORD)v2)
  {
    v3 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      if (*(_QWORD *)v3)
        (*(void (**)(void))(*(_QWORD *)v3 + 152))();
      v4 = *((_QWORD *)v3 + 1);
      if (v4)
        (*(void (**)(void))(v4 + 24))();
      free(*((void **)v3 + 2));
      free(v3);
    }
    free(a1);
  }
  return v2;
}

uint64_t crfsuite_train_params(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 8);
}

uint64_t crfsuite_train_set_message_callback(uint64_t result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(*(_QWORD *)result + 16);
  *v3 = a2;
  v3[1] = a3;
  return result;
}

uint64_t crfsuite_train_to_file(uint64_t **a1, uint64_t a2, uint64_t a3, int a4)
{
  int v7;
  int v8;
  uint64_t v9;
  void *v11;

  if (!a3)
    return 2147483651;
  v11 = 0;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 24) + 56))();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 56))();
  crfsuite_train_train(a1, (unsigned int *)a2, v7, v8, a4, (double **)&v11);
  if (!v11)
    return 0;
  v9 = (*(uint64_t (**)(void))(**a1 + 136))();
  free(v11);
  return v9;
}

uint64_t crfsuite_train_to_file_pointer(uint64_t **a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, char a7)
{
  uint64_t v13;
  int v14;
  uint64_t v16;
  void *v18;
  double v19;

  if (!a5)
    return 2147483651;
  v13 = (*a1)[1];
  v19 = 1.0;
  v14 = (*(uint64_t (**)(void))(v13 + 96))();
  if ((a7 & 1) != 0 && !v14 && v19 > 1.0)
  {
    fwrite("ERROR: \"crfsuite_training_do_not_store_attributes\" flag is not compatible with minimal frequency value that is greater than 1!\n", 0x7FuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    return 2147483651;
  }
  v18 = 0;
  if (a3 <= 0)
    a3 = (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 24) + 56))();
  if (a4 <= 0)
    a4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a2 + 24) + 56))(*(_QWORD *)(a2 + 16));
  crfsuite_train_train(a1, (unsigned int *)a2, a3, a4, a6, (double **)&v18);
  if (!v18)
    return 0;
  v16 = (*(uint64_t (**)(void))(**a1 + 144))();
  free(v18);
  return v16;
}

_DWORD *crf1de_create_trainer(int a1, unsigned int a2)
{
  _DWORD *v2;
  _QWORD *v4;

  v2 = 0;
  if (!a1 && a2 <= 4)
  {
    v2 = malloc_type_calloc(1uLL, 0x40uLL, 0x1080040150B6343uLL);
    if (v2)
    {
      v4 = crfsuite_train_new(a2 + 1);
      *(_QWORD *)v2 = v4;
      if (v4)
      {
        v2[2] = 1;
        *((_QWORD *)v2 + 2) = crfsuite_train_addref;
        *((_QWORD *)v2 + 3) = crfsuite_train_release;
        *((_QWORD *)v2 + 4) = crfsuite_train_params;
        *((_QWORD *)v2 + 5) = crfsuite_train_set_message_callback;
        *((_QWORD *)v2 + 6) = crfsuite_train_to_file;
        *((_QWORD *)v2 + 7) = crfsuite_train_to_file_pointer;
      }
      else
      {
        free(v2);
        return 0;
      }
    }
  }
  return v2;
}

void crfsuite_train_train(uint64_t **a1, unsigned int *a2, int a3, int a4, int a5, double **a6)
{
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  _DWORD *v27;
  _DWORD *v28;
  _DWORD *v29;
  _DWORD *v30;
  uint64_t v31;
  _OWORD v32[2];
  _OWORD v33[2];

  v11 = *a1;
  v12 = (uint64_t *)(*a1)[2];
  v13 = **a1;
  *a6 = 0;
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  dataset_init_trainset((uint64_t)v33, a2, a3, a4, a5);
  if ((a5 & 0x80000000) == 0)
  {
    dataset_init_testset((uint64_t)v32, a2, a3, a4, a5);
    logging(v12, (uint64_t)"Holdout group: %d\n", v14, v15, v16, v17, v18, v19, (a5 + 1));
    logging(v12, (uint64_t)"\n", v20, v21, v22, v23, v24, v25, v31);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 56))(v13, v11[1], 0xFFFFFFFFLL);
  (*(void (**)(uint64_t, _OWORD *, uint64_t *))(v13 + 64))(v13, v33, v12);
  switch(*((_DWORD *)v11 + 7))
  {
    case 1:
      if (a5 == -1)
        v26 = 0;
      else
        v26 = v32;
      crfsuite_train_lbfgs(v13, (uint64_t)v33, (uint64_t)v26, v11[1], v12, a6);
      if ((a5 & 0x80000000) == 0)
        goto LABEL_24;
      goto LABEL_25;
    case 2:
      if (a5 == -1)
        v27 = 0;
      else
        v27 = v32;
      crfsuite_train_l2sgd(v13, (uint64_t)v33, v27, v11[1], v12, a6);
      if ((a5 & 0x80000000) == 0)
        goto LABEL_24;
      goto LABEL_25;
    case 3:
      if (a5 == -1)
        v28 = 0;
      else
        v28 = v32;
      crfsuite_train_averaged_perceptron(v13, (uint64_t)v33, v28, v11[1], v12, a6);
      if ((a5 & 0x80000000) == 0)
        goto LABEL_24;
      goto LABEL_25;
    case 4:
      if (a5 == -1)
        v29 = 0;
      else
        v29 = v32;
      crfsuite_train_passive_aggressive(v13, (uint64_t)v33, v29, v11[1], v12, (char **)a6);
      goto LABEL_23;
    case 5:
      if (a5 == -1)
        v30 = 0;
      else
        v30 = v32;
      crfsuite_train_arow(v13, (uint64_t)v33, v30, v11[1], v12, a6);
      if (a5 < 0)
        goto LABEL_25;
      goto LABEL_24;
    default:
LABEL_23:
      if ((a5 & 0x80000000) == 0)
LABEL_24:
        dataset_finish((uint64_t)v32);
LABEL_25:
      dataset_finish((uint64_t)v33);
      return;
  }
}

BOOL crfsuite_create_instance(const char *a1, _QWORD *a2)
{
  return !crf1de_create_instance(a1, a2) || crfsuite_dictionary_create_instance(a1, a2) == 0;
}

_QWORD *crfsuite_attribute_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0x3FF0000000000000;
  return result;
}

uint64_t crfsuite_attribute_set(uint64_t result, int a2, double a3)
{
  *(_QWORD *)result = 0;
  *(_DWORD *)result = a2;
  *(double *)(result + 8) = a3;
  return result;
}

double crfsuite_attribute_copy(uint64_t a1, uint64_t a2)
{
  double result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

double crfsuite_attribute_swap(double *a1, double *a2)
{
  int v2;
  double result;

  v2 = *(_DWORD *)a1;
  result = a1[1];
  *(_DWORD *)a1 = *(_DWORD *)a2;
  a1[1] = a2[1];
  *(_DWORD *)a2 = v2;
  a2[1] = result;
  return result;
}

_QWORD *crfsuite_item_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void *crfsuite_item_init_n(uint64_t a1, int a2)
{
  void *result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a2;
  result = malloc_type_calloc(a2, 0x10uLL, 0x1000040F7F8B94BuLL);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void *crfsuite_item_init_with_capacity(uint64_t a1, int a2)
{
  void *result;

  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 4) = a2;
  result = malloc_type_calloc(a2, 0x10uLL, 0x1000040F7F8B94BuLL);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void crfsuite_item_finish(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

double crfsuite_item_copy(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  char *v5;
  double result;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  double v10;

  v4 = *a2;
  *a1 = *a2;
  v5 = (char *)malloc_type_calloc((int)v4, 0x10uLL, 0x1000040F7F8B94BuLL);
  a1[1] = (uint64_t)v5;
  v7 = *(unsigned int *)a1;
  if ((int)v7 >= 1)
  {
    v8 = (_QWORD *)(a2[1] + 8);
    v9 = v5 + 8;
    do
    {
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      v10 = *(double *)v8;
      v8 += 2;
      result = v10;
      *(double *)v9 = v10;
      v9 += 2;
      --v7;
    }
    while (v7);
  }
  return result;
}

double crfsuite_item_swap(double *a1, double *a2)
{
  uint64_t v2;
  double result;
  double v4;

  v2 = *((_QWORD *)a1 + 1);
  result = *a2;
  a1[1] = a2[1];
  v4 = *a1;
  *a1 = result;
  *a2 = v4;
  *((_QWORD *)a2 + 1) = v2;
  return result;
}

uint64_t crfsuite_item_append_attribute(int *a1, uint64_t a2)
{
  int v4;
  int v5;
  char *v6;
  int v7;
  char *v8;

  v4 = *a1;
  v5 = a1[1];
  if (v5 <= *a1)
  {
    v7 = 2 * v5 + 2;
    a1[1] = v7;
    v6 = (char *)malloc_type_realloc(*((void **)a1 + 1), 16 * v7, 0x1000040F7F8B94BuLL);
    *((_QWORD *)a1 + 1) = v6;
    v4 = *a1;
  }
  else
  {
    v6 = (char *)*((_QWORD *)a1 + 1);
  }
  *a1 = v4 + 1;
  v8 = &v6[16 * v4];
  *(_DWORD *)v8 = *(_DWORD *)a2;
  *((_QWORD *)v8 + 1) = *(_QWORD *)(a2 + 8);
  return 0;
}

BOOL crfsuite_item_empty(_DWORD *a1)
{
  return *a1 == 0;
}

double crfsuite_instance_init(_OWORD *a1)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *crfsuite_instance_init_n(uint64_t a1, int a2)
{
  size_t v3;
  void *result;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a2;
  v3 = a2;
  *(_QWORD *)(a1 + 8) = malloc_type_calloc(a2, 0x10uLL, 0x10200405730B0C9uLL);
  result = malloc_type_calloc(v3, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

double crfsuite_instance_finish(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  if (*a1 >= 1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *((_QWORD *)a1 + 1) + v2;
      free(*(void **)(v4 + 8));
      *(_QWORD *)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
      ++v3;
      v2 += 16;
    }
    while (v3 < *a1);
  }
  free(*((void **)a1 + 2));
  free(*((void **)a1 + 1));
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

void crfsuite_instance_copy(int *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = malloc_type_calloc((int)v4, 0x10uLL, 0x10200405730B0C9uLL);
  *((_QWORD *)a1 + 2) = malloc_type_calloc(*a1, 4uLL, 0x100004052888210uLL);
  a1[6] = *((_DWORD *)a2 + 6);
  if (*a1 >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      crfsuite_item_copy((uint64_t *)(*((_QWORD *)a1 + 1) + v5), (uint64_t *)(a2[1] + v5));
      *(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v6) = *(_DWORD *)(a2[2] + 4 * v6);
      ++v6;
      v5 += 16;
    }
    while (v6 < *a1);
  }
}

__n128 crfsuite_instance_swap(uint64_t *a1, uint64_t *a2)
{
  int v2;
  __int128 v3;
  uint64_t v4;
  __n128 result;

  v2 = *((_DWORD *)a1 + 6);
  v3 = *(_OWORD *)(a2 + 1);
  v4 = *a1;
  *a1 = *a2;
  *((_DWORD *)a1 + 6) = *((_DWORD *)a2 + 6);
  *a2 = v4;
  result = *(__n128 *)(a1 + 1);
  *(_OWORD *)(a1 + 1) = v3;
  *(__n128 *)(a2 + 1) = result;
  *((_DWORD *)a2 + 6) = v2;
  return result;
}

uint64_t crfsuite_instance_append(int *a1, uint64_t *a2, int a3)
{
  int v6;
  int v7;
  int v8;

  v6 = *a1;
  v7 = a1[1];
  if (v7 <= *a1)
  {
    v8 = 2 * v7 + 2;
    a1[1] = v8;
    *((_QWORD *)a1 + 1) = malloc_type_realloc(*((void **)a1 + 1), 16 * v8, 0x10200405730B0C9uLL);
    *((_QWORD *)a1 + 2) = malloc_type_realloc(*((void **)a1 + 2), 4 * a1[1], 0x100004052888210uLL);
    v6 = *a1;
  }
  crfsuite_item_copy((uint64_t *)(*((_QWORD *)a1 + 1) + 16 * v6), a2);
  *(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (*a1)++) = a3;
  return 0;
}

BOOL crfsuite_instance_empty(_DWORD *a1)
{
  return *a1 == 0;
}

double crfsuite_data_init(_OWORD *a1)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *crfsuite_data_init_n(uint64_t a1, int a2)
{
  void *result;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a2;
  result = malloc_type_calloc(a2, 0x20uLL, 0x103004044A278C3uLL);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

double crfsuite_data_finish(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  double result;

  if (*a1 >= 1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      crfsuite_instance_finish((int *)(*((_QWORD *)a1 + 1) + v2));
      ++v3;
      v2 += 32;
    }
    while (v3 < *a1);
  }
  free(*((void **)a1 + 1));
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

void crfsuite_data_copy(int *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = malloc_type_calloc((int)v4, 0x20uLL, 0x103004044A278C3uLL);
  if (*a1 >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      crfsuite_instance_copy((int *)(*((_QWORD *)a1 + 1) + v5), (uint64_t *)(a2[1] + v5));
      ++v6;
      v5 += 32;
    }
    while (v6 < *a1);
  }
}

double crfsuite_data_swap(double *a1, double *a2)
{
  uint64_t v2;
  double result;
  double v4;

  v2 = *((_QWORD *)a1 + 1);
  result = *a2;
  a1[1] = a2[1];
  v4 = *a1;
  *a1 = result;
  *a2 = v4;
  *((_QWORD *)a2 + 1) = v2;
  return result;
}

uint64_t crfsuite_data_append(int *a1, uint64_t *a2)
{
  int v4;
  int v5;
  int *v6;
  int v7;

  if (*(int *)a2 >= 1)
  {
    v4 = *a1;
    v5 = a1[1];
    if (v5 <= *a1)
    {
      v7 = 2 * v5 + 2;
      a1[1] = v7;
      v6 = (int *)malloc_type_realloc(*((void **)a1 + 1), 32 * v7, 0x103004044A278C3uLL);
      *((_QWORD *)a1 + 1) = v6;
      v4 = *a1;
    }
    else
    {
      v6 = (int *)*((_QWORD *)a1 + 1);
    }
    *a1 = v4 + 1;
    crfsuite_instance_copy(&v6[8 * v4], a2);
  }
  return 0;
}

unint64_t crfsuite_data_maxlength(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  int *v3;
  unsigned int v4;
  int v5;

  v1 = *(unsigned int *)result;
  if ((int)v1 < 1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = *(int **)(v2 + 8);
  do
  {
    v5 = *v3;
    v3 += 8;
    v4 = v5;
    if ((int)result <= v5)
      result = v4;
    else
      result = result;
    --v1;
  }
  while (v1);
  return result;
}

unint64_t crfsuite_data_totalitems(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  int *v3;
  int v4;

  v1 = *(unsigned int *)result;
  if ((int)v1 < 1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = *(int **)(v2 + 8);
  do
  {
    v4 = *v3;
    v3 += 8;
    result = (v4 + result);
    --v1;
  }
  while (v1);
  return result;
}

void *crfsuite_evaluation_init(uint64_t a1, int a2)
{
  void *result;

  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  result = malloc_type_calloc(a2 + 1, 0x28uLL, 0x1000040E20BFF51uLL);
  *(_QWORD *)(a1 + 8) = result;
  if (result)
    *(_DWORD *)a1 = a2;
  return result;
}

double crfsuite_evaluation_clear(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  if ((*a1 & 0x80000000) == 0)
  {
    v1 = 0;
    v2 = -1;
    do
    {
      v3 = *((_QWORD *)a1 + 1) + v1;
      *(_QWORD *)(v3 + 32) = 0;
      *(_OWORD *)v3 = 0uLL;
      *(_OWORD *)(v3 + 16) = 0uLL;
      ++v2;
      v1 += 40;
    }
    while (v2 < *a1);
  }
  result = 0.0;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  return result;
}

double crfsuite_evaluation_finish(uint64_t a1)
{
  double result;

  free(*(void **)(a1 + 8));
  result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t crfsuite_evaluation_accmulate(int *a1, int *a2, int *a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  if (a4 < 1)
  {
    v4 = 0;
LABEL_12:
    if (v4 == a4)
      ++a1[10];
    v14 = 0;
    ++a1[11];
  }
  else
  {
    v4 = 0;
    v5 = *a1;
    v6 = a4;
    while (1)
    {
      v8 = *a2++;
      v7 = v8;
      v10 = *a3++;
      v9 = v10;
      if (v5 <= v7 || v5 <= v9)
        return 1;
      v12 = v9;
      v13 = *((_QWORD *)a1 + 1);
      ++*(_DWORD *)(v13 + 40 * v7 + 4);
      ++*(_DWORD *)(v13 + 40 * v12 + 8);
      if (v7 == v12)
      {
        ++*(_DWORD *)(v13 + 40 * v7);
        ++v4;
      }
      ++a1[5];
      if (!--v6)
        goto LABEL_12;
    }
  }
  return v14;
}

double crfsuite_evaluation_finalize(unsigned int *a1)
{
  int v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double result;
  int v15;
  int v16;

  v1 = *a1;
  if ((*a1 & 0x80000000) == 0)
  {
    v2 = (v1 + 1);
    v3 = (_QWORD *)(*((_QWORD *)a1 + 1) + 16);
    v4 = *a1;
    do
    {
      v5 = *((_DWORD *)v3 - 3);
      if (v5)
      {
        v6 = *((_DWORD *)v3 - 4);
        a1[4] += v6;
        v7 = *((_DWORD *)v3 - 2);
        v8 = a1[7] + v7;
        a1[6] += v5;
        a1[7] = v8;
        v3[1] = 0;
        v3[2] = 0;
        *v3 = 0;
        v9 = 0.0;
        v10 = (double)v6;
        v11 = 0.0;
        if (v7 >= 1)
        {
          v11 = v10 / (double)v7;
          *(double *)v3 = v11;
        }
        if (v5 >= 1)
        {
          v9 = v10 / (double)v5;
          *((double *)v3 + 1) = v9;
        }
        v12 = 0.0;
        if (v11 + v9 > 0.0)
        {
          v12 = (v11 * v9 + v11 * v9) / (v11 + v9);
          *((double *)v3 + 2) = v12;
        }
        if (v4)
        {
          v13 = *((double *)a1 + 8);
          *((double *)a1 + 7) = v11 + *((double *)a1 + 7);
          *((double *)a1 + 8) = v9 + v13;
          *((double *)a1 + 9) = v12 + *((double *)a1 + 9);
        }
      }
      --v4;
      v3 += 5;
      --v2;
    }
    while (v2);
  }
  *(float64x2_t *)(a1 + 14) = vdivq_f64(*(float64x2_t *)(a1 + 14), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v1), 0));
  result = *((double *)a1 + 9) / (double)v1;
  *((double *)a1 + 9) = result;
  *((_QWORD *)a1 + 4) = 0;
  v15 = a1[5];
  if (v15 >= 1)
  {
    result = (double)(int)a1[4] / (double)v15;
    *((double *)a1 + 4) = result;
  }
  *((_QWORD *)a1 + 6) = 0;
  v16 = a1[11];
  if (v16 >= 1)
  {
    result = (double)(int)a1[10] / (double)v16;
    *((double *)a1 + 6) = result;
  }
  return result;
}

_QWORD *crfsuite_evaluation_output(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  _QWORD v40[3];
  const char *v41;

  v41 = 0;
  v40[1] = a3;
  v40[2] = 0;
  v40[0] = a4;
  logging(v40, (uint64_t)"Performance by label (#match, #model, #ref) (precision, recall, F1):\n", a3, a4, a5, a6, a7, a8, v39);
  if (*a1 >= 1)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = *((_QWORD *)a1 + 1);
      (*(void (**)(uint64_t, uint64_t, const char **))(a2 + 48))(a2, v17, &v41);
      v25 = v41;
      if (!v41)
      {
        v41 = "[UNKNOWN]";
        v25 = "[UNKNOWN]";
      }
      if (*(_DWORD *)(v18 + v16 + 4))
        logging(v40, (uint64_t)"    %s: (%d, %d, %d) (%1.4f, %1.4f, %1.4f)\n", v19, v20, v21, v22, v23, v24, (uint64_t)v25);
      else
        logging(v40, (uint64_t)"    %s: (%d, %d, %d) (******, ******, ******)\n", v19, v20, v21, v22, v23, v24, (uint64_t)v25);
      (*(void (**)(uint64_t, const char *))(a2 + 64))(a2, v41);
      ++v17;
      v16 += 40;
    }
    while (v17 < *a1);
  }
  logging(v40, (uint64_t)"Macro-average precision, recall, F1: (%f, %f, %f)\n", v10, v11, v12, v13, v14, v15, *((_QWORD *)a1 + 7));
  logging(v40, (uint64_t)"Item accuracy: %d / %d (%1.4f)\n", v26, v27, v28, v29, v30, v31, a1[4]);
  return logging(v40, (uint64_t)"Instance accuracy: %d / %d (%1.4f)\n", v32, v33, v34, v35, v36, v37, a1[10]);
}

uint64_t crfsuite_interlocked_increment(_DWORD *a1)
{
  uint64_t v1;

  v1 = (*a1 + 1);
  *a1 = v1;
  return v1;
}

uint64_t crfsuite_interlocked_decrement(_DWORD *a1)
{
  uint64_t v1;

  v1 = (*a1 - 1);
  *a1 = v1;
  return v1;
}

uint64_t crfsuite_model_create_from_file(const char *a1)
{
  uint64_t v2;

  v2 = 0;
  if (crf1m_create_instance_from_file(a1, &v2))
    return 0;
  else
    return v2;
}

uint64_t crfsuite_model_create_from_buffer(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = 0;
  if (crf1m_create_instance_from_buffer(a1, a2, &v3))
    return 0;
  else
    return v3;
}

uint64_t crfsuite_model_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_model_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_model_get_tagger(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(a1 + 32))(a1, &v2))
    return 0;
  else
    return v2;
}

uint64_t crfsuite_model_get_labels(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(a1 + 40))(a1, &v2))
    return 0;
  else
    return v2;
}

uint64_t crfsuite_model_get_attrs(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(a1 + 48))(a1, &v2))
    return 0;
  else
    return v2;
}

uint64_t crfsuite_model_get_number_of_labels(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t crfsuite_model_get_number_of_attributes(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t crfsuite_model_dump(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_trainer_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_trainer_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_trainer_get_params(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t crfsuite_trainer_set_message_callback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t crfsuite_trainer_train(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t crfsuite_trainer_train_model_to_file_pointer(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_tagger_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_tagger_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_tagger_set_instance(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t crfsuite_tagger_instance_length(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t crfsuite_tagger_viterbi(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t crfsuite_tagger_score(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_tagger_lognorm(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 64))();
}

uint64_t crfsuite_tagger_marginal_point(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t crfsuite_tagger_marginal_path(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t crfsuite_tagger_tag_paragraph(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 88))();
}

uint64_t crfsuite_dictionary_create()
{
  uint64_t v1;

  v1 = 0;
  if (crfsuite_dictionary_create_instance("dictionary", &v1))
    return 0;
  else
    return v1;
}

uint64_t crfsuite_dictioanry_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_dictionary_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_dictionary_get_id_for_string(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 32;
  return (*(uint64_t (**)(void))(a1 + v3))();
}

uint64_t crfsuite_dictionary_get_string_for_id(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(a1 + 48))(a1, a2, &v3))
    return 0;
  else
    return v3;
}

uint64_t crfsuite_dictionary_get_count(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_get_id_from_dictionary(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

FILE **crfsuite_create_tokenizer_from_feature_file(const char *a1)
{
  FILE *v1;
  uint64_t v2;
  FILE **v3;
  char *v4;

  v1 = fopen(a1, "r");
  if (!v1)
    return 0;
  v2 = (uint64_t)v1;
  v3 = (FILE **)malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
  *v3 = (FILE *)v2;
  v4 = iwa_reader(v2);
  v3[1] = (FILE *)v4;
  if (!v4)
  {
    fclose(*v3);
    free(v3);
    return 0;
  }
  return v3;
}

void crfsuite_delete_feature_tokenizer(FILE **a1)
{
  FILE *v2;
  void **v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      fclose(v2);
    v3 = (void **)a1[1];
    if (v3)
      iwa_delete(v3);
    free(a1);
  }
}

uint64_t crfsuite_feature_tokenizer_get_next_token(uint64_t result)
{
  if (result)
    return iwa_read(*(_QWORD *)(result + 8));
  return result;
}

unsigned int *crfsuite_feature_token_get_type(unsigned int *result)
{
  if (result)
  {
    if (*result - 1 >= 4)
      return 0;
    else
      return (unsigned int *)*result;
  }
  return result;
}

uint64_t crfsuite_feature_token_get_attribute(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

uint64_t crfsuite_feature_token_get_value(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

_DWORD *dataset_init_trainset(uint64_t a1, unsigned int *a2, int a3, int a4, int a5)
{
  uint64_t v10;
  unsigned int v11;
  int *v12;
  int v13;
  _DWORD *result;
  int v15;
  uint64_t v16;
  int v17;
  int *v18;
  int v19;

  v10 = *a2;
  if ((int)v10 < 1)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    v12 = (int *)(*((_QWORD *)a2 + 1) + 24);
    do
    {
      v13 = *v12;
      v12 += 8;
      if (v13 != a5)
        ++v11;
      --v10;
    }
    while (v10);
  }
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 16) = v11;
  result = malloc_type_malloc(4 * v11, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 24) = a4;
  v15 = *a2;
  if ((int)*a2 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = (int *)(*((_QWORD *)a2 + 1) + 24);
    do
    {
      v19 = *v18;
      v18 += 8;
      if (v19 != a5)
      {
        result[v17++] = v16;
        v15 = *a2;
      }
      ++v16;
    }
    while (v16 < v15);
  }
  return result;
}

_DWORD *dataset_init_testset(uint64_t a1, unsigned int *a2, int a3, int a4, int a5)
{
  uint64_t v10;
  unsigned int v11;
  int *v12;
  int v13;
  _DWORD *result;
  int v15;
  uint64_t v16;
  int v17;
  int *v18;
  int v19;

  v10 = *a2;
  if ((int)v10 < 1)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    v12 = (int *)(*((_QWORD *)a2 + 1) + 24);
    do
    {
      v13 = *v12;
      v12 += 8;
      if (v13 == a5)
        ++v11;
      --v10;
    }
    while (v10);
  }
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 16) = v11;
  result = malloc_type_malloc(4 * v11, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 24) = a4;
  v15 = *a2;
  if ((int)*a2 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = (int *)(*((_QWORD *)a2 + 1) + 24);
    do
    {
      v19 = *v18;
      v18 += 8;
      if (v19 == a5)
      {
        result[v17++] = v16;
        v15 = *a2;
      }
      ++v16;
    }
    while (v16 < v15);
  }
  return result;
}

void dataset_finish(uint64_t a1)
{
  free(*(void **)(a1 + 8));
}

uint64_t dataset_shuffle(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  if (*(int *)(result + 16) >= 1)
  {
    v1 = result;
    v2 = 0;
    do
    {
      result = rand();
      v3 = (int)result % *(_DWORD *)(v1 + 16);
      v4 = *(_QWORD *)(v1 + 8);
      v5 = *(_DWORD *)(v4 + 4 * v3);
      *(_DWORD *)(v4 + 4 * v3) = *(_DWORD *)(v4 + 4 * v2);
      *(_DWORD *)(v4 + 4 * v2++) = v5;
    }
    while (v2 < *(int *)(v1 + 16));
  }
  return result;
}

uint64_t dataset_get(_QWORD *a1, int a2)
{
  return *(_QWORD *)(*a1 + 8) + 32 * *(int *)(a1[1] + 4 * a2);
}

uint64_t crfsuite_dictionary_create_instance(const char *a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v4;
  _DWORD *v5;
  _QWORD *v6;

  if (strcmp(a1, "dictionary"))
    return 1;
  v4 = malloc_type_calloc(1uLL, 0x48uLL, 0x1080040D23F5C74uLL);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  v6 = quark_new();
  result = 0;
  *(_QWORD *)v5 = v6;
  v5[2] = 1;
  *((_QWORD *)v5 + 2) = dictionary_addref;
  *((_QWORD *)v5 + 3) = dictionary_release;
  *((_QWORD *)v5 + 4) = dictionary_get;
  *((_QWORD *)v5 + 5) = dictionary_to_id;
  *((_QWORD *)v5 + 6) = dictionary_to_string;
  *((_QWORD *)v5 + 7) = dictionary_num;
  *((_QWORD *)v5 + 8) = dictionary_free;
  *a2 = v5;
  return result;
}

uint64_t dictionary_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t dictionary_release(uint64_t a1)
{
  uint64_t v2;

  v2 = crfsuite_interlocked_decrement((_DWORD *)(a1 + 8));
  if (!(_DWORD)v2)
  {
    quark_delete(*(_QWORD *)a1);
    free((void *)a1);
  }
  return v2;
}

uint64_t dictionary_get(int **a1, const char *a2)
{
  return quark_get(*a1, a2);
}

uint64_t dictionary_to_id(uint64_t *a1, uint64_t a2)
{
  return quark_to_id(*a1, a2);
}

uint64_t dictionary_to_string(uint64_t *a1, int a2, char **a3)
{
  const char *v4;
  const char *v5;
  size_t v6;
  char *v7;
  char *v8;
  uint64_t result;

  v4 = (const char *)quark_to_string(*a1, a2);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = strlen(v4);
  v7 = (char *)malloc_type_malloc(v6 + 1, 0x99BD5285uLL);
  if (!v7)
    return 1;
  v8 = v7;
  strcpy(v7, v5);
  result = 0;
  *a3 = v8;
  return result;
}

uint64_t dictionary_num(unsigned int **a1)
{
  return crf1dm_get_version(*a1);
}

void dictionary_free(int a1, void *a2)
{
  free(a2);
}

uint64_t ME_Efficient_Model_Trainer::perform_SGD(ME_Efficient_Model_Trainer *this)
{
  _QWORD *v2;
  const std::locale::facet *v3;
  double v4;
  uint64_t v5;
  std::vector<int>::pointer begin;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  const std::locale::facet *v12;
  _QWORD *v13;
  double *v14;
  double *v15;
  uint64_t v16;
  double *v17;
  double *v18;
  uint64_t v19;
  int v20;
  int v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  int v26;
  _QWORD *v27;
  int v28;
  double v29;
  double *v30;
  double v31;
  double *v32;
  double *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  int v43;
  uint64_t v44;
  int *v45;
  int **v46;
  int *v47;
  int *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  unsigned __int8 v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  std::locale::__imp *locale;
  double v60;
  uint64_t v61;
  int *v62;
  int **v63;
  int *v64;
  int *v65;
  uint64_t v66;
  uint64_t v67;
  int *v68;
  unsigned __int8 v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  std::locale::__imp *v75;
  double v76;
  unint64_t v77;
  int v78;
  double v79;
  FILE **v80;
  double *v81;
  uint64_t v82;
  unint64_t v83;
  double v84;
  double v85;
  double v86;
  _QWORD *v88;
  int v89;
  double v90;
  int v91;
  int v92;
  void *__p[3];
  std::vector<int>::value_type __x[2];
  double *v95;
  double *v96;
  std::vector<int> v97;
  std::locale v98;
  std::locale::__imp *v99;
  void *v100[3];
  std::vector<int> v101;

  if (*((double *)this + 4) > 0.0)
  {
    v88 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x24BEDB310], "error: L2 regularization is currently not supported in SGD mode.");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v88);
    exit(1);
  }
  v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"performing SGD", 14);
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)));
  v3 = std::locale::use_facet((const std::locale *)&v101, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale((std::locale *)&v101);
  std::ostream::put();
  std::ostream::flush();
  v4 = *((double *)this + 3);
  v5 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
  std::vector<int>::vector(&v101, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 6) - *((_QWORD *)this + 5)) >> 4));
  begin = v101.__begin_;
  if (v101.__end_ != v101.__begin_)
  {
    v7 = 0;
    v8 = v101.__end_ - v101.__begin_;
    if (v8 <= 1)
      v8 = 1;
    do
    {
      begin[v7] = v7;
      ++v7;
    }
    while (v8 != v7);
  }
  v9 = (int)(v5 >> 2);
  std::vector<double>::vector(v100, v9);
  v90 = *((double *)this + 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"eta0 = ", 7);
  v10 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" alpha = ", 9);
  v11 = (_QWORD *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(_QWORD *)(*v11 - 24)));
  v12 = std::locale::use_facet(&v98, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
  std::locale::~locale(&v98);
  std::ostream::put();
  std::ostream::flush();
  v97.__begin_ = 0;
  std::vector<double>::vector(&v98, v9, &v97);
  __x[0] = 0;
  std::vector<int>::vector(&v97, v9, __x);
  *(_QWORD *)__x = 0;
  v95 = 0;
  v96 = 0;
  v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v96, 1uLL);
  v14 = *(double **)__x;
  v15 = v95;
  v17 = (double *)&v13[v16];
  *v13 = 0;
  v18 = (double *)(v13 + 1);
  while (v15 != v14)
  {
    v19 = *((_QWORD *)v15-- - 1);
    *--v13 = v19;
  }
  *(_QWORD *)__x = v13;
  v95 = v18;
  v96 = v17;
  if (v14)
    operator delete(v14);
  v95 = v18;
  if (*((int *)this + 1) >= 1)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0.0;
    while (1)
    {
      std::random_shuffle[abi:ne180100]<std::__wrap_iter<int *>>((uint64_t)v101.__begin_, (uint64_t)v101.__end_);
      v23 = *((_QWORD *)this + 5);
      if (*((_QWORD *)this + 6) != v23)
        break;
      v78 = 0;
      LODWORD(v24) = 0;
      v77 = 0;
      v25 = 0.0;
LABEL_66:
      v79 = v25 / (double)v77;
      v80 = (FILE **)MEMORY[0x24BDAC8D8];
      if (v4 > 0.0)
      {
        v81 = (double *)*((_QWORD *)this + 18);
        v82 = *((_QWORD *)this + 19) - (_QWORD)v81;
        if (v82)
        {
          v83 = v82 >> 3;
          if (v83 <= 1)
            v83 = 1;
          v84 = 0.0;
          do
          {
            v85 = *v81++;
            v84 = v84 + fabs(v85);
            --v83;
          }
          while (v83);
        }
        else
        {
          v84 = 0.0;
        }
        v79 = v79 + -v4 * v84;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%3d  obj(err) = %f (%6.4f)", ++v21, v79, 1.0 - (double)v78 / (double)(int)v24);
      if (*((int *)this + 88) >= 1)
      {
        v86 = ME_Efficient_Model_Trainer::heldout_likelihood(this);
        fprintf(*v80, "  heldout_logl(err) = %f (%6.4f)", v86, *((double *)this + 43));
      }
      fputc(10, *v80);
      if (v21 >= *((_DWORD *)this + 1))
        goto LABEL_78;
    }
    v89 = v21;
    v24 = 0;
    v92 = 0;
    v25 = 0.0;
LABEL_15:
    v26 = v101.__begin_[v24];
    std::vector<double>::vector(__p, *((int *)this + 58));
    v27 = (_QWORD *)(v23 + 80 * v26);
    v28 = ME_Efficient_Model_Trainer::conditional_probability((uint64_t)this, v27, (double **)__p);
    v91 = v20;
    v29 = v90
        * pow(*((long double *)this + 2), (double)v20/ (double)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 6) - *((_QWORD *)this + 5)) >> 4)));
    v30 = v95;
    v31 = *(v95 - 1) + v29 * v4;
    if (v95 >= v96)
    {
      v33 = *(double **)__x;
      v34 = ((uint64_t)v95 - *(_QWORD *)__x) >> 3;
      v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 61)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v36 = (uint64_t)v96 - *(_QWORD *)__x;
      if (((uint64_t)v96 - *(_QWORD *)__x) >> 2 > v35)
        v35 = v36 >> 2;
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
        v37 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v37 = v35;
      if (v37)
      {
        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v96, v37);
        v33 = *(double **)__x;
        v30 = v95;
      }
      else
      {
        v38 = 0;
      }
      v39 = (double *)&v38[8 * v34];
      *v39 = v31;
      v32 = v39 + 1;
      while (v30 != v33)
      {
        v40 = *((_QWORD *)v30-- - 1);
        *((_QWORD *)v39-- - 1) = v40;
      }
      *(_QWORD *)__x = v39;
      v95 = v32;
      v96 = (double *)&v38[8 * v37];
      if (v33)
        operator delete(v33);
    }
    else
    {
      *v95 = v31;
      v32 = v30 + 1;
    }
    v22 = v22 + v29 * v4;
    v95 = v32;
    v41 = *(int *)v27;
    v42 = log(*((long double *)__p[0] + v41));
    v43 = v92;
    if (v28 == (_DWORD)v41)
      v43 = v92 + 1;
    v92 = v43;
    v44 = v23 + 80 * v26;
    v47 = *(int **)(v44 + 16);
    v46 = (int **)(v44 + 16);
    v45 = v47;
    v48 = *(v46 - 1);
    v49 = -v29;
    if (v48 == v47)
      goto LABEL_47;
    v50 = *((_QWORD *)this + 36);
LABEL_35:
    v51 = v50 + 24 * *v48;
    v52 = *(int **)v51;
    if (*(_QWORD *)v51 == *(_QWORD *)(v51 + 8))
      goto LABEL_46;
    while (1)
    {
      v53 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v52);
      v54 = *((double *)__p[0] + v53);
      v55 = *(_DWORD *)v27 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v52)? 1.0: 0.0;
      v56 = *v52;
      v57 = *((_QWORD *)this + 18);
      v58 = *(double *)(v57 + 8 * v56) + v49 * (v54 - v55);
      *(double *)(v57 + 8 * v56) = v58;
      locale = v98.__locale_;
      if (v58 > 0.0)
        break;
      v60 = v58;
      if (v58 < 0.0)
      {
        v60 = fmin(v58 + v22 - *((double *)v98.__locale_ + v56), 0.0);
        goto LABEL_43;
      }
LABEL_44:
      *((double *)locale + v56) = *((double *)locale + v56) + v60 - v58;
      ++v52;
      v50 = *((_QWORD *)this + 36);
      if (v52 == *(int **)(v50 + 24 * *v48 + 8))
      {
        v45 = *v46;
LABEL_46:
        if (++v48 == v45)
        {
LABEL_47:
          v61 = v23 + 80 * v26;
          v64 = *(int **)(v61 + 40);
          v63 = (int **)(v61 + 40);
          v62 = v64;
          v65 = *(v63 - 1);
          if (v65 == v64)
            goto LABEL_61;
          v66 = *((_QWORD *)this + 36);
          while (2)
          {
            v67 = v66 + 24 * *v65;
            v68 = *(int **)v67;
            if (*(_QWORD *)v67 == *(_QWORD *)(v67 + 8))
              goto LABEL_60;
            while (2)
            {
              v69 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v68);
              v70 = *((double *)__p[0] + v69);
              if (*(_DWORD *)v27 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v68))v71 = 1.0;
              else
                v71 = 0.0;
              v72 = *v68;
              v73 = *((_QWORD *)this + 18);
              v74 = *(double *)(v73 + 8 * v72) + v49 * (*((double *)v65 + 1) * (v70 - v71));
              *(double *)(v73 + 8 * v72) = v74;
              v75 = v98.__locale_;
              if (v74 > 0.0)
              {
                v76 = fmax(v74 - (v22 + *((double *)v98.__locale_ + v72)), 0.0);
                goto LABEL_57;
              }
              v76 = v74;
              if (v74 < 0.0)
              {
                v76 = fmin(v74 + v22 - *((double *)v98.__locale_ + v72), 0.0);
LABEL_57:
                *(double *)(v73 + 8 * v72) = v76;
              }
              *((double *)v75 + v72) = *((double *)v75 + v72) + v76 - v74;
              ++v68;
              v66 = *((_QWORD *)this + 36);
              if (v68 != *(int **)(v66 + 24 * *v65 + 8))
                continue;
              break;
            }
            v62 = *v63;
LABEL_60:
            v65 += 4;
            if (v65 != v62)
              continue;
            break;
          }
LABEL_61:
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          v25 = v25 + v42;
          ++v24;
          v20 = v91 + 1;
          v23 = *((_QWORD *)this + 5);
          v77 = 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)this + 6) - v23) >> 4);
          if (v24 >= v77)
          {
            v21 = v89;
            v78 = v92;
            goto LABEL_66;
          }
          goto LABEL_15;
        }
        goto LABEL_35;
      }
    }
    v60 = fmax(v58 - (v22 + *((double *)v98.__locale_ + v56)), 0.0);
LABEL_43:
    *(double *)(v57 + 8 * v56) = v60;
    goto LABEL_44;
  }
LABEL_78:
  if (*(_QWORD *)__x)
  {
    v95 = *(double **)__x;
    operator delete(*(void **)__x);
  }
  if (v97.__begin_)
  {
    v97.__end_ = v97.__begin_;
    operator delete(v97.__begin_);
  }
  if (v98.__locale_)
  {
    v99 = v98.__locale_;
    operator delete(v98.__locale_);
  }
  if (v100[0])
  {
    v100[1] = v100[0];
    operator delete(v100[0]);
  }
  if (v101.__begin_)
  {
    v101.__end_ = v101.__begin_;
    operator delete(v101.__begin_);
  }
  return 0;
}

void sub_2083F2FFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,std::locale a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  uint64_t v31;
  void *v33;

  if (__p)
    operator delete(__p);
  if (a24)
    operator delete(a24);
  if (a27.__locale_)
    operator delete(a27.__locale_);
  if (a30)
    operator delete(a30);
  v33 = *(void **)(v31 - 176);
  if (v33)
  {
    *(_QWORD *)(v31 - 168) = v33;
    operator delete(v33);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

_QWORD *std::endl[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_2083F3180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t std::random_shuffle[abi:ne180100]<std::__wrap_iter<int *>>(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  int *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD v9[2];
  char v10;
  __int128 v11;

  v2 = a2 - result;
  if (a2 - result >= 5)
  {
    v4 = (int *)result;
    v11 = xmmword_208419650;
    std::__rs_get();
    v5 = a2 - 4;
    if (v5 > (unint64_t)v4)
    {
      v6 = (v2 >> 2) - 1;
      do
      {
        v9[0] = 0;
        v9[1] = v6;
        v7 = std::uniform_int_distribution<long>::operator()<std::__rs_default>((uint64_t)&v11, (uint64_t)&v10, v9);
        if (v7)
        {
          v8 = *v4;
          *v4 = v4[v7];
          v4[v7] = v8;
        }
        ++v4;
        --v6;
      }
      while ((unint64_t)v4 < v5);
    }
    return MEMORY[0x20BD06734](&v10);
  }
  return result;
}

uint64_t ME_Efficient_Model_Trainer::ME_FeatureBag::Feature(ME_Efficient_Model_Trainer::ME_FeatureBag *this, int a2)
{
  uint64_t v2;

  if (a2 < 0 || (v2 = *((_QWORD *)this + 5), (int)((unint64_t)(*((_QWORD *)this + 6) - v2) >> 2) <= a2))
    ME_Efficient_Model_Trainer::ME_FeatureBag::Feature();
  return *(unsigned int *)(v2 + 4 * a2);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x20BD06794](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x20BD067A0](v13);
  return a1;
}

void sub_2083F3394(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x20BD067A0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2083F3374);
}

void sub_2083F33DC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_2083F3510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::vector<int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_2083F3640(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<int>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2083F3728(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_2083F37A8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  std::vector<int>::pointer end;
  int *v7;
  std::vector<int>::size_type v8;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[__n];
    v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_2083F3828(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::uniform_int_distribution<long>::operator()<std::__rs_default>(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE v10[64];

  result = a3[1];
  v4 = result - *a3;
  if (result != *a3)
  {
    v5 = v4 + 1;
    if (v4 == -1)
    {
      std::__independent_bits_engine<std::__rs_default,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, 0x40uLL);
      return std::__independent_bits_engine<std::__rs_default,unsigned long>::__eval((uint64_t)v10);
    }
    else
    {
      v7 = __clz(v5);
      v8 = 63;
      if (((v5 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v8 = 64;
      std::__independent_bits_engine<std::__rs_default,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, v8 - v7);
      do
        v9 = std::__independent_bits_engine<std::__rs_default,unsigned long>::__eval((uint64_t)v10);
      while (v9 >= v5);
      return *a3 + v9;
    }
  }
  return result;
}

uint64_t std::__independent_bits_engine<std::__rs_default,unsigned long>::__independent_bits_engine(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0)
    v3 = (a3 >> 5) + 1;
  else
    v3 = a3 >> 5;
  v4 = a3 / v3;
  *(_QWORD *)(result + 16) = a3 / v3;
  *(_QWORD *)(result + 24) = v3;
  v5 = (-1 << (a3 / v3)) & 0x100000000;
  if (a3 / v3 >= 0x40)
    v5 = 0;
  *(_QWORD *)(result + 40) = v5;
  if ((v5 ^ 0x100000000) > v5 / v3)
  {
    ++v3;
    v4 = a3 / v3;
    *(_QWORD *)(result + 16) = a3 / v3;
    *(_QWORD *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      v6 = 0;
      *(_QWORD *)(result + 32) = v3 + v4 * v3 - a3;
      *(_QWORD *)(result + 40) = 0;
      goto LABEL_13;
    }
    *(_QWORD *)(result + 40) = (-1 << v4) & 0x100000000;
  }
  *(_QWORD *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 > 0x3E)
    v6 = 0;
  else
    v6 = 0x80000000uLL >> v4 << (v4 + 1);
LABEL_13:
  *(_QWORD *)(result + 48) = v6;
  v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4)
    v7 = 0;
  if (v4 >= 0x1F)
    v8 = -1;
  else
    v8 = 0xFFFFFFFF >> ~(_BYTE)v4;
  *(_DWORD *)(result + 56) = v7;
  *(_DWORD *)(result + 60) = v8;
  return result;
}

uint64_t std::__independent_bits_engine<std::__rs_default,unsigned long>::__eval(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  std::__rs_default::result_type v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::__rs_default::result_type v8;
  unint64_t v9;
  uint64_t v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      do
        v4 = std::__rs_default::operator()(*(std::__rs_default **)a1);
      while (*(_QWORD *)(a1 + 40) <= (unint64_t)v4);
      v5 = *(_QWORD *)(a1 + 16);
      if (v5 >= 0x40)
        v6 = 0;
      else
        v6 = v2 << v5;
      v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      v7 = *(_QWORD *)(a1 + 32);
    }
    while (v3 < v7);
  }
  else
  {
    v2 = 0;
    v7 = 0;
  }
  for (; v7 < *(_QWORD *)(a1 + 24); ++v7)
  {
    do
      v8 = std::__rs_default::operator()(*(std::__rs_default **)a1);
    while (*(_QWORD *)(a1 + 48) <= (unint64_t)v8);
    v9 = *(_QWORD *)(a1 + 16);
    if (v9 >= 0x3F)
      v10 = 0;
    else
      v10 = v2 << (v9 + 1);
    v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }
  return v2;
}

void holdout_evaluation(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t *a4)
{
  int v8;
  int v9;
  void *v10;
  int i;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[5];

  memset(v18, 0, sizeof(v18));
  v8 = a2[4];
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)a2 + 24) + 56))();
  crfsuite_evaluation_init((uint64_t)v18, v9);
  (*(void (**)(uint64_t, uint64_t, double))(a1 + 88))(a1, a3, 1.0);
  if (v8 < 1)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    for (i = 0; i != v8; ++i)
    {
      v17 = 0;
      v12 = (int *)dataset_get(a2, i);
      if (*v12 >= 1)
      {
        free(v10);
        v10 = malloc_type_malloc(4 * *v12, 0x100004052888210uLL);
      }
      (*(void (**)(uint64_t, int *))(a1 + 96))(a1, v12);
      (*(void (**)(uint64_t, void *, uint64_t *))(a1 + 112))(a1, v10, &v17);
      crfsuite_evaluation_accmulate((int *)v18, *((int **)v12 + 2), (int *)v10, *v12);
    }
  }
  crfsuite_evaluation_finalize((unsigned int *)v18);
  crfsuite_evaluation_output((int *)v18, *(_QWORD *)(*(_QWORD *)a2 + 24), a4[1], *a4, v13, v14, v15, v16);
  crfsuite_evaluation_finish((uint64_t)v18);
  if (v10)
    free(v10);
}

char *iwa_reader(uint64_t a1)
{
  char *v2;
  char *v3;
  char *v4;

  v2 = (char *)malloc_type_malloc(0x68uLL, 0x1070040CBD6686FuLL);
  v3 = v2;
  if (!v2)
    goto LABEL_4;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_QWORD *)v2 = a1;
  v4 = (char *)malloc_type_malloc(0x10000uLL, 0x100004077774924uLL);
  *((_QWORD *)v3 + 4) = v4;
  *((_QWORD *)v3 + 5) = v4 + 0x10000;
  *((_QWORD *)v3 + 6) = v4 + 0x10000;
  if (v4)
  {
    *((_QWORD *)v3 + 9) = malloc_type_calloc(0x1000uLL, 1uLL, 0x100004077774924uLL);
    *(_OWORD *)(v3 + 56) = xmmword_208419660;
    *((_QWORD *)v3 + 12) = malloc_type_calloc(0x1000uLL, 1uLL, 0x100004077774924uLL);
    *((_OWORD *)v3 + 5) = xmmword_208419660;
  }
  else
  {
LABEL_4:
    iwa_delete((void **)v3);
    return 0;
  }
  return v3;
}

void iwa_delete(void **a1)
{
  if (a1)
  {
    free(a1[12]);
    a1[10] = 0;
    a1[11] = 0;
    a1[12] = 0;
    free(a1[9]);
    a1[7] = 0;
    a1[8] = 0;
    a1[9] = 0;
    free(a1[4]);
  }
  free(a1);
}

uint64_t iwa_read(uint64_t a1)
{
  int v2;
  int v3;
  int *v4;
  uint64_t result;
  int v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  bzero(*(void **)(a1 + 72), *(_QWORD *)(a1 + 56));
  *(_QWORD *)(a1 + 64) = 0;
  bzero(*(void **)(a1 + 96), *(_QWORD *)(a1 + 80));
  *(_QWORD *)(a1 + 88) = 0;
  v2 = peek_char(a1);
  v4 = (int *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 8);
  if (v2 == -1)
  {
    result = 0;
    switch(v3)
    {
      case 0:
      case 3:
        v6 = 1;
        goto LABEL_22;
      case 1:
        return result;
      case 2:
        goto LABEL_15;
      case 4:
LABEL_11:
        while (1)
        {
          v7 = peek_char(a1);
          if (v7 != 9)
            break;
          if (peek_char(a1) != -1)
            ++*(_QWORD *)(a1 + 40);
        }
        if (v7 == 10)
        {
          if (peek_char(a1) != -1)
            ++*(_QWORD *)(a1 + 40);
LABEL_15:
          v6 = 3;
LABEL_22:
          *v4 = v6;
        }
        else
        {
          read_field_unescaped(a1, (unint64_t *)(a1 + 56));
          if (peek_char(a1) == 58)
          {
            if (peek_char(a1) != -1)
              ++*(_QWORD *)(a1 + 40);
            read_field_unescaped(a1, (unint64_t *)(a1 + 80));
            peek_char(a1);
          }
          *(_DWORD *)(a1 + 8) = 4;
          v8 = *(_QWORD *)(a1 + 96);
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 72);
          *(_QWORD *)(a1 + 24) = v8;
        }
        break;
      default:
        return a1 + 8;
    }
  }
  else
  {
    switch(v3)
    {
      case 0:
      case 3:
        if (peek_char(a1) != 10)
        {
          v6 = 2;
          goto LABEL_22;
        }
        if (peek_char(a1) != -1)
          ++*(_QWORD *)(a1 + 40);
        *v4 = 0;
        break;
      case 2:
      case 4:
        goto LABEL_11;
      default:
        return a1 + 8;
    }
  }
  return a1 + 8;
}

uint64_t peek_char(uint64_t a1)
{
  char *v1;
  size_t v3;

  v1 = *(char **)(a1 + 40);
  if (*(_QWORD *)(a1 + 48) > (unint64_t)v1)
    return *v1;
  v3 = fread(*(void **)(a1 + 32), 1uLL, 0x10000uLL, *(FILE **)a1);
  v1 = *(char **)(a1 + 32);
  *(_QWORD *)(a1 + 40) = v1;
  *(_QWORD *)(a1 + 48) = &v1[v3];
  if (v3)
    return *v1;
  else
    return 0xFFFFFFFFLL;
}

uint64_t read_field_unescaped(uint64_t a1, unint64_t *a2)
{
  uint64_t result;
  int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;

  while (1)
  {
    result = peek_char(a1);
    if ((result + 1) <= 0x3B && ((1 << (result + 1)) & 0x800000000000C01) != 0)
      break;
    v6 = result;
    if (peek_char(a1) != -1)
      ++*(_QWORD *)(a1 + 40);
    if (v6 == 92)
    {
      v7 = peek_char(a1);
      LOBYTE(v6) = v7;
      if (v7 == 92 || v7 == 58)
      {
        if (peek_char(a1) != -1)
          ++*(_QWORD *)(a1 + 40);
      }
      else
      {
        LOBYTE(v6) = 92;
      }
    }
    v9 = *a2;
    v8 = a2[1];
    if (*a2 <= v8)
    {
      *a2 = 2 * v9;
      v10 = (char *)malloc_type_realloc((void *)a2[2], 2 * v9, 0x662AD362uLL);
      a2[2] = (unint64_t)v10;
      bzero(&v10[a2[1]], *a2 - a2[1]);
      v8 = a2[1];
    }
    v11 = a2[2];
    a2[1] = v8 + 1;
    *(_BYTE *)(v11 + v8) = v6;
  }
  return result;
}

_QWORD *logging(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v9)(_QWORD, uint64_t, uint64_t *);

  if (result)
  {
    v9 = (uint64_t (*)(_QWORD, uint64_t, uint64_t *))result[1];
    if (v9)
      return (_QWORD *)v9(*result, a2, &a9);
  }
  return result;
}

_QWORD *logging_timestamp(_QWORD *a1, uint64_t a2)
{
  tm *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  time_t v12;
  char v13[80];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  time(&v12);
  v4 = gmtime(&v12);
  strftime(v13, 0x50uLL, "%Y-%m-%dT%H:%M:%SZ", v4);
  return logging(a1, a2, v5, v6, v7, v8, v9, v10, (uint64_t)v13);
}

_QWORD *logging_progress_start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_DWORD *)(a1 + 16) = 0;
  return logging((_QWORD *)a1, (uint64_t)"0", a3, a4, a5, a6, a7, a8, a9);
}

_QWORD *logging_progress(_QWORD *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  _QWORD *v10;
  int v11;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;

  v8 = *((_DWORD *)result + 4);
  if (v8 < a2)
  {
    v10 = result;
    do
    {
      v11 = v8 + 1;
      *((_DWORD *)v10 + 4) = v11;
      if ((v11 & 1) == 0)
      {
        if (v11 % 10)
        {
          v12 = v10;
          v13 = ".";
        }
        else
        {
          v14 = (v11 / 10);
          v12 = v10;
          v13 = "%d";
        }
        result = logging(v12, (uint64_t)v13, a3, a4, a5, a6, a7, a8, v14);
      }
      v8 = *((_DWORD *)v10 + 4);
    }
    while (v8 < a2);
  }
  return result;
}

_QWORD *logging_progress_end(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  logging_progress(a1, 100, a3, a4, a5, a6, a7, a8);
  return logging(a1, (uint64_t)"\n", v10, v11, v12, v13, v14, v15, a9);
}

_DWORD *params_create_instance()
{
  _DWORD *v0;
  void *v1;

  v0 = malloc_type_calloc(1uLL, 0x80uLL, 0x108004084EFEF47uLL);
  if (v0)
  {
    v1 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
    *(_QWORD *)v0 = v1;
    if (v1)
    {
      v0[2] = 1;
      *((_QWORD *)v0 + 2) = params_addref;
      *((_QWORD *)v0 + 3) = params_release;
      *((_QWORD *)v0 + 4) = params_num;
      *((_QWORD *)v0 + 5) = params_name;
      *((_QWORD *)v0 + 6) = params_set;
      *((_QWORD *)v0 + 7) = params_get;
      *((_QWORD *)v0 + 8) = params_set_int;
      *((_QWORD *)v0 + 9) = params_set_float;
      *((_QWORD *)v0 + 10) = params_set_string;
      *((_QWORD *)v0 + 11) = params_get_int;
      *((_QWORD *)v0 + 12) = params_get_float;
      *((_QWORD *)v0 + 13) = params_get_string;
      *((_QWORD *)v0 + 14) = params_help;
      *((_QWORD *)v0 + 15) = params_free;
    }
    else
    {
      free(v0);
      return 0;
    }
  }
  return v0;
}

uint64_t params_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t params_release(_DWORD *a1)
{
  uint64_t v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;

  v2 = crfsuite_interlocked_decrement(a1 + 2);
  if (!(_DWORD)v2)
  {
    v3 = *(void ***)a1;
    if (**(int **)a1 >= 1)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        free(*(void **)((char *)v3[1] + v4));
        free(*(void **)((char *)v3[1] + v4 + 24));
        free(*(void **)((char *)v3[1] + v4 + 32));
        ++v5;
        v4 += 40;
      }
      while (v5 < *(int *)v3);
    }
    free(v3[1]);
    free(v3);
    free(a1);
  }
  return v2;
}

uint64_t params_num(unsigned int **a1)
{
  return **a1;
}

uint64_t params_name(uint64_t a1, int a2, char **a3)
{
  *a3 = mystrdup(*(const char **)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40 * a2));
  return 0;
}

uint64_t params_set(unsigned int **a1, char *a2, const char *a3)
{
  const char **param;
  const char **v5;
  int v6;
  int v7;
  uint64_t result;
  const char *v9;
  char *v10;
  double v11;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  v6 = *((_DWORD *)param + 2);
  switch(v6)
  {
    case 3:
      free((void *)param[3]);
      if (a3)
        v9 = a3;
      else
        v9 = "";
      v10 = mystrdup(v9);
      result = 0;
      v5[3] = v10;
      break;
    case 2:
      if (a3)
        v11 = atof(a3);
      else
        v11 = 0.0;
      result = 0;
      *((double *)v5 + 2) = v11;
      break;
    case 1:
      if (a3)
        v7 = atoi(a3);
      else
        v7 = 0;
      result = 0;
      *((_DWORD *)v5 + 3) = v7;
      break;
    default:
      return 0;
  }
  return result;
}

uint64_t params_get(unsigned int **a1, char *a2, char **a3)
{
  const char **param;
  int v5;
  uint64_t result;
  char *v7;
  char *v8;
  char __str[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = *((_DWORD *)param + 2);
  switch(v5)
  {
    case 3:
      v7 = (char *)param[3];
LABEL_10:
      v8 = mystrdup(v7);
      result = 0;
      *a3 = v8;
      return result;
    case 2:
      snprintf(__str, 0x3FFuLL, "%f");
      goto LABEL_9;
    case 1:
      snprintf(__str, 0x3FFuLL, "%d");
LABEL_9:
      v7 = __str;
      goto LABEL_10;
  }
  return 0;
}

void params_free(int a1, void *a2)
{
  free(a2);
}

uint64_t params_set_int(unsigned int **a1, char *a2, int a3)
{
  const char **param;
  const char **v5;
  uint64_t result;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  if (*((_DWORD *)param + 2) != 1)
    return 0xFFFFFFFFLL;
  result = 0;
  *((_DWORD *)v5 + 3) = a3;
  return result;
}

uint64_t params_set_float(unsigned int **a1, char *a2, double a3)
{
  const char **param;
  const char **v5;
  uint64_t result;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  if (*((_DWORD *)param + 2) != 2)
    return 0xFFFFFFFFLL;
  result = 0;
  *((double *)v5 + 2) = a3;
  return result;
}

uint64_t params_set_string(unsigned int **a1, char *a2, const char *a3)
{
  const char **param;
  const char **v5;
  char *v6;
  uint64_t result;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  if (*((_DWORD *)param + 2) != 3)
    return 0xFFFFFFFFLL;
  free((void *)param[3]);
  v6 = mystrdup(a3);
  result = 0;
  v5[3] = v6;
  return result;
}

uint64_t params_get_int(unsigned int **a1, char *a2, _DWORD *a3)
{
  const char **param;
  const char **v5;
  uint64_t result;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  if (*((_DWORD *)param + 2) != 1)
    return 0xFFFFFFFFLL;
  result = 0;
  *a3 = *((_DWORD *)v5 + 3);
  return result;
}

uint64_t params_get_float(unsigned int **a1, char *a2, _QWORD *a3)
{
  const char **param;
  const char **v5;
  uint64_t result;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  if (*((_DWORD *)param + 2) != 2)
    return 0xFFFFFFFFLL;
  result = 0;
  *a3 = v5[2];
  return result;
}

uint64_t params_get_string(unsigned int **a1, char *a2, _QWORD *a3)
{
  const char **param;
  const char **v5;
  uint64_t result;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v5 = param;
  if (*((_DWORD *)param + 2) != 3)
    return 0xFFFFFFFFLL;
  result = 0;
  *a3 = v5[3];
  return result;
}

uint64_t params_help(unsigned int **a1, char *a2, char **a3, char **a4)
{
  const char **param;
  const char **v7;
  unsigned int v8;
  const char *v9;
  uint64_t result;
  char *v11;

  param = find_param(*a1, a2);
  if (!param)
    return 0xFFFFFFFFLL;
  v7 = param;
  if (a3)
  {
    v8 = *((_DWORD *)param + 2) - 1;
    if (v8 > 2)
      v9 = "unknown";
    else
      v9 = off_24C09DC68[v8];
    *a3 = mystrdup(v9);
  }
  if (!a4)
    return 0;
  v11 = mystrdup(v7[4]);
  result = 0;
  *a4 = v11;
  return result;
}

uint64_t params_add_int(int **a1, const char *a2, int a3, const char *a4)
{
  uint64_t v7;
  char *v8;
  int v9;
  char *v10;
  char *v11;
  uint64_t result;

  v7 = (uint64_t)*a1;
  v8 = (char *)malloc_type_realloc(*((void **)*a1 + 1), 40 * **a1 + 40, 0x10100400F471BF6uLL);
  *(_QWORD *)(v7 + 8) = v8;
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = (*(_DWORD *)v7)++;
  v10 = &v8[40 * v9];
  *((_QWORD *)v10 + 4) = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(_QWORD *)v10 = mystrdup(a2);
  *((_DWORD *)v10 + 2) = 1;
  *((_DWORD *)v10 + 3) = a3;
  v11 = mystrdup(a4);
  result = 0;
  *((_QWORD *)v10 + 4) = v11;
  return result;
}

char *mystrdup(const char *a1)
{
  size_t v2;
  char *result;

  v2 = strlen(a1);
  result = (char *)malloc_type_malloc(v2 + 1, 0x5AE64158uLL);
  if (result)
    return strcpy(result, a1);
  return result;
}

uint64_t params_add_float(int **a1, const char *a2, const char *a3, double a4)
{
  uint64_t v7;
  char *v8;
  int v9;
  char *v10;
  char *v11;
  uint64_t result;

  v7 = (uint64_t)*a1;
  v8 = (char *)malloc_type_realloc(*((void **)*a1 + 1), 40 * **a1 + 40, 0x10100400F471BF6uLL);
  *(_QWORD *)(v7 + 8) = v8;
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = (*(_DWORD *)v7)++;
  v10 = &v8[40 * v9];
  *((_QWORD *)v10 + 4) = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(_QWORD *)v10 = mystrdup(a2);
  *((_DWORD *)v10 + 2) = 2;
  *((double *)v10 + 2) = a4;
  v11 = mystrdup(a3);
  result = 0;
  *((_QWORD *)v10 + 4) = v11;
  return result;
}

uint64_t params_add_string(int **a1, const char *a2, const char *a3, const char *a4)
{
  uint64_t v7;
  char *v8;
  int v9;
  char *v10;
  char *v11;
  uint64_t result;

  v7 = (uint64_t)*a1;
  v8 = (char *)malloc_type_realloc(*((void **)*a1 + 1), 40 * **a1 + 40, 0x10100400F471BF6uLL);
  *(_QWORD *)(v7 + 8) = v8;
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = (*(_DWORD *)v7)++;
  v10 = &v8[40 * v9];
  *((_QWORD *)v10 + 4) = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(_QWORD *)v10 = mystrdup(a2);
  *((_DWORD *)v10 + 2) = 3;
  *((_QWORD *)v10 + 3) = mystrdup(a3);
  v11 = mystrdup(a4);
  result = 0;
  *((_QWORD *)v10 + 4) = v11;
  return result;
}

const char **find_param(unsigned int *a1, char *__s2)
{
  uint64_t v2;
  const char **i;

  v2 = *a1;
  if ((int)v2 < 1)
    return 0;
  for (i = (const char **)*((_QWORD *)a1 + 1); strcmp(*i, __s2); i += 5)
  {
    if (!--v2)
      return 0;
  }
  return i;
}

_QWORD *quark_new()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;

  v0 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  v1 = v0;
  if (v0)
  {
    *v0 = 0;
    v2 = rumavl_new((_QWORD *)0x10, (int (__cdecl *)(const void *, const void *, size_t))keycmp, 0, 0);
    v1[1] = v2;
    if (v2)
    {
      *(_QWORD *)rumavl_delcb((uint64_t)v2) = delcb;
      *(_QWORD *)rumavl_owcb(v1[1]) = owcb;
    }
    v1[2] = 0;
  }
  return v1;
}

uint64_t keycmp(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t delcb(uint64_t a1, uint64_t a2, void **a3)
{
  free(*a3);
  return 0;
}

uint64_t owcb(uint64_t a1, uint64_t a2, void **a3)
{
  free(*a3);
  return 0;
}

void quark_delete(uint64_t a1)
{
  if (a1)
  {
    rumavl_destroy(*(uint64_t ***)(a1 + 8));
    free(*(void **)(a1 + 16));
    free((void *)a1);
  }
}

uint64_t quark_get(int *a1, const char *a2)
{
  uint64_t v4;
  unsigned int *v5;
  size_t v6;
  char *v7;
  char *v8;
  int v9;
  int v10;
  _QWORD *v11;
  int v12;
  const char *v14;
  uint64_t v15;

  v14 = a2;
  v15 = 0;
  v4 = rumavl_find(*((uint64_t **)a1 + 1), (uint64_t)&v14);
  if (v4)
  {
    v5 = (unsigned int *)(v4 + 8);
  }
  else
  {
    v6 = strlen(a2);
    v7 = (char *)malloc_type_malloc(v6 + 1, 0x23F3C95BuLL);
    v8 = v7;
    if (v7)
      strcpy(v7, a2);
    v9 = *a1;
    v10 = a1[1];
    if (v10 <= *a1)
    {
      v12 = 2 * v10 + 2;
      a1[1] = v12;
      v11 = malloc_type_realloc(*((void **)a1 + 2), 8 * v12, 0x10040436913F5uLL);
      *((_QWORD *)a1 + 2) = v11;
      v9 = *a1;
    }
    else
    {
      v11 = (_QWORD *)*((_QWORD *)a1 + 2);
    }
    v11[v9] = v8;
    v14 = v8;
    v5 = (unsigned int *)&v15;
    LODWORD(v15) = v9;
    rumavl_insert(*((_QWORD *)a1 + 1), &v14);
    ++*a1;
  }
  return *v5;
}

uint64_t quark_to_id(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];

  v4[0] = a2;
  v4[1] = 0;
  v2 = rumavl_find(*(uint64_t **)(a1 + 8), (uint64_t)v4);
  if (v2)
    return *(unsigned int *)(v2 + 8);
  else
    return 0xFFFFFFFFLL;
}

uint64_t quark_to_string(uint64_t a1, int a2)
{
  if (*(_DWORD *)a1 <= a2)
    return 0;
  else
    return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2);
}

_QWORD *rumavl_new(_QWORD *result, int (__cdecl *a2)(const void *__s1, const void *__s2, size_t __n), uint64_t (*a3)(_QWORD, uint64_t, uint64_t), uint64_t a4)
{
  _QWORD *v7;
  int (__cdecl *v8)(const void *, const void *, size_t);

  if (result)
  {
    v7 = result;
    if (a3)
    {
      result = (_QWORD *)a3(0, 56, a4);
      if (!result)
        return result;
    }
    else
    {
      result = malloc_type_malloc(0x38uLL, 0x10A00407E045CB8uLL);
      if (!result)
        return result;
    }
    result[4] = 0;
    result[5] = a3;
    *result = 0;
    result[1] = v7;
    result[6] = a4;
    v8 = my_cmp;
    if (a2)
      v8 = a2;
    result[2] = v8;
    result[3] = 0;
  }
  return result;
}

void rumavl_destroy(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *i;
  int v4;
  uint64_t *v5;
  uint64_t *v6;

  v2 = *a1;
  if (*a1)
  {
    while (!*((_BYTE *)v2 + 16))
      v2 = (uint64_t *)*v2;
    do
    {
      v4 = *((unsigned __int8 *)v2 + 17);
      if (v4 == 2)
      {
        i = 0;
      }
      else if (v4 == 1)
      {
        i = (uint64_t *)v2[1];
      }
      else
      {
        for (i = (uint64_t *)v2[1]; !*((_BYTE *)i + 16); i = (uint64_t *)*i)
          ;
      }
      v5 = a1[4];
      if (v5)
        ((void (*)(uint64_t **, uint64_t *, uint64_t, uint64_t *))v5)(a1, v2, v2[3], a1[6]);
      node_destroy((uint64_t)a1, v2);
      v2 = i;
    }
    while (i);
  }
  v6 = a1[5];
  if (v6)
    ((void (*)(uint64_t **, _QWORD, uint64_t *))v6)(a1, 0, a1[6]);
  else
    free(a1);
}

uint64_t seq_next(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  uint64_t result;
  uint64_t v5;

  v2 = (a2 + 1) >> 1;
  v3 = *(unsigned __int8 *)(a1 + v2 + 16);
  if (v3 == 2)
    return 0;
  if (v3 == 1)
    return *(_QWORD *)(a1 + 8 * v2);
  v5 = v2 ^ 1;
  for (result = *(_QWORD *)(a1 + 8 * v2); !*(_BYTE *)(result + v5 + 16); result = *(_QWORD *)(result + 8 * v5))
    ;
  return result;
}

void node_destroy(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void (*v5)(void *, _QWORD, _QWORD);
  void (*v6)(_QWORD *, _QWORD, _QWORD);

  v4 = (void *)a2[3];
  v5 = *(void (**)(void *, _QWORD, _QWORD))(a1 + 40);
  if (v5)
    v5(v4, 0, *(_QWORD *)(a1 + 48));
  else
    free(v4);
  v6 = *(void (**)(_QWORD *, _QWORD, _QWORD))(a1 + 40);
  if (v6)
    v6(a2, 0, *(_QWORD *)(a1 + 48));
  else
    free(a2);
}

uint64_t rumavl_udata(uint64_t a1)
{
  return a1 + 48;
}

uint64_t rumavl_owcb(uint64_t a1)
{
  return a1 + 24;
}

uint64_t rumavl_delcb(uint64_t a1)
{
  return a1 + 32;
}

uint64_t rumavl_set(uint64_t a1, const void *a2)
{
  size_t v4;
  int v5;
  int v6;
  BOOL v7;
  _QWORD *v8;
  _BOOL8 v9;
  int v10;
  void **v11;
  char *v12;
  char *v13;
  uint64_t result;
  uint64_t (*v15)(uint64_t, _QWORD, _QWORD, const void *, _QWORD);
  char *v16;
  uint64_t v17;
  int v18;
  _BOOL8 v19;
  void *v20;

  v4 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
  {
    v20 = 0;
    v5 = (*(uint64_t (**)(const void *, _QWORD, _QWORD, _QWORD))(a1 + 16))(a2, *(_QWORD *)(v4 + 24), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 48));
    if (v5 < 0)
      v6 = -1;
    else
      v6 = v5 != 0;
    if (v6)
    {
      v7 = v5 >= 0;
      v8 = (_QWORD *)a1;
      while (1)
      {
        if (stack_push(a1, &v20, (uint64_t)v8, v6))
          goto LABEL_25;
        v9 = v7;
        if (*(char *)(*v8 + v9 + 16) > 0)
          break;
        v8 = (_QWORD *)(*v8 + 8 * v9);
        v10 = (*(uint64_t (**)(const void *, _QWORD, _QWORD, _QWORD))(a1 + 16))(a2, *(_QWORD *)(*v8 + 24), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 48));
        v7 = v10 >= 0;
        if (v10 < 0)
          v6 = -1;
        else
          v6 = v10 != 0;
        if (!v6)
        {
          v11 = (void **)v20;
          goto LABEL_17;
        }
      }
      v16 = node_new((size_t *)a1, a2);
      if (!v16)
      {
LABEL_25:
        stack_destroy(a1, (void **)v20);
        return 4294967294;
      }
      v17 = *(_QWORD *)(*v8 + 8 * v9);
      *(_QWORD *)&v16[8 * v9] = v17;
      v18 = *(unsigned __int8 *)(*v8 + v9 + 16);
      v16[v9 + 16] = v18;
      v19 = !v7;
      if (v18 == 2)
        *(_QWORD *)(v17 + 8 * v19) = v16;
      *(_QWORD *)&v16[8 * v19] = *v8;
      v16[v19 + 16] = 1;
      *(_QWORD *)(*v8 + 8 * v9) = v16;
      *(_BYTE *)(*v8 + v9 + 16) = 0;
      stack_update(a1, v20, 1);
      return 0;
    }
    v11 = 0;
    v8 = (_QWORD *)a1;
LABEL_17:
    stack_destroy(a1, v11);
    v15 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, const void *, _QWORD))(a1 + 24);
    if (!v15 || (result = v15(a1, *v8, *(_QWORD *)(*v8 + 24), a2, *(_QWORD *)(a1 + 48)), !(_DWORD)result))
    {
      memcpy(*(void **)(*v8 + 24), a2, *(_QWORD *)(a1 + 8));
      return 0;
    }
  }
  else
  {
    v12 = node_new((size_t *)a1, a2);
    *(_QWORD *)a1 = v12;
    if (v12)
    {
      v13 = v12;
      result = 0;
      *(_QWORD *)v13 = v13;
      *(_QWORD *)(*(_QWORD *)a1 + 8) = *(_QWORD *)a1;
      *(_BYTE *)(*(_QWORD *)a1 + 16) = 2;
      *(_BYTE *)(*(_QWORD *)a1 + 17) = 2;
    }
    else
    {
      return 4294967294;
    }
  }
  return result;
}

char *node_new(size_t *a1, const void *a2)
{
  uint64_t (*v4)(_QWORD, uint64_t, size_t);
  char *v5;
  char *v6;
  void *v7;
  void (*v8)(char *, _QWORD, size_t);

  v4 = (uint64_t (*)(_QWORD, uint64_t, size_t))a1[5];
  if (v4)
    v5 = (char *)v4(0, 32, a1[6]);
  else
    v5 = (char *)malloc_type_realloc(0, 0x20uLL, 0x7143E929uLL);
  v6 = v5;
  if (v5)
  {
    v7 = mem_mgr((uint64_t)a1, 0, a1[1]);
    *((_QWORD *)v6 + 3) = v7;
    if (v7)
    {
      memcpy(v7, a2, a1[1]);
      *(_QWORD *)v6 = 0;
      *((_QWORD *)v6 + 1) = 0;
      *(_DWORD *)(v6 + 15) = 0;
    }
    else
    {
      v8 = (void (*)(char *, _QWORD, size_t))a1[5];
      if (v8)
        v8(v6, 0, a1[6]);
      else
        free(v6);
      return 0;
    }
  }
  return v6;
}

void stack_destroy(uint64_t a1, void **a2)
{
  void **v3;
  void (*v4)(void **, _QWORD, _QWORD);

  if (a2)
  {
    do
    {
      v3 = (void **)*a2;
      v4 = *(void (**)(void **, _QWORD, _QWORD))(a1 + 40);
      if (v4)
        v4(a2, 0, *(_QWORD *)(a1 + 48));
      else
        free(a2);
      a2 = v3;
    }
    while (v3);
  }
}

uint64_t stack_push(uint64_t a1, _QWORD *a2, uint64_t a3, int a4)
{
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD);
  _QWORD *v8;
  uint64_t v9;

  v7 = *(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 40);
  if (!v7)
  {
    v8 = malloc_type_realloc(0, 0x18uLL, 0x7143E929uLL);
    if (v8)
      goto LABEL_3;
    return 0xFFFFFFFFLL;
  }
  v8 = (_QWORD *)v7(0, 24, *(_QWORD *)(a1 + 48));
  if (!v8)
    return 0xFFFFFFFFLL;
LABEL_3:
  v9 = 0;
  *v8 = *a2;
  *a2 = v8;
  v8[1] = a3;
  *((_DWORD *)v8 + 4) = a4;
  return v9;
}

void stack_update(uint64_t a1, void *a2, int a3)
{
  void *v3;
  int v5;
  uint64_t *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _QWORD *v13;
  void (*v14)(void *, _QWORD, _QWORD);
  _QWORD *v15;
  void (*v16)(_QWORD *, _QWORD, _QWORD);

  v3 = a2;
  if (a2)
  {
    LOBYTE(v5) = a3;
    if (a3)
    {
      while (1)
      {
        v6 = (uint64_t *)*((_QWORD *)v3 + 1);
        v7 = *(char *)(*v6 + 18);
        v8 = *((_DWORD *)v3 + 4);
        v9 = (char)(*(_BYTE *)(*v6 + 18) + v5 * v8);
        *(_BYTE *)(*v6 + 18) += v5 * v8;
        if ((v5 & 0x80) != 0)
          break;
        if (v8 != -1 || (v9 & 0x80000000) == 0)
        {
          v10 = v9 - (v7 & ~(v7 >> 31));
          if (v8 != 1 || v9 < 1)
            v5 = 0;
          else
            v5 = v10;
LABEL_23:
          while (v9 > 1)
          {
            v5 += balance(v6, -1);
            v6 = (uint64_t *)*((_QWORD *)v3 + 1);
            v9 = *(char *)(*v6 + 18);
          }
          goto LABEL_24;
        }
        v5 = (v7 & (v7 >> 31)) - v9;
LABEL_24:
        if (v9 <= -2)
        {
          do
          {
            v5 += balance(v6, 1);
            v6 = (uint64_t *)*((_QWORD *)v3 + 1);
          }
          while (*(char *)(*v6 + 18) < -1);
        }
        v13 = *(_QWORD **)v3;
        v14 = *(void (**)(void *, _QWORD, _QWORD))(a1 + 40);
        if (v14)
        {
          v14(v3, 0, *(_QWORD *)(a1 + 48));
          if (!v13)
            goto LABEL_33;
        }
        else
        {
          free(v3);
          if (!v13)
            goto LABEL_33;
        }
        v3 = v13;
        if (!(_BYTE)v5)
          goto LABEL_33;
      }
      if (v8 == -1 && v7 < 0)
      {
        v5 = v7 - (v9 & (v9 >> 31));
      }
      else if (v8 != 1 || v7 < 1)
      {
        v5 = 0;
      }
      else
      {
        v5 = (v9 & ~(v9 >> 31)) - v7;
      }
      goto LABEL_23;
    }
  }
  v13 = a2;
LABEL_33:
  if (v13)
  {
    do
    {
      v15 = (_QWORD *)*v13;
      v16 = *(void (**)(_QWORD *, _QWORD, _QWORD))(a1 + 40);
      if (v16)
        v16(v13, 0, *(_QWORD *)(a1 + 48));
      else
        free(v13);
      v13 = v15;
    }
    while (v15);
  }
}

uint64_t rumavl_insert(uint64_t a1, const void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = insert_cb;
  result = rumavl_set(a1, a2);
  *(_QWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t insert_cb()
{
  return 4294967290;
}

uint64_t rumavl_delete(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  int v6;
  _QWORD **v7;
  uint64_t v8;
  int v9;
  uint64_t (*v10)(uint64_t, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  _QWORD **v13;
  int v14;
  _QWORD **v15;
  int v16;
  int v17;
  uint64_t v18;
  _QWORD **v19;
  int v20;
  _BYTE *v21;
  _QWORD **v22;
  _BYTE *v23;
  int v24;
  _BOOL8 v25;
  _BOOL8 v26;
  int v27;
  int v28;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  int v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  int v39;
  void *v40;

  v2 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
    return 4294967293;
  v40 = 0;
  v5 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 16))(a2, *(_QWORD *)(v2 + 24), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 48));
  if (v5 < 0)
    v6 = -1;
  else
    v6 = v5 != 0;
  v7 = (_QWORD **)a1;
  if (v6)
  {
    v7 = (_QWORD **)a1;
    while (!stack_push(a1, &v40, (uint64_t)v7, v6))
    {
      v8 = (v6 + 1) >> 1;
      if (*((char *)*v7 + v8 + 16) >= 1)
      {
        stack_destroy(a1, (void **)v40);
        return 4294967293;
      }
      v7 = (_QWORD **)&(*v7)[v8];
      v9 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 16))(a2, (*v7)[3], *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 48));
      if (v9 < 0)
        v6 = -1;
      else
        v6 = v9 != 0;
      if (!v6)
        goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_13:
  v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 32);
  if (!v10 || (v11 = v10(a1, *v7, (*v7)[3], *(_QWORD *)(a1 + 48)), !(_DWORD)v11))
  {
    v13 = (_QWORD **)*v7;
    v14 = *((char *)*v7 + 17);
    if (*((char *)*v7 + 16) >= 1)
    {
      if (v14 < 1)
      {
        *v7 = v13[1];
        do
        {
          v22 = v7;
          v7 = (_QWORD **)*v7;
        }
        while (!*((_BYTE *)v7 + 16));
        *v7 = *v13;
        *((_BYTE *)*v22 + 16) = *((_BYTE *)v13 + 16);
        v23 = *v22;
        if (v23[16] == 2)
          *(_QWORD *)(*(_QWORD *)v23 + 8) = v23;
      }
      else
      {
        v15 = (_QWORD **)v40;
        if (v40)
        {
          v16 = *((_DWORD *)v40 + 4);
          if (v16 >= -1)
            v17 = v16 + 1;
          else
            v17 = v16 + 2;
          *(_QWORD *)(**((_QWORD **)v40 + 1) + 8 * (v17 >> 1)) = v13[v17 >> 1];
          *(_BYTE *)(*v15[1] + (v17 >> 1) + 16) = *((_BYTE *)v13 + (v17 >> 1) + 16);
          v18 = *v15[1];
          if (*(_BYTE *)(v18 + (v17 >> 1) + 16) == 2)
            *(_QWORD *)(*(_QWORD *)(v18 + 8 * ((uint64_t)v17 >> 1)) + 8 * (((uint64_t)v17 >> 1) ^ 1)) = v18;
        }
        else
        {
          *(_QWORD *)a1 = 0;
        }
      }
LABEL_36:
      node_destroy(a1, v13);
LABEL_37:
      stack_update(a1, v40, -1);
      return 0;
    }
    if (v14 >= 1)
    {
      *v7 = *v13;
      do
      {
        v19 = v7;
        v20 = *((unsigned __int8 *)*v7 + 17);
        v7 = (_QWORD **)(*v7 + 1);
      }
      while (!v20);
      *v7 = v13[1];
      *((_BYTE *)*v19 + 17) = *((_BYTE *)v13 + 17);
      v21 = *v19;
      if (v21[17] == 2)
        **((_QWORD **)v21 + 1) = v21;
      goto LABEL_36;
    }
    v24 = *((char *)v13 + 18);
    v25 = v24 > 0;
    v26 = v24 < 1;
    if (v24 < 1)
      v27 = 1;
    else
      v27 = -1;
    if (v24 < 1)
      v28 = -1;
    else
      v28 = 1;
    if (stack_push(a1, &v40, (uint64_t)v7, v28))
    {
LABEL_45:
      stack_destroy(a1, (void **)v40);
      return 4294967294;
    }
    v30 = &(*v7)[v25];
    v31 = *v30;
    v32 = *v30 + v26;
    v34 = *(unsigned __int8 *)(v32 + 16);
    v33 = (_BYTE *)(v32 + 16);
    if (v34)
    {
      *(_QWORD *)(v31 + 8 * v26) = (*v7)[v26];
      *v33 = *((_BYTE *)*v7 + v26 + 16);
      v35 = *v7;
      *(_BYTE *)(v31 + 18) = *((_BYTE *)*v7 + 18);
    }
    else
    {
      if (stack_push(a1, &v40, (uint64_t)v30, v27))
        goto LABEL_45;
      v36 = v40;
      v37 = v31;
      while (1)
      {
        v38 = (uint64_t *)(v37 + 8 * v26);
        v31 = *v38;
        if (*(_BYTE *)(*v38 + v26 + 16))
          break;
        v39 = stack_push(a1, &v40, (uint64_t)v38, v27);
        v37 = v31;
        if (v39)
          goto LABEL_45;
      }
      if (*(_BYTE *)(v31 + v25 + 16))
        *(_BYTE *)(v37 + v26 + 16) = 1;
      else
        *v38 = *(_QWORD *)(v31 + 8 * v25);
      *(_QWORD *)v31 = **v7;
      *(_BYTE *)(v31 + 16) = *((_BYTE *)*v7 + 16);
      *(_QWORD *)(v31 + 8) = (*v7)[1];
      *(_BYTE *)(v31 + 17) = *((_BYTE *)*v7 + 17);
      *(_BYTE *)(v31 + 18) = *((_BYTE *)*v7 + 18);
      v36[1] = v31 + 8 * v25;
      v35 = *v7;
    }
    node_destroy(a1, v35);
    *v7 = (_QWORD *)v31;
    *(_QWORD *)(seq_next(v31, v27) + 8 * v25) = v31;
    goto LABEL_37;
  }
  v12 = v11;
  stack_destroy(a1, (void **)v40);
  return v12;
}

uint64_t rumavl_find(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = 0;
  rumavl_node_find(a1, a2, &v3);
  return v3;
}

uint64_t rumavl_node_find(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  if (!a2 || (v5 = *a1) == 0)
  {
LABEL_8:
    v10 = 0;
    v5 = 0;
    if (!a3)
      return v5;
    goto LABEL_12;
  }
  while (1)
  {
    v7 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))a1[2])(a2, *(_QWORD *)(v5 + 24), a1[1], a1[6]);
    v8 = v7 != 0;
    if (v7 < 0)
      v8 = -1;
    if (!v8)
      break;
    v9 = (v8 + 1) >> 1;
    if (*(char *)(v5 + v9 + 16) > 0)
      goto LABEL_8;
    v5 = *(_QWORD *)(v5 + 8 * v9);
  }
  if (a3)
  {
    v10 = *(_QWORD *)(v5 + 24);
LABEL_12:
    *a3 = v10;
  }
  return v5;
}

uint64_t rumavl_alloc(uint64_t a1)
{
  return a1 + 40;
}

uint64_t rumavl_record_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t rumavl_node_next(uint64_t *a1, uint64_t a2, int a3, _QWORD *a4)
{
  int v6;
  uint64_t result;
  uint64_t v8;
  uint64_t i;

  if (!a3)
    goto LABEL_13;
  if (a3 < 1)
    v6 = -1;
  else
    v6 = 1;
  if (!a2)
  {
    result = *a1;
    if (result)
    {
      for (i = ((v6 + 1) >> 1) ^ 1; !*(_BYTE *)(result + i + 16); result = *(_QWORD *)(result + 8 * i))
        ;
      goto LABEL_7;
    }
LABEL_13:
    v8 = 0;
    result = 0;
    if (!a4)
      return result;
    goto LABEL_14;
  }
  result = seq_next(a2, v6);
  if (!result)
    goto LABEL_13;
LABEL_7:
  if (!a4)
    return result;
  v8 = *(_QWORD *)(result + 24);
LABEL_14:
  *a4 = v8;
  return result;
}

uint64_t rumavl_node_record(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t rumavl_foreach(uint64_t *a1, int a2, uint64_t (*a3)(uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  if (!a3)
    return 0xFFFFFFFFLL;
  v11 = 0;
  v8 = rumavl_node_next(a1, 0, a2, &v11);
  if (!v8)
    return 4294967293;
  v9 = v8;
  do
  {
    result = a3(a1, v11, a4);
    if ((_DWORD)result)
      break;
    result = rumavl_node_next(a1, v9, a2, &v11);
    v9 = result;
  }
  while (result);
  return result;
}

const char *rumavl_strerror(unsigned int a1)
{
  if (a1 != 0 && a1 < 0xFFFFFFFA)
    return "UNKNOWN ERROR";
  else
    return off_24C09DC80[a1 + 6];
}

void *mem_mgr(uint64_t a1, void *ptr, size_t size)
{
  uint64_t (*v3)(void *, size_t, _QWORD);

  v3 = *(uint64_t (**)(void *, size_t, _QWORD))(a1 + 40);
  if (v3)
    return (void *)v3(ptr, size, *(_QWORD *)(a1 + 48));
  if (size)
    return malloc_type_realloc(ptr, size, 0x7143E929uLL);
  free(ptr);
  return 0;
}

uint64_t balance(uint64_t *a1, int a2)
{
  uint64_t v4;
  BOOL v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t *v10;
  char v11;

  if (a1)
  {
    v4 = *a1;
    if (*a1)
      v5 = a2 * a2 == 1;
    else
      v5 = 0;
    if (v5 && (v6 = (a2 + 1) >> 1, v7 = v6 ^ 1, *(char *)(v4 + v7 + 16) <= 0))
    {
      v10 = (uint64_t *)(v4 + 8 * v7);
      if (*(char *)(*v10 + 18) == (char)a2 && !*(_BYTE *)(*v10 + v6 + 16))
        v11 = rotate(v10, -a2);
      else
        v11 = 0;
      return (char)(rotate(a1, a2) + v11);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

uint64_t rotate(uint64_t *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  char v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  char v18;
  char v19;
  char v20;

  if (a1)
  {
    v2 = *a1;
    if (*a1 && a2 * a2 == 1)
    {
      v4 = (a2 + 1) >> 1;
      v5 = v4 ^ 1;
      if (*(char *)(v2 + v5 + 16) <= 0)
      {
        if (a2 == -1)
        {
          v10 = *(unsigned __int8 *)(v2 + 18);
          if (*(char *)(v2 + 18) < 1)
            goto LABEL_20;
          if (*(char *)(*(_QWORD *)(v2 + 8) + 18) < 1)
          {
LABEL_25:
            v6 = 0;
LABEL_26:
            v11 = *(_QWORD *)(v2 + 8 * v5);
            *a1 = v11;
            if (*(char *)(v11 + v4 + 16) < 1)
            {
              v12 = 0;
              *(_QWORD *)(v2 + 8 * v5) = *(_QWORD *)(v11 + 8 * v4);
            }
            else
            {
              v12 = 1;
            }
            *(_BYTE *)(v2 + v5 + 16) = v12;
            *(_QWORD *)(*a1 + 8 * v4) = v2;
            *(_BYTE *)(*a1 + v4 + 16) = 0;
            v13 = *(char *)(v2 + 18);
            v14 = *a1;
            v15 = *(char *)(*a1 + 18);
            v16 = v13 >> 7;
            if (v13 >= 1)
              v16 = 1;
            v17 = v15 >> 7;
            if (v15 >= 1)
              LOBYTE(v17) = 1;
            if (v16 + a2)
            {
              if (-a2 == (char)v17)
                v20 = a2 - v15 + v13;
              else
                v20 = v13 + a2;
              *(_BYTE *)(v2 + 18) = v20;
              v19 = v20 + a2 + *(_BYTE *)(v14 + 18);
              goto LABEL_43;
            }
            if (v17 == v16)
            {
              v18 = a2 - v15 + v13;
              *(_BYTE *)(v2 + 18) = v18;
              if (v18 * a2 >= 1)
              {
                v19 = v15 + a2 + v18;
LABEL_43:
                *(_BYTE *)(v14 + 18) = v19;
                return v6;
              }
            }
            else
            {
              *(_BYTE *)(v2 + 18) = v13 + a2;
            }
            v19 = *(_BYTE *)(v14 + 18) + a2;
            goto LABEL_43;
          }
        }
        else
        {
          if (a2 == 1)
          {
            v8 = *(unsigned __int8 *)(v2 + 18);
            if ((*(char *)(v2 + 18) & 0x80000000) == 0)
            {
LABEL_13:
              v9 = v8 == 255;
              goto LABEL_21;
            }
            if ((*(char *)(*(_QWORD *)v2 + 18) & 0x80000000) == 0)
              goto LABEL_25;
            if (v8 == 255)
              goto LABEL_13;
LABEL_19:
            v6 = -1;
            goto LABEL_26;
          }
          v10 = *(unsigned __int8 *)(v2 + 18);
        }
        if ((char)v10 > 1)
          goto LABEL_19;
LABEL_20:
        v9 = v10 == 1;
LABEL_21:
        v6 = !v9;
        goto LABEL_26;
      }
    }
  }
  return 0;
}

uint64_t crfsuite_train_arow_init(uint64_t a1)
{
  return exchange_options(a1, 0, 0);
}

uint64_t exchange_options(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "variance", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "gamma", a2 + 8);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 16);
    return (*(uint64_t (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "epsilon", a2 + 24);
  }
  else
  {
    params_add_float((int **)a1, "variance", "The initial variance of every feature weight.", 1.0);
    params_add_float((int **)a1, "gamma", "Tradeoff parameter.", 1.0);
    params_add_int((int **)a1, "max_iterations", 100, "The maximum number of iterations.");
    return params_add_float((int **)a1, "epsilon", "The stopping criterion (the mean loss).", 0.0);
  }
}

uint64_t crfsuite_train_arow(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, _QWORD *a5, double **a6)
{
  size_t v9;
  size_t v10;
  clock_t v11;
  void *v12;
  char *v13;
  double *v14;
  _QWORD *v15;
  double *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  int i;
  unsigned int *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  int *v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  int *v91;
  uint64_t v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double *v110;
  uint64_t v111;
  double v112;
  clock_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  clock_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  clock_t v159;
  size_t size;
  clock_t v164;
  int v165;
  int v166;
  double v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _OWORD v172[2];

  v166 = *(_DWORD *)(a2 + 16);
  v10 = *(int *)(a1 + 44);
  v9 = *(int *)(a1 + 48);
  v171 = 0u;
  v172[0] = 0u;
  v11 = clock();
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v12 = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)&v169 = v12;
  v13 = 0;
  *(_QWORD *)&v170 = malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
  size = v10;
  DWORD2(v170) = v10;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  if (!(_QWORD)v170)
    goto LABEL_50;
  if (!v12)
    goto LABEL_50;
  v159 = v11;
  (*(void (**)(uint64_t, const char *, __int128 *))(a4 + 96))(a4, "variance", &v171);
  (*(void (**)(uint64_t, const char *, char *))(a4 + 96))(a4, "gamma", (char *)&v171 + 8);
  (*(void (**)(uint64_t, const char *, _OWORD *))(a4 + 88))(a4, "max_iterations", v172);
  (*(void (**)(uint64_t, const char *, char *))(a4 + 96))(a4, "epsilon", (char *)v172 + 8);
  v14 = (double *)malloc_type_calloc(8uLL, size, 0x9B1EADADuLL);
  v15 = malloc_type_calloc(8uLL, size, 0x53D0B307uLL);
  v16 = (double *)malloc_type_calloc(8uLL, size, 0xC847EA3BuLL);
  v17 = (char *)malloc_type_calloc(4uLL, v9, 0xA7DDBB46uLL);
  v13 = v17;
  if (!v14)
    goto LABEL_50;
  if (v15 && v16 && v17)
  {
    if ((int)size >= 1)
    {
      v24 = v171;
      v25 = v15;
      v26 = size;
      do
      {
        *v25++ = v24;
        --v26;
      }
      while (v26);
    }
    v27 = a5;
    logging(a5, (uint64_t)"Adaptive Regularization of Weights (AROW)\n", v18, v19, v20, v21, v22, v23, v153);
    logging(a5, (uint64_t)"variance: %f\n", v28, v29, v30, v31, v32, v33, v171);
    logging(a5, (uint64_t)"gamma: %f\n", v34, v35, v36, v37, v38, v39, *((uint64_t *)&v171 + 1));
    logging(a5, (uint64_t)"max_iterations: %d\n", v40, v41, v42, v43, v44, v45, LODWORD(v172[0]));
    logging(a5, (uint64_t)"epsilon: %f\n", v46, v47, v48, v49, v50, v51, *((uint64_t *)&v172[0] + 1));
    logging(a5, (uint64_t)"\n", v52, v53, v54, v55, v56, v57, v154);
    v58 = 0;
    while (v58 < SLODWORD(v172[0]))
    {
      v165 = v58;
      v164 = clock();
      dataset_shuffle(a2);
      v65 = 0.0;
      v66 = 0.0;
      if (v166 >= 1)
      {
        for (i = 0; i != v166; ++i)
        {
          v167 = 0.0;
          v68 = (unsigned int *)dataset_get((_QWORD *)a2, i);
          (*(void (**)(uint64_t, double *, double))(a1 + 88))(a1, v14, 1.0);
          (*(void (**)(uint64_t, unsigned int *))(a1 + 96))(a1, v68);
          (*(void (**)(uint64_t, char *, double *))(a1 + 112))(a1, v13, &v167);
          v69 = *v68;
          if ((int)v69 >= 1)
          {
            v70 = 0;
            v71 = 0;
            v72 = 4 * v69;
            do
            {
              if (*(_DWORD *)(*((_QWORD *)v68 + 2) + v70) != *(_DWORD *)&v13[v70])
                ++v71;
              v70 += 4;
            }
            while (v72 != v70);
            if (v71)
            {
              (*(void (**)(uint64_t))(a1 + 104))(a1);
              v73 = v167;
              v74 = DWORD2(v168);
              if (SDWORD2(v168) >= 1)
              {
                v75 = (int *)v168;
                v76 = v170;
                do
                {
                  v77 = *v75++;
                  *(_QWORD *)(v76 + 8 * v77) = 0;
                  --v74;
                }
                while (v74);
              }
              v78 = v73 - 0.0 + (double)v71;
              DWORD2(v168) = 0;
              *((_QWORD *)&v169 + 1) = 0x3FF0000000000000;
              (*(void (**)(uint64_t, unsigned int *, _QWORD, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))(a1, v68, *((_QWORD *)v68 + 2), delta_collect, &v168);
              *((_QWORD *)&v169 + 1) = 0xBFF0000000000000;
              (*(void (**)(uint64_t, unsigned int *, char *, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))(a1, v68, v13, delta_collect, &v168);
              v79 = DWORD2(v168);
              if (SDWORD2(v168) < 1)
              {
                DWORD2(v168) = 0;
              }
              else
              {
                v80 = 0;
                v81 = 0;
                do
                {
                  v82 = v169;
                  v83 = *(_DWORD *)(v168 + 4 * v80);
                  if (!*(_BYTE *)(v169 + v83))
                  {
                    *(_DWORD *)(v168 + 4 * v81++) = v83;
                    *(_BYTE *)(v82 + v83) = 1;
                    v79 = DWORD2(v168);
                  }
                  ++v80;
                }
                while (v80 < v79);
                DWORD2(v168) = v81;
                if (v81 >= 1)
                {
                  v84 = 0;
                  do
                    *(_BYTE *)(v169 + *(int *)(v168 + 4 * v84++)) = 0;
                  while (v84 < SDWORD2(v168));
                  v85 = DWORD2(v168);
                  if (SDWORD2(v168) >= 1)
                  {
                    v86 = (int *)v168;
                    v87 = v170;
                    v88 = DWORD2(v168);
                    do
                    {
                      v89 = *v86++;
                      v16[v89] = *(double *)(v87 + 8 * v89) * *(double *)(v87 + 8 * v89);
                      --v88;
                    }
                    while (v88);
                    v90 = *((double *)&v171 + 1);
                    v91 = (int *)v168;
                    v92 = v85;
                    do
                    {
                      v93 = *v91++;
                      v90 = v90 + v16[v93] * *(double *)&v15[v93];
                      --v92;
                    }
                    while (v92);
                    v94 = (int *)v168;
                    v95 = v170;
                    v96 = v78 / v90;
                    do
                    {
                      v97 = *v94++;
                      v14[v97] = v14[v97] + v96 * *(double *)&v15[v97] * *(double *)(v95 + 8 * v97);
                      *(double *)&v15[v97] = 1.0 / (1.0 / *(double *)&v15[v97] + v16[v97] / *((double *)&v171 + 1));
                      --v85;
                    }
                    while (v85);
                  }
                }
              }
              v66 = v66 + v78;
            }
          }
        }
      }
      v58 = v165 + 1;
      v27 = a5;
      logging(a5, (uint64_t)"***** Iteration #%d *****\n", v59, v60, v61, v62, v63, v64, (v165 + 1));
      logging(a5, (uint64_t)"Loss: %f\n", v98, v99, v100, v101, v102, v103, *(uint64_t *)&v66);
      if ((int)size >= 1)
      {
        v65 = 0.0;
        v110 = v14;
        v111 = size;
        do
        {
          v112 = *v110++;
          v65 = v65 + v112 * v112;
          --v111;
        }
        while (v111);
      }
      logging(a5, (uint64_t)"Feature norm: %f\n", v104, v105, v106, v107, v108, v109, COERCE__INT64(sqrt(v65)));
      v113 = clock();
      logging(a5, (uint64_t)"Seconds required for this iteration: %.3f\n", v114, v115, v116, v117, v118, v119, COERCE__INT64((double)(v113 - v164) / 1000000.0));
      if (a3)
        holdout_evaluation(a1, a3, (uint64_t)v14, a5);
      logging(a5, (uint64_t)"\n", v120, v121, v122, v123, v124, v125, v155);
      if (v66 / (double)v166 <= *((double *)v172 + 1))
      {
        logging(a5, (uint64_t)"Terminated with the stopping criterion\n", v126, v127, v128, v129, v130, v131, v156);
        logging(a5, (uint64_t)"\n", v132, v133, v134, v135, v136, v137, v157);
        break;
      }
    }
    v138 = clock();
    logging(v27, (uint64_t)"Total seconds required for training: %.3f\n", v139, v140, v141, v142, v143, v144, COERCE__INT64((double)(v138 - v159) / 1000000.0));
    logging(v27, (uint64_t)"\n", v145, v146, v147, v148, v149, v150, v158);
    v151 = 0;
  }
  else
  {
LABEL_50:
    free(v13);
    v151 = 2147483649;
    v13 = (char *)v16;
    v16 = (double *)v15;
    v15 = v14;
    v14 = 0;
  }
  free(v13);
  free(v16);
  free(v15);
  *a6 = v14;
  delta_finish((void **)&v168);
  return v151;
}

double delta_collect(uint64_t a1, int a2, double a3)
{
  int v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  double result;

  v6 = *(_DWORD *)(a1 + 8);
  v7 = *(_DWORD *)(a1 + 12);
  v8 = *(void **)a1;
  if (v7 <= v6)
  {
    v9 = 2 * v7 + 2;
    *(_DWORD *)(a1 + 12) = v9;
    v8 = malloc_type_realloc(v8, 4 * v9, 0x100004052888210uLL);
    *(_QWORD *)a1 = v8;
    v6 = *(_DWORD *)(a1 + 8);
  }
  *(_DWORD *)(a1 + 8) = v6 + 1;
  *((_DWORD *)v8 + v6) = a2;
  v10 = *(_QWORD *)(a1 + 32);
  result = *(double *)(v10 + 8 * a2) + *(double *)(a1 + 24) * a3;
  *(double *)(v10 + 8 * a2) = result;
  return result;
}

double delta_finish(void **a1)
{
  double result;

  free(*a1);
  free(a1[2]);
  free(a1[4]);
  result = 0.0;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer(ME_Efficient_Model_Trainer *this)
{
  char *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;

  v2 = (char *)*((_QWORD *)this + 17);
  if (v2)
    nlp::BurstTrieRelease(v2);
  v3 = (void *)*((_QWORD *)this + 45);
  if (v3)
  {
    *((_QWORD *)this + 46) = v3;
    operator delete(v3);
  }
  v8 = (void **)((char *)this + 312);
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](&v8);
  v8 = (void **)((char *)this + 288);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v8);
  v4 = (void *)*((_QWORD *)this + 33);
  if (v4)
  {
    *((_QWORD *)this + 34) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 30);
  if (v5)
  {
    *((_QWORD *)this + 31) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 26);
  if (v6)
  {
    *((_QWORD *)this + 27) = v6;
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)this + 168);
  v7 = (void *)*((_QWORD *)this + 18);
  if (v7)
  {
    *((_QWORD *)this + 19) = v7;
    operator delete(v7);
  }
  v8 = (void **)((char *)this + 112);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v8);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 72);
  v8 = (void **)((char *)this + 40);
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](&v8);
}

void ME_Efficient_Model_Trainer::ME_FeatureBag::~ME_FeatureBag(ME_Efficient_Model_Trainer::ME_FeatureBag *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)this);
}

void ME_Efficient_Model_Trainer::StringBag::~StringBag(ME_Efficient_Model_Trainer::StringBag *this)
{
  void **v2;

  v2 = (void **)((char *)this + 48);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 8);
}

double ME_Efficient_Model_Trainer::FunctionGradient(ME_Efficient_Model_Trainer *this, uint64_t **a2, double **a3)
{
  unint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  double *v25;
  double *v26;
  double *v27;
  double v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v3 = (int)((uint64_t)(*((_QWORD *)this + 27) - *((_QWORD *)this + 26)) >> 2);
  v4 = *a2;
  v5 = a2[1];
  if (v3 != v5 - *a2)
    ME_Efficient_Model_Trainer::FunctionGradient();
  if (v5 != v4)
  {
    v9 = (_QWORD *)*((_QWORD *)this + 18);
    if (v3 <= 1)
      v3 = 1;
    do
    {
      v10 = *v4++;
      *v9++ = v10;
      --v3;
    }
    while (v3);
  }
  ME_Efficient_Model_Trainer::update_model_expectation(this);
  v12 = *((double *)this + 4);
  v14 = *a2;
  v13 = a2[1];
  if (v12 == 0.0)
  {
    v15 = (char *)v13 - (char *)v14;
    if (v15)
    {
      v16 = v15 >> 3;
      v17 = (double *)*((_QWORD *)this + 30);
      v18 = (double *)*((_QWORD *)this + 33);
      v19 = *a3;
      if (v16 <= 1)
        v16 = 1;
      do
      {
        v20 = *v17++;
        v21 = v20;
        v22 = *v18++;
        *v19++ = -(v21 - v22);
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    v23 = (char *)v13 - (char *)v14;
    if (v23)
    {
      v24 = v23 >> 3;
      v25 = (double *)*((_QWORD *)this + 30);
      v26 = (double *)*((_QWORD *)this + 33);
      v27 = (double *)*((_QWORD *)this + 18);
      v28 = v12 * -2.0;
      v29 = *a3;
      if (v24 <= 1)
        v24 = 1;
      do
      {
        v30 = *v25++;
        v31 = v30;
        v32 = *v26++;
        v33 = v31 - v32;
        v34 = *v27++;
        *v29++ = -(v33 + v28 * v34);
        --v24;
      }
      while (v24);
    }
  }
  return -v11;
}

void ME_Efficient_Model_Trainer::update_model_expectation(ME_Efficient_Model_Trainer *this)
{
  void **v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  double v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  double *v11;
  double v12;
  int *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  unsigned __int8 v18;
  uint64_t v19;
  int *v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  unsigned __int8 v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  double v32;
  double v33;
  double *v34;
  double v35;
  double *v36[3];

  v2 = (void **)((char *)this + 264);
  std::vector<double>::resize((uint64_t)this + 264, (int)((uint64_t)(*((_QWORD *)this + 27) - *((_QWORD *)this + 26)) >> 2));
  v3 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
  v4 = v3 >> 2;
  if ((int)(v3 >> 2) >= 1)
    bzero(*v2, (2 * v3) & 0x7FFFFFFF8);
  v5 = *((_QWORD *)this + 5);
  if (v5 == *((_QWORD *)this + 6))
  {
    v27 = 0.0;
    v8 = (_QWORD *)*((_QWORD *)this + 5);
    v7 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
    v8 = (_QWORD *)*((_QWORD *)this + 5);
    do
    {
      std::vector<double>::vector(v36, *((int *)this + 58));
      v9 = ME_Efficient_Model_Trainer::conditional_probability((uint64_t)this, v8, v36);
      v10 = *(int *)v8;
      v11 = v36[0];
      v12 = log(v36[0][v10]);
      if (v9 == (_DWORD)v10)
        ++v6;
      v14 = (int *)v8[1];
      v13 = (int *)v8[2];
      if (v14 != v13)
      {
        v15 = *((_QWORD *)this + 36);
        do
        {
          v16 = v15 + 24 * *v14;
          v17 = *(int **)v16;
          if (*(_QWORD *)v16 != *(_QWORD *)(v16 + 8))
          {
            do
            {
              v18 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v17);
              v11 = v36[0];
              v19 = *v17++;
              *(double *)(*((_QWORD *)this + 33) + 8 * v19) = v36[0][v18]
                                                            + *(double *)(*((_QWORD *)this + 33) + 8 * v19);
              v15 = *((_QWORD *)this + 36);
            }
            while (v17 != *(int **)(v15 + 24 * *v14 + 8));
            v13 = (int *)v8[2];
          }
          ++v14;
        }
        while (v14 != v13);
      }
      v21 = (double *)v8[4];
      v20 = (int *)v8[5];
      if (v21 != (double *)v20)
      {
        v22 = *((_QWORD *)this + 36);
        do
        {
          v23 = v22 + 24 * *(int *)v21;
          v24 = *(int **)v23;
          if (*(_QWORD *)v23 != *(_QWORD *)(v23 + 8))
          {
            do
            {
              v25 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v24);
              v11 = v36[0];
              v26 = *v24++;
              *(double *)(*((_QWORD *)this + 33) + 8 * v26) = *(double *)(*((_QWORD *)this + 33) + 8 * v26)
                                                            + v36[0][v25] * v21[1];
              v22 = *((_QWORD *)this + 36);
            }
            while (v24 != *(int **)(v22 + 24 * *(int *)v21 + 8));
            v20 = (int *)v8[5];
          }
          v21 += 2;
        }
        while (v21 != (double *)v20);
      }
      if (v11)
      {
        v36[1] = v11;
        operator delete(v11);
      }
      v7 = v7 + v12;
      v8 += 10;
    }
    while (v8 != *((_QWORD **)this + 6));
    v5 = *((_QWORD *)this + 5);
    v4 = (*((_QWORD *)this + 27) - *((_QWORD *)this + 26)) >> 2;
    v27 = (double)v6;
  }
  v28 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v8 - v5) >> 4));
  v29 = v4;
  if ((int)v4 >= 1)
  {
    v30 = (double *)*v2;
    v31 = v4;
    do
    {
      *v30 = *v30 / v28;
      ++v30;
      --v31;
    }
    while (v31);
  }
  *((double *)this + 42) = 1.0 - v27 / v28;
  v32 = v7 / v28;
  v33 = *((double *)this + 4);
  if (v33 > 0.0 && (int)v4 >= 1)
  {
    v34 = (double *)*((_QWORD *)this + 18);
    do
    {
      v35 = *v34++;
      v32 = v32 + -(v35 * v35) * v33;
      --v29;
    }
    while (v29);
  }
}

void sub_2083F6AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::perform_GIS(ME_Efficient_Model_Trainer *this)
{
  _QWORD *v2;
  const std::locale::facet *v3;
  _QWORD *v4;
  _QWORD *v5;
  const std::locale::facet *v6;
  uint64_t v7;
  std::locale *v8;
  uint64_t v9;
  const char *v10;
  FILE **v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const std::locale::facet *v16;
  unsigned int v17;
  unint64_t v18;
  _BOOL4 v20;
  unint64_t v21;
  std::locale *v22;
  FILE **v23;
  const char *v24;
  double *v25;
  double *v26;
  uint64_t v27;
  long double *v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  const std::locale::facet *v33;
  std::locale v35;
  std::locale::__imp *locale;
  uint64_t v37;
  std::locale v38;

  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"C = ", 4);
  v2 = (_QWORD *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)));
  v3 = std::locale::use_facet(&v35, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale(&v35);
  std::ostream::put();
  std::ostream::flush();
  v4 = (_QWORD *)MEMORY[0x24BEDB310];
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"performing AGIS", 15);
  std::ios_base::getloc((const std::ios_base *)((char *)v5 + *(_QWORD *)(*v5 - 24)));
  v6 = std::locale::use_facet(&v35, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(&v35);
  std::ostream::put();
  std::ostream::flush();
  v7 = 0;
  v35.__locale_ = 0;
  locale = 0;
  v8 = (std::locale *)((char *)this + 144);
  v9 = 1;
  v37 = 0;
  v10 = "iter = %2d  C = %d  f = %10.7f  train_err = %7.5f";
  v11 = (FILE **)MEMORY[0x24BDAC8D8];
  v12 = -999999.0;
  do
  {
    ME_Efficient_Model_Trainer::update_model_expectation(this);
    v14 = v13;
    fprintf(*v11, v10, v7, v9, *(_QWORD *)&v13, *((_QWORD *)this + 42));
    if (*((_QWORD *)this + 40) != *((_QWORD *)this + 39))
    {
      v15 = ME_Efficient_Model_Trainer::heldout_likelihood(this);
      fprintf(*v11, "  heldout_logl(err) = %f (%6.4f)", v15, *((double *)this + 43));
    }
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
    v16 = std::locale::use_facet(&v38, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
    std::locale::~locale(&v38);
    std::ostream::put();
    std::ostream::flush();
    if (v14 >= v12)
    {
      HIDWORD(v18) = -858993459 * v7 + 429496728;
      LODWORD(v18) = HIDWORD(v18);
      v17 = v18 >> 1;
      v20 = (int)v9 > 1 && v17 < 0x19999999;
      if (&v35 != v8)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v35, *((char **)this + 18), *((_QWORD *)this + 19), (uint64_t)(*((_QWORD *)this + 19) - *((_QWORD *)this + 18)) >> 3);
      v9 = (v9 - v20);
      v21 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
      if ((int)(v21 >> 2) < 1)
      {
        v12 = v14;
      }
      else
      {
        v22 = v8;
        v23 = v11;
        v24 = v10;
        v25 = (double *)*((_QWORD *)this + 30);
        v26 = (double *)*((_QWORD *)this + 33);
        v27 = (v21 >> 2);
        v28 = (long double *)*((_QWORD *)this + 18);
        do
        {
          v29 = *v25++;
          v30 = v29;
          v31 = *v26++;
          *v28 = *v28 + log(v30 / v31) / (double)(int)v9;
          ++v28;
          --v27;
        }
        while (v27);
        v12 = v14;
        v10 = v24;
        v11 = v23;
        v8 = v22;
        v4 = (_QWORD *)MEMORY[0x24BEDB310];
      }
    }
    else
    {
      if (&v35 != v8)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)v8, (char *)v35.__locale_, (uint64_t)locale, (locale - v35.__locale_) >> 3);
      v9 = (v9 + 1);
      LODWORD(v7) = v7 - 1;
    }
    v32 = (int)v7 < 199;
    v7 = (v7 + 1);
  }
  while (v32);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
  v33 = std::locale::use_facet(&v38, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
  std::locale::~locale(&v38);
  std::ostream::put();
  std::ostream::flush();
  if (v35.__locale_)
  {
    locale = v35.__locale_;
    operator delete(v35.__locale_);
  }
  return 0;
}

void sub_2083F6E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, std::locale a16)
{
  std::locale::~locale(&a16);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

double ME_Efficient_Model_Trainer::heldout_likelihood(ME_Efficient_Model_Trainer *this)
{
  uint64_t v2;
  int v3;
  double v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[3];

  v2 = *((_QWORD *)this + 39);
  if (v2 == *((_QWORD *)this + 40))
  {
    v9 = 0.0;
    v4 = 0.0;
    v5 = (_QWORD *)*((_QWORD *)this + 39);
  }
  else
  {
    v3 = 0;
    v4 = 0.0;
    v5 = (_QWORD *)*((_QWORD *)this + 39);
    do
    {
      std::vector<double>::vector(v12, *((int *)this + 58));
      v6 = ME_Efficient_Model_Trainer::classify((uint64_t)this, v5, (uint64_t)v12);
      v7 = *(int *)v5;
      v5 += 10;
      v8 = (void *)v12[0];
      v4 = v4 + log(*(long double *)(v12[0] + 8 * v7));
      if (v6 == (_DWORD)v7)
        ++v3;
      v12[1] = v8;
      operator delete(v8);
    }
    while (v5 != *((_QWORD **)this + 40));
    v2 = *((_QWORD *)this + 39);
    v9 = (double)v3;
  }
  v10 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v5 - v2) >> 4));
  *((double *)this + 43) = 1.0 - v9 / v10;
  return v4 / v10;
}

void sub_2083F6F88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::perform_QUASI_NEWTON(ME_Efficient_Model_Trainer *this)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const std::locale::facet *v9;
  _QWORD *v10;
  const std::locale::facet *v11;
  void *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  void *__p[3];
  void *v18[3];

  v2 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
  std::vector<double>::vector(v18, (int)((uint64_t)v2 >> 2));
  v3 = (v2 >> 2);
  if ((int)(v2 >> 2) >= 1)
  {
    v4 = (uint64_t *)*((_QWORD *)this + 18);
    v5 = v18[0];
    v6 = (v2 >> 2);
    do
    {
      v7 = *v4++;
      *v5++ = v7;
      --v6;
    }
    while (v6);
  }
  if (*((double *)this + 3) <= 0.0)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"performing LBFGS", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(_QWORD *)(*v10 - 24)));
    v11 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
    ME_Efficient_Model_Trainer::perform_LBFGS((uint64_t)this, (uint64_t)v18, __p);
  }
  else
  {
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"performing OWLQN", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v8 + *(_QWORD *)(*v8 - 24)));
    v9 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
    ME_Efficient_Model_Trainer::perform_OWLQN((uint64_t)this, (uint64_t)v18, __p, *((double *)this + 3));
  }
  v12 = __p[0];
  if ((int)(v2 >> 2) < 1)
  {
    if (!__p[0])
      goto LABEL_13;
  }
  else
  {
    v13 = (_QWORD *)*((_QWORD *)this + 18);
    v14 = (uint64_t *)__p[0];
    do
    {
      v15 = *v14++;
      *v13++ = v15;
      --v3;
    }
    while (v3);
  }
  operator delete(v12);
LABEL_13:
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }
  return 0;
}

void sub_2083F7170(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::conditional_probability(uint64_t a1, _QWORD *a2, double **a3)
{
  unint64_t v6;
  int *v7;
  int *v8;
  uint64_t v9;
  int **v10;
  int *v11;
  uint64_t v12;
  double v13;
  unsigned __int8 v14;
  int *v15;
  double *v16;
  uint64_t v17;
  int **v18;
  int *v19;
  uint64_t v20;
  double v21;
  double v22;
  unsigned __int8 v23;
  double *v24;
  double *v25;
  BOOL v26;
  double *v27;
  double v28;
  double *v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double *v35;
  uint64_t v36;
  double *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  double v42;
  uint64_t v44;
  double *v45;
  double *v46;

  v6 = *(int *)(a1 + 232);
  v44 = 0;
  std::vector<double>::vector(&v45, v6, &v44);
  v8 = (int *)a2[1];
  v7 = (int *)a2[2];
  if (v8 != v7)
  {
    v9 = *(_QWORD *)(a1 + 288);
    do
    {
      v10 = (int **)(v9 + 24 * *v8);
      v11 = *v10;
      if (*v10 != v10[1])
      {
        do
        {
          v12 = *v11;
          v13 = *(double *)(*(_QWORD *)(a1 + 144) + 8 * v12);
          v14 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer::ME_FeatureBag *)(a1 + 168), v12);
          v45[v14] = v13 + v45[v14];
          ++v11;
          v9 = *(_QWORD *)(a1 + 288);
        }
        while (v11 != *(int **)(v9 + 24 * *v8 + 8));
        v7 = (int *)a2[2];
      }
      ++v8;
    }
    while (v8 != v7);
  }
  v16 = (double *)a2[4];
  v15 = (int *)a2[5];
  if (v16 != (double *)v15)
  {
    v17 = *(_QWORD *)(a1 + 288);
    do
    {
      v18 = (int **)(v17 + 24 * *(int *)v16);
      v19 = *v18;
      if (*v18 != v18[1])
      {
        do
        {
          v20 = *v19;
          v21 = *(double *)(*(_QWORD *)(a1 + 144) + 8 * v20);
          v22 = v16[1];
          v23 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer::ME_FeatureBag *)(a1 + 168), v20);
          v45[v23] = v45[v23] + v21 * v22;
          ++v19;
          v17 = *(_QWORD *)(a1 + 288);
        }
        while (v19 != *(int **)(v17 + 24 * *(int *)v16 + 8));
        v15 = (int *)a2[5];
      }
      v16 += 2;
    }
    while (v16 != (double *)v15);
  }
  v24 = v45;
  v25 = v45 + 1;
  v26 = v45 == v46 || v25 == v46;
  v27 = v45;
  if (!v26)
  {
    v28 = *v45;
    v27 = v45;
    v29 = v45 + 1;
    do
    {
      v30 = *v29++;
      v31 = v30;
      if (v28 < v30)
      {
        v28 = v31;
        v27 = v25;
      }
      v25 = v29;
    }
    while (v29 != v46);
  }
  v32 = *(unsigned int *)(a1 + 232);
  if ((int)v32 < 1)
  {
    v40 = 0;
    if (!v45)
      return v40;
    goto LABEL_32;
  }
  v33 = 0.0;
  v34 = fmax(*v27 + -700.0, 0.0);
  v35 = *a3;
  v36 = v32;
  v37 = v45;
  do
  {
    v38 = exp(*v37 - v34);
    if (v38 == 0.0)
      __assert_rtn("conditional_probability", "efficient_maxent.cpp", 140, "prod != 0");
    *v35++ = v38;
    v33 = v33 + v38;
    ++v37;
    --v36;
  }
  while (v36);
  v39 = 0;
  LODWORD(v40) = 0;
  v41 = *a3;
  do
  {
    v42 = v41[v39] / v33;
    v41[v39] = v42;
    if (v42 <= v41[(int)v40])
      v40 = v40;
    else
      v40 = v39;
    ++v39;
  }
  while (v32 != v39);
  if ((v40 & 0x80000000) != 0)
    __assert_rtn("conditional_probability", "efficient_maxent.cpp", 148, "max_label >= 0");
  if (v24)
  {
LABEL_32:
    v46 = v24;
    operator delete(v24);
  }
  return v40;
}

void sub_2083F7440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::classify(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  double v8;
  double v9;

  if (*(_DWORD *)(a1 + 232) != ((*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3))
    ME_Efficient_Model_Trainer::classify();
  ME_Efficient_Model_Trainer::conditional_probability(a1, a2, (double **)a3);
  v4 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  if ((int)(v4 >> 3) < 1)
    return 0;
  v5 = 0;
  LODWORD(result) = 0;
  v7 = (v4 >> 3);
  v8 = 0.0;
  do
  {
    v9 = *(double *)(*(_QWORD *)a3 + 8 * v5);
    if (v9 <= v8)
      result = result;
    else
      result = v5;
    if (v9 > v8)
      v8 = *(double *)(*(_QWORD *)a3 + 8 * v5);
    ++v5;
  }
  while (v7 != v5);
  return result;
}

uint64_t ME_Efficient_Model_Trainer::make_feature_bag(ME_Efficient_Model_Trainer *this, int a2)
{
  uint64_t i;
  unsigned int *j;
  _QWORD *v6;
  unsigned int *k;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  unint64_t v13;
  unsigned int *m;
  unsigned int v16;
  unsigned int v17;
  _OWORD v18[2];
  int v19;
  unsigned int *v20;

  memset(v18, 0, sizeof(v18));
  v19 = 1065353216;
  if (a2 <= 0)
  {
    i = *((_QWORD *)this + 6);
  }
  else
  {
    for (i = *((_QWORD *)this + 5); i != *((_QWORD *)this + 6); i += 80)
    {
      for (j = *(unsigned int **)(i + 8); j != *(unsigned int **)(i + 16); ++j)
      {
        ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v16, *(_DWORD *)i, *j);
        v17 = v16;
        v20 = &v17;
        v6 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v18, &v17, (uint64_t)&std::piecewise_construct, &v20);
        ++*((_DWORD *)v6 + 5);
      }
      for (k = *(unsigned int **)(i + 32); k != *(unsigned int **)(i + 40); k += 4)
      {
        ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v16, *(_DWORD *)i, *k);
        v17 = v16;
        v20 = &v17;
        v8 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v18, &v17, (uint64_t)&std::piecewise_construct, &v20);
        ++*((_DWORD *)v8 + 5);
      }
    }
  }
  v9 = *((_QWORD *)this + 5);
  if (v9 == i)
  {
    v10 = 0;
  }
  else
  {
    LODWORD(v10) = 0;
    do
    {
      v12 = *(unsigned int **)(v9 + 8);
      v11 = *(unsigned int **)(v9 + 16);
      v13 = (unint64_t)((char *)v11 - (char *)v12) >> 2;
      if ((int)v10 <= (int)v13)
        v10 = v13;
      else
        v10 = v10;
      if (v11 != v12)
      {
        do
        {
          ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v17, *(_DWORD *)v9, *v12);
          if (a2 < 1
            || (v16 = v17,
                v20 = &v16,
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v18, &v16, (uint64_t)&std::piecewise_construct, &v20)+ 5) > a2))
          {
            ME_Efficient_Model_Trainer::ME_FeatureBag::Put((ME_Efficient_Model_Trainer *)((char *)this + 168), (const ME_Efficient_Model_Trainer::ME_Feature *)&v17);
          }
          ++v12;
        }
        while (v12 != *(unsigned int **)(v9 + 16));
      }
      for (m = *(unsigned int **)(v9 + 32); m != *(unsigned int **)(v9 + 40); m += 4)
      {
        ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v17, *(_DWORD *)v9, *m);
        if (a2 >= 1)
        {
          v16 = v17;
          v20 = &v16;
          if (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v18, &v16, (uint64_t)&std::piecewise_construct, &v20)+ 5) <= a2)continue;
        }
        ME_Efficient_Model_Trainer::ME_FeatureBag::Put((ME_Efficient_Model_Trainer *)((char *)this + 168), (const ME_Efficient_Model_Trainer::ME_Feature *)&v17);
      }
      v9 += 80;
    }
    while (v9 != *((_QWORD *)this + 6));
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(v18);
  ME_Efficient_Model_Trainer::init_feature2mef(this);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)v18);
  return v10;
}

void sub_2083F7764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ME_Efficient_Model_Trainer::ME_FeatureBag::Put(ME_Efficient_Model_Trainer::ME_FeatureBag *this, const ME_Efficient_Model_Trainer::ME_Feature *a2)
{
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  unint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  unsigned int v18;
  unsigned int *v19;

  LODWORD(v19) = *(_DWORD *)a2;
  v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(this, (unsigned int *)&v19);
  if (v4)
    return *((unsigned int *)v4 + 5);
  v6 = (char *)*((_QWORD *)this + 5);
  v7 = (char *)*((_QWORD *)this + 6);
  v5 = (v7 - v6) >> 2;
  v8 = *((_QWORD *)this + 7);
  if ((unint64_t)v7 >= v8)
  {
    if ((unint64_t)(v5 + 1) >> 62)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v10 = v8 - (_QWORD)v6;
    v11 = (uint64_t)(v8 - (_QWORD)v6) >> 1;
    if (v11 <= v5 + 1)
      v11 = v5 + 1;
    if (v10 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 56, v12);
      v6 = (char *)*((_QWORD *)this + 5);
      v7 = (char *)*((_QWORD *)this + 6);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v5];
    v15 = &v13[4 * v12];
    *(_DWORD *)v14 = *(_DWORD *)a2;
    v9 = v14 + 4;
    while (v7 != v6)
    {
      v16 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *((_QWORD *)this + 5) = v14;
    *((_QWORD *)this + 6) = v9;
    *((_QWORD *)this + 7) = v15;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *(_DWORD *)v7 = *(_DWORD *)a2;
    v9 = v7 + 4;
  }
  *((_QWORD *)this + 6) = v9;
  v18 = *(_DWORD *)a2;
  v19 = &v18;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)this, &v18, (uint64_t)&std::piecewise_construct, &v19)+ 5) = v5;
  return v5;
}

uint64_t ME_Efficient_Model_Trainer::init_feature2mef(ME_Efficient_Model_Trainer *this)
{
  uint64_t *v2;
  uint64_t result;
  uint64_t i;
  signed int v5;
  uint64_t *v6;
  int v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  unsigned int v20;
  void *__p;
  char *v22;
  char *v23;
  unsigned int v24;

  v2 = (uint64_t *)((char *)this + 288);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 36);
  result = nlp::BurstTrieGetCount(*((_QWORD *)this + 17));
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      __p = 0;
      v22 = 0;
      v23 = 0;
      if (*((int *)this + 58) >= 1)
      {
        v5 = 0;
        do
        {
          ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v20, v5, i);
          v24 = v20;
          v6 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>((_QWORD *)this + 21, &v24);
          if (v6)
          {
            v7 = *((_DWORD *)v6 + 5);
            if ((v7 & 0x80000000) == 0)
            {
              v8 = v22;
              if (v22 >= v23)
              {
                v10 = (char *)__p;
                v11 = (v22 - (_BYTE *)__p) >> 2;
                v12 = v11 + 1;
                if ((unint64_t)(v11 + 1) >> 62)
                  std::vector<double>::__throw_length_error[abi:ne180100]();
                v13 = v23 - (_BYTE *)__p;
                if ((v23 - (_BYTE *)__p) >> 1 > v12)
                  v12 = v13 >> 1;
                if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
                  v14 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v14 = v12;
                if (v14)
                {
                  v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v23, v14);
                  v10 = (char *)__p;
                  v8 = v22;
                }
                else
                {
                  v15 = 0;
                }
                v16 = &v15[4 * v11];
                *(_DWORD *)v16 = v7;
                v9 = v16 + 4;
                while (v8 != v10)
                {
                  v17 = *((_DWORD *)v8 - 1);
                  v8 -= 4;
                  *((_DWORD *)v16 - 1) = v17;
                  v16 -= 4;
                }
                __p = v16;
                v22 = v9;
                v23 = &v15[4 * v14];
                if (v10)
                  operator delete(v10);
              }
              else
              {
                *(_DWORD *)v22 = v7;
                v9 = v8 + 4;
              }
              v22 = v9;
            }
          }
          ++v5;
        }
        while (v5 < *((_DWORD *)this + 58));
      }
      v18 = *((_QWORD *)this + 37);
      if (v18 >= *((_QWORD *)this + 38))
      {
        v19 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v2, (uint64_t)&__p);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v2, (uint64_t)&__p);
        v19 = v18 + 24;
      }
      *((_QWORD *)this + 37) = v19;
      if (__p)
      {
        v22 = (char *)__p;
        operator delete(__p);
      }
      result = nlp::BurstTrieGetCount(*((_QWORD *)this + 17));
    }
  }
  return result;
}

void sub_2083F7A98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void ME_Efficient_Model_Trainer::add_training_sample(ME_Efficient_Model_Trainer *this, const ME_Sample *a2)
{
  uint64_t i;
  const char *v5;
  size_t v6;
  int v7;
  unsigned int v8;
  char *v9;
  void *v10;
  char *v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  char *v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t j;
  const char *v20;
  size_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unsigned int v38;
  int v39;
  void *__p[2];
  void *v41[2];
  __int128 v42;
  void *v43[2];
  uint64_t v44;

  v44 = 0;
  *(_OWORD *)v43 = 0u;
  v42 = 0u;
  *(_OWORD *)v41 = 0u;
  *(_OWORD *)__p = 0u;
  v39 = ME_Efficient_Model_Trainer::StringBag::Put((_QWORD *)this + 8, (unsigned __int8 *)a2);
  if (v39 >= 256)
  {
    v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: too many types of labels.", 32);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v37);
    exit(1);
  }
  for (i = *((_QWORD *)a2 + 3); i != *((_QWORD *)a2 + 4); i += 24)
  {
    v38 = 0;
    v5 = (const char *)i;
    if (*(char *)(i + 23) < 0)
      v5 = *(const char **)i;
    v6 = strlen(v5);
    v7 = v6;
    if (!nlp::BurstTrieContains(*((nlp **)this + 17), v5, v6, &v38, 0))
    {
      v38 = nlp::BurstTrieGetCount(*((_QWORD *)this + 17)) + 1;
      nlp::BurstTrieAdd(*((_QWORD *)this + 17), (uint64_t)v5, v7, v38);
    }
    v8 = v38;
    v9 = (char *)__p[1];
    if (__p[1] >= v41[0])
    {
      v11 = (char *)__p[0];
      v12 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v14 = (char *)v41[0] - (char *)__p[0];
      if (((char *)v41[0] - (char *)__p[0]) >> 1 > v13)
        v13 = v14 >> 1;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
        v15 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v41, v15);
        v11 = (char *)__p[0];
        v9 = (char *)__p[1];
      }
      else
      {
        v16 = 0;
      }
      v17 = (unsigned int *)&v16[4 * v12];
      *v17 = v8;
      v10 = v17 + 1;
      while (v9 != v11)
      {
        v18 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *--v17 = v18;
      }
      __p[0] = v17;
      __p[1] = v10;
      v41[0] = &v16[4 * v15];
      if (v11)
        operator delete(v11);
    }
    else
    {
      *(_DWORD *)__p[1] = v38;
      v10 = v9 + 4;
    }
    __p[1] = v10;
  }
  for (j = *((_QWORD *)a2 + 6); j != *((_QWORD *)a2 + 7); j += 32)
  {
    v38 = -1;
    v20 = (const char *)j;
    if (*(char *)(j + 23) < 0)
      v20 = *(const char **)j;
    v21 = strlen(v20);
    v22 = v21;
    if (!nlp::BurstTrieContains(*((nlp **)this + 17), v20, v21, &v38, 0))
    {
      v38 = nlp::BurstTrieGetCount(*((_QWORD *)this + 17)) + 1;
      nlp::BurstTrieAdd(*((_QWORD *)this + 17), (uint64_t)v20, v22, v38);
    }
    v23 = v38;
    v24 = *(_QWORD *)(j + 24);
    v25 = (_QWORD *)v42;
    if ((unint64_t)v42 >= *((_QWORD *)&v42 + 1))
    {
      v27 = v41[1];
      v28 = (uint64_t)(v42 - (unint64_t)v41[1]) >> 4;
      v29 = v28 + 1;
      if ((unint64_t)(v28 + 1) >> 60)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v30 = *((_QWORD *)&v42 + 1) - (unint64_t)v41[1];
      if ((uint64_t)(*((_QWORD *)&v42 + 1) - (unint64_t)v41[1]) >> 3 > v29)
        v29 = v30 >> 3;
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
        v31 = 0xFFFFFFFFFFFFFFFLL;
      else
        v31 = v29;
      if (v31)
      {
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)&v42 + 8, v31);
        v27 = v41[1];
        v25 = (_QWORD *)v42;
      }
      else
      {
        v32 = 0;
      }
      v33 = &v32[16 * v28];
      *(_DWORD *)v33 = v23;
      *((_QWORD *)v33 + 1) = v24;
      v34 = v33;
      if (v25 != v27)
      {
        do
        {
          *((_OWORD *)v34 - 1) = *((_OWORD *)v25 - 1);
          v34 -= 16;
          v25 -= 2;
        }
        while (v25 != v27);
        v27 = v41[1];
      }
      v26 = v33 + 16;
      v41[1] = v34;
      *(_QWORD *)&v42 = v33 + 16;
      *((_QWORD *)&v42 + 1) = &v32[16 * v31];
      if (v27)
        operator delete(v27);
    }
    else
    {
      *(_DWORD *)v42 = v38;
      v25[1] = v24;
      v26 = (char *)(v25 + 2);
    }
    *(_QWORD *)&v42 = v26;
  }
  v35 = *((_QWORD *)this + 6);
  if (v35 >= *((_QWORD *)this + 7))
  {
    v36 = std::vector<ME_Efficient_Model_Trainer::Sample>::__push_back_slow_path<ME_Efficient_Model_Trainer::Sample const&>((uint64_t *)this + 5, (uint64_t)&v39);
  }
  else
  {
    std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>((uint64_t)this + 56, *((_QWORD *)this + 6), (uint64_t)&v39);
    v36 = v35 + 80;
    *((_QWORD *)this + 6) = v35 + 80;
  }
  *((_QWORD *)this + 6) = v36;
  if (v43[0])
  {
    v43[1] = v43[0];
    operator delete(v43[0]);
  }
  if (v41[1])
  {
    *(void **)&v42 = v41[1];
    operator delete(v41[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_2083F7E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  uint64_t v4;
  va_list va;

  va_start(va, a3);
  *(_QWORD *)(v3 + 48) = v4;
  ME_Efficient_Model_Trainer::Sample::~Sample((ME_Efficient_Model_Trainer::Sample *)va);
  _Unwind_Resume(a1);
}

uint64_t ME_Efficient_Model_Trainer::StringBag::Put(_QWORD *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int8 *v11;

  v4 = (uint64_t)(a1 + 1);
  v5 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a1 + 1, a2);
  if (v5)
    return *((unsigned int *)v5 + 10);
  v8 = a1[7];
  v7 = a1 + 6;
  v6 = -1431655765 * ((v8 - a1[6]) >> 3);
  if (v8 >= a1[8])
  {
    v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v7, (__int128 *)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v7, (__int128 *)a2);
    v9 = v8 + 24;
  }
  a1[7] = v9;
  v11 = a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, (__int128 **)&v11)+ 10) = v6;
  return v6;
}

void ME_Efficient_Model_Trainer::Sample::~Sample(ME_Efficient_Model_Trainer::Sample *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
  {
    *((_QWORD *)this + 2) = v4;
    operator delete(v4);
  }
}

uint64_t ME_Efficient_Model_Trainer::train(ME_Efficient_Model_Trainer *this)
{
  _QWORD *v2;
  const std::locale::facet *v3;
  char *v4;
  char *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _QWORD *v10;
  const std::locale::facet *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  std::vector<int> *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  const std::locale::facet *v20;
  double v21;
  _QWORD *v22;
  const std::locale::facet *v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  const std::locale::facet *v27;
  _QWORD *v28;
  const std::locale::facet *v29;
  _QWORD *v30;
  const std::locale::facet *v31;
  void **v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  uint64_t v44;
  int *v45;
  int **v46;
  int *v47;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  double v52;
  double *v53;
  uint64_t v54;
  _QWORD *v55;
  const std::locale::facet *v56;
  void **v57;
  unint64_t v58;
  _QWORD *v59;
  const std::locale::facet *v60;
  _QWORD *v61;
  const std::locale::facet *v62;
  unint64_t v63;
  int v64;
  double *v65;
  uint64_t v66;
  double v67;
  _QWORD *v68;
  const std::locale::facet *v69;
  std::locale v71;

  if (*((double *)this + 3) <= 0.0 || *((double *)this + 4) <= 0.0)
  {
    v4 = (char *)*((_QWORD *)this + 5);
    v5 = (char *)*((_QWORD *)this + 6);
    if (v5 == v4)
    {
      v59 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: no training data.", 24);
      std::ios_base::getloc((const std::ios_base *)((char *)v59 + *(_QWORD *)(*v59 - 24)));
      v60 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v60->__vftable[2].~facet_0)(v60, 10);
    }
    else
    {
      v6 = *((_DWORD *)this + 88);
      if (v6 >= (int)(-858993459 * ((unint64_t)(v5 - v4) >> 4)))
      {
        v61 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: too much heldout data. no training data is available.", 60);
        std::ios_base::getloc((const std::ios_base *)((char *)v61 + *(_QWORD *)(*v61 - 24)));
        v62 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v62->__vftable[2].~facet_0)(v62, 10);
      }
      else
      {
        v7 = 0;
        do
        {
          v9 = *(_DWORD *)v4;
          v4 += 80;
          v8 = v9;
          if (v7 <= v9)
            v7 = v8;
        }
        while (v4 != v5);
        *((_DWORD *)this + 58) = v7 + 1;
        if (v7 + 1 != -1431655765 * ((*((_QWORD *)this + 15) - *((_QWORD *)this + 14)) >> 3))
        {
          v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"warning: _num_class != _label_bag.Size()", 40);
          std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(_QWORD *)(*v10 - 24)));
          v11 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
          ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
          std::locale::~locale(&v71);
          std::ostream::put();
          std::ostream::flush();
          v6 = *((_DWORD *)this + 88);
          v5 = (char *)*((_QWORD *)this + 6);
        }
        if (v6 >= 1)
        {
          v12 = 0;
          do
          {
            v13 = (uint64_t)(v5 - 80);
            v14 = *((_QWORD *)this + 40);
            if (v14 >= *((_QWORD *)this + 41))
            {
              v15 = std::vector<ME_Efficient_Model_Trainer::Sample>::__push_back_slow_path<ME_Efficient_Model_Trainer::Sample const&>((uint64_t *)this + 39, v13);
            }
            else
            {
              std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>((uint64_t)this + 328, *((_QWORD *)this + 40), v13);
              v15 = v14 + 80;
              *((_QWORD *)this + 40) = v14 + 80;
            }
            *((_QWORD *)this + 40) = v15;
            v5 = (char *)(*((_QWORD *)this + 6) - 80);
            std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)this + 56, v5);
            *((_QWORD *)this + 6) = v5;
            ++v12;
          }
          while (v12 < *((_DWORD *)this + 88));
        }
        v16 = (std::vector<int> *)*((_QWORD *)this + 5);
        v17 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((v5 - (char *)v16) >> 4));
        if (v5 == (char *)v16)
          v18 = 0;
        else
          v18 = v17;
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,false>(v16, (int *)v5, (uint64_t)&v71, v18, 1);
        if (*((double *)this + 3) > 0.0)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"L1 regularizer = ", 17);
          v19 = (_QWORD *)std::ostream::operator<<();
          std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(_QWORD *)(*v19 - 24)));
          v20 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
          ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
          std::locale::~locale(&v71);
          std::ostream::put();
          std::ostream::flush();
        }
        v21 = *((double *)this + 4);
        if (v21 > 0.0)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"L2 regularizer = ", 17);
          v22 = (_QWORD *)std::ostream::operator<<();
          std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
          v23 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
          ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
          std::locale::~locale(&v71);
          std::ostream::put();
          std::ostream::flush();
          v21 = *((double *)this + 4);
        }
        v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 6) - *((_QWORD *)this + 5)) >> 4);
        *((double *)this + 3) = *((double *)this + 3) / (double)v24;
        *((double *)this + 4) = v21 / (double)v24;
        v25 = (_QWORD *)MEMORY[0x24BEDB310];
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"preparing for estimation...", 27);
        ME_Efficient_Model_Trainer::make_feature_bag(this, 0);
        v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"done", 4);
        std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(_QWORD *)(*v26 - 24)));
        v27 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"number of samples = ", 20);
        v28 = (_QWORD *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v28 + *(_QWORD *)(*v28 - 24)));
        v29 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v29->__vftable[2].~facet_0)(v29, 10);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"number of features = ", 21);
        v30 = (_QWORD *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(_QWORD *)(*v30 - 24)));
        v31 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"calculating empirical expectation...", 36);
        v32 = (void **)((char *)this + 240);
        std::vector<double>::resize((uint64_t)this + 240, (int)((uint64_t)(*((_QWORD *)this + 27) - *((_QWORD *)this + 26)) >> 2));
        v33 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
        v34 = v33 >> 2;
        if ((int)(v33 >> 2) >= 1)
          bzero(*v32, (2 * v33) & 0x7FFFFFFF8);
        v35 = *((_QWORD *)this + 5);
        v36 = 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)this + 6) - v35) >> 4);
        if ((int)v36 >= 1)
        {
          v37 = 0;
          do
          {
            v38 = v35 + 80 * v37;
            v39 = *(int **)(v38 + 8);
            v40 = *(int **)(v38 + 16);
            if (v39 != v40)
            {
              v41 = *((_QWORD *)this + 36);
              do
              {
                v42 = v41 + 24 * *v39;
                v43 = *(int **)v42;
                if (*(_QWORD *)v42 != *(_QWORD *)(v42 + 8))
                {
                  do
                  {
                    if (*(_DWORD *)v38 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v43))*((double *)*v32 + *v43) = *((double *)*v32 + *v43) + 1.0;
                    ++v43;
                    v41 = *((_QWORD *)this + 36);
                  }
                  while (v43 != *(int **)(v41 + 24 * *v39 + 8));
                  v40 = *(int **)(v38 + 16);
                }
                ++v39;
              }
              while (v39 != v40);
            }
            v44 = v35 + 80 * v37;
            v47 = *(int **)(v44 + 40);
            v46 = (int **)(v44 + 40);
            v45 = v47;
            v48 = *(v46 - 1);
            if (v48 != v47)
            {
              v49 = *((_QWORD *)this + 36);
              do
              {
                v50 = v49 + 24 * *v48;
                v51 = *(int **)v50;
                if (*(_QWORD *)v50 != *(_QWORD *)(v50 + 8))
                {
                  do
                  {
                    if (*(_DWORD *)v38 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v51))*((double *)*v32 + *v51) = *((double *)v48 + 1) + *((double *)*v32 + *v51);
                    ++v51;
                    v49 = *((_QWORD *)this + 36);
                  }
                  while (v51 != *(int **)(v49 + 24 * *v48 + 8));
                  v45 = *v46;
                }
                v48 += 4;
              }
              while (v48 != v45);
            }
            ++v37;
            v35 = *((_QWORD *)this + 5);
            v36 = 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)this + 6) - v35) >> 4);
          }
          while (v37 < (int)v36);
          v34 = (*((_QWORD *)this + 27) - *((_QWORD *)this + 26)) >> 2;
        }
        if ((int)v34 >= 1)
        {
          v52 = (double)v36;
          v53 = (double *)*v32;
          v54 = v34;
          do
          {
            *v53 = *v53 / v52;
            ++v53;
            --v54;
          }
          while (v54);
        }
        v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"done", 4);
        std::ios_base::getloc((const std::ios_base *)((char *)v55 + *(_QWORD *)(*v55 - 24)));
        v56 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v56->__vftable[2].~facet_0)(v56, 10);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        v57 = (void **)((char *)this + 144);
        std::vector<double>::resize((uint64_t)this + 144, (int)((uint64_t)(*((_QWORD *)this + 27) - *((_QWORD *)this + 26)) >> 2));
        v58 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
        if ((int)(v58 >> 2) >= 1)
          bzero(*v57, (2 * v58) & 0x7FFFFFFF8);
        if (*(_DWORD *)this == 2)
          ME_Efficient_Model_Trainer::perform_SGD(this);
        else
          ME_Efficient_Model_Trainer::perform_QUASI_NEWTON(this);
        v63 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
        if ((int)(v63 >> 2) >= 1)
        {
          v64 = 0;
          v65 = (double *)*v57;
          v66 = (v63 >> 2);
          do
          {
            v67 = *v65++;
            if (v67 != 0.0)
              ++v64;
            --v66;
          }
          while (v66);
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"number of active features = ", 28);
        v68 = (_QWORD *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v68 + *(_QWORD *)(*v68 - 24)));
        v69 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v69->__vftable[2].~facet_0)(v69, 10);
      }
    }
  }
  else
  {
    v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: L1 and L2 regularizers cannot be used simultaneously.", 60);
    std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)));
    v3 = std::locale::use_facet(&v71, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  }
  std::locale::~locale(&v71);
  std::ostream::put();
  std::ostream::flush();
  return 0;
}

void sub_2083F891C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

void ME_Efficient_Model_Trainer::get_labels(_QWORD *a1, std::vector<std::string> *a2)
{
  signed int v4;
  ME_Efficient_Model_Trainer::StringBag *v5;
  std::allocator<std::string> *p_end_cap;
  std::string *value;
  std::vector<std::string>::pointer end;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  std::string *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  int v18;
  std::string __p;
  std::__split_buffer<std::string> __v;

  if ((int)(-1431655765 * ((a1[15] - a1[14]) >> 3)) >= 1)
  {
    v4 = 0;
    v5 = (ME_Efficient_Model_Trainer::StringBag *)(a1 + 8);
    p_end_cap = (std::allocator<std::string> *)&a2->__end_cap_;
    do
    {
      ME_Efficient_Model_Trainer::StringBag::Str(v5, v4, &__p);
      end = a2->__end_;
      value = a2->__end_cap_.__value_;
      if (end >= value)
      {
        v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)a2->__begin_) >> 3);
        v11 = v10 + 1;
        if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)a2->__begin_) >> 3);
        if (2 * v12 > v11)
          v11 = 2 * v12;
        if (v12 >= 0x555555555555555)
          v13 = 0xAAAAAAAAAAAAAAALL;
        else
          v13 = v11;
        __v.__end_cap_.__value_ = p_end_cap;
        if (v13)
          v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v13);
        else
          v14 = 0;
        v15 = v14 + v10;
        __v.__first_ = v14;
        __v.__begin_ = v15;
        __v.__end_cap_.__value_ = &v14[v13];
        v16 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        v15->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
        memset(&__p, 0, sizeof(__p));
        __v.__end_ = v15 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(a2, &__v);
        v17 = a2->__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
        v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
        a2->__end_ = v17;
        if (v18 < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      else
      {
        v9 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        end->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v9;
        a2->__end_ = end + 1;
      }
      ++v4;
    }
    while (v4 < (int)(-1431655765 * ((a1[15] - a1[14]) >> 3)));
  }
}

void sub_2083F8B04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::__split_buffer<std::string> *a15)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ME_Efficient_Model_Trainer::StringBag::Str(ME_Efficient_Model_Trainer::StringBag *this@<X0>, signed int a2@<W1>, std::string *a3@<X8>)
{
  uint64_t v3;
  __int128 *v4;
  __int128 v5;

  if (a2 < 0
    || (v3 = *((_QWORD *)this + 6), (int)(-1431655765 * ((unint64_t)(*((_QWORD *)this + 7) - v3) >> 3)) <= a2))
  {
    ME_Efficient_Model_Trainer::StringBag::Str();
  }
  v4 = (__int128 *)(v3 + 24 * a2);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
  }
  else
  {
    v5 = *v4;
    a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v5;
  }
}

uint64_t ME_Efficient_Model_Trainer::get_feature_id(ME_Efficient_Model_Trainer *this, unsigned int a2, unsigned int a3)
{
  _QWORD *v3;
  uint64_t *v4;
  unsigned int v6;
  unsigned int v7;

  v3 = (_QWORD *)((char *)this + 168);
  ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v6, a2, a3);
  v7 = v6;
  v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(v3, &v7);
  if (v4)
    return *((unsigned int *)v4 + 5);
  else
    return 0xFFFFFFFFLL;
}

BOOL ME_Efficient_Model_Trainer::ignore_feature(ME_Efficient_Model_Trainer *this, int a2, double a3)
{
  double v3;

  v3 = *(double *)(*((_QWORD *)this + 18) + 8 * a2);
  return fabs(v3) < a3 || v3 == 0.0;
}

double ME_Efficient_Model_Trainer::get_feature_weight(ME_Efficient_Model_Trainer *this, int a2)
{
  return *(double *)(*((_QWORD *)this + 18) + 8 * a2);
}

void ME_Efficient_Model_Trainer::clear(ME_Efficient_Model_Trainer *this)
{
  _QWORD *i;
  _QWORD *v3;
  _QWORD *j;
  _QWORD *v5;

  *((_QWORD *)this + 19) = *((_QWORD *)this + 18);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear((_QWORD *)this + 21);
  *((_QWORD *)this + 27) = *((_QWORD *)this + 26);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)this + 72);
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 14);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 36);
  *((_QWORD *)this + 31) = *((_QWORD *)this + 30);
  *((_QWORD *)this + 34) = *((_QWORD *)this + 33);
  v3 = (_QWORD *)*((_QWORD *)this + 5);
  for (i = (_QWORD *)*((_QWORD *)this + 6);
        i != v3;
        std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)this + 56, i))
  {
    i -= 10;
  }
  *((_QWORD *)this + 6) = v3;
  v5 = (_QWORD *)*((_QWORD *)this + 39);
  for (j = (_QWORD *)*((_QWORD *)this + 40);
        j != v5;
        std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)this + 328, j))
  {
    j -= 10;
  }
  *((_QWORD *)this + 40) = v5;
  nlp::BurstTrieRelease(*((char **)this + 17));
}

void prune(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  const std::string::value_type *Completion;
  unsigned int Payload;
  unsigned int v8;
  unint64_t v9;
  uint64_t feature_id;
  uint64_t v11;
  double v12;
  double v13;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  void **v19;
  uint64_t v20;
  float v21;
  _QWORD *v22;
  uint64_t v23;
  std::string v24;
  std::string v25;
  void *__p[2];
  int64_t v27;
  std::vector<std::string> v28;
  _BYTE v29[24];
  _BYTE *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 384);
  v5 = *(double *)(a1 + 392);
  memset(&v28, 0, sizeof(v28));
  ME_Efficient_Model_Trainer::get_labels((_QWORD *)a1, &v28);
  Completion = (const std::string::value_type *)nlp::TrieCompletionGetCompletion(a2);
  Payload = nlp::TrieCompletionGetPayload(a2);
  if (v28.__end_ != v28.__begin_)
  {
    v8 = Payload;
    LODWORD(v9) = 0;
    do
    {
      feature_id = ME_Efficient_Model_Trainer::get_feature_id((ME_Efficient_Model_Trainer *)a1, v9, v8);
      v11 = feature_id;
      if ((feature_id & 0x80000000) != 0)
        goto LABEL_25;
      v12 = *(double *)(*(_QWORD *)(a1 + 144) + 8 * feature_id);
      v13 = fabs(v12);
      if (v12 == 0.0 || v13 < v5)
        goto LABEL_25;
      std::to_string(&v24, v9);
      v15 = std::string::append(&v24, "_");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v25.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      v17 = std::string::append(&v25, Completion);
      v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      v27 = v17->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v18;
      v17->__r_.__value_.__l.__size_ = 0;
      v17->__r_.__value_.__r.__words[2] = 0;
      v17->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
      if (v27 >= 0)
        v19 = __p;
      else
        v19 = (void **)__p[0];
      if (v27 >= 0)
        v20 = HIBYTE(v27);
      else
        v20 = LODWORD(__p[1]);
      v21 = v12;
      v30 = 0;
      nlp::BurstTrieAddWithScore(v4, (uint64_t)v19, v20, v11, 0, (uint64_t)v29, v21);
      v22 = v30;
      if (v30 == v29)
      {
        v22 = v29;
        v23 = 4;
      }
      else
      {
        if (!v30)
          goto LABEL_23;
        v23 = 5;
      }
      (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_23:
      if (SHIBYTE(v27) < 0)
        operator delete(__p[0]);
LABEL_25:
      v9 = (v9 + 1);
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)v28.__end_ - (char *)v28.__begin_) >> 3) > v9);
  }
  __p[0] = &v28;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
}

void sub_2083F8EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  __p = &a30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

BOOL ME_Efficient_Model_Trainer::save_to_file(ME_Efficient_Model_Trainer *a1, uint64_t a2, double a3)
{
  const char *v6;
  uint64_t v7;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  const std::locale::facet *v15;
  std::locale v16;

  if (*(char *)(a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  v7 = open(v6, 1538, 384);
  if ((v7 & 0x80000000) == 0)
    return ME_Efficient_Model_Trainer::save_to_file_descriptor(a1, v7, a3);
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: cannot open ", 19);
  v10 = *(char *)(a2 + 23);
  if (v10 >= 0)
    v11 = a2;
  else
    v11 = *(_QWORD *)a2;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a2 + 23);
  else
    v12 = *(_QWORD *)(a2 + 8);
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"!", 1);
  std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(_QWORD *)(*v14 - 24)));
  v15 = std::locale::use_facet(&v16, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
  std::locale::~locale(&v16);
  std::ostream::put();
  std::ostream::flush();
  return 0;
}

void sub_2083F90A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

BOOL ME_Efficient_Model_Trainer::save_to_file_descriptor(ME_Efficient_Model_Trainer *this, uint64_t __fd, double a3)
{
  ssize_t v6;
  unsigned int v7;
  unsigned int v8;
  std::string *v9;
  std::string::size_type size;
  off_t v11;
  ssize_t v12;
  char *v13;
  char *v14;
  nlp *v15;
  _QWORD *v16;
  uint64_t v17;
  _BOOL8 v18;
  int v19;
  _QWORD *v20;
  const std::locale::facet *v21;
  int v23;
  std::string __p[16];
  char *v25;
  double v26;
  uint64_t __buf;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int v31;
  std::locale v32;
  _QWORD v33[3];
  _QWORD *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if ((__fd & 0x80000000) != 0)
    return 0;
  v31 = 0;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  __buf = 0x200C0FFEELL;
  v6 = pwrite(__fd, &__buf, 0x3CuLL, 0);
  v7 = -1431655765 * ((*((_QWORD *)this + 15) - *((_QWORD *)this + 14)) >> 3);
  *(_QWORD *)&v28 = __PAIR64__(v7, v6);
  if (v7)
  {
    v8 = 0;
    do
    {
      ME_Efficient_Model_Trainer::StringBag::Str((ME_Efficient_Model_Trainer *)((char *)this + 64), v8, __p);
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v9 = __p;
      else
        v9 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
      else
        size = __p[0].__r_.__value_.__l.__size_;
      v11 = pwrite(__fd, v9, size, v6) + v6;
      v12 = pwrite(__fd, "\n", 1uLL, v11);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      v6 = v12 + v11;
      ++v8;
    }
    while (v8 < DWORD1(v28));
  }
  nlp::BurstTrieCreateMutableWithOptions(64, 1);
  v14 = v13;
  ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer((ME_Efficient_Model_Trainer *)__p, this);
  v25 = v14;
  v26 = a3;
  v15 = (nlp *)*((_QWORD *)this + 17);
  v33[0] = &off_24C09D9E8;
  v33[1] = prune;
  v34 = v33;
  nlp::BurstTrieSearch(v15, "", 0, (uint64_t)__p, (uint64_t)v33, -1);
  v16 = v34;
  if (v34 == v33)
  {
    v17 = 4;
    v16 = v33;
    goto LABEL_18;
  }
  if (v34)
  {
    v17 = 5;
LABEL_18:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }
  v23 = 0;
  v19 = nlp::BurstTrieWriteToFileDescriptor((uint64_t)v14, __fd, &v23);
  v18 = v19 != 0;
  if (v19)
  {
    LODWORD(v29) = v23;
    DWORD1(v29) = lseek(__fd, 0, 2);
    pwrite(__fd, &__buf, 0x3CuLL, 0);
    close(__fd);
    nlp::BurstTrieRelease(v14);
  }
  else
  {
    v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: could not write out features!", 36);
    std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(_QWORD *)(*v20 - 24)));
    v21 = std::locale::use_facet(&v32, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
    std::locale::~locale(&v32);
    std::ostream::put();
    std::ostream::flush();
    nlp::BurstTrieRelease(v14);
    close(__fd);
  }
  ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer((ME_Efficient_Model_Trainer *)__p);
  return v18;
}

void sub_2083F93B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;

  std::locale::~locale((std::locale *)(v16 - 144));
  ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer((ME_Efficient_Model_Trainer *)&__p);
  _Unwind_Resume(a1);
}

void ME_Efficient_Model::~ME_Efficient_Model(ME_Efficient_Model *this)
{
  char *v2;
  void *v3;
  size_t v4;
  void **v5;

  v2 = (char *)*((_QWORD *)this + 3);
  if (v2)
    nlp::BurstTrieRelease(v2);
  if (*((_BYTE *)this + 48))
  {
    v4 = *((_QWORD *)this + 4);
    v3 = (void *)*((_QWORD *)this + 5);
    if (v4 && v3)
      munmap(v3, v4);
    else
      free(v3);
  }
  v5 = (void **)this;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
}

uint64_t ME_Efficient_Model::num_classes(ME_Efficient_Model *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 5);
  if (v1)
    return *(unsigned int *)(v1 + 12);
  else
    return 0xFFFFFFFFLL;
}

char *ME_Efficient_Model::get_class_label(ME_Efficient_Model *this, unsigned int a2)
{
  char *result;
  uint64_t v4;
  ME_Efficient_Model *v5;
  uint64_t v6;

  result = 0;
  if ((a2 & 0x80000000) == 0)
  {
    v5 = this;
    v4 = *(_QWORD *)this;
    v6 = *((_QWORD *)v5 + 1) - v4;
    if (v6)
    {
      if (0xAAAAAAAAAAAAAAABLL * (v6 >> 3) <= a2)
      {
        return 0;
      }
      else
      {
        result = (char *)(v4 + 24 * a2);
        if (result[23] < 0)
          return *(char **)result;
      }
    }
  }
  return result;
}

uint64_t ME_Efficient_Model::get_class_id(uint64_t *a1, unsigned __int8 **a2)
{
  return -1431655765
       * ((unint64_t)(std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(*a1, a1[1], a2)- *a1) >> 3);
}

uint64_t ME_Efficient_Model::load_from_file(uint64_t a1, uint64_t a2, char a3)
{
  const char *v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  const std::locale::facet *v13;
  uint64_t v14;
  const char *v16;
  int v17;
  int v18;
  off_t st_size;
  const char *v20;
  void *v21;
  int v22;
  void *v23;
  stat v24;
  std::locale v25;

  if (*(char *)(a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  if (!stat(v6, &v24))
  {
    if (*(char *)(a2 + 23) >= 0)
      v16 = (const char *)a2;
    else
      v16 = *(const char **)a2;
    v17 = open(v16, 0);
    if (v17 < 0)
    {
      v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: cannot open ", 19);
      v22 = *(char *)(a2 + 23);
      if (v22 >= 0)
        v9 = a2;
      else
        v9 = *(_QWORD *)a2;
      if (v22 >= 0)
        v10 = *(unsigned __int8 *)(a2 + 23);
      else
        v10 = *(_QWORD *)(a2 + 8);
      goto LABEL_11;
    }
    v18 = v17;
    st_size = v24.st_size;
    if ((a3 & 1) != 0)
    {
      *(_QWORD *)(a1 + 32) = v24.st_size;
      v20 = (const char *)mmap(0, st_size, 1, 1, v17, 0);
      *(_QWORD *)(a1 + 40) = v20;
      if (!v20)
      {
LABEL_23:
        *(_QWORD *)(a1 + 32) = 0;
        *(_QWORD *)(a1 + 40) = 0;
LABEL_34:
        close(v18);
        return 0;
      }
      if (!ME_Efficient_Model::load_with_bytes((ME_Efficient_Model *)a1, v20))
      {
        v21 = *(void **)(a1 + 40);
        if (v21)
          munmap(v21, st_size);
        goto LABEL_23;
      }
    }
    else
    {
      v23 = malloc_type_malloc(v24.st_size, 0x9C7F3189uLL);
      *(_QWORD *)(a1 + 40) = v23;
      if (st_size != read(v18, v23, st_size)
        || !ME_Efficient_Model::load_with_bytes((ME_Efficient_Model *)a1, *(const char **)(a1 + 40)))
      {
        free(*(void **)(a1 + 40));
        *(_QWORD *)(a1 + 40) = 0;
        goto LABEL_34;
      }
    }
    v14 = 1;
    *(_BYTE *)(a1 + 48) = 1;
    close(v18);
    return v14;
  }
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"error: cannot open ", 19);
  v8 = *(char *)(a2 + 23);
  if (v8 >= 0)
    v9 = a2;
  else
    v9 = *(_QWORD *)a2;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(a2 + 23);
  else
    v10 = *(_QWORD *)(a2 + 8);
LABEL_11:
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, v9, v10);
  v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"!", 1);
  std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  v13 = std::locale::use_facet(&v25, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
  std::locale::~locale(&v25);
  std::ostream::put();
  std::ostream::flush();
  return 0;
}

void sub_2083F97A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::locale::~locale((std::locale *)(v1 - 40));
  _Unwind_Resume(a1);
}

BOOL ME_Efficient_Model::load_with_bytes(ME_Efficient_Model *this, const char *a2)
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  const char *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  unsigned int v14;
  char *v15;
  void *__p[2];
  uint64_t v19;
  char __s[1024];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 5) = a2;
  if (!a2 || *(_DWORD *)a2 != 12648430 || *((_DWORD *)a2 + 1) != 2)
    return 0;
  v4 = 0;
  v5 = 0;
  *((_QWORD *)this + 4) = *((unsigned int *)a2 + 7);
  do
  {
    if (v5 >= *((_DWORD *)a2 + 3))
      break;
    v6 = *((unsigned int *)a2 + 2);
    v7 = v4;
    v8 = a2[v6 + v4];
    if (v8 == 10)
    {
      LODWORD(v9) = 0;
    }
    else
    {
      v9 = 0;
      v10 = &a2[v6 + 1 + v4];
      do
      {
        __s[v9] = v8;
        v8 = v10[v9++];
      }
      while (v8 != 10);
      v7 = v4 + v9;
    }
    v4 = v7 + 1;
    __s[v9] = 0;
    std::string::basic_string[abi:ne180100]<0>(__p, __s);
    v11 = *((_QWORD *)this + 1);
    if (v11 >= *((_QWORD *)this + 2))
    {
      v13 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)this, (__int128 *)__p);
    }
    else
    {
      if (SHIBYTE(v19) < 0)
      {
        std::string::__init_copy_ctor_external(*((std::string **)this + 1), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      }
      else
      {
        v12 = *(_OWORD *)__p;
        *(_QWORD *)(v11 + 16) = v19;
        *(_OWORD *)v11 = v12;
      }
      v13 = v11 + 24;
      *((_QWORD *)this + 1) = v11 + 24;
    }
    *((_QWORD *)this + 1) = v13;
    __s[0] = 0;
    v14 = *((_DWORD *)a2 + 3);
    if (SHIBYTE(v19) < 0)
      operator delete(__p[0]);
    ++v5;
  }
  while (v5 < v14);
  v15 = nlp::BurstTrieCreateWithBytes((nlp *)(*((_QWORD *)this + 5) + *((unsigned int *)a2 + 6)), a2);
  *((_QWORD *)this + 3) = v15;
  return *((_QWORD *)this + 1) != *(_QWORD *)this && v15 != 0;
}

void sub_2083F996C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v14 + 8) = v15;
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model::conditional_probability(uint64_t a1, double **a2, uint64_t *a3)
{
  double *v4;
  double *v5;
  uint64_t v6;
  BOOL v7;
  double *v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  int i;
  double v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  int j;
  double v24;

  v5 = *a2;
  v4 = a2[1];
  v6 = (uint64_t)(*a2 + 1);
  v7 = *a2 == v4 || v6 == (_QWORD)v4;
  v8 = *a2;
  if (!v7)
  {
    v9 = *v5;
    v8 = *a2;
    v10 = *a2 + 1;
    do
    {
      v11 = *v10++;
      v12 = v11;
      if (v9 < v11)
      {
        v9 = v12;
        v8 = (double *)v6;
      }
      v6 = (uint64_t)v10;
    }
    while (v10 != v4);
  }
  v13 = 0;
  v14 = 0.0;
  v15 = fmax(*v8 + -700.0, 0.0);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *a3;
  if (!v16)
    goto LABEL_11;
LABEL_10:
  for (i = *(_DWORD *)(v16 + 12); v13 < i; i = -1)
  {
    v19 = exp(v5[v13] - v15);
    if (v19 == 0.0)
      ME_Efficient_Model::conditional_probability();
    *(double *)(v17 + 8 * v13) = v19;
    v14 = v14 + v19;
    ++v13;
    if (v16)
      goto LABEL_10;
LABEL_11:
    ;
  }
  v20 = 0;
  result = 0;
  v22 = *a3;
  if (!v16)
    goto LABEL_18;
LABEL_17:
  for (j = *(_DWORD *)(v16 + 12); v20 < j; j = -1)
  {
    v24 = *(double *)(v22 + 8 * v20) / v14;
    *(double *)(v22 + 8 * v20) = v24;
    if (v24 <= *(double *)(v22 + 8 * (int)result))
      result = result;
    else
      result = v20;
    ++v20;
    if (v16)
      goto LABEL_17;
LABEL_18:
    ;
  }
  if ((result & 0x80000000) != 0)
    ME_Efficient_Model::conditional_probability();
  return result;
}

uint64_t ME_Efficient_Model::classify(uint64_t a1, double **a2, uint64_t *a3)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  double v10;
  double v11;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(_DWORD *)(v4 + 12);
  else
    v5 = -1;
  if (v5 != ((unint64_t)(a3[1] - *a3) >> 3))
    ME_Efficient_Model::classify();
  ME_Efficient_Model::conditional_probability(a1, a2, a3);
  v6 = a3[1] - *a3;
  if ((int)(v6 >> 3) < 1)
    return 0;
  v7 = 0;
  LODWORD(result) = 0;
  v9 = (v6 >> 3);
  v10 = 0.0;
  do
  {
    v11 = *(double *)(*a3 + 8 * v7);
    if (v11 <= v10)
      result = result;
    else
      result = v7;
    if (v11 > v10)
      v10 = *(double *)(*a3 + 8 * v7);
    ++v7;
  }
  while (v9 != v7);
  return result;
}

void ME_Efficient_Model::classify(ME_Efficient_Model *this@<X0>, ME_Sample *a2@<X1>, unsigned int *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  int v9;
  uint64_t i;
  uint64_t j;
  uint64_t v12;
  int v13;
  std::string *v14;
  __int128 v15;
  int v16;
  const std::string::value_type *v17;
  std::string::size_type v18;
  std::string *v19;
  __int128 v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  int v26;
  std::string *v27;
  __int128 v28;
  int v29;
  const std::string::value_type *v30;
  std::string::size_type v31;
  std::string *v32;
  __int128 v33;
  void **v34;
  uint64_t v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  std::string v40;
  std::string v41;
  void *__p[2];
  int64_t v43;
  void *v44[3];

  if (!*((_QWORD *)this + 3))
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  v8 = *((_QWORD *)this + 5);
  if (v8)
    v9 = *(_DWORD *)(v8 + 12);
  else
    v9 = -1;
  __p[0] = 0;
  std::vector<double>::vector(v44, v9, __p);
  for (i = *((_QWORD *)a2 + 3); i != *((_QWORD *)a2 + 4); i += 24)
  {
    for (j = 0; ; ++j)
    {
      v12 = *((_QWORD *)this + 5);
      v13 = v12 ? *(_DWORD *)(v12 + 12) : -1;
      if (j >= v13)
        break;
      std::to_string(&v40, j);
      v14 = std::string::append(&v40, "_");
      v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
      v41.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v15;
      v14->__r_.__value_.__l.__size_ = 0;
      v14->__r_.__value_.__r.__words[2] = 0;
      v14->__r_.__value_.__r.__words[0] = 0;
      v16 = *(char *)(i + 23);
      if (v16 >= 0)
        v17 = (const std::string::value_type *)i;
      else
        v17 = *(const std::string::value_type **)i;
      if (v16 >= 0)
        v18 = *(unsigned __int8 *)(i + 23);
      else
        v18 = *(_QWORD *)(i + 8);
      v19 = std::string::append(&v41, v17, v18);
      v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
      v43 = v19->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v20;
      v19->__r_.__value_.__l.__size_ = 0;
      v19->__r_.__value_.__r.__words[2] = 0;
      v19->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v41.__r_.__value_.__l.__data_);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v40.__r_.__value_.__l.__data_);
      LODWORD(v41.__r_.__value_.__l.__data_) = 0;
      LODWORD(v40.__r_.__value_.__l.__data_) = 0;
      if (v43 >= 0)
        v21 = __p;
      else
        v21 = (void **)__p[0];
      if (v43 >= 0)
        v22 = HIBYTE(v43);
      else
        v22 = LODWORD(__p[1]);
      if (nlp::BurstTrieContains(*((nlp **)this + 3), v21, v22, &v41, &v40))
        *((double *)v44[0] + j) = *((double *)v44[0] + j) + *(float *)&v40.__r_.__value_.__l.__data_;
      if (SHIBYTE(v43) < 0)
        operator delete(__p[0]);
    }
  }
  v23 = *((_QWORD *)a2 + 6);
  if (v23 != *((_QWORD *)a2 + 7))
  {
    do
    {
      for (k = 0; ; ++k)
      {
        v25 = *((_QWORD *)this + 5);
        v26 = v25 ? *(_DWORD *)(v25 + 12) : -1;
        if (k >= v26)
          break;
        std::to_string(&v40, k);
        v27 = std::string::append(&v40, "_");
        v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
        v41.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v28;
        v27->__r_.__value_.__l.__size_ = 0;
        v27->__r_.__value_.__r.__words[2] = 0;
        v27->__r_.__value_.__r.__words[0] = 0;
        v29 = *(char *)(v23 + 23);
        if (v29 >= 0)
          v30 = (const std::string::value_type *)v23;
        else
          v30 = *(const std::string::value_type **)v23;
        if (v29 >= 0)
          v31 = *(unsigned __int8 *)(v23 + 23);
        else
          v31 = *(_QWORD *)(v23 + 8);
        v32 = std::string::append(&v41, v30, v31);
        v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        v43 = v32->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v33;
        v32->__r_.__value_.__l.__size_ = 0;
        v32->__r_.__value_.__r.__words[2] = 0;
        v32->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v41.__r_.__value_.__l.__data_);
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v40.__r_.__value_.__l.__data_);
        LODWORD(v41.__r_.__value_.__l.__data_) = 0;
        LODWORD(v40.__r_.__value_.__l.__data_) = 0;
        if (v43 >= 0)
          v34 = __p;
        else
          v34 = (void **)__p[0];
        if (v43 >= 0)
          v35 = HIBYTE(v43);
        else
          v35 = LODWORD(__p[1]);
        if (nlp::BurstTrieContains(*((nlp **)this + 3), v34, v35, &v41, &v40))
          *((double *)v44[0] + k) = *(double *)(v23 + 24)
                                  + *(float *)&v40.__r_.__value_.__l.__data_
                                  + *((double *)v44[0] + k);
        if (SHIBYTE(v43) < 0)
          operator delete(__p[0]);
      }
      v23 += 32;
    }
    while (v23 != *((_QWORD *)a2 + 7));
    if (v25)
      goto LABEL_63;
LABEL_65:
    v36 = -1;
    goto LABEL_66;
  }
  v25 = *((_QWORD *)this + 5);
  if (!v25)
    goto LABEL_65;
LABEL_63:
  v36 = *(int *)(v25 + 12);
LABEL_66:
  std::vector<double>::vector(a4, v36);
  v37 = ME_Efficient_Model::classify((uint64_t)this, (double **)v44, a4);
  if (a3)
    *a3 = v37;
  v38 = 0;
  if ((v37 & 0x80000000) == 0)
  {
    v39 = *((_QWORD *)this + 1) - *(_QWORD *)this;
    if (v39)
    {
      if (0xAAAAAAAAAAAAAAABLL * (v39 >> 3) <= v37)
      {
        v38 = 0;
      }
      else
      {
        v38 = *(_QWORD *)this + 24 * v37;
        if (*(char *)(v38 + 23) < 0)
          v38 = *(_QWORD *)v38;
      }
    }
  }
  MEMORY[0x20BD06764](a2, v38);
  if (v44[0])
  {
    v44[1] = v44[0];
    operator delete(v44[0]);
  }
}

void sub_2083F9EF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *__p,uint64_t a30)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_DWORD *ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(_DWORD *this, unsigned int a2, unsigned int a3)
{
  *this = a2 + (a3 << 8);
  if (a2 >= 0x100)
    ME_Efficient_Model_Trainer::ME_Feature::ME_Feature();
  if (HIBYTE(a3))
    ME_Efficient_Model_Trainer::ME_Feature::ME_Feature();
  return this;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(_QWORD *a1, unsigned int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_2083FA99C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_DWORD *)v8 + 10) = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2083FAA4C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer(ME_Efficient_Model_Trainer *this, const ME_Efficient_Model_Trainer *a2)
{
  int v4;

  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>((_QWORD *)this + 5, *((_QWORD *)a2 + 5), *((_QWORD *)a2 + 6), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 4));
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
  std::unordered_map<std::string,int>::unordered_map((uint64_t)this + 72, (uint64_t)a2 + 72);
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)((char *)this + 112), *((__int128 **)a2 + 14), *((__int128 **)a2 + 15), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 15) - *((_QWORD *)a2 + 14)) >> 3));
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)this + 18, *((const void **)a2 + 18), *((_QWORD *)a2 + 19), (uint64_t)(*((_QWORD *)a2 + 19) - *((_QWORD *)a2 + 18)) >> 3);
  std::unordered_map<unsigned int,int>::unordered_map((uint64_t)this + 168, (uint64_t)a2 + 168);
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 28) = 0;
  std::vector<ME_Efficient_Model_Trainer::ME_Feature>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::ME_Feature*,ME_Efficient_Model_Trainer::ME_Feature*>((_QWORD *)this + 26, *((const void **)a2 + 26), *((_QWORD *)a2 + 27), (uint64_t)(*((_QWORD *)a2 + 27) - *((_QWORD *)a2 + 26)) >> 2);
  v4 = *((_DWORD *)a2 + 58);
  *((_QWORD *)this + 30) = 0;
  *((_DWORD *)this + 58) = v4;
  *((_QWORD *)this + 31) = 0;
  *((_QWORD *)this + 32) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)this + 30, *((const void **)a2 + 30), *((_QWORD *)a2 + 31), (uint64_t)(*((_QWORD *)a2 + 31) - *((_QWORD *)a2 + 30)) >> 3);
  *((_QWORD *)this + 33) = 0;
  *((_QWORD *)this + 34) = 0;
  *((_QWORD *)this + 35) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)this + 33, *((const void **)a2 + 33), *((_QWORD *)a2 + 34), (uint64_t)(*((_QWORD *)a2 + 34) - *((_QWORD *)a2 + 33)) >> 3);
  *((_QWORD *)this + 36) = 0;
  *((_QWORD *)this + 37) = 0;
  *((_QWORD *)this + 38) = 0;
  std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>((_QWORD *)this + 36, *((_QWORD *)a2 + 36), *((_QWORD *)a2 + 37), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 37) - *((_QWORD *)a2 + 36)) >> 3));
  *((_QWORD *)this + 39) = 0;
  *((_QWORD *)this + 40) = 0;
  *((_QWORD *)this + 41) = 0;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>((_QWORD *)this + 39, *((_QWORD *)a2 + 39), *((_QWORD *)a2 + 40), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a2 + 40) - *((_QWORD *)a2 + 39)) >> 4));
  *((_OWORD *)this + 21) = *((_OWORD *)a2 + 21);
  *((_QWORD *)this + 44) = *((_QWORD *)a2 + 44);
  *((_QWORD *)this + 46) = 0;
  *((_QWORD *)this + 47) = 0;
  *((_QWORD *)this + 45) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)this + 45, *((const void **)a2 + 45), *((_QWORD *)a2 + 46), (uint64_t)(*((_QWORD *)a2 + 46) - *((_QWORD *)a2 + 45)) >> 3);
  *((_QWORD *)this + 17) = nlp::BurstTrieRetain(*((_QWORD *)a2 + 17));
}

void sub_2083FB004(_Unwind_Exception *a1, void **a2, ...)
{
  _QWORD *v2;
  ME_Efficient_Model_Trainer::StringBag *v3;
  void **v4;
  ME_Efficient_Model_Trainer::ME_FeatureBag *v5;
  void **v6;
  void **v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a2);
  v9 = *v4;
  if (*v4)
  {
    v2[46] = v9;
    operator delete(v9);
  }
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v10 = *v7;
  if (*v7)
  {
    v2[34] = v10;
    operator delete(v10);
  }
  v11 = *v6;
  if (*v6)
  {
    v2[31] = v11;
    operator delete(v11);
  }
  ME_Efficient_Model_Trainer::ME_FeatureBag::~ME_FeatureBag(v5);
  v12 = *a2;
  if (*a2)
  {
    v2[19] = v12;
    operator delete(v12);
  }
  ME_Efficient_Model_Trainer::StringBag::~StringBag(v3);
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void sub_2083FB0D0()
{
  uint64_t v0;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(v0);
  JUMPOUT(0x2083FB0BCLL);
}

void sub_2083FB0E0()
{
  JUMPOUT(0x2083FB0BCLL);
}

_QWORD *std::vector<ME_Efficient_Model_Trainer::Sample>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<ME_Efficient_Model_Trainer::Sample>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2083FB14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ME_Efficient_Model_Trainer::Sample>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x333333333333334)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[80 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v9[3];
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v11 = a4;
  v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample&>(a1, v4, v6);
      v6 += 80;
      v4 = v12 + 80;
      v12 += 80;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2083FB294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = *(_DWORD *)a3;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>((_QWORD *)(a2 + 8), *(const void **)(a3 + 8), *(_QWORD *)(a3 + 16), (uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 2);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>((char *)(a2 + 32), *(__int128 **)(a3 + 32), *(__int128 **)(a3 + 40), (uint64_t)(*(_QWORD *)(a3 + 40) - *(_QWORD *)(a3 + 32)) >> 4);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)(a2 + 56), *(const void **)(a3 + 56), *(_QWORD *)(a3 + 64), (uint64_t)(*(_QWORD *)(a3 + 64) - *(_QWORD *)(a3 + 56)) >> 3);
}

void sub_2083FB334(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 40) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 16) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2083FB3C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_2083FB434(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>::operator()[abi:ne180100](uint64_t *a1)
{
  _QWORD **v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = (_QWORD *)a1[1];
  v1 = (_QWORD **)a1[2];
  v3 = *v1;
  v4 = (_QWORD *)*v2;
  if (*v1 != (_QWORD *)*v2)
  {
    v5 = *a1;
    do
    {
      v3 -= 10;
      std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }
  v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }
  v5 = (void *)a2[1];
  if (v5)
  {
    a2[2] = v5;
    operator delete(v5);
  }
}

void std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 10;
        std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::unordered_map<std::string,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_2083FB67C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_2083FB8EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  *((_DWORD *)v8 + 10) = *(_DWORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2083FB99C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_2083FBA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2083FBB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

uint64_t std::unordered_map<unsigned int,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned int *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned int **)(a2 + 16); i; i = *(unsigned int **)i)
    std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,int> const&>(a1, i + 4, (_QWORD *)i + 2);
  return a1;
}

void sub_2083FBCA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,int> const&>(uint64_t a1, unsigned int *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_2083FBEC0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

_QWORD *std::vector<ME_Efficient_Model_Trainer::ME_Feature>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::ME_Feature*,ME_Efficient_Model_Trainer::ME_Feature*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2083FBF78(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2083FBFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 2);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_2083FC0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 24);
      v3 -= 24;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 16) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_2083FC2E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_2083FC3F4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x18uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_2083FC824(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

__n128 std::vector<double>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

_QWORD *std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = *(_QWORD **)(a1 + 8);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v3, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  *(_QWORD *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_2083FCA3C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_2083FCB44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<int>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t std::vector<ME_Efficient_Model_Trainer::Sample>::__push_back_slow_path<ME_Efficient_Model_Trainer::Sample const&>(uint64_t *a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  v4 = v3 + 1;
  if (v3 + 1 > 0x333333333333333)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  if (0x999999999999999ALL * ((a1[2] - *a1) >> 4) > v4)
    v4 = 0x999999999999999ALL * ((a1[2] - *a1) >> 4);
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 4) >= 0x199999999999999)
    v6 = 0x333333333333333;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>>((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = &v7[80 * v3];
  v13 = &v7[80 * v6];
  std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  v12 = v11 + 80;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__swap_out_circular_buffer(a1, &v10);
  v8 = a1[1];
  std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::~__split_buffer(&v10);
  return v8;
}

void sub_2083FCE68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = *(_DWORD *)a3;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>((_QWORD *)(a2 + 8), *(const void **)(a3 + 8), *(_QWORD *)(a3 + 16), (uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 2);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>((char *)(a2 + 32), *(__int128 **)(a3 + 32), *(__int128 **)(a3 + 40), (uint64_t)(*(_QWORD *)(a3 + 40) - *(_QWORD *)(a3 + 32)) >> 4);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)(a2 + 56), *(const void **)(a3 + 56), *(_QWORD *)(a3 + 64), (uint64_t)(*(_QWORD *)(a3 + 64) - *(_QWORD *)(a3 + 56)) >> 3);
}

void sub_2083FCF08(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 40) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 16) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<ME_Efficient_Model_Trainer::Sample>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  v14 = 0;
  if (a3 == a5)
  {
    v11 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 -= 80;
      std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample>(a1, v7 - 80, v9);
      v7 = *((_QWORD *)&v16 + 1) - 80;
      *((_QWORD *)&v16 + 1) -= 80;
    }
    while (v9 != a5);
    v11 = v16;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

__n128 std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;

  *(_DWORD *)a2 = *(_DWORD *)a3;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a3 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a3 + 24);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a3 + 32);
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 40) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  result = *(__n128 *)(a3 + 56);
  *(__n128 *)(a2 + 56) = result;
  *(_QWORD *)(a2 + 72) = *(_QWORD *)(a3 + 72);
  *(_QWORD *)(a3 + 56) = 0;
  *(_QWORD *)(a3 + 64) = 0;
  *(_QWORD *)(a3 + 72) = 0;
  return result;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>::operator()[abi:ne180100](uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD **)(a1[2] + 8);
  v2 = *(_QWORD **)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](v3, v1);
      v1 += 10;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::~__split_buffer(void **a1)
{
  std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 80;
    std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](v4, (_QWORD *)(i - 80));
  }
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,false>(std::vector<int> *a1, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  std::vector<int> *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::vector<int> *v15;
  uint64_t v16;
  std::vector<int> *v17;
  std::vector<int> *v18;
  std::vector<int> *v19;
  std::__compressed_pair<int *> *v20;
  char v21;
  BOOL v22;

LABEL_1:
  v9 = a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)v9) >> 4);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)(a2 - 20), (uint64_t)v9))
          std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v9, (uint64_t)(a2 - 20));
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v9, (std::vector<int> *)((char *)v9 + 80), (uint64_t)(a2 - 20));
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v9, (std::vector<int> *)((char *)v9 + 80), (std::vector<int> *)((char *)v9 + 160), (uint64_t)(a2 - 20));
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v9, (std::vector<int> *)((char *)v9 + 80), (std::vector<int> *)((char *)v9 + 160), v9 + 10, (uint64_t)(a2 - 20));
        return;
      default:
        if (v12 <= 1919)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((uint64_t)v9, a2);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((uint64_t)v9, (unsigned __int32 *)a2);
          return;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = (std::vector<int> *)((char *)v9 + 80 * (v13 >> 1));
          if ((unint64_t)v12 < 0x2801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v15, v9, (uint64_t)(a2 - 20));
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v9, v15, (uint64_t)(a2 - 20));
            v16 = 5 * v14;
            v17 = (std::vector<int> *)((char *)v9 + 80 * v14 - 80);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((std::vector<int> *)((char *)v9 + 80), v17, (uint64_t)(a2 - 40));
            v18 = (std::vector<int> *)((char *)v9 + 160);
            v19 = (std::vector<int> *)((char *)v9 + 16 * v16 + 80);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v18, v19, (uint64_t)(a2 - 60));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(v17, v15, (uint64_t)v19);
            std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, (uint64_t)v15);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&a1[-4].__end_cap_, (uint64_t)a1) & 1) == 0)
          {
            v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>((std::__compressed_pair<int *> *)a1, (unint64_t)a2);
            goto LABEL_16;
          }
LABEL_11:
          v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>((std::__compressed_pair<int *> *)a1, (unint64_t)a2);
          if ((v21 & 1) == 0)
            goto LABEL_14;
          v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((uint64_t)a1, (uint64_t)v20);
          v9 = (std::vector<int> *)&v20[10];
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((uint64_t)&v20[10], (uint64_t)a2))
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,false>(a1, v20, a3, -v11, a5 & 1);
            v9 = (std::vector<int> *)&v20[10];
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = (int *)v20;
          if (v22)
            return;
          goto LABEL_1;
        }
        if (v9 != (std::vector<int> *)a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,ME_Efficient_Model_Trainer::Sample *>((uint64_t)v9, (uint64_t)a2, (std::vector<int> *)a2, a3);
        return;
    }
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28[2];
  uint64_t v29;
  void *__p[2];
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if ((int *)a1 != a2)
  {
    v34 = v2;
    v35 = v3;
    v6 = a1 + 80;
    if ((int *)(a1 + 80) != a2)
    {
      v7 = 0;
      v8 = a1;
      do
      {
        v9 = (int *)v6;
        if (ME_Efficient_Model_Trainer::Sample::operator<(v6, v8))
        {
          v27 = *v9;
          *(_OWORD *)v28 = *(_OWORD *)(v8 + 88);
          v29 = *(_QWORD *)(v8 + 104);
          *(_QWORD *)(v8 + 88) = 0;
          *(_QWORD *)(v8 + 96) = 0;
          *(_OWORD *)__p = *(_OWORD *)(v8 + 112);
          v31 = *(_QWORD *)(v8 + 128);
          *(_QWORD *)(v8 + 104) = 0;
          *(_QWORD *)(v8 + 112) = 0;
          *(_QWORD *)(v8 + 120) = 0;
          *(_QWORD *)(v8 + 128) = 0;
          v32 = *(_OWORD *)(v8 + 136);
          v33 = *(_QWORD *)(v8 + 152);
          *(_QWORD *)(v8 + 136) = 0;
          *(_QWORD *)(v8 + 144) = 0;
          v10 = v7;
          *(_QWORD *)(v8 + 152) = 0;
          while (1)
          {
            v11 = a1 + v10;
            *(_DWORD *)(a1 + v10 + 80) = *(_DWORD *)(a1 + v10);
            std::vector<double>::__move_assign(a1 + v10 + 88, (__n128 *)(a1 + v10 + 8));
            std::vector<double>::__move_assign(v11 + 112, (__n128 *)(v11 + 32));
            std::vector<double>::__move_assign(v11 + 136, (__n128 *)(v11 + 56));
            if (!v10)
              break;
            v10 -= 80;
            if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&v27, v10 + a1) & 1) == 0)
            {
              v12 = a1 + v10 + 80;
              goto LABEL_10;
            }
          }
          v12 = a1;
LABEL_10:
          *(_DWORD *)v12 = v27;
          v15 = *(void **)(v11 + 8);
          v14 = (_QWORD *)(v11 + 8);
          v13 = v15;
          if (v15)
          {
            *(_QWORD *)(v12 + 16) = v13;
            operator delete(v13);
            *v14 = 0;
            v14[1] = 0;
            v14[2] = 0;
          }
          v16 = v14 + 3;
          v17 = v28[1];
          *v14 = v28[0];
          v18 = v29;
          *(_QWORD *)(v12 + 16) = v17;
          *(_QWORD *)(v12 + 24) = v18;
          v28[1] = 0;
          v29 = 0;
          v28[0] = 0;
          v19 = (void *)v14[3];
          if (v19)
          {
            *(_QWORD *)(v12 + 40) = v19;
            operator delete(v19);
            *v16 = 0;
            v14[4] = 0;
            v14[5] = 0;
          }
          v20 = __p[1];
          *v16 = __p[0];
          v21 = v31;
          *(_QWORD *)(v12 + 40) = v20;
          *(_QWORD *)(v12 + 48) = v21;
          __p[1] = 0;
          v31 = 0;
          __p[0] = 0;
          v24 = (void *)v14[6];
          v23 = v14 + 6;
          v22 = v24;
          if (v24)
          {
            *(_QWORD *)(v12 + 64) = v22;
            operator delete(v22);
            *v23 = 0;
            v23[1] = 0;
            v23[2] = 0;
            v22 = __p[0];
          }
          v25 = *((_QWORD *)&v32 + 1);
          *v23 = v32;
          v26 = v33;
          *(_QWORD *)(v12 + 64) = v25;
          *(_QWORD *)(v12 + 72) = v26;
          v33 = 0;
          v32 = 0uLL;
          if (v22)
          {
            __p[1] = v22;
            operator delete(v22);
          }
          if (v28[0])
          {
            v28[1] = v28[0];
            operator delete(v28[0]);
          }
        }
        v6 = (uint64_t)(v9 + 20);
        v7 += 80;
        v8 = (uint64_t)v9;
      }
      while (v9 + 20 != a2);
    }
  }
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, unsigned __int32 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __n128 *v7;
  unsigned __int32 *v8;
  __n128 *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int32 v14;
  void *v15[2];
  unint64_t v16;
  void *__p[2];
  unint64_t v18;
  __n128 v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((unsigned __int32 *)a1 != a2)
  {
    v21 = v2;
    v22 = v3;
    v5 = a1;
    v6 = a1 + 80;
    if ((unsigned __int32 *)(a1 + 80) != a2)
    {
      v7 = (__n128 *)(a1 + 152);
      do
      {
        v8 = (unsigned __int32 *)v6;
        if (ME_Efficient_Model_Trainer::Sample::operator<(v6, v5))
        {
          v14 = *v8;
          *(_OWORD *)v15 = *(_OWORD *)(v5 + 88);
          v16 = *(_QWORD *)(v5 + 104);
          *(_QWORD *)(v5 + 88) = 0;
          *(_QWORD *)(v5 + 96) = 0;
          *(_OWORD *)__p = *(_OWORD *)(v5 + 112);
          v18 = *(_QWORD *)(v5 + 128);
          *(_QWORD *)(v5 + 104) = 0;
          *(_QWORD *)(v5 + 112) = 0;
          *(_QWORD *)(v5 + 120) = 0;
          *(_QWORD *)(v5 + 128) = 0;
          v19 = *(__n128 *)(v5 + 136);
          v20 = *(_QWORD *)(v5 + 152);
          *(_QWORD *)(v5 + 136) = 0;
          *(_QWORD *)(v5 + 144) = 0;
          v9 = v7;
          *(_QWORD *)(v5 + 152) = 0;
          do
          {
            v9[-5].n128_u32[2] = v9[-10].n128_u32[2];
            std::vector<double>::__move_assign((uint64_t)&v9[-4], v9 - 9);
            std::vector<double>::__move_assign((uint64_t)&v9[-3].n128_i64[1], (__n128 *)((char *)v9 - 120));
            std::vector<double>::__move_assign((uint64_t)&v9[-1], v9 - 6);
            v10 = ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&v14, (uint64_t)&v9[-15].n128_i64[1]);
            v9 -= 5;
          }
          while ((v10 & 1) != 0);
          v11 = (void *)v9[-4].n128_u64[0];
          v9[-5].n128_u32[2] = v14;
          if (v11)
          {
            v9[-4].n128_u64[1] = (unint64_t)v11;
            operator delete(v11);
            v9[-4].n128_u64[0] = 0;
            v9[-4].n128_u64[1] = 0;
            v9[-3].n128_u64[0] = 0;
          }
          v9[-4] = *(__n128 *)v15;
          v9[-3].n128_u64[0] = v16;
          v15[1] = 0;
          v16 = 0;
          v15[0] = 0;
          v12 = (void *)v9[-3].n128_u64[1];
          if (v12)
          {
            v9[-2].n128_u64[0] = (unint64_t)v12;
            operator delete(v12);
            v9[-3].n128_u64[1] = 0;
            v9[-2].n128_u64[0] = 0;
            v9[-2].n128_u64[1] = 0;
          }
          *(__n128 *)((char *)v9 - 40) = *(__n128 *)__p;
          v9[-2].n128_u64[1] = v18;
          __p[1] = 0;
          v18 = 0;
          __p[0] = 0;
          v13 = (void *)v9[-1].n128_u64[0];
          if (v13)
          {
            v9[-1].n128_u64[1] = (unint64_t)v13;
            operator delete(v13);
            v9[-1].n128_u64[0] = 0;
            v9[-1].n128_u64[1] = 0;
            v9->n128_u64[0] = 0;
            v13 = __p[0];
          }
          v9[-1] = v19;
          v9->n128_u64[0] = v20;
          v20 = 0;
          v19 = 0uLL;
          if (v13)
          {
            __p[1] = v13;
            operator delete(v13);
          }
          if (v15[0])
          {
            v15[1] = v15[0];
            operator delete(v15[0]);
          }
        }
        v6 = (uint64_t)(v8 + 20);
        v7 += 5;
        v5 = (uint64_t)v8;
      }
      while (v8 + 20 != a2);
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(std::vector<int> *a1, std::vector<int> *a2, uint64_t a3)
{
  char v6;
  uint64_t result;
  std::vector<int> *v8;
  uint64_t v9;

  v6 = ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a2, (uint64_t)a1);
  result = ME_Efficient_Model_Trainer::Sample::operator<(a3, (uint64_t)a2);
  if ((v6 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a2, a3);
    if (!ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a2, (uint64_t)a1))
      return 1;
    v8 = a1;
    v9 = (uint64_t)a2;
    goto LABEL_9;
  }
  if (!(_DWORD)result)
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, (uint64_t)a2);
    if (!ME_Efficient_Model_Trainer::Sample::operator<(a3, (uint64_t)a2))
      return 1;
    v8 = a2;
    v9 = a3;
LABEL_9:
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v8, v9);
    return 2;
  }
  std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, a3);
  return 1;
}

std::vector<int> *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>(std::__compressed_pair<int *> *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::vector<int> *v7;
  unint64_t p_end;
  int v9;
  int *begin;
  int *v11;
  int *v12;
  int value;
  void *v15[2];
  int *v16;
  void *__p[2];
  int *v18;
  __int128 v19;
  int *v20;

  v2 = a2;
  value = (int)a1->__value_;
  v4 = (uint64_t)&a1[1];
  *(_OWORD *)v15 = *(_OWORD *)&a1[1].__value_;
  v16 = a1[3].__value_;
  a1[1].__value_ = 0;
  a1[2].__value_ = 0;
  a1[3].__value_ = 0;
  v5 = (uint64_t)&a1[4];
  *(_OWORD *)__p = *(_OWORD *)&a1[4].__value_;
  v18 = a1[6].__value_;
  a1[4].__value_ = 0;
  a1[5].__value_ = 0;
  a1[6].__value_ = 0;
  v6 = (uint64_t)&a1[7];
  v19 = *(_OWORD *)&a1[7].__value_;
  v20 = a1[9].__value_;
  a1[8].__value_ = 0;
  a1[9].__value_ = 0;
  a1[7].__value_ = 0;
  if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, a2 - 80) & 1) != 0)
  {
    v7 = (std::vector<int> *)a1;
    do
      v7 = (std::vector<int> *)((char *)v7 + 80);
    while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, (uint64_t)v7) & 1) == 0);
  }
  else
  {
    p_end = (unint64_t)&a1[10];
    do
    {
      v7 = (std::vector<int> *)p_end;
      if (p_end >= v2)
        break;
      v9 = ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, p_end);
      p_end = (unint64_t)&v7[3].__end_;
    }
    while (!v9);
  }
  if ((unint64_t)v7 < v2)
  {
    do
      v2 -= 80;
    while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }
  while ((unint64_t)v7 < v2)
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v7, v2);
    do
      v7 = (std::vector<int> *)((char *)v7 + 80);
    while (!ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, (uint64_t)v7));
    do
      v2 -= 80;
    while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }
  if (&v7[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v7[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v4, (__n128 *)&v7[-3]);
    std::vector<double>::__move_assign(v5, (__n128 *)&v7[-2]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v7[-1]);
  }
  begin = v7[-3].__begin_;
  LODWORD(v7[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v7[-3].__end_ = begin;
    operator delete(begin);
    v7[-3].__begin_ = 0;
    v7[-3].__end_ = 0;
    v7[-3].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-3].__begin_ = *(_OWORD *)v15;
  v7[-3].__end_cap_.__value_ = v16;
  v15[0] = 0;
  v15[1] = 0;
  v16 = 0;
  v11 = v7[-2].__begin_;
  if (v11)
  {
    v7[-2].__end_ = v11;
    operator delete(v11);
    v7[-2].__begin_ = 0;
    v7[-2].__end_ = 0;
    v7[-2].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-2].__begin_ = *(_OWORD *)__p;
  v7[-2].__end_cap_.__value_ = v18;
  __p[0] = 0;
  __p[1] = 0;
  v18 = 0;
  v12 = v7[-1].__begin_;
  if (v12)
  {
    v7[-1].__end_ = v12;
    operator delete(v12);
    v7[-1].__begin_ = 0;
    v7[-1].__end_ = 0;
    v7[-1].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-1].__begin_ = v19;
  v7[-1].__end_cap_.__value_ = v20;
  v19 = 0uLL;
  v20 = 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v15[0])
  {
    v15[1] = v15[0];
    operator delete(v15[0]);
  }
  return v7;
}

std::__compressed_pair<int *> *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>(std::__compressed_pair<int *> *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  std::vector<int> *v9;
  unint64_t v10;
  int *begin;
  int *v12;
  int *v13;
  int value;
  void *v16[2];
  int *v17;
  void *__p[2];
  int *v19;
  __int128 v20;
  int *v21;

  v4 = 0;
  value = (int)a1->__value_;
  v5 = (uint64_t)&a1[1];
  *(_OWORD *)v16 = *(_OWORD *)&a1[1].__value_;
  v17 = a1[3].__value_;
  a1[1].__value_ = 0;
  a1[2].__value_ = 0;
  a1[3].__value_ = 0;
  v6 = (uint64_t)&a1[4];
  *(_OWORD *)__p = *(_OWORD *)&a1[4].__value_;
  v19 = a1[6].__value_;
  a1[4].__value_ = 0;
  a1[5].__value_ = 0;
  a1[6].__value_ = 0;
  v21 = a1[9].__value_;
  v7 = (uint64_t)&a1[7];
  v20 = *(_OWORD *)&a1[7].__value_;
  a1[8].__value_ = 0;
  a1[9].__value_ = 0;
  a1[7].__value_ = 0;
  do
    v4 += 10;
  while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&a1[v4], (uint64_t)&value) & 1) != 0);
  v8 = (unint64_t)&a1[v4];
  if (v4 == 10)
  {
    do
    {
      if (v8 >= a2)
        break;
      a2 -= 80;
    }
    while ((ME_Efficient_Model_Trainer::Sample::operator<(a2, (uint64_t)&value) & 1) == 0);
  }
  else
  {
    do
      a2 -= 80;
    while (!ME_Efficient_Model_Trainer::Sample::operator<(a2, (uint64_t)&value));
  }
  v9 = (std::vector<int> *)&a1[v4];
  if (v8 < a2)
  {
    v10 = a2;
    do
    {
      std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v9, v10);
      do
        v9 = (std::vector<int> *)((char *)v9 + 80);
      while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)v9, (uint64_t)&value) & 1) != 0);
      do
        v10 -= 80;
      while (!ME_Efficient_Model_Trainer::Sample::operator<(v10, (uint64_t)&value));
    }
    while ((unint64_t)v9 < v10);
  }
  if (&v9[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v9[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v5, (__n128 *)&v9[-3]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v9[-2]);
    std::vector<double>::__move_assign(v7, (__n128 *)&v9[-1]);
  }
  begin = v9[-3].__begin_;
  LODWORD(v9[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v9[-3].__end_ = begin;
    operator delete(begin);
    v9[-3].__begin_ = 0;
    v9[-3].__end_ = 0;
    v9[-3].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-3].__begin_ = *(_OWORD *)v16;
  v9[-3].__end_cap_.__value_ = v17;
  v16[0] = 0;
  v16[1] = 0;
  v17 = 0;
  v12 = v9[-2].__begin_;
  if (v12)
  {
    v9[-2].__end_ = v12;
    operator delete(v12);
    v9[-2].__begin_ = 0;
    v9[-2].__end_ = 0;
    v9[-2].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-2].__begin_ = *(_OWORD *)__p;
  v9[-2].__end_cap_.__value_ = v19;
  __p[0] = 0;
  __p[1] = 0;
  v19 = 0;
  v13 = v9[-1].__begin_;
  if (v13)
  {
    v9[-1].__end_ = v13;
    operator delete(v13);
    v9[-1].__begin_ = 0;
    v9[-1].__end_ = 0;
    v9[-1].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-1].__begin_ = v20;
  v9[-1].__end_cap_.__value_ = v21;
  v20 = 0uLL;
  v21 = 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }
  return &v9[-4].__end_cap_;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29[2];
  uint64_t v30;
  void *__p[2];
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 4);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = a2 - 80;
      if (ME_Efficient_Model_Trainer::Sample::operator<(a2 - 80, a1))
        std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>((std::vector<int> *)a1, v6);
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), a2 - 80);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), (std::vector<int> *)(a1 + 160), a2 - 80);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), (std::vector<int> *)(a1 + 160), (std::vector<int> *)(a1 + 240), a2 - 80);
      return 1;
    default:
      v7 = a1 + 160;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), a1 + 160);
      v8 = a1 + 240;
      if (a1 + 240 == a2)
        return 1;
      v9 = 0;
      v10 = 0;
      break;
  }
  while (1)
  {
    if (ME_Efficient_Model_Trainer::Sample::operator<(v8, v7))
    {
      v28 = *(_DWORD *)v8;
      *(_OWORD *)v29 = *(_OWORD *)(v8 + 8);
      v30 = *(_QWORD *)(v8 + 24);
      *(_QWORD *)(v8 + 8) = 0;
      *(_QWORD *)(v8 + 16) = 0;
      *(_OWORD *)__p = *(_OWORD *)(v8 + 32);
      v32 = *(_QWORD *)(v8 + 48);
      *(_QWORD *)(v8 + 24) = 0;
      *(_QWORD *)(v8 + 32) = 0;
      *(_QWORD *)(v8 + 40) = 0;
      *(_QWORD *)(v8 + 48) = 0;
      v33 = *(_OWORD *)(v8 + 56);
      v34 = *(_QWORD *)(v8 + 72);
      *(_QWORD *)(v8 + 64) = 0;
      *(_QWORD *)(v8 + 72) = 0;
      v11 = v9;
      *(_QWORD *)(v8 + 56) = 0;
      while (1)
      {
        v12 = a1 + v11;
        *(_DWORD *)(a1 + v11 + 240) = *(_DWORD *)(a1 + v11 + 160);
        std::vector<double>::__move_assign(a1 + v11 + 248, (__n128 *)(a1 + v11 + 168));
        std::vector<double>::__move_assign(v12 + 272, (__n128 *)(v12 + 192));
        std::vector<double>::__move_assign(v12 + 296, (__n128 *)(v12 + 216));
        if (v11 == -160)
          break;
        v11 -= 80;
        if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&v28, v12 + 80) & 1) == 0)
        {
          v13 = a1 + v11 + 240;
          goto LABEL_12;
        }
      }
      v13 = a1;
LABEL_12:
      *(_DWORD *)v13 = v28;
      v16 = *(void **)(v12 + 168);
      v15 = (_QWORD *)(v12 + 168);
      v14 = v16;
      if (v16)
      {
        *(_QWORD *)(v13 + 16) = v14;
        operator delete(v14);
        *v15 = 0;
        v15[1] = 0;
        v15[2] = 0;
      }
      v17 = v15 + 3;
      v18 = v29[1];
      *v15 = v29[0];
      v19 = v30;
      *(_QWORD *)(v13 + 16) = v18;
      *(_QWORD *)(v13 + 24) = v19;
      v29[1] = 0;
      v30 = 0;
      v29[0] = 0;
      v20 = (void *)v15[3];
      if (v20)
      {
        *(_QWORD *)(v13 + 40) = v20;
        operator delete(v20);
        *v17 = 0;
        v15[4] = 0;
        v15[5] = 0;
      }
      v21 = __p[1];
      *v17 = __p[0];
      v22 = v32;
      *(_QWORD *)(v13 + 40) = v21;
      *(_QWORD *)(v13 + 48) = v22;
      __p[1] = 0;
      v32 = 0;
      __p[0] = 0;
      v25 = (void *)v15[6];
      v24 = v15 + 6;
      v23 = v25;
      if (v25)
      {
        *(_QWORD *)(v13 + 64) = v23;
        operator delete(v23);
        *v24 = 0;
        v24[1] = 0;
        v24[2] = 0;
        v23 = __p[0];
      }
      v26 = *((_QWORD *)&v33 + 1);
      *v24 = v33;
      v27 = v34;
      *(_QWORD *)(v13 + 64) = v26;
      *(_QWORD *)(v13 + 72) = v27;
      v34 = 0;
      v33 = 0uLL;
      if (v23)
      {
        __p[1] = v23;
        operator delete(v23);
      }
      if (v29[0])
      {
        v29[1] = v29[0];
        operator delete(v29[0]);
      }
      if (++v10 == 8)
        return v8 + 80 == a2;
    }
    v7 = v8;
    v9 += 80;
    v8 += 80;
    if (v8 == a2)
      return 1;
  }
}

uint64_t ME_Efficient_Model_Trainer::Sample::operator<(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16) - v2;
  if (v3)
  {
    v4 = 0;
    v5 = v3 >> 2;
    v6 = *(_QWORD *)(a2 + 8);
    v7 = 1;
    while ((*(_QWORD *)(a2 + 16) - v6) >> 2 > v4)
    {
      v8 = *(_DWORD *)(v2 + 4 * v4);
      v9 = *(_DWORD *)(v6 + 4 * v4);
      if (v8 < v9)
        return 1;
      v4 = v7++;
      if (v8 > v9 || v5 <= v4)
        return 0;
    }
  }
  return 0;
}

__n128 std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(std::vector<int> *this, uint64_t a2)
{
  int begin;
  __int128 v4;
  std::vector<int>::pointer v5;
  std::vector<int>::pointer *p_end;
  std::vector<int>::pointer v7;
  std::vector<int>::pointer *v8;
  std::vector<int>::pointer v9;
  void *v10;
  void *v11;
  void *v12;
  __n128 result;
  __int128 v14;
  __int128 v15;
  __n128 v16;

  begin = (int)this->__begin_;
  v4 = *(_OWORD *)&this->__end_;
  v5 = this[1].__begin_;
  this->__end_ = 0;
  p_end = &this[1].__end_;
  v14 = v4;
  v15 = *(_OWORD *)&this[1].__end_;
  this[1].__end_ = 0;
  this->__end_cap_.__value_ = 0;
  this[1].__begin_ = 0;
  v7 = this[2].__begin_;
  this[1].__end_cap_.__value_ = 0;
  this[2].__begin_ = 0;
  v8 = &this[2].__end_;
  v16 = *(__n128 *)&this[2].__end_;
  v9 = this[3].__begin_;
  this[2].__end_ = 0;
  this[2].__end_cap_.__value_ = 0;
  this[3].__begin_ = 0;
  LODWORD(this->__begin_) = *(_DWORD *)a2;
  std::vector<double>::__move_assign((uint64_t)&this->__end_, (__n128 *)(a2 + 8));
  std::vector<double>::__move_assign((uint64_t)p_end, (__n128 *)(a2 + 32));
  std::vector<double>::__move_assign((uint64_t)v8, (__n128 *)(a2 + 56));
  *(_DWORD *)a2 = begin;
  v10 = *(void **)(a2 + 8);
  if (v10)
  {
    *(_QWORD *)(a2 + 16) = v10;
    operator delete(v10);
  }
  *(_OWORD *)(a2 + 8) = v14;
  *(_QWORD *)(a2 + 24) = v5;
  v11 = *(void **)(a2 + 32);
  if (v11)
  {
    *(_QWORD *)(a2 + 40) = v11;
    operator delete(v11);
  }
  *(_OWORD *)(a2 + 32) = v15;
  *(_QWORD *)(a2 + 48) = v7;
  v12 = *(void **)(a2 + 56);
  if (v12)
  {
    *(_QWORD *)(a2 + 64) = v12;
    operator delete(v12);
  }
  result = v16;
  *(__n128 *)(a2 + 56) = v16;
  *(_QWORD *)(a2 + 72) = v9;
  return result;
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, uint64_t a4)
{
  double result;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(a1, a2, (uint64_t)a3);
  if (ME_Efficient_Model_Trainer::Sample::operator<(a4, (uint64_t)a3))
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a3, a4);
    if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a3, (uint64_t)a2))
    {
      std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a2, (uint64_t)a3);
      if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a2, (uint64_t)a1))
        *(_QWORD *)&result = std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, (uint64_t)a2).n128_u64[0];
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, std::vector<int> *a4, uint64_t a5)
{
  double result;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(a1, a2, a3, (uint64_t)a4);
  if (ME_Efficient_Model_Trainer::Sample::operator<(a5, (uint64_t)a4))
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a4, a5);
    if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a4, (uint64_t)a3))
    {
      std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a3, (uint64_t)a4);
      if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a3, (uint64_t)a2))
      {
        std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a2, (uint64_t)a3);
        if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a2, (uint64_t)a1))
          *(_QWORD *)&result = std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, (uint64_t)a2).n128_u64[0];
      }
    }
  }
  return result;
}

std::vector<int> *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, uint64_t a2, std::vector<int> *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::vector<int> *v14;
  unint64_t v15;

  if (a1 != a2)
  {
    v6 = a2;
    v8 = a2 - a1;
    v9 = (a2 - a1) / 80;
    if (a2 - a1 >= 81)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = a1 + 80 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(a1, a4, v9, v12);
        v12 -= 80;
        --v11;
      }
      while (v11);
    }
    v13 = v6;
    if ((std::vector<int> *)v6 != a3)
    {
      v14 = (std::vector<int> *)v6;
      do
      {
        if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)v14, a1))
        {
          std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v14, a1);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(a1, a4, v9, a1);
        }
        v14 = (std::vector<int> *)((char *)v14 + 80);
      }
      while (v14 != a3);
      v13 = (uint64_t)a3;
    }
    if (v8 >= 81)
    {
      v15 = v8 / 0x50uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Efficient_Model_Trainer::Sample *>(a1, v6, a4, v15);
        v6 -= 80;
      }
      while (v15-- > 2);
    }
    return (std::vector<int> *)v13;
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  int v21;
  void *v22[2];
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v28 = v4;
    v29 = v5;
    v7 = a4;
    v20 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((a4 - a1) >> 4)))
    {
      v10 = (0x999999999999999ALL * ((a4 - a1) >> 4)) | 1;
      v11 = a1 + 80 * v10;
      v12 = 0x999999999999999ALL * ((a4 - a1) >> 4) + 2;
      if (v12 < a3 && ME_Efficient_Model_Trainer::Sample::operator<(a1 + 80 * v10, v11 + 80))
      {
        v11 += 80;
        v10 = v12;
      }
      if ((ME_Efficient_Model_Trainer::Sample::operator<(v11, v7) & 1) == 0)
      {
        v21 = *(_DWORD *)v7;
        *(_OWORD *)v22 = *(_OWORD *)(v7 + 8);
        v23 = *(_QWORD *)(v7 + 24);
        *(_QWORD *)(v7 + 8) = 0;
        *(_QWORD *)(v7 + 16) = 0;
        *(_OWORD *)__p = *(_OWORD *)(v7 + 32);
        v25 = *(_QWORD *)(v7 + 48);
        *(_QWORD *)(v7 + 24) = 0;
        *(_QWORD *)(v7 + 32) = 0;
        *(_QWORD *)(v7 + 40) = 0;
        *(_QWORD *)(v7 + 48) = 0;
        v26 = *(_OWORD *)(v7 + 56);
        v27 = *(_QWORD *)(v7 + 72);
        *(_QWORD *)(v7 + 64) = 0;
        *(_QWORD *)(v7 + 72) = 0;
        *(_QWORD *)(v7 + 56) = 0;
        do
        {
          v13 = v11;
          v14 = (_QWORD *)(v11 + 56);
          *(_DWORD *)v7 = *(_DWORD *)v11;
          std::vector<double>::__move_assign(v7 + 8, (__n128 *)(v11 + 8));
          std::vector<double>::__move_assign(v7 + 32, (__n128 *)(v11 + 32));
          std::vector<double>::__move_assign(v7 + 56, (__n128 *)(v11 + 56));
          if (v20 < v10)
            break;
          v15 = (2 * v10) | 1;
          v11 = a1 + 80 * v15;
          v16 = 2 * v10 + 2;
          if (v16 < a3 && ME_Efficient_Model_Trainer::Sample::operator<(a1 + 80 * v15, v11 + 80))
          {
            v11 += 80;
            v15 = v16;
          }
          v7 = v13;
          v10 = v15;
        }
        while (!ME_Efficient_Model_Trainer::Sample::operator<(v11, (uint64_t)&v21));
        *(_DWORD *)v13 = v21;
        v17 = *(void **)(v13 + 8);
        if (v17)
        {
          *(_QWORD *)(v13 + 16) = v17;
          operator delete(v17);
          *(_QWORD *)(v13 + 8) = 0;
          *(_QWORD *)(v13 + 16) = 0;
          *(_QWORD *)(v13 + 24) = 0;
        }
        *(_OWORD *)(v13 + 8) = *(_OWORD *)v22;
        *(_QWORD *)(v13 + 24) = v23;
        v22[0] = 0;
        v22[1] = 0;
        v23 = 0;
        v18 = *(void **)(v13 + 32);
        if (v18)
        {
          *(_QWORD *)(v13 + 40) = v18;
          operator delete(v18);
          *(_QWORD *)(v13 + 32) = 0;
          *(_QWORD *)(v13 + 40) = 0;
          *(_QWORD *)(v13 + 48) = 0;
        }
        *(_OWORD *)(v13 + 32) = *(_OWORD *)__p;
        *(_QWORD *)(v13 + 48) = v25;
        __p[0] = 0;
        __p[1] = 0;
        v25 = 0;
        v19 = *(void **)(v13 + 56);
        if (v19)
        {
          *(_QWORD *)(v13 + 64) = v19;
          operator delete(v19);
          *v14 = 0;
          v14[1] = 0;
          v14[2] = 0;
          v19 = __p[0];
        }
        *(_OWORD *)(v13 + 56) = v26;
        *(_QWORD *)(v13 + 72) = v27;
        v26 = 0uLL;
        v27 = 0;
        if (v19)
        {
          __p[1] = v19;
          operator delete(v19);
        }
        if (v22[0])
        {
          v22[1] = v22[0];
          operator delete(v22[0]);
        }
      }
    }
  }
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a4 >= 2)
  {
    v7 = *(_DWORD *)a1;
    v8 = *(_QWORD *)(a1 + 16);
    v25 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    v10 = *(_QWORD *)(a1 + 24);
    v9 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    v28 = v9;
    v26 = *(_QWORD *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 72) = 0;
    v14 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>((_DWORD *)a1, a3, a4);
    v15 = (_QWORD *)v14;
    if (v14 == a2 - 80)
    {
      *(_DWORD *)v14 = v7;
      v21 = (_QWORD *)(v14 + 8);
      v20 = *(void **)(v14 + 8);
      if (v20)
      {
        v15[2] = v20;
        operator delete(v20);
        *v21 = 0;
        v15[2] = 0;
        v15[3] = 0;
      }
      v22 = (void *)v15[4];
      v15[1] = v25;
      v15[2] = v8;
      v15[3] = v10;
      if (v22)
      {
        v15[5] = v22;
        operator delete(v22);
        v15[4] = 0;
        v15[5] = 0;
        v15[6] = 0;
      }
      v23 = (void *)v15[7];
      v15[4] = v28;
      v15[5] = v27;
      v15[6] = v26;
      if (v23)
      {
        v15[8] = v23;
        operator delete(v23);
        v15[7] = 0;
        v15[8] = 0;
        v15[9] = 0;
      }
      v15[7] = v11;
      v15[8] = v12;
      v15[9] = v13;
    }
    else
    {
      v24 = v11;
      *(_DWORD *)v14 = *(_DWORD *)(a2 - 80);
      v16 = v14 + 80;
      std::vector<double>::__move_assign(v14 + 8, (__n128 *)(a2 - 72));
      std::vector<double>::__move_assign((uint64_t)(v15 + 4), (__n128 *)(a2 - 48));
      std::vector<double>::__move_assign((uint64_t)(v15 + 7), (__n128 *)(a2 - 24));
      *(_DWORD *)(a2 - 80) = v7;
      v17 = *(void **)(a2 - 72);
      if (v17)
      {
        *(_QWORD *)(a2 - 64) = v17;
        operator delete(v17);
        *(_QWORD *)(a2 - 72) = 0;
        *(_QWORD *)(a2 - 64) = 0;
        *(_QWORD *)(a2 - 56) = 0;
      }
      *(_QWORD *)(a2 - 72) = v25;
      *(_QWORD *)(a2 - 64) = v8;
      *(_QWORD *)(a2 - 56) = v10;
      v18 = *(void **)(a2 - 48);
      if (v18)
      {
        *(_QWORD *)(a2 - 40) = v18;
        operator delete(v18);
        *(_QWORD *)(a2 - 48) = 0;
        *(_QWORD *)(a2 - 40) = 0;
        *(_QWORD *)(a2 - 32) = 0;
      }
      *(_QWORD *)(a2 - 48) = v28;
      *(_QWORD *)(a2 - 40) = v27;
      *(_QWORD *)(a2 - 32) = v26;
      v19 = *(void **)(a2 - 24);
      if (v19)
      {
        *(_QWORD *)(a2 - 16) = v19;
        operator delete(v19);
        *(_QWORD *)(a2 - 24) = 0;
        *(_QWORD *)(a2 - 16) = 0;
        *(_QWORD *)(a2 - 8) = 0;
      }
      *(_QWORD *)(a2 - 24) = v24;
      *(_QWORD *)(a2 - 16) = v12;
      *(_QWORD *)(a2 - 8) = v13;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(a1, v16, a3, 0xCCCCCCCCCCCCCCCDLL * ((v16 - a1) >> 4));
    }
  }
}

void sub_2083FEA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  ME_Efficient_Model_Trainer::Sample::~Sample((ME_Efficient_Model_Trainer::Sample *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = (uint64_t)&a1[20 * v5 + 20];
    v9 = (2 * v5) | 1;
    v10 = 2 * v5 + 2;
    if (v10 < a3
      && ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&a1[20 * v5 + 20], (uint64_t)&a1[20 * v5 + 40]))
    {
      v8 += 80;
      v9 = v10;
    }
    *a1 = *(_DWORD *)v8;
    std::vector<double>::__move_assign((uint64_t)(a1 + 2), (__n128 *)(v8 + 8));
    std::vector<double>::__move_assign((uint64_t)(a1 + 8), (__n128 *)(v8 + 32));
    std::vector<double>::__move_assign((uint64_t)(a1 + 14), (__n128 *)(v8 + 56));
    a1 = (_DWORD *)v8;
    v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18[2];
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a4 >= 2)
  {
    v24 = v4;
    v25 = v5;
    v8 = (unint64_t)(a4 - 2) >> 1;
    v9 = a1 + 80 * v8;
    v10 = (_DWORD *)(a2 - 80);
    if (ME_Efficient_Model_Trainer::Sample::operator<(v9, a2 - 80))
    {
      v17 = *(_DWORD *)(a2 - 80);
      *(_OWORD *)v18 = *(_OWORD *)(a2 - 72);
      v19 = *(_QWORD *)(a2 - 56);
      *(_QWORD *)(a2 - 72) = 0;
      *(_QWORD *)(a2 - 64) = 0;
      *(_OWORD *)__p = *(_OWORD *)(a2 - 48);
      v21 = *(_QWORD *)(a2 - 32);
      *(_QWORD *)(a2 - 56) = 0;
      *(_QWORD *)(a2 - 48) = 0;
      *(_QWORD *)(a2 - 40) = 0;
      *(_QWORD *)(a2 - 32) = 0;
      v22 = *(_OWORD *)(a2 - 24);
      v23 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      *(_QWORD *)(a2 - 24) = 0;
      do
      {
        v11 = v9;
        v12 = (_QWORD *)(v9 + 56);
        *v10 = *(_DWORD *)v9;
        v13 = (_QWORD *)(v9 + 8);
        std::vector<double>::__move_assign((uint64_t)(v10 + 2), (__n128 *)(v9 + 8));
        std::vector<double>::__move_assign((uint64_t)(v10 + 8), (__n128 *)(v9 + 32));
        std::vector<double>::__move_assign((uint64_t)(v10 + 14), (__n128 *)(v9 + 56));
        if (!v8)
          break;
        v8 = (v8 - 1) >> 1;
        v9 = a1 + 80 * v8;
        v10 = (_DWORD *)v11;
      }
      while ((ME_Efficient_Model_Trainer::Sample::operator<(v9, (uint64_t)&v17) & 1) != 0);
      *(_DWORD *)v11 = v17;
      v14 = *(void **)(v11 + 8);
      if (v14)
      {
        *(_QWORD *)(v11 + 16) = v14;
        operator delete(v14);
        *v13 = 0;
        *(_QWORD *)(v11 + 16) = 0;
        *(_QWORD *)(v11 + 24) = 0;
      }
      *(_OWORD *)(v11 + 8) = *(_OWORD *)v18;
      *(_QWORD *)(v11 + 24) = v19;
      v18[1] = 0;
      v19 = 0;
      v18[0] = 0;
      v15 = *(void **)(v11 + 32);
      if (v15)
      {
        *(_QWORD *)(v11 + 40) = v15;
        operator delete(v15);
        *(_QWORD *)(v11 + 32) = 0;
        *(_QWORD *)(v11 + 40) = 0;
        *(_QWORD *)(v11 + 48) = 0;
      }
      *(_OWORD *)(v11 + 32) = *(_OWORD *)__p;
      *(_QWORD *)(v11 + 48) = v21;
      __p[1] = 0;
      v21 = 0;
      __p[0] = 0;
      v16 = *(void **)(v11 + 56);
      if (v16)
      {
        *(_QWORD *)(v11 + 64) = v16;
        operator delete(v16);
        *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
        v16 = __p[0];
      }
      *(_OWORD *)(v11 + 56) = v22;
      *(_QWORD *)(v11 + 72) = v23;
      v23 = 0;
      v22 = 0uLL;
      if (v16)
      {
        __p[1] = v16;
        operator delete(v16);
      }
      if (v18[0])
      {
        v18[1] = v18[0];
        operator delete(v18[0]);
      }
    }
  }
}

void std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

_QWORD *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C09D9E8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C09D9E8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1 + 8))(*a2, *a3, *a4);
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(uint64_t a1, uint64_t a2, unsigned __int8 **a3)
{
  uint64_t v3;
  char v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;

  v3 = a1;
  if (a1 != a2)
  {
    v5 = *((_BYTE *)a3 + 23);
    if (v5 >= 0)
      v6 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    else
      v6 = a3[1];
    if (v5 >= 0)
      v7 = (unsigned __int8 *)a3;
    else
      v7 = *a3;
    do
    {
      v8 = *(unsigned __int8 *)(v3 + 23);
      if ((v8 & 0x80u) == 0)
        v9 = (unsigned __int8 *)*(unsigned __int8 *)(v3 + 23);
      else
        v9 = *(unsigned __int8 **)(v3 + 8);
      if (v9 == v6)
      {
        if ((v8 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v3, v7, *(_QWORD *)(v3 + 8)))
            return v3;
        }
        else
        {
          if (!*(_BYTE *)(v3 + 23))
            return v3;
          v10 = 0;
          while (*(unsigned __int8 *)(v3 + v10) == v7[v10])
          {
            if (v8 == ++v10)
              return v3;
          }
        }
      }
      v3 += 24;
    }
    while (v3 != a2);
    return a2;
  }
  return v3;
}

_QWORD *maxent_model_create()
{
  _QWORD *v0;
  ME_Efficient_Model_Trainer *v1;

  v0 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
  if (v0)
  {
    v1 = (ME_Efficient_Model_Trainer *)operator new();
    ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer(v1);
    *v0 = v1;
  }
  return v0;
}

void sub_2083FEF7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD06848](v1, 0x10A0C401D2A67E6);
  _Unwind_Resume(a1);
}

void maxent_mutable_model_release(ME_Efficient_Model_Trainer **a1)
{
  ME_Efficient_Model_Trainer *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer(v2);
      MEMORY[0x20BD06848]();
    }
    free(a1);
  }
}

BOOL maxent_save_to_file(ME_Efficient_Model_Trainer **a1, char *a2)
{
  return maxent_save_to_file_with_threshold(a1, a2, 0.0);
}

BOOL maxent_save_to_file_with_threshold(ME_Efficient_Model_Trainer **a1, char *a2, double a3)
{
  ME_Efficient_Model_Trainer *v4;
  _BOOL8 v5;
  void *__p[2];
  char v8;

  if (!a1)
    return 0;
  v4 = *a1;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v5 = ME_Efficient_Model_Trainer::save_to_file(v4, (uint64_t)__p, a3);
  if (v8 < 0)
    operator delete(__p[0]);
  return v5;
}

void sub_2083FF05C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *maxent_set_heldout(uint64_t *result, int a2, int a3)
{
  uint64_t v3;

  if (result)
  {
    v3 = *result;
    *(_DWORD *)(v3 + 352) = a2;
    *(_DWORD *)(v3 + 356) = a3;
  }
  return result;
}

double maxent_use_default_SGD(uint64_t *a1)
{
  uint64_t v1;
  double result;

  if (a1)
  {
    v1 = *a1;
    *(_QWORD *)v1 = 0x1E00000002;
    result = 1.0;
    *(_OWORD *)(v1 + 8) = xmmword_208419780;
  }
  return result;
}

uint64_t *maxent_use_SGD(uint64_t *result, int a2, double a3, double a4)
{
  uint64_t v4;

  if (result)
  {
    v4 = *result;
    *(_DWORD *)v4 = 2;
    *(_DWORD *)(v4 + 4) = a2;
    *(double *)(v4 + 8) = a3;
    *(double *)(v4 + 16) = a4;
  }
  return result;
}

uint64_t maxent_use_l1_regularizer(uint64_t result, double a2)
{
  if (result)
    *(double *)(*(_QWORD *)result + 24) = a2;
  return result;
}

uint64_t maxent_use_l2_regularizer(uint64_t result, double a2)
{
  if (result)
    *(double *)(*(_QWORD *)result + 32) = a2;
  return result;
}

void maxent_add_training_sample(ME_Efficient_Model_Trainer **a1, const ME_Sample **a2)
{
  if (a1)
  {
    if (a2)
      ME_Efficient_Model_Trainer::add_training_sample(*a1, *a2);
  }
}

ME_Efficient_Model_Trainer **maxent_train(ME_Efficient_Model_Trainer **result)
{
  if (result)
    return (ME_Efficient_Model_Trainer **)ME_Efficient_Model_Trainer::train(*result);
  return result;
}

_DWORD *maxent_load_from_file(char *a1, char a2)
{
  _DWORD *v4;
  uint64_t v5;
  void *__p[2];
  char v8;

  v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x10200403A5D3213uLL);
  if (v4)
  {
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + 32) = 0u;
    *(_BYTE *)(v5 + 48) = 0;
    *(_QWORD *)v4 = v5;
    std::string::basic_string[abi:ne180100]<0>(__p, a1);
    ME_Efficient_Model::load_from_file(v5, (uint64_t)__p, a2);
    if (v8 < 0)
      operator delete(__p[0]);
    v4[2] = 1;
  }
  return v4;
}

void sub_2083FF1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_DWORD *maxent_load_with_bytes(const char *a1)
{
  _DWORD *v2;
  uint64_t v3;

  v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x10200403A5D3213uLL);
  if (v2)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_BYTE *)(v3 + 48) = 0;
    *(_QWORD *)v2 = v3;
    ME_Efficient_Model::load_with_bytes((ME_Efficient_Model *)v3, a1);
    v2[2] = 1;
  }
  return v2;
}

uint64_t maxent_num_classes(ME_Efficient_Model **a1)
{
  if (a1)
    return ME_Efficient_Model::num_classes(*a1);
  else
    return 0xFFFFFFFFLL;
}

uint64_t maxent_classify(ME_Efficient_Model **a1, ME_Sample **a2, uint64_t a3)
{
  uint64_t result;
  char *v6;
  char *v7;
  double *v8;
  BOOL v9;
  char v10;
  void *__p;
  char *v12;
  int v13;

  result = 0xFFFFFFFFLL;
  v13 = -1;
  if (a1 && a2)
  {
    ME_Efficient_Model::classify(*a1, *a2, (unsigned int *)&v13, (uint64_t *)&__p);
    v6 = (char *)__p;
    if (a3)
    {
      v10 = 0;
      v7 = v12;
      if (__p != v12)
      {
        v8 = (double *)((char *)__p + 8);
        do
        {
          (*(void (**)(uint64_t, char *, double))(a3 + 16))(a3, &v10, *(v8 - 1));
          if (v10)
            v9 = 1;
          else
            v9 = v8 == (double *)v7;
          ++v8;
        }
        while (!v9);
        v6 = (char *)__p;
      }
    }
    if (v6)
    {
      v12 = v6;
      operator delete(v6);
    }
    return v13;
  }
  return result;
}

void sub_2083FF330(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *maxent_get_class_label(ME_Efficient_Model **a1, unsigned int a2)
{
  if (a1)
    return ME_Efficient_Model::get_class_label(*a1, a2);
  else
    return "";
}

uint64_t maxent_get_class_id(uint64_t **a1, char *a2)
{
  uint64_t *v2;
  uint64_t class_id;
  void *__p[2];
  char v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = *a1;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  class_id = ME_Efficient_Model::get_class_id(v2, (unsigned __int8 **)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  return class_id;
}

void sub_2083FF3C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t maxent_model_retain(uint64_t result)
{
  if (result)
    ++*(_DWORD *)(result + 8);
  return result;
}

void maxent_model_release(_DWORD *a1)
{
  int v2;
  ME_Efficient_Model *v3;

  if (a1)
  {
    v2 = a1[2] - 1;
    a1[2] = v2;
    if (!v2)
    {
      v3 = *(ME_Efficient_Model **)a1;
      if (*(_QWORD *)a1)
      {
        ME_Efficient_Model::~ME_Efficient_Model(v3);
        MEMORY[0x20BD06848]();
      }
      free(a1);
    }
  }
}

_QWORD *maxent_sample_create()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
  if (v0)
  {
    v1 = operator new();
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)v1, "");
    *(_OWORD *)(v1 + 56) = 0u;
    *(_OWORD *)(v1 + 40) = 0u;
    *(_OWORD *)(v1 + 24) = 0u;
    *v0 = v1;
  }
  return v0;
}

void sub_2083FF4CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD06848](v1, 0x1032C40C22FA858);
  _Unwind_Resume(a1);
}

uint64_t maxent_sample_description(char **a1, void *a2, int a3)
{
  char *v6;
  size_t v7;
  std::string *p_p;
  char *v9;
  std::string *v10;
  std::string::size_type size;
  __int128 *v12;
  __int128 *i;
  __int128 v14;
  std::string::size_type v15;
  void **v16;
  std::string *v17;
  void **v18;
  std::string::size_type v19;
  uint64_t v20;
  void *v21;
  void *v23[2];
  unsigned __int8 v24;
  std::string __p;
  std::string __src;

  memset(&__src, 0, sizeof(__src));
  v6 = *a1;
  if ((*a1)[23] >= 0)
    v7 = (*a1)[23];
  else
    v7 = *((_QWORD *)*a1 + 1);
  p_p = &__p;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v7 + 1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v7)
  {
    if (v6[23] >= 0)
      v9 = v6;
    else
      v9 = *(char **)v6;
    memmove(p_p, v9, v7);
  }
  *(_WORD *)((char *)&p_p->__r_.__value_.__l.__data_ + v7) = 9;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = &__p;
  else
    v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  std::string::append(&__src, (const std::string::value_type *)v10, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v12 = (__int128 *)*((_QWORD *)*a1 + 3);
  for (i = (__int128 *)*((_QWORD *)*a1 + 4); v12 != i; v12 = (__int128 *)((char *)v12 + 24))
  {
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
    }
    else
    {
      v14 = *v12;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v15 = __p.__r_.__value_.__l.__size_;
    std::string::basic_string[abi:ne180100]((uint64_t)v23, v15 + 1);
    if ((v24 & 0x80u) == 0)
      v16 = v23;
    else
      v16 = (void **)v23[0];
    if (v15)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v17 = &__p;
      else
        v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
      memmove(v16, v17, v15);
    }
    *(_WORD *)((char *)v16 + v15) = 32;
    if ((v24 & 0x80u) == 0)
      v18 = v23;
    else
      v18 = (void **)v23[0];
    if ((v24 & 0x80u) == 0)
      v19 = v24;
    else
      v19 = (std::string::size_type)v23[1];
    std::string::append(&__src, (const std::string::value_type *)v18, v19);
    if ((char)v24 < 0)
      operator delete(v23[0]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
  {
    v21 = (void *)__src.__r_.__value_.__r.__words[0];
    memcpy(a2, __src.__r_.__value_.__l.__data_, a3);
    v20 = LODWORD(__src.__r_.__value_.__r.__words[1]);
    operator delete(v21);
  }
  else
  {
    v20 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
    memcpy(a2, &__src, a3);
  }
  return v20;
}

void sub_2083FF708(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

void maxent_sample_set_label(std::string **a1, char *a2)
{
  std::string *v2;
  std::string __str;

  if (a1)
  {
    v2 = *a1;
    std::string::basic_string[abi:ne180100]<0>(&__str, a2);
    std::string::operator=(v2, &__str);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_2083FF7A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

const char *maxent_sample_get_label(const char **a1)
{
  const char *result;

  if (!a1)
    return "";
  result = *a1;
  if (result[23] < 0)
    return *(const char **)result;
  return result;
}

void maxent_sample_add_feature(uint64_t **a1, char *a2)
{
  uint64_t *v2;
  void *__p[2];
  char v4;

  if (a1)
  {
    v2 = *a1;
    std::string::basic_string[abi:ne180100]<0>(__p, a2);
    ME_Sample::add_feature(v2, (__int128 *)__p);
    if (v4 < 0)
      operator delete(__p[0]);
  }
}

void sub_2083FF838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Sample::add_feature(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 3;
  v4 = a1[4];
  if (v4 >= a1[5])
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    result = v4 + 24;
  }
  a1[4] = result;
  return result;
}

void maxent_sample_add_feature_with_value(uint64_t **a1, char *a2, double a3)
{
  uint64_t *v4;
  void *__p[2];
  char v6;

  if (a1)
  {
    v4 = *a1;
    std::string::basic_string[abi:ne180100]<0>(__p, a2);
    ME_Sample::add_feature(v4, (uint64_t)__p, a3);
    if (v6 < 0)
      operator delete(__p[0]);
  }
}

void sub_2083FF8F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ME_Sample::add_feature(uint64_t *a1, uint64_t a2, double a3)
{
  unint64_t v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  std::string __p;
  double v20;
  _QWORD v21[5];

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  v20 = a3;
  v5 = a1[8];
  v6 = a1[7];
  if (v6 >= v5)
  {
    v8 = a1[6];
    v9 = (uint64_t)(v6 - v8) >> 5;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 59)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (v11 >> 4 > v10)
      v10 = v11 >> 4;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v21[4] = a1 + 8;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(a1 + 8), v12);
    v14 = &v13[32 * v9];
    v21[0] = v13;
    v21[1] = v14;
    v21[3] = &v13[32 * v15];
    v16 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((_QWORD *)v14 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v14 = v16;
    memset(&__p, 0, sizeof(__p));
    *((double *)v14 + 3) = v20;
    v21[2] = v14 + 32;
    std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(a1 + 6, v21);
    v17 = a1[7];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v21);
    v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    a1[7] = v17;
    if (v18 < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v7 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v6 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v6 = v7;
    *(double *)(v6 + 24) = v20;
    a1[7] = v6 + 32;
  }
}

void sub_2083FFA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)&a17);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void maxent_sample_clear(ME_Sample **a1)
{
  if (a1)
    ME_Sample::clear(*a1);
}

void ME_Sample::clear(ME_Sample *this)
{
  MEMORY[0x20BD06764](this, "");
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3);
  std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6);
}

void maxent_sample_release(uint64_t *a1)
{
  uint64_t v2;
  void **v3;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v3 = (void **)(v2 + 48);
      std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v3);
      v3 = (void **)(v2 + 24);
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
      if (*(char *)(v2 + 23) < 0)
        operator delete(*(void **)v2);
      MEMORY[0x20BD06848](v2, 0x1032C40C22FA858);
    }
    free(a1);
  }
}

ME_Efficient_Model_Trainer **maxent_copy_trained_model_data(ME_Efficient_Model_Trainer **a1, _DWORD *a2, double a3)
{
  ME_Efficient_Model_Trainer **v3;
  FILE *v6;
  ME_Efficient_Model_Trainer *v7;
  uint64_t v8;
  size_t v9;

  v3 = a1;
  if (a1)
  {
    v6 = tmpfile();
    v7 = *v3;
    v8 = fileno(v6);
    if (ME_Efficient_Model_Trainer::save_to_file_descriptor(v7, v8, a3))
    {
      fseek(v6, 0, 2);
      v9 = MEMORY[0x20BD069EC](v6);
      fseek(v6, 0, 0);
      v3 = (ME_Efficient_Model_Trainer **)malloc_type_malloc(v9, 0xAFD5405EuLL);
      fread(v3, v9, 1uLL, v6);
      if (a2)
        *a2 = v9;
    }
    else
    {
      v3 = 0;
    }
    fclose(v6);
  }
  return v3;
}

uint64_t maxent_copy_loaded_model_data(uint64_t a1, _DWORD *a2)
{
  size_t v2;
  const void *v3;
  BOOL v4;
  void *v6;

  if (a1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
    v3 = *(const void **)(*(_QWORD *)a1 + 40);
    if (v3)
      v4 = v2 == 0;
    else
      v4 = 1;
    if (!v4)
    {
      v6 = malloc_type_malloc(*(_QWORD *)(*(_QWORD *)a1 + 32), 0xD8EF73C5uLL);
      memcpy(v6, v3, v2);
      if (a2)
        *a2 = v2;
    }
  }
  return 0;
}

void ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer(ME_Efficient_Model_Trainer *this)
{
  uint64_t v2;

  *((_QWORD *)this + 5) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  *((_DWORD *)this + 26) = 1065353216;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_OWORD *)this + 9) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_QWORD *)this + 24) = 0;
  *((_DWORD *)this + 50) = 1065353216;
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 28) = 0;
  *((_OWORD *)this + 15) = 0u;
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  nlp::BurstTrieCreateMutable(this);
  *((_QWORD *)this + 17) = v2;
}

void sub_2083FFD38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD *v2;
  ME_Efficient_Model_Trainer::ME_FeatureBag *v3;
  void **v4;
  void **v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a2);
  v7 = (void *)v2[45];
  if (v7)
  {
    v2[46] = v7;
    operator delete(v7);
  }
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v8 = (void *)v2[33];
  if (v8)
  {
    v2[34] = v8;
    operator delete(v8);
  }
  v9 = *v5;
  if (*v5)
  {
    v2[31] = v9;
    operator delete(v9);
  }
  ME_Efficient_Model_Trainer::ME_FeatureBag::~ME_FeatureBag(v3);
  v10 = *v4;
  if (*v4)
  {
    v2[19] = v10;
    operator delete(v10);
  }
  ME_Efficient_Model_Trainer::StringBag::~StringBag((ME_Efficient_Model_Trainer::StringBag *)(v2 + 8));
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(_OWORD *)(a3 - 32);
      *(_QWORD *)(v8 - 16) = *(_QWORD *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(v8 - 8) = *(_QWORD *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::pair<std::string,double>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::pair<std::string,double>>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::pair<std::string,double>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::vector<std::pair<std::string,double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

void std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t crfsuite_train_averaged_perceptron_init(int **a1)
{
  params_add_int(a1, "max_iterations", 100, "The maximum number of iterations.");
  return params_add_float(a1, "epsilon", "The stopping criterion (the ratio of incorrect label predictions).", 0.0);
}

uint64_t crfsuite_train_averaged_perceptron(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  int v11;
  size_t v12;
  size_t v13;
  void *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  clock_t v43;
  int v44;
  double v45;
  unsigned int *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double *v57;
  double *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double *v74;
  uint64_t v75;
  double v76;
  clock_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  clock_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  clock_t v123;
  double *v125;
  char *v126;
  _QWORD *v127;
  clock_t v128;
  size_t v129;
  uint64_t v130;
  _DWORD *v131;
  uint64_t v132;
  _QWORD v133[2];
  unint64_t v134;
  double v135;
  uint64_t v136;
  double v137[2];

  v11 = *(_DWORD *)(a2 + 16);
  v13 = *(int *)(a1 + 44);
  v12 = *(int *)(a1 + 48);
  v136 = 0;
  v137[0] = 0.0;
  v123 = clock();
  v134 = 0;
  v135 = 0.0;
  (*(void (**)(uint64_t, const char *, uint64_t *))(a4 + 88))(a4, "max_iterations", &v136);
  (*(void (**)(uint64_t, const char *, double *))(a4 + 96))(a4, "epsilon", v137);
  v14 = malloc_type_calloc(8uLL, v13, 0xB09DA3EBuLL);
  v125 = (double *)malloc_type_calloc(8uLL, v13, 0x4506FDE5uLL);
  v129 = v13;
  v15 = (char *)malloc_type_calloc(8uLL, v13, 0x5B1ECD66uLL);
  v16 = (char *)malloc_type_calloc(4uLL, v12, 0xA3826279uLL);
  v23 = v16;
  if (v14 && v125 && v15 && v16)
  {
    logging(a5, (uint64_t)"Averaged perceptron\n", v17, v18, v19, v20, v21, v22, v117);
    logging(a5, (uint64_t)"max_iterations: %d\n", v24, v25, v26, v27, v28, v29, v136);
    logging(a5, (uint64_t)"epsilon: %f\n", v30, v31, v32, v33, v34, v35, *(uint64_t *)&v137[0]);
    logging(a5, (uint64_t)"\n", v36, v37, v38, v39, v40, v41, v118);
    LODWORD(v130) = 0;
    v133[0] = v14;
    v133[1] = v125;
    v42 = 1;
    v126 = v15;
    v127 = a5;
    v131 = a3;
    while ((int)v130 < (int)v136)
    {
      v43 = clock();
      dataset_shuffle(a2);
      v128 = v43;
      if (v11 < 1)
      {
        v45 = 0.0;
      }
      else
      {
        v44 = 0;
        v45 = 0.0;
        do
        {
          v132 = 0;
          v46 = (unsigned int *)dataset_get((_QWORD *)a2, v44);
          (*(void (**)(uint64_t, void *, double))(a1 + 88))(a1, v14, 1.0);
          (*(void (**)(uint64_t, unsigned int *))(a1 + 96))(a1, v46);
          (*(void (**)(uint64_t, char *, uint64_t *))(a1 + 112))(a1, v23, &v132);
          v47 = *v46;
          if ((int)v47 >= 1)
          {
            v48 = 0;
            v49 = 0;
            v50 = 4 * v47;
            do
            {
              if (*(_DWORD *)(*((_QWORD *)v46 + 2) + v48) != *(_DWORD *)&v23[v48])
                ++v49;
              v48 += 4;
            }
            while (v50 != v48);
            if (v49)
            {
              v134 = 0x3FF0000000000000;
              v135 = (double)v42;
              (*(void (**)(uint64_t, unsigned int *))(a1 + 80))(a1, v46);
              v134 = 0xBFF0000000000000;
              v135 = (double)-v42;
              (*(void (**)(uint64_t, unsigned int *, char *, double (*)(uint64_t, int, double), _QWORD *))(a1 + 80))(a1, v46, v23, update_weights, v133);
              v45 = v45 + (double)v49 / (double)(int)*v46;
            }
          }
          a3 = v131;
          ++v42;
          ++v44;
        }
        while (v44 != v11);
      }
      v15 = v126;
      memcpy(v126, v14, 8 * v129);
      if ((int)v129 >= 1)
      {
        v57 = v125;
        v58 = (double *)v126;
        v59 = v129;
        do
        {
          v60 = *v57++;
          *v58 = *v58 + -1.0 / (double)v42 * v60;
          ++v58;
          --v59;
        }
        while (v59);
      }
      v130 = (v130 + 1);
      a5 = v127;
      logging(v127, (uint64_t)"***** Iteration #%d *****\n", v51, v52, v53, v54, v55, v56, v130);
      logging(v127, (uint64_t)"Loss: %f\n", v61, v62, v63, v64, v65, v66, *(uint64_t *)&v45);
      v73 = 0.0;
      if ((int)v129 >= 1)
      {
        v74 = (double *)v126;
        v75 = v129;
        do
        {
          v76 = *v74++;
          v73 = v73 + v76 * v76;
          --v75;
        }
        while (v75);
      }
      logging(v127, (uint64_t)"Feature norm: %f\n", v67, v68, v69, v70, v71, v72, COERCE__INT64(sqrt(v73)));
      v77 = clock();
      logging(v127, (uint64_t)"Seconds required for this iteration: %.3f\n", v78, v79, v80, v81, v82, v83, COERCE__INT64((double)(v77 - v128) / 1000000.0));
      if (a3)
        holdout_evaluation(a1, a3, (uint64_t)v126, v127);
      logging(v127, (uint64_t)"\n", v84, v85, v86, v87, v88, v89, v119);
      if (v45 / (double)v11 < v137[0])
      {
        logging(v127, (uint64_t)"Terminated with the stopping criterion\n", v90, v91, v92, v93, v94, v95, v120);
        logging(v127, (uint64_t)"\n", v96, v97, v98, v99, v100, v101, v121);
        break;
      }
    }
    v102 = clock();
    logging(a5, (uint64_t)"Total seconds required for training: %.3f\n", v103, v104, v105, v106, v107, v108, COERCE__INT64((double)(v102 - v123) / 1000000.0));
    logging(a5, (uint64_t)"\n", v109, v110, v111, v112, v113, v114, v122);
    v115 = 0;
  }
  else
  {
    free(v16);
    v115 = 2147483649;
    v23 = v15;
    v15 = 0;
  }
  free(v23);
  free(v125);
  free(v14);
  *a6 = v15;
  return v115;
}

double update_weights(uint64_t a1, int a2, double a3)
{
  uint64_t v3;
  double result;

  v3 = *(_QWORD *)(a1 + 8);
  *(double *)(*(_QWORD *)a1 + 8 * a2) = *(double *)(*(_QWORD *)a1 + 8 * a2) + *(double *)(a1 + 16) * a3;
  result = *(double *)(v3 + 8 * a2) + *(double *)(a1 + 24) * a3;
  *(double *)(v3 + 8 * a2) = result;
  return result;
}

uint64_t exchange_options_0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c2", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 24);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "period", a2 + 28);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "delta", a2 + 32);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "calibration.eta", a2 + 40);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "calibration.rate", a2 + 48);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "calibration.samples", a2 + 56);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "calibration.candidates", a2 + 60);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "calibration.max_trials", a2 + 64);
  }
  else if (a3)
  {
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "c2", *(double *)a2);
    (*(void (**)(uint64_t, const char *, _QWORD))(a1 + 64))(a1, "max_iterations", *(unsigned int *)(a2 + 24));
    (*(void (**)(uint64_t, const char *, _QWORD))(a1 + 64))(a1, "period", *(unsigned int *)(a2 + 28));
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "delta", *(double *)(a2 + 32));
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "calibration.eta", *(double *)(a2 + 40));
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "calibration.rate", *(double *)(a2 + 48));
    (*(void (**)(uint64_t, const char *, _QWORD))(a1 + 64))(a1, "calibration.samples", *(unsigned int *)(a2 + 56));
    (*(void (**)(uint64_t, const char *, _QWORD))(a1 + 64))(a1, "calibration.candidates", *(unsigned int *)(a2 + 60));
    (*(void (**)(uint64_t, const char *, _QWORD))(a1 + 64))(a1, "calibration.max_trials", *(unsigned int *)(a2 + 64));
  }
  else
  {
    params_add_float((int **)a1, "c2", "Coefficient for L2 regularization.", 1.0);
    params_add_int((int **)a1, "max_iterations", 1000, "The maximum number of iterations (epochs) for SGD optimization.");
    params_add_int((int **)a1, "period", 10, "The duration of iterations to test the stopping criterion.");
    params_add_float((int **)a1, "delta", "The threshold for the stopping criterion; an optimization process stops when\n"
      "the improvement of the log likelihood over the last ${period} iterations is no\n"
      "greater than this threshold.",
      0.000001);
    params_add_float((int **)a1, "calibration.eta", "The initial value of learning rate (eta) used for calibration.", 0.1);
    params_add_float((int **)a1, "calibration.rate", "The rate of increase/decrease of learning rate for calibration.", 2.0);
    params_add_int((int **)a1, "calibration.samples", 1000, "The number of instances used for calibration.");
    params_add_int((int **)a1, "calibration.candidates", 10, "The number of candidates of learning rate.");
    params_add_int((int **)a1, "calibration.max_trials", 20, "The maximum number of trials of learning rates for calibration.");
  }
  return 0;
}

uint64_t crfsuite_train_l2sgd_init(uint64_t a1)
{
  return exchange_options_0(a1, 0, 0);
}

uint64_t crfsuite_train_l2sgd(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  int v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  int v103;
  uint64_t v104;
  double v105;
  void *v106;
  double *v107;
  double v108;
  double v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  _BOOL4 v128;
  _BOOL4 v129;
  double v130;
  BOOL v131;
  clock_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  clock_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  clock_t v172;
  clock_t v173;
  unsigned int v174;
  _DWORD *v175;
  _QWORD *v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  double v184[2];

  v182 = 0;
  v11 = *(_DWORD *)(a2 + 16);
  v12 = *(int *)(a1 + 44);
  v181 = 0;
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  exchange_options_0(a4, (uint64_t)&v177, -1);
  v13 = malloc_type_calloc(8uLL, v12, 0x71A3A50DuLL);
  if (!v13)
    return 2147483649;
  v20 = v13;
  v175 = a3;
  v176 = a6;
  v174 = v11;
  *((double *)&v177 + 1) = (*(double *)&v177 + *(double *)&v177) / (double)v11;
  logging(a5, (uint64_t)"Stochastic Gradient Descent (SGD)\n", v14, v15, v16, v17, v18, v19, v167);
  logging(a5, (uint64_t)"c2: %f\n", v21, v22, v23, v24, v25, v26, v177);
  logging(a5, (uint64_t)"max_iterations: %d\n", v27, v28, v29, v30, v31, v32, DWORD2(v178));
  logging(a5, (uint64_t)"period: %d\n", v33, v34, v35, v36, v37, v38, HIDWORD(v178));
  logging(a5, (uint64_t)"delta: %f\n", v39, v40, v41, v42, v43, v44, v179);
  logging(a5, (uint64_t)"\n", v45, v46, v47, v48, v49, v50, v168);
  v173 = clock();
  v51 = HIDWORD(v180);
  v172 = clock();
  v184[0] = 0.0;
  v58 = *(_DWORD *)(a2 + 16);
  if (v58 >= SDWORD2(v180))
    v59 = DWORD2(v180);
  else
    v59 = v58;
  v60 = *(unsigned int *)(a1 + 44);
  v62 = *((double *)&v179 + 1);
  v61 = *(uint64_t *)&v180;
  v63 = *((double *)&v177 + 1);
  logging(a5, (uint64_t)"Calibrating the learning rate (eta)\n", v52, v53, v54, v55, v56, v57, v169);
  logging(a5, (uint64_t)"calibration.eta: %f\n", v64, v65, v66, v67, v68, v69, *(uint64_t *)&v62);
  logging(a5, (uint64_t)"calibration.rate: %f\n", v70, v71, v72, v73, v74, v75, v61);
  logging(a5, (uint64_t)"calibration.samples: %d\n", v76, v77, v78, v79, v80, v81, v59);
  logging(a5, (uint64_t)"calibration.candidates: %d\n", v82, v83, v84, v85, v86, v87, v51);
  logging(a5, (uint64_t)"calibration.max_trials: %d\n", v88, v89, v90, v91, v92, v93, v181);
  dataset_shuffle(a2);
  if ((int)v60 >= 1)
    bzero(v20, 8 * v60);
  v94 = v20;
  (*(void (**)(uint64_t, void *, double))(a1 + 88))(a1, v20, 1.0);
  v101 = 0.0;
  v102 = 0.0;
  if ((int)v59 >= 1)
  {
    v103 = 0;
    do
    {
      v183 = 0.0;
      v104 = dataset_get((_QWORD *)a2, v103);
      (*(void (**)(uint64_t, uint64_t))(a1 + 96))(a1, v104);
      (*(void (**)(uint64_t, _QWORD, double *))(a1 + 104))(a1, *(_QWORD *)(v104 + 16), &v183);
      v105 = v102 - v183;
      (*(void (**)(uint64_t, double *))(a1 + 120))(a1, &v183);
      v102 = v105 + v183;
      ++v103;
    }
    while ((_DWORD)v59 != v103);
  }
  v106 = v94;
  if ((int)v60 >= 1)
  {
    v101 = 0.0;
    v107 = (double *)v94;
    do
    {
      v108 = *v107++;
      v101 = v101 + v108 * v108;
      --v60;
    }
    while (v60);
  }
  v109 = v102 + v63 * 0.5 * v101 * (double)v58;
  logging(a5, (uint64_t)"Initial loss: %f\n", v95, v96, v97, v98, v99, v100, *(uint64_t *)&v109);
  v116 = 0;
  v117 = 1.79769313e308;
  v118 = 1;
  *(double *)&v119 = v62;
  v120 = v62 / *(double *)&v61;
  do
  {
    if (v116 && (int)v51 < 1)
      break;
    logging(a5, (uint64_t)"Trial #%d (eta = %f): ", v110, v111, v112, v113, v114, v115, v118);
    l2sgd(a1, (_QWORD *)a2, 0, v106, a5, v59, 1, 1, 1.0 / (v63 * v62), v63, 0.0, 1, v184);
    v127 = fabs(v184[0]);
    v128 = v127 < INFINITY;
    if (v127 > INFINITY)
      v128 = 1;
    v129 = v184[0] < v109 && v128;
    if (v129)
    {
      logging(a5, (uint64_t)"%f\n", v121, v122, v123, v124, v125, v126, *(uint64_t *)&v184[0]);
      LODWORD(v51) = v51 - 1;
    }
    else
    {
      logging(a5, (uint64_t)"%f (worse)\n", v121, v122, v123, v124, v125, v126, *(uint64_t *)&v184[0]);
    }
    v130 = fabs(v184[0]);
    v131 = v130 < INFINITY;
    if (v130 > INFINITY)
      v131 = 1;
    if (v131 && v184[0] < v117)
    {
      v117 = v184[0];
      *(double *)&v119 = v62;
    }
    if (v116)
    {
      v116 = 1;
      v62 = v62 / *(double *)&v61;
    }
    else if ((int)v51 > 0 && v129)
    {
      v116 = 0;
      v62 = *(double *)&v61 * v62;
    }
    else
    {
      v116 = 1;
      LODWORD(v51) = HIDWORD(v180);
      v62 = v120;
    }
    v106 = v94;
    v118 = (v118 + 1);
  }
  while ((int)v181 > (int)v118);
  logging(a5, (uint64_t)"Best learning rate (eta): %f\n", v110, v111, v112, v113, v114, v115, v119);
  v133 = clock();
  logging(a5, (uint64_t)"Seconds required: %.3f\n", v134, v135, v136, v137, v138, v139, COERCE__INT64((double)(v133 - v172) / 1000000.0));
  logging(a5, (uint64_t)"\n", v140, v141, v142, v143, v144, v145, v170);
  *(double *)&v178 = 1.0 / (v63 * *(double *)&v119);
  v146 = l2sgd(a1, (_QWORD *)a2, v175, v106, a5, v174, DWORD2(v178), 0, *(double *)&v178, *((double *)&v177 + 1), *(double *)&v179, SHIDWORD(v178), (double *)&v182);
  logging(a5, (uint64_t)"Loss: %f\n", v147, v148, v149, v150, v151, v152, v182);
  v153 = clock();
  logging(a5, (uint64_t)"Total seconds required for training: %.3f\n", v154, v155, v156, v157, v158, v159, COERCE__INT64((double)(v153 - v173) / 1000000.0));
  logging(a5, (uint64_t)"\n", v160, v161, v162, v163, v164, v165, v171);
  *v176 = v106;
  return v146;
}

uint64_t l2sgd(uint64_t a1, _QWORD *a2, _DWORD *a3, void *a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, int a12, double *a13)
{
  uint64_t v13;
  int v14;
  void *v21;
  double *v22;
  int v23;
  size_t v24;
  double *v25;
  void *v26;
  BOOL v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  int v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  double *v41;
  uint64_t v42;
  double v43;
  double *v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  clock_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  const char *v87;
  uint64_t v89;
  uint64_t v90;
  int v91;
  size_t v92;
  void *__src;
  int v95;
  double *v97;
  double v98;
  clock_t v99;
  int v100;
  double v101[2];

  v13 = a7;
  v14 = a6;
  v97 = 0;
  v21 = 0;
  v22 = a13;
  v23 = a12;
  v101[0] = 0.0;
  v24 = *(int *)(a1 + 44);
  v100 = a8;
  if (!(_DWORD)a8)
  {
    v25 = (double *)malloc_type_malloc(8 * a12, 0x100004000313F17uLL);
    v26 = malloc_type_calloc(v24, 8uLL, 0x100004000313F17uLL);
    v21 = v26;
    v97 = v25;
    if (v25)
      v27 = v26 == 0;
    else
      v27 = 1;
    if (v27)
    {
      v28 = 0.0;
      v29 = 2147483649;
      goto LABEL_51;
    }
    v23 = a12;
  }
  __src = v21;
  v92 = v24;
  v30 = v24;
  if ((int)v24 >= 1)
    bzero(a4, 8 * v24);
  if ((int)v13 >= 1)
  {
    v95 = v23;
    v91 = v13 + 1;
    v31 = 1;
    v32 = 0.0;
    v98 = 1.79769313e308;
    v33 = 0.0;
    while (1)
    {
      v99 = clock();
      if (!v100)
      {
        logging(a5, (uint64_t)"***** Epoch #%d *****\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v31);
        dataset_shuffle((uint64_t)a2);
      }
      v34 = v13;
      if (v14 < 1)
      {
        v37 = 1.0;
        v36 = 0.0;
        v39 = v101[0];
      }
      else
      {
        v35 = 0;
        v36 = 0.0;
        v37 = 1.0;
        do
        {
          v38 = dataset_get(a2, v35);
          v32 = 1.0 / ((v33 + a9) * a10);
          v37 = v37 * (1.0 - v32 * a10);
          (*(void (**)(uint64_t, void *, double))(a1 + 88))(a1, a4, v37);
          (*(void (**)(uint64_t, uint64_t))(a1 + 96))(a1, v38);
          (*(void (**)(uint64_t, double *, void *, double))(a1 + 128))(a1, v101, a4, v32 / v37);
          v39 = v101[0];
          v36 = v36 + v101[0];
          v33 = v33 + 1.0;
          ++v35;
        }
        while (v14 != v35);
      }
      v40 = fabs(v39);
      if (v40 >= INFINITY && v40 <= INFINITY)
      {
        logging(a5, (uint64_t)"ERROR: overflow loss\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v89);
        v29 = 2147483653;
        v28 = v101[0];
        v22 = a13;
        v21 = __src;
        goto LABEL_51;
      }
      if ((int)v30 < 1)
      {
        v43 = 0.0;
        v13 = v34;
      }
      else
      {
        v41 = (double *)a4;
        v42 = v30;
        do
        {
          *v41 = v37 * *v41;
          ++v41;
          --v42;
        }
        while (v42);
        v43 = 0.0;
        v44 = (double *)a4;
        v45 = v30;
        v13 = v34;
        do
        {
          v46 = *v44++;
          v43 = v43 + v46 * v46;
          --v45;
        }
        while (v45);
      }
      v28 = v36 + a10 * 0.5 * v43 * (double)v14;
      if (!v100)
      {
        if (v28 < v98)
        {
          memcpy(__src, a4, 8 * (int)v30);
          v98 = v36 + a10 * 0.5 * v43 * (double)v14;
        }
        v47 = ((int)v31 - 1) % v95;
        if ((int)v31 <= v95)
        {
          v97[v47] = v28;
          logging(a5, (uint64_t)"Loss: %f\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, *(uint64_t *)&v28);
          v48 = a11;
        }
        else
        {
          v48 = (v97[v47] - v28) / v28;
          v97[v47] = v28;
          logging(a5, (uint64_t)"Loss: %f\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, *(uint64_t *)&v28);
          logging(a5, (uint64_t)"Improvement ratio: %f\n", v49, v50, v51, v52, v53, v54, *(uint64_t *)&v48);
        }
        logging(a5, (uint64_t)"Feature L2-norm: %f\n", v55, v56, v57, v58, v59, v60, COERCE__INT64(sqrt(v43)));
        logging(a5, (uint64_t)"Learning rate (eta): %f\n", v61, v62, v63, v64, v65, v66, *(uint64_t *)&v32);
        logging(a5, (uint64_t)"Total number of feature updates: %.0f\n", v67, v68, v69, v70, v71, v72, *(uint64_t *)&v33);
        v73 = clock();
        logging(a5, (uint64_t)"Seconds required for this iteration: %.3f\n", v74, v75, v76, v77, v78, v79, COERCE__INT64((double)(v73 - v99) / 1000000.0));
        if (a3)
          holdout_evaluation(a1, a3, (uint64_t)a4, a5);
        logging(a5, (uint64_t)"\n", v80, v81, v82, v83, v84, v85, v90);
        if (v48 < a11)
          break;
      }
      v27 = (_DWORD)v31 == (_DWORD)v13;
      v31 = (v31 + 1);
      if (v27)
      {
        v86 = v91;
        goto LABEL_42;
      }
    }
    v22 = a13;
    v21 = __src;
    goto LABEL_46;
  }
  v28 = 0.0;
  v86 = 1;
  v98 = 1.79769313e308;
LABEL_42:
  LODWORD(v31) = v86;
  v22 = a13;
  v21 = __src;
  if (!v100)
  {
LABEL_46:
    if ((int)v31 >= (int)v13)
      v87 = "SGD terminated with the maximum number of iterations\n";
    else
      v87 = "SGD terminated with the stopping criteria\n";
    logging(a5, (uint64_t)v87, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v89);
    if (!v21)
      goto LABEL_50;
LABEL_44:
    memcpy(a4, v21, 8 * v92);
    v29 = 0;
    v28 = v98;
    goto LABEL_51;
  }
  if (__src)
    goto LABEL_44;
LABEL_50:
  v29 = 0;
LABEL_51:
  free(v21);
  free(v97);
  if (v22)
    *v22 = v28;
  return v29;
}

void ME_Efficient_Model_Trainer::backtracking_line_search(ME_Efficient_Model_Trainer *this, const Vec *a2, const Vec *a3, double a4, const Vec *a5, Vec *a6, double **a7)
{
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _BYTE *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  void *v35;
  _BYTE *v36;
  void *__p;
  _BYTE *v38;

  v15 = *(_QWORD *)a5;
  v14 = *((_QWORD *)a5 + 1);
  v16 = 2.0;
  do
  {
    v16 = v16 * 0.5;
    Vec::Vec((Vec *)&v35, (v14 - v15) >> 3, 0.0);
    v17 = *(_QWORD *)a5;
    v18 = *((_QWORD *)a5 + 1);
    v19 = v18 - *(_QWORD *)a5;
    if (v18 != *(_QWORD *)a5)
    {
      v20 = 0;
      v21 = v19 >> 3;
      v22 = (char *)v35;
      if (v21 <= 1)
        v21 = 1;
      do
      {
        *(double *)&v22[v20 >> 29] = v16 * *(double *)(v17 + (v20 >> 29));
        v20 += 0x100000000;
        --v21;
      }
      while (v21);
    }
    Vec::Vec((Vec *)&__p, (uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3, 0.0);
    v23 = *(_QWORD *)a2;
    v24 = *((_QWORD *)a2 + 1);
    v25 = (v24 - *(_QWORD *)a2) >> 3;
    v26 = (char *)v35;
    if (v25 != (v36 - (_BYTE *)v35) >> 3)
      __assert_rtn("operator+", "mathvec.h", 64, "a.Size() == b.Size()");
    if (v24 != v23)
    {
      v27 = 0;
      v28 = (char *)__p;
      if (v25 <= 1)
        v25 = 1;
      do
      {
        *(double *)&v28[v27 >> 29] = *(double *)(v23 + (v27 >> 29)) + *(double *)&v26[v27 >> 29];
        v27 += 0x100000000;
        --v25;
      }
      while (v25);
    }
    v29 = __p;
    if (&__p != (void **)a6)
    {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)a6, (char *)__p, (uint64_t)v38, (v38 - (_BYTE *)__p) >> 3);
      v29 = __p;
    }
    if (v29)
    {
      v38 = v29;
      operator delete(v29);
    }
    if (v35)
    {
      v36 = v35;
      operator delete(v35);
    }
    v30 = ME_Efficient_Model_Trainer::FunctionGradient(this, (uint64_t **)a6, a7);
    v15 = *(_QWORD *)a5;
    v14 = *((_QWORD *)a5 + 1);
    v31 = v14 - *(_QWORD *)a5;
    if (v14 == *(_QWORD *)a5)
    {
      v34 = 0.0;
    }
    else
    {
      v32 = 0;
      v33 = v31 >> 3;
      if ((unint64_t)(v31 >> 3) <= 1)
        v33 = 1;
      v34 = 0.0;
      do
      {
        v34 = v34 + *(double *)(v15 + (v32 >> 29)) * *(double *)(*(_QWORD *)a3 + (v32 >> 29));
        v32 += 0x100000000;
        --v33;
      }
      while (v33);
    }
  }
  while (v30 > a4 + v16 * 0.1 * v34);
}

void sub_20840159C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a9)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void approximate_Hg(const Vec *a1@<X1>, const Vec *a2@<X2>, const Vec *a3@<X3>, const double *a4@<X4>, int a5@<W0>, double **a6@<X8>)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  double v34;
  double *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unsigned int v56;
  int v58;
  void *__p;
  void *v60;
  _QWORD v61[12];

  v61[10] = *MEMORY[0x24BDAC8D0];
  v56 = a5 - 1;
  if (a5 >= 11)
    v10 = 9;
  else
    v10 = (a5 - 1);
  if (a5 >= 11)
    v11 = a5 - 10;
  else
    v11 = 0;
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a6, *(const void **)a1, *((_QWORD *)a1 + 1), (uint64_t)(*((_QWORD *)a1 + 1) - *(_QWORD *)a1) >> 3);
  v58 = v10;
  if ((v10 & 0x80000000) == 0)
  {
    v12 = v10;
    do
    {
      v13 = (v11 + (int)v12) % 10;
      v14 = *((_QWORD *)a2 + 3 * v13);
      v15 = *((_QWORD *)a2 + 3 * v13 + 1);
      v16 = 0.0;
      v17 = v15 - v14;
      if (v15 != v14)
      {
        v18 = 0;
        v19 = v17 >> 3;
        if ((unint64_t)(v17 >> 3) <= 1)
          v19 = 1;
        do
        {
          v16 = v16 + *(double *)(v14 + (v18 >> 29)) * *(double *)((char *)*a6 + (v18 >> 29));
          v18 += 0x100000000;
          --v19;
        }
        while (v19);
      }
      v20 = a4[v13];
      *(double *)&v61[v12] = v20 * v16;
      v21 = (uint64_t *)((char *)a3 + 24 * v13);
      Vec::Vec((Vec *)&__p, (v21[1] - *v21) >> 3, 0.0);
      v22 = *v21;
      v23 = v21[1];
      v24 = v23 - *v21;
      if (v23 != *v21)
      {
        v25 = 0;
        v26 = v24 >> 3;
        v27 = (char *)__p;
        if (v26 <= 1)
          v26 = 1;
        do
        {
          *(double *)&v27[v25 >> 29] = *(double *)(v22 + (v25 >> 29)) * -(v20 * v16);
          v25 += 0x100000000;
          --v26;
        }
        while (v26);
      }
      Vec::operator+=(a6, (uint64_t *)&__p);
      if (__p)
      {
        v60 = __p;
        operator delete(__p);
      }
    }
    while (v12-- > 0);
  }
  if (a5 > 0)
  {
    v29 = *((_QWORD *)a3 + 3 * (v56 % 0xA));
    v30 = *((_QWORD *)a3 + 3 * (v56 % 0xA) + 1);
    v31 = v30 - v29;
    if (v30 == v29)
    {
      v34 = 0.0;
    }
    else
    {
      v32 = 0;
      v33 = v31 >> 3;
      if (v33 <= 1)
        v33 = 1;
      v34 = 0.0;
      do
      {
        v34 = v34 + *(double *)(v29 + (v32 >> 29)) * *(double *)(v29 + (v32 >> 29));
        v32 += 0x100000000;
        --v33;
      }
      while (v33);
    }
    v35 = *a6;
    v36 = (char *)a6[1] - (char *)*a6;
    if (v36)
    {
      v37 = 1.0 / a4[v56 % 0xA] / v34;
      v38 = v36 >> 3;
      if ((unint64_t)(v36 >> 3) <= 1)
        v38 = 1;
      do
      {
        *v35 = v37 * *v35;
        ++v35;
        --v38;
      }
      while (v38);
    }
  }
  if ((v10 & 0x80000000) == 0)
  {
    v39 = 0;
    do
    {
      v40 = (v11 + (int)v39) % 10;
      v41 = *((_QWORD *)a3 + 3 * v40);
      v42 = *((_QWORD *)a3 + 3 * v40 + 1);
      v43 = 0.0;
      v44 = v42 - v41;
      if (v42 != v41)
      {
        v45 = 0;
        v46 = v44 >> 3;
        if ((unint64_t)(v44 >> 3) <= 1)
          v46 = 1;
        do
        {
          v43 = v43 + *(double *)(v41 + (v45 >> 29)) * *(double *)((char *)*a6 + (v45 >> 29));
          v45 += 0x100000000;
          --v46;
        }
        while (v46);
      }
      v47 = a4[v40];
      v48 = (uint64_t *)((char *)a2 + 24 * v40);
      v49 = *(double *)&v61[v39];
      Vec::Vec((Vec *)&__p, (v48[1] - *v48) >> 3, 0.0);
      v50 = *v48;
      v51 = v48[1];
      v52 = v51 - *v48;
      if (v51 != *v48)
      {
        v53 = 0;
        v54 = v52 >> 3;
        v55 = (char *)__p;
        if (v54 <= 1)
          v54 = 1;
        do
        {
          *(double *)&v55[v53 >> 29] = (v49 - v47 * v43) * *(double *)(v50 + (v53 >> 29));
          v53 += 0x100000000;
          --v54;
        }
        while (v54);
      }
      Vec::operator+=(a6, (uint64_t *)&__p);
      if (__p)
      {
        v60 = __p;
        operator delete(__p);
      }
      ++v39;
    }
    while (v39 != v58 + 1);
  }
}

void sub_20840197C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  uint64_t v13;
  void *v15;

  if (__p)
    operator delete(__p);
  v15 = *(void **)v13;
  if (*(_QWORD *)v13)
  {
    *(_QWORD *)(v13 + 8) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(exception_object);
}

double Vec::operator+=(double **a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  double *v4;
  double *v5;
  uint64_t v6;
  double result;

  v2 = *a2;
  v3 = (a2[1] - *a2) >> 3;
  v4 = *a1;
  v5 = a1[1];
  if (v3 != v5 - *a1)
    Vec::operator+=();
  if (v5 != v4)
  {
    v6 = 0;
    if (v3 <= 1)
      v3 = 1;
    do
    {
      result = *(double *)(v2 + (v6 >> 29)) + *v4;
      *v4++ = result;
      v6 += 0x100000000;
      --v3;
    }
    while (v3);
  }
  return result;
}

void ME_Efficient_Model_Trainer::perform_LBFGS(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  const void *v4;
  uint64_t v5;
  unint64_t v7;
  double v8;
  uint64_t i;
  uint64_t j;
  unsigned int v11;
  FILE **v12;
  unsigned int v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  double v22;
  char *v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void **v29;
  char *v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void **v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t k;
  void *v42;
  uint64_t m;
  void *v44;
  void *v46;
  _BYTE *v47;
  void *v48;
  _BYTE *v49;
  void *__p;
  _BYTE *v51;
  void *v52[3];
  void *v53;
  _BYTE *v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  double v58[10];
  char v59[240];
  char v60[240];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = *(const void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v7 = (v5 - (uint64_t)v4) >> 3;
  v55 = 0;
  v56 = 0;
  v57 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v55, v4, v5, v7);
  Vec::Vec((Vec *)&v53, v7, 0.0);
  Vec::Vec((Vec *)v52, v7, 0.0);
  v8 = ME_Efficient_Model_Trainer::FunctionGradient((ME_Efficient_Model_Trainer *)a1, (uint64_t **)&v55, (double **)&v53);
  for (i = 0; i != 240; i += 24)
    Vec::Vec((Vec *)&v60[i], 0, 0.0);
  for (j = 0; j != 240; j += 24)
    Vec::Vec((Vec *)&v59[j], 0, 0.0);
  v11 = 0;
  v12 = (FILE **)MEMORY[0x24BDAC8D8];
  do
  {
    v13 = v11 + 1;
    fprintf(*v12, "%3d  obj(err) = %f (%6.4f)", v11 + 1, -v8, *(double *)(a1 + 336));
    if (*(int *)(a1 + 352) >= 1)
    {
      v14 = ME_Efficient_Model_Trainer::heldout_likelihood((ME_Efficient_Model_Trainer *)a1);
      fprintf(*v12, "  heldout_logl(err) = %f (%6.4f)", v14, *(double *)(a1 + 344));
    }
    fputc(10, *v12);
    if (v54 == v53)
    {
      v17 = 0.0;
    }
    else
    {
      v15 = 0;
      v16 = (v54 - (_BYTE *)v53) >> 3;
      if (v16 <= 1)
        v16 = 1;
      v17 = 0.0;
      do
      {
        v17 = v17 + *(double *)((char *)v53 + (v15 >> 29)) * *(double *)((char *)v53 + (v15 >> 29));
        v15 += 0x100000000;
        --v16;
      }
      while (v16);
    }
    if (sqrt(v17) < 0.0001)
      break;
    approximate_Hg((const Vec *)&v53, (const Vec *)v60, (const Vec *)v59, v58, v11, (double **)&v48);
    Vec::Vec((Vec *)&__p, (v49 - (_BYTE *)v48) >> 3, 0.0);
    v18 = (char *)v48;
    if (v49 != v48)
    {
      v19 = 0;
      v20 = (v49 - (_BYTE *)v48) >> 3;
      v21 = (char *)__p;
      if (v20 <= 1)
        v20 = 1;
      do
      {
        *(double *)&v21[v19 >> 29] = -*(double *)&v18[v19 >> 29];
        v19 += 0x100000000;
        --v20;
      }
      while (v20);
    }
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)v52, (char *)__p, (uint64_t)v51, (v51 - (_BYTE *)__p) >> 3);
    if (__p)
    {
      v51 = __p;
      operator delete(__p);
    }
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    Vec::Vec((Vec *)&__p, v7, 0.0);
    Vec::Vec((Vec *)&v48, v7, 0.0);
    ME_Efficient_Model_Trainer::backtracking_line_search((ME_Efficient_Model_Trainer *)a1, (const Vec *)&v55, (const Vec *)&v53, v8, (const Vec *)v52, (Vec *)&__p, (double **)&v48);
    v8 = v22;
    Vec::Vec((Vec *)&v46, (v51 - (_BYTE *)__p) >> 3, 0.0);
    v23 = (char *)__p;
    v24 = (v51 - (_BYTE *)__p) >> 3;
    v25 = (char *)v55;
    if (v24 != (v56 - (_BYTE *)v55) >> 3)
      __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
    if (v51 != __p)
    {
      v26 = 0;
      v27 = (char *)v46;
      if (v24 <= 1)
        v24 = 1;
      do
      {
        *(double *)&v27[v26 >> 29] = *(double *)&v23[v26 >> 29] - *(double *)&v25[v26 >> 29];
        v26 += 0x100000000;
        --v24;
      }
      while (v24);
    }
    v28 = v11 % 0xA;
    v29 = (void **)&v60[24 * v28];
    if (v29 != &v46)
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v60[24 * v28], (char *)v46, (uint64_t)v47, (v47 - (_BYTE *)v46) >> 3);
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    Vec::Vec((Vec *)&v46, (v49 - (_BYTE *)v48) >> 3, 0.0);
    v30 = (char *)v48;
    v31 = (v49 - (_BYTE *)v48) >> 3;
    v32 = (char *)v53;
    if (v31 != (v54 - (_BYTE *)v53) >> 3)
      __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
    if (v49 != v48)
    {
      v33 = 0;
      v34 = (char *)v46;
      if (v31 <= 1)
        v31 = 1;
      do
      {
        *(double *)&v34[v33 >> 29] = *(double *)&v30[v33 >> 29] - *(double *)&v32[v33 >> 29];
        v33 += 0x100000000;
        --v31;
      }
      while (v31);
    }
    v35 = (void **)&v59[24 * v28];
    if (v35 != &v46)
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v59[24 * v28], (char *)v46, (uint64_t)v47, (v47 - (_BYTE *)v46) >> 3);
    if (v46)
    {
      v47 = v46;
      operator delete(v46);
    }
    v36 = v35[1];
    v37 = v36 - (_BYTE *)*v35;
    if (v36 == *v35)
    {
      v40 = 0.0;
    }
    else
    {
      v38 = 0;
      v39 = v37 >> 3;
      if ((unint64_t)(v37 >> 3) <= 1)
        v39 = 1;
      v40 = 0.0;
      do
      {
        v40 = v40 + *(double *)((char *)*v35 + (v38 >> 29)) * *(double *)((char *)*v29 + (v38 >> 29));
        v38 += 0x100000000;
        --v39;
      }
      while (v39);
    }
    v58[v28] = 1.0 / v40;
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v55, (char *)__p, (uint64_t)v51, (v51 - (_BYTE *)__p) >> 3);
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v53, (char *)v48, (uint64_t)v49, (v49 - (_BYTE *)v48) >> 3);
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    if (__p)
    {
      v51 = __p;
      operator delete(__p);
    }
    v11 = v13;
  }
  while (v13 != 300);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a3, v55, (uint64_t)v56, (v56 - (_BYTE *)v55) >> 3);
  for (k = 0; k != -240; k -= 24)
  {
    v42 = *(void **)&v59[k + 216];
    if (v42)
    {
      *(_QWORD *)&v59[k + 224] = v42;
      operator delete(v42);
    }
  }
  for (m = 0; m != -240; m -= 24)
  {
    v44 = *(void **)&v60[m + 216];
    if (v44)
    {
      *(_QWORD *)&v60[m + 224] = v44;
      operator delete(v44);
    }
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
}

void sub_208401FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;

  v72 = 0;
  while (1)
  {
    v73 = *(void **)(&a41 + v72 + 216);
    if (v73)
    {
      *(_QWORD *)(&a41 + v72 + 224) = v73;
      operator delete(v73);
    }
    v72 -= 24;
    if (v72 == -240)
    {
      v74 = 0;
      while (1)
      {
        v75 = *(void **)(&a71 + v74 + 216);
        if (v75)
        {
          *(_QWORD *)(&a71 + v74 + 224) = v75;
          operator delete(v75);
        }
        v74 -= 24;
        if (v74 == -240)
        {
          if (__p)
            operator delete(__p);
          if (a25)
            operator delete(a25);
          if (a28)
            operator delete(a28);
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

uint64_t crfsuite_train_lbfgs_init(uint64_t a1)
{
  return exchange_options_1(a1, 0, 0);
}

uint64_t exchange_options_1(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c1", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c2", a2 + 8);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 48);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "num_memories", a2 + 16);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "epsilon", a2 + 24);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "period", a2 + 32);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "delta", a2 + 40);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 104))(a1, "linesearch", a2 + 56);
    return (*(uint64_t (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_linesearch", a2 + 64);
  }
  else
  {
    params_add_float((int **)a1, "c1", "Coefficient for L1 regularization.", 0.0);
    params_add_float((int **)a1, "c2", "Coefficient for L2 regularization.", 1.0);
    params_add_int((int **)a1, "max_iterations", 0x7FFFFFFF, "The maximum number of iterations for L-BFGS optimization.");
    params_add_int((int **)a1, "num_memories", 6, "The number of limited memories for approximating the inverse hessian matrix.");
    params_add_float((int **)a1, "epsilon", "Epsilon for testing the convergence of the objective.", 0.00001);
    params_add_int((int **)a1, "period", 10, "The duration of iterations to test the stopping criterion.");
    params_add_float((int **)a1, "delta", "The threshold for the stopping criterion; an L-BFGS iteration stops when the\n"
      "improvement of the log likelihood over the last ${period} iterations is no\n"
      "greater than this threshold.",
      0.00001);
    params_add_string((int **)a1, "linesearch", "MoreThuente", "The line search algorithm used in L-BFGS updates:\n{   'MoreThuente': More and Thuente's method,\n    'Backtracking': Backtracking method with regular Wolfe condition,\n    'StrongBacktracking': Backtracking method with strong Wolfe condition\n}\n");
    return params_add_int((int **)a1, "max_linesearch", 20, "The maximum number of trials for the line search algorithm.");
  }
}

uint64_t crfsuite_train_lbfgs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, double **a6)
{
  clock_t v12;
  size_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  double *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  clock_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  char *__s1[2];
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  clock_t v127;

  v12 = clock();
  v13 = *(int *)(a1 + 44);
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v117 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  *(_OWORD *)__s1 = 0u;
  v116 = 0;
  lbfgs_parameter_init(&v117);
  v14 = (double *)malloc_type_calloc(8uLL, v13, 0x6C3B3EB3uLL);
  if (!v14)
  {
    v82 = 2147483649;
    v83 = 0;
    goto LABEL_21;
  }
  *((_QWORD *)&v126 + 1) = malloc_type_calloc(8uLL, v13, 0x1C6BCD47uLL);
  if (!*((_QWORD *)&v126 + 1))
  {
    v82 = 2147483649;
    v83 = v14;
    v14 = 0;
    goto LABEL_21;
  }
  exchange_options_1(a4, (uint64_t)&v112, -1);
  logging(a5, (uint64_t)"L-BFGS optimization\n", v15, v16, v17, v18, v19, v20, v108);
  logging(a5, (uint64_t)"c1: %f\n", v21, v22, v23, v24, v25, v26, v112);
  logging(a5, (uint64_t)"c2: %f\n", v27, v28, v29, v30, v31, v32, *((uint64_t *)&v112 + 1));
  logging(a5, (uint64_t)"num_memories: %d\n", v33, v34, v35, v36, v37, v38, v113);
  logging(a5, (uint64_t)"max_iterations: %d\n", v39, v40, v41, v42, v43, v44, LODWORD(__s1[0]));
  logging(a5, (uint64_t)"epsilon: %f\n", v45, v46, v47, v48, v49, v50, *((uint64_t *)&v113 + 1));
  logging(a5, (uint64_t)"stop: %d\n", v51, v52, v53, v54, v55, v56, v114);
  logging(a5, (uint64_t)"delta: %f\n", v57, v58, v59, v60, v61, v62, *((uint64_t *)&v114 + 1));
  logging(a5, (uint64_t)"linesearch: %s\n", v63, v64, v65, v66, v67, v68, (uint64_t)__s1[1]);
  logging(a5, (uint64_t)"linesearch.max_iterations: %d\n", v69, v70, v71, v72, v73, v74, v116);
  logging(a5, (uint64_t)"\n", v75, v76, v77, v78, v79, v80, v109);
  LODWORD(v117) = v113;
  *((_QWORD *)&v117 + 1) = *((_QWORD *)&v113 + 1);
  LODWORD(v118) = v114;
  *((_QWORD *)&v118 + 1) = *((_QWORD *)&v114 + 1);
  LODWORD(v119) = __s1[0];
  v81 = __s1[1];
  if (!strcmp(__s1[1], "Backtracking"))
  {
    v84 = 2;
LABEL_10:
    DWORD1(v119) = v84;
    goto LABEL_11;
  }
  if (!strcmp(v81, "StrongBacktracking"))
  {
    v84 = 3;
    goto LABEL_10;
  }
  DWORD1(v119) = 0;
LABEL_11:
  DWORD2(v119) = v116;
  v85 = 0;
  if (*(double *)&v112 > 0.0)
  {
    DWORD1(v119) = 2;
    v85 = v112;
  }
  *(_QWORD *)&v123 = v85;
  *(_QWORD *)&v124 = a1;
  *((_QWORD *)&v124 + 1) = a2;
  *(_QWORD *)&v126 = *((_QWORD *)&v112 + 1);
  *(_QWORD *)&v125 = a3;
  *((_QWORD *)&v125 + 1) = a5;
  v127 = clock();
  v86 = lbfgs(v13, v14, 0, (double (*)(_QWORD, _QWORD, _QWORD, _QWORD, double))lbfgs_evaluate, (uint64_t (*)(uint64_t, double *, uint64_t *, _QWORD, uint64_t, uint64_t, double, double, double, double))lbfgs_progress, (uint64_t)&v124, &v117);
  if ((_DWORD)v86 == -997)
  {
    v93 = "L-BFGS terminated with the maximum number of iterations\n";
  }
  else if ((_DWORD)v86 == 1)
  {
    v93 = "L-BFGS terminated with the stopping criteria\n";
  }
  else if ((_DWORD)v86)
  {
    v110 = v86;
    v93 = "L-BFGS terminated with error code (%d)\n";
  }
  else
  {
    v93 = "L-BFGS resulted in convergence\n";
  }
  logging(a5, (uint64_t)v93, v87, v88, v89, v90, v91, v92, v110);
  memcpy(v14, *((const void **)&v126 + 1), 8 * v13);
  v94 = clock();
  logging(a5, (uint64_t)"Total seconds required for training: %.3f\n", v95, v96, v97, v98, v99, v100, COERCE__INT64((double)(v94 - v12) / 1000000.0));
  logging(a5, (uint64_t)"\n", v101, v102, v103, v104, v105, v106, v111);
  v82 = 0;
  v83 = (double *)*((_QWORD *)&v126 + 1);
LABEL_21:
  free(v83);
  *a6 = v14;
  return v82;
}

double lbfgs_evaluate(double *a1, double *a2, double *a3, int a4)
{
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;

  (*(void (**)(void))(*(_QWORD *)a1 + 72))();
  v8 = a1[4];
  if (v8 <= 0.0)
    return 0.0;
  if (a4 < 1)
  {
    v11 = 0.0;
  }
  else
  {
    v9 = v8 + v8;
    v10 = a4;
    v11 = 0.0;
    do
    {
      *a3 = *a3 + v9 * *a2;
      ++a3;
      v12 = *a2++;
      v11 = v11 + v12 * v12;
      --v10;
    }
    while (v10);
    v8 = a1[4];
  }
  return v8 * v11 + 0.0;
}

uint64_t lbfgs_progress(uint64_t *a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  clock_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  _DWORD *v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  double *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v84;

  v19 = clock();
  v26 = *a1;
  v28 = (_DWORD *)a1[2];
  v27 = (uint64_t *)a1[3];
  v29 = v19 - a1[6];
  a1[6] = v19;
  if (a8 < 1)
  {
    v30 = 0;
  }
  else
  {
    LODWORD(v30) = 0;
    v31 = (_QWORD *)a1[5];
    v32 = a8;
    v33 = (double *)a2;
    do
    {
      *v31++ = *(_QWORD *)v33;
      v34 = *v33++;
      if (v34 == 0.0)
        v30 = v30;
      else
        v30 = (v30 + 1);
      --v32;
    }
    while (v32);
  }
  logging(v27, (uint64_t)"***** Iteration #%d *****\n", v20, v21, v22, v23, v24, v25, a9);
  logging(v27, (uint64_t)"Loss: %f\n", v35, v36, v37, v38, v39, v40, *(uint64_t *)&a3);
  logging(v27, (uint64_t)"Feature norm: %f\n", v41, v42, v43, v44, v45, v46, *(uint64_t *)&a4);
  logging(v27, (uint64_t)"Error norm: %f\n", v47, v48, v49, v50, v51, v52, *(uint64_t *)&a5);
  logging(v27, (uint64_t)"Active features: %d\n", v53, v54, v55, v56, v57, v58, v30);
  logging(v27, (uint64_t)"Line search trials: %d\n", v59, v60, v61, v62, v63, v64, a10);
  logging(v27, (uint64_t)"Line search step: %f\n", v65, v66, v67, v68, v69, v70, *(uint64_t *)&a6);
  logging(v27, (uint64_t)"Seconds required for this iteration: %.3f\n", v71, v72, v73, v74, v75, v76, COERCE__INT64((double)v29 / 1000000.0));
  if (v28)
    holdout_evaluation(v26, v28, a2, v27);
  logging(v27, (uint64_t)"\n", v77, v78, v79, v80, v81, v82, v84);
  return 0;
}

uint64_t crfsuite_train_passive_aggressive_init(uint64_t a1)
{
  return exchange_options_2(a1, 0, 0);
}

uint64_t exchange_options_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "type", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c", a2 + 8);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "error_sensitive", a2 + 16);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "averaging", a2 + 20);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 24);
    return (*(uint64_t (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "epsilon", a2 + 32);
  }
  else
  {
    params_add_int((int **)a1, "type", 1, "The strategy for updating feature weights: {\n    0: PA without slack variables,\n    1: PA type I,\n    2: PA type II\n}.\n");
    params_add_float((int **)a1, "c", "The aggressiveness parameter.", 1.0);
    params_add_int((int **)a1, "error_sensitive", 1, "Consider the number of incorrect labels to the cost function.");
    params_add_int((int **)a1, "averaging", 1, "Compute the average of feature weights (similarly to Averaged Perceptron).");
    params_add_int((int **)a1, "max_iterations", 100, "The maximum number of iterations.");
    return params_add_float((int **)a1, "epsilon", "The stopping criterion (the mean loss).", 0.0);
  }
}

uint64_t crfsuite_train_passive_aggressive(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, _QWORD *a5, char **a6)
{
  size_t v10;
  size_t v11;
  clock_t v12;
  void *v13;
  char *v14;
  double *v15;
  double *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double (*v25)(double, double);
  void (*v26)(uint64_t, double, __n128, double);
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  clock_t v71;
  int v72;
  double v73;
  unsigned int *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  int *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __n128 v85;
  int v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int *v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  int *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double *v107;
  double *v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  double *v124;
  uint64_t v125;
  double v126;
  clock_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  clock_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  clock_t v173;
  char *v174;
  clock_t v177;
  size_t size;
  uint64_t v179;
  void (*v180)(uint64_t, double, __n128, double);
  double (*v181)(double, double);
  int v182;
  double v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  double v189;

  v182 = *(_DWORD *)(a2 + 16);
  v11 = *(int *)(a1 + 44);
  v10 = *(int *)(a1 + 48);
  v189 = 0.0;
  v187 = 0u;
  v188 = 0u;
  v12 = clock();
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v13 = malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)&v185 = v13;
  v14 = 0;
  *(_QWORD *)&v186 = malloc_type_calloc(v11, 8uLL, 0x100004000313F17uLL);
  size = v11;
  DWORD2(v186) = v11;
  if (!(_QWORD)v186)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
LABEL_60:
    free(v14);
    v165 = 2147483649;
    v14 = v17;
    v17 = 0;
    goto LABEL_61;
  }
  v173 = v12;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  if (!v13)
    goto LABEL_60;
  exchange_options_2(a4, (uint64_t)&v187, -1);
  v15 = (double *)malloc_type_calloc(8uLL, size, 0xC76A707uLL);
  v16 = (double *)malloc_type_calloc(8uLL, size, 0xDB004370uLL);
  v17 = (char *)malloc_type_calloc(8uLL, size, 0xFB6A7FFDuLL);
  v18 = (char *)malloc_type_calloc(4uLL, v10, 0x86F33618uLL);
  v14 = v18;
  if (!v15 || !v16 || !v17 || !v18)
    goto LABEL_60;
  if ((_DWORD)v188)
    v25 = cost_sensitive;
  else
    v25 = (double (*)(double, double))cost_insensitive;
  v26 = (void (*)(uint64_t, double, __n128, double))tau0;
  if ((_DWORD)v187 == 2)
    v26 = (void (*)(uint64_t, double, __n128, double))tau2;
  if ((_DWORD)v187 == 1)
    v26 = (void (*)(uint64_t, double, __n128, double))tau1;
  v180 = v26;
  v181 = v25;
  v27 = a5;
  logging(a5, (uint64_t)"Passive Aggressive\n", v19, v20, v21, v22, v23, v24, v167);
  logging(a5, (uint64_t)"type: %d\n", v28, v29, v30, v31, v32, v33, v187);
  logging(a5, (uint64_t)"c: %f\n", v34, v35, v36, v37, v38, v39, *((uint64_t *)&v187 + 1));
  logging(a5, (uint64_t)"error_sensitive: %d\n", v40, v41, v42, v43, v44, v45, v188);
  logging(a5, (uint64_t)"averaging: %d\n", v46, v47, v48, v49, v50, v51, DWORD1(v188));
  logging(a5, (uint64_t)"max_iterations: %d\n", v52, v53, v54, v55, v56, v57, DWORD2(v188));
  logging(a5, (uint64_t)"epsilon: %f\n", v58, v59, v60, v61, v62, v63, *(uint64_t *)&v189);
  logging(a5, (uint64_t)"\n", v64, v65, v66, v67, v68, v69, v168);
  LODWORD(v179) = 0;
  v70 = 1;
  v174 = v17;
  while ((int)v179 < SDWORD2(v188))
  {
    v71 = clock();
    dataset_shuffle(a2);
    v177 = v71;
    if (v182 < 1)
    {
      v73 = 0.0;
    }
    else
    {
      v72 = 0;
      v73 = 0.0;
      do
      {
        v183 = 0.0;
        v74 = (unsigned int *)dataset_get((_QWORD *)a2, v72);
        (*(void (**)(uint64_t, double *, double))(a1 + 88))(a1, v15, 1.0);
        (*(void (**)(uint64_t, unsigned int *))(a1 + 96))(a1, v74);
        (*(void (**)(uint64_t, char *, double *))(a1 + 112))(a1, v14, &v183);
        v75 = *v74;
        if ((int)v75 >= 1)
        {
          v76 = 0;
          v77 = 0;
          v78 = 4 * v75;
          do
          {
            if (*(_DWORD *)(*((_QWORD *)v74 + 2) + v76) != *(_DWORD *)&v14[v76])
              ++v77;
            v76 += 4;
          }
          while (v78 != v76);
          if (v77)
          {
            (*(void (**)(uint64_t))(a1 + 104))(a1);
            v79 = v181(v183 - 0.0, (double)v77);
            v80 = DWORD2(v184);
            if (SDWORD2(v184) >= 1)
            {
              v81 = (int *)v184;
              v82 = v186;
              do
              {
                v83 = *v81++;
                *(_QWORD *)(v82 + 8 * v83) = 0;
                --v80;
              }
              while (v80);
            }
            DWORD2(v184) = 0;
            *((_QWORD *)&v185 + 1) = 0x3FF0000000000000;
            (*(void (**)(uint64_t, unsigned int *, _QWORD, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))(a1, v74, *((_QWORD *)v74 + 2), delta_collect_0, &v184);
            *((_QWORD *)&v185 + 1) = 0xBFF0000000000000;
            v84 = (*(uint64_t (**)(uint64_t, unsigned int *, char *, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))(a1, v74, v14, delta_collect_0, &v184);
            v86 = DWORD2(v184);
            if (SDWORD2(v184) < 1)
            {
              DWORD2(v184) = 0;
              v85.n128_u64[0] = 0;
            }
            else
            {
              v87 = 0;
              v88 = 0;
              do
              {
                v89 = v185;
                v90 = *(_DWORD *)(v184 + 4 * v87);
                if (!*(_BYTE *)(v185 + v90))
                {
                  *(_DWORD *)(v184 + 4 * v88++) = v90;
                  *(_BYTE *)(v89 + v90) = 1;
                  v86 = DWORD2(v184);
                }
                ++v87;
              }
              while (v87 < v86);
              DWORD2(v184) = v88;
              v85.n128_u64[0] = 0;
              if (v88 >= 1)
              {
                v91 = 0;
                do
                  *(_BYTE *)(v185 + *(int *)(v184 + 4 * v91++)) = 0;
                while (v91 < SDWORD2(v184));
                v92 = DWORD2(v184);
                if (SDWORD2(v184) >= 1)
                {
                  v85.n128_u64[0] = 0;
                  v93 = (int *)v184;
                  do
                  {
                    v94 = *v93++;
                    v85.n128_f64[0] = v85.n128_f64[0] + *(double *)(v186 + 8 * v94) * *(double *)(v186 + 8 * v94);
                    --v92;
                  }
                  while (v92);
                }
              }
            }
            v180(v84, v79, v85, *((double *)&v187 + 1));
            v96 = DWORD2(v184);
            if (SDWORD2(v184) >= 1)
            {
              v97 = (int *)v184;
              v98 = v186;
              do
              {
                v99 = *v97++;
                v15[v99] = v15[v99] + v95 * *(double *)(v98 + 8 * v99);
                v16[v99] = v16[v99] + v95 * (double)v70 * *(double *)(v98 + 8 * v99);
                --v96;
              }
              while (v96);
            }
            v73 = v73 + v79;
          }
        }
        ++v70;
        ++v72;
      }
      while (v72 != v182);
    }
    v100 = DWORD1(v188);
    v17 = v174;
    memcpy(v174, v15, 8 * size);
    if (v100 && (int)size >= 1)
    {
      v107 = v16;
      v108 = (double *)v174;
      v109 = size;
      do
      {
        v110 = *v107++;
        *v108 = *v108 + -1.0 / (double)v70 * v110;
        ++v108;
        --v109;
      }
      while (v109);
    }
    v179 = (v179 + 1);
    v27 = a5;
    logging(a5, (uint64_t)"***** Iteration #%d *****\n", v101, v102, v103, v104, v105, v106, v179);
    logging(a5, (uint64_t)"Loss: %f\n", v111, v112, v113, v114, v115, v116, *(uint64_t *)&v73);
    v123 = 0.0;
    if ((int)size >= 1)
    {
      v124 = v15;
      v125 = size;
      do
      {
        v126 = *v124++;
        v123 = v123 + v126 * v126;
        --v125;
      }
      while (v125);
    }
    logging(a5, (uint64_t)"Feature norm: %f\n", v117, v118, v119, v120, v121, v122, COERCE__INT64(sqrt(v123)));
    v127 = clock();
    logging(a5, (uint64_t)"Seconds required for this iteration: %.3f\n", v128, v129, v130, v131, v132, v133, COERCE__INT64((double)(v127 - v177) / 1000000.0));
    if (a3)
      holdout_evaluation(a1, a3, (uint64_t)v174, a5);
    logging(a5, (uint64_t)"\n", v134, v135, v136, v137, v138, v139, v169);
    if (v73 / (double)v182 < v189)
    {
      logging(a5, (uint64_t)"Terminated with the stopping criterion\n", v140, v141, v142, v143, v144, v145, v170);
      logging(a5, (uint64_t)"\n", v146, v147, v148, v149, v150, v151, v171);
      break;
    }
  }
  v152 = clock();
  logging(v27, (uint64_t)"Total seconds required for training: %.3f\n", v153, v154, v155, v156, v157, v158, COERCE__INT64((double)(v152 - v173) / 1000000.0));
  logging(v27, (uint64_t)"\n", v159, v160, v161, v162, v163, v164, v172);
  v165 = 0;
LABEL_61:
  free(v14);
  free(v16);
  free(v15);
  *a6 = v17;
  delta_finish((void **)&v184);
  return v165;
}

double cost_sensitive(double a1, double a2)
{
  return sqrt(a2) + a1;
}

double cost_insensitive(double a1)
{
  return a1 + 1.0;
}

double tau1(double a1, double a2, double a3)
{
  double result;

  result = a1 / a2;
  if (result > a3)
    return a3;
  return result;
}

double tau2(double a1, double a2, double a3)
{
  return a1 / (0.5 / a3 + a2);
}

double tau0(double a1, double a2)
{
  return a1 / a2;
}

double delta_collect_0(uint64_t a1, int a2, double a3)
{
  int v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  double result;

  v6 = *(_DWORD *)(a1 + 8);
  v7 = *(_DWORD *)(a1 + 12);
  v8 = *(void **)a1;
  if (v7 <= v6)
  {
    v9 = 2 * v7 + 2;
    *(_DWORD *)(a1 + 12) = v9;
    v8 = malloc_type_realloc(v8, 4 * v9, 0x100004052888210uLL);
    *(_QWORD *)a1 = v8;
    v6 = *(_DWORD *)(a1 + 8);
  }
  *(_DWORD *)(a1 + 8) = v6 + 1;
  *((_DWORD *)v8 + v6) = a2;
  v10 = *(_QWORD *)(a1 + 32);
  result = *(double *)(v10 + 8 * a2) + *(double *)(a1 + 24) * a3;
  *(double *)(v10 + 8 * a2) = result;
  return result;
}

void *lbfgs_malloc(int a1)
{
  size_t v1;
  void *v2;
  void *v3;

  v1 = 8 * a1;
  v2 = malloc_type_malloc(v1, 0xAD82551FuLL);
  v3 = v2;
  if (v2)
    bzero(v2, v1);
  return v3;
}

void *vecalloc(size_t a1)
{
  void *v2;
  void *v3;

  v2 = malloc_type_malloc(a1, 0xAD82551FuLL);
  v3 = v2;
  if (v2)
    bzero(v2, a1);
  return v3;
}

double lbfgs_parameter_init(_OWORD *a1)
{
  double result;

  a1[4] = xmmword_2084197F0;
  a1[5] = unk_208419800;
  a1[6] = xmmword_208419810;
  *a1 = _defparam;
  a1[1] = unk_2084197C0;
  result = dbl_2084197E0[0];
  a1[2] = xmmword_2084197D0;
  a1[3] = *(_OWORD *)dbl_2084197E0;
  return result;
}

uint64_t lbfgs(uint64_t a1, double *a2, double *a3, double (*a4)(_QWORD, _QWORD, _QWORD, _QWORD, double), uint64_t (*a5)(uint64_t, double *, uint64_t *, _QWORD, uint64_t, uint64_t, double, double, double, double), uint64_t a6, __int128 *a7)
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  int v20;
  uint64_t (*v21)(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t);
  uint64_t *v22;
  void *v23;
  double *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  double v29;
  double v30;
  uint64_t v31;
  double *v32;
  double v33;
  uint64_t v34;
  double *v35;
  double *v36;
  uint64_t v37;
  double v38;
  double *v39;
  double *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double *v47;
  uint64_t v48;
  double v49;
  double *v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double *v65;
  uint64_t v66;
  double v67;
  double *v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  double *v76;
  double *v77;
  double *v78;
  double *v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  double *v84;
  uint64_t *v85;
  double *v86;
  double *v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double *v93;
  uint64_t v94;
  double v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  double v100;
  double *v101;
  double *v102;
  uint64_t v103;
  double *v104;
  double *v105;
  uint64_t v106;
  double v107;
  double v108;
  int v109;
  int i;
  double *v111;
  double *v112;
  double v113;
  double *v114;
  uint64_t v115;
  double v116;
  double v117;
  double v118;
  char *v119;
  double v120;
  double *v121;
  double v122;
  double *v123;
  uint64_t v124;
  double v125;
  double *v126;
  uint64_t v127;
  double v128;
  int j;
  double *v130;
  double v131;
  double *v132;
  uint64_t v133;
  double v134;
  double v135;
  double v136;
  char *v137;
  double *v138;
  double v139;
  double *v140;
  uint64_t v141;
  double v142;
  double *v143;
  uint64_t v144;
  double *v145;
  double *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  void **v153;
  void *v154;
  double *v155;
  int v156;
  int v157;
  uint64_t (*v158)(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t);
  int v159;
  void *v160;
  void *v161;
  double *v162;
  uint64_t *v163;
  double *v164;
  double *v165;
  void **v166;
  uint64_t v167;
  uint64_t v168;
  double (*v169)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  uint64_t (*v170)(uint64_t, double *, uint64_t *, _QWORD, uint64_t, uint64_t, double, double, double, double);
  double v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  double v179[3];

  if (a7)
  {
    v12 = a7[5];
    v176 = a7[4];
    v177 = v12;
    v178 = a7[6];
    v13 = a7[1];
    v172 = *a7;
    v173 = v13;
    v14 = a7[3];
    v174 = a7[2];
    v175 = v14;
    v15 = v172;
  }
  else
  {
    v176 = xmmword_2084197F0;
    v177 = unk_208419800;
    v178 = xmmword_208419810;
    v172 = _defparam;
    v173 = unk_2084197C0;
    v174 = xmmword_2084197D0;
    v175 = *(_OWORD *)dbl_2084197E0;
    v15 = 6;
  }
  v170 = a5;
  v171 = 0.0;
  v168 = a6;
  v167 = a1;
  v169 = a4;
  if ((int)a1 < 1)
    return 4294966276;
  if (*((double *)&v172 + 1) < 0.0)
    return 4294966279;
  v17 = v173;
  if ((v173 & 0x80000000) != 0)
    return 4294966280;
  if (*((double *)&v173 + 1) < 0.0)
    return 4294966281;
  if (*(double *)&v175 < 0.0)
    return 4294966283;
  if (*((double *)&v175 + 1) < *(double *)&v175)
    return 4294966284;
  if (*(double *)&v176 < 0.0)
    return 4294966285;
  if ((DWORD1(v174) & 0xFFFFFFFE) != 2
    || (v16 = 4294966286, *((double *)&v176 + 1) > *(double *)&v176) && *((double *)&v176 + 1) < 1.0)
  {
    if (*(double *)&v177 < 0.0)
      return 4294966287;
    if (*((double *)&v177 + 1) < 0.0)
      return 4294966288;
    if (SDWORD2(v174) < 1)
      return 4294966289;
    v18 = *(double *)&v178;
    if (*(double *)&v178 < 0.0)
      return 4294966290;
    v16 = 4294966291;
    if ((DWORD2(v178) & 0x80000000) == 0 && SDWORD2(v178) <= (int)a1)
    {
      v20 = HIDWORD(v178);
      if ((HIDWORD(v178) & 0x80000000) != 0)
      {
        HIDWORD(v178) = a1;
        v20 = a1;
      }
      else if (HIDWORD(v178) > a1)
      {
        return 4294966292;
      }
      if (*(double *)&v178 == 0.0)
      {
        v156 = DWORD2(v178);
        v157 = v20;
        if (DWORD1(v174) <= 3)
        {
          v21 = off_24C09DCB8[SDWORD1(v174)];
          goto LABEL_41;
        }
      }
      else if (DWORD1(v174) == 2)
      {
        v156 = DWORD2(v178);
        v157 = v20;
        v21 = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t))line_search_backtracking_owlqn;
LABEL_41:
        v158 = v21;
        v179[0] = 0.0;
        v164 = (double *)vecalloc(8 * a1);
        v22 = (uint64_t *)vecalloc(8 * a1);
        v161 = vecalloc(8 * a1);
        v162 = (double *)vecalloc(8 * a1);
        v160 = vecalloc(8 * a1);
        v165 = 0;
        v16 = 4294966274;
        v163 = v22;
        if (!v164 || !v22)
        {
          v24 = 0;
          v166 = 0;
          goto LABEL_65;
        }
        v23 = v161;
        if (v161 && v162)
        {
          v24 = 0;
          v166 = 0;
          if (v160)
          {
            if (*(double *)&v178 == 0.0)
            {
              v165 = 0;
            }
            else
            {
              v24 = (double *)vecalloc(8 * a1);
              v165 = v24;
              if (!v24)
              {
                v165 = 0;
LABEL_62:
                v166 = 0;
LABEL_65:
                v23 = v161;
                goto LABEL_174;
              }
            }
            v24 = (double *)vecalloc(32 * v15);
            v166 = (void **)v24;
            if (v24)
            {
              if (v15 < 1)
              {
LABEL_60:
                if ((int)v17 < 1)
                  v155 = 0;
                else
                  v155 = (double *)vecalloc(8 * v17);
                v29 = 0.0;
                v30 = a4(a6, a2, v163, a1, 0.0);
                v171 = v30;
                if (v18 != 0.0)
                {
                  if (v156 < v157)
                  {
                    v31 = v157 - (uint64_t)v156;
                    v32 = &a2[v156];
                    do
                    {
                      v33 = *v32++;
                      v29 = v29 + fabs(v33);
                      --v31;
                    }
                    while (v31);
                  }
                  v30 = v30 + v29 * v18;
                  v171 = v30;
                  owlqn_pseudo_gradient(v165, (uint64_t)a2, v163, a1, v156, v157, v18);
                }
                v34 = a1;
                if (v155)
                {
                  *v155 = v30;
                  v18 = *(double *)&v178;
                }
                if (v18 == 0.0)
                {
                  v36 = v162;
                  v35 = (double *)v163;
                  v37 = a1;
                  do
                  {
                    v38 = *v35++;
                    *v36++ = -v38;
                    --v37;
                  }
                  while (v37);
                }
                else
                {
                  v39 = v165;
                  v40 = v162;
                  v41 = a1;
                  do
                  {
                    v42 = *v39++;
                    *v40++ = -v42;
                    --v41;
                  }
                  while (v41);
                }
                v43 = 0;
                v44 = 0.0;
                do
                {
                  v44 = v44 + a2[v43] * a2[v43];
                  ++v43;
                }
                while (a1 != v43);
                v45 = sqrt(v44);
                v46 = 0.0;
                if (*(double *)&v178 == 0.0)
                {
                  v47 = (double *)v163;
                  v48 = a1;
                  do
                  {
                    v49 = *v47++;
                    v46 = v46 + v49 * v49;
                    --v48;
                  }
                  while (v48);
                }
                else
                {
                  v50 = v165;
                  v51 = a1;
                  do
                  {
                    v52 = *v50++;
                    v46 = v46 + v52 * v52;
                    --v51;
                  }
                  while (v51);
                }
                v53 = sqrt(v46);
                if (v45 < 1.0)
                  v45 = 1.0;
                if (v53 / v45 <= *((double *)&v172 + 1))
                {
                  v16 = 2;
                }
                else
                {
                  v54 = 0;
                  v55 = 0.0;
                  do
                  {
                    v55 = v55 + v162[v54] * v162[v54];
                    ++v54;
                  }
                  while (a1 != v54);
                  v159 = 0;
                  v56 = 1.0 / sqrt(v55);
                  v57 = 1;
                  while (1)
                  {
                    v58 = 0;
                    v59 = v15 >= (int)v57 ? v57 : v15;
                    v60 = v59 <= 1 ? 1 : v59;
                    v179[0] = v56;
                    do
                    {
                      v164[v58] = a2[v58];
                      ++v58;
                    }
                    while (a1 != v58);
                    v61 = 0;
                    do
                    {
                      *((_QWORD *)v161 + v61) = v163[v61];
                      ++v61;
                    }
                    while (a1 != v61);
                    if (*(double *)&v178 == 0.0)
                    {
                      v16 = ((uint64_t (*)(uint64_t, double *, double *, uint64_t *, double *, double *, double *, double))v158)(a1, a2, &v171, v163, v162, v179, v164, *(double *)&v178);
                    }
                    else
                    {
                      v16 = ((uint64_t (*)(uint64_t, double *, double *, uint64_t *, double *, double *, double *, double *, double, void *, uint64_t *, __int128 *))v158)(a1, a2, &v171, v163, v162, v179, v164, v165, *(double *)&v178, v160, &v167, &v172);
                      owlqn_pseudo_gradient(v165, (uint64_t)a2, v163, a1, SDWORD2(v178), SHIDWORD(v178), *(double *)&v178);
                    }
                    if ((v16 & 0x80000000) != 0)
                      break;
                    v62 = 0;
                    v63 = 0.0;
                    do
                    {
                      v63 = v63 + a2[v62] * a2[v62];
                      ++v62;
                    }
                    while (a1 != v62);
                    if (*(double *)&v178 == 0.0)
                    {
                      v64 = 0.0;
                      v65 = (double *)v163;
                      v66 = a1;
                      do
                      {
                        v67 = *v65++;
                        v64 = v64 + v67 * v67;
                        --v66;
                      }
                      while (v66);
                    }
                    else
                    {
                      v64 = 0.0;
                      v68 = v165;
                      v69 = a1;
                      do
                      {
                        v70 = *v68++;
                        v64 = v64 + v70 * v70;
                        --v69;
                      }
                      while (v69);
                    }
                    v71 = sqrt(v63);
                    v72 = sqrt(v64);
                    if (v170)
                    {
                      v73 = v170(v168, a2, v163, v167, v57, v16, v171, v71, v72, v179[0]);
                      if ((_DWORD)v73)
                      {
                        v16 = v73;
                        goto LABEL_173;
                      }
                    }
                    if (v71 >= 1.0)
                      v74 = v71;
                    else
                      v74 = 1.0;
                    if (v72 / v74 <= *((double *)&v172 + 1))
                    {
                      v16 = 0;
                      goto LABEL_173;
                    }
                    v24 = v155;
                    if (v155)
                    {
                      v75 = ((int)v57 % (int)v173);
                      if ((int)v173 <= (int)v57 && (v155[v75] - v171) / v171 < *((double *)&v173 + 1))
                      {
                        v16 = 1;
                        goto LABEL_65;
                      }
                      v155[v75] = v171;
                    }
                    if ((_DWORD)v174 && (int)v174 <= (int)v57)
                    {
                      v16 = 4294966299;
                      goto LABEL_173;
                    }
                    v76 = (double *)v166[4 * v159 + 1];
                    v77 = a2;
                    v78 = v164;
                    v79 = v76;
                    v80 = a1;
                    do
                    {
                      v81 = *v77++;
                      v82 = v81;
                      v83 = *v78++;
                      *v79++ = v82 - v83;
                      --v80;
                    }
                    while (v80);
                    v84 = (double *)v166[4 * v159 + 2];
                    v85 = v163;
                    v86 = (double *)v161;
                    v87 = v84;
                    v88 = a1;
                    do
                    {
                      v89 = *(double *)v85++;
                      v90 = v89;
                      v91 = *v86++;
                      *v87++ = v90 - v91;
                      --v88;
                    }
                    while (v88);
                    v92 = 0.0;
                    v93 = v84;
                    v94 = a1;
                    do
                    {
                      v95 = *v93++;
                      v96 = v95;
                      v97 = *v76++;
                      v92 = v92 + v96 * v97;
                      --v94;
                    }
                    while (v94);
                    v98 = 0.0;
                    v99 = a1;
                    do
                    {
                      v100 = *v84++;
                      v98 = v98 + v100 * v100;
                      --v99;
                    }
                    while (v99);
                    *(double *)&v166[4 * v159 + 3] = v92;
                    v101 = v165;
                    v102 = v162;
                    v103 = a1;
                    if (*(double *)&v178 == 0.0)
                    {
                      v104 = (double *)v163;
                      v105 = v162;
                      v106 = a1;
                      do
                      {
                        v107 = *v104++;
                        *v105++ = -v107;
                        --v106;
                      }
                      while (v106);
                    }
                    else
                    {
                      do
                      {
                        v108 = *v101++;
                        *v102++ = -v108;
                        --v103;
                      }
                      while (v103);
                    }
                    v109 = (v159 + 1) % v15;
                    v159 = v109;
                    if (v15 >= 1)
                    {
                      for (i = 0; i != v60; ++i)
                      {
                        v109 = (v15 - 1 + v109) % v15;
                        v111 = (double *)&v166[4 * v109];
                        v112 = (double *)*((_QWORD *)v111 + 1);
                        *v111 = 0.0;
                        v113 = 0.0;
                        v114 = v162;
                        v115 = a1;
                        do
                        {
                          v116 = *v112++;
                          v117 = v116;
                          v118 = *v114++;
                          v113 = v113 + v117 * v118;
                          *v111 = v113;
                          --v115;
                        }
                        while (v115);
                        v119 = (char *)&v166[4 * v109];
                        v120 = v113 / *((double *)v119 + 3);
                        *v111 = v120;
                        v121 = (double *)*((_QWORD *)v119 + 2);
                        v122 = -v120;
                        v123 = v162;
                        v124 = a1;
                        do
                        {
                          v125 = *v121++;
                          *v123 = *v123 + v122 * v125;
                          ++v123;
                          --v124;
                        }
                        while (v124);
                      }
                    }
                    v57 = (v57 + 1);
                    v126 = v162;
                    v127 = a1;
                    v128 = v92 / v98;
                    do
                    {
                      *v126 = v128 * *v126;
                      ++v126;
                      --v127;
                    }
                    while (v127);
                    if (v15 >= 1)
                    {
                      for (j = 0; j != v60; ++j)
                      {
                        v130 = (double *)v166[4 * v109 + 2];
                        v131 = 0.0;
                        v132 = v162;
                        v133 = a1;
                        do
                        {
                          v134 = *v130++;
                          v135 = v134;
                          v136 = *v132++;
                          v131 = v131 + v135 * v136;
                          --v133;
                        }
                        while (v133);
                        v137 = (char *)&v166[4 * v109];
                        v138 = (double *)*((_QWORD *)v137 + 1);
                        v139 = *(double *)v137 - v131 / *((double *)v137 + 3);
                        v140 = v162;
                        v141 = a1;
                        do
                        {
                          v142 = *v138++;
                          *v140 = *v140 + v139 * v142;
                          ++v140;
                          --v141;
                        }
                        while (v141);
                        v109 = (v109 + 1) % v15;
                      }
                    }
                    v56 = 1.0;
                    if (*(double *)&v178 != 0.0 && SDWORD2(v178) < SHIDWORD(v178))
                    {
                      v143 = &v162[SDWORD2(v178)];
                      v144 = SHIDWORD(v178) - (uint64_t)SDWORD2(v178);
                      v145 = &v165[SDWORD2(v178)];
                      do
                      {
                        if (*v143 * *v145 >= 0.0)
                          *v143 = 0.0;
                        ++v143;
                        ++v145;
                        --v144;
                      }
                      while (v144);
                    }
                  }
                  v146 = v164;
                  v147 = a1;
                  do
                  {
                    v148 = *(_QWORD *)v146++;
                    *(_QWORD *)a2++ = v148;
                    --v147;
                  }
                  while (v147);
                  v149 = (uint64_t *)v161;
                  v150 = v163;
                  do
                  {
                    v151 = *v149++;
                    *v150++ = v151;
                    --v34;
                  }
                  while (v34);
                }
LABEL_173:
                v23 = v161;
                v24 = v155;
                goto LABEL_174;
              }
              v25 = 0;
              while (1)
              {
                v26 = (char *)&v166[v25];
                *(_QWORD *)v26 = 0;
                *((_QWORD *)v26 + 3) = 0;
                *((_QWORD *)v26 + 1) = vecalloc(8 * a1);
                v27 = vecalloc(8 * a1);
                *((_QWORD *)v26 + 2) = v27;
                if (!v166[v25 + 1] || v27 == 0)
                  break;
                v25 += 4;
                if (4 * v15 == v25)
                  goto LABEL_60;
              }
              v24 = 0;
              v16 = 4294966274;
              goto LABEL_65;
            }
            goto LABEL_62;
          }
        }
        else
        {
          v24 = 0;
          v166 = 0;
        }
LABEL_174:
        if (a3)
          *a3 = v171;
        free(v24);
        if (v166)
        {
          if (v15 >= 1)
          {
            v152 = v15;
            v153 = v166 + 2;
            do
            {
              free(*(v153 - 1));
              v154 = *v153;
              v153 += 4;
              free(v154);
              --v152;
            }
            while (v152);
          }
          free(v166);
        }
        free(v165);
        free(v160);
        free(v162);
        free(v23);
        free(v163);
        free(v164);
        return v16;
      }
      return 4294966282;
    }
  }
  return v16;
}

uint64_t line_search_morethuente(int a1, _QWORD *a2, double *a3, double *a4, double *a5, double *a6, uint64_t *a7, __n128 a8, uint64_t a9, uint64_t a10, unsigned int *a11, uint64_t a12)
{
  uint64_t v15;
  double v16;
  double *v17;
  double *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  int v25;
  int updated;
  double v27;
  double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double *v43;
  double *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double *v49;
  double *v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v57;
  double v61;
  double v63;
  int v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  int v81[3];

  if (*a6 <= 0.0)
    return 4294966301;
  v15 = a1;
  v16 = 0.0;
  if (a1 < 1)
    goto LABEL_9;
  v17 = a4;
  v18 = a5;
  v19 = a1;
  do
  {
    v20 = *v17++;
    v21 = v20;
    v22 = *v18++;
    v16 = v16 + v21 * v22;
    --v19;
  }
  while (v19);
  if (v16 <= 0.0)
  {
LABEL_9:
    v25 = 0;
    LODWORD(v23) = 0;
    updated = 0;
    v81[0] = 0;
    v27 = *a3;
    v28 = v16 * *(double *)(a12 + 64);
    v29 = *(double *)(a12 + 56) - *(double *)(a12 + 48);
    v63 = v29 + v29;
    v76 = 0.0;
    v79 = 0.0;
    v74 = v16;
    v75 = v27;
    v77 = v16;
    v78 = v27;
    v67 = 1;
LABEL_10:
    v31 = v29;
    while (1)
    {
      v32 = v79;
      if (v25)
      {
        if (v79 > v76)
          v33 = v76;
        else
          v33 = v79;
        if (v79 < v76)
          v34 = v76;
        else
          v34 = v79;
        a8.n128_f64[0] = *a6;
      }
      else
      {
        a8.n128_f64[0] = *a6;
        v34 = *a6 + (*a6 - v79) * 4.0;
        v33 = v79;
      }
      v35 = *(double *)(a12 + 48);
      if (a8.n128_f64[0] < v35)
      {
        *a6 = v35;
        a8.n128_f64[0] = v35;
      }
      v36 = *(double *)(a12 + 56);
      if (v36 < a8.n128_f64[0])
      {
        *a6 = v36;
        a8.n128_f64[0] = v36;
      }
      if (v25)
      {
        v37 = a8.n128_f64[0] > v33 && v34 > a8.n128_f64[0];
        if (!v37 || *(_DWORD *)(a12 + 40) <= (int)v23 + 1 || updated || v34 - v33 <= v34 * *(double *)(a12 + 88))
        {
          *a6 = v32;
          a8.n128_f64[0] = v32;
        }
      }
      if (a1 >= 1)
      {
        v38 = a7;
        v39 = a2;
        v40 = v15;
        do
        {
          v41 = *v38++;
          *v39++ = v41;
          --v40;
        }
        while (v40);
        v42 = *a6;
        v43 = a5;
        v44 = (double *)a2;
        v45 = v15;
        do
        {
          v46 = *v43++;
          *v44 = *v44 + v42 * v46;
          ++v44;
          --v45;
        }
        while (v45);
        a8.n128_f64[0] = *a6;
      }
      v47 = (*((double (**)(_QWORD, _QWORD *, double *, _QWORD, __n128))a11 + 2))(*((_QWORD *)a11 + 1), a2, a4, *a11, a8);
      *a3 = v47;
      v80 = 0.0;
      v48 = 0.0;
      if (a1 >= 1)
      {
        v49 = a4;
        v50 = a5;
        v51 = v15;
        do
        {
          v52 = *v49++;
          v53 = v52;
          v54 = *v50++;
          v48 = v48 + v53 * v54;
          --v51;
        }
        while (v51);
        v80 = v48;
      }
      v55 = *a6;
      if (v25)
      {
        if (v55 <= v33)
          return 4294966295;
        if (v34 <= v55 || updated != 0)
          return 4294966295;
      }
      v57 = v27 + v55 * v28;
      if (v55 == *(double *)(a12 + 56) && v47 <= v57 && v48 <= v28)
        return 4294966297;
      if (v55 == *(double *)(a12 + 48) && (v57 < v47 || v28 <= v48))
        return 4294966296;
      if (v25 && v34 - v33 <= v34 * *(double *)(a12 + 88))
        return 4294966300;
      v23 = (v23 + 1);
      if (*(_DWORD *)(a12 + 40) <= (int)v23)
        return 4294966298;
      if (v47 <= v57)
      {
        v61 = *(double *)(a12 + 80);
        if (fabs(v48) <= v61 * -v16)
          return v23;
        if (!v67)
          goto LABEL_69;
        if (*(double *)(a12 + 64) <= v61)
          v61 = *(double *)(a12 + 64);
        if (v16 * v61 <= v48)
        {
LABEL_69:
          v67 = 0;
LABEL_83:
          updated = update_trial_interval(&v79, &v78, &v77, &v76, &v75, &v74, a6, a3, v33, v34, &v80, v81);
          goto LABEL_84;
        }
      }
      else if (!v67)
      {
        goto LABEL_69;
      }
      if (v57 >= v47 || v47 > v78)
      {
        v67 = 1;
        goto LABEL_83;
      }
      v68 = v48 - v28;
      v69 = v47 - v55 * v28;
      v72 = v77 - v28;
      v73 = v78 - v32 * v28;
      v70 = v74 - v28;
      v71 = v75 - v76 * v28;
      updated = update_trial_interval(&v79, &v73, &v72, &v76, &v71, &v70, a6, &v69, v33, v34, &v68, v81);
      v77 = v28 + v72;
      v78 = v73 + v79 * v28;
      v74 = v28 + v70;
      v75 = v71 + v76 * v28;
      v67 = 1;
LABEL_84:
      v25 = v81[0];
      if (v81[0])
      {
        v29 = vabdd_f64(v76, v79);
        v25 = 1;
        v37 = v63 * 0.66 > v29;
        v63 = v31;
        if (!v37)
        {
          *a6 = v79 + (v76 - v79) * 0.5;
          v63 = v31;
        }
        goto LABEL_10;
      }
    }
  }
  return 4294966302;
}

uint64_t line_search_backtracking_owlqn(int a1, _QWORD *a2, double *a3, uint64_t a4, double *a5, double *a6, double *a7, double *a8, double *a9, unsigned int *a10, uint64_t a11)
{
  uint64_t v17;
  double v18;
  uint64_t v19;
  double *v20;
  double *v21;
  double *v22;
  double v23;
  uint64_t v24;
  double *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double *v30;
  double *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  double *v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  double *v45;
  double v46;
  double v47;
  uint64_t v48;
  double *v49;
  double *v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;

  if (*a6 <= 0.0)
    return 4294966301;
  v17 = a1;
  v18 = *a3;
  if (a1 >= 1)
  {
    v19 = a1;
    v20 = a7;
    v21 = a8;
    v22 = a9;
    do
    {
      v23 = *v20;
      if (*v20 == 0.0)
        v23 = -*v21;
      *v22++ = v23;
      ++v21;
      ++v20;
      --v19;
    }
    while (v19);
  }
  LODWORD(v24) = 0;
  while (1)
  {
    if (a1 >= 1)
    {
      v25 = a7;
      v26 = a2;
      v27 = v17;
      do
      {
        v28 = *(_QWORD *)v25++;
        *v26++ = v28;
        --v27;
      }
      while (v27);
      v29 = *a6;
      v30 = a5;
      v31 = (double *)a2;
      v32 = v17;
      do
      {
        v33 = *v30++;
        *v31 = *v31 + v29 * v33;
        ++v31;
        --v32;
      }
      while (v32);
    }
    v35 = *(int *)(a11 + 104);
    v34 = *(int *)(a11 + 108);
    if ((int)v35 < (int)v34)
    {
      v36 = v34 - v35;
      v37 = &a9[v35];
      v38 = (double *)&a2[v35];
      do
      {
        if (*v38 * *v37 <= 0.0)
          *v38 = 0.0;
        ++v37;
        ++v38;
        --v36;
      }
      while (v36);
    }
    v39 = (*((double (**)(_QWORD, _QWORD *, uint64_t, _QWORD, double))a10 + 2))(*((_QWORD *)a10 + 1), a2, a4, *a10, *a6);
    *a3 = v39;
    v41 = *(int *)(a11 + 104);
    v40 = *(int *)(a11 + 108);
    v42 = 0.0;
    v43 = 0.0;
    if ((int)v41 < (int)v40)
    {
      v44 = v40 - v41;
      v45 = (double *)&a2[v41];
      do
      {
        v46 = *v45++;
        v43 = v43 + fabs(v46);
        --v44;
      }
      while (v44);
    }
    v47 = v39 + v43 * *(double *)(a11 + 96);
    *a3 = v47;
    if (a1 >= 1)
    {
      v42 = 0.0;
      v48 = v17;
      v49 = (double *)a2;
      v50 = a7;
      v51 = a8;
      do
      {
        v52 = *v49++;
        v53 = v52;
        v54 = *v50++;
        v55 = v53 - v54;
        v56 = *v51++;
        v42 = v42 + v55 * v56;
        --v48;
      }
      while (v48);
    }
    v24 = (v24 + 1);
    if (v47 <= v18 + *(double *)(a11 + 64) * v42)
      break;
    v57 = *a6;
    if (*a6 < *(double *)(a11 + 48))
      return 4294966296;
    if (v57 > *(double *)(a11 + 56))
      return 4294966297;
    if (*(_DWORD *)(a11 + 40) <= (int)v24)
      return 4294966298;
    *a6 = v57 * 0.5;
  }
  return v24;
}

uint64_t line_search_backtracking(int a1, _QWORD *a2, double *a3, double *a4, double *a5, unint64_t *a6, uint64_t *a7, __n128 a8, uint64_t a9, uint64_t a10, unsigned int *a11, uint64_t a12)
{
  uint64_t v18;
  double v19;
  double *v20;
  double *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v28;
  double v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double *v35;
  double *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  int v41;
  double v42;
  double *v43;
  double *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;

  a8.n128_u64[0] = *a6;
  if (*(double *)a6 <= 0.0)
    return 4294966301;
  v18 = a1;
  v19 = 0.0;
  if (a1 < 1)
    goto LABEL_9;
  v20 = a4;
  v21 = a5;
  v22 = a1;
  do
  {
    v23 = *v20++;
    v24 = v23;
    v25 = *v21++;
    v19 = v19 + v24 * v25;
    --v22;
  }
  while (v22);
  if (v19 > 0.0)
    return 4294966302;
LABEL_9:
  LODWORD(v26) = 0;
  v28 = *a3;
  v29 = v19 * *(double *)(a12 + 64);
  while (1)
  {
    if (a1 >= 1)
    {
      v30 = a7;
      v31 = a2;
      v32 = v18;
      do
      {
        v33 = *v30++;
        *v31++ = v33;
        --v32;
      }
      while (v32);
      v34 = *(double *)a6;
      v35 = a5;
      v36 = (double *)a2;
      v37 = v18;
      do
      {
        v38 = *v35++;
        *v36 = *v36 + v34 * v38;
        ++v36;
        --v37;
      }
      while (v37);
      a8.n128_u64[0] = *a6;
    }
    a8.n128_f64[0] = (*((double (**)(_QWORD, _QWORD *, double *, _QWORD, __n128))a11 + 2))(*((_QWORD *)a11 + 1), a2, a4, *a11, a8);
    *a3 = a8.n128_f64[0];
    v26 = (v26 + 1);
    v39 = *(double *)a6;
    v40 = 0.5;
    if (a8.n128_f64[0] <= v28 + *(double *)a6 * v29)
    {
      v41 = *(_DWORD *)(a12 + 36);
      if (v41 == 1)
        break;
      v42 = 0.0;
      if (a1 >= 1)
      {
        v43 = a4;
        v44 = a5;
        v45 = v18;
        do
        {
          v46 = *v43++;
          v47 = v46;
          v48 = *v44++;
          v42 = v42 + v47 * v48;
          --v45;
        }
        while (v45);
      }
      v49 = *(double *)(a12 + 72);
      v40 = 2.1;
      if (v42 >= v19 * v49)
      {
        if (v41 == 2)
          break;
        v40 = 0.5;
        if (v42 <= -(v49 * v19))
          break;
      }
    }
    if (v39 < *(double *)(a12 + 48))
      return 4294966296;
    if (v39 > *(double *)(a12 + 56))
      return 4294966297;
    if (*(_DWORD *)(a12 + 40) <= (int)v26)
      return 4294966298;
    a8.n128_f64[0] = v39 * v40;
    *(double *)a6 = v39 * v40;
  }
  return v26;
}

double owlqn_pseudo_gradient(_QWORD *a1, uint64_t a2, uint64_t *a3, int a4, int a5, int a6, double result)
{
  uint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  double *v11;
  double *v12;
  double *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double *v20;
  double *v21;
  uint64_t v22;
  double v23;

  if (a5 >= 1)
  {
    v7 = a5;
    v8 = a3;
    v9 = a1;
    do
    {
      v10 = *v8++;
      *v9++ = v10;
      --v7;
    }
    while (v7);
  }
  if (a5 < a6)
  {
    v11 = (double *)&a1[a5];
    v12 = (double *)(a2 + 8 * a5);
    v13 = (double *)&a3[a5];
    v14 = a6 - (uint64_t)a5;
    do
    {
      if (*v12 >= 0.0)
      {
        v16 = *v13;
        v17 = *v13 - result;
        if (*v13 <= result)
          v17 = 0.0;
        v18 = v16 + result;
        if (v16 < -result)
          v19 = v16 + result;
        else
          v19 = v17;
        if (*v12 > 0.0)
          v15 = v18;
        else
          v15 = v19;
      }
      else
      {
        v15 = *v13 - result;
      }
      *v11++ = v15;
      ++v12;
      ++v13;
      --v14;
    }
    while (v14);
  }
  if (a6 < a4)
  {
    v20 = (double *)&a3[a6];
    v21 = (double *)&a1[a6];
    v22 = a4 - (uint64_t)a6;
    do
    {
      v23 = *v20++;
      result = v23;
      *v21++ = v23;
      --v22;
    }
    while (v22);
  }
  return result;
}

uint64_t update_trial_interval(double *a1, double *a2, double *a3, double *a4, double *a5, double *a6, double *a7, double *a8, double a9, double a10, double *a11, int *a12)
{
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t result;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  BOOL v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;

  v12 = *a11;
  v13 = *a3;
  v14 = *a12;
  if (*a12)
  {
    v15 = *a7;
    v16 = *a1;
    v17 = *a4;
    if (*a1 > *a4)
      v18 = *a4;
    else
      v18 = *a1;
    if (v15 <= v18)
      return 4294966293;
    if (v16 >= v17)
      v17 = *a1;
    if (v17 <= v15)
      return 4294966293;
    if (v13 * (v15 - v16) >= 0.0)
      return 4294966302;
    if (a10 < a9)
      return 4294966294;
  }
  v20 = fabs(v13);
  v21 = *a2;
  v22 = *a8;
  if (*a2 >= *a8)
  {
    if (v12 * (v13 / v20) >= 0.0)
    {
      v48 = fabs(v12);
      v47 = *a7;
      if (v48 >= v20)
      {
        v37 = 0;
        if (v14)
        {
          v63 = *a4 - v47;
          v64 = v12 + (v22 - *a5) * 3.0 / v63;
          v65 = *a6;
          v66 = *a6 + v64;
          v67 = fabs(v66);
          v68 = fabs(*a6);
          if (v67 >= v48)
            v48 = v67;
          if (v48 < v68)
            v48 = v68;
          v69 = v48 * sqrt(-v12 / v48 * (v65 / v48) + v66 / v48 * (v66 / v48));
          if (*a4 >= v47)
            v70 = v69;
          else
            v70 = -v69;
          v32 = v47 + (v66 + v70 - v12) / (v65 + v70 + v70 - v12) * v63;
        }
        else if (*a1 >= v47)
        {
          v32 = a9;
        }
        else
        {
          v32 = a10;
        }
      }
      else
      {
        v49 = *a1;
        v50 = v47 - *a1;
        v51 = v12 + v13 + (v21 - v22) * 3.0 / v50;
        v52 = fabs(v51);
        if (v52 >= v20)
          v20 = v52;
        if (v20 < v48)
          v20 = v48;
        v53 = v51 / v20;
        v54 = -v13 / v20 * (v12 / v20) + v53 * v53;
        if (v54 <= 0.0)
          v54 = 0.0;
        v55 = v20 * sqrt(v54);
        v56 = -v55;
        if (v49 >= v47)
          v56 = v55;
        v57 = (v51 + v56 - v12) / (v13 + v56 + v56 - v12);
        if (v53 >= 0.0)
          v58 = a9;
        else
          v58 = a10;
        v59 = v57 >= 0.0 || v56 == 0.0;
        v60 = v47 - v57 * v50;
        if (v59)
          v60 = v58;
        v32 = v47 + v12 / (v12 - v13) * (v49 - v47);
        v61 = vabdd_f64(v47, v60);
        v62 = vabdd_f64(v47, v32);
        if (v14)
        {
          if (v61 < v62)
            v32 = v60;
        }
        else if (v61 > v62)
        {
          v32 = v60;
        }
        v37 = 1;
      }
    }
    else
    {
      v37 = 0;
      v14 = 1;
      *a12 = 1;
      v38 = *a7;
      v39 = *a1;
      v40 = *a7 - *a1;
      v41 = v12 + v13 + (v21 - v22) * 3.0 / v40;
      v42 = fabs(v41);
      v43 = fabs(v12);
      if (v42 >= v20)
        v20 = v42;
      if (v20 < v43)
        v20 = v43;
      v44 = v20 * sqrt(-v13 / v20 * (v12 / v20) + v41 / v20 * (v41 / v20));
      v45 = -v44;
      if (v38 >= v39)
        v45 = v44;
      v46 = v39 + (v41 + v45 - v13) / (v12 + v45 + v45 - v13) * v40;
      v32 = v38 + v12 / (v12 - v13) * (v39 - v38);
      if (vabdd_f64(v46, v38) > vabdd_f64(v32, v38))
        v32 = v46;
      *a4 = v39;
      *a5 = *a2;
      *a6 = *a3;
      v47 = *a7;
    }
    *a1 = v47;
  }
  else
  {
    v14 = 1;
    *a12 = 1;
    v23 = *a7;
    v24 = *a1;
    v25 = *a7 - *a1;
    v26 = v21 - v22;
    v27 = v12 + v13 + v26 * 3.0 / v25;
    v28 = fabs(v27);
    v29 = fabs(v12);
    if (v28 >= v20)
      v20 = v28;
    if (v20 < v29)
      v20 = v29;
    v30 = v20 * sqrt(-v13 / v20 * (v12 / v20) + v27 / v20 * (v27 / v20));
    v31 = -v30;
    if (v23 >= v24)
      v31 = v30;
    v32 = v24 + (v27 + v31 - v13) / (v12 + v31 + v31 - v13) * v25;
    v33 = v24 + v13 / (v13 + v26 / v25) * 0.5 * v25;
    v34 = vabdd_f64(v32, v24);
    v35 = vabdd_f64(v33, v24);
    v36 = v32 + (v33 - v32) * 0.5;
    if (v34 >= v35)
      v32 = v36;
    *a4 = v23;
    a2 = a5;
    a3 = a6;
    v37 = 1;
  }
  *a2 = *a8;
  *a3 = *a11;
  if (v32 <= a10)
    a10 = v32;
  if (a10 >= a9)
    a9 = a10;
  if (v37 && v14)
  {
    v71 = *a1 + (*a4 - *a1) * 0.66;
    if (*a1 < *a4)
    {
      if (v71 >= a9)
        goto LABEL_83;
      goto LABEL_82;
    }
    if (a9 < v71)
LABEL_82:
      a9 = *a1 + (*a4 - *a1) * 0.66;
  }
LABEL_83:
  result = 0;
  *a7 = a9;
  return result;
}

_QWORD *crf_output_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

void *crf_output_init_n(_QWORD *a1, int a2)
{
  void *result;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  result = malloc_type_calloc(a2, 4uLL, 0x100004052888210uLL);
  a1[1] = result;
  if (result)
    *(_DWORD *)a1 = a2;
  return result;
}

void crf_output_finish(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t crf_paragraph_get_item_count(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 12) < (signed int)a2)
    return 0xFFFFFFFFLL;
  else
    return *(unsigned int *)(*(_QWORD *)(a1 + 24) + 4 * a2);
}

uint64_t crf_paragraph_get_item_count_for_sentence(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  _DWORD *v4;

  if ((a2 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v2 = *(_DWORD *)(a1 + 12);
  if (v2 <= (int)a2)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(a1 + 24);
  if (a2 + 1 == v2)
    v4 = (_DWORD *)(a1 + 4);
  else
    v4 = (_DWORD *)(v3 + 4 * (a2 + 1));
  return (*v4 - *(_DWORD *)(v3 + 4 * a2));
}

uint64_t crf_paragraph_get_id(uint64_t a1, unsigned int a2, int a3, int a4)
{
  int v4;
  int v5;

  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 12) < (signed int)a2)
    v4 = -1;
  else
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * a2);
  v5 = a4 + (v4 + a3) * *(_DWORD *)a1;
  if (v5 < 0 || v5 >= *(_DWORD *)(a1 + 4) * *(_DWORD *)a1)
    crf_paragraph_get_id_cold_1();
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4 * v5);
}

void crf_paragraph_set_id(int *a1, int a2, int a3, int a4, int a5)
{
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  size_t v16;
  char *v17;
  uint64_t v18;

  if (a1[3] == a2)
    *(_DWORD *)(*((_QWORD *)a1 + 3) + 4 * a2) = a1[1];
  if (a2 < 0 || a1[3] < a2)
    v8 = -1;
  else
    v8 = *(_DWORD *)(*((_QWORD *)a1 + 3) + 4 * a2);
  v9 = v8 + a3;
  v10 = *a1;
  v11 = a4 + v9 * v10;
  if ((v11 & 0x80000000) != 0)
    crf_paragraph_set_id_cold_1();
  v12 = a1[2];
  if ((int)(v11 + 1) >= (int)v12 * (int)v10)
  {
    v13 = 4 * v10;
    v14 = v13 * v12;
    v15 = 2 * v12;
    a1[2] = v15;
    v16 = v13 * v15;
    v17 = (char *)malloc_type_realloc(*((void **)a1 + 4), v16, 0x674E3237uLL);
    *((_QWORD *)a1 + 4) = v17;
    bzero(&v17[v14], v16 - v14);
  }
  v18 = a1[4];
  if (a2 + 1 >= (int)v18)
  {
    a1[4] = 2 * v18;
    *((_QWORD *)a1 + 3) = malloc_type_realloc(*((void **)a1 + 3), 8 * v18, 0x100004052888210uLL);
  }
  if (a1[3] == a2)
    a1[3] = a2 + 1;
  if (v9 == a1[1])
    a1[1] = v9 + 1;
  *(_DWORD *)(*((_QWORD *)a1 + 4) + 4 * v11) = a5;
}

double crf_data_init(_OWORD *a1)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

double crf_data_finish(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  double result;

  if (*a1 >= 1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      crf_sequence_finish((int *)(*((_QWORD *)a1 + 3) + v2));
      ++v3;
      v2 += 16;
    }
    while (v3 < *a1);
  }
  free(*((void **)a1 + 3));
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

void crf_sequence_finish(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*a1 >= 1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *((_QWORD *)a1 + 1) + v2;
      free(*(void **)(v4 + 8));
      *(_QWORD *)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
      *(_QWORD *)(v4 + 16) = 0;
      ++v3;
      v2 += 24;
    }
    while (v3 < *a1);
  }
  free(*((void **)a1 + 1));
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 1) = 0;
}

uint64_t crf_data_append(int *a1, uint64_t *a2)
{
  int v4;
  int v5;
  int *v6;
  int v7;

  if (*(int *)a2 >= 1)
  {
    v4 = *a1;
    v5 = a1[1];
    if (v5 <= *a1)
    {
      v7 = 2 * v5 + 2;
      a1[1] = v7;
      v6 = (int *)malloc_type_realloc(*((void **)a1 + 3), 16 * v7, 0x10200405730B0C9uLL);
      *((_QWORD *)a1 + 3) = v6;
      v4 = *a1;
    }
    else
    {
      v6 = (int *)*((_QWORD *)a1 + 3);
    }
    *a1 = v4 + 1;
    crf_sequence_copy(&v6[4 * v4], a2);
  }
  return 0;
}

void crf_sequence_copy(int *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = malloc_type_calloc((int)v4, 0x18uLL, 0x1020040BC38B472uLL);
  if (*a1 >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      crf_item_copy((unsigned int *)(*((_QWORD *)a1 + 1) + v5), (uint64_t *)(a2[1] + v5));
      ++v6;
      v5 += 24;
    }
    while (v6 < *a1);
  }
}

unint64_t crf_data_maxlength(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  int *v3;
  unsigned int v4;
  int v5;

  v1 = *(unsigned int *)result;
  if ((int)v1 < 1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = *(int **)(v2 + 24);
  do
  {
    v5 = *v3;
    v3 += 4;
    v4 = v5;
    if ((int)result <= v5)
      result = v4;
    else
      result = result;
    --v1;
  }
  while (v1);
  return result;
}

unint64_t crf_data_totalitems(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  int *v3;
  int v4;

  v1 = *(unsigned int *)result;
  if ((int)v1 < 1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = *(int **)(v2 + 24);
  do
  {
    v4 = *v3;
    v3 += 4;
    result = (v4 + result);
    --v1;
  }
  while (v1);
  return result;
}

_QWORD *crf_sequence_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void crf_item_finish(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t crf_sequence_append(int *a1, uint64_t *a2, int a3)
{
  int v6;
  int v7;
  unsigned int *v8;
  int v9;
  int v10;

  v6 = *a1;
  v7 = a1[1];
  if (v7 <= *a1)
  {
    v9 = 2 * v7 + 2;
    a1[1] = v9;
    v8 = (unsigned int *)malloc_type_realloc(*((void **)a1 + 1), 24 * v9, 0x1020040BC38B472uLL);
    *((_QWORD *)a1 + 1) = v8;
    v6 = *a1;
  }
  else
  {
    v8 = (unsigned int *)*((_QWORD *)a1 + 1);
  }
  crf_item_copy(&v8[6 * v6], a2);
  v10 = *a1;
  *(_DWORD *)(*((_QWORD *)a1 + 1) + 24 * v10 + 16) = a3;
  *a1 = v10 + 1;
  return 0;
}

double crf_item_copy(unsigned int *a1, uint64_t *a2)
{
  uint64_t v4;
  char *v5;
  double result;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  double v10;

  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  a1[4] = *((_DWORD *)a2 + 4);
  v5 = (char *)malloc_type_calloc((int)v4, 0x10uLL, 0x1000040F7F8B94BuLL);
  *((_QWORD *)a1 + 1) = v5;
  v7 = *a1;
  if ((int)v7 >= 1)
  {
    v8 = (_QWORD *)(a2[1] + 8);
    v9 = v5 + 8;
    do
    {
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      v10 = *(double *)v8;
      v8 += 2;
      result = v10;
      *(double *)v9 = v10;
      v9 += 2;
      --v7;
    }
    while (v7);
  }
  return result;
}

_QWORD *crf_item_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

double crf_content_copy(uint64_t a1, uint64_t a2)
{
  double result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

uint64_t crf_content_set(uint64_t result, int a2, double a3)
{
  *(_QWORD *)result = 0;
  *(_DWORD *)result = a2;
  *(double *)(result + 8) = a3;
  return result;
}

_QWORD *crf_content_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0x3FF0000000000000;
  return result;
}

uint64_t crf_item_append_content(int *a1, uint64_t a2)
{
  int v4;
  int v5;
  char *v6;
  int v7;
  char *v8;

  v4 = *a1;
  v5 = a1[1];
  if (v5 <= *a1)
  {
    v7 = 2 * v5 + 2;
    a1[1] = v7;
    v6 = (char *)malloc_type_realloc(*((void **)a1 + 1), 16 * v7, 0x1000040F7F8B94BuLL);
    *((_QWORD *)a1 + 1) = v6;
    v4 = *a1;
  }
  else
  {
    v6 = (char *)*((_QWORD *)a1 + 1);
  }
  *a1 = v4 + 1;
  v8 = &v6[16 * v4];
  *(_DWORD *)v8 = *(_DWORD *)a2;
  *((_QWORD *)v8 + 1) = *(_QWORD *)(a2 + 8);
  return 0;
}

void crf_paragraph_init_with_attrs(int *a1, int a2)
{
  void *v3;

  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_QWORD *)a1 + 4) = 0;
  *a1 = a2;
  *(_OWORD *)(a1 + 1) = xmmword_208419820;
  *((_QWORD *)a1 + 3) = malloc_type_malloc(8uLL, 0x100004052888210uLL);
  __memset_chk();
  v3 = malloc_type_malloc(4 * *a1 * (uint64_t)a1[2], 0xA651C99FuLL);
  *((_QWORD *)a1 + 4) = v3;
  bzero(v3, 4 * *a1 * (uint64_t)a1[2]);
}

void crf_paragraph_finish(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[3];
  if (v2)
    free(v2);
  v3 = (void *)a1[4];
  if (v3)
    free(v3);
  free(a1);
}

void Cache::Cache(Cache *this, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  *(_DWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  v4 = malloc_type_calloc(a2, 0x20uLL, 0x10A004007F91357uLL);
  v5 = *(int *)this;
  v6 = (*((_QWORD *)this + 1) >> 2) - 8 * (v5 & 0x7FFFFFFFFFFFFFFLL);
  v7 = v6 <= 2 * v5;
  v8 = 2 * v5;
  if (v7)
    v6 = v8;
  *((_QWORD *)this + 1) = v6;
  *((_QWORD *)this + 2) = v4;
  *((_QWORD *)this + 3) = (char *)this + 24;
  *((_QWORD *)this + 4) = (char *)this + 24;
}

void Cache::~Cache(Cache *this)
{
  char *v2;
  uint64_t i;

  v2 = (char *)this + 24;
  for (i = *((_QWORD *)this + 4); (char *)i != v2; i = *(_QWORD *)(i + 8))
    free(*(void **)(i + 16));
  free(*((void **)this + 2));
}

void Cache::lru_delete(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)(v2 + 8) = a2[1];
  *(_QWORD *)a2[1] = v2;
}

uint64_t Cache::lru_insert(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  result = a1 + 24;
  *a2 = v3;
  a2[1] = result;
  *(_QWORD *)(v3 + 8) = a2;
  *(_QWORD *)a2[1] = a2;
  return result;
}

uint64_t Cache::get_data(Cache *this, int a2, float **a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  int v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a4;
  v7 = *((_QWORD *)this + 2);
  v8 = a2;
  v9 = (uint64_t *)(v7 + 32 * a2);
  v11 = v9 + 3;
  v10 = *((_DWORD *)v9 + 6);
  if (v10)
  {
    v12 = *v9;
    *(_QWORD *)(v12 + 8) = v9[1];
    *(_QWORD *)v9[1] = v12;
  }
  v13 = (a4 - v10);
  if ((int)a4 <= v10)
  {
    v19 = *(float **)(v7 + 32 * a2 + 16);
  }
  else
  {
    if (*((_QWORD *)this + 1) < (uint64_t)v13)
    {
      do
      {
        v14 = (uint64_t *)*((_QWORD *)this + 4);
        v15 = *v14;
        *(_QWORD *)(v15 + 8) = v14[1];
        v16 = (void *)v14[2];
        *(_QWORD *)v14[1] = v15;
        free(v16);
        v17 = *((_QWORD *)this + 1) + *((int *)v14 + 6);
        *((_QWORD *)this + 1) = v17;
        v14[2] = 0;
        *((_DWORD *)v14 + 6) = 0;
      }
      while (v17 < v13);
    }
    v18 = v7 + 32 * v8;
    v19 = (float *)malloc_type_realloc(*(void **)(v18 + 16), 4 * (int)v4, 0x100004052888210uLL);
    *(_QWORD *)(v18 + 16) = v19;
    *((_QWORD *)this + 1) -= v13;
    v20 = *v11;
    *v11 = v4;
    v4 = v20;
  }
  v21 = v7 + 32 * v8;
  v22 = *((_QWORD *)this + 3);
  *(_QWORD *)(v21 + 8) = (char *)this + 24;
  *v9 = v22;
  *(_QWORD *)(v22 + 8) = v9;
  **(_QWORD **)(v21 + 8) = v9;
  *a3 = v19;
  return v4;
}

void Cache::swap_index(Cache *this, int a2, int a3)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v18;
  int v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  void *v26;

  if (a2 != a3)
  {
    v4 = *((_QWORD *)this + 2);
    v5 = (uint64_t *)(v4 + 32 * a2);
    if (*((_DWORD *)v5 + 6))
    {
      v6 = *v5;
      *(_QWORD *)(v6 + 8) = v5[1];
      *(_QWORD *)v5[1] = v6;
    }
    v7 = (uint64_t *)(v4 + 32 * a3);
    if (*((_DWORD *)v7 + 6))
    {
      v8 = *v7;
      *(_QWORD *)(v8 + 8) = v7[1];
      *(_QWORD *)v7[1] = v8;
    }
    v9 = v4 + 32 * a2;
    v10 = *(_QWORD *)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v7[2];
    v7[2] = v10;
    v11 = *((_QWORD *)this + 2);
    v12 = v11 + 32 * a2;
    v13 = v11 + 32 * a3;
    v14 = *(_DWORD *)(v12 + 24);
    *(_DWORD *)(v12 + 24) = *(_DWORD *)(v13 + 24);
    *(_DWORD *)(v13 + 24) = v14;
    if (*(_DWORD *)(v12 + 24))
    {
      v15 = *((_QWORD *)this + 3);
      *(_QWORD *)v12 = v15;
      *(_QWORD *)(v12 + 8) = (char *)this + 24;
      *(_QWORD *)(v15 + 8) = v12;
      **(_QWORD **)(v12 + 8) = v12;
    }
    if (v14)
    {
      v16 = *((_QWORD *)this + 3);
      v17 = (_QWORD *)(v11 + 32 * a3);
      *v17 = v16;
      v17[1] = (char *)this + 24;
      *(_QWORD *)(v16 + 8) = v17;
      *(_QWORD *)v17[1] = v17;
    }
    if (a2 >= a3)
      v18 = a3;
    else
      v18 = a2;
    if (a2 <= a3)
      v19 = a3;
    else
      v19 = a2;
    v20 = (char *)this + 24;
    v21 = (char *)*((_QWORD *)this + 4);
    if (v21 != (char *)this + 24)
    {
      do
      {
        v22 = *((_DWORD *)v21 + 6);
        if (v22 > v18)
        {
          if (v22 <= v19)
          {
            v25 = *(_QWORD *)v21;
            *(_QWORD *)(v25 + 8) = *((_QWORD *)v21 + 1);
            v26 = (void *)*((_QWORD *)v21 + 2);
            **((_QWORD **)v21 + 1) = v25;
            free(v26);
            *((_QWORD *)this + 1) += *((int *)v21 + 6);
            *((_QWORD *)v21 + 2) = 0;
            *((_DWORD *)v21 + 6) = 0;
          }
          else
          {
            v23 = *((_QWORD *)v21 + 2);
            v24 = *(_DWORD *)(v23 + 4 * v18);
            *(_DWORD *)(v23 + 4 * v18) = *(_DWORD *)(v23 + 4 * v19);
            *(_DWORD *)(v23 + 4 * v19) = v24;
          }
        }
        v21 = (char *)*((_QWORD *)v21 + 1);
      }
      while (v21 != v20);
    }
  }
}

uint64_t Kernel::Kernel(uint64_t a1, int a2, const void *a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  int v14;
  double v15;
  double *v16;
  int v17;

  *(_QWORD *)a1 = &unk_24C09D940;
  v7 = *(_QWORD *)(a4 + 4);
  *(_QWORD *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a4 + 16);
  v8 = Kernel::kernel_linear;
  switch((int)v7)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v8 = Kernel::kernel_poly;
      goto LABEL_6;
    case 2:
      v8 = Kernel::kernel_rbf;
      goto LABEL_6;
    case 3:
      v8 = Kernel::kernel_sigmoid;
      goto LABEL_6;
    case 4:
      v8 = Kernel::kernel_precomputed;
LABEL_6:
      *(_QWORD *)(a1 + 8) = v8;
      *(_QWORD *)(a1 + 16) = 0;
      break;
    default:
      break;
  }
  v9 = (void *)operator new[]();
  *(_QWORD *)(a1 + 24) = v9;
  memcpy(v9, a3, 8 * a2);
  if (*(_DWORD *)(a1 + 40) == 2)
  {
    v10 = operator new[]();
    *(_QWORD *)(a1 + 32) = v10;
    if (a2 >= 1)
    {
      v11 = 0;
      v12 = *(_QWORD *)(a1 + 24);
      do
      {
        v13 = *(double **)(v12 + 8 * v11);
        v14 = *(_DWORD *)v13;
        v15 = 0.0;
        if (*(_DWORD *)v13 != -1)
        {
          v16 = *(double **)(v12 + 8 * v11);
          v17 = *(_DWORD *)v13;
          do
          {
            if (v14 == v17)
            {
              v15 = v15 + v13[1] * v16[1];
              v13 += 2;
              v16 += 2;
            }
            else if (v14 > v17)
            {
              v16 += 2;
            }
            else
            {
              v13 += 2;
            }
            v14 = *(_DWORD *)v13;
            if (*(_DWORD *)v13 == -1)
              break;
            v17 = *(_DWORD *)v16;
          }
          while (*(_DWORD *)v16 != -1);
        }
        *(double *)(v10 + 8 * v11++) = v15;
      }
      while (v11 != a2);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
  }
  return a1;
}

double Kernel::kernel_linear(Kernel *this, int a2, int a3)
{
  uint64_t v3;
  double *v4;
  int v5;
  double *v6;
  double result;
  int v8;

  v3 = *((_QWORD *)this + 3);
  v4 = *(double **)(v3 + 8 * a2);
  v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
    return 0.0;
  v6 = *(double **)(v3 + 8 * a3);
  result = 0.0;
  do
  {
    v8 = *(_DWORD *)v6;
    if (*(_DWORD *)v6 == -1)
      break;
    if (v5 == v8)
    {
      result = result + v4[1] * v6[1];
      v4 += 2;
      v6 += 2;
    }
    else if (v5 > v8)
    {
      v6 += 2;
    }
    else
    {
      v4 += 2;
    }
    v5 = *(_DWORD *)v4;
  }
  while (*(_DWORD *)v4 != -1);
  return result;
}

double Kernel::kernel_poly(Kernel *this, int a2, int a3)
{
  uint64_t v3;
  double *v4;
  int v5;
  double *v6;
  double v7;
  int v8;
  int v9;
  double v10;
  double result;
  double v12;
  BOOL v13;

  v3 = *((_QWORD *)this + 3);
  v4 = *(double **)(v3 + 8 * a2);
  v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
  {
    v7 = 0.0;
  }
  else
  {
    v6 = *(double **)(v3 + 8 * a3);
    v7 = 0.0;
    do
    {
      v8 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 == -1)
        break;
      if (v5 == v8)
      {
        v7 = v7 + v4[1] * v6[1];
        v4 += 2;
        v6 += 2;
      }
      else if (v5 > v8)
      {
        v6 += 2;
      }
      else
      {
        v4 += 2;
      }
      v5 = *(_DWORD *)v4;
    }
    while (*(_DWORD *)v4 != -1);
  }
  v9 = *((_DWORD *)this + 11);
  if (v9 < 1)
    return 1.0;
  v10 = *((double *)this + 7) + *((double *)this + 6) * v7;
  result = 1.0;
  do
  {
    if ((v9 & 1) != 0)
      v12 = v10;
    else
      v12 = 1.0;
    result = result * v12;
    v10 = v10 * v10;
    v13 = v9 > 1;
    v9 = v9 >> 1;
  }
  while (v13);
  return result;
}

long double Kernel::kernel_rbf(Kernel *this, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double *v7;
  int v8;
  double *v9;
  double v10;
  int v11;

  v4 = *((_QWORD *)this + 3);
  v3 = *((_QWORD *)this + 4);
  v5 = *(double *)(v3 + 8 * a2);
  v6 = *(double *)(v3 + 8 * a3);
  v7 = *(double **)(v4 + 8 * a2);
  v8 = *(_DWORD *)v7;
  if (*(_DWORD *)v7 == -1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = *(double **)(v4 + 8 * a3);
    v10 = 0.0;
    do
    {
      v11 = *(_DWORD *)v9;
      if (*(_DWORD *)v9 == -1)
        break;
      if (v8 == v11)
      {
        v10 = v10 + v7[1] * v9[1];
        v7 += 2;
        v9 += 2;
      }
      else if (v8 > v11)
      {
        v9 += 2;
      }
      else
      {
        v7 += 2;
      }
      v8 = *(_DWORD *)v7;
    }
    while (*(_DWORD *)v7 != -1);
  }
  return exp(-(*((double *)this + 6) * (v5 + v6 + v10 * -2.0)));
}

long double Kernel::kernel_sigmoid(Kernel *this, int a2, int a3)
{
  uint64_t v3;
  double *v4;
  int v5;
  double *v6;
  double v7;
  int v8;

  v3 = *((_QWORD *)this + 3);
  v4 = *(double **)(v3 + 8 * a2);
  v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
  {
    v7 = 0.0;
  }
  else
  {
    v6 = *(double **)(v3 + 8 * a3);
    v7 = 0.0;
    do
    {
      v8 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 == -1)
        break;
      if (v5 == v8)
      {
        v7 = v7 + v4[1] * v6[1];
        v4 += 2;
        v6 += 2;
      }
      else if (v5 > v8)
      {
        v6 += 2;
      }
      else
      {
        v4 += 2;
      }
      v5 = *(_DWORD *)v4;
    }
    while (*(_DWORD *)v4 != -1);
  }
  return tanh(*((double *)this + 7) + *((double *)this + 6) * v7);
}

double Kernel::kernel_precomputed(Kernel *this, int a2, int a3)
{
  return *(double *)(*(_QWORD *)(*((_QWORD *)this + 3) + 8 * a2)
                   + 16 * (int)*(double *)(*(_QWORD *)(*((_QWORD *)this + 3) + 8 * a3) + 8)
                   + 8);
}

double *Kernel::dot(double *result, double *a2)
{
  int v2;
  double v3;
  int v4;

  v2 = *(_DWORD *)result;
  v3 = 0.0;
  while (v2 != -1)
  {
    v4 = *(_DWORD *)a2;
    if (*(_DWORD *)a2 == -1)
      break;
    if (v2 == v4)
    {
      v3 = v3 + result[1] * a2[1];
      result += 2;
      a2 += 2;
    }
    else if (v2 > v4)
    {
      a2 += 2;
    }
    else
    {
      result += 2;
    }
    v2 = *(_DWORD *)result;
  }
  return result;
}

void Kernel::~Kernel(Kernel *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &unk_24C09D940;
  v2 = *((_QWORD *)this + 3);
  if (v2)
    MEMORY[0x20BD06830](v2, 0x60C8044C4A2DFLL);
  v3 = *((_QWORD *)this + 4);
  if (v3)
    MEMORY[0x20BD06830](v3, 0x1000C8000313F17);
}

double Kernel::k_function(double *a1, double *a2, uint64_t a3)
{
  double result;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  int v11;
  double v12;
  int v13;
  int v14;
  double v15;
  double v16;
  BOOL v17;
  double *v18;
  int v19;
  double *v20;
  int v21;

  result = 0.0;
  switch(*(_DWORD *)(a3 + 4))
  {
    case 0:
      while (1)
      {
        v4 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1)
          break;
        v5 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1)
          break;
        if (v4 == v5)
        {
          result = result + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }
        else if (v4 > v5)
        {
          a2 += 2;
        }
        else
        {
          a1 += 2;
        }
      }
      break;
    case 1:
      while (1)
      {
        v6 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1)
          break;
        v7 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1)
          break;
        if (v6 == v7)
        {
          result = result + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }
        else if (v6 > v7)
        {
          a2 += 2;
        }
        else
        {
          a1 += 2;
        }
      }
      v14 = *(_DWORD *)(a3 + 8);
      if (v14 < 1)
      {
        result = 1.0;
      }
      else
      {
        v15 = *(double *)(a3 + 24) + *(double *)(a3 + 16) * result;
        result = 1.0;
        do
        {
          if ((v14 & 1) != 0)
            v16 = v15;
          else
            v16 = 1.0;
          result = result * v16;
          v15 = v15 * v15;
          v17 = v14 >= 2;
          v14 = v14 >> 1;
        }
        while (v17);
      }
      break;
    case 2:
      while (1)
      {
        v8 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1)
          break;
        v9 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1)
        {
          v18 = a1 + 2;
          do
          {
            result = result + *(v18 - 1) * *(v18 - 1);
            v19 = *(_DWORD *)v18;
            v18 += 2;
          }
          while (v19 != -1);
          break;
        }
        if (v8 == v9)
        {
          v10 = a1[1] - a2[1];
          result = result + v10 * v10;
          a1 += 2;
          a2 += 2;
        }
        else if (v8 <= v9)
        {
          result = result + a1[1] * a1[1];
          a1 += 2;
        }
        else
        {
          result = result + a2[1] * a2[1];
          a2 += 2;
        }
      }
      if (*(_DWORD *)a2 != -1)
      {
        v20 = a2 + 2;
        do
        {
          result = result + *(v20 - 1) * *(v20 - 1);
          v21 = *(_DWORD *)v20;
          v20 += 2;
        }
        while (v21 != -1);
      }
      result = exp(-(*(double *)(a3 + 16) * result));
      break;
    case 3:
      v11 = *(_DWORD *)a1;
      v12 = 0.0;
      while (v11 != -1)
      {
        v13 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1)
          break;
        if (v11 == v13)
        {
          v12 = v12 + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }
        else if (v11 > v13)
        {
          a2 += 2;
        }
        else
        {
          a1 += 2;
        }
        v11 = *(_DWORD *)a1;
      }
      result = tanh(*(double *)(a3 + 24) + *(double *)(a3 + 16) * v12);
      break;
    case 4:
      result = a1[2 * (int)a2[1] + 1];
      break;
    default:
      return result;
  }
  return result;
}

double Solver::swap_index(Solver *this, int a2, int a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double result;

  (*(void (**)(_QWORD))(**((_QWORD **)this + 6) + 16))(*((_QWORD *)this + 6));
  v6 = *((_QWORD *)this + 2);
  v7 = *(_BYTE *)(v6 + a2);
  *(_BYTE *)(v6 + a2) = *(_BYTE *)(v6 + a3);
  *(_BYTE *)(v6 + a3) = v7;
  v8 = *((_QWORD *)this + 3);
  v9 = *((_QWORD *)this + 4);
  v10 = *(_QWORD *)(v8 + 8 * a2);
  *(_QWORD *)(v8 + 8 * a2) = *(_QWORD *)(v8 + 8 * a3);
  *(_QWORD *)(v8 + 8 * a3) = v10;
  LOBYTE(v8) = *(_BYTE *)(v9 + a2);
  *(_BYTE *)(v9 + a2) = *(_BYTE *)(v9 + a3);
  *(_BYTE *)(v9 + a3) = v8;
  v11 = *((_QWORD *)this + 5);
  v12 = *(_QWORD *)(v11 + 8 * a2);
  *(_QWORD *)(v11 + 8 * a2) = *(_QWORD *)(v11 + 8 * a3);
  *(_QWORD *)(v11 + 8 * a3) = v12;
  v13 = *((_QWORD *)this + 11);
  v14 = *((_QWORD *)this + 12);
  v15 = *(_QWORD *)(v13 + 8 * a2);
  *(_QWORD *)(v13 + 8 * a2) = *(_QWORD *)(v13 + 8 * a3);
  *(_QWORD *)(v13 + 8 * a3) = v15;
  LODWORD(v13) = *(_DWORD *)(v14 + 4 * a2);
  *(_DWORD *)(v14 + 4 * a2) = *(_DWORD *)(v14 + 4 * a3);
  *(_DWORD *)(v14 + 4 * a3) = v13;
  v16 = *((_QWORD *)this + 13);
  result = *(double *)(v16 + 8 * a2);
  *(_QWORD *)(v16 + 8 * a2) = *(_QWORD *)(v16 + 8 * a3);
  *(double *)(v16 + 8 * a3) = result;
  return result;
}

uint64_t Solver::reconstruct_gradient(uint64_t this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  double *v4;
  double *v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  int v11;
  unsigned __int8 *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  double v21;
  float *v22;
  double *v23;
  uint64_t v24;
  float v25;

  v1 = *(unsigned int *)(this + 8);
  v2 = *(_DWORD *)(this + 112);
  if ((_DWORD)v1 != v2)
  {
    v3 = this;
    if ((int)v1 < v2)
    {
      v4 = (double *)(*(_QWORD *)(this + 104) + 8 * (int)v1);
      v5 = (double *)(*(_QWORD *)(this + 88) + 8 * (int)v1);
      v6 = (double *)(*(_QWORD *)(this + 24) + 8 * (int)v1);
      v7 = v2 - (uint64_t)(int)v1;
      do
      {
        v8 = *v4++;
        v9 = v8;
        v10 = *v5++;
        *v6++ = v9 + v10;
        --v7;
      }
      while (v7);
    }
    if ((int)v1 < 1)
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      v12 = *(unsigned __int8 **)(this + 32);
      v13 = v1;
      do
      {
        v14 = *v12++;
        if (v14 == 2)
          ++v11;
        --v13;
      }
      while (v13);
    }
    if ((int)v1 > 2 * v11)
    {
      this = info("\nWarning: using -h 0 may be faster\n");
      v2 = *(_DWORD *)(v3 + 112);
      v1 = *(unsigned int *)(v3 + 8);
    }
    if (v2 * v11 <= 2 * (int)v1 * (v2 - (int)v1))
    {
      if ((int)v1 >= 1)
      {
        v19 = 0;
        do
        {
          if (*(_BYTE *)(*(_QWORD *)(v3 + 32) + v19) == 2)
          {
            this = (***(uint64_t (****)(_QWORD, uint64_t))(v3 + 48))(*(_QWORD *)(v3 + 48), v19);
            LODWORD(v1) = *(_DWORD *)(v3 + 8);
            v20 = *(_DWORD *)(v3 + 112);
            if ((int)v1 < v20)
            {
              v21 = *(double *)(*(_QWORD *)(v3 + 40) + 8 * v19);
              v22 = (float *)(this + 4 * (int)v1);
              v23 = (double *)(*(_QWORD *)(v3 + 24) + 8 * (int)v1);
              v24 = v20 - (uint64_t)(int)v1;
              do
              {
                v25 = *v22++;
                *v23 = *v23 + v21 * v25;
                ++v23;
                --v24;
              }
              while (v24);
            }
          }
          ++v19;
        }
        while (v19 < (int)v1);
      }
    }
    else if (v2 > (int)v1)
    {
      v15 = (int)v1;
      v16 = v1;
      do
      {
        this = (***(uint64_t (****)(_QWORD, uint64_t, uint64_t))(v3 + 48))(*(_QWORD *)(v3 + 48), v15, v16);
        v16 = *(unsigned int *)(v3 + 8);
        if ((int)v16 >= 1)
        {
          v17 = 0;
          v18 = *(_QWORD *)(v3 + 32);
          do
          {
            if (*(_BYTE *)(v18 + v17) == 2)
              *(double *)(*(_QWORD *)(v3 + 24) + 8 * v15) = *(double *)(*(_QWORD *)(v3 + 24) + 8 * v15)
                                                          + *(double *)(*(_QWORD *)(v3 + 40) + 8 * v17)
                                                          * *(float *)(this + 4 * v17);
            ++v17;
          }
          while (v16 != v17);
        }
        ++v15;
      }
      while (v15 < *(int *)(v3 + 112));
    }
  }
  return this;
}

uint64_t info(const char *a1, ...)
{
  char v2[1024];
  uint64_t v3;
  va_list va;

  va_start(va, a1);
  v3 = *MEMORY[0x24BDAC8D0];
  vsprintf(v2, a1, va);
  return svm_print_string(v2);
}

uint64_t Solver::Solve(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, const void *a6, uint64_t a7, int a8, double a9, double a10, double a11)
{
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float *v37;
  double v38;
  double *v39;
  uint64_t v40;
  float *v41;
  float v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  double *v46;
  float v47;
  int v48;
  int v49;
  int v50;
  float *v51;
  float *v52;
  uint64_t v53;
  uint64_t v54;
  double *v55;
  int v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  double v83;
  double v84;
  float v85;
  double v86;
  float v87;
  uint64_t v88;
  int v89;
  int v90;
  uint64_t v91;
  double v92;
  char v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  float *v98;
  double *v99;
  uint64_t v100;
  float v101;
  double *v102;
  uint64_t v103;
  float v104;
  float *v105;
  double *v106;
  uint64_t v107;
  float v108;
  double *v109;
  uint64_t v110;
  float v111;
  double *v112;
  double *v113;
  double v114;
  uint64_t v115;
  double *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  uint64_t *v122;
  int *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t result;
  int v135;
  uint64_t v137;

  *(_DWORD *)(a1 + 112) = a2;
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 56) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 8))(a3);
  v20 = (void *)operator new[]();
  *(_QWORD *)(a1 + 88) = v20;
  memcpy(v20, a4, 8 * (int)a2);
  v21 = (void *)operator new[]();
  *(_QWORD *)(a1 + 16) = v21;
  memcpy(v21, a5, (int)a2);
  v22 = (void *)operator new[]();
  *(_QWORD *)(a1 + 40) = v22;
  memcpy(v22, a6, 8 * (int)a2);
  *(double *)(a1 + 72) = a9;
  *(double *)(a1 + 80) = a10;
  *(double *)(a1 + 64) = a11;
  *(_BYTE *)(a1 + 116) = 0;
  *(_QWORD *)(a1 + 32) = operator new[]();
  v23 = a2;
  if ((int)a2 >= 1)
  {
    v24 = 0;
    do
    {
      v25 = *(double *)(*(_QWORD *)(a1 + 40) + 8 * v24);
      if (*(char *)(*(_QWORD *)(a1 + 16) + v24) <= 0)
        v26 = 80;
      else
        v26 = 72;
      if (v25 >= *(double *)(a1 + v26))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + v24) = 1;
      }
      else
      {
        v27 = *(_QWORD *)(a1 + 32);
        if (v25 <= 0.0)
          *(_BYTE *)(v27 + v24) = 0;
        else
          *(_BYTE *)(v27 + v24) = 2;
      }
      ++v24;
    }
    while (a2 != v24);
  }
  v28 = operator new[]();
  *(_QWORD *)(a1 + 96) = v28;
  if ((int)a2 >= 1)
  {
    v29 = 0;
    do
    {
      *(_DWORD *)(v28 + 4 * v29) = v29;
      ++v29;
    }
    while (a2 != v29);
  }
  *(_DWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 24) = operator new[]();
  v30 = (_QWORD *)operator new[]();
  *(_QWORD *)(a1 + 104) = v30;
  if ((int)a2 >= 1)
  {
    v31 = *(uint64_t **)(a1 + 88);
    v32 = *(_QWORD **)(a1 + 24);
    v33 = a2;
    do
    {
      v34 = *v31++;
      *v32++ = v34;
      *v30++ = 0;
      --v33;
    }
    while (v33);
    v35 = 0;
    v36 = *(_QWORD *)(a1 + 32);
    do
    {
      if (*(_BYTE *)(v36 + v35))
      {
        v37 = (float *)(**(uint64_t (***)(uint64_t, uint64_t, uint64_t))a3)(a3, v35, a2);
        v38 = *(double *)(*(_QWORD *)(a1 + 40) + 8 * v35);
        v39 = *(double **)(a1 + 24);
        v40 = a2;
        v41 = v37;
        do
        {
          v42 = *v41++;
          *v39 = *v39 + v38 * v42;
          ++v39;
          --v40;
        }
        while (v40);
        v36 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v36 + v35) == 1)
        {
          v43 = *(_QWORD *)(a1 + 16);
          v44 = *(double **)(a1 + 104);
          v45 = a2;
          do
          {
            if (*(char *)(v43 + v35) <= 0)
              v46 = (double *)(a1 + 80);
            else
              v46 = (double *)(a1 + 72);
            v47 = *v37++;
            *v44 = *v44 + *v46 * v47;
            ++v44;
            --v45;
          }
          while (v45);
        }
      }
      ++v35;
    }
    while (v35 != a2);
  }
  v48 = 0;
  if ((int)a2 >= 1000)
    v49 = 1000;
  else
    v49 = a2;
  v135 = v49;
  v50 = v49 + 1;
  while (1)
  {
    if (!--v50)
    {
      if (a8)
        (*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
      info(".");
      v50 = v135;
    }
    v137 = 0;
    if ((*(unsigned int (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)a1 + 16))(a1, (char *)&v137 + 4, &v137))
    {
      break;
    }
LABEL_40:
    v51 = (float *)(**(uint64_t (***)(uint64_t, _QWORD, _QWORD))a3)(a3, HIDWORD(v137), *(unsigned int *)(a1 + 8));
    v52 = (float *)(**(uint64_t (***)(uint64_t, _QWORD, _QWORD))a3)(a3, v137, *(unsigned int *)(a1 + 8));
    v53 = SHIDWORD(v137);
    v54 = *(_QWORD *)(a1 + 16);
    v55 = *(double **)(a1 + 24);
    v56 = *(unsigned __int8 *)(v54 + SHIDWORD(v137));
    if ((char)v56 <= 0)
      v57 = 80;
    else
      v57 = 72;
    v58 = *(double *)(a1 + v57);
    v59 = (int)v137;
    v60 = *(unsigned __int8 *)(v54 + (int)v137);
    if ((char)v60 <= 0)
      v61 = 80;
    else
      v61 = 72;
    v62 = *(double *)(a1 + v61);
    v63 = *(_QWORD *)(a1 + 56);
    v64 = *(double *)(v63 + 8 * SHIDWORD(v137));
    v65 = *(double *)(v63 + 8 * (int)v137);
    v66 = *(_QWORD *)(a1 + 40);
    v67 = *(double *)(v66 + 8 * SHIDWORD(v137));
    v68 = *(double *)(v66 + 8 * (int)v137);
    v69 = v64 + v65;
    v70 = (float)(v51[(int)v137] + v51[(int)v137]);
    v71 = v55[SHIDWORD(v137)];
    if (v56 == v60)
    {
      v72 = v69 - v70;
      if (v72 <= 0.0)
        v72 = 1.0e-12;
      v73 = (v71 - v55[(int)v137]) / v72;
      v74 = v67 + v68;
      *(double *)(v66 + 8 * SHIDWORD(v137)) = v67 - v73;
      v75 = *(double *)(v66 + 8 * v59) + v73;
      *(double *)(v66 + 8 * v59) = v75;
      if (v67 + v68 <= v58)
      {
        if (v75 < 0.0)
        {
          *(_QWORD *)(v66 + 8 * v59) = 0;
          *(double *)(v66 + 8 * v53) = v74;
        }
      }
      else if (*(double *)(v66 + 8 * v53) > v58)
      {
        *(double *)(v66 + 8 * v53) = v58;
        *(double *)(v66 + 8 * v59) = v74 - v58;
      }
      if (v74 <= v62)
      {
        if (*(double *)(v66 + 8 * v53) >= 0.0)
          goto LABEL_73;
        *(_QWORD *)(v66 + 8 * v53) = 0;
        goto LABEL_69;
      }
      if (*(double *)(v66 + 8 * v59) <= v62)
        goto LABEL_73;
      *(double *)(v66 + 8 * v59) = v62;
      v80 = v74 - v62;
      goto LABEL_72;
    }
    v76 = v69 + v70;
    if (v76 <= 0.0)
      v76 = 1.0e-12;
    v77 = (-v71 - v55[(int)v137]) / v76;
    v78 = v67 - v68;
    *(double *)(v66 + 8 * SHIDWORD(v137)) = v67 + v77;
    v79 = *(double *)(v66 + 8 * v59) + v77;
    *(double *)(v66 + 8 * v59) = v79;
    if (v67 - v68 <= 0.0)
    {
      if (*(double *)(v66 + 8 * v53) < 0.0)
      {
        *(_QWORD *)(v66 + 8 * v53) = 0;
        *(double *)(v66 + 8 * v59) = -v78;
      }
    }
    else if (v79 < 0.0)
    {
      *(_QWORD *)(v66 + 8 * v59) = 0;
      *(double *)(v66 + 8 * v53) = v78;
    }
    if (v78 > v58 - v62)
    {
      if (*(double *)(v66 + 8 * v53) <= v58)
        goto LABEL_73;
      *(double *)(v66 + 8 * v53) = v58;
      v74 = v58 - v78;
LABEL_69:
      *(double *)(v66 + 8 * v59) = v74;
      goto LABEL_73;
    }
    if (*(double *)(v66 + 8 * v59) > v62)
    {
      *(double *)(v66 + 8 * v59) = v62;
      v80 = v62 + v78;
LABEL_72:
      *(double *)(v66 + 8 * v53) = v80;
    }
LABEL_73:
    v81 = *(double *)(v66 + 8 * v53);
    v82 = *(unsigned int *)(a1 + 8);
    if ((int)v82 >= 1)
    {
      v83 = v81 - v67;
      v84 = *(double *)(v66 + 8 * v59) - v68;
      do
      {
        v85 = *v51++;
        v86 = v85;
        v87 = *v52++;
        *v55 = *v55 + v84 * v87 + v86 * v83;
        ++v55;
        --v82;
      }
      while (v82);
      v81 = *(double *)(v66 + 8 * v53);
    }
    v88 = *(_QWORD *)(a1 + 32);
    v89 = *(unsigned __int8 *)(v88 + v53);
    v90 = *(unsigned __int8 *)(v88 + v59);
    if (*(char *)(v54 + v53) <= 0)
      v91 = 80;
    else
      v91 = 72;
    v92 = *(double *)(a1 + v91);
    v93 = 2 * (v81 > 0.0);
    if (v81 >= v92)
      v93 = 1;
    *(_BYTE *)(v88 + v53) = v93;
    v94 = *(double *)(*(_QWORD *)(a1 + 40) + 8 * (int)v137);
    if (*(char *)(*(_QWORD *)(a1 + 16) + (int)v137) <= 0)
      v95 = 80;
    else
      v95 = 72;
    if (v94 >= *(double *)(a1 + v95))
    {
      v96 = *(_QWORD *)(a1 + 32);
      v97 = 1;
      goto LABEL_89;
    }
    v96 = *(_QWORD *)(a1 + 32);
    if (v94 > 0.0)
    {
      v97 = 2;
LABEL_89:
      *(_BYTE *)(v96 + (int)v137) = v97;
      goto LABEL_91;
    }
    *(_BYTE *)(v96 + (int)v137) = 0;
LABEL_91:
    if ((v89 == 1) != (*(_BYTE *)(*(_QWORD *)(a1 + 32) + SHIDWORD(v137)) == 1))
    {
      v98 = (float *)(**(uint64_t (***)(uint64_t))a3)(a3);
      if (v89 == 1)
      {
        if ((int)a2 >= 1)
        {
          v99 = *(double **)(a1 + 104);
          v100 = a2;
          do
          {
            v101 = *v98++;
            *v99 = *v99 + -v58 * v101;
            ++v99;
            --v100;
          }
          while (v100);
        }
      }
      else if ((int)a2 >= 1)
      {
        v102 = *(double **)(a1 + 104);
        v103 = a2;
        do
        {
          v104 = *v98++;
          *v102 = *v102 + v58 * v104;
          ++v102;
          --v103;
        }
        while (v103);
      }
    }
    if ((v90 == 1) != (*(_BYTE *)(*(_QWORD *)(a1 + 32) + (int)v137) == 1))
    {
      v105 = (float *)(**(uint64_t (***)(uint64_t))a3)(a3);
      if (v90 == 1)
      {
        if ((int)a2 >= 1)
        {
          v106 = *(double **)(a1 + 104);
          v107 = a2;
          do
          {
            v108 = *v105++;
            *v106 = *v106 + -v62 * v108;
            ++v106;
            --v107;
          }
          while (v107);
        }
      }
      else if ((int)a2 >= 1)
      {
        v109 = *(double **)(a1 + 104);
        v110 = a2;
        do
        {
          v111 = *v105++;
          *v109 = *v109 + v62 * v111;
          ++v109;
          --v110;
        }
        while (v110);
      }
    }
    ++v48;
  }
  Solver::reconstruct_gradient(a1);
  *(_DWORD *)(a1 + 8) = a2;
  info("*");
  if (!(*(unsigned int (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)a1 + 16))(a1, (char *)&v137 + 4, &v137))
  {
    v50 = 1;
    goto LABEL_40;
  }
  *(double *)(a7 + 8) = (*(double (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  if ((int)a2 <= 0)
  {
    *(_QWORD *)a7 = 0;
  }
  else
  {
    v112 = *(double **)(a1 + 40);
    v113 = *(double **)(a1 + 24);
    v114 = 0.0;
    v115 = a2;
    v116 = *(double **)(a1 + 88);
    do
    {
      v117 = *v112++;
      v118 = v117;
      v119 = *v113++;
      v120 = v119;
      v121 = *v116++;
      v114 = v114 + v118 * (v120 + v121);
      --v115;
    }
    while (v115);
    *(double *)a7 = v114 * 0.5;
    v122 = *(uint64_t **)(a1 + 40);
    v123 = *(int **)(a1 + 96);
    do
    {
      v124 = *v122++;
      v125 = v124;
      v126 = *v123++;
      *((_QWORD *)a6 + v126) = v125;
      --v23;
    }
    while (v23);
  }
  *(double *)(a7 + 16) = a9;
  *(double *)(a7 + 24) = a10;
  info("\noptimization finished, #iter = %d\n", v48);
  v127 = *(_QWORD *)(a1 + 88);
  if (v127)
    MEMORY[0x20BD06830](v127, 0x1000C8000313F17);
  v128 = *(_QWORD *)(a1 + 16);
  if (v128)
    MEMORY[0x20BD06830](v128, 0x1000C8077774924);
  v129 = *(_QWORD *)(a1 + 40);
  if (v129)
    MEMORY[0x20BD06830](v129, 0x1000C8000313F17);
  v130 = *(_QWORD *)(a1 + 32);
  if (v130)
    MEMORY[0x20BD06830](v130, 0x1000C8077774924);
  v131 = *(_QWORD *)(a1 + 96);
  if (v131)
    MEMORY[0x20BD06830](v131, 0x1000C8052888210);
  v132 = *(_QWORD *)(a1 + 24);
  if (v132)
    MEMORY[0x20BD06830](v132, 0x1000C8000313F17);
  result = *(_QWORD *)(a1 + 104);
  if (result)
    return MEMORY[0x20BD06830](result, 0x1000C8000313F17);
  return result;
}

uint64_t Solver::select_working_set(Solver *this, int *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t result;

  v6 = *((unsigned int *)this + 2);
  if ((int)v6 < 1)
  {
    LODWORD(v8) = -1;
    v9 = -INFINITY;
    v12 = -INFINITY;
    v13 = -1;
    goto LABEL_35;
  }
  v7 = 0;
  v8 = 0xFFFFFFFFLL;
  v9 = -INFINITY;
  do
  {
    if (*(_BYTE *)(*((_QWORD *)this + 2) + v7) == 1)
    {
      if (*(_BYTE *)(*((_QWORD *)this + 4) + v7) != 1)
      {
        v10 = -*(double *)(*((_QWORD *)this + 3) + 8 * v7);
        if (v9 <= v10)
          goto LABEL_9;
      }
    }
    else if (*(_BYTE *)(*((_QWORD *)this + 4) + v7))
    {
      v10 = *(double *)(*((_QWORD *)this + 3) + 8 * v7);
      if (v10 >= v9)
      {
LABEL_9:
        v9 = v10;
        v8 = v7;
      }
    }
    ++v7;
  }
  while (v6 != v7);
  if ((_DWORD)v8 == -1)
  {
    v11 = 0;
    LODWORD(v8) = -1;
  }
  else
  {
    v11 = (***((uint64_t (****)(_QWORD, uint64_t))this + 6))(*((_QWORD *)this + 6), v8);
    LODWORD(v6) = *((_DWORD *)this + 2);
  }
  if ((int)v6 >= 1)
  {
    v14 = 0;
    v15 = *((_QWORD *)this + 2);
    v13 = -1;
    v12 = -INFINITY;
    v16 = INFINITY;
    while (1)
    {
      if (*(_BYTE *)(v15 + v14) == 1)
      {
        if (!*(_BYTE *)(*((_QWORD *)this + 4) + v14))
          goto LABEL_32;
        v17 = *((_QWORD *)this + 3);
        v18 = *(double *)(v17 + 8 * v14);
        v19 = v9 + v18;
        if (v18 >= v12)
          v12 = *(double *)(v17 + 8 * v14);
        if (v19 <= 0.0)
          goto LABEL_32;
        v20 = *(double *)(*((_QWORD *)this + 7) + 8 * (int)v8) + *(double *)(*((_QWORD *)this + 7) + 8 * v14);
        v21 = *(float *)(v11 + 4 * v14);
        v22 = (double)*(char *)(v15 + (int)v8) * -2.0;
      }
      else
      {
        if (*(_BYTE *)(*((_QWORD *)this + 4) + v14) == 1)
          goto LABEL_32;
        v23 = *(double *)(*((_QWORD *)this + 3) + 8 * v14);
        v19 = v9 - v23;
        v24 = -v23;
        if (v12 <= v24)
          v12 = v24;
        if (v19 <= 0.0)
          goto LABEL_32;
        v20 = *(double *)(*((_QWORD *)this + 7) + 8 * (int)v8) + *(double *)(*((_QWORD *)this + 7) + 8 * v14);
        v22 = (double)*(char *)(v15 + (int)v8) + (double)*(char *)(v15 + (int)v8);
        v21 = *(float *)(v11 + 4 * v14);
      }
      v25 = v20 + v22 * v21;
      v26 = -(v19 * v19);
      if (v25 <= 0.0)
        v25 = 1.0e-12;
      v27 = v26 / v25;
      if (v27 <= v16)
      {
        v13 = v14;
        v16 = v27;
      }
LABEL_32:
      if (v6 == ++v14)
        goto LABEL_35;
    }
  }
  v13 = -1;
  v12 = -INFINITY;
LABEL_35:
  if (v9 + v12 < *((double *)this + 8))
    return 1;
  result = 0;
  *a2 = v8;
  *a3 = v13;
  return result;
}

BOOL Solver::be_shrunk(Solver *this, int a2, double a3, double a4)
{
  double v4;
  BOOL v5;

  if (*(_BYTE *)(*((_QWORD *)this + 4) + a2))
  {
    if (*(_BYTE *)(*((_QWORD *)this + 4) + a2) != 1)
      return 0;
    v4 = -*(double *)(*((_QWORD *)this + 3) + 8 * a2);
    if (*(_BYTE *)(*((_QWORD *)this + 2) + a2) != 1)
      goto LABEL_4;
  }
  else
  {
    v4 = *(double *)(*((_QWORD *)this + 3) + 8 * a2);
    if (*(_BYTE *)(*((_QWORD *)this + 2) + a2) == 1)
    {
LABEL_4:
      v5 = v4 <= a4;
      return !v5;
    }
  }
  v5 = v4 <= a3;
  return !v5;
}

void Solver::do_shrinking(Solver *this)
{
  int v2;
  unsigned __int8 *v3;
  double *v4;
  unsigned __int8 *v5;
  double v6;
  uint64_t v7;
  double v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  int i;

  v2 = *((_DWORD *)this + 2);
  if (v2 < 1)
  {
    v8 = -INFINITY;
    v6 = -INFINITY;
  }
  else
  {
    v4 = (double *)*((_QWORD *)this + 3);
    v3 = (unsigned __int8 *)*((_QWORD *)this + 4);
    v5 = (unsigned __int8 *)*((_QWORD *)this + 2);
    v6 = -INFINITY;
    v7 = *((unsigned int *)this + 2);
    v8 = -INFINITY;
    do
    {
      v10 = *v5++;
      v9 = v10;
      v12 = *v3++;
      v11 = v12;
      v13 = *v4;
      if (v9 == 1)
      {
        if (v11 == 1)
          goto LABEL_8;
        if (v8 <= -v13)
          v8 = -v13;
        if (v11)
        {
LABEL_8:
          if (v13 >= v6)
            v6 = *v4;
        }
      }
      else
      {
        if (v11 == 1)
          goto LABEL_15;
        if (v6 <= -v13)
          v6 = -v13;
        if (v11)
        {
LABEL_15:
          if (v13 >= v8)
            v8 = *v4;
        }
      }
      ++v4;
      --v7;
    }
    while (v7);
  }
  if (!*((_BYTE *)this + 116) && v8 + v6 <= *((double *)this + 8) * 10.0)
  {
    *((_BYTE *)this + 116) = 1;
    Solver::reconstruct_gradient((uint64_t)this);
    *((_DWORD *)this + 2) = *((_DWORD *)this + 28);
    info("*");
    v2 = *((_DWORD *)this + 2);
  }
  if (v2 >= 1)
  {
    for (i = 0; i < v2; ++i)
    {
      if (Solver::be_shrunk(this, i, v8, v6))
      {
        while (1)
        {
          *((_DWORD *)this + 2) = --v2;
          if (v2 <= i)
            break;
          if (!Solver::be_shrunk(this, v2, v8, v6))
          {
            Solver::swap_index(this, i, v2);
            v2 = *((_DWORD *)this + 2);
            break;
          }
        }
      }
    }
  }
}

double Solver::calculate_rho(Solver *this)
{
  uint64_t v1;
  int v2;
  unsigned __int8 *v3;
  double *v4;
  unsigned __int8 *v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;

  v1 = *((unsigned int *)this + 2);
  if ((int)v1 < 1)
  {
    v7 = INFINITY;
    v8 = -INFINITY;
  }
  else
  {
    v2 = 0;
    v3 = (unsigned __int8 *)*((_QWORD *)this + 2);
    v4 = (double *)*((_QWORD *)this + 3);
    v5 = (unsigned __int8 *)*((_QWORD *)this + 4);
    v6 = 0.0;
    v7 = INFINITY;
    v8 = -INFINITY;
    do
    {
      v10 = *v3++;
      v9 = v10;
      v11 = (double)(char)v10;
      v12 = *v4++;
      v13 = v12 * v11;
      LODWORD(v12) = *v5++;
      v14 = LODWORD(v12);
      if (v8 <= v13)
        v15 = v13;
      else
        v15 = v8;
      if (v7 >= v13)
        v16 = v13;
      else
        v16 = v7;
      if (v9 == 1)
        v15 = v8;
      else
        v16 = v7;
      v17 = v6 + v13;
      if (v8 <= v13)
        v18 = v13;
      else
        v18 = v8;
      if (v7 < v13)
        v13 = v7;
      if (v9 == 255)
        v18 = v8;
      else
        v13 = v7;
      if (v14 == 1)
        v19 = v2;
      else
        v19 = v2 + 1;
      if (v14 == 1)
      {
        v7 = v13;
        v8 = v18;
        v20 = v6;
      }
      else
      {
        v20 = v17;
      }
      if (v14)
      {
        v2 = v19;
      }
      else
      {
        v7 = v16;
        v8 = v15;
      }
      if (v14)
        v6 = v20;
      --v1;
    }
    while (v1);
    if (v2 > 0)
      return v6 / (double)v2;
  }
  return (v7 + v8) * 0.5;
}

uint64_t Solver_NU::select_working_set(Solver_NU *this, int *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t result;
  int v32;

  v6 = *((unsigned int *)this + 2);
  if ((int)v6 < 1)
  {
    LODWORD(v8) = -1;
    v9 = -INFINITY;
    LODWORD(v10) = -1;
    v11 = -INFINITY;
    v13 = -INFINITY;
    v14 = -INFINITY;
    v15 = -1;
  }
  else
  {
    v7 = 0;
    v8 = 0xFFFFFFFFLL;
    v9 = -INFINITY;
    v10 = 0xFFFFFFFFLL;
    v11 = -INFINITY;
    do
    {
      if (*(_BYTE *)(*((_QWORD *)this + 2) + v7) == 1)
      {
        if (*(_BYTE *)(*((_QWORD *)this + 4) + v7) != 1 && v11 <= -*(double *)(*((_QWORD *)this + 3) + 8 * v7))
        {
          v11 = -*(double *)(*((_QWORD *)this + 3) + 8 * v7);
          v10 = v7;
        }
      }
      else if (*(_BYTE *)(*((_QWORD *)this + 4) + v7) && *(double *)(*((_QWORD *)this + 3) + 8 * v7) >= v9)
      {
        v9 = *(double *)(*((_QWORD *)this + 3) + 8 * v7);
        v8 = v7;
      }
      ++v7;
    }
    while (v6 != v7);
    if ((_DWORD)v10 == -1)
    {
      v12 = 0;
      LODWORD(v10) = -1;
    }
    else
    {
      v12 = (***((uint64_t (****)(_QWORD, uint64_t))this + 6))(*((_QWORD *)this + 6), v10);
      v6 = *((unsigned int *)this + 2);
    }
    if ((_DWORD)v8 == -1)
    {
      v16 = 0;
      LODWORD(v8) = -1;
    }
    else
    {
      v16 = (***((uint64_t (****)(_QWORD, uint64_t, uint64_t))this + 6))(*((_QWORD *)this + 6), v8, v6);
      LODWORD(v6) = *((_DWORD *)this + 2);
    }
    if ((int)v6 >= 1)
    {
      v17 = 0;
      v15 = -1;
      v14 = -INFINITY;
      v18 = INFINITY;
      v13 = -INFINITY;
      while (1)
      {
        if (*(_BYTE *)(*((_QWORD *)this + 2) + v17) == 1)
        {
          if (!*(_BYTE *)(*((_QWORD *)this + 4) + v17))
            goto LABEL_35;
          v19 = *((_QWORD *)this + 3);
          v20 = *(double *)(v19 + 8 * v17);
          v21 = v11 + v20;
          if (v20 >= v13)
            v13 = *(double *)(v19 + 8 * v17);
          if (v21 <= 0.0)
            goto LABEL_35;
          v22 = *(double *)(*((_QWORD *)this + 7) + 8 * (int)v10) + *(double *)(*((_QWORD *)this + 7) + 8 * v17);
          v23 = *(float *)(v12 + 4 * v17);
        }
        else
        {
          if (*(_BYTE *)(*((_QWORD *)this + 4) + v17) == 1)
            goto LABEL_35;
          v24 = *(double *)(*((_QWORD *)this + 3) + 8 * v17);
          v21 = v9 - v24;
          v25 = -v24;
          if (v14 <= v25)
            v14 = v25;
          if (v21 <= 0.0)
            goto LABEL_35;
          v22 = *(double *)(*((_QWORD *)this + 7) + 8 * (int)v8) + *(double *)(*((_QWORD *)this + 7) + 8 * v17);
          v23 = *(float *)(v16 + 4 * v17);
        }
        v26 = v22 - (float)(v23 + v23);
        v27 = -(v21 * v21);
        if (v26 <= 0.0)
          v26 = 1.0e-12;
        v28 = v27 / v26;
        if (v28 <= v18)
        {
          v15 = v17;
          v18 = v28;
        }
LABEL_35:
        if (v6 == ++v17)
          goto LABEL_38;
      }
    }
    v15 = -1;
    v13 = -INFINITY;
    v14 = -INFINITY;
  }
LABEL_38:
  v29 = v11 + v13;
  v30 = v9 + v14;
  if (v29 > v30)
    v30 = v29;
  if (v30 < *((double *)this + 8))
    return 1;
  result = 0;
  if (*(_BYTE *)(*((_QWORD *)this + 2) + v15) == 1)
    v32 = v10;
  else
    v32 = v8;
  *a2 = v32;
  *a3 = v15;
  return result;
}

BOOL Solver_NU::be_shrunk(Solver_NU *this, int a2, double a3, double a4, double a5, double a6)
{
  double v6;
  BOOL v7;
  double v8;

  if (*(_BYTE *)(*((_QWORD *)this + 4) + a2))
  {
    if (*(_BYTE *)(*((_QWORD *)this + 4) + a2) != 1)
      return 0;
    v6 = -*(double *)(*((_QWORD *)this + 3) + 8 * a2);
    if (*(_BYTE *)(*((_QWORD *)this + 2) + a2) == 1)
      v7 = v6 <= a3;
    else
      v7 = v6 <= a6;
  }
  else
  {
    v8 = *(double *)(*((_QWORD *)this + 3) + 8 * a2);
    if (*(_BYTE *)(*((_QWORD *)this + 2) + a2) == 1)
      v7 = v8 <= a4;
    else
      v7 = v8 <= a5;
  }
  return !v7;
}

void Solver_NU::do_shrinking(Solver_NU *this)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  int v12;

  v2 = *((unsigned int *)this + 2);
  if ((int)v2 < 1)
  {
    v7 = -INFINITY;
    v6 = -INFINITY;
    v5 = -INFINITY;
    v4 = -INFINITY;
  }
  else
  {
    v3 = 0;
    v4 = -INFINITY;
    v5 = -INFINITY;
    v6 = -INFINITY;
    v7 = -INFINITY;
    do
    {
      v8 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v3);
      if (*(_BYTE *)(*((_QWORD *)this + 4) + v3) == 1)
        goto LABEL_10;
      v9 = -*(double *)(*((_QWORD *)this + 3) + 8 * v3);
      if (v8 == 1)
      {
        if (v7 < v9)
          v7 = -*(double *)(*((_QWORD *)this + 3) + 8 * v3);
      }
      else if (v4 < v9)
      {
        v4 = -*(double *)(*((_QWORD *)this + 3) + 8 * v3);
      }
      if (*(_BYTE *)(*((_QWORD *)this + 4) + v3))
      {
LABEL_10:
        v10 = *(double *)(*((_QWORD *)this + 3) + 8 * v3);
        if (v8 == 1)
        {
          if (v10 > v6)
            v6 = *(double *)(*((_QWORD *)this + 3) + 8 * v3);
        }
        else if (v10 > v5)
        {
          v5 = *(double *)(*((_QWORD *)this + 3) + 8 * v3);
        }
      }
      ++v3;
    }
    while (v2 != v3);
  }
  if (!*((_BYTE *)this + 116))
  {
    v11 = v7 + v6;
    if (v7 + v6 <= v5 + v4)
      v11 = v5 + v4;
    if (v11 <= *((double *)this + 8) * 10.0)
    {
      *((_BYTE *)this + 116) = 1;
      Solver::reconstruct_gradient((uint64_t)this);
      LODWORD(v2) = *((_DWORD *)this + 28);
      *((_DWORD *)this + 2) = v2;
    }
  }
  if ((int)v2 >= 1)
  {
    v12 = 0;
    do
    {
      if (Solver_NU::be_shrunk(this, v12, v7, v6, v5, v4))
      {
        while (1)
        {
          LODWORD(v2) = v2 - 1;
          *((_DWORD *)this + 2) = v2;
          if ((int)v2 <= v12)
            break;
          if (!Solver_NU::be_shrunk(this, v2, v7, v6, v5, v4))
          {
            Solver::swap_index(this, v12, v2);
            LODWORD(v2) = *((_DWORD *)this + 2);
            break;
          }
        }
      }
      ++v12;
    }
    while (v12 < (int)v2);
  }
}

double Solver_NU::calculate_rho(Solver_NU *this)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;

  v1 = *((unsigned int *)this + 2);
  if ((int)v1 < 1)
  {
    v3 = 0;
    v5 = 0.0;
    v6 = INFINITY;
    v7 = -INFINITY;
    v9 = -INFINITY;
    v10 = INFINITY;
  }
  else
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0.0;
    v6 = INFINITY;
    v7 = -INFINITY;
    v8 = 0.0;
    v9 = -INFINITY;
    v10 = INFINITY;
    do
    {
      v11 = *(unsigned __int8 *)(*((_QWORD *)this + 4) + v2);
      if (*(_BYTE *)(*((_QWORD *)this + 2) + v2) == 1)
      {
        if (*(_BYTE *)(*((_QWORD *)this + 4) + v2))
        {
          if (v11 == 1)
          {
            if (v9 <= *(double *)(*((_QWORD *)this + 3) + 8 * v2))
              v9 = *(double *)(*((_QWORD *)this + 3) + 8 * v2);
          }
          else
          {
            ++v4;
            v8 = v8 + *(double *)(*((_QWORD *)this + 3) + 8 * v2);
          }
        }
        else if (v10 >= *(double *)(*((_QWORD *)this + 3) + 8 * v2))
        {
          v10 = *(double *)(*((_QWORD *)this + 3) + 8 * v2);
        }
      }
      else if (*(_BYTE *)(*((_QWORD *)this + 4) + v2))
      {
        if (v11 == 1)
        {
          if (v7 <= *(double *)(*((_QWORD *)this + 3) + 8 * v2))
            v7 = *(double *)(*((_QWORD *)this + 3) + 8 * v2);
        }
        else
        {
          ++v3;
          v5 = v5 + *(double *)(*((_QWORD *)this + 3) + 8 * v2);
        }
      }
      else if (v6 >= *(double *)(*((_QWORD *)this + 3) + 8 * v2))
      {
        v6 = *(double *)(*((_QWORD *)this + 3) + 8 * v2);
      }
      ++v2;
    }
    while (v1 != v2);
    if (v4 > 0)
    {
      v12 = v8 / (double)v4;
      goto LABEL_27;
    }
  }
  v12 = (v10 + v9) * 0.5;
LABEL_27:
  if (v3 < 1)
    v13 = (v6 + v7) * 0.5;
  else
    v13 = v5 / (double)v3;
  *(double *)(*((_QWORD *)this + 15) + 32) = (v12 + v13) * 0.5;
  return (v12 - v13) * 0.5;
}

char *svm_train(int *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void **v11;
  double *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  double *v17;
  double v18;
  uint64_t v19;
  double *v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  uint64_t v26;
  double *v27;
  double v28;
  double v29;
  BOOL v30;
  size_t v31;
  size_t v32;
  int *v33;
  _QWORD *v34;
  _QWORD *v35;
  size_t v36;
  int *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  double *v42;
  uint64_t v43;
  double *v44;
  int v45;
  uint64_t v46;
  _DWORD *v47;
  FILE **v48;
  uint64_t v49;
  char *v50;
  char *v51;
  _QWORD *v52;
  size_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  double v68;
  double v69;
  int *v70;
  double *v71;
  uint64_t i;
  int v73;
  uint64_t j;
  uint64_t v75;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  double *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  double v91;
  int *v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  BOOL v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  double *v100;
  uint64_t v101;
  int **v102;
  uint64_t v103;
  int *v104;
  uint64_t v105;
  uint64_t v106;
  int *v107;
  uint64_t v108;
  uint64_t v109;
  int *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double *v114;
  double v115;
  double v116;
  double v117;
  double *v118;
  uint64_t v119;
  double v120;
  double *v121;
  double v122;
  double v123;
  double *v124;
  double *v125;
  uint64_t v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  long double v135;
  int v136;
  _QWORD *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double *v142;
  double *v143;
  uint64_t v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  long double v151;
  double v152;
  double v153;
  long double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double *v162;
  double *v163;
  uint64_t v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  long double v173;
  uint64_t v174;
  double *v175;
  double **v176;
  double *v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  double *v181;
  double *v182;
  char *v183;
  size_t v184;
  _DWORD *v185;
  int *v186;
  uint64_t v187;
  int v188;
  _QWORD *v189;
  int v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  _QWORD *v194;
  _QWORD *v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  int *v200;
  _DWORD *v201;
  uint64_t v202;
  int v203;
  unsigned int *v204;
  int *v205;
  uint64_t v206;
  int v207;
  char *v208;
  int v209;
  size_t v210;
  void *v211;
  unsigned __int8 *v212;
  int v213;
  uint64_t v214;
  _QWORD *v215;
  _DWORD *v217;
  double *v218;
  int v219;
  _DWORD *v220;
  uint64_t v221;
  int *v222;
  int v223;
  uint64_t v224;
  _QWORD *v225;
  int *v226;
  unsigned int *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  int v239;
  int v240;
  char *v241;
  uint64_t v242;
  uint64_t v244;
  void **v245;
  void *v246;
  double v247;
  uint64_t v248;
  uint64_t v249;
  _QWORD *v250;
  uint64_t v251;
  unsigned int v252;
  double *v253;
  double v254;
  int v255;
  size_t v256;
  uint64_t v257;
  unint64_t v258;
  int v259;
  uint64_t v260;
  double v261;
  void *v263;
  uint64_t v264;
  int v265;
  uint64_t v266;
  size_t size;
  size_t v268;
  unsigned int v269;
  char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  _QWORD *v275;
  double *v276;
  _QWORD *v277;
  uint64_t v278;
  unsigned int *v279;
  int *v280;
  uint64_t v281;
  char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  double *v289;
  int v290;
  uint64_t v291;
  _QWORD *v292;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  int v299;
  void *v300;
  void *v301;
  unsigned int *v302;
  int *v303;
  void *v304;
  unsigned int v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  void *v310[2];
  __int128 v311;
  uint64_t v312;
  int v313;
  double *v314;
  _QWORD *v315;

  v4 = (char *)malloc_type_malloc(0xB0uLL, 0x1090040ECD48006uLL);
  v5 = v4;
  v6 = *(_OWORD *)a2;
  v7 = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v4 + 1) = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v4 + 2) = v7;
  *(_OWORD *)v4 = v6;
  v8 = *(_OWORD *)(a2 + 48);
  v9 = *(_OWORD *)(a2 + 64);
  v10 = *(_OWORD *)(a2 + 80);
  *((_QWORD *)v4 + 12) = *(_QWORD *)(a2 + 96);
  *((_OWORD *)v4 + 4) = v9;
  *((_OWORD *)v4 + 5) = v10;
  *((_OWORD *)v4 + 3) = v8;
  *((_DWORD *)v4 + 42) = 0;
  if ((*(_DWORD *)a2 - 2) <= 2)
  {
    *(_OWORD *)(v4 + 136) = 0u;
    v11 = (void **)(v4 + 136);
    *((_DWORD *)v4 + 26) = 2;
    *(_OWORD *)(v4 + 152) = 0u;
    *((_QWORD *)v4 + 15) = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
    if (*(_DWORD *)(a2 + 100) && (*(_DWORD *)a2 - 3) <= 1)
    {
      *v11 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
      v12 = (double *)malloc_type_malloc(8 * *a1, 0x100004000313F17uLL);
      v312 = *(_QWORD *)(a2 + 96);
      v13 = *(_OWORD *)(a2 + 64);
      v311 = *(_OWORD *)(a2 + 80);
      v14 = *(_OWORD *)(a2 + 16);
      v306 = *(_OWORD *)a2;
      v307 = v14;
      v15 = *(_OWORD *)(a2 + 32);
      v309 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v310 = v13;
      v308 = v15;
      HIDWORD(v312) = 0;
      svm_cross_validation(a1, &v306, 5, (uint64_t)v12);
      v16 = *a1;
      if ((int)v16 < 1)
      {
        v23 = 0;
        v25 = 0.0;
      }
      else
      {
        v17 = (double *)*((_QWORD *)a1 + 1);
        v18 = 0.0;
        v19 = *a1;
        v20 = v12;
        do
        {
          v21 = *v17++;
          v22 = *v20;
          *v20 = v21 - *v20;
          ++v20;
          v18 = v18 + vabdd_f64(v21, v22);
          --v19;
        }
        while (v19);
        v23 = 0;
        v24 = sqrt(v18 / (double)(int)v16 * (v18 / (double)(int)v16 + v18 / (double)(int)v16)) * 5.0;
        v25 = 0.0;
        v26 = v16;
        v27 = v12;
        do
        {
          v28 = *v27++;
          v29 = fabs(v28);
          v30 = v29 <= v24;
          if (v29 > v24)
            v29 = -0.0;
          v25 = v25 + v29;
          if (!v30)
            ++v23;
          --v26;
        }
        while (v26);
      }
      v247 = v25 / (double)((int)v16 - v23);
      info("Prob. model for test data: target value = predicted value + z,\nz: Laplace distribution e^(-|z|/sigma)/(2sigma),sigma= %g\n", v247);
      free(v12);
      *(double *)*v11 = v247;
    }
    v218 = (double *)svm_train_one(a1, a2, 0.0, 0.0);
    v249 = v248;
    v250 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
    *((_QWORD *)v5 + 16) = v250;
    *v250 = v249;
    v251 = *a1;
    if ((int)v251 < 1)
    {
      v252 = 0;
    }
    else
    {
      v252 = 0;
      v253 = v218;
      do
      {
        v254 = *v253++;
        v255 = v254 < 0.0;
        if (v254 > 0.0)
          v255 = 1;
        v252 += v255;
        --v251;
      }
      while (v251);
    }
    *((_DWORD *)v5 + 27) = v252;
    v256 = 8 * v252;
    *((_QWORD *)v5 + 14) = malloc_type_malloc(v256, 0x2004093837F09uLL);
    **((_QWORD **)v5 + 15) = malloc_type_malloc(v256, 0x100004000313F17uLL);
    v257 = *a1;
    if ((int)v257 >= 1)
    {
      v258 = 0;
      v259 = 0;
      v260 = 8 * v257;
      do
      {
        v261 = v218[v258 / 8];
        if (v261 != 0.0)
        {
          *(_QWORD *)(*((_QWORD *)v5 + 14) + 8 * v259) = *(_QWORD *)(*((_QWORD *)a1 + 2) + v258);
          *(double *)(**((_QWORD **)v5 + 15) + 8 * v259++) = v261;
        }
        v258 += 8;
      }
      while (v260 != v258);
    }
    goto LABEL_229;
  }
  v31 = *a1;
  v32 = *a1;
  v305 = 0;
  v303 = 0;
  v304 = 0;
  v302 = 0;
  v33 = (int *)malloc_type_malloc(4 * v31, 0x100004052888210uLL);
  svm_group_classes(a1, (int *)&v305, &v304, &v303, &v302, (uint64_t)v33);
  v34 = malloc_type_malloc(8 * v31, 0x2004093837F09uLL);
  v35 = v34;
  size = v31;
  if ((int)v31 >= 1)
  {
    v36 = v32;
    v37 = v33;
    v38 = v34;
    do
    {
      v39 = *v37++;
      *v38++ = *(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * v39);
      --v36;
    }
    while (v36);
  }
  v268 = v32;
  v263 = v33;
  v40 = v305;
  v41 = (double *)malloc_type_malloc(8 * (int)v305, 0x100004000313F17uLL);
  v42 = v41;
  v269 = v40 - 1;
  if ((int)v40 >= 1)
  {
    v43 = v40;
    v44 = v41;
    do
    {
      *v44++ = *(double *)(a2 + 48);
      --v43;
    }
    while (v43);
  }
  v45 = *(_DWORD *)(a2 + 56);
  if (v45 >= 1)
  {
    v46 = 0;
    v47 = v304;
    v48 = (FILE **)MEMORY[0x24BDAC8D8];
    do
    {
      if ((int)v40 < 1)
      {
        LODWORD(v49) = 0;
      }
      else
      {
        v49 = 0;
        while (*(_DWORD *)(*(_QWORD *)(a2 + 64) + 4 * v46) != v47[v49])
        {
          if (v40 == ++v49)
            goto LABEL_29;
        }
      }
      if ((_DWORD)v49 == (_DWORD)v40)
      {
LABEL_29:
        fprintf(*v48, "warning: class label %d specified in weight is not found\n", *(_DWORD *)(*(_QWORD *)(a2 + 64) + 4 * v46));
        v45 = *(_DWORD *)(a2 + 56);
      }
      else
      {
        v42[v49] = *(double *)(*(_QWORD *)(a2 + 72) + 8 * v46) * v42[v49];
      }
      ++v46;
    }
    while (v46 < v45);
  }
  v50 = (char *)malloc_type_malloc(size, 0x100004077774924uLL);
  v51 = v50;
  if ((int)v268 >= 1)
    bzero(v50, v268);
  v282 = v51;
  v265 = v269 * v40;
  v52 = malloc_type_malloc(16 * ((int)(v269 * v40) / 2), 0x1080040FC6463CFuLL);
  v264 = (uint64_t)(int)(v269 * v40 + ((int)(v269 * v40) < 0)) >> 1;
  v53 = 8 * v264;
  v266 = 8 * v264;
  if (*(_DWORD *)(a2 + 100))
  {
    v292 = malloc_type_malloc(v53, 0x100004000313F17uLL);
    v54 = (double *)malloc_type_malloc(v53, 0x100004000313F17uLL);
  }
  else
  {
    v292 = 0;
    v54 = 0;
  }
  v55 = (int)v40;
  v276 = v42;
  v277 = v52;
  v289 = v54;
  v271 = (int)v40;
  if ((int)v40 < 1)
    goto LABEL_161;
  v56 = 0;
  LODWORD(v291) = 0;
  v279 = v302;
  v280 = v303;
  v57 = -1.0;
  v58 = 1;
  v270 = v5;
  v274 = a2;
  v275 = v35;
  v281 = v40;
  do
  {
    v59 = v56 + 1;
    if (v56 + 1 >= v55)
      goto LABEL_160;
    v272 = v56 + 1;
    v273 = v58;
    v291 = (int)v291;
    v60 = v58;
    v278 = v56;
    do
    {
      v284 = v280[v56];
      v61 = (int)v279[v56];
      v286 = v280[v60];
      v287 = v279[v56];
      v288 = v279[v60];
      v299 = v288 + v61;
      v301 = malloc_type_malloc(8 * ((int)v288 + (int)v61), 0x2004093837F09uLL);
      v300 = malloc_type_malloc(8 * v299, 0x100004000313F17uLL);
      v285 = v61;
      if ((int)v61 >= 1)
      {
        v62 = 0;
        do
        {
          *(_QWORD *)((char *)v301 + v62 * 8) = v35[v284 + v62];
          *(_QWORD *)((char *)v300 + v62 * 8) = 0x3FF0000000000000;
          ++v62;
        }
        while (v287 != v62);
      }
      v63 = v288;
      v64 = v291;
      if ((int)v288 >= 1)
      {
        v65 = 8 * v285;
        v66 = &v35[v286];
        do
        {
          v67 = *v66++;
          *(_QWORD *)((char *)v301 + v65) = v67;
          *(_QWORD *)((char *)v300 + v65) = 0xBFF0000000000000;
          v65 += 8;
          --v63;
        }
        while (v63);
      }
      if (!*(_DWORD *)(a2 + 100))
        goto LABEL_146;
      v68 = v42[v56];
      v283 = v60;
      v69 = v42[v60];
      v70 = (int *)malloc_type_malloc(4 * v299, 0x100004052888210uLL);
      v71 = (double *)malloc_type_malloc(8 * v299, 0x100004000313F17uLL);
      if (v299 >= 1)
      {
        for (i = 0; i < v299; ++i)
          v70[i] = i;
        if (v299 >= 1)
        {
          v73 = 0;
          for (j = 0; j < v299; ++j)
          {
            v75 = j + rand() % (v73 + v299);
            v76 = v70[j];
            v70[j] = v70[v75];
            v70[v75] = v76;
            --v73;
          }
        }
      }
      v77 = 0;
      do
      {
        v78 = v299 * v77;
        v79 = (v299 * v77++ / 5);
        v80 = v299 * v77 / 5;
        v313 = v79 - v80 + v299;
        v315 = malloc_type_malloc(8 * v313, 0x2004093837F09uLL);
        v81 = (double *)malloc_type_malloc(8 * v313, 0x100004000313F17uLL);
        v314 = v81;
        if (v78 < 5)
        {
          LODWORD(v84) = 0;
        }
        else
        {
          v82 = 0;
          do
          {
            v83 = v70[v82];
            v315[v82] = *((_QWORD *)v301 + v83);
            v81 = v314;
            v314[v82++] = *((double *)v300 + v83);
          }
          while (v79 != v82);
          LODWORD(v84) = v78 / 5;
        }
        if (v80 < v299)
        {
          v85 = &v70[v80];
          v86 = v84;
          v87 = v299 - (uint64_t)v80;
          do
          {
            v88 = *v85++;
            v315[v86] = *((_QWORD *)v301 + v88);
            v81 = v314;
            v314[v86++] = *((double *)v300 + v88);
            LODWORD(v84) = v84 + 1;
            --v87;
          }
          while (v87);
        }
        if ((_DWORD)v84)
        {
          v89 = 0;
          v90 = 0;
          v84 = v84;
          do
          {
            v91 = *v81++;
            if (v91 <= 0.0)
              ++v89;
            else
              ++v90;
            --v84;
          }
          while (v84);
        }
        else
        {
          v90 = 0;
          v89 = 0;
        }
        if (v90 | v89)
        {
          if (v90)
            v95 = v89 == 0;
          else
            v95 = 0;
          if (v95)
          {
            if ((int)v79 < v80)
            {
              v107 = &v70[(int)v79];
              v108 = v80 - (uint64_t)(int)v79;
              do
              {
                v109 = *v107++;
                v71[v109] = 1.0;
                --v108;
              }
              while (v108);
            }
          }
          else
          {
            if (v90)
              v96 = 1;
            else
              v96 = v89 == 0;
            if (v96)
            {
              v312 = *(_QWORD *)(a2 + 96);
              v97 = *(_OWORD *)(a2 + 64);
              v311 = *(_OWORD *)(a2 + 80);
              v98 = *(_OWORD *)(a2 + 16);
              v306 = *(_OWORD *)a2;
              v307 = v98;
              v99 = *(_OWORD *)(a2 + 32);
              HIDWORD(v309) = HIDWORD(*(_OWORD *)(a2 + 48));
              *(_OWORD *)v310 = v97;
              v308 = v99;
              HIDWORD(v312) = 0;
              *(_QWORD *)&v309 = 0x3FF0000000000000;
              DWORD2(v309) = 2;
              v310[0] = malloc_type_malloc(8uLL, 0x100004052888210uLL);
              v100 = (double *)malloc_type_malloc(0x10uLL, 0x100004000313F17uLL);
              v310[1] = v100;
              *(_QWORD *)v310[0] = 0xFFFFFFFF00000001;
              *v100 = v68;
              v100[1] = v69;
              v101 = svm_train(&v313, &v306);
              v102 = (int **)v101;
              if ((int)v79 >= v80)
              {
                if (v101)
                  goto LABEL_98;
              }
              else
              {
                v103 = v80;
                v104 = &v70[(int)v79];
                v105 = v103 - (int)v79;
                do
                {
                  svm_predict_values((uint64_t)v102, *((double **)v301 + *v104), &v71[*v104]);
                  v106 = *v104++;
                  v71[v106] = v71[v106] * (double)*v102[19];
                  --v105;
                }
                while (v105);
LABEL_98:
                svm_free_model_content((uint64_t)v102);
                free(v102);
              }
              free(v310[0]);
              free(v310[1]);
              goto LABEL_100;
            }
            if ((int)v79 < v80)
            {
              v110 = &v70[(int)v79];
              v111 = v80 - (uint64_t)(int)v79;
              do
              {
                v112 = *v110++;
                v71[v112] = -1.0;
                --v111;
              }
              while (v111);
            }
          }
        }
        else if ((int)v79 < v80)
        {
          v92 = &v70[(int)v79];
          v93 = v80 - (uint64_t)(int)v79;
          do
          {
            v94 = *v92++;
            v71[v94] = 0.0;
            --v93;
          }
          while (v93);
        }
LABEL_100:
        free(v315);
        free(v314);
      }
      while (v77 != 5);
      v113 = v299;
      v114 = (double *)v300;
      v115 = 0.0;
      v116 = 0.0;
      v117 = 0.0;
      v290 = v299;
      if (v299 >= 1)
      {
        v118 = (double *)v300;
        v119 = v299;
        do
        {
          v120 = *v118++;
          if (v120 <= 0.0)
            v117 = v117 + 1.0;
          else
            v116 = v116 + 1.0;
          --v119;
        }
        while (v119);
      }
      v121 = (double *)malloc_type_malloc(8 * v299, 0x100004000313F17uLL);
      v292[v291] = 0;
      v122 = log((v117 + 1.0) / (v116 + 1.0));
      v289[v291] = v122;
      if ((int)v113 < 1)
      {
        v131 = v122;
      }
      else
      {
        v123 = (v116 + 1.0) / (v116 + 2.0);
        v115 = 0.0;
        v124 = v121;
        v125 = v71;
        v126 = v113;
        v127 = 1.0 / (v117 + 2.0);
        do
        {
          v128 = *v114++;
          if (v128 <= 0.0)
            v129 = v127;
          else
            v129 = v123;
          *v124++ = v129;
          v130 = *v125++;
          v131 = v289[v291];
          v132 = v131 + v130 * *(double *)&v292[v291];
          v133 = -v132;
          if (v132 >= 0.0)
          {
            v134 = v129;
          }
          else
          {
            v133 = v132;
            v134 = v129 + v57;
          }
          v135 = exp(v133);
          v115 = v115 + log(v135 + 1.0) + v134 * v132;
          --v126;
        }
        while (v126);
      }
      v136 = 0;
      v137 = v292;
      v138 = 1.0;
      v139 = v131;
      while (1)
      {
        v297 = v115;
        v298 = v139;
        if (v290 < 1)
        {
          v146 = 0.0;
          v148 = 1.0e-12;
          v147 = 1.0e-12;
          v145 = 0.0;
          v141 = 0.0;
          v64 = v291;
        }
        else
        {
          v140 = *(double *)&v137[v291];
          v64 = v291;
          v141 = 0.0;
          v142 = v71;
          v143 = v121;
          v144 = v113;
          v145 = 0.0;
          v146 = 0.0;
          v147 = 1.0e-12;
          v148 = 1.0e-12;
          do
          {
            v149 = *v142;
            v150 = v139 + *v142 * v140;
            if (v150 >= 0.0)
            {
              v154 = exp(-v150);
              v139 = v298;
              v152 = v154 / (v154 + v138);
              v153 = v138 / (v154 + v138);
            }
            else
            {
              v151 = exp(v150);
              v139 = v298;
              v152 = v138 / (v151 + v138);
              v153 = v151 / (v151 + v138);
            }
            v155 = v152 * v153;
            v147 = v147 + v149 * v149 * v155;
            v148 = v148 + v155;
            v156 = *v143++;
            v146 = v146 + v149 * v155;
            v145 = v145 + v149 * (v156 - v152);
            v141 = v141 + v156 - v152;
            ++v142;
            --v144;
          }
          while (v144);
        }
        if (fabs(v145) < 0.00001 && fabs(v141) < 0.00001)
          break;
        v157 = v147 * v148 - v146 * v146;
        v295 = -(v147 * v141 + -v146 * v145) / v157;
        v296 = -(v148 * v145 - v146 * v141) / v157;
        v293 = *(double *)&v292[v64];
        v294 = v141 * v295 + v145 * v296;
        v158 = 1.0;
        while (1)
        {
          v159 = v293 + v158 * v296;
          v160 = v139 + v158 * v295;
          v161 = 0.0;
          if ((int)v113 >= 1)
          {
            v162 = v71;
            v163 = v121;
            v164 = v113;
            do
            {
              v165 = *v162++;
              v166 = v165;
              v167 = *v163++;
              v168 = v167;
              v169 = v160 + v166 * v159;
              v170 = -v169;
              v171 = v167 + -1.0;
              if (v169 >= 0.0)
              {
                v172 = v168;
              }
              else
              {
                v170 = v169;
                v172 = v171;
              }
              v173 = exp(v170);
              v161 = v161 + log(v173 + 1.0) + v172 * v169;
              --v164;
            }
            while (v164);
          }
          if (v161 < v297 + v158 * 0.0001 * v294)
            break;
          v158 = v158 * 0.5;
          v139 = v298;
          if (v158 < 1.0e-10)
          {
            v137 = v292;
            v138 = 1.0;
            v115 = v297;
            goto LABEL_140;
          }
        }
        v174 = v64;
        v137 = v292;
        *(double *)&v292[v174] = v159;
        v289[v174] = v160;
        v139 = v160;
        v115 = v161;
        v138 = 1.0;
LABEL_140:
        if (v158 < 1.0e-10)
        {
          info("Line search fails in two-class probability estimates\n");
          goto LABEL_144;
        }
        if (++v136 == 100)
        {
          info("Reaching maximal iterations in two-class probability estimates\n");
LABEL_144:
          v64 = v291;
          break;
        }
      }
      free(v121);
      free(v71);
      free(v70);
      v35 = v275;
      v42 = v276;
      v52 = v277;
      v56 = v278;
      v54 = v289;
      a2 = v274;
      v57 = -1.0;
      v60 = v283;
LABEL_146:
      v175 = (double *)svm_train_one(&v299, a2, v42[v56], v42[v60]);
      v176 = (double **)&v52[2 * v64];
      *v176 = v175;
      v176[1] = v177;
      v179 = v287;
      v178 = v288;
      if ((int)v287 >= 1)
      {
        v180 = &v282[v284];
        v181 = v175;
        do
        {
          if (!*v180 && *v181 != 0.0)
            *v180 = 1;
          ++v180;
          ++v181;
          --v179;
        }
        while (v179);
      }
      if ((int)v288 >= 1)
      {
        v182 = &v175[v285];
        v183 = &v282[v286];
        do
        {
          if (!*v183 && *v182 != 0.0)
            *v183 = 1;
          ++v182;
          ++v183;
          --v178;
        }
        while (v178);
      }
      free(v301);
      free(v300);
      v291 = v64 + 1;
      ++v60;
      v40 = v281;
    }
    while (v60 != v281);
    v5 = v270;
    v55 = v271;
    v59 = v272;
    v58 = v273;
LABEL_160:
    ++v58;
    v56 = v59;
  }
  while (v59 != v40);
LABEL_161:
  *((_DWORD *)v5 + 26) = v40;
  v184 = 4 * v55;
  v185 = malloc_type_malloc(4 * v55, 0x100004052888210uLL);
  *((_QWORD *)v5 + 19) = v185;
  if ((int)v40 >= 1)
  {
    v186 = (int *)v304;
    v187 = v40;
    do
    {
      v188 = *v186++;
      *v185++ = v188;
      --v187;
    }
    while (v187);
  }
  v189 = malloc_type_malloc(v266, 0x100004000313F17uLL);
  *((_QWORD *)v5 + 16) = v189;
  v190 = v265;
  if (v265 > 1)
  {
    v191 = v264;
    v192 = v52 + 1;
    do
    {
      v193 = *v192;
      v192 += 2;
      *v189++ = v193;
      --v191;
    }
    while (v191);
  }
  if (*(_DWORD *)(a2 + 100))
  {
    *((_QWORD *)v5 + 17) = malloc_type_malloc(v266, 0x100004000313F17uLL);
    v194 = malloc_type_malloc(v266, 0x100004000313F17uLL);
    *((_QWORD *)v5 + 18) = v194;
    if (v265 > 1)
    {
      v195 = (_QWORD *)*((_QWORD *)v5 + 17);
      v196 = v264;
      v197 = v292;
      do
      {
        v198 = *v197++;
        *v195++ = v198;
        v199 = *(_QWORD *)v54++;
        *v194++ = v199;
        --v196;
      }
      while (v196);
    }
  }
  else
  {
    *((_QWORD *)v5 + 17) = 0;
    *((_QWORD *)v5 + 18) = 0;
  }
  v200 = (int *)malloc_type_malloc(v184, 0x100004052888210uLL);
  v201 = malloc_type_malloc(v184, 0x100004052888210uLL);
  *((_QWORD *)v5 + 20) = v201;
  if ((int)v40 < 1)
  {
    v203 = 0;
  }
  else
  {
    v202 = 0;
    v203 = 0;
    v204 = v302;
    v205 = v303;
    do
    {
      v206 = v204[v202];
      if ((int)v206 < 1)
      {
        v207 = 0;
      }
      else
      {
        v207 = 0;
        v208 = &v282[v205[v202]];
        do
        {
          v209 = *v208++;
          v203 += v209;
          v207 += v209;
          --v206;
        }
        while (v206);
      }
      v201[v202] = v207;
      v200[v202++] = v207;
    }
    while (v202 != v40);
  }
  info("Total nSV = %d\n", v203);
  *((_DWORD *)v5 + 27) = v203;
  v210 = 8 * v203;
  v211 = malloc_type_malloc(v210, 0x2004093837F09uLL);
  v212 = (unsigned __int8 *)v282;
  *((_QWORD *)v5 + 14) = v211;
  if ((int)v268 >= 1)
  {
    v213 = 0;
    v214 = size;
    v215 = v35;
    do
    {
      if (*v212++)
        *(_QWORD *)(*((_QWORD *)v5 + 14) + 8 * v213++) = *v215;
      ++v215;
      --v214;
    }
    while (v214);
  }
  v217 = malloc_type_malloc(v184, 0x100004052888210uLL);
  v218 = (double *)v217;
  *v217 = 0;
  if ((int)v40 <= 1)
  {
    *((_QWORD *)v5 + 15) = malloc_type_malloc(8 * (int)v269, 0x80040B8603338uLL);
    v225 = v5 + 120;
  }
  else
  {
    v219 = 0;
    v220 = v217 + 1;
    v221 = v40 - 1;
    v222 = v200;
    do
    {
      v223 = *v222++;
      v219 += v223;
      *v220++ = v219;
      --v221;
    }
    while (v221);
    v224 = 0;
    *((_QWORD *)v5 + 15) = malloc_type_malloc(8 * (int)v269, 0x80040B8603338uLL);
    v225 = v5 + 120;
    do
    {
      *(_QWORD *)(*v225 + v224) = malloc_type_malloc(v210, 0x100004000313F17uLL);
      v224 += 8;
    }
    while (8 * v269 != v224);
    v52 = v277;
    v190 = v265;
  }
  v227 = v302;
  v226 = v303;
  if ((int)v40 >= 1)
  {
    v228 = 0;
    LODWORD(v229) = 0;
    v230 = 1;
    do
    {
      v231 = v228 + 1;
      if (v228 + 1 < v271)
      {
        v232 = v227[v228];
        v233 = *((_DWORD *)v218 + v228);
        v229 = (int)v229;
        v234 = &v282[v226[v228]];
        v235 = v230;
        do
        {
          v236 = v226[v235];
          v237 = v227[v235];
          if ((int)v232 >= 1)
          {
            v238 = 0;
            v239 = v233;
            do
            {
              if (v234[v238])
                *(_QWORD *)(*(_QWORD *)(*v225 + 8 * (v235 - 1)) + 8 * v239++) = *(_QWORD *)(v52[2 * v229] + 8 * v238);
              ++v238;
            }
            while (v232 != v238);
          }
          if ((int)v237 >= 1)
          {
            v240 = *((_DWORD *)v218 + v235);
            v241 = &v282[v236];
            v242 = 8 * (int)v232;
            do
            {
              if (*v241++)
                *(_QWORD *)(*(_QWORD *)(*v225 + 8 * v228) + 8 * v240++) = *(_QWORD *)(v52[2 * v229] + v242);
              v242 += 8;
              --v237;
            }
            while (v237);
          }
          ++v229;
          ++v235;
        }
        while (v235 != v40);
      }
      ++v230;
      ++v228;
    }
    while (v231 != v40);
  }
  free(v304);
  free(v292);
  free(v289);
  free(v227);
  free(v263);
  free(v226);
  free(v35);
  free(v276);
  free(v282);
  if (v190 > 1)
  {
    v244 = v264;
    v245 = (void **)v277;
    do
    {
      v246 = *v245;
      v245 += 2;
      free(v246);
      --v244;
    }
    while (v244);
  }
  free(v277);
  free(v200);
LABEL_229:
  free(v218);
  return v5;
}

_QWORD *svm_train_one(int *a1, uint64_t a2, double a3, double a4)
{
  _QWORD *v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  double *v14;
  _QWORD *v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  double v19;
  char v20;
  double v21;
  double *v22;
  uint64_t v23;
  double v24;
  char *v25;
  double *v26;
  int v27;
  size_t v28;
  void *v29;
  char *v30;
  int v31;
  int v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  double v52;
  double *v53;
  double *v54;
  double *v55;
  _BYTE *v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  int v61;
  uint64_t i;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  char *v67;
  double *v68;
  char *v69;
  uint64_t v70;
  double v71;
  char v72;
  double v73;
  unsigned __int8 *v74;
  double *v75;
  uint64_t v76;
  double v77;
  int v78;
  int v79;
  double v80;
  double v81;
  char *v82;
  char *v83;
  double v84;
  int v85;
  double v86;
  char *v87;
  double *v88;
  int v89;
  float64x2_t v90;
  unsigned int v91;
  uint64_t v92;
  unint64_t v93;
  int v94;
  int v95;
  uint64_t v96;
  double v97;
  double v98;
  double v100;
  float64x2_t v101;
  double v102;
  double v103;
  double v104;
  _QWORD v105[16];
  _QWORD v106[15];
  float64x2_t *v107;

  v8 = malloc_type_malloc(8 * *a1, 0x100004000313F17uLL);
  switch(*(_DWORD *)a2)
  {
    case 0:
      v9 = *a1;
      v10 = *a1;
      v11 = (_QWORD *)operator new[]();
      v12 = (char *)operator new[]();
      v13 = v12;
      if (v9 >= 1)
      {
        v14 = (double *)*((_QWORD *)a1 + 1);
        v15 = v8;
        v16 = v11;
        v17 = v12;
        v18 = v10;
        do
        {
          *v15++ = 0;
          *v16++ = 0xBFF0000000000000;
          v19 = *v14++;
          if (v19 > 0.0)
            v20 = 1;
          else
            v20 = -1;
          *v17++ = v20;
          --v18;
        }
        while (v18);
      }
      v106[0] = &off_24C09D978;
      SVC_Q::SVC_Q(v105, a1, a2, v12);
      Solver::Solve((uint64_t)v106, v10, (uint64_t)v105, v11, v13, v8, (uint64_t)&v101, *(_DWORD *)(a2 + 96), a3, a4, *(double *)(a2 + 40));
      SVC_Q::~SVC_Q((SVC_Q *)v105);
      v21 = 0.0;
      if ((int)v10 >= 1)
      {
        v22 = (double *)v8;
        v23 = v10;
        do
        {
          v24 = *v22++;
          v21 = v21 + v24;
          --v23;
        }
        while (v23);
      }
      if (a3 == a4)
        info("nu = %f\n", v21 / ((double)*a1 * a3));
      if ((int)v10 >= 1)
      {
        v25 = v13;
        v26 = (double *)v8;
        do
        {
          v27 = *v25++;
          *v26 = *v26 * (double)v27;
          ++v26;
          --v10;
        }
        while (v10);
      }
      goto LABEL_69;
    case 1:
      v63 = *a1;
      v64 = *a1;
      v65 = *(double *)(a2 + 80);
      v66 = operator new[]();
      v67 = (char *)v66;
      if ((int)v63 >= 1)
      {
        v68 = (double *)*((_QWORD *)a1 + 1);
        v69 = (char *)v66;
        v70 = v64;
        do
        {
          v71 = *v68++;
          if (v71 > 0.0)
            v72 = 1;
          else
            v72 = -1;
          *v69++ = v72;
          --v70;
        }
        while (v70);
        v73 = v65 * (double)(int)v64 * 0.5;
        v74 = (unsigned __int8 *)v66;
        v75 = (double *)v8;
        v76 = v64;
        v77 = v73;
        do
        {
          v79 = *v74++;
          v78 = v79;
          if (v73 <= 1.0)
            v80 = v73;
          else
            v80 = 1.0;
          if (v77 <= 1.0)
            v81 = v77;
          else
            v81 = 1.0;
          if (v78 == 1)
          {
            v80 = v81;
            v77 = v77 - v81;
          }
          else
          {
            v73 = v73 - v80;
          }
          *v75++ = v80;
          --v76;
        }
        while (v76);
      }
      v82 = (char *)operator new[]();
      v83 = v82;
      if ((int)v64 >= 1)
        bzero(v82, 8 * v64);
      v106[0] = &off_24C09D9B0;
      SVC_Q::SVC_Q(v105, a1, a2, v67);
      v84 = *(double *)(a2 + 40);
      v85 = *(_DWORD *)(a2 + 96);
      v107 = &v101;
      Solver::Solve((uint64_t)v106, v63, (uint64_t)v105, v83, v67, v8, (uint64_t)&v101, v85, 1.0, 1.0, v84);
      SVC_Q::~SVC_Q((SVC_Q *)v105);
      v100 = v104;
      v86 = 1.0 / v104;
      info("C = %f\n", 1.0 / v104);
      if ((int)v64 >= 1)
      {
        v87 = v67;
        v88 = (double *)v8;
        do
        {
          v89 = *v87++;
          *v88 = *v88 * ((double)v89 / v100);
          ++v88;
          --v64;
        }
        while (v64);
      }
      v90.f64[0] = v100 * v100;
      v90.f64[1] = v100;
      v101 = vdivq_f64(v101, v90);
      v102 = v86;
      v103 = v86;
      MEMORY[0x20BD06830](v67, 0x1000C8077774924);
      v33 = v83;
      v91 = 3227415;
      goto LABEL_71;
    case 2:
      v28 = *a1;
      v29 = (void *)operator new[]();
      v30 = (char *)operator new[]();
      v31 = *a1;
      v32 = (int)(*(double *)(a2 + 80) * (double)*a1);
      if (v32 >= 1)
        memset_pattern16(v8, &unk_2084198C0, 8 * (int)(*(double *)(a2 + 80) * (double)*a1));
      if (v31 > v32)
        *(double *)&v8[v32] = -((double)v32 - *(double *)(a2 + 80) * (double)v31);
      if (v32 + 1 < (int)v28)
        bzero(&v8[v32 + 1], 8 * (v28 - v32 - 2) + 8);
      if ((int)v28 >= 1)
      {
        bzero(v29, 8 * v28);
        memset(v30, 1, v28);
      }
      v106[0] = &off_24C09D978;
      ONE_CLASS_Q::ONE_CLASS_Q(v105, a1, a2);
      Solver::Solve((uint64_t)v106, v28, (uint64_t)v105, v29, v30, v8, (uint64_t)&v101, *(_DWORD *)(a2 + 96), 1.0, 1.0, *(double *)(a2 + 40));
      ONE_CLASS_Q::~ONE_CLASS_Q((ONE_CLASS_Q *)v105);
      MEMORY[0x20BD06830](v29, 0x1000C8000313F17);
      v33 = v30;
      goto LABEL_70;
    case 3:
      v34 = *a1;
      v35 = *a1;
      v36 = (_QWORD *)operator new[]();
      v11 = (_QWORD *)operator new[]();
      v37 = operator new[]();
      v13 = (char *)v37;
      if ((int)v34 >= 1)
      {
        v38 = 0;
        v39 = *(double *)(a2 + 88);
        v40 = *((_QWORD *)a1 + 1);
        v41 = v35;
        v42 = v35;
        do
        {
          v36[v38] = 0;
          v43 = *(double *)(v40 + 8 * v38);
          *(double *)&v11[v38] = v39 - v43;
          *(_BYTE *)(v37 + v38) = 1;
          v36[v41] = 0;
          *(double *)&v11[v41] = v39 + v43;
          *(_BYTE *)(v37 + v41) = -1;
          ++v38;
          ++v41;
          --v42;
        }
        while (v42);
      }
      v105[0] = &off_24C09D978;
      SVR_Q::SVR_Q((uint64_t)v106, (uint64_t)a1, a2);
      Solver::Solve((uint64_t)v105, 2 * v34, (uint64_t)v106, v11, v13, v36, (uint64_t)&v101, *(_DWORD *)(a2 + 96), *(double *)(a2 + 48), *(double *)(a2 + 48), *(double *)(a2 + 40));
      SVR_Q::~SVR_Q((SVR_Q *)v106);
      if ((int)v35 < 1)
      {
        v45 = 0.0;
      }
      else
      {
        v44 = 0;
        v45 = 0.0;
        do
        {
          v46 = *(double *)&v36[v44];
          v47 = *(double *)&v36[v35 + v44];
          *(double *)&v8[v44] = v46 - v47;
          v45 = v45 + vabdd_f64(v46, v47);
          ++v44;
        }
        while (v35 != v44);
      }
      info("nu = %f\n", v45 / (*(double *)(a2 + 48) * (double)(int)v35));
      goto LABEL_68;
    case 4:
      v48 = *a1;
      v49 = *a1;
      v50 = *(double *)(a2 + 48);
      v36 = (_QWORD *)operator new[]();
      v11 = (_QWORD *)operator new[]();
      v51 = operator new[]();
      v13 = (char *)v51;
      if ((int)v48 >= 1)
      {
        v52 = v50 * *(double *)(a2 + 80) * (double)(int)v49 * 0.5;
        v53 = (double *)*((_QWORD *)a1 + 1);
        v54 = (double *)v36;
        v55 = (double *)v11;
        v56 = (_BYTE *)v51;
        v57 = v49;
        do
        {
          if (v52 >= v50)
            v58 = v50;
          else
            v58 = v52;
          v54[v49] = v58;
          *v54++ = v58;
          v59 = *v53++;
          v52 = v52 - v58;
          v55[v49] = v59;
          v56[v49] = -1;
          *v55++ = -v59;
          *v56++ = 1;
          --v57;
        }
        while (v57);
      }
      v106[0] = &off_24C09D9B0;
      SVR_Q::SVR_Q((uint64_t)v105, (uint64_t)a1, a2);
      v60 = *(double *)(a2 + 40);
      v61 = *(_DWORD *)(a2 + 96);
      v107 = &v101;
      Solver::Solve((uint64_t)v106, 2 * v48, (uint64_t)v105, v11, v13, v36, (uint64_t)&v101, v61, v50, v50, v60);
      SVR_Q::~SVR_Q((SVR_Q *)v105);
      info("epsilon = %f\n", -v104);
      if ((int)v49 >= 1)
      {
        for (i = 0; i != v49; ++i)
          *(double *)&v8[i] = *(double *)&v36[i] - *(double *)&v36[v49 + i];
      }
LABEL_68:
      MEMORY[0x20BD06830](v36, 0x1000C8000313F17);
LABEL_69:
      MEMORY[0x20BD06830](v11, 0x1000C8000313F17);
      v33 = v13;
LABEL_70:
      v91 = 2004306212;
LABEL_71:
      MEMORY[0x20BD06830](v33, v91 | 0x1000C8000000000);
      break;
    default:
      break;
  }
  info("obj = %f, rho = %f\n", v101.f64[0], v101.f64[1]);
  v92 = *a1;
  if ((int)v92 >= 1)
  {
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 8 * v92;
    while (1)
    {
      v97 = *(double *)&v8[v93 / 8];
      if (v97 != 0.0)
      {
        v98 = fabs(v97);
        ++v95;
        if (*(double *)(*((_QWORD *)a1 + 1) + v93) > 0.0)
        {
          if (v98 < v102)
            goto LABEL_80;
LABEL_79:
          ++v94;
          goto LABEL_80;
        }
        if (v98 >= v103)
          goto LABEL_79;
      }
LABEL_80:
      v93 += 8;
      if (v96 == v93)
        goto LABEL_83;
    }
  }
  v95 = 0;
  v94 = 0;
LABEL_83:
  info("nSV = %d, nBSV = %d\n", v95, v94);
  return v8;
}

void sub_2084092C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  SVC_Q::~SVC_Q((SVC_Q *)va);
  _Unwind_Resume(a1);
}

void svm_group_classes(int *a1, int *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  int *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  int v18;
  _DWORD *v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t i;
  int v24;
  _DWORD *v25;
  uint64_t v26;
  int *v27;
  int v28;

  v7 = *a1;
  v8 = *a1;
  v9 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  v10 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  v11 = (int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  if ((int)v7 < 1)
  {
    v13 = 0;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 16;
    do
    {
      v15 = (int)*(double *)(*((_QWORD *)a1 + 1) + 8 * v12);
      if (v13 < 1)
      {
        LODWORD(v16) = 0;
      }
      else
      {
        v16 = 0;
        while (v9[v16] != v15)
        {
          if (v13 == ++v16)
          {
            v11[v12] = v13;
            goto LABEL_11;
          }
        }
        ++v10[v16];
      }
      v11[v12] = v16;
      if ((_DWORD)v16 == v13)
      {
LABEL_11:
        if (v13 == v14)
        {
          v14 = 2 * v13;
          v9 = malloc_type_realloc(v9, 8 * v13, 0x100004052888210uLL);
          v10 = malloc_type_realloc(v10, 8 * v13, 0x100004052888210uLL);
        }
        v9[v13] = v15;
        v10[v13++] = 1;
      }
      ++v12;
    }
    while (v12 != v8);
  }
  v17 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
  *v17 = 0;
  if (v13 > 1)
  {
    v18 = 0;
    v19 = v17 + 1;
    v20 = v13 - 1;
    v21 = v10;
    do
    {
      v22 = *v21++;
      v18 += v22;
      *v19++ = v18;
      --v20;
    }
    while (v20);
  }
  if ((int)v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
      *(_DWORD *)(a6 + 4 * (int)v17[v11[i]]++) = i;
  }
  *v17 = 0;
  if (v13 > 1)
  {
    v24 = 0;
    v25 = v17 + 1;
    v26 = v13 - 1;
    v27 = v10;
    do
    {
      v28 = *v27++;
      v24 += v28;
      *v25++ = v24;
      --v26;
    }
    while (v26);
  }
  *a2 = v13;
  *a3 = v9;
  *a4 = v17;
  *a5 = v10;
  free(v11);
}

void svm_cross_validation(int *a1, _DWORD *a2, int a3, uint64_t a4)
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int *v12;
  BOOL v13;
  _DWORD *v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int *v21;
  uint64_t v22;
  _DWORD *v23;
  _DWORD *v24;
  uint64_t v25;
  int *v26;
  _DWORD *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  _DWORD *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int *v46;
  int v47;
  int v48;
  _DWORD *v49;
  uint64_t v50;
  int *v51;
  int v52;
  char v53;
  uint64_t v54;
  _DWORD *v55;
  _DWORD *v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  _DWORD *v67;
  uint64_t v68;
  int *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  int *v80;
  uint64_t v81;
  uint64_t v82;
  _DWORD *v83;
  uint64_t v84;
  void *v85;
  int *v86;
  int v87;
  double v88;
  uint64_t v89;
  int *v90;
  int v91;
  double v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  _DWORD *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t i;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  unsigned int v108;

  v97 = (a3 + 1);
  v8 = (int *)malloc_type_malloc(4 * (int)v97, 0x100004052888210uLL);
  v9 = *a1;
  v10 = *a1;
  v11 = (int *)malloc_type_malloc(4 * v9, 0x100004052888210uLL);
  v12 = v11;
  v96 = a2;
  v13 = (int)v9 <= a3 || *a2 >= 2u;
  v99 = v10;
  v100 = v9;
  if (!v13)
  {
    v95 = a4;
    v108 = 0;
    v103 = 0;
    v106 = 0;
    v107 = 0;
    svm_group_classes(a1, (int *)&v108, &v107, &v103, &v106, (uint64_t)v11);
    v94 = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    v23 = malloc_type_malloc(4 * v9, 0x100004052888210uLL);
    v24 = v23;
    if ((int)v9 >= 1)
    {
      v25 = v10;
      v26 = v12;
      v27 = v23;
      do
      {
        v28 = *v26++;
        *v27++ = v28;
        --v25;
      }
      while (v25);
    }
    v29 = v108;
    if ((int)v108 >= 1)
    {
      v30 = 0;
      v31 = v106;
      v32 = v103;
      for (i = v108; i != v30; v29 = i)
      {
        if ((int)v31[v30] >= 1)
        {
          v33 = 0;
          v34 = 0;
          do
          {
            v35 = rand();
            v36 = v34 + v32[v30];
            v37 = v36 + v35 % (v33 + v31[v30]);
            v38 = v24[v37];
            v24[v37] = v24[v36];
            v24[v36] = v38;
            ++v34;
            --v33;
          }
          while (v34 < v31[v30]);
        }
        ++v30;
      }
    }
    if (a3 <= 0)
    {
      *v8 = 0;
      v53 = 1;
      v9 = v100;
      v41 = v97;
      v42 = v94;
    }
    else
    {
      v39 = 0;
      v40 = (int *)v106;
      v41 = v97;
      v42 = v94;
      do
      {
        v94[v39] = 0;
        v43 = v39 + 1;
        if ((int)v29 >= 1)
        {
          v44 = 0;
          v45 = v29;
          v46 = v40;
          do
          {
            v47 = *v46++;
            v44 += v47 * (int)v43 / a3 - v47 * (int)v39 / a3;
            v94[v39] = v44;
            --v45;
          }
          while (v45);
        }
        ++v39;
      }
      while (v43 != a3);
      *v8 = 0;
      v9 = v100;
      v48 = 0;
      v49 = v8 + 1;
      v50 = v97 - 1;
      v51 = v94;
      do
      {
        v52 = *v51++;
        v48 += v52;
        *v49++ = v48;
        --v50;
      }
      while (v50);
      v53 = 0;
    }
    if ((int)v29 >= 1)
    {
      v54 = 0;
      v55 = v103;
      v56 = v106;
      do
      {
        if (a3 >= 1)
        {
          v57 = 0;
          do
          {
            v58 = v56[v54];
            v59 = v58 * (int)v57 / a3;
            v60 = v57 + 1;
            v61 = v58 * ((int)v57 + 1) / a3;
            if (v59 < v61)
            {
              v62 = v55[v54];
              v63 = v59 + v62;
              v64 = v61 + v62;
              v65 = v8[v57];
              do
              {
                v12[v65] = v24[v63];
                v65 = v8[v57] + 1;
                v8[v57] = v65;
                ++v63;
              }
              while (v63 < v64);
            }
            ++v57;
          }
          while (v60 != a3);
        }
        ++v54;
      }
      while (v54 != v29);
    }
    *v8 = 0;
    a4 = v95;
    if ((v53 & 1) == 0)
    {
      v66 = 0;
      v67 = v8 + 1;
      v68 = v41 - 1;
      v69 = v42;
      do
      {
        v70 = *v69++;
        v66 += v70;
        *v67++ = v66;
        --v68;
      }
      while (v68);
    }
    free(v103);
    free(v107);
    free(v106);
    free(v24);
    free(v42);
    v14 = v96;
    goto LABEL_47;
  }
  v14 = a2;
  if ((int)v10 >= 1)
  {
    for (j = 0; j != v10; ++j)
      v11[j] = j;
    v16 = 0;
    v17 = v10;
    do
    {
      v18 = v16 + rand() % (int)v17;
      v19 = v12[v16];
      v12[v16] = v12[v18];
      v12[v18] = v19;
      ++v16;
      --v17;
    }
    while (v17);
  }
  if ((a3 & 0x80000000) == 0)
  {
    v20 = 0;
    v21 = v8;
    v22 = v97;
    do
    {
      *v21++ = v20 / a3;
      v20 += v9;
      --v22;
    }
    while (v22);
LABEL_47:
    if (a3 >= 1)
    {
      v71 = 0;
      v98 = a3;
      do
      {
        v72 = v8[v71];
        v73 = v71 + 1;
        v74 = v8[v73];
        LODWORD(v103) = v72 - v74 + v9;
        v105 = malloc_type_malloc(8 * (int)v103, 0x2004093837F09uLL);
        v104 = malloc_type_malloc(8 * (int)v103, 0x100004000313F17uLL);
        if ((int)v72 < 1)
        {
          v77 = 0;
        }
        else
        {
          for (k = 0; k != v72; ++k)
          {
            v76 = v12[k];
            *((_QWORD *)v105 + k) = *(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * v76);
            *((_QWORD *)v104 + k) = *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v76);
          }
          v77 = v72;
        }
        if ((int)v74 < v99)
        {
          v78 = v9 - v74;
          v79 = 8 * v77;
          v80 = &v12[v74];
          do
          {
            v81 = *v80++;
            *(_QWORD *)((char *)v105 + v79) = *(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * v81);
            *(_QWORD *)((char *)v104 + v79) = *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v81);
            v79 += 8;
            --v78;
          }
          while (v78);
        }
        v82 = svm_train(&v103, v14);
        v83 = (_DWORD *)v82;
        v102 = v73;
        if (v14[25] && *v14 <= 1u)
        {
          v84 = a4;
          v85 = malloc_type_malloc(8 * *(int *)(v82 + 104), 0x100004000313F17uLL);
          if ((int)v72 < (int)v74)
          {
            v86 = &v12[(int)v72];
            v87 = v74 - v72;
            do
            {
              v88 = svm_predict_probability((uint64_t)v83, *(double **)(*((_QWORD *)a1 + 2) + 8 * *v86), (uint64_t)v85);
              v89 = *v86++;
              *(double *)(v84 + 8 * v89) = v88;
              --v87;
            }
            while (v87);
          }
          free(v85);
          a4 = v84;
          v14 = v96;
        }
        else if ((int)v72 < (int)v74)
        {
          v90 = &v12[(int)v72];
          v91 = v74 - v72;
          do
          {
            v92 = svm_predict(v83, *(double **)(*((_QWORD *)a1 + 2) + 8 * *v90));
            v93 = *v90++;
            *(double *)(a4 + 8 * v93) = v92;
            --v91;
          }
          while (v91);
        }
        if (v83)
        {
          svm_free_model_content((uint64_t)v83);
          free(v83);
        }
        free(v105);
        free(v104);
        v9 = v100;
        v71 = v102;
      }
      while (v102 != v98);
    }
  }
  free(v8);
  free(v12);
}

uint64_t svm_get_nr_class(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

double svm_predict_probability(uint64_t a1, double *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;
  double *v7;
  double *v8;
  uint64_t v9;
  void **v10;
  void **v11;
  uint64_t v12;
  void **v13;
  int v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  void **v32;
  _QWORD *v33;
  double v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t i;
  double v41;
  uint64_t v42;
  double *v43;
  double *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  int v52;
  double v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  double *v57;
  double v58;
  uint64_t v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  void **v68;
  uint64_t v69;
  void *v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  void **v74;
  void *v75;
  uint64_t v76;
  _QWORD *v77;
  double *v78;
  void **v79;
  int v80;
  int v81;
  uint64_t size;
  uint64_t v83;

  v4 = (_QWORD *)a1;
  if (*(_DWORD *)a1 > 1u || !*(_QWORD *)(a1 + 136) || !*(_QWORD *)(a1 + 144))
    return svm_predict((_DWORD *)a1, a2);
  v6 = *(int *)(a1 + 104);
  v7 = (double *)malloc_type_malloc(8 * (((int)v6 - 1) * (int)v6 / 2), 0x100004000313F17uLL);
  v8 = a2;
  v9 = v6;
  v78 = v7;
  svm_predict_values((uint64_t)v4, v8, v7);
  size = 8 * v6;
  v10 = (void **)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  v11 = v10;
  v12 = v6;
  v79 = v10;
  v83 = v6;
  if ((int)v6 >= 1)
  {
    v6 = v6;
    v13 = v10;
    do
    {
      *v13++ = malloc_type_malloc(size, 0x100004000313F17uLL);
      --v6;
    }
    while (v6);
    v14 = 0;
    v15 = v11 + 1;
    v16 = v12 - 1;
    v17 = 8;
    v76 = v9;
    v77 = v4;
    do
    {
      v18 = v6 + 1;
      if (v6 + 1 < v9)
      {
        v19 = v11;
        v20 = 0;
        v21 = v4[17];
        v22 = v4[18];
        v23 = &v78[v14];
        v24 = v21 + 8 * v14;
        v80 = v14;
        v25 = v22 + 8 * v14;
        v26 = (uint64_t)v19[v6] + v17;
        do
        {
          v27 = *(double *)(v25 + 8 * v20) + v23[v20] * *(double *)(v24 + 8 * v20);
          if (v27 >= 0.0)
          {
            v28 = exp(-v27);
            v29 = v28;
          }
          else
          {
            v28 = exp(v27);
            v29 = 1.0;
          }
          v30 = fmin(fmax(v29 / (v28 + 1.0), 0.0000001), 0.9999999);
          *(double *)(v26 + 8 * v20) = v30;
          *((double *)v15[v20++] + v6) = 1.0 - v30;
        }
        while (v16 != v20);
        v14 = v80 + v20;
        v9 = v76;
        v4 = v77;
        v11 = v79;
        v18 = v6 + 1;
        v12 = v83;
      }
      ++v15;
      v17 += 8;
      --v16;
      v6 = v18;
    }
    while (v18 != v12);
  }
  if ((int)v9 <= 100)
    v31 = 100;
  else
    v31 = v9;
  v32 = (void **)malloc_type_malloc(size, 0x80040B8603338uLL);
  v33 = malloc_type_malloc(size, 0x100004000313F17uLL);
  v34 = (double)(int)v12;
  if ((int)v12 <= 0)
  {
    v50 = v9;
  }
  else
  {
    v81 = v31;
    v35 = 0;
    v36 = (uint64_t *)(v11 + 1);
    v37 = 1;
    v38 = 1;
    do
    {
      *(double *)(a3 + 8 * v35) = 1.0 / v34;
      v39 = malloc_type_malloc(size, 0x100004000313F17uLL);
      v32[v35] = v39;
      v39[v35] = 0;
      if (v35)
      {
        for (i = 0; i != v35; ++i)
        {
          v41 = *((double *)v11[i] + v35);
          *(double *)&v39[v35] = *(double *)&v39[v35] + v41 * v41;
          v39[i] = *((_QWORD *)v32[i] + v35);
        }
      }
      v42 = v35 + 1;
      if (v35 + 1 < v9)
      {
        v43 = (double *)&v39[v38];
        v44 = (double *)((char *)v11[v35] + v38 * 8);
        v45 = v36;
        v46 = v83;
        do
        {
          v47 = *v45++;
          *(double *)&v39[v35] = *(double *)&v39[v35] + *(double *)(v47 + 8 * v35) * *(double *)(v47 + 8 * v35);
          v48 = *(double *)(v47 + 8 * v35);
          v49 = *v44++;
          *v43++ = -(v48 * v49);
          --v46;
        }
        while (v37 != v46);
      }
      ++v37;
      ++v38;
      ++v36;
      ++v35;
    }
    while (v42 != v83);
    LODWORD(v12) = v83;
    v50 = v83;
    v31 = v81;
  }
  v52 = 0;
  v53 = 0.005 / v34;
  do
  {
    if ((int)v12 < 1)
    {
      if (v53 > 0.0)
        goto LABEL_53;
    }
    else
    {
      v54 = 0;
      v55 = 0.0;
      do
      {
        v56 = 0;
        v33[v54] = 0;
        v57 = (double *)v32[v54];
        v58 = 0.0;
        do
        {
          v58 = v58 + v57[v56] * *(double *)(a3 + 8 * v56);
          *(double *)&v33[v54] = v58;
          ++v56;
        }
        while (v50 != v56);
        v55 = v55 + *(double *)(a3 + 8 * v54++) * v58;
      }
      while (v54 != v50);
      v59 = 0;
      v60 = 0.0;
      do
      {
        v61 = vabdd_f64(*(double *)&v33[v59], v55);
        if (v61 > v60)
          v60 = v61;
        ++v59;
      }
      while (v50 != v59);
      if (v60 < v53)
        goto LABEL_50;
      v62 = 0;
      do
      {
        v63 = 0;
        v64 = (double *)v32[v62];
        v65 = (v55 - *(double *)&v33[v62]) / v64[v62];
        *(double *)(a3 + 8 * v62) = *(double *)(a3 + 8 * v62) + v65;
        v66 = *(double *)&v33[v62] + *(double *)&v33[v62] + v65 * v64[v62];
        v67 = v65 + 1.0;
        do
        {
          *(double *)&v33[v63] = (*(double *)&v33[v63] + v65 * v64[v63]) / v67;
          *(double *)(a3 + 8 * v63) = *(double *)(a3 + 8 * v63) / v67;
          ++v63;
        }
        while (v50 != v63);
        v55 = (v55 + v65 * v66) / v67 / v67;
        ++v62;
      }
      while (v62 != v50);
    }
    ++v52;
  }
  while (v52 != v31);
  info("Exceeds max_iter in multiclass_prob\n", 1.0);
LABEL_50:
  if ((int)v12 >= 1)
  {
    v68 = v32;
    v69 = v50;
    do
    {
      v70 = *v68++;
      free(v70);
      --v69;
    }
    while (v69);
  }
LABEL_53:
  free(v32);
  free(v33);
  if ((int)v12 <= 1)
  {
    v73 = 0;
  }
  else
  {
    v71 = 0;
    v72 = 1;
    do
    {
      if (*(double *)(a3 + 8 * v72) > *(double *)(a3 + 8 * v71))
        v71 = v72;
      ++v72;
    }
    while (v50 != v72);
    v73 = v71;
  }
  if ((int)v9 >= 1)
  {
    v74 = v79;
    do
    {
      v75 = *v74++;
      free(v75);
      --v50;
    }
    while (v50);
  }
  free(v78);
  free(v79);
  return (double)*(int *)(v4[19] + 4 * v73);
}

double svm_predict(_DWORD *a1, double *a2)
{
  size_t v4;
  double *v5;
  double v6;
  double v7;

  if ((*a1 - 2) > 2)
    v4 = 8 * ((a1[26] - 1) * a1[26] / 2);
  else
    v4 = 8;
  v5 = (double *)malloc_type_malloc(v4, 0x100004000313F17uLL);
  svm_predict_values((uint64_t)a1, a2, v5);
  v7 = v6;
  free(v5);
  return v7;
}

void svm_free_and_destroy_model(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      svm_free_model_content((uint64_t)v2);
      free(*a1);
      *a1 = 0;
    }
  }
}

uint64_t svm_get_svm_type(unsigned int *a1)
{
  return *a1;
}

uint64_t svm_get_labels(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 152);
  if (v2 && *(int *)(result + 104) >= 1)
  {
    v3 = 0;
    do
    {
      *(_DWORD *)(a2 + 4 * v3) = *(_DWORD *)(v2 + 4 * v3);
      ++v3;
    }
    while (v3 < *(int *)(result + 104));
  }
  return result;
}

double svm_get_svr_probability(uint64_t a1)
{
  uint64_t v1;

  if ((*(_DWORD *)a1 - 3) <= 1)
  {
    v1 = *(_QWORD *)(a1 + 136);
    if (v1)
      return *(double *)v1;
  }
  fwrite("Model doesn't contain information for SVR probability inference\n", 0x40uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  return 0.0;
}

void svm_predict_values(uint64_t a1, double *a2, double *a3)
{
  uint64_t v6;
  double **v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  double *v17;
  double **v18;
  double *v19;
  double *v20;
  int *v21;
  int *v22;
  int v23;
  int *v24;
  _DWORD *v25;
  uint64_t v26;
  int v27;
  _DWORD *v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  double *v49;
  double *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  int v56;
  uint64_t v57;

  if ((*(_DWORD *)a1 - 2) > 2)
  {
    v14 = *(int *)(a1 + 104);
    v13 = *(int *)(a1 + 108);
    v15 = *(unsigned int *)(a1 + 104);
    v16 = (double *)malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
    v17 = v16;
    if ((int)v13 >= 1)
    {
      v13 = v13;
      v18 = *(double ***)(a1 + 112);
      v19 = v16;
      do
      {
        v20 = *v18++;
        *v19++ = Kernel::k_function(a2, v20, a1);
        --v13;
      }
      while (v13);
    }
    v21 = (int *)malloc_type_malloc(4 * v14, 0x100004052888210uLL);
    v22 = v21;
    *v21 = 0;
    if ((int)v14 > 1)
    {
      v23 = 0;
      v24 = *(int **)(a1 + 160);
      v25 = v21 + 1;
      v26 = v15 - 1;
      do
      {
        v27 = *v24++;
        v23 += v27;
        *v25++ = v23;
        --v26;
      }
      while (v26);
    }
    v28 = malloc_type_malloc(4 * v14, 0x100004052888210uLL);
    v29 = v28;
    if ((int)v15 >= 1)
    {
      bzero(v28, 4 * v14);
      v30 = 0;
      LODWORD(v31) = 0;
      v32 = 1;
      do
      {
        v33 = v30 + 1;
        if (v30 + 1 < v14)
        {
          v34 = *(_QWORD *)(a1 + 160);
          v35 = *(_QWORD *)(a1 + 120);
          v36 = *(_QWORD *)(a1 + 128);
          v37 = *(_QWORD *)(v35 + 8 * v30);
          v31 = (int)v31;
          v38 = v32;
          do
          {
            v39 = *(unsigned int *)(v34 + 4 * v30);
            if ((int)v39 < 1)
            {
              v43 = 0.0;
            }
            else
            {
              v40 = v22[v30];
              v41 = (double *)(*(_QWORD *)(v35 + 8 * v38 - 8) + 8 * v40);
              v42 = &v17[v40];
              v43 = 0.0;
              do
              {
                v44 = *v41++;
                v45 = v44;
                v46 = *v42++;
                v43 = v43 + v45 * v46;
                --v39;
              }
              while (v39);
            }
            v47 = *(unsigned int *)(v34 + 4 * v38);
            if ((int)v47 >= 1)
            {
              v48 = v22[v38];
              v49 = (double *)(v37 + 8 * v48);
              v50 = &v17[v48];
              do
              {
                v51 = *v49++;
                v52 = v51;
                v53 = *v50++;
                v43 = v43 + v52 * v53;
                --v47;
              }
              while (v47);
            }
            v54 = v43 - *(double *)(v36 + 8 * v31);
            a3[v31] = v54;
            if (v54 <= 0.0)
              v55 = v38;
            else
              v55 = v30;
            ++v29[v55];
            ++v31;
            ++v38;
          }
          while (v38 != v14);
        }
        ++v32;
        ++v30;
      }
      while (v33 != v14);
      if ((int)v15 >= 2)
      {
        v56 = 0;
        v57 = 1;
        do
        {
          if (v29[v57] > v29[v56])
            v56 = v57;
          ++v57;
        }
        while (v14 != v57);
      }
    }
    free(v17);
    free(v22);
    free(v29);
  }
  else
  {
    v6 = *(unsigned int *)(a1 + 108);
    if ((int)v6 < 1)
    {
      v9 = 0.0;
    }
    else
    {
      v7 = *(double ***)(a1 + 112);
      v8 = **(double ***)(a1 + 120);
      v9 = 0.0;
      do
      {
        v10 = *v8++;
        v11 = v10;
        v12 = *v7++;
        v9 = v9 + v11 * Kernel::k_function(a2, v12, a1);
        --v6;
      }
      while (v6);
    }
    *a3 = v9 - **(double **)(a1 + 128);
  }
}

uint64_t svm_save_model(const char *a1, double *a2)
{
  FILE *v3;
  FILE *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  double *v22;
  int v23;
  double *v24;
  int v25;

  v3 = fopen(a1, "w");
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = v3;
  fprintf(v3, "svm_type %s\n", svm_type_table[*(int *)a2]);
  fprintf(v4, "kernel_type %s\n", kernel_type_table[*((int *)a2 + 1)]);
  v5 = *((_DWORD *)a2 + 1);
  if (v5 == 1)
  {
    fprintf(v4, "degree %d\n", *((_DWORD *)a2 + 2));
    v5 = *((_DWORD *)a2 + 1);
  }
  if ((v5 - 1) <= 2)
  {
    fprintf(v4, "gamma %g\n", a2[2]);
    v5 = *((_DWORD *)a2 + 1);
  }
  if ((v5 | 2) == 3)
    fprintf(v4, "coef0 %g\n", a2[3]);
  v7 = *((unsigned int *)a2 + 26);
  v6 = *((unsigned int *)a2 + 27);
  fprintf(v4, "nr_class %d\n", *((_DWORD *)a2 + 26));
  fprintf(v4, "total_sv %d\n", v6);
  fwrite("rho", 3uLL, 1uLL, v4);
  v8 = (v7 - 1) * v7;
  if (v8 >= 0)
    v9 = (v7 - 1) * v7;
  else
    v9 = v8 + 1;
  v10 = (v9 >> 1);
  if (v8 >= 2)
  {
    v11 = 0;
    do
      fprintf(v4, " %g", *(double *)(*((_QWORD *)a2 + 16) + 8 * v11++));
    while (v10 != v11);
  }
  fputc(10, v4);
  if (*((_QWORD *)a2 + 19))
  {
    fwrite("label", 5uLL, 1uLL, v4);
    if ((int)v7 >= 1)
    {
      v12 = 0;
      do
      {
        fprintf(v4, " %d", *(_DWORD *)(*((_QWORD *)a2 + 19) + v12));
        v12 += 4;
      }
      while (4 * v7 != v12);
    }
    fputc(10, v4);
  }
  if (*((_QWORD *)a2 + 17))
  {
    fwrite("probA", 5uLL, 1uLL, v4);
    if (v8 >= 2)
    {
      v13 = 0;
      do
        fprintf(v4, " %g", *(double *)(*((_QWORD *)a2 + 17) + 8 * v13++));
      while (v10 != v13);
    }
    fputc(10, v4);
  }
  if (*((_QWORD *)a2 + 18))
  {
    fwrite("probB", 5uLL, 1uLL, v4);
    if (v8 >= 2)
    {
      v14 = 0;
      do
        fprintf(v4, " %g", *(double *)(*((_QWORD *)a2 + 18) + 8 * v14++));
      while (v10 != v14);
    }
    fputc(10, v4);
  }
  if (*((_QWORD *)a2 + 20))
  {
    fwrite("nr_sv", 5uLL, 1uLL, v4);
    if ((int)v7 >= 1)
    {
      v15 = 0;
      do
      {
        fprintf(v4, " %d", *(_DWORD *)(*((_QWORD *)a2 + 20) + v15));
        v15 += 4;
      }
      while (4 * v7 != v15);
    }
    fputc(10, v4);
  }
  fwrite("SV\n", 3uLL, 1uLL, v4);
  if ((int)v6 >= 1)
  {
    v16 = 0;
    v17 = *((_QWORD *)a2 + 14);
    v18 = (uint64_t *)*((_QWORD *)a2 + 15);
    do
    {
      v19 = (v7 - 1);
      v20 = v18;
      if ((int)v7 >= 2)
      {
        do
        {
          v21 = *v20++;
          fprintf(v4, "%.16g ", *(double *)(v21 + 8 * v16));
          --v19;
        }
        while (v19);
      }
      v22 = *(double **)(v17 + 8 * v16);
      if (*((_DWORD *)a2 + 1) == 4)
      {
        fprintf(v4, "0:%d ", (int)v22[1]);
      }
      else
      {
        v23 = *(_DWORD *)v22;
        if (*(_DWORD *)v22 != -1)
        {
          v24 = v22 + 2;
          do
          {
            fprintf(v4, "%d:%.8g ", v23, *(v24 - 1));
            v25 = *(_DWORD *)v24;
            v24 += 2;
            v23 = v25;
          }
          while (v25 != -1);
        }
      }
      fputc(10, v4);
      ++v16;
    }
    while (v16 != v6);
  }
  if (ferror(v4))
    return 0xFFFFFFFFLL;
  if (fclose(v4))
    return 0xFFFFFFFFLL;
  return 0;
}

char *svm_load_model(const char *a1)
{
  FILE *v1;
  FILE *v2;
  char *v3;
  void **v4;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  FILE *v35;
  const char *v36;
  size_t v37;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  unsigned int v45;
  size_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  double *v60;
  char *v61;
  _DWORD *v62;
  char *v63;
  int v64;
  uint64_t v65;
  char *__endptr;
  char __s2[8];
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v1 = fopen(a1, "rb");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (char *)malloc_type_malloc(0xB0uLL, 0x1090040ECD48006uLL);
  *((_OWORD *)v3 + 8) = 0u;
  v4 = (void **)(v3 + 128);
  v62 = v3 + 104;
  *((_OWORD *)v3 + 9) = 0u;
  *((_QWORD *)v3 + 20) = 0;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
LABEL_3:
                  fscanf(v2, "%80s", __s2);
                  if (!(*(_QWORD *)__s2 ^ 0x657079745F6D7673 | v68))
                  {
                    fscanf(v2, "%80s", __s2);
                    for (i = 0; i != 5; ++i)
                    {
                      if (!strcmp(svm_type_table[i], __s2))
                      {
                        *(_DWORD *)v3 = i;
                        goto LABEL_3;
                      }
                    }
                    v35 = (FILE *)*MEMORY[0x24BDAC8D8];
                    v36 = "unknown svm type.\n";
                    v37 = 18;
LABEL_86:
                    fwrite(v36, v37, 1uLL, v35);
                    goto LABEL_87;
                  }
                  if (*(_QWORD *)__s2 != 0x745F6C656E72656BLL || v68 != 6647929)
                    break;
                  fscanf(v2, "%80s", __s2);
                  v17 = 0;
                  while (strcmp(kernel_type_table[v17], __s2))
                  {
                    if (++v17 == 5)
                    {
                      v35 = (FILE *)*MEMORY[0x24BDAC8D8];
                      v36 = "unknown kernel function.\n";
                      v37 = 25;
                      goto LABEL_86;
                    }
                  }
                  *((_DWORD *)v3 + 1) = v17;
                }
                if (*(_DWORD *)__s2 == 1919378788 && *(_DWORD *)&__s2[3] == 6645106)
                {
                  v18 = v3 + 8;
                  goto LABEL_54;
                }
                if (*(_DWORD *)__s2 == 1835884903 && *(unsigned __int16 *)&__s2[4] == 97)
                {
                  v19 = v3 + 16;
                  goto LABEL_58;
                }
                if (*(_DWORD *)__s2 != 1717923683 || *(unsigned __int16 *)&__s2[4] != 48)
                  break;
                v19 = v3 + 24;
LABEL_58:
                fscanf(v2, "%lf", v19);
              }
              if (!(*(_QWORD *)__s2 ^ 0x7373616C635F726ELL | v68))
              {
                v18 = v3 + 104;
                goto LABEL_54;
              }
              if (*(_QWORD *)__s2 ^ 0x76735F6C61746F74 | v68)
                break;
              v18 = v3 + 108;
LABEL_54:
              fscanf(v2, "%d", v18);
            }
            if (*(_DWORD *)__s2 != 7301234)
              break;
            v20 = (*v62 - 1) * *v62;
            if (v20 >= 0)
              v21 = (*v62 - 1) * *v62;
            else
              v21 = v20 + 1;
            v22 = (v21 >> 1);
            *v4 = malloc_type_malloc(8 * (int)v22, 0x100004000313F17uLL);
            if (v20 >= 2)
            {
              v23 = 0;
              do
              {
                fscanf(v2, "%lf", (char *)*v4 + v23);
                v23 += 8;
                --v22;
              }
              while (v22);
            }
          }
          if (*(_DWORD *)__s2 != 1700946284 || *(unsigned __int16 *)&__s2[4] != 108)
            break;
          v24 = *((int *)v3 + 26);
          *((_QWORD *)v3 + 19) = malloc_type_malloc(4 * v24, 0x100004052888210uLL);
          if ((int)v24 >= 1)
          {
            v25 = 0;
            v26 = 4 * v24;
            do
            {
              fscanf(v2, "%d", *((_QWORD *)v3 + 19) + v25);
              v25 += 4;
            }
            while (v26 != v25);
          }
        }
        if (*(_DWORD *)__s2 != 1651470960 || *(unsigned __int16 *)&__s2[4] != 65)
          break;
        v27 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
        if (v27 >= 0)
          v28 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
        else
          v28 = v27 + 1;
        v29 = (v28 >> 1);
        *((_QWORD *)v3 + 17) = malloc_type_malloc(8 * (int)v29, 0x100004000313F17uLL);
        if (v27 >= 2)
        {
          v30 = 0;
          do
          {
            fscanf(v2, "%lf", *((_QWORD *)v3 + 17) + v30);
            v30 += 8;
            --v29;
          }
          while (v29);
        }
      }
      if (*(_DWORD *)__s2 != 1651470960 || *(unsigned __int16 *)&__s2[4] != 66)
        break;
      v31 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
      if (v31 >= 0)
        v32 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
      else
        v32 = v31 + 1;
      v33 = (v32 >> 1);
      *((_QWORD *)v3 + 18) = malloc_type_malloc(8 * (int)v33, 0x100004000313F17uLL);
      if (v31 >= 2)
      {
        v34 = 0;
        do
        {
          fscanf(v2, "%lf", *((_QWORD *)v3 + 18) + v34);
          v34 += 8;
          --v33;
        }
        while (v33);
      }
    }
    if (*(_DWORD *)__s2 != 1935635054 || *(unsigned __int16 *)&__s2[4] != 118)
      break;
    v13 = *((int *)v3 + 26);
    *((_QWORD *)v3 + 20) = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
    if ((int)v13 >= 1)
    {
      v14 = 0;
      v15 = 4 * v13;
      do
      {
        fscanf(v2, "%d", *((_QWORD *)v3 + 20) + v14);
        v14 += 4;
      }
      while (v15 != v14);
    }
  }
  if (*(unsigned __int16 *)__s2 ^ 0x5653 | __s2[2])
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "unknown text in model file: [%s]\n", __s2);
LABEL_87:
    free(*((void **)v3 + 16));
    free(*((void **)v3 + 19));
    free(*((void **)v3 + 20));
    free(v3);
    return 0;
  }
  do
    v39 = getc(v2);
  while (v39 != -1 && v39 != 10);
  v40 = MEMORY[0x20BD069EC](v2);
  max_line_len = 1024;
  line = (uint64_t)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  __endptr = 0;
  v41 = 0;
  while (readline(v2))
  {
    strtok((char *)line, ":");
    --v41;
    do
      ++v41;
    while (strtok(0, ":"));
  }
  v42 = *((_DWORD *)v3 + 27);
  fseek(v2, v40, 0);
  v43 = *((_DWORD *)v3 + 26);
  v44 = *((int *)v3 + 27);
  v45 = v43 - 1;
  v65 = *((unsigned int *)v3 + 27);
  *((_QWORD *)v3 + 15) = malloc_type_malloc(8 * (v43 - 1), 0x80040B8603338uLL);
  v46 = 8 * v44;
  v64 = v43;
  if (v43 > 1)
  {
    v47 = 0;
    do
    {
      *(_QWORD *)(*((_QWORD *)v3 + 15) + v47) = malloc_type_malloc(v46, 0x100004000313F17uLL);
      v47 += 8;
    }
    while (8 * v45 != v47);
  }
  *((_QWORD *)v3 + 14) = malloc_type_malloc(v46, 0x2004093837F09uLL);
  if ((int)v65 >= 1)
  {
    v48 = (char *)malloc_type_malloc(16 * (v42 + v41), 0x1000040F7F8B94BuLL);
    v49 = 0;
    v50 = 0;
    v51 = 8 * v45;
    v61 = v48 + 8;
    v63 = v48;
    do
    {
      readline(v2);
      *(_QWORD *)(*((_QWORD *)v3 + 14) + 8 * v49) = &v48[16 * v50];
      v52 = strtok((char *)line, " \t");
      *(double *)(**((_QWORD **)v3 + 15) + 8 * v49) = strtod(v52, &__endptr);
      if (v64 >= 3)
      {
        v53 = 8;
        do
        {
          v54 = strtok(0, " \t");
          *(double *)(*(_QWORD *)(*((_QWORD *)v3 + 15) + v53) + 8 * v49) = strtod(v54, &__endptr);
          v53 += 8;
        }
        while (v51 != v53);
      }
      v55 = v50;
      v56 = strtok(0, ":");
      v57 = strtok(0, " \t");
      if (v57)
      {
        v58 = v57;
        v59 = (uint64_t)v50 << 32;
        v60 = (double *)&v61[16 * v50];
        do
        {
          *((_DWORD *)v60 - 2) = strtol(v56, &__endptr, 10);
          *v60 = strtod(v58, &__endptr);
          v60 += 2;
          v56 = strtok(0, ":");
          v58 = strtok(0, " \t");
          v59 += 0x100000000;
          ++v50;
        }
        while (v58);
        v55 = v59 >> 32;
        v51 = 8 * v45;
      }
      ++v50;
      v48 = v63;
      *(_DWORD *)&v63[16 * v55] = -1;
      ++v49;
    }
    while (v49 != v65);
  }
  free((void *)line);
  if (!ferror(v2) && !fclose(v2))
  {
    *((_DWORD *)v3 + 42) = 1;
    return v3;
  }
  return 0;
}

void *readline(__sFILE *a1)
{
  void *v2;
  size_t v3;
  int v4;

  if (!fgets((char *)line, max_line_len, a1))
    return 0;
  while (1)
  {
    v2 = (void *)line;
    if (strrchr((char *)line, 10))
      break;
    v3 = 2 * max_line_len;
    max_line_len *= 2;
    line = (uint64_t)malloc_type_realloc(v2, v3, 0x64432FuLL);
    v4 = strlen((const char *)line);
    if (!fgets((char *)(line + v4), max_line_len - v4, a1))
      return (void *)line;
  }
  return v2;
}

void svm_free_model_content(uint64_t a1)
{
  void **v2;
  uint64_t v3;

  if (*(_DWORD *)(a1 + 168))
  {
    if (*(int *)(a1 + 108) >= 1)
    {
      v2 = *(void ***)(a1 + 112);
      if (v2)
        free(*v2);
    }
  }
  if (*(_QWORD *)(a1 + 120) && *(int *)(a1 + 104) >= 2)
  {
    v3 = 0;
    do
      free(*(void **)(*(_QWORD *)(a1 + 120) + 8 * v3++));
    while (v3 < *(int *)(a1 + 104) - 1);
  }
  free(*(void **)(a1 + 112));
  *(_QWORD *)(a1 + 112) = 0;
  free(*(void **)(a1 + 120));
  *(_QWORD *)(a1 + 120) = 0;
  free(*(void **)(a1 + 128));
  *(_QWORD *)(a1 + 128) = 0;
  free(*(void **)(a1 + 152));
  *(_QWORD *)(a1 + 152) = 0;
  free(*(void **)(a1 + 136));
  *(_QWORD *)(a1 + 136) = 0;
  free(*(void **)(a1 + 144));
  *(_QWORD *)(a1 + 144) = 0;
  free(*(void **)(a1 + 160));
  *(_QWORD *)(a1 + 160) = 0;
}

void svm_destroy_param(uint64_t a1)
{
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
}

const char *svm_check_parameter(unsigned int *a1, uint64_t a2)
{
  unsigned int v2;
  const char *result;
  double v6;
  unsigned int v7;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  double v23;

  v2 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 > 4u)
    return "unknown svm type";
  if (*(_DWORD *)(a2 + 4) > 4u)
    return "unknown kernel type";
  if (*(double *)(a2 + 16) < 0.0)
    return "gamma < 0";
  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0)
    return "degree of polynomial kernel < 0";
  if (*(double *)(a2 + 32) <= 0.0)
    return "cache_size <= 0";
  if (*(double *)(a2 + 40) <= 0.0)
    return "eps <= 0";
  if (v2 <= 4 && ((1 << v2) & 0x19) != 0 && *(double *)(a2 + 48) <= 0.0)
    return "C <= 0";
  if (v2 - 1 < 2)
    goto LABEL_16;
  if (v2 == 3)
  {
LABEL_19:
    if (*(double *)(a2 + 88) < 0.0)
      return "p < 0";
    goto LABEL_25;
  }
  if (v2 == 4)
  {
LABEL_16:
    v6 = *(double *)(a2 + 80);
    result = "nu <= 0 or nu > 1";
    if (v6 <= 0.0 || v6 > 1.0)
      return result;
    if (v2 == 3)
      goto LABEL_19;
  }
LABEL_25:
  if (*(_DWORD *)(a2 + 96) > 1u)
    return "shrinking != 0 and shrinking != 1";
  v7 = *(_DWORD *)(a2 + 100);
  if (v7 > 1)
    return "probability != 0 and probability != 1";
  if (v7 == 1 && v2 == 2)
    result = "one-class SVM probability output not supported yet";
  else
    result = 0;
  if (v2 == 1)
  {
    v9 = *a1;
    v10 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
    v11 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
    if ((int)v9 < 1)
      goto LABEL_57;
    v12 = 0;
    v13 = 0;
    v14 = 16;
    do
    {
      v15 = (int)*(double *)(*((_QWORD *)a1 + 1) + 8 * v12);
      if (v13 < 1)
      {
        LODWORD(v16) = 0;
      }
      else
      {
        v16 = 0;
        while (v10[v16] != v15)
        {
          if (v13 == ++v16)
            goto LABEL_44;
        }
        ++v11[v16];
      }
      if ((_DWORD)v16 == v13)
      {
LABEL_44:
        if (v13 == v14)
        {
          v14 = 2 * v13;
          v10 = malloc_type_realloc(v10, 8 * v13, 0x100004052888210uLL);
          v11 = malloc_type_realloc(v11, 8 * v13, 0x100004052888210uLL);
        }
        v10[v13] = v15;
        v11[v13++] = 1;
      }
      ++v12;
    }
    while (v12 != v9);
    if (v13 < 1)
    {
LABEL_57:
      free(v10);
      free(v11);
      return 0;
    }
    else
    {
      v17 = 0;
      v18 = 1;
      while (1)
      {
        v19 = v17 + 1;
        if (v17 + 1 < (unint64_t)v13)
          break;
LABEL_56:
        ++v18;
        v17 = v19;
        if (v19 == v13)
          goto LABEL_57;
      }
      v20 = v11[v17];
      v21 = v18;
      while (1)
      {
        v22 = v11[v21];
        v23 = *(double *)(a2 + 80) * (double)(v22 + v20) * 0.5;
        if (v20 < v22)
          v22 = v20;
        if (v23 > (double)v22)
          break;
        if (v13 == ++v21)
          goto LABEL_56;
      }
      free(v10);
      free(v11);
      return "specified nu is infeasible";
    }
  }
  return result;
}

BOOL svm_check_probability_model(uint64_t a1)
{
  if (*(_DWORD *)a1 > 1u)
  {
    if ((*(_DWORD *)a1 - 3) <= 1)
      return *(_QWORD *)(a1 + 136) != 0;
  }
  else if (*(_QWORD *)(a1 + 136) && *(_QWORD *)(a1 + 144))
  {
    return 1;
  }
  return 0;
}

uint64_t (*svm_set_print_string_function(uint64_t (*result)(const char *)))(const char *)
{
  uint64_t (*v1)(const char *);

  v1 = print_string_stdout;
  if (result)
    v1 = result;
  svm_print_string = v1;
  return result;
}

uint64_t print_string_stdout(const char *a1)
{
  FILE **v1;

  v1 = (FILE **)MEMORY[0x24BDAC8E8];
  fputs(a1, (FILE *)*MEMORY[0x24BDAC8E8]);
  return fflush(*v1);
}

double Kernel::swap_index(Kernel *this, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v3 = *((_QWORD *)this + 3);
  v4 = *(_QWORD *)(v3 + 8 * a2);
  *(_QWORD *)(v3 + 8 * a2) = *(_QWORD *)(v3 + 8 * a3);
  *(_QWORD *)(v3 + 8 * a3) = v4;
  v5 = *((_QWORD *)this + 4);
  if (v5)
  {
    result = *(double *)(v5 + 8 * a2);
    *(_QWORD *)(v5 + 8 * a2) = *(_QWORD *)(v5 + 8 * a3);
    *(double *)(v5 + 8 * a3) = result;
  }
  return result;
}

void Solver::~Solver(Solver *this)
{
  JUMPOUT(0x20BD06848);
}

void Solver_NU::~Solver_NU(Solver_NU *this)
{
  JUMPOUT(0x20BD06848);
}

_QWORD *SVC_Q::SVC_Q(_QWORD *a1, int *a2, uint64_t a3, const void *a4)
{
  size_t v8;
  void *v9;
  Cache *v10;
  uint64_t v11;
  double (*v12)(_QWORD *, uint64_t, uint64_t);
  uint64_t v13;
  _QWORD *v14;

  *(_QWORD *)Kernel::Kernel((uint64_t)a1, *a2, *((const void **)a2 + 2), a3) = &unk_24C09D8D0;
  v8 = *a2;
  v9 = (void *)operator new[]();
  a1[8] = v9;
  memcpy(v9, a4, v8);
  v10 = (Cache *)operator new();
  Cache::Cache(v10, *a2, vcvtd_n_s64_f64(*(double *)(a3 + 32), 0x14uLL));
  a1[9] = v10;
  a1[10] = operator new[]();
  if (*a2 >= 1)
  {
    v11 = 0;
    do
    {
      v12 = (double (*)(_QWORD *, uint64_t, uint64_t))a1[1];
      v13 = a1[2];
      v14 = (_QWORD *)((char *)a1 + (v13 >> 1));
      if ((v13 & 1) != 0)
        v12 = *(double (**)(_QWORD *, uint64_t, uint64_t))(*v14 + v12);
      *(double *)(a1[10] + 8 * v11) = v12(v14, v11, v11);
      ++v11;
    }
    while (v11 < *a2);
  }
  return a1;
}

void sub_20840B994(_Unwind_Exception *a1)
{
  Kernel *v1;
  uint64_t v2;

  MEMORY[0x20BD06848](v2, 0x10A0C408A4F435CLL);
  Kernel::~Kernel(v1);
  _Unwind_Resume(a1);
}

float *SVC_Q::get_Q(Cache **this, uint64_t a2, uint64_t a3)
{
  int v3;
  int data;
  float *v7;
  uint64_t v8;
  Cache *v9;
  uint64_t v10;
  _QWORD *v11;
  double v12;
  float v13;
  float *v15;

  v3 = a3;
  v15 = 0;
  data = Cache::get_data(this[9], a2, &v15, a3);
  v7 = v15;
  if (data < v3)
  {
    v8 = data;
    do
    {
      v9 = this[1];
      v10 = (uint64_t)this[2];
      v11 = (Cache **)((char *)this + (v10 >> 1));
      if ((v10 & 1) != 0)
        v9 = *(Cache **)(*v11 + v9);
      v12 = (double)(*((char *)this[8] + v8) * *((char *)this[8] + (int)a2));
      v13 = ((double (*)(_QWORD *, uint64_t, uint64_t))v9)(v11, a2, v8) * v12;
      v7[v8++] = v13;
    }
    while (v3 != (_DWORD)v8);
  }
  return v7;
}

uint64_t SVC_Q::get_QD(SVC_Q *this)
{
  return *((_QWORD *)this + 10);
}

double SVC_Q::swap_index(Cache **this, int a2, int a3)
{
  Cache *v6;
  uint64_t v7;
  Cache *v8;
  uint64_t v9;
  Cache *v10;
  char v11;
  Cache *v12;
  double result;

  Cache::swap_index(this[9], a2, a3);
  v6 = this[3];
  v7 = *((_QWORD *)v6 + a2);
  *((_QWORD *)v6 + a2) = *((_QWORD *)v6 + a3);
  *((_QWORD *)v6 + a3) = v7;
  v8 = this[4];
  if (v8)
  {
    v9 = *((_QWORD *)v8 + a2);
    *((_QWORD *)v8 + a2) = *((_QWORD *)v8 + a3);
    *((_QWORD *)v8 + a3) = v9;
  }
  v10 = this[8];
  v11 = *((_BYTE *)v10 + a2);
  *((_BYTE *)v10 + a2) = *((_BYTE *)v10 + a3);
  *((_BYTE *)v10 + a3) = v11;
  v12 = this[10];
  result = *((double *)v12 + a2);
  *((_QWORD *)v12 + a2) = *((_QWORD *)v12 + a3);
  *((double *)v12 + a3) = result;
  return result;
}

void SVC_Q::~SVC_Q(SVC_Q *this)
{
  SVC_Q::~SVC_Q(this);
  JUMPOUT(0x20BD06848);
}

{
  uint64_t v2;
  Cache *v3;
  uint64_t v4;

  *(_QWORD *)this = &unk_24C09D8D0;
  v2 = *((_QWORD *)this + 8);
  if (v2)
    MEMORY[0x20BD06830](v2, 0x1000C8077774924);
  v3 = (Cache *)*((_QWORD *)this + 9);
  if (v3)
  {
    Cache::~Cache(v3);
    MEMORY[0x20BD06848]();
  }
  v4 = *((_QWORD *)this + 10);
  if (v4)
    MEMORY[0x20BD06830](v4, 0x1000C8000313F17);
  Kernel::~Kernel(this);
}

_QWORD *ONE_CLASS_Q::ONE_CLASS_Q(_QWORD *a1, int *a2, uint64_t a3)
{
  Cache *v6;
  uint64_t v7;
  double (*v8)(_QWORD *, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;

  *(_QWORD *)Kernel::Kernel((uint64_t)a1, *a2, *((const void **)a2 + 2), a3) = &unk_24C09D898;
  v6 = (Cache *)operator new();
  Cache::Cache(v6, *a2, vcvtd_n_s64_f64(*(double *)(a3 + 32), 0x14uLL));
  a1[8] = v6;
  a1[9] = operator new[]();
  if (*a2 >= 1)
  {
    v7 = 0;
    do
    {
      v8 = (double (*)(_QWORD *, uint64_t, uint64_t))a1[1];
      v9 = a1[2];
      v10 = (_QWORD *)((char *)a1 + (v9 >> 1));
      if ((v9 & 1) != 0)
        v8 = *(double (**)(_QWORD *, uint64_t, uint64_t))(*v10 + v8);
      *(double *)(a1[9] + 8 * v7) = v8(v10, v7, v7);
      ++v7;
    }
    while (v7 < *a2);
  }
  return a1;
}

void sub_20840BCC0(_Unwind_Exception *a1)
{
  Kernel *v1;
  uint64_t v2;

  MEMORY[0x20BD06848](v2, 0x10A0C408A4F435CLL);
  Kernel::~Kernel(v1);
  _Unwind_Resume(a1);
}

float *ONE_CLASS_Q::get_Q(Cache **this, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t data;
  float *v7;
  uint64_t v8;
  float *v9;
  Cache *v10;
  uint64_t v11;
  _QWORD *v12;
  float v13;
  float *v15;

  v3 = a3;
  v15 = 0;
  data = Cache::get_data(this[8], a2, &v15, a3);
  v7 = v15;
  if ((int)data < v3)
  {
    v8 = data;
    v9 = &v15[(int)data];
    do
    {
      v10 = this[1];
      v11 = (uint64_t)this[2];
      v12 = (Cache **)((char *)this + (v11 >> 1));
      if ((v11 & 1) != 0)
        v10 = *(Cache **)(*v12 + v10);
      v13 = ((double (*)(_QWORD *, uint64_t, uint64_t))v10)(v12, a2, v8);
      *v9++ = v13;
      v8 = (v8 + 1);
    }
    while (v3 != (_DWORD)v8);
  }
  return v7;
}

uint64_t ONE_CLASS_Q::get_QD(ONE_CLASS_Q *this)
{
  return *((_QWORD *)this + 9);
}

double ONE_CLASS_Q::swap_index(Cache **this, int a2, int a3)
{
  Cache *v6;
  uint64_t v7;
  Cache *v8;
  uint64_t v9;
  Cache *v10;
  double result;

  Cache::swap_index(this[8], a2, a3);
  v6 = this[3];
  v7 = *((_QWORD *)v6 + a2);
  *((_QWORD *)v6 + a2) = *((_QWORD *)v6 + a3);
  *((_QWORD *)v6 + a3) = v7;
  v8 = this[4];
  if (v8)
  {
    v9 = *((_QWORD *)v8 + a2);
    *((_QWORD *)v8 + a2) = *((_QWORD *)v8 + a3);
    *((_QWORD *)v8 + a3) = v9;
  }
  v10 = this[9];
  result = *((double *)v10 + a2);
  *((_QWORD *)v10 + a2) = *((_QWORD *)v10 + a3);
  *((double *)v10 + a3) = result;
  return result;
}

void ONE_CLASS_Q::~ONE_CLASS_Q(ONE_CLASS_Q *this)
{
  ONE_CLASS_Q::~ONE_CLASS_Q(this);
  JUMPOUT(0x20BD06848);
}

{
  Cache *v2;
  uint64_t v3;

  *(_QWORD *)this = &unk_24C09D898;
  v2 = (Cache *)*((_QWORD *)this + 8);
  if (v2)
  {
    Cache::~Cache(v2);
    MEMORY[0x20BD06848]();
  }
  v3 = *((_QWORD *)this + 9);
  if (v3)
    MEMORY[0x20BD06830](v3, 0x1000C8000313F17);
  Kernel::~Kernel(this);
}

uint64_t SVR_Q::SVR_Q(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  Cache *v7;
  uint64_t v8;
  uint64_t v9;
  double (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;

  v6 = Kernel::Kernel(a1, *(_DWORD *)a2, *(const void **)(a2 + 16), a3);
  *(_QWORD *)v6 = &unk_24C09D908;
  *(_DWORD *)(v6 + 64) = *(_DWORD *)a2;
  v7 = (Cache *)operator new();
  Cache::Cache(v7, *(_DWORD *)(a1 + 64), vcvtd_n_s64_f64(*(double *)(a3 + 32), 0x14uLL));
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 120) = operator new[]();
  *(_QWORD *)(a1 + 80) = operator new[]();
  *(_QWORD *)(a1 + 88) = operator new[]();
  if (*(int *)(a1 + 64) >= 1)
  {
    v8 = 0;
    do
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 80) + v8) = 1;
      *(_BYTE *)(*(_QWORD *)(a1 + 80) + *(int *)(a1 + 64) + v8) = -1;
      v9 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)(v9 + 4 * v8) = v8;
      *(_DWORD *)(v9 + 4 * (v8 + *(int *)(a1 + 64))) = v8;
      v10 = *(double (**)(_QWORD *, uint64_t, uint64_t))(a1 + 8);
      v11 = *(_QWORD *)(a1 + 16);
      v12 = (_QWORD *)(a1 + (v11 >> 1));
      if ((v11 & 1) != 0)
        v10 = *(double (**)(_QWORD *, uint64_t, uint64_t))(*v12 + v10);
      v13 = v10(v12, v8, v8);
      v14 = *(_QWORD *)(a1 + 120);
      *(double *)(v14 + 8 * v8) = v13;
      v15 = *(int *)(a1 + 64);
      *(double *)(v14 + 8 * (v8 + v15)) = v13;
      ++v8;
    }
    while (v8 < v15);
  }
  *(_QWORD *)(a1 + 104) = operator new[]();
  *(_QWORD *)(a1 + 112) = operator new[]();
  *(_DWORD *)(a1 + 96) = 0;
  return a1;
}

void sub_20840C07C(_Unwind_Exception *a1)
{
  Kernel *v1;
  uint64_t v2;

  MEMORY[0x20BD06848](v2, 0x10A0C408A4F435CLL);
  Kernel::~Kernel(v1);
  _Unwind_Resume(a1);
}

float *SVR_Q::get_Q(SVR_Q *this, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  int data;
  int v9;
  uint64_t v11;
  float *v12;
  double (*v13)(_QWORD *, uint64_t, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  float v16;
  uint64_t v17;
  float *result;
  char *v19;
  int *v20;
  float v21;
  float *v22;
  uint64_t v23;
  float *v24;
  int v25;
  float v26;
  uint64_t v27;
  float *v28;

  v28 = 0;
  v6 = *((_QWORD *)this + 11);
  v7 = *(unsigned int *)(v6 + 4 * a2);
  data = Cache::get_data(*((Cache **)this + 9), *(_DWORD *)(v6 + 4 * a2), &v28, *((unsigned int *)this + 16));
  v9 = *((_DWORD *)this + 16);
  if (data < v9 && v9 >= 1)
  {
    v11 = 0;
    v12 = v28;
    do
    {
      v13 = (double (*)(_QWORD *, uint64_t, uint64_t))*((_QWORD *)this + 1);
      v14 = *((_QWORD *)this + 2);
      v15 = (_QWORD *)((char *)this + (v14 >> 1));
      if ((v14 & 1) != 0)
        v13 = *(double (**)(_QWORD *, uint64_t, uint64_t))(*v15 + v13);
      v16 = v13(v15, v7, v11);
      v12[v11++] = v16;
    }
    while (v11 < *((int *)this + 16));
  }
  v17 = *((int *)this + 24);
  result = (float *)*((_QWORD *)this + v17 + 13);
  *((_DWORD *)this + 24) = 1 - v17;
  if (a3 >= 1)
  {
    v19 = (char *)*((_QWORD *)this + 10);
    v20 = (int *)*((_QWORD *)this + 11);
    v21 = (float)v19[a2];
    v22 = v28;
    v23 = a3;
    v24 = result;
    do
    {
      v25 = *v19++;
      v26 = v21 * (float)v25;
      v27 = *v20++;
      *v24++ = v26 * v22[v27];
      --v23;
    }
    while (v23);
  }
  return result;
}

uint64_t SVR_Q::get_QD(SVR_Q *this)
{
  return *((_QWORD *)this + 15);
}

double SVR_Q::swap_index(SVR_Q *this, int a2, int a3)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  double result;

  v3 = *((_QWORD *)this + 10);
  v4 = *(_BYTE *)(v3 + a2);
  *(_BYTE *)(v3 + a2) = *(_BYTE *)(v3 + a3);
  *(_BYTE *)(v3 + a3) = v4;
  v5 = *((_QWORD *)this + 11);
  v6 = *(_DWORD *)(v5 + 4 * a2);
  *(_DWORD *)(v5 + 4 * a2) = *(_DWORD *)(v5 + 4 * a3);
  *(_DWORD *)(v5 + 4 * a3) = v6;
  v7 = *((_QWORD *)this + 15);
  result = *(double *)(v7 + 8 * a2);
  *(_QWORD *)(v7 + 8 * a2) = *(_QWORD *)(v7 + 8 * a3);
  *(double *)(v7 + 8 * a3) = result;
  return result;
}

void SVR_Q::~SVR_Q(SVR_Q *this)
{
  SVR_Q::~SVR_Q(this);
  JUMPOUT(0x20BD06848);
}

{
  Cache *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &unk_24C09D908;
  v2 = (Cache *)*((_QWORD *)this + 9);
  if (v2)
  {
    Cache::~Cache(v2);
    MEMORY[0x20BD06848]();
  }
  v3 = *((_QWORD *)this + 10);
  if (v3)
    MEMORY[0x20BD06830](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 11);
  if (v4)
    MEMORY[0x20BD06830](v4, 0x1000C8052888210);
  v5 = *((_QWORD *)this + 13);
  if (v5)
    MEMORY[0x20BD06830](v5, 0x1000C8052888210);
  v6 = *((_QWORD *)this + 14);
  if (v6)
    MEMORY[0x20BD06830](v6, 0x1000C8052888210);
  v7 = *((_QWORD *)this + 15);
  if (v7)
    MEMORY[0x20BD06830](v7, 0x1000C8000313F17);
  Kernel::~Kernel(this);
}

BOOL nlp::traverseCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  if (a2)
  {
    v2 = a2;
    a2 += 20;
    v3 = *(_DWORD *)(v2 + 16);
    v4 = *(unsigned int *)(v2 + 8);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return nlp::BurstTrieAdd(a1, a2, v3, v4);
}

BOOL nlp::BurstTrieAdd(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v5;
  int v6;
  int v7;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  const void *v18;
  unsigned int v19;
  size_t v20;
  unint64_t v21;
  int v22;
  unsigned __int16 *v23;

  if (*(_QWORD *)(a1 + 2080) || (*(_BYTE *)(a1 + 2064) & 1) != 0)
    return 0;
  v5 = 0;
  v22 = 0;
  v6 = a3 - 1;
  if ((a3 - 1) <= 0x3FE)
  {
    v7 = a4;
    if ((_DWORD)a4)
    {
      v9 = 0;
      v10 = (int *)a1;
      while (1)
      {
        v11 = *(_QWORD *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1];
        if ((v11 & 3) != 1)
          break;
        v10 = (int *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
        if (a3 == ++v9)
        {
          v12 = *v10;
          *v10 = a4;
          if (!v12)
            goto LABEL_17;
LABEL_18:
          v5 = 1;
          return v5 != 0;
        }
      }
      if ((v11 & 3) != 2)
      {
        v17 = (unsigned __int8 *)(a2 + v9);
        v18 = (const void *)(a2 + v9 + 1);
        v19 = v6 - v9;
        v20 = (v6 - v9);
        v21 = (unint64_t)malloc_type_calloc(1uLL, v20 + 15, 0xA9B8A391uLL);
        memcpy((void *)(v21 + 14), v18, v20);
        *(_BYTE *)(v21 + 14 + v19) = 0;
        *(_WORD *)(v21 + 12) = v19;
        *(_DWORD *)(v21 + 8) = v7;
        *(_QWORD *)v21 = 0;
        *(_QWORD *)&v10[2 * *v17 + 1] = v21 | 2;
        goto LABEL_17;
      }
      v23 = (unsigned __int16 *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
      v14 = nlp::addListNode(a1, &v23, a2, a3, (int)v9 + 1, a4, &v22);
      v15 = (unint64_t)v23;
      if (v14 >= *(_DWORD *)(a1 + 2088))
      {
        v15 = (unint64_t)nlp::burstLevel(a1, v23, &v22);
        v16 = 1;
      }
      else
      {
        v16 = 2;
      }
      v5 = v22;
      *(_QWORD *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1] = v16 | v15;
      if (v5 == 2)
      {
LABEL_17:
        ++*(_DWORD *)(a1 + 2060);
        goto LABEL_18;
      }
    }
  }
  return v5 != 0;
}

uint64_t nlp::TrieCompletionGetCompletion(uint64_t a1)
{
  if (a1)
    return a1 + 20;
  else
    return 0;
}

uint64_t nlp::TrieCompletionGetLength(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t nlp::TrieCompletionGetPayload(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

_QWORD *nlp::rankedTraverseCallback(uint64_t a1, float *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  _QWORD *result;
  uint64_t v8;
  _BYTE v9[24];
  _BYTE *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
    v3 = (uint64_t)(a2 + 5);
  else
    v3 = 0;
  if (a2)
  {
    v4 = *((unsigned int *)a2 + 4);
    v5 = *((unsigned int *)a2 + 2);
    v6 = *a2;
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v6 = 0.0;
  }
  v10 = 0;
  nlp::BurstTrieAddWithScore(a1, v3, v4, v5, 0, (uint64_t)v9, v6);
  result = v10;
  if (v10 == v9)
  {
    v8 = 4;
    result = v9;
  }
  else
  {
    if (!v10)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v8))();
}

void sub_20840C5BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL nlp::BurstTrieAddWithScore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, float a7)
{
  _BOOL8 result;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  _BYTE v19[24];
  _BYTE *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 2080) || (*(_BYTE *)(a1 + 2064) & 1) == 0)
    return 0;
  result = 0;
  v18 = 0;
  if ((a3 - 1) <= 0x3FE && (_DWORD)a4)
  {
    v17 = 0;
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v19, a6);
    nlp::addLevelRanked((unsigned __int16 *)a1, a1, a2, a3, 0, a4, (float *)&v17, &v18, a7, a5, (uint64_t)v19);
    v14 = v20;
    if (v20 == v19)
    {
      v15 = 4;
      v14 = v19;
    }
    else
    {
      if (!v20)
      {
LABEL_12:
        v16 = v18;
        if (v18 == 2)
          ++*(_DWORD *)(a1 + 2060);
        return v16 != 0;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_12;
  }
  return result;
}

void sub_20840C734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v16;
  uint64_t v17;

  v16 = a15;
  if (a15 == &a12)
  {
    v17 = 4;
    v16 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

float nlp::TrieCompletionGetScore(uint64_t a1)
{
  if (a1)
    return *(float *)a1;
  else
    return 0.0;
}

double nlp::BurstTrieCreateMutable(nlp *this)
{
  return nlp::BurstTrieCreateMutableWithOptions(64, 0);
}

double nlp::BurstTrieCreateMutableWithOptions(int a1, int a2)
{
  char *v4;
  double result;

  v4 = (char *)malloc_type_calloc(1uLL, 0x838uLL, 0x105004014637929uLL);
  if (v4)
  {
    result = 0.0;
    *(_OWORD *)(v4 + 2060) = 0u;
    *((_DWORD *)v4 + 519) = 1;
    *((_QWORD *)v4 + 260) = 0;
    *(_QWORD *)(v4 + 2092) = 0x200000000;
    *((_DWORD *)v4 + 516) = a2;
    *((_DWORD *)v4 + 522) = a1;
  }
  return result;
}

char *nlp::BurstTrieCreateFromFile(char *this, const __CFString *a2)
{
  const __CFString *v2;
  int v3;
  char *v4;
  char *v5;
  CFIndex usedBufLen;
  stat v7;
  UInt8 buffer[1024];
  uint64_t v9;
  CFRange v10;

  v9 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    v2 = (const __CFString *)this;
    usedBufLen = 0;
    v10.length = CFStringGetLength((CFStringRef)this);
    v10.location = 0;
    CFStringGetBytes(v2, v10, 0x8000100u, 0x2Du, 0, buffer, 1024, &usedBufLen);
    buffer[usedBufLen] = 0;
    if (stat((const char *)buffer, &v7))
    {
      v3 = -1;
LABEL_4:
      close(v3);
      return 0;
    }
    v3 = open((const char *)buffer, 0);
    if (v3 < 0)
      goto LABEL_4;
    v4 = (char *)mmap(0, v7.st_size, 1, 1, v3, 0);
    if (!v4)
    {
LABEL_11:
      if (!v3)
        return 0;
      goto LABEL_4;
    }
    v5 = v4;
    this = nlp::burstTrieCreateWithBytes(v4, (const char *)1);
    if (!this)
    {
      munmap(v5, v7.st_size);
      goto LABEL_11;
    }
  }
  return this;
}

char *nlp::burstTrieCreateWithBytes(char *this, const char *a2)
{
  _DWORD *v2;
  int v4;
  int v5;
  int v6;

  if (this)
  {
    v2 = this;
    if (*(_DWORD *)this == 12648430 || *(_DWORD *)this == -900339842)
    {
      v4 = (int)a2;
      this = (char *)malloc_type_calloc(1uLL, 0x838uLL, 0x105004014637929uLL);
      *((_QWORD *)this + 260) = v2;
      v5 = v2[3];
      *(_QWORD *)(this + 2068) = v2[2];
      *((_DWORD *)this + 515) = v5;
      v6 = v2[4];
      *((_DWORD *)this + 516) = v6;
      if (*v2 == -900339842)
        *((_DWORD *)this + 516) = v6 | 1;
      *((_DWORD *)this + 522) = v2[5];
      *((_DWORD *)this + 523) = v4;
      *((_DWORD *)this + 524) = 2;
      *((_DWORD *)this + 519) = 1;
    }
    else
    {
      return 0;
    }
  }
  return this;
}

void nlp::BurstTrieRelease(char *a1)
{
  int v2;
  void *v3;

  if (a1)
  {
    v2 = *((_DWORD *)a1 + 519) - 1;
    *((_DWORD *)a1 + 519) = v2;
    if (!v2)
    {
      v3 = (void *)*((_QWORD *)a1 + 260);
      if (v3)
      {
        if (*((_DWORD *)a1 + 523))
          munmap(v3, *(_QWORD *)(a1 + 2068));
      }
      else if ((a1[2064] & 1) != 0)
      {
        nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>((uint64_t)a1);
      }
      else
      {
        nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>((uint64_t)a1);
      }
      free(a1);
    }
  }
}

char *nlp::BurstTrieCreateWithBytes(nlp *this, const char *a2)
{
  return nlp::burstTrieCreateWithBytes((char *)this, 0);
}

uint64_t nlp::BurstTrieGetCount(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 2060);
  return result;
}

uint64_t nlp::BurstTrieCreateMutableCopy(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[3];
  _QWORD *v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  nlp::BurstTrieCreateMutableWithOptions(a1[522], a1[516]);
  v3 = v2;
  if ((a1[516] & 1) != 0)
  {
    v9[0] = &off_24C09D9E8;
    v9[1] = nlp::rankedTraverseCallback;
    v10 = v9;
    nlp::BurstTrieSearch((nlp *)a1, 0, 0, v2, (uint64_t)v9, -1);
    v4 = v10;
    if (v10 == v9)
    {
      v5 = 4;
      v4 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    v7[0] = &off_24C09D9E8;
    v7[1] = nlp::traverseCallback;
    v8 = v7;
    nlp::BurstTrieSearch((nlp *)a1, 0, 0, v2, (uint64_t)v7, -1);
    v4 = v8;
    if (v8 == v7)
    {
      v5 = 4;
      v4 = v7;
LABEL_10:
      (*(void (**)(void))(*v4 + 8 * v5))();
      return v3;
    }
  }
  if (v4)
  {
    v5 = 5;
    goto LABEL_10;
  }
  return v3;
}

void sub_20840CBA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;

  v19 = a17;
  if (a17 == v17)
  {
    v20 = 4;
    v19 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieSearch(nlp *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  nlp *CursorWithBytes;
  nlp *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((a6 & 0x80000000) == 0)
  {
    CursorWithBytes = (nlp *)nlp::BurstTrieCreateCursorWithBytes((uint64_t)a1, a2, a3);
    if (!CursorWithBytes)
      return;
    v12 = CursorWithBytes;
    v13 = operator new(0x20uLL);
    *v13 = &off_24C09DA98;
    v13[1] = a2;
    *((_DWORD *)v13 + 4) = a3;
    v13[3] = a5;
    v19 = v13;
    nlp::BurstTrieTraverseFromCursor(v12, 0, (uint64_t)v18, a6);
    v14 = v19;
    if (v19 == v18)
    {
      v15 = 4;
      v14 = v18;
    }
    else
    {
      if (!v19)
      {
LABEL_11:
        free(v12);
        return;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_11;
  }
  v20 = 0xFFFFFFFF00000003;
  v21 = 0;
  v22 = a4;
  v16 = v23;
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v23, a5);
  nlp::searchWithContext(a1, a2, a3, 0, (uint64_t)&v20);
  if (v24 == v23)
  {
    v17 = 4;
  }
  else
  {
    if (!v24)
      return;
    v17 = 5;
    v16 = v24;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v17))(v16);
}

void sub_20840CD64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19)
{
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v22;
  uint64_t v23;

  v20 = v19;
  if (a19 == v20)
  {
    v22 = v20;
    v23 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v23 = 5;
    v22 = a19;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::BurstTrieRetain(uint64_t result)
{
  if (result)
    ++*(_DWORD *)(result + 2076);
  return result;
}

unsigned __int16 *nlp::addLevelRanked(unsigned __int16 *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, float *a7, int *a8, float a9, uint64_t a10, uint64_t a11)
{
  float v13;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  unsigned int v23;
  uint64_t v24;
  unsigned __int8 *v25;
  size_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned __int16 *v29;
  uint64_t v30;
  unsigned __int8 *v31;
  unsigned __int16 *v32;
  _BYTE v33[24];
  unsigned __int16 *v34;
  _BYTE v35[24];
  unsigned __int16 *v36;
  uint64_t v37;

  v13 = a9;
  v37 = *MEMORY[0x24BDAC8D0];
  if (a5 >= a4)
  {
    *a8 = 2;
    if (*(_DWORD *)(a2 + 8))
    {
      *a8 = 1;
      if (*(_QWORD *)(a11 + 24))
      {
        result = (unsigned __int16 *)std::function<float ()(void *,float,float)>::operator()(a11, a10, *(float *)(a2 + 4), a9);
        v13 = v22;
      }
    }
    *(float *)(a2 + 4) = v13;
    *(_DWORD *)(a2 + 8) = a6;
    *a7 = v13;
    goto LABEL_24;
  }
  v19 = (uint64_t)result;
  v31 = (unsigned __int8 *)(a3 + a5);
  v20 = *(_QWORD *)(a2 + 8 * *v31 + 12);
  if ((v20 & 3) == 2)
  {
    v32 = (unsigned __int16 *)(v20 & 0xFFFFFFFFFFFFFFFCLL);
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v33, a11);
    v23 = nlp::addListNodeRanked(v19, (uint64_t **)&v32, a3, a4, a5 + 1, a6, a7, a8, v13, a10, (uint64_t)v33);
    result = v34;
    if (v34 == (unsigned __int16 *)v33)
    {
      v24 = 4;
      result = (unsigned __int16 *)v33;
    }
    else
    {
      if (!v34)
      {
LABEL_19:
        v29 = v32;
        if (v23 >= *(_DWORD *)(v19 + 2088))
        {
          result = (unsigned __int16 *)nlp::burstLevelRanked(v19, v32, a7, a8);
          v29 = result;
          v30 = 1;
        }
        else
        {
          v30 = 2;
        }
        v28 = v30 | (unint64_t)v29;
        v25 = v31;
        goto LABEL_23;
      }
      v24 = 5;
    }
    result = (unsigned __int16 *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v24))();
    goto LABEL_19;
  }
  if ((v20 & 3) != 1)
  {
    *a7 = a9;
    v25 = (unsigned __int8 *)(a3 + a5);
    v26 = ~a5 + a4;
    v27 = (unint64_t)malloc_type_calloc(1uLL, v26 + 23, 0x55E7E753uLL);
    result = (unsigned __int16 *)memcpy((void *)(v27 + 22), v31 + 1, v26);
    *(_BYTE *)(v27 + 22 + v26) = 0;
    *(_WORD *)(v27 + 20) = v26;
    *(_DWORD *)(v27 + 16) = a6;
    *(float *)(v27 + 8) = v13;
    *(float *)(v27 + 12) = v13;
    *(_QWORD *)v27 = 0;
    v28 = v27 | 2;
    *a8 = 2;
LABEL_23:
    *(_QWORD *)(a2 + 8 * *v25 + 12) = v28;
    goto LABEL_24;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v35, a11);
  nlp::addLevelRanked(v19, v20 & 0xFFFFFFFFFFFFFFFCLL, a3, a4, a5 + 1, a6, a7, a8, v13, a10, v35);
  result = v36;
  if (v36 == (unsigned __int16 *)v35)
  {
    v21 = 4;
    result = (unsigned __int16 *)v35;
  }
  else
  {
    if (!v36)
      goto LABEL_24;
    v21 = 5;
  }
  result = (unsigned __int16 *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v21))();
LABEL_24:
  if (*a7 > *(float *)a2)
    *(float *)a2 = *a7;
  return result;
}

void sub_20840D098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char *v22;
  uint64_t v23;

  v22 = a17;
  if (a17 == &a14)
  {
    v23 = 4;
    v22 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::BurstTrieRemove(_DWORD *a1, char *a2, int a3)
{
  uint64_t result;
  char *v5;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  unint64_t *v36;
  unint64_t *v37;
  unint64_t v38;
  char *v39;
  int v40;
  uint64_t *v41;
  size_t v42;
  uint64_t v43;
  uint64_t *v44;
  size_t v45;
  char *v46;
  int v47;
  uint64_t *v48;
  size_t v49;
  uint64_t v50;
  uint64_t *v51;
  size_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  nlp *v62;
  uint64_t (***v63)();
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  nlp *v69;
  uint64_t (***v70)();
  uint64_t v71;
  unint64_t v72;
  nlp *v73;
  uint64_t (***v74)();
  uint64_t v75;
  uint64_t v76;
  nlp *v77;
  uint64_t (***v78)();
  uint64_t v79;
  nlp *v80;
  _BYTE *v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  size_t v89;
  const void *v90;
  uint64_t v91;
  float v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  nlp *v97;
  _BYTE *v98;
  uint64_t v99;
  _BYTE *v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  size_t v106;
  const void *v107;
  uint64_t v108;
  float v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  unint64_t *__p;
  char *v115;
  unint64_t *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unsigned int v121;
  void **v122;
  _BYTE v123[24];
  _BYTE *v124;
  uint64_t (**v125)();
  uint64_t *v126;
  uint64_t (***v127)();
  uint64_t (**v128)();
  unsigned int *v129;
  uint64_t (***v130)();
  uint64_t v131;

  result = 0;
  v131 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return result;
  v5 = a2;
  if (!a2 || !a3)
    return result;
  if ((a1[516] & 1) != 0)
  {
    v23 = (unint64_t *)operator new(8uLL);
    v24 = 0;
    *v23 = (unint64_t)a1;
    v25 = v23 + 1;
    v117 = (char *)(v23 + 1);
    __p = v23;
    v116 = v23 + 1;
    v26 = (unint64_t)a1;
    while (1)
    {
      v27 = v26 + 8 * v5[v24];
      v30 = *(_QWORD *)(v27 + 12);
      v29 = (uint64_t *)(v27 + 12);
      v28 = v30;
      v31 = v30 & 3;
      if ((v30 & 3) == 0)
        goto LABEL_62;
      if (v31 == 2)
        break;
      v26 = v28 & 0xFFFFFFFFFFFFFFFCLL;
      if (v25 >= (unint64_t *)v117)
      {
        v32 = v25 - __p;
        if ((unint64_t)(v32 + 1) >> 61)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v33 = (v117 - (char *)__p) >> 2;
        if (v33 <= v32 + 1)
          v33 = v32 + 1;
        if ((unint64_t)(v117 - (char *)__p) >= 0x7FFFFFFFFFFFFFF8)
          v34 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v34 = v33;
        if (v34)
          v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v117, v34);
        else
          v35 = 0;
        v36 = (unint64_t *)&v35[8 * v32];
        *v36 = v26;
        v25 = v36 + 1;
        v37 = v116;
        if (v116 != __p)
        {
          do
          {
            v38 = *--v37;
            *--v36 = v38;
          }
          while (v37 != __p);
          v37 = __p;
        }
        __p = v36;
        v117 = &v35[8 * v34];
        if (v37)
          operator delete(v37);
      }
      else
      {
        *v25++ = v26;
      }
      v116 = v25;
      if (++v24 == a3)
      {
        if (!*(_DWORD *)(v26 + 8))
          goto LABEL_62;
        *(_DWORD *)(v26 + 8) = 0;
        goto LABEL_84;
      }
    }
    v46 = &v5[v24 + 1];
    v47 = ~(_DWORD)v24 + a3;
    v48 = (uint64_t *)(v28 & 0xFFFFFFFFFFFFFFFCLL);
    v49 = *(unsigned __int16 *)((v28 & 0xFFFFFFFFFFFFFFFCLL) + 20);
    if (v47 == (_DWORD)v49 && !memcmp(v46, (char *)v48 + 22, v49))
    {
      v56 = *v48;
      free(v48);
      v57 = v56 | 2;
      if (!v56)
        v57 = 0;
      *v29 = v57;
    }
    else
    {
      v50 = *v48;
      if (!*v48)
        goto LABEL_62;
      while (1)
      {
        v51 = (uint64_t *)v50;
        v52 = *(unsigned __int16 *)(v50 + 20);
        if (v47 == (_DWORD)v52 && !memcmp(v46, (const void *)(v50 + 22), v52))
          break;
        v50 = *v51;
        v48 = v51;
        if (!*v51)
          goto LABEL_62;
      }
      *v48 = *v51;
      free(v51);
    }
LABEL_84:
    if ((unint64_t)((char *)v116 - (char *)__p) < 0x10)
      goto LABEL_159;
    v65 = v116 - __p;
    v121 = 0;
    v66 = v65 - 1;
    if (v65 == 1)
      goto LABEL_159;
    LOBYTE(v67) = 0;
    v68 = a1[522];
    while (1)
    {
      v69 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>((uint64_t)a1, __p[v66]);
      v121 = 0;
      v128 = &off_24C09DBF8;
      v129 = &v121;
      v130 = &v128;
      nlp::BurstTrieTraverseFromCursor(v69, 0, (uint64_t)&v128, -1);
      v70 = v130;
      if (v130 == &v128)
      {
        v70 = &v128;
        v71 = 4;
      }
      else
      {
        if (!v130)
          goto LABEL_92;
        v71 = 5;
      }
      (*v70)[v71]();
LABEL_92:
      if (v69)
        free(v69);
      if (v121 >= v68)
      {
        if ((v67 & 1) == 0)
          goto LABEL_159;
        v67 = v66 + 1;
LABEL_104:
        v118 = 0;
        v119 = 0;
        v120 = 0;
        std::vector<std::tuple<std::string,unsigned int,float>>::reserve(&v118, v68);
        v76 = __p[v67];
        v77 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>((uint64_t)a1, v76);
        v125 = &off_24C09DBA0;
        v126 = &v118;
        v127 = &v125;
        nlp::BurstTrieTraverseFromCursor(v77, 0, (uint64_t)&v125, -1);
        v78 = v127;
        if (v127 == &v125)
        {
          v79 = 4;
          v78 = &v125;
LABEL_134:
          (*v78)[v79]();
        }
        else if (v127)
        {
          v79 = 5;
          goto LABEL_134;
        }
        if (v68 <= (v119 - v118) >> 5)
          __assert_rtn("reverseBurst", "BurstTrie.cpp", 964, "items.size() < sizeThreshold");
        if (v77)
          free(v77);
        nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(v76);
        a1[515] -= (unint64_t)(v119 - v118) >> 5;
        *(_QWORD *)(__p[v66] + 8 * v5[v66] + 12) = 0;
        if ((a3 + 1) < (unint64_t)(v116 - __p))
          __assert_rtn("reverseBurst", "BurstTrie.cpp", 973, "levels.size() <= keyLen + 1");
        v98 = nlp::sharedBuffer(v97);
        v99 = (uint64_t)v98;
        if (v67)
        {
          v100 = v98;
          v101 = v67;
          do
          {
            v102 = *v5++;
            *v100++ = v102;
            --v101;
          }
          while (v101);
        }
        v103 = v118;
        v104 = v119;
        if (v118 == v119)
          goto LABEL_158;
        v105 = a1[516];
        while (2)
        {
          if (*(char *)(v103 + 23) < 0)
          {
            v107 = *(const void **)v103;
            v106 = *(_QWORD *)(v103 + 8);
          }
          else
          {
            v106 = *(unsigned __int8 *)(v103 + 23);
            v107 = (const void *)v103;
          }
          v108 = *(unsigned int *)(v103 + 24);
          v109 = *(float *)(v103 + 28);
          memcpy((void *)(v99 + v67), v107, v106);
          if (*(char *)(v103 + 23) < 0)
            v110 = *(_QWORD *)(v103 + 8);
          else
            LODWORD(v110) = *(unsigned __int8 *)(v103 + 23);
          v111 = (v110 + v67);
          if ((v105 & 1) == 0)
          {
            nlp::BurstTrieAdd((uint64_t)a1, v99, v111, v108);
            goto LABEL_157;
          }
          v124 = 0;
          nlp::BurstTrieAddWithScore((uint64_t)a1, v99, v111, v108, 0, (uint64_t)v123, v109);
          v112 = v124;
          if (v124 == v123)
          {
            v112 = v123;
            v113 = 4;
LABEL_156:
            (*(void (**)(void))(*v112 + 8 * v113))();
          }
          else if (v124)
          {
            v113 = 5;
            goto LABEL_156;
          }
LABEL_157:
          v103 += 32;
          if (v103 == v104)
            goto LABEL_158;
          continue;
        }
      }
      v67 = 1;
      if (!--v66)
        goto LABEL_104;
    }
  }
  v7 = operator new(8uLL);
  v8 = 0;
  *v7 = a1;
  v9 = (char *)(v7 + 1);
  v117 = (char *)(v7 + 1);
  __p = v7;
  v115 = (char *)(v7 + 1);
  v10 = a1;
  do
  {
    v11 = &v10[2 * v5[v8]];
    v14 = *(_QWORD *)(v11 + 1);
    v13 = (uint64_t *)(v11 + 1);
    v12 = v14;
    v15 = v14 & 3;
    if ((v14 & 3) == 0)
      goto LABEL_62;
    if (v15 == 2)
    {
      v39 = &v5[v8 + 1];
      v40 = ~(_DWORD)v8 + a3;
      v41 = (uint64_t *)(v12 & 0xFFFFFFFFFFFFFFFCLL);
      v42 = *(unsigned __int16 *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + 12);
      if (v40 == (_DWORD)v42 && !memcmp(v39, (char *)v41 + 14, v42))
      {
        v54 = *v41;
        free(v41);
        v55 = v54 | 2;
        if (!v54)
          v55 = 0;
        *v13 = v55;
      }
      else
      {
        v43 = *v41;
        if (!*v41)
          goto LABEL_62;
        while (1)
        {
          v44 = (uint64_t *)v43;
          v45 = *(unsigned __int16 *)(v43 + 12);
          if (v40 == (_DWORD)v45 && !memcmp(v39, (const void *)(v43 + 14), v45))
            break;
          v43 = *v44;
          v41 = v44;
          if (!*v44)
            goto LABEL_62;
        }
        *v41 = *v44;
        free(v44);
      }
LABEL_70:
      if ((unint64_t)(v115 - (char *)__p) < 0x10)
        goto LABEL_159;
      v58 = (v115 - (char *)__p) >> 3;
      v121 = 0;
      v59 = v58 - 1;
      if (v58 == 1)
        goto LABEL_159;
      LOBYTE(v60) = 0;
      v61 = a1[522];
      while (1)
      {
        v62 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_TrieLevel *>((uint64_t)a1, __p[v59]);
        v121 = 0;
        v128 = &off_24C09DB48;
        v129 = &v121;
        v130 = &v128;
        nlp::BurstTrieTraverseFromCursor(v62, 0, (uint64_t)&v128, -1);
        v63 = v130;
        if (v130 == &v128)
        {
          v63 = &v128;
          v64 = 4;
        }
        else
        {
          if (!v130)
            goto LABEL_78;
          v64 = 5;
        }
        (*v63)[v64]();
LABEL_78:
        if (v62)
          free(v62);
        if (v121 >= v61)
        {
          if ((v60 & 1) != 0)
          {
            v60 = v59 + 1;
LABEL_99:
            v118 = 0;
            v119 = 0;
            v120 = 0;
            std::vector<std::tuple<std::string,unsigned int,float>>::reserve(&v118, v61);
            v72 = __p[v60];
            v73 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_TrieLevel *>((uint64_t)a1, v72);
            v125 = &off_24C09DAF0;
            v126 = &v118;
            v127 = &v125;
            nlp::BurstTrieTraverseFromCursor(v73, 0, (uint64_t)&v125, -1);
            v74 = v127;
            if (v127 == &v125)
            {
              v75 = 4;
              v74 = &v125;
LABEL_108:
              (*v74)[v75]();
            }
            else if (v127)
            {
              v75 = 5;
              goto LABEL_108;
            }
            if (v61 <= (v119 - v118) >> 5)
              __assert_rtn("reverseBurst", "BurstTrie.cpp", 964, "items.size() < sizeThreshold");
            if (v73)
              free(v73);
            nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(v72);
            a1[515] -= (unint64_t)(v119 - v118) >> 5;
            *(_QWORD *)(__p[v59] + 8 * v5[v59] + 4) = 0;
            if ((a3 + 1) < (unint64_t)((v115 - (char *)__p) >> 3))
              __assert_rtn("reverseBurst", "BurstTrie.cpp", 973, "levels.size() <= keyLen + 1");
            v81 = nlp::sharedBuffer(v80);
            v82 = (uint64_t)v81;
            if (v60)
            {
              v83 = v81;
              v84 = v60;
              do
              {
                v85 = *v5++;
                *v83++ = v85;
                --v84;
              }
              while (v84);
            }
            v86 = v118;
            v87 = v119;
            if (v118 != v119)
            {
              v88 = a1[516];
              do
              {
                if (*(char *)(v86 + 23) < 0)
                {
                  v90 = *(const void **)v86;
                  v89 = *(_QWORD *)(v86 + 8);
                }
                else
                {
                  v89 = *(unsigned __int8 *)(v86 + 23);
                  v90 = (const void *)v86;
                }
                v91 = *(unsigned int *)(v86 + 24);
                v92 = *(float *)(v86 + 28);
                memcpy((void *)(v82 + v60), v90, v89);
                if (*(char *)(v86 + 23) < 0)
                  v93 = *(_QWORD *)(v86 + 8);
                else
                  LODWORD(v93) = *(unsigned __int8 *)(v86 + 23);
                v94 = (v93 + v60);
                if ((v88 & 1) != 0)
                {
                  v124 = 0;
                  nlp::BurstTrieAddWithScore((uint64_t)a1, v82, v94, v91, 0, (uint64_t)v123, v92);
                  v95 = v124;
                  if (v124 == v123)
                  {
                    v95 = v123;
                    v96 = 4;
                    goto LABEL_130;
                  }
                  if (v124)
                  {
                    v96 = 5;
LABEL_130:
                    (*(void (**)(void))(*v95 + 8 * v96))();
                  }
                }
                else
                {
                  nlp::BurstTrieAdd((uint64_t)a1, v82, v94, v91);
                }
                v86 += 32;
              }
              while (v86 != v87);
            }
LABEL_158:
            v122 = (void **)&v118;
            std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v122);
          }
LABEL_159:
          v53 = 1;
          goto LABEL_160;
        }
        v60 = 1;
        if (!--v59)
          goto LABEL_99;
      }
    }
    v10 = (_DWORD *)(v12 & 0xFFFFFFFFFFFFFFFCLL);
    if (v9 >= v117)
    {
      v16 = (v9 - (char *)__p) >> 3;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v17 = (v117 - (char *)__p) >> 2;
      if (v17 <= v16 + 1)
        v17 = v16 + 1;
      if ((unint64_t)(v117 - (char *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v18 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v18 = v17;
      if (v18)
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v117, v18);
      else
        v19 = 0;
      v20 = &v19[8 * v16];
      *(_QWORD *)v20 = v10;
      v9 = v20 + 8;
      v21 = v115;
      if (v115 != (char *)__p)
      {
        do
        {
          v22 = *((_QWORD *)v21 - 1);
          v21 -= 8;
          *((_QWORD *)v20 - 1) = v22;
          v20 -= 8;
        }
        while (v21 != (char *)__p);
        v21 = (char *)__p;
      }
      __p = (unint64_t *)v20;
      v117 = &v19[8 * v18];
      if (v21)
        operator delete(v21);
    }
    else
    {
      *(_QWORD *)v9 = v10;
      v9 += 8;
    }
    v115 = v9;
    ++v8;
  }
  while (v8 != a3);
  if (*v10)
  {
    *v10 = 0;
    goto LABEL_70;
  }
LABEL_62:
  v53 = 0;
LABEL_160:
  if (__p)
    operator delete(__p);
  if (!v53)
    return 0;
  --a1[515];
  return 1;
}

void sub_20840DB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  a16 = &a12;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t nlp::TrieCompletionRetain(uint64_t result)
{
  if (result)
    ++*(_DWORD *)(result + 12);
  return result;
}

const __CFAllocator *nlp::trieCompletionRetain(nlp *this, const __CFAllocator *a2, const void *a3)
{
  const __CFAllocator *result;

  result = a2;
  if (a2)
    ++*((_DWORD *)a2 + 3);
  return result;
}

void nlp::TrieCompletionRelease(void *a1)
{
  int v1;

  if (a1)
  {
    v1 = *((_DWORD *)a1 + 3) - 1;
    *((_DWORD *)a1 + 3) = v1;
    if (!v1)
      free(a1);
  }
}

void nlp::trieCompletionRelease(nlp *this, const __CFAllocator *a2, const void *a3)
{
  int v3;

  if (a2)
  {
    v3 = *((_DWORD *)a2 + 3) - 1;
    *((_DWORD *)a2 + 3) = v3;
    if (!v3)
      free(a2);
  }
}

uint64_t nlp::BurstTrieContains(nlp *a1, const void *a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  int v12;
  uint64_t v13;
  _BYTE v14[24];
  _BYTE *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!(_DWORD)a3)
    return 0;
  v11 = 0xFFFFFFFF00000000;
  v12 = 0;
  v7 = v14;
  v13 = 0;
  v15 = 0;
  nlp::searchWithContext(a1, a2, a3, 1, (uint64_t)&v11);
  if ((v11 & 0x8000000000000000) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (a4)
      *a4 = HIDWORD(v11);
    if (a5)
      *a5 = v12;
    v8 = 1;
  }
  if (v15 == v14)
  {
    v9 = 4;
    goto LABEL_14;
  }
  if (v15)
  {
    v9 = 5;
    v7 = v15;
LABEL_14:
    (*(void (**)(_QWORD *))(*v7 + 8 * v9))(v7);
  }
  return v8;
}

void sub_20840DD58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15)
{
  _QWORD *v15;
  uint64_t v17;

  if (a15 == v15)
  {
    v17 = 4;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v17 = 5;
    v15 = a15;
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v17))(v15);
LABEL_6:
  _Unwind_Resume(exception_object);
}

nlp *nlp::searchWithContext(nlp *result, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  nlp *v16;
  _QWORD v17[3];
  nlp *v18;
  _QWORD v19[3];
  nlp *v20;
  _QWORD v21[3];
  nlp *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0x3FF)
  {
    v9 = (uint64_t)result;
    v10 = nlp::sharedBuffer(result);
    memcpy(v10, a2, a3);
    *((_BYTE *)v10 + a3) = 0;
    v11 = *(_QWORD *)(v9 + 2080);
    v12 = *(_DWORD *)(v9 + 2064);
    if (v11)
    {
      v13 = (*(_DWORD *)(v11 + 4) & 0xFFFFFFFC) + v11;
      if ((v12 & 1) != 0)
      {
        v21[0] = &off_24C09DA40;
        v21[1] = nlp::containsKey;
        v22 = (nlp *)v21;
        nlp::searchDiskLevelRanked(v9, v13, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v21);
        result = v22;
        if (v22 == (nlp *)v21)
        {
          v14 = 4;
          result = (nlp *)v21;
          return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
        }
      }
      else
      {
        v19[0] = &off_24C09DA40;
        v19[1] = nlp::containsKey;
        v20 = (nlp *)v19;
        nlp::searchDiskLevel(v9, v13, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v19);
        result = v20;
        if (v20 == (nlp *)v19)
        {
          v14 = 4;
          result = (nlp *)v19;
          return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
        }
      }
    }
    else if ((v12 & 1) != 0)
    {
      v17[0] = &off_24C09DA40;
      v17[1] = nlp::containsKey;
      v18 = (nlp *)v17;
      nlp::searchLevelRanked(v9, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v17);
      result = v18;
      if (v18 == (nlp *)v17)
      {
        v14 = 4;
        result = (nlp *)v17;
        return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
      }
    }
    else
    {
      v15[0] = &off_24C09DA40;
      v15[1] = nlp::containsKey;
      v16 = (nlp *)v15;
      nlp::searchLevel((int *)v9, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v15);
      result = v16;
      if (v16 == (nlp *)v15)
      {
        v14 = 4;
        result = (nlp *)v15;
        return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
      }
    }
    if (!result)
      return result;
    v14 = 5;
    return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
  }
  return result;
}

void sub_20840DFA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char *v21;
  char *v23;
  uint64_t v24;

  v23 = a17;
  if (a17 == v21)
  {
    v24 = 4;
    v23 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *nlp::BurstTrieCreateCursorWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  void *v6;
  int v7;

  v6 = malloc_type_calloc(0x28uLL, 1uLL, 0x82717553uLL);
  nlp::BurstTrieSetCursorWithBytes(a1, (uint64_t)v6, a2, a3);
  if (!v7 && v6)
  {
    free(v6);
    return 0;
  }
  return v6;
}

nlp *nlp::BurstTrieTraverseFromCursor(nlp *result, uint64_t a2, uint64_t a3, int a4)
{
  nlp *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  char v19;
  _BYTE v20[24];
  nlp *v21;
  _BYTE v22[24];
  nlp *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v7 = result;
    result = (nlp *)nlp::sharedBuffer(result);
    v8 = (uint64_t)result;
    v19 = 0;
    v9 = *((_DWORD *)v7 + 7);
    if (v9)
    {
      if (v9 != 1)
        return result;
      v16 = *(_OWORD *)v7;
      v17 = *((_QWORD *)v7 + 2);
      v10 = *((_QWORD *)v7 + 4);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v22, a3);
      nlp::traverseFromCompactMapCursor(v10, (uint64_t)&v16);
      result = v23;
      if (v23 == (nlp *)v22)
      {
        v14 = 4;
        result = (nlp *)v22;
        return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v14))(result, v11, v12, v13);
      }
    }
    else
    {
      v16 = *(_OWORD *)v7;
      v17 = *((_QWORD *)v7 + 2);
      v18 = *((_DWORD *)v7 + 6);
      v15 = (_QWORD *)*((_QWORD *)v7 + 4);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v20, a3);
      nlp::traverseFromMapCursor(v15, (uint64_t)&v16, v8, 0, &v19, a4, a2, (uint64_t)v20);
      result = v21;
      if (v21 == (nlp *)v20)
      {
        v14 = 4;
        result = (nlp *)v20;
        return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v14))(result, v11, v12, v13);
      }
    }
    if (!result)
      return result;
    v14 = 5;
    return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v14))(result, v11, v12, v13);
  }
  return result;
}

void sub_20840E21C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char *v21;
  char *v23;
  uint64_t v24;

  v23 = a17;
  if (a17 == v21)
  {
    v24 = 4;
    v23 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieCursorRelease(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t nlp::enumerateListNode<nlp::_ListNode *>(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a6, a5, a2, a3, *(_DWORD *)(a1 + 8), a4, 0.0);
}

uint64_t std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, float a7)
{
  uint64_t v7;
  uint64_t v9;
  float v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a3;
  v14 = a2;
  v12 = a4;
  v11 = a5;
  v10 = a7;
  v9 = a6;
  v7 = *(_QWORD *)(a1 + 24);
  if (!v7)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, int *, int *, float *, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v14, &v13, &v12, &v11, &v10, &v9);
}

void nlp::traverseFromCompactMapCursor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

void sub_20840E374(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE *v12;

  if (a2 == *(_DWORD *)(*(_QWORD *)(v6 + 2080) + 4))
  {
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v11, a1);
    nlp::traverseFromCompactMapCursorMappedLevel((_BYTE *)v6, v4, v3, v7, v5, v2, v10, (uint64_t)v11);
    v8 = v12;
    if (v12 == v11)
    {
      v9 = 4;
      v8 = v11;
    }
    else
    {
      if (!v12)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
}

void sub_20840EAE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char *a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  char *v26;
  char *v28;
  uint64_t v29;

  v28 = a14;
  if (a14 == v26)
  {
    v29 = 4;
    v28 = &a11;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_BYTE *nlp::traverseFromCompactMapCursorMappedLevel(_BYTE *result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, _BYTE *a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v24[24];
  _BYTE *v25;
  _BYTE v26[24];
  _BYTE *v27;
  uint64_t v28;

  v11 = result;
  v28 = *MEMORY[0x24BDAC8D0];
  v12 = (*(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *((_QWORD *)result + 260);
  if ((result[2064] & 1) == 0)
  {
    if (*(_DWORD *)(v12 + 1024))
    {
      *(_BYTE *)(a3 + a5) = 0;
      result = (_BYTE *)std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a8, a7, a3, 0, *(_DWORD *)(v12 + 1024), (uint64_t)a6, 0.0);
      if (a5 >= a4 || *a6)
        return result;
    }
    else if (a5 >= a4)
    {
      return result;
    }
    v13 = 0;
    while (1)
    {
      *(_BYTE *)(a3 + a5) = v13;
      *(_QWORD *)a2 = *(unsigned int *)(v12 + 4 * v13);
      *(_QWORD *)(a2 + 8) = 0;
      *(_DWORD *)(a2 + 16) = 0;
      if (v13)
        v14 = a5 + 1;
      else
        v14 = a5;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v24, a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v13 != 0), v14, a6, a7, v24);
      result = v25;
      if (v25 == v24)
      {
        result = v24;
        v15 = 4;
      }
      else
      {
        if (!v25)
          goto LABEL_20;
        v15 = 5;
      }
      result = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v15))();
LABEL_20:
      if (!*a6)
      {
        v16 = v13++ == 255;
        if (!v16)
          continue;
      }
      return result;
    }
  }
  if (!*(_DWORD *)(v12 + 1024))
  {
    if (a5 >= a4)
      return result;
    goto LABEL_25;
  }
  *(_BYTE *)(a3 + a5) = 0;
  result = (_BYTE *)std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a8, a7, a3, 0, *(_DWORD *)(v12 + 1024), (uint64_t)a6, *(float *)(v12 + 1032));
  if (a5 < a4 && !*a6)
  {
LABEL_25:
    v17 = 0;
    while (1)
    {
      *(_BYTE *)(a3 + a5) = v17;
      *(_QWORD *)a2 = *(unsigned int *)(v12 + 4 * v17);
      if (v17)
        v18 = a5 + 1;
      else
        v18 = a5;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v26, a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v17 != 0), v18, a6, a7, v26);
      result = v27;
      if (v27 == v26)
      {
        result = v26;
        v19 = 4;
      }
      else
      {
        if (!v27)
          goto LABEL_34;
        v19 = 5;
      }
      result = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v19))();
LABEL_34:
      if (!*a6)
      {
        v16 = v17++ == 255;
        if (!v16)
          continue;
      }
      return result;
    }
  }
  return result;
}

void sub_20840EE94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v20;
  uint64_t v21;

  v20 = a19;
  if (a19 == &a16)
  {
    v21 = 4;
    v20 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieSetCursorWithBytes(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  __n128 v7;

  if (a1 && a2)
  {
    if (nlp::burstTrieSetCursor(a1, a2))
      nlp::BurstTrieCursorAdvanceWithBytes(a2, a3, a4, v7);
  }
}

uint64_t nlp::burstTrieSetCursor(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t result;
  uint64_t v4;

  if (!a2)
    return 0;
  *(_QWORD *)(a2 + 32) = a1;
  v2 = *(_DWORD **)(a1 + 2080);
  if (v2)
  {
    if (*v2 == -900339842 || *v2 == 12648430 && v2[7] == 2)
    {
      result = 1;
      *(_DWORD *)(a2 + 28) = 1;
      v4 = v2[1];
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)a2 = v4;
      return result;
    }
    return 0;
  }
  *(_DWORD *)(a2 + 28) = 0;
  *(_QWORD *)(a2 + 8) = a1 | 1;
  *(_QWORD *)(a2 + 16) = 0;
  return 1;
}

void nlp::BurstTrieCursorAdvanceWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3, __n128 a4)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 28);
    if (v5)
    {
      if (v5 == 1)
      {
        v6 = *(_QWORD *)a1;
        v7 = *(_QWORD *)(a1 + 8);
        v8 = *(_DWORD *)(a1 + 16);
        v9 = *(_DWORD *)(a1 + 20);
        nlp::advanceCompactMapCursor(*(_QWORD *)(a1 + 32), a1);
        if (!v10)
        {
          *(_QWORD *)a1 = v6;
          *(_QWORD *)(a1 + 8) = v7;
          *(_DWORD *)(a1 + 16) = v8;
          *(_DWORD *)(a1 + 20) = v9;
        }
      }
    }
    else
    {
      v12 = *(_QWORD *)a1;
      v11 = *(_QWORD *)(a1 + 8);
      v13 = *(_QWORD *)(a1 + 16);
      v14 = *(_DWORD *)(a1 + 24);
      if (!nlp::advanceMapCursor(*(_QWORD *)(a1 + 32), a1, a2, a3, a4))
      {
        *(_QWORD *)a1 = v12;
        *(_QWORD *)(a1 + 8) = v11;
        *(_QWORD *)(a1 + 16) = v13;
        *(_DWORD *)(a1 + 24) = v14;
      }
    }
  }
}

void nlp::advanceCompactMapCursor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

BOOL sub_20840F0DC@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned __int8 *v3;
  uint64_t v4;

  return a1 == *(_DWORD *)(*(_QWORD *)(v4 + 2080) + 4)
      && nlp::advanceCompactMapCursorMappedLevel(v4, v1, v3, v2) != 0;
}

uint64_t nlp::advanceMapCursor(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v9;
  _DWORD *v10;
  uint64_t *v11;
  int v12;

  v9 = *(_QWORD *)(a2 + 8);
  if ((v9 & 3) == 2)
  {
    v12 = nlp::advanceMapCursorTrieList(a1, a2, a3, a4, a5);
    return v12 != 0;
  }
  if ((v9 & 3) != 1)
    return 0;
  v10 = (_DWORD *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    if (a4)
    {
      v11 = (uint64_t *)&v10[2 * *a3 + 3];
      goto LABEL_10;
    }
    *(_DWORD *)(a2 + 20) = v10[2];
    *(_DWORD *)(a2 + 24) = v10[1];
  }
  else
  {
    if (a4)
    {
      v11 = (uint64_t *)&v10[2 * *a3 + 1];
LABEL_10:
      nlp::updateMapCursorPointer(a1, a2, *v11);
      v12 = nlp::advanceMapCursor(a1, a2, a3 + 1, a4 - 1);
      return v12 != 0;
    }
    *(_DWORD *)(a2 + 20) = *v10;
  }
  return 1;
}

void *nlp::sharedBuffer(nlp *this)
{
  unsigned __int8 v1;
  void *v2;
  pthread_key_t v4;

  {
    v4 = 0;
    pthread_key_create(&v4, (void (__cdecl *)(void *))MEMORY[0x24BDAE450]);
    nlp::sharedBuffer(void)::key = v4;
  }
  v2 = pthread_getspecific(nlp::sharedBuffer(void)::key);
  if (!v2)
  {
    v2 = malloc_type_malloc(0x1000uLL, 0xCD357DB2uLL);
    pthread_setspecific(nlp::sharedBuffer(void)::key, v2);
  }
  return v2;
}

void sub_20840F704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_QWORD *nlp::traverseFromMapCursor(_QWORD *result, uint64_t a2, uint64_t a3, unsigned int a4, _BYTE *a5, int a6, uint64_t a7, uint64_t a8)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD v60[3];
  _QWORD *v61;
  _BYTE v62[24];
  _BYTE *v63;
  _QWORD v64[3];
  _QWORD *v65;
  _QWORD v66[3];
  _QWORD *v67;
  _BYTE v68[24];
  _BYTE *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v13 = *((_DWORD *)result + 516);
  v14 = *(_QWORD *)(a2 + 8) & 3;
  if (v14 != 2)
  {
    if (v14 != 1)
      return result;
    v15 = (uint64_t)result;
    if ((v13 & 1) == 0)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v64, a8);
      v16 = (int *)(*(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL);
      if (*v16)
      {
        std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v64, a7, a3, a4, *v16, (uint64_t)a5, *(float *)(a2 + 24));
        if (!a6 || *a5)
          goto LABEL_85;
      }
      else if (!a6)
      {
        goto LABEL_85;
      }
      v48 = 0;
      v49 = (a6 - 1);
      while (1)
      {
        *(_BYTE *)(a3 + a4) = v48;
        nlp::updateMapCursorPointer(v15, a2, *(_QWORD *)&v16[2 * v48 + 1]);
        v50 = (uint64_t)v65;
        if (!v65)
          goto LABEL_59;
        if (v65 != v64)
          break;
        v69 = v68;
        (*(void (**)(_QWORD *, _BYTE *))(v64[0] + 24))(v64, v68);
LABEL_61:
        nlp::traverseFromMapCursor(v15, a2, a3, a4 + 1, a5, v49, a7, v68);
        v51 = v69;
        if (v69 == v68)
        {
          v51 = v68;
          v52 = 4;
        }
        else
        {
          if (!v69)
            goto LABEL_66;
          v52 = 5;
        }
        (*(void (**)(void))(*v51 + 8 * v52))();
LABEL_66:
        if (!*a5)
        {
          v53 = v48++ == 255;
          if (!v53)
            continue;
        }
        goto LABEL_85;
      }
      v50 = (*(uint64_t (**)(void))(*v65 + 16))();
LABEL_59:
      v69 = (_BYTE *)v50;
      goto LABEL_61;
    }
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v66, a8);
    v33 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
    v34 = *(_DWORD *)(v33 + 8);
    if (v34)
    {
      std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v66, a7, a3, a4, v34, (uint64_t)a5, *(float *)(a2 + 24));
      if (!a6 || *a5)
      {
LABEL_85:
        if ((v13 & 1) != 0)
        {
          result = v67;
          if (v67 != v66)
            goto LABEL_89;
          v47 = 4;
          result = v66;
        }
        else
        {
          result = v65;
          if (v65 != v64)
            goto LABEL_89;
          v47 = 4;
          result = v64;
        }
        return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
      }
    }
    else if (!a6)
    {
      goto LABEL_85;
    }
    v54 = 0;
    v55 = (a6 - 1);
    while (1)
    {
      *(_BYTE *)(a3 + a4) = v54;
      nlp::updateMapCursorPointer(v15, a2, *(_QWORD *)(v33 + 12 + 8 * v54));
      v56 = (uint64_t)v67;
      if (!v67)
        goto LABEL_75;
      if (v67 != v66)
        break;
      v69 = v68;
      (*(void (**)(_QWORD *, _BYTE *))(v66[0] + 24))(v66, v68);
LABEL_77:
      nlp::traverseFromMapCursor(v15, a2, a3, a4 + 1, a5, v55, a7, v68);
      v57 = v69;
      if (v69 == v68)
      {
        v57 = v68;
        v58 = 4;
      }
      else
      {
        if (!v69)
          goto LABEL_82;
        v58 = 5;
      }
      (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_82:
      if (!*a5)
      {
        v53 = v54++ == 255;
        if (!v53)
          continue;
      }
      goto LABEL_85;
    }
    v56 = (*(uint64_t (**)(void))(*v67 + 16))();
LABEL_75:
    v69 = (_BYTE *)v56;
    goto LABEL_77;
  }
  if ((v13 & 1) != 0)
  {
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v62, a8);
    v35 = *(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL;
    if (v35)
    {
      v36 = (unsigned __int8 *)(v35 + 22);
      v37 = *(unsigned int *)(a2 + 16);
      while (1)
      {
        v38 = *(unsigned __int16 *)(v35 + 20);
        if (v38 >= v37)
        {
          v39 = v38 - (int)v37;
          if (a6 < 0 || (int)v39 <= a6)
          {
            if ((_DWORD)v37)
            {
              v40 = (unsigned __int8 *)(v35 + 22);
              v41 = v36;
              v42 = v37;
              while (1)
              {
                v44 = *v40++;
                v43 = v44;
                v45 = *v41++;
                if (v43 != v45)
                  break;
                if (!--v42)
                  goto LABEL_47;
              }
            }
            else
            {
LABEL_47:
              v46 = v39 + a4;
              memcpy((void *)(a3 + a4), (const void *)(v35 + v37 + 22), v39);
              *(_BYTE *)(a3 + v46) = 0;
              std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v62, a7, a3, v46, *(_DWORD *)(v35 + 16), (uint64_t)a5, *(float *)(v35 + 12));
            }
          }
        }
        v35 = *(_QWORD *)v35;
        if (!v35)
          goto LABEL_49;
      }
    }
    goto LABEL_52;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
  v17 = v13;
  v18 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  v19 = *(unsigned int *)(a2 + 16);
  if (v19 > *(unsigned __int16 *)(v18 + 12))
    __assert_rtn("traverseFromMapCursorTrieList", "BurstTrie.cpp", 1956, "cursor.prfxlen <= head->restlen");
  if (!v18)
    goto LABEL_33;
  v20 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  while (1)
  {
    if (v20 == v18)
    {
      v21 = *(unsigned __int16 *)(v18 + 12);
      goto LABEL_20;
    }
    v21 = *(unsigned __int16 *)(v20 + 12);
    if (v21 <= (unsigned __int16)v19)
      goto LABEL_33;
    if ((_DWORD)v19)
      break;
LABEL_20:
    v28 = v21 - v19;
    if ((a6 & 0x80000000) == 0 && v28 > a6)
      goto LABEL_32;
    v29 = v28 + a4;
    memcpy((void *)(a3 + a4), (const void *)(v20 + v19 + 14), v28);
    *(_BYTE *)(a3 + v29) = 0;
    v30 = (uint64_t)v61;
    if (!v61)
      goto LABEL_25;
    if (v61 != v60)
    {
      v30 = (*(uint64_t (**)(void))(*v61 + 16))();
LABEL_25:
      v69 = (_BYTE *)v30;
      goto LABEL_27;
    }
    v69 = v68;
    (*(void (**)(_QWORD *, _BYTE *))(v60[0] + 24))(v60, v68);
LABEL_27:
    std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v68, a7, a3, v29, *(_DWORD *)(v20 + 8), (uint64_t)a5, 0.0);
    v31 = v69;
    if (v69 == v68)
    {
      v31 = v68;
      v32 = 4;
      goto LABEL_31;
    }
    if (v69)
    {
      v32 = 5;
LABEL_31:
      (*(void (**)(void))(*v31 + 8 * v32))();
    }
LABEL_32:
    v20 = *(_QWORD *)v20;
    if (!v20)
      goto LABEL_33;
  }
  v22 = (unsigned __int8 *)(v20 + 14);
  v23 = (unsigned __int8 *)(v18 + 14);
  v24 = v19;
  while (1)
  {
    v26 = *v22++;
    v25 = v26;
    v27 = *v23++;
    if (v25 != v27)
      break;
    if (!--v24)
      goto LABEL_20;
  }
LABEL_33:
  LOBYTE(v13) = v17;
LABEL_49:
  if ((v13 & 1) != 0)
  {
LABEL_52:
    result = v63;
    if (v63 != v62)
      goto LABEL_89;
    v47 = 4;
    result = v62;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }
  result = v61;
  if (v61 == v60)
  {
    v47 = 4;
    result = v60;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }
LABEL_89:
  if (result)
  {
    v47 = 5;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }
  return result;
}

void sub_20840FCE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,char *a28)
{
  char *v29;
  uint64_t v30;

  v29 = a28;
  if (a28 == &a25)
  {
    v30 = 4;
    v29 = &a25;
  }
  else
  {
    if (!a28)
      goto LABEL_6;
    v30 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v29 + 8 * v30))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *nlp::BurstTrieCursorCreateCopy(_QWORD *result)
{
  _QWORD *v1;
  int v2;

  if (result)
  {
    v1 = result;
    result = malloc_type_calloc(0x28uLL, 1uLL, 0x55758E37uLL);
    v2 = *((_DWORD *)v1 + 7);
    if (v2)
    {
      if (v2 == 1)
      {
        *result = *v1;
        result[1] = v1[1];
        *((_DWORD *)result + 4) = *((_DWORD *)v1 + 4);
        *((_DWORD *)result + 5) = *((_DWORD *)v1 + 5);
      }
    }
    else
    {
      *(_OWORD *)result = *(_OWORD *)v1;
      result[2] = v1[2];
      *((_DWORD *)result + 6) = *((_DWORD *)v1 + 6);
    }
    *((_DWORD *)result + 7) = v2;
    result[4] = v1[4];
  }
  return result;
}

BOOL nlp::BurstTrieCursorIsEqual(uint64_t a1, uint64_t a2)
{
  int v2;

  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32))
    return 0;
  v2 = *(_DWORD *)(a1 + 28);
  if (v2 != *(_DWORD *)(a2 + 28))
    return 0;
  if (v2)
  {
    if (v2 == 1 && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8) && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12))
      return *(_QWORD *)a1 == *(_QWORD *)a2;
    return 0;
  }
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
    return 0;
  return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t nlp::BurstTrieCursorGetPayload(_DWORD *a1, _DWORD *a2)
{
  int v2;
  int v3;

  v2 = a1[7];
  if (v2)
  {
    if (v2 != 1)
      return 0;
    v3 = a1[4];
    if (!v3)
      return 0;
  }
  else
  {
    v3 = a1[5];
    if (!v3)
      return 0;
  }
  if (a2)
    *a2 = v3;
  return 1;
}

CFBinaryHeapRef nlp::TrieCursorQueueCreate(nlp *this)
{
  CFBinaryHeapCallBacks callBacks;

  callBacks.retain = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::TrieCursorRetain;
  callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::TrieCursorRelease;
  callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::TrieCursorCompare;
  return CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks, 0);
}

const __CFAllocator *nlp::TrieCursorRetain(nlp *this, const __CFAllocator *a2, const void *a3)
{
  const __CFAllocator *result;

  result = a2;
  if (a2)
    ++*((_DWORD *)a2 + 5);
  return result;
}

void nlp::TrieCursorRelease(nlp *this, const __CFAllocator *a2, const void *a3)
{
  int v3;

  if (a2)
  {
    v3 = *((_DWORD *)a2 + 5) - 1;
    *((_DWORD *)a2 + 5) = v3;
    if (!v3)
      free(a2);
  }
}

uint64_t nlp::TrieCursorCompare(nlp *this, float *a2, const void *a3, void *a4)
{
  float v4;
  float v5;
  size_t v6;
  int v7;
  int v8;
  uint64_t v10;

  v4 = *((float *)this + 4);
  v5 = a2[4];
  if (v4 == v5)
  {
    v6 = *((unsigned int *)this + 6);
    v7 = *((_DWORD *)a2 + 6);
    if ((_DWORD)v6 == v7)
      v8 = memcmp((char *)this + 28, a2 + 7, v6);
    else
      v8 = v6 - v7;
    v10 = -1;
    if (v8 <= 0)
      v10 = 1;
    if (v8)
      return v10;
    else
      return 0;
  }
  else if (v4 <= v5)
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

void nlp::TrieCursorQueueRelease(CFTypeRef this, __CFBinaryHeap *a2)
{
  if (this)
    CFRelease(this);
}

CFBinaryHeapRef nlp::TrieCompletionQueueCreate(nlp *this)
{
  CFBinaryHeapCallBacks callBacks;

  callBacks.retain = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRetain;
  callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRelease;
  callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::trieCompletionCompareScore;
  return CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks, 0);
}

uint64_t nlp::trieCompletionCompareScore(nlp *this, float *a2, const void *a3, void *a4)
{
  size_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (*(float *)this != *a2)
  {
    if (*(float *)this <= *a2)
      return 1;
    else
      return -1;
  }
  v4 = *((unsigned int *)this + 4);
  v5 = *((_DWORD *)a2 + 4);
  if ((_DWORD)v4 != v5)
  {
    v6 = v4 - v5;
LABEL_13:
    if (v6 > 0)
      return -1;
    else
      return 1;
  }
  v6 = *((_DWORD *)this + 2) - *((_DWORD *)a2 + 2);
  if (v6)
    goto LABEL_13;
  v7 = memcmp((char *)this + 20, a2 + 5, v4);
  v8 = -1;
  if (v7 <= 0)
    v8 = 1;
  if (v7)
    return v8;
  else
    return 0;
}

void nlp::BurstTrieRankedSearchWithSelection(unint64_t a1, _QWORD *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7)
{
  __CFBinaryHeap *v14;
  __CFBinaryHeap *v15;
  _DWORD *v16;
  const void *Minimum;
  CFBinaryHeapCallBacks callBacks;

  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    callBacks.retain = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRetain;
    callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRelease;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::trieCompletionInternalCompareScore;
    v14 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks, 0);
    if (v14)
    {
      v15 = v14;
      v16 = *(_DWORD **)(a1 + 2080);
      if (v16)
      {
        if (*v16 != -900339842 && v16[7] != 2)
          return;
        nlp::rankSearchDiskLevel((nlp *)a1, (uint64_t)v16 + (v16[1] & 0xFFFFFFFC), a3, a4, 0, a6, v14, a5, a2);
      }
      else
      {
        nlp::rankSearchLevel((nlp *)a1, a1, a3, a4, 0, a6, v14, a5, a2);
      }
      while (CFBinaryHeapGetCount(v15))
      {
        Minimum = CFBinaryHeapGetMinimum(v15);
        CFBinaryHeapAddValue(a7, Minimum);
        CFBinaryHeapRemoveMinimumValue(v15);
      }
      CFRelease(v15);
    }
  }
}

uint64_t nlp::trieCompletionInternalCompareScore(nlp *this, float *a2, const void *a3, void *a4)
{
  size_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (*(float *)this != *a2)
  {
    if (*(float *)this >= *a2)
      return 1;
    else
      return -1;
  }
  v4 = *((unsigned int *)this + 4);
  v5 = *((_DWORD *)a2 + 4);
  if ((_DWORD)v4 != v5)
  {
    v6 = v4 - v5;
LABEL_13:
    if (v6 < 0)
      return -1;
    else
      return 1;
  }
  v6 = *((_DWORD *)this + 2) - *((_DWORD *)a2 + 2);
  if (v6)
    goto LABEL_13;
  v7 = memcmp((char *)this + 20, a2 + 5, v4);
  v8 = -1;
  if (v7 >= 0)
    v8 = 1;
  if (v7)
    return v8;
  else
    return 0;
}

uint64_t nlp::rankSearchDiskLevel(nlp *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, uint64_t a8, _QWORD *a9)
{
  unsigned int v10;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  _DWORD *v24;
  _BOOL4 updated;
  _BOOL4 v26;
  int v27;

  v10 = a4;
  if (a5 >= a4)
  {
LABEL_5:
    v18 = nlp::sharedBuffer(a1);
    if ((int)(v10 + 1) <= 1023)
    {
      v19 = v18;
      memcpy(v18, a3, v10);
      v20 = 0;
      v19[v10 + 1] = 0;
      do
      {
        v21 = *(unsigned int *)(a2 + 4 * v20);
        v19[v10] = v20;
        nlp::rankSearchGetCursor((uint64_t)a1, v21, v19, v10 + 1, a6);
        ++v20;
      }
      while (v20 != 256);
    }
    v22 = *(_DWORD *)(a2 + 1024);
    if (!v22)
      goto LABEL_11;
    v23 = *(_DWORD *)(a2 + 1032);
    v24 = malloc_type_malloc(v10 + 21, 0xF7573F27uLL);
    v24[4] = v10;
    *((_BYTE *)v24 + v10 + 20) = 0;
    memcpy(v24 + 5, a3, v10);
    *v24 = v23;
    v24[2] = v22;
    v24[3] = 1;
    updated = nlp::updateCompletions((float *)v24, a9, a6, a7, a8);
    v26 = updated;
    v27 = v24[3] - 1;
    v24[3] = v27;
    if (v27)
    {
      if (updated)
      {
LABEL_11:
        nlp::rankSearchCursors(a1, a6, a7, a8, a9);
        return 1;
      }
    }
    else
    {
      free(v24);
      if (v26)
        goto LABEL_11;
    }
    return 0;
  }
  v14 = a5;
  while (1)
  {
    v15 = *(_DWORD *)(a2 + 4 * a3[v14]);
    v16 = v15 & 3;
    if (v16 != 1)
      break;
    a2 = (v15 & 0xFFFFFFFC) + *((_QWORD *)a1 + 260);
    if ((_DWORD)a4 == (_DWORD)++v14)
      goto LABEL_5;
  }
  if (v16 != 2)
  {
    if (v16 == 3)
      return nlp::rankSearchCompactDiskLevel((uint64_t)a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + *((_QWORD *)a1 + 260)), a3, a4, (int)v14 + 1, a6, a7, a8, a9);
    return 1;
  }
  return nlp::rankSearchDiskPage(a1, (unsigned int *)((v15 & 0xFFFFFFFC) + *((_QWORD *)a1 + 260)), (char *)a3, a4, v14 + 1, a6, a7, a8, a9);
}

uint64_t nlp::rankSearchLevel(nlp *a1, unint64_t a2, unsigned __int8 *a3, unsigned int a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, unsigned int a8, _QWORD *a9)
{
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  _DWORD *v21;
  _BOOL4 updated;
  _BOOL4 v23;
  int v24;

  if (a5 >= a4)
  {
LABEL_5:
    v16 = nlp::sharedBuffer(a1);
    memcpy(v16, a3, a4);
    v17 = 0;
    *((_BYTE *)v16 + (int)(a4 + 1)) = 0;
    do
    {
      v18 = *(_QWORD *)(a2 + 12 + 8 * v17);
      *((_BYTE *)v16 + a4) = v17;
      nlp::rankSearchGetCursor((uint64_t)a1, v18, v16, a4 + 1, a6);
      ++v17;
    }
    while (v17 != 256);
    v19 = *(_DWORD *)(a2 + 8);
    if (!v19)
      return nlp::rankSearchCursors((int)a1, a6);
    v20 = *(_DWORD *)(a2 + 4);
    v21 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
    v21[4] = a4;
    *((_BYTE *)v21 + a4 + 20) = 0;
    memcpy(v21 + 5, a3, a4);
    *v21 = v20;
    v21[2] = v19;
    v21[3] = 1;
    updated = nlp::updateCompletions((float *)v21, a9, a6, a7, a8);
    v23 = updated;
    v24 = v21[3] - 1;
    v21[3] = v24;
    if (v24)
    {
      if (updated)
        return nlp::rankSearchCursors((int)a1, a6);
    }
    else
    {
      free(v21);
      if (v23)
        return nlp::rankSearchCursors((int)a1, a6);
    }
    return 0;
  }
  v14 = a5;
  while (1)
  {
    v15 = *(_QWORD *)(a2 + 8 * a3[v14] + 12);
    if ((v15 & 3) != 1)
      break;
    a2 = v15 & 0xFFFFFFFFFFFFFFFCLL;
    if (a4 == (_DWORD)++v14)
      goto LABEL_5;
  }
  return (v15 & 3) != 2
      || nlp::rankSearchList((nlp *)(v15 & 0xFFFFFFFFFFFFFFFCLL), (char *)a3, a4, v14 + 1, a6, a7, a8, a9);
}

void nlp::BurstTrieRankedSearch(unint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, __CFBinaryHeap *a5, __CFBinaryHeap *a6)
{
  nlp::BurstTrieRankedSearchWithSelection(a1, 0, a2, a3, a4, a5, a6);
}

void nlp::BurstTrieContinueRankedSearch(nlp *a1, uint64_t a2, __CFBinaryHeap *a3, __CFBinaryHeap *a4)
{
  CFBinaryHeapRef v8;
  __CFBinaryHeap *v9;
  const void *Minimum;
  CFBinaryHeapCallBacks callBacks;

  if ((*((_BYTE *)a1 + 2064) & 1) != 0)
  {
    callBacks.retain = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRetain;
    callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRelease;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::trieCompletionInternalCompareScore;
    v8 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks, 0);
    if (v8)
    {
      v9 = v8;
      while (CFBinaryHeapGetCount(a3))
      {
        if (CFBinaryHeapGetCount(a4) >= (int)a2)
          break;
        nlp::rankSearchCursors(a1, a3, v9, a2, 0);
        while (CFBinaryHeapGetCount(v9))
        {
          Minimum = CFBinaryHeapGetMinimum(v9);
          CFBinaryHeapAddValue(a4, Minimum);
          CFBinaryHeapRemoveMinimumValue(v9);
        }
      }
      CFRelease(v9);
    }
  }
}

BOOL nlp::rankSearchCursors(nlp *a1, CFBinaryHeapRef heap, __CFBinaryHeap *a3, uint64_t a4, _QWORD *a5)
{
  CFIndex Count;
  unsigned int *Minimum;
  unsigned int *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x8_t *v15;
  unsigned __int8 *v16;
  char v17;
  unint64_t v18;
  size_t v19;
  unsigned int v20;
  _DWORD *v21;
  BOOL updated;
  int v23;
  int v24;

  while (1)
  {
    Count = CFBinaryHeapGetCount(heap);
    if (!Count)
      return Count == 0;
    Minimum = (unsigned int *)CFBinaryHeapGetMinimum(heap);
    v11 = Minimum;
    if (Minimum)
      ++Minimum[5];
    CFBinaryHeapRemoveMinimumValue(heap);
    v12 = *((_QWORD *)v11 + 1);
    v13 = v12 & 3;
    if ((v12 & 3) == 0)
    {
      v18 = v12 >> 2;
      v19 = v11[6];
      v20 = v11[4];
      v21 = malloc_type_malloc(v19 + 21, 0xF7573F27uLL);
      v21[4] = v19;
      *((_BYTE *)v21 + v19 + 20) = 0;
      memcpy(v21 + 5, v11 + 7, v19);
      *v21 = v20;
      v21[2] = v18;
      v21[3] = 1;
      updated = nlp::updateCompletions((float *)v21, a5, heap, a3, a4);
      v23 = v21[3] - 1;
      v21[3] = v23;
      if (!v23)
        free(v21);
      goto LABEL_18;
    }
    v14 = *((_QWORD *)a1 + 260);
    if (v14)
    {
      v15 = (int8x8_t *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + v14);
      v16 = (unsigned __int8 *)(v11 + 7);
      if (v13 == 3)
      {
        v17 = nlp::rankSearchCompactDiskLevel((uint64_t)a1, v15, v16, v11[6], v11[6], heap, a3, a4, a5);
      }
      else if (v13 == 1)
      {
        v17 = nlp::rankSearchDiskLevel(a1, v15, v16, v11[6], v11[6], heap);
      }
      else
      {
        v17 = nlp::rankSearchDiskPage(a1, (unsigned int *)v15, (char *)v16, v11[6], v11[6], heap, a3, a4, a5);
      }
    }
    else if (v13 == 2)
    {
      v17 = nlp::rankSearchList((nlp *)(v12 & 0xFFFFFFFFFFFFFFFCLL), (char *)v11 + 28, v11[6], v11[6], heap, a3, a4, a5);
    }
    else
    {
      if (v13 != 1)
      {
        updated = 1;
        goto LABEL_18;
      }
      v17 = nlp::rankSearchLevel(a1, v12 & 0xFFFFFFFFFFFFFFFCLL, (unsigned __int8 *)v11 + 28, v11[6], v11[6], heap, a3, a4, a5);
    }
    updated = v17;
LABEL_18:
    v24 = v11[5] - 1;
    v11[5] = v24;
    if (v24)
    {
      if (!updated)
        return Count == 0;
    }
    else
    {
      free(v11);
      if (!updated)
        return Count == 0;
    }
  }
}

uint64_t nlp::BurstTrieWriteToFileDescriptor(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  off_t v8;
  size_t v9;
  void *v10;
  int __buf[4];
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  result = 0;
  if ((a2 & 0x80000000) == 0 && !*(_QWORD *)(a1 + 2080))
  {
    v7 = sysconf(29);
    v8 = (v7 + lseek(a2, 0, 2) - 1) & -v7;
    *(_QWORD *)&__buf[1] = 12648430;
    __buf[3] = 0;
    v12 = *(_QWORD *)(a1 + 2060);
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v17 = 0;
    v13 = *(_DWORD *)(a1 + 2088);
    HIDWORD(v14) = 2;
    lseek(a2, v8, 0);
    write(a2, &__buf[1], 0x34uLL);
    if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
      nlp::serializeListsRanked(a1, a1, v8, a2);
    else
      nlp::serializeLists(a1, a1, v8, a2);
    __buf[0] = lseek(a2, 0, 1) - v8;
    pwrite(a2, __buf, 4uLL, v8 + 4);
    if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
      nlp::serializeLevelsRanked((_DWORD *)a1, v8, a2, 0, 1, __buf);
    else
      nlp::serializeLevels((_DWORD *)a1, v8, a2, 0, 1, __buf);
    pwrite(a2, __buf, 4uLL, v8 + 8);
    lseek(a2, __buf[0], 0);
    *(_DWORD *)(a1 + 2060) = 0;
    if ((*(_DWORD *)(a1 + 2064) & 1) != 0)
      v9 = 2060;
    else
      v9 = 2052;
    bzero((void *)a1, v9);
    v10 = mmap(0, __buf[0], 1, 1, a2, v8);
    if (v10 == (void *)-1)
    {
      return 0;
    }
    else
    {
      *(_QWORD *)(a1 + 2080) = v10;
      if (a3)
        *a3 = v8;
      return 1;
    }
  }
  return result;
}

uint64_t nlp::BurstTrieWriteToFile(uint64_t a1, CFStringRef theString)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v8;
  CFIndex usedBufLen;
  UInt8 buffer[1024];
  uint64_t v11;
  CFRange v12;

  v11 = *MEMORY[0x24BDAC8D0];
  usedBufLen = 0;
  v12.length = CFStringGetLength(theString);
  v12.location = 0;
  CFStringGetBytes(theString, v12, 0x8000100u, 0x2Du, 0, buffer, 1024, &usedBufLen);
  buffer[usedBufLen] = 0;
  v4 = open((const char *)buffer, 1538, 384);
  if ((v4 & 0x80000000) != 0)
    return 0;
  v5 = v4;
  v8 = -1;
  v6 = nlp::BurstTrieWriteToFileDescriptor(a1, v4, &v8);
  close(v5);
  return v6;
}

void nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  for (i = 0; i != 256; ++i)
  {
    v3 = a1 + 8 * i;
    v6 = *(_QWORD *)(v3 + 12);
    v5 = (_QWORD *)(v3 + 12);
    v4 = v6;
    v7 = v6 & 3;
    if (v7 == 2)
    {
      v8 = (_QWORD *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        v9 = (_QWORD *)*v8;
        free(v8);
        v8 = v9;
      }
      while (v9);
    }
    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }
}

void nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  for (i = 0; i != 256; ++i)
  {
    v3 = a1 + 8 * i;
    v6 = *(_QWORD *)(v3 + 4);
    v5 = (_QWORD *)(v3 + 4);
    v4 = v6;
    v7 = v6 & 3;
    if (v7 == 2)
    {
      v8 = (_QWORD *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        v9 = (_QWORD *)*v8;
        free(v8);
        v8 = v9;
      }
      while (v9);
    }
    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }
}

uint64_t nlp::addListNode(uint64_t a1, _QWORD *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, int *a7)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  const void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  size_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  size_t v27;
  char *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v36;
  uint64_t v37;
  int *v38;

  v12 = a2;
  v13 = a1;
  v14 = (uint64_t *)*a2;
  v15 = malloc_type_calloc(8uLL, (*(_DWORD *)(a1 + 2088) + 1), 0x8E39A38EuLL);
  v16 = (const void *)(a3 + a5);
  if (v14)
  {
    v36 = v12;
    v37 = v13;
    v38 = a7;
    v17 = 0;
    v18 = 1;
LABEL_3:
    v19 = a6;
    v20 = 0;
    v21 = v17;
    v22 = &v15[v17];
    do
    {
      v23 = *((unsigned __int16 *)v14 + 6);
      if ((_DWORD)v23 + a5 == a4 && !memcmp(v16, (char *)v14 + 14, v23))
      {
        v18 = 0;
        a6 = v19;
        *((_DWORD *)v14 + 2) = v19;
        v17 = v21 + v20 + 1;
        v15[v21 + v20] = v14;
        v14 = (uint64_t *)*v14;
        if (v14)
          goto LABEL_3;
        v24 = (v21 + v20 + 1);
        v25 = 1;
        goto LABEL_15;
      }
      v22[v20] = v14;
      v14 = (uint64_t *)*v14;
      ++v20;
    }
    while (v14);
    v26 = v21 + v20;
    if ((v18 & 1) != 0)
    {
      v13 = v37;
      a7 = v38;
      LODWORD(a6) = v19;
      v12 = v36;
      goto LABEL_13;
    }
    v25 = 1;
    v24 = v26;
LABEL_15:
    v13 = v37;
    a7 = v38;
    v12 = v36;
  }
  else
  {
    LODWORD(v26) = 0;
LABEL_13:
    v27 = a4 - a5;
    v28 = (char *)malloc_type_calloc(1uLL, v27 + 15, 0xA9B8A391uLL);
    memcpy(v28 + 14, v16, v27);
    v28[v27 + 14] = 0;
    *((_WORD *)v28 + 6) = v27;
    *((_DWORD *)v28 + 2) = a6;
    v24 = (v26 + 1);
    v25 = 2;
    *(_QWORD *)v28 = 0;
    v15[v26] = v28;
  }
  qsort(v15, (int)v24, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare);
  v29 = (_QWORD *)*v15;
  v30 = (_QWORD *)*v15;
  if ((int)v24 >= 2)
  {
    v31 = v15 + 1;
    v32 = v24 - 1;
    v33 = (_QWORD *)*v15;
    do
    {
      v34 = (_QWORD *)*v31++;
      v30 = v34;
      *v33 = v34;
      v33 = v34;
      --v32;
    }
    while (v32);
  }
  *v30 = 0;
  *v12 = v29;
  free(v15);
  *a7 = v25;
  if (v24 > *(_DWORD *)(v13 + 2088))
    nlp::addListNode();
  return v24;
}

_DWORD *nlp::burstLevel(uint64_t a1, unsigned __int16 *a2, int *a3)
{
  _DWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unint64_t v19;

  v6 = malloc_type_calloc(1uLL, 0x804uLL, 0x10000406A7154B6uLL);
  if (a2)
  {
    do
    {
      v7 = a2[6];
      v8 = *((unsigned int *)a2 + 2);
      if (a2[6])
      {
        v9 = *(_QWORD *)&v6[2 * *((unsigned __int8 *)a2 + 14) + 1];
        if (v9)
        {
          v19 = v9 & 0xFFFFFFFFFFFFFFFCLL;
          v10 = nlp::addListNode(a1, &v19, (uint64_t)(a2 + 7), v7, 1u, v8, a3);
          v11 = v19;
          if (v10 >= *(_DWORD *)(a1 + 2088))
          {
            v11 = nlp::burstLevel(a1, v19, a3);
            v12 = 1;
          }
          else
          {
            v12 = 2;
          }
          v15 = v12 | v11;
          v16 = *((unsigned __int8 *)a2 + 14);
        }
        else
        {
          v13 = (v7 - 1);
          v14 = (unint64_t)malloc_type_calloc(1uLL, v13 + 15, 0xA9B8A391uLL);
          memcpy((void *)(v14 + 14), (char *)a2 + 15, v13);
          *(_BYTE *)(v14 + 14 + v13) = 0;
          *(_WORD *)(v14 + 12) = v13;
          *(_DWORD *)(v14 + 8) = v8;
          *(_QWORD *)v14 = 0;
          v15 = v14 | 2;
          v16 = *((unsigned __int8 *)a2 + 14);
        }
        *(_QWORD *)&v6[2 * v16 + 1] = v15;
      }
      else
      {
        *v6 = v8;
      }
      v17 = *(unsigned __int16 **)a2;
      free(a2);
      a2 = v17;
    }
    while (v17);
  }
  return v6;
}

uint64_t nlp::nodeStringCompare(nlp *this, _QWORD *a2, const void *a3)
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  size_t v10;
  uint64_t result;

  v3 = *(_QWORD *)this;
  v4 = *a2;
  v5 = (const void *)(*(_QWORD *)this + 14);
  v6 = (const void *)(*a2 + 14);
  v7 = *(unsigned __int16 *)(v3 + 12);
  v8 = *(unsigned __int16 *)(v4 + 12);
  v9 = v7 - v8;
  if ((int)v7 >= (int)v8)
    v10 = v8;
  else
    v10 = v7;
  LODWORD(result) = memcmp(v5, v6, v10);
  if ((_DWORD)result)
    return result;
  else
    return v9;
}

uint64_t nlp::addListNodeRanked(uint64_t a1, uint64_t **a2, uint64_t a3, int a4, unsigned int a5, int a6, float *a7, int *a8, float a9, uint64_t a10, uint64_t a11)
{
  uint64_t *v17;
  uint64_t *v18;
  const void *v19;
  uint64_t v20;
  int v21;
  float v22;
  uint64_t v23;
  size_t v24;
  float v25;
  float v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  char *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  _QWORD *v36;
  uint64_t v37;

  v17 = *a2;
  v18 = (uint64_t *)malloc_type_calloc(8uLL, (*(_DWORD *)(a1 + 2088) + 1), 0x861081D6uLL);
  v19 = (const void *)(a3 + a5);
  if (v17)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0.0;
    do
    {
      v23 = v20;
      v24 = *((unsigned __int16 *)v17 + 10);
      if ((_DWORD)v24 + a5 == a4 && !memcmp(v19, (char *)v17 + 22, v24))
      {
        *((_DWORD *)v17 + 4) = a6;
        v25 = *((float *)v17 + 3);
        if (*(_QWORD *)(a11 + 24))
          std::function<float ()(void *,float,float)>::operator()(a11, a10, v25, a9);
        else
          v26 = v25 + a9;
        *((float *)v17 + 3) = v26;
        v21 = 1;
      }
      if (*((float *)v17 + 2) > v22)
        v22 = *((float *)v17 + 2);
      ++v20;
      v18[v23] = (uint64_t)v17;
      v17 = (uint64_t *)*v17;
    }
    while (v17);
    if (v21)
    {
      v27 = 1;
      v28 = v23 + 1;
      v29 = a1;
      goto LABEL_18;
    }
  }
  else
  {
    LODWORD(v20) = 0;
    v22 = 0.0;
  }
  v29 = a1;
  if (v22 < a9)
    v22 = a9;
  v30 = a4 - a5;
  v31 = (char *)malloc_type_calloc(1uLL, v30 + 23, 0x55E7E753uLL);
  memcpy(v31 + 22, v19, v30);
  v31[v30 + 22] = 0;
  *((_WORD *)v31 + 10) = v30;
  *((_DWORD *)v31 + 4) = a6;
  *((float *)v31 + 2) = v22;
  *((float *)v31 + 3) = a9;
  v28 = (v20 + 1);
  v27 = 2;
  *(_QWORD *)v31 = 0;
  v18[v20] = (uint64_t)v31;
LABEL_18:
  qsort(v18, (int)v28, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeScoreCompare);
  v32 = (_QWORD *)*v18;
  *a7 = v22;
  v33 = v32;
  if ((int)v28 >= 2)
  {
    v34 = (v28 - 1);
    v35 = v18 + 1;
    v36 = v32;
    do
    {
      v37 = *v35++;
      v33 = (_QWORD *)v37;
      *v36 = v37;
      *(float *)(v37 + 8) = *a7;
      v36 = (_QWORD *)v37;
      --v34;
    }
    while (v34);
  }
  *v33 = 0;
  *a2 = v32;
  free(v18);
  *a8 = v27;
  if (v28 > *(_DWORD *)(v29 + 2088))
    nlp::addListNodeRanked();
  return v28;
}

float *nlp::burstLevelRanked(uint64_t a1, unsigned __int16 *a2, float *a3, int *a4)
{
  float *v8;
  int v9;
  int v10;
  float v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  size_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  float v24;
  unsigned __int16 *v25;
  float v26;
  float v28;
  uint64_t *v29;
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = (float *)malloc_type_calloc(1uLL, 0x80CuLL, 0x10000408B9410F9uLL);
  *a3 = 0.0;
  if (!a2)
  {
    v26 = 0.0;
    goto LABEL_26;
  }
  do
  {
    v28 = 0.0;
    v9 = a2[10];
    v10 = *((_DWORD *)a2 + 4);
    v11 = *((float *)a2 + 3);
    v31 = 0;
    if (!v9)
    {
      v8[1] = v11;
      *((_DWORD *)v8 + 2) = v10;
      v28 = v11;
      goto LABEL_16;
    }
    v12 = *(_QWORD *)&v8[2 * *((unsigned __int8 *)a2 + 22) + 3];
    if (v12)
    {
      v29 = (uint64_t *)(v12 & 0xFFFFFFFFFFFFFFFCLL);
      v33 = 0;
      v13 = nlp::addListNodeRanked(a1, &v29, (uint64_t)(a2 + 11), v9, 1u, v10, &v28, a4, v11, 0, (uint64_t)v32);
      v14 = v33;
      if (v33 == v32)
      {
        v14 = v32;
        v15 = 4;
      }
      else
      {
        if (!v33)
        {
LABEL_11:
          v20 = (uint64_t)v29;
          if (v13 >= *(_DWORD *)(a1 + 2088))
          {
            v20 = nlp::burstLevelRanked(a1, v29, &v28, a4);
            v21 = 1;
          }
          else
          {
            v21 = 2;
          }
          v18 = v21 | v20;
          v19 = *((unsigned __int8 *)a2 + 22);
          goto LABEL_15;
        }
        v15 = 5;
      }
      (*(void (**)(void))(*v14 + 8 * v15))();
      goto LABEL_11;
    }
    v16 = (v9 - 1);
    v17 = (unint64_t)malloc_type_calloc(1uLL, v16 + 23, 0x55E7E753uLL);
    memcpy((void *)(v17 + 22), (char *)a2 + 23, v16);
    *(_BYTE *)(v17 + 22 + v16) = 0;
    *(_WORD *)(v17 + 20) = v16;
    *(_DWORD *)(v17 + 16) = v10;
    *(float *)(v17 + 8) = v11;
    *(float *)(v17 + 12) = v11;
    *(_QWORD *)v17 = 0;
    v28 = v11;
    v18 = v17 | 2;
    v19 = *((unsigned __int8 *)a2 + 22);
LABEL_15:
    *(_QWORD *)&v8[2 * v19 + 3] = v18;
LABEL_16:
    v22 = v31;
    if (v31 == v30)
    {
      v22 = v30;
      v23 = 4;
    }
    else
    {
      if (!v31)
        goto LABEL_21;
      v23 = 5;
    }
    (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_21:
    v24 = v28;
    if (v28 <= *a3)
      v24 = *a3;
    *a3 = v24;
    v25 = *(unsigned __int16 **)a2;
    free(a2);
    a2 = v25;
  }
  while (v25);
  v26 = *a3;
LABEL_26:
  *v8 = v26;
  return v8;
}

void sub_2084116E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,char *a21)
{
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;

  v22 = a21;
  if (a21 == &a18)
  {
    v23 = 4;
    v22 = &a18;
  }
  else
  {
    if (!a21)
      goto LABEL_6;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_6:
  v24 = a17;
  if (a17 == &a14)
  {
    v25 = 4;
    v24 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v25 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v24 + 8 * v25))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

uint64_t std::function<float ()(void *,float,float)>::operator()(uint64_t a1, uint64_t a2, float a3, float a4)
{
  uint64_t v4;
  float v6;
  float v7;
  uint64_t v8;

  v8 = a2;
  v6 = a4;
  v7 = a3;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, float *, float *))(*(_QWORD *)v4 + 48))(v4, &v8, &v7, &v6);
}

uint64_t nlp::nodeScoreCompare(nlp *this, const void *a2, const void *a3)
{
  float v3;
  float v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  v3 = *(float *)(*(_QWORD *)this + 12);
  v4 = *(float *)(*(_QWORD *)a2 + 12);
  if (v3 == v4)
  {
    v5 = *(_DWORD *)(*(_QWORD *)this + 16);
    v6 = *(_DWORD *)(*(_QWORD *)a2 + 16);
    v7 = v5 == v6;
    if (v5 > v6)
      v8 = -1;
    else
      v8 = 1;
    if (v7)
      return 0;
    else
      return v8;
  }
  else if ((float)(v3 - v4) <= 0.0)
  {
    return 1;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x20BD06848);
}

uint64_t nlp::searchDiskLevelRanked(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  int v21;
  _DWORD *v22;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v38;
  _BYTE v39[24];
  _BYTE *v40;
  _BYTE v41[24];
  _BYTE *v42;
  _BYTE v43[24];
  _BYTE *v44;
  _BYTE v45[24];
  _BYTE *v46;
  _BYTE v47[24];
  _BYTE *v48;
  _BYTE v49[24];
  _BYTE *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  if (a5 >= a4)
  {
    v20 = *(_DWORD *)(a2 + 1024);
    if (v20)
    {
      v21 = *(_DWORD *)(a2 + 1032);
      v22 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v22[4] = a4;
      *((_BYTE *)v22 + a4 + 20) = 0;
      memcpy(v22 + 5, a3, a4);
      v22[2] = v20;
      *v22 = v21;
      v22[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v22, 1, (uint64_t)&v38);
      if (v22[3]-- == 1)
        free(v22);
      if (v38)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v38 != 0;
    v25 = 0;
    v26 = (a4 + 1);
    while (1)
    {
      v27 = *(_DWORD *)(a2 + 4 * v25);
      a3[a5] = v25;
      v28 = v27 & 3;
      switch(v28)
      {
        case 3:
          v32 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v41, a8);
          v30 = nlp::searchCompactDiskLevelRanked(a1, (int8x8_t *)((v27 & 0xFFFFFFFC) + v32), a3, v26, a5 + 1, 0, a7, (uint64_t)v41);
          v38 = v30;
          v31 = v42;
          if (v42 == v41)
          {
            v31 = v41;
LABEL_26:
            v34 = 4;
            goto LABEL_27;
          }
          break;
        case 2:
          v33 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v39, a8);
          v30 = nlp::searchDiskPageRanked((unsigned int *)((v27 & 0xFFFFFFFC) + v33), a3, v26, a5 + 1, 0, a7, (uint64_t)v39);
          v38 = v30;
          v31 = v40;
          if (v40 == v39)
          {
            v31 = v39;
            goto LABEL_26;
          }
          break;
        case 1:
          v29 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v43, a8);
          v30 = nlp::searchDiskLevelRanked(a1, (v27 & 0xFFFFFFFC) + v29, a3, v26, a5 + 1, 0, a7, v43);
          v38 = v30;
          v31 = v44;
          if (v44 == v43)
          {
            v31 = v43;
            goto LABEL_26;
          }
          break;
        default:
          goto LABEL_28;
      }
      if (v31)
      {
        v34 = 5;
LABEL_27:
        (*(void (**)(_BYTE *))(*(_QWORD *)v31 + 8 * v34))(v31);
LABEL_28:
        v30 = v38;
      }
      if (v30)
        return 1;
      if (++v25 == 256)
        return v38 != 0;
    }
  }
  v15 = *(_DWORD *)(a2 + 4 * a3[a5]);
  v16 = v15 & 3;
  switch(v16)
  {
    case 3:
      v35 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v47, a8);
      v38 = nlp::searchCompactDiskLevelRanked(a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + v35), a3, a4, a5 + 1, a6, a7, (uint64_t)v47);
      v18 = v48;
      if (v48 == v47)
      {
        v19 = 4;
        v18 = v47;
        goto LABEL_38;
      }
      break;
    case 2:
      v36 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v45, a8);
      v38 = nlp::searchDiskPageRanked((unsigned int *)((v15 & 0xFFFFFFFC) + v36), a3, a4, a5 + 1, a6, a7, (uint64_t)v45);
      v18 = v46;
      if (v46 == v45)
      {
        v19 = 4;
        v18 = v45;
        goto LABEL_38;
      }
      break;
    case 1:
      v17 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v49, a8);
      v38 = nlp::searchDiskLevelRanked(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v49);
      v18 = v50;
      if (v50 == v49)
      {
        v19 = 4;
        v18 = v49;
LABEL_38:
        (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
        return v38 != 0;
      }
      break;
    default:
      return v38 != 0;
  }
  if (v18)
  {
    v19 = 5;
    goto LABEL_38;
  }
  return v38 != 0;
}

void sub_208411C1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;

  v31 = *(_QWORD **)(v28 + 56);
  if (v31 == v27)
  {
    v32 = 4;
    v31 = (_QWORD *)(v29 - 144);
  }
  else
  {
    if (!v31)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::containsKey(uint64_t result, _DWORD *a2, int a3, _BYTE *a4)
{
  char v5;

  if (result)
  {
    if (*(_DWORD *)result == 1)
    {
LABEL_5:
      *(_DWORD *)(result + 4) = a2[2];
      *(_DWORD *)(result + 8) = *a2;
LABEL_8:
      *a4 = 1;
      return result;
    }
    if (!*(_DWORD *)result)
    {
      if (!a3)
        return result;
      goto LABEL_5;
    }
    v5 = 0;
    if (*(_QWORD *)(result + 48))
    {
      result = std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(result + 24, *(_QWORD *)(result + 16), (uint64_t)a2, (uint64_t)&v5);
      if (v5)
        goto LABEL_8;
    }
  }
  return result;
}

uint64_t nlp::searchDiskLevel(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  _DWORD *v21;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE v44[24];
  _BYTE *v45;
  _BYTE v46[24];
  _BYTE *v47;
  _BYTE v48[24];
  _BYTE *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  if (a5 >= a4)
  {
    v20 = *(_DWORD *)(a2 + 1024);
    if (v20)
    {
      v21 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v21[4] = a4;
      *((_BYTE *)v21 + a4 + 20) = 0;
      memcpy(v21 + 5, a3, a4);
      v21[2] = v20;
      *v21 = 0;
      v21[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v21, 1, (uint64_t)&v37);
      if (v21[3]-- == 1)
        free(v21);
      if (v37)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v37 != 0;
    v24 = 0;
    v25 = (a4 + 1);
    while (1)
    {
      v26 = *(_DWORD *)(a2 + 4 * v24);
      a3[a5] = v24;
      v27 = v26 & 3;
      switch(v27)
      {
        case 3:
          v31 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v40, a8);
          v29 = nlp::searchCompactDiskLevel(a1, (int8x8_t *)((v26 & 0xFFFFFFFC) + v31), a3, v25, a5 + 1, 0, a7, (uint64_t)v40);
          v37 = v29;
          v30 = v41;
          if (v41 == v40)
          {
            v30 = v40;
LABEL_26:
            v33 = 4;
            goto LABEL_27;
          }
          break;
        case 2:
          v32 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v38, a8);
          v29 = nlp::searchDiskPage(a1, (unsigned int *)((v26 & 0xFFFFFFFC) + v32), (char *)a3, v25, a5 + 1, 0, a7, (uint64_t)v38);
          v37 = v29;
          v30 = v39;
          if (v39 == v38)
          {
            v30 = v38;
            goto LABEL_26;
          }
          break;
        case 1:
          v28 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v42, a8);
          v29 = nlp::searchDiskLevel(a1, (v26 & 0xFFFFFFFC) + v28, a3, v25, a5 + 1, 0, a7, v42);
          v37 = v29;
          v30 = v43;
          if (v43 == v42)
          {
            v30 = v42;
            goto LABEL_26;
          }
          break;
        default:
          goto LABEL_28;
      }
      if (v30)
      {
        v33 = 5;
LABEL_27:
        (*(void (**)(void))(*(_QWORD *)v30 + 8 * v33))();
LABEL_28:
        v29 = v37;
      }
      if (v29)
        return 1;
      if (++v24 == 256)
        return v37 != 0;
    }
  }
  v15 = *(_DWORD *)(a2 + 4 * a3[a5]);
  v16 = v15 & 3;
  switch(v16)
  {
    case 3:
      v34 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v46, a8);
      v37 = nlp::searchCompactDiskLevel(a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + v34), a3, a4, a5 + 1, a6, a7, (uint64_t)v46);
      v18 = v47;
      if (v47 == v46)
      {
        v19 = 4;
        v18 = v46;
        goto LABEL_38;
      }
      break;
    case 2:
      v35 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v44, a8);
      v37 = nlp::searchDiskPage(a1, (unsigned int *)((v15 & 0xFFFFFFFC) + v35), (char *)a3, a4, a5 + 1, a6, a7, (uint64_t)v44);
      v18 = v45;
      if (v45 == v44)
      {
        v19 = 4;
        v18 = v44;
        goto LABEL_38;
      }
      break;
    case 1:
      v17 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v48, a8);
      v37 = nlp::searchDiskLevel(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v48);
      v18 = v49;
      if (v49 == v48)
      {
        v19 = 4;
        v18 = v48;
LABEL_38:
        (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
        return v37 != 0;
      }
      break;
    default:
      return v37 != 0;
  }
  if (v18)
  {
    v19 = 5;
    goto LABEL_38;
  }
  return v37 != 0;
}

void sub_208412160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;

  v31 = *(_QWORD **)(v28 + 56);
  if (v31 == v27)
  {
    v32 = 4;
    v31 = (_QWORD *)(v29 - 128);
  }
  else
  {
    if (!v31)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchLevelRanked(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  int v18;
  int v19;
  _DWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BYTE *v27;
  uint64_t v28;
  unsigned __int8 v30;
  _BYTE v31[24];
  _BYTE *v32;
  _BYTE v33[24];
  _BYTE *v34;
  _BYTE v35[24];
  _BYTE *v36;
  _BYTE v37[24];
  _BYTE *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  if (a4 >= a3)
  {
    v18 = *(_DWORD *)(a1 + 8);
    if (v18)
    {
      v19 = *(_DWORD *)(a1 + 4);
      v20 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v20[4] = a4;
      *((_BYTE *)v20 + a4 + 20) = 0;
      memcpy(v20 + 5, a2, a4);
      v20[2] = v18;
      *v20 = v19;
      v20[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v20, 1, (uint64_t)&v30);
      v21 = v20[3]-- == 1;
      if (v21)
        free(v20);
      v15 = v30 != 0;
      if (v30 || (a5 & 1) != 0)
        return v15;
    }
    else if ((a5 & 1) != 0)
    {
      return 0;
    }
    v22 = 0;
    v23 = (a3 + 1);
    v24 = a1 + 12;
    while (1)
    {
      v25 = *(_QWORD *)(v24 + 8 * v22);
      a2[a4] = v22;
      if ((v25 & 3) == 2)
        break;
      if ((v25 & 3) == 1)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v33, a7);
        v26 = nlp::searchLevelRanked(v25 & 0xFFFFFFFFFFFFFFFCLL, a2, v23, a4 + 1, 0, a6, v33);
        v30 = v26;
        v27 = v34;
        if (v34 == v33)
        {
          v27 = v33;
          goto LABEL_24;
        }
LABEL_21:
        if (!v27)
          goto LABEL_27;
        v28 = 5;
        goto LABEL_25;
      }
LABEL_26:
      v26 = v30;
LABEL_27:
      v15 = v26 != 0;
      if (!v26)
      {
        v21 = v22++ == 255;
        if (!v21)
          continue;
      }
      return v15;
    }
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v31, a7);
    v26 = nlp::searchListRanked(v25 & 0xFFFFFFFFFFFFFFFCLL, a2, v23, a4 + 1, 0, a6, (uint64_t)v31);
    v30 = v26;
    v27 = v32;
    if (v32 != v31)
      goto LABEL_21;
    v27 = v31;
LABEL_24:
    v28 = 4;
LABEL_25:
    (*(void (**)(_BYTE *))(*(_QWORD *)v27 + 8 * v28))(v27);
    goto LABEL_26;
  }
  v14 = *(_QWORD *)(a1 + 8 * a2[a4] + 12);
  if ((v14 & 3) != 2)
  {
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v37, a7);
      v15 = nlp::searchLevelRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v37);
      v16 = v38;
      if (v38 == v37)
      {
        v17 = 4;
        v16 = v37;
LABEL_35:
        (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
        return v15;
      }
      goto LABEL_32;
    }
    return 0;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v35, a7);
  v15 = nlp::searchListRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v35);
  v16 = v36;
  if (v36 == v35)
  {
    v17 = 4;
    v16 = v35;
    goto LABEL_35;
  }
LABEL_32:
  if (v16)
  {
    v17 = 5;
    goto LABEL_35;
  }
  return v15;
}

void sub_208412548(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  char *v26;
  char *v28;
  uint64_t v29;

  v28 = a22;
  if (a22 == v26)
  {
    v29 = 4;
    v28 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchLevel(int *a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  int v18;
  _DWORD *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  int v25;
  _BYTE *v26;
  uint64_t v27;
  unsigned __int8 v29;
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  _BYTE v34[24];
  _BYTE *v35;
  _BYTE v36[24];
  _BYTE *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  if (a4 >= a3)
  {
    v18 = *a1;
    if (*a1)
    {
      v19 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v19[4] = a4;
      *((_BYTE *)v19 + a4 + 20) = 0;
      memcpy(v19 + 5, a2, a4);
      v19[2] = v18;
      *v19 = 0;
      v19[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v19, 1, (uint64_t)&v29);
      v20 = v19[3]-- == 1;
      if (v20)
        free(v19);
      v15 = v29 != 0;
      if (v29 || (a5 & 1) != 0)
        return v15;
    }
    else if ((a5 & 1) != 0)
    {
      return 0;
    }
    v21 = 0;
    v22 = (a3 + 1);
    v23 = a1 + 1;
    while (1)
    {
      v24 = *(_QWORD *)&v23[2 * v21];
      a2[a4] = v21;
      if ((v24 & 3) == 2)
        break;
      if ((v24 & 3) == 1)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v32, a7);
        v25 = nlp::searchLevel(v24 & 0xFFFFFFFFFFFFFFFCLL, a2, v22, a4 + 1, 0, a6, v32);
        v29 = v25;
        v26 = v33;
        if (v33 == v32)
        {
          v26 = v32;
          goto LABEL_24;
        }
LABEL_21:
        if (!v26)
          goto LABEL_27;
        v27 = 5;
        goto LABEL_25;
      }
LABEL_26:
      v25 = v29;
LABEL_27:
      v15 = v25 != 0;
      if (!v25)
      {
        v20 = v21++ == 255;
        if (!v20)
          continue;
      }
      return v15;
    }
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v30, a7);
    v25 = nlp::searchList(v24 & 0xFFFFFFFFFFFFFFFCLL, a2, v22, a4 + 1, 0, a6, (uint64_t)v30);
    v29 = v25;
    v26 = v31;
    if (v31 != v30)
      goto LABEL_21;
    v26 = v30;
LABEL_24:
    v27 = 4;
LABEL_25:
    (*(void (**)(_BYTE *))(*(_QWORD *)v26 + 8 * v27))(v26);
    goto LABEL_26;
  }
  v14 = *(_QWORD *)&a1[2 * a2[a4] + 1];
  if ((v14 & 3) != 2)
  {
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v36, a7);
      v15 = nlp::searchLevel(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v36);
      v16 = v37;
      if (v37 == v36)
      {
        v17 = 4;
        v16 = v36;
LABEL_35:
        (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
        return v15;
      }
      goto LABEL_32;
    }
    return 0;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v34, a7);
  v15 = nlp::searchList(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v34);
  v16 = v35;
  if (v35 == v34)
  {
    v17 = 4;
    v16 = v34;
    goto LABEL_35;
  }
LABEL_32:
  if (v16)
  {
    v17 = 5;
    goto LABEL_35;
  }
  return v15;
}

void sub_2084128E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char *a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  char *v25;
  char *v27;
  uint64_t v28;

  v27 = a21;
  if (a21 == v25)
  {
    v28 = 4;
    v27 = &a18;
  }
  else
  {
    if (!a21)
      goto LABEL_6;
    v28 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v27 + 8 * v28))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchCompactDiskLevelRanked(uint64_t a1, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  int v19;
  __int32 v20;
  __int32 v21;
  _DWORD *v22;
  unint64_t v25;
  uint64_t v26;
  int8x8_t v27;
  int v28;
  int8x8_t *v29;
  int8x8_t v30;
  uint8x8_t v31;
  uint8x8_t v32;
  __int32 v33;
  int v34;
  uint64_t v35;
  int v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int8x8_t *v41;
  int8x8_t v42;
  uint8x8_t v43;
  uint8x8_t v44;
  __int32 v45;
  int v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned __int8 v54;
  _BYTE v55[24];
  _BYTE *v56;
  _BYTE v57[24];
  _BYTE *v58;
  _BYTE v59[24];
  _BYTE *v60;
  _BYTE v61[24];
  _BYTE *v62;
  _BYTE v63[24];
  _BYTE *v64;
  _BYTE v65[24];
  _BYTE *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  if (a5 >= a4)
  {
    v20 = a2[5].i32[0];
    if (v20)
    {
      v21 = a2[4].i32[1];
      v22 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v22[4] = a4;
      *((_BYTE *)v22 + a4 + 20) = 0;
      memcpy(v22 + 5, a3, a4);
      v22[2] = v20;
      *v22 = v21;
      v22[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v22, 1, (uint64_t)&v54);
      if (v22[3]-- == 1)
        free(v22);
      if (v54)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v54 != 0;
    v25 = 0;
    v52 = a4 + 1;
    while (1)
    {
      if (v25 >> 6 <= 1)
        v26 = 1;
      else
        v26 = v25 >> 6;
      v27 = a2[v25 >> 6];
      if ((*(_QWORD *)&v27 & (1 << v25)) == 0)
        goto LABEL_34;
      if (v25 >= 0x40)
      {
        v28 = 0;
        v29 = a2;
        do
        {
          v30 = *v29++;
          v31 = (uint8x8_t)vcnt_s8(v30);
          v31.i16[0] = vaddlv_u8(v31);
          v28 += v31.i32[0];
          --v26;
        }
        while (v26);
      }
      else
      {
        v28 = 0;
      }
      v32 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v27 & ((1 << v25) - 1)));
      v32.i16[0] = vaddlv_u8(v32);
      v33 = a2[5].i32[v28 + v32.i32[0] + 1];
      a3[a5] = v25;
      v34 = v33 & 3;
      switch(v34)
      {
        case 1:
          v38 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v59, a8);
          v36 = nlp::searchDiskLevelRanked(a1, v38 + (v33 & 0xFFFFFFFC), a3, v52, a5 + 1, 0, a7, v59);
          v54 = v36;
          v37 = v60;
          if (v60 == v59)
          {
            v37 = v59;
LABEL_32:
            v40 = 4;
            goto LABEL_33;
          }
          break;
        case 2:
          v39 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v55, a8);
          v36 = nlp::searchDiskPageRanked((unsigned int *)(v39 + (v33 & 0xFFFFFFFC)), a3, v52, a5 + 1, 0, a7, (uint64_t)v55);
          v54 = v36;
          v37 = v56;
          if (v56 == v55)
          {
            v37 = v55;
            goto LABEL_32;
          }
          break;
        case 3:
          v35 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v57, a8);
          v36 = nlp::searchCompactDiskLevelRanked(a1, v35 + (v33 & 0xFFFFFFFC), a3, v52, a5 + 1, 0, a7, v57);
          v54 = v36;
          v37 = v58;
          if (v58 == v57)
          {
            v37 = v57;
            goto LABEL_32;
          }
          break;
        default:
          goto LABEL_34;
      }
      if (v37)
      {
        v40 = 5;
LABEL_33:
        (*(void (**)(_BYTE *))(*(_QWORD *)v37 + 8 * v40))(v37);
LABEL_34:
        v36 = v54;
      }
      if (v36)
        return 1;
      if ((_DWORD)++v25 == 256)
        return v54 != 0;
    }
  }
  v15 = a3[a5];
  v16 = v15 >> 6;
  v17 = a2[v15 >> 6];
  v18 = 1 << v15;
  if (((1 << v15) & *(_QWORD *)&v17) != 0)
  {
    if (v15 >= 0x40)
    {
      v19 = 0;
      if (v16 <= 1)
        v16 = 1;
      else
        v16 = v16;
      v41 = a2;
      do
      {
        v42 = *v41++;
        v43 = (uint8x8_t)vcnt_s8(v42);
        v43.i16[0] = vaddlv_u8(v43);
        v19 += v43.i32[0];
        --v16;
      }
      while (v16);
    }
    else
    {
      v19 = 0;
    }
    v44 = (uint8x8_t)vcnt_s8((int8x8_t)((v18 - 1) & *(_QWORD *)&v17));
    v44.i16[0] = vaddlv_u8(v44);
    v45 = a2[5].i32[v19 + v44.i32[0] + 1];
    v46 = v45 & 3;
    switch(v46)
    {
      case 1:
        v50 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v65, a8);
        v54 = nlp::searchDiskLevelRanked(a1, (v45 & 0xFFFFFFFC) + v50, a3, a4, a5 + 1, a6, a7, v65);
        v48 = v66;
        if (v66 == v65)
        {
          v49 = 4;
          v48 = v65;
          goto LABEL_54;
        }
        break;
      case 2:
        v51 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, a8);
        v54 = nlp::searchDiskPageRanked((unsigned int *)((v45 & 0xFFFFFFFC) + v51), a3, a4, a5 + 1, a6, a7, (uint64_t)v61);
        v48 = v62;
        if (v62 == v61)
        {
          v49 = 4;
          v48 = v61;
          goto LABEL_54;
        }
        break;
      case 3:
        v47 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v63, a8);
        v54 = nlp::searchCompactDiskLevelRanked(a1, (v45 & 0xFFFFFFFC) + v47, a3, a4, a5 + 1, a6, a7, v63);
        v48 = v64;
        if (v64 == v63)
        {
          v49 = 4;
          v48 = v63;
LABEL_54:
          (*(void (**)(void))(*(_QWORD *)v48 + 8 * v49))();
          return v54 != 0;
        }
        break;
      default:
        return v54 != 0;
    }
    if (v48)
    {
      v49 = 5;
      goto LABEL_54;
    }
  }
  return v54 != 0;
}

void sub_208412E54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  char *v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;

  v32 = *(char **)(v30 + 24);
  if (v32 == v29)
  {
    v33 = 4;
    v32 = &a29;
  }
  else
  {
    if (!v32)
      goto LABEL_6;
    v33 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchDiskPageRanked(unsigned int *a1, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v11;
  char *v12;
  int v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char v18;
  size_t v19;
  size_t v20;
  size_t v21;
  int v22;
  int v23;
  _DWORD *v24;
  int v25;
  char *__dst;
  size_t v28;
  char *v29;
  size_t __n;
  char v37;

  v37 = 0;
  v7 = *a1;
  if (!*a1)
    return 0;
  v8 = a4;
  v9 = a3;
  v11 = 0;
  v12 = &a2[a4];
  v13 = a3 - a4;
  __n = (int)(a3 - a4);
  v29 = v12;
  __dst = &a2[a3];
  v28 = a3;
  while (1)
  {
    v14 = (char *)a1 + v11;
    v15 = *((unsigned __int16 *)v14 + 8);
    if (v13 > (int)v15)
      goto LABEL_14;
    v16 = v14 + 8;
    v17 = v14 + 18;
    if (memcmp(v14 + 18, v12, __n))
      goto LABEL_14;
    v18 = a5;
    if (v13 == (_DWORD)v15)
      v18 = 0;
    if ((v18 & 1) != 0)
      goto LABEL_14;
    v19 = (v15 + v8);
    v20 = (v19 - v9);
    v21 = v28;
    if ((int)v20 >= 1)
    {
      memcpy(__dst, &v17[v15 - (int)v20], v20);
      v21 = v19;
      v9 = v19;
    }
    a2[v21] = 0;
    v22 = *((_DWORD *)v16 + 1);
    v23 = *(_DWORD *)v16;
    v24 = malloc_type_malloc(v21 + 21, 0xF7573F27uLL);
    v24[4] = v9;
    *((_BYTE *)v24 + v21 + 20) = 0;
    memcpy(v24 + 5, a2, v21);
    *v24 = v23;
    v24[2] = v22;
    v24[3] = 1;
    std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v24, v13 == (_DWORD)v15, (uint64_t)&v37);
    v25 = v24[3] - 1;
    v24[3] = v25;
    if (!v25)
      free(v24);
    v9 = a3;
    v8 = a4;
    v12 = v29;
    if (v37)
      return 1;
    LODWORD(v15) = *((unsigned __int16 *)v16 + 4);
LABEL_14:
    v11 += v15 + 10;
    if (v11 >= v7)
      return 0;
  }
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, char *, uint64_t *))(*(_QWORD *)v5 + 48))(v5, &v10, &v9, &v8, &v7);
}

uint64_t std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = a2;
  v6 = a4;
  v7 = a3;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *))(*(_QWORD *)v4 + 48))(v4, &v8, &v7, &v6);
}

void std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

_QWORD *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C09DA40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C09DA40;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3, unsigned __int8 *a4, _QWORD *a5)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 8))(*a2, *a3, *a4, *a5);
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target_type()
{
}

uint64_t nlp::searchCompactDiskLevel(uint64_t a1, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  int v19;
  __int32 v20;
  _DWORD *v21;
  unint64_t v24;
  uint64_t v25;
  int8x8_t v26;
  int v27;
  int8x8_t *v28;
  int8x8_t v29;
  uint8x8_t v30;
  uint8x8_t v31;
  __int32 v32;
  int v33;
  uint64_t v34;
  int v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int8x8_t *v40;
  int8x8_t v41;
  uint8x8_t v42;
  uint8x8_t v43;
  __int32 v44;
  int v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned __int8 v53;
  _BYTE v54[24];
  _BYTE *v55;
  _BYTE v56[24];
  _BYTE *v57;
  _BYTE v58[24];
  _BYTE *v59;
  _BYTE v60[24];
  _BYTE *v61;
  _BYTE v62[24];
  _BYTE *v63;
  _BYTE v64[24];
  _BYTE *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  if (a5 >= a4)
  {
    v20 = a2[4].i32[0];
    if (v20)
    {
      v21 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v21[4] = a4;
      *((_BYTE *)v21 + a4 + 20) = 0;
      memcpy(v21 + 5, a3, a4);
      v21[2] = v20;
      *v21 = 0;
      v21[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v21, 1, (uint64_t)&v53);
      if (v21[3]-- == 1)
        free(v21);
      if (v53)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v53 != 0;
    v24 = 0;
    v51 = a4 + 1;
    while (1)
    {
      if (v24 >> 6 <= 1)
        v25 = 1;
      else
        v25 = v24 >> 6;
      v26 = a2[v24 >> 6];
      if ((*(_QWORD *)&v26 & (1 << v24)) == 0)
        goto LABEL_34;
      if (v24 >= 0x40)
      {
        v27 = 0;
        v28 = a2;
        do
        {
          v29 = *v28++;
          v30 = (uint8x8_t)vcnt_s8(v29);
          v30.i16[0] = vaddlv_u8(v30);
          v27 += v30.i32[0];
          --v25;
        }
        while (v25);
      }
      else
      {
        v27 = 0;
      }
      v31 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v26 & ((1 << v24) - 1)));
      v31.i16[0] = vaddlv_u8(v31);
      v32 = a2[4].i32[v27 + v31.i32[0] + 1];
      a3[a5] = v24;
      v33 = v32 & 3;
      switch(v33)
      {
        case 1:
          v37 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v58, a8);
          v35 = nlp::searchDiskLevel(a1, v37 + (v32 & 0xFFFFFFFC), a3, v51, a5 + 1, 0, a7, v58);
          v53 = v35;
          v36 = v59;
          if (v59 == v58)
          {
            v36 = v58;
LABEL_32:
            v39 = 4;
            goto LABEL_33;
          }
          break;
        case 2:
          v38 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v54, a8);
          v35 = nlp::searchDiskPage(a1, (unsigned int *)(v38 + (v32 & 0xFFFFFFFC)), (char *)a3, v51, a5 + 1, 0, a7, (uint64_t)v54);
          v53 = v35;
          v36 = v55;
          if (v55 == v54)
          {
            v36 = v54;
            goto LABEL_32;
          }
          break;
        case 3:
          v34 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v56, a8);
          v35 = nlp::searchCompactDiskLevel(a1, v34 + (v32 & 0xFFFFFFFC), a3, v51, a5 + 1, 0, a7, v56);
          v53 = v35;
          v36 = v57;
          if (v57 == v56)
          {
            v36 = v56;
            goto LABEL_32;
          }
          break;
        default:
          goto LABEL_34;
      }
      if (v36)
      {
        v39 = 5;
LABEL_33:
        (*(void (**)(void))(*(_QWORD *)v36 + 8 * v39))();
LABEL_34:
        v35 = v53;
      }
      if (v35)
        return 1;
      if ((_DWORD)++v24 == 256)
        return v53 != 0;
    }
  }
  v15 = a3[a5];
  v16 = v15 >> 6;
  v17 = a2[v15 >> 6];
  v18 = 1 << v15;
  if (((1 << v15) & *(_QWORD *)&v17) != 0)
  {
    if (v15 >= 0x40)
    {
      v19 = 0;
      if (v16 <= 1)
        v16 = 1;
      else
        v16 = v16;
      v40 = a2;
      do
      {
        v41 = *v40++;
        v42 = (uint8x8_t)vcnt_s8(v41);
        v42.i16[0] = vaddlv_u8(v42);
        v19 += v42.i32[0];
        --v16;
      }
      while (v16);
    }
    else
    {
      v19 = 0;
    }
    v43 = (uint8x8_t)vcnt_s8((int8x8_t)((v18 - 1) & *(_QWORD *)&v17));
    v43.i16[0] = vaddlv_u8(v43);
    v44 = a2[4].i32[v19 + v43.i32[0] + 1];
    v45 = v44 & 3;
    switch(v45)
    {
      case 1:
        v49 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v64, a8);
        v53 = nlp::searchDiskLevel(a1, (v44 & 0xFFFFFFFC) + v49, a3, a4, a5 + 1, a6, a7, v64);
        v47 = v65;
        if (v65 == v64)
        {
          v48 = 4;
          v47 = v64;
          goto LABEL_54;
        }
        break;
      case 2:
        v50 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
        v53 = nlp::searchDiskPage(a1, (unsigned int *)((v44 & 0xFFFFFFFC) + v50), (char *)a3, a4, a5 + 1, a6, a7, (uint64_t)v60);
        v47 = v61;
        if (v61 == v60)
        {
          v48 = 4;
          v47 = v60;
          goto LABEL_54;
        }
        break;
      case 3:
        v46 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v62, a8);
        v53 = nlp::searchCompactDiskLevel(a1, (v44 & 0xFFFFFFFC) + v46, a3, a4, a5 + 1, a6, a7, v62);
        v47 = v63;
        if (v63 == v62)
        {
          v48 = 4;
          v47 = v62;
LABEL_54:
          (*(void (**)(void))(*(_QWORD *)v47 + 8 * v48))();
          return v53 != 0;
        }
        break;
      default:
        return v53 != 0;
    }
    if (v47)
    {
      v48 = 5;
      goto LABEL_54;
    }
  }
  return v53 != 0;
}

void sub_208413770(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  char *v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;

  v32 = *(char **)(v30 + 24);
  if (v32 == v29)
  {
    v33 = 4;
    v32 = &a29;
  }
  else
  {
    if (!v32)
      goto LABEL_6;
    v33 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchDiskPage(uint64_t a1, unsigned int *a2, char *a3, unsigned int a4, int a5, char a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned int v9;
  int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char v20;
  size_t v21;
  int v22;
  size_t v23;
  size_t v24;
  int v25;
  _DWORD *v26;
  int v27;
  char *v28;
  unsigned int v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;
  size_t v37;
  char v38;
  unsigned int v39;
  unsigned int v40;
  size_t v41;
  int v42;
  int v43;
  _BYTE *v44;
  int v45;
  _DWORD *v46;
  int v47;
  char *__dst;
  size_t v50;
  char *v51;
  int v52;
  char *v53;
  char v54;
  char *__s2a;
  char v64;
  _OWORD __s1[16];
  uint64_t v66;

  v8 = a5;
  v9 = a4;
  v66 = *MEMORY[0x24BDAC8D0];
  v64 = 0;
  v11 = a4 - a5;
  v12 = *a2;
  if ((*(_BYTE *)(a1 + 2064) & 4) != 0)
  {
    memset(__s1, 0, sizeof(__s1));
    if (v12)
    {
      v28 = 0;
      v29 = 0;
      v52 = a5 - a4;
      __s2a = &a3[a5];
      v51 = &a3[a4];
      do
      {
        v30 = (char *)a2 + v29;
        v31 = v30[10];
        if (v28)
        {
          v32 = v28[6];
          if (v31 > v32)
            memcpy((char *)__s1 + v32, v28 + 7, v31 - v32);
        }
        v28 = v30 + 4;
        v33 = *((unsigned __int16 *)v30 + 4);
        v34 = v33 + v31;
        if ((int)(v33 + v31) >= v11)
        {
          if (v9 == v8 || ((int)v31 >= v11 ? (v35 = v11) : (v35 = v31), !memcmp(__s1, __s2a, v35)))
          {
            v36 = v11 - v31;
            if (v11 - (int)v31 < 0
              || ((int)v33 >= (int)v36 ? (v37 = v36) : (v37 = v33), !memcmp(v28 + 7, &__s2a[v31], v37)))
            {
              v38 = a6;
              if (v11 == v34)
                v38 = 0;
              if ((v38 & 1) == 0)
              {
                v39 = v9;
                v40 = v31 + v8;
                v41 = (_DWORD)v31 + v8 - v39;
                if ((int)v41 < 1)
                {
                  v40 = v39;
                }
                else
                {
                  memcpy(v51, (char *)__s1 + v31 - (int)v41, v41);
                  v33 = *((unsigned __int16 *)v28 + 2);
                  LODWORD(v31) = v28[6];
                }
                v42 = v52 + v33 + v31;
                if (v42 < 1)
                {
                  v44 = a3;
                }
                else
                {
                  v43 = v42 - (v41 & ~((int)v41 >> 31));
                  v44 = a3;
                  memcpy(&a3[v40], &v28[v33 - v43 + 7], v43);
                  v40 += v43;
                }
                v54 = v11 == v34;
                v44[v40] = 0;
                v45 = *(_DWORD *)v28;
                v46 = malloc_type_malloc(v40 + 21, 0xF7573F27uLL);
                v46[4] = v40;
                *((_BYTE *)v46 + v40 + 20) = 0;
                memcpy(v46 + 5, v44, v40);
                *v46 = 0;
                v46[2] = v45;
                v46[3] = 1;
                std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v46, v54, (uint64_t)&v64);
                v47 = v46[3] - 1;
                v46[3] = v47;
                if (!v47)
                  free(v46);
                v9 = a4;
                if (v64)
                  return 1;
                v33 = *((unsigned __int16 *)v28 + 2);
                v8 = a5;
              }
            }
          }
        }
        v29 += v33 + 7;
      }
      while (v29 < v12);
    }
  }
  else if (v12)
  {
    v13 = 0;
    v14 = &a3[a5];
    v15 = v11;
    __dst = &a3[a4];
    v50 = a4;
    v53 = v14;
    do
    {
      v16 = (char *)a2 + v13;
      v17 = *((unsigned __int16 *)v16 + 4);
      if (v11 <= (int)v17)
      {
        v18 = v16 + 4;
        v19 = v16 + 10;
        if (!memcmp(v16 + 10, v14, v15))
        {
          v20 = a6;
          if (v11 == (_DWORD)v17)
            v20 = 0;
          if ((v20 & 1) == 0)
          {
            v21 = (v17 + v8);
            v22 = a4;
            v23 = v21 - a4;
            v24 = v50;
            if ((int)v23 >= 1)
            {
              memcpy(__dst, &v19[v17 - (int)v23], v23);
              v24 = v21;
              v22 = v21;
            }
            a3[v24] = 0;
            v25 = *(_DWORD *)v18;
            v26 = malloc_type_malloc(v24 + 21, 0xF7573F27uLL);
            v26[4] = v22;
            *((_BYTE *)v26 + v24 + 20) = 0;
            memcpy(v26 + 5, a3, v24);
            *v26 = 0;
            v26[2] = v25;
            v26[3] = 1;
            std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v26, v11 == (_DWORD)v17, (uint64_t)&v64);
            v27 = v26[3] - 1;
            v26[3] = v27;
            if (!v27)
              free(v26);
            v8 = a5;
            v15 = v11;
            v14 = v53;
            if (v64)
              return 1;
            LODWORD(v17) = *((unsigned __int16 *)v18 + 2);
          }
        }
      }
      v13 += v17 + 6;
    }
    while (v13 < v12);
  }
  return 0;
}

uint64_t nlp::searchListRanked(uint64_t result, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v10;
  char *v11;
  size_t v12;
  char v13;
  uint64_t v14;
  char v15;
  size_t v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  int v21;
  _DWORD *v22;
  int v23;
  char *__dst;
  size_t v26;
  char v30;

  v30 = 0;
  if (result)
  {
    v7 = a4;
    v10 = result;
    v11 = &a2[a4];
    v12 = (int)(a3 - a4);
    v26 = a3;
    v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      v14 = *(unsigned __int16 *)(v10 + 20);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 22), v11, v12))
      {
        v15 = (_DWORD)v12 == (_DWORD)v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          v16 = (v14 + v7);
          v17 = v16 - a3;
          v18 = v26;
          v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 22 + v14 - (int)v17), v17);
            v18 = v16;
            v19 = v16;
          }
          a2[v18] = 0;
          v20 = *(_DWORD *)(v10 + 16);
          v21 = *(_DWORD *)(v10 + 12);
          v22 = malloc_type_malloc(v18 + 21, 0xF7573F27uLL);
          v22[4] = v19;
          *((_BYTE *)v22 + v18 + 20) = 0;
          memcpy(v22 + 5, a2, v18);
          *v22 = v21;
          v22[2] = v20;
          v22[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v22, (_DWORD)v12 == (_DWORD)v14, (uint64_t)&v30);
          v23 = v22[3] - 1;
          v22[3] = v23;
          if (!v23)
            free(v22);
          v7 = a4;
          v13 = a5;
          if (v30)
            break;
        }
      }
      v10 = *(_QWORD *)v10;
      if (!v10)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t nlp::searchList(uint64_t result, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v10;
  char *v11;
  size_t v12;
  char v13;
  uint64_t v14;
  char v15;
  size_t v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  _DWORD *v21;
  int v22;
  char *__dst;
  size_t v25;
  char v29;

  v29 = 0;
  if (result)
  {
    v7 = a4;
    v10 = result;
    v11 = &a2[a4];
    v12 = (int)(a3 - a4);
    v25 = a3;
    v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      v14 = *(unsigned __int16 *)(v10 + 12);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 14), v11, v12))
      {
        v15 = (_DWORD)v12 == (_DWORD)v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          v16 = (v14 + v7);
          v17 = v16 - a3;
          v18 = v25;
          v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 14 + v14 - (int)v17), v17);
            v18 = v16;
            v19 = v16;
          }
          a2[v18] = 0;
          v20 = *(_DWORD *)(v10 + 8);
          v21 = malloc_type_malloc(v18 + 21, 0xF7573F27uLL);
          v21[4] = v19;
          *((_BYTE *)v21 + v18 + 20) = 0;
          memcpy(v21 + 5, a2, v18);
          *v21 = 0;
          v21[2] = v20;
          v21[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v21, (_DWORD)v12 == (_DWORD)v14, (uint64_t)&v29);
          v22 = v21[3] - 1;
          v21[3] = v22;
          if (!v22)
            free(v21);
          v7 = a4;
          v13 = a5;
          if (v29)
            break;
        }
      }
      v10 = *(_QWORD *)v10;
      if (!v10)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t nlp::advanceCompactMapCursorMappedLevel(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  unint64_t v8;

  v8 = (*(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *(_QWORD *)(a1 + 2080);
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    if (!a4)
    {
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(v8 + 1024);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(v8 + 1032);
      return 1;
    }
LABEL_5:
    nlp::updateCompactMapCursorPointer(a1, (_QWORD *)a2, *(unsigned int *)(v8 + 4 * *a3));
    return nlp::advanceCompactMapCursor(a1, a2, a3 + 1, (a4 - 1));
  }
  if (a4)
    goto LABEL_5;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(v8 + 1024);
  return 1;
}

uint64_t nlp::updateCompactMapCursorPointer(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;

  if (*a2 != a3)
    return ((uint64_t (*)(void))((char *)&loc_208414018 + 4 * byte_2084198E8[a3 & 3]))();
  return result;
}

uint64_t nlp::advanceMapCursorTrieList(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;
  int v20;
  float v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  size_t v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  __n128 v30;
  double v31;
  int v32;
  int v34;
  _QWORD v35[2];
  size_t v36;
  int v37;
  __n128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 2064) & 1) == 0)
  {
    v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    v10 = *(unsigned int *)(a2 + 16);
    if (v10 > *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12))
      nlp::advanceMapCursorTrieList();
    if (!v9)
      return 0;
    v11 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    while (1)
    {
      v12 = *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12);
      if (v11 != v9)
      {
        v12 = *(unsigned __int16 *)(v11 + 12);
        if (v10 >= v12)
          goto LABEL_19;
        if ((_DWORD)v10)
        {
          v13 = (unsigned __int8 *)(v11 + 14);
          v14 = *(unsigned int *)(a2 + 16);
          v15 = (unsigned __int8 *)(v9 + 14);
          do
          {
            v17 = *v13++;
            v16 = v17;
            v18 = *v15++;
            if (v16 != v18)
              goto LABEL_19;
          }
          while (--v14);
        }
      }
      LODWORD(v19) = 0;
      v20 = *(_DWORD *)(a2 + 16);
      if (v10 < v12 && a4)
      {
        v19 = 0;
        do
        {
          if (*(unsigned __int8 *)(v11 + v10 + 14 + v19) != a3[v19])
            break;
          if (++v19 + v10 >= v12)
            break;
        }
        while (v19 < a4);
        v20 = v10 + v19;
      }
      if ((_DWORD)v19 == a4)
      {
        *(_QWORD *)(a2 + 8) = v11 | 2;
        if (v20 == v12)
        {
          *(_DWORD *)(a2 + 16) = v12;
          *(_DWORD *)(a2 + 20) = *(_DWORD *)(v11 + 8);
        }
        else
        {
          *(_QWORD *)(a2 + 16) = v10 + a4;
        }
        return 1;
      }
LABEL_19:
      v11 = *(_QWORD *)v11;
      if (!v11)
        return 0;
    }
  }
  v35[1] = v35;
  v35[0] = *(_QWORD *)a2;
  a5.n128_u64[0] = *(_QWORD *)(a2 + 16);
  v22 = *(float *)(a2 + 24);
  v38 = a5;
  MEMORY[0x24BDAC7A8]();
  v24 = (char *)v35 - v23;
  v26 = *(unsigned int *)(a2 + 16);
  memcpy((char *)v35 - v23, (const void *)(v25 + 22), v26);
  v27 = *(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL;
  if (v27)
  {
    v37 = 0;
    v28 = v26 + a4;
    v36 = a4;
    do
    {
      v29 = *(unsigned __int16 *)(v27 + 20);
      if (v28 <= v29 && !memcmp((const void *)(v27 + 22), v24, v26) && !memcmp((const void *)(v27 + 22 + v26), a3, v36))
      {
        if (v28 == v29)
        {
          *(_QWORD *)(a2 + 8) = v27 | 2;
          v34 = *(_DWORD *)(v27 + 16);
          *(_DWORD *)(a2 + 24) = *(_DWORD *)(v27 + 12);
          *(_DWORD *)(a2 + 16) = v28;
          *(_DWORD *)(a2 + 20) = v34;
          return 1;
        }
        v30 = v38;
        HIDWORD(v31) = 0;
        v32 = v37;
        if (!v37)
        {
          v8 = v27 | 2;
          v22 = 0.0;
        }
        v37 = 1;
        if (!v32)
        {
          LODWORD(v31) = v38.n128_u32[0] + a4;
          v30.n128_f64[0] = v31;
        }
        v38 = v30;
      }
      v27 = *(_QWORD *)v27;
    }
    while (v27);
  }
  else
  {
    v37 = 0;
  }
  *(_QWORD *)a2 = v35[0];
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)(a2 + 16) = v38.n128_u64[0];
  *(float *)(a2 + 24) = v22;
  return v37;
}

uint64_t nlp::updateMapCursorPointer(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int *v4;
  int v5;
  unint64_t v6;

  if (*(_QWORD *)(a2 + 8) != a3)
  {
    v3 = a3 & 3;
    if ((a3 & 3) != 0)
    {
      if (v3 == 2)
      {
        v6 = a3 & 0xFFFFFFFFFFFFFFFCLL;
        if ((*(_BYTE *)(result + 2064) & 1) == 0)
        {
          if (*(_WORD *)(v6 + 12))
            v5 = 0;
          else
            v5 = *(_DWORD *)(v6 + 8);
          goto LABEL_14;
        }
        *(_DWORD *)(a2 + 20) = *(_DWORD *)(v6 + 16);
        *(_DWORD *)(a2 + 24) = *(_DWORD *)(v6 + 12);
        *(_QWORD *)a2 = a3;
      }
      else if (v3 == 1)
      {
        v4 = (int *)(a3 & 0xFFFFFFFFFFFFFFFCLL);
        if ((*(_BYTE *)(result + 2064) & 1) == 0)
        {
          v5 = *v4;
LABEL_14:
          *(_DWORD *)(a2 + 20) = v5;
          goto LABEL_15;
        }
        *(_DWORD *)(a2 + 20) = v4[2];
        *(_DWORD *)(a2 + 24) = v4[1];
      }
    }
    else
    {
      *(_QWORD *)(a2 + 20) = 0;
    }
LABEL_15:
    *(_QWORD *)(a2 + 8) = a3;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t nlp::rankSearchCompactDiskLevel(uint64_t result, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, unsigned int a8, _QWORD *a9)
{
  unsigned int v10;
  nlp *v13;
  unint64_t v14;
  uint64_t v15;
  int8x8_t v16;
  uint64_t v17;
  int v18;
  int8x8_t *v19;
  int8x8_t v20;
  uint8x8_t v21;
  uint8x8_t v22;
  __int32 v23;
  int v24;
  _BYTE *v25;
  _BYTE *v26;
  unint64_t v27;
  uint64_t v28;
  int8x8_t v29;
  int v30;
  int8x8_t *v31;
  int8x8_t v32;
  uint8x8_t v33;
  uint8x8_t v34;
  uint64_t v35;
  __int32 v36;
  __int32 v37;
  _DWORD *v38;
  _BOOL4 updated;
  _BOOL4 v40;
  int v41;

  v10 = a4;
  v13 = (nlp *)result;
  if (a5 >= a4)
  {
LABEL_12:
    v25 = nlp::sharedBuffer((nlp *)result);
    if ((int)(v10 + 1) <= 1023)
    {
      v26 = v25;
      memcpy(v25, a3, v10);
      v27 = 0;
      v26[v10 + 1] = 0;
      do
      {
        if (v27 >> 6 <= 1)
          v28 = 1;
        else
          v28 = v27 >> 6;
        v29 = a2[v27 >> 6];
        if (((1 << v27) & *(_QWORD *)&v29) != 0)
        {
          if (v27 >= 0x40)
          {
            v30 = 0;
            v31 = a2;
            do
            {
              v32 = *v31++;
              v33 = (uint8x8_t)vcnt_s8(v32);
              v33.i16[0] = vaddlv_u8(v33);
              v30 += v33.i32[0];
              --v28;
            }
            while (v28);
          }
          else
          {
            v30 = 0;
          }
          v34 = (uint8x8_t)vcnt_s8((int8x8_t)(((1 << v27) - 1) & *(_QWORD *)&v29));
          v34.i16[0] = vaddlv_u8(v34);
          v35 = a2[5].u32[v30 + v34.i32[0] + 1];
          v26[v10] = v27;
          nlp::rankSearchGetCursor((uint64_t)v13, v35, v26, v10 + 1, a6);
        }
        ++v27;
      }
      while ((_DWORD)v27 != 256);
    }
    v36 = a2[5].i32[0];
    if (!v36)
      return nlp::rankSearchCursors((int)v13, a6);
    v37 = a2[4].i32[1];
    v38 = malloc_type_malloc(v10 + 21, 0xF7573F27uLL);
    v38[4] = v10;
    *((_BYTE *)v38 + v10 + 20) = 0;
    memcpy(v38 + 5, a3, v10);
    *v38 = v37;
    v38[2] = v36;
    v38[3] = 1;
    updated = nlp::updateCompletions((float *)v38, a9, a6, a7, a8);
    v40 = updated;
    v41 = v38[3] - 1;
    v38[3] = v41;
    if (v41)
    {
      if (updated)
        return nlp::rankSearchCursors((int)v13, a6);
    }
    else
    {
      free(v38);
      if (v40)
        return nlp::rankSearchCursors((int)v13, a6);
    }
    return 0;
  }
  while (1)
  {
    v14 = a3[a5];
    v15 = v14 >> 6;
    v16 = a2[v14 >> 6];
    result = 1;
    v17 = 1 << v14;
    if (((1 << v14) & *(_QWORD *)&v16) == 0)
      return result;
    if (v14 >= 0x40)
    {
      v18 = 0;
      if (v15 <= 1)
        v15 = 1;
      else
        v15 = v15;
      v19 = a2;
      do
      {
        v20 = *v19++;
        v21 = (uint8x8_t)vcnt_s8(v20);
        v21.i16[0] = vaddlv_u8(v21);
        v18 += v21.i32[0];
        --v15;
      }
      while (v15);
    }
    else
    {
      v18 = 0;
    }
    v22 = (uint8x8_t)vcnt_s8((int8x8_t)((v17 - 1) & *(_QWORD *)&v16));
    v22.i16[0] = vaddlv_u8(v22);
    v23 = a2[5].i32[v18 + v22.i32[0] + 1];
    v24 = v23 & 3;
    if (v24 != 3)
    {
      if (v24 == 1)
        return nlp::rankSearchDiskLevel(v13, (v23 & 0xFFFFFFFC) + *((_QWORD *)v13 + 260), a3, a4, a5 + 1, a6);
      if (v24 == 2)
        return nlp::rankSearchDiskPage(v13, (unsigned int *)((v23 & 0xFFFFFFFC) + *((_QWORD *)v13 + 260)), (char *)a3, a4, a5 + 1, a6, a7, a8, a9);
      return 1;
    }
    a2 = (int8x8_t *)((v23 & 0xFFFFFFFC) + *((_QWORD *)v13 + 260));
    if (++a5 == (_DWORD)a4)
      goto LABEL_12;
  }
}

BOOL nlp::rankSearchDiskPage(nlp *a1, unsigned int *a2, char *a3, unsigned int a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, unsigned int a8, _QWORD *a9)
{
  unsigned int v10;
  int v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  unsigned int v20;
  BOOL v21;
  uint64_t v22;
  char *v23;
  char *v24;
  size_t v25;
  int v26;
  int v27;
  int v28;
  _DWORD *v29;
  int v30;
  char *v31;
  unsigned int v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  size_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  _DWORD *v46;
  _BOOL4 updated;
  int v48;
  _BYTE *__dst;
  unsigned int v51;
  char *v52;
  unsigned int v53;
  unsigned int __s2;
  char *__s2a;
  _OWORD __s1[16];
  uint64_t v61;

  v10 = a4;
  v61 = *MEMORY[0x24BDAC8D0];
  v13 = a4 - a5;
  v14 = *a2;
  v15 = nlp::sharedBuffer(a1);
  v16 = v15;
  if ((*((_BYTE *)a1 + 2064) & 4) != 0)
  {
    if (v10 <= 0x3FF)
    {
      memcpy(v15, a3, v10);
      __dst = &v16[v10];
      *__dst = 0;
      memset(__s1, 0, sizeof(__s1));
      if ((_DWORD)v14)
      {
        v31 = 0;
        v32 = 0;
        v51 = a5 - v10;
        __s2a = &a3[a5];
        v53 = v10;
        while (1)
        {
          v33 = (char *)a2 + v32;
          v34 = v33[18];
          if (v31)
          {
            v35 = v31[10];
            if (v34 > v35)
              memcpy((char *)__s1 + v35, v31 + 11, v34 - v35);
          }
          v31 = v33 + 8;
          v36 = *((unsigned __int16 *)v33 + 8);
          if (v36 + (int)v34 >= v13)
          {
            if (v10 == a5 || ((int)v34 >= v13 ? (v37 = v13) : (v37 = v34), !memcmp(__s1, __s2a, v37)))
            {
              v38 = v13 - v34;
              if (v13 == (_DWORD)v34)
                goto LABEL_29;
              if (v36 < v38)
                v38 = v36;
              if (!memcmp(v33 + 19, &__s2a[v34], v38))
              {
LABEL_29:
                v39 = v10;
                v40 = v34 + a5;
                v41 = (_DWORD)v34 + a5 - v39;
                if ((int)v41 < 1)
                {
                  v40 = v39;
                }
                else
                {
                  memcpy(__dst, (char *)__s1 + v34 - (int)v41, v41);
                  v36 = *((unsigned __int16 *)v31 + 4);
                  LODWORD(v34) = v31[10];
                }
                v42 = v51 + v36 + v34;
                if (v42 >= 1)
                {
                  v43 = v42 - (v41 & ~((int)v41 >> 31));
                  memcpy(&v16[v40], &v31[v36 - v43 + 11], v43);
                  v40 += v43;
                }
                v16[v40] = 0;
                v44 = *((_DWORD *)v31 + 1);
                v45 = *(_DWORD *)v31;
                v46 = malloc_type_malloc(v40 + 21, 0xF7573F27uLL);
                v46[4] = v40;
                *((_BYTE *)v46 + v40 + 20) = 0;
                memcpy(v46 + 5, v16, v40);
                *v46 = v45;
                v46[2] = v44;
                v46[3] = 1;
                updated = nlp::updateCompletions((float *)v46, a9, a6, a7, a8);
                v48 = v46[3] - 1;
                v46[3] = v48;
                if (!v48)
                  free(v46);
                v10 = v53;
                if (!updated)
                  return 0;
                v36 = *((unsigned __int16 *)v31 + 4);
              }
            }
          }
          v32 += v36 + 11;
          if (v32 >= v14)
            return 1;
        }
      }
      return 1;
    }
    return 0;
  }
  if (a5 > 0x3FF)
    return 0;
  v17 = a5;
  memcpy(v15, a3, a5);
  v18 = &v16[a5];
  *v18 = 0;
  if (!(_DWORD)v14)
    return 1;
  __s2 = a5;
  v19 = v16;
  v20 = 0;
  v52 = &a3[v17];
  v21 = 1;
  do
  {
    v22 = v14;
    v23 = (char *)a2 + v20;
    v24 = v23 + 8;
    memcpy(v18, v23 + 18, *((unsigned __int16 *)v23 + 8));
    v25 = *((unsigned __int16 *)v23 + 8) + (unint64_t)__s2;
    v19[v25] = 0;
    if (v13 <= *((unsigned __int16 *)v23 + 8))
    {
      v26 = memcmp(v23 + 18, v52, v13);
      v14 = v22;
      if (!v26)
      {
        v27 = *((_DWORD *)v24 + 1);
        v28 = *(_DWORD *)v24;
        v29 = malloc_type_malloc(v25 + 21, 0xF7573F27uLL);
        v29[4] = v25;
        *((_BYTE *)v29 + v25 + 20) = 0;
        memcpy(v29 + 5, v19, v25);
        *v29 = v28;
        v29[2] = v27;
        v29[3] = 1;
        v21 = nlp::updateCompletions((float *)v29, a9, a6, a7, a8);
        v30 = v29[3] - 1;
        v29[3] = v30;
        if (!v30)
          free(v29);
      }
    }
    else
    {
      v14 = v22;
    }
    v20 += *((unsigned __int16 *)v24 + 4) + 10;
  }
  while (v20 < v14);
  return v21;
}

BOOL nlp::updateCompletions(float *value, _QWORD *a2, __CFBinaryHeap *a3, CFBinaryHeapRef heap, uint64_t a5)
{
  _BOOL8 v10;
  float *Minimum;
  float *v12;
  float v13;
  float v14;
  float v15;
  float *v16;
  float v17;
  float v18;
  uint64_t v19;
  const void *v20;
  size_t v21;
  float v22;
  float *v23;
  int v24;
  uint64_t v26;
  char *v27;
  size_t v28;
  float v29;
  float *v30;
  int v31;

  if (CFBinaryHeapContainsValue(heap, value))
  {
LABEL_2:
    v10 = 1;
    goto LABEL_5;
  }
  if (a2)
  {
    v10 = ((unsigned int (*)(_QWORD, _QWORD, float *, CFBinaryHeapRef, uint64_t))a2[2])(a2[1], *a2, value, heap, a5) != 0;
  }
  else
  {
    if (CFBinaryHeapGetCount(heap) < a5)
      goto LABEL_2;
    Minimum = (float *)CFBinaryHeapGetMinimum(heap);
    v12 = (float *)CFBinaryHeapGetMinimum(a3);
    v13 = 0.0;
    v14 = 0.0;
    if (value)
      v14 = *value;
    if (Minimum)
      v13 = *Minimum;
    if (v14 > v13)
      goto LABEL_2;
    if (v12)
    {
      v15 = Minimum ? *Minimum : 0.0;
      if (v15 < v12[4])
        goto LABEL_2;
    }
    v10 = 0;
  }
LABEL_5:
  if (!CFBinaryHeapContainsValue(heap, value))
  {
    if (a2)
    {
      if (((unsigned int (*)(_QWORD, _QWORD, float *, CFBinaryHeapRef, uint64_t))a2[3])(a2[1], *a2, value, heap, a5))
      {
        ((void (*)(_QWORD, _QWORD, float *, CFBinaryHeapRef, uint64_t))a2[4])(a2[1], *a2, value, heap, a5);
LABEL_27:
        CFBinaryHeapAddValue(heap, value);
      }
    }
    else
    {
      if (CFBinaryHeapGetCount(heap) < a5)
        goto LABEL_27;
      v16 = (float *)CFBinaryHeapGetMinimum(heap);
      v17 = 0.0;
      v18 = 0.0;
      if (v16)
        v18 = *v16;
      if (value)
        v17 = *value;
      if (v18 < v17)
      {
        v19 = (4 * *((_DWORD *)v16 + 2));
        v20 = v16 + 5;
        v21 = *((unsigned int *)v16 + 4);
        v22 = *v16;
        v23 = (float *)malloc_type_malloc(v21 + 4125, 0x6582D28FuLL);
        *((_QWORD *)v23 + 1) = v19;
        v23[4] = v22;
        *((_DWORD *)v23 + 5) = 1;
        *((_DWORD *)v23 + 6) = v21;
        *((_BYTE *)v23 + v21 + 28) = 0;
        memcpy(v23 + 7, v20, v21);
        CFBinaryHeapAddValue(a3, v23);
        v24 = *((_DWORD *)v23 + 5) - 1;
        *((_DWORD *)v23 + 5) = v24;
        if (!v24)
          free(v23);
        CFBinaryHeapRemoveMinimumValue(heap);
        goto LABEL_27;
      }
      v26 = (4 * *((_DWORD *)value + 2));
      v27 = (char *)(value + 5);
      v28 = *((unsigned int *)value + 4);
      v29 = *value;
      v30 = (float *)malloc_type_malloc(v28 + 4125, 0x6582D28FuLL);
      *((_QWORD *)v30 + 1) = v26;
      v30[4] = v29;
      *((_DWORD *)v30 + 5) = 1;
      *((_DWORD *)v30 + 6) = v28;
      *((_BYTE *)v30 + v28 + 28) = 0;
      memcpy(v30 + 7, v27, v28);
      CFBinaryHeapAddValue(a3, v30);
      v31 = *((_DWORD *)v30 + 5) - 1;
      *((_DWORD *)v30 + 5) = v31;
      if (!v31)
        free(v30);
    }
  }
  return v10;
}

void nlp::rankSearchGetCursor(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, __CFBinaryHeap *a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  int v13;

  v9 = *(_QWORD *)(a1 + 2080);
  v10 = a2 & 3;
  if (v9)
  {
    switch(v10)
    {
      case 3:
        v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + v9 + 32);
        break;
      case 2:
        v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + v9 + 4);
        break;
      case 1:
        v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + v9 + 1028);
        break;
      default:
        return;
    }
  }
  else if (v10 == 2)
  {
    v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + 8);
  }
  else
  {
    if (v10 != 1)
      return;
    v11 = *(_DWORD *)(a2 & 0xFFFFFFFFFFFFFFFCLL);
  }
  v12 = malloc_type_malloc(a4 + 4125, 0x6582D28FuLL);
  v12[1] = a2;
  *((_DWORD *)v12 + 4) = v11;
  *((_DWORD *)v12 + 5) = 1;
  *((_DWORD *)v12 + 6) = a4;
  *((_BYTE *)v12 + a4 + 28) = 0;
  memcpy((char *)v12 + 28, a3, a4);
  CFBinaryHeapAddValue(a5, v12);
  v13 = *((_DWORD *)v12 + 5) - 1;
  *((_DWORD *)v12 + 5) = v13;
  if (!v13)
    free(v12);
}

BOOL nlp::rankSearchList(nlp *a1, char *a2, int a3, unsigned int a4, __CFBinaryHeap *a5, __CFBinaryHeap *a6, unsigned int a7, _QWORD *a8)
{
  BOOL updated;
  nlp *v12;
  char *v13;
  int v14;
  char *v15;
  size_t v16;
  int v17;
  int v18;
  _DWORD *v19;
  int v20;

  if (a4 <= 0x3FF)
  {
    v12 = a1;
    v13 = (char *)nlp::sharedBuffer(a1);
    memcpy(v13, a2, a4);
    v13[a4] = 0;
    if (v12)
    {
      v14 = a3 - a4;
      v15 = &a2[a4];
      updated = 1;
      do
      {
        memcpy(&v13[a4], (char *)v12 + 22, *((unsigned __int16 *)v12 + 10));
        v16 = *((unsigned __int16 *)v12 + 10) + (unint64_t)a4;
        v13[v16] = 0;
        if (v14 <= *((unsigned __int16 *)v12 + 10) && !memcmp((char *)v12 + 22, v15, v14))
        {
          v17 = *((_DWORD *)v12 + 4);
          v18 = *((_DWORD *)v12 + 3);
          v19 = malloc_type_malloc(v16 + 21, 0xF7573F27uLL);
          v19[4] = v16;
          *((_BYTE *)v19 + v16 + 20) = 0;
          memcpy(v19 + 5, v13, v16);
          *v19 = v18;
          v19[2] = v17;
          v19[3] = 1;
          updated = nlp::updateCompletions((float *)v19, a8, a5, a6, a7);
          v20 = v19[3] - 1;
          v19[3] = v20;
          if (!v20)
            free(v19);
        }
        v12 = *(nlp **)v12;
      }
      while (v12);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
  return updated;
}

void nlp::serializeListsRanked(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  unsigned int v16;
  unint64_t v17;
  int v18;
  _DWORD *v19;
  void *v20;
  size_t v21;
  _QWORD *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char *v28;
  size_t v29;
  _DWORD *v30;
  unsigned int __fd;
  int v35;

  v4 = a4;
  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = 0;
  __fd = a4;
  do
  {
    v9 = v6 + 8 * v8;
    v12 = *(_QWORD *)(v9 + 12);
    v11 = (uint64_t *)(v9 + 12);
    v10 = v12;
    v13 = v12 & 3;
    if (v13 == 2)
    {
      v14 = (_DWORD *)(v10 & 0xFFFFFFFFFFFFFFFCLL);
      v15 = 1;
      v35 = lseek(v4, 0, 1);
      v16 = *(_DWORD *)(v7 + 2088);
      if (v16 <= 1)
        v17 = 1;
      else
        v17 = v16;
      v18 = v14[2];
      v19 = malloc_type_malloc(1035 * v17 + 8, 0xDAD0EE8AuLL);
      v20 = malloc_type_malloc(8 * v17, 0x2004093837F09uLL);
      LODWORD(v21) = 0;
      v22 = v14;
      do
      {
        v23 = v15;
        if (v17 <= v21)
        {
          v20 = malloc_type_realloc(v20, 16 * v17, 0x2004093837F09uLL);
          v17 *= 2;
        }
        *((_QWORD *)v20 + v21) = v22;
        v22 = (_QWORD *)*v22;
        v21 = (v21 + 1);
        ++v15;
      }
      while (v22);
      qsort(v20, v21, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeScoreCompare);
      v24 = 0;
      if ((_DWORD)v21)
      {
        v25 = v23;
        v26 = (uint64_t *)v20;
        do
        {
          v27 = *v26++;
          v28 = (char *)v19 + v24;
          *((_WORD *)v28 + 8) = *(_WORD *)(v27 + 20);
          *((_DWORD *)v28 + 2) = *(_DWORD *)(v27 + 12);
          *((_DWORD *)v28 + 3) = *(_DWORD *)(v27 + 16);
          memcpy(v28 + 18, (const void *)(v27 + 22), *(unsigned __int16 *)(v27 + 20));
          v24 += *(unsigned __int16 *)(v27 + 20) + 10;
          --v25;
        }
        while (v25);
      }
      v5 = a3;
      v29 = (v24 + 11) & 0x1FFFFFFFCLL;
      *v19 = v24;
      v19[1] = v18;
      v4 = __fd;
      write(__fd, v19, v29);
      free(v20);
      free(v19);
      do
      {
        v30 = *(_DWORD **)v14;
        free(v14);
        v14 = v30;
      }
      while (v30);
      *v11 = (v35 - a3) | 2;
      v7 = a1;
      v6 = a2;
    }
    else if (v13 == 1)
    {
      nlp::serializeListsRanked(v7, v10 & 0xFFFFFFFFFFFFFFFCLL, v5, v4);
    }
    ++v8;
  }
  while (v8 != 256);
}

void nlp::serializeLists(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unsigned int v14;
  unint64_t v15;
  _DWORD *v16;
  void *v17;
  unsigned int v18;
  _QWORD *v19;
  int v20;
  uint64_t v21;
  int (__cdecl *v22)(const void *, const void *);
  unsigned int v23;
  uint64_t *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  char *v35;
  unsigned __int16 v36;
  _QWORD *v37;
  unsigned int __fd;
  int v41;

  v4 = a4;
  v5 = a3;
  v6 = a2;
  v7 = 0;
  __fd = a4;
  do
  {
    v8 = v6 + 8 * v7;
    v11 = *(_QWORD *)(v8 + 4);
    v10 = (uint64_t *)(v8 + 4);
    v9 = v11;
    v12 = v11 & 3;
    if (v12 == 2)
    {
      v13 = (_QWORD *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
      v41 = lseek(v4, 0, 1);
      v14 = *(_DWORD *)(a1 + 2088);
      if (v14 <= 1)
        v15 = 1;
      else
        v15 = v14;
      v16 = malloc_type_malloc(1031 * v15 + 4, 0x394DC8B7uLL);
      v17 = malloc_type_malloc(8 * v15, 0x2004093837F09uLL);
      v18 = 0;
      if (v13)
      {
        v19 = v13;
        do
        {
          if (v15 <= v18)
          {
            v17 = malloc_type_realloc(v17, 16 * v15, 0x2004093837F09uLL);
            v15 *= 2;
          }
          *((_QWORD *)v17 + v18) = v19;
          v19 = (_QWORD *)*v19;
          ++v18;
        }
        while (v19);
      }
      v20 = *(_DWORD *)(a1 + 2064);
      if ((v20 & 4) != 0)
      {
        v28 = v18;
        qsort(v17, v18, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare);
        if (v18)
        {
          v29 = 0;
          v30 = 0;
          v23 = 0;
          do
          {
            v31 = v30;
            v30 = *((_QWORD *)v17 + v29);
            if (v31)
            {
              v32 = 0;
              v33 = *(unsigned __int16 *)(v30 + 12);
              v34 = *(_WORD *)(v30 + 12);
              while (v33 != v32)
              {
                if (*(unsigned __int16 *)(v31 + 12) <= (unsigned __int16)v32
                  || *(unsigned __int8 *)(v30 + 14 + v32) != *(unsigned __int8 *)(v31 + 14 + v32))
                {
                  v34 = v32;
                  break;
                }
                if (++v32 == 255)
                {
                  v34 = 255;
                  break;
                }
              }
            }
            else
            {
              v34 = 0;
              LOWORD(v33) = *(_WORD *)(v30 + 12);
            }
            v35 = (char *)v16 + v23;
            v36 = v33 - v34;
            *((_WORD *)v35 + 4) = v36;
            *((_DWORD *)v35 + 1) = *(_DWORD *)(v30 + 8);
            v35[10] = v34;
            memcpy(v35 + 11, (const void *)(v30 + v34 + 14), v36);
            v23 = v23 - v34 + *(unsigned __int16 *)(v30 + 12) + 7;
            ++v29;
          }
          while (v29 != v28);
        }
        else
        {
          v23 = 0;
        }
        v27 = 10;
      }
      else
      {
        v21 = v18;
        if ((v20 & 1) != 0)
          v22 = (int (__cdecl *)(const void *, const void *))nlp::nodeScoreCompare;
        else
          v22 = (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare;
        qsort(v17, v18, 8uLL, v22);
        v23 = 0;
        if (v18)
        {
          v24 = (uint64_t *)v17;
          do
          {
            v25 = *v24++;
            v26 = (char *)v16 + v23;
            *((_WORD *)v26 + 4) = *(_WORD *)(v25 + 12);
            *((_DWORD *)v26 + 1) = *(_DWORD *)(v25 + 8);
            memcpy(v26 + 10, (const void *)(v25 + 14), *(unsigned __int16 *)(v25 + 12));
            v23 += *(unsigned __int16 *)(v25 + 12) + 6;
            --v21;
          }
          while (v21);
        }
        v27 = 7;
      }
      v4 = __fd;
      v5 = a3;
      *v16 = v23;
      write(__fd, v16, (v27 + v23) & 0x1FFFFFFFCLL);
      free(v17);
      free(v16);
      do
      {
        v37 = (_QWORD *)*v13;
        free(v13);
        v13 = v37;
      }
      while (v37);
      *v10 = (v41 - a3) | 2;
      v6 = a2;
    }
    else if (v12 == 1)
    {
      nlp::serializeLists(a1, v9 & 0xFFFFFFFFFFFFFFFCLL, v5, v4);
    }
    ++v7;
  }
  while (v7 != 256);
}

uint64_t nlp::serializeLevelsRanked(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5, int *a6)
{
  int32x4_t v10;
  uint64_t i;
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  off_t v19;
  int8x16_t *v20;
  int v21;
  size_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int8 *v30;
  int v31;
  int v32;
  uint64_t v34;
  size_t v35;
  uint64_t v36;
  unsigned int v37;
  int v38;
  _DWORD v39[257];
  uint64_t v40;
  uint64_t v41;

  v38 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v10 = 0uLL;
  for (i = 3; i != 515; i += 8)
    v10 = vsubq_s32(v10, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i]), (int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i + 4]))));
  v12 = vaddvq_s32(v10);
  if (v12 > 0xC7)
    a5 = 1;
  v37 = a5;
  if ((a5 & 1) != 0)
  {
    v14 = 0;
    v15 = *a6;
    *a6 = v15 + 1036;
    do
    {
      v16 = *(_QWORD *)&a1[2 * v14 + 3];
      if ((v16 & 3) == 1)
      {
        v17 = *a6;
        if (nlp::serializeLevelsRanked(v16 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, 1, 0, a6))
          v18 = v17 | 1;
        else
          v18 = v17 | 3;
        v39[v14] = v18;
      }
      else
      {
        v39[v14] = v16;
      }
      ++v14;
    }
    while (v14 != 256);
    v39[256] = a1[2];
    v40 = *(_QWORD *)a1;
    v19 = v15 + a2;
    v20 = (int8x16_t *)v39;
    v21 = a3;
    v22 = 1036;
  }
  else
  {
    v36 = v12;
    v23 = 4 * v12 + 44;
    v24 = *a6;
    MEMORY[0x24BDAC7A8]();
    v26 = (int8x16_t *)((char *)&v34 - v25);
    bzero((char *)&v34 - v25, v23);
    bzero(v26, v23);
    v27 = 0;
    v28 = 0;
    v34 = v24;
    v35 = v23;
    *a6 = v24 + v23;
    do
    {
      v29 = *(_QWORD *)&a1[2 * v27 + 3];
      if (v29)
      {
        v26->i64[v27 >> 6] |= 1 << v27;
        v30 = &v26->i8[4 * v28];
        if ((v29 & 3) == 1)
        {
          v31 = *a6;
          if (nlp::serializeLevelsRanked(v29 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, 1, 0, a6))
            v32 = v31 | 1;
          else
            v32 = v31 | 3;
          *((_DWORD *)v30 + 11) = v32;
        }
        else
        {
          *((_DWORD *)v30 + 11) = v29;
        }
        ++v28;
      }
      ++v27;
    }
    while (v27 != 256);
    if (vaddvq_s32(vuzp1q_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*v26)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(v26[1])))))) != (_DWORD)v36)nlp::serializeLevelsRanked();
    v26[2].i32[2] = a1[2];
    v26[2].i64[0] = *(_QWORD *)a1;
    v22 = v35;
    v19 = v34 + a2;
    v21 = a3;
    v20 = v26;
  }
  pwrite(v21, v20, v22, v19);
  if (v38)
    free(a1);
  return v37;
}

uint64_t nlp::serializeLevels(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5, int *a6)
{
  int32x4_t v10;
  uint64_t i;
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  off_t v19;
  int8x16_t *v20;
  int v21;
  size_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int8 *v30;
  int v31;
  int v32;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  _DWORD v40[257];
  uint64_t v41;

  v39 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v10 = 0uLL;
  for (i = 1; i != 513; i += 8)
    v10 = vsubq_s32(v10, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i]), (int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i + 4]))));
  v12 = vaddvq_s32(v10);
  if (v12 > 0xC7)
    a5 = 1;
  v38 = a5;
  if ((a5 & 1) != 0)
  {
    v14 = 0;
    v15 = *a6;
    *a6 = v15 + 1028;
    do
    {
      v16 = *(_QWORD *)&a1[2 * v14 + 1];
      if ((v16 & 3) == 1)
      {
        v17 = *a6;
        if (nlp::serializeLevels(v16 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, 1, 0, a6))
          v18 = v17 | 1;
        else
          v18 = v17 | 3;
        v40[v14] = v18;
      }
      else
      {
        v40[v14] = v16;
      }
      ++v14;
    }
    while (v14 != 256);
    v40[256] = *a1;
    v19 = v15 + a2;
    v20 = (int8x16_t *)v40;
    v21 = a3;
    v22 = 1028;
  }
  else
  {
    v37 = v12;
    v23 = 4 * v12 + 36;
    v24 = *a6;
    MEMORY[0x24BDAC7A8]();
    v26 = (int8x16_t *)((char *)&v34 - v25);
    bzero((char *)&v34 - v25, v23);
    bzero(v26, v23);
    v27 = 0;
    v28 = 0;
    v35 = v24;
    v36 = v23;
    *a6 = v24 + v23;
    do
    {
      v29 = *(_QWORD *)&a1[2 * v27 + 1];
      if (v29)
      {
        v26->i64[v27 >> 6] |= 1 << v27;
        v30 = &v26->i8[4 * v28];
        if ((v29 & 3) == 1)
        {
          v31 = *a6;
          if (nlp::serializeLevels(v29 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, 1, 0, a6))
            v32 = v31 | 1;
          else
            v32 = v31 | 3;
          *((_DWORD *)v30 + 9) = v32;
        }
        else
        {
          *((_DWORD *)v30 + 9) = v29;
        }
        ++v28;
      }
      ++v27;
    }
    while (v27 != 256);
    if (vaddvq_s32(vuzp1q_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*v26)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(v26[1])))))) != (_DWORD)v37)nlp::serializeLevels();
    v26[2].i32[0] = *a1;
    v22 = v36;
    v19 = v35 + a2;
    v21 = a3;
    v20 = v26;
  }
  pwrite(v21, v20, v22, v19);
  if (v39)
    free(a1);
  return v38;
}

_QWORD *nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = 0;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 2080))
      nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>();
    v2 = malloc_type_calloc(0x28uLL, 1uLL, 0xB23B27DBuLL);
    if (nlp::burstTrieSetCursor(a1, (uint64_t)v2))
    {
      v2[1] = a2 | 1;
      *((_DWORD *)v2 + 5) = *(_DWORD *)(a2 + 8);
      *((_DWORD *)v2 + 6) = *(_DWORD *)(a2 + 4);
    }
    else if (v2)
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

uint64_t std::vector<std::tuple<std::string,unsigned int,float>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 5)
  {
    if (a2 >> 59)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 32 * v6;
    std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_208415C5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

_QWORD *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C09DBF8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C09DBF8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t result)
{
  ++**(_DWORD **)(result + 8);
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

uint64_t std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(_OWORD *)(a3 - 32);
      *(_QWORD *)(v8 - 16) = *(_QWORD *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(v8 - 8) = *(_QWORD *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

_QWORD *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C09DBA0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C09DBA0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, void **a3, unsigned int *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  void *__p[2];
  uint64_t v22;
  _QWORD v23[5];

  v6 = *a5;
  v7 = *a6;
  v8 = *(uint64_t **)(a1 + 8);
  std::string::basic_string[abi:ne180100](__p, *a3, *a4);
  v9 = v8[1];
  v10 = v8[2];
  if (v9 >= v10)
  {
    v12 = (uint64_t)(v9 - *v8) >> 5;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 59)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v14 = v10 - *v8;
    if (v14 >> 4 > v13)
      v13 = v14 >> 4;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFE0)
      v15 = 0x7FFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v23[4] = v8 + 2;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(v8 + 2), v15);
    else
      v16 = 0;
    v17 = &v16[32 * v12];
    v23[0] = v16;
    v23[1] = v17;
    v23[3] = &v16[32 * v15];
    v18 = *(_OWORD *)__p;
    *((_QWORD *)v17 + 2) = v22;
    *(_OWORD *)v17 = v18;
    __p[1] = 0;
    v22 = 0;
    __p[0] = 0;
    *((_DWORD *)v17 + 6) = v6;
    *((_DWORD *)v17 + 7) = v7;
    v23[2] = v17 + 32;
    std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(v8, v23);
    v19 = v8[1];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v23);
    v20 = SHIBYTE(v22);
    v8[1] = v19;
    if (v20 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v11 = *(_OWORD *)__p;
    *(_QWORD *)(v9 + 16) = v22;
    *(_OWORD *)v9 = v11;
    *(_DWORD *)(v9 + 24) = v6;
    *(_DWORD *)(v9 + 28) = v7;
    v8[1] = v9 + 32;
  }
}

void sub_208416030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)&a15);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

_QWORD *nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_TrieLevel *>(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;

  v2 = 0;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 2080))
      nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>();
    v2 = malloc_type_calloc(0x28uLL, 1uLL, 0xB23B27DBuLL);
    if (nlp::burstTrieSetCursor(a1, (uint64_t)v2))
    {
      v2[1] = a2 | 1;
      *((_DWORD *)v2 + 5) = *(_DWORD *)a2;
    }
    else if (v2)
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

void std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

_QWORD *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C09DB48;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C09DB48;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t result)
{
  ++**(_DWORD **)(result + 8);
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

_QWORD *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C09DAF0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C09DAF0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, void **a3, unsigned int *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  void *__p[2];
  uint64_t v22;
  _QWORD v23[5];

  v6 = *a5;
  v7 = *a6;
  v8 = *(uint64_t **)(a1 + 8);
  std::string::basic_string[abi:ne180100](__p, *a3, *a4);
  v9 = v8[1];
  v10 = v8[2];
  if (v9 >= v10)
  {
    v12 = (uint64_t)(v9 - *v8) >> 5;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 59)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v14 = v10 - *v8;
    if (v14 >> 4 > v13)
      v13 = v14 >> 4;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFE0)
      v15 = 0x7FFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v23[4] = v8 + 2;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(v8 + 2), v15);
    else
      v16 = 0;
    v17 = &v16[32 * v12];
    v23[0] = v16;
    v23[1] = v17;
    v23[3] = &v16[32 * v15];
    v18 = *(_OWORD *)__p;
    *((_QWORD *)v17 + 2) = v22;
    *(_OWORD *)v17 = v18;
    __p[1] = 0;
    v22 = 0;
    __p[0] = 0;
    *((_DWORD *)v17 + 6) = v6;
    *((_DWORD *)v17 + 7) = v7;
    v23[2] = v17 + 32;
    std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(v8, v23);
    v19 = v8[1];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v23);
    v20 = SHIBYTE(v22);
    v8[1] = v19;
    if (v20 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v11 = *(_OWORD *)__p;
    *(_QWORD *)(v9 + 16) = v22;
    *(_OWORD *)v9 = v11;
    *(_DWORD *)(v9 + 24) = v6;
    *(_DWORD *)(v9 + 28) = v7;
    v8[1] = v9 + 32;
  }
}

void sub_208416448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)&a15);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
  JUMPOUT(0x20BD06848);
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24C09DA98;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C09DA98;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, const void **a3, unsigned int *a4, int *a5, int *a6, uint64_t *a7)
{
  const void *v8;
  size_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  char *v14;
  size_t v15;
  size_t v16;
  _DWORD *v17;
  int v18;

  v8 = *a3;
  v9 = *a4;
  v10 = *a5;
  v11 = *a6;
  v12 = *a7;
  v13 = *(_DWORD *)(a1 + 16) + v9;
  v14 = (char *)operator new[]();
  v15 = *(unsigned int *)(a1 + 16);
  memcpy(v14, *(const void **)(a1 + 8), v15);
  memcpy(&v14[v15], v8, v9);
  v14[v13] = 0;
  v16 = (v15 + v9);
  v17 = malloc_type_malloc(v16 + 21, 0xF7573F27uLL);
  v17[4] = v16;
  *((_BYTE *)v17 + v16 + 20) = 0;
  memcpy(v17 + 5, v14, v16);
  *v17 = v11;
  v17[2] = v10;
  v17[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(*(_QWORD *)(a1 + 24), 0, (uint64_t)v17, v12);
  v18 = v17[3] - 1;
  v17[3] = v18;
  if (!v18)
    free(v17);
  JUMPOUT(0x20BD06830);
}

uint64_t std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void encoder_save_model_to_file_pointer_cold_1()
{
  __assert_rtn("crf1de_write_external_attribute_model", "crf1d_encode.c", 694, "feature->type == FT_TRANS");
}

void crf1dm_initialize_state_scores_cold_1()
{
  __assert_rtn("crf1dm_initialize_state_scores_compact", "crf1d_model.c", 1356, "model->compact_header");
}

void crf1dm_initialize_state_scores_cold_2()
{
  __assert_rtn("crf1dm_initialize_state_scores_quantized", "crf1d_model.c", 1386, "model->quantized_header");
}

void cmw_write_attribute_feature_cold_1()
{
  __assert_rtn("cmw_write_attribute_feature", "crf1d_model.c", 1614, "fwrite(&feature, 1, sizeof(compact_attribute_feature_t), concrete_writer->fp) == sizeof(compact_attribute_feature_t)");
}

void qmw_write_label_features_cold_1()
{
  __assert_rtn("qmw_write_label_features", "crf1d_model.c", 1724, "num_labels <= 255");
}

void qmw_write_attribute_feature_counts_and_offsets_cold_1()
{
  __assert_rtn("qmw_write_attribute_feature_counts_and_offsets", "crf1d_model.c", 1778, "feature_counts[i] <= 255");
}

void qmw_write_attribute_feature_cold_1()
{
  __assert_rtn("qmw_write_attribute_feature", "crf1d_model.c", 1792, "destination <= 255");
}

void qmw_write_attribute_feature_cold_2()
{
  __assert_rtn("qmw_write_attribute_feature", "crf1d_model.c", 1799, "fwrite(&feature, 1, sizeof(quantized_attribute_feature_t), concrete_writer->fp) == sizeof(quantized_attribute_feature_t)");
}

void ME_Efficient_Model_Trainer::ME_FeatureBag::Feature()
{
  __assert_rtn("Feature", "efficient_maxent.h", 181, "id >= 0 && id < (int)id2mef.size()");
}

void ME_Efficient_Model_Trainer::FunctionGradient()
{
  __assert_rtn("FunctionGradient", "efficient_maxent.cpp", 36, "(int)_fb.Size() == x.size()");
}

void ME_Efficient_Model_Trainer::classify()
{
  __assert_rtn("classify", "efficient_maxent.cpp", 156, "_num_classes == (int)membp.size()");
}

void ME_Efficient_Model_Trainer::StringBag::Str()
{
  __assert_rtn("Str", "efficient_maxent.h", 235, "id >= 0 && id < (int)id2str.size()");
}

void ME_Efficient_Model::conditional_probability()
{
  __assert_rtn("conditional_probability", "efficient_maxent.cpp", 678, "prod != 0");
}

{
  __assert_rtn("conditional_probability", "efficient_maxent.cpp", 686, "max_label >= 0");
}

void ME_Efficient_Model::classify()
{
  __assert_rtn("classify", "efficient_maxent.cpp", 693, "num_classes() == (int)membp.size()");
}

void ME_Efficient_Model_Trainer::ME_Feature::ME_Feature()
{
  __assert_rtn("ME_Feature", "efficient_maxent.h", 147, "l >= 0 && l <= MAX_LABEL_TYPES");
}

{
  __assert_rtn("ME_Feature", "efficient_maxent.h", 148, "f >= 0 && f <= 0xffffff");
}

void Vec::operator+=()
{
  __assert_rtn("operator+=", "mathvec.h", 21, "b.Size() == _v.size()");
}

void crf_paragraph_get_id_cold_1()
{
  __assert_rtn("crf_paragraph_get_id", "backward_compatibility.c", 61, "index >= 0 && index < paragraph->num_items*paragraph->num_attrs");
}

void crf_paragraph_set_id_cold_1()
{
  __assert_rtn("crf_paragraph_set_id", "backward_compatibility.c", 73, "index >= 0");
}

void nlp::addListNode()
{
  __assert_rtn("addListNode", "BurstTrie.cpp", 577, "listcount <= trie->reserved[ContainerSize]");
}

void nlp::addListNodeRanked()
{
  __assert_rtn("addListNodeRanked", "BurstTrie.cpp", 716, "listcount <= trie->reserved[ContainerSize]");
}

void nlp::advanceMapCursorTrieList()
{
  __assert_rtn("advanceMapCursorTrieList", "BurstTrie.cpp", 1854, "cursor->prfxlen <= head->restlen");
}

void nlp::serializeLevelsRanked()
{
  __assert_rtn("serializeLevelsRanked", "BurstTrie.cpp", 3660, "bitcount == count");
}

void nlp::serializeLevels()
{
  __assert_rtn("serializeLevels", "BurstTrie.cpp", 3521, "bitcount == count");
}

void nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>()
{
  __assert_rtn("burstTrieCreateCursorWithTrieLevelRef", "BurstTrie.cpp", 2633, "nullptr == trie->mapbase");
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x24BDBB990](heap, value);
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x24BDBB9A0](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x24BDBB9A8](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x24BDBB9B0](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x24BDBB9B8](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x24BDBB9D0](heap);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::__rs_default::~__rs_default(std::__rs_default *this)
{
  MEMORY[0x24BEDABF0](this);
}

std::__rs_default::result_type std::__rs_default::operator()(std::__rs_default *this)
{
  return MEMORY[0x24BEDABF8](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF60]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

uint64_t std::__rs_get()
{
  return MEMORY[0x24BEDB4E8]();
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C09D398();
}

void operator delete(void *__p)
{
  off_24C09D3A0(__p);
}

uint64_t operator delete()
{
  return off_24C09D3A8();
}

uint64_t operator new[]()
{
  return off_24C09D3B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C09D3B8(__sz);
}

uint64_t operator new()
{
  return off_24C09D3C0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

clock_t clock(void)
{
  return MEMORY[0x24BDAD9B0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE4C8](a1, a2);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x24BDAE5C8](a1);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAE7B0](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x24BDAFFF0](__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x24BDB00F0](*(_QWORD *)&a1);
}

long double tanh(long double __x)
{
  long double result;

  MEMORY[0x24BDB0148](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x24BDB0268]();
}

int vsprintf(char *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0458](a1, a2, a3);
}

