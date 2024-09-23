uint64_t rtadvdLog()
{
  os_log_t v0;
  uint64_t result;
  NSObject *v2;

  v0 = (os_log_t)rtadvdLogger;
  if (rtadvdLogger)
    return os_log_with_args(v0);
  v0 = os_log_create("com.apple.rtadvd", "daemon");
  rtadvdLogger = (uint64_t)v0;
  if (v0)
    return os_log_with_args(v0);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    result = rtadvdLog_cold_1(&v2);
    if ((result & 1) == 0)
    {
      v0 = v2;
      return os_log_with_args(v0);
    }
  }
  return result;
}

uint64_t agetent(uint64_t a1, unsigned __int8 *a2)
{
  char *v2;

  if (conffile)
    v2 = (char *)conffile;
  else
    v2 = "/etc/rtadvd.conf";
  remotefile = (uint64_t)v2;
  return getent(a1, a2, v2);
}

uint64_t getent(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  int v5;
  int *v6;
  uint64_t v8;
  int v9;
  int v10;
  _BYTE *v11;
  int v12;
  BOOL v13;
  _BYTE v14[1024];

  tbuf = a1;
  if (a3 && *a3)
  {
    RM = (uint64_t)a3;
    v5 = open(a3, 0);
    if (v5 < 0)
    {
      v6 = __error();
      strerror(*v6);
      rtadvdLog();
      return 4294967294;
    }
  }
  else
  {
    v5 = 0;
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  while (v9 != v10)
  {
LABEL_10:
    v11 = (_BYTE *)(a1 + v8);
    v12 = v14[v9++];
    if (v12 == 10)
    {
      v13 = v8-- < 1;
      if (v13 || *(v11 - 1) != 92)
        goto LABEL_17;
    }
    else if (v8 >= 1023)
    {
      write(2, "Remcap entry too long\n", 0x16uLL);
LABEL_17:
      *v11 = 0;
      v8 = 0;
      if (anamatch(a2))
      {
        close(v5);
        return anchktc();
      }
    }
    else
    {
      ++v8;
      *v11 = v12;
    }
  }
  v10 = read(v5, v14, 0x400uLL);
  if (v10 > 0)
  {
    v9 = 0;
    goto LABEL_10;
  }
  close(v5);
  return 0;
}

uint64_t anamatch(unsigned __int8 *a1)
{
  _BYTE *v1;
  unsigned __int8 *v2;
  int v3;
  int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v1 = (_BYTE *)tbuf;
  if (*(_BYTE *)tbuf == 35)
    return 0;
  v4 = *a1;
  v2 = a1 + 1;
  v3 = v4;
LABEL_3:
  if (v3)
  {
    v5 = v2;
    v6 = v3;
    do
    {
      v7 = *v1;
      if (v7 != v6)
        goto LABEL_10;
      ++v1;
      v8 = *v5++;
      v6 = v8;
    }
    while (v8);
  }
  v7 = *v1;
  if (*v1 && v7 != 58 && v7 != 124)
  {
LABEL_10:
    ++v1;
    if (v7)
    {
      do
      {
        if (v7 == 58)
          break;
        if (v7 == 124)
          goto LABEL_3;
        v9 = *v1++;
        v7 = v9;
      }
      while (v9);
    }
    return 0;
  }
  return 1;
}

uint64_t anchktc()
{
  uint64_t v0;
  size_t v1;
  uint64_t v2;
  size_t v3;
  size_t v4;
  const char *v5;
  char *v7;
  int v8;
  size_t v9;
  char *v10;
  _BYTE *v11;
  int v12;
  char *v13;
  int v14;
  char __s[1024];
  _BYTE v16[16];

  v0 = tbuf;
  v1 = strlen((const char *)tbuf);
  v2 = 0;
  v3 = tbuf + v1;
  while (1)
  {
    v4 = v3 + v2;
    if (*(_BYTE *)(v3 + v2 - 3) == 58)
      break;
    --v2;
    if (v3 + v2 - 2 < tbuf)
    {
      v5 = "Bad remcap entry\n";
      goto LABEL_5;
    }
  }
  v8 = *(unsigned __int8 *)(v4 - 2);
  v7 = (char *)(v4 - 2);
  if (v8 == 116)
  {
    v9 = v3 + v2;
    if (*(_BYTE *)(v9 - 1) == 99)
    {
      v10 = &__s[-v1 + 1026 - v2];
      v11 = v16;
      __strlcpy_chk(v16, v9 + 1, 16, 16);
      while (*v11 && *v11 != 58)
        ++v11;
      *v11 = 0;
      v12 = hopcount++;
      if (v12 >= 32)
      {
        v5 = "Infinite tc= loop\n";
LABEL_5:
        write(2, v5, 0x12uLL);
        return 0;
      }
      if (getent((int)__s, (int)v16, (char *)remotefile) != 1)
        return 0;
      v13 = __s;
      do
      {
        v14 = *v13++;
        ++v10;
      }
      while (v14 != 58);
      if ((int)(v1 + v2 + strlen(v13) - 2) >= 1025)
      {
        write(2, "Remcap entry too long\n", 0x17uLL);
        *v10 = 0;
      }
      strlcpy(v7, v13, v1 + v0 - tbuf + v2 - 2);
      tbuf = v0;
    }
  }
  return 1;
}

uint64_t agetnum(const char *a1)
{
  char *v2;
  char *v3;
  size_t v4;
  int v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;
  char *v9;
  int v10;

  v2 = tskip((char *)tbuf);
  if (!*v2)
    return -1;
  v3 = v2;
  v4 = strlen(a1);
  while (strncmp(v3, a1, v4))
  {
LABEL_7:
    v3 = tskip(v3);
    if (!*v3)
      return -1;
  }
  v5 = v3[v4];
  if (v5 == 64)
    return -1;
  if (v5 != 35)
  {
    v3 += v4;
    goto LABEL_7;
  }
  v7 = v3[v4 + 1] - 48;
  if (v7 > 9)
    return 0;
  result = 0;
  v8 = 10;
  if (v3[v4 + 1] == 48)
    v8 = 8;
  v9 = &v3[v4 + 2];
  do
  {
    result = result * v8 + v7;
    v10 = *v9++;
    v7 = v10 - 48;
  }
  while ((v10 - 48) < 0xA);
  return result;
}

char *tskip(char *result)
{
  char v1;
  int v2;
  int v3;

  v1 = *result;
  if (*result)
  {
    do
    {
      if (v1 == 92)
      {
        if ((result[1] - 48) > 9)
        {
          result += 2;
        }
        else
        {
          ++result;
          do
            v2 = *result++;
          while ((v2 - 48) < 0xA);
        }
      }
      else if (v1 == 58)
      {
        break;
      }
      v3 = *++result;
      v1 = v3;
    }
    while (v3);
  }
  if (v1 == 58)
    ++result;
  return result;
}

uint64_t agetflag(const char *a1)
{
  char *v2;
  char *v3;
  size_t v4;
  int v5;
  uint64_t result;

  v2 = tskip((char *)tbuf);
  if (*v2)
  {
    v3 = v2;
    v4 = strlen(a1);
    do
    {
      if (!strncmp(v3, a1, v4))
      {
        v3 += v4;
        v5 = *v3;
        result = 1;
        if (!*v3 || v5 == 58)
          return result;
        if (v5 == 64)
          return 0;
      }
      v3 = tskip(v3);
    }
    while (*v3);
  }
  return 0;
}

_BYTE *agetstr(const char *a1, _BYTE **a2)
{
  char *v4;
  char *v5;
  size_t v6;
  int v7;
  _BYTE *result;
  char *v9;
  _BYTE *v10;
  int v11;
  char *v12;
  int v13;
  int v14;
  BOOL v15;
  char *v16;
  unsigned __int8 v17;
  char *v18;
  int v19;
  char v20;
  char v21;
  int v22;
  BOOL v23;

  v4 = tskip((char *)tbuf);
  if (!*v4)
    return 0;
  v5 = v4;
  v6 = strlen(a1);
  while (1)
  {
    if (!strncmp(v5, a1, v6))
    {
      v5 += v6;
      v7 = *v5;
      if (v7 == 64)
        return 0;
      if (v7 == 61)
        break;
    }
    v5 = tskip(v5);
    if (!*v5)
      return 0;
  }
  v9 = v5 + 1;
  v10 = *a2;
  do
  {
    v11 = *v9;
    if (v11 == 34)
      v12 = v9 + 1;
    else
      v12 = v9;
    if (v11 == 34)
      v13 = 34;
    else
      v13 = 58;
    v9 = v12 + 1;
    v14 = *v12;
    if (*v12)
      v15 = v13 == v14;
    else
      v15 = 1;
    if (!v15)
    {
      while (v14 != 92)
      {
        if (v14 != 94)
          goto LABEL_30;
        v16 = v12 + 2;
        LOBYTE(v14) = *v9 & 0x1F;
LABEL_32:
        *v10++ = v14;
        v9 = v16 + 1;
        v14 = *v16;
        if (*v16)
          v23 = v13 == v14;
        else
          v23 = 1;
        v12 = v16;
        if (v23)
          goto LABEL_37;
      }
      v16 = v12 + 2;
      v14 = *v9;
      v17 = 69;
      v18 = "^^\\\\::n\nr\rt\tb\bf\f\"\"";
      do
      {
        if (v17 == v14)
        {
          LOBYTE(v14) = *(v18 - 1);
          goto LABEL_32;
        }
        v19 = *v18;
        v18 += 2;
        v17 = v19;
      }
      while (v19);
      if ((v14 - 48) > 9)
        goto LABEL_32;
      v20 = 0;
      v9 = v12 + 4;
      v21 = v12[2];
      LOBYTE(v14) = v14 - 48;
      while (1)
      {
        LOBYTE(v14) = (v21 - 48) | (8 * v14);
        if ((v20 & 1) != 0)
          break;
        v22 = *++v16;
        v21 = v22;
        v20 = 1;
        if ((v22 - 48) >= 0xA)
          goto LABEL_32;
      }
LABEL_30:
      v16 = v9;
      goto LABEL_32;
    }
LABEL_37:
    ;
  }
  while (v11 == 34 && v13 == v14);
  *v10 = 0;
  result = *a2;
  *a2 = v10 + 1;
  return result;
}

void getconfig(unsigned __int8 *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  char *v5;
  unsigned int v6;
  unsigned __int16 *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  char *v17;
  char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int i;
  const char *v30;
  const char *v31;
  int8x8_t *v32;
  int8x8_t *v33;
  int8x8_t *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  int v40;
  char *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  const char *v51;
  const char *v52;
  _OWORD *v53;
  _DWORD *v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  BOOL v69;
  int v70;
  int v71;
  int v72;
  _OWORD *v73;
  _OWORD *v74;
  const char *v75;
  const char *v76;
  unsigned __int8 *v77;
  const char *v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  int v83;
  const char *v84;
  int v85;
  const char *v86;
  BOOL v87;
  uint64_t v88;
  int64_t v89;
  int v90;
  uint64_t v91;
  int v92;
  size_t v93;
  size_t v94;
  char *v95;
  const char *v96;
  const char *v97;
  int v98;
  const char *v99;
  uint64_t v100;
  int v101;
  unsigned int v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  __int16 v106;
  int v107;
  char v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  const char *v113;
  const char *v114;
  int v115;
  char *v116;
  int *v117;
  int *v118;
  int *v119;
  void *v120;
  void *v121;
  const char *v122;
  void *v123;
  char *v124;
  int v125;
  timeval v126[16];
  int v127[2];
  uint64_t v128;
  char v129;
  _BYTE v130[1024];

  v124 = &v129;
  if ((int)agetent((uint64_t)v130, a1) <= 0)
  {
    bzero(v130, 0x400uLL);
    rtadvdLog();
  }
  v2 = malloc_type_malloc(0x1E8uLL, 0x1030040631F589DuLL);
  if (!v2)
  {
    v118 = __error();
    strerror(*v118);
    goto LABEL_202;
  }
  v3 = (uint64_t)v2;
  v2[60] = 0;
  *((_OWORD *)v2 + 28) = 0u;
  *((_OWORD *)v2 + 29) = 0u;
  *((_OWORD *)v2 + 26) = 0u;
  *((_OWORD *)v2 + 27) = 0u;
  *((_OWORD *)v2 + 24) = 0u;
  *((_OWORD *)v2 + 25) = 0u;
  *((_OWORD *)v2 + 22) = 0u;
  *((_OWORD *)v2 + 23) = 0u;
  *((_OWORD *)v2 + 20) = 0u;
  *((_OWORD *)v2 + 21) = 0u;
  *((_OWORD *)v2 + 18) = 0u;
  *((_OWORD *)v2 + 19) = 0u;
  *((_OWORD *)v2 + 16) = 0u;
  *((_OWORD *)v2 + 17) = 0u;
  *((_OWORD *)v2 + 13) = 0u;
  *((_OWORD *)v2 + 14) = 0u;
  *((_OWORD *)v2 + 11) = 0u;
  *((_OWORD *)v2 + 12) = 0u;
  *((_OWORD *)v2 + 9) = 0u;
  *((_OWORD *)v2 + 10) = 0u;
  *((_OWORD *)v2 + 6) = 0u;
  *((_OWORD *)v2 + 7) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 15) = 0u;
  *((_OWORD *)v2 + 8) = 0u;
  v4 = v2 + 16;
  v2[17] = v2 + 16;
  v2[16] = v2 + 16;
  v2[30] = v2 + 30;
  v123 = v2 + 30;
  v2[31] = v2 + 30;
  v5 = (char *)(v2 + 37);
  v2[37] = v2 + 37;
  v2[38] = v2 + 37;
  v2[42] = v2 + 42;
  v2[43] = v2 + 42;
  v121 = v2 + 42;
  if (getconfig_forwarding < 0)
  {
    *(_QWORD *)v127 = 0x1E00000004;
    v128 = 0x100000029;
    v125 = 0;
    v126[0].tv_sec = 4;
    if (sysctl(v127, 4u, &v125, (size_t *)v126, 0, 0) < 0)
    {
      v119 = __error();
      strerror(*v119);
      rtadvdLog();
      getconfig_forwarding = -1;
LABEL_203:
      exit(1);
    }
    getconfig_forwarding = v125;
    if (v125 < 0)
      goto LABEL_203;
  }
  if (agetflag("nolladdr"))
  {
    *(_DWORD *)(v3 + 48) = 0;
    v6 = if_nametoindex((const char *)a1);
  }
  else
  {
    *(_DWORD *)(v3 + 48) = 1;
    v7 = (unsigned __int16 *)if_nametosdl((const char *)a1);
    *(_QWORD *)(v3 + 56) = v7;
    if (!v7)
      goto LABEL_202;
    v6 = v7[1];
  }
  *(_DWORD *)(v3 + 44) = v6;
  __strlcpy_chk(v3 + 64, a1, 16, 16);
  v8 = if_getmtu((const char *)a1);
  *(_DWORD *)(v3 + 80) = v8;
  if (!v8)
  {
    *(_DWORD *)(v3 + 80) = 1280;
    rtadvdLog();
  }
  v9 = agetnum("maxinterval");
  v10 = 600;
  if (v9 >= 0)
    v10 = v9;
  if ((unint64_t)(v10 - 1801) <= 0xFFFFFFFFFFFFF8FALL)
    goto LABEL_202;
  v122 = (const char *)a1;
  *(_DWORD *)(v3 + 88) = v10;
  v11 = agetnum("mininterval");
  v12 = *(_DWORD *)(v3 + 88);
  v13 = v12 / 3uLL;
  if (v11 >= 0)
    v13 = v11;
  v14 = (3 * v12) >> 2;
  if (v13 < 3 || v13 > v14)
  {
LABEL_202:
    rtadvdLog();
    goto LABEL_203;
  }
  *(_DWORD *)(v3 + 92) = v13;
  v15 = agetnum("chlim");
  v16 = v15;
  if (v15 < 0)
    v16 = 64;
  *(_DWORD *)(v3 + 120) = v16;
  v17 = agetstr("raflags", &v124);
  if (v17)
  {
    v18 = v17;
    v19 = strchr(v17, 109) != 0;
    if (strchr(v18, 111))
      LODWORD(v20) = ((v19 & 1) << 7) | 0x40;
    else
      LODWORD(v20) = v19 << 7;
    if (strchr(v18, 104))
      LODWORD(v20) = v20 | 8;
    if (strchr(v18, 108))
    {
      if ((v20 & 8) != 0)
        goto LABEL_202;
      LODWORD(v20) = v20 | 0x18;
    }
  }
  else
  {
    v21 = agetnum("raflags");
    v20 = v21 & ~(v21 >> 63);
  }
  *(int8x8_t *)(v3 + 96) = vand_s8((int8x8_t)vdup_n_s32(v20), (int8x8_t)0x4000000080);
  *(_DWORD *)(v3 + 104) = v20 & 0x18;
  if ((v20 & 0x18) == 0x10)
    goto LABEL_202;
  v22 = agetnum("rltime");
  if ((v22 & 0x8000000000000000) != 0)
  {
    v23 = *(_DWORD *)(v3 + 88);
    v22 = (3 * v23);
    if (!(3 * v23))
      goto LABEL_40;
  }
  else if (!v22)
  {
    goto LABEL_40;
  }
  if (v22 > 0x2328 || v22 < *(unsigned int *)(v3 + 88) || !getconfig_forwarding)
    goto LABEL_202;
LABEL_40:
  *(_WORD *)(v3 + 84) = v22;
  v24 = agetnum("rtime");
  v25 = v24 & ~(v24 >> 63);
  if (v25 >= 0x36EE81)
    goto LABEL_202;
  *(_DWORD *)(v3 + 112) = v25;
  v26 = agetnum("retrans");
  v27 = v26 & ~(v26 >> 63);
  if (HIDWORD(v27))
    goto LABEL_202;
  v120 = v5;
  *(_DWORD *)(v3 + 116) = v27;
  if (agetnum("hapref") != -1 || agetnum("hatime") != -1)
    goto LABEL_202;
  v28 = agetnum("clockskew");
  *(_QWORD *)(v3 + 232) = v28 & ~(v28 >> 63);
  *(_DWORD *)(v3 + 224) = 0;
  for (i = -1; i != 100; ++i)
  {
    makeentry((char *)v127, 0x100uLL, i, "addr");
    v30 = agetstr((const char *)v127, &v124);
    if (v30)
    {
      v31 = v30;
      v32 = (int8x8_t *)malloc_type_malloc(0x60uLL, 0x1020040CF300BDFuLL);
      if (!v32)
        goto LABEL_201;
      v33 = v32;
      *(_OWORD *)v32[6].i8 = 0u;
      *(_OWORD *)v32[8].i8 = 0u;
      *(_OWORD *)v32[2].i8 = 0u;
      *(_OWORD *)v32[4].i8 = 0u;
      *(_OWORD *)v32->i8 = 0u;
      *(_OWORD *)v32[10].i8 = 0u;
      v34 = v32 + 10;
      v32[2] = (int8x8_t)v3;
      v32[9].i32[1] = 2;
      if (inet_pton(30, v31, &v32[10]) != 1)
        goto LABEL_202;
      v35 = v34->u8[0];
      if (v35 == 254)
      {
        if ((v33[10].i8[1] & 0xC0) == 0x80)
          rtadvdLog();
      }
      else if (v35 == 255)
      {
        goto LABEL_202;
      }
      makeentry((char *)v127, 0x100uLL, i, "prefixlen");
      v36 = agetnum((const char *)v127);
      v37 = 64;
      if (v36 >= 0)
        v37 = v36;
      if (v37 >= 129)
        goto LABEL_202;
      v33[9].i32[0] = v37;
      makeentry((char *)v127, 0x100uLL, i, "pinfoflags");
      v38 = agetstr((const char *)v127, &v124);
      if (v38)
      {
        v39 = v38;
        v40 = strchr(v38, 108) != 0;
        v41 = strchr(v39, 97);
        v42 = ((v40 & 1) << 7) | 0x40;
        if (!v41)
          v42 = v40 << 7;
      }
      else
      {
        v43 = agetnum((const char *)v127);
        v42 = 192;
        if (v43 >= 0)
          v42 = v43;
      }
      v33[8] = vand_s8((int8x8_t)vdup_n_s32(v42), (int8x8_t)0x4000000080);
      makeentry((char *)v127, 0x100uLL, i, "vltime");
      v44 = agetnum((const char *)v127);
      v45 = 2592000;
      if (v44 >= 0)
        v45 = v44;
      if (v45 >= (uint64_t)&_mh_execute_header)
        goto LABEL_202;
      v33[4].i32[0] = v45;
      makeentry((char *)v127, 0x100uLL, i, "vltimedecr");
      if (agetflag((const char *)v127))
      {
        v126[0].tv_sec = 0;
        *(_QWORD *)&v126[0].tv_usec = 0;
        gettimeofday(v126, 0);
        v33[5] = (int8x8_t)(v126[0].tv_sec + v33[4].u32[0]);
      }
      makeentry((char *)v127, 0x100uLL, i, "pltime");
      v46 = agetnum((const char *)v127);
      v47 = 604800;
      if (v46 >= 0)
        v47 = v46;
      if (v47 >= (uint64_t)&_mh_execute_header)
        goto LABEL_202;
      v33[6].i32[0] = v47;
      makeentry((char *)v127, 0x100uLL, i, "pltimedecr");
      if (agetflag((const char *)v127))
      {
        v126[0].tv_sec = 0;
        *(_QWORD *)&v126[0].tv_usec = 0;
        gettimeofday(v126, 0);
        v33[7] = (int8x8_t)(v126[0].tv_sec + v33[6].u32[0]);
      }
      insque(v33, v4);
      ++*(_DWORD *)(v3 + 224);
    }
  }
  if (!*(_DWORD *)(v3 + 224))
    get_prefix(v3);
  v48 = agetnum("mtu");
  v49 = v48 & ~(v48 >> 63);
  if (HIDWORD(v49))
    goto LABEL_202;
  *(_DWORD *)(v3 + 108) = v49;
  if ((_DWORD)v49)
  {
    if (v49 < 0x500 || *(_DWORD *)(v3 + 80) < v49)
      goto LABEL_202;
  }
  else
  {
    v78 = agetstr("mtu", &v124);
    if (v78 && !strcmp(v78, "auto"))
      *(_DWORD *)(v3 + 108) = *(_DWORD *)(v3 + 80);
  }
  v50 = -1;
  *(_DWORD *)(v3 + 288) = 0;
  do
  {
    makeentry((char *)v127, 0x100uLL, v50, "rtprefix");
    v51 = agetstr((const char *)v127, &v124);
    if (!v51)
    {
      makeentry((char *)v126, 0x100uLL, v50, "rtrprefix");
      v52 = agetstr((const char *)v126, &v124);
      if (!v52)
        goto LABEL_113;
      v51 = v52;
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
    }
    v53 = malloc_type_malloc(0x30uLL, 0x1020040586F8431uLL);
    if (!v53)
      goto LABEL_201;
    v54 = v53;
    v53[1] = 0u;
    v53[2] = 0u;
    *v53 = 0u;
    insque(v53, v123);
    ++*(_DWORD *)(v3 + 288);
    if (inet_pton(30, v51, v54 + 7) != 1)
      goto LABEL_202;
    makeentry((char *)v127, 0x100uLL, v50, "rtplen");
    v55 = agetnum((const char *)v127);
    if ((v55 & 0x8000000000000000) != 0 || v55 == 256)
    {
      makeentry((char *)v126, 0x100uLL, v50, "rtrplen");
      v55 = agetnum((const char *)v126);
      if ((v55 & 0x8000000000000000) != 0)
      {
        LODWORD(v55) = 64;
        goto LABEL_92;
      }
      v56 = v55;
      LODWORD(v55) = 64;
      if (v56 == 256)
        goto LABEL_92;
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
      v55 = v56;
    }
    if (v55 >= 0x81)
      goto LABEL_202;
LABEL_92:
    v54[6] = v55;
    makeentry((char *)v127, 0x100uLL, v50, "rtflags");
    v57 = agetstr((const char *)v127, &v124);
    if (v57)
    {
      v58 = v57;
      v59 = strchr(v57, 104);
      v60 = strchr(v58, 108);
      if (v60)
        v61 = 24;
      else
        v61 = 8 * (v59 != 0);
      if (v60 && v59)
        goto LABEL_202;
    }
    else
    {
      v62 = agetnum((const char *)v127);
      if (v62 < 0 || (v61 = v62, v62 == 256))
      {
        makeentry((char *)v126, 0x100uLL, v50, "rtrflags");
        v63 = agetnum((const char *)v126);
        if (v63 < 0 || (v61 = v63, v63 == 256))
        {
          v54[5] = 0;
          goto LABEL_105;
        }
        fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
      }
    }
    v54[5] = v61 & 0x18;
    if ((v61 & 0x18) == 0x10)
      goto LABEL_202;
LABEL_105:
    makeentry((char *)v127, 0x100uLL, v50, "rtltime");
    v64 = agetnum((const char *)v127);
    if (v64 < 0)
      v65 = -1;
    else
      v65 = v64;
    if ((v64 & 0x8000000000000000) == 0)
      goto LABEL_111;
    makeentry((char *)v126, 0x100uLL, v50, "rtrltime");
    v65 = agetnum((const char *)v126);
    if ((v65 & 0x8000000000000000) == 0)
    {
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
LABEL_111:
      if (HIDWORD(v65))
        goto LABEL_202;
      goto LABEL_112;
    }
    fprintf(__stderrp, "%s should be specified for interface %s.\n", (const char *)v127, v122);
    LODWORD(v65) = *(unsigned __int16 *)(v3 + 84);
LABEL_112:
    v54[4] = v65;
LABEL_113:
    ++v50;
  }
  while (v50 != 100);
  v66 = agetnum("rdnsslifetime");
  v67 = *(unsigned int *)(v3 + 88);
  if (v66 >= 0)
    v68 = v66;
  else
    v68 = (2 * v67);
  v69 = v68 < v67 || v68 > (2 * v67);
  if (v69)
    rtadvdLog();
  *(_DWORD *)(v3 + 332) = v68;
  v70 = agetnum("rdnssaddrs");
  v71 = v70;
  if (v70 < 0)
  {
    *(_DWORD *)(v3 + 328) = 0;
  }
  else
  {
    *(_DWORD *)(v3 + 328) = v70;
    if (v70)
    {
      v72 = v70 + 1;
      while (1)
      {
        v73 = malloc_type_malloc(0x20uLL, 0x10200406C4767B9uLL);
        if (!v73)
          break;
        v74 = v73;
        *v73 = 0u;
        v73[1] = 0u;
        insque(v73, v120);
        makeentry((char *)v127, 0x100uLL, v72 - 2, "rdnssaddr");
        v75 = agetstr((const char *)v127, &v124);
        v76 = v75;
        if (v71 == 1 && !v75)
        {
          __strlcpy_chk(v127, "rdnssaddr", 256, 256);
          v76 = agetstr((const char *)v127, &v124);
        }
        if (!v76)
          goto LABEL_202;
        v77 = (unsigned __int8 *)(v74 + 1);
        if (inet_pton(30, v76, v77) != 1 || *v77 == 255)
          goto LABEL_202;
        if (--v72 <= 1)
          goto LABEL_143;
      }
LABEL_201:
      v117 = __error();
      strerror(*v117);
      goto LABEL_202;
    }
  }
LABEL_143:
  v79 = agetnum("dnssllifetime");
  v80 = *(unsigned int *)(v3 + 88);
  if (v79 >= 0)
    v81 = v79;
  else
    v81 = (2 * v80);
  if (v81 < v80 || v81 > (2 * v80))
    rtadvdLog();
  *(_DWORD *)(v3 + 364) = v81;
  *(_DWORD *)(v3 + 368) = 8;
  v82 = agetnum("dnssldomains");
  v83 = v82;
  if (v82 < 0)
  {
    *(_DWORD *)(v3 + 360) = 0;
  }
  else
  {
    *(_DWORD *)(v3 + 360) = v82;
    if (v82)
    {
      do
      {
        makeentry((char *)v127, 0x20uLL, v83 - 1, "dnssldomain");
        v84 = agetstr((const char *)v127, &v124);
        if (!v84)
        {
          if (*(_DWORD *)(v3 + 360) != 1)
            goto LABEL_202;
          __strlcpy_chk(v127, "dnssldomain", 32, 32);
          v84 = agetstr((const char *)v127, &v124);
          if (!v84)
            goto LABEL_202;
        }
        v85 = strlen(v84);
        if (v85 >= 1)
        {
          v86 = &v84[v85 - 1 + 1];
          while (*v84 == 46)
          {
            ++v84;
            v87 = __OFSUB__(v85--, 1);
            if ((v85 < 0) ^ v87 | (v85 == 0))
            {
              v85 = 0;
              goto LABEL_161;
            }
          }
        }
        v86 = v84;
LABEL_161:
        v88 = v85;
        v89 = ((unint64_t)v85 << 32) + 0x1A00000000;
        v90 = v85 + 3;
        while ((int)v88 >= 1)
        {
          v91 = v88 - 1;
          v92 = v86[v88 - 1];
          v89 -= 0x100000000;
          --v90;
          --v88;
          if (v92 != 46)
          {
            v93 = v91 + 1;
            v94 = v89 >> 32;
            v95 = (char *)malloc_type_malloc(v89 >> 32, 0x922267D2uLL);
            bzero(v95, v94);
            insque(v95, v121);
            memcpy(v95 + 16, v86, v93);
            *(_DWORD *)(v3 + 368) += v90;
            break;
          }
        }
        v69 = v83-- <= 1;
      }
      while (!v69);
    }
    *(_DWORD *)(v3 + 368) = (*(_DWORD *)(v3 + 368) & 0xFFFFFFF8) + 8;
  }
  v96 = agetstr("capport", &v124);
  if (v96)
  {
    v97 = v96;
    *(_QWORD *)(v3 + 376) = strdup(v96);
    v98 = strlen(v97);
    *(_DWORD *)(v3 + 384) = v98;
    *(_DWORD *)(v3 + 388) = v98 - (((_BYTE)v98 + 2) & 7) + 10;
  }
  v99 = agetstr("pref64addr", &v124);
  if (v99)
  {
    if (inet_pton(30, v99, (void *)(v3 + 396)) != 1)
      goto LABEL_202;
    *(_BYTE *)(v3 + 392) = 1;
    v100 = agetnum("pref64len");
    v101 = v100 >= 0 ? v100 : 64;
    HIDWORD(v103) = v101;
    LODWORD(v103) = v101 - 32;
    v102 = v103 >> 3;
    if (v102 >= 9 || ((0x11Fu >> v102) & 1) == 0)
      goto LABEL_202;
    v104 = qword_10000BE30[v102];
    *(_BYTE *)(v3 + 393) = v101;
    v105 = agetnum("pref64lifetime");
    if ((v105 & 0x8000000000000000) != 0)
    {
      if ((3 * *(_DWORD *)(v3 + 88)) >= 0xFFF8)
        LOWORD(v105) = -8;
      else
        LOWORD(v105) = 3 * *(_WORD *)(v3 + 88);
    }
    else if (v105 >= 0xFFF9)
    {
      goto LABEL_202;
    }
    v106 = (v105 & 0xFFF8) + 8;
    if ((v105 & 7) == 0)
      v106 = v105;
    *(_WORD *)(v3 + 394) = v106 | v104;
  }
  if (agetflag("pvd"))
  {
    if (agetflag("http"))
      *(_BYTE *)(v3 + 413) |= 0x80u;
    if (agetflag("legacy"))
      *(_BYTE *)(v3 + 413) |= 0x40u;
    v107 = agetflag("ra");
    v108 = *(_BYTE *)(v3 + 413);
    if (v107)
    {
      v108 |= 0x20u;
      *(_BYTE *)(v3 + 413) = v108;
    }
    if (v108 < 0)
    {
      v109 = agetnum("delay");
      v110 = v109 & ~(v109 >> 63);
      if (v110 >= 0x100)
        goto LABEL_202;
      *(_BYTE *)(v3 + 412) = v110 & 0xF;
      v111 = agetnum("seqnr");
      v112 = v111 & ~(v111 >> 63);
      if (v112 >= 0x10000)
        goto LABEL_202;
      *(_WORD *)(v3 + 414) = v112;
    }
    v113 = agetstr("pvdid", &v124);
    if (!v113)
      goto LABEL_202;
    v114 = v113;
    *(_QWORD *)(v3 + 416) = strdup(v113);
    v115 = strlen(v114);
    *(_DWORD *)(v3 + 424) = v115;
    *(_DWORD *)(v3 + 428) = v115 - (((_BYTE)v115 + 6) & 7) + 14;
  }
  *(_QWORD *)v3 = ralist;
  ralist = v3;
  make_packet(v3);
  v116 = rtadvd_add_timer((uint64_t)ra_timeout, (uint64_t)ra_timer_update, v3, v3);
  *(_QWORD *)(v3 + 8) = v116;
  ra_timer_update((_DWORD *)v3, (uint64_t)(v116 + 24));
  rtadvd_set_timer(*(_QWORD *)(v3 + 8) + 24, *(_QWORD *)(v3 + 8));
}

