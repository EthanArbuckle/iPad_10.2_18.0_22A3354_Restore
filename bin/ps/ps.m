uint64_t sub_100003054()
{
  const char *v0;
  int v1;
  const char *v2;
  char **v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  const char *v8;
  const char *v9;
  char *v10;
  uint64_t __key;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v0 = off_10000C000[0];
  if (*off_10000C000[0])
  {
    v1 = 0;
    v2 = (const char *)&unk_1000076FA;
    v3 = off_10000C058;
    do
    {
      v4 = strlen(v0);
      v5 = (uint64_t)*(v3 - 9);
      if (!v5
        || (v16 = 0u,
            v17 = 0u,
            v14 = 0u,
            v15 = 0u,
            v13 = 0u,
            __key = v5,
            bsearch(&__key, off_10000C000, 0x59uLL, 0x58uLL, (int (__cdecl *)(const void *, const void *))sub_100003174)))
      {
        v6 = v1 + v4 + 1;
        if (v6 <= dword_10000E128)
          v7 = v1 + v4 + 1;
        else
          v7 = v4;
        if (v6 <= dword_10000E128)
          v8 = v2;
        else
          v8 = "\n";
        if (dword_10000E128)
        {
          v1 = v7;
          v9 = v8;
        }
        else
        {
          v9 = v2;
        }
        printf("%s%s", v9, v0);
        v2 = " ";
      }
      v10 = *v3;
      v3 += 11;
      v0 = v10;
    }
    while (*v10);
  }
  return putchar(10);
}

uint64_t sub_100003174(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void sub_100003180(const char *a1, uint64_t a2)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  const char **v7;
  const char **v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char *__s1;
  char *__stringp;

  v3 = strdup(a1);
  v4 = v3;
  __stringp = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      if (!*v5)
        break;
      __s1 = 0;
      while (1)
      {
        v6 = strsep(&__stringp, " \t,\n");
        if (!v6)
          break;
        if (*v6)
        {
          v7 = sub_1000032D8(v6, a2, (const char **)&__s1);
          if (v7)
          {
            v8 = v7;
            if ((_DWORD)a2 || !sub_100006BBC(v7))
            {
              v9 = malloc_type_malloc(0x18uLL, 0x70040305B5C43uLL);
              if (!v9)
                sub_100007148();
              v10 = v9;
              v9[1] = v8[1];
              if (__s1)
              {
                v11 = strdup(__s1);
                __s1 = v11;
                if (v11)
                  v10[1] = v11;
              }
              v12 = malloc_type_malloc(0x58uLL, 0x10D0040E0FCBBA0uLL);
              v10[2] = v12;
              if (!v12)
                sub_100007148();
              v13 = *((_OWORD *)v8 + 1);
              *v12 = *(_OWORD *)v8;
              v12[1] = v13;
              v14 = *((_OWORD *)v8 + 2);
              v15 = *((_OWORD *)v8 + 3);
              v16 = *((_OWORD *)v8 + 4);
              *((_QWORD *)v12 + 10) = v8[10];
              v12[3] = v15;
              v12[4] = v16;
              v12[2] = v14;
              *v10 = 0;
              *off_10000DEC8 = v10;
              off_10000DEC8 = (_UNKNOWN **)v10;
            }
          }
          break;
        }
      }
      v5 = __stringp;
    }
    while (__stringp);
  }
  free(v4);
  if (!off_10000DEC0)
    sub_100007128();
}

const char **sub_1000032D8(char *a1, uint64_t a2, const char **a3)
{
  char *v6;
  const char *v7;
  const char **v8;
  const char **v9;
  const char *v10;
  size_t v11;
  size_t v12;
  char *v13;
  char *__key;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  v6 = strchr(a1, 61);
  v7 = v6;
  if (v6)
  {
    *v6 = 0;
    v7 = v6 + 1;
  }
  __key = a1;
  v8 = (const char **)bsearch(&__key, off_10000C000, 0x59uLL, 0x58uLL, (int (__cdecl *)(const void *, const void *))sub_100003174);
  v9 = v8;
  if (v8)
  {
    v10 = v8[2];
    if (v10)
    {
      if (v7)
      {
        v11 = strlen(v10);
        v12 = v11 + strlen(v7) + 2;
        v13 = (char *)malloc_type_malloc(v12, 0x4295190FuLL);
        snprintf(v13, v12, "%s=%s", v9[2], v7);
        v10 = v13;
      }
      sub_100003180(v10, a2);
      return 0;
    }
  }
  else
  {
    warnx("%s: keyword not found", a1);
    dword_10000E138 = 1;
  }
  if (a3)
    *a3 = v7;
  return v9;
}

uint64_t sub_1000033F4()
{
  int v0;
  uint64_t result;
  size_t v2;
  int v3[2];

  *(_QWORD *)v3 = 0x1800000006;
  v2 = 8;
  v0 = sysctl(v3, 2u, &qword_10000E100, &v2, 0, 0);
  result = 1;
  if (v0 != -1)
  {
    dword_10000E108 = 100;
    dword_10000E10C = 1;
    return 0;
  }
  return result;
}

void sub_100003494()
{
  _UNKNOWN **v0;
  _QWORD *v1;

  v0 = &off_10000DEC0;
  while (1)
  {
    v0 = (_UNKNOWN **)*v0;
    if (!v0)
      break;
    if (*(_BYTE *)v0[1])
    {
      v1 = off_10000DEC0;
      if (off_10000DEC0)
      {
        do
        {
          if ((*(_BYTE *)(v1[2] + 24) & 2) != 0)
          {
            if (*v1)
              printf("%-*s");
            else
              printf("%s");
          }
          else
          {
            printf("%*s");
          }
          if (!*v1)
            break;
          putchar(32);
          v1 = (_QWORD *)*v1;
        }
        while (v1);
      }
      putchar(10);
      return;
    }
  }
}

char *sub_100003578(uint64_t a1, int a2, int a3)
{
  int v8;
  _DWORD *v9;
  _DWORD *v10;
  int v11;
  const char *v12;
  size_t v13;
  const char *v14;
  int64_t v15;
  char *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  int v20;
  int v21;
  uid_t v22;
  size_t v23;
  char *v25;
  int v26;
  char *v27;
  char *v28;
  char *v29;
  int v30;
  size_t v31;
  char *v32;
  char *v33;
  char *v34;
  size_t v35;
  _DWORD size[5];

  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0)
      return strdup((const char *)&unk_1000076FA);
  }
  v34 = 0;
  if (*(_BYTE *)(*(_QWORD *)a1 + 36) == 5)
  {
    v8 = asprintf(&v34, "<defunct>");
  }
  else
  {
    size[0] = 0;
    *(_QWORD *)&size[1] = 0x800000001;
    v35 = 4;
    if (sysctl(&size[1], 2u, size, &v35, 0, 0) != -1)
    {
      v9 = malloc_type_malloc(size[0], 0xFF147BABuLL);
      if (v9)
      {
        v10 = v9;
        *(_QWORD *)&size[1] = 0x3100000001;
        size[3] = *(_DWORD *)(*(_QWORD *)a1 + 40);
        v35 = size[0];
        if (sysctl(&size[1], 3u, v9, &v35, 0, 0) != -1)
        {
          v12 = (const char *)(v10 + 1);
          v11 = *v10;
          v13 = v35;
          v14 = (char *)v10 + v35;
          if ((uint64_t)v35 >= 5)
          {
            do
            {
              if (!*v12)
                break;
              ++v12;
            }
            while (v12 < v14);
          }
          if (v12 != v14)
          {
            if (v12 < v14)
            {
              v15 = (char *)v10 + v35 - v12;
              while (!*v12)
              {
                ++v12;
                if (!--v15)
                {
                  v12 = (char *)v10 + v35;
                  break;
                }
              }
            }
            if (v12 != v14)
            {
              v16 = 0;
              v17 = 0;
              v18 = v12;
              if (v11 >= 1 && v12 < v14)
              {
                v19 = 0;
                v17 = 0;
                v16 = 0;
                v20 = 0;
                while (1)
                {
                  if (!v12[v19])
                  {
                    if (v16)
                    {
                      *v16 = 32;
                      if (!a3)
                        goto LABEL_50;
                    }
                    else
                    {
                      v17 = v19;
                      if (!a3)
                      {
LABEL_50:
                        v16 = (char *)&v12[v19];
                        goto LABEL_52;
                      }
                    }
                    ++v20;
                    v13 = v35;
                    v16 = (char *)&v12[v19];
                  }
                  ++v19;
                  if (v20 >= v11 || &v12[v19] >= (const char *)v10 + v13)
                  {
                    v18 = &v12[v19];
                    break;
                  }
                }
              }
              if (a3 && dword_10000E110)
              {
                if (getuid())
                {
                  v21 = *(_DWORD *)(*(_QWORD *)a1 + 392);
                  v22 = getuid();
                  v23 = v35;
                  if (v21 == v22 && v18 < (const char *)v10 + v35)
                  {
                    do
                    {
LABEL_44:
                      v25 = v16;
                      if (!*v18)
                      {
                        v16 = (char *)v18;
                        if (v25)
                        {
                          if (v18 == v25 + 1)
                          {
                            v16 = v25;
                            break;
                          }
                          *v25 = 32;
                          v23 = v35;
                          v16 = (char *)v18;
                        }
                      }
                      ++v18;
                    }
                    while (v18 < (const char *)v10 + v23);
                  }
                }
                else
                {
                  v23 = v35;
                  if (v18 < (const char *)v10 + v35)
                    goto LABEL_44;
                }
              }
LABEL_52:
              if (v16 && v16 != v12)
              {
                v26 = asprintf(&v34, "%s", v12);
                free(v10);
                goto LABEL_58;
              }
            }
          }
        }
        free(v10);
      }
    }
    v8 = asprintf(&v34, "(%s)");
  }
  v26 = v8;
  v17 = v8;
