void *sub_20952C8EC(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int64_t v4;
  void *result;
  int v6;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(const void **)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 104) - (_QWORD)v3;
  *(_QWORD *)(a1 + 912) = v4 >> 2;
  *(_DWORD *)(a1 + 920) = (unint64_t)(v2 - (_QWORD)v3) >> 2;
  result = memcpy(*(void **)(a1 + 928), v3, v4);
  v6 = *(_DWORD *)(a1 + 124);
  if (v6)
    v6 = *(_DWORD *)(a1 + 128);
  *(_DWORD *)(a1 + 992) = v6;
  *(_DWORD *)(a1 + 996) = *(_DWORD *)(a1 + 1000);
  *(_QWORD *)(a1 + 968) = *(_QWORD *)(a1 + 960);
  *(_BYTE *)(a1 + 984) = *(_BYTE *)(a1 + 137);
  *(_DWORD *)(a1 + 988) = *(_DWORD *)(a1 + 140);
  return result;
}

void *sub_20952C960(uint64_t a1, const void *a2, int a3)
{
  void *result;

  result = memcpy(*(void **)(a1 + 936), a2, 4 * a3);
  *(_QWORD *)(a1 + 944) = *(_QWORD *)(a1 + 936) + 4 * a3;
  return result;
}

uint64_t sub_20952C998(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  unint64_t v5;
  _DWORD *v6;

  v2 = result;
  v3 = a2;
  v4 = *(_DWORD **)(result + 104);
  if ((unint64_t)&v4[a2] >= *(_QWORD *)(result + 112))
  {
    result = sub_20952CA08(result, a2);
    if (!(_DWORD)result)
      return result;
    v4 = *(_DWORD **)(v2 + 104);
  }
  v5 = *(_QWORD *)(v2 + 96);
  if (v5 < (unint64_t)v4)
  {
    v6 = v4;
    do
    {
      v6[v3] = *v6;
      --v6;
    }
    while ((unint64_t)v6 >= v5);
  }
  *(_QWORD *)(v2 + 104) = &v4[v3];
  return result;
}

uint64_t sub_20952CA08(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, _QWORD);

  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(void **)(a1 + 88);
  v5 = (v3 - (uint64_t)v4) >> 2;
  v6 = v5 + 2;
  v7 = 2 * (v5 + 2);
  if (v5 + 2 >= a2)
  {
    v8 = 2 * (v5 + 2);
  }
  else
  {
    do
    {
      v8 = v7;
      v9 = v7 - v6;
      v7 *= 2;
    }
    while (v9 < a2);
  }
  result = (uint64_t)malloc_type_realloc(v4, 4 * v8, 0x100004052888210uLL);
  if (result)
  {
    v11 = result;
    bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
    v12 = *(_QWORD *)(a1 + 88);
    v13 = v11 + *(_QWORD *)(a1 + 96) - v12;
    *(_QWORD *)(a1 + 88) = v11;
    *(_QWORD *)(a1 + 96) = v13;
    *(_QWORD *)(a1 + 104) = v11 + *(_QWORD *)(a1 + 104) - v12;
    *(_QWORD *)(a1 + 112) = v11 + 4 * v5;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 936), 4 * v8, 0x100004052888210uLL);
    if (result)
    {
      v14 = result;
      bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
      v15 = *(_QWORD *)(a1 + 936);
      *(_QWORD *)(a1 + 936) = v14;
      *(_QWORD *)(a1 + 944) = v14 + *(_QWORD *)(a1 + 944) - v15;
      *(_QWORD *)(a1 + 952) = *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 952) - v12;
      result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 928), 4 * v8, 0x100004052888210uLL);
      if (result)
      {
        v16 = result;
        bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
        *(_QWORD *)(a1 + 928) = v16;
        result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 960), 4 * v8, 0x100004052888210uLL);
        if (result)
        {
          v17 = *(_QWORD *)(a1 + 960);
          *(_QWORD *)(a1 + 968) = result + *(_QWORD *)(a1 + 968) - v17;
          *(_QWORD *)(a1 + 976) = result + *(_QWORD *)(a1 + 976) - v17;
          *(_QWORD *)(a1 + 960) = result;
          result = sub_209530C90(a1, v5 + 2, v8);
          if ((_DWORD)result)
          {
            *(_QWORD *)(a1 + 112) = *(_QWORD *)(a1 + 88) + 4 * v8 - 8;
            v18 = *(void (**)(uint64_t, _QWORD))(a1 + 1032);
            if (v18)
              v18(a1, *(_QWORD *)(a1 + 1040));
            return 1;
          }
        }
      }
    }
  }
  return result;
}

_QWORD *sub_20952CBE8(_QWORD *result, unsigned int a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _DWORD *v9;

  v2 = result;
  v3 = result[12];
  v4 = result[13];
  v5 = v3 + 4 * (int)a2;
  v6 = (v4 - v3) >> 2;
  if (v5 <= v4)
    v7 = a2;
  else
    v7 = v6;
  if (result[133] != result[134])
  {
    sub_20952C8EC((uint64_t)result);
    result = memcpy((void *)v2[117], (const void *)v2[12], 4 * (int)v7);
    v2[118] = v2[117] + 4 * (int)v7;
  }
  if ((int)v7 >= 1)
  {
    v9 = (_DWORD *)v2[12];
    v8 = v2[13];
    while ((unint64_t)v9 <= v8)
    {
      *v9 = v9[v7];
      ++v9;
    }
    v2[13] = v8 - 4 * v7;
  }
  return result;
}

uint64_t sub_20952CC78(uint64_t result)
{
  unint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  int v4;

  v2 = *(_DWORD **)(result + 96);
  v1 = *(_QWORD *)(result + 104);
  if ((unint64_t)v2 <= v1)
  {
    v3 = *(_DWORD **)(result + 96);
    do
    {
      v4 = v3[1];
      ++v3;
      *v2 = v4;
      v2 = v3;
    }
    while ((unint64_t)v3 <= v1);
  }
  *(_QWORD *)(result + 104) = v1 - 4;
  return result;
}

_QWORD *sub_20952CCA8(_QWORD *result, unsigned int a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  unint64_t v9;

  v2 = result;
  v4 = result[11];
  v3 = result[12];
  v5 = v3 - 4 * (int)a2;
  v6 = (v3 - v4) >> 2;
  if (v5 >= v4)
    v7 = a2;
  else
    v7 = v6;
  if (result[133] != result[134])
  {
    sub_20952C8EC((uint64_t)result);
    result = memcpy((void *)v2[117], (const void *)(v2[12] - 4 * (int)v7), 4 * (int)v7);
    v2[118] = v2[117] + 4 * (int)v7;
  }
  if ((int)v7 >= 1)
  {
    v8 = (_DWORD *)v2[12];
    v9 = v2[13];
    if ((unint64_t)&v8[-v7] <= v9)
    {
      do
      {
        v8[-v7] = *v8;
        ++v8;
      }
      while ((unint64_t)&v8[-v7] <= v9);
    }
    v2[13] = v9 - 4 * v7;
  }
  return result;
}

uint64_t sub_20952CD58(uint64_t result)
{
  unint64_t v1;
  _DWORD *v2;
  unint64_t v3;
  int v4;

  v1 = *(_QWORD *)(result + 104);
  v2 = (_DWORD *)(*(_QWORD *)(result + 96) - 4);
  if ((unint64_t)v2 <= v1)
  {
    v3 = *(_QWORD *)(result + 96) - 4;
    do
    {
      v4 = *(_DWORD *)(v3 + 4);
      v3 += 4;
      *v2 = v4;
      v2 = (_DWORD *)v3;
    }
    while (v3 <= v1);
  }
  *(_QWORD *)(result + 104) = v1 - 4;
  return result;
}

BOOL sub_20952CD8C(unsigned int __c)
{
  if (__c > 0x7F)
  {
    if (__maskrune(__c, 0x500uLL))
      return 1;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * __c + 60) & 0x500) != 0)
  {
    return 1;
  }
  return wcschr(dword_2095417E0, __c) != 0;
}

uint64_t sub_20952CDFC(unsigned int a1)
{
  uint64_t result;
  int v3;

  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x500uLL))
      return 1;
    v3 = __maskrune(a1, 0x800uLL);
    return 2 * (v3 != 0);
  }
  result = 1;
  if (a1 != 95 && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x500) == 0)
  {
    v3 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x800;
    return 2 * (v3 != 0);
  }
  return result;
}

BOOL sub_20952CE80(unsigned int a1)
{
  int v1;

  if (a1 > 0x7F)
    v1 = __maskrune(a1, 0x4000uLL);
  else
    v1 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x4000;
  return v1 == 0;
}

unsigned int *sub_20952CEC0(uint64_t a1, unint64_t a2, int a3, unsigned int (*a4)(_QWORD))
{
  unsigned int *v5;
  int v7;

  v5 = (unsigned int *)(a1 - 4);
  if (a3)
  {
    v7 = a3;
    do
    {
      while ((unint64_t)v5 >= a2 && !a4(*v5))
        --v5;
      while ((unint64_t)v5 >= a2 && a4(*v5))
        --v5;
      --v7;
    }
    while (v7);
  }
  if ((unint64_t)(v5 + 1) >= a2)
    return v5 + 1;
  else
    return (unsigned int *)a2;
}

unsigned int *sub_20952CF3C(unsigned int *a1, unint64_t a2, int a3, unsigned int (*a4)(_QWORD))
{
  int v7;

  if (a3)
  {
    v7 = a3;
    do
    {
      while ((unint64_t)a1 < a2 && !a4(*a1))
        ++a1;
      while ((unint64_t)a1 < a2 && a4(*a1))
        ++a1;
      --v7;
    }
    while (v7);
  }
  if ((unint64_t)a1 <= a2)
    return a1;
  else
    return (unsigned int *)a2;
}

unsigned int *sub_20952CFB4(uint64_t a1, unsigned int *a2, unint64_t a3, int a4, uint64_t (*a5)(_QWORD))
{
  int v8;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v14;

  if (a4)
  {
    v8 = a4;
    v10 = MEMORY[0x24BDAC740];
    while (1)
    {
      v11 = a5(*a2);
      if ((unint64_t)a2 < a3)
      {
        v12 = v11;
        do
        {
          if (a5(*a2) != v12)
            break;
          ++a2;
        }
        while ((unint64_t)a2 < a3);
      }
      if (!--v8)
        break;
      while ((unint64_t)a2 < a3)
      {
LABEL_15:
        v14 = *a2;
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x4000uLL))
            break;
        }
        else if ((*(_DWORD *)(v10 + 4 * v14 + 60) & 0x4000) == 0)
        {
          break;
        }
        ++a2;
      }
      if (!v8)
        goto LABEL_20;
    }
    if (*(_DWORD *)(a1 + 1000) != 3 && (unint64_t)a2 < a3)
      goto LABEL_15;
  }
LABEL_20:
  if ((unint64_t)a2 <= a3)
    return a2;
  else
    return (unsigned int *)a3;
}

unsigned int *sub_20952D094(uint64_t a1, unint64_t a2, int a3, uint64_t (*a4)(_QWORD))
{
  unsigned int *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v5 = (unsigned int *)(a1 - 4);
  if (a3)
  {
    v7 = a3;
    v8 = MEMORY[0x24BDAC740];
    while (1)
    {
      if ((unint64_t)v5 <= a2)
        goto LABEL_8;
      v9 = *v5;
      if (v9 > 0x7F)
      {
        if (!__maskrune(v9, 0x4000uLL))
          goto LABEL_8;
LABEL_6:
        --v5;
      }
      else
      {
        if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) != 0)
          goto LABEL_6;
LABEL_8:
        v10 = a4(*v5);
        if ((unint64_t)v5 >= a2)
        {
          v11 = v10;
          do
          {
            if (a4(*v5) != v11)
              break;
            --v5;
          }
          while ((unint64_t)v5 >= a2);
        }
        if (!--v7)
          break;
      }
    }
  }
  if ((unint64_t)(v5 + 1) >= a2)
    return v5 + 1;
  else
    return (unsigned int *)a2;
}

uint64_t sub_20952D154(uint64_t result)
{
  uint64_t v1;
  int v2;
  char *v3;
  signed int v4;

  v1 = result;
  v2 = *(_DWORD *)(result + 1000);
  if ((v2 & 2) != 0)
    *(_QWORD *)(result + 1064) = *(_QWORD *)(result + 1056);
  v3 = *(char **)(result + 1008);
  if (v3)
  {
    if (((*(_QWORD *)(result + 96) - (_QWORD)v3) >> 2) <= 1)
      v4 = 1;
    else
      v4 = (*(_QWORD *)(result + 96) - (_QWORD)v3) >> 2;
    *(_QWORD *)(result + 96) = v3;
    if ((v2 & 4) != 0)
    {
      if (v4 < 1)
      {
        v3 += 4 * v4;
        v4 = -v4;
      }
      result = (uint64_t)memcpy(*(void **)(result + 936), v3, 4 * v4);
      *(_QWORD *)(v1 + 944) = *(_QWORD *)(v1 + 936) + 4 * v4;
    }
    else if (v4 < 1)
    {
      result = (uint64_t)sub_20952CCA8((_QWORD *)result, -v4);
      *(_QWORD *)(v1 + 96) += 4 * v4;
    }
    else
    {
      sub_20952CBE8((_QWORD *)result, v4);
      result = sub_209538A00(v1);
    }
    *(_DWORD *)(v1 + 1000) = 0;
  }
  return result;
}

unsigned int *sub_20952D208(uint64_t a1, unint64_t a2, int a3, uint64_t (*a4)(_QWORD))
{
  unsigned int *v4;
  int v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v4 = (unsigned int *)(a1 + 4);
  if (a3)
  {
    v6 = a3;
    v8 = MEMORY[0x24BDAC740];
    while (1)
    {
      if ((unint64_t)v4 >= a2)
        goto LABEL_8;
      v9 = *v4;
      if (v9 > 0x7F)
      {
        if (!__maskrune(v9, 0x4000uLL))
          goto LABEL_8;
LABEL_6:
        ++v4;
      }
      else
      {
        if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) != 0)
          goto LABEL_6;
LABEL_8:
        v10 = a4(*v4);
        if ((unint64_t)v4 < a2)
        {
          v11 = v10;
          do
          {
            if (a4(*v4) != v11)
              break;
            ++v4;
          }
          while ((unint64_t)v4 < a2);
        }
        if (!--v6)
          return v4 - 1;
      }
    }
  }
  return v4 - 1;
}

uint64_t sub_20952D2C0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;

  v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 88) = v2;
  if (!v2)
    return 0xFFFFFFFFLL;
  bzero(v2, 0x1000uLL);
  v3 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 96) = v3;
  *(_QWORD *)(a1 + 104) = v3;
  *(_QWORD *)(a1 + 112) = v3 + 4088;
  v4 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 928) = v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  bzero(v4, 0x1000uLL);
  *(_QWORD *)(a1 + 912) = -1;
  *(_DWORD *)(a1 + 920) = 0;
  v5 = (char *)malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 960) = v5;
  if (!v5)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 968) = v5;
  *(_QWORD *)(a1 + 976) = v5 + 4096;
  *(_BYTE *)(a1 + 984) = 34;
  *(_DWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 1008) = *(_QWORD *)(a1 + 88);
  v6 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 936) = v6;
  if (!v6)
    return 0xFFFFFFFFLL;
  bzero(v6, 0x1000uLL);
  *(_QWORD *)(a1 + 952) = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 944) = *(_QWORD *)(a1 + 936);
  *(_QWORD *)(a1 + 1040) = 0;
  *(_QWORD *)(a1 + 1032) = 0;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  *(_OWORD *)(a1 + 120) = xmmword_2095417D0;
  *(_BYTE *)(a1 + 136) = 34;
  *(_QWORD *)(a1 + 1016) = 0xFFFFFFFFLL;
  v7 = malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
  *(_QWORD *)(a1 + 1024) = v7;
  if (v7)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

void sub_20952D414(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 96) = v2;
  *(_QWORD *)(a1 + 104) = v2;
  *(_QWORD *)(a1 + 912) = -1;
  *(_DWORD *)(a1 + 920) = 0;
  *(_DWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 1008) = v2;
  *(_QWORD *)(a1 + 952) = v2;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  *(_OWORD *)(a1 + 120) = xmmword_2095417D0;
  *(_BYTE *)(a1 + 136) = 34;
  *(_DWORD *)(a1 + 1176) = 0;
  if (a2)
  {
    while (1)
    {
      v4 = *(_DWORD *)(a1 + 1016);
      if ((v4 & 0x80000000) != 0)
        break;
      v5 = *(_QWORD *)(a1 + 1024);
      *(_DWORD *)(a1 + 1016) = v4 - 1;
      free(*(void **)(v5 + 8 * v4));
    }
  }
}

void sub_20952D494(uint64_t a1)
{
  free(*(void **)(a1 + 88));
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  free(*(void **)(a1 + 928));
  *(_QWORD *)(a1 + 928) = 0;
  free(*(void **)(a1 + 960));
  *(_QWORD *)(a1 + 968) = 0;
  *(_QWORD *)(a1 + 960) = 0;
  *(_QWORD *)(a1 + 976) = 0;
  *(_BYTE *)(a1 + 984) = 34;
  free(*(void **)(a1 + 936));
  *(_QWORD *)(a1 + 936) = 0;
  sub_20952D414(a1, 1);
  free(*(void **)(a1 + 1024));
  *(_QWORD *)(a1 + 1024) = 0;
}

int el_winsertstr(EditLine *a1, const __int32 *a2)
{
  size_t v4;
  int v5;
  __int32 v6;
  __int32 *v7;
  const __int32 *v8;
  __int32 v9;
  int result;

  if (!a2)
    return -1;
  v4 = wcslen(a2);
  if (!v4)
    return -1;
  v5 = v4;
  if (*((_QWORD *)a1 + 13) + 4 * v4 >= *((_QWORD *)a1 + 14) && !sub_20952CA08((uint64_t)a1, v4))
    return -1;
  sub_20952C998((uint64_t)a1, v5);
  v6 = *a2;
  if (!*a2)
    return 0;
  v7 = (__int32 *)*((_QWORD *)a1 + 12);
  v8 = a2 + 1;
  do
  {
    *v7++ = v6;
    v9 = *v8++;
    v6 = v9;
  }
  while (v9);
  result = 0;
  *((_QWORD *)a1 + 12) = v7;
  return result;
}

void el_deletestr(EditLine *a1, int a2)
{
  uint64_t v3;
  unint64_t v4;

  if (a2 >= 1 && *((_QWORD *)a1 + 12) >= *((_QWORD *)a1 + 11) + 4 * (unint64_t)a2)
  {
    v3 = a2;
    sub_20952CCA8(a1, a2);
    v4 = *((_QWORD *)a1 + 12) - 4 * v3;
    if (v4 < *((_QWORD *)a1 + 11))
      v4 = *((_QWORD *)a1 + 11);
    *((_QWORD *)a1 + 12) = v4;
  }
}

uint64_t sub_20952D604(uint64_t a1, uint64_t a2, __int32 *a3)
{
  __int32 *v5;
  size_t v7;
  uint64_t v8;
  __int32 v9;
  int v11;
  _DWORD *v12;
  __int32 v14;

  v5 = *(__int32 **)(a1 + 88);
  if (a3)
  {
    v7 = wcslen(a3);
    memcpy(v5, a3, 4 * v7);
    v5 += v7;
  }
  v14 = 0;
  *v5 = 32;
  *(_QWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 104) = v5 + 1;
  sub_209537D30(a1);
  if (el_wgetc((EditLine *)a1, &v14) == 1)
  {
    v8 = 0;
    do
    {
      v9 = v14;
      if (v14 <= 12)
      {
        if (v14 == 8)
        {
LABEL_13:
          if (!v8)
            goto LABEL_23;
          *(v5 - 1) = 32;
          *(_QWORD *)(a1 + 96) = v5 - 1;
          *(_QWORD *)(a1 + 104) = v5;
          sub_209537D30(a1);
          v11 = el_wgetc((EditLine *)a1, &v14);
          --v5;
          continue;
        }
        if (v14 == 10)
          goto LABEL_24;
      }
      else
      {
        if (v14 == 127)
          goto LABEL_13;
        if (v14 == 13 || v14 == 27)
        {
LABEL_24:
          *(_DWORD *)(a2 + 4 * v8) = v14;
          goto LABEL_25;
        }
      }
      if (v8 < 1008)
      {
        *(_DWORD *)(a2 + 4 * v8) = v14;
        *v5++ = v9;
        ++v8;
      }
      else
      {
        el_beep_0((EditLine *)a1);
      }
      *v5 = 32;
      *(_QWORD *)(a1 + 96) = v5;
      *(_QWORD *)(a1 + 104) = v5 + 1;
      sub_209537D30(a1);
      v11 = el_wgetc((EditLine *)a1, &v14);
    }
    while (v11 == 1);
  }
  sub_20952D7C8(a1);
LABEL_23:
  v8 = -1;
LABEL_25:
  v12 = *(_DWORD **)(a1 + 88);
  *v12 = 0;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v12;
  return v8;
}

uint64_t sub_20952D770(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;

  v2 = *(_QWORD *)(a1 + 88);
  v1 = *(_QWORD *)(a1 + 96);
  if (v1 == v2)
    return 0;
  v3 = -4;
  do
  {
    v4 = v3;
    v5 = (int *)(v1 + v3);
    if ((unint64_t)v5 < v2)
      break;
    v6 = *v5;
    v3 = v4 - 4;
  }
  while (v6 != 10);
  return ((unint64_t)-v4 >> 2) - 1;
}

uint64_t sub_20952D7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 1032) = a2;
  *(_QWORD *)(a1 + 1040) = a3;
  return 0;
}

uint64_t sub_20952D7C8(uint64_t a1)
{
  sub_209538960(a1);
  **(_DWORD **)(a1 + 104) = 0;
  return 2;
}

uint64_t sub_20952D7F4(uint64_t a1, int a2)
{
  int v4;
  int v5;
  _DWORD *v6;
  unint64_t v8;
  _DWORD *v9;

  if (!a2)
    return 6;
  v4 = *(_DWORD *)(a1 + 128);
  if ((unint64_t)(*(_QWORD *)(a1 + 104) + 4 * v4) >= *(_QWORD *)(a1 + 112)
    && !sub_20952CA08(a1, v4))
  {
    return 6;
  }
  v5 = *(_DWORD *)(a1 + 120);
  if (v4 == 1)
  {
    if (!v5 || (v6 = *(_DWORD **)(a1 + 96), (unint64_t)v6 >= *(_QWORD *)(a1 + 104)))
    {
      sub_20952C998(a1, 1);
      v6 = *(_DWORD **)(a1 + 96);
    }
    *v6 = a2;
    *(_QWORD *)(a1 + 96) = v6 + 1;
    sub_209538B5C(a1);
  }
  else
  {
    if (v5 != 2)
      sub_20952C998(a1, *(_DWORD *)(a1 + 128));
    if (v4)
    {
      v9 = *(_DWORD **)(a1 + 96);
      v8 = *(_QWORD *)(a1 + 104);
      do
      {
        if ((unint64_t)v9 >= v8)
          break;
        *v9++ = a2;
        *(_QWORD *)(a1 + 96) = v9;
        --v4;
      }
      while (v4);
    }
    sub_209537D30(a1);
  }
  if (*(_DWORD *)(a1 + 120) == 2)
    return sub_20953E194(a1);
  else
    return 0;
}

uint64_t sub_20952D8F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  _DWORD *v6;
  unint64_t v7;
  unsigned int *v8;
  int v9;
  unsigned int *v10;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 88);
  if (v2 == v3)
    return 6;
  v4 = sub_20952CEC0(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  v5 = v4;
  v6 = *(_DWORD **)(a1 + 936);
  v7 = *(_QWORD *)(a1 + 96);
  if ((unint64_t)v4 < v7)
  {
    v8 = v4;
    do
    {
      v9 = *v8++;
      *v6++ = v9;
    }
    while ((unint64_t)v8 < v7);
  }
  *(_QWORD *)(a1 + 944) = v6;
  sub_20952CCA8((_QWORD *)a1, (v7 - (unint64_t)v4) >> 2);
  v10 = *(unsigned int **)(a1 + 88);
  if (v5 >= v10)
    v10 = v5;
  *(_QWORD *)(a1 + 96) = v10;
  return 4;
}

uint64_t sub_20952D984(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a1 + 96);
  if (v2 == *(_QWORD *)(a1 + 104))
  {
    if (*(_DWORD *)(a1 + 1096) != 1 || v2 == *(_QWORD *)(a1 + 88))
      return 6;
    *(_QWORD *)(a1 + 96) = v2 - 4;
  }
  sub_20952CBE8((_QWORD *)a1, *(_DWORD *)(a1 + 128));
  if (*(_DWORD *)(a1 + 1096) == 1)
  {
    v4 = *(_QWORD *)(a1 + 96);
    v3 = *(_QWORD *)(a1 + 104);
    if (v4 >= v3 && v4 > *(_QWORD *)(a1 + 88))
      *(_QWORD *)(a1 + 96) = v3 - 4;
  }
  return 4;
}

uint64_t sub_20952DA14(_QWORD *a1)
{
  _DWORD *v1;
  unint64_t v2;
  unint64_t v3;
  int *v4;
  int v5;

  v1 = (_DWORD *)a1[117];
  v2 = a1[12];
  v3 = a1[13];
  if (v2 < v3)
  {
    v4 = (int *)a1[12];
    do
    {
      v5 = *v4++;
      *v1++ = v5;
    }
    while ((unint64_t)v4 < v3);
  }
  a1[118] = v1;
  a1[13] = v2;
  return 4;
}

uint64_t sub_20952DA48(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) == 1)
  {
    if (*(_DWORD *)(a1 + 1000))
    {
      sub_20952D154(a1);
      return 4;
    }
    *(_QWORD *)(a1 + 96) = v1 - 4;
  }
  return 5;
}

uint64_t sub_20952DA8C(uint64_t a1)
{
  unsigned int *v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned int **)(a1 + 88);
  *(_QWORD *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) != 1)
    return 5;
  v3 = MEMORY[0x24BDAC740];
  while (1)
  {
    v4 = *v1;
    if (v4 > 0x7F)
      break;
    if ((*(_DWORD *)(v3 + 4 * v4 + 60) & 0x4000) == 0)
      goto LABEL_8;
LABEL_7:
    v1 = (unsigned int *)(*(_QWORD *)(a1 + 96) + 4);
    *(_QWORD *)(a1 + 96) = v1;
  }
  if (__maskrune(v4, 0x4000uLL))
    goto LABEL_7;
LABEL_8:
  if (*(_DWORD *)(a1 + 1000))
  {
    sub_20952D154(a1);
    return 4;
  }
  return 5;
}

uint64_t sub_20952DB1C(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = a1[12];
  v2 = a1[13];
  v3 = a1[11];
  if (v1 < v2)
  {
    if (v2 <= v3 + 4)
      return 6;
    v1 += 4;
    a1[12] = v1;
  }
  if (v1 > v3 + 4)
  {
    *(int32x2_t *)(v1 - 8) = vrev64_s32(*(int32x2_t *)(v1 - 8));
    return 4;
  }
  return 6;
}

uint64_t sub_20952DB68(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;

  v2 = *(_QWORD *)(a1 + 96);
  v1 = *(_QWORD *)(a1 + 104);
  if (v2 >= v1)
    return 6;
  v3 = *(_DWORD *)(a1 + 1096);
  if (v2 == v1 - 4)
  {
    if (v3 != 1)
    {
      v7 = v2 + 4 * *(int *)(a1 + 128);
      if (v7 <= v1)
        v1 = v7;
      *(_QWORD *)(a1 + 96) = v1;
      return 5;
    }
    if (*(_DWORD *)(a1 + 1000))
    {
      v5 = v2 + 4 * *(int *)(a1 + 128);
      if (v5 <= v1)
        v1 = v5;
      *(_QWORD *)(a1 + 96) = v1;
LABEL_12:
      if (*(_DWORD *)(a1 + 1000))
      {
        sub_20952D154(a1);
        return 4;
      }
      return 5;
    }
    return 6;
  }
  v4 = v2 + 4 * *(int *)(a1 + 128);
  if (v4 <= v1)
    v1 = v4;
  *(_QWORD *)(a1 + 96) = v1;
  if (v3 == 1)
    goto LABEL_12;
  return 5;
}

uint64_t sub_20952DC0C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 88);
  if (v2 == v3)
    return 6;
  *(_QWORD *)(a1 + 96) = sub_20952CEC0(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20952DC7C(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 88);
  v2 = *(_QWORD *)(a1 + 96);
  if (v2 <= v1)
    return 6;
  v3 = v2 - 4 * *(int *)(a1 + 128);
  if (v3 >= v1)
    v1 = v3;
  *(_QWORD *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20952DCD8(uint64_t a1)
{
  int v2;
  int v3;
  __int32 v5;

  v5 = 0;
  sub_20953D444(a1);
  v2 = el_wgetc((EditLine *)a1, &v5);
  v3 = v5;
  sub_20953D530(a1);
  if (v2 == 1)
    return sub_20952D7F4(a1, v3);
  sub_209538960(a1);
  **(_DWORD **)(a1 + 104) = 0;
  return 2;
}

uint64_t sub_20952DD54(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;

  if (a2 > 0xFF || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2 + 60) & 0x400) == 0)
    return 6;
  if (!*(_DWORD *)(a1 + 124))
    return sub_20952D7F4(a1, a2);
  if (*(_BYTE *)(a1 + 136) == 52)
  {
    v3 = a2 - 48;
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 128);
    if (v4 > 1000000)
      return 6;
    v3 = a2 + 10 * v4 - 48;
  }
  *(_DWORD *)(a1 + 128) = v3;
  return 3;
}

uint64_t sub_20952DDC4(uint64_t a1, unsigned int a2)
{
  int v2;

  if (a2 > 0xFF || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2 + 60) & 0x400) == 0)
    return 6;
  if (*(_DWORD *)(a1 + 124))
  {
    v2 = *(_DWORD *)(a1 + 128);
    if (v2 > 1000000)
      return 6;
    *(_DWORD *)(a1 + 128) = a2 + 10 * v2 - 48;
  }
  else
  {
    *(_DWORD *)(a1 + 124) = 1;
    *(_DWORD *)(a1 + 128) = a2 - 48;
  }
  return 3;
}

uint64_t sub_20952DE2C()
{
  return 6;
}

uint64_t sub_20952DE34()
{
  return 0;
}

uint64_t sub_20952DE3C()
{
  return 0;
}

uint64_t sub_20952DE44()
{
  return 0;
}

uint64_t sub_20952DE4C()
{
  return 0;
}

uint64_t sub_20952DE54()
{
  return 0;
}

uint64_t sub_20952DE5C()
{
  return 0;
}

uint64_t sub_20952DE64()
{
  return 0;
}

uint64_t sub_20952DE6C(uint64_t a1)
{
  _QWORD *v2;

  sub_209538960(a1);
  v2 = *(_QWORD **)(a1 + 104);
  *v2 = 10;
  *(_QWORD *)(a1 + 104) = (char *)v2 + 4;
  return 1;
}

uint64_t sub_20952DEA4(uint64_t a1)
{
  unint64_t v2;

  if (*(_QWORD *)(a1 + 96) <= *(_QWORD *)(a1 + 88))
    return 6;
  sub_20952CCA8((_QWORD *)a1, *(_DWORD *)(a1 + 128));
  v2 = *(_QWORD *)(a1 + 96) - 4 * *(int *)(a1 + 128);
  if (v2 < *(_QWORD *)(a1 + 88))
    v2 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 96) = v2;
  return 4;
}

uint64_t sub_20952DEF8(_QWORD *a1)
{
  sub_20953AC94(a1);
  sub_2095389C8((uint64_t)a1);
  return 4;
}

uint64_t sub_20952DF24()
{
  return 8;
}

uint64_t sub_20952DF2C(uint64_t a1)
{
  sub_20952D414(a1, 0);
  return 4;
}

uint64_t sub_20952DF48()
{
  return 0;
}

uint64_t sub_20952DF50(uint64_t a1)
{
  int v2;
  int v3;

  v2 = *(_DWORD *)(a1 + 1176);
  *(_QWORD *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  v3 = *(_DWORD *)(a1 + 1176);
  if (!v3)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(_QWORD *)(a1 + 1168) = *(_QWORD *)(a1 + 1152) + *(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88);
    v3 = *(_DWORD *)(a1 + 1176);
  }
  *(_DWORD *)(a1 + 1176) = v3 + *(_DWORD *)(a1 + 128);
  if (sub_2095308D8(a1) != 6)
    return 4;
  if (*(_DWORD *)(a1 + 1096) == 1)
    *(_DWORD *)(a1 + 1176) = v2;
  sub_2095308D8(a1);
  return 9;
}

uint64_t sub_20952DFF4(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  char v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t result;

  *(_QWORD *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  v1 = *(_DWORD *)(a1 + 128);
  v2 = *(_DWORD *)(a1 + 1176);
  v3 = __OFSUB__(v2, v1);
  v5 = v2 - v1;
  v4 = (v5 < 0) ^ v3;
  v6 = v5 & ~(v5 >> 31);
  if (v4)
    v7 = 9;
  else
    v7 = 4;
  *(_DWORD *)(a1 + 1176) = v6;
  LODWORD(result) = sub_2095308D8(a1);
  if ((_DWORD)result == 4)
    return v7;
  else
    return result;
}

uint64_t sub_20952E048(size_t a1)
{
  int v2;
  uint64_t v3;
  __int32 *v4;
  int v6;
  int v7;

  *(_DWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  v2 = *(_DWORD *)(a1 + 1176);
  if (v2 < 0)
  {
    *(_DWORD *)(a1 + 1176) = 0;
    return 6;
  }
  if (!v2)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(_QWORD *)(a1 + 1168) = *(_QWORD *)(a1 + 1152) + *(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88);
  }
  v3 = *(_QWORD *)(a1 + 1184);
  if (!v3)
    return 6;
  if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
  {
    v4 = sub_209530A9C(a1, 3);
    if (v4)
      goto LABEL_12;
    return 6;
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 1192))(v3) == -1)
    return 6;
  v4 = *(__int32 **)(a1 + 1208);
  if (!v4)
    return 6;
LABEL_12:
  sub_209539058(a1);
  if (*(int *)(a1 + 1176) >= 1)
  {
    v6 = 0;
    do
    {
      if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
      {
        v4 = sub_209530A9C(a1, 6);
      }
      else if ((*(unsigned int (**)(_QWORD, size_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 6) == -1)
      {
        v4 = 0;
      }
      else
      {
        v4 = *(__int32 **)(a1 + 1208);
      }
      ++v6;
    }
    while (v6 < *(_DWORD *)(a1 + 1176));
    if (v4)
    {
      v7 = v6 + 1;
      goto LABEL_23;
    }
    return 6;
  }
  v7 = 1;
LABEL_23:
  while (!wcsncmp(v4, *(const __int32 **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88)) >> 2)
       && !*(__int32 *)((char *)v4 + *(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88))
       || !sub_209539048(a1, v4))
  {
    if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
    {
      v4 = sub_209530A9C(a1, 6);
    }
    else
    {
      if ((*(unsigned int (**)(_QWORD, size_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 6) == -1)
        return 6;
      v4 = *(__int32 **)(a1 + 1208);
    }
    ++v7;
    if (!v4)
      return 6;
  }
  *(_DWORD *)(a1 + 1176) = v7;
  return sub_2095308D8(a1);
}

uint64_t sub_20952E24C(size_t a1)
{
  uint64_t v2;
  __int32 *v3;
  int v4;
  int v5;

  *(_DWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  if (!*(_DWORD *)(a1 + 1176))
    return 6;
  v2 = *(_QWORD *)(a1 + 1184);
  if (!v2)
    return 6;
  if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
  {
    v3 = sub_209530A9C(a1, 3);
    if (!v3)
      return 6;
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 1192))(v2) == -1)
      return 6;
    v3 = *(__int32 **)(a1 + 1208);
    if (!v3)
      return 6;
  }
  sub_209539058(a1);
  if (*(int *)(a1 + 1176) >= 2)
  {
    v4 = 0;
    v5 = 2;
    do
    {
      if (wcsncmp(v3, *(const __int32 **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88)) >> 2)
        || *(__int32 *)((char *)v3 + *(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88)))
      {
        if (sub_209539048(a1, v3))
          v4 = v5 - 1;
      }
      if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
      {
        v3 = sub_209530A9C(a1, 6);
      }
      else
      {
        if ((*(unsigned int (**)(_QWORD, size_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 6) == -1)break;
        v3 = *(__int32 **)(a1 + 1208);
      }
      if (v5 >= *(_DWORD *)(a1 + 1176))
        break;
      ++v5;
    }
    while (v3);
    if (v4)
      goto LABEL_23;
  }
  if (sub_209539048(a1, *(__int32 **)(a1 + 1152)))
  {
    v4 = 0;
LABEL_23:
    *(_DWORD *)(a1 + 1176) = v4;
    return sub_2095308D8(a1);
  }
  return 6;
}

uint64_t sub_20952E3E8(uint64_t a1)
{
  int v2;
  unint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  _DWORD *i;
  int v7;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *v12;
  BOOL v13;

  v2 = sub_20952D770(a1);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(_DWORD **)(a1 + 96);
  if (*v4 == 10)
    v5 = -1;
  else
    v5 = 0;
  for (i = &v4[v5]; (unint64_t)i >= v3; --i)
  {
    if (*i == 10)
    {
      v7 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v7 - 1;
      if (v7 < 2)
        goto LABEL_11;
    }
  }
  if (*(int *)(a1 + 128) > 0)
    return 6;
LABEL_11:
  v9 = i - 1;
  do
  {
    v10 = v9;
    if ((unint64_t)v9 < v3)
      break;
    --v9;
  }
  while (*v10 != 10);
  v11 = v10 + 1;
  do
  {
    v12 = v11;
    v13 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v13)
      break;
    if ((unint64_t)v11 >= *(_QWORD *)(a1 + 104))
      break;
    ++v11;
  }
  while (*v12 != 10);
  *(_QWORD *)(a1 + 96) = v12;
  return 5;
}

uint64_t sub_20952E4B4(uint64_t a1)
{
  int v2;
  unint64_t v3;
  _DWORD *v4;
  int v5;
  _DWORD *v7;
  _DWORD *v8;
  BOOL v9;

  v2 = sub_20952D770(a1);
  v4 = *(_DWORD **)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  while ((unint64_t)v4 < v3)
  {
    if (*v4 == 10)
    {
      v5 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v5 - 1;
      if (v5 < 2)
        goto LABEL_8;
    }
    ++v4;
  }
  if (*(int *)(a1 + 128) > 0)
    return 6;
LABEL_8:
  v7 = v4 + 1;
  do
  {
    v8 = v7;
    v9 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v9)
      break;
    if ((unint64_t)v7 >= v3)
      break;
    ++v7;
  }
  while (*v8 != 10);
  *(_QWORD *)(a1 + 96) = v8;
  return 5;
}

uint64_t sub_20952E54C()
{
  uint64_t v0;
  int v1;
  __int32 v3[1024];
  uint64_t v4;

  v0 = MEMORY[0x24BDAC7A8]();
  v4 = *MEMORY[0x24BDAC8D0];
  v1 = sub_20952D604(v0, (uint64_t)v3, dword_209541810);
  sub_20953A860(v0, 0xAu);
  if (v1 < 0 || (v3[v1] = 0, sub_2095335AC((EditLine *)v0, v3) == -1))
    el_beep_0((EditLine *)v0);
  *(_QWORD *)(v0 + 1064) = *(_QWORD *)(v0 + 1056);
  sub_2095389C8(v0);
  return 4;
}

EditLine *__cdecl el_init(const char *a1, FILE *a2, FILE *a3, FILE *a4)
{
  void *v8;
  uint64_t v9;
  __int32 *v10;
  __int32 *v11;
  char *v12;
  char *v13;

  v8 = malloc_type_malloc(0x548uLL, 0x10F2040B13C76DEuLL);
  v9 = (uint64_t)v8;
  if (!v8)
    return (EditLine *)v9;
  bzero(v8, 0x548uLL);
  *(_QWORD *)(v9 + 8) = a2;
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  *(_DWORD *)(v9 + 32) = fileno(a2);
  *(_DWORD *)(v9 + 36) = fileno(a3);
  *(_DWORD *)(v9 + 40) = fileno(a4);
  v10 = sub_20953ED48((__int32 *)a1, v9 + 1264);
  v11 = sub_20953FB74(v10);
  *(_QWORD *)v9 = v11;
  if (!v11)
  {
LABEL_13:
    free((void *)v9);
    return 0;
  }
  *(_DWORD *)(v9 + 44) = 0;
  v12 = setlocale(2, 0);
  if (v12 && (strcmp(v12, "C") || setlocale(2, (const char *)&unk_209547D1A)))
  {
    v13 = nl_langinfo(0);
    if (!strcmp(v13, "UTF-8"))
      *(_DWORD *)(v9 + 44) |= 0x10u;
  }
  if (sub_209539DC0((_QWORD *)v9) == -1)
  {
    free(*(void **)v9);
    goto LABEL_13;
  }
  sub_209531E68(v9);
  sub_2095328F4(v9);
  if (sub_20953C9E8(v9) == -1)
    *(_DWORD *)(v9 + 44) |= 2u;
  sub_20952D2C0(v9);
  sub_209538F1C(v9);
  sub_209530840((_QWORD *)v9);
  sub_209533B44(v9);
  sub_209539A8C(v9);
  sub_209533C24(v9);
  return (EditLine *)v9;
}

void el_end(EditLine *a1)
{
  if (a1)
  {
    sub_20953D3EC((uint64_t)a1);
    sub_20952D414((uint64_t)a1, 0);
    sub_20953A298((uint64_t)a1);
    sub_209531EE8((uint64_t)a1);
    sub_209532AB0((uint64_t)a1);
    sub_20953CD18((uint64_t)a1);
    sub_20952D494((uint64_t)a1);
    sub_209538F7C((uint64_t)a1);
    sub_2095308A0((uint64_t)a1);
    nullsub_1(a1);
    sub_209539B34((uint64_t)a1);
    free(*(void **)a1);
    free(*((void **)a1 + 158));
    free(*((void **)a1 + 160));
    free(*((void **)a1 + 162));
    free(*((void **)a1 + 164));
    free(a1);
  }
}

void el_reset(EditLine *a1)
{
  sub_20953D3EC((uint64_t)a1);
  sub_20952D414((uint64_t)a1, 0);
}

int el_wset(EditLine *a1, int a2, ...)
{
  int result;
  uint64_t v5;
  uint64_t v6;
  __int32 *v7;
  EditLine *v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  FILE *v14;
  int v15;
  int v16;
  int v17;
  va_list v18;
  _OWORD v19[10];
  uint64_t v20;
  char *v21;
  FILE *v22;
  uint64_t v23;
  va_list va1;
  va_list va;

  va_start(va1, a2);
  va_start(va, a2);
  v21 = va_arg(va1, char *);
  v22 = va_arg(va1, FILE *);
  v23 = va_arg(va1, _QWORD);
  v20 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return -1;
  va_copy(v18, va);
  result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      v7 = (__int32 *)v21;
      v8 = a1;
      v9 = 0;
      return sub_209533B94((uint64_t)v8, v7, v9, a2, 1);
    case 1:
      return sub_209539FAC((uint64_t)a1, v21);
    case 2:
      return sub_209532D34((uint64_t)a1, (__int32 *)v21);
    case 3:
      v10 = *((_DWORD *)a1 + 11);
      result = 0;
      if ((_DWORD)v21)
        v11 = v10 | 1;
      else
        v11 = v10 & 0xFFFFFFFE;
      goto LABEL_39;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      v5 = 1;
      memset(v19, 0, sizeof(v19));
      do
      {
        v6 = va_arg(v18, _QWORD);
        *((_QWORD *)v19 + v5) = v6;
        if (!v6)
          break;
        ++v5;
      }
      while (v5 != 20);
      switch(a2)
      {
        case 4:
          *(_QWORD *)&v19[0] = &unk_209541854;
          result = sub_209532DD8();
          break;
        case 5:
          *(_QWORD *)&v19[0] = &unk_209541868;
          result = sub_20953BA20((uint64_t)a1);
          break;
        case 6:
          *(_QWORD *)&v19[0] = &unk_209541884;
          result = sub_20953BBE8((uint64_t)a1, v5, (uint64_t)v19);
          break;
        case 7:
          *(_QWORD *)&v19[0] = &unk_20954189C;
          result = sub_20953BE78((uint64_t)a1, v5, (uint64_t)v19);
          break;
        case 8:
          *(_QWORD *)&v19[0] = &unk_2095418B8;
          result = sub_20953D590((uint64_t)a1, v5, (uint64_t)v19);
          break;
        default:
          abort();
      }
      return result;
    case 9:
      return sub_209533378((uint64_t)a1, (uint64_t)v21, (uint64_t)v22, v23);
    case 10:
      result = sub_2095308C8((uint64_t)a1, (uint64_t)v21, (uint64_t)v22);
      v11 = *((_DWORD *)a1 + 11) & 0xFFFFFFBF;
      goto LABEL_39;
    case 11:
      v12 = *((_DWORD *)a1 + 11);
      result = 0;
      if ((_DWORD)v21)
        v11 = v12 & 0xFFFFFFFB;
      else
        v11 = v12 | 4;
      goto LABEL_39;
    case 13:
      result = sub_209533E1C((uint64_t)a1, (uint64_t (*)(uint64_t, __int32 *))v21);
      v11 = *((_DWORD *)a1 + 11) & 0xFFFFFF7F;
LABEL_39:
      *((_DWORD *)a1 + 11) = v11;
      return result;
    case 14:
      result = 0;
      *((_QWORD *)a1 + 10) = v21;
      return result;
    case 15:
      v13 = *((_DWORD *)a1 + 11);
      if ((_DWORD)v21)
      {
        if ((v13 & 8) == 0)
        {
          *((_DWORD *)a1 + 11) = v13 | 8;
          sub_209533FF0((uint64_t)a1);
        }
      }
      else if ((v13 & 8) != 0)
      {
        *((_DWORD *)a1 + 11) = v13 & 0xFFFFFFF7;
        sub_209534074((uint64_t)a1);
      }
      return 0;
    case 16:
      if ((_DWORD)v21)
        sub_20953CEFC((uint64_t)a1);
      else
        sub_20953D3EC((uint64_t)a1);
      return 0;
    case 19:
      v14 = v22;
      if ((_DWORD)v21 == 2)
      {
        *((_QWORD *)a1 + 3) = v22;
        v16 = fileno(v14);
        result = 0;
        *((_DWORD *)a1 + 10) = v16;
      }
      else if ((_DWORD)v21 == 1)
      {
        *((_QWORD *)a1 + 2) = v22;
        v17 = fileno(v14);
        result = 0;
        *((_DWORD *)a1 + 9) = v17;
      }
      else
      {
        if ((_DWORD)v21)
          return -1;
        *((_QWORD *)a1 + 1) = v22;
        v15 = fileno(v14);
        result = 0;
        *((_DWORD *)a1 + 8) = v15;
      }
      break;
    case 20:
      sub_2095389C8((uint64_t)a1);
      sub_209537D30((uint64_t)a1);
      sub_20953B998((uint64_t)a1);
      return 0;
    case 21:
    case 22:
      v7 = (__int32 *)v21;
      v9 = (int)v22;
      v8 = a1;
      return sub_209533B94((uint64_t)v8, v7, v9, a2, 1);
    case 23:
      return sub_20952D7B8((uint64_t)a1, (uint64_t)v21, (uint64_t)v22);
    default:
      return result;
  }
  return result;
}

int el_wget(EditLine *a1, int a2, ...)
{
  int v3;
  uint64_t *v4;
  _DWORD *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  va_list v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  va_list va1;
  va_list va;

  va_start(va1, a2);
  va_start(va, a2);
  v26 = va_arg(va1, uint64_t *);
  v27 = va_arg(va1, _QWORD *);
  v25 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return -1;
  va_copy(v13, va);
  v3 = -1;
  switch(a2)
  {
    case 0:
    case 12:
      v4 = v26;
      v5 = 0;
      return sub_209533BE0((uint64_t)a1, v4, v5, a2);
    case 1:
      sub_20953ADAC((uint64_t)a1, v26);
      return 0;
    case 2:
      return sub_209532D9C((uint64_t)a1, v26);
    case 3:
      v3 = 0;
      v7 = *((_DWORD *)a1 + 11) & 1;
      goto LABEL_14;
    case 11:
      v3 = 0;
      v7 = ((*((_DWORD *)a1 + 11) >> 2) & 1) == 0;
      goto LABEL_14;
    case 13:
      v8 = sub_209533E38((uint64_t)a1);
      v3 = 0;
      *v26 = v8;
      return v3;
    case 14:
      v3 = 0;
      *v26 = *((_QWORD *)a1 + 10);
      return v3;
    case 15:
      v3 = 0;
      v7 = (*((_DWORD *)a1 + 11) >> 3) & 1;
LABEL_14:
      *(_DWORD *)v26 = v7;
      return v3;
    case 17:
      v24 = 0;
      v23 = 0u;
      v22 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = 1;
      v15 = 0u;
      do
      {
        v10 = va_arg(v13, char *);
        (&v14)[v9] = v10;
        if (!v10)
          break;
        ++v9;
      }
      while (v9 != 20);
      v14 = aGettc;
      return sub_20953BD64((uint64_t)a1, v9, (uint64_t)&v14);
    case 18:
      v3 = (int)v26;
      if ((_DWORD)v26 == 2)
      {
        v3 = 0;
        v11 = *((_QWORD *)a1 + 3);
      }
      else if ((_DWORD)v26 == 1)
      {
        v3 = 0;
        v11 = *((_QWORD *)a1 + 2);
      }
      else
      {
        if ((_DWORD)v26)
          return -1;
        v11 = *((_QWORD *)a1 + 1);
      }
      *v27 = v11;
      break;
    case 21:
    case 22:
      v4 = v26;
      v5 = v27;
      return sub_209533BE0((uint64_t)a1, v4, v5, a2);
    default:
      return v3;
  }
  return v3;
}

const LineInfoW *__cdecl el_wline(EditLine *a1)
{
  return (const LineInfoW *)((char *)a1 + 88);
}

int el_source(EditLine *a1, const char *a2)
{
  const char *v3;
  char *v4;
  FILE *v5;
  FILE *v6;
  int v7;
  uint64_t v8;
  __int32 *v9;
  __int32 *v10;
  __int32 *v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  const char *v15;
  size_t v16;
  char *v17;
  size_t v19;

  if (a2)
  {
    v3 = a2;
    v4 = 0;
  }
  else
  {
    if (issetugid())
      return -1;
    v14 = getenv("HOME");
    if (!v14)
      return -1;
    v15 = v14;
    v16 = strlen(v14) + 9;
    v17 = (char *)malloc_type_malloc(v16, 0x100004077774924uLL);
    if (!v17)
      return -1;
    v3 = v17;
    snprintf(v17, v16, "%s%s", v15, "/.editrc");
    v4 = (char *)v3;
  }
  v5 = fopen(v3, "r");
  if (!v5)
  {
    free(v4);
    return -1;
  }
  v6 = v5;
  v7 = 0;
  v19 = 0;
  v8 = MEMORY[0x24BDAC740];
  while (1)
  {
    v9 = (__int32 *)fgetln(v6, &v19);
    if (!v9)
      break;
    if (*(_BYTE *)v9 != 10)
    {
      v10 = sub_20953ED48(v9, (uint64_t)a1 + 1264);
      if (v10)
      {
        v11 = v10;
        if (v19 && v10[v19 - 1] == 10)
          --v19;
        v12 = *v10;
        if (v12)
        {
          while (v12 <= 0x7F)
          {
            if ((*(_DWORD *)(v8 + 4 * v12 + 60) & 0x4000) == 0)
              goto LABEL_19;
LABEL_16:
            v13 = v11[1];
            ++v11;
            v12 = v13;
            if (!v13)
              goto LABEL_17;
          }
          if (__maskrune(v12, 0x4000uLL))
            goto LABEL_16;
LABEL_19:
          if (*v11 != 35)
            goto LABEL_17;
        }
        else
        {
LABEL_17:
          v7 = sub_2095335AC(a1, v11);
          if (v7 == -1)
            break;
        }
      }
    }
  }
  free(v4);
  fclose(v6);
  return v7;
}

void el_resize(EditLine *a1)
{
  sigset_t v2;
  sigset_t v3;
  uint64_t v4;

  v4 = 0;
  v2 = 0x8000000;
  v3 = 0;
  sigprocmask(1, &v2, &v3);
  if (sub_20953B1AC((uint64_t)a1, (_DWORD *)&v4 + 1, &v4))
    sub_20953B28C((uint64_t)a1, SHIDWORD(v4), v4);
  sigprocmask(3, &v3, 0);
}

uint64_t sub_20952F114(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  const __int32 *v5;

  result = 0xFFFFFFFFLL;
  if (a2 == 2)
  {
    if (a3)
    {
      v5 = *(const __int32 **)(a3 + 8);
      if (v5)
      {
        if (!wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"o"))
        {
          *(_DWORD *)(a1 + 44) &= ~4u;
          sub_20953CEFC(a1);
          return 0;
        }
        else if (!wcscmp(v5, (const __int32 *)"o"))
        {
          sub_20953D3EC(a1);
          result = 0;
          *(_DWORD *)(a1 + 44) |= 4u;
        }
        else
        {
          return 0xFFFFFFFFLL;
        }
      }
    }
  }
  return result;
}

uint64_t sub_20952F1C8(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v5;

  v3 = *(_QWORD *)(a1 + 96);
  if (v3 == *(_QWORD *)(a1 + 104))
  {
    if (v3 == *(_QWORD *)(a1 + 88))
    {
      sub_20953B9A0(a1, a2);
      return 2;
    }
    else
    {
      el_beep_0((EditLine *)a1);
      return 6;
    }
  }
  else
  {
    if (*(_DWORD *)(a1 + 124))
      sub_20952CBE8((_QWORD *)a1, *(_DWORD *)(a1 + 128));
    else
      sub_20952CC78(a1);
    v5 = *(_QWORD *)(a1 + 104);
    if (*(_QWORD *)(a1 + 96) > v5)
      *(_QWORD *)(a1 + 96) = v5;
    return 4;
  }
}

uint64_t sub_20952F24C(uint64_t a1)
{
  unsigned int *v2;
  unint64_t v3;
  unsigned int *v4;
  unint64_t v5;
  _DWORD *v6;
  unsigned int *v7;
  int v8;
  unint64_t v9;

  v2 = *(unsigned int **)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  if (v2 == (unsigned int *)v3)
    return 6;
  v4 = sub_20952CF3C(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_DWORD **)(a1 + 936);
  if (v5 < (unint64_t)v4)
  {
    v7 = *(unsigned int **)(a1 + 96);
    do
    {
      v8 = *v7++;
      *v6++ = v8;
    }
    while (v7 < v4);
  }
  *(_QWORD *)(a1 + 944) = v6;
  sub_20952CBE8((_QWORD *)a1, ((unint64_t)v4 - v5) >> 2);
  v9 = *(_QWORD *)(a1 + 104);
  if (*(_QWORD *)(a1 + 96) > v9)
    *(_QWORD *)(a1 + 96) = v9;
  return 4;
}

uint64_t sub_20952F2DC(uint64_t a1)
{
  unint64_t v1;
  _DWORD *v3;
  int *v4;
  unint64_t v5;
  int v6;

  v1 = *(_QWORD *)(a1 + 944) - *(_QWORD *)(a1 + 936);
  if (!v1)
    return 0;
  if (*(_QWORD *)(a1 + 104) + v1 >= *(_QWORD *)(a1 + 112))
    return 6;
  v3 = *(_DWORD **)(a1 + 96);
  *(_QWORD *)(a1 + 952) = v3;
  sub_20952C998(a1, v1 >> 2);
  v4 = *(int **)(a1 + 936);
  v5 = *(_QWORD *)(a1 + 944);
  while ((unint64_t)v4 < v5)
  {
    v6 = *v4++;
    *v3++ = v6;
  }
  if (*(_DWORD *)(a1 + 128) == 1)
    *(_QWORD *)(a1 + 96) = v3;
  return 4;
}

uint64_t sub_20952F36C(_QWORD *a1)
{
  unint64_t v1;
  _DWORD *v2;
  unint64_t v3;
  int *v4;
  int v5;

  v1 = a1[11];
  v2 = (_DWORD *)a1[117];
  v3 = a1[13];
  if (v1 < v3)
  {
    v4 = (int *)a1[11];
    do
    {
      v5 = *v4++;
      *v2++ = v5;
    }
    while ((unint64_t)v4 < v3);
  }
  a1[118] = v2;
  a1[12] = v1;
  a1[13] = v1;
  return 4;
}

uint64_t sub_20952F3A4(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  int *v7;
  int v8;

  v1 = a1[119];
  if (!v1)
    return 6;
  v3 = a1[12];
  v4 = (_DWORD *)a1[117];
  if (v1 <= v3)
  {
    v7 = (int *)a1[119];
    if (v1 < v3)
    {
      do
      {
        v8 = *v7++;
        *v4++ = v8;
      }
      while ((unint64_t)v7 < v3);
    }
    a1[118] = v4;
    sub_20952CCA8(a1, ((unint64_t)v7 - v1) >> 2);
    a1[12] = a1[119];
  }
  else
  {
    v5 = 0;
    do
    {
      v4[v5] = *(_DWORD *)(v3 + v5 * 4);
      ++v5;
    }
    while (v3 + v5 * 4 < v1);
    a1[118] = &v4[v5];
    sub_20952CBE8(a1, (unint64_t)(v5 * 4) >> 2);
  }
  return 4;
}

uint64_t sub_20952F44C(_QWORD *a1)
{
  int *v1;
  int *v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int v6;

  v1 = (int *)a1[119];
  if (!v1)
    return 6;
  v2 = (int *)a1[12];
  v3 = (_DWORD *)a1[117];
  if (v1 <= v2)
  {
    for (; v1 < v2; ++v3)
    {
      v6 = *v1++;
      *v3 = v6;
    }
  }
  else
  {
    do
    {
      v4 = *v2++;
      *v3++ = v4;
    }
    while (v2 < v1);
  }
  v5 = 0;
  a1[118] = v3;
  return v5;
}

uint64_t sub_20952F4A4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 96);
  if (v1 <= *(_QWORD *)(a1 + 88) + 4)
    return 6;
  *(int32x2_t *)(v1 - 8) = vrev64_s32(*(int32x2_t *)(v1 - 8));
  return 4;
}

uint64_t sub_20952F4D0(uint64_t a1)
{
  unsigned int *v2;
  unint64_t v3;

  v2 = *(unsigned int **)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  if (v2 == (unsigned int *)v3)
    return 6;
  *(_QWORD *)(a1 + 96) = sub_20952CF3C(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20952F540(uint64_t a1)
{
  unsigned int *v2;
  __darwin_ct_rune_t *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;

  v2 = sub_20952CF3C(*(unsigned int **)(a1 + 96), *(_QWORD *)(a1 + 104), *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    v4 = MEMORY[0x24BDAC740];
    while (1)
    {
      v5 = *v3;
      if (v5 <= 0x7F)
        break;
      if (__maskrune(v5, 0x1000uLL))
        goto LABEL_7;
LABEL_8:
      if (++v3 >= (__darwin_ct_rune_t *)v2)
        goto LABEL_9;
    }
    if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x1000) == 0)
      goto LABEL_8;
LABEL_7:
    *v3 = __toupper(*v3);
    goto LABEL_8;
  }
LABEL_9:
  v6 = *(unsigned int **)(a1 + 104);
  if (v2 <= v6)
    v6 = v2;
  *(_QWORD *)(a1 + 96) = v6;
  return 4;
}

uint64_t sub_20952F5EC(uint64_t a1)
{
  unsigned int *v2;
  __darwin_ct_rune_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;

  v2 = sub_20952CF3C(*(unsigned int **)(a1 + 96), *(_QWORD *)(a1 + 104), *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    v4 = MEMORY[0x24BDAC740];
    do
    {
      v5 = *v3;
      if (v5 > 0x7F)
      {
        if (__maskrune(v5, 0x100uLL))
        {
LABEL_9:
          v6 = *v3;
          if (v6 > 0x7F)
          {
            if (!__maskrune(v6, 0x1000uLL))
              goto LABEL_14;
          }
          else if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x1000) == 0)
          {
LABEL_14:
            ++v3;
            break;
          }
          *v3 = __toupper(*v3);
          goto LABEL_14;
        }
      }
      else if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x100) != 0)
      {
        goto LABEL_9;
      }
      ++v3;
    }
    while (v3 < (__darwin_ct_rune_t *)v2);
  }
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    v7 = MEMORY[0x24BDAC740];
    while (1)
    {
      v8 = *v3;
      if (v8 <= 0x7F)
        break;
      if (__maskrune(v8, 0x8000uLL))
        goto LABEL_21;
LABEL_22:
      if (++v3 >= (__darwin_ct_rune_t *)v2)
        goto LABEL_23;
    }
    if ((*(_DWORD *)(v7 + 4 * v8 + 60) & 0x8000) == 0)
      goto LABEL_22;
LABEL_21:
    *v3 = __tolower(*v3);
    goto LABEL_22;
  }
LABEL_23:
  v9 = *(unsigned int **)(a1 + 104);
  if (v2 <= v9)
    v9 = v2;
  *(_QWORD *)(a1 + 96) = v9;
  return 4;
}

uint64_t sub_20952F720(uint64_t a1)
{
  unsigned int *v2;
  __darwin_ct_rune_t *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;

  v2 = sub_20952CF3C(*(unsigned int **)(a1 + 96), *(_QWORD *)(a1 + 104), *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    v4 = MEMORY[0x24BDAC740];
    while (1)
    {
      v5 = *v3;
      if (v5 <= 0x7F)
        break;
      if (__maskrune(v5, 0x8000uLL))
        goto LABEL_7;
LABEL_8:
      if (++v3 >= (__darwin_ct_rune_t *)v2)
        goto LABEL_9;
    }
    if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x8000) == 0)
      goto LABEL_8;
LABEL_7:
    *v3 = __tolower(*v3);
    goto LABEL_8;
  }
LABEL_9:
  v6 = *(unsigned int **)(a1 + 104);
  if (v2 <= v6)
    v6 = v2;
  *(_QWORD *)(a1 + 96) = v6;
  return 4;
}

uint64_t sub_20952F7CC(uint64_t a1)
{
  *(_QWORD *)(a1 + 952) = *(_QWORD *)(a1 + 96);
  return 0;
}

uint64_t sub_20952F7DC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 952);
  *(_QWORD *)(a1 + 952) = v1;
  return 5;
}

uint64_t sub_20952F7F4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 128);
  if (v1 > 1000000)
    return 6;
  *(_DWORD *)(a1 + 124) = 1;
  *(_DWORD *)(a1 + 128) = 4 * v1;
  return 3;
}

uint64_t sub_20952F824(uint64_t a1)
{
  *(_DWORD *)(a1 + 132) = 1;
  return 3;
}

uint64_t sub_20952F834(uint64_t a1)
{
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a1 + 120) == 0;
  return 0;
}

uint64_t sub_20952F84C(uint64_t a1)
{
  unint64_t v1;
  unsigned int *v2;
  unsigned int *v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int v7;

  v1 = *(_QWORD *)(a1 + 88);
  v2 = *(unsigned int **)(a1 + 96);
  if (v2 == (unsigned int *)v1)
    return 6;
  v4 = sub_20952CEC0(*(_QWORD *)(a1 + 96), v1, *(_DWORD *)(a1 + 128), (unsigned int (*)(_QWORD))sub_20952CD8C);
  sub_20952C998(a1, (unint64_t)((char *)v2 - (char *)v4) >> 2);
  if (v2 <= v4)
  {
    v6 = v2;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 104);
    v6 = v2;
    do
    {
      if ((unint64_t)v6 >= v5)
        break;
      v7 = *v4++;
      *v6++ = v7;
    }
    while (v4 < v2);
  }
  *(_QWORD *)(a1 + 96) = v6;
  return 4;
}

uint64_t sub_20952F8E4(size_t a1)
{
  *(_QWORD *)(a1 + 1224) = 0;
  return sub_2095390F0(a1, 22);
}

uint64_t sub_20952F8F0(size_t a1)
{
  *(_QWORD *)(a1 + 1224) = 0;
  return sub_2095390F0(a1, 23);
}

uint64_t sub_20952F8FC(uint64_t a1)
{
  unint64_t v3;

  if (*(_QWORD *)(a1 + 96) <= *(_QWORD *)(a1 + 88))
    return 6;
  if (*(_DWORD *)(a1 + 124))
    sub_20952CCA8((_QWORD *)a1, *(_DWORD *)(a1 + 128));
  else
    sub_20952CD58(a1);
  v3 = *(_QWORD *)(a1 + 96) - 4 * *(int *)(a1 + 128);
  if (v3 < *(_QWORD *)(a1 + 88))
    v3 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 96) = v3;
  return 4;
}

char *__cdecl tilde_expand_0(char *a1)
{
  char *v2;
  int64_t v3;
  size_t v4;
  char *v5;
  char *v6;
  char *v8;
  const char *v9;
  size_t v10;
  size_t v11;
  char *v12;
  char *v13;
  uid_t v14;
  passwd *v15;
  passwd v16;
  char v17[1024];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*a1 != 126)
    return strdup(a1);
  memset(&v16, 0, sizeof(v16));
  v15 = 0;
  v2 = strchr(a1 + 1, 47);
  if (v2)
  {
    v3 = v2 - a1;
    v4 = v2 - a1 + 1;
    v5 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
    if (v5)
    {
      v6 = v5;
      strncpy(v5, a1 + 1, v3 - 1)[v3 - 1] = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v8 = strdup(a1 + 1);
    if (v8)
    {
      v6 = v8;
      v4 = 0;
LABEL_8:
      if (*v6)
      {
        if (!getpwnam_r(v6, &v16, v17, 0x400uLL, &v15))
          goto LABEL_11;
      }
      else
      {
        v14 = getuid();
        if (!getpwuid_r(v14, &v16, v17, 0x400uLL, &v15))
        {
LABEL_11:
          free(v6);
          if (!v15)
            return strdup(a1);
          v9 = &a1[v4];
          v10 = strlen(v15->pw_dir);
          v11 = v10 + strlen(v9) + 2;
          v12 = (char *)malloc_type_malloc(v11, 0x100004077774924uLL);
          v13 = v12;
          if (v12)
            snprintf(v12, v11, "%s/%s", v15->pw_dir, v9);
          return v13;
        }
      }
      v15 = 0;
      goto LABEL_11;
    }
  }
  return 0;
}

char *__cdecl filename_completion_function_0(const char *a1, int a2)
{
  DIR *v3;
  dirent *v4;
  int v5;
  const char *d_name;
  unint64_t d_namlen;
  char *v8;
  char *v9;
  const char *v10;
  size_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  const char *v18;
  char *v19;
  DIR *v20;
  size_t v21;

  v3 = (DIR *)qword_25459AC70;
  if (a2 && qword_25459AC70)
    goto LABEL_3;
  v9 = strrchr((char *)a1, 47);
  if (!v9)
  {
    free((void *)qword_25459AC78);
    if (*a1)
    {
      qword_25459AC78 = (uint64_t)strdup(a1);
      if (!qword_25459AC78)
        return 0;
    }
    else
    {
      qword_25459AC78 = 0;
    }
    free((void *)qword_25459AC80);
    v15 = 0;
    qword_25459AC80 = 0;
    if (!v3)
      goto LABEL_30;
    goto LABEL_29;
  }
  v10 = v9 + 1;
  v11 = strlen(v9 + 1);
  v12 = (char *)malloc_type_realloc((void *)qword_25459AC78, v11 + 1, 0x100004077774924uLL);
  if (!v12)
  {
    free((void *)qword_25459AC78);
    v8 = 0;
    qword_25459AC78 = 0;
    return v8;
  }
  qword_25459AC78 = (uint64_t)v12;
  strcpy(v12, v10);
  v13 = v10 - a1;
  v14 = (char *)malloc_type_realloc((void *)qword_25459AC80, v13 + 1, 0x100004077774924uLL);
  if (!v14)
  {
    free((void *)qword_25459AC80);
    v8 = 0;
    qword_25459AC80 = 0;
    return v8;
  }
  v15 = v14;
  qword_25459AC80 = (uint64_t)v14;
  strncpy(v14, a1, v13)[v13] = 0;
  v3 = (DIR *)qword_25459AC70;
  if (qword_25459AC70)
  {
LABEL_29:
    closedir(v3);
    qword_25459AC70 = 0;
    v15 = (char *)qword_25459AC80;
  }
LABEL_30:
  free((void *)qword_25459AC88);
  qword_25459AC88 = 0;
  if (!v15)
  {
    qword_25459AC80 = (uint64_t)strdup((const char *)&unk_209547D1A);
    if (qword_25459AC80)
    {
      v18 = "./";
      goto LABEL_35;
    }
    return 0;
  }
  v18 = v15;
  if (*v15 != 126)
  {
LABEL_35:
    v19 = strdup(v18);
    goto LABEL_36;
  }
  v19 = tilde_expand_0(v15);
LABEL_36:
  qword_25459AC88 = (uint64_t)v19;
  if (!v19)
    return 0;
  v20 = opendir(v19);
  qword_25459AC70 = (uint64_t)v20;
  if (!v20)
    return 0;
  v3 = v20;
  v21 = qword_25459AC78;
  if (qword_25459AC78)
    v21 = strlen((const char *)qword_25459AC78);
  qword_25459AC90 = v21;
LABEL_3:
  v4 = readdir(v3);
  if (!v4)
  {
LABEL_13:
    closedir((DIR *)qword_25459AC70);
    v8 = 0;
    qword_25459AC70 = 0;
    return v8;
  }
  while (1)
  {
    d_name = v4->d_name;
    v5 = v4->d_name[0];
    if (v5 == 46 && (!v4->d_name[1] || v4->d_name[1] == 46 && !v4->d_name[2]))
      goto LABEL_12;
    if (!qword_25459AC90)
      break;
    if (v5 == *(unsigned __int8 *)qword_25459AC78)
    {
      d_namlen = v4->d_namlen;
      if (qword_25459AC90 <= d_namlen && !strncmp(v4->d_name, (const char *)qword_25459AC78, qword_25459AC90))
        goto LABEL_23;
    }
LABEL_12:
    v4 = readdir((DIR *)qword_25459AC70);
    if (!v4)
      goto LABEL_13;
  }
  d_namlen = v4->d_namlen;
LABEL_23:
  v16 = d_namlen + strlen((const char *)qword_25459AC80) + 1;
  v17 = (char *)malloc_type_malloc(v16, 0x100004077774924uLL);
  v8 = v17;
  if (v17)
    snprintf(v17, v16, "%s%s", (const char *)qword_25459AC80, d_name);
  return v8;
}

char **__cdecl completion_matches(const char *a1, CPFunction *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  char *v15;
  unint64_t i;

  v4 = ((uint64_t (*)(const char *, _QWORD))a2)(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = v6;
      if (v6 + 3 >= v8)
      {
        do
        {
          v11 = v8;
          v8 *= 2;
        }
        while (v6 + 3 >= v11);
        v10 = malloc_type_realloc(v7, 8 * v11, 0x10040436913F5uLL);
        if (!v10)
        {
          free(v7);
          return (char **)v10;
        }
      }
      else
      {
        v10 = v7;
        v11 = v8;
      }
      ++v6;
      *((_QWORD *)v10 + v9 + 1) = v5;
      v5 = ((uint64_t (*)(const char *, unint64_t))a2)(a1, v9 + 1);
      v8 = v11;
      v7 = v10;
    }
    while (v5);
    v12 = strlen(*((const char **)v10 + 1));
    if (v6 >= 2)
    {
      for (i = 2; i <= v6; ++i)
      {
        v13 = 0;
        if (v12)
        {
          while (*(unsigned __int8 *)(*((_QWORD *)v10 + 1) + v13) == *(unsigned __int8 *)(*((_QWORD *)v10 + i) + v13))
          {
            if (v12 == ++v13)
            {
              v13 = v12;
              break;
            }
          }
        }
        v12 = v13;
      }
    }
    else
    {
      v13 = v12;
    }
    v14 = (char *)malloc_type_malloc(v13 + 1, 0x100004077774924uLL);
    if (v14)
    {
      v15 = strncpy(v14, *((const char **)v10 + 1), v13);
      v15[v13] = 0;
      *(_QWORD *)v10 = v15;
      *((_QWORD *)v10 + v9 + 2) = 0;
      return (char **)v10;
    }
    free(v10);
  }
  return 0;
}

void sub_20952FFA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  const char *v19;
  uint64_t v20;

  v4 = a4;
  v6 = *(int *)(a1 + 152);
  v7 = a2 + 8;
  v8 = a3 - 1;
  if (a4 + 1 > v6)
    v9 = 1;
  else
    v9 = v6 / (a4 + 1);
  v10 = a3 - 2 + v9;
  v11 = __CFADD__(a3 - 2, v9);
  qsort((void *)(a2 + 8), a3 - 1, 8uLL, (int (__cdecl *)(const void *, const void *))sub_2095300C0);
  if (!v11)
  {
    v12 = 0;
    v13 = v10 / v9;
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    v20 = v14;
    do
    {
      v15 = 0;
      do
      {
        v16 = v12 + v15 * v13;
        if (v16 >= v8)
          break;
        v17 = v15 + 1;
        v18 = v15 == 0;
        v19 = " ";
        if (v18)
          v19 = (const char *)&unk_209547D1A;
        fprintf(*(FILE **)(a1 + 16), "%s%-*s", v19, v4, *(const char **)(v7 + 8 * v16));
        v15 = v17;
      }
      while (v9 != v17);
      fputc(10, *(FILE **)(a1 + 16));
      ++v12;
    }
    while (v12 != v20);
  }
}

uint64_t sub_2095300C0(const char **a1, const char **a2)
{
  return strcasecmp(*a1, *a2);
}

uint64_t sub_2095300CC(EditLine *a1, char *(__cdecl *a2)(const char *, int), uint64_t (*a3)(char *, _QWORD), __int32 *a4, __int32 *a5, const char *(*a6)(char *a1), unint64_t a7, int *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, uint64_t (*a12)(const __int32 *, const __int32 *), char *a13, uint64_t (*a14)(void))
{
  int v18;
  int v19;
  int v20;
  char *(__cdecl *v21)(const char *, int);
  const char *(*v22)(char *);
  const LineInfoW *v23;
  const LineInfoW *v24;
  unint64_t cursor;
  const __int32 *v26;
  __int32 v27;
  char *v28;
  const LineInfo *v29;
  unsigned int *buffer;
  uint64_t v31;
  unsigned int v32;
  size_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char **v37;
  const char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  __int32 *v42;
  const char *v43;
  uint64_t v44;
  unint64_t v45;
  size_t v46;
  uint64_t v47;
  int v48;
  char *v49;
  _BOOL4 v50;
  const char *v51;
  __int32 *v52;
  __int32 *v53;
  char *v54;
  char **v55;
  char *v56;
  const char *(*v58)(char *);
  int v60;
  int v61;

  v18 = *((unsigned __int8 *)a1 + 136);
  v19 = *((unsigned __int8 *)a1 + 137);
  if (a8)
  {
    if (v18 == v19)
      v20 = 63;
    else
      v20 = 9;
    *a8 = v20;
  }
  v60 = v19;
  v61 = v18;
  if (a2)
    v21 = a2;
  else
    v21 = filename_completion_function_0;
  v22 = sub_2095304C0;
  if (a6)
    v22 = a6;
  v58 = v22;
  v23 = el_wline(a1);
  v24 = v23;
  if (a12)
  {
    cursor = a12(v23->buffer, v23->cursor);
  }
  else
  {
    cursor = (unint64_t)v23->cursor;
    if ((const __int32 *)cursor > v23->buffer)
    {
      v26 = v23->cursor;
      do
      {
        v27 = *--v26;
        if (wcschr(a4, v27) || a5 && wcschr(a5, *(_DWORD *)(cursor - 4)))
          break;
        cursor = (unint64_t)v26;
      }
      while (v26 > v24->buffer);
    }
  }
  v28 = a13;
  v29 = el_line(a1);
  buffer = (unsigned int *)v24->buffer;
  if (v24->buffer >= (const __int32 *)cursor)
  {
    v31 = 0;
  }
  else
  {
    v31 = 0;
    do
    {
      v32 = *buffer++;
      v31 += sub_20953EF00(v32);
    }
    while ((unint64_t)buffer < cursor);
  }
  v33 = v29->cursor - &v29->buffer[v31];
  rl_line_buffer = (char *)v29->buffer;
  v34 = (char *)malloc_type_malloc(v33 + 1, 0x100004077774924uLL);
  strncpy(v34, &v29->buffer[v31], v33)[v33] = 0;
  if (!a13 || (v28 = (char *)((uint64_t (*)(char *))a13)(v34)) != 0)
  {
    if (a10)
      *a10 = LODWORD(v29->cursor) - LODWORD(v29->buffer);
    if (a11)
      *a11 = LODWORD(v29->lastchar) - LODWORD(v29->buffer);
    if (a3)
    {
      if (v28)
        v35 = v28;
      else
        v35 = v34;
      v36 = a3(v35, (LODWORD(v29->cursor) - LODWORD(v29->buffer) - v33));
      v37 = (char **)v36;
      if (!a9)
        goto LABEL_42;
      if (*a9 || v36)
      {
LABEL_41:
        *a9 = 0;
        goto LABEL_42;
      }
    }
    if (v28)
      v38 = v28;
    else
      v38 = v34;
    v37 = completion_matches(v38, v21);
    if (a9)
      goto LABEL_41;
LABEL_42:
    if (!v37)
    {
      v40 = 0;
LABEL_76:
      free(v28);
      free(v34);
      return v40;
    }
    if (**v37)
    {
      if (a14)
      {
        v39 = (char *)a14();
        if (!v39)
          goto LABEL_71;
      }
      else
      {
        v39 = 0;
      }
      el_deletestr(a1, ((unint64_t)v24->cursor - cursor) >> 2);
      v41 = v39;
      if (!v39)
        v41 = *v37;
      v42 = sub_20953ED48((__int32 *)v41, (uint64_t)a1 + 1264);
      el_winsertstr(a1, v42);
      free(v39);
    }
    if (v61 != v60)
    {
      if (v37[2])
      {
        v49 = *v37;
      }
      else
      {
        v49 = *v37;
        v51 = v37[1];
        if (!v51 || !strcmp(*v37, v51))
        {
          v52 = (__int32 *)v58(v49);
          v53 = sub_20953ED48(v52, (uint64_t)a1 + 1264);
          el_winsertstr(a1, v53);
LABEL_71:
          v40 = 4;
          goto LABEL_72;
        }
      }
      v50 = *v49 != 0;
      el_beep(a1);
      v40 = (4 * v50);
LABEL_72:
      v54 = *v37;
      if (*v37)
      {
        v55 = v37 + 1;
        do
        {
          free(v54);
          v56 = *v55++;
          v54 = v56;
        }
        while (v56);
      }
      free(v37);
      goto LABEL_76;
    }
    v43 = v37[1];
    if (v43)
    {
      v44 = 0;
      v45 = 0;
      do
      {
        v46 = strlen(v43);
        if (v46 > v45)
          v45 = v46;
        v43 = v37[v44++ + 2];
      }
      while (v43);
      v47 = v44;
      fputc(10, *((FILE **)a1 + 2));
      if (v44 > a7)
      {
        fprintf(*((FILE **)a1 + 2), "Display all %zu possibilities? (y or n) ", v44);
        fflush(*((FILE **)a1 + 2));
        v48 = getc((FILE *)*MEMORY[0x24BDAC8E0]);
        fputc(10, *((FILE **)a1 + 2));
        if (v48 != 121)
          goto LABEL_67;
      }
    }
    else
    {
      fputc(10, *((FILE **)a1 + 2));
      v45 = 0;
      v47 = 0;
    }
    sub_20952FFA8((uint64_t)a1, (uint64_t)v37, v47 + 1, v45);
LABEL_67:
    v40 = 8;
    goto LABEL_72;
  }
  return 0;
}

const char *sub_2095304C0(char *a1)
{
  char *v2;
  const char *v3;
  int v4;
  mode_t st_mode;
  const char *v6;
  stat v8;

  if (*a1 == 126)
    v2 = tilde_expand_0(a1);
  else
    v2 = 0;
  memset(&v8.st_uid, 0, 128);
  if (v2)
    v3 = v2;
  else
    v3 = a1;
  *(_OWORD *)&v8.st_dev = 0uLL;
  v4 = stat(v3, &v8);
  st_mode = v8.st_mode;
  if (v2)
    free(v2);
  v6 = "/";
  if ((st_mode & 0xF000) != 0x4000)
    v6 = " ";
  if (v4 == -1)
    return " ";
  else
    return v6;
}

unsigned __int8 _el_fn_complete(EditLine *a1, int a2)
{
  return sub_2095300CC(a1, 0, 0, (__int32 *)" ", 0, 0, 0x64uLL, 0, 0, 0, 0, 0, 0, 0);
}

unsigned __int8 _el_fn_sh_complete(EditLine *a1, int a2)
{
  return sub_2095300CC(a1, 0, 0, (__int32 *)" ", 0, 0, 0x64uLL, 0, 0, 0, 0, (uint64_t (*)(const __int32 *, const __int32 *))sub_20953061C, (char *)sub_209530690, (uint64_t (*)(void))sub_209530734);
}

__int32 *sub_20953061C(__int32 *a1, unint64_t a2)
{
  __int32 *v2;
  __int32 *v4;

  v2 = a1;
  if ((unint64_t)a1 < a2)
  {
    v4 = a1;
    do
    {
      if (*v4 == 92)
      {
        ++v4;
      }
      else if (wcschr((__int32 *)" ", *v4))
      {
        v2 = v4 + 1;
      }
      ++v4;
    }
    while ((unint64_t)v4 < a2);
  }
  return v2;
}

_WORD *sub_209530690(const char *a1)
{
  const char *v1;
  size_t v2;
  _WORD *result;
  _BYTE *v4;
  int v5;
  int v6;

  v1 = a1;
  v2 = strlen(a1);
  result = malloc_type_malloc(v2 + 2, 0x100004077774924uLL);
  if (result)
  {
    if (*v1 == 92)
    {
      v4 = result;
      if (v1[1] == 126)
      {
        *result = 12078;
        v4 = result + 1;
        ++v1;
      }
    }
    else
    {
      v4 = result;
    }
    while (1)
    {
      v5 = *(unsigned __int8 *)v1;
      if (v5 == 92)
      {
        v6 = *(unsigned __int8 *)++v1;
        LOBYTE(v5) = v6;
        if (v6)
          goto LABEL_8;
      }
      else
      {
        if (!*v1)
        {
          *v4 = 0;
          return result;
        }
LABEL_8:
        ++v1;
        *v4++ = v5;
      }
    }
  }
  return result;
}

_BYTE *sub_209530734(_BYTE *a1)
{
  const char *v1;
  char v2;
  int v3;
  unsigned __int8 *v4;
  int v5;
  size_t v6;
  _BYTE *v7;
  _BYTE *v8;
  char v9;
  char *v10;
  int v11;

  v1 = a1;
  v2 = *a1;
  if (*a1)
  {
    v3 = 0;
    v4 = a1 + 1;
    do
    {
      if (wcschr((__int32 *)" ", v2) || wcschr((__int32 *)")", (char)*(v4 - 1)))
        ++v3;
      v5 = *v4++;
      v2 = v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }
  v6 = strlen(v1);
  v7 = malloc_type_malloc(v6 + v3 + 1, 0x100004077774924uLL);
  v8 = v7;
  if (v7)
  {
    v9 = *v1;
    v10 = v7;
    if (*v1)
    {
      v10 = v7;
      do
      {
        if (wcschr((__int32 *)" ", v9) || wcschr((__int32 *)")", *v1))
          *v10++ = 92;
        *v10++ = *v1;
        v11 = *(unsigned __int8 *)++v1;
        v9 = v11;
      }
      while (v11);
    }
    *v10 = 0;
  }
  return v8;
}

uint64_t sub_209530840(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  a1[149] = 0;
  a1[148] = 0;
  v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  a1[144] = v2;
  a1[145] = 1024;
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  result = 0;
  a1[146] = v3;
  return result;
}

void sub_2095308A0(uint64_t a1)
{
  free(*(void **)(a1 + 1152));
  *(_QWORD *)(a1 + 1152) = 0;
}

uint64_t sub_2095308C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 1184) = a3;
  *(_QWORD *)(a1 + 1192) = a2;
  return 0;
}

uint64_t sub_2095308D8(uint64_t a1)
{
  uint64_t v2;
  __int32 *v3;
  const __int32 *v4;
  char *v5;
  int v6;
  const __int32 *v7;
  int64_t v8;

  if (!*(_DWORD *)(a1 + 1176))
  {
    wcsncpy(*(__int32 **)(a1 + 88), *(const __int32 **)(a1 + 1152), *(_QWORD *)(a1 + 1160));
    v4 = *(const __int32 **)(a1 + 88);
    v5 = (char *)v4 + *(_QWORD *)(a1 + 1168) - *(_QWORD *)(a1 + 1152);
    *(_QWORD *)(a1 + 104) = v5;
    if (*(_DWORD *)(a1 + 1096) != 1)
    {
      *(_QWORD *)(a1 + 96) = v5;
      return 4;
    }
LABEL_26:
    *(_QWORD *)(a1 + 96) = v4;
    return 4;
  }
  v2 = *(_QWORD *)(a1 + 1184);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 44) & 0x40) == 0)
    {
      if ((*(unsigned int (**)(uint64_t))(a1 + 1192))(v2) == -1)
        return 6;
      v3 = *(__int32 **)(a1 + 1208);
      if (!v3)
        return 6;
LABEL_10:
      if (*(int *)(a1 + 1176) >= 2)
      {
        v6 = 1;
        while (1)
        {
          if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
          {
            v3 = sub_209530A9C(a1, 6);
          }
          else
          {
            if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 6) == -1)break;
            v3 = *(__int32 **)(a1 + 1208);
          }
          if (!v3)
            break;
          if (++v6 >= *(_DWORD *)(a1 + 1176))
            goto LABEL_18;
        }
        *(_DWORD *)(a1 + 1176) = v6;
        return 6;
      }
LABEL_18:
      wcsncpy(*(__int32 **)(a1 + 88), v3, (uint64_t)(*(_QWORD *)(a1 + 112) - *(_QWORD *)(a1 + 88)) >> 2);
      v7 = *(const __int32 **)(a1 + 88);
      *(_DWORD *)(*(_QWORD *)(a1 + 112) - 4) = 0;
      v8 = wcslen(v7);
      v4 = &v7[v8];
      *(_QWORD *)(a1 + 104) = v4;
      if (v8 >= 1 && *(v4 - 1) == 10)
        *(_QWORD *)(a1 + 104) = --v4;
      if (v4 > v7 && *(v4 - 1) == 32)
        *(_QWORD *)(a1 + 104) = --v4;
      if (*(_DWORD *)(a1 + 1096) == 1)
      {
        *(_QWORD *)(a1 + 96) = v7;
        return 4;
      }
      goto LABEL_26;
    }
    v3 = sub_209530A9C(a1, 3);
    if (v3)
      goto LABEL_10;
  }
  return 6;
}

__int32 *sub_209530A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;

  v4 = 0;
  v5 = 0;
  if ((*(unsigned int (**)(_QWORD, uint64_t *, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), &v4, a2) == -1)
    return 0;
  else
    return sub_20953ED48((__int32 *)v5, a1 + 1264);
}

uint64_t sub_209530AFC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  FILE *v8;
  int v9;
  unsigned __int32 *v10;
  HistEventW v11;

  if (!*(_QWORD *)(a1 + 1184))
    return 0xFFFFFFFFLL;
  if (a2 == 1 || !wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"l"))
  {
    if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
    {
      result = (uint64_t)sub_209530A9C(a1, 4);
      while (result)
      {
LABEL_13:
        v8 = *(FILE **)(a1 + 16);
        v9 = *(_DWORD *)(a1 + 1200);
        v10 = sub_20953EC14((unsigned __int32 *)result, a1 + 1264);
        fprintf(v8, "%d %s", v9, (const char *)v10);
        if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
        {
          result = (uint64_t)sub_209530A9C(a1, 5);
        }
        else
        {
          if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 5) == -1)return 0;
          result = *(_QWORD *)(a1 + 1208);
        }
      }
    }
    else if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 4) == -1)
    {
      return 0;
    }
    else
    {
      result = *(_QWORD *)(a1 + 1208);
      if (result)
        goto LABEL_13;
    }
  }
  else
  {
    if (a2 != 3)
      return 0xFFFFFFFFLL;
    *(_QWORD *)&v11.num = 0;
    v11.str = 0;
    v6 = wcstol(*(const __int32 **)(a3 + 16), 0, 0);
    if (!wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"s"))
    {
      return history_w(*(HistoryW **)(a1 + 1184), &v11, 1, v6);
    }
    else
    {
      if (wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"u"))
        return 0xFFFFFFFFLL;
      return history_w(*(HistoryW **)(a1 + 1184), &v11, 20, v6);
    }
  }
  return result;
}

uint64_t sub_209530C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 1152), 4 * a3, 0x100004052888210uLL);
  if (result)
  {
    v7 = result;
    bzero((void *)(result + 4 * a2), 4 * (a3 - a2));
    *(_QWORD *)(a1 + 1168) = v7 + *(_QWORD *)(a1 + 1168) - *(_QWORD *)(a1 + 1152);
    *(_QWORD *)(a1 + 1152) = v7;
    *(_QWORD *)(a1 + 1160) = a3;
    return 1;
  }
  return result;
}

HistoryW *history_winit(void)
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = malloc_type_malloc(0x60uLL, 0x108004000789A1EuLL);
  v1 = v0;
  if (v0)
  {
    if (sub_209530DD8(v0) == -1)
    {
      free(v1);
      return 0;
    }
    else
    {
      *((_DWORD *)v1 + 2) = -1;
      v1[2] = sub_209530E98;
      v1[3] = sub_209530E38;
      v1[4] = sub_209530ED4;
      v1[5] = sub_209530F10;
      v1[6] = sub_209530F8C;
      v1[7] = sub_209530FE4;
      v1[10] = sub_2095310AC;
      v1[11] = sub_2095311C4;
      v1[8] = sub_2095312D0;
      v1[9] = sub_209531068;
    }
  }
  return (HistoryW *)v1;
}

uint64_t sub_209530DD8(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;

  v2 = malloc_type_malloc(0x40uLL, 0x10F004084742EBCuLL);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  result = 0;
  v3[3] = v3;
  v3[4] = v3;
  v3[1] = 0;
  *(_DWORD *)v3 = 0;
  v3[5] = v3;
  v3[6] = 0;
  v3[7] = 0;
  *a1 = v3;
  return result;
}

uint64_t sub_209530E38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _OWORD *v4;
  uint64_t result;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == a1)
  {
    *(_DWORD *)a2 = 5;
    v6 = &unk_209541B04;
  }
  else
  {
    v4 = *(_OWORD **)(v2 + 24);
    if (v4 != (_OWORD *)a1)
    {
      result = 0;
      *(_QWORD *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 6;
    v6 = &unk_209541B30;
  }
  *(_QWORD *)(a2 + 8) = v6;
  return 0xFFFFFFFFLL;
}

uint64_t sub_209530E98(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t result;

  v2 = *(_OWORD **)(a1 + 24);
  *(_QWORD *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 3;
    *(_QWORD *)(a2 + 8) = &unk_209541A58;
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_209530ED4(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t result;

  v2 = *(_OWORD **)(a1 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 4;
    *(_QWORD *)(a2 + 8) = &unk_209541AB0;
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_209530F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _OWORD *v4;
  uint64_t result;
  int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == a1)
  {
    v6 = *(_DWORD *)(a1 + 52);
    v7 = v6 <= 0;
    if (v6 <= 0)
      v8 = 5;
    else
      v8 = 6;
    *(_DWORD *)a2 = v8;
    v9 = 40;
    if (!v7)
      v9 = 48;
    v10 = *(_UNKNOWN **)((char *)&off_24C1B5518 + v9);
  }
  else
  {
    v4 = *(_OWORD **)(v3 + 32);
    if (v4 != (_OWORD *)a1)
    {
      result = 0;
      *(_QWORD *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 7;
    v10 = &unk_209541B68;
  }
  *(_QWORD *)(a2 + 8) = v10;
  return 0xFFFFFFFFLL;
}

uint64_t sub_209530F8C(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t result;
  int v4;
  BOOL v5;
  int v6;
  uint64_t v7;

  v2 = *(_OWORD **)(a1 + 40);
  if (v2 == (_OWORD *)a1)
  {
    v4 = *(_DWORD *)(a1 + 52);
    v5 = v4 <= 0;
    if (v4 <= 0)
      v6 = 5;
    else
      v6 = 8;
    *(_DWORD *)a2 = v6;
    v7 = 40;
    if (!v5)
      v7 = 64;
    *(_QWORD *)(a2 + 8) = *(_UNKNOWN **)((char *)&off_24C1B5518 + v7);
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_209530FE4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  void *v4;
  int v5;

  if (*(_DWORD *)(a1 + 52))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 == a1 || *(_DWORD *)v3 != a3)
    {
      v3 = a1;
      while (1)
      {
        v3 = *(_QWORD *)(v3 + 24);
        if (v3 == a1)
          break;
        if (*(_DWORD *)v3 == a3)
          goto LABEL_10;
      }
      v3 = a1;
LABEL_10:
      *(_QWORD *)(a1 + 40) = v3;
    }
    if (v3 != a1)
      return 0;
    v4 = &unk_209541C14;
    v5 = 9;
  }
  else
  {
    v4 = &unk_209541B04;
    v5 = 5;
  }
  *(_DWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v4;
  return 0xFFFFFFFFLL;
}

void sub_209531068(uint64_t a1)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 32); i != a1; i = *(_QWORD *)(a1 + 32))
    sub_209531DE8(a1, i);
  *(_QWORD *)(a1 + 40) = a1;
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t sub_2095310AC(uint64_t a1, uint64_t a2, __int32 *a3)
{
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  _QWORD *v9;
  __int32 *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;

  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 24);
    if (v6 != a1)
    {
      result = wcscmp(*(const __int32 **)(v6 + 8), a3);
      if (!(_DWORD)result)
        return result;
    }
  }
  v8 = malloc_type_malloc(0x28uLL, 0x10F00401F389D68uLL);
  if (!v8)
  {
LABEL_15:
    *(_DWORD *)a2 = 2;
    *(_QWORD *)(a2 + 8) = &unk_209541A18;
    return 0xFFFFFFFFLL;
  }
  v9 = v8;
  v10 = sub_20953FB74(a3);
  v9[1] = v10;
  if (!v10)
  {
    free(v9);
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(a1 + 24);
  v9[2] = 0;
  v9[3] = v11;
  v9[4] = a1;
  *(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) = v9;
  v12 = *(_DWORD *)(a1 + 52);
  LODWORD(v11) = *(_DWORD *)(a1 + 56) + 1;
  *(_DWORD *)v9 = v11;
  *(_QWORD *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 52) = v12 + 1;
  *(_DWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 40) = v9;
  *(_OWORD *)a2 = *(_OWORD *)v9;
  v13 = *(_DWORD *)(a1 + 52);
  result = 1;
  if (v13 >= 1 && v13 > *(_DWORD *)(a1 + 48))
  {
    do
    {
      sub_209531DE8(a1, *(_QWORD *)(a1 + 32));
      v14 = *(_DWORD *)(a1 + 52);
    }
    while (v14 >= 1 && v14 > *(_DWORD *)(a1 + 48));
    return 1;
  }
  return result;
}

uint64_t sub_2095311C4(uint64_t a1, uint64_t a2, __int32 *a3)
{
  uint64_t v6;
  size_t v7;
  size_t v8;
  __int32 *v9;
  __int32 *v10;
  size_t v11;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == a1)
    return sub_2095310AC(a1, a2, a3);
  v7 = wcslen(*(const __int32 **)(v6 + 8));
  v8 = wcslen(a3) + v7;
  v9 = (__int32 *)malloc_type_malloc(4 * (v8 + 1), 0x100004052888210uLL);
  if (v9)
  {
    v10 = v9;
    wcsncpy(v9, *(const __int32 **)(*(_QWORD *)(a1 + 40) + 8), v8 + 1);
    v10[v8] = 0;
    v11 = wcslen(v10);
    wcsncat(v10, a3, v8 - v11);
    free(*(void **)(v6 + 8));
    result = 0;
    *(_QWORD *)(v6 + 8) = v10;
    *(_OWORD *)a2 = *(_OWORD *)*(_QWORD *)(a1 + 40);
  }
  else
  {
    *(_DWORD *)a2 = 2;
    *(_QWORD *)(a2 + 8) = &unk_209541A18;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_2095312D0(uint64_t a1, uint64_t a2, int a3)
{
  _DWORD *v6;

  if (sub_209530FE4(a1, a2, a3))
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a2 + 8) = sub_20953FB74(*(const __int32 **)(*(_QWORD *)(a1 + 40) + 8));
  v6 = *(_DWORD **)(a1 + 40);
  *(_DWORD *)a2 = *v6;
  sub_209531DE8(a1, (uint64_t)v6);
  return 0;
}

void history_wend(HistoryW *a1)
{
  if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_209530E38)
    sub_209531068(*(_QWORD *)a1);
  free(*(void **)a1);
  free(a1);
}

int history_w(HistoryW *a1, HistEventW *a2, int a3, ...)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t, uint64_t, int);
  void (*v11)(uint64_t);
  uint64_t (*v12)(uint64_t, uint64_t, __int32 *);
  uint64_t (*v13)(uint64_t, uint64_t, __int32 *);
  uint64_t (*v14)(uint64_t, uint64_t, int);
  BOOL v15;
  BOOL v24;
  int v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  int v27;
  const __int32 *v28;
  int v29;
  int v30;
  size_t v32;
  int v33;
  size_t v34;
  int v35;
  int v36;
  int v37;
  FILE *v38;
  FILE *v39;
  char *v40;
  FILE *v41;
  FILE *v42;
  int v43;
  void *v44;
  void *v45;
  size_t v46;
  unsigned __int32 *v47;
  size_t v48;
  void *v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  __int32 *v57;
  uint64_t v58;
  int v59;
  int v60;
  unsigned int v61;
  void *v63;
  void *v64;
  char *v65;
  char *v66;
  size_t v67;
  size_t v68;
  void *v69;
  char *v70;
  int v71;
  int v72;
  int v73;
  char *v74;
  __int32 *v75;
  int v76;
  size_t __n;
  int v78;
  uint64_t v79;
  unsigned __int32 *v80;
  const __int32 *v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  uint64_t (*v83)(uint64_t, uint64_t);
  uint64_t (*v84)(uint64_t, uint64_t);
  uint64_t (*v85)(uint64_t, uint64_t);
  uint64_t (*v86)(uint64_t, uint64_t);
  uint64_t (*v87)(uint64_t, uint64_t, int);
  void (*v88)(uint64_t);
  uint64_t (*v89)(uint64_t, uint64_t, __int32 *);
  uint64_t (*v90)(uint64_t, uint64_t, __int32 *);
  uint64_t (*v91)(uint64_t, uint64_t, int);
  va_list va;

  va_start(va, a3);
  v81 = va_arg(va, const __int32 *);
  v82 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v83 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v84 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v85 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v86 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v87 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  v88 = va_arg(va, void (*)(uint64_t a1));
  v89 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, __int32 *a3));
  v90 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, __int32 *a3));
  v91 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  a2->num = 0;
  a2->str = (const __int32 *)&unk_2095419D4;
  switch(a3)
  {
    case 0:
      *((_DWORD *)a1 + 2) = -1;
      v5 = v82;
      v6 = v83;
      v7 = v84;
      v8 = v85;
      v9 = v86;
      v10 = v87;
      v11 = v88;
      v12 = v89;
      v13 = v90;
      v14 = v91;
      if (v82)
        v15 = v83 == 0;
      else
        v15 = 1;
      v24 = v15
         || v84 == 0
         || v85 == 0
         || v86 == 0
         || v87 == 0
         || v89 == 0
         || v90 == 0
         || v88 == 0
         || v91 == 0
         || v81 == 0;
      v25 = v24;
      v26 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)a1 + 3);
      if (v24)
      {
        if (v26 == sub_209530E38 || (v27 = v25, sub_209530DD8(a1) == -1))
        {
LABEL_123:
          a2->num = 12;
          v28 = (const __int32 *)&unk_209541D18;
          goto LABEL_138;
        }
        v25 = v27;
        v14 = sub_2095312D0;
        v13 = sub_2095311C4;
        v12 = sub_2095310AC;
        v11 = sub_209531068;
        v10 = sub_209530FE4;
        v9 = sub_209530F8C;
        v8 = sub_209530F10;
        v7 = sub_209530ED4;
        v6 = sub_209530E38;
        v5 = sub_209530E98;
      }
      else
      {
        if (v26 == sub_209530E38)
        {
          v76 = v25;
          sub_209531068(*(_QWORD *)a1);
          v14 = v91;
          v11 = v88;
          v25 = v76;
        }
        *((_DWORD *)a1 + 2) = -1;
      }
      *((_QWORD *)a1 + 2) = v5;
      *((_QWORD *)a1 + 3) = v6;
      *((_QWORD *)a1 + 4) = v7;
      *((_QWORD *)a1 + 5) = v8;
      *((_QWORD *)a1 + 6) = v9;
      *((_QWORD *)a1 + 7) = v10;
      *((_QWORD *)a1 + 10) = v12;
      *((_QWORD *)a1 + 11) = v13;
      *((_QWORD *)a1 + 8) = v14;
      *((_QWORD *)a1 + 9) = v11;
      if (!v25)
        return 0;
      goto LABEL_123;
    case 1:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_209530E38)
        goto LABEL_94;
      if ((v81 & 0x80000000) == 0)
      {
        v29 = 0;
        *(_DWORD *)(*(_QWORD *)a1 + 48) = (_DWORD)v81;
        return v29;
      }
      a2->num = 15;
      v28 = (const __int32 *)&unk_209541F04;
      goto LABEL_138;
    case 2:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_209530E38)
      {
        v28 = (const __int32 *)&unk_209541DFC;
        v30 = 14;
        goto LABEL_137;
      }
      v59 = *(_DWORD *)(*(_QWORD *)a1 + 52);
      a2->num = v59;
      if (v59 > -2)
        return 0;
      v28 = (const __int32 *)&unk_209541DA4;
      v30 = 13;
      goto LABEL_137;
    case 3:
      return (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 2))(*(_QWORD *)a1, a2);
    case 4:
      return (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 4))(*(_QWORD *)a1, a2);
    case 5:
      return (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 5))(*(_QWORD *)a1, a2);
    case 6:
      return (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 3))(*(_QWORD *)a1, a2);
    case 7:
      return (*((uint64_t (**)(_QWORD, HistEventW *, _QWORD))a1 + 7))(*(_QWORD *)a1, a2, v81);
    case 8:
      return (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 6))(*(_QWORD *)a1, a2);
    case 9:
      return (*((uint64_t (**)(_QWORD, HistEventW *, const __int32 *))a1 + 11))(*(_QWORD *)a1, a2, v81);
    case 10:
      v29 = (*((uint64_t (**)(_QWORD, HistEventW *, const __int32 *))a1 + 10))(*(_QWORD *)a1, a2, v81);
      if (v29 != -1)
        *((_DWORD *)a1 + 2) = a2->num;
      return v29;
    case 11:
      if ((*((unsigned int (**)(_QWORD, HistEventW *, _QWORD))a1 + 7))(*(_QWORD *)a1, a2, *((unsigned int *)a1 + 2)) == -1)return -1;
      return (*((uint64_t (**)(_QWORD, HistEventW *, const __int32 *))a1 + 11))(*(_QWORD *)a1, a2, v81);
    case 12:
      history_wend(a1);
      return 0;
    case 13:
      v32 = wcslen(v81);
      v33 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v33 == -1)
          goto LABEL_103;
        if (wcsncmp(v81, a2->str, v32))
        {
          v33 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 5))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 14:
      v34 = wcslen(v81);
      v35 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v35 == -1)
          goto LABEL_103;
        if (wcsncmp(v81, a2->str, v34))
        {
          v35 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 3))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 15:
      v36 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v36 == -1)
          goto LABEL_103;
        if (a2->num != (_DWORD)v81)
        {
          v36 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 3))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 16:
      v37 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v37 == -1)
          goto LABEL_103;
        if (a2->num != (_DWORD)v81)
        {
          v37 = (*((uint64_t (**)(_QWORD, HistEventW *))a1 + 5))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 17:
      v38 = fopen((const char *)v81, "r");
      if (!v38)
        goto LABEL_80;
      v39 = v38;
      __n = 0;
      v79 = 0;
      v80 = 0;
      v40 = fgetln(v38, &__n);
      if (!v40
        || strncmp(v40, "_HiStOrY_V2_\n", __n)
        || (v63 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v39);
        goto LABEL_80;
      }
      v64 = v63;
      v65 = fgetln(v39, &__n);
      if (v65)
      {
        v66 = v65;
        v29 = 0;
        v67 = 1024;
        while (1)
        {
          v68 = __n;
          if (__n && v66[__n - 1] == 10)
          {
            --__n;
            --v68;
          }
          if (v67 < v68)
          {
            v67 = (v68 & 0xFFFFFFFFFFFFFC00) + 1024;
            v69 = malloc_type_realloc(v64, v67, 0x100004077774924uLL);
            if (!v69)
              break;
            v68 = __n;
            v64 = v69;
          }
          v78 = 0;
          v70 = (char *)v64;
          if (v68)
          {
            v70 = (char *)v64;
            do
            {
              --v68;
              v72 = *v66++;
              v71 = v72;
              while (1)
              {
                v73 = unvis(v70, v71, &v78, 0);
                if (v73 != 2)
                  break;
                ++v70;
              }
              if (v73 && v73 != 3)
              {
                if (v73 != 1)
                  goto LABEL_164;
                ++v70;
              }
            }
            while (v68);
          }
          v74 = unvis(v70, 0, &v78, 2048) == 1 ? v70 + 1 : v70;
          *v74 = 0;
LABEL_164:
          v75 = sub_20953ED48((__int32 *)v64, (uint64_t)&unk_25459AC98);
          if (!v75
            || (*((unsigned int (**)(_QWORD, uint64_t *, __int32 *))a1 + 10))(*(_QWORD *)a1, &v79, v75) == -1)
          {
            break;
          }
          ++v29;
          v66 = fgetln(v39, &__n);
          if (!v66)
            goto LABEL_177;
        }
        v29 = -1;
      }
      else
      {
        v29 = 0;
      }
LABEL_177:
      free(v64);
      fclose(v39);
      if (v29 == -1)
      {
LABEL_80:
        a2->num = 10;
        v28 = (const __int32 *)&unk_209541C54;
        goto LABEL_138;
      }
      return v29;
    case 18:
      v41 = fopen((const char *)v81, "w");
      if (!v41)
        goto LABEL_125;
      v42 = v41;
      v79 = 0;
      v80 = 0;
      v43 = fileno(v41);
      if (fchmod(v43, 0x180u) == -1
        || fputs("_HiStOrY_V2_\n", v42) == -1
        || (v44 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v42);
        goto LABEL_125;
      }
      v45 = v44;
      if ((*((unsigned int (**)(_QWORD, uint64_t *))a1 + 4))(*(_QWORD *)a1, &v79) == -1)
      {
        v29 = 0;
        goto LABEL_174;
      }
      v29 = 0;
      v46 = 1024;
      while (2)
      {
        v47 = sub_20953EC14(v80, (uint64_t)&unk_25459ACB8);
        v48 = 4 * strlen((const char *)v47);
        if (v48 < v46)
          goto LABEL_90;
        v46 = (v48 & 0xFFFFFFFFFFFFFC00) + 1024;
        v49 = malloc_type_realloc(v45, v46, 0x100004077774924uLL);
        if (v49)
        {
          v45 = v49;
LABEL_90:
          strvis((char *)v45, (const char *)v47, 28);
          fprintf(v42, "%s\n", (const char *)v45);
          ++v29;
          if ((*((unsigned int (**)(_QWORD, uint64_t *))a1 + 5))(*(_QWORD *)a1, &v79) == -1)
            goto LABEL_174;
          continue;
        }
        break;
      }
      v29 = -1;
LABEL_174:
      free(v45);
      fclose(v42);
      if (v29 == -1)
      {
LABEL_125:
        a2->num = 11;
        v28 = (const __int32 *)&unk_209541CC8;
        goto LABEL_138;
      }
      return v29;
    case 19:
      (*((void (**)(_QWORD, HistEventW *))a1 + 9))(*(_QWORD *)a1, a2);
      return 0;
    case 20:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_209530E38)
      {
LABEL_94:
        a2->num = 14;
        v28 = (const __int32 *)&unk_209541DFC;
        goto LABEL_138;
      }
      v60 = *(_DWORD *)(*(_QWORD *)a1 + 60);
      v29 = 0;
      if ((_DWORD)v81)
        v61 = v60 | 1;
      else
        v61 = v60 & 0xFFFFFFFE;
      *(_DWORD *)(*(_QWORD *)a1 + 60) = v61;
      return v29;
    case 21:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_209530E38)
      {
        v29 = 0;
        v50 = *(_DWORD *)(*(_QWORD *)a1 + 60) & 1;
      }
      else
      {
        a2->str = (const __int32 *)&unk_209541DFC;
        v29 = -1;
        v50 = 14;
      }
      a2->num = v50;
      return v29;
    case 22:
      return (*((uint64_t (**)(_QWORD, HistEventW *, _QWORD))a1 + 8))(*(_QWORD *)a1, a2, v81);
    case 23:
      if ((*((unsigned int (**)(_QWORD, HistEventW *))a1 + 6))(*(_QWORD *)a1, a2) == -1)
        goto LABEL_103;
      v51 = (_DWORD)v81 + 1;
      while (--v51 > 0)
      {
        if ((*((unsigned int (**)(_QWORD, HistEventW *))a1 + 5))(*(_QWORD *)a1, a2) == -1)
        {
LABEL_103:
          a2->num = 9;
          v28 = (const __int32 *)&unk_209541C14;
LABEL_138:
          a2->str = v28;
          return -1;
        }
      }
      if (!v82)
        return 0;
      v29 = 0;
      *(_QWORD *)v82 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 16);
      return v29;
    case 24:
      v52 = (int)v81;
      v53 = *(_QWORD *)a1;
      if (!*(_DWORD *)(*(_QWORD *)a1 + 52))
      {
        v28 = (const __int32 *)&unk_209541B04;
        v30 = 5;
LABEL_137:
        a2->num = v30;
        goto LABEL_138;
      }
      v54 = *(_QWORD *)a1;
      do
        v54 = *(_QWORD *)(v54 + 32);
      while (v54 != v53 && v52-- > 0);
      *(_QWORD *)(v53 + 40) = v54;
      if (v54 == v53)
      {
        v28 = (const __int32 *)&unk_209541C14;
        v30 = 9;
        goto LABEL_137;
      }
      if (v82 != (uint64_t (*)(uint64_t, uint64_t))-1)
      {
        a2->str = sub_20953FB74(*(const __int32 **)(v54 + 8));
        v56 = *(_QWORD *)(v53 + 40);
        a2->num = *(_DWORD *)v56;
        if (v82)
        {
          *(_QWORD *)v82 = *(_QWORD *)(v56 + 16);
          v56 = *(_QWORD *)(v53 + 40);
        }
        sub_209531DE8(v53, v56);
      }
      return 0;
    case 25:
      if (!v81)
        return -1;
      v57 = sub_20953FB74(v81);
      if (!v57)
        return -1;
      v29 = 0;
      v58 = *(_QWORD *)(*(_QWORD *)a1 + 40);
      *(_QWORD *)(v58 + 8) = v57;
      *(_QWORD *)(v58 + 16) = v82;
      return v29;
    default:
      a2->num = 1;
      v28 = (const __int32 *)&unk_2095419E0;
      goto LABEL_138;
  }
}

void sub_209531DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a2 == a1)
    abort();
  v4 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 40) == a2)
  {
    *(_QWORD *)(a1 + 40) = v4;
    if (v4 == a1)
    {
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 24);
      v4 = a1;
    }
  }
  *(_QWORD *)(v4 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(*(_QWORD *)(a2 + 24) + 32) = v4;
  free(*(void **)(a2 + 8));
  free((void *)a2);
  --*(_DWORD *)(a1 + 52);
}

uint64_t sub_209531E68(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 1128) = v2;
  if (!v2)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 1136) = 0;
  sub_209531F6C(0);
  result = 0;
  *(_QWORD *)(a1 + 1136) = 0;
  return result;
}

void sub_209531EC0(uint64_t a1)
{
  sub_209531F6C(*(_QWORD *)(a1 + 1136));
  *(_QWORD *)(a1 + 1136) = 0;
}

void sub_209531EE8(uint64_t a1)
{
  free(*(void **)(a1 + 1128));
  *(_QWORD *)(a1 + 1128) = 0;
  sub_209531F14(*(_QWORD **)(a1 + 1136));
}

void sub_209531F14(_QWORD *a1)
{
  if (a1)
  {
    sub_209531F14(a1[3]);
    sub_209531F14(a1[2]);
    free(a1);
  }
}

uint64_t sub_209531F4C(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 1144) = a2;
  return a1 + 1144;
}

uint64_t sub_209531F5C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 1144) = a2;
  return a1 + 1144;
}

void sub_209531F6C(uint64_t a1)
{
  void *v2;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      ((void (*)(void))sub_209531F6C)();
      *(_QWORD *)(a1 + 16) = 0;
    }
    sub_209531F6C(*(_QWORD *)(a1 + 24));
    switch(*(_DWORD *)(a1 + 4))
    {
      case 0:
      case 2:
        break;
      case 1:
      case 3:
        v2 = *(void **)(a1 + 8);
        if (v2)
          free(v2);
        break;
      default:
        abort();
    }
    free((void *)a1);
  }
}

uint64_t sub_209531FE8(EditLine *a1, __int32 *a2, _QWORD *a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t result;

  v6 = (uint64_t *)((char *)a1 + 1136);
  while (1)
  {
    v7 = *v6;
    while (*(_DWORD *)v7 != *a2)
    {
      v7 = *(_QWORD *)(v7 + 24);
      if (!v7)
      {
        *a3 = 0;
        return 1;
      }
    }
    v6 = (uint64_t *)(v7 + 16);
    if (!*(_QWORD *)(v7 + 16))
      break;
    if (el_wgetc(a1, a2) != 1)
    {
      result = 0;
      *(_BYTE *)a3 = 7;
      return result;
    }
  }
  *a3 = *(_QWORD *)(v7 + 8);
  if (!*(_DWORD *)(v7 + 4))
    return 0;
  *a2 = 0;
  return *(unsigned int *)(v7 + 4);
}

void sub_209532094(uint64_t a1, int *a2, const __int32 **a3, int a4)
{
  int v5;
  FILE *v9;
  const char *v10;
  size_t v11;
  _DWORD *v12;

  v5 = *a2;
  if (!*a2)
  {
    v9 = *(FILE **)(a1 + 24);
    v10 = "keymacro_add: Null extended-key not allowed.\n";
    v11 = 45;
    goto LABEL_11;
  }
  if (!a4 && *(_BYTE *)a3 == 24)
  {
    v9 = *(FILE **)(a1 + 24);
    v10 = "keymacro_add: sequence-lead-in command not allowed\n";
    v11 = 51;
LABEL_11:
    fwrite(v10, v11, 1uLL, v9);
    return;
  }
  v12 = *(_DWORD **)(a1 + 1136);
  if (!v12)
  {
    v12 = malloc_type_malloc(0x20uLL, 0x1032040358E0334uLL);
    if (v12)
    {
      *v12 = v5;
      v12[1] = 2;
      *((_QWORD *)v12 + 2) = 0;
      *((_QWORD *)v12 + 3) = 0;
      *((_QWORD *)v12 + 1) = 0;
    }
    *(_QWORD *)(a1 + 1136) = v12;
  }
  sub_209532164(v12, a2, a3, a4);
}

void sub_209532164(_DWORD *a1, int *a2, const __int32 **a3, int a4)
{
  int v8;
  _DWORD *v9;
  _DWORD *v10;
  int v11;
  int v12;
  _DWORD *v13;
  void *v14;

  while (1)
  {
    v8 = *a2;
    if (*a1 == *a2)
    {
      v9 = a1;
    }
    else
    {
      while (1)
      {
        v9 = (_DWORD *)*((_QWORD *)a1 + 3);
        if (!v9)
          break;
        a1 = (_DWORD *)*((_QWORD *)a1 + 3);
        if (*v9 == v8)
          goto LABEL_9;
      }
      v10 = malloc_type_malloc(0x20uLL, 0x1032040358E0334uLL);
      v9 = v10;
      if (v10)
      {
        *v10 = v8;
        v10[1] = 2;
        *((_QWORD *)v10 + 2) = 0;
        *((_QWORD *)v10 + 3) = 0;
        *((_QWORD *)v10 + 1) = 0;
      }
      *((_QWORD *)a1 + 3) = v10;
    }
LABEL_9:
    v12 = a2[1];
    ++a2;
    v11 = v12;
    a1 = (_DWORD *)*((_QWORD *)v9 + 2);
    if (!v12)
      break;
    if (!a1)
    {
      v13 = malloc_type_malloc(0x20uLL, 0x1032040358E0334uLL);
      a1 = v13;
      if (v13)
      {
        *v13 = v11;
        v13[1] = 2;
        *((_QWORD *)v13 + 2) = 0;
        *((_QWORD *)v13 + 3) = 0;
        *((_QWORD *)v13 + 1) = 0;
      }
      *((_QWORD *)v9 + 2) = v13;
    }
  }
  if (a1)
  {
    sub_209531F6C(*((_QWORD *)v9 + 2));
    *((_QWORD *)v9 + 2) = 0;
  }
  switch(v9[1])
  {
    case 0:
    case 2:
      goto LABEL_19;
    case 1:
    case 3:
      v14 = (void *)*((_QWORD *)v9 + 1);
      if (v14)
        free(v14);
LABEL_19:
      v9[1] = a4;
      if (a4 == 3 || a4 == 1)
      {
        *((_QWORD *)v9 + 1) = sub_20953FB74(*a3);
      }
      else
      {
        if (a4)
LABEL_24:
          abort();
        *((_QWORD *)v9 + 1) = *a3;
      }
      return;
    default:
      goto LABEL_24;
  }
}

uint64_t sub_2095322C4(uint64_t result, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*a3 <= 256)
  {
    v3 = *a3;
    if (*(_BYTE *)(a2 + v3) == 24)
    {
      v4 = *(_QWORD *)(result + 1056);
      v5 = *(_QWORD *)(result + 1048);
      if (v4 == a2 && *(_BYTE *)(v5 + v3) != 24)
        return sub_20953231C(result, a3);
      if (v5 == a2 && *(_BYTE *)(v4 + v3) != 24)
        return sub_20953231C(result, a3);
    }
  }
  return result;
}

uint64_t sub_20953231C(uint64_t a1, _DWORD *a2)
{
  if (*a2)
  {
    if (*(_QWORD *)(a1 + 1136))
      sub_209532368((_DWORD **)(a1 + 1136), a2);
    return 0;
  }
  else
  {
    fwrite("keymacro_delete: Null extended-key not allowed.\n", 0x30uLL, 1uLL, *(FILE **)(a1 + 24));
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_209532368(_DWORD **a1, _DWORD *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  _DWORD *v4;
  int v5;
  _DWORD *v6;
  int v7;
  uint64_t result;
  _QWORD *v9;

  v2 = a1;
  v3 = *a1;
  if (**a1 != *a2)
  {
    while (1)
    {
      v6 = v3;
      v3 = (_DWORD *)*((_QWORD *)v3 + 3);
      if (!v3)
        return 0;
      if (*v3 == *a2)
      {
        v7 = a2[1];
        v4 = a2 + 1;
        if (v7)
          goto LABEL_7;
        v2 = v6 + 6;
        goto LABEL_12;
      }
    }
  }
  v5 = a2[1];
  v4 = a2 + 1;
  if (v5)
  {
    v6 = 0;
LABEL_7:
    if (!*((_QWORD *)v3 + 2))
      return 0;
    result = sub_209532368(v3 + 4, v4);
    if (!(_DWORD)result)
      return result;
    if (*((_QWORD *)v3 + 2))
      return 0;
    v9 = v6 + 6;
    if (!v6)
      v9 = v2;
    *v9 = *((_QWORD *)v3 + 3);
  }
  else
  {
LABEL_12:
    *v2 = *((_QWORD *)v3 + 3);
  }
  *((_QWORD *)v3 + 3) = 0;
  sub_209531F6C((uint64_t)v3);
  return 1;
}

uint64_t sub_20953242C(uint64_t result, _DWORD *a2)
{
  uint64_t v3;
  unsigned int *v4;
  unint64_t v5;
  _DWORD *v6;
  unsigned int *v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int32 *v10;

  v3 = result;
  v4 = *(unsigned int **)(result + 1136);
  if (v4 || *a2)
  {
    **(_DWORD **)(result + 1128) = 34;
    v5 = 1;
    v6 = a2;
    while (2)
    {
      v7 = v4;
      while (1)
      {
        if (!v7)
          return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
        if (!v6)
          return sub_209532804(v3, v4, v5);
        v8 = *v6;
        if (!(_DWORD)v8)
        {
          v4 = v7;
          return sub_209532804(v3, v4, v5);
        }
        if (*v7 == (_DWORD)v8)
          break;
        v7 = (unsigned int *)*((_QWORD *)v7 + 3);
        if (!v7)
          return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
      }
      v9 = sub_20953F080((_DWORD *)(*(_QWORD *)(v3 + 1128) + 4 * v5), 1024 - v5, v8);
      if (v9 == -1)
        return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
      v4 = (unsigned int *)*((_QWORD *)v7 + 2);
      ++v6;
      if (v4)
      {
        v5 += v9;
        continue;
      }
      break;
    }
    if (*v6)
      return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
    v10 = *(unsigned __int32 **)(v3 + 1128);
    *(_QWORD *)&v10[v9 + v5] = 34;
    return sub_209532560(v3, v10, (unsigned int **)v7 + 1, v7[1]);
  }
  return result;
}

uint64_t sub_209532560(uint64_t result, unsigned __int32 *a2, unsigned int **a3, int a4)
{
  uint64_t v5;
  char *v6;
  FILE *v7;
  unsigned __int32 *v8;
  FILE *v9;
  unsigned __int32 *v10;
  uint64_t v11;
  const __int32 *v12;
  int v13;
  _DWORD *v14;
  int v15;
  char v16[1024];
  uint64_t v17;

  v5 = result;
  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a4)
    {
      if (a4 != 3 && a4 != 1)
        abort();
      if (a4 == 1)
        v6 = "\"\"";
      else
        v6 = "[]";
      sub_2095326A0(*a3, v16, 1024, v6);
      goto LABEL_9;
    }
    v11 = *(_QWORD *)(result + 1104);
    v12 = *(const __int32 **)v11;
    if (*(_QWORD *)v11)
    {
      v13 = *(unsigned __int8 *)a3;
      if (*(_DWORD *)(v11 + 8) == v13)
      {
LABEL_17:
        wcstombs(v16, v12, 0x400uLL);
        v16[1023] = 0;
LABEL_9:
        v7 = *(FILE **)(v5 + 16);
        v8 = sub_20953EC14(a2, v5 + 1264);
        return fprintf(v7, "%-15s->  %s\n", (const char *)v8, v16);
      }
      v14 = (_DWORD *)(v11 + 32);
      while (1)
      {
        v12 = (const __int32 *)*((_QWORD *)v14 - 1);
        if (!v12)
          break;
        v15 = *v14;
        v14 += 6;
        if (v15 == v13)
          goto LABEL_17;
      }
    }
  }
  else
  {
    v9 = *(FILE **)(result + 16);
    v10 = sub_20953EC14(a2, result + 1264);
    return fprintf(v9, "%-15s->  %s\n", (const char *)v10, "no input");
  }
  return result;
}

unint64_t sub_2095326A0(unsigned int *a1, char *a2, uint64_t a3, char *a4)
{
  unsigned int *v7;
  char *v8;
  char *v9;
  unint64_t v10;
  unsigned __int32 *v11;
  uint64_t v12;
  char *v13;
  unsigned __int32 v14;
  uint64_t v15;
  unsigned int v16;
  char *v17;
  char *v18;
  unint64_t result;
  _DWORD v20[8];
  uint64_t v21;

  v7 = a1;
  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  if (*a4)
  {
    v8 = a2 + 1;
    if (a3 >= 1)
      *a2 = *a4;
  }
  v9 = &a2[a3];
  v10 = *a1;
  if ((_DWORD)v10)
  {
    do
    {
      v11 = v20;
      v12 = sub_20953F080(v20, 8uLL, v10);
      v13 = v8;
      while (1)
      {
        v8 = v13;
        if (v12 <= 0)
          break;
        --v12;
        v14 = *v11++;
        v15 = sub_20953ECD4(v13, v9 - v13, v14);
        v13 = &v8[v15];
        if (v15 == -1)
          goto LABEL_15;
      }
      v16 = v7[1];
      ++v7;
      v10 = v16;
    }
    while (v16);
  }
  else
  {
    if (v8 < v9)
      *v8 = 94;
    v17 = v8 + 1;
    v8 += 2;
    if (v17 < v9)
      *v17 = 64;
  }
LABEL_15:
  if (*a4 && a4[1])
  {
    v18 = v8 + 1;
    if (v8 < v9)
      *v8 = a4[1];
  }
  else
  {
    v18 = v8;
  }
  if (v18 < v9)
    *v18 = 0;
  result = v18 - a2 + 1;
  if (result >= a3)
    a2[a3 - 1] = 0;
  return result;
}

uint64_t sub_209532804(uint64_t a1, unsigned int *a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unsigned __int32 *v9;

  if (a3 > 0x3FA)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 1128) + 4 * a3 + 4) = 34;
    fwrite("Some extended keys too long for internal print buffer", 0x35uLL, 1uLL, *(FILE **)(a1 + 24));
    return fprintf(*(FILE **)(a1 + 24), " \"%ls...\"\n", *(const void **)(a1 + 1128));
  }
  else
  {
    do
    {
      v6 = sub_20953F080((_DWORD *)(*(_QWORD *)(a1 + 1128) + 4 * a3), 1024 - a3, *a2);
      v7 = *((_QWORD *)a2 + 2);
      if (v7)
      {
        result = sub_209532804(a1, v7, v6 + a3);
      }
      else
      {
        v9 = *(unsigned __int32 **)(a1 + 1128);
        *(_QWORD *)&v9[v6 + a3] = 34;
        result = sub_209532560(a1, v9, (unsigned int **)a2 + 1, a2[1]);
      }
      a2 = (unsigned int *)*((_QWORD *)a2 + 3);
    }
    while (a2);
  }
  return result;
}

uint64_t sub_2095328F4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  uint64_t (**v9)();

  v2 = malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  *(_QWORD *)(a1 + 1048) = v2;
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  *(_QWORD *)(a1 + 1056) = v3;
  if (!v3)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 1072) = &unk_209541F7C;
  *(_QWORD *)(a1 + 1080) = &unk_20954207C;
  *(_QWORD *)(a1 + 1088) = &unk_20954217C;
  v4 = malloc_type_malloc(0x990uLL, 0x10500400D13D5BAuLL);
  *(_QWORD *)(a1 + 1104) = v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  v6 = sub_20953EB64();
  memcpy(v5, v6, 0x990uLL);
  v7 = malloc_type_malloc(0x330uLL, 0x80040B8603338uLL);
  *(_QWORD *)(a1 + 1112) = v7;
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = v7;
  v9 = sub_20953EB58();
  memcpy(v8, v9, 0x330uLL);
  *(_DWORD *)(a1 + 1120) = 102;
  sub_209532A00(a1);
  return 0;
}

void sub_209532A00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t j;

  v2 = *(_QWORD *)(a1 + 1056);
  v3 = *(_QWORD *)(a1 + 1048);
  v4 = *(_QWORD *)(a1 + 1088);
  v5 = *(_QWORD *)(a1 + 1080);
  *(_DWORD *)(a1 + 1096) = 1;
  *(_QWORD *)(a1 + 1064) = v2;
  sub_209531EC0(a1);
  for (i = 0; i != 256; ++i)
  {
    *(_BYTE *)(v2 + i) = *(_BYTE *)(v4 + i);
    *(_BYTE *)(v3 + i) = *(_BYTE *)(v5 + i);
  }
  sub_209532B08(a1);
  v7 = *(_QWORD *)(a1 + 1056);
  for (j = 128; j != 256; ++j)
  {
    if (__maskrune(j, 0x40000uLL))
      *(_BYTE *)(v7 + j) = 8;
  }
  sub_20953CD90(a1, 1);
  sub_20953B43C(a1);
}

void sub_209532AB0(uint64_t a1)
{
  free(*(void **)(a1 + 1048));
  *(_QWORD *)(a1 + 1048) = 0;
  free(*(void **)(a1 + 1056));
  *(_QWORD *)(a1 + 1056) = 0;
  *(_QWORD *)(a1 + 1072) = 0;
  *(_QWORD *)(a1 + 1088) = 0;
  *(_QWORD *)(a1 + 1080) = 0;
  free(*(void **)(a1 + 1104));
  *(_QWORD *)(a1 + 1104) = 0;
  free(*(void **)(a1 + 1112));
  *(_QWORD *)(a1 + 1112) = 0;
}

void sub_209532B08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  const __int32 **v7;
  int v8[3];
  uint64_t v9;

  v2 = 0;
  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 1048);
  do
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 1056) + v2) == 48)
    {
      v3 = *(_QWORD *)(a1 + 1056);
      goto LABEL_11;
    }
    ++v2;
  }
  while (v2 != 256);
  v2 = 0;
  while (*(_BYTE *)(v3 + v2) != 48)
  {
    if (++v2 == 256)
    {
      if (*(_DWORD *)(a1 + 1096) != 1)
        v3 = *(_QWORD *)(a1 + 1056);
      LODWORD(v2) = 27;
      break;
    }
  }
LABEL_11:
  v4 = 0;
  v8[0] = v2;
  v8[2] = 0;
  do
  {
    v5 = *(unsigned __int8 *)(v3 + 128 + v4);
    if (v5 > 0x22 || ((1 << v5) & 0x401000100) == 0)
    {
      v8[1] = v4;
      v7 = (const __int32 **)sub_209531F4C(a1, v5);
      sub_209532094(a1, v8, v7, 0);
    }
    ++v4;
  }
  while (v4 != 128);
  *(_BYTE *)(v3 + v8[0]) = 24;
}

void sub_209532C30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t j;
  const __int32 **v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 1056);
  v3 = *(_QWORD *)(a1 + 1048);
  v4 = *(_QWORD *)(a1 + 1072);
  *(_DWORD *)(a1 + 1096) = 0;
  *(_QWORD *)(a1 + 1064) = v2;
  sub_209531EC0(a1);
  for (i = 0; i != 256; ++i)
  {
    *(_BYTE *)(v2 + i) = *(_BYTE *)(v4 + i);
    *(_BYTE *)(v3 + i) = 34;
  }
  sub_209532B08(a1);
  v6 = *(_QWORD *)(a1 + 1056);
  for (j = 128; j != 256; ++j)
  {
    if (__maskrune(j, 0x40000uLL))
      *(_BYTE *)(v6 + j) = 8;
  }
  v9 = 0x1800000018;
  v10 = 0;
  v8 = (const __int32 **)sub_209531F4C(a1, 41);
  sub_209532094(a1, (int *)&v9, v8, 0);
  sub_20953CD90(a1, 1);
  sub_20953B43C(a1);
}

uint64_t sub_209532D34(uint64_t a1, __int32 *a2)
{
  if (!wcscmp(a2, dword_20954227C))
  {
    sub_209532C30(a1);
  }
  else
  {
    if (wcscmp(a2, dword_209542294))
      return 0xFFFFFFFFLL;
    sub_209532A00(a1);
  }
  return 0;
}

uint64_t sub_209532D9C(uint64_t a1, _QWORD *a2)
{
  int v2;
  void *v3;
  uint64_t result;

  if (!a2)
    return 0xFFFFFFFFLL;
  v2 = *(_DWORD *)(a1 + 1096);
  if (!v2)
  {
    v3 = &unk_20954227C;
    goto LABEL_7;
  }
  if (v2 != 1)
    return 0xFFFFFFFFLL;
  v3 = &unk_209542294;
LABEL_7:
  result = 0;
  *a2 = v3;
  return result;
}

uint64_t sub_209532DD8()
{
  uint64_t v0;
  uint64_t v1;
  const void **v2;
  uint64_t v3;
  __int32 *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  signed int v13;
  uint64_t v14;
  uint64_t v15;
  signed int v16;
  uint64_t v17;
  uint64_t v18;
  __int32 *v19;
  uint64_t result;
  __int32 *v21;
  uint64_t v22;
  __int32 *v23;
  int v24;
  const void **v25;
  const void **v26;
  __int32 *v27;
  const __int32 **v28;
  uint64_t v29;
  int *v30;
  int v31;
  int v32;
  _QWORD *v33;
  char v34;
  char v35;
  __int32 v36[1024];
  __int32 v37[1024];
  uint64_t v38;

  v0 = MEMORY[0x24BDAC7A8]();
  v38 = *MEMORY[0x24BDAC8D0];
  if (!v1)
    return 0xFFFFFFFFLL;
  v2 = (const void **)v1;
  v3 = v0;
  v4 = *(__int32 **)(v1 + 8);
  if (!v4)
  {
LABEL_14:
    fwrite("Standard key bindings\n", 0x16uLL, 1uLL, *(FILE **)(v3 + 16));
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *(_QWORD *)(v3 + 1056);
      if (*(unsigned __int8 *)(v14 + v13) != *(unsigned __int8 *)(v14 + v12))
      {
        sub_209533450(v3, v14, v13, v12 - 1);
        v13 = v12;
      }
      ++v12;
    }
    while (v12 != 256);
    sub_209533450(v3, *(_QWORD *)(v3 + 1056), v13, 0xFFu);
    fwrite("Alternative key bindings\n", 0x19uLL, 1uLL, *(FILE **)(v3 + 16));
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = *(_QWORD *)(v3 + 1048);
      if (*(unsigned __int8 *)(v17 + v16) != *(unsigned __int8 *)(v17 + v15))
      {
        sub_209533450(v3, v17, v16, v15 - 1);
        v16 = v15;
      }
      ++v15;
    }
    while (v15 != 256);
    sub_209533450(v3, *(_QWORD *)(v3 + 1048), v16, 0xFFu);
    fwrite("Multi-character bindings\n", 0x19uLL, 1uLL, *(FILE **)(v3 + 16));
    sub_20953242C(v3, &dword_2095422A0);
    fwrite("Arrow key bindings\n", 0x13uLL, 1uLL, *(FILE **)(v3 + 16));
    v18 = v3;
    v19 = &dword_2095422A0;
    goto LABEL_23;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)(v0 + 1056);
  v9 = 2;
  while (*v4 == 45)
  {
    v10 = v4[1];
    v11 = 1;
    switch((int)v10)
    {
      case 'k':
        v5 = 1;
        goto LABEL_12;
      case 'l':
        v24 = *(_DWORD *)(v3 + 1120);
        if (v24 < 1)
          return 0;
        v25 = *(const void ***)(v3 + 1104);
        v26 = &v25[3 * v24];
        do
        {
          fprintf(*(FILE **)(v3 + 16), "%ls\n\t%ls\n", *v25, v25[2]);
          result = 0;
          v25 += 3;
        }
        while (v25 < v26);
        return result;
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'q':
      case 't':
      case 'u':
        goto LABEL_9;
      case 'r':
        v6 = 1;
        goto LABEL_12;
      case 's':
        goto LABEL_13;
      case 'v':
        sub_209532A00(v3);
        return 0;
      default:
        if ((_DWORD)v10 == 97)
        {
          v8 = *(_QWORD *)(v3 + 1048);
        }
        else
        {
          if ((_DWORD)v10 == 101)
          {
            sub_209532C30(v3);
            return 0;
          }
LABEL_9:
        }
LABEL_12:
        v11 = v7;
LABEL_13:
        v4 = (__int32 *)v2[v9++];
        v7 = v11;
        if (!v4)
          goto LABEL_14;
        break;
    }
  }
  if (v5)
  {
    if (v6)
    {
      sub_20953B8CC(v3, v4);
      return 0xFFFFFFFFLL;
    }
    v23 = (__int32 *)v2[v9];
    if (!v23)
    {
      v18 = v3;
      v19 = v4;
LABEL_23:
      sub_20953B928(v18, v19);
      return 0;
    }
  }
  else
  {
    v21 = sub_209533960(v37, v4);
    if (!v21)
    {
      fprintf(*(FILE **)(v3 + 24), "%ls: Invalid \\ or ^ in instring.\n");
      return 0xFFFFFFFFLL;
    }
    v4 = v21;
    if (v6)
    {
      if (v21[1] || (v22 = *(unsigned __int8 *)v21, *(_BYTE *)(v8 + v22) == 24))
      {
        sub_20953231C(v3, v21);
        return 0;
      }
      result = 0;
      v34 = 34;
      goto LABEL_59;
    }
    v23 = (__int32 *)v2[v9];
    if (!v23)
    {
      sub_209533264(v3, v8, (unsigned int *)v21);
      return 0;
    }
  }
  if ((_DWORD)v7)
  {
    v27 = sub_209533960(v36, v23);
    if (!v27)
    {
      fprintf(*(FILE **)(v3 + 24), "%ls: Invalid \\ or ^ in outstring.\n");
      return 0xFFFFFFFFLL;
    }
    v28 = (const __int32 **)sub_209531F5C(v3, (uint64_t)v27);
    v29 = v3;
    v30 = v4;
    v31 = 1;
    if (v5)
    {
      sub_20953B85C(v3, v4, v28, v7);
LABEL_58:
      result = 0;
      v22 = *(unsigned __int8 *)v4;
      v34 = 24;
LABEL_59:
      *(_BYTE *)(v8 + v22) = v34;
      return result;
    }
LABEL_57:
    sub_209532094(v29, v30, v28, v31);
    goto LABEL_58;
  }
  v32 = sub_209533A28(v3, v23);
  if (v32 == -1)
  {
    return 0xFFFFFFFFLL;
  }
  if (v5)
  {
    v33 = (_QWORD *)sub_209531F5C(v3, 0);
    sub_20953B85C(v3, v4, v33, 0);
    return 0;
  }
  v35 = v32;
  if (v4[1])
  {
    v28 = (const __int32 **)sub_209531F4C(v3, v32);
    v29 = v3;
    v30 = v4;
    v31 = 0;
    goto LABEL_57;
  }
  sub_2095322C4(v3, v8, v4);
  result = 0;
  *(_BYTE *)(v8 + *(unsigned __int8 *)v4) = v35;
  return result;
}

unint64_t sub_209533264(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unint64_t result;
  int v7;
  unint64_t v8;
  unint64_t v9;
  char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*a3 && a3[1])
    return sub_20953242C(a1, a3);
  result = sub_2095326A0(a3, v10, 1024, (char *)&unk_209547D1A);
  v7 = *(_DWORD *)(a1 + 1120);
  if (v7 >= 1)
  {
    v8 = *(_QWORD *)(a1 + 1104);
    v9 = v8 + 24 * v7;
    while (*(_DWORD *)(v8 + 8) != *(unsigned __int8 *)(a2 + *(unsigned __int8 *)a3))
    {
      v8 += 24;
      if (v8 >= v9)
        return result;
    }
    return fprintf(*(FILE **)(a1 + 16), "%s\t->\t%ls\n", v10, *(const void **)v8);
  }
  return result;
}

uint64_t sub_209533378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  result = 0xFFFFFFFFLL;
  if (a2 && a3 && a4)
  {
    v9 = *(int *)(a1 + 1120) + 1;
    v10 = malloc_type_realloc(*(void **)(a1 + 1112), 8 * v9, 0x80040B8603338uLL);
    if (v10
      && (*(_QWORD *)(a1 + 1112) = v10,
          (v11 = malloc_type_realloc(*(void **)(a1 + 1104), 24 * v9, 0x10500400D13D5BAuLL)) != 0))
    {
      v12 = v11;
      result = 0;
      *(_QWORD *)(a1 + 1104) = v12;
      v13 = *(int *)(a1 + 1120);
      *(_QWORD *)(*(_QWORD *)(a1 + 1112) + 8 * v13) = a4;
      v14 = *(_QWORD *)(a1 + 1104) + 24 * (int)v13;
      *(_QWORD *)v14 = a2;
      *(_DWORD *)(v14 + 8) = v13;
      *(_QWORD *)(v14 + 16) = a3;
      *(_DWORD *)(a1 + 1120) = v13 + 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_209533450(uint64_t result, uint64_t a2, signed int a3, unsigned int a4)
{
  uint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  char v11[1024];
  char v12[1024];
  unsigned int v13[2];
  unsigned int v14[2];
  uint64_t v15;

  v6 = result;
  v15 = *MEMORY[0x24BDAC8D0];
  v14[0] = a3;
  v14[1] = 0;
  v13[0] = a4;
  v13[1] = 0;
  v7 = *(unsigned __int8 *)(a2 + a3);
  if (v7 == 34)
  {
    if (a3 == a4)
    {
      sub_2095326A0(v14, v12, 1024, "\"\"");
      return fprintf(*(FILE **)(v6 + 16), "%-15s->  is undefined\n");
    }
  }
  else
  {
    v8 = *(_DWORD *)(result + 1120);
    if (v8 < 1)
LABEL_8:
      abort();
    v9 = *(_QWORD *)(result + 1104);
    v10 = v9 + 24 * v8;
    while (*(_DWORD *)(v9 + 8) != v7)
    {
      v9 += 24;
      if (v9 >= v10)
        goto LABEL_8;
    }
    sub_2095326A0(v14, v12, 1024, "\"\"");
    if (a3 == a4)
    {
      return fprintf(*(FILE **)(v6 + 16), "%-15s->  %ls\n");
    }
    else
    {
      sub_2095326A0(v13, v11, 1024, "\"\"");
      return fprintf(*(FILE **)(v6 + 16), "%-4s to %-7s->  %ls\n");
    }
  }
  return result;
}

uint64_t sub_2095335AC(EditLine *a1, const __int32 *a2)
{
  TokenizerW *v4;
  int v6;
  __int32 **v7;

  v7 = 0;
  v6 = 0;
  v4 = tok_winit(0);
  tok_wstr(v4, a2, &v6, (const __int32 ***)&v7);
  v6 = el_wparse(a1, v6, (const __int32 **)v7);
  tok_wend(v4);
  return v6;
}

int el_wparse(EditLine *a1, int a2, const __int32 **a3)
{
  uint64_t v4;
  __int32 *v6;
  const __int32 *v7;
  __int32 *v8;
  uint64_t v9;
  __int32 *v10;
  __int32 *v11;
  size_t v12;
  uint64_t v13;
  const __int32 *v14;

  if (a2 < 1)
  {
    LODWORD(v10) = -1;
    return (int)v10;
  }
  v4 = *(_QWORD *)&a2;
  v6 = wcschr((__int32 *)*a3, 58);
  v7 = *a3;
  if (v6)
  {
    v8 = v6;
    v9 = (char *)v6 - (char *)v7;
    if (v6 == v7)
      goto LABEL_12;
    v10 = (__int32 *)malloc_type_malloc((char *)v6 - (char *)v7, 0x100004052888210uLL);
    if (!v10)
      return (int)v10;
    v11 = v10;
    v12 = (v9 >> 2) - 1;
    wcsncpy(v10, *a3, v12);
    v11[v12] = 0;
    LODWORD(v12) = sub_209538FA4(*(__int32 **)a1, v11);
    free(v11);
    if (!(_DWORD)v12)
    {
LABEL_12:
      LODWORD(v10) = 0;
      return (int)v10;
    }
    v7 = v8 + 1;
  }
  v13 = 0;
  v14 = (const __int32 *)&unk_2095422F8;
  while (wcscmp(v14, v7))
  {
    v14 = *(const __int32 **)((char *)&off_24C1B5168 + v13 + 16);
    v13 += 16;
    if (v13 == 112)
    {
      LODWORD(v10) = -1;
      return (int)v10;
    }
  }
  LODWORD(v10) = -(*(int (**)(EditLine *, uint64_t, const __int32 **))((char *)&off_24C1B5168 + v13 + 8))(a1, v4, a3);
  return (int)v10;
}

uint64_t sub_20953373C(__int32 **a1)
{
  __int32 *v1;
  int v2;
  __int32 *v3;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  __int32 *v10;
  _OWORD v12[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = *a1 + 1;
  v2 = *v3;
  if (!*v3)
    return 0xFFFFFFFFLL;
  v5 = *v1;
  if ((_DWORD)v5 == 94)
  {
    if (v2 == 63)
      v5 = 127;
    else
      v5 = v2 & 0x9F;
    goto LABEL_14;
  }
  if ((_DWORD)v5 == 92)
  {
    if (v2 > 96)
    {
      v5 = 7;
      switch(v2)
      {
        case 'a':
          goto LABEL_14;
        case 'b':
          v5 = 8;
          break;
        case 'c':
        case 'd':
LABEL_40:
          v5 = (*a1)[1];
          break;
        case 'e':
          v5 = 27;
          break;
        case 'f':
          v5 = 12;
          break;
        default:
          switch(v2)
          {
            case 'n':
              v5 = 10;
              break;
            case 'r':
              v5 = 13;
              break;
            case 't':
              v5 = 9;
              break;
            case 'v':
              v5 = 11;
              break;
            default:
              goto LABEL_40;
          }
          break;
      }
      goto LABEL_14;
    }
    if ((v2 - 48) >= 8)
    {
      v5 = (*a1)[1];
      if (v2 != 85)
        goto LABEL_14;
      v13 = 0;
      v12[0] = xmmword_2095422B4;
      v12[1] = unk_2095422C4;
      v12[2] = xmmword_2095422D4;
      v12[3] = unk_2095422E4;
      if (v1[2] == 43)
      {
        LODWORD(v5) = 0;
        v3 = v1 + 3;
        v9 = 5;
        while (1)
        {
          v10 = wcschr((__int32 *)v12, *v3);
          if (v9 != 1 && !v10)
            break;
          v3 += v10 != 0;
          if (v10)
            v5 = ((unint64_t)((char *)v10 - (char *)v12) >> 2) | (16 * (_DWORD)v5);
          else
            v5 = v5;
          if (!--v9)
          {
            if ((int)v5 < 1114112)
              goto LABEL_14;
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
    else
    {
      v5 = 0;
      v6 = (unsigned int *)(v1 + 4);
      v7 = 1;
      while (1)
      {
        v8 = v1[v7];
        if (v8 - 56 < 0xFFFFFFF8)
          break;
        v5 = (v8 - 48) | (8 * (_DWORD)v5);
        if ((_DWORD)(++v7 * 4) == 16)
          goto LABEL_21;
      }
      v6 = (unsigned int *)&v1[v7];
LABEL_21:
      if (v5 < 0x100)
      {
        v3 = (__int32 *)(v6 - 1);
        goto LABEL_14;
      }
    }
    return 0xFFFFFFFFLL;
  }
  v3 = *a1;
LABEL_14:
  *a1 = v3 + 1;
  return v5;
}

__int32 *sub_209533960(__int32 *a1, __int32 *a2)
{
  __int32 *v2;
  __int32 *i;
  __int32 v4;
  __int32 v5;
  __int32 *v7;

  v2 = a1;
  v7 = a2;
  for (i = a1; ; ++i)
  {
    v4 = *a2;
    if (*a2 <= 91)
      break;
    if (v4 != 92 && v4 != 94)
      goto LABEL_12;
    v5 = sub_20953373C(&v7);
    if (v5 == -1)
      return 0;
    *i = v5;
    a2 = v7;
LABEL_13:
    ;
  }
  if (v4 == 77)
  {
    if (a2[1] == 45 && a2[2])
    {
      *i = 27;
      v7 = a2 + 2;
      a2 += 2;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v4)
  {
LABEL_12:
    v7 = ++a2;
    *i = v4;
    goto LABEL_13;
  }
  *i = 0;
  return v2;
}

uint64_t sub_209533A28(uint64_t a1, __int32 *a2)
{
  uint64_t v4;
  const __int32 **i;

  if (!*(_DWORD *)(a1 + 1120))
    return 0xFFFFFFFFLL;
  v4 = 0;
  for (i = (const __int32 **)(*(_QWORD *)(a1 + 1104) + 8); wcscmp(*(i - 1), a2); i += 3)
  {
    if (++v4 >= (unint64_t)*(int *)(a1 + 1120))
      return 0xFFFFFFFFLL;
  }
  return *(unsigned int *)i;
}

double sub_209533A94(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  __int32 *v6;
  unsigned __int32 v7;
  _BOOL4 v8;
  unsigned __int32 *v9;
  unsigned __int32 v10;
  double result;

  v3 = 888;
  if (a2)
  {
    v4 = a1 + 888;
  }
  else
  {
    v3 = 864;
    v4 = a1 + 864;
  }
  v5 = *(_DWORD *)(v4 + 20);
  v6 = (__int32 *)(*(uint64_t (**)(void))(a1 + v3))();
  if (!v5)
    v6 = sub_20953ED48(v6, a1 + 1264);
  v7 = *v6;
  if (*v6)
  {
    v8 = 0;
    v9 = (unsigned __int32 *)(v6 + 1);
    do
    {
      if (*(_DWORD *)(v4 + 16) == v7)
      {
        v8 = !v8;
      }
      else if (v8)
      {
        sub_20953A860(a1, v7);
        v8 = 1;
      }
      else
      {
        sub_209537BD0(a1, v7, 1);
        v8 = 0;
      }
      v10 = *v9++;
      v7 = v10;
    }
    while (v10);
  }
  result = *(double *)(a1 + 848);
  *(double *)(v4 + 8) = result;
  return result;
}

uint64_t sub_209533B44(uint64_t a1)
{
  *(_QWORD *)(a1 + 864) = sub_209533B78;
  *(_QWORD *)(a1 + 872) = 0;
  *(_DWORD *)(a1 + 880) = 0;
  *(_QWORD *)(a1 + 888) = sub_209533B84;
  *(_QWORD *)(a1 + 896) = 0;
  *(_DWORD *)(a1 + 904) = 0;
  return 0;
}

char *sub_209533B78()
{
  return asc_25459ABF0;
}

void *sub_209533B84()
{
  return &unk_25459ACD8;
}

uint64_t sub_209533B94(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  uint64_t v5;
  void *v6;
  BOOL v7;

  if (a4 != 21 && a4)
    v5 = a1 + 888;
  else
    v5 = a1 + 864;
  v6 = sub_209533B84;
  if (a4)
    v7 = a4 == 21;
  else
    v7 = 1;
  if (v7)
    v6 = sub_209533B78;
  if (a2)
    v6 = a2;
  *(_QWORD *)v5 = v6;
  *(_QWORD *)(v5 + 8) = 0;
  *(_DWORD *)(v5 + 16) = a3;
  *(_DWORD *)(v5 + 20) = a5;
  return 0;
}

uint64_t sub_209533BE0(uint64_t a1, _QWORD *a2, _DWORD *a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = a1 + 864;
  v5 = 888;
  if (a4)
    v4 = a1 + 888;
  else
    v5 = 864;
  *a2 = *(_QWORD *)(a1 + v5);
  result = 0;
  if (a3)
    *a3 = *(_DWORD *)(v4 + 16);
  return result;
}

uint64_t sub_209533C24(uint64_t a1)
{
  *(_QWORD *)(a1 + 1256) = sub_209533C38;
  return 0;
}

uint64_t sub_209533C38(uint64_t a1, __int32 *a2)
{
  int v4;
  unint64_t v5;
  int v6;
  ssize_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  ssize_t v12;
  __int32 v13;
  int v14;
  char v17[6];

  v4 = 0;
  v5 = 0;
  v6 = 0;
  while (1)
  {
LABEL_2:
    *(_DWORD *)(*(_QWORD *)(a1 + 1248) + 116) = 0;
    while (1)
    {
      v7 = read(*(_DWORD *)(a1 + 32), &v17[v5], 1uLL);
      if (v7 != -1)
        break;
      v8 = *__error();
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 1248) + 116);
      if (v9 == 28)
        goto LABEL_19;
      if (v9 == 19)
      {
        el_wset((EditLine *)a1, 20);
LABEL_19:
        sub_209539B5C(a1);
        goto LABEL_2;
      }
      if (v4)
      {
LABEL_32:
        *__error() = v8;
LABEL_33:
        *a2 = 0;
        return 0xFFFFFFFFLL;
      }
      v10 = *(_DWORD *)(a1 + 32);
      if (v8 == 35)
      {
LABEL_10:
        v11 = fcntl(v10, 3, 0);
        if (v11 == -1)
          goto LABEL_32;
        v4 = 1;
        if (fcntl(v10, 4, v11 & 0xFFFFFFFB) == -1)
          goto LABEL_32;
      }
      else
      {
        v4 = 1;
        if (v8 != 4)
        {
          if (v8 != -1)
            goto LABEL_32;
          goto LABEL_10;
        }
      }
    }
    v12 = v7;
    if (!v7)
      return v12;
    v13 = v17[0];
    if ((*(_BYTE *)(a1 + 44) & 0x10) == 0)
    {
      if (v17[0] < 0 && !v5)
      {
        v14 = mbtowc(a2, v17, 1uLL);
        if (v14 == 1)
          return v12;
        v6 = v14;
        v13 = v17[0];
      }
      *a2 = v13;
      goto LABEL_26;
    }
    if ((v17[0] & 0x80) == 0 || v17[0] - 245 >= 0xFFFFFFCD)
    {
      v6 = mbtowc(a2, v17, v5 + 1);
      if (v6 == -1)
      {
        mbtowc(0, 0, 0);
        if (v5++ < 5)
          continue;
        *__error() = 92;
        goto LABEL_33;
      }
LABEL_26:
      if ((*(_BYTE *)(a1 + 44) & 0x20) == 0)
        return v12;
      v5 = 0;
      if (v6 <= 1)
        return v12;
    }
  }
}

uint64_t sub_209533E1C(uint64_t a1, uint64_t (*a2)(uint64_t a1, __int32 *a2))
{
  uint64_t (*v2)(uint64_t, __int32 *);

  v2 = sub_209533C38;
  if (a2)
    v2 = a2;
  *(_QWORD *)(a1 + 1256) = v2;
  return 0;
}

uint64_t sub_209533E38(uint64_t a1)
{
  if (*(uint64_t (**)(uint64_t, __int32 *))(a1 + 1256) == sub_209533C38)
    return 0;
  else
    return *(_QWORD *)(a1 + 1256);
}

void el_wpush(EditLine *a1, const __int32 *a2)
{
  int v3;
  __int32 *v4;
  uint64_t v5;

  if (a2)
  {
    v3 = *((_DWORD *)a1 + 254);
    if (v3 <= 8)
    {
      *((_DWORD *)a1 + 254) = v3 + 1;
      v4 = sub_20953FB74(a2);
      v5 = *((int *)a1 + 254);
      *(_QWORD *)(*((_QWORD *)a1 + 128) + 8 * v5) = v4;
      if (v4)
        return;
      *((_DWORD *)a1 + 254) = v5 - 1;
    }
  }
  el_beep_0(a1);
  sub_20953B998((uint64_t)a1);
}

int el_wgetc(EditLine *a1, __int32 *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_20953B998((uint64_t)a1);
  if ((*((_DWORD *)a1 + 254) & 0x80000000) != 0)
  {
LABEL_4:
    if ((sub_20953CEFC((uint64_t)a1) & 0x80000000) != 0)
    {
      return 0;
    }
    else
    {
      v6 = (*((uint64_t (**)(EditLine *, __int32 *))a1 + 157))(a1, a2);
      if (v6 < 0)
        *((_DWORD *)a1 + 12) = *__error();
      if ((*((_BYTE *)a1 + 44) & 0x80) != 0)
        *a2 = *(char *)a2;
    }
  }
  else
  {
    while (1)
    {
      v4 = **((_QWORD **)a1 + 128);
      v5 = *((int *)a1 + 255);
      if (*(_DWORD *)(v4 + 4 * v5))
        break;
      sub_209533F90((void ***)a1 + 127);
      if ((*((_DWORD *)a1 + 254) & 0x80000000) != 0)
        goto LABEL_4;
    }
    *((_DWORD *)a1 + 255) = v5 + 1;
    *a2 = *(_DWORD *)(v4 + 4 * v5);
    if (!*(_DWORD *)(v4 + 4 * *((int *)a1 + 255)))
      sub_209533F90((void ***)a1 + 127);
    return 1;
  }
  return v6;
}

void sub_209533F90(void ***a1)
{
  uint64_t v2;
  uint64_t i;

  free(*a1[1]);
  v2 = *(unsigned int *)a1;
  if ((int)v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
      a1[1][i] = a1[1][i + 1];
  }
  *a1 = (void **)(v2 - 1);
}

uint64_t sub_209533FF0(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = result;
  v2 = *(_DWORD *)(result + 44);
  if ((v2 & 1) != 0)
  {
    result = sub_209539B5C(result);
    v2 = *(_DWORD *)(v1 + 44);
  }
  if ((v2 & 2) == 0)
  {
    if ((v2 & 0xC) == 8)
      sub_20953CEFC(v1);
    el_resize((EditLine *)v1);
    sub_2095389C8(v1);
    sub_20952D414(v1, 0);
    result = sub_209537D30(v1);
    if ((*(_BYTE *)(v1 + 44) & 8) != 0)
      return sub_20953B998(v1);
  }
  return result;
}

uint64_t sub_209534074(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = result;
  v2 = *(_DWORD *)(result + 44);
  if ((v2 & 8) == 0)
  {
    result = sub_20953D3EC(result);
    v2 = *(_DWORD *)(v1 + 44);
  }
  if ((v2 & 1) != 0)
    return sub_209539D30(v1);
  return result;
}

const __int32 *__cdecl el_wgets(EditLine *a1, int *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  __int32 v7;
  unsigned int v8;
  int v9;
  __int32 v10;
  __int32 *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  _DWORD *v16;
  int *v17;
  int v18;
  int *v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  const __int32 *result;
  int v30;
  int *v31;
  _DWORD *v32;
  __int32 v33;
  __int32 *v34;

  if (a2)
    *a2 = 0;
  v33 = 0;
  v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 2) != 0)
  {
    v17 = (int *)*((_QWORD *)a1 + 11);
    while (1)
    {
      v18 = (*((uint64_t (**)(EditLine *, int *))a1 + 157))(a1, v17);
      if (v18 != 1)
        goto LABEL_74;
      if ((unint64_t)(v17 + 1) >= *((_QWORD *)a1 + 14))
      {
        v20 = *((_QWORD *)a1 + 11);
        if (!sub_20952CA08((uint64_t)a1, 2uLL))
          goto LABEL_84;
        v19 = (int *)((char *)v17 + *((_QWORD *)a1 + 11) - v20);
      }
      else
      {
        v19 = v17;
      }
      v17 = v19 + 1;
      if ((*((_BYTE *)a1 + 44) & 8) != 0)
      {
LABEL_84:
        LODWORD(v15) = 1;
        goto LABEL_90;
      }
      v21 = *v19;
      LODWORD(v15) = 1;
      if (v21 == 10 || v21 == 13)
        goto LABEL_90;
    }
  }
  if ((v4 & 8) == 0)
  {
    sub_209533FF0((uint64_t)a1);
    v4 = *((_DWORD *)a1 + 11);
  }
  if ((v4 & 4) != 0)
  {
    v22 = (v4 & 8) == 0;
    v23 = 104;
    if (v22)
      v23 = 88;
    v17 = *(int **)((char *)a1 + v23);
    sub_20953B998((uint64_t)a1);
    while (1)
    {
      v18 = (*((uint64_t (**)(EditLine *, int *))a1 + 157))(a1, v17);
      if (v18 != 1)
        break;
      if ((unint64_t)(v17 + 1) >= *((_QWORD *)a1 + 14))
      {
        v25 = *((_QWORD *)a1 + 11);
        if (!sub_20952CA08((uint64_t)a1, 2uLL))
          goto LABEL_84;
        v24 = (int *)((char *)v17 + *((_QWORD *)a1 + 11) - v25);
      }
      else
      {
        v24 = v17;
      }
      v17 = v24 + 1;
      if ((*((_DWORD *)a1 + 11) & 8) != 0)
        goto LABEL_84;
      v26 = *v24;
      LODWORD(v15) = 1;
      if (v26 == 10 || v26 == 13)
        goto LABEL_90;
    }
LABEL_74:
    LODWORD(v15) = v18;
    if (v18 == -1)
    {
      if (*__error() == 4)
        v17 = (int *)*((_QWORD *)a1 + 11);
      *((_DWORD *)a1 + 12) = *__error();
      LODWORD(v15) = -1;
    }
    else if (!v18)
    {
      *((_BYTE *)a1 + 137) = -1;
    }
LABEL_90:
    *((_QWORD *)a1 + 12) = v17;
    *((_QWORD *)a1 + 13) = v17;
    *v17 = 0;
    v27 = ((unint64_t)v17 - *((_QWORD *)a1 + 11)) >> 2;
LABEL_91:
    LODWORD(v28) = v27;
    if (!a2)
      goto LABEL_93;
    goto LABEL_92;
  }
  v5 = MEMORY[0x24BDAC740];
  while (2)
  {
    while (2)
    {
      while (2)
      {
        *((_DWORD *)a1 + 12) = 0;
        do
        {
          v6 = el_wgetc(a1, &v33);
          if (v6 != 1)
          {
            if (v6)
              v6 = *__error();
            LODWORD(v15) = 0;
            *((_DWORD *)a1 + 12) = v6;
            *((_BYTE *)a1 + 137) = -1;
            goto LABEL_80;
          }
          if (*((_DWORD *)a1 + 33))
          {
            *((_DWORD *)a1 + 33) = 0;
            v7 = v33 | 0x80;
            v33 |= 0x80u;
          }
          else
          {
            v7 = v33;
          }
          if (v7 <= 255)
          {
            v8 = *(unsigned __int8 *)(*((_QWORD *)a1 + 133) + v7);
            if (v8 == 24)
            {
              v34 = 0;
              v9 = sub_209531FE8(a1, &v33, &v34);
              if (v9 == 1)
              {
                el_wpush(a1, v34);
                v8 = 24;
              }
              else
              {
                if (v9)
                  abort();
                v8 = v34;
              }
            }
          }
          else
          {
            v8 = 8;
          }
          if (!*((_QWORD *)a1 + 131))
            *((_QWORD *)a1 + 133) = *((_QWORD *)a1 + 132);
        }
        while (v8 == 24);
        if (*((_DWORD *)a1 + 12) == 4)
        {
          v32 = (_DWORD *)*((_QWORD *)a1 + 11);
          *v32 = 0;
          *((_QWORD *)a1 + 12) = v32;
          *((_QWORD *)a1 + 13) = v32;
          LODWORD(v15) = -1;
          goto LABEL_80;
        }
        if (*((_DWORD *)a1 + 280) <= v8)
          continue;
        break;
      }
      *((_BYTE *)a1 + 137) = v8;
      v10 = v33;
      *((_DWORD *)a1 + 35) = v33;
      if (*((_DWORD *)a1 + 274) == 1 && *((_QWORD *)a1 + 133) == *((_QWORD *)a1 + 132))
      {
        v11 = (__int32 *)*((_QWORD *)a1 + 121);
        if ((unint64_t)v11 < *((_QWORD *)a1 + 122))
        {
          if (v8 == 64 && v11 != *((__int32 **)a1 + 120))
          {
            v12 = *(v11 - 1);
            if (v12 > 0x7F)
              v13 = __maskrune(v12, 0x40000uLL);
            else
              v13 = *(_DWORD *)(v5 + 4 * v12 + 60) & 0x40000;
            if (v13)
            {
              *((_QWORD *)a1 + 121) -= 4;
              goto LABEL_37;
            }
            v10 = v33;
            v11 = (__int32 *)*((_QWORD *)a1 + 121);
          }
          *v11 = v10;
          *((_QWORD *)a1 + 121) = v11 + 1;
        }
      }
LABEL_37:
      v14 = (*(uint64_t (**)(EditLine *, _QWORD))(*((_QWORD *)a1 + 139) + 8 * v8))(a1, v33);
      *((_BYTE *)a1 + 136) = v8;
      LODWORD(v15) = -1;
      switch(v14)
      {
        case 0:
          goto LABEL_48;
        case 1:
          v15 = (*((_QWORD *)a1 + 13) - *((_QWORD *)a1 + 11)) >> 2;
          goto LABEL_48;
        case 2:
          if ((*((_BYTE *)a1 + 44) & 8) != 0)
          {
            v16 = (_DWORD *)*((_QWORD *)a1 + 13);
            *v16++ = 4;
            *((_QWORD *)a1 + 12) = v16;
            *((_QWORD *)a1 + 13) = v16;
            LODWORD(v15) = 1;
          }
          else
          {
            LODWORD(v15) = 0;
          }
          goto LABEL_48;
        case 3:
          continue;
        case 4:
          goto LABEL_45;
        case 5:
          sub_209538A00((uint64_t)a1);
          goto LABEL_47;
        case 7:
          sub_2095389C8((uint64_t)a1);
          sub_20952D414((uint64_t)a1, 1);
          goto LABEL_45;
        case 8:
          sub_209538E10((uint64_t)a1);
          sub_2095389C8((uint64_t)a1);
LABEL_45:
          sub_209537D30((uint64_t)a1);
          break;
        case 9:
          sub_209537D30((uint64_t)a1);
          el_beep_0(a1);
          break;
        default:
          el_beep_0(a1);
          sub_20953B998((uint64_t)a1);
          break;
      }
      break;
    }
LABEL_47:
    LODWORD(v15) = -1;
LABEL_48:
    *(_QWORD *)((char *)a1 + 124) = 0x100000000;
    *((_DWORD *)a1 + 250) = 0;
    if ((*((_BYTE *)a1 + 44) & 8) == 0 && (_DWORD)v15 == -1)
      continue;
    break;
  }
LABEL_80:
  sub_20953B998((uint64_t)a1);
  if ((*((_BYTE *)a1 + 44) & 8) == 0)
  {
    sub_209534074((uint64_t)a1);
    if ((_DWORD)v15 == -1)
      LODWORD(v27) = 0;
    else
      LODWORD(v27) = v15;
    goto LABEL_91;
  }
  v28 = (*((_QWORD *)a1 + 13) - *((_QWORD *)a1 + 11)) >> 2;
  LODWORD(v27) = v28;
  if (a2)
  {
LABEL_92:
    *a2 = v27;
    LODWORD(v28) = v27;
  }
LABEL_93:
  if ((_DWORD)v28)
  {
    result = (const __int32 *)*((_QWORD *)a1 + 11);
    result[(int)v28] = 0;
  }
  else if ((_DWORD)v15 == -1)
  {
    if (a2)
      *a2 = -1;
    v30 = *((_DWORD *)a1 + 12);
    v31 = __error();
    result = 0;
    *v31 = v30;
  }
  else
  {
    return 0;
  }
  return result;
}

void rl_prep_terminal(int a1)
{
  el_set((EditLine *)qword_25459ACE8, 16, 1);
}

void rl_deprep_terminal(void)
{
  el_set((EditLine *)qword_25459ACE8, 16, 0);
}

int rl_set_prompt(const char *a1)
{
  const char *v1;
  char *v2;
  char *i;
  char *v4;

  if (a1)
    v1 = a1;
  else
    v1 = (const char *)&unk_209547D1A;
  v2 = rl_prompt;
  if (rl_prompt)
  {
    LODWORD(i) = strcmp(rl_prompt, v1);
    if (!(_DWORD)i)
      return (int)i;
    free(v2);
  }
  v4 = strdup(v1);
  rl_prompt = v4;
  if (v4)
  {
    for (i = strchr(v4, 2); i; i = strchr(rl_prompt, 2))
      *i = 1;
  }
  else
  {
    LODWORD(i) = -1;
  }
  return (int)i;
}

int rl_initialize(void)
{
  FILE *v0;
  int v1;
  int v2;
  char c_lflag;
  EditLine *v4;
  History *v5;
  int result;
  const LineInfo *v7;
  int buffer;
  HistEvent v9;
  termios v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (qword_25459ACE8)
    el_end((EditLine *)qword_25459ACE8);
  if (qword_25459ACF0)
    history_end((History *)qword_25459ACF0);
  v0 = rl_instream;
  if (!rl_instream)
  {
    v0 = (FILE *)*MEMORY[0x24BDAC8E0];
    rl_instream = (FILE *)*MEMORY[0x24BDAC8E0];
  }
  if (!rl_outstream)
    rl_outstream = (FILE *)*MEMORY[0x24BDAC8E8];
  *(_QWORD *)&v9.num = 0;
  v9.str = 0;
  memset(&v10, 0, sizeof(v10));
  v1 = fileno(v0);
  v2 = tcgetattr(v1, &v10);
  c_lflag = v10.c_lflag;
  v4 = el_init(rl_readline_name, rl_instream, rl_outstream, (FILE *)*MEMORY[0x24BDAC8D8]);
  qword_25459ACE8 = (uint64_t)v4;
  if (v2 != -1 && (c_lflag & 8) == 0)
    el_set(v4, 11, 0);
  v5 = history_init();
  qword_25459ACF0 = (uint64_t)v5;
  result = -1;
  if (qword_25459ACE8 && v5)
  {
    history(v5, &v9, 1, 0x7FFFFFFFLL);
    history_length = 0;
    max_input_history = 0x7FFFFFFF;
    el_set((EditLine *)qword_25459ACE8, 10, history, qword_25459ACF0);
    el_set((EditLine *)qword_25459ACE8, 23, sub_209534A28, &rl_line_buffer);
    if (rl_getc_function)
      el_set((EditLine *)qword_25459ACE8, 13, sub_209534A50);
    if (rl_set_prompt((const char *)&unk_209547D1A) == -1)
    {
      history_end((History *)qword_25459ACF0);
      el_end((EditLine *)qword_25459ACE8);
      return -1;
    }
    else
    {
      el_set((EditLine *)qword_25459ACE8, 21, sub_209534A94, 1);
      el_set((EditLine *)qword_25459ACE8, 3, dword_25459AC50);
      el_set((EditLine *)qword_25459ACE8, 2, "emacs");
      if (rl_terminal_name)
        el_set((EditLine *)qword_25459ACE8, 1, rl_terminal_name);
      else
        el_get((EditLine *)qword_25459ACE8, 1, &rl_terminal_name);
      el_set((EditLine *)qword_25459ACE8, 9, "rl_complete", "ReadLine compatible completion function", sub_209534AAC);
      el_set((EditLine *)qword_25459ACE8, 4, "^I", "rl_complete", 0);
      el_set((EditLine *)qword_25459ACE8, 9, "rl_tstp", "ReadLine compatible suspend function", sub_209534AC4);
      el_set((EditLine *)qword_25459ACE8, 4, "^Z", "rl_tstp", 0);
      el_set((EditLine *)qword_25459ACE8, 4, "^W", "ed-delete-prev-word", 0);
      el_source((EditLine *)qword_25459ACE8, 0);
      rl_line_buffer = (char *)el_line((EditLine *)qword_25459ACE8)->buffer;
      v7 = el_line((EditLine *)qword_25459ACE8);
      buffer = (int)v7->buffer;
      rl_point = LODWORD(v7->cursor) - LODWORD(v7->buffer);
      rl_end = LODWORD(v7->lastchar) - buffer;
      if (rl_startup_hook)
        rl_startup_hook(0, 0);
      return 0;
    }
  }
  return result;
}

const LineInfo *sub_209534A28(EditLine *a1, const char **a2)
{
  const LineInfo *result;

  result = el_line(a1);
  *a2 = result->buffer;
  return result;
}

uint64_t sub_209534A50(uint64_t a1, _BYTE *a2)
{
  int v3;

  v3 = rl_getc_function(0);
  if (v3 == -1)
    return 0;
  *a2 = v3;
  return 1;
}

char *sub_209534A94()
{
  rl_already_prompted = 1;
  return rl_prompt;
}

uint64_t sub_209534AAC(int a1, int a2)
{
  return rl_complete(a1, a2);
}

uint64_t sub_209534AC4()
{
  kill(0, 18);
  return 0;
}

char *__cdecl readline(const char *a1)
{
  BOOL v1;
  EditLine *v2;
  char *result;
  const char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  int v8;
  char *v9;
  HistEvent v10;

  *(_QWORD *)&v10.num = 0;
  v10.str = 0;
  v9 = (char *)a1;
  v8 = 0;
  if (qword_25459ACE8)
    v1 = qword_25459ACF0 == 0;
  else
    v1 = 1;
  if (v1)
    rl_initialize();
  dword_25459BAB8 = 0;
  setjmp(dword_25459ACFC);
  if (rl_set_prompt(v9) == -1)
    return 0;
  if (rl_pre_input_hook)
    rl_pre_input_hook(0, 0);
  v2 = (EditLine *)qword_25459ACE8;
  if (!off_25459BAC0
    || (*(_BYTE *)(qword_25459ACE8 + 44) & 2) == 0
    && (el_set((EditLine *)qword_25459ACE8, 13, sub_209534C74),
        byte_25459ACF8 = 1,
        v2 = (EditLine *)qword_25459ACE8,
        !off_25459BAC0))
  {
    if (byte_25459ACF8)
    {
      el_set(v2, 13, 0);
      byte_25459ACF8 = 0;
      v2 = (EditLine *)qword_25459ACE8;
    }
  }
  rl_already_prompted = 0;
  v4 = el_gets(v2, &v8);
  v5 = 0;
  if (v4)
  {
    v6 = (v8 - 1);
    if (v8 >= 1)
    {
      result = strdup(v4);
      if (!result)
        return result;
      if (result[v6] == 10)
        result[v6] = 0;
      v5 = result;
    }
  }
  v7 = v5;
  history((History *)qword_25459ACF0, &v10, 2);
  history_length = v10.num;
  return v7;
}

uint64_t sub_209534C74(uint64_t a1, _BYTE *a2)
{
  void (*v3)(void);
  ssize_t v5;
  int *v6;
  int v8;

  v8 = 0;
  *a2 = 0;
  v3 = (void (*)(void))off_25459BAC0;
  if (off_25459BAC0)
  {
    while (1)
    {
      while (1)
      {
        v3();
        if (ioctl(*(_DWORD *)(a1 + 32), 0x4004667FuLL, &v8) < 0)
          return 0xFFFFFFFFLL;
        if (v8)
          break;
        v5 = 0;
LABEL_9:
        v3 = (void (*)(void))off_25459BAC0;
        if (v5 || !off_25459BAC0)
        {
LABEL_11:
          if (v3)
            return v5;
          goto LABEL_14;
        }
      }
      v5 = read(*(_DWORD *)(a1 + 32), a2, 1uLL);
      if ((v5 & 0x8000000000000000) == 0)
        goto LABEL_9;
      v6 = __error();
      v3 = (void (*)(void))off_25459BAC0;
      if (*v6 != 35)
        goto LABEL_11;
      if (!off_25459BAC0)
        goto LABEL_14;
    }
  }
  v5 = 0;
LABEL_14:
  el_set((EditLine *)a1, 13, 0);
  return v5;
}

void using_history(void)
{
  BOOL v0;

  if (qword_25459ACF0)
    v0 = qword_25459ACE8 == 0;
  else
    v0 = 1;
  if (v0)
    rl_initialize();
}

const char *__cdecl get_history_event(const char *a1, int *a2, int a3)
{
  uint64_t v3;
  int v4;
  int v7;
  int v9;
  const char *str;
  int v11;
  int v12;
  int v13;
  const char *v14;
  int v15;
  int v16;
  HIST_ENTRY *v17;
  size_t v18;
  int v19;
  uint64_t v20;
  const char *v21;
  int v22;
  unsigned int v23;
  uint64_t v25;
  BOOL v26;
  int v28;
  int v29;
  int v30;
  char *v31;
  char *v32;
  uint64_t num;
  int v34;
  HistEvent v36;
  HistEvent v37;

  v3 = *a2;
  v4 = a1[v3];
  if (v4 != asc_25459AC1C[0])
    return 0;
  *(_QWORD *)&v36.num = 0;
  v36.str = 0;
  v7 = a1[v3 + 1];
  if (v7 != v4 && v7 != 0)
  {
    if (v7 == 45)
      v11 = v3 + 2;
    else
      v11 = v3 + 1;
    v12 = a1[v11];
    if ((v12 - 48) > 9)
    {
      v18 = 0;
      if (v12 == 63)
        v19 = v11 + 1;
      else
        v19 = v11;
      v20 = v19;
      v21 = &a1[v19];
      while (1)
      {
        v22 = v21[v18];
        v23 = (char)v22;
        if (!v21[v18] || v22 == 10)
          break;
        if (v12 == 63 && (char)v22 == 63)
        {
          v29 = v11 + 1 + v18;
          goto LABEL_51;
        }
        if (v12 != 63)
        {
          v25 = (1 << v22) & 0x400000100000200;
          v26 = v23 > 0x3A || v25 == 0;
          if (!v26 || v23 == a3)
          {
            v29 = v11 + v18;
            v18 += v19 - (uint64_t)v11;
            v20 = v11;
            goto LABEL_48;
          }
        }
        ++v18;
      }
      if (v12 == 63)
        v28 = v11 + 1;
      else
        v28 = v11;
      v29 = v28 + v18;
      if (v12 != 63)
      {
LABEL_48:
        v30 = v29;
        if (v11 == v29)
          return 0;
        goto LABEL_59;
      }
LABEL_51:
      if ((char)v22 == 63)
        v30 = v29 + 1;
      else
        v30 = v29;
      if (v19 == v29)
      {
        v31 = (char *)qword_25459ADC0;
        if (qword_25459ADC0)
        {
          if (*(_BYTE *)qword_25459ADC0)
          {
            v29 = v19;
            goto LABEL_61;
          }
        }
      }
      if (v19 == v29)
        return 0;
LABEL_59:
      v32 = (char *)malloc_type_malloc(v18 + 1, 0x100004077774924uLL);
      if (!v32)
        return 0;
      v31 = v32;
      strncpy(v32, &a1[v20], v18)[v18] = 0;
LABEL_61:
      if (!history((History *)qword_25459ACF0, &v36, 8))
      {
        num = v36.num;
        if (v12 == 63)
        {
          if (v31 != (char *)qword_25459ADC0)
          {
            if (qword_25459ADC0)
              free((void *)qword_25459ADC0);
            qword_25459ADC0 = (uint64_t)v31;
          }
          v34 = history_search(v31, -1);
        }
        else
        {
          *(_QWORD *)&v37.num = 0;
          v37.str = 0;
          v34 = history((History *)qword_25459ACF0, &v37, 14, v31);
        }
        if (v34 != -1)
        {
          if (v12 == 63 && v29 != v19)
          {
            if (qword_25459ADC8 && (char *)qword_25459ADC8 != v31)
              free((void *)qword_25459ADC8);
            qword_25459ADC8 = (uint64_t)v31;
          }
          if (v31 != (char *)qword_25459ADC0)
            free(v31);
          if (!history((History *)qword_25459ACF0, &v36, 8))
          {
            *a2 = v30;
            str = v36.str;
            history((History *)qword_25459ACF0, &v36, 7, num);
            return str;
          }
          return 0;
        }
        history((History *)qword_25459ACF0, &v36, 3);
        fprintf(rl_outstream, "%s: Event not found\n", v31);
      }
      if (v31 != (char *)qword_25459ADC0)
        free(v31);
    }
    else
    {
      v13 = 0;
      v14 = &a1[v11 + 1];
      do
      {
        v13 = v12 + 10 * v13 - 48;
        v15 = *(unsigned __int8 *)v14++;
        v12 = v15;
        ++v11;
      }
      while ((v15 - 48) < 0xA);
      if (v7 == 45)
        v16 = history_length - v13 + 1;
      else
        v16 = v13;
      v17 = history_get(v16);
      if (v17)
      {
        *a2 = v11;
        return v17->line;
      }
    }
    return 0;
  }
  if (history((History *)qword_25459ACF0, &v36, 3))
    return 0;
  if (a1[v3 + 1])
    v9 = v3 + 2;
  else
    v9 = v3 + 1;
  *a2 = v9;
  return v36.str;
}

HIST_ENTRY *__cdecl history_get(int a1)
{
  BOOL v2;
  HIST_ENTRY *v3;
  uint64_t num;
  HistEvent v6;

  if (qword_25459ACF0)
    v2 = qword_25459ACE8 == 0;
  else
    v2 = 1;
  if (v2)
    rl_initialize();
  if (history_base <= a1)
  {
    *(_QWORD *)&v6.num = 0;
    v6.str = 0;
    v3 = 0;
    if (history((History *)qword_25459ACF0, &v6, 8))
      return v3;
    num = v6.num;
    if (!history((History *)qword_25459ACF0, &v6, 4)
      && !history((History *)qword_25459ACF0, &v6, 23, (a1 - history_base), &unk_25459ADD8))
    {
      v3 = (HIST_ENTRY *)&qword_25459ADD0;
      qword_25459ADD0 = (uint64_t)v6.str;
      history((History *)qword_25459ACF0, &v6, 7, num);
      return v3;
    }
  }
  return 0;
}

int history_search(const char *a1, int a2)
{
  uint64_t num;
  int v5;
  int str;
  char *v7;
  HistEvent v9;

  *(_QWORD *)&v9.num = 0;
  v9.str = 0;
  if (history((History *)qword_25459ACF0, &v9, 8))
    return -1;
  num = v9.num;
  if (a2 >= 0)
    v5 = 5;
  else
    v5 = 6;
  while (1)
  {
    str = (int)v9.str;
    v7 = strstr((char *)v9.str, a1);
    if (v7)
      break;
    if (history((History *)qword_25459ACF0, &v9, v5))
    {
      history((History *)qword_25459ACF0, &v9, 7, num);
      return -1;
    }
  }
  return (_DWORD)v7 - str;
}

int history_search_prefix(const char *a1, int a2)
{
  HistEvent v3;

  *(_QWORD *)&v3.num = 0;
  v3.str = 0;
  if (a2 >= 0)
    return history((History *)qword_25459ACF0, &v3, 13, a1);
  else
    return history((History *)qword_25459ACF0, &v3, 14, a1);
}

int history_expand(char *a1, char **a2)
{
  BOOL v4;
  size_t v5;
  char *v6;
  char v7;
  char *v8;
  char *v9;
  size_t v10;
  size_t v11;
  char *v12;
  int v13;
  char v14;
  size_t v15;
  char v16;
  size_t i;
  uint64_t v18;
  int v19;
  int v20;
  char v21;
  const char *v22;
  BOOL v23;
  size_t v24;
  size_t v25;
  const char *v26;
  unint64_t v27;
  char v28;
  const char *v29;
  int v30;
  const char *v31;
  char *v32;
  uint64_t v33;
  _BOOL4 v34;
  int v35;
  int v36;
  char *v37;
  const char *history_event;
  const char *v39;
  int v40;
  unsigned __int8 *v41;
  const char *v42;
  char *v43;
  char *v44;
  unsigned __int8 v45;
  int v46;
  int v47;
  const char *v48;
  const char *v49;
  char *v50;
  int v51;
  int v52;
  unsigned __int8 v53;
  int v54;
  int v55;
  const char *v56;
  int v57;
  char *v58;
  char *v59;
  int v60;
  char *v61;
  int v62;
  uint64_t v63;
  int v64;
  _BYTE *v65;
  int v66;
  uint64_t v67;
  size_t v68;
  char *v69;
  int v70;
  BOOL v71;
  int v72;
  _BYTE *v73;
  _BYTE *v74;
  const char *v75;
  uint64_t v76;
  int v77;
  unint64_t v78;
  _BYTE *v79;
  int v80;
  int v82;
  char *v83;
  char *v84;
  BOOL v85;
  const char *v86;
  size_t v87;
  size_t v88;
  size_t v89;
  size_t v90;
  int v91;
  int v92;
  uint64_t v93;
  char *v94;
  int v95;
  char *v96;
  const char *v97;
  int v98;
  char *v99;
  size_t v100;
  size_t v101;
  size_t v102;
  char *v103;
  void *v104;
  void **v106;
  int v107;
  size_t __n;
  size_t v109;
  char *__s1;
  char *__s1a;
  size_t v112;
  char *ptr;
  char *__src;
  size_t __srca;
  size_t __srcb;
  char *__srcc;
  size_t v118;
  const char *v119;
  int v120;
  char v121[4];
  int v122;

  if (qword_25459ACF0)
    v4 = qword_25459ACE8 == 0;
  else
    v4 = 1;
  if (v4)
    rl_initialize();
  if (!asc_25459AC1C[0])
  {
    LODWORD(v8) = 0;
    *a2 = strdup(a1);
    return (int)v8;
  }
  *a2 = 0;
  if (*a1 == asc_25459AC1C[1])
  {
    v5 = strlen(a1);
    v6 = (char *)malloc_type_malloc(v5 + 5, 0x100004077774924uLL);
    *a2 = v6;
    if (v6)
    {
      v7 = asc_25459AC1C[0];
      v6[1] = asc_25459AC1C[0];
      **a2 = v7;
      (*a2)[2] = 58;
      (*a2)[3] = 115;
      strcpy(*a2 + 4, a1);
      a1 = *a2;
      goto LABEL_13;
    }
LABEL_238:
    LODWORD(v8) = 0;
    return (int)v8;
  }
  v9 = strdup(a1);
  *a2 = v9;
  if (!v9)
    goto LABEL_238;
LABEL_13:
  if (!*a1)
  {
    v103 = 0;
    LODWORD(v8) = 0;
    goto LABEL_235;
  }
  v106 = (void **)a2;
  v112 = 0;
  ptr = 0;
  v10 = 0;
  v11 = 0;
  v12 = a1;
  while (2)
  {
    v13 = 0;
    v14 = 0;
    v15 = v10;
    __src = v12;
    v118 = v10;
    v16 = 1;
    for (i = v10; ; i = v10)
    {
      while (1)
      {
        v10 = v15;
        v12 = &a1[v15];
        v18 = a1[v15];
        v19 = (char)v18;
        if ((_DWORD)v18 != 92)
          break;
        ++v15;
        v22 = &a1[v10 + 1];
        if (*(unsigned __int8 *)v22 == asc_25459AC1C[0])
        {
          strcpy(v12, v22);
        }
        else
        {
          if ((v14 & 1) != 0)
            goto LABEL_24;
          LOBYTE(v19) = 92;
LABEL_31:
          if (asc_25459AC1C[0] == v19)
          {
            v15 = v10 + 1;
            if (!strchr((char *)qword_25459AC28, a1[v10 + 1]))
            {
              if (!off_25459BAD0)
                goto LABEL_36;
              if (!off_25459BAD0(a1, v10))
              {
                LOBYTE(v19) = *v12;
                goto LABEL_36;
              }
            }
          }
          else
          {
            v15 = v10 + 1;
          }
        }
      }
      if (!a1[v15])
        break;
      if ((v14 & 1) == 0)
        goto LABEL_31;
      if ((char)v18 < 0)
      {
        v20 = __maskrune(v18, 0x4000uLL);
        v21 = *v12;
        goto LABEL_25;
      }
LABEL_24:
      v20 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v18 + 60) & 0x4000;
      v21 = v19;
LABEL_25:
      v23 = v13 != v19 && v20 == 0;
      LOBYTE(v19) = v21;
      if (v23)
        goto LABEL_31;
LABEL_36:
      if (v19 == 0 || (v16 & 1) == 0)
        break;
      if (v10)
      {
        if (a1[v10 - 1] == 34)
          v13 = 34;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v16 = 0;
      if (a1[v10 + 1] == asc_25459AC1C[0])
        v15 = v10 + 2;
      else
        v15 = v10 + 1;
      v14 = 1;
    }
    v24 = i - v118;
    v25 = i - v118 + v11;
    if (v25 + 1 <= v112)
    {
      v8 = ptr;
    }
    else
    {
      v112 += v24 + 1;
      v8 = (char *)malloc_type_realloc(ptr, v112, 0x100004077774924uLL);
      if (!v8)
      {
        free(*v106);
        return (int)v8;
      }
    }
    strncpy(&v8[v11], __src, v24);
    v8[v25] = 0;
    v26 = &a1[i];
    v27 = v10 - i;
    if (!a1[i] || a1[i] != asc_25459AC1C[0])
    {
      v103 = v8;
      if (v27 + v25 + 1 <= v112)
      {
        a2 = (char **)v106;
      }
      else
      {
        v103 = (char *)malloc_type_realloc(v8, v27 + v112 + 1, 0x100004077774924uLL);
        a2 = (char **)v106;
        if (!v103)
        {
          v104 = *v106;
LABEL_237:
          free(v104);
          goto LABEL_238;
        }
      }
      strncpy(&v103[v25], v26, v10 - i);
      v103[v27 + v25] = 0;
      LODWORD(v8) = v118 != 0;
      goto LABEL_235;
    }
    ptr = v8;
    v122 = 0;
    v28 = a1[i + 1];
    if (!memchr(":^*$", v28, 5uLL))
    {
      v109 = i - v118 + v11;
      v35 = v28;
      v34 = v28 != 35;
      if (v28 == 35)
      {
        v37 = (char *)malloc_type_malloc(i + 1, 0x100004077774924uLL);
        if (v37)
        {
          history_event = strncpy(v37, a1, i);
          v31 = 0;
          history_event[i] = 0;
          LODWORD(v33) = 1;
          v122 = 1;
          v32 = (char *)history_event;
LABEL_67:
          if (a1[i + (int)v33] == 58)
          {
            v33 = (int)v33;
            goto LABEL_69;
          }
          v43 = strdup(history_event);
          if (v35 == 35)
            free(v32);
          if (v43)
            LODWORD(v8) = 1;
          else
            LODWORD(v8) = -1;
          goto LABEL_214;
        }
      }
      else
      {
        if (i)
        {
          if (a1[i - 1] == 34)
            v36 = 34;
          else
            v36 = 0;
        }
        else
        {
          v36 = 0;
        }
        history_event = get_history_event(&a1[i], &v122, v36);
        if (history_event)
        {
          v32 = 0;
          LODWORD(v33) = v122;
          v31 = history_event;
          goto LABEL_67;
        }
      }
      LODWORD(v8) = -1;
      v25 = v109;
      goto LABEL_222;
    }
    qmemcpy(v121, "!!0", 3);
    v29 = get_history_event(v121, &v122, 0);
    v30 = a1[i + 1];
    v122 = v30 == 58;
    if (!v29)
    {
      LODWORD(v8) = -1;
      goto LABEL_222;
    }
    v31 = v29;
    v109 = i - v118 + v11;
    v32 = 0;
    v33 = v30 == 58;
    v34 = 1;
LABEL_69:
    v39 = &v26[v33];
    v41 = (unsigned __int8 *)&v26[v33 + 1];
    v40 = (char)*v41;
    if (v40 == 37)
    {
      if (qword_25459ADC8)
        v42 = (const char *)qword_25459ADC8;
      else
        v42 = (const char *)&unk_209547D1A;
      v43 = strdup(v42);
      v44 = v32;
      goto LABEL_110;
    }
    v119 = v31;
    if (!memchr("^*$-0123456789", v40, 0xFuLL))
    {
      v44 = v32;
      if (v34)
        v48 = v119;
      else
        v48 = v32;
      v43 = strdup(v48);
      goto LABEL_110;
    }
    v45 = v40;
    if (v40 > 0x2Cu)
    {
      if (v40 == 45)
      {
        v47 = 0;
        v44 = v32;
        v49 = v119;
        goto LABEL_94;
      }
      if (v40 != 94)
        goto LABEL_98;
      v41 = (unsigned __int8 *)(v39 + 2);
      v47 = 1;
      v46 = 1;
      goto LABEL_105;
    }
    if (v40 == 36)
    {
      v41 = (unsigned __int8 *)(v39 + 2);
LABEL_104:
      v47 = -1;
      v46 = -1;
LABEL_105:
      v44 = v32;
      v49 = v119;
      goto LABEL_106;
    }
    if (v40 == 42)
    {
      v41 = (unsigned __int8 *)(v39 + 2);
      v46 = -1;
      v47 = 1;
      goto LABEL_105;
    }
LABEL_98:
    if (v40 - 48 > 9)
      goto LABEL_104;
    v44 = v32;
    v49 = v119;
    v47 = 0;
    v53 = v45;
    do
    {
      v55 = *++v41;
      v54 = v55;
      v47 = 10 * v47 + v53 - 48;
      v53 = v55;
    }
    while ((v55 - 48) < 0xA);
    if (v54 != 42)
    {
      v46 = v47;
      if (v54 != 45)
        goto LABEL_106;
LABEL_94:
      v50 = (char *)(v41 + 1);
      v51 = v41[1];
      if ((v51 - 48) > 9)
      {
        if (v51 == 36)
          v41 += 2;
        else
          ++v41;
        if (v51 == 36)
          v46 = -1;
        else
          v46 = -2;
      }
      else
      {
        v46 = 0;
        do
        {
          v46 = v51 + 10 * v46 - 48;
          v52 = *++v50;
          v51 = v52;
        }
        while ((v52 - 48) < 0xA);
        v41 = (unsigned __int8 *)v50;
      }
      goto LABEL_106;
    }
    ++v41;
    v46 = -1;
LABEL_106:
    if (v34)
      v56 = v49;
    else
      v56 = v44;
    v43 = history_arg_extract(v47, v46, v56);
    if (!v43)
    {
      fprintf(rl_outstream, "%s: Bad word specifier", &v26[v122]);
      LODWORD(v8) = -1;
      v25 = v109;
      if (!v34)
        goto LABEL_202;
      goto LABEL_222;
    }
LABEL_110:
    if (!v34)
      free(v44);
    v57 = *v41;
    LODWORD(v8) = 1;
    if (!*v41 || v41 - (unsigned __int8 *)v26 >= v27)
      goto LABEL_214;
    v107 = 0;
    v120 = 0;
LABEL_115:
    switch(v57)
    {
      case 'e':
        v58 = strrchr(v43, 46);
        if (v58)
          goto LABEL_168;
        goto LABEL_195;
      case 'f':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
        goto LABEL_195;
      case 'g':
        v120 = 2;
        goto LABEL_195;
      case 'h':
        v59 = v43;
        v60 = 47;
        goto LABEL_125;
      case 'p':
        v107 = 1;
        goto LABEL_195;
      case 'r':
        v59 = v43;
        v60 = 46;
LABEL_125:
        v61 = strrchr(v59, v60);
        if (v61)
          *v61 = 0;
        goto LABEL_195;
      case 's':
        v62 = v41[1];
        v8 = (char *)malloc_type_realloc((void *)qword_25459B620, 0x10uLL, 0x100004077774924uLL);
        if (!v8)
        {
          free((void *)qword_25459B620);
          goto LABEL_197;
        }
        v63 = 0;
        v66 = v41[2];
        v65 = v41 + 2;
        v64 = v66;
        if (v66 && v64 != v62)
        {
          v67 = 0;
          v68 = 16;
          do
          {
            if (v64 == 92)
            {
              if (v65[1] == v62)
                ++v65;
              LOBYTE(v64) = *v65;
            }
            v63 = v67 + 1;
            v8[v67] = v64;
            if (v67 + 1 >= v68)
            {
              v68 *= 2;
              v69 = (char *)malloc_type_realloc(v8, v68, 0x100004077774924uLL);
              if (!v69)
              {
                free(v8);
                LODWORD(v8) = 0;
LABEL_197:
                v44 = v43;
                goto LABEL_201;
              }
              v8 = v69;
            }
            v70 = *++v65;
            v64 = v70;
            if (v70)
              v71 = v64 == v62;
            else
              v71 = 1;
            v67 = v63;
          }
          while (!v71);
        }
        v8[v63] = 0;
        qword_25459B620 = (uint64_t)v8;
        if (!*v8)
        {
          free(v8);
          qword_25459B620 = 0;
LABEL_225:
          LODWORD(v8) = -1;
          goto LABEL_197;
        }
        v72 = v65[1];
        v41 = v65 + 1;
        if (!v72)
          goto LABEL_195;
        v73 = malloc_type_realloc((void *)qword_25459B628, 0x11uLL, 0x100004077774924uLL);
        if (!v73)
        {
          free((void *)qword_25459B628);
          goto LABEL_225;
        }
        v74 = v73;
        v75 = (const char *)qword_25459B620;
        __srca = strlen((const char *)qword_25459B620);
        v76 = 0;
        v77 = *v41;
        if (!*v41 || v77 == v62)
        {
LABEL_165:
          v74[v76] = 0;
          qword_25459B628 = (uint64_t)v74;
          goto LABEL_173;
        }
        __s1 = v43;
        v76 = 0;
        v78 = 16;
        while (2)
        {
          if (v76 + __srca + 1 < v78)
            goto LABEL_152;
          v78 += __srca + 1;
          v79 = malloc_type_realloc(v74, v78 + 1, 0x100004077774924uLL);
          if (v79)
          {
            v77 = *v41;
            v74 = v79;
LABEL_152:
            if (v77 == 92)
            {
              v80 = v41[1];
              if (v80 == 38 || v80 == v62)
                ++v41;
              LOBYTE(v77) = *v41;
            }
            else if (v77 == 38)
            {
              strcpy(&v74[v76], (const char *)qword_25459B620);
              v76 += __srca;
LABEL_162:
              v82 = *++v41;
              v77 = v82;
              if (!v82 || v77 == v62)
              {
                v75 = (const char *)qword_25459B620;
                v43 = __s1;
                goto LABEL_165;
              }
              continue;
            }
            v74[v76++] = v77;
            goto LABEL_162;
          }
          break;
        }
        free(v74);
        LODWORD(v8) = -1;
        v44 = __s1;
LABEL_201:
        v25 = v109;
LABEL_202:
        v99 = v44;
LABEL_221:
        free(v99);
LABEL_222:
        v11 = v25;
        if (*v12)
          continue;
        a2 = (char **)v106;
        v103 = ptr;
        if ((_DWORD)v8 == 2)
          add_history(ptr);
LABEL_235:
        free(*a2);
        *a2 = v103;
        return (int)v8;
      case 't':
        v83 = strrchr(v43, 47);
        if (v83)
        {
          v58 = v83 + 1;
LABEL_168:
          v84 = strdup(v58);
          free(v43);
          v43 = v84;
        }
        goto LABEL_195;
      default:
        if (v57 == 38)
        {
          v75 = (const char *)qword_25459B620;
          v74 = (_BYTE *)qword_25459B628;
          if (qword_25459B620)
            v85 = qword_25459B628 == 0;
          else
            v85 = 1;
          if (!v85)
          {
LABEL_173:
            v86 = v43;
            v87 = strlen(v43);
            v88 = strlen(v74);
            v89 = strlen(v75);
            v90 = v89;
            v91 = *(unsigned __int8 *)v86;
            __n = v88;
            __s1a = (char *)v86;
            if (*v86)
            {
              __srcb = v88 - v89;
              v92 = *(unsigned __int8 *)v75;
              do
              {
                if (v91 == v92 && !strncmp(v86, v75, v90))
                {
                  v87 += __srcb;
                  v93 = v90;
                  if (!v120)
                    break;
                }
                else
                {
                  v93 = 1;
                }
                v86 += v93;
                v91 = *(unsigned __int8 *)v86;
              }
              while (*v86);
            }
            v94 = (char *)malloc_type_malloc(v87 + 1, 0x100004077774924uLL);
            if (v94)
            {
              v95 = *__s1a;
              __srcc = v94;
              v96 = v94;
              if (*__s1a)
              {
                v96 = v94;
                v97 = __s1a;
                do
                {
                  if (v95 == *(unsigned __int8 *)v75 && !strncmp(v97, v75, v90))
                  {
                    strncpy(v96, v74, __n);
                    v96 += __n;
                    v97 += v90;
                    if (!v120)
                    {
                      strcpy(v96, v97);
                      goto LABEL_192;
                    }
                  }
                  else
                  {
                    ++v97;
                    *v96++ = v95;
                  }
                  v95 = *(unsigned __int8 *)v97;
                }
                while (*v97);
              }
              *v96 = 0;
LABEL_192:
              free(__s1a);
              v120 = 0;
              v43 = __srcc;
            }
            else
            {
              v120 = 0;
              v43 = __s1a;
            }
          }
        }
        else if (!v57)
        {
          if (v107)
            LODWORD(v8) = 2;
          else
            LODWORD(v8) = 1;
LABEL_214:
          v25 = v109;
          if ((int)v8 < 1 || !v43)
          {
            if (!v43)
              goto LABEL_222;
LABEL_220:
            v99 = v43;
            goto LABEL_221;
          }
          v100 = strlen(v43);
          v101 = v100;
          v102 = v100 + v109;
          if (v100 + v109 + 1 <= v112
            || (v112 += v100 + 1, (ptr = (char *)malloc_type_realloc(ptr, v112, 0x100004077774924uLL)) != 0))
          {
            strncpy(&ptr[v109], v43, v101);
            ptr[v102] = 0;
            v25 = v102;
            goto LABEL_220;
          }
          free(*v106);
          v104 = v43;
          goto LABEL_237;
        }
LABEL_195:
        v98 = *++v41;
        v57 = v98;
        goto LABEL_115;
    }
  }
}

int add_history(const char *a1)
{
  const char *v1;
  History *v2;
  BOOL v3;
  int num;
  HistEvent v6;

  if (a1)
  {
    v1 = a1;
    v2 = (History *)qword_25459ACF0;
    if (qword_25459ACF0)
      v3 = qword_25459ACE8 == 0;
    else
      v3 = 1;
    if (v3)
    {
      rl_initialize();
      v2 = (History *)qword_25459ACF0;
    }
    *(_QWORD *)&v6.num = 0;
    v6.str = 0;
    history(v2, &v6, 10, v1);
    if (history((History *)qword_25459ACF0, &v6, 2))
    {
      num = history_length;
    }
    else
    {
      num = v6.num;
      history_length = v6.num;
    }
    LODWORD(a1) = num < 1;
  }
  return (int)a1;
}

char *__cdecl history_arg_extract(int a1, int a2, const char *a3)
{
  char **v5;
  void **v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  void **v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  const char **v21;
  const char *v22;
  uint64_t v23;

  v5 = history_tokenize(a3);
  if (!v5)
    return 0;
  v6 = (void **)v5;
  if (*v5)
  {
    v7 = 0;
    while (v5[v7++])
      ;
    v9 = v7 - 2;
    if (a1 == 36)
      v10 = v7 - 2;
    else
      v10 = a1;
    if (a2 == 36)
      v11 = v7 - 2;
    else
      v11 = a2;
    v12 = v11 + (((_DWORD)v7 - 1) & (v11 >> 31));
    if (v10 >= 0)
      v13 = v10;
    else
      v13 = v12;
    if (((v13 | v12) & 0x80000000) != 0 || v9 < v13)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      if (v9 >= v12 && v13 <= v12)
      {
        v19 = 0;
        v20 = v12 - v13 + 1;
        v21 = (const char **)&v5[v13];
        do
        {
          v22 = *v21++;
          v19 += strlen(v22) + 1;
          --v20;
        }
        while (v20);
        v14 = (char *)malloc_type_malloc(v19 + 1, 0x100004077774924uLL);
        if (v14)
        {
          v23 = 0;
          do
          {
            strcpy(&v14[v23], (const char *)v6[v13]);
            v23 += strlen((const char *)v6[v13]);
            if (v13 < v12)
              v14[v23++] = 32;
            ++v13;
          }
          while (v12 + 1 != v13);
          v14[v23] = 0;
        }
      }
    }
    v15 = *v6;
    if (*v6)
    {
      v16 = v6 + 1;
      do
      {
        free(v15);
        v17 = *v16++;
        v15 = v17;
      }
      while (v17);
    }
  }
  else
  {
    v14 = 0;
  }
  free(v6);
  return v14;
}

char **__cdecl history_tokenize(const char *a1)
{
  uint64_t v2;
  char v3;
  char **v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  const char *v16;
  char v17;
  int v18;
  int v19;
  char v20;
  char **v21;
  char **v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  int v28;
  char **ptr;
  uint64_t v30;

  if (*a1)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v28 = 1;
    v6 = MEMORY[0x24BDAC740];
    while (1)
    {
      ptr = v4;
      v30 = v2;
      v7 = 0;
      v8 = 0;
      v9 = v5;
      v10 = ((uint64_t)v5 << 32) - 0x100000000;
      v11 = &a1[v5];
      do
      {
        v12 = v11[v7];
        if (v11[v7] < 0)
          v13 = __maskrune(v12, 0x4000uLL);
        else
          v13 = *(_DWORD *)(v6 + 4 * v12 + 60) & 0x4000;
        --v8;
        v10 += 0x100000000;
        ++v7;
      }
      while (v13);
      v14 = v9 - 1 - v8;
      v15 = v10 >> 32;
      v16 = &a1[v10 >> 32];
      v17 = *v16;
      if (*v16)
      {
        v18 = v9 - 1 - v8;
        do
        {
          if (v17 == 92)
          {
            if (a1[v18 + 1])
              ++v18;
          }
          else
          {
            v19 = v17;
            if (v17 == v3)
            {
              v3 = 0;
            }
            else if (!v3)
            {
              if (v17 < 0)
              {
                if (__maskrune(v17, 0x4000uLL))
                  goto LABEL_37;
              }
              else if ((*(_DWORD *)(v6 + 4 * v17 + 60) & 0x4000) != 0)
              {
                goto LABEL_37;
              }
              if (memchr("()<>;&|$", v19, 9uLL))
              {
LABEL_37:
                v3 = 0;
                v14 = v18;
                break;
              }
              v20 = *v16;
                v3 = v20;
              else
                v3 = 0;
            }
          }
          if (a1[v18])
            v15 = v18 + 1;
          else
            v15 = v18;
          v16 = &a1[v15];
          v17 = a1[v15];
          v18 = v15;
          v14 = v15;
        }
        while (v17);
      }
      if ((int)v30 + 2 >= v28)
      {
        v28 *= 2;
        v21 = ptr;
        v22 = (char **)malloc_type_realloc(ptr, 8 * v28, 0x10040436913F5uLL);
        if (!v22)
          goto LABEL_43;
        ptr = v22;
      }
      v23 = v15 - v9 + v8;
      v24 = (char *)malloc_type_malloc(v23 + 2, 0x100004077774924uLL);
      if (!v24)
        break;
      v25 = strncpy(v24, &a1[v9 + ~v8], v23 + 1);
      v25[v15 - v9 + 1 + v8] = 0;
      v4 = ptr;
      ptr[v30] = v25;
      v2 = v30 + 1;
      ptr[v30 + 1] = 0;
      if (*v16)
        v5 = v14 + 1;
      else
        v5 = v14;
      if (!a1[v5])
        return v4;
    }
    if ((_DWORD)v30)
    {
      v26 = 0;
      v21 = ptr;
      do
        free(ptr[v26++]);
      while (v30 != v26);
    }
    else
    {
      v21 = ptr;
    }
LABEL_43:
    free(v21);
  }
  return 0;
}

void stifle_history(int a1)
{
  uint64_t v1;
  History *v2;
  BOOL v3;
  HistEvent v4;

  v1 = *(_QWORD *)&a1;
  v2 = (History *)qword_25459ACF0;
  if (qword_25459ACF0)
    v3 = qword_25459ACE8 == 0;
  else
    v3 = 1;
  if (v3)
  {
    rl_initialize();
    v2 = (History *)qword_25459ACF0;
  }
  *(_QWORD *)&v4.num = 0;
  v4.str = 0;
  if (!history(v2, &v4, 1, v1))
    max_input_history = v1;
}

int unstifle_history(void)
{
  int result;
  HistEvent v1;

  *(_QWORD *)&v1.num = 0;
  v1.str = 0;
  history((History *)qword_25459ACF0, &v1, 1, 0x7FFFFFFFLL);
  result = max_input_history;
  max_input_history = 0x7FFFFFFF;
  return result;
}

int history_is_stifled(void)
{
  return max_input_history != 0x7FFFFFFF;
}

int history_truncate_file(const char *a1, int a2)
{
  char *v2;
  int v3;
  int v4;
  FILE *v5;
  FILE *v6;
  int v7;
  int v8;
  FILE *v9;
  FILE *v10;
  unsigned int v11;
  int v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  BOOL v18;
  size_t v19;
  off_t v21;
  off_t v22;
  int v23;
  char v24[4096];
  char v25[24];
  uint64_t v26;

  v2 = (char *)MEMORY[0x24BDAC7A8](a1, *(_QWORD *)&a2);
  v4 = v3;
  v26 = *MEMORY[0x24BDAC8D0];
  if (v2 || (v2 = sub_2095368BC()) != 0)
  {
    v5 = fopen(v2, "r+");
    if (v5)
    {
      v6 = v5;
      strcpy(v25, "/tmp/.historyXXXXXX");
      v7 = mkstemp(v25);
      if (v7 == -1)
      {
        v12 = *__error();
LABEL_49:
        fclose(v6);
        return v12;
      }
      v8 = v7;
      v9 = fdopen(v7, "r+");
      if (!v9)
      {
        close(v8);
        v12 = *__error();
LABEL_48:
        unlink(v25);
        goto LABEL_49;
      }
      v10 = v9;
      if (fread(v24, 0x1000uLL, 1uLL, v6) == 1)
      {
        v11 = 0;
        while (fwrite(v24, 0x1000uLL, 1uLL, v10) == 1)
        {
          ++v11;
          if (fread(v24, 0x1000uLL, 1uLL, v6) != 1)
            goto LABEL_15;
        }
LABEL_16:
        v13 = 0;
        goto LABEL_17;
      }
      v11 = 0;
LABEL_15:
      if (ferror(v6) || fseeko(v6, (unint64_t)v11 << 12, 0) == -1)
        goto LABEL_16;
      v13 = fread(v24, 1uLL, 0x1000uLL, v6);
      if (!ferror(v6))
      {
        if (!v13)
        {
          --v11;
          v13 = 4096;
LABEL_59:
          fflush(v10);
          goto LABEL_18;
        }
        if (fwrite(v24, v13, 1uLL, v10) == 1)
          goto LABEL_59;
      }
LABEL_17:
      v12 = *__error();
      if (v12)
      {
LABEL_47:
        fclose(v10);
        goto LABEL_48;
      }
LABEL_18:
      v14 = v13 - 1;
      if (v24[v13 - 1] != 10)
        v14 = v13;
      v15 = (int)v11;
      while (1)
      {
        if (v14 >= 1)
        {
          while (v24[v14 - 1] != 10 || --v4)
          {
            v18 = v14-- <= 1;
            if (v18)
            {
              v16 = &v24[-1];
              goto LABEL_28;
            }
          }
          v18 = (unint64_t)v14 > 0xFFF;
          if ((unint64_t)v14 > 0xFFF)
            v14 = 0;
          v16 = &v24[v14];
          if (v18)
            LODWORD(v15) = v15 + 1;
          goto LABEL_38;
        }
        v16 = &v24[v14 - 1];
LABEL_28:
        if (v4 < 1 || !v15)
          break;
        if (fseeko(v10, --v15 << 12, 0) < 0)
          goto LABEL_46;
        v17 = fread(v24, 0x1000uLL, 1uLL, v10);
        v14 = 4096;
        if (v17 != 1)
        {
          if (!ferror(v10))
          {
            v12 = 35;
            goto LABEL_47;
          }
          goto LABEL_46;
        }
      }
      if (v4 > 0)
      {
        v12 = 0;
        goto LABEL_47;
      }
LABEL_38:
      if (fseeko(v6, 0, 0) == -1
        || fseeko(v10, 0, 0) == -1
        || !fgets(v24, 4096, v10)
        || fputs(v24, v6) == -1
        || fseeko(v10, v16 - v24 + ((uint64_t)(int)v15 << 12), 0) == -1)
      {
LABEL_46:
        v12 = *__error();
        goto LABEL_47;
      }
      while (1)
      {
        v19 = fread(v24, 1uLL, 0x1000uLL, v10);
        if (!v19)
          break;
        if (fwrite(v24, v19, 1uLL, v6) != 1)
          goto LABEL_61;
      }
      if (ferror(v6))
      {
LABEL_61:
        v12 = *__error();
        goto LABEL_62;
      }
      v12 = 0;
LABEL_62:
      fflush(v6);
      v21 = ftello(v6);
      if (v21 >= 1)
      {
        v22 = v21;
        v23 = fileno(v6);
        ftruncate(v23, v22);
      }
      goto LABEL_47;
    }
  }
  return *__error();
}

char *sub_2095368BC()
{
  char *v0;
  uid_t v1;
  passwd *v2;

  v0 = &byte_25459B630;
  if (!byte_25459B630)
  {
    v1 = getuid();
    v2 = getpwuid(v1);
    if (v2)
      snprintf(&byte_25459B630, 0x400uLL, "%s/.history", v2->pw_dir);
    else
      return 0;
  }
  return v0;
}

int read_history(const char *a1)
{
  BOOL v2;
  int num;
  HistEvent v5;

  if (qword_25459ACF0)
    v2 = qword_25459ACE8 == 0;
  else
    v2 = 1;
  if (v2)
    rl_initialize();
  *(_QWORD *)&v5.num = 0;
  v5.str = 0;
  if (!a1)
  {
    a1 = sub_2095368BC();
    if (!a1)
      return *__error();
  }
  if (history((History *)qword_25459ACF0, &v5, 17, a1) == -1)
  {
    if (!*__error())
      return 22;
    return *__error();
  }
  if (history((History *)qword_25459ACF0, &v5, 2))
  {
    num = history_length;
  }
  else
  {
    num = v5.num;
    history_length = v5.num;
  }
  return num < 1;
}

int write_history(const char *a1)
{
  BOOL v2;
  HistEvent v4;

  if (qword_25459ACF0)
    v2 = qword_25459ACE8 == 0;
  else
    v2 = 1;
  if (v2)
    rl_initialize();
  *(_QWORD *)&v4.num = 0;
  v4.str = 0;
  if (!a1)
  {
    a1 = sub_2095368BC();
    if (!a1)
      return *__error();
  }
  if (history((History *)qword_25459ACF0, &v4, 18, a1) != -1)
    return 0;
  if (!*__error())
    return 22;
  else
    return *__error();
}

HIST_ENTRY *__cdecl remove_history(int a1)
{
  uint64_t v1;
  BOOL v2;
  HIST_ENTRY *v3;
  HistEvent v5;

  v1 = *(_QWORD *)&a1;
  if (qword_25459ACF0)
    v2 = qword_25459ACE8 == 0;
  else
    v2 = 1;
  if (v2)
    rl_initialize();
  v3 = (HIST_ENTRY *)malloc_type_malloc(0x10uLL, 0xD0040D45F9286uLL);
  if (v3)
  {
    *(_QWORD *)&v5.num = 0;
    v5.str = 0;
    if (history((History *)qword_25459ACF0, &v5, 24, v1, &v3->data))
    {
      free(v3);
      return 0;
    }
    else
    {
      v3->line = v5.str;
      if (!history((History *)qword_25459ACF0, &v5, 2))
        history_length = v5.num;
    }
  }
  return v3;
}

HIST_ENTRY *__cdecl replace_history_entry(int a1, const char *a2, histdata_t a3)
{
  uint64_t v5;
  History *v6;
  BOOL v7;
  HIST_ENTRY *v8;
  uint64_t num;
  char *v11;
  HistEvent v12;

  v5 = *(_QWORD *)&a1;
  v6 = (History *)qword_25459ACF0;
  if (qword_25459ACF0)
    v7 = qword_25459ACE8 == 0;
  else
    v7 = 1;
  if (v7)
  {
    rl_initialize();
    v6 = (History *)qword_25459ACF0;
  }
  *(_QWORD *)&v12.num = 0;
  v12.str = 0;
  v8 = 0;
  if (!history(v6, &v12, 8))
  {
    num = v12.num;
    if (!history((History *)qword_25459ACF0, &v12, 4))
    {
      v8 = (HIST_ENTRY *)malloc_type_malloc(0x10uLL, 0xD0040D45F9286uLL);
      if (!v8)
        return v8;
      if (!history((History *)qword_25459ACF0, &v12, 23, v5, &v8->data))
      {
        v11 = strdup(v12.str);
        v8->line = v11;
        if (v11)
        {
          if (!history((History *)qword_25459ACF0, &v12, 25, a2, a3)
            && !history((History *)qword_25459ACF0, &v12, 7, num))
          {
            return v8;
          }
        }
      }
      free(v8);
    }
    return 0;
  }
  return v8;
}

void clear_history(void)
{
  HistEvent v0;

  *(_QWORD *)&v0.num = 0;
  v0.str = 0;
  history((History *)qword_25459ACF0, &v0, 19);
  history_length = 0;
}

int where_history(void)
{
  int v0;
  int num;
  int v3;
  HistEvent v4;

  *(_QWORD *)&v4.num = 0;
  v4.str = 0;
  if (history((History *)qword_25459ACF0, &v4, 8))
    return 0;
  num = v4.num;
  history((History *)qword_25459ACF0, &v4, 3);
  v3 = v4.num;
  v0 = 1;
  while (v3 != num && !history((History *)qword_25459ACF0, &v4, 6))
  {
    ++v0;
    v3 = v4.num;
  }
  return v0;
}

HIST_ENTRY *current_history(void)
{
  return (HIST_ENTRY *)sub_209536D38(8);
}

uint64_t *sub_209536D38(int a1)
{
  int v1;
  uint64_t *result;
  HistEvent v3;

  *(_QWORD *)&v3.num = 0;
  v3.str = 0;
  v1 = history((History *)qword_25459ACF0, &v3, a1);
  result = 0;
  if (!v1)
  {
    result = &qword_25459BA30;
    qword_25459BA30 = (uint64_t)v3.str;
    *(_QWORD *)algn_25459BA38 = 0;
  }
  return result;
}

int history_total_bytes(void)
{
  uint64_t v0;
  uint64_t num;
  HistEvent v3;

  *(_QWORD *)&v3.num = 0;
  v3.str = 0;
  if (history((History *)qword_25459ACF0, &v3, 8))
  {
    LODWORD(v0) = -1;
  }
  else
  {
    num = v3.num;
    history((History *)qword_25459ACF0, &v3, 3);
    v0 = 0;
    do
      v0 += strlen(v3.str);
    while (!history((History *)qword_25459ACF0, &v3, 6));
    history((History *)qword_25459ACF0, &v3, 16, num);
  }
  return v0;
}

int history_set_pos(int a1)
{
  uint64_t v1;
  int result;
  uint64_t num;
  HistEvent v4;

  v1 = *(_QWORD *)&a1;
  result = -1;
  if ((v1 & 0x80000000) == 0 && history_length > (int)v1)
  {
    *(_QWORD *)&v4.num = 0;
    v4.str = 0;
    history((History *)qword_25459ACF0, &v4, 8);
    num = v4.num;
    result = history((History *)qword_25459ACF0, &v4, 24, v1, -1);
    if (result)
    {
      history((History *)qword_25459ACF0, &v4, 7, num);
      return -1;
    }
  }
  return result;
}

HIST_ENTRY *previous_history(void)
{
  return (HIST_ENTRY *)sub_209536D38(5);
}

HIST_ENTRY *next_history(void)
{
  return (HIST_ENTRY *)sub_209536D38(6);
}

int history_search_pos(const char *a1, int a2, int a3)
{
  int v5;
  uint64_t num;
  int v7;
  HistEvent v9;

  *(_QWORD *)&v9.num = 0;
  v9.str = 0;
  if (a3 >= 0)
    v5 = a3;
  else
    v5 = -a3;
  if (history((History *)qword_25459ACF0, &v9, 8))
    return -1;
  num = v9.num;
  if (history_set_pos(v5) || history((History *)qword_25459ACF0, &v9, 8))
    return -1;
  if (a3 < 1)
    v7 = 5;
  else
    v7 = 6;
  while (!strstr((char *)v9.str, a1))
  {
    if (history((History *)qword_25459ACF0, &v9, v7))
    {
      if (a3 < 1)
        history((History *)qword_25459ACF0, &v9, 15, num);
      else
        history((History *)qword_25459ACF0, &v9, 16, num);
      return -1;
    }
  }
  return v5;
}

char *__cdecl username_completion_function(const char *a1, int a2)
{
  const char *v2;
  passwd *v3;
  const char *pw_name;

  if (*a1)
  {
    if (*a1 == 126)
      v2 = a1 + 1;
    else
      v2 = a1;
    if (!a2)
      setpwent();
    while (1)
    {
      v3 = getpwent();
      if (!v3)
        break;
      pw_name = v3->pw_name;
      if (*(unsigned __int8 *)v2 != *(unsigned __int8 *)v3->pw_name || strcmp(v2, pw_name))
        return strdup(pw_name);
    }
    endpwent();
  }
  return 0;
}

void rl_display_match_list(char **a1, int a2, int a3)
{
  sub_20952FFA8(qword_25459ACE8, (uint64_t)a1, a2, a3);
}

int rl_complete(int a1, int a2)
{
  char v2;
  BOOL v3;
  __int32 *v5;
  __int32 *v6;
  EditLine *v7;
  char *(__cdecl *v8)(const char *, int);
  CPPFunction *v9;
  __int32 *v10;
  __int32 *v11;
  char v12[2];

  v2 = a2;
  if (qword_25459ACF0)
    v3 = qword_25459ACE8 == 0;
  else
    v3 = 1;
  if (v3)
    rl_initialize();
  if (rl_inhibit_completion)
  {
    v12[0] = v2;
    v12[1] = 0;
    el_insertstr((EditLine *)qword_25459ACE8, v12);
    return 4;
  }
  else
  {
    if (rl_completion_word_break_hook)
    {
      v5 = (__int32 *)rl_completion_word_break_hook();
      v6 = (__int32 *)rl_basic_word_break_characters;
    }
    else
    {
      v6 = (__int32 *)rl_basic_word_break_characters;
      v5 = (__int32 *)rl_basic_word_break_characters;
    }
    v7 = (EditLine *)qword_25459ACE8;
    v8 = (char *(__cdecl *)(const char *, int))rl_completion_entry_function;
    v9 = rl_attempted_completion_function;
    v10 = sub_20953ED48(v6, (uint64_t)&unk_25459ADE0);
    v11 = sub_20953ED48(v5, (uint64_t)&unk_25459AE00);
    return sub_2095300CC(v7, v8, (uint64_t (*)(char *, _QWORD))v9, v10, v11, (const char *(*)(char *))sub_209537164, rl_completion_query_items, &rl_completion_type, &rl_attempted_completion_over, &rl_point, &rl_end, 0, 0, 0);
  }
}

char *sub_209537164()
{
  char *result;

  result = &byte_25459BA40;
  byte_25459BA40 = rl_completion_append_character;
  byte_25459BA41 = 0;
  return result;
}

int rl_bind_key(int a1, rl_command_func_t *a2)
{
  BOOL v4;
  int result;

  if (qword_25459ACF0)
    v4 = qword_25459ACE8 == 0;
  else
    v4 = 1;
  if (v4)
    rl_initialize();
  if (a2 != rl_insert)
    return -1;
  result = 0;
  *(_BYTE *)(*(_QWORD *)(qword_25459ACE8 + 1056) + a1) = 8;
  return result;
}

int rl_insert(int a1, int a2)
{
  char v2;
  BOOL v4;
  unsigned int v5;
  char v7[2];

  v2 = a2;
  if (qword_25459ACF0)
    v4 = qword_25459ACE8 == 0;
  else
    v4 = 1;
  if (v4)
    rl_initialize();
  v7[0] = v2;
  v7[1] = 0;
  if (a1 >= 1)
  {
    v5 = a1 + 1;
    do
    {
      el_push((EditLine *)qword_25459ACE8, v7);
      --v5;
    }
    while (v5 > 1);
  }
  return 0;
}

int rl_read_key(void)
{
  EditLine *v0;
  BOOL v1;
  char v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = (EditLine *)qword_25459ACE8;
  if (qword_25459ACE8)
    v1 = qword_25459ACF0 == 0;
  else
    v1 = 1;
  if (v1)
  {
    rl_initialize();
    v0 = (EditLine *)qword_25459ACE8;
  }
  return el_getc(v0, v3);
}

void rl_reset_terminal(const char *a1)
{
  EditLine *v1;
  BOOL v2;

  v1 = (EditLine *)qword_25459ACE8;
  if (qword_25459ACF0)
    v2 = qword_25459ACE8 == 0;
  else
    v2 = 1;
  if (v2)
  {
    rl_initialize();
    v1 = (EditLine *)qword_25459ACE8;
  }
  el_reset(v1);
}

int rl_insert_text(const char *a1)
{
  const char *v1;
  EditLine *v2;

  if (a1)
  {
    v1 = a1;
    if (!*a1)
      goto LABEL_11;
    v2 = (EditLine *)qword_25459ACE8;
    if (!qword_25459ACF0 || qword_25459ACE8 == 0)
    {
      rl_initialize();
      v2 = (EditLine *)qword_25459ACE8;
    }
    if (el_insertstr(v2, v1) < 0)
LABEL_11:
      LODWORD(a1) = 0;
    else
      LODWORD(a1) = strlen(v1);
  }
  return (int)a1;
}

int rl_newline(int a1, int a2)
{
  rl_insert(1, 10);
  return 0;
}

int rl_add_defun(const char *a1, Function *a2, int a3)
{
  char v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a3 > 0xFF)
    return -1;
  qword_25459AE20[a3] = a2;
  el_set((EditLine *)qword_25459ACE8, 9, a1, a1, sub_209537478);
  vis(v6, a3, 92, 0);
  el_set((EditLine *)qword_25459ACE8, 4, v6, a1, 0);
  return 0;
}

uint64_t sub_209537478(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const LineInfo *v4;
  int buffer;

  if (!qword_25459AE20[a2])
    return 6;
  v3 = a2;
  v4 = el_line((EditLine *)qword_25459ACE8);
  buffer = (int)v4->buffer;
  rl_point = LODWORD(v4->cursor) - LODWORD(v4->buffer);
  rl_end = LODWORD(v4->lastchar) - buffer;
  ((void (*)(_QWORD, uint64_t))qword_25459AE20[v3])(0, a2);
  return 2 * (dword_25459BAB8 != 0);
}

void rl_callback_read_char(void)
{
  const char *v0;
  int v1;
  unsigned int v2;
  const char *v3;
  int v4;
  void (*v5)(char *);
  char *v6;
  int v7;
  int v9;

  v9 = 0;
  v0 = el_gets((EditLine *)qword_25459ACE8, &v9);
  if (v0 && (v1 = v9, v2 = v9 - 1, --v9, v1 > 0))
  {
    v3 = v0;
    if (v2)
      v4 = 0;
    else
      v4 = *v0 == *(unsigned __int8 *)(qword_25459ACE8 + 510);
    v7 = v0[v2];
    if (v7 == 13 || v7 == 10)
      v4 = 2;
    if (v4 && off_253EA8B30)
    {
      el_set((EditLine *)qword_25459ACE8, 15, 0);
      v6 = 0;
      if (v4 == 2)
      {
        v6 = strdup(v3);
        if (v6)
          v6[v9] = 0;
      }
      v5 = (void (*)(char *))off_253EA8B30;
      goto LABEL_21;
    }
  }
  else
  {
    v5 = (void (*)(char *))off_253EA8B30;
    if (off_253EA8B30 && *(unsigned __int8 *)(qword_25459ACE8 + 137) == 255)
    {
      v6 = 0;
LABEL_21:
      v5(v6);
    }
  }
}

void rl_callback_handler_install(const char *a1, VCPFunction *a2)
{
  if (!qword_25459ACE8)
    rl_initialize();
  rl_set_prompt(a1);
  off_253EA8B30 = a2;
  el_set((EditLine *)qword_25459ACE8, 15, 1);
}

void rl_callback_handler_remove(void)
{
  el_set((EditLine *)qword_25459ACE8, 15, 0);
  off_253EA8B30 = 0;
}

void rl_redisplay(void)
{
  __int16 v0;

  v0 = *(unsigned __int8 *)(qword_25459ACE8 + 521);
  el_push((EditLine *)qword_25459ACE8, (const char *)&v0);
}

int rl_get_previous_history(int a1, int a2)
{
  int v2;
  char v4[2];

  v4[0] = a2;
  v4[1] = 0;
  if (a1)
  {
    v2 = a1;
    do
    {
      --v2;
      el_push((EditLine *)qword_25459ACE8, v4);
    }
    while (v2);
  }
  return 0;
}

int rl_read_init_file(const char *a1)
{
  return el_source((EditLine *)qword_25459ACE8, a1);
}

int rl_parse_and_bind(const char *a1)
{
  Tokenizer *v2;
  int v4;
  char **v5;

  v5 = 0;
  v4 = 0;
  v2 = tok_init(0);
  tok_str(v2, a1, &v4, (const char ***)&v5);
  v4 = el_parse((EditLine *)qword_25459ACE8, v4, (const char **)v5);
  tok_end(v2);
  return v4 != 0;
}

int rl_variable_bind(const char *a1, const char *a2)
{
  return el_set((EditLine *)qword_25459ACE8, 4, &unk_209547D1A, a1, a2, 0) == -1;
}

void rl_stuff_char(int a1)
{
  char v1[2];

  v1[0] = a1;
  v1[1] = 0;
  el_insertstr((EditLine *)qword_25459ACE8, v1);
}

void rl_get_screen_size(int *a1, int *a2)
{
  if (a1)
    el_get((EditLine *)qword_25459ACE8, 17, "li", a1, 0);
  if (a2)
    el_get((EditLine *)qword_25459ACE8, 17, "co", a2, 0);
}

void rl_set_screen_size(int a1, int a2)
{
  char __str[64];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x40uLL, "%d", a1);
  el_set((EditLine *)qword_25459ACE8, 6, "li", __str, 0);
  snprintf(__str, 0x40uLL, "%d", a2);
  el_set((EditLine *)qword_25459ACE8, 6, "co", __str, 0);
}

char **__cdecl rl_completion_matches(const char *a1, rl_compentry_func_t *a2)
{
  char *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  char *v10;
  _BYTE *v11;
  size_t v12;
  uint64_t v13;
  _BYTE *v14;
  int v15;
  size_t v16;
  _BYTE *v17;
  size_t v18;
  void *v19;

  v4 = (char *)malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
  if (!v4)
    return (char **)v4;
  v5 = ((uint64_t (*)(const char *, _QWORD))a2)(a1, 0);
  if (!v5)
    goto LABEL_27;
  v6 = 0;
  v7 = 10;
  do
  {
    *(_QWORD *)&v4[8 * v6 + 8] = v5;
    if (v6 + 2 == v7)
    {
      v7 += 10;
      v8 = (char *)malloc_type_realloc(v4, 8 * v7, 0x10040436913F5uLL);
      if (!v8)
        goto LABEL_27;
      v4 = v8;
    }
    v5 = ((uint64_t (*)(const char *, size_t))a2)(a1, ++v6);
  }
  while (v5);
  if (!v6)
    goto LABEL_27;
  *(_QWORD *)&v4[8 * v6 + 8] = 0;
  if (v6 == 1)
  {
    v9 = (const char *)*((_QWORD *)v4 + 1);
    goto LABEL_11;
  }
  qsort(v4 + 8, v6, 8uLL, (int (__cdecl *)(const void *, const void *))sub_209537B0C);
  v11 = (_BYTE *)*((_QWORD *)v4 + 1);
  v12 = -1;
  v13 = 1;
  do
  {
    v14 = v11;
    ++v13;
    v11 = *(_BYTE **)&v4[8 * v13];
    v15 = *v14;
    if (*v14)
    {
      v16 = 0;
      v17 = v14 + 1;
      while (v15 == v11[v16])
      {
        v18 = v16 + 1;
        v15 = v17[v16++];
        if (!v15)
          goto LABEL_21;
      }
      v18 = v16;
    }
    else
    {
      v18 = 0;
    }
LABEL_21:
    if (v12 >= v18)
      v12 = v18;
  }
  while (v6 != v13);
  if (!v12)
  {
    if (*a1)
    {
      v9 = a1;
LABEL_11:
      v10 = strdup(v9);
      *(_QWORD *)v4 = v10;
      if (!v10)
        goto LABEL_27;
      return (char **)v4;
    }
    v12 = 0;
  }
  v19 = malloc_type_malloc(v12 + 1, 0x100004077774924uLL);
  *(_QWORD *)v4 = v19;
  if (!v19)
  {
LABEL_27:
    free(v4);
    return 0;
  }
  memcpy(v19, *((const void **)v4 + 1), v12);
  *(_BYTE *)(*(_QWORD *)v4 + v12) = 0;
  return (char **)v4;
}

uint64_t sub_209537B0C(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void rl_forced_update_display(void)
{
  el_set((EditLine *)qword_25459ACE8, 20);
}

int _rl_abort_internal(void)
{
  el_beep((EditLine *)qword_25459ACE8);
  longjmp(dword_25459ACFC, 1);
}

int _rl_qsort_string_compare(char **a1, char **a2)
{
  return strcoll(*a1, *a2);
}

HISTORY_STATE *history_get_history_state(void)
{
  HISTORY_STATE *result;

  result = (HISTORY_STATE *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
  if (result)
    result->length = history_length;
  return result;
}

int rl_kill_text(int a1, int a2)
{
  return 0;
}

Keymap rl_make_bare_keymap(void)
{
  return 0;
}

Keymap rl_get_keymap(void)
{
  return 0;
}

int rl_generic_bind(int a1, const char *a2, const char *a3, Keymap a4)
{
  return 0;
}

int rl_bind_key_in_map(int a1, rl_command_func_t *a2, Keymap a3)
{
  return 0;
}

int rl_on_new_line(void)
{
  return 0;
}

uint64_t sub_209537BD0(uint64_t a1, __int32 a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  result = wcwidth(a2);
  if ((int)result <= 1)
    v7 = 1;
  else
    v7 = result;
  if (a3)
  {
    while (*(_DWORD *)(a1 + 848) + (int)v7 > *(_DWORD *)(a1 + 152))
      result = sub_209537BD0(a1, 32, 1);
  }
  v8 = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(*(_QWORD *)(v8 + 8 * *(int *)(a1 + 852)) + 4 * *(int *)(a1 + 848)) = a2;
  if (v7 >= 2)
  {
    v9 = -1;
    do
      *(_DWORD *)(*(_QWORD *)(v8 + 8 * *(int *)(a1 + 852)) + 4 * (v7 + v9-- + *(int *)(a1 + 848))) = -1;
    while ((int)v7 + (int)v9 + 2 > 2);
  }
  if (a3)
  {
    v10 = *(_DWORD *)(a1 + 848) + v7;
    *(_DWORD *)(a1 + 848) = v10;
    v11 = *(int *)(a1 + 152);
    if (v10 >= (int)v11)
    {
      *(_DWORD *)(*(_QWORD *)(v8 + 8 * *(int *)(a1 + 852)) + 4 * v11) = 0;
      return sub_209537CC4(a1);
    }
  }
  return result;
}

uint64_t sub_209537CC4(uint64_t result)
{
  int v1;
  uint64_t v2;
  _DWORD **v3;
  _DWORD *v4;
  uint64_t v5;

  *(_DWORD *)(result + 848) = 0;
  v1 = *(_DWORD *)(result + 852) + 1;
  v2 = *(unsigned int *)(result + 156);
  if (v1 >= (int)v2)
  {
    v3 = *(_DWORD ***)(result + 72);
    v4 = *v3;
    if ((int)v2 < 2)
    {
      v5 = 0;
    }
    else
    {
      v5 = 0;
      do
      {
        *(_QWORD *)(*(_QWORD *)(result + 72) + 8 * v5) = *(_QWORD *)(*(_QWORD *)(result + 72) + 8 * v5 + 8);
        ++v5;
      }
      while (v2 - 1 != v5);
      v3 = *(_DWORD ***)(result + 72);
    }
    *v4 = 0;
    v3[v5] = v4;
  }
  else
  {
    *(_DWORD *)(result + 852) = v1;
  }
  return result;
}

uint64_t sub_209537D30(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  __int32 *v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  unint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  __int32 *v14;
  __int32 v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int32 *v22;
  uint64_t v23;
  unsigned __int32 v24;
  unsigned __int32 *v25;
  unsigned __int32 *v26;
  unsigned __int32 v27;
  unsigned __int32 *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int32 v31;
  uint64_t v32;
  char *v33;
  char *v34;
  unsigned __int32 *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int32 v38;
  uint64_t v39;
  char *v40;
  unsigned __int32 *v41;
  unsigned __int32 v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int v46;
  int v47;
  unint64_t v48;
  unint64_t v49;
  unsigned __int32 *v50;
  unsigned __int32 *v51;
  unsigned __int32 *v52;
  unsigned __int32 *v53;
  unsigned __int32 *v54;
  unsigned __int32 *v55;
  unsigned __int32 *v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;
  BOOL v60;
  unsigned __int32 *v61;
  unsigned __int32 *v62;
  BOOL v63;
  unsigned __int32 *v64;
  unsigned __int32 *v65;
  char *v66;
  uint64_t v67;
  int64_t v68;
  uint64_t v69;
  BOOL v70;
  unsigned __int32 *v71;
  unsigned __int32 *v72;
  uint64_t v73;
  unint64_t v74;
  unsigned __int32 *v75;
  int v76;
  int v77;
  int v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char *v82;
  unsigned __int32 *v83;
  unsigned __int32 *v84;
  unint64_t v85;
  char *v86;
  int64_t v87;
  unsigned __int32 *v88;
  uint64_t v89;
  int v90;
  unsigned __int32 *v91;
  unint64_t v92;
  unsigned __int32 v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  _DWORD *v98;
  unint64_t v99;
  uint64_t v100;
  unsigned __int32 v101;
  int v102;
  unsigned int v103;
  int v104;
  unsigned int v105;
  int v106;
  int v107;
  uint64_t v108;
  int v109;
  unint64_t v110;
  unsigned __int32 *v111;
  unsigned __int32 *v112;
  int64_t v113;
  unsigned __int32 v114;
  unsigned __int32 v115;
  unsigned __int32 *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unsigned __int32 *v120;
  unsigned __int32 *v121;
  unsigned __int32 v122;
  int v123;
  uint64_t v124;
  int v125;
  int v127;
  unsigned int v128;
  int v129;
  int v130;
  char *v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unsigned __int32 *v136;
  unint64_t v137;
  int v138;
  int v139;
  uint64_t v140;
  char *v141;
  unsigned __int32 *v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  _DWORD v147[8];
  uint64_t v148;

  v1 = a1;
  v148 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 848) = 0;
  sub_209533A94(a1, 12);
  *(_QWORD *)(v1 + 848) = 0;
  v2 = *(_QWORD *)(v1 + 104);
  if (*(_QWORD *)(v1 + 96) >= v2)
  {
    if (*(_QWORD *)(v1 + 1064) == *(_QWORD *)(v1 + 1048))
    {
      if (v2 == *(_QWORD *)(v1 + 88))
        v3 = 0;
      else
        v3 = -1;
      v2 += 4 * v3;
    }
    *(_QWORD *)(v1 + 96) = v2;
  }
  sub_209533A94(v1, 0);
  v4 = *(__int32 **)(v1 + 88);
  if ((unint64_t)v4 >= *(_QWORD *)(v1 + 104))
  {
    v16 = *(_DWORD *)(v1 + 848);
  }
  else
  {
    v5 = 0;
    v6 = -1;
    do
    {
      if (v4 == *(__int32 **)(v1 + 96))
      {
        v7 = wcwidth(*v4);
        v8 = v7 <= 1 ? 1 : v7;
        v6 = *(_DWORD *)(v1 + 848);
        v5 = *(_DWORD *)(v1 + 852);
        if (v8 >= 2 && (signed int)(v6 + v8) > *(_DWORD *)(v1 + 152))
        {
          v6 = 0;
          ++v5;
        }
      }
      v9 = *v4;
      v10 = sub_20953F214(*v4);
      if (v10 == -3)
      {
        v11 = *(_DWORD *)(v1 + 852);
        sub_209537BD0(v1, 0, 0);
        if (v11 == *(_DWORD *)(v1 + 852))
          sub_209537CC4(v1);
      }
      else if (v10)
      {
        if (v10 == -2)
        {
          do
            sub_209537BD0(v1, 32, 1);
          while ((*(_BYTE *)(v1 + 848) & 7) != 0);
        }
        else
        {
          v12 = sub_20953F080(v147, 8uLL, v9);
          if (v12 >= 1)
          {
            v13 = v12;
            v14 = v147;
            do
            {
              v15 = *v14++;
              sub_209537BD0(v1, v15, 1);
              --v13;
            }
            while (v13);
          }
        }
      }
      else
      {
        sub_209537BD0(v1, v9, 1);
      }
      ++v4;
    }
    while ((unint64_t)v4 < *(_QWORD *)(v1 + 104));
    v16 = *(_DWORD *)(v1 + 848);
    if (v6 != -1)
      goto LABEL_33;
  }
  v5 = *(_DWORD *)(v1 + 852);
  v6 = v16;
LABEL_33:
  v17 = *(_DWORD *)(v1 + 896);
  if (!v17 || *(_DWORD *)(v1 + 900) || *(_DWORD *)(v1 + 852) || (v127 = *(_DWORD *)(v1 + 152) - (v16 + v17), v127 < 2))
  {
    *(_QWORD *)(v1 + 896) = 0;
  }
  else
  {
    v128 = v127 + 1;
    do
    {
      sub_209537BD0(v1, 32, 1);
      --v128;
    }
    while (v128 > 2);
    sub_209533A94(v1, 12);
  }
  sub_209537BD0(v1, 0, 0);
  LODWORD(v18) = *(_DWORD *)(v1 + 852);
  *(_DWORD *)(v1 + 860) = v18;
  if ((v18 & 0x80000000) != 0)
  {
    LODWORD(v19) = 0;
    goto LABEL_225;
  }
  v129 = v5;
  v130 = v6;
  v19 = 0;
  v144 = v1;
  do
  {
    v20 = v19;
    v21 = *(_QWORD *)(v1 + 72);
    v22 = *(unsigned __int32 **)(*(_QWORD *)(v1 + 64) + 8 * v20);
    v146 = v20;
    v23 = *(_QWORD *)(v21 + 8 * v20);
    v24 = *v22;
    if (*v22)
    {
      v25 = *(unsigned __int32 **)(v21 + 8 * v20);
      v26 = *(unsigned __int32 **)(*(_QWORD *)(v1 + 64) + 8 * v20);
      do
      {
        if (v24 != *v25)
          break;
        v27 = v26[1];
        ++v26;
        v24 = v27;
        ++v25;
      }
      while (v27);
    }
    else
    {
      v26 = *(unsigned __int32 **)(*(_QWORD *)(v1 + 64) + 8 * v20);
      v25 = *(unsigned __int32 **)(v21 + 8 * v20);
    }
    v28 = v26 - 1;
    v29 = 4;
    do
    {
      v30 = v29;
      v31 = v28[1];
      ++v28;
      v29 += 4;
    }
    while (v31);
    do
    {
      v32 = v30;
      v33 = (char *)v26 + v30;
      if (v26 >= (unsigned __int32 *)((char *)v26 + v30 - 4))
        break;
      v30 -= 4;
    }
    while (*((_DWORD *)v33 - 2) == 32);
    *((_DWORD *)v33 - 1) = 0;
    v34 = v33 - 4;
    v35 = v25 - 1;
    v36 = 4;
    do
    {
      v37 = v36;
      v38 = v35[1];
      ++v35;
      v36 += 4;
    }
    while (v38);
    do
    {
      v39 = v37;
      v40 = (char *)v25 + v37;
      if (v25 >= (unsigned __int32 *)((char *)v25 + v37 - 4))
        break;
      v37 -= 4;
    }
    while (*((_DWORD *)v40 - 2) == 32);
    *((_DWORD *)v40 - 1) = 0;
    v41 = (unsigned __int32 *)(v40 - 4);
    v42 = *v26;
    if (!*v26 && !*v25)
      goto LABEL_216;
    v43 = (unint64_t)v34;
    v44 = (unint64_t)v41;
    do
    {
      if (v43 <= (unint64_t)v26)
        break;
      if (v44 <= (unint64_t)v25)
        break;
      v46 = *(_DWORD *)(v43 - 4);
      v43 -= 4;
      v45 = v46;
      v47 = *(_DWORD *)(v44 - 4);
      v44 -= 4;
    }
    while (v45 == v47);
    v48 = v43 + 4;
    v49 = v44 + 4;
    v143 = (uint64_t)v22;
    if (v42 && (unint64_t)v25 < v49)
    {
      v50 = (unsigned __int32 *)(v44 + 4);
      v51 = (unsigned __int32 *)(v44 + 4);
      v52 = (unsigned __int32 *)(v43 + 4);
      v53 = (unsigned __int32 *)(v43 + 4);
      v54 = v25;
      do
      {
        if (v42 == *v54)
        {
          v55 = v26;
          v56 = v54;
          if ((unint64_t)v54 < v49)
          {
            v55 = v26;
            v56 = v54;
            if ((unint64_t)v26 < v48)
            {
              v57 = 0;
              while (1)
              {
                v56 = &v54[v57];
                v55 = &v26[v57];
                if (v26[v57] != v54[v57])
                  break;
                ++v57;
                if ((unint64_t)v56 >= v44 || (unint64_t)v55 >= v43)
                {
                  v56 = &v54[v57];
                  v55 = &v26[v57];
                  break;
                }
              }
            }
          }
          v58 = (char *)v56 - (char *)v54;
          v59 = ((char *)v56 - (char *)v54) >> 1;
          v60 = v59 <= v54 - v25;
          if (v59 > v54 - v25)
            v61 = v26;
          else
            v61 = v53;
          if (v60)
          {
            v55 = v52;
            v62 = v51;
          }
          else
          {
            v62 = v54;
          }
          if (v60)
            v56 = v50;
          if ((char *)v50 - (char *)v51 < v58)
          {
            v53 = v61;
            v52 = v55;
            v51 = v62;
            v50 = v56;
          }
        }
        v63 = (unint64_t)v54++ >= v44;
      }
      while (!v63);
    }
    else
    {
      v53 = (unsigned __int32 *)(v43 + 4);
      v52 = (unsigned __int32 *)(v43 + 4);
      v51 = (unsigned __int32 *)(v44 + 4);
      v50 = (unsigned __int32 *)(v44 + 4);
    }
    if (*v25)
      v63 = (unint64_t)v26 >= v48;
    else
      v63 = 1;
    if (!v63)
    {
      v64 = v26;
      do
      {
        if (*v25 == *v64)
        {
          v65 = v25;
          v66 = (char *)v64;
          if ((unint64_t)v64 < v48)
          {
            v65 = v25;
            v66 = (char *)v64;
            if ((unint64_t)v25 < v49)
            {
              v67 = 0;
              while (1)
              {
                v66 = (char *)&v64[v67];
                v65 = &v25[v67];
                if (v64[v67] != v25[v67])
                  break;
                ++v67;
                if ((unint64_t)v66 >= v43 || (unint64_t)v65 >= v44)
                {
                  v66 = (char *)&v64[v67];
                  v65 = &v25[v67];
                  break;
                }
              }
            }
          }
          v68 = v66 - (char *)v64;
          v69 = (v66 - (char *)v64) >> 1;
          v70 = v69 <= v64 - v26;
          if (v69 > v64 - v26)
            v71 = v64;
          else
            v71 = v53;
          if (v70)
          {
            v66 = (char *)v52;
            v72 = v51;
          }
          else
          {
            v72 = v25;
          }
          if (v70)
            v65 = v50;
          if ((char *)v52 - (char *)v53 < v68)
          {
            v53 = v71;
            v52 = (unsigned __int32 *)v66;
            v51 = v72;
            v50 = v65;
          }
        }
        v63 = (unint64_t)v64++ >= v43;
      }
      while (!v63);
    }
    v73 = (uint64_t)v26 + v32 - v43 - 8;
    if (v73 >= 16)
      v74 = v48;
    else
      v74 = (unint64_t)v34;
    if (v73 >= 16)
      v75 = (unsigned __int32 *)(v44 + 4);
    else
      v75 = v41;
    v76 = ((unint64_t)((char *)v51 - (char *)v25) >> 2) - ((unint64_t)((char *)v53 - (char *)v26) >> 2);
    v77 = ((unint64_t)((char *)v75 - (char *)v50) >> 2) - ((v74 - (unint64_t)v52) >> 2);
    v78 = *(_DWORD *)(v1 + 160);
    if ((v78 & 1) == 0)
    {
      if (v76 >= 1)
      {
        v53 = (unsigned __int32 *)v74;
        v52 = (unsigned __int32 *)v74;
        v51 = v75;
        v50 = v75;
      }
      if (v77 > 0)
      {
        v74 = (unint64_t)v34;
        v75 = v41;
      }
      if ((uint64_t)(v74 - (_QWORD)v26) < (char *)v75 - (char *)v25)
      {
        v74 = (unint64_t)v34;
        v75 = v41;
      }
    }
    v140 = v23;
    if ((v78 & 2) == 0)
    {
      if (v76 < 0)
      {
        v53 = (unsigned __int32 *)v74;
        v52 = (unsigned __int32 *)v74;
        v51 = v75;
        v50 = v75;
      }
      if (v77 >= 0)
        v79 = v74;
      else
        v79 = (unint64_t)v34;
      if (v77 < 0)
        v75 = v41;
      if ((uint64_t)(v79 - (_QWORD)v26) <= (char *)v75 - (char *)v25)
        v74 = v79;
      else
        v74 = (unint64_t)v34;
      if ((uint64_t)(v79 - (_QWORD)v26) > (char *)v75 - (char *)v25)
        v75 = v41;
    }
    v80 = (char *)v52 - (char *)v53;
    if ((char *)v52 - (char *)v53 >= 16)
      v81 = (unint64_t)v52;
    else
      v81 = v74;
    if ((char *)v52 - (char *)v53 >= 16)
      v82 = (char *)v53;
    else
      v82 = (char *)v74;
    if ((char *)v52 - (char *)v53 >= 16)
      v83 = v51;
    else
      v83 = v75;
    if ((char *)v52 - (char *)v53 >= 16)
      v84 = v50;
    else
      v84 = v75;
    v131 = v82;
    v133 = v81;
    v136 = v84;
    v137 = v83 - v25;
    v85 = v137 - ((v82 - (char *)v26) >> 2);
    v141 = (char *)v74;
    v134 = v82 - (char *)v26;
    v135 = v75 - v84;
    v145 = v135 - ((v74 - v81) >> 2);
    sub_20953A380(v144, v146);
    v142 = v83;
    v139 = v85;
    if (v83 == v25 || (int)v85 < 1)
    {
      if ((v85 & 0x80000000) == 0)
        goto LABEL_162;
      v96 = ((unint64_t)v26 - v143) >> 2;
      sub_20953A534(v144, v96);
      v87 = v83 - v25;
      if (v34 != v131)
      {
        v132 = -v139;
        sub_20953A8C0((char *)v144, -v139);
        v97 = *(int *)(v144 + 152);
        v98 = (_DWORD *)(v143 + 4 * (int)v96);
        if ((int)v96 - v139 >= (int)v97)
        {
          v100 = v140;
        }
        else
        {
          v99 = v143 + 4 * v97;
          v100 = v140;
          if ((unint64_t)&v98[v132] < v99)
          {
            do
            {
              *v98 = v98[v132];
              ++v98;
            }
            while ((unint64_t)&v98[v132] < v99);
          }
          v98 = (_DWORD *)v99;
        }
        *v98 = 0;
        sub_20953A75C(v144, v25, v137);
        v90 = v139;
        v89 = v100;
        if (v83 != v25)
        {
          v119 = v83 - v25;
          v120 = v25;
          v121 = v26;
          do
          {
            v122 = *v120;
            if (!*v120)
              break;
            ++v120;
            *v121++ = v122;
            --v119;
          }
          while (v119);
          v90 = v139;
        }
        goto LABEL_163;
      }
      sub_20953A75C(v144, v25, v137);
      v102 = (((unint64_t)v26 + v32 - v143 - 4) >> 2) - (((unint64_t)v25 + v39 - v140 - 4) >> 2);
      if ((v145 & 0x80000000) == 0)
        v103 = v145;
      else
        v103 = -(int)v145;
      if (-v139 > v102)
        v102 = -v139;
      if (v103 <= v102)
        v104 = v102;
      else
        v104 = v103;
      sub_20953ABFC(v144, v104);
      v1 = v144;
    }
    else
    {
      if (v80 >= 16)
        v86 = (char *)v52;
      else
        v86 = v141;
      if (v34 != v141)
        v86 = v34;
      v1 = v144;
      if (((uint64_t)&v86[-v143] >> 2) + v85 > *(int *)(v144 + 152))
      {
LABEL_162:
        v90 = 0;
        v89 = v140;
        v87 = v137;
LABEL_163:
        v1 = v144;
        if ((v145 & 0x80000000) != 0)
        {
          v94 = ((uint64_t)(v133 - v143) >> 2) + v90;
          if (v94 < *(int *)(v144 + 152))
          {
            v95 = v89;
            v138 = v90;
            sub_20953A534(v144, v94);
            if (v34 == v141)
            {
              sub_20953A75C(v144, v136, v135);
              v105 = (((unint64_t)v26 + v32 - v143 - 4) >> 2) - (((unint64_t)v25 + v39 - v95 - 4) >> 2);
              if (v138 >= 0)
                v106 = v138;
              else
                v106 = -v138;
              if (v106 > (int)v105)
                v105 = v106;
              if (-(int)v145 > v105)
                v107 = -(int)v145;
              else
                v107 = v105;
              sub_20953ABFC(v144, v107);
              v89 = v95;
              v90 = v138;
            }
            else
            {
              sub_20953A8C0((char *)v144, -(int)v145);
              sub_20953A75C(v144, v136, v135);
              v90 = v138;
              v89 = v95;
            }
          }
        }
        if (v142 != v25 && v87 >= v134 >> 2 && !v90)
        {
          v108 = v89;
          sub_20953A534(v144, ((unint64_t)v25 - v89) >> 2);
          if (v41 == v142)
          {
            sub_20953A75C(v144, v25, v87);
            v89 = v108;
            if (v39 != 4)
            {
              do
              {
                v115 = *v25;
                if (!*v25)
                  break;
                ++v25;
                *v26++ = v115;
                --v87;
              }
              while (v87);
            }
          }
          else
          {
            v109 = v139;
            if (v139 >= 1)
            {
              sub_20953AA04(v144, v25, v139);
              sub_209538E98(v143, ((unint64_t)v26 - v143) >> 2, *(_DWORD *)(v144 + 152), (int *)v25, v139);
              v109 = v139;
            }
            v110 = v87 - v109;
            v111 = &v25[v109];
            sub_20953A75C(v144, v111, v110);
            v89 = v108;
            if (v110)
            {
              v112 = &v26[v139];
              v113 = v139 - v87;
              do
              {
                v114 = *v111;
                if (!*v111)
                  break;
                ++v111;
                *v112++ = v114;
                v63 = __CFADD__(v113++, 1);
              }
              while (!v63);
            }
          }
        }
        if ((v145 & 0x80000000) == 0)
        {
          sub_20953A534(v144, ((unint64_t)v136 - v89) >> 2);
          if (v34 == v141)
          {
            v118 = v144;
            v116 = v136;
            v117 = v135;
          }
          else
          {
            if ((_DWORD)v145)
              sub_20953AA04(v144, v136, v145);
            v116 = &v136[v145];
            v117 = v135 - v145;
            v118 = v144;
          }
          sub_20953A75C(v118, v116, v117);
        }
        goto LABEL_216;
      }
      sub_20953A534(v144, ((unint64_t)v25 - v140) >> 2);
      v87 = v137;
      if (v41 != v142)
      {
        sub_20953AA04(v144, v25, v139);
        sub_209538E98(v143, ((unint64_t)v26 - v143) >> 2, *(_DWORD *)(v144 + 152), (int *)v25, v139);
        v88 = &v25[v139];
        sub_20953A75C(v144, v88, v137 - v139);
        v89 = v140;
        v90 = v139;
        if (v137 != v139)
        {
          v91 = &v26[v139];
          v92 = v139 - v137;
          do
          {
            v93 = *v88;
            if (!*v88)
              break;
            ++v88;
            *v91++ = v93;
            v63 = __CFADD__(v92++, 1);
          }
          while (!v63);
          v90 = v139;
        }
        goto LABEL_163;
      }
      sub_20953A75C(v144, v25, v137);
      if (v39 != 4)
      {
        do
        {
          v101 = *v25;
          if (!*v25)
            break;
          ++v25;
          *v26++ = v101;
          --v87;
        }
        while (v87);
      }
    }
LABEL_216:
    sub_2095388FC(*(char **)(*(_QWORD *)(v1 + 64) + 8 * v146), *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8 * v146), *(int *)(v1 + 152));
    v19 = v146 + 1;
    v18 = *(int *)(v1 + 860);
  }
  while (v146 < v18);
  v5 = v129;
  v6 = v130;
LABEL_225:
  v123 = *(_DWORD *)(v1 + 856);
  if (v123 > (int)v18 && (int)v19 <= v123)
  {
    v124 = v19;
    do
    {
      sub_20953A380(v1, v124);
      sub_20953A534(v1, 0);
      v125 = wcslen(*(const __int32 **)(*(_QWORD *)(v1 + 64) + 8 * v124));
      sub_20953ABFC(v1, v125);
      **(_DWORD **)(*(_QWORD *)(v1 + 64) + 8 * v124++) = 0;
    }
    while (*(_DWORD *)(v1 + 856) > (int)v124 - 1);
    LODWORD(v18) = *(_DWORD *)(v1 + 860);
  }
  *(_DWORD *)(v1 + 856) = v18;
  sub_20953A380(v1, v5);
  return sub_20953A534(v1, v6);
}

void sub_2095388FC(char *__b, uint64_t a2, unint64_t a3)
{
  unint64_t v4;
  int v5;
  unint64_t v6;

  v4 = 0;
  if (a3)
  {
    while (1)
    {
      v5 = *(_DWORD *)(a2 + 4 * v4);
      if (!v5)
        break;
      *(_DWORD *)__b = v5;
      __b += 4;
      if (a3 == ++v4)
        goto LABEL_7;
    }
  }
  v6 = a3 - v4;
  if (a3 > v4)
  {
    memset_pattern16(__b, &unk_2095423D0, 4 * v6);
    __b += 4 * v6;
  }
LABEL_7:
  *(_DWORD *)__b = 0;
}

uint64_t sub_209538960(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_20953A380(a1, *(_DWORD *)(a1 + 856));
  sub_20953A860(a1, 0xAu);
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  if (*(int *)(a1 + 156) >= 1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(a1 + 64);
    do
      **(_DWORD **)(v3 + 8 * v2++) = 0;
    while (v2 < *(int *)(a1 + 156));
  }
  *(_DWORD *)(a1 + 856) = 0;
  return sub_20953B998(a1);
}

uint64_t sub_2095389C8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(result + 52) = 0;
  *(_DWORD *)(result + 56) = 0;
  if (*(int *)(result + 156) >= 1)
  {
    v1 = 0;
    v2 = *(_QWORD *)(result + 64);
    do
      **(_DWORD **)(v2 + 8 * v1++) = 0;
    while (v1 < *(int *)(result + 156));
  }
  *(_DWORD *)(result + 856) = 0;
  return result;
}

uint64_t sub_209538A00(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  __darwin_ct_rune_t *v8;
  int v9;
  signed int v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;

  v3 = *(_QWORD *)(a1 + 96);
  v2 = *(_QWORD *)(a1 + 104);
  if (v3 >= v2)
  {
    v3 = *(_QWORD *)(a1 + 104);
    if (*(_QWORD *)(a1 + 1064) == *(_QWORD *)(a1 + 1048))
    {
      if (v2 == *(_QWORD *)(a1 + 88))
        v4 = 0;
      else
        v4 = -1;
      v3 = v2 + 4 * v4;
    }
    *(_QWORD *)(a1 + 96) = v3;
  }
  v5 = *(_DWORD *)(a1 + 872);
  v6 = *(_DWORD *)(a1 + 876);
  v7 = *(_DWORD *)(a1 + 152);
  v8 = *(__darwin_ct_rune_t **)(a1 + 88);
  if ((unint64_t)v8 < v3)
  {
    do
    {
      v9 = sub_20953F214(*v8);
      if (v9 == -3)
      {
        v10 = 0;
        ++v6;
      }
      else if (v9 == -2)
      {
        v10 = v5 - (v5 | 0xFFFFFFF8);
      }
      else
      {
        v11 = wcwidth(*v8);
        if (v11 <= 1)
          v12 = 1;
        else
          v12 = v11;
        v13 = v12 > 1 && (int)(v12 + v5) > v7;
        if (v13)
          v5 = 0;
        v6 += v13;
        v10 = v5 + sub_20953F1A0(*v8);
      }
      if (v10 < v7)
        v14 = 0;
      else
        v14 = v7;
      if (v10 >= v7)
        ++v6;
      v5 = v10 - v14;
      ++v8;
    }
    while ((unint64_t)v8 < *(_QWORD *)(a1 + 96));
    v2 = *(_QWORD *)(a1 + 104);
  }
  if ((unint64_t)v8 < v2)
  {
    v15 = wcwidth(*v8);
    if (v15 <= 1)
      v16 = 1;
    else
      v16 = v15;
    v17 = v16 > 1 && (int)(v16 + v5) > v7;
    if (v17)
      v5 = 0;
    v6 += v17;
  }
  sub_20953A380(a1, v6);
  sub_20953A534(a1, v5);
  return sub_20953B998(a1);
}

uint64_t sub_209538B5C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned __int32 *v8;
  unsigned __int32 v9;
  _DWORD v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(unsigned int *)(v2 - 4);
  if ((_DWORD)v3 == 9 || v2 != *(_QWORD *)(a1 + 104))
    return sub_209537D30(a1);
  v4 = *(_DWORD *)(a1 + 896);
  if (v4 && *(_DWORD *)(a1 + 152) - (*(_DWORD *)(a1 + 52) + v4) <= 2)
    return sub_209537D30(a1);
  switch(sub_20953F214(v3))
  {
    case 0xFFFFFFFC:
    case 0xFFFFFFFF:
      v6 = sub_20953F080(v11, 8uLL, v3);
      if (v6 >= 1)
      {
        v7 = v6;
        v8 = v11;
        do
        {
          v9 = *v8++;
          sub_209538C98(a1, v9);
          --v7;
        }
        while (v7);
      }
      break;
    case 0xFFFFFFFD:
    case 0u:
      sub_209538C98(a1, v3);
      break;
    default:
      return sub_20953B998(a1);
  }
  return sub_20953B998(a1);
}

uint64_t sub_209538C98(uint64_t a1, unsigned __int32 a2)
{
  int v4;
  unsigned int v5;
  uint64_t result;
  _DWORD **v7;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  _DWORD *v12;
  int v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  unsigned __int32 v18;
  unsigned __int32 v19;

  v4 = wcwidth(a2);
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  if (v5 >= 2)
  {
    while ((signed int)(*(_DWORD *)(a1 + 52) + v5) > *(_DWORD *)(a1 + 152))
      sub_209538C98(a1, 32);
  }
  result = sub_20953A860(a1, a2);
  v7 = *(_DWORD ***)(a1 + 64);
  v8 = *(int *)(a1 + 52);
  v9 = v7[*(int *)(a1 + 56)];
  *(_DWORD *)(a1 + 52) = v8 + 1;
  v9[v8] = a2;
  if (v5 >= 2)
  {
    v10 = v5 + 1;
    do
    {
      v11 = *(int *)(a1 + 52);
      v12 = v7[*(int *)(a1 + 56)];
      *(_DWORD *)(a1 + 52) = v11 + 1;
      v12[v11] = -1;
      --v10;
    }
    while (v10 > 2);
  }
  if (*(_DWORD *)(a1 + 52) >= *(_DWORD *)(a1 + 152))
  {
    *(_DWORD *)(a1 + 52) = 0;
    v13 = *(_DWORD *)(a1 + 56) + 1;
    v14 = *(unsigned int *)(a1 + 156);
    if (v13 >= (int)v14)
    {
      v15 = *v7;
      if ((int)v14 < 2)
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        do
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v16) = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v16 + 8);
          ++v16;
        }
        while (v14 - 1 != v16);
        v7 = *(_DWORD ***)(a1 + 64);
      }
      *v15 = 0;
      v7[v16] = v15;
    }
    else
    {
      *(_DWORD *)(a1 + 56) = v13;
      ++*(_DWORD *)(a1 + 856);
    }
    v17 = *(_DWORD *)(a1 + 160);
    if ((v17 & 0x80) == 0)
    {
      v18 = 10;
      v19 = 13;
LABEL_24:
      sub_20953A860(a1, v19);
      return sub_20953A860(a1, v18);
    }
    if ((v17 & 0x100) != 0)
    {
      v18 = 8;
      v19 = 32;
      goto LABEL_24;
    }
  }
  return result;
}

uint64_t sub_209538E10(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = result;
  v2 = *(_DWORD *)(result + 856);
  if ((*(_BYTE *)(result + 160) & 4) != 0)
  {
    if ((v2 & 0x80000000) == 0)
    {
      do
      {
        sub_20953A380(v1, v2);
        sub_20953A534(v1, 0);
        result = sub_20953ABFC(v1, *(_DWORD *)(v1 + 152));
        --v2;
      }
      while (v2 != -1);
    }
  }
  else
  {
    sub_20953A380(result, *(_DWORD *)(result + 856));
    sub_20953A860(v1, 0xDu);
    return sub_20953A860(v1, 0xAu);
  }
  return result;
}

uint64_t sub_209538E98(uint64_t result, int a2, int a3, int *a4, unsigned int a5)
{
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  BOOL v11;

  LODWORD(v5) = a3 - a2;
  if (a3 - a2 >= (int)a5)
    v5 = a5;
  else
    v5 = v5;
  if ((int)v5 >= 1)
  {
    v6 = (_DWORD *)(result + 4 * a3);
    v7 = v6 - 1;
    v8 = result + 4 * a2;
    if ((unint64_t)&v6[-v5 - 1] >= v8)
    {
      do
      {
        *v7 = v7[-v5];
        --v7;
      }
      while ((unint64_t)&v7[-v5] >= v8);
    }
    *v6 = 0;
    if (a3 > a2)
    {
      v9 = result + 4 * a2 + 4;
      do
      {
        v10 = *a4++;
        *(_DWORD *)(v9 - 4) = v10;
        if (v9 >= (unint64_t)v6)
          break;
        v9 += 4;
        v11 = v5 > 1;
        LODWORD(v5) = v5 - 1;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t sub_209538F1C(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 1216) = v2;
  if (!v2)
    return 0xFFFFFFFFLL;
  result = 0;
  *(_QWORD *)(a1 + 1224) = 0;
  *(_DWORD *)(a1 + 1240) = 0;
  *(_QWORD *)(a1 + 1232) = 0x1FFFFFFFFLL;
  *(_BYTE *)(a1 + 1244) = 0;
  return result;
}

void sub_209538F7C(uint64_t a1)
{
  free(*(void **)(a1 + 1216));
  *(_QWORD *)(a1 + 1216) = 0;
}

uint64_t sub_209538FA4(__int32 *a1, __int32 *a2)
{
  _BOOL8 v4;
  unsigned __int32 *v5;
  unsigned __int32 *v6;
  regex_t v8;

  if (wcsstr(a1, a2))
    return 1;
  memset(&v8, 0, sizeof(v8));
  v5 = sub_20953EC14((unsigned __int32 *)a2, (uint64_t)&unk_25459BA48);
  v4 = 0;
  if (!regcomp(&v8, (const char *)v5, 0))
  {
    v6 = sub_20953EC14((unsigned __int32 *)a1, (uint64_t)&unk_25459BA48);
    v4 = regexec(&v8, (const char *)v6, 0, 0, 0) == 0;
    MEMORY[0x20BD0E9C8](&v8);
  }
  return v4;
}

uint64_t sub_209539048(uint64_t a1, __int32 *a2)
{
  return sub_209538FA4(a2, *(__int32 **)(a1 + 1216));
}

size_t sub_209539058(size_t result)
{
  size_t v1;
  _BOOL8 v2;
  const __int32 *v3;
  uint64_t v4;
  size_t v5;
  __int32 *v6;

  if ((*(_BYTE *)(result + 136) & 0xFE) != 0x16)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 1096) == 1 && *(_QWORD *)(result + 1064) == *(_QWORD *)(result + 1048);
    v3 = *(const __int32 **)(result + 88);
    v4 = *(_QWORD *)(result + 96) + 4 * v2 - (_QWORD)v3;
    if ((unint64_t)v4 <= 0xFFC)
      v5 = v4 >> 2;
    else
      v5 = 1023;
    *(_QWORD *)(result + 1224) = v5;
    v6 = *(__int32 **)(result + 1216);
    if (v5)
    {
      result = (size_t)wcsncpy(v6, v3, v5);
      *(_DWORD *)(*(_QWORD *)(v1 + 1216) + 4 * *(_QWORD *)(v1 + 1224)) = 0;
    }
    else
    {
      result = wcslen(v6);
      *(_QWORD *)(v1 + 1224) = result;
    }
  }
  return result;
}

uint64_t sub_2095390F0(size_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _DWORD *v13;
  int *v14;
  int *v15;
  int v16;
  int *v17;
  int v18;
  int v19;
  _DWORD *v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;
  int v24;
  __int32 v25;
  unsigned int v26;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int *v37;
  unint64_t v38;
  unsigned int *v39;
  unsigned int *v40;
  unsigned int *v41;
  unsigned int v42;
  unint64_t v43;
  uint64_t v44;
  int v45;
  _DWORD *v46;
  unint64_t v47;
  _DWORD *i;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  __int32 v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  __int32 v67;

  v2 = *(_QWORD *)(a1 + 1224);
  if ((unint64_t)(*(_QWORD *)(a1 + 104) + 4 * v2 + 24) >= *(_QWORD *)(a1 + 112))
    return 6;
  v4 = *(_QWORD *)(a1 + 96);
  v5 = -1;
  if ((_DWORD)a2 != 23)
    v5 = 1;
  v65 = v5;
  v6 = byte_25459BA68;
  v7 = *(_DWORD *)(a1 + 1176);
  if ((_DWORD)a2 == 23)
    v8 = 0;
  else
    v8 = 0x7FFFFFFF;
  v64 = v8;
  v9 = 88;
  if ((_DWORD)a2 == 23)
    v9 = 104;
  v63 = v9;
  v66 = a2;
  v67 = 0;
  v10 = a2;
  while (1)
  {
    v11 = *(_QWORD *)(a1 + 1224);
    if (!v11)
    {
      byte_25459BA68 = 0;
      v12 = *(_QWORD **)(a1 + 1216);
      *(_QWORD *)(a1 + 1224) = 2;
      *v12 = 0x2A0000002ELL;
      v11 = 2;
    }
    v13 = *(_DWORD **)(a1 + 104);
    *v13 = 10;
    v14 = v13 + 1;
    v15 = (int *)&unk_209542400;
    if ((_DWORD)v10 != 23)
      v15 = (int *)&unk_2095423F0;
    v16 = *v15;
    if (*v15)
    {
      v17 = v15 + 1;
      do
      {
        *v14++ = v16;
        v18 = *v17++;
        v16 = v18;
      }
      while (v18);
    }
    if (byte_25459BA68)
      v19 = 63;
    else
      v19 = 58;
    *v14 = v19;
    v20 = v14 + 1;
    *(_QWORD *)(a1 + 104) = v20;
    if (v11 >= 3)
    {
      v21 = *(_QWORD *)(a1 + 1216);
      v22 = v21 + 4 * v11;
      v23 = (int *)(v21 + 8);
      do
      {
        v24 = *v23++;
        *v20++ = v24;
      }
      while ((unint64_t)v23 < v22);
      *(_QWORD *)(a1 + 104) = v20;
    }
    *v20 = 0;
    sub_209537D30(a1);
    if (el_wgetc((EditLine *)a1, &v67) != 1)
      return sub_20952D7C8(a1);
    v25 = v67;
    v26 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 1064) + v67);
    if (v26 > 0x27)
    {
      if (v26 != 40)
      {
        if (v26 == 43)
        {
          v31 = 0;
          v32 = 0;
          v33 = 1;
          v10 = 22;
        }
        else
        {
          if (v26 != 44)
            goto LABEL_42;
          v31 = 0;
          v32 = 0;
          v33 = 1;
          v10 = 23;
        }
        goto LABEL_56;
      }
    }
    else if (v26 != 4)
    {
      if (v26 == 6 || v26 == 8)
      {
        v28 = *(_QWORD *)(a1 + 1224);
        if (v28 >= 0x3FE)
        {
LABEL_54:
          el_beep_0((EditLine *)a1);
          goto LABEL_55;
        }
        v29 = *(_QWORD *)(a1 + 1216);
        *(_QWORD *)(a1 + 1224) = v28 + 1;
        *(_DWORD *)(v29 + 4 * v28) = v25;
        v30 = *(_QWORD **)(a1 + 104);
        *v30 = v67;
        *(_QWORD *)(a1 + 104) = (char *)v30 + 4;
      }
      else
      {
LABEL_42:
        if (v67 == 7)
        {
          v33 = 0;
          v32 = 1;
          v31 = 6;
          goto LABEL_56;
        }
        if (v67 == 27)
          goto LABEL_107;
        if (v67 != 23)
        {
          dword_25459BA6C[0] = v67;
          el_wpush((EditLine *)a1, dword_25459BA6C);
LABEL_107:
          v33 = 0;
          v32 = 1;
          v31 = 4;
          goto LABEL_56;
        }
        v34 = *(_QWORD *)(a1 + 1224);
        if (v34 >= 3)
        {
          v35 = *(_QWORD *)(a1 + 1216);
          v36 = v35 + 4 * v34;
          v37 = (int *)(v35 + 8);
          while (!memchr("*[]?", *v37, 5uLL))
          {
            if ((unint64_t)++v37 >= v36)
              goto LABEL_49;
          }
          goto LABEL_54;
        }
LABEL_49:
        v38 = *(_QWORD *)(a1 + 104);
        v39 = (unsigned int *)(*(_QWORD *)(a1 + 96) + 4 * v34 - 12);
        *(_QWORD *)(a1 + 96) = v39;
        v40 = sub_20952CF3C(v39, v38, 1, (unsigned int (*)(_QWORD))sub_20952CD8C);
        v41 = *(unsigned int **)(a1 + 96);
        while (v41 < v40)
        {
          v42 = *v41;
          if (*v41 == 10)
            break;
          v43 = *(_QWORD *)(a1 + 1224);
          if (v43 >= 0x3FE)
          {
            el_beep_0((EditLine *)a1);
            break;
          }
          v44 = *(_QWORD *)(a1 + 1216);
          *(_QWORD *)(a1 + 1224) = v43 + 1;
          *(_DWORD *)(v44 + 4 * v43) = v42;
          v45 = *v41++;
          v46 = *(_DWORD **)(a1 + 104);
          *v46 = v45;
          *(_QWORD *)(a1 + 96) = v41;
          *(_QWORD *)(a1 + 104) = v46 + 1;
        }
        *(_QWORD *)(a1 + 96) = v4;
        **(_DWORD **)(a1 + 104) = 0;
      }
      sub_209537D30(a1);
LABEL_55:
      v31 = 0;
      v32 = 0;
      v33 = 0;
      goto LABEL_56;
    }
    if (*(_QWORD *)(a1 + 1224) <= 2uLL)
      goto LABEL_54;
    v31 = 0;
    v33 = 0;
    v32 = 1;
LABEL_56:
    v47 = *(_QWORD *)(a1 + 88);
    for (i = *(_DWORD **)(a1 + 104); (unint64_t)i > v47 && *i != 10; *(_QWORD *)(a1 + 104) = i)
      *i-- = 0;
    *i = 0;
    if ((v32 & 1) != 0)
      goto LABEL_94;
    v49 = *(_QWORD *)(a1 + 1216);
    v50 = *(_QWORD *)(a1 + 1224);
    v67 = 93;
    v51 = v50 - 1;
    while (v51 >= 2)
    {
      v52 = *(_DWORD *)(v49 + 4 * v51);
      if (v52 != 93)
      {
        --v51;
        if (v52 != 91)
          continue;
      }
      v67 = v52;
      goto LABEL_67;
    }
    v52 = 93;
LABEL_67:
    if (v50 >= 3 && v52 != 91)
    {
      if ((_DWORD)v10 != v66)
        v33 = 0;
      if ((v33 & 1) != 0)
      {
        if (byte_25459BA68 == 1)
        {
          *(_DWORD *)(a1 + 1176) = v64;
          if (sub_2095308D8(a1) == 6)
            sub_2095308D8(a1);
          v53 = *(_QWORD *)(a1 + v63);
          *(_QWORD *)(a1 + 96) = v53;
          v49 = *(_QWORD *)(a1 + 1216);
          v50 = *(_QWORD *)(a1 + 1224);
          v47 = *(_QWORD *)(a1 + 88);
        }
        else
        {
          v53 = *(_QWORD *)(a1 + 96) + 4 * v65;
          *(_QWORD *)(a1 + 96) = v53;
        }
      }
      else
      {
        v53 = *(_QWORD *)(a1 + 96);
      }
      v54 = 4 * v50;
      v55 = v50 + 2;
      *(_QWORD *)(a1 + 1224) = v55;
      *(_QWORD *)(v49 + v54) = 0x2A0000002ELL;
      *(_DWORD *)(v49 + 4 * v55) = 0;
      if (v53 < v47 || v53 > *(_QWORD *)(a1 + 104) || sub_2095396CC((_QWORD *)a1, v10) == 6)
      {
        *(_BYTE *)(a1 + 136) = v10;
        if ((_DWORD)v10 == 23)
          v56 = sub_20952E048(a1);
        else
          v56 = sub_20952E24C(a1);
        if (v56 == 6)
        {
          v57 = *(_QWORD *)(a1 + 1224) - 2;
          *(_QWORD *)(a1 + 1224) = v57;
          *(_DWORD *)(*(_QWORD *)(a1 + 1216) + 4 * v57) = 0;
          el_beep_0((EditLine *)a1);
          if (*(_DWORD *)(a1 + 1176) != v7)
          {
            *(_DWORD *)(a1 + 1176) = v7;
            if (sub_2095308D8(a1) == 6)
              return 6;
          }
          *(_QWORD *)(a1 + 96) = v4;
          v58 = 1;
          goto LABEL_92;
        }
        v59 = 88;
        if ((_DWORD)v10 == 23)
          v59 = 104;
        *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + v59);
        sub_2095396CC((_QWORD *)a1, v10);
      }
      v58 = 0;
      v60 = *(_QWORD *)(a1 + 1224) - 2;
      *(_QWORD *)(a1 + 1224) = v60;
      *(_DWORD *)(*(_QWORD *)(a1 + 1216) + 4 * v60) = 0;
LABEL_92:
      byte_25459BA68 = v58;
    }
    v31 = sub_2095390F0(a1, v10);
    if (!(((_DWORD)v31 != 6 || (byte_25459BA68 & 1) == 0) | v6 & 1))
    {
      v61 = 0;
      v31 = 0;
      goto LABEL_100;
    }
LABEL_94:
    if ((_DWORD)v31)
    {
      if (v2 || (_DWORD)v31 != 6)
        return v31;
      v61 = 1;
    }
    else
    {
      v61 = 0;
    }
LABEL_100:
    byte_25459BA68 = v6;
    *(_QWORD *)(a1 + 1224) = v2;
    if (*(_DWORD *)(a1 + 1176) != v7)
    {
      *(_DWORD *)(a1 + 1176) = v7;
      if (sub_2095308D8(a1) == 6)
        return 6;
    }
    *(_QWORD *)(a1 + 96) = v4;
    if (v61)
      break;
    if (v32)
      return v31;
  }
  sub_209537D30(a1);
  return 6;
}

uint64_t sub_2095396CC(_QWORD *a1, int a2)
{
  __int32 *v3;
  uint64_t v4;
  __int32 *v5;
  __int32 v6;
  __int32 v7;
  __int32 v8;
  uint64_t result;

  v3 = (__int32 *)a1[12];
  v4 = a1[152];
  v7 = *(_DWORD *)(v4 + 4);
  v5 = (__int32 *)(v4 + 4);
  v6 = v7;
  *v5 = 94;
  if (a2 == 23)
  {
    while ((unint64_t)v3 >= a1[11])
    {
      if (sub_209538FA4(v3, v5))
        goto LABEL_10;
      --v3;
    }
  }
  else if (*v3)
  {
    while ((unint64_t)v3 < a1[14])
    {
      if (sub_209538FA4(v3, v5))
      {
LABEL_10:
        result = 0;
        *v5 = v6;
        a1[12] = v3;
        return result;
      }
      v8 = v3[1];
      ++v3;
      if (!v8)
        break;
    }
  }
  *v5 = v6;
  return 6;
}

uint64_t sub_209539774(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  size_t v5;
  __int32 *v6;
  int v7;
  __int32 *v8;
  _DWORD *v9;
  __int32 v10;
  __int32 v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const __int32 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int32 v21[2];
  _QWORD v22[512];

  v2 = MEMORY[0x24BDAC7A8](a1, a2);
  v4 = v3;
  v5 = v2;
  v22[511] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v21 = 0x2A0000002ELL;
  *(_DWORD *)(v2 + 1232) = v3;
  if (v3 == 23)
    v6 = (__int32 *)&unk_209542410;
  else
    v6 = (__int32 *)&unk_20954241C;
  v7 = sub_20952D604(v2, (uint64_t)v22, v6);
  if (v7 == -1)
    return 4;
  v8 = &v21[v7];
  v11 = v8[2];
  v9 = v8 + 2;
  v10 = v11;
  *v9 = 0;
  if (v7)
  {
    v12 = v7 + 4;
    *(_QWORD *)v9 = 0x2A0000002ELL;
    v21[v12] = 0;
    wcsncpy(*(__int32 **)(v5 + 1216), v21, 0x3FFuLL);
    *(_QWORD *)(v5 + 1224) = v12;
  }
  else
  {
    if (!*(_QWORD *)(v5 + 1224))
      goto LABEL_17;
    v16 = *(const __int32 **)(v5 + 1216);
    if ((*v16 | 4) != 0x2E)
    {
      wcsncpy(v21, v16, 0x3FFuLL);
      v17 = *(_QWORD *)(v5 + 1216);
      *(_QWORD *)v17 = 0x2A0000002ELL;
      wcsncpy((__int32 *)(v17 + 8), v21, 0x3FDuLL);
      v18 = *(_QWORD *)(v5 + 1224);
      v19 = *(_QWORD *)(v5 + 1216);
      v20 = v19 + 4 * v18;
      v18 += 3;
      *(_QWORD *)(v5 + 1224) = v18;
      *(_QWORD *)(v20 + 4) = 0x2A0000002ELL;
      *(_DWORD *)(v19 + 4 * v18) = 0;
    }
  }
  *(_BYTE *)(v5 + 136) = v4;
  v13 = *(_QWORD *)(v5 + 88);
  *(_QWORD *)(v5 + 96) = v13;
  *(_QWORD *)(v5 + 104) = v13;
  if (v4 == 23)
    v14 = sub_20952E048(v5);
  else
    v14 = sub_20952E24C(v5);
  if (v14 != 6)
  {
    if (v10 == 27)
    {
      sub_209537D30(v5);
      return sub_20952DE6C(v5);
    }
    return 4;
  }
LABEL_17:
  sub_209537D30(v5);
  return 6;
}

uint64_t sub_209539930(size_t a1, int a2)
{
  *(_BYTE *)(a1 + 136) = a2;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a1 + 88);
  if (a2 == 23)
    return sub_20952E048(a1);
  if (a2 == 22)
    return sub_20952E24C(a1);
  return 6;
}

uint64_t sub_209539964(EditLine *a1, int a2, __int32 a3, int a4, int a5)
{
  __int32 *v9;
  unint64_t v10;
  __int32 v11;
  uint64_t v12;
  uint64_t v13;
  __int32 *v14;
  __int32 v16;

  if (!a3)
    return 6;
  if (a3 == -1)
  {
    v16 = 0;
    if (el_wgetc(a1, &v16) != 1)
      return sub_20952D7C8((uint64_t)a1);
    a3 = v16;
  }
  *((_DWORD *)a1 + 310) = a3;
  *((_DWORD *)a1 + 309) = a2;
  *((_BYTE *)a1 + 1244) = a5;
  v9 = (__int32 *)*((_QWORD *)a1 + 12);
  if (a4)
  {
    v10 = *((_QWORD *)a1 + 13);
    v11 = *v9;
LABEL_7:
    if (v11 == a3)
      v12 = a2;
    else
      v12 = 0;
    v9 += v12;
    if ((unint64_t)v9 < v10)
    {
      --a4;
      while ((unint64_t)v9 >= *((_QWORD *)a1 + 11))
      {
        if (*v9 == a3)
        {
          v11 = a3;
          if (a4)
            goto LABEL_7;
          goto LABEL_17;
        }
        v9 += a2;
        if ((unint64_t)v9 >= v10)
          return 6;
      }
    }
    return 6;
  }
  else
  {
LABEL_17:
    if (a5)
      v13 = -(uint64_t)a2;
    else
      v13 = 0;
    v14 = &v9[v13];
    *((_QWORD *)a1 + 12) = v14;
    if (*((_DWORD *)a1 + 250))
    {
      if (a2 >= 1)
        *((_QWORD *)a1 + 12) = v14 + 1;
      sub_20952D154((uint64_t)a1);
      return 4;
    }
    else
    {
      return 5;
    }
  }
}

uint64_t sub_209539A8C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  sigset_t v6;

  v2 = malloc_type_malloc(0x78uLL, 0x1080040455F1686uLL);
  *(_QWORD *)(a1 + 1248) = v2;
  if (!v2)
    return 0xFFFFFFFFLL;
  v6 = 0;
  *((_DWORD *)v2 + 28) = 134627335;
  sigprocmask(1, (const sigset_t *)v2 + 28, &v6);
  v3 = 0;
  v4 = *(_QWORD *)(a1 + 1248);
  do
  {
    *(_QWORD *)(v4 + v3) = -1;
    v4 = *(_QWORD *)(a1 + 1248);
    *(_QWORD *)(v4 + v3 + 8) = 0;
    v3 += 16;
  }
  while (v3 != 112);
  sigprocmask(3, &v6, 0);
  return 0;
}

void sub_209539B34(uint64_t a1)
{
  free(*(void **)(a1 + 1248));
  *(_QWORD *)(a1 + 1248) = 0;
}

uint64_t sub_209539B5C(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  sigaction v7;
  sigaction v8;
  sigset_t v9;

  v9 = 0;
  v8.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v8.sa_mask = 0;
  v7.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_209539C0C;
  *(_QWORD *)&v7.sa_mask = 0;
  sigprocmask(1, (const sigset_t *)(*(_QWORD *)(a1 + 1248) + 112), &v9);
  v2 = 0;
  qword_25459BA78 = a1;
  v3 = dword_209542428;
  do
  {
    v4 = *v3++;
    if (sigaction(v4, &v7, &v8) != -1 && v8.__sigaction_u.__sa_handler != (void (__cdecl *)(int))sub_209539C0C)
      *(sigaction *)(*(_QWORD *)(a1 + 1248) + v2) = v8;
    v2 += 16;
  }
  while (v2 != 112);
  return sigprocmask(3, &v9, 0);
}

uint64_t sub_209539C0C(int a1)
{
  sigset_t v2;
  EditLine *v3;
  uint64_t i;
  uint64_t v5;
  sigset_t v7;
  sigset_t v8;

  v2 = 1 << (a1 - 1);
  if (a1 > 32)
    v2 = 0;
  v7 = 0;
  v8 = v2;
  sigprocmask(1, &v8, &v7);
  v3 = (EditLine *)qword_25459BA78;
  *(_DWORD *)(*(_QWORD *)(qword_25459BA78 + 1248) + 116) = a1;
  if (a1 == 28)
  {
    el_resize(v3);
  }
  else if (a1 == 19)
  {
    sub_20953CEFC((uint64_t)v3);
    if (sub_20952DF24() == 4)
      sub_209537D30(qword_25459BA78);
    sub_20953B998(qword_25459BA78);
  }
  else
  {
    sub_20953D3EC((uint64_t)v3);
  }
  for (i = 0; i != 7; ++i)
  {
    if (dword_209542428[i] == a1)
      break;
  }
  sigaction(a1, (const sigaction *)(*(_QWORD *)(qword_25459BA78 + 1248) + 16 * i), 0);
  v5 = qword_25459BA78;
  *(_QWORD *)(*(_QWORD *)(qword_25459BA78 + 1248) + 16 * i) = -1;
  *(_QWORD *)(*(_QWORD *)(v5 + 1248) + 16 * i + 8) = 0;
  sigprocmask(3, &v7, 0);
  return kill(0, a1);
}

uint64_t sub_209539D30(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int *v4;
  const sigaction *v5;
  int v6;
  sigset_t v8;

  v8 = 0;
  sigprocmask(1, (const sigset_t *)(*(_QWORD *)(a1 + 1248) + 112), &v8);
  v2 = 0;
  v3 = 2;
  v4 = &dword_20954242C;
  do
  {
    v5 = (const sigaction *)(*(_QWORD *)(a1 + 1248) + v2);
    if (v5->__sigaction_u.__sa_handler != (void (__cdecl *)(int))-1)
      sigaction(v3, v5, 0);
    v6 = *v4++;
    v3 = v6;
    v2 += 16;
  }
  while (v2 != 112);
  return sigprocmask(3, &v8, 0);
}

uint64_t sub_209539DC0(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _OWORD *v6;
  uint64_t result;
  uint64_t v8;

  v2 = malloc_type_malloc(0x800uLL, 0x100004077774924uLL);
  a1[21] = v2;
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = malloc_type_malloc(0x800uLL, 0x100004077774924uLL);
  a1[25] = v3;
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = malloc_type_malloc(0xE0uLL, 0x1052040397E700EuLL);
  a1[26] = v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  a1[22] = 0;
  v5 = malloc_type_malloc(0x138uLL, 0x10040436913F5uLL);
  a1[23] = v5;
  if (!v5)
    return 0xFFFFFFFFLL;
  v5[38] = 0;
  *((_OWORD *)v5 + 17) = 0u;
  *((_OWORD *)v5 + 18) = 0u;
  *((_OWORD *)v5 + 15) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)v5 = 0u;
  v6 = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
  a1[24] = v6;
  if (!v6)
    return 0xFFFFFFFFLL;
  *v6 = 0u;
  v6[1] = 0u;
  sub_209539FAC((uint64_t)a1, 0);
  result = 0;
  v8 = a1[26];
  *(_QWORD *)v8 = &unk_2095424FC;
  *(_DWORD *)(v8 + 8) = 16;
  *(_BYTE *)(v8 + 16) = 14;
  *(_DWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 32) = &unk_209542510;
  *(_DWORD *)(v8 + 40) = 19;
  *(_QWORD *)(v8 + 64) = &unk_20954251C;
  *(_BYTE *)(v8 + 48) = 17;
  *(_DWORD *)(v8 + 56) = 0;
  *(_DWORD *)(v8 + 72) = 17;
  *(_BYTE *)(v8 + 80) = 16;
  *(_DWORD *)(v8 + 88) = 0;
  *(_QWORD *)(v8 + 96) = &unk_209542530;
  *(_DWORD *)(v8 + 104) = 18;
  *(_BYTE *)(v8 + 112) = 13;
  *(_DWORD *)(v8 + 120) = 0;
  *(_QWORD *)(v8 + 128) = &unk_209542548;
  *(_DWORD *)(v8 + 136) = 36;
  *(_BYTE *)(v8 + 144) = 10;
  *(_DWORD *)(v8 + 152) = 0;
  *(_QWORD *)(v8 + 160) = &unk_20954255C;
  *(_DWORD *)(v8 + 168) = 37;
  *(_BYTE *)(v8 + 176) = 11;
  *(_DWORD *)(v8 + 184) = 0;
  *(_QWORD *)(v8 + 192) = &unk_20954256C;
  *(_DWORD *)(v8 + 200) = 38;
  *(_BYTE *)(v8 + 208) = 3;
  *(_DWORD *)(v8 + 216) = 0;
  return result;
}

uint64_t sub_209539FAC(uint64_t a1, char *a2)
{
  int v4;
  int v5;
  char **v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  uint64_t v17;
  sigset_t v18;
  sigset_t v19;
  char *v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v18 = 0x8000000;
  v19 = 0;
  sigprocmask(1, &v18, &v19);
  v20 = &v21;
  if (!a2 && (a2 = getenv("TERM")) == 0 || !*a2)
    a2 = "dumb";
  v17 = 0;
  if (!strcmp(a2, "emacs"))
    *(_DWORD *)(a1 + 44) |= 4u;
  bzero(*(void **)(a1 + 200), 0x800uLL);
  v4 = tgetent(*(char **)(a1 + 200), a2);
  v5 = v4;
  if (v4 <= 0)
  {
    if (v4)
    {
      if (v4 == -1)
        fwrite("Cannot read termcap database;\n", 0x1EuLL, 1uLL, *(FILE **)(a1 + 24));
    }
    else
    {
      fprintf(*(FILE **)(a1 + 24), "No entry for terminal type \"%s\";\n", a2);
    }
    fwrite("using dumb terminal settings.\n", 0x1EuLL, 1uLL, *(FILE **)(a1 + 24));
    v11 = 0;
    v12 = *(_QWORD *)(a1 + 192);
    *(_OWORD *)(v12 + 4) = xmmword_209542450;
    *(_DWORD *)(v12 + 20) = *(_DWORD *)(v12 + 28);
    do
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 184) + ((v11 * 8) >> 1)) = 0;
      v13 = off_24C1B5598[v11 + 2];
      v11 += 2;
    }
    while (v13);
  }
  else
  {
    **(_DWORD **)(a1 + 192) = tgetflag("am");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 24) = tgetflag("xn");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 4) = tgetflag("pt");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 20) = tgetflag("xt");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 16) = tgetflag("km");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 28) = tgetflag("MT");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 12) = tgetnum("co");
    *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8) = tgetnum("li");
    v6 = off_24C1B5598;
    v7 = "al";
    do
    {
      v8 = strchr(v7, *v7);
      v9 = tgetstr(v8, &v20);
      sub_20953ADB8(a1, (uint64_t)v6, v9);
      v10 = v6[2];
      v6 += 2;
      v7 = v10;
    }
    while (v10);
  }
  v14 = *(_QWORD *)(a1 + 192);
  v15 = *(_DWORD *)(v14 + 12);
  if (v15 <= 1)
  {
    v15 = 80;
    *(_DWORD *)(v14 + 12) = 80;
  }
  if (*(int *)(v14 + 8) < 1)
    *(_DWORD *)(v14 + 8) = 24;
  *(_DWORD *)(a1 + 156) = v15;
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(v14 + 8);
  sub_20953AFBC(a1);
  sub_20953B1AC(a1, (_DWORD *)&v17 + 1, &v17);
  result = sub_20953B28C(a1, SHIDWORD(v17), v17);
  if ((_DWORD)result != -1)
  {
    sigprocmask(3, &v19, 0);
    sub_20953B43C(a1);
    *(_QWORD *)(a1 + 144) = a2;
    if (v5 >= 1)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

void sub_20953A298(uint64_t a1)
{
  free(*(void **)(a1 + 168));
  *(_QWORD *)(a1 + 168) = 0;
  free(*(void **)(a1 + 200));
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  free(*(void **)(a1 + 184));
  *(_QWORD *)(a1 + 184) = 0;
  free(*(void **)(a1 + 192));
  *(_QWORD *)(a1 + 192) = 0;
  free(*(void **)(a1 + 208));
  *(_QWORD *)(a1 + 208) = 0;
  sub_20953A2F8(a1);
}

void sub_20953A2F8(uint64_t a1)
{
  void **v2;
  void *v3;
  void **v4;
  void *v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;

  v2 = *(void ***)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;
  if (v2)
  {
    v3 = *v2;
    if (*v2)
    {
      v4 = v2 + 1;
      do
      {
        free(v3);
        v5 = *v4++;
        v3 = v5;
      }
      while (v5);
    }
    free(v2);
  }
  v6 = *(void ***)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  if (v6)
  {
    v7 = *v6;
    if (*v6)
    {
      v8 = v6 + 1;
      do
      {
        free(v7);
        v9 = *v8++;
        v7 = v9;
      }
      while (v9);
    }
    free(v6);
  }
}

uint64_t sub_20953A380(uint64_t result, int a2)
{
  int v2;
  int v3;
  uint64_t v5;
  int v6;
  unsigned int v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  const char *v15;
  char *v16;

  v2 = *(_DWORD *)(result + 56);
  v3 = v2 - a2;
  if (v2 != a2)
  {
    v5 = result;
    if (*(_DWORD *)(result + 156) >= a2)
    {
      v6 = a2 - v2;
      if (a2 - v2 < 1)
      {
        v12 = *(_QWORD *)(result + 184);
        result = *(_QWORD *)(v12 + 280);
        if (!result || !*(_BYTE *)result || v6 >= -1 && (v13 = *(_BYTE **)(v12 + 208)) != 0 && *v13)
        {
          v14 = *(_BYTE **)(v12 + 208);
          if (v14 && v6 < 0 && *v14)
          {
            do
            {
              v15 = *(const char **)(*(_QWORD *)(v5 + 184) + 208);
              qword_25459BA80 = *(_QWORD *)(v5 + 16);
              result = tputs(v15, 1, (int (__cdecl *)(int))sub_20953C3E4);
              --v3;
            }
            while (v3);
          }
          goto LABEL_32;
        }
        v6 = -v6;
      }
      else
      {
        v7 = v6 + 1;
        while ((*(_BYTE *)(v5 + 160) & 0x80) != 0)
        {
          v8 = *(_DWORD **)(*(_QWORD *)(v5 + 64) + 8 * *(int *)(v5 + 56));
          if (!*v8)
            break;
          v9 = *(int *)(v5 + 152);
          v10 = v9 - 1;
          if ((_DWORD)v9 == 1)
          {
            LODWORD(v10) = 0;
          }
          else
          {
            do
            {
              if (v8[v10] != -1)
                break;
              --v10;
            }
            while (v10);
          }
          sub_20953A534(v5, v10);
          result = sub_20953A75C(v5, (unsigned __int32 *)(*(_QWORD *)(*(_QWORD *)(v5 + 64) + 8 * *(int *)(v5 + 56))+ 4 * *(int *)(v5 + 52)), *(int *)(v5 + 152) - (uint64_t)*(int *)(v5 + 52));
          --v7;
          v11 = __OFSUB__(v6--, 1);
          if ((v6 < 0) ^ v11 | (v6 == 0))
            goto LABEL_32;
        }
        if (v6 < 2 || (result = *(_QWORD *)(*(_QWORD *)(v5 + 184) + 248)) == 0 || !*(_BYTE *)result)
        {
          do
          {
            result = sub_20953A860(v5, 0xAu);
            --v7;
          }
          while (v7 > 1);
          *(_DWORD *)(v5 + 52) = 0;
          goto LABEL_32;
        }
      }
      v16 = tgoto((const char *)result, v6, v6);
      qword_25459BA80 = *(_QWORD *)(v5 + 16);
      result = tputs(v16, v6, (int (__cdecl *)(int))sub_20953C3E4);
LABEL_32:
      *(_DWORD *)(v5 + 56) = a2;
    }
  }
  return result;
}

uint64_t sub_20953A534(uint64_t result, int a2)
{
  signed int v2;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  const char *v8;
  char *v9;
  int v10;
  int v11;
  int v12;
  signed int v13;

  v2 = *(_DWORD *)(result + 52);
  if (v2 != a2)
  {
    v4 = result;
    if (*(_DWORD *)(result + 152) >= a2)
    {
      v5 = (a2 & 7) + (a2 >> 3);
      while (1)
      {
        if (!a2)
        {
          result = sub_20953A860(v4, 0xDu);
          goto LABEL_39;
        }
        v6 = a2 - v2;
        if ((a2 - v2 - 5) <= 0xFFFFFFF6)
        {
          result = *(_QWORD *)(*(_QWORD *)(v4 + 184) + 32);
          if (result)
          {
            if (*(_BYTE *)result)
            {
              v9 = tgoto((const char *)result, a2, a2);
              qword_25459BA80 = *(_QWORD *)(v4 + 16);
              v10 = a2;
              goto LABEL_36;
            }
          }
        }
        if (v6 >= 1)
          break;
        v7 = v2 - a2;
        if (v6 <= -5)
        {
          result = *(_QWORD *)(*(_QWORD *)(v4 + 184) + 264);
          if (result)
          {
            if (*(_BYTE *)result)
            {
              v9 = tgoto((const char *)result, v2 - a2, v2 - a2);
              qword_25459BA80 = *(_QWORD *)(v4 + 16);
              v10 = -v6;
              goto LABEL_36;
            }
          }
        }
        if ((*(_BYTE *)(v4 + 160) & 8) != 0)
        {
          if (v5 >= v7)
          {
LABEL_23:
            if (v6 < 0)
            {
              if (v7 <= 1)
                v11 = 1;
              else
                v11 = v2 - a2;
              do
              {
                result = sub_20953A860(v4, 8u);
                --v11;
              }
              while (v11);
            }
            goto LABEL_39;
          }
        }
        else if (v7 <= a2)
        {
          goto LABEL_23;
        }
        result = sub_20953A860(v4, 0xDu);
        v2 = 0;
        *(_DWORD *)(v4 + 52) = 0;
        if (*(_DWORD *)(v4 + 152) < a2)
          return result;
      }
      if (v6 >= 5)
      {
        v8 = *(const char **)(*(_QWORD *)(v4 + 184) + 272);
        if (v8)
        {
          if (*v8)
          {
            v9 = tgoto(v8, a2 - v2, a2 - v2);
            qword_25459BA80 = *(_QWORD *)(v4 + 16);
            v10 = v6;
LABEL_36:
            result = tputs(v9, v10, (int (__cdecl *)(int))sub_20953C3E4);
            goto LABEL_39;
          }
        }
      }
      if ((*(_BYTE *)(v4 + 160) & 8) != 0)
      {
        v12 = v2 & 0xF8;
        v13 = a2 & 0xFFFFFFF8;
        if (v12 != (a2 & 0xFFFFFFF8)
          && *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 64) + 8 * *(int *)(v4 + 56)) + 4
                                                                                     * (a2 & 0xF8)) != -1)
        {
          while (v12 < v13)
          {
            sub_20953A860(v4, 9u);
            v12 += 8;
          }
          *(_DWORD *)(v4 + 52) = v13;
          v6 = a2 & 7;
          v2 = a2 & 0xFFFFFFF8;
        }
      }
      result = sub_20953A75C(v4, (unsigned __int32 *)(*(_QWORD *)(*(_QWORD *)(v4 + 64) + 8 * *(int *)(v4 + 56)) + 4 * v2), v6);
LABEL_39:
      *(_DWORD *)(v4 + 52) = a2;
    }
  }
  return result;
}

uint64_t sub_20953A75C(uint64_t result, unsigned __int32 *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unsigned __int32 v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int v15;
  int v16;
  int v17;

  if (a3)
  {
    v3 = a3;
    v4 = result;
    if (*(int *)(result + 152) >= a3)
    {
      do
      {
        v6 = *a2++;
        result = sub_20953A860(v4, v6);
        v7 = *(_DWORD *)(v4 + 52) + 1;
        *(_DWORD *)(v4 + 52) = v7;
        --v3;
      }
      while (v3);
      v8 = *(_DWORD *)(v4 + 152);
      if (v7 >= v8)
      {
        v9 = *(_DWORD *)(v4 + 160);
        if ((v9 & 0x80) == 0)
        {
          v10 = v8 - 1;
LABEL_7:
          *(_DWORD *)(v4 + 52) = v10;
          return result;
        }
        v11 = *(int *)(v4 + 56) + 1;
        *(_DWORD *)(v4 + 52) = 0;
        *(_DWORD *)(v4 + 56) = v11;
        if ((v9 & 0x100) != 0)
        {
          v17 = **(_DWORD **)(*(_QWORD *)(v4 + 64) + 8 * v11);
          if (!v17)
          {
            result = sub_20953A860(v4, 0x20u);
            v10 = 1;
            goto LABEL_7;
          }
          result = sub_20953A75C(v4, &v17, 1);
          v12 = *(int *)(v4 + 52);
          v13 = *(_QWORD *)(*(_QWORD *)(v4 + 64) + 8 * *(int *)(v4 + 56));
          if (*(_DWORD *)(v13 + 4 * v12) == -1)
          {
            v14 = (int *)(v13 + 4 * v12 + 4);
            v15 = v12 + 1;
            do
            {
              *(_DWORD *)(v4 + 52) = v15;
              v16 = *v14++;
              ++v15;
            }
            while (v16 == -1);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_20953A860(uint64_t a1, unsigned __int32 a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char v6[7];
  uint64_t v7;
  uint64_t v8;

  if (a2 == -1)
    return 0;
  v7 = v2;
  v8 = v3;
  result = sub_20953ECD4(v6, 6uLL, a2);
  if (result > 0)
  {
    v6[result] = 0;
    return fputs(v6, *(FILE **)(a1 + 16));
  }
  return result;
}

char *sub_20953A8C0(char *result, int a2)
{
  char *v2;
  int v3;
  _QWORD *v4;
  const char *v5;
  _BYTE *v6;
  const char *v7;
  _BYTE *v8;
  const char *v9;
  int v10;

  if (a2 < 1)
    return result;
  v2 = result;
  if ((result[160] & 2) == 0)
    return result;
  v3 = a2;
  if (*((_DWORD *)result + 38) < a2)
    return result;
  v4 = (_QWORD *)*((_QWORD *)result + 23);
  v5 = (const char *)v4[30];
  if (v5)
  {
    if (*v5)
    {
      if (a2 > 1 || (v6 = (_BYTE *)v4[6]) == 0 || !*v6)
      {
        result = tgoto(v5, a2, a2);
        qword_25459BA80 = *((_QWORD *)v2 + 2);
        v10 = v3;
        return (char *)tputs(result, v10, (int (__cdecl *)(int))sub_20953C3E4);
      }
    }
  }
  v7 = (const char *)v4[8];
  if (v7 && *v7)
  {
    qword_25459BA80 = *((_QWORD *)v2 + 2);
    tputs(v7, 1, (int (__cdecl *)(int))sub_20953C3E4);
    v4 = (_QWORD *)*((_QWORD *)v2 + 23);
  }
  v8 = (_BYTE *)v4[6];
  if (v8 && *v8)
  {
    do
    {
      --v3;
      v9 = *(const char **)(*((_QWORD *)v2 + 23) + 48);
      qword_25459BA80 = *((_QWORD *)v2 + 2);
      tputs(v9, 1, (int (__cdecl *)(int))sub_20953C3E4);
    }
    while (v3);
    v4 = (_QWORD *)*((_QWORD *)v2 + 23);
  }
  result = (char *)v4[9];
  if (result && *result)
  {
    qword_25459BA80 = *((_QWORD *)v2 + 2);
    v10 = 1;
    return (char *)tputs(result, v10, (int (__cdecl *)(int))sub_20953C3E4);
  }
  return result;
}

uint64_t sub_20953AA04(uint64_t result, unsigned __int32 *a2, int a3)
{
  uint64_t v3;
  unsigned int v4;
  _QWORD *v6;
  const char *v7;
  _BYTE *v8;
  const char *v9;
  _BYTE *v10;
  unsigned __int32 v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  unsigned __int32 v16;
  char *v17;

  if (a3 >= 1)
  {
    v3 = result;
    if ((*(_BYTE *)(result + 160) & 1) != 0)
    {
      v4 = a3;
      if (*(_DWORD *)(result + 152) >= a3)
      {
        v6 = *(_QWORD **)(result + 184);
        v7 = (const char *)v6[32];
        if (v7 && *v7 && (a3 > 1 || (v8 = (_BYTE *)v6[13]) == 0 || !*v8))
        {
          v17 = tgoto(v7, a3, a3);
          qword_25459BA80 = *(_QWORD *)(v3 + 16);
          tputs(v17, v4, (int (__cdecl *)(int))sub_20953C3E4);
          return sub_20953A75C(v3, a2, v4);
        }
        else
        {
          v9 = (const char *)v6[14];
          if (v9 && *v9 && (v10 = (_BYTE *)v6[10]) != 0 && *v10)
          {
            qword_25459BA80 = *(_QWORD *)(v3 + 16);
            tputs(v9, 1, (int (__cdecl *)(int))sub_20953C3E4);
            *(_DWORD *)(v3 + 52) += v4;
            do
            {
              v11 = *a2++;
              sub_20953A860(v3, v11);
              --v4;
            }
            while (v4);
            v12 = *(_QWORD *)(v3 + 184);
            v13 = *(const char **)(v12 + 120);
            if (v13)
            {
              if (*v13)
              {
                qword_25459BA80 = *(_QWORD *)(v3 + 16);
                tputs(v13, 1, (int (__cdecl *)(int))sub_20953C3E4);
                v12 = *(_QWORD *)(v3 + 184);
              }
            }
            v14 = *(const char **)(v12 + 80);
            qword_25459BA80 = *(_QWORD *)(v3 + 16);
            return tputs(v14, 1, (int (__cdecl *)(int))sub_20953C3E4);
          }
          else
          {
            do
            {
              v15 = *(const char **)(*(_QWORD *)(v3 + 184) + 104);
              if (v15 && *v15)
              {
                qword_25459BA80 = *(_QWORD *)(v3 + 16);
                tputs(v15, 1, (int (__cdecl *)(int))sub_20953C3E4);
              }
              v16 = *a2++;
              sub_20953A860(v3, v16);
              ++*(_DWORD *)(v3 + 52);
              result = *(_QWORD *)(*(_QWORD *)(v3 + 184) + 120);
              if (result && *(_BYTE *)result)
              {
                qword_25459BA80 = *(_QWORD *)(v3 + 16);
                result = tputs((const char *)result, 1, (int (__cdecl *)(int))sub_20953C3E4);
              }
              --v4;
            }
            while (v4);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_20953ABFC(uint64_t result, int a2)
{
  uint64_t v3;
  int v4;

  v3 = result;
  if ((*(_BYTE *)(result + 160) & 4) != 0
    && (result = *(_QWORD *)(*(_QWORD *)(result + 184) + 24)) != 0
    && *(_BYTE *)result)
  {
    qword_25459BA80 = *(_QWORD *)(v3 + 16);
    return tputs((const char *)result, 1, (int (__cdecl *)(int))sub_20953C3E4);
  }
  else
  {
    if (a2 >= 1)
    {
      v4 = a2;
      do
      {
        result = sub_20953A860(v3, 0x20u);
        --v4;
      }
      while (v4);
    }
    *(_DWORD *)(v3 + 52) += a2;
  }
  return result;
}

uint64_t sub_20953AC94(_QWORD *a1)
{
  _QWORD *v2;
  const char *v3;
  int v4;
  const char *v5;
  _BYTE *v6;
  int v7;

  v2 = (_QWORD *)a1[23];
  v3 = (const char *)v2[5];
  if (v3 && *v3)
  {
    v4 = *(_DWORD *)(a1[24] + 8);
    qword_25459BA80 = a1[2];
    return tputs(v3, v4, (int (__cdecl *)(int))sub_20953C3E4);
  }
  v5 = (const char *)v2[12];
  if (v5)
  {
    if (*v5)
    {
      v6 = (_BYTE *)v2[2];
      if (v6)
      {
        if (*v6)
        {
          v7 = *(_DWORD *)(a1[24] + 8);
          qword_25459BA80 = a1[2];
          tputs(v5, v7, (int (__cdecl *)(int))sub_20953C3E4);
          v3 = *(const char **)(a1[23] + 16);
          v4 = *(_DWORD *)(a1[24] + 8);
          qword_25459BA80 = a1[2];
          return tputs(v3, v4, (int (__cdecl *)(int))sub_20953C3E4);
        }
      }
    }
  }
  sub_20953A860((uint64_t)a1, 0xDu);
  return sub_20953A860((uint64_t)a1, 0xAu);
}

void el_beep_0(EditLine *a1)
{
  const char *v2;

  v2 = *(const char **)(*((_QWORD *)a1 + 23) + 8);
  if (v2 && *v2)
  {
    qword_25459BA80 = *((_QWORD *)a1 + 2);
    tputs(v2, 1, (int (__cdecl *)(int))sub_20953C3E4);
  }
  else
  {
    sub_20953A860((uint64_t)a1, 7u);
  }
}

uint64_t sub_20953ADAC(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 144);
  return result;
}

void sub_20953ADB8(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;
  _BYTE __src[2048];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 184);
  v6 = (a2 - (uint64_t)off_24C1B5598) >> 4;
  bzero(__src, 0x800uLL);
  if (!a3 || !*a3)
  {
    *(_QWORD *)(v5 + 8 * v6) = 0;
    return;
  }
  v7 = strlen(a3);
  v8 = v7;
  v9 = *(char **)(v5 + 8 * v6);
  if (v9)
  {
    if (v7 <= strlen(*(const char **)(v5 + 8 * v6)))
    {
      strcpy(v9, a3);
      return;
    }
  }
  else if (!v7)
  {
    return;
  }
  v10 = *(_QWORD *)(a1 + 176);
  if ((unint64_t)(v10 + 3) >= 0x800)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *(char **)(v5 + 8 * v12);
      if (v14)
        v15 = v14 == v9;
      else
        v15 = 1;
      if (!v15)
      {
        v16 = *v14;
        if (*v14)
        {
          v17 = (unsigned __int8 *)(v14 + 1);
          do
          {
            v18 = v13 + 1;
            __src[v13] = v16;
            v19 = *v17++;
            v16 = v19;
            ++v13;
          }
          while (v19);
        }
        else
        {
          v18 = v13;
        }
        v13 = v18 + 1;
        __src[v18] = 0;
      }
      ++v12;
    }
    while (v12 != 39);
    memcpy(*(void **)(a1 + 168), __src, 0x800uLL);
    *(_QWORD *)(a1 + 176) = v13;
    if ((unint64_t)(v13 - 2045) <= 0xFFFFFFFFFFFFF7FFLL)
    {
      fwrite("Out of termcap string space.\n", 0x1DuLL, 1uLL, *(FILE **)(a1 + 24));
      return;
    }
    v11 = (char *)(*(_QWORD *)(a1 + 168) + v13);
  }
  else
  {
    v11 = (char *)(*(_QWORD *)(a1 + 168) + v10);
  }
  *(_QWORD *)(v5 + 8 * v6) = v11;
  strcpy(v11, a3);
  *(_QWORD *)(a1 + 176) += v8 + 1;
}

uint64_t sub_20953AFBC(uint64_t result)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  int v4;
  int v5;
  uint64_t v6;
  _BYTE *v7;
  unsigned int v8;
  _BYTE *v9;
  _BYTE *v10;
  unsigned int v11;
  _BYTE *v12;
  _BYTE *v13;
  unsigned __int8 *v14;
  unsigned int v15;
  _BYTE *v16;
  _BYTE *v17;
  unsigned int v18;
  int v19;
  int v20;
  const char *v21;
  const char *v22;
  unsigned int v23;
  const char *v24;
  unsigned int v25;

  v1 = result;
  *(_DWORD *)(result + 160) = 0;
  v2 = *(_DWORD *)(result + 824);
  v3 = *(_DWORD **)(result + 192);
  if (v2)
  {
    v2 = v3[1];
    if (v2)
      v2 = 8 * (v3[5] == 0);
    *(_DWORD *)(result + 160) = v2;
  }
  if (v3[4])
    v4 = 64;
  else
    v4 = (v3[7] != 0) << 6;
  v5 = v2 | v4;
  *(_DWORD *)(result + 160) = v5;
  v6 = *(_QWORD *)(result + 184);
  v7 = *(_BYTE **)(v6 + 24);
  if (v7)
    LODWORD(v7) = 4 * (*v7 != 0);
  v8 = v7 | v5;
  *(_DWORD *)(result + 160) = v8;
  v9 = *(_BYTE **)(v6 + 48);
  if (v9 && *v9)
  {
    LODWORD(v10) = 2;
  }
  else
  {
    v10 = *(_BYTE **)(v6 + 240);
    if (v10)
      LODWORD(v10) = 2 * (*v10 != 0);
  }
  v11 = v10 | v8;
  *(_DWORD *)(result + 160) = v11;
  v12 = *(_BYTE **)(v6 + 112);
  if (v12 && *v12 || (v13 = *(_BYTE **)(v6 + 104)) != 0 && *v13)
  {
    LODWORD(v14) = 1;
  }
  else
  {
    v14 = *(unsigned __int8 **)(v6 + 256);
    if (v14)
      LODWORD(v14) = *v14 != 0;
  }
  v15 = v14 | v11;
  *(_DWORD *)(result + 160) = v15;
  v16 = *(_BYTE **)(v6 + 208);
  if (v16 && *v16)
  {
    LODWORD(v17) = 32;
  }
  else
  {
    v17 = *(_BYTE **)(v6 + 280);
    if (v17)
      LODWORD(v17) = 32 * (*v17 != 0);
  }
  v18 = v17 | v15;
  *(_DWORD *)(result + 160) = v18;
  v19 = v18 | ((*v3 != 0) << 7);
  *(_DWORD *)(result + 160) = v19;
  v20 = v19 | ((v3[6] != 0) << 8);
  *(_DWORD *)(result + 160) = v20;
  v21 = *(const char **)(v6 + 168);
  if (!v21)
  {
    v25 = v20 & 0xFFFFFFEF;
    goto LABEL_38;
  }
  if (*v21 && (v22 = *(const char **)(v6 + 224)) != 0 && *v22)
  {
    result = strcmp(*(const char **)(v6 + 168), v22);
    v23 = v20 | (16 * ((_DWORD)result == 0));
  }
  else
  {
    v23 = v20 & 0xFFFFFFEF;
  }
  *(_DWORD *)(v1 + 160) = v23;
  if (*v21)
  {
    v24 = *(const char **)(v6 + 184);
    if (v24)
    {
      if (*v24)
      {
        result = strcmp(v21, v24);
        v25 = v23 | (16 * ((_DWORD)result == 0));
LABEL_38:
        *(_DWORD *)(v1 + 160) = v25;
      }
    }
  }
  return result;
}

BOOL sub_20953B1AC(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v6 = *(_QWORD *)(a1 + 192);
  *a3 = *(_DWORD *)(v6 + 12);
  *a2 = *(_DWORD *)(v6 + 8);
  v7 = *(_DWORD *)(a1 + 32);
  v11 = 0;
  if (ioctl(v7, 0x40087468uLL, &v11) != -1)
  {
    if (WORD1(v11))
      *a3 = WORD1(v11);
    if ((_WORD)v11)
      *a2 = (unsigned __int16)v11;
  }
  v8 = *(_DWORD *)(a1 + 32);
  v11 = 0;
  if (ioctl(v8, 0x40087468uLL, &v11) != -1)
  {
    if (WORD1(v11))
      *a3 = WORD1(v11);
    if ((_WORD)v11)
      *a2 = (unsigned __int16)v11;
  }
  v9 = *(_QWORD *)(a1 + 192);
  return *(_DWORD *)(v9 + 12) != *a3 || *(_DWORD *)(v9 + 8) != *a2;
}

uint64_t sub_20953B28C(uint64_t a1, int a2, int a3)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  if (a3 >= 2)
    v4 = a3;
  else
    v4 = 80;
  v5 = *(_QWORD *)(a1 + 192);
  if (a2 >= 1)
    v6 = a2;
  else
    v6 = 24;
  *(_DWORD *)(v5 + 8) = v6;
  *(_DWORD *)(v5 + 12) = v4;
  sub_20953A2F8(a1);
  v7 = *(_QWORD *)(a1 + 192);
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(v7 + 12);
  LODWORD(v7) = *(_DWORD *)(v7 + 8);
  *(_DWORD *)(a1 + 156) = v7;
  v8 = malloc_type_malloc(8 * ((int)v7 + 1), 0x10040436913F5uLL);
  if (v8)
  {
    v9 = v8;
    v10 = *(_DWORD *)(a1 + 156);
    if (v10 < 1)
    {
      v13 = v10;
LABEL_14:
      v9[v13] = 0;
      *(_QWORD *)(a1 + 64) = v9;
      v14 = malloc_type_malloc(8 * (v10 + 1), 0x10040436913F5uLL);
      if (!v14)
        return 0xFFFFFFFFLL;
      v9 = v14;
      v15 = *(int *)(a1 + 156);
      if ((int)v15 < 1)
      {
LABEL_19:
        v9[v15] = 0;
        *(_QWORD *)(a1 + 72) = v9;
        sub_2095389C8(a1);
        return 0;
      }
      v16 = 0;
      while (1)
      {
        v17 = malloc_type_malloc(4 * *(int *)(a1 + 152) + 4, 0x100004052888210uLL);
        v9[v16] = v17;
        if (!v17)
          break;
        ++v16;
        v15 = *(int *)(a1 + 156);
        if (v16 >= v15)
          goto LABEL_19;
      }
      if (v16)
      {
        v20 = v16 + 1;
        do
          free((void *)v9[(v20-- - 2)]);
        while (v20 > 1);
      }
    }
    else
    {
      v11 = 0;
      while (1)
      {
        v12 = malloc_type_malloc(4 * *(int *)(a1 + 152) + 4, 0x100004052888210uLL);
        v9[v11] = v12;
        if (!v12)
          break;
        ++v11;
        v10 = *(_DWORD *)(a1 + 156);
        if (v11 >= v10)
        {
          v13 = v10;
          goto LABEL_14;
        }
      }
      if (v11)
      {
        v19 = v11 + 1;
        do
          free((void *)v9[(v19-- - 2)]);
        while (v19 > 1);
      }
    }
    free(v9);
  }
  return 0xFFFFFFFFLL;
}

void sub_20953B43C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int *v13;
  int v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  char v18;
  const __int32 **v19;
  int v20[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 168))
  {
    v2 = *(_QWORD *)(a1 + 1056);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 208);
      v4 = *(_DWORD *)(a1 + 1096);
      if (v4 == 1)
        v2 = *(_QWORD *)(a1 + 1048);
      v17 = v4 == 1;
      v5 = 1072;
      if (v17)
        v5 = 1080;
      v6 = *(_QWORD *)(a1 + v5);
      sub_209532094(a1, &dword_209542588, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
      sub_209532094(a1, &dword_209542598, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
      sub_209532094(a1, &dword_2095425A8, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
      sub_209532094(a1, &dword_2095425B8, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
      sub_209532094(a1, &dword_2095425C8, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
      sub_209532094(a1, &dword_2095425D8, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      sub_209532094(a1, &dword_2095425E8, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
      sub_209532094(a1, &dword_2095425F8, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
      sub_209532094(a1, &dword_209542608, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
      sub_209532094(a1, &dword_209542618, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
      sub_209532094(a1, &dword_209542628, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
      sub_209532094(a1, &dword_209542638, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      if (*(_DWORD *)(a1 + 1096) == 1)
      {
        sub_209532094(a1, dword_20954258C, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
        sub_209532094(a1, dword_20954259C, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
        sub_209532094(a1, dword_2095425AC, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
        sub_209532094(a1, dword_2095425BC, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
        sub_209532094(a1, dword_2095425CC, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
        sub_209532094(a1, dword_2095425DC, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
        sub_209532094(a1, dword_2095425EC, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
        sub_209532094(a1, dword_2095425FC, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
        sub_209532094(a1, dword_20954260C, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
        sub_209532094(a1, dword_20954261C, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
        sub_209532094(a1, dword_20954262C, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
        sub_209532094(a1, dword_20954263C, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      }
      for (i = 0; i != 7; ++i)
      {
        v8 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 184) + 8 * *(int *)(v3 + 32 * i + 8));
        if (!v8 || !*v8)
          continue;
        v9 = 0;
        v10 = 0;
        while (v8[v10])
        {
          v20[v9++] = (char)v8[v10++];
          if (v10 == 8)
            goto LABEL_18;
        }
        if (v10 <= 7)
          bzero(&v20[v9], 32 - v9 * 4);
LABEL_18:
        v11 = v3 + 32 * i;
        v14 = *(_DWORD *)(v11 + 24);
        v13 = (int *)(v11 + 24);
        v12 = v14;
        if (v14 == 2)
        {
          sub_2095322C4(a1, v2, v20);
        }
        else
        {
          v15 = *v8;
          if (v8[1])
          {
            v16 = *(unsigned __int8 *)(v2 + v15);
            v17 = *(unsigned __int8 *)(v6 + v15) == v16 || v16 == 24;
            if (v17)
            {
              sub_209532094(a1, v20, (const __int32 **)(v3 + 32 * i + 16), v12);
              v18 = 24;
LABEL_32:
              *(_BYTE *)(v2 + v15) = v18;
              continue;
            }
          }
          else
          {
            v16 = *(unsigned __int8 *)(v2 + v15);
          }
          if (v16 == 34)
          {
            sub_2095322C4(a1, v2, v20);
            v19 = (const __int32 **)(v3 + 32 * i + 16);
            if (!*v13)
            {
              v18 = *(_BYTE *)v19;
              goto LABEL_32;
            }
            sub_209532094(a1, v20, v19, *v13);
          }
        }
      }
    }
  }
}

uint64_t sub_20953B85C(uint64_t a1, __int32 *a2, _QWORD *a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v7 = 0;
  v8 = *(_QWORD *)(a1 + 208);
  while (1)
  {
    result = wcscmp(a2, *(const __int32 **)(v8 + v7));
    if (!(_DWORD)result)
      break;
    v7 += 32;
    if (v7 == 224)
      return 0xFFFFFFFFLL;
  }
  v10 = v8 + v7;
  *(_QWORD *)(v10 + 16) = *a3;
  *(_DWORD *)(v10 + 24) = a4;
  return result;
}

uint64_t sub_20953B8CC(uint64_t a1, __int32 *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = 0;
  v4 = *(_QWORD *)(a1 + 208);
  while (1)
  {
    result = wcscmp(a2, *(const __int32 **)(v4 + v3));
    if (!(_DWORD)result)
      break;
    v3 += 32;
    if (v3 == 224)
      return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(v4 + v3 + 24) = 2;
  return result;
}

uint64_t sub_20953B928(uint64_t result, __int32 *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v3 = result;
  v4 = 0;
  v5 = *(_QWORD *)(result + 208);
  do
  {
    if (!*a2 || (result = wcscmp(a2, *(const __int32 **)(v5 + v4)), !(_DWORD)result))
    {
      v6 = *(_DWORD *)(v5 + v4 + 24);
      if (v6 != 2)
        result = sub_209532560(v3, *(unsigned __int32 **)(v5 + v4), (unsigned int **)(v5 + v4 + 16), v6);
    }
    v4 += 32;
  }
  while (v4 != 224);
  return result;
}

uint64_t sub_20953B998(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 16));
}

uint64_t sub_20953B9A0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unsigned __int32 v6[9];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = sub_20953F080(v6, 8uLL, a2);
  v4 = v3 & ~(v3 >> 63);
  v6[v4] = 0;
  sub_20953A75C(a1, v6, v4);
  return fflush(*(FILE **)(a1 + 16));
}

uint64_t sub_20953BA20(uint64_t a1)
{
  const char *v2;
  const char *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int32 **v7;
  const char *v8;
  char **v9;
  __int32 *v10;
  __int32 *v11;
  unsigned __int32 *v12;
  const char *v13;
  char *v14;

  fwrite("\n\tYour terminal has the\n", 0x18uLL, 1uLL, *(FILE **)(a1 + 16));
  fwrite("\tfollowing characteristics:\n\n", 0x1DuLL, 1uLL, *(FILE **)(a1 + 16));
  fprintf(*(FILE **)(a1 + 16), "\tIt has %d columns and %d lines\n", *(_DWORD *)(*(_QWORD *)(a1 + 192) + 12), *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8));
  if ((*(_DWORD *)(a1 + 160) & 0x40) != 0)
    v2 = "a";
  else
    v2 = "no";
  fprintf(*(FILE **)(a1 + 16), "\tIt has %s meta key\n", v2);
  if ((*(_DWORD *)(a1 + 160) & 8) != 0)
    v3 = " ";
  else
    v3 = "not ";
  fprintf(*(FILE **)(a1 + 16), "\tIt can%suse tabs\n", v3);
  if ((*(_DWORD *)(a1 + 160) & 0x80) != 0)
    v4 = "has";
  else
    v4 = "does not have";
  fprintf(*(FILE **)(a1 + 16), "\tIt %s automatic margins\n", v4);
  v5 = *(_DWORD *)(a1 + 160);
  if ((v5 & 0x80) != 0)
  {
    if ((v5 & 0x100) != 0)
      v6 = "has";
    else
      v6 = "does not have";
    fprintf(*(FILE **)(a1 + 16), "\tIt %s magic margins\n", v6);
  }
  v7 = *(__int32 ***)(a1 + 184);
  v8 = "al";
  v9 = off_24C1B55A8;
  do
  {
    v10 = *v7;
    if (*v7 && *(_BYTE *)v10)
    {
      v11 = sub_20953ED48(v10, a1 + 1264);
      v12 = sub_20953EF34((unsigned int *)v11);
      v13 = (const char *)sub_20953EC14(v12, a1 + 1264);
    }
    else
    {
      v13 = "(empty)";
    }
    fprintf(*(FILE **)(a1 + 16), "\t%25s (%s) == %s\n", *(v9 - 1), v8, v13);
    ++v7;
    v14 = *v9;
    v9 += 2;
    v8 = v14;
  }
  while (v14);
  fputc(10, *(FILE **)(a1 + 16));
  return 0;
}

uint64_t sub_20953BBE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int32 *v5;
  unsigned __int32 *v6;
  unsigned __int32 *v7;
  char **v8;
  const char *v9;
  const char *v10;
  const char *v11;
  char **v12;
  char *v13;
  int v14;
  uint64_t result;
  int v16;
  _DWORD *v17;
  char *__endptr;
  char __str[8];
  char __dst[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *(unsigned __int32 **)(a3 + 8);
    if (v5)
    {
      if (*(_QWORD *)(a3 + 16))
      {
        v6 = sub_20953EC14(v5, a1 + 1264);
        strncpy(__dst, (const char *)v6, 8uLL);
        __dst[7] = 0;
        v7 = sub_20953EC14(*(unsigned __int32 **)(a3 + 16), a1 + 1264);
        strncpy(__str, (const char *)v7, 8uLL);
        __str[7] = 0;
        v8 = off_24C1B5598;
        v9 = "al";
        do
        {
          if (!strcmp(v9, __dst))
          {
            sub_20953ADB8(a1, (uint64_t)v8, __str);
            sub_20953AFBC(a1);
            return 0;
          }
          v10 = v8[2];
          v8 += 2;
          v9 = v10;
        }
        while (v10);
        v11 = "am";
        v12 = off_24C1B5828;
        while (strcmp(v11, __dst))
        {
          v13 = *v12;
          v12 += 2;
          v11 = v13;
          if (!v13)
          {
            __endptr = 0;
            v14 = strtol(__str, &__endptr, 10);
            if (*__endptr)
            {
              return 0xFFFFFFFFLL;
            }
            v16 = v14;
            result = 0;
            v17 = *(_DWORD **)(a1 + 192);
            v17[8] = v16;
            *(_DWORD *)(a1 + 156) = v17[3];
            *(_DWORD *)(a1 + 152) = v17[2];
            return result;
          }
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_20953BD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v3;
  _DWORD *v4;
  uint64_t v6;
  const char *v7;
  uint64_t result;
  uint64_t v9;
  const char *v10;
  void *v11;
  int v12;

  if (!a3)
    return 0xFFFFFFFFLL;
  v3 = *(const char **)(a3 + 8);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = *(_DWORD **)(a3 + 16);
  if (!v4)
    return 0xFFFFFFFFLL;
  v6 = 0;
  v7 = "al";
  do
  {
    result = strcmp(v7, v3);
    if (!(_DWORD)result)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 184) + ((v6 * 8) >> 1));
      goto LABEL_21;
    }
    v7 = off_24C1B5598[v6 + 2];
    v6 += 2;
  }
  while (v7);
  v9 = 0;
  v10 = "am";
  while (strcmp(v10, v3))
  {
    v10 = off_24C1B5818[v9 + 2];
    v9 += 2;
    if (!v10)
      return 0xFFFFFFFFLL;
  }
  v12 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + ((v9 * 8) >> 2));
  if (v9 * 8 && v9 != 2 && v9 != 8 && v9 != 12)
  {
    result = 0;
    *v4 = v12;
    return result;
  }
  result = 0;
  if (v12)
    v11 = &unk_25459AC60;
  else
    v11 = &unk_25459AC64;
LABEL_21:
  *(_QWORD *)v4 = v11;
  return result;
}

uint64_t sub_20953BE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  unsigned __int32 *v13;
  unsigned __int32 *v14;
  char *v15;
  FILE *v16;
  FILE *v17;
  int v18;
  int v19;
  char *v20;
  uint64_t v21;
  unsigned int v22;
  char v23;
  int v26;
  _DWORD *v27;
  const __int32 *v28;
  uint64_t v29;
  _DWORD *v30;
  char *v31;
  const __int32 *v32;
  uint64_t v33;
  int v34;
  const __int32 *v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  int v39;
  FILE *v40;
  char *v41;
  char *v42;
  __int32 *v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = &v44;
  if (!a3)
    return 0xFFFFFFFFLL;
  v5 = a3 + 8;
  result = *(_QWORD *)(a3 + 8);
  if (!result)
    return 0xFFFFFFFFLL;
  v43 = 0;
  if (*(_DWORD *)result == 45)
  {
    v6 = *(_DWORD *)(result + 4);
    v7 = v6 != 115 && v6 == 118;
    v8 = v6 == 115;
    v10 = *(_QWORD *)(a3 + 16);
    v9 = a3 + 16;
    result = v10;
    if (!v10)
      return result;
    v5 = v9;
    if (!*(_DWORD *)result)
      return 0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
    if (!*(_DWORD *)result)
      return 0;
  }
  if (!wcscmp((const __int32 *)result, dword_209542468))
  {
    v16 = *(FILE **)(a1 + 16);
LABEL_27:
    fprintf(v16, "%s\n");
    return 0;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_20954247C))
  {
    v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_209542490))
  {
    v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_20954249C))
  {
    v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_2095424A8))
  {
    v17 = *(FILE **)(a1 + 16);
    goto LABEL_31;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_2095424BC) || !wcscmp(*(const __int32 **)v5, dword_2095424D0))
  {
    v17 = *(FILE **)(a1 + 16);
LABEL_31:
    fprintf(v17, "%d\n");
    return 0;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_2095424E8))
  {
    v17 = *(FILE **)(a1 + 16);
    goto LABEL_31;
  }
  v11 = 0;
  v12 = "al";
  while (1)
  {
    v13 = sub_20953EC14(*(unsigned __int32 **)v5, a1 + 1264);
    if (!strcmp(v12, (const char *)v13))
      break;
    v12 = off_24C1B5598[v11 + 2];
    v11 += 2;
    if (!v12)
    {
      v14 = sub_20953EC14(*(unsigned __int32 **)v5, a1 + 1264);
      v15 = tgetstr((char *)v14, &v42);
      goto LABEL_34;
    }
  }
  v15 = *(char **)(*(_QWORD *)(a1 + 184) + ((v11 * 8) >> 1));
LABEL_34:
  if (!v15 || (v18 = *v15, !*v15))
  {
    if (!v8)
    return 0xFFFFFFFFLL;
  }
  v19 = 0;
  v41 = v15;
  v20 = v15;
  while (v18 == 37)
  {
    v22 = *++v20;
    v21 = v22;
    v23 = v22 - 37;
    if (v22 - 37 > 0x3F)
      goto LABEL_44;
    if (((1 << v23) & 0x8000000000006240) != 0)
    {
      ++v19;
      goto LABEL_52;
    }
    if (((1 << v23) & 0xA2000001) == 0)
    {
LABEL_44:
      if (((v21 - 105) > 9 || ((1 << (v21 - 105)) & 0x221) == 0) && v7)
    }
LABEL_52:
    v26 = *++v20;
    v18 = v26;
  }
  if (v18)
    goto LABEL_52;
  if (v19 == 2)
  {
LABEL_71:
    v32 = *(const __int32 **)(v5 + 8);
    if (v32 && *v32)
    {
      v33 = wcstol(v32, &v43, 10);
      if (*v43 || (v34 = v33, v33 < 0))
      {
        if (!v8)
        return 0xFFFFFFFFLL;
      }
      v35 = *(const __int32 **)(v5 + 16);
      if (v35)
      {
        if (*v35)
        {
          v36 = wcstol(v35, &v43, 10);
          if (!*v43 && (v36 & 0x8000000000000000) == 0)
          {
            v37 = v36;
            v38 = *(_DWORD **)(v5 + 24);
            if (!v38 || !*v38)
            {
              v31 = tgoto(v41, v34, v36);
              qword_25459BA80 = *(_QWORD *)(a1 + 16);
              v39 = v37;
              goto LABEL_86;
            }
            goto LABEL_60;
          }
          if (v8)
            return 0xFFFFFFFFLL;
          v40 = *(FILE **)(a1 + 24);
          goto LABEL_95;
        }
      }
    }
    goto LABEL_82;
  }
  if (v19 == 1)
  {
    v28 = *(const __int32 **)(v5 + 8);
    if (v28 && *v28)
    {
      v29 = wcstol(v28, &v43, 10);
      if (!*v43 && (v29 & 0x8000000000000000) == 0)
      {
        v30 = *(_DWORD **)(v5 + 16);
        if (!v30 || !*v30)
        {
          v31 = tgoto(v41, 0, v29);
          qword_25459BA80 = *(_QWORD *)(a1 + 16);
          goto LABEL_85;
        }
LABEL_60:
        if (!v8)
        return 0xFFFFFFFFLL;
      }
      if (v8)
        return 0xFFFFFFFFLL;
      v40 = *(FILE **)(a1 + 24);
LABEL_95:
      return 0xFFFFFFFFLL;
    }
LABEL_82:
    if (!v8)
      fwrite("echotc: Warning: Missing argument.\n", 0x23uLL, 1uLL, *(FILE **)(a1 + 24));
    return 0xFFFFFFFFLL;
  }
  if (v19)
  {
    if (v7)
      fprintf(*(FILE **)(a1 + 24), "echotc: Warning: Too many required arguments (%d).\n", v19);
    goto LABEL_71;
  }
  v27 = *(_DWORD **)(v5 + 8);
  if (v27 && *v27)
    goto LABEL_60;
  qword_25459BA80 = *(_QWORD *)(a1 + 16);
  v31 = v41;
LABEL_85:
  v39 = 1;
LABEL_86:
  tputs(v31, v39, (int (__cdecl *)(int))sub_20953C3E4);
  return 0;
}

uint64_t sub_20953C3E4(int a1)
{
  if (qword_25459BA80)
    return fputc(a1, (FILE *)qword_25459BA80);
  else
    return 0xFFFFFFFFLL;
}

TokenizerW *__cdecl tok_winit(const __int32 *a1)
{
  char *v2;
  const __int32 *v3;
  __int32 *v4;
  _QWORD *v5;
  char *v6;

  v2 = (char *)malloc_type_malloc(0x48uLL, 0x1090040E7945993uLL);
  if (v2)
  {
    if (a1)
      v3 = a1;
    else
      v3 = (const __int32 *)&unk_209542680;
    v4 = sub_20953FB74(v3);
    *(_QWORD *)v2 = v4;
    if (v4)
    {
      *(_OWORD *)(v2 + 8) = xmmword_209542650;
      v5 = malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
      *((_QWORD *)v2 + 3) = v5;
      if (v5)
      {
        *v5 = 0;
        v6 = (char *)malloc_type_malloc(0x50uLL, 0x100004052888210uLL);
        *((_QWORD *)v2 + 7) = v6;
        if (v6)
        {
          *((_QWORD *)v2 + 5) = v6 + 80;
          *((_QWORD *)v2 + 6) = v6;
          *((_QWORD *)v2 + 4) = v6;
          *((_QWORD *)v2 + 8) = 0;
          return (TokenizerW *)v2;
        }
        free(*((void **)v2 + 3));
      }
      free(*(void **)v2);
    }
    free(v2);
    return 0;
  }
  return (TokenizerW *)v2;
}

void tok_wreset(TokenizerW *a1)
{
  uint64_t v1;

  *((_QWORD *)a1 + 1) = 0;
  v1 = *((_QWORD *)a1 + 7);
  *((_QWORD *)a1 + 6) = v1;
  *((_QWORD *)a1 + 4) = v1;
  *((_QWORD *)a1 + 8) = 0;
}

void tok_wend(TokenizerW *a1)
{
  free(*(void **)a1);
  free(*((void **)a1 + 7));
  free(*((void **)a1 + 3));
  free(a1);
}

int tok_wline(TokenizerW *a1, const LineInfoW *a2, int *a3, const __int32 ***a4, int *a5, int *a6)
{
  const __int32 *buffer;
  int v9;
  uint64_t v10;
  const __int32 *v11;
  __int32 v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int result;
  int v20;
  __int32 *v21;
  _DWORD *v22;
  __int32 *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _DWORD *v34;
  __int32 v35;
  int v36;
  int *v37;
  const __int32 ***v38;
  int *v39;
  int *v40;

  buffer = a2->buffer;
  v9 = -1;
  LODWORD(v10) = -1;
  while (1)
  {
    if (buffer >= a2->lastchar)
      v11 = (const __int32 *)&unk_209542690;
    else
      v11 = buffer;
    if (v11 == a2->cursor)
    {
      v9 = *((_DWORD *)a1 + 2);
      v10 = (*((_QWORD *)a1 + 4) - *((_QWORD *)a1 + 6)) >> 2;
    }
    v12 = *v11;
    if (*v11 <= 33)
      break;
    if (v12 == 34)
    {
      v17 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
      switch(v17)
      {
        case 0:
          goto LABEL_31;
        case 1:
          goto LABEL_27;
        case 2:
          goto LABEL_35;
        case 3:
LABEL_26:
          *((_DWORD *)a1 + 16) = 0;
          goto LABEL_27;
        case 4:
LABEL_25:
          *((_DWORD *)a1 + 16) = 2;
          goto LABEL_27;
        default:
          return -1;
      }
    }
    if (v12 != 92)
    {
      if (v12 == 39)
      {
        v13 = *((_DWORD *)a1 + 16);
        *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
        switch(v13)
        {
          case 0:
            v14 = 1;
            goto LABEL_33;
          case 1:
            goto LABEL_35;
          case 2:
            goto LABEL_27;
          case 3:
            goto LABEL_26;
          case 4:
            goto LABEL_25;
          default:
            return -1;
        }
      }
      goto LABEL_22;
    }
    v18 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
    switch(v18)
    {
      case 0:
        v14 = 3;
        break;
      case 1:
        goto LABEL_27;
      case 2:
        v14 = 4;
        break;
      case 3:
        v23 = (__int32 *)*((_QWORD *)a1 + 4);
        *v23 = *v11;
        *((_QWORD *)a1 + 4) = v23 + 1;
        goto LABEL_35;
      case 4:
        goto LABEL_25;
      default:
        return -1;
    }
LABEL_33:
    *((_DWORD *)a1 + 16) = v14;
LABEL_36:
    v24 = *((_QWORD *)a1 + 5);
    if (*((_QWORD *)a1 + 4) >= (unint64_t)(v24 - 16))
    {
      v25 = (void *)*((_QWORD *)a1 + 7);
      v26 = ((v24 - (uint64_t)v25) >> 2) + 20;
      v27 = (char *)malloc_type_realloc(v25, 4 * v26, 0x100004052888210uLL);
      if (!v27)
        return -1;
      v28 = (char *)*((_QWORD *)a1 + 7);
      if (v27 != v28)
      {
        v29 = *((_QWORD *)a1 + 1);
        if (v29)
        {
          for (i = 0; i != v29; ++i)
            *(_QWORD *)(*((_QWORD *)a1 + 3) + 8 * i) = &v27[*(_QWORD *)(*((_QWORD *)a1 + 3) + 8 * i)
                                                          - *((_QWORD *)a1 + 7)];
          v28 = (char *)*((_QWORD *)a1 + 7);
        }
        *((_QWORD *)a1 + 4) = &v27[*((_QWORD *)a1 + 4) - (_QWORD)v28];
        *((_QWORD *)a1 + 6) = &v27[*((_QWORD *)a1 + 6) - (_QWORD)v28];
        *((_QWORD *)a1 + 7) = v27;
      }
      *((_QWORD *)a1 + 5) = &v27[4 * v26];
    }
    v31 = *((_QWORD *)a1 + 2);
    if (*((_QWORD *)a1 + 1) >= (unint64_t)(v31 - 4))
    {
      v32 = v31 + 10;
      *((_QWORD *)a1 + 2) = v32;
      v33 = malloc_type_realloc(*((void **)a1 + 3), 8 * v32, 0x10040436913F5uLL);
      if (!v33)
        return -1;
      *((_QWORD *)a1 + 3) = v33;
    }
    buffer = v11 + 1;
  }
  if (!v12)
  {
    result = *((_DWORD *)a1 + 16);
    switch(result)
    {
      case 0:
        v36 = *((_DWORD *)a1 + 17);
        if ((v36 & 2) != 0)
        {
          *((_DWORD *)a1 + 17) = v36 & 0xFFFFFFFD;
          return 3;
        }
        else
        {
LABEL_53:
          if (v9 == -1)
          {
            v38 = a4;
            v37 = a3;
            v40 = a5;
            v39 = a6;
            if ((_DWORD)v10 == -1)
            {
              v9 = *((_DWORD *)a1 + 2);
              v10 = (*((_QWORD *)a1 + 4) - *((_QWORD *)a1 + 6)) >> 2;
            }
          }
          else
          {
            v38 = a4;
            v37 = a3;
            v40 = a5;
            v39 = a6;
          }
          if (v40)
            *v40 = v9;
          if (v39)
            *v39 = v10;
          sub_20953C930((uint64_t)a1);
          result = 0;
          *v38 = (const __int32 **)*((_QWORD *)a1 + 3);
          *v37 = *((_QWORD *)a1 + 1);
        }
        return result;
      case 1:
      case 2:
        return result;
      case 3:
        *((_DWORD *)a1 + 16) = 0;
        goto LABEL_29;
      case 4:
        *((_DWORD *)a1 + 16) = 2;
LABEL_29:
        v22 = (_DWORD *)*((_QWORD *)a1 + 4);
        *v22 = 0;
        *((_QWORD *)a1 + 4) = v22 + 1;
        break;
      default:
        return -1;
    }
    goto LABEL_36;
  }
  if (v12 != 10)
  {
LABEL_22:
    v20 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) &= ~2u;
    switch(v20)
    {
      case 0:
        if (!wcschr(*(__int32 **)a1, *v11))
          goto LABEL_27;
        sub_20953C930((uint64_t)a1);
        break;
      case 1:
      case 2:
        goto LABEL_27;
      case 3:
        goto LABEL_26;
      case 4:
        v34 = (_DWORD *)*((_QWORD *)a1 + 4);
        *v34 = 92;
        *((_DWORD *)a1 + 16) = 2;
        v35 = *v11;
        *((_QWORD *)a1 + 4) = v34 + 2;
        v34[1] = v35;
        goto LABEL_36;
      default:
        return -1;
    }
    goto LABEL_36;
  }
  v16 = *((_DWORD *)a1 + 16);
  v15 = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = v15 & 0xFFFFFFFD;
  switch(v16)
  {
    case 0:
      goto LABEL_53;
    case 1:
    case 2:
LABEL_27:
      v21 = (__int32 *)*((_QWORD *)a1 + 4);
      *v21 = *v11;
      *((_QWORD *)a1 + 4) = v21 + 1;
      goto LABEL_36;
    case 3:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_35:
      *((_DWORD *)a1 + 16) = 0;
      goto LABEL_36;
    case 4:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_31:
      *((_DWORD *)a1 + 16) = 2;
      goto LABEL_36;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_20953C930(uint64_t result)
{
  _DWORD *v1;
  int v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_DWORD **)(result + 32);
  *v1 = 0;
  v2 = *(_DWORD *)(result + 68);
  v3 = *(_DWORD **)(result + 48);
  if ((v2 & 1) != 0 || v1 != v3)
  {
    v4 = *(_QWORD *)(result + 24);
    v5 = *(_QWORD *)(result + 8);
    *(_QWORD *)(result + 8) = v5 + 1;
    *(_QWORD *)(v4 + 8 * v5) = v3;
    *(_QWORD *)(*(_QWORD *)(result + 24) + 8 * (v5 + 1)) = 0;
    v6 = *(_QWORD *)(result + 32) + 4;
    *(_QWORD *)(result + 32) = v6;
    *(_QWORD *)(result + 48) = v6;
  }
  *(_DWORD *)(result + 68) = v2 & 0xFFFFFFFE;
  return result;
}

int tok_wstr(TokenizerW *a1, const __int32 *a2, int *a3, const __int32 ***a4)
{
  LineInfoW v8;

  v8.buffer = a2;
  v8.cursor = wcschr((__int32 *)a2, 0);
  v8.lastchar = v8.cursor;
  return tok_wline(a1, &v8, a3, a4, 0, 0);
}

uint64_t sub_20953C9E8(uint64_t a1)
{
  uint64_t result;
  int v3;
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  speed_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t j;
  int v18;
  int v19;

  result = 0;
  *(_OWORD *)(a1 + 392) = *(_OWORD *)&off_24C1B5958;
  *(_OWORD *)(a1 + 408) = xmmword_24C1B5968;
  *(_OWORD *)(a1 + 424) = *(_OWORD *)&off_24C1B5978;
  *(_OWORD *)(a1 + 440) = xmmword_24C1B5988;
  *(_OWORD *)(a1 + 328) = *(_OWORD *)&off_24C1B5918;
  *(_OWORD *)(a1 + 344) = xmmword_24C1B5928;
  *(_OWORD *)(a1 + 360) = *(_OWORD *)&off_24C1B5938;
  *(_OWORD *)(a1 + 376) = xmmword_24C1B5948;
  *(_OWORD *)(a1 + 264) = *(_OWORD *)&off_24C1B58D8;
  *(_OWORD *)(a1 + 280) = xmmword_24C1B58E8;
  *(_OWORD *)(a1 + 296) = *(_OWORD *)&off_24C1B58F8;
  *(_OWORD *)(a1 + 312) = xmmword_24C1B5908;
  *(_OWORD *)(a1 + 216) = xmmword_24C1B58A8;
  *(_BYTE *)(a1 + 844) = -1;
  *(_OWORD *)(a1 + 232) = *(_OWORD *)&off_24C1B58B8;
  *(_OWORD *)(a1 + 248) = xmmword_24C1B58C8;
  *(_OWORD *)(a1 + 488) = xmmword_2095426B8;
  *(_OWORD *)(a1 + 504) = unk_2095426C8;
  *(_OWORD *)(a1 + 515) = unk_2095426D3;
  *(_DWORD *)(a1 + 840) = 0;
  *(_OWORD *)(a1 + 456) = xmmword_209542698;
  *(_OWORD *)(a1 + 472) = unk_2095426A8;
  if ((*(_BYTE *)(a1 + 44) & 4) == 0)
  {
    if (!isatty(*(_DWORD *)(a1 + 36)))
      return 0xFFFFFFFFLL;
    v19 = 0;
    if (ioctl(*(_DWORD *)(a1 + 36), 0x40047477uLL, &v19) < 0)
    {
      v3 = *__error();
      result = 0xFFFFFFFFLL;
      if (v3 != 25)
        return result;
      v19 = -1;
    }
    else if ((v19 & 0x80000000) == 0 && getpgrp() != v19)
    {
      return 0xFFFFFFFFLL;
    }
    v4 = (__int128 *)(a1 + 536);
    result = sub_20953D270(a1, (termios *)(a1 + 536));
    if ((_DWORD)result != -1)
    {
      v5 = *(_OWORD *)(a1 + 568);
      v6 = *(_OWORD *)(a1 + 584);
      *(_OWORD *)(a1 + 712) = v5;
      *(_OWORD *)(a1 + 728) = v6;
      v7 = *(_QWORD *)(a1 + 600);
      *(_QWORD *)(a1 + 744) = v7;
      v9 = *v4;
      v8 = *(_OWORD *)(a1 + 552);
      *(_OWORD *)(a1 + 680) = *v4;
      *(_OWORD *)(a1 + 696) = v8;
      *(_OWORD *)(a1 + 640) = v5;
      *(_OWORD *)(a1 + 656) = v6;
      *(_QWORD *)(a1 + 672) = v7;
      *(_OWORD *)(a1 + 608) = v9;
      *(_OWORD *)(a1 + 624) = v8;
      *(_OWORD *)(a1 + 784) = v5;
      *(_OWORD *)(a1 + 800) = v6;
      *(_OWORD *)(a1 + 752) = v9;
      *(_OWORD *)(a1 + 768) = v8;
      *(_QWORD *)(a1 + 816) = v7;
      v10 = cfgetispeed((const termios *)(a1 + 608));
      if (!v10)
        v10 = cfgetospeed((const termios *)(a1 + 608));
      *(_QWORD *)(a1 + 832) = v10;
      v11 = *(_QWORD *)(a1 + 616);
      *(_DWORD *)(a1 + 824) = (v11 & 4) == 0;
      v12 = *(_QWORD *)(a1 + 624);
      *(_DWORD *)(a1 + 828) = (~*(_DWORD *)(a1 + 624) & 0x300) == 0;
      *(_QWORD *)(a1 + 608) = *(_QWORD *)(a1 + 608) & ~*(_DWORD *)(a1 + 228) | *(unsigned int *)(a1 + 224);
      *(_QWORD *)(a1 + 616) = v11 & ~*(_DWORD *)(a1 + 244) | (unint64_t)*(unsigned int *)(a1 + 240);
      *(_QWORD *)(a1 + 624) = v12 & ~*(_DWORD *)(a1 + 260) | (unint64_t)*(unsigned int *)(a1 + 256);
      *(_QWORD *)(a1 + 632) = *(_QWORD *)(a1 + 632) & ~*(_DWORD *)(a1 + 276) | *(unsigned int *)(a1 + 272);
      if ((*(_BYTE *)(a1 + 777) & 1) != 0)
      {
        sub_20953D2C4((_BYTE *)(a1 + 752), (_BYTE *)(a1 + 506));
        for (i = 0; i != 23; ++i)
        {
          v14 = a1 + i;
          v15 = *(unsigned __int8 *)(a1 + i + 506);
          v16 = *(unsigned __int8 *)(a1 + 844);
          if (v15 != v16 && *(unsigned __int8 *)(v14 + 481) != v16)
            *(_BYTE *)(v14 + 481) = v15;
        }
        for (j = 0; j != 25; ++j)
        {
          v18 = *(unsigned __int8 *)(a1 + j + 506);
          if (v18 != *(unsigned __int8 *)(a1 + 844))
            *(_BYTE *)(a1 + j + 456) = v18;
        }
      }
      sub_20953D358((_BYTE *)(a1 + 608), (_BYTE *)(a1 + 456));
      result = sub_20953CD34(a1, 1, (termios *)(a1 + 608));
      if ((_DWORD)result != -1)
      {
        *(_QWORD *)(a1 + 680) = *(_QWORD *)(a1 + 680) & ~*(_DWORD *)(a1 + 308) | *(unsigned int *)(a1 + 304);
        *(_QWORD *)(a1 + 688) = *(_QWORD *)(a1 + 688) & ~*(_DWORD *)(a1 + 324) | *(unsigned int *)(a1 + 320);
        *(_QWORD *)(a1 + 696) = *(_QWORD *)(a1 + 696) & ~*(_DWORD *)(a1 + 340) | *(unsigned int *)(a1 + 336);
        *(_QWORD *)(a1 + 704) = *(_QWORD *)(a1 + 704) & ~*(_DWORD *)(a1 + 356) | *(unsigned int *)(a1 + 352);
        sub_20953D358((_BYTE *)(a1 + 680), (_BYTE *)(a1 + 481));
        sub_20953CD90(a1, 1);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_20953CD18(uint64_t result)
{
  if ((*(_BYTE *)(result + 44) & 6) == 0)
    return sub_20953CD34(result, 2, (termios *)(result + 536));
  return result;
}

uint64_t sub_20953CD34(uint64_t a1, int a2, termios *a3)
{
  uint64_t v6;

  do
    v6 = tcsetattr(*(_DWORD *)(a1 + 32), a2, a3);
  while ((_DWORD)v6 == -1 && *__error() == 4);
  return v6;
}

uint64_t sub_20953CD90(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE *v11;
  int v12;
  int v13;
  int v14;
  int v15[2];
  int v16[2];
  uint64_t v17;

  v3 = result;
  v17 = *MEMORY[0x24BDAC8D0];
  v15[1] = 0;
  v16[1] = 0;
  v4 = *(_QWORD *)(result + 1056);
  v5 = *(_QWORD *)(result + 1048);
  if (*(_DWORD *)(result + 1096) == 1)
  {
    v6 = (uint64_t *)(result + 1088);
    v7 = *(_QWORD *)(result + 1080);
  }
  else
  {
    v7 = 0;
    v6 = (uint64_t *)(result + 1072);
  }
  v8 = result + 712;
  v9 = *v6;
  v10 = 2;
  v11 = &unk_2095426E4;
  do
  {
    v12 = *(unsigned __int8 *)(v3 + 481 + v10);
    v16[0] = v12;
    v13 = *(unsigned __int8 *)(v8 + *((int *)v11 + 1));
    v15[0] = v13;
    if (a2 || v12 != v13)
    {
      sub_2095322C4(v3, v4, v15);
      *(_BYTE *)(v4 + v15[0]) = *(_BYTE *)(v9 + v15[0]);
      result = sub_2095322C4(v3, v4, v16);
      *(_BYTE *)(v4 + v16[0]) = v11[*(int *)(v3 + 1096) + 8];
      if (v7)
      {
        sub_2095322C4(v3, v5, v15);
        *(_BYTE *)(v5 + v15[0]) = *(_BYTE *)(v7 + v15[0]);
        result = sub_2095322C4(v3, v5, v16);
        *(_BYTE *)(v5 + v16[0]) = v11[*(int *)(v3 + 1096) + 9];
      }
    }
    v14 = *((_DWORD *)v11 + 3);
    v11 += 12;
    v10 = v14;
  }
  while (v14 != -1);
  return result;
}

uint64_t sub_20953CEFC(uint64_t a1)
{
  uint64_t result;
  uint64_t *v3;
  speed_t v4;
  speed_t v5;
  speed_t v6;
  speed_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;

  if ((*(_DWORD *)(a1 + 840) - 1) < 2 || (*(_BYTE *)(a1 + 44) & 6) != 0)
    return 0;
  v3 = (uint64_t *)(a1 + 752);
  result = sub_20953D270(a1, (termios *)(a1 + 752));
  if ((_DWORD)result != -1)
  {
    *(_DWORD *)(a1 + 828) = (~*(_DWORD *)(a1 + 768) & 0x300) == 0;
    v4 = cfgetispeed((const termios *)(a1 + 752));
    if (!v4)
      v4 = cfgetospeed((const termios *)(a1 + 752));
    *(_QWORD *)(a1 + 832) = v4;
    v5 = cfgetispeed((const termios *)(a1 + 608));
    if (!v5)
      v5 = cfgetospeed((const termios *)(a1 + 608));
    v6 = *(_QWORD *)(a1 + 832);
    if (v5 != v6)
      goto LABEL_14;
    v7 = cfgetispeed((const termios *)(a1 + 680));
    if (!v7)
      v7 = cfgetospeed((const termios *)(a1 + 680));
    v6 = *(_QWORD *)(a1 + 832);
    if (v7 != v6)
    {
LABEL_14:
      cfsetispeed((termios *)(a1 + 608), v6);
      cfsetospeed((termios *)(a1 + 608), *(_QWORD *)(a1 + 832));
      cfsetispeed((termios *)(a1 + 680), *(_QWORD *)(a1 + 832));
      cfsetospeed((termios *)(a1 + 680), *(_QWORD *)(a1 + 832));
    }
    v8 = *(_QWORD *)(a1 + 776);
    if ((v8 & 0x100) != 0)
    {
      v9 = *(_QWORD *)(a1 + 768);
      if (v9 != *(_QWORD *)(a1 + 624))
      {
        *(_QWORD *)(a1 + 624) = v9 & ~*(_DWORD *)(a1 + 260) | (unint64_t)*(unsigned int *)(a1 + 256);
        *(_QWORD *)(a1 + 696) = v9 & ~*(_DWORD *)(a1 + 340) | (unint64_t)*(unsigned int *)(a1 + 336);
      }
      if (v8 != *(_QWORD *)(a1 + 632) && v8 != *(_QWORD *)(a1 + 704))
      {
        *(_QWORD *)(a1 + 632) = v8 & ~*(_DWORD *)(a1 + 276) | (unint64_t)*(unsigned int *)(a1 + 272);
        *(_QWORD *)(a1 + 704) = v8 & ~*(_DWORD *)(a1 + 356) | (unint64_t)*(unsigned int *)(a1 + 352);
      }
      v10 = *v3;
      if (*v3 != *(_QWORD *)(a1 + 608) && v10 != *(_QWORD *)(a1 + 680))
      {
        *(_QWORD *)(a1 + 608) = v10 & ~*(_DWORD *)(a1 + 228) | (unint64_t)*(unsigned int *)(a1 + 224);
        *(_QWORD *)(a1 + 680) = v10 & ~*(_DWORD *)(a1 + 308) | (unint64_t)*(unsigned int *)(a1 + 304);
      }
      v11 = *(_QWORD *)(a1 + 760);
      LOBYTE(v12) = v11;
      if (v11 != *(_QWORD *)(a1 + 616))
      {
        v12 = *(_QWORD *)(a1 + 616);
        if (v11 != *(_QWORD *)(a1 + 688))
        {
          v12 = v11 & ~*(_DWORD *)(a1 + 244) | (unint64_t)*(unsigned int *)(a1 + 240);
          *(_QWORD *)(a1 + 616) = v12;
          *(_QWORD *)(a1 + 688) = v11 & ~*(_DWORD *)(a1 + 324) | (unint64_t)*(unsigned int *)(a1 + 320);
        }
      }
      if ((v12 & 4) != 0)
        v13 = 0;
      else
        v13 = (*(_DWORD *)(a1 + 160) >> 3) & 1;
      *(_DWORD *)(a1 + 824) = v13;
      sub_20953D2C4((_BYTE *)(a1 + 752), (_BYTE *)(a1 + 506));
      v14 = 0;
      while (*(unsigned __int8 *)(a1 + v14 + 506) == *(unsigned __int8 *)(a1 + v14 + 456))
      {
        if (++v14 == 25)
          goto LABEL_49;
      }
      v15 = 0;
      v16 = *(_DWORD *)(a1 + 368);
      v17 = *(_DWORD *)(a1 + 372);
      do
      {
        if ((v16 & (1 << v15)) == 0)
        {
          v18 = *(unsigned __int8 *)(a1 + v15 + 506);
          if (v18 != *(unsigned __int8 *)(a1 + v15 + 456))
            *(_BYTE *)(a1 + v15 + 481) = v18;
        }
        if ((v17 & (1 << v15)) != 0)
          *(_BYTE *)(a1 + v15 + 481) = *(_BYTE *)(a1 + 844);
        ++v15;
      }
      while (v15 != 25);
      sub_20953CD90(a1, 0);
      sub_20953D358((_BYTE *)(a1 + 680), (_BYTE *)(a1 + 481));
      v19 = 0;
      v20 = *(_DWORD *)(a1 + 288);
      v21 = *(_DWORD *)(a1 + 292);
      do
      {
        if ((v20 & (1 << v19)) == 0)
        {
          v22 = *(unsigned __int8 *)(a1 + v19 + 506);
          if (v22 != *(unsigned __int8 *)(a1 + v19 + 456))
            *(_BYTE *)(a1 + v19 + 456) = v22;
        }
        if ((v21 & (1 << v19)) != 0)
          *(_BYTE *)(a1 + v19 + 456) = *(_BYTE *)(a1 + 844);
        ++v19;
      }
      while (v19 != 25);
      sub_20953D358((_BYTE *)(a1 + 608), (_BYTE *)(a1 + 456));
    }
LABEL_49:
    result = sub_20953CD34(a1, 1, (termios *)(a1 + 680));
    if ((_DWORD)result != -1)
    {
      result = 0;
      *(_DWORD *)(a1 + 840) = 1;
    }
  }
  return result;
}

uint64_t sub_20953D270(uint64_t a1, termios *a2)
{
  uint64_t v4;

  do
    v4 = tcgetattr(*(_DWORD *)(a1 + 32), a2);
  while ((_DWORD)v4 == -1 && *__error() == 4);
  return v4;
}

_BYTE *sub_20953D2C4(_BYTE *result, _BYTE *a2)
{
  *a2 = result[40];
  a2[1] = result[41];
  a2[2] = result[35];
  a2[3] = result[37];
  a2[4] = result[32];
  a2[5] = result[33];
  a2[6] = result[34];
  a2[10] = result[44];
  a2[11] = result[45];
  a2[12] = result[36];
  a2[13] = result[42];
  a2[14] = result[43];
  a2[15] = result[38];
  a2[16] = result[47];
  a2[17] = result[46];
  a2[18] = result[50];
  a2[23] = result[48];
  a2[24] = result[49];
  return result;
}

_BYTE *sub_20953D358(_BYTE *result, _BYTE *a2)
{
  result[40] = *a2;
  result[41] = a2[1];
  result[35] = a2[2];
  result[37] = a2[3];
  result[32] = a2[4];
  result[33] = a2[5];
  result[34] = a2[6];
  result[44] = a2[10];
  result[45] = a2[11];
  result[36] = a2[12];
  result[42] = a2[13];
  result[43] = a2[14];
  result[38] = a2[15];
  result[47] = a2[16];
  result[46] = a2[17];
  result[50] = a2[18];
  result[48] = a2[23];
  result[49] = a2[24];
  return result;
}

uint64_t sub_20953D3EC(uint64_t a1)
{
  uint64_t result;

  if (!*(_DWORD *)(a1 + 840) || (*(_BYTE *)(a1 + 44) & 6) != 0)
    return 0;
  result = sub_20953CD34(a1, 1, (termios *)(a1 + 608));
  if ((_DWORD)result != -1)
  {
    result = 0;
    *(_DWORD *)(a1 + 840) = 0;
  }
  return result;
}

uint64_t sub_20953D444(uint64_t a1)
{
  uint64_t result;
  __int128 v3;
  __int128 v4;

  if (*(_DWORD *)(a1 + 840) == 2 || (*(_BYTE *)(a1 + 44) & 6) != 0)
    return 0;
  *(_QWORD *)(a1 + 816) = *(_QWORD *)(a1 + 744);
  v3 = *(_OWORD *)(a1 + 696);
  *(_OWORD *)(a1 + 752) = *(_OWORD *)(a1 + 680);
  *(_OWORD *)(a1 + 768) = v3;
  v4 = *(_OWORD *)(a1 + 728);
  *(_OWORD *)(a1 + 784) = *(_OWORD *)(a1 + 712);
  *(_OWORD *)(a1 + 800) = v4;
  *(_QWORD *)(a1 + 752) = *(_QWORD *)(a1 + 752) & ~*(_DWORD *)(a1 + 388) | *(unsigned int *)(a1 + 384);
  *(_QWORD *)(a1 + 760) = *(_QWORD *)(a1 + 760) & ~*(_DWORD *)(a1 + 404) | *(unsigned int *)(a1 + 400);
  *(_QWORD *)(a1 + 768) = *(_QWORD *)(a1 + 768) & ~*(_DWORD *)(a1 + 420) | *(unsigned int *)(a1 + 416);
  *(_QWORD *)(a1 + 776) = *(_QWORD *)(a1 + 776) & ~*(_DWORD *)(a1 + 436) | *(unsigned int *)(a1 + 432);
  result = sub_20953CD34(a1, 1, (termios *)(a1 + 752));
  if ((_DWORD)result != -1)
  {
    result = 0;
    *(_DWORD *)(a1 + 840) = 2;
  }
  return result;
}

uint64_t sub_20953D530(uint64_t a1)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 840) != 2 || (*(_BYTE *)(a1 + 44) & 6) != 0)
    return 0;
  result = sub_20953CD34(a1, 1, (termios *)(a1 + 680));
  if ((_DWORD)result != -1)
  {
    result = 0;
    *(_DWORD *)(a1 + 840) = 1;
  }
  return result;
}

uint64_t sub_20953D590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unsigned __int32 *v6;
  __int32 **v7;
  __int32 *v8;
  __int32 *v9;
  unsigned int v10;
  int v11;
  termios *v12;
  int v13;
  __int32 *v14;
  const char *v15;
  int *v16;
  __int32 v17;
  __int32 *v18;
  unsigned __int32 *v19;
  int8x8_t *v20;
  int v21;
  unsigned int v22;
  __int32 v23;
  cc_t v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  size_t v28;
  size_t v29;
  int v30;
  const char *v31;
  char **v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  size_t v42;
  uint64_t v43;
  size_t v44;
  FILE *v45;
  char *v46;
  uint64_t v47;
  __int32 *v48;
  char __dst[1024];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a1 + 44) & 6) != 0)
    return 0;
  if (!a3)
    return 0xFFFFFFFFLL;
  v47 = a1 + 216;
  v6 = sub_20953EC14(*(unsigned __int32 **)a3, a1 + 1264);
  strncpy(__dst, (const char *)v6, 0x400uLL);
  __dst[1023] = 0;
  v9 = *(__int32 **)(a3 + 8);
  v7 = (__int32 **)(a3 + 8);
  v8 = v9;
  if (!v9)
  {
    v11 = 0;
    v10 = 0;
LABEL_52:
    v28 = 0;
    v29 = 0;
    v30 = -1;
    v31 = "ignbrk";
    v32 = &off_24C1B59A8;
    do
    {
      v33 = *((_DWORD *)v32 - 1);
      if (v33 != v30)
      {
        v34 = (const char *)&unk_209547D1A;
        if (v30 != -1)
          v34 = "\n";
        v35 = v47 + 80 * v10;
        fprintf(*(FILE **)(a1 + 16), "%s%s", v34, *(const char **)(v35 + 16 * v33));
        v29 = strlen(*(const char **)(v35 + 16 * v33));
        v30 = v33;
        v28 = v29;
      }
      if (v30 == -1)
      {
        v41 = 0;
      }
      else
      {
        v36 = v47 + 80 * v10 + 16 * v30;
        v37 = *((_DWORD *)v32 - 2);
        v39 = *(_DWORD *)(v36 + 8);
        v38 = *(_DWORD *)(v36 + 12);
        if ((v37 & v39) != 0)
          v40 = 43;
        else
          v40 = 0;
        if ((v38 & v37) != 0)
          v41 = 45;
        else
          v41 = v40;
      }
      if (v41 | v11)
      {
        v42 = strlen(v31);
        v43 = 1;
        if (v41)
          v43 = 2;
        v44 = v43 + v42;
        v29 += v43 + v42;
        if (v29 >= *(int *)(a1 + 152))
        {
          fprintf(*(FILE **)(a1 + 16), "\n%*s", v28, (const char *)&unk_209547D1A);
          v29 = v44 + v28;
        }
        v45 = *(FILE **)(a1 + 16);
        if (v41)
          fprintf(v45, "%c%s ");
        else
          fprintf(v45, "%s ");
      }
      v46 = *v32;
      v32 += 2;
      v31 = v46;
    }
    while (v46);
    fputc(10, *(FILE **)(a1 + 16));
    return 0;
  }
  v10 = 0;
  v11 = 0;
  v12 = (termios *)(a1 + 608);
  while (*v8 == 45 && !v8[2])
  {
    v13 = v8[1];
    if (v13 > 112)
    {
      if (v13 == 113)
      {
        v10 = 2;
        v12 = (termios *)(a1 + 752);
      }
      else
      {
        if (v13 != 120)
        {
LABEL_75:
          return 0xFFFFFFFFLL;
        }
        v10 = 0;
        v12 = (termios *)(a1 + 608);
      }
    }
    else if (v13 == 97)
    {
      ++v11;
    }
    else
    {
      if (v13 != 100)
        goto LABEL_75;
      v10 = 1;
      v12 = (termios *)(a1 + 680);
    }
    v14 = v7[1];
    ++v7;
    v8 = v14;
    if (!v14)
      goto LABEL_52;
  }
  v15 = "ignbrk";
  v16 = &dword_24C1B59A0;
  while (2)
  {
    v48 = 0;
    v17 = *v8;
    if (*v8 == 45 || v17 == 43)
      ++v8;
    else
      LOBYTE(v17) = 0;
    ++v7;
    v18 = wcschr(v8, 61);
    v48 = v18;
    while (1)
    {
      v19 = sub_20953EC14((unsigned __int32 *)v8, a1 + 1264);
      if (v18)
      {
        if (strncmp(v15, (const char *)v19, v48 - v8))
          goto LABEL_31;
      }
      else if (strcmp(v15, (const char *)v19))
      {
        goto LABEL_31;
      }
      if (!v48)
      {
        if (v17 == 45)
        {
          v26 = v47 + 80 * v10 + 16 * v16[1];
          v27 = *(_DWORD *)(v26 + 12) | *v16;
          *(_DWORD *)(v26 + 8) &= ~*v16;
          *(_DWORD *)(v26 + 12) = v27;
          v15 = "ignbrk";
        }
        else
        {
          v15 = "ignbrk";
          v20 = (int8x8_t *)(v47 + 80 * v10 + 16 * v16[1]);
          if ((char)v17 == 43)
          {
            v21 = v20[1].i32[1] & ~*v16;
            v20[1].i32[0] |= *v16;
            v20[1].i32[1] = v21;
          }
          else
          {
            v20[1] = vand_s8(v20[1], (int8x8_t)vdup_n_s32(~*v16));
          }
        }
        goto LABEL_45;
      }
      if (v16[1] == 4)
        break;
LABEL_31:
      v15 = (const char *)*((_QWORD *)v16 + 1);
      if (!v15)
      {
        return 0xFFFFFFFFLL;
      }
      v18 = v48;
      v16 += 4;
    }
    v22 = *v16;
    v23 = v48[1];
    ++v48;
    if (v23)
      v24 = sub_20953373C(&v48);
    else
      v24 = *(_BYTE *)(a1 + 844);
    v15 = "ignbrk";
    if (!v22)
      sub_2095411F8();
    v25 = __clz(__rbit32(v22));
    if (v25 >= 0x19 || ((0x187FC7Fu >> v25) & 1) == 0)
      sub_209541220();
    v12->c_cc[qword_209542738[v25]] = v24;
LABEL_45:
    v16 = &dword_24C1B59A0;
    v8 = *v7;
    if (*v7)
      continue;
    break;
  }
  if (*(_DWORD *)(a1 + 840) != v10)
    return 0;
  result = sub_20953CD34(a1, 1, v12);
  if ((_DWORD)result != -1)
    return 0;
  return result;
}

uint64_t sub_20953DA74(uint64_t a1)
{
  return sub_20953DA7C(a1, 0);
}

uint64_t sub_20953DA7C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  size_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 944);
  v3 = *(_QWORD *)(a1 + 936);
  if (v3)
    v4 = v2 == v3;
  else
    v4 = 1;
  if (v4)
    return 6;
  v7 = v2 - v3;
  v8 = (v2 - v3) >> 2;
  sub_20952C8EC(a1);
  if (!a2)
  {
    v9 = *(_QWORD *)(a1 + 96);
    if (v9 < *(_QWORD *)(a1 + 104))
      *(_QWORD *)(a1 + 96) = v9 + 4;
  }
  sub_20952C998(a1, v7 >> 2);
  v10 = *(void **)(a1 + 96);
  if ((unint64_t)v10 + 4 * v8 > *(_QWORD *)(a1 + 104))
    return 6;
  memcpy(v10, *(const void **)(a1 + 936), v7);
  return 4;
}

uint64_t sub_20953DB10(uint64_t a1)
{
  return sub_20953DA7C(a1, 1);
}

uint64_t sub_20953DB18(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 88);
  if (v2 == v3)
    return 6;
  *(_QWORD *)(a1 + 96) = sub_20952D094(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(_QWORD))sub_20952CE80);
  if (!*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953DB7C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 88);
  if (v2 == v3)
    return 6;
  *(_QWORD *)(a1 + 96) = sub_20952D094(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(_QWORD))sub_20952CDFC);
  if (!*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953DBE0(uint64_t a1)
{
  unsigned int *v1;
  unint64_t v2;

  v1 = *(unsigned int **)(a1 + 96);
  v2 = *(_QWORD *)(a1 + 104);
  if ((unint64_t)v1 >= v2 - 4)
    return 6;
  *(_QWORD *)(a1 + 96) = sub_20952CFB4(a1, v1, v2, *(_DWORD *)(a1 + 128), (uint64_t (*)(_QWORD))sub_20952CE80);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953DC50(uint64_t a1)
{
  unsigned int *v1;
  unint64_t v2;

  v1 = *(unsigned int **)(a1 + 96);
  v2 = *(_QWORD *)(a1 + 104);
  if ((unint64_t)v1 >= v2 - 4)
    return 6;
  *(_QWORD *)(a1 + 96) = sub_20952CFB4(a1, v1, v2, *(_DWORD *)(a1 + 128), (uint64_t (*)(_QWORD))sub_20952CDFC);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953DCC0(uint64_t a1)
{
  int v2;
  uint64_t v3;
  __darwin_ct_rune_t *v4;
  uint64_t v5;
  int v6;
  __darwin_ct_rune_t v7;
  __darwin_ct_rune_t *v8;

  if (*(_QWORD *)(a1 + 96) >= *(_QWORD *)(a1 + 104))
    return 6;
  sub_20952C8EC(a1);
  if (*(int *)(a1 + 128) < 1)
    return 0;
  v2 = 0;
  v3 = MEMORY[0x24BDAC740];
  while (1)
  {
    v4 = *(__darwin_ct_rune_t **)(a1 + 96);
    v5 = *v4;
    if (v5 > 0x7F)
    {
      if (__maskrune(*v4, 0x8000uLL))
      {
LABEL_9:
        v7 = __tolower(v5);
        goto LABEL_10;
      }
      if (__maskrune(v5, 0x1000uLL))
        goto LABEL_7;
    }
    else
    {
      v6 = *(_DWORD *)(v3 + 4 * v5 + 60);
      if ((v6 & 0x8000) != 0)
        goto LABEL_9;
      if ((v6 & 0x1000) != 0)
      {
LABEL_7:
        v7 = __toupper(v5);
LABEL_10:
        v8 = *(__darwin_ct_rune_t **)(a1 + 96);
        *v8 = v7;
        goto LABEL_11;
      }
    }
    v8 = *(__darwin_ct_rune_t **)(a1 + 96);
LABEL_11:
    *(_QWORD *)(a1 + 96) = v8 + 1;
    if ((unint64_t)(v8 + 1) >= *(_QWORD *)(a1 + 104))
      break;
    sub_209538B5C(a1);
    if (++v2 >= *(_DWORD *)(a1 + 128))
      return 0;
  }
  *(_QWORD *)(a1 + 96) = v8;
  sub_209538B5C(a1);
  return 0;
}

uint64_t sub_20953DDBC(uint64_t a1)
{
  return sub_20953DDC4(a1, 3);
}

uint64_t sub_20953DDC4(uint64_t a1, int a2)
{
  char v2;
  int v4;
  uint64_t v5;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 1000);
  if (v4)
  {
    if (v4 == a2)
    {
      if ((a2 & 4) == 0)
        sub_20952C8EC(a1);
      sub_20952C960(a1, *(const void **)(a1 + 88), (*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88)) >> 2);
      *(_DWORD *)(a1 + 1000) = 0;
      *(_QWORD *)(a1 + 1008) = 0;
      if ((v2 & 4) == 0)
      {
        v5 = *(_QWORD *)(a1 + 88);
        *(_QWORD *)(a1 + 96) = v5;
        *(_QWORD *)(a1 + 104) = v5;
      }
      if ((v2 & 2) != 0)
        *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
      return 4;
    }
    else
    {
      return 6;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 1008) = *(_QWORD *)(a1 + 96);
    *(_DWORD *)(a1 + 1000) = a2;
    return 3;
  }
}

uint64_t sub_20953DE58(_QWORD *a1)
{
  a1[12] = a1[11];
  sub_20952C8EC((uint64_t)a1);
  a1[133] = a1[132];
  return 5;
}

uint64_t sub_20953DE8C(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 96) >= *(_QWORD *)(a1 + 104))
    return 6;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  *(_DWORD *)(a1 + 120) = 2;
  sub_20952C8EC(a1);
  return 3;
}

uint64_t sub_20953DEC8(uint64_t a1)
{
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  *(_DWORD *)(a1 + 120) = 1;
  sub_20952C8EC(a1);
  return 0;
}

uint64_t sub_20953DEF0(uint64_t a1)
{
  sub_20952CBE8((_QWORD *)a1, *(_DWORD *)(a1 + 128));
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  return 4;
}

uint64_t sub_20953DF20(uint64_t a1)
{
  sub_20952C8EC(a1);
  sub_20952C960(a1, *(const void **)(a1 + 88), (*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88)) >> 2);
  sub_20952F36C((_QWORD *)a1);
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  return 4;
}

uint64_t sub_20953DF70(uint64_t a1)
{
  sub_20952C8EC(a1);
  sub_20952C960(a1, *(const void **)(a1 + 96), (*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 96)) >> 2);
  sub_20952DA14((_QWORD *)a1);
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  return 4;
}

uint64_t sub_20953DFBC(uint64_t a1)
{
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  sub_20952C8EC(a1);
  return 0;
}

uint64_t sub_20953DFDC(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  a1[133] = a1[132];
  v2 = a1[12];
  v1 = a1[13];
  if (v2 >= v1)
  {
    v4 = 0;
  }
  else
  {
    v3 = v2 + 4;
    if (v3 <= v1)
      v1 = v3;
    a1[12] = v1;
    v4 = 5;
  }
  sub_20952C8EC((uint64_t)a1);
  return v4;
}

uint64_t sub_20953E02C(_QWORD *a1)
{
  a1[133] = a1[132];
  a1[12] = a1[13];
  sub_20952C8EC((uint64_t)a1);
  return 5;
}

uint64_t sub_20953E054(uint64_t a1)
{
  return sub_20953DDC4(a1, 1);
}

uint64_t sub_20953E05C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int *v4;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  if (v2 == v3)
    return 6;
  v4 = sub_20952D208(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(_QWORD))sub_20952CE80);
  *(_QWORD *)(a1 + 96) = v4;
  if (!*(_DWORD *)(a1 + 1000))
    return 5;
  *(_QWORD *)(a1 + 96) = v4 + 1;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953E0C8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int *v4;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  if (v2 == v3)
    return 6;
  v4 = sub_20952D208(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(_QWORD))sub_20952CDFC);
  *(_QWORD *)(a1 + 96) = v4;
  if (!*(_DWORD *)(a1 + 1000))
    return 5;
  *(_QWORD *)(a1 + 96) = v4 + 1;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953E134(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 912);
  if (v1 == -1)
    return 6;
  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 912) = (*(_QWORD *)(a1 + 104) - v2) >> 2;
  v5 = *(int *)(a1 + 920);
  *(_DWORD *)(a1 + 920) = (unint64_t)(v3 - v2) >> 2;
  v6 = *(_QWORD *)(a1 + 928);
  *(_QWORD *)(a1 + 928) = v2;
  *(_QWORD *)(a1 + 88) = v6;
  *(_QWORD *)(a1 + 96) = v6 + 4 * v5;
  *(_QWORD *)(a1 + 104) = v6 + 4 * v1;
  *(_QWORD *)(a1 + 112) = v6 + v4 - v2;
  return 4;
}

uint64_t sub_20953E194(uint64_t a1)
{
  unint64_t v1;

  *(_DWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 1008) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1048);
  v1 = *(_QWORD *)(a1 + 96);
  if (v1 > *(_QWORD *)(a1 + 88))
    *(_QWORD *)(a1 + 96) = v1 - 4;
  return 5;
}

uint64_t sub_20953E1C4(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 124))
    return sub_20952DDC4(a1, a2);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
  if (!*(_DWORD *)(a1 + 1000))
    return 5;
  sub_20952D154(a1);
  return 4;
}

uint64_t sub_20953E204(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 96) <= *(_QWORD *)(a1 + 88))
    return 6;
  sub_20952CD58(a1);
  *(_QWORD *)(a1 + 96) -= 4;
  return 4;
}

uint64_t sub_20953E248(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 96);
  if (v2 == *(_QWORD *)(a1 + 104) && v2 == *(_QWORD *)(a1 + 88))
  {
    sub_20953B9A0(a1, a2);
    return 2;
  }
  else
  {
    el_beep_0((EditLine *)a1);
    return 6;
  }
}

uint64_t sub_20953E284(_QWORD *a1)
{
  _DWORD *v2;
  unint64_t v3;
  unint64_t v4;
  int *v5;
  int v6;

  v2 = (_DWORD *)a1[117];
  v3 = a1[11];
  v4 = a1[12];
  if (v3 < v4)
  {
    v5 = (int *)a1[11];
    do
    {
      v6 = *v5++;
      *v2++ = v6;
    }
    while ((unint64_t)v5 < v4);
  }
  a1[118] = v2;
  sub_20952CCA8(a1, (v4 - v3) >> 2);
  a1[12] = a1[11];
  return 4;
}

uint64_t sub_20953E2E4(uint64_t a1)
{
  return sub_209539774(a1, 23);
}

uint64_t sub_20953E2EC(uint64_t a1)
{
  return sub_209539774(a1, 22);
}

uint64_t sub_20953E2F4(size_t a1)
{
  if (*(_QWORD *)(a1 + 1224))
    return sub_209539930(a1, *(_DWORD *)(a1 + 1232));
  else
    return 6;
}

uint64_t sub_20953E30C(size_t a1)
{
  int v1;

  if (!*(_QWORD *)(a1 + 1224))
    return 6;
  if (*(_DWORD *)(a1 + 1232) == 23)
    v1 = 22;
  else
    v1 = 23;
  return sub_209539930(a1, v1);
}

uint64_t sub_20953E330(uint64_t a1)
{
  return sub_209539964((EditLine *)a1, 1, -1, *(_DWORD *)(a1 + 128), 0);
}

uint64_t sub_20953E344(uint64_t a1)
{
  return sub_209539964((EditLine *)a1, -1, -1, *(_DWORD *)(a1 + 128), 0);
}

uint64_t sub_20953E358(uint64_t a1)
{
  return sub_209539964((EditLine *)a1, 1, -1, *(_DWORD *)(a1 + 128), 1);
}

uint64_t sub_20953E36C(uint64_t a1)
{
  return sub_209539964((EditLine *)a1, -1, -1, *(_DWORD *)(a1 + 128), 1);
}

uint64_t sub_20953E380(uint64_t a1)
{
  return sub_209539964((EditLine *)a1, *(_DWORD *)(a1 + 1236), *(_DWORD *)(a1 + 1240), *(_DWORD *)(a1 + 128), *(char *)(a1 + 1244));
}

uint64_t sub_20953E394(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 1236);
  result = sub_209539964((EditLine *)a1, -v2, *(_DWORD *)(a1 + 1240), *(_DWORD *)(a1 + 128), *(char *)(a1 + 1244));
  *(_DWORD *)(a1 + 1236) = v2;
  return result;
}

uint64_t sub_20953E3CC(uint64_t a1)
{
  size_t v2;
  __int32 v3;
  size_t v4;
  __int32 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int32 v16[10];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v16 = xmmword_209542800;
  *(_OWORD *)&v16[3] = *(__int128 *)((char *)&xmmword_209542800 + 12);
  **(_DWORD **)(a1 + 104) = 0;
  v2 = wcscspn(*(const __int32 **)(a1 + 96), v16);
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v2);
  if (v3)
  {
    v4 = v2;
    v5 = wcschr(v16, v3);
    v6 = *(_QWORD *)(a1 + 96) + 4 * v4 + 4;
    v7 = ((unint64_t)((char *)v5 - (char *)v16) >> 2) & 1;
    v8 = 4 - 8 * v7;
    v9 = -8 * v7;
    v10 = 1;
    while (1)
    {
      v11 = (int *)(v6 + v9);
      if ((unint64_t)(v6 + v9) < *(_QWORD *)(a1 + 88) || (unint64_t)v11 >= *(_QWORD *)(a1 + 104))
        break;
      v12 = *v11;
      if (v12 == *(__int32 *)((char *)v16 + ((4 * ((unint64_t)((char *)v5 - (char *)v16) >> 2)) ^ 4)))
        v13 = -1;
      else
        v13 = 0;
      if (v12 == v3)
        v14 = 1;
      else
        v14 = v13;
      v6 += v8;
      v10 += v14;
      if (!v10)
      {
        *(_QWORD *)(a1 + 96) = v6 - 4;
        if (!*(_DWORD *)(a1 + 1000))
          return 5;
        *(_QWORD *)(a1 + 96) = v6;
        sub_20952D154(a1);
        return 4;
      }
    }
  }
  return 6;
}

uint64_t sub_20953E50C(uint64_t a1)
{
  sub_20952C8EC(a1);
  return sub_2095308D8(a1);
}

uint64_t sub_20953E530(uint64_t a1)
{
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
  --*(_DWORD *)(a1 + 128);
  return sub_20952DB68(a1);
}

uint64_t sub_20953E54C(uint64_t a1)
{
  sub_20952C960(a1, *(const void **)(a1 + 96), (*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 96)) >> 2);
  return 4;
}

uint64_t sub_20953E570(uint64_t a1)
{
  return sub_20953DDC4(a1, 4);
}

uint64_t sub_20953E578(uint64_t a1)
{
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
  sub_20952C998(a1, 1);
  **(_DWORD **)(a1 + 96) = 35;
  sub_209537D30(a1);
  return sub_20952DE6C(a1);
}

uint64_t sub_20953E5C0()
{
  return 6;
}

uint64_t sub_20953E5C8(uint64_t a1)
{
  int v2;
  uint64_t result;
  int v4;

  v2 = *(_DWORD *)(a1 + 1176);
  if (!v2)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(_QWORD *)(a1 + 1168) = *(_QWORD *)(a1 + 1152) + *(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 88);
  }
  if (!*(_DWORD *)(a1 + 124))
  {
    *(_DWORD *)(a1 + 1176) = 0x7FFFFFFF;
    sub_2095308D8(a1);
    goto LABEL_8;
  }
  *(_DWORD *)(a1 + 1176) = 1;
  result = sub_2095308D8(a1);
  if ((_DWORD)result == 6)
    return result;
  v4 = *(_DWORD *)(a1 + 1200) - *(_DWORD *)(a1 + 128) + 1;
  *(_DWORD *)(a1 + 1176) = v4;
  if (v4 >= 0)
  {
LABEL_8:
    result = sub_2095308D8(a1);
    if ((_DWORD)result != 6)
      return result;
  }
  *(_DWORD *)(a1 + 1176) = v2;
  return 6;
}

uint64_t sub_20953E678(uint64_t a1)
{
  uint64_t result;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  __int32 *v9;
  __int32 *v10;
  size_t v11;
  size_t v12;
  pid_t v13;
  pid_t v14;
  ssize_t v15;
  __int32 *v16;
  size_t v17;
  int v18;
  char v19[40];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  strcpy(v19, "/tmp/histedit.XXXXXXXXXX");
  if (*(_DWORD *)(a1 + 124))
  {
    result = sub_20953E5C8(a1);
    if ((_DWORD)result == 6)
      return result;
  }
  v18 = 0;
  v3 = mkstemp(v19);
  if (v3 < 0)
    return 6;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = malloc_type_malloc(0x1800uLL, 0x100004077774924uLL);
  if (!v7)
  {
    v10 = 0;
LABEL_15:
    free(v10);
    free(v7);
    close(v4);
    unlink(v19);
    return 6;
  }
  v8 = v5 - v6;
  v9 = (__int32 *)malloc_type_malloc(v8 + 1, 0x5D7951AAuLL);
  v10 = v9;
  if (!v9)
    goto LABEL_15;
  v11 = v8 >> 2;
  wcsncpy(v9, *(const __int32 **)(a1 + 88), v11);
  v10[v11] = 0;
  wcstombs(v7, v10, 0x17FFuLL);
  v7[6143] = 0;
  v12 = strlen(v7);
  write(v4, v7, v12);
  write(v4, "\n", 1uLL);
  v13 = fork();
  if (v13 == -1)
    goto LABEL_15;
  v14 = v13;
  if (!v13)
  {
    close(v4);
    execlp("vi", "vi", v19, 0);
    exit(0);
  }
  while (waitpid(v14, &v18, 0) != v14)
    ;
  lseek(v4, 0, 0);
  v15 = read(v4, v7, 0x1800uLL);
  v16 = *(__int32 **)(a1 + 88);
  if (v15 < 1)
  {
    v17 = 0;
  }
  else
  {
    v17 = mbstowcs(v16, v7, (uint64_t)(*(_QWORD *)(a1 + 104) - (_QWORD)v16) >> 2);
    v16 = *(__int32 **)(a1 + 88);
    if (v17)
    {
      if (v16[v17 - 1] == 10)
        --v17;
    }
  }
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = &v16[v17];
  free(v7);
  free(v10);
  close(v4);
  unlink(v19);
  return sub_20952DE6C(a1);
}

uint64_t sub_20953E8D8(uint64_t a1)
{
  __int32 *v2;
  __int32 *v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int *v6;
  __int32 *v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unint64_t v13;
  _DWORD *v14;
  unint64_t v15;
  unint64_t v16;

  if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
  {
    v2 = sub_209530A9C(a1, 3);
    if (!v2)
      return 6;
  }
  else
  {
    if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(a1 + 1192))(*(_QWORD *)(a1 + 1184), a1 + 1200, 3) == -1)
      return 6;
    v2 = *(__int32 **)(a1 + 1208);
    if (!v2)
      return 6;
  }
  v3 = 0;
  v4 = 0;
  v5 = MEMORY[0x24BDAC740];
  while (1)
  {
    v6 = v4;
    v4 = (unsigned int *)(v2 - 1);
    do
    {
      v7 = v2;
      v8 = v4[1];
      if (v8 > 0x7F)
        v9 = __maskrune(v8, 0x4000uLL);
      else
        v9 = *(_DWORD *)(v5 + 4 * v8 + 60) & 0x4000;
      ++v2;
      ++v4;
    }
    while (v9);
    v10 = *v4;
    v2 = v3;
    if (!*v4)
    {
LABEL_22:
      if (!v6)
        return 6;
      goto LABEL_23;
    }
    v2 = (__int32 *)v4;
    do
    {
      if (v10 > 0x7F)
      {
        if (__maskrune(v10, 0x4000uLL))
          break;
      }
      else if ((*(_DWORD *)(v5 + 4 * v10 + 60) & 0x4000) != 0)
      {
        break;
      }
      v11 = v2[1];
      ++v2;
      v10 = v11;
    }
    while (v11);
    if (*(_DWORD *)(a1 + 124))
    {
      v12 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v12 - 1;
      if (v12 < 2)
        break;
    }
    v3 = v2;
    v6 = v4;
    if (!*v2)
      goto LABEL_22;
  }
  v6 = (unsigned int *)v7;
  if (!v7)
    return 6;
LABEL_23:
  if (*(_DWORD *)(a1 + 124) && *(_DWORD *)(a1 + 128))
    return 6;
  sub_20952C8EC(a1);
  v13 = *(_QWORD *)(a1 + 96);
  if (v13 < *(_QWORD *)(a1 + 104))
    *(_QWORD *)(a1 + 96) = v13 + 4;
  sub_20952C998(a1, ((unint64_t)((char *)v2 - (char *)v6) >> 2) + 1);
  v14 = *(_DWORD **)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 112);
  if ((unint64_t)v14 < v15)
    *v14++ = 32;
  if (v6 < (unsigned int *)v2 && (unint64_t)v14 < v15)
  {
    v16 = (unint64_t)(v6 + 1);
    do
    {
      *v14++ = *(_DWORD *)(v16 - 4);
      if (v16 >= (unint64_t)v2)
        break;
      v16 += 4;
    }
    while ((unint64_t)v14 < v15);
  }
  *(_QWORD *)(a1 + 96) = v14;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a1 + 1056);
  return 4;
}

uint64_t sub_20953EAC4(EditLine *a1)
{
  int v2;
  const __int32 *v3;
  const __int32 *v4;
  unint64_t v5;
  uint64_t v6;

  if (!*((_DWORD *)a1 + 31))
  {
    v2 = *((_DWORD *)a1 + 248);
    if (v2)
    {
      *((_DWORD *)a1 + 31) = 1;
      *((_DWORD *)a1 + 32) = v2;
    }
  }
  *((_QWORD *)a1 + 126) = *((_QWORD *)a1 + 12);
  *((_DWORD *)a1 + 250) = *((_DWORD *)a1 + 249);
  v3 = (const __int32 *)*((_QWORD *)a1 + 121);
  v4 = (const __int32 *)*((_QWORD *)a1 + 120);
  if (v3 != v4)
  {
    v5 = *((_QWORD *)a1 + 122);
    if ((unint64_t)(v3 + 1) > v5)
    {
      v3 = (const __int32 *)(v5 - 4);
      *((_QWORD *)a1 + 121) = v5 - 4;
    }
    *v3 = 0;
    el_wpush(a1, v4);
  }
  v6 = *((unsigned __int8 *)a1 + 984);
  *((_BYTE *)a1 + 137) = v6;
  *((_DWORD *)a1 + 35) = *((_DWORD *)a1 + 247);
  return (*(uint64_t (**)(EditLine *))(*((_QWORD *)a1 + 139) + 8 * v6))(a1);
}

uint64_t (**sub_20953EB58())()
{
  return off_24C1B51E8;
}

_UNKNOWN **sub_20953EB64()
{
  return &off_24C1B5E38;
}

void **sub_20953EB70(void **result, size_t a2, unint64_t a3)
{
  void **v4;

  v4 = result;
  if ((unint64_t)result[1] < a2)
  {
    result[1] = (void *)a2;
    result = (void **)malloc_type_realloc(*result, a2, 0x100004077774924uLL);
    if (!result)
    {
      v4[1] = 0;
      free(*v4);
      result = 0;
    }
    *v4 = result;
  }
  if ((unint64_t)v4[3] < a3)
  {
    v4[3] = (void *)a3;
    result = (void **)malloc_type_realloc(v4[2], 4 * a3, 0x100004052888210uLL);
    if (!result)
    {
      v4[3] = 0;
      free(v4[2]);
      result = 0;
    }
    v4[2] = result;
  }
  return result;
}

unsigned __int32 *sub_20953EC14(unsigned __int32 *result, uint64_t a2)
{
  unsigned __int32 *v3;
  char *v4;
  unsigned __int32 v5;
  unsigned __int32 *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unsigned __int32 v10;

  if (result)
  {
    v3 = result;
    v4 = *(char **)a2;
    if (*(_QWORD *)a2 || (sub_20953EB70((void **)a2, 0x400uLL, 0), (v4 = *(char **)a2) != 0))
    {
      v5 = *v3;
      if (*v3)
      {
        v6 = v3 + 1;
        do
        {
          v7 = *(_QWORD *)(a2 + 8);
          v8 = &v4[-*(_QWORD *)a2];
          if (v7 - (uint64_t)v8 <= 4)
          {
            sub_20953EB70((void **)a2, v7 + 1024, 0);
            if (!*(_QWORD *)a2)
              return 0;
            v4 = &v8[*(_QWORD *)a2];
            v5 = *(v6 - 1);
          }
          v9 = sub_20953ECD4(v4, 5uLL, v5);
          if (v9 == -1)
            abort();
          v4 += v9;
          v10 = *v6++;
          v5 = v10;
        }
        while (v10);
      }
      *v4 = 0;
      return *(unsigned __int32 **)a2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_20953ECD4(char *a1, unint64_t a2, unsigned __int32 a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = 1;
  v4 = 2;
  v5 = 3;
  if (a3 >= 0x10000)
    v5 = 4 * (a3 < 0x110000);
  if (a3 >= 0x800)
    v4 = v5;
  if ((int)a3 >= 128)
    v3 = v4;
  if (v3 > a2)
    return -1;
  LODWORD(result) = wctomb(a1, a3);
  if ((result & 0x80000000) == 0)
    return result;
  wctomb(0, 0);
  return 0;
}

__int32 *sub_20953ED48(__int32 *result, uint64_t a2)
{
  const char *v3;
  size_t v4;

  if (result)
  {
    v3 = (const char *)result;
    if ((*(_QWORD *)(a2 + 16) || (sub_20953EB70((void **)a2, 0, 0x400uLL), *(_QWORD *)(a2 + 16)))
      && (v4 = mbstowcs(0, v3, 0), v4 != -1))
    {
      if (v4 > *(_QWORD *)(a2 + 24))
        sub_20953EB70((void **)a2, 0, v4 + 1);
      result = *(__int32 **)(a2 + 16);
      if (result)
      {
        mbstowcs(result, v3, *(_QWORD *)(a2 + 24));
        return *(__int32 **)(a2 + 16);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_QWORD *sub_20953EDE0(int a1, const char **a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  const char **v8;
  size_t v9;
  _QWORD *v10;
  unint64_t v11;
  __int32 *v12;
  uint64_t v13;
  size_t v14;

  if (a1 < 1)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = a1;
    v8 = a2;
    do
    {
      if (*v8)
        v9 = strlen(*v8) + 1;
      else
        v9 = 0;
      v6 += v9;
      ++v8;
      --v7;
    }
    while (v7);
  }
  sub_20953EB70((void **)a3, 0, v6);
  if (!*(_QWORD *)(a3 + 24))
    return 0;
  v10 = malloc_type_malloc(8 * (a1 + 1), 0x10040436913F5uLL);
  v10[a1] = 0;
  if (a1 >= 1)
  {
    v11 = 0;
    v12 = *(__int32 **)(a3 + 16);
    v13 = 8 * a1;
    do
    {
      if (a2[v11 / 8])
      {
        v10[v11 / 8] = v12;
        v14 = mbstowcs(v12, a2[v11 / 8], v6);
        if (v14 == -1)
        {
          free(v10);
          return 0;
        }
        v6 -= v14 + 1;
        v12 += v14 + 1;
      }
      else
      {
        v10[v11 / 8] = 0;
      }
      v11 += 8;
    }
    while (v13 != v11);
  }
  return v10;
}

uint64_t sub_20953EF00(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 2;
  v2 = 3;
  if (a1 >= 0x10000)
    v2 = 4 * (a1 < 0x110000);
  if (a1 >= 0x800)
    v1 = v2;
  if ((int)a1 >= 128)
    return v1;
  else
    return 1;
}

unsigned int *sub_20953EF34(unsigned int *result)
{
  unsigned int *v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    v2 = (char *)qword_25459BA88;
    if (!qword_25459BA88)
    {
      qword_25459BA90 = 1024;
      v2 = (char *)malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
      qword_25459BA88 = (uint64_t)v2;
    }
    v3 = *v1;
    if ((_DWORD)v3)
    {
      do
      {
        result = (unsigned int *)qword_25459BA88;
        while (1)
        {
          v4 = sub_20953F080(v2, qword_25459BA90 - ((v2 - (char *)result) >> 2), v3);
          if (v4 != -1)
            break;
          v5 = qword_25459BA88;
          qword_25459BA90 += 1024;
          result = (unsigned int *)malloc_type_realloc((void *)qword_25459BA88, 4 * qword_25459BA90, 0x100004052888210uLL);
          if (!result)
            goto LABEL_17;
          qword_25459BA88 = (uint64_t)result;
          v2 = &v2[(_QWORD)result - v5];
          v3 = *v1;
          if (!(_DWORD)v3)
            goto LABEL_13;
        }
        v6 = v1[1];
        ++v1;
        v3 = v6;
        v2 += 4 * v4;
      }
      while (v6);
      result = (unsigned int *)qword_25459BA88;
    }
    else
    {
      result = (unsigned int *)v2;
    }
LABEL_13:
    v7 = qword_25459BA90;
    if (v2 < (char *)&result[qword_25459BA90])
      goto LABEL_16;
    ++qword_25459BA90;
    result = (unsigned int *)malloc_type_realloc(result, 4 * (v7 + 1), 0x100004052888210uLL);
    if (result)
    {
      qword_25459BA88 = (uint64_t)result;
      v2 = (char *)&result[qword_25459BA90 - 1];
LABEL_16:
      *(_DWORD *)v2 = 0;
      return result;
    }
LABEL_17:
    free((void *)qword_25459BA88);
    result = 0;
    qword_25459BA90 = 0;
  }
  return result;
}

uint64_t sub_20953F080(_DWORD *a1, unint64_t a2, unint64_t a3)
{
  unsigned int v6;
  int v7;
  uint64_t result;
  _DWORD *v9;

  v6 = sub_20953F214(a3);
  if (v6 >= 0xFFFFFFFD)
  {
    if (a2 >= 2)
    {
      v7 = a3 | 0x40;
      if ((_DWORD)a3 == 127)
        v7 = 63;
      *a1 = 94;
      a1[1] = v7;
      return 2;
    }
    return -1;
  }
  if (v6 != -4)
  {
    if (v6)
      return 0;
    if (a2)
    {
      *a1 = a3;
      return 1;
    }
    return -1;
  }
  if ((int)sub_20953F1A0(a3) > (uint64_t)a2)
    return -1;
  *(_QWORD *)a1 = 0x550000005CLL;
  a1[2] = 43;
  if ((int)a3 < 0x10000)
  {
    v9 = a1 + 3;
    result = 7;
  }
  else
  {
    v9 = a1 + 4;
    a1[3] = a0123456789abcd[(a3 >> 16) & 0xF];
    result = 8;
  }
  *v9 = a0123456789abcd[(unsigned __int16)a3 >> 12];
  v9[1] = a0123456789abcd[(a3 >> 8) & 0xF];
  v9[2] = a0123456789abcd[a3 >> 4];
  v9[3] = a0123456789abcd[a3 & 0xF];
  return result;
}

uint64_t sub_20953F1A0(__darwin_ct_rune_t a1)
{
  int v2;
  uint64_t result;

  v2 = sub_20953F214(a1) + 4;
  result = 2;
  switch(v2)
  {
    case 0:
      if (a1 < 0x10000)
        result = 7;
      else
        result = 8;
      break;
    case 2:
      result = 1;
      break;
    case 3:
      return result;
    case 4:
      result = wcwidth(a1);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_20953F214(__darwin_ct_rune_t a1)
{
  int v3;
  int v4;

  if (a1 == 9)
    return 4294967294;
  if (a1 == 10)
    return 4294967293;
  if (a1 <= 255)
  {
    if (a1 <= 0x7F)
    {
      v3 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60);
      if ((v3 & 0x200) == 0)
      {
        v4 = v3 & 0x40000;
        goto LABEL_12;
      }
      return 0xFFFFFFFFLL;
    }
    if (__maskrune(a1, 0x200uLL))
      return 0xFFFFFFFFLL;
  }
  v4 = __maskrune(a1, 0x40000uLL);
LABEL_12:
  if (v4)
    return 0;
  else
    return 4294967292;
}

int el_getc(EditLine *a1, char *a2)
{
  int v4;
  int result;
  int v6;
  __int32 v7;

  v7 = 0;
  v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 0x10) == 0)
    *((_DWORD *)a1 + 11) = v4 | 0x20;
  result = el_wgetc(a1, &v7);
  v6 = *((_DWORD *)a1 + 11);
  if ((v6 & 0x10) == 0)
    *((_DWORD *)a1 + 11) = v6 & 0xFFFFFFDF;
  if (result >= 1)
    *a2 = v7;
  return result;
}

void el_push(EditLine *a1, const char *a2)
{
  __int32 *v3;

  v3 = sub_20953ED48((__int32 *)a2, (uint64_t)a1 + 1296);
  el_wpush(a1, v3);
}

const char *__cdecl el_gets(EditLine *a1, int *a2)
{
  int v4;
  unsigned __int32 *v5;
  int v6;
  unsigned __int32 *v7;
  const char *v8;

  v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 0x10) == 0)
    *((_DWORD *)a1 + 11) = v4 | 0x20;
  v5 = (unsigned __int32 *)el_wgets(a1, a2);
  v6 = *((_DWORD *)a1 + 11);
  if ((v6 & 0x10) == 0)
    *((_DWORD *)a1 + 11) = v6 & 0xFFFFFFDF;
  if (!v5)
    return 0;
  v7 = sub_20953EC14(v5, (uint64_t)a1 + 1296);
  v8 = (const char *)v7;
  if (v7)
    *a2 = strlen((const char *)v7);
  return v8;
}

int el_parse(EditLine *a1, int a2, const char **a3)
{
  const __int32 **v5;
  const __int32 **v6;
  int v7;

  v5 = (const __int32 **)sub_20953EDE0(a2, a3, (uint64_t)a1 + 1296);
  if (!v5)
    return -1;
  v6 = v5;
  v7 = el_wparse(a1, a2, v5);
  free(v6);
  return v7;
}

int el_set(EditLine *a1, int a2, ...)
{
  int v3;
  uint64_t v5;
  const char *v6;
  const __int32 **v7;
  const __int32 **v8;
  int v9;
  int v10;
  __int32 *v11;
  int v12;
  uint64_t v13;
  const __int32 **v14;
  const __int32 **v15;
  __int32 *v16;
  __int32 *v17;
  const __int32 **v18;
  int v20;
  uint64_t v21;
  __int32 *v22;
  uint64_t v23;
  va_list v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int32 *v37;
  uint64_t v38;
  uint64_t v39;
  va_list va3;
  va_list va;
  va_list va1;
  va_list va2;

  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v37 = va_arg(va1, __int32 *);
  va_copy(va2, va1);
  v38 = va_arg(va2, _QWORD);
  va_copy(va3, va2);
  v39 = va_arg(va3, _QWORD);
  v36 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return -1;
  va_copy(v24, va);
  v3 = -1;
  switch(a2)
  {
    case 0:
    case 12:
      v11 = v37;
      v12 = 0;
      goto LABEL_13;
    case 1:
      v10 = el_wset(a1, 1, v37, v23, va1);
      goto LABEL_14;
    case 2:
      v22 = sub_20953ED48(v37, (uint64_t)a1 + 1296);
      v10 = el_wset(a1, 2, v22, v23, va1);
      goto LABEL_14;
    case 3:
    case 11:
    case 15:
    case 16:
      v10 = el_wset(a1, a2, v37, v23, va1);
      goto LABEL_14;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      v35 = 0;
      v34 = 0u;
      v33 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v5 = 1;
      v26 = 0u;
      do
      {
        v6 = va_arg(v24, const char *);
        (&v25)[v5] = v6;
        if (!v6)
          break;
        ++v5;
      }
      while (v5 != 20);
      v25 = 0;
      v7 = (const __int32 **)sub_20953EDE0((int)v5 + 1, &v25, (uint64_t)a1 + 1296);
      if (!v7)
        return -1;
      v8 = v7;
      switch(a2)
      {
        case 4:
          *v7 = (const __int32 *)&unk_209547C3C;
          v9 = sub_209532DD8();
          goto LABEL_33;
        case 5:
          *v7 = (const __int32 *)&unk_209547C50;
          v9 = sub_20953BA20((uint64_t)a1);
          goto LABEL_33;
        case 6:
          *v7 = (const __int32 *)&unk_209547C6C;
          v9 = sub_20953BBE8((uint64_t)a1, v5, (uint64_t)v7);
          goto LABEL_33;
        case 7:
          *v7 = (const __int32 *)&unk_209547C84;
          v9 = sub_20953BE78((uint64_t)a1, v5, (uint64_t)v7);
          goto LABEL_33;
        case 8:
          *v7 = (const __int32 *)&unk_209547CA0;
          v9 = sub_20953D590((uint64_t)a1, v5, (uint64_t)v7);
LABEL_33:
          v3 = v9;
          break;
        default:
          v3 = -1;
          break;
      }
      v18 = v8;
      goto LABEL_35;
    case 9:
      v25 = (const char *)v37;
      *(_QWORD *)&v26 = v38;
      v13 = v39;
      v14 = (const __int32 **)sub_20953EDE0(2, &v25, (uint64_t)a1 + 1296);
      if (!v14)
        return -1;
      v15 = v14;
      v16 = sub_20953FB74(*v14);
      v17 = sub_20953FB74(v15[1]);
      v3 = sub_209533378((uint64_t)a1, (uint64_t)v16, (uint64_t)v17, v13);
      v18 = v15;
LABEL_35:
      free(v18);
      return v3;
    case 10:
      v3 = sub_2095308C8((uint64_t)a1, (uint64_t)v37, v38);
      v20 = *((_DWORD *)a1 + 11) | 0x40;
      goto LABEL_23;
    case 13:
      v3 = el_wset(a1, 13, v37);
      v20 = *((_DWORD *)a1 + 11) | 0x80;
LABEL_23:
      *((_DWORD *)a1 + 11) = v20;
      return v3;
    case 14:
      v10 = el_wset(a1, 14, v37, v23, va1);
      goto LABEL_14;
    case 19:
      v10 = el_wset(a1, 19, v37, v38, va2);
      goto LABEL_14;
    case 20:
      v10 = el_wset(a1, 20, v21, v23, va);
      goto LABEL_14;
    case 21:
    case 22:
      v11 = v37;
      v12 = (char)v38;
LABEL_13:
      v10 = sub_209533B94((uint64_t)a1, v11, v12, a2, 0);
      goto LABEL_14;
    case 23:
      v10 = sub_20952D7B8((uint64_t)a1, (uint64_t)v37, v38);
LABEL_14:
      v3 = v10;
      break;
    default:
      return v3;
  }
  return v3;
}

int el_get(EditLine *a1, int a2, ...)
{
  int result;
  EditLine *v4;
  _BYTE *v5;
  unsigned __int32 **v6;
  int v7;
  uint64_t v8;
  unsigned __int32 *v9;
  unint64_t v10;
  _BYTE *v11;
  va_list v12;
  va_list v13;
  unsigned __int32 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int32 **v26;
  _BYTE *v27;
  va_list va2;
  va_list va;
  va_list va1;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v26 = va_arg(va1, unsigned __int32 **);
  va_copy(va2, va1);
  v27 = va_arg(va2, _BYTE *);
  v25 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return -1;
  va_copy(v12, va);
  result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      return sub_209533BE0((uint64_t)a1, v26, 0, a2);
    case 1:
      va_copy(v13, va1);
      v10 = (unint64_t)v26;
      v4 = a1;
      a2 = 1;
      goto LABEL_4;
    case 2:
      v6 = v26;
      v14 = 0;
      v7 = el_wget(a1, 2, &v14);
      *v6 = sub_20953EC14(v14, (uint64_t)a1 + 1296);
      if (*((_QWORD *)a1 + 163))
        return v7;
      else
        return -1;
    case 3:
    case 11:
    case 15:
    case 16:
      va_copy(v13, va1);
      v10 = (unint64_t)v26;
      v4 = a1;
      goto LABEL_4;
    case 13:
      va_copy(v13, va1);
      v10 = (unint64_t)v26;
      v4 = a1;
      a2 = 13;
      goto LABEL_4;
    case 14:
      va_copy(v13, va1);
      v10 = (unint64_t)v26;
      v4 = a1;
      a2 = 14;
      goto LABEL_4;
    case 17:
      v24 = 0;
      v23 = 0u;
      v22 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = 1;
      v15 = 0u;
      do
      {
        v9 = va_arg(v12, unsigned __int32 *);
        (&v14)[v8] = v9;
        if (!v9)
          break;
        ++v8;
      }
      while (v8 != 20);
      v14 = (unsigned __int32 *)aGettc_0;
      return sub_20953BD64((uint64_t)a1, v8, (uint64_t)&v14);
    case 18:
      va_copy(v13, va2);
      v10 = v26;
      v11 = v27;
      v4 = a1;
      a2 = 18;
LABEL_4:
      result = el_wget(v4, a2, v10, v11, v13);
      break;
    case 21:
    case 22:
      v5 = v27;
      LODWORD(v14) = 0;
      result = sub_209533BE0((uint64_t)a1, v26, &v14, a2);
      *v5 = (_BYTE)v14;
      break;
    default:
      return result;
  }
  return result;
}

const LineInfo *__cdecl el_line(EditLine *a1)
{
  const LineInfoW *v2;
  unsigned __int32 **v3;
  unsigned __int32 *v4;
  unsigned int *buffer;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;

  v2 = el_wline(a1);
  v3 = (unsigned __int32 **)((char *)a1 + 1328);
  v4 = sub_20953EC14((unsigned __int32 *)v2->buffer, (uint64_t)a1 + 1296);
  *((_QWORD *)a1 + 166) = v4;
  buffer = (unsigned int *)v2->buffer;
  if (v2->buffer >= v2->cursor)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *buffer++;
      v6 += sub_20953EF00(v7);
    }
    while ((const __int32 *)buffer < v2->cursor);
    v4 = *v3;
    buffer = (unsigned int *)v2->buffer;
  }
  *((_QWORD *)a1 + 167) = (char *)v4 + v6;
  if ((const __int32 *)buffer >= v2->lastchar)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v9 = *buffer++;
      v8 += sub_20953EF00(v9);
    }
    while ((const __int32 *)buffer < v2->lastchar);
    v4 = *v3;
  }
  *((_QWORD *)a1 + 168) = (char *)v4 + v8;
  return (const LineInfo *)((char *)a1 + 1328);
}

int el_insertstr(EditLine *a1, const char *a2)
{
  __int32 *v3;

  v3 = sub_20953ED48((__int32 *)a2, (uint64_t)a1 + 1296);
  return el_winsertstr(a1, v3);
}

__int32 *sub_20953FB74(const __int32 *a1)
{
  size_t v2;
  __int32 *result;

  v2 = wcslen(a1) + 1;
  result = (__int32 *)malloc_type_malloc(4 * v2, 0x100004052888210uLL);
  if (result)
    return wmemcpy(result, a1, v2);
  return result;
}

History *history_init(void)
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = malloc_type_malloc(0x60uLL, 0x108004000789A1EuLL);
  v1 = v0;
  if (v0)
  {
    if (sub_209530DD8(v0) == -1)
    {
      free(v1);
      return 0;
    }
    else
    {
      *((_DWORD *)v1 + 2) = -1;
      v1[2] = sub_20953FCF0;
      v1[3] = sub_20953FC90;
      v1[4] = sub_20953FD2C;
      v1[5] = sub_20953FD68;
      v1[6] = sub_20953FDE4;
      v1[7] = sub_20953FE3C;
      v1[10] = sub_20953FF04;
      v1[11] = sub_20954001C;
      v1[8] = sub_209540124;
      v1[9] = sub_20953FEC0;
    }
  }
  return (History *)v1;
}

uint64_t sub_20953FC90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _OWORD *v4;
  uint64_t result;
  const char *v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == a1)
  {
    *(_DWORD *)a2 = 5;
    v6 = "empty list";
  }
  else
  {
    v4 = *(_OWORD **)(v2 + 24);
    if (v4 != (_OWORD *)a1)
    {
      result = 0;
      *(_QWORD *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 6;
    v6 = "no next event";
  }
  *(_QWORD *)(a2 + 8) = v6;
  return 0xFFFFFFFFLL;
}

uint64_t sub_20953FCF0(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t result;

  v2 = *(_OWORD **)(a1 + 24);
  *(_QWORD *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 3;
    *(_QWORD *)(a2 + 8) = "first event not found";
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_20953FD2C(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t result;

  v2 = *(_OWORD **)(a1 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 4;
    *(_QWORD *)(a2 + 8) = "last event not found";
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_20953FD68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _OWORD *v4;
  uint64_t result;
  int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  const char *v10;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == a1)
  {
    v6 = *(_DWORD *)(a1 + 52);
    v7 = v6 <= 0;
    if (v6 <= 0)
      v8 = 5;
    else
      v8 = 6;
    *(_DWORD *)a2 = v8;
    v9 = 5;
    if (!v7)
      v9 = 6;
    v10 = (&off_24C1B67C8)[v9];
  }
  else
  {
    v4 = *(_OWORD **)(v3 + 32);
    if (v4 != (_OWORD *)a1)
    {
      result = 0;
      *(_QWORD *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 7;
    v10 = "no previous event";
  }
  *(_QWORD *)(a2 + 8) = v10;
  return 0xFFFFFFFFLL;
}

uint64_t sub_20953FDE4(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t result;
  int v4;
  BOOL v5;
  int v6;
  uint64_t v7;

  v2 = *(_OWORD **)(a1 + 40);
  if (v2 == (_OWORD *)a1)
  {
    v4 = *(_DWORD *)(a1 + 52);
    v5 = v4 <= 0;
    if (v4 <= 0)
      v6 = 5;
    else
      v6 = 8;
    *(_DWORD *)a2 = v6;
    v7 = 5;
    if (!v5)
      v7 = 8;
    *(_QWORD *)(a2 + 8) = (&off_24C1B67C8)[v7];
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_20953FE3C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  const char *v4;
  int v5;

  if (*(_DWORD *)(a1 + 52))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 == a1 || *(_DWORD *)v3 != a3)
    {
      v3 = a1;
      while (1)
      {
        v3 = *(_QWORD *)(v3 + 24);
        if (v3 == a1)
          break;
        if (*(_DWORD *)v3 == a3)
          goto LABEL_10;
      }
      v3 = a1;
LABEL_10:
      *(_QWORD *)(a1 + 40) = v3;
    }
    if (v3 != a1)
      return 0;
    v4 = "event not found";
    v5 = 9;
  }
  else
  {
    v4 = "empty list";
    v5 = 5;
  }
  *(_DWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v4;
  return 0xFFFFFFFFLL;
}

void sub_20953FEC0(uint64_t a1)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 32); i != a1; i = *(_QWORD *)(a1 + 32))
    sub_209531DE8(a1, i);
  *(_QWORD *)(a1 + 40) = a1;
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t sub_20953FF04(uint64_t a1, uint64_t a2, char *__s2)
{
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;

  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 24);
    if (v6 != a1)
    {
      result = strcmp(*(const char **)(v6 + 8), __s2);
      if (!(_DWORD)result)
        return result;
    }
  }
  v8 = malloc_type_malloc(0x28uLL, 0x10F00401F389D68uLL);
  if (!v8)
  {
LABEL_15:
    *(_DWORD *)a2 = 2;
    *(_QWORD *)(a2 + 8) = "malloc() failed";
    return 0xFFFFFFFFLL;
  }
  v9 = v8;
  v10 = strdup(__s2);
  v9[1] = v10;
  if (!v10)
  {
    free(v9);
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(a1 + 24);
  v9[2] = 0;
  v9[3] = v11;
  v9[4] = a1;
  *(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) = v9;
  v12 = *(_DWORD *)(a1 + 52);
  LODWORD(v11) = *(_DWORD *)(a1 + 56) + 1;
  *(_DWORD *)v9 = v11;
  *(_QWORD *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 52) = v12 + 1;
  *(_DWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 40) = v9;
  *(_OWORD *)a2 = *(_OWORD *)v9;
  v13 = *(_DWORD *)(a1 + 52);
  result = 1;
  if (v13 >= 1 && v13 > *(_DWORD *)(a1 + 48))
  {
    do
    {
      sub_209531DE8(a1, *(_QWORD *)(a1 + 32));
      v14 = *(_DWORD *)(a1 + 52);
    }
    while (v14 >= 1 && v14 > *(_DWORD *)(a1 + 48));
    return 1;
  }
  return result;
}

uint64_t sub_20954001C(uint64_t a1, uint64_t a2, char *__s2)
{
  uint64_t v6;
  size_t v7;
  size_t v8;
  char *v9;
  char *v10;
  char *v11;
  size_t v12;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == a1)
    return sub_20953FF04(a1, a2, __s2);
  v7 = strlen(*(const char **)(v6 + 8));
  v8 = strlen(__s2) + v7;
  v9 = (char *)malloc_type_malloc(v8 + 1, 0x100004077774924uLL);
  if (v9)
  {
    v10 = v9;
    v11 = strncpy(v9, *(const char **)(*(_QWORD *)(a1 + 40) + 8), v8 + 1);
    v11[v8] = 0;
    v12 = strlen(v11);
    strncat(v10, __s2, v8 - v12);
    free(*(void **)(v6 + 8));
    result = 0;
    *(_QWORD *)(v6 + 8) = v10;
    *(_OWORD *)a2 = *(_OWORD *)*(_QWORD *)(a1 + 40);
  }
  else
  {
    *(_DWORD *)a2 = 2;
    *(_QWORD *)(a2 + 8) = "malloc() failed";
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_209540124(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;

  if (sub_20953FE3C(a1, a2, a3))
    return 0xFFFFFFFFLL;
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 8) = strdup(*(const char **)(v6 + 8));
  *(_DWORD *)a2 = *(_DWORD *)v6;
  sub_209531DE8(a1, v6);
  return 0;
}

void history_end(History *a1)
{
  if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_20953FC90)
    sub_20953FEC0(*(_QWORD *)a1);
  free(*(void **)a1);
  free(a1);
}

int history(History *a1, HistEvent *a2, int a3, ...)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t, uint64_t, int);
  void (*v11)(uint64_t);
  uint64_t (*v12)(uint64_t, uint64_t, char *);
  uint64_t (*v13)(uint64_t, uint64_t, char *);
  uint64_t (*v14)(uint64_t, uint64_t, int);
  BOOL v15;
  BOOL v24;
  int v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  int v27;
  const char *v28;
  int v29;
  int v30;
  size_t v32;
  int v33;
  size_t v34;
  int v35;
  int v36;
  int v37;
  FILE *v38;
  FILE *v39;
  char *v40;
  FILE *v41;
  FILE *v42;
  int v43;
  void *v44;
  void *v45;
  size_t v46;
  char *v47;
  size_t v48;
  void *v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  char *v56;
  uint64_t v57;
  int v58;
  int v59;
  unsigned int v60;
  void *v62;
  void *v63;
  char *v64;
  char *v65;
  size_t v66;
  size_t v67;
  void *v68;
  char *v69;
  int v70;
  int v71;
  int v72;
  char *v73;
  int v74;
  size_t __n;
  int v76;
  uint64_t v77;
  char *__s;
  const char *v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  uint64_t (*v81)(uint64_t, uint64_t);
  uint64_t (*v82)(uint64_t, uint64_t);
  uint64_t (*v83)(uint64_t, uint64_t);
  uint64_t (*v84)(uint64_t, uint64_t);
  uint64_t (*v85)(uint64_t, uint64_t, int);
  void (*v86)(uint64_t);
  uint64_t (*v87)(uint64_t, uint64_t, char *);
  uint64_t (*v88)(uint64_t, uint64_t, char *);
  uint64_t (*v89)(uint64_t, uint64_t, int);
  va_list va;

  va_start(va, a3);
  v79 = va_arg(va, const char *);
  v80 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v81 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v82 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v83 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v84 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v85 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  v86 = va_arg(va, void (*)(uint64_t a1));
  v87 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, char *__s2));
  v88 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, char *__s2));
  v89 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  a2->num = 0;
  a2->str = "OK";
  switch(a3)
  {
    case 0:
      *((_DWORD *)a1 + 2) = -1;
      v5 = v80;
      v6 = v81;
      v7 = v82;
      v8 = v83;
      v9 = v84;
      v10 = v85;
      v11 = v86;
      v12 = v87;
      v13 = v88;
      v14 = v89;
      if (v80)
        v15 = v81 == 0;
      else
        v15 = 1;
      v24 = v15
         || v82 == 0
         || v83 == 0
         || v84 == 0
         || v85 == 0
         || v87 == 0
         || v88 == 0
         || v86 == 0
         || v89 == 0
         || v79 == 0;
      v25 = v24;
      v26 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)a1 + 3);
      if (v24)
      {
        if (v26 == sub_20953FC90 || (v27 = v25, sub_209530DD8(a1) == -1))
        {
LABEL_123:
          a2->num = 12;
          v28 = "required parameter(s) not supplied";
          goto LABEL_138;
        }
        v25 = v27;
        v14 = sub_209540124;
        v13 = sub_20954001C;
        v12 = sub_20953FF04;
        v11 = sub_20953FEC0;
        v10 = sub_20953FE3C;
        v9 = sub_20953FDE4;
        v8 = sub_20953FD68;
        v7 = sub_20953FD2C;
        v6 = sub_20953FC90;
        v5 = sub_20953FCF0;
      }
      else
      {
        if (v26 == sub_20953FC90)
        {
          v74 = v25;
          sub_20953FEC0(*(_QWORD *)a1);
          v14 = v89;
          v11 = v86;
          v25 = v74;
        }
        *((_DWORD *)a1 + 2) = -1;
      }
      *((_QWORD *)a1 + 2) = v5;
      *((_QWORD *)a1 + 3) = v6;
      *((_QWORD *)a1 + 4) = v7;
      *((_QWORD *)a1 + 5) = v8;
      *((_QWORD *)a1 + 6) = v9;
      *((_QWORD *)a1 + 7) = v10;
      *((_QWORD *)a1 + 10) = v12;
      *((_QWORD *)a1 + 11) = v13;
      *((_QWORD *)a1 + 8) = v14;
      *((_QWORD *)a1 + 9) = v11;
      if (!v25)
        return 0;
      goto LABEL_123;
    case 1:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_20953FC90)
        goto LABEL_94;
      if ((v79 & 0x80000000) == 0)
      {
        v29 = 0;
        *(_DWORD *)(*(_QWORD *)a1 + 48) = (_DWORD)v79;
        return v29;
      }
      a2->num = 15;
      v28 = "bad parameters";
      goto LABEL_138;
    case 2:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_20953FC90)
      {
        v28 = "function not allowed with other history-functions-set the default";
        v30 = 14;
        goto LABEL_137;
      }
      v58 = *(_DWORD *)(*(_QWORD *)a1 + 52);
      a2->num = v58;
      if (v58 > -2)
        return 0;
      v28 = "history size negative";
      v30 = 13;
      goto LABEL_137;
    case 3:
      return (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 2))(*(_QWORD *)a1, a2);
    case 4:
      return (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 4))(*(_QWORD *)a1, a2);
    case 5:
      return (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 5))(*(_QWORD *)a1, a2);
    case 6:
      return (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 3))(*(_QWORD *)a1, a2);
    case 7:
      return (*((uint64_t (**)(_QWORD, HistEvent *, _QWORD))a1 + 7))(*(_QWORD *)a1, a2, v79);
    case 8:
      return (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 6))(*(_QWORD *)a1, a2);
    case 9:
      return (*((uint64_t (**)(_QWORD, HistEvent *, const char *))a1 + 11))(*(_QWORD *)a1, a2, v79);
    case 10:
      v29 = (*((uint64_t (**)(_QWORD, HistEvent *, const char *))a1 + 10))(*(_QWORD *)a1, a2, v79);
      if (v29 != -1)
        *((_DWORD *)a1 + 2) = a2->num;
      return v29;
    case 11:
      if ((*((unsigned int (**)(_QWORD, HistEvent *, _QWORD))a1 + 7))(*(_QWORD *)a1, a2, *((unsigned int *)a1 + 2)) == -1)return -1;
      return (*((uint64_t (**)(_QWORD, HistEvent *, const char *))a1 + 11))(*(_QWORD *)a1, a2, v79);
    case 12:
      history_end(a1);
      return 0;
    case 13:
      v32 = strlen(v79);
      v33 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v33 == -1)
          goto LABEL_103;
        if (strncmp(v79, a2->str, v32))
        {
          v33 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 5))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 14:
      v34 = strlen(v79);
      v35 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v35 == -1)
          goto LABEL_103;
        if (strncmp(v79, a2->str, v34))
        {
          v35 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 3))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 15:
      v36 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v36 == -1)
          goto LABEL_103;
        if (a2->num != (_DWORD)v79)
        {
          v36 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 3))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 16:
      v37 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 6))(*(_QWORD *)a1, a2);
      while (2)
      {
        if (v37 == -1)
          goto LABEL_103;
        if (a2->num != (_DWORD)v79)
        {
          v37 = (*((uint64_t (**)(_QWORD, HistEvent *))a1 + 5))(*(_QWORD *)a1, a2);
          continue;
        }
        return 0;
      }
    case 17:
      v38 = fopen(v79, "r");
      if (!v38)
        goto LABEL_80;
      v39 = v38;
      __n = 0;
      v77 = 0;
      __s = 0;
      v40 = fgetln(v38, &__n);
      if (!v40
        || strncmp(v40, "_HiStOrY_V2_\n", __n)
        || (v62 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v39);
        goto LABEL_80;
      }
      v63 = v62;
      v64 = fgetln(v39, &__n);
      if (v64)
      {
        v65 = v64;
        v29 = 0;
        v66 = 1024;
        while (1)
        {
          v67 = __n;
          if (__n && v65[__n - 1] == 10)
          {
            --__n;
            --v67;
          }
          if (v66 < v67)
          {
            v66 = (v67 & 0xFFFFFFFFFFFFFC00) + 1024;
            v68 = malloc_type_realloc(v63, v66, 0x100004077774924uLL);
            if (!v68)
              break;
            v67 = __n;
            v63 = v68;
          }
          v76 = 0;
          v69 = (char *)v63;
          if (v67)
          {
            v69 = (char *)v63;
            do
            {
              --v67;
              v71 = *v65++;
              v70 = v71;
              while (1)
              {
                v72 = unvis(v69, v70, &v76, 0);
                if (v72 != 2)
                  break;
                ++v69;
              }
              if (v72 && v72 != 3)
              {
                if (v72 != 1)
                  goto LABEL_164;
                ++v69;
              }
            }
            while (v67);
          }
          v73 = unvis(v69, 0, &v76, 2048) == 1 ? v69 + 1 : v69;
          *v73 = 0;
LABEL_164:
          if ((*((unsigned int (**)(_QWORD, uint64_t *, void *))a1 + 10))(*(_QWORD *)a1, &v77, v63) == -1)
            break;
          ++v29;
          v65 = fgetln(v39, &__n);
          if (!v65)
            goto LABEL_176;
        }
        v29 = -1;
      }
      else
      {
        v29 = 0;
      }
LABEL_176:
      free(v63);
      fclose(v39);
      if (v29 == -1)
      {
LABEL_80:
        a2->num = 10;
        v28 = "can't read history from file";
        goto LABEL_138;
      }
      return v29;
    case 18:
      v41 = fopen(v79, "w");
      if (!v41)
        goto LABEL_125;
      v42 = v41;
      v77 = 0;
      __s = 0;
      v43 = fileno(v41);
      if (fchmod(v43, 0x180u) == -1
        || fputs("_HiStOrY_V2_\n", v42) == -1
        || (v44 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v42);
        goto LABEL_125;
      }
      v45 = v44;
      if ((*((unsigned int (**)(_QWORD, uint64_t *))a1 + 4))(*(_QWORD *)a1, &v77) == -1)
      {
        v29 = 0;
        goto LABEL_172;
      }
      v29 = 0;
      v46 = 1024;
      while (2)
      {
        v47 = __s;
        v48 = 4 * strlen(__s);
        if (v48 < v46)
          goto LABEL_90;
        v46 = (v48 & 0xFFFFFFFFFFFFFC00) + 1024;
        v49 = malloc_type_realloc(v45, v46, 0x100004077774924uLL);
        if (v49)
        {
          v45 = v49;
LABEL_90:
          strvis((char *)v45, v47, 28);
          fprintf(v42, "%s\n", (const char *)v45);
          ++v29;
          if ((*((unsigned int (**)(_QWORD, uint64_t *))a1 + 5))(*(_QWORD *)a1, &v77) == -1)
            goto LABEL_172;
          continue;
        }
        break;
      }
      v29 = -1;
LABEL_172:
      free(v45);
      fclose(v42);
      if (v29 == -1)
      {
LABEL_125:
        a2->num = 11;
        v28 = "can't write history";
        goto LABEL_138;
      }
      return v29;
    case 19:
      (*((void (**)(_QWORD, HistEvent *))a1 + 9))(*(_QWORD *)a1, a2);
      return 0;
    case 20:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_20953FC90)
      {
LABEL_94:
        a2->num = 14;
        v28 = "function not allowed with other history-functions-set the default";
        goto LABEL_138;
      }
      v59 = *(_DWORD *)(*(_QWORD *)a1 + 60);
      v29 = 0;
      if ((_DWORD)v79)
        v60 = v59 | 1;
      else
        v60 = v59 & 0xFFFFFFFE;
      *(_DWORD *)(*(_QWORD *)a1 + 60) = v60;
      return v29;
    case 21:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_20953FC90)
      {
        v29 = 0;
        v50 = *(_DWORD *)(*(_QWORD *)a1 + 60) & 1;
      }
      else
      {
        a2->str = "function not allowed with other history-functions-set the default";
        v29 = -1;
        v50 = 14;
      }
      a2->num = v50;
      return v29;
    case 22:
      return (*((uint64_t (**)(_QWORD, HistEvent *, _QWORD))a1 + 8))(*(_QWORD *)a1, a2, v79);
    case 23:
      if ((*((unsigned int (**)(_QWORD, HistEvent *))a1 + 6))(*(_QWORD *)a1, a2) == -1)
        goto LABEL_103;
      v51 = (_DWORD)v79 + 1;
      while (--v51 > 0)
      {
        if ((*((unsigned int (**)(_QWORD, HistEvent *))a1 + 5))(*(_QWORD *)a1, a2) == -1)
        {
LABEL_103:
          a2->num = 9;
          v28 = "event not found";
LABEL_138:
          a2->str = v28;
          return -1;
        }
      }
      if (!v80)
        return 0;
      v29 = 0;
      *(_QWORD *)v80 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 16);
      return v29;
    case 24:
      v52 = (int)v79;
      v53 = *(_QWORD *)a1;
      if (!*(_DWORD *)(*(_QWORD *)a1 + 52))
      {
        v28 = "empty list";
        v30 = 5;
LABEL_137:
        a2->num = v30;
        goto LABEL_138;
      }
      v54 = *(_QWORD *)a1;
      do
        v54 = *(_QWORD *)(v54 + 32);
      while (v54 != v53 && v52-- > 0);
      *(_QWORD *)(v53 + 40) = v54;
      if (v54 == v53)
      {
        v28 = "event not found";
        v30 = 9;
        goto LABEL_137;
      }
      if (v80 != (uint64_t (*)(uint64_t, uint64_t))-1)
      {
        a2->str = strdup(*(const char **)(v54 + 8));
        a2->num = *(_DWORD *)v54;
        if (v80)
        {
          *(_QWORD *)v80 = *(_QWORD *)(v54 + 16);
          v54 = *(_QWORD *)(v53 + 40);
        }
        sub_209531DE8(v53, v54);
      }
      return 0;
    case 25:
      if (!v79)
        return -1;
      v56 = strdup(v79);
      if (!v56)
        return -1;
      v29 = 0;
      v57 = *(_QWORD *)(*(_QWORD *)a1 + 40);
      *(_QWORD *)(v57 + 8) = v56;
      *(_QWORD *)(v57 + 16) = v80;
      return v29;
    default:
      a2->num = 1;
      v28 = "unknown error";
      goto LABEL_138;
  }
}

Tokenizer *__cdecl tok_init(const char *a1)
{
  char *v2;
  const char *v3;
  char *v4;
  _QWORD *v5;
  char *v6;

  v2 = (char *)malloc_type_malloc(0x48uLL, 0x1090040E7945993uLL);
  if (v2)
  {
    if (a1)
      v3 = a1;
    else
      v3 = "\t \n";
    v4 = strdup(v3);
    *(_QWORD *)v2 = v4;
    if (v4)
    {
      *(_OWORD *)(v2 + 8) = xmmword_209542650;
      v5 = malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
      *((_QWORD *)v2 + 3) = v5;
      if (v5)
      {
        *v5 = 0;
        v6 = (char *)malloc_type_malloc(0x14uLL, 0x100004077774924uLL);
        *((_QWORD *)v2 + 7) = v6;
        if (v6)
        {
          *((_QWORD *)v2 + 5) = v6 + 20;
          *((_QWORD *)v2 + 6) = v6;
          *((_QWORD *)v2 + 4) = v6;
          *((_QWORD *)v2 + 8) = 0;
          return (Tokenizer *)v2;
        }
        free(*((void **)v2 + 3));
      }
      free(*(void **)v2);
    }
    free(v2);
    return 0;
  }
  return (Tokenizer *)v2;
}

void tok_reset(Tokenizer *a1)
{
  uint64_t v1;

  *((_QWORD *)a1 + 1) = 0;
  v1 = *((_QWORD *)a1 + 7);
  *((_QWORD *)a1 + 6) = v1;
  *((_QWORD *)a1 + 4) = v1;
  *((_QWORD *)a1 + 8) = 0;
}

void tok_end(Tokenizer *a1)
{
  free(*(void **)a1);
  free(*((void **)a1 + 7));
  free(*((void **)a1 + 3));
  free(a1);
}

int tok_line(Tokenizer *a1, const LineInfo *a2, int *a3, const char ***a4, int *a5, int *a6)
{
  const char *buffer;
  int v9;
  int v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int result;
  int v20;
  char v21;
  char v22;
  char *v23;
  _BYTE *v24;
  char v25;
  char *v26;
  uint64_t v27;
  void *v28;
  size_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  int *v38;
  const char ***v39;
  int *v40;
  int *v41;

  buffer = a2->buffer;
  v9 = -1;
  v10 = -1;
  while (1)
  {
    if (buffer >= a2->lastchar)
      v11 = (const char *)&unk_209547D1A;
    else
      v11 = buffer;
    if (v11 == a2->cursor)
    {
      v9 = *((_DWORD *)a1 + 2);
      v10 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12);
    }
    v12 = *v11;
    if (v12 <= 33)
      break;
    if (v12 == 34)
    {
      v17 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
      switch(v17)
      {
        case 0:
          goto LABEL_26;
        case 1:
          goto LABEL_33;
        case 2:
          goto LABEL_30;
        case 3:
          goto LABEL_24;
        case 4:
          goto LABEL_32;
        default:
          return -1;
      }
    }
    if (v12 != 92)
    {
      if (v12 == 39)
      {
        v13 = *((_DWORD *)a1 + 16);
        *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
        switch(v13)
        {
          case 0:
            v14 = 1;
            goto LABEL_28;
          case 1:
            goto LABEL_30;
          case 2:
            goto LABEL_33;
          case 3:
            goto LABEL_24;
          case 4:
            goto LABEL_32;
          default:
            return -1;
        }
      }
LABEL_21:
      v20 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) &= ~2u;
      switch(v20)
      {
        case 0:
          v21 = *v11;
          if (strchr(*(char **)a1, *v11))
          {
            sub_209541130((uint64_t)a1);
            goto LABEL_35;
          }
          v25 = v21;
          break;
        case 1:
        case 2:
          goto LABEL_33;
        case 3:
          goto LABEL_24;
        case 4:
          v24 = (_BYTE *)*((_QWORD *)a1 + 4);
          *((_QWORD *)a1 + 4) = v24 + 1;
          *v24 = 92;
          goto LABEL_32;
        default:
          return -1;
      }
LABEL_34:
      v26 = (char *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v26 + 1;
      *v26 = v25;
      goto LABEL_35;
    }
    v18 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
    switch(v18)
    {
      case 0:
        v14 = 3;
        break;
      case 1:
        goto LABEL_33;
      case 2:
        v14 = 4;
        break;
      case 3:
        v22 = *v11;
        v23 = (char *)*((_QWORD *)a1 + 4);
        *((_QWORD *)a1 + 4) = v23 + 1;
        *v23 = v22;
        goto LABEL_30;
      case 4:
        goto LABEL_32;
      default:
        return -1;
    }
LABEL_28:
    *((_DWORD *)a1 + 16) = v14;
LABEL_35:
    v27 = *((_QWORD *)a1 + 5);
    if (*((_QWORD *)a1 + 4) >= (unint64_t)(v27 - 4))
    {
      v28 = (void *)*((_QWORD *)a1 + 7);
      v29 = v27 - (_QWORD)v28 + 20;
      v30 = (char *)malloc_type_realloc(v28, v29, 0x100004077774924uLL);
      if (!v30)
        return -1;
      v31 = (char *)*((_QWORD *)a1 + 7);
      if (v30 != v31)
      {
        v32 = *((_QWORD *)a1 + 1);
        if (v32)
        {
          for (i = 0; i != v32; ++i)
            *(_QWORD *)(*((_QWORD *)a1 + 3) + 8 * i) = &v30[*(_QWORD *)(*((_QWORD *)a1 + 3) + 8 * i)
                                                          - *((_QWORD *)a1 + 7)];
          v31 = (char *)*((_QWORD *)a1 + 7);
        }
        *((_QWORD *)a1 + 4) = &v30[*((_QWORD *)a1 + 4) - (_QWORD)v31];
        *((_QWORD *)a1 + 6) = &v30[*((_QWORD *)a1 + 6) - (_QWORD)v31];
        *((_QWORD *)a1 + 7) = v30;
      }
      *((_QWORD *)a1 + 5) = &v30[v29];
    }
    v34 = *((_QWORD *)a1 + 2);
    if (*((_QWORD *)a1 + 1) >= (unint64_t)(v34 - 4))
    {
      v35 = v34 + 10;
      *((_QWORD *)a1 + 2) = v35;
      v36 = malloc_type_realloc(*((void **)a1 + 3), 8 * v35, 0x10040436913F5uLL);
      if (!v36)
        return -1;
      *((_QWORD *)a1 + 3) = v36;
    }
    buffer = v11 + 1;
  }
  if (!*v11)
  {
    result = *((_DWORD *)a1 + 16);
    switch(result)
    {
      case 0:
        v37 = *((_DWORD *)a1 + 17);
        if ((v37 & 2) != 0)
        {
          *((_DWORD *)a1 + 17) = v37 & 0xFFFFFFFD;
          return 3;
        }
        else
        {
LABEL_52:
          if (v9 == -1)
          {
            v39 = a4;
            v38 = a3;
            v41 = a5;
            v40 = a6;
            if (v10 == -1)
            {
              v9 = *((_DWORD *)a1 + 2);
              v10 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12);
            }
          }
          else
          {
            v39 = a4;
            v38 = a3;
            v41 = a5;
            v40 = a6;
          }
          if (v41)
            *v41 = v9;
          if (v40)
            *v40 = v10;
          sub_209541130((uint64_t)a1);
          result = 0;
          *v39 = (const char **)*((_QWORD *)a1 + 3);
          *v38 = *((_QWORD *)a1 + 1);
        }
        return result;
      case 1:
      case 2:
        return result;
      case 3:
LABEL_24:
        *((_DWORD *)a1 + 16) = 0;
        goto LABEL_33;
      case 4:
LABEL_32:
        *((_DWORD *)a1 + 16) = 2;
LABEL_33:
        v25 = *v11;
        break;
      default:
        return -1;
    }
    goto LABEL_34;
  }
  if (v12 != 10)
    goto LABEL_21;
  v16 = *((_DWORD *)a1 + 16);
  v15 = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = v15 & 0xFFFFFFFD;
  switch(v16)
  {
    case 0:
      goto LABEL_52;
    case 1:
    case 2:
      goto LABEL_33;
    case 3:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_30:
      *((_DWORD *)a1 + 16) = 0;
      goto LABEL_35;
    case 4:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_26:
      *((_DWORD *)a1 + 16) = 2;
      goto LABEL_35;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_209541130(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  **(_BYTE **)(result + 32) = 0;
  v1 = *(_DWORD *)(result + 68);
  if ((v1 & 1) != 0)
  {
    v2 = *(_QWORD *)(result + 48);
  }
  else
  {
    v2 = *(_QWORD *)(result + 48);
    if (*(_QWORD *)(result + 32) == v2)
      goto LABEL_6;
  }
  v3 = *(_QWORD *)(result + 24);
  v4 = *(_QWORD *)(result + 8);
  *(_QWORD *)(result + 8) = v4 + 1;
  *(_QWORD *)(v3 + 8 * v4) = v2;
  *(_QWORD *)(*(_QWORD *)(result + 24) + 8 * (v4 + 1)) = 0;
  v5 = *(_QWORD *)(result + 32) + 1;
  *(_QWORD *)(result + 32) = v5;
  *(_QWORD *)(result + 48) = v5;
LABEL_6:
  *(_DWORD *)(result + 68) = v1 & 0xFFFFFFFE;
  return result;
}

int tok_str(Tokenizer *a1, const char *a2, int *a3, const char ***a4)
{
  LineInfo v8;

  v8.buffer = a2;
  v8.cursor = &a2[strlen(a2)];
  v8.lastchar = v8.cursor;
  return tok_line(a1, &v8, a3, a4, 0, 0);
}

void sub_2095411F8()
{
  __assert_rtn("tty_stty", "tty.c", 1345, "c != 0");
}

void sub_209541220()
{
  __assert_rtn("tty_stty", "tty.c", 1348, "c != -1");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

speed_t cfgetispeed(const termios *a1)
{
  return MEMORY[0x24BDAD948](a1);
}

speed_t cfgetospeed(const termios *a1)
{
  return MEMORY[0x24BDAD950](a1);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD960](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD968](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void endpwent(void)
{
  MEMORY[0x24BDAE188]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x24BDAE248](__file, __arg0);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x24BDAE370](a1, a2);
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

pid_t fork(void)
{
  return MEMORY[0x24BDAE418]();
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

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDAE4E0](__stream, a2, *(_QWORD *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x24BDAE538](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x24BDAE5C8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x24BDAE6C8]();
}

passwd *getpwent(void)
{
  return (passwd *)MEMORY[0x24BDAE708]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE718](a1, a2, a3, a4, a5);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x24BDAE720](*(_QWORD *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE728](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x24BDAE908]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void longjmp(jmp_buf a1, int a2)
{
  MEMORY[0x24BDAEB00](a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

size_t mbstowcs(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAEE58](a1, a2, a3);
}

int mbtowc(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAEE60](a1, a2, a3);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x24BDAF130](*(_QWORD *)&a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDAFAF8](a1, a2, *(_QWORD *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x24BDAFB08](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x24BDAFB10](a1);
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x24BDAFD30](a1);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x24BDAFD40](*(_QWORD *)&a1, a2);
}

void setpwent(void)
{
  MEMORY[0x24BDAFD58]();
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x24BDAFDE8](*(_QWORD *)&a1, a2, a3);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x24BDAFE08](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strcoll(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF8](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF60](__s1, __s2, __n);
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

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int strvis(char *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDB0060](a1, a2, *(_QWORD *)&a3);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

int tgetent(char *a1, const char *a2)
{
  return MEMORY[0x24BEDCAE0](a1, a2);
}

int tgetflag(char *a1)
{
  return MEMORY[0x24BEDCAE8](a1);
}

int tgetnum(char *a1)
{
  return MEMORY[0x24BEDCAF0](a1);
}

char *__cdecl tgetstr(char *a1, char **a2)
{
  return (char *)MEMORY[0x24BEDCAF8](a1, a2);
}

char *__cdecl tgoto(const char *a1, int a2, int a3)
{
  return (char *)MEMORY[0x24BEDCB00](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int tputs(const char *a1, int a2, int (__cdecl *a3)(int))
{
  return MEMORY[0x24BEDCB10](a1, *(_QWORD *)&a2, a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int unvis(char *a1, int a2, int *a3, int a4)
{
  return MEMORY[0x24BDB02D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4);
}

char *__cdecl vis(char *a1, int a2, int a3, int a4)
{
  return (char *)MEMORY[0x24BDB0378](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

__int32 *__cdecl wcschr(__int32 *__s, __int32 __c)
{
  return (__int32 *)MEMORY[0x24BDB04B0](__s, *(_QWORD *)&__c);
}

int wcscmp(const __int32 *a1, const __int32 *a2)
{
  return MEMORY[0x24BDB04B8](a1, a2);
}

size_t wcscspn(const __int32 *a1, const __int32 *a2)
{
  return MEMORY[0x24BDB04C8](a1, a2);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x24BDB04D0](a1);
}

__int32 *__cdecl wcsncat(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x24BDB04D8](a1, a2, a3);
}

int wcsncmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x24BDB04E0](a1, a2, a3);
}

__int32 *__cdecl wcsncpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x24BDB04E8](a1, a2, a3);
}

__int32 *__cdecl wcsstr(__int32 *__s1, const __int32 *__s2)
{
  return (__int32 *)MEMORY[0x24BDB04F0](__s1, __s2);
}

uint64_t wcstol(const __int32 *a1, __int32 **a2, int a3)
{
  return MEMORY[0x24BDB04F8](a1, a2, *(_QWORD *)&a3);
}

size_t wcstombs(char *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x24BDB0500](a1, a2, a3);
}

int wctomb(char *a1, __int32 a2)
{
  return MEMORY[0x24BDB0508](a1, *(_QWORD *)&a2);
}

int wcwidth(__int32 a1)
{
  return MEMORY[0x24BDB0510](*(_QWORD *)&a1);
}

__int32 *__cdecl wmemcpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x24BDB0528](a1, a2, a3);
}

