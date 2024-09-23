uint64_t sub_1000030AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  void *v11;
  size_t count;
  size_t v13;
  size_t v14;
  xpc_object_t value;
  uint64_t uint64;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  sub_10000637C(2, "%s:-->", a3, a4, a5, a6, a7, a8, (char)"get_nat_packets");
  if (a2)
  {
    *a2 = 0;
    v10 = (void *)PFUserCopyRules_S(a1);
    if (v10)
    {
      v11 = v10;
      count = xpc_array_get_count(v10);
      if (!count)
      {
LABEL_9:
        xpc_release(v11);
        return 0;
      }
      v13 = count;
      v14 = 0;
      while (1)
      {
        value = xpc_array_get_value(v11, v14);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary)
          break;
        uint64 = xpc_dictionary_get_uint64(value, kPFRuleID);
        if (sub_100004C28(uint64))
        {
          *a2 = xpc_dictionary_get_uint64(value, kPFPacketsIn);
          *a2 += xpc_dictionary_get_uint64(value, kPFPacketsOut);
          xpc_dictionary_get_uint64(value, kPFPacketsIn);
          xpc_dictionary_get_uint64(value, kPFPacketsOut);
          sub_10000637C(2, "%s:packets in %llu packets out %llu", v17, v18, v19, v20, v21, v22, (char)"get_nat_packets");
        }
        if (v13 == ++v14)
          goto LABEL_9;
      }
      warn("xpc rule is not of type dictionary");
      xpc_release(v11);
    }
    else
    {
      warn("unable to get rules from anchor");
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003230(uint64_t a1, unsigned int a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned int a5, uint64_t *a6)
{
  int v9;
  BOOL v10;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  const void *v20;
  int v21;
  socklen_t v22;
  int *v23;
  int v24;
  uint64_t v25;
  uint64_t inserted;
  char string[46];

  if (!a3 || !a4 || !a5)
  {
    v23 = __error();
    v24 = 22;
LABEL_17:
    *v23 = v24;
    return 0xFFFFFFFFLL;
  }
  v9 = a3[1];
  v10 = v9 == 30 || v9 == 2;
  if (!v10 || v9 != a4[1])
  {
    v23 = __error();
    v24 = 43;
    goto LABEL_17;
  }
  v14 = xpc_dictionary_create(0, 0, 0);
  if (!v14)
  {
    v23 = __error();
    v24 = 12;
    goto LABEL_17;
  }
  v15 = v14;
  xpc_dictionary_set_uint64(v14, kPFAction, 0);
  xpc_dictionary_set_uint64(v15, kPFFamily, a3[1]);
  xpc_dictionary_set_uint64(v15, kPFProtocol, 6uLL);
  xpc_dictionary_set_uint64(v15, kPFExtFilter, 1uLL);
  xpc_dictionary_set_BOOL(v15, kPFQuick, 1);
  xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
  xpc_dictionary_set_string(v15, kPFFlags, "S/SA");
  xpc_dictionary_set_uint64(v15, kPFRTableID, 0);
  xpc_dictionary_set_uint64(v15, kPFMaxStates, 1uLL);
  xpc_dictionary_set_uint64(v15, kPFDirection, a2);
  v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    v17 = v16;
    v18 = xpc_dictionary_create(0, 0, 0);
    if (v18)
    {
      v19 = v18;
      if (a3[1] == 2)
      {
        inet_ntop(2, a3 + 4, string, 0x10u);
        xpc_dictionary_set_string(v17, kPFSubAddress, string);
        v20 = a4 + 4;
        v21 = 2;
        v22 = 16;
      }
      else
      {
        inet_ntop(30, a3 + 8, string, 0x2Eu);
        xpc_dictionary_set_string(v17, kPFSubAddress, string);
        v20 = a4 + 8;
        v21 = 30;
        v22 = 46;
      }
      inet_ntop(v21, v20, string, v22);
      xpc_dictionary_set_string(v19, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v19, kPFSubLowPort, a5);
      xpc_dictionary_set_uint64(v19, kPFSubPortOperator, 2uLL);
      inserted = PFUserInsertRule_S(a1, v15, 0, 0);
      *a6 = inserted;
      if (inserted)
        v25 = 0;
      else
        v25 = 0xFFFFFFFFLL;
      xpc_release(v19);
    }
    else
    {
      *__error() = 12;
      v25 = 0xFFFFFFFFLL;
    }
    xpc_release(v17);
  }
  else
  {
    *__error() = 12;
    v25 = 0xFFFFFFFFLL;
  }
  xpc_release(v15);
  return v25;
}

uint64_t sub_100003568(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, uint64_t *a7)
{
  int v12;
  xpc_object_t v15;
  void *v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  void *v20;
  const void *v21;
  int v22;
  socklen_t v23;
  int *v24;
  int v25;
  uint64_t v26;
  xpc_object_t v28;
  void *v29;
  const void *v30;
  int v31;
  socklen_t v32;
  uint64_t inserted;
  char string[46];

  if (!a2 || !a3 || !a4 || !a5 || !a6 || (v12 = a2[1], v12 != a5[1]))
  {
    v24 = __error();
    v25 = 22;
LABEL_16:
    *v24 = v25;
    return 0xFFFFFFFFLL;
  }
  if (v12 != 30 && v12 != 2 || v12 != a3[1])
  {
    v24 = __error();
    v25 = 43;
    goto LABEL_16;
  }
  v15 = xpc_dictionary_create(0, 0, 0);
  if (!v15)
  {
    v24 = __error();
    v25 = 12;
    goto LABEL_16;
  }
  v16 = v15;
  xpc_dictionary_set_uint64(v15, kPFAction, 8uLL);
  xpc_dictionary_set_uint64(v16, kPFFamily, a2[1]);
  xpc_dictionary_set_uint64(v16, kPFProtocol, 6uLL);
  xpc_dictionary_set_uint64(v16, kPFExtFilter, 1uLL);
  xpc_dictionary_set_uint64(v16, kPFRTableID, 0);
  xpc_dictionary_set_BOOL(v16, kPFNATPass, 1);
  v17 = xpc_dictionary_create(0, 0, 0);
  if (v17)
  {
    v18 = v17;
    v19 = xpc_dictionary_create(0, 0, 0);
    if (v19)
    {
      v20 = v19;
      if (a2[1] == 2)
      {
        inet_ntop(2, a2 + 4, string, 0x10u);
        xpc_dictionary_set_string(v18, kPFSubAddress, string);
        v21 = a3 + 4;
        v22 = 2;
        v23 = 16;
      }
      else
      {
        inet_ntop(30, a2 + 8, string, 0x2Eu);
        xpc_dictionary_set_string(v18, kPFSubAddress, string);
        v21 = a3 + 8;
        v22 = 30;
        v23 = 46;
      }
      inet_ntop(v22, v21, string, v23);
      xpc_dictionary_set_string(v20, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v20, kPFSubLowPort, a4);
      xpc_dictionary_set_uint64(v20, kPFSubPortOperator, 2uLL);
      v28 = xpc_dictionary_create(0, 0, 0);
      if (v28)
      {
        v29 = v28;
        if (a5[1] == 2)
        {
          v30 = a5 + 4;
          v31 = 2;
          v32 = 16;
        }
        else
        {
          v30 = a5 + 8;
          v31 = 30;
          v32 = 46;
        }
        inet_ntop(v31, v30, string, v32);
        xpc_dictionary_set_string(v29, kPFSubAddress, string);
        xpc_dictionary_set_uint64(v29, kPFSubLowPort, a6);
        xpc_dictionary_set_uint64(v29, kPFSubPortOperator, 0);
        xpc_dictionary_set_value(v16, kPFFrom, v18);
        xpc_dictionary_set_value(v16, kPFTo, v20);
        xpc_dictionary_set_value(v16, kPFNATRDRAddress, v29);
        inserted = PFUserInsertRule_S(a1, v16, 0, 0);
        *a7 = inserted;
        if (inserted)
          v26 = 0;
        else
          v26 = 0xFFFFFFFFLL;
        xpc_release(v29);
      }
      else
      {
        *__error() = 12;
        v26 = 0xFFFFFFFFLL;
      }
      xpc_release(v20);
    }
    else
    {
      *__error() = 12;
      v26 = 0xFFFFFFFFLL;
    }
    xpc_release(v18);
  }
  else
  {
    *__error() = 12;
    v26 = 0xFFFFFFFFLL;
  }
  xpc_release(v16);
  return v26;
}

