unint64_t systemstats_foreach_micro(unint64_t a1, uint64_t a2, char a3, void *a4)
{
  unsigned int (**v7)(id, unint64_t, unint64_t, unint64_t, unint64_t);
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;

  v7 = a4;
  if ((a2 & 0x8000000000000000) == 0)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = a1 + a2;
    v13 = a1;
    while (v13 != v12 || (a3 & 1) == 0)
    {
      if (v13 != v12)
      {
        if (v13 + 4 > v12)
          break;
        v8 = *(_DWORD *)v13;
      }
      v14 = v8 == 835010577 || v13 == v12;
      if (v14 && v11)
      {
        if (!v7[2](v7, v11, v10, v9, v13 - v11))
          break;
        v11 = 0;
        v10 = 0;
        v9 = 0;
        a1 = v13;
      }
      if (v13 == v12)
        break;
      switch(v8)
      {
        case -557122643:
          v15 = v13 + 293;
          if (v13 + 293 <= v12)
          {
            v16 = *(_DWORD *)(v13 + 56);
            v17 = v15 + 20 * v16;
            v15 += 24 * v16;
            if ((*(_BYTE *)(v13 + 80) & 1) == 0)
              v15 = v17;
          }
          v10 = v13;
          break;
        case -17958194:
          v15 = v13 + 316;
          if (v13 + 316 <= v12)
          {
            v18 = 324;
            if ((*(_BYTE *)(v13 + 68) & 4) == 0)
              v18 = 316;
            if ((*(_BYTE *)(v13 + 68) & 2) != 0)
              v19 = 4;
            else
              v19 = 3;
            v20 = v13 + v18 + ((unint64_t)*(unsigned int *)(v13 + 4) << v19);
            if ((*(_BYTE *)(v13 + 68) & 1) != 0)
            {
              if ((*(_BYTE *)(v13 + 68) & 8) != 0)
                v21 = 3;
              else
                v21 = 4;
            }
            else
            {
              v21 = 2;
              if ((*(_BYTE *)(v13 + 68) & 8) == 0)
                v21 = 3;
            }
            v15 = v20 + ((unint64_t)*(unsigned int *)(v13 + 8) << v21);
          }
          v9 = v13;
          break;
        case 835010577:
          v15 = v13 + 27;
          v11 = v13;
          break;
        default:
          a1 = 0;
          goto LABEL_44;
      }
      if (v15 <= v12)
      {
        v13 = v15;
        if (v15 >= a1)
          continue;
      }
      break;
    }
  }
LABEL_44:

  return a1;
}

unint64_t sub_2144ABAF8(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  _BOOL4 v3;
  uint64_t v4;
  timeval v5;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 200))
  {
    v1 = result;
    v2 = now_in_absolute_milliseconds();
    v5.tv_sec = 0;
    *(_QWORD *)&v5.tv_usec = 0;
    systemstats_gettimeofday(&v5, 0);
    v3 = sub_2144ABD74(*(_QWORD **)(v1 + 32), v2, &v5);
    v4 = *(_QWORD *)(v1 + 32);
    if (v3)
    {
      sub_2144AF2B4(v4, v2, &v5, 0);
      v4 = *(_QWORD *)(v1 + 32);
      if ((*(_BYTE *)(*(_QWORD *)(v4 + 8) + 16) & 1) != 0)
      {
        sub_2144AF408(v4, 0, 0, 0, 0);
        v4 = *(_QWORD *)(v1 + 32);
      }
    }
    result = _systemstats_retried_write(v4, *(void **)(v1 + 40), *(_QWORD *)(v1 + 48));
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 176) = v2;
  }
  return result;
}

unint64_t _systemstats_retried_write(uint64_t a1, void *a2, size_t __nbyte)
{
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[5];

  v4 = *(_DWORD *)(a1 + 88);
  if (v4 == -1 || *(_BYTE *)(a1 + 200))
    return 0;
  v5 = __nbyte;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 2) == 0)
  {
    sub_2144AF1C8(v4, a2, __nbyte);
    *(int64x2_t *)(a1 + 112) = vaddq_s64(*(int64x2_t *)(a1 + 112), vdupq_n_s64(v5));
LABEL_11:
    nullsub_1(*(unsigned int *)(a1 + 88));
    return v5;
  }
  gzwrite(*(gzFile *)(a1 + 184), a2, __nbyte);
  v6 = MEMORY[0x2199CEFE0](*(_QWORD *)(a1 + 184));
  if (v6 < 1)
    goto LABEL_11;
  v7 = *(_QWORD *)(a1 + 112);
  v8 = __OFSUB__(v6, v7);
  v9 = v6 - v7;
  if (v9 < 0 == v8)
  {
    v11 = v9 + *(_QWORD *)(a1 + 120);
    *(_QWORD *)(a1 + 112) = v6;
    *(_QWORD *)(a1 + 120) = v11;
    goto LABEL_11;
  }
  *(_BYTE *)(a1 + 200) = 1;
  v10 = *(NSObject **)(a1 + 104);
  if (v10)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_2144AF25C;
    block[3] = &unk_24D19E7E0;
    block[4] = a1;
    dispatch_async(v10, block);
    goto LABEL_11;
  }
  return 0;
}

void systemstats_write_microstackshot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _QWORD block[7];

  v3 = *(NSObject **)(a1 + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_2144ABAF8;
  block[3] = &unk_24D19E800;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  dispatch_sync(v3, block);
}

uint64_t now_in_absolute_milliseconds()
{
  uint64_t v0;
  uint64_t *v1;

  v0 = systemstats_mach_absolute_time();
  v1 = sub_2144ABD30();
  return *v1 * v0 / v1[1];
}

uint64_t *sub_2144ABD30()
{
  if (qword_253E79078 != -1)
    dispatch_once(&qword_253E79078, &unk_24D19E618);
  return &qword_253E79080;
}

BOOL sub_2144ABD74(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a1[22];
  if (a2 < v3)
    sub_2144B1480();
  v4 = a1[1];
  if ((*(_BYTE *)(v4 + 16) & 4) != 0)
    return 0;
  if (v3 && a2 - v3 < *(_QWORD *)(v4 + 24))
  {
    v5 = a1[14];
  }
  else
  {
    v5 = a1[14];
    if (v5 >= a1[16])
      return 1;
  }
  if (v5 < *(_QWORD *)(v4 + 32))
    return *a3 - a1[17] > 86400;
  return 1;
}

unint64_t absolute_time_to_absolute_milliseconds(uint64_t a1)
{
  uint64_t *v2;

  v2 = sub_2144ABD30();
  return *v2 * a1 / (unint64_t)v2[1];
}

double absolute_time_to_absolute_milliseconds_double(unint64_t a1)
{
  unint64_t *v2;

  v2 = (unint64_t *)sub_2144ABD30();
  return (double)a1 * (double)*v2 / (double)v2[1];
}

uint64_t now_in_continuous_milliseconds()
{
  uint64_t v0;
  uint64_t *v1;

  v0 = systemstats_mach_continuous_time();
  v1 = sub_2144ABD30();
  return *v1 * v0 / v1[1];
}

void *_systemstats_writers()
{
  return &unk_24D19E090;
}

