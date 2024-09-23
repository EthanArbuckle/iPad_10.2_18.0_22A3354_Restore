char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  char v3;
  char *v4;
  uint64_t v5;
  char *v6;
  int v7;
  int *v8;
  char *result;
  const char *v10;
  char *v11;
  int *v12;
  int v13;
  char *__s;
  char v15;
  _OWORD v16[4];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  __s = 0;
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  v15 = 35;
  v3 = 67;
  v4 = &byte_1DED3E538;
  v5 = 1;
  v6 = (char *)v16;
  do
  {
    if ((*((_DWORD *)v4 - 1) & a2) != 0)
    {
      *v6 = v3;
      if (v5 >= 65)
      {
        v8 = __error();
        result = 0;
        *v8 = 63;
        return result;
      }
      ++v5;
    }
    v7 = *v4;
    v4 += 8;
    v3 = v7;
    v6 = &v15 + v5;
  }
  while (v7);
  if (v5 != 1)
  {
    v10 = (const char *)nameInDefaultList((char *)a1);
    if (v10 && !strcmp(v10, (const char *)v16))
    {
      v11 = strdup(a1);
      __s = v11;
      if (v11)
      {
LABEL_13:
        if (strlen(v11) >= 0x80)
        {
          free(v11);
          __s = 0;
          v12 = __error();
          v13 = 63;
LABEL_17:
          *v12 = v13;
          return __s;
        }
        return __s;
      }
    }
    else
    {
      asprintf(&__s, "%s%s", a1, &v15);
      v11 = __s;
      if (__s)
        goto LABEL_13;
    }
LABEL_16:
    v12 = __error();
    v13 = 12;
    goto LABEL_17;
  }
  __s = strdup(a1);
  if (!__s)
    goto LABEL_16;
  return __s;
}

xattr_flags_t xattr_flags_from_name(const char *a1)
{
  char *v2;
  xattr_flags_t result;
  int v4;
  unsigned int v5;
  int v6;
  int *v7;
  int v8;

  v2 = strrchr((char *)a1, 35);
  if (v2)
  {
    result = (xattr_flags_t)(v2 + 1);
  }
  else
  {
    result = nameInDefaultList((char *)a1);
    if (!result)
      return result;
  }
  v4 = *(unsigned __int8 *)result;
  if (*(_BYTE *)result)
  {
    v5 = 0;
    do
    {
      v6 = 67;
      v7 = &dword_1DED3E534;
      do
      {
        if (v4 == v6)
        {
          v5 |= *v7;
        }
        else if (v4 == *((unsigned __int8 *)v7 - 3))
        {
          v5 &= ~*v7;
        }
        v6 = *((unsigned __int8 *)v7 + 4);
        v7 += 2;
      }
      while (v6);
      v8 = *(unsigned __int8 *)++result;
      v4 = v8;
    }
    while (v8);
  }
  else
  {
    return 0;
  }
  return v5;
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  copyfile_flags_t v4;
  const char **v8;
  char *v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  int v23;
  _BOOL4 v25;
  int v26;
  unsigned int v27;
  uint32_t v28;
  std::error_code *v29;
  int v30;
  _filesec *v31;
  filesec_t *v32;
  filesec_t v33;
  std::error_code *v34;
  char *v35;
  int v36;
  int *v37;
  dev_t v38;
  std::__fs::filesystem::path *v39;
  const char *v40;
  uint64_t (*v41)(const char *, statfs *);
  uint64_t (*v42)(const char *, statfs *);
  int v43;
  _BOOL4 v44;
  int v45;
  int v46;
  __int16 f_iosize;
  char *v48;
  void (*v49)(const char *, const char **, const char *);
  int v50;
  int v51;
  std::error_code *v52;
  _filesec *fixed;
  const char *v54;
  int v55;
  int v56;
  std::error_code *v57;
  int v58;
  int v59;
  _copyfile_state *v60;
  int v61;
  int *v62;
  int v63;
  uint64_t v64;
  FTS *v65;
  int v66;
  char v67;
  char v68;
  uint64_t v69;
  FTSENT *v70;
  FTSENT *v71;
  copyfile_state_t v72;
  copyfile_state_t v73;
  dev_t fts_dev;
  const char *v75;
  int v76;
  int v77;
  int v78;
  const char *fts_path;
  uint64_t (*v80)(void);
  int v81;
  int v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  const char *v86;
  char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  unsigned int v91;
  int fts_errno;
  unsigned int v93;
  const char *v94;
  int v95;
  int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  int flagsa;
  char *__s1;
  _BOOL4 v102;
  unsigned int v103;
  const char *v104;
  const char *v105;
  size_t v106;
  int v107;
  uint64_t (*v108)(void);
  dev_t v109;
  unsigned int v110;
  const char **v111;
  _BYTE v112[36];
  stat v113;
  _QWORD v114[3];
  stat v115;
  stat v116;
  statfs v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C874D8];
  v111 = (const char **)state;
  if (!((unint64_t)from | (unint64_t)to))
  {
    *__error() = 22;
    return -1;
  }
  v4 = flags;
  if ((copyfile_preamble((copyfile_state_t *)&v111, flags) & 0x80000000) != 0)
    return -1;
  v8 = v111;
  if (from)
  {
    v9 = (char *)*v111;
    if (*v111)
    {
      if (!strncmp(from, *v111, 0x400uLL))
        goto LABEL_14;
      if (*((_DWORD *)v8 + 69) >= 2u)
      {
        v10 = *__error();
        syslog(7, "%s:%d:%s() replacing string %s (%s) -> (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1300, "copyfile", "src", from, *v8);
        *__error() = v10;
      }
      v11 = *((_DWORD *)v8 + 4);
      if ((v11 & 0x80000000) == 0)
      {
        if (*((_DWORD *)v8 + 69) >= 4u)
        {
          v12 = *__error();
          syslog(7, "%s:%d:%s() closing %s fd: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1300, "copyfile", "src", *((_DWORD *)v8 + 4));
          *__error() = v12;
          v11 = *((_DWORD *)v8 + 4);
        }
        close(v11);
        *((_DWORD *)v8 + 4) = -2;
      }
      v9 = (char *)*v8;
      if (*v8)
      {
LABEL_14:
        free(v9);
        *v8 = 0;
      }
    }
    v13 = strdup(from);
    *v8 = v13;
    if (!v13)
      return -1;
  }
  if (to)
  {
    v14 = (char *)v8[1];
    if (v14)
    {
      if (!strncmp(to, v8[1], 0x400uLL))
        goto LABEL_26;
      if (*((_DWORD *)v8 + 69) >= 2u)
      {
        v15 = *__error();
        syslog(7, "%s:%d:%s() replacing string %s (%s) -> (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1301, "copyfile", "dst", to, v8[1]);
        *__error() = v15;
      }
      v16 = *((_DWORD *)v8 + 6);
      if ((v16 & 0x80000000) == 0)
      {
        if (*((_DWORD *)v8 + 69) >= 4u)
        {
          v17 = *__error();
          syslog(7, "%s:%d:%s() closing %s fd: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1301, "copyfile", "dst", *((_DWORD *)v8 + 6));
          *__error() = v17;
          v16 = *((_DWORD *)v8 + 6);
        }
        close(v16);
        *((_DWORD *)v8 + 6) = -2;
      }
      v14 = (char *)v8[1];
      if (v14)
      {
LABEL_26:
        free(v14);
        v8[1] = 0;
      }
    }
    v18 = strdup(to);
    v8[1] = v18;
    if (!v18)
      return -1;
  }
  if ((*((_BYTE *)v8 + 194) & 1) == 0 && stat(to, &v113) != -1 && stat(from, &v116) != -1 && statfs(from, &v117) != -1)
  {
    __strlcpy_chk();
    v114[2] = 0;
    v114[0] = 5;
    v114[1] = 0x20000;
    if (getattrlist((const char *)&v115, v114, v112, 0x24uLL, 0) != -1 && v116.st_dev == v113.st_dev)
    {
      if ((v112[4] & 1) == 0 || (v112[20] & 1) == 0)
      {
        v19 = realpath_DARWIN_EXTSN(from, 0);
        if (!v19)
          goto LABEL_46;
        v20 = v19;
        v21 = realpath_DARWIN_EXTSN(to, 0);
        if (!v21)
          goto LABEL_40;
        v22 = v21;
        if (strncasecmp(from, to, 0x400uLL))
        {
          free(v20);
          v20 = v22;
LABEL_40:
          free(v20);
          goto LABEL_46;
        }
LABEL_44:
        if ((*((_BYTE *)v8 + 194) & 2) == 0)
        {
LABEL_123:
          v23 = 0;
          goto LABEL_74;
        }
        v25 = 0;
        v26 = 17;
        goto LABEL_101;
      }
      if (v116.st_ino == v113.st_ino)
        goto LABEL_44;
    }
  }
LABEL_46:
  v27 = *((_DWORD *)v8 + 48);
  if ((v27 & 0x8000) == 0)
  {
    if ((v27 & 0x3000000) == 0)
      goto LABEL_59;
    if (!*((_DWORD *)v8 + 70))
    {
      if ((v27 & 1) != 0)
        v28 = 5;
      else
        v28 = 1;
      if (lstat(*v8, (stat *)&v117) || (v117.f_iosize & 0xD000 | 0x2000) != 0xA000)
      {
        *__error() = 22;
      }
      else if (((*((_BYTE *)v8 + 194) & 0x20) == 0
              || (remove((const std::__fs::filesystem::path *)v8[1], v29) & 0x80000000) == 0
              || *__error() == 2)
             && !clonefileat(-2, *v8, -2, v8[1], v28))
      {
        *((_DWORD *)v8 + 49) |= 0x800u;
        if ((*((_BYTE *)v8 + 194) & 0x10) != 0)
          remove((const std::__fs::filesystem::path *)*v8, v52);
        goto LABEL_123;
      }
      v27 = *((_DWORD *)v8 + 48);
    }
    if ((v27 & 0x2000000) == 0)
    {
      v27 = v27 & 0xFEF9FFF1 | 0x6000E;
      *((_DWORD *)v8 + 48) = v27;
      v30 = *((_DWORD *)v8 + 49);
      if ((v30 & 0x4000) == 0)
        *((_DWORD *)v8 + 49) = v30 | 0x8000;
      v4 = v27;
LABEL_59:
      if ((v4 & 0x10000) != 0)
      {
        *(_QWORD *)&v117.f_bsize = 0;
        if (*v8)
        {
          if ((v27 & 4) != 0)
          {
            v23 = 4 * (listxattr(*v8, 0, 0, (v27 >> 18) & 1) > 0);
            v27 = *((_DWORD *)v8 + 48);
          }
          else
          {
            v23 = 0;
          }
          if ((v27 & 1) != 0)
          {
            v49 = (void (*)(const char *, const char **, const char *))MEMORY[0x1E0C87818];
            if ((v27 & 0x40000) == 0)
              v49 = (void (*)(const char *, const char **, const char *))MEMORY[0x1E0C87968];
            v49(*v8, v8 + 4, v8[23]);
            v23 |= filesec_get_property((filesec_t)v8[23], FILESEC_ACL, &v117) == 0;
          }
          if (*((_DWORD *)v8 + 69) >= 2u)
          {
            v50 = *__error();
            syslog(7, "%s:%d:%s() check result: %d (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2399, "copyfile_check", v23, *v8);
            *__error() = v50;
          }
          if (*(_QWORD *)&v117.f_bsize)
            acl_free(*(void **)&v117.f_bsize);
          if (v8[28])
          {
            if (((_BYTE)v8[24] & 4) != 0)
              v51 = 4;
            else
              v51 = 1;
            v23 |= v51;
          }
        }
        else
        {
          *((_DWORD *)v8 + 68) = 22;
          v23 = -1;
        }
        goto LABEL_73;
      }
      v32 = (filesec_t *)(v8 + 29);
      v31 = (_filesec *)v8[29];
      if (v31)
      {
        filesec_free(v31);
        *v32 = 0;
      }
      v33 = filesec_init();
      *v32 = v33;
      if (v33)
      {
        if ((*((_BYTE *)v8 + 194) & 8) != 0 && !lstat(v8[1], (stat *)&v117) && (v117.f_iosize & 0xF000) == 0xA000)
        {
          v35 = (char *)v8[30];
          if (v35)
            free(v35);
          goto LABEL_133;
        }
        if (statx_np(v8[1], (stat *)&v117, (filesec_t)v8[29]))
        {
          v25 = *__error() == 2;
LABEL_134:
          if ((copyfile_open(v8, v34) & 0x80000000) == 0)
          {
            fcntl(*((_DWORD *)v8 + 4), 48, 1);
            fcntl(*((_DWORD *)v8 + 6), 48, 1);
            fcntl(*((_DWORD *)v8 + 6), 76, 1);
            v56 = copyfile_internal(v8, v4);
            if (v56 != -1)
            {
              v23 = v56;
              if (((v25 | ((v4 & 2) >> 1)) & 1) == 0)
              {
                fchown(*((_DWORD *)v8 + 6), v117.f_bfree, HIDWORD(v117.f_bfree));
                fchmod(*((_DWORD *)v8 + 6), v117.f_iosize);
              }
              reset_security((uint64_t)v8);
              if ((v4 & 0x100000) != 0 && *v8)
                remove((const std::__fs::filesystem::path *)*v8, v57);
              goto LABEL_73;
            }
          }
          goto LABEL_141;
        }
        fixed = copyfile_fix_perms((filesec_t *)v8 + 29);
        v8[30] = (const char *)fixed;
        if (fixed)
        {
          if ((chmodx_np(v8[1], fixed) & 0x80000000) == 0)
          {
            v25 = 0;
            *((_DWORD *)v8 + 49) |= 0x1000u;
            goto LABEL_134;
          }
          if (*__error() != 45)
          {
            v55 = *__error();
            syslog(4, "setting security information: %m");
            *__error() = v55;
            filesec_free((filesec_t)v8[30]);
LABEL_133:
            v25 = 0;
            v8[30] = 0;
            goto LABEL_134;
          }
        }
        v25 = 0;
        goto LABEL_134;
      }
      goto LABEL_96;
    }
    if (*((_DWORD *)v8 + 68))
    {
LABEL_96:
      v25 = 0;
      goto LABEL_141;
    }
    v25 = 0;
    v26 = 45;
LABEL_101:
    *((_DWORD *)v8 + 68) = v26;
LABEL_141:
    if (!v25 && (*((_DWORD *)v8 + 49) & 0x1000) != 0)
    {
      v58 = *__error();
      chown(v8[1], v117.f_bfree, HIDWORD(v117.f_bfree));
      chmod(v8[1], v117.f_iosize);
      *__error() = v58;
    }
    v59 = *((_DWORD *)v8 + 68);
    if (v59)
    {
      *__error() = v59;
      *((_DWORD *)v8 + 68) = 0;
    }
    v23 = -1;
    goto LABEL_147;
  }
  v116.st_ino = 0;
  *(_QWORD *)&v116.st_dev = 0;
  if ((v27 & 0x2F10000) != 0
    || (v38 = *((_DWORD *)v8 + 8), v39 = (std::__fs::filesystem::path *)*v8, (*(_QWORD *)&v116.st_dev = v39) == 0)
    || (v40 = v8[1]) == 0)
  {
    *__error() = 22;
    goto LABEL_70;
  }
  v41 = (uint64_t (*)(const char *, statfs *))MEMORY[0x1E0C88738];
  v42 = (uint64_t (*)(const char *, statfs *))MEMORY[0x1E0C882A8];
  if ((v27 & 0x40000) != 0)
    v43 = MEMORY[0x1E0C882A8](v39, &v117);
  else
    v43 = MEMORY[0x1E0C88738](v39, &v117);
  if (v43 == -1)
    goto LABEL_70;
  v44 = 0;
  if ((v27 & 0x40000) == 0 && (v117.f_iosize & 0xF000) == 0x4000)
  {
    v45 = lstat((const char *)v39, &v115);
    v44 = (v115.st_mode & 0xF000) == 40960;
    if (v45 == -1)
      goto LABEL_70;
  }
  v102 = v44;
  if ((v27 & 0x80000) != 0)
    v46 = v42(v40, &v117);
  else
    v46 = v41(v40, &v117);
  if (v46 == -1)
  {
    if (*__error() == 2 && basename((char *)v39))
      goto LABEL_129;
LABEL_70:
    v23 = -1;
    goto LABEL_71;
  }
  f_iosize = v117.f_iosize;
  if (!basename((char *)v39))
    goto LABEL_70;
  if ((f_iosize & 0xF000) != 0x4000)
  {
LABEL_129:
    __s1 = (char *)v39;
    v106 = strlen((const char *)v39);
    v54 = (const char *)&unk_1DED3E6B9;
    goto LABEL_154;
  }
  v48 = strrchr((char *)v39, 47);
  __s1 = (char *)v39;
  if (v48)
    v106 = v48 - (char *)v39 + 1;
  else
    v106 = 0;
  v54 = "/";
LABEL_154:
  v104 = v40;
  v105 = v54;
  v64 = 0;
  v65 = 0;
  if ((*((_WORD *)v8 + 97) & 0x104) != 0)
    v66 = 20;
  else
    v66 = 21;
  v107 = (*((_DWORD *)v8 + 49) >> 7) & 0x40 | v66;
  v108 = (uint64_t (*)(void))v8[26];
  flagsa = v27 & 0xC0000 | 2;
  v67 = 1;
LABEL_158:
  v68 = v67;
  if ((v67 & 1) == 0 && (v64 & 1) == 0)
  {
LABEL_219:
    v23 = 0;
    goto LABEL_225;
  }
  if (v65)
    fts_close(v65);
  v65 = fts_open((char *const *)&v116, v107, 0);
  while (2)
  {
    v69 = v64;
    do
    {
      while (1)
      {
        v70 = fts_read(v65);
        if (!v70)
        {
          v67 = 0;
          v64 = v69;
          if ((v68 & 1) == 0)
            goto LABEL_219;
          goto LABEL_158;
        }
        v71 = v70;
        if ((v70->fts_info & 0xFFFE) == 0xC)
          break;
        if ((v68 & 1) != 0)
        {
          v110 = v69;
          goto LABEL_170;
        }
      }
      v69 = 1;
    }
    while ((v68 & 1) != 0);
    v110 = v64;
LABEL_170:
    *(_QWORD *)&v115.st_dev = 0;
    v72 = copyfile_state_alloc();
    if (!v72)
      goto LABEL_221;
    v73 = v72;
    *((_OWORD *)v72 + 13) = *((_OWORD *)v8 + 13);
    if ((*((_BYTE *)v8 + 198) & 1) != 0)
      *((_DWORD *)v72 + 49) |= 0x10000u;
    fts_dev = v71->fts_dev;
    if (v38 == fts_dev)
    {
      *((_DWORD *)v72 + 49) |= *((_DWORD *)v8 + 49) & 0x78;
      fts_dev = v38;
    }
    asprintf((char **)&v115, "%s%s%s", v40, v105, &v71->fts_path[v106]);
    v75 = *(const char **)&v115.st_dev;
    if (*(_QWORD *)&v115.st_dev)
    {
      v109 = fts_dev;
      *((_QWORD *)v73 + 32) = v71;
      v76 = *((_DWORD *)v73 + 49);
      *((_DWORD *)v73 + 49) = v76 | 0x20000;
      v77 = 0;
      v78 = 1;
      switch(v71->fts_info)
      {
        case 1u:
          *((_DWORD *)v73 + 49) = v76 | 0x20001;
          if (v102 && !strcmp(__s1, v71->fts_path))
            *((_DWORD *)v73 + 49) = v76 | 0x60001;
          v77 = 1;
          v78 = 2;
          goto LABEL_177;
        case 3u:
        case 8u:
        case 0xCu:
        case 0xDu:
LABEL_177:
          fts_path = v71->fts_path;
          v80 = v108;
          v103 = v78;
          if (!v108)
            goto LABEL_181;
          v81 = v108();
          if (v81 == 1)
          {
            if (!v77 || fts_set(v65, v71, 4) != -1)
              goto LABEL_213;
            v87 = v71->fts_path;
            v88 = *(_QWORD *)&v115.st_dev;
            v89 = v8[27];
            v90 = 0;
          }
          else
          {
            if (v81 == 2)
              goto LABEL_222;
            fts_path = v71->fts_path;
            v75 = *(const char **)&v115.st_dev;
            v80 = v108;
LABEL_181:
            if (v77)
              v82 = 1225654285;
            else
              v82 = 1225654287;
            if ((copyfile(fts_path, v75, v73, v82 & v27) & 0x80000000) == 0)
            {
              v83 = v103;
              if (!v80)
                goto LABEL_213;
              v84 = v71->fts_path;
              v85 = *(_QWORD *)&v115.st_dev;
              v86 = v8[27];
LABEL_187:
              if (((unsigned int (*)(uint64_t, uint64_t, copyfile_state_t, char *, uint64_t, const char *))v108)(v83, 2, v73, v84, v85, v86) == 2)goto LABEL_222;
LABEL_213:
              v97 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
              *((_DWORD *)v8 + 49) = v97;
              *((_DWORD *)v8 + 49) = *((_DWORD *)v73 + 49) & 0x78 | v97;
              copyfile_state_free(v73);
              free(*(void **)&v115.st_dev);
LABEL_214:
              v38 = v109;
              v64 = v110;
              v40 = v104;
              continue;
            }
            v90 = v103;
            if (!v80)
              goto LABEL_223;
            v87 = v71->fts_path;
            v88 = *(_QWORD *)&v115.st_dev;
            v89 = v8[27];
          }
          v91 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, char *, uint64_t, const char *))v108)(v90, 3, v73, v87, v88, v89);
LABEL_202:
          v93 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
          *((_DWORD *)v8 + 49) = v93;
          *((_DWORD *)v8 + 49) = *((_DWORD *)v73 + 49) & 0x78 | v93;
          copyfile_state_free(v73);
          free(*(void **)&v115.st_dev);
          if (v91 == 2)
            goto LABEL_224;
          goto LABEL_214;
        case 5u:
          goto LABEL_213;
        case 6u:
          v94 = v71->fts_path;
          if (v102 && !strcmp(__s1, v71->fts_path))
            *((_DWORD *)v73 + 49) = v76 | 0x60000;
          if (v108)
          {
            v95 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, const char *, const char *, const char *))v108)(3, 1, v73, v94, v75, v8[27]);
            if (v95 == 1)
              goto LABEL_213;
            if (v95 == 2)
            {
LABEL_222:
              *__error() = 0;
LABEL_223:
              v99 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
              *((_DWORD *)v8 + 49) = v99;
              *((_DWORD *)v8 + 49) = *((_DWORD *)v73 + 49) & 0x78 | v99;
              copyfile_state_free(v73);
              free(*(void **)&v115.st_dev);
              goto LABEL_224;
            }
            v96 = copyfile(v71->fts_path, *(const char **)&v115.st_dev, v73, flagsa);
            v84 = v71->fts_path;
            v85 = *(_QWORD *)&v115.st_dev;
            v86 = v8[27];
            if ((v96 & 0x80000000) == 0)
            {
              v83 = 3;
              goto LABEL_187;
            }
            v98 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, char *, _QWORD, const char *))v108)(3, 3, v73, v84, *(_QWORD *)&v115.st_dev, v86);
            if (v98)
            {
              if (v98 == 2)
                goto LABEL_223;
            }
            else
            {
LABEL_201:
              *__error() = 0;
            }
          }
          else if (copyfile(v94, v75, v73, flagsa) < 0)
          {
            goto LABEL_223;
          }
          goto LABEL_213;
        default:
          fts_errno = v71->fts_errno;
          *__error() = fts_errno;
          if (!v108)
            goto LABEL_223;
          v91 = ((uint64_t (*)(_QWORD, uint64_t, copyfile_state_t, char *, _QWORD, const char *))v108)(0, 3, v73, v71->fts_path, *(_QWORD *)&v115.st_dev, v8[27]);
          if (v91 < 2)
            goto LABEL_201;
          goto LABEL_202;
      }
    }
    break;
  }
  copyfile_state_free(v73);