LABEL_58:
  if (!dword_10000E130)
  {
    v27 = v34;
LABEL_64:
    if (a2)
      goto LABEL_68;
    goto LABEL_65;
  }
  v27 = &v34[v26 - 1];
  if (v26 < 2)
    goto LABEL_64;
  while (*v27 != 47)
  {
    if (--v27 <= v34)
      goto LABEL_64;
  }
  ++v27;
  if (a2)
    goto LABEL_68;
LABEL_65:
  v28 = &v27[v17];
  v30 = *v28;
  v29 = v28 + 1;
  if (v30)
    v27 = v29;
  else
    v27 += v17;
LABEL_68:
  v31 = strlen(v27);
  v32 = (char *)malloc_type_malloc((4 * v31) | 1, 0x6DFF631DuLL);
  if (!v32)
    sub_100007160();
  v33 = v32;
  strvis(v32, v27, 88);
  free(v34);
  return v33;
}

void sub_10000399C(uint64_t a1, _QWORD *a2, int a3, int a4, int a5)
{
  uint64_t v7;
  char *v8;
  char *v9;
  int v10;
  int v12;
  char *v13;
  int v14;

  v7 = a2[2];
  v8 = sub_100003578(a1, a3, a4);
  v9 = v8;
  if (*a2)
  {
    printf("%-*.*s", *(__int16 *)(v7 + 48), *(__int16 *)(v7 + 48), v8);
  }
  else if (dword_10000E128)
  {
    v10 = *(__int16 *)(v7 + 48) - dword_10000E13C + dword_10000E128;
    if (v10 < 1 || a5 != 0)
      v10 = *(__int16 *)(v7 + 48);
    if (v10 >= 1)
    {
      v12 = v10 + 1;
      v13 = v8;
      do
      {
        v14 = *v13;
        if (!*v13)
          break;
        ++v13;
        putchar(v14);
        --v12;
      }
      while (v12 > 1);
    }
  }
  else
  {
    fputs(v8, __stdoutp);
  }
  free(v9);
}

size_t sub_100003A80(uint64_t a1)
{
  char *v1;
  size_t v2;

  v1 = sub_100003578(a1, 1, dword_10000E130 == 0);
  v2 = strlen(v1);
  free(v1);
  return v2;
}

size_t sub_100003ACC(uint64_t a1)
{
  char *v1;
  size_t v2;

  v1 = sub_100003578(a1, 1, 1);
  v2 = strlen(v1);
  free(v1);
  return v2;
}

size_t sub_100003B08(uint64_t a1)
{
  char *v1;
  size_t v2;

  v1 = sub_100003578(a1, 1, 0);
  v2 = strlen(v1);
  free(v1);
  return v2;
}

void sub_100003B44(uint64_t a1, _QWORD *a2)
{
  sub_10000399C(a1, a2, 1, dword_10000E130 == 0, 0);
}

void sub_100003B64(uint64_t a1, _QWORD *a2)
{
  sub_10000399C(a1, a2, 1, 1, 1);
}

void sub_100003B74(uint64_t a1, _QWORD *a2)
{
  sub_10000399C(a1, a2, 1, 0, 0);
}

uint64_t sub_100003B84(uint64_t a1, uint64_t a2)
{
  return printf("%-*s", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), (const char *)(*(_QWORD *)a1 + 243));
}

uint64_t sub_100003BBC(uint64_t a1, uint64_t a2)
{
  int v2;
  passwd *v3;
  const char *pw_name;

  v2 = *(__int16 *)(*(_QWORD *)(a2 + 16) + 48);
  v3 = getpwuid(*(__int16 *)(*(_QWORD *)a1 + 420));
  if (v3)
    pw_name = v3->pw_name;
  else
    pw_name = "UNKNOWN";
  if (!*pw_name)
    pw_name = "-";
  return printf("%-*s", v2, pw_name);
}

uint64_t sub_100003C28(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;
  int v7;
  const char *v8;
  int v9;
  int v10;
  char v11;
  char *v12;
  char v14;
  char v15;
  _BYTE v16[6];

  v2 = *(_QWORD *)(a2 + 16);
  if (!dword_10000E114)
  {
    v4 = *a1;
    v5 = *(char *)(*a1 + 36);
    if (v5 == 5)
    {
      v6 = 90;
    }
    else if (v5 == 4)
    {
      v6 = 84;
    }
    else
    {
      v6 = aRusith[*((int *)a1 + 85)];
    }
    v14 = v6;
    v9 = *(_DWORD *)(v4 + 32);
    v10 = *(char *)(v4 + 242);
    if (v10 < 0)
    {
      v11 = 60;
    }
    else
    {
      if (!v10)
      {
        v12 = &v15;
        if ((v9 & 0x800) == 0)
        {
LABEL_16:
          if ((v9 & 0x2000) != 0 && v5 != 5)
            *v12++ = 69;
          if ((v9 & 0x10) != 0)
            *v12++ = 86;
          if ((v9 & 0x200) != 0)
            *v12++ = 76;
          if ((*(_BYTE *)(*a1 + 612) & 2) != 0)
            *v12++ = 115;
          if ((v9 & 2) != 0 && *(_DWORD *)(*a1 + 564) == *(_DWORD *)(*a1 + 576))
            *v12++ = 43;
          *v12 = 0;
          goto LABEL_29;
        }
LABEL_15:
        *v12++ = 88;
        goto LABEL_16;
      }
      v11 = 78;
    }
    v12 = v16;
    v15 = v11;
    if ((v9 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (dword_10000E11C)
  {
    v3 = a1[57] + 60 * dword_10000E118;
    v14 = aRusith[(int)sub_100006C7C(*(unsigned int *)(v3 + 24), *(unsigned int *)(v3 + 36))];
    v15 = 0;
LABEL_29:
    v7 = *(__int16 *)(v2 + 48);
    v8 = &v14;
    return printf("%-*s", v7, v8);
  }
  v7 = *(__int16 *)(v2 + 48);
  v8 = " ";
  return printf("%-*s", v7, v8);
}

uint64_t sub_100003DE0()
{
  if (dword_10000E114 && dword_10000E11C)
    return printf("%*d%c");
  else
    return printf("%*d");
}

uint64_t sub_100003EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  char *v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0)
      return printf("%-*s", *(__int16 *)(v2 + 48), " ");
  }
  v5 = *(__int16 *)(v2 + 48);
  v6 = user_from_uid(*(_DWORD *)(*(_QWORD *)a1 + 420), 0);
  return printf("%-*s", v5, v6);
}

size_t sub_100003F6C(uint64_t a1)
{
  char *v1;

  v1 = user_from_uid(*(_DWORD *)(*(_QWORD *)a1 + 420), 0);
  return strlen(v1);
}

uint64_t sub_100003F90(uint64_t a1, uint64_t a2)
{
  int v2;
  char *v3;

  v2 = *(__int16 *)(*(_QWORD *)(a2 + 16) + 48);
  v3 = user_from_uid(*(_DWORD *)(*(_QWORD *)a1 + 392), 0);
  return printf("%-*s", v2, v3);
}

size_t sub_100003FD8(uint64_t a1)
{
  char *v1;

  v1 = user_from_uid(*(_DWORD *)(*(_QWORD *)a1 + 392), 0);
  return strlen(v1);
}

uint64_t sub_100003FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  char __str[16];

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_DWORD *)(*(_QWORD *)a1 + 572);
  if (v3 == -1)
    return printf("%*s", *(__int16 *)(v2 + 48), "??");
  snprintf(__str, 0x10uLL, "%d/%d", HIBYTE(v3), v3 & 0xFFFFFF);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_1000040AC(uint64_t a1)
{
  dev_t v2;
  char *v3;
  const char *v4;

  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0)
      return printf("%*s ");
  }
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 572);
  if (v2 == -1)
    return printf("%*s ");
  v3 = devname(v2, 0x2000u);
  if (!v3)
    return printf("%*s ");
  v4 = v3;
  if (strncmp(v3, "tty", 3uLL))
    strncmp(v4, "cua", 3uLL);
  return printf("%*.*s%c");
}

uint64_t sub_1000041C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  dev_t v3;
  const char *v4;
  char *v5;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_DWORD *)(*(_QWORD *)a1 + 572);
  v4 = "??";
  if (v3 != -1)
  {
    v5 = devname(v3, 0x2000u);
    if (v5)
      v4 = v5;
  }
  return printf("%-*s", *(__int16 *)(v2 + 48), v4);
}

