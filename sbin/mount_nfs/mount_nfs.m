uint64_t sub_100003AD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  if (*(_DWORD *)(a1 + 48) != 1)
    return 0;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v3 + v2;
  if (__CFADD__(v3, v2))
    return 12;
  v5 = (char *)malloc_type_realloc(*(void **)a1, v3 + v2, 0x39D072A3uLL);
  if (!v5)
    return 12;
  v6 = v5;
  result = 0;
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 24) = &v6[v2];
  *(_QWORD *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_100003B50(uint64_t a1, char *__src, unint64_t a3, int a4)
{
  unint64_t v4;
  size_t v5;
  size_t v8;
  uint64_t result;
  size_t v10;

  if (a4)
    v4 = a3;
  else
    v4 = (a3 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (!v4)
    return 0;
  v5 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  while (1)
  {
    if (!v8)
    {
      result = sub_100003AD0(a1);
      if ((_DWORD)result)
        return result;
      v8 = *(_QWORD *)(a1 + 32);
      if (!v8)
        break;
    }
    if (v8 >= v4)
      v10 = v4;
    else
      v10 = v8;
    if (v5)
    {
      if (v10 >= v5)
        v10 = v5;
      memmove(*(void **)(a1 + 24), __src, v10);
      v8 = *(_QWORD *)(a1 + 32) - v10;
      *(_QWORD *)(a1 + 24) += v10;
      *(_QWORD *)(a1 + 32) = v8;
      __src += v10;
      v5 -= v10;
    }
    else
    {
      bzero(*(void **)(a1 + 24), v10);
      v8 = *(_QWORD *)(a1 + 32) - v10;
      *(_QWORD *)(a1 + 24) += v10;
      *(_QWORD *)(a1 + 32) = v8;
    }
    v4 -= v10;
    if (!v4)
      return 0;
  }
  return 12;
}

void sub_100003C24(int a1, char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  if ((dword_100010928 & 0x400000) != 0)
    vsyslog(3, a2, va);
  verrx(a1, a2, va);
}

void *sub_100003C74()
{
  char *v0;
  char *v1;
  void *result;
  uint64_t v3;

  v0 = (char *)malloc_type_malloc(0x330uLL, 0x1050040AE3C178BuLL);
  qword_100010908 = (uint64_t)v0;
  if (!v0)
    sub_100003C24(12, "memory allocation failed");
  v1 = v0;
  result = memmove(v0, &off_1000105C8, 0x330uLL);
  v3 = &dword_100000008;
  do
  {
    *(_DWORD *)&v1[v3] = *(_DWORD *)((char *)&off_1000105C8 + v3) == 0;
    v3 += 24;
  }
  while (v3 != 824);
  return result;
}

void sub_100003CF8(int a1, char *const *a2)
{
  int v4;
  int v5;
  int v6;
  void *v7;
  ssize_t v8;
  ssize_t v9;
  _BYTE *v10;
  ssize_t v11;
  uint64_t v12;
  __darwin_ct_rune_t v13;
  __uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  BOOL v42;
  uint64_t v43;
  int v44;
  int v45;
  const char **v46;
  uint64_t v47;
  const char *v48;
  int v49;
  int *v50;
  int v51;
  int *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  int *v57;
  int v58;
  int v59;
  int *v60;
  unsigned int v61;
  int v62;
  void *v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  int *v68;
  const char *v69;
  char *v70;
  uint64_t v71;
  void *v72;
  char *__endptr;
  char v74[1024];
  _DWORD v75[3];

  v75[0] = 0;
  bzero(v74, 0x400uLL);
  v72 = 0;
  __endptr = 0;
  v71 = 0;
  *(_OWORD *)dword_100010928 = 0u;
  *(_OWORD *)((char *)&qword_100010934 + 4) = 0u;
  *(__int128 *)((char *)&xmmword_10001093C + 12) = 0u;
  *(_OWORD *)&dword_100010958 = 0u;
  xmmword_100010968 = 0u;
  *(_OWORD *)&dword_100010978 = 0u;
  xmmword_100010988 = 0u;
  *(_OWORD *)&dword_100010998 = 0u;
  xmmword_1000109A8 = 0u;
  *(_OWORD *)&dword_1000109B8 = 0u;
  *(_OWORD *)((char *)&qword_1000109C4 + 4) = 0u;
  unk_1000109D8 = 0u;
  unk_1000109E8 = 0u;
  *(_OWORD *)((char *)&qword_1000109F4 + 4) = 0u;
  xmmword_100010A08 = 0u;
  *(_OWORD *)&dword_100010A18 = 0u;
  xmmword_100010A28 = 0u;
  *(_OWORD *)&dword_100010A38 = 0u;
  xmmword_100010A48 = 0u;
  unk_100010A58 = 0u;
  xmmword_100010A68 = 0u;
  unk_100010A78 = 0u;
  xmmword_100010A88 = 0u;
  unk_100010A98 = 0u;
  xmmword_100010AA8 = 0u;
  unk_100010AB8 = 0u;
  xmmword_100010AC8 = 0u;
  xmmword_100010AD8 = 0u;
  qword_100010AE8 = 0;
  sub_100003C74();
  sub_1000049B0("/etc/nfs.conf", (uint64_t)&dword_100010000);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v4 = getopt(a1, a2, "234a:bcdF:g:I:iLlmo:Pp:R:r:sTt:Uvw:x:z");
        if (v4 <= 51)
          break;
        switch(v4)
        {
          case 'F':
            v5 = open(optarg, 0);
            if (v5 < 0)
            {
              v49 = *__error();
              v50 = __error();
              strerror(*v50);
              sub_100003C24(v49, "could not open file containing file system specification: %s: %s");
            }
            v6 = v5;
            v7 = malloc_type_malloc(0x400uLL, 0xB87C424CuLL);
            qword_100010910 = (uint64_t)v7;
            if (!v7)
              sub_100003C24(12, "memory allocation failed");
            v8 = read(v6, v7, 0x3FFuLL);
            if (v8 < 0)
            {
              v51 = *__error();
              v52 = __error();
              strerror(*v52);
              sub_100003C24(v51, "could not read file containing file system specification: %s: %s");
            }
            v9 = v8;
            v10 = (_BYTE *)(qword_100010910 + v8);
            v11 = v8 - 1;
            do
            {
              *v10 = 0;
              v12 = qword_100010910;
              v13 = *(char *)(qword_100010910 + v11);
              if (v13 < 0)
                v14 = __maskrune(v13, 0x4000uLL);
              else
                v14 = _DefaultRuneLocale.__runetype[v13] & 0x4000;
              --v9;
              v10 = (_BYTE *)(v12 + v9);
              --v11;
            }
            while (v14);
            close(v6);
            continue;
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'N':
          case 'O':
          case 'Q':
          case 'S':
          case 'V':
          case 'W':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'e':
          case 'f':
          case 'h':
          case 'j':
          case 'k':
          case 'n':
          case 'q':
          case 'u':
          case 'y':
            goto LABEL_114;
          case 'I':
            v25 = strtoll(optarg, &__endptr, 10);
            v26 = 0xFFFFFFFFLL;
            if (v25 < 0xFFFFFFFFLL)
              v26 = v25;
            v27 = v26 & ~(v26 >> 63);
            if (*__endptr)
              v28 = 1;
            else
              v28 = v27 == 0;
            if (v28 || v27 > 0x100000)
            {
              warnx("illegal -I value -- %s", optarg);
            }
            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 0x20;
              dword_100010954 = v27;
            }
            continue;
          case 'L':
            LODWORD(qword_10001092C) = qword_10001092C | 0x800;
            dword_1000109C0 = 1;
            continue;
          case 'P':
            qword_100010934 |= 0x400000004uLL;
            continue;
          case 'R':
            v29 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal -R value -- %s", optarg);
            }
            else
            {
              v30 = 0xFFFFFFFFLL;
              if (v29 < 0xFFFFFFFFLL)
                v30 = v29;
              dword_1000108F8 = v30 & ~(v30 >> 63);
            }
            continue;
          case 'T':
            LODWORD(qword_1000109F4) = 1;
            continue;
          case 'U':
            qword_100010934 |= 0x1000000010000uLL;
            continue;
          case 'a':
            v23 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal -a value -- %s", optarg);
            }
            else
            {
              v24 = 0xFFFFFFFFLL;
              if (v23 < 0xFFFFFFFFLL)
                v24 = v23;
              LODWORD(qword_10001092C) = qword_10001092C | 0x40;
              dword_100010958 = v24 & ~(v24 >> 63);
            }
            continue;
          case 'b':
            dword_10001091C |= 1u;
            continue;
          case 'c':
            qword_100010934 |= 0x800000008uLL;
            continue;
          case 'd':
            qword_100010934 |= 0x1000000010uLL;
            continue;
          case 'g':
            v16 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal maxgroups value -- %s", optarg);
            }
            else
            {
              v17 = 0xFFFFFFFFLL;
              if (v16 < 0xFFFFFFFFLL)
                v17 = v16;
              LODWORD(qword_10001092C) = qword_10001092C | 0x2000;
              unk_1000109F0 = v17 & ~(v17 >> 63);
            }
            continue;
          case 'i':
            qword_100010934 |= 0x200000002uLL;
            continue;
          case 'l':
            qword_100010934 |= 0x4000000040uLL;
            continue;
          case 'm':
            LODWORD(v15) = qword_100010934 | 0x40;
            HIDWORD(v15) = HIDWORD(qword_100010934) & 0xFFFFFFBF;
            qword_100010934 = v15;
            continue;
          case 'o':
            sub_100004F18(optarg);
            continue;
          case 'p':
            *(_QWORD *)&xmmword_100010AC8 = strdup(optarg);
            if (!(_QWORD)xmmword_100010AC8)
            {
              strerror(1);
              sub_100003C24(1, "could not set principal: %s");
            }
            LODWORD(qword_10001092C) = qword_10001092C | 0x2000000;
            continue;
          case 'r':
            v18 = strtoll(optarg, &__endptr, 10);
            v19 = 0xFFFFFFFFLL;
            if (v18 < 0xFFFFFFFFLL)
              v19 = v18;
            v20 = v19 & ~(v19 >> 63);
            v21 = *__endptr;
            if ((v21 | 0x20) == 0x6B)
            {
              v20 <<= 10;
              v21 = *++__endptr;
            }
            if (v21)
              v22 = 1;
            else
              v22 = v20 == 0;
            if (v22)
            {
              warnx("illegal -r value -- %s", optarg);
            }
            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 8;
              dword_10001094C = v20;
            }
            continue;
          case 's':
            qword_100010934 |= 0x100000001uLL;
            continue;
          case 't':
            v36 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal -t value -- %s", optarg);
            }
            else
            {
              v37 = 0xFFFFFFFFLL;
              if (v36 < 0xFFFFFFFFLL)
                v37 = v36;
              v38 = v37 & ~(v37 >> 63);
              LODWORD(qword_10001092C) = qword_10001092C | 0x20000;
              *(_QWORD *)&xmmword_100010A08 = v38 / 0xAuLL;
              *((_QWORD *)&xmmword_100010A08 + 1) = 100000000 * (v38 % 0xA);
            }
            continue;
          case 'v':
            ++dword_100010920;
            continue;
          case 'w':
            v31 = strtoll(optarg, &__endptr, 10);
            v32 = 0xFFFFFFFFLL;
            if (v31 < 0xFFFFFFFFLL)
              v32 = v31;
            v33 = v32 & ~(v32 >> 63);
            v34 = *__endptr;
            if ((v34 | 0x20) == 0x6B)
            {
              v33 <<= 10;
              v34 = *++__endptr;
            }
            if (v34)
              v35 = 1;
            else
              v35 = v33 == 0;
            if (v35)
            {
              warnx("illegal -w value -- %s", optarg);
            }
            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 0x10;
              dword_100010950 = v33;
            }
            continue;
          case 'x':
            v39 = strtoll(optarg, &__endptr, 10);
            v40 = 0xFFFFFFFFLL;
            if (v39 < 0xFFFFFFFFLL)
              v40 = v39;
            v41 = v40 & ~(v40 >> 63);
            if (*__endptr)
              v42 = 1;
            else
              v42 = v41 == 0;
            if (v42)
            {
              warnx("illegal -x value -- %s", optarg);
            }
            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 0x40000;
              dword_100010A18 = v41;
            }
            continue;
          case 'z':
            dword_100010924 = 1;
            continue;
          default:
            if (v4 != 52)
              goto LABEL_114;
            LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
            xmmword_10001093C = xmmword_10000A540;
            break;
        }
      }
      if (v4 != 50)
        break;
      LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
      xmmword_10001093C = xmmword_10000A520;
    }
    if (v4 != 51)
      break;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = xmmword_10000A530;
  }
  if (v4 == -1)
  {
    v43 = optind;
    sub_1000068C4();
    if ((qword_100010934 & 1) != 0 && (qword_100010934 & 0x100000000) != 0 && (dword_100010928[0] & 1) != 0)
    {
      v44 = qword_10001092C;
      if ((qword_10001092C & 0x800) == 0)
      {
        v44 = qword_10001092C | 0x800;
        LODWORD(qword_10001092C) = qword_10001092C | 0x800;
        dword_1000109C0 = 2;
      }
      if ((v44 & 0x80000) == 0)
      {
        LODWORD(qword_10001092C) = v44 | 0x80000;
        xmmword_100010A28 = xmmword_10000A550;
      }
    }
    v45 = a1 - v43;
    v46 = (const char **)&a2[v43];
    if (qword_1000109F4)
      LODWORD(qword_10001092C) = qword_10001092C | 0x4000;
    if (v45 == 1 && !strcmp(*v46, "configupdate"))
    {
      if (geteuid())
        sub_100003C24(1, "Must be superuser to configupdate");
      v47 = sub_100006974();
      nullsub_1(v47);
      goto LABEL_136;
    }
    if (!qword_100010910 && v45 >= 1)
    {
      v48 = *v46++;
      qword_100010910 = (uint64_t)v48;
      --v45;
    }
    if (v45 == 1)
    {
      if ((dword_100010928[0] & 0x8000000) != 0)
      {
        if ((unint64_t)__strlcpy_chk(v74, *v46, 1024, 1024) >= 0x400)
        {
          strerror(22);
          sub_100003C24(1, "%s: %s");
        }
      }
      else if (!realpath_DARWIN_EXTSN(*v46, v74))
      {
        if (!*__error())
          sub_100003C24(1, "realpath %s");
        v56 = *__error();
        v57 = __error();
        strerror(*v57);
        sub_100003C24(v56, "realpath %s: %s");
      }
      v53 = sub_100006E20((const char *)qword_100010910, &v71);
      if ((_DWORD)v53 || (v54 = v71) == 0)
      {
        if (!(_DWORD)v53)
          LODWORD(v53) = 22;
        sub_100003C24(v53, "could not parse file system specification");
      }
      if (dword_1000108F8 < 0)
      {
        if ((dword_10001091C & 1) != 0)
          v55 = 10000;
        else
          v55 = 1;
        dword_1000108F8 = v55;
      }
      else if (!dword_1000108F8)
      {
        qword_100010934 |= 0x2000000020000uLL;
      }
      nullsub_1(v53);
      if ((dword_1000108F8 & 0x80000000) == 0)
      {
        v58 = 0;
        v59 = 0;
        v60 = &dword_100010000;
        while (1)
        {
          if ((v59 + 1) >= 2)
          {
            if ((dword_10001091C & 1) != 0)
            {
              puts("Retrying NFS mount in background...");
              dword_10001091C &= ~1u;
              if (daemon(0, 0))
              {
                v67 = *__error();
                v68 = __error();
                strerror(*v68);
                sub_100003C24(v67, "mount nfs background: fork failed: %s");
              }
              dword_10001091C |= 2u;
            }
            if (v58 >= 30)
              v61 = 30;
            else
              v61 = v58;
            if (dword_100010920)
              printf("Retrying NFS mount in %d seconds...\n", v61);
            sleep(v61);
          }
          sub_100007264(v54, v75);
          if (v75[0])
          {
            if (dword_100010920)
              sub_1000072CC((uint64_t **)v54, v74);
            if (((qword_10001092C & 0x40) == 0 || dword_100010958)
              && dword_100010950 > dword_10001094C
              && (double)dword_100010958
               / ((double)dword_100010950
                / (double)dword_10001094C) < 0.25)
            {
              warnx("wsize/rsize ratio is high: this could end up with unexpected readahead RPCs");
            }
            v62 = sub_1000081FC(v54, &v72);
            if (v62)
            {
              v66 = v62;
              strerror(v62);
              sub_100003C24(v66, "error assembling mount args: %s");
            }
            v63 = v72;
            if (dword_100010920 >= 3)
              printf("Calling mount(\"nfs\", %8.8x, %p)\n", dword_100010928[0], v72);
            if (!mount("nfs", v74, dword_100010928[0], v63))
              break;
            v64 = *__error();
            v65 = (v64 - 32);
            if (v65 > 0x2A)
              goto LABEL_173;
            if (((1 << (v64 - 32)) & 0x3367E0009) == 0)
            {
              if (v65 != 42)
              {
LABEL_173:
                strerror(v64);
                sub_100003C24(v64, "can't mount %s from %s onto %s: %s");
              }
              if (((qword_10001092C & 2) == 0 || xmmword_10001093C <= 3)
                && sub_10000952C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v54 + 8) + 16) + 32)) == 15)
              {
                v69 = *(const char **)(*(_QWORD *)(v54 + 8) + 8);
                v70 = strerror(74);
                sub_100003C24(74, "can't mount with remote locks when server (%s) is not running rpc.statd: %s", v69, v70);
              }
            }
            sub_1000095D4((_QWORD *)v54);
            if (v63)
            {
              free(v63);
              v72 = 0;
            }
            v60 = &dword_100010000;
          }
          else
          {
            warnx("no usable addresses for host: %s", *(const char **)(*(_QWORD *)(v54 + 8) + 8));
            v64 = 2;
          }
          ++v59;
          v58 += 5;
          if (v59 > v60[574])
            goto LABEL_173;
        }
      }
