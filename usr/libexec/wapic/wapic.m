uint64_t sub_100002F98(int a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = a1 - 48;
  if ((a1 - 65) >= 6)
    v2 = -1;
  else
    v2 = a1 - 55;
  if ((a1 - 97) <= 5)
    v3 = a1 - 87;
  else
    v3 = v2;
  if (v1 <= 9)
    return v1;
  else
    return v3;
}

uint64_t sub_100002FC8(char *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;

  if (a3)
  {
    v3 = 0;
    while (1)
    {
      v4 = *a1;
      v5 = v4 - 48;
      if ((v4 - 48) <= 9)
        goto LABEL_6;
      if ((v4 - 97) <= 5)
        break;
      if ((v4 - 65) > 5)
        return 0xFFFFFFFFLL;
      LOBYTE(v5) = v4 - 55;
      if (v4 - 55 < 0)
        return 0xFFFFFFFFLL;
LABEL_7:
      v6 = a1[1];
      v7 = v6 - 48;
      if ((v6 - 48) <= 9)
        goto LABEL_10;
      if ((v6 - 97) <= 5)
      {
        v7 = v6 - 87;
LABEL_10:
        if (v7 < 0)
          return 0xFFFFFFFFLL;
        goto LABEL_11;
      }
      if ((v6 - 65) > 5)
        return 0xFFFFFFFFLL;
      LOBYTE(v7) = v6 - 55;
      if (v6 - 55 < 0)
        return 0xFFFFFFFFLL;
LABEL_11:
      *(_BYTE *)(a2 + v3++) = v7 | (16 * v5);
      a1 += 2;
      if (a3 <= v3)
        return 0;
    }
    v5 = v4 - 87;
LABEL_6:
    if (v5 < 0)
      return 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  return 0;
}

char *sub_100003070(char *__s1)
{
  char *v3;
  char *v4;
  size_t v5;
  char *v6;
  _BYTE *v7;
  char *v8;
  size_t v9;
  size_t v10;
  _BYTE *v11;

  if (*__s1 == 47)
    return strdup(__s1);
  v3 = (char *)malloc_type_malloc(0x80uLL, 0xBF9BF934uLL);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 128;
  while (1)
  {
    v6 = getcwd(v4, v5);
    if (v6)
      break;
    free(v4);
    if (*__error() == 34)
    {
      v5 *= 2;
      v4 = (char *)malloc_type_malloc(v5, 0xBF9BF934uLL);
      if (v4)
        continue;
    }
    return 0;
  }
  v8 = v6;
  v9 = strlen(v6);
  v10 = strlen(__s1);
  v11 = malloc_type_malloc(v9 + v10 + 2, 0x3C3EFE30uLL);
  v7 = v11;
  if (v11)
  {
    memcpy(v11, v8, v9);
    v7[v9] = 47;
    memcpy(&v7[v9 + 1], __s1, v10);
    v7[v9 + 1 + v10] = 0;
  }
  free(v4);
  return v7;
}

uint64_t sub_1000031A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000031AC(a1, a2, a3, a4, 1);
}

uint64_t sub_1000031AC(uint64_t result, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  char *v8;
  uint64_t v9;
  char v10[1024];

  if (dword_100020000 <= (int)result)
  {
    v8 = &v10[__sprintf_chk(v10, 0, 0x400uLL, "%s - hexdump(len=%lu):\n", a2, a4)];
    if (a5)
    {
      if (a4)
      {
        v9 = 0;
        do
        {
          v8 += sprintf(v8, "%02x ", *(unsigned __int8 *)(a3 + v9++));
          if ((v9 & 0xF) == 0)
            *(_WORD *)v8 = 10;
        }
        while (a4 != v9);
      }
    }
    else
    {
      strcpy(v8, " [REMOVED]");
    }
    return asl_log(0, 0, 5, "%s\n", v10);
  }
  return result;
}

uint64_t sub_1000032D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000031AC(a1, a2, a3, a4, dword_100020108);
}

uint64_t sub_1000032E4(uint64_t a1, const char *a2, char *a3, unint64_t a4)
{
  return sub_1000032EC(a1, a2, a3, a4, 1);
}

uint64_t sub_1000032EC(uint64_t result, const char *a2, char *a3, unint64_t a4, int a5)
{
  tm *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  int v17;
  char *v18;
  uint64_t v20;
  unsigned __int8 v21;
  int v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  timeval v28;
  char v29[1024];
  char __str[16];

  if (dword_100020000 > (int)result)
    return result;
  if (dword_10002010C)
  {
    v28.tv_sec = 0;
    *(_QWORD *)&v28.tv_usec = 0;
    gettimeofday(&v28, 0);
    v9 = localtime(&v28.tv_sec);
    if (!strftime(__str, 0x10uLL, "%b %d %H:%M:%S", v9))
      snprintf(__str, 0x10uLL, "%u", LODWORD(v28.tv_sec));
    v10 = __sprintf_chk(v29, 0, 0x400uLL, "%s.%06u: ", __str, v28.tv_usec);
  }
  else
  {
    v10 = 0;
  }
  v11 = &v29[v10];
  if (!a5)
  {
    sprintf(&v29[v10], "%s - hexdump_ascii(len=%lu): [REMOVED]\n", a2, a4);
    return asl_log(0, 0, 5, "%s\n", v29);
  }
  result = sprintf(&v29[v10], "%s - hexdump_ascii(len=%lu):\n", a2, a4);
  if (!a4)
    return result;
  v12 = &v11[(int)result];
  do
  {
    if (a4 >= 0x10)
      v13 = 16;
    else
      v13 = a4;
    strcpy(v12, "    ");
    v14 = v12 + 4;
    v15 = v13;
    v27 = a3;
    do
    {
      v16 = *a3++;
      v14 += sprintf(v14, " %02x", v16);
      --v15;
    }
    while (v15);
    v26 = a4;
    if (v13 > 0xF)
    {
      v18 = v27;
    }
    else
    {
      v17 = v13 - 16;
      v18 = v27;
      do
      {
        *(_DWORD *)v14 = 2105376;
        v14 += 3;
      }
      while (!__CFADD__(v17++, 1));
    }
    *(_DWORD *)v14 = 2105376;
    v12 = v14 + 3;
    v20 = v13;
    do
    {
      v22 = *v18++;
      v21 = v22;
      if (v22 < 0)
      {
        if (__maskrune(v21, 0x40000uLL))
        {
LABEL_24:
          *v12 = v21;
          v12[1] = 0;
          goto LABEL_27;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v21] & 0x40000) != 0)
      {
        goto LABEL_24;
      }
      *(_WORD *)v12 = 95;
LABEL_27:
      ++v12;
      --v20;
    }
    while (v20);
    if (v13 > 0xF)
    {
      v25 = v26;
      v24 = v27;
    }
    else
    {
      v23 = 0;
      v25 = v26;
      v24 = v27;
      do
        *(_WORD *)&v12[v23++] = 32;
      while (16 - (_DWORD)v13 != (_DWORD)v23);
      v12 += v23;
    }
    result = asl_log(0, 0, 5, "%s\n", v29);
    a3 = &v24[v13];
    a4 = v25 - v13;
  }
  while (a4);
  return result;
}

uint64_t sub_1000035A4(uint64_t a1, const char *a2, char *a3, unint64_t a4)
{
  return sub_1000032EC(a1, a2, a3, a4, dword_100020108);
}

uint64_t sub_1000035B0(int a1, char *__filename, uint64_t a3)
{
  FILE *v5;
  FILE *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char **v15;
  size_t v16;
  char *v17;
  const char *v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  char **v22;
  char v24[1024];

  v5 = fopen(__filename, "r");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  if (!feof(v5))
  {
    v8 = "\t";
    if (a1 == 32)
      v8 = " ";
    if (a1 == 61)
      v9 = "=";
    else
      v9 = v8;
    do
    {
      fgets(v24, 255, v6);
      if (feof(v6))
        break;
      v10 = strchr(v24, 10);
      if (v10)
        *v10 = 0;
      if (v24[0] != 35)
      {
        v11 = strstr(v24, "setenv ");
        if (v11)
          v12 = v11 + 7;
        else
          v12 = v24;
        v13 = strstr(v12, v9);
        if (v13)
        {
          v14 = v13;
          v15 = (char **)(a3 + 16 * (int)v7);
          *v13 = 0;
          v16 = strlen(v12);
          v17 = (char *)malloc_type_malloc(v16 + 1, 0xA1D6C64CuLL);
          *v15 = v17;
          if (v17)
          {
            v18 = v14 + 1;
            v19 = strlen(v18);
            v20 = malloc_type_malloc(v19 + 1, 0xC25572BEuLL);
            v21 = a3 + 16 * (int)v7;
            *(_QWORD *)(v21 + 8) = v20;
            v22 = (char **)(v21 + 8);
            if (v20)
            {
              strcpy(*v15, v12);
              strcpy(*v22, v18);
              v7 = (v7 + 1);
            }
          }
        }
      }
    }
    while (!feof(v6));
  }
  fclose(v6);
  return v7;
}

const char *sub_100003778(const char *a1, unsigned __int8 a2)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  const char *v7;
  BOOL v8;
  int v9;

  v3 = a2;
  v4 = strlen(a1);
  if (v4 < 1)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    v5 = 0;
    while (a1[v5] == v3)
    {
      if (v4 == ++v5)
      {
        LODWORD(v5) = v4;
        break;
      }
    }
  }
  v6 = v4 & (v4 >> 31);
  v7 = &a1[v4 - 1];
  while (1)
  {
    v8 = __OFSUB__(v4--, 1);
    if (v4 < 0 != v8)
      break;
    v9 = *(unsigned __int8 *)v7--;
    if (v9 != v3)
    {
      v6 = v4 + 1;
      break;
    }
  }
  a1[v6] = 0;
  return &a1[v5];
}

char *sub_1000037FC(char *__s2, char *a2, uint64_t a3, int a4)
{
  uint64_t v6;
  _QWORD *i;
  const char *v8;
  _OWORD v10[16];

  memset(v10, 0, sizeof(v10));
  if (a4 < 1)
    return 0;
  v6 = a4;
  for (i = (_QWORD *)(a3 + 8); strcmp((const char *)*(i - 1), __s2); i += 2)
  {
    if (!--v6)
      return 0;
  }
  __strcpy_chk(v10, *i, 256);
  v8 = sub_100003778((const char *)v10, 0x22u);
  strcpy(a2, v8);
  return a2;
}

uint64_t sub_1000038E4(char *a1, int a2, _BYTE *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;

  if (a2 >= 2)
  {
    v3 = a2 >> 1;
    while (1)
    {
      v4 = *a1;
      v5 = v4 - 48;
      if ((v4 - 48) <= 9)
        goto LABEL_6;
      if ((v4 - 97) <= 5)
        break;
      if ((v4 - 65) > 5)
        return 0xFFFFFFFFLL;
      LOBYTE(v5) = v4 - 55;
      if (v4 - 55 < 0)
        return 0xFFFFFFFFLL;
LABEL_7:
      v6 = a1[1];
      v7 = v6 - 48;
      if ((v6 - 48) <= 9)
        goto LABEL_10;
      if ((v6 - 97) <= 5)
      {
        v7 = v6 - 87;
LABEL_10:
        if (v7 < 0)
          return 0xFFFFFFFFLL;
        goto LABEL_11;
      }
      if ((v6 - 65) > 5)
        return 0xFFFFFFFFLL;
      LOBYTE(v7) = v6 - 55;
      if (v6 - 55 < 0)
        return 0xFFFFFFFFLL;
LABEL_11:
      *a3++ = v7 + 16 * v5;
      a1 += 2;
      if (!--v3)
        return 0;
    }
    v5 = v4 - 87;
LABEL_6:
    if (v5 < 0)
      return 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  return 0;
}

void *sub_10000398C(int a1)
{
  size_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = malloc_type_malloc(a1, 0xDD029BB3uLL);
  v3 = v2;
  if (v2)
    bzero(v2, v1);
  return v3;
}

uint64_t sub_1000039D0(void *a1, int a2)
{
  if (a1)
  {
    bzero(a1, a2);
    free(a1);
  }
  return 0;
}

uint64_t sub_100003A04(uint64_t a1, int a2)
{
  uint64_t v2;
  void **v3;
  void *v4;

  if (a2 >= 1)
  {
    v2 = a2;
    v3 = (void **)(a1 + 8);
    do
    {
      free(*(v3 - 1));
      v4 = *v3;
      v3 += 2;
      free(v4);
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_100003A48(int a1, const std::__fs::filesystem::path *__filename, const char *a3, const char *a4, const char *a5)
{
  uint64_t result;
  FILE *v11;
  FILE *v12;
  char v13;
  unsigned __int8 v14;
  int v15;
  char *v16;
  std::error_code *v17;
  std::__fs::filesystem::path __filenamea[10];
  char __s2[1024];
  char __s1[1024];

  result = (uint64_t)fopen((const char *)__filename, "r");
  if (result)
  {
    v11 = (FILE *)result;
    __strcpy_chk(__filenamea, __filename, 255);
    __strcat_chk(__filenamea, ".new", 255);
    result = (uint64_t)fopen((const char *)__filenamea, "w");
    if (result)
    {
      v12 = (FILE *)result;
      if (a1 == 32)
        v13 = 32;
      else
        v13 = 9;
      if (a1 == 61)
        v14 = 61;
      else
        v14 = v13;
      if (feof(v11))
        goto LABEL_10;
      v15 = 0;
      do
      {
        fgets(__s1, 1024, v11);
        __strcpy_chk(__s2, a3, 1024);
        __strcat_chk(__s2, a4, 1024);
        v16 = strstr(__s1, __s2);
        if (v16 && v16 == __s1)
        {
          puts("finding");
          if (!feof(v11))
            fprintf(v12, "%s%s%c%s\n", a3, a4, v14, a5);
          v15 = 1;
        }
        else if (!feof(v11))
        {
          fputs(__s1, v12);
        }
      }
      while (!feof(v11));
      if (!v15)
LABEL_10:
        fprintf(v12, "%s%s%c%s\n", a3, a4, v14, a5);
      fclose(v11);
      fclose(v12);
      unlink((const char *)__filename);
      rename(__filenamea, __filename, v17);
      return 1;
    }
  }
  return result;
}

uint64_t sub_100003C48(char *a1, char *a2, size_t a3)
{
  int v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  int v13;
  char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[4080];

  asl_log(0, 0, 5, "Reading configuration file '%s'\n", a1);
  v6 = sub_1000035B0(61, a1, (uint64_t)v32);
  if (v6)
  {
    v7 = v6;
    v8 = &a2[a3];
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    sub_1000037FC("SSID", (char *)&v16, (uint64_t)v32, v6);
    v9 = snprintf(a2, a3, "SSID=%s\n", (const char *)&v16);
    v16 = 0u;
    v17 = 0u;
    v10 = &a2[v9];
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    sub_1000037FC("WAI", (char *)&v16, (uint64_t)v32, v7);
    v11 = snprintf(v10, v8 - v10, "WAI=%s\n", (const char *)&v16);
    v16 = 0u;
    v17 = 0u;
    v12 = &v10[v11];
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    sub_1000037FC("WPI", (char *)&v16, (uint64_t)v32, v7);
    v13 = snprintf(v12, v8 - v12, "WPI=%s\n", (const char *)&v16);
    v16 = 0u;
    v17 = 0u;
    v14 = &v12[v13];
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    sub_1000037FC("PSK_KEY_TYPE", (char *)&v16, (uint64_t)v32, v7);
    LODWORD(v14) = (_DWORD)v14 + snprintf(v14, v8 - v14, "PSK_KEY_TYPE=%s\n", (const char *)&v16);
    sub_100003A04((uint64_t)v32, v7);
    return ((_DWORD)v14 - (_DWORD)a2);
  }
  else
  {
    asl_log(0, 0, 5, "no keys and values pair in configuration file '%s'\n", a1);
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100003E98()
{
  return 0;
}

uint64_t sub_100003EA0(uint64_t a1, uint64_t a2, int a3, unsigned int *a4)
{
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  char v9;

  v6 = __rev16(*(unsigned __int16 *)(a2 + 2));
  switch(v6)
  {
    case 3u:
      sub_1000031A4(1, "STATUS Req", a2, a3);
      v8 = lib_get_wapi_state() - 1;
      if (v8 > 9)
        v9 = 0;
      else
        v9 = byte_100019DE0[v8];
      *(_BYTE *)(a2 + 8) = v9;
      *(_BYTE *)(a2 + 9) = 0;
      *(_WORD *)(a2 + 6) = 512;
      v7 = 10;
      sub_1000031A4(1, "STATUS Res", a2, 10);
      break;
    case 0x214u:
      asl_log(0, 0, 5, "certificate verify result: %d\n\n", 0);
      *(_WORD *)(a2 + 2) = 5378;
      *(_DWORD *)(a2 + 6) = 512;
      v7 = 10;
      break;
    case 0x212u:
      sub_100005CC4(a1);
      *(_WORD *)(a2 + 2) = 4866;
      *(_WORD *)(a2 + 6) = 0;
      usleep(0x7D0u);
      v7 = 8;
      break;
    default:
      v7 = 0;
      break;
  }
  *a4 = v6;
  return v7;
}

uint64_t sub_100003FBC(uint64_t a1)
{
  int v2;
  int v3;
  sockaddr v5;

  *(_DWORD *)(a1 + 204) = -1;
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    perror("socket(PF_INET)");
    return 0xFFFFFFFFLL;
  }
  v3 = v2;
  *(_WORD *)&v5.sa_len = 512;
  *(_QWORD *)&v5.sa_data[6] = 0;
  *(_DWORD *)&v5.sa_data[2] = inet_addr("127.0.0.1");
  *(_WORD *)v5.sa_data = 10787;
  if (bind(v3, &v5, 0x10u) < 0)
  {
    perror("bind(AF_INET)");
    close(v3);
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 204) = v3;
  sub_1000042CC(v3, (uint64_t)sub_1000040B8, a1, 0);
  return 0;
}

void sub_1000040B8(int a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  socklen_t v8;
  sockaddr v9;
  _BYTE v10[2000];

  *(_QWORD *)&v9.sa_len = 0;
  *(_QWORD *)&v9.sa_data[6] = 0;
  v8 = 16;
  v4 = recvfrom(a1, v10, 0x7CFuLL, 0, &v9, &v8);
  v5 = v4;
  if ((v4 & 0x80000000) != 0)
  {
    perror("recvfrom(ctrl_iface)");
  }
  else
  {
    sub_1000031A4(1, "From CGI", (uint64_t)v10, v4);
    v6 = sub_100003EA0(a2, (uint64_t)v10, v5, &v7);
    if (v6)
      sendto(a1, v10, v6, 0, &v9, v8);
  }
}

uint64_t sub_1000041A0(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 200);
  if ((result & 0x80000000) == 0)
  {
    sub_100004480(result);
    result = close(*(_DWORD *)(a1 + 200));
    *(_DWORD *)(a1 + 200) = -1;
  }
  return result;
}

uint64_t sub_1000041D8(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 204);
  if ((result & 0x80000000) == 0)
  {
    sub_100004480(result);
    result = close(*(_DWORD *)(a1 + 204));
    *(_DWORD *)(a1 + 204) = -1;
  }
  return result;
}

double sub_100004210(uint64_t a1)
{
  double result;

  qword_100020248 = 0;
  result = 0.0;
  unk_100020208 = 0u;
  unk_1000201F8 = 0u;
  unk_1000201E8 = 0u;
  unk_1000201D8 = 0u;
  unk_1000201C8 = 0u;
  unk_1000201B8 = 0u;
  unk_1000201A8 = 0u;
  unk_100020198 = 0u;
  unk_100020188 = 0u;
  unk_100020178 = 0u;
  unk_100020168 = 0u;
  unk_100020158 = 0u;
  *(_OWORD *)&byte_100020148 = 0u;
  unk_100020138 = 0u;
  unk_100020128 = 0u;
  qword_100020110 = a1;
  xmmword_100020118 = 0u;
  xmmword_100020228 = 0u;
  unk_100020238 = 0u;
  xmmword_100020218 = 0u;
  return result;
}

uint64_t sub_100004270(__CFSocket *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t Native;

  asl_log(0, 0, 5, "%s\n", "runloopReadSockCallback");
  Native = CFSocketGetNative(a1);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))a5)(Native, *(_QWORD *)(a5 + 8), *(_QWORD *)(a5 + 16));
}

uint64_t sub_1000042CC(CFSocketNativeHandle a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFRunLoopRef Current;
  _QWORD *v9;
  __CFSocket *v10;
  __CFSocket *v11;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v13;
  __CFRunLoop *v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFSocketContext context;
  CFSocketNativeHandle valuePtr;

  valuePtr = a1;
  Current = CFRunLoopGetCurrent();
  asl_log(0, 0, 5, "%s, %p\n", "eloop_register_read_sock", Current);
  v9 = malloc_type_malloc(0x18uLL, 0x80040D6874129uLL);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = v9;
  *v9 = a2;
  v9[1] = a3;
  v9[2] = a4;
  v10 = CFSocketCreateWithNative(kCFAllocatorDefault, a1, 1uLL, (CFSocketCallBack)sub_100004270, &context);
  if (!v10)
  {
    asl_log(0, 0, 5, "%s, CFSocketCreateWithNative failed!\n\n", "eloop_register_read_sock");
    return 0xFFFFFFFFLL;
  }
  v11 = v10;
  RunLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, v10, 0);
  if (!RunLoopSource)
  {
    asl_log(0, 0, 5, "%s, CFSocketCreateRunLoopSource failed!\n\n", "eloop_register_read_sock");
    CFRelease(v11);
    return 0xFFFFFFFFLL;
  }
  v13 = RunLoopSource;
  v14 = CFRunLoopGetCurrent();
  CFRunLoopAddSource(v14, v13, kCFRunLoopDefaultMode);
  CFRelease(v13);
  if (qword_100020750
    || (qword_100020750 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0)
  {
    v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v15)
    {
      v16 = v15;
      CFDictionaryAddValue((CFMutableDictionaryRef)qword_100020750, v15, v11);
      CFRelease(v16);
    }
  }
  CFRelease(v11);
  return 0;
}

void sub_100004480(int a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  __CFSocket *Value;
  __CFSocket *v4;
  int valuePtr;

  valuePtr = a1;
  if (qword_100020750)
  {
    v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v1)
    {
      v2 = v1;
      Value = (__CFSocket *)CFDictionaryGetValue((CFDictionaryRef)qword_100020750, v1);
      if (Value)
      {
        v4 = Value;
        CFSocketInvalidate(Value);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100020750, v4);
      }
      CFRelease(v2);
    }
  }
}

uint64_t sub_100004504(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))a2)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
}

uint64_t sub_100004510(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  UInt8 *v11;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v13;
  __CFRunLoopTimer *v14;
  __CFRunLoop *v15;
  CFDataRef v16;
  CFDataRef v17;
  CFRunLoopTimerContext v19;

  v10 = malloc_type_malloc(0x18uLL, 0x80040D6874129uLL);
  v19.version = 0;
  memset(&v19.retain, 0, 24);
  v19.info = v10;
  *v10 = a3;
  v10[1] = a4;
  v10[2] = a5;
  v11 = (UInt8 *)malloc_type_malloc(0x18uLL, 0x396C1CBEuLL);
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  *((_QWORD *)v11 + 2) = a5;
  Current = CFAbsoluteTimeGetCurrent();
  v13 = CFRunLoopTimerCreate(kCFAllocatorDefault, (double)a2 / 1000000.0 + Current + (double)a1, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100004504, &v19);
  if (v13)
  {
    v14 = v13;
    v15 = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(v15, v14, kCFRunLoopDefaultMode);
    if (qword_100020758
      || (qword_100020758 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0)
    {
      v16 = CFDataCreate(kCFAllocatorDefault, v11, 24);
      if (v16)
      {
        v17 = v16;
        CFDictionaryAddValue((CFMutableDictionaryRef)qword_100020758, v16, v14);
        CFRelease(v17);
      }
    }
    CFRelease(v14);
  }
  free(v11);
  return 0;
}

CFIndex sub_100004680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  UInt8 *v7;
  CFDataRef v8;
  CFDataRef v9;
  __CFRunLoopTimer *Value;
  CFIndex Count;
  uint64_t v12;
  unint64_t v13;
  const void **v14;
  size_t v15;
  uint64_t v17;

  if (a2 == -1)
  {
    asl_log(0, 0, 5, "cancel ELOOP_ALL_CTX requested\n");
    Count = CFDictionaryGetCount((CFDictionaryRef)qword_100020758);
    v12 = Count;
    __chkstk_darwin();
    v14 = (const void **)((char *)&v17 - ((v13 + 15) & 0xFFFFFFFF0));
    if (v13 >= 0x200)
      v15 = 512;
    else
      v15 = v13;
    bzero((char *)&v17 - ((v13 + 15) & 0xFFFFFFFF0), v15);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100020758, 0, v14);
    if ((int)Count >= 1)
    {
      do
      {
        if (*v14)
        {
          asl_log(0, 0, 5, "cancelling timer %p\n", *v14);
          CFRunLoopTimerInvalidate((CFRunLoopTimerRef)*v14);
        }
        ++v14;
        --v12;
      }
      while (v12);
    }
    CFDictionaryRemoveAllValues((CFMutableDictionaryRef)qword_100020758);
  }
  else
  {
    v6 = malloc_type_malloc(0x18uLL, 0x80040D6874129uLL);
    *v6 = a1;
    v6[1] = a2;
    v6[2] = a3;
    v7 = (UInt8 *)malloc_type_malloc(0x18uLL, 0x75F151CCuLL);
    *(_QWORD *)v7 = a1;
    *((_QWORD *)v7 + 1) = a2;
    *((_QWORD *)v7 + 2) = a3;
    if (qword_100020758 && (v8 = CFDataCreate(kCFAllocatorDefault, v7, 24)) != 0)
    {
      v9 = v8;
      Value = (__CFRunLoopTimer *)CFDictionaryGetValue((CFDictionaryRef)qword_100020758, v8);
      Count = (CFIndex)Value;
      if (Value)
      {
        CFRunLoopTimerInvalidate(Value);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100020750, (const void *)Count);
        Count = 1;
      }
      CFRelease(v9);
    }
    else
    {
      Count = 0;
    }
    free(v7);
    free(v6);
  }
  return Count;
}

void sub_100004884(int a1)
{
  CFRunLoopRef Current;
  __CFRunLoop *v3;
  int v4;

  v4 = a1;
  asl_log(0, 0, 5, "%s, signal = %d\n", "eloop_handle_signals", a1);
  Current = CFRunLoopGetCurrent();
  if (a1 == 1)
  {
    asl_log(0, 0, 5, "%s, stopping the run loop %p\n", "eloop_handle_signals", Current);
    v3 = CFRunLoopGetCurrent();
    CFRunLoopStop(v3);
    pthread_exit(&v4);
  }
  CFRunLoopStop(Current);
}

uint64_t sub_100004908(int a1)
{
  asl_log(0, 0, 5, "%s, signal = %d\n", "eloop_register_signal", a1);
  signal(a1, (void (__cdecl *)(int))sub_100004884);
  return 0;
}

uint64_t sub_100004964()
{
  CFRunLoopRef Current;

  Current = CFRunLoopGetCurrent();
  asl_log(0, 0, 5, "eloop_run %p\n", Current);
  CFRunLoopRun();
  return asl_log(0, 0, 5, "eloop_run done\n");
}

void sub_1000049B8()
{
  HIDWORD(qword_100020248) = 1;
}

void sub_1000049C8()
{
  exit(0);
}

uint64_t sub_1000049D8()
{
  return HIDWORD(qword_100020248);
}

uint64_t sub_1000049E4()
{
  int wapi_state;
  uint64_t result;

  wapi_state = lib_get_wapi_state();
  result = asl_log(0, 0, 5, "%s: wapi state = %d\n", "wapi_supplicant_watchdog", wapi_state);
  if (wapi_state <= 6)
    exit(0);
  return result;
}

uint64_t start(int a1, char *const *a2)
{
  kern_return_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  char *v9;
  char *v10;
  int v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  mach_msg_return_t v19;
  int v20;
  char *v21;
  mach_port_t sp;

  sp = 0;
  v4 = bootstrap_check_in(bootstrap_port, "com.apple.wapi.client", &sp);
  if (!v4)
  {
    asl_log(0, 0, 5, "%s started..\n", *(const char **)a2);
    v19 = mach_msg_server((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_10000AB8C, 0x9Cu, sp, 0);
    v20 = v19;
    if (v19)
    {
      v21 = mach_error_string(v19);
      asl_log(0, 0, 5, "mach_msg_server(mp): %s\n", v21);
    }
    exit(v20);
  }
  printf("Not invoked via launchd (%d);\n", v4);
  v5 = sub_100005754();
  if (v5)
  {
    v6 = (void *)v5;
    sub_100004210(v5);
    v7 = getopt(a1, a2, "Bc:D:dehi:KLNqtvw");
    if (v7 < 0)
    {
      v10 = 0;
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      do
      {
        if (v7 > 112)
        {
          switch(v7)
          {
            case 'q':
              v11 = dword_100020000 + 1;
LABEL_14:
              dword_100020000 = v11;
              goto LABEL_19;
            case 't':
              v12 = &dword_10002010C;
              goto LABEL_17;
            case 'v':
              sub_100005748();
              return 0xFFFFFFFFLL;
            case 'w':
              ++v8;
              goto LABEL_19;
            default:
LABEL_27:
              sub_1000056C0();
              return 0xFFFFFFFFLL;
          }
        }
        switch(v7)
        {
          case 'c':
            v10 = optarg;
            goto LABEL_19;
          case 'd':
            v11 = dword_100020000 - 1;
            goto LABEL_14;
          case 'e':
          case 'f':
          case 'g':
          case 'h':
            goto LABEL_27;
          case 'i':
            v9 = optarg;
            goto LABEL_19;
          default:
            if (v7 == 66)
              goto LABEL_19;
            if (v7 != 75)
              goto LABEL_27;
            v12 = &dword_100020108;
            break;
        }
LABEL_17:
        ++*v12;
LABEL_19:
        v7 = getopt(a1, a2, "Bc:D:dehi:KLNqtvw");
      }
      while ((v7 & 0x80000000) == 0);
    }
    if (WIFI_lib_init())
    {
LABEL_23:
      sub_1000057AC((uint64_t)v6);
      free(v6);
      WIFI_lib_exit();
      sub_1000049C8();
    }
    if (!sub_1000058AC((uint64_t)v6, v10, 0, v9))
    {
      if (!sub_100005A80((uint64_t)v6, v8))
      {
        sub_100005E80((uint64_t)v6, 0, 0x186A0u, v13, v14, v15, v16, v17);
        sub_100004908(2);
        sub_100004908(15);
        sub_100004908(1);
        sub_100004964();
        sub_100006124((uint64_t)v6);
      }
      goto LABEL_23;
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_100004D20(int a1, uint64_t a2)
{
  asl_log(0, 0, 5, "Signal %d received - reconfiguring\n", a1);
  if ((sub_100005CC4(a2) & 0x80000000) != 0)
    sub_1000049B8();
}

char *sub_100004D7C(const __CFDictionary *a1)
{
  char *v2;
  char *v3;
  int Count;
  void *v5;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  const __CFBoolean *v8;
  const __CFData *v9;
  const __CFData *v10;
  _WORD *v11;
  const UInt8 *BytePtr;
  int v13;
  unsigned __int8 *v14;
  const __CFNumber *v15;
  int v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  char *v20;
  char *v21;
  const __CFNumber *v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  CFIndex Length;
  int MaximumSizeForEncoding;
  size_t v28;
  void *v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  const char *v34;
  int valuePtr;
  _OWORD v36[128];
  _BYTE v37[2052];

  asl_log(0, 0, 5, "%s\n", v34);
  v2 = (char *)malloc_type_malloc(0x68uLL, 0x1010040FC24F789uLL);
  v3 = v2;
  if (v2)
  {
    memset(v36, 0, 512);
    *((_QWORD *)v2 + 12) = 0;
    *((_OWORD *)v2 + 4) = 0u;
    *((_OWORD *)v2 + 5) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    *(_OWORD *)v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    asl_log(0, 0, 5, "Parsing configuration file dictionary\n");
    Count = CFDictionaryGetCount(a1);
    asl_log(0, 0, 5, "%s; prop_count %d\n", "wapi_config_init", Count);
    if (!Count)
    {
      asl_log(0, 0, 5, "no keys and values pair in configuration dictionary\n");
      goto LABEL_51;
    }
    *((_DWORD *)v3 + 23) = 0;
    v5 = (void *)*((_QWORD *)v3 + 12);
    if (v5)
    {
      free(v5);
      *((_QWORD *)v3 + 12) = 0;
    }
    Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("PRIVATE_MAC_ADDRESS"));
    if (Value)
    {
      v7 = Value;
      asl_log(0, 0, 5, "%s WFMacRandomisation : Parsing Private MAC dictionary\n", "wapi_config_init");
      v8 = (const __CFBoolean *)CFDictionaryGetValue(v7, CFSTR("PRIVATE_MAC_ADDRESS_VALID"));
      if (v8)
      {
        if (v8 == kCFBooleanTrue)
        {
          v9 = (const __CFData *)CFDictionaryGetValue(v7, CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));
          if (v9)
          {
            v10 = v9;
            if (CFDataGetLength(v9) == 6)
            {
              *((_DWORD *)v3 + 23) = 1;
              v11 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
              *((_QWORD *)v3 + 12) = v11;
              BytePtr = CFDataGetBytePtr(v10);
              v13 = *(_DWORD *)BytePtr;
              v11[2] = *((_WORD *)BytePtr + 2);
              *(_DWORD *)v11 = v13;
              v14 = (unsigned __int8 *)*((_QWORD *)v3 + 12);
              asl_log(0, 0, 5, "%s WFMacRandomisation : Private MAC address being configured :  %02x:%02x:%02x:%02x:%02x:%02x\n \n", "wapi_config_init", *v14, v14[1], v14[2], v14[3], v14[4], v14[5]);
            }
          }
        }
      }
    }
    v15 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("WAPI"));
    if (v15)
    {
      valuePtr = 0;
      if (CFNumberGetValue(v15, kCFNumberIntType, &valuePtr))
        *((_DWORD *)v3 + 13) = valuePtr;
    }
    asl_log(0, 0, 5, "%s; config->wapi_policy %x\n", "wapi_config_init", *((_DWORD *)v3 + 13));
    v16 = *((_DWORD *)v3 + 13);
    if ((v16 & 8) != 0)
    {
      v17 = 1;
    }
    else
    {
      if ((v16 & 4) == 0)
      {
        v17 = 0;
        LODWORD(v36[0]) = 0;
        if (!v16)
          goto LABEL_23;
        goto LABEL_22;
      }
      v17 = 2;
    }
    LODWORD(v36[0]) = v17;
LABEL_22:
    *(_QWORD *)(v3 + 60) = 0x1000000010;
LABEL_23:
    v18 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("SSID_STR"));
    if (v18)
    {
      v19 = v18;
      *((_QWORD *)v3 + 1) = CFStringGetLength(v18);
      v20 = (char *)malloc_type_malloc(0x20uLL, 0x3DDAE976uLL);
      if (CFStringGetCString(v19, v20, 32, 0x8000100u))
      {
        v21 = strdup(v20);
        *(_QWORD *)v3 = v21;
      }
      else
      {
        v21 = *(char **)v3;
      }
      asl_log(0, 0, 5, "%s: SSID=%s (%d)\n", "wapi_config_init", v21, *((_QWORD *)v3 + 1));
      free(v20);
    }
    v22 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("PSK_KEY_TYPE"));
    if (v22)
    {
      valuePtr = 0;
      if (CFNumberGetValue(v22, kCFNumberIntType, &valuePtr))
        v23 = valuePtr;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    asl_log(0, 0, 5, "PSK_KEY_TYPE '%d'\n", v23);
    if (v17 != 1)
    {
LABEL_45:
      if (v17 == 1)
      {
LABEL_50:
        WAI_CNTAPPARA_SET(v36);
        return v3;
      }
      if (v17 != 2)
        goto LABEL_51;
LABEL_47:
      v31 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("PSK"));
      if (v31)
      {
        v32 = v31;
        DWORD1(v36[0]) = v23;
        DWORD2(v36[0]) = CFStringGetLength(v31);
        if (!CFStringGetCString(v32, (char *)((unint64_t)v36 | 0xC), 128, 0x8000100u))
        {
          asl_log(0, 0, 5, "unable to get PSK '%s'\n");
          goto LABEL_51;
        }
        sub_1000035A4(1, "PSK ", (char *)((unint64_t)v36 | 0xC), DWORD2(v36[0]));
      }
      goto LABEL_50;
    }
    LOWORD(qword_100020248) = 1;
    v24 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("CERT"));
    if (v24)
    {
      v25 = v24;
      Length = CFStringGetLength(v24);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      if (MaximumSizeForEncoding >= 1)
      {
        v28 = MaximumSizeForEncoding;
        v29 = malloc_type_malloc(MaximumSizeForEncoding, 0xEF36E17FuLL);
        bzero(v29, v28);
        if (!CFStringGetCString(v25, (char *)v29, v28, 0x8000100u))
        {
          asl_log(0, 0, 5, "Could not decode cert from string!\n");
          goto LABEL_42;
        }
        v30 = strlen((const char *)v29);
        if (sub_10000765C((char *)v29, v30, (uint64_t)v37, 2048, (char *)v36 + 4, 2048))
        {
          asl_log(0, 0, 5, "Could not parse cert data!\n");
LABEL_42:
          free(v29);
          goto LABEL_51;
        }
        sub_1000031A4(4, "User cert: ", (uint64_t)v37, 128);
        free(v29);
      }
      v17 = v36[0];
      goto LABEL_45;
    }
    asl_log(0, 0, 5, "WAPI Certificate mode but there is no certificate!\n");
    if ((v3[52] & 4) != 0)
    {
      asl_log(0, 0, 5, "Trying PSK\n");
      LODWORD(v36[0]) = 2;
      goto LABEL_47;
    }
LABEL_51:
    free(v3);
    return 0;
  }
  return v3;
}

uint64_t sub_100005354(uint64_t a1)
{
  _QWORD *v2;
  pthread_t v3;
  char *v4;
  passwd *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD, _QWORD);

  v2 = *(_QWORD **)(a1 + 32);
  v3 = pthread_self();
  asl_log(0, 0, 5, "%s thread %p\n", "run_wapi_thread", v3);
  if (v2)
  {
    sub_100004210((uint64_t)v2);
    asl_log(0, 0, 5, "%s ifname=%s\n", "run_wapi_thread", (const char *)(a1 + 4));
    if (WIFI_lib_init())
    {
      asl_log(0, 0, 5, "%s wapic already initialized..reconfiguring\n", "run_wapi_thread");
LABEL_4:
      v4 = sub_100004D7C(*(const __CFDictionary **)(a1 + 24));
      v2[16] = v4;
      if (v4 && !sub_100005A80((uint64_t)v2, 1))
      {
        v6 = getpwnam("mobile");
        if (v6)
        {
          if (setuid(v6->pw_uid))
            asl_log(0, 0, 5, "%s ERROR: unabled to switch to mobile user\n");
        }
        else
        {
          asl_log(0, 0, 5, "%s ERROR:to getpwnam() \n");
        }
        if (*(_QWORD *)(a1 + 24))
        {
          asl_log(0, 0, 5, "%s calling  wpa_drv_set_scan_result wpa_s = %p\n", "run_wapi_thread", v2);
          v12 = *(void (**)(_QWORD, _QWORD))(v2[23] + 120);
          if (v12)
            v12(v2[20], *(_QWORD *)(a1 + 24));
        }
        else
        {
          sub_100005E80((uint64_t)v2, 0, 0x186A0u, v7, v8, v9, v10, v11);
        }
        sub_100004908(2);
        sub_100004908(15);
        sub_100004510(0x10u, 0, (uint64_t)sub_1000049E4, *(_QWORD *)(a1 + 32), 0);
        sub_100004908(1);
        sub_100004964();
        asl_log(0, 0, 5, "%s done...\n", "run_wapi_thread");
      }
      dword_100020100 = -1;
      free((void *)a1);
      free(v2);
      WIFI_lib_exit();
      sub_1000049C8();
    }
    if (!sub_1000058AC((uint64_t)v2, 0, 0, (const char *)(a1 + 4)))
      goto LABEL_4;
    asl_log(0, 0, 5, "%s wapi_asue_init failed\n", "run_wapi_thread");
  }
  return -1;
}

char *sub_1000055B4(char *a1, const void *a2, int a3)
{
  memcpy(a1, a2, a3);
  return &a1[a3];
}

uint64_t sub_1000055E0(uint64_t a1)
{
  if (a1)
  {
    sub_1000039D0(*(void **)a1, *(_DWORD *)(a1 + 12));
    sub_1000039D0((void *)a1, 24);
  }
  return 0;
}

void sub_10000561C(uint64_t a1)
{
  void *v2;

  *(_WORD *)(a1 + 250) = 0;
  v2 = *(void **)(a1 + 256);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 256) = 0;
  }
}

void *sub_10000564C(uint64_t a1, const void *a2, int a3)
{
  void *v6;
  void *result;

  v6 = *(void **)(a1 + 256);
  if (v6)
  {
    free(v6);
    *(_QWORD *)(a1 + 256) = 0;
  }
  result = malloc_type_malloc(a3, 0x260700EuLL);
  *(_QWORD *)(a1 + 256) = result;
  if (result)
  {
    bzero(result, a3);
    result = memcpy(*(void **)(a1 + 256), a2, a3);
    *(_WORD *)(a1 + 250) = a3;
  }
  return result;
}

uint64_t sub_1000056C0()
{
  const char **v0;
  uint64_t *v1;
  const char **v2;

  printf("%s\n\nusage:\n  %s [-BddehqqvwW] [-P<pid file>] [-g<global ctrl>] \\\n        -i<ifname> -c<config file> [-C<ctrl>]\ndrivers:\n", "wapi_ASUE v1.1.0\nCopyright (c) 2006-2008, Iwncomm Ltd.", "wapic");
  v0 = (const char **)off_100020008;
  if (off_100020008)
  {
    v1 = &qword_100020010;
    do
    {
      printf("  %s = %s\n", *v0, v0[1]);
      v2 = (const char **)*v1++;
      v0 = v2;
    }
    while (v2);
  }
  puts("options:\n  -B = run daemon in the background\n  -c = Configuration file\n  -C = ctrl_interface parameter (only used if -c is not)\n  -i = interface name\n  -d = increase debugging verbosity (-dd even more)\n  -K = include keys (passwords, etc.) in debug output\n  -t = include timestamp in debug messages\n  -h = show this help text\n  -p = driver parameters\n  -P = PID file\n  -q = decrease debugging verbosity (-qq even less)\n  -v = show version\n  -w = wait for interface to be added, if needed\n  -W = wait for a control interface monitor before starting");
  return puts("example:\n  wapic -i wlan0 -c /etc/wapi.conf");
}

uint64_t sub_100005748()
{
  return puts("wapi_ASUE v1.1.0\nCopyright (c) 2006-2008, Iwncomm Ltd.");
}

uint64_t sub_100005754()
{
  uint64_t v0;
  void *v1;

  v0 = qword_100020760;
  if (!qword_100020760)
  {
    v1 = malloc_type_malloc(0x310uLL, 0x10B004078D88A19uLL);
    v0 = (uint64_t)v1;
    qword_100020760 = (uint64_t)v1;
    if (v1)
      bzero(v1, 0x310uLL);
  }
  return v0;
}

uint64_t sub_1000057AC(uint64_t a1)
{
  uint64_t (*v2)(void);
  int v3;
  void (*v4)(_QWORD);
  void **v5;
  void *v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 160))
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 184) + 56);
    if (!v2 || (v3 = v2(), asl_log(0, 0, 5, "WPA: in %s:%d,ret=%d\n", "wpa_drv_set_wpa", 54, v3), v3 < 0))
      fwrite("Failed to disable WPA in the driver.\n", 0x25uLL, 1uLL, __stderrp);
    v4 = *(void (**)(_QWORD))(*(_QWORD *)(a1 + 184) + 80);
    if (v4)
      v4(*(_QWORD *)(a1 + 160));
  }
  sub_100007D7C(*(uint64_t **)a1);
  *(_QWORD *)a1 = 0;
  sub_1000041D8(a1);
  v5 = *(void ***)(a1 + 128);
  if (v5)
  {
    sub_100006F30(v5);
    *(_QWORD *)(a1 + 128) = 0;
  }
  free(*(void **)(a1 + 120));
  *(_QWORD *)(a1 + 120) = 0;
  v6 = *(void **)(a1 + 168);
  if (v6)
  {
    free(v6);
    *(_QWORD *)(a1 + 168) = 0;
    *(_DWORD *)(a1 + 176) = 0;
  }
  sub_10000561C(a1);
  result = sub_1000055E0(*(_QWORD *)(a1 + 216));
  *(_QWORD *)(a1 + 216) = result;
  return result;
}

uint64_t sub_1000058AC(uint64_t a1, char *a2, const char *a3, const char *a4)
{
  const char *v8;
  char **v9;
  uint64_t *v10;
  char **v11;
  const char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char **v16;
  const char *v18;

  v8 = "default";
  if (a3)
    v8 = a3;
  asl_log(0, 0, 5, "Initializing interface '%s' conf '%s' driver '%s'\n", a4, a2, v8);
  if (!a1)
    return 0xFFFFFFFFLL;
  v9 = off_100020008;
  if (!off_100020008)
  {
    v12 = "No driver interfaces build into wpa_supplicant.\n";
LABEL_14:
    asl_log(0, 0, 5, v12, v18);
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    v10 = &qword_100020010;
    while (strcmp(a3, *v9))
    {
      v11 = (char **)*v10++;
      v9 = v11;
      if (!v11)
      {
        v18 = a3;
        v12 = "Unsupported driver '%s'.\n\n";
        goto LABEL_14;
      }
    }
  }
  *(_QWORD *)(a1 + 184) = v9;
  if (a4)
  {
    if (strlen(a4) < 0x64)
    {
      strncpy((char *)(a1 + 20), a4, 0x64uLL);
      v13 = v9[9];
      if (v13)
      {
        v14 = ((uint64_t (*)(uint64_t, uint64_t))v13)(a1, a1 + 20);
        *(_QWORD *)(a1 + 160) = v14;
        if (v14)
        {
          if (a2)
          {
            v15 = sub_100003070(a2);
            *(_QWORD *)(a1 + 120) = v15;
            if (!v15)
            {
              asl_log(0, 0, 5, "Failed to get absolute path for configuration file '%s'.\n");
              return 0xFFFFFFFFLL;
            }
            asl_log(0, 0, 5, "Configuration file '%s' -> '%s'\n", a2, v15);
            v16 = sub_100006FEC(*(char **)(a1 + 120));
            *(_QWORD *)(a1 + 128) = v16;
            if (!v16)
            {
              printf("Failed to read configuration file '%s'.\n");
              return 0xFFFFFFFFLL;
            }
          }
          return 0;
        }
      }
      else
      {
        *(_QWORD *)(a1 + 160) = 0;
      }
      fwrite("Failed to initialize driver interface\n", 0x26uLL, 1uLL, __stderrp);
    }
    else
    {
      printf("Too long interface name '%s'.\n");
    }
  }
  else
  {
    sub_1000056C0();
    puts("\nInterface name is required.");
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100005A80(uint64_t a1, int a2)
{
  uint64_t (*v4)(_QWORD);
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  int v9;
  uint64_t result;
  uint64_t (*v11)(_QWORD);
  char *v12;
  uint64_t v13;
  FILE *v14;
  const char *v15;
  size_t v16;

  v4 = *(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 184) + 216);
  if (v4)
  {
    v5 = (const char *)v4(*(_QWORD *)(a1 + 160));
    if (v5)
    {
      v6 = v5;
      if (strcmp(v5, (const char *)(a1 + 20)))
      {
        asl_log(0, 0, 5, "Driver interface replaced interface name with '%s'\n", v6);
        strncpy((char *)(a1 + 20), v6, 0x64uLL);
      }
    }
  }
  if (!*(_QWORD *)a1)
  {
    while (1)
    {
      v11 = *(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 184) + 224);
      v12 = v11 ? (char *)v11(*(_QWORD *)(a1 + 160)) : 0;
      v13 = sub_100007A54((_BYTE *)(a1 + 20), v12, 0x88B4u, (uint64_t)sub_100006C2C, a1, 0);
      *(_QWORD *)a1 = v13;
      if (v13)
        break;
      if (!a2)
        return 0xFFFFFFFFLL;
      puts("Waiting for interface..");
      sleep(5u);
    }
    if (sub_100007948(v13, (_BYTE *)(a1 + 8)))
    {
      v14 = __stderrp;
      v15 = "Failed to get own L2 address\n";
      v16 = 29;
      goto LABEL_20;
    }
  }
  asl_log(0, 0, 5, "Own MAC address: %02x:%02x:%02x:%02x:%02x:%02x\n", *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
  asl_log(0, 0, 5, "conf %p\n", *(const void **)(a1 + 128));
  v7 = *(_QWORD *)(a1 + 128);
  if (!v7)
    return 0xFFFFFFFFLL;
  asl_log(0, 0, 5, "wapi_policy %x\n", *(_DWORD *)(v7 + 52));
  v8 = *(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 184) + 56);
  if (!v8
    || (v9 = v8(*(_QWORD *)(a1 + 160), *(unsigned int *)(*(_QWORD *)(a1 + 128) + 52)),
        asl_log(0, 0, 5, "WPA: in %s:%d,ret=%d\n", "wpa_drv_set_wpa", 54, v9),
        v9 < 0))
  {
    v14 = __stderrp;
    v15 = "Failed to enable WPA in the driver.\n";
    v16 = 36;
LABEL_20:
    fwrite(v15, v16, 1uLL, v14);
    return 0xFFFFFFFFLL;
  }
  result = sub_100003FBC(a1);
  if ((_DWORD)result)
  {
    puts("Failed to initialize control interface UI.\nYou may have another wpa_supplicant process already running or the file was\nleft by an unclean termination of wpa_supplicant in which case you will need\nto manually remove this file before starting wpa_supplicant again.");
    return 0;
  }
  return result;
}

uint64_t sub_100005CC4(uint64_t a1)
{
  char *v2;
  char **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD, _QWORD);
  int v19;
  char v21;

  v2 = *(char **)(a1 + 120);
  if (v2)
  {
    v3 = sub_100006FEC(v2);
    if (v3)
    {
      v10 = v3;
      sub_100006F30(*(void ***)(a1 + 128));
      *(_QWORD *)(a1 + 128) = v10;
      *(_QWORD *)(a1 + 148) = *(char **)((char *)v10 + 60);
      sub_100005DB0(v11, v12, "Reconfiguration completed", v13, v14, v15, v16, v17, v21);
      v18 = *(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 184) + 56);
      if (v18)
      {
        v19 = v18(*(_QWORD *)(a1 + 160), *(unsigned int *)(*(_QWORD *)(a1 + 128) + 52));
        asl_log(0, 0, 5, "WPA: in %s:%d,ret=%d\n", "wpa_drv_set_wpa", 54, v19);
        if ((v19 & 0x80000000) == 0)
          return 0;
      }
      fwrite("Failed to enable WPA in the driver.\n", 0x24uLL, 1uLL, __stderrp);
    }
    else
    {
      sub_100005DB0(0, v4, "Failed to parse the configuration file '%s' - exiting", v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 120));
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_100005DB0(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  char *v11;

  v10 = (char *)malloc_type_malloc(0x800uLL, 0x9C08EEF2uLL);
  if (v10)
  {
    v11 = v10;
    vsnprintf(v10, 0x800uLL, a3, &a9);
    asl_log(0, 0, 5, "%s\n", v11);
    free(v11);
  }
  else
  {
    puts("Failed to allocate message buffer for:");
    vprintf(a3, &a9);
    putchar(10);
  }
}

void sub_100005E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005DB0(a1, a2, "Signal %d received - terminating", a4, a5, a6, a7, a8, a1);
  sub_1000049B8();
}

uint64_t sub_100005E80(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;

  v9 = a2;
  sub_100005DB0(a1, a2, "Setting scan request: %d sec %d usec", a4, a5, a6, a7, a8, a2);
  sub_100004680((uint64_t)sub_100005EF0, a1, 0);
  return sub_100004510(v9, a3, (uint64_t)sub_100005EF0, a1, 0);
}

uint64_t sub_100005EF0(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  if (!*(_DWORD *)(result + 140))
  {
    v1 = result;
    v2 = *(uint64_t **)(result + 128);
    if (*((_DWORD *)v2 + 22))
    {
      result = asl_log(0, 0, 5, "No enabled networks - do not scan\n");
      *(_DWORD *)(v1 + 228) = 1;
    }
    else
    {
      v3 = *v2;
      if (*(_DWORD *)(result + 228) <= 1u)
        *(_DWORD *)(result + 228) = 2;
      v4 = "specific";
      if (!v3)
        v4 = "broadcast";
      asl_log(0, 0, 5, "Starting AP scan (%s SSID)\n", v4);
      if (v3)
        v5 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 8);
      else
        v5 = 0;
      v6 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1 + 184) + 104);
      if (!v6 || (result = v6(*(_QWORD *)(v1 + 160), v3, v5), (_DWORD)result))
      {
        asl_log(0, 0, 5, "Failed to initiate AP scan.\n");
        return sub_100005E80(v1, 10, 0);
      }
    }
  }
  return result;
}

uint64_t sub_100005FF8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t (*v10)(_QWORD, void *, uint64_t);
  uint64_t v11;
  unsigned int v12;
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
  void *v26;
  BOOL v27;
  uint64_t result;
  char v29;

  v2 = malloc_type_malloc(0x8C00uLL, 0x100004049EB3C7BuLL);
  if (!v2)
  {
    sub_100005DB0(0, v3, "Failed to allocate memory for scan results", v4, v5, v6, v7, v8, v29);
    return 0xFFFFFFFFLL;
  }
  v9 = v2;
  v10 = *(uint64_t (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 184) + 112);
  if (!v10)
  {
    sub_100005DB0((uint64_t)v2, v3, "Scan results: %d", v4, v5, v6, v7, v8, -1);
    goto LABEL_14;
  }
  v11 = v10(*(_QWORD *)(a1 + 160), v2, 128);
  v12 = v11;
  sub_100005DB0(v11, v13, "Scan results: %d", v14, v15, v16, v17, v18, v11);
  if ((v12 & 0x80000000) != 0)
  {
LABEL_14:
    asl_log(0, 0, 5, "Failed to get scan results\n");
    free(v9);
    return 0xFFFFFFFFLL;
  }
  if (v12 >= 0x81)
  {
    sub_100005DB0(v19, v20, "Not enough room for all APs (%d < %d)", v21, v22, v23, v24, v25, v12);
    v12 = 128;
  }
  v26 = malloc_type_realloc(v9, 280 * v12, 0x100004049EB3C7BuLL);
  if (v26)
    v27 = 1;
  else
    v27 = v12 == 0;
  if (v27)
    v9 = v26;
  free(*(void **)(a1 + 168));
  result = 0;
  *(_QWORD *)(a1 + 168) = v9;
  *(_DWORD *)(a1 + 176) = v12;
  return result;
}

uint64_t sub_100006124(uint64_t result)
{
  int v1;
  uint64_t (*v2)(_QWORD);

  v1 = *(_DWORD *)(result + 14);
  *(_DWORD *)(result + 228) = 0;
  if (v1 | *(unsigned __int16 *)(result + 18))
  {
    v2 = *(uint64_t (**)(_QWORD))(*(_QWORD *)(result + 184) + 144);
    if (v2)
      return v2(*(_QWORD *)(result + 160));
  }
  return result;
}

char *sub_100006158(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  int v3;
  char *v4;
  int v5;

  if (a2 >= 0x20)
    v2 = 32;
  else
    v2 = a2;
  __memcpy_chk(byte_100020768, a1, v2, 33);
  byte_100020768[v2] = 0;
  v3 = byte_100020768[0];
  if (byte_100020768[0])
  {
    v4 = &byte_100020769;
    do
    {
      if ((v3 - 127) <= 0xFFFFFFA0)
        *(v4 - 1) = 95;
      v5 = *v4++;
      v3 = v5;
    }
    while (v5);
  }
  return byte_100020768;
}

const char *sub_1000061D4(unsigned int a1)
{
  if (a1 > 2)
    return "UNKNOWN";
  else
    return off_10001C598[a1];
}

const char *sub_1000061F8(unsigned int a1)
{
  if (a1 > 0xB)
    return "UNKNOWN";
  else
    return off_10001C5B0[a1];
}

const char *sub_10000621C()
{
  return "1";
}

const char *sub_100006228()
{
  return "60";
}

uint64_t sub_100006234(uint64_t result)
{
  int v1;
  uint64_t (*v2)(_QWORD);

  v1 = *(_DWORD *)(result + 14);
  *(_DWORD *)(result + 228) = 0;
  if (v1 | *(unsigned __int16 *)(result + 18))
  {
    v2 = *(uint64_t (**)(_QWORD))(*(_QWORD *)(result + 184) + 152);
    if (v2)
      return v2(*(_QWORD *)(result + 160));
  }
  return result;
}

uint64_t sub_100006268(uint64_t a1, char *a2, int a3)
{
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD, _QWORD *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int16 v25;
  _QWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v5 = a3;
  result = sub_1000032E4(1, "Current ssid:", a2, a3);
  v26[0] = 0;
  v28 = 0u;
  v29 = 0u;
  v26[1] = a2;
  v27 = v5;
  v30 = 2;
  v7 = *(unsigned int *)(a1 + 176);
  if ((int)v7 < 1)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    v8 = 0;
    v9 = *(_QWORD *)(a1 + 168) + 144;
    while (1)
    {
      result = memcmp(a2, (const void *)(v9 - 128), *(_QWORD *)(v9 - 136));
      if (!(_DWORD)result)
        break;
      ++v8;
      v9 += 280;
      if (v7 == v8)
        goto LABEL_16;
    }
    v10 = *(_QWORD *)v9;
    *(_BYTE *)(a1 + 776) = *(_QWORD *)v9;
    if (v10)
    {
      memcpy((void *)(a1 + 520), (const void *)(v9 + 8), v10);
      v11 = *(_DWORD *)v9;
    }
    else
    {
      v11 = 0;
    }
    result = asl_log(0, 0, 5, "wpa_supplicant_associate, ie len=%d\n\n", v11);
    v12 = *(unsigned __int8 *)(a1 + 777);
    *(_QWORD *)&v28 = a1 + 264;
    *((_QWORD *)&v28 + 1) = v12;
    LODWORD(v12) = *(_DWORD *)(v9 - 144);
    v25 = *(_WORD *)(v9 - 140);
    v24 = v12;
    v26[0] = &v24;
    DWORD2(v27) = *(_DWORD *)(v9 + 108);
    *(_DWORD *)(a1 + 228) = 4;
    if (!(*(_DWORD *)(a1 + 14) | *(unsigned __int16 *)(a1 + 18)))
    {
      asl_log(0, 0, 5, "call wpa_drv_associate\n\n");
      sub_100006434(a1, 10, 0, v13, v14, v15, v16, v17);
      v18 = *(uint64_t (**)(_QWORD, _QWORD *))(*(_QWORD *)(a1 + 184) + 160);
      if (!v18 || (result = v18(*(_QWORD *)(a1 + 160), v26), (_DWORD)result))
        result = puts("wpa_supplicant_associate failed");
      *(_DWORD *)(a1 + 228) = 0;
    }
    LODWORD(v7) = v8;
  }
LABEL_16:
  if ((_DWORD)v7 == *(_DWORD *)(a1 + 176))
  {
    asl_log(0, 0, 5, "No suitable AP found.\n");
    return sub_100005E80(a1, 5, 0, v19, v20, v21, v22, v23);
  }
  return result;
}

uint64_t sub_100006434(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;

  v9 = a2;
  sub_100005DB0(a1, a2, "Setting authentication timeout: %d sec %d usec", a4, a5, a6, a7, a8, a2);
  sub_100004680((uint64_t)sub_1000064A4, a1, 0);
  return sub_100004510(v9, a3, (uint64_t)sub_1000064A4, a1, 0);
}

uint64_t sub_1000064A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_100005DB0(a1, a2, "Authentication with %02x:%02x:%02x:%02x:%02x:%02x timed out.", a4, a5, a6, a7, a8, *(_BYTE *)(a1 + 14));
  sub_100006234(a1);
  *(_DWORD *)(a1 + 136) = 1;
  return sub_100005E80(a1, 5, 0, v9, v10, v11, v12, v13);
}

uint64_t sub_100006518(uint64_t a1, char *a2, unsigned int a3, u_char *a4, size_t a5)
{
  uint64_t v6;
  __int16 v9;
  uint64_t v11;

  v6 = *(_QWORD *)a1;
  if (!v6)
    sub_100015AE0();
  v9 = a3;
  v11 = sub_100007970(v6, a2, a3, a4, a5);
  if (!(_DWORD)v11 && *(_DWORD *)(a1 + 228) <= 0xAu)
    sub_100006C38(a1, (uint64_t)a2, v9, a4, a5);
  return v11;
}

CFIndex sub_100006594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v10;

  sub_100005DB0(a1, a2, "Cancelling authentication timeout", a4, a5, a6, a7, a8, v10);
  return sub_100004680((uint64_t)sub_1000064A4, a1, 0);
}

CFIndex sub_1000065CC(CFIndex result, int a2)
{
  uint64_t v2;
  void (*v3)(_QWORD, unsigned int *);
  unsigned __int16 v4;
  int v5;
  void *v6;
  unsigned __int16 v7;
  double v8;
  uint64_t v9;
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
  char v21;
  uint64_t v22;
  int v23[2];
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned __int16 v27;

  *(_DWORD *)(result + 232) = 0;
  v2 = result;
  switch(a2)
  {
    case 0:
      asl_log(0, 0, 5, "EVENT_ASSOC\n");
      v3 = *(void (**)(_QWORD, unsigned int *))(*(_QWORD *)(v2 + 184) + 32);
      if (v3)
        v3(*(_QWORD *)(v2 + 160), &v26);
      v24 = 0;
      v25 = v26;
      v5 = *(_DWORD *)(v2 + 8);
      WORD2(v25) = v27;
      v4 = v27;
      *(_DWORD *)(v2 + 14) = v26;
      *(_WORD *)(v2 + 18) = v4;
      LODWORD(v24) = v5;
      WORD2(v24) = *(_WORD *)(v2 + 12);
      sub_1000031A4(1, "bssid", (uint64_t)&v26, 6);
      sub_1000031A4(1, "own mac", v2 + 8, 6);
      if (*(_BYTE *)(v2 + 776))
        v6 = (void *)(v2 + 520);
      else
        v6 = 0;
      WAI_Msg_Input(0, (int *)&v25, (int *)&v24, v6, *(unsigned __int8 *)(v2 + 776));
      sub_100005DB0(v14, v15, "Cancelling authentication timeout", v16, v17, v18, v19, v20, v21);
      result = sub_100004680((uint64_t)sub_1000064A4, v2, 0);
      *(_DWORD *)(v2 + 228) = 4;
      break;
    case 1:
      asl_log(0, 0, 5, "Disconnect event \n");
      v22 = 0;
      v23[1] = v27;
      v7 = v27;
      v23[0] = v26;
      *(_DWORD *)(v2 + 14) = v26;
      *(_WORD *)(v2 + 18) = v7;
      WORD2(v22) = *(_WORD *)(v2 + 12);
      LODWORD(v22) = *(_DWORD *)(v2 + 8);
      v8 = WAI_Msg_Input(1, v23, (int *)&v22, 0, 0);
      asl_log(0, 0, 5, "WAI_Msg_Input  success\n", v8);
      *(_DWORD *)(v2 + 228) = 0;
      result = sub_100005E80(v2, 5, 0x186A0u, v9, v10, v11, v12, v13);
      break;
    case 2:
    case 4:
    case 5:
      return result;
    case 3:
      asl_log(0, 0, 5, "Received EVENT_SCAN_RESULTS\n");
      result = sub_100005FF8(v2);
      if (*(_DWORD *)(v2 + 228) != 4)
        result = sub_100006268(v2, **(char ***)(v2 + 128), *(_DWORD *)(*(_QWORD *)(v2 + 128) + 8));
      break;
    default:
      result = asl_log(0, 0, 5, "Unknown event %d\n", a2);
      break;
  }
  return result;
}

uint64_t sub_1000067FC()
{
  return rand();
}

uint64_t sub_100006814()
{
  return sub_100006234(qword_100020110);
}

uint64_t sub_100006828(u_char *a1, unsigned int a2)
{
  int v2;

  v2 = sub_100007970(*(_QWORD *)qword_100020110, (char *)(qword_100020110 + 14), 0x88B4u, a1, a2);
  return v2 & ~(v2 >> 31);
}

uint64_t sub_100006860(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD, uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v7 = qword_100020110;
  v8 = a2;
  sub_1000031A4(1, "WIFI_group_key_set:", a1, a2);
  v9 = *(uint64_t (**)(_QWORD, uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 + 184) + 64);
  if (v9 && (v9(*(_QWORD *)(v7 + 160), 4, "\xFF\xFF\xFF\xFF\xFF\xFF", a3, 1, a4, 16, a1, v8) & 0x80000000) == 0)
    return 0;
  asl_log(0, 0, 5, "WPA: Failed to set MSK to the driver.\n");
  return 0xFFFFFFFFLL;
}

uint64_t sub_100006924(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t);
  _QWORD v9[2];

  v6 = qword_100020110;
  v9[0] = 0;
  v9[1] = 0;
  asl_log(0, 0, 5, "WIFI_unicast_key_set: Installing USK to the driver.\n");
  sub_1000031A4(1, "WIFI_unicast_key_set:", a1, a2);
  v7 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 184) + 64);
  if (v7 && (v7(*(_QWORD *)(v6 + 160), 4, v6 + 14, a3, 1, v9, 16, a1, 32) & 0x80000000) == 0)
    return 0;
  asl_log(0, 0, 5, "WIFI_unicast_key_set: Failed to set PTK to the driver\n");
  return 0xFFFFFFFFLL;
}

void (__cdecl *sub_100006A24(unsigned int a1, unsigned int a2, void (__cdecl *a3)(CFRunLoopTimerRef, void *)))(CFRunLoopTimerRef, void *)
{
  void (__cdecl *result)(CFRunLoopTimerRef, void *);
  double v7;
  __CFRunLoop *Current;

  result = 0;
  if (((a2 | a1) & 0x80000000) == 0 && a3)
  {
    v7 = (double)(int)(1000 * (a1 % 0x3E8)) / 1000000.0 + CFAbsoluteTimeGetCurrent() + (double)(a1 / 0x3E8);
    if (qword_100020790)
      CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_100020790);
    qword_100020790 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, v7, (double)(a2 / 0x3E8), 0, 0, a3, 0);
    if (qword_100020790)
    {
      asl_log(0, 0, 5, "OS_timer_setup rescheduling timer\n");
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(Current, (CFRunLoopTimerRef)qword_100020790, kCFRunLoopDefaultMode);
      CFRelease((CFTypeRef)qword_100020790);
      qword_100020790 = 0;
    }
    return a3;
  }
  return result;
}

void sub_100006B38()
{
  if (qword_100020790)
  {
    CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_100020790);
    CFRelease((CFTypeRef)qword_100020790);
    qword_100020790 = 0;
  }
}

uint64_t sub_100006B6C(const void *a1, int a2)
{
  uint64_t v4;
  void (*v5)(_QWORD, const void *, _QWORD);

  v4 = qword_100020110;
  asl_log(0, 0, 5, " wpa_s = '%p \n", (const void *)qword_100020110);
  asl_log(0, 0, 5, " wpa_driver_set_wpa_ie entry \n");
  v5 = *(void (**)(_QWORD, const void *, _QWORD))(*(_QWORD *)(v4 + 184) + 24);
  if (v5)
    v5(*(_QWORD *)(v4 + 160), a1, a2);
  asl_log(0, 0, 5, " wpa_driver_set_wpa_ie end \n");
  *(_BYTE *)(v4 + 777) = a2;
  memcpy((void *)(v4 + 264), a1, a2);
  return 0;
}

uint64_t sub_100006C2C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return WAI_RX_packets_indication(a3, a4);
}

uint64_t sub_100006C38(uint64_t a1, uint64_t a2, __int16 a3, unsigned __int8 *a4, size_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;

  v9 = *(_QWORD *)(a1 + 192);
  sub_100004680((uint64_t)sub_100006E94, a1, v9);
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)(v9 + 48) = 0u;
  memcpy(*(void **)(v9 + 32), a4, a5);
  *(_WORD *)(v9 + 40) = a5;
  *(_QWORD *)(v9 + 24) = a1;
  *(_DWORD *)v9 = *(_DWORD *)(a1 + 228);
  *(_WORD *)(v9 + 48) = a3;
  *(_BYTE *)(v9 + 16) = 1;
  *(_QWORD *)(v9 + 56) = sub_100006D04;
  v15 = a4[2];
  if (v15 == 4)
    v16 = 31;
  else
    v16 = v15 == 12 || v15 == 9;
  return sub_100006D90(a1, v9, v16, v10, v11, v12, v13, v14);
}

uint64_t sub_100006D04(uint64_t a1, _BYTE *a2)
{
  int v3;
  char *v4;
  unsigned __int8 v5;

  v4 = a2 + 42;
  v3 = a2[42];
  v5 = a2[16] + 1;
  a2[16] = v5;
  asl_log(0, 0, 5, "Timeout. resend to(%02x:%02x:%02x:%02x:%02x:%02x), send_count=%d\n", v3, a2[43], a2[44], a2[45], a2[46], a2[47], v5);
  return sub_100007970(a1, v4, *((unsigned __int16 *)v4 + 3), *(u_char **)(v4 - 10), *((unsigned __int16 *)v4 - 1));
}

uint64_t sub_100006D90(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005DB0(a1, 1, "Setting retry request: %d sec %d usec", a4, a5, a6, a7, a8, a3);
  sub_100004680((uint64_t)sub_100006E94, a1, a2);
  return sub_100004510(a3, 0, (uint64_t)sub_100006E94, a1, a2);
}

CFIndex sub_100006E04(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  CFIndex result;

  v4 = *(_QWORD *)(a1 + 192);
  v5 = *(_QWORD *)(v4 + 32);
  result = asl_log(0, 0, 5, "WPA: in %s:%d\n", "wpa_cancle_retry", 106);
  if (*(unsigned __int8 *)(v5 + 3) == a2)
    return sub_100004680((uint64_t)sub_100006E94, a1, v4);
  return result;
}

uint64_t sub_100006E94(_QWORD *a1, uint64_t a2)
{
  int v4;
  uint64_t v7;

  (*(void (**)(_QWORD))(a2 + 56))(*a1);
  if (*(unsigned __int8 *)(a2 + 16) > 2u)
  {
    asl_log(0, 0, 5, "resend counter is bigger than 3, then deauthenation with AP\n");
    return sub_100006124((uint64_t)a1);
  }
  else
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 32) + 2);
    if (v4 == 4)
      v7 = 31;
    else
      v7 = v4 == 12 || v4 == 9;
    return sub_100006D90(a1, a2, v7);
  }
}

void sub_100006F30(void **a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    v3 = a1[10];
    if (v3)
      free(v3);
    v4 = a1[12];
    if (v4)
      free(v4);
    free(a1);
  }
}

BOOL sub_100006F7C(const std::__fs::filesystem::path *__filename, const char *a2)
{
  int v3;

  v3 = sub_100003A48(61, __filename, (const char *)&unk_100017629, "CERT_STATUS", a2);
  if (!v3)
    asl_log(0, 0, 5, "open file %s error\n\n", (const char *)__filename);
  return v3 == 0;
}

char **sub_100006FEC(char *a1)
{
  char **v2;
  char **v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  size_t v9;
  char *v10;
  int v11;
  _OWORD v13[128];
  int v14;
  _BYTE v15[4080];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v2 = (char **)malloc_type_malloc(0x68uLL, 0x1010040FC24F789uLL);
  v3 = v2;
  if (!v2)
    return v3;
  memset(v13, 0, 512);
  v2[12] = 0;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  asl_log(0, 0, 5, "Reading configuration file '%s'\n", a1);
  v4 = sub_1000035B0(61, a1, (uint64_t)v15);
  if (!v4)
  {
    asl_log(0, 0, 5, "no keys and values pair in configuration file '%s'\n", a1);
    free(v3);
    return 0;
  }
  v5 = v4;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  sub_1000037FC("WAPI", (char *)&v16, (uint64_t)v15, v4);
  v6 = atoi((const char *)&v16);
  *((_DWORD *)v3 + 13) = v6;
  asl_log(0, 0, 5, "wapi_policy '%d'\n", v6);
  v7 = *((_DWORD *)v3 + 13);
  if ((v7 & 8) != 0)
  {
    v8 = 1;
LABEL_9:
    LODWORD(v13[0]) = v8;
    goto LABEL_10;
  }
  if ((v7 & 4) != 0)
  {
    v8 = 2;
    goto LABEL_9;
  }
  LODWORD(v13[0]) = 0;
LABEL_10:
  asl_log(0, 0, 5, "WAPI '%d'\n", v7);
  if (*((_DWORD *)v3 + 13))
    *(char **)((char *)v3 + 60) = (char *)0x1000000010;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  sub_1000037FC("SSID", (char *)&v16, (uint64_t)v15, v5);
  v9 = strlen((const char *)&v16);
  v3[1] = (char *)v9;
  v10 = strdup((const char *)&v16);
  *v3 = v10;
  sub_1000032E4(1, " SSID:", v10, v9);
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  sub_1000037FC("CERT_INDEX", (char *)&v16, (uint64_t)v15, v5);
  LOBYTE(qword_100020248) = atoi((const char *)&v16);
  LOWORD(qword_100020248) = qword_100020248;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  sub_1000037FC("CERT_NAME", &byte_100020148, (uint64_t)v15, v5);
  asl_log(0, 0, 5, "CERT_NAME '%s'\n", &byte_100020148);
  if ((*((_BYTE *)v3 + 52) & 8) != 0 && byte_100020148)
    sub_100007558(&byte_100020148, (uint64_t)&v14, 2048, (char *)v13 + 4, 2048);
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  sub_1000037FC("PSK_KEY_TYPE", (char *)&v16, (uint64_t)v15, v5);
  v11 = atoi((const char *)&v16);
  asl_log(0, 0, 5, "PSK_KEY_TYPE '%d'\n", v11);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  sub_1000037FC("PSK", (char *)&v16, (uint64_t)v15, v5);
  asl_log(0, 0, 5, "PSK'%s'\n", (const char *)&v16);
  if ((*((_BYTE *)v3 + 52) & 4) != 0)
  {
    DWORD1(v13[0]) = v11;
    DWORD2(v13[0]) = strlen((const char *)&v16);
    __memcpy_chk((unint64_t)v13 | 0xC, &v16, DWORD2(v13[0]), 4088);
  }
  WAI_CNTAPPARA_SET(v13);
  sub_100003A04((uint64_t)v15, v5);
  return v3;
}

uint64_t sub_100007558(const char *a1, uint64_t a2, int a3, char *a4, int a5)
{
  FILE *v10;
  FILE *v11;
  int v12;
  char __ptr[8192];

  bzero(__ptr, 0x2000uLL);
  if (a1
    && (v10 = fopen(a1, "rb")) != 0
    && (v11 = v10, v12 = fread(__ptr, 1uLL, 0x2000uLL, v10), fclose(v11), v12 >= 1))
  {
    return sub_10000765C(__ptr, v12, a2, a3, a4, a5);
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10000765C(char *a1, int a2, uint64_t a3, int a4, char *a5, int a6)
{
  uint64_t result;
  char *v13;
  char *v14;
  int64_t v15;
  char *v16;
  int64_t v17;
  char *v18;
  char *v19;
  int64_t v20;
  const void *v21;
  int64_t v22;
  _OWORD *v23;
  char *v24;
  char *v25;
  size_t v26;
  size_t v27;
  _OWORD v28[4];

  result = 0xFFFFFFFFLL;
  if (a6 >= 1 && a4 >= 1)
  {
    if (a1)
    {
      if (a3)
      {
        if (a5)
        {
          v13 = sub_100007884(a1, a2, "-----BEGIN ASU CERTIFICATE-----");
          v14 = sub_100007884(a1, a2, "-----END ASU CERTIFICATE-----");
          result = 0xFFFFFFFFLL;
          if (v13)
          {
            if (v14)
            {
              if (v13 < v14)
              {
                v15 = v14 - v13;
                if (v15 + 21 <= (unint64_t)a6)
                {
                  qmemcpy(a5, "-----BEGIN CERTIFICATE-----", 27);
                  v16 = a5 + 27;
                  v17 = v15 - 31;
                  memcpy(v16, v13 + 31, v15 - 31);
                  qmemcpy(&v16[v17], "-----END CERTIFICATE-----", 25);
                  qmemcpy(v28, "CERTIFICATE----------END CERTIFICERTIFICATE----------BEGIN CERTI", sizeof(v28));
                  v18 = sub_100007884(a1, a2, "-----BEGIN USER CERTIFICATE-----");
                  v19 = sub_100007884(a1, a2, "-----END USER CERTIFICATE-----");
                  result = 0xFFFFFFFFLL;
                  if (v18)
                  {
                    if (v19)
                    {
                      if (v18 < v19)
                      {
                        v20 = v19 - v18;
                        if (v20 + 20 <= (unint64_t)a4)
                        {
                          *(_OWORD *)a3 = v28[3];
                          *(_OWORD *)(a3 + 11) = v28[2];
                          v21 = v18 + 32;
                          v22 = v20 - 32;
                          memcpy((void *)(a3 + 27), v21, v20 - 32);
                          v23 = (_OWORD *)(a3 + 27 + v22);
                          *v23 = v28[1];
                          *(_OWORD *)((char *)v23 + 9) = v28[0];
                          v24 = sub_100007884(a1, a2, "-----BEGIN EC PRIVATE KEY-----");
                          v25 = sub_100007884(a1, a2, "-----END EC PRIVATE KEY-----");
                          result = 0xFFFFFFFFLL;
                          if (v24)
                          {
                            if (v25 && v24 < v25)
                            {
                              v26 = strlen((const char *)a3);
                              v27 = v25 - v24 + 28;
                              if (a4 - v26 >= v27)
                              {
                                memcpy((char *)v23 + 25, v24, v27);
                                return 0;
                              }
                              else
                              {
                                return 0xFFFFFFFFLL;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

char *sub_100007884(char *a1, int a2, char *__s)
{
  unsigned int v6;
  char *result;
  char *v8;
  size_t v9;

  v6 = strlen(__s);
  result = 0;
  if ((int)v6 <= a2 && __s && ((v6 | a2) & 0x80000000) == 0)
  {
    v8 = &a1[a2 - v6];
    if (v8 < a1)
    {
      return 0;
    }
    else
    {
      v9 = v6;
      while (memcmp(a1, __s, v9))
      {
        if (++a1 > v8)
          return 0;
      }
      return a1;
    }
  }
  return result;
}

uint64_t sub_100007914(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD, uint64_t, uint64_t);

  if ((_DWORD)a2)
    v2 = 11;
  else
    v2 = 0;
  *(_DWORD *)(result + 228) = v2;
  v3 = *(_QWORD *)(result + 184);
  if (v3)
  {
    v4 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v3 + 128);
    if (v4)
      return v4(*(_QWORD *)(result + 160), result + 14, a2);
  }
  return result;
}

uint64_t sub_100007948(uint64_t a1, _BYTE *a2)
{
  sub_1000084C0(a2, (char *)(a1 + 112), 6);
  return 0;
}

uint64_t sub_100007970(uint64_t a1, char *a2, unsigned int a3, u_char *a4, uint64_t a5)
{
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a1 + 136))
    return pcap_sendpacket(*(pcap_t **)a1, a4, a5);
  v11 = sub_1000084B0(a5 + 14);
  if (!v11)
    return 0xFFFFFFFFLL;
  v12 = v11;
  sub_1000084C0(v11, a2, 6);
  sub_1000084C0(v12 + 6, (char *)(a1 + 112), 6);
  *((_WORD *)v12 + 6) = __rev16(a3);
  sub_1000084C0(v12 + 14, (char *)a4, a5);
  v13 = pcap_sendpacket(*(pcap_t **)a1, v12, a5 + 14);
  j__free(v12);
  return v13;
}

uint64_t sub_100007A54(_BYTE *a1, char *a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  _BYTE *v12;
  uint64_t v13;
  pcap_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  FILE *v20;
  char *v21;
  int v22;
  FILE *v23;
  int *v24;
  char *v25;
  CFSocketNativeHandle selectable_fd;
  FILE *v27;
  const char *v28;
  char *v30;
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
  int v49;
  bpf_program v50;
  bpf_u_int32 v51[2];
  char v52[256];
  char v53[200];

  v12 = sub_100008584(0x90uLL);
  v13 = (uint64_t)v12;
  if (!v12)
    return v13;
  sub_100008734(v12 + 12, a1, 100);
  *(_QWORD *)(v13 + 120) = a4;
  *(_QWORD *)(v13 + 128) = a5;
  *(_DWORD *)(v13 + 136) = a6;
  if (a2)
    sub_1000084C0((_BYTE *)(v13 + 112), a2, 6);
  v50.bf_insns = 0;
  *(_QWORD *)v51 = 0;
  *(_QWORD *)&v50.bf_len = 0;
  pcap_lookupnet((const char *)(v13 + 12), v51, &v51[1], v52);
  v14 = pcap_open_live((const char *)(v13 + 12), 2500, 0, 10, v52);
  *(_QWORD *)v13 = v14;
  if (!v14)
  {
    fprintf(__stderrp, "2. pcap_open_live: %s\n", v52);
    fprintf(__stderrp, "ifname='%s'\n");
LABEL_19:
    j__free((void *)v13);
    return 0;
  }
  if (pcap_datalink(v14) != 1 && pcap_set_datalink(*(pcap_t **)v13, 1) < 0)
  {
    v27 = __stderrp;
    v30 = pcap_geterr(*(pcap_t **)v13);
    v28 = "pcap_set_datalink(DLT_EN10MB): %s\n";
    goto LABEL_18;
  }
  if (pcap_setnonblock(*(pcap_t **)v13, 1, v52) < 0)
  {
    v20 = __stderrp;
    v21 = pcap_geterr(*(pcap_t **)v13);
    fprintf(v20, "pcap_setnonblock: %s\n", v21);
  }
  v47 = 3;
  v48 = a3;
  v45 = 0;
  v46 = 0;
  v44 = 194;
  v42 = 1;
  v43 = 128;
  v40 = *(unsigned __int8 *)(v13 + 116);
  v41 = *(unsigned __int8 *)(v13 + 117);
  v38 = *(unsigned __int8 *)(v13 + 114);
  v39 = *(unsigned __int8 *)(v13 + 115);
  v36 = *(unsigned __int8 *)(v13 + 112);
  v37 = *(unsigned __int8 *)(v13 + 113);
  v34 = v40;
  v35 = v41;
  v32 = v38;
  v33 = v39;
  v31 = v37;
  sub_1000087D8(v53, 0xC8uLL, "not ether src %02x:%02x:%02x:%02x:%02x:%02x and(ether dst %02x:%02x:%02x:%02x:%02x:%02x or ether dst %02x:%02x:%02x:%02x:%02x:%02x) and ether proto 0x%x", v15, v16, v17, v18, v19, *(_BYTE *)(v13 + 112));
  if (pcap_compile(*(pcap_t **)v13, &v50, v53, 1, v51[0]) < 0)
  {
    v27 = __stderrp;
    v30 = pcap_geterr(*(pcap_t **)v13);
    v28 = "pcap_compile: %s\n";
LABEL_18:
    fprintf(v27, v28, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_19;
  }
  if (pcap_setfilter(*(pcap_t **)v13, &v50) < 0)
  {
    v27 = __stderrp;
    v30 = pcap_geterr(*(pcap_t **)v13);
    v28 = "pcap_setfilter: %s\n";
    goto LABEL_18;
  }
  pcap_freecode(&v50);
  v49 = 1;
  v22 = pcap_fileno(*(pcap_t **)v13);
  if (ioctl(v22, 0x80044270uLL, &v49) < 0)
  {
    v23 = __stderrp;
    v24 = __error();
    v25 = strerror(*v24);
    fprintf(v23, "%s: cannot enable immediate mode on interface %s: %s\n", "l2_packet_init_libpcap", (const char *)(v13 + 12), v25);
  }
  selectable_fd = pcap_get_selectable_fd(*(pcap_t **)v13);
  sub_1000042CC(selectable_fd, (uint64_t)sub_100007FB8, v13, *(_QWORD *)v13);
  return v13;
}

void sub_100007D7C(uint64_t *a1)
{
  if (a1)
  {
    sub_100004680((uint64_t)sub_100007DC4, (uint64_t)a1, *a1);
    if (*a1)
      pcap_close((pcap_t *)*a1);
    j__free(a1);
  }
}

uint64_t sub_100007DC4(uint64_t a1, pcap_t *a2)
{
  int v4;
  unsigned int v5;

  v4 = *(_DWORD *)(a1 + 8);
  if (v4)
  {
    *(_DWORD *)(a1 + 8) = v4 - 1;
    v5 = 20000;
  }
  else
  {
    v5 = 100000;
  }
  sub_100004510(0, v5, (uint64_t)sub_100007DC4, a1, (uint64_t)a2);
  return pcap_dispatch(a2, 10, (pcap_handler)sub_10000807C, (u_char *)a1);
}

uint64_t sub_100007E30(uint64_t a1, char *a2, size_t a3)
{
  pcap_if_t *v6;
  unsigned __int8 *v7;
  pcap_addr *addresses;
  sockaddr *addr;
  in_addr v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  pcap_if_t *v17;
  uint64_t v18;
  pcap_if_t *v20;
  char v21[257];

  v20 = 0;
  if (pcap_findalldevs(&v20, v21) < 0)
  {
    asl_log(0, 0, 5, "pcap_findalldevs: %s\n\n", v21);
    return 0xFFFFFFFFLL;
  }
  else
  {
    v6 = v20;
    if (v20)
    {
      v7 = (unsigned __int8 *)(a1 + 12);
      while (1)
      {
        if (!sub_100008660(v6->name, v7))
        {
          addresses = v6->addresses;
          if (addresses)
            break;
        }
LABEL_5:
        v6 = v6->next;
        if (!v6)
        {
          v18 = 0xFFFFFFFFLL;
          goto LABEL_15;
        }
      }
      while (1)
      {
        addr = addresses->addr;
        if (addr)
        {
          if (addr->sa_family == 2)
            break;
        }
        addresses = addresses->next;
        if (!addresses)
          goto LABEL_5;
      }
      v10.s_addr = *(_DWORD *)&addr->sa_data[2];
      v11 = inet_ntoa(v10);
      sub_1000087D8(a2, a3, "%s", v12, v13, v14, v15, v16, v11);
      v18 = 0;
LABEL_15:
      v17 = v20;
    }
    else
    {
      v17 = 0;
      v18 = 0xFFFFFFFFLL;
    }
    pcap_freealldevs(v17);
  }
  return v18;
}

uint64_t sub_100007F68(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 150;
  sub_100004680((uint64_t)sub_100007DC4, a1, *(_QWORD *)a1);
  return sub_100004510(0, 0x2710u, (uint64_t)sub_100007DC4, a1, *(_QWORD *)a1);
}

const u_char *sub_100007FB8(int a1, uint64_t a2, pcap_t *a3)
{
  const u_char *result;
  uint64_t caplen;
  pcap_pkthdr v6;

  memset(&v6, 0, sizeof(v6));
  result = pcap_next(a3, &v6);
  if (result && v6.caplen >= 0xE)
  {
    if (*(_DWORD *)(a2 + 136))
      caplen = v6.caplen;
    else
      caplen = v6.caplen - 14;
    return (const u_char *)(*(uint64_t (**)(_QWORD, const u_char *, const u_char *, uint64_t))(a2 + 120))(*(_QWORD *)(a2 + 128), result + 6, &result[14 * (*(_DWORD *)(a2 + 136) == 0)], caplen);
  }
  return result;
}

uint64_t sub_10000807C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v3 = *(unsigned int *)(a2 + 16);
    if (v3 >= 0xE)
    {
      v4 = result;
      if (*(_DWORD *)(result + 136))
        v5 = *(unsigned int *)(a2 + 16);
      else
        v5 = v3 - 14;
      result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(result + 120))(*(_QWORD *)(result + 128), a3 + 6, a3 + 14 * (*(_DWORD *)(result + 136) == 0), v5);
      *(_DWORD *)(v4 + 8) = 150;
    }
  }
  return result;
}

uint64_t sub_1000080DC(uint64_t result, uint64_t a2)
{
  if (result)
    result = sleep(result);
  if (a2)
    return usleep(a2);
  return result;
}

uint64_t sub_100008114(__darwin_time_t *a1)
{
  uint64_t result;
  __darwin_time_t tv_usec;
  timeval v4;

  v4.tv_sec = 0;
  *(_QWORD *)&v4.tv_usec = 0;
  result = gettimeofday(&v4, 0);
  tv_usec = v4.tv_usec;
  *a1 = v4.tv_sec;
  a1[1] = tv_usec;
  return result;
}

uint64_t sub_100008154(int a1, int a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, time_t *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  time_t v12;
  tm v13;
  uint64_t v14;
  uint64_t v15;

  result = 0xFFFFFFFFLL;
  if (a6 <= 0x3C
    && a5 <= 0x3B
    && a4 <= 0x17
    && a1 >= 1970
    && (a2 - 13) >= 0xFFFFFFF4
    && (a3 - 32) >= 0xFFFFFFE1)
  {
    v14 = v7;
    v15 = v8;
    memset(&v13.tm_wday, 0, 32);
    v13.tm_mon = a2 - 1;
    v13.tm_year = a1 - 1900;
    v13.tm_hour = a4;
    v13.tm_mday = a3;
    v13.tm_sec = a6;
    v13.tm_min = a5;
    v12 = mktime(&v13);
    result = 0;
    *a7 = v12;
  }
  return result;
}

void *sub_1000081E8(void *__b, int a2, size_t a3)
{
  if (a3)
    memset(__b, a2, a3);
  return __b;
}

uint64_t sub_100008214(const char *a1)
{
  FILE *v1;
  FILE *v2;
  pid_t v3;

  if (a1)
  {
    v1 = fopen(a1, "w");
    if (v1)
    {
      v2 = v1;
      v3 = getpid();
      fprintf(v2, "%u\n", v3);
      fclose(v2);
    }
  }
  return 0;
}

const char *sub_100008270(const char *result)
{
  if (result)
    return (const char *)unlink(result);
  return result;
}

uint64_t sub_10000827C(void *a1, size_t a2)
{
  FILE *v4;
  FILE *v5;
  size_t v6;

  v4 = fopen("/dev/urandom", "rb");
  if (v4)
  {
    v5 = v4;
    v6 = fread(a1, 1uLL, a2, v4);
    fclose(v5);
    if (v6 == a2)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  else
  {
    puts("Could not open /dev/urandom.");
    return 0xFFFFFFFFLL;
  }
}

_BYTE *sub_100008300(char *a1)
{
  const char *v1;
  char *v3;
  char *v4;
  size_t v5;
  char *v6;
  _BYTE *v7;
  char *v8;
  size_t v9;
  size_t v10;
  size_t v11;
  _BYTE *v12;
  _BYTE *v13;
  size_t v14;
  char v15;
  _BYTE *v16;
  char v17;

  v1 = a1;
  if (*a1 == 47)
    return sub_10000844C(a1);
  v3 = (char *)malloc_type_malloc(0x80uLL, 0xDB9DCB79uLL);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 128;
  while (1)
  {
    v6 = getcwd(v4, v5);
    if (v6)
      break;
    free(v4);
    if (*__error() == 34)
    {
      v5 *= 2;
      v4 = (char *)malloc_type_malloc(v5, 0xDB9DCB79uLL);
      if (v4)
        continue;
    }
    return 0;
  }
  v8 = v6;
  v9 = strlen(v6);
  v10 = strlen(v1);
  v11 = v9 + v10;
  v12 = malloc_type_malloc(v9 + v10 + 2, 0xDB9DCB79uLL);
  v7 = v12;
  if (v12)
  {
    if (v9)
    {
      v13 = v12;
      v14 = v9;
      do
      {
        v15 = *v8++;
        *v13++ = v15;
        --v14;
      }
      while (v14);
    }
    v12[v9] = 47;
    if (v10)
    {
      v16 = &v12[v9 + 1];
      do
      {
        v17 = *v1++;
        *v16++ = v17;
        --v10;
      }
      while (v10);
    }
    v12[v11 + 1] = 0;
  }
  free(v4);
  return v7;
}

_BYTE *sub_10000844C(_BYTE *result)
{
  _BYTE *v1;
  size_t v2;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = 0;
    while (result[v2++])
      ;
    result = malloc_type_malloc(v2, 0xDB9DCB79uLL);
    if (result)
    {
      if (v2)
      {
        v4 = 0;
        v5 = -(uint64_t)v2;
        do
        {
          result[v4] = v1[v4];
          ++v4;
        }
        while (!__CFADD__(v5++, 1));
      }
    }
  }
  return result;
}

void *sub_1000084B0(size_t a1)
{
  return malloc_type_malloc(a1, 0xDB9DCB79uLL);
}

_BYTE *sub_1000084C0(_BYTE *result, char *a2, uint64_t a3)
{
  _BYTE *v3;
  char v4;

  if (a3)
  {
    v3 = result;
    do
    {
      v4 = *a2++;
      *v3++ = v4;
      --a3;
    }
    while (a3);
  }
  return result;
}

void *sub_1000084E4(const char *a1, size_t *a2)
{
  FILE *v3;
  FILE *v4;
  void *v5;
  void *v6;

  v3 = fopen(a1, "rb");
  if (!v3)
    return 0;
  v4 = v3;
  fseek(v3, 0, 2);
  *a2 = ftell(v4);
  fseek(v4, 0, 0);
  v5 = malloc_type_malloc(*a2, 0xDB9DCB79uLL);
  v6 = v5;
  if (v5)
    fread(v5, 1uLL, *a2, v4);
  fclose(v4);
  return v6;
}

void *sub_100008584(size_t a1)
{
  void *v2;
  void *v3;

  v2 = malloc_type_malloc(a1, 0xDB9DCB79uLL);
  v3 = v2;
  if (a1 && v2)
    bzero(v2, a1);
  return v3;
}

void *sub_1000085C8(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x930CA390uLL);
}

char *sub_1000085D4(char *result, char *a2, uint64_t a3)
{
  char *v3;
  char v4;

  if (result >= a2)
  {
    for (; a3; --a3)
      result[a3 - 1] = a2[a3 - 1];
  }
  else if (a3)
  {
    v3 = result;
    do
    {
      v4 = *a2++;
      *v3++ = v4;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t sub_100008618(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;

  if (!a3)
    return 0;
  while (1)
  {
    v3 = *a1 - *a2;
    if ((_DWORD)v3)
      break;
    ++a1;
    ++a2;
    if (!--a3)
      return 0;
  }
  return v3;
}

uint64_t sub_100008648(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  while (*(unsigned __int8 *)(a1 + v1++))
    ;
  return v1 - 1;
}

uint64_t sub_100008660(_BYTE *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  BOOL v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  BOOL v9;

  v2 = *a1;
  v3 = *a2;
  if (*a1)
    v4 = v2 == v3;
  else
    v4 = 0;
  if (v4)
  {
    v5 = a2 + 1;
    v6 = a1 + 1;
    do
    {
      v7 = *v6++;
      v2 = v7;
      v8 = *v5++;
      v3 = v8;
      if (v2)
        v9 = v2 == v3;
      else
        v9 = 0;
    }
    while (v9);
  }
  return ((char)v2 - (char)v3);
}

uint64_t sub_10000869C(_BYTE *a1, unsigned __int8 *a2, uint64_t a3)
{
  int v3;
  int v4;

  if (!a3)
    return 0;
  while (1)
  {
    v3 = *a1;
    v4 = *a2;
    if (!*a1 || v3 != v4)
      break;
    ++a1;
    ++a2;
    if (!--a3)
      return 0;
  }
  return ((char)v3 - (char)v4);
}

char *sub_1000086DC(char *result, int a2)
{
  char v2;
  int v3;

  v2 = *result;
  if (!*result)
    return 0;
  while (a2 != v2)
  {
    v3 = *++result;
    v2 = v3;
    if (!v3)
      return 0;
  }
  return result;
}

char *sub_1000086FC(unint64_t a1, int a2)
{
  char *v2;
  int v3;
  int v4;

  v2 = (char *)(a1 - 2);
  do
  {
    v3 = v2[2];
    ++v2;
  }
  while (v3);
  do
  {
    if ((unint64_t)v2 < a1)
      return 0;
    v4 = *v2--;
  }
  while (v4 != a2);
  return v2 + 1;
}

_BYTE *sub_100008734(_BYTE *result, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE *v4;
  BOOL v6;

  if (a3)
  {
    v3 = a3 - 1;
    v4 = result;
    do
    {
      *v4++ = *a2;
      if (*a2++)
        v6 = v3 == 0;
      else
        v6 = 1;
      --v3;
    }
    while (!v6);
  }
  return result;
}

_BYTE *sub_100008760(_BYTE *result, uint64_t a2)
{
  uint64_t v2;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;

  v2 = 0;
  while (*(unsigned __int8 *)(a2 + v2++))
    ;
  if (!*result)
    return 0;
  v4 = result;
  while (2)
  {
    if (v2 != 1)
    {
      v5 = 0;
      v6 = 1 - v2;
      while (1)
      {
        v7 = v4[v5];
        v8 = *(unsigned __int8 *)(a2 + v5);
        if (!v4[v5] || v7 != v8)
          break;
        ++v5;
        if (__CFADD__(v6++, 1))
          return v4;
      }
      if (v7 == v8)
        return v4;
      if (*++v4)
        continue;
      return 0;
    }
    break;
  }
  return result;
}

uint64_t sub_1000087D8(char *a1, size_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  result = vsnprintf(a1, a2, a3, &a9);
  if (a2)
    a1[a2 - 1] = 0;
  return result;
}

uint64_t sub_10000881C(uint64_t a1, _BYTE *a2)
{
  const __CFDictionary *v4;
  const __CFString *Value;
  const char *CStringPtr;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v12 = 6;
  if (!sub_100008928(a1, 9u, (uint64_t)a2, &v12))
    return 0;
  v4 = *(const __CFDictionary **)(a1 + 64);
  if (v4 && (Value = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("BSSID"))) != 0)
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    CStringPtr = CFStringGetCStringPtr(Value, 0);
    sscanf(CStringPtr, "%x:%x:%x:%x:%x:%x", (char *)&v11 + 4, &v11, (char *)&v10 + 4, &v10, (char *)&v9 + 4, &v9);
    v7 = 0;
    *a2 = BYTE4(v11);
    a2[1] = v11;
    a2[2] = BYTE4(v10);
    a2[3] = v10;
    a2[4] = BYTE4(v9);
    a2[5] = v9;
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
    asl_log(0, 0, 5, "%s: APPLE80211_IOC_BSSID failed (%d)\n", "wpa_driver_apple80211_get_bssid", -1);
  }
  return v7;
}

uint64_t sub_100008928(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v6;
  uint64_t result;

  *(_DWORD *)(a1 + 88) = a2;
  if (a2 <= 0xB && ((1 << a2) & 0xA02) != 0)
  {
    v6 = a1 + 72;
    *(_DWORD *)(a1 + 96) = *a4;
    *(_QWORD *)(a1 + 104) = a3;
    strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
    if ((Apple80211RawGet(*(_QWORD *)(a1 + 8), v6) & 0x80000000) == 0)
    {
      result = 0;
      *a4 = *(_DWORD *)(a1 + 96);
      return result;
    }
  }
  else
  {
    fprintf(__stderrp, "unrecognized ioctl get (%d)\n", a2);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000089D8(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _WORD *v4;
  int *v5;
  int v6;
  unsigned __int8 *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  int Count;
  CFIndex v11;
  uint64_t v12;
  const __SCNetworkInterface *ValueAtIndex;
  CFStringRef InterfaceType;
  const __CFData *HardwareAddress;
  const __CFData *v16;
  _WORD *v17;
  _WORD *v18;
  const UInt8 *BytePtr;
  __int16 v20;

  v2 = *(_QWORD *)(*a1 + 128);
  v3 = (void *)a1[7];
  if (v3)
  {
    free(v3);
    a1[7] = 0;
  }
  if (*(_DWORD *)(v2 + 92) == 1)
  {
    v4 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
    a1[7] = v4;
    v5 = *(int **)(v2 + 96);
    v6 = *v5;
    v4[2] = *((_WORD *)v5 + 2);
    *(_DWORD *)v4 = v6;
    v7 = (unsigned __int8 *)a1[7];
    asl_log(0, 0, 5, "WFMacRandomisation : %s Private MAC address used :  %02x:%02x:%02x:%02x:%02x:%02x\n \n", "wpa_driver_apple80211_get_macaddr", *v7, v7[1], v7[2], v7[3], v7[4], v7[5]);
  }
  else
  {
    asl_log(0, 0, 5, " %s WFMacRandomisation : Physical MAC used\n \n", "wpa_driver_apple80211_get_macaddr");
    v8 = SCNetworkInterfaceCopyAll();
    if (v8)
    {
      v9 = v8;
      Count = CFArrayGetCount(v8);
      if (Count >= 1)
      {
        v11 = 0;
        v12 = Count;
        while (1)
        {
          ValueAtIndex = (const __SCNetworkInterface *)CFArrayGetValueAtIndex(v9, v11);
          InterfaceType = SCNetworkInterfaceGetInterfaceType(ValueAtIndex);
          if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211))
          {
            HardwareAddress = (const __CFData *)_SCNetworkInterfaceGetHardwareAddress(ValueAtIndex);
            if (HardwareAddress)
            {
              v16 = HardwareAddress;
              if (CFDataGetLength(HardwareAddress) == 6)
                break;
            }
          }
          if (v12 == ++v11)
            goto LABEL_15;
        }
        v17 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
        a1[7] = v17;
        if (v17)
        {
          v18 = v17;
          BytePtr = CFDataGetBytePtr(v16);
          v20 = *((_WORD *)BytePtr + 2);
          *(_DWORD *)v18 = *(_DWORD *)BytePtr;
          v18[2] = v20;
        }
      }
LABEL_15:
      CFRelease(v9);
    }
  }
  return a1[7];
}

uint64_t sub_100008B90(uint64_t a1, uint64_t a2)
{
  int *v3;
  unsigned int v4;

  v4 = 0;
  if ((sub_100008928(a1, 1u, a2, &v4) & 0x80000000) == 0)
    return v4;
  v3 = __error();
  asl_log(0, 0, 5, "%s: Unable to retrieve SSID (%d)\n\n", "wpa_driver_apple80211_get_ssid", *v3);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100008BF8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;

  *(_DWORD *)(a1 + 88) = 1;
  v4 = a1 + 72;
  *(_DWORD *)(a1 + 96) = a3;
  *(_QWORD *)(a1 + 104) = a2;
  strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
  return Apple80211RawSet(*(_QWORD *)(a1 + 8), v4);
}

uint64_t sub_100008C40(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const void *Value;
  CFTypeRef cf1;

  cf1 = 0;
  v2 = Apple80211CopyValue(*(_QWORD *)(a1 + 8), 1, 0, &cf1);
  if (v2)
    v3 = 1;
  else
    v3 = cf1 == 0;
  if (!v3)
  {
    asl_log(0, 0, 5, "Have SSID, comparing\n");
    v6 = *(const __CFDictionary **)(a1 + 64);
    if (v6)
    {
      Value = CFDictionaryGetValue(v6, CFSTR("SSID"));
      if (CFEqual(cf1, Value))
      {
        v5 = 0;
LABEL_15:
        CFRelease(cf1);
        goto LABEL_16;
      }
      asl_log(0, 0, 5, "Joined a different network, done\n");
    }
    else
    {
      asl_log(0, 0, 5, "No WAPI network requested, done.\n");
    }
    v5 = 4294963394;
    goto LABEL_15;
  }
  v4 = v2;
  asl_log(0, 0, 5, "Failed to get SSID\n");
  if (v4)
    v5 = v4;
  else
    v5 = 4294963394;
LABEL_16:
  asl_log(0, 0, 5, "%s = %d\n", "wpa_driver_check_status", v5);
  return v5;
}

_DWORD *sub_100008D54(uint64_t a1, const char *a2)
{
  char *v4;
  _DWORD *v5;
  _QWORD *v6;
  int v7;
  int v8;
  CFStringRef v9;
  CFStringRef v10;
  int v11;
  int v12;
  int v13;
  int v15;
  int started;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;

  v4 = (char *)malloc_type_malloc(0x78uLL, 0x10F00406C3E8C6CuLL);
  if (v4)
  {
    v5 = v4;
    *(_OWORD *)(v4 + 104) = 0u;
    *(_OWORD *)(v4 + 88) = 0u;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
    v6 = v4 + 8;
    *(_QWORD *)v4 = a1;
    strncpy(v4 + 36, a2, 0x11uLL);
    v7 = Apple80211Open(v6);
    if (v7)
    {
      v8 = v7;
      asl_log(0, 0, 5, "%s: Apple80211Open() failed (%d)  ! \n", "wpa_driver_apple80211_init", v7);
    }
    else
    {
      v9 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (v9)
      {
        v10 = v9;
        v11 = Apple80211BindToInterface(*v6, v9);
        if (v11)
        {
          v12 = v11;
          asl_log(0, 0, 5, "%s: Apple80211BindToInterface() failed (%s, %d)  ! \n", "wpa_driver_apple80211_init", a2, v11);
          CFRelease(v10);
          v8 = v12;
        }
        else
        {
          CFRelease(v10);
          if (*v6)
          {
            v15 = Apple80211EventMonitoringInit2(*v6, sub_1000090A4, v5, &_dispatch_main_q);
            if (v15)
            {
              v23 = v15;
              asl_log(0, 0, 5, "%s: Apple80211EventMonitoringInit() failed (%d)  ! \n");
            }
            else
            {
              started = Apple80211StartMonitoringEvent(*v6, 1);
              if (started)
              {
                v23 = started;
                asl_log(0, 0, 5, "%s: Apple80211StartMonitoringEvent(APPLE80211_M_POWER_CHANGED) failed  (%d) ! \n");
              }
              else
              {
                v17 = Apple80211StartMonitoringEvent(*v6, 9);
                if (v17)
                {
                  v23 = v17;
                  asl_log(0, 0, 5, "%s: Apple80211StartMonitoringEvent(APPLE80211_M_ASSOC_DONE) failed (%d) ! \n");
                }
                else
                {
                  v18 = Apple80211StartMonitoringEvent(*v6, 10);
                  if (v18)
                  {
                    v23 = v18;
                    asl_log(0, 0, 5, "%s: Apple80211StartMonitoringEvent(APPLE80211_M_SCAN_DONE) failed (%d) ! \n");
                  }
                  else
                  {
                    v19 = Apple80211StartMonitoringEvent(*v6, 14);
                    if (v19)
                    {
                      v23 = v19;
                      asl_log(0, 0, 5, "%s: Apple80211StartMonitoringEvent(APPLE80211_M_DECRYPTION_FAILURE) failed (%d) ! \n");
                    }
                    else
                    {
                      v20 = Apple80211StartMonitoringEvent(*v6, 2);
                      if (v20)
                      {
                        v23 = v20;
                        asl_log(0, 0, 5, "%s: Apple80211StartMonitoringEvent(APPLE80211_M_SSID_CHANGED) failed (%d) ! \n");
                      }
                      else
                      {
                        v21 = Apple80211StartMonitoringEvent(*v6, 4);
                        if (!v21)
                        {
                          v22 = socket(2, 2, 0);
                          v5[8] = v22;
                          if ((v22 & 0x80000000) == 0)
                          {
                            asl_log(0, 0, 5, "%s: success  ! \n", "wpa_driver_apple80211_init");
                            return v5;
                          }
                          perror("socket(PF_INET,SOCK_DGRAM)");
                          goto LABEL_12;
                        }
                        v23 = v21;
                        asl_log(0, 0, 5, "%s: Apple80211StartMonitoringEvent(APPLE80211_M_LINK_CHANGED) failed (%d) ! \n");
                      }
                    }
                  }
                }
              }
            }
            v8 = v23;
          }
          else
          {
            asl_log(0, 0, 5, "%s: Apple80211EventMonitoringInit() failed (%d)  ! \n", "wpa_driver_apple80211_init", 0);
            v8 = 0;
          }
        }
      }
      else
      {
        v8 = -3901;
      }
    }
    asl_log(0, 0, 5, "%s: Failed to init (%d)! \n", "wpa_driver_apple80211_init", v8);
    v13 = v5[8];
    if (v13)
      close(v13);
    if (*v6)
      Apple80211Close(*v6);
LABEL_12:
    free(v5);
    return 0;
  }
  asl_log(0, 0, 5, "%s: Unable to allocate memory for darwin WAPI driver data.\n", "wpa_driver_apple80211_init");
  asl_log(0, 0, 5, "%s: Failed to init (%d)! \n", "wpa_driver_apple80211_init", -3902);
  return 0;
}

void sub_1000090A4(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  __CFRunLoop *Current;
  __CFRunLoop *v13;
  _QWORD block[7];
  int v15;
  int v16;
  int v17;

  Current = CFRunLoopGetCurrent();
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000A034;
  block[3] = &unk_10001C610;
  v15 = a1;
  v16 = a3;
  block[4] = a2;
  block[5] = a4;
  v17 = a5;
  block[6] = a6;
  CFRunLoopPerformBlock(Current, kCFRunLoopDefaultMode, block);
  v13 = CFRunLoopGetCurrent();
  CFRunLoopWakeUp(v13);
}

void sub_100009148(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  int v4;
  void *v5;

  v2 = (const void *)a1[8];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  if (v3)
    CFRelease(v3);
  v4 = *((_DWORD *)a1 + 8);
  if (v4)
    close(v4);
  if (a1[1])
  {
    Apple80211EventMonitoringHalt();
    Apple80211Close(a1[1]);
  }
  v5 = (void *)a1[7];
  if (v5)
    free(v5);
  free(a1);
}

uint64_t sub_1000091AC()
{
  asl_log(0, 0, 5, "%s: not supported \n\n", "wpa_driver_apple80211_get_freq");
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000091EC(uint64_t a1, const char *a2)
{
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  __CFDictionary *Mutable;
  CFStringRef v9;
  CFStringRef v10;
  int v11;
  int v12;
  int v13;
  int valuePtr;

  if (*(_BYTE *)(a1 + 24))
  {
    asl_log(0, 0, 5, "%s: have external scan result, omitting extra scan..\n\n", "wpa_driver_apple80211_scan");
    sub_1000065CC(*(_QWORD *)a1, 3);
    return 0;
  }
  else
  {
    valuePtr = 1;
    v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    v13 = 30;
    v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v13);
    v12 = 3;
    v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v12);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, CFSTR("SCAN_MERGE"), kCFBooleanFalse);
    CFDictionaryAddValue(Mutable, CFSTR("SCAN_TYPE"), v7);
    CFDictionaryAddValue(Mutable, CFSTR("SCAN_NUM_SCANS"), v5);
    CFDictionaryAddValue(Mutable, CFSTR("SCAN_PHY_MODE"), v6);
    CFRelease(v5);
    CFRelease(v6);
    CFRelease(v7);
    if (a2)
    {
      v9 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (v9)
      {
        v10 = v9;
        CFDictionaryAddValue(Mutable, CFSTR("SSID_STR"), v9);
        CFRelease(v10);
      }
    }
    v11 = Apple80211ScanAsync(*(_QWORD *)(a1 + 8), Mutable);
    CFRelease(Mutable);
    if (v11)
    {
      asl_log(0, 0, 5, "%s: Apple80211ScanAsync error %d\n", "wpa_driver_apple80211_scan", v11);
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
}

uint64_t sub_1000093E0(uint64_t a1, void *a2)
{
  const void *v3;
  void *values;

  values = a2;
  if (a2)
  {
    v3 = *(const void **)(a1 + 16);
    if (v3)
      CFRelease(v3);
    *(_QWORD *)(a1 + 16) = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
    *(_BYTE *)(a1 + 24) = 1;
    sub_1000065CC(*(_QWORD *)a1, 3);
  }
  else
  {
    *(_BYTE *)(a1 + 24) = 0;
  }
  return 0;
}

unint64_t sub_100009460(uint64_t a1, char *a2, unint64_t a3)
{
  const __CFArray *v3;
  unint64_t Count;
  unint64_t v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const __CFData *Value;
  const __CFData *v11;
  unint64_t Length;
  char *v13;
  uint64_t v14;
  char *BytePtr;
  const __CFString *v16;
  char *v17;
  const char *CStringPtr;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFData *v23;
  const __CFData *v24;
  UInt8 *v25;
  CFIndex v26;
  unint64_t v27;
  _BYTE *v28;
  char *v29;
  _BYTE *v30;
  uint64_t *v31;
  uint64_t *v32;
  _BYTE *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v41;
  _BYTE *v42;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int valuePtr;

  v3 = *(const __CFArray **)(a1 + 16);
  if (!v3)
    return 0;
  Count = CFArrayGetCount(v3);
  if (Count >= a3)
    v7 = a3;
  else
    v7 = Count;
  sub_1000081E8(a2, 0, 280 * v7);
  asl_log(0, 0, 5, "%s: %d scan results..\n\n", "wpa_driver_apple80211_get_scan_results", v7);
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v8);
      valuePtr = 0;
      Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("SSID"));
      if (Value)
      {
        v11 = Value;
        Length = CFDataGetLength(Value);
        v13 = &a2[280 * v8];
        v14 = 32;
        if (Length < 0x20)
          v14 = Length;
        *((_QWORD *)v13 + 1) = v14;
        BytePtr = (char *)CFDataGetBytePtr(v11);
        sub_1000084C0(v13 + 16, BytePtr, *((_QWORD *)v13 + 1));
      }
      asl_log(0, 0, 5, "%s: %s\n\n", "wpa_driver_apple80211_get_scan_results", &a2[280 * v8 + 16]);
      v16 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
      if (v16)
      {
        v47 = 0;
        v17 = &a2[280 * v8];
        v46 = 0;
        v45 = 0;
        v44 = 0;
        CStringPtr = CFStringGetCStringPtr(v16, 0);
        sscanf(CStringPtr, "%x:%x:%x:%x:%x:%x", (char *)&v47 + 4, &v47, &v46, (char *)&v45 + 4, &v45, &v44);
        *v17 = BYTE4(v47);
        v17[1] = v47;
        v17[2] = v46;
        v17[3] = BYTE4(v45);
        v17[4] = v45;
        v17[5] = v44;
      }
      v19 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CAPABILITIES"));
      if (v19 && CFNumberGetValue(v19, kCFNumberSInt32Type, &valuePtr))
        *(_DWORD *)&a2[280 * v8 + 256] = valuePtr;
      v20 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CHANNEL"));
      if (v20 && CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr))
        *(_DWORD *)&a2[280 * v8 + 252] = 5 * valuePtr + 2407;
      v21 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("RSSI"));
      if (v21 && CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr))
        *(_DWORD *)&a2[280 * v8 + 268] = valuePtr;
      v22 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("NOISE"));
      if (v22 && CFNumberGetValue(v22, kCFNumberSInt32Type, &valuePtr))
        *(_DWORD *)&a2[280 * v8 + 264] = valuePtr;
      v23 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("IE"));
      if (v23)
      {
        v24 = v23;
        v25 = (UInt8 *)CFDataGetBytePtr(v23);
        v26 = CFDataGetLength(v24);
        if (v26 << 32 >= 0x200000001)
          break;
      }
LABEL_48:
      if (++v8 == v7)
        return v7;
    }
    v27 = (unint64_t)&v25[(int)v26];
    v28 = v25 + 2;
    v29 = &a2[280 * v8];
    v30 = v29 + 104;
    v31 = (uint64_t *)(v29 + 96);
    v41 = (uint64_t *)(v29 + 48);
    v42 = v29 + 56;
    v32 = (uint64_t *)(v29 + 144);
    v33 = v29 + 152;
    while (1)
    {
      v34 = v25[1];
      if ((unint64_t)&v28[v34] > v27)
      {
        asl_log(0, 0, 5, "%s: invalid Information Element\n", "wpa_driver_apple80211_get_scan_results");
        goto LABEL_48;
      }
      v35 = *v25;
      if (v34 <= 0x28 && v35 == 48)
      {
        sub_1000084C0(v30, (char *)v25, v34 + 2);
        v36 = v25[1] + 2;
        *v31 = v36;
        sub_1000031A4(1, " getscanresults RSN IE:", (uint64_t)v30, v36);
        v35 = *v25;
        LODWORD(v34) = v25[1];
      }
      if (v35 != 221)
        goto LABEL_39;
      if (v34 >= 5 && !*v28 && v25[3] == 80 && v25[4] == 242 && v25[5] == 1)
        break;
LABEL_43:
      v25 = &v28[v34];
      v28 = v25 + 2;
      if ((unint64_t)(v25 + 2) >= v27)
        goto LABEL_48;
    }
    sub_1000084C0(v42, (char *)v25, v34 + 2);
    v37 = v25[1] + 2;
    *v41 = v37;
    sub_1000031A4(1, " getscanresults WPA IE:", (uint64_t)v42, v37);
    v35 = *v25;
    LODWORD(v34) = v25[1];
LABEL_39:
    v38 = v35 == 68 && v34 >= 5;
    if (v38 && *v28 == 1)
    {
      v39 = v34 + 2;
      *v32 = v39;
      sub_1000084C0(v33, (char *)v25, v39);
      sub_1000031A4(1, " getscanresults WAPI IE:", (uint64_t)v33, *v32);
      LODWORD(v34) = v25[1];
    }
    goto LABEL_43;
  }
  return v7;
}

uint64_t sub_1000098D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  _OWORD v11[128];

  memset(v11, 0, 492);
  if (a3 < 0x801)
  {
    sub_1000031A4(1, "setting WAPI IE:", a2, a3);
    v7 = 0x400000001;
    v8 = 1;
    v9 = a3;
    v10 = a3;
    __memcpy_chk(v11, a2, a3, 2048);
    *(_DWORD *)(a1 + 88) = 85;
    *(_DWORD *)(a1 + 96) = 2068;
    *(_QWORD *)(a1 + 104) = &v7;
    strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
    if (Apple80211RawSet(*(_QWORD *)(a1 + 8), a1 + 72))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    asl_log(0, 0, 5, "%s: Information Element too large (%d) \n\n", "wpa_driver_apple80211_set_gen_ie", a3);
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100009A60()
{
  return 0;
}

uint64_t sub_100009A68(uint64_t a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __int16 v12;
  _DWORD v18[18];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[28];

  v12 = a4;
  asl_log(0, 0, 5, "%s: alg=%d key_idx=%d set_tx=%d seq_len=%lu key_len=%lu\n", "wpa_driver_apple80211_set_key", a2, a4, a5, a7, a9);
  memset(&v18[2], 0, 64);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  memset(v22, 0, sizeof(v22));
  if (a2)
  {
    if (a2 != 4)
    {
      asl_log(0, 0, 5, "%s: Unknown algorithm %d\n", "wpa_driver_apple80211_set_key", a2);
      return 0xFFFFFFFFLL;
    }
    v18[2] = 8;
  }
  v18[0] = 1;
  v18[1] = a9;
  HIWORD(v18[3]) = v12;
  __memcpy_chk(&v18[4], a8, a9, 132);
  DWORD2(v19) = a7;
  __memcpy_chk((char *)&v19 + 12, a6, a7, 64);
  DWORD1(v20) = *(_DWORD *)a3;
  WORD4(v20) = *(_WORD *)(a3 + 4);
  if (a5)
    LOWORD(v18[3]) = 4;
  *(_DWORD *)(a1 + 88) = 3;
  *(_DWORD *)(a1 + 96) = 148;
  *(_QWORD *)(a1 + 104) = v18;
  strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
  if (Apple80211RawSet(*(_QWORD *)(a1 + 8), a1 + 72))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t sub_100009C1C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  _DWORD v6[3];
  int v7;

  v6[0] = 1;
  v6[1] = a3;
  v6[2] = *(_DWORD *)a2;
  v7 = 0;
  LOWORD(v7) = *(_WORD *)(a2 + 4);
  v4 = a1 + 72;
  *(_DWORD *)(a1 + 88) = 29;
  *(_DWORD *)(a1 + 96) = 16;
  *(_QWORD *)(a1 + 104) = v6;
  strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
  if (Apple80211RawSet(*(_QWORD *)(a1 + 8), v4))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t sub_100009C98(uint64_t a1)
{
  uint64_t v2;

  *(_DWORD *)(a1 + 88) = 22;
  v2 = a1 + 72;
  *(_DWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
  if (Apple80211RawSet(*(_QWORD *)(a1 + 8), v2))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t sub_100009CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  const __CFArray *v6;
  int Count;
  CFIndex v8;
  uint64_t v9;
  const __CFDictionary *ValueAtIndex;
  const __CFData *Value;
  const __CFData *v12;
  CFIndex Length;
  uint64_t v14;
  unsigned __int8 *BytePtr;
  char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  __int16 v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  int v26;
  __int16 v27[2];
  uint64_t v28;
  int v29;
  _DWORD v30[9];
  __int16 v31;
  int v32;
  int v33;
  int v34;
  char v35;
  int v36;
  __int16 v37;

  v4 = *(_QWORD *)(*(_QWORD *)a1 + 128);
  v5 = *(const void **)(a1 + 64);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v6 = *(const __CFArray **)(a1 + 16);
  if (v6)
  {
    Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      v8 = 0;
      v9 = Count;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v8);
        Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("SSID"));
        if (Value)
        {
          v12 = Value;
          Length = CFDataGetLength(Value);
          if (Length == *(_QWORD *)(a2 + 16))
          {
            v14 = Length;
            BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v12);
            if (!sub_100008618(BytePtr, *(unsigned __int8 **)(a2 + 8), v14))
              break;
          }
        }
        if (v9 == ++v8)
          goto LABEL_13;
      }
      *(_QWORD *)(a1 + 64) = ValueAtIndex;
      CFRetain(ValueAtIndex);
    }
LABEL_13:
    if (!*(_QWORD *)(a1 + 64))
      asl_log(0, 0, 5, "Could not find SSID from scan results! \n");
    asl_log(0, 0, 5, "Trying to associate with a BSS found from scan results\n");
    bzero(v27, 0x380uLL);
    v26 = 1;
    sub_1000032E4(1, " bssid =", *(char **)a2, 6uLL);
    v17 = *(char **)a2;
    if (*(_QWORD *)a2)
    {
      v18 = *(_DWORD *)v17;
      v31 = *((_WORD *)v17 + 2);
      v30[8] = v18;
    }
    v19 = *(_QWORD *)(a2 + 8);
    v20 = *(_QWORD *)(a2 + 16);
    __memcpy_chk(v30, v19, v20, 880);
    v29 = v20;
    v32 = 1;
    v34 = 8;
    v28 = 0x20000000001;
    v27[0] = 2;
    if (*(_DWORD *)(v4 + 92))
    {
      asl_log(0, 0, 5, "%s WFMacRandomisation : Private MAC address enabled\n", "wpa_driver_apple80211_associate");
      v21 = *(int **)(v4 + 96);
      if ((*(_BYTE *)v21 & 3) == 2)
      {
        v35 |= 8u;
        v22 = *((_WORD *)v21 + 2);
        v36 = *v21;
        v37 = v22;
        asl_log(0, 0, 5, "%s WFMacRandomisation : Valid Private MAC address found. Will be used for association :  %02x:%02x:%02x:%02x:%02x:%02x\n \n", "wpa_driver_apple80211_associate", v36, BYTE1(v36), BYTE2(v36), HIBYTE(v36), v22, HIBYTE(v22));
        v23 = *(unsigned __int8 **)(a1 + 56);
        asl_log(0, 0, 5, "%s WFMacRandomisation : Sanity Check. Mac Address with WAPI : %02x:%02x:%02x:%02x:%02x:%02x\n \n", "wpa_driver_apple80211_associate", *v23, v23[1], v23[2], v23[3], v23[4], v23[5]);
      }
    }
    asl_log(0, 0, 5, "ad.ad_auth_lower = %d ad.ad_auth_upper = %d ad.ad_key.key_len = %d ad.ad_key.key_cipher_type = %d\n\n", v28, HIDWORD(v28), v33, v34);
    *(_DWORD *)(a1 + 88) = 20;
    *(_DWORD *)(a1 + 96) = 900;
    *(_QWORD *)(a1 + 104) = &v26;
    strncpy((char *)(a1 + 72), (const char *)(a1 + 36), 0x10uLL);
    v24 = Apple80211RawSet(*(_QWORD *)(a1 + 8), a1 + 72);
    v25 = v24;
    if (v24)
      sub_100015B08(v24);
    if (v25)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    asl_log(0, 0, 5, "No scan results - cannot associate\n");
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10000A034(uint64_t a1)
{
  unint64_t v1;
  int v2;
  _DWORD *v3;
  CFIndex *v4;
  tm *v5;
  char *v6;
  const char *v7;
  uint64_t result;
  CFIndex v9;
  int v10;
  const void *v11;
  time_t v12;

  v2 = *(_DWORD *)(a1 + 60);
  v1 = *(unsigned int *)(a1 + 64);
  v3 = *(_DWORD **)(a1 + 40);
  v4 = *(CFIndex **)(a1 + 48);
  v12 = time(0);
  v5 = localtime(&v12);
  v6 = asctime(v5);
  v6[strlen(v6) - 6] = 0;
  v7 = "APPLE80211_M_BSSID_CHANGED";
  switch(v2)
  {
    case 1:
      asl_log(0, 0, 5, "%s [%s] %s\n\n", "darwin_wireless_event_receive", v6, "APPLE80211_M_POWER_CHANGED");
      return raise(15);
    case 2:
      return asl_log(0, 0, 5, "%s [%s] %s\n\n");
    case 3:
      goto LABEL_33;
    case 4:
      result = asl_log(0, 0, 5, "%s [%s] %s\n\n", "darwin_wireless_event_receive", v6, "APPLE80211_M_LINK_CHANGED");
      if (v3 && (_DWORD)v1 == 8)
      {
        if (*v3)
        {
          return asl_log(0, 0, 5, "state = up\n\n");
        }
        else
        {
          sub_10000A358(v3[1]);
          return asl_log(0, 0, 5, "state = down, reason = %u (%s)\n\n");
        }
      }
      return result;
    case 5:
      v7 = "APPLE80211_M_MIC_ERROR_UCAST";
      goto LABEL_33;
    case 6:
      v7 = "APPLE80211_M_MIC_ERROR_MCAST";
      goto LABEL_33;
    case 7:
      v7 = "APPLE80211_M_INT_MIT_CHANGED";
      goto LABEL_33;
    case 8:
      v7 = "APPLE80211_M_MODE_CHANGED";
      goto LABEL_33;
    case 9:
      asl_log(0, 0, 5, "%s [%s] %s\n\n", "darwin_wireless_event_receive", v6, "APPLE80211_M_ASSOC_DONE");
      if (sub_100008C40((uint64_t)v4))
        raise(15);
      asl_log(0, 0, 5, "Associated successfully; starting WAI..\n");
      v9 = *v4;
      v10 = 0;
      return sub_1000065CC(v9, v10);
    case 10:
      asl_log(0, 0, 5, "%s [%s] %s\n\n", "darwin_wireless_event_receive", v6, "APPLE80211_M_SCAN_DONE");
      if (v3 && (_DWORD)v1)
      {
        v11 = (const void *)v4[2];
        if (v11)
          CFRelease(v11);
        v4[2] = (CFIndex)CFRetain(v3);
      }
      v9 = *v4;
      v10 = 3;
      return sub_1000065CC(v9, v10);
    case 11:
      v7 = "APPLE80211_M_COUNTRY_CODE_CHANGED";
      goto LABEL_33;
    case 12:
      v7 = "APPLE80211_M_STA_ARRIVE";
      goto LABEL_33;
    case 13:
      v7 = "APPLE80211_M_STA_LEAVE";
      goto LABEL_33;
    case 15:
      v7 = "APPLE80211_M_SCAN_CACHE_UPDATED";
      goto LABEL_33;
    case 16:
      v7 = "APPLE80211_M_INTERNAL_SCAN_DONE";
      goto LABEL_33;
    case 17:
      v7 = "APPLE80211_M_LINK_QUALITY";
      goto LABEL_33;
    case 18:
      v7 = "APPLE80211_M_IBSS_PEER_ARRIVED";
      goto LABEL_33;
    case 19:
      v7 = "APPLE80211_M_IBSS_PEER_LEFT";
      goto LABEL_33;
    case 20:
      v7 = "APPLE80211_M_RSN_HANDSHAKE_DONE";
      goto LABEL_33;
    case 21:
      v7 = "APPLE80211_M_BT_COEX_CHANGED";
      goto LABEL_33;
    default:
      v7 = "UNKNOWN";
LABEL_33:
      asl_log(0, 0, 5, "%s [%s] %s\n\n", "darwin_wireless_event_receive", v6, v7);
      return sub_1000032E4(4, "Unrecognized Event:", (char *)v3, v1);
  }
}

const char *sub_10000A358(int a1)
{
  if ((a1 - 1) > 0x2C)
    return "unknown reason";
  else
    return off_10001C630[a1 - 1];
}

uint64_t sub_10000A380(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  puts("DATA:");
  if (a2 >= 0x1000)
    v4 = 4096;
  else
    v4 = a2;
  if ((_DWORD)v4)
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      if (!v5)
        goto LABEL_9;
      if ((unsigned __int16)((unsigned __int16)(((unsigned __int16)((-13107 * v5 - 13107) & 0xFFFC) >> 1) | ((-13107 * (_WORD)v5 - 13107) << 15)) >> 1) <= 0xCCCu)
        break;
LABEL_10:
      printf("0x%02x ", *(unsigned __int8 *)(a1 + v5++));
      if (v4 == v5)
        return putchar(10);
    }
    putchar(10);
LABEL_9:
    printf("%u ", v6);
    v6 += 10;
    goto LABEL_10;
  }
  return putchar(10);
}

uint64_t sub_10000A450(int a1, const char *a2, const UInt8 *a3, unsigned int a4)
{
  const __CFData *v8;
  const __CFData *v9;
  const __CFDictionary *v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  const void *v14;
  pthread_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  char v19;
  const __CFNumber *Value;
  BOOL v21;
  unsigned int v22;
  unsigned int v23;
  double Current;
  unsigned int wapi_state;
  int v26;
  double v27;
  CFAbsoluteTime v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  int valuePtr;
  sigset_t v34;
  pthread_attr_t v35;

  asl_log(0, 0, 5, "%s; parameters %s\n", "_WCXwapic_start", a2);
  if (a3
    && a4
    && (v8 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, a3, a4, kCFAllocatorNull)) != 0
    && (v9 = v8,
        v10 = (const __CFDictionary *)CFPropertyListCreateWithData(kCFAllocatorDefault, v8, 1uLL, 0, 0),
        CFRelease(v9),
        v10))
  {
    v11 = 0;
  }
  else
  {
    asl_log(0, 0, 5, "_SCUnserialize failed\n");
    v10 = 0;
    v11 = 1;
  }
  if (!a2 || strlen(a2) - 1 > 0xE)
  {
    v12 = 5;
    goto LABEL_50;
  }
  if ((v11 & 1) != 0)
  {
    asl_log(0, 0, 5, "No WAPI configuration; exiting;\n");
    v12 = 4294963396;
  }
  else
  {
    v13 = (uint64_t *)malloc_type_malloc(0x28uLL, 0x10E00408EA3E82FuLL);
    *(_OWORD *)((char *)v13 + 20) = 0u;
    *((_DWORD *)v13 + 9) = 0;
    *(_OWORD *)((char *)v13 + 4) = 0u;
    *(_DWORD *)v13 = a1;
    strncpy((char *)v13 + 4, a2, 0x10uLL);
    v13[3] = (uint64_t)CFDictionaryCreateCopy(kCFAllocatorDefault, v10);
    memset(&v35, 0, sizeof(v35));
    pthread_attr_init(&v35);
    pthread_attr_setdetachstate(&v35, 2);
    v14 = (const void *)qword_100020798;
    if (qword_100020798)
    {
      v15 = pthread_self();
      asl_log(0, 0, 5, "%s; signaling wapi thread to stop %p (self=%p)\n", "_WCXwapic_start", v14, v15);
      pthread_kill((pthread_t)qword_100020798, 1);
      pthread_join((pthread_t)qword_100020798, 0);
      asl_log(0, 0, 5, "%s; wapi thread joined\n", "_WCXwapic_start");
    }
    else
    {
      v16 = sub_100005754();
      v13[4] = v16;
      if (!v16)
      {
        asl_log(0, 0, 5, "%s: null wpa_s\n", "_WCXwapic_start");
        v12 = 6;
        goto LABEL_50;
      }
      sub_100004210(v16);
    }
    dword_100020100 = 1;
    v17 = pthread_create((pthread_t *)&qword_100020798, &v35, (void *(__cdecl *)(void *))sub_100005354, v13);
    if ((_DWORD)v17)
    {
      v12 = v17;
      v18 = __error();
      asl_log(0, 0, 5, "pthread_create error (%d).\n", *v18);
    }
    else
    {
      v34 = -1;
      v19 = 1;
      pthread_sigmask(1, &v34, 0);
      Value = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("WAPI"));
      if (Value
        && ((valuePtr = 0, CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
          ? (v21 = (valuePtr & 0xC) == 4)
          : (v21 = 0),
            v21 ? (v19 = 0) : (v19 = 1),
            v21))
      {
        v22 = 2;
      }
      else
      {
        v22 = 8;
      }
      if ((v19 & 1) != 0)
        v23 = 3;
      else
        v23 = 4;
      Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 1u);
      wapi_state = lib_get_wapi_state();
      asl_log(0, 0, 5, "lib_get_wapi_state = %d\n", wapi_state);
      if (wapi_state >= v23)
      {
        v30 = 0;
      }
      else
      {
        v26 = 0;
        v27 = Current + (double)(int)v22;
        do
        {
          if ((_BYTE)v26)
          {
            v28 = CFAbsoluteTimeGetCurrent();
            v29 = v26 - 1;
            if (v28 >= v27)
              v29 = v26;
          }
          else
          {
            v29 = 0;
          }
          v26 = v29 + 1;
          v30 = (v29 + 1);
          if (v22 <= v30)
            break;
          CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 1u);
          wapi_state = lib_get_wapi_state();
          asl_log(0, 0, 5, "lib_get_wapi_state = %d\n", wapi_state);
        }
        while (wapi_state < v23);
      }
      v31 = 0;
      if (v22 <= v30 && wapi_state <= 3)
      {
        if ((v19 & 1) != 0)
          v31 = 4294963394;
        else
          v31 = 4294963372;
        if (wapi_state <= 1)
        {
          asl_log(0, 0, 5, "we never got past assoc state (auth not in progress), bailing.\n");
          sub_1000057AC(v13[4]);
          WIFI_lib_exit();
          sub_100004510(0, 1u, (uint64_t)sub_1000049E4, 0, 0);
        }
      }
      asl_log(0, 0, 5, "%s; run_wapi_thread %d\n", "_WCXwapic_start", v31);
      pthread_attr_destroy(&v35);
      v12 = v31;
      if (!(_DWORD)v31)
      {
        vm_deallocate(mach_task_self_, (vm_address_t)a3, a4);
        return v12;
      }
    }
  }
LABEL_50:
  asl_log(0, 0, 5, "%s: returned %d\n", "_WCXwapic_start", v12);
  return v12;
}

void sub_10000A960(uint64_t a1, const char *a2)
{
  dword_100020100 = -1;
  asl_log(0, 0, 5, "%s; parameters %s\n", "_WCXwapic_stop", a2);
  exit(0);
}

uint64_t sub_10000A9A4(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = dword_100020100;
  if (dword_100020100 != 1)
    exit(0);
  return 0;
}

uint64_t sub_10000A9D8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 57415052) >= 0xFFFFFFFD)
    return (uint64_t)*(&off_10001C798 + 5 * (v1 - 57415049) + 5);
  else
    return 0;
}

uint64_t sub_10000AA18(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 88)
  {
    v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 84)))
  {
    v4 = -300;
    goto LABEL_8;
  }
  result = sub_10000A450(*(_DWORD *)(result + 12), (const char *)(result + 52), *(const UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000AAAC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 && *(_DWORD *)(result + 4) == 64)
    sub_10000A960(*(unsigned int *)(result + 12), (const char *)(result + 32));
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000AB0C(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 64)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_10000A9A4(result[3], (uint64_t)(result + 8), (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_10000AB8C(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 57415052) >= 0xFFFFFFFD
    && (v5 = (void (*)(void))*(&off_10001C798 + 5 * (v4 - 57415049) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t SMS4Crypt(unsigned int *a1, _DWORD *a2, uint64_t a3)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  _DWORD *v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  unint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t result;
  BOOL v27;

  v3 = 0;
  v4 = bswap32(*a1);
  v5 = bswap32(a1[1]);
  v6 = bswap32(a1[2]);
  v7 = bswap32(a1[3]);
  do
  {
    v8 = (_DWORD *)(a3 + 4 * v3);
    v9 = v6 ^ v7 ^ v5 ^ *v8;
    v10 = Sbox[v9 >> 24];
    v11 = Sbox[(v6 ^ v7 ^ v5 ^ *(_BYTE *)v8)] | (Sbox[BYTE1(v9)] << 8) | (v10 << 24) | (Sbox[BYTE2(v9)] << 16);
    HIDWORD(v12) = v11;
    LODWORD(v12) = (v10 << 24) | (Sbox[BYTE2(v9)] << 16);
    v13 = v4 ^ (v12 >> 22);
    HIDWORD(v12) = Sbox[(v6 ^ v7 ^ v5 ^ *(_BYTE *)v8)] | (Sbox[BYTE1(v9)] << 8);
    LODWORD(v12) = v11;
    v14 = v12 >> 14;
    HIDWORD(v12) = Sbox[(v6 ^ v7 ^ v5 ^ *(_BYTE *)v8)];
    LODWORD(v12) = v11;
    v4 = v13 ^ v14 ^ (v12 >> 8) ^ ((v10 >> 6) | (4 * v11)) ^ v11;
    v15 = v6 ^ v7 ^ v8[1] ^ v4;
    LODWORD(v9) = Sbox[v15 >> 24];
    v16 = Sbox[(v6 ^ v7 ^ *((_BYTE *)v8 + 4) ^ v4)] | (Sbox[BYTE1(v15)] << 8);
    v17 = v16 | ((_DWORD)v9 << 24) | (Sbox[BYTE2(v15)] << 16);
    HIDWORD(v12) = v17;
    LODWORD(v12) = ((_DWORD)v9 << 24) | (Sbox[BYTE2(v15)] << 16);
    v18 = v12 >> 22;
    HIDWORD(v12) = Sbox[(v6 ^ v7 ^ *((_BYTE *)v8 + 4) ^ v4)];
    LODWORD(v12) = v17;
    v5 ^= v18 ^ (__PAIR64__(v16, v17) >> 14) ^ (v12 >> 8) ^ ((v9 >> 6) | (4 * v17)) ^ v17;
    v19 = v7 ^ v8[2] ^ v4 ^ v5;
    LODWORD(v9) = Sbox[v19 >> 24];
    v20 = ((_DWORD)v9 << 24) | (Sbox[BYTE2(v19)] << 16);
    v21 = Sbox[BYTE1(v19)];
    LODWORD(v19) = Sbox[(v7 ^ *((_BYTE *)v8 + 8) ^ v4 ^ v5)];
    v22 = v19 | (v21 << 8);
    HIDWORD(v12) = v22 | v20;
    LODWORD(v12) = v20;
    v6 ^= (v12 >> 22) ^ (__PAIR64__(v22, v22 | v20) >> 14) ^ (__PAIR64__(v19, v22 | v20) >> 8) ^ ((v9 >> 6) | (4 * (v22 | v20))) ^ (v22 | v20);
    v23 = v4 ^ v8[3] ^ v5 ^ v6;
    LODWORD(v19) = Sbox[v23 >> 24];
    LODWORD(v9) = ((_DWORD)v19 << 24) | (Sbox[BYTE2(v23)] << 16);
    v24 = Sbox[BYTE1(v23)];
    LODWORD(v23) = Sbox[v23];
    v25 = v23 | (v24 << 8);
    result = v25 | v9;
    HIDWORD(v12) = v25 | v9;
    LODWORD(v12) = v9;
    v7 ^= (v12 >> 22) ^ (__PAIR64__(v25, result) >> 14) ^ (__PAIR64__(v23, result) >> 8) ^ ((v19 >> 6) | (4 * result)) ^ result;
    v27 = v3 >= 0x1C;
    v3 += 4;
  }
  while (!v27);
  *a2 = bswap32(v7);
  a2[1] = bswap32(v6);
  a2[2] = bswap32(v5);
  a2[3] = bswap32(v4);
  return result;
}

uint64_t SMS4KeyExt(_DWORD *a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unint64_t v7;
  int *v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  uint64_t result;

  v2 = bswap32(*a1 ^ 0xC6BAB1A3);
  v3 = bswap32(a1[1] ^ 0x5033AA56);
  v4 = bswap32(a1[2] ^ 0x97917D67);
  v5 = bswap32(a1[3] ^ 0xDC2270B2);
  v6 = (unsigned int *)(a2 + 8);
  v7 = -4;
  v8 = &dword_100019F50;
  do
  {
    v9 = v4 ^ v5 ^ v3 ^ *(v8 - 2);
    v10 = (Sbox[v9 >> 24] << 24) | (Sbox[BYTE2(v9)] << 16);
    LODWORD(v9) = Sbox[(v4 ^ v5 ^ v3 ^ *((_BYTE *)v8 - 8))] | (Sbox[BYTE1(v9)] << 8);
    HIDWORD(v11) = v9 | v10;
    LODWORD(v11) = v10;
    v2 ^= (v11 >> 19) ^ (__PAIR64__(v9, v9 | v10) >> 9) ^ (v9 | v10);
    *(v6 - 2) = v2;
    v12 = v4 ^ v5 ^ *(v8 - 1) ^ v2;
    v13 = (Sbox[v12 >> 24] << 24) | (Sbox[BYTE2(v12)] << 16);
    LODWORD(v12) = Sbox[(v4 ^ v5 ^ *((_BYTE *)v8 - 4) ^ v2)] | (Sbox[BYTE1(v12)] << 8);
    HIDWORD(v11) = v12 | v13;
    LODWORD(v11) = v13;
    v3 ^= (__PAIR64__(v12, v12 | v13) >> 9) ^ (v11 >> 19) ^ (v12 | v13);
    *(v6 - 1) = v3;
    v14 = v5 ^ *v8 ^ v2 ^ v3;
    v15 = (Sbox[v14 >> 24] << 24) | (Sbox[BYTE2(v14)] << 16);
    LODWORD(v14) = Sbox[(v5 ^ *(_BYTE *)v8 ^ v2 ^ v3)] | (Sbox[BYTE1(v14)] << 8);
    HIDWORD(v11) = v14 | v15;
    LODWORD(v11) = v15;
    v4 ^= (__PAIR64__(v14, v14 | v15) >> 9) ^ (v11 >> 19) ^ (v14 | v15);
    *v6 = v4;
    v16 = v2 ^ v8[1] ^ v3 ^ v4;
    v17 = (Sbox[v16 >> 24] << 24) | (Sbox[BYTE2(v16)] << 16);
    LODWORD(v16) = Sbox[(v2 ^ *((_BYTE *)v8 + 4) ^ v3 ^ v4)] | (Sbox[BYTE1(v16)] << 8);
    result = v16 | v17;
    HIDWORD(v11) = v16 | v17;
    LODWORD(v11) = v17;
    v5 ^= (__PAIR64__(v16, result) >> 9) ^ (v11 >> 19) ^ result;
    v6[1] = v5;
    v7 += 4;
    v8 += 4;
    v6 += 4;
  }
  while (v7 < 0x1C);
  return result;
}

uint64_t wpi_encrypt(unsigned int *a1, _DWORD *a2, unsigned int a3, _DWORD *a4, unsigned int *a5)
{
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  char v14;
  char v15;
  char v16;
  _BYTE v18[128];
  unsigned int v19[4];

  if (!a3)
    return 1;
  SMS4KeyExt(a4, (uint64_t)v18);
  v9 = a3 & 0xF;
  SMS4Crypt(a1, v19, (uint64_t)v18);
  if (a3 >= 0x10)
  {
    v10 = a3 >> 4;
    do
    {
      v11 = v19[1];
      *a5 = v19[0] ^ *a2;
      a5[1] = v11 ^ a2[1];
      v12 = v19[3];
      a5[2] = v19[2] ^ a2[2];
      a5[3] = v12 ^ a2[3];
      SMS4Crypt(v19, v19, (uint64_t)v18);
      a2 += 4;
      a5 += 4;
      --v10;
    }
    while (v10);
  }
  if ((_DWORD)v9)
  {
    v13 = v19;
    do
    {
      v15 = *(_BYTE *)a2;
      a2 = (_DWORD *)((char *)a2 + 1);
      v14 = v15;
      v16 = *(_BYTE *)v13;
      v13 = (unsigned int *)((char *)v13 + 1);
      *(_BYTE *)a5 = v16 ^ v14;
      a5 = (unsigned int *)((char *)a5 + 1);
      --v9;
    }
    while (v9);
  }
  return 0;
}

double wpi_pmac(unsigned int *a1, int8x16_t *a2, int a3, _DWORD *a4, int8x16_t *a5)
{
  int v6;
  int8x16_t v9;
  double result;
  _BYTE v11[128];
  int8x16_t v12;

  if ((a3 - 4097) >= 0xFFFFF000)
  {
    v6 = a3;
    SMS4KeyExt(a4, (uint64_t)v11);
    SMS4Crypt(a1, &v12, (uint64_t)v11);
    do
    {
      v9 = *a2++;
      v12 = veorq_s8(v12, v9);
      SMS4Crypt((unsigned int *)&v12, &v12, (uint64_t)v11);
      --v6;
    }
    while (v6);
    result = *(double *)v12.i64;
    *a5 = v12;
  }
  return result;
}

uint64_t unpack_private_key(_BYTE *a1, _BYTE *a2, int a3)
{
  size_t v3;
  size_t v7;
  int v8;
  uint64_t v9;
  size_t v10;
  int v11;
  uint64_t v12;
  size_t v13;
  int v14;

  *a1 = a2[2];
  v3 = a2[3];
  a1[1] = v3;
  if ((int)v3 + 4 > a3)
    return -1;
  memcpy(a1 + 2, a2 + 4, v3);
  a1[4] = a2[v3 + 4];
  v7 = a2[v3 + 5];
  a1[5] = v7;
  v8 = v3 + 6;
  if ((int)v7 + v8 > a3)
    return -1;
  memcpy(a1 + 8, &a2[v8], v7);
  v9 = (v8 + v7);
  a1[264] = a2[v9];
  a1[265] = a2[v9 + 1];
  a1[266] = a2[v9 + 2];
  v10 = a2[v9 + 3];
  a1[267] = v10;
  v11 = v9 + 4;
  if ((int)v10 + (int)v9 + 4 > a3)
    return -1;
  memcpy(a1 + 268, &a2[v11], v10);
  v12 = (v11 + v10);
  a1[524] = a2[v12];
  a1[525] = a2[v12 + 1];
  a1[526] = a2[v12 + 2];
  v13 = a2[v12 + 3];
  a1[527] = v13;
  v14 = v12 + 4;
  if ((int)v13 + (int)v12 + 4 <= a3)
  {
    memcpy(a1 + 528, &a2[v14], v13);
    return (__int16)(v14 + v13);
  }
  else
  {
    return -1;
  }
}

uint64_t ParsePubKey(unsigned __int8 **a1, unint64_t a2, uint64_t a3, uint64_t *a4)
{
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  BOOL v16;
  unint64_t v18;
  size_t v19;
  __int128 v20;
  uint64_t v21;
  size_t v22;
  unsigned __int8 *v23;
  _OWORD __dst[6];
  int v25;

  v8 = *a1;
  v22 = 0;
  v23 = v8;
  v21 = 0;
  v25 = 0;
  memset(__dst, 0, sizeof(__dst));
  sub_10000B508(&v23, a2, 0);
  sub_10000B508(&v23, a2, &v22);
  v22 = 100;
  if (sub_10000B584(&v23, a2, __dst, &v22, &v21))
    return 1;
  v10 = v23;
  v11 = v21;
  v9 = 1;
  if (!sub_10000B6B4((unint64_t)__dst, v22, (unint64_t)v23, v21, 1))
  {
    v12 = &v10[v11];
    v23 = &v10[v11];
    if ((v10[v11] & 0x1F) == 3)
    {
      v13 = v12[1];
      if ((char)v12[1] < 0)
      {
        v15 = v13 & 0x7F;
        v16 = (v13 & 0x7F) == 0 || (unint64_t)(v12 + 2) >= a2;
        if (v16)
          return v9;
        v13 = 0;
        v18 = (unint64_t)&v10[v11 + 3];
        v19 = v15 - 1;
        do
        {
          v13 = *(unsigned __int8 *)(v18 - 1) | (v13 << 8);
          v16 = v19-- != 0;
          if (!v16)
            break;
          v16 = v18++ >= a2;
        }
        while (!v16);
      }
      v22 = v13;
      if (v13 != 50)
        return 1;
      if (!a3 || (unint64_t)*a4 < 0x31)
      {
        v14 = 50;
LABEL_10:
        v9 = 0;
        *a4 = v14;
        return v9;
      }
      if (sub_10000B774(&v23, a2, __dst, &v22))
        return 1;
      v9 = 1;
      if (BYTE1(__dst[0]) == 4 && !LOBYTE(__dst[0]))
      {
        v20 = *(_OWORD *)((char *)&__dst[1] + 1);
        *(_OWORD *)a3 = *(_OWORD *)((char *)__dst + 1);
        *(_OWORD *)(a3 + 16) = v20;
        *(_OWORD *)(a3 + 32) = *(_OWORD *)((char *)&__dst[2] + 1);
        *(_BYTE *)(a3 + 48) = BYTE1(__dst[3]);
        *a1 = v23;
        v14 = v22 - 1;
        goto LABEL_10;
      }
    }
  }
  return v9;
}

_QWORD *sub_10000B508(_QWORD *result, unint64_t a2, unint64_t *a3)
{
  char *v3;
  int v4;
  unint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;

  v3 = (char *)(*result + 1);
  if ((~*(unsigned __int8 *)*result & 0x1F) == 0)
  {
    do
      v4 = *v3++;
    while (v4 < 0 && (unint64_t)v3 < a2);
  }
  v5 = *v3;
  if (*v3 < 0)
  {
    v7 = v5 & 0x7F;
    v6 = (unsigned __int8 *)(v3 + 1);
    v8 = (v5 & 0x7F) == 0;
    v5 = 0;
    v9 = v8 || (unint64_t)v6 >= a2;
    if (!v9)
    {
      v10 = v7 - 1;
      do
      {
        v11 = *v6++;
        v5 = v11 | (v5 << 8);
        v9 = v10-- != 0;
      }
      while (v9 && (unint64_t)v6 < a2);
    }
  }
  else
  {
    v6 = (unsigned __int8 *)(v3 + 1);
  }
  *result = v6;
  if (a3)
    *a3 = v5;
  return result;
}

uint64_t sub_10000B584(_QWORD *a1, unint64_t a2, void *__dst, size_t *a4, uint64_t *a5)
{
  _BYTE *v5;
  size_t v7;
  unsigned __int8 *v8;
  uint64_t result;
  size_t v10;
  BOOL v11;
  BOOL v12;
  size_t v13;
  unsigned int v14;
  size_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v22;
  unsigned int v23;

  v5 = (_BYTE *)*a1;
  if (*(_BYTE *)*a1 != 6)
    return 1;
  v7 = v5[1];
  if ((char)v5[1] < 0)
  {
    v10 = v7 & 0x7F;
    v8 = v5 + 2;
    v11 = (v7 & 0x7F) == 0;
    v7 = 0;
    v12 = v11 || (unint64_t)v8 >= a2;
    if (!v12)
    {
      v13 = v10 - 1;
      do
      {
        v14 = *v8++;
        v7 = v14 | (v7 << 8);
        v12 = v13-- != 0;
      }
      while (v12 && (unint64_t)v8 < a2);
    }
  }
  else
  {
    v8 = v5 + 2;
  }
  v15 = *a4;
  *a4 = v7;
  if (a5)
  {
    v16 = &v8[v7];
    if (v8[v7] == 5)
    {
      v17 = 2;
    }
    else
    {
      v18 = v16[1];
      if ((char)v16[1] < 0)
      {
        v20 = v18 & 0x7F;
        v19 = v16 + 2;
        v11 = (v18 & 0x7F) == 0;
        v18 = 0;
        if (!v11 && (unint64_t)v19 < a2)
        {
          v22 = v20 - 1;
          do
          {
            v23 = *v19++;
            v18 = v23 | (v18 << 8);
            v12 = v22-- != 0;
          }
          while (v12 && (unint64_t)v19 < a2);
        }
      }
      else
      {
        v19 = v16 + 2;
      }
      v17 = v19 - &v8[v7] + v18;
    }
    *a5 = v17;
  }
  if (!__dst)
    return 0;
  if (v7 < v15)
    v15 = v7;
  memcpy(__dst, v8, v15);
  result = 0;
  *a1 = &v8[v7];
  return result;
}

BOOL sub_10000B6B4(unint64_t __s2, size_t __n, unint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10;
  __int16 *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!(__s2 | a3))
    return 1;
  if (__s2)
  {
    v10 = 7;
    if (!a5)
      v10 = 8;
    if (v10 != __n)
      return 0;
    v11 = a5 ? &asc_10001C838[2] : &asc_10001CC48[2];
    if (memcmp(v11, (const void *)__s2, __n))
      return 0;
  }
  if (!a3)
    return 1;
  if (a4 != 11)
    return 0;
  v12 = (uint64_t *)&unk_10001CA3C;
  if (!a5)
    v12 = (uint64_t *)&unk_10001CE4C;
  v13 = *v12;
  v14 = *(uint64_t *)((char *)v12 + 3);
  return v13 == *(_QWORD *)a3 && v14 == *(_QWORD *)(a3 + 3);
}

uint64_t sub_10000B774(unsigned __int8 **a1, unint64_t a2, void *__dst, size_t *a4)
{
  unsigned __int8 *v6;
  size_t v7;
  unsigned __int8 *v8;
  size_t v9;
  BOOL v10;
  BOOL v11;
  size_t v12;
  unsigned int v13;
  uint64_t result;
  unsigned int v15;

  v6 = *a1;
  v7 = (*a1)[1];
  if ((char)(*a1)[1] < 0)
  {
    v9 = v7 & 0x7F;
    v8 = v6 + 2;
    v10 = (v7 & 0x7F) == 0;
    v7 = 0;
    v11 = v10 || (unint64_t)v8 >= a2;
    if (!v11)
    {
      v12 = v9 - 1;
      do
      {
        v13 = *v8++;
        v7 = v13 | (v7 << 8);
        v11 = v12-- != 0;
      }
      while (v11 && (unint64_t)v8 < a2);
    }
  }
  else
  {
    v8 = v6 + 2;
  }
  if (__dst && *a4 >= v7)
  {
    v15 = *v6;
    result = 1;
    if (v15 <= 0x1E && ((1 << v15) & 0x50081018) != 0)
    {
      memcpy(__dst, v8, v7);
      result = 0;
      *a4 = v7;
      *a1 = &v8[v7];
    }
  }
  else
  {
    result = 0;
    *a4 = v7;
  }
  return result;
}

uint64_t Base64Dec(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  unsigned int v6;
  _BYTE *v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  int v12;

  if ((a3 & 3) != 0)
    return 0xFFFFFFFFLL;
  if (a3 < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v6 = a3 + 4;
    do
    {
      v7 = (_BYTE *)(a1 + v3);
      v8 = sub_10000B93C(*a2);
      v9 = sub_10000B93C(a2[1]);
      v10 = sub_10000B93C(a2[2]);
      v11 = sub_10000B93C(a2[3]);
      *v7 = (v9 >> 4) | (4 * v8);
      v7[1] = (v10 >> 2) | (16 * v9);
      v7[2] = v11 | ((_BYTE)v10 << 6);
      a2 += 4;
      v3 += 3;
      v6 -= 4;
    }
    while (v6 > 4);
  }
  if (*(_BYTE *)a1 == 48)
  {
    v12 = *(unsigned __int8 *)(a1 + 1);
    if (v12 == 130)
      return __rev16(*(unsigned __int16 *)(a1 + 2)) + 4;
    else
      return (v12 + 2);
  }
  return v3;
}

uint64_t sub_10000B93C(int a1)
{
  unsigned int v1;
  char v2;
  char v3;
  char v4;
  char v5;

  v1 = a1 - 65;
  if (a1 == 47)
    v2 = 63;
  else
    v2 = 0;
  if (a1 == 61)
    v2 = 0;
  if (a1 == 43)
    v3 = 62;
  else
    v3 = v2;
  if ((a1 - 48) <= 9)
    v4 = a1 + 4;
  else
    v4 = v3;
  if ((a1 - 97) <= 0x19)
    v5 = a1 - 71;
  else
    v5 = v4;
  if (v1 >= 0x1A)
    LOBYTE(v1) = v5;
  return v1;
}

uint64_t get_realinfo_from_cert(uint64_t a1, char *a2, int a3, char *__s, char *a5)
{
  size_t v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  char *v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  BOOL v19;

  v10 = strlen(__s);
  v11 = 0;
  if (a2)
  {
    if (__s)
    {
      if (a5)
      {
        v12 = v10;
        v13 = strlen(a5);
        v14 = sub_10000BA94(a2, a3, __s, v12);
        v15 = sub_10000BA94(a2, a3, a5, v13);
        v11 = 0;
        if (v14)
        {
          if (v15 && v14 < v15)
          {
            v16 = (unsigned __int8 *)&v14[(int)v12];
            if (v16 < (unsigned __int8 *)v15)
            {
              v17 = 0;
              do
              {
                v18 = *v16;
                v19 = (v18 - 47) >= 0xB && (v18 & 0xFFFFFFDF) - 65 >= 0x1A;
                if (!v19 || v18 == 61 || v18 == 43)
                  *(_BYTE *)(a1 + v17++) = v18;
                ++v16;
              }
              while (v16 < (unsigned __int8 *)v15);
            }
            return a1;
          }
        }
      }
    }
  }
  return v11;
}

char *sub_10000BA94(char *__s1, int a2, void *__s2, size_t __n)
{
  char *result;
  char *v6;
  size_t v8;

  result = 0;
  if (a2 >= (int)__n && ((__n | a2) & 0x80000000) == 0)
  {
    v6 = &__s1[a2 - __n];
    if (v6 < __s1)
    {
      return 0;
    }
    else
    {
      v8 = __n;
      while (memcmp(__s1, __s2, v8))
      {
        if (++__s1 > v6)
          return 0;
      }
      return __s1;
    }
  }
  return result;
}

uint64_t iwn_x509_get_pubkey(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _WORD *buffer;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  size_t v10;
  _QWORD __dst[12];

  v9 = 0;
  if (!a1)
    return 0;
  v1 = a1 + 4;
  v8 = (unsigned __int8 *)(a1 + 4);
  v2 = *(unsigned __int16 *)(a1 + 2);
  buffer = iwn_get_buffer(2052);
  if (buffer)
  {
    v4 = v1 + v2;
    v10 = 0;
    sub_10000B508(&v8, v4, 0);
    sub_10000B508(&v8, v4, 0);
    sub_10000B508(&v8, v4, 0);
    sub_10000B508(&v8, v4, &v10);
    if (*v8 == 2)
    {
      v8 += v10;
      v5 = v8;
      sub_10000B508(&v8, v4, &v10);
      v8 += v10;
      if ((unint64_t)(v8 - v5) <= 0xFF)
      {
        sub_10000B508(&v8, v4, 0);
        v10 = 100;
        if (!sub_10000B584(&v8, v4, __dst, &v10, &v9)
          && (unint64_t)&v8[v9] <= v4
          && (v10 != 8 || __dst[0] != 0xD7001C0081002ALL))
        {
          v8 += v9;
          sub_10000BD78((const void **)&v8, v4, 0, &v10);
          if (!sub_10000BDFC(&v8, v4))
          {
            sub_10000BD78((const void **)&v8, v4, 0, &v10);
            v10 = 2048;
            if (!ParsePubKey(&v8, v4, (uint64_t)(buffer + 2), (uint64_t *)&v10))
            {
              v7 = v10;
              *buffer = v10;
              asl_log(0, 0, 5, "iwn_x509_get_pubkey: tmp = '%ld', '%s', '%d' \n", v7, "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 672);
              iwn_wpa_hexdump(2, "get_x509_cert value", (uint64_t)(buffer + 2), (unsigned __int16)*buffer);
              return (uint64_t)buffer;
            }
            asl_log(0, 0, 5, "iwn_x509_get_pubkey: '%s', '%d' \n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 666);
          }
        }
      }
    }
    return iwn_free_buffer(buffer, 2052);
  }
  return (uint64_t)buffer;
}

void *sub_10000BD78(const void **a1, unint64_t a2, void *a3, size_t *a4)
{
  _BYTE *v7;
  void *result;
  char *v9;
  size_t v10;
  unint64_t v11;
  _BYTE *v12;

  v7 = *a1;
  v11 = 0;
  v12 = v7;
  result = sub_10000B508(&v12, a2, &v11);
  v9 = &v12[v11];
  if (&v12[v11] - v7 >= *a4)
    v10 = *a4;
  else
    v10 = &v12[v11] - v7;
  if (a3)
    result = memcpy(a3, v7, v10);
  *a1 = v9;
  *a4 = v10;
  return result;
}

uint64_t sub_10000BDFC(unsigned __int8 **a1, unint64_t a2)
{
  unsigned __int8 *v4;
  uint64_t result;
  unint64_t v6;
  unsigned __int8 *v7;

  v4 = *a1;
  v6 = 0;
  v7 = v4;
  sub_10000B508(&v7, a2, 0);
  if (*v7 - 23 > 1)
    return 1;
  sub_10000B508(&v7, a2, &v6);
  v7 += v6;
  if (*v7 - 23 > 1)
    return 1;
  sub_10000B508(&v7, a2, &v6);
  result = 0;
  *a1 = &v7[v6];
  return result;
}

uint64_t iwn_x509_get_subject_name(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *buffer;
  unint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v7;
  uint64_t v8;
  size_t v9;
  _QWORD __dst[12];

  v8 = 0;
  if (!a1)
    return 0;
  v1 = a1 + 4;
  v7 = (unsigned __int8 *)(a1 + 4);
  v2 = *(unsigned __int16 *)(a1 + 2);
  buffer = iwn_get_buffer(260);
  if (buffer)
  {
    v4 = v1 + v2;
    v9 = 0;
    sub_10000B508(&v7, v4, 0);
    sub_10000B508(&v7, v4, 0);
    sub_10000B508(&v7, v4, 0);
    sub_10000B508(&v7, v4, &v9);
    if (*v7 != 2)
      return iwn_free_buffer(buffer, 260);
    v7 += v9;
    v5 = v7;
    sub_10000B508(&v7, v4, &v9);
    v7 += v9;
    if ((unint64_t)(v7 - v5) > 0xFF)
      return iwn_free_buffer(buffer, 260);
    sub_10000B508(&v7, v4, 0);
    v9 = 100;
    if (sub_10000B584(&v7, v4, __dst, &v9, &v8)
      || (unint64_t)&v7[v8] > v4
      || v9 == 8 && __dst[0] == 0xD7001C0081002ALL)
    {
      return iwn_free_buffer(buffer, 260);
    }
    v7 += v8;
    v9 = 256;
    sub_10000BD78((const void **)&v7, v4, 0, &v9);
    if (sub_10000BDFC(&v7, v4))
    {
      return iwn_free_buffer(buffer, 260);
    }
    else
    {
      v9 = 256;
      sub_10000BD78((const void **)&v7, v4, buffer + 4, &v9);
      *buffer = v9;
    }
  }
  return (uint64_t)buffer;
}

uint64_t iwn_x509_get_serial_number(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *buffer;
  unint64_t v4;
  const void *v5;
  unint64_t v6;
  _BYTE *v8;
  unint64_t v9;

  if (!a1)
    return 0;
  v1 = a1 + 4;
  v8 = (_BYTE *)(a1 + 4);
  v2 = *(unsigned __int16 *)(a1 + 2);
  buffer = iwn_get_buffer(260);
  if (buffer)
  {
    v4 = v1 + v2;
    v9 = 0;
    sub_10000B508(&v8, v4, 0);
    sub_10000B508(&v8, v4, 0);
    sub_10000B508(&v8, v4, 0);
    sub_10000B508(&v8, v4, &v9);
    if (*v8 == 2 && (v8 += v9, v5 = v8, sub_10000B508(&v8, v4, &v9), v6 = &v8[v9] - (_BYTE *)v5, v6 <= 0xFF))
    {
      memcpy(buffer + 4, v5, &v8[v9] - (_BYTE *)v5);
      *buffer = v6;
    }
    else
    {
      return iwn_free_buffer(buffer, 260);
    }
  }
  return (uint64_t)buffer;
}

uint64_t iwn_x509_get_issuer_name(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *buffer;
  unint64_t v4;
  char *v5;
  char *v7;
  uint64_t v8;
  size_t v9;
  _QWORD __dst[12];

  v8 = 0;
  if (!a1)
    return 0;
  v1 = a1 + 4;
  v7 = (char *)(a1 + 4);
  v2 = *(unsigned __int16 *)(a1 + 2);
  buffer = iwn_get_buffer(260);
  if (buffer)
  {
    v4 = v1 + v2;
    v9 = 0;
    sub_10000B508(&v7, v4, 0);
    sub_10000B508(&v7, v4, 0);
    sub_10000B508(&v7, v4, 0);
    sub_10000B508(&v7, v4, &v9);
    if (*v7 != 2)
      return iwn_free_buffer(buffer, 260);
    v7 += v9;
    v5 = v7;
    sub_10000B508(&v7, v4, &v9);
    v7 += v9;
    if ((unint64_t)(v7 - v5) > 0xFF)
      return iwn_free_buffer(buffer, 260);
    sub_10000B508(&v7, v4, 0);
    v9 = 100;
    if (sub_10000B584(&v7, v4, __dst, &v9, &v8)
      || (unint64_t)&v7[v8] > v4
      || v9 == 8 && __dst[0] == 0xD7001C0081002ALL)
    {
      return iwn_free_buffer(buffer, 260);
    }
    else
    {
      v7 += v8;
      v9 = 256;
      sub_10000BD78((const void **)&v7, v4, buffer + 4, &v9);
      *buffer = v9;
    }
  }
  return (uint64_t)buffer;
}

uint64_t iwn_x509_get_sign(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t result;
  unint64_t v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  uint64_t v11;
  int v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  void *__src;

  v19 = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 >= 48)
  {
    __src = (void *)(a1 + 4);
    v6 = a1 + 4 + *(unsigned __int16 *)(a1 + 2);
    sub_10000B508(&__src, v6, 0);
    sub_10000B508(&__src, v6, &v19);
    v7 = (char *)__src + v19;
    v19 = 0;
    __src = v7;
    sub_10000B508(&__src, v6, &v19);
    v8 = (char *)__src + v19;
    v19 = 0;
    __src = v8;
    sub_10000B508(&__src, v6, 0);
    __src = (char *)__src + 1;
    sub_10000B508(&__src, v6, 0);
    sub_10000B508(&__src, v6, &v19);
    v9 = v19;
    if (v19 < 0x19)
    {
      v10 = (char *)__src;
      if (v19 == 23)
      {
        v11 = *(_QWORD *)((char *)__src + 15);
        v10 = (char *)__src - 1;
        *(_OWORD *)a2 = *(_OWORD *)((char *)__src - 1);
        a2[2] = v11;
        *(_BYTE *)a2 = 0;
        v12 = 24;
        goto LABEL_10;
      }
    }
    else
    {
      v10 = (char *)__src;
      if (!*(_BYTE *)__src)
      {
        v10 = (char *)__src + 1;
        v9 = v19 - 1;
      }
    }
    memcpy(a2, v10, v9);
    v12 = v9;
LABEL_10:
    v13 = v12;
    v19 = 0;
    __src = &v10[v12];
    sub_10000B508(&__src, v6, &v19);
    if (v19 < 0x19)
    {
      v14 = (char *)__src;
      if (v19 == 23)
      {
        v17 = (char *)a2 + v13;
        v18 = *(_QWORD *)((char *)__src + 15);
        *(_OWORD *)v17 = *(_OWORD *)((char *)__src - 1);
        *((_QWORD *)v17 + 2) = v18;
        *v17 = 0;
LABEL_17:
        iwn_wpa_hexdump(2, "iwn_x509_get_sign", (uint64_t)a2, 48);
        return 0;
      }
    }
    else
    {
      v14 = (char *)__src;
      if (!*(_BYTE *)__src)
      {
        v14 = (char *)__src + 1;
        v15 = (char *)a2 + v13;
        v16 = v19 - 1;
LABEL_16:
        memcpy(v15, v14, v16);
        goto LABEL_17;
      }
    }
    v15 = (char *)a2 + v13;
    v16 = v13;
    goto LABEL_16;
  }
  return result;
}

uint64_t iwn_x509_get_sign_inlen(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = a1 + 4;
  v1 = a1 + 4 + *(unsigned __int16 *)(a1 + 2);
  sub_10000B508(&v6, v1, 0);
  v2 = v6;
  sub_10000B508(&v6, v1, &v5);
  v3 = v5 - v2 + v6;
  asl_log(0, 0, 5, "iwn_x509_get_sign_inlen: '%d'\n", v5 - v2 + v6);
  return v3;
}

void *cert_obj_register(int *a1)
{
  uint64_t v2;
  void *result;
  int *v4;
  BOOL v5;
  uint64_t v6;

  v2 = *a1;
  if ((int)v2 >= 3)
    return (void *)asl_log(0, 0, 5, "%s: certificate %s has an invalid cert_index %u\n\n");
  v4 = (int *)qword_1000207A0[v2];
  if (v4)
    v5 = v4 == a1;
  else
    v5 = 1;
  if (!v5)
    return (void *)asl_log(0, 0, 5, "%s: certificate object %s registered with a different template\n\n");
  result = iwn_get_buffer(16);
  *((_QWORD *)a1 + 6) = result;
  if (result)
  {
    result = iwn_get_buffer(16);
    *((_QWORD *)a1 + 7) = result;
    if (result)
    {
      v6 = *a1;
      qword_1000207A0[v6] = a1;
      word_100020358 = v6;
    }
  }
  return result;
}

uint64_t cert_obj_unregister(int *a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  BOOL v5;

  v2 = *a1;
  if ((int)v2 >= 4)
    return asl_log(0, 0, 5, "%s: certificate %s has an invalid cert_index %u\n\n");
  v4 = (void **)qword_1000207A0[v2];
  if (v4)
    v5 = v4 == (void **)a1;
  else
    v5 = 1;
  if (v5)
  {
    iwn_free_buffer(v4[6], 16);
    result = iwn_free_buffer(*(void **)(qword_1000207A0[*a1] + 56), 16);
    qword_1000207A0[v2] = 0;
  }
  else
  {
    asl_log(0, 0, 5, "cert_obj address \t%p\n\n", a1);
    asl_log(0, 0, 5, "obj address \t\t%p\n\n", (const void *)qword_1000207A0[*a1]);
    return asl_log(0, 0, 5, "%s: certificate object %s registered with a different template\n\n");
  }
  return result;
}

uint64_t get_cert_obj(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return qword_1000207A0[a1];
}

uint64_t x509_verify_cert(_QWORD *a1)
{
  uint64_t v2;
  unsigned __int16 *v3;
  uint64_t v4;
  int (*v5)(unsigned __int16 *, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t);
  uint64_t v6;
  uint64_t sign_inlen;
  int (*v8)(unsigned __int16 *, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _OWORD v12[3];
  char v13;
  _OWORD v14[3];
  char v15;

  v2 = a1[2];
  v3 = (unsigned __int16 *)a1[3];
  v4 = a1[4];
  memset(v14, 0, sizeof(v14));
  v15 = 0;
  if ((iwn_x509_get_sign(v2, v14, 49) & 0x80000000) == 0)
  {
    v13 = 0;
    memset(v12, 0, sizeof(v12));
    if ((iwn_x509_get_sign(v4, v12, 49) & 0x80000000) == 0)
    {
      v5 = (int (*)(unsigned __int16 *, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))a1[14];
      v6 = *v3;
      sign_inlen = iwn_x509_get_sign_inlen(v2);
      if (v5(v3 + 2, v6, v2 + 8, sign_inlen, v14, 48) < 1)
      {
        asl_log(0, 0, 5, "in %s X509_verify(asu_cert) failure\n\n");
      }
      else
      {
        v8 = (int (*)(unsigned __int16 *, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))a1[14];
        v9 = *v3;
        v10 = iwn_x509_get_sign_inlen(v4);
        if (v8(v3 + 2, v9, v4 + 8, v10, v12, 48) > 0)
          return 0;
        asl_log(0, 0, 5, "in %s X509_verify(user_cert) failure\n\n");
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t x509_free_obj_data(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 16))
  {
    asl_log(0, 0, 5, "in %s:%d free asu_cert_st\n\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1292);
    result = iwn_free_buffer(*(void **)(v1 + 16), 0);
    *(_QWORD *)(v1 + 16) = 0;
  }
  if (*(_QWORD *)(v1 + 32))
  {
    asl_log(0, 0, 5, "in %s:%d free user_cert_st\n\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1298);
    result = iwn_free_buffer(*(void **)(v1 + 32), 0);
    *(_QWORD *)(v1 + 32) = 0;
  }
  if (*(_QWORD *)(v1 + 24))
  {
    asl_log(0, 0, 5, "in %s:%d free asu_pubkey\n\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1304);
    result = iwn_free_buffer(*(void **)(v1 + 24), 8);
    *(_QWORD *)(v1 + 24) = 0;
  }
  if (*(_QWORD *)(v1 + 40))
  {
    asl_log(0, 0, 5, "in %s:%d free private_key\n\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1310);
    result = iwn_free_buffer(*(void **)(v1 + 40), 8);
    *(_QWORD *)(v1 + 40) = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8))
  {
    asl_log(0, 0, 5, "in %s:%d free cert_bin->data\n\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1316);
    bzero(*(void **)(*(_QWORD *)(v1 + 48) + 8), **(unsigned __int16 **)(v1 + 48));
    result = iwn_free_buffer(*(void **)(*(_QWORD *)(v1 + 48) + 8), 0);
    *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) = 0;
  }
  return result;
}

uint64_t get_x509_cert(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  int v6;
  int v7;
  char *buffer;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  char *v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;

  v2 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    asl_log(0, 0, 5, "get_x509_cert: '%s', '%d' \n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1339);
    bzero(byte_100020FB8, 0x800uLL);
    v5 = strlen((const char *)(a1 + 2052));
    if (get_realinfo_from_cert((uint64_t)byte_100020FB8, (char *)(a1 + 2052), v5, "-----BEGIN EC PRIVATE KEY-----", "-----END EC PRIVATE KEY-----"))
    {
      v6 = strlen(byte_100020FB8);
      bzero(byte_1000207B8, 0x800uLL);
      v7 = Base64Dec((uint64_t)byte_1000207B8, (unsigned __int8 *)byte_100020FB8, v6);
      if (v7 < 0)
      {
        asl_log(0, 0, 5, "Base64 decode prikey error\n\n");
      }
      else
      {
        unpack_private_key(byte_1000217B8, byte_1000207B8, (__int16)v7);
        buffer = (char *)iwn_get_buffer(2052);
        *(_QWORD *)(a2 + 40) = buffer;
        if (buffer)
        {
          memcpy(buffer + 4, &unk_1000217C0, byte_1000217BD);
          **(_WORD **)(a2 + 40) = byte_1000217BD;
          bzero(byte_100020FB8, 0x800uLL);
          v9 = strlen((const char *)(a1 + 2052));
          if (get_realinfo_from_cert((uint64_t)byte_100020FB8, (char *)(a1 + 2052), v9, "-----BEGIN CERTIFICATE-----", "-----END CERTIFICATE-----"))
          {
            v10 = strlen(byte_100020FB8);
            bzero(byte_1000207B8, 0x800uLL);
            v11 = Base64Dec((uint64_t)byte_1000207B8, (unsigned __int8 *)byte_100020FB8, v10);
            if ((v11 & 0x80000000) != 0)
            {
              asl_log(0, 0, 5, "Base64 decode user cert error\n\n");
            }
            else
            {
              v12 = v11;
              asl_log(0, 0, 5, "user cert infor (user_cert)  '%d'\n\n", v11);
              iwn_wpa_hexdump(2, "user cert infor", (uint64_t)byte_1000207B8, v12);
              *(_QWORD *)(a2 + 32) = iwn_get_buffer(2052);
              v13 = iwn_get_buffer(v12 + 1);
              *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8) = v13;
              v14 = *(_QWORD *)(a2 + 32);
              if (v14 && v13)
              {
                v15 = (char *)(a1 + 4);
                memcpy((void *)(v14 + 4), byte_1000207B8, v12);
                *(_WORD *)(*(_QWORD *)(a2 + 32) + 2) = v12;
                memcpy(*(void **)(*(_QWORD *)(a2 + 48) + 8), byte_1000207B8, v12);
                **(_WORD **)(a2 + 48) = v12;
                bzero(byte_100020FB8, 0x800uLL);
                v16 = strlen(v15);
                if (get_realinfo_from_cert((uint64_t)byte_100020FB8, v15, v16, "-----BEGIN CERTIFICATE-----", "-----END CERTIFICATE-----"))
                {
                  v17 = strlen(byte_100020FB8);
                  bzero(byte_1000207B8, 0x800uLL);
                  v18 = Base64Dec((uint64_t)byte_1000207B8, (unsigned __int8 *)byte_100020FB8, v17);
                  if ((v18 & 0x80000000) != 0)
                  {
                    asl_log(0, 0, 5, "Base64 decode asu cert error\n\n");
                  }
                  else
                  {
                    v19 = v18;
                    asl_log(0, 0, 5, "asu cert infor (asu_cert)  '%d'\n\n", v18);
                    iwn_wpa_hexdump(2, "asu cert infor", (uint64_t)byte_1000207B8, v19);
                    v20 = (char *)iwn_get_buffer(2052);
                    *(_QWORD *)(a2 + 16) = v20;
                    if (v20)
                    {
                      memcpy(v20 + 4, byte_1000207B8, v19);
                      *(_WORD *)(*(_QWORD *)(a2 + 16) + 2) = v19;
                      v21 = (*(uint64_t (**)(void))(a2 + 64))();
                      *(_QWORD *)(a2 + 24) = v21;
                      if (v21)
                      {
                        asl_log(0, 0, 5, "get_x509_cert public:  '%d' \n", byte_1000219C7);
                        asl_log(0, 0, 5, "get_x509_cert private: '%d' \n", byte_1000217BD);
                        if ((*(unsigned int (**)(void *, _QWORD, void *, _QWORD))(a2 + 96))(&unk_1000219C9, byte_1000219C7 - 1, &unk_1000217C0, byte_1000217BD))
                        {
                          if (x509_verify_cert((_QWORD *)a2))
                            v2 = 0xFFFFFFFFLL;
                          else
                            v2 = 0;
                          goto LABEL_23;
                        }
                        asl_log(0, 0, 5, "verify_key the public_private_key fail. \n\n");
                      }
                      else
                      {
                        asl_log(0, 0, 5, "get asu public key fial. \n\n");
                      }
                    }
                    else
                    {
                      asl_log(0, 0, 5, "malloc asu cert error. \n\n");
                    }
                  }
                }
                else
                {
                  asl_log(0, 0, 5, "get asu cert error. \n\n");
                }
              }
              else
              {
                asl_log(0, 0, 5, "malloc user cert error. \n\n");
              }
            }
          }
          else
          {
            asl_log(0, 0, 5, "get user cert error. \n\n");
          }
        }
        else
        {
          asl_log(0, 0, 5, "malloc prikey fail \n\n");
        }
      }
    }
    else
    {
      asl_log(0, 0, 5, "get prikey error. \n\n");
    }
    v2 = 0xFFFFFFFFLL;
  }
LABEL_23:
  asl_log(0, 0, 5, "get_x509_cert over\n\n");
  return v2;
}

uint64_t init_cert(uint64_t a1)
{
  uint64_t v2;
  uint64_t x509_cert;

  v2 = (unsigned __int16)word_100020358;
  x509_free_obj_data(qword_1000207A0[(unsigned __int16)word_100020358]);
  x509_cert = get_x509_cert(a1, qword_1000207A0[v2]);
  if (!(_DWORD)x509_cert)
  {
    iwn_eloop = qword_1000207A0[v2];
    asl_log(0, 0, 5, "WPA: in %s:%d,length=%d\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/cert.c", 1506, **(unsigned __int16 **)(iwn_eloop + 48));
    iwn_wai_fixdata_id_by_ident(*(_QWORD *)(iwn_eloop + 32), &word_100020360, (unsigned __int16)word_100020358);
    dword_10002074C = 1;
  }
  return x509_cert;
}

uint64_t cleanup_cert()
{
  x509_free_obj_data(qword_1000207A0[(unsigned __int16)word_100020358]);
  return 0xFFFFFFFFLL;
}

uint64_t X509_init()
{
  dword_100021AC8 = 1;
  qword_100021AD0 = (uint64_t)"x509v3";
  xmmword_100021AD8 = 0u;
  unk_100021AE8 = 0u;
  qword_100021B08 = (uint64_t)j__iwn_x509_get_pubkey;
  unk_100021B10 = j__iwn_x509_get_subject_name;
  qword_100021B18 = (uint64_t)j__iwn_x509_get_issuer_name;
  unk_100021B20 = j__iwn_x509_get_serial_number;
  qword_100021AF8 = 0;
  qword_100021B28 = (uint64_t)x509_ecc_verify_key;
  unk_100021B30 = x509_ecc_sign;
  qword_100021B38 = (uint64_t)x509_ecc_verify;
  cert_obj_register(&dword_100021AC8);
  return 0;
}

uint64_t X509_exit()
{
  return cert_obj_unregister(&dword_100021AC8);
}

_BYTE *get_random(_BYTE *a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  __int128 v7[2];

  if ((int)a2 >= 1)
  {
    v4 = a2;
    v5 = a1;
    do
    {
      *v5++ = sub_1000067FC();
      --v4;
    }
    while (v4);
  }
  v7[0] = xmmword_100019FC8;
  v7[1] = unk_100019FD8;
  return KD_hmac_sha256(a1, a2, v7, 0x20u, a1, a2);
}

uint64_t iwn_wpa_printf(uint64_t a1, char *format, ...)
{
  va_list va;

  va_start(va, format);
  return asl_vlog(0, 0, 5, format, va);
}

uint64_t iwn_wpa_hexdump(uint64_t result, const char *a2, uint64_t a3, int a4)
{
  if ((int)result >= 2)
    return print_buf(a2, a3, a4);
  return result;
}

uint64_t print_buf(const char *a1, uint64_t a2, int a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  size_t v13;
  const char *v14;
  int v15;
  int v16;
  uint64_t j;
  unsigned int v18;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[2];
  char __s[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int v41;

  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  *(_OWORD *)__s = 0u;
  v26 = 0u;
  __sprintf_chk(__s, 0, 0x104uLL, "%s(len=%d,0x%X)\n", a1, a3, a3);
  asl_log(0, 0, 5, "%s\n", __s);
  if (a3 < -14)
    return asl_log(0, 0, 5, "\n\n");
  v5 = 0;
  v6 = a3 - 1;
  if (a3 < 1)
    v6 = a3 + 14;
  v7 = (v6 >> 4);
  if (a3 <= 0)
    v8 = -(-a3 & 0xF);
  else
    v8 = a3 & 0xF;
  v21 = v8;
  v22 = v7;
  v20 = (v7 + 1);
  do
  {
    v9 = v5 != v22 || v21 == 0;
    v10 = v9;
    if (v9)
      v11 = 16;
    else
      v11 = v21;
    v23 = v5;
    __sprintf_chk(__s, 0, 0x104uLL, "%.4X  ", 16 * v5);
    if ((int)v11 < 1)
      goto LABEL_35;
    for (i = 0; i != v11; ++i)
    {
      v13 = strlen(__s);
      sprintf(&__s[v13], "%.2X", *(unsigned __int8 *)(a2 + i));
      if ((_DWORD)v11 - 1 != i)
      {
        if ((~(_BYTE)i & 3) != 0)
          continue;
        v14 = " ";
        goto LABEL_24;
      }
      if (v10)
      {
        v14 = "  ";
LABEL_24:
        __strcat_chk(__s, v14, 260);
        continue;
      }
      v15 = strlen(__s);
      v16 = v15;
      if (v15 <= 42)
      {
        memset(&__s[v15], 32, (42 - v15) + 1);
        v16 = 43;
      }
      __s[v16] = 0;
    }
    for (j = 0; j != v11; ++j)
    {
      v18 = *(unsigned __int8 *)(a2 + j);
      if (v18 < 0x20)
        LOBYTE(v18) = 46;
      if ((char)v18 < -96)
        LOBYTE(v18) = 46;
      v24[0] = v18;
      v24[1] = 0;
      __strcat_chk(__s, v24, 260);
    }
LABEL_35:
    asl_log(0, 0, 5, "%s\n", __s);
    v5 = v23 + 1;
    a2 += 16;
  }
  while (v23 + 1 != v20);
  return asl_log(0, 0, 5, "\n\n");
}

BOOL x509_ecc_verify(uint64_t a1, int a2, char *a3, signed int a4, uint64_t a5, int a6)
{
  _BOOL8 result;

  result = 0;
  if (a1 && a2 >= 1 && a3 && a4 >= 1 && a5 && a6 >= 1)
    return ecc192_verify(a1, a3, a4, a5, a6) > 0;
  return result;
}

uint64_t x509_ecc_sign(uint64_t a1, uint64_t a2, char *a3, signed int a4, uint64_t a5)
{
  if (a1 && a3 && a4 >= 1 && a5)
    return ecc192_sign(a1, a3, a4, a5);
  else
    return 0;
}

BOOL x509_ecc_verify_key(uint64_t a1, int a2, uint64_t a3, int a4)
{
  _BOOL8 result;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 __s;

  result = 0;
  strcpy((char *)&__s, "123456abcd");
  if (a2 >= 1 && a3 && a4 >= 1)
  {
    LOBYTE(v13) = 0;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    v7 = strlen((const char *)&__s);
    v8 = ecc192_sign(a3, (char *)&__s, v7, (uint64_t)&v10);
    if ((_DWORD)v8 == 48)
    {
      v9 = strlen((const char *)&__s);
      result = ecc192_verify(a1, (char *)&__s, v9, (uint64_t)&v10, 48);
      if ((int)result > 0)
        return result;
      iwn_wpa_printf(result, "ecc192_verify call fail \n", v10, v11, v12, v13, __s);
    }
    else
    {
      iwn_wpa_printf(v8, "ecc192_sign call fail \n", v10, v11, v12, v13, __s);
    }
    return 0;
  }
  return result;
}

uint64_t hash_sha256(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unsigned int v10;
  size_t v11;
  char *v12;
  int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  char *v19;
  _DWORD *v20;
  int v21;
  uint64_t i;
  _OWORD v24[2];
  unint64_t v25;
  _OWORD v26[4];
  int v27;
  _OWORD v28[3];
  uint64_t v29;
  int v30;
  int v31;

  memset(v26, 0, sizeof(v26));
  v24[0] = xmmword_100019FE8;
  v24[1] = unk_100019FF8;
  v25 = 0;
  v27 = 0;
  if (a2)
  {
    v5 = 0;
    v6 = 0;
    v7 = a2;
    while (1)
    {
      v8 = a1 + 16 * v6;
      v9 = *(const char **)v8;
      v10 = *(_DWORD *)(v8 + 8);
      if (!v5)
        break;
      v11 = 64 - v5;
      v12 = (char *)v26 + v5;
      v5 = v10 - v11;
      if (v10 >= v11)
      {
        memcpy(v12, *(const void **)v8, v11);
        sub_10000DAB8((unsigned int *)v24, (const char *)v26);
        v9 += v11;
        goto LABEL_8;
      }
      memcpy(v12, *(const void **)v8, *(unsigned int *)(v8 + 8));
      v5 = v27 + v10;
LABEL_11:
      v27 = v5;
      if (++v6 == v7)
      {
        *((_BYTE *)v26 + (int)v5) = 0x80;
        v13 = v5 + 1;
        if (((v5 + 1) & 3) != 0)
        {
          v14 = (int)v5;
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
    v5 = *(_DWORD *)(v8 + 8);
LABEL_8:
    if (v5 >= 0x40)
    {
      do
      {
        sub_10000DAB8((unsigned int *)v24, v9);
        v9 += 64;
        v5 -= 64;
      }
      while (v5 > 0x3F);
    }
    __memcpy_chk(v26, v9, v5, 68);
    goto LABEL_11;
  }
  v14 = 0;
  v5 = 0;
  LOBYTE(v26[0]) = 0x80;
LABEL_15:
  v15 = (2 - (_BYTE)v5) & 3;
  bzero((char *)v26 + v14 + 1, (v15 + 1));
  v16 = v15 + v5;
  v5 += v15 + 1;
  v13 = v16 + 2;
LABEL_16:
  v17 = v13 >> 2;
  if (v13 >= 4)
  {
    if (v17 <= 1)
      v18 = 1;
    else
      v18 = v17;
    v19 = (char *)v26 + 3;
    v20 = v28;
    do
    {
      *v20++ = bswap32(*(_DWORD *)(v19 - 3));
      v19 += 4;
      --v18;
    }
    while (v18);
  }
  if ((int)v5 <= 58)
  {
    if (v13 <= 55)
    {
      if (v17 <= 13)
        v21 = 13;
      else
        v21 = v13 >> 2;
      bzero((char *)v28 + 4 * v17, 4 * (v21 - v17) + 4);
    }
  }
  else
  {
    if (v5 <= 0x3E)
      v31 = 0;
    sub_10000DBE4((unsigned int *)v24, (unsigned int *)v28);
    v29 = 0;
    memset(v28, 0, sizeof(v28));
  }
  v30 = v25 >> 23;
  v31 = (8 * v27) | ((_DWORD)v25 << 9);
  sub_10000DBE4((unsigned int *)v24, (unsigned int *)v28);
  if (!a3)
    return 0;
  for (i = 0; i != 32; i += 4)
    *(_DWORD *)(a3 + i) = bswap32(*(_DWORD *)((char *)v24 + i));
  return 8;
}

_BYTE *KD_hmac_sha256(_BYTE *result, int a2, __int128 *a3, unsigned int a4, char *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;

  v6 = a6;
  if (a6 < 0x20)
  {
    v10 = 0;
    if (!(_DWORD)a6)
      return result;
    return (_BYTE *)hmac_sha256_0(result, a2, a3, a4, &a5[v10], v6);
  }
  v11 = ((a6 - 32) >> 5) + 1;
  v12 = v11;
  v13 = a5;
  do
  {
    v14 = v13;
    hmac_sha256_0(result, a2, a3, a4, v13, 32);
    v6 = (v6 - 32);
    v13 = v14 + 32;
    result = v14;
    a2 = 32;
    --v12;
  }
  while (v12);
  v10 = 32 * v11;
  result = v14;
  if ((_DWORD)v6)
    return (_BYTE *)hmac_sha256_0(result, a2, a3, a4, &a5[v10], v6);
  return result;
}

uint64_t hmac_sha256_0(_BYTE *a1, int a2, __int128 *a3, unsigned int a4, void *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  int8x16_t v13;
  int8x16_t v14;
  __int128 *v16;
  int v17;
  _BYTE *v18;
  int v19;
  _BYTE __src[32];
  _BYTE v21[32];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  if (a6 > 0x20)
    return 0;
  v6 = a6;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  if (a4 < 0x41)
  {
    v11 = a4;
    __memcpy_chk(&v22, a3, a4, 64);
    __memcpy_chk(&v26, a3, v11, 64);
  }
  else
  {
    v16 = a3;
    v17 = a4;
    hash_sha256((uint64_t)&v16, 1u, (uint64_t)&v26);
    v22 = v26;
    v23 = v27;
  }
  v12 = 0;
  v13.i64[0] = 0x3636363636363636;
  v13.i64[1] = 0x3636363636363636;
  v14.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v14.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    *(__int128 *)((char *)&v26 + v12) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v26 + v12), v13);
    *(__int128 *)((char *)&v22 + v12) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v22 + v12), v14);
    v12 += 16;
  }
  while (v12 != 64);
  v16 = &v26;
  v17 = 64;
  v18 = a1;
  v19 = a2;
  hash_sha256((uint64_t)&v16, 2u, (uint64_t)v21);
  v16 = &v22;
  v17 = 64;
  v18 = v21;
  v19 = 32;
  hash_sha256((uint64_t)&v16, 2u, (uint64_t)__src);
  memcpy(a5, __src, v6);
  return v6;
}

uint64_t mhash_sha256(uint64_t a1, unsigned int a2, uint64_t a3)
{
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = a2;
  return hash_sha256((uint64_t)v4, 1u, a3);
}

uint64_t sub_10000DAB8(unsigned int *a1, const char *a2)
{
  unsigned int v2;
  uint16x8_t v5;
  uint16x8_t v6;
  int32x4_t v7;
  int8x16_t v8;
  int8x16_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  int8x16_t v16;
  uint16x8_t v17;
  _OWORD v19[4];
  int8x16x4_t v20;

  v2 = a1[8];
  a1[8] = v2 + 1;
  if (v2 == -1)
    ++a1[9];
  v20 = vld4q_s8(a2);
  _Q4 = (int8x16_t)vmovl_high_u8((uint8x16_t)v20.val[0]);
  _Q5 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v20.val[0].i8);
  v5 = vmovl_high_u8((uint8x16_t)v20.val[1]);
  v6 = vmovl_u8(*(uint8x8_t *)v20.val[1].i8);
  v7 = (int32x4_t)vmovl_high_u16(v6);
  v8 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q5.i8, 0x10uLL);
  __asm { SHLL2           V5.4S, V5.8H, #0x10 }
  v13 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q4.i8, 0x10uLL);
  __asm { SHLL2           V4.4S, V4.8H, #0x10 }
  v14 = vmovl_high_u8((uint8x16_t)v20.val[2]);
  v15 = vmovl_u8(*(uint8x8_t *)v20.val[2].i8);
  v16 = (int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v6.i8), 8uLL), vorrq_s8(v8, (int8x16_t)vmovl_u16(*(uint16x4_t *)v15.i8))), 8uLL);
  v17 = vmovl_high_u8((uint8x16_t)v20.val[3]);
  v20.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v20.val[3].i8);
  v19[3] = vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v5), 8uLL), vorrq_s8(_Q4, (int8x16_t)vmovl_high_u16(v14))), 8uLL), (int8x16_t)vmovl_high_u16(v17));
  v19[2] = vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v5.i8), 8uLL), vorrq_s8(v13, (int8x16_t)vmovl_u16(*(uint16x4_t *)v14.i8))), 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v17.i8));
  v19[1] = vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v7, 8uLL), vorrq_s8(_Q5, (int8x16_t)vmovl_high_u16(v15))), 8uLL), (int8x16_t)vmovl_high_u16((uint16x8_t)v20.val[0]));
  v19[0] = vorrq_s8(v16, (int8x16_t)vmovl_u16(*(uint16x4_t *)v20.val[0].i8));
  return sub_10000DBE4(a1, (unsigned int *)v19);
}

uint64_t sub_10000DBE4(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  unint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  unint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  unint64_t v36;
  int v37;
  int v38;
  int v39;
  unint64_t v40;
  int v41;
  int v42;
  unint64_t v43;
  int v44;
  int v45;
  int v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  _DWORD *v66;
  unint64_t v67;
  int v68;
  int v69;
  unint64_t v70;
  int v71;
  unint64_t v72;
  int v73;
  int v74;
  unint64_t v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  unint64_t v82;
  int v83;
  unint64_t v84;
  int v85;
  int v86;
  unint64_t v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  int v93;
  unint64_t v94;
  int v95;
  unint64_t v96;
  int v97;
  int v98;
  unint64_t v99;
  int v100;
  int v101;
  int v102;
  int v103;
  unsigned int v104;
  int v105;
  int v106;
  unint64_t v107;
  int v108;
  unint64_t v109;
  int v110;
  int v111;
  unint64_t v112;
  int v113;
  int v114;
  int v115;
  unsigned int v116;
  int v117;
  int v118;
  unint64_t v119;
  int v120;
  unint64_t v121;
  int v122;
  int v123;
  unint64_t v124;
  int v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  int v129;
  int v130;
  unint64_t v131;
  int v132;
  unint64_t v133;
  int v134;
  int v135;
  unint64_t v136;
  int v137;
  int v138;
  int v139;
  unsigned int v140;
  int v141;
  int v142;
  unint64_t v143;
  int v144;
  unint64_t v145;
  int v146;
  int v147;
  unint64_t v148;
  int v149;
  int v150;
  int v151;
  unsigned int v152;
  int v153;
  int v154;
  unint64_t v155;
  int v156;
  unint64_t v157;
  int v158;
  int v159;
  unint64_t v160;
  int v161;
  int v162;
  int v163;
  unsigned int v164;
  int v165;
  int v166;
  unint64_t v167;
  int v168;
  unint64_t v169;
  int v170;
  int v171;
  unint64_t v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  unsigned int v178;
  int v179;
  unint64_t v180;
  int v181;
  int v182;
  unint64_t v183;
  int v184;
  int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  int v189;
  unint64_t v190;
  int v191;
  unint64_t v192;
  int v193;
  int v194;
  unint64_t v195;
  int v196;
  int v197;
  unsigned int v198;
  unsigned int v199;
  int v200;
  int v201;
  unint64_t v202;
  int v203;
  unint64_t v204;
  int v205;
  int v206;
  unint64_t v207;
  int v208;
  int v209;
  int v210;
  unsigned int v211;
  int v212;
  int v213;
  unint64_t v214;
  int v215;
  unint64_t v216;
  int v217;
  int v218;
  unint64_t v219;
  int v220;
  int v221;
  int v222;
  int v223;
  unint64_t v224;
  int v225;
  unint64_t v226;
  int v227;
  int v228;
  unint64_t v229;
  int v230;
  int v231;
  int v232;
  int v233;
  unint64_t v234;
  int v235;
  unint64_t v236;
  int v237;
  int v238;
  unint64_t v239;
  int v240;
  unint64_t v241;
  int v242;
  int v243;
  unint64_t v244;
  int v245;
  unint64_t v246;
  int v247;
  uint64_t result;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  unsigned int v252;
  uint64_t v254;

  v2 = 0;
  v4 = *a1;
  v3 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v8 = a1[4];
  v7 = a1[5];
  v9 = 1;
  v10 = a1[6];
  v11 = a1[7];
  do
  {
    HIDWORD(v12) = v8;
    LODWORD(v12) = v8;
    v13 = (v12 >> 6) ^ __ROR4__(v8, 11);
    v14 = __PAIR64__(v4, __ROR4__(v8, 25));
    v15 = (v7 & v8 | v10 & ~v8) + v11 + (v13 ^ v14) + *(_DWORD *)((char *)&unk_10001A008 + v2 * 4) + a2[v2];
    LODWORD(v14) = v4;
    v16 = ((v14 >> 2) ^ __ROR4__(v4, 13) ^ __ROR4__(v4, 22)) + ((v4 ^ v3) & v6 ^ v4 & v3);
    v17 = v15 + v5;
    HIDWORD(v14) = v15 + v5;
    LODWORD(v14) = v15 + v5;
    v18 = v16 + v15;
    v19 = (v14 >> 6) ^ __ROR4__(v15 + v5, 11);
    v20 = __PAIR64__(v18, __ROR4__(v17, 25));
    v21 = *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 4) + v10 + a2[v2 + 1] + (v8 & v17 | v7 & ~v17) + (v19 ^ v20);
    LODWORD(v20) = v18;
    v22 = v21 + v6;
    v23 = ((v20 >> 2) ^ __ROR4__(v18, 13) ^ __ROR4__(v18, 22)) + ((v18 ^ v4) & v3 ^ v18 & v4) + v21;
    HIDWORD(v20) = v22;
    LODWORD(v20) = v22;
    v24 = (v20 >> 6) ^ __ROR4__(v22, 11);
    v25 = __PAIR64__(v23, __ROR4__(v22, 25));
    v26 = *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 8) + v7 + a2[v2 + 2] + (v17 & v22 | v8 & ~v22) + (v24 ^ v25);
    LODWORD(v25) = v23;
    v27 = ((v25 >> 2) ^ __ROR4__(v23, 13) ^ __ROR4__(v23, 22)) + ((v23 ^ v18) & v4 ^ v23 & v18);
    v28 = v26 + v3;
    HIDWORD(v25) = v26 + v3;
    LODWORD(v25) = v26 + v3;
    v29 = v27 + v26;
    v30 = (v25 >> 6) ^ __ROR4__(v26 + v3, 11);
    v31 = __PAIR64__(v29, __ROR4__(v28, 25));
    v32 = *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 12) + v8 + a2[v2 + 3] + (v22 & v28 | v17 & ~v28) + (v30 ^ v31);
    LODWORD(v31) = v29;
    v33 = v32 + v4;
    v34 = ((v31 >> 2) ^ __ROR4__(v29, 13) ^ __ROR4__(v29, 22)) + ((v29 ^ v23) & v18 ^ v29 & v23) + v32;
    HIDWORD(v31) = v33;
    LODWORD(v31) = v33;
    v35 = (v31 >> 6) ^ __ROR4__(v33, 11);
    v36 = __PAIR64__(v34, __ROR4__(v33, 25));
    v37 = *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 16) + a2[v2 + 4] + v17 + (v28 & v33 | v22 & ~v33) + (v35 ^ v36);
    LODWORD(v36) = v34;
    LOBYTE(v17) = v9;
    v11 = v37 + v18;
    v5 = ((v36 >> 2) ^ __ROR4__(v34, 13) ^ __ROR4__(v34, 22)) + ((v34 ^ v29) & v23 ^ v34 & v29) + v37;
    HIDWORD(v36) = v37 + v18;
    LODWORD(v36) = v37 + v18;
    v38 = (v36 >> 6) ^ __ROR4__(v37 + v18, 11);
    v40 = __PAIR64__(v5, __ROR4__(v11, 25));
    v39 = v38 ^ v40;
    LODWORD(v40) = v5;
    v41 = v22 + *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 20) + a2[v2 + 5] + (v33 & v11 | v28 & ~v11) + v39;
    v10 = v41 + v23;
    v6 = ((v40 >> 2) ^ __ROR4__(v5, 13) ^ __ROR4__(v5, 22)) + ((v5 ^ v34) & v29 ^ v5 & v34) + v41;
    HIDWORD(v40) = v41 + v23;
    LODWORD(v40) = v41 + v23;
    v42 = (v40 >> 6) ^ __ROR4__(v41 + v23, 11);
    v43 = __PAIR64__(v6, __ROR4__(v10, 25));
    v44 = a2[v2 + 6] + *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 24) + v28 + (v11 & v10 | v33 & ~v10) + (v42 ^ v43);
    LODWORD(v43) = v6;
    v7 = v44 + v29;
    v3 = ((v43 >> 2) ^ __ROR4__(v6, 13) ^ __ROR4__(v6, 22)) + ((v6 ^ v5) & v34 ^ v6 & v5) + v44;
    HIDWORD(v43) = v44 + v29;
    LODWORD(v43) = v44 + v29;
    v45 = (v43 >> 6) ^ __ROR4__(v44 + v29, 11);
    v47 = __PAIR64__(v3, __ROR4__(v7, 25));
    v46 = v45 ^ v47;
    LODWORD(v47) = v3;
    v48 = a2[v2 + 7] + *(_DWORD *)((char *)&unk_10001A008 + v2 * 4 + 28) + v33 + (v10 & v7 | v11 & ~v7) + v46;
    v8 = v48 + v34;
    v4 = ((v47 >> 2) ^ __ROR4__(v3, 13) ^ __ROR4__(v3, 22)) + ((v3 ^ v6) & v5 ^ v3 & v6) + v48;
    v2 += 8;
    v9 = 0;
  }
  while ((v17 & 1) != 0);
  v49 = 0;
  v51 = *a2;
  v50 = a2[1];
  v52 = a2[14];
  v53 = a2[15];
  v54 = a2[10];
  v55 = a2[11];
  v56 = a2[2];
  v57 = a2[3];
  v58 = a2[12];
  v59 = a2[13];
  v60 = a2[4];
  v61 = a2[5];
  v62 = a2[6];
  v63 = a2[7];
  v65 = a2[8];
  v64 = a2[9];
  do
  {
    v254 = v49;
    v66 = (_DWORD *)((char *)&unk_10001A008 + 4 * v49);
    HIDWORD(v67) = v8;
    LODWORD(v67) = v8;
    v68 = (v67 >> 6) ^ __ROR4__(v8, 11);
    v70 = __PAIR64__(v52, __ROR4__(v8, 25));
    v69 = v68 ^ v70;
    LODWORD(v70) = v52;
    v71 = v70 >> 17;
    v72 = __PAIR64__(v50, __ROR4__(v52, 19));
    v73 = (v71 ^ v72 ^ (v52 >> 10)) + v64 + v51;
    LODWORD(v72) = v50;
    v74 = v72 >> 7;
    v75 = __PAIR64__(v4, __ROR4__(v50, 18));
    v51 = v73 + (v74 ^ v75 ^ (v50 >> 3));
    v76 = v66[16];
    *a2 = v51;
    v77 = (v7 & v8 | v10 & ~v8) + v11 + v69 + v76 + v51;
    LODWORD(v75) = v4;
    v78 = v77 + v5;
    v79 = ((v75 >> 2) ^ __ROR4__(v4, 13) ^ __ROR4__(v4, 22)) + ((v4 ^ v3) & v6 ^ v4 & v3) + v77;
    HIDWORD(v75) = v78;
    LODWORD(v75) = v78;
    v80 = (v75 >> 6) ^ __ROR4__(v78, 11);
    v82 = __PAIR64__(v53, __ROR4__(v78, 25));
    v81 = v80 ^ v82;
    LODWORD(v82) = v53;
    v83 = v82 >> 17;
    v84 = __PAIR64__(v56, __ROR4__(v53, 19));
    v85 = v54 + v50 + (v83 ^ v84 ^ (v53 >> 10));
    LODWORD(v84) = v56;
    v86 = v84 >> 7;
    v87 = __PAIR64__(v79, __ROR4__(v56, 18));
    v50 = v85 + (v86 ^ v87 ^ (v56 >> 3));
    v88 = v66[17];
    a2[1] = v50;
    v89 = v88 + v10 + (v8 & v78 | v7 & ~v78) + v50 + v81;
    LODWORD(v87) = v79;
    v90 = v89 + v6;
    v91 = ((v87 >> 2) ^ __ROR4__(v79, 13) ^ __ROR4__(v79, 22)) + ((v79 ^ v4) & v3 ^ v79 & v4) + v89;
    HIDWORD(v87) = v90;
    LODWORD(v87) = v90;
    v92 = (v87 >> 6) ^ __ROR4__(v90, 11);
    v94 = __PAIR64__(v57, __ROR4__(v90, 25));
    v93 = v92 ^ v94;
    LODWORD(v94) = v57;
    v95 = v94 >> 7;
    v96 = __PAIR64__(v51, __ROR4__(v57, 18));
    v97 = v56 + v55 + (v95 ^ v96 ^ (v57 >> 3));
    LODWORD(v96) = v51;
    v98 = v96 >> 17;
    v99 = __PAIR64__(v91, __ROR4__(v51, 19));
    v56 = (v98 ^ v99 ^ (v51 >> 10)) + v97;
    v100 = v66[18];
    a2[2] = v56;
    v101 = v100 + v7 + v56 + (v78 & v90 | v8 & ~v90) + v93;
    LODWORD(v99) = v91;
    v102 = ((v99 >> 2) ^ __ROR4__(v91, 13) ^ __ROR4__(v91, 22)) + ((v91 ^ v79) & v4 ^ v91 & v79);
    v103 = v101 + v3;
    HIDWORD(v99) = v101 + v3;
    LODWORD(v99) = v101 + v3;
    v104 = v102 + v101;
    v105 = (v99 >> 6) ^ __ROR4__(v101 + v3, 11);
    v107 = __PAIR64__(v60, __ROR4__(v103, 25));
    v106 = v105 ^ v107;
    LODWORD(v107) = v60;
    v108 = v107 >> 7;
    v109 = __PAIR64__(v50, __ROR4__(v60, 18));
    v110 = v58 + v57 + (v108 ^ v109 ^ (v60 >> 3));
    LODWORD(v109) = v50;
    v111 = v109 >> 17;
    v112 = __PAIR64__(v104, __ROR4__(v50, 19));
    v57 = v110 + (v111 ^ v112 ^ (v50 >> 10));
    v113 = v66[19];
    a2[3] = v57;
    LODWORD(v112) = v104;
    v114 = v113 + v8 + v57 + (v90 & v103 | v78 & ~v103) + v106;
    v115 = v114 + v4;
    v116 = ((v112 >> 2) ^ __ROR4__(v104, 13) ^ __ROR4__(v104, 22)) + ((v104 ^ v91) & v79 ^ v104 & v91) + v114;
    HIDWORD(v112) = v115;
    LODWORD(v112) = v115;
    v117 = v112 >> 6;
    v119 = __PAIR64__(v61, __ROR4__(v115, 11));
    v118 = v117 ^ v119;
    LODWORD(v119) = v61;
    v120 = v119 >> 7;
    v121 = __PAIR64__(v56, __ROR4__(v61, 18));
    v122 = v59 + v60 + (v120 ^ v121 ^ (v61 >> 3));
    LODWORD(v121) = v56;
    v123 = v121 >> 17;
    v124 = __PAIR64__(v116, __ROR4__(v56, 19));
    v60 = v122 + (v123 ^ v124 ^ (v56 >> 10));
    v125 = v66[20];
    a2[4] = v60;
    v126 = v125 + v78 + v60 + (v103 & v115 | v90 & ~v115) + (v118 ^ __ROR4__(v115, 25));
    LODWORD(v124) = v116;
    v127 = v126 + v79;
    v128 = ((v124 >> 2) ^ __ROR4__(v116, 13) ^ __ROR4__(v116, 22)) + ((v116 ^ v104) & v91 ^ v116 & v104) + v126;
    HIDWORD(v124) = v127;
    LODWORD(v124) = v127;
    v129 = (v124 >> 6) ^ __ROR4__(v127, 11);
    v131 = __PAIR64__(v62, __ROR4__(v127, 25));
    v130 = v129 ^ v131;
    LODWORD(v131) = v62;
    v132 = v131 >> 7;
    v133 = __PAIR64__(v57, __ROR4__(v62, 18));
    v134 = v61 + v52 + (v132 ^ v133 ^ (v62 >> 3));
    LODWORD(v133) = v57;
    v135 = v133 >> 17;
    v136 = __PAIR64__(v128, __ROR4__(v57, 19));
    v61 = v134 + (v135 ^ v136 ^ (v57 >> 10));
    v137 = v66[21];
    a2[5] = v61;
    v138 = v137 + v90 + v61 + (v115 & v127 | v103 & ~v127) + v130;
    LODWORD(v136) = v128;
    v139 = v138 + v91;
    v140 = ((v136 >> 2) ^ __ROR4__(v128, 13) ^ __ROR4__(v128, 22)) + ((v128 ^ v116) & v104 ^ v128 & v116) + v138;
    HIDWORD(v136) = v139;
    LODWORD(v136) = v139;
    v141 = (v136 >> 6) ^ __ROR4__(v139, 11);
    v143 = __PAIR64__(v63, __ROR4__(v139, 25));
    v142 = v141 ^ v143;
    LODWORD(v143) = v63;
    v144 = v143 >> 7;
    v145 = __PAIR64__(v60, __ROR4__(v63, 18));
    v146 = v62 + v53 + (v144 ^ v145 ^ (v63 >> 3));
    LODWORD(v145) = v60;
    v147 = v145 >> 17;
    v148 = __PAIR64__(v140, __ROR4__(v60, 19));
    v62 = v146 + (v147 ^ v148 ^ (v60 >> 10));
    v149 = v66[22];
    a2[6] = v62;
    v150 = v149 + v103 + v62 + (v127 & v139 | v115 & ~v139) + v142;
    LODWORD(v148) = v140;
    v151 = v150 + v104;
    v152 = ((v148 >> 2) ^ __ROR4__(v140, 13) ^ __ROR4__(v140, 22)) + ((v140 ^ v128) & v116 ^ v140 & v128) + v150;
    HIDWORD(v148) = v150 + v104;
    LODWORD(v148) = v150 + v104;
    v153 = (v148 >> 6) ^ __ROR4__(v150 + v104, 11);
    v155 = __PAIR64__(v65, __ROR4__(v151, 25));
    v154 = v153 ^ v155;
    LODWORD(v155) = v65;
    v156 = v155 >> 7;
    v157 = __PAIR64__(v61, __ROR4__(v65, 18));
    v158 = v63 + v51 + (v156 ^ v157 ^ (v65 >> 3));
    LODWORD(v157) = v61;
    v159 = v157 >> 17;
    v160 = __PAIR64__(v152, __ROR4__(v61, 19));
    v63 = v158 + (v159 ^ v160 ^ (v61 >> 10));
    v161 = v66[23];
    a2[7] = v63;
    v162 = v115 + v161 + v63 + (v139 & v151 | v127 & ~v151) + v154;
    LODWORD(v160) = v152;
    v163 = v162 + v116;
    v164 = ((v160 >> 2) ^ __ROR4__(v152, 13) ^ __ROR4__(v152, 22)) + ((v152 ^ v140) & v128 ^ v152 & v140) + v162;
    HIDWORD(v160) = v162 + v116;
    LODWORD(v160) = v162 + v116;
    v165 = (v160 >> 6) ^ __ROR4__(v162 + v116, 11);
    v167 = __PAIR64__(v64, __ROR4__(v163, 25));
    v166 = v165 ^ v167;
    LODWORD(v167) = v64;
    v168 = v167 >> 7;
    v169 = __PAIR64__(v62, __ROR4__(v64, 18));
    v170 = (v168 ^ v169 ^ (v64 >> 3)) + v65;
    LODWORD(v169) = v62;
    v171 = v169 >> 17;
    v172 = __PAIR64__(v164, __ROR4__(v62, 19));
    v65 = v50 + v170 + (v171 ^ v172 ^ (v62 >> 10));
    v173 = v66[24];
    a2[8] = v65;
    v174 = v65 + v173 + v127 + (v151 & v163 | v139 & ~v163) + v166;
    LODWORD(v172) = v164;
    v175 = ((v172 >> 2) ^ __ROR4__(v164, 13) ^ __ROR4__(v164, 22)) + ((v164 ^ v152) & v140 ^ v164 & v152);
    v176 = v174 + v128;
    HIDWORD(v172) = v174 + v128;
    LODWORD(v172) = v174 + v128;
    v177 = v172 >> 6;
    v178 = v175 + v174;
    HIDWORD(v172) = v54;
    LODWORD(v172) = v54;
    v179 = v172 >> 7;
    v180 = __PAIR64__(v63, __ROR4__(v54, 18));
    v181 = (v179 ^ v180 ^ (v54 >> 3)) + v64;
    LODWORD(v180) = v63;
    v182 = v180 >> 17;
    v183 = __PAIR64__(v178, __ROR4__(v63, 19));
    v64 = v181 + v56 + (v182 ^ v183 ^ (v63 >> 10));
    v184 = v66[25];
    a2[9] = v64;
    LODWORD(v183) = v178;
    v185 = v64 + v184 + v139 + (v163 & v176 | v151 & ~v176) + (v177 ^ __ROR4__(v176, 11) ^ __ROR4__(v176, 25));
    v186 = v185 + v140;
    v187 = ((v183 >> 2) ^ __ROR4__(v178, 13) ^ __ROR4__(v178, 22)) + ((v178 ^ v164) & v152 ^ v178 & v164) + v185;
    HIDWORD(v183) = v186;
    LODWORD(v183) = v186;
    v188 = v183 >> 6;
    v190 = __PAIR64__(v55, __ROR4__(v186, 11));
    v189 = v188 ^ v190;
    LODWORD(v190) = v55;
    v191 = v190 >> 7;
    v192 = __PAIR64__(v65, __ROR4__(v55, 18));
    v193 = (v191 ^ v192 ^ (v55 >> 3)) + v54;
    LODWORD(v192) = v65;
    v194 = v192 >> 17;
    v195 = __PAIR64__(v187, __ROR4__(v65, 19));
    v54 = v193 + v57 + (v194 ^ v195 ^ (v65 >> 10));
    v196 = v66[26];
    a2[10] = v54;
    v197 = v54 + v196 + v151 + (v176 & v186 | v163 & ~v186) + (v189 ^ __ROR4__(v186, 25));
    LODWORD(v195) = v187;
    v198 = v197 + v152;
    v199 = ((v195 >> 2) ^ __ROR4__(v187, 13) ^ __ROR4__(v187, 22)) + ((v187 ^ v178) & v164 ^ v187 & v178) + v197;
    HIDWORD(v195) = v198;
    LODWORD(v195) = v198;
    v200 = (v195 >> 6) ^ __ROR4__(v198, 11);
    v202 = __PAIR64__(v58, __ROR4__(v198, 25));
    v201 = v200 ^ v202;
    LODWORD(v202) = v58;
    v203 = v202 >> 7;
    v204 = __PAIR64__(v64, __ROR4__(v58, 18));
    v205 = (v203 ^ v204 ^ (v58 >> 3)) + v55;
    LODWORD(v204) = v64;
    v206 = v204 >> 17;
    v207 = __PAIR64__(v199, __ROR4__(v64, 19));
    v55 = v205 + v60 + (v206 ^ v207 ^ (v64 >> 10));
    v208 = v66[27];
    a2[11] = v55;
    v209 = v55 + v208 + v163 + (v186 & v198 | v176 & ~v198) + v201;
    LODWORD(v207) = v199;
    v210 = v209 + v164;
    v211 = ((v207 >> 2) ^ __ROR4__(v199, 13) ^ __ROR4__(v199, 22)) + ((v199 ^ v187) & v178 ^ v199 & v187) + v209;
    HIDWORD(v207) = v209 + v164;
    LODWORD(v207) = v209 + v164;
    v212 = (v207 >> 6) ^ __ROR4__(v209 + v164, 11);
    v214 = __PAIR64__(v59, __ROR4__(v210, 25));
    v213 = v212 ^ v214;
    LODWORD(v214) = v59;
    v215 = v214 >> 7;
    v216 = __PAIR64__(v54, __ROR4__(v59, 18));
    v217 = (v215 ^ v216 ^ (v59 >> 3)) + v58;
    LODWORD(v216) = v54;
    v218 = v216 >> 17;
    v219 = __PAIR64__(v211, __ROR4__(v54, 19));
    v58 = v217 + v61 + (v218 ^ v219 ^ (v54 >> 10));
    v220 = v66[28];
    a2[12] = v58;
    v221 = v58 + v220 + v176 + (v198 & v210 | v186 & ~v210) + v213;
    LODWORD(v219) = v211;
    v11 = v221 + v178;
    v5 = ((v219 >> 2) ^ __ROR4__(v211, 13) ^ __ROR4__(v211, 22)) + ((v211 ^ v199) & v187 ^ v211 & v199) + v221;
    HIDWORD(v219) = v11;
    LODWORD(v219) = v11;
    v222 = (v219 >> 6) ^ __ROR4__(v11, 11);
    v224 = __PAIR64__(v52, __ROR4__(v11, 25));
    v223 = v222 ^ v224;
    LODWORD(v224) = v52;
    v225 = v224 >> 7;
    v226 = __PAIR64__(v55, __ROR4__(v52, 18));
    v227 = v59 + (v225 ^ v226 ^ (v52 >> 3));
    LODWORD(v226) = v55;
    v228 = v226 >> 17;
    v229 = __PAIR64__(v5, __ROR4__(v55, 19));
    v59 = v227 + v62 + (v228 ^ v229 ^ (v55 >> 10));
    v230 = v59 + v66[29] + v186 + (v210 & v11 | v198 & ~v11) + v223;
    LODWORD(v229) = v5;
    v231 = ((v229 >> 2) ^ __ROR4__(v5, 13) ^ __ROR4__(v5, 22)) + ((v5 ^ v211) & v199 ^ v5 & v211);
    v10 = v230 + v187;
    HIDWORD(v229) = v230 + v187;
    LODWORD(v229) = v230 + v187;
    v232 = v229 >> 6;
    v6 = v231 + v230;
    HIDWORD(v229) = v53;
    LODWORD(v229) = v53;
    v233 = v229 >> 7;
    a2[13] = v59;
    v234 = __PAIR64__(v58, __ROR4__(v53, 18));
    v235 = (v233 ^ v234 ^ (v53 >> 3)) + v52;
    LODWORD(v234) = v58;
    v52 = v235 + v63 + ((v234 >> 17) ^ __ROR4__(v58, 19) ^ (v58 >> 10));
    v236 = __PAIR64__(v6, __ROR4__(v10, 25));
    v237 = v52 + v66[30] + v198 + (v11 & v10 | v210 & ~v10) + (v232 ^ __ROR4__(v10, 11) ^ v236);
    LODWORD(v236) = v6;
    v238 = (v236 >> 2) ^ __ROR4__(v6, 13);
    v239 = __PAIR64__(v51, __ROR4__(v6, 22));
    v7 = v237 + v199;
    v3 = (v238 ^ v239) + ((v6 ^ v5) & v211 ^ v6 & v5) + v237;
    LODWORD(v239) = v51;
    v240 = v239 >> 7;
    v241 = __PAIR64__(v59, __ROR4__(v51, 18));
    v242 = (v240 ^ v241 ^ (v51 >> 3)) + v53;
    LODWORD(v241) = v59;
    v243 = v241 >> 17;
    v244 = __PAIR64__(v7, __ROR4__(v59, 19));
    v53 = v242 + v65 + (v243 ^ v244 ^ (v59 >> 10));
    a2[14] = v52;
    LODWORD(v244) = v7;
    v245 = (v244 >> 6) ^ __ROR4__(v7, 11);
    v246 = __PAIR64__(v3, __ROR4__(v7, 25));
    v247 = v53 + v66[31] + v210 + (v10 & v7 | v11 & ~v7) + (v245 ^ v246);
    LODWORD(v246) = v3;
    result = (v246 >> 2) ^ __ROR4__(v3, 13) ^ __ROR4__(v3, 22);
    v8 = v247 + v211;
    v4 = result + ((v3 ^ v6) & v5 ^ v3 & v6) + v247;
    a2[15] = v53;
    v49 = v254 + 16;
  }
  while ((v254 + 16) < 0x30);
  v249 = a1[1] + v3;
  *a1 += v4;
  a1[1] = v249;
  v250 = a1[3] + v5;
  a1[2] += v6;
  a1[3] = v250;
  v251 = a1[5] + v7;
  a1[4] += v8;
  a1[5] = v251;
  v252 = a1[7] + v11;
  a1[6] += v10;
  a1[7] = v252;
  return result;
}

void wlan_deauth_for_otherc()
{
  uint64_t v0;

  v0 = *(_QWORD *)(qword_100021B40 + 8608);
  sub_10000E774();
  sub_10000E7C0();
  *(_DWORD *)(v0 + 8) = 0;
}

uint64_t sub_10000E774()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t result;

  v0 = qword_100021B40;
  **(_BYTE **)(qword_100021B40 + 40) = 1;
  v2 = *(_DWORD *)(v0 + 8);
  v1 = v0 + 8;
  *(_DWORD *)(v1 + 60) = 0;
  if (v2 | *(unsigned __int16 *)(v1 + 4))
  {
    result = sub_100006814();
    *(_WORD *)(v1 + 4) = 0;
    *(_DWORD *)v1 = 0;
  }
  return result;
}

void sub_10000E7C0()
{
  uint64_t v0;

  v0 = qword_100021B40;
  if (**(_QWORD **)(qword_100021B40 + 8608))
  {
    sub_100006B38();
    **(_QWORD **)(v0 + 8608) = 0;
    *(_DWORD *)(*(_QWORD *)(qword_100021B40 + 8608) + 8) = 0;
  }
}

void *timer_set(int a1, const void *a2, int a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(qword_100021B40 + 8608);
  v3[4] = 0;
  v3[5] = a3;
  v3[2] = a1;
  v3[3] = 0;
  return memcpy(v3 + 6, a2, a3);
}

void timer_reset()
{
  *(_DWORD *)(*(_QWORD *)(qword_100021B40 + 8608) + 8) = 0;
}

void timer_resend()
{
  uint64_t v0;
  int v1;

  v0 = *(_QWORD *)(qword_100021B40 + 8608);
  if ((*(_DWORD *)(v0 + 8) - 1) <= 1)
  {
    v1 = *(_DWORD *)(v0 + 16);
    *(_DWORD *)(v0 + 16) = v1 + 1;
    if (v1 < 2)
    {
      sub_100006828((u_char *)(v0 + 24), *(_DWORD *)(v0 + 20));
      *(_DWORD *)(v0 + 12) = 0;
    }
    else
    {
      sub_10000E774();
      sub_10000E7C0();
      *(_DWORD *)(v0 + 8) = 0;
    }
  }
}

uint64_t iwn_wpa_ether_send(u_char *a1, unsigned int a2)
{
  return sub_100006828(a1, a2);
}

void *iwn_get_buffer(int a1)
{
  size_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = malloc_type_malloc(a1, 0x822D3D61uLL);
  v3 = v2;
  if (v2)
    bzero(v2, v1);
  return v3;
}

uint64_t iwn_free_buffer(void *a1, int a2)
{
  if (a1)
  {
    bzero(a1, a2);
    free(a1);
  }
  return 0;
}

_BYTE *iwn_getshort(_BYTE *result, _BYTE *a2)
{
  if (byte_100021B48 == 1)
  {
    *a2 = result[1];
    a2[1] = *result;
  }
  else
  {
    *(_WORD *)a2 = *(_WORD *)result;
  }
  return result;
}

_WORD *iwn_setshort(_WORD *result, unsigned int a2)
{
  *result = __rev16(a2);
  return result;
}

uint64_t lib_get_wapi_state()
{
  uint64_t result;
  int v1;

  if (!qword_100021B40)
    return 0;
  result = *(unsigned int *)(qword_100021B40 + 68);
  if (!*(_DWORD *)(qword_100021B40 + 72))
    return result;
  v1 = *(_DWORD *)(qword_100021B40 + 17808);
  if (v1 == 2)
  {
    if ((result - 1) < 4)
      return 9;
  }
  else
  {
    if (v1 != 1)
      return result;
    if ((result - 1) < 4)
      return 8;
  }
  if ((_DWORD)result == 5)
    return 7;
  else
    return result;
}

uint64_t WAI_CNTAPPARA_SET(_DWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  char v5;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unsigned int v10;
  __int128 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v1 = 0xFFFFFFFFLL;
  if (a1 && byte_100021B4C)
  {
    v3 = qword_100021B40;
    v4 = *a1;
    *(_DWORD *)(qword_100021B40 + 17808) = *a1;
    if (!v4)
      return 0;
    v18 = xmmword_10001A110;
    v19 = unk_10001A120;
    v20 = xmmword_10001A130;
    v21 = unk_10001A140;
    if (v4 == 2)
      BYTE9(v18) = 2;
    sub_100006B6C(&v18, 24);
    v5 = BYTE1(v18);
    memcpy((void *)(*(_QWORD *)(v3 + 40) + 460), &v18, BYTE1(v18) + 2);
    *(_BYTE *)(*(_QWORD *)(v3 + 40) + 973) = v5 + 2;
    if (*a1 == 2)
    {
      if (a1[1])
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = a1[2];
        if ((v7 & 1) != 0)
          return 0xFFFFFFFFLL;
        if ((int)v7 <= 1)
        {
          v10 = v7 >> 1;
        }
        else
        {
          v8 = (char *)(a1 + 3);
          v9 = v7 >> 1;
          v10 = v9;
          v11 = &v18;
          do
          {
            v12 = *v8;
            v13 = v12 - 48;
            if ((v12 - 48) > 9)
            {
              if ((v12 - 97) > 5)
              {
                if ((v12 - 65) > 5)
                  break;
                v13 = v12 - 55;
              }
              else
              {
                v13 = v12 - 87;
              }
            }
            if (v13 < 0)
              break;
            v14 = v8[1];
            v15 = v14 - 48;
            if ((v14 - 48) > 9)
            {
              if ((v14 - 97) > 5)
              {
                if ((v14 - 65) > 5)
                  break;
                v15 = v14 - 55;
              }
              else
              {
                v15 = v14 - 87;
              }
            }
            if (v15 < 0)
              break;
            *(_BYTE *)v11 = v15 + 16 * v13;
            v11 = (__int128 *)((char *)v11 + 1);
            v8 += 2;
            --v9;
          }
          while (v9);
        }
        v17 = (char *)(v3 + 17812);
        v16 = &v18;
      }
      else
      {
        v16 = (__int128 *)(a1 + 3);
        v10 = a1[2];
        v17 = (char *)(v3 + 17812);
      }
      v1 = sub_10000EBF4(v16, v10, v17);
      iwn_wpa_hexdump(2, "WAI: ", v3 + 17812, 16);
      return v1;
    }
    if (*a1 == 1)
      return init_cert((uint64_t)a1);
    else
      return 0;
  }
  return v1;
}

uint64_t sub_10000EBF4(__int128 *a1, unsigned int a2, char *a3)
{
  uint64_t result;
  int v7;
  char v8[72];

  strcpy(v8, "preshared key expansion for authentication and key negotiation");
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    if (a3)
    {
      v7 = strlen(v8);
      KD_hmac_sha256(v8, v7, a1, a2, a3, 16);
      return 0;
    }
  }
  return result;
}

double WAI_Msg_Input(int a1, int *a2, int *a3, void *__src, size_t __n)
{
  unsigned int v5;
  uint64_t v7;
  int v8;
  int *v9;
  int v10;
  int v12;
  int v13;
  __int16 v14;
  _OWORD *v15;
  uint64_t v16;
  double result;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char v22[20];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;

  if (a3)
  {
    if (a2)
    {
      if (byte_100021B4C)
      {
        v5 = __n;
        v7 = qword_100021B40;
        if ((!__src || (_DWORD)__n) && (__src || !(_DWORD)__n))
        {
          if (a1 == 1)
          {
            *(_DWORD *)(qword_100021B40 + 68) = 0;
            *(_DWORD *)(v7 + 72) = 0;
            sub_10000E7C0();
            *(_WORD *)(v7 + 4) = 0;
            *(_DWORD *)v7 = 0;
            *(_DWORD *)(v7 + 8) = 0;
            *(_WORD *)(v7 + 12) = 0;
            *(_DWORD *)(v7 + 76) = 0;
            *(_WORD *)(v7 + 80) = 0;
            *(_OWORD *)(v7 + 84) = 0u;
            *(_OWORD *)(v7 + 100) = 0u;
            *(_OWORD *)(v7 + 116) = 0u;
            *(_OWORD *)(v7 + 132) = 0u;
            *(_OWORD *)(v7 + 148) = 0u;
            *(_OWORD *)(v7 + 164) = 0u;
            bzero((void *)(v7 + 2232), 0x804uLL);
            *(_OWORD *)(v7 + 7546) = 0u;
            *(_OWORD *)(v7 + 7536) = 0u;
            *(_OWORD *)(v7 + 7520) = 0u;
            *(_OWORD *)(v7 + 7504) = 0u;
            *(_OWORD *)(v7 + 7488) = 0u;
            *(_OWORD *)(v7 + 7472) = 0u;
            *(_OWORD *)(v7 + 7456) = 0u;
            *(_OWORD *)(v7 + 7440) = 0u;
            *(_OWORD *)(v7 + 7424) = 0u;
            *(_OWORD *)(v7 + 7408) = 0u;
            *(_OWORD *)(v7 + 7392) = 0u;
            *(_OWORD *)(v7 + 7376) = 0u;
            *(_OWORD *)(v7 + 7360) = 0u;
            *(_OWORD *)(v7 + 7344) = 0u;
            *(_OWORD *)(v7 + 7328) = 0u;
            *(_OWORD *)(v7 + 7312) = 0u;
            *(_DWORD *)(v7 + 8078) = 0;
            *(_OWORD *)(v7 + 8046) = 0u;
            *(_OWORD *)(v7 + 8062) = 0u;
            *(_OWORD *)(v7 + 8014) = 0u;
            *(_OWORD *)(v7 + 8030) = 0u;
            *(_OWORD *)(v7 + 7982) = 0u;
            *(_OWORD *)(v7 + 7998) = 0u;
            *(_OWORD *)(v7 + 7950) = 0u;
            *(_OWORD *)(v7 + 7966) = 0u;
            *(_OWORD *)(v7 + 7918) = 0u;
            *(_OWORD *)(v7 + 7934) = 0u;
            *(_OWORD *)(v7 + 7886) = 0u;
            *(_OWORD *)(v7 + 7902) = 0u;
            *(_OWORD *)(v7 + 7854) = 0u;
            *(_OWORD *)(v7 + 7870) = 0u;
            *(_OWORD *)(v7 + 7822) = 0u;
            *(_OWORD *)(v7 + 7838) = 0u;
            *(_DWORD *)(v7 + 8338) = 0;
            *(_OWORD *)(v7 + 8306) = 0u;
            *(_OWORD *)(v7 + 8322) = 0u;
            *(_OWORD *)(v7 + 8274) = 0u;
            *(_OWORD *)(v7 + 8290) = 0u;
            *(_OWORD *)(v7 + 8242) = 0u;
            *(_OWORD *)(v7 + 8258) = 0u;
            *(_OWORD *)(v7 + 8210) = 0u;
            *(_OWORD *)(v7 + 8226) = 0u;
            *(_OWORD *)(v7 + 8178) = 0u;
            *(_OWORD *)(v7 + 8194) = 0u;
            *(_OWORD *)(v7 + 8146) = 0u;
            *(_OWORD *)(v7 + 8162) = 0u;
            *(_OWORD *)(v7 + 8114) = 0u;
            *(_OWORD *)(v7 + 8130) = 0u;
            *(_OWORD *)(v7 + 8082) = 0u;
            *(_OWORD *)(v7 + 8098) = 0u;
            *(_QWORD *)(v7 + 8596) = 0;
            *(_OWORD *)(v7 + 8566) = 0u;
            *(_OWORD *)(v7 + 8582) = 0u;
            *(_OWORD *)(v7 + 8534) = 0u;
            *(_OWORD *)(v7 + 8550) = 0u;
            *(_OWORD *)(v7 + 8502) = 0u;
            *(_OWORD *)(v7 + 8518) = 0u;
            *(_OWORD *)(v7 + 8470) = 0u;
            *(_OWORD *)(v7 + 8486) = 0u;
            *(_OWORD *)(v7 + 8438) = 0u;
            *(_OWORD *)(v7 + 8454) = 0u;
            *(_OWORD *)(v7 + 8406) = 0u;
            *(_OWORD *)(v7 + 8422) = 0u;
            *(_OWORD *)(v7 + 8374) = 0u;
            *(_OWORD *)(v7 + 8390) = 0u;
            *(_OWORD *)(v7 + 8342) = 0u;
            *(_OWORD *)(v7 + 8358) = 0u;
            *(_OWORD *)(v7 + 7296) = 0u;
            bzero((void *)(v7 + 4284), 0x3ECuLL);
            bzero((void *)(v7 + 5288), 0x3ECuLL);
            v18 = *(_OWORD **)(v7 + 40);
            result = 0.0;
            v18[15] = 0u;
            v18[16] = 0u;
            v18[13] = 0u;
            v18[14] = 0u;
            v18[11] = 0u;
            v18[12] = 0u;
            v18[9] = 0u;
            v18[10] = 0u;
            v18[7] = 0u;
            v18[8] = 0u;
            v18[5] = 0u;
            v18[6] = 0u;
            v18[3] = 0u;
            v18[4] = 0u;
            v18[1] = 0u;
            v18[2] = 0u;
            *v18 = 0u;
            v19 = *(_OWORD **)(v7 + 40);
            v19[19] = 0u;
            v19[20] = 0u;
            v19[17] = 0u;
            v19[18] = 0u;
            v20 = *(_QWORD *)(v7 + 40);
            *(_QWORD *)(v20 + 416) = 0;
            *(_OWORD *)(v20 + 384) = 0u;
            *(_OWORD *)(v20 + 400) = 0u;
            *(_OWORD *)(v20 + 352) = 0u;
            *(_OWORD *)(v20 + 368) = 0u;
            *(_OWORD *)(v20 + 336) = 0u;
            v21 = *(_QWORD *)(v7 + 40);
            *(_BYTE *)v21 = 1;
            *(_BYTE *)(v21 + 273) = 1;
            *(_QWORD *)(v21 + 400) = 16;
            v21 += 716;
            *(_OWORD *)v21 = 0u;
            *(_OWORD *)(v21 + 16) = 0u;
            *(_OWORD *)(v21 + 32) = 0u;
            *(_OWORD *)(v21 + 48) = 0u;
            *(_OWORD *)(v21 + 64) = 0u;
            *(_OWORD *)(v21 + 80) = 0u;
            *(_OWORD *)(v21 + 96) = 0u;
            *(_OWORD *)(v21 + 112) = 0u;
            *(_OWORD *)(v21 + 128) = 0u;
            *(_OWORD *)(v21 + 144) = 0u;
            *(_OWORD *)(v21 + 160) = 0u;
            *(_OWORD *)(v21 + 176) = 0u;
            *(_OWORD *)(v21 + 192) = 0u;
            *(_OWORD *)(v21 + 208) = 0u;
            *(_OWORD *)(v21 + 224) = 0u;
            *(_OWORD *)(v21 + 240) = 0u;
            *(_BYTE *)(*(_QWORD *)(v7 + 40) + 972) = 0;
          }
          else if (!a1)
          {
            v8 = *a3;
            *(_WORD *)(qword_100021B40 + 4) = *((_WORD *)a3 + 2);
            *(_DWORD *)v7 = v8;
            v9 = (int *)(v7 + 8);
            v10 = *(_DWORD *)(v7 + 8);
            *(_QWORD *)(v7 + 68) = 1;
            if (v10 != *a2 || *(unsigned __int16 *)(v7 + 12) != *((unsigned __int16 *)a2 + 2))
            {
              v12 = *a2;
              *(_WORD *)(v7 + 12) = *((_WORD *)a2 + 2);
              *v9 = v12;
              *(_OWORD *)(*(_QWORD *)(v7 + 40) + 308) = *(_OWORD *)"\\6\\6\\6\\6\\6\\6\\6\\5";
              v13 = *(_DWORD *)(v7 + 17808);
              if (v13 == 2)
              {
                *(_OWORD *)v22 = 0uLL;
                v23 = *v9;
                v24 = *(_WORD *)(v7 + 12);
                v14 = *(_WORD *)(v7 + 4);
                v25 = *(_DWORD *)v7;
                v26 = v14;
                KD_hmac_sha256(&v23, 12, (__int128 *)(v7 + 17812), 0x10u, v22, 16);
                *(_OWORD *)(*(_QWORD *)(v7 + 40) + 352) = *(_OWORD *)(v7 + 17812);
                *(_OWORD *)(*(_QWORD *)(v7 + 40) + 336) = *(_OWORD *)v22;
                v13 = *(_DWORD *)(v7 + 17808);
              }
              if (v13)
              {
                v15 = (_OWORD *)(*(_QWORD *)(v7 + 40) + 716);
                v15[14] = 0u;
                v15[15] = 0u;
                v15[12] = 0u;
                v15[13] = 0u;
                v15[10] = 0u;
                v15[11] = 0u;
                v15[8] = 0u;
                v15[9] = 0u;
                v15[6] = 0u;
                v15[7] = 0u;
                v15[4] = 0u;
                v15[5] = 0u;
                v15[2] = 0u;
                v15[3] = 0u;
                *v15 = 0u;
                v15[1] = 0u;
                memcpy((void *)(*(_QWORD *)(v7 + 40) + 716), __src, v5);
                *(_BYTE *)(*(_QWORD *)(v7 + 40) + 972) = v5;
              }
            }
            *(_DWORD *)(v7 + 64) = 0x10000;
            v16 = qword_100021B40;
            **(_QWORD **)(v16 + 8608) = sub_100006A24(0x1F4u, 0x1F4u, (void (__cdecl *)(CFRunLoopTimerRef, void *))sub_10000F1B8);
            *(_DWORD *)(*(_QWORD *)(qword_100021B40 + 8608) + 8) = 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t WAI_RX_packets_indication(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  int *v3;
  _QWORD v5[2];

  v2 = qword_100021B40;
  if ((*(_DWORD *)(qword_100021B40 + 17808) - 3) >= 0xFFFFFFFE)
  {
    v5[0] = a1;
    v5[1] = a2;
    v3 = iwn_wpa_defrag(qword_100021B40, (int *)v5);
    if (v3)
      iwn_wapi_sm_rx_wai(v2, v2 + 8, *(unsigned __int16 **)v3, v3[2]);
  }
  return 0;
}

uint64_t WIFI_lib_init()
{
  char *buffer;
  _QWORD *v1;
  _BYTE *v2;
  uint64_t result;

  if ((byte_100021B4C & 1) != 0)
    return 0xFFFFFFFFLL;
  byte_100021B48 = 1;
  buffer = (char *)iwn_get_buffer(17832);
  qword_100021B40 = (uint64_t)buffer;
  if (!buffer)
    return 0xFFFFFFFFLL;
  v1 = buffer;
  v2 = buffer + 8616;
  ECC_Init();
  v1[1076] = v1 + 1199;
  v1[5] = v2;
  *v2 = 1;
  v2[273] = 1;
  v1[1127] = 16;
  X509_init();
  result = 0;
  byte_100021B4C = 1;
  return result;
}

uint64_t WIFI_lib_exit()
{
  sub_10000E7C0();
  cleanup_cert();
  X509_exit();
  iwn_free_buffer((void *)qword_100021B40, 17832);
  qword_100021B40 = 0;
  byte_100021B4C = 0;
  return 0;
}

void sub_10000F1B8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;

  v0 = *(_QWORD *)(qword_100021B40 + 8608);
  v1 = *(unsigned int *)(v0 + 8);
  if ((v1 - 4) >= 0xFFFFFFFD)
  {
    v2 = *(_DWORD *)(v0 + 12) + 1;
    *(_DWORD *)(v0 + 12) = v2;
    if (v2 >= 4 * *(_DWORD *)&a66666665[4 * v1 + 16])
    {
      v3 = *(_DWORD *)(v0 + 16);
      *(_DWORD *)(v0 + 16) = v3 + 1;
      if (v3 < 2)
      {
        sub_100006828((u_char *)(v0 + 24), *(_DWORD *)(v0 + 20));
        *(_DWORD *)(v0 + 12) = 0;
      }
      else
      {
        if (v1 <= 2)
          sub_10000E774();
        sub_10000E7C0();
        *(_DWORD *)(v0 + 8) = 0;
      }
    }
  }
}

int *iwn_wpa_defrag(uint64_t a1, int *a2)
{
  uint64_t v3;
  size_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int *v8;
  unsigned int v9;
  _DWORD *v10;
  int *v11;
  int *buffer;
  int *v13;
  void *v14;
  int v15;
  uint64_t v16;
  size_t v17;
  int v18;

  v3 = *(_QWORD *)a2;
  v4 = a2[2];
  v5 = *(unsigned __int8 *)(*(_QWORD *)a2 + 11);
  v6 = *(unsigned __int8 *)(*(_QWORD *)a2 + 10);
  v7 = *(_QWORD *)(a1 + 56);
  if (v5 | v6)
  {
    if (!v7)
    {
      v11 = 0;
LABEL_12:
      if (!v6)
      {
        buffer = (int *)iwn_get_buffer(16);
        if (!buffer)
        {
          *(_QWORD *)(a1 + 56) = 0;
          if (v5)
            return 0;
          return *(int **)(a1 + 56);
        }
        v13 = buffer;
        buffer[3] = 4096;
        v14 = iwn_get_buffer(4096);
        *(_QWORD *)v13 = v14;
        if (!v14)
          v13 = (int *)iwn_free_buffer(v13, 16);
        *(_QWORD *)(a1 + 56) = v13;
        if (v5 && v13)
        {
          memcpy((void *)(*(_QWORD *)v13 + v13[2]), (const void *)v3, v4);
          v15 = v13[2] + v4;
          v13[2] = v15;
          *(_BYTE *)(*(_QWORD *)v13 + 6) = BYTE1(v15);
          *(_BYTE *)(*(_QWORD *)v13 + 7) = v15;
          iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 133);
          return 0;
        }
LABEL_21:
        if (v5)
          return 0;
        return *(int **)(a1 + 56);
      }
LABEL_19:
      if (v11)
      {
        v16 = *(_QWORD *)v11;
        v17 = v4 - 12;
        memcpy((void *)(*(_QWORD *)v11 + v11[2]), (const void *)(v3 + 12), v17);
        v18 = v11[2] + v17;
        v11[2] = v18;
        *(_BYTE *)(*(_QWORD *)v11 + 6) = BYTE1(v18);
        *(_BYTE *)(*(_QWORD *)v11 + 7) = v18;
        *(_WORD *)(v16 + 8) = *(_WORD *)(v3 + 8);
        *(_BYTE *)(v16 + 10) = *(_BYTE *)(v3 + 10);
      }
      goto LABEL_21;
    }
LABEL_5:
    v9 = __rev16(*(unsigned __int16 *)(*(_QWORD *)a2 + 8));
    iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 107);
    v10 = *(_DWORD **)(a1 + 56);
    if (v9 != bswap32(*(unsigned __int16 *)(*(_QWORD *)v10 + 8)) >> 16
      || *(unsigned __int8 *)(*(_QWORD *)v10 + 10) + 1 != v6
      || v10[3] - v10[2] < (int)v4)
    {
      sub_10000F474((uint64_t)v10);
      *(_QWORD *)(a1 + 56) = 0;
    }
    iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 124);
    v11 = *(int **)(a1 + 56);
    if (v11)
      goto LABEL_19;
    goto LABEL_12;
  }
  if (v7)
    goto LABEL_5;
  v8 = a2;
  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 91);
  return v8;
}

uint64_t sub_10000F474(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    iwn_free_buffer(*(void **)result, *(_DWORD *)(result + 12));
    return iwn_free_buffer(v1, 16);
  }
  return result;
}

uint64_t iwn_wai_fixdata_id_by_ident(uint64_t a1, _WORD *a2, unsigned int a3)
{
  uint64_t result;
  _WORD *v6;
  _QWORD *cert_obj;
  uint64_t (**v8)(_QWORD);
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  char *v12;
  char *v13;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    *a2 = a3;
    v6 = a2 + 2;
    cert_obj = (_QWORD *)get_cert_obj(a3);
    if (cert_obj
      && (v8 = (uint64_t (**)(_QWORD))cert_obj, cert_obj[8])
      && cert_obj[9]
      && cert_obj[10]
      && cert_obj[11]
      && cert_obj[12]
      && cert_obj[13]
      && cert_obj[14])
    {
      iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 344);
      v9 = (unsigned __int8 *)v8[9](a1);
      v10 = (unsigned __int8 *)v8[10](a1);
      v11 = (unsigned __int8 *)v8[11](a1);
      iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 349);
      result = 4294967294;
      if (v9 && v10)
      {
        if (v11)
        {
          iwn_wpa_hexdump(2, "AE ID subject: ", (uint64_t)(v9 + 4), *v9);
          iwn_wpa_hexdump(2, "AE ID: issure", (uint64_t)(v10 + 4), *v10);
          iwn_wpa_hexdump(2, "AE ID: Number", (uint64_t)(v11 + 4), *v11);
          memcpy(a2 + 2, v9 + 4, *v9);
          v12 = (char *)v6 + *v9;
          memcpy(v12, v10 + 4, *v10);
          v13 = &v12[*v10];
          memcpy(v13, v11 + 4, *v11);
          a2[1] = (_WORD)v13 + *v11 - (_WORD)v6;
          iwn_free_buffer(v9, 260);
          iwn_free_buffer(v10, 260);
          iwn_free_buffer(v11, 260);
          return 0;
        }
      }
    }
    else
    {
      return 4294967292;
    }
  }
  return result;
}

uint64_t iwn_wapi_sm_rx_wai(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unint64_t a4)
{
  int v5;
  char *v7;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  int v14;
  unsigned __int8 *v15;
  int v16;

  if (!*(_DWORD *)(a1 + 68))
  {
    v7 = "wpa_s->wapi_state <WAPISM_AL_ASSOC";
    return iwn_wpa_printf(2, v7);
  }
  v5 = *(_DWORD *)(a1 + 17808);
  if (v5 == 1 && dword_10002074C == 0)
  {
    v7 = "No cert";
    return iwn_wpa_printf(2, v7);
  }
  if (a4 <= 0xB)
  {
    iwn_wpa_printf(2, "WPA: WAI frame too short, len %d");
LABEL_22:
    v7 = "WPA: WAI frame is wrong";
    return iwn_wpa_printf(2, v7);
  }
  if (__rev16(*a3) != 1)
  {
    iwn_wpa_printf(2, "WPA: WAI frame Version(%u) is wrong");
    goto LABEL_22;
  }
  if (*((_BYTE *)a3 + 2) != 1)
  {
    iwn_wpa_printf(2, "WPA: WAI frame type(%u) is wrong");
    goto LABEL_22;
  }
  v9 = *((unsigned __int8 *)a3 + 3);
  if (v5 == 2)
  {
    if (v9 >= 8)
      goto LABEL_14;
LABEL_20:
    iwn_wpa_printf(2, "WPA: WAI frame stype(%u) is wrong ");
    goto LABEL_22;
  }
  if (v9 <= 2)
    goto LABEL_20;
LABEL_14:
  v10 = *((unsigned __int8 *)a3 + 6);
  v11 = *((unsigned __int8 *)a3 + 7);
  if ((v11 | (v10 << 8)) != a4)
  {
    iwn_wpa_printf(2, "WPA: WAI frame length(%u) is wrong");
    goto LABEL_22;
  }
  if (__rev16(a3[4]) < *(unsigned __int16 *)(a1 + 64))
  {
    iwn_wpa_printf(2, "WPA: WAI frame packets_sc(%u) is wrong");
    goto LABEL_22;
  }
  v13 = v11 | ((_DWORD)v10 << 8);
  v14 = v13 - 12;
  iwn_wpa_printf(5, "iwn_wapi_sm_rx_wai  plen = %d, hdr->length = %d hdr->stype = %u \n", v13 - 12, v13, v9);
  v15 = (unsigned __int8 *)(a3 + 6);
  switch(*((_BYTE *)a3 + 3))
  {
    case 1:
    case 4:
    case 6:
    case 7:
    case 9:
    case 0xC:
      iwn_wpa_printf(2, "WPA: receive error frame stype %u");
      goto LABEL_26;
    case 2:
      iwn_wpa_printf(2, "WPA: receive ignore frame stype %u");
      goto LABEL_26;
    case 3:
      sub_10000F900(a1, (uint64_t)v15, v14);
      goto LABEL_26;
    case 5:
      v16 = sub_10000FB9C(a1, v15, v14);
      if (v16 != -2)
        goto LABEL_35;
      wlan_deauth_for_otherc();
      goto LABEL_26;
    case 8:
      sub_100010154(a1, (__int128 *)v15, v14);
      goto LABEL_26;
    case 0xA:
      v16 = sub_10001057C(a1, (uint64_t)v15, v14);
LABEL_35:
      if (v16 == -1)
      {
        timer_resend();
      }
      else if (!v16)
      {
        timer_reset();
      }
      goto LABEL_26;
    case 0xB:
      sub_1000107D0((unsigned __int8 *)a1, (uint64_t *)v15, v14);
LABEL_26:
      result = sub_10000F474(*(_QWORD *)(a1 + 56));
      *(_QWORD *)(a1 + 56) = 0;
      break;
    default:
      result = iwn_wpa_printf(2, "WPA: receive unknown frame stype %u", *((unsigned __int8 *)a3 + 3));
      break;
  }
  return result;
}

uint64_t sub_10000F900(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  char *v7;
  _QWORD *v8;
  int v9;
  int v10;
  __int128 v11;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  int v20;
  char *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  char *v26;
  size_t v27;
  signed int v28;
  char *v29;
  unsigned int v30;
  unsigned int v31;
  size_t v32;
  int v33;

  result = iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 721);
  if (a3 <= 43)
  {
LABEL_2:
    v7 = "WPA: WAI frame payload too short";
    return iwn_wpa_printf(5, v7);
  }
  if (*(_DWORD *)(a1 + 17808) != 1)
    return result;
  v8 = (_QWORD *)(a2 + 1);
  if ((*(_BYTE *)a2 & 1) != 0)
    v9 = 7;
  else
    v9 = 1;
  v10 = *(_DWORD *)(a1 + 68);
  if (v10 != v9)
  {
    if ((*(_BYTE *)a2 & 1) == 0 || v10 != 5 || !*(_DWORD *)(a1 + 72))
      return result;
    goto LABEL_14;
  }
  if ((*(_BYTE *)a2 & 1) != 0)
  {
LABEL_14:
    if (*v8 != *(_QWORD *)(a1 + 84)
      || *(_QWORD *)(a2 + 9) != *(_QWORD *)(a1 + 92)
      || *(_QWORD *)(a2 + 17) != *(_QWORD *)(a1 + 100)
      || *(_QWORD *)(a2 + 25) != *(_QWORD *)(a1 + 108))
    {
      v7 = "WPA: ae_auth_flag not same!\n";
      return iwn_wpa_printf(5, v7);
    }
    goto LABEL_25;
  }
  v11 = *(_OWORD *)v8;
  *(_OWORD *)(a1 + 100) = *(_OWORD *)(a2 + 17);
  *(_OWORD *)(a1 + 84) = v11;
LABEL_25:
  v15 = a3 - 44;
  *(_WORD *)(a1 + 4284) = bswap32(*(unsigned __int16 *)(a2 + 33)) >> 16;
  v16 = *(unsigned __int16 *)(a2 + 35);
  v17 = __rev16(v16);
  *(_WORD *)(a1 + 4286) = v17;
  if (v15 < bswap32(v16) >> 16)
    goto LABEL_2;
  v18 = (char *)(a2 + 37);
  v19 = v17 >= 0x3E8 ? 1000 : v17;
  memcpy((void *)(a1 + 4288), v18, v19);
  v20 = v15 - v17;
  v21 = &v18[v17];
  v22 = bswap32(*(unsigned __int16 *)&v18[v17]);
  v23 = HIWORD(v22);
  *(_WORD *)(a1 + 2232) = HIWORD(v22);
  v24 = *((unsigned __int16 *)v21 + 1);
  v25 = __rev16(v24);
  *(_WORD *)(a1 + 2234) = v25;
  if ((int)(v15 - v17) < (int)(bswap32(v24) >> 16))
    goto LABEL_2;
  v26 = v21 + 4;
  v27 = v25 >= 0x800 ? 2048 : v25;
  memcpy((void *)(a1 + 2236), v26, v27);
  v28 = v20 - v25;
  iwn_wai_fixdata_id_by_ident(a1 + 2232, (_WORD *)(a1 + 5288), v23);
  iwn_wpa_hexdump(2, "AE ID: ", a1 + 5292, *(unsigned __int16 *)(a1 + 5290));
  v29 = &v26[*(unsigned __int16 *)(a1 + 2234)];
  *(_BYTE *)(a1 + 8342) = *v29;
  v30 = *(unsigned __int16 *)(v29 + 1);
  v31 = __rev16(v30);
  *(_WORD *)(a1 + 8344) = v31;
  if (v28 < (int)(bswap32(v30) >> 16))
    goto LABEL_2;
  if (v31 >= 0x100)
    v32 = 256;
  else
    v32 = v31;
  memcpy((void *)(a1 + 8347), v29 + 3, v32);
  if (v28 != v31)
  {
    v33 = 820;
    return iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", v33);
  }
  sub_100010D74(a1);
  result = sub_100010E04(a1);
  if ((_DWORD)result != -1)
  {
    get_random((_BYTE *)(a1 + 116), 32);
    result = sub_100010EC0(a1);
    if ((_DWORD)result)
    {
      v33 = 833;
      return iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", v33);
    }
  }
  return result;
}

uint64_t sub_10000FB9C(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v6;
  uint64_t result;
  __int128 v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v14;
  unsigned int v15;
  uint64_t v16;
  unsigned __int16 *v17;
  int v18;
  int v19;
  unsigned __int16 *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int16 *v24;
  char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t cert_obj;
  unsigned __int16 *v33;
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

  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 994);
  if (*(_DWORD *)(a1 + 68) != 2)
    return 0xFFFFFFFFLL;
  v6 = *a2;
  iwn_wpa_printf(2, "WPA: in %s:%d,flag=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1003, v6);
  iwn_wpa_printf(2, "WPA: in %s:%d,wpa_s->flag=%d,(flag & BIT(0))=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1004, v6, v6 & 1);
  iwn_wpa_printf(2, "WPA: in %s:%d,wpa_s->flag=%d,(flag & BIT(0))=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1005, v6, *(_BYTE *)(a1 + 82) & 1);
  iwn_wpa_printf(2, "WPA: in %s:%d,wpa_s->flag=%d,(flag & BIT(1))=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1006, v6, v6 & 2);
  iwn_wpa_printf(2, "WPA: in %s:%d,wpa_s->flag=%d,(flag & BIT(1))=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1007, v6, *(_BYTE *)(a1 + 82) & 2);
  if ((v6 & 3) != (*(_BYTE *)(a1 + 82) & 3))
  {
    iwn_wpa_printf(5, "WPA: not same flag bit 0,1!\n", v36, v39, v42, v45);
    return 0xFFFFFFFFLL;
  }
  if (*(_QWORD *)(a2 + 1) != *(_QWORD *)(a1 + 116)
    || *(_QWORD *)(a2 + 9) != *(_QWORD *)(a1 + 124)
    || *(_QWORD *)(a2 + 17) != *(_QWORD *)(a1 + 132)
    || *(_QWORD *)(a2 + 25) != *(_QWORD *)(a1 + 140))
  {
    iwn_wpa_printf(5, "WPA: not same Nasue!\n", v36, v39, v42, v45);
    return 0xFFFFFFFFLL;
  }
  v11 = *(_OWORD *)(a2 + 33);
  *(_OWORD *)(a1 + 164) = *(_OWORD *)(a2 + 49);
  *(_OWORD *)(a1 + 148) = v11;
  if (a2[65])
    return 4294967294;
  v12 = a2[66];
  v13 = *(unsigned __int8 *)(a1 + 7562);
  if ((_DWORD)v12 != v13 || memcmp(a2 + 67, (const void *)(a1 + 7566), a2[66]))
  {
    iwn_wpa_printf(5, "WPA: not same asue key data!,asue_len =%d,wpa_s->asue_key_data.length=%d\n");
    return 0xFFFFFFFFLL;
  }
  v14 = &a2[v12 + 66];
  v15 = *++v14;
  memcpy((void *)(a1 + 8086), v14 + 1, v15);
  *(_BYTE *)(a1 + 8082) = *v14;
  v16 = *v14;
  v17 = (unsigned __int16 *)&v14[v16 + 1];
  v18 = *(unsigned __int16 *)(a1 + 5290);
  if (sub_1000112C8(v17, (unsigned __int16 *)(a1 + 5288), *(unsigned __int16 *)(a1 + 5290)))
  {
    iwn_wpa_printf(5, "WPA: not same ae id!\n");
    iwn_wpa_hexdump(5, "ae_id", (uint64_t)v17, *(unsigned __int16 *)(a1 + 5290) + 4);
    iwn_wpa_hexdump(5, "wpa_s->ae_id", a1 + 5288, *(unsigned __int16 *)(a1 + 5290) + 4);
    return 0xFFFFFFFFLL;
  }
  v19 = v13 + v16 + v18 + 72;
  iwn_wpa_printf(2, "WPA: in %s:%d,request_len=%d,wpa_s->ae_id.id_len=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1056, v19, v18);
  v20 = (unsigned __int16 *)((char *)v17 + *(unsigned __int16 *)(a1 + 5290) + 4);
  v21 = (unsigned __int16)word_100020362;
  if (sub_1000112C8(v20, (unsigned __int16 *)&word_100020360, (unsigned __int16)word_100020362))
  {
    iwn_wpa_printf(5, "WPA: not same asue id!\n", v37, v40, v43, v46);
    return 0xFFFFFFFFLL;
  }
  v22 = (v19 + v21 + 4);
  iwn_wpa_printf(2, "WPA: in %s:%d,request_len=%d,wpa_s->asue_id.id_len=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1065, v19 + v21 + 4, v21);
  if ((v6 & 8) != 0)
  {
    iwn_wpa_printf(2, "WPA: in %s:%d,iwn_eloop.asue_id.id_len=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1073, (unsigned __int16)word_100020362);
    v25 = (char *)v20 + (unsigned __int16)word_100020362;
    if (v25[4] != 2)
    {
      iwn_wpa_printf(5, "cert result flag is not 2!\n", v38, v41, v44, v47);
      return 0xFFFFFFFFLL;
    }
    v26 = (uint64_t)&v25[__rev16(*((unsigned __int16 *)v25 + 37)) + 74];
    if (*(_BYTE *)(v26 + 2))
    {
      iwn_wpa_printf(5, "cert result  is not ok!\n");
      return 4294967294;
    }
    v28 = v26 + 2 + __rev16(*(unsigned __int16 *)(v26 + 5));
    v29 = __rev16(*(unsigned __int16 *)(v28 + 6));
    v30 = (uint64_t)(v25 + 4);
    iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1092);
    v31 = __rev16(*(unsigned __int16 *)(v25 + 5));
    cert_obj = get_cert_obj((unsigned __int16)word_100020358);
    v33 = *(unsigned __int16 **)(cert_obj + 24);
    v34 = v31 + 3;
    v35 = v28 + v29 - 40;
    if (!(*(unsigned int (**)(unsigned __int16 *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(cert_obj + 112))(v33 + 2, *v33, v30, v34, v35, 48))
    {
      iwn_wpa_hexdump(5, "pubkey->data", (uint64_t)(v33 + 2), *v33);
      iwn_wpa_hexdump(5, "cert_res", v30, v34);
      iwn_wpa_hexdump(5, "asu_sign", v35, 48);
      v27 = "ASU sign error!!!";
      goto LABEL_34;
    }
    v22 = (v22 + v29 + v34 + 3);
    iwn_wpa_printf(2, "WPA: in %s:%d,request_len=%d,len=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1109, v22, a3);
  }
  v23 = get_cert_obj(*(unsigned __int16 *)(a1 + 2232));
  iwn_wpa_printf(2, "WPA: in %s:%d,wpa_s->ae_cert.len=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1119, *(unsigned __int16 *)(a1 + 2234));
  v24 = (unsigned __int16 *)(*(uint64_t (**)(uint64_t))(v23 + 64))(a1 + 2232);
  if (!(*(unsigned int (**)(unsigned __int16 *, _QWORD, unsigned __int8 *, uint64_t, unsigned __int8 *, uint64_t))(v23 + 112))(v24 + 2, *v24, a2, v22, &a2[a3 - 48], 48))
  {
    iwn_free_buffer(v24, 2052);
    v27 = "AE sign error!!!";
LABEL_34:
    puts(v27);
    return 0xFFFFFFFFLL;
  }
  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1131);
  iwn_free_buffer(v24, 2052);
  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1133);
  if ((_DWORD)v22 + (bswap32(*(unsigned __int16 *)&a2[v22 + 1]) >> 16) + 3 != a3)
  {
    iwn_wpa_printf(2, "WPA: in %s:%d,request_len=%d,len=%d");
    return 0xFFFFFFFFLL;
  }
  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1143);
  sub_100011320(a1);
  result = 0;
  *(_DWORD *)(a1 + 68) = 3;
  return result;
}

uint64_t sub_100010154(uint64_t a1, __int128 *a2, int a3)
{
  unsigned __int8 *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v12;
  const char *v13;
  int v14;
  __int128 *v15;
  char *buffer;
  char *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  _BYTE *v27;
  __int128 v28;
  unsigned __int8 *v29;
  __int128 v30;
  __int128 v31;
  size_t v32;
  char *v33;
  uint64_t v34;

  v6 = *(unsigned __int8 **)(a1 + 40);
  result = iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1447);
  if (a3 <= 61)
    return iwn_wpa_printf(5, "WPA: WAI frame payload too short, len(%u)", a3);
  if ((*(_BYTE *)a2 & 0x10) != 0)
  {
    v8 = 7;
  }
  else if (*(_DWORD *)(a1 + 17808) == 2)
  {
    v8 = 1;
  }
  else
  {
    v8 = 3;
  }
  v9 = *((unsigned __int8 *)a2 + 17);
  v10 = *(_DWORD *)(a1 + 68);
  if (v10 == v8 || (*(_BYTE *)a2 & 0x10) != 0 && *(_DWORD *)(a1 + 72) && v10 <= 7 && ((1 << v10) & 0xA8) != 0)
  {
    if (*(_QWORD *)((char *)a2 + 1) != *((_QWORD *)v6 + 42) || *(_QWORD *)((char *)a2 + 9) != *((_QWORD *)v6 + 43))
    {
      iwn_wpa_printf(2, "WPA: BKID is wrong");
      iwn_wpa_hexdump(5, "AE BKID", (uint64_t)a2 + 1, 16);
      iwn_wpa_hexdump(5, "ASUE BKID", (uint64_t)(v6 + 336), 16);
      v12 = (uint64_t)(v6 + 352);
      v13 = "ASUE BK";
      v14 = 16;
      return iwn_wpa_hexdump(5, v13, v12, v14);
    }
    v15 = (__int128 *)((char *)a2 + 30);
    if ((*(_BYTE *)a2 & 0x10) != 0)
    {
      if ((_DWORD)v9 != (*v6 == 0))
      {
        v33 = "WPA: USKID  is not invalid";
        v34 = 5;
        return iwn_wpa_printf(v34, v33);
      }
      if (sub_1000115C4(&v6[128 * (unint64_t)*v6 + 68], (__int128 *)((char *)a2 + 30)))
      {
        v13 = "ae_challenge";
        v12 = (uint64_t)a2 + 30;
        v14 = 32;
        return iwn_wpa_hexdump(5, v13, v12, v14);
      }
    }
    *v6 = v9;
    buffer = (char *)iwn_get_buffer(140);
    if (buffer)
    {
      v17 = buffer;
      v18 = &v6[128 * v9];
      get_random(v18 + 100, 32);
      v19 = *(_QWORD *)((char *)a2 + 18);
      *((_DWORD *)v17 + 2) = *(_DWORD *)((char *)a2 + 26);
      *(_QWORD *)v17 = v19;
      v20 = *v15;
      *(_OWORD *)(v17 + 28) = *(__int128 *)((char *)a2 + 46);
      *(_OWORD *)(v17 + 12) = v20;
      iwn_wpa_hexdump(2, "asue_challenge", (uint64_t)(v18 + 100), 32);
      iwn_wpa_hexdump(2, "ae_challenge", (uint64_t)a2 + 30, 32);
      v21 = *(_OWORD *)(v18 + 100);
      *(_OWORD *)(v17 + 60) = *(_OWORD *)(v18 + 116);
      *(_OWORD *)(v17 + 44) = v21;
      qmemcpy(v17 + 76, "pairwise key expansion for unicast and additional keys and nonce", 64);
      KD_hmac_sha256(v17, 140, (__int128 *)v6 + 22, *((_DWORD *)v6 + 100), (char *)v18 + 4, 96);
      mhash_sha256((uint64_t)(v18 + 68), 0x20u, (uint64_t)(v18 + 68));
      iwn_free_buffer(v17, 140);
      v22 = *(unsigned __int8 **)(a1 + 40);
      v23 = *v22;
      v24 = v22[973];
      iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1547);
      result = (uint64_t)iwn_get_buffer(v24 + 126);
      if (result)
      {
        v25 = result;
        v26 = *(_WORD *)(a1 + 66) + 1;
        *(_WORD *)(a1 + 66) = v26;
        *(_QWORD *)result = 151060736;
        *(_BYTE *)(result + 8) = HIBYTE(v26);
        *(_BYTE *)(result + 9) = v26;
        *(_WORD *)(result + 10) = 0;
        v27 = (_BYTE *)(result + 12);
        v28 = *a2;
        *(_OWORD *)(result + 26) = *(__int128 *)((char *)a2 + 14);
        *(_OWORD *)(result + 12) = v28;
        v29 = &v22[128 * v23];
        v30 = *(_OWORD *)(v29 + 100);
        *(_OWORD *)(result + 58) = *(_OWORD *)(v29 + 116);
        *(_OWORD *)(result + 42) = v30;
        iwn_wpa_hexdump(2, "asue_challenge", (uint64_t)(v29 + 100), 32);
        v31 = *v15;
        *(_OWORD *)(v25 + 90) = *(__int128 *)((char *)a2 + 46);
        *(_OWORD *)(v25 + 74) = v31;
        iwn_wpa_hexdump(2, "WPA: tbuf", v25, v24 + 126);
        v32 = v22[973];
        memcpy((void *)(v25 + 106), v22 + 460, v32);
        hmac_sha256(v27, v24 + 94, (__int128 *)(v29 + 36), 0x10u, (void *)(v25 + 106 + v32), 20);
        *(_WORD *)(v25 + 6) = bswap32(v32 + 126) >> 16;
        iwn_wpa_ether_send((u_char *)v25, v24 + 126);
        timer_set(2, (const void *)v25, v24 + 126);
        result = iwn_free_buffer((void *)v25, v24 + 126);
        *(_DWORD *)(a1 + 68) = 4;
      }
      return result;
    }
    v33 = "WPA: malloc failure";
    v34 = 2;
    return iwn_wpa_printf(v34, v33);
  }
  return result;
}

uint64_t sub_10001057C(uint64_t a1, uint64_t a2, int a3)
{
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  _QWORD *v9;
  const char *v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  size_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  v6 = *(unsigned __int8 **)(a1 + 40);
  v7 = *v6;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1586);
  if (*(_DWORD *)(a1 + 68) != 4)
    return 0xFFFFFFFFLL;
  v8 = &v6[128 * v7];
  if (sub_1000115C4(v8 + 100, (_QWORD *)(a2 + 30)))
    return 0xFFFFFFFFLL;
  v9 = (_QWORD *)(a2 + a3 - 20);
  hmac_sha256((_BYTE *)a2, a3 - 20, (__int128 *)(v8 + 36), 0x10u, &v21, 20);
  if (v21 != *v9 || v22 != *(_QWORD *)(a2 + a3 - 12) || v23 != (unint64_t)*(unsigned int *)(a2 + a3 - 4))
  {
    iwn_wpa_hexdump(2, "receive ap's mic", (uint64_t)v9, 20);
    v12 = "own mic";
    v13 = &v21;
    v14 = 2;
    v15 = 20;
LABEL_11:
    iwn_wpa_hexdump(v14, v12, (uint64_t)v13, v15);
    return 0xFFFFFFFFLL;
  }
  v17 = (*(_BYTE *)(a2 + 63) + 2);
  iwn_wpa_hexdump(2, "AE's IE ", a2 + 62, (*(_BYTE *)(a2 + 63) + 2));
  if ((*(_BYTE *)a2 & 0x10) == 0 && ((_DWORD)v17 != v6[972] || memcmp((const void *)(a2 + 62), v6 + 716, v17)))
  {
    iwn_wpa_hexdump(5, "AE's IE ", a2 + 62, v17);
    v13 = (uint64_t *)(v6 + 716);
    v15 = v6[972];
    v12 = "ASUE's IE ";
    v14 = 5;
    goto LABEL_11;
  }
  *v6 = *(_BYTE *)(a2 + 17);
  v18 = *(unsigned __int8 **)(a1 + 40);
  v19 = *v18;
  v20 = (uint64_t)&v18[128 * v19 + 4];
  iwn_wpa_hexdump(2, "wapi_install_usk:", v20, 32);
  if (sub_100006924(v20, 32, v19))
  {
    iwn_wpa_printf(4, "WPA: Failed to set PTK to the driver");
    iwn_wpa_printf(5, "in %s install usk failure\n", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c");
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 68) = 5;
  if (*(_DWORD *)(a1 + 72) || (*(_BYTE *)a2 & 0x10) == 0)
    return 0;
  result = 0;
  *(_DWORD *)(a1 + 72) = 1;
  return result;
}

uint64_t sub_1000107D0(unsigned __int8 *a1, uint64_t *a2, int a3)
{
  unsigned __int8 *v6;
  uint64_t result;
  BOOL v8;
  BOOL v9;
  _OWORD *v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v22;
  __int128 v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  void *v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  int v42;

  v40 = 0;
  v41 = 0;
  v42 = 0;
  v6 = (unsigned __int8 *)*((_QWORD *)a1 + 5);
  result = iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1648);
  if ((*((_DWORD *)a1 + 17) | 2) == 7)
  {
    if ((*(_BYTE *)a2 & 0x20) != 0)
      return iwn_wpa_printf(2, "WPA: STAKEY_NEG  is not supptable by ASUE");
    v6[273] = *((_BYTE *)a2 + 1);
    v8 = *((_DWORD *)a1 + 2) == *(_DWORD *)((char *)a2 + 3)
      && *((unsigned __int16 *)a1 + 6) == *(unsigned __int16 *)((char *)a2 + 7);
    if (!v8
      || (*(_DWORD *)a1 == *(_DWORD *)((char *)a2 + 9)
        ? (v9 = *((unsigned __int16 *)a1 + 2) == *(unsigned __int16 *)((char *)a2 + 13))
        : (v9 = 0),
          !v9))
    {
      iwn_wpa_hexdump(5, "addid", (uint64_t)a2 + 3, 12);
      iwn_wpa_printf(5, "bssid=%02x:%02x:%02x:%02x:%02x:%02x; ownaddr%02x:%02x:%02x:%02x:%02x:%02x",
        a1[8],
        a1[9],
        a1[10],
        a1[11],
        a1[12],
        a1[13],
        *a1,
        a1[1],
        a1[2],
        a1[3],
        a1[4],
        a1[5]);
      return iwn_wpa_printf(2, "WPA: ADDID  is wrong");
    }
    v10 = (_OWORD *)((char *)a2 + 31);
    v11 = bswap64(*(uint64_t *)((char *)a2 + 31));
    v12 = bswap64(*(_QWORD *)(v6 + 308));
    if (v11 == v12 && (v11 = bswap64(*(uint64_t *)((char *)a2 + 39)), v12 = bswap64(*(_QWORD *)(v6 + 316)), v11 == v12))
    {
      v13 = 0;
    }
    else if (v11 < v12)
    {
      v13 = -1;
    }
    else
    {
      v13 = 1;
    }
    if (v13 <= 0)
    {
      iwn_wpa_printf(2, "WPA: Key annoucement identfier is wrong");
      iwn_wpa_hexdump(2, "WPA: msk_ann_id", (uint64_t)(v6 + 308), 16);
      return iwn_wpa_hexdump(2, "rx WPA: Key_an_id", (uint64_t)a2 + 31, 16);
    }
    *(_OWORD *)(v6 + 308) = *v10;
    v14 = *((unsigned __int8 *)a2 + 2);
    if (*v6 != (_DWORD)v14)
      return iwn_wpa_printf(2, "WPA: Key annoucement uskid  is wrong");
    v15 = &v6[128 * v14];
    hmac_sha256(a2, a3 - 20, (__int128 *)(v15 + 36), 0x10u, &v40, 20);
    v16 = (uint64_t)a2 + a3;
    v17 = *(_QWORD *)(v16 - 20);
    v18 = *(_QWORD *)(v16 - 12);
    v19 = *(unsigned int *)(v16 - 4);
    if (v40 != v17 || v41 != v18 || v42 != v19)
    {
      v22 = "WPA: Multicast  announcement packet mic  is wrong";
      return iwn_wpa_printf(2, v22, v36);
    }
    v23 = *((_OWORD *)a2 + 3);
    v38 = *v10;
    v39 = v23;
    iwn_wpa_hexdump(2, "ct_msk", (uint64_t)(a2 + 6), 16);
    iwn_wpa_hexdump(2, "kek", (uint64_t)(v15 + 52), 16);
    iwn_wpa_hexdump(2, "iv", (uint64_t)&v38, 16);
    v37 = *((_OWORD *)a2 + 3);
    wpi_encrypt((unsigned int *)&v38, &v37, 0x10u, (_DWORD *)v15 + 13, (unsigned int *)&v39);
    iwn_wpa_hexdump(2, "outmkey", (uint64_t)&v39, 16);
    KD_hmac_sha256("multicast or station key expansion for station unicast and multicast and broadcast", 82, &v39, *((unsigned __int8 *)a2 + 47), (char *)v6 + 276, 32);
    iwn_wpa_hexdump(2, "msk", (uint64_t)(v6 + 276), 32);
    iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 1732);
    v24 = (unsigned __int8 *)*((_QWORD *)a1 + 5);
    v25 = *((unsigned __int8 *)a2 + 2);
    if (*v24 != (_DWORD)v25)
    {
      v22 = "WPA: Key annoucement uskid  is wrong";
      return iwn_wpa_printf(2, v22, v36);
    }
    result = (uint64_t)iwn_get_buffer(63);
    if (result)
    {
      v26 = result;
      v27 = *((_WORD *)a1 + 33) + 1;
      *((_WORD *)a1 + 33) = v27;
      *(_QWORD *)result = 201392384;
      *(_BYTE *)(result + 8) = HIBYTE(v27);
      *(_BYTE *)(result + 9) = v27;
      *(_WORD *)(result + 10) = 0;
      v28 = *a2;
      *(_QWORD *)(result + 19) = *(uint64_t *)((char *)a2 + 7);
      *(_QWORD *)(result + 12) = v28;
      v29 = (_BYTE *)(result + 12);
      v30 = (uint64_t)a2 + 15;
      *(_OWORD *)(result + 27) = *v10;
      v31 = (void *)(result + 43);
      v32 = (__int128 *)&v24[128 * v25 + 36];
      iwn_wpa_hexdump(2, "WPA: mak", (uint64_t)v32, 16);
      iwn_wpa_hexdump(2, "WPA: tbuf", (uint64_t)v29, 31);
      hmac_sha256(v29, 31, v32, 0x10u, v31, 20);
      *(_WORD *)(v26 + 6) = 16128;
      iwn_wpa_ether_send((u_char *)v26, 0x3Fu);
      timer_set(3, (const void *)v26, 63);
      iwn_free_buffer((void *)v26, 63);
      *((_DWORD *)a1 + 17) = 6;
      v33 = *((_QWORD *)a1 + 5);
      v34 = *(unsigned __int8 *)(v33 + 273);
      v35 = v33 + 276;
      iwn_wpa_hexdump(2, "wapi_install_msk:", v33 + 276, 32);
      iwn_wpa_hexdump(2, "WPA: KEYSC", v30, 16);
      result = sub_100006860(v35, 32, v34, v30);
      if ((_DWORD)result)
      {
        iwn_wpa_printf(4, "WPA: Failed to set MSK to the driver.");
        return iwn_wpa_printf(5, "in %s install msk failure\n");
      }
      else
      {
        *((_DWORD *)a1 + 17) = 7;
      }
    }
  }
  return result;
}

double sub_100010D74(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 7536) = 0u;
  *(_OWORD *)(a1 + 7520) = 0u;
  *(_OWORD *)(a1 + 7504) = 0u;
  *(_OWORD *)(a1 + 7488) = 0u;
  *(_OWORD *)(a1 + 7472) = 0u;
  *(_OWORD *)(a1 + 7456) = 0u;
  *(_OWORD *)(a1 + 7440) = 0u;
  *(_OWORD *)(a1 + 7424) = 0u;
  *(_OWORD *)(a1 + 7408) = 0u;
  *(_OWORD *)(a1 + 7392) = 0u;
  *(_OWORD *)(a1 + 7376) = 0u;
  *(_OWORD *)(a1 + 7360) = 0u;
  *(_OWORD *)(a1 + 7344) = 0u;
  *(_OWORD *)(a1 + 7328) = 0u;
  *(_OWORD *)(a1 + 7312) = 0u;
  *(_OWORD *)(a1 + 7296) = 0u;
  *(_OWORD *)(a1 + 7546) = 0u;
  *(_DWORD *)(a1 + 7296) = 16842768;
  *(_BYTE *)(a1 + 7300) = 1;
  *(_WORD *)(a1 + 7302) = 11;
  *(_DWORD *)(a1 + 7312) = 16908545;
  *(_QWORD *)(a1 + 7305) = 0x163D71C812A0906;
  return result;
}

uint64_t sub_100010E04(uint64_t a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v1 = (_BYTE *)(a1 + 7822);
  *(_BYTE *)(a1 + 7822) = 0;
  *(_OWORD *)(a1 + 7826) = 0u;
  *(_OWORD *)(a1 + 7842) = 0u;
  *(_OWORD *)(a1 + 7858) = 0u;
  v2 = (_BYTE *)(a1 + 7562);
  *(_OWORD *)(a1 + 7874) = 0u;
  *(_OWORD *)(a1 + 7890) = 0u;
  *(_OWORD *)(a1 + 7906) = 0u;
  *(_OWORD *)(a1 + 7922) = 0u;
  *(_OWORD *)(a1 + 7938) = 0u;
  *(_OWORD *)(a1 + 7954) = 0u;
  *(_OWORD *)(a1 + 7970) = 0u;
  *(_OWORD *)(a1 + 7986) = 0u;
  *(_OWORD *)(a1 + 8002) = 0u;
  *(_OWORD *)(a1 + 8018) = 0u;
  *(_OWORD *)(a1 + 8034) = 0u;
  *(_OWORD *)(a1 + 8050) = 0u;
  *(_OWORD *)(a1 + 8066) = 0u;
  *(_BYTE *)(a1 + 7562) = 0;
  *(_OWORD *)(a1 + 7566) = 0u;
  *(_OWORD *)(a1 + 7790) = 0u;
  *(_OWORD *)(a1 + 7806) = 0u;
  *(_OWORD *)(a1 + 7758) = 0u;
  *(_OWORD *)(a1 + 7774) = 0u;
  *(_OWORD *)(a1 + 7726) = 0u;
  *(_OWORD *)(a1 + 7742) = 0u;
  *(_OWORD *)(a1 + 7694) = 0u;
  *(_OWORD *)(a1 + 7710) = 0u;
  *(_OWORD *)(a1 + 7662) = 0u;
  *(_OWORD *)(a1 + 7678) = 0u;
  *(_OWORD *)(a1 + 7630) = 0u;
  *(_OWORD *)(a1 + 7646) = 0u;
  *(_OWORD *)(a1 + 7598) = 0u;
  *(_OWORD *)(a1 + 7614) = 0u;
  *(_OWORD *)(a1 + 7582) = 0u;
  result = ecc192_genkey(a1 + 7826, (_BYTE *)(a1 + 7566));
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *v1 = 24;
  *v2 = 49;
  return result;
}

uint64_t sub_100010EC0(uint64_t a1)
{
  char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  const void **v12;
  size_t v13;
  char *v14;
  size_t v15;
  char *v16;
  uint64_t cert_obj;
  size_t v18;
  char *v19;
  _BYTE *v20;
  size_t v21;
  _BYTE *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;

  v2 = (char *)(a1 + 8342);
  iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 851);
  bzero(byte_100022B56, 0x800uLL);
  bzero(&word_100021B4E, 0x804uLL);
  bzero(&unk_100022352, 0x804uLL);
  v3 = *(_WORD *)(a1 + 66) + 1;
  *(_WORD *)(a1 + 66) = v3;
  *(_WORD *)&byte_100022B56[1] = 257;
  byte_100022B59 = 4;
  byte_100022B5B = 0;
  byte_100022B5E = HIBYTE(v3);
  byte_100022B5F = v3;
  byte_100022B61 = 0;
  v4 = *(unsigned __int8 *)(a1 + 82) | 4;
  *(_BYTE *)(a1 + 82) |= 4u;
  iwn_wpa_printf(2, "WPA: in %s:%d,wpa_s->flag=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 860, v4);
  byte_100022B62 = *(_BYTE *)(a1 + 82);
  unk_100022B63 = *(_OWORD *)(a1 + 84);
  unk_100022B73 = *(_OWORD *)(a1 + 100);
  unk_100022B83 = *(_OWORD *)(a1 + 116);
  unk_100022B93 = *(_OWORD *)(a1 + 132);
  byte_100022BA3 = *(_BYTE *)(a1 + 7562);
  v5 = byte_100022BA3;
  __memcpy_chk(&unk_100022BA4, a1 + 7566, byte_100022BA3, 1970);
  v6 = (char *)&unk_100022BA4 + v5;
  *v6 = *(_BYTE *)(a1 + 5289);
  v6[1] = *(_BYTE *)(a1 + 5288);
  v6[2] = *(_BYTE *)(a1 + 5291);
  v6[3] = *(_BYTE *)(a1 + 5290);
  v7 = (char *)&unk_100022BA4 + v5 + 4;
  v8 = *(unsigned __int16 *)(a1 + 5290);
  memcpy(v7, (const void *)(a1 + 5292), v8);
  v9 = &v7[v8];
  *(_WORD *)v9 = bswap32((unsigned __int16)word_100020358) >> 16;
  v10 = iwn_eloop;
  v9[2] = *(_BYTE *)(*(_QWORD *)(iwn_eloop + 48) + 1);
  v9[3] = **(_BYTE **)(v10 + 48);
  v11 = &v7[v8 + 4];
  v12 = *(const void ***)(v10 + 48);
  v13 = *(unsigned __int16 *)v12;
  memcpy(v11, v12[1], v13);
  v14 = &v11[v13];
  iwn_wpa_hexdump(2, "cert_bin->data", *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8), **(unsigned __int16 **)(v10 + 48));
  *v14 = *v2;
  v14[1] = v2[3];
  v14[2] = v2[2];
  v14 += 3;
  v15 = *((unsigned __int16 *)v2 + 1);
  memcpy(v14, (const void *)(a1 + 8347), v15);
  v16 = &v14[v15];
  word_100021B4E = (_WORD)v16 - (unsigned __int16)byte_100022B56 - 12;
  __memcpy_chk(&unk_100021B52, &byte_100022B62, (unsigned __int16)((_WORD)v16 - (unsigned __int16)byte_100022B56 - 12), 2048);
  cert_obj = get_cert_obj((unsigned __int16)word_100020358);
  iwn_wpa_printf(2, "WPA: in %s:%d,used_cert=%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 911, (unsigned __int16)word_100020358);
  if ((*(unsigned int (**)(uint64_t, _QWORD, void *, _QWORD, __int128 *))(cert_obj + 104))(*(_QWORD *)(cert_obj + 40) + 4, **(unsigned __int16 **)(cert_obj + 40), &unk_100021B52, (unsigned __int16)word_100021B4E, &xmmword_100022356))
  {
    *v16 = 1;
    iwn_wpa_printf(2, "WPA: in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 925);
    *(_WORD *)(v16 + 3) = bswap32((unsigned __int16)word_100020360) >> 16;
    v18 = (unsigned __int16)word_100020362;
    *(_WORD *)(v16 + 5) = __rev16((unsigned __int16)word_100020362);
    memcpy(v16 + 7, &unk_100020364, v18);
    v19 = &v16[v18 + 7];
    *v19 = *(_BYTE *)(a1 + 7297);
    v19[1] = *(_BYTE *)(a1 + 7296);
    v19[2] = *(_BYTE *)(a1 + 7298);
    v19[3] = *(_BYTE *)(a1 + 7299);
    v19[4] = *(_BYTE *)(a1 + 7300);
    v19[5] = *(_BYTE *)(a1 + 7303);
    v19[6] = *(_BYTE *)(a1 + 7302);
    v20 = v19 + 7;
    v21 = *(unsigned __int16 *)(a1 + 7302);
    memcpy(v19 + 7, (const void *)(a1 + 7305), v21);
    v22 = &v20[v21];
    *(_WORD *)v22 = 12288;
    v24 = xmmword_100022366;
    v23 = unk_100022376;
    *(_OWORD *)(v22 + 2) = xmmword_100022356;
    *(_OWORD *)(v22 + 18) = v24;
    *(_OWORD *)(v22 + 34) = v23;
    v25 = (uint64_t)&v20[v21 + 50];
    *(_WORD *)(v16 + 1) = bswap32(v25 - ((_DWORD)v16 + 1) - 2) >> 16;
    v26 = v25 - (_QWORD)byte_100022B56;
    byte_100022B5C = (unsigned __int16)(v25 - (_QWORD)byte_100022B56) >> 8;
    byte_100022B5D = v25 - (_QWORD)byte_100022B56;
    iwn_wpa_ether_send(byte_100022B56, v25 - (_QWORD)byte_100022B56);
    timer_set(1, byte_100022B56, v26);
    result = 0;
    *(_DWORD *)(a1 + 68) = 2;
  }
  else
  {
    iwn_wpa_printf(5, "fail to sign data and will exit !!\n");
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000112C8(unsigned __int16 *a1, unsigned __int16 *a2, size_t __n)
{
  const void *v4;
  unsigned int v5;

  v5 = *a1;
  v4 = a1 + 2;
  if (*a2 != bswap32(v5) >> 16 || a2[1] != bswap32(a1[1]) >> 16)
    return 0xFFFFFFFFLL;
  if (!memcmp(v4, a2 + 2, __n))
    return 0;
  return 0xFFFFFFFFLL;
}

uint64_t sub_100011320(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];
  _OWORD v10[16];

  memset(v9, 0, sizeof(v9));
  v8 = 0u;
  v6 = 0uLL;
  v7 = 0;
  v2 = a1 + 7826;
  iwn_wpa_hexdump(2, "asue_eck", a1 + 7826, *(unsigned __int8 *)(a1 + 7822));
  iwn_wpa_hexdump(2, "ae_key_data", a1 + 8086, *(unsigned __int8 *)(a1 + 8082));
  if (!ecc192_ecdh(v2, a1 + 8086, (uint64_t)&v6))
    return iwn_wpa_printf(2, "asue_certauthbk_derivation ECHD fail : in %s:%d", "/Library/Caches/com.apple.xbs/Sources/WAPI/libiwnwai_asue/wapi.c", 417);
  iwn_wpa_hexdump(2, "ecdhkey", (uint64_t)&v6, 24);
  v3 = *(_OWORD *)(a1 + 164);
  v10[0] = *(_OWORD *)(a1 + 148);
  v10[1] = v3;
  v4 = *(_OWORD *)(a1 + 132);
  v10[2] = *(_OWORD *)(a1 + 116);
  v10[3] = v4;
  memset((char *)&v10[6] + 15, 0, 145);
  qmemcpy(&v10[4], "base key expansion for key and additional nonce", 47);
  KD_hmac_sha256(v10, 111, &v6, 0x18u, (char *)&v8, 48);
  iwn_wpa_hexdump(2, "text", (uint64_t)v10, 111);
  iwn_wpa_hexdump(2, "temp_out", (uint64_t)&v8, 48);
  *(_OWORD *)(*(_QWORD *)(a1 + 40) + 352) = v8;
  LODWORD(v10[0]) = *(_DWORD *)(a1 + 8);
  WORD2(v10[0]) = *(_WORD *)(a1 + 12);
  memset((char *)v10 + 12, 0, 244);
  WORD5(v10[0]) = *(_WORD *)(a1 + 4);
  *(_DWORD *)((char *)v10 + 6) = *(_DWORD *)a1;
  iwn_wpa_hexdump(2, "text1", (uint64_t)v10, 111);
  KD_hmac_sha256(v10, 12, (__int128 *)(*(_QWORD *)(a1 + 40) + 352), 0x10u, (char *)(*(_QWORD *)(a1 + 40) + 336), 16);
  mhash_sha256((uint64_t)v9, 0x20u, a1 + 84);
  iwn_wpa_hexdump(5, "bk", *(_QWORD *)(a1 + 40) + 352, 16);
  return iwn_wpa_hexdump(5, "bkid", *(_QWORD *)(a1 + 40) + 336, 16);
}

uint64_t sub_1000115C4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3])
    return 0;
  iwn_wpa_hexdump(2, "challenge_a", (uint64_t)a1, 32);
  iwn_wpa_hexdump(2, "challenge_b", (uint64_t)a2, 32);
  return 0xFFFFFFFFLL;
}

uint64_t FpMinus(int *a1, unsigned int *a2, _QWORD *a3)
{
  uint64_t v4;

  if (*a1 == 1 && !a1[1])
  {
    *(_DWORD *)a3 = 1;
    if (*a1 >= 1)
    {
      v4 = 1;
      do
        *((_DWORD *)a3 + v4) = a1[v4];
      while (v4++ < *a1);
    }
  }
  else
  {
    sub_1000116B0(a2, a1, a3);
  }
  return 0;
}

double sub_1000116B0(unsigned int *a1, int *a2, _QWORD *a3)
{
  int *v4;
  int v6;
  double result;
  int *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;

  v4 = a2;
  v6 = sub_100012304(a1, a2);
  if (v6 <= 0)
  {
    if (!v6)
    {
      *(_QWORD *)&result = 1;
      *a3 = 1;
      return result;
    }
    v8 = v4;
    v4 = (int *)a1;
  }
  else
  {
    v8 = (int *)a1;
  }
  v9 = *v4;
  if (*v4 < 1)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = v4[v11];
      v13 = v8[v11];
      v14 = v13 - (v12 + v10);
      v15 = __CFADD__(v12, v10);
      v16 = v12 + v10;
      v17 = v15;
      if (!v15)
        v13 = v14;
      if (__CFADD__(v16, v14))
        v10 = 1;
      else
        v10 = v17;
      *((_DWORD *)a3 + v11) = v13;
      v18 = v11++ < *v4;
    }
    while (v18);
    v9 = *v4;
  }
  LODWORD(v19) = *v8;
  if (v9 < *v8)
  {
    v20 = v9 + 1;
    do
    {
      v21 = v8[v20] - v10;
      v10 = __CFADD__(v10, v21);
      *((_DWORD *)a3 + v20) = v21;
      v19 = *v8;
      v18 = v20++ < v19;
    }
    while (v18);
  }
  v22 = v19;
  v23 = v19 + 1;
  v24 = v19 & ((int)v19 >> 31);
  while ((int)v22 >= 1)
  {
    v25 = *((_DWORD *)a3 + v22--);
    --v23;
    if (v25)
      goto LABEL_29;
  }
  v23 = v24;
LABEL_29:
  *(_DWORD *)a3 = v23;
  return result;
}

uint64_t PubKeyToOctetString(uint64_t a1, unsigned int a2, _DWORD *a3, uint64_t a4)
{
  _DWORD *v8;
  int v9;
  size_t v10;
  _DWORD *v11;
  int v12;
  size_t v13;
  unsigned int v14;
  unsigned int v16;
  _OWORD v17[4];
  _OWORD v18[4];

  memset(v18, 0, 60);
  v8 = *(_DWORD **)a1;
  v9 = 6;
  v10 = 24;
  while (!v8[v9 - 1])
  {
    v10 -= 4;
    if (!--v9)
    {
      LODWORD(v18[0]) = 0;
      goto LABEL_7;
    }
  }
  LODWORD(v18[0]) = v9;
  if (v9 - 1 >= 0)
    memcpy((char *)v18 + 4, v8, v10);
LABEL_7:
  memset(v17, 0, 60);
  v11 = *(_DWORD **)(a1 + 8);
  v12 = 6;
  v13 = 24;
  while (!v11[v12 - 1])
  {
    v13 -= 4;
    if (!--v12)
    {
      LODWORD(v17[0]) = 0;
      goto LABEL_13;
    }
  }
  LODWORD(v17[0]) = v12;
  if (v12 - 1 >= 0)
    memcpy((char *)v17 + 4, v11, v13);
LABEL_13:
  v16 = 0;
  sub_1000118FC(v18, 24, a2, &v16, a4);
  v14 = v16;
  sub_1000118FC(v17, 24, a2, a3, a4 + v16);
  *a3 += v14;
  return 0;
}

uint64_t sub_1000118FC(_DWORD *a1, int a2, unsigned int a3, _DWORD *a4, uint64_t a5)
{
  uint64_t result;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;

  v13 = 0;
  result = sub_100011A34(a1, a3, &v13, a5);
  if (!(_DWORD)result)
  {
    v9 = a2 - v13;
    if (a2 - v13 < 1)
    {
      if (v9 < 0)
        return result;
    }
    else
    {
      v10 = a2 - 1;
      if (a2 - 1 >= v9)
      {
        v11 = v13 - 1;
        do
          *(_BYTE *)(a5 + v10--) = *(_BYTE *)(a5 + v11--);
        while ((int)v10 >= v9);
      }
      v12 = -1;
      do
        *(_BYTE *)(a5 + (v9 + v12--)) = 0;
      while (v9 + (int)v12 + 2 > 1);
    }
    *a4 = a2;
  }
  return result;
}

uint64_t PriKeyToOctetString(void *__src, int a2, unsigned int a3, _DWORD *a4, uint64_t a5)
{
  int v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (a2 >= 1)
    memcpy(v11, __src, 4 * a2);
  v10 = a2;
  sub_100011A34(&v10, a3, a4, a5);
  return 0;
}

uint64_t sub_100011A34(_DWORD *a1, unsigned int a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  unsigned int v7;
  _DWORD *v8;
  _DWORD *v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  _BYTE *v16;
  unsigned int v17;
  int v18;
  uint64_t result;

  v4 = *a1;
  if ((int)v4 >= 1)
  {
    v5 = 0;
    v6 = a2;
    v7 = v4 - 1;
    while (1)
    {
      v8 = &a1[(v4 - 1)];
      v11 = v8[1];
      v9 = v8 + 1;
      v10 = v11;
      if (v4 != *a1)
        break;
      v12 = 4 * v7 + 5;
      v13 = 5;
      v14 = 24;
      do
      {
        --v13;
        --v12;
        if (v13 < 2)
          break;
        v15 = v10 >> v14;
        v14 -= 8;
      }
      while (!v15);
      if (v12 > v6)
        return 5;
      if (v13 >= 1)
        goto LABEL_11;
LABEL_13:
      --v7;
      if (v4-- < 2)
        goto LABEL_17;
    }
    v13 = 4;
LABEL_11:
    v16 = (_BYTE *)(a4 + v5);
    v17 = v13 + 1;
    v18 = 8 * v13 - 8;
    v5 += v13;
    do
    {
      *v16++ = *v9 >> v18;
      --v17;
      v18 -= 8;
    }
    while (v17 > 1);
    goto LABEL_13;
  }
  v5 = 0;
LABEL_17:
  result = 0;
  *a3 = v5;
  return result;
}

uint64_t OctetStringToPriKey(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  int v6;
  _OWORD v8[4];

  memset(v8, 0, 60);
  sub_100011B74(a1, a2, v8);
  v6 = v8[0];
  if (SLODWORD(v8[0]) >= 1)
    memcpy(a3, (char *)v8 + 4, 4 * LODWORD(v8[0]));
  *a4 = v6;
  return 0;
}

uint64_t sub_100011B74(uint64_t result, int a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  int v13;
  int v15;

  if (a2 >= 1)
  {
    v3 = 0;
    v4 = a2;
    v5 = result + a2;
    do
    {
      v6 = 0;
      v7 = 0;
      if (v4 >= 4)
        v8 = 4;
      else
        v8 = v4;
      v9 = v5 - v8;
      if ((int)v4 >= 4)
        v10 = 4;
      else
        v10 = v4;
      do
        v7 = *(unsigned __int8 *)(v9 + v6++) | (v7 << 8);
      while (v6 < v10);
      a3[++v3] = v7;
      v5 -= 4;
      v11 = (int)v4 <= 4;
      v4 -= 4;
    }
    while (!v11);
  }
  v12 = ((unint64_t)a2 + 3) >> 2;
  while ((int)v12 >= 1)
  {
    v13 = v12 - 1;
    if (a3[v12--])
    {
      v15 = v13 + 1;
      goto LABEL_17;
    }
  }
  v15 = 0;
LABEL_17:
  *a3 = v15;
  return result;
}

uint64_t OctetStringToPubKey(uint64_t a1, unsigned int a2, void **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v9[4];
  _OWORD v10[4];

  memset(v10, 0, 60);
  v5 = a2 >> 1;
  memset(v9, 0, 60);
  sub_100011B74(a1, a2 >> 1, v10);
  sub_100011B74(a1 + v5, v5, v9);
  v6 = SLODWORD(v10[0]);
  if (SLODWORD(v10[0]) < 1 || (memcpy(*a3, (char *)v10 + 4, 4 * LODWORD(v10[0])), v6 <= 5))
    bzero((char *)*a3 + 4 * v6, 4 * (5 - v6) + 4);
  v7 = SLODWORD(v9[0]);
  if (SLODWORD(v9[0]) < 1 || (memcpy(a3[1], (char *)v9 + 4, 4 * LODWORD(v9[0])), v7 <= 5))
    bzero((char *)a3[1] + 4 * v7, 4 * (5 - v7) + 4);
  return 0;
}

uint64_t DPrint_string(const char *a1, uint64_t a2, int a3)
{
  uint64_t v5;

  if (a1)
    printf("%s(%d) :\n", a1, a3);
  if (a3 >= 1)
  {
    v5 = 0;
    do
    {
      printf("%02X ", *(unsigned __int8 *)(a2 + v5++));
      if ((v5 & 0xF) == 0)
        putchar(10);
    }
    while (a3 != (_DWORD)v5);
  }
  return putchar(10);
}

uint64_t KTimesPoint(const void *a1, unsigned int *a2, uint64_t *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  int v35;
  _DWORD *v36;
  _BOOL4 v39;
  unsigned int v40;
  _OWORD v41[3];
  uint64_t v42;
  _OWORD v43[4];
  _OWORD v44[4];
  unsigned int v45[16];
  unsigned int v46[16];
  unsigned int v47[16];
  _DWORD v48[16];
  unsigned int v49[16];
  _DWORD v50[16];
  _QWORD v51[8];
  _DWORD v52[34];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _DWORD v57[16];
  unsigned int v58[20];

  memset(v44, 0, 60);
  memset(v43, 0, sizeof(v43));
  v42 = 0;
  memset(v41, 0, sizeof(v41));
  sub_100012260(a3, v43);
  v8 = *a2;
  if ((int)v8 >= 1)
    memcpy(v41, a1, 4 * v8);
  v40 = v8;
  if ((sub_100012304(&v40, &dword_1000234C4) & 0x80000000) == 0)
    return 0;
  memset(v46, 0, 60);
  memset(v45, 0, sizeof(v45));
  if (!(_DWORD)v8 || (_DWORD)v8 == 1 && !LODWORD(v41[0]))
    goto LABEL_56;
  memset(v58, 0, 60);
  v56 = 0uLL;
  memset(v57, 0, sizeof(v57));
  v54 = 0uLL;
  v55 = 0uLL;
  memset(v48, 0, 60);
  v53 = 0;
  *(_QWORD *)&v57[1] = 0x100000001;
  v58[1] = 0;
  if ((int)v8 <= 0)
  {
    v23 = 0;
    v24 = 2 * v8;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *((unsigned int *)v41 + v10);
      do
      {
        v16 = (v15 >> v13) & 3 | v11;
        v11 = dword_10001A284[v16];
        v14 |= dword_10001A2A4[v16] << v12;
        ++v13;
        v12 += 2;
      }
      while (v13 != 16);
      v17 = 0;
      v18 = 0;
      v48[2 * v10 + 1] = v14;
      v19 = 16;
      do
      {
        v20 = (v15 >> v19) & 3 | v11;
        v11 = dword_10001A284[v20];
        v18 |= dword_10001A2A4[v20] << v17;
        ++v19;
        v17 += 2;
      }
      while (v17 != 30);
      v21 = v11 | (v15 >> 31);
      v22 = v10 + 1;
      if (v10 != (_DWORD)v8 - 1)
        v21 |= 2 * (*((unsigned int *)v41 + v22) & 1);
      v11 = dword_10001A284[v21];
      *(_DWORD *)((char *)&v48[1] + ((8 * v10++) | 4)) = v18 | (dword_10001A2A4[v21] << 30);
    }
    while (v22 != v8);
    v23 = (2 * v8);
    v24 = 2 * v8;
    if (((0x17uLL >> v21) & 1) == 0)
    {
      v25 = 1;
      goto LABEL_21;
    }
  }
  v25 = 0;
LABEL_21:
  v48[v23 + 1] = v25;
  v26 = v24 | 1u;
  v27 = v26 & (v24 >> 31);
  v28 = v26 + 1;
  while ((int)v26 >= 1)
  {
    v29 = v48[v26--];
    --v28;
    if (v29)
      goto LABEL_26;
  }
  v28 = v27;
LABEL_26:
  memset(v52, 0, 124);
  v48[0] = v28;
  v30 = DWORD1(v43[0]);
  v52[1] = DWORD1(v43[0]);
  if (SDWORD1(v43[0]) >= 1)
    memcpy(&v52[2], (char *)v43 + 8, 4 * DWORD1(v43[0]));
  v52[16] = v44[0];
  if (SLODWORD(v44[0]) >= 1)
    memcpy(&v52[17], (char *)v44 + 4, 4 * LODWORD(v44[0]));
  memset(v50, 0, sizeof(v50));
  memset(v51, 0, 60);
  v50[1] = v30;
  if ((int)v30 >= 1)
    memcpy(&v50[2], (char *)v43 + 8, 4 * v30);
  FpMinus((int *)v44, (unsigned int *)dword_100023358, v51);
  if (v28 < 1)
    goto LABEL_56;
  v31 = (v28 - 1);
  do
  {
    v32 = v48[v31 + 1];
    v33 = 32;
    if (v31 != v28 - 1 || v32 >> 30)
      goto LABEL_38;
    do
    {
      v34 = v32 >> 28;
      v32 *= 4;
      v33 -= 2;
    }
    while (!v34);
    if (v33 >= 1)
    {
LABEL_38:
      v35 = v33 + 2;
      while (1)
      {
        sub_1000147AC((unsigned int *)&v53, &v53);
        if (v32 >> 30 == 1)
          break;
        if (v32 >> 30 == 3)
        {
          v36 = v50;
LABEL_43:
          sub_100014C34((unsigned int *)&v53, (uint64_t)v36, (uint64_t)&v53);
        }
        v32 *= 4;
        v35 -= 2;
        if (v35 <= 2)
          goto LABEL_45;
      }
      v36 = v52;
      goto LABEL_43;
    }
LABEL_45:
    ;
  }
  while (v31-- > 0);
  v39 = v58[0] == 1 && v58[1] == 0;
  if (v58[0] && !v39)
  {
    memset(v49, 0, 60);
    memset(v47, 0, 60);
    v45[0] = 0;
    sub_1000130BC(v58, (unsigned int *)dword_100023358, v49);
    sub_100012E74(v49, v49, dword_100023358, v47);
    sub_100012E74((unsigned int *)&v53, v47, dword_100023358, &v45[1]);
    sub_100012E74(v47, v49, dword_100023358, v49);
    sub_100012E74(&v57[1], v49, dword_100023358, v46);
    goto LABEL_57;
  }
LABEL_56:
  v45[0] = 1;
LABEL_57:
  sub_100012378(v45, a5);
  return 1;
}

uint64_t *sub_100012260(uint64_t *result, _DWORD *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;

  v2 = *result;
  v3 = 6;
  while (1)
  {
    v4 = (v3 - 1);
    v5 = *(_DWORD *)(v2 + 4 * v4);
    if (v5)
      break;
    if (!--v3)
    {
      a2[1] = 0;
      goto LABEL_7;
    }
  }
  a2[1] = v3;
  if (v3 - 1 >= 0)
  {
    do
    {
      a2[v4 + 2] = *(_DWORD *)(v2 + 4 * v4);
      --v4;
    }
    while (v4 != -1);
  }
LABEL_7:
  v6 = result[1];
  v7 = 6;
  while (1)
  {
    v8 = (v7 - 1);
    v9 = *(_DWORD *)(v6 + 4 * v8);
    if (v9)
      break;
    if (!--v7)
    {
      a2[16] = 0;
      goto LABEL_13;
    }
  }
  a2[16] = v7;
  if (v7 - 1 >= 0)
  {
    do
    {
      a2[v8 + 17] = *(_DWORD *)(v6 + 4 * v8);
      --v8;
    }
    while (v8 != -1);
  }
LABEL_13:
  *a2 = (v5 | v9) == 0;
  return result;
}

uint64_t sub_100012304(unsigned int *a1, int *a2)
{
  uint64_t v2;
  int v3;
  unsigned int v5;
  unsigned int v6;

  v2 = *a1;
  v3 = *a2;
  if ((int)v2 > *a2)
    return (_DWORD)v2 != 1 || a1[1];
  if ((int)v2 >= v3)
  {
    while ((int)v2 >= 1)
    {
      v5 = a1[v2];
      v6 = a2[v2];
      if (v5 > v6)
        return 1;
      --v2;
      if (v5 < v6)
        return 0xFFFFFFFFLL;
    }
    return 0;
  }
  if (v3 == 1 && !a2[1])
    return 0;
  return 0xFFFFFFFFLL;
}

void sub_100012378(_DWORD *a1, _QWORD *a2)
{
  int v4;
  _DWORD *v5;
  int *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  int *v12;
  int v13;

  if (*a1 == 1)
  {
    v4 = 0;
    a1[1] = 0;
    a1[16] = 0;
LABEL_7:
    bzero((void *)(*a2 + 4 * v4), 4 * (5 - v4) + 4);
    goto LABEL_8;
  }
  v4 = a1[1];
  if (v4 < 1)
    goto LABEL_7;
  v5 = (_DWORD *)*a2;
  v6 = a1 + 2;
  v7 = a1[1];
  do
  {
    v8 = *v6++;
    *v5++ = v8;
    --v7;
  }
  while (v7);
  if (v4 <= 5)
    goto LABEL_7;
LABEL_8:
  v9 = a1[16];
  v10 = (int)v9;
  if ((int)v9 < 1)
    goto LABEL_12;
  v11 = (_DWORD *)a2[1];
  v12 = a1 + 17;
  do
  {
    v13 = *v12++;
    *v11++ = v13;
    --v9;
  }
  while (v9);
  if ((int)v10 <= 5)
LABEL_12:
    bzero((void *)(a2[1] + 4 * v10), 4 * (5 - v10) + 4);
}

uint64_t Sign_With_Private_Key(uint64_t a1, char *__src, unsigned int a3, void *a4, int a5)
{
  __int128 v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  _OWORD v22[2];
  _OWORD v23[2];
  _OWORD v24[2];
  _BYTE v25[28];
  int v26;
  _BYTE v27[48];
  uint64_t v28;
  _OWORD v29[8];
  _OWORD v30[4];
  _OWORD v31[4];
  _OWORD v32[4];
  _OWORD v33[4];
  _OWORD v34[4];
  unsigned int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v8 = 0uLL;
  memset(v34, 0, 60);
  memset(v33, 0, 60);
  memset(v32, 0, 60);
  memset(v31, 0, 60);
  memset(v30, 0, 60);
  memset(v29, 0, 124);
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  v26 = a5;
  if (a5 >= 1)
  {
    memcpy(v27, a4, 4 * a5);
    v8 = 0uLL;
  }
  *(_OWORD *)&v25[12] = v8;
  v24[1] = v8;
  *(_OWORD *)v25 = v8;
  v24[0] = v8;
  v22[0] = v8;
  v22[1] = v8;
  v23[0] = v8;
  *(_OWORD *)((char *)v23 + 12) = v8;
  sub_100012724(__src, a3, v24);
  sub_10001287C((unsigned int *)v24, (int *)dword_1000234C4, v22);
  LODWORD(v24[0]) = v22[0];
  if (SLODWORD(v22[0]) >= 1)
    memcpy((char *)v24 + 4, (char *)v22 + 4, 4 * LODWORD(v22[0]));
  while (1)
  {
    v39 = 0;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v35 = dword_1000234C4[0];
    v9 = time(0);
    srand(v9);
    if ((int)dword_1000234C4[0] >= 1)
    {
      v10 = 0;
      do
      {
        v11 = 0;
        v12 = 1;
        do
        {
          v13 = rand();
          v14 = dword_100027374++;
          v12 |= (v14 + v13 + 2 * v14 + (v14 >> 1)) << v11;
          v11 += 11;
        }
        while (v11 != 33);
        *(&v35 + ++v10) = v12;
      }
      while (v10 < (int)dword_1000234C4[0]);
    }
    sub_10001287C(&v35, (int *)dword_1000234C4, v34);
    sub_100012C50((unsigned int *)v34, v29);
    sub_10001287C((unsigned int *)v29 + 1, (int *)dword_1000234C4, v32);
    v16 = LODWORD(v32[0]) == 1 && DWORD1(v32[0]) == 0;
    if (LODWORD(v32[0]) && !v16)
    {
      sub_100012E74((unsigned int *)&v26, (unsigned int *)v32, (int *)dword_1000234C4, (unsigned int *)v33);
      sub_100013034((int *)v33, (int *)v24, (int *)dword_1000234C4, v31);
      sub_1000130BC((unsigned int *)v34, dword_1000234C4, v33);
      sub_100012E74((unsigned int *)v33, (unsigned int *)v31, (int *)dword_1000234C4, (unsigned int *)v30);
      v17 = LODWORD(v30[0]) == 1 && DWORD1(v30[0]) == 0;
      v18 = v17;
      if (LODWORD(v30[0]) && !v18)
        break;
    }
  }
  v19 = dword_100023358[0];
  v20 = (4 * dword_100023358[0]);
  sub_1000118FC(v32, 4 * dword_100023358[0], 0x64u, &v35, a1);
  sub_1000118FC(v30, v20, 0x64u, &v35, a1 + v20);
  return (8 * v19);
}

char *sub_100012724(char *__src, unsigned int a2, _DWORD *a3)
{
  unsigned int i;
  int v6;
  char *result;
  uint64_t v8;
  uint64_t v9;
  int8x16_t v10;
  _OWORD v11[6];
  unsigned int v12;
  int __srca;
  char v14;
  char v15;
  char v16;
  char v17;

  memset(&v11[2], 0, 64);
  v11[0] = xmmword_10001A1B0;
  v11[1] = xmmword_10001A1C0;
  v12 = 0;
  sub_100015284((char *)v11, __src, a2);
  LOBYTE(__srca) = 0x80;
  sub_100015284((char *)v11, (char *)&__srca, 1u);
  for (i = v12; v12 != 56; i = v12)
  {
    if (i <= 0x38)
      v6 = 56;
    else
      v6 = 64;
    sub_100015284((char *)v11, byte_10002733C, v6 - i);
  }
  v17 = 8 * a2;
  v16 = a2 >> 5;
  v15 = a2 >> 13;
  v14 = a2 >> 21;
  __srca = 0;
  result = sub_100015284((char *)v11, (char *)&__srca, 8u);
  v8 = 1;
  v9 = 1;
  do
  {
    v10 = (int8x16_t)vrev64q_s32((int32x4_t)v11[v8]);
    *(int8x16_t *)&a3[v9] = vextq_s8(v10, v10, 8uLL);
    --v8;
    v9 += 4;
  }
  while (v8 != -1);
  *a3 = 8;
  return result;
}

uint64_t sub_10001287C(unsigned int *a1, int *a2, _DWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t result;
  uint64_t v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  int *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  char v24;
  _DWORD *v25;
  unsigned int v26;
  int *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  int *v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  _DWORD *v36;
  _DWORD *v37;
  int v38;
  unsigned int v39;
  unsigned int *v40;
  _DWORD *v41;
  uint64_t v42;
  unsigned int v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int i;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  BOOL v56;
  int v57;
  int v58;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  int v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  int v71;
  unsigned int v72;

  v6 = *a1;
  v7 = v6 & ((int)v6 >> 31);
  v8 = v6 + 1;
  while ((int)v6 >= 1)
  {
    v9 = a1[v6--];
    --v8;
    if (v9)
      goto LABEL_6;
  }
  v8 = v7;
LABEL_6:
  *a1 = v8;
  v10 = *a2;
  v11 = v10 & ((int)v10 >> 31);
  v12 = v10 + 1;
  while ((int)v10 >= 1)
  {
    v13 = a2[v10--];
    --v12;
    if (v13)
      goto LABEL_11;
  }
  v12 = v11;
LABEL_11:
  *a2 = v12;
  result = sub_100012304(a1, a2);
  v15 = *a1;
  *a3 = v15;
  v16 = *a1;
  if ((result & 0x80000000) != 0)
  {
    if (v16 >= 1)
    {
      v23 = 1;
      do
      {
        a3[v23] = a1[v23];
        v18 = v23++ < (int)*a1;
      }
      while (v18);
    }
    return result;
  }
  if (v16 >= 1)
  {
    v17 = 1;
    do
    {
      a3[v17] = a1[v17];
      v18 = v17++ < (int)*a1;
    }
    while (v18);
  }
  v19 = a2 + 1;
  v20 = a2[*a2];
  if (v20)
  {
    v21 = 0;
    do
    {
      v22 = v21++;
      if (v22 > 0x1E)
        break;
      v18 = v20 > 1;
      v20 >>= 1;
    }
    while (v18);
  }
  else
  {
    v21 = 0;
  }
  v24 = 32 - v21;
  v25 = a3 + 1;
  if (v21 != 32 && (_DWORD)v15)
  {
    v26 = 0;
    v27 = a3 + 1;
    v28 = v15;
    do
    {
      v29 = *v27;
      *v27 = (*v27 << v24) | v26;
      ++v27;
      v26 = v29 >> v21;
      --v28;
    }
    while (v28);
    v25[v15] = v26;
    if (!v26)
      goto LABEL_32;
    v15 = (v15 + 1);
  }
  v25[v15] = 0;
LABEL_32:
  v30 = *a2;
  if (v21 != 32 && (_DWORD)v30)
  {
    v31 = 0;
    v32 = a2 + 1;
    v33 = *a2;
    do
    {
      v34 = *v32;
      *v32 = (*v32 << v24) | v31;
      ++v32;
      v31 = v34 >> v21;
      --v33;
    }
    while (v33);
  }
  v70 = (v30 - 1);
  v35 = v15 - v30;
  if ((int)v15 - (int)v30 >= 0)
  {
    v71 = v19[v70];
    v72 = 0;
    v36 = &a3[v35];
    v37 = v36 + 1;
    do
    {
      if (v71 == -1)
        v72 = v25[(v30 + v35)];
      else
        result = (uint64_t)sub_1000155B4((int *)&v72, &v25[(v70 + v35)], v71 + 1);
      v38 = 0;
      if ((_DWORD)v30)
      {
        v39 = v72;
        v40 = (unsigned int *)(a2 + 1);
        v41 = v37;
        v42 = v30;
        do
        {
          v43 = *v40++;
          v44 = v43 * (unint64_t)v39;
          v45 = HIDWORD(v44);
          v56 = __CFADD__(v38, (_DWORD)v44);
          v46 = v38 + v44;
          v47 = v56;
          v48 = *v41 - v46;
          *v41++ = v48;
          v38 = v45 + __CFADD__(v46, v48) + v47;
          --v42;
        }
        while (v42);
      }
      v49 = (v30 + v35);
      for (i = v25[v49] - v38; ; i -= v52)
      {
        v25[v49] = i;
        if (!i)
          break;
LABEL_49:
        if ((_DWORD)v30)
        {
          v51 = 0;
          v52 = 0;
          do
          {
            v53 = v19[v51];
            v54 = v37[v51];
            v55 = v54 - (v53 + v52);
            v56 = __CFADD__(v53, v52);
            v57 = v53 + v52;
            v58 = v56;
            if (!v56)
              v54 = v55;
            if (__CFADD__(v57, v55))
              v52 = 1;
            else
              v52 = v58;
            v37[v51++] = v54;
          }
          while (v30 != v51);
          i = v25[v49];
        }
        else
        {
          v52 = 0;
        }
      }
      v59 = v30;
      do
      {
        if ((int)v59 < 1)
          goto LABEL_49;
        v60 = v36[v59];
        v61 = a2[v59];
        if (v60 > v61)
          goto LABEL_49;
        --v59;
      }
      while (v60 >= v61);
      --v37;
      --v36;
      v18 = v35-- <= 0;
    }
    while (!v18);
  }
  if (v21 != 32 && (v70 & 0x80000000) == 0)
  {
    v62 = 0;
    v63 = 4 * v70 + 4;
    do
    {
      v64 = *(int *)((char *)a2 + v63);
      *(int *)((char *)a2 + v63) = (v64 >> v24) | v62;
      v62 = v64 << v21;
      v63 -= 4;
    }
    while (v63);
    v65 = 4 * v70 + 4;
    do
    {
      v66 = *(_DWORD *)((char *)a3 + v65);
      *(_DWORD *)((char *)a3 + v65) = (v66 >> v24) | v63;
      LODWORD(v63) = v66 << v21;
      v65 -= 4;
    }
    while (v65);
  }
  v67 = v30 & ((int)v30 >> 31);
  v68 = v30 + 1;
  while ((int)v30 >= 1)
  {
    v69 = a3[v30--];
    --v68;
    if (v69)
      goto LABEL_81;
  }
  v68 = v67;
LABEL_81:
  *a3 = v68;
  return result;
}

void sub_100012C50(unsigned int *a1, _DWORD *a2)
{
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  _BOOL4 v16;
  _OWORD v17[4];
  _OWORD v18[4];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned int v23[16];
  _QWORD v24[2];
  __int128 v25;
  _BYTE v26[28];

  if (!*a1 || *a1 == 1 && !a1[1])
    goto LABEL_25;
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  v24[1] = 0;
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  v20 = 0u;
  v21 = 0u;
  v19 = 0;
  *(_QWORD *)&v23[1] = 0x100000001;
  v4 = (char *)&unk_10002353C + 124 * (1 << dword_100023358);
  v5 = 16;
  v24[0] = 0;
  do
  {
    sub_1000147AC((unsigned int *)&v19, &v19);
    v6 = *a1;
    if ((int)v6 >= 1)
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = a1[v7 + 1];
        v11 = v10 << (32 - v5) >> 31;
        v12 = v10 << (16 - v5) >> 31;
        if (v7)
        {
          v13 = v7;
          do
          {
            v11 *= 2;
            v12 *= 2;
            --v13;
          }
          while (v13);
        }
        v9 += v11;
        v8 += v12;
        ++v7;
      }
      while (v7 != v6);
      if (v9)
        sub_100014C34((unsigned int *)&v19, (uint64_t)&unk_10002353C + 124 * v9, (uint64_t)&v19);
      if (v8)
        sub_100014C34((unsigned int *)&v19, (uint64_t)&v4[124 * v8], (uint64_t)&v19);
    }
    v14 = v5-- != 0;
  }
  while (v5 != 0 && v14);
  v15 = LODWORD(v24[0]) == 1 && HIDWORD(v24[0]) == 0;
  v16 = v15;
  if (LODWORD(v24[0]) && !v16)
  {
    memset(v18, 0, 60);
    memset(v17, 0, 60);
    *a2 = 0;
    sub_1000130BC((unsigned int *)v24, (unsigned int *)&dword_100023358, v18);
    sub_100012E74((unsigned int *)v18, (unsigned int *)v18, &dword_100023358, (unsigned int *)v17);
    sub_100012E74((unsigned int *)&v19, (unsigned int *)v17, &dword_100023358, a2 + 1);
    sub_100012E74((unsigned int *)v17, (unsigned int *)v18, &dword_100023358, (unsigned int *)v18);
    sub_100012E74(&v23[1], (unsigned int *)v18, &dword_100023358, a2 + 16);
  }
  else
  {
LABEL_25:
    *a2 = 1;
  }
}

unsigned int *sub_100012E74(unsigned int *result, unsigned int *a2, int *a3, unsigned int *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int *v11;
  _OWORD *v12;
  int v13;
  unsigned int v14;
  unsigned int *v15;
  _DWORD *v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  _OWORD v28[3];
  int v29;

  v5 = *result;
  if ((_DWORD)v5 && ((_DWORD)v5 != 1 || result[1]) && (v7 = *a2, (_DWORD)v7) && ((_DWORD)v7 != 1 || a2[1]))
  {
    v29 = 0;
    memset(v28, 0, sizeof(v28));
    v8 = (v7 + v5);
    if ((int)v5 >= 1)
    {
      v9 = 0;
      v10 = result + 1;
      v11 = a2 + 1;
      v12 = v28;
      do
      {
        v13 = 0;
        v14 = v10[v9];
        v15 = v11;
        v16 = v12;
        v17 = v7;
        do
        {
          v18 = *v15++;
          v19 = v18 * (unint64_t)v14;
          v20 = __CFADD__(*v16, v13);
          v21 = *v16 + v13;
          v22 = v20;
          if (v20)
            v23 = 2;
          else
            v23 = 1;
          *v16++ = v21 + v19;
          if (__CFADD__(v21, (_DWORD)v19))
            v24 = v23;
          else
            v24 = v22;
          v13 = v24 + HIDWORD(v19);
          --v17;
        }
        while (v17);
        *((_DWORD *)v28 + v9 + (int)v7) += v13;
        ++v9;
        v12 = (_OWORD *)((char *)v12 + 4);
      }
      while (v9 != v5);
    }
    if ((int)v8 >= 1)
      memcpy(a4 + 1, v28, 4 * (v8 - 1) + 4);
    v25 = v8 & ((int)v8 >> 31);
    v26 = v7 + v5 + 1;
    while ((int)v8 >= 1)
    {
      v27 = a4[v8--];
      --v26;
      if (v27)
        goto LABEL_29;
    }
    v26 = v25;
LABEL_29:
    *a4 = v26;
    return (unsigned int *)sub_10001287C(a4, a3, a4);
  }
  else
  {
    *(_QWORD *)a4 = 0;
  }
  return result;
}

void sub_100013034(int *a1, int *a2, int *a3, _QWORD *a4)
{
  uint64_t v6;
  _OWORD v7[4];

  memset(v7, 0, 60);
  sub_100015164(a1, a2, (int *)v7);
  if ((sub_100012304((unsigned int *)v7, a3) & 0x80000000) != 0)
  {
    v6 = LODWORD(v7[0]);
    *(_DWORD *)a4 = v7[0];
    if ((int)v6 >= 1)
      memcpy((char *)a4 + 4, (char *)v7 + 4, 4 * v6);
  }
  else
  {
    sub_1000116B0((unsigned int *)v7, a3, a4);
  }
}

void sub_1000130BC(unsigned int *a1, unsigned int *a2, _DWORD *a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  int v21;
  int v22;
  char v23;
  uint64_t v24;
  unsigned int v25;
  int *v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int *v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int *v38;
  uint64_t v39;
  unsigned int v40;
  int v41;
  unsigned int *v42;
  _DWORD *v43;
  uint64_t v44;
  unsigned int v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  int i;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  BOOL v58;
  int v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  int *v78;
  int v79;
  unsigned int v80;
  unsigned int *v81;
  int *v82;
  uint64_t v83;
  unsigned int v84;
  unint64_t v85;
  BOOL v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  _QWORD *v94;
  char v95;
  unsigned int v96;
  int v97;
  int v98;
  int v99;
  unsigned int v100;
  uint64_t v101;
  int v102;
  _BYTE v103[60];
  int v104[13];
  _OWORD v105[3];
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  int v111;
  int v112;
  _BYTE v113[48];
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  int v119;
  _OWORD v120[4];
  _OWORD v121[4];
  _OWORD v122[4];
  int __src[13];

  v5 = 0uLL;
  memset(v122, 0, 60);
  memset(v121, 0, 60);
  memset(v120, 0, 60);
  v114 = 0;
  memset(v113, 0, sizeof(v113));
  v111 = 0;
  v110 = 0u;
  v109 = 0u;
  v108 = 0u;
  memset(v103, 0, sizeof(v103));
  v115 = 0x100000001;
  v107 = 0;
  v6 = *a1;
  v112 = v6;
  if ((int)v6 >= 1)
  {
    memcpy(v113, a1 + 1, 4 * v6);
    v5 = 0uLL;
  }
  v119 = 0;
  v117 = v5;
  v118 = v5;
  v116 = v5;
  v105[0] = v5;
  v105[1] = v5;
  v105[2] = v5;
  v106 = 0;
  v7 = *a2;
  v104[0] = v7;
  if ((int)v7 < 1)
  {
    if (!(_DWORD)v7)
    {
      v22 = 1;
      *a3 = 1;
LABEL_131:
      memcpy(a3 + 1, (char *)&v115 + 4, 4 * v22);
      return;
    }
  }
  else
  {
    memcpy(v105, a2 + 1, 4 * v7);
  }
  v94 = a3;
  v8 = 0;
  v9 = 1;
  v10 = -1;
  do
  {
    v97 = v9;
    v98 = v10;
    v11 = v6 + 1;
    v12 = v6;
    while ((int)v12 >= 1)
    {
      v13 = *(_DWORD *)&v113[4 * v12-- - 4];
      --v11;
      if (v13)
        goto LABEL_12;
    }
    v11 = v6 & ((int)v6 >> 31);
LABEL_12:
    v99 = v8;
    v112 = v11;
    v14 = v7;
    v15 = v7 + 1;
    while ((int)v14 >= 1)
    {
      v16 = v104[v14--];
      --v15;
      if (v16)
        goto LABEL_17;
    }
    v15 = v7 & ((int)v7 >> 31);
LABEL_17:
    v104[0] = v15;
    if ((sub_100012304((unsigned int *)&v112, v104) & 0x80000000) != 0)
    {
      *(_QWORD *)&v122[0] = 0;
      LODWORD(v120[0]) = v11;
      if ((int)v11 >= 1)
        memcpy((char *)v120 + 4, v113, 4 * v11);
      v21 = 0;
      LODWORD(v7) = v11;
      v22 = v99;
      v9 = v98;
      goto LABEL_91;
    }
    LODWORD(v120[0]) = v11;
    if ((int)v11 >= 1)
      memcpy((char *)v120 + 4, v113, 4 * v11);
    v101 = v15 - 1;
    v17 = v104[v101 + 1];
    if (v17)
    {
      v18 = 0;
      do
      {
        v19 = v18++;
        if (v19 > 0x1E)
          break;
        v20 = v17 > 1;
        v17 >>= 1;
      }
      while (v20);
    }
    else
    {
      v18 = 0;
    }
    v23 = 32 - v18;
    v24 = v11;
    if (v18 != 32 && v11)
    {
      v25 = 0;
      v26 = (int *)v120 + 1;
      v27 = v11;
      do
      {
        v28 = *v26;
        *v26 = (*v26 << v23) | v25;
        ++v26;
        v25 = v28 >> v18;
        --v27;
      }
      while (v27);
      *((_DWORD *)v120 + v11 + 1) = v25;
      if (!v25)
        goto LABEL_36;
      v24 = ++v11;
    }
    *((_DWORD *)v120 + v24 + 1) = 0;
LABEL_36:
    if (v15 && v18 != 32)
    {
      v29 = 0;
      v30 = v15;
      v31 = (int *)v105;
      do
      {
        v32 = *v31;
        *v31 = (*v31 << v23) | v29;
        ++v31;
        v29 = v32 >> v18;
        --v30;
      }
      while (v30);
    }
    v95 = 32 - v18;
    v96 = v11 - v15;
    if ((int)(v11 - v15) >= 0)
    {
      v33 = *((_DWORD *)v105 + v101);
      __src[0] = 0;
      v102 = v33;
      v100 = v33 + 1;
      v34 = v15;
      v35 = v11 - v15;
      v36 = (char *)v120 + 4 * v96 + 4;
      v37 = (char *)v120 + 4 * v96;
      do
      {
        if (v102 == -1)
        {
          v38 = (int *)v120 + (v15 + v35) + 1;
        }
        else
        {
          v38 = __src;
          v39 = v34;
          sub_1000155B4(__src, (int *)v120 + (v101 + v35) + 1, v100);
          v34 = v39;
        }
        v40 = *v38;
        v41 = 0;
        if (v15)
        {
          v42 = (unsigned int *)v105;
          v43 = v36;
          v44 = v34;
          do
          {
            v45 = *v42++;
            v46 = v45 * (unint64_t)v40;
            v47 = HIDWORD(v46);
            v58 = __CFADD__(v41, (_DWORD)v46);
            v48 = v41 + v46;
            v49 = v58;
            v50 = *v43 - v48;
            *v43++ = v50;
            v41 = v47 + __CFADD__(v48, v50) + v49;
            --v44;
          }
          while (v44);
        }
        v51 = (v15 + v35);
        for (i = *((_DWORD *)v120 + v51 + 1) - v41; ; i -= v54)
        {
          *((_DWORD *)v120 + v51 + 1) = i;
          if (!i)
            break;
LABEL_53:
          if (v15)
          {
            v53 = 0;
            v54 = 0;
            do
            {
              v55 = *(_DWORD *)((char *)v105 + v53);
              v56 = *(_DWORD *)&v36[v53];
              v57 = v56 - (v55 + v54);
              v58 = __CFADD__(v55, v54);
              v59 = v55 + v54;
              v60 = v58;
              if (!v58)
                v56 = v57;
              if (__CFADD__(v59, v57))
                v54 = 1;
              else
                v54 = v60;
              *(_DWORD *)&v36[v53] = v56;
              v53 += 4;
            }
            while (4 * v15 != v53);
            i = *((_DWORD *)v120 + v51 + 1);
          }
          else
          {
            v54 = 0;
          }
          ++v40;
        }
        v61 = v34;
        do
        {
          if ((int)v61 < 1)
            goto LABEL_53;
          v62 = *(_DWORD *)&v37[4 * v61];
          v63 = v104[v61];
          if (v62 > v63)
            goto LABEL_53;
          --v61;
        }
        while (v62 >= v63);
        *((_DWORD *)v122 + v35 + 1) = v40;
        __src[0] = v40;
        v36 -= 4;
        v37 -= 4;
        v20 = (int)v35-- <= 0;
      }
      while (!v20);
    }
    v9 = v98;
    if (v15 >= 1 && v18 != 32)
    {
      v64 = 0;
      v65 = 4 * v101 + 4;
      v66 = v65;
      do
      {
        v67 = *(int *)((char *)v104 + v66);
        *(int *)((char *)v104 + v66) = (v67 >> v95) | v64;
        v64 = v67 << v18;
        v66 -= 4;
      }
      while (v66);
      v68 = 0;
      do
      {
        v69 = *(_DWORD *)((char *)v120 + v65);
        *(_DWORD *)((char *)v120 + v65) = (v69 >> v95) | v68;
        v68 = v69 << v18;
        v65 -= 4;
      }
      while (v65);
    }
    v70 = v15;
    LODWORD(v7) = v15 + 1;
    v71 = v15 & (v15 >> 31);
    v22 = v99;
    while ((int)v70 >= 1)
    {
      v72 = *((_DWORD *)v120 + v70--);
      LODWORD(v7) = v7 - 1;
      if (v72)
        goto LABEL_85;
    }
    LODWORD(v7) = v71;
LABEL_85:
    LODWORD(v120[0]) = v7;
    v73 = v96 + 1;
    v74 = v73 & ((int)v73 >> 31);
    v21 = v96 + 2;
    while ((int)v73 >= 1)
    {
      v75 = *((_DWORD *)v122 + v73--);
      --v21;
      if (v75)
        goto LABEL_90;
    }
    v21 = v74;
LABEL_90:
    LODWORD(v122[0]) = v21;
LABEL_91:
    v76 = (v22 + v21);
    if ((int)v76 <= 13)
    {
      if ((int)v76 >= 1)
        bzero(__src, 4 * (v76 - 1) + 4);
      if (v21 >= 1)
      {
        v77 = 0;
        v78 = __src;
        do
        {
          v79 = 0;
          if (v22)
          {
            v80 = *((_DWORD *)v122 + v77 + 1);
            v81 = (unsigned int *)&v107 + 1;
            v82 = v78;
            v83 = v22;
            do
            {
              v84 = *v81++;
              v85 = v84 * (unint64_t)v80;
              v86 = __CFADD__(*v82, v79);
              v87 = *v82 + v79;
              v88 = v86;
              if (v86)
                v89 = 2;
              else
                v89 = 1;
              *v82++ = v87 + v85;
              if (__CFADD__(v87, (_DWORD)v85))
                v90 = v89;
              else
                v90 = v88;
              v79 = v90 + HIDWORD(v85);
              --v83;
            }
            while (v83);
          }
          __src[v77 + v22] += v79;
          ++v77;
          ++v78;
        }
        while (v77 != v21);
      }
      if ((int)v76 >= 1)
        memcpy(&v103[4], __src, 4 * (v76 - 1) + 4);
      v91 = v76 & ((int)v76 >> 31);
      v92 = v21 + v22 + 1;
      while ((int)v76 >= 1)
      {
        v93 = *(_DWORD *)&v103[4 * v76--];
        --v92;
        if (v93)
          goto LABEL_116;
      }
      v92 = v91;
LABEL_116:
      *(_DWORD *)v103 = v92;
    }
    sub_100015164((int *)&v115, (int *)v103, (int *)v121);
    LODWORD(v115) = v22;
    if (v22 >= 1)
      memcpy((char *)&v115 + 4, (char *)&v107 + 4, 4 * v22);
    v8 = v121[0];
    if (SLODWORD(v121[0]) >= 1)
      memcpy((char *)&v107 + 4, (char *)v121 + 4, 4 * LODWORD(v121[0]));
    LODWORD(v6) = v104[0];
    v112 = v104[0];
    if (v104[0] >= 1)
      memcpy(v113, v105, 4 * v104[0]);
    v104[0] = v7;
    if ((int)v7 >= 1)
      memcpy(v105, (char *)v120 + 4, 4 * v7);
    v10 = v97;
  }
  while ((_DWORD)v7);
  if (v9 < 0)
  {
    sub_1000116B0(a2, (int *)&v115, v94);
    return;
  }
  a3 = v94;
  *(_DWORD *)v94 = v22;
  if (v22 >= 1)
    goto LABEL_131;
}

BOOL Verify_With_Public_Key(char *a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  int v16;
  int v17;
  BOOL v18;
  int v20;
  char v21;
  int v22;
  int v24;
  int v25;
  int v26;
  BOOL v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  BOOL v36;
  int v37;
  int v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v44;
  uint64_t v45;
  int *v46;
  unsigned int v47;
  _OWORD v49[4];
  _OWORD v50[8];
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[4];
  _OWORD v56[4];
  _OWORD v57[4];
  _OWORD v58[4];
  uint64_t v59[2];
  _BYTE __dst[120];
  _QWORD v61[9];
  _OWORD v62[4];
  _OWORD v63[20];

  v59[0] = a5;
  v59[1] = a6;
  memset(v53, 0, 60);
  memset(v52, 0, 60);
  memset(v50, 0, 60);
  memset(&v49[1], 0, 48);
  if (a4 >= 0)
    v9 = a4;
  else
    v9 = a4 + 1;
  v10 = v9 >> 1;
  v49[0] = 0uLL;
  sub_100012260(v59, v49);
  sub_100012724(a1, a2, v53);
  sub_10001287C((unsigned int *)v53, (int *)dword_1000234C4, v52);
  LODWORD(v53[0]) = v52[0];
  if (SLODWORD(v52[0]) >= 1)
    memcpy((char *)v53 + 4, (char *)v52 + 4, 4 * LODWORD(v52[0]));
  memset(v58, 0, 60);
  memset(v57, 0, 60);
  memset(v56, 0, 60);
  memset(v55, 0, 60);
  memset(v54, 0, 60);
  sub_100011B74(a3, v10, v54);
  sub_100011B74(a3 + v10, v10, v55);
  sub_1000130BC((unsigned int *)v55, dword_1000234C4, v58);
  sub_100012E74((unsigned int *)v53, (unsigned int *)v58, (int *)dword_1000234C4, (unsigned int *)v57);
  sub_100012E74((unsigned int *)v54, (unsigned int *)v58, (int *)dword_1000234C4, (unsigned int *)v56);
  memset(__dst, 0, 56);
  v11 = LODWORD(v57[0]);
  if (SLODWORD(v57[0]) >= 1)
    memcpy(__dst, (char *)v57 + 4, 4 * LODWORD(v57[0]));
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 1;
  v17 = v11;
  if ((_DWORD)v11)
    goto LABEL_16;
  while (1)
  {
    v18 = !LODWORD(v56[0]) && v14 == 0;
    if (v18 && v15 == 0)
      break;
    do
    {
LABEL_16:
      v20 = (v14 + BYTE4(v57[0])) & 7;
      v21 = v15 + BYTE4(v56[0]);
      if (((v14 + BYTE4(v57[0])) & 1) != 0)
      {
        v22 = (v14 + BYTE4(v57[0])) & 3;
        if ((v21 & 3) == 2 && (v20 == 5 || v20 == 3))
          v22 = ((_BYTE)v20 + 2) & 3;
      }
      else
      {
        v22 = 0;
      }
      v24 = v21 & 7;
      if ((v24 & 1) != 0)
      {
        v26 = v24 & 3;
        v27 = v24 == 5 || v24 == 3;
        v28 = ((_BYTE)v24 + 2) & 3;
        if (!v27)
          v28 = v26;
        if (((v14 + BYTE4(v57[0])) & 3) == 2)
          v25 = v28;
        else
          v25 = v26;
      }
      else
      {
        v25 = 0;
      }
      v29 = v22 + 1;
      v30 = v25 + 1;
      *((_BYTE *)&v63[4] + v13 + 6) = 3 * (v29 >> 1) + (v30 >> 1);
      if ((v29 & 3) == 2 * v14)
        v14 = 1 - v14;
      if ((v30 & 3) == 2 * v15)
        v15 = 1 - v15;
      if (*((_DWORD *)v57 + v17) == 1)
        LODWORD(v57[0]) = v17 - 1;
      if (v17 >= 1)
      {
        v31 = 0;
        v32 = 4 * (v17 - 1) + 4;
        do
        {
          HIDWORD(v33) = v31;
          LODWORD(v33) = *(_DWORD *)((char *)v57 + v32);
          *(_DWORD *)((char *)v57 + v32) = v33 >> 1;
          v31 = v33 & 1;
          v32 -= 4;
        }
        while (v32);
      }
      v34 = v56[0];
      v35 = LODWORD(v56[0]) - 1;
      if (*((_DWORD *)v56 + LODWORD(v56[0])) != 1)
        v35 = v56[0];
      LODWORD(v56[0]) = v35;
      v36 = __OFSUB__(v34, 1);
      v37 = v34 - 1;
      if (v37 < 0 == v36)
      {
        v38 = 0;
        v39 = 4 * v37 + 4;
        do
        {
          HIDWORD(v40) = v38;
          LODWORD(v40) = *(_DWORD *)((char *)v56 + v39);
          *(_DWORD *)((char *)v56 + v39) = v40 >> 1;
          v38 = v40 & 1;
          v39 -= 4;
        }
        while (v39);
      }
      ++v13;
      v17 = v57[0];
      ++v12;
      ++v16;
    }
    while (LODWORD(v57[0]));
  }
  LODWORD(v57[0]) = v11;
  if ((int)v11 >= 1)
    memcpy((char *)v57 + 4, __dst, 4 * v11);
  bzero(&unk_100027378, 0x3E0uLL);
  v41 = dword_10002344C[0];
  dword_100027474 = dword_10002344C[0];
  if (dword_10002344C[0] >= 1)
    memcpy(&unk_100027478, &unk_100023450, 4 * dword_10002344C[0]);
  dword_1000274B0 = dword_100023488[0];
  if (dword_100023488[0] >= 1)
    memcpy(&unk_1000274B4, &unk_10002348C, 4 * dword_100023488[0]);
  v42 = DWORD1(v49[0]);
  dword_10002737C = DWORD1(v49[0]);
  if (SDWORD1(v49[0]) >= 1)
    memcpy(&unk_100027380, (char *)v49 + 8, 4 * DWORD1(v49[0]));
  dword_1000273B8 = v50[0];
  if (SLODWORD(v50[0]) >= 1)
    memcpy(&unk_1000273BC, (char *)v50 + 4, 4 * LODWORD(v50[0]));
  dword_1000275E8 = v41;
  if ((int)v41 >= 1)
    memcpy(&unk_1000275EC, &unk_100023450, 4 * v41);
  FpMinus(dword_100023488, (unsigned int *)dword_100023358, qword_100027624);
  dword_1000273F8 = v42;
  if ((int)v42 >= 1)
    memcpy(&unk_1000273FC, (char *)v49 + 8, 4 * v42);
  FpMinus((int *)v50, (unsigned int *)dword_100023358, qword_100027434);
  sub_1000156F4((int *)v49, (uint64_t)&unk_1000274EC);
  v43 = dword_1000274F0;
  dword_1000276E0 = dword_1000274F0;
  if (dword_1000274F0 >= 1)
  {
    v44 = &unk_100027378;
    do
    {
      v44[219] = v44[95];
      ++v44;
      --v43;
    }
    while (v43);
  }
  FpMinus(dword_10002752C, (unsigned int *)dword_100023358, qword_10002771C);
  sub_1000156F4(&dword_1000273F4, (uint64_t)&dword_10002752C[15]);
  v45 = dword_10002756C;
  dword_100027664 = dword_10002756C;
  if (dword_10002756C >= 1)
  {
    v46 = &dword_100027668;
    do
    {
      *v46 = *(v46 - 62);
      ++v46;
      --v45;
    }
    while (v45);
  }
  memset(v61, 0, 60);
  memset(&__dst[8], 0, 112);
  FpMinus(dword_1000275A8, (unsigned int *)dword_100023358, qword_1000276A0);
  *(_QWORD *)&__dst[60] = 0x100000001;
  *(_QWORD *)__dst = 0;
  v61[0] = 0;
  if ((int)v13 >= 1)
  {
    v47 = v12 - 1;
    do
    {
      sub_1000147AC((unsigned int *)__dst, __dst);
      if (*((_BYTE *)&v63[4] + v47 + 6))
        sub_100014C34((unsigned int *)__dst, (uint64_t)&unk_100027378 + 124 * *((unsigned __int8 *)&v63[4] + v47 + 6) - 124, (uint64_t)__dst);
      --v16;
      --v47;
    }
    while (v16 > 1);
  }
  memset(v51, 0, 60);
  memset(&v50[4], 0, 64);
  memset(v63, 0, 60);
  memset(v62, 0, 60);
  sub_1000130BC((unsigned int *)v61, (unsigned int *)dword_100023358, v63);
  sub_100012E74((unsigned int *)v63, (unsigned int *)v63, dword_100023358, (unsigned int *)v62);
  sub_100012E74((unsigned int *)__dst, (unsigned int *)v62, dword_100023358, (unsigned int *)&v50[4] + 1);
  sub_100012E74((unsigned int *)v62, (unsigned int *)v63, dword_100023358, (unsigned int *)v63);
  sub_100012E74((unsigned int *)&__dst[60], (unsigned int *)v63, dword_100023358, (unsigned int *)v51);
  sub_10001287C((unsigned int *)&v50[4] + 1, (int *)dword_1000234C4, v57);
  return sub_100012304((unsigned int *)v57, (int *)v54) == 0;
}

uint64_t ECC_Init()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;
  int v7;
  uint64_t v8;
  size_t v9;
  int v10;
  int v11;
  uint64_t v12;
  size_t v13;
  int v14;
  uint64_t v16;
  void *v17;
  void *__dst;
  int v19;
  _OWORD v20[3];
  uint64_t v21;
  int v22;
  _OWORD v23[3];
  uint64_t v24;

  sub_100011B74((uint64_t)&unk_10001A1D0, 24, dword_100023358);
  sub_100011B74((uint64_t)&unk_10001A1EE, 24, &dword_100023394);
  sub_100011B74((uint64_t)&unk_10001A20C, 24, dword_1000233D0);
  sub_100011B74((uint64_t)&unk_10001A22A, 24, dword_10002344C);
  sub_100011B74((uint64_t)&unk_10001A248, 24, dword_100023488);
  sub_100011B74((uint64_t)&unk_10001A266, 24, dword_1000234C4);
  v0 = 0;
  v24 = 0;
  memset(v23, 0, sizeof(v23));
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  do
  {
    v1 = 0;
    v2 = &dword_10002353C[31 * v0];
    v17 = v2 + 2;
    __dst = v2 + 17;
    v16 = v0;
    v3 = 12 * v0;
    v4 = 12 * v0 + 6;
    v5 = v2 + 16;
    do
    {
      *((int *)v23 + v1) = dword_10001A3C4[v1 + v3];
      v6 = dword_10001A3C4[v4 + v1];
      v22 = 6;
      *((int *)v20 + v1) = v6;
      v19 = 6;
      v7 = 7;
      v8 = 24;
      while (1)
      {
        v9 = v8;
        if (!v8)
          break;
        v10 = *(int *)((char *)&v22 + v8);
        v8 -= 4;
        --v7;
        if (v10)
          goto LABEL_8;
      }
      v7 = 0;
LABEL_8:
      v22 = v7;
      v11 = 7;
      v12 = 24;
      while (1)
      {
        v13 = v12;
        if (!v12)
          break;
        v14 = *(int *)((char *)&v19 + v12);
        v12 -= 4;
        --v11;
        if (v14)
          goto LABEL_13;
      }
      v11 = 0;
LABEL_13:
      v19 = v11;
      if (v7 >= 1)
        memcpy(v17, v23, v9);
      *v5 = v11;
      if (v11)
        memcpy(__dst, v20, v13);
      ++v1;
    }
    while (v1 != 6);
    dword_10002353C[31 * v16 + 1] = v7;
    v0 = v16 + 1;
  }
  while (v16 != 127);
  return 1;
}

uint64_t ecc192_genkey_pc(uint64_t a1, _BYTE *a2)
{
  _OWORD v5[8];
  _OWORD v6[4];
  _QWORD v7[2];
  int v8;
  int v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[6];
  _OWORD v16[6];

  memset(v16, 0, sizeof(v16));
  memset(v15, 0, sizeof(v15));
  v9 = 0;
  v7[0] = v16;
  v7[1] = v15;
  memset(v6, 0, 60);
  do
    sub_1000142D0(v6);
  while ((sub_100012304((unsigned int *)v6, (int *)dword_1000234C4) & 0x80000000) == 0);
  memset(v5, 0, 124);
  sub_100012C50((unsigned int *)v6, v5);
  sub_100012378(v5, v7);
  PubKeyToOctetString((uint64_t)v7, 0x30u, &v9, (uint64_t)(a2 + 1));
  *a2 = 4;
  v13 = 0u;
  v14 = 0u;
  v11 = *(_OWORD *)((char *)v6 + 4);
  v12 = *(_QWORD *)((char *)&v6[1] + 4);
  v10 = 6;
  sub_100011A34(&v10, 0x18u, &v8, a1);
  return 0;
}

uint64_t sub_1000142D0(_DWORD *a1)
{
  unsigned int v2;
  uint64_t i;
  int v4;
  int v5;
  uint64_t result;
  int v7;

  *a1 = 6;
  v2 = time(0);
  srand(v2);
  for (i = 0; i != 6; ++i)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      result = rand();
      v7 = dword_100027374++;
      v5 |= (v7 + (_DWORD)result + 2 * v7 + (v7 >> 1)) << v4;
      v4 += 11;
    }
    while (v4 != 33);
    a1[i + 1] = v5;
  }
  return result;
}

uint64_t ecc192_genkey(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  _OWORD v6[8];
  _OWORD v7[4];
  _QWORD v8[2];
  int v9;
  int v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[6];
  _OWORD v17[6];

  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  v10 = 0;
  memset(v7, 0, 60);
  v8[0] = v17;
  v8[1] = v16;
  sub_1000142D0(v7);
  if ((sub_100012304((unsigned int *)v7, &dword_1000234C4) & 0x80000000) == 0 && dword_1000234C4 >= 1)
  {
    v4 = dword_1000234C4 + 1;
    do
    {
      *((_DWORD *)v7 + (v4 - 2) + 1) &= dword_100023358[(v4 - 2) + 92];
      --v4;
    }
    while (v4 > 1);
  }
  memset(v6, 0, 124);
  sub_100012C50((unsigned int *)v7, v6);
  sub_100012378(v6, v8);
  PubKeyToOctetString((uint64_t)v8, 0x30u, &v10, (uint64_t)(a2 + 1));
  *a2 = 4;
  v14 = 0u;
  v15 = 0u;
  v12 = *(_OWORD *)((char *)v7 + 4);
  v13 = *(_QWORD *)((char *)&v7[1] + 4);
  v11 = 6;
  sub_100011A34(&v11, 0x18u, &v9, a1);
  return 0;
}

uint64_t ecc192_sign(uint64_t a1, char *a2, unsigned int a3, uint64_t a4)
{
  int v7;
  _OWORD v9[4];
  _OWORD __dst[12];
  int v11;

  v11 = 0;
  memset(__dst, 0, sizeof(__dst));
  memset(v9, 0, 60);
  sub_100011B74(a1, 24, v9);
  v7 = v9[0];
  if (SLODWORD(v9[0]) >= 1)
    memcpy(__dst, (char *)v9 + 4, 4 * LODWORD(v9[0]));
  return Sign_With_Private_Key(a4, a2, a3, __dst, v7);
}

BOOL ecc192_verify(uint64_t a1, char *a2, unsigned int a3, uint64_t a4, int a5)
{
  void *v10[2];
  _OWORD v11[6];
  _OWORD v12[6];

  memset(v12, 0, sizeof(v12));
  memset(v11, 0, sizeof(v11));
  v10[0] = v12;
  v10[1] = v11;
  OctetStringToPubKey(a1 + 1, 0x30u, v10);
  return Verify_With_Public_Key(a2, a3, a4, a5, (uint64_t)v12, (uint64_t)v11);
}

uint64_t ecc192_ecdh(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  _QWORD v7[2];
  unsigned int v8;
  unsigned int v9;
  void *v10[2];
  _OWORD v11[4];
  _BYTE __dst[37];
  char v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  char v17;

  v9 = 6;
  v7[0] = &v14;
  v7[1] = &v13;
  v10[0] = &v17;
  v10[1] = &v16;
  OctetStringToPubKey(a2 + 1, 0x30u, v10);
  memset(v11, 0, 60);
  sub_100011B74(a1, 24, v11);
  if (SLODWORD(v11[0]) >= 1)
    memcpy(__dst, (char *)v11 + 4, 4 * LODWORD(v11[0]));
  result = KTimesPoint(__dst, &v9, (uint64_t *)v10, v5, v7);
  v8 = result;
  if ((_DWORD)result)
  {
    memset((char *)&v11[1] + 12, 0, 32);
    *(_OWORD *)((char *)v11 + 4) = v14;
    *(_QWORD *)((char *)&v11[1] + 4) = v15;
    LODWORD(v11[0]) = 6;
    sub_100011A34(v11, 0x18u, &v8, a3);
    return v8;
  }
  return result;
}

void sub_1000147AC(unsigned int *a1, _DWORD *a2)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  int *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  _OWORD v16[3];
  uint64_t v17;
  _OWORD v18[4];
  _BYTE v19[60];
  _BYTE v20[60];
  unsigned int v21;
  _OWORD v22[3];
  uint64_t v23;
  _BYTE v24[60];

  v3 = a1[30];
  if ((_DWORD)v3 && ((_DWORD)v3 != 1 || a1[31]))
  {
    v5 = 0uLL;
    memset(&v24[4], 0, 56);
    v6 = *a1;
    *(_DWORD *)v24 = v6;
    if ((int)v6 >= 1)
    {
      memcpy(&v24[4], a1 + 1, 4 * v6);
      v5 = 0uLL;
    }
    v23 = 0;
    v22[1] = v5;
    v22[2] = v5;
    v22[0] = v5;
    v7 = a1[15];
    v21 = v7;
    if ((int)v7 >= 1)
      memcpy(v22, a1 + 16, 4 * v7);
    v8 = 0uLL;
    memset(&v20[4], 0, 56);
    *(_DWORD *)v20 = v3;
    if ((int)v3 >= 1)
    {
      memcpy(&v20[4], a1 + 31, 4 * v3);
      v8 = 0uLL;
    }
    v17 = 0;
    v16[1] = v8;
    v16[2] = v8;
    v16[0] = v8;
    v15 = dword_100023358;
    if (dword_100023358 < 1)
    {
      v9 = -3;
    }
    else
    {
      memcpy(v16, &unk_10002335C, 4 * dword_100023358);
      v9 = LODWORD(v16[0]) - 3;
    }
    memset(v19, 0, sizeof(v19));
    memset(v18, 0, 60);
    LODWORD(v16[0]) = v9;
    if (sub_100012304((unsigned int *)&dword_100023394, (int *)&v15))
    {
      *(_DWORD *)v19 = dword_100023394;
      if (dword_100023394 >= 1)
        memcpy(&v19[4], &unk_100023398, 4 * dword_100023394);
      sub_100012E74((unsigned int *)v20, (unsigned int *)v20, &dword_100023358, (unsigned int *)v18);
      sub_100012E74((unsigned int *)v18, (unsigned int *)v18, &dword_100023358, (unsigned int *)v18);
      sub_100012E74((unsigned int *)v19, (unsigned int *)v18, &dword_100023358, (unsigned int *)v18);
      sub_100012E74((unsigned int *)v24, (unsigned int *)v24, &dword_100023358, (unsigned int *)v19);
      sub_100013034((int *)v19, (int *)v19, &dword_100023358, &v15);
      sub_100013034((int *)&v15, (int *)v19, &dword_100023358, v19);
      v10 = (int *)v18;
      v11 = (int *)v19;
    }
    else
    {
      sub_100012E74((unsigned int *)v20, (unsigned int *)v20, &dword_100023358, (unsigned int *)v19);
      sub_1000150E8((unsigned int *)v24, (int *)v19, v18);
      sub_100013034((int *)v24, (int *)v19, &dword_100023358, v19);
      sub_100012E74((unsigned int *)v19, (unsigned int *)v18, &dword_100023358, (unsigned int *)v18);
      sub_100013034((int *)v18, (int *)v18, &dword_100023358, &v15);
      v10 = (int *)&v15;
      v11 = (int *)v18;
    }
    sub_100013034(v10, v11, &dword_100023358, v19);
    sub_100012E74(&v21, (unsigned int *)v20, &dword_100023358, (unsigned int *)v20);
    sub_100013034((int *)v20, (int *)v20, &dword_100023358, v20);
    sub_100012E74(&v21, &v21, &dword_100023358, &v21);
    sub_100012E74((unsigned int *)v24, &v21, &dword_100023358, (unsigned int *)v18);
    sub_100013034((int *)v18, (int *)v18, &dword_100023358, &v15);
    sub_100013034((int *)&v15, (int *)&v15, &dword_100023358, v18);
    sub_100012E74((unsigned int *)v19, (unsigned int *)v19, &dword_100023358, (unsigned int *)v24);
    sub_100013034((int *)v18, (int *)v18, &dword_100023358, &v15);
    sub_1000150E8((unsigned int *)v24, (int *)&v15, v24);
    sub_100012E74(&v21, &v21, &dword_100023358, &v21);
    sub_100013034((int *)&v21, (int *)&v21, &dword_100023358, &v15);
    sub_100013034((int *)&v15, (int *)&v15, &dword_100023358, &v21);
    v15 = v21;
    if ((int)v21 >= 1)
      memcpy(v16, v22, 4 * v21);
    sub_100013034((int *)&v15, (int *)&v15, &dword_100023358, &v21);
    sub_1000150E8((unsigned int *)v18, (int *)v24, v18);
    sub_100012E74((unsigned int *)v19, (unsigned int *)v18, &dword_100023358, (unsigned int *)v18);
    sub_1000150E8((unsigned int *)v18, (int *)&v21, &v21);
    v12 = *(unsigned int *)v24;
    *a2 = *(_DWORD *)v24;
    if ((int)v12 >= 1)
      memcpy(a2 + 1, &v24[4], 4 * v12);
    v13 = v21;
    a2[15] = v21;
    if ((int)v13 >= 1)
      memcpy(a2 + 16, v22, 4 * v13);
    v14 = *(unsigned int *)v20;
    a2[30] = *(_DWORD *)v20;
    if ((int)v14 >= 1)
      memcpy(a2 + 31, &v20[4], 4 * v14);
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 15) = 0x100000001;
    *((_QWORD *)a2 + 15) = 0;
  }
}

void sub_100014C34(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _BOOL4 v12;
  int *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[4];
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];
  _OWORD v35[2];
  _OWORD v36[2];
  _BYTE v37[28];
  unsigned int v38;
  _BYTE v39[48];
  uint64_t v40;
  int v41;
  _OWORD v42[3];
  uint64_t v43;
  _BYTE v44[60];

  v5 = a1[30];
  if ((_DWORD)v5 && ((_DWORD)v5 != 1 || a1[31]))
  {
    v7 = 0uLL;
    memset(&v44[4], 0, 56);
    v8 = *a1;
    *(_DWORD *)v44 = v8;
    if ((int)v8 >= 1)
    {
      memcpy(&v44[4], a1 + 1, 4 * v8);
      v7 = 0uLL;
    }
    v43 = 0;
    v42[1] = v7;
    v42[2] = v7;
    v42[0] = v7;
    v9 = a1[15];
    v41 = v9;
    if ((int)v9 >= 1)
      memcpy(v42, a1 + 16, 4 * v9);
    v40 = 0;
    v10 = 0uLL;
    memset(v39, 0, sizeof(v39));
    v38 = v5;
    if ((int)v5 >= 1)
    {
      memcpy(v39, a1 + 31, 4 * v5);
      v10 = 0uLL;
    }
    *(_OWORD *)&v37[12] = v10;
    v36[1] = v10;
    *(_OWORD *)v37 = v10;
    v36[0] = v10;
    v34[0] = v10;
    v34[1] = v10;
    v35[0] = v10;
    *(_OWORD *)((char *)v35 + 12) = v10;
    v32[0] = v10;
    v32[1] = v10;
    v33[0] = v10;
    *(_OWORD *)((char *)v33 + 12) = v10;
    sub_100012E74(&v38, &v38, &dword_100023358, (unsigned int *)v32);
    sub_100012E74((unsigned int *)(a2 + 4), (unsigned int *)v32, &dword_100023358, (unsigned int *)v36);
    sub_100012E74(&v38, (unsigned int *)v32, &dword_100023358, (unsigned int *)v32);
    sub_100012E74((unsigned int *)(a2 + 64), (unsigned int *)v32, &dword_100023358, (unsigned int *)v34);
    sub_1000150E8((unsigned int *)v44, (int *)v36, v36);
    sub_1000150E8((unsigned int *)&v41, (int *)v34, v34);
    v12 = LODWORD(v36[0]) == 1 && DWORD1(v36[0]) == 0;
    if (!LODWORD(v36[0]) || v12)
    {
      v23 = LODWORD(v34[0]) == 1 && DWORD1(v34[0]) == 0;
      if (!LODWORD(v34[0]) || v23)
      {
        sub_1000147AC(a1, (_DWORD *)a3);
      }
      else
      {
        *(_QWORD *)a3 = 0;
        *(_QWORD *)(a3 + 60) = 0x100000001;
        *(_QWORD *)(a3 + 120) = 0;
      }
    }
    else
    {
      memset(v31, 0, 60);
      sub_100013034((int *)v44, (int *)v44, &dword_100023358, v31);
      sub_1000150E8((unsigned int *)v31, (int *)v36, v44);
      sub_100013034(&v41, &v41, &dword_100023358, v31);
      sub_1000150E8((unsigned int *)v31, (int *)v34, &v41);
      sub_100012E74(&v38, (unsigned int *)v36, &dword_100023358, &v38);
      sub_100012E74((unsigned int *)v36, (unsigned int *)v36, &dword_100023358, (unsigned int *)v32);
      sub_100012E74((unsigned int *)v36, (unsigned int *)v32, &dword_100023358, (unsigned int *)v36);
      sub_100012E74((unsigned int *)v44, (unsigned int *)v32, &dword_100023358, (unsigned int *)v32);
      sub_100012E74((unsigned int *)v34, (unsigned int *)v34, &dword_100023358, (unsigned int *)v44);
      sub_1000150E8((unsigned int *)v44, (int *)v32, v44);
      sub_100013034((int *)v44, (int *)v44, &dword_100023358, v31);
      sub_1000150E8((unsigned int *)v32, (int *)v31, v32);
      sub_100012E74((unsigned int *)v34, (unsigned int *)v32, &dword_100023358, (unsigned int *)v34);
      sub_100012E74((unsigned int *)&v41, (unsigned int *)v36, &dword_100023358, (unsigned int *)v36);
      v13 = (int *)(a3 + 60);
      sub_1000150E8((unsigned int *)v34, (int *)v36, (_QWORD *)(a3 + 60));
      v14 = a3 + 64;
      if ((*(_BYTE *)(a3 + 64) & 1) != 0)
      {
        sub_100015164((int *)(a3 + 60), &dword_100023358, (int *)(a3 + 60));
        v24 = *v13;
        v25 = *v13 - 1;
        if (*(_DWORD *)(v14 + 4 * v25) == 1)
          *v13 = v25;
        if (v24 >= 1)
        {
          v26 = 0;
          v27 = 4 * v25;
          do
          {
            HIDWORD(v28) = v26;
            LODWORD(v28) = *(_DWORD *)(v14 + v27);
            *(_DWORD *)(v14 + v27) = v28 >> 1;
            v27 -= 4;
            v26 = v28 & 1;
          }
          while (v27 != -4);
        }
      }
      else
      {
        v15 = *v13;
        v16 = *v13 - 1;
        if (*(_DWORD *)(v14 + 4 * v16) == 1)
          *v13 = v16;
        if (v15 >= 1)
        {
          v17 = 0;
          v18 = 4 * v16;
          do
          {
            HIDWORD(v19) = v17;
            LODWORD(v19) = *(_DWORD *)(v14 + v18);
            *(_DWORD *)(v14 + v18) = v19 >> 1;
            v18 -= 4;
            v17 = v19 & 1;
          }
          while (v18 != -4);
        }
      }
      v29 = *(unsigned int *)v44;
      *(_DWORD *)a3 = *(_DWORD *)v44;
      if ((int)v29 >= 1)
        memcpy((void *)(a3 + 4), &v44[4], 4 * v29);
      v30 = v38;
      *(_DWORD *)(a3 + 120) = v38;
      if ((int)v30 >= 1)
        memcpy((void *)(a3 + 124), v39, 4 * v30);
    }
  }
  else
  {
    *(_DWORD *)a3 = *(_DWORD *)(a2 + 4);
    if (*(int *)(a2 + 4) >= 1)
    {
      v20 = 0;
      do
      {
        *(_DWORD *)(a3 + 4 + 4 * v20) = *(_DWORD *)(a2 + 8 + 4 * v20);
        ++v20;
      }
      while (v20 < *(int *)(a2 + 4));
    }
    *(_DWORD *)(a3 + 60) = *(_DWORD *)(a2 + 64);
    if (*(int *)(a2 + 64) >= 1)
    {
      v21 = 0;
      do
      {
        *(_DWORD *)(a3 + 64 + 4 * v21) = *(_DWORD *)(a2 + 68 + 4 * v21);
        ++v21;
      }
      while (v21 < *(int *)(a2 + 64));
    }
    *(_QWORD *)(a3 + 120) = 0x100000001;
  }
}

void sub_1000150E8(unsigned int *a1, int *a2, _QWORD *a3)
{
  int v4;
  uint64_t v5;
  _OWORD v6[4];

  memset(v6, 0, 60);
  sub_1000116B0(a1, a2, v6);
  if (v4)
  {
    sub_1000116B0((unsigned int *)&dword_100023358, (int *)v6, a3);
  }
  else
  {
    v5 = LODWORD(v6[0]);
    *(_DWORD *)a3 = v6[0];
    if ((int)v5 >= 1)
      memcpy((char *)a3 + 4, (char *)v6 + 4, 4 * v5);
  }
}

int *sub_100015164(int *result, int *a2, int *a3)
{
  int v4;
  int v5;
  int *v6;
  int *v7;
  int v8;
  uint64_t v9;
  int *v10;
  _DWORD *v11;
  int v12;
  int *v13;
  uint64_t v14;
  int *v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  int v30;
  int v31;

  v4 = *result;
  v5 = *a2;
  if (*result <= *a2)
    v6 = a2;
  else
    v6 = result;
  if (v4 <= v5)
    v7 = result;
  else
    v7 = a2;
  if (v4 <= v5)
    v8 = *a2;
  else
    v8 = *result;
  if (v4 >= v5)
    v9 = v5;
  else
    v9 = v4;
  v10 = v6 + 1;
  v11 = a3 + 1;
  if ((int)v9 < 1)
  {
    v23 = 0;
  }
  else
  {
    v12 = 0;
    v13 = v7 + 1;
    v14 = v9;
    v15 = v6 + 1;
    result = a3 + 1;
    do
    {
      v17 = *v15++;
      v16 = v17;
      v18 = v17 + v12;
      v19 = __CFADD__(v17, v12);
      v21 = *v13++;
      v20 = v21;
      v22 = v21 + v18;
      v23 = __CFADD__(v21, v18) || v19;
      if (__CFADD__(v16, v12))
        v24 = v20;
      else
        v24 = v22;
      *result++ = v24;
      v12 = v23;
      --v14;
    }
    while (v14);
  }
  if ((int)v9 >= v8)
  {
    if (v23)
LABEL_36:
      v11[v8++] = 1;
  }
  else
  {
    v25 = 0;
    v26 = v9;
    if (v4 <= v5)
      v4 = v5;
    v27 = 4 * (int)v9 + 4;
    v28 = (char *)v6 + v27;
    v29 = (char *)a3 + v27;
    v30 = v4 - v9;
    while (1)
    {
      v31 = *(_DWORD *)&v28[4 * v25];
      *(_DWORD *)&v29[4 * v25] = v31 + v23;
      if (!__CFADD__(v31, v23))
        break;
      ++v25;
      v23 = 1;
      if (v30 == (_DWORD)v25)
        goto LABEL_36;
    }
    result = (int *)memcpy(&v11[v26 + 1 + (int)v25], &v10[v26 + 1 + (int)v25], 4 * (~v26 + v4 - (int)v25));
  }
  *a3 = v8;
  return result;
}

char *sub_100015284(char *result, char *__src, unsigned int a3)
{
  unsigned int v3;
  unsigned int *v5;
  const char *v6;
  uint64_t v7;
  size_t v8;
  unsigned int v9;

  if (a3)
  {
    v3 = a3;
    v5 = (unsigned int *)result;
    v6 = result + 32;
    do
    {
      v7 = v5[24];
      if (v3 < 0x40 || (_DWORD)v7)
      {
        if (v3 >= 64 - (int)v7)
          v8 = (64 - v7);
        else
          v8 = v3;
        result = (char *)memcpy((void *)&v6[v7], __src, v8);
        v9 = v5[24] + v8;
        v5[24] = v9;
        __src += v8;
        v3 -= v8;
        if (v9 >= 0x40)
        {
          result = (char *)sub_100015338(v5, v6);
          v5[24] = 0;
        }
      }
      else
      {
        result = (char *)sub_100015338(v5, __src);
        __src += 64;
        v3 -= 64;
      }
    }
    while (v3);
  }
  return result;
}

unsigned int *sub_100015338(unsigned int *result, const char *a2)
{
  uint64_t v2;
  uint16x8_t v5;
  uint16x8_t v6;
  int32x4_t v7;
  int8x16_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  int8x16_t v16;
  uint16x8_t v17;
  int v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unint64_t v42;
  int v43;
  unint64_t v44;
  int v45;
  _OWORD v46[16];
  int8x16x4_t v47;

  v2 = 0;
  v47 = vld4q_s8(a2);
  _Q4 = vmovl_u8(*(uint8x8_t *)v47.val[0].i8);
  _Q5 = (int8x16_t)vmovl_high_u8((uint8x16_t)v47.val[0]);
  v5 = vmovl_u8(*(uint8x8_t *)v47.val[1].i8);
  v6 = vmovl_high_u8((uint8x16_t)v47.val[1]);
  v7 = (int32x4_t)vmovl_high_u16(v6);
  __asm { SHLL2           V18.4S, V4.8H, #0x10 }
  v13 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q5.i8, 0x10uLL);
  __asm { SHLL2           V5.4S, V5.8H, #0x10 }
  v14 = vmovl_u8(*(uint8x8_t *)v47.val[2].i8);
  v15 = vmovl_high_u8((uint8x16_t)v47.val[2]);
  v16 = (int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v6.i8), 8uLL), vorrq_s8(v13, (int8x16_t)vmovl_u16(*(uint16x4_t *)v15.i8))), 8uLL);
  v17 = vmovl_u8(*(uint8x8_t *)v47.val[3].i8);
  v47.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v47.val[3]);
  v46[3] = vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v7, 8uLL), vorrq_s8(_Q5, (int8x16_t)vmovl_high_u16(v15))), 8uLL), (int8x16_t)vmovl_high_u16((uint16x8_t)v47.val[0]));
  v46[2] = vorrq_s8(v16, (int8x16_t)vmovl_u16(*(uint16x4_t *)v47.val[0].i8));
  v46[0] = vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v5.i8), 8uLL), vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q4.i8, 0x10uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v14.i8))), 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v17.i8));
  v46[1] = vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v5), 8uLL), vorrq_s8(_Q18, (int8x16_t)vmovl_high_u16(v14))), 8uLL), (int8x16_t)vmovl_high_u16(v17));
  v18 = v46[0];
  do
  {
    HIDWORD(v19) = *(_DWORD *)((char *)&v46[3] + v2 + 8);
    LODWORD(v19) = HIDWORD(v19);
    v20 = (v19 >> 17) ^ __ROR4__(HIDWORD(v19), 19) ^ (HIDWORD(v19) >> 10);
    HIDWORD(v19) = *(_DWORD *)((char *)v46 + v2 + 4);
    LODWORD(v19) = HIDWORD(v19);
    *(_DWORD *)((char *)&v46[4] + v2) = v20
                                      + *(_DWORD *)((char *)&v46[2] + v2 + 4)
                                      + v18
                                      + ((v19 >> 7) ^ __ROR4__(HIDWORD(v19), 18) ^ (HIDWORD(v19) >> 3));
    v2 += 4;
    v18 = HIDWORD(v19);
  }
  while (v2 != 192);
  v21 = 0;
  v22 = result[1];
  v23 = result[4];
  v24 = result[5];
  v26 = result[6];
  v25 = result[7];
  v27 = *result;
  v28 = v25;
  v29 = v26;
  v30 = v24;
  v31 = result[2];
  v32 = result[3];
  v33 = v23;
  v34 = v32;
  v35 = v31;
  v36 = v22;
  do
  {
    v37 = v36;
    v38 = v35;
    v39 = v33;
    v40 = v30;
    v41 = v29;
    v36 = v27;
    HIDWORD(v42) = v33;
    LODWORD(v42) = v33;
    v43 = (v42 >> 6) ^ __ROR4__(v33, 11);
    v44 = __PAIR64__(v27, __ROR4__(v39, 25));
    v45 = (v43 ^ v44) + (v30 & v39) + v28 + (v29 & ~v39) + dword_10001A2C4[v21] + *(_DWORD *)((char *)v46 + v21 * 4);
    LODWORD(v44) = v36;
    v33 = v45 + v34;
    v27 = ((v44 >> 2) ^ __ROR4__(v36, 13) ^ __ROR4__(v36, 22)) + (v36 & (v35 ^ v37) ^ v35 & v37) + v45;
    ++v21;
    v28 = v29;
    v29 = v30;
    v30 = v39;
    v34 = v35;
    v35 = v37;
  }
  while (v21 != 64);
  *result += v27;
  result[1] = v36 + v22;
  result[2] = v37 + v31;
  result[3] = v38 + v32;
  result[4] = v33 + v23;
  result[5] = v39 + v24;
  result[6] = v40 + v26;
  result[7] = v41 + v25;
  return result;
}

int *sub_1000155B4(int *result, int *a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL4 v15;
  int v16;
  unsigned int v17;
  _BOOL4 v18;
  unsigned int v19;
  BOOL v20;
  unsigned int v21;
  BOOL v22;

  v3 = HIWORD(a3);
  v4 = *a2;
  v5 = a2[1];
  v6 = v5 / (HIWORD(a3) + 1);
  if (HIWORD(a3) == 0xFFFF)
    v6 = HIWORD(v5);
  v7 = (unsigned __int16)v6 * (unsigned __int16)a3;
  v8 = __CFADD__(v4 - (v7 << 16), v7 << 16);
  v9 = v5 - ((unsigned __int16)v6 * v3 + HIWORD(v7)) - v8;
  v10 = a3 << 16;
  v11 = (~v6 * a3) << 16;
  while (v9 > v3 || v9 == v3 && -65536 * v7 + v4 >= v10)
  {
    v9 = (__PAIR64__(v9 - v3, ~(a3 << 16)) - (v11 + v4)) >> 32;
    LOWORD(v6) = v6 + 1;
    v4 -= v10;
  }
  HIDWORD(v12) = v9;
  LODWORD(v12) = v4 - (v7 << 16);
  v13 = (v12 >> 16) / (v3 + 1);
  if (v3 == 0xFFFF)
    LOWORD(v13) = v9;
  v14 = (unsigned __int16)v13 * v3;
  v15 = __CFADD__((unsigned __int16)v13 * (unsigned __int16)a3, v4 - ((unsigned __int16)v13 * (unsigned __int16)a3 + (v7 << 16)));
  v16 = -(((unsigned __int16)a3 | (v3 << 16)) * (unsigned __int16)v13);
  v17 = v16 - (v7 << 16) + v4;
  v18 = __CFADD__(v17, v14 << 16);
  v19 = v9 - HIWORD(v14) - v15 - v18;
  if (v19)
    v20 = 1;
  else
    v20 = v17 >= a3;
  if (v20)
  {
    v21 = v16 - (a3 + (v7 << 16)) + v4;
    do
    {
      v19 = (__PAIR64__(v19, ~a3) - v21) >> 32;
      LOWORD(v13) = v13 + 1;
      if (v19)
        v22 = 1;
      else
        v22 = v21 >= a3;
      v21 -= a3;
    }
    while (v22);
  }
  *result = (unsigned __int16)v13 | ((unsigned __int16)v6 << 16);
  return result;
}

void sub_1000156F4(int *a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[4];
  _OWORD v12[4];
  _OWORD v13[4];

  v4 = *a1;
  if (dword_100023448 == 1)
  {
    *(_DWORD *)a2 = v4;
    *(_DWORD *)(a2 + 4) = a1[1];
    if (a1[1] >= 1)
    {
      v5 = 0;
      do
      {
        *(_DWORD *)(a2 + 8 + 4 * v5) = a1[v5 + 2];
        ++v5;
      }
      while (v5 < a1[1]);
    }
    *(_DWORD *)(a2 + 64) = a1[16];
    if (a1[16] >= 1)
    {
      v6 = 0;
      do
      {
        *(_DWORD *)(a2 + 68 + 4 * v6) = a1[v6 + 17];
        ++v6;
      }
      while (v6 < a1[16]);
    }
  }
  else if (v4 == 1)
  {
    *(_DWORD *)a2 = dword_100023448;
    *(_DWORD *)(a2 + 4) = dword_10002344C[0];
    if (dword_10002344C[0] >= 1)
    {
      v7 = 0;
      do
      {
        *(_DWORD *)(a2 + 8 + 4 * v7) = dword_10002344C[v7 + 1];
        ++v7;
      }
      while (v7 < dword_10002344C[0]);
    }
    *(_DWORD *)(a2 + 64) = dword_100023488[0];
    if (dword_100023488[0] >= 1)
    {
      v8 = 0;
      do
      {
        *(_DWORD *)(a2 + 68 + 4 * v8) = dword_100023488[v8 + 1];
        ++v8;
      }
      while (v8 < dword_100023488[0]);
    }
  }
  else
  {
    memset(v13, 0, 60);
    memset(v12, 0, 60);
    memset(v11, 0, 60);
    if (sub_100012304((unsigned int *)dword_10002344C, a1 + 1))
      goto LABEL_18;
    sub_1000150E8((unsigned int *)dword_100023358, a1 + 16, v13);
    if (!sub_100012304((unsigned int *)dword_100023488, (int *)v13))
    {
      *(_DWORD *)a2 = 1;
      return;
    }
    if (sub_100012304((unsigned int *)dword_100023488, a1 + 16))
    {
LABEL_18:
      sub_1000150E8((unsigned int *)a1 + 1, dword_10002344C, v11);
      sub_1000150E8((unsigned int *)a1 + 16, dword_100023488, v12);
      sub_1000130BC((unsigned int *)v11, (unsigned int *)dword_100023358, v13);
      sub_100012E74((unsigned int *)v12, (unsigned int *)v13, dword_100023358, (unsigned int *)v11);
      sub_100012E74((unsigned int *)v11, (unsigned int *)v11, dword_100023358, (unsigned int *)v13);
      sub_1000150E8((unsigned int *)v13, dword_10002344C, v12);
      sub_1000150E8((unsigned int *)v12, a1 + 1, v13);
      sub_1000150E8((unsigned int *)dword_10002344C, (int *)v13, v12);
      v9 = LODWORD(v13[0]);
      *(_DWORD *)(a2 + 4) = v13[0];
      if ((int)v9 >= 1)
        memcpy((void *)(a2 + 8), (char *)v13 + 4, 4 * v9);
      sub_100012E74((unsigned int *)v11, (unsigned int *)v12, dword_100023358, (unsigned int *)v13);
      sub_1000150E8((unsigned int *)v13, dword_100023488, (_QWORD *)(a2 + 64));
      *(_DWORD *)a2 = 0;
    }
    else
    {
      sub_100012E74((unsigned int *)dword_10002344C, (unsigned int *)dword_10002344C, dword_100023358, (unsigned int *)v13);
      sub_100013034((int *)v13, (int *)v13, dword_100023358, v11);
      sub_100013034((int *)v13, (int *)v11, dword_100023358, v12);
      sub_100013034((int *)v12, &dword_100023394, dword_100023358, v13);
      sub_100013034(dword_100023488, dword_100023488, dword_100023358, v11);
      sub_1000130BC((unsigned int *)v11, (unsigned int *)dword_100023358, v12);
      sub_100012E74((unsigned int *)v12, (unsigned int *)v13, dword_100023358, (unsigned int *)v11);
      sub_100012E74((unsigned int *)v11, (unsigned int *)v11, dword_100023358, (unsigned int *)v13);
      sub_1000150E8((unsigned int *)v13, dword_10002344C, v12);
      sub_1000150E8((unsigned int *)v12, a1 + 1, v13);
      sub_1000150E8((unsigned int *)dword_10002344C, (int *)v13, v12);
      v10 = LODWORD(v13[0]);
      *(_DWORD *)(a2 + 4) = v13[0];
      if ((int)v10 >= 1)
        memcpy((void *)(a2 + 8), (char *)v13 + 4, 4 * v10);
      sub_100012E74((unsigned int *)v11, (unsigned int *)v12, dword_100023358, (unsigned int *)v13);
      sub_1000150E8((unsigned int *)v13, dword_100023488, (_QWORD *)(a2 + 64));
    }
  }
}

void sub_100015AE0()
{
  __assert_rtn("wpa_ether_send", "wapi_asue.c", 646, "wpa_s->l2 != NULL");
}

uint64_t sub_100015B08(int a1)
{
  perror("ioctl APPLE80211_IOC_ASSOCIATE");
  return asl_log(0, 0, 5, "%s: APPLE80211_IOC_ASSOCIATE error %d\n", "wpa_driver_apple80211_associate", a1);
}
