void start(uint64_t a1, char *const *a2)
{
  int v2;
  uint64_t *v5;
  const char *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  const char **v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  int v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  const char **v22;
  char *v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  statfs *v33;
  char *f_mntonname;
  int v35;
  const char *v36;
  char *v37;
  const char *v38;
  uint64_t v39;
  int v40;
  signed int v41;
  int v42;
  int v43;
  int v44;
  signed int v45;
  signed int v46;
  unint64_t v47;
  statfs *v48;
  const char *v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  const char *v54;
  unint64_t v55;
  BOOL v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int64_t f_bavail;
  uint64_t v63;
  int v64;
  statfs *v65;
  uint64_t f_ffree;
  uint64_t f_files;
  int v68;
  uint64_t v69;
  int v70;
  int64x2_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  int v78;
  int __s1;
  const char **v80;
  int v81;
  statfs *v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int64x2_t v91;
  uint64_t v92;
  statfs __src;
  stat v94;
  int v95;
  size_t v96;
  int v97[2];
  int v98;
  int v99;
  int v100[4];
  __int128 v101;
  uint64_t v102;

  v5 = &qword_100008000;
  LODWORD(qword_100008000) = compat_mode("bin/df", "unix2003");
  if ((_DWORD)qword_100008000)
  {
    BYTE4(qword_100008000) = 1;
    v6 = "+abcgHhIiklmnPtT:Y,";
  }
  else
  {
    v6 = "+abcgHhIiklmnPt:T:Y,";
  }
  memset(&v94, 0, sizeof(v94));
  memset(&__src, 0, 512);
  v82 = 0;
  setlocale(0, (const char *)&unk_100003B31);
  v84 = 0;
  v85 = 0;
  v83 = 0;
  v86 = 0;
  bzero(&v87, 0x878uLL);
  v87 = 512;
  __strlcpy_chk(&v92, "total", 1024, 1024);
  v7 = xo_parse_args(a1, a2);
  if (v7 < 0)
    exit(1);
  v8 = v7;
  v9 = 0;
  v10 = &qword_100008000;
  v11 = &qword_100008000;
  v12 = (const char **)&qword_100008000;
  while (1)
  {
    while (1)
    {
      v13 = v9;
      v14 = getopt_long(v8, a2, v6, (const option *)&off_100004150, 0);
      if ((int)v14 > 72)
        break;
      switch((_DWORD)v14)
      {
        case 0x2C:
          byte_100008040 = 1;
          v9 = v13;
          break;
        case 0x48:
          HIDWORD(qword_100008008) = 1;
          v9 = v13;
          break;
        case 0xFFFFFFFF:
          v6 = (const char *)optind;
          v12 = (const char **)&a2[optind];
          if (v10[6] || !(_DWORD)v13)
            goto LABEL_65;
          if (*v12)
          {
            if (stat(*v12, &v94) < 0 && *__error() == 2)
            {
              v25 = (char *)*v12++;
              v10[6] = (uint64_t)sub_100002E70(v25, &dword_100008038);
            }
LABEL_65:
            if (*v12)
              goto LABEL_75;
          }
          v26 = getmntinfo(&v82, 2);
          v27 = v26;
          if (qword_100008020 | v10[6])
          {
            if (v26 < 1)
              goto LABEL_88;
            v31 = 0;
            v32 = v26;
            v33 = v82;
            f_mntonname = v82->f_mntonname;
            v27 = 0;
            do
            {
              if (!sub_100002FD0(f_mntonname - 16))
              {
                v35 = statfs(f_mntonname, &v33[v27]);
                if (byte_100008028 & 1 | (v35 < 0) && v31 != v27)
                {
                  if (v35 < 0)
                    xo_warnx("%s stats possibly stale", f_mntonname);
                  memcpy(&v33[v27], f_mntonname - 88, sizeof(statfs));
                }
                ++v27;
              }
              ++v31;
              f_mntonname += 2168;
            }
            while (v32 != v31);
          }
          else if ((byte_100008028 & 1) == 0)
          {
            v27 = getmntinfo(&v82, 1);
          }
LABEL_89:
          xo_open_container("storage-system-information");
          xo_open_list("filesystem");
          v36 = *v12;
          if (!*v12)
          {
            v2 = 0;
LABEL_105:
            v83 = 0;
            v84 = 0;
            v86 = 0;
            v85 = 0;
            if (v27 >= 1)
            {
              v75 = v2;
              v39 = 0;
              v40 = 0;
              v41 = 0;
              v42 = 0;
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = 0;
              v76 = v27;
              v47 = qword_100008068;
              do
              {
                v78 = v40;
                __s1 = v42;
                v81 = v41;
                v48 = v82;
                v100[0] = 0;
                if (!v47)
                {
                  getbsize(v100, &qword_100008068);
                  v47 = qword_100008068;
                }
                v49 = (const char *)&v48[v39];
                v50 = strlen(v49 + 1112);
                if (v46 <= v50)
                  v46 = v50;
                v77 = v46;
                v51 = strlen(v49 + 72);
                if (v45 <= v51)
                  v52 = v51;
                else
                  v52 = v45;
                v53 = *((_QWORD *)v49 + 1);
                v54 = v49 + 88;
                if (v53 < 0)
                {
                  xo_warnx("negative filesystem block count/size from fs %s", v49 + 88);
                  v53 = *((_QWORD *)v49 + 1);
                  v55 = *(unsigned int *)v49;
                  v58 = 1;
                  v47 = qword_100008068;
                }
                else
                {
                  v55 = *(unsigned int *)v49;
                  if ((_DWORD)v55)
                    v56 = v47 > v55;
                  else
                    v56 = 0;
                  if (v56)
                    v57 = v53 / (uint64_t)(v47 / v55);
                  else
                    v57 = v55 / v47 * v53;
                  v58 = v57 < 1;
                  if (v57)
                  {
                    if (v57 < 0)
                      v57 = -v57;
                    do
                    {
                      ++v58;
                      v56 = (unint64_t)v57 > 9;
                      v57 /= 0xAuLL;
                    }
                    while (v56);
                  }
                }
                if (v44 <= v58)
                  v44 = v58;
                v59 = v53 - v48[v39].f_bfree;
                if (v59 < 0)
                {
                  xo_warnx("negative filesystem block count/size from fs %s", v54);
                  v55 = *(unsigned int *)v49;
                  v47 = qword_100008068;
                  v61 = 1;
                }
                else
                {
                  if (v47 > v55 && (_DWORD)v55)
                    v60 = v59 / (uint64_t)(v47 / v55);
                  else
                    v60 = v55 / v47 * v59;
                  v61 = v60 < 1;
                  if (v60)
                  {
                    if (v60 < 0)
                      v60 = -v60;
                    do
                    {
                      ++v61;
                      v56 = (unint64_t)v60 > 9;
                      v60 /= 0xAuLL;
                    }
                    while (v56);
                  }
                }
                if (v43 <= v61)
                  v43 = v61;
                f_bavail = v48[v39].f_bavail;
                if (f_bavail < 0)
                {
                  xo_warnx("negative filesystem block count/size from fs %s", v54);
                  v47 = qword_100008068;
                  v64 = 1;
                  v45 = v52;
                  v46 = v77;
                  v40 = v78;
                  v41 = v81;
                  v42 = __s1;
                }
                else
                {
                  if (v47 > v55 && (_DWORD)v55)
                    v63 = f_bavail / (uint64_t)(v47 / v55);
                  else
                    v63 = v55 / v47 * f_bavail;
                  v45 = v52;
                  v46 = v77;
                  v40 = v78;
                  v41 = v81;
                  v42 = __s1;
                  v64 = v63 < 1;
                  if (v63)
                  {
                    if (v63 < 0)
                      v63 = -v63;
                    do
                    {
                      ++v64;
                      v56 = (unint64_t)v63 > 9;
                      v63 /= 0xAuLL;
                    }
                    while (v56);
                  }
                }
                if (v42 <= v64)
                  v42 = v64;
                v65 = &v48[v39];
                f_files = v65->f_files;
                f_ffree = v65->f_ffree;
                v68 = (uint64_t)(f_files - f_ffree) < 1;
                v69 = f_files - f_ffree;
                if (v69)
                {
                  if (v69 < 0)
                    v69 = -v69;
                  do
                  {
                    ++v68;
                    v56 = (unint64_t)v69 > 9;
                    v69 /= 0xAuLL;
                  }
                  while (v56);
                }
                if (v41 <= v68)
                  v41 = v68;
                v70 = f_ffree < 1;
                if (f_ffree)
                {
                  if (f_ffree < 0)
                    f_ffree = -f_ffree;
                  do
                  {
                    ++v70;
                    v56 = (unint64_t)f_ffree > 9;
                    f_ffree /= 0xAuLL;
                  }
                  while (v56);
                }
                if (v40 <= v70)
                  v40 = v70;
                if (byte_100008010 == 1)
                {
                  v71 = (int64x2_t *)&v82[v39];
                  v72 = v71->i32[0] / v87;
                  v88 += v71->i64[1] * v72;
                  v89 += v71[1].i64[0] * v72;
                  v90 += v71[1].i64[1] * v72;
                  v91 = vaddq_s64(v91, v71[2]);
                }
                ++v39;
              }
              while (v39 != v76);
              v73 = 0;
              v84 = __PAIR64__(v43, v44);
              v85 = __PAIR64__(v41, v42);
              v86 = v40;
              v83 = __PAIR64__(v45, v46);
              v11 = &qword_100008000;
              v2 = v75;
              do
                sub_1000030D0(&v82[v73++].f_bsize, &v83);
              while (v76 != v73);
            }
            xo_close_list("filesystem");
            if (*((_BYTE *)v11 + 16) == 1)
              sub_1000030D0(&v87, &v83);
            v74 = xo_close_container("storage-system-information");
            if (xo_finish(v74) < 0)
            {
              v30 = "stdout";
LABEL_173:
              xo_err(1, v30);
            }
            exit(v2);
          }
          v2 = 0;
          while (2)
          {
            if (stat(v36, &v94) < 0)
            {
              v37 = sub_100002F5C(*v12);
              if (v37)
                goto LABEL_99;
              xo_warn("%s", *v12);
            }
            else
            {
              if ((v94.st_mode & 0xB000 | 0x4000) == 0x6000)
              {
                v37 = sub_100002F5C(*v12);
                if (!v37)
                {
                  xo_warnx("%s: not mounted", *v12);
                  goto LABEL_103;
                }
              }
              else
              {
                v37 = (char *)*v12;
              }
LABEL_99:
              if (statfs(v37, &__src) < 0)
              {
                xo_warn("%s", v37);
              }
              else if (!sub_100002FD0(__src.f_fstypename))
              {
                memcpy(&v82[v27++], &__src, sizeof(statfs));
                goto LABEL_104;
              }
            }
LABEL_103:
            v2 = 1;
LABEL_104:
            v38 = v12[1];
            ++v12;
            v36 = v38;
            if (!v38)
              goto LABEL_105;
            continue;
          }
        default:
LABEL_69:
          v28 = "t";
          if (*(_DWORD *)v5)
            v28 = (const char *)&unk_100003B31;
          v29 = " [-t type]";
          if (!*(_DWORD *)v5)
            v29 = (const char *)&unk_100003B31;
          xo_error("usage: df [--libxo] [-b | -g | -H | -h | -k | -m | -P] [-acIiln%sY] [-,] [-T type]%s\n          [file | filesystem ...]\n", v28, v29);
          exit(64);
      }
    }
    v9 = v13;
    switch((int)v14)
    {
      case 'P':
      case 'b':
        if (*(_DWORD *)v5)
          BYTE4(qword_100008000) = 0;
        v9 = v13;
        if ((_DWORD)qword_100008008)
          continue;
        v15 = "512";
LABEL_31:
        setenv("BLOCKSIZE", v15, 1);
        HIDWORD(qword_100008008) = 0;
        v9 = v13;
        continue;
      case 'Q':
      case 'R':
      case 'S':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'd':
      case 'e':
      case 'f':
      case 'j':
        goto LABEL_69;
      case 'T':
        goto LABEL_19;
      case 'Y':
        byte_10000803C = 1;
        v9 = v13;
        continue;
      case 'a':
        continue;
      case 'c':
        *((_BYTE *)v11 + 16) = 1;
        v9 = v13;
        continue;
      case 'g':
        v15 = "1g";
        goto LABEL_31;
      case 'h':
        HIDWORD(qword_100008008) = 2;
        v9 = v13;
        continue;
      case 'i':
        BYTE4(qword_100008000) = 1;
        v9 = v13;
        continue;
      case 'k':
        LODWORD(qword_100008008) = qword_100008008 + 1;
        v15 = "1024";
        goto LABEL_31;
      case 'l':
        v9 = v13;
        if ((byte_100008014 & 1) != 0)
          continue;
        v102 = 0;
        *(_OWORD *)v100 = 0u;
        v101 = 0u;
        v95 = 0;
        *(_QWORD *)v97 = 3;
        v98 = 1;
        v96 = 4;
        if (sysctl(v97, 3u, &v95, &v96, 0, 0))
        {
          xo_warn("sysctl failed");
LABEL_29:
          v16 = 0;
          goto LABEL_57;
        }
        v80 = (const char **)malloc_type_malloc(8 * v95, 0x10040436913F5uLL);
        if (!v80)
        {
          xo_warnx("malloc failed");
          goto LABEL_29;
        }
        v96 = 40;
        v98 = 2;
        if (v95 < 1)
          goto LABEL_55;
        v17 = 0;
        LODWORD(v18) = 0;
        do
        {
          v99 = v17;
          if (sysctl(v97, 4u, v100, &v96, 0, 0))
          {
            if (*__error() != 45)
              xo_warn("sysctl failed");
          }
          else if ((BYTE13(v101) & 0x10) == 0)
          {
            v19 = strdup((const char *)&v100[1]);
            v80[(int)v18] = v19;
            if (!v19)
              goto LABEL_54;
            LODWORD(v18) = v18 + 1;
          }
          ++v17;
        }
        while (v17 < v95);
        if (!(_DWORD)v18)
          goto LABEL_55;
        v20 = (char *)malloc_type_malloc(33 * (int)v18 + 2, 0x100004077774924uLL);
        if (v20)
        {
          v16 = v20;
          *(_WORD *)v20 = 28526;
          v21 = v20 + 2;
          if ((int)v18 >= 1)
          {
            v18 = v18;
            v22 = v80;
            do
            {
              strlcpy(v21, *v22, 0x20uLL);
              v23 = &v21[strlen(*v22)];
              *v23 = 44;
              v21 = v23 + 1;
              v24 = (char *)*v22++;
              free(v24);
              --v18;
            }
            while (v18);
          }
          *(v21 - 1) = 0;
          free(v80);
          v11 = &qword_100008000;
          v12 = (const char **)&qword_100008000;
        }
        else
        {
          if ((int)v18 >= 1)
LABEL_54:
            xo_warnx("malloc failed");
LABEL_55:
          free(v80);
          v16 = 0;
        }
        v5 = &qword_100008000;
LABEL_57:
        qword_100008020 = (uint64_t)sub_100002E70(v16, &dword_100008018);
        byte_100008014 = 1;
        v9 = v13;
        v10 = &qword_100008000;
        break;
      case 'm':
        v15 = "1m";
        goto LABEL_31;
      case 'n':
        *((_BYTE *)v12 + 40) = 1;
        v9 = v13;
        continue;
      default:
        if ((_DWORD)v14 == 73)
        {
          BYTE4(qword_100008000) = 0;
          v9 = v13;
        }
        else
        {
          if ((_DWORD)v14 != 116)
            goto LABEL_69;
          v9 = 1;
          if (!*(_DWORD *)v5)
          {
LABEL_19:
            if (v10[6])
            {
              xo_errx(1, "only one -%c option may be specified", v14);
LABEL_75:
              v82 = (statfs *)malloc_type_malloc(2168 * (v8 - (_QWORD)v6), 0x100004087E0324AuLL);
              if (!v82)
              {
                v30 = "malloc()";
                goto LABEL_173;
              }
LABEL_88:
              v27 = 0;
              goto LABEL_89;
            }
            v10[6] = (uint64_t)sub_100002E70(optarg, &dword_100008038);
            v9 = v13;
          }
        }
        continue;
    }
  }
}