LABEL_136:
      exit(0);
    }
  }
LABEL_114:
  fwrite("usage: mount_nfs [-o options] server:/path directory\n", 0x35uLL, 1uLL, __stderrp);
  exit(22);
}

uint64_t sub_1000049B0(const char *a1, uint64_t a2)
{
  FILE *v3;
  FILE *v4;
  char *v5;
  char *v6;
  char *i;
  __darwin_ct_rune_t v8;
  char *v9;
  __darwin_ct_rune_t v10;
  __uint32_t v11;
  char *v12;
  char *v13;
  char *v14;
  __darwin_ct_rune_t v15;
  __uint32_t v16;
  const char *v17;
  __darwin_ct_rune_t v18;
  __darwin_ct_rune_t v19;
  const char *v20;
  uint64_t v21;
  size_t v24;
  size_t v25;

  v24 = 0;
  v25 = 0;
  v3 = fopen(a1, "r");
  if (v3)
  {
    v4 = v3;
    v5 = fparseln(v3, &v25, &v24, 0, 0);
    if (v5)
    {
      v6 = v5;
      do
      {
        if (v25)
        {
          for (i = &v6[v25 - 1]; i > v6; --i)
          {
            v8 = *i;
            if (v8 < 0)
            {
              if (!__maskrune(v8, 0x4000uLL))
                break;
            }
            else if ((_DefaultRuneLocale.__runetype[v8] & 0x4000) == 0)
            {
              break;
            }
            *i = 0;
          }
          v9 = v6 - 1;
          do
          {
            v10 = v9[1];
            if (v10 < 0)
              v11 = __maskrune(v10, 0x4000uLL);
            else
              v11 = _DefaultRuneLocale.__runetype[v10] & 0x4000;
            ++v9;
          }
          while (v11);
          v12 = strchr(v6, 61);
          v13 = v12;
          if (v12)
          {
            v14 = v12 - 1;
            do
            {
              v14[1] = 0;
              if (v14 <= v6)
                break;
              v15 = *v14;
              v16 = v15 < 0 ? __maskrune(v15, 0x4000uLL) : _DefaultRuneLocale.__runetype[v15] & 0x4000;
              --v14;
            }
            while (v16);
            v17 = v13;
            do
            {
              while (1)
              {
                v19 = *++v17;
                v18 = v19;
                if (v19 < 0)
                  break;
                if ((_DefaultRuneLocale.__runetype[v18] & 0x4000) == 0)
                  goto LABEL_29;
              }
            }
            while (__maskrune(v18, 0x4000uLL));
LABEL_29:
            if (!strncmp(v9, "nfs.client.", 0xBuLL))
            {
              v21 = strtol(v17, 0, 0);
              v20 = v17;
LABEL_36:
              if (dword_100010920)
                printf("%4ld %s=%s (%ld)\n", v24, v9, v17, v21);
              if (!strcmp(v9, "nfs.client.access_cache_timeout"))
              {
                if (v13 && v21)
                  *(_DWORD *)a2 = v21;
              }
              else if (!strcmp(v9, "nfs.client.access_for_getattr"))
              {
                *(_DWORD *)(a2 + 4) = v21;
              }
              else if (!strcmp(v9, "nfs.client.allow_async"))
              {
                *(_DWORD *)(a2 + 8) = v21;
              }
              else if (!strcmp(v9, "nfs.client.callback_port"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 12) = v21;
              }
              else if (!strcmp(v9, "nfs.client.initialdowndelay"))
              {
                *(_DWORD *)(a2 + 16) = v21;
              }
              else if (!strcmp(v9, "nfs.client.iosize"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 20) = v21;
              }
              else if (!strcmp(v9, "nfs.client.mount.options"))
              {
                sub_100004F18(v20);
              }
              else if (!strcmp(v9, "nfs.client.nextdowndelay"))
              {
                *(_DWORD *)(a2 + 24) = v21;
              }
              else if (!strcmp(v9, "nfs.client.nfsiod_thread_max"))
              {
                if (v13)
                  *(_DWORD *)(a2 + 28) = v21;
              }
              else if (!strcmp(v9, "nfs.client.statfs_rate_limit"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 32) = v21;
              }
              else if (!strcmp(v9, "nfs.client.is_mobile"))
              {
                *(_DWORD *)(a2 + 36) = v21;
              }
              else if (!strcmp(v9, "nfs.client.squishy_flags"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 40) = v21;
              }
              else if (!strcmp(v9, "nfs.client.root_steals_gss_context"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 44) = v21;
              }
              else if (!strcmp(v9, "nfs.client.default_nfs4domain"))
              {
                if (v13)
                  *(_QWORD *)(a2 + 56) = strndup(v20, 0x400uLL);
              }
              else if (!strcmp(v9, "nfs.client.mount_timeout"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 48) = v21;
              }
              else if (!strcmp(v9, "nfs.client.mount_quick_timeout"))
              {
                if (v13 && v21)
                  *(_DWORD *)(a2 + 52) = v21;
              }
              else if (dword_100010920)
              {
                printf("ignoring unknown config value: %4ld %s=%s\n");
              }
              goto LABEL_90;
            }
          }
          else
          {
            v20 = 0;
            if (!strncmp(v9, "nfs.client.", 0xBuLL))
            {
              v17 = (const char *)&unk_10000B33F;
              v21 = 1;
              goto LABEL_36;
            }
          }
          if (dword_100010920 >= 2)
            printf("%4ld %s=%s\n");
        }
LABEL_90:
        free(v6);
        v6 = fparseln(v4, &v25, &v24, 0, 0);
      }
      while (v6);
    }
    fclose(v4);
    return 0;
  }
  else
  {
    if (*__error() != 2)
      warn("%s", a1);
    return 1;
  }
}

uint64_t sub_100004EB0(uint64_t result, int a2)
{
  int v2;

  if (a2)
  {
    *(_QWORD *)&xmmword_10001093C = 0;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 0x8000000;
    DWORD2(xmmword_10001093C) = a2;
    HIDWORD(xmmword_10001093C) = result;
  }
  else
  {
    v2 = qword_10001092C & 0xF7FFFFFB;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = WORD1(result);
    if ((_WORD)result)
    {
      LODWORD(qword_10001092C) = v2 | 6;
      DWORD1(xmmword_10001093C) = (unsigned __int16)result;
    }
  }
  return result;
}

void sub_100004F18(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  unint64_t v36;
  const char *v37;
  const char *v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  char *v47;
  const char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  int v53;
  uint64_t v54;
  char *v55;
  int v56;
  int v57;
  const char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  const char *v63;
  int v64;
  char *v65;
  int v66;
  char *v67;
  uint64_t v68;
  int v69;
  const char *v70;
  uint64_t v71;
  char *v72;
  const char *v73;
  const char *v74;
  char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  char *__endptr;
  char *__stringp;

  __endptr = 0;
  v118 = 0;
  getmnt_silent = 1;
  v119 = 0;
  v2 = getmntopts(a1, &off_100010040, dword_100010928, &v119);
  if (!v2)
    goto LABEL_382;
  v3 = v2;
  v4 = &dword_100010000;
  if (dword_100010928[0])
    LODWORD(qword_10001092C) = qword_10001092C | 0x400000;
  if ((v119 & 1) != 0)
  {
    v5 = getmntoptstr(v2, "actimeo");
    if (v5)
    {
      v6 = (const char *)v5;
      v7 = getmntoptnum(v3, "actimeo");
      if (v7 < 0)
      {
        warnx("illegal actimeo value -- %s", v6);
      }
      else
      {
        qword_10001092C = (uint64_t)vorr_s8((int8x8_t)qword_10001092C, (int8x8_t)0x600000780);
        *(_QWORD *)&dword_100010960 = v7;
        *((_QWORD *)&xmmword_100010968 + 1) = v7;
        *(_QWORD *)&dword_100010980 = v7;
        *((_QWORD *)&xmmword_100010988 + 1) = v7;
        qword_1000109A0 = v7;
        *((_QWORD *)&xmmword_1000109A8 + 1) = v7;
        *(_QWORD *)&xmmword_100010968 = 0;
        *(_QWORD *)&dword_100010978 = 0;
        *(_QWORD *)&xmmword_100010988 = 0;
        *(_QWORD *)&dword_100010998 = 0;
        *(_QWORD *)&xmmword_1000109A8 = 0;
        *(_QWORD *)&dword_1000109B8 = 0;
      }
    }
    v8 = getmntoptstr(v3, "acregmin");
    if (v8)
    {
      v9 = (const char *)v8;
      v10 = getmntoptnum(v3, "acregmin");
      if (v10 < 0)
      {
        warnx("illegal acregmin value -- %s", v9);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x80;
        *(_QWORD *)&dword_100010960 = v10;
        *(_QWORD *)&xmmword_100010968 = 0;
      }
    }
    v11 = getmntoptstr(v3, "acregmax");
    if (v11)
    {
      v12 = (const char *)v11;
      v13 = getmntoptnum(v3, "acregmax");
      if (v13 < 0)
      {
        warnx("illegal acregmax value -- %s", v12);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x100;
        *((_QWORD *)&xmmword_100010968 + 1) = v13;
        *(_QWORD *)&dword_100010978 = 0;
      }
    }
    v14 = getmntoptstr(v3, "acdirmin");
    if (v14)
    {
      v15 = (const char *)v14;
      v16 = getmntoptnum(v3, "acdirmin");
      if (v16 < 0)
      {
        warnx("illegal acdirmin value -- %s", v15);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x200;
        *(_QWORD *)&dword_100010980 = v16;
        *(_QWORD *)&xmmword_100010988 = 0;
      }
    }
    v17 = getmntoptstr(v3, "acdirmax");
    if (v17)
    {
      v18 = (const char *)v17;
      v19 = getmntoptnum(v3, "acdirmax");
      if (v19 < 0)
      {
        warnx("illegal acdirmax value -- %s", v18);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x400;
        *((_QWORD *)&xmmword_100010988 + 1) = v19;
        *(_QWORD *)&dword_100010998 = 0;
      }
    }
    v20 = getmntoptstr(v3, "acrootdirmin");
    if (v20)
    {
      v21 = (const char *)v20;
      v22 = getmntoptnum(v3, "acrootdirmin");
      if (v22 < 0)
      {
        warnx("illegal acrootdirmin value -- %s", v21);
      }
      else
      {
        HIDWORD(qword_10001092C) |= 2u;
        qword_1000109A0 = v22;
        *(_QWORD *)&xmmword_1000109A8 = 0;
      }
    }
    v23 = getmntoptstr(v3, "acrootdirmax");
    if (v23)
    {
      v24 = (const char *)v23;
      v25 = getmntoptnum(v3, "acrootdirmax");
      if (v25 < 0)
      {
        warnx("illegal acrootdirmax value -- %s", v24);
      }
      else
      {
        HIDWORD(qword_10001092C) |= 4u;
        *((_QWORD *)&xmmword_1000109A8 + 1) = v25;
        *(_QWORD *)&dword_1000109B8 = 0;
      }
    }
  }
  if ((v119 & 0x20000) != 0)
  {
    v26 = (const char *)getmntoptstr(v3, "deadtimeout");
    if (v26)
    {
      v27 = v26;
      v28 = strtol(v26, &__endptr, 10);
      if (v28 < 0)
      {
        warnx("illegal deadtimeout value -- %s", v27);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x80000;
        xmmword_100010A28 = (unint64_t)v28;
      }
    }
  }
  if ((v119 & 2) != 0)
  {
    v29 = (const char *)getmntoptstr(v3, "dsize");
    if (v29)
    {
      v30 = v29;
      v31 = strtol(v29, &__endptr, 10);
      v32 = __endptr;
      if ((*__endptr | 0x20) == 0x6B)
      {
        v31 <<= 10;
        v32 = ++__endptr;
      }
      if (v31 < 1 || *v32)
      {
        warnx("illegal dsize value -- %s", v30);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x20;
        dword_100010954 = v31;
      }
    }
  }
  if ((v119 & 4) != 0)
  {
    v33 = getmntoptnum(v3, "maxgroups");
    if ((unint64_t)(v33 - 17) <= 0xFFFFFFFFFFFFFFEFLL)
    {
      sub_10000A13C(v3);
    }
    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x2000;
      unk_1000109F0 = v33;
    }
  }
  if ((v119 & 8) != 0)
  {
    v34 = (const char *)getmntoptstr(v3, "mountport");
    if (v34)
    {
      v35 = v34;
      v36 = strtol(v34, &__endptr, 10);
      if (*__endptr)
      {
        if (*v35 == 47)
        {
          LODWORD(qword_10001092C) = qword_10001092C | 0x40000000;
          *((_QWORD *)&xmmword_100010AD8 + 1) = strdup(v35);
          HIDWORD(qword_1000109F4) = 1;
        }
        else
        {
          warnx("unsupported mount port -- %s");
        }
      }
      else if (v36 >= 0x10000)
      {
        warnx("illegal mountport number -- %s");
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x10000;
        dword_100010A00 = v36;
      }
    }
    else
    {
      warnx("option mountport needs a value", v116);
    }
  }
  if ((v119 & 0x10) != 0)
  {
    v37 = (const char *)getmntoptstr(v3, "port");
    if (v37)
    {
      v38 = v37;
      v39 = strtol(v37, &__endptr, 10);
      if (*__endptr)
      {
        if (*v38 == 47)
        {
          LODWORD(qword_10001092C) = qword_10001092C | 0x20000000;
          *(_QWORD *)&xmmword_100010AD8 = strdup(v38);
          HIDWORD(qword_1000109F4) = 1;
        }
        else
        {
          warnx("unsupported port -- %s");
        }
      }
      else if (v39 >= 0x10000)
      {
        warnx("illegal port number -- %s");
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x8000;
        dword_1000109FC = v39;
      }
    }
    else
    {
      warnx("option port needs a value", v116);
    }
  }
  if ((v119 & 0x800020) == 0)
    goto LABEL_87;
  v40 = (const char *)getmntoptstr(v3, "netid");
  if (!v40)
  {
    v40 = (const char *)getmntoptstr(v3, "proto");
    if (!v40)
      goto LABEL_87;
  }
  if (!strncasecmp(v40, "tcp", 4uLL) || !strncasecmp(v40, "tcp4", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      v41 = 0x200000001;
      goto LABEL_86;
    }
    goto LABEL_377;
  }
  if (!strncasecmp(v40, "udp", 4uLL) || !strncasecmp(v40, "udp4", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      v41 = 0x200000002;
      goto LABEL_86;
    }
    goto LABEL_377;
  }
  if (!strncasecmp(v40, "tcp6", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      v41 = 0x1E00000001;
      goto LABEL_86;
    }
    goto LABEL_377;
  }
  if (!strncasecmp(v40, "udp6", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      v41 = 0x1E00000002;
      goto LABEL_86;
    }
LABEL_377:
    warnx("netid must be ticotsord or ticlts when specifing local socket ports");
    goto LABEL_87;
  }
  if (!strncasecmp(v40, "ticotsord", 0xAuLL))
  {
    v41 = 0x100000001;
    goto LABEL_86;
  }
  if (!strncasecmp(v40, "ticlts", 7uLL))
  {
    v41 = 0x100000002;
LABEL_86:
    qword_1000109F4 = v41;
    goto LABEL_87;
  }
  warnx("unknown protocol -- %s");