size_t makeentry(char *a1, size_t __size, int a3, char *__source)
{
  if (a3 < 0)
    return strlcpy(a1, __source, __size);
  else
    return snprintf(a1, __size, "%s%d", __source, a3);
}

void get_prefix(uint64_t a1)
{
  ifaddrs *v2;
  void *v3;
  sockaddr *ifa_addr;
  unsigned __int8 *v5;
  sockaddr *ifa_netmask;
  unint64_t v7;
  int v8;
  int v9;
  _OWORD *v10;
  _BYTE *v11;
  _BYTE *v12;
  _BYTE *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  void *v16;
  ifaddrs *v17;
  int *v18;
  void *v19;
  ifaddrs *v20;
  char v21[46];

  v20 = 0;
  if (getifaddrs(&v20) < 0)
  {
LABEL_27:
    rtadvdLog();
    exit(1);
  }
  v2 = v20;
  if (!v20)
  {
    v17 = 0;
    goto LABEL_23;
  }
  v3 = (void *)(a1 + 128);
  do
  {
    if (strcmp(v2->ifa_name, (const char *)(a1 + 64)))
      goto LABEL_20;
    ifa_addr = v2->ifa_addr;
    if (ifa_addr->sa_family != 30)
      goto LABEL_20;
    v5 = (unsigned __int8 *)&ifa_addr->sa_data[6];
    if (ifa_addr->sa_data[6] == 254 && (ifa_addr->sa_data[7] & 0xC0) == 0x80)
      goto LABEL_20;
    ifa_netmask = v2->ifa_netmask;
    v7 = (unint64_t)ifa_netmask + ifa_netmask->sa_len;
    v8 = prefixlen(&ifa_netmask->sa_data[6], v7);
    if ((v8 - 129) <= 0xFFFFFF7F)
      goto LABEL_27;
    v9 = v8;
    if (v8 == 128 || find_prefix(a1, v5, v8))
      goto LABEL_20;
    v19 = v3;
    v10 = malloc_type_malloc(0x60uLL, 0x1020040CF300BDFuLL);
    if (!v10)
    {
      v18 = __error();
      strerror(*v18);
      goto LABEL_27;
    }
    v11 = v10;
    v10[3] = 0u;
    v10[4] = 0u;
    v10[1] = 0u;
    v10[2] = 0u;
    v10[5] = 0u;
    v12 = v10 + 5;
    *v10 = 0u;
    *((_DWORD *)v10 + 18) = v9;
    v10[5] = *(_OWORD *)v5;
    v13 = v10 + 5;
    if ((unint64_t)&ifa_netmask->sa_data[6] >= v7)
      goto LABEL_17;
    v14 = (unint64_t)(v11 + 96);
    v15 = (unsigned __int8 *)&ifa_netmask->sa_data[7];
    v13 = v12;
    do
    {
      *v13++ &= *(v15 - 1);
      if ((unint64_t)v15 >= v7)
        break;
      ++v15;
    }
    while ((unint64_t)v13 < v14);
    if ((unint64_t)v13 < v14)
LABEL_17:
      bzero(v13, v11 - v13 + 96);
    if (!inet_ntop(30, v12, v21, 0x2Eu))
      goto LABEL_27;
    rtadvdLog();
    *((_DWORD *)v11 + 8) = 2592000;
    *((_DWORD *)v11 + 12) = 604800;
    *((_QWORD *)v11 + 8) = 0x100000001;
    *((_DWORD *)v11 + 19) = 1;
    *((_QWORD *)v11 + 2) = a1;
    v16 = v11;
    v3 = v19;
    insque(v16, v19);
    ++*(_DWORD *)(a1 + 224);
LABEL_20:
    v2 = v2->ifa_next;
  }
  while (v2);
  v17 = v20;
LABEL_23:
  freeifaddrs(v17);
}