uint64_t sub_100004228(time_t **a1, uint64_t a2)
{
  uint64_t v3;
  tm *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  time_t v11;
  char v12[100];

  v3 = *(_QWORD *)(a2 + 16);
  if (dword_10000DE98 < 0)
    dword_10000DE98 = *nl_langinfo(4) != 0;
  v11 = **a1;
  v4 = localtime(&v11);
  v5 = qword_10000E120 - **a1;
  if (v5 > 86399)
  {
    if ((unint64_t)v5 > 0x93A7F)
    {
      v9 = "%e%b%y";
      goto LABEL_11;
    }
    v6 = dword_10000DE98;
    v7 = "%a%I%p";
    v8 = "%a%H  ";
  }
  else
  {
    v6 = dword_10000DE98;
    v7 = "%l:%M%p";
    v8 = "%k:%M  ";
  }
  if (v6)
    v9 = v7;
  else
    v9 = v8;
LABEL_11:
  strftime(v12, 0x64uLL, v9, v4);
  return printf("%-*s", *(__int16 *)(v3 + 48), v12);
}

uint64_t sub_10000435C(time_t **a1, uint64_t a2)
{
  uint64_t v2;
  tm *v3;
  time_t v5;
  char v6[100];

  v2 = *(_QWORD *)(a2 + 16);
  v5 = **a1;
  v3 = localtime(&v5);
  strftime(v6, 0x63uLL, "%c", v3);
  return printf("%-*s", *(__int16 *)(v2 + 48), v6);
}

char *sub_1000043F0(_QWORD **a1)
{
  __darwin_time_t v2;
  char *v4;
  timeval v5;

  v5.tv_sec = 0;
  *(_QWORD *)&v5.tv_usec = 0;
  gettimeofday(&v5, 0);
  v2 = v5.tv_sec - **a1;
  v4 = 0;
  if (v2 < 8640001)
  {
    if (v2 <= 86400)
    {
      if (v2 < 3601)
        asprintf(&v4, "%02ld:%02ld");
      else
        asprintf(&v4, "%02ld:%02ld:%02ld");
    }
    else
    {
      asprintf(&v4, "%02ld-%02ld:%02ld:%02ld");
    }
  }
  else
  {
    asprintf(&v4, "%ld-%02ld:%02ld:%02ld");
  }
  return v4;
}

void sub_1000045EC(_QWORD **a1, uint64_t a2)
{
  char *v3;

  v3 = sub_1000043F0(a1);
  printf("%*s", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), v3);
  free(v3);
}

size_t sub_100004634(_QWORD **a1)
{
  char *v1;
  size_t v2;

  v1 = sub_1000043F0(a1);
  v2 = strlen(v1);
  free(v1);
  return v2;
}

uint64_t sub_100004668(uint64_t a1)
{
  if (!*(_QWORD *)(*(_QWORD *)a1 + 96))
    return printf("%-*s");
  if (*(_QWORD *)(*(_QWORD *)a1 + 104))
    return printf("%-*.*s");
  return printf("%-*lx");
}

uint64_t sub_1000046E0(uint64_t a1, uint64_t a2)
{
  return printf("%*lu", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), *(_QWORD *)(a1 + 364) >> 10);
}

uint64_t sub_10000471C(uint64_t a1, uint64_t a2)
{
  return printf("%*lu", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), *(_QWORD *)(a1 + 372) >> 10);
}

uint64_t sub_100004758(_DWORD *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  char __str[128];

  v2 = *(_QWORD *)(a2 + 16);
  v3 = a1[101] + a1[96];
  v4 = v3 <= 999999;
  if (v3 > 999999)
    v3 -= 1000000;
  v5 = a1[103] + a1[98];
  v6 = a1[97] + a1[95] + a1[100];
  if (!v4)
    ++v6;
  if (v5 <= 999999)
    v7 = a1[103] + a1[98];
  else
    v7 = v5 - 1000000;
  v8 = v7 + v3;
  v9 = v6 + a1[102];
  if (v5 > 999999)
    ++v9;
  if (v8 > 999999)
  {
    ++v9;
    v8 -= 1000000;
  }
  snprintf(__str, 0x80uLL, "%3ld:%02ld.%02ld", ((v8 + 5000) / 1000000 + v9) / 60, ((v8 + 5000) / 1000000 + v9) % 60, (v8 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_1000048DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int *v4;
  int v5;
  char __str[128];

  v2 = *(_QWORD *)(a2 + 16);
  if (dword_10000E114)
  {
    v3 = dword_10000E11C;
    if (dword_10000E11C)
    {
      v4 = (int *)(*(_QWORD *)(a1 + 456) + 60 * dword_10000E118);
      v3 = *v4;
      v5 = v4[1];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 404) + *(_DWORD *)(a1 + 384);
    v3 = *(_DWORD *)(a1 + 400) + *(_DWORD *)(a1 + 380);
    if (v5 >= 1000000)
    {
      ++v3;
      v5 -= 1000000;
    }
  }
  snprintf(__str, 0x80uLL, "%3ld:%02ld.%02ld", ((v5 + 5000) / 1000000 + v3) / 60, ((v5 + 5000) / 1000000 + v3) % 60, (v5 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004A64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  char __str[128];

  v2 = *(_QWORD *)(a2 + 16);
  if (dword_10000E114)
  {
    v3 = dword_10000E11C;
    if (dword_10000E11C)
    {
      v4 = *(_QWORD *)(a1 + 456) + 60 * dword_10000E118;
      v3 = *(_DWORD *)(v4 + 8);
      v5 = *(_DWORD *)(v4 + 12);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 412) + *(_DWORD *)(a1 + 392);
    v3 = *(_DWORD *)(a1 + 408) + *(_DWORD *)(a1 + 388);
    if (v5 >= 1000000)
    {
      ++v3;
      v5 -= 1000000;
    }
  }
  snprintf(__str, 0x80uLL, "%3ld:%02ld.%02ld", ((v5 + 5000) / 1000000 + v3) / 60, ((v5 + 5000) / 1000000 + v3) % 60, (v5 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004BEC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 344);
}

uint64_t sub_100004BF4(uint64_t a1, uint64_t a2)
{
  int v2;

  if (dword_10000E114)
  {
    v2 = dword_10000E11C;
    if (dword_10000E11C)
      v2 = *(_DWORD *)(*(_QWORD *)(a1 + 456) + 60 * dword_10000E118 + 16);
  }
  else
  {
    v2 = *(_DWORD *)(a1 + 344);
  }
  return printf("%*.1f", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), (double)v2 * 100.0 / 1000.0);
}

double sub_100004C88(uint64_t a1)
{
  int v2;
  double result;

  if (dword_10000E10C)
  {
    v2 = dword_10000E140;
  }
  else
  {
    v2 = sub_1000033F4();
    dword_10000E140 = v2;
  }
  result = 0.0;
  if (!v2)
    return (float)*(unint64_t *)(a1 + 372) / (double)(unint64_t)qword_10000E100 * 100.0;
  return result;
}

uint64_t sub_100004D04(uint64_t a1, uint64_t a2)
{
  int v2;
  double v3;

  v2 = *(__int16 *)(*(_QWORD *)(a2 + 16) + 48);
  v3 = sub_100004C88(a1);
  return printf("%*.1f", v2, v3);
}

uint64_t sub_100004D44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 313))
    v2 = *(_QWORD *)(a1 + 96);
  else
    v2 = 0;
  return printf("%*ld", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), v2);
}

uint64_t sub_100004D88(uint64_t a1, uint64_t a2)
{
  return printf("%*s", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), "-");
}

uint64_t sub_100004DC0(uint64_t a1, uint64_t a2)
{
  return printf("%*ld", *(__int16 *)(*(_QWORD *)(a2 + 16) + 48), 0);
}

uint64_t sub_100004DF0(_QWORD *a1, uint64_t a2)
{
  return sub_100004E04((unsigned __int8 *)(*a1 + *(_QWORD *)(*(_QWORD *)(a2 + 16) + 56)), *(_QWORD *)(a2 + 16));
}

uint64_t sub_100004E04(unsigned __int8 *a1, uint64_t a2)
{
  unsigned __int8 *v4;
  char *v5;
  _BYTE *v6;
  int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;

  v4 = *(unsigned __int8 **)(a2 + 72);
  v5 = &byte_10000DE9D;
  if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    byte_10000DE9D = 45;
    v5 = &byte_10000DE9E;
  }
  *v5 = 42;
  v6 = v5 + 1;
  do
  {
    v7 = *v4++;
    *v6++ = v7;
  }
  while (v7);
  switch(*(_DWORD *)(a2 + 64))
  {
    case 0:
      v8 = fmtcheck(asc_10000DE9C, "%*hhd");
      v9 = *(__int16 *)(a2 + 48);
      v10 = (char)*a1;
      return printf(v8, v9, v10);
    case 1:
      v8 = fmtcheck(asc_10000DE9C, "%*hhu");
      v9 = *(__int16 *)(a2 + 48);
      v10 = *a1;
      return printf(v8, v9, v10);
    case 2:
      v8 = fmtcheck(asc_10000DE9C, "%*hd");
      v9 = *(__int16 *)(a2 + 48);
      v10 = *(__int16 *)a1;
      return printf(v8, v9, v10);
    case 3:
      v8 = fmtcheck(asc_10000DE9C, "%*hu");
      v9 = *(__int16 *)(a2 + 48);
      v10 = *(unsigned __int16 *)a1;
      return printf(v8, v9, v10);
    case 4:
      v11 = "%*d";
      goto LABEL_12;
    case 5:
      v11 = "%*u";
LABEL_12:
      v8 = fmtcheck(asc_10000DE9C, v11);
      v9 = *(__int16 *)(a2 + 48);
      v10 = *(unsigned int *)a1;
      return printf(v8, v9, v10);
    case 6:
      v12 = "%*ld";
      goto LABEL_16;
    case 7:
      v12 = "%*lu";
      goto LABEL_16;
    case 8:
      v12 = "%*lx";
LABEL_16:
      v8 = fmtcheck(asc_10000DE9C, v12);
      v9 = *(__int16 *)(a2 + 48);
      v10 = *(_QWORD *)a1;
      return printf(v8, v9, v10);
    default:
      errx(1, "unknown type %d", *(_DWORD *)(a2 + 64));
  }
}