LABEL_87:
  if ((v119 & 0x40) != 0)
  {
    v42 = getmntoptnum(v3, "readahead");
    if (v42 >= 0x81)
    {
      sub_10000A10C(v3);
    }
    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x40;
      dword_100010958 = v42;
    }
  }
  if ((v119 & 0x80) != 0)
  {
    v43 = getmntoptnum(v3, "retrans");
    if ((unint64_t)(v43 - 0x80000000) <= 0xFFFFFFFF80000000)
    {
      sub_10000A0DC(v3);
    }
    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x40000;
      dword_100010A18 = v43;
    }
  }
  if ((v119 & 0x100) != 0)
  {
    v44 = getmntoptnum(v3, "retrycnt");
    if (v44 >> 31)
      sub_10000A0AC(v3);
    else
      dword_1000108F8 = v44;
  }
  if ((v119 & 0x200) != 0)
  {
    v45 = (const char *)getmntoptstr(v3, "rwsize");
    if (v45 || (v45 = (const char *)getmntoptstr(v3, "rsize")) != 0)
    {
      v46 = strtol(v45, &__endptr, 10);
      v47 = __endptr;
      if ((*__endptr | 0x20) == 0x6B)
      {
        v46 <<= 10;
        v47 = ++__endptr;
      }
      if ((unint64_t)(v46 - 1048577) < 0xFFFFFFFFFFF00000 || *v47)
      {
        warnx("illegal rsize value -- %s", v45);
      }
      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 8;
        dword_10001094C = v46;
      }
    }
  }
  if ((v119 & 0x400) == 0)
    goto LABEL_139;
  v48 = (const char *)getmntoptstr(v3, "sec");
  if (!v48)
  {
    warnx("missing security value for sec= option");
    goto LABEL_139;
  }
  v49 = strdup(v48);
  __stringp = v49;
  if (!v49)
  {
LABEL_136:
    warnx("couldn't parse security value -- %s");
    goto LABEL_139;
  }
  v50 = v49;
  qword_1000109C4 = 0;
  unk_1000109CC = 0;
  unk_1000109D4 = 0;
  v51 = strsep(&__stringp, ":");
  if (!v51)
  {
LABEL_135:
    v57 = qword_1000109C4;
    free(v50);
    v4 = &dword_100010000;
    if (v57)
      goto LABEL_138;
    goto LABEL_136;
  }
  v52 = v51;
  v53 = 0;
  while (1)
  {
    v54 = (int)qword_1000109C4;
    if ((int)qword_1000109C4 >= 5)
      break;
    if (*v52)
    {
      if (!strcmp("krb5p", v52))
      {
        if ((v53 & 8) == 0)
        {
          v53 |= 8u;
          LODWORD(qword_1000109C4) = v54 + 1;
          v55 = (char *)&qword_1000109C4 + 4 * v54;
          v56 = 390005;
LABEL_131:
          *((_DWORD *)v55 + 1) = v56;
          goto LABEL_132;
        }
        warnx("sec krb5p appears more than once: %s");
      }
      else if (!strcmp("krb5i", v52))
      {
        if ((v53 & 4) == 0)
        {
          v53 |= 4u;
          LODWORD(qword_1000109C4) = v54 + 1;
          v55 = (char *)&qword_1000109C4 + 4 * v54;
          v56 = 390004;
          goto LABEL_131;
        }
        warnx("sec krb5i appears more than once: %s");
      }
      else if (!strcmp("krb5", v52))
      {
        if ((v53 & 2) == 0)
        {
          v53 |= 2u;
          LODWORD(qword_1000109C4) = v54 + 1;
          v55 = (char *)&qword_1000109C4 + 4 * v54;
          v56 = 390003;
          goto LABEL_131;
        }
        warnx("sec krb5 appears more than once: %s");
      }
      else
      {
        if (strcmp("sys", v52))
        {
          if (!strcmp("none", v52))
          {
            if ((v53 & 0x10) != 0)
            {
              warnx("sec none appears more than once: %s");
            }
            else
            {
              v53 |= 0x10u;
              LODWORD(qword_1000109C4) = v54 + 1;
              *((_DWORD *)&qword_1000109C4 + v54 + 1) = 0;
            }
          }
          else
          {
            warnx("unknown sec flavor '%s' ignored");
          }
          goto LABEL_132;
        }
        if ((v53 & 1) == 0)
        {
          v53 |= 1u;
          LODWORD(qword_1000109C4) = v54 + 1;
          v55 = (char *)&qword_1000109C4 + 4 * v54;
          v56 = 1;
          goto LABEL_131;
        }
        warnx("sec sys appears more than once: %s");
      }
    }
LABEL_132:
    v52 = strsep(&__stringp, ":");
    if (!v52)
      goto LABEL_135;
  }
  free(v50);
  v4 = &dword_100010000;
LABEL_138:
  v4[587] |= 0x1000u;
LABEL_139:
  if ((v119 & 0x200000) != 0)
  {
    v58 = (const char *)getmntoptstr(v3, "etype");
    if (v58)
    {
      v59 = strdup(v58);
      __stringp = v59;
      if (!v59)
        goto LABEL_357;
      v60 = v59;
      qword_1000109DC = 0;
      *(_QWORD *)&dword_1000109E4 = 0;
      unk_1000109EC = 0;
      v61 = strsep(&__stringp, ":");
      v62 = qword_1000109DC;
      if (v61 && qword_1000109DC <= 2uLL)
      {
        v63 = v61;
        v64 = 0;
        while (1)
        {
          if (!*v63)
            goto LABEL_161;
          if (!strcasecmp("des3", v63) || !strcasecmp("des3-cbc-sha1", v63) || !strcasecmp("des3-cbc-sha1-kd", v63))
          {
            if ((v64 & 1) != 0)
            {
              warnx("etype des3-cbc-sha1-kd  appears more than once: %s");
              goto LABEL_161;
            }
            v64 |= 1u;
            LODWORD(qword_1000109DC) = v62 + 1;
            v65 = (char *)&qword_1000109DC + 4 * v62;
            v66 = 16;
            goto LABEL_160;
          }
          if (!strcasecmp("aes128", v63)
            || !strcasecmp("aes128-cts-hmac-sha1", v63)
            || !strcasecmp("aes128-cts-hmac-sha1-96", v63))
          {
            if ((v64 & 2) == 0)
            {
              v64 |= 2u;
              LODWORD(qword_1000109DC) = v62 + 1;
              v65 = (char *)&qword_1000109DC + 4 * v62;
              v66 = 17;
LABEL_160:
              *((_DWORD *)v65 + 2) = v66;
              goto LABEL_161;
            }
            warnx("etype aes128-cts-hmac-sha1-96  appears more than once: %s");
          }
          else
          {
            if (!strcasecmp("aes256", v63)
              || !strcasecmp("aes256-cts-hmac-sha1", v63)
              || !strcasecmp("aes256-cts-hmac-sha1-96", v63))
            {
              if ((v64 & 4) != 0)
              {
                warnx("etype aes256-cts-hmac-sha1-96  appears more than once: %s");
                goto LABEL_161;
              }
              v64 |= 4u;
              LODWORD(qword_1000109DC) = v62 + 1;
              v65 = (char *)&qword_1000109DC + 4 * v62;
              v66 = 18;
              goto LABEL_160;
            }
            warnx("etype %s is unknown etype. Ignored");
          }
LABEL_161:
          v67 = strsep(&__stringp, ":");
          v62 = qword_1000109DC;
          if (v67)
          {
            v63 = v67;
            if (qword_1000109DC < 3uLL)
              continue;
          }
          break;
        }
      }
      free(v60);
      HIDWORD(qword_1000109DC) = v62;
      v4 = &dword_100010000;
      if (v62)
        LODWORD(qword_10001092C) = qword_10001092C | 0x10000000;
      else
LABEL_357:
        warnx("couldn't parse type value -- %s");
    }
    else
    {
      warnx("missing encryption type value for etype= option");
    }
  }
  if ((v119 & 0x800) != 0)
  {
    v68 = getmntoptnum(v3, "timeo");
    if (v68 <= 0)
    {
      sub_10000A07C(v3);
    }
    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x20000;
      *(_QWORD *)&xmmword_100010A08 = v68 / 0xAuLL;
      *((_QWORD *)&xmmword_100010A08 + 1) = 100000000 * (v68 % 0xAuLL);
    }
  }
  v69 = v119;
  if ((v119 & 0x1000) != 0)
  {
    LODWORD(__stringp) = 0;
    v117 = 0;
    v76 = (const char *)getmntoptstr(v3, "vers");
    if (v76 || (v76 = (const char *)getmntoptstr(v3, "nfsvers")) != 0)
    {
      if (sub_1000097E0(v76, (unsigned int *)&__stringp, (unsigned int *)&v117))
        sub_100004EB0(__stringp, v117);
      else
        warnx("illegal NFS version value -- %s", v76);
    }
    v69 = v119;
    if ((v119 & 0x2000) == 0)
    {
LABEL_176:
      if ((v69 & 0x4000) == 0)
        goto LABEL_177;
      goto LABEL_202;
    }
  }
  else if ((v119 & 0x2000) == 0)
  {
    goto LABEL_176;
  }
  warnx("option nfsv2 deprecated, use vers=#");
  LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
  xmmword_10001093C = xmmword_10000A520;
  v69 = v119;
  if ((v119 & 0x4000) == 0)
  {
LABEL_177:
    if ((v69 & 0x8000) == 0)
      goto LABEL_178;
LABEL_203:
    warnx("option nfsv4 deprecated, use vers=#");
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = xmmword_10000A540;
    if ((v119 & 0x10000) == 0)
      goto LABEL_186;
    goto LABEL_179;
  }
LABEL_202:
  warnx("option nfsv3 deprecated, use vers=#");
  LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
  xmmword_10001093C = xmmword_10000A530;
  v69 = v119;
  if ((v119 & 0x8000) != 0)
    goto LABEL_203;
LABEL_178:
  if ((v69 & 0x10000) == 0)
    goto LABEL_186;
LABEL_179:
  v70 = (const char *)getmntoptstr(v3, "rwsize");
  if (v70 || (v70 = (const char *)getmntoptstr(v3, "wsize")) != 0)
  {
    v71 = strtol(v70, &__endptr, 10);
    v72 = __endptr;
    if ((*__endptr | 0x20) == 0x6B)
    {
      v71 <<= 10;
      v72 = ++__endptr;
    }
    if ((unint64_t)(v71 - 1048577) < 0xFFFFFFFFFFF00000 || *v72)
    {
      warnx("illegal wsize value -- %s", v70);
    }
    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x10;
      dword_100010950 = v71;
    }
  }
LABEL_186:
  if ((v119 & 0x80000) == 0)
    goto LABEL_191;
  v73 = (const char *)getmntoptstr(v3, "principal");
  if (v73)
  {
    if ((_QWORD)xmmword_100010AC8)
    {
      warnx("principal is already set to %s. ignoring %s", (const char *)xmmword_100010AC8, v73);
      if ((_QWORD)xmmword_100010AC8)
        goto LABEL_190;
    }
    else
    {
      *(_QWORD *)&xmmword_100010AC8 = strdup(v73);
      if ((_QWORD)xmmword_100010AC8)
      {
LABEL_190:
        v4[587] |= 0x2000000u;
        goto LABEL_191;
      }
    }
    strerror(1);
    sub_100003C24(1, "could not set principal: %s");
  }
  warnx("missing principal name");
LABEL_191:
  if ((v119 & 0x40000) != 0)
  {
    v74 = (const char *)getmntoptstr(v3, "realm");
    if (v74)
    {
      if (*v74 == 64 || dword_100010924)
      {
        v75 = strdup(v74);
        qword_100010AC0 = (uint64_t)v75;
      }
      else
      {
        asprintf((char **)&qword_100010AC0, "@%s", v74);
        v75 = (char *)qword_100010AC0;
      }
      if (!v75)
      {
        strerror(1);
        sub_100003C24(1, "could not set realm: %s");
      }
      v4[587] |= 0x1000000u;
    }
    else
    {
      warnx("missing realm name");
    }
  }
  if ((v119 & 0x100000) != 0)
  {
    v77 = (const char *)getmntoptstr(v3, "sprincipal");
    if (v77)
    {
      *((_QWORD *)&xmmword_100010AC8 + 1) = strdup(v77);
      if (!*((_QWORD *)&xmmword_100010AC8 + 1))
      {
        strerror(1);
        sub_100003C24(1, "could not set server's principal: %s");
      }
      v4[587] |= 0x4000000u;
    }
    else
    {
      warnx("missing server's principal");
    }
  }
  if ((v119 & 0x400000) != 0)
  {
    v78 = (const char *)getmntoptstr(v3, "fh");
    if (v78)
    {
      if (sub_100009628(v78, &dword_100010A38))
      {
        strerror(1);
        sub_100003C24(1, "cound not set root file handle: %s");
      }
      v4[587] |= 0x100000u;
      if (dword_100010920 >= 2)
      {
        v79 = sub_100009734(&dword_100010A38);
        if (v79)
        {
          v80 = v79;
          printf("Got fh %s\n", v79);
          free(v80);
        }
      }
    }
    else
    {
      warnx("missing hex string for file handle");
    }
  }
  if ((v119 & 0x1000000) != 0)
  {
    v81 = getmntoptstr(v3, "readlink_nocache");
    if (v81)
    {
      v82 = (const char *)v81;
      v83 = getmntoptnum(v3, "readlink_nocache");
      if (v83 < 0)
      {
        warnx("illegal readlink_nocache value -- %s", v82);
      }
      else
      {
        HIDWORD(qword_10001092C) |= 1u;
        dword_100010A1C = v83;
      }
    }
  }
  if ((v119 & 0x2000000) != 0)
  {
    v84 = getmntoptstr(v3, "accesscache");
    if (v84)
    {
      v85 = (const char *)v84;
      v86 = getmntoptnum(v3, "accesscache");
      if (v86 < 0)
      {
        warnx("illegal accesscache value -- %s", v85);
      }
      else
      {
        HIDWORD(qword_10001092C) |= 8u;
        dword_100010A20 = v86;
      }
    }
  }
  freemntopts(v3);
  v119 = 0;
  v87 = getmntopts(a1, &off_1000105C8, &v118, &v119);
  if (!v87)