double sub_2144ABEA4(uint64_t a1, int a2)
{
  double result;

  *(_QWORD *)&result = 4;
  *(_OWORD *)a1 = xmmword_2144B1B50;
  *(_DWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a1 + 32;
  return result;
}

void sub_2144ABEC0(_QWORD *a1)
{
  _QWORD *v2;

  if (*a1 >= 0x4000uLL)
    sub_2144B04D4();
  v2 = (_QWORD *)a1[3];
  if (v2 != a1 + 4)
    free(v2);
}

uint64_t sub_2144ABEFC(uint64_t result, size_t *a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  char __src;
  char v9;

  if (a3)
  {
    v3 = a3;
    v5 = (8 * result);
    do
    {
      __src = v5 & 0x7F | ((v5 > 0x7F) << 7);
      sub_2144AC0C8(a2, &__src, 1uLL);
      v6 = v5 >= 0x7F;
      v7 = v5 == 127;
      v5 >>= 7;
    }
    while (!v7 && v6);
    do
    {
      v9 = v3 & 0x7F | ((v3 > 0x7F) << 7);
      result = (uint64_t)sub_2144AC0C8(a2, &v9, 1uLL);
      v6 = v3 >= 0x7F;
      v7 = v3 == 127;
      v3 >>= 7;
    }
    while (!v7 && v6);
  }
  return result;
}

void *sub_2144ABF94(void *result, size_t *a2, void *a3, size_t a4)
{
  unint64_t v7;
  BOOL v8;
  size_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  char __src;
  char v14;
  char v15;

  if (a3 && a4)
  {
    v7 = (8 * (_DWORD)result) | 2u;
    do
    {
      __src = v7 & 0x7F | ((v7 > 0x7F) << 7);
      sub_2144AC0C8(a2, &__src, 1uLL);
      v8 = v7 > 0x7F;
      v7 >>= 7;
    }
    while (v8);
    v9 = 16382 - *a2;
    if (a4 >= v9)
    {
      if (a4 != v9)
        _os_assumes_log();
      v12 = v9;
      do
      {
        v15 = v12 & 0x7F | ((v12 > 0x7F) << 7);
        sub_2144AC0C8(a2, &v15, 1uLL);
        v8 = v12 > 0x7F;
        v12 >>= 7;
      }
      while (v8);
    }
    else
    {
      v10 = a4;
      do
      {
        v14 = v10 & 0x7F | ((v10 > 0x7F) << 7);
        sub_2144AC0C8(a2, &v14, 1uLL);
        v11 = v10 >= 0x80;
        v10 >>= 7;
      }
      while (v11);
      v9 = a4;
    }
    return sub_2144AC0C8(a2, a3, v9);
  }
  return result;
}

void *sub_2144AC0C8(size_t *a1, void *__src, size_t __n)
{
  size_t v5;
  unint64_t v6;
  unint64_t v8;
  size_t *v9;
  void *v10;
  unint64_t v11;
  size_t v12;
  size_t *v13;
  void *result;
  size_t v15;
  size_t v16;

  if (__n >> 14 || (v5 = *a1, v6 = *a1 + __n, v6 >= 0x4000))
    abort();
  v8 = a1[1];
  v9 = (size_t *)a1[3];
  if (v6 > v8)
  {
    if (v9 == a1 + 4)
      v10 = 0;
    else
      v10 = (void *)a1[3];
    v11 = 2 * v8;
    if (v11 > v6)
      v6 = v11;
    if (v6 >= 0x3FFF)
      v12 = 0x3FFFLL;
    else
      v12 = v6;
    a1[1] = v12;
    v13 = (size_t *)reallocf(v10, v12);
    a1[3] = (size_t)v13;
    if (!v13)
      sub_2144B04D4();
    v9 = v13;
    v5 = *a1;
    if (!v10)
      memcpy(v13, a1 + 4, *a1);
  }
  result = memcpy((char *)v9 + v5, __src, __n);
  v15 = a1[1];
  v16 = *a1 + __n;
  *a1 = v16;
  if (v16 > v15)
    sub_2144B04D4();
  return result;
}

void *sub_2144AC1B0(void *result, size_t *a2, char *__s)
{
  void *v5;
  size_t v6;

  if (__s)
  {
    v5 = result;
    v6 = strlen(__s);
    return sub_2144ABF94(v5, a2, __s, v6);
  }
  return result;
}

uint64_t sub_2144AC1FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  char __src;
  char v12;

  v2 = *(_QWORD *)a1 - 4;
  if (*(_QWORD *)a1 == 4)
    v3 = 1;
  else
    v3 = (flsll(*(_QWORD *)a1 - 4) - 1) / 7 + 1;
  v4 = (8 * *(_DWORD *)(a1 + 16)) | 2u;
  v5 = (flsll(v4) - 1) / 7 + 1;
  v6 = v3 + v5;
  if (v6 >= 5)
    sub_2144B04D4();
  v7 = 4 - v3;
  *(_QWORD *)a1 = v7 - v5;
  do
  {
    __src = v4 & 0x7F | ((v4 > 0x7F) << 7);
    sub_2144AC0C8((size_t *)a1, &__src, 1uLL);
    v8 = v4 > 0x7F;
    v4 >>= 7;
  }
  while (v8);
  if (*(_QWORD *)a1 != v7)
    sub_2144B04D4();
  v9 = v2;
  do
  {
    v12 = v9 & 0x7F | ((v9 > 0x7F) << 7);
    sub_2144AC0C8((size_t *)a1, &v12, 1uLL);
    v8 = v9 > 0x7F;
    v9 >>= 7;
  }
  while (v8);
  if (*(_QWORD *)a1 != 4)
    sub_2144B04D4();
  *(_QWORD *)a1 = v6 + v2;
  return *(_QWORD *)(a1 + 24) - v6 + 4;
}

double systemstats_create_record(int a1)
{
  _DWORD *v2;
  double result;

  v2 = malloc_type_malloc(0xA0uLL, 0x10100405638ECB9uLL);
  *(_QWORD *)&result = 4;
  *(_OWORD *)v2 = xmmword_2144B1B50;
  v2[4] = a1;
  *((_QWORD *)v2 + 3) = v2 + 8;
  return result;
}

void systemstats_insert_and_dispose_subrecord(size_t *a1, uint64_t a2)
{
  sub_2144ABF94((void *)*(unsigned int *)(a2 + 16), a1, (void *)(*(_QWORD *)(a2 + 24) + 4), *(_QWORD *)a2 - 4);
  sub_2144ABEC0((_QWORD *)a2);
  free((void *)a2);
}

void systemstats_write_and_dispose_record(_BYTE *a1, uint64_t *a2)
{
  uint64_t v4;

  if (a1 && *a1)
  {
    v4 = sub_2144AC1FC((uint64_t)a2);
    _systemstats_queued_write((uint64_t)a1, v4, *a2);
    sub_2144ABEC0(a2);
    free(a2);
  }
  else
  {
    _os_assumes_log();
  }
}

void systemstats_dispose_record(_QWORD *a1)
{
  sub_2144ABEC0(a1);
  free(a1);
}

uint64_t systemstats_write_checkpoint(_BYTE *a1)
{
  uint64_t v2;
  _DWORD *v3;

  v2 = now_in_absolute_milliseconds();
  v3 = malloc_type_malloc(0xA0uLL, 0x10100405638ECB9uLL);
  *(_OWORD *)v3 = xmmword_2144B1B50;
  v3[4] = 36;
  *((_QWORD *)v3 + 3) = v3 + 8;
  sub_2144ABEFC(1, (size_t *)v3, v2);
  systemstats_write_and_dispose_record(a1, (uint64_t *)v3);
  return v2;
}

uint64_t sub_2144AC504()
{
  return _os_assert_log();
}

void _systemstats_enumerate_files(const char *a1, const char *a2, const char *a3, const char **a4, size_t *a5, uint64_t a6, void *a7)
{
  void (**v12)(id, uint64_t, _QWORD, stat *);
  const char *v13;
  DIR *v14;
  DIR *v15;
  dirent *v16;
  const char *v17;
  dirent *v18;
  char v19;
  unint64_t d_namlen;
  uint64_t v21;
  size_t v22;
  size_t v23;
  int v24;
  const char *v25;
  const char **v26;
  size_t *v27;
  uint64_t v28;
  void (**v29)(id, uint64_t, _QWORD, stat *);
  int v30;
  int v31;
  stat v33;
  uuid_t uu;
  char in[16];
  _BYTE v36[21];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  if (a1)
    v13 = a1;
  else
    v13 = "/private/var/db/systemstats";
  v14 = opendir(v13);
  if (v14)
  {
    v15 = v14;
    v31 = (int)v13;
    v30 = dirfd(v14);
    v16 = readdir(v15);
    v17 = a2;
    if (v16)
    {
      v18 = v16;
      do
      {
        if (v18->d_type == 8 && v18->d_namlen > 0x27u)
        {
          *(_OWORD *)in = 0u;
          memset(v36, 0, sizeof(v36));
          __strlcpy_chk();
          memset(uu, 0, sizeof(uu));
          if (!uuid_parse(in, uu)
            && (!v17 || !strncmp(v17, in, 0x25uLL))
            && (!a3 || strncmp(a3, in, 0x25uLL))
            && v18->d_name[36] == 46)
          {
            if (!a6)
              goto LABEL_24;
            v25 = a3;
            v26 = a4;
            v28 = a6;
            v29 = v12;
            v19 = 0;
            d_namlen = v18->d_namlen;
            v27 = a5;
            v21 = a6;
            do
            {
              v23 = *a5++;
              v22 = v23;
              if (v23 + 38 <= d_namlen && !strncmp(&v18->d_name[37], *a4, v22))
                v19 |= v18->d_name[v22 + 37] == 46;
              ++a4;
              --v21;
            }
            while (v21);
            a6 = v28;
            v12 = v29;
            a4 = v26;
            a5 = v27;
            a3 = v25;
            v17 = a2;
            if ((v19 & 1) != 0)
            {
LABEL_24:
              memset(&v33, 0, sizeof(v33));
              v24 = sub_2144ACBCC(v31, v30, v18->d_name, &v33);
              if (v24)
              {
                if (v24 == -1)
                  sub_2144B04E8();
              }
              else
              {
                v12[2](v12, (uint64_t)v18->d_name, v18->d_namlen, &v33);
              }
            }
          }
        }
        v18 = readdir(v15);
      }
      while (v18);
    }
    closedir(v15);
  }
  else if (*__error())
  {
    _os_assumes_log();
  }

}

void systemstats_delete_old_files(const char *a1, const char *a2, char *__s, uint64_t a4, _QWORD *a5)
{
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  const char *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v48 = __s;
  if (a1)
    v7 = a1;
  else
    v7 = "/private/var/db/systemstats";
  v8 = *a5 - 345600;
  v47 = strlen(__s);
  context = (void *)MEMORY[0x2199CF0D0]();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = sub_2144ACADC;
  v36[3] = &unk_24D19E5D8;
  v41 = v7;
  v42 = v8;
  v12 = v9;
  v37 = v12;
  v13 = v10;
  v38 = v13;
  v14 = v11;
  v39 = v14;
  v40 = &v43;
  _systemstats_enumerate_files(v7, 0, a2, &v48, &v47, 1, v36);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v15);
        unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18++)), "UTF8String"));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
    }
    while (v16);
  }

  v19 = 4 * a4;
  if (v44[3] > (unint64_t)(4 * a4))
  {
    objc_msgSend(v13, "keysSortedByValueUsingSelector:", sel_compare_);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v29;
LABEL_14:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v20);
        v24 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23));
        unlink((const char *)objc_msgSend(v24, "UTF8String"));
        objc_msgSend(v14, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedIntegerValue");
        v44[3] -= v26;

        if (v44[3] <= v19)
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
          if (v21)
            goto LABEL_14;
          break;
        }
      }
    }

  }
  _Block_object_dispose(&v43, 8);

  objc_autoreleasePoolPop(context);
}

void sub_2144ACAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_2144ACADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v6 = *(_QWORD *)(a4 + 48);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s/%s"), *(_QWORD *)(a1 + 64), a2);
  if (v6 >= *(_QWORD *)(a1 + 72))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", (double)v6);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a4 + 96));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v9);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += *(_QWORD *)(a4 + 96);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }

}

uint64_t sub_2144ACBCC(int a1, int a2, char *a3, stat *a4)
{
  return fstatat(a2, a3, a4, 32);
}

