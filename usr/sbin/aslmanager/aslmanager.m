uint64_t *sub_100003F5C(char a1)
{
  unsigned int v1;

  v1 = 0;
  byte_100010010 = 0;
  qword_100010008 = 0;
  if ((a1 & 1) != 0)
  {
    LOBYTE(qword_100010008) = 48;
    v1 = &_mh_execute_header.magic + 1;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)&qword_100010008 + v1++) = 49;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)&qword_100010008 + v1++) = 50;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)&qword_100010008 + v1++) = 51;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)&qword_100010008 + v1++) = 52;
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)&qword_100010008 + v1++) = 53;
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
LABEL_18:
    *((_BYTE *)&qword_100010008 + v1) = 55;
    return &qword_100010008;
  }
LABEL_17:
  *((_BYTE *)&qword_100010008 + v1++) = 54;
  if (a1 < 0)
    goto LABEL_18;
LABEL_9:
  if (!v1)
    LOBYTE(qword_100010008) = 45;
  return &qword_100010008;
}

const char *sub_10000402C(const char *result, char *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;

  v2 = (int)result;
  if (a2)
  {
    v3 = *a2;
    if ((v3 | 0x20) == 0x6C)
    {
      result = a2 + 1;
      if ((a2[1] & 0xF8) == 0x30 && !a2[2])
      {
        result = (const char *)atoi(result);
LABEL_13:
        if ((int)result >= 7)
          v5 = 7;
        else
          v5 = (int)result;
        v4 = v5 & ~(v5 >> 31);
        goto LABEL_9;
      }
    }
    else if ((v3 & 0xF8) == 0x30 && !a2[1])
    {
      result = (const char *)(atoi(a2) + 2);
      goto LABEL_13;
    }
  }
  v4 = 3;
LABEL_9:
  if (v4 <= (dword_100010048 & 0xF))
    v4 = dword_100010048 & 0xF;
  dword_100010048 = dword_100010048 & 0xFFFFFFF0 | v2 | v4;
  return result;
}

void sub_1000040E0(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  tm *v11;
  char v12;
  __asl_object_s *v13;
  size_t v14;
  size_t v15;
  char *v16;
  char *v17;
  time_t v18;
  char *v19;
  char __s[16];
  __int128 v21;

  v19 = 0;
  v18 = time(0);
  *(_OWORD *)__s = 0u;
  v21 = 0u;
  v11 = localtime(&v18);
  strftime(__s, 0x20uLL, "%b %e %T", v11);
  v12 = dword_100010048;
  if ((dword_100010048 & 0x20) != 0 && (dword_100010048 & 0xFu) >= a1)
  {
    fprintf(__stderrp, "%s: ", __s);
    v19 = &a9;
    vfprintf(__stderrp, a2, &a9);
    v12 = dword_100010048;
  }
  if ((v12 & 0x10) != 0 && qword_100010050)
  {
    fprintf((FILE *)qword_100010050, "%s: ", __s);
    v19 = &a9;
    vfprintf((FILE *)qword_100010050, a2, &a9);
    v12 = dword_100010048;
  }
  if ((v12 & 0x40) != 0)
  {
    v17 = 0;
    if (!qword_100010018)
    {
      qword_100010018 = (uint64_t)asl_open("aslmanager", "syslog", 0);
      v13 = (__asl_object_s *)asl_msg_new(0);
      asl_msg_set_key_val(v13, "Message", "Status Report");
      asl_msg_set_key_val(v13, "Level", "Notice");
      asl_create_auxiliary_file(v13, "Status Report", "public.text", &dword_100010000);
      asl_msg_release(v13);
    }
    v19 = &a9;
    vasprintf(&v17, a2, &a9);
    if (v17)
    {
      v14 = strlen(__s);
      write(dword_100010000, __s, v14);
      v15 = strlen(v17);
      write(dword_100010000, v17, v15);
      v16 = v17;
    }
    else
    {
      v16 = 0;
    }
    free(v16);
  }
}

uint64_t sub_100004310()
{
  uint64_t result;

  if ((dword_100010000 & 0x80000000) == 0)
    asl_close_auxiliary_file(dword_100010000);
  result = qword_100010050;
  if (qword_100010050)
    return fclose((FILE *)qword_100010050);
  return result;
}

const char **sub_100004348(const char **a1, const char *a2, char *a3, int a4)
{
  char **v8;
  char **v9;
  char *v10;
  const char *v11;
  const char **v13;
  const char **v14;

  if (!a2)
    return a1;
  v8 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x10300405734DD4FuLL);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = strdup(a2);
  *v9 = v10;
  if (!v10)
  {
    free(v9);
    return 0;
  }
  v9[1] = a3;
  *((_DWORD *)v9 + 4) = a4;
  if (!a1)
    return (const char **)v9;
  v11 = v10;
  if (strcmp(v10, *a1) < 1)
  {
    v9[3] = (char *)a1;
    return (const char **)v9;
  }
  v13 = a1;
  do
  {
    v14 = v13;
    v13 = (const char **)v13[3];
  }
  while (v13 && strcmp(v11, *v13) > 0);
  v9[3] = (char *)v13;
  v14[3] = (const char *)v9;
  return a1;
}