LABEL_382:
    sub_100003C24(22, "getmntops failed: %s", a1);
  v88 = v87;
  if (dword_100010920 >= 3)
    printf("altflags=0x%x\n", v119);
  v89 = v119;
  if ((v119 & 0x40000) != 0)
  {
    LODWORD(v99) = qword_100010934 | 0x1000;
    HIDWORD(v99) = HIDWORD(qword_100010934) & 0xFFFFEFFF;
    qword_100010934 = v99;
    if ((v119 & 0x80000) == 0)
    {
LABEL_231:
      if ((v119 & 1) == 0)
        goto LABEL_232;
      goto LABEL_312;
    }
  }
  else if ((v119 & 0x80000) == 0)
  {
    goto LABEL_231;
  }
  qword_100010934 |= 0x200000002000uLL;
  if ((v119 & 1) == 0)
  {
LABEL_232:
    if ((v119 & 2) == 0)
      goto LABEL_233;
    goto LABEL_313;
  }
LABEL_312:
  v4[587] &= 0xFFFFF87F;
  if ((v89 & 2) == 0)
  {
LABEL_233:
    if ((v89 & 0x10000) == 0)
      goto LABEL_234;
    goto LABEL_314;
  }
LABEL_313:
  dword_10001091C |= 1u;
  if ((v89 & 0x10000) == 0)
  {
LABEL_234:
    if ((v89 & 4) == 0)
      goto LABEL_235;
    goto LABEL_315;
  }
LABEL_314:
  LODWORD(v100) = qword_100010934 | 0x400;
  HIDWORD(v100) = HIDWORD(qword_100010934) & 0xFFFFFBFF;
  qword_100010934 = v100;
  if ((v89 & 4) == 0)
  {
LABEL_235:
    if ((v89 & 8) == 0)
      goto LABEL_236;
    goto LABEL_316;
  }
LABEL_315:
  LODWORD(v101) = qword_100010934 | 8;
  HIDWORD(v101) = HIDWORD(qword_100010934) & 0xFFFFFFF7;
  qword_100010934 = v101;
  if ((v89 & 8) == 0)
  {
LABEL_236:
    if ((v89 & 0x10) == 0)
      goto LABEL_237;
    goto LABEL_317;
  }
LABEL_316:
  qword_100010934 |= 0x1000000010uLL;
  if ((v89 & 0x10) == 0)
  {
LABEL_237:
    if ((v89 & 0x4000000) == 0)
      goto LABEL_238;
LABEL_318:
    v103 = strerror(45);
    sub_100003C24(69, "FPnfs is deprecated: %s", v103);
  }
LABEL_317:
  LODWORD(v102) = qword_100010934 | 1;
  HIDWORD(v102) = HIDWORD(qword_100010934) & 0xFFFFFFFE;
  qword_100010934 = v102;
  if ((v89 & 0x4000000) != 0)
    goto LABEL_318;
LABEL_238:
  if ((v89 & 0x600000) != 0)
  {
    if ((v89 & 0x400000) != 0)
      v90 = 30;
    else
      v90 = 2;
    HIDWORD(qword_1000109F4) = v90;
  }
  if ((v89 & 0x20) != 0)
  {
    qword_100010934 |= 0x200000002uLL;
    if ((v89 & 0x40) == 0)
    {
LABEL_245:
      if ((v89 & 0x80) == 0)
        goto LABEL_246;
      goto LABEL_321;
    }
  }
  else if ((v89 & 0x40) == 0)
  {
    goto LABEL_245;
  }
  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 2;
  if ((v89 & 0x80) == 0)
  {
LABEL_246:
    if ((v89 & 0x100) == 0)
      goto LABEL_247;
    goto LABEL_322;
  }
LABEL_321:
  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 0;
  if ((v89 & 0x100) == 0)
  {
LABEL_247:
    if ((v89 & 0x8000) == 0)
      goto LABEL_248;
    goto LABEL_323;
  }
LABEL_322:
  qword_100010934 |= 0x1000000010000uLL;
  if ((v89 & 0x8000) == 0)
  {
LABEL_248:
    if ((v89 & 0x20000) == 0)
      goto LABEL_249;
    goto LABEL_324;
  }
LABEL_323:
  qword_100010934 |= 0x10000000100uLL;
  if ((v89 & 0x20000) == 0)
  {
LABEL_249:
    if ((v89 & 0x200) == 0)
      goto LABEL_250;
    goto LABEL_325;
  }
LABEL_324:
  qword_100010934 |= 0x80000000800uLL;
  if ((v89 & 0x200) == 0)
  {
LABEL_250:
    if ((v89 & 0x100000) == 0)
      goto LABEL_251;
    goto LABEL_326;
  }
LABEL_325:
  LODWORD(v104) = qword_100010934 | 0x80;
  HIDWORD(v104) = HIDWORD(qword_100010934) & 0xFFFFFF7F;
  qword_100010934 = v104;
  if ((v89 & 0x100000) == 0)
  {
LABEL_251:
    if ((v89 & 0x2000000) == 0)
      goto LABEL_252;
    goto LABEL_327;
  }
LABEL_326:
  qword_100010934 |= 0x400000004000uLL;
  if ((v89 & 0x2000000) == 0)
  {
LABEL_252:
    if ((v89 & 0x800000) == 0)
      goto LABEL_253;
    goto LABEL_328;
  }
LABEL_327:
  qword_100010934 |= 0x8000000080000uLL;
  if ((v89 & 0x800000) == 0)
  {
LABEL_253:
    if ((v89 & 0x400) == 0)
      goto LABEL_254;
    goto LABEL_329;
  }
LABEL_328:
  LODWORD(v105) = qword_100010934 | 0x8000;
  HIDWORD(v105) = HIDWORD(qword_100010934) & 0xFFFF7FFF;
  qword_100010934 = v105;
  if ((v89 & 0x400) == 0)
  {
LABEL_254:
    if ((v89 & 0x800) == 0)
      goto LABEL_255;
    goto LABEL_330;
  }
LABEL_329:
  qword_100010934 |= 0x4000000040uLL;
  if ((v89 & 0x800) == 0)
  {
LABEL_255:
    if ((v89 & 0x1000) == 0)
      goto LABEL_257;
    goto LABEL_256;
  }
LABEL_330:
  qword_100010934 |= 0x400000004uLL;
  if ((v89 & 0x1000) != 0)
LABEL_256:
    qword_100010934 |= 0x100000001uLL;
LABEL_257:
  if ((v89 & 0x6000) != 0)
  {
    if ((v89 & 0x4000) != 0)
      v91 = 2;
    else
      v91 = 1;
    LODWORD(qword_1000109F4) = v91;
  }
  if ((v89 & 0x1000000) != 0)
  {
    LODWORD(qword_10001092C) = qword_10001092C | 0x100000;
    dword_100010A38 = 0;
    if ((v89 & 0x8000000) == 0)
    {
LABEL_264:
      if ((v89 & 0x10000000) == 0)
        goto LABEL_265;
      goto LABEL_334;
    }
  }
  else if ((v89 & 0x8000000) == 0)
  {
    goto LABEL_264;
  }
  qword_100010934 |= 0x2000000020uLL;
  if ((v89 & 0x10000000) == 0)
  {
LABEL_265:
    if ((v89 & 0x20000000) == 0)
      goto LABEL_267;
    goto LABEL_266;
  }
LABEL_334:
  LODWORD(qword_100010AE8) = 1;
  if ((v89 & 0x20000000) != 0)
LABEL_266:
    qword_100010934 |= 0x10000000100000uLL;
LABEL_267:
  freemntopts(v88);
  v119 = 0;
  v92 = getmntopts(a1, qword_100010908, &v118, &v119);
  if (!v92)
    goto LABEL_382;
  v93 = v92;
  if (dword_100010920 >= 3)
    printf("negative altflags=0x%x\n", v119);
  if ((v119 & 0x40000) != 0)
  {
    qword_100010934 |= 0x100000001000uLL;
    if ((v119 & 0x80000) == 0)
    {
LABEL_272:
      if ((v119 & 1) == 0)
        goto LABEL_273;
      goto LABEL_338;
    }
  }
  else if ((v119 & 0x80000) == 0)
  {
    goto LABEL_272;
  }
  LODWORD(v106) = qword_100010934 | 0x2000;
  HIDWORD(v106) = HIDWORD(qword_100010934) & 0xFFFFDFFF;
  qword_100010934 = v106;
  if ((v119 & 1) == 0)
  {
LABEL_273:
    if ((v119 & 2) == 0)
      goto LABEL_274;
    goto LABEL_339;
  }
LABEL_338:
  qword_10001092C = (uint64_t)vorr_s8((int8x8_t)qword_10001092C, (int8x8_t)0x600000780);
  *(_OWORD *)&dword_100010960 = 0u;
  *(__int128 *)((char *)&xmmword_100010968 + 8) = 0u;
  *(_OWORD *)&dword_100010980 = 0u;
  *(__int128 *)((char *)&xmmword_100010988 + 8) = 0u;
  *(_OWORD *)&qword_1000109A0 = 0u;
  *(__int128 *)((char *)&xmmword_1000109A8 + 8) = 0u;
  if ((v119 & 2) == 0)
  {
LABEL_274:
    if ((v119 & 0x10000) == 0)
      goto LABEL_275;
    goto LABEL_340;
  }
LABEL_339:
  dword_10001091C &= ~1u;
  if ((v119 & 0x10000) == 0)
  {
LABEL_275:
    if ((v119 & 4) == 0)
      goto LABEL_276;
    goto LABEL_341;
  }
LABEL_340:
  qword_100010934 |= 0x40000000400uLL;
  if ((v119 & 4) == 0)
  {
LABEL_276:
    if ((v119 & 0x2000000) == 0)
      goto LABEL_277;
    goto LABEL_342;
  }
LABEL_341:
  qword_100010934 |= 0x800000008uLL;
  if ((v119 & 0x2000000) == 0)
  {
LABEL_277:
    if ((v119 & 8) == 0)
      goto LABEL_278;
    goto LABEL_343;
  }
LABEL_342:
  LODWORD(v107) = qword_100010934 | 0x80000;
  HIDWORD(v107) = HIDWORD(qword_100010934) & 0xFFF7FFFF;
  qword_100010934 = v107;
  if ((v119 & 8) == 0)
  {
LABEL_278:
    if ((v119 & 0x10) == 0)
      goto LABEL_280;
    goto LABEL_279;
  }
LABEL_343:
  LODWORD(v108) = qword_100010934 | 0x10;
  HIDWORD(v108) = HIDWORD(qword_100010934) & 0xFFFFFFEF;
  qword_100010934 = v108;
  if ((v119 & 0x10) != 0)
LABEL_279:
    qword_100010934 |= 0x100000001uLL;
LABEL_280:
  if ((v119 & 0x600000) != 0)
  {
    if ((v119 & 0x400000) != 0)
      v94 = 2;
    else
      v94 = 30;
    HIDWORD(qword_1000109F4) = v94;
  }
  if ((v119 & 0x20) != 0)
  {
    LODWORD(v109) = qword_100010934 | 2;
    HIDWORD(v109) = HIDWORD(qword_100010934) & 0xFFFFFFFD;
    qword_100010934 = v109;
    if ((v119 & 0x40) == 0)
    {
LABEL_287:
      if ((v119 & 0x80) == 0)
        goto LABEL_288;
      goto LABEL_347;
    }
  }
  else if ((v119 & 0x40) == 0)
  {
    goto LABEL_287;
  }
  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 0;
  if ((v119 & 0x80) == 0)
  {
LABEL_288:
    if ((v119 & 0x100) == 0)
      goto LABEL_289;
    goto LABEL_348;
  }
LABEL_347:
  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 1;
  if ((v119 & 0x100) == 0)
  {
LABEL_289:
    if ((v119 & 0x8000) == 0)
      goto LABEL_290;
    goto LABEL_349;
  }
LABEL_348:
  LODWORD(v110) = qword_100010934 | 0x10000;
  HIDWORD(v110) = HIDWORD(qword_100010934) & 0xFFFEFFFF;
  qword_100010934 = v110;
  if ((v119 & 0x8000) == 0)
  {
LABEL_290:
    if ((v119 & 0x20000) == 0)
      goto LABEL_291;
    goto LABEL_350;
  }
LABEL_349:
  LODWORD(v111) = qword_100010934 | 0x100;
  HIDWORD(v111) = HIDWORD(qword_100010934) & 0xFFFFFEFF;
  qword_100010934 = v111;
  if ((v119 & 0x20000) == 0)
  {
LABEL_291:
    if ((v119 & 0x200) == 0)
      goto LABEL_292;
    goto LABEL_351;
  }
LABEL_350:
  LODWORD(v112) = qword_100010934 | 0x800;
  HIDWORD(v112) = HIDWORD(qword_100010934) & 0xFFFFF7FF;
  qword_100010934 = v112;
  if ((v119 & 0x200) == 0)
  {
LABEL_292:
    if ((v119 & 0x100000) == 0)
      goto LABEL_293;
    goto LABEL_352;
  }
LABEL_351:
  qword_100010934 |= 0x8000000080uLL;
  if ((v119 & 0x100000) == 0)
  {
LABEL_293:
    if ((v119 & 0x800000) == 0)
      goto LABEL_294;
    goto LABEL_353;
  }
LABEL_352:
  LODWORD(v113) = qword_100010934 | 0x4000;
  HIDWORD(v113) = HIDWORD(qword_100010934) & 0xFFFFBFFF;
  qword_100010934 = v113;
  if ((v119 & 0x800000) == 0)
  {
LABEL_294:
    if ((v119 & 0x400) == 0)
      goto LABEL_295;
    goto LABEL_354;
  }
LABEL_353:
  qword_100010934 |= 0x800000008000uLL;
  if ((v119 & 0x400) == 0)
  {
LABEL_295:
    if ((v119 & 0x800) == 0)
      goto LABEL_296;
    goto LABEL_355;
  }
LABEL_354:
  LODWORD(v114) = qword_100010934 | 0x40;
  HIDWORD(v114) = HIDWORD(qword_100010934) & 0xFFFFFFBF;
  qword_100010934 = v114;
  if ((v119 & 0x800) == 0)
  {
LABEL_296:
    if ((v119 & 0x1000) == 0)
      goto LABEL_298;
    goto LABEL_297;
  }
LABEL_355:
  LODWORD(v115) = qword_100010934 | 4;
  HIDWORD(v115) = HIDWORD(qword_100010934) & 0xFFFFFFFB;
  qword_100010934 = v115;
  if ((v119 & 0x1000) != 0)
  {
LABEL_297:
    LODWORD(v95) = qword_100010934 | 1;
    HIDWORD(v95) = HIDWORD(qword_100010934) & 0xFFFFFFFE;
    qword_100010934 = v95;
  }
LABEL_298:
  if ((v119 & 0x6000) != 0)
  {
    if ((v119 & 0x4000) != 0)
      v96 = 1;
    else
      v96 = 2;
    LODWORD(qword_1000109F4) = v96;
  }
  if ((v119 & 0x8000000) != 0)
  {
    LODWORD(v97) = qword_100010934 | 0x20;
    HIDWORD(v97) = HIDWORD(qword_100010934) & 0xFFFFFFDF;
    qword_100010934 = v97;
  }
  if ((v119 & 0x20000000) != 0)
  {
    LODWORD(v98) = qword_100010934 | 0x100000;
    HIDWORD(v98) = HIDWORD(qword_100010934) & 0xFFEFFFFF;
    qword_100010934 = v98;
  }
  freemntopts(v93);
  if (qword_1000109F4)
    v4[587] |= 0x4000u;
  sub_100009924(a1);
}

