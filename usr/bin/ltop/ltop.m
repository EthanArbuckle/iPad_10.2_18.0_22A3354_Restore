uint64_t start(int a1, char **a2)
{
  int *v4;
  int v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  FILE *v49;
  const char *v50;
  size_t v51;
  int v52;
  int v53;
  size_t v54;
  int v55[4];
  __int128 v56;
  __int128 v57;

  qword_100008040 = (uint64_t)*a2;
  v4 = &dword_100008000;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v5 = getopt(a1, a2, "g:hdLp:r:");
        if (v5 <= 103)
          break;
        switch(v5)
        {
          case 'p':
            dword_100008000 = atoi(optarg);
            break;
          case 'r':
            qword_100008010 = (uint64_t)optarg;
            break;
          case 'h':
            sub_1000037DC();
            goto LABEL_115;
          default:
LABEL_117:
            sub_1000037DC();
LABEL_110:
            exit(1);
        }
      }
      if (v5 <= 102)
        break;
      qword_100008008 = (uint64_t)optarg;
    }
    if (v5 != 100)
      break;
    dword_100008018 = 1;
  }
  if (v5 != -1)
  {
    if (v5 == 76)
    {
      sub_10000380C();
      sub_1000038FC();
LABEL_115:
      exit(0);
    }
    goto LABEL_117;
  }
  if (optind == a1)
    v52 = 0;
  else
    v52 = atoi(a2[optind]);
  v6 = (const char *)qword_100008008;
  v7 = (const char *)qword_100008010;
  if (qword_100008008 && qword_100008010)
  {
    v49 = __stderrp;
    v50 = "Cannot specify both a resource and a group\n";
    v51 = 43;
LABEL_109:
    fwrite(v50, v51, 1uLL, v49);
    goto LABEL_110;
  }
  if (qword_100008008)
  {
    if (!qword_100008028)
    {
      sub_10000380C();
      v6 = (const char *)qword_100008008;
    }
    v8 = dword_100008030;
    if (dword_100008030 < 1)
    {
LABEL_24:
      fprintf(__stderrp, "No such group: %s\n");
      goto LABEL_110;
    }
    v9 = (const char *)(qword_100008028 + 32);
    while (strcmp(v6, v9))
    {
      v9 += 96;
      if (!--v8)
        goto LABEL_24;
    }
    v7 = (const char *)qword_100008010;
  }
  if (!v7)
    goto LABEL_34;
  if (!qword_100008028)
  {
    sub_10000380C();
    v7 = (const char *)qword_100008010;
  }
  v10 = dword_100008030;
  if (dword_100008030 < 1)
  {
LABEL_33:
    fprintf(__stderrp, "No such resource: %s\n");
    goto LABEL_110;
  }
  v11 = (const char *)qword_100008028;
  while (strcmp(v7, v11))
  {
    v11 += 96;
    if (!--v10)
      goto LABEL_33;
  }
  do
  {
LABEL_34:
    sub_10000380C();
    if (*v4 < 0)
    {
      *(_QWORD *)v55 = 0x600000001;
      v53 = 0;
      v54 = 4;
      if (sysctl(v55, 2u, &v53, &v54, 0, 0) < 0)
        sub_100003B90();
      v12 = v53;
    }
    else
    {
      v12 = 1;
    }
    v13 = (unsigned int *)malloc_type_malloc(4 * v12, 0xD6C55D12uLL);
    if (!v13)
      sub_100003BA8();
    v14 = v13;
    v15 = v13;
    if (*v4 < 0)
    {
      v16 = proc_listallpids(v13, 4 * v12);
      if ((v16 & 0x80000000) != 0)
        sub_100003BC0();
      v12 = v16;
      qsort(v15, v16, 4uLL, (int (__cdecl *)(const void *, const void *))sub_100003A24);
    }
    else
    {
      *v13 = *v4;
    }
    if (v12 >= 1)
    {
      v17 = 0;
      v18 = v12;
      do
      {
        v19 = v15[v17];
        if ((v19 & 0x80000000) == 0)
        {
          v56 = 0u;
          v57 = 0u;
          *(_OWORD *)v55 = 0u;
          *__error() = 0;
          if ((ledger(0, v19, v55, 0) & 0x80000000) != 0)
          {
            if (*__error() != 2 && *__error() != 3)
              sub_100003BD8();
          }
          else
          {
            v20 = qword_100008038;
            if (qword_100008038)
            {
              while ((_QWORD)v57 != *(_QWORD *)v20)
              {
                v20 = *(_QWORD *)(v20 + 40);
                if (!v20)
                  goto LABEL_50;
              }
              v22 = *(_QWORD *)(v20 + 16);
            }
            else
            {
LABEL_50:
              v21 = malloc_type_malloc(0x30uLL, 0x10200406083FE87uLL);
              if (!v21)
              {
                v49 = __stderrp;
                v50 = "Out of memory";
                v51 = 13;
                goto LABEL_109;
              }
              v20 = (uint64_t)v21;
              *(_QWORD *)v21 = v57;
              v22 = *((_QWORD *)&v57 + 1);
              v23 = qword_100008038;
              v21[2] = 0;
              *((_QWORD *)v21 + 2) = v22;
              *((_QWORD *)v21 + 3) = 0;
              *((_QWORD *)v21 + 4) = 0;
              *((_QWORD *)v21 + 5) = v23;
              qword_100008038 = (uint64_t)v21;
            }
            if (v22 >= dword_100008030)
              v22 = dword_100008030;
            v54 = v22;
            v24 = malloc_type_malloc(56 * v22, 0x49E4006AuLL);
            if ((ledger(1, v19, v24, &v54) & 0x80000000) != 0)
              sub_100003BD8();
            *(_QWORD *)(v20 + 24) = v24;
            *(_DWORD *)(v20 + 8) = 1;
            v25 = qword_100008020;
            if (qword_100008020)
            {
              while (*(_DWORD *)v25 != (_DWORD)v19)
              {
                v25 = *(_QWORD *)(v25 + 48);
                if (!v25)
                  goto LABEL_62;
              }
            }
            else
            {
LABEL_62:
              v26 = (char *)malloc_type_malloc(0x38uLL, 0x1020040D8E0519AuLL);
              if (!v26)
              {
                v49 = __stderrp;
                v50 = "Out of memory\n";
                v51 = 14;
                goto LABEL_109;
              }
              v25 = (uint64_t)v26;
              v27 = v26 + 8;
              if (!proc_name(v19, v26 + 8, 0x20u))
                __strlcpy_chk(v27, "Error", 32, 32);
              *(_DWORD *)v25 = v19;
              v28 = qword_100008020;
              *(_QWORD *)(v25 + 40) = v20;
              *(_QWORD *)(v25 + 48) = v28;
              qword_100008020 = v25;
            }
            *(_DWORD *)(v25 + 4) = 1;
            v15 = v14;
          }
        }
        ++v17;
      }
      while (v17 != v18);
    }
    free(v15);
    printf("\n%5s %32s %32s %10s  %10s  %10s  %10s  %10s \n", "PID", "COMMAND", "RESOURCE", "CREDITS", "DEBITS", "BALANCE", "LIMIT", "PERIOD");
    v29 = qword_100008020;
    if (!qword_100008020)
      goto LABEL_115;
    v30 = 0;
    do
    {
      while (1)
      {
        if (!*(_DWORD *)(v29 + 4))
          goto LABEL_87;
        printf("%5d %32s ", *(_DWORD *)v29, (const char *)(v29 + 8));
        v31 = *(uint64_t **)(v29 + 40);
        if (v31[2] >= 1)
          break;
        v30 = 0;
        v29 = *(_QWORD *)(v29 + 48);
        if (!v29)
          goto LABEL_115;
      }
      v32 = 0;
      v33 = 0;
      v30 = 0;
      v34 = v31[4];
      v35 = (const char *)qword_100008008;
      v36 = (uint64_t *)(v31[3] + 16);
      v37 = (_QWORD *)(v34 + 8);
      do
      {
        if ((!v35 || !strcmp(v35, (const char *)(qword_100008028 + v32 + 32)))
          && (!qword_100008010 || !strcmp((const char *)qword_100008010, (const char *)(qword_100008028 + v32))))
        {
          if (v30)
            printf("%5s %32s ", "", "");
          printf("%32s ", (const char *)(qword_100008028 + v32));
          v38 = *(v36 - 1);
          if (v34)
          {
            sub_100003A34(v38, v38 - *v37);
            sub_100003A34(*v36, *v36 - v37[1]);
            v39 = *(v36 - 2);
            v40 = v39 - *(v37 - 1);
          }
          else
          {
            sub_100003A34(v38, 0);
            sub_100003A34(*v36, 0);
            v40 = 0;
            v39 = *(v36 - 2);
          }
          sub_100003A34(v39, v40);
          v41 = v36[1];
          if (v41 == 0x7FFFFFFFFFFFFFFFLL)
          {
            printf("%10s  %10s", "none", "-");
          }
          else
          {
            sub_100003A34(v41, 0);
            sub_100003A34(v36[2], 0);
          }
          ++v30;
          putchar(10);
          v35 = (const char *)qword_100008008;
          v31 = *(uint64_t **)(v29 + 40);
        }
        ++v33;
        v32 += 96;
        v36 += 7;
        v37 += 7;
      }
      while (v31[2] > v33);
LABEL_87:
      v29 = *(_QWORD *)(v29 + 48);
    }
    while (v29);
    if (!v30)
      goto LABEL_115;
    v42 = qword_100008020;
    v4 = &dword_100008000;
    if (qword_100008020)
    {
      do
      {
        v43 = *(_QWORD *)(v42 + 48);
        if (*(_DWORD *)(v42 + 4))
        {
          *(_DWORD *)(v42 + 4) = 0;
        }
        else
        {
          qword_100008020 = *(_QWORD *)(v42 + 48);
          free((void *)v42);
        }
        v42 = v43;
      }
      while (v43);
    }
    v44 = qword_100008038;
    if (qword_100008038)
    {
      do
      {
        v45 = *(_QWORD *)(v44 + 40);
        if (*(_DWORD *)(v44 + 8))
        {
          *(_DWORD *)(v44 + 8) = 0;
          free(*(void **)(v44 + 32));
          v46 = *(_QWORD *)(v44 + 24);
          *(_QWORD *)(v44 + 24) = 0;
          *(_QWORD *)(v44 + 32) = v46;
        }
        else
        {
          qword_100008038 = *(_QWORD *)(v44 + 40);
          free(*(void **)(v44 + 24));
          v47 = *(void **)(v44 + 32);
          if (v47)
            free(v47);
          free((void *)v44);
        }
        v44 = v45;
      }
      while (v45);
    }
    free((void *)qword_100008028);
    qword_100008028 = 0;
    sleep(v52);
  }
  while (v52);
  return 0;
}