void make_packet(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  int8x8_t *v13;
  int8x8_t *v14;
  void *v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t *j;
  int v20;
  char v21;
  char v22;
  unsigned int v23;
  __darwin_time_t v24;
  unsigned int v25;
  __darwin_time_t v26;
  uint64_t k;
  int v28;
  void *v29;
  size_t v30;
  int v31;
  uint64_t *m;
  unsigned int v33;
  const char *v34;
  char *v35;
  const void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  unsigned int v44;
  int v45;
  timeval v46;

  if (*(_DWORD *)(a1 + 48))
  {
    v2 = lladdropt_length(*(_QWORD *)(a1 + 56));
    v3 = v2;
    if (!v2)
    {
      rtadvdLog();
      *(_DWORD *)(a1 + 48) = 0;
    }
    v4 = v3 + 16;
  }
  else
  {
    v3 = 0;
    v4 = 16;
  }
  v5 = v4 + 32 * *(int *)(a1 + 224);
  if (*(_DWORD *)(a1 + 108))
    v5 += 8;
  v6 = a1 + 240;
  for (i = *(_QWORD *)(a1 + 248); i != v6; i = *(_QWORD *)(i + 8))
    v5 += (int)((((*(_DWORD *)(i + 24) + 63) >> 3) & 0xFFFFFFF8) + 8);
  v8 = *(unsigned int *)(a1 + 328);
  if ((int)v8 <= 0)
    v9 = 0;
  else
    v9 = (16 * v8) | 8;
  v10 = v9 + v5;
  if (*(int *)(a1 + 360) >= 1)
    v10 += *(unsigned int *)(a1 + 368);
  v11 = v10 + *(unsigned int *)(a1 + 388);
  if (*(_BYTE *)(a1 + 392))
    v11 += 16;
  v12 = v11 + *(unsigned int *)(a1 + 428);
  v13 = (int8x8_t *)malloc_type_malloc(v12, 0x103316A2uLL);
  if (!v13)
    goto LABEL_73;
  v14 = v13;
  v15 = *(void **)(a1 + 440);
  if (v15)
    free(v15);
  *(_QWORD *)(a1 + 432) = v12;
  *(_QWORD *)(a1 + 440) = v14;
  v14->i32[0] = 134;
  v14->i8[4] = *(_DWORD *)(a1 + 120);
  v14->i8[5] = 0;
  v16 = *(_DWORD *)(a1 + 104);
  v14->i8[5] = v16;
  LOBYTE(v16) = v16 | ((*(_DWORD *)(a1 + 96) != 0) << 7);
  v14->i8[5] = v16;
  v14->i8[5] = v16 | ((*(_DWORD *)(a1 + 100) != 0) << 6);
  v14->i16[3] = bswap32(*(unsigned __int16 *)(a1 + 84)) >> 16;
  v14[1] = vrev32_s8(*(int8x8_t *)(a1 + 112));
  v17 = (uint64_t)&v14[2];
  if (*(_DWORD *)(a1 + 48))
  {
    lladdropt_fill(*(_QWORD *)(a1 + 56), v17);
    v17 += v3;
  }
  v18 = *(_DWORD *)(a1 + 108);
  if (v18)
  {
    *(_DWORD *)v17 = 261;
    *(_DWORD *)(v17 + 4) = bswap32(v18);
    v17 += 8;
  }
  for (j = *(uint64_t **)(a1 + 128); j != (uint64_t *)(a1 + 128); j = (uint64_t *)*j)
  {
    v46.tv_sec = 0;
    *(_QWORD *)&v46.tv_usec = 0;
    *(_WORD *)v17 = 1027;
    *(_BYTE *)(v17 + 2) = *((_DWORD *)j + 18);
    v20 = *((_DWORD *)j + 16);
    v21 = v20 != 0;
    if (v20)
      v22 = 0x80;
    else
      v22 = 0;
    *(_BYTE *)(v17 + 3) = v21 << 7;
    if (*((_DWORD *)j + 17))
      *(_BYTE *)(v17 + 3) = v22 | 0x40;
    if (j[3])
    {
      v23 = 0;
    }
    else
    {
      if ((j[5] || j[7]) && (gettimeofday(&v46, 0), (v24 = j[5]) != 0))
      {
        if (v24 <= v46.tv_sec)
          v23 = 0;
        else
          v23 = v24 - LODWORD(v46.tv_sec);
      }
      else
      {
        v23 = *((_DWORD *)j + 8);
      }
      if (!j[3])
      {
        v26 = j[7];
        if (v26)
        {
          if (v26 <= v46.tv_sec)
            v25 = 0;
          else
            v25 = v26 - LODWORD(v46.tv_sec);
        }
        else
        {
          v25 = *((_DWORD *)j + 12);
        }
        goto LABEL_42;
      }
    }
    v25 = 0;
LABEL_42:
    if (v23 < v25)
      v25 = v23;
    *(_DWORD *)(v17 + 4) = bswap32(v23);
    *(_QWORD *)(v17 + 8) = bswap32(v25);
    *(_OWORD *)(v17 + 16) = *((_OWORD *)j + 5);
    v17 += 32;
  }
  for (k = *(_QWORD *)(a1 + 248); k != v6; k = *(_QWORD *)(k + 8))
  {
    v28 = *(_DWORD *)(k + 24);
    *(_BYTE *)v17 = 24;
    *(_BYTE *)(v17 + 1) = ((v28 + 63) >> 6) + 1;
    *(_BYTE *)(v17 + 2) = v28;
    *(_BYTE *)(v17 + 3) = *(_DWORD *)(k + 20);
    *(_DWORD *)(v17 + 4) = bswap32(*(_DWORD *)(k + 16));
    v29 = (void *)(v17 + 8);
    v30 = ((v28 + 63) >> 3) & 0x7F8;
    memcpy(v29, (const void *)(k + 28), v30);
    v17 = (uint64_t)v29 + v30;
  }
  v31 = *(_DWORD *)(a1 + 328);
  if (v31 >= 1)
  {
    *(_BYTE *)v17 = 25;
    *(_BYTE *)(v17 + 1) = (2 * v31) | 1;
    *(_WORD *)(v17 + 2) = 0;
    *(_DWORD *)(v17 + 4) = bswap32(*(_DWORD *)(a1 + 332));
    v17 += 8;
    for (m = *(uint64_t **)(a1 + 296); m != (uint64_t *)(a1 + 296); m = (uint64_t *)*m)
    {
      *(_OWORD *)v17 = *((_OWORD *)m + 1);
      v17 += 16;
    }
  }
  if (*(int *)(a1 + 360) >= 1)
  {
    bzero((void *)v17, *(unsigned int *)(a1 + 368));
    *(_BYTE *)v17 = 31;
    v33 = *(_DWORD *)(a1 + 368);
    *(_BYTE *)(v17 + 1) = v33 >> 3;
    *(_WORD *)(v17 + 2) = 0;
    *(_DWORD *)(v17 + 4) = bswap32(*(_DWORD *)(a1 + 364));
    v34 = *(const char **)(a1 + 336);
    if (v34 != (const char *)(a1 + 336))
    {
      v35 = (char *)(v17 + 8);
      do
      {
        v35 += (int)encode_domain(v34 + 16, v35);
        v34 = *(const char **)v34;
      }
      while (v34 != (const char *)(a1 + 336));
      v33 = *(_DWORD *)(a1 + 368);
    }
    v17 += v33;
  }
  v36 = *(const void **)(a1 + 376);
  if (v36)
  {
    *(_BYTE *)v17 = 37;
    *(_BYTE *)(v17 + 1) = *(_DWORD *)(a1 + 388) >> 3;
    v37 = (void *)(v17 + 2);
    memmove(v37, v36, *(unsigned int *)(a1 + 384));
    v38 = *(unsigned int *)(a1 + 384);
    v17 = (uint64_t)v37 + v38;
    v39 = *(_DWORD *)(a1 + 388) - 2;
    v40 = (v39 - v38);
    if (v39 != (_DWORD)v38)
    {
      bzero((void *)v17, (v39 - v38));
      v17 += v40;
    }
  }
  if (*(_BYTE *)(a1 + 392))
  {
    v41 = v17 + 16;
    *(_WORD *)v17 = 550;
    *(_WORD *)(v17 + 2) = bswap32(*(unsigned __int16 *)(a1 + 394)) >> 16;
    v42 = *(unsigned __int8 *)(a1 + 393);
    v43 = (char *)(v17 + 4);
    memmove(v43, (const void *)(a1 + 396), v42 >> 3);
    if ((v42 >> 3) != 12)
      bzero(&v43[v42 >> 3], (12 - (v42 >> 3)));
  }
  else
  {
    v41 = v17;
  }
  v44 = *(_DWORD *)(a1 + 428);
  if (v44)
  {
    *(_BYTE *)v41 = 21;
    *(_BYTE *)(v41 + 1) = v44 >> 3;
    *(_BYTE *)(v41 + 2) = *(_BYTE *)(a1 + 413);
    *(_BYTE *)(v41 + 3) = *(_BYTE *)(a1 + 412);
    *(_WORD *)(v41 + 4) = bswap32(*(unsigned __int16 *)(a1 + 414)) >> 16;
    v45 = encode_domain(*(const char **)(a1 + 416), (char *)(v41 + 6));
    bzero((void *)(v41 + 6 + v45), (*(_BYTE *)(a1 + 428) - v45 - 6));
    v41 += *(unsigned int *)(a1 + 428);
  }
  if (*(_QWORD *)(a1 + 432) != v41 - *(_QWORD *)(a1 + 440))
  {
LABEL_73:
    rtadvdLog();
    exit(1);
  }
}

void delete_prefix(uint64_t a1)
{
  uint64_t v2;
  char v3[46];

  v2 = *(_QWORD *)(a1 + 16);
  remque((void *)a1);
  inet_ntop(30, (const void *)(a1 + 80), v3, 0x2Eu);
  rtadvdLog();
  if (*(_QWORD *)(a1 + 24))
    rtadvd_remove_timer((void **)(a1 + 24));
  free((void *)a1);
  --*(_DWORD *)(v2 + 224);
}

void invalidate_prefix(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char v5[46];

  if (*(_QWORD *)(a1 + 24))
  {
    rtadvdLog();
    exit(1);
  }
  v4 = 0;
  inet_ntop(30, (const void *)(a1 + 80), v5, 0x2Eu);
  rtadvdLog();
  v2 = rtadvd_add_timer((uint64_t)prefix_timeout, 0, a1, 0);
  *(_QWORD *)(a1 + 24) = v2;
  if (v2)
  {
    v3 = 7200;
    LODWORD(v4) = 0;
    rtadvd_set_timer((uint64_t)&v3, (uint64_t)v2);
  }
  else
  {
    rtadvdLog();
    delete_prefix(a1);
  }
}

uint64_t prefix_timeout(uint64_t a1)
{
  delete_prefix(a1);
  return 0;
}