void sub_1000068C4()
{
  BOOL v0;
  uint64_t v2;

  if ((_QWORD)xmmword_100010AC8)
    v0 = 0;
  else
    v0 = qword_100010AC0 == 0;
  if (!v0 || *((_QWORD *)&xmmword_100010AC8 + 1) != 0)
  {
    if ((_DWORD)qword_1000109C4)
    {
      if ((int)qword_1000109C4 < 1)
      {
        LODWORD(v2) = 0;
      }
      else
      {
        v2 = 0;
        while ((dword_100010928[v2 + 40] - 390003) >= 3)
        {
          if (qword_1000109C4 == ++v2)
            goto LABEL_18;
        }
      }
      if ((_DWORD)v2 == (_DWORD)qword_1000109C4)
LABEL_18:
        warnx("principal or realm specified but no kerberos is enabled");
    }
    else
    {
      sub_10000A16C();
      warnx("no sec flavors specified for principal or realm, assuming kerberos");
    }
  }
}

uint64_t sub_100006974()
{
  int v0;
  CFTypeRef v1;
  const void *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  BOOL v8;
  const void *ValueAtIndex;
  const __CFDictionary *v10;
  const __CFBoolean *Value;
  const __CFBoolean *v12;
  CFTypeID v13;
  const __CFString *v14;
  const __CFString *v15;
  CFTypeID v16;
  int v17;
  uint64_t result;
  void *v19;
  size_t v20;
  size_t __len;
  char __big[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  if (dword_100010000 != -1)
  {
    *(_DWORD *)__big = dword_100010000;
    sysctlbyname("vfs.generic.nfs.client.access_cache_timeout", 0, 0, __big, 4uLL);
  }
  if (dword_100010004 != -1)
  {
    *(_DWORD *)__big = dword_100010004;
    sysctlbyname("vfs.generic.nfs.client.access_for_getattr", 0, 0, __big, 4uLL);
  }
  if (dword_100010008 != -1)
  {
    *(_DWORD *)__big = dword_100010008;
    sysctlbyname("vfs.generic.nfs.client.allow_async", 0, 0, __big, 4uLL);
  }
  if (dword_10001000C != -1)
  {
    *(_DWORD *)__big = dword_10001000C;
    sysctlbyname("vfs.generic.nfs.client.callback_port", 0, 0, __big, 4uLL);
  }
  if (dword_100010010 != -1)
  {
    *(_DWORD *)__big = dword_100010010;
    sysctlbyname("vfs.generic.nfs.client.initialdowndelay", 0, 0, __big, 4uLL);
  }
  if (dword_100010014 != -1)
  {
    *(_DWORD *)__big = dword_100010014;
    sysctlbyname("vfs.generic.nfs.client.iosize", 0, 0, __big, 4uLL);
  }
  if (dword_100010018 != -1)
  {
    *(_DWORD *)__big = dword_100010018;
    sysctlbyname("vfs.generic.nfs.client.nextdowndelay", 0, 0, __big, 4uLL);
  }
  if (dword_10001001C != -1)
  {
    *(_DWORD *)__big = dword_10001001C;
    sysctlbyname("vfs.generic.nfs.client.nfsiod_thread_max", 0, 0, __big, 4uLL);
  }
  if (dword_100010020 != -1)
  {
    *(_DWORD *)__big = dword_100010020;
    sysctlbyname("vfs.generic.nfs.client.statfs_rate_limit", 0, 0, __big, 4uLL);
  }
  v0 = dword_100010024;
  if (dword_100010024 == -1)
  {
    __len = 128;
    v1 = IOPSCopyPowerSourcesInfo();
    if (!v1)
      goto LABEL_36;
    v2 = v1;
    v3 = IOPSCopyPowerSourcesList(v1);
    if (v3)
    {
      v4 = v3;
      Count = CFArrayGetCount(v3);
      if (Count >= 1)
      {
        v6 = Count;
        v7 = 0;
        v8 = 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
          if (ValueAtIndex)
          {
            v10 = IOPSGetPowerSourceDescription(v2, ValueAtIndex);
            Value = (const __CFBoolean *)CFDictionaryGetValue(v10, CFSTR("Is Present"));
            if (Value)
            {
              v12 = Value;
              v13 = CFGetTypeID(Value);
              if (v13 == CFBooleanGetTypeID())
              {
                if (CFBooleanGetValue(v12))
                {
                  v14 = (const __CFString *)CFDictionaryGetValue(v10, CFSTR("Type"));
                  if (v14)
                  {
                    v15 = v14;
                    v16 = CFGetTypeID(v14);
                    if (v16 == CFStringGetTypeID()
                      && CFStringCompare(v15, CFSTR("InternalBattery"), 0) == kCFCompareEqualTo)
                    {
                      break;
                    }
                  }
                }
              }
            }
          }
          v8 = v6 > ++v7;
        }
        while (v6 != v7);
        CFRelease(v4);
        CFRelease(v2);
        if (v8)
        {
          v0 = 1;
LABEL_39:
          dword_100010024 = v0;
          goto LABEL_40;
        }
LABEL_36:
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        *(_OWORD *)__big = 0u;
        v23 = 0u;
        v17 = sysctlbyname("hw.model", __big, &__len, 0, 0);
        v0 = 0;
        if ((v17 & 0x80000000) == 0 && __len)
          v0 = strnstr(__big, "Book", __len) != 0;
        goto LABEL_39;
      }
      CFRelease(v4);
    }
    CFRelease(v2);
    goto LABEL_36;
  }
LABEL_40:
  *(_DWORD *)__big = v0;
  result = sysctlbyname("vfs.generic.nfs.client.is_mobile", 0, 0, __big, 4uLL);
  if (dword_100010028 != -1)
  {
    *(_DWORD *)__big = dword_100010028;
    result = sysctlbyname("vfs.generic.nfs.client.squishy_flags", 0, 0, __big, 4uLL);
  }
  if (dword_10001002C != -1)
  {
    *(_DWORD *)__big = dword_10001002C;
    result = sysctlbyname("vfs.generic.nfs.client.root_steals_gss_context", 0, 0, __big, 4uLL);
  }
  if (dword_100010030 != -1)
  {
    *(_DWORD *)__big = dword_100010030;
    result = sysctlbyname("vfs.generic.nfs.client.mount_timeout", 0, 0, __big, 4uLL);
  }
  if (dword_100010034 != -1)
  {
    *(_DWORD *)__big = dword_100010034;
    result = sysctlbyname("vfs.generic.nfs.client.mount_quick_timeout", 0, 0, __big, 4uLL);
  }
  v19 = (void *)qword_100010038;
  if (qword_100010038)
  {
    v20 = strnlen((const char *)qword_100010038, 0x400uLL);
    return sysctlbyname("vfs.generic.nfs.client.default_nfs4domain", 0, 0, v19, v20);
  }
  return result;
}

uint64_t sub_100006E20(const char *a1, _QWORD *a2)
{
  char *v3;
  char *v4;
  _OWORD *v5;
  _QWORD *v6;
  const char *v7;
  _OWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  char *v15;
  char *v16;
  _BOOL4 v17;
  int v19;
  _OWORD *v20;
  const char *v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  char v25;
  _QWORD *v26;
  const char *v27;
  char *i;
  int v29;
  char *v30;
  int v31;
  int v32;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v40;
  _QWORD *v41;
  char *v42;
  _QWORD *v43;
  _QWORD v44[3];
  int v45;

  *a2 = 0;
  v3 = strdup(a1);
  if (!v3)
    return 12;
  v4 = v3;
  if (!*v3)
  {
    v35 = 22;
    goto LABEL_96;
  }
  v40 = a2;
  v5 = 0;
  v6 = 0;
  memset(v44, 0, sizeof(v44));
  v7 = "ftp://";
  v45 = 0;
  v42 = v3;
  while (2)
  {
    v41 = v5;
    v8 = malloc_type_malloc(0x20uLL, 0x10300405ED1140EuLL);
    if (!v8)
    {
      v35 = 12;
      v4 = v42;
      if (v6)
        goto LABEL_93;
      goto LABEL_96;
    }
    v5 = v8;
    *v8 = 0u;
    v8[1] = 0u;
    if (!*v4)
      goto LABEL_86;
    v9 = 0;
    v43 = (_QWORD *)v8 + 1;
    while (1)
    {
      v10 = malloc_type_malloc(0x18uLL, 0x30040275E93A9uLL);
      if (!v10)
        goto LABEL_87;
      v11 = v10;
      *v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      if (!strncmp(v4, v7, 6uLL))
      {
        v13 = 0;
        v16 = v4;
        v4 = "localhost";
        goto LABEL_50;
      }
      v12 = *v4;
      if (v12 != 91)
      {
        v13 = 0;
        v14 = 0;
        v16 = v4;
        if (!*v4)
          goto LABEL_49;
        goto LABEL_28;
      }
      v13 = 0;
      v14 = 0;
      v15 = v4;
LABEL_11:
      v16 = v15 + 2;
      while (1)
      {
        v17 = (*(v16 - 1) & 0x80000000) == 0 && _DefaultRuneLocale.__runetype[*(v16 - 1)] & 0x10000;
        v12 = *(v16 - 1);
        if (v12 != 58 && !v17)
          break;
        ++v16;
        if (v12 == 58)
        {
          v15 = v16 - 2;
          if (!v13)
            v13 = (unsigned __int8 *)(v16 - 2);
          if (!v14)
          {
            if (*(v16 - 1) == 47)
              v14 = (unsigned __int8 *)(v16 - 2);
            else
              v14 = 0;
          }
          goto LABEL_11;
        }
      }
      v20 = v5;
      v21 = v7;
      v22 = (unsigned __int8 *)(v16 - 1);
      if (v12 != 93)
      {
        --v16;
        goto LABEL_48;
      }
      v23 = *v16;
      if (v23 == 44 || v23 == 58)
      {
        *v22 = 0;
        v24 = inet_pton(30, v4 + 1, v44);
        *v22 = 93;
        if (v24)
        {
          v7 = v21;
          v5 = v20;
          goto LABEL_50;
        }
        v12 = *v16;
LABEL_48:
        v7 = v21;
        v5 = v20;
        if (!v12)
          goto LABEL_49;
        goto LABEL_28;
      }
      v12 = 93;
      --v16;
      v7 = v21;
      v5 = v20;
      if (v13)
      {
LABEL_29:
        if (v14)
          goto LABEL_50;
      }
      while (1)
      {
        if (v12 == 58)
        {
          if (!v13)
            v13 = (unsigned __int8 *)v16;
          if (!v14 && v16[1] == 47)
            goto LABEL_50;
        }
        else if (v12 == 44)
        {
          goto LABEL_50;
        }
        v19 = *++v16;
        v12 = v19;
        if (!v19)
          break;
LABEL_28:
        if (v13)
          goto LABEL_29;
      }
LABEL_49:
      v16 = (char *)v13;
      if (!v13)
      {
        v35 = 22;
        goto LABEL_91;
      }
LABEL_50:
      v25 = *v16;
      *v16 = 0;
      v11[1] = strdup(v4);
      *v16 = v25;
      if (!v11[1])
      {
        v35 = 12;
LABEL_91:
        free(v5);
        goto LABEL_92;
      }
      v26 = v43;
      if (v9)
        v26 = v9;
      *v26 = v11;
      ++*((_DWORD *)v5 + 6);
      if (*v16 != 44)
        break;
      v4 = v16 + 1;
      v9 = v11;
      if (!v16[1])
        goto LABEL_86;
    }
    if (!strncmp(v16, v7, 6uLL))
      v27 = v16;
    else
      v27 = v16 + 1;
    if (!*v27)
    {
      if (!v13)
      {
LABEL_86:
        v35 = 22;
        goto LABEL_88;
      }
      v27 = (const char *)(v13 + 1);
    }
    for (i = (char *)v27; ; ++i)
    {
      v29 = *i;
      if (!*i)
        break;
      if (v29 == 44)
      {
        v30 = i;
        do
        {
          v32 = *++v30;
          v31 = v32;
        }
        while (v32 != 58 && v31 != 0);
        if (!v31)
          i = v30;
        v29 = *i;
        break;
      }
    }
    *i = 0;
    *((_QWORD *)v5 + 2) = strdup(v27);
    *i = v29;
    if (*((_QWORD *)v5 + 2))
    {
      v34 = v5;
      if (v41)
      {
        *v41 = v5;
        v29 = *i;
        v34 = v6;
      }
      if (v29 == 44)
        v4 = i + 1;
      else
        v4 = i;
      v6 = v34;
      if (!*v4)
      {
        if (!v34)
        {
          v35 = 22;
          v4 = v42;
          goto LABEL_96;
        }
        free(v42);
        v35 = 0;
        *v40 = v34;
        return v35;
      }
      continue;
    }
    break;
  }
LABEL_87:
  v35 = 12;
LABEL_88:
  v11 = v5;
LABEL_92:
  v4 = v42;
  free(v11);
  if (v6)
  {
    do
    {
LABEL_93:
      v36 = (_QWORD *)v6[1];
      if (v36)
      {
        do
        {
          v37 = (_QWORD *)*v36;
          free(v36);
          v6[1] = v37;
          v36 = v37;
        }
        while (v37);
      }
      v38 = (_QWORD *)*v6;
      free(v6);
      v6 = v38;
    }
    while (v38);
  }
LABEL_96:
  free(v4);
  return v35;
}