uint64_t sub_2144ACBE0()
{
  uint64_t v0;
  uint64_t result;
  mach_timebase_info info;

  v0 = 1000000;
  info = 0;
  result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    result = _os_assumes_log();
    goto LABEL_5;
  }
  if (!info.denom)
  {
LABEL_5:
    qword_253E79080 = 1;
    goto LABEL_6;
  }
  qword_253E79080 = info.numer;
  v0 = 1000000 * info.denom;
LABEL_6:
  qword_253E79088 = v0;
  return result;
}

BOOL _systemstats_get_system_version(char *a1, size_t a2)
{
  int v4;
  size_t v6;
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  *(_QWORD *)v7 = 0x4100000001;
  v4 = sysctl(v7, 2u, a1, &v6, 0, 0);
  if (v4 == -1)
    sub_2144B04E8();
  a1[a2 - 1] = 0;
  return v4 == 0;
}

uint64_t sub_2144ACCFC(unsigned __int8 *a1)
{
  int v2;
  size_t v4;
  char in[16];
  _BYTE v6[21];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)in = 0u;
  memset(v6, 0, sizeof(v6));
  v4 = 37;
  v2 = sysctlbyname("kern.bootsessionuuid", in, &v4, 0, 0);
  if (v2 || (v6[20] = 0, (v2 = uuid_parse(in, a1)) != 0))
  {
    if (v2 == -1)
      sub_2144B04E8();
    uuid_generate_random(a1);
  }
  return 1;
}

unint64_t now_in_wall_milliseconds()
{
  int v0;
  int v1;
  unint64_t result;
  timeval v3;

  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  v0 = systemstats_gettimeofday(&v3, 0);
  if (!v0)
    return 1000 * v3.tv_sec + v3.tv_usec / 0x3E8uLL;
  v1 = v0;
  result = 0;
  if (v1 == -1)
  {
    sub_2144B04E8();
    return 0;
  }
  return result;
}

uint64_t sub_2144ACE24(const char *a1, void *a2, size_t a3)
{
  int v5;
  int v6;
  ssize_t v7;

  v5 = open(a1, 0);
  if (v5 < 0)
    return -1;
  v6 = v5;
  do
    v7 = read(v6, a2, a3);
  while (v7 == -1 && *__error() == 4);
  if (close(v6) == -1)
    sub_2144B04E8();
  return v7;
}

uint64_t _systemstats_read_uuid(const char *a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = sub_2144ACE24(a1, a3, 0x25uLL);
  if (v5 == 37)
  {
    a3[36] = 0;
    if (uuid_parse(a3, a2))
    {
      _os_assumes_log();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (v5 == -1 && *__error() != 2)
      sub_2144B04E8();
    _os_assumes_log();
    result = 0;
    *a3 = 0;
  }
  return result;
}

BOOL _systemstats_read_current_build(const char *a1, _BYTE *a2, size_t a3)
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v6;
  int v7;
  _BOOL4 v8;

  v3 = 0;
  if (a2 && a3)
  {
    v4 = a2;
    v6 = sub_2144ACE24(a1, a2, a3);
    v3 = v6 != -1;
    if (v6 == -1)
    {
      v7 = *__error();
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v7 == 2)
      {
        if (v8)
          sub_2144B0504((uint64_t)a1);
      }
      else if (v8)
      {
        sub_2144B0580((uint64_t)a1);
      }
    }
    else
    {
      v4 = &v4[v6 - 1];
    }
    *v4 = 0;
  }
  return v3;
}

char *_systemstats_copy_cookie_path(const char *a1, const char *a2)
{
  const char *v2;
  char *v4;

  v4 = 0;
  v2 = "/private/var/db/systemstats";
  if (a1)
    v2 = a1;
  asprintf(&v4, "%s/%s", v2, a2);
  return v4;
}

uint64_t _systemstats_read_uuid_from_cookie_path(const char *a1, const char *a2, unsigned __int8 *a3, _BYTE *a4)
{
  uint64_t uuid;
  const char *v7;
  char *v8;
  char *v10;

  uuid = 0;
  if (a2 && a3 && a4)
  {
    v10 = 0;
    v7 = "/private/var/db/systemstats";
    if (a1)
      v7 = a1;
    asprintf(&v10, "%s/%s", v7, a2);
    v8 = v10;
    if (v10)
    {
      uuid = _systemstats_read_uuid(v10, a3, a4);
      free(v8);
    }
    else
    {
      return 0;
    }
  }
  return uuid;
}

void systemstats_unlink_if_present(const char *a1, const char *a2)
{
  const char *v3;
  char *v4;
  stat v5;

  *(_QWORD *)&v5.st_dev = 0;
  v3 = "/private/var/db/systemstats";
  if (a1)
    v3 = a1;
  asprintf((char **)&v5, "%s/%s", v3, a2);
  if (a2)
  {
    v4 = *(char **)&v5.st_dev;
    memset(&v5, 0, sizeof(v5));
    if (!stat(v4, &v5))
      unlink(v4);
    free(v4);
  }
}

BOOL sub_2144AD144()
{
  stat v1;

  if (getenv("DISABLE_FDR") || getenv("DISABLE_SYSTEMSTATS"))
    return 0;
  memset(&v1, 0, sizeof(v1));
  return stat("/private/var/db/systemstats/disabled", &v1) != 0;
}

void get_microstackshots_from_files(const char *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t uint64;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  _BYTE v49[21];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v7)
    sub_2144B0690(v7, v8, v9, v10, v11, v12, v13, v14);
  if (!v5)
  {
    uint64 = 0;
    v17 = 0;
    v18 = 0;
    v16 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0u;
    memset(v49, 0, sizeof(v49));
    goto LABEL_9;
  }
  uint64 = xpc_dictionary_get_uint64(v5, "time");
  v16 = xpc_dictionary_get_uint64(v5, "pid");
  v17 = xpc_dictionary_get_uint64(v5, "uniqueid");
  v18 = xpc_dictionary_get_uint64(v5, "type");
  v50 = 0;
  v51 = 0;
  v48 = 0u;
  memset(v49, 0, sizeof(v49));
  if (!xpc_dictionary_get_BOOL(v5, "currentBoot"))
  {
LABEL_9:
    v19 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    goto LABEL_10;
  }
  v19 = (const char *)&v48;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  if (!_systemstats_read_uuid_from_cookie_path(a1, "current_boot_uuid", (unsigned __int8 *)&v50, &v48))
    v19 = 0;
LABEL_10:
  v20 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_2144AD49C;
  v33[3] = &unk_24D19E640;
  v39 = v16;
  v36 = v17;
  v37 = v18;
  v38 = uint64;
  v21 = v6;
  v34 = v21;
  v35 = &v40;
  v22 = v33;
  v46[0] = v20;
  v46[1] = 3221225472;
  v46[2] = sub_2144AE538;
  v46[3] = &unk_24D19E6B8;
  v47 = v22;
  v23 = v22;
  v24 = (void *)MEMORY[0x2199CF184](v46);
  v44[0] = v20;
  v44[1] = 3221225472;
  v44[2] = sub_2144AE708;
  v44[3] = &unk_24D19E6E0;
  v45 = v24;
  v25 = v24;
  sub_2144AE558(a1, v19, uint64, v44);

  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v21 + 2))(v21, 1, 0, 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    sub_2144B061C((uint64_t)&v41, v26, v27, v28, v29, v30, v31, v32);

  _Block_object_dispose(&v40, 8);
}

void sub_2144AD47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2144AD49C(uint64_t a1, void *bytes, uint64_t a3, int a4, size_t length)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if ((!a3 || (v6 = *(_DWORD *)(a1 + 72)) == 0 || *(_DWORD *)(a3 + 4) == v6)
    && (!a3 || (v7 = *(_QWORD *)(a1 + 48)) == 0 || *(_QWORD *)(a3 + 8) == v7))
  {
    v8 = *(_QWORD *)(a1 + 56);
    if ((!v8 || (v8 & *((_BYTE *)bytes + 24)) != 0) && *((_QWORD *)bytes + 1) >= *(_QWORD *)(a1 + 64))
    {
      v9 = xpc_data_create(bytes, length);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    }
  }
}

uint64_t systemstats_microstackshot_checkpoint_async(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  uint32_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  int out_token;

  v1 = a1;
  out_token = 0;
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2144AD640;
  v7[3] = &unk_24D19E668;
  v3 = v1;
  v8 = v3;
  v4 = notify_register_dispatch("com.apple.telemetry.immediate-done", &out_token, v2, v7);

  v5 = 0;
  if (!v4)
  {
    if (notify_post("com.apple.telemetry.immediate"))
    {
      notify_cancel(out_token);
      v5 = 0;
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

uint64_t sub_2144AD640(uint64_t a1, int token)
{
  notify_cancel(token);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t systemstats_persistence_is_allowed()
{
  CFPropertyListRef v0;
  const void *v1;
  CFTypeID v2;
  BOOL v3;
  CFTypeID v4;
  uint64_t v5;
  CFTypeID v6;
  CFStringRef v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v0 = CFPreferencesCopyValue(CFSTR("allowMicrostackshotPersistence"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID())
    {
      v17[0] = 0;
      if (CFNumberGetValue((CFNumberRef)v1, kCFNumberSInt64Type, v17) && v17[0] < 2uLL)
      {
        v3 = v17[0] == 0;
LABEL_8:
        v5 = !v3;
        CFRelease(v1);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          LODWORD(v17[0]) = 67109120;
          HIDWORD(v17[0]) = v5;
          _os_log_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "allowMicrostackshotPersistence setting: %d", (uint8_t *)v17, 8u);
        }
        return v5;
      }
    }
    else
    {
      v4 = CFGetTypeID(v1);
      if (v4 == CFBooleanGetTypeID())
      {
        v3 = CFBooleanGetValue((CFBooleanRef)v1) == 0;
        goto LABEL_8;
      }
    }
    v6 = CFGetTypeID(v1);
    v7 = CFCopyTypeIDDescription(v6);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      sub_2144B0734();
    CFRelease(v7);
    CFRelease(v1);
  }
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v8)
    sub_2144B06C4(v8, v9, v10, v11, v12, v13, v14, v15);
  return 1;
}

BOOL systemstats_cpu_hotspot_report_allowed_by_tasking()
{
  double v0;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int has_internal_diagnostics;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = 0.0;
  if (!sub_2144AD954(CFSTR("cpuHotspotReportPercentage"), &v20))
  {
LABEL_8:
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (has_internal_diagnostics)
    {
      if (v11)
        sub_2144B07A8(v11, v12, v13, v14, v15, v16, v17, v18);
      v0 = 100.0;
    }
    else
    {
      v0 = 0.0;
      if (v11)
        sub_2144B0818(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return sub_2144ADA40(v0);
  }
  v0 = v20;
  if (v20 < 0.0 || v20 > 100.0)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v2)
      sub_2144B0884(v2, v3, v4, v5, v6, v7, v8, v9);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v0;
    _os_log_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "cpuHotspotReportPercentage setting: %.1f", buf, 0xCu);
  }
  return sub_2144ADA40(v0);
}

