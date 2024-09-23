double _citrus_mapper_serial_mapper_init(double result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t **v11;
  uint64_t **v12;
  _DWORD *v13;
  _DWORD *v14;
  char *v15;
  __int32 mapdir_from_key;
  int8x8_t v17;
  uint8x8_t v18;
  _QWORD *v19;
  uint64_t *v20;
  int v21;
  char __str[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a8 >= 0x18)
  {
    v11 = (uint64_t **)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
    if (v11)
    {
      v12 = v11;
      *v11 = 0;
      v11[1] = (uint64_t *)v11;
      _citrus_memory_stream_skip_ws();
      if (a6)
      {
        while (1)
        {
          _citrus_memory_stream_chr();
          snprintf(__str, 0x400uLL, "%.*s", 0, 0);
          *(_BYTE *)_citrus_bcs_skip_nonws() = 0;
          v13 = malloc_type_malloc(0x18uLL, 0x1020040EDCEB4C7uLL);
          if (!v13)
            break;
          v14 = v13;
          v15 = (char *)(v13 + 2);
          if (_citrus_mapper_open())
            goto LABEL_13;
          mapdir_from_key = _citrus_mapper_get_mapdir_from_key();
          v14[4] = mapdir_from_key;
          if (mapdir_from_key)
          {
            v17.i32[0] = mapdir_from_key;
            v18 = (uint8x8_t)vcnt_s8(v17);
            v18.i16[0] = vaddlv_u8(v18);
            if (v18.i32[0] >= 2u)
              _citrus_mapper_serial_mapper_init_cold_1();
          }
          v19 = *(_QWORD **)(*(_QWORD *)v15 + 24);
          if (v19[1] != 1 || v19[2] != 1 || *v19)
          {
LABEL_13:
            free(v14);
LABEL_14:
            uninit((uint64_t)v12);
            free(v12);
            return result;
          }
          *(_QWORD *)v14 = 0;
          *v12[1] = (uint64_t)v14;
          v12[1] = (uint64_t *)v14;
          _citrus_memory_stream_skip_ws();
        }
        if (*__error())
          goto LABEL_14;
      }
      v20 = *v12;
      if (*v12)
      {
        v21 = *(_DWORD *)(a3 + 64);
        do
        {
          v21 |= *((_DWORD *)v20 + 4);
          v20 = (uint64_t *)*v20;
        }
        while (v20);
        *(_DWORD *)(a3 + 64) = v21;
      }
      *(_QWORD *)(a3 + 8) = v12;
      *(_QWORD *)(a7 + 16) = 1;
      result = 0.0;
      *(_OWORD *)a7 = xmmword_24B74AED0;
    }
    else
    {
      __error();
    }
  }
  return result;
}

void _citrus_mapper_serial_mapper_uninit(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      uninit(v2);
      free(*(void **)(a1 + 8));
    }
  }
}

uint64_t _citrus_mapper_serial_mapper_convert(uint64_t a1, __int128 *a2)
{
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ***v6;
  uint64_t **v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;
  uint8x8_t v12;
  unsigned int v13;
  __int128 v15;
  int *v16;
  uint64_t v17;

  v15 = *a2;
  v3 = (int *)*((_QWORD *)a2 + 2);
  v16 = v3;
  v4 = *(_QWORD *)a2;
  v5 = *v3;
  v6 = *(uint64_t ****)(a1 + 8);
  memcpy(*(void **)a2, *((const void **)a2 + 1), 4 * v5);
  *((_QWORD *)&v15 + 1) = v4;
  v17 = 0;
  v7 = *v6;
  if (!*v6)
    return 0;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = (*(uint64_t (**)(uint64_t *, __int128 *))(*v7[1] + 16))(v7[1], &v15);
    v11 = (v10 >> 29) & 3;
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)(a1 + 64));
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.i32[0] == 1)
      v11 = *(_DWORD *)(a1 + 64);
    v13 = v10 & 0x9FFFFFFF;
    if ((v10 & 0x9FFFFFFF) != 0)
    {
      if (v13 != 6)
      {
        if (*v3 >= (int)v5)
          _citrus_mapper_serial_mapper_convert_cold_1();
        return ((v11 & 3) << 29) | v13;
      }
      v8 = 1;
      v9 = v11;
    }
    else if (*v3 != (_DWORD)v5)
    {
      _citrus_mapper_serial_mapper_convert_cold_3();
    }
    v7 = (uint64_t **)*v7;
  }
  while (v7);
  if ((v8 & 1) == 0)
    return 0;
  if (!v9)
    _citrus_mapper_serial_mapper_convert_cold_2();
  return ((v9 & 3) << 29) | 6u;
}