uint64_t sub_100007264(uint64_t result, _DWORD *a2)
{
  _QWORD *v3;
  _QWORD *i;

  *a2 = 0;
  if (result)
  {
    v3 = (_QWORD *)result;
    do
    {
      for (i = (_QWORD *)v3[1]; i; i = (_QWORD *)*i)
      {
        result = sub_100009A64((uint64_t)i);
        if (!(_DWORD)result)
        {
          if (i[2])
            ++*a2;
        }
      }
      v3 = (_QWORD *)*v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_1000072CC(uint64_t **a1, const char *a2)
{
  int v3;
  const char **v4;
  int v5;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t **v11;
  uint64_t *v12;
  int v13;
  const void *v14;
  uint64_t v15;
  const char *v16;
  int v17;
  __int16 v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  int v30;
  const char *v31;
  char v32;
  int v33;
  int v34;
  int v35;
  int v36;
  char v37;
  const char *v38;
  const char *v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  uint64_t i;
  int v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  unsigned int v62;
  const char *v63;
  int v64;
  char v65;
  int v66;
  int v67;
  int v68;
  const char *v69;
  const char *v70;
  char v72[16];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;

  printf("mount %s on %s\n", (const char *)qword_100010910, a2);
  v3 = dword_100010928[0];
  printf("mount flags: 0x%x", dword_100010928[0]);
  if (v3)
  {
    v4 = (const char **)&off_10000C298;
    do
    {
      v5 = *((_DWORD *)v4 - 2);
      if (!v5)
        break;
      if ((v5 & v3) != 0)
      {
        printf(", %s", *v4);
        v3 &= ~v5;
      }
      v4 += 2;
    }
    while (v3);
  }
  putchar(10);
  if (dword_1000109F8 > 1)
  {
    if (dword_1000109F8 != 2 && dword_1000109F8 != 30)
      goto LABEL_23;
  }
  else if (dword_1000109F8)
  {
    if (dword_1000109F8 == 1)
      printf("socket: type:%s");
    goto LABEL_23;
  }
  v7 = "any";
  if (HIDWORD(xmmword_1000109E8) == 2)
    v7 = "udp";
  if (HIDWORD(xmmword_1000109E8) == 1)
    v8 = "tcp";
  else
    v8 = v7;
  printf("socket: type:%s", v8);
  if (dword_1000109F8)
    printf("%s%s");
LABEL_23:
  v9 = qword_10001092C;
  if ((qword_10001092C & 0x8000) != 0)
  {
    printf(",port=%d", dword_1000109FC);
    v9 = qword_10001092C;
  }
  if ((v9 & 0x10000) != 0)
    printf(",mountport=%d", dword_100010A00);
  if ((qword_100010934 & 0x10000) != 0 || dword_100010920 >= 2)
  {
    if ((qword_100010934 & 0x1000000000000) != 0)
      v10 = (const char *)&unk_10000B33F;
    else
      v10 = "no";
    printf(",%smntudp", v10);
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  *(_OWORD *)v72 = 0u;
  v73 = 0u;
  putchar(10);
  puts("file system locations:");
  if (a1)
  {
    while (1)
    {
      puts((const char *)a1[2]);
      v11 = (uint64_t **)a1[1];
      if (v11)
        break;
LABEL_46:
      a1 = (uint64_t **)*a1;
      if (!a1)
        goto LABEL_47;
    }
    while (1)
    {
      printf("  %s\n", (const char *)v11[1]);
      v12 = v11[2];
      if (v12)
        break;
LABEL_45:
      v11 = (uint64_t **)*v11;
      if (!v11)
        goto LABEL_46;
    }
    while (1)
    {
      v13 = *((_DWORD *)v12 + 1);
      if (v13 == 1)
      {
        printf("    local transport %s\n");
      }
      else
      {
        if (v13 == 30)
        {
          v14 = (const void *)(v12[4] + 8);
        }
        else
        {
          if (v13 != 2)
          {
            puts("    ??? ???");
            goto LABEL_44;
          }
          v14 = (const void *)(v12[4] + 4);
        }
        inet_ntop(v13, v14, v72, 0x80u);
        printf("    %s %s\n");
      }
LABEL_44:
      v12 = (uint64_t *)v12[5];
      if (!v12)
        goto LABEL_45;
    }
  }
LABEL_47:
  if ((qword_10001092C & 0x100000) != 0)
  {
    printf("fh %d ", dword_100010A38);
    if (dword_100010A38 >= 1)
    {
      v15 = 0;
      do
        printf("%02x", *((unsigned __int8 *)&dword_100010A38 + v15++ + 4));
      while (v15 < dword_100010A38);
    }
    putchar(10);
  }
  printf("NFS options:");
  if ((dword_10001091C & 1) != 0)
    v16 = "bg";
  else
    v16 = "fg";
  printf(" %s,retrycnt=%d", v16, dword_1000108F8);
  v17 = qword_10001092C;
  if ((qword_10001092C & 2) != 0)
  {
    printf(",vers=%d", (_DWORD)xmmword_10001093C);
    v17 = qword_10001092C;
    if ((qword_10001092C & 4) != 0)
    {
      printf(".%d", DWORD1(xmmword_10001093C));
      v17 = qword_10001092C;
    }
  }
  if ((v17 & 0x8000000) != 0)
  {
    printf(",vers=%d", HIWORD(xmmword_10001093C));
    if (WORD6(xmmword_10001093C))
      printf(".%d", WORD6(xmmword_10001093C));
    printf("-%d", WORD5(xmmword_10001093C));
    if (WORD4(xmmword_10001093C))
      printf(".%d", WORD4(xmmword_10001093C));
  }
  v18 = qword_100010934;
  if ((qword_100010934 & 1) != 0 || (v19 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x100000000) != 0)
      v20 = "soft";
    else
      v20 = "hard";
    printf(",%s", v20);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 2) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x200000000) != 0)
      v21 = (const char *)&unk_10000B33F;
    else
      v21 = "no";
    printf(",%sintr", v21);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 4) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x400000000) != 0)
      v22 = (const char *)&unk_10000B33F;
    else
      v22 = "no";
    printf(",%sresvport", v22);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 8) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x800000000) != 0)
      v23 = "no";
    else
      v23 = (const char *)&unk_10000B33F;
    printf(",%sconn", v23);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 0x400) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x40000000000) != 0)
      v24 = "no";
    else
      v24 = (const char *)&unk_10000B33F;
    printf(",%scallback", v24);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 0x80) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x8000000000) != 0)
      v25 = "no";
    else
      v25 = (const char *)&unk_10000B33F;
    printf(",%snegnamecache", v25);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 0x800) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x80000000000) != 0)
      v26 = (const char *)&unk_10000B33F;
    else
      v26 = "no";
    printf(",%snamedattr", v26);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 0x1000) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x100000000000) != 0)
      v27 = "no";
    else
      v27 = (const char *)&unk_10000B33F;
    printf(",%sacl", v27);
    v18 = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 0x2000) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x200000000000) != 0)
      v28 = (const char *)&unk_10000B33F;
    else
      v28 = "no";
    printf(",%saclonly", v28);
    LOBYTE(v18) = qword_100010934;
    v19 = dword_100010920;
  }
  if ((v18 & 0x20) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x2000000000) != 0)
      v29 = (const char *)&unk_10000B33F;
    else
      v29 = "no";
    printf(",%scallumnt", v29);
    v19 = dword_100010920;
  }
  if (((qword_10001092C & 0x800) != 0 || v19 >= 2) && dword_1000109C0 <= 2)
    printf((&off_10000C400)[dword_1000109C0]);
  if ((qword_100010934 & 0x8000) != 0 || (v30 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x800000000000) != 0)
      v31 = "no";
    else
      v31 = (const char *)&unk_10000B33F;
    printf(",%squota", v31);
    v30 = dword_100010920;
  }
  v32 = qword_10001092C;
  if ((qword_10001092C & 8) != 0 || v30 >= 2)
  {
    if ((qword_10001092C & 8) != 0)
      v33 = dword_10001094C;
    else
      v33 = 0x8000;
    printf(",rsize=%d", v33);
    v32 = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v32 & 0x10) != 0 || v30 >= 2)
  {
    if ((v32 & 0x10) != 0)
      v34 = dword_100010950;
    else
      v34 = 0x8000;
    printf(",wsize=%d", v34);
    v32 = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v32 & 0x40) != 0 || v30 >= 2)
  {
    if ((v32 & 0x40) != 0)
      v35 = dword_100010958;
    else
      v35 = 16;
    printf(",readahead=%d", v35);
    v32 = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v32 & 0x20) != 0 || v30 >= 2)
  {
    if ((v32 & 0x20) != 0)
      v36 = dword_100010954;
    else
      v36 = 0x8000;
    printf(",dsize=%d", v36);
    v30 = dword_100010920;
  }
  v37 = qword_100010934;
  if ((qword_100010934 & 0x40) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x4000000000) != 0)
      v38 = (const char *)&unk_10000B33F;
    else
      v38 = "no";
    printf(",%srdirplus", v38);
    v37 = qword_100010934;
    v30 = dword_100010920;
  }
  if ((v37 & 0x10) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x1000000000) != 0)
      v39 = (const char *)&unk_10000B33F;
    else
      v39 = "no";
    printf(",%sdumbtimer", v39);
    v30 = dword_100010920;
  }
  v40 = qword_10001092C;
  if ((qword_10001092C & 0x20000) != 0 || v30 >= 2)
  {
    if ((qword_10001092C & 0x20000) != 0)
      v41 = *((_QWORD *)&xmmword_100010A08 + 1) % 100000000 + 10 * xmmword_100010A08;
    else
      v41 = 10;
    printf(",timeo=%ld", v41);
    v40 = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v40 & 0x40000) != 0 || v30 >= 2)
  {
    if ((v40 & 0x40000) != 0)
      v42 = dword_100010A18;
    else
      v42 = 10;
    printf(",retrans=%d", v42);
    LOWORD(v40) = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v40 & 0x2000) != 0 || v30 >= 2)
  {
    if ((v40 & 0x2000) != 0)
      v43 = DWORD2(xmmword_1000109E8);
    else
      v43 = 16;
    printf(",maxgroups=%d", v43);
    LOWORD(v40) = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v40 & 0x80) != 0 || v30 >= 2)
  {
    v44 = *(_QWORD *)&dword_100010960;
    if ((v40 & 0x80) == 0)
      v44 = 5;
    printf(",acregmin=%ld", v44);
    LOWORD(v40) = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v40 & 0x100) != 0 || v30 >= 2)
  {
    v45 = *((_QWORD *)&xmmword_100010968 + 1);
    if ((v40 & 0x100) == 0)
      v45 = 60;
    printf(",acregmax=%ld", v45);
    LOWORD(v40) = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v40 & 0x200) != 0 || v30 >= 2)
  {
    v46 = *(_QWORD *)&dword_100010980;
    if ((v40 & 0x200) == 0)
      v46 = 5;
    printf(",acdirmin=%ld", v46);
    LOWORD(v40) = qword_10001092C;
    v30 = dword_100010920;
  }
  if ((v40 & 0x400) != 0 || v30 >= 2)
  {
    v47 = *((_QWORD *)&xmmword_100010988 + 1);
    if ((v40 & 0x400) == 0)
      v47 = 60;
    printf(",acdirmax=%ld", v47);
    v30 = dword_100010920;
  }
  v48 = BYTE4(qword_10001092C);
  if ((qword_10001092C & 0x200000000) != 0 || v30 >= 2)
  {
    v49 = qword_1000109A0;
    if ((qword_10001092C & 0x200000000) == 0)
      v49 = 5;
    printf(",acrootdirmin=%ld", v49);
    v48 = BYTE4(qword_10001092C);
    v30 = dword_100010920;
  }
  if ((v48 & 4) != 0 || v30 >= 2)
  {
    v50 = *((_QWORD *)&xmmword_1000109A8 + 1);
    if ((v48 & 4) == 0)
      v50 = 60;
    printf(",acrootdirmax=%ld", v50);
    v30 = dword_100010920;
  }
  if ((qword_10001092C & 0x80000) != 0 || v30 >= 2)
  {
    v51 = xmmword_100010A28;
    if ((qword_10001092C & 0x80000) == 0)
      v51 = 0;
    printf(",deadtimeout=%ld", v51);
    v30 = dword_100010920;
  }
  v52 = qword_100010934;
  if ((qword_100010934 & 0x100) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x10000000000) != 0)
      v53 = (const char *)&unk_10000B33F;
    else
      v53 = "no";
    printf(",%smutejukebox", v53);
    v52 = qword_100010934;
    v30 = dword_100010920;
  }
  if ((v52 & 0x200) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x20000000000) != 0)
      v54 = (const char *)&unk_10000B33F;
    else
      v54 = "no";
    printf(",%sephemeral", v54);
    v52 = qword_100010934;
    v30 = dword_100010920;
  }
  if ((v52 & 0x4000) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x400000000000) != 0)
      v55 = (const char *)&unk_10000B33F;
    else
      v55 = "no";
    printf(",%snfc", v55);
  }
  if ((qword_10001092C & 0x1000) == 0)
    goto LABEL_267;
  if (SHIDWORD(qword_1000109C4) <= 390002)
  {
    if (!HIDWORD(qword_1000109C4))
    {
      v56 = "none";
      goto LABEL_253;
    }
    if (HIDWORD(qword_1000109C4) == 1)
    {
      v56 = "sys";
      goto LABEL_253;
    }
  }
  else
  {
    switch(HIDWORD(qword_1000109C4))
    {
      case 0x5F373:
        v56 = "krb5";
        goto LABEL_253;
      case 0x5F374:
        v56 = "krb5i";
        goto LABEL_253;
      case 0x5F375:
        v56 = "krb5p";
        goto LABEL_253;
    }
  }
  v56 = "?";
LABEL_253:
  printf(",sec=%s", v56);
  if ((int)qword_1000109C4 >= 2)
  {
    for (i = 41; i - 40 < (int)qword_1000109C4; ++i)
    {
      v58 = dword_100010928[i];
      if (v58 <= 390002)
      {
        v59 = "none";
        if (v58)
        {
          if (v58 != 1)
          {
LABEL_265:
            v59 = "?";
            goto LABEL_266;
          }
          v59 = "sys";
        }
      }
      else
      {
        switch(v58)
        {
          case 390003:
            v59 = "krb5";
            break;
          case 390004:
            v59 = "krb5i";
            break;
          case 390005:
            v59 = "krb5p";
            break;
          default:
            goto LABEL_265;
        }
      }
LABEL_266:
      printf(":%s", v59);
    }
  }
LABEL_267:
  if ((qword_10001092C & 0x10000000) != 0)
  {
    v60 = (dword_1000109E4 - 16) > 2 ? "?" : (&off_10000C418)[dword_1000109E4 - 16];
    printf(",etype=%s", v60);
    if (qword_1000109DC >= 2)
    {
      v61 = 48;
      do
      {
        v62 = dword_100010928[v61] - 16;
        v63 = "?";
        if (v62 <= 2)
          v63 = (&off_10000C418)[v62];
        ++v61;
        printf(":%s", v63);
      }
      while (v61 - 47 < (unint64_t)qword_1000109DC);
    }
  }
  v64 = qword_10001092C;
  if ((qword_10001092C & 0x1000000) != 0)
  {
    printf(",realm=%s", (const char *)qword_100010AC0);
    v64 = qword_10001092C;
  }
  if ((v64 & 0x2000000) != 0)
  {
    printf(",principal=%s", (const char *)xmmword_100010AC8);
    v64 = qword_10001092C;
  }
  if ((v64 & 0x4000000) != 0)
    printf(",sprincipal=%s", *((const char **)&xmmword_100010AC8 + 1));
  v65 = BYTE4(qword_10001092C);
  if ((qword_10001092C & 0x100000000) != 0 || dword_100010920 >= 2)
  {
    if ((qword_10001092C & 0x100000000) != 0)
      v66 = dword_100010A1C;
    else
      v66 = 0;
    printf(",readlink_nocache=%d", v66);
    v65 = BYTE4(qword_10001092C);
  }
  if ((v65 & 8) != 0)
    printf(",accesscache=%d", dword_100010A20);
  v67 = qword_100010934;
  if ((qword_100010934 & 0x80000) != 0 || (v68 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x8000000000000) != 0)
      v69 = "no";
    else
      v69 = (const char *)&unk_10000B33F;
    printf(",%sopaque_auth", v69);
    v67 = qword_100010934;
    v68 = dword_100010920;
  }
  if ((v67 & 0x100000) != 0 || v68 >= 2)
  {
    if ((qword_100010934 & 0x10000000000000) != 0)
      v70 = (const char *)&unk_10000B33F;
    else
      v70 = "no";
    printf(",%sskip_renew", v70);
  }
  return putchar(10);
}