uint64_t sub_2144AD954(const __CFString *a1, _QWORD *a2)
{
  CFPropertyListRef v4;
  const void *v5;
  CFTypeID v6;
  uint64_t v7;
  CFTypeID v8;
  CFStringRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t valuePtr;

  v4 = CFPreferencesCopyValue(a1, CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID() && (valuePtr = 0, CFNumberGetValue((CFNumberRef)v5, kCFNumberDoubleType, &valuePtr)))
  {
    *a2 = valuePtr;
    v7 = 1;
  }
  else
  {
    v8 = CFGetTypeID(v5);
    v9 = CFCopyTypeIDDescription(v8);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      sub_2144B08F0((uint64_t)a1, (uint64_t)v9, (uint64_t)v5, v10, v11, v12, v13, v14);
    CFRelease(v9);
    v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

BOOL sub_2144ADA40(double a1)
{
  double v2;
  _BOOL8 result;

  if (a1 <= 0.0)
    return 0;
  if (a1 >= 100.0)
    return 1;
  if (qword_254D78620 != -1)
    dispatch_once(&qword_254D78620, &unk_24D19E748);
  v2 = (double)rand() * 100.0 / 2147483650.0;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v2 <= a1)
  {
    if (result)
      sub_2144B0970();
    return 1;
  }
  if (result)
  {
    sub_2144B09D8();
    return 0;
  }
  return result;
}

BOOL systemstats_io_hotspot_report_allowed_by_tasking()
{
  double v0;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int has_internal_diagnostics;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = 0.0;
  if (!sub_2144AD954(CFSTR("ioHotspotReportPercentage"), &v20))
  {
LABEL_8:
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (has_internal_diagnostics)
    {
      if (v11)
        sub_2144B0A40(v11, v12, v13, v14, v15, v16, v17, v18);
      v0 = 100.0;
    }
    else
    {
      v0 = 0.0;
      if (v11)
        sub_2144B0AB0(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return sub_2144ADA40(v0);
  }
  v0 = v20;
  if (v20 < 0.0 || v20 > 100.0)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v2)
      sub_2144B0B1C(v2, v3, v4, v5, v6, v7, v8, v9);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v0;
    _os_log_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "cpuHotspotReportPercentage setting: %.1f", buf, 0xCu);
  }
  return sub_2144ADA40(v0);
}

uint64_t systemstats_get_pmi_cycle_interval()
{
  uint64_t v0;
  CFPropertyListRef v1;
  const void *v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID v6;
  CFStringRef v7;
  unint64_t valuePtr;

  v0 = 10000000000;
  v1 = CFPreferencesCopyValue(CFSTR("microstackshotPMICycleInterval"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFNumberGetTypeID()
      && (valuePtr = 0, CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt64Type, &valuePtr)))
    {
      v4 = valuePtr;
      CFRelease(v2);
      if (v4 - 1 < 0x3B9AC9FF)
        v5 = 1000000000;
      else
        v5 = v4;
      if (v4 <= 0x174876E800)
        return v5;
      else
        return 100000000000;
    }
    else
    {
      v6 = CFGetTypeID(v2);
      v7 = CFCopyTypeIDDescription(v6);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        sub_2144B0B88();
      CFRelease(v7);
      CFRelease(v2);
    }
  }
  return v0;
}

void systemstats_get_microstackshots(void *a1, void *a2)
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  intptr_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t uint64;
  int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;

  v3 = a1;
  v4 = a2;
  if ((systemstats_persistence_is_allowed() & 1) != 0)
  {
    v5 = dispatch_semaphore_create(0);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_2144ADFFC;
    v35[3] = &unk_24D19E690;
    v6 = v5;
    v36 = v6;
    if (systemstats_microstackshot_checkpoint_async(v35))
    {
      v7 = dispatch_time(0, 10000000000);
      v8 = dispatch_semaphore_wait(v6, v7);
      v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v9)
          sub_2144B0C30(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      else if (v9)
      {
        sub_2144B0BFC(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    get_microstackshots_from_files("/private/var/db/systemstats", v3, v4);

  }
  else
  {
    v6 = v3;
    v17 = v4;
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v18)
      sub_2144B0CCC(v18, v19, v20, v21, v22, v23, v24, v25);
    v26 = malloc_type_malloc(0x10000uLL, 0x385B420AuLL);
    if (v26)
    {
      v27 = v26;
      v28 = __microstackshot();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        sub_2144B0C64();
      if (v28 <= 0x10000)
      {
        if (v6)
        {
          uint64 = xpc_dictionary_get_uint64(v6, "time");
          v30 = xpc_dictionary_get_uint64(v6, "pid");
          v31 = xpc_dictionary_get_uint64(v6, "uniqueid");
          v32 = xpc_dictionary_get_uint64(v6, "type");
        }
        else
        {
          uint64 = 0;
          v31 = 0;
          v32 = 0;
          v30 = 0;
        }
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = sub_2144AE9F4;
        v37[3] = &unk_24D19E770;
        v42 = v30;
        v39 = v31;
        v40 = v32;
        v41 = uint64;
        v33 = v17;
        v38 = v33;
        v34 = (void *)MEMORY[0x2199CF184](v37);
        systemstats_foreach_micro((unint64_t)v27, v28, 0, v34);
        (*((void (**)(id, uint64_t, _QWORD, _QWORD))v33 + 2))(v33, 1, 0, 0);

      }
      free(v27);
    }

  }
}

intptr_t sub_2144ADFFC(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v2)
    sub_2144B0D00(v2, v3, v4, v5, v6, v7, v8, v9);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t systemstats_copy_microstackshots_to_file(void *a1, int a2)
{
  id v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  intptr_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  int v28;
  gzFile_s *v29;
  gzFile_s *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t uint64;
  _BOOL4 v50;
  const char *v51;
  void *v52;
  _QWORD v54[4];
  NSObject *v55;
  uint8_t buf[8];
  uint64_t v57;
  void (*v58)(uint64_t, void *);
  void *v59;
  uint64_t *v60;
  void *v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  int v67;
  __int128 v68;
  _BYTE v69[21];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if ((a2 & 0x80000000) == 0)
  {
    if ((systemstats_persistence_is_allowed() & 1) != 0)
    {
      v4 = dispatch_semaphore_create(0);
      v5 = MEMORY[0x24BDAC760];
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = sub_2144AE4F8;
      v54[3] = &unk_24D19E690;
      v6 = v4;
      v55 = v6;
      if (systemstats_microstackshot_checkpoint_async(v54))
      {
        v7 = dispatch_time(0, 10000000000);
        v8 = dispatch_semaphore_wait(v6, v7);
        v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v9)
            sub_2144B0C30(v9, v10, v11, v12, v13, v14, v15, v16);
        }
        else if (v9)
        {
          sub_2144B0BFC(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
      v40 = v3;
      v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v41)
        sub_2144B0D70(v41, v42, v43, v44, v45, v46, v47, v48);
      if (v40)
      {
        uint64 = xpc_dictionary_get_uint64(v40, "time");
        v50 = xpc_dictionary_get_BOOL(v40, "currentBoot");
        v70 = 0;
        v71 = 0;
        v68 = 0u;
        memset(v69, 0, sizeof(v69));
        if (v50)
        {
          v51 = (const char *)&v68;
          if (!_systemstats_read_uuid_from_cookie_path("/private/var/db/systemstats", "current_boot_uuid", (unsigned __int8 *)&v70, &v68))v51 = 0;
        }
        else
        {
          v51 = 0;
        }
      }
      else
      {
        uint64 = 0;
        v51 = 0;
        v70 = 0;
        v71 = 0;
        v68 = 0u;
        memset(v69, 0, sizeof(v69));
      }
      v52 = malloc_type_malloc(0x100000uLL, 0x4A187E97uLL);
      v64 = 0;
      v65 = &v64;
      v66 = 0x2020000000;
      v67 = 1;
      *(_QWORD *)buf = v5;
      v57 = 3221225472;
      v58 = sub_2144AEA94;
      v59 = &unk_24D19E7C0;
      v60 = &v64;
      v61 = v52;
      v62 = a2;
      v63 = 0x100000;
      sub_2144AE558("/private/var/db/systemstats", v51, uint64, buf);
      free(v52);
      v17 = *((unsigned int *)v65 + 6);
      _Block_object_dispose(&v64, 8);

      goto LABEL_50;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Persistence disallowed, copying only live microstackshots", buf, 2u);
    }
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v18)
      sub_2144B0CCC(v18, v19, v20, v21, v22, v23, v24, v25);
    v26 = malloc_type_malloc(0x10000uLL, 0x51422A9AuLL);
    if (v26)
    {
      v27 = __microstackshot();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        sub_2144B0C64();
      if (v27 <= 0x10000)
      {
        v28 = dup(a2);
        if (v28 < 0)
        {
          v17 = *__error();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_2144B0E0C();
        }
        else
        {
          v29 = gzdopen(a2, "ab");
          v30 = v29;
          if (v29)
          {
            *(_DWORD *)buf = 0;
            if (gzwrite(v29, v26, 0x10000u) != 0x10000)
            {
              v31 = gzerror(v30, (int *)buf);
              v32 = *(unsigned int *)buf;
              if (*(_DWORD *)buf == -1)
              {
                *(_DWORD *)buf = *__error();
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  sub_2144B0E74();
              }
              else
              {
                v33 = (uint64_t)v31;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  sub_2144B0EDC(v33, v32, v34, v35, v36, v37, v38, v39);
              }
            }
            gzclose(v30);
            free(v26);
            v17 = *(unsigned int *)buf;
            goto LABEL_49;
          }
          v17 = *__error();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_2144B0E0C();
          close(v28);
        }
        free(v26);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_2144B0DA4();
        free(v26);
        v17 = 7;
      }
    }
    else
    {
      v17 = 12;
    }
LABEL_49:
    close(a2);
    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_2144B0D34();
  v17 = 22;
LABEL_50:

  return v17;
}

void sub_2144AE4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_2144AE4F8(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v2)
    sub_2144B0D00(v2, v3, v4, v5, v6, v7, v8, v9);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_2144AE538(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

void sub_2144AE558(const char *a1, const char *a2, uint64_t a3, void *a4)
{
  void (**v7)(id, _QWORD);
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  const char *v22;
  uint64_t v23;
  size_t v24;
  const char *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v24 = 15;
  v25 = "microstackshots";
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2144AE95C;
  v20[3] = &unk_24D19E708;
  v22 = a1;
  v23 = a3;
  v9 = v8;
  v21 = v9;
  _systemstats_enumerate_files(a1, a2, 0, &v25, &v24, 1, v20);
  v10 = (void *)MEMORY[0x2199CF0D0]();
  objc_msgSend(v9, "keysSortedByValueUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v13);
  }

  objc_autoreleasePoolPop(v10);
}

void sub_2144AE708(uint64_t a1, void *a2)
{
  sub_2144AE718(a2, *(void **)(a1 + 32));
}

void sub_2144AE718(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  gzFile v6;
  gzFile_s *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  char *v15;
  int v16;
  unint64_t v17;
  void *v18;
  int *v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int errnum;
  uint8_t buf;
  char v31[15];

  v3 = a1;
  v4 = a2;
  v5 = objc_retainAutorelease(v3);
  v6 = gzopen((const char *)objc_msgSend(v5, "UTF8String"), "rb");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x2199CF0D0]();
    v9 = (char *)malloc_type_malloc(0x40000uLL, 0x1319781DuLL);
    if (!v9)
      sub_2144B04D4();
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0x40000;
    v14 = MEMORY[0x24BDACB70];
    while (1)
    {
      if (v12 == v13)
      {
        if (v11 != v10)
          sub_2144B04D4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          sub_2144B101C(&buf, v31);
        if (v12 > 0x100000)
        {
          v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
          if (v21)
            sub_2144B0F54(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_25:
          v10 = v11;
          goto LABEL_26;
        }
        if (!v12)
          goto LABEL_25;
        v13 = 2 * v12;
        v15 = (char *)reallocf(v11, 2 * v12);
        if (!v15)
          sub_2144B04D4();
        v10 = v15;
      }
      else if (v12)
      {
        memmove(v10, v11, v12);
      }
      v16 = gzread(v7, &v10[v12], v13 - v12);
      if (v16 < 0)
        break;
      if (v16 != v13 - v12)
      {
        systemstats_foreach_micro((unint64_t)v10, v16 + v12, 0, v4);
        goto LABEL_26;
      }
      v17 = systemstats_foreach_micro((unint64_t)v10, v13, 1, v4);
      if (!v17)
        goto LABEL_26;
      v11 = (char *)v17;
      v12 = (_DWORD)v10 + v13 - v17;
    }
    systemstats_foreach_micro((unint64_t)v10, v12, 0, v4);
    errnum = 0;
    v18 = (void *)gzerror(v7, &errnum);
    if (errnum == -1)
    {
      errnum = *__error();
      v19 = __error();
      v18 = strerror(*v19);
    }
    v20 = (uint64_t)v18;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      sub_2144B0F88((uint64_t)v5, &errnum, v20);
LABEL_26:
    free(v10);
    objc_autoreleasePoolPop(v8);
    gzclose(v7);
  }

}

void sub_2144AE95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a4 + 48);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s/%s"), *(_QWORD *)(a1 + 40), a2);
  if (v5 >= *(_QWORD *)(a1 + 48))
  {
    v8 = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", (double)v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

    v6 = v8;
  }

}