LABEL_221:
  *__error() = 12;
LABEL_224:
  v23 = -1;
LABEL_225:
  if (v65)
    fts_close(v65);
LABEL_71:
  if (*((_DWORD *)v8 + 69))
  {
    v36 = *__error();
    v37 = __error();
    syslog(7, "%s:%d:%s() returning: %d errno %d\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1003, "copytree", v23, *v37);
    *__error() = v36;
  }
LABEL_73:
  if ((v23 & 0x80000000) == 0)
LABEL_74:
    *__error() = 0;
LABEL_147:
  v60 = (_copyfile_state *)v111;
  if (v111 && *((_DWORD *)v111 + 69) >= 5u)
  {
    v61 = *__error();
    v62 = __error();
    syslog(7, "%s:%d:%s() returning %d errno %d\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1446, "copyfile", v23, *v62);
    *__error() = v61;
  }
  if (!state)
  {
    v63 = *__error();
    copyfile_state_free(v60);
    *__error() = v63;
  }
  return v23;
}

int copyfile_state_free(copyfile_state_t a1)
{
  _filesec *v2;
  _filesec *v3;
  _filesec *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  if (!a1)
    return 0;
  v2 = (_filesec *)*((_QWORD *)a1 + 23);
  if (v2)
    filesec_free(v2);
  v3 = (_filesec *)*((_QWORD *)a1 + 29);
  if (v3)
    filesec_free(v3);
  v4 = (_filesec *)*((_QWORD *)a1 + 30);
  if (v4)
    filesec_free(v4);
  if (*(_QWORD *)a1)
  {
    v5 = *((_DWORD *)a1 + 4);
    if (v5 < 0 || (close(v5), *(_QWORD *)a1))
    {
      v6 = *((_DWORD *)a1 + 5);
      if ((v6 & 0x80000000) == 0)
        close(v6);
    }
  }
  if (!*((_QWORD *)a1 + 1))
    goto LABEL_25;
  v7 = *((_DWORD *)a1 + 6);
  if (v7 < 0)
  {
    v8 = 0;
  }
  else
  {
    if (close(v7))
      v8 = -1;
    else
      v8 = 0;
    if (!*((_QWORD *)a1 + 1))
      goto LABEL_24;
  }
  v10 = *((_DWORD *)a1 + 7);
  if ((v10 & 0x80000000) == 0 && close(v10))
    goto LABEL_26;
LABEL_24:
  if (v8 < 0)
  {
LABEL_26:
    v11 = *__error();
    syslog(4, "error closing files: %m");
    *__error() = v11;
    v9 = -1;
    goto LABEL_27;
  }
LABEL_25:
  v9 = 0;
LABEL_27:
  v12 = (void *)*((_QWORD *)a1 + 31);
  if (v12)
    free(v12);
  v13 = (void *)*((_QWORD *)a1 + 22);
  if (v13)
    free(v13);
  v14 = (void *)*((_QWORD *)a1 + 1);
  if (v14)
    free(v14);
  if (*(_QWORD *)a1)
    free(*(void **)a1);
  free(a1);
  return v9;
}

uint64_t copyfile_preamble(copyfile_state_t *a1, int a2)
{
  copyfile_state_t v3;
  char *v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v3 = *a1;
  if (!*a1)
  {
    v3 = copyfile_state_alloc();
    *a1 = v3;
    if (!v3)
      return 0xFFFFFFFFLL;
  }
  if (a2 < 0)
  {
    v5 = getenv("COPYFILE_DEBUG");
    if (v5)
    {
      v6 = v5;
      *__error() = 0;
      v7 = strtol(v6, 0, 0);
      *((_DWORD *)v3 + 69) = v7;
      if (!v7)
      {
        if (*__error())
          *((_DWORD *)v3 + 69) = 1;
      }
    }
    if (*((_DWORD *)v3 + 69) >= 2u)
    {
      v8 = *__error();
      syslog(7, "%s:%d:%s() debug value set to: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1507, "copyfile_preamble", *((_DWORD *)v3 + 69));
      *__error() = v8;
    }
  }
  if (*((_DWORD *)v3 + 69) >= 2u)
  {
    v9 = *__error();
    syslog(7, "%s:%d:%s() setting flags: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1518, "copyfile_preamble", *((_DWORD *)v3 + 48));
    *__error() = v9;
  }
  result = 0;
  *((_DWORD *)v3 + 48) = a2;
  return result;
}

copyfile_state_t copyfile_state_alloc(void)
{
  _filesec **v0;
  _copyfile_state *v1;
  __int128 v2;
  _filesec *v3;

  v0 = (_filesec **)malloc_type_calloc(1uLL, 0x128uLL, 0x10B0040A2ED8E21uLL);
  v1 = (_copyfile_state *)v0;
  if (v0)
  {
    *(_QWORD *)&v2 = 0x100000001;
    *((_QWORD *)&v2 + 1) = 0x100000001;
    *((_OWORD *)v0 + 1) = v2;
    v3 = v0[23];
    if (v3)
    {
      filesec_free(v3);
      *((_QWORD *)v1 + 23) = 0;
    }
    *((_QWORD *)v1 + 23) = filesec_init();
  }
  else
  {
    *__error() = 12;
  }
  return v1;
}

void reset_security(uint64_t a1)
{
  int v1;
  int v3;
  int v4;
  _filesec *v5;
  _acl_entry *v6;
  uid_t v7;
  _QWORD *qualifier;
  _BOOL4 v9;
  stat v11;
  stat v12;
  acl_entry_t entry_p;
  void *v14;
  acl_tag_t tag_type_p;
  acl_entry_t v16;
  acl_t v17;
  acl_permset_t permset_p;
  acl_permset_t v19;
  uuid_t uu;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C874D8];
  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 0x80000000) == 0)
  {
    v3 = *(_DWORD *)(a1 + 16);
    if (v3 < 0 || (*(_BYTE *)(a1 + 192) & 2) == 0)
      v3 = v1;
    fstat(v3, &v11);
    if ((*(_BYTE *)(a1 + 196) & 1) == 0)
    {
      v4 = *(_DWORD *)(a1 + 24);
      v14 = 0;
      v5 = filesec_init();
      if (!v5)
        goto LABEL_9;
      if (fstatx_np(v4, &v12, v5))
      {
        if (*__error() != 45)
        {
LABEL_10:
          if (v14)
            acl_free(v14);
          if (v5)
            filesec_free(v5);
          return;
        }
LABEL_9:
        fchmod(v4, v11.st_mode & 0xFFF);
        goto LABEL_10;
      }
      if (filesec_get_property(v5, FILESEC_ACL, &v14) || acl_get_entry((acl_t)v14, 0, &entry_p))
        goto LABEL_10;
      v6 = entry_p;
      v7 = geteuid();
      mbr_uid_to_uuid(v7, uu);
      qualifier = acl_get_qualifier(v6);
      v17 = acl_init(1);
      if (v17)
      {
        add_uberace(&v17);
        v9 = 0;
        if (acl_get_entry(v17, 0, &v16))
          goto LABEL_25;
        acl_get_permset(v16, &permset_p);
        acl_get_tag_type(v6, &tag_type_p);
        acl_get_permset(v6, &v19);
        if (tag_type_p == ACL_EXTENDED_ALLOW && *qualifier == *(_QWORD *)uu && qualifier[1] == *(_QWORD *)&uu[8])
        {
          v9 = *(_DWORD *)permset_p == *(_DWORD *)v19;
          if (!qualifier)
          {
LABEL_27:
            if (v17)
              acl_free(v17);
            if (!v9)
              goto LABEL_10;
            *(_WORD *)uu = v11.st_mode & 0xFFF;
            if (!acl_delete_entry((acl_t)v14, entry_p)
              && !filesec_set_property(v5, FILESEC_ACL, &v14)
              && !filesec_set_property(v5, FILESEC_MODE, uu)
              && !fchmodx_np(v4, v5))
            {
              goto LABEL_10;
            }
            goto LABEL_9;
          }
LABEL_26:
          acl_free(qualifier);
          goto LABEL_27;
        }
      }
      v9 = 0;
LABEL_25:
      if (!qualifier)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
}

uint64_t copyfile_open(const char **a1, std::error_code *a2)
{
  unsigned int (*v3)(void);
  int v4;
  int v5;
  int v6;
  int v7;
  const std::__fs::filesystem::path *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  size_t v23;
  char *v24;
  char *v25;
  int v26;
  int i;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  __int16 v43;
  unsigned int (*v44)(const char *, stat *);
  unsigned __int16 v45;
  int v46;
  int v47;
  unsigned int v48;
  const char *v49;
  uint64_t v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  const char *v60;
  __int16 v61;
  unsigned int v62;
  int v63;
  int v64;
  int v66;
  unsigned int v67;
  int v68;
  int v69;
  ssize_t v70;
  int v71;
  const char *v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  stat v78;
  statfs v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C874D8];
  if (!*a1 || *((_DWORD *)a1 + 4) != -2)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    goto LABEL_10;
  }
  if (((_DWORD)a1[24] & 0x40000) != 0)
    v3 = (unsigned int (*)(void))MEMORY[0x1E0C87818];
  else
    v3 = (unsigned int (*)(void))MEMORY[0x1E0C87968];
  if (!v3())
  {
    v13 = *((_WORD *)a1 + 18) & 0xF000;
    switch(v13)
    {
      case 16384:
        v5 = 0;
        v14 = 1;
        v15 = 1;
        break;
      case 40960:
        v15 = 0;
        v5 = 0;
        v37 = *((_DWORD *)a1 + 48);
        v36 = 0x200000;
        v35 = 1;
        v14 = 1;
        v38 = 0x200000;
LABEL_65:
        if ((v37 & 0x400000) != 0)
          v39 = v38;
        else
          v39 = v36;
        if ((v37 & 0x400000) != 0)
          v6 = 0;
        else
          v6 = v15;
        if ((v37 & 0x400000) != 0)
          v7 = 0;
        else
          v7 = v35;
        v40 = open(*a1, v39, 0);
        *((_DWORD *)a1 + 4) = v40;
        if (v40 < 0)
        {
          v4 = *__error();
LABEL_149:
          syslog(4, "open on %s: %m");
          goto LABEL_8;
        }
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          v41 = *__error();
          syslog(7, "%s:%d:%s() open successful on source (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1946, "copyfile_open", *a1);
          *__error() = v41;
        }
        v42 = *((_DWORD *)a1 + 49);
        *((_DWORD *)a1 + 49) = v42 | 0x80;
        if ((v42 & 0x20000) != 0)
        {
          if (!a1[32])
          {
            *__error() = 2;
            *((_DWORD *)a1 + 68) = 2;
            v34 = *__error();
            syslog(4, "missing FTS entry during recursive copy\n: %m");
            goto LABEL_135;
          }
          if (!lstat(*a1, &v78))
          {
            v61 = 0;
            v62 = *((unsigned __int16 *)a1[32] + 44);
            if (v62 > 0xB)
            {
              if (v62 - 12 <= 1)
                v61 = -24576;
            }
            else if (v62 == 1 || v62 == 6)
            {
              v61 = 0x4000;
            }
            else if (v62 == 8)
            {
              v61 = 0x8000;
            }
            if ((*((_BYTE *)a1 + 198) & 4) != 0)
              v45 = -24576;
            else
              v45 = v61;
LABEL_177:
            if ((v78.st_mode & 0xF000) != v45)
            {
              *__error() = 9;
              *((_DWORD *)a1 + 68) = 9;
              v4 = *__error();
              syslog(4, "file type (%u) does not match expected %u on %s\n: %m");
              goto LABEL_8;
            }
            if (!a1[28])
              a1[28] = 0;
            if ((v14 & 1) == 0)
            {
              v67 = *((_DWORD *)a1 + 48);
              if ((v67 & 4) != 0)
              {
                if ((v67 & 8) != 0 && (*((_BYTE *)a1 + 148) & 0x20) != 0)
                {
                  v68 = 32 * doesdecmpfs(*((_DWORD *)a1 + 4));
                  v67 = *((_DWORD *)a1 + 48);
                }
                else
                {
                  v68 = 0;
                }
                v70 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0, 0, 0, (v67 >> 18) & 1 | v68);
                *__error() = 0;
                if (v70 > 0x100000)
                {
                  if (*((_DWORD *)a1 + 69) >= 2u)
                  {
                    v71 = *__error();
                    syslog(7, "%s:%d:%s() %s has large resource fork, will use namedfork to copy\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2057, "copyfile_open", *a1);
                    *__error() = v71;
                  }
                  snprintf((char *)&v79, 0x400uLL, "%s%s", *a1, "/..namedfork/rsrc");
                  v72 = (const char *)malloc_type_malloc(0x90uLL, 0x1000040B72DA15FuLL);
                  a1[22] = v72;
                  if (!v72)
                    goto LABEL_199;
                  if (((_DWORD)a1[24] & 0x40000) != 0)
                    v73 = MEMORY[0x1E0C882A8](&v79, v72);
                  else
                    v73 = MEMORY[0x1E0C88738](&v79, v72);
                  if (v73)
                  {
                    v74 = *__error();
                    syslog(4, "stat on %s: %m", (const char *)&v79);
                    *__error() = v74;
                    free((void *)a1[22]);
                    a1[22] = 0;
LABEL_199:
                    v75 = *__error();
                    syslog(4, "malloc/stat/open on %s: %m", (const char *)&v79);
                    *__error() = v75;
                    *__error() = 0;
                    goto LABEL_10;
                  }
                  if (!a1[22])
                    goto LABEL_199;
                  v76 = open((const char *)&v79, v39, 0);
                  *((_DWORD *)a1 + 5) = v76;
                  if (v76 < 0)
                    goto LABEL_199;
                  if (*((_DWORD *)a1 + 69) >= 2u)
                  {
                    v77 = *__error();
                    syslog(7, "%s:%d:%s() open successful on source rsrc (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2085, "copyfile_open", (const char *)&v79);
                    *__error() = v77;
                  }
                  *((_DWORD *)a1 + 49) |= 0x400u;
                }
              }
            }
LABEL_10:
            v8 = (const std::__fs::filesystem::path *)a1[1];
            if (!v8 || *((_DWORD *)a1 + 6) != -2)
              goto LABEL_154;
            v9 = *((_DWORD *)a1 + 48);
            if ((v9 & 0x800000) != 0)
              v10 = 2560;
            else
              v10 = ((v9 & 0x8000008) != 0) | 0xA00;
            if ((v9 & 0x400000) != 0)
              v11 = 2561;
            else
              v11 = v10;
            if ((v9 & 0x200000) != 0 && remove(v8, a2) < 0 && *__error() != 2)
            {
              v4 = *__error();
              syslog(4, "%s: remove: %m");
              goto LABEL_8;
            }
            if ((*((_BYTE *)a1 + 194) & 8) != 0)
            {
              v16 = lstat(a1[1], (stat *)&v79);
              if ((v79.f_iosize & 0xF000) == 0xA000)
                v17 = 0x200000;
              else
                v17 = 256;
              if (v16 == -1)
                v12 = 256;
              else
                v12 = v17;
            }
            else
            {
              v12 = 0;
            }
            v18 = *((_DWORD *)a1 + 49);
            if ((v18 & 8) == 0)
            {
              v19 = fstatfs(*((_DWORD *)a1 + 4), &v79);
              if (v19 == -1 || (v79.f_flags & 0x80) == 0)
              {
                if (v19 == -1)
                  goto LABEL_123;
                v20 = *((_DWORD *)a1 + 49);
              }
              else
              {
                v20 = *((_DWORD *)a1 + 49) | 0x10;
              }
              v18 = v20 | 8;
              *((_DWORD *)a1 + 49) = v18;
            }
            v21 = 0xFFFFFFFFLL;
            v22 = v6 | v5;
            if (v6 | v5)
            {
              if ((v18 & 0x210) == 0x10)
              {
                v21 = fcntl(*((_DWORD *)a1 + 4), 63);
                if ((v21 & 0x80000000) != 0)
                {
                  v4 = *__error();
                  __error();
                  syslog(4, "GET_PROT_CLASS failed on (%s) with error <%d>: %m");
                  goto LABEL_8;
                }
              }
            }
            if (v7)
            {
              v23 = (size_t)a1[16];
              v24 = (char *)malloc_type_calloc(1uLL, v23 + 1, 0x993BDDDDuLL);
              if (v24)
              {
                v25 = v24;
                if (readlink(*a1, v24, v23) == -1)
                {
                  v47 = *__error();
                  syslog(4, "cannot readlink %s: %m");
LABEL_127:
                  *__error() = v47;
                  free(v25);
                  return 0xFFFFFFFFLL;
                }
                if (symlink(v25, a1[1]) == -1 && (*__error() != 17 || (*((_BYTE *)a1 + 194) & 2) != 0))
                {
                  v47 = *__error();
                  syslog(4, "Cannot make symlink %s: %m");
                  goto LABEL_127;
                }
                free(v25);
                v26 = open(a1[1], 0x200000);
                *((_DWORD *)a1 + 6) = v26;
                if (v26 == -1)
                {
                  v4 = *__error();
                  syslog(4, "Cannot open symlink %s for reading: %m");
                  goto LABEL_8;
                }
                i = 0;
                goto LABEL_53;
              }
              v34 = *__error();
              syslog(4, "cannot allocate %zd bytes: %m");
LABEL_135:
              *__error() = v34;
              return 0xFFFFFFFFLL;
            }
            if (!v6)
            {
              for (i = 0; ; i = 1)
              {
                v48 = v11 & 0xFFFFF9FE;
                while (1)
                {
                  while (1)
                  {
                    v49 = a1[1];
                    v50 = *((unsigned __int16 *)a1 + 18) | 0x80u;
                    if ((statfs(v49, &v79) != -1
                       || *__error() == 2 && dirname_r(v49, (char *)&v78) && statfs((const char *)&v78, &v79) != -1)
                      && (v79.f_flags & 0x80) != 0)
                    {
                      v51 = open_dprotected_np(v49, v11 | v12, v21, 0, v50);
                    }
                    else
                    {
                      v51 = open(v49, v11 | v12, v50);
                    }
                    *((_DWORD *)a1 + 6) = v51;
                    if ((v51 & 0x80000000) == 0)
                      goto LABEL_53;
                    v52 = *__error();
                    if (v52 != 13)
                      break;
                    if (chmod(a1[1], *((_WORD *)a1 + 18) & 0xF7F | 0x80))
                    {
                      if (*__error() == 2)
                        *__error() = 13;
LABEL_148:
                      v4 = *__error();
                      goto LABEL_149;
                    }
                    *((_DWORD *)a1 + 49) |= 0x1000u;
                  }
                  if (v52 != 21)
                    break;
                  if (*((_DWORD *)a1 + 69) >= 3u)
                  {
                    v53 = *__error();
                    syslog(7, "%s:%d:%s() open failed because it is a directory (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2274, "copyfile_open", a1[1]);
                    *__error() = v53;
                  }
                  v54 = *((_DWORD *)a1 + 48);
                  if ((v54 & 0x20000) != 0)
                  {
                    v11 = v48;
                    if ((v54 & 0x800000) == 0)
                      goto LABEL_148;
                  }
                  else
                  {
                    v11 = v48;
                    if ((v54 & 0x800008) == 8)
                      goto LABEL_148;
                  }
                }
                if (v52 != 17)
                  goto LABEL_148;
                if (*((_DWORD *)a1 + 69) >= 3u)
                {
                  v55 = *__error();
                  syslog(7, "%s:%d:%s() open failed, retrying (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2241, "copyfile_open", a1[1]);
                  *__error() = v55;
                }
                v56 = *((_DWORD *)a1 + 48);
                if ((v56 & 0x20000) != 0)
                  goto LABEL_148;
                v11 &= ~0x200u;
                if ((v56 & 0x400008) != 0)
                {
                  if (*((_DWORD *)a1 + 69) >= 4u)
                  {
                    v57 = *__error();
                    syslog(7, "%s:%d:%s() truncating existing file (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2251, "copyfile_open", a1[1]);
                    *__error() = v57;
                  }
                  v11 |= 0x400u;
                }
              }
            }
            if (mkdir(a1[1], *((_WORD *)a1 + 18) & 0xE3F | 0x1C0) == -1)
            {
              if (*__error() != 17 || (*((_BYTE *)a1 + 194) & 2) != 0)
              {
                v4 = *__error();
                syslog(4, "Cannot make directory %s: %m");
                goto LABEL_8;
              }
              if ((*((_BYTE *)a1 + 198) & 1) != 0)
              {
                if (lstat(a1[1], (stat *)&v79) == -1)
                {
                  v60 = "Cannot lstat destination %s: %m";
                  goto LABEL_188;
                }
                if ((v79.f_iosize & 0xF000) == 0xA000)
                {
                  *__error() = 9;
                  *((_DWORD *)a1 + 68) = 9;
                  v60 = "Destination %s already exists as a symlink, refusing to copy: %m";
LABEL_188:
                  v69 = *__error();
                  syslog(4, v60, a1[1]);
                  *__error() = v69;
                  return 0xFFFFFFFFLL;
                }
              }
            }
            v28 = open(a1[1], v12);
            *((_DWORD *)a1 + 6) = v28;
            if (v28 == -1)
            {
              v4 = *__error();
              syslog(4, "Cannot open directory %s for reading: %m");
              goto LABEL_8;
            }
            i = 1;
LABEL_53:
            if (*((_DWORD *)a1 + 69) >= 2u)
            {
              v29 = *__error();
              syslog(7, "%s:%d:%s() open successful on destination (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2285, "copyfile_open", a1[1]);
              *__error() = v29;
            }
            v30 = *((_DWORD *)a1 + 49);
            LOWORD(v31) = v30 | 0x100;
            *((_DWORD *)a1 + 49) = v30 | 0x100;
            if ((v30 & 0x10) == 0)
              goto LABEL_56;
            if ((v30 & 0x20) != 0)
            {
LABEL_165:
              if (v22 && i && (v31 & 0x240) == 0x40)
              {
                if (fcntl(*((_DWORD *)a1 + 6), 64, v21))
                {
                  v4 = *__error();
                  __error();
                  syslog(4, "SET_PROT_CLASS failed on (%s) with error <%d>: %m");
                  goto LABEL_8;
                }
                v31 = *((_DWORD *)a1 + 49);
              }
LABEL_56:
              if ((v31 & 0x400) == 0)
                goto LABEL_154;
              snprintf((char *)&v79, 0x400uLL, "%s%s", a1[1], "/..namedfork/rsrc");
              v32 = open((const char *)&v79, 1537, *((unsigned __int16 *)a1 + 18) | 0x80u);
              *((_DWORD *)a1 + 7) = v32;
              if (v32 == -1)
              {
                v63 = *__error();
                syslog(4, "open on %s: %m", (const char *)&v79);
                *__error() = v63;
                free((void *)a1[22]);
                a1[22] = 0;
                if (close(*((_DWORD *)a1 + 5)))
                {
                  v64 = *__error();
                  syslog(4, "error closing source rsrc file descriptor: %m");
                  *__error() = v64;
                }
                v33 = 0;
                *((_DWORD *)a1 + 5) = -1;
                *((_DWORD *)a1 + 49) &= ~0x400u;
              }
              else
              {
                if (*((_DWORD *)a1 + 69) < 2u)
                  goto LABEL_154;
                v33 = *__error();
                syslog(7, "%s:%d:%s() open successful on destination rsrc (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2346, "copyfile_open", (const char *)&v79);
              }
              *__error() = v33;
LABEL_154:
              if (((_DWORD)a1[3] & 0x80000000) == 0 && ((_DWORD)a1[2] & 0x80000000) == 0)
                return 0;
              if (*((_DWORD *)a1 + 69))
              {
                v66 = *__error();
                syslog(7, "%s:%d:%s() file descriptors not open (src: %d, dst: %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2354, "copyfile_open", *((_DWORD *)a1 + 4), *((_DWORD *)a1 + 6));
                *__error() = v66;
              }
              v46 = 22;
              goto LABEL_160;
            }
            v58 = fstatfs(*((_DWORD *)a1 + 6), &v79);
            if (v58 != -1 && (v79.f_flags & 0x80) != 0)
            {
              v59 = *((_DWORD *)a1 + 49) | 0x40;
LABEL_164:
              v31 = v59 | 0x20;
              *((_DWORD *)a1 + 49) = v31;
              goto LABEL_165;
            }
            if (v58 != -1)
            {
              v59 = *((_DWORD *)a1 + 49);
              goto LABEL_164;
            }
LABEL_123:
            v4 = *__error();
            __error();
            syslog(4, "failed to determine copy protection on (%s) with error <%d>: %m");
            goto LABEL_8;
          }
        }
        else
        {
          v43 = *((_WORD *)a1 + 18);
          v44 = (unsigned int (*)(const char *, stat *))MEMORY[0x1E0C882A8];
          if (((_DWORD)a1[24] & 0x40000) == 0)
            v44 = (unsigned int (*)(const char *, stat *))MEMORY[0x1E0C88738];
          if (!v44(*a1, &v78))
          {
            v45 = v43 & 0xF000;
            goto LABEL_177;
          }
        }
        v4 = *__error();
        syslog(4, "repeat stat on %s\n: %m");
        goto LABEL_8;
      case 32768:
        v14 = 0;
        v15 = 0;
        v5 = 1;
        break;
      default:
        if (strcmp(*a1, "/dev/null") || ((_BYTE)a1[24] & 7) == 0)
        {
          v46 = 45;
LABEL_160:
          *((_DWORD *)a1 + 68) = v46;
          return 0xFFFFFFFFLL;
        }
        v5 = 0;
        v15 = 0;
        v14 = 1;
        break;
    }
    v35 = 0;
    v36 = 0;
    v37 = *((_DWORD *)a1 + 48);
    v38 = (v37 >> 10) & 0x100;
    goto LABEL_65;
  }
  v4 = *__error();
  syslog(4, "stat on %s: %m");
LABEL_8:
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

char *__cdecl xattr_name_without_flags(const char *a1)
{
  char *v2;
  size_t v3;
  char *v4;
  char *v5;

  v2 = strrchr((char *)a1, 35);
  if (!v2)
  {
    v5 = strdup(a1);
    if (v5)
      return v5;
LABEL_5:
    v5 = 0;
    *__error() = 12;
    return v5;
  }
  v3 = v2 - a1 + 1;
  v4 = (char *)malloc_type_calloc(v3, 1uLL, 0xA8D8BEC8uLL);
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  strlcpy(v4, a1, v3);
  return v5;
}

uint64_t nameInDefaultList(char *__s2)
{
  const char *v2;
  const char **i;
  size_t v4;
  const char *v5;

  if (nameInDefaultList_onceToken != -1)
    dispatch_once(&nameInDefaultList_onceToken, &__block_literal_global_0);
  v2 = *(const char **)defaultPropertyTable;
  if (!*(_QWORD *)defaultPropertyTable)
    return 0;
  for (i = (const char **)(defaultPropertyTable + 24); ; i += 3)
  {
    if ((*(_BYTE *)(i - 1) & 1) != 0)
    {
      v4 = strlen(v2);
      if (!strncmp(v2, __s2, v4))
        break;
    }
    if (!strcmp(v2, __s2))
      break;
    v5 = *i;
    v2 = v5;
    if (!v5)
      return 0;
  }
  return (uint64_t)*(i - 2);
}

uint64_t copyfile_internal(_QWORD *a1, int a2)
{
  int v3;
  uint64_t v5;
  filesec_t v6;
  _filesec *v7;
  filesec_t v8;
  _filesec *v9;
  mode_t v10;
  int v11;
  _BOOL4 v12;
  int v13;
  const char *v15;
  size_t v16;
  void *v17;
  unint64_t v18;
  ssize_t v19;
  int v20;
  int v21;
  ssize_t v22;
  size_t v23;
  char *v24;
  int64_t v25;
  int v26;
  int v27;
  char *v28;
  ssize_t v29;
  ssize_t v31;
  int v32;
  int v33;
  ssize_t v34;
  size_t v35;
  char *v36;
  char *v37;
  ssize_t v38;
  const char *v39;
  const char *v40;
  int v41;
  const char *v42;
  int v43;
  const char *v44;
  void *v45;
  char *v46;
  const char *v47;
  _BOOL4 v48;
  BOOL v49;
  int v50;
  ssize_t v51;
  ssize_t v52;
  int v53;
  int v54;
  char *v55;
  ssize_t v56;
  char *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  size_t v65;
  xattr_operation_intent_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v68;
  ssize_t v69;
  ssize_t v70;
  int v71;
  int v72;
  _DWORD *v73;
  ssize_t v74;
  ssize_t v76;
  size_t v77;
  size_t v78;
  size_t v79;
  ssize_t v80;
  u_int32_t v81;
  int v82;
  int v83;
  int *v84;
  int v85;
  size_t v86;
  unsigned int (*v87)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v88;
  int v89;
  unsigned int (*v90)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v91;
  int v92;
  uint64_t v93;
  int v94;
  int *v95;
  unsigned int (*v96)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v97;
  int v98;
  uint64_t v99;
  int v100;
  const char *v101;
  const char *v102;
  int v103;
  int v104;
  int v105;
  const char *v106;
  const char *v107;
  int v108;
  const char *v109;
  const char *v110;
  int v111;
  uint64_t v112;
  int v113;
  const char *v114;
  const char *v115;
  int v116;
  int v117;
  int v118;
  int v119;
  char *v120;
  unint64_t v121;
  unsigned int *v122;
  unsigned int v123;
  uint64_t v124;
  int v125;
  void *v126;
  void *v127;
  ssize_t v128;
  uint64_t v129;
  size_t v130;
  char *v131;
  unint64_t v132;
  char *v133;
  uint64_t v134;
  int v135;
  uint64_t (*v136)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v140;
  void *v141;
  int v142;
  int v143;
  int v144;
  int64_t v145;
  off_t v146;
  void *v147;
  void *v148;
  ssize_t v149;
  size_t v150;
  int v151;
  int v152;
  int v153;
  uint64_t (*v154)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v155;
  uint64_t (*v156)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v157;
  int v158;
  int v159;
  uint64_t (*v160)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v161;
  int v162;
  const char *v163;
  int v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  BOOL v170;
  uint64_t size;
  unsigned int sizea;
  acl_t acl[3];
  acl_flagset_t flagset_p;
  acl_entry_t entry_p;
  void *obj_p;
  acl_t acl_p;
  stat v178;
  statfs v179;
  uint64_t v180;

  v180 = *MEMORY[0x1E0C874D8];
  v3 = *((_DWORD *)a1 + 6);
  if (v3 < 0 || (a1[2] & 0x80000000) != 0)
  {
    if (*((_DWORD *)a1 + 69))
    {
      v13 = *__error();
      syslog(7, "%s:%d:%s() file descriptors not open (src: %d, dst: %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1535, "copyfile_internal", *((_DWORD *)a1 + 4), *((_DWORD *)a1 + 6));
      *__error() = v13;
    }
    *((_DWORD *)a1 + 68) = 22;
    return 0xFFFFFFFFLL;
  }
  if ((a2 & 0x400000) != 0)
  {
    v5 = copyfile_pack(a1);
    if ((v5 & 0x80000000) != 0)
    {
      v15 = (const char *)a1[1];
      if (v15)
        unlink(v15);
    }
    return v5;
  }
  if ((a2 & 0x800000) != 0)
  {
    if ((uint64_t)a1[16] >= 65554)
      v16 = 65554;
    else
      v16 = a1[16];
    v17 = malloc_type_calloc(1uLL, v16, 0xB9A64F37uLL);
    if (!v17)
    {
      if (*((_DWORD *)a1 + 69))
      {
        v32 = *__error();
        syslog(7, "%s:%d:%s() copyfile_unpack: calloc(1, %zu) returned NULL\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4661, "copyfile_unpack", v16);
        *__error() = v32;
      }
      return 0xFFFFFFFFLL;
    }
    v18 = (unint64_t)v17;
    v19 = pread(*((_DWORD *)a1 + 4), v17, v16, 0);
    v20 = v19;
    if (v19 < 0)
    {
      if (*((_DWORD *)a1 + 69))
      {
        v33 = *__error();
        syslog(7, "%s:%d:%s() pread returned: %zd\n");
LABEL_78:
        *__error() = v33;
      }
    }
    else
    {
      if (v19 < (uint64_t)v16)
      {
        if (*((_DWORD *)a1 + 69))
        {
          v21 = *__error();
          syslog(7, "%s:%d:%s() pread couldn't read entire header: %d of %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4679, "copyfile_unpack", v20, a1[16]);
          *__error() = v21;
        }
        goto LABEL_79;
      }
      if ((unint64_t)v19 >= 0x52
        && *(_DWORD *)v18 == 118883584
        && *(_DWORD *)(v18 + 4) == 512
        && *(_WORD *)(v18 + 24) == 512
        && *(_DWORD *)(v18 + 26) == 150994944)
      {
        swap_adhdr((int8x8_t *)v18);
        v34 = flistxattr(*((_DWORD *)a1 + 6), 0, 0, 0);
        v35 = v34;
        if (v34 < 1)
        {
          if (v34 < 0 && *__error() != 45 && *__error() != 1)
            goto LABEL_312;
        }
        else
        {
          v36 = (char *)malloc_type_malloc(v34, 0x810CCEE3uLL);
          if (!v36)
          {
            *((_DWORD *)a1 + 68) = 12;
            goto LABEL_312;
          }
          v37 = v36;
          v38 = flistxattr(*((_DWORD *)a1 + 6), v36, v35, 0);
          if (v38 >= 1)
          {
            v39 = &v37[v38];
            v40 = v37;
            do
            {
              fremovexattr(*((_DWORD *)a1 + 6), v40, 0);
              v40 += strlen(v40) + 1;
            }
            while (v40 < v39);
          }
          free(v37);
        }
        if (*(_DWORD *)(v18 + 34) >= 0x21u)
        {
          if (v16 <= 0x77)
          {
            v33 = *__error();
            syslog(4, "bad attribute header:  %zu < %zu: %m");
            goto LABEL_78;
          }
          swap_attrhdr(v18);
          if (*(_DWORD *)(v18 + 84) != 1096045650)
          {
            if ((*((_BYTE *)a1 + 195) & 0x40) == 0)
              goto LABEL_79;
            v33 = *__error();
            syslog(4, "bad attribute header: %m");
            goto LABEL_78;
          }
          v119 = *(unsigned __int16 *)(v18 + 118);
          if (*(_WORD *)(v18 + 118))
          {
            v120 = 0;
            sizea = 0;
            v121 = v18 + v16;
            v122 = (unsigned int *)(v18 + 120);
            while (1)
            {
              if ((unint64_t)v122 >= v121 || (unint64_t)v122 < v18 || (unint64_t)(v122 + 3) > v121)
              {
LABEL_365:
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  v144 = *__error();
                  syslog(4, "Incomplete or corrupt attribute entry: %m", v165);
                  goto LABEL_400;
                }
                goto LABEL_401;
              }
              v123 = bswap32(v122[1]);
              *v122 = bswap32(*v122);
              v122[1] = v123;
              *((_WORD *)v122 + 4) = bswap32(*((unsigned __int16 *)v122 + 4)) >> 16;
              v124 = *((unsigned __int8 *)v122 + 10);
              if (v124 <= 1)
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  v144 = *__error();
                  syslog(4, "Corrupt attribute entry (only %d bytes): %m");
                  goto LABEL_400;
                }
                goto LABEL_401;
              }
              if (v124 >= 0x81)
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  v144 = *__error();
                  syslog(4, "Corrupt attribute entry (name length is %d bytes): %m");
                  goto LABEL_400;
                }
LABEL_401:
                v143 = 22;
LABEL_402:
                *((_DWORD *)a1 + 68) = v143;
                goto LABEL_79;
              }
              if ((unint64_t)v122 + v124 + 11 > v121)
                goto LABEL_365;
              if (*((_BYTE *)v122 + (v124 - 1) + 11))
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  v144 = *__error();
                  syslog(4, "Corrupt attribute entry (name is not NUL-terminated): %m");
LABEL_400:
                  *__error() = v144;
                }
                goto LABEL_401;
              }
              if (*((_DWORD *)a1 + 69) >= 3u)
              {
                v125 = *__error();
                syslog(7, "%s:%d:%s() extracting \"%s\" (%d bytes) at offset %u\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4851, "copyfile_unpack", (const char *)v122 + 11, v122[1], *v122);
                *__error() = v125;
                v123 = v122[1];
              }
              v126 = malloc_type_malloc(v123, 0x3EECC380uLL);
              if (!v126)
              {
                if (*((_DWORD *)a1 + 69))
                {
                  v158 = *__error();
                  syslog(7, "%s:%d:%s() no memory for %u bytes\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4855, "copyfile_unpack", v122[1]);
                  *__error() = v158;
                }
                v143 = 12;
                goto LABEL_402;
              }
              v127 = v126;
              v128 = pread(*((_DWORD *)a1 + 4), v126, v122[1], *v122);
              v129 = v122[1];
              if (v128 != v129)
              {
                if (*((_DWORD *)a1 + 69))
                {
                  v159 = *__error();
                  syslog(7, "%s:%d:%s() failed to read %u bytes at offset %u\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4861, "copyfile_unpack", v122[1], *v122);
                  *__error() = v159;
                }
                *((_DWORD *)a1 + 68) = 22;
LABEL_409:
                free((void *)v18);
                v45 = v127;
LABEL_80:
                free(v45);
                return 0xFFFFFFFFLL;
              }
              v130 = v128;
              if (strcmp((const char *)v122 + 11, "figgledidiggledy"))
              {
                if (strcmp((const char *)v122 + 11, "com.apple.acl.text"))
                {
                  v5 = copyfile_unpack_xattr(a1, (uint64_t)v122, v127);
                  if ((_DWORD)v5 == -1)
                    goto LABEL_409;
                  goto LABEL_335;
                }
                if ((_DWORD)v129)
                {
                  v131 = (char *)malloc_type_malloc(v130, 0xC8354D1AuLL);
                  if (!v131)
                    goto LABEL_409;
                  v120 = v131;
                  memcpy(v131, v127, v122[1]);
                  v5 = 0;
                  sizea = v122[1];
                  goto LABEL_335;
                }
              }
              v5 = 0;
LABEL_335:
              free(v127);
              v122 = (unsigned int *)((char *)v122 + ((*((unsigned __int8 *)v122 + 10) + 14) & 0x1FC));
              --v119;
              v121 = v18 + v16;
              if (!v119)
                goto LABEL_338;
            }
          }
        }
        sizea = 0;
        v120 = 0;
        v5 = 0;
LABEL_338:
        v132 = *(unsigned int *)(v18 + 30);
        if (v16 - 32 < v132)
          goto LABEL_79;
        v133 = v120;
        if (*(_QWORD *)(v18 + v132) | *(_QWORD *)(v18 + v132 + 8) | *(_QWORD *)(v18 + v132 + 16) | *(_QWORD *)(v18 + v132 + 24))
        {
          v134 = *(unsigned int *)(v18 + 30);
          if (*((_DWORD *)a1 + 69) >= 3u)
          {
            v135 = *__error();
            syslog(7, "%s:%d:%s()  extracting \"%s\" (32 bytes)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4934, "copyfile_unpack", "com.apple.FinderInfo");
            *__error() = v135;
          }
          v136 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
          if (v136)
          {
            a1[31] = "com.apple.FinderInfo";
            v137 = v136(5, 1, a1, *a1, a1[1], a1[27]);
            a1[31] = 0;
            if (v137 == 1)
              goto LABEL_369;
            if (v137 == 2)
              goto LABEL_364;
          }
          v138 = fsetxattr(*((_DWORD *)a1 + 6), "com.apple.FinderInfo", (const void *)(v18 + *(unsigned int *)(v18 + 30)), 0x20uLL, 0, 0);
          v139 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
          if ((_DWORD)v138)
          {
            v5 = v138;
            if (!v139)
              goto LABEL_419;
            a1[31] = "com.apple.FinderInfo";
            v140 = v139(5, 3, a1, *a1, a1[1], a1[27]);
            a1[31] = 0;
            if (v140 != 2)
              goto LABEL_419;
LABEL_364:
            v143 = 89;
            goto LABEL_402;
          }
          if (v139)
          {
            a1[31] = "com.apple.FinderInfo";
            v142 = v139(5, 2, a1, *a1, a1[1], a1[27]);
            a1[31] = 0;
            if (v142 == 2)
              goto LABEL_364;
          }
          v5 = 0;
          if ((*(_WORD *)(v18 + v134 + 8) & 0x40) != 0)
            *((_DWORD *)a1 + 49) |= 2u;
        }
LABEL_369:
        if (*(_DWORD *)(v18 + 38) != 2)
          goto LABEL_416;
        v145 = *(unsigned int *)(v18 + 46);
        if (!(_DWORD)v145)
          goto LABEL_416;
        v146 = *(unsigned int *)(v18 + 42);
        v147 = malloc_type_malloc(*(unsigned int *)(v18 + 46), 0x1AF7F836uLL);
        if (!v147)
        {
          if (*((_DWORD *)a1 + 69))
          {
            v153 = *__error();
            syslog(7, "%s:%d:%s() could not allocate %zu bytes for rsrcforkdata\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5002, "copyfile_unpack", v145);
            *__error() = v153;
          }
          v5 = 0xFFFFFFFFLL;
          goto LABEL_416;
        }
        v148 = v147;
        if (fstat(*((_DWORD *)a1 + 6), (stat *)&v179) < 0)
        {
          if (*((_DWORD *)a1 + 69))
          {
            v152 = *__error();
            syslog(7, "%s:%d:%s() couldn't stat destination file\n");
            goto LABEL_412;
          }
LABEL_414:
          v5 = 0xFFFFFFFFLL;
          goto LABEL_415;
        }
        v149 = pread(*((_DWORD *)a1 + 4), v148, v145, v146);
        v150 = v149;
        if (v149 < v145)
        {
          v151 = *((_DWORD *)a1 + 69);
          if (v149 == -1)
          {
            if (v151)
            {
              v152 = *__error();
              syslog(7, "%s:%d:%s() couldn't read resource fork\n");
              goto LABEL_412;
            }
          }
          else if (v151)
          {
            v152 = *__error();
            syslog(7, "%s:%d:%s() couldn't read resource fork (only read %d bytes of %d)\n");
LABEL_412:
            v5 = 0xFFFFFFFFLL;
LABEL_413:
            *__error() = v152;
            goto LABEL_415;
          }
          goto LABEL_414;
        }
        v154 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
        if (!v154)
          goto LABEL_439;
        a1[31] = "com.apple.ResourceFork";
        v155 = v154(5, 1, a1, *a1, a1[1], a1[27]);
        a1[31] = 0;
        if (v155 == 1)
        {
LABEL_415:
          free(v148);
LABEL_416:
          if (v133)
          {
            v5 = copyfile_unpack_acl((uint64_t)a1, sizea, v133);
            if ((_DWORD)v5 == -1)
              goto LABEL_79;
          }
          if ((a1[24] & 2) == 0)
          {
LABEL_419:
            free((void *)v18);
            if ((v5 & 0x80000000) == 0)
              return v5;
            return 0xFFFFFFFFLL;
          }
          copyfile_stat((uint64_t)a1);
LABEL_312:
          free((void *)v18);
          return 0;
        }
        if (v155 != 2)
        {
LABEL_439:
          if (fsetxattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", v148, v150, 0, 0))
          {
            if (v150 == 286 && (v179.f_iosize & 0xF000) == 0x4000 && !memcmp(v148, &empty_rsrcfork_header, 0x11EuLL))
            {
              if (*((_DWORD *)a1 + 69) >= 2u)
              {
                v164 = *__error();
                syslog(7, "%s:%d:%s() not setting empty resource fork on directory\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5059, "copyfile_unpack");
                v152 = 0;
                v5 = 0;
                *__error() = v164;
                goto LABEL_413;
              }
            }
            else
            {
              v156 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
              if (!v156
                || (a1[31] = "com.apple.ResourceFork", v157 = v156(5, 3, a1, *a1, a1[1], a1[27]), a1[31] = 0, v157))
              {
                if (*((_DWORD *)a1 + 69))
                {
                  v152 = *__error();
                  syslog(7, "%s:%d:%s() error %d setting resource fork attribute\n");
                  goto LABEL_412;
                }
                goto LABEL_414;
              }
            }
            v152 = 0;
LABEL_436:
            v5 = 0;
            goto LABEL_413;
          }
          v160 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
          if (!v160
            || (a1[31] = "com.apple.ResourceFork", v161 = v160(5, 2, a1, *a1, a1[1], a1[27]),
                                                   a1[31] = 0,
                                                   v161 != 2))
          {
            if (*((_DWORD *)a1 + 69) >= 3u)
            {
              v162 = *__error();
              syslog(7, "%s:%d:%s() extracting \"%s\" (%d bytes)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5090, "copyfile_unpack", "com.apple.ResourceFork", v145);
              *__error() = v162;
            }
            if ((a1[24] & 2) != 0
              || (acl[1] = 0,
                  acl[2] = 0,
                  acl[0] = (acl_t)0x140000000005,
                  *(_OWORD *)&v178.st_dev = *(_OWORD *)v179.f_fsid.val,
                  *(_OWORD *)&v178.st_uid = *(_OWORD *)&v179.f_files,
                  !fsetattrlist(*((_DWORD *)a1 + 6), acl, &v178, 0x20uLL, 0)))
            {
              v5 = 0;
              goto LABEL_415;
            }
            v152 = *__error();
            v163 = (const char *)a1[1];
            if (!v163)
              v163 = "(null dst)";
            syslog(4, "%s: set times: %m", v163);
            goto LABEL_436;
          }
        }
        *((_DWORD *)a1 + 68) = 89;
        free(v148);
        goto LABEL_79;
      }
      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        v33 = *__error();
        syslog(4, "Not a valid Apple Double header: %m");
        goto LABEL_78;
      }
    }
LABEL_79:
    v45 = (void *)v18;
    goto LABEL_80;
  }
  if ((a2 & 4) == 0)
    goto LABEL_6;
  v22 = flistxattr(v3, 0, 0, 0);
  v23 = v22;
  if (v22 < 1)
  {
    if (v22 < 0)
      goto LABEL_121;
    goto LABEL_99;
  }
  v24 = 0;
  v25 = 0;
  v26 = -3;
  while (1)
  {
    if ((uint64_t)v23 <= v25)
    {
      v23 = v25;
      v28 = v24;
    }
    else
    {
      if (v23 >= 0x2000001)
      {
        v27 = *__error();
        syslog(4, "destination's xattr list size (%zu) exceeds the threshold (%d); trying to allocate: %m",
          v23,
          0x2000000);
        *__error() = v27;
      }
      v28 = (char *)malloc_type_realloc(v24, v23, 0x121238E5uLL);
      if (!v28)
      {
LABEL_125:
        if (!v24)
          goto LABEL_141;
        goto LABEL_140;
      }
    }
    v25 = v23;
    v29 = flistxattr(*((_DWORD *)a1 + 6), v28, v23, 0);
    if ((v29 & 0x8000000000000000) == 0)
      break;
    if (*__error() != 34 || v26 == 0)
      goto LABEL_97;
    v31 = flistxattr(*((_DWORD *)a1 + 6), 0, 0, 0);
    v23 = v31;
    ++v26;
    v24 = v28;
    if (v31 < 1)
    {
      if (v31 < 0)
      {
        if (v28)
          free(v28);
        goto LABEL_121;
      }
LABEL_97:
      if (v28)
        goto LABEL_98;
      goto LABEL_99;
    }
  }
  if (!v29)
    goto LABEL_97;
  v46 = &v28[v29 - 1];
  if (*v46)
    *v46 = 0;
  if (v28 <= v46)
  {
    v47 = v28;
    do
    {
      if (strncmp(v47, "figgledidiggledy", v46 - v47))
        fremovexattr(*((_DWORD *)a1 + 6), v47, 0);
      v47 += strlen(v47) + 1;
    }
    while (v47 <= v46);
    goto LABEL_97;
  }
LABEL_98:
  free(v28);
LABEL_99:
  if ((a1[24] & 8) != 0 && (*((_BYTE *)a1 + 148) & 0x20) != 0 && doesdecmpfs(*((_DWORD *)a1 + 4)))
  {
    v48 = doesdecmpfs(*((_DWORD *)a1 + 6));
    v49 = !v48;
    v50 = 32 * v48;
  }
  else
  {
    v50 = 0;
    v49 = 1;
  }
  v51 = flistxattr(*((_DWORD *)a1 + 4), 0, 0, v50);
  if (v51 < 1)
    goto LABEL_120;
  v170 = v49;
  v24 = 0;
  v52 = 0;
  v53 = -3;
  while (1)
  {
    if (v51 <= v52)
    {
      v51 = v52;
      v55 = v24;
    }
    else
    {
      if ((unint64_t)v51 >= 0x2000001)
      {
        v54 = *__error();
        syslog(4, "source's xattr list size (%zu) exceeds the threshold (%d); trying to allocate: %m", v51, 0x2000000);
        *__error() = v54;
      }
      v55 = (char *)malloc_type_realloc(v24, v51, 0xE40FED83uLL);
      if (!v55)
        goto LABEL_125;
    }
    v52 = v51;
    v56 = flistxattr(*((_DWORD *)a1 + 4), v55, v51, v50);
    v5 = v56;
    if ((v56 & 0x8000000000000000) == 0)
      break;
    if (*__error() != 34 || v53 == 0)
      goto LABEL_134;
    v51 = flistxattr(*((_DWORD *)a1 + 4), 0, 0, v50);
    ++v53;
    v24 = v55;
    if (v51 <= 0)
    {
      if (v55)
        free(v55);
LABEL_120:
      if (v51)
      {
LABEL_121:
        if (*__error() != 45)
        {
          if (*__error() == 1)
            v5 = 0;
          else
            v5 = 0xFFFFFFFFLL;
          goto LABEL_356;
        }
      }
LABEL_6:
      v5 = 0;
LABEL_7:
      if ((a2 & 0x8000008) != 0)
      {
        v5 = copyfile_data(a1, 0);
        if ((v5 & 0x80000000) != 0)
        {
          v41 = *__error();
          syslog(4, "error processing data: %m");
          *__error() = v41;
          v42 = (const char *)a1[1];
          if (v42 && unlink(v42))
          {
            v43 = *__error();
            v44 = (const char *)*a1;
            if (!*a1)
              v44 = "(null src)";
            syslog(4, "%s: remove: %m", v44);
            *__error() = v43;
          }
          return v5;
        }
      }
      if ((a2 & 3) == 0)
        goto LABEL_279;
      acl[0] = 0;
      obj_p = 0;
      acl_p = 0;
      v6 = filesec_init();
      if (!v6)
      {
        v5 = 0xFFFFFFFFLL;
        goto LABEL_282;
      }
      v7 = v6;
      if ((a1[24] & 1) == 0)
        goto LABEL_12;
      if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, acl))
      {
        if (*__error() == 2)
        {
          acl[0] = 0;
          goto LABEL_87;
        }
LABEL_88:
        v5 = 0xFFFFFFFFLL;
LABEL_272:
        filesec_free(v7);
        if (acl[0])
          acl_free(acl[0]);
        if (obj_p)
          acl_free(obj_p);
        if (acl_p)
          acl_free(acl_p);
        if ((v5 & 0x80000000) == 0)
        {
LABEL_279:
          if ((a2 & 2) == 0)
            return v5;
          copyfile_stat((uint64_t)a1);
          return 0;
        }
LABEL_282:
        v111 = *__error();
        syslog(4, "error processing security information: %m");
        goto LABEL_283;
      }
LABEL_87:
      if (fstatx_np(*((_DWORD *)a1 + 6), &v178, v7))
        goto LABEL_88;
      if (filesec_get_property(v7, FILESEC_ACL, &obj_p))
      {
        if (*__error() != 2)
          goto LABEL_88;
        v61 = 0;
        obj_p = 0;
      }
      else
      {
        v61 = (unint64_t)obj_p;
      }
      if ((unint64_t)acl[0] | v61)
      {
        acl_p = acl_init(4);
        if (!acl_p)
          goto LABEL_88;
        if (acl[0])
        {
          *(_QWORD *)&v179.f_bsize = 0;
          entry_p = 0;
          v5 = 0;
          if (!acl_get_entry(acl[0], 0, (acl_entry_t *)&v179))
          {
            v5 = 0;
            do
            {
              flagset_p = 0;
              acl_get_flagset_np(*(void **)&v179.f_bsize, &flagset_p);
              if (!acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
              {
                if (acl_create_entry(&acl_p, &entry_p) == -1)
                  goto LABEL_88;
                v99 = acl_copy_entry(entry_p, *(acl_entry_t *)&v179.f_bsize);
                if ((_DWORD)v99 == -1)
                  goto LABEL_88;
                v5 = v99;
                if (*((_DWORD *)a1 + 69) >= 2u)
                {
                  v100 = *__error();
                  v101 = (const char *)*a1;
                  v102 = (const char *)a1[1];
                  if (!*a1)
                    v101 = "(null src)";
                  if (!v102)
                    v102 = "(null tmp)";
                  syslog(7, "%s:%d:%s() copied acl entry from %s to %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3166, "copyfile_security", v101, v102);
                  *__error() = v100;
                }
              }
              if (*(_QWORD *)&v179.f_bsize)
                v103 = -1;
              else
                v103 = 0;
            }
            while (!acl_get_entry(acl[0], v103, (acl_entry_t *)&v179));
          }
        }
        else
        {
          v5 = 0;
        }
        if (obj_p)
        {
          *(_QWORD *)&v179.f_bsize = 0;
          flagset_p = 0;
          entry_p = 0;
          if (!acl_get_entry((acl_t)obj_p, 0, (acl_entry_t *)&v179))
          {
            do
            {
              acl_get_flagset_np(*(void **)&v179.f_bsize, &flagset_p);
              if (acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
              {
                if (acl_create_entry(&acl_p, &entry_p) == -1)
                  goto LABEL_88;
                v112 = acl_copy_entry(entry_p, *(acl_entry_t *)&v179.f_bsize);
                if ((_DWORD)v112 == -1)
                  goto LABEL_88;
                v5 = v112;
                if (a1 && *((_DWORD *)a1 + 69) >= 2u)
                {
                  v113 = *__error();
                  v114 = (const char *)*a1;
                  v115 = (const char *)a1[1];
                  if (!*a1)
                    v114 = "(null dst)";
                  if (!v115)
                    v115 = "(null tmp)";
                  syslog(7, "%s:%d:%s() copied acl entry from %s to %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3190, "copyfile_security", v114, v115);
                  *__error() = v113;
                }
              }
              if (*(_QWORD *)&v179.f_bsize)
                v116 = -1;
              else
                v116 = 0;
            }
            while (!acl_get_entry((acl_t)obj_p, v116, (acl_entry_t *)&v179));
          }
        }
        v117 = filesec_set_property((filesec_t)a1[23], FILESEC_ACL, &acl_p);
        if (a1 && !v117 && *((_DWORD *)a1 + 69) >= 3u)
        {
          v118 = *__error();
          syslog(7, "%s:%d:%s() altered acl\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3197, "copyfile_security");
          *__error() = v118;
        }
      }
      else
      {
LABEL_12:
        v5 = 0;
      }
      v8 = filesec_dup((filesec_t)a1[23]);
      if (!v8)
        goto LABEL_88;
      v9 = v8;
      v10 = *((_WORD *)a1 + 18);
      if ((a1[24] & 2) == 0 || (v11 = *((_DWORD *)a1 + 49), (v11 & 0x4000) != 0))
      {
        v12 = 1;
      }
      else if ((v11 & 0x8000) != 0
             || fstatfs(*((_DWORD *)a1 + 4), &v179) != -1 && (v179.f_flags & 8) != 0
             || (v12 = 1, fstatfs(*((_DWORD *)a1 + 6), &v179) != -1) && (v179.f_flags & 8) != 0)
      {
        LOWORD(v179.f_bsize) = 0;
        if (filesec_get_property(v9, FILESEC_MODE, &v179) || (v179.f_bsize & 0xC00) == 0)
        {
          v12 = 1;
        }
        else
        {
          LOWORD(v179.f_bsize) &= 0xF3FFu;
          v12 = filesec_set_property(v9, FILESEC_MODE, &v179) == 0;
        }
        v10 &= 0xF3FFu;
      }
      v104 = a1[24] & 3;
      switch(v104)
      {
        case 3:
LABEL_253:
          if (!v12 || fchmodx_np(*((_DWORD *)a1 + 6), v9) < 0)
          {
            *(_QWORD *)&v179.f_bsize = 0;
            if ((a1[24] & 2) != 0 && fchmod(*((_DWORD *)a1 + 6), v10) == -1)
            {
              v105 = *__error();
              v106 = "(null string)";
              v107 = (const char *)a1[1];
              if (!v107)
                v107 = "(null string)";
              if (*a1)
                v106 = (const char *)*a1;
              syslog(4, "could not change mode of destination file %s to match source file %s: %m", v107, v106);
              *__error() = v105;
            }
            fchown(*((_DWORD *)a1 + 6), *((_DWORD *)a1 + 12), *((_DWORD *)a1 + 13));
            if (!filesec_get_property(v9, FILESEC_ACL, &v179))
            {
              if (MEMORY[0x1DF0EE430](*((unsigned int *)a1 + 6), *(_QWORD *)&v179.f_bsize) == -1)
              {
                v108 = *__error();
                v109 = "(null string)";
                v110 = (const char *)a1[1];
                if (!v110)
                  v110 = "(null string)";
                if (*a1)
                  v109 = (const char *)*a1;
                syslog(4, "could not apply acl to destination file %s from source file %s: %m", v110, v109);
                *__error() = v108;
              }
              acl_free(*(void **)&v179.f_bsize);
            }
          }
          break;
        case 2:
          fchmod(*((_DWORD *)a1 + 6), v10);
          break;
        case 1:
          filesec_set_property(v9, FILESEC_OWNER, 0);
          filesec_set_property(v9, FILESEC_GROUP, 0);
          filesec_set_property(v9, FILESEC_MODE, 0);
          goto LABEL_253;
      }
      filesec_free(v9);
      goto LABEL_272;
    }
  }
  if (!v56)
  {
LABEL_134:
    if (v55)
      free(v55);
    goto LABEL_356;
  }
  v58 = &v55[v56 - 1];
  if (*v58)
    *v58 = 0;
  v59 = malloc_type_malloc(0x1000uLL, 0xB4A05048uLL);
  if (!v59)
  {
    v24 = v55;
LABEL_140:
    free(v24);
LABEL_141:
    v5 = 0xFFFFFFFFLL;
    goto LABEL_357;
  }
  v60 = v59;
  if (v55 > v58)
  {
    v5 = 0;
    goto LABEL_353;
  }
  v62 = 0;
  size = 4096;
  v63 = v55;
  v167 = (uint64_t)&v55[v5 - 1];
  while (1)
  {
    v64 = (void *)a1[31];
    if (v64)
    {
      free(v64);
      a1[31] = 0;
    }
    v65 = v58 - v63;
    if (!strncmp(v63, "figgledidiggledy", v58 - v63))
      goto LABEL_216;
    v66 = *((_DWORD *)a1 + 70);
    if (v66)
    {
      if (!xattr_preserve_for_intent(v63, v66))
        goto LABEL_216;
    }
    a1[31] = strdup(v63);
    v67 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    if (v67)
    {
      v68 = v67(5, 1, a1, *a1, a1[1], a1[27]);
      if (v68 == 1)
        goto LABEL_216;
      if (v68 == 2)
        goto LABEL_350;
    }
    if (!strncmp(v63, "com.apple.ResourceFork", v58 - v63))
    {
      if ((*((_BYTE *)a1 + 197) & 4) != 0)
      {
        v62 = copyfile_data(a1, 1);
        if (!(_DWORD)v62)
          goto LABEL_214;
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          v82 = *__error();
          v83 = *((_DWORD *)a1 + 68);
          v84 = __error();
          syslog(7, "%s:%d:%s() Resource fork copy (fd) failed (%d - state %d - errno %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3686, "copyfile_xattr", v62, v83, *v84);
          *__error() = v82;
        }
        v85 = *((_DWORD *)a1 + 68);
        v5 = v62;
        goto LABEL_213;
      }
      v76 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0, 0, 0, v50);
      if (v76 < 0)
      {
        v62 = 0;
        v5 = 45;
LABEL_210:
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          v169 = *__error();
          v93 = v62;
          v94 = *((_DWORD *)a1 + 68);
          v95 = __error();
          v166 = v94;
          v62 = v93;
          syslog(7, "%s:%d:%s() Resource fork copy (fsetxattr) failed (%d - state %d - errno %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3704, "copyfile_xattr", v5, v166, *v95);
          *__error() = v169;
        }
        v85 = *((_DWORD *)a1 + 68);
LABEL_213:
        if (v85 == 89)
          goto LABEL_352;
        goto LABEL_214;
      }
      v77 = size;
      if (size < 0x100000 && v76 > size)
      {
        if (v76 >= 0x100000)
          v78 = 0x100000;
        else
          v78 = v76;
        v79 = v78;
        v60 = reallocf(v60, v78);
        if (!v60)
        {
          v92 = *__error();
          syslog(4, "realloc for resource fork failed: %m");
          size = 0;
          *__error() = v92;
          goto LABEL_209;
        }
        v77 = v79;
      }
      size = v77;
      v80 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v60, v77, 0, v50);
      if (v80 < 1)
      {
        v81 = 0;
LABEL_201:
        if (v80 < 0)
        {
          v91 = *__error();
          syslog(4, "resource fork getxattr failed: %m");
          *__error() = v91;
          if (v81)
            goto LABEL_209;
        }
      }
      else
      {
        v81 = 0;
        while ((fsetxattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", v60, v80, v81, v50) & 0x80000000) == 0)
        {
          v81 += v80;
          v80 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v60, size, v81, v50);
          if (v80 < 1)
            goto LABEL_201;
        }
        v89 = *__error();
        syslog(4, "writing to resource fork got error: %m");
        *__error() = v89;
        v90 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
        if (!v90)
          goto LABEL_209;
        if (v90(5, 3, a1, *a1, a1[1], a1[27]) == 2)
        {
          *((_DWORD *)a1 + 68) = 89;
LABEL_209:
          v62 = 0xFFFFFFFFLL;
          v5 = 0xFFFFFFFFLL;
          goto LABEL_210;
        }
      }
      v62 = 0;
      goto LABEL_214;
    }
    v168 = v62;
    v69 = fgetxattr(*((_DWORD *)a1 + 4), v63, 0, 0, 0, v50);
    if ((v69 & 0x8000000000000000) == 0)
      break;
    v73 = v60;
LABEL_217:
    v63 += strlen(v63) + 1;
    v60 = v73;
    v5 = v62;
    if (v63 > v58)
      goto LABEL_352;
  }
  v70 = v69;
  v71 = -3;
  while (1)
  {
    if (v70 <= size)
    {
      v73 = v60;
      v70 = size;
    }
    else
    {
      if ((unint64_t)v70 >= 0x2000001)
      {
        v72 = *__error();
        syslog(4, "xattr named %s has size (%zu), which exceeds the threshold (%d); trying to allocate: %m",
          v63,
          v70,
          0x2000000);
        *__error() = v72;
      }
      v73 = malloc_type_realloc(v60, v70, 0x68E25EE9uLL);
      if (!v73)
      {
        free(v60);
        size = 0;
        v58 = (char *)v167;
        goto LABEL_194;
      }
    }
    size = v70;
    v74 = fgetxattr(*((_DWORD *)a1 + 4), v63, v73, v70, 0, v50);
    if ((v74 & 0x8000000000000000) == 0)
      break;
    if (*__error() == 34 && v71 != 0)
    {
      v70 = fgetxattr(*((_DWORD *)a1 + 4), v63, 0, 0, 0, v50);
      ++v71;
      v60 = v73;
      if ((v70 & 0x8000000000000000) == 0)
        continue;
    }
    goto LABEL_166;
  }
  v86 = v74;
  v62 = v168;
  if (!strncmp(v63, "com.apple.decmpfs", v65))
  {
    v58 = (char *)v167;
    if (v86 < 0x10 || *v73 != 1668116582)
      goto LABEL_217;
    v88 = v73[1];
    if ((v88 - 7) >= 8 && (v88 - 3) >= 2)
    {
      if (v88 == 5)
      {
        if (*((_DWORD *)a1 + 69) >= 3u)
        {
          v98 = *__error();
          syslog(7, "%s:%d:%s() compression_type <5> on attribute com.apple.decmpfs for src file %s is not copied.\n");
          goto LABEL_225;
        }
      }
      else
      {
        v98 = *__error();
        syslog(4, "Invalid compression_type <%d> on attribute %s for src file %s: %m");
LABEL_225:
        *__error() = v98;
      }
LABEL_166:
      v58 = (char *)v167;
      v62 = v168;
      goto LABEL_217;
    }
    if (!v170)
      *((_DWORD *)a1 + 49) |= 4u;
  }
  v58 = (char *)v167;
  if (fsetxattr(*((_DWORD *)a1 + 6), v63, v73, v86, 0, v50) < 0)
  {
    if (*__error() == 1 && !strcmp(v63, "com.apple.root.installed"))
      goto LABEL_217;
    v87 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    if (!v87)
    {
      v97 = *__error();
      syslog(4, "could not set attributes %s on destination file descriptor: %m", v63);
      *__error() = v97;
LABEL_194:
      v62 = 0xFFFFFFFFLL;
      goto LABEL_217;
    }
    if (v87(5, 3, a1, *a1, a1[1], a1[27]) == 2)
    {
      v62 = 0xFFFFFFFFLL;
      goto LABEL_351;
    }
  }
  v60 = v73;
LABEL_214:
  v96 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
  if (!v96 || v96(5, 2, a1, *a1, a1[1], a1[27]) != 2)
  {
LABEL_216:
    v73 = v60;
    goto LABEL_217;
  }
  v62 = 0xFFFFFFFFLL;
LABEL_350:
  v73 = v60;
LABEL_351:
  *((_DWORD *)a1 + 68) = 89;
  v60 = v73;
  v5 = v62;
LABEL_352:
  if (v55)
LABEL_353:
    free(v55);
  free(v60);
  v141 = (void *)a1[31];
  if (v141)
  {
    free(v141);
    a1[31] = 0;
  }
LABEL_356:
  if ((v5 & 0x80000000) == 0)
    goto LABEL_7;
LABEL_357:
  if (*__error() != 45 && *__error() != 1)
  {
    v111 = *__error();
    syslog(4, "error processing extended attributes: %m");
LABEL_283:
    *__error() = v111;
  }
  return v5;
}

BOOL doesdecmpfs(int a1)
{
  _BOOL8 result;
  _BYTE v2[36];
  _QWORD v3[3];
  statfs v4;
  char v5[1025];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  result = 0;
  if (!fstatfs(a1, &v4))
  {
    __strlcpy_chk();
    v3[2] = 0;
    v3[0] = 5;
    v3[1] = 0x20000;
    if (getattrlist(v5, v3, v2, 0x24uLL, 0) != -1 && (v2[6] & 1) != 0 && (v2[22] & 1) != 0)
      return 1;
  }
  return result;
}

uint64_t copyfile_set_bsdflags(uint64_t a1, int a2, int a3)
{
  int v6;
  __uint32_t v7;
  int v8;
  __uint32_t v9;
  uint64_t result;
  stat v11;
  _DWORD v12[2];
  __uint32_t v13;

  if (fstat(*(_DWORD *)(a1 + 24), &v11))
  {
    if (a3)
    {
      if (*(_DWORD *)(a1 + 276))
      {
        v6 = *__error();
        __error();
        syslog(7, "%s:%d:%s() couldn't stat destination file for st_flags (%d)\n");
LABEL_18:
        *__error() = v6;
      }
      return *__error();
    }
    v7 = 0;
  }
  else
  {
    v7 = v11.st_flags & a3;
  }
  v8 = 4;
  do
  {
    v9 = v7 | a2;
    v12[0] = v11.st_flags;
    v12[1] = v7 | a2;
    v13 = -1;
    *__error() = 0;
    if (ffsctl(*(_DWORD *)(a1 + 24), 0xC00C4114uLL, v12, 0))
    {
      if (*__error() != 35)
        goto LABEL_15;
    }
    else
    {
      if (v11.st_flags == v13)
        return 0;
      v11.st_flags = v13;
      v7 = v13 & a3;
    }
    --v8;
  }
  while (v8);
  v9 = v7 | a2;
LABEL_15:
  result = fchflags(*(_DWORD *)(a1 + 24), v9);
  if (!(_DWORD)result)
    return result;
  if (*(_DWORD *)(a1 + 276))
  {
    v6 = *__error();
    __error();
    syslog(7, "%s:%d:%s() fchflags failed on %s (%d)\n");
    goto LABEL_18;
  }
  return *__error();
}

uint64_t copyfile_stat(uint64_t a1)
{
  __int16 v2;
  mode_t v3;
  int v4;
  BOOL v5;
  BOOL v6;
  __int128 v7;
  int v8;
  int v9;
  uint64_t result;
  _QWORD v11[3];
  statfs v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  v2 = *(_WORD *)(a1 + 36);
  v3 = v2 & 0xFFF;
  v4 = *(_DWORD *)(a1 + 196);
  if ((v4 & 0x4000) == 0)
  {
    if ((v4 & 0x8000) != 0
      || (fstatfs(*(_DWORD *)(a1 + 16), &v12) != -1 ? (v5 = (v12.f_flags & 8) == 0) : (v5 = 1),
          !v5 || (fstatfs(*(_DWORD *)(a1 + 24), &v12) != -1 ? (v6 = (v12.f_flags & 8) == 0) : (v6 = 1), !v6)))
    {
      v3 = v2 & 0x3FF;
    }
  }
  v11[1] = 0;
  v11[2] = 0;
  v11[0] = 0x140000000005;
  v7 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v12.f_bsize = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v12.f_bfree = v7;
  fsetattrlist(*(_DWORD *)(a1 + 24), v11, &v12, 0x20uLL, 0);
  fchown(*(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
  fchmod(*(_DWORD *)(a1 + 24), v3);
  v8 = *(_DWORD *)(a1 + 148);
  if ((*(_DWORD *)(a1 + 192) & 0x10000000) != 0)
    v9 = 1573056;
  else
    v9 = 1572992;
  result = copyfile_set_bsdflags(a1, (*(_DWORD *)(a1 + 196) << 14) & 0x8000 | v8 & 0xFFE7FF3F, v9);
  if ((v8 & 0x60026) == 0x20)
    return fsetattrlist(*(_DWORD *)(a1 + 24), v11, &v12, 0x20uLL, 0);
  return result;
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  copyfile_state_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  int v21;
  stat v22;
  copyfile_state_t v23;

  v23 = a3;
  if ((to_fd | from_fd) < 0)
  {
    v18 = __error();
    v19 = 22;
LABEL_30:
    *v18 = v19;
    return -1;
  }
  if ((copyfile_preamble(&v23, flags) & 0x80000000) != 0)
    return -1;
  v8 = v23;
  if (v23 && *((_DWORD *)v23 + 69) >= 2u)
  {
    v9 = *__error();
    syslog(7, "%s:%d:%s() set src_fd <- %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1029, "fcopyfile", from_fd);
    *__error() = v9;
  }
  if (*((_DWORD *)v8 + 4) == -2)
  {
    *((_DWORD *)v8 + 4) = from_fd;
    if (fstatx_np(from_fd, (stat *)((char *)v8 + 32), *((filesec_t *)v8 + 23)))
    {
      if (*__error() != 45 && *__error() != 1)
      {
        v21 = *__error();
        syslog(4, "fstatx_np on src fd %d: %m", *((_DWORD *)v8 + 4));
        *__error() = v21;
        return -1;
      }
      fstat(*((_DWORD *)v8 + 4), (stat *)((char *)v8 + 32));
    }
  }
  v10 = *((_WORD *)v8 + 18) & 0xF000;
  if (v10 != 0x4000 && v10 != 0x8000 && v10 != 40960)
  {
    v18 = __error();
    v19 = 45;
    goto LABEL_30;
  }
  if (*((_DWORD *)v8 + 69) >= 2u)
  {
    v11 = *__error();
    syslog(7, "%s:%d:%s() set dst_fd <- %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1057, "fcopyfile", to_fd);
    *__error() = v11;
  }
  v12 = *((_DWORD *)v8 + 6);
  if (v12 == -2)
  {
    *((_DWORD *)v8 + 6) = to_fd;
    v12 = to_fd;
  }
  v13 = fstat(v12, &v22);
  fchmod(*((_DWORD *)v8 + 6), v22.st_mode & 0xE7F | 0x180);
  if (!*((_QWORD *)v8 + 28))
    *((_QWORD *)v8 + 28) = 0;
  v14 = copyfile_internal(v8, flags);
  if ((v13 & 0x80000000) == 0 && (*((_BYTE *)v8 + 192) & 2) == 0)
  {
    v15 = *__error();
    fchmod(*((_DWORD *)v8 + 6), v22.st_mode & 0xFFF);
    *__error() = v15;
  }
  v16 = *((_DWORD *)v8 + 68);
  if (v16)
  {
    *__error() = v16;
    *((_DWORD *)v8 + 68) = 0;
  }
  if (!a3)
  {
    v17 = *__error();
    copyfile_state_free(v8);
    *__error() = v17;
  }
  if ((v14 & 0x80000000) == 0)
    *__error() = 0;
  return v14;
}

_filesec *copyfile_fix_perms(filesec_t *a1)
{
  _filesec *v1;
  _filesec *v2;
  void *obj_p;
  unsigned __int16 v5;

  obj_p = 0;
  v1 = filesec_dup(*a1);
  v2 = v1;
  if (v1)
  {
    if (!filesec_get_property(v1, FILESEC_ACL, &obj_p)
      && (add_uberace((acl_t *)&obj_p) || filesec_set_property(v2, FILESEC_ACL, &obj_p))
      || !filesec_get_property(v2, FILESEC_MODE, &v5)
      && (~v5 & 0x180) != 0
      && (v5 |= 0x180u, filesec_set_property(v2, FILESEC_MODE, &v5)))
    {
      filesec_free(v2);
      v2 = 0;
    }
    if (obj_p)
      acl_free(obj_p);
  }
  return v2;
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  int result;
  int v5;
  int *v6;
  int v7;
  uint64_t v8;
  int v9;

  if (dst)
  {
    switch(flag)
    {
      case 1u:
        result = 0;
        v5 = *((_DWORD *)s + 4);
        goto LABEL_24;
      case 2u:
        result = 0;
        v8 = *(_QWORD *)s;
        goto LABEL_22;
      case 3u:
        result = 0;
        v5 = *((_DWORD *)s + 6);
        goto LABEL_24;
      case 4u:
        result = 0;
        v8 = *((_QWORD *)s + 1);
        goto LABEL_22;
      case 5u:
        result = 0;
        v8 = *((_QWORD *)s + 28);
        goto LABEL_22;
      case 6u:
        result = 0;
        v8 = *((_QWORD *)s + 26);
        goto LABEL_22;
      case 7u:
        result = 0;
        v8 = *((_QWORD *)s + 27);
        goto LABEL_22;
      case 8u:
        result = 0;
        v8 = *((_QWORD *)s + 33);
        goto LABEL_22;
      case 9u:
        result = 0;
        v8 = *((_QWORD *)s + 31);
        goto LABEL_22;
      case 0xAu:
        result = 0;
        v9 = (*((_DWORD *)s + 49) >> 11) & 1;
        goto LABEL_28;
      case 0xBu:
      case 0xDu:
        result = 0;
        v5 = *((_DWORD *)s + 71);
        goto LABEL_24;
      case 0xCu:
        result = 0;
        v5 = *((_DWORD *)s + 72);
        goto LABEL_24;
      case 0xEu:
        result = 0;
        v9 = (*((_DWORD *)s + 49) >> 13) & 1;
LABEL_28:
        *(_BYTE *)dst = v9;
        return result;
      case 0xFu:
        result = 0;
        v5 = (*((_DWORD *)s + 49) >> 9) & 1;
        goto LABEL_24;
      case 0x10u:
        result = 0;
        v5 = (*((_DWORD *)s + 49) >> 14) & 1;
        goto LABEL_24;
      case 0x11u:
        result = 0;
        v8 = *((_QWORD *)s + 32);
LABEL_22:
        *(_QWORD *)dst = v8;
        return result;
      case 0x12u:
        result = 0;
        v5 = HIWORD(*((_DWORD *)s + 49)) & 1;
        goto LABEL_24;
      default:
        if (flag != 256)
        {
          v6 = __error();
          v7 = 22;
          goto LABEL_5;
        }
        result = 0;
        v5 = *((_DWORD *)s + 70);
LABEL_24:
        *(_DWORD *)dst = v5;
        break;
    }
  }
  else
  {
    v6 = __error();
    v7 = 14;
LABEL_5:
    *v6 = v7;
    return -1;
  }
  return result;
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  int result;
  int *v5;
  int v6;
  char *v7;
  char *v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;

  if (src)
  {
    switch(flag)
    {
      case 1u:
        result = 0;
        *((_DWORD *)s + 4) = *(_DWORD *)src;
        return result;
      case 2u:
        v7 = strdup((const char *)src);
        result = 0;
        *(_QWORD *)s = v7;
        return result;
      case 3u:
        result = 0;
        *((_DWORD *)s + 6) = *(_DWORD *)src;
        return result;
      case 4u:
        v8 = strdup((const char *)src);
        result = 0;
        *((_QWORD *)s + 1) = v8;
        return result;
      case 5u:
        if (*((_QWORD *)s + 28))
          *((_QWORD *)s + 28) = 0;
        if (!*(_QWORD *)src)
          return 0;
        result = 0;
        *((_QWORD *)s + 28) = 0;
        return result;
      case 6u:
        result = 0;
        *((_QWORD *)s + 26) = src;
        return result;
      case 7u:
        result = 0;
        *((_QWORD *)s + 27) = src;
        return result;
      case 8u:
      case 9u:
      case 0xAu:
      case 0x11u:
        goto LABEL_8;
      case 0xBu:
        result = 0;
        *((_DWORD *)s + 71) = *(_DWORD *)src;
        return result;
      case 0xCu:
        result = 0;
        v9 = *(_DWORD *)src;
        goto LABEL_21;
      case 0xDu:
        result = 0;
        v9 = *(_DWORD *)src;
        *((_DWORD *)s + 71) = *(_DWORD *)src;
LABEL_21:
        *((_DWORD *)s + 72) = v9;
        return result;
      case 0xEu:
        if (!*(_BYTE *)src)
          return 0;
        result = 0;
        v10 = *((_DWORD *)s + 49) | 0x2000;
LABEL_34:
        *((_DWORD *)s + 49) = v10;
        return result;
      case 0xFu:
        v11 = *((_DWORD *)s + 49);
        result = 0;
        if (*(_DWORD *)src)
          v10 = v11 | 0x200;
        else
          v10 = v11 & 0xFFFFFDFF;
        goto LABEL_34;
      case 0x10u:
        v12 = *((_DWORD *)s + 49);
        result = 0;
        if (*(_DWORD *)src)
          v10 = v12 | 0x4000;
        else
          v10 = v12 & 0xFFFFBFFF;
        goto LABEL_34;
      case 0x12u:
        v13 = *((_DWORD *)s + 49);
        result = 0;
        if (*(_DWORD *)src)
          v10 = v13 | 0x10000;
        else
          v10 = v13 & 0xFFFEFFFF;
        goto LABEL_34;
      default:
        if (flag == 256)
        {
          result = 0;
          *((_DWORD *)s + 70) = *(_DWORD *)src;
          return result;
        }
LABEL_8:
        v5 = __error();
        v6 = 22;
        break;
    }
  }
  else
  {
    v5 = __error();
    v6 = 14;
  }
  *v5 = v6;
  return -1;
}

uint64_t add_uberace(acl_t *a1)
{
  uid_t v2;
  uint64_t result;
  const char *v4;
  int v5;
  acl_permset_t permset_p;
  acl_entry_t entry_p;
  uuid_t uu;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  v2 = getuid();
  if (!mbr_uid_to_uuid(v2, uu))
  {
    result = acl_create_entry_np(a1, &entry_p, 0);
    if ((_DWORD)result == -1)
      return result;
    if (acl_get_permset(entry_p, &permset_p) == -1)
    {
      v4 = "acl_get_permset: %m";
    }
    else if (acl_clear_perms(permset_p) == -1)
    {
      v4 = "acl_clear_permset: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_DATA) == -1)
    {
      v4 = "add ACL_WRITE_DATA: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_ATTRIBUTES) == -1)
    {
      v4 = "add ACL_WRITE_ATTRIBUTES: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_EXTATTRIBUTES) == -1)
    {
      v4 = "add ACL_WRITE_EXTATTRIBUTES: %m";
    }
    else if (acl_add_perm(permset_p, ACL_APPEND_DATA) == -1)
    {
      v4 = "add ACL_APPEND_DATA: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_SECURITY) == -1)
    {
      v4 = "add ACL_WRITE_SECURITY: %m";
    }
    else if (acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW) == -1)
    {
      v4 = "set ACL_EXTENDED_ALLOW: %m";
    }
    else if (acl_set_permset(entry_p, permset_p) == -1)
    {
      v4 = "acl_set_permset: %m";
    }
    else
    {
      if (acl_set_qualifier(entry_p, uu) != -1)
        return 0;
      v4 = "acl_set_qualifier: %m";
    }
    v5 = *__error();
    syslog(4, v4);
    *__error() = v5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t copyfile_pack(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;
  char *v5;
  int8x8_t *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int *v11;
  int v12;
  const char *v13;
  void *v14;
  int8x8_t *v15;
  size_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v18;
  void *v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  void *v24;
  uint64_t (*v25)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v26;
  int v27;
  ssize_t v28;
  int v29;
  int v30;
  uint64_t (*v31)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v32;
  void *v33;
  int v34;
  int v35;
  ssize_t v36;
  _DWORD *v37;
  int v38;
  off_t v39;
  ssize_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v42;
  void *v43;
  int v44;
  int v45;
  int *v46;
  uint64_t (*v47)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v48;
  void *v49;
  uint64_t (*v50)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v51;
  void *v52;
  uint64_t v53;
  ssize_t v54;
  int v55;
  int *v56;
  ssize_t v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t (*v61)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v62;
  void *v63;
  int64_t v64;
  char **v65;
  char **v66;
  char *v67;
  char *v68;
  char *v69;
  int v70;
  uint64_t v71;
  char **v72;
  int v73;
  unsigned int v74;
  unint64_t v75;
  size_t v76;
  int v77;
  int v78;
  int *v79;
  int v80;
  uint64_t (*v81)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v82;
  int v83;
  unsigned int (*v84)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v85;
  int v86;
  unsigned int (*v87)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  size_t v88;
  int8x16_t v89;
  unsigned int i;
  unsigned int v91;
  uint64_t v92;
  ssize_t v93;
  uint64_t v95;
  char *v96;
  void *v97;
  const char **v98;
  char *v99;
  const char *v100;
  size_t v101;
  uint64_t v102;
  int8x8_t *v103;
  char *v104;
  size_t v105;
  xattr_operation_intent_t v106;
  char *v107;
  int v108;
  const char *v109;
  int v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  _DWORD *v117;
  char *v118;
  ssize_t len_p;
  void *v120[2];

  v120[1] = *(void **)MEMORY[0x1E0C874D8];
  v2 = malloc_type_calloc(1uLL, 0x10012uLL, 0x8D8A181BuLL);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = (char *)malloc_type_calloc(1uLL, 0x10012uLL, 0xB350879uLL);
  if (!v4)
  {
    free(v3);
    return 0xFFFFFFFFLL;
  }
  v5 = v4;
  v118 = v4 + 65554;
  *v3 = 0x2000000051607;
  *((_WORD *)v3 + 12) = 2;
  *(_OWORD *)((char *)v3 + 26) = xmmword_1DED3E520;
  *(_QWORD *)((char *)v3 + 42) = 82;
  *(_OWORD *)(v3 + 1) = *(_OWORD *)"Mac OS X        ";
  *(_QWORD *)((char *)v3 + 84) = 1096045650;
  *((_DWORD *)v3 + 24) = 120;
  v6 = (int8x8_t *)(v3 + 15);
  v7 = *((_DWORD *)a1 + 48);
  if ((v7 & 1) != 0)
  {
    v120[0] = 0;
    if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, v120) < 0)
    {
      if (*((_DWORD *)a1 + 69) < 2u)
      {
        v8 = 0;
      }
      else
      {
        v10 = *__error();
        v11 = __error();
        syslog(7, "%s:%d:%s() no acl entries found (errno = %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5389, "copyfile_pack", *v11);
        v8 = 0;
        *__error() = v10;
      }
    }
    else
    {
      strcpy(v5, "com.apple.acl.text");
      v118 = v5 + 19;
      v8 = 19;
    }
    if (v120[0])
      acl_free(v120[0]);
    v7 = *((_DWORD *)a1 + 48);
  }
  else
  {
    v8 = 0;
  }
  v116 = v5;
  v117 = v3;
  if ((v7 & 4) == 0)
  {
    v115 = v8;
    goto LABEL_17;
  }
  v53 = 65554 - v8;
  v54 = flistxattr(*((_DWORD *)a1 + 4), &v5[v8], 65554 - v8, 0);
  if (v54 <= 0 && *((_DWORD *)a1 + 69) >= 2u)
  {
    v55 = *__error();
    v56 = __error();
    syslog(7, "%s:%d:%s() no extended attributes found (%d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5405, "copyfile_pack", *v56);
    *__error() = v55;
  }
  if (v54 >= v53)
    v57 = 65554 - v8;
  else
    v57 = v54;
  if (v54 <= v53)
  {
    v53 = v57;
  }
  else if (*((_DWORD *)a1 + 69))
  {
    v58 = *__error();
    syslog(7, "%s:%d:%s() extended attribute list too long\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5409, "copyfile_pack");
    *__error() = v58;
  }
  v64 = (v53 & ~(v53 >> 63)) + v8;
  if ((unint64_t)v64 > 0x10012)
    goto LABEL_171;
  v115 = v8;
  v118 = &v5[v64];
  if (v53 >= 1 && !*v118)
  {
    v65 = (char **)malloc_type_calloc(0xAuLL, 8uLL, 0x10040436913F5uLL);
    if (v65)
    {
      v66 = v65;
      v67 = v116;
      *v66 = v116;
      v68 = (char *)memchr(v67, 0, v64);
      if (v68)
      {
        v69 = v68;
        v70 = 10;
        v71 = 1;
        do
        {
          if (v71 == v70)
          {
            v70 += 10;
            v72 = (char **)malloc_type_realloc(v66, 8 * v70, 0x80040B8603338uLL);
            if (!v72)
              goto LABEL_182;
            v66 = v72;
          }
          v73 = v71 + 1;
          v66[v71] = v69 + 1;
          v69 = (char *)memchr(v69 + 1, 0, v118 - (v69 + 1));
          ++v71;
        }
        while (v69);
        v74 = v73 - 1;
      }
      else
      {
        v74 = 0;
      }
      v95 = v74;
      qsort_b(v66, v74, 8uLL, &__block_literal_global);
      v96 = (char *)malloc_type_malloc(v64, 0x2824CFAFuLL);
      if (v96)
      {
        v97 = v96;
        if ((_DWORD)v95)
        {
          v98 = (const char **)v66;
          v99 = v96;
          do
          {
            v100 = *v98++;
            v101 = strlen(v100) + 1;
            memcpy(v99, v100, v101);
            v99 += v101;
            --v95;
          }
          while (v95);
        }
        __memcpy_chk();
        free(v97);
        v3 = v117;
      }
      free(v66);
    }
  }
LABEL_182:
  if (v64 >= 1)
  {
    v12 = 0;
    v102 = 120;
    v103 = v6;
    v104 = v116;
    while (1)
    {
      v105 = strlen(v104) + 1;
      if (strcmp(v104, "com.apple.FinderInfo") && strcmp(v104, "com.apple.ResourceFork"))
      {
        if (!strcmp(v104, "figgledidiggledy"))
          v12 = 1;
        if (v105 >= 0x80)
          v105 = 128;
        v106 = *((_DWORD *)a1 + 70);
        if (v106 && !xattr_preserve_for_intent(v104, v106))
        {
          v113 = v118;
          memmove(v104, &v104[v105], v118 - &v104[v105]);
          v118 = &v113[-v105];
          v105 = 0;
        }
        else
        {
          if (!a1[26])
            goto LABEL_196;
          MEMORY[0x1E0C86820]();
          v107 = (char *)&v114 - ((v105 + 15) & 0xFFFFFFFFFFFFFFF0);
          memmove(v107, v104, v105);
          v107[v105 - 1] = 0;
          a1[31] = v107;
          v108 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26])(5, 1, a1, *a1, a1[1], a1[27]);
          a1[31] = 0;
          if (v108 != 1)
          {
            if (v108 == 2)
            {
              *((_DWORD *)a1 + 68) = 89;
              v9 = 0xFFFFFFFFLL;
              goto LABEL_133;
            }
            v3 = v117;
LABEL_196:
            v103[1].i8[2] = v105;
            v103[1].i16[0] = 0;
            if (&v104[v105] > v118)
              goto LABEL_205;
            v109 = (char *)&v103[1] + 3;
            memmove((char *)&v103[1] + 3, v104, v105);
            if (*((_DWORD *)a1 + 69) >= 2u)
            {
              v110 = *__error();
              syslog(7, "%s:%d:%s() copied name [%s]\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5478, "copyfile_pack", v109);
              *__error() = v110;
            }
            v111 = ((_WORD)v105 + 14) & 0x1FC;
            v102 += v111;
            if (v102 >= 65554)
            {
LABEL_205:
              v9 = 0xFFFFFFFFLL;
              v5 = v116;
              goto LABEL_172;
            }
            ++*((_WORD *)v3 + 59);
            *((_DWORD *)v3 + 24) += v111;
            goto LABEL_203;
          }
          v112 = v118;
          memmove(v104, &v104[v105], v118 - &v104[v105]);
          v118 = &v112[-v105];
          v105 = 0;
          v3 = v117;
        }
      }
LABEL_203:
      v104 += v105;
      v103 = (int8x8_t *)((char *)v3 + v102);
      if (v104 >= v118)
        goto LABEL_18;
    }
  }
LABEL_17:
  v12 = 0;
LABEL_18:
  v13 = v116;
  if (a1[28] && !v12)
    strlcpy(&v116[v115], "figgledidiggledy", 65554 - v115);
  if (v13 >= v118)
  {
    v9 = 0;
    LODWORD(v115) = 0;
LABEL_107:
    v3 = v117;
    v59 = v117[24];
    v60 = v117[25] + v59;
    *(_DWORD *)((char *)v117 + 42) = v60;
    *(_DWORD *)((char *)v3 + 34) = v60 - *(_DWORD *)((char *)v3 + 30);
    *((_DWORD *)v3 + 23) = v60;
    if (!(_DWORD)v115)
    {
      v5 = v116;
      goto LABEL_163;
    }
    v61 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    if (v61)
    {
      a1[31] = "com.apple.ResourceFork";
      v62 = v61(5, 1, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v62 == 1)
      {
        v63 = 0;
        v80 = 0;
        v5 = v116;
LABEL_157:
        if (a1[31])
          a1[31] = 0;
        if (v63)
          free(v63);
        if (v80)
          goto LABEL_171;
        v9 = 0;
        v59 = *((_DWORD *)v3 + 24);
LABEL_163:
        v88 = v59;
        len_p = v59;
        swap_adhdr((int8x8_t *)v3);
        v89 = *(int8x16_t *)((char *)v3 + 84);
        *(int8x16_t *)((char *)v3 + 84) = vrev32q_s8(v89);
        *((_DWORD *)v3 + 25) = bswap32(*((_DWORD *)v3 + 25));
        *((_WORD *)v3 + 58) = bswap32(*((unsigned __int16 *)v3 + 58)) >> 16;
        i = *((unsigned __int16 *)v3 + 59);
        v91 = bswap32(i) >> 16;
        *((_WORD *)v3 + 59) = v91;
        if (v89.i32[0] == 1381258305)
          LOWORD(i) = v91;
        for (i = (unsigned __int16)i; i; --i)
        {
          v92 = (v6[1].u8[2] + 14) & 0x1FC;
          *v6 = vrev32_s8(*v6);
          v6[1].i16[0] = bswap32(v6[1].u16[0]) >> 16;
          v6 = (int8x8_t *)((char *)v6 + v92);
        }
        v93 = pwrite(*((_DWORD *)a1 + 6), v3, v88, 0);
        if (v93 == len_p)
          goto LABEL_172;
        if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
        {
          v78 = *__error();
          syslog(4, "couldn't write file header: %m");
          goto LABEL_170;
        }
        goto LABEL_171;
      }
      if (v62 == 2)
      {
        v63 = 0;
        *((_DWORD *)a1 + 68) = 89;
        v5 = v116;
        goto LABEL_152;
      }
    }
    v75 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0, 0, 0, 0);
    if ((v75 & 0x8000000000000000) != 0)
    {
      v5 = v116;
      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        v78 = *__error();
        v79 = __error();
        syslog(4, "skipping attr \"%s\" due to error %d: %m", "com.apple.ResourceFork", *v79);
LABEL_170:
        *__error() = v78;
      }
LABEL_171:
      v9 = 0xFFFFFFFFLL;
      goto LABEL_172;
    }
    v76 = v75;
    v5 = v116;
    if (v75 >> 31)
    {
      v63 = 0;
      v77 = 22;
LABEL_137:
      *((_DWORD *)a1 + 68) = v77;
      goto LABEL_152;
    }
    v81 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    if (v81)
    {
      a1[31] = "com.apple.ResourceFork";
      a1[33] = 0;
      v82 = v81(5, 4, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v82 == 2)
      {
        v63 = 0;
        v77 = 89;
        goto LABEL_137;
      }
    }
    v63 = malloc_type_malloc(v76, 0x56F158B5uLL);
    if (v63)
    {
      if (fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v63, v76, 0, 0) == v76)
      {
        if (pwrite(*((_DWORD *)a1 + 6), v63, v76, *(unsigned int *)((char *)v3 + 42)) != v76
          && (*((_BYTE *)a1 + 195) & 0x40) != 0)
        {
          v83 = *__error();
          syslog(4, "couldn't write resource fork: %m");
          *__error() = v83;
          v5 = v116;
        }
        v84 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
        if (!v84 || v84(5, 2, a1, *a1, a1[1], a1[27]) != 2)
        {
          if (*((_DWORD *)a1 + 69) >= 3u)
          {
            v85 = *__error();
            syslog(7, "%s:%d:%s() copied %zd bytes of \"%s\" data @ offset 0x%08x\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5294, "copyfile_pack_rsrcfork", v76, "com.apple.ResourceFork", *(_DWORD *)((char *)v3 + 42));
            *__error() = v85;
            v5 = v116;
          }
          v80 = 0;
          *(_DWORD *)((char *)v3 + 46) = v76;
          goto LABEL_157;
        }
        goto LABEL_152;
      }
      if ((*((_BYTE *)a1 + 195) & 0x40) == 0)
      {
LABEL_152:
        v87 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
        if (v87)
        {
          if (v87(5, 3, a1, *a1, a1[1], a1[27]))
            v80 = -1;
          else
            v80 = 0;
        }
        else
        {
          v80 = -1;
        }
        goto LABEL_157;
      }
      v86 = *__error();
      syslog(4, "couldn't read entire resource fork: %m");
    }
    else
    {
      v86 = *__error();
      syslog(4, "malloc: %m");
    }
    *__error() = v86;
    goto LABEL_152;
  }
  LODWORD(v115) = 0;
  v9 = 0;
  v14 = 0;
  v15 = v6;
  while (1)
  {
    v16 = strlen(v13);
    if (!strcmp(v13, "com.apple.acl.text"))
    {
      v120[0] = 0;
      if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, v120) < 0)
      {
        if (*__error() != 2 && (*((_BYTE *)a1 + 195) & 0x40) != 0)
        {
          v34 = *__error();
          syslog(4, "getting acl: %m");
          *__error() = v34;
        }
        len_p = 0;
      }
      else
      {
        v22 = acl_to_text((acl_t)v120[0], &len_p);
        if (v22)
        {
          v23 = v22;
          v24 = malloc_type_malloc(++len_p, 0x7468869BuLL);
          v14 = v24;
          if (v24)
            memcpy(v24, v23, len_p);
          else
            len_p = 0;
          acl_free(v23);
        }
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          v35 = *__error();
          syslog(7, "%s:%d:%s() copied acl (%ld) %p\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5199, "copyfile_pack_acl", len_p, v14);
          *__error() = v35;
        }
      }
      if (v120[0])
        acl_free(v120[0]);
      goto LABEL_65;
    }
    if (a1[28] && !strcmp(v13, "figgledidiggledy"))
      goto LABEL_65;
    if (strcmp(v13, "com.apple.FinderInfo"))
      break;
    v25 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    if (v25)
    {
      a1[31] = "com.apple.FinderInfo";
      v26 = v25(5, 1, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v26 == 1)
        goto LABEL_72;
      if (v26 == 2)
        goto LABEL_131;
      a1[33] = 0;
      v27 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26])(5, 4, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v27 == 2)
        goto LABEL_131;
    }
    v28 = fgetxattr(*((_DWORD *)a1 + 4), v13, (char *)v117 + *(unsigned int *)((char *)v117 + 30), 0x20uLL, 0, 0);
    len_p = v28;
    if (v28 < 0)
    {
      v41 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
      if (v41)
      {
        a1[31] = strdup(v13);
        v42 = v41(5, 3, a1, *a1, a1[1], a1[27]);
        v43 = (void *)a1[31];
        if (v43)
        {
          free(v43);
          a1[31] = 0;
        }
        if (v42 == 2)
          goto LABEL_132;
      }
      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        v44 = *__error();
        __error();
        syslog(4, "skipping attr \"%s\" due to error %d: %m");
LABEL_89:
        *__error() = v44;
      }
    }
    else
    {
      v29 = *((_DWORD *)a1 + 48);
      if (v28 == 32)
      {
        if ((v29 & 0x40000000) != 0)
        {
          v30 = *__error();
          syslog(4, " copied 32 bytes of \"%s\" data @ offset 0x%08x: %m", "com.apple.FinderInfo", *(_DWORD *)((char *)v117 + 30));
          *__error() = v30;
        }
        v31 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
        if (v31)
        {
          a1[31] = strdup(v13);
          v32 = v31(5, 2, a1, *a1, a1[1], a1[27]);
          v33 = (void *)a1[31];
          if (v33)
          {
            free(v33);
            a1[31] = 0;
          }
          if (v32 == 2)
            goto LABEL_132;
        }
      }
      else if ((v29 & 0x40000000) != 0)
      {
        v44 = *__error();
        syslog(4, "unexpected size (%ld) for \"%s\": %m");
        goto LABEL_89;
      }
    }
LABEL_72:
    v13 += v16 + 1;
    if (v13 >= v118)
      goto LABEL_107;
  }
  if (!strcmp(v13, "com.apple.ResourceFork"))
  {
    LODWORD(v115) = 1;
    goto LABEL_72;
  }
  v17 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
  if (!v17)
    goto LABEL_32;
  a1[31] = strdup(v13);
  a1[33] = 0;
  v18 = v17(5, 4, a1, *a1, a1[1], a1[27]);
  v19 = (void *)a1[31];
  if (v19)
  {
    free(v19);
    a1[31] = 0;
  }
  if (v18 != 2)
  {
LABEL_32:
    v20 = fgetxattr(*((_DWORD *)a1 + 4), v13, 0, 0, 0, 0);
    len_p = v20;
    if (!v20)
      goto LABEL_71;
    if ((v20 & 0x8000000000000000) != 0)
    {
      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        v45 = *__error();
        v46 = __error();
        syslog(4, "skipping attr \"%s\" due to error %d: %m", v13, *v46);
        *__error() = v45;
      }
      v47 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
      if (v47)
      {
        a1[31] = strdup(v13);
        v48 = v47(5, 3, a1, *a1, a1[1], a1[27]);
        v49 = (void *)a1[31];
        if (v49)
        {
          free(v49);
          a1[31] = 0;
        }
        if (v48 == 2)
          goto LABEL_131;
      }
      goto LABEL_71;
    }
    if (v20 >= 0x1000001)
    {
      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        v21 = *__error();
        syslog(4, "skipping attr \"%s\" (too big): %m", v13);
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    v14 = malloc_type_malloc(v20, 0xD053BCD6uLL);
    if (!v14)
    {
      v9 = 0xFFFFFFFFLL;
      goto LABEL_72;
    }
    len_p = fgetxattr(*((_DWORD *)a1 + 4), v13, v14, len_p, 0, 0);
    v50 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    if (v50)
    {
      a1[31] = strdup(v13);
      v51 = v50(5, 2, a1, *a1, a1[1], a1[27]);
      v52 = (void *)a1[31];
      if (v52)
      {
        free(v52);
        a1[31] = 0;
      }
      if (v51 == 2)
        goto LABEL_131;
    }
LABEL_65:
    v36 = len_p;
    v15->i32[1] = len_p;
    v37 = v117;
    v38 = v117[25];
    v39 = (v38 + v117[24]);
    v15->i32[0] = v39;
    v37[25] = v38 + v36;
    v40 = pwrite(*((_DWORD *)a1 + 6), v14, v36, v39);
    if (v40 == len_p)
      v9 = v9;
    else
      v9 = 1;
    free(v14);
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      v21 = *__error();
      syslog(7, "%s:%d:%s() copied %ld bytes of \"%s\" data @ offset 0x%08x\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5700, "copyfile_pack", len_p, v13, v15->i32[0]);
LABEL_70:
      *__error() = v21;
    }
LABEL_71:
    v15 = (int8x8_t *)((char *)v15 + ((v15[1].u8[2] + 14) & 0x1FC));
    goto LABEL_72;
  }
LABEL_131:
  *((_DWORD *)a1 + 68) = 89;
LABEL_132:
  v9 = 0xFFFFFFFFLL;
LABEL_133:
  v5 = v116;
  v3 = v117;
LABEL_172:
  free(v3);
  free(v5);
  if (!(_DWORD)v9)
    copyfile_stat((uint64_t)a1);
  return v9;
}

uint64_t copyfile_data(_QWORD *a1, int a2)
{
  uint64_t (*v4)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int *v5;
  int *v6;
  int *v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  int32_t f_iosize;
  unint64_t f_bsize;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  int v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  size_t v29;
  int v30;
  uint64_t v31;
  int *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t (*v36)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  char *v37;
  int v38;
  int v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  int v47;
  ssize_t v48;
  off_t v49;
  uint64_t v50;
  char *v51;
  size_t v52;
  ssize_t v53;
  int v54;
  uint64_t v55;
  ssize_t v56;
  int v57;
  uint64_t v58;
  int v59;
  off_t v60;
  ssize_t v61;
  int v62;
  int v63;
  int v64;
  const char *v65;
  const char *v66;
  unint64_t v67;
  unint64_t v68;
  off_t v69;
  off_t v70;
  off_t v71;
  char *v72;
  size_t v73;
  ssize_t v74;
  int v75;
  int v76;
  int v77;
  off_t v78;
  char v79;
  int v80;
  int v81;
  int *v82;
  int v84;
  int v85;
  off_t v86;
  off_t v87;
  off_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  ssize_t __nbyte;
  uint64_t v94;
  off_t v95;
  size_t size;
  off_t v97;
  off_t v98;
  int __fd;
  int __fda;
  size_t v101;
  size_t v102;
  char *v103;
  int *v104;
  int v105;
  int v106[2];
  void *v107;
  char *v108;
  _QWORD v109[2];
  uint64_t v110;
  statfs v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C874D8];
  if ((*((_WORD *)a1 + 18) & 0xF000) != 0x8000)
    return 0;
  v4 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
  if ((a2 & 1) != 0)
  {
    v5 = (int *)a1 + 5;
    v104 = (int *)(a1 + 2);
    v6 = (int *)a1 + 7;
    v7 = (int *)(a1 + 3);
    v8 = (_QWORD *)a1[22];
    goto LABEL_17;
  }
  v10 = *((_DWORD *)a1 + 49);
  if ((v10 & 4) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      v11 = 1;
      if ((v10 & 0x100) != 0)
        goto LABEL_8;
    }
    else
    {
      v11 = lseek(*((_DWORD *)a1 + 4), 0, 1) == 0;
      if ((*((_DWORD *)a1 + 49) & 0x100) != 0)
      {
LABEL_8:
        v12 = 1;
        goto LABEL_11;
      }
    }
    v12 = lseek(*((_DWORD *)a1 + 6), 0, 1) == 0;
LABEL_11:
    if (v11
      && v12
      && !copyfile_set_bsdflags((uint64_t)a1, 32, -1)
      && !fstat(*((_DWORD *)a1 + 6), (stat *)&v111)
      && (v111.f_mntonname[28] & 0x20) != 0)
    {
      goto LABEL_157;
    }
    fremovexattr(*((_DWORD *)a1 + 6), "com.apple.decmpfs", 32);
    fremovexattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", 32);
  }
  v5 = (int *)(a1 + 2);
  v6 = (int *)(a1 + 3);
  v8 = a1 + 4;
  v7 = (int *)(a1 + 3);
  v104 = (int *)(a1 + 2);
LABEL_17:
  v13 = *v6;
  if (fstatfs(*v5, &v111) == -1)
  {
    f_bsize = 0;
    f_iosize = *((_DWORD *)v8 + 28);
  }
  else
  {
    f_bsize = v111.f_bsize;
    f_iosize = v111.f_iosize;
  }
  v16 = f_iosize;
  if (fstatfs(v13, &v111) == -1)
  {
    v17 = 0;
    v18 = v16;
  }
  else
  {
    v17 = (void *)v111.f_bsize;
    if (v111.f_iosize >= v16)
      LODWORD(v18) = v16;
    else
      LODWORD(v18) = v111.f_iosize;
    v18 = (int)v18;
    if (!v111.f_iosize)
      v18 = v16;
  }
  v107 = v17;
  v19 = *((unsigned int *)a1 + 71);
  if (f_bsize > v19)
    v19 = v16;
  v20 = *((unsigned int *)a1 + 72);
  v21 = v19 < v20 || (unint64_t)v17 > v20;
  if (v21)
    v22 = v18;
  else
    v22 = *((unsigned int *)a1 + 72);
  v23 = v8[12];
  if (v23 < v19 && f_bsize != 0)
  {
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      v25 = *__error();
      syslog(7, "%s:%d:%s() rounding up block size from fsize: %lld to multiple of %zu\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2852, "copyfile_get_bsizes", a1[16], f_bsize);
      *__error() = v25;
      v23 = v8[12];
    }
    if (v23 % f_bsize)
      v26 = f_bsize - v23 % f_bsize;
    else
      v26 = 0;
    v19 = v26 + v23;
    if (v22 >= v19)
      v22 = v19;
  }
  if (v22 >= 0x40000000)
    v27 = 0x40000000;
  else
    v27 = v22;
  if (v19 <= 0x40000000)
    v28 = v22;
  else
    v28 = v27;
  if (v19 >= 0x40000000)
    v29 = 0x40000000;
  else
    v29 = v19;
  *__error() = 0;
  if (*((_DWORD *)a1 + 69) >= 3u)
  {
    v30 = *__error();
    syslog(7, "%s:%d:%s() input block size: %zu output block size: %zu\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2926, "copyfile_data", v29, v28);
    *__error() = v30;
  }
  if ((a2 & 1) != 0)
    goto LABEL_73;
  a1[33] = 0;
  if ((*((_BYTE *)a1 + 195) & 8) == 0)
    goto LABEL_73;
  v101 = v29;
  v31 = fpathconf(*v104, 27);
  if (v31 >= fpathconf(*v7, 27))
    v32 = v7;
  else
    v32 = v104;
  v33 = fpathconf(*v32, 27);
  if (f_bsize && v107 && v33 >= f_bsize && v33 >= (unint64_t)v107)
  {
    v105 = *((_DWORD *)a1 + 4);
    __fd = *((_DWORD *)a1 + 6);
    v34 = a1[16];
    v35 = f_bsize >= (unint64_t)v107 ? v107 : (void *)f_bsize;
    v36 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
    *__error() = 0;
    if ((*((_BYTE *)a1 + 195) & 8) != 0)
    {
      size = (size_t)v35;
      if ((v34 & 0x8000000000000000) != 0)
      {
        v72 = 0;
        v85 = 22;
        goto LABEL_163;
      }
      if (v34)
      {
        v67 = lseek(v105, 0, 1);
        v68 = lseek(__fd, 0, 1);
        if ((v67 & 0x8000000000000000) != 0 || v34 <= v67 || (v68 & 0x8000000000000000) != 0)
        {
          if (!*__error())
            *__error() = 22;
          v85 = *__error();
          syslog(4, "Invalid file descriptor offset, cannot perform a sparse copy: %m");
        }
        else
        {
          if (v67 % size || v68 % size)
            goto LABEL_71;
          v94 = v34 - v67;
          v95 = v68;
          v69 = lseek(v105, v67, 3);
          if (v69 == -1 || v69 == v34)
          {
            if (lseek(v105, v67, 0) == -1)
            {
              v72 = 0;
              goto LABEL_164;
            }
            goto LABEL_71;
          }
          v70 = v69;
          if (ftruncate(__fd, v95) == -1)
          {
            v85 = *__error();
            syslog(4, "Could not zero destination file before copy: %m");
          }
          else if (ftruncate(__fd, v94 + v95) == -1)
          {
            v85 = *__error();
            syslog(4, "Could not set destination file size before copy: %m");
          }
          else
          {
            v71 = lseek(v105, v67, 4);
            if (v71 == -1)
            {
              v72 = 0;
              if (*__error() == 6)
                goto LABEL_180;
              goto LABEL_164;
            }
            v98 = v71;
            if (lseek(__fd, v71 + v95 - v67, 0) != -1)
            {
              v72 = (char *)malloc_type_malloc(size, 0x6E19359FuLL);
              if (!v72)
              {
                v85 = *__error();
                syslog(4, "No memory for copy buffer: %m", v90, v91);
                goto LABEL_163;
              }
              __nbyte = read(v105, v72, size);
              if (__nbyte < 1)
                goto LABEL_191;
              while (1)
              {
                v92 = 0;
                v73 = __nbyte;
                v103 = v72;
                do
                {
                  while (1)
                  {
                    v74 = write(__fd, v103, v73);
                    if (v74 != -1)
                      break;
                    v75 = *__error();
                    syslog(4, "writing to output file failed: %m");
                    *__error() = v75;
                    if (!v36)
                      goto LABEL_164;
                    v76 = v36(4, 3, a1, *a1, a1[1], a1[27]);
                    if (v76)
                    {
                      if (v76 == 1)
                      {
                        v62 = 0;
                        *__error() = 0;
                        goto LABEL_181;
                      }
LABEL_164:
                      v79 = 0;
                      *((_DWORD *)a1 + 68) = *__error();
                      v62 = -1;
                      if (v72)
LABEL_165:
                        free(v72);
LABEL_166:
                      v37 = 0;
                      if ((v79 & 1) != 0)
                      {
LABEL_167:
                        v9 = 0;
                        goto LABEL_173;
                      }
LABEL_111:
                      if (v62 == -1)
                        goto LABEL_171;
                      goto LABEL_167;
                    }
                    *__error() = 0;
                  }
                  if (v74)
                  {
                    v92 = 0;
                    v73 -= v74;
                    v103 += v74;
                  }
                  else
                  {
                    v77 = v92 + 1;
                    v21 = v92++ < 5;
                    if (!v21)
                    {
                      v84 = *__error();
                      syslog(4, "writing to output %d times resulted in 0 bytes written: %m", v77);
                      *__error() = v84;
                      v85 = 35;
                      goto LABEL_163;
                    }
                  }
                  a1[33] += v74;
                  if (v36 && v36(4, 4, a1, *a1, a1[1], a1[27]) == 2)
                  {
                    v85 = 89;
                    goto LABEL_163;
                  }
                }
                while (v73);
                v98 += __nbyte;
                v78 = lseek(v105, v98, 3);
                if (v78 == -1)
                {
                  if (*__error() != 6)
                  {
                    v85 = *__error();
                    syslog(4, "unable to find next hole in file during copy: %m", v90, v91);
                    goto LABEL_163;
                  }
                  goto LABEL_191;
                }
                if (v78 != v98)
                {
                  if (lseek(v105, v98, 0) == -1)
                    goto LABEL_164;
                  goto LABEL_155;
                }
                v98 = lseek(v105, v98, 4);
                if (v98 == -1)
                {
                  if (*__error() != 6)
                  {
                    v85 = *__error();
                    syslog(4, "unable to advance src to next data section: %m", v90, v91);
                    goto LABEL_163;
                  }
                  goto LABEL_191;
                }
                if (lseek(__fd, v98 + v95 - v67, 0) == -1)
                {
                  v85 = *__error();
                  syslog(4, "unable to advance dst to next data section: %m", v90, v91);
                  goto LABEL_163;
                }
LABEL_155:
                __nbyte = read(v105, v72, size);
                if (__nbyte <= 0)
                {
LABEL_191:
                  if ((__nbyte & 0x8000000000000000) == 0)
                  {
                    if (f_bsize % v107)
                      goto LABEL_180;
                    if (lseek(v105, v67, 0) == -1 || lseek(__fd, v95, 0) == -1)
                    {
                      v89 = *__error();
                      syslog(4, "unable to reset file descriptors to punch holes: %m", v90, v91);
                      goto LABEL_204;
                    }
                    do
                    {
                      v86 = lseek(v105, v70 + size, 4);
                      if (v86 == -1)
                      {
                        if (*__error() != 6)
                          goto LABEL_209;
                        *(_QWORD *)&v111.f_bsize = 0;
                        v111.f_blocks = v70 - v67 + v95;
                        v111.f_bfree = v34 - v70 - v34 % size;
                        if (fcntl(__fd, 99, &v111) == -1)
                        {
                          v89 = *__error();
                          syslog(4, "unable to punch trailing hole in destination file, offset %lld: %m");
                          goto LABEL_204;
                        }
                        goto LABEL_180;
                      }
                      v87 = v86;
                      *(_QWORD *)&v111.f_bsize = 0;
                      v111.f_blocks = v70 - v67 + v95;
                      v111.f_bfree = v86 - v70;
                      if (fcntl(__fd, 99, &v111) == -1)
                      {
                        v89 = *__error();
                        syslog(4, "unable to punch hole in destination file, offset %lld length %lld: %m");
                        goto LABEL_204;
                      }
                      v88 = lseek(v105, v87, 3);
                      v70 = v88;
                    }
                    while (v88 != -1 && v88 != v34);
                    if (v88 == -1 && *__error() != 6)
                    {
LABEL_209:
                      v89 = *__error();
                      syslog(4, "lseek during hole punching failed: %m", v90, v91);
LABEL_204:
                      *__error() = v89;
                    }
LABEL_180:
                    v62 = 0;
                    a1[33] = v94;
LABEL_181:
                    v79 = 1;
                    if (v72)
                      goto LABEL_165;
                    goto LABEL_166;
                  }
                  v85 = *__error();
                  __error();
                  syslog(4, "error %d reading from %s: %m");
LABEL_163:
                  *__error() = v85;
                  goto LABEL_164;
                }
              }
            }
            v85 = *__error();
            syslog(4, "failed to set dst to first data section: %m");
          }
        }
        v72 = 0;
        goto LABEL_163;
      }
LABEL_157:
      v37 = 0;
      goto LABEL_167;
    }
  }
LABEL_71:
  v29 = v101;
  if ((a1[24] & 8) == 0)
  {
    v37 = 0;
    *__error() = 45;
    goto LABEL_171;
  }
LABEL_73:
  v38 = *v5;
  v39 = *v6;
  v40 = (char *)malloc_type_malloc(v29, 0xF823521CuLL);
  if (!v40)
    return 0xFFFFFFFFLL;
  v37 = v40;
  if (a2)
    v41 = (uint64_t *)(a1[22] + 96);
  else
    v41 = a1 + 16;
  v42 = *v41;
  v43 = fstat(v39, (stat *)&v111);
  v44 = *(_QWORD *)&v111.f_mntonname[16] << 9;
  if (v43)
    v44 = 0;
  v45 = __OFSUB__(v42, v44);
  v46 = v42 - v44;
  if (!((v46 < 0) ^ v45 | (v46 == 0)))
  {
    v109[0] = 0x300000000;
    v109[1] = 0;
    v110 = v46;
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      v47 = *__error();
      syslog(7, "%s:%d:%s() preallocating %lld bytes on destination\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2993, "copyfile_data", v110);
      *__error() = v47;
    }
    fcntl(v39, 42, v109);
  }
  v48 = read(v38, v37, v29);
  if (v48 < 1)
  {
    v49 = 0;
LABEL_109:
    if (v48 < 0)
    {
      v64 = *__error();
      v65 = (const char *)*a1;
      if (!*a1)
        v65 = "(null src)";
      v66 = "(rsrc)";
      if (a2)
        v66 = (const char *)&unk_1DED3E6B9;
      syslog(4, "reading from %s %s: %m", v65, v66);
      *__error() = v64;
      goto LABEL_171;
    }
    v62 = ftruncate(v39, v49) >> 31;
    goto LABEL_111;
  }
  v102 = v29;
  v49 = 0;
  __fda = 0;
  if (a2)
    v50 = 5;
  else
    v50 = 4;
  v51 = v37;
  v97 = v28;
  v108 = v37;
LABEL_89:
  *(_QWORD *)v106 = v49;
  if (v48 >= v28)
    v52 = v28;
  else
    v52 = v48;
  while (1)
  {
    v53 = write(v39, v51, v52);
    if (v53 != -1)
    {
      v56 = v53;
      if (v53)
      {
        v57 = 0;
        v48 -= v53;
        v51 += v53;
        v58 = *(_QWORD *)v106;
      }
      else
      {
        v57 = __fda + 1;
        v58 = *(_QWORD *)v106;
        if (__fda >= 5)
        {
          v80 = *__error();
          syslog(4, "writing to output %d times resulted in 0 bytes written: %m", __fda + 1);
          *__error() = v80;
          v81 = 35;
LABEL_169:
          *((_DWORD *)a1 + 68) = v81;
LABEL_170:
          v37 = v108;
          goto LABEL_171;
        }
      }
      __fda = v57;
      if ((a2 & 1) == 0)
      {
        a1[33] += v53;
        if (v4)
        {
          v59 = v4(4, 4, a1, *a1, a1[1], a1[27]);
          v58 = *(_QWORD *)v106;
          if (v59 == 2)
          {
            v82 = __error();
            v81 = 89;
            *v82 = 89;
            goto LABEL_169;
          }
        }
      }
      v49 = v56 + v58;
      v28 = v97;
      v37 = v108;
      if (!v48)
      {
        v60 = v49;
        v61 = read(v38, v108, v102);
        v49 = v60;
        v48 = v61;
        __fda = 0;
        v51 = v108;
        if (v61 < 1)
          goto LABEL_109;
      }
      goto LABEL_89;
    }
    v54 = *__error();
    syslog(4, "writing to output file got error: %m");
    *__error() = v54;
    if (!v4)
      goto LABEL_170;
    v55 = v4(v50, 3, a1, *a1, a1[1], a1[27]);
    if ((_DWORD)v55 == 1)
    {
      v9 = 0;
      v37 = v108;
      goto LABEL_173;
    }
    v9 = v55;
    if (a2)
      break;
    if ((_DWORD)v55)
      goto LABEL_170;
    *__error() = 0;
  }
  v37 = v108;
  if (!(_DWORD)v55)
    goto LABEL_173;
  if ((_DWORD)v55 == 2)
  {
    v63 = 89;
    goto LABEL_172;
  }
LABEL_171:
  v63 = *__error();
LABEL_172:
  *((_DWORD *)a1 + 68) = v63;
  v9 = 0xFFFFFFFFLL;
LABEL_173:
  free(v37);
  return v9;
}

int8x8_t swap_adhdr(int8x8_t *a1)
{
  uint64_t v1;
  unsigned int v2;
  int8x8_t result;
  int8x8_t v4;
  unsigned int *v5;

  LODWORD(v1) = a1[3].u16[0];
  v2 = bswap32(v1) >> 16;
  result = *a1;
  v4 = vrev32_s8(*a1);
  if (a1->u32[0] != 333319)
    LOWORD(v1) = v2;
  *a1 = v4;
  a1[3].i16[0] = v2;
  if ((_WORD)v1)
  {
    v1 = (unsigned __int16)v1;
    v5 = (unsigned int *)((char *)&a1[4] + 2);
    do
    {
      result = vrev32_s8(*(int8x8_t *)(v5 - 2));
      *((int8x8_t *)v5 - 1) = result;
      *v5 = bswap32(*v5);
      v5 += 3;
      --v1;
    }
    while (v1);
  }
  return result;
}

int8x16_t swap_attrhdr(uint64_t a1)
{
  int8x16_t result;

  result = vrev32q_s8(*(int8x16_t *)(a1 + 84));
  *(int8x16_t *)(a1 + 84) = result;
  *(_DWORD *)(a1 + 100) = bswap32(*(_DWORD *)(a1 + 100));
  *(_WORD *)(a1 + 116) = bswap32(*(unsigned __int16 *)(a1 + 116)) >> 16;
  *(_WORD *)(a1 + 118) = bswap32(*(unsigned __int16 *)(a1 + 118)) >> 16;
  return result;
}

uint64_t __sort_xattrname_list_block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t copyfile_unpack_xattr(_QWORD *a1, uint64_t a2, void *value)
{
  int v6;
  uint64_t result;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v9;
  void *v10;
  const char *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  int v17;
  uint64_t (*v18)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD);
  int v19;
  void *v20;

  if (!*((_DWORD *)a1 + 70))
  {
    v6 = xattr_preserve_for_intent((const char *)(a2 + 11), 0);
    result = 0;
    if (v6 != 1)
      return result;
  }
  v8 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
  if (v8)
  {
    a1[31] = strdup((const char *)(a2 + 11));
    a1[33] = 0;
    v9 = v8(5, 1, a1, *a1, a1[1], a1[27]);
    v10 = (void *)a1[31];
    if (v10)
    {
      free(v10);
      a1[31] = 0;
    }
    if (v9 == 2)
      goto LABEL_12;
  }
  v11 = (const char *)(a2 + 11);
  v12 = fsetxattr(*((_DWORD *)a1 + 6), (const char *)(a2 + 11), value, *(unsigned int *)(a2 + 4), 0, 0);
  v13 = *__error();
  if (v12 != -1 || v13 == 1 && !strcmp((const char *)(a2 + 11), "com.apple.root.installed"))
  {
    v14 = a1[26];
    *__error() = v13;
    if (!v14)
      return 0;
    a1[31] = strdup((const char *)(a2 + 11));
    a1[33] = *(unsigned int *)(a2 + 4);
    v15 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26])(5, 2, a1, *a1, a1[1], a1[27]);
    v16 = (void *)a1[31];
    if (v16)
    {
      free(v16);
      a1[31] = 0;
    }
    if (v15 != 2)
      return 0;
LABEL_12:
    *((_DWORD *)a1 + 68) = 89;
    return 0xFFFFFFFFLL;
  }
  *__error() = v13;
  if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
  {
    v17 = *__error();
    syslog(4, "error %d setting attribute %s: %m", v13, v11);
    *__error() = v17;
  }
  v18 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, _QWORD, _QWORD, _QWORD))a1[26];
  if (!v18)
    return 0xFFFFFFFFLL;
  a1[31] = strdup(v11);
  v19 = v18(5, 3, a1, *a1, a1[1], a1[27]);
  v20 = (void *)a1[31];
  if (v20)
  {
    free(v20);
    a1[31] = 0;
  }
  if (v19 == 2)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t copyfile_unpack_acl(uint64_t a1, unsigned int a2, char *buf_p)
{
  char *v6;
  char *v7;
  _filesec *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  int v13;
  const char *v14;
  int v15;
  const char *v16;
  int v17;
  const char *v18;
  int v19;
  stat v21;
  acl_t v22[2];

  if (buf_p[a2 - 1])
  {
    v6 = (char *)malloc_type_malloc(a2 + 1, 0x940CE1E0uLL);
    if (!v6)
      return 0xFFFFFFFFLL;
    v7 = v6;
    memcpy(v6, buf_p, a2);
    v7[a2] = 0;
    v22[0] = acl_from_text(v7);
    free(v7);
    if (v22[0])
      goto LABEL_4;
    return 0;
  }
  v22[0] = acl_from_text(buf_p);
  if (!v22[0])
    return 0;
LABEL_4:
  v8 = filesec_init();
  if (!v8
    || (v9 = fstatx_np(*(_DWORD *)(a1 + 24), &v21, v8), (v9 & 0x80000000) != 0)
    || (v10 = v9, filesec_set_property(v8, FILESEC_ACL, v22) < 0))
  {
LABEL_36:
    v10 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 1;
    while (fchmodx_np(*(_DWORD *)(a1 + 24), v8) < 0)
    {
      if (*__error() != 45 || (v11 & 1) == 0)
        goto LABEL_35;
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_ACL, 0) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          v13 = *__error();
          v14 = *(const char **)(a1 + 8);
          if (!v14)
            v14 = "(null dst)";
          syslog(7, "%s:%d:%s() unsetting acl attribute on %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1854, "copyfile_unset_acl", v14);
          *__error() = v13;
        }
        v12 = 1;
      }
      else
      {
        v12 = 0;
      }
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_UUID, 0) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          v15 = *__error();
          v16 = *(const char **)(a1 + 8);
          if (!v16)
            v16 = "(null dst)";
          syslog(7, "%s:%d:%s() unsetting uuid attribute on %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1859, "copyfile_unset_acl", v16);
          *__error() = v15;
        }
        v12 = 1;
      }
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_GRPUUID, 0) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          v17 = *__error();
          v18 = *(const char **)(a1 + 8);
          if (!v18)
            v18 = "(null dst)";
          syslog(7, "%s:%d:%s() unsetting group uuid attribute on %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1864, "copyfile_unset_acl", v18);
          *__error() = v17;
        }
LABEL_35:
        v19 = *__error();
        syslog(4, "setting security information: %m");
        *__error() = v19;
        goto LABEL_36;
      }
      v11 = 0;
      if (v12)
        goto LABEL_35;
    }
    if (!(_DWORD)v10)
      *(_DWORD *)(a1 + 196) |= 0x1000u;
  }
  acl_free(v22[0]);
  filesec_free(v8);
  return v10;
}

int xattr_intent_with_flags(xattr_operation_intent_t a1, xattr_flags_t a2)
{
  int v2;
  int *v3;
  int v4;

  v2 = 1;
  v3 = &dword_1EA94CF50;
  while (v2 != a1)
  {
    v4 = *v3;
    v3 += 4;
    v2 = v4;
    if (!v4)
      return (a2 & 4) == 0;
  }
  return (*(uint64_t (**)(void))(*((_QWORD *)v3 - 1) + 16))();
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  char v3;
  int v4;
  int *v5;
  int v6;

  v3 = xattr_flags_from_name(a1);
  v4 = 1;
  v5 = &dword_1EA94CF50;
  while (v4 != a2)
  {
    v6 = *v5;
    v5 += 4;
    v4 = v6;
    if (!v6)
      return (v3 & 4) == 0;
  }
  return (*(uint64_t (**)(void))(*((_QWORD *)v5 - 1) + 16))();
}

uint64_t __nameInDefaultList_block_invoke()
{
  uint64_t result;
  char **v1;

  result = _xpc_runtime_is_app_sandboxed();
  v1 = defaultUnboxedPropertyTable;
  if ((_DWORD)result)
    v1 = defaultSandboxedPropertyTable;
  defaultPropertyTable = (uint64_t)v1;
  return result;
}

BOOL intentTable_block_invoke(uint64_t a1, char a2)
{
  return (a2 & 0x34) == 0;
}

BOOL intentTable_block_invoke_2(uint64_t a1, char a2)
{
  return (a2 & 0x16) == 0;
}

BOOL intentTable_block_invoke_3(uint64_t a1, char a2)
{
  return (a2 & 0x35) == 0;
}

BOOL intentTable_block_invoke_4(uint64_t a1, char a2)
{
  return (a2 & 0x1C) == 8;
}

BOOL intentTable_block_invoke_5(uint64_t a1, char a2)
{
  return (a2 & 4) == 0;
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C874A8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1E0C88FB8]();
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C87568](permset_d, *(_QWORD *)&perm);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1E0C87570](permset_d);
}

int acl_copy_entry(acl_entry_t dest_d, acl_entry_t src_d)
{
  return MEMORY[0x1E0C87578](dest_d, src_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C87580](acl_p, entry_p);
}

int acl_create_entry_np(acl_t *acl_p, acl_entry_t *entry_p, int entry_index)
{
  return MEMORY[0x1E0C87588](acl_p, entry_p, *(_QWORD *)&entry_index);
}

int acl_delete_entry(acl_t acl, acl_entry_t entry_d)
{
  return MEMORY[0x1E0C87590](acl, entry_d);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C87598](obj_p);
}