uint64_t sub_100004F94(_QWORD *a1, uint64_t a2)
{
  return sub_100004E04((unsigned __int8 *)(*a1 + *(_QWORD *)(*(_QWORD *)(a2 + 16) + 56) + 296), *(_QWORD *)(a2 + 16));
}

uint64_t sub_100004FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a1 + 313))
    return sub_100004E04((unsigned __int8 *)(a1 + *(_QWORD *)(v2 + 56) + 24), v2);
  else
    return printf("%*s", *(__int16 *)(v2 + 48), "-");
}

uint64_t sub_100005004(uint64_t a1, uint64_t a2)
{
  int v3;
  const char **v4;
  const char *v5;
  _QWORD buffer[2];

  buffer[0] = 0;
  buffer[1] = 0;
  v3 = proc_pidinfo(*(_DWORD *)(*(_QWORD *)a1 + 40), 12, 0, buffer, 16);
  v4 = *(const char ***)(a2 + 16);
  if (v3 != 16)
    return printf("%*s");
  v5 = *v4;
  if (!strcmp(*v4, "wql"))
    return printf("%*s");
  if (strcmp(v5, "wqr"))
    strcmp(v5, "wqb");
  return printf("%*d");
}

uint64_t sub_10000510C(uint64_t a1)
{
  int v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  v2 = 1;
  if (kpersona_pidinfo(*(unsigned int *)(*(_QWORD *)a1 + 40), &v2))
    return printf("%*s");
  else
    return printf("%*u");
}