uint64_t sub_2144AE9F4(uint64_t a1, void *bytes, uint64_t a3, int a4, size_t length)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;

  if ((!a3 || (v6 = *(_DWORD *)(a1 + 64)) == 0 || *(_DWORD *)(a3 + 4) == v6)
    && (!a3 || (v7 = *(_QWORD *)(a1 + 40)) == 0 || *(_QWORD *)(a3 + 8) == v7))
  {
    v8 = *(_QWORD *)(a1 + 48);
    if ((!v8 || (v8 & *((_BYTE *)bytes + 24)) != 0) && *((_QWORD *)bytes + 1) >= *(_QWORD *)(a1 + 56))
    {
      v9 = xpc_data_create(bytes, length);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  return 1;
}

void sub_2144AEA94(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  char *v5;
  int v6;
  int v7;
  gzFile v8;
  gzFile_s *v9;
  id v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  ssize_t v16;
  ssize_t v17;
  ssize_t v18;
  int v19;
  int v20;
  _QWORD v21[4];
  id v22;
  _BYTE *v23;
  gzFile v24;
  _BYTE buf[24];
  ssize_t v26;
  __int16 v27;
  int v28;
  uint8_t v29[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a2);
  v4 = (char *)objc_msgSend(v3, "UTF8String");
  if (v4)
  {
    v5 = v4;
    if (strstr(v4, "XXXXXX") || strstr(v5, "truncated"))
    {
      v6 = dup(*(_DWORD *)(a1 + 48));
      if (v6 < 0)
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_2144B115C();
      }
      else
      {
        v7 = v6;
        v8 = gzdopen(v6, "ab");
        if (v8)
        {
          v9 = v8;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LODWORD(v26) = 0;
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = sub_2144AEF94;
          v21[3] = &unk_24D19E798;
          v24 = v8;
          v10 = v3;
          v22 = v10;
          v23 = buf;
          sub_2144AE718(v10, v21);
          if (*(_DWORD *)(*(_QWORD *)&buf[8] + 24))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              sub_2144B1244((uint64_t)&buf[8], (uint64_t)v10);
          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v29 = 138412290;
            v30 = v10;
            _os_log_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Read 0 bytes from microstackshots file %@", v29, 0xCu);
          }
          gzclose(v9);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_2144B11D0();
          close(v7);
        }
      }
      goto LABEL_39;
    }
    v11 = objc_retainAutorelease(v3);
    v12 = open((const char *)objc_msgSend(v11, "UTF8String"), 0);
    if ((v12 & 0x80000000) == 0)
    {
      v13 = v12;
      LODWORD(v14) = *(_DWORD *)(a1 + 52);
      v15 = MEMORY[0x24BDACB70];
      while (1)
      {
        v16 = read(v13, *(void **)(a1 + 40), (int)v14);
        v17 = v16;
        if (v16 < 0)
        {
          if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v19 = *__error();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_error_impl(&dword_2144A7000, v15, OS_LOG_TYPE_ERROR, "Failed to read microstackshots file %@: %{errno}d", buf, 0x12u);
          }
          goto LABEL_34;
        }
        if (!v16)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v11;
            _os_log_impl(&dword_2144A7000, v15, OS_LOG_TYPE_INFO, "Read 0 bytes from microstackshots file %@", buf, 0xCu);
          }
          goto LABEL_34;
        }
        v18 = write(*(_DWORD *)(a1 + 48), *(const void **)(a1 + 40), v16);
        if (v18 == v17)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v11;
            _os_log_debug_impl(&dword_2144A7000, v15, OS_LOG_TYPE_DEBUG, "Copied %ld bytes of microstackshots from file %@", buf, 0x16u);
          }
          goto LABEL_34;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v20 = *__error();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2048;
          v26 = v17;
          v27 = 1024;
          v28 = v20;
          _os_log_error_impl(&dword_2144A7000, v15, OS_LOG_TYPE_ERROR, "Failed to write microstackshots from file %@, only wrote %ld out of %ld bytes: %{errno}d", buf, 0x26u);
          if (v18 < 0)
          {
LABEL_33:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
            goto LABEL_34;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_33;
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 28;
LABEL_34:
        v14 = *(int *)(a1 + 52);
        if (v17 != v14)
        {
          close(v13);
          goto LABEL_39;
        }
      }
    }
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2144B10D0();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_2144B105C();
  }
LABEL_39:

}

void sub_2144AEF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_2144AEF94(uint64_t a1, const void *a2, int a3, int a4, unint64_t len)
{
  int v5;
  int v7;
  int v8;
  int errnum;

  if (len >> 31)
    sub_2144B12D0();
  v5 = len;
  v7 = gzwrite(*(gzFile *)(a1 + 48), a2, len);
  v8 = v7;
  if (v7 == v5)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
  }
  else if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2144B13E4();
  }
  else
  {
    errnum = 0;
    gzerror(*(gzFile *)(a1 + 48), &errnum);
    if (errnum == -1)
    {
      errnum = *__error();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2144B12F8();
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_2144B1368();
    }
  }
  return v8 == v5;
}