uint64_t sub_1000081FC(uint64_t a1, _QWORD *a2)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  BOOL v20;
  size_t v21;
  unsigned int v22;
  _QWORD *v23;
  uint64_t **v24;
  size_t v25;
  uint64_t *v26;
  unsigned int v27;
  uint64_t *v28;
  unsigned __int8 *v29;
  int v30;
  int v32;
  const void *v33;
  const void *v34;
  const void *v35;
  uint64_t v36;
  int v37;
  size_t v38;
  size_t v39;
  size_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  unsigned int i;
  uint64_t v47;
  int v48;
  int v49;
  char *v50;
  int v51;
  int v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  int v56;
  int v57;
  size_t v58;
  size_t v59;
  size_t v60;
  size_t v61;
  size_t v62;
  size_t v63;
  char v64;
  uint64_t v65;
  int v66;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  unsigned int __src;
  void *v73[2];
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80[8];
  uint64_t v81;
  char __s[16];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;

  *a2 = 0;
  v3 = qword_10001092C;
  v4 = qword_10001092C | 0x600000;
  v79 = qword_10001092C | 0x600000;
  if ((_DWORD)qword_100010AE8 && qword_100010910 && !strncmp((const char *)qword_100010910, "ftp://", 6uLL))
  {
    v4 = v3 | 0xE00000;
    LODWORD(v79) = v3 | 0xE00000;
  }
  if ((_DWORD)qword_100010934)
  {
    v4 |= 1u;
    LODWORD(v79) = v4;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v85 = 0u;
  v83 = 0u;
  v84 = 0u;
  *(_OWORD *)__s = 0u;
  *(_QWORD *)v80 = 0;
  v81 = 0;
  v78 = 0x100000001;
  v73[0] = 0;
  v73[1] = 0;
  v76 = 0;
  v77 = 512;
  v74 = 0;
  v75 = 0;
  __src = 1476395008;
  v5 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  if ((_DWORD)v78 == 1)
    v6 = v75 - (char *)v73[0];
  else
    v6 = 0;
  v70 = v6;
  if (!(_DWORD)v5)
  {
    __src = 0;
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((_DWORD)v7)
      goto LABEL_14;
    __src = 0;
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((_DWORD)v7)
      goto LABEL_14;
    __src = 0x2000000;
    v5 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
  v7 = v5;
LABEL_14:
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v9;
    if (!(_DWORD)v7)
    {
      __src = bswap32(*(_DWORD *)&v80[4 * v8 - 8]);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
    v9 = 0;
    v8 = 1;
  }
  while ((v10 & 1) != 0);
  if ((_DWORD)v78 == 1)
    v11 = v75 - (char *)v73[0];
  else
    v11 = 0;
  v69 = v11;
  if ((_DWORD)v7)
  {
    if ((v4 & 1) == 0)
      goto LABEL_30;
  }
  else
  {
    __src = 0;
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 1) == 0)
      goto LABEL_30;
  }
  if (!(_DWORD)v7)
  {
    __src = 0x1000000;
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(qword_100010934);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        __src = 0x1000000;
        v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
        if (!(_DWORD)v7)
        {
          __src = bswap32(HIDWORD(qword_100010934));
          v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
        }
      }
    }
  }
LABEL_30:
  if ((v4 & 2) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(xmmword_10001093C);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 4) == 0)
      goto LABEL_36;
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_36;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(DWORD1(xmmword_10001093C));
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
LABEL_36:
  if ((v4 & 0x8000000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(HIDWORD(xmmword_10001093C));
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(DWORD2(xmmword_10001093C));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 8) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_10001094C);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x10) == 0)
      goto LABEL_46;
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_46;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(dword_100010950);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
LABEL_46:
  if ((v4 & 0x20) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010954);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x40) == 0)
      goto LABEL_52;
  }
  else if ((v4 & 0x40) == 0)
  {
    goto LABEL_52;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(dword_100010958);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
LABEL_52:
  if ((v4 & 0x80) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010960);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(xmmword_100010968);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x100) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(DWORD2(xmmword_100010968));
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(dword_100010978);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x200) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010980);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(xmmword_100010988);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x400) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(DWORD2(xmmword_100010988));
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(dword_100010998);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x800) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_1000109C0);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x1000) == 0)
      goto LABEL_80;
  }
  else if ((v4 & 0x1000) == 0)
  {
    goto LABEL_80;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(qword_1000109C4);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
  v12 = qword_1000109C4;
  if ((_DWORD)qword_1000109C4)
  {
    v13 = 0;
    do
    {
      if (!(_DWORD)v7)
      {
        __src = bswap32(*((_DWORD *)&qword_1000109C4 + v13 + 1));
        v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
        v12 = qword_1000109C4;
      }
      ++v13;
    }
    while (v13 < v12);
  }
LABEL_80:
  if ((v4 & 0x10000000) != 0)
  {
    if (!(_DWORD)v7)
    {
      __src = bswap32(qword_1000109DC);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        __src = bswap32(HIDWORD(qword_1000109DC));
        v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      }
    }
    v14 = qword_1000109DC;
    if ((_DWORD)qword_1000109DC)
    {
      v15 = 0;
      do
      {
        if (!(_DWORD)v7)
        {
          __src = bswap32(*((_DWORD *)&qword_1000109DC + v15 + 2));
          v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
          v14 = qword_1000109DC;
        }
        ++v15;
      }
      while (v15 < v14);
    }
  }
  if ((v4 & 0x2000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(unk_1000109F0);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x4000) == 0)
      goto LABEL_122;
  }
  else if ((v4 & 0x4000) == 0)
  {
    goto LABEL_122;
  }
  if (SHIDWORD(qword_1000109F4) > 1)
  {
    if (HIDWORD(qword_1000109F4) != 2 && HIDWORD(qword_1000109F4) != 30)
      goto LABEL_116;
    goto LABEL_99;
  }
  if (!HIDWORD(qword_1000109F4))
  {
LABEL_99:
    v17 = (const char *)&unk_10000B33F;
    if (HIDWORD(qword_1000109F4) == 2)
      v17 = "4";
    if (HIDWORD(qword_1000109F4) == 30)
      v18 = "6";
    else
      v18 = v17;
    v19 = "inet";
    if ((_DWORD)qword_1000109F4)
    {
      if ((_DWORD)qword_1000109F4 == 2)
        v19 = "udp";
      v20 = (_DWORD)qword_1000109F4 == 1;
    }
    else
    {
      if (dword_100010918 == 17)
        v19 = "udp";
      v20 = dword_100010918 == 6;
    }
    if (v20)
      v19 = "tcp";
    snprintf(byte_100010B04, 0x10uLL, "%s%s", v19, v18);
    goto LABEL_116;
  }
  if (HIDWORD(qword_1000109F4) == 1)
  {
    if ((_DWORD)qword_1000109F4 == 2)
      v16 = "ticlts";
    else
      v16 = "ticotsord";
    __strlcpy_chk(byte_100010B04, v16, 16, 16);
    if ((_DWORD)v7)
      goto LABEL_122;
    goto LABEL_117;
  }
LABEL_116:
  if ((_DWORD)v7)
    goto LABEL_122;
LABEL_117:
  __src = bswap32(strlen(byte_100010B04));
  v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  if (!(_DWORD)v7)
  {
    v21 = strlen(byte_100010B04);
    v7 = sub_100003B50((uint64_t)v73, byte_100010B04, v21, 0);
  }
LABEL_122:
  if ((v4 & 0x8000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_1000109FC);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x10000) == 0)
      goto LABEL_128;
  }
  else if ((v4 & 0x10000) == 0)
  {
    goto LABEL_128;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(dword_100010A00);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
LABEL_128:
  if ((v4 & 0x20000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(xmmword_100010A08);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(DWORD2(xmmword_100010A08));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x40000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010A18);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x80000) == 0)
      goto LABEL_139;
  }
  else if ((v4 & 0x80000) == 0)
  {
    goto LABEL_139;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(xmmword_100010A28);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(DWORD2(xmmword_100010A28));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
LABEL_139:
  if ((v4 & 0x100000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010A38);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
      v7 = sub_100003B50((uint64_t)v73, byte_100010A3C, dword_100010A38, 0);
  }
  v22 = 0;
  if (a1)
  {
    v23 = (_QWORD *)a1;
    do
    {
      ++v22;
      v23 = (_QWORD *)*v23;
    }
    while (v23);
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(v22);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
  if (!a1)
    goto LABEL_224;
  do
  {
    if (!(_DWORD)v7)
    {
      __src = bswap32(*(_DWORD *)(a1 + 24));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
    v71 = (uint64_t *)a1;
    v24 = *(uint64_t ***)(a1 + 8);
    if (v24)
    {
      while (1)
      {
        __src = 0;
        if (!(_DWORD)v7)
        {
          __src = bswap32(strlen((const char *)v24[1]));
          v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
          if (!(_DWORD)v7)
          {
            v25 = strlen((const char *)v24[1]);
            v7 = sub_100003B50((uint64_t)v73, (char *)v24[1], v25, 0);
          }
        }
        v26 = v24[2];
        if (v26)
        {
          v27 = 0;
          v28 = v24[2];
          do
          {
            ++v27;
            v28 = (uint64_t *)v28[5];
          }
          while (v28);
          if ((_DWORD)v7)
          {
LABEL_159:
            if (v26)
              break;
            goto LABEL_190;
          }
        }
        else
        {
          v27 = 0;
          if ((_DWORD)v7)
            goto LABEL_159;
        }
        __src = bswap32(v27);
        v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
        v26 = v24[2];
        if (v26)
          break;
LABEL_190:
        if (!(_DWORD)v7)
        {
          __src = 0;
          v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
        }
        v24 = (uint64_t **)*v24;
        if (!v24)
          goto LABEL_193;
      }
      while (1)
      {
        v29 = (unsigned __int8 *)v26[4];
        v30 = v29[1];
        if (v30 != 30 && v30 != 2)
          break;
        v32 = *((_DWORD *)v26 + 1);
        v33 = v29 + 4;
        v34 = v29 + 8;
        if (v32 == 2)
          v35 = v33;
        else
          v35 = v34;
        if (inet_ntop(v32, v35, __s, 0x80u) != __s)
        {
          warn("unable to convert server address to string");
          v7 = *__error();
        }
        if (*((_DWORD *)v26 + 1) != 30)
          goto LABEL_180;
        v36 = v26[4];
        v37 = *(_DWORD *)(v36 + 24);
        if (!v37)
          goto LABEL_180;
        if (if_indextoname(*(_DWORD *)(v36 + 24), v80))
        {
          v38 = strlen(__s);
          if (128 - v38 >= 0x10)
            v39 = 16;
          else
            v39 = 128 - v38;
          snprintf(&__s[v38], v39, "%%%s", v80);
          if (!(_DWORD)v7)
          {
LABEL_181:
            __src = bswap32(strlen(__s));
            v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
            if (!(_DWORD)v7)
            {
              v40 = strlen(__s);
              v7 = sub_100003B50((uint64_t)v73, __s, v40, 0);
            }
          }
        }
        else
        {
          warn("unable to convert scope_id %u to interface name", v37);
          v7 = *__error();
          if (!(_DWORD)v7)
            goto LABEL_181;
        }
LABEL_183:
        v26 = (uint64_t *)v26[5];
        if (!v26)
          goto LABEL_190;
      }
      if (v30 != 1)
      {
        warn("Unsupported addres family %d", v29[1]);
        v7 = 45;
        goto LABEL_183;
      }
      __strlcpy_chk(__s, v29 + 2, 128, 128);
LABEL_180:
      if (!(_DWORD)v7)
        goto LABEL_181;
      goto LABEL_183;
    }
LABEL_193:
    v41 = v71;
    v42 = v71[2];
    v43 = v42 - 1;
    do
    {
      v45 = *(unsigned __int8 *)++v43;
      v44 = v45;
    }
    while (v45 == 47);
    for (i = 0; v44; ++i)
    {
      v47 = v43--;
      while (v44 != 47 && v44)
      {
        v48 = *(unsigned __int8 *)++v47;
        v44 = v48;
        ++v43;
      }
      do
      {
        v49 = *(unsigned __int8 *)++v43;
        v44 = v49;
      }
      while (v49 == 47);
    }
    if (!(_DWORD)v7)
    {
      __src = bswap32(i);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      v42 = v71[2];
    }
    v50 = (char *)(v42 - 1);
    do
    {
      v52 = *++v50;
      v51 = v52;
    }
    while (v52 == 47);
    if (v51)
    {
      while (1)
      {
        v53 = 0;
        v54 = v50 - 1;
        while ((_BYTE)v51 && v51 != 47)
        {
          LOBYTE(v51) = v50[++v53];
          ++v54;
        }
        if ((_DWORD)v7)
          break;
        __src = bswap32(v53);
        v55 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
        if ((_DWORD)v55 || (v55 = sub_100003B50((uint64_t)v73, v50, v53, 0), (_DWORD)v55))
        {
          v7 = v55;
          break;
        }
        v50 = v54;
        v41 = v71;
        do
        {
          v56 = *++v50;
          v51 = v56;
        }
        while (v56 == 47);
        if (!v51)
          goto LABEL_208;
        v7 = 0;
      }
      v41 = v71;
    }
    else if (!(_DWORD)v7)
    {
LABEL_208:
      __src = 0;
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
    a1 = *v41;
  }
  while (a1);
LABEL_224:
  if (!(_DWORD)v7)
  {
    __src = bswap32(dword_100010928[0]);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }
  v57 = v79;
  if ((v79 & 0x800000) != 0)
  {
    __src = 0;
    if (!(_DWORD)v7)
    {
      __src = bswap32(strlen((const char *)qword_100010910));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        v58 = strlen((const char *)qword_100010910);
        v7 = sub_100003B50((uint64_t)v73, (char *)qword_100010910, v58, 0);
      }
    }
  }
  if ((v57 & 0x1000000) != 0)
  {
    __src = 0;
    if (!(_DWORD)v7)
    {
      __src = bswap32(strlen((const char *)qword_100010AC0));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        v59 = strlen((const char *)qword_100010AC0);
        v7 = sub_100003B50((uint64_t)v73, (char *)qword_100010AC0, v59, 0);
      }
    }
  }
  if ((v57 & 0x2000000) != 0)
  {
    __src = 0;
    if (!(_DWORD)v7)
    {
      __src = bswap32(strlen((const char *)xmmword_100010AC8));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        v60 = strlen((const char *)xmmword_100010AC8);
        v7 = sub_100003B50((uint64_t)v73, (char *)xmmword_100010AC8, v60, 0);
      }
    }
  }
  if ((v57 & 0x4000000) != 0)
  {
    __src = 0;
    if (!(_DWORD)v7)
    {
      __src = bswap32(strlen(*((const char **)&xmmword_100010AC8 + 1)));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        v61 = strlen(*((const char **)&xmmword_100010AC8 + 1));
        v7 = sub_100003B50((uint64_t)v73, *((char **)&xmmword_100010AC8 + 1), v61, 0);
      }
    }
  }
  if ((v57 & 0x20000000) != 0)
  {
    __src = 0;
    if (!(_DWORD)v7)
    {
      __src = bswap32(strlen((const char *)xmmword_100010AD8));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        v62 = strlen((const char *)xmmword_100010AD8);
        v7 = sub_100003B50((uint64_t)v73, (char *)xmmword_100010AD8, v62, 0);
      }
    }
  }
  if ((v57 & 0x40000000) != 0)
  {
    __src = 0;
    if (!(_DWORD)v7)
    {
      __src = bswap32(strlen(*((const char **)&xmmword_100010AD8 + 1)));
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        v63 = strlen(*((const char **)&xmmword_100010AD8 + 1));
        v7 = sub_100003B50((uint64_t)v73, *((char **)&xmmword_100010AD8 + 1), v63, 0);
      }
    }
  }
  v64 = BYTE4(v79);
  if ((v79 & 0x100000000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010A1C);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v64 & 2) == 0)
      goto LABEL_257;
  }
  else if ((v79 & 0x200000000) == 0)
  {
    goto LABEL_257;
  }
  if (!(_DWORD)v7)
  {
    __src = bswap32(qword_1000109A0);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(xmmword_1000109A8);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
LABEL_257:
  if ((v64 & 4) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(DWORD2(xmmword_1000109A8));
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(dword_1000109B8);
      v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v64 & 8) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_100010A20);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((_DWORD)v7)
      goto LABEL_274;
  }
  else if ((_DWORD)v7)
  {
    goto LABEL_274;
  }
  if ((_DWORD)v78 == 1)
  {
    v65 = v75 - (char *)v73[0];
    v66 = v70;
    v74 = v65;
    v75 = (char *)v73[0] + v70;
    v76 = v65 - v70;
  }
  else
  {
    LODWORD(v65) = 0;
    v66 = v70;
  }
  __src = bswap32(v65 - v66 + 4);
  v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
  if (!(_DWORD)v7)
  {
    if ((_DWORD)v78 == 1)
    {
      v75 = (char *)v73[0] + v69;
      v76 = v74 - v69;
    }
    __src = bswap32(v65 - v69 - 4);
    v7 = sub_100003B50((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      *a2 = v73[0];
      HIDWORD(v78) &= ~1u;
    }
  }
LABEL_274:
  if ((v78 & 0x100000000) != 0 && (_DWORD)v78 == 1 && v73[0])
    free(v73[0]);
  return v7;
}