_QWORD *sub_100002E70(char *a1, _DWORD *a2)
{
  char *v2;
  int v3;
  char *i;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v2 = a1;
  *a2 = 0;
  if (*a1 == 110 && a1[1] == 111)
  {
    v2 = a1 + 2;
    *a2 = 1;
  }
  v3 = 0;
  for (i = v2; *i == 44; ++i)
  {
    ++v3;
LABEL_10:
    ;
  }
  if (*i)
    goto LABEL_10;
  v5 = malloc_type_malloc(8 * (v3 + 2), 0x10040436913F5uLL);
  v6 = v5;
  if (v5)
  {
    *v5 = v2;
    v7 = strchr(v2, 44);
    v8 = 1;
    if (v7)
    {
      do
      {
        *v7 = 0;
        v9 = v7 + 1;
        v10 = v8 + 1;
        v6[v8] = v9;
        v7 = strchr(v9, 44);
        v8 = v10;
      }
      while (v7);
      v8 = v10;
    }
    v6[v8] = 0;
  }
  else
  {
    xo_warnx("malloc failed");
  }
  return v6;
}

char *sub_100002F5C(const char *a1)
{
  int v2;
  uint64_t v3;
  char *i;
  statfs *v6;

  v6 = 0;
  v2 = getmntinfo(&v6, 2);
  if (!v2)
    return 0;
  v3 = v2;
  for (i = v6->f_mntfromname; strcmp(i, a1); i += 2168)
  {
    if (!--v3)
      return 0;
  }
  return i - 1024;
}