void sub_100004424(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = *(_QWORD *)(v1 + 24);
      free(*(void **)v1);
      free((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

uint64_t sub_100004460(uint64_t a1, const char *a2, const char *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  gzFile v10;
  gzFile_s *v11;
  ssize_t v12;
  ssize_t v13;
  int v15;
  _BYTE buf[4096];

  v5 = open(a2, 0);
  if (v5 < 0)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v7 = open(a3, 513, *(_WORD *)(a1 + 116) & 0x1B6);
  if ((v7 & 0x80000000) != 0 || (v8 = asl_out_dst_set_access(v7, a1), v8 < 0))
  {
    v15 = v6;
LABEL_10:
    close(v15);
    return 0xFFFFFFFFLL;
  }
  v9 = v8;
  v10 = gzdopen(v8, "w");
  if (!v10)
  {
    close(v6);
    v15 = v9;
    goto LABEL_10;
  }
  v11 = v10;
  do
  {
    v12 = read(v6, buf, 0x1000uLL);
    if (!v12)
      break;
    v13 = v12;
    gzwrite(v11, buf, v12);
  }
  while (v13 == 4096);
  gzclose(v11);
  close(v6);
  close(v9);
  return 0;
}

void sub_1000045A0(const std::__fs::filesystem::path *a1, const std::__fs::filesystem::path *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  std::error_code *v10;
  int v11;
  char v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_1000040E0(5u, "  rename %s ---> %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    rename(a1, a2, v10);
    if (v11)
    {
      v12 = v11;
      __error();
      v13 = __error();
      strerror(*v13);
      sub_1000040E0(3u, "  FAILED status %d errno %d [%s] rename %s ---> %s\n", v14, v15, v16, v17, v18, v19, v12);
    }
  }
}

void sub_100004638(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  char v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000040E0(5u, "  remove %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    v9 = unlink(a1);
    if (v9)
    {
      v10 = v9;
      __error();
      v11 = __error();
      strerror(*v11);
      sub_1000040E0(3u, "  FAILED status %d errno %d [%s] unlink %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }
}

void sub_1000046C4(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  char v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000040E0(5u, "  truncate %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    v9 = truncate(a1, 0);
    if (v9)
    {
      v10 = v9;
      __error();
      v11 = __error();
      strerror(*v11);
      sub_1000040E0(3u, "  FAILED status %d errno %d [%s] unlink %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }
}

void sub_100004754(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  char v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000040E0(5u, "  remove directory %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    v9 = rmdir(a1);
    if (v9)
    {
      v10 = v9;
      __error();
      v11 = __error();
      strerror(*v11);
      sub_1000040E0(3u, "  FAILED status %d errno %d [%s] rmdir %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }
}

uint64_t sub_1000047E0(uint64_t a1, char *__s, const char *a3, __int16 a4)
{
  uint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t next;
  _QWORD v44[2];
  uint64_t v45;
  char __str[1024];

  result = 0;
  if (__s && a3)
  {
    v9 = strrchr(__s, 46);
    if (v9 && !strcmp(v9, ".gz"))
      a4 &= ~0x10u;
    if ((a4 & 0x10) != 0)
    {
      if ((a4 & 0x1000) == 0)
      {
        sub_1000040E0(5u, "  copy compress %s ---> %s.gz\n", v10, v11, v12, v13, v14, v15, (char)__s);
        if (byte_100010058)
          return 0;
        snprintf(__str, 0x400uLL, "%s.gz", a3);
        if (sub_100004460(a1, __s, __str))
        {
          __error();
          v25 = __error();
          strerror(*v25);
          sub_1000040E0(3u, "  FAILED status %d errno %d [%s] copy & compress %s ---> %s\n", v26, v27, v28, v29, v30, v31, -1);
          return 0;
        }
        return 1;
      }
    }
    else
    {
      result = strcmp(__s, a3);
      if (!(_DWORD)result)
        return result;
      if ((a4 & 0x1000) == 0)
      {
        sub_1000040E0(5u, "  copy %s ---> %s\n", v10, v11, v12, v13, v14, v15, (char)__s);
        if (byte_100010058)
          return 0;
        v16 = copyfile(__s, a3, 0, 0x800Fu);
        if (v16)
        {
          v17 = v16;
          __error();
          v18 = __error();
          strerror(*v18);
          sub_1000040E0(3u, "  FAILED status %d errno %d [%s] copy %s ---> %s\n", v19, v20, v21, v22, v23, v24, v17);
          return 0;
        }
        return 1;
      }
    }
    sub_1000040E0(5u, "  copy asl %s ---> %s\n", v10, v11, v12, v13, v14, v15, (char)__s);
    if (byte_100010058)
      return 0;
    v32 = *(unsigned __int16 *)(a1 + 116);
    *(_QWORD *)__str = 0;
    v33 = asl_file_open_read(__s, __str);
    if ((_DWORD)v33)
    {
      v34 = v33;
      goto LABEL_23;
    }
    v45 = 0;
    v35 = asl_file_open_write(a3, v32, 0xFFFFFFFFLL, 0xFFFFFFFFLL, &v45);
    if ((_DWORD)v35)
    {
      v34 = v35;
    }
    else
    {
      if (v45)
      {
        *(_DWORD *)(v45 + 8) = 8;
        if (!asl_file_read_set_position(*(_QWORD *)__str, 0))
        {
          while (1)
          {
            v44[0] = 0;
            v44[1] = 0;
            next = asl_file_fetch_next(*(_QWORD *)__str, v44);
            if (!v44[0])
              break;
            v34 = next;
            if (!(_DWORD)next)
            {
              v34 = asl_file_save(v45);
              asl_msg_release(v44[0]);
              if (!(_DWORD)v34)
                continue;
            }
            goto LABEL_33;
          }
          v34 = 0;
LABEL_33:
          asl_file_close(*(_QWORD *)__str);
          asl_file_close(v45);
          if (!(_DWORD)v34)
            return 1;
LABEL_23:
          asl_core_error(v34);
          sub_1000040E0(3u, "  FAILED status %u [%s] asl copy %s ---> %s\n", v37, v38, v39, v40, v41, v42, v34);
          return 0;
        }
        asl_file_close(*(_QWORD *)__str);
        v34 = 7;
        v36 = (char *)&v45;
LABEL_22:
        asl_file_close(*(_QWORD *)v36);
        goto LABEL_23;
      }
      v34 = 9999;
    }
    v36 = __str;
    goto LABEL_22;
  }
  return result;
}

uint64_t sub_100004AB8(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v10[2];
  _QWORD v11[3];

  sub_1000040E0(5u, "  reset ctime %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  v11[1] = 0;
  v11[2] = 0;
  v11[0] = 0x20000000005;
  v10[1] = 0;
  v10[0] = time(0);
  return setattrlist(a1, v11, v10, 0x10uLL, 0);
}

uint64_t sub_100004B30(const char *a1)
{
  DIR *v2;
  DIR *v3;
  dirent *i;
  const char *d_name;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v21;

  v2 = opendir(a1);
  if (v2)
  {
    v3 = v2;
    v21 = 0;
    for (i = readdir(v2); i; i = readdir(v3))
    {
      d_name = i->d_name;
      if (strcmp(i->d_name, "."))
      {
        if (strcmp(d_name, ".."))
        {
          asprintf(&v21, "%s/%s", a1, d_name);
          if (v21)
          {
            sub_100004638(v21, v6, v7, v8, v9, v10, v11, v12);
            free(v21);
            v21 = 0;
          }
        }
      }
    }
    closedir(v3);
    sub_100004754(a1, v13, v14, v15, v16, v17, v18, v19);
  }
  return 0;
}

uint64_t sub_100004C00(const char *a1)
{
  DIR *v2;
  DIR *v3;
  dirent *v4;
  uint64_t i;
  const char *d_name;
  char *v8;
  stat v9;

  v2 = opendir(a1);
  if (!v2)
    return 0;
  v3 = v2;
  memset(&v9, 0, sizeof(v9));
  v8 = 0;
  v4 = readdir(v2);
  for (i = 0; v4; v4 = readdir(v3))
  {
    d_name = v4->d_name;
    if (strcmp(v4->d_name, "."))
    {
      if (strcmp(d_name, ".."))
      {
        memset(&v9, 0, sizeof(v9));
        v8 = 0;
        asprintf(&v8, "%s/%s", a1, d_name);
        if (v8)
        {
          if (!stat(v8, &v9) && (v9.st_mode & 0xF000) == 0x8000)
          {
            i += v9.st_size;
            free(v8);
          }
        }
      }
    }
  }
  closedir(v3);
  return i;
}

time_t sub_100004D40(unsigned __int8 *a1)
{
  int v1;
  char *v2;
  uint64_t v3;
  time_t result;
  int v5;
  int v6;
  int v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  int v46;
  int v47;
  tm v48;

  if (!a1)
    return -1;
  v1 = *a1;
  if ((v1 | 0x20) == 0x74)
  {
    v2 = (char *)(a1 + 1);
    v3 = atol((const char *)a1 + 1);
    if (v3 || *v2 == 48)
    {
      if (strchr(v2, 46))
        return v3;
      else
        return -1;
    }
    return -1;
  }
  memset(&v48, 0, sizeof(v48));
  if ((v1 - 58) < 0xFFFFFFF6)
    return 1;
  v5 = a1[1];
  if ((v5 - 58) < 0xFFFFFFF6)
    return 1;
  v6 = a1[2];
  if ((v6 - 58) < 0xFFFFFFF6)
    return 1;
  v7 = a1[3];
  if ((v7 - 58) < 0xFFFFFFF6)
    return 1;
  v8 = a1 + 5;
  v11 = a1[4];
  v9 = a1 + 4;
  v10 = v11;
  v48.tm_year = 10 * v6 + 100 * v5 + 1000 * v1 + v7 - 55228;
  v12 = v11 == 45 ? v8 : v9;
  v13 = v10 == 46 ? v8 : v12;
  v14 = *v13;
  if ((v14 - 58) < 0xFFFFFFF6)
    return 1;
  v15 = v13[1];
  if ((v15 - 58) < 0xFFFFFFF6)
    return 1;
  v48.tm_mon = v15 + 10 * v14 - 529;
  v16 = v13 + 2;
  v17 = 2;
  if (v13[2] - 45 < 2)
  {
    v17 = 3;
    v16 = v13 + 3;
  }
  v18 = v13[v17];
  if ((v18 - 58) < 0xFFFFFFF6)
    return 1;
  v19 = 10 * v18;
  v48.tm_mday = v19 - 480;
  v20 = v16[1];
  if ((v20 - 58) < 0xFFFFFFF6)
    return 1;
  v48.tm_mday = v19 + v20 - 528;
  v21 = v16[2];
  if (v10 == 46)
  {
    if (v21 == 46 || !v16[2])
    {
      *(_QWORD *)&v48.tm_sec = 0;
      v48.tm_hour = 24;
      v48.tm_isdst = -1;
      return mktime(&v48);
    }
    return -1;
  }
  if ((v21 | 0x20) != 0x74)
    return 1;
  v22 = v16[3];
  if ((v22 - 58) < 0xFFFFFFF6)
    return 1;
  v23 = 10 * v22;
  v48.tm_hour = v23 - 480;
  v24 = v16[4];
  if ((v24 - 58) < 0xFFFFFFF6)
    return 1;
  v48.tm_hour = v23 + v24 - 528;
  v25 = v16 + 5;
  v26 = 5;
  if (v16[5] == 58)
  {
    v26 = 6;
    v25 = v16 + 6;
  }
  v27 = v16[v26];
  if ((v27 - 58) < 0xFFFFFFF6)
    return 1;
  v28 = 10 * v27;
  v48.tm_min = v28 - 480;
  v29 = v25[1];
  if ((v29 - 58) < 0xFFFFFFF6)
    return 1;
  v48.tm_min = v28 + v29 - 528;
  v30 = v25[2] == 58 ? 3 : 2;
  v31 = (uint64_t)(v25[2] == 58 ? v25 + 3 : v25 + 2);
  v32 = v25[v30];
  if ((v32 - 58) < 0xFFFFFFF6)
    return 1;
  v33 = 10 * v32;
  v48.tm_sec = v33 - 480;
  v34 = *(unsigned __int8 *)(v31 + 1);
  if ((v34 - 58) < 0xFFFFFFF6)
    return 1;
  v35 = v33 + v34 - 528;
  v48.tm_sec = v35;
  v36 = *(unsigned __int8 *)(v31 + 2);
  result = 1;
  if (v36 > 0x59)
  {
    if (v36 == 122 || v36 == 90)
      return timegm(&v48);
  }
  else if (v36 == 43 || v36 == 45)
  {
    v37 = *(unsigned __int8 *)(v31 + 3);
    if ((v37 - 58) >= 0xFFFFFFF6)
    {
      v38 = v37 - 48;
      v40 = *(char *)(v31 + 4);
      v39 = (unsigned __int8 *)(v31 + 4);
      v41 = v40 + 10 * v38 - 48;
      if ((v40 - 58) >= 0xF6u)
      {
        v38 = v41;
        ++v39;
      }
      if (v38 <= 23)
      {
        v42 = *v39;
        if ((v42 - 48) > 0xA)
        {
          v45 = 0;
        }
        else
        {
          v43 = v39[1];
          if ((v43 - 58) < 0xFFFFFFF6)
            return -1;
          v44 = v42 == 58 ? -48 : 10 * v42 - 528;
          v45 = v44 + v43;
          if (v45 > 0x3B)
            return -1;
          v39 += 2;
        }
        v46 = 3600 * v38;
        if (v36 == 45)
          v47 = v46;
        else
          v47 = -v46;
        v48.tm_sec = v47 + v35 + 60 * v45;
        if (*v39 != 46 && *v39)
          return -1;
        return timegm(&v48);
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_10000510C(unsigned __int8 *a1, time_t a2, int *a3, int *a4)
{
  time_t v6;
  time_t v8;
  uint64_t v9;
  char *v10;
  char *v11;

  if (!a1)
    return 0;
  v6 = a2;
  if (!a2)
    v6 = time(0);
  v8 = sub_100004D40(a1);
  v9 = 0;
  if ((v8 & 0x8000000000000000) == 0 && v6 >= v8)
  {
    v9 = (v6 - v8);
    if (a3)
    {
      *a3 = -1;
      v10 = strchr((char *)a1, 85);
      if (v10)
        *a3 = atoi(v10 + 1);
    }
    if (a4)
    {
      *a4 = -1;
      v11 = strchr((char *)a1, 71);
      if (v11)
        *a4 = atoi(v11 + 1);
    }
  }
  return v9;
}

uint64_t sub_1000051D0(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
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
  int v34;
  uint64_t v35;
  std::__fs::filesystem::path v36[42];
  std::__fs::filesystem::path __str[42];

  v35 = 0;
  v34 = 0;
  if (snprintf((char *)__str, 0x400uLL, "%s/%s", a2, a1) > 1023
    || snprintf((char *)v36, 0x400uLL, "%s/%s", a2, a1) > 1023)
  {
    return 9999;
  }
  *(_DWORD *)((char *)&v36[0].__pn_.__r_.__value_.__l + strlen((const char *)__str) - 3) = 7368052;
  sub_100003F5C(a3);
  sub_1000040E0(5u, "  filter %s %s ---> %s\n", v14, v15, v16, v17, v18, v19, (char)__str);
  if (byte_100010058)
  {
    v12 = 0;
  }
  else
  {
    v12 = asl_file_open_read(a1, &v35);
    if ((_DWORD)v12)
      return v12;
    v12 = asl_file_filter_level(v35, v36, a3, a4, a5, a6, &v34, sub_100005378);
    asl_file_close(v35);
  }
  sub_100004638((const char *)__str, v20, v21, v22, v23, v24, v25, v26);
  if ((_DWORD)v12 || !v34)
  {
    sub_100004638((const char *)v36, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    sub_1000045A0(v36, __str, v28, v29, v30, v31, v32, v33);
    return 0;
  }
  return v12;
}

void sub_100005378(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    if (!strncmp(a1, "file:///var/log/asl/", 0x14uLL))
      sub_100004638(a1 + 7, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t sub_1000053BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  time_t v34;
  time_t v35;
  DIR *v36;
  DIR *v37;
  dirent *v38;
  dirent *v39;
  unint64_t v40;
  const char *d_name;
  off_t st_size;
  char *v43;
  _BOOL4 v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
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
  const char **v78;
  unsigned int v79;
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
  const char **v92;
  unsigned int v93;
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
  const char **v106;
  unsigned int v107;
  uint64_t v108;
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
  const char **v120;
  unsigned int v121;
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
  const char **v134;
  uint64_t v135;
  unsigned int v136;
  uint64_t v137;
  const char *v138;
  unsigned int v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  int v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
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
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char **v171;
  unint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char **v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char **v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char **v211;
  const char *v212;
  BOOL v213;
  const char **v214;
  const char *v215;
  BOOL v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  int *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char v230;
  char v231;
  char v232;
  char v233;
  char v234;
  char v235;
  char v236;
  char v237;
  char v238;
  char v239;
  char v240;
  char v241;
  char v242;
  char v243;
  time_t v244;
  time_t v245;
  unint64_t v246;
  uint64_t v247;
  const char **v248;
  const char **v249;
  const char **v250;
  const char **v251;
  unsigned int v252;
  unsigned int v253;
  tm v254;
  stat v255;
  char *v256;
  time_t v257;
  char __str[1024];
  _BYTE v259[128];
  uint64_t vars0;

  if (!result)
    return result;
  v8 = result;
  if (!*(_QWORD *)(result + 8))
    return 0;
  v9 = *(_DWORD *)(result + 112);
  if (a2)
  {
    if (*(_DWORD *)(a2 + 112))
      v9 = *(_DWORD *)(a2 + 112);
    if (*(_QWORD *)(a2 + 160))
      v10 = *(_QWORD *)(a2 + 160);
    else
      v10 = *(_QWORD *)(result + 160);
  }
  else
  {
    v10 = *(_QWORD *)(result + 160);
  }
  v256 = 0;
  v257 = 0;
  memset(&v255, 0, sizeof(v255));
  memset(&v254, 0, sizeof(v254));
  sub_1000040E0(5u, "----------------------------------------\n", a3, a4, a5, a6, a7, a8, v230);
  sub_1000040E0(5u, "Processing data store %s\n", v11, v12, v13, v14, v15, v16, *(_QWORD *)(v8 + 8));
  v17 = *(const char **)(v8 + 32);
  if (v17)
  {
    memset(&v255, 0, sizeof(v255));
    if (stat(v17, &v255))
    {
      v24 = __error();
      v25 = *(_QWORD *)(v8 + 32);
      if (*v24 != 2)
      {
        v53 = __error();
        strerror(*v53);
        sub_1000040E0(3u, "aslmanager error: can't stat archive %s: %s\n", v54, v55, v56, v57, v58, v59, v25);
        return 0xFFFFFFFFLL;
      }
      if (mkdir(*(const char **)(v8 + 32), 0x1EDu))
      {
        v26 = *(_QWORD *)(v8 + 32);
        v27 = __error();
        strerror(*v27);
        sub_1000040E0(3u, "aslmanager error: can't create archive %s: %s\n", v28, v29, v30, v31, v32, v33, v26);
        return 0xFFFFFFFFLL;
      }
    }
    else if ((v255.st_mode & 0xF000) != 0x4000)
    {
      sub_1000040E0(3u, "aslmanager error: archive %s is not a directory", v18, v19, v20, v21, v22, v23, *(_QWORD *)(v8 + 32));
      return 0xFFFFFFFFLL;
    }
  }
  chdir(*(const char **)(v8 + 8));
  v257 = time(0);
  localtime_r(&v257, &v254);
  *(_QWORD *)&v254.tm_sec = 0;
  v254.tm_hour = 0;
  v34 = mktime(&v254);
  v35 = v257;
  v36 = opendir(*(const char **)(v8 + 8));
  if (!v36)
    return 0xFFFFFFFFLL;
  v37 = v36;
  v244 = v35;
  v245 = v34;
  v38 = readdir(v36);
  v246 = v10;
  if (v38)
  {
    v39 = v38;
    v250 = 0;
    v251 = 0;
    v248 = 0;
    v249 = 0;
    v40 = 0;
    while (1)
    {
      d_name = v39->d_name;
      memset(&v255, 0, sizeof(v255));
      if (stat(v39->d_name, &v255))
        st_size = 0;
      else
        st_size = v255.st_size;
      v43 = strrchr(v39->d_name, 46);
      if (v43)
        v44 = strcmp(v43, ".gz") == 0;
      else
        v44 = 0;
      v45 = *(unsigned __int8 *)d_name;
      if ((v45 - 48) <= 9
        || (v45 | 0x20) == 0x74 && v39->d_name[1] - 48 <= 9)
      {
        v251 = sub_100004348(v251, v39->d_name, (char *)st_size, v44);
      }
      else
      {
        if (!strncmp(v39->d_name, "AUX.", 4uLL)
          && v39->d_name[4] - 48 <= 9
          && (v255.st_mode & 0xF000) == 0x4000)
        {
          v46 = sub_100004C00(v39->d_name);
          v249 = sub_100004348(v249, d_name, (char *)v46, v44);
LABEL_40:
          v40 += v46;
          goto LABEL_30;
        }
        if (!strncmp(v39->d_name, "BB.AUX.", 7uLL)
          && v39->d_name[7] - 48 <= 9
          && (v255.st_mode & 0xF000) == 0x4000)
        {
          v46 = sub_100004C00(v39->d_name);
          v248 = sub_100004348(v248, d_name, (char *)v46, v44);
          goto LABEL_40;
        }
        if (strncmp(v39->d_name, "BB.", 3uLL) || v39->d_name[3] - 48 > 9)
        {
          if (strcmp(v39->d_name, ".")
            && strcmp(v39->d_name, "..")
            && strcmp(v39->d_name, "StoreData")
            && strcmp(v39->d_name, "SweepStore")
            && strcmp(v39->d_name, "Logs"))
          {
            sub_1000040E0(3u, "aslmanager: unexpected file %s in ASL data store\n", v47, v48, v49, v50, v51, v52, (_BYTE)v39 + 21);
          }
          goto LABEL_30;
        }
        v250 = sub_100004348(v250, v39->d_name, (char *)st_size, v44);
      }
      v40 += st_size;
LABEL_30:
      v39 = readdir(v37);
      if (!v39)
        goto LABEL_52;
    }
  }
  v248 = 0;
  v249 = 0;
  v40 = 0;
  v250 = 0;
  v251 = 0;
LABEL_52:
  v247 = v8;
  closedir(v37);
  sub_1000040E0(5u, "Data Store Size = %lu\n", v60, v61, v62, v63, v64, v65, v40);
  asl_core_time_to_str(v9, v259, 128);
  sub_1000040E0(5u, "Data Store YMD Files (TTL = %s)\n", v66, v67, v68, v69, v70, v71, &vars0 + 24);
  if (v251)
  {
    v78 = v251;
    do
    {
      v79 = sub_10000510C((unsigned __int8 *)*v78, v257, 0, 0);
      asl_core_time_to_str(v79, v259, 128);
      sub_1000040E0(5u, "  %s   %lu (age %s%s)\n", v80, v81, v82, v83, v84, v85, (char)*v78);
      v78 = (const char **)v78[3];
    }
    while (v78);
  }
  sub_1000040E0(5u, "Data Store AUX Directories\n", v72, v73, v74, v75, v76, v77, v231);
  if (v249)
  {
    v92 = v249;
    do
    {
      v93 = sub_10000510C((unsigned __int8 *)*v92 + 4, v257, 0, 0) / 0x15180;
      asl_core_time_to_str(v93, v259, 128);
      sub_1000040E0(5u, "  %s   %lu (age %s)\n", v94, v95, v96, v97, v98, v99, (char)*v92);
      v92 = (const char **)v92[3];
    }
    while (v92);
  }
  sub_1000040E0(5u, "Data Store BB.AUX Directories\n", v86, v87, v88, v89, v90, v91, v232);
  if (v248)
  {
    v106 = v248;
    do
    {
      v107 = sub_10000510C((unsigned __int8 *)*v106 + 7, v257, 0, 0);
      asl_core_time_to_str(v107, v259, 128);
      sub_1000040E0(5u, "  %s   %lu (age %s)\n", v108, v109, v110, v111, v112, v113, (char)*v106);
      v106 = (const char **)v106[3];
    }
    while (v106);
  }
  sub_1000040E0(5u, "Data Store BB Files\n", v100, v101, v102, v103, v104, v105, v233);
  if (v250)
  {
    v120 = v250;
    do
    {
      v121 = sub_10000510C((unsigned __int8 *)*v120 + 3, v257, 0, 0);
      asl_core_time_to_str(v121 / 0x15180, v259, 128);
      sub_1000040E0(5u, "  %s   %lu (age %s)\n", v122, v123, v124, v125, v126, v127, (char)*v120);
      v120 = (const char **)v120[3];
    }
    while (v120);
  }
  sub_1000040E0(5u, "Start YMD File Scan\n", v114, v115, v116, v117, v118, v119, v234);
  v134 = v251;
  if (v251)
  {
    v135 = v247;
    do
    {
      v252 = -1;
      v253 = -1;
      v136 = sub_10000510C((unsigned __int8 *)*v134, v257, (int *)&v253, (int *)&v252);
      if (v136 <= v9)
      {
        if (((_BYTE)v134[2] & 1) == 0)
        {
          v139 = v136;
          if (v136)
          {
            v140 = 0;
            v141 = 1;
            LODWORD(v142) = 255;
            do
            {
              if (*(_DWORD *)(v247 + 80 + v140) - 1 < v136)
                v143 = ~v141;
              else
                v143 = -1;
              v142 = v143 & v142;
              v141 *= 2;
              v140 += 4;
            }
            while (v140 != 32);
            memset(&v255, 0, sizeof(v255));
            v144 = stat(*v134, &v255);
            if ((_DWORD)v142 != 255)
            {
              if (v144)
                v145 = 384;
              else
                v145 = v255.st_mode & 0x1FF;
              sub_1000051D0(*v134, *(const char **)(v247 + 8), v142, v145, v253, v252);
            }
          }
          if (v244 - v245 < v139 && (*(_BYTE *)(v247 + 72) & 0x10) != 0)
          {
            snprintf(__str, 0x400uLL, "%s.gz", *v134);
            sub_1000040E0(5u, "  compress %s ---> %s\n", v146, v147, v148, v149, v150, v151, (char)*v134);
            if (!byte_100010058)
            {
              if (sub_100004460(v247, *v134, __str))
              {
                __error();
                v223 = __error();
                strerror(*v223);
                sub_1000040E0(3u, "  FAILED status %d errno %d [%s] compress %s ---> %s\n", v224, v225, v226, v227, v228, v229, -1);
                return 0;
              }
              sub_100004638(*v134, v152, v153, v154, v155, v156, v157, v158);
            }
          }
        }
      }
      else
      {
        v138 = *(const char **)(v247 + 32);
        if (v138)
        {
          v256 = 0;
          asprintf(&v256, "%s/%s", v138, *v134);
          if (!v256)
            return 0xFFFFFFFFLL;
          sub_1000047E0(v247, (char *)*v134, v256, 0);
          free(v256);
        }
        sub_100004638(*v134, v137, v128, v129, v130, v131, v132, v133);
        v40 -= (unint64_t)v134[1];
        v134[1] = 0;
      }
      v134 = (const char **)v134[3];
    }
    while (v134);
  }
  else
  {
    v135 = v247;
  }
  sub_1000040E0(5u, "Finished YMD File Scan\n", v128, v129, v130, v131, v132, v133, v235);
  sub_1000040E0(5u, "Start AUX Directory Scan\n", v159, v160, v161, v162, v163, v164, v236);
  if (v249)
  {
    v171 = v249;
    v172 = v246;
    do
    {
      if (sub_10000510C((unsigned __int8 *)*v171 + 4, v257, 0, 0) > v9)
      {
        v173 = *(const char **)(v135 + 32);
        if (v173)
        {
          v256 = 0;
          asprintf(&v256, "%s/%s", v173, *v171);
          if (!v256)
            return 0xFFFFFFFFLL;
          sub_1000047E0(v135, (char *)*v171, v256, 0);
          free(v256);
        }
        sub_100004B30(*v171);
        v40 -= (unint64_t)v171[1];
        v171[1] = 0;
      }
      v171 = (const char **)v171[3];
    }
    while (v171);
  }
  else
  {
    v172 = v246;
  }
  sub_1000040E0(5u, "Finished AUX Directory Scan\n", v165, v166, v167, v168, v169, v170, v237);
  sub_1000040E0(5u, "Start BB.AUX Directory Scan\n", v174, v175, v176, v177, v178, v179, v238);
  if (v248)
  {
    v186 = v248;
    v187 = (uint64_t)v250;
    do
    {
      if (sub_10000510C((unsigned __int8 *)*v186 + 7, v257, 0, 0))
      {
        v188 = *(const char **)(v135 + 32);
        if (v188)
        {
          v256 = 0;
          asprintf(&v256, "%s/%s", v188, *v186);
          if (!v256)
            return 0xFFFFFFFFLL;
          sub_1000047E0(v135, (char *)*v186, v256, 0);
          free(v256);
        }
        sub_100004B30(*v186);
        v40 -= (unint64_t)v186[1];
        v186[1] = 0;
      }
      v186 = (const char **)v186[3];
    }
    while (v186);
  }
  else
  {
    v187 = (uint64_t)v250;
  }
  sub_1000040E0(5u, "Finished BB.AUX Directory Scan\n", v180, v181, v182, v183, v184, v185, v239);
  sub_1000040E0(5u, "Start BB Scan\n", v189, v190, v191, v192, v193, v194, v240);
  if (v187)
  {
    v201 = (const char **)v187;
    do
    {
      if (sub_10000510C((unsigned __int8 *)*v201 + 3, v257, 0, 0))
      {
        v203 = *(const char **)(v135 + 32);
        if (v203)
        {
          v256 = 0;
          asprintf(&v256, "%s/%s", v203, *v201);
          if (!v256)
            return 0xFFFFFFFFLL;
          sub_1000047E0(v135, (char *)*v201, v256, 0);
          free(v256);
        }
        sub_100004638(*v201, v202, v195, v196, v197, v198, v199, v200);
        v40 -= (unint64_t)v201[1];
        v201[1] = 0;
      }
      v201 = (const char **)v201[3];
    }
    while (v201);
  }
  sub_1000040E0(5u, "Finished BB Scan\n", v195, v196, v197, v198, v199, v200, v241);
  if (!v172)
    goto LABEL_150;
  if (v40 <= v172)
    goto LABEL_138;
  sub_1000040E0(5u, "Additional YMD Scan\n", v205, v206, v207, v208, v209, v210, v242);
  v211 = v251;
  if (!v251)
    goto LABEL_137;
  do
  {
    while (1)
    {
      if (!v211[1])
        goto LABEL_132;
      if (sub_10000510C((unsigned __int8 *)*v211, v257, 0, 0))
        break;
      v211 = (const char **)v211[3];
      if (!v211)
        goto LABEL_137;
    }
    v212 = *(const char **)(v135 + 32);
    if (v212)
    {
      v256 = 0;
      asprintf(&v256, "%s/%s", v212, *v211);
      if (!v256)
        return 0xFFFFFFFFLL;
      sub_1000047E0(v135, (char *)*v211, v256, 0);
      free(v256);
    }
    sub_100004638(*v211, v204, v205, v206, v207, v208, v209, v210);
    v40 -= (unint64_t)v211[1];
    v211[1] = 0;
LABEL_132:
    v211 = (const char **)v211[3];
    if (v211)
      v213 = v40 > v172;
    else
      v213 = 0;
  }
  while (v213);
  if (v40 > v172)
LABEL_137:
    sub_1000040E0(5u, "Additional BB Scan\n", v205, v206, v207, v208, v209, v210, v243);
LABEL_138:
  if (v187 && v40 > v172)
  {
    v214 = (const char **)v187;
    do
    {
      if (v214[1])
      {
        v215 = *(const char **)(v135 + 32);
        if (v215)
        {
          v256 = 0;
          asprintf(&v256, "%s/%s", v215, *v214);
          if (!v256)
            return 0xFFFFFFFFLL;
          sub_1000047E0(v135, (char *)*v214, v256, 0);
          free(v256);
        }
        sub_100004638(*v214, v204, v205, v206, v207, v208, v209, v210);
        v40 -= (unint64_t)v214[1];
        v214[1] = 0;
      }
      v214 = (const char **)v214[3];
      if (v214)
        v216 = v40 > v172;
      else
        v216 = 0;
    }
    while (v216);
  }
LABEL_150:
  sub_100004424((uint64_t)v251);
  sub_100004424(v187);
  sub_100004424((uint64_t)v249);
  sub_100004424((uint64_t)v248);
  sub_1000040E0(5u, "Data Store Size = %lu\n", v217, v218, v219, v220, v221, v222, v40);
  return 0;
}

uint64_t sub_100006010(uint64_t a1)
{
  DIR *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  DIR *v9;
  const char *v10;
  DIR *dd_seek;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  DIR *v20;
  DIR *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  DIR *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  DIR *v36;
  int *v37;
  DIR *v38;
  const char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  DIR *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  DIR *v58;
  int v59;
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
  char v74;
  char v75;
  uint64_t v76;
  char v77[32];
  std::__fs::filesystem::path v78[42];
  std::__fs::filesystem::path __str[42];

  if (!a1 || !*(_QWORD *)(a1 + 8))
    return 0xFFFFFFFFLL;
  v2 = asl_list_src_files(a1);
  if (!v2)
    goto LABEL_30;
  v9 = v2;
  if (LODWORD(v2->__dd_loc))
    goto LABEL_11;
  if ((*(_BYTE *)(a1 + 72) & 0x40) == 0)
  {
    v10 = "    ignore src file %s since it is internal and syslogd will checkpoint it when it needs to be renamed\n";
    goto LABEL_10;
  }
  if (time(0) - v2->__dd_size > 86399)
  {
LABEL_11:
    sub_1000040E0(6u, "    src files\n", v3, v4, v5, v6, v7, v8, v74);
    v19 = 0;
    v20 = v9;
    do
    {
      sub_1000040E0(6u, "      %s\n", v13, v14, v15, v16, v17, v18, *(_QWORD *)&v20->__dd_fd);
      ++v19;
      v20 = (DIR *)v20->__dd_seek;
    }
    while (v20);
    v21 = asl_list_dst_files(a1);
    v28 = v21;
    v29 = *(const char **)(a1 + 32);
    if (!v29)
      v29 = *(const char **)a1;
    v76 = (uint64_t)v21;
    if (v21)
    {
      sub_1000040E0(6u, "    dst files\n", v22, v23, v24, v25, v26, v27, v75);
      v36 = v28;
      do
      {
        sub_1000040E0(6u, "      %s\n", v30, v31, v32, v33, v34, v35, *(_QWORD *)&v36->__dd_fd);
        v36 = (DIR *)v36->__dd_seek;
      }
      while (v36);
      v37 = (int *)(a1 + 64);
      if ((*(_BYTE *)(a1 + 64) & 2) != 0)
      {
        v38 = v28;
        do
        {
          v39 = *(const char **)&v38->__dd_fd;
          v40 = strrchr(*(char **)&v38->__dd_fd, 46);
          if (v40)
            strcmp(v40, ".gz");
          snprintf((char *)__str, 0x400uLL, "%s/%s", v29, v39);
          v47 = *v37;
          if ((*v37 & 0x10000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d%s");
          }
          else if ((v47 & 0x20000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%s.%d%s");
          }
          else if ((v47 & 0x40000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d.%s%s");
          }
          sub_1000045A0(__str, v78, v41, v42, v43, v44, v45, v46);
          v38 = (DIR *)v38->__dd_seek;
        }
        while (v38);
        goto LABEL_49;
      }
    }
    else
    {
      sub_1000040E0(6u, "    no dst files\n", v22, v23, v24, v25, v26, v27, v75);
      v37 = (int *)(a1 + 64);
      if ((*(_BYTE *)(a1 + 64) & 2) != 0)
      {
LABEL_49:
        v57 = 0;
        v58 = v9;
        do
        {
          snprintf((char *)__str, 0x400uLL, "%s/%s", *(const char **)a1, *(const char **)&v58->__dd_fd);
          v59 = *(_DWORD *)(a1 + 64);
          if ((v59 & 0x10000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d");
          }
          else if ((v59 & 0x20000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%s.%d");
          }
          else if ((v59 & 0x40000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d.%s");
          }
          if (sub_1000047E0(a1, (char *)__str, (const char *)v78, *(_DWORD *)(a1 + 72)))
          {
            if ((*(_BYTE *)(a1 + 72) & 0x80) != 0)
            {
              sub_1000046C4((const char *)__str, v60, v61, v62, v63, v64, v65, v66);
              sub_100004AB8((const char *)__str, v67, v68, v69, v70, v71, v72, v73);
            }
            else
            {
              sub_100004638((const char *)__str, v60, v61, v62, v63, v64, v65, v66);
            }
          }
          v58 = (DIR *)v58->__dd_seek;
          ++v57;
        }
        while (v58);
LABEL_61:
        asl_out_file_list_free((uint64_t)v9);
        asl_out_file_list_free(v76);
        return 0;
      }
    }
    v48 = v9;
    do
    {
      if ((*(_BYTE *)(a1 + 73) & 1) != 0 && !v48->__dd_seek)
        break;
      snprintf((char *)__str, 0x400uLL, "%s/%s", *(const char **)a1, *(const char **)&v48->__dd_fd);
      if ((*(_BYTE *)(a1 + 72) & 0x40) != 0)
      {
        asl_make_timestamp(v48->__dd_size, *v37, v77, 0x20uLL);
        v49 = *v37;
        if ((*v37 & 0x10000000) != 0)
        {
          snprintf((char *)v78, 0x400uLL, "%s/%s.%s");
        }
        else if ((v49 & 0x20000000) != 0 || (v49 & 0x40000000) != 0)
        {
          snprintf((char *)v78, 0x400uLL, "%s/%s.%s.%s");
        }
      }
      else
      {
        snprintf((char *)v78, 0x400uLL, "%s/%s");
      }
      if (sub_1000047E0(a1, (char *)__str, (const char *)v78, *(_DWORD *)(a1 + 72)))
      {
        if ((*(_BYTE *)(a1 + 72) & 0x80) != 0)
          sub_1000046C4((const char *)__str, v50, v51, v52, v53, v54, v55, v56);
        else
          sub_100004638((const char *)__str, v50, v51, v52, v53, v54, v55, v56);
      }
      v48 = (DIR *)v48->__dd_seek;
    }
    while (v48);
    goto LABEL_61;
  }
  v10 = "    ignore src file %s since it is external and less than a day old\n";
LABEL_10:
  sub_1000040E0(6u, v10, v3, v4, v5, v6, v7, v8, *(_QWORD *)&v9->__dd_fd);
  dd_seek = (DIR *)v9->__dd_seek;
  v9->__dd_seek = 0;
  asl_out_file_list_free((uint64_t)v9);
  v9 = dd_seek;
  if (dd_seek)
    goto LABEL_11;
LABEL_30:
  sub_1000040E0(6u, "    no src files\n", v3, v4, v5, v6, v7, v8, v74);
  return 0;
}

uint64_t sub_100006508(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  time_t v4;
  uint64_t result;
  time_t v6;
  char *v7;
  char *v8;
  DIR *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  DIR *v16;
  const char *v17;
  time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  DIR *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  DIR *v34;
  char __str[1024];

  if (!a1 || !*(_QWORD *)(a1 + 8))
    return 0xFFFFFFFFLL;
  v3 = *(_DWORD *)(a1 + 112);
  if (!v3)
    return 0;
  if (a2 && *(_DWORD *)(a2 + 112))
    v3 = *(_DWORD *)(a2 + 112);
  v4 = time(0);
  if (v4 < v3)
    return 0;
  v6 = v4;
  v7 = strrchr(*(char **)(a1 + 8), 47);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = v7;
  v9 = asl_list_dst_files(a1);
  v16 = v9;
  *v8 = 0;
  v17 = *(const char **)(a1 + 32);
  if (!v17)
    v17 = *(const char **)a1;
  if (v9)
  {
    v18 = v3;
    sub_1000040E0(6u, "    dst files\n", v10, v11, v12, v13, v14, v15, v33);
    v34 = v16;
    do
    {
      asl_core_time_to_str(v6 - v16->__dd_size, __str, 150);
      sub_1000040E0(6u, "      %s (age %s%s)\n", v19, v20, v21, v22, v23, v24, *(_QWORD *)&v16->__dd_fd);
      v16 = (DIR *)v16->__dd_seek;
    }
    while (v16);
    v16 = v34;
    v25 = v34;
    do
    {
      if (v6 - v25->__dd_size > v18)
      {
        snprintf(__str, 0x400uLL, "%s/%s", v17, *(const char **)&v25->__dd_fd);
        sub_100004638(__str, v26, v27, v28, v29, v30, v31, v32);
      }
      v25 = (DIR *)v25->__dd_seek;
    }
    while (v25);
  }
  else
  {
    sub_1000040E0(6u, "    no dst files\n", v10, v11, v12, v13, v14, v15, v33);
  }
  asl_out_file_list_free((uint64_t)v16);
  result = 0;
  *v8 = 47;
  return result;
}

uint64_t sub_1000066D8(const char **a1, uint64_t a2, char a3, unint64_t *a4)
{
  const char *v7;
  DIR *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
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
  char v38;
  char __str[1024];

  v7 = a1[20];
  if (a2 && *(_QWORD *)(a2 + 160))
    v7 = *(const char **)(a2 + 160);
  if (!a1[1])
    return 0xFFFFFFFFLL;
  if (v7)
  {
    v8 = asl_list_dst_files((uint64_t)a1);
    if (v8)
    {
      v15 = (uint64_t)v8;
      v16 = a1[4];
      if (!v16)
        v16 = *a1;
      sub_1000040E0(6u, "    dst files\n", v9, v10, v11, v12, v13, v14, v38);
      v23 = (_QWORD *)v15;
      do
      {
        sub_1000040E0(6u, "      %s size %lu\n", v17, v18, v19, v20, v21, v22, *v23);
        v23 = (_QWORD *)v23[5];
      }
      while (v23);
      v24 = 0;
      v25 = v15;
      do
      {
        v26 = *(_QWORD *)(v25 + 32);
        v25 = *(_QWORD *)(v25 + 40);
        v24 += v26;
      }
      while (v25);
      if ((a3 & 1) == 0 && v24 > (unint64_t)v7)
      {
        v27 = v15;
        do
        {
          snprintf(__str, 0x400uLL, "%s/%s", v16, *(const char **)v27);
          sub_100004638(__str, v28, v29, v30, v31, v32, v33, v34);
          v35 = *(_QWORD *)(v27 + 32);
          v27 = *(_QWORD *)(v27 + 40);
          v24 -= v35;
        }
        while (v24 > (unint64_t)v7 && v27 != 0);
      }
      if (a4)
        *a4 = v24;
      asl_out_file_list_free(v15);
    }
    else
    {
      sub_1000040E0(6u, "    no dst files\n", v9, v10, v11, v12, v13, v14, v38);
    }
  }
  return 0;
}

uint64_t sub_100006850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  uint64_t v11;
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
  char v32;
  _BYTE v33[150];

  v10 = *(_DWORD *)(a1 + 112);
  if (a2)
  {
    if (*(_DWORD *)(a2 + 112))
      v10 = *(_DWORD *)(a2 + 112);
    if (*(_QWORD *)(a2 + 160))
      v11 = *(_QWORD *)(a2 + 160);
    else
      v11 = *(_QWORD *)(a1 + 160);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 160);
  }
  v12 = *(_DWORD *)(a1 + 72);
  if ((v12 & 4) != 0)
  {
    sub_1000040E0(5u, "Checking file %s\n", a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 8));
    sub_1000040E0(5u, "- Rename, move to destination directory, and compress as required\n", v13, v14, v15, v16, v17, v18, v32);
    sub_100006010(a1);
    if (v10 && (*(_BYTE *)(a1 + 73) & 0x80) == 0)
    {
      asl_core_time_to_str(v10, v33, 150);
      sub_1000040E0(5u, "- Check for expired files - TTL = %s\n", v25, v26, v27, v28, v29, v30, (char)v33);
      sub_100006508(a1, a2);
    }
    if (v11)
    {
      sub_1000040E0(5u, "- Check total storage used - MAX = %lu\n", v19, v20, v21, v22, v23, v24, v11);
      sub_1000066D8((const char **)a1, a2, 0, 0);
    }
  }
  else if ((v12 & 0x2000) != 0 && v10)
  {
    sub_1000053BC(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  return 0;
}

uint64_t sub_100006998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  const char *v27;
  char v28;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (a2)
    v10 = *(_DWORD *)(a2 + 72);
  else
    v10 = 0;
  sub_1000040E0(5u, "----------------------------------------\n", a3, a4, a5, a6, a7, a8, v28);
  v18 = *(const char **)a1;
  if (!*(_QWORD *)a1)
    v18 = "asl.conf";
  sub_1000040E0(5u, "Processing module %s\n", v12, v13, v14, v15, v16, v17, (char)v18);
  for (i = *(_QWORD *)(a1 + 16); i; i = *(_QWORD *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      v26 = *(_QWORD *)(i + 24);
      if (!v10 || (*(_DWORD *)(v26 + 72) & v10) != 0)
        sub_100006850(v26, a2, v19, v20, v21, v22, v23, v24);
    }
  }
  v27 = *(const char **)a1;
  if (!*(_QWORD *)a1)
    v27 = "asl.conf";
  sub_1000040E0(5u, "Finished processing module %s\n", v19, v20, v21, v22, v23, v24, (char)v27);
  return 0;
}

uint64_t sub_100006A80(uint64_t a1)
{
  const char *v2;
  char *v3;
  uint64_t v4;
  vm_address_t address;
  uint64_t v7;
  int v8;
  unsigned int size;
  unsigned int size_4;
  vm_address_t v11;
  char *v12;

  if (!dword_100010020
    && bootstrap_look_up2(bootstrap_port, "com.apple.system.logger", &dword_100010020, 0, 8))
  {
    v4 = 0;
    dword_100010020 = 0;
    return v4;
  }
  size_4 = 0;
  address = 0;
  v2 = (const char *)asl_msg_to_string(a1, &size_4);
  v12 = 0;
  if (v2)
  {
    v3 = (char *)v2;
    asprintf(&v12, "1\n%s [= ASLOption control]\n", v2);
    free(v3);
  }
  else
  {
    asprintf(&v12, "1\nQ [= ASLOption control]\n");
  }
  if (!v12)
    return 0;
  size = 0;
  size_4 = strlen(v12) + 1;
  v7 = 0;
  v11 = 0;
  v4 = 0;
  if (!vm_allocate(mach_task_self_, &address, size_4, 1358954497))
  {
    memmove((void *)address, v12, size_4);
    free(v12);
    v8 = 0;
    v4 = 0;
    if (!_asl_server_query_2(dword_100010020, address, size_4, 0, 1, 0, &v11, &size, &v7, &v8))
    {
      if (v11)
      {
        v4 = asl_msg_list_from_string();
        vm_deallocate(mach_task_self_, v11, size);
        return v4;
      }
      return 0;
    }
  }
  return v4;
}

uint64_t sub_100006C00(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;

  if (a1)
    v8 = a1;
  else
    v8 = "*";
  sub_1000040E0(5u, "Checkpoint module %s\n", a3, a4, a5, a6, a7, a8, (char)v8);
  if (!byte_100010058)
  {
    v9 = asl_msg_new(1);
    v12 = 0;
    asprintf(&v12, "%s checkpoint", v8);
    asl_msg_set_key_val_op(v9, "action", v12, 1);
    free(v12);
    v10 = sub_100006A80(v9);
    asl_msg_list_release(v10);
  }
  return 0;
}

uint64_t sub_100006CA4(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  char v11;
  int v12;
  const char *v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  time_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  BOOL v31;
  _BYTE *v32;
  char *i;
  int v34;
  const char **v36;
  const char **v37;
  unsigned int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  const char *v42;
  int v43;
  const char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  _OWORD *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  char *v52;
  _BYTE *v53;
  int v54;
  _BYTE *v55;
  _OWORD *v56;
  _BYTE *v57;
  _BYTE *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD *v72;
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
  const char *v86;
  int v88;
  char v89;
  char v90;
  uint64_t v91;
  int v92;
  char *__filename;
  void *v94;
  _OWORD v95[7];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  _OWORD v102[7];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  char __str[32];

  if (geteuid())
  {
    if (a1)
      v88 = 32;
    else
      v88 = 64;
    dword_100010048 = v88;
    sub_1000040E0(3u, "aslmanager must be run by root\n", v4, v5, v6, v7, v8, v9, v89);
    exit(1);
  }
  v10 = 0;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v103 = 0u;
  memset(v102, 0, sizeof(v102));
  LODWORD(v103) = 604800;
  v96 = 0u;
  LODWORD(v96) = 604800;
  v108 = 0;
  v106 = 0x8F0D180uLL;
  memset(v95, 0, sizeof(v95));
  v97 = 0u;
  v98 = 0u;
  v100 = 0u;
  v101 = 0;
  v99 = 0x8F0D180uLL;
  if (a1 < 2)
    goto LABEL_16;
  v11 = 0;
  v10 = 0;
  v12 = 1;
  do
  {
    v13 = *(const char **)(a2 + 8 * v12);
    if (!strcmp(v13, "-q") || !strcmp(v13, "-dd"))
    {
      v11 = 1;
    }
    else
    {
      v14 = strcmp(v13, "-s");
      v15 = v12 + 1;
      if (v14)
        v16 = 0;
      else
        v16 = (int)v15 < a1;
      if (v16)
      {
        v17 = *(const char **)(a2 + 8 * v15);
        if (*v17 != 45)
        {
          *((_QWORD *)&v102[0] + 1) = strdup(v17);
          v10 = v102;
          ++v12;
        }
      }
    }
    ++v12;
  }
  while (v12 < a1);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    v94 = 0;
    if (!asl_make_database_dir(0, 0) && !asl_make_database_dir("Logs", (char **)&v94))
    {
      __filename = 0;
      v18 = time(0);
      asl_make_timestamp(v18, 32, __str, 0x20uLL);
      asprintf(&__filename, "%s/aslmanager.%s", (const char *)v94, __str);
      if (__filename)
      {
        qword_100010050 = (uint64_t)fopen(__filename, "w");
        if (qword_100010050)
          dword_100010048 |= 0x10u;
        free(__filename);
      }
    }
    free(v94);
  }
  v19 = asl_out_module_init();
  v26 = v19;
  if (v19)
  {
    v27 = *((_QWORD *)v19 + 2);
    if (v27 && !v10)
    {
      do
      {
        v28 = *(_QWORD *)(v27 + 24);
        if (v28
          && *(_DWORD *)(v27 + 8) == 2
          && (v29 = *(const char **)(v28 + 8), v30 = (const char *)asl_filesystem_path(0), !strcmp(v29, v30)))
        {
          v10 = *(_OWORD **)(v27 + 24);
        }
        else
        {
          v10 = 0;
        }
        v27 = *(_QWORD *)(v27 + 40);
        if (v27)
          v31 = v10 == 0;
        else
          v31 = 0;
      }
      while (v31);
      v27 = *((_QWORD *)v26 + 2);
    }
    for (; v27; v27 = *(_QWORD *)(v27 + 40))
    {
      if (*(_DWORD *)(v27 + 8) == 1 && !*(_QWORD *)v27)
      {
        v32 = *(_BYTE **)(v27 + 16);
        if (v32)
        {
          if (*v32)
          {
            for (i = *v32 == 61 ? v32 + 1 : *(char **)(v27 + 16); ; ++i)
            {
              v34 = *i;
              if (v34 != 32 && v34 != 9)
                break;
            }
            v36 = (const char **)explode(i, " \t");
            if (v36)
            {
              v37 = v36;
              v38 = -1;
              do
                ++v38;
              while (v36[v38]);
              if (v38 >= 2)
              {
                v39 = *v36;
                if (!strcasecmp(*v36, "aslmanager_debug"))
                {
                  sub_10000402C((const char *)0x40, (char *)v37[1]);
                }
                else if (!strcasecmp(v39, "store_ttl"))
                {
                  *((_DWORD *)v10 + 28) = asl_core_str_to_time(v37[1], 86400);
                }
                else if (!strcasecmp(v39, "module_ttl"))
                {
                  asl_core_str_to_time(v37[1], 86400);
                }
                else if (!strcasecmp(v39, "max_store_size"))
                {
                  *((_QWORD *)v10 + 20) = asl_core_str_to_size(v37[1]);
                }
                else if (!strcasecmp(v39, "archive"))
                {
                  free(*((void **)v10 + 4));
                  *((_QWORD *)v10 + 4) = 0;
                  if (!strcmp(v37[1], "1"))
                  {
                    v41 = v37[2];
                    if (!v41)
                      v41 = (const char *)asl_filesystem_path(1);
                    *((_QWORD *)v10 + 4) = strdup(v41);
                  }
                }
                else if (!strcasecmp(v39, "store_path"))
                {
                  free(*((void **)v10 + 1));
                  *((_QWORD *)v10 + 1) = strdup(v37[1]);
                }
                else if (!strcasecmp(v39, "archive_mode"))
                {
                  v40 = strtol(v37[1], 0, 0);
                  *((_WORD *)v10 + 58) = v40;
                  if (!v40 && *__error() == 22)
                    *((_WORD *)v10 + 58) = 256;
                }
              }
              free_string_list((void **)v37);
            }
          }
        }
      }
    }
  }
  v91 = (uint64_t)v26;
  if (a1 >= 2)
  {
    v42 = 0;
    v92 = 3;
    v43 = 1;
    while (1)
    {
      v44 = *(const char **)(a2 + 8 * v43);
      if (!strcmp(v44, "-a"))
      {
        if (v10)
          v48 = v10;
        else
          v48 = v102;
        v49 = v43 + 1;
        if ((int)v49 >= a1 || (v50 = *(const char **)(a2 + 8 * v49), *v50 == 45))
        {
          v51 = (const char *)asl_filesystem_path(1);
          v52 = strdup(v51);
        }
        else
        {
          v52 = strdup(v50);
          ++v43;
        }
        if (v10)
          v56 = v10;
        else
          v56 = v102;
        *((_QWORD *)v56 + 4) = v52;
        *((_WORD *)v56 + 58) = 256;
        v10 = v48;
        goto LABEL_128;
      }
      if (!strcmp(v44, "-store_ttl"))
      {
        v45 = v43 + 1;
        if ((int)v45 >= a1)
          goto LABEL_128;
        v53 = *(_BYTE **)(a2 + 8 * v45);
        if (*v53 == 45)
          goto LABEL_128;
        if (!v10)
          v10 = v102;
        v54 = asl_core_str_to_time(v53, 86400);
        goto LABEL_114;
      }
      if (!strcmp(v44, "-module_ttl"))
      {
        v45 = v43 + 1;
        if ((int)v45 >= a1)
          goto LABEL_128;
        v55 = *(_BYTE **)(a2 + 8 * v45);
        if (*v55 == 45)
          goto LABEL_128;
        asl_core_str_to_time(v55, 86400);
        goto LABEL_115;
      }
      if (!strcmp(v44, "-ttl"))
        break;
      if (!strcmp(v44, "-size"))
      {
        v45 = v43 + 1;
        if ((int)v45 >= a1)
          goto LABEL_128;
        v58 = *(_BYTE **)(a2 + 8 * v45);
        if (*v58 == 45)
          goto LABEL_128;
        v59 = asl_core_str_to_size(v58);
        *(_QWORD *)&v99 = v59;
        if (!v10)
          v10 = v102;
        *((_QWORD *)v10 + 20) = v59;
        goto LABEL_115;
      }
      if (!strcmp(v44, "-checkpoint"))
      {
        v60 = v92 | 4;
LABEL_127:
        v92 = v60;
        goto LABEL_128;
      }
      if (!strcmp(v44, "-module"))
      {
        v92 &= ~1u;
        v61 = v43 + 1;
        if (v43 + 1 < a1 && **(_BYTE **)(a2 + 8 * v61) != 45)
        {
          ++v43;
          v42 = *(const char **)(a2 + 8 * v61);
        }
        goto LABEL_128;
      }
      if (!strcmp(v44, "-asldb"))
      {
        v60 = 1;
        goto LABEL_127;
      }
      if (!strcmp(v44, "-d"))
      {
        if (a1 <= 2 * v43 || (v45 = v43 + 1, v46 = *(char **)(a2 + 8 * v45), *v46 == 45))
        {
          v47 = 0;
          goto LABEL_133;
        }
LABEL_134:
        sub_10000402C((const char *)0x20, v46);
        goto LABEL_115;
      }
      if (!strcmp(v44, "-dd"))
      {
        byte_100010058 = 1;
        if (a1 <= 2 * v43 || (v45 = v43 + 1, v46 = *(char **)(a2 + 8 * v45), *v46 == 45))
        {
          v47 = "l7";
LABEL_133:
          sub_10000402C((const char *)0x20, v47);
          goto LABEL_128;
        }
        goto LABEL_134;
      }
LABEL_128:
      if (++v43 >= a1)
        goto LABEL_136;
    }
    v45 = v43 + 1;
    if ((int)v45 >= a1)
      goto LABEL_128;
    v57 = *(_BYTE **)(a2 + 8 * v45);
    if (*v57 == 45)
      goto LABEL_128;
    v54 = asl_core_str_to_time(v57, 86400);
    LODWORD(v96) = v54;
    if (!v10)
      v10 = v102;
LABEL_114:
    *((_DWORD *)v10 + 28) = v54;
LABEL_115:
    v43 = v45;
    goto LABEL_128;
  }
  v42 = 0;
  LOBYTE(v92) = 3;
LABEL_136:
  if (v10 && !*((_QWORD *)v10 + 1))
  {
    v62 = (const char *)asl_filesystem_path(0);
    *((_QWORD *)v10 + 1) = strdup(v62);
  }
  if (byte_100010058)
    v63 = " dryrun";
  else
    v63 = (const char *)&unk_10000B4B7;
  sub_1000040E0(3u, "aslmanager starting%s\n", v20, v21, v22, v23, v24, v25, (char)v63);
  if ((v92 & 1) != 0)
    sub_1000053BC((uint64_t)v10, (uint64_t)v95, v65, v66, v67, v68, v69, v70);
  if ((v92 & 2) != 0)
  {
    if ((v92 & 4) != 0)
      sub_100006C00(v42, v64, v65, v66, v67, v68, v69, v70);
    if (v91)
    {
      v71 = v91;
      do
      {
        if (v42)
        {
          if (!*(_QWORD *)v71 || strcmp(*(const char **)v71, v42))
            goto LABEL_155;
          v72 = v95;
          v73 = v71;
        }
        else
        {
          v73 = v71;
          v72 = 0;
        }
        sub_100006998(v73, (uint64_t)v72, v65, v66, v67, v68, v69, v70);
LABEL_155:
        v71 = *(_QWORD *)(v71 + 24);
      }
      while (v71);
    }
  }
  asl_out_module_free(v91);
  sub_1000040E0(5u, "----------------------------------------\n", v74, v75, v76, v77, v78, v79, v90);
  if (byte_100010058)
    v86 = " dryrun";
  else
    v86 = (const char *)&unk_10000B4B7;
  sub_1000040E0(3u, "aslmanager finished%s\n", v80, v81, v82, v83, v84, v85, (char)v86);
  sub_100004310();
  return 0;
}

void sub_10000754C()
{
  uint64_t v0;
  dispatch_time_t v1;
  _QWORD v2[5];
  _QWORD block[5];

  if ((byte_100010028 & 1) == 0)
  {
    byte_100010028 = 1;
    v0 = os_transaction_create("com.apple.aslmanager");
    if ((byte_100010029 & 1) != 0)
    {
      v2[0] = _NSConcreteStackBlock;
      v2[1] = 0x40000000;
      v2[2] = sub_10000766C;
      v2[3] = &unk_10000C438;
      v2[4] = v0;
      dispatch_async((dispatch_queue_t)qword_100010060, v2);
    }
    else
    {
      byte_100010029 = 1;
      v1 = dispatch_walltime(0, 300000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100007638;
      block[3] = &unk_10000C418;
      block[4] = v0;
      dispatch_after(v1, (dispatch_queue_t)qword_100010060, block);
    }
  }
}

void sub_100007638(uint64_t a1)
{
  sub_100006CA4(0, 0);
  byte_100010028 = 0;
  os_release(*(void **)(a1 + 32));
}

void sub_10000766C(uint64_t a1)
{
  sub_100006CA4(0, 0);
  byte_100010028 = 0;
  os_release(*(void **)(a1 + 32));
}

uint64_t start(int a1, uint64_t a2)
{
  uint64_t v5;

  v5 = 0;
  vproc_swap_integer(0, 5, 0, &v5);
  if (v5)
  {
    setiopolicy_np(0, 0, 3);
    qword_100010030 = (uint64_t)dispatch_queue_create("aslmanager", 0);
    qword_100010060 = (uint64_t)dispatch_queue_create("work queue", 0);
    signal(15, (void (__cdecl *)(int))1);
    qword_100010038 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100010038, &stru_10000C478);
    dispatch_resume((dispatch_object_t)qword_100010038);
    qword_100010040 = (uint64_t)xpc_connection_create_mach_service("com.apple.aslmanager", (dispatch_queue_t)qword_100010030, 1uLL);
    xpc_connection_set_event_handler((xpc_connection_t)qword_100010040, &stru_10000C4B8);
    xpc_connection_resume((xpc_connection_t)qword_100010040);
    dispatch_main();
  }
  sub_100006CA4(a1, a2);
  return 0;
}

void sub_1000077B0(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  sub_1000040E0(5u, "SIGTERM exit\n", v1, v2, v3, v4, v5, v6, vars0);
  exit(0);
}

void sub_1000077D0(id a1, void *a2)
{
  _QWORD handler[5];

  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100007850;
    handler[3] = &unk_10000C4D8;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
}

void sub_100007850(uint64_t a1, xpc_object_t object)
{
  uid_t euid;
  xpc_object_t reply;
  void *v6;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
    reply = xpc_dictionary_create_reply(object);
    if (reply)
    {
      v6 = reply;
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
      xpc_release(v6);
    }
    if (euid == geteuid())
      sub_10000754C();
  }
  else
  {
    xpc_get_type(object);
  }
}

char *explode(char *a1, char *__s)
{
  char *v2;
  int v3;
  unsigned __int8 v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char v16;
  char *v17;

  if (!a1)
    return 0;
  v2 = a1;
  LOBYTE(v3) = *a1;
  if (!*a1)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = 0;
    while (1)
    {
      if (v5)
      {
        if (v3 == v5)
          v5 = 0;
        goto LABEL_16;
      }
      if (strchr(__s, (char)v3))
        break;
      if (v3 == 34)
        v8 = 34;
      else
        v8 = 0;
      if (v3 == 39)
        v5 = 39;
      else
        v5 = v8;
LABEL_16:
      v9 = v7 + 1;
      v3 = v2[++v7];
      if (!v3)
      {
        v10 = v9;
        v7 = v9;
        goto LABEL_19;
      }
    }
    v5 = 0;
    v10 = v7;
LABEL_19:
    v11 = (const char *)malloc_type_malloc(v10 + 1, 0x9095E2FEuLL);
    if (!v11)
      return 0;
    v12 = (char *)v11;
    if (v10)
    {
      v13 = v10;
      v14 = v2;
      v15 = (char *)v11;
      do
      {
        v16 = *v14++;
        *v15++ = v16;
        --v13;
      }
      while (v13);
    }
    v11[v7] = 0;
    v6 = (char *)sub_100007A48(v11, v6);
    free(v12);
    v17 = &v2[v10];
    if (!v2[v10])
      break;
    v3 = v2[v10 + 1];
    if (!v2[v10 + 1])
    {
      v6 = (char *)sub_100007A48((const char *)&unk_10000B4B7, v6);
      v3 = v17[1];
    }
    v2 = v17 + 1;
  }
  while (v3);
  return v6;
}

_QWORD *sub_100007A48(const char *a1, char *__ptr)
{
  _QWORD *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  char *v7;
  char *v8;

  v2 = __ptr;
  if (a1)
  {
    if (!__ptr)
    {
      v2 = malloc_type_malloc(0x10uLL, 0x10040436913F5uLL);
      if (!v2)
        return v2;
      v8 = strdup(a1);
      *v2 = v8;
      if (v8)
      {
        v2[1] = 0;
        return v2;
      }
      goto LABEL_11;
    }
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)&__ptr[v4 * 8];
      ++v5;
      ++v4;
    }
    while (v6);
    v2 = reallocf(__ptr, (v4 * 8 + 8) & 0x7FFFFFFF8);
    if (v2)
    {
      v7 = strdup(a1);
      v2[v4 - 1] = v7;
      if (v7)
      {
        v2[v5] = 0;
        return v2;
      }
LABEL_11:
      free(v2);
      return 0;
    }
  }
  return v2;
}

void free_string_list(void **a1)
{
  void *v2;
  void **v3;
  void *v4;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      v3 = a1 + 1;
      do
      {
        free(v2);
        v4 = *v3++;
        v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

_BYTE *get_line_from_file(FILE *a1)
{
  char *v1;
  char *v2;
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;
  size_t __n;

  __n = 0;
  v1 = fgetln(a1, &__n);
  if (!v1 || !__n)
    return 0;
  v2 = v1;
  v3 = malloc_type_malloc(__n + 1, 0x729EE271uLL);
  v4 = v3;
  if (v3)
  {
    memcpy(v3, v2, __n);
    v5 = __n;
    if (v4[__n - 1] == 10)
      v5 = __n - 1;
    v4[v5] = 0;
  }
  return v4;
}

_BYTE *next_word_from_string(unsigned __int8 **a1)
{
  unsigned __int8 *v1;
  int v2;
  _BOOL4 v3;
  unsigned __int8 *v4;
  _BOOL4 v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  int64_t v10;
  int i;
  int v12;
  _BYTE *v13;
  _BYTE *v14;

  if (!a1)
    return 0;
  v1 = *a1;
  if (!*a1)
    return 0;
  v2 = *v1;
  v3 = v2 == 39;
  v4 = v2 == 39 ? v1 + 1 : *a1;
  v5 = *v4 == 34;
  v6 = *v4 == 34 ? v4 + 1 : v4;
  v7 = *v4 == 34 ? v3 + 1 : v2 == 39;
  v8 = -(int)v1 - v7;
  v9 = v6;
  while (1)
  {
    v10 = ((unint64_t)~(_DWORD)v6 << 32) + ((_QWORD)v9 << 32);
    for (i = v8 + (_DWORD)v9++; ; i += 2)
    {
      v12 = *(v9 - 1);
      if (v12 != 92)
        break;
      if (!*v9)
        goto LABEL_30;
      v9 += 2;
      v10 += 0x200000000;
    }
    if (!*(v9 - 1))
      break;
    if (v12 == 39)
    {
      v3 = !v3;
    }
    else
    {
      if (v12 == 34)
        v5 = !v5;
      if (v12 == 32)
      {
        if (!v3 && !v5)
          goto LABEL_30;
      }
      else if (v12 == 9 && !v3 && !v5)
      {
        goto LABEL_30;
      }
    }
  }
  --v9;
LABEL_30:
  *a1 = v9;
  if (v2 == 34 || v2 == 39)
    i -= v2 == v6[v10 >> 32];
  if (!i)
    return 0;
  v13 = malloc_type_malloc(i + 1, 0xCE9497B6uLL);
  v14 = v13;
  if (v13)
  {
    memcpy(v13, v6, i);
    v14[i] = 0;
  }
  return v14;
}

uint64_t asl_make_database_dir(char *a1, char **a2)
{
  uint64_t v4;
  char *v5;
  mode_t v6;
  uint64_t v7;
  char *v8;
  stat v10;
  char *v11;

  v11 = 0;
  if (a2)
    *a2 = 0;
  v4 = asl_filesystem_path(0);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = (char *)v4;
  if (a1)
  {
    if (strchr(a1, 47))
      return 0xFFFFFFFFLL;
    asprintf(&v11, "%s/%s", v5, a1);
    v5 = v11;
    if (!v11)
      return 0xFFFFFFFFLL;
  }
  memset(&v10, 0, sizeof(v10));
  if (!stat(v5, &v10))
  {
    v8 = v11;
    if ((v10.st_mode & 0xF000) == 0x4000)
      goto LABEL_12;
    goto LABEL_15;
  }
  if (*__error() != 2)
  {
    v8 = v11;
LABEL_15:
    free(v8);
    return 0xFFFFFFFFLL;
  }
  v6 = umask(0);
  v7 = mkdir(v5, 0x1EDu);
  umask(v6);
  v8 = v11;
  if ((_DWORD)v7)
  {
    free(v11);
    return v7;
  }
LABEL_12:
  if (a2)
  {
    v7 = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return v7;
}

time_t asl_make_timestamp(time_t result, char a2, char *__str, size_t __size)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned __int16 v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t tm_mday;
  uint64_t tm_hour;
  const char *v19;
  const char *v20;
  unint64_t v21;
  unsigned int v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t tm_min;
  uint64_t v29;
  uint64_t tm_sec;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  tm v37;
  time_t v38;

  v38 = result;
  if (__str)
  {
    if ((a2 & 4) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d-%02d-%02dT%02d:%02d:%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 8) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d%02d%02dT%02d%02d%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 0x10) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v6) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        v6 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        v7 = 45;
      }
      else
      {
        v7 = 43;
      }
      v10 = v6 / 0xE10uLL;
      v11 = v6 % 0xE10;
      v12 = v6 % 0xE10;
      v13 = v12 / 0x3Cu;
      v14 = v12 % 0x3Cu;
      v15 = (v37.tm_year + 1900);
      v16 = (v37.tm_mon + 1);
      tm_hour = v37.tm_hour;
      tm_mday = v37.tm_mday;
      if (v12 % 0x3Cu)
      {
        v32 = v7;
        v34 = v10;
        tm_min = v37.tm_min;
        tm_sec = v37.tm_sec;
        v26 = v37.tm_mday;
        v27 = v37.tm_hour;
        v24 = (v37.tm_year + 1900);
        v25 = (v37.tm_mon + 1);
        v19 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u:%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v11 >= 0x3C)
      {
        v35 = v10;
        v36 = v12 / 0x3Cu;
        v31 = v37.tm_sec;
        v33 = v7;
        v29 = v37.tm_min;
        v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u";
      }
      else
      {
        v33 = v7;
        v35 = v10;
        v29 = v37.tm_min;
        v31 = v37.tm_sec;
        v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u";
      }
    }
    else
    {
      if ((a2 & 0x20) == 0)
        return snprintf(__str, __size, "%c%llu");
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v8) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        v8 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        v9 = 45;
      }
      else
      {
        v9 = 43;
      }
      v21 = v8 / 0xE10uLL;
      v22 = v8 % 0xE10;
      v23 = v8 % 0xE10;
      v13 = v23 / 0x3Cu;
      v14 = v23 % 0x3Cu;
      v15 = (v37.tm_year + 1900);
      v16 = (v37.tm_mon + 1);
      tm_hour = v37.tm_hour;
      tm_mday = v37.tm_mday;
      if (v23 % 0x3Cu)
      {
        v32 = v9;
        v34 = v21;
        tm_min = v37.tm_min;
        tm_sec = v37.tm_sec;
        v26 = v37.tm_mday;
        v27 = v37.tm_hour;
        v24 = (v37.tm_year + 1900);
        v25 = (v37.tm_mon + 1);
        v19 = "%d%02d%02dT%02d%02d%02d%c%02u%02u%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v22 >= 0x3C)
      {
        v35 = v21;
        v36 = v23 / 0x3Cu;
        v31 = v37.tm_sec;
        v33 = v9;
        v29 = v37.tm_min;
        v20 = "%d%02d%02dT%02d%02d%02d%c%02u%02u";
      }
      else
      {
        v33 = v9;
        v35 = v21;
        v29 = v37.tm_min;
        v31 = v37.tm_sec;
        v20 = "%d%02d%02dT%02d%02d%02d%c%02u";
      }
    }
    return snprintf(__str, __size, v20, v15, v16, tm_mday, tm_hour, v29, v31, v33, v35, v36);
  }
  return result;
}

void asl_out_dst_data_release(uint64_t a1)
{
  int v2;
  int v3;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 168);
    if (!v2 || (v3 = v2 - 1, (*(_DWORD *)(a1 + 168) = v3) == 0))
    {
      free(*(void **)a1);
      free(*(void **)(a1 + 8));
      free(*(void **)(a1 + 16));
      free(*(void **)(a1 + 40));
      free(*(void **)(a1 + 48));
      free(*(void **)(a1 + 32));
      free(*(void **)(a1 + 24));
      free(*(void **)(a1 + 120));
      free(*(void **)(a1 + 136));
      free((void *)a1);
    }
  }
}

uint64_t asl_out_dst_set_access(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uid_t v4;
  gid_t v5;

  result = 0xFFFFFFFFLL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    v4 = *(_DWORD *)(a2 + 128);
    if (v4)
      v4 = **(_DWORD **)(a2 + 120);
    if (*(_DWORD *)(a2 + 144))
      v5 = **(_DWORD **)(a2 + 136);
    else
      v5 = 80;
    fchown(a1, v4, v5);
    return a1;
  }
  return result;
}

void asl_out_module_free(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = *(_QWORD *)(v1 + 24);
      free(*(void **)v1);
      v3 = *(_QWORD **)(v1 + 16);
      if (v3)
      {
        do
        {
          v4 = (_QWORD *)v3[5];
          v5 = v3[3];
          if (v5)
            asl_out_dst_data_release(v5);
          if (*v3)
            asl_msg_release(*v3);
          free((void *)v3[2]);
          free(v3);
          v3 = v4;
        }
        while (v4);
      }
      free((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

_DWORD *asl_out_module_new(const char *a1)
{
  _DWORD *v2;
  _DWORD *result;
  char *v4;

  v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x10300408DF105C4uLL);
  result = 0;
  if (a1 && v2)
  {
    v4 = strdup(a1);
    *(_QWORD *)v2 = v4;
    if (v4)
    {
      v2[2] = 1;
      return v2;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return result;
}

void *asl_out_module_parse_line(uint64_t a1, char *a2)
{
  unsigned int v4;
  void *v5;
  void *v6;
  char *j;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  char v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  const char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *i;
  int v24;
  _BYTE *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  unsigned __int8 *v30;
  uint64_t v31;
  unsigned int *v32;
  int v33;
  __int16 v34;
  unsigned int *v35;
  unsigned int *v36;
  int v37;
  const char *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;

  while (1)
  {
    v4 = *a2;
    if (v4 > 0x1F)
      break;
    if (v4 != 9)
      return 0;
LABEL_6:
    ++a2;
  }
  if (*a2 <= 0x29u)
  {
    if (v4 != 32)
      return 0;
    goto LABEL_6;
  }
  if (*a2 > 0x3Du)
  {
    if (v4 != 62)
    {
      if (v4 != 63 && v4 != 81)
        return 0;
LABEL_20:
      if (!a1)
        return 0;
      v6 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
      if (!v6)
        return v6;
      v9 = (char *)sub_10000A1C0((uint64_t)a2);
      if (!v9)
        return 0;
      v10 = v9;
      v11 = strchr(v9, 32);
      if (v11 || (v11 = strchr(v10, 9)) != 0)
      {
        v12 = 0;
        *v11 = 0;
      }
      else
      {
        v12 = 1;
      }
      if (!strcasecmp(v10, "ignore"))
      {
        v13 = 3;
      }
      else if (!strcasecmp(v10, "skip"))
      {
        v13 = 4;
      }
      else if (!strcasecmp(v10, "claim"))
      {
        v13 = 5;
      }
      else if (!strcasecmp(v10, "notify"))
      {
        v13 = 6;
      }
      else if (!strcasecmp(v10, "file"))
      {
        v13 = 14;
      }
      else if (!strcasecmp(v10, "asl_file"))
      {
        v13 = 12;
      }
      else if (!strcasecmp(v10, "directory")
             || !strcasecmp(v10, "dir")
             || !strcasecmp(v10, "asl_directory")
             || !strcasecmp(v10, "asl_dir")
             || !strcasecmp(v10, "store_dir")
             || !strcasecmp(v10, "store_directory"))
      {
        v13 = 13;
      }
      else if (!strcasecmp(v10, "control"))
      {
        v13 = 16;
      }
      else if (!strcasecmp(v10, "save") || !strcasecmp(v10, "store"))
      {
        v13 = 11;
      }
      else if (!strcasecmp(v10, "access"))
      {
        v13 = 8;
      }
      else if (!strcasecmp(v10, "set"))
      {
        v13 = 9;
      }
      else if (!strcasecmp(v10, "unset"))
      {
        v13 = 10;
      }
      else
      {
        if (strcmp(*(const char **)a1, "com.apple.asl"))
          goto LABEL_81;
        if (strcasecmp(v10, "broadcast"))
        {
          if (!strcasecmp(v10, "forward"))
          {
            v13 = 15;
            goto LABEL_80;
          }
LABEL_81:
          if (*((_DWORD *)v6 + 2))
          {
            if ((v12 & 1) != 0)
              goto LABEL_91;
            for (i = v11 + 1; ; ++i)
            {
              v24 = *(i - 1);
              if (v24 != 32 && v24 != 9)
                break;
            }
            v26 = sub_10000A238(i);
            *((_QWORD *)v6 + 2) = v26;
            if (v26)
            {
LABEL_91:
              *(v10 - 1) = 0;
              if (*a2 == 42)
              {
                v27 = asl_msg_new(1);
              }
              else
              {
                *a2 = 81;
                v27 = asl_msg_from_string(a2);
              }
              *(_QWORD *)v6 = v27;
              if (v27)
              {
                if (*((_DWORD *)v6 + 2) != 11)
                  goto LABEL_108;
                v28 = (unsigned __int8 *)*((_QWORD *)v6 + 2);
                if (v28)
                {
                  if (strncmp(*((const char **)v6 + 2), "/var/log/asl", 0xCuLL))
                  {
                    *((_DWORD *)v6 + 2) = 12;
                    goto LABEL_108;
                  }
                  v31 = a1;
                  v30 = v28;
                }
                else
                {
                  v30 = "/var/log/asl";
                  v31 = a1;
                }
                v32 = sub_1000089C8(v31, v30, 493);
                if (v32)
                  ++v32[42];
                *((_QWORD *)v6 + 3) = v32;
LABEL_108:
                v33 = *((_DWORD *)v6 + 2);
                if ((v33 - 12) > 2)
                  goto LABEL_133;
                if (v33 == 13)
                  v34 = 493;
                else
                  v34 = 420;
                v35 = sub_1000089C8(a1, *((unsigned __int8 **)v6 + 2), v34);
                if (!v35)
                {
                  *((_QWORD *)v6 + 3) = 0;
                  *((_DWORD *)v6 + 2) = 0;
                  return v6;
                }
                v36 = v35;
                ++v35[42];
                *((_QWORD *)v6 + 3) = v35;
                if (*((_WORD *)v35 + 58) == 4096)
                  *((_WORD *)v35 + 58) = v34;
                v37 = *((_DWORD *)v6 + 2);
                if (v37 == 12)
                {
LABEL_121:
                  v39 = v36[18] | 0x1000;
                }
                else
                {
                  if (v37 == 13)
                  {
                    v40 = v35[18];
                    v41 = v40 & 0xFFFFDFF7 | 0x2000;
                    if (!v35[16] && (v40 & 0x100) != 0)
                      v35[16] |= 0x20u;
                  }
                  else
                  {
                    if (v37 == 14)
                    {
                      v38 = (const char *)*((_QWORD *)v35 + 3);
                      if (v38 && !strcasecmp(v38, "asl"))
                      {
                        *((_DWORD *)v6 + 2) = 12;
                        goto LABEL_121;
                      }
LABEL_129:
                      if (!v36[32])
                      {
                        sub_10000A2DC(v36, "0");
                        v36 = (unsigned int *)*((_QWORD *)v6 + 3);
                      }
                      if (!v36[36])
                        sub_10000A384(v36, "80");
LABEL_133:
                      v42 = *(_QWORD *)(a1 + 16);
                      if (v42)
                      {
                        do
                        {
                          v22 = v42;
                          v42 = *(_QWORD *)(v42 + 40);
                        }
                        while (v42);
                        goto LABEL_135;
                      }
LABEL_136:
                      *(_QWORD *)(a1 + 16) = v6;
                      return v6;
                    }
                    v41 = v35[18];
                  }
                  v39 = v41 & 0xFFFFFFFB;
                }
                v36[18] = v39;
                goto LABEL_129;
              }
LABEL_99:
              free(*((void **)v6 + 2));
            }
          }
LABEL_100:
          free(v6);
          return 0;
        }
        v13 = 7;
      }
LABEL_80:
      *((_DWORD *)v6 + 2) = v13;
      goto LABEL_81;
    }
    sub_1000089C8(a1, (unsigned __int8 *)a2 + 1, 4096);
    return 0;
  }
  if (v4 == 42)
    goto LABEL_20;
  if (v4 != 61 || !a1)
    return 0;
  v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  v6 = v5;
  if (!v5)
    return v6;
  for (j = a2 + 1; ; ++j)
  {
    v8 = *j;
    if (v8 != 39 && v8 != 32)
      break;
  }
  *((_DWORD *)v5 + 2) = 1;
  if (*j != 91)
  {
    v17 = strchr(a2, 91);
    if (!v17)
    {
      *((_QWORD *)v6 + 2) = sub_10000A238(j);
      goto LABEL_76;
    }
    v18 = v17;
    if (!strncmp(v17, "[File ", 6uLL) || !strncmp(v18, "[File\t", 6uLL))
    {
      v19 = 17;
    }
    else if (!strncmp(v18, "[Plist ", 7uLL) || !strncmp(v18, "[Plist\t", 7uLL))
    {
      v19 = 18;
    }
    else
    {
      if (strncmp(v18, "[Profile ", 9uLL) && strncmp(v18, "[Profile\t", 9uLL))
        goto LABEL_74;
      v19 = 19;
    }
    *((_DWORD *)v6 + 2) = v19;
LABEL_74:
    *((_BYTE *)v18 - 1) = 0;
    *((_QWORD *)v6 + 2) = sub_10000A238(j);
    *((_WORD *)v18 - 1) = 8273;
    a2 = (char *)(v18 - 2);
    goto LABEL_75;
  }
  v14 = (char *)sub_10000A1C0((uint64_t)a2);
  if (!v14)
    goto LABEL_100;
  v15 = v14;
  *((_QWORD *)v6 + 2) = sub_10000A238(v14);
  if (*(v15 - 1) == 93)
    v16 = 0;
  else
    v16 = -1;
  v15[v16] = 0;
  *a2 = 81;
LABEL_75:
  v20 = asl_msg_from_string(a2);
  *(_QWORD *)v6 = v20;
  if (!v20)
    goto LABEL_99;
LABEL_76:
  v21 = *(_QWORD *)(a1 + 16);
  if (!v21)
    goto LABEL_136;
  do
  {
    v22 = v21;
    v21 = *(_QWORD *)(v21 + 40);
  }
  while (v21);
LABEL_135:
  *(_QWORD *)(v22 + 40) = v6;
  return v6;
}

unsigned int *sub_1000089C8(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  unsigned int *v3;
  int v6;
  char *v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  int v14;
  char *v15;
  int v16;
  unsigned int v17;
  const char **v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t i;
  const char *v28;
  char *v29;
  int v30;
  void *v31;
  unsigned int *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  const char *v37;
  char *v38;
  char *v39;
  _BYTE *v41;
  _BYTE *v42;
  unsigned int v43;
  const char *v44;
  char *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  const char *v49;
  unsigned int v50;
  uint64_t j;
  unsigned int v52;
  char *v53;
  unsigned int v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  char *__s;
  unsigned __int8 *v59;

  v3 = 0;
  if (!a1 || !a2)
    return v3;
  while (1)
  {
    v6 = *a2;
    if (v6 != 32 && v6 != 9)
      break;
    ++a2;
  }
  __s = 0;
  v59 = a2;
  v8 = next_word_from_string(&v59);
  __s = v8;
  if (!v8)
    return 0;
  v57 = a1;
  v9 = (void **)explode(v8, "/");
  v10 = asl_string_new(0);
  v11 = v10;
  v12 = 0;
  v13 = 5;
  v56 = a3;
  if (v9 && v10)
  {
    v14 = 5;
    while (1)
    {
      v15 = (char *)*v9;
      if (*v9)
        break;
      v12 = 0;
      v16 = 0;
LABEL_33:
      free_string_list(v9);
      if (v16 != 1 || v12)
      {
        v9 = 0;
        v13 = v14;
        goto LABEL_40;
      }
      free(__s);
      __s = (char *)asl_string_release_return_bytes(v11);
      v11 = asl_string_new(0);
      v24 = explode(__s, "/");
      v9 = (void **)v24;
      v13 = v14 - 1;
      if (v14 >= 2)
      {
        if (v24)
        {
          --v14;
          if (v11)
            continue;
        }
      }
      goto LABEL_40;
    }
    v16 = 0;
    v12 = 0;
    v17 = 1;
    v18 = (const char **)v9;
    while (strncmp(v15, "$ENV(", 5uLL))
    {
      if (v17 == 1)
      {
        if (!*(_BYTE *)*v9)
          goto LABEL_25;
        v19 = v11;
        v20 = v15;
      }
      else
      {
        asl_string_append_char_no_encoding(v11, 47);
        v20 = *v18;
        v19 = v11;
      }
      asl_string_append_no_encoding(v19, v20);
      if (!v12)
      {
LABEL_29:
        v12 = strcmp(*v18, "..") == 0;
        goto LABEL_30;
      }
LABEL_26:
      v12 = 1;
LABEL_30:
      v18 = (const char **)&v9[v17];
      v15 = (char *)*v18;
      ++v17;
      if (!*v18)
        goto LABEL_33;
    }
    v21 = strchr(v15, 41);
    if (v21)
    {
      *v21 = 0;
      v15 = (char *)*v18;
    }
    v22 = getenv(v15 + 5);
    if (v22)
    {
      v23 = v22;
      if (*v22 != 47)
        asl_string_append_char_no_encoding(v11, 47);
      asl_string_append_no_encoding(v11, v23);
      v16 = 1;
    }
LABEL_25:
    if (!v12)
      goto LABEL_29;
    goto LABEL_26;
  }
LABEL_40:
  free(__s);
  free_string_list(v9);
  if (v12 || !v13)
  {
    asl_string_release(v11);
    return 0;
  }
  v25 = asl_string_release_return_bytes(v11);
  __s = (char *)v25;
  v26 = v57;
  for (i = *(_QWORD *)(v57 + 16); i; i = *(_QWORD *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      v3 = *(unsigned int **)(i + 24);
      if (v3)
      {
        v28 = (const char *)*((_QWORD *)v3 + 1);
        if (v25 && v28)
        {
          if (*(_BYTE *)v25 != 47)
          {
            v29 = strrchr(*((char **)v3 + 1), 47);
            if (v29)
              v28 = v29 + 1;
          }
          if (!strcmp((const char *)v25, v28))
          {
LABEL_178:
            free((void *)v25);
            return v3;
          }
        }
        else if (!(v25 | (unint64_t)v28))
        {
          goto LABEL_178;
        }
      }
    }
  }
  if (*(_BYTE *)v25 == 47)
  {
    v30 = 8;
    if (strncmp((const char *)v25, "/var/log/", 9uLL))
    {
      if (!strncmp((const char *)v25, "/Library/Logs/", 0xEuLL))
        v30 = 8;
      else
        v30 = 40;
    }
  }
  else
  {
    if (!strcmp(*(const char **)v57, "com.apple.asl"))
      asprintf(&__s, "%s/%s");
    else
      asprintf(&__s, "%s/module/%s/%s");
    free((void *)v25);
    v30 = 8;
  }
  v31 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  v32 = (unsigned int *)malloc_type_calloc(1uLL, 0xC8uLL, 0x10D00407E9428A6uLL);
  v3 = v32;
  if (!v31 || !v32)
  {
    free(__s);
    free(v31);
    free(v3);
    return 0;
  }
  v32[42] = 1;
  v33 = __s;
  *((_QWORD *)v32 + 1) = __s;
  v34 = strrchr(v33, 47);
  if (v34)
  {
    v35 = v34;
    *v34 = 0;
    *(_QWORD *)v3 = strdup(*((const char **)v3 + 1));
    *v35 = 47;
    v33 = __s;
  }
  *((_WORD *)v3 + 58) = v56;
  v3[28] = 604800;
  v3[18] = v30;
  v36 = strrchr(v33, 47);
  if (v36)
    v37 = v36 + 1;
  else
    v37 = v33;
  v38 = strrchr(v33, 46);
  if (v38)
  {
    v39 = v38;
    *v38 = 0;
    *((_QWORD *)v3 + 6) = strdup(v38 + 1);
    *((_QWORD *)v3 + 5) = strdup(v37);
    *v39 = 46;
  }
  else
  {
    *((_QWORD *)v3 + 5) = strdup(v37);
  }
  v41 = next_word_from_string(&v59);
  if (v41)
  {
    v42 = v41;
    do
    {
      if (!strncasecmp(v42, "mode=", 5uLL))
      {
        *((_WORD *)v3 + 58) = strtol(v42 + 5, 0, 0);
      }
      else if (!strncasecmp(v42, "uid=", 4uLL))
      {
        sub_10000A2DC(v3, v42 + 4);
      }
      else if (!strncasecmp(v42, "gid=", 4uLL))
      {
        sub_10000A384(v3, v42 + 4);
      }
      else
      {
        if (!strncasecmp(v42, "fmt=", 4uLL))
        {
          v44 = v42 + 4;
LABEL_109:
          *((_QWORD *)v3 + 3) = sub_10000A42C(v44);
          goto LABEL_124;
        }
        if (!strncasecmp(v42, "format=", 7uLL))
        {
          v44 = v42 + 7;
          goto LABEL_109;
        }
        if (!strncasecmp(v42, "dest=", 5uLL))
        {
          v45 = v42 + 5;
LABEL_112:
          *((_QWORD *)v3 + 4) = sub_10000A238(v45);
          goto LABEL_124;
        }
        if (!strncasecmp(v42, "dst=", 4uLL))
        {
          v45 = v42 + 4;
          goto LABEL_112;
        }
        if (!strncasecmp(v42, "coalesce=", 9uLL))
        {
          if (!strncasecmp(v42 + 9, "0", 1uLL) || !strncasecmp(v42 + 9, "off", 3uLL))
          {
            v3[18] &= ~8u;
            v26 = v57;
          }
          else
          {
            v26 = v57;
            if (!strncasecmp(v42 + 9, "false", 5uLL))
            {
              v43 = v3[18] & 0xFFFFFFF7;
              goto LABEL_123;
            }
          }
        }
        else
        {
          if (!strncasecmp(v42, "compress", 8uLL))
          {
            v43 = v3[18] | 0x10;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "extern", 6uLL))
          {
            v43 = v3[18] | 0x40;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "truncate", 8uLL))
          {
            v43 = v3[18] | 0x80;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "dir", 3uLL))
          {
            v43 = v3[18] | 0x2000;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "soft", 4uLL))
          {
            v43 = v3[18] | 0x800;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "file_max=", 9uLL))
          {
            *((_QWORD *)v3 + 19) = asl_core_str_to_size(v42 + 9);
            goto LABEL_124;
          }
          if (!strncasecmp(v42, "all_max=", 8uLL))
          {
            *((_QWORD *)v3 + 20) = asl_core_str_to_size(v42 + 8);
            goto LABEL_124;
          }
          if (!strncasecmp(v42, "style=", 6uLL) || !strncasecmp(v42, "rotate=", 7uLL))
          {
            v46 = 6;
            if (*v42 == 114)
              v46 = 7;
            if (sub_10000A504((uint64_t)v3, &v42[v46]))
              goto LABEL_124;
LABEL_136:
            v43 = v3[18] | 4;
LABEL_123:
            v3[18] = v43;
            goto LABEL_124;
          }
          if (!strncasecmp(v42, "rotate", 6uLL))
          {
            if (*((_QWORD *)v3 + 6))
              v47 = 536870913;
            else
              v47 = 268435457;
            v3[16] = v47;
            goto LABEL_136;
          }
          if (!strncasecmp(v42, "crashlog", 8uLL))
          {
            v43 = v3[18] & 0xFFFFFAF3 | 0x504;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "basestamp", 9uLL))
          {
            v43 = v3[18] | 0x100;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "link", 4uLL) || !strncasecmp(v42, "symlink", 7uLL))
          {
            v43 = v3[18] | 0x200;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "ttl", 3uLL))
          {
            v48 = (char)v42[3];
            if (v48 == 61)
            {
              v3[28] = asl_core_str_to_time(v42 + 4, 86400);
              v26 = v57;
            }
            else
            {
              v26 = v57;
              if ((v48 & 0xFFFFFFF8) == 0x30 && v42[4] == 61)
                v3[(v48 - 48) + 20] = asl_core_str_to_time(v42 + 5, 86400);
            }
            goto LABEL_124;
          }
          v26 = v57;
          if (!strncasecmp(v42, "size_only", 9uLL))
          {
            v43 = v3[18] | 0x8000;
            goto LABEL_123;
          }
        }
      }
LABEL_124:
      free(v42);
      v42 = next_word_from_string(&v59);
    }
    while (v42);
  }
  v49 = (const char *)*((_QWORD *)v3 + 1);
  if (!strncasecmp(v49, "/Library/Logs/CrashReporter", 0x1BuLL)
    || !strncasecmp(v49, "/var/mobile/Library/Logs/CrashReporter", 0x26uLL)
    || !strncasecmp(v49, "/private/var/mobile/Library/Logs/CrashReporter", 0x2EuLL))
  {
    v3[18] = v3[18] & 0xFFFFFAF3 | 0x504;
  }
  v50 = v3[28];
  for (j = 20; j != 28; ++j)
  {
    v52 = v3[j];
    if (v52 > v50)
    {
      v3[28] = v52;
      v50 = v52;
    }
  }
  v53 = (char *)*((_QWORD *)v3 + 3);
  if (!v53)
  {
    v53 = strdup("std");
    *((_QWORD *)v3 + 3) = v53;
  }
  if (strcmp(v53, "std") && strcmp(v53, "bsd"))
    v3[18] &= ~8u;
  if (!strcmp(v53, "std") || !strcmp(v53, "bsd") || !strcmp(v53, "msg"))
  {
    v54 = v3[18] | 0x4000;
    v3[18] = v54;
  }
  else
  {
    v54 = v3[18];
  }
  if ((~v54 & 0x102) == 0)
  {
    v54 = v54 & 0xFFFFFFFC | 1;
    v3[18] = v54;
  }
  if (!strcmp(v53, "raw"))
    *((_QWORD *)v3 + 7) = "sec";
  if (!strcmp(v49, "/var/log/asl"))
  {
    v54 = 0x2000;
    v3[18] = 0x2000;
  }
  v55 = *((_QWORD *)v3 + 19);
  if (!v55)
  {
    v55 = *((_QWORD *)v3 + 20);
    *((_QWORD *)v3 + 19) = v55;
  }
  if ((v54 & 0x8000) != 0 && (!v55 || !*((_QWORD *)v3 + 20)))
  {
    v54 &= ~0x8000u;
    v3[18] = v54;
  }
  if ((~v54 & 0x8400) == 0)
    v3[18] = v54 & 0xFFFF7FFF;
  *((_DWORD *)v31 + 2) = 2;
  *((_QWORD *)v31 + 3) = v3;
  *((_QWORD *)v31 + 5) = *(_QWORD *)(v26 + 16);
  *(_QWORD *)(v26 + 16) = v31;
  return v3;
}

_DWORD *asl_out_module_init_from_file(const char *a1, FILE *a2)
{
  _DWORD *v3;
  char *line_from_file;
  char *v5;

  if (!a2)
    return 0;
  v3 = asl_out_module_new(a1);
  if (v3)
  {
    line_from_file = get_line_from_file(a2);
    if (line_from_file)
    {
      v5 = line_from_file;
      do
      {
        asl_out_module_parse_line((uint64_t)v3, v5);
        free(v5);
        v5 = get_line_from_file(a2);
      }
      while (v5);
    }
  }
  return v3;
}

_DWORD *asl_out_module_init()
{
  uint64_t v0;
  FILE *v2;
  FILE *v3;
  _DWORD *v4;
  int v5[2];

  *(_QWORD *)v5 = 0;
  sub_100009624((DIR *)v5, "/usr/local/etc/asl", 2);
  sub_100009624((DIR *)v5, "/etc/asl", 0);
  v0 = *(_QWORD *)v5;
  if (!sub_1000097B8(*(uint64_t *)v5, "com.apple.asl"))
  {
    v2 = fopen("/etc/asl.conf", "r");
    if (v2)
    {
      v3 = v2;
      v4 = asl_out_module_init_from_file("com.apple.asl", v2);
      fclose(v3);
      v0 = *(_QWORD *)v5;
      if (v4)
      {
        *((_QWORD *)v4 + 3) = *(_QWORD *)v5;
        return v4;
      }
    }
    else
    {
      return *(_DWORD **)v5;
    }
  }
  return (_DWORD *)v0;
}

DIR *sub_100009624(DIR *result, char *a2, int a3)
{
  uint64_t *p_dd_fd;
  uint64_t v6;
  _DWORD *v7;
  DIR *v8;
  const char *v9;
  dirent *v10;
  char *d_name;
  const char *v12;
  FILE *v13;
  FILE *v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  char __str[1024];

  if (result && a2)
  {
    p_dd_fd = (uint64_t *)&result->__dd_fd;
    v6 = *(_QWORD *)&result->__dd_fd;
    if (*(_QWORD *)&result->__dd_fd)
    {
      do
      {
        v7 = (_DWORD *)v6;
        v6 = *(_QWORD *)(v6 + 24);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    result = opendir(a2);
    if (result)
    {
      v8 = result;
      v9 = "%s/%s";
      while (1)
      {
        v10 = readdir(v8);
        if (!v10)
          break;
        d_name = v10->d_name;
        if (v10->d_name[0] != 46 && !sub_1000097B8(*p_dd_fd, d_name))
        {
          v12 = v9;
          snprintf(__str, 0x400uLL, v9, a2, d_name);
          v13 = fopen(__str, "r");
          if (v13 && (v14 = v13, v15 = asl_out_module_init_from_file(d_name, v13), fclose(v14), v15))
          {
            v15[2] |= a3;
            v16 = strcmp(d_name, "com.apple.asl");
            v17 = *p_dd_fd;
            if (v16)
            {
              if (v17)
                *((_QWORD *)v7 + 3) = v15;
              else
                *p_dd_fd = (uint64_t)v15;
            }
            else
            {
              *((_QWORD *)v15 + 3) = v17;
              *p_dd_fd = (uint64_t)v15;
              if (v7)
                v15 = v7;
            }
          }
          else
          {
            v15 = v7;
          }
          v7 = v15;
          v9 = v12;
        }
      }
      return (DIR *)closedir(v8);
    }
  }
  return result;
}

uint64_t sub_1000097B8(uint64_t a1, char *__s2)
{
  uint64_t result;

  result = 0;
  if (a1 && __s2)
  {
    while (!*(_QWORD *)a1 || strcmp(*(const char **)a1, __s2))
    {
      a1 = *(_QWORD *)(a1 + 24);
      if (!a1)
        return 0;
    }
    return a1;
  }
  return result;
}

void asl_out_file_list_free(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      free(*(void **)v1);
      v2 = *(_QWORD *)(v1 + 40);
      free((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

uint64_t _check_file_name(char *a1, char *__s, const char *a3, int a4, uint64_t a5, char **a6)
{
  uint64_t result;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  _BOOL4 v17;
  char *v18;
  const char *v19;
  const char *v20;
  char *v21;
  const char *v22;
  const char *v23;
  int v24;
  char *v25;
  char *v26;

  result = 0;
  if (!a1)
    return result;
  if (!__s)
    return result;
  result = strlen(__s);
  if (!result)
    return result;
  v13 = result;
  if (a3)
  {
    v14 = strlen(a3);
    if (!a6)
      goto LABEL_7;
    goto LABEL_6;
  }
  v14 = 0;
  if (a6)
LABEL_6:
    *a6 = 0;
LABEL_7:
  if (strncmp(a1, __s, v13))
    return 0;
  v15 = strrchr(a1, 46);
  v16 = v15;
  if (v15)
    v17 = strcmp(v15, ".gz") == 0;
  else
    v17 = 0;
  v18 = &a1[v13];
  if ((a4 & 0x10000000) == 0)
  {
    if ((a4 & 0x20000000) == 0)
    {
      if ((a4 & 0x40000000) == 0 || *v18 != 46)
        return 0;
      v19 = v18 + 1;
      if (strncmp(v18 + 1, a3, v14) || (v19 += v14, result = a5, *v19))
      {
        v20 = v17 ? &v16[-v14] : v16 + 1;
        v24 = strncmp(v20, a3, v14);
        result = v24 == 0;
        if (a6)
        {
          if (!v24)
          {
            v23 = v19;
            goto LABEL_35;
          }
        }
      }
      return result;
    }
    if (*v18 != 46)
      return 0;
    v21 = v18 + 1;
    if (strncmp(v18 + 1, a3, v14))
      return 0;
    v18 = &v21[v14];
  }
  result = a5;
  if (*v18)
  {
    if (*v18 != 46)
      return 0;
    v22 = v18 + 1;
    result = v22 != v16;
    if (a6)
    {
      if (v22 != v16)
      {
        v23 = v22;
LABEL_35:
        v25 = strdup(v23);
        *a6 = v25;
        v26 = strchr(v25, 46);
        if (v26)
          *v26 = 0;
        return 1;
      }
    }
  }
  return result;
}

uint64_t _parse_stamp_style(uint64_t result, char a2, int *a3, time_t *a4)
{
  const char *v5;
  const char *v6;
  int v7;
  uint64_t v10;
  int v11;
  int v12;
  time_t v13;
  tm v14;

  if (!result)
    return result;
  v5 = (const char *)result;
  if (*(_BYTE *)result != 84)
  {
    v10 = 0;
    do
    {
      v11 = *(unsigned __int8 *)(result + v10);
      if (!*(_BYTE *)(result + v10))
        goto LABEL_13;
      ++v10;
    }
    while ((v11 - 48) < 0xA);
    if (!strcmp((const char *)(result + v10), ".gz"))
    {
LABEL_13:
      if (a3)
        *a3 = atoi(v5);
      return 2;
    }
    memset(&v14, 0, sizeof(v14));
    if ((a2 & 0x14) != 0)
    {
      v12 = sscanf(v5, "%d-%d-%dT%d:%d:%d%c%u:%u:%u", &v14.tm_year, &v14.tm_mon, (unint64_t)&v14 | 0xC, &v14.tm_hour);
    }
    else
    {
      if ((a2 & 0x28) == 0)
        return 0xFFFFFFFFLL;
      v12 = sscanf(v5, "%4d%2d%2dT%2d%2d%2d%c%2u%2u%2u", &v14.tm_year, &v14.tm_mon, (unint64_t)&v14 | 0xC, &v14.tm_hour);
    }
    if (v12 == 6)
    {
      *(int32x2_t *)&v14.tm_mon = vadd_s32(*(int32x2_t *)&v14.tm_mon, (int32x2_t)0xFFFFF894FFFFFFFFLL);
      v14.tm_isdst = -1;
      v13 = mktime(&v14);
      if (a4)
        *a4 = v13;
      return 3;
    }
    return 0xFFFFFFFFLL;
  }
  v6 = (const char *)(result + 1);
  v7 = atoi((const char *)(result + 1));
  if (!v7 && strcmp(v6, "0"))
    return 0xFFFFFFFFLL;
  if (a4)
    *a4 = v7;
  return 1;
}

DIR *asl_list_log_files(char *a1, char *a2, const char *a3, int a4, uint64_t a5)
{
  DIR *result;
  DIR *v11;
  dirent *v12;
  int v13;
  int v14;
  const char *d_name;
  int v16;
  int v17;
  BOOL v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  time_t v22;
  unsigned int v23;
  uint64_t v24;
  __darwin_time_t tv_sec;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  int v31;
  uint64_t v32;
  char *v33;
  stat v34;
  time_t v35;
  unsigned int v36;
  char __str[1024];

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = opendir(a1);
      if (result)
      {
        v11 = result;
        v36 = 0;
        v35 = 0;
        memset(&v34, 0, sizeof(v34));
        v12 = readdir(result);
        if (v12)
        {
          v32 = 0;
          if ((a4 & 1) != 0)
            v13 = 1;
          else
            v13 = 2;
          if ((a4 & 0x3C) != 0)
            v14 = 3;
          else
            v14 = 0;
          if ((a4 & 3) == 0)
            v13 = v14;
          v31 = v13;
          while (1)
          {
            v33 = 0;
            d_name = v12->d_name;
            if (!_check_file_name(v12->d_name, a2, a3, a4, a5, &v33))
              goto LABEL_47;
            v36 = -1;
            v35 = 0;
            v16 = _parse_stamp_style((uint64_t)v33, a4, (int *)&v36, &v35);
            free(v33);
            if (v16 == -1)
              goto LABEL_47;
            snprintf(__str, 0x400uLL, "%s/%s", a1, d_name);
            memset(&v34, 0, sizeof(v34));
            v17 = lstat(__str, &v34);
            if (!v17 && (v34.st_mode & 0xF000) == 0xA000)
              goto LABEL_47;
            v18 = v16 == 0;
            if (v16 == 1)
              v18 = a5;
            if (!v18 && v16 != v31)
              goto LABEL_47;
            v19 = a1;
            v20 = malloc_type_calloc(1uLL, 0x38uLL, 0x1030040AD7885B1uLL);
            if (!v20)
            {
              asl_out_file_list_free(v32);
              return 0;
            }
            v21 = v20;
            *v20 = strdup(d_name);
            *((_DWORD *)v21 + 2) = v16;
            v22 = v35;
            v21[2] = v35;
            v23 = v36;
            *((_DWORD *)v21 + 6) = v36;
            if (v17)
              break;
            v21[4] = v34.st_size;
            v24 = v32;
            if (v16 != 2)
              goto LABEL_34;
            tv_sec = v34.st_birthtimespec.tv_sec;
            v21[2] = v34.st_birthtimespec.tv_sec;
            if (tv_sec)
            {
LABEL_28:
              if (v24)
                goto LABEL_29;
              goto LABEL_43;
            }
            v21[2] = v34.st_mtimespec.tv_sec;
            if (v32)
            {
LABEL_29:
              if (v23 != -1)
              {
                v26 = v24;
                if (v23 <= *(_DWORD *)(v24 + 24))
                {
                  do
                  {
                    v27 = (_QWORD *)v26;
                    v26 = *(_QWORD *)(v26 + 40);
                    if (!v26)
                    {
                      v27[5] = v21;
                      v29 = v21;
                      v21 = v27;
                      goto LABEL_45;
                    }
                  }
                  while (v23 <= *(_DWORD *)(v26 + 24));
                  v21[5] = v26;
                  v27[5] = v21;
                  v21[6] = v27;
LABEL_40:
                  v29 = (_QWORD *)v21[5];
                  goto LABEL_45;
                }
              }
LABEL_36:
              v21[5] = v24;
              v29 = (_QWORD *)v24;
              v32 = (uint64_t)v21;
LABEL_45:
              v29[6] = v21;
              goto LABEL_46;
            }
LABEL_43:
            v32 = (uint64_t)v21;
LABEL_46:
            a1 = v19;
LABEL_47:
            v12 = readdir(v11);
            if (!v12)
              goto LABEL_50;
          }
          v24 = v32;
          if (v16 == 2)
            goto LABEL_28;
LABEL_34:
          if (v24)
          {
            v28 = v24;
            if (v22 < *(_QWORD *)(v24 + 16))
              goto LABEL_36;
            while (1)
            {
              v30 = (_QWORD *)v28;
              v28 = *(_QWORD *)(v28 + 40);
              if (!v28)
                break;
              if (v22 < *(_QWORD *)(v28 + 16))
              {
                v21[5] = v28;
                v30[5] = v21;
                v21[6] = v30;
                goto LABEL_40;
              }
            }
            v30[5] = v21;
            v29 = v21;
            v21 = v30;
            goto LABEL_45;
          }
          goto LABEL_43;
        }
        v32 = 0;
LABEL_50:
        closedir(v11);
        return (DIR *)v32;
      }
    }
  }
  return result;
}

DIR *asl_list_src_files(uint64_t a1)
{
  const char *v2;
  char *v3;
  int v5;
  unsigned int v6;
  _QWORD *v8;
  char *v9;
  char *v10;
  const char *v11;
  __darwin_time_t tv_sec;
  stat v13;

  if (!a1)
    return 0;
  v2 = *(const char **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *(char **)(a1 + 40);
  if (!v3)
    return 0;
  if ((*(_DWORD *)(a1 + 72) & 0x40) != 0)
  {
    memset(&v13, 0, sizeof(v13));
    v8 = 0;
    if (!stat(v2, &v13) && (v13.st_mode & 0xF000) == 0x8000)
    {
      if (v13.st_size)
      {
        v8 = malloc_type_calloc(1uLL, 0x38uLL, 0x1030040AD7885B1uLL);
        if (v8)
        {
          v9 = *(char **)(a1 + 8);
          v10 = strrchr(v9, 47);
          v11 = v10 ? v10 + 1 : v9;
          *v8 = strdup(v11);
          tv_sec = v13.st_birthtimespec.tv_sec;
          v8[2] = v13.st_birthtimespec.tv_sec;
          if (!tv_sec)
            v8[2] = v13.st_mtimespec.tv_sec;
        }
      }
    }
    return (DIR *)v8;
  }
  if ((*(_DWORD *)(a1 + 72) & 0x110) == 0x100 && *(_QWORD *)(a1 + 32) == 0)
    return 0;
  v5 = *(_DWORD *)(a1 + 64);
  if ((v5 & 2) != 0)
    v6 = v5 & 0xFFFFFFFC | 1;
  else
    v6 = *(_DWORD *)(a1 + 64);
  return asl_list_log_files(*(char **)a1, v3, *(const char **)(a1 + 48), v6, 1);
}

DIR *asl_list_dst_files(uint64_t a1)
{
  char *v1;
  char *v2;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 8))
    return 0;
  v1 = *(char **)(a1 + 40);
  if (!v1)
    return 0;
  v2 = *(char **)(a1 + 32);
  if (!v2)
    v2 = *(char **)a1;
  return asl_list_log_files(v2, v1, *(const char **)(a1 + 48), *(_DWORD *)(a1 + 64), 0);
}

uint64_t sub_10000A1C0(uint64_t result)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  uint64_t v6;

  if (result)
  {
    do
    {
      while (1)
      {
        v2 = *(unsigned __int8 *)++result;
        v1 = v2;
        if (v2 <= 31)
          break;
        if (v1 != 32)
        {
          if (v1 != 91)
            return result;
          do
          {
            v3 = *(unsigned __int8 *)(result + 1);
            if (v3 == 92)
            {
              v4 = *(unsigned __int8 *)(result + 2);
              v5 = v4 == 93;
              if (v4 == 93)
                v6 = 3;
              else
                v6 = 2;
              v3 = *(unsigned __int8 *)(result + v6);
              if (v5)
                result += 3;
              else
                result += 2;
            }
            else
            {
              ++result;
            }
          }
          while (v3 != 93);
        }
      }
    }
    while (v1 == 9);
    if (!v1)
      return 0;
  }
  return result;
}

_BYTE *sub_10000A238(char *__s)
{
  const char *i;
  int v2;
  size_t v4;
  size_t v5;
  int v6;
  _BYTE *v8;
  _BYTE *v10;

  if (!__s)
    return 0;
  for (i = __s; ; ++i)
  {
    v2 = *(unsigned __int8 *)i;
    if (v2 != 32 && v2 != 9)
      break;
  }
  v4 = strlen(i);
  if (!v4)
    return 0;
  v5 = v4;
  while (1)
  {
    v6 = i[v5 - 1];
    if (v6 != 32 && v6 != 9)
      break;
    if (!--v5)
      return 0;
  }
  v10 = malloc_type_malloc(v5 + 1, 0xC690138uLL);
  v8 = v10;
  if (v10)
  {
    memcpy(v10, i, v5);
    v8[v5] = 0;
  }
  return v8;
}

_DWORD *sub_10000A2DC(_DWORD *result, char *a2)
{
  _DWORD *v2;
  int pw_uid;
  passwd *v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;

  if (result && a2)
  {
    v2 = result;
    pw_uid = atoi(a2);
    if (pw_uid == 501)
    {
      v4 = getpwnam("mobile");
      if (v4)
        pw_uid = v4->pw_uid;
      else
        pw_uid = 501;
    }
    v5 = v2[32];
    result = (_DWORD *)*((_QWORD *)v2 + 15);
    if (v5)
    {
      v6 = v2[32];
      v7 = (int *)*((_QWORD *)v2 + 15);
      while (1)
      {
        v8 = *v7++;
        if (v8 == pw_uid)
          break;
        if (!--v6)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      result = reallocf(result, 4 * (v5 + 1));
      *((_QWORD *)v2 + 15) = result;
      if (result)
      {
        v9 = v2[32];
        v2[32] = v9 + 1;
        result[v9] = pw_uid;
      }
      else
      {
        v2[32] = 0;
      }
    }
  }
  return result;
}

_DWORD *sub_10000A384(_DWORD *result, char *a2)
{
  _DWORD *v2;
  int pw_gid;
  passwd *v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;

  if (result && a2)
  {
    v2 = result;
    pw_gid = atoi(a2);
    if (pw_gid == 501)
    {
      v4 = getpwnam("mobile");
      if (v4)
        pw_gid = v4->pw_gid;
      else
        pw_gid = 501;
    }
    v5 = v2[36];
    result = (_DWORD *)*((_QWORD *)v2 + 17);
    if (v5)
    {
      v6 = v2[36];
      v7 = (int *)*((_QWORD *)v2 + 17);
      while (1)
      {
        v8 = *v7++;
        if (v8 == pw_gid)
          break;
        if (!--v6)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      result = reallocf(result, 4 * (v5 + 1));
      *((_QWORD *)v2 + 17) = result;
      if (result)
      {
        v9 = v2[36];
        v2[36] = v9 + 1;
        result[v9] = pw_gid;
      }
      else
      {
        v2[36] = 0;
      }
    }
  }
  return result;
}

const char *sub_10000A42C(const char *result)
{
  const char *v1;
  size_t v2;
  size_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  int v10;

  if (!result)
    return result;
  v1 = result;
  v2 = strlen(result);
  v3 = v2;
  if (v2 >= 2)
  {
    v4 = *(unsigned __int8 *)v1;
    if (v4 != 39 && v4 != 34 || v1[v2 - 1] != v4)
    {
LABEL_8:
      v5 = 0;
      v6 = 0;
      do
      {
        if (v1[v6] == 92)
          ++v5;
        ++v6;
      }
      while (v3 != v6);
      v7 = 0;
      goto LABEL_14;
    }
    ++v1;
    v3 = v2 - 2;
  }
  if (v3)
    goto LABEL_8;
  v5 = 0;
  v7 = 1;
LABEL_14:
  result = (const char *)malloc_type_malloc(v3 - v5 + 1, 0x6785B7ABuLL);
  if (result)
  {
    v8 = 0;
    if ((v7 & 1) == 0)
    {
      do
      {
        v10 = *(unsigned __int8 *)v1++;
        v9 = v10;
        if (v10 != 92)
          result[v8++] = v9;
        --v3;
      }
      while (v3);
    }
    result[v8] = 0;
  }
  return result;
}

uint64_t sub_10000A504(uint64_t a1, const char *a2)
{
  const char *v4;
  const char *v5;
  const char *i;
  unsigned int v7;
  BOOL v8;
  uint64_t result;
  const char *v10;
  size_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  const char *v18;
  size_t v19;
  int v20;
  int v21;
  int v22;
  int v23;

  if (!a2)
    return 0xFFFFFFFFLL;
  if (*a2 == 46)
  {
    v4 = a2;
  }
  else
  {
    v10 = *(const char **)(a1 + 40);
    if (!v10)
      return 0xFFFFFFFFLL;
    v11 = strlen(*(const char **)(a1 + 40));
    if (strncmp(a2, v10, v11) || (v4 = &a2[v11], a2[v11] != 46))
    {
      v12 = sub_10000A6A8((uint64_t)a2);
      *(_DWORD *)(a1 + 64) = v12;
      if (v12)
      {
        v13 = v12;
        result = 0;
        if (*(_QWORD *)(a1 + 48))
          v14 = 0x20000000;
        else
          v14 = 0x10000000;
        v15 = v14 | v13;
        goto LABEL_26;
      }
      return 0xFFFFFFFFLL;
    }
  }
  v5 = v4 + 1;
  for (i = v4 + 2; ; ++i)
  {
    v7 = *((unsigned __int8 *)i - 1);
    if (v7 <= 0x1F)
    {
      if (*(i - 1))
        v8 = v7 == 9;
      else
        v8 = 1;
      if (v8)
      {
LABEL_24:
        v16 = sub_10000A6A8((uint64_t)v5);
        *(_DWORD *)(a1 + 64) = v16;
        if (!v16)
          return 0xFFFFFFFFLL;
        v17 = v16;
        result = 0;
        v15 = v17 | 0x10000000;
        goto LABEL_26;
      }
      continue;
    }
    if (v7 == 32)
      goto LABEL_24;
    if (v7 == 46)
      break;
  }
  v18 = *(const char **)(a1 + 48);
  if (!v18)
    return 0xFFFFFFFFLL;
  v19 = strlen(*(const char **)(a1 + 48));
  if (strncmp(v5, v18, v19) || v5[v19] != 46)
  {
    if (!strncmp(i, v18, v19))
    {
      v22 = sub_10000A6A8((uint64_t)v5);
      *(_DWORD *)(a1 + 64) = v22;
      if (v22)
      {
        v23 = v22;
        result = 0;
        v15 = v23 | 0x40000000;
        goto LABEL_26;
      }
    }
    return 0xFFFFFFFFLL;
  }
  v20 = sub_10000A6A8((uint64_t)i);
  *(_DWORD *)(a1 + 64) = v20;
  if (!v20)
    return 0xFFFFFFFFLL;
  v21 = v20;
  result = 0;
  v15 = v21 | 0x20000000;
LABEL_26:
  *(_DWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_10000A6A8(uint64_t result)
{
  unint64_t i;
  int v2;
  BOOL v5;
  uint64_t v9;
  int v10;

  if (!result)
    return result;
  for (i = 0; ; ++i)
  {
    v2 = *(unsigned __int8 *)(result + i);
    if ((v2 - 97) >= 0x1A)
      break;
    if (i > 0xA)
      goto LABEL_9;
LABEL_8:
    *((_BYTE *)&v9 + i) = v2;
  }
  if (i <= 0xA && v2 == 45)
    goto LABEL_8;
LABEL_9:
  *((_BYTE *)&v9 + i) = 0;
  if ((_DWORD)v9 == 6514035 || v9 == 0x73646E6F636573)
    return 1;
  if (!(v9 ^ 0x756C757A | BYTE4(v9)) || (_DWORD)v9 == 6517877)
    return 4;
  if ((_DWORD)v9 == 761492597 && WORD2(v9) == 98)
    return 8;
  if (v9 == 0x697361622D637475 && (unsigned __int16)v10 == 99)
    return 8;
  v5 = (_DWORD)v9 == 1633906540 && WORD2(v9) == 108;
  if (v5 || (_DWORD)v9 == 7103340)
    return 16;
  if (v9 == 0x622D6C61636F6CLL)
    return 32;
  if ((_DWORD)v9 == 762078060 && WORD2(v9) == 98)
    return 32;
  if (v9 == 0x61622D6C61636F6CLL && v10 == 6515059)
    return 32;
  if (v9 == 0x697361622D6C636CLL && (unsigned __int16)v10 == 99)
    return 32;
  if ((unsigned __int16)v9 == 35 || (_DWORD)v9 == 7431539)
    return 2;
  return 2 * ((v9 ^ 0x65636E6575716573 | v10) == 0);
}

uint64_t _asl_server_query_2(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _QWORD *a7, _DWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v14;
  uint64_t v15;
  int v16;
  mach_msg_header_t msg;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  NDR_record_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  msg.msgh_size = 0;
  v19 = 1;
  v20 = a2;
  v21 = 16777473;
  v22 = a3;
  v23 = NDR_record;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x7900000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v14 = mach_msg(&msg, 3, 0x48u, 0x4Cu, reply_port, 0, 0);
  v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        v15 = 4294966988;
      }
      else if (msg.msgh_id == 221)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v15 = 4294966996;
          if (v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && HIBYTE(v21) == 1)
          {
            v16 = v22;
            if (v22 == v24)
            {
              v15 = 0;
              *a7 = v20;
              *a8 = v16;
              *a9 = v25;
              *a10 = v26;
              return v15;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (msg.msgh_remote_port)
              v15 = 4294966996;
            else
              v15 = HIDWORD(v20);
          }
        }
        else
        {
          v15 = 4294966996;
        }
      }
      else
      {
        v15 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v15;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v15;
}