uint64_t _citrus_mapper_parallel_mapper_convert(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t ***v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t **v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v16;
  int v17;
  unsigned int v18;
  uint8x8_t v19;
  int v20;
  uint64_t v21;
  int v22;
  _QWORD v23[4];
  int v24;

  v24 = 0;
  v23[3] = 0;
  v4 = *a2;
  v3 = a2[1];
  v5 = (_DWORD *)a2[2];
  v6 = *(uint64_t ****)(a1 + 8);
  v7 = *v5;
  v23[0] = &v24;
  v23[2] = &v22;
  if ((int)v7 < 1)
  {
    LODWORD(v8) = 0;
  }
  else
  {
    v8 = 0;
    v21 = v3;
LABEL_3:
    v9 = *v6;
    if (*v6)
    {
      v10 = 0;
      v11 = v3 + 4 * v8;
      do
      {
        v22 = 1;
        v23[1] = v11;
        v12 = (*(uint64_t (**)(uint64_t *, _QWORD *))(*v9[1] + 16))(v9[1], v23);
        v13 = v12 & 0x9FFFFFFF;
        if ((v12 & 0x9FFFFFFF) == 6)
        {
          *(_DWORD *)(v4 + 4 * v8) = v24;
          v10 = 1;
        }
        else
        {
          if (v13 == 4)
          {
            v18 = *(_DWORD *)(a1 + 64);
            v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
            v19.i16[0] = vaddlv_u8(v19);
            if (v19.i32[0] != 1)
              v18 = (v12 >> 29) & 3;
            if ((v18 & (v18 - 1)) != 0)
              LOBYTE(v18) = v18 & 0xFD;
            if ((v10 & 1) != 0)
            {
              *v5 = v8 + 1;
              v20 = 6;
            }
            else
            {
              *v5 = v8;
              v20 = 4;
            }
            return v20 & 0x9FFFFFFF | ((v18 & 3) << 29);
          }
          if (!v13)
          {
            *(_DWORD *)(v4 + 4 * v8++) = v24;
            v3 = v21;
            if (v8 != v7)
              goto LABEL_3;
            LODWORD(v8) = v7;
            goto LABEL_17;
          }
        }
        v9 = (uint64_t **)*v9;
      }
      while (v9);
      *v5 = v8;
      if ((v10 & 1) == 0)
        goto LABEL_18;
      *v5 = v8 + 1;
      v14 = 6;
      goto LABEL_21;
    }
  }
LABEL_17:
  *v5 = v8;
LABEL_18:
  if ((_DWORD)v8 == (_DWORD)v7)
    return 0;
  v14 = 1;
LABEL_21:
  v16 = *(_DWORD *)(a1 + 64);
  if ((v16 & (v16 - 1)) != 0)
    v17 = (v16 << 29) & 0x20000000;
  else
    v17 = v16 << 29;
  return v17 & 0x60000000 | v14;
}

uint64_t _citrus_mapper_serial_mapper_getops(_OWORD *a1)
{
  __int128 v1;

  v1 = *(_OWORD *)&off_2579AF2E0;
  *a1 = _citrus_mapper_serial_mapper_ops;
  a1[1] = v1;
  return 0;
}

uint64_t _citrus_mapper_parallel_mapper_getops(_OWORD *a1)
{
  __int128 v1;

  v1 = *(_OWORD *)&off_2579AF300;
  *a1 = _citrus_mapper_parallel_mapper_ops;
  a1[1] = v1;
  return 0;
}

void uninit(uint64_t a1)
{
  uint64_t *i;
  uint64_t v3;

  for (i = *(uint64_t **)a1; *(_QWORD *)a1; i = *(uint64_t **)a1)
  {
    v3 = *i;
    *(_QWORD *)a1 = *i;
    if (!v3)
      *(_QWORD *)(a1 + 8) = a1;
    _citrus_mapper_close();
    free(i);
  }
}

void _citrus_mapper_serial_mapper_init_cold_1()
{
  __assert_rtn("parse_var", "citrus_mapper_serial.c", 168, "ml->ml_dir == 0 || powerof2(ml->ml_dir)");
}

void _citrus_mapper_serial_mapper_convert_cold_1()
{
  __assert_rtn("_citrus_mapper_serial_mapper_convert", "citrus_mapper_serial.c", 333, "*cnt < incnt");
}

void _citrus_mapper_serial_mapper_convert_cold_2()
{
  __assert_rtn("_citrus_mapper_serial_mapper_convert", "citrus_mapper_serial.c", 347, "tdir != 0");
}

void _citrus_mapper_serial_mapper_convert_cold_3()
{
  __assert_rtn("_citrus_mapper_serial_mapper_convert", "citrus_mapper_serial.c", 341, "*cnt == incnt");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_skip_nonws()
{
  return MEMORY[0x24BEDBE50]();
}

uint64_t _citrus_mapper_close()
{
  return MEMORY[0x24BEDBEC8]();
}

uint64_t _citrus_mapper_get_mapdir_from_key()
{
  return MEMORY[0x24BEDBED0]();
}

uint64_t _citrus_mapper_open()
{
  return MEMORY[0x24BEDBED8]();
}

uint64_t _citrus_memory_stream_chr()
{
  return MEMORY[0x24BEDBEE0]();
}

uint64_t _citrus_memory_stream_skip_ws()
{
  return MEMORY[0x24BEDBEF0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

