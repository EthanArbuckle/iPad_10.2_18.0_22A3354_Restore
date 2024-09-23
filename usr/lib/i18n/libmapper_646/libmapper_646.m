uint64_t _citrus_mapper_646_mapper_init(uint64_t a1, uint64_t a2, const char *a3, _BYTE *a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  _DWORD *v11;
  _DWORD *v12;
  unint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char __str[1024];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a7 < 0x18)
    return 22;
  v11 = malloc_type_malloc(0x34uLL, 0x10000403884A0CCuLL);
  if (!v11)
    return *__error();
  v12 = v11;
  v11[12] = 1;
  _citrus_memory_stream_skip_ws();
  v13 = 0;
  if (a5 && *a4 == 33)
  {
    v13 = 1;
    v12[12] = 0;
  }
  v14 = a5 - v13;
  if (a5 < v13)
    v14 = 0;
  if (v14 + v13 <= a5)
  {
    v15 = &a4[v13];
  }
  else
  {
    v15 = 0;
    LODWORD(v14) = 0;
  }
  snprintf(__str, 0x400uLL, "%s/%.*s", a3, v14, v15);
  *(_BYTE *)_citrus_bcs_skip_nonws() = 0;
  v18 = 0uLL;
  v16 = _citrus_map_file();
  if ((_DWORD)v16)
  {
    v7 = v16;
  }
  else
  {
    v19 = v18;
    v20 = 0;
    while (_citrus_memory_stream_getln())
      _citrus_bcs_skip_ws_len();
    _citrus_unmap_file();
    v7 = 22;
  }
  free(v12);
  return v7;
}

void _citrus_mapper_646_mapper_uninit(uint64_t a1)
{
  void *v1;

  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    if (v1)
      free(v1);
  }
}

uint64_t _citrus_mapper_646_mapper_convert(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  int *v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;

  v2 = *a2;
  v3 = a2[1];
  v4 = (int *)a2[2];
  v5 = *(int **)(a1 + 8);
  v6 = *v4;
  if (v5[12])
  {
    if (v6 >= 1)
    {
      v7 = 0;
      while (1)
      {
        v8 = *(_DWORD *)(v3 + 4 * v7);
        if (v8 > 0x7F)
          goto LABEL_85;
        if (v8 > 90)
        {
          switch(v8)
          {
            case '[':
              v8 = v5[3];
              goto LABEL_14;
            case '\\':
              v8 = v5[4];
              goto LABEL_14;
            case ']':
              v8 = v5[5];
              goto LABEL_14;
            case '^':
              v8 = v5[6];
              goto LABEL_14;
            case '_':
              goto LABEL_15;
              v8 = v5[7];
              goto LABEL_14;
            default:
              switch(v8)
              {
                case '{':
                  v8 = v5[8];
                  goto LABEL_14;
                case '|':
                  v8 = v5[9];
                  goto LABEL_14;
                case '}':
                  v8 = v5[10];
                  goto LABEL_14;
                case '~':
                  v8 = v5[11];
                  goto LABEL_14;
                default:
                  goto LABEL_15;
              }
          }
        }
        if (v8 == 35)
          break;
        if (v8 == 36)
        {
          v8 = v5[1];
LABEL_14:
          if (v8 == -1)
            goto LABEL_83;
          goto LABEL_15;
        }
        if (v8 == 64)
        {
          v8 = v5[2];
          goto LABEL_14;
        }
LABEL_15:
        *(_DWORD *)(v2 + 4 * v7++) = v8;
        if (v7 >= *v4)
          return 0;
      }
      v8 = *v5;
      goto LABEL_14;
    }
    return 0;
  }
  if (v6 < 1)
    return 0;
  v7 = 0;
  while (1)
  {
    v9 = *(_DWORD *)(v3 + 4 * v7);
    if (*v5 != -1 && v9 == *v5)
    {
      v9 = 35;
      goto LABEL_43;
    }
    if (v9 == 35)
      break;
    v11 = v5[1];
    if (v11 != -1 && v9 == v11)
    {
      v9 = 36;
      goto LABEL_43;
    }
    if (v9 == 36)
      break;
    v13 = v5[2];
    if (v13 != -1 && v9 == v13)
    {
      v9 = 64;
      goto LABEL_43;
    }
    if (v9 == 64)
      break;
    v14 = v5[3];
    if (v14 != -1 && v9 == v14)
    {
      v9 = 91;
      goto LABEL_43;
    }
    if (v9 == 91)
      break;
    v15 = v5[4];
    if (v15 != -1 && v9 == v15)
    {
      v9 = 92;
      goto LABEL_43;
    }
    if (v9 == 92)
      break;
    v16 = v5[5];
    if (v16 != -1 && v9 == v16)
    {
      v9 = 93;
      goto LABEL_43;
    }
    if (v9 == 93)
      break;
    v17 = v5[6];
    if (v17 != -1 && v9 == v17)
    {
      v9 = 94;
      goto LABEL_43;
    }
    if (v9 == 94)
      break;
    v18 = v5[7];
    if (v18 != -1 && v9 == v18)
    {
      v9 = 96;
      goto LABEL_43;
    }
    if (v9 == 96)
      break;
    v19 = v5[8];
    if (v19 != -1 && v9 == v19)
    {
      v9 = 123;
      goto LABEL_43;
    }
    if (v9 == 123)
      break;
    v20 = v5[9];
    if (v20 != -1 && v9 == v20)
    {
      v9 = 124;
      goto LABEL_43;
    }
    if (v9 == 124)
      break;
    v21 = v5[10];
    if (v21 != -1 && v9 == v21)
    {
      v9 = 125;
      goto LABEL_43;
    }
    if (v9 == 125)
      break;
    v22 = v5[11];
    if (v22 != -1 && v9 == v22)
    {
      v9 = 126;
      goto LABEL_43;
    }
    if (v9 == 126)
      break;
    if (v9 > 0x7F)
    {
LABEL_83:
      v23 = 1;
      goto LABEL_86;
    }
LABEL_43:
    *(_DWORD *)(v2 + 4 * v7++) = v9;
    if (v7 >= *v4)
      return 0;
  }
LABEL_85:
  v23 = 4;
LABEL_86:
  *v4 = v7;
  return v23 & 0x9FFFFFFF | ((*(_DWORD *)(a1 + 64) & 3) << 29);
}

uint64_t _citrus_mapper_646_mapper_getops(_OWORD *a1)
{
  __int128 v1;

  v1 = *(_OWORD *)&off_2579AF2A0;
  *a1 = _citrus_mapper_646_mapper_ops;
  a1[1] = v1;
  return 0;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_skip_nonws()
{
  return MEMORY[0x24BEDBE50]();
}

uint64_t _citrus_bcs_skip_ws()
{
  return MEMORY[0x24BEDBE58]();
}

uint64_t _citrus_bcs_skip_ws_len()
{
  return MEMORY[0x24BEDBE60]();
}

uint64_t _citrus_map_file()
{
  return MEMORY[0x24BEDBEC0]();
}

uint64_t _citrus_memory_stream_getln()
{
  return MEMORY[0x24BEDBEE8]();
}

uint64_t _citrus_memory_stream_skip_ws()
{
  return MEMORY[0x24BEDBEF0]();
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