uint64_t start(int a1, uint64_t a2)
{
  _BOOL4 v4;
  char *v5;
  int v6;
  int v7;
  int v8;
  _BOOL4 v9;
  char *v10;
  const char *v11;
  unsigned __int8 *v12;
  int v13;
  char v14;
  unsigned __int8 *v15;
  char *v16;
  int v17;
  int v18;
  size_t v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  const char *v25;
  int v26;
  _BYTE *v27;
  const char *v28;
  char *v29;
  char *v30;
  const char *v31;
  const char *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  __int128 *v41;
  const char **v42;
  int v43;
  char *v44;
  char *v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  const char *v50;
  const char **v51;
  const char *v52;
  int v53;
  const char *v54;
  _QWORD *v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  void **v60;
  int v61;
  void *v63;
  unsigned int v64;
  size_t v65;
  int v66;
  int v67;
  size_t v68;
  FILE *v69;
  const char *v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  int v74;
  int v75;
  char *v76;
  char *v77;
  unsigned int v78;
  _QWORD *v79;
  _QWORD *v80;
  BOOL v81;
  char v82;
  _DWORD *v83;
  int v84;
  uint64_t v85;
  int *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  size_t v91;
  char *v92;
  _BYTE *v93;
  _QWORD *v94;
  uint64_t v95;
  int v96;
  int v97;
  dev_t v98;
  uint64_t v99;
  int *v100;
  int v101;
  uint64_t v102;
  int *v103;
  int v104;
  uint64_t v105;
  int *v106;
  int v107;
  uint64_t v108;
  int *v109;
  int v110;
  uint64_t v111;
  int *v112;
  int v113;
  uint64_t v114;
  char *v115;
  int v116;
  FILE *v117;
  const char *v118;
  int v119;
  int v120;
  int v121;
  int v122;
  uint64_t v123;
  int v124;
  size_t size;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  void *v132;
  __int128 v133;
  __int128 v134;
  void *v135;
  __int128 v136;
  __int128 v137;
  void *v138;
  __int128 v139;
  __int128 v140;
  int *v141;
  __int128 v142;
  __int128 v143;
  int *v144;
  int v145[4];

  v144 = 0;
  v142 = 0u;
  v143 = 0u;
  v141 = 0;
  v139 = 0u;
  v140 = 0u;
  v138 = 0;
  v136 = 0u;
  v137 = 0u;
  v135 = 0;
  v133 = 0u;
  v134 = 0u;
  v132 = 0;
  v130 = 0u;
  v131 = 0u;
  v129 = 0;
  v127 = 0u;
  v128 = 0u;
  size = 0;
  v126 = 0;
  *(_OWORD *)v145 = xmmword_1000076E0;
  v4 = compat_mode("bin/ps", "unix2003");
  setlocale(0, (const char *)&unk_1000076FA);
  time(&qword_10000E120);
  v5 = getenv("COLUMNS");
  if (v5 && *v5)
  {
    v7 = atoi(v5);
    goto LABEL_12;
  }
  if (ioctl(1, 0x40087468uLL, &v126) != -1 || ioctl(2, 0x40087468uLL, &v126) != -1)
  {
    v8 = WORD1(v126);
    if (!WORD1(v126))
    {
      v7 = 79;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v6 = ioctl(0, 0x40087468uLL, &v126);
  v7 = 79;
  if (v6 != -1)
  {
    v8 = WORD1(v126);
    if (WORD1(v126))
LABEL_10:
      v7 = v8 - 1;
  }
LABEL_12:
  dword_10000E128 = v7;
  if (a1 < 2)
    goto LABEL_50;
  v9 = v4;
  if (v4)
    v10 = "aACcdeEfg:G:hjLlMmO:o:p:rSTt:U:u:vwx";
  else
    v10 = "aACcdeEgG:hjLlMmO:o:p:rSTt:U:uvwx";
  v11 = *(const char **)(a2 + 8);
  v12 = *(unsigned __int8 **)(a2 + 16);
  v13 = *(unsigned __int8 *)v11;
  if (*v11)
  {
    v14 = *v11;
    v15 = *(unsigned __int8 **)(a2 + 8);
    while (1)
    {
      v16 = strchr(v10, v14);
      if (v16)
      {
        if (v16[1] == 58)
          break;
      }
      v17 = *++v15;
      v14 = v17;
      if (!v17)
        goto LABEL_21;
    }
    if (v13 == 45)
      goto LABEL_48;
    v18 = 0;
  }
  else
  {
LABEL_21:
    v15 = 0;
    v18 = 1;
  }
  v19 = strlen(v11);
  v20 = (unsigned __int8 *)&v11[v19 - 1];
  v21 = *v20;
  if (v21 == 116)
  {
    if (v13 != 45 && v20 == v15)
    {
      if (v12)
      {
        v61 = *v12;
        if (v61 != 45 && (v61 - 48) > 9)
          goto LABEL_38;
      }
      *v15 = 84;
      v13 = *(unsigned __int8 *)v11;
    }
  }
  else
  {
    if ((v21 - 48) < 0xA)
      v22 = v18;
    else
      v22 = 0;
    if (v22 == 1)
    {
      while (v20 >= (unsigned __int8 *)v11)
      {
        v23 = *v20;
        v24 = v23 != 44 && (v23 - 48) > 9;
        if (v24)
          break;
        --v20;
      }
      v26 = 0;
      v25 = (const char *)(v20 + 1);
      goto LABEL_40;
    }
  }
  if (v13 != 45)
  {
LABEL_38:
    v25 = 0;
    v26 = 1;
LABEL_40:
    v27 = malloc_type_malloc(v19 + 3, 0xBA2A40A8uLL);
    if (!v27)
      sub_100007174(0);
    v28 = v27;
    v29 = v27;
    if (*v11 != 45)
    {
      v9 = 0;
      *v27 = 45;
      v29 = v27 + 1;
    }
    if (v26)
    {
      v30 = v29;
      v31 = v11;
    }
    else
    {
      memcpy(v29, v11, v25 - v11);
      v29[v25 - v11] = 112;
      v30 = &v29[v25 - v11 + 1];
      v31 = v25;
    }
    strcpy(v30, v31);
    goto LABEL_49;
  }
LABEL_48:
  v28 = v11;
LABEL_49:
  v4 = v9;
  *(_QWORD *)(a2 + 8) = v28;
LABEL_50:
  byte_10000E148 = 0;
  *(_QWORD *)&v142 = 0;
  DWORD2(v142) = 4;
  *(_QWORD *)&v143 = sub_1000062B8;
  *((_QWORD *)&v143 + 1) = "group";
  v144 = 0;
  *(_QWORD *)&v139 = 0;
  DWORD2(v139) = 4;
  *(_QWORD *)&v140 = sub_1000063FC;
  *((_QWORD *)&v140 + 1) = "process group";
  v141 = 0;
  *(_QWORD *)&v136 = 0;
  DWORD2(v136) = 4;
  *(_QWORD *)&v137 = sub_1000063FC;
  *((_QWORD *)&v137 + 1) = "process id";
  v138 = 0;
  *(_QWORD *)&v133 = 0;
  DWORD2(v133) = 4;
  *(_QWORD *)&v134 = sub_10000650C;
  *((_QWORD *)&v134 + 1) = "ruser";
  v135 = 0;
  *(_QWORD *)&v130 = 0;
  DWORD2(v130) = 4;
  *(_QWORD *)&v131 = sub_100006648;
  *((_QWORD *)&v131 + 1) = "tty";
  v132 = 0;
  *(_QWORD *)&v127 = 0;
  DWORD2(v127) = 4;
  *(_QWORD *)&v128 = sub_10000650C;
  *((_QWORD *)&v128 + 1) = "user";
  if (v4)
    v32 = "aACcdeEfg:G:hjLlMmO:o:p:rSTt:U:u:vwx";
  else
    v32 = "aACcdeEgG:hjLlMmO:o:p:rSTt:U:uvwx";
  v129 = 0;
  v33 = getopt(a1, (char *const *)a2, v32);
  if (v33 != -1)
  {
    v122 = 0;
    v36 = 0;
    v119 = 0;
    v121 = 0;
    v124 = 0;
    v35 = 0;
    v34 = 0;
    v38 = aUidPidPpidFlag;
    if (!v4)
      v38 = aUidPidPpidCpuP;
    v118 = v38;
    v39 = 0xFFFFFFFFLL;
    while (2)
    {
      v37 = 0;
      switch((char)v33)
      {
        case 'A':
          goto LABEL_71;
        case 'C':
          dword_10000E12C = 1;
          goto LABEL_106;
        case 'E':
          goto LABEL_73;
        case 'G':
          v40 = optarg;
          v41 = &v142;
          goto LABEL_94;
        case 'L':
          sub_100003054();
          exit(0);
        case 'M':
          sub_100003180(aUserPidTtCpuSt, 0);
          aUserPidTtCpuSt[0] = 0;
          v121 = 1;
          dword_10000E114 = 1;
          goto LABEL_106;
        case 'O':
          v121 = 1;
          sub_100003180(aPid_1, 1);
          sub_100003180(optarg, 1);
          sub_100003180(aTtStateTimeCom, 1);
          aTtStateTimeCom[0] = 0;
          aPid_1[0] = 0;
          goto LABEL_106;
        case 'S':
          dword_10000E134 = 1;
          goto LABEL_106;
        case 'T':
          v40 = ttyname(0);
          optarg = v40;
          if (!v40)
            sub_1000071A0(0);
          goto LABEL_91;
        case 'U':
          v40 = optarg;
          v41 = &v133;
          goto LABEL_94;
        case 'X':
          goto LABEL_107;
        case 'a':
          ++v35;
          v34 = 1;
          goto LABEL_106;
        case 'c':
          dword_10000E130 = 1;
          goto LABEL_106;
        case 'd':
          v122 = 1;
          goto LABEL_71;
        case 'e':
          if (!v4)
          {
LABEL_73:
            dword_10000E110 = 1;
            goto LABEL_106;
          }
LABEL_71:
          ++v35;
          v34 = 1;
LABEL_72:
          v37 = 1;
          goto LABEL_107;
        case 'f':
          dword_10000E128 = 0;
          if (!v4 || (_DWORD)v127)
          {
            sub_100003180(aUserPidPpidCpu, 0);
          }
          else
          {
            sub_100003180(aUidPidPpidCpuC, 0);
            v42 = sub_1000032D8("command", 0, 0);
            if (v42)
              *((_WORD *)v42 + 24) = 64;
          }
          goto LABEL_101;
        case 'g':
          if (!v4)
            goto LABEL_106;
          v40 = optarg;
          v41 = &v139;
          goto LABEL_94;
        case 'h':
          v43 = (unsigned __int16)v126;
          if ((unsigned __int16)v126 <= 5u)
            v43 = 22;
          v124 = v43;
          goto LABEL_106;
        case 'j':
          v44 = aUserPidPpidPgi;
          sub_100003180(aUserPidPpidPgi, 0);
          goto LABEL_100;
        case 'l':
          sub_100003180(v118, 0);
          aUidPidPpidCpuP[0] = 0;
          goto LABEL_101;
        case 'm':
          v45 = aUserPidPpidPgi + 37;
          v46 = 1;
          goto LABEL_89;
        case 'o':
          v121 = 1;
          sub_100003180(optarg, 1);
          goto LABEL_106;
        case 'p':
          sub_10000689C((uint64_t)&v136, optarg);
          ++v35;
          goto LABEL_106;
        case 'r':
          v45 = &aUserPidPpidPgi[37];
          v46 = 2;
LABEL_89:
          *((_DWORD *)v45 + 83) = v46;
          goto LABEL_106;
        case 't':
          v40 = optarg;
LABEL_91:
          v41 = &v130;
          goto LABEL_94;
        case 'u':
          if (v4)
          {
            v40 = optarg;
            v41 = &v127;
LABEL_94:
            sub_10000689C((uint64_t)v41, v40);
            ++v35;
            v36 = 1;
          }
          else
          {
            v44 = aUserPidCpuMemV;
            sub_100003180(aUserPidCpuMemV, 0);
            dword_10000E14C = 2;
LABEL_100:
            *v44 = 0;
LABEL_101:
            v121 = 1;
          }
          goto LABEL_106;
        case 'v':
          sub_100003180(aPidStateTimeSl, 0);
          v121 = 1;
          dword_10000E14C = 1;
          aPidStateTimeSl[0] = 0;
          goto LABEL_106;
        case 'w':
          if (v119)
          {
            v47 = 0;
          }
          else
          {
            if (dword_10000E128 > 130)
              goto LABEL_105;
            v47 = 131;
          }
          dword_10000E128 = v47;
LABEL_105:
          ++v119;
LABEL_106:
          v37 = v39;
LABEL_107:
          v33 = getopt(a1, (char *const *)a2, v32);
          v39 = v37;
          if (v33 == -1)
            goto LABEL_108;
          continue;
        case 'x':
          goto LABEL_72;
        default:
          goto LABEL_172;
      }
    }
  }
  v34 = 0;
  v121 = 0;
  v35 = 0;
  v124 = 0;
  v36 = 0;
  v122 = 0;
  LODWORD(v37) = -1;
LABEL_108:
  v48 = v36;
  v49 = optind;
  if (!isatty(1))
    dword_10000E128 = 0;
  v50 = *(const char **)(a2 + 8 * v49);
  if (v50)
  {
    v51 = (const char **)(a2 + 8 * v49 + 8);
    do
    {
      if (*(unsigned __int8 *)v50 - 48 > 9)
      {
        v69 = __stderrp;
        v70 = getprogname();
        fprintf(v69, "%s: illegal argument: %s\n", v70, *(v51 - 1));
LABEL_172:
        sub_100006A68(v4);
      }
      sub_10000689C((uint64_t)&v136, v50);
      v52 = *v51++;
      v50 = v52;
    }
    while (v52);
  }
  if (byte_10000E148 == 1)
    goto LABEL_175;
  if ((int)v37 >= 0)
    v53 = v37;
  else
    v53 = v48;
  v120 = v53;
  if (!v121)
  {
    if (v4 && (_DWORD)v127)
      sub_100003180("uid", 0);
    if (v4)
      v54 = aPidTtyTimeComm;
    else
      v54 = aPidTtStateTime;
    sub_100003180(v54, 0);
  }
  if (!v35)
  {
    v129 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    if (!v129)
      sub_100007174(0);
    *(_QWORD *)&v127 = 0x100000001;
    *(_DWORD *)v129 = getuid();
    v35 = 1;
  }
  v55 = off_10000DEC0;
  if (off_10000DEC0)
  {
    do
    {
      v56 = v55[2];
      v57 = *(_DWORD *)(v56 + 24);
      if ((v57 & 8) != 0)
      {
        *(_WORD *)(v56 + 80) = *(_WORD *)(v56 + 48);
        *(_WORD *)(v56 + 48) = 0;
      }
      if ((v57 & 4) != 0)
        byte_10000E158 = 1;
      v55 = (_QWORD *)*v55;
    }
    while (v55);
  }
  v58 = 0;
  if (v35 != 1)
  {
    v59 = 0;
    goto LABEL_155;
  }
  v59 = 0;
  if ((_DWORD)v142 == 1)
    goto LABEL_155;
  if ((_DWORD)v139 == 1)
  {
    v60 = (void **)&v141;
    v59 = 2;
LABEL_154:
    v35 = 0;
    v58 = *(_DWORD *)*v60;
    goto LABEL_155;
  }
  v59 = v136;
  if ((_DWORD)v136 == 1)
  {
    v60 = &v138;
    goto LABEL_154;
  }
  if ((_DWORD)v133 == 1)
  {
    v60 = &v135;
    v59 = 6;
    goto LABEL_154;
  }
  if ((_DWORD)v130 == 1)
  {
    v60 = &v132;
    v59 = 4;
    goto LABEL_154;
  }
  if ((_DWORD)v127 == 1)
  {
    v60 = &v129;
    if (v120)
      v59 = 6;
    else
      v59 = 5;
    goto LABEL_154;
  }
  v58 = 0;
  v59 = 0;
  v35 = 1;
LABEL_155:
  *(_QWORD *)v145 = 0xE00000001;
  v145[2] = v59;
  v145[3] = v58;
  if ((sysctl(v145, 4u, 0, &size, 0, 0) & 0x80000000) == 0)
  {
    v63 = malloc_type_malloc(size, 0x2F90465FuLL);
    v64 = 0;
    v65 = size;
    while (1)
    {
      size = v65;
      v66 = sysctl(v145, 4u, v63, &size, 0, 0);
      if ((v66 & 0x80000000) == 0)
        break;
      if (v64 > 0x3E7)
        goto LABEL_156;
      if (*__error() != 12 || sysctl(v145, 4u, 0, &size, 0, 0))
        goto LABEL_164;
      v63 = malloc_type_realloc(v63, size, 0xCCE25AB7uLL);
      v65 = size;
LABEL_165:
      ++v64;
    }
    if (!v66)
    {
      v67 = v34;
      v68 = size / 0x288;
      if ((int)(size / 0x288) >= 1)
      {
        qword_10000E150 = (uint64_t)malloc_type_calloc((size / 0x288), 0x1D8uLL, 0x10300409D75B528uLL);
        if (!qword_10000E150)
          sub_100007174(0);
        v71 = 0;
        if (v67)
          v81 = 1;
        else
          v81 = v35 == 0;
        v82 = v81;
        v83 = v63;
        while (1)
        {
          v84 = v83[10];
          if (v84 && (!v122 || v84 != v83[141]))
          {
            v85 = v136;
            if ((int)v136 >= 1)
            {
              v86 = (int *)v138;
              do
              {
                v87 = *v86++;
                if (v84 == v87)
                  goto LABEL_215;
              }
              while (--v85);
            }
            if (v120 || (v98 = v83[143], v98 != -1) && (v83[8] & 2) != 0 && devname(v98, 0x2000u))
            {
              if ((v82 & 1) != 0)
                goto LABEL_215;
              v99 = v142;
              if ((int)v142 >= 1)
              {
                v100 = v144;
                do
                {
                  v101 = *v100++;
                  if (v83[100] == v101)
                    goto LABEL_215;
                }
                while (--v99);
              }
              v102 = v139;
              if ((int)v139 >= 1)
              {
                v103 = v141;
                do
                {
                  v104 = *v103++;
                  if (v83[141] == v104)
                    goto LABEL_215;
                }
                while (--v102);
              }
              v105 = v133;
              if ((int)v133 >= 1)
              {
                v106 = (int *)v135;
                do
                {
                  v107 = *v106++;
                  if (v83[98] == v107)
                    goto LABEL_215;
                }
                while (--v105);
              }
              v108 = v130;
              if ((int)v130 >= 1)
              {
                v109 = (int *)v132;
                do
                {
                  v110 = *v109++;
                  if (v83[143] == v110)
                    goto LABEL_215;
                }
                while (--v108);
              }
              v111 = v127;
              if ((int)v127 >= 1)
              {
                v112 = (int *)v129;
                while (1)
                {
                  v113 = *v112++;
                  if (v83[105] == v113)
                    break;
                  if (!--v111)
                    goto LABEL_226;
                }
LABEL_215:
                v88 = qword_10000E150;
                v89 = qword_10000E150 + 472 * v71;
                *(_QWORD *)v89 = v83;
                sub_100006D9C(v89);
                if (byte_10000E158 == 1)
                {
                  v90 = v88 + 472 * v71;
                  *(_BYTE *)(v90 + 313) = 0;
                  v91 = strlen((const char *)(*(_QWORD *)v89 + 243));
                  v92 = (char *)malloc_type_malloc(v91 + 3, 0xD84D190FuLL);
                  *(_QWORD *)(v90 + 320) = v92;
                  strcpy(v92, (const char *)(*(_QWORD *)v89 + 243));
                  v93 = malloc_type_malloc(0xAuLL, 0xF0205827uLL);
                  *(_QWORD *)(v90 + 328) = v93;
                  *v93 = 0;
                }
                v94 = off_10000DEC0;
                if (off_10000DEC0)
                {
                  do
                  {
                    v95 = v94[2];
                    if ((*(_BYTE *)(v95 + 24) & 8) != 0)
                    {
                      v96 = (*(uint64_t (**)(uint64_t))(v95 + 40))(v89);
                      if (v96 <= *(__int16 *)(v95 + 48))
                        LOWORD(v96) = *(_WORD *)(v95 + 48);
                      else
                        *(_WORD *)(v95 + 48) = v96;
                      v97 = *(__int16 *)(v95 + 80);
                      if (v97 < (__int16)v96)
                        *(_WORD *)(v95 + 48) = v97;
                    }
                    v94 = (_QWORD *)*v94;
                  }
                  while (v94);
                }
                ++v71;
              }
            }
          }
LABEL_226:
          v83 += 162;
          v24 = (int)v68 <= 1;
          LODWORD(v68) = v68 - 1;
          if (v24)
            goto LABEL_174;
        }
      }
      v71 = 0;
LABEL_174:
      sub_100006AD0();
      sub_100003494();
      if (v71)
      {
        qsort((void *)qword_10000E150, v71, 0x1D8uLL, (int (__cdecl *)(const void *, const void *))sub_100006B3C);
        if (v71 <= 0)
        {
          v115 = (char *)qword_10000E150;
        }
        else
        {
          v72 = v71;
          v73 = 0;
          v74 = 0;
          v75 = v124 - 4;
          v76 = &aUserPidPpidPgi[37];
          v123 = v72;
          do
          {
            if (dword_10000E114)
            {
              v77 = v76;
              *((_DWORD *)v76 + 71) = 1;
              if (*(_DWORD *)(qword_10000E150 + 472 * v73 + 440))
              {
                v78 = 0;
                do
                {
                  dword_10000E118 = v78;
                  v79 = off_10000DEC0;
                  if (off_10000DEC0)
                  {
                    do
                    {
                      (*(void (**)(uint64_t, _QWORD *))(v79[2] + 32))(qword_10000E150 + 472 * v73, v79);
                      if (!*v79)
                        break;
                      putchar(32);
                      v79 = (_QWORD *)*v79;
                    }
                    while (v79);
                  }
                  putchar(10);
                  if (v124)
                  {
                    if (v74 == v75)
                    {
                      putchar(10);
                      sub_100003494();
                      v74 = 0;
                    }
                    else
                    {
                      ++v74;
                    }
                  }
                  ++v78;
                }
                while (v78 < *(_DWORD *)(qword_10000E150 + 472 * v73 + 440));
              }
              v76 = v77;
              *((_DWORD *)v77 + 71) = 0;
            }
            else
            {
              v80 = off_10000DEC0;
              if (off_10000DEC0)
              {
                do
                {
                  (*(void (**)(uint64_t, _QWORD *))(v80[2] + 32))(qword_10000E150 + 472 * v73, v80);
                  if (!*v80)
                    break;
                  putchar(32);
                  v80 = (_QWORD *)*v80;
                }
                while (v80);
              }
              putchar(10);
              if (v124)
              {
                if (v74 == v75)
                {
                  putchar(10);
                  sub_100003494();
                  v74 = 0;
                }
                else
                {
                  ++v74;
                }
              }
            }
            ++v73;
          }
          while (v73 != v123);
          v114 = 0;
          v115 = (char *)qword_10000E150;
          do
          {
            if (!*(_DWORD *)&v115[v114 + 436] && *(_DWORD *)&v115[v114 + 440])
              free(*(void **)&v115[v114 + 456]);
            v114 += 472;
          }
          while (472 * v123 != v114);
        }
        free(v63);
        free(v115);
        *(_QWORD *)((char *)&v142 + 4) = 0;
        LODWORD(v142) = 0;
        if (v144)
          free(v144);
        v143 = 0uLL;
        v144 = 0;
        DWORD2(v136) = 0;
        *(_QWORD *)&v136 = 0;
        if (v138)
          free(v138);
        v137 = 0uLL;
        v138 = 0;
        *(_QWORD *)((char *)&v139 + 4) = 0;
        LODWORD(v139) = 0;
        if (v141)
          free(v141);
        v140 = 0uLL;
        v141 = 0;
        DWORD2(v133) = 0;
        *(_QWORD *)&v133 = 0;
        if (v135)
          free(v135);
        v134 = 0uLL;
        v135 = 0;
        DWORD2(v130) = 0;
        *(_QWORD *)&v130 = 0;
        if (v132)
          free(v132);
        v131 = 0uLL;
        v132 = 0;
        DWORD2(v127) = 0;
        *(_QWORD *)&v127 = 0;
        if (v129)
          free(v129);
        v128 = 0uLL;
        v129 = 0;
        v116 = dword_10000E138;
        if (!dword_10000E138)
        {
          v117 = __stdoutp;
          if (ferror(__stdoutp) || fflush(v117))
            sub_100007188();
          v116 = dword_10000E138;
        }
        exit(v116);
      }
LABEL_175:
      exit(1);
    }
LABEL_164:
    sleep(1u);
    goto LABEL_165;
  }
LABEL_156:
  perror("Failure calling sysctl");
  return 0;
}

uint64_t sub_1000062B8(uint64_t a1, char *__s)
{
  unint64_t v4;
  BOOL v5;
  group *v6;
  int v7;
  gid_t gr_gid;
  uint64_t v9;
  uint64_t result;
  char *__endptr;

  if (!*__s)
  {
    warnx("Invalid (zero-length) %s name");
LABEL_17:
    result = 0;
    byte_10000E148 = 1;
    return result;
  }
  if (strlen(__s) > 0xFE)
  {
    warnx("%s name too long: %s");
    goto LABEL_17;
  }
  __endptr = 0;
  *__error() = 0;
  v4 = strtoul(__s, &__endptr, 10);
  if (*__error() || (!*__endptr ? (v5 = v4 >> 31 == 0) : (v5 = 0), !v5 || (v6 = getgrgid(v4)) == 0))
  {
    v6 = getgrnam(__s);
    if (!v6)
    {
      warnx("No %s %s '%s'");
      goto LABEL_17;
    }
  }
  v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006C00(a1);
    v7 = *(_DWORD *)a1;
  }
  gr_gid = v6->gr_gid;
  v9 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)a1 = v7 + 1;
  *(_DWORD *)(v9 + 4 * v7) = gr_gid;
  return 1;
}