uint64_t sub_1000037DC()
{
  return printf("%s [-hdL] [-g group] [-p pid] [-r resource] [interval]\n", (const char *)qword_100008040);
}

uint64_t sub_10000380C()
{
  void *v0;
  void *v1;
  uint64_t result;
  int v3;
  int v4;

  v4 = dword_100008030 + 5;
  v0 = malloc_type_malloc(96 * (dword_100008030 + 5), 0x1000040565EDBD2uLL);
  if (!v0)
  {
LABEL_6:
    fwrite("Out of memory\n", 0xEuLL, 1uLL, __stderrp);
    exit(1);
  }
  v1 = v0;
  while (1)
  {
    result = ledger(2, v1, &v4, 0);
    if ((result & 0x80000000) != 0)
      sub_100003BF0();
    v3 = dword_100008030 + 5;
    dword_100008030 = v4;
    if (v4 != v3)
      break;
    free(v1);
    v4 = dword_100008030 + 5;
    v1 = malloc_type_malloc(96 * (dword_100008030 + 5), 0x1000040565EDBD2uLL);
    if (!v1)
      goto LABEL_6;
  }
  qword_100008028 = (uint64_t)v1;
  return result;
}

uint64_t sub_1000038FC()
{
  uint64_t result;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  int v6;
  uint64_t v7;

  puts("Resources being tracked:");
  result = printf("\t%10s  %15s  %8s\n", "GROUP", "RESOURCE", "UNITS");
  v1 = dword_100008030;
  if (dword_100008030 >= 1)
  {
    v2 = 0;
    v3 = 0;
    v4 = qword_100008028;
    do
    {
      if (*(_BYTE *)(v4 + 96 * v3) && v3 < v1)
      {
        v5 = (const char *)(v4 + 96 * v3 + 32);
        v6 = v3;
        v7 = v2;
        do
        {
          result = strcmp((const char *)(v4 + v7 + 32), v5);
          if (!(_DWORD)result)
          {
            result = printf("\t%10s  %15s  %8s\n", (const char *)(v4 + v7 + 32), (const char *)(v4 + v7), (const char *)(v4 + v7 + 64));
            *(_BYTE *)(qword_100008028 + v7) = 0;
            v4 = qword_100008028;
            v1 = dword_100008030;
          }
          v7 += 96;
          ++v6;
        }
        while (v1 > v6);
      }
      ++v3;
      v2 += 96;
    }
    while (v3 < v1);
  }
  return result;
}

uint64_t sub_100003A24(_DWORD *a1, _DWORD *a2)
{
  return (*a2 - *a1);
}

uint64_t sub_100003A34(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  const char *v5;
  const char *v6;

  if (dword_100008018)
    a1 = a2;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    return printf("%10s  ");
  if (a1 >= 0)
    v4 = a1;
  else
    v4 = -a1;
  v5 = "";
  if (v4 >= 0x186A1)
    v5 = "K";
  if (v4 >= 0x989681)
    v5 = "M";
  if (v4 >= 0x2540BE401)
    v6 = "G";
  else
    v6 = v5;
  strlen(v6);
  return printf("%*lld%s%c ");
}

void sub_100003B88()
{
  exit(1);
}

void sub_100003B90()
{
  perror("Failed to get max proc count");
  sub_100003B88();
}

void sub_100003BA8()
{
  perror("can't allocate memory for proc buffer\n");
  sub_100003B88();
}

void sub_100003BC0()
{
  perror("failed to get list of active pids");
  sub_100003B88();
}

void sub_100003BD8()
{
  perror("ledger_info() failed: ");
  sub_100003B88();
}

void sub_100003BF0()
{
  perror("ledger() system call failed");
  sub_100003B88();
}