void update_prefix(uint64_t a1)
{
  void **v1;
  char v2[46];

  v1 = (void **)(a1 + 24);
  if (!*(_QWORD *)(a1 + 24))
  {
    rtadvdLog();
    exit(1);
  }
  inet_ntop(30, (const void *)(a1 + 80), v2, 0x2Eu);
  rtadvdLog();
  rtadvd_remove_timer(v1);
}

void make_prefix(uint64_t a1, unsigned int a2, _OWORD *a3, char a4)
{
  _OWORD *v7;
  int v8;
  int v9;
  int v10;
  int *v11;
  char v12[16];
  __int128 v13;
  _OWORD v14[2];
  char v15[46];

  memset(v14, 0, sizeof(v14));
  *(_OWORD *)v12 = 0u;
  v13 = 0u;
  if (!if_indextoname(a2, v12)
    || (WORD2(v14[0]) = 7708,
        *(_OWORD *)((char *)v14 + 12) = *a3,
        BYTE1(v13) = a4,
        *(_QWORD *)((char *)&v13 + 4) = 0x93A8000278D00,
        BYTE12(v13) |= 3u,
        (v7 = malloc_type_malloc(0x60uLL, 0x1020040CF300BDFuLL)) == 0))
  {
    v11 = __error();
    strerror(*v11);
    rtadvdLog();
    exit(1);
  }
  v7[2] = 0u;
  v7[3] = 0u;
  *v7 = 0u;
  v7[1] = 0u;
  v7[5] = *(_OWORD *)((char *)v14 + 12);
  v8 = BYTE1(v13);
  v9 = DWORD2(v13);
  *((_DWORD *)v7 + 8) = DWORD1(v13);
  *((_DWORD *)v7 + 12) = v9;
  v10 = (BYTE12(v13) >> 1) & 1;
  *((_DWORD *)v7 + 16) = BYTE12(v13) & 1;
  *((_DWORD *)v7 + 17) = v10;
  *((_DWORD *)v7 + 18) = v8;
  *((_DWORD *)v7 + 19) = 3;
  *((_QWORD *)v7 + 2) = a1;
  insque(v7, (void *)(a1 + 128));
  inet_ntop(30, (char *)v14 + 12, v15, 0x2Eu);
  rtadvdLog();
  free(*(void **)(a1 + 440));
  *(_QWORD *)(a1 + 440) = 0;
  ++*(_DWORD *)(a1 + 224);
  make_packet(a1);
}

uint64_t encode_domain(const char *a1, char *a2)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char v7;
  char *v8;
  size_t v9;
  char *__stringp;

  v3 = strdup(a1);
  __stringp = v3;
  v4 = strsep(&__stringp, ".");
  v5 = a2;
  if (v4)
  {
    v6 = v4;
    v5 = a2;
    do
    {
      v7 = strlen(v6);
      if ((v7 & 0x3F) != 0)
      {
        *v5 = v7 & 0x3F;
        v8 = v5 + 1;
        v9 = v7 & 0x3F;
        memcpy(v8, v6, v9);
        v5 = &v8[v9];
      }
      v6 = strsep(&__stringp, ".");
    }
    while (v6);
  }
  *v5 = 0;
  free(v3);
  return ((_DWORD)v5 - (_DWORD)a2 + 1);
}

uint64_t rtadvd_dump_file(const char *a1)
{
  uint64_t i;
  unsigned __int16 *interface_entry;
  const char *v4;
  FILE *v5;
  char *v6;
  uint64_t v7;
  FILE *v8;
  char *v9;
  FILE *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  const char *v13;
  const char *v14;
  uint64_t *v15;
  char v16;
  __darwin_time_t tv_sec;
  FILE *v18;
  const char *v19;
  int v20;
  FILE *v21;
  const char *v22;
  size_t v23;
  __darwin_time_t v24;
  BOOL v25;
  __darwin_time_t v26;
  __darwin_time_t v27;
  __darwin_time_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  FILE *v35;
  const char *v36;
  timeval v38;
  char v39[46];

  rtadvdLog();
  fp = (uint64_t)fopen(a1, "w");
  if (!fp)
    return rtadvdLog();
  v38.tv_sec = 0;
  *(_QWORD *)&v38.tv_usec = 0;
  gettimeofday(&v38, 0);
  for (i = ralist; i; i = *(_QWORD *)i)
  {
    fprintf((FILE *)fp, "%s:\n", (const char *)(i + 64));
    interface_entry = get_interface_entry(*(_DWORD *)(i + 44));
    if (interface_entry)
    {
      v4 = "UP";
      if ((*((_DWORD *)interface_entry + 2) & 1) == 0)
        v4 = "DOWN";
      fprintf((FILE *)fp, "  Status: %s\n", v4);
      if (*(_QWORD *)(i + 24))
      {
        v5 = (FILE *)fp;
        v6 = ctime((const time_t *)(i + 24));
        fprintf(v5, "  Last RA sent: %s", v6);
      }
      v7 = *(_QWORD *)(i + 8);
      v8 = (FILE *)fp;
      if (v7)
      {
        v9 = ctime((const time_t *)(v7 + 24));
        fprintf(v8, "  Next RA will be sent: %s", v9);
      }
      else
      {
        fwrite("  RA timer is stopped", 0x15uLL, 1uLL, (FILE *)fp);
      }
      fprintf((FILE *)fp, "  waits: %d, initcount: %d\n", *(_DWORD *)(i + 40), *(_DWORD *)(i + 16));
      fprintf((FILE *)fp, "  statistics: RA(out/in/inconsistent): %llu/%llu/%llu, ", *(_QWORD *)(i + 448), *(_QWORD *)(i + 456), *(_QWORD *)(i + 464));
      fprintf((FILE *)fp, "RS(input): %llu\n", *(_QWORD *)(i + 472));
      if (*(_DWORD *)(i + 48))
      {
        v10 = (FILE *)fp;
        v11 = *(_QWORD *)(i + 56);
        if (*(unsigned __int8 *)(v11 + 6) >= 6u)
        {
          v12 = (unsigned __int8 *)(v11 + *(unsigned __int8 *)(v11 + 5));
          snprintf((char *)&ether_str_hbuf, 0x20uLL, "%x:%x:%x:%x:%x:%x", v12[8], v12[9], v12[10], v12[11], v12[12], v12[13]);
        }
        else
        {
          strcpy((char *)&ether_str_hbuf, "NONE");
        }
        fprintf(v10, "  Link-layer address: %s\n", (const char *)&ether_str_hbuf);
      }
      fprintf((FILE *)fp, "  MTU: %d\n", *(_DWORD *)(i + 80));
      fprintf((FILE *)fp, "  DefaultLifetime: %d, MaxAdvInterval: %d, MinAdvInterval: %d\n", *(unsigned __int16 *)(i + 84), *(_DWORD *)(i + 88), *(_DWORD *)(i + 92));
      v13 = "M";
      if (!*(_DWORD *)(i + 96))
        v13 = (const char *)&unk_10000A8BE;
      v14 = "O";
      if (!*(_DWORD *)(i + 100))
        v14 = (const char *)&unk_10000A8BE;
      fprintf((FILE *)fp, "  Flags: %s%s%s, ", v13, v14, (const char *)&unk_10000A8BE);
      fprintf((FILE *)fp, "Preference: %s, ", *(char **)((char *)rtpref_str + (*(_DWORD *)(i + 104) & 0x7F8)));
      fprintf((FILE *)fp, "MTU: %d\n", *(_DWORD *)(i + 108));
      fprintf((FILE *)fp, "  ReachableTime: %d, RetransTimer: %d, CurHopLimit: %d\n", *(_DWORD *)(i + 112), *(_DWORD *)(i + 116), *(_DWORD *)(i + 120));
      if (*(_QWORD *)(i + 232))
        fprintf((FILE *)fp, "  Clock skew: %ldsec\n", *(_QWORD *)(i + 232));
      v15 = *(uint64_t **)(i + 128);
      if (v15 != (uint64_t *)(i + 128))
      {
        v16 = 0;
        tv_sec = v38.tv_sec;
        while (1)
        {
          if ((v16 & 1) == 0)
            fwrite("  Prefixes:\n", 0xCuLL, 1uLL, (FILE *)fp);
          v18 = (FILE *)fp;
          v19 = inet_ntop(30, v15 + 10, v39, 0x2Eu);
          fprintf(v18, "    %s/%d(", v19, *((_DWORD *)v15 + 18));
          v20 = *((_DWORD *)v15 + 19);
          if (v20 == 3)
            break;
          if (v20 == 2)
          {
            v21 = (FILE *)fp;
            v22 = "CONFIG, ";
LABEL_33:
            v23 = 8;
LABEL_34:
            fwrite(v22, v23, 1uLL, v21);
            goto LABEL_35;
          }
          if (v20 == 1)
          {
            v21 = (FILE *)fp;
            v22 = "KERNEL, ";
            goto LABEL_33;
          }
LABEL_35:
          if (*((_DWORD *)v15 + 8) == -1)
            fwrite("vltime: infinity", 0x10uLL, 1uLL, (FILE *)fp);
          else
            fprintf((FILE *)fp, "vltime: %ld", *((unsigned int *)v15 + 8));
          v24 = v15[5];
          if (v24)
          {
            v25 = v24 <= tv_sec;
            v26 = v24 - tv_sec;
            if (v25)
              v26 = 0;
            fprintf((FILE *)fp, "(decr,expire %ld), ", v26);
          }
          else
          {
            fwrite(", ", 2uLL, 1uLL, (FILE *)fp);
          }
          if (*((_DWORD *)v15 + 12) == -1)
            fwrite("pltime: infinity", 0x10uLL, 1uLL, (FILE *)fp);
          else
            fprintf((FILE *)fp, "pltime: %ld", *((unsigned int *)v15 + 12));
          v27 = v15[7];
          if (v27)
          {
            v25 = v27 <= tv_sec;
            v28 = v27 - tv_sec;
            if (v25)
              v28 = 0;
            fprintf((FILE *)fp, "(decr,expire %ld), ", v28);
          }
          else
          {
            fwrite(", ", 2uLL, 1uLL, (FILE *)fp);
          }
          v29 = "L";
          if (!*((_DWORD *)v15 + 16))
            v29 = (const char *)&unk_10000A8BE;
          v30 = "A";
          if (!*((_DWORD *)v15 + 17))
            v30 = (const char *)&unk_10000A8BE;
          fprintf((FILE *)fp, "flags: %s%s%s", v29, v30, (const char *)&unk_10000A8BE);
          v31 = v15[3];
          if (v31)
          {
            v32 = rtadvd_timer_rest(v31);
            if (v32)
              fprintf((FILE *)fp, ", expire in: %ld", *v32);
          }
          v16 = 1;
          fwrite(")\n", 2uLL, 1uLL, (FILE *)fp);
          v15 = (uint64_t *)*v15;
          if (v15 == (uint64_t *)(i + 128))
            goto LABEL_61;
        }
        v21 = (FILE *)fp;
        v22 = "DYNAMIC, ";
        v23 = 9;
        goto LABEL_34;
      }
LABEL_61:
      v33 = *(_QWORD *)(i + 248);
      if (v33 != i + 240)
      {
        v34 = 0;
        do
        {
          if ((v34 & 1) == 0)
            fwrite("  Route Information:\n", 0x15uLL, 1uLL, (FILE *)fp);
          v35 = (FILE *)fp;
          v36 = inet_ntop(30, (const void *)(v33 + 28), v39, 0x2Eu);
          fprintf(v35, "    %s/%d (", v36, *(_DWORD *)(v33 + 24));
          fprintf((FILE *)fp, "preference: %s, ", *(char **)((char *)rtpref_str + (*(_DWORD *)(v33 + 20) & 0x7F8)));
          if (*(_DWORD *)(v33 + 16) == -1)
            fwrite("lifetime: infinity", 0x12uLL, 1uLL, (FILE *)fp);
          else
            fprintf((FILE *)fp, "lifetime: %ld", *(unsigned int *)(v33 + 16));
          v34 = 1;
          fwrite(")\n", 2uLL, 1uLL, (FILE *)fp);
          v33 = *(_QWORD *)(v33 + 8);
        }
        while (v33 != i + 240);
      }
    }
    else
    {
      rtadvdLog();
    }
  }
  return fclose((FILE *)fp);
}

void *if_nametosdl(const char *a1)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  unsigned __int8 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  size_t v14;
  void *v15;
  void *v16;
  size_t size;
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  int v22[4];
  uint64_t v23;

  *(_OWORD *)v22 = xmmword_10000BE80;
  v23 = 3;
  size = 0;
  if (sysctl(v22, 6u, 0, &size, 0, 0) < 0)
    return 0;
  v2 = (unsigned __int16 *)malloc_type_malloc(size, 0x43F054D0uLL);
  if (!v2)
    return 0;
  v3 = v2;
  if (sysctl(v22, 6u, v2, &size, 0, 0) < 0)
  {
LABEL_32:
    free(v3);
    return 0;
  }
  if ((uint64_t)size < 1)
  {
    if (size)
      goto LABEL_30;
    goto LABEL_32;
  }
  v4 = 0;
  v5 = (unsigned __int16 *)((char *)v3 + size);
  v20 = 0u;
  v21 = 0u;
  memset(v19, 0, sizeof(v19));
  v6 = v3;
  while (1)
  {
    if (*((_BYTE *)v6 + 3) != 14)
      goto LABEL_24;
    v7 = 0;
    v8 = v6 + 56;
    v9 = *((_DWORD *)v6 + 1);
    do
    {
      if (((v9 >> v7) & 1) != 0)
      {
        *((_QWORD *)v19 + v7) = v8;
        v10 = *v8;
        if ((v10 & 3) != 0)
          v11 = (v10 | 3) + 1;
        else
          v11 = *v8;
        if (*v8)
          v12 = v11;
        else
          v12 = 4;
        v8 += v12;
      }
      else
      {
        *((_QWORD *)v19 + v7) = 0;
      }
      ++v7;
    }
    while (v7 != 8);
    v13 = (unsigned __int8 *)v20;
    if (!(_QWORD)v20 || *(_BYTE *)(v20 + 1) != 18)
      goto LABEL_24;
    v14 = strlen(a1);
    if (v14 != *(unsigned __int8 *)(v20 + 5))
    {
      v4 = (unsigned __int8 *)v20;
      goto LABEL_24;
    }
    v4 = (unsigned __int8 *)v20;
    if (!strncmp((const char *)(v20 + 8), a1, v14))
      break;
LABEL_24:
    v6 = (unsigned __int16 *)((char *)v6 + *v6);
    if (v6 >= v5)
      goto LABEL_25;
  }
  v4 = v13;
LABEL_25:
  if (v6 == v5)
    goto LABEL_32;
  if (!v4)
  {
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  v15 = malloc_type_malloc(*v4, 0x4D435540uLL);
  v16 = v15;
  if (v15)
    memcpy(v15, v4, *v4);
LABEL_31:
  free(v3);
  return v16;
}

uint64_t if_getmtu(const char *a1)
{
  ifaddrs **v2;
  ifaddrs *v3;
  uint64_t ifa_name_low;
  int v5;
  int v6;
  ifaddrs *v8;
  __int128 v9;
  __int128 v10;

  v8 = 0;
  if (getifaddrs(&v8) < 0)
    return 0;
  v2 = &v8;
  do
  {
    v2 = (ifaddrs **)*v2;
    if (!v2)
      goto LABEL_8;
  }
  while (strcmp((const char *)v2[1], a1));
  v3 = v2[6];
  if (!v3)
  {
LABEL_8:
    freeifaddrs(v8);
    goto LABEL_9;
  }
  ifa_name_low = LODWORD(v3->ifa_name);
  freeifaddrs(v8);
  if ((_DWORD)ifa_name_low)
    return ifa_name_low;
LABEL_9:
  v9 = 0u;
  v10 = 0u;
  v5 = socket(30, 2, 0);
  if (v5 < 0)
    return 0;
  v6 = v5;
  BYTE1(v10) = 30;
  __strlcpy_chk(&v9, a1, 16, 16);
  if (ioctl(v6, 0xC0206933uLL, &v9) < 0)
  {
    close(v6);
    return 0;
  }
  close(v6);
  return v10;
}