uint64_t sub_1000063FC(uint64_t a1, const char *a2)
{
  unint64_t v4;
  const char *v5;
  BOOL v6;
  int v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  char *__endptr;

  if (*a2)
  {
    __endptr = 0;
    *__error() = 0;
    v4 = strtol(a2, &__endptr, 10);
    v5 = "Invalid %s: %s";
    v6 = __endptr != a2 && *__endptr == 0;
    if (!v6 || (v4 & 0x8000000000000000) != 0 || (v7 = *__error(), v5 = "%s too large: %s", v7) || v4 >> 5 >= 0xC35)
    {
      warnx(v5, *(_QWORD *)(a1 + 24), a2);
      *__error() = 34;
    }
    if (*__error() == 34)
    {
      result = 0;
      byte_10000E148 = 1;
    }
    else
    {
      v9 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
      {
        sub_100006C00(a1);
        v9 = *(_DWORD *)a1;
      }
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)a1 = v9 + 1;
      *(_DWORD *)(v10 + 4 * v9) = v4;
      return 1;
    }
  }
  else
  {
    sub_1000071B4();
    return 0;
  }
  return result;
}

uint64_t sub_10000650C(uint64_t a1, char *__s)
{
  passwd *v4;
  unint64_t v5;
  const char *v6;
  int v7;
  uid_t pw_uid;
  uint64_t v9;
  uint64_t result;
  char *__endptr;

  if (!*__s)
  {
    warnx("Invalid (zero-length) %s name");
    goto LABEL_17;
  }
  if (strlen(__s) > 0xFE)
  {
    warnx("%s name too long: %s");
    goto LABEL_17;
  }
  v4 = getpwnam(__s);
  if (!v4)
  {
    __endptr = 0;
    *__error() = 0;
    v5 = strtoul(__s, &__endptr, 10);
    if (*__error())
    {
      v6 = "No %s named '%s'";
    }
    else
    {
      v6 = "No %s named '%s'";
      if (!*__endptr && !(v5 >> 31))
      {
        v4 = getpwuid(v5);
        if (v4)
          goto LABEL_8;
        v6 = "No %s name or ID matches '%s'";
      }
    }
    warnx(v6, *(_QWORD *)(a1 + 24), __s);
LABEL_17:
    result = 0;
    byte_10000E148 = 1;
    return result;
  }
LABEL_8:
  v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006C00(a1);
    v7 = *(_DWORD *)a1;
  }
  pw_uid = v4->pw_uid;
  v9 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)a1 = v7 + 1;
  *(_DWORD *)(v9 + 4 * v7) = pw_uid;
  return 1;
}