uint64_t sub_10000952C(uint64_t a1)
{
  uint64_t v2;
  int v4;
  __int128 v5;

  v5 = xmmword_10000A560;
  v4 = -1;
  *(_DWORD *)((uint64_t (*)(void))_newrpclib___rpc_createerr)() = 0;
  if (HIDWORD(xmmword_1000109E8) == 2)
  {
    v2 = _newrpclib_clntudp_bufcreate_timeout(a1, 100024, 1, &v4, 0x10000, 0x10000, 0, &v5);
    if (!v2)
      return *(unsigned int *)_newrpclib___rpc_createerr(v2);
    goto LABEL_5;
  }
  v2 = _newrpclib_clnttcp_create_timeout(a1, 100024, 1, &v4, 0x10000, 0x10000, 0, &v5);
  if (v2)
LABEL_5:
    v2 = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 8) + 32))();
  return *(unsigned int *)_newrpclib___rpc_createerr(v2);
}

void sub_1000095D4(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *i;
  addrinfo *v3;

  if (a1)
  {
    v1 = a1;
    do
    {
      for (i = (_QWORD *)v1[1]; i; i = (_QWORD *)*i)
      {
        v3 = (addrinfo *)i[2];
        if (v3)
        {
          freeaddrinfo(v3);
          i[2] = 0;
        }
      }
      v1 = (_QWORD *)*v1;
    }
    while (v1);
  }
}

void start(int a1, char *const *a2)
{
  sub_100003CF8(a1, a2);
}

uint64_t sub_100009628(const char *a1, int *a2)
{
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  _BYTE *v7;
  const char *v8;
  char *v9;
  __darwin_ct_rune_t v10;
  char *v11;
  char v12;
  char v13;
  _BYTE *v14;
  uint64_t result;
  int *v16;

  if (a1)
  {
    v3 = a1;
    printf("hstr = [%s]\n", a1);
    if (*v3 == 48 && (*((unsigned __int8 *)v3 + 1) | 0x20) == 0x78)
      v3 += 2;
    v4 = strlen(v3);
    if ((v4 & 1) == 0)
    {
      if (v4 >= 0)
        v5 = v4;
      else
        v5 = v4 + 1;
      *a2 = v5 >> 1;
      LOBYTE(v5) = *v3;
      if (!*v3)
        return 0;
      v6 = 0;
      v7 = a2 + 1;
      v8 = v3 + 1;
      while (1)
      {
        v9 = off_100010900;
        v10 = __tolower((char)v5);
        v11 = strchr(v9, v10);
        if (!v11)
          break;
        v12 = (_BYTE)v11 - (_BYTE)v9;
        if ((v6 & 1) != 0)
        {
          v14 = v7 + 1;
          v13 = *v7 | v12 & 0xF;
        }
        else
        {
          v13 = 16 * v12;
          v14 = v7;
        }
        *v7 = v13;
        v5 = v8[v6++];
        v7 = v14;
        if (!v5)
          return 0;
      }
    }
  }
  v16 = __error();
  result = 22;
  *v16 = 22;
  return result;
}

char *sub_100009734(int *a1)
{
  uint64_t v2;
  size_t v3;
  char *v4;
  char *v5;
  char *v6;
  _BYTE *v7;
  char v8;

  v2 = *a1;
  v3 = 2 * v2 + 3;
  v4 = (char *)malloc_type_calloc(1uLL, v3, 0xEAE45059uLL);
  v5 = v4;
  if (v4)
  {
    v2 = v2;
    strlcpy(v4, "0x", v3);
    if ((int)v2 >= 1)
    {
      v6 = (char *)(a1 + 1);
      v7 = v5 + 3;
      do
      {
        *(v7 - 1) = off_100010900[(unint64_t)*v6 >> 4];
        v8 = *v6++;
        *v7 = off_100010900[v8 & 0xF];
        v7 += 2;
        --v2;
      }
      while (v2);
    }
  }
  return v5;
}

uint64_t sub_1000097E0(const char *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int *v5;
  uint64_t v6;
  char *v7;
  int v8;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  BOOL v16;
  unsigned int v17;
  unsigned int v18;
  char *__endptr;

  __endptr = 0;
  *a3 = 0;
  v5 = a2;
  while (1)
  {
    v6 = strtol(a1, &__endptr, 10);
    v7 = __endptr;
    v8 = *__endptr;
    if (*__endptr && v8 != 46)
    {
      if (v8 != 45 || v6 < 2 || v6 > 4)
        return 0;
    }
    else if ((unint64_t)(v6 - 5) < 0xFFFFFFFFFFFFFFFDLL)
    {
      return 0;
    }
    *v5 = (_DWORD)v6 << 16;
    v11 = *v7;
    if (v11 == 45)
      goto LABEL_23;
    if (v11 != 46)
      break;
    v12 = strtol(v7 + 1, &__endptr, 10);
    v13 = v12;
    v7 = __endptr;
    if (*__endptr)
    {
      result = 0;
      if (*__endptr != 45 || (v13 & 0x8000000000000000) != 0)
        return result;
    }
    else if (v12 < 0)
    {
      return 0;
    }
    v15 = *v5;
    if (v13 > *(unsigned int *)((char *)&unk_100010AF0 + ((v15 >> 14) & 0x3FFFC)))
      return 0;
    *v5 = v15 | (unsigned __int16)v13;
    if (!*v7)
      goto LABEL_27;
LABEL_23:
    a1 = v7 + 1;
    v16 = v5 == a3;
    v5 = a3;
    if (v16)
      return 0;
  }
  if (*v7)
    return 0;
LABEL_27:
  v17 = *a3;
  if (*a3)
  {
    v18 = *a2;
    if (*a2 > v17)
    {
      *a2 = v17;
      *a3 = v18;
    }
  }
  return 1;
}

void sub_100009924(const char *a1)
{
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  const char *v7;
  char **v8;
  char *v9;
  const char *v10;
  char **v11;
  char *v12;

  v1 = strdup(a1);
  if (v1)
  {
    v2 = v1;
    v3 = strtok(v1, ",");
    if (v3)
    {
      v4 = v3;
      do
      {
        v5 = &v4[2 * (strncmp(v4, "no", 2uLL) == 0)];
        v6 = strchr(v5, 61);
        if (v6)
          *v6 = 0;
        v7 = off_100010040;
        if (off_100010040)
        {
          v8 = &off_100010058;
          while (strcasecmp(v5, v7))
          {
            v9 = *v8;
            v8 += 3;
            v7 = v9;
            if (!v9)
              goto LABEL_10;
          }
        }
        else
        {
LABEL_10:
          v10 = off_1000105C8;
          if (off_1000105C8)
          {
            v11 = &off_1000105E0;
            while (strcasecmp(v5, v10))
            {
              v12 = *v11;
              v11 += 3;
              v10 = v12;
              if (!v12)
                goto LABEL_14;
            }
          }
          else
          {
LABEL_14:
            warnx("warning: option \"%s\" not known", v4);
          }
        }
        v4 = strtok(0, ",");
      }
      while (v4);
    }
    free(v2);
  }
}

uint64_t sub_100009A64(uint64_t a1)
{
  const char *v2;
  int v3;
  const char *v4;
  sockaddr *v5;
  sockaddr *v6;
  char *v7;
  char *v8;
  addrinfo *v9;
  int v10;
  addrinfo *v11;
  addrinfo *v12;
  addrinfo *v13;
  unsigned int ai_family;
  int v16;
  int v17;
  size_t ai_addrlen;
  socklen_t v19;
  int v20;
  addrinfo *ai_next;
  int v22;
  char *v23;
  char *v24;
  uint64_t result;
  char *v26;
  uint64_t v27;
  addrinfo *v28;
  addrinfo v29;
  char v30[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char __s[1025];
  char v39[1025];

  memset(&v29, 0, sizeof(v29));
  v28 = 0;
  bzero(__s, 0x401uLL);
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  *(_OWORD *)v30 = 0u;
  *(_QWORD *)(a1 + 16) = 0;
  v2 = *(const char **)(a1 + 8);
  v3 = *(unsigned __int8 *)v2;
  if (*v2)
  {
    if (v3 != 60)
    {
      if (v3 == 91 && v2[strlen(*(const char **)(a1 + 8)) - 1] == 93)
      {
        v4 = v2 + 1;
        v2 = __s;
        __strlcpy_chk(__s, v4, 1025, 1025);
        __s[strlen(__s) - 1] = 0;
      }
      goto LABEL_23;
    }
    if (v2[strlen(*(const char **)(a1 + 8)) - 1] != 62)
    {
LABEL_23:
      memset(&v29, 0, sizeof(v29));
      v29.ai_flags = 1024;
      v29.ai_socktype = qword_1000109F4;
      if ((_DWORD)qword_100010AE8)
        v2 = "localhost";
      if (getaddrinfo(v2, 0, &v29, &v28))
      {
        warnx("can't resolve host: %s", v2);
        return 2;
      }
      v9 = v28;
      if (!v28)
        goto LABEL_74;
      goto LABEL_27;
    }
    __strlcpy_chk(__s, v2, 1025, 1025);
    __s[strlen(__s) - 1] = 0;
    v2 = v39;
  }
  v28 = (addrinfo *)malloc_type_malloc(0x30uLL, 0x1030040D19128EAuLL);
  if (!v28)
  {
    warnx("Can't allocate addrinfo sturcture for local address for %s");
    return 12;
  }
  v5 = (sockaddr *)malloc_type_malloc(0x6AuLL, 0x10000403684B423uLL);
  if (!v5)
  {
    free(v28);
    warnx("Can't allocate local socket address for %s");
    return 12;
  }
  v6 = v5;
  *(_WORD *)&v5->sa_len = 362;
  if (dword_100010920 >= 3)
    printf("hostname is <%s> : %s\n", v2, (const char *)xmmword_100010AD8);
  if (*v2)
  {
    v7 = (char *)xmmword_100010AD8;
    if ((_QWORD)xmmword_100010AD8)
    {
      if (strcmp((const char *)xmmword_100010AD8, v2))
      {
        warnx("%s overrides port=%s", v2, v7);
        v7 = (char *)xmmword_100010AD8;
      }
      free(v7);
    }
    v8 = strdup(v2);
    *(_QWORD *)&xmmword_100010AD8 = v8;
    if (!v8)
    {
      v26 = strerror(1);
      sub_100003C24(1, "No memory to duplicate hostname %s: %s", 0, v26);
    }
    LODWORD(qword_10001092C) = qword_10001092C | 0x20000000;
    if (dword_100010920 >= 3)
      printf("Setting local_nfs_port to %s\n", v8);
  }
  v6->sa_data[0] = 0;
  v9 = v28;
  *(_QWORD *)&v28->ai_flags = &_mh_execute_header;
  v9->ai_addrlen = 106;
  v10 = qword_1000109F4;
  if (qword_1000109F4 <= 1)
    v10 = 1;
  v9->ai_socktype = v10;
  v9->ai_protocol = 0;
  v9->ai_canonname = 0;
  v9->ai_addr = v6;
  v9->ai_next = 0;
LABEL_27:
  v27 = a1;
  v11 = 0;
  v12 = 0;
  do
  {
    while (1)
    {
      v13 = v9;
      v9 = v9->ai_next;
      if ((!HIDWORD(qword_1000109F4) || v13->ai_family == HIDWORD(qword_1000109F4))
        && (!(_DWORD)qword_1000109F4 || v13->ai_socktype == (_DWORD)qword_1000109F4)
        && (xmmword_10001093C < 4 || v13->ai_socktype != 2))
      {
        ai_family = v13->ai_family;
        if (ai_family <= 0x1E && ((1 << ai_family) & 0x40000006) != 0)
          break;
      }
      ai_next = v9;
      if (v12)
        goto LABEL_52;
      v28 = v9;
LABEL_54:
      v13->ai_next = v11;
      if (dword_100010920 >= 3)
      {
        v22 = v13->ai_family;
        if (v22 == 2)
        {
          v23 = &v13->ai_addr->sa_data[2];
        }
        else
        {
          if (v22 == 1)
          {
            if (v13->ai_socktype != 2)
              v13->ai_socktype = 1;
            printf("discard address: %s %s\n");
            goto LABEL_63;
          }
          v23 = &v13->ai_addr->sa_data[6];
        }
        inet_ntop(v22, v23, v30, 0x80u);
        printf("discard address: %s %s %s\n");
      }
LABEL_63:
      v11 = v13;
      if (!v9)
        goto LABEL_72;
    }
    if (!(_DWORD)qword_1000109F4 && v12 && v13->ai_socktype != v12->ai_socktype)
    {
      v16 = v12->ai_family;
      v17 = v16 - ai_family;
      if (v16 != ai_family)
        goto LABEL_44;
      ai_addrlen = v12->ai_addrlen;
      v19 = v13->ai_addrlen;
      if ((_DWORD)ai_addrlen == v19)
      {
        v17 = bcmp(v12->ai_addr, v13->ai_addr, ai_addrlen);
LABEL_44:
        if (v17)
          goto LABEL_45;
LABEL_71:
        ai_next = v13->ai_next;
LABEL_52:
        v12->ai_next = ai_next;
        goto LABEL_54;
      }
      if ((_DWORD)ai_addrlen == v19)
        goto LABEL_71;
    }
LABEL_45:
    if (dword_100010920 < 3)
      goto LABEL_68;
    v20 = v13->ai_family;
    if (v20 == 2)
    {
      v24 = &v13->ai_addr->sa_data[2];
LABEL_67:
      inet_ntop(v20, v24, v30, 0x80u);
      printf("usable address: %s %s %s\n");
      goto LABEL_68;
    }
    if (v20 != 1)
    {
      v24 = &v13->ai_addr->sa_data[6];
      goto LABEL_67;
    }
    if (v13->ai_socktype != 2)
      v13->ai_socktype = 1;
    printf("usable address: %s %s\n");
LABEL_68:
    v12 = v13;
  }
  while (v9);
LABEL_72:
  a1 = v27;
  if (v11)
    free(v11);
LABEL_74:
  result = 0;
  *(_QWORD *)(a1 + 16) = v28;
  return result;
}

void sub_10000A07C(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)getmntoptstr(a1, "timeo");
  warnx("illegal timeout value -- %s", v1);
  sub_10000A070();
}

void sub_10000A0AC(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)getmntoptstr(a1, "retrycnt");
  warn("illegal retry count -- %s", v1);
  sub_10000A070();
}

void sub_10000A0DC(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)getmntoptstr(a1, "retrans");
  warnx("illegal retrans value -- %s", v1);
  sub_10000A070();
}

void sub_10000A10C(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)getmntoptstr(a1, "readahead");
  warnx("illegal readahead value -- %s", v1);
  sub_10000A070();
}

void sub_10000A13C(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)getmntoptstr(a1, "maxgroups");
  warnx("illegal maxgroups value -- %s", v1);
  sub_10000A070();
}

double sub_10000A16C()
{
  double result;

  LODWORD(qword_10001092C) = qword_10001092C | 0x1000;
  *(_QWORD *)&result = 0x5F37300000001;
  qword_1000109C4 = 0x5F37300000001;
  return result;
}