uint64_t sub_100002FD0(char *__s1)
{
  uint64_t v2;
  const char *v3;
  const char **v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char **v8;
  const char *v9;
  int v10;
  const char *v11;
  const char **v12;
  const char *v13;

  if (qword_100008030)
  {
    v2 = dword_100008038;
    v3 = *(const char **)qword_100008030;
    if (*(_QWORD *)qword_100008030)
    {
      v4 = (const char **)(qword_100008030 + 8);
      while (strcmp(__s1, v3))
      {
        v5 = *v4++;
        v3 = v5;
        if (!v5)
          goto LABEL_6;
      }
      v6 = v2;
    }
    else
    {
LABEL_6:
      v6 = (_DWORD)v2 == 0;
    }
    if (qword_100008020)
    {
      v10 = dword_100008018;
      v11 = *(const char **)qword_100008020;
      if (*(_QWORD *)qword_100008020)
      {
        v12 = (const char **)(qword_100008020 + 8);
        while (strcmp(__s1, v11))
        {
          v13 = *v12++;
          v11 = v13;
          if (!v13)
            goto LABEL_19;
        }
      }
      else
      {
LABEL_19:
        v10 = v10 == 0;
      }
      if (v10 == (_DWORD)v2)
        return v2;
      else
        return v6;
    }
  }
  else if (qword_100008020)
  {
    v6 = dword_100008018;
    v7 = *(const char **)qword_100008020;
    if (*(_QWORD *)qword_100008020)
    {
      v8 = (const char **)(qword_100008020 + 8);
      while (strcmp(__s1, v7))
      {
        v9 = *v8++;
        v7 = v9;
        if (!v9)
          return (_DWORD)v6 == 0;
      }
    }
    else
    {
      return (_DWORD)v6 == 0;
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

uint64_t sub_1000030D0(unsigned int *a1, _DWORD *a2)
{
  int32x2_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  uint32x4_t v10;
  __int32 v11;
  int32x2_t v12;
  int v13;
  int v14;
  BOOL v15;
  const char *v16;
  __int32 v17;
  int32x2_t v18;
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  int v42;
  uint64_t v43;
  const char *v44;
  _QWORD v45[3];
  _BYTE v46[12];
  int v47;

  if (!dword_100008054++)
  {
    v5 = vmax_s32(*(int32x2_t *)a2, (int32x2_t)0x40000000ALL);
    *(int32x2_t *)a2 = v5;
    if (byte_100008040 == 1)
    {
      v6 = *(int32x4_t *)(a2 + 2);
      v7.i64[0] = -1;
      v7.i64[1] = -1;
      v8 = vaddq_s32(v6, v7);
      v9 = vdupq_n_s32(0x55555556u);
      v10 = (uint32x4_t)vuzp2q_s32((int32x4_t)vmull_s32(*(int32x2_t *)v8.i8, *(int32x2_t *)v9.i8), (int32x4_t)vmull_high_s32(v8, v9));
      *(int32x4_t *)(a2 + 2) = vaddq_s32((int32x4_t)vsraq_n_u32(v10, v10, 0x1FuLL), v6);
      a2[6] += (a2[6] - 1) / 3;
    }
    if (HIDWORD(qword_100008008))
    {
      qword_100008058 = (uint64_t)"   Size";
      a2[2] = 7;
      v11 = v5.i32[0];
      v12 = (int32x2_t)0x700000007;
      v13 = 1;
    }
    else
    {
      qword_100008058 = (uint64_t)getbsize(&dword_100008050, &qword_100008048);
      v14 = a2[2];
      if (v14 <= dword_100008050)
        v14 = dword_100008050;
      a2[2] = v14;
      v13 = HIDWORD(qword_100008008);
      v12 = *(int32x2_t *)(a2 + 3);
      v11 = *a2;
    }
    if ((_DWORD)qword_100008000)
      v15 = v13 == 0;
    else
      v15 = 0;
    if (v15)
      v16 = "Available";
    else
      v16 = "Avail";
    if (v15)
      v17 = 9;
    else
      v17 = 5;
    v18.i32[0] = 4;
    v18.i32[1] = v17;
    *(int32x2_t *)(a2 + 3) = vmax_s32(v12, v18);
    xo_emit("{T:/%-*s}", v11, "Filesystem");
    if (byte_10000803C == 1)
      xo_emit("  {T:/%-*s}", a2[1], "Type");
    xo_emit(" {T:/%*s} {T:/%*s} {T:/%*s} {T:Capacity}", a2[2], (const char *)qword_100008058, a2[3], "Used", a2[4], v16);
    if (BYTE4(qword_100008000) == 1)
    {
      v19 = 7;
      if (HIDWORD(qword_100008008))
      {
        v20 = 0;
      }
      else
      {
        v20 = a2[6];
        if ((int)a2[5] <= 7)
          v19 = 7;
        else
          v19 = a2[5];
      }
      if (v20 <= 5)
        v20 = 5;
      a2[5] = v19;
      a2[6] = v20;
      xo_emit(" {T:/%*s} {T:/%*s} {T:%iused}", v19 - 2, "iused", v20, "ifree", v42);
    }
    xo_emit("  {T:Mounted on}\n");
  }
  xo_open_instance("filesystem");
  if (!*a1)
  {
    xo_warnx("File system %s does not have a block size, assuming 512.", (const char *)a1 + 88);
    *a1 = 512;
  }
  xo_emit("{tk:name/%-*s}", *a2, (const char *)a1 + 1112);
  if (byte_10000803C == 1)
    xo_emit("  {:type/%-*s}", a2[1], (const char *)a1 + 72);
  if (*((_QWORD *)a1 + 1) <= *((_QWORD *)a1 + 2))
  {
    v21 = 0;
  }
  else
  {
    v47 = 0;
    if (!qword_100008060)
      getbsize(&v47, &qword_100008060);
    v45[2] = 0;
    memset(v46, 0, sizeof(v46));
    v45[0] = 5;
    v45[1] = 2155872256;
    if (getattrlist((const char *)a1 + 88, v45, v46, 0xCuLL, 0))
    {
      if (*__error() != 22)
        xo_warn("getattrlist failed for %s", (const char *)a1 + 88);
      v21 = *((_QWORD *)a1 + 1) - *((_QWORD *)a1 + 2);
    }
    else
    {
      v22 = *a1;
      if (!(_DWORD)v22)
        v22 = qword_100008060;
      v21 = *(_QWORD *)&v46[4] / v22;
    }
  }
  v23 = *((_QWORD *)a1 + 3) + v21;
  if (HIDWORD(qword_100008008))
  {
    sub_1000037F4((uint64_t)"  {:blocks/%6s}", *((_QWORD *)a1 + 1) * *a1);
    sub_1000037F4((uint64_t)"  {:used/%6s}", v21 * *a1);
    sub_1000037F4((uint64_t)"  {:available/%6s}", *((_QWORD *)a1 + 3) * *a1);
  }
  else
  {
    if (byte_100008040)
      v24 = " {t:total-blocks/%*j'd} {t:used-blocks/%*j'd} {t:available-blocks/%*j'd}";
    else
      v24 = " {t:total-blocks/%*jd} {t:used-blocks/%*jd} {t:available-blocks/%*jd}";
    v25 = *((_QWORD *)a1 + 1);
    v43 = a2[2];
    v44 = v24;
    if (v25 < 0)
    {
      xo_warnx("negative filesystem block count/size from fs %s", (const char *)a1 + 88);
      v29 = 0;
      v26 = *a1;
      v28 = qword_100008048;
      v27 = *a1;
    }
    else
    {
      v26 = *a1;
      v27 = v26;
      v28 = qword_100008048;
      if ((_DWORD)v26 && qword_100008048 > v26)
        v29 = v25 / (uint64_t)(qword_100008048 / v26);
      else
        v29 = v26 / qword_100008048 * v25;
    }
    v30 = a2[3];
    if (v21 < 0)
    {
      xo_warnx("negative filesystem block count/size from fs %s", (const char *)a1 + 88);
      v31 = 0;
      v26 = *a1;
      v28 = qword_100008048;
      v27 = *a1;
    }
    else if (v27 && v28 > v26)
    {
      v27 = 1;
      v31 = v21 / (uint64_t)(v28 / v26);
    }
    else
    {
      v31 = v26 / v28 * v21;
    }
    v32 = a2[4];
    v33 = *((_QWORD *)a1 + 3);
    if (v33 < 0)
    {
      xo_warnx("negative filesystem block count/size from fs %s", (const char *)a1 + 88);
      v34 = 0;
    }
    else if (v27 && v28 > v26)
    {
      v34 = v33 / (uint64_t)(v28 / v26);
    }
    else
    {
      v34 = v26 / v28 * v33;
    }
    xo_emit(v44, v43, v29, v30, v31, v32, v34);
  }
  if ((_DWORD)qword_100008000)
  {
    if (v23)
    {
      v35 = (double)v21 / (double)v23 * 100.0;
      if (v35 - (double)(int)v35 > 0.0)
        v35 = v35 + 1.0;
    }
    else
    {
      v35 = 100.0;
    }
    v36 = trunc(v35);
  }
  else if (v23)
  {
    v36 = (double)v21 / (double)v23 * 100.0;
  }
  else
  {
    v36 = 100.0;
  }
  xo_emit(" {:used-percent/%5.0f}{U:%%}", v36);
  if (BYTE4(qword_100008000) == 1)
  {
    v38 = *((_QWORD *)a1 + 4);
    v37 = *((_QWORD *)a1 + 5);
    v39 = v38 - v37;
    if (HIDWORD(qword_100008008))
    {
      xo_emit("  ");
      sub_100003774((uint64_t)" {:inodes-used/%5s}", v39);
      sub_100003774((uint64_t)" {:inodes-free/%5s}", *((_QWORD *)a1 + 5));
      if (v38)
      {
LABEL_80:
        xo_emit(" {:inodes-used-percent/%4.0f}{U:%%} ");
        goto LABEL_87;
      }
    }
    else
    {
      if (byte_100008040)
        xo_emit(" {:inodes-used/%*j'd} {:inodes-free/%*j'd}", a2[5], v38 - v37, a2[6], v37);
      else
        xo_emit(" {:inodes-used/%*jd} {:inodes-free/%*jd}");
      if (v38)
        goto LABEL_80;
    }
    xo_emit(" {:inodes-used-percent/    -}{U:} ", v41);
  }
  else
  {
    xo_emit("  ", v41);
  }
LABEL_87:
  if (strncmp((const char *)a1 + 1112, "total", 0x400uLL))
    xo_emit("  {:mounted-on}", a1 + 22);
  xo_emit("\n");
  return xo_close_instance("filesystem");
}

uint64_t sub_100003774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE v6[6];

  if (a2 >= 0)
    v4 = 5;
  else
    v4 = 6;
  humanize_number(v6, v4, a2, &unk_100003B31, 32, 11);
  xo_attr("value", "%lld", a2);
  return xo_emit(a1);
}

uint64_t sub_1000037F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  _BYTE v8[7];

  if (a2 >= 0)
    v4 = 6;
  else
    v4 = 7;
  if (HIDWORD(qword_100008008) == 1)
    v5 = 15;
  else
    v5 = 7;
  if (HIDWORD(qword_100008008) == 1)
    v6 = (const char *)&unk_100003B31;
  else
    v6 = "i";
  humanize_number(v8, v4, a2, v6, 32, v5);
  xo_attr("value", "%lld", a2);
  return xo_emit(a1);
}