uint64_t sub_100006648(uint64_t a1, char *__s1)
{
  const char *v2;
  int v4;
  int v6;
  dev_t st_rdev;
  uint64_t v8;
  uint64_t result;
  stat v10;
  char v11[774];
  _BYTE v12[1014];

  v2 = __s1;
  memset(&v10, 0, sizeof(v10));
  v11[0] = 0;
  v4 = *__s1;
  if (v4 != 47)
  {
    if (v4 == 99 && !strcmp(__s1, "co"))
    {
      v2 = "/dev/console";
    }
    else
    {
      __strlcpy_chk(v12, "/dev/", 1024, 1024);
      __strlcat_chk(v12, v2, 1024, 1024);
      if (*(_QWORD *)v12 != 0x7974742F7665642FLL
        && (*(_QWORD *)v12 != 0x6E6F632F7665642FLL || *(_QWORD *)&v12[5] != 0x656C6F736E6F63))
      {
        __strlcpy_chk(v11, "/dev/tty", 1024, 1024);
        __strlcat_chk(v11, v2, 1024, 1024);
        if (!stat(v11, &v10) && (v10.st_mode & 0xF000) == 0x2000)
          goto LABEL_15;
      }
      v2 = v12;
    }
  }
  if (access(v2, 0) == -1 || stat(v2, &v10) == -1)
  {
    if (v11[0])
      warn("%s and %s");
    else
      warn("%s");
    goto LABEL_27;
  }
  if ((v10.st_mode & 0xF000) != 0x2000)
  {
    if (v11[0])
      warnx("%s and %s: Not a terminal");
    else
      warnx("%s: Not a terminal");
LABEL_27:
    result = 0;
    byte_10000E148 = 1;
    return result;
  }
LABEL_15:
  v6 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006C00(a1);
    v6 = *(_DWORD *)a1;
  }
  st_rdev = v10.st_rdev;
  v8 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)a1 = v6 + 1;
  *(_DWORD *)(v8 + 4 * v6) = st_rdev;
  return 1;
}

void sub_10000689C(uint64_t a1, const char *a2)
{
  const char *v2;
  int v4;
  int v5;
  _BYTE *v6;
  char v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  const char *v11;
  int v12;
  _BYTE v13[1024];

  v2 = a2;
  LOBYTE(v4) = *a2;
  if (*a2 || ((*(void (**)(uint64_t, _BYTE *))(a1 + 16))(a1, v13), (LOBYTE(v4) = *v2) != 0))
  {
    while (1)
    {
      if (memchr(" \t", (char)v4, 3uLL))
      {
        v5 = *(unsigned __int8 *)++v2;
        LOBYTE(v4) = v5;
        if (!v5)
          goto LABEL_7;
      }
      else
      {
        if (v4 != 44)
        {
          v9 = 0;
          do
          {
            v10 = v9;
            if (memchr(" \t,", (char)v4, 4uLL))
            {
              v6 = &v13[v10];
              v2 += v10;
              goto LABEL_8;
            }
            v9 = v10 + 1;
            v13[v10] = v4;
            v4 = v2[v10 + 1];
          }
          while (v2[v10 + 1] && v10 < 0x3FF);
          v11 = &v2[v9];
          if (v10 < 0x3FF)
          {
            v6 = &v13[v9];
            v2 = v11;
            goto LABEL_8;
          }
          while (v4 && !memchr(" \t,", (char)v4, 4uLL))
          {
            v12 = *(unsigned __int8 *)++v11;
            v4 = v12;
          }
          warnx("Value too long: %.*s", (_DWORD)v11 - (_DWORD)v2, v2);
          byte_10000E148 = 1;
          v2 = v11;
          goto LABEL_9;
        }
LABEL_7:
        v6 = v13;
LABEL_8:
        *v6 = 0;
        (*(void (**)(uint64_t, _BYTE *))(a1 + 16))(a1, v13);
LABEL_9:
        v7 = *v2;
        if (*v2)
        {
          do
          {
            if (!memchr(" \t", v7, 3uLL))
              break;
            v8 = *(unsigned __int8 *)++v2;
            v7 = v8;
          }
          while (v8);
        }
        if (v7 == 44)
          ++v2;
        LOBYTE(v4) = *v2;
        if (!*v2)
          return;
      }
    }
  }
}

void sub_100006A68(int a1)
{
  const char *v1;

  v1 = "          [-g grp[,grp...]] [-u [uid,uid...]]";
  if (!a1)
    v1 = "          [-u]";
  fprintf(__stderrp, "%s\n%s\n%s\n%s\n", "usage: ps [-AaCcEefhjlMmrSTvwXx] [-O fmt | -o fmt] [-G gid[,gid...]]", v1, "          [-p pid[,pid...]] [-t tty[,tty...]] [-U user[,user...]]", "       ps [-L]");
  exit(1);
}

void sub_100006AD0()
{
  int v0;
  void *i;
  uint64_t v2;
  int v3;
  int v4;

  v0 = dword_10000E13C;
  for (i = off_10000DEC0; i; i = *(void **)i)
  {
    v2 = *((_QWORD *)i + 2);
    v3 = strlen(*((const char **)i + 1));
    v4 = *(__int16 *)(v2 + 48);
    if (v4 < v3)
    {
      *(_WORD *)(v2 + 48) = v3;
      v4 = (__int16)v3;
    }
    v0 += v4 + 1;
    dword_10000E13C = v0;
  }
  dword_10000E13C = v0 - 1;
}

uint64_t sub_100006B3C(_DWORD *a1, _DWORD *a2)
{
  int v3;
  uint64_t result;
  int v5;
  int v6;
  int v7;
  int v8;

  if (dword_10000E14C == 1)
  {
    v5 = a2[93];
    v6 = a1[93];
    return (v5 - v6);
  }
  if (dword_10000E14C == 2)
  {
    v3 = sub_100004BEC((uint64_t)a2);
    return v3 - sub_100004BEC((uint64_t)a1);
  }
  v7 = *(_DWORD *)(*(_QWORD *)a1 + 572);
  v8 = *(_DWORD *)(*(_QWORD *)a2 + 572);
  result = (v7 - v8);
  if (v7 == v8)
  {
    v5 = *(_DWORD *)(*(_QWORD *)a1 + 40);
    v6 = *(_DWORD *)(*(_QWORD *)a2 + 40);
    return (v5 - v6);
  }
  return result;
}