void sub_2144AF0AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2144AF0C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2144AF0DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2144AF0F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_2144AF104(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_2144AF174(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_2144AF184(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2144AF1A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_2144AF1B0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

size_t sub_2144AF1C8(int __fd, void *__buf, size_t __nbyte)
{
  size_t v6;
  ssize_t v7;

  if (__fd == -1)
    return 0;
  v6 = 0;
  while (1)
  {
    v7 = write(__fd, __buf, __nbyte);
    if (v7 == -1)
      break;
LABEL_6:
    v6 += v7;
    if (v6 >= __nbyte)
      return v6;
  }
  if (*__error() == 4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if (*__error())
    _os_assumes_log();
  return v6;
}

uint64_t sub_2144AF25C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  timeval v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  v5.tv_sec = 0;
  *(_QWORD *)&v5.tv_usec = 0;
  systemstats_gettimeofday(&v5, 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = now_in_absolute_milliseconds();
  return sub_2144AF2B4(v2, v3, &v5, 0);
}

uint64_t sub_2144AF2B4(uint64_t a1, unint64_t a2, _QWORD *a3, int a4)
{
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _BOOL4 v13;
  uint64_t v14;

  result = geteuid();
  if (!*(_QWORD *)(a1 + 96))
  {
    *(_DWORD *)(a1 + 88) = -1;
    return result;
  }
  v9 = result;
  v10 = a1;
  if (*(_DWORD *)(a1 + 88) == -1)
  {
    result = sub_2144B035C(a1, v9);
    if (!(_DWORD)result)
      return result;
    if (a4)
    {
      v14 = *(_QWORD *)(a1 + 112);
      if (!v14)
      {
        result = sub_2144ABD74((_QWORD *)a1, a2, a3);
        if ((result & 1) == 0)
          return result;
        v14 = *(_QWORD *)(a1 + 112);
      }
      v13 = v14 != 0;
    }
    else
    {
      result = sub_2144ABD74((_QWORD *)a1, a2, a3);
      if ((result & 1) == 0)
        return result;
      v13 = 0;
    }
    v10 = a1;
    v11 = a2;
    v12 = a3;
  }
  else
  {
    v11 = a2;
    v12 = a3;
    v13 = 0;
  }
  result = sub_2144B0124(v10, v11, v12, v13);
  if ((_DWORD)result)
    return sub_2144B035C(a1, v9);
  return result;
}

void _systemstats_queued_write(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _QWORD block[7];

  v3 = *(NSObject **)(a1 + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_2144ABAF8;
  block[3] = &unk_24D19E800;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  dispatch_sync(v3, block);
}

void sub_2144AF408(uint64_t a1, unsigned int a2, void *a3, char *a4, uint64_t a5)
{
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  size_t __nbyte[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char __s[32];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 200))
  {
    v10 = *(NSObject **)(a1 + 104);
    if (v10)
      dispatch_assert_queue_V2(v10);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    *(_OWORD *)__nbyte = 0u;
    v17 = 0u;
    sub_2144ABEA4((uint64_t)__nbyte, 12);
    sub_2144AC1B0((void *)1, __nbyte, "systemstats_v1");
    v11 = now_in_absolute_milliseconds();
    sub_2144ABEFC(2, __nbyte, v11);
    v12 = now_in_wall_milliseconds();
    sub_2144ABEFC(3, __nbyte, v12);
    sub_2144ABEFC(4, __nbyte, **(unsigned int **)(a1 + 8));
    sub_2144ABF94((void *)5, __nbyte, (void *)(a1 + 24), 0x10uLL);
    if (_systemstats_get_system_version(__s, 0x20uLL))
      sub_2144AC1B0((void *)6, __nbyte, __s);
    if (a3)
      sub_2144ABF94((void *)7, __nbyte, a3, 0x10uLL);
    sub_2144ABEFC(8, __nbyte, a2);
    if (a4)
      sub_2144AC1B0((void *)9, __nbyte, a4);
    if (a5)
    {
      sub_2144AC1B0((void *)0xA, __nbyte, (char *)a5);
      v13 = *(unsigned int *)(a5 + 528);
      if ((_DWORD)v13)
        sub_2144ABEFC(11, __nbyte, v13);
      v14 = *(_QWORD *)(a5 + 512);
      if (v14)
        sub_2144ABEFC(12, __nbyte, v14);
      sub_2144ABEFC(13, __nbyte, *(unsigned int *)(a5 + 536));
      if ((*(_BYTE *)(a5 + 536) & 1) != 0)
      {
        sub_2144AC1B0((void *)0xE, __nbyte, (char *)(a5 + 128));
        sub_2144AC1B0((void *)0xF, __nbyte, (char *)(a5 + 256));
      }
      sub_2144AC1B0((void *)0x10, __nbyte, (char *)(a5 + 384));
      sub_2144ABEFC(17, __nbyte, *(_QWORD *)(a5 + 520));
    }
    v15 = (void *)sub_2144AC1FC((uint64_t)__nbyte);
    *(_QWORD *)(a1 + 112) += _systemstats_retried_write(a1, v15, __nbyte[0]);
    sub_2144ABEC0(__nbyte);
  }
}

void _systemstats_write_logstarts_queued(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v5;
  _QWORD block[8];
  char v7;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 1) != 0)
  {
    v5 = *(NSObject **)(a1 + 104);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_2144AF69C;
    block[3] = &unk_24D19E820;
    v7 = a2;
    block[4] = a1;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    dispatch_sync(v5, block);
  }
}

void sub_2144AF69C(uint64_t a1)
{
  sub_2144AF408(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), *(char **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t _systemstats_stream_init(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  const char *v7;
  uint64_t result;
  const char *v9;
  uint64_t v10;
  const char **v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  uuid_string_t out;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)a1)
    sub_2144B14AC();
  if (a3)
    v7 = a3;
  else
    v7 = "/private/var/db/systemstats";
  result = sub_2144AD144();
  if ((_DWORD)result)
  {
    *(_QWORD *)(a1 + 16) = a4;
    result = (uint64_t)_systemstats_writers();
    if (a2 - 5 < 0x17 || !a2 || a2 == 3)
    {
      *(_QWORD *)(a1 + 8) = result + 48 * a2;
      if (result)
      {
        *(_QWORD *)(a1 + 80) = v7;
        result = _systemstats_read_uuid_from_cookie_path(v7, "current_boot_uuid", (unsigned __int8 *)(a1 + 24), (_BYTE *)(a1 + 40));
        if ((_DWORD)result)
        {
          *(_DWORD *)(a1 + 88) = -1;
          *(_QWORD *)(a1 + 184) = 0;
          *(_QWORD *)(a1 + 120) = 0;
          systemstats_gettimeofday((timeval *)(a1 + 152), 0);
          *(_QWORD *)(a1 + 168) = now_in_absolute_milliseconds();
          v9 = ".gz";
          v10 = 0x40000;
          switch(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16))
          {
            case 0:
              sub_2144B04D4();
            case 1:
              v9 = ".stats";
              goto LABEL_16;
            case 2:
              goto LABEL_17;
            case 3:
              v9 = ".stats.gz";
              goto LABEL_16;
            case 4:
              v9 = ".oneshot";
LABEL_16:
              v10 = 0x20000;
LABEL_17:
              *(_QWORD *)(a1 + 192) = v9;
              *(_QWORD *)(a1 + 128) = v10;
              v18 = 0;
              memset(out, 0, sizeof(out));
              uuid_unparse((const unsigned __int8 *)(a1 + 24), out);
              v11 = (const char **)_systemstats_writers();
              asprintf(&v18, "%s/%s.%s.XXXXXX%s", v7, out, v11[6 * a2 + 1], v9);
              *(_QWORD *)(a1 + 96) = v18;
              v12 = *(_QWORD *)(a1 + 8);
              if (!*(_BYTE *)(v12 + 42))
              {
                systemstats_delete_old_files(*(const char **)(a1 + 80), 0, *(char **)(v12 + 8), *(_QWORD *)(v12 + 32), (_QWORD *)(a1 + 152));
                v12 = *(_QWORD *)(a1 + 8);
              }
              sub_2144AF2B4(a1, *(_QWORD *)(a1 + 168), (_QWORD *)(a1 + 152), (*(_QWORD *)(v12 + 16) >> 1) & 1);
              if ((*(_DWORD *)(a1 + 88) & 0x80000000) != 0)
              {
                free(*(void **)(a1 + 96));
                result = 0;
              }
              else
              {
                if ((a2 & 0xFFFFFFEF) == 5)
                {
                  *(_QWORD *)(a1 + 104) = 0;
                }
                else
                {
                  v13 = *(_QWORD *)(a1 + 8);
                  if (*(_BYTE *)(v13 + 44))
                  {
                    if (qword_254D78630 != -1)
                      dispatch_once(&qword_254D78630, &unk_24D19E860);
                    v14 = qword_254D78628;
                    *(_QWORD *)(a1 + 104) = qword_254D78628;
                    dispatch_retain(v14);
                  }
                  else
                  {
                    *(_QWORD *)out = 0;
                    asprintf((char **)out, "com.apple.systemstats.filestream.%s", *(const char **)(v13 + 8));
                    v15 = *(const char **)out;
                    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
                    *(_QWORD *)(a1 + 104) = dispatch_queue_create(v15, v17);
                    free(*(void **)out);
                  }
                }
                result = 1;
                *(_BYTE *)a1 = 1;
              }
              break;
            default:
              sub_2144B1498();
          }
        }
      }
    }
    else
    {
      result = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
  return result;
}

dispatch_queue_t sub_2144AF9A8()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  result = dispatch_queue_create("com.apple.systemstats.filestream", v1);
  qword_254D78628 = (uint64_t)result;
  return result;
}

uint64_t _systemstats_stream_teardown(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  if (!a1)
    sub_2144B04D4();
  free(*(void **)(a1 + 96));
  v2 = *(NSObject **)(a1 + 104);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 104) = 0;
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 2) != 0)
  {
    result = gzclose_w(*(gzFile *)(a1 + 184));
    if ((_DWORD)result)
      result = _os_assumes_log();
    *(_QWORD *)(a1 + 184) = 0;
  }
  else
  {
    result = close(*(_DWORD *)(a1 + 88));
    if ((_DWORD)result == -1)
      result = sub_2144B14C4();
  }
  *(_DWORD *)(a1 + 88) = -1;
  *(_QWORD *)(a1 + 120) = 0;
  *(_BYTE *)a1 = 0;
  return result;
}