uint64_t if_getflags(unsigned int a1, int a2)
{
  int v4;
  int v5;
  int *v7;
  char v8[16];
  __int128 v9;

  *(_OWORD *)v8 = 0u;
  v9 = 0u;
  v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    v7 = __error();
    strerror(*v7);
    rtadvdLog();
  }
  else
  {
    v5 = v4;
    if_indextoname(a1, v8);
    if ((ioctl(v5, 0xC0206911uLL, v8) & 0x80000000) == 0)
    {
      close(v5);
      return (__int16)v9;
    }
    rtadvdLog();
    close(v5);
  }
  return a2 & 0xFFFFFFFE;
}

uint64_t lladdropt_length(uint64_t a1)
{
  return 8 * (*(_BYTE *)(a1 + 4) == 6);
}

uint64_t lladdropt_fill(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;

  *(_BYTE *)a2 = 1;
  if (*(_BYTE *)(result + 4) != 6)
  {
    rtadvdLog();
    exit(1);
  }
  *(_BYTE *)(a2 + 1) = 1;
  v2 = result + *(unsigned __int8 *)(result + 5);
  v3 = *(_DWORD *)(v2 + 8);
  *(_WORD *)(a2 + 6) = *(_WORD *)(v2 + 12);
  *(_DWORD *)(a2 + 2) = v3;
  return result;
}

unsigned __int16 *get_next_msg(unsigned __int16 *a1, unint64_t a2, int a3, _QWORD *a4, unsigned int a5)
{
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BYTE *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  *a4 = 0;
  if ((unint64_t)a1 < a2)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = a1;
    while (1)
    {
      v6 = *v5;
      if (!*v5)
      {
        rtadvdLog();
        return v5;
      }
      v7 = *((unsigned __int8 *)v5 + 3);
      if (((a5 >> v7) & 1) != 0 && v7 <= 0xE)
      {
        if (((1 << v7) & 0x16) != 0)
        {
          v8 = 0;
          v9 = v5 + 46;
          v10 = *((_DWORD *)v5 + 3);
          do
          {
            if (((v10 >> v8) & 1) != 0)
            {
              *((_QWORD *)&v24 + v8) = v9;
              v11 = *v9;
              if ((v11 & 3) != 0)
                v12 = (v11 | 3) + 1;
              else
                v12 = *v9;
              if (*v9)
                v13 = v12;
              else
                v13 = 4;
              v9 += v13;
            }
            else
            {
              *((_QWORD *)&v24 + v8) = 0;
            }
            ++v8;
          }
          while (v8 != 8);
          if ((_QWORD)v24)
          {
            if (*(_BYTE *)(v24 + 1) == 30)
            {
              v14 = *(unsigned __int8 *)(v24 + 8);
              if (v14 != 255
                && (v14 != 254 || (*(_BYTE *)(v24 + 9) & 0xC0) != 0x80)
                && *((_QWORD *)&v24 + 1)
                && *(_BYTE *)(*((_QWORD *)&v24 + 1) + 1) == 18
                && (!a3 || *(unsigned __int16 *)(*((_QWORD *)&v24 + 1) + 2) == a3)
                && (_QWORD)v25)
              {
                goto LABEL_56;
              }
            }
          }
        }
        else if (((1 << v7) & 0x3000) != 0)
        {
          v15 = 0;
          v16 = v5 + 10;
          v17 = *((_DWORD *)v5 + 1);
          do
          {
            if (((v17 >> v15) & 1) != 0)
            {
              *((_QWORD *)&v24 + v15) = v16;
              v18 = *v16;
              if ((v18 & 3) != 0)
                v19 = (v18 | 3) + 1;
              else
                v19 = *v16;
              if (*v16)
                v20 = v19;
              else
                v20 = 4;
              v16 += v20;
            }
            else
            {
              *((_QWORD *)&v24 + v15) = 0;
            }
            ++v15;
          }
          while (v15 != 8);
          if (*((_QWORD *)&v26 + 1))
          {
            v21 = *(unsigned __int8 *)(*((_QWORD *)&v26 + 1) + 1);
            if (v21 == 2
              || v21 == 30
              && (v22 = *(unsigned __int8 *)(*((_QWORD *)&v26 + 1) + 8), v22 != 255)
              && (v22 != 254 || (*(_BYTE *)(*((_QWORD *)&v26 + 1) + 9) & 0xC0) != 0x80))
            {
              if (!a3 || v5[6] == a3)
              {
LABEL_56:
                *a4 = v6;
                return v5;
              }
            }
          }
        }
        else if (v7 == 14)
        {
          goto LABEL_56;
        }
      }
      v5 = (unsigned __int16 *)((char *)v5 + v6);
      if ((unint64_t)v5 >= a2)
        return v5;
    }
  }
  return a1;
}

uint64_t get_addr(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[4];

  v1 = 0;
  memset(v8, 0, sizeof(v8));
  v2 = (_BYTE *)(a1 + 92);
  v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if (((v3 >> v1) & 1) != 0)
    {
      *((_QWORD *)v8 + v1) = v2;
      v4 = *v2;
      if ((v4 & 3) != 0)
        v5 = (v4 | 3) + 1;
      else
        v5 = *v2;
      if (*v2)
        v6 = v5;
      else
        v6 = 4;
      v2 += v6;
    }
    else
    {
      *((_QWORD *)v8 + v1) = 0;
    }
    ++v1;
  }
  while (v1 != 8);
  return *(_QWORD *)&v8[0] + 8;
}

uint64_t get_rtm_ifindex(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[4];

  v1 = 0;
  memset(v8, 0, sizeof(v8));
  v2 = (_BYTE *)(a1 + 92);
  v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if (((v3 >> v1) & 1) != 0)
    {
      *((_QWORD *)v8 + v1) = v2;
      v4 = *v2;
      if ((v4 & 3) != 0)
        v5 = (v4 | 3) + 1;
      else
        v5 = *v2;
      if (*v2)
        v6 = v5;
      else
        v6 = 4;
      v2 += v6;
    }
    else
    {
      *((_QWORD *)v8 + v1) = 0;
    }
    ++v1;
  }
  while (v1 != 8);
  return *(unsigned __int16 *)(*((_QWORD *)&v8[0] + 1) + 2);
}

uint64_t get_ifm_ifindex(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 12);
}

uint64_t get_ifm_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t get_prefixlen(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v1 = 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (_BYTE *)(a1 + 92);
  v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if (((v3 >> v1) & 1) != 0)
    {
      *((_QWORD *)&v8 + v1) = v2;
      v4 = *v2;
      if ((v4 & 3) != 0)
        v5 = (v4 | 3) + 1;
      else
        v5 = *v2;
      if (*v2)
        v6 = v5;
      else
        v6 = 4;
      v2 += v6;
    }
    else
    {
      *((_QWORD *)&v8 + v1) = 0;
    }
    ++v1;
  }
  while (v1 != 8);
  return prefixlen((_BYTE *)(v9 + 8), v9 + *(unsigned __int8 *)v9);
}

uint64_t prefixlen(_BYTE *a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  if ((unint64_t)a1 >= a2)
    return 0;
  v2 = 0;
  v3 = a2 - (_QWORD)a1;
  do
  {
    v4 = *a1;
    v5 = 0xFFFFFFFFLL;
    if (v4 > 0xDF)
    {
      switch(*a1)
      {
        case 0xF8:
          v2 = (v2 + 5);
          break;
        case 0xF9:
        case 0xFA:
        case 0xFB:
        case 0xFD:
          return v5;
        case 0xFC:
          v2 = (v2 + 6);
          break;
        case 0xFE:
          v2 = (v2 + 7);
          break;
        case 0xFF:
          v2 = (v2 + 8);
          break;
        default:
          if (v4 == 224)
          {
            v2 = (v2 + 3);
          }
          else
          {
            if (v4 != 240)
              return v5;
            v2 = (v2 + 4);
          }
          break;
      }
    }
    else if (*a1)
    {
      if (v4 == 128)
      {
        v2 = (v2 + 1);
      }
      else
      {
        if (v4 != 192)
          return v5;
        v2 = (v2 + 2);
      }
    }
    ++a1;
    v5 = v2;
    --v3;
  }
  while (v3);
  return v5;
}

uint64_t rtmsg_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 3);
}

uint64_t rtmsg_len(unsigned __int16 *a1)
{
  return *a1;
}

unsigned __int16 *get_interface_entry(int a1)
{
  _UNKNOWN **v1;
  unsigned __int16 *v2;

  v1 = &ifilist;
  while (1)
  {
    v1 = (_UNKNOWN **)*v1;
    if (!v1)
      break;
    v2 = (unsigned __int16 *)v1[2];
    if (v2[6] == a1)
      return v2;
  }
  return 0;
}

uint64_t init_iflist()
{
  uint64_t *i;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  uint64_t result;
  unint64_t v5;
  unsigned __int16 *v6;
  _UNKNOWN **v7;
  uint64_t *v8;
  uint64_t v9;
  int *v10;
  int v11[4];
  uint64_t v12;

  for (i = (uint64_t *)ifilist; ifilist; i = (uint64_t *)ifilist)
  {
    v1 = *i;
    v2 = (_QWORD *)i[1];
    if (*i)
    {
      *(_QWORD *)(v1 + 8) = v2;
      v2 = (_QWORD *)i[1];
    }
    else
    {
      off_100010010 = (_UNKNOWN **)i[1];
    }
    *v2 = v1;
    free(i);
  }
  if (ifblock)
  {
    free((void *)ifblock);
    ifblock_size = 0;
  }
  *(_OWORD *)v11 = xmmword_10000BEA0;
  v12 = 3;
  if (sysctl(v11, 6u, 0, (size_t *)&ifblock_size, 0, 0) < 0
    || (v3 = malloc_type_malloc(ifblock_size, 0x4FE208D4uLL), (ifblock = (uint64_t)v3) == 0)
    || (result = sysctl(v11, 6u, v3, (size_t *)&ifblock_size, 0, 0), (result & 0x80000000) != 0))
  {
LABEL_30:
    rtadvdLog();
    exit(1);
  }
  if (ifblock_size >= 1)
  {
    v5 = ifblock + ifblock_size;
    v6 = (unsigned __int16 *)ifblock;
LABEL_13:
    while (*v6)
    {
      if (*((_BYTE *)v6 + 3) != 14)
        goto LABEL_30;
      v7 = &ifilist;
      while (1)
      {
        v7 = (_UNKNOWN **)*v7;
        if (!v7)
          break;
        if (*((unsigned __int16 *)v7[2] + 6) == v6[6])
        {
          rtadvdLog();
          goto LABEL_13;
        }
      }
      result = (uint64_t)malloc_type_malloc(0x18uLL, 0xA0040A8488062uLL);
      if (!result)
      {
        v10 = __error();
        strerror(*v10);
        goto LABEL_30;
      }
      v8 = (uint64_t *)off_100010010;
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = v8;
      *(_QWORD *)(result + 16) = v6;
      *v8 = result;
      off_100010010 = (_UNKNOWN **)result;
      v9 = *v6;
      do
      {
        v6 = (unsigned __int16 *)((char *)v6 + v9);
        if ((unint64_t)v6 >= v5)
          break;
        v9 = *v6;
        if (!*v6)
          return rtadvdLog();
      }
      while (*((_BYTE *)v6 + 3) == 12);
      if ((unint64_t)v6 >= v5)
        return result;
    }
    return rtadvdLog();
  }
  return result;
}