_UNKNOWN **sub_100006BBC(const char **a1)
{
  _UNKNOWN **v2;

  v2 = &off_10000DEC0;
  do
    v2 = (_UNKNOWN **)*v2;
  while (v2 && strcmp(*(const char **)v2[2], *a1));
  return v2;
}

void *sub_100006C00(uint64_t a1)
{
  int v2;
  void *result;

  v2 = 2 * *(_DWORD *)(a1 + 4) + 2;
  result = malloc_type_realloc(*(void **)(a1 + 32), *(int *)(a1 + 8) * (uint64_t)v2, 0x7061BF9AuLL);
  if (!result)
  {
    free(*(void **)(a1 + 32));
    errx(1, "realloc to %d %ss failed", v2, *(const char **)(a1 + 24));
  }
  *(_DWORD *)(a1 + 4) = v2;
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void sub_100006C74(uint64_t a1, const char *a2)
{
  errx(1, a2);
}

uint64_t sub_100006C7C(uint64_t result, uint64_t a2)
{
  switch((int)result)
  {
    case 1:
      return result;
    case 2:
      result = 5;
      break;
    case 3:
      if (a2 <= 20)
        result = 3;
      else
        result = 4;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 6;
      break;
    default:
      result = 7;
      break;
  }
  return result;
}

uint64_t sub_100006CD0(uint64_t a1, thread_inspect_t target_act, int a3, thread_info_t thread_info_out)
{
  uint64_t result;
  integer_t v7;
  integer_t v8;
  thread_inspect_t v9;
  thread_flavor_t v10;
  mach_msg_type_number_t thread_info_outCnt;

  if (a3 == 4)
  {
    thread_info_outCnt = 4;
    v9 = target_act;
    v10 = 12;
LABEL_8:
    result = thread_info(v9, v10, thread_info_out, &thread_info_outCnt);
    if ((_DWORD)result)
      return result;
    v7 = *(_DWORD *)(a1 + 348);
    v8 = thread_info_out[1];
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    thread_info_outCnt = 5;
    v9 = target_act;
    v10 = 11;
    goto LABEL_8;
  }
  if (a3 != 1)
    return 5;
  thread_info_outCnt = 5;
  result = thread_info(target_act, 0xAu, thread_info_out, &thread_info_outCnt);
  if ((_DWORD)result)
    return result;
  v7 = *(_DWORD *)(a1 + 348);
  v8 = thread_info_out[2];
LABEL_10:
  result = 0;
  if (v7 < v8)
    *(_DWORD *)(a1 + 348) = v8;
  return result;
}

uint64_t sub_100006D9C(uint64_t a1)
{
  vm_map_read_t *v2;
  uint64_t result;
  unint64_t v4;
  int v5;
  int v6;
  task_name_t v7;
  integer_t *v8;
  task_flavor_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  vm_size_t v18;
  mach_port_t object_name;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[4];
  __int128 v23;
  int v24;
  mach_msg_type_number_t thread_info_outCnt;
  mach_msg_type_number_t task_info_outCnt;

  thread_info_outCnt = 10;
  *(_DWORD *)(a1 + 340) = 7;
  v2 = (vm_map_read_t *)(a1 + 336);
  if (task_read_for_pid(mach_task_self_, *(unsigned int *)(*(_QWORD *)a1 + 40), a1 + 336))
    return 1;
  task_info_outCnt = 10;
  if (task_info(*(_DWORD *)(a1 + 336), 0x12u, (task_info_t)(a1 + 360), &task_info_outCnt))
    goto LABEL_6;
  v24 = 0;
  *(_OWORD *)info = 0u;
  v23 = 0u;
  size = 0;
  address = 2415919104;
  object_name = 0;
  task_info_outCnt = 9;
  if (!mach_vm_region(*v2, &address, &size, 10, info, &task_info_outCnt, &object_name))
  {
    if ((_DWORD)v23)
    {
      if (size == 0x10000000)
      {
        v4 = *(_QWORD *)(a1 + 364);
        if (v4 >= 0x20000001)
          *(_QWORD *)(a1 + 364) = v4 - 0x20000000;
      }
    }
  }
  task_info_outCnt = 4;
  if (task_info(*(_DWORD *)(a1 + 336), 3u, (task_info_t)(a1 + 400), &task_info_outCnt))
    goto LABEL_6;
  v5 = *(_DWORD *)(a1 + 396);
  switch(v5)
  {
    case 4:
      task_info_outCnt = 4;
      v7 = *(_DWORD *)(a1 + 336);
      v8 = (integer_t *)(a1 + 416);
      v9 = 12;
      goto LABEL_18;
    case 2:
      task_info_outCnt = 5;
      v7 = *(_DWORD *)(a1 + 336);
      v8 = (integer_t *)(a1 + 416);
      v9 = 11;
LABEL_18:
      if (!task_info(v7, v9, v8, &task_info_outCnt))
      {
        v6 = *(_DWORD *)(a1 + 420);
        *(_DWORD *)(a1 + 348) = v6;
        goto LABEL_20;
      }
LABEL_6:
      result = 1;
      *(_DWORD *)(a1 + 436) = 1;
      return result;
    case 1:
      task_info_outCnt = 5;
      if (!task_info(*(_DWORD *)(a1 + 336), 0xAu, (task_info_t)(a1 + 416), &task_info_outCnt))
      {
        *(_DWORD *)(a1 + 348) = *(_DWORD *)(a1 + 424);
        v6 = *(_DWORD *)(a1 + 420);
LABEL_20:
        *(_DWORD *)(a1 + 352) = v6;
        break;
      }
      goto LABEL_6;
  }
  *(_DWORD *)(a1 + 436) = 0;
  *(_DWORD *)(a1 + 344) = 0;
  if (task_threads(*(_DWORD *)(a1 + 336), (thread_act_array_t *)(a1 + 448), (mach_msg_type_number_t *)(a1 + 440)))
  {
    mach_port_deallocate(mach_task_self_, *v2);
    return 1;
  }
  *(_DWORD *)(a1 + 356) = 1;
  *(_QWORD *)(a1 + 456) = malloc_type_calloc(*(unsigned int *)(a1 + 440), 0x3CuLL, 0x1000040C2DCA394uLL);
  if (*(_DWORD *)(a1 + 440))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      thread_info_outCnt = 10;
      v13 = thread_info(*(_DWORD *)(*(_QWORD *)(a1 + 448) + 4 * v11), 3u, (thread_info_t)(*(_QWORD *)(a1 + 456) + v10), &thread_info_outCnt);
      v14 = *(_QWORD *)(a1 + 456);
      if (v13)
        v12 = 1;
      else
        *(_DWORD *)(a1 + 344) += *(_DWORD *)(v14 + v10 + 16);
      if (sub_100006CD0(a1, *(_DWORD *)(*(_QWORD *)(a1 + 448) + 4 * v11), *(_DWORD *)(v14 + v10 + 20), (thread_info_t)(v14 + v10 + 40)))v12 = 1;
      v15 = *(_QWORD *)(a1 + 456);
      v16 = *(_DWORD *)(v15 + v10 + 24);
      switch(v16)
      {
        case 1:
          break;
        case 2:
          v16 = 5;
          break;
        case 3:
          if (*(int *)(v15 + v10 + 36) <= 20)
            v16 = 3;
          else
            v16 = 4;
          break;
        case 4:
          v16 = 2;
          break;
        case 5:
          v16 = 6;
          break;
        default:
          v16 = 7;
          break;
      }
      if (v16 < *(_DWORD *)(a1 + 340))
        *(_DWORD *)(a1 + 340) = v16;
      if ((*(_BYTE *)(v15 + v10 + 28) & 1) == 0)
        *(_DWORD *)(a1 + 356) = 0;
      mach_port_deallocate(mach_task_self_, *(_DWORD *)(*(_QWORD *)(a1 + 448) + 4 * v11++));
      v17 = *(unsigned int *)(a1 + 440);
      v10 += 60;
    }
    while (v11 < v17);
    v18 = 4 * v17;
  }
  else
  {
    v12 = 0;
    v18 = 0;
  }
  *(_DWORD *)(a1 + 464) = v12;
  vm_deallocate(mach_task_self_, *(_QWORD *)(a1 + 448), v18);
  mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 336));
  return 0;
}

void sub_100007128()
{
  warnx("no valid keywords; valid keywords:");
  sub_100003054();
  exit(1);
}

void sub_100007148()
{
  errx(1, "malloc failed");
}

void sub_100007160()
{
  err(1, 0);
}

void sub_100007174(uint64_t a1)
{
  sub_100006C74(a1, "malloc failed");
}

void sub_100007188()
{
  err(1, "stdout");
}

void sub_1000071A0(uint64_t a1)
{
  sub_100006C74(a1, "stdin: not a terminal");
}

void sub_1000071B4()
{
  warnx("Invalid (zero-length) process id");
  byte_10000E148 = 1;
}
