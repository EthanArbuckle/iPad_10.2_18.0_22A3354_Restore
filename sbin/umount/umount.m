void start(int a1, char **a2)
{
  int v4;
  const char **v5;
  int v6;
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  char *v10;
  char **v11;
  char *v12;
  FILE *v13;
  int *v14;
  unint64_t v15;
  pid_t v16;
  statfs *v17;

  v4 = 0;
  v5 = 0;
  while (1)
  {
    while (1)
    {
      v6 = getopt(a1, a2, "AaFfh:t:v");
      if (v6 > 101)
        break;
      if (v6 <= 69)
      {
        if (v6 != 65)
        {
          if (v6 == -1 && (v7 = optind, (v4 != 0) == (optind == a1)))
          {
            if (qword_100008018 && !v5)
              v5 = (const char **)makevfslist("nfs");
            v17 = 0;
            if ((dword_100008014 & 0x80000) != 0)
            {
              v16 = getpid();
              if (sysctlbyname("vfs.generic.noremotehang", 0, 0, &v16, 4uLL))
              {
                if (dword_100008020)
                  warn("sysctl vfs.generic.noremotehang");
              }
            }
            if (v4 == 2)
            {
              v8 = getmntinfo(&v17, 2);
              if (!v8)
              {
                warn("getmntinfo");
                v9 = 1;
                goto LABEL_33;
              }
              if (v8 >= 2)
              {
                v9 = 0;
                v15 = v8 + 1;
                do
                {
                  if (!checkvfsname(v17[(v15 - 2)].f_fstypename, v5)
                    && sub_100002D38(v17[(v15 - 2)].f_mntonname, v5))
                  {
                    v9 = 1;
                  }
                  --v15;
                }
                while (v15 > 2);
                goto LABEL_33;
              }
              goto LABEL_53;
            }
            if (v4 != 1)
            {
              v10 = a2[v7];
              if (v10)
              {
                v9 = 0;
                v11 = &a2[v7 + 1];
                do
                {
                  if (sub_100002D38(v10, v5))
                    v9 = 1;
                  v12 = *v11++;
                  v10 = v12;
                }
                while (v12);
LABEL_33:
                exit(v9);
              }
LABEL_53:
              v9 = 0;
              goto LABEL_33;
            }
            if (setfsent())
            {
              v9 = sub_100003374(v5);
              goto LABEL_33;
            }
            v13 = __stderrp;
            v14 = __error();
            strerror(*v14);
            fprintf(v13, "Can't get filesystem checklist: %s\n");
          }
          else
          {
LABEL_34:
            fprintf(__stderrp, "usage: %s\n       %s\n");
          }
          exit(1);
        }
LABEL_15:
        v4 = 2;
      }
      else if (v6 == 70)
      {
        dword_100008010 = 1;
      }
      else
      {
        if (v6 != 97)
          goto LABEL_34;
        v4 = 1;
      }
    }
    if (v6 > 115)
    {
      if (v6 == 118)
      {
        dword_100008020 = 1;
      }
      else
      {
        if (v6 != 116)
          goto LABEL_34;
        if (v5)
          errx(1, "only one -t option may be specified.");
        v5 = (const char **)makevfslist(optarg);
      }
    }
    else
    {
      if (v6 != 102)
      {
        if (v6 != 104)
          goto LABEL_34;
        qword_100008018 = (uint64_t)optarg;
        goto LABEL_15;
      }
      dword_100008014 = 0x80000;
    }
  }
}