_DWORD *rr_input(unsigned int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, void *a5)
{
  const void *v8;
  const char *v9;
  _DWORD *result;
  int v11;
  unint64_t v13;
  int v14;
  char v15;
  int v16;
  BOOL v17;
  BOOL v18;
  unint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  _OWORD *v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  int v30;
  int v31;
  int v32;
  unsigned __int16 *interface_entry;
  unsigned __int8 *v34;
  int *v35;
  int v37;
  uint64_t *v38;
  uint64_t i;
  uint64_t *v40;
  char v41;
  __darwin_time_t v42;
  __darwin_time_t v43;
  uint64_t v44;
  int *v45;
  int *v46;
  int *v47;
  char *v48;
  const char *v49;
  char *v50;
  _OWORD *v51;
  unint64_t v52;
  unsigned __int8 *v53;
  void *v54;
  timeval v55;
  char v56[16];
  char v57[46];
  char v58[46];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _OWORD v62[3];

  v54 = a5;
  v8 = (const void *)(a4 + 8);
  v9 = inet_ntop(30, (const void *)(a4 + 8), v57, 0x2Eu);
  v49 = inet_ntop(30, &v54, v58, 0x2Eu);
  v50 = if_indextoname(*((_DWORD *)a3 + 4), v56);
  v48 = (char *)v9;
  result = (_DWORD *)rtadvdLog();
  if (a1 <= 0xF)
  {
    inet_ntop(30, v8, v57, 0x2Eu);
    inet_ntop(30, &v54, v58, 0x2Eu);
    if_indextoname(*((_DWORD *)a3 + 4), v56);
    return (_DWORD *)rtadvdLog();
  }
  if (*a3 == 255
    && ((_QWORD)in6a_site_allrouters != *(_QWORD *)a3 || *((_QWORD *)&in6a_site_allrouters + 1) != *((_QWORD *)a3 + 1)))
  {
    inet_ntop(30, &v54, v57, 0x2Eu);
    inet_ntop(30, v8, v58, 0x2Eu);
    if_indextoname(*((_DWORD *)a3 + 4), v56);
    return (_DWORD *)rtadvdLog();
  }
  v11 = *(unsigned __int8 *)(a2 + 1);
  if (v11 == 255 || v11 == 1)
    return result;
  if (*(_BYTE *)(a2 + 1))
    return (_DWORD *)rtadvdLog();
  if (a1 <= 0x27)
    goto LABEL_105;
  if (*(unsigned __int8 *)v54 == 255)
  {
    v15 = *((_BYTE *)v54 + 1);
    v16 = v15 & 0xF;
    v17 = (v15 & 0xF0) != 0x30 && v16 == 2;
    v18 = v17;
    if (v16 != 5 && !v18)
    {
      inet_ntop(30, v54, (char *)&v59, 0x2Eu);
      goto LABEL_105;
    }
  }
  v13 = *(unsigned int *)(a2 + 4);
  if (rro > v13)
  {
    inet_ntop(30, v8, (char *)&v59, 0x2Eu);
LABEL_105:
    rtadvdLog();
    return (_DWORD *)rtadvdLog();
  }
  if (rro != v13)
  {
    xmmword_1000100E0 = 0u;
    unk_1000100F0 = 0u;
    xmmword_1000100C0 = 0u;
    *(_OWORD *)algn_1000100D0 = 0u;
LABEL_35:
    rro = v13;
    goto LABEL_36;
  }
  v14 = *(char *)(a2 + 9);
  if (v14 < 0
    || (*(uint64_t *)((char *)&rro + (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0x38) + 8) & (1 << *(_BYTE *)(a2 + 8))) == 0)
  {
    goto LABEL_35;
  }
  if ((v14 & 0x40) != 0)
  {
    v48 = (char *)*(unsigned __int8 *)(a2 + 8);
    v49 = inet_ntop(30, v8, (char *)&v59, 0x2Eu);
    result = (_DWORD *)rtadvdLog();
  }
LABEL_36:
  if ((*(_BYTE *)(a2 + 9) & 0xC0) != 0x80)
  {
    v19 = a2 + (int)a1;
    v20 = (unsigned __int8 *)(a2 + 16);
    result = (_DWORD *)init_iflist();
    if (a2 + 16 >= v19)
    {
LABEL_104:
      *(uint64_t *)((char *)&rro + (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0x38) + 8) |= 1 << *(_BYTE *)(a2 + 8);
      return result;
    }
    v21 = a1 - 16;
    v22 = v62;
    while (1)
    {
      if (v21 < 0x18)
        goto LABEL_105;
      v23 = v20[1];
      v24 = 8 * v20[1];
      v25 = v21 - 8 * v23;
      if ((int)v21 < (int)(8 * v23))
        goto LABEL_105;
      if (v23 < 3 || (((_BYTE)v23 + 1) & 3) != 0)
      {
        v48 = (char *)v20[1];
LABEL_46:
        rtadvdLog();
        goto LABEL_47;
      }
      if (*v20 - 1 >= 3)
      {
        v48 = (char *)*v20;
        goto LABEL_46;
      }
      v27 = v20[3];
      if (v27 >= 0x81)
      {
        v48 = (char *)v20[3];
        goto LABEL_46;
      }
      v28 = &v20[v24];
      v29 = v20 + 24;
      if (v20 + 24 < &v20[v24])
      {
        while (1)
        {
          v30 = *v29;
          v31 = v29[1];
          if ((v31 + v30) >= 0x81)
            break;
          v29 += 32;
          if (v29 >= v28)
            goto LABEL_57;
        }
        v49 = (const char *)v29[1];
        v50 = (char *)(v31 + v30);
        v48 = (char *)*v29;
        rtadvdLog();
        goto LABEL_47;
      }
LABEL_57:
      v53 = v20 + 24;
      if (s == -1)
      {
        s = socket(30, 2, 0);
        if (s < 0)
        {
          v47 = __error();
          strerror(*v47);
          rtadvdLog();
          exit(1);
        }
        LOBYTE(v27) = v20[3];
      }
      v51 = v22;
      v52 = v19;
      v61 = 0u;
      memset(v62, 0, sizeof(v62));
      v59 = 0u;
      v60 = 0u;
      LOBYTE(v60) = 1;
      BYTE1(v60) = v27;
      WORD1(v60) = *((_WORD *)v20 + 2);
      WORD4(v61) = 7708;
      *v22 = *(_OWORD *)(v20 + 8);
      if (if_indextoname(1u, (char *)&v59))
        break;
LABEL_99:
      result = __error();
      if (*result == 6 || (result = __error(), !*result))
      {
        v22 = v51;
        v19 = v52;
        goto LABEL_48;
      }
      v46 = __error();
      v48 = strerror(*v46);
      rtadvdLog();
      v22 = v51;
      v19 = v52;
LABEL_47:
      result = (_DWORD *)rtadvdLog();
      v24 = v24;
LABEL_48:
      v20 += v24;
      v21 = v25;
      if ((unint64_t)v20 >= v19)
        goto LABEL_104;
    }
    v32 = 1;
    while (1)
    {
      interface_entry = get_interface_entry(v32);
      if (!interface_entry)
        goto LABEL_92;
      if ((*(_BYTE *)(a2 + 9) & 0x20) != 0 || (interface_entry[4] & 1) != 0)
      {
        v34 = v20 + 24;
        if (v53 != v28)
        {
          if (v53 < v28)
          {
            do
            {
              WORD2(v60) = *(_WORD *)v34;
              BYTE6(v60) = BYTE6(v60) & 0xFC | (v34[2] >> 7) | (v34[2] >> 5) & 2;
              *((int8x8_t *)&v60 + 1) = vrev32_s8(*(int8x8_t *)(v34 + 4));
              LOBYTE(v61) = v61 & 0xFC | (v34[3] >> 7) | (v34[3] >> 5) & 2;
              BYTE4(v61) = BYTE4(v61) & 0xFC | ((*((_DWORD *)v34 + 3) & 0x80) != 0) | (*((_DWORD *)v34 + 3) >> 5) & 2;
              WORD2(v62[1]) = 7708;
              *(_OWORD *)((char *)&v62[1] + 12) = *((_OWORD *)v34 + 1);
              if (ioctl(s, rrcmd2pco[*v20], &v59) < 0 && *__error() != 49)
              {
                v35 = __error();
                v48 = strerror(*v35);
                rtadvdLog();
              }
              if (*v20 == 2
                && *((_QWORD *)v20 + 1) == *((_QWORD *)v34 + 2)
                && *((_QWORD *)v20 + 2) == *((_QWORD *)v34 + 3))
              {
                v37 = v20[3];
                if (v37 == *v34 && v37 == v34[1])
                {
                  v38 = if_indextorainfo(v32);
                  if (v38)
                  {
                    v40 = v38 + 16;
                    for (i = v38[16]; (uint64_t *)i != v40; i = *(_QWORD *)i)
                    {
                      v55.tv_sec = 0;
                      *(_QWORD *)&v55.tv_usec = 0;
                      if (prefix_match((unsigned __int8 *)(i + 80), *(_DWORD *)(i + 72), v20 + 8, v20[3]))
                      {
                        *(_DWORD *)(i + 32) = bswap32(*((_DWORD *)v34 + 1));
                        *(_DWORD *)(i + 48) = bswap32(*((_DWORD *)v34 + 2));
                        v41 = BYTE4(v61);
                        if ((BYTE4(v61) & 1) != 0)
                        {
                          gettimeofday(&v55, 0);
                          v42 = v55.tv_sec + *(unsigned int *)(i + 32);
                          v41 = BYTE4(v61);
                        }
                        else
                        {
                          v42 = 0;
                        }
                        *(_QWORD *)(i + 40) = v42;
                        if ((v41 & 2) != 0)
                        {
                          gettimeofday(&v55, 0);
                          v43 = v55.tv_sec + *(unsigned int *)(i + 48);
                        }
                        else
                        {
                          v43 = 0;
                        }
                        *(_QWORD *)(i + 56) = v43;
                      }
                    }
                  }
                }
              }
              v34 += 32;
            }
            while (v34 < v28);
          }
          goto LABEL_93;
        }
        v44 = *v20;
        if (v44 != 1)
        {
          WORD2(v60) = 0;
          BYTE6(v60) &= 0xFCu;
          WORD2(v62[1]) = 0;
          *((_QWORD *)&v60 + 1) = 0;
          *(_QWORD *)&v61 = 0;
          *(in6_addr *)((char *)&v62[1] + 12) = in6addr_any;
          if (ioctl(s, rrcmd2pco[v44], &v59, v48, v49, v50) < 0 && *__error() != 49)
            break;
        }
      }
LABEL_93:
      if (!if_indextoname(++v32, (char *)&v59))
        goto LABEL_99;
    }
    v45 = __error();
    v48 = strerror(*v45);
LABEL_92:
    rtadvdLog();
    goto LABEL_93;
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v5;
  int v6;
  int v7;
  FILE *v8;
  const char *v9;
  size_t v10;
  unsigned __int8 **v11;
  unsigned int v12;
  int v13;
  unsigned __int8 *v14;
  const char *v16;
  uint64_t v17;
  int v18;
  int *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  unint64_t v24;
  size_t v25;
  char *v26;
  char *v27;
  int v28;
  unint64_t v29;
  int *v30;
  int *v31;
  int v32;
  size_t v33;
  fd_set *v34;
  timeval *v35;
  int v36;
  unint64_t v37;
  ssize_t v38;
  unsigned int v39;
  unsigned __int16 *v40;
  char *v41;
  unsigned __int16 *next_msg;
  uint64_t v43;
  int v44;
  int v45;
  unsigned int rtm_ifindex;
  uint64_t *v47;
  unsigned __int16 *interface_entry;
  unsigned __int16 *v49;
  int v50;
  int ifm_flags;
  unsigned __int8 *addr;
  int v53;
  int v54;
  char *v55;
  int prefixlen;
  char v57;
  uint64_t *v58;
  uint64_t *prefix;
  int *v60;
  int v61;
  unsigned int v62;
  unsigned int *v63;
  unsigned int *v64;
  unsigned int v65;
  _DWORD *v66;
  unsigned int v67;
  unsigned __int16 *v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  uint64_t *v72;
  char *v73;
  __int128 v74;
  int v75;
  uint64_t *v76;
  int v77;
  int v78;
  BOOL v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  char v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  unsigned int v88;
  int v89;
  unsigned int v90;
  int v91;
  _QWORD *v92;
  _QWORD *v93;
  uint64_t v94;
  _QWORD *v95;
  const char *v97;
  int v98;
  int v99;
  size_t v100;
  char *v101;
  fd_set *__dst;
  int v103;
  char v104[16];
  void *__s1[2];
  __int128 v106;
  void *v107[2];
  uint64_t v108;
  in6_addr v109;
  char v110[16];
  __int128 v111;
  unsigned int v112;

  v5 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            v6 = getopt(argc, (char *const *)argv, "c:dDF:fMp:Rs");
            if (v6 <= 98)
              break;
            if (v6 <= 101)
            {
              if (v6 == 99)
              {
                conffile = (uint64_t)optarg;
              }
              else if (v6 == 100)
              {
                dflag = 1;
              }
            }
            else
            {
              switch(v6)
              {
                case 'f':
                  v5 = 1;
                  break;
                case 'p':
                  pidfilename = optarg;
                  break;
                case 's':
                  sflag = 1;
                  break;
              }
            }
          }
          if (v6 <= 76)
            break;
          if (v6 == 77)
          {
            mcastif = (uint64_t)optarg;
          }
          else if (v6 == 82)
          {
            fwrite("rtadvd: the -R option is currently ignored.\n", 0x2CuLL, 1uLL, __stderrp);
          }
        }
        if (v6 != 68)
          break;
        dflag = 2;
      }
      if (v6 != 70)
        break;
      dumpfilename = optarg;
    }
  }
  while (v6 != -1);
  v7 = optind;
  if (argc == optind)
  {
    v8 = __stderrp;
    v9 = "usage: rtadvd [-dDfMRs] [-c conffile] [-F dumpfile] [-p pidfile] interfaces...\n";
    v10 = 79;
LABEL_34:
    fwrite(v9, v10, 1uLL, v8);
    goto LABEL_35;
  }
  v11 = (unsigned __int8 **)&argv[optind];
  rtadvd_timer_init();
  v12 = time(0);
  srandom(v12);
  init_iflist();
  v13 = v7 - argc;
  do
  {
    v14 = *v11++;
    getconfig(v14);
  }
  while (!__CFADD__(v13++, 1));
  if (inet_pton(30, "ff02::1", &unk_100010028) != 1)
  {
    v8 = __stderrp;
    v9 = "fatal: inet_pton failed\n";
    v10 = 24;
    goto LABEL_34;
  }
  v103 = 0;
  pfh = pidfile_open(pidfilename, 384, &v103);
  if (!pfh)
  {
    if (*__error() == 17)
    {
      v16 = getprogname();
      errx(1, "%s already running, pid: %d", v16, v103);
    }
    v97 = "main";
    rtadvdLog();
  }
  if (!v5)
    daemon(1, 0);
  v17 = ralist;
  rcvcmsgbuf = (uint64_t)malloc_type_malloc(0x30uLL, 0xA4631015uLL);
  if (!rcvcmsgbuf || (sndcmsgbuf = (uint64_t)malloc_type_malloc(0x30uLL, 0xC3901A40uLL)) == 0)
  {
LABEL_64:
    rtadvdLog();
LABEL_35:
    exit(1);
  }
  *(_OWORD *)v104 = 0u;
  *(_OWORD *)__s1 = 0u;
  v111 = 0uLL;
  v112 = 0;
  v18 = socket(30, 3, 58);
  sock = v18;
  if (v18 < 0)
    goto LABEL_43;
  setsockopt(v18, 0xFFFF, 4230, &so_traffic_class, 4u);
  *(_DWORD *)v110 = 1;
  if (setsockopt(sock, 41, 61, v110, 4u) < 0)
    goto LABEL_43;
  *(_DWORD *)v110 = 1;
  if (setsockopt(sock, 41, 37, v110, 4u) < 0)
    goto LABEL_43;
  *(_DWORD *)v110 = 1;
  if (setsockopt(sock, 41, 62, v110, 4u) < 0)
    goto LABEL_43;
  *(_OWORD *)v104 = 0u;
  *(_OWORD *)__s1 = 0u;
  v20 = accept_rr ? 1120 : 96;
  LODWORD(__s1[0]) = v20;
  if (setsockopt(sock, 58, 18, v104, 0x20u) < 0)
  {
LABEL_43:
    v19 = __error();
    strerror(*v19);
    goto LABEL_64;
  }
  if (inet_pton(30, "ff02::2", &v111) != 1)
    goto LABEL_64;
  for (; v17; v17 = *(_QWORD *)v17)
  {
    v112 = *(_DWORD *)(v17 + 44);
    if (setsockopt(sock, 41, 12, &v111, 0x14u) < 0)
      goto LABEL_43;
  }
  if (accept_rr)
  {
    if (inet_pton(30, "ff05::2", &in6a_site_allrouters) != 1)
      goto LABEL_64;
    v111 = in6a_site_allrouters;
    if (mcastif)
    {
      v112 = if_nametoindex((const char *)mcastif);
      if (!v112)
        goto LABEL_64;
    }
    else
    {
      v112 = *(_DWORD *)(ralist + 44);
    }
    if (setsockopt(sock, 41, 12, &v111, 0x14u) < 0)
      goto LABEL_43;
  }
  rcviov = (uint64_t)&sock_open_answer;
  unk_1000107F0 = 1500;
  rcvmhdr = (uint64_t)&rcvfrom;
  dword_100010810 = 28;
  qword_100010818 = (uint64_t)&rcviov;
  dword_100010820 = 1;
  qword_100010828 = rcvcmsgbuf;
  dword_100010860 = 28;
  dword_100010830 = 48;
  qword_100010868 = (uint64_t)&sndiov;
  dword_100010870 = 1;
  qword_100010878 = sndcmsgbuf;
  dword_100010880 = 48;
  getpid();
  pidfile_write(pfh);
  v21 = sock;
  if (sflag)
  {
    rtsock = -1;
  }
  else
  {
    v22 = socket(17, 3, 0);
    rtsock = v22;
    if (v22 < 0)
      goto LABEL_43;
    if (v22 > sock)
      v21 = v22;
  }
  v23 = v21 + 1;
  v24 = (unint64_t)(v21 + 1) >> 5;
  if (((v21 + 1) & 0x1FLL) != 0)
    LODWORD(v24) = v24 + 1;
  v25 = 4 * (int)v24;
  v26 = (char *)malloc_type_malloc(v25, 0x971F7184uLL);
  if (!v26 || (v27 = v26, v99 = v23, (__dst = (fd_set *)malloc_type_malloc(v25, 0x529A6B8DuLL)) == 0))
    err(1, "malloc", v97);
  v100 = v25;
  bzero(v27, v25);
  v28 = sock;
  if (__darwin_check_fd_set_overflow(sock, v27, 0))
    *(_DWORD *)&v27[((unint64_t)v28 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << v28;
  v29 = rtsock;
  if ((rtsock & 0x80000000) == 0 && __darwin_check_fd_set_overflow(rtsock, v27, 0))
    *(_DWORD *)&v27[(v29 >> 3) & 0x1FFFFFFC] |= 1 << v29;
  signal(15, (void (__cdecl *)(int))set_die);
  signal(30, (void (__cdecl *)(int))rtadvd_set_dump_file);
  v30 = &getconfig_forwarding;
  v31 = &getconfig_forwarding;
  v32 = v23;
  v33 = v100;
  v101 = v27;
LABEL_83:
  while (2)
  {
    v34 = __dst;
    do
    {
      do
      {
        while (1)
        {
          memcpy(v34, v27, v33);
          if (do_dump)
          {
            do_dump = 0;
            rtadvd_dump_file(dumpfilename);
          }
          if (do_die)
          {
            if (dflag >= 2)
              rtadvdLog();
            v94 = ralist;
            if (ralist)
            {
              do
              {
                *(_WORD *)(v94 + 84) = 0;
                make_packet(v94);
                v94 = *(_QWORD *)v94;
              }
              while (v94);
              v95 = (_QWORD *)ralist;
              if (ralist)
              {
                do
                {
                  ra_output((uint64_t)v95);
                  v95 = (_QWORD *)*v95;
                }
                while (v95);
              }
            }
            pidfile_remove(pfh);
            exit(0);
          }
          v35 = (timeval *)rtadvd_check_timer();
          rtadvdLog();
          v36 = select(v32, v34, 0, 0, v35);
          if ((v36 & 0x80000000) == 0)
            break;
          if (*__error() != 4)
          {
            v60 = __error();
            strerror(*v60);
            rtadvdLog();
          }
        }
      }
      while (!v36);
      v37 = v31[15];
      if ((_DWORD)v37 != -1
        && __darwin_check_fd_set_overflow(v31[15], v34, 0)
        && ((*(unsigned int *)((char *)v34->fds_bits + ((v37 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v37) & 1) != 0)
      {
        *(_QWORD *)v109.__u6_addr8 = 0;
        v38 = read(v31[15], v104, 0x800uLL);
        if (dflag >= 2)
        {
          rtmsg_type((uint64_t)v104);
          rtadvdLog();
        }
        if ((int)rtmsg_len((unsigned __int16 *)v104) < (int)v38 && dflag >= 2)
        {
          rtmsg_len((unsigned __int16 *)v104);
          rtadvdLog();
        }
        if (v38 << 32 < 1)
          goto LABEL_155;
        v98 = 0;
        v39 = 0;
        v40 = (unsigned __int16 *)v104;
        v41 = &v104[(int)v38];
        while (1)
        {
          next_msg = get_next_msg(v40, (unint64_t)v41, 0, &v109, 0x7006u);
          if (!*(_QWORD *)v109.__u6_addr8)
            goto LABEL_155;
          v43 = (uint64_t)next_msg;
          v44 = rtmsg_type((uint64_t)next_msg);
          v45 = v44;
          if ((v44 - 1) < 2)
          {
            rtm_ifindex = get_rtm_ifindex(v43);
          }
          else
          {
            if ((v44 - 12) >= 2 && v44 != 14)
            {
              if (dflag < 2)
                goto LABEL_132;
              if_indextoname(v39, v110);
              goto LABEL_117;
            }
            rtm_ifindex = get_ifm_ifindex(v43);
          }
          v39 = rtm_ifindex;
          v47 = &ralist;
          do
          {
            v47 = (uint64_t *)*v47;
            if (!v47)
            {
              if (dflag < 2)
                goto LABEL_132;
              if_indextoname(rtm_ifindex, v110);
LABEL_117:
              rtadvdLog();
              goto LABEL_132;
            }
          }
          while (*((_DWORD *)v47 + 11) != rtm_ifindex);
          interface_entry = get_interface_entry(rtm_ifindex);
          if (!interface_entry)
            goto LABEL_117;
          v49 = interface_entry;
          v50 = *((_DWORD *)interface_entry + 2);
          if (v45 <= 11)
          {
            if (v45 == 1)
            {
              *((_DWORD *)interface_entry + 2) = if_getflags(v39, v50);
              if (sflag)
                goto LABEL_126;
              addr = (unsigned __int8 *)get_addr((uint64_t)v104);
              prefixlen = get_prefixlen((uint64_t)v104);
              v57 = prefixlen;
              if ((prefixlen - 128) <= 0xFFFFFF83)
                goto LABEL_138;
              prefix = find_prefix((uint64_t)v47, addr, prefixlen);
              if (!prefix)
              {
                make_prefix((uint64_t)v47, v39, addr, v57);
                goto LABEL_148;
              }
              if (prefix[3])
              {
                update_prefix((uint64_t)prefix);
                goto LABEL_148;
              }
              if (dflag < 2)
                goto LABEL_126;
            }
            else
            {
              if (v45 != 2)
              {
LABEL_153:
                v27 = v101;
                if (dflag >= 2)
                {
                  if_indextoname(v39, v110);
                  rtadvdLog();
                }
                goto LABEL_155;
              }
              *((_DWORD *)interface_entry + 2) = if_getflags(v39, v50);
              if (sflag)
                goto LABEL_126;
              addr = (unsigned __int8 *)get_addr((uint64_t)v104);
              v53 = get_prefixlen((uint64_t)v104);
              if ((v53 - 128) <= 0xFFFFFF83)
              {
LABEL_138:
                rtadvdLog();
                goto LABEL_126;
              }
              v58 = find_prefix((uint64_t)v47, addr, v53);
              if (v58)
              {
                invalidate_prefix((uint64_t)v58);
LABEL_148:
                v98 = 1;
                goto LABEL_126;
              }
              if (dflag < 2)
                goto LABEL_126;
            }
            inet_ntop(30, addr, (char *)&v111, 0x2Eu);
            goto LABEL_138;
          }
          if ((v45 - 12) < 2)
          {
            ifm_flags = if_getflags(v39, v50);
            goto LABEL_125;
          }
          if (v45 != 14)
            goto LABEL_153;
          ifm_flags = get_ifm_flags(v43);
LABEL_125:
          *((_DWORD *)v49 + 2) = ifm_flags;
LABEL_126:
          v54 = *((_DWORD *)v49 + 2);
          if ((v50 & 1) != 0)
          {
            if ((v54 & 1) == 0)
            {
              rtadvdLog();
              rtadvd_remove_timer((void **)v47 + 1);
              goto LABEL_131;
            }
            v27 = v101;
            if (v98)
            {
              *((_DWORD *)v47 + 4) = 0;
              set_short_delay((uint64_t)v47);
            }
            else
            {
              v98 = 0;
            }
          }
          else
          {
            if ((v54 & 1) != 0)
            {
              rtadvdLog();
              *((_DWORD *)v47 + 4) = 0;
              *((_DWORD *)v47 + 10) = 0;
              v55 = rtadvd_add_timer((uint64_t)ra_timeout, (uint64_t)ra_timer_update, (uint64_t)v47, (uint64_t)v47);
              v47[1] = (uint64_t)v55;
              ra_timer_update(v47, (uint64_t)(v55 + 24));
              rtadvd_set_timer(v47[1] + 24, v47[1]);
            }
LABEL_131:
            v27 = v101;
          }
LABEL_132:
          v40 = (unsigned __int16 *)(v43 + *(_QWORD *)v109.__u6_addr8);
          if (v43 + *(_QWORD *)v109.__u6_addr8 >= (unint64_t)v41)
          {
LABEL_155:
            v30 = &getconfig_forwarding;
            v31 = &getconfig_forwarding;
            v32 = v99;
            v33 = v100;
            v34 = __dst;
            break;
          }
        }
      }
      v61 = v30[546];
    }
    while (!__darwin_check_fd_set_overflow(v61, v34, 0)
         || ((*(unsigned int *)((char *)v34->fds_bits + (((unint64_t)v61 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v61) & 1) == 0);
    v109 = in6addr_any;
    dword_100010830 = 48;
    v62 = recvmsg(v30[546], (msghdr *)&rcvmhdr, 0);
    if ((v62 & 0x80000000) != 0)
      continue;
    break;
  }
  if (dword_100010830 < 0xC)
    goto LABEL_176;
  v63 = (unsigned int *)qword_100010828;
  if (!qword_100010828)
    goto LABEL_176;
  v64 = 0;
  v65 = 0;
  v66 = 0;
  while (1)
  {
    if (v63[1] == 41)
    {
      v67 = v63[2];
      if (v67 != 46)
        goto LABEL_167;
      if (*v63 == 32)
      {
        v64 = v63 + 3;
        v65 = v63[7];
        v109 = *(in6_addr *)(v63 + 3);
        if (v63[1] == 41)
          break;
      }
    }
LABEL_170:
    v63 = (unsigned int *)((char *)v63 + ((*v63 + 3) & 0x1FFFFFFFCLL));
    if ((unint64_t)(v63 + 3) > qword_100010828 + (unint64_t)dword_100010830)
    {
      if (!v65 || !v66)
        goto LABEL_176;
      v68 = get_interface_entry(v64[4]);
      if (!v68)
        goto LABEL_178;
      if ((v68[4] & 1) == 0)
      {
        if_indextoname(v64[4], (char *)&v111);
LABEL_178:
        v33 = v100;
LABEL_179:
        rtadvdLog();
        goto LABEL_180;
      }
      if (v62 <= 7uLL)
        goto LABEL_176;
      v69 = *(_QWORD *)qword_100010818;
      v70 = **(unsigned __int8 **)qword_100010818;
      if (v70 != 138)
      {
        if (v70 == 134)
        {
          if (*v66 == 255 && !*(_BYTE *)(v69 + 1) && v62 > 0xFuLL)
          {
            inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
            if_indextoname(v64[4], v110);
            rtadvdLog();
            v108 = 0;
            v106 = 0u;
            *(_OWORD *)v107 = 0u;
            *(_OWORD *)v104 = 0u;
            *(_OWORD *)__s1 = 0u;
            if (nd6_options((unsigned __int8 *)(v69 + 16), v62 - 16, (uint64_t)v104, 21))
            {
              inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
              if_indextoname(v64[4], v110);
              rtadvdLog();
              v33 = v100;
            }
            else
            {
              v76 = &ralist;
              v33 = v100;
              do
              {
                v76 = (uint64_t *)*v76;
                if (!v76)
                {
                  inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                  if_indextoname(v64[4], v110);
                  rtadvdLog();
                  v82 = v107[0];
                  goto LABEL_261;
                }
              }
              while (*((_DWORD *)v76 + 11) != v64[4]);
              ++v76[57];
              v77 = *(unsigned __int8 *)(v69 + 4);
              if (*(_BYTE *)(v69 + 4))
              {
                v78 = *((_DWORD *)v76 + 30);
                if (v78)
                  v79 = v78 == v77;
                else
                  v79 = 1;
                if (v79)
                {
                  v77 = 0;
                }
                else
                {
                  inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                  v77 = 1;
                  rtadvdLog();
                }
              }
              v83 = *(_BYTE *)(v69 + 5);
              if (*((_DWORD *)v76 + 24) != (v83 & 0x80))
              {
                inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                rtadvdLog();
                ++v77;
                v83 = *(_BYTE *)(v69 + 5);
              }
              if (*((_DWORD *)v76 + 25) != (v83 & 0x40))
              {
                inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                rtadvdLog();
                ++v77;
              }
              v27 = v101;
              v84 = *(_DWORD *)(v69 + 8);
              if (v84)
              {
                v85 = bswap32(v84);
                v86 = *((_DWORD *)v76 + 28);
                if (v86 && v85 != v86)
                {
                  inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                  v27 = v101;
                  rtadvdLog();
                  ++v77;
                }
              }
              v88 = *(_DWORD *)(v69 + 12);
              if (v88)
              {
                v89 = *((_DWORD *)v76 + 29);
                if (v89)
                {
                  if (bswap32(v88) != v89)
                  {
                    inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                    rtadvdLog();
                    ++v77;
                  }
                }
              }
              if (*((_QWORD *)&v106 + 1))
              {
                v90 = *(_DWORD *)(*((_QWORD *)&v106 + 1) + 4);
                if (v90)
                {
                  v91 = *((_DWORD *)v76 + 27);
                  if (v91)
                  {
                    if (bswap32(v90) != v91)
                    {
                      inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
                      rtadvdLog();
                      ++v77;
                    }
                  }
                }
              }
              v82 = v107[0];
              if (__s1[1] && prefix_check((char *)__s1[1], (uint64_t)v76))
                ++v77;
              if (v82)
              {
                v92 = v82;
                do
                {
                  if (prefix_check((char *)v92[1], (uint64_t)v76))
                    ++v77;
                  v92 = (_QWORD *)*v92;
                }
                while (v92);
              }
              if (v77)
                ++v76[58];
              v33 = v100;
LABEL_261:
              if (v82)
              {
                do
                {
                  v93 = (_QWORD *)*v82;
                  free(v82);
                  v82 = v93;
                }
                while (v93);
              }
            }
            goto LABEL_180;
          }
LABEL_200:
          inet_ntop(30, &dword_1000107D0, v104, 0x2Eu);
          if_indextoname(v64[4], (char *)&v111);
        }
        else if (v70 == 133)
        {
          if (*v66 != 255 || *(_BYTE *)(v69 + 1))
            goto LABEL_200;
          inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
          if_indextoname(v64[4], v110);
          rtadvdLog();
          v108 = 0;
          v106 = 0u;
          *(_OWORD *)v107 = 0u;
          *(_OWORD *)v104 = 0u;
          *(_OWORD *)__s1 = 0u;
          if (nd6_options((unsigned __int8 *)(v69 + 8), v62 - 8, (uint64_t)v104, 1))
          {
            inet_ntop(30, &dword_1000107D0, (char *)&v111, 0x2Eu);
            if_indextoname(v64[4], v110);
            goto LABEL_176;
          }
          if (dword_1000107D0 || dword_1000107D4 || dword_1000107D8 || dword_1000107DC || !*(_QWORD *)&v104[8])
          {
            v71 = v64[4];
            v72 = &ralist;
            v32 = v99;
            v33 = v100;
            do
            {
              v72 = (uint64_t *)*v72;
              if (!v72)
              {
                if_indextoname(v71, v110);
                rtadvdLog();
                goto LABEL_227;
              }
            }
            while (v71 != *((_DWORD *)v72 + 11));
            ++v72[59];
            v73 = (char *)malloc_type_malloc(0x28uLL, 0x10200406E8F4065uLL);
            if (v73)
            {
              v74 = *(_OWORD *)&dword_1000107D4;
              *(_OWORD *)(v73 + 8) = rcvfrom;
              *(_OWORD *)(v73 + 20) = v74;
              *((_DWORD *)v73 + 3) = 0;
              *(_QWORD *)v73 = v72[60];
              v72[60] = (uint64_t)v73;
            }
            v75 = *((_DWORD *)v72 + 10);
            *((_DWORD *)v72 + 10) = v75 + 1;
            if (!v75)
              set_short_delay((uint64_t)v72);
          }
          else
          {
            if_indextoname(v64[4], v110);
            rtadvdLog();
            v32 = v99;
            v33 = v100;
          }
LABEL_227:
          v80 = v107[0];
          if (v107[0])
          {
            do
            {
              v81 = (_QWORD *)*v80;
              free(v80);
              v80 = v81;
            }
            while (v81);
          }
          goto LABEL_83;
        }
LABEL_176:
        rtadvdLog();
        v32 = v99;
        v33 = v100;
        goto LABEL_83;
      }
      v33 = v100;
      if (!accept_rr)
        goto LABEL_179;
      rr_input(v62, *(_QWORD *)qword_100010818, (unsigned __int8 *)v64, (uint64_t)&rcvfrom, &v109);
LABEL_180:
      v32 = v99;
      goto LABEL_83;
    }
  }
  v67 = v63[2];
LABEL_167:
  if (v67 == 47 && *v63 == 16)
    v66 = v63 + 3;
  goto LABEL_170;
}

void set_die()
{
  do_die = 1;
}

void rtadvd_set_dump_file()
{
  do_dump = 1;
}

uint64_t *find_prefix(uint64_t a1, unsigned __int8 *__s1, int a3)
{
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  size_t v8;
  int v9;
  int v10;

  v4 = (uint64_t *)(a1 + 128);
  v3 = *(uint64_t **)(a1 + 128);
  v5 = a3 + 7;
  if (a3 >= 0)
    v5 = a3;
  if (v3 == v4)
    return 0;
  v8 = (uint64_t)v5 >> 3;
  v9 = a3 - 8 * v8;
  v10 = 255 << (8 - (a3 - 8 * v8));
  while (*((_DWORD *)v3 + 18) != a3
       || memcmp(__s1, v3 + 10, v8)
       || v9 && (v10 & (*((unsigned __int8 *)v3 + v8 + 80) ^ __s1[v8])) != 0)
  {
    v3 = (uint64_t *)*v3;
    if (v3 == v4)
      return 0;
  }
  return v3;
}

BOOL prefix_match(unsigned __int8 *a1, int a2, unsigned __int8 *__s2, int a4)
{
  int v8;
  unsigned int v9;

  if (a2 < a4)
    return 0;
  if (a4 >= 0)
    v8 = a4;
  else
    v8 = a4 + 7;
  if (memcmp(a1, __s2, (uint64_t)v8 >> 3))
    return 0;
  v9 = a4 - (v8 & 0xFFFFFFF8);
  return !v9 || ((255 << (8 - v9)) & (__s2[(uint64_t)v8 >> 3] ^ a1[(uint64_t)v8 >> 3])) == 0;
}

uint64_t *if_indextorainfo(int a1)
{
  uint64_t *result;

  result = &ralist;
  do
    result = (uint64_t *)*result;
  while (result && *((_DWORD *)result + 11) != a1);
  return result;
}

uint64_t ra_timeout(uint64_t a1)
{
  rtadvdLog();
  ra_output(a1);
  return *(_QWORD *)(a1 + 8);
}

uint64_t ra_output(uint64_t a1)
{
  unsigned __int16 *interface_entry;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  _QWORD *v9;
  _QWORD *v10;

  interface_entry = get_interface_entry(*(_DWORD *)(a1 + 44));
  if (!interface_entry || (interface_entry[4] & 1) == 0)
    return rtadvdLog();
  make_packet(a1);
  sndmhdr = (uint64_t)&sin6_allnodes;
  v4 = qword_100010868;
  v5 = *(_QWORD *)(a1 + 432);
  *(_QWORD *)qword_100010868 = *(_QWORD *)(a1 + 440);
  *(_QWORD *)(v4 + 8) = v5;
  if (dword_100010880 <= 0xB)
    v6 = 0;
  else
    v6 = qword_100010878;
  *(_DWORD *)(v6 + 8) = 46;
  *(_QWORD *)v6 = 0x2900000020;
  *(_QWORD *)(v6 + 12) = 0;
  *(_QWORD *)(v6 + 20) = 0;
  *(_DWORD *)(v6 + 28) = *(_DWORD *)(a1 + 44);
  *(_QWORD *)(v6 + 32) = 0x2900000010;
  *(_DWORD *)(v6 + 40) = 47;
  *(_DWORD *)(v6 + 44) = 255;
  rtadvdLog();
  if ((sendmsg(sock, (const msghdr *)&sndmhdr, 0) & 0x80000000) != 0)
  {
    v7 = __error();
    strerror(*v7);
    rtadvdLog();
  }
  v8 = *(_DWORD *)(a1 + 16);
  if (v8 <= 2)
    *(_DWORD *)(a1 + 16) = v8 + 1;
  ++*(_QWORD *)(a1 + 448);
  v9 = *(_QWORD **)(a1 + 480);
  if (v9)
  {
    do
    {
      v10 = (_QWORD *)*v9;
      free(v9);
      v9 = v10;
    }
    while (v10);
  }
  *(_QWORD *)(a1 + 480) = 0;
  result = gettimeofday((timeval *)(a1 + 24), 0);
  *(_DWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t ra_timer_update(_DWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  v4 = a1[23];
  v5 = random() % (a1[22] - a1[23]) + v4;
  v6 = a1[4];
  if (v5 > 16 && v6 < 3)
    v5 = 16;
  if (!v6)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_DWORD *)(a2 + 8) = 0;
  return rtadvdLog();
}

double set_short_delay(uint64_t a1)
{
  int v2;
  uint64_t *v3;
  uint64_t *v4;
  double result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  timeval v10;
  __int128 v11;

  if (*(_QWORD *)(a1 + 8))
  {
    v10.tv_sec = 0;
    *(_QWORD *)&v10.tv_usec = 0;
    v9 = 0;
    v6 = 0;
    v7 = 0;
    v2 = (int)random() % 500000;
    *(_QWORD *)&v11 = 0;
    *((_QWORD *)&v11 + 1) = v2;
    v3 = rtadvd_timer_rest(*(_QWORD *)(a1 + 8));
    v4 = v3;
    if (*v3 < 0 || !*v3 && *((_DWORD *)v3 + 2) < v2)
    {
      rtadvdLog();
      v11 = *(_OWORD *)v4;
    }
    gettimeofday(&v10, 0);
    TIMEVAL_SUB((uint64_t)&v10, a1 + 24, (uint64_t)&v6);
    v8 = 3;
    LODWORD(v9) = 0;
    if (v6 < 3 || v6 == 3 && (v7 & 0x80000000) != 0)
    {
      TIMEVAL_SUB((uint64_t)&v8, (uint64_t)&v6, (uint64_t)&v8);
      TIMEVAL_ADD((uint64_t)&v8, (uint64_t)&v11, (uint64_t)&v11);
    }
    *(_QWORD *)&result = rtadvd_set_timer((uint64_t)&v11, *(_QWORD *)(a1 + 8)).n128_u64[0];
  }
  return result;
}

uint64_t nd6_options(unsigned __int8 *a1, int a2, uint64_t a3, int a4)
{
  int v6;
  unsigned int v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  if (a2 < 1)
    return 0;
  v6 = a2;
  v8 = 0;
  while (v6 != 1)
  {
    a1 += v8;
    v9 = a1[1];
    if (!a1[1] || v6 < (8 * v9))
      break;
    v10 = *a1;
    if (v10 < 6
      && (ndopt_flags[v10] & a4) != 0
      && (v9 == 1 || (_DWORD)v10 != 5)
      && (v9 == 4 || (_DWORD)v10 != 3))
    {
      switch((_DWORD)v10)
      {
        case 5:
          goto LABEL_19;
        case 3:
          if (*(_QWORD *)(a3 + 24))
          {
            v12 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
            if (!v12)
              goto LABEL_27;
            *v12 = *(_QWORD *)(a3 + 48);
            v12[1] = a1;
            *(_QWORD *)(a3 + 48) = v12;
          }
          else
          {
            *(_QWORD *)(a3 + 24) = a1;
          }
          break;
        case 1:
LABEL_19:
          if (*(_QWORD *)(a3 + 8 * v10))
          {
            rtadvdLog();
            v10 = *a1;
          }
          *(_QWORD *)(a3 + 8 * v10) = a1;
          break;
      }
    }
    else
    {
      rtadvdLog();
    }
    v8 = 8 * v9;
    v11 = __OFSUB__(v6, 8 * v9);
    v6 -= 8 * v9;
    if ((v6 < 0) ^ v11 | (v6 == 0))
      return 0;
  }
LABEL_27:
  rtadvdLog();
  v13 = *(_QWORD **)(a3 + 48);
  if (v13)
  {
    do
    {
      v14 = (_QWORD *)*v13;
      free(v13);
      v13 = v14;
    }
    while (v14);
  }
  return 0xFFFFFFFFLL;
}

uint64_t prefix_check(char *__s1, uint64_t a2)
{
  char *v4;
  uint64_t *prefix;
  uint64_t *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int64_t v12;
  timeval v14;
  char v15[46];
  char v16[46];

  v4 = __s1 + 16;
  if (__s1[16] == 254 && (__s1[17] & 0xC0) == 0x80)
  {
    inet_ntop(30, v4, v15, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
    rtadvdLog();
  }
  prefix = find_prefix(a2, (unsigned __int8 *)v4, __s1[2]);
  if (!prefix)
  {
    inet_ntop(30, v4, v15, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
    rtadvdLog();
    return 0;
  }
  v6 = prefix;
  v14.tv_sec = 0;
  *(_QWORD *)&v14.tv_usec = 0;
  v7 = bswap32(*((_DWORD *)__s1 + 2));
  if (prefix[7])
  {
    gettimeofday(&v14, 0);
    v8 = v7 + LODWORD(v14.tv_sec);
    if (!v6[3])
    {
      v9 = *(_QWORD *)(a2 + 232);
      if (v9)
      {
        if (v8 - v6[7] > v9)
        {
          inet_ntop(30, v4, v15, 0x2Eu);
          inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
          v10 = 1;
          rtadvdLog();
          goto LABEL_15;
        }
      }
    }
  }
  else if (!prefix[3] && v7 != *((_DWORD *)prefix + 12))
  {
    inet_ntop(30, v4, v15, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
    rtadvdLog();
  }
  v10 = 0;
LABEL_15:
  v11 = bswap32(*((_DWORD *)__s1 + 1));
  if (v6[5])
  {
    gettimeofday(&v14, 0);
    if (!v6[3])
    {
      v12 = *(_QWORD *)(a2 + 232);
      if (v12)
      {
        if (v11 + LODWORD(v14.tv_sec) - v6[5] > v12)
        {
LABEL_22:
          inet_ntop(30, v4, v15, 0x2Eu);
          inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
          rtadvdLog();
          return (v10 + 1);
        }
      }
    }
  }
  else if (!v6[3] && v11 != *((_DWORD *)v6 + 8))
  {
    goto LABEL_22;
  }
  return v10;
}

double rtadvd_timer_init()
{
  double result;

  xmmword_100010710 = 0u;
  *(_OWORD *)&dword_100010720 = 0u;
  qword_100010740 = 0;
  xmmword_100010730 = 0u;
  timer_head = (uint64_t)&timer_head;
  *(_QWORD *)algn_100010708 = &timer_head;
  result = *(double *)&tm_max;
  *(__int128 *)((char *)&xmmword_100010710 + 8) = tm_max;
  return result;
}

char *rtadvd_add_timer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v8;
  char *v9;

  v8 = (char *)malloc_type_malloc(0x48uLL, 0x10A00406FDF35A8uLL);
  if (!v8
    || (v9 = v8,
        *((_QWORD *)v8 + 8) = 0,
        *((_OWORD *)v8 + 2) = 0u,
        *((_OWORD *)v8 + 3) = 0u,
        *(_OWORD *)v8 = 0u,
        *((_OWORD *)v8 + 1) = 0u,
        !a1))
  {
    rtadvdLog();
    exit(1);
  }
  *((_QWORD *)v8 + 5) = a1;
  *((_QWORD *)v8 + 6) = a3;
  *((_QWORD *)v8 + 7) = a2;
  *((_QWORD *)v8 + 8) = a4;
  *(_OWORD *)(v8 + 24) = tm_max;
  insque(v8, &timer_head);
  return v9;
}

void rtadvd_remove_timer(void **a1)
{
  remque(*a1);
  free(*a1);
  *a1 = 0;
}

__n128 rtadvd_set_timer(uint64_t a1, uint64_t a2)
{
  __n128 result;
  int v5;
  __darwin_time_t v6;
  BOOL v7;
  timeval v8;

  v8.tv_sec = 0;
  *(_QWORD *)&v8.tv_usec = 0;
  gettimeofday(&v8, 0);
  v5 = *(_DWORD *)(a1 + 8) + v8.tv_usec;
  if (v5 > 999999)
  {
    v5 -= 1000000;
    v6 = v8.tv_sec + *(_QWORD *)a1 + 1;
  }
  else
  {
    v6 = *(_QWORD *)a1 + v8.tv_sec;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  if (v6 < *((uint64_t *)&xmmword_100010710 + 1)
    || (v6 == *((_QWORD *)&xmmword_100010710 + 1) ? (v7 = v5 < dword_100010720) : (v7 = 0), v7))
  {
    result = *(__n128 *)(a2 + 24);
    *(__int128 *)((char *)&xmmword_100010710 + 8) = (__int128)result;
  }
  return result;
}

uint64_t TIMEVAL_ADD(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(a2 + 8) + *(_DWORD *)(result + 8);
  if (v3 > 999999)
  {
    v3 -= 1000000;
    v4 = *(_QWORD *)result + *(_QWORD *)a2 + 1;
  }
  else
  {
    v4 = *(_QWORD *)a2 + *(_QWORD *)result;
  }
  *(_DWORD *)(a3 + 8) = v3;
  *(_QWORD *)a3 = v4;
  return result;
}

uint64_t *rtadvd_check_timer()
{
  uint64_t v0;
  __darwin_time_t tv_sec;
  __darwin_suseconds_t tv_usec;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(_QWORD, uint64_t);
  int v7;
  __darwin_time_t v8;
  int v9;
  uint64_t *result;
  int v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  __darwin_time_t v15;
  timeval v16;

  v16.tv_sec = 0;
  *(_QWORD *)&v16.tv_usec = 0;
  gettimeofday(&v16, 0);
  *(__int128 *)((char *)&xmmword_100010710 + 8) = tm_max;
  v0 = timer_head;
  if ((uint64_t *)timer_head == &timer_head)
  {
    v9 = 0x7FFFFFFF;
    v8 = 0x7FFFFFFFLL;
    goto LABEL_20;
  }
  tv_sec = v16.tv_sec;
  tv_usec = v16.tv_usec;
  do
  {
    v3 = *(uint64_t **)v0;
    v5 = (_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 24);
    if (v4 < tv_sec || v4 == tv_sec && (v4 = tv_sec, *(_DWORD *)(v0 + 32) <= tv_usec))
    {
      if (!(*(uint64_t (**)(_QWORD))(v0 + 40))(*(_QWORD *)(v0 + 48)))
        goto LABEL_17;
      v6 = *(void (**)(_QWORD, uint64_t))(v0 + 56);
      if (v6)
        v6(*(_QWORD *)(v0 + 64), v0 + 24);
      v7 = tv_usec + *(_DWORD *)(v0 + 32);
      if (v7 >= 1000000)
      {
        v7 -= 1000000;
        v4 = *v5 + tv_sec + 1;
      }
      else
      {
        v4 = tv_sec + *v5;
      }
      *(_DWORD *)(v0 + 32) = v7;
      *(_QWORD *)(v0 + 24) = v4;
    }
    if (v4 < *((uint64_t *)&xmmword_100010710 + 1)
      || v4 == *((_QWORD *)&xmmword_100010710 + 1) && *(_DWORD *)(v0 + 32) < dword_100010720)
    {
      *(__int128 *)((char *)&xmmword_100010710 + 8) = *(_OWORD *)v5;
    }
LABEL_17:
    v0 = (uint64_t)v3;
  }
  while (v3 != &timer_head);
  v8 = *((_QWORD *)&xmmword_100010710 + 1);
  v9 = dword_100010720;
LABEL_20:
  if (v8 == 0x7FFFFFFF && v9 == 0x7FFFFFFF)
    return 0;
  if (v8 < v16.tv_sec || v8 == v16.tv_sec && v9 < v16.tv_usec)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v13 = __OFSUB__(v9, v16.tv_usec);
    v11 = v9 - v16.tv_usec;
    v14 = (v11 < 0) ^ v13;
    if (v14)
      v11 += 1000000;
    if (v14)
      v15 = ~v16.tv_sec;
    else
      v15 = -v16.tv_sec;
    v12 = v15 + v8;
  }
  result = &rtadvd_check_timer_returnval;
  dword_100010750 = v11;
  rtadvd_check_timer_returnval = v12;
  return result;
}

uint64_t TIMEVAL_SUB(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(result + 8) - *(_DWORD *)(a2 + 8);
  if (v3 < 0)
  {
    v3 += 1000000;
    v4 = *(_QWORD *)result + ~*(_QWORD *)a2;
  }
  else
  {
    v4 = *(_QWORD *)result - *(_QWORD *)a2;
  }
  *(_DWORD *)(a3 + 8) = v3;
  *(_QWORD *)a3 = v4;
  return result;
}

uint64_t *rtadvd_timer_rest(uint64_t a1)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  BOOL v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *result;

  gettimeofday((timeval *)&rtadvd_timer_rest_now, 0);
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 < rtadvd_timer_rest_now
    || ((v3 = *(_DWORD *)(a1 + 32), v2 == rtadvd_timer_rest_now) ? (v4 = v3 <= dword_100010770) : (v4 = 0), v4))
  {
    rtadvdLog();
    v7 = 0;
    v9 = 0;
  }
  else
  {
    v5 = __OFSUB__(v3, dword_100010770);
    v7 = v3 - dword_100010770;
    v6 = (v7 < 0) ^ v5;
    if (v6)
      v7 += 1000000;
    if (v6)
      v8 = ~rtadvd_timer_rest_now;
    else
      v8 = -rtadvd_timer_rest_now;
    v9 = v8 + v2;
  }
  result = &rtadvd_timer_rest_returnval;
  dword_100010760 = v7;
  rtadvd_timer_rest_returnval = v9;
  return result;
}

BOOL rtadvdLog_cold_1(_QWORD *a1)
{
  uint64_t v2;
  uint8_t v4[16];

  *(_WORD *)v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os log object", v4, 2u);
  v2 = rtadvdLogger;
  *a1 = rtadvdLogger;
  return v2 == 0;
}
