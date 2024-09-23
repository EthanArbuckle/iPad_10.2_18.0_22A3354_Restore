uint64_t start()
{
  uint64_t v0;
  const char *v1;
  int v2;
  FILE *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  int v7;
  FILE *v8;
  int v9;
  int v10;
  int v11;
  int *v12;
  int v13;
  int v14;
  int *v15;
  int v16;
  int v17;
  FILE *v18;
  int v19;
  int *v20;
  char *v21;
  int v22;
  const __CFDictionary *v23;
  io_service_t MatchingService;
  io_object_t v25;
  kern_return_t v26;
  int v27;
  kern_return_t v28;
  int v29;
  int v30;
  int v31;
  FILE *v32;
  int v33;
  int *v34;
  char *v35;
  int v36;
  int v38;
  int v39;
  size_t v40;
  size_t v41;
  size_t v42;
  ssize_t v43;
  char *v44;
  char *v45;
  size_t v46;
  size_t outputStructCnt;
  char __str[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v0 = 0;
  v46 = 8;
  outputStructCnt = 0;
  do
  {
    v1 = (&off_1000040C8)[v0];
    v2 = sysctlbyname(v1, &outputStructCnt, &v46, 0, 0);
    v3 = __stderrp;
    if (v2)
    {
      v10 = v2;
      v11 = *__error();
      v12 = __error();
      v44 = strerror(*v12);
      fprintf(v3, "%s: (%d) (%d) %s\n", v1, v10, v11, v44);
LABEL_12:
      v9 = 4;
      goto LABEL_13;
    }
    fprintf(__stderrp, "%s: %llu\n", v1, outputStructCnt);
    ++v0;
  }
  while (v0 != 4);
  v4 = 0;
  v5 = 0uLL;
  while (2)
  {
    v6 = 0;
    v62 = v5;
    v63 = v5;
    v60 = v5;
    v61 = v5;
    v58 = v5;
    v59 = v5;
    v56 = v5;
    v57 = v5;
    v54 = v5;
    v55 = v5;
    v52 = v5;
    v53 = v5;
    v50 = v5;
    v51 = v5;
    *(_OWORD *)__str = v5;
    v49 = v5;
    do
    {
      snprintf(__str, 0x100uLL, "kern.prng.pool%zu.%s", v4, (&off_1000040E8)[v6]);
      v7 = sysctlbyname(__str, &outputStructCnt, &v46, 0, 0);
      v8 = __stderrp;
      if (v7)
      {
        v13 = v7;
        v14 = *__error();
        v15 = __error();
        v45 = strerror(*v15);
        fprintf(v8, "%s: (%d) (%d) %s\n", __str, v13, v14, v45);
        goto LABEL_12;
      }
      fprintf(__stderrp, "%s: %llu\n", __str, outputStructCnt);
      ++v6;
    }
    while (v6 != 3);
    v9 = 0;
    ++v4;
    v5 = 0uLL;
    if (v4 != 32)
      continue;
    break;
  }
LABEL_13:
  v16 = sub_100003B98();
  if (v16)
  {
    v17 = v16;
    v18 = __stderrp;
    v19 = *__error();
    v20 = __error();
    v21 = strerror(*v20);
    fprintf(v18, "failed to load kernel prng seed: (%d) (%d) %s\n", v17, v19, v21);
    v22 = 1;
  }
  else
  {
    v22 = 0;
  }
  v23 = IOServiceMatching("AppleVirtIOEntropy");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v23);
  if (!MatchingService)
  {
    v27 = -147;
    v26 = -536870212;
    goto LABEL_23;
  }
  v25 = MatchingService;
  LODWORD(v46) = 0;
  v26 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&v46);
  IOObjectRelease(v25);
  if (v26)
  {
    printf("ServiceOpen failed %x\n", v26);
    v27 = -148;
LABEL_23:
    printf("failed to load virtual random: (%d) (%d)\n", v27, v26);
    v29 = 8;
    goto LABEL_24;
  }
  *(_OWORD *)__str = 0u;
  v49 = 0u;
  outputStructCnt = 32;
  v28 = IOConnectCallStructMethod(v46, 0, 0, 0, __str, &outputStructCnt);
  v26 = v28;
  if (v28)
  {
    printf("CallStructMethod failed %x\n", v28);
    v27 = -149;
LABEL_22:
    IOServiceClose(v46);
    goto LABEL_23;
  }
  v38 = open("/dev/random", 1);
  if (v38 == -1)
  {
    v27 = -82;
    goto LABEL_22;
  }
  v39 = v38;
  v40 = 0;
  while (1)
  {
    v41 = v40;
    v42 = outputStructCnt;
    if (v40 >= outputStructCnt)
      break;
    v43 = write(v39, &__str[v40], 32 - v40);
    v40 = v43 + v41;
    if (v43 == -1)
    {
      v27 = -83;
      goto LABEL_35;
    }
  }
  v27 = 0;