void sub_10000394C()
{
  double v0;
  unsigned int v1;
  size_t v2;
  size_t v3;
  int v4;
  size_t v5;
  int v6;
  timeval v7;

  if (dword_10000C028)
  {
    v7.tv_sec = 0;
    *(_QWORD *)&v7.tv_usec = 0;
    gettimeofday(&v7, 0);
    if ((double)v7.tv_usec / 1000000.0 + (double)v7.tv_sec - *(double *)&qword_10000C030 >= 0.001)
      v0 = (double)v7.tv_usec / 1000000.0 + (double)v7.tv_sec - *(double *)&qword_10000C030;
    else
      v0 = 0.001;
    if (!qword_10000C038)
    {
      syslog(6, "data transfer complete (no bytes transferred)");
      return;
    }
    if (v0 < 60.0)
    {
      v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%.1fs", v0);
      if (v1 == -1)
        return;
      if (v1 > 0x3E7)
        goto LABEL_25;
LABEL_17:
      v2 = 1000 - v1;
      if ((int)qword_10000C038 >= 1)
      {
        v3 = strlen((const char *)&v7);
        v4 = snprintf((char *)&v7 + v3, v2, ", %d bytes to server) (%.1fKB/s", qword_10000C038, (double)(int)qword_10000C038 / v0 * 0.0009765625);
        if (v4 == -1)
          return;
        if (v2 <= v4)
          goto LABEL_25;
        v2 -= v4;
      }
      if (SHIDWORD(qword_10000C038) < 1)
        goto LABEL_24;
      v5 = strlen((const char *)&v7);
      v6 = snprintf((char *)&v7 + v5, v2, ", %d bytes to client) (%.1fKB/s", HIDWORD(qword_10000C038), (double)SHIDWORD(qword_10000C038) / v0 * 0.0009765625);
      if (v6 == -1)
        return;
      if (v2 > v6)
LABEL_24:
        __strlcat_chk(&v7, ")", 1000, 1000);
      goto LABEL_25;
    }
    if ((int)(v0 + 0.5) < 3600)
      v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%dm %ds");
    else
      v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%dh %dm %ds");
    if (v1 <= 0x3E7)
      goto LABEL_17;
    if (v1 != -1)
LABEL_25:
      syslog(6, "%s");
  }
}

void sub_100003C10(const char *a1, int a2)
{
  const char *v4;
  int v5;
  const char *v6;

  if (dword_10000C028)
  {
    if (!strncasecmp(a1, "pass ", 5uLL))
      v4 = "PASS XXXX";
    else
      v4 = a1;
    if (a2)
    {
      if (!strncasecmp(a1, "user ", 5uLL)
        || !strncasecmp(a1, "retr ", 5uLL)
        || !strncasecmp(a1, "cwd ", 4uLL)
        || !strncasecmp(a1, "stor ", 5uLL))
      {
        v5 = 6;
      }
      else
      {
        v5 = 7;
      }
      v6 = "client:";
    }
    else
    {
      v5 = 7;
      v6 = " server:";
    }
    syslog(v5, "%s %s", v6, v4);
  }
}

uint64_t sub_100003D04(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  const char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v31 = 0;
  if (dword_10000C008 != -1)
  {
    close(dword_10000C008);
    dword_10000C008 = -1;
  }
  sub_100003FE8();
  if (dword_10000C010 != -1)
  {
    close(dword_10000C010);
    dword_10000C010 = -1;
  }
  sub_100004024();
  if (!a1)
  {
    sub_10000637C(1, "new_dataconn(client)", v6, v7, v8, v9, v10, v11, v30);
    unk_10000C050 = 0;
    *(_QWORD *)algn_10000C058 = 0;
    v17 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&unk_10000C050);
    dword_10000C008 = v17;
    if (v17 == -1)
    {
      v21 = "cannot get client listen socket (%m)";
      goto LABEL_29;
    }
    if (listen(v17, 5))
    {
      v21 = "cannot listen on client socket (%m)";
      goto LABEL_29;
    }
    if (!dword_10000C060)
      return 0;
    v18 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0);
    if (v18)
    {
      v14 = v18;
      if (sub_100003230(v18, 1u, (unsigned __int8 *)(a2 + 40), (unsigned __int8 *)(a3 + 40), (unsigned __int16)word_10000C052, &v31) != -1)
      {
        v19 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
        v16 = v31;
        if (v19)
        {
          *v19 = qword_10000C078;
          v19[1] = v16;
          qword_10000C078 = (uint64_t)v19;
          PFUserRelease(v14, 0);
          return 0;
        }
LABEL_24:
        PFUserDeleteRule(v14, v16, 0);
      }
LABEL_25:
      PFUserRelease(v14, 0);
    }
LABEL_26:
    v21 = "pf operation failed (%m)";
LABEL_29:
    v22 = 5;