uint64_t sub_100002D38(char *a1, const char **a2)
{
  char *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  const char *v18;
  char *v19;
  _BOOL4 v20;
  int v21;
  char *v23;
  int v24;
  unsigned __int8 v25;
  const char *v26;
  int v27;
  int v28;
  int v29;
  char *v30;
  uint64_t v31;
  unsigned __int8 v32;
  BOOL v33;
  _BOOL4 v35;
  FILE *v36;
  int *v37;
  char *v38;
  timespec v39;
  char *v40;
  uint64_t v41;
  pthread_cond_t *v42;
  pthread_mutex_t *v43;
  pthread_t v44;
  char *__s1;
  int v46;
  stat v47;
  pthread_cond_t v48;
  pthread_mutex_t v49;

  memset(&v47, 0, sizeof(v47));
  v46 = 0;
  __s1 = 0;
  v4 = (char *)sub_100003494(a1, 0, &__s1);
  v5 = a1;
  if (!v4 && (v5 = (const char *)sub_100003494(a1, 1, &__s1), (v4 = a1) == 0) || !v5)
  {
    v4 = (char *)&v49;
    if (!realpath_DARWIN_EXTSN(a1, (char *)&v49))
    {
      v4 = a1;
      if (dword_100008020)
      {
        warn("realpath(%s)", (const char *)&v49);
        v4 = a1;
      }
    }
    if (stat(v4, &v47) < 0)
    {
      if (dword_100008020)
        warn("stat(%s)", v4);
      v7 = sub_100003494(v4, 0, &__s1);
      if (v7)
        goto LABEL_25;
    }
    else
    {
      v6 = v47.st_mode & 0xF000;
      if (v6 != 0x4000)
      {
        if (v6 != 24576)
        {
          warnx("%s: not a directory or special device", v4);
          if (v4)
          {
LABEL_17:
            if (!strcmp(v4, a1))
              goto LABEL_113;
          }
LABEL_27:
          v10 = sub_100003494(a1, 0, &__s1);
          if (v10)
          {
            v4 = (char *)v10;
            goto LABEL_29;
          }
          v31 = sub_100003494(a1, 1, &__s1);
          if (v31)
          {
            v5 = (const char *)v31;
            v4 = a1;
            goto LABEL_30;
          }
LABEL_113:
          warnx("%s: not currently mounted", a1);
          return 1;
        }
        v7 = sub_100003494(v4, 0, &__s1);
        if (!v7)
        {
          if (v4)
            goto LABEL_17;
          goto LABEL_27;
        }
LABEL_25:
        v5 = v4;
        v4 = (char *)v7;
        goto LABEL_30;
      }
    }
    v5 = (const char *)sub_100003494(v4, 1, &__s1);
    if (v5)
      goto LABEL_30;
    goto LABEL_27;
  }
  if ((dword_100008014 & 0x80000) == 0)
  {
LABEL_29:
    v5 = a1;
    goto LABEL_30;
  }
  v44 = 0;
  memset(v48.__opaque, 0, sizeof(v48.__opaque));
  v48.__sig = 1018212795;
  memset(v49.__opaque, 0, sizeof(v49.__opaque));
  v49.__sig = 850045863;
  v40 = v4;
  v41 = 0;
  v42 = &v48;
  v43 = &v49;
  v39.tv_sec = time(0) + 10;
  v39.tv_nsec = 0;
  if (!pthread_create(&v44, 0, (void *(__cdecl *)(void *))sub_100003680, &v40) && !pthread_mutex_lock(&v49))
  {
    if ((_DWORD)v41)
    {
      pthread_mutex_unlock(&v49);
    }
    else
    {
      do
        v8 = pthread_cond_timedwait(&v48, &v49, &v39);
      while (!(v41 | v8));
      v9 = v8;
      pthread_mutex_unlock(&v49);
      if (v9)
      {
        *__error() = v9;
        warn("pthread_cond_timeout failed; continuing with unmount");
      }
    }
  }
LABEL_30:
  if (checkvfsname(__s1, a2))
    return 1;
  if (qword_100008018)
  {
    v12 = strncmp("ftp://", v5, 6uLL);
    v13 = strcmp(__s1, "nfs");
    v14 = 0;
    if (!v12)
    {
      v15 = 0;
      goto LABEL_82;
    }
    v15 = 0;
    if (v13)
      goto LABEL_82;
    if (*v5 == 91)
    {
      v16 = 0;
      v17 = 0;
      v18 = v5;
LABEL_37:
      v19 = (char *)(v18 + 1);
      while (1)
      {
        v20 = (*v19 & 0x80000000) == 0 && _DefaultRuneLocale.__runetype[*v19] & 0x10000;
        v21 = *v19;
        if (v21 != 58 && !v20)
          break;
        ++v19;
        if (v21 == 58)
        {
          v18 = v19 - 1;
          if (!v16)
            v16 = v19 - 1;
          if (!v17)
          {
            v24 = *v19;
            v23 = v19 - 1;
            if (v24 == 47)
              v17 = v23;
            else
              v17 = 0;
            v18 = v23;
          }
          goto LABEL_37;
        }
      }
      if (v21 == 93 && v19[1] == 58)
      {
        memset(&v48, 0, 28);
        v25 = *v19;
        v26 = v5 + 1;
        *v19 = 0;
        v27 = inet_pton(30, v5 + 1, &v48);
        *v19 = v25;
        if (v27)
          goto LABEL_81;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v19 = (char *)v5;
    }
    v28 = *v19;
    if (*v19)
    {
      while (!v16 || !v17)
      {
        if (v28 == 58)
        {
          if (!v16)
            v16 = v19;
          if (!v17)
          {
            if (v19[1] == 47)
              v17 = v19;
            else
              v17 = 0;
          }
        }
        v29 = *++v19;
        v28 = v29;
        if (!v29)
          goto LABEL_69;
      }
      v19 = v17;
    }
    else
    {
LABEL_69:
      if (v16)
        v30 = v16;
      else
        v30 = v19;
      if (v17)
        v19 = v17;
      else
        v19 = v30;
      if (!((unint64_t)v17 | (unint64_t)v16))
      {
        v14 = 0;
        v15 = 0;
        goto LABEL_82;
      }
    }
    v26 = v5;
LABEL_81:
    v32 = *v19;
    *v19 = 0;
    v14 = (uint64_t)getipnodebyname(v26, 2, 0, &v46);
    v15 = (uint64_t)getipnodebyname(v26, 30, 0, &v46);
    *v19 = v32;
LABEL_82:
    if (qword_100008018)
      v33 = (v14 | v15) == 0;
    else
      v33 = 1;
    if (v33)
      goto LABEL_87;
    if (sub_1000036EC(v14))
    {
      v35 = 1;
      if (!v14)
        goto LABEL_95;
    }
    else
    {
      v35 = sub_1000036EC(v15) != 0;
      if (!v14)
      {
LABEL_95:
        if (v15)
          freehostent((hostent *)v15);
        if (!v35)
          return 1;
        goto LABEL_87;
      }
    }
    freehostent((hostent *)v14);
    goto LABEL_95;
  }
LABEL_87:
  if (dword_100008020)
    printf("%s unmount from %s\n", v5, v4);
  if (dword_100008010 || (unmount(v4, dword_100008014) & 0x80000000) == 0)
    return 0;
  if (getuid() || *__error() != 70 && *__error() != 2 && (dword_100008014 & 0x80000) == 0)
  {
    if (*__error() == 16)
    {
      v36 = __stderrp;
      v37 = __error();
      v38 = strerror(*v37);
      fprintf(v36, "umount(%s): %s -- try 'diskutil unmount'\n", v4, v38);
      return 1;
    }
LABEL_110:
    warn("unmount(%s)", v4);
    return 1;
  }
  if (dword_100008020)
    warn("unmount(%s)", v4);
  if ((sub_1000037B8(v4, dword_100008014) & 0x80000000) != 0)
    goto LABEL_110;
  return 0;
}

BOOL sub_100003374(const char **a1)
{
  fstab *v2;
  fstab *v3;
  const char *fs_file;
  const char *fs_type;
  _BOOL8 v6;
  size_t v7;
  char *v8;
  char *v9;
  int v10;

  v2 = getfsent();
  if (!v2)
    return 0;
  v3 = v2;
  while (1)
  {
    fs_file = v3->fs_file;
    if (strcmp(fs_file, "/"))
    {
      fs_type = v3->fs_type;
      if (!strcmp(fs_type, "rw") || !strcmp(fs_type, "ro") || !strcmp(fs_type, "rq"))
        break;
    }
    v3 = getfsent();
    if (!v3)
      return 0;
  }
  v7 = strlen(fs_file) + 1;
  v8 = (char *)malloc_type_malloc(v7, 0x93C4283uLL);
  if (!v8)
    sub_100003B34();
  v9 = v8;
  strlcpy(v8, v3->fs_file, v7);
  v10 = sub_100003374(a1);
  v6 = (sub_100002D38(v9, a1) | v10) != 0;
  free(v9);
  return v6;
}

uint64_t sub_100003494(char *__s2, int a2, _QWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  size_t v17;
  unsigned int v18;
  char *__s;

  if (qword_100008000)
  {
    v6 = dword_100008008;
  }
  else
  {
    v6 = getmntinfo((statfs **)&qword_100008000, 2);
    dword_100008008 = v6;
    if (!v6)
    {
      warn("getmntinfo");
      return 0;
    }
  }
  if (v6 < 1)
    return 0;
  v7 = qword_100008000;
  __s = __s2 + 5;
  v8 = v6 + 1;
  while (1)
  {
    v9 = v8 - 2;
    if (a2 == 1)
      break;
    if (!a2)
    {
      v10 = v8 - 2;
      v11 = (char *)(v7 + 2168 * v9 + 1112);
      if (!strcmp(v11, __s2)
        || !strncmp(__s2, "/dev/", 5uLL)
        && (v12 = strstr(v11, "://")) != 0
        && (v13 = v12, strlen(v12) >= 4)
        && (v14 = v13 + 3, (v15 = strchr(v14, 47)) != 0)
        && (v16 = v15, v17 = strlen(__s), v17 == v16 - v14)
        && !strncmp(v14, __s, v17))
      {
        if (a3)
        {
          *a3 = v7 + 2168 * v10 + 72;
          v7 = qword_100008000;
        }
        return v7 + 2168 * v10 + 88;
      }
    }
LABEL_17:
    if ((unint64_t)--v8 <= 1)
      return 0;
  }
  v18 = v8 - 2;
  if (strcmp((const char *)(v7 + 2168 * v9 + 88), __s2))
    goto LABEL_17;
  if (a3)
  {
    *a3 = v7 + 2168 * v18 + 72;
    v7 = qword_100008000;
  }
  return v7 + 2168 * v18 + 1112;
}

uint64_t sub_100003680(uint64_t a1)
{
  pthread_mutex_t *v2;
  int v4;

  v4 = 2;
  fsctl(*(const char **)a1, 0x80044101uLL, &v4, 0);
  v2 = *(pthread_mutex_t **)(a1 + 24);
  pthread_mutex_lock(v2);
  *(_DWORD *)(a1 + 8) = 1;
  pthread_cond_signal(*(pthread_cond_t **)(a1 + 16));
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t sub_1000036EC(uint64_t a1)
{
  const char *v1;
  char *v3;
  char *v4;
  char **v5;
  char *v6;
  char **v7;
  char *v8;
  char *v9;

  v1 = (const char *)qword_100008018;
  if (qword_100008018)
  {
    if (!a1)
      return 0;
    v3 = *(char **)a1;
    if (strcasecmp((const char *)qword_100008018, *(const char **)a1))
    {
      v4 = strchr(v3, 46);
      if (!v4
        || (*v4 = 0, v1 = (const char *)qword_100008018, strcasecmp((const char *)qword_100008018, *(const char **)a1)))
      {
        v5 = *(char ***)(a1 + 8);
        v6 = *v5;
        if (*v5)
        {
          v7 = v5 + 1;
          while (strcasecmp(v1, v6))
          {
            v8 = strchr(v6, 46);
            if (v8)
            {
              *v8 = 0;
              v1 = (const char *)qword_100008018;
              if (!strcasecmp((const char *)qword_100008018, *(v7 - 1)))
                break;
            }
            v9 = *v7++;
            v6 = v9;
            if (!v9)
              return 0;
          }
          return 1;
        }
        return 0;
      }
    }
  }
  return 1;
}

uint64_t sub_1000037B8(char *a1, int a2)
{
  uint64_t v4;
  int v5;

  v5 = a2;
  v4 = 0;
  if ((sub_100003834(a1, &v4) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (dword_100008020)
    printf("attempting to unmount %s by fsid\n", a1);
  return sub_1000038E8(65538, &v4, 0, 0, (uint64_t)&v5, 4);
}

uint64_t sub_100003834(char *__s2, _QWORD *a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  const char *v7;
  const char *v8;
  int v9;
  uint64_t result;

  v4 = qword_100008000;
  if (qword_100008000)
  {
    v5 = dword_100008008;
  }
  else
  {
    v5 = getmntinfo((statfs **)&qword_100008000, 2);
    dword_100008008 = v5;
    if (!v5)
    {
      warn("getmntinfo");
      return 0xFFFFFFFFLL;
    }
    v4 = qword_100008000;
  }
  v6 = v5 + 1;
  v7 = (const char *)(v4 + 2168 * v5 - 2080);
  while ((int)--v6 >= 1)
  {
    v8 = v7 - 2168;
    v9 = strcmp(v7, __s2);
    v7 = v8;
    if (!v9)
    {
      result = 0;
      *a2 = *((_QWORD *)v8 + 266);
      return result;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000038E8(int a1, _QWORD *a2, void *a3, size_t *a4, uint64_t a5, uint64_t a6)
{
  int v12;
  int v14;
  _BYTE v15[20];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  size_t v20;
  int v21[14];

  v20 = 14;
  if (sysctlnametomib("vfs.generic.ctlbyfsid", v21, &v20) == -1)
  {
    warn("sysctlnametomib(%s)", "vfs.generic.ctlbyfsid");
    return 0xFFFFFFFFLL;
  }
  else
  {
    v12 = v20;
    v21[v20] = a1;
    *(_OWORD *)&v15[4] = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0;
    v14 = 1;
    *(_QWORD *)v15 = *a2;
    *(_QWORD *)&v15[12] = a5;
    *(_QWORD *)&v16 = a6;
    return sysctl(v21, v12 + 1, a3, a4, &v14, 0x50uLL);
  }
}

uint64_t checkvfsname(char *__s1, const char **a2)
{
  const char **v2;
  const char *v3;
  const char **v5;
  const char *v6;

  v2 = a2;
  if (a2)
  {
    v3 = *a2;
    if (*v2)
    {
      v5 = v2 + 1;
      while (strcmp(__s1, v3))
      {
        v6 = *v5++;
        v3 = v6;
        if (!v6)
          goto LABEL_6;
      }
      LOBYTE(v2) = byte_10000800C;
    }
    else
    {
LABEL_6:
      LOBYTE(v2) = byte_10000800C ^ 1;
    }
  }
  return v2 & 1;
}

_QWORD *makevfslist(char *a1)
{
  char *v1;
  int v2;
  char *i;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v1 = a1;
  if (*a1 == 110 && a1[1] == 111)
  {
    v1 = a1 + 2;
    byte_10000800C = 1;
  }
  v2 = 0;
  for (i = v1; *i == 44; ++i)
  {
    ++v2;
LABEL_10:
    ;
  }
  if (*i)
    goto LABEL_10;
  v4 = malloc_type_malloc(8 * (v2 + 2), 0x10040436913F5uLL);
  v5 = v4;
  if (v4)
  {
    *v4 = v1;
    v6 = strchr(v1, 44);
    v7 = 1;
    if (v6)
    {
      do
      {
        *v6 = 0;
        v8 = v6 + 1;
        v9 = v7 + 1;
        v5[v7] = v8;
        v6 = strchr(v8, 44);
        v7 = v9;
      }
      while (v6);
      v7 = v9;
    }
    v5[v7] = 0;
  }
  else
  {
    warn(0);
  }
  return v5;
}

void sub_100003B34()
{
  err(1, 0);
}
