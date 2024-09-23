uint64_t _citrus_mapper_std_mapper_init(uint64_t a1, uint64_t a2, const char *a3, const char *a4, int a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  _QWORD *v12;
  _QWORD *v13;
  unsigned int v14;
  char __str[1024];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a7 < 0x18)
    return 22;
  *(_QWORD *)(a6 + 16) = 1;
  *(_OWORD *)a6 = xmmword_24B74CED0;
  v12 = malloc_type_malloc(0x70uLL, 0x10A0040EA5F9EB0uLL);
  if (!v12)
    return *__error();
  v13 = v12;
  snprintf(__str, 0x400uLL, "%s/%.*s", a3, a5, a4);
  v7 = _citrus_map_file();
  if (!(_DWORD)v7)
  {
    v7 = _citrus_db_open();
    if (!(_DWORD)v7)
    {
      v14 = _citrus_db_lookup_string_by_string();
      if (v14)
      {
        if (v14 == 2)
          v7 = 79;
        else
          v7 = v14;
      }
      else if (_citrus_bcs_strcasecmp())
      {
        v7 = 0;
      }
      else
      {
        v7 = rowcol_init(v13);
        if (!(_DWORD)v7)
        {
          *(_QWORD *)(a2 + 8) = v13;
          return v7;
        }
      }
      MEMORY[0x24BD269F0](v13[2]);
    }
    _citrus_unmap_file();
  }
  free(v13);
  return v7;
}

void _citrus_mapper_std_mapper_uninit(uint64_t a1)
{
  _QWORD *v1;
  void (*v2)(_QWORD);

  v1 = *(_QWORD **)(a1 + 8);
  v2 = (void (*)(_QWORD))v1[4];
  if (v2)
    v2(*(_QWORD *)(a1 + 8));
  MEMORY[0x24BD269F0](v1[2]);
  _citrus_unmap_file();
  free(v1);
}

uint64_t _citrus_mapper_std_mapper_convert(uint64_t a1, uint64_t *a2)
{
  int *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v11;
  BOOL v12;

  v2 = (int *)a2[2];
  if (*v2 < 1)
    return 0;
  v4 = 0;
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[3];
  v8 = *(_QWORD *)(a1 + 8);
  while (1)
  {
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(v8 + 24))(v8, v5, *(unsigned int *)(v6 + 4 * v4), v7, 0);
    if (v9)
      break;
    ++v4;
    v5 += 4;
    if (v4 >= *v2)
      return 0;
  }
  if ((v9 & 0x60000000) != 0)
    _citrus_mapper_std_mapper_convert_cold_1();
  if (v9 == 1)
  {
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 24))(v8, v5, *(unsigned int *)(v6 + 4 * v4), v7, 1);
    v12 = v11 == 0;
    if (v11)
      v9 = 1;
    else
      v9 = 6;
    if (v12)
      LODWORD(v4) = v4 + 1;
  }
  *v2 = v4;
  return ((*(_DWORD *)(a1 + 64) & 3) << 29) | v9;
}

uint64_t _citrus_mapper_std_mapper_getops(_OWORD *a1)
{
  __int128 v1;

  v1 = *(_OWORD *)&off_2579AF360;
  *a1 = _citrus_mapper_std_mapper_ops;
  a1[1] = v1;
  return 0;
}

uint64_t rowcol_init(_QWORD *a1)
{
  uint64_t result;

  a1[3] = rowcol_convert;
  a1[4] = rowcol_uninit;
  LODWORD(result) = _citrus_db_lookup_by_string();
  if (!(_DWORD)result)
  {
    if (_citrus_db_lookup_by_string() == 2)
    {
      a1[7] = 0;
      a1[8] = 0;
    }
    LODWORD(result) = _citrus_db_lookup_by_string();
    if (!(_DWORD)result)
      return 79;
  }
  if ((_DWORD)result == 2)
    return 79;
  return result;
}

uint64_t rowcol_convert(uint64_t a1, unsigned int *a2, unsigned int a3, uint64_t a4, int a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int *v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t result;

  if (a5)
  {
    if (!*(_QWORD *)(a1 + 64))
      return 1;
    v5 = (_QWORD *)(a1 + 56);
  }
  else
  {
    v5 = (_QWORD *)(a1 + 40);
  }
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(unsigned int *)(a1 + 88);
  v8 = v6 * v7;
  if (v6 * v7)
  {
    v8 = 0;
    v9 = *(unsigned int **)(a1 + 80);
    v10 = -(v6 * v7);
    v11 = v7 * (v6 - 1);
    while (1)
    {
      v12 = *(_DWORD *)(a1 + 92) & (a3 >> v11);
      if (v12 < *v9 || v12 > v9[1])
        break;
      v8 = v12 - *v9 + v9[2] * v8;
      v11 -= v7;
      v9 += 3;
      v10 += v7;
      if (!v10)
        goto LABEL_10;
    }
    v15 = *(_DWORD *)(a1 + 104);
    if (v15 != 1)
    {
      if (!v15)
      {
        v14 = *(_DWORD *)(a1 + 96);
LABEL_21:
        *a2 = v14;
        return 1;
      }
      return 5;
    }
    return 4;
  }
LABEL_10:
  v13 = *(_DWORD *)(a1 + 100);
  switch(v13)
  {
    case 32:
      v14 = bswap32(*(_DWORD *)(*v5 + 4 * v8));
      break;
    case 16:
      v14 = bswap32(*(unsigned __int16 *)(*v5 + 2 * v8)) >> 16;
      break;
    case 8:
      v14 = *(unsigned __int8 *)(*v5 + v8);
      break;
    default:
      return 5;
  }
  if (v14 == *(_DWORD *)(a1 + 96))
    goto LABEL_21;
  if (v14 == *(_DWORD *)(a1 + 108))
    return 4;
  result = 0;
  *a2 = v14;
  return result;
}

void rowcol_uninit(uint64_t a1)
{
  free(*(void **)(a1 + 80));
}

void _citrus_mapper_std_mapper_convert_cold_1()
{
  __assert_rtn("_citrus_mapper_std_mapper_convert", "citrus_mapper_std.c", 530, "_MAPPER_CONVERT_DIR(ret) == 0");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_strcasecmp()
{
  return MEMORY[0x24BEDBE68]();
}

uint64_t _citrus_db_close()
{
  return MEMORY[0x24BEDBE88]();
}

uint64_t _citrus_db_lookup_by_string()
{
  return MEMORY[0x24BEDBE98]();
}

uint64_t _citrus_db_lookup_string_by_string()
{
  return MEMORY[0x24BEDBEA0]();
}

uint64_t _citrus_db_open()
{
  return MEMORY[0x24BEDBEA8]();
}

uint64_t _citrus_map_file()
{
  return MEMORY[0x24BEDBEC0]();
}

uint64_t _citrus_unmap_file()
{
  return MEMORY[0x24BEDBF10]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