void *_systemstats_stream_create(unsigned int a1, const char *a2, uint64_t a3)
{
  void *v6;
  void *v7;

  v6 = malloc_type_calloc(1uLL, 0xD0uLL, 0x107004075F51AE9uLL);
  v7 = v6;
  if (v6)
  {
    if (_systemstats_stream_init((uint64_t)v6, a1, a2, a3))
    {
      _systemstats_write_logstarts_queued((uint64_t)v7, 1, 0, 0, 0);
    }
    else
    {
      free(v7);
      return 0;
    }
  }
  return v7;
}

void systemstats_stream_delete(void *a1)
{
  _systemstats_stream_teardown((uint64_t)a1);
  free(a1);
}

void systemstats_stream_flush(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  if (*(_BYTE *)a1)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 2) != 0)
    {
      v1 = *(NSObject **)(a1 + 104);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = sub_2144AFB98;
      block[3] = &unk_24D19E880;
      block[4] = a1;
      dispatch_sync(v1, block);
    }
  }
}

uint64_t sub_2144AFB98(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 200))
    return gzflush(*(gzFile *)(v1 + 184), 2);
  return result;
}

uint64_t systemstats_stream_get_attr(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t _systemstats_save_current_boot_uuid(const char *a1, unsigned __int8 *a2, char *a3)
{
  uid_t v6;
  int v7;
  int v8;

  v6 = geteuid();
  v7 = sub_2144AFC4C(a1, 1537, v6);
  if (v7 == -1)
    return sub_2144B14C4();
  v8 = v7;
  sub_2144ACCFC(a2);
  uuid_unparse(a2, a3);
  a3[36] = 10;
  sub_2144AF1C8(v8, a3, 0x25uLL);
  return close(v8);
}

uint64_t sub_2144AFC4C(const char *a1, int a2, int a3)
{
  __int16 v4;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  stat v13;
  stat v14;

  v4 = a2;
  memset(&v14, 0, sizeof(v14));
  memset(&v13.st_atimespec, 0, 112);
  if ((a2 & 0x200) != 0)
    v6 = -3585;
  else
    v6 = -1025;
  v7 = v6 & a2;
  memset(&v13, 0, 32);
  if (lstat(a1, &v13) < 0)
  {
    v10 = __error();
    v8 = 0xFFFFFFFFLL;
    if ((v4 & 0x200) != 0 && *v10 == 2)
    {
      v11 = open(a1, v7 | 0xA00, 420);
      if ((v11 & 0x80000000) == 0)
      {
        v8 = v11;
        ((void (*)(void))nullsub_1)();
        goto LABEL_22;
      }
    }
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
    if ((v13.st_mode & 0xF000) == 0x8000 && v13.st_nlink == 1 && (v13.st_mode & 0xFFF) == 0x1A4 && v13.st_uid == a3)
    {
      v9 = open(a1, v7, 0);
      if ((v9 & 0x80000000) == 0)
      {
        v8 = v9;
        if (fstat(v9, &v14)
          || v14.st_nlink != v13.st_nlink
          || v14.st_uid != v13.st_uid
          || v14.st_mode != v13.st_mode
          || v14.st_ino != v13.st_ino
          || v14.st_dev != v13.st_dev)
        {
          close(v8);
          return 0xFFFFFFFFLL;
        }
        if ((v4 & 0x400) != 0)
        {
          ftruncate(v8, 0);
LABEL_22:
          nullsub_1(v8);
        }
      }
    }
  }
  return v8;
}

uint64_t _systemstats_boot(const char *a1, int a2)
{
  const char *v3;
  std::__fs::filesystem::path *v4;
  std::__fs::filesystem::path *v5;
  std::__fs::filesystem::path *v6;
  std::__fs::filesystem::path *v7;
  std::error_code *v8;
  int v9;
  std::error_code *v10;
  int v11;
  int v12;
  uid_t v13;
  int v14;
  int v15;
  size_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  char *v23;
  stat v25;
  char v26[32];
  _OWORD v27[3];
  _QWORD v28[2];
  char __s[32];
  _OWORD v30[13];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  memset(&v25, 0, sizeof(v25));
  if (a1)
    v3 = a1;
  else
    v3 = "/private/var/db/systemstats";
  memset(v30, 0, sizeof(v30));
  if (stat(v3, &v25) == -1 && mkpath_np(v3, 0x1EDu) == -1)
    sub_2144B14DC();
  if (sub_2144AD144())
  {
    v4 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "current_boot_uuid");
    v5 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "last_boot_uuid");
    v6 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "current_build");
    v7 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "last_build");
    rename(v4, v5, v8);
    if (v9 == -1 && *__error() != 2)
      sub_2144B14C4();
    _systemstats_save_current_boot_uuid((const char *)v4, (unsigned __int8 *)&v30[1] + 8, (char *)&v30[2] + 8);
    rename(v6, v7, v10);
    v12 = v11;
    if (v11 == -1 && *__error() != 2)
      sub_2144B14C4();
    if (_systemstats_get_system_version(__s, 0x20uLL))
    {
      v13 = geteuid();
      v14 = sub_2144AFC4C((const char *)v6, 1537, v13);
      if (v14 == -1)
      {
        sub_2144B14C4();
        if (a2)
        {
LABEL_17:
          v28[0] = 0;
          v28[1] = 0;
          memset(v27, 0, 37);
          if ((_systemstats_read_uuid((const char *)v5, (unsigned __int8 *)v28, v27) & 1) == 0)
          {
            v17 = __error();
            if (v12 == -1 && *v17 != 2)
              sub_2144B14C4();
          }
          v18 = sub_2144ACE24((const char *)v7, v26, 0x1FuLL);
          v19 = v18;
          if (v18 < 1)
          {
            if (v18 == -1 && *__error() != 2)
              sub_2144B14C4();
          }
          else
          {
            v26[v18] = 0;
            v20 = strchr(v26, 10);
            if (v20)
              *v20 = 0;
          }
          v21 = _systemstats_stream_init((uint64_t)v30, 5u, v3, 20180126);
          if ((_DWORD)v21)
          {
            if (v12)
              v22 = 0;
            else
              v22 = v28;
            if (v19 <= 0)
              v23 = 0;
            else
              v23 = v26;
            sub_2144AF408((uint64_t)v30, 1u, v22, v23, 0);
            _systemstats_stream_teardown((uint64_t)v30);
          }
          goto LABEL_38;
        }
LABEL_37:
        v21 = 1;
LABEL_38:
        free(v4);
        free(v5);
        free(v6);
        free(v7);
        return v21;
      }
      v15 = v14;
      v16 = strlen(__s);
      sub_2144AF1C8(v15, __s, v16);
      sub_2144AF1C8(v15, "\n", 1uLL);
      close(v15);
    }
    if (a2)
      goto LABEL_17;
    goto LABEL_37;
  }
  return 0;
}

uint64_t sub_2144B0124(uint64_t a1, uint64_t a2, _QWORD *a3, int a4)
{
  int v5;
  std::__fs::filesystem::path *v9;
  int v10;
  char *v11;
  char *v12;
  char *v13;
  int v14;
  std::error_code *v15;
  int v16;
  int v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  char *v22;

  v5 = *(_DWORD *)(a1 + 88);
  if (v5 == -1)
    sub_2144B04D4();
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 2) != 0)
  {
    if (!gzclose_w(*(gzFile *)(a1 + 184)))
      goto LABEL_6;
  }
  else
  {
    if (close(v5) != -1)
      goto LABEL_6;
    __error();
  }
  _os_assumes_log();
LABEL_6:
  *(_DWORD *)(a1 + 88) = -1;
  *(_QWORD *)(a1 + 184) = 0;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 4) != 0)
    return 0;
  v9 = (std::__fs::filesystem::path *)strdup(*(const char **)(a1 + 96));
  v10 = strlen(*(const char **)(a1 + 192));
  if (a4)
  {
    v11 = strstr((char *)v9, "XXXXXX");
    v12 = strrchr((char *)v9, 46);
    v22 = 0;
    if (v11 && v12 && v11 < v12)
    {
      *v12 = 0;
      asprintf(&v22, "%s.truncated.%s");
    }
    else
    {
      asprintf(&v22, "%s.truncated");
    }
    v13 = v22;
    if (v22)
    {
      free(v9);
      v10 += 10;
      v9 = (std::__fs::filesystem::path *)v13;
    }
  }
  v14 = mkstemps((char *)v9, v10);
  if (v14 < 0)
  {
    if (*__error())
      _os_assumes_log();
    free(v9);
    return 0;
  }
  if (close(v14) == -1)
    sub_2144B14C4();
  rename(*(const std::__fs::filesystem::path **)(a1 + 96), v9, v15);
  v17 = v16;
  free(v9);
  if (!v17)
  {
    if ((uint64_t)(*a3 - *(_QWORD *)(a1 + 152)) < 86401 || (unint64_t)(a2 - *(_QWORD *)(a1 + 168)) < 0x36EE81)
    {
      v19 = *(_QWORD *)(a1 + 8);
      v20 = *(_QWORD *)(v19 + 32);
      if (*(_QWORD *)(a1 + 120) < v20)
        return 1;
    }
    else
    {
      v19 = *(_QWORD *)(a1 + 8);
      v20 = *(_QWORD *)(v19 + 32);
    }
    if (*(_BYTE *)(v19 + 42))
      v21 = (const char *)(a1 + 40);
    else
      v21 = 0;
    systemstats_delete_old_files(*(const char **)(a1 + 80), v21, *(char **)(v19 + 8), v20, a3);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)a3;
    *(_QWORD *)(a1 + 120) = 0;
    *(_QWORD *)(a1 + 168) = a2;
    return 1;
  }
  result = *__error();
  if (!(_DWORD)result)
    return result;
  _os_assumes_log();
  return 0;
}