LABEL_30:
    syslog(v22, v21);
    sub_100004060(71, v23, v24, v25, v26, v27, v28, v29);
  }
  qword_10000C040 = 0;
  *(_QWORD *)algn_10000C048 = 0;
  v12 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&qword_10000C040);
  dword_10000C010 = v12;
  if (v12 == -1)
  {
    v21 = "server socket bind() failed (%m)";
LABEL_23:
    v22 = 6;
    goto LABEL_30;
  }
  if (listen(v12, 5))
  {
    v21 = "server socket listen() failed (%m)";
    goto LABEL_23;
  }
  if (!dword_10000C060)
  {
    v13 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0);
    if (v13)
    {
      v14 = v13;
      if (sub_100003568(v13, (unsigned __int8 *)&xmmword_10000C064, (unsigned __int8 *)(a3 + 40), bswap32(WORD1(qword_10000C040)) >> 16, (unsigned __int8 *)(a2 + 40), bswap32((unsigned __int16)word_10000C052) >> 16, &v31) != -1)
      {
        v15 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
        v16 = v31;
        if (v15)
        {
          *v15 = qword_10000C078;
          v15[1] = v16;
          qword_10000C078 = (uint64_t)v15;
          PFUserRelease(v14, 0);
          qword_10000CCB8 = 0;
          return 0;
        }
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  return 0;
}

uint64_t sub_100003FE8()
{
  uint64_t result;

  result = dword_10000C00C;
  if ((dword_10000C00C & 0x80000000) == 0)
  {
    shutdown(dword_10000C00C, 2);
    result = close(dword_10000C00C);
    dword_10000C00C = -1;
  }
  return result;
}

uint64_t sub_100004024()
{
  uint64_t result;

  result = dword_10000C014;
  if ((dword_10000C014 & 0x80000000) == 0)
  {
    shutdown(dword_10000C014, 2);
    result = close(dword_10000C014);
    dword_10000C014 = -1;
  }
  return result;
}

void sub_100004060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a1;
  sub_100005EDC(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_10000637C(1, "exit: %d", v9, v10, v11, v12, v13, v14, v8);
  exit(v8);
}

void sub_100004094(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  in_addr v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  int v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  unint64_t v47;
  size_t v48;
  unsigned int v49;
  ssize_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  size_t v57;
  unsigned int v58;
  ssize_t v59;
  size_t v60;
  unsigned int v61;
  ssize_t v62;
  size_t v63;
  unsigned int v64;
  ssize_t v65;
  in_addr v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  in_addr v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  in_addr v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
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
  char v104;
  addrinfo *v105;
  char *__endptr;
  addrinfo v107;
  char *v108;
  const char *v109;
  const char *v110;
  char __str[104];

  sub_100003C10(*(const char **)(a1 + 32), 1);
  v4 = *(char **)(a1 + 32);
  if (strlen(v4) >= 0x201)
  {
    syslog(5, "excessively long control command");
    goto LABEL_69;
  }
  if (dword_10000C080 && !strncasecmp(v4, "user ", 5uLL))
  {
    if (!strcasecmp(v4 + 5, "ftp\r\n") || !strcasecmp(v4 + 5, "anonymous\r\n"))
      goto LABEL_44;
    strcpy(__str, "500 Only anonymous FTP is allowed\r\n");
    v48 = strlen(__str);
    v49 = 0;
    while (1)
    {
      v50 = send(*(_DWORD *)a1, &__str[v49], v48 - v49, 0);
      if (v50 == -1)
      {
        if (*__error() != 35 && *__error() != 4)
          return;
      }
      else
      {
        v49 += v50;
      }
      if ((v49 & 0x80000000) != 0 || v48 <= (int)v49)
        return;
    }
  }
  if (strncasecmp(v4, "eprt ", 5uLL))
  {
    if (!dword_10000C088 && !strncasecmp(v4, "epsv", 4uLL))
    {
      strcpy(__str, "500 EPSV command not understood\r\n");
      sub_10000637C(1, "to client (modified): %s", v5, v6, v7, v8, v9, v10, (char)__str);
      v63 = strlen(__str);
      v64 = 0;
      while (1)
      {
        v65 = send(*(_DWORD *)a1, &__str[v64], v63 - v64, 0);
        if (v65 == -1)
        {
          if (*__error() != 35 && *__error() != 4)
            return;
        }
        else
        {
          v64 += v65;
        }
        if ((v64 & 0x80000000) != 0 || v63 <= (int)v64)
          return;
      }
    }
    if (strncasecmp(v4, "port ", 5uLL))
      goto LABEL_44;
    sub_10000637C(1, "Got a PORT command", v11, v12, v13, v14, v15, v16, v104);
    v17 = (const char *)(*(_QWORD *)(a1 + 32) + 5);
    v107.ai_flags = 0;
    if (sscanf(v17, "%u,%u,%u,%u,%u,%u", &v107, &v107.ai_family, &v107.ai_socktype, &v107.ai_protocol, &v107.ai_addrlen, &v107.ai_addrlen + 1) == 6)
    {
      for (i = 0; i != 24; i += 4)
      {
        if (*(int *)((char *)&v107.ai_flags + i) >= 0x100u)
          goto LABEL_68;
      }
      byte_10000C051 = 2;
      dword_10000C054 = bswap32((v107.ai_family << 16) | (v107.ai_flags << 24) | (v107.ai_socktype << 8) | v107.ai_protocol);
      word_10000C052 = bswap32(*(&v107.ai_addrlen + 1) | (v107.ai_addrlen << 8)) >> 16;
      sub_10000637C(1, "client wants us to use %u.%u.%u.%u:%u", v18, v19, v20, v21, v22, v23, v107.ai_flags);
      sub_100003D04(1, a1, a2);
      dword_10000C084 = 1;
      v25.s_addr = *(_DWORD *)(a2 + 44);
      v26 = inet_ntoa(v25);
      sub_10000637C(1, "we want server to use %s:%u", v27, v28, v29, v30, v31, v32, v26);
      v4 = __str;
      snprintf(__str, 0x64uLL, "PORT %u,%u,%u,%u,%u,%u\r\n", *(unsigned __int8 *)(a2 + 44), *(unsigned __int8 *)(a2 + 45), *(unsigned __int8 *)(a2 + 46), *(unsigned __int8 *)(a2 + 47), BYTE2(qword_10000C040), BYTE3(qword_10000C040));
      sub_10000637C(1, "to server (modified): %s", v33, v34, v35, v36, v37, v38, (char)__str);
      goto LABEL_45;
    }
LABEL_68:
    syslog(6, "malformed PORT command (%s)");
LABEL_69:
    sub_100004060(65, v90, v91, v92, v93, v94, v95, v96);
  }
  memset(&v107, 0, sizeof(v107));
  v105 = 0;
  v39 = strdup(v4 + 5);
  if (!v39)
  {
    syslog(3, "insufficient memory");
    sub_100004060(69, v97, v98, v99, v100, v101, v102, v103);
  }
  v40 = v39;
  v41 = 0;
  v43 = v39 + 1;
  v42 = *v39;
  v109 = 0;
  v110 = 0;
  v108 = 0;
  do
  {
    v44 = strchr(v43, v42);
    if (!v44 || *v44 != v42)
    {
      __endptr = v43;
      goto LABEL_33;
    }
    *v44 = 0;
    v45 = v44 + 1;
    (&v108)[v41++] = v43;
    v43 = v45;
  }
  while (v41 != 3);
  __endptr = v45;
  v46 = v108;
  v47 = strtoul(v108, &__endptr, 10);
  if (!*v46 || *__endptr)
  {
    if (v47 == 2)
    {
LABEL_21:
      v4 = 0;
      strcpy(__str, "522 Protocol not supported, use (1)\r\n");
      goto LABEL_34;
    }
    goto LABEL_67;
  }
  memset(&v107, 0, sizeof(v107));
  if (v47 == 2)
    goto LABEL_21;
  if (v47 != 1)
  {
LABEL_67:
    v4 = 0;
    strcpy(__str, "501 Protocol not supported\r\n");
    goto LABEL_34;
  }
  v107.ai_socktype = 1;
  *(_QWORD *)&v107.ai_flags = 0x200000004;
  if (getaddrinfo(v109, v110, &v107, &v105) || v105->ai_next || v105->ai_addrlen > 0x10)
  {
LABEL_33:
    v4 = 0;
    strcpy(__str, "500 Invalid argument; rejected\r\n");
    goto LABEL_34;
  }
  __memcpy_chk(&unk_10000C050, v105->ai_addr);
  v66.s_addr = dword_10000C054;
  v67 = inet_ntoa(v66);
  sub_10000637C(1, "client wants us to use %s:%u", v68, v69, v70, v71, v72, v73, v67);
  sub_100003D04(1, a1, a2);
  dword_10000C084 = 3;
  v74.s_addr = *(_DWORD *)(a2 + 44);
  v75 = inet_ntoa(v74);
  sub_10000637C(1, "we want server to use %s:%u", v76, v77, v78, v79, v80, v81, v75);
  v82.s_addr = *(_DWORD *)(a2 + 44);
  v83 = inet_ntoa(v82);
  v4 = __str;
  snprintf(__str, 0x64uLL, "EPRT |%d|%s|%u|\r\n", 1, v83, bswap32(WORD1(qword_10000C040)) >> 16);
  sub_10000637C(1, "to server (modified): %s", v84, v85, v86, v87, v88, v89, (char)__str);
LABEL_34:
  free(v40);
  if (v105)
    freeaddrinfo(v105);
  if (!v4)
  {
    sub_10000637C(1, "to client (modified): %s", v51, v52, v53, v54, v55, v56, (char)__str);
    v57 = strlen(__str);
    v58 = 0;
    do
    {
      v59 = send(*(_DWORD *)a1, &__str[v58], v57 - v58, 0);
      if (v59 == -1)
      {
        if (*__error() != 35 && *__error() != 4)
          break;
      }
      else
      {
        v58 += v59;
      }
    }
    while ((v58 & 0x80000000) == 0 && v57 > (int)v58);
  }
LABEL_44:
  if (v4)
  {
LABEL_45:
    v60 = strlen(v4);
    v61 = 0;
    do
    {
      v62 = send(*(_DWORD *)a2, &v4[v61], v60 - v61, 0);
      if (v62 == -1)
      {
        if (*__error() != 35 && *__error() != 4)
          return;
      }
      else
      {
        v61 += v62;
      }
    }
    while ((v61 & 0x80000000) == 0 && v60 > (int)v61);
  }
}

ssize_t sub_1000047C8(uint64_t a1, uint64_t a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  __uint32_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  size_t v18;
  unsigned int v19;
  ssize_t result;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t i;
  in_addr v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 *v52;
  in_addr v53;
  char v54;
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
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *__endptr;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  char __str[100];

  sub_100003C10(*(const char **)(a1 + 32), 0);
  v4 = *(const char **)(a1 + 32);
  if (strlen(v4) >= 0x401)
  {
    v17 = "long FTP control reply";
LABEL_46:
    v67 = 5;
LABEL_44:
    syslog(v67, v17, v75);
    sub_100004060(65, v68, v69, v70, v71, v72, v73, v74);
  }
  __endptr = 0;
  v11 = strtol(v4, &__endptr, 10);
  v12 = *(char **)(a1 + 32);
  v13 = *v12;
  if ((v13 & 0x80) != 0)
  {
    v14 = __maskrune(v13, 0x4000uLL);
    v12 = *(char **)(a1 + 32);
    LODWORD(v13) = *v12;
  }
  else
  {
    v14 = _DefaultRuneLocale.__runetype[v13] & 0x4000;
  }
  if (v14)
    v15 = 0;
  else
    v15 = v11;
  if (!(_DWORD)v13 || (v16 = *__endptr, v16 != 32) && v16 != 45)
  {
    if ((byte_10000CCC0 & 1) != 0)
      goto LABEL_15;
    v17 = "malformed control reply";
    goto LABEL_43;
  }
  if ((unint64_t)(v15 - 1000) <= 0xFFFFFFFFFFFFFC18)
  {
    if ((byte_10000CCC0 & 1) != 0)
      goto LABEL_15;
    v75 = v15;
    v17 = "invalid server reply code %ld";
    goto LABEL_43;
  }
  byte_10000CCC0 = v16 == 45;
  if (v15 != 227 || dword_10000C088 != 0)
  {
    if (dword_10000C088)
    {
      if (v15 == 234)
      {
        sub_10000637C(1, "Got 'authentication exchange complete' reply", v5, v6, v7, v8, v9, v10, v75);
        sub_10000637C(1, "{%s}", v22, v23, v24, v25, v26, v27, *(_QWORD *)(a1 + 32));
        dword_10000C084 = 5;
        v12 = *(char **)(a1 + 32);
        if (fcntl(*(_DWORD *)a2, 4, 4) == -1 || fcntl(*(_DWORD *)a1, 4, 4) == -1)
        {
          syslog(3, "fcntl F_SETFL O_NONBLOCK error");
          sub_100004060(71, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    goto LABEL_15;
  }
  sub_10000637C(1, "Got a PASV reply", v5, v6, v7, v8, v9, v10, v75);
  sub_10000637C(1, "{%s}", v35, v36, v37, v38, v39, v40, *(_QWORD *)(a1 + 32));
  v41 = *(char **)(a1 + 32);
  v42 = strchr(v41, 40);
  if (!v42)
  {
    v42 = strrchr(v41, 32);
    if (!v42)
    {
      v17 = "malformed 227 reply";
      goto LABEL_46;
    }
  }
  v77 = 0;
  if (sscanf(v42 + 1, "%u,%u,%u,%u,%u,%u", &v77, &v78, &v79, &v80, &v81, &v82) != 6)
  {
    v75 = *(_QWORD *)(a2 + 32);
    v17 = "malformed PASV reply (%s)";
    goto LABEL_43;
  }
  for (i = 0; i != 24; i += 4)
  {
    if (*(unsigned int *)((char *)&v77 + i) >= 0x100)
    {
      v75 = *(_QWORD *)(a2 + 32);
      v17 = "malformed PASV reply(%s)";
LABEL_43:
      v67 = 6;
      goto LABEL_44;
    }
  }
  BYTE1(qword_10000C040) = 2;
  v44.s_addr = bswap32((v78 << 16) | (v77 << 24) | (v79 << 8) | v80);
  HIDWORD(qword_10000C040) = v44;
  WORD1(qword_10000C040) = bswap32(v82 | (v81 << 8)) >> 16;
  v45 = inet_ntoa(v44);
  sub_10000637C(1, "server wants us to use %s:%u", v46, v47, v48, v49, v50, v51, v45);
  sub_100003D04(0, a2, a1);
  dword_10000C084 = 2;
  if (dword_10000C060)
    v52 = (unsigned __int8 *)&unk_10000C090;
  else
    v52 = (unsigned __int8 *)(a1 + 44);
  v53.s_addr = *(_DWORD *)v52;
  v54 = inet_ntoa(v53);
  sub_10000637C(1, "we want client to use %s:%u", v55, v56, v57, v58, v59, v60, v54);
  v12 = __str;
  snprintf(__str, 0x64uLL, "227 Entering Passive Mode (%u,%u,%u,%u,%u,%u)\r\n", *v52, v52[1], v52[2], v52[3], word_10000C052, HIBYTE(word_10000C052));
  sub_10000637C(1, "to client (modified): %s", v61, v62, v63, v64, v65, v66, (char)__str);
LABEL_15:
  v18 = strlen(v12);
  v19 = 0;
  while (2)
  {
    result = send(*(_DWORD *)a2, &v12[v19], v18 - v19, 0);
    if (result != -1)
    {
      v19 += result;
      goto LABEL_20;
    }
    result = (ssize_t)__error();
    if (*(_DWORD *)result == 35 || (result = (ssize_t)__error(), *(_DWORD *)result == 4))
    {
LABEL_20:
      if ((v19 & 0x80000000) != 0 || v18 <= (int)v19)
        return result;
      continue;
    }
    return result;
  }
}

uint64_t sub_100004C28(uint64_t a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)qword_10000C078;
  if (!qword_10000C078)
    return 0;
  while (v1[1] != a1)
  {
    v1 = (_QWORD *)*v1;
    if (!v1)
      return 0;
  }
  return 1;
}

void start(int a1, char *const *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
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
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  int v63;
  const char *v64;
  const char *v65;
  unint64_t v66;
  size_t v67;
  fd_set *v68;
  fd_set *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t i;
  timeval *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  unint64_t v126;
  unint64_t v127;
  int v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  int v155;
  int v156;
  uint64_t v157;
  char v158;
  char v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  char *errorbuf;
  uint64_t v164;
  uint64_t v165;
  int v166;
  socklen_t v167;
  sigaction v168;
  sigaction v169;
  int v170[8];
  __int128 v171;
  _OWORD v172[2];
  uint64_t v173;
  int v174[8];
  sockaddr v175[3];
  uint64_t v176;
  socklen_t v177;
  sockaddr v178;
  timeval __endptr[2];

  v176 = 0;
  memset(v175, 0, sizeof(v175));
  memset(v174, 0, sizeof(v174));
  v173 = 0;
  memset(v172, 0, sizeof(v172));
  v171 = 0u;
  memset(v170, 0, sizeof(v170));
  v169.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v169.sa_mask = 0;
  v168.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v168.sa_mask = 0;
  v166 = 1;
  v167 = 0;
  v164 = 0;
  v165 = 0;
  errorbuf = 0;
  if (sandbox_init("ftp-proxy-embedded", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "sandbox_init: %s\n", errorbuf);
    sandbox_free_error(errorbuf);
    exit(-1);
  }
  v4 = getopt(a1, a2, "a:D:g:m:M:R:S:t:u:AnpVwr");
  if (v4 == -1)
    goto LABEL_4;
  v162 = 0;
  v5 = 0;
  do
  {
    v6 = v5;
    __endptr[0].tv_sec = 0;
    if (v4 > 96)
    {
      v5 = 1;
      switch(v4)
      {
        case 'g':
          qword_10000C0A0 = (uint64_t)optarg;
          goto LABEL_44;
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'o':
        case 'q':
        case 's':
          goto LABEL_4;
        case 'm':
          v7 = strtol(optarg, (char **)__endptr, 10);
          dword_10000C000 = v7;
LABEL_31:
          if (!*optarg)
            goto LABEL_4;
          if (*(_BYTE *)__endptr[0].tv_sec)
            goto LABEL_4;
          v5 = v6;
          if (v7 >= 0x10000)
            goto LABEL_4;
          break;
        case 'n':
          dword_10000C088 = 1;
          goto LABEL_44;
        case 'p':
          break;
        case 'r':
          dword_10000CCB4 = 1;
          goto LABEL_44;
        case 't':
          v162 = strtol(optarg, (char **)__endptr, 10);
          goto LABEL_38;
        case 'u':
          off_10000C018 = optarg;
          goto LABEL_44;
        default:
          if (v4 != 97 || !*optarg)
            goto LABEL_4;
          dword_10000C020 = inet_addr(optarg);
          v5 = v6;
          if (dword_10000C020 == -1)
          {
            syslog(5, "%s: invalid address", optarg);
            sub_100005E60();
          }
          return;
      }
    }
    else
    {
      switch(v4)
      {
        case 'M':
          v7 = strtol(optarg, (char **)__endptr, 10);
          dword_10000C004 = v7;
          goto LABEL_31;
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'T':
        case 'U':
          goto LABEL_4;
        case 'R':
          if (!*optarg)
            goto LABEL_4;
          v8 = strdup(optarg);
          if (!v8)
          {
            syslog(5, "Insufficient memory (malloc failed)");
            goto LABEL_64;
          }
          v9 = v8;
          xmmword_10000C064 = 0x210uLL;
          v10 = strchr(v8, 58);
          if (v10)
          {
            v11 = v10;
            v12 = strtol(v10 + 1, (char **)__endptr, 10);
            if (*(_BYTE *)__endptr[0].tv_sec || v12 < 1 || v12 >= 0x10000)
              goto LABEL_4;
            WORD1(xmmword_10000C064) = bswap32(v12) >> 16;
            *v11 = 0;
          }
          else
          {
            WORD1(xmmword_10000C064) = 5376;
          }
          DWORD1(xmmword_10000C064) = inet_addr(v9);
          if (DWORD1(xmmword_10000C064) == -1)
            goto LABEL_4;
          free(v9);
          dword_10000C060 = 1;
          goto LABEL_44;
        case 'S':
          if (!inet_aton(optarg, (in_addr *)&dword_10000C0A8))
            goto LABEL_4;
          break;
        case 'V':
          dword_10000C028 = 1;
          goto LABEL_44;
        default:
          if (v4 == 65)
          {
            dword_10000C080 = 1;
LABEL_44:
            v5 = v6;
          }
          else
          {
            if (v4 != 68)
              goto LABEL_4;
            dword_10000CCB0 = strtol(optarg, (char **)__endptr, 10);
LABEL_38:
            if (!*optarg)
              goto LABEL_4;
            v5 = v6;
            if (*(_BYTE *)__endptr[0].tv_sec)
              goto LABEL_4;
          }
          break;
      }
    }
    v4 = getopt(a1, a2, "a:D:g:m:M:R:S:t:u:AnpVwr");
  }
  while (v4 != -1);
  if (dword_10000C004 < dword_10000C000 || !(_DWORD)v5)
LABEL_4:
    sub_100005E60();
  openlog(__progname, 9, 24);
  setlinebuf(__stdoutp);
  setlinebuf(__stderrp);
  memset(v174, 0, sizeof(v174));
  memset(v175, 0, sizeof(v175));
  v176 = 0;
  memset(v170, 0, sizeof(v170));
  v171 = 0u;
  memset(v172, 0, sizeof(v172));
  v173 = 0;
  if (sub_1000063B8(0, (uint64_t)&xmmword_10000C064, (uint64_t)&v175[0].sa_data[6], (sockaddr *)&unk_10000C08C) == -1)sub_100004060(76, v13, v14, v15, v16, v17, v18, v19);
  if (dword_10000CCB4)
    v20 = 0;
  else
    v20 = 10;
  v21 = getnameinfo((const sockaddr *)&v175[0].sa_data[6], 0x10u, byte_10000C0AC, 0x401u, 0, 0, v20);
  if (v21 <= 8 && ((1 << v21) & 0x105) != 0)
  {
    v28 = getnameinfo((const sockaddr *)&xmmword_10000C064, 0x10u, byte_10000C4AD, 0x401u, 0, 0, v20);
    if (v28 <= 8 && ((1 << v28) & 0x105) != 0)
    {
      v174[0] = 0;
      syslog(6, "accepted connection from %s:%u to %s:%u", byte_10000C0AC, bswap32(*(unsigned __int16 *)&v175[0].sa_data[8]) >> 16, byte_10000C4AD, bswap32(WORD1(xmmword_10000C064)) >> 16);
      v170[0] = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v171 + 8);
      if (connect(v170[0], (const sockaddr *)&xmmword_10000C064, 0x10u))
      {
        syslog(6, "cannot connect to %s:%u (%m)");
        goto LABEL_66;
      }
      v167 = 16;
      getsockname(v170[0], (sockaddr *)((char *)&v171 + 8), &v167);
      v29 = getnameinfo((const sockaddr *)((char *)&v171 + 8), 0x10u, byte_10000C8AE, 0x401u, 0, 0, v20);
      if (v29 <= 8 && ((1 << v29) & 0x105) != 0)
      {
        sub_10000637C(1, "local socket is %s:%u", v22, v23, v24, v25, v26, v27, (char)byte_10000C8AE);
        v169.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
        *(_QWORD *)&v169.sa_mask = 0x200000000;
        if (sigaction(13, &v169, &v168))
        {
          syslog(3, "sigaction() failed (%m)");
          goto LABEL_204;
        }
        v169.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100005EB0;
        *(_QWORD *)&v169.sa_mask = 0;
        sigaction(2, &v169, 0);
        sigaction(15, &v169, 0);
        if (setsockopt(v174[0], 0xFFFF, 256, &v166, 4u) == -1)
        {
          syslog(5, "cannot set SO_OOBINLINE (%m)");
          goto LABEL_204;
        }
        v174[1] = 1024;
        *(_QWORD *)&v175[0].sa_len = malloc_type_malloc(0x400uLL, 0xB51820DEuLL);
        v174[2] = 1024;
        v52 = malloc_type_malloc(0x400uLL, 0xC49F5072uLL);
        *(_QWORD *)&v174[3] = 0;
        LOBYTE(v176) = 1;
        *(_QWORD *)&v174[6] = v52;
        *(_QWORD *)&v175[2].sa_data[6] = "client";
        HIDWORD(v176) = 0;
        *(_OWORD *)&v175[1].sa_data[6] = *(_OWORD *)&v175[0].sa_data[6];
        v170[1] = 1024;
        *(_QWORD *)&v171 = malloc_type_malloc(0x400uLL, 0xBD9FB44uLL);
        v170[2] = 1024;
        v53 = malloc_type_malloc(0x400uLL, 0x6AB13121uLL);
        *(_QWORD *)&v170[6] = v53;
        *(_QWORD *)&v170[3] = 0;
        LOBYTE(v173) = 1;
        *((_QWORD *)&v172[1] + 1) = "server";
        HIDWORD(v173) = 1;
        *(_OWORD *)((char *)v172 + 8) = xmmword_10000C064;
        if (!*(_QWORD *)&v175[0].sa_len || !*(_QWORD *)&v174[6] || !(_QWORD)v171 || !v53)
        {
LABEL_202:
          syslog(5, "insufficient memory");
LABEL_64:
          sub_100004060(69, v37, v38, v39, v40, v41, v42, v43);
        }
        v60 = v176;
        v61 = 1;
        while (1)
        {
          v62 = v174[0];
          if (v174[0] <= dword_10000C008)
            v62 = dword_10000C008;
          if (v62 <= dword_10000C00C)
            v62 = dword_10000C00C;
          if (v62 <= v170[0])
            v62 = v170[0];
          if (v62 <= dword_10000C010)
            v62 = dword_10000C010;
          if (v62 <= dword_10000C014)
            v62 = dword_10000C014;
          v63 = v62 & ~(v62 >> 31);
          if (v60)
            v64 = "alive";
          else
            v64 = "dead";
          if (v61)
            v65 = "alive";
          else
            v65 = "dead";
          v161 = v65;
          sub_10000637C(3, "client is %s; server is %s", v54, v55, v56, v57, v58, v59, (char)v64);
          v66 = (v63 + 1);
          if ((((_BYTE)v63 + 1) & 0x1F) != 0)
            v67 = (v66 >> 5) + 1;
          else
            v67 = v66 >> 5;
          v68 = (fd_set *)malloc_type_calloc(v67, 4uLL, 0x100004052888210uLL);
          if (!v68)
            goto LABEL_202;
          v69 = v68;
          if (dword_10000C084 == 5)
          {
            if (!(_BYTE)v176)
              goto LABEL_110;
            v70 = v174[0];
            if (__darwin_check_fd_set_overflow(v174[0], v68, 0))
              *(__int32_t *)((char *)v69->fds_bits + (((unint64_t)v70 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v70;
            v77 = "ready";
            if (!BYTE2(v176))
              v77 = "waiting";
            sub_10000637C(3, "client is %s", v71, v72, v73, v74, v75, v76, (char)v77);
            if (BYTE2(v176))
            {
              if ((int)sub_10000672C((uint64_t)"secure client to server", v174[0], v170[0]) < 1)
              {
                v78 = 1;
              }
              else
              {
                v78 = 0;
                BYTE2(v176) = 0;
              }
            }
            else
            {
LABEL_110:
              v78 = 0;
            }
            if ((_BYTE)v173)
            {
              v85 = v170[0];
              if (__darwin_check_fd_set_overflow(v170[0], v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + (((unint64_t)v85 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v85;
              v92 = "ready";
              if (!BYTE2(v173))
                v92 = "waiting";
              sub_10000637C(3, "server is %s", v86, v87, v88, v89, v90, v91, (char)v92);
              if (BYTE2(v173))
              {
                if ((int)sub_10000672C((uint64_t)"secure server to client", v170[0], v174[0]) < 1)
                  goto LABEL_206;
                BYTE2(v173) = 0;
              }
            }
            if (v78)
            {
LABEL_206:
              close(v174[0]);
              close(v170[0]);
              free(v69);
LABEL_207:
              if (dword_10000C028)
                syslog(6, "session ended");
LABEL_209:
              sub_100004060(0, v157, v54, v55, v56, v57, v58, v59);
            }
          }
          else
          {
            if ((_BYTE)v176 && sub_10000614C((uint64_t)v174, v170))
            {
              sub_10000637C(3, "client line buffer is \"%s\"", v79, v80, v81, v82, v83, v84, v175[0].sa_len);
              if (**(_BYTE **)&v175[0].sa_len)
                sub_100004094((uint64_t)v174, (uint64_t)v170);
              goto LABEL_195;
            }
            if ((_BYTE)v173 && sub_10000614C((uint64_t)v170, v174))
            {
              sub_10000637C(3, "server line buffer is \"%s\"", v119, v120, v121, v122, v123, v124, v171);
              if (*(_BYTE *)v171)
                sub_1000047C8((uint64_t)v170, (uint64_t)v174);
              goto LABEL_195;
            }
            if ((_BYTE)v176)
            {
              v125 = v174[0];
              if (__darwin_check_fd_set_overflow(v174[0], v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + (((unint64_t)v125 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v125;
              v126 = dword_10000C008;
              if ((dword_10000C008 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C008, v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + ((v126 >> 3) & 0x1FFFFFFC)) |= 1 << v126;
              v127 = dword_10000C00C;
              if ((dword_10000C00C & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C00C, v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + ((v127 >> 3) & 0x1FFFFFFC)) |= 1 << v127;
            }
            if ((_BYTE)v173)
            {
              v128 = v170[0];
              if (__darwin_check_fd_set_overflow(v170[0], v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + (((unint64_t)v128 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v128;
              v129 = dword_10000C010;
              if ((dword_10000C010 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C010, v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + ((v129 >> 3) & 0x1FFFFFFC)) |= 1 << v129;
              v130 = dword_10000C014;
              if ((dword_10000C014 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C014, v69, 0))
                *(__int32_t *)((char *)v69->fds_bits + ((v130 >> 3) & 0x1FFFFFFC)) |= 1 << v130;
            }
          }
          v164 = v162;
          LODWORD(v165) = 0;
          for (i = v162; ; i = v164)
          {
            v94 = i ? (timeval *)&v164 : 0;
            v95 = select(v66, v69, 0, 0, v94);
            if (v95 != -1)
              break;
            if (*__error() != 4 && *__error() != 35)
            {
              syslog(5, "select() failed (%m)");
              goto LABEL_204;
            }
          }
          if (!v95)
          {
            __endptr[0].tv_sec = 0;
            v96 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0);
            if (!v96
              || (v103 = v96,
                  v104 = sub_1000030AC(v96, (uint64_t *)__endptr, v97, v98, v99, v100, v101, v102),
                  PFUserRelease(v103, 0),
                  v104 < 0)
              || __endptr[0].tv_sec == qword_10000CCB8)
            {
              syslog(6, "timeout: no data for %ld seconds");
              goto LABEL_209;
            }
            sub_10000637C(3, "transfer: server to client %llu packets", v105, v106, v107, v108, v109, v110, __endptr[0].tv_sec);
            qword_10000CCB8 = __endptr[0].tv_sec;
          }
          v111 = dword_10000C00C;
          if ((dword_10000C00C & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C00C, v69, 0)
            && ((*(unsigned int *)((char *)v69->fds_bits + ((v111 >> 3) & 0x1FFFFFFC)) >> v111) & 1) != 0)
          {
            sub_10000637C(3, "transfer: client to server", v112, v113, v114, v115, v116, v117, v159);
            v118 = sub_10000672C((uint64_t)"client to server", dword_10000C00C, dword_10000C014);
            if (v118 <= 0)
            {
              sub_100003FE8();
              sub_100004024();
              sub_10000394C();
            }
            else
            {
              LODWORD(qword_10000C038) = qword_10000C038 + v118;
            }
          }
          v131 = dword_10000C014;
          if ((dword_10000C014 & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C014, v69, 0)
            && ((*(unsigned int *)((char *)v69->fds_bits + ((v131 >> 3) & 0x1FFFFFFC)) >> v131) & 1) != 0)
          {
            sub_10000637C(3, "transfer: server to client", v132, v133, v134, v135, v136, v137, v159);
            v138 = sub_10000672C((uint64_t)"server to client", dword_10000C014, dword_10000C00C);
            if (v138 <= 0)
            {
              sub_100003FE8();
              sub_100004024();
              sub_10000394C();
            }
            else
            {
              HIDWORD(qword_10000C038) += v138;
            }
          }
          v139 = dword_10000C010;
          if ((dword_10000C010 & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C010, v69, 0)
            && ((*(unsigned int *)((char *)v69->fds_bits + ((v139 >> 3) & 0x1FFFFFFC)) >> v139) & 1) != 0)
          {
            *(_QWORD *)&v178.sa_len = 0;
            *(_QWORD *)&v178.sa_data[6] = 0;
            sub_10000637C(2, "server listen socket ready", v140, v141, v142, v143, v144, v145, v159);
            sub_100004024();
            sub_100003FE8();
            v177 = 16;
            dword_10000C014 = accept(dword_10000C010, &v178, &v177);
            if (dword_10000C014 < 0)
              goto LABEL_210;
            close(dword_10000C010);
            dword_10000C010 = -1;
            if (getuid())
            {
              *(_DWORD *)&v178.sa_data[2] = dword_10000C0A8;
              v146 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v178);
              dword_10000C00C = v146;
              if (v146 < 0)
                goto LABEL_211;
            }
            else
            {
              dword_10000C00C = socket(2, 1, 0);
              v177 = 1;
              v178.sa_family = 2;
              *(_DWORD *)&v178.sa_data[2] = dword_10000C0A8;
              *(_WORD *)v178.sa_data = 5120;
              if (setsockopt(dword_10000C00C, 0xFFFF, 4, &v177, 4u) == -1)
              {
                syslog(5, "setsockopt() failed (%m)");
                goto LABEL_204;
              }
              if (bind(dword_10000C00C, &v178, 0x10u) == -1)
              {
                syslog(5, "data channel bind() failed (%m)");
LABEL_204:
                sub_100004060(71, v30, v31, v32, v33, v34, v35, v36);
              }
              v146 = dword_10000C00C;
            }
            if (connect(v146, (const sockaddr *)&unk_10000C050, 0x10u))
            {
              syslog(6, "cannot connect data channel (%m)");
              goto LABEL_66;
            }
            qword_10000C038 = 0;
            __endptr[0].tv_sec = 0;
            *(_QWORD *)&__endptr[0].tv_usec = 0;
            gettimeofday(__endptr, 0);
            *(double *)&qword_10000C030 = (double)__endptr[0].tv_usec / 1000000.0 + (double)__endptr[0].tv_sec;
          }
          v147 = dword_10000C008;
          if ((dword_10000C008 & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C008, v69, 0)
            && ((*(unsigned int *)((char *)v69->fds_bits + ((v147 >> 3) & 0x1FFFFFFC)) >> v147) & 1) != 0)
          {
            *(_QWORD *)&v178.sa_len = 0;
            *(_QWORD *)&v178.sa_data[6] = 0;
            sub_10000637C(2, "client listen socket ready", v148, v149, v150, v151, v152, v153, v159);
            sub_100004024();
            sub_100003FE8();
            v177 = 16;
            dword_10000C00C = accept(dword_10000C008, &v178, &v177);
            if (dword_10000C00C < 0)
            {
LABEL_210:
              syslog(5, "accept() failed (%m)");
              goto LABEL_204;
            }
            close(dword_10000C008);
            dword_10000C008 = -1;
            *(_QWORD *)&v178.sa_len = 0;
            *(_QWORD *)&v178.sa_data[6] = 0;
            v154 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v178);
            dword_10000C014 = v154;
            if (v154 < 0)
            {
LABEL_211:
              syslog(5, "get_backchannel_socket() failed (%m)");
              goto LABEL_204;
            }
            if (connect(v154, (const sockaddr *)&qword_10000C040, 0x10u))
            {
              syslog(5, "connect() failed (%m)", v160, v161);
LABEL_66:
              sub_100004060(68, v44, v45, v46, v47, v48, v49, v50);
            }
            qword_10000C038 = 0;
            __endptr[0].tv_sec = 0;
            *(_QWORD *)&__endptr[0].tv_usec = 0;
            gettimeofday(__endptr, 0);
            *(double *)&qword_10000C030 = (double)__endptr[0].tv_usec / 1000000.0 + (double)__endptr[0].tv_sec;
          }
          if ((_BYTE)v176)
          {
            v155 = v174[0];
            if (__darwin_check_fd_set_overflow(v174[0], v69, 0))
            {
              if (((*(unsigned int *)((char *)v69->fds_bits + (((unint64_t)v155 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v155) & 1) != 0)
                BYTE2(v176) = 1;
            }
          }
          if ((_BYTE)v173)
          {
            v156 = v170[0];
            if (__darwin_check_fd_set_overflow(v170[0], v69, 0))
            {
              if (((*(unsigned int *)((char *)v69->fds_bits + (((unint64_t)v156 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v156) & 1) != 0)
                BYTE2(v173) = 1;
            }
          }
LABEL_195:
          free(v69);
          if (BYTE1(v176))
          {
            shutdown(v170[0], 1);
            shutdown(v174[0], 0);
            LOWORD(v176) = 0;
          }
          if (BYTE1(v173))
          {
            shutdown(v174[0], 1);
            shutdown(v170[0], 0);
            v61 = 0;
            LOWORD(v173) = 0;
          }
          else
          {
            v61 = v173;
          }
          v60 = v176;
          if (!(v176 | v61))
            goto LABEL_207;
        }
      }
      v51 = "name resolution failure (local)";
    }
    else
    {
      v51 = "name resolution failure (server)";
    }
  }
  else
  {
    v51 = "name resolution failure (client)";
  }
  sub_10000637C(2, v51, v22, v23, v24, v25, v26, v27, v158);
  goto LABEL_204;
}

void sub_100005E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  syslog(5, "usage: %s -i [-AnrVw] [-a address] [-D debuglevel] [-g group] [-M maxport] [-m minport] [-R address[:port]] [-S address] [-t timeout] [-u user]", __progname);
  syslog(5, "usage: %s -p [-AnrVw] [-a address] [-D debuglevel] [-g group] [-M maxport] [-m minport] [-R address[:port]] [-S address] [-t timeout] [-u user]", __progname);
  sub_100004060(64, v0, v1, v2, v3, v4, v5, v6);
}

void sub_100005EB0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  sub_10000637C(1, "exiting on signal %d\n", a3, a4, a5, a6, a7, a8, a1);
  sub_100005EDC(v8, v9, v10, v11, v12, v13, v14, v15);
  sub_100004060(0, v16, v17, v18, v19, v20, v21, v22);
}

void sub_100005EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  char v15;

  sub_10000637C(1, "pf: remove rulesets", a3, a4, a5, a6, a7, a8, v15);
  if (qword_10000C078)
  {
    v8 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0);
    if (v8)
    {
      v9 = v8;
      v10 = (uint64_t *)qword_10000C078;
      if (qword_10000C078)
      {
        do
        {
          v12 = (uint64_t *)*v10;
          v11 = v10[1];
          if (v11)
            PFUserDeleteRule(v9, v11, 0);
          v13 = (uint64_t *)qword_10000C078;
          if ((uint64_t *)qword_10000C078 == v10)
          {
            v14 = &qword_10000C078;
          }
          else
          {
            do
            {
              v14 = v13;
              v13 = (uint64_t *)*v13;
            }
            while (v13 != v10);
          }
          *v14 = *v10;
          free(v10);
          v10 = v12;
        }
        while (v12);
      }
      PFUserRelease(v9, 0);
    }
  }
}

uint64_t sub_100005FC0(uint64_t a1)
{
  uint64_t result;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  void *v8;
  size_t v9;
  ssize_t v10;

  if (!*(_BYTE *)(a1 + 82) || *(_BYTE *)(a1 + 81))
    return 0;
  v3 = *(_DWORD *)(a1 + 12);
  v4 = *(int *)(a1 + 16);
  if (v3 <= (int)v4)
  {
    if (v3 != (_DWORD)v4)
    {
      syslog(3, "next_byte(%d) > io_buffer_len(%d)", *(_DWORD *)(a1 + 16), v3);
      exit(71);
    }
    v5 = 0;
  }
  else
  {
    v5 = v3 - v4;
    memmove(*(void **)(a1 + 24), (const void *)(*(_QWORD *)(a1 + 24) + v4), v3 - (int)v4);
  }
  *(_DWORD *)(a1 + 12) = v5;
  *(_DWORD *)(a1 + 16) = 0;
  v6 = *(int *)(a1 + 8);
  v7 = v6 - v5;
  if ((int)v6 - v5 <= 128)
  {
    *(_DWORD *)(a1 + 8) = v6 + 128;
    v8 = malloc_type_realloc(*(void **)(a1 + 24), v6 + 128, 0x7618E8B3uLL);
    if (!v8)
    {
      syslog(6, "Insufficient memory");
      exit(69);
    }
    *(_QWORD *)(a1 + 24) = v8;
    v5 = *(_DWORD *)(a1 + 12);
    v7 = *(_DWORD *)(a1 + 8) - v5;
  }
  v9 = v7 - 1;
  while (1)
  {
    v10 = read(*(_DWORD *)a1, (void *)(*(_QWORD *)(a1 + 24) + v5), v9);
    *(_BYTE *)(a1 + 82) = 0;
    if (v10 != -1)
      break;
    if (*__error() != 35 && *__error() != 4)
    {
      if (*__error() != 54)
      {
        syslog(6, "read() failed on socket from %s (%m)", *(const char **)(a1 + 72));
        exit(65);
      }
      goto LABEL_19;
    }
    v5 = *(_DWORD *)(a1 + 12);
  }
  if (v10)
  {
    *(_DWORD *)(a1 + 12) += v10;
    return 1;
  }
LABEL_19:
  result = 0;
  *(_BYTE *)(a1 + 81) = 1;
  return result;
}

uint64_t sub_10000614C(uint64_t a1, int *a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE v18[100];

  **(_BYTE **)(a1 + 32) = 0;
  v4 = *(_DWORD *)(a1 + 16);
  if (v4 == *(_DWORD *)(a1 + 12))
  {
    result = sub_100005FC0(a1);
    if (!(_DWORD)result)
      return result;
    v4 = *(_DWORD *)(a1 + 16);
  }
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_DWORD *)(a1 + 12);
  if (*(unsigned __int8 *)(v6 + v4) == 255)
  {
    if (v7 - v4 <= 2)
    {
      result = sub_100005FC0(a1);
      if (!(_DWORD)result)
        return result;
      v4 = *(_DWORD *)(a1 + 16);
      if (*(_DWORD *)(a1 + 12) - v4 < 3)
        return 0;
      v6 = *(_QWORD *)(a1 + 24);
    }
    v16 = v4 + 2;
    *(_DWORD *)(a1 + 16) = v16;
    v17 = *(_BYTE *)(v6 + v4 + 1);
    if ((v17 + 5) <= 3u)
    {
      v18[0] = -1;
      v18[1] = v17;
      *(_DWORD *)(a1 + 16) = v4 + 3;
      v18[2] = *(_BYTE *)(v6 + v16);
      send(*a2, v18, 3uLL, a2[21]);
    }
  }
  else
  {
    v8 = v4;
    v9 = v4;
    if (v7 > v4)
    {
      v10 = (unsigned __int8 *)(v6 + v4);
      v9 = v4;
      while (1)
      {
        v12 = *v10++;
        v11 = v12;
        if (v12 == 10)
          break;
        if (!v11)
        {
          syslog(6, "got NUL byte from %s - bye!", *(const char **)(a1 + 72));
          exit(65);
        }
        if (v7 == ++v9)
          return sub_100005FC0(a1);
      }
    }
    if (v9 == v7)
      return sub_100005FC0(a1);
    v13 = v9 - v4;
    v14 = *(void **)(a1 + 32);
    if (v9 - v4 > *(_DWORD *)(a1 + 4) - 5)
    {
      *(_DWORD *)(a1 + 4) = v13 + 256;
      v14 = malloc_type_realloc(v14, v13 + 256, 0x8009A96uLL);
      if (!v14)
      {
        syslog(6, "Insufficient memory");
        exit(69);
      }
      *(_QWORD *)(a1 + 32) = v14;
      v4 = *(_DWORD *)(a1 + 16);
      v6 = *(_QWORD *)(a1 + 24);
      v8 = v4;
    }
    v15 = v9 - v4 + 1;
    memcpy(v14, (const void *)(v6 + v8), v15);
    *(_DWORD *)(a1 + 16) += v15;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + v15) = 0;
  }
  return 1;
}

void sub_10000637C(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_10000CCB0 >= a1)
    vsyslog(7, a2, &a9);
}

uint64_t sub_1000063B8(int a1, uint64_t a2, uint64_t a3, sockaddr *a4)
{
  const char *v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  void *v17;
  xpc_object_t value;
  const char *v19;
  socklen_t v20;
  char string[16];
  _WORD v22[15];

  v20 = 16;
  if (getsockname(a1, a4, &v20))
  {
    v8 = "getsockname() failed (%m)";
LABEL_5:
    v9 = 3;
    goto LABEL_6;
  }
  v20 = 16;
  if (getpeername(a1, (sockaddr *)a3, &v20))
  {
    v8 = "getpeername() failed (%m)";
    goto LABEL_5;
  }
  if (dword_10000C060)
    return 0;
  v11 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0);
  if (v11)
  {
    v12 = v11;
    v13 = xpc_dictionary_create(0, 0, 0);
    v14 = xpc_dictionary_create(0, 0, 0);
    v15 = xpc_dictionary_create(0, 0, 0);
    if (!v13 || !v14 || (v16 = v15) == 0)
    {
      syslog(6, "xpc_dictionary_create failed");
      PFUserRelease(v12, 0);
      return 0xFFFFFFFFLL;
    }
    xpc_dictionary_set_uint64(v13, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v13, kPFProtocol, 6uLL);
    xpc_dictionary_set_uint64(v13, kPFDirection, 2uLL);
    *(_OWORD *)string = 0u;
    memset(v22, 0, sizeof(v22));
    inet_ntop(2, (const void *)(a3 + 4), string, 0x2Eu);
    xpc_dictionary_set_string(v14, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v14, kPFSubLowPort, bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16);
    xpc_dictionary_set_uint64(v14, kPFSubPortOperator, 0);
    *(_OWORD *)string = 0u;
    memset(v22, 0, sizeof(v22));
    inet_ntop(2, &a4->sa_data[2], string, 0x2Eu);
    xpc_dictionary_set_string(v16, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v16, kPFSubLowPort, bswap32(*(unsigned __int16 *)a4->sa_data) >> 16);
    xpc_dictionary_set_uint64(v16, kPFSubPortOperator, 0);
    xpc_dictionary_set_value(v13, kPFFrom, v14);
    xpc_dictionary_set_value(v13, kPFTo, v16);
    v17 = (void *)PFUserNATLook_S(v12, v13);
    xpc_release(v16);
    xpc_release(v14);
    xpc_release(v13);
    PFUserRelease(v12, 0);
    if (v17)
    {
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      value = xpc_dictionary_get_value(v17, kPFNATDest);
      *(_WORD *)(a2 + 2) = bswap32(xpc_dictionary_get_uint64(value, kPFSubLowPort)) >> 16;
      v19 = xpc_dictionary_get_string(value, kPFSubAddress);
      inet_pton(2, v19, (void *)(a2 + 4));
      xpc_release(v17);
      result = 0;
      *(_WORD *)a2 = 528;
      return result;
    }
    v8 = "PFUserNATLook failed";
  }
  else
  {
    v8 = "pf user create failed";
  }
  v9 = 6;
LABEL_6:
  syslog(v9, v8);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000672C(uint64_t a1, int a2, int a3)
{
  _BOOL8 v6;
  ssize_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ssize_t v14;
  int v15;
  const char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  size_t v21;
  ssize_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v31;
  _BOOL8 v32;
  int v33;
  _BYTE v34[4096];

  v33 = 0;
  if (ioctl(a2, 0x40047307uLL) < 0)
  {
    v15 = *__error();
    v31 = a1;
    v16 = "cannot ioctl(SIOCATMARK) socket from %s (%m)";
LABEL_16:
    v17 = 3;
LABEL_29:
    syslog(v17, v16, v31, v32);
    *__error() = v15;
    return 0xFFFFFFFFLL;
  }
  v6 = v33 != 0;
  while (1)
  {
    v7 = recv(a2, v34, 0x1000uLL, v6);
    v14 = v7;
    if (!v6 || v7 != -1)
      break;
    if (*__error() == 22)
    {
      v14 = recv(a2, v34, 0x1000uLL, 0);
      v6 = 0;
      break;
    }
    v6 = 1;
LABEL_10:
    if (*__error() != 35 && *__error() != 4)
    {
      v15 = *__error();
      v31 = a1;
      v32 = v6;
      v16 = "xfer_data (%s): failed (%m) with flags 0%o";
      goto LABEL_16;
    }
  }
  if (v14 == -1)
    goto LABEL_10;
  if (!v14)
  {
    sub_10000637C(3, "EOF on read socket", v8, v9, v10, v11, v12, v13, (char)&v33);
    return 0;
  }
  sub_10000637C(3, "got %d bytes from socket", v8, v9, v10, v11, v12, v13, v14);
  if (v14 < 1)
    return 0;
  v18 = 0;
  LODWORD(v19) = 0;
  do
  {
    v20 = &v34[v18];
    v21 = v14 - v18;
    while (1)
    {
      while (1)
      {
        v22 = send(a3, v20, v21, v6);
        if (v22 != -1)
          break;
        if (*__error() != 35 && *__error() != 4)
        {
          v15 = *__error();
          v16 = "write failed (%m)";
          v17 = 6;
          goto LABEL_29;
        }
      }
      v29 = v22;
      if (v22)
        break;
      sub_10000637C(3, "zero-length write", v23, v24, v25, v26, v27, v28, v31);
    }
    sub_10000637C(3, "wrote %d bytes to socket", v23, v24, v25, v26, v27, v28, v22);
    v19 = (v19 + v29);
    v18 = (int)v19;
  }
  while (v14 > (int)v19);
  return v19;
}

uint64_t sub_1000069A4(int a1, signed int a2, signed int a3, signed int a4, int a5, uint64_t a6)
{
  int v6;
  unsigned int v7;
  signed int v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int ExtName;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  int v43;
  uint64_t v44;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  signed int v69;
  ifaddrs *v70;
  ifaddrs *v71;
  sockaddr *ifa_addr;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  char v87;
  char v88;
  char v89;
  unsigned int v90;
  int v91;
  ifaddrs *v92;
  sockaddr v93;
  char __s1[8];
  uint64_t v95;

  if (a5 == -1)
    v6 = -1;
  else
    v6 = 1;
  v7 = a3 - a2;
  if (a3 < a2)
    goto LABEL_16;
  v9 = a4;
  if (a4 == -1)
    v9 = arc4random() % (v7 + 1) + a2;
  if (v9 < a2 || v9 > a3)
  {
LABEL_16:
    v42 = __error();
    v43 = 22;
LABEL_17:
    *v42 = v43;
    return 0xFFFFFFFFLL;
  }
  *(_QWORD *)__s1 = 0;
  v95 = 0;
  v92 = 0;
  v13 = _NETRBClientCreate(0, 0, 0);
  if (!v13)
  {
    v46 = strerror(12);
    sub_10000637C(1, "_NETRBClientCreate: %s\n", v47, v48, v49, v50, v51, v52, v46);
    *__error() = 22;
    v88 = strerror(12);
    sub_10000637C(1, "unable to attach to server: %s\n", v53, v54, v55, v56, v57, v58, v88);
    return 0xFFFFFFFFLL;
  }
  v20 = v13;
  sub_10000637C(1, "_NETRBClientCreate: %s\n", v14, v15, v16, v17, v18, v19, (char)"OK");
  ExtName = _NETRBClientGetExtName(v20, __s1);
  if (__s1[0])
    v28 = ExtName;
  else
    v28 = 0;
  if ((v28 & 1) != 0)
  {
    sub_10000637C(1, "external interface name from MIS %s", v22, v23, v24, v25, v26, v27, (char)__s1);
    _NETRBClientDestroy(v20);
    if (getifaddrs(&v92))
    {
      v35 = __error();
      v87 = strerror(*v35);
      sub_10000637C(1, "getifaddrs: %s", v36, v37, v38, v39, v40, v41, v87);
      return 0xFFFFFFFFLL;
    }
    v70 = v92;
    if (!v92)
    {
LABEL_47:
      sub_10000637C(1, "unable to get external interface address for %s", v29, v30, v31, v32, v33, v34, (char)__s1);
      freeifaddrs(v92);
      return 0xFFFFFFFFLL;
    }
    v71 = v92;
    while (1)
    {
      if (!strncmp(__s1, v71->ifa_name, 0x10uLL))
      {
        ifa_addr = v71->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 2)
            break;
        }
      }
      v71 = v71->ifa_next;
      if (!v71)
        goto LABEL_47;
    }
    v59 = *(_DWORD *)&ifa_addr->sa_data[2];
    freeifaddrs(v70);
  }
  else
  {
    sub_10000637C(1, "unable to get external interface used by MIS", v22, v23, v24, v25, v26, v27, v86);
    _NETRBClientDestroy(v20);
    v59 = 0;
  }
  if (v7 > 0x7FFFFFFE)
  {
LABEL_40:
    v42 = __error();
    v43 = 35;
    goto LABEL_17;
  }
  v60 = v7 + 1;
  while (1)
  {
    *(_QWORD *)&v93.sa_len = 0;
    *(_QWORD *)&v93.sa_data[6] = 0;
    v91 = 0;
    v61 = socket(2, a1, 0);
    v44 = v61;
    *(_QWORD *)&v93.sa_len = 512;
    *(_QWORD *)&v93.sa_data[6] = 0;
    v62 = v59;
    if ((v28 & 1) == 0)
    {
      v62 = dword_10000C020;
      if (dword_10000C020 == -1)
      {
        if (!a6)
          goto LABEL_30;
        v62 = *(_DWORD *)(a6 + 4);
      }
    }
    *(_DWORD *)&v93.sa_data[2] = v62;
LABEL_30:
    v91 = 1;
    if (setsockopt(v61, 0xFFFF, 4, &v91, 4u) == -1)
    {
      sub_10000637C(1, "failed to set SO_REUSEADDR %s(%d)", v63, v64, v65, v66, v67, v68, (char)__s1);
      return 0xFFFFFFFFLL;
    }
    *(_WORD *)v93.sa_data = bswap32(v9) >> 16;
    if (!bind(v44, &v93, 0x10u))
      break;
    if (*__error() != 48)
      return 0xFFFFFFFFLL;
    close(v44);
    if (v9 + v6 <= a3)
      v69 = v9 + v6;
    else
      v69 = a2;
    if (v9 + v6 >= a2)
      v9 = v69;
    else
      v9 = a3;
    if ((int)--v60 <= 0)
      goto LABEL_40;
  }
  if (a6)
    *(sockaddr *)a6 = v93;
  if (v28)
  {
    v90 = if_nametoindex(__s1);
    if (v90)
    {
      if (setsockopt(v44, 0, 25, &v90, 4u) < 0)
      {
        v79 = __error();
        v89 = strerror(*v79);
        sub_10000637C(1, "setscokopt failed: %s", v80, v81, v82, v83, v84, v85, v89);
      }
    }
    else
    {
      sub_10000637C(1, "if_nametoindex failed for %s", v73, v74, v75, v76, v77, v78, (char)__s1);
    }
  }
  return v44;
}