LABEL_35:
  close(v39);
  IOServiceClose(v46);
  v26 = 0;
  v29 = 0;
  if (v41 < v42)
    goto LABEL_23;
LABEL_24:
  v30 = sub_100003A68();
  if (v30)
  {
    v31 = v30;
    v32 = __stderrp;
    v33 = *__error();
    v34 = __error();
    v35 = strerror(*v34);
    fprintf(v32, "failed to store kernel prng seed: (%d) (%d) %s\n", v31, v33, v35);
    v36 = 2;
  }
  else
  {
    v36 = 0;
  }
  return v22 | v9 | v29 | v36;
}

uint64_t sub_100003A68()
{
  int v0;
  int v1;
  unint64_t v2;
  ssize_t v3;
  uint64_t v4;
  _OWORD buffer[2];

  memset(buffer, 0, sizeof(buffer));
  if (getentropy(buffer, 0x20uLL) == -1)
  {
    v4 = 4294967212;
  }
  else
  {
    v0 = open("/var/db/prng.seed", 1537, 384);
    if (v0 == -1)
    {
      v4 = 4294967220;
    }
    else
    {
      v1 = v0;
      if (fchmod(v0, 0x180u) == -1)
      {
        v4 = 4294967216;
      }
      else if (fchown(v1, 0, 0) == -1)
      {
        v4 = 4294967215;
      }
      else
      {
        v2 = 0;
        while (1)
        {
          v3 = write(v1, (char *)buffer + v2, 32 - v2);
          if (v3 == -1)
            break;
          v2 += v3;
          if (v2 > 0x1F)
          {
            v4 = 0;
            goto LABEL_14;
          }
        }
        v4 = 4294967217;
      }
LABEL_14:
      close(v1);
    }
  }
  cc_clear(32, buffer);
  return v4;
}

uint64_t sub_100003B98()
{
  int v0;
  int v1;
  int v2;
  int v3;
  ssize_t v4;
  int64_t v5;
  uint64_t v6;
  ssize_t v7;
  BOOL v8;
  __int128 v10;

  v0 = open("/var/db/prng.seed", 0);
  if (v0 == -1)
    return 4294967220;
  v1 = v0;
  v2 = open("/dev/random", 1, 0, 0, 0, 0);
  if (v2 == -1)
  {
    v5 = 4294967214;
  }
  else
  {
    v3 = v2;
    do
    {
LABEL_4:
      v4 = read(v1, &v10, 0x20uLL);
      if (v4 == -1)
      {
        v5 = 4294967218;
        goto LABEL_14;
      }
      v5 = v4;
      if (!v4)
        goto LABEL_14;
    }
    while (v4 < 1);
    v6 = 0;
    while (1)
    {
      v7 = write(v3, (char *)&v10 + v6, v5);
      if (v7 == -1)
        break;
      v6 += v7;
      v8 = v5 <= v7;
      v5 -= v7;
      if (v8)
        goto LABEL_4;
    }
    v5 = 4294967213;
LABEL_14:
    cc_clear(32, &v10);
    close(v3);
  }
  close(v1);
  return v5;
}