uint64_t sub_2144B035C(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int tv_nsec;
  uint64_t result;
  gzFile v8;
  uint64_t v9;
  stat v10;

  *(_QWORD *)(a1 + 112) = 0;
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) & 4) != 0)
    v4 = 1537;
  else
    v4 = 521;
  v5 = sub_2144AFC4C(*(const char **)(a1 + 96), v4, a2);
  *(_DWORD *)(a1 + 88) = v5;
  if (v5 != -1)
  {
    memset(&v10, 0, sizeof(v10));
    if (_systemstats_get_file_stats(v5, &v10) || v10.st_size < 0)
    {
      if (close(*(_DWORD *)(a1 + 88)) != -1)
      {
LABEL_21:
        result = 0;
        *(_DWORD *)(a1 + 88) = -1;
        return result;
      }
    }
    else
    {
      tv_nsec = v10.st_birthtimespec.tv_nsec;
      *(_QWORD *)(a1 + 136) = v10.st_birthtimespec.tv_sec;
      *(_DWORD *)(a1 + 144) = tv_nsec / 1000;
      *(_QWORD *)(a1 + 176) = 0;
      if (fcntl(*(_DWORD *)(a1 + 88), 2, 1) == -1)
        sub_2144B14C4();
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 16) & 2) == 0)
      {
        *(_QWORD *)(a1 + 112) = v10.st_size;
        return 1;
      }
      v8 = gzdopen(*(_DWORD *)(a1 + 88), "ab");
      *(_QWORD *)(a1 + 184) = v8;
      if (v8)
      {
        v9 = MEMORY[0x2199CEFE0]();
        if ((v9 & 0x8000000000000000) == 0)
        {
          *(_QWORD *)(a1 + 112) = v9;
          return 1;
        }
      }
      if (close(*(_DWORD *)(a1 + 88)) != -1)
        goto LABEL_21;
    }
    sub_2144B14C4();
    goto LABEL_21;
  }
  result = *__error();
  if ((_DWORD)result)
  {
    _os_assumes_log();
    return 0;
  }
  return result;
}

uint64_t sub_2144B04CC()
{
  return _os_assumes_log();
}

void sub_2144B04D4()
{
  sub_2144AC504();
  _os_crash();
  __break(1u);
}

uint64_t sub_2144B04E8()
{
  __error();
  return _os_assumes_log();
}

void sub_2144B0504(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = a1;
  _os_log_debug_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Could not find the file for current build at path: %s", (uint8_t *)&v1, 0xCu);
}

void sub_2144B0580(uint64_t a1)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3[0] = 67109378;
  v3[1] = v2;
  v4 = 2080;
  v5 = a1;
  _os_log_debug_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Error reading current build from file with errno %d at path: %s", (uint8_t *)v3, 0x12u);
}

void sub_2144B061C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0DC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Returned %zu microstackshots", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B0690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Fetching microstackshots from file.", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B06C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF104(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "persistence default setting: %d", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0734()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2144AF134();
  sub_2144AF0F4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Invalid value for tasking setting %{public}@: (%{public}@)%{public}@", v1, v2, v3, v4, 2u);
  sub_2144AF0EC();
}

void sub_2144B07A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0DC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "cpu hotspot report percentage internal default setting: %.1f", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B0818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0DC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "cpu hotspot report percentage non-internal default setting: %.1f", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B0884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF174(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Bad cpuHotspotReportPercentage setting: %.1f", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B08F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0F4(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Invalid value for tasking setting %{public}@: (%{public}@)%{public}@", a5, a6, a7, a8, 2u);
  sub_2144AF0EC();
}

void sub_2144B0970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2144AF15C();
  sub_2144AF184(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Rand %.1f passed threshold %.1f", v1, v2, v3, v4, v5);
  sub_2144AF0D4();
}

void sub_2144B09D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2144AF15C();
  sub_2144AF184(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Rand %.1f failed threshold %.1f", v1, v2, v3, v4, v5);
  sub_2144AF0D4();
}

void sub_2144B0A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0DC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "io hotspot report percentage internal default setting: %.1f", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B0AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0DC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "io hotspot report percentage non-internal default setting: %.1f", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B0B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF174(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Bad ioHotspotReportPercentage setting: %.1f", a5, a6, a7, a8, 0);
  sub_2144AF0D4();
}

void sub_2144B0B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2144AF134();
  sub_2144AF0F4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Invalid value for tasking setting %{public}@: (%{public}@)%{public}@", v1, v2, v3, v4, 2u);
  sub_2144AF0EC();
}

void sub_2144B0BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Checkpoint microstackshots completed within timeout.", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Checkpoint microstackshots timed out.", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0C64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2144AF150();
  sub_2144AF104(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Fetched %d bytes of microstackshots from the kernel", v1, v2, v3, v4, v5);
  sub_2144AF0BC();
}

void sub_2144B0CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Requested to fetch microstackshots from the kernel", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Checkpointed microstackshots to disk successfully.", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0D34()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_2144AF194();
  _os_log_error_impl(v0, v1, v2, v3, v4, 2u);
  sub_2144AF0BC();
}

void sub_2144B0D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Copying microstackshot files", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0DA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2144AF150();
  sub_2144AF0C4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Unable to copy bad size of %d bytes of microstackshots from kernel", v1, v2, v3, v4, v5);
  sub_2144AF0BC();
}

void sub_2144B0E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2144AF150();
  sub_2144AF0C4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Unable to dup fd for saving: %{errno}d", v1, v2, v3, v4, v5);
  sub_2144AF0BC();
}

void sub_2144B0E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2144AF150();
  sub_2144AF0C4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Unable to write microstackshots from kernel: %{errno}d", v1, v2, v3, v4, v5);
  sub_2144AF0BC();
}

void sub_2144B0EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF1A0(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Unable to write microstackshots from kernel: %d (%{public}s)", a5, a6, a7, a8, 2u);
  sub_2144AF0D4();
}

void sub_2144B0F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2144AF0AC(&dword_2144A7000, MEMORY[0x24BDACB70], a3, "Unexpected: a single microstackshot was larger than TELEMETRY_DATA_HIGHERWATER_SIZE. Skipping this stream.", a5, a6, a7, a8, 0);
  sub_2144AF0BC();
}

void sub_2144B0F88(uint64_t a1, int *a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412802;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  v8 = 2080;
  v9 = a3;
  _os_log_debug_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Read failed for microstackshots for file %@: %d %s", (uint8_t *)&v4, 0x1Cu);
  sub_2144AF0EC();
}

void sub_2144B101C(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Unexpected: a single microstackshot was larger than TELEMETRY_DATA_HIGHWATER_SIZE", buf, 2u);
}

void sub_2144B105C()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_2144AF194();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xCu);
  sub_2144AF0D4();
}

void sub_2144B10D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_2144AF1A0(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Unable to open %@: %{errno}d", v1, v2, v3, v4, 2u);
  sub_2144AF0EC();
}

void sub_2144B115C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_2144AF0C4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Unable to get dup fd: %{errno}d", v1, v2, v3, v4, 0);
  sub_2144AF0BC();
}

void sub_2144B11D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_2144AF0C4(&dword_2144A7000, MEMORY[0x24BDACB70], v0, "Unable to gzdopen fd: %{errno}d", v1, v2, v3, v4, 0);
  sub_2144AF0BC();
}

void sub_2144B1244(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v3[0] = 67109378;
  v3[1] = v2;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_2144A7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Copied %d (uncompressed) bytes of microstackshots from file %@", (uint8_t *)v3, 0x12u);
  sub_2144AF0D4();
}

void sub_2144B12D0()
{
  __assert_rtn("microstackshots_copy_files_block_invoke", "micro.m", 381, "len <= INT_MAX");
}

void sub_2144B12F8()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_2144AF1B0(*MEMORY[0x24BDAC8D0]);
  sub_2144AF114();
  sub_2144AF194();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
  sub_2144AF0D4();
}

void sub_2144B1368()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_2144AF1B0(*MEMORY[0x24BDAC8D0]);
  sub_2144AF114();
  sub_2144AF194();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
  sub_2144AF0EC();
}

void sub_2144B13E4()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_2144AF194();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Eu);
  sub_2144AF0EC();
}

void sub_2144B1480()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_2144B1498()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_2144B14AC()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

uint64_t sub_2144B14C4()
{
  __error();
  return sub_2144B04CC();
}

void sub_2144B14DC()
{
  __error();
  _os_assert_log();
  _os_crash();
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __microstackshot()
{
  return MEMORY[0x24BDAC860]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x24BDADC38](dirp);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x24BDAE3D8](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x24BDAE510](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x24BEDF200](file);
}

int gzclose_w(gzFile file)
{
  return MEMORY[0x24BEDF208](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x24BEDF210](*(_QWORD *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x24BEDF220](file, errnum);
}

int gzflush(gzFile file, int flush)
{
  return MEMORY[0x24BEDF228](file, *(_QWORD *)&flush);
}

uint64_t gzoffset(gzFile a1)
{
  return MEMORY[0x24BEDF238](a1);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x24BEDF240](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x24BEDF248](file, buf, *(_QWORD *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x24BEDF258](file, buf, *(_QWORD *)&len);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF60](path, omode);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x24BDAEF80](a1, *(_QWORD *)&a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

void sranddev(void)
{
  MEMORY[0x24BDAFE90]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x24BDB0320](out);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