acl_t acl_from_text(const char *buf_p)
{
  return (acl_t)MEMORY[0x1E0C875A0](buf_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C875A8](acl, *(_QWORD *)&entry_id, entry_p);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1E0C875B0](flagset_d, *(_QWORD *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1E0C875B8](obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1E0C875C0](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1E0C875C8](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1E0C875D0](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C875D8](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1E0C875E0](*(_QWORD *)&fd, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1E0C875E8](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1E0C875F0](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1E0C875F8](entry_d, *(_QWORD *)&tag_type);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x1E0C87600](acl, len_p);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1E0C87660](a1);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C87FF8](a1, a2);
}

int chmodx_np(const char *a1, filesec_t a2)
{
  return MEMORY[0x1E0C87670](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C88000](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int clonefileat(int a1, const char *a2, int a3, const char *a4, uint32_t a5)
{
  return MEMORY[0x1E0C88010](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C876A0](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1E0C88070](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C88078](*(_QWORD *)&a1, a2);
}

int fchmodx_np(int a1, filesec_t a2)
{
  return MEMORY[0x1E0C876B8](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C88088](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C88090](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C880A0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C880B0](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

filesec_t filesec_dup(filesec_t a1)
{
  return (filesec_t)MEMORY[0x1E0C87700](a1);
}

void filesec_free(filesec_t a1)
{
  MEMORY[0x1E0C87708](a1);
}

int filesec_get_property(filesec_t a1, filesec_property_t a2, void *a3)
{
  return MEMORY[0x1E0C87710](a1, *(_QWORD *)&a2, a3);
}

filesec_t filesec_init(void)
{
  return (filesec_t)MEMORY[0x1E0C87718]();
}

int filesec_set_property(filesec_t a1, filesec_property_t a2, const void *a3)
{
  return MEMORY[0x1E0C87720](a1, *(_QWORD *)&a2, a3);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C880C8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x1E0C880D8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C880E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C880F0](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C880F8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C88118](*(_QWORD *)&a1, a2);
}

int fstatx_np(int a1, stat *a2, filesec_t a3)
{
  return MEMORY[0x1E0C87760](*(_QWORD *)&a1, a2, a3);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C88130](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C87778](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C87780](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C87788](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1E0C87790](a1, a2, *(_QWORD *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C88138](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C88298](path, namebuff, size, *(_QWORD *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C882A8](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1E0C87D28](*(_QWORD *)&uid, uu);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C87820](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C87828](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C87838](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C884F0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88528](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C88538](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C885F0](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C88630](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C878B0](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C88640](*(_QWORD *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C88650](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C889B0](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C878D0](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C878F8](__p, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C88738](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C88740](a1, a2);
}

int statx_np(const char *a1, stat *a2, filesec_t a3)
{
  return MEMORY[0x1E0C87968](a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87A18](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A48](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C88750](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C87418](*(_QWORD *)&a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C887D0](a1);
}

