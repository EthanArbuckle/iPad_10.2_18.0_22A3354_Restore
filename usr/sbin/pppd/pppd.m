uint64_t sub_1000045E0(const char **a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uid_t v10;
  FILE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  size_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29[256];
  char __s[256];

  byte_10004799D = 1;
  v1 = strdup(*a1);
  if (!v1)
    novm((int)"+ua file name", v2, v3, v4, v5, v6, v7, v8);
  v9 = v1;
  v10 = getuid();
  seteuid(v10);
  v11 = fopen(v9, "r");
  seteuid(0);
  if (!v11)
  {
    option_error("unable to open user login data file %s", v12, v13, v14, v15, v16, v17, v18, (int)v9);
    return 0;
  }
  sub_100006CD8(v11, (int)v9);
  qword_10004A200 = (uint64_t)v9;
  if (!fgets(__s, 255, v11) || !fgets(v29, 255, v11))
  {
    fclose(v11);
    option_error("unable to read user login data file %s", v22, v23, v24, v25, v26, v27, v28, (int)v9);
    return 0;
  }
  fclose(v11);
  v19 = strlen(__s);
  if (v19 && __s[v19 - 1] == 10)
    __s[v19 - 1] = 0;
  v20 = strlen(v29);
  if (v20 && v29[v20 - 1] == 10)
    v29[v20 - 1] = 0;
  if (override_value("user", option_priority, (uint64_t)v9))
    __strlcpy_chk(&user, __s, 256, 256);
  if (override_value("passwd", option_priority, (uint64_t)v9))
    __strlcpy_chk(&passwd, v29, 256, 256);
  return 1;
}

uint64_t sub_1000047B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int vars0;

  option_error("no keychain support", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 1;
}

uint64_t sub_1000047D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int vars0;

  option_error("no keychain support", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 1;
}

uint64_t sub_1000047F8(const char **a1)
{
  group *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int v12;
  uint64_t result;

  v2 = getgrnam(*a1);
  if (v2)
  {
    v10 = ngroups;
    if (ngroups < 1)
    {
      return 1;
    }
    else
    {
      v11 = &groups;
      while (1)
      {
        v12 = *v11++;
        if (v12 == v2->gr_gid)
          break;
        if (!--v10)
          return 1;
      }
      result = 1;
      privileged = 1;
    }
  }
  else
  {
    option_error("group %s is unknown", v3, v4, v5, v6, v7, v8, v9, (int)*a1);
    return 0;
  }
  return result;
}

uint64_t sub_100004890(const char **a1)
{
  const char *v1;
  size_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;

  v1 = *a1;
  v2 = strlen(*a1);
  v3 = malloc_type_malloc(v2 + 17, 0x30F39F66uLL);
  if (!v3)
    novm((int)"allow-ip argument", v4, v5, v6, v7, v8, v9, v10);
  v11 = v3;
  v12 = v3 + 2;
  *v11 = qword_10004A220;
  v11[1] = v12;
  memcpy(v12, v1, v2 + 1);
  qword_10004A220 = (uint64_t)v11;
  return 1;
}

uint64_t sub_100004908(const char **a1)
{
  const char *v1;
  size_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;

  v1 = *a1;
  v2 = strlen(*a1);
  v3 = malloc_type_malloc(v2 + 17, 0x98B3DBFEuLL);
  if (!v3)
    novm((int)"allow-number argument", v4, v5, v6, v7, v8, v9, v10);
  v11 = v3;
  v12 = v3 + 2;
  *v11 = qword_10004A240;
  v11[1] = v12;
  memcpy(v12, v1, v2 + 1);
  qword_10004A240 = (uint64_t)v11;
  return 1;
}

void link_terminated()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  utmpx v9;

  if (phase)
  {
    if (pap_logout_hook)
    {
      pap_logout_hook();
    }
    else if (byte_10004A208 == 1)
    {
      if (devnam ^ 0x7665642F | byte_100048CEC ^ 0x2F)
        v0 = (const char *)&devnam;
      else
        v0 = (const char *)&unk_100048CED;
      bzero(&v9, 0x280uLL);
      v9.ut_type = -16376;
      strncpy(v9.ut_line, v0, 0x20uLL);
      pututxline(&v9);
      byte_10004A208 = 0;
    }
    new_phase(0);
    notice("Connection terminated.", v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t link_down(uint64_t a1)
{
  uint64_t result;
  __int16 *v4;
  __int16 **v5;
  unsigned int v6;
  uint64_t (*v7)(uint64_t);
  uint64_t (*v8)(uint64_t, const char *);
  __int16 *v9;

  result = (uint64_t)notify((uint64_t **)link_down_notifier, 0);
  byte_10004A20C = 0;
  if (byte_10004A210 == 1 && dword_10004A214 == 0)
  {
    update_link_stats(a1);
    byte_10004A210 = 0;
    result = sub_100004BA8("/etc/ppp/auth-down");
  }
  v4 = protocols;
  if (protocols)
  {
    v5 = (__int16 **)&off_100043898;
    do
    {
      if (*((_BYTE *)v4 + 80))
      {
        v6 = (unsigned __int16)*v4;
        if (v6 != 49185)
        {
          v7 = (uint64_t (*)(uint64_t))*((_QWORD *)v4 + 5);
          if (v7)
          {
            result = v7(a1);
            v6 = (unsigned __int16)*v4;
          }
          if (v6 >> 14 <= 2)
          {
            v8 = (uint64_t (*)(uint64_t, const char *))*((_QWORD *)v4 + 7);
            if (v8)
              result = v8(a1, "LCP down");
          }
        }
      }
      v9 = *v5++;
      v4 = v9;
    }
    while (v9);
  }
  dword_10004A218 = 0;
  dword_10004A21C = 0;
  if (phase)
    return new_phase(9);
  return result;
}

uint64_t sub_100004BA8(char *a1)
{
  uid_t v2;
  passwd *v3;
  char *pw_name;
  uint64_t result;
  char *v6[8];
  _BYTE v7[32];
  _BYTE v8[32];

  v6[7] = 0;
  v2 = getuid();
  v3 = getpwuid(v2);
  if (!v3 || (pw_name = v3->pw_name) == 0)
  {
    getuid();
    pw_name = v7;
    slprintf((int)v7, 32, "%d");
  }
  slprintf((int)v8, 32, "%d");
  v6[0] = a1;
  v6[1] = &ifname;
  v6[2] = (char *)&peer_authname;
  v6[3] = pw_name;
  v6[4] = (char *)&devnam;
  v6[5] = v8;
  v6[6] = 0;
  result = run_program(a1, v6, 0, (uint64_t)sub_100007614, 0);
  dword_10004A214 = result;
  return result;
}

void link_established(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v9;
  __int16 **v10;
  void (*v11)(uint64_t);
  __int16 *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;

  v9 = protocols;
  if (protocols)
  {
    v10 = (__int16 **)&off_100043898;
    do
    {
      if ((unsigned __int16)*v9 != 49185)
      {
        if (*((_BYTE *)v9 + 80))
        {
          v11 = (void (*)(uint64_t))*((_QWORD *)v9 + 4);
          if (v11)
            v11(a1);
        }
      }
      v12 = *v10++;
      v9 = v12;
    }
    while (v12);
  }
  v13 = auth_required;
  if (auth_required)
    v14 = 1;
  else
    v14 = qword_10004A220 == 0;
  if (!v14)
  {
    sub_10000500C((_QWORD *)a1, 0, 0);
    v13 = auth_required;
  }
  if (v13
    && !lcp_gotoptions[68 * (int)a1 + 5]
    && !lcp_gotoptions[68 * (int)a1 + 6]
    && !lcp_gotoptions[68 * (int)a1 + 7])
  {
    if (qword_10004A220)
    {
      sub_10000500C((_QWORD *)a1, 0, 0);
    }
    else
    {
      if (*((_BYTE *)&lcp_wantoptions + 68 * (int)a1 + 5))
        v36 = uselogin == 0;
      else
        v36 = 0;
      if (!v36 || !sub_100005404((_QWORD *)a1))
      {
        warning("peer refused to authenticate: terminating link", a2, a3, a4, a5, a6, a7, a8, v43);
        lcp_close(a1, "peer refused to authenticate", v37, v38, v39, v40, v41, v42);
        *(_DWORD *)status = 11;
        return;
      }
    }
  }
  new_phase(5);
  if (lcp_gotoptions[68 * (int)a1 + 7])
  {
    EapAuthPeer(a1, (uint64_t)&our_name, v16, v17, v18, v19, v20, v21);
    v22 = 0;
    v23 = 32;
  }
  else if (lcp_gotoptions[68 * (int)a1 + 6])
  {
    v24 = lcp_gotoptions[68 * (int)a1 + 24];
    if ((v24 & 1) != 0)
    {
      v25 = 129;
    }
    else if ((v24 & 2) != 0)
    {
      v25 = 128;
    }
    else
    {
      v25 = (v24 << 29 >> 31) & 5;
    }
    chap_auth_peer(a1, (uint64_t)&our_name, v25, v17, v18, v19, v20, v21, v43);
    v22 = 0;
    v23 = 8;
  }
  else if (lcp_gotoptions[68 * (int)a1 + 5])
  {
    upap_authpeer(a1);
    v22 = 0;
    v23 = 2;
  }
  else
  {
    v23 = 0;
    v22 = 1;
  }
  if (lcp_hisoptions[68 * (int)a1 + 7])
  {
    EapAuthWithPeer(a1);
    v26 = 16;
LABEL_44:
    v23 |= v26;
    dword_10004A22C[(int)a1] = v23;
    auth_done[(int)a1] = 0;
LABEL_45:
    notify((uint64_t **)auth_start_notify, v23);
    return;
  }
  if (lcp_hisoptions[68 * (int)a1 + 6])
  {
    v27 = lcp_hisoptions[68 * (int)a1 + 24];
    if ((v27 & 1) != 0)
    {
      v28 = 129;
    }
    else if ((v27 & 2) != 0)
    {
      v28 = 128;
    }
    else
    {
      v28 = (v27 << 29 >> 31) & 5;
    }
    chap_auth_with_peer(a1, (uint64_t)&user, v28, v17, v18, v19, v20, v21, v43);
    v26 = 4;
    goto LABEL_44;
  }
  if (lcp_hisoptions[68 * (int)a1 + 5])
  {
    if (!(_BYTE)passwd)
    {
      byte_10004A228 = 1;
      if (!sub_100005560((char *)&passwd))
        error("No secret found for PAP login", v29, v30, v31, v32, v33, v34, v35, v43);
    }
    upap_authwithpeer(a1, &user, (const char *)&passwd);
    v26 = 1;
    goto LABEL_44;
  }
  dword_10004A22C[(int)a1] = v23;
  auth_done[(int)a1] = 0;
  if ((v22 & 1) == 0)
    goto LABEL_45;
  sub_10000566C(a1, v15, v16, v17, v18, v19, v20, v21);
}

_QWORD *sub_10000500C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;
  void *v7;
  _QWORD *result;
  _QWORD *v9;
  int i;
  _QWORD *v11;
  int v12;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  char *v19;
  int v20;
  _DWORD *v21;
  char *v22;
  char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  hostent *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  netent *v44;
  uint64_t v45;
  int v46;
  int v47;
  unsigned int v48;
  int v49;
  int v50;
  char *v51;
  int v52;
  BOOL v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  _DWORD *v58;
  unsigned int v59;
  _QWORD *v60;
  uint64_t v61;
  int v62;
  char *__endptr;
  _QWORD *v64;

  v4 = a2;
  v64 = a2;
  v6 = (int)a1;
  v7 = (void *)qword_10004A238[(int)a1];
  if (v7)
    free(v7);
  qword_10004A238[v6] = 0;
  result = (_QWORD *)qword_10004A248;
  if (qword_10004A248)
  {
    do
    {
      v9 = (_QWORD *)*result;
      free(result);
      result = v9;
    }
    while (v9);
  }
  qword_10004A248 = a3;
  for (i = 0; v4; v4 = (_QWORD *)*v4)
    ++i;
  v11 = (_QWORD *)qword_10004A220;
  if (qword_10004A220)
  {
    v12 = 0;
    do
    {
      ++v12;
      v11 = (_QWORD *)*v11;
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v13 = v12 + i;
  if (v13)
  {
    result = malloc_type_malloc(12 * (v13 + 1), 0x10000403E1C8BA9uLL);
    if (result)
    {
      v14 = result;
      v60 = a1;
      v61 = v6;
      v15 = &v64;
      do
      {
        v16 = v15;
        v15 = (_QWORD *)*v15;
      }
      while (v15);
      *v16 = qword_10004A220;
      v17 = v64;
      if (v64)
      {
        v62 = 0;
        v18 = 0;
        while (1)
        {
          v19 = (char *)v17[1];
          if (!strcmp(v19, "-"))
            goto LABEL_65;
          v20 = strcmp(v19, "*");
          v21 = (_DWORD *)v14 + 3 * v18;
          *v21 = 1;
          if (!v20)
          {
            v54 = (char *)v14 + 12 * v18;
            *((_DWORD *)v54 + 1) = 0;
            *((_DWORD *)v54 + 2) = 0;
            ++v18;
            goto LABEL_65;
          }
          if (*v19 == 33)
          {
            *v21 = 0;
            ++v19;
          }
          v22 = strchr(v19, 47);
          v23 = v22;
          if (v22)
          {
            __endptr = 0;
            v24 = strtol(v22 + 1, &__endptr, 10);
            v31 = "invalid address length %v in auth. address list";
            if ((v24 - 33) < 0xFFFFFFE0
              || ((v32 = *__endptr, v32 != 43)
                ? (v33 = 0)
                : (v33 = ifunit + 1, v32 = __endptr[1]),
                  v31 = "invalid address length syntax: %v",
                  v32))
            {
              warning(v31, (uint64_t)v31, v25, v26, v27, v28, v29, v30, (_DWORD)v23 + 1);
              goto LABEL_61;
            }
            *v23 = 0;
            v34 = (-1 << (32 - v24));
          }
          else
          {
            v33 = 0;
            v34 = 0xFFFFFFFFLL;
          }
          v35 = gethostbyname(v19);
          if (v35 && v35->h_addrtype == 2)
          {
            v43 = **(unsigned int **)v35->h_addr_list;
            if (v23)
              goto LABEL_48;
          }
          else
          {
            v44 = getnetbyname(v19);
            if (!v44 || v44->n_addrtype != 2)
            {
              v43 = inet_addr(v19);
              if (!v23)
                goto LABEL_49;
LABEL_48:
              *v23 = 47;
              goto LABEL_49;
            }
            v45 = htonl(v44->n_net);
            v43 = v45;
            if (v23)
              goto LABEL_48;
            v46 = ntohl(v45);
            if (v46 >> 29 == 6)
              v47 = -256;
            else
              v47 = v34;
            if (v46 >> 30 == 2)
              v48 = -65536;
            else
              v48 = v47;
            if (v46 < 0)
              v34 = v48;
            else
              v34 = 4278190080;
          }
LABEL_49:
          if ((_DWORD)v43 == -1)
          {
            warning("unknown host %s in auth. address list", v36, v37, v38, v39, v40, v41, v42, v17[1]);
          }
          else
          {
            if (!v33)
              goto LABEL_53;
            if (v33 < ~(_DWORD)v34)
            {
              v49 = ntohl(v43);
              LODWORD(v43) = htonl((v49 & v34) + v33);
              v34 = 0xFFFFFFFFLL;
LABEL_53:
              v50 = htonl(v34);
              v51 = (char *)v14 + 12 * v18;
              *((_DWORD *)v51 + 1) = v50 & v43;
              *((_DWORD *)v51 + 2) = v50;
              ++v18;
              v52 = v62;
              if (v62)
                v53 = 0;
              else
                v53 = (_DWORD)v34 == -1;
              if (v53)
                v52 = v43;
              v62 = v52;
              goto LABEL_61;
            }
            warning("interface unit %d too large for subnet %v", v36, v37, v38, v39, v40, v41, v42, ifunit);
          }
LABEL_61:
          v17 = (_QWORD *)*v17;
          if (!v17)
            goto LABEL_65;
        }
      }
      v62 = 0;
      v18 = 0;
LABEL_65:
      *v16 = 0;
      v55 = (char *)v14 + 12 * v18;
      *(_QWORD *)v55 = 0;
      *((_DWORD *)v55 + 2) = 0;
      result = v60;
      qword_10004A238[v61] = v14;
      if (v62)
      {
        v56 = (char *)&ipcp_wantoptions + 52 * (int)v61;
        v59 = *((_DWORD *)v56 + 8);
        v58 = v56 + 32;
        v57 = v59;
        if (!v59 || (result = (_QWORD *)auth_ip_addr((int)v60, v57), !(_DWORD)result))
        {
          *v58 = v62;
          if (v18 >= 2)
            *((_BYTE *)&ipcp_wantoptions + 52 * (int)v61 + 8) = 1;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100005404(_QWORD *a1)
{
  uint64_t v2;
  FILE *v3;
  FILE *v4;
  BOOL v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  char v13[1024];

  v11 = 0;
  v12 = 0;
  if (null_auth_hook)
  {
    v2 = null_auth_hook(&v12, &v11);
    if ((int)v2 > 0)
      goto LABEL_11;
  }
  v12 = 0;
  v3 = fopen("/etc/ppp/pap-secrets", "r");
  if (!v3)
    return 0;
  v4 = v3;
  sub_100006CD8(v3, (int)"/etc/ppp/pap-secrets");
  v5 = (int)sub_100006D4C(v4, (const char *)&unk_100032B1A, &our_name, v13, &v12, &v11, (int)"/etc/ppp/pap-secrets", 0) >= 0
    && v13[0] == 0;
  v2 = v5;
  bzero(v13, 0x400uLL);
  fclose(v4);
  if ((_DWORD)v2 == 1)
  {
LABEL_11:
    sub_10000500C(a1, v12, (uint64_t)v11);
  }
  else
  {
    v9 = v11;
    if (v11)
    {
      do
      {
        v10 = (_QWORD *)*v9;
        free(v9);
        v9 = v10;
      }
      while (v10);
    }
    else
    {
      v2 = 0;
    }
  }
  v6 = v12;
  if (v12)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      free(v6);
      v6 = v7;
    }
    while (v7);
  }
  return v2;
}

uint64_t sub_100005560(char *a1)
{
  uint64_t result;
  FILE *v3;
  const char *v4;
  int v5;
  char __source[1024];

  if (!pap_passwd_hook || (result = pap_passwd_hook(&user, a1), (result & 0x80000000) != 0))
  {
    result = (uint64_t)fopen("/etc/ppp/pap-secrets", "r");
    if (result)
    {
      v3 = (FILE *)result;
      sub_100006CD8((FILE *)result, (int)"/etc/ppp/pap-secrets");
      if (remote_name)
        v4 = &remote_name;
      else
        v4 = 0;
      v5 = sub_100006D4C(v3, &user, v4, __source, 0, 0, (int)"/etc/ppp/pap-secrets", 0);
      fclose(v3);
      if (v5 < 0)
      {
        return 0;
      }
      else
      {
        if (a1)
          strlcpy(a1, __source, 0x100uLL);
        return 1;
      }
    }
  }
  return result;
}

void sub_10000566C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v10;
  _QWORD *v11;

  if ((phase - 7) >= 2)
  {
    if (remote_number)
      notice("peer from calling number %q authorized", a2, a3, a4, a5, a6, a7, a8, (int)&remote_number);
    if (lcp_gotoptions[68 * a1 + 6] || lcp_gotoptions[68 * a1 + 5] || lcp_gotoptions[68 * a1 + 7])
    {
      notify((uint64_t **)auth_up_notifier, 0);
      byte_10004A20C = 1;
      if ((byte_10004A210 & 1) == 0 && !dword_10004A214)
      {
        byte_10004A210 = 1;
        sub_100004BA8("/etc/ppp/auth-up");
      }
    }
    if (qword_10004A248)
    {
      options_from_list(qword_10004A248, 1);
      v10 = (_QWORD *)qword_10004A248;
      if (qword_10004A248)
      {
        do
        {
          v11 = (_QWORD *)*v10;
          free(v10);
          v10 = v11;
        }
        while (v11);
      }
      qword_10004A248 = 0;
    }
    start_networks(a1);
  }
}

BOOL unexpected_network_packet(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  v8 = phase;
  if (phase == 5 && (a2 & 0x8000) != 0 && lcp_hisoptions[68 * a1 + 7])
  {
    EapLostSuccess(a1, a2, a3, a4, a5, a6, a7, a8);
    v8 = phase;
  }
  return v8 < 6;
}

void start_networks(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 *v10;
  __int16 **v11;
  int v12;
  uint64_t (*v14)(_QWORD);
  __int16 *v15;

  v2 = new_phase(7);
  v10 = protocols;
  if (protocols)
  {
    v11 = (__int16 **)&off_100043898;
    do
    {
      v12 = (unsigned __int16)*v10;
      if (v12 == 33021 || v12 == 32851)
      {
        if (*((_BYTE *)v10 + 80))
        {
          v14 = (uint64_t (*)(_QWORD))*((_QWORD *)v10 + 6);
          if (v14)
            v2 = v14(0);
        }
      }
      v15 = *v11++;
      v10 = v15;
    }
    while (v15);
  }
  if (!(ecp_gotoptions[8 * a1] | ccp_gotoptions[14 * a1 + 6]))
    continue_networks(v2, v3, v4, v5, v6, v7, v8, v9);
}

void continue_networks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v8;
  __int16 **v9;
  int v10;
  __int16 *v13;
  void (*v14)(_QWORD);

  v8 = protocols;
  if (protocols)
  {
    v9 = (__int16 **)&off_100043898;
    do
    {
      v10 = (unsigned __int16)*v8;
      if ((unsigned __int16)((unsigned __int16)*v8 >> 14) <= 2u && v10 != 32851 && v10 != 33021)
      {
        if (*((_BYTE *)v8 + 80))
        {
          v14 = (void (*)(_QWORD))*((_QWORD *)v8 + 6);
          if (v14)
          {
            v14(0);
            ++dword_10004A218;
          }
        }
      }
      v13 = *v9++;
      v8 = v13;
    }
    while (v13);
  }
  if (!dword_10004A218)
    lcp_close(0, "No network protocols running", a3, a4, a5, a6, a7, a8);
}

void check_protocols_ready()
{
  __int16 *v0;
  __int16 **v1;
  int v2;
  BOOL v3;
  BOOL v4;
  __int16 *v5;
  int v6;

  if (dword_10004A218)
  {
    v0 = protocols;
    if (protocols)
    {
      v1 = (__int16 **)&off_100043898;
      while (1)
      {
        v2 = (unsigned __int16)*v0;
        v3 = (unsigned __int16)((unsigned __int16)*v0 >> 14) > 2u || v2 == 32851;
        v4 = v3 || v2 == 33021;
        if (!v4 && *((_BYTE *)v0 + 80) && *((_QWORD *)v0 + 6))
        {
          v6 = (*((uint64_t (**)(_QWORD))v0 + 19))(0);
          if (v6 != 9 && v6 != 3)
            break;
        }
        v5 = *v1++;
        v0 = v5;
        if (!v5)
          goto LABEL_21;
      }
    }
    else
    {
LABEL_21:
      notify((uint64_t **)protocolsready_notifier, 0);
    }
  }
}

void auth_peer_fail(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  lcp_close(a1, "Authentication failed", a3, a4, a5, a6, a7, a8);
  *(_DWORD *)status = 11;
}

void auth_peer_success(int a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  _DWORD v32[2];
  uint64_t v33;
  uint64_t v34;

  LODWORD(v5) = a5;
  if (acl_hook && !acl_hook(a4, a5))
  {
    lcp_close(a1, "Authorization failed", v10, v11, v12, v13, v14, v15);
    *(_DWORD *)status = 23;
    return;
  }
  v32[0] = a2;
  v32[1] = a3;
  v33 = a4;
  v34 = v5;
  notify_with_ptr((uint64_t **)auth_peer_success_notify, (uint64_t)v32);
  switch(a2)
  {
    case 49187:
      v23 = 2;
      break;
    case 49703:
      v23 = 32;
      break;
    case 49699:
      switch(a3)
      {
        case 129:
          v23 = 2056;
          break;
        case 128:
          v23 = 520;
          break;
        case 5:
          v23 = 136;
          break;
        default:
          v23 = 8;
          break;
      }
      break;
    default:
      warning("auth_peer_success: unknown protocol %x", v16, v17, v18, v19, v20, v21, v22, a2);
      return;
  }
  if (v5 >= 0xFF)
    v5 = 255;
  else
    v5 = v5;
  __memcpy_chk(peer_authname, a4, v5, 256);
  peer_authname[v5] = 0;
  script_setenv("PEERNAME", peer_authname);
  auth_done[a1] |= v23;
  v31 = (dword_10004A22C[a1] & ~v23) == 0;
  dword_10004A22C[a1] &= ~v23;
  if (v31)
    sub_10000566C(a1, v24, v25, v26, v27, v28, v29, v30);
}

void auth_withpeer_fail(int a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  notify((uint64_t **)auth_withpeer_fail_notify, a2);
  if (byte_10004A228 == 1)
  {
    xmmword_1000495E4 = 0u;
    unk_1000495F4 = 0u;
    xmmword_1000495C4 = 0u;
    unk_1000495D4 = 0u;
    xmmword_1000495A4 = 0u;
    unk_1000495B4 = 0u;
    xmmword_100049584 = 0u;
    unk_100049594 = 0u;
    xmmword_100049564 = 0u;
    unk_100049574 = 0u;
    xmmword_100049544 = 0u;
    unk_100049554 = 0u;
    xmmword_100049524 = 0u;
    unk_100049534 = 0u;
    passwd = 0u;
    unk_100049514 = 0u;
  }
  lcp_close(a1, "Failed to authenticate ourselves to peer", v3, v4, v5, v6, v7, v8);
  *(_DWORD *)status = 19;
}

void auth_withpeer_cancelled(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004A228 == 1)
  {
    xmmword_1000495E4 = 0u;
    unk_1000495F4 = 0u;
    xmmword_1000495C4 = 0u;
    unk_1000495D4 = 0u;
    xmmword_1000495A4 = 0u;
    unk_1000495B4 = 0u;
    xmmword_100049584 = 0u;
    unk_100049594 = 0u;
    xmmword_100049564 = 0u;
    unk_100049574 = 0u;
    xmmword_100049544 = 0u;
    unk_100049554 = 0u;
    xmmword_100049524 = 0u;
    unk_100049534 = 0u;
    passwd = 0u;
    unk_100049514 = 0u;
  }
  lcp_close(a1, "User cancelled authentication", a3, a4, a5, a6, a7, a8);
  *(_DWORD *)status = 5;
}

void auth_withpeer_success(int a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;

  notify((uint64_t **)auth_withpeer_success_notify, a2);
  switch(a2)
  {
    case 49187:
      if (byte_10004A228 == 1)
      {
        xmmword_1000495E4 = 0u;
        unk_1000495F4 = 0u;
        xmmword_1000495C4 = 0u;
        unk_1000495D4 = 0u;
        xmmword_1000495A4 = 0u;
        unk_1000495B4 = 0u;
        xmmword_100049584 = 0u;
        unk_100049594 = 0u;
        xmmword_100049564 = 0u;
        unk_100049574 = 0u;
        xmmword_100049544 = 0u;
        unk_100049554 = 0u;
        xmmword_100049524 = 0u;
        unk_100049534 = 0u;
        passwd = 0u;
        unk_100049514 = 0u;
      }
      v13 = 1;
      break;
    case 49703:
      v13 = 16;
      break;
    case 49699:
      switch(a3)
      {
        case 129:
          v13 = 1028;
          break;
        case 128:
          v13 = 260;
          break;
        case 5:
          v13 = 68;
          break;
        default:
          v13 = 4;
          break;
      }
      break;
    default:
      warning("auth_withpeer_success: unknown protocol %x", v6, v7, v8, v9, v10, v11, v12, a2);
      v13 = 0;
      break;
  }
  auth_done[a1] |= v13;
  v14 = dword_10004A22C[a1] & ~v13;
  dword_10004A22C[a1] = v14;
  if (!v14)
    sub_10000566C(a1, v6, v7, v8, v9, v10, v11, v12);
}

void option_change_idle()
{
  int v0;

  untimeout((uint64_t)check_idle, 0);
  if (phase == 8)
  {
    if (idle_time_hook)
      v0 = idle_time_hook(0);
    else
      v0 = idle_time_limit;
    if (v0 >= 1)
      timeout((int)check_idle);
  }
}

void check_idle()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = 0;
  if (get_idle_time(0, (uint64_t)&v15))
  {
    if (idle_time_hook)
    {
      v6 = idle_time_hook(&v15);
    }
    else
    {
      if (noidlerecv)
      {
        v7 = v15;
      }
      else if (noidlesend)
      {
        v7 = HIDWORD(v15);
      }
      else
      {
        v7 = v15;
        if (v15 >= HIDWORD(v15))
          v7 = HIDWORD(v15);
      }
      v6 = (idle_time_limit - v7);
    }
    if ((int)v6 <= 0)
    {
      notice("Terminating connection due to lack of activity.", v0, v6, v1, v2, v3, v4, v5, v14);
      lcp_close(0, "Link inactive", v8, v9, v10, v11, v12, v13);
      need_holdoff = 0;
      *(_DWORD *)status = 12;
    }
    else
    {
      timeout((int)check_idle);
    }
  }
}

void np_up()
{
  int v0;
  BOOL v1;

  if (!dword_10004A21C)
  {
    *(_DWORD *)status = 0;
    unsuccess = 0;
    new_phase(8);
    if (idle_time_hook)
      v0 = idle_time_hook(0);
    else
      v0 = idle_time_limit;
    if (v0 >= 1)
      timeout((int)check_idle);
    if (maxconnect >= 1)
      timeout((int)sub_100006048);
    if (updetach)
      v1 = nodetach == 0;
    else
      v1 = 0;
    if (v1)
      detach();
  }
  ++dword_10004A21C;
  check_protocols_ready();
}

void sub_100006048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  info("Connect time expired", a2, a3, a4, a5, a6, a7, a8, v14);
  lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13);
  *(_DWORD *)status = 13;
}

void np_down()
{
  if (!--dword_10004A21C)
  {
    untimeout((uint64_t)check_idle, 0);
    untimeout((uint64_t)sub_100006048, 0);
    if (phase != 9)
      new_phase(7);
  }
}

void np_finished(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_10004A218-- <= 1)
    lcp_close(0, "No network protocols running", a3, a4, a5, a6, a7, a8);
  check_protocols_ready();
}

void auth_hold()
{
  untimeout((uint64_t)check_idle, 0);
  untimeout((uint64_t)sub_100006048, 0);
}

void auth_cont()
{
  int v0;

  if (idle_time_hook)
    v0 = idle_time_hook(0);
  else
    v0 = idle_time_limit;
  if (v0 >= 1)
    timeout((int)check_idle);
  if (maxconnect >= 1)
    timeout((int)sub_100006048);
}

uint64_t auth_check_options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  const char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  char *v33;
  int v34;
  int v35;
  int v36;

  if (our_name)
    v8 = usehostname == 0;
  else
    v8 = 0;
  if (!v8)
    __strlcpy_chk(&our_name, hostname, 256, 256);
  if (!user)
    __strlcpy_chk(&user, &our_name, 256, 256);
  if (!(auth_required | allow_any_ip) && have_route_to() && !privileged)
  {
    auth_required = 1;
    byte_10004A230 = 1;
  }
  if (byte_100047928)
    byte_100047916 = 1;
  if (!auth_required)
  {
    byte_100047928 = 0;
    *(_WORD *)&byte_100047915 = 0;
    byte_100047917 = 0;
    goto LABEL_19;
  }
  allow_any_ip = 0;
  if (!byte_100047916)
  {
    if (byte_100047915)
    {
LABEL_28:
      v36 = 0;
      goto LABEL_29;
    }
    if (!byte_100047917)
    {
      byte_100047928 = 7;
      *(_WORD *)&byte_100047915 = 257;
      byte_100047917 = 1;
      goto LABEL_28;
    }
LABEL_19:
    v36 = 0;
    goto LABEL_20;
  }
  v36 = 0;
  if (!byte_100047915)
    goto LABEL_21;
LABEL_29:
  if (uselogin || sub_10000645C(&v36))
    goto LABEL_34;
  if (byte_100047916)
  {
LABEL_21:
    if (explicit_remote)
      v9 = &remote_name;
    else
      v9 = 0;
    if (sub_100006564(v9, &our_name, 1, &v36) || byte_100047917)
      goto LABEL_34;
    goto LABEL_32;
  }
LABEL_20:
  if (byte_100047917)
    goto LABEL_21;
LABEL_32:
  if (auth_required && !qword_10004A220)
  {
    if (byte_10004A230 == 1)
    {
      option_error("By default the remote system is required to authenticate itself", a2, a3, a4, a5, a6, a7, a8, (int)v33);
      v18 = "(because this system has a default route to the internet)";
    }
    else if (explicit_remote)
    {
      v33 = &remote_name;
      v18 = "The remote system (%s) is required to authenticate itself";
    }
    else
    {
      v18 = "The remote system is required to authenticate itself";
    }
    option_error(v18, a2, a3, a4, a5, a6, a7, a8, (int)v33);
    option_error("but I couldn't find any suitable secret (password) for it to use to do so.", v19, v20, v21, v22, v23, v24, v25, v34);
    if (v36)
      option_error("(None of the available passwords would let it use an IP address.)", v26, v27, v28, v29, v30, v31, v32, v35);
    exit(1);
  }
LABEL_34:
  result = auth_number();
  if (!(_DWORD)result)
  {
    warning("calling number %q is not authorized", v11, v12, v13, v14, v15, v16, v17, (int)&remote_number);
    exit(24);
  }
  return result;
}

FILE *sub_10000645C(_DWORD *a1)
{
  FILE *result;
  FILE *v3;
  const char *v4;
  int v5;
  _QWORD *v6;
  void **v7;
  int v8;
  _QWORD *v9;
  void *v10;

  if (pap_check_hook)
  {
    result = (FILE *)pap_check_hook();
    if ((result & 0x80000000) == 0)
      return result;
  }
  result = fopen("/etc/ppp/pap-secrets", "r");
  if (!result)
    return result;
  v3 = result;
  v10 = 0;
  if (explicit_remote)
    v4 = &remote_name;
  else
    v4 = 0;
  v5 = sub_100006D4C(result, v4, &our_name, 0, &v10, 0, (int)"/etc/ppp/pap-secrets", 0);
  fclose(v3);
  v6 = v10;
  if ((v5 & 0x80000000) == 0)
  {
    if (v10)
    {
      v7 = (void **)v10;
      while (1)
      {
        v8 = *(unsigned __int8 *)v7[1];
        if (v8 != 33)
          break;
        v7 = (void **)*v7;
        if (!v7)
          goto LABEL_14;
      }
      if (v8 != 45)
        goto LABEL_17;
    }
LABEL_14:
    if (a1)
      *a1 = 1;
  }
  v5 = -1;
LABEL_17:
  if (v6)
  {
    do
    {
      v9 = (_QWORD *)*v6;
      free(v6);
      v6 = v9;
    }
    while (v9);
  }
  return (FILE *)(v5 >= 0);
}

FILE *sub_100006564(const char *a1, const char *a2, int a3, _DWORD *a4)
{
  FILE *result;
  FILE *v9;
  int v10;
  _QWORD *v11;
  void **v12;
  int v13;
  _QWORD *v14;
  void *v15;

  if (!chap_check_hook || (result = (FILE *)chap_check_hook(), (result & 0x80000000) != 0))
  {
    result = fopen("/etc/ppp/chap-secrets", "r");
    if (result)
    {
      v9 = result;
      if (a1 && !*a1)
      {
        a1 = 0;
      }
      else if (a2 && !*a2)
      {
        a2 = 0;
      }
      v15 = 0;
      v10 = sub_100006D4C(result, a1, a2, 0, &v15, 0, (int)"/etc/ppp/chap-secrets", 0);
      fclose(v9);
      v11 = v15;
      if (a3 && (v10 & 0x80000000) == 0)
      {
        if (!v15)
          goto LABEL_19;
        v12 = (void **)v15;
        while (1)
        {
          v13 = *(unsigned __int8 *)v12[1];
          if (v13 != 33)
            break;
          v12 = (void **)*v12;
          if (!v12)
            goto LABEL_19;
        }
        if (v13 == 45)
        {
LABEL_19:
          if (a4)
            *a4 = 1;
          v10 = -1;
        }
      }
      if (v11)
      {
        do
        {
          v14 = (_QWORD *)*v11;
          free(v11);
          v11 = v14;
        }
        while (v14);
      }
      return (FILE *)(v10 >= 0);
    }
  }
  return result;
}

uint64_t auth_number()
{
  uint64_t v0;
  int v1;

  v0 = qword_10004A240;
  if (qword_10004A240)
  {
    while (1)
    {
      v1 = strlen(*(const char **)(v0 + 8));
      if (!strncasecmp(*(const char **)(v0 + 8), &remote_number, v1 - (*(_BYTE *)(*(_QWORD *)(v0 + 8) + v1 - 1) == 42)))
        break;
      v0 = *(_QWORD *)v0;
      if (!v0)
        return 0;
    }
  }
  return 1;
}

uint64_t auth_reset(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  BOOL v3;
  BOOL v5;
  const char *v6;
  char *v7;
  char *v8;
  _BYTE *v9;
  int v10;
  BOOL v11;
  char *v12;
  _BYTE *v13;
  int v14;
  const char *v15;

  v1 = (int)result;
  if (refuse_pap)
  {
    v2 = 0;
  }
  else if ((_BYTE)passwd)
  {
    v2 = 1;
  }
  else
  {
    result = sub_100005560(0);
    v2 = (_DWORD)result != 0;
  }
  *((_BYTE *)&lcp_allowoptions + 68 * (int)v1 + 5) = v2;
  if (refuse_chap)
    v3 = refuse_mschap == 0;
  else
    v3 = 1;
  if (v3 || refuse_mschap_v2 == 0)
  {
    if ((_BYTE)passwd)
    {
      v5 = 1;
    }
    else
    {
      if (explicit_remote)
        v6 = &remote_name;
      else
        v6 = 0;
      result = (uint64_t)sub_100006564(&user, v6, 0, 0);
      v5 = (_DWORD)result != 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = (char *)&lcp_allowoptions + 68 * v1;
  v7[6] = v5;
  v7[7] = refuse_eap == 0;
  v8 = (char *)&lcp_gotoptions + 68 * v1;
  v10 = v8[5];
  v9 = v8 + 5;
  if (v10)
    v11 = uselogin == 0;
  else
    v11 = 0;
  if (v11)
  {
    result = (uint64_t)sub_10000645C(0);
    if (!(_DWORD)result)
      *v9 = 0;
  }
  v12 = (char *)&lcp_gotoptions + 68 * (int)v1;
  v14 = v12[6];
  v13 = v12 + 6;
  if (v14)
  {
    if (explicit_remote)
      v15 = &remote_name;
    else
      v15 = 0;
    result = (uint64_t)sub_100006564(v15, &our_name, 1, 0);
    if (!(_DWORD)result)
      *v13 = 0;
  }
  return result;
}

uint64_t check_passwd(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  int v8;
  int v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  FILE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FILE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  passwd *v41;
  const char *pw_passwd;
  char *v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  char __s2[1024];
  char v69[256];
  char __s1[16];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  utmpx v86;

  v66 = 0;
  v67 = 0;
  slprintf((int)__s1, 256, "%.*v");
  slprintf((int)v69, 256, "%.*v");
  *a6 = &unk_100032B1A;
  if (pap_auth_hook)
  {
    v8 = pap_auth_hook(v69, __s1, a6, &v67, &v66);
    if ((v8 & 0x80000000) == 0)
    {
      v9 = v8;
      if (v8)
        sub_10000500C(a1, v67, (uint64_t)v66);
      v85 = 0u;
      v84 = 0u;
      v83 = 0u;
      v82 = 0u;
      v81 = 0u;
      v80 = 0u;
      v79 = 0u;
      v78 = 0u;
      v77 = 0u;
      v76 = 0u;
      v75 = 0u;
      v74 = 0u;
      v73 = 0u;
      v72 = 0u;
      v71 = 0u;
      *(_OWORD *)__s1 = 0u;
      v10 = v67;
      if (v67)
      {
        do
        {
          v11 = (_QWORD *)*v10;
          free(v10);
          v10 = v11;
        }
        while (v11);
      }
      v12 = v66;
      if (v66)
      {
        do
        {
          v13 = (_QWORD *)*v12;
          free(v12);
          v12 = v13;
        }
        while (v13);
      }
      if (v9)
        return 2;
      else
        return 3;
    }
  }
  v66 = 0;
  v67 = 0;
  v15 = fopen("/etc/ppp/pap-secrets", "r");
  if (!v15)
  {
    error("Can't open PAP password file %s: %m", v16, v17, v18, v19, v20, v21, v22, (int)"/etc/ppp/pap-secrets");
    goto LABEL_36;
  }
  v23 = v15;
  sub_100006CD8(v15, (int)"/etc/ppp/pap-secrets");
  if ((sub_100006D4C(v23, v69, &our_name, __s2, &v67, &v66, (int)"/etc/ppp/pap-secrets", 0) & 0x80000000) != 0)
  {
    warning("no PAP secret found for %s", v24, v25, v26, v27, v28, v29, v30, (int)v69);
LABEL_34:
    fclose(v23);
    goto LABEL_36;
  }
  v32 = *(_DWORD *)__s2 != 1735355456 || *(_DWORD *)&__s2[3] != 7235943;
  if (uselogin || !v32)
  {
    v41 = getpwnam(v69);
    endpwent();
    if (!v41 || (pw_passwd = v41->pw_passwd) == 0 || strlen(v41->pw_passwd) < 2)
    {
      v33 = 1;
      goto LABEL_29;
    }
    v57 = crypt(__s1, pw_passwd);
    v33 = 1;
    if (strcmp(v57, v41->pw_passwd))
      goto LABEL_29;
    if (devnam ^ 0x7665642F | byte_100048CEC ^ 0x2F)
      v58 = (const char *)&devnam;
    else
      v58 = (const char *)&unk_100048CED;
    bzero(&v86, 0x280uLL);
    v86.ut_type = -32762;
    strncpy(v86.ut_line, v58, 0x20uLL);
    pututxline(&v86);
    info("user %s logged in", v59, v60, v61, v62, v63, v64, v65, (int)v69);
    byte_10004A208 = 1;
  }
  v33 = 0;
LABEL_29:
  if (__s2[0] && v32 && (cryptpap || strcmp(__s1, __s2)))
  {
    v43 = crypt(__s1, __s2);
    if (strcmp(v43, __s2))
      goto LABEL_34;
  }
  fclose(v23);
  if (!v33)
  {
    dword_10004A234 = 0;
    if (!*(_BYTE *)*a6)
      *a6 = "Login ok";
    sub_10000500C(a1, v67, (uint64_t)v66);
    v14 = 2;
    goto LABEL_45;
  }
LABEL_36:
  if (!*(_BYTE *)*a6)
    *a6 = "Login incorrect";
  v44 = dword_10004A234;
  v45 = ++dword_10004A234;
  if (v44 >= 10)
  {
    warning("%d LOGIN FAILURES ON %s, %s", v34, v35, v36, v37, v38, v39, v40, v45);
    lcp_close((int)a1, "login failed", v46, v47, v48, v49, v50, v51);
    v45 = dword_10004A234;
  }
  if (v45 >= 4)
    sleep(5 * v45 - 15);
  v52 = v66;
  if (v66)
  {
    do
    {
      v53 = (_QWORD *)*v52;
      free(v52);
      v52 = v53;
    }
    while (v53);
  }
  v14 = 3;
LABEL_45:
  v54 = v67;
  if (v67)
  {
    do
    {
      v55 = (_QWORD *)*v54;
      free(v54);
      v54 = v55;
    }
    while (v55);
  }
  return v14;
}

void sub_100006CD8(FILE *a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  stat v12;

  memset(&v12, 0, sizeof(v12));
  v3 = fileno(a1);
  if (fstat(v3, &v12) < 0)
  {
    v11 = "cannot stat secret file %s: %m";
  }
  else
  {
    if ((v12.st_mode & 0x3F) == 0)
      return;
    v11 = "Warning - secret file %s has world and/or group access";
  }
  warning(v11, v4, v5, v6, v7, v8, v9, v10, a2);
}

uint64_t sub_100006D4C(FILE *a1, const char *a2, const char *a3, char *a4, void **a5, _QWORD *a6, int a7, int a8)
{
  _QWORD *v10;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  BOOL v22;
  char *v23;
  _QWORD *v24;
  FILE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  FILE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void **v41;
  void **v42;
  size_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  _QWORD *v54;
  void **v55;
  void **v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v62;
  _QWORD *v63;
  int v64;
  char *__dst;
  _QWORD *v66;
  void *v67;
  uint64_t v68;
  char __source[1024];
  char __filename[1024];
  char __s1;
  char v72[1023];

  v10 = a6;
  v66 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v67 = 0;
  v68 = 0;
  if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v68 + 1, a7))
    return 0xFFFFFFFFLL;
  __dst = a4;
  v63 = 0;
  v16 = 1;
  HIDWORD(v68) = 1;
  v17 = 0xFFFFFFFFLL;
  do
  {
    v18 = v17;
    do
    {
      while (1)
      {
        do
        {
          while (1)
          {
            if (!v16)
            {
              while (getword(a1, (uint64_t)&__s1, (_DWORD *)&v68 + 1, a7) && !HIDWORD(v68))
                ;
              if (!HIDWORD(v68))
              {
LABEL_61:
                v17 = v18;
                goto LABEL_62;
              }
            }
            if (!a2)
              break;
            v19 = strcmp(&__s1, a2);
            v20 = __s1;
            v21 = v72[0];
            if (!v19)
              goto LABEL_18;
            if (__s1 == 42 && !v72[0])
            {
              v20 = 42;
              goto LABEL_18;
            }
            v16 = 0;
            HIDWORD(v68) = 0;
          }
          v20 = __s1;
          v21 = v72[0];
LABEL_18:
          if (v21)
            v22 = 0;
          else
            v22 = v20 == 42;
          if (v22)
            v17 = 0;
          else
            v17 = 2;
          if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v68 + 1, a7))
            goto LABEL_61;
          v16 = HIDWORD(v68);
        }
        while (HIDWORD(v68));
        if (__s1 == 42 && !v72[0])
          break;
        if (!a3 || !strcmp(&__s1, a3))
        {
          v17 = v17 | 1;
          break;
        }
LABEL_46:
        v16 = HIDWORD(v68);
      }
      if ((int)v17 <= (int)v18)
        goto LABEL_46;
      if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v68 + 1, a7))
        goto LABEL_61;
      v16 = HIDWORD(v68);
    }
    while (HIDWORD(v68));
    if (a8)
    {
      v23 = strchr(&__s1, 58);
      if (!v23 || !strchr(v23 + 1, 58))
        goto LABEL_46;
    }
    v64 = a8;
    if (!__dst)
      goto LABEL_49;
    if (__s1 != 64 || v72[0] != 47)
      goto LABEL_48;
    v24 = v10;
    __strlcpy_chk(__filename, v72, 1024, 1024);
    v25 = fopen(__filename, "r");
    if (!v25)
    {
      warning("can't open indirect secret file %s", v26, v27, v28, v29, v30, v31, v32, (int)__filename);
      goto LABEL_45;
    }
    v33 = v25;
    sub_100006CD8(v25, (int)__filename);
    if (!getword(v33, (uint64_t)&__s1, &v68, (int)__filename))
    {
      warning("no secret in indirect secret file %s", v34, v35, v36, v37, v38, v39, v40, (int)__filename);
      fclose(v33);
LABEL_45:
      v10 = v24;
      a8 = v64;
      goto LABEL_46;
    }
    fclose(v33);
    v10 = v24;
LABEL_48:
    __strlcpy_chk(__source, &__s1, 1024, 1024);
LABEL_49:
    v62 = v10;
    v41 = (void **)&v66;
    if (getword(a1, (uint64_t)&__s1, (_DWORD *)&v68 + 1, a7) && !HIDWORD(v68))
    {
      v42 = (void **)&v66;
      do
      {
        v43 = (int)(strlen(&__s1) + 1);
        v44 = (char *)malloc_type_malloc(v43 + 16, 0x4F3995F4uLL);
        if (!v44)
          novm((int)"authorized addresses", v45, v46, v47, v48, v49, v50, v51);
        v41 = (void **)v44;
        v52 = v44 + 16;
        v41[1] = v52;
        strlcpy(v52, &__s1, v43);
        *v42 = v41;
        if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v68 + 1, a7))
          break;
        v42 = v41;
      }
      while (!HIDWORD(v68));
    }
    *v41 = 0;
    v53 = v63;
    if (v63)
    {
      do
      {
        v54 = (_QWORD *)*v53;
        free(v53);
        v53 = v54;
      }
      while (v54);
    }
    v63 = v66;
    v67 = v66;
    v10 = v62;
    a8 = v64;
    if (__dst)
      strlcpy(__dst, __source, 0x400uLL);
    v16 = HIDWORD(v68);
  }
  while (HIDWORD(v68));
LABEL_62:
  v55 = &v67;
  do
  {
    v56 = v55;
    v55 = (void **)*v55;
    if (!v55)
    {
      if (!v10)
        goto LABEL_73;
      v57 = 0;
      goto LABEL_72;
    }
  }
  while (strcmp((const char *)v55[1], "--"));
  v57 = *v55;
  free(v55);
  *v56 = 0;
  if (v10)
  {
LABEL_72:
    *v10 = v57;
    goto LABEL_73;
  }
  if (v57)
  {
    do
    {
      v58 = (_QWORD *)*v57;
      free(v57);
      v57 = v58;
    }
    while (v58);
  }
LABEL_73:
  v59 = v67;
  if (a5)
  {
    *a5 = v67;
  }
  else if (v67)
  {
    do
    {
      v60 = (_QWORD *)*v59;
      free(v59);
      v59 = v60;
    }
    while (v60);
  }
  return v17;
}

uint64_t get_secret(_QWORD *a1, const char *a2, const char *a3, void *a4, int *a5, int a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  FILE *v27;
  int v28;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  char __s[1024];

  v42 = 0;
  v43 = 0;
  if (a6 || !(_BYTE)passwd)
  {
    if (a6 || !chap_passwd_hook)
    {
      v43 = 0;
      __s[0] = 0;
      v19 = fopen("/etc/ppp/chap-secrets", "r");
      if (v19)
      {
        v27 = v19;
        sub_100006CD8(v19, (int)"/etc/ppp/chap-secrets");
        v28 = sub_100006D4C(v27, a2, a3, __s, &v43, &v42, (int)"/etc/ppp/chap-secrets", 0);
        fclose(v27);
        if ((v28 & 0x80000000) == 0)
        {
          if (a6)
          {
            sub_10000500C(a1, v43, (uint64_t)v42);
          }
          else
          {
            v30 = v42;
            if (v42)
            {
              do
              {
                v31 = (_QWORD *)*v30;
                free(v30);
                v30 = v31;
              }
              while (v31);
            }
          }
          v32 = v43;
          if (v43)
          {
            do
            {
              v33 = (_QWORD *)*v32;
              free(v32);
              v32 = v33;
            }
            while (v33);
          }
          goto LABEL_18;
        }
      }
      else
      {
        error("Can't open chap secret file %s: %m", v20, v21, v22, v23, v24, v25, v26, (int)"/etc/ppp/chap-secrets");
      }
    }
    else
    {
      if ((chap_passwd_hook(a2, __s) & 0x80000000) == 0)
        goto LABEL_18;
      error("Unable to obtain CHAP password for %s on %s from plugin", v12, v13, v14, v15, v16, v17, v18, (int)a2);
    }
    return 0;
  }
  __strlcpy_chk(__s, &passwd, 1024, 1024);
LABEL_18:
  v41 = strlen(__s);
  if (v41 >= 257)
  {
    error("Secret for %s on %s is too long", v34, v35, v36, v37, v38, v39, v40, (int)a2);
    v41 = 256;
  }
  memcpy(a4, __s, v41);
  *a5 = v41;
  return 1;
}

uint64_t get_srp_secret(_QWORD *a1, const char *a2, const char *a3, char *__dst, int a5)
{
  FILE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FILE *v18;
  int v19;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;

  if (a5 || !(_BYTE)passwd)
  {
    v26 = 0;
    v10 = fopen("/etc/ppp/srp-secrets", "r");
    if (v10)
    {
      v18 = v10;
      v25 = 0;
      sub_100006CD8(v10, (int)"/etc/ppp/srp-secrets");
      *__dst = 0;
      v19 = sub_100006D4C(v18, a2, a3, __dst, &v26, &v25, (int)"/etc/ppp/srp-secrets", a5);
      fclose(v18);
      if ((v19 & 0x80000000) == 0)
      {
        if (a5)
        {
          sub_10000500C(a1, v26, (uint64_t)v25);
        }
        else
        {
          v21 = v25;
          if (v25)
          {
            do
            {
              v22 = (_QWORD *)*v21;
              free(v21);
              v21 = v22;
            }
            while (v22);
          }
        }
        v23 = v26;
        if (v26)
        {
          do
          {
            v24 = (_QWORD *)*v23;
            free(v23);
            v23 = v24;
          }
          while (v24);
        }
        return 1;
      }
    }
    else
    {
      error("Can't open srp secret file %s: %m", v11, v12, v13, v14, v15, v16, v17, (int)"/etc/ppp/srp-secrets");
    }
    return 0;
  }
  strlcpy(__dst, (const char *)&passwd, 0x400uLL);
  return 1;
}

uint64_t auth_ip_addr(int a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t result;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  int v11;
  BOOL v12;

  v4 = ntohl(a2);
  if (v4 >> 28 == 15 || v4 == 2130706433 || (v4 & 0xF0000000) == -536870912)
    return 0;
  if (!allowed_address_hook || (result = allowed_address_hook(a2), (result & 0x80000000) != 0))
  {
    if ((auth_done[a1] & 0x20) == 0 || (result = EAPAllowedAddr(), (result & 0x80000000) != 0))
    {
      v8 = qword_10004A238[a1];
      if (!v8)
        goto LABEL_18;
      v9 = (_DWORD *)(v8 + 8);
      do
      {
        v10 = *(v9 - 1);
        v11 = *v9 & a2;
        v9 += 3;
      }
      while (v11 != v10);
      result = *(v9 - 5);
      if ((result & 0x80000000) != 0)
      {
LABEL_18:
        if (!auth_required)
        {
          if (allow_any_ip)
            v12 = 0;
          else
            v12 = privileged == 0;
          return !v12 || have_route_to() == 0;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t bad_ip_adrs()
{
  unsigned int v0;
  _BOOL4 v1;

  v0 = ntohl();
  v1 = v0 == 2130706433;
  if (v0 >> 28 == 14)
    v1 = 1;
  return v0 >> 28 == 15 || v1;
}

uint64_t save_new_password()
{
  return 0;
}

void sub_100007614()
{
  const char *v0;

  dword_10004A214 = 0;
  if (byte_10004A210 == 1)
  {
    if ((byte_10004A20C & 1) != 0)
      return;
    v0 = "/etc/ppp/auth-down";
  }
  else
  {
    if (!byte_10004A20C)
      return;
    v0 = "/etc/ppp/auth-up";
  }
  byte_10004A210 ^= 1u;
  sub_100004BA8(v0);
}

void sub_100007660(int a1)
{
  char *v2;
  uint64_t v3;
  __int16 *v4;
  _QWORD *v5;
  __int16 *v6;
  _QWORD *v7;

  v2 = (char *)&ccp_fsm + 80 * a1;
  *(_DWORD *)v2 = a1;
  *((_DWORD *)v2 + 1) = 33021;
  *((_QWORD *)v2 + 7) = off_100041E50;
  fsm_init((uint64_t)v2);
  v3 = 7 * a1;
  v4 = &ccp_wantoptions[v3];
  *(_QWORD *)(v4 + 3) = 0;
  *(_QWORD *)v4 = 0;
  v5 = (_QWORD *)((char *)&ccp_gotoptions + v3 * 2);
  *v5 = 0;
  *(_QWORD *)((char *)v5 + 6) = 0;
  v6 = &ccp_allowoptions[v3];
  *(_QWORD *)(v6 + 3) = 0;
  *(_QWORD *)v6 = 0;
  v7 = (_QWORD *)((char *)&ccp_hisoptions + v3 * 2);
  *v7 = 0;
  *(_QWORD *)((char *)v7 + 6) = 0;
  word_10004764C = 257;
  word_100047668 = 257;
  ccp_wantoptions[0] = 257;
  dword_100047650 = 983055;
  ccp_allowoptions[0] = 257;
  dword_10004766C = 983055;
  byte_100047666 = 1;
}

void sub_100007724(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  char *v11;
  _DWORD *v12;
  int v13;
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
  int v35;
  int v36;

  v10 = a1;
  v11 = (char *)&ccp_fsm + 80 * (int)a1;
  v12 = v11 + 8;
  v13 = *((_DWORD *)v11 + 2);
  fsm_input((uint64_t)v11, a2, a3, a4, a5, a6, a7, a8, v34);
  if (v13 == 6)
  {
    if (*a2 == 6
      && !ccp_gotoptions[14 * v10 + 1]
      && !ccp_gotoptions[14 * v10]
      && !ccp_gotoptions[14 * v10 + 2]
      && !ccp_gotoptions[14 * v10 + 3]
      && !ccp_gotoptions[14 * v10 + 6])
    {
      sub_1000079D4(a1, "No compression negotiated");
    }
  }
  else if (v13 == 9 && *a2 == 5 && *v12 != 9)
  {
    notice("Compression disabled by peer.", v14, v15, v16, v17, v18, v19, v20, v35);
    if (ccp_gotoptions[14 * v10 + 6])
    {
      error("MPPE disabled, closing LCP", v21, v22, v23, v24, v25, v26, v27, v36);
      lcp_close(a1, "MPPE disabled by peer", v28, v29, v30, v31, v32, v33);
    }
  }
}

void sub_100007870(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v1 = a1;
  ccp_flags_set(a1, 0, 0);
  fsm_protreject((uint64_t)&ccp_fsm + 80 * v1, v2, v3, v4, v5, v6, v7, v8);
  if (ccp_gotoptions[14 * v1 + 6])
  {
    error("MPPE required but peer negotiation failed", v9, v10, v11, v12, v13, v14, v15, v22);
    lcp_close(v1, "MPPE required but peer negotiation failed", v16, v17, v18, v19, v20, v21);
  }
}

void sub_1000078E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_lowerup((uint64_t)&ccp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_1000078FC(int a1)
{
  fsm_lowerdown((uint64_t)&ccp_fsm + 80 * a1);
}

void sub_100007910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a1;
  v9 = (int *)((char *)&ccp_fsm + 80 * (int)a1);
  if (v9[2] != 9)
    ccp_flags_set(a1, 1, 0);
  sub_100008294(v9, a2, a3, a4, a5, a6, a7, a8);
  if (!ccp_gotoptions[14 * v8 + 1]
    && !ccp_gotoptions[14 * v8]
    && !ccp_gotoptions[14 * v8 + 2]
    && !ccp_gotoptions[14 * v8 + 3]
    && !ccp_gotoptions[14 * v8 + 6])
  {
    *((_DWORD *)&ccp_fsm + 20 * v8 + 3) |= 4u;
  }
  fsm_open((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
}

void sub_1000079D4(uint64_t a1, char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  ccp_flags_set(a1, 0, 0);
  fsm_close((uint64_t)&ccp_fsm + 80 * v3, a2, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_100007A14(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  unsigned int v6;
  int v7;
  int v11;
  int v12;
  uint64_t v13;
  const char *v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v18;
  unsigned __int8 *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  unsigned int v23;
  int v24;
  signed __int8 v25;
  char v26;
  char v27;
  int v28;
  BOOL v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  unsigned __int8 *v37;
  int64_t v38;
  int v39;
  unsigned int v40;
  int v41;

  if (a2 < 4)
    return 0;
  v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  v7 = v6 - 4;
  if (v6 < 4 || v6 > a2)
    return 0;
  v11 = *a1;
  v12 = a1[1];
  v13 = (v11 - 1);
  if (v13 <= 0xE && (unint64_t)(v13 - 7) >= 6)
    v14 = " %s";
  else
    v14 = " code=0x%x";
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  v15 = a1 + 4;
  if (v13 < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        v16 = v15[1];
        if (v16 < 2 || v7 < v16)
          goto LABEL_74;
        v18 = *v15;
        a3(a4, " <");
        v19 = v15;
        switch(v18)
        {
          case 18:
            v19 = v15;
            if (v16 >= 6)
            {
              v23 = v15[2];
              v24 = v23 & 1;
              v25 = v15[5];
              if (v15[3])
                goto LABEL_40;
              v26 = (4 * v24) ^ 4;
              if (v25 < 0)
                v26 |= 8u;
              v27 = v23 >= 2 ? 64 : v26;
              if (v15[4])
LABEL_40:
                v27 = 64;
              v28 = v25 & 0xE | v27 & 0x40;
              v29 = v24 == 0;
              v30 = "+H";
              if (v29)
                v30 = "-H";
              v31 = "+M";
              if (v25 >= 0)
                v31 = "-M";
              v32 = "+S";
              if ((v15[5] & 0x40) == 0)
                v32 = "-S";
              v33 = "+L";
              if ((v15[5] & 0x20) == 0)
                v33 = "-L";
              v34 = "+D";
              if ((v15[5] & 0x10) == 0)
                v34 = "-D";
              v29 = (v25 & 1) == 0;
              v35 = "+C";
              if (v29)
                v35 = "-C";
              v36 = " +U";
              if (!v28)
                v36 = (const char *)&unk_100032B1A;
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "mppe %s %s %s %s %s %s%s", v30, v31, v32, v33, v34, v35, v36);
              if (v28)
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " (%.2x %.2x %.2x %.2x)", v15[2], v15[3], v15[4], v15[5]);
              v19 = v15 + 6;
            }
            goto LABEL_62;
          case 19:
          case 20:
          case 22:
          case 23:
          case 25:
            goto LABEL_62;
          case 21:
            v19 = v15;
            if (v16 >= 3)
            {
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "bsd v%d %d", v15[2] >> 5, v15[2] & 0x1F);
              v19 = v15 + 3;
            }
            goto LABEL_62;
          case 24:
          case 26:
            v19 = v15;
            if (v16 >= 4)
            {
              v20 = (const char *)&unk_100032B1A;
              if (v18 == 24)
                v20 = "(old#)";
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "deflate%s %d", v20, (v15[2] >> 4) + 8);
              if ((v15[2] & 0xF) != 8)
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " method %d", v15[2] & 0xF);
              if (v15[3])
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " check %d", v15[3]);
              v19 = v15 + 4;
            }
            goto LABEL_62;
          default:
            if (v18 == 1)
            {
              v21 = a4;
              v22 = "predictor 1";
              goto LABEL_61;
            }
            v19 = v15;
            if (v18 == 2)
            {
              v21 = a4;
              v22 = "predictor 2";
LABEL_61:
              a3(v21, v22);
              v19 = v15 + 2;
            }
LABEL_62:
            if (v19 < &v15[v16])
            {
              v37 = &v15[v16];
              v38 = &v15[v16] - v19;
              do
              {
                v39 = *v19++;
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v39);
                --v38;
              }
              while (v38);
              v19 = v37;
            }
            v7 -= v16;
            a3(a4, ">");
            v15 = v19;
            if (v7 <= 1)
              goto LABEL_73;
            break;
        }
      }
    }
LABEL_72:
    v19 = a1 + 4;
LABEL_73:
    v15 = v19;
    if (v7 < 1)
      return ((_DWORD)v15 - (_DWORD)a1);
    goto LABEL_74;
  }
  if ((v11 - 5) >= 2)
    goto LABEL_72;
  if (v6 >= 5)
  {
    if (*v15 - 32 > 0x5E)
    {
LABEL_74:
      v40 = v7 + 1;
      do
      {
        v41 = *v15++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v41);
        --v40;
      }
      while (v40 > 1);
      return ((_DWORD)v15 - (_DWORD)a1);
    }
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v15) = (_DWORD)v15 + v7;
  }
  return ((_DWORD)v15 - (_DWORD)a1);
}

void sub_100007E84(uint64_t a1)
{
  unsigned int *v1;
  int v3;
  uint64_t v4;
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
  int v31;
  char *v32;
  char v33;
  int v34;
  int v35;
  int v36;

  v1 = (unsigned int *)((char *)&ccp_fsm + 80 * (int)a1);
  if (v1[2] == 9)
  {
    v3 = a1;
    if (ccp_fatal_error())
    {
      error("Lost compression sync: disabling compression", v4, v5, v6, v7, v8, v9, v10, v35);
      ccp_flags_set(a1, 0, 0);
      fsm_close((uint64_t)v1, "Lost compression sync", v11, v12, v13, v14, v15, v16);
      if (ccp_gotoptions[14 * v3 + 6])
      {
        error("Too many MPPE errors, closing LCP", v17, v18, v19, v20, v21, v22, v23, v36);
        lcp_close(a1, "Too many MPPE errors", v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      v30 = (int)*v1;
      v31 = dword_10004A2A4[v30];
      if ((v31 & 1) != 0)
      {
        v34 = v31 | 2;
      }
      else
      {
        v32 = (char *)&ccp_fsm + 80 * v3;
        v33 = v32[16] + 1;
        v32[16] = v33;
        v32[17] = v33;
        fsm_sdata(v1, 14, v33, 0, 0, v8, v9, v10, v35);
        timeout((int)sub_10000A028);
        v30 = (int)*v1;
        v34 = dword_10004A2A4[v30] | 1;
      }
      dword_10004A2A4[v30] = v34;
    }
  }
}

uint64_t sub_100007FB0(const char **a1)
{
  char *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  BOOL v15;
  BOOL v16;
  char v17;
  char v18;
  char *v19;
  char *__endptr;

  __endptr = 0;
  v2 = (char *)*a1;
  v3 = strtol(*a1, &__endptr, 0);
  v11 = __endptr;
  if (__endptr == v2)
    goto LABEL_8;
  v12 = v3;
  if (*__endptr == 44)
  {
    v2 = __endptr + 1;
    v3 = strtol(__endptr + 1, &__endptr, 0);
    v11 = __endptr;
  }
  if (v11 == v2 || *v11 != 0)
  {
LABEL_8:
    option_error("invalid parameter '%s' for bsdcomp option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
    return 0;
  }
  v15 = (v12 - 9) < 7 || v12 == 0;
  if (!v15 || ((v3 - 9) >= 7 ? (v16 = v3 == 0) : (v16 = 1), !v16))
  {
    option_error("bsdcomp option values must be 0 or %d .. %d", v4, v5, v6, v7, v8, v9, v10, 9);
    return 0;
  }
  if (v12)
  {
    LOWORD(dword_100047650) = v12;
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  LOBYTE(ccp_wantoptions[0]) = v17;
  if (v3)
  {
    LOWORD(dword_10004766C) = v3;
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  LOBYTE(ccp_allowoptions[0]) = v18;
  if (v3 == v12)
    v19 = "%d";
  else
    v19 = "%d,%d";
  slprintf((int)&unk_10004A250, 8, v19);
  return 1;
}

uint64_t sub_1000080FC(const char **a1)
{
  char *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  int v13;
  int v14;
  BOOL v17;
  BOOL v18;
  int v19;
  char v20;
  char *v21;
  char *__endptr;

  __endptr = 0;
  v2 = (char *)*a1;
  v3 = strtol(*a1, &__endptr, 0);
  v11 = __endptr;
  if (__endptr == v2)
    goto LABEL_8;
  v12 = v3;
  v13 = v3;
  if (*__endptr == 44)
  {
    v2 = __endptr + 1;
    v14 = strtol(__endptr + 1, &__endptr, 0);
    v11 = __endptr;
    v13 = v14;
  }
  if (v11 == v2 || *v11 != 0)
  {
LABEL_8:
    option_error("invalid parameter '%s' for deflate option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
    return 0;
  }
  v17 = (v12 - 8) < 8 || v12 == 0;
  if (!v17 || ((v13 - 8) >= 8 ? (v18 = v13 == 0) : (v18 = 1), !v18))
  {
    option_error("deflate option values must be 0 or %d .. %d", v4, v5, v6, v7, v8, v9, v10, 8);
    return 0;
  }
  if (v12 != 8 && v13 != 8)
    goto LABEL_25;
  v19 = 9;
  if (v13 == 8)
    v13 = 9;
  warning("deflate option value of %d changed to %d to avoid zlib bug", v4, v5, v6, v7, v8, v9, v10, 8);
  if (v12 != 8)
  {
LABEL_25:
    if (!v12)
    {
      v19 = 0;
      HIBYTE(ccp_wantoptions[0]) = 0;
      if (v13)
        goto LABEL_28;
LABEL_30:
      v20 = 0;
      goto LABEL_31;
    }
    v19 = v12;
  }
  HIBYTE(ccp_wantoptions[0]) = 1;
  HIWORD(dword_100047650) = v19;
  if (!v13)
    goto LABEL_30;
LABEL_28:
  HIWORD(dword_10004766C) = v13;
  v20 = 1;
LABEL_31:
  HIBYTE(ccp_allowoptions[0]) = v20;
  if (v19 == v13)
    v21 = "%d";
  else
    v21 = "%d,%d";
  slprintf((int)&unk_10004A258, 8, v21);
  return 1;
}

void sub_100008294(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _QWORD *v10;
  __int16 *v11;
  _BYTE *v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
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
  _BYTE *v30;
  _BYTE *v31;
  int v32;
  _BYTE *v33;
  _BYTE *v34;
  int v35;
  _BYTE *v36;
  _BYTE *v37;
  int v38;
  _BYTE *v39;
  _BYTE *v40;
  int v41;
  _BYTE *v42;
  _BYTE *v43;
  int v44;
  unsigned int v45;
  unsigned int v46;
  BOOL v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  _BYTE v56[5];
  char v57;

  v9 = *a1;
  v10 = &ccp_gotoptions[14 * v9];
  v11 = &ccp_wantoptions[7 * v9];
  *v10 = *(_QWORD *)v11;
  *(_QWORD *)((char *)v10 + 6) = *(_QWORD *)(v11 + 3);
  v12 = (char *)v10 + 6;
  v13 = *a1;
  dword_10004A260[(int)v13] = 0;
  v14 = *((unsigned __int8 *)v10 + 6);
  if (*((_BYTE *)v10 + 6))
  {
    v15 = v13;
    v16 = auth_done[(int)v13];
    if ((v16 & 0x30) == 0)
    {
      v45 = 0;
      v46 = (v16 >> 8) & 0xF;
      do
      {
        v45 += v46 & 1;
        v47 = v46 > 1;
        v46 >>= 1;
      }
      while (v47);
      if (v45 >= 2)
      {
        v48 = "MPPE required, but auth done in both directions.";
        goto LABEL_38;
      }
      if (!v45)
      {
        v48 = "MPPE required, but MS-CHAP[v2] auth not performed.";
        goto LABEL_38;
      }
      if (!mppe_keys_set)
      {
        v48 = "MPPE required, but keys are not available.  Possible plugin problem?";
        goto LABEL_38;
      }
      if ((v14 & 1) != 0 && (v16 & 0x300) != 0)
      {
        notice("Disabling 40-bit MPPE; MS-CHAP LM not supported", a2, a3, a4, a5, a6, a7, a8, v55);
        v14 = *v12 & 0xFE;
        *v12 &= ~1u;
        v13 = *a1;
        LOBYTE(ccp_wantoptions[7 * (int)v13 + 3]) &= ~1u;
      }
    }
    if ((v14 & 3) != 0)
    {
      LOBYTE(ccp_allowoptions[7 * v15 + 3]) = v14;
      *(_DWORD *)v10 = 0;
      *(_DWORD *)&ccp_allowoptions[7 * v15] = 0;
      *(_WORD *)v56 = 1554;
      v56[2] = ((v14 >> 2) & 1) == 0;
      *(_WORD *)&v56[3] = 0;
      v57 = 32 * (v14 & 3);
      if ((int)ccp_test(v13, (uint64_t)v56, 22, 0) <= 0)
      {
        error("MPPE required, but kernel has no support.", v17, v18, v19, v20, v21, v22, v23, v55);
        lcp_close(*a1, "MPPE required but not available", v24, v25, v26, v27, v28, v29);
      }
      goto LABEL_6;
    }
    v48 = "MPPE required, but both 40-bit and 128-bit disabled.";
LABEL_38:
    error(v48, a2, a3, a4, a5, a6, a7, a8, v55);
    lcp_close(*a1, "MPPE required but not available", v49, v50, v51, v52, v53, v54);
    return;
  }
LABEL_6:
  if (*(_BYTE *)v10)
  {
    *(_WORD *)v56 = 789;
    v56[2] = 41;
    if ((int)ccp_test(*a1, (uint64_t)v56, 3, 0) <= 0)
      *(_BYTE *)v10 = 0;
  }
  v30 = &ccp_gotoptions[14 * (int)v9];
  v32 = v30[1];
  v31 = v30 + 1;
  if (v32)
  {
    v33 = &ccp_gotoptions[14 * (int)v9];
    v35 = v33[4];
    v34 = v33 + 4;
    if (v35)
    {
      *(_DWORD *)v56 = 1573914;
      if ((int)ccp_test(*a1, (uint64_t)v56, 4, 0) <= 0)
        *v34 = 0;
    }
    v36 = &ccp_gotoptions[14 * (int)v9];
    v38 = v36[5];
    v37 = v36 + 5;
    if (v38)
    {
      *(_DWORD *)v56 = 1573912;
      if ((int)ccp_test(*a1, (uint64_t)v56, 4, 0) <= 0)
        *v37 = 0;
    }
    if (!*v34 && !*v37)
      *v31 = 0;
  }
  v39 = &ccp_gotoptions[14 * (int)v9];
  v41 = v39[2];
  v40 = v39 + 2;
  if (v41)
  {
    *(_WORD *)v56 = 513;
    if ((int)ccp_test(*a1, (uint64_t)v56, 2, 0) <= 0)
      *v40 = 0;
  }
  v42 = &ccp_gotoptions[14 * (int)v9];
  v44 = v42[3];
  v43 = v42 + 3;
  if (v44)
  {
    *(_WORD *)v56 = 514;
    if ((int)ccp_test(*a1, (uint64_t)v56, 2, 0) <= 0)
      *v43 = 0;
  }
}

uint64_t sub_100008614(int *a1)
{
  char *v1;
  int v2;
  int v3;
  int v4;

  v1 = (char *)&ccp_gotoptions + 14 * *a1;
  if (*v1)
    v2 = 3;
  else
    v2 = 0;
  v3 = (v2 | (4 * (v1[1] != 0))) + 2 * (v1[2] != 0) + 2 * (v1[3] != 0);
  if (v1[6])
    v4 = 6;
  else
    v4 = 0;
  return (v3 + v4);
}

void sub_100008680(int *a1, char *a2, _DWORD *a3)
{
  int v6;
  _BYTE *v7;
  char *v8;
  char *v9;
  unsigned __int8 v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  int v20;
  _BYTE *v21;
  _BYTE *v22;
  char v23;
  _WORD *v24;
  char v25;
  char *v26;
  int v27;
  __int16 v28;
  _BYTE *v29;
  _WORD *v30;
  char v31;
  int v32;
  __int16 v33;
  _BYTE *v34;
  _BYTE *v35;
  int v36;
  _BYTE *v37;
  _BYTE *v38;
  int v39;
  __int16 v40;
  __int16 v41;
  BOOL v42;
  __int16 v43;
  char v44;
  __int128 v45;

  v6 = *a1;
  v7 = &ccp_gotoptions[14 * *a1];
  v8 = v7 + 6;
  v9 = a2;
  if (v7[6])
  {
    v41 = 1554;
    *(_WORD *)a2 = 1554;
    a2[2] = (*v8 & 4) == 0;
    *(_WORD *)(a2 + 3) = 0;
    a2[5] = 0;
    v10 = (32 * *v8) & 0x40;
    a2[5] = v10;
    v11 = *v8;
    if ((*v8 & 1) != 0)
    {
      a2[5] = v10 | 0x20;
      v11 = *v8;
    }
    v42 = (v11 & 4) == 0;
    v43 = 0;
    v44 = 32 * (v11 & 3);
    v45 = mppe_recv_key;
    if ((int)ccp_test(*a1, (uint64_t)&v41, 22, 0) < 1)
    {
      lcp_close(*a1, "MPPE required but not available in kernel", v12, v13, v14, v15, v16, v17);
      v9 = a2;
    }
    else
    {
      v9 = a2 + 6;
    }
  }
  v18 = &ccp_gotoptions[14 * v6];
  v20 = v18[1];
  v19 = v18 + 1;
  if (v20)
  {
    v21 = &ccp_gotoptions[14 * v6];
    v22 = v21 + 4;
    if (v21[4])
      v23 = 26;
    else
      v23 = 24;
    *v9 = v23;
    v9[1] = 4;
    v25 = v21[10];
    v24 = v21 + 10;
    v9[2] = 16 * v25 - 120;
    v9[3] = 0;
    if (v9 == a2)
    {
      while (1)
      {
        if ((unsigned __int16)*v24 < 9u)
        {
LABEL_20:
          *v19 = 0;
          v9 = a2;
          goto LABEL_22;
        }
        v27 = ccp_test(*a1, (uint64_t)a2, 4, 0);
        if (v27 >= 1)
          break;
        if (v27 < 0)
          goto LABEL_20;
        v28 = *v24 - 1;
        *v24 = v28;
        v9[2] = 16 * v28 - 120;
      }
      v26 = a2 + 4;
    }
    else
    {
      v26 = v9 + 4;
      v9 = a2;
      if (v26 == a2)
        goto LABEL_22;
    }
    if (*v22 && ccp_gotoptions[14 * v6 + 5])
    {
      *(_WORD *)v26 = 1048;
      *((_WORD *)v26 + 1) = *(v26 - 2);
      v9 = v26 + 4;
    }
    else
    {
      v9 = v26;
    }
  }
LABEL_22:
  if (*v7)
  {
    *(_WORD *)v9 = 789;
    v29 = &ccp_gotoptions[14 * v6];
    v31 = v29[8];
    v30 = v29 + 8;
    v9[2] = v31 | 0x20;
    if (v9 == a2)
    {
      while (1)
      {
        if ((unsigned __int16)*v30 < 9u)
        {
LABEL_29:
          *v7 = 0;
          v9 = a2;
          goto LABEL_30;
        }
        v32 = ccp_test(*a1, (uint64_t)a2, 3, 0);
        if (v32 >= 1)
          break;
        if (v32 < 0)
          goto LABEL_29;
        v33 = *v30 - 1;
        *v30 = v33;
        v9[2] = v33 | 0x20;
      }
      v9 = a2 + 3;
    }
    else
    {
      v9 += 3;
    }
  }
LABEL_30:
  v34 = &ccp_gotoptions[14 * v6];
  v36 = v34[2];
  v35 = v34 + 2;
  if (v36)
  {
    *(_WORD *)v9 = 513;
    if (v9 == a2 && (int)ccp_test(*a1, (uint64_t)a2, 2, 0) <= 0)
    {
      *v35 = 0;
      v9 = a2;
    }
    else
    {
      v9 += 2;
    }
  }
  v37 = &ccp_gotoptions[14 * v6];
  v39 = v37[3];
  v38 = v37 + 3;
  if (v39)
  {
    *(_WORD *)v9 = 514;
    if (v9 == a2 && (int)ccp_test(*a1, (uint64_t)a2, 2, 0) <= 0)
    {
      *v38 = 0;
      v40 = -1;
      LODWORD(v9) = (_DWORD)a2;
      goto LABEL_41;
    }
    v9 += 2;
  }
  if (v9 <= a2)
    v40 = -1;
  else
    v40 = *a2;
LABEL_41:
  *(_WORD *)&ccp_gotoptions[14 * v6 + 12] = v40;
  *a3 = (_DWORD)v9 - (_DWORD)a2;
}

BOOL sub_100008A00(int *a1, unsigned __int8 *a2, int a3)
{
  int v3;
  char *v4;
  unsigned int v5;
  BOOL v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  BOOL v10;
  BOOL v11;
  _BYTE v13[6];

  v3 = *a1;
  v4 = (char *)&ccp_gotoptions + 14 * *a1;
  v5 = v4[6];
  if (v4[6])
  {
    *(_WORD *)v13 = 1554;
    v13[2] = ((v5 >> 2) & 1) == 0;
    *(_WORD *)&v13[3] = 0;
    if (a3 < 6)
      return 0;
    if (*(_DWORD *)v13 == *(_DWORD *)a2)
    {
      v13[5] = 32 * (v5 & 3);
      v6 = *(unsigned __int16 *)&v13[4] == *((unsigned __int16 *)a2 + 2);
    }
    else
    {
      v6 = 0;
    }
    if (!v6)
      return 0;
    a3 -= 6;
    if (!a3)
      return 1;
    v7 = a2 + 6;
  }
  else
  {
    v7 = a2;
  }
  if (!*((_BYTE *)&ccp_gotoptions + 14 * v3 + 1))
    goto LABEL_31;
  if (a3 < 4)
    return 0;
  v8 = *((_BYTE *)&ccp_gotoptions + 14 * v3 + 4) ? 26 : 24;
  if (v8 != *v7)
    return 0;
  if (v7[1] != 4)
    return 0;
  v9 = v7[2];
  if (16 * *((unsigned __int16 *)&ccp_gotoptions + 7 * v3 + 5) - 120 != v9 || v7[3])
    return 0;
  if (a3 == 4)
    return 1;
  if (*((_BYTE *)&ccp_gotoptions + 14 * v3 + 4) && *((_BYTE *)&ccp_gotoptions + 14 * v3 + 5))
  {
    v10 = a3 >= 8;
    a3 -= 8;
    if (!v10 || v7[4] != 24 || v7[5] != 4 || v9 != v7[6] || v7[7])
      return 0;
    v7 += 8;
  }
  else
  {
    v7 += 4;
    a3 -= 4;
  }
LABEL_31:
  if (*v4)
  {
    v11 = __OFSUB__(a3, 3);
    a3 -= 3;
    if (a3 < 0 != v11
      || *v7 != 21
      || v7[1] != 3
      || (*((unsigned __int16 *)&ccp_gotoptions + 7 * v3 + 4) | 0x20) != v7[2])
    {
      return 0;
    }
    v7 += 3;
    if (v7 == a2 && !a3)
      return 1;
  }
  if (*((_BYTE *)&ccp_gotoptions + 14 * v3 + 2))
  {
    v11 = __OFSUB__(a3, 2);
    a3 -= 2;
    if (a3 < 0 != v11 || *v7 != 1 || v7[1] != 2)
      return 0;
    v7 += 2;
    if (v7 == a2 && !a3)
      return 1;
  }
  if (!*((_BYTE *)&ccp_gotoptions + 14 * v3 + 3))
    return a3 == 0;
  v11 = __OFSUB__(a3, 2);
  a3 -= 2;
  if (a3 < 0 != v11 || *v7 != 2 || v7[1] != 2)
    return 0;
  if (v7 + 2 == a2 && !a3)
    return 1;
  return a3 == 0;
}

uint64_t sub_100008C44(int *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned __int8 *v9;
  int v11;
  _BYTE *v12;
  char v13;
  char v14;
  int v15;
  char v16;
  char v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;
  BOOL v31;
  unsigned __int8 v32;
  unsigned int v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  int v42;
  __int16 v43;
  char v44;
  int v45;

  v8 = a3;
  v9 = a2;
  v11 = *a1;
  v12 = &ccp_gotoptions[14 * *a1];
  v13 = *v12;
  v14 = v12[1];
  v15 = *(_DWORD *)(v12 + 2);
  v16 = v12[6];
  v17 = v12[7];
  v18 = *((_WORD *)v12 + 4);
  v19 = *((_WORD *)v12 + 5);
  v20 = *((_WORD *)v12 + 6);
  if ((int)a3 < 6 || !v12[6] || *a2 != 18)
    goto LABEL_26;
  v21 = v12[1];
  if (a2[1] != 6)
    goto LABEL_27;
  v22 = a2[2];
  v23 = (char)a2[5];
  v24 = ((4 * (v22 & 1)) | (v23 >> 5) & 3) ^ 4;
  if (v23 < 0)
    v24 |= 8u;
  v25 = (2 * v23) & 0x20 | (16 * (v23 & 1)) | v24;
  if (a2[3] || (v22 >= 2 ? (v26 = v25 | 0x40) : (v26 = (2 * v23) & 0x20 | (16 * (v23 & 1)) | v24), a2[4]))
    v26 = v25 | 0x40;
  if ((v23 & 0xE) != 0)
    v27 = v25 | 0x40;
  else
    v27 = v26;
  if (((refuse_mppe_stateful != 0) & (v27 >> 2)) != 0)
    v16 = v27 & 0xFB;
  else
    v16 = v27;
  if ((v16 & 1) != 0 && (ccp_allowoptions[7 * v11 + 3] & 1) == 0)
    v16 &= ~1u;
  if ((v16 & 2) != 0 && (ccp_allowoptions[7 * v11 + 3] & 2) == 0)
    v16 &= ~2u;
  if ((v16 & 3) == 0)
  {
    v44 = v12[7];
    v45 = *(_DWORD *)(v12 + 2);
    error("MPPE required but peer negotiation failed", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v42);
    lcp_close(*a1, "MPPE required but peer negotiation failed", v35, v36, v37, v38, v39, v40);
    v20 = v43;
    v17 = v44;
    v15 = v45;
    v21 = ccp_gotoptions[14 * v11 + 1];
  }
  else
  {
LABEL_26:
    v21 = v12[1];
  }
LABEL_27:
  if (v8 >= 4 && v21)
  {
    v28 = ccp_gotoptions[14 * v11 + 4] ? 26 : 24;
    if (v28 == *v9 && v9[1] == 4)
    {
      v29 = v9[2];
      if ((v29 & 0xF) == 8 && v29 >= 0x10 && !v9[3])
      {
        v41 = (v29 >> 4) + 8;
        if (v41 < *(unsigned __int16 *)&ccp_gotoptions[14 * v11 + 10])
          v19 = v41;
      }
      else
      {
        v14 = 0;
      }
      if (ccp_gotoptions[14 * v11 + 4] && v8 >= 8 && ccp_gotoptions[14 * v11 + 5] && v9[4] == 24)
      {
        v30 = v9[5];
        if (v30 == 4)
          v9 += 8;
        else
          v9 += 4;
        if (v30 == 4)
          v8 -= 8;
        else
          v8 -= 4;
      }
      else
      {
        v9 += 4;
        v8 -= 4;
      }
    }
  }
  if (*v12)
    v31 = v8 < 3;
  else
    v31 = 1;
  if (!v31 && *v9 == 21 && v9[1] == 3)
  {
    v32 = v9[2];
    if ((v32 & 0xE0) == 0x20)
    {
      v33 = v32 & 0x1F;
      if (v33 < *(unsigned __int16 *)&ccp_gotoptions[14 * v11 + 8])
        v18 = v33;
    }
    else
    {
      v13 = 0;
    }
  }
  if (a1[2] != 9)
  {
    *v12 = v13;
    v12[1] = v14;
    *(_DWORD *)(v12 + 2) = v15;
    v12[6] = v16;
    v12[7] = v17;
    *((_WORD *)v12 + 4) = v18;
    *((_WORD *)v12 + 5) = v19;
    *((_WORD *)v12 + 6) = v20;
  }
  return 1;
}

uint64_t sub_100008F50(int *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  uint64_t v10;
  _BYTE *v11;
  char v12;
  char v13;
  char v14;
  char v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  BOOL v28;
  uint64_t result;
  char v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  int v34;
  char v35;
  uint64_t v36;
  char v37;

  v8 = a2;
  v10 = *a1;
  v11 = &ccp_gotoptions[14 * (int)v10];
  v12 = *v11;
  v13 = v11[1];
  v14 = v11[2];
  v15 = v11[3];
  v16 = v11[4];
  v17 = v11[5];
  v18 = *(_QWORD *)(v11 + 6);
  if ((_DWORD)a3)
  {
    v19 = a3 - 6;
    if ((int)a3 >= 6 && *(_QWORD *)(v11 + 6) && *a2 == 18 && a2[1] == 6)
    {
      v37 = v11[2];
      v36 = *(_QWORD *)(v11 + 6);
      v35 = v11[3];
      error("MPPE required but peer refused", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v34);
      lcp_close(*a1, "MPPE required but peer refused", v20, v21, v22, v23, v24, v25);
      v15 = v35;
      v18 = v36;
      v14 = v37;
      v8 += 6;
      v26 = ccp_gotoptions[14 * (int)v10 + 4];
      LODWORD(a3) = v19;
    }
    else
    {
      v26 = v11[4];
    }
    if (v26)
      v27 = (int)a3 < 4;
    else
      v27 = 1;
    if (!v27 && *v8 == 26 && v8[1] == 4)
    {
      if (16 * *(unsigned __int16 *)&ccp_gotoptions[14 * (int)v10 + 10] - 120 != v8[2] || v8[3])
        return 0;
      v16 = 0;
      v8 += 4;
      LODWORD(a3) = a3 - 4;
    }
    if (ccp_gotoptions[14 * (int)v10 + 5])
      v28 = (int)a3 < 4;
    else
      v28 = 1;
    if (!v28 && *v8 == 24 && v8[1] == 4)
    {
      if (16 * *(unsigned __int16 *)&ccp_gotoptions[14 * (int)v10 + 10] - 120 != v8[2] || v8[3])
        return 0;
      v17 = 0;
      v8 += 4;
      LODWORD(a3) = a3 - 4;
    }
  }
  else
  {
    if (dword_10004A260[v10])
      return 0xFFFFFFFFLL;
    LODWORD(a3) = 0;
  }
  if (v16 | v17)
    v30 = v13;
  else
    v30 = 0;
  if (*v11)
    v31 = (int)a3 < 3;
  else
    v31 = 1;
  if (!v31 && *v8 == 21 && v8[1] == 3)
  {
    if ((*(unsigned __int16 *)&ccp_gotoptions[14 * (int)v10 + 8] | 0x20) != v8[2])
      return 0;
    v12 = 0;
    v8 += 3;
    LODWORD(a3) = a3 - 3;
  }
  if (ccp_gotoptions[14 * (int)v10 + 2])
    v32 = (int)a3 < 2;
  else
    v32 = 1;
  if (!v32 && *v8 == 1 && v8[1] == 2)
  {
    v14 = 0;
    v8 += 2;
    LODWORD(a3) = a3 - 2;
  }
  if (ccp_gotoptions[14 * (int)v10 + 3])
    v33 = (int)a3 < 2;
  else
    v33 = 1;
  if (v33)
  {
    if (!(_DWORD)a3)
      goto LABEL_53;
    return 0;
  }
  if (*v8 != 2)
    return 0;
  result = 0;
  if (v8[1] != 2)
    return result;
  v15 = 0;
  if ((_DWORD)a3 != 2)
    return 0;
LABEL_53:
  if (a1[2] == 9)
    return 1;
  *v11 = v12;
  v11[1] = v30;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  result = 1;
  *(_QWORD *)(v11 + 6) = v18;
  return result;
}

uint64_t sub_100009238(int *a1, char *__src, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  char *v11;
  int v12;
  int *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  uint64_t v19;
  char *v24;
  int v25;
  BOOL v26;
  char *v27;
  char v28;
  int v29;
  unsigned __int8 v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  char v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int mtu;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v64;
  __int16 *v65;
  _BYTE *v66;
  _WORD *v67;
  __int16 *v68;
  int v69;
  _BYTE *v70;
  char *v71;
  char *v72;
  _BYTE *v73;
  _BYTE *v74;
  _WORD *v75;
  __int16 *v77;
  _BYTE *v78;
  __int16 *v79;
  __int16 *v80;
  __int16 *v81;
  int *v82;
  _BYTE *v83;
  int v84;
  __int16 v85;
  __int128 v86;

  v8 = *a1;
  v9 = 7 * v8;
  v10 = *a3;
  v11 = (char *)&ccp_hisoptions[7 * v8];
  *(_QWORD *)(v11 + 6) = 0;
  *(_QWORD *)v11 = 0;
  if (v10 <= 0)
  {
    ccp_hisoptions[7 * (int)v8 + 6] = -1;
    return 2;
  }
  else
  {
    v12 = a4;
    v14 = a1;
    v78 = (char *)&ccp_allowoptions[v9 + 1] + 1;
    *((_WORD *)v11 + 6) = *__src;
    v77 = &ccp_allowoptions[v9 + 1];
    v71 = v11 + 2;
    v72 = v11 + 3;
    v75 = v11 + 8;
    v68 = &ccp_allowoptions[v9 + 4];
    v83 = (char *)&ccp_allowoptions[v9] + 1;
    v79 = &ccp_allowoptions[v9 + 2];
    v80 = &ccp_allowoptions[v9];
    v70 = (char *)&ccp_allowoptions[v9 + 2] + 1;
    v66 = v11 + 1;
    v67 = v11 + 10;
    v81 = &ccp_allowoptions[v9 + 3];
    v73 = v11 + 6;
    v74 = &ccp_hisoptions[7 * v8];
    v65 = &ccp_allowoptions[v9 + 5];
    v69 = 1;
    v15 = __src;
    v16 = 2;
    v17 = __src;
    do
    {
      if (v10 == 1)
      {
        v18 = 1;
LABEL_5:
        LODWORD(v19) = 4;
      }
      else
      {
        v18 = v17[1];
        if (v18 >= 2 && v10 >= v18)
        {
          v25 = *v17;
          LODWORD(v19) = 4;
          switch(*v17)
          {
            case 18:
              if (v18 != 6)
                break;
              v28 = *(_BYTE *)v81;
              if (!*(_BYTE *)v81)
                break;
              *v73 = 0;
              v29 = ~(4 * v17[2]) & 4;
              *v73 = ~(4 * v17[2]) & 4;
              v30 = v17[5];
              if ((v30 & 0x40) != 0)
              {
                v29 |= 2u;
                *v73 = v29;
                v30 = v17[5];
                if ((v30 & 0x20) == 0)
                {
LABEL_52:
                  if ((v30 & 0x80) == 0)
                    goto LABEL_53;
                  goto LABEL_94;
                }
              }
              else if ((v17[5] & 0x20) == 0)
              {
                goto LABEL_52;
              }
              v29 |= 1u;
              *v73 = v29;
              v30 = v17[5];
              if ((v30 & 0x80) == 0)
              {
LABEL_53:
                if ((v30 & 0x10) == 0)
                  goto LABEL_54;
                goto LABEL_95;
              }
LABEL_94:
              v29 |= 8u;
              *v73 = v29;
              v30 = v17[5];
              if ((v30 & 0x10) == 0)
              {
LABEL_54:
                if ((v30 & 1) == 0)
                  goto LABEL_56;
LABEL_55:
                v29 |= 0x10u;
                *v73 = v29;
                goto LABEL_56;
              }
LABEL_95:
              v29 |= 0x20u;
              *v73 = v29;
              if ((v17[5] & 1) != 0)
                goto LABEL_55;
LABEL_56:
              if (v17[2] >= 2u)
              {
                v29 |= 0x40u;
                *v73 = v29;
              }
              if (v17[3] || v17[4])
              {
                v29 |= 0x40u;
                *v73 = v29;
              }
              v31 = v29 | 0x40;
              if ((v17[5] & 0xE) == 0)
                v31 = v29;
              v32 = v31 & (v31 & 0x40 ^ 0xFFFFFFC7);
              if ((v31 & 0x78) != 0)
                v33 = 3;
              else
                v33 = 2;
              if (v17[5] & 0xE | v31 & 0x38 | v31 & 0x40)
                *v73 = v32;
              if ((v32 & 4) != 0 && refuse_mppe_stateful)
              {
                error("Refusing MPPE stateful mode offered by peer", (uint64_t)__src, (uint64_t)a3, a4, a5, a6, a7, a8, v64);
LABEL_71:
                v18 = 6;
                break;
              }
              if ((~v32 & 3) == 0)
              {
                if ((v28 & 2) != 0)
                {
                  v37 = 70;
                }
                else
                {
                  if ((v28 & 1) == 0)
                    goto LABEL_71;
                  v37 = 69;
                }
                LOBYTE(v32) = v32 & v37;
LABEL_118:
                *v73 = v32;
LABEL_119:
                v33 = 3;
                goto LABEL_133;
              }
              if ((v32 & 2) != 0)
              {
                if ((v28 & 2) == 0)
                  goto LABEL_71;
              }
              else
              {
                if ((v32 & 1) == 0)
                {
                  v38 = v28 & 3;
                  LOBYTE(v32) = v38 | v32;
                  if (v38)
                    goto LABEL_118;
                  goto LABEL_119;
                }
                if ((v28 & 1) == 0)
                  goto LABEL_71;
              }
LABEL_133:
              v17[2] = (v32 & 4) == 0;
              *(_WORD *)(v17 + 3) = 0;
              v17[5] = 0;
              v42 = (32 * *v73) & 0x40;
              v17[5] = v42;
              if ((*v73 & 1) != 0)
                v17[5] = v42 | 0x20;
              if (v33 == 2)
              {
                v84 = *(_DWORD *)v17;
                v85 = *((_WORD *)v17 + 2);
                v86 = mppe_send_key;
                if ((int)ccp_test(*v14, (uint64_t)&v84, 22, 1) < 1)
                {
                  error("MPPE required, but kernel has no support.", v43, v44, v45, v46, v47, v48, v49, v64);
                  lcp_close(*v14, "MPPE required but not available", v51, v52, v53, v54, v55, v56);
                }
                else
                {
                  mtu = netif_get_mtu();
                  if (mtu)
                  {
                    netif_set_mtu(*v14, mtu - 4);
                    LODWORD(v19) = 2;
                  }
                  v69 = 0;
                }
                goto LABEL_71;
              }
              v69 = 0;
              v18 = 6;
              LODWORD(v19) = 3;
              break;
            case 19:
            case 20:
            case 22:
            case 23:
            case 25:
              break;
            case 21:
              if (v18 != 3 || !*(_BYTE *)v80)
                break;
              v82 = v14;
              *v74 = 1;
              v34 = v17[2] & 0x1F;
              *v75 = v34;
              if ((v17[2] & 0xE0) == 0x20 && v34 >= 9 && (unsigned __int16)*v68 >= v34)
              {
                LODWORD(v19) = 2;
              }
              else
              {
                if (v12)
                {
                  LODWORD(v19) = 3;
LABEL_103:
                  v18 = 3;
                  goto LABEL_104;
                }
                v17[2] = *(_BYTE *)v68 | 0x20;
                LODWORD(v19) = 3;
              }
              if (v17 != __src)
                goto LABEL_103;
              v18 = 3;
              v39 = ccp_test(*v82, (uint64_t)__src, 3, 1);
              if (v39 > 0)
              {
LABEL_104:
                v14 = v82;
                break;
              }
              v40 = v34 - 1;
              v14 = v82;
              while (!(v39 | v12) && v40 != 8)
              {
                v17[2] = v40 | 0x20;
                LODWORD(v19) = 3;
                v39 = ccp_test(*v82, (uint64_t)__src, 3, 1);
                --v40;
                if (v39 > 0)
                {
                  v18 = 3;
                  goto LABEL_11;
                }
              }
              v17[2] = *(_BYTE *)v75 | 0x20;
              v18 = 3;
              goto LABEL_5;
            case 24:
            case 26:
              if (v18 != 4 || !*v83)
                break;
              if (v25 == 26 && !*(_BYTE *)v79 || v25 == 24 && !*v70)
              {
                v18 = 4;
                break;
              }
              v82 = v14;
              *v66 = 1;
              v35 = v17[2];
              v36 = (v35 >> 4) + 8;
              *v67 = (v35 >> 4) + 8;
              if ((v17[2] & 0xF) != 8 || v17[3] || (unsigned __int16)*v65 < v36 || v35 <= 0xF)
              {
                if (v12)
                {
                  v18 = 4;
                  LODWORD(v19) = 3;
                  goto LABEL_104;
                }
                v17[2] = 16 * *(_BYTE *)v65 - 120;
                v17[3] = 0;
                LODWORD(v19) = 3;
              }
              else
              {
                LODWORD(v19) = 2;
              }
              if (v17 != __src)
                goto LABEL_126;
              v18 = 4;
              v41 = ccp_test(*v82, (uint64_t)__src, 4, 1);
              while (2)
              {
                if (v41 <= 0)
                {
                  if (!(v41 | v12) && v36 != 9)
                  {
                    v17[2] = 16 * v36 + 120;
                    v18 = 4;
                    v41 = ccp_test(*v82, (uint64_t)__src, 4, 1);
                    LODWORD(v19) = 3;
                    --v36;
                    continue;
                  }
                  v17[2] = 16 * *(_BYTE *)v67 - 120;
                  LODWORD(v19) = 4;
LABEL_126:
                  v18 = 4;
                }
                break;
              }
              goto LABEL_104;
            default:
              if (v25 == 1)
              {
                if (v18 != 2 || !*(_BYTE *)v77)
                  break;
                v27 = v71;
              }
              else
              {
                if (v25 != 2 || v18 != 2 || !*v78)
                  break;
                v27 = v72;
              }
              *v27 = 1;
              LODWORD(v19) = 2;
              if (v17 == __src)
              {
                if ((int)ccp_test(*v14, (uint64_t)__src, 2, 1) >= 1)
                  LODWORD(v19) = 2;
                else
                  LODWORD(v19) = 4;
              }
              v18 = 2;
              break;
          }
        }
        else
        {
          LODWORD(v19) = 4;
          v18 = v10;
        }
      }
LABEL_11:
      if ((_DWORD)v19 != 3 || v12 == 0)
        v19 = v19;
      else
        v19 = 4;
      if ((_DWORD)v19 != 2)
      {
        if ((_DWORD)v19 == 3 && (_DWORD)v16 == 4)
        {
          v16 = 4;
        }
        else
        {
          if ((_DWORD)v16 == 3 && (_DWORD)v19 == 4)
            v24 = __src;
          else
            v24 = v15;
          if (v17 != v24)
            memcpy(v24, v17, v18);
          v15 = &v24[v18];
          v16 = v19;
        }
      }
      v17 += v18;
      v26 = __OFSUB__(v10, v18);
      v10 -= v18;
    }
    while (!((v10 < 0) ^ v26 | (v10 == 0)));
    if ((_DWORD)v16 != 2)
    {
      if ((_DWORD)v16 == 4)
      {
        if (v15 - __src == *a3)
          dword_10004A260[*v14] = 1;
        else
          *a3 = (_DWORD)v15 - (_DWORD)__src;
        v16 = 4;
        if (*(_BYTE *)v81 && v69)
        {
          error("MPPE required but peer negotiation failed", (uint64_t)__src, (uint64_t)a3, a4, a5, a6, a7, a8, v64);
          lcp_close(*v14, "MPPE required but peer negotiation failed", v57, v58, v59, v60, v61, v62);
        }
      }
      else
      {
        *a3 = (_DWORD)v15 - (_DWORD)__src;
      }
    }
  }
  return v16;
}

void sub_100009A1C(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
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
  uint64_t v20;
  const char *v21;
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
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  _BYTE v46[64];

  v2 = *a1;
  v3 = (int)v2;
  v4 = 7 * (int)v2;
  v5 = &ccp_gotoptions[v4 * 2];
  v6 = &ccp_hisoptions[v4];
  ccp_flags_set(v2, 1, 1);
  if (v5[1]
    || *v5
    || ccp_gotoptions[14 * (int)v3 + 2]
    || ccp_gotoptions[14 * (int)v3 + 3]
    || ccp_gotoptions[14 * (int)v3 + 6])
  {
    if (HIBYTE(ccp_hisoptions[7 * (int)v3])
      || *v6
      || LOBYTE(ccp_hisoptions[7 * (int)v3 + 1])
      || HIBYTE(ccp_hisoptions[7 * (int)v3 + 1])
      || LOBYTE(ccp_hisoptions[7 * (int)v3 + 3]))
    {
      if (*(unsigned __int16 *)&ccp_gotoptions[14 * v3 + 12] == (unsigned __int16)ccp_hisoptions[7 * v3 + 6])
      {
        v43 = sub_100009DD4((uint64_t)v5, (uint64_t)v6);
        notice("%s compression enabled", v14, v15, v16, v17, v18, v19, v20, v43);
      }
      else
      {
        v21 = sub_100009DD4((uint64_t)v5, 0);
        __strlcpy_chk(v46, v21, 64, 64);
        sub_100009DD4((uint64_t)v6, 0);
        notice("%s / %s compression enabled", v22, v23, v24, v25, v26, v27, v28, (int)v46);
      }
    }
    else
    {
      v45 = sub_100009DD4((uint64_t)v5, 0);
      notice("%s receive compression enabled", v36, v37, v38, v39, v40, v41, v42, v45);
    }
  }
  else if (HIBYTE(ccp_hisoptions[7 * (int)v3])
         || *v6
         || LOBYTE(ccp_hisoptions[7 * (int)v3 + 1])
         || HIBYTE(ccp_hisoptions[7 * (int)v3 + 1])
         || LOBYTE(ccp_hisoptions[7 * (int)v3 + 3]))
  {
    v44 = sub_100009DD4((uint64_t)v6, 0);
    notice("%s transmit compression enabled", v29, v30, v31, v32, v33, v34, v35, v44);
  }
  if (ccp_gotoptions[14 * (int)v3 + 6])
  {
    mppe_recv_key = 0uLL;
    mppe_send_key = 0uLL;
    continue_networks(*a1, v7, v8, v9, v10, v11, v12, v13);
  }
}

void sub_100009C60(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  v2 = *a1;
  if ((dword_10004A2A4[(int)v2] & 1) != 0)
  {
    untimeout((uint64_t)sub_10000A028, (uint64_t)a1);
    v2 = *a1;
  }
  dword_10004A2A4[(int)v2] = 0;
  ccp_flags_set(v2, 1, 0);
  v10 = *a1;
  v11 = &ccp_gotoptions[14 * *a1];
  v13 = v11[6];
  v12 = v11 + 6;
  if (v13)
  {
    *v12 = 0;
    if (*((_DWORD *)&lcp_fsm + 20 * v10 + 2) == 9)
    {
      error("MPPE disabled", v3, v4, v5, v6, v7, v8, v9, v20);
      lcp_close(*a1, "MPPE disabled", v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t sub_100009D20(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v16;
  int v17;

  v8 = a3;
  if ((_DWORD)a2 == 15)
  {
    v13 = (int)*a1;
    v14 = dword_10004A2A4[v13];
    if ((v14 & 1) != 0 && *((unsigned __int8 *)a1 + 17) == (_DWORD)a3)
    {
      dword_10004A2A4[v13] = v14 & 0xFFFFFFFC;
      untimeout((uint64_t)sub_10000A028, (uint64_t)a1);
    }
    notice("received CCP RESETACK", a2, a3, a4, a5, a6, a7, a8, v16);
    return 1;
  }
  if ((_DWORD)a2 == 14)
  {
    if (a1[2] == 9)
    {
      notice("received CCP RESETREQ", a2, a3, a4, a5, a6, a7, a8, v16);
      fsm_sdata(a1, 15, v8, 0, 0, v10, v11, v12, v17);
    }
    return 1;
  }
  return 0;
}

const char *sub_100009DD4(uint64_t a1, uint64_t a2)
{
  int v3;
  void *v4;
  char *v5;
  char v6;
  void *v7;
  char *v8;

  if (!*(_BYTE *)(a1 + 1) && !*(_BYTE *)a1 && !*(_BYTE *)(a1 + 2) && !*(_BYTE *)(a1 + 3) && !*(_BYTE *)(a1 + 6))
    return "(none)";
  v3 = *(__int16 *)(a1 + 12);
  switch(*(_WORD *)(a1 + 12))
  {
    case 0x12:
      slprintf((int)&unk_10004A264, 64, "MPPE ");
      v6 = *(_BYTE *)(a1 + 6);
      if ((v6 & 2) != 0)
      {
        slprintf((int)&unk_10004A269, 59, "128-bit ");
        v6 = *(_BYTE *)(a1 + 6);
        v7 = &unk_10004A271;
        if ((v6 & 1) == 0)
          goto LABEL_24;
      }
      else
      {
        v7 = &unk_10004A269;
        if ((*(_BYTE *)(a1 + 6) & 1) == 0)
          goto LABEL_24;
      }
      slprintf((int)v7, &unk_10004A264 - (_DWORD)v7 + 64, "40-bit ");
      LODWORD(v7) = (_DWORD)v7 + 7;
      v6 = *(_BYTE *)(a1 + 6);
LABEL_24:
      if ((v6 & 4) != 0)
        v8 = "stateful";
      else
        v8 = "stateless";
      slprintf((int)v7, &unk_10004A264 - (_DWORD)v7 + 64, v8);
      v4 = &unk_10004A264;
      break;
    case 0x13:
    case 0x14:
    case 0x16:
    case 0x17:
    case 0x19:
      goto LABEL_13;
    case 0x15:
      if (!a2 || *(unsigned __int16 *)(a2 + 8) == *(unsigned __int16 *)(a1 + 8))
      {
        v4 = &unk_10004A264;
        v5 = "BSD-Compress (%d)";
      }
      else
      {
        v4 = &unk_10004A264;
        v5 = "BSD-Compress (%d/%d)";
      }
      goto LABEL_29;
    case 0x18:
    case 0x1A:
      if (!a2 || *(unsigned __int16 *)(a2 + 10) == *(unsigned __int16 *)(a1 + 10))
      {
        v4 = &unk_10004A264;
        v5 = "Deflate%s (%d)";
      }
      else
      {
        v4 = &unk_10004A264;
        v5 = "Deflate%s (%d/%d)";
      }
      goto LABEL_29;
    default:
      if (v3 == 1)
        return "Predictor 1";
      if (v3 == 2)
        return "Predictor 2";
LABEL_13:
      v4 = &unk_10004A264;
      v5 = "Method %d";
LABEL_29:
      slprintf((int)&unk_10004A264, 64, v5);
      return (const char *)v4;
  }
  return (const char *)v4;
}

void sub_10000A028(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v11;
  int v12;

  v8 = *a1;
  if (a1[2] != 9 || (dword_10004A2A4[v8] & 2) == 0)
  {
    v11 = dword_10004A2A4[v8] & 0xFFFFFFFE;
  }
  else
  {
    fsm_sdata((unsigned int *)a1, 14, *((_BYTE *)a1 + 17), 0, 0, a6, a7, a8, v12);
    timeout((int)sub_10000A028);
    v8 = *a1;
    v11 = dword_10004A2A4[v8] & 0xFFFFFFFD;
  }
  dword_10004A2A4[v8] = v11;
}

double mppe_set_keys(const void *a1, const void *a2)
{
  double result;
  CC_SHA1_CTX v5;
  double md[2];

  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  CC_SHA1_Update(&v5, a2, 0x10u);
  CC_SHA1_Update(&v5, a2, 0x10u);
  CC_SHA1_Update(&v5, a1, 8u);
  CC_SHA1_Final((unsigned __int8 *)md, &v5);
  result = md[0];
  mppe_send_key = *(_OWORD *)md;
  mppe_recv_key = *(_OWORD *)md;
  return result;
}

void ChapMS(const void *a1, char *a2, int a3, uint64_t a4)
{
  _BYTE *v8;
  double v9;
  uint8x8_t v10;
  unsigned __int8 v11[16];
  __int128 md;
  _BYTE data[512];

  *(_BYTE *)(a4 + 48) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  v8 = (_BYTE *)(a4 + 24);
  sub_10000A728(a2, a3, data);
  CC_MD4(data, 2 * a3, (unsigned __int8 *)&md);
  sub_10000A780((uint64_t)a1, &md, v8, v9, v10);
  *(_BYTE *)(a4 + 48) = 1;
  sub_10000A728(a2, a3, data);
  CC_MD4(data, 2 * a3, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v11);
  mppe_set_keys(a1, v11);
  mppe_keys_set = 1;
}

uint64_t ChapMS2(const void *a1, _OWORD *a2, char *__s, char *a4, int a5, _BYTE *a6, char *a7, int a8)
{
  uint64_t i;
  double v16;
  const void *v17;
  double v18;
  uint8x8_t v19;
  unsigned __int8 *v20;
  size_t v21;
  int v22;
  __int128 v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t result;
  _OWORD v27[6];
  _OWORD v28[6];
  unsigned __int8 v29[32];
  unsigned __int8 v30[16];
  __int128 v31;
  unint64_t v32;
  unsigned __int8 v33[16];
  __int128 v34;
  uint64_t v35;
  unsigned __int8 v36[20];
  unsigned __int8 v37[20];
  unsigned __int8 v38[16];
  unsigned __int8 v39[16];
  _BYTE data[512];
  CC_SHA1_CTX md;

  a6[48] = 0;
  *((_OWORD *)a6 + 1) = 0u;
  *((_OWORD *)a6 + 2) = 0u;
  *(_OWORD *)a6 = 0u;
  if (a2)
  {
    *(_OWORD *)a6 = *a2;
  }
  else
  {
    for (i = 0; i != 16; ++i)
    {
      v16 = drand48() * 254.0;
      a6[i] = (int)v16 + 1;
      byte_10004A2A8[i] = (int)v16 + 1;
    }
  }
  v17 = a6 + 24;
  sub_10000A82C(a6, a1, __s, v28);
  sub_10000A728(a4, a5, data);
  CC_MD4(data, 2 * a5, (unsigned __int8 *)&md);
  sub_10000A780((uint64_t)v28, (__int128 *)&md, a6 + 24, v18, v19);
  qmemcpy(v27, "Magic server to client signing constant", 39);
  qmemcpy(v28, "Pad to make it do more than one iteration", 41);
  memset(&md, 0, sizeof(md));
  sub_10000A728(a4, a5, data);
  CC_MD4(data, 2 * a5, v30);
  CC_MD4(v30, 0x10u, v29);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v29, 0x10u);
  CC_SHA1_Update(&md, a6 + 24, 0x18u);
  CC_SHA1_Update(&md, v27, 0x27u);
  v20 = v33;
  CC_SHA1_Final(v33, &md);
  sub_10000A82C(a6, a1, __s, v37);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v33, 0x14u);
  CC_SHA1_Update(&md, v37, 8u);
  v21 = 41;
  CC_SHA1_Update(&md, v28, 0x29u);
  CC_SHA1_Final(v33, &md);
  do
  {
    v22 = *v20++;
    snprintf(a7, v21, "%02X", v22);
    v21 -= 2;
    a7 += 2;
  }
  while (v21 != 1);
  memset(&md, 0, sizeof(md));
  v35 = 0;
  *(_OWORD *)v33 = 0u;
  v34 = 0u;
  v32 = 0xF2F2F2F2F2F2F2F2;
  *(_QWORD *)&v23 = 0xF2F2F2F2F2F2F2F2;
  *((_QWORD *)&v23 + 1) = 0xF2F2F2F2F2F2F2F2;
  *(_OWORD *)v30 = v23;
  v31 = v23;
  qmemcpy(v29, "This is the MPPE Master Key", 27);
  qmemcpy(v28, "On the client side, this is the send key; on the server side, it is the receive key.", 84);
  qmemcpy(v27, "On the client side, this is the receive key; on the server side, it is the send key.", 84);
  sub_10000A728(a4, a5, data);
  CC_MD4(data, 2 * a5, v39);
  CC_MD4(v39, 0x10u, v38);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v38, 0x10u);
  CC_SHA1_Update(&md, v17, 0x18u);
  CC_SHA1_Update(&md, v29, 0x1Bu);
  CC_SHA1_Final(v37, &md);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v37, 0x10u);
  CC_SHA1_Update(&md, v33, 0x28u);
  if (a8)
    v24 = v27;
  else
    v24 = v28;
  if (a8)
    v25 = v28;
  else
    v25 = v27;
  CC_SHA1_Update(&md, v24, 0x54u);
  CC_SHA1_Update(&md, v30, 0x28u);
  CC_SHA1_Final(v36, &md);
  mppe_send_key = *(_OWORD *)v36;
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v37, 0x10u);
  CC_SHA1_Update(&md, v33, 0x28u);
  CC_SHA1_Update(&md, v25, 0x54u);
  CC_SHA1_Update(&md, v30, 0x28u);
  result = CC_SHA1_Final(v36, &md);
  mppe_recv_key = *(_OWORD *)v36;
  mppe_keys_set = 1;
  return result;
}

_QWORD *chapms_init()
{
  chap_register_digest((uint64_t)&unk_100041EC8);
  chap_register_digest((uint64_t)&unk_100041F10);
  return add_options((uint64_t)&unk_10004A2B8);
}

void chapms_reinit()
{
  byte_10004A318 = 0;
  byte_10004A2A8 = 0;
}

void sub_10000A728(char *a1, int a2, _BYTE *a3)
{
  _BYTE *v3;
  uint64_t v6;
  char v7;

  v3 = a3;
  bzero(a3, 2 * a2);
  if (a2 >= 1)
  {
    v6 = a2;
    do
    {
      v7 = *a1++;
      *v3 = v7;
      v3 += 2;
      --v6;
    }
    while (v6);
  }
}

uint64_t sub_10000A780(uint64_t a1, __int128 *a2, _BYTE *a3, double a4, uint8x8_t a5)
{
  uint8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;
  uint8x8_t v10;
  __int128 v12;
  int v13;
  char v14;

  v14 = 0;
  v13 = 0;
  v12 = *a2;
  DesSetkey((uint64_t)&v12, *(uint8x8_t *)&v12, a5);
  DesEncrypt(a1, a3);
  DesSetkey((uint64_t)&v12 + 7, v7, v8);
  DesEncrypt(a1, a3 + 8);
  DesSetkey((unint64_t)&v12 | 0xE, v9, v10);
  return DesEncrypt(a1, a3 + 16);
}

uint64_t sub_10000A82C(const void *a1, const void *a2, char *__s, _QWORD *a4)
{
  const char *v5;
  char *v8;
  CC_LONG v9;
  uint64_t result;
  CC_SHA1_CTX v11;
  unsigned __int8 md[24];

  v5 = __s;
  memset(&v11, 0, sizeof(v11));
  v8 = strrchr(__s, 92);
  if (v8)
    v5 = v8 + 1;
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, a2, 0x10u);
  v9 = strlen(v5);
  CC_SHA1_Update(&v11, v5, v9);
  result = CC_SHA1_Final(md, &v11);
  *a4 = *(_QWORD *)md;
  return result;
}

_BYTE *sub_10000A908(_BYTE *a1)
{
  *a1 = 8;
  return random_bytes(a1 + 1, 8);
}

uint64_t sub_10000A918(int a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;

  v8 = a8;
  v9 = a7;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  if (*(_BYTE *)a6 == 49)
  {
    if (*(_BYTE *)(a6 + 49))
    {
      ChapMS((const void *)(a5 + 1), a3, a4, (uint64_t)&v15);
      if (*(_QWORD *)(a6 + 25) == *((_QWORD *)&v16 + 1)
        && *(_QWORD *)(a6 + 33) == (_QWORD)v17
        && *(_QWORD *)(a6 + 41) == *((_QWORD *)&v17 + 1))
      {
        slprintf(v9, v8, "Access granted");
        return 1;
      }
    }
    else
    {
      notice("Peer request for LANMAN auth not supported", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v14);
    }
  }
  slprintf(v9, v8, "E=691 R=1 C=%0.*B V=0");
  return 0;
}

void sub_10000AA2C(_BYTE *a1, int a2, int a3, uint64_t a4, char *a5, int a6)
{
  *a1 = 49;
  ChapMS((const void *)(a4 + 1), a5, a6, (uint64_t)(a1 + 1));
}

uint64_t sub_10000AA4C(const void *a1, int a2, char *a3, int a4)
{
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  int v28;
  char *v29;
  BOOL v30;
  unsigned int v31;
  BOOL v33;
  char *v34;
  int v35;
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
  int v50;

  v8 = (char *)malloc_type_malloc(a2 + 1, 0xB0DF468EuLL);
  if (!v8)
  {
    notice("Out of memory in chapms_handle_failure", v9, v10, v11, v12, v13, v14, v15, v50);
    return 0;
  }
  v16 = v8;
  memcpy(v8, a1, a2);
  v17 = &v16[a2];
  *v17 = 0;
  if (!strncmp(v16, "E=", 2uLL))
  {
    v27 = strtol(v16 + 2, 0, 10);
    v28 = v27;
    if (a2)
    {
      v29 = strstr(v16, " R=");
      if (v29)
      {
        if (retry_password_hook)
          v30 = v29[3] == 49;
        else
          v30 = 0;
        if (v30)
          v31 = 2;
        else
          v31 = 0;
      }
      else
      {
        v31 = 0;
      }
      if (change_password_hook)
        v33 = v28 == 648;
      else
        v33 = 0;
      if (v33)
        v25 = 1;
      else
        v25 = v31;
      v34 = strstr(v16, " M=");
      if (v34)
      {
        LODWORD(v17) = (_DWORD)v34 + 3;
        strncpy(a3, v34 + 3, a4 - 1);
        a3[a4] = 0;
        goto LABEL_4;
      }
    }
    else
    {
      v25 = v27 == 648 && change_password_hook != 0;
    }
    v35 = v28 - 646;
    v17 = "E=646 Restricted logon hours";
    switch(v35)
    {
      case 0:
        goto LABEL_4;
      case 1:
        v17 = "E=647 Account disabled";
        goto LABEL_4;
      case 2:
        v17 = "E=648 Password expired";
        goto LABEL_4;
      case 3:
        v17 = "E=649 No dialin permission";
        goto LABEL_4;
      default:
        if ("E=646 Restricted logon hours" == 691)
        {
          v17 = "E=691 Authentication failure";
          goto LABEL_4;
        }
        if ("E=646 Restricted logon hours" == 709)
        {
          v17 = "E=709 Error changing password";
          goto LABEL_4;
        }
        free(v16);
        error("error %d", v36, v37, v38, v39, v40, v41, v42, (int)"E=646 Restricted logon hours");
        error("Unknown MS-CHAP authentication failure: %.*v", v43, v44, v45, v46, v47, v48, v49, a2);
        break;
    }
    return 0;
  }
  v25 = 0;
LABEL_4:
  error("MS-CHAP authentication failed: %v", v18, v19, v20, v21, v22, v23, v24, (int)v17);
  free(v16);
  return v25;
}

_BYTE *sub_10000AC78(_BYTE *a1)
{
  *a1 = 16;
  return random_bytes(a1 + 1, 16);
}

uint64_t sub_10000AC88(int a1, char *__s, char *a3, int a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  BOOL v11;
  BOOL v12;
  char *v14;
  char v15[41];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;

  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  if (*(_BYTE *)a6 == 49
    && ((ChapMS2((const void *)(a5 + 1), (_OWORD *)(a6 + 1), __s, a3, a4, &v16, v15, 1),
         *((_QWORD *)&v17 + 1) == *(_QWORD *)(a6 + 25))
      ? (v11 = (_QWORD)v18 == *(_QWORD *)(a6 + 33))
      : (v11 = 0),
        v11 ? (v12 = *((_QWORD *)&v18 + 1) == *(_QWORD *)(a6 + 41)) : (v12 = 0),
        v12))
  {
    if (*(_BYTE *)(a6 + 49))
      v14 = "S=%s";
    else
      v14 = "S=%s M=%s";
    slprintf(a7, a8, v14);
    return 1;
  }
  else
  {
    slprintf(a7, a8, "E=691 R=1 C=%0.*B V=0 M=%s");
    return 0;
  }
}

uint64_t sub_10000ADCC(_BYTE *a1, int a2, char *a3, uint64_t a4, char *a5, int a6, char *a7)
{
  char v7;
  BOOL v8;
  char *v9;
  uint64_t result;

  v7 = a2;
  *a1 = 49;
  if (byte_10004A2A8[0])
    v8 = byte_10004A318 == a2;
  else
    v8 = 0;
  if (v8)
    v9 = byte_10004A2A8;
  else
    v9 = 0;
  result = ChapMS2((const void *)(a4 + 1), v9, a3, a5, a6, a1 + 1, a7, 0);
  byte_10004A318 = v7;
  return result;
}

uint64_t sub_10000AE30(const char *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned int v10;
  char *v12;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v8 = a2 - 42;
  if ((int)a2 < 42)
    goto LABEL_3;
  v10 = a2;
  if (strncmp(a1, "S=", 2uLL))
    goto LABEL_3;
  if (memcmp(a1 + 2, a3, 0x28uLL))
  {
    v12 = "MS-CHAPv2 mutual authentication failed.";
    goto LABEL_4;
  }
  v14 = a1 + 42;
  if (v10 < 0x2D)
  {
    if (v8)
    {
      dbglog("Rcvd non-conforming MSCHAPv2 Success packet, len=%d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v8);
      if (v10 < 0x2C)
        goto LABEL_3;
      goto LABEL_12;
    }
  }
  else if (strncmp(v14, " M=", 3uLL))
  {
    dbglog("Rcvd non-conforming MSCHAPv2 Success packet, len=%d", v15, v16, v17, v18, v19, v20, v21, v8);
LABEL_12:
    if (!strncmp(v14, "M=", 2uLL))
      return 1;
LABEL_3:
    v12 = "MS-CHAPv2 Success packet is badly formed.";
LABEL_4:
    error(v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8, v22);
    return 0;
  }
  return 1;
}

uint64_t sub_10000AF24(uint64_t a1, char *a2, _BYTE *a3, char *a4, int a5, char *a6, int a7, char *a8)
{
  int v13;
  int v14;
  uint64_t v15;
  int8x16_t v16;
  int8x16_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  int v20;
  unsigned __int8 v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint8x8_t v26;
  uint8x8_t v27;
  uint8x8_t v28;
  uint8x8_t v29;
  int v30;
  unsigned __int8 *v31;
  unsigned __int8 __src[8];
  int v37;
  unsigned __int8 md[16];
  _BYTE v39[512];
  int v40;
  unsigned __int8 v41[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int16 v57;
  _BYTE data[512];

  v13 = a3[2];
  v14 = a3[3];
  *(_BYTE *)a1 = 7;
  *(_BYTE *)(a1 + 1) = a3[1] + 1;
  *(_WORD *)(a1 + 2) = 18946;
  sub_10000A728(a4, a5, data);
  CC_MD4(data, 2 * a5, md);
  sub_10000A728(a6, a7, __src);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  *(_OWORD *)v41 = 0u;
  v42 = 0u;
  random_bytes(v39, 516);
  memcpy(&v39[512 - 2 * a7], __src, 2 * a7);
  v15 = 0;
  v40 = 2 * a7;
  v16 = (int8x16_t)xmmword_10003B0B0;
  v17.i64[0] = 0x1010101010101010;
  v17.i64[1] = 0x1010101010101010;
  do
  {
    *(int8x16_t *)&v41[v15] = v16;
    v15 += 16;
    v16 = vaddq_s8(v16, v17);
  }
  while (v15 != 256);
  v18 = 0;
  v19 = 0;
  v57 = 0;
  v20 = v14 | (v13 << 8);
  do
  {
    v21 = v41[v18];
    v19 += v21 + md[v18 & 0xF];
    v41[v18] = v41[v19];
    v41[v19] = v21;
    ++v18;
  }
  while (v18 != 256);
  v22 = 0;
  v23 = v57;
  v24 = HIBYTE(v57);
  do
  {
    v25 = v41[++v23];
    v24 += v25;
    v41[v23] = v41[v24];
    v41[v24] = v25;
    *(_BYTE *)(a1 + 4 + v22) = v41[(v41[v23] + v25)] ^ v39[v22];
    ++v22;
  }
  while (v22 != 516);
  sub_10000A728(a4, a5, v39);
  CC_MD4(v39, 2 * a5, __src);
  sub_10000A728(a6, a7, data);
  CC_MD4(data, 2 * a7, v41);
  DesSetkey((uint64_t)v41, v26, v27);
  DesEncrypt((uint64_t)__src, (_BYTE *)(a1 + 520));
  DesSetkey((uint64_t)&v41[7], v28, v29);
  DesEncrypt((uint64_t)&v37, (_BYTE *)(a1 + 528));
  v30 = v20 - 4;
  if (v20 != 4)
  {
    v31 = a3 + 7;
    while (strncmp((const char *)v31 - 3, " C=", 3uLL))
    {
      ++v31;
      if (!--v30)
        goto LABEL_13;
    }
    sub_10000B354(v31, (uint64_t)v39);
    ChapMS2(v39, 0, a2, a6, a7, (_BYTE *)(a1 + 536), a8, 0);
  }
LABEL_13:
  *(_BYTE *)(a1 + 585) = 0;
  return 0;
}

uint64_t sub_10000B214(_BYTE *a1, char *__s, uint64_t a3, char *a4, int a5, char *a6)
{
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned __int8 *i;
  _BYTE v17[64];

  v12 = strlen(__s);
  v13 = __rev16(*(unsigned __int16 *)(a3 + 2));
  *a1 = 2;
  a1[1] = *(_BYTE *)(a3 + 1) + 1;
  a1[2] = (unsigned __int16)(v12 + 54) >> 8;
  a1[3] = v12 + 54;
  v14 = v13 - 4;
  if (v13 != 4)
  {
    for (i = (unsigned __int8 *)(a3 + 7); strncmp((const char *)i - 3, " C=", 3uLL); ++i)
    {
      if (!--v14)
        return 0;
    }
    sub_10000B354(i, (uint64_t)v17);
    a1[4] = 49;
    ChapMS2(v17, 0, __s, a4, a5, a1 + 5, a6, 0);
    memcpy(a1 + 54, __s, v12);
  }
  return 0;
}

unsigned __int8 *sub_10000B354(unsigned __int8 *result, uint64_t a2)
{
  uint64_t i;
  int v3;
  char v4;
  char v5;
  int v6;
  char v7;

  for (i = 0; i != 64; ++i)
  {
    v3 = *result;
    v4 = v3 - 48;
    if ((v3 - 48) >= 0xA)
    {
      if ((v3 - 97) > 5)
      {
        if ((v3 - 65) >= 6)
          v4 = *(_BYTE *)(a2 + i);
        else
          v4 = v3 - 55;
      }
      else
      {
        v4 = v3 - 87;
      }
    }
    v5 = 16 * v4;
    *(_BYTE *)(a2 + i) = 16 * v4;
    v6 = result[1];
    v7 = v6 - 48;
    if ((v6 - 48) >= 0xA)
    {
      if ((v6 - 97) > 5)
      {
        if ((v6 - 65) > 5)
          goto LABEL_14;
        v7 = v6 - 55;
      }
      else
      {
        v7 = v6 - 87;
      }
    }
    *(_BYTE *)(a2 + i) = v7 | v5;
LABEL_14:
    result += 2;
  }
  return result;
}

uint64_t demand_conf()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  __int16 *v16;
  __int16 **v17;
  uint64_t (*v18)(_QWORD);
  __int16 *v19;
  int v20;

  framemax = 1506;
  frame = (uint64_t)malloc_type_malloc(0x5E2uLL, 0xF85FA6C4uLL);
  if (!frame)
    novm((int)"demand frame", v0, v1, v2, v3, v4, v5, v6);
  framelen = 0;
  pend_q = 0;
  escape_flag = 0;
  flush_flag = 0;
  fcs = 0xFFFF;
  if (dword_1000479A8 >= 1500)
    v7 = 1500;
  else
    v7 = dword_1000479A8;
  netif_set_mtu(0, v7);
  if ((ppp_send_config(0, 1500, 0, 0, 0) & 0x80000000) != 0
    || (result = ppp_recv_config(0, 1500, 0, 0, 0), (result & 0x80000000) != 0))
  {
    fatal("Couldn't set up demand-dialled PPP interface: %m", v8, v9, v10, v11, v12, v13, v14, v20);
  }
  v16 = protocols;
  if (protocols)
  {
    v17 = (__int16 **)&off_100043898;
    do
    {
      if (*((_BYTE *)v16 + 80))
      {
        v18 = (uint64_t (*)(_QWORD))*((_QWORD *)v16 + 15);
        if (v18)
        {
          result = v18(0);
          if (!(_DWORD)result)
            die(1);
        }
      }
      v19 = *v17++;
      v16 = v19;
    }
    while (v19);
  }
  return result;
}

uint64_t demand_block()
{
  __int16 *v0;
  __int16 **v1;
  __int16 *v2;

  v0 = protocols;
  if (protocols)
  {
    v1 = (__int16 **)&off_100043898;
    do
    {
      if (*((_BYTE *)v0 + 80) && *((_QWORD *)v0 + 15))
        sifnpmode(0, *v0 & 0x7FFF, 3);
      v2 = *v1++;
      v0 = v2;
    }
    while (v2);
  }
  return get_loop_output();
}

_QWORD *demand_discard()
{
  __int16 *v0;
  __int16 **v1;
  __int16 *v2;
  _QWORD *result;
  _QWORD *v4;

  v0 = protocols;
  if (protocols)
  {
    v1 = (__int16 **)&off_100043898;
    do
    {
      if (*((_BYTE *)v0 + 80) && *((_QWORD *)v0 + 15))
        sifnpmode(0, *v0 & 0x7FFF, 2);
      v2 = *v1++;
      v0 = v2;
    }
    while (v2);
  }
  get_loop_output();
  result = (_QWORD *)pend_q;
  if (pend_q)
  {
    do
    {
      v4 = (_QWORD *)result[1];
      free(result);
      result = v4;
    }
    while (v4);
  }
  pend_q = 0;
  framelen = 0;
  flush_flag = 0;
  escape_flag = 0;
  fcs = 0xFFFF;
  return result;
}

uint64_t demand_unblock()
{
  __int16 *v0;
  __int16 **v1;
  uint64_t result;
  __int16 *v3;

  v0 = protocols;
  if (protocols)
  {
    v1 = (__int16 **)&off_100043898;
    do
    {
      if (*((_BYTE *)v0 + 80))
      {
        if (*((_QWORD *)v0 + 15))
          result = sifnpmode(0, *v0 & 0x7FFF, 0);
      }
      v3 = *v1++;
      v0 = v3;
    }
    while (v3);
  }
  return result;
}

uint64_t loop_chars(unsigned __int8 *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  uint64_t v17;

  if (a2 >= 1)
  {
    v9 = 0;
    v10 = a2 + 1;
    while (1)
    {
      v12 = *a1++;
      v11 = v12;
      if (v12 == 126)
      {
        v13 = framelen;
        if (escape_flag)
          v14 = 0;
        else
          v14 = flush_flag == 0;
        if (v14 && framelen >= 3 && fcs == 61624)
        {
          framelen -= 2;
          if (loop_frame(frame, (v13 - 2), a3, a4, a5, a6, a7, a8))
            v9 = 1;
          else
            v9 = v9;
        }
        framelen = 0;
        flush_flag = 0;
        escape_flag = 0;
        fcs = 0xFFFF;
        goto LABEL_20;
      }
      if (!flush_flag)
      {
        if (escape_flag)
        {
          LOBYTE(v11) = v11 ^ 0x20;
          escape_flag = 0;
LABEL_26:
          v17 = framelen;
          if (framelen >= framemax)
          {
            flush_flag = 1;
          }
          else
          {
            ++framelen;
            *(_BYTE *)(frame + v17) = v11;
            fcs = word_10003B0C0[(fcs ^ v11)] ^ (fcs >> 8);
          }
          goto LABEL_20;
        }
        if (v11 != 125)
          goto LABEL_26;
        escape_flag = 1;
      }
LABEL_20:
      if (--v10 <= 1)
        return v9;
    }
  }
  return 0;
}

uint64_t loop_frame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v10;
  __int16 **i;
  unsigned int v12;
  unsigned int v13;
  int v14;
  __int16 *v16;
  uint64_t result;
  uint64_t (*v18)(uint64_t, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;

  dbglog("Dial on demand: %P", a2, a3, a4, a5, a6, a7, a8, a1);
  if ((int)a2 < 4)
    return 0;
  if (*(char *)(a1 + 2) < 0)
    return 0;
  v10 = protocols;
  if (!protocols)
    return 0;
  for (i = (__int16 **)&off_100043898; ; ++i)
  {
    v12 = (unsigned __int16)*v10;
    v13 = v12 >> 14;
    v14 = v12 & 0x7FFF;
    if (v13 <= 2 && (*(unsigned __int8 *)(a1 + 3) | (*(unsigned __int8 *)(a1 + 2) << 8)) == v14)
      break;
    v16 = *i;
    v10 = v16;
    if (!v16)
      return 0;
  }
  if (!*((_BYTE *)v10 + 80))
    return 0;
  v18 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v10 + 16);
  if (!v18 || (result = v18(a1, a2), (_DWORD)result))
  {
    v19 = malloc_type_malloc(a2 + 24, 0x79C8835EuLL);
    if (v19)
    {
      v20 = (uint64_t)v19;
      *(_DWORD *)v19 = a2;
      v19[1] = 0;
      memcpy(v19 + 2, (const void *)a1, a2);
      v21 = &pend_q;
      if (pend_q)
        v21 = (uint64_t *)(pend_qtail + 8);
      *v21 = v20;
      pend_qtail = v20;
    }
    return 1;
  }
  return result;
}

void demand_rexmit(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  unsigned __int16 *v11;
  uint64_t *v12;
  int v13;

  v8 = pend_q;
  pend_q = 0;
  if (!v8)
  {
    v12 = &pend_qtail;
    goto LABEL_13;
  }
  v10 = 0;
  do
  {
    while (1)
    {
      v11 = (unsigned __int16 *)v8;
      v8 = *(_QWORD *)(v8 + 8);
      if (a1 != bswap32(v11[9]) >> 16)
        break;
      output(0, (uint64_t)(v11 + 8), *(unsigned int *)v11, a4, a5, a6, a7, a8, v13);
      free(v11);
      if (!v8)
        goto LABEL_10;
    }
    if (v10)
      *(_QWORD *)(v10 + 8) = v11;
    else
      pend_q = (uint64_t)v11;
    v10 = (uint64_t)v11;
  }
  while (v8);
LABEL_10:
  pend_qtail = v10;
  if (v10)
  {
    v12 = (uint64_t *)(v10 + 8);
LABEL_13:
    *v12 = 0;
  }
}

double fsm_init(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)&result = 0xA00000003;
  *(_QWORD *)(a1 + 20) = 0xA00000003;
  *(_DWORD *)(a1 + 32) = 2;
  *(_DWORD *)(a1 + 40) = 5;
  *(_DWORD *)(a1 + 48) = 255;
  *(_DWORD *)(a1 + 72) = 0;
  return result;
}

void fsm_lowerup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int v10;

  v9 = *(_DWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 != 1)
      return;
    if ((*(_BYTE *)(a1 + 12) & 4) != 0)
    {
      v10 = 3;
    }
    else
    {
      sub_10000BA0C((int *)a1, 0, a3, a4, a5, a6, a7, a8);
      v10 = 6;
    }
  }
  else
  {
    v10 = 2;
  }
  *(_DWORD *)(a1 + 8) = v10;
}

void sub_10000BA0C(int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v10)(int *);
  char v11;
  uint64_t v12;
  uint64_t (*v13)(int *);
  int v14;
  int v15;
  uint64_t v16;
  void (*v17)(int *, char *, unsigned int *);
  int v18;
  unsigned int v19;

  if ((a1[2] - 6) >= 3)
  {
    v10 = (void (*)(int *))**((_QWORD **)a1 + 7);
    if (v10)
      v10(a1);
    a1[9] = 0;
    a1[11] = 0;
  }
  if (!a2)
  {
    a1[7] = a1[6];
    v11 = *((_BYTE *)a1 + 16) + 1;
    *((_BYTE *)a1 + 16) = v11;
    *((_BYTE *)a1 + 17) = v11;
    ++a1[11];
  }
  *((_BYTE *)a1 + 18) = 0;
  v12 = *((_QWORD *)a1 + 7);
  v13 = *(uint64_t (**)(int *))(v12 + 8);
  if (v13 && *(_QWORD *)(v12 + 16))
  {
    v14 = v13(a1);
    v15 = peer_mru[*a1] - 4;
    if (v14 >= v15)
      v16 = v15;
    else
      v16 = v14;
    v19 = v16;
    v17 = *(void (**)(int *, char *, unsigned int *))(*((_QWORD *)a1 + 7) + 16);
    if (v17)
    {
      v17(a1, &byte_100048124, &v19);
      v16 = v19;
    }
  }
  else
  {
    v16 = 0;
    v19 = 0;
  }
  fsm_sdata((unsigned int *)a1, 1, *((_BYTE *)a1 + 17), &byte_100048124, v16, a6, a7, a8, v18);
  --a1[7];
  timeout((int)sub_10000BBE8);
}

void fsm_lowerdown(uint64_t a1)
{
  void (*v2)(uint64_t);
  void (*v3)(uint64_t);

  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      *(_DWORD *)(a1 + 8) = 0;
      break;
    case 3:
      *(_DWORD *)(a1 + 8) = 1;
      v2 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 72);
      if (v2)
        v2(a1);
      break;
    case 4:
      *(_DWORD *)(a1 + 8) = 0;
      goto LABEL_3;
    case 5:
    case 6:
    case 7:
    case 8:
      *(_DWORD *)(a1 + 8) = 1;
LABEL_3:
      untimeout((uint64_t)sub_10000BBE8, a1);
      break;
    case 9:
      v3 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
      if (v3)
        v3(a1);
      *(_DWORD *)(a1 + 8) = 1;
      break;
    default:
      return;
  }
}

void sub_10000BBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  char v12;
  int v13;
  void (*v14)(uint64_t);
  int v15;

  v9 = *(_DWORD *)(a1 + 8);
  if ((v9 - 6) >= 3)
  {
    if ((v9 - 4) > 1)
      return;
    if (*(int *)(a1 + 28) > 0)
    {
      v12 = *(_BYTE *)(a1 + 16) + 1;
      *(_BYTE *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 17) = v12;
      fsm_sdata((unsigned int *)a1, 5, v12, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v15);
      timeout((int)sub_10000BBE8);
      --*(_DWORD *)(a1 + 28);
      return;
    }
    if (v9 == 4)
      v13 = 2;
    else
      v13 = 3;
    *(_DWORD *)(a1 + 8) = v13;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (*(int *)(a1 + 28) > 0)
    {
      v11 = *(void (**)(uint64_t))(v10 + 96);
      if (v11)
        v11(a1);
      sub_10000BA0C(a1, 1);
      if (*(_DWORD *)(a1 + 8) == 7)
        *(_DWORD *)(a1 + 8) = 6;
      return;
    }
    warning("%s: timeout sending Config-Requests\n", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(v10 + 112));
    *(_DWORD *)(a1 + 8) = 3;
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
      return;
  }
  v14 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 80);
  if (v14)
    v14(a1);
}

void fsm_open(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
      *(_DWORD *)(a1 + 8) = 1;
      v9 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 72);
      if (v9)
        v9(a1);
      break;
    case 2:
      if ((*(_BYTE *)(a1 + 12) & 4) != 0)
      {
        v17 = 3;
      }
      else
      {
        sub_10000BA0C((int *)a1, 0, a3, a4, a5, a6, a7, a8);
        v17 = 6;
      }
      *(_DWORD *)(a1 + 8) = v17;
      break;
    case 3:
    case 9:
      goto LABEL_5;
    case 4:
      *(_DWORD *)(a1 + 8) = 5;
LABEL_5:
      if ((*(_BYTE *)(a1 + 12) & 2) != 0)
      {
        fsm_lowerdown(a1);
        fsm_lowerup(a1, v10, v11, v12, v13, v14, v15, v16);
      }
      break;
    default:
      return;
  }
}

void fsm_close(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int v10;
  char v11;
  void (*v12)(uint64_t);
  int v13;

  *(_QWORD *)(a1 + 64) = __s;
  if (__s)
    v9 = strlen(__s);
  else
    v9 = 0;
  *(_DWORD *)(a1 + 72) = v9;
  v10 = 0;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      goto LABEL_8;
    case 3:
      v10 = 2;
      goto LABEL_8;
    case 5:
      goto LABEL_7;
    case 6:
    case 7:
    case 8:
      untimeout((uint64_t)sub_10000BBE8, a1);
      goto LABEL_6;
    case 9:
      v12 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
      if (v12)
        v12(a1);
LABEL_6:
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 32);
      v11 = *(_BYTE *)(a1 + 16) + 1;
      *(_BYTE *)(a1 + 16) = v11;
      *(_BYTE *)(a1 + 17) = v11;
      fsm_sdata((unsigned int *)a1, 5, v11, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v13);
      timeout((int)sub_10000BBE8);
      --*(_DWORD *)(a1 + 28);
LABEL_7:
      v10 = 4;
LABEL_8:
      *(_DWORD *)(a1 + 8) = v10;
      break;
    default:
      return;
  }
}

void fsm_sdata(unsigned int *a1, char a2, char a3, char *__src, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v12;
  BOOL v13;
  int v14;

  if (peer_mru[*a1] - 4 >= (int)a5)
    v12 = a5;
  else
    v12 = peer_mru[*a1] - 4;
  if (v12)
    v13 = __src == &byte_100048124;
  else
    v13 = 1;
  if (!v13)
    memcpy(&byte_100048124, __src, v12);
  LOWORD(outpacket_buf) = 1023;
  v14 = a1[1];
  BYTE2(outpacket_buf) = BYTE1(v14);
  HIBYTE(outpacket_buf) = v14;
  LOBYTE(word_100048120) = a2;
  HIBYTE(word_100048120) = a3;
  LOBYTE(word_100048122) = (unsigned __int16)(v12 + 4) >> 8;
  HIBYTE(word_100048122) = v12 + 4;
  output(*a1, (uint64_t)&outpacket_buf, (v12 + 8), (uint64_t)__src, a5, a6, a7, a8, a9);
}

void fsm_input(uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10;
  BOOL v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, char *, _QWORD);
  int v17;
  unsigned int *v18;
  char v19;
  char v20;
  char *v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t);
  char v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  int v34;
  void (*v35)(uint64_t);

  if ((int)a3 >= 4)
  {
    v10 = __rev16(*((unsigned __int16 *)__src + 1));
    v11 = v10 < 4 || v10 > a3;
    if (!v11 && *(_DWORD *)(a1 + 8) >= 2u)
    {
      v13 = *__src;
      v14 = __src[1];
      switch((int)v13)
      {
        case 1:
          sub_10000C290(a1, __src[1], (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 2:
          sub_10000C4FC(a1, __src[1], (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 3:
        case 4:
          if (*(unsigned __int8 *)(a1 + 17) == v14 && !*(_BYTE *)(a1 + 18))
          {
            v15 = 40;
            if ((_DWORD)v13 == 3)
              v15 = 32;
            v16 = *(uint64_t (**)(uint64_t, char *, _QWORD))(*(_QWORD *)(a1 + 56) + v15);
            if (v16 && (v17 = v16(a1, __src + 4, (v10 - 4))) != 0)
            {
              *(_BYTE *)(a1 + 18) = 1;
              switch(*(_DWORD *)(a1 + 8))
              {
                case 2:
                case 3:
                  v18 = (unsigned int *)a1;
                  v19 = 6;
                  v20 = v14;
                  v21 = 0;
                  v22 = 0;
                  goto LABEL_20;
                case 6:
                case 8:
                  v25 = v17;
                  untimeout((uint64_t)sub_10000BBE8, a1);
                  if (v25 < 0)
                  {
                    v34 = 3;
LABEL_35:
                    *(_DWORD *)(a1 + 8) = v34;
                  }
                  else if (*(_DWORD *)(a1 + 44) >= *(_DWORD *)(a1 + 48))
                  {
                    warning("%s: Maximum Config-Requests exceeded\n", v26, v27, v28, v29, v30, v31, v32, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 112));
                    *(_DWORD *)(a1 + 8) = 3;
                    if ((*(_BYTE *)(a1 + 12) & 1) == 0)
                    {
                      v35 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 80);
                      if (v35)
                        v35(a1);
                    }
                  }
                  else
                  {
                    sub_10000BA0C((int *)a1, 0, v27, v28, v29, v30, v31, v32);
                  }
                  break;
                case 7:
                  untimeout((uint64_t)sub_10000BBE8, a1);
                  goto LABEL_33;
                case 9:
                  v33 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
                  if (v33)
                    v33(a1);
LABEL_33:
                  sub_10000BA0C((int *)a1, 0, a3, a4, a5, a6, a7, a8);
                  v34 = 6;
                  goto LABEL_35;
                default:
                  return;
              }
            }
            else
            {
              error("Received bad configure-nak/rej: %P", v13, a3, a4, a5, a6, a7, a8, (_DWORD)__src + 4);
            }
          }
          break;
        case 5:
          sub_10000C66C(a1, __src[1], (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 6:
          sub_10000C738(a1, v13, a3, a4, a5, a6, a7, a8);
          break;
        case 7:
          sub_10000C7F0(a1, (uint64_t)(__src + 4), (v10 - 4), a4, a5, a6, a7, a8);
          break;
        default:
          v23 = *(unsigned int (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 104);
          if (!v23 || !v23(a1))
          {
            v24 = *(_BYTE *)(a1 + 16) + 1;
            *(_BYTE *)(a1 + 16) = v24;
            v20 = v24;
            v18 = (unsigned int *)a1;
            v19 = 7;
            v21 = __src;
            v22 = v10;
LABEL_20:
            fsm_sdata(v18, v19, v20, v21, v22, a6, a7, a8, a9);
          }
          break;
      }
    }
  }
}

void sub_10000C290(uint64_t a1, unsigned __int8 a2, uint64_t __src, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char *v10;
  char v13;
  char v14;
  char *v15;
  uint64_t v16;
  unsigned __int16 v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  void (*v21)(uint64_t);
  uint64_t (*v22)(uint64_t, char *, int *, BOOL);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  int v28;
  __int16 v29;
  int v30;
  int v31;
  int v32;

  v10 = (char *)__src;
  v32 = a4;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      v13 = a2;
      v14 = 6;
      v15 = 0;
      v16 = 0;
      goto LABEL_3;
    case 3:
      goto LABEL_14;
    case 4:
    case 5:
      return;
    case 9:
      if (*(unsigned __int8 *)(a1 + 52) != a2)
        goto LABEL_12;
      if ((int)a4 < 1)
      {
        v17 = 0;
      }
      else
      {
        v17 = 0;
        v18 = a4;
        v19 = (unsigned __int8 *)__src;
        do
        {
          v20 = *v19++;
          v17 = word_10003B310[v20 ^ ((unsigned __int16)(v17 & 0xFF00) >> 8)] ^ (v17 << 8);
          --v18;
        }
        while (v18);
      }
      if (*(unsigned __int16 *)(a1 + 54) != v17)
      {
LABEL_12:
        v21 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
        if (v21)
          v21(a1);
LABEL_14:
        sub_10000BA0C((int *)a1, 0, __src, a4, a5, a6, a7, a8);
        *(_DWORD *)(a1 + 8) = 6;
LABEL_15:
        v22 = *(uint64_t (**)(uint64_t, char *, int *, BOOL))(*(_QWORD *)(a1 + 56) + 48);
        if (v22)
        {
          v23 = v22(a1, v10, &v32, *(_DWORD *)(a1 + 36) >= *(_DWORD *)(a1 + 40));
          fsm_sdata((unsigned int *)a1, v23, a2, v10, v32, v24, v25, v26, v31);
          if (v23 == 2)
            goto LABEL_25;
        }
        else
        {
          if (!(_DWORD)a4)
          {
            fsm_sdata((unsigned int *)a1, 2, a2, v10, a4, a6, a7, a8, v31);
LABEL_25:
            if (*(_DWORD *)(a1 + 8) == 7)
            {
              untimeout((uint64_t)sub_10000BBE8, a1);
              *(_DWORD *)(a1 + 8) = 9;
              v27 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 56);
              if (v27)
                v27(a1);
            }
            else
            {
              *(_DWORD *)(a1 + 8) = 8;
            }
            *(_DWORD *)(a1 + 36) = 0;
            *(_BYTE *)(a1 + 52) = a2;
            v28 = v32;
            if (v32 < 1)
            {
              v29 = 0;
            }
            else
            {
              v29 = 0;
              do
              {
                v30 = *v10++;
                v29 = word_10003B310[v30 ^ ((unsigned __int16)(v29 & 0xFF00) >> 8)] ^ (v29 << 8);
                --v28;
              }
              while (v28);
            }
            *(_WORD *)(a1 + 54) = v29;
            return;
          }
          v23 = 4;
          fsm_sdata((unsigned int *)a1, 4, a2, v10, a4, a6, a7, a8, v31);
        }
        if (*(_DWORD *)(a1 + 8) != 7)
          *(_DWORD *)(a1 + 8) = 6;
        if (v23 == 3)
          ++*(_DWORD *)(a1 + 36);
        return;
      }
      v13 = a2;
      v14 = 2;
      v15 = v10;
      v16 = a4;
LABEL_3:
      fsm_sdata((unsigned int *)a1, v14, v13, v15, v16, a6, a7, a8, a9);
      return;
    default:
      goto LABEL_15;
  }
}

void sub_10000C4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v10;
  char v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void (*v13)(uint64_t);
  void (*v14)(uint64_t);

  if (*(unsigned __int8 *)(a1 + 17) != (_DWORD)a2 || *(_BYTE *)(a1 + 18))
    return;
  v10 = a3;
  v11 = a2;
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 24);
  if (v12)
  {
    if (v12(a1, a3, a4))
      goto LABEL_5;
LABEL_8:
    error("Received bad configure-ack: %P", a2, a3, a4, a5, a6, a7, a8, v10);
    return;
  }
  if ((_DWORD)a4)
    goto LABEL_8;
LABEL_5:
  *(_BYTE *)(a1 + 18) = 1;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
    case 3:
      fsm_sdata((unsigned int *)a1, 6, v11, 0, 0, a6, a7, a8, a9);
      break;
    case 6:
      *(_DWORD *)(a1 + 8) = 7;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 24);
      break;
    case 7:
      untimeout((uint64_t)sub_10000BBE8, a1);
      goto LABEL_15;
    case 8:
      untimeout((uint64_t)sub_10000BBE8, a1);
      *(_DWORD *)(a1 + 8) = 9;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 24);
      v13 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 56);
      if (v13)
        v13(a1);
      break;
    case 9:
      v14 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
      if (v14)
        v14(a1);
LABEL_15:
      sub_10000BA0C((int *)a1, 0, a3, a4, a5, a6, a7, a8);
      *(_DWORD *)(a1 + 8) = 6;
      break;
    default:
      return;
  }
}

void sub_10000C66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9;
  int v11;
  void (*v12)(uint64_t);

  v9 = a2;
  v11 = *(_DWORD *)(a1 + 8);
  if ((v11 - 7) >= 2)
  {
    if (v11 == 9)
    {
      if ((int)a4 < 1)
        info("%s terminated by peer", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 112));
      else
        info("%s terminated by peer (%0.*v)", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 112));
      *(_DWORD *)(a1 + 28) = 0;
      *(_DWORD *)(a1 + 8) = 5;
      v12 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
      if (v12)
        v12(a1);
      timeout((int)sub_10000BBE8);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 8) = 6;
  }
  fsm_sdata((unsigned int *)a1, 6, v9, 0, 0, a6, a7, a8, a9);
}

void sub_10000C738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  void (*v10)(uint64_t);
  void (*v11)(uint64_t);

  switch(*(_DWORD *)(a1 + 8))
  {
    case 4:
      untimeout((uint64_t)sub_10000BBE8, a1);
      v9 = 2;
      goto LABEL_4;
    case 5:
      untimeout((uint64_t)sub_10000BBE8, a1);
      v9 = 3;
LABEL_4:
      *(_DWORD *)(a1 + 8) = v9;
      v10 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 80);
      if (v10)
        v10(a1);
      return;
    case 7:
      goto LABEL_9;
    case 9:
      v11 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
      if (v11)
        v11(a1);
      sub_10000BA0C((int *)a1, 0, a3, a4, a5, a6, a7, a8);
LABEL_9:
      *(_DWORD *)(a1 + 8) = 6;
      break;
    default:
      return;
  }
}

void sub_10000C7F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)a3 >= 4)
  {
    warning("%s: Rcvd Code-Reject for code %d, id %d", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 112));
    if (*(_DWORD *)(a1 + 8) == 7)
      *(_DWORD *)(a1 + 8) = 6;
  }
}

uint64_t crc16(unsigned __int8 *a1, int a2)
{
  unsigned __int16 v2;
  int v3;

  if (a2 < 1)
  {
    return 0;
  }
  else
  {
    v2 = 0;
    do
    {
      v3 = *a1++;
      v2 = word_10003B310[v3 ^ ((unsigned __int16)(v2 & 0xFF00) >> 8)] ^ (v2 << 8);
      --a2;
    }
    while (a2);
  }
  return v2;
}

void fsm_protreject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  void (*v10)(uint64_t);
  void (*v11)(uint64_t);
  char v12;
  int v13;

  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      goto LABEL_5;
    case 3:
      goto LABEL_3;
    case 4:
      untimeout((uint64_t)sub_10000BBE8, a1);
LABEL_5:
      v9 = 2;
      goto LABEL_6;
    case 5:
    case 6:
    case 7:
    case 8:
      untimeout((uint64_t)sub_10000BBE8, a1);
LABEL_3:
      v9 = 3;
LABEL_6:
      *(_DWORD *)(a1 + 8) = v9;
      v10 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 80);
      if (v10)
        v10(a1);
      break;
    case 9:
      v11 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 56) + 64);
      if (v11)
        v11(a1);
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 32);
      v12 = *(_BYTE *)(a1 + 16) + 1;
      *(_BYTE *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 17) = v12;
      fsm_sdata((unsigned int *)a1, 5, v12, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v13);
      timeout((int)sub_10000BBE8);
      --*(_DWORD *)(a1 + 28);
      *(_DWORD *)(a1 + 8) = 5;
      break;
    default:
      return;
  }
}

double sub_10000C994(int a1)
{
  char *v1;
  char *v2;
  char *v3;
  double result;

  v1 = (char *)&ipcp_fsm + 80 * a1;
  v2 = (char *)&ipcp_wantoptions + 52 * a1;
  v3 = (char *)&ipcp_allowoptions + 52 * a1;
  *(_DWORD *)v1 = a1;
  *((_DWORD *)v1 + 1) = 32801;
  *((_QWORD *)v1 + 7) = off_100042CC0;
  fsm_init((uint64_t)v1);
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + 12) = 0;
  *((_OWORD *)v2 + 2) = 0u;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_DWORD *)v3 + 12) = 0;
  *(_WORD *)v2 = 257;
  v2[5] = 1;
  *(_QWORD *)&result = 0xF0000002DLL;
  *((_QWORD *)v2 + 2) = 0xF0000002DLL;
  v2[24] = 1;
  *(_WORD *)v3 = 257;
  *((_DWORD *)v3 + 5) = 15;
  v3[24] = 1;
  *((_WORD *)v3 + 2) = 257;
  v3[3] = 1;
  return result;
}

void sub_10000CA48(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  fsm_input((uint64_t)&ipcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_10000CA5C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_protreject((uint64_t)&ipcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_10000CA70(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_lowerup((uint64_t)&ipcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_10000CA84(int a1)
{
  fsm_lowerdown((uint64_t)&ipcp_fsm + 80 * a1);
}

void sub_10000CA98(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_open((uint64_t)&ipcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
  byte_10004A398 = 1;
}

void sub_10000CAC8(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_close((uint64_t)&ipcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10000CADC(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  unsigned int v6;
  int v7;
  int v11;
  int v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  const char *v20;
  unsigned __int8 *v21;
  int64_t v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  int v27;

  if (a2 < 4)
    return 0;
  v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  v7 = v6 - 4;
  if (v6 < 4 || v6 > a2)
    return 0;
  v11 = *a1;
  v12 = a1[1];
  v13 = a1 + 4;
  if ((v11 - 1) > 6)
    v14 = " code=0x%x";
  else
    v14 = " %s";
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        v15 = v13[1];
        if (v15 < 2 || v7 < v15)
          goto LABEL_49;
        v17 = *v13;
        a3(a4, " <");
        if (v17 > 128)
        {
          v18 = v13;
          switch(v17)
          {
            case 129:
            case 131:
              v18 = v13 + 6;
              htonl(bswap32(*(_DWORD *)(v13 + 2)));
              v19 = a4;
              v20 = "ms-dns%d %I";
              goto LABEL_28;
            case 130:
            case 132:
              v18 = v13 + 6;
              htonl(bswap32(*(_DWORD *)(v13 + 2)));
              v19 = a4;
              v20 = "ms-wins%d %I";
              goto LABEL_28;
            default:
              goto LABEL_29;
          }
          goto LABEL_29;
        }
        v18 = v13;
        switch(v17)
        {
          case 1:
            if ((_DWORD)v15 != 10)
              goto LABEL_29;
            v24 = htonl(bswap32(*(_DWORD *)(v13 + 2)));
            ((void (*)(uint64_t, const char *, ...))a3)(a4, "addrs %I", v24);
            v18 = v13 + 10;
            htonl(bswap32(*(_DWORD *)(v13 + 6)));
            v19 = a4;
            v20 = " %I";
            break;
          case 2:
            if (v15 < 4)
              goto LABEL_29;
            v18 = v13 + 4;
            v25 = __rev16(*((unsigned __int16 *)v13 + 1));
            a3(a4, "compress ");
            if (v25 == 55)
            {
              v19 = a4;
              v20 = "old-VJ";
            }
            else
            {
              v19 = a4;
              if (v25 == 45)
                v20 = "VJ";
              else
                v20 = "0x%x";
            }
            break;
          case 3:
            v18 = v13;
            if ((_DWORD)v15 != 6)
              goto LABEL_29;
            v18 = v13 + 6;
            htonl(bswap32(*(_DWORD *)(v13 + 2)));
            v19 = a4;
            v20 = "addr %I";
            break;
          default:
            goto LABEL_29;
        }
LABEL_28:
        a3(v19, v20);
LABEL_29:
        if (v18 < &v13[v15])
        {
          v21 = &v13[v15];
          v22 = &v13[v15] - v18;
          do
          {
            v23 = *v18++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v23);
            --v22;
          }
          while (v22);
          v18 = v21;
        }
        v7 -= v15;
        a3(a4, ">");
        v13 = v18;
        if (v7 <= 1)
          goto LABEL_48;
      }
    }
LABEL_47:
    v18 = a1 + 4;
LABEL_48:
    v13 = v18;
    if (v7 < 1)
      return ((_DWORD)v13 - (_DWORD)a1);
    goto LABEL_49;
  }
  if ((v11 - 5) >= 2)
    goto LABEL_47;
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_49:
      v26 = v7 + 1;
      do
      {
        v27 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
        --v26;
      }
      while (v26 > 1);
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v13) = (_DWORD)v13 + v7;
  }
  return ((_DWORD)v13 - (_DWORD)a1);
}

uint64_t sub_10000CE4C(uint64_t result)
{
  if (*((_DWORD *)&ipcp_fsm + 20 * (int)result + 2) == 9 && ipdata_input_hook != 0)
    return ipdata_input_hook();
  return result;
}

void sub_10000CE94()
{
  BOOL v0;
  hostent *v1;
  int v2;
  BOOL v3;
  char v4;

  if (dword_10004777C)
    v0 = 0;
  else
    v0 = disable_defaultip == 0;
  if (v0)
  {
    byte_100047767 = 1;
    v1 = gethostbyname(hostname);
    if (v1)
    {
      v2 = **(_DWORD **)v1->h_addr_list;
      if (v2)
      {
        if (!bad_ip_adrs())
          dword_10004777C = v2;
      }
    }
  }
  if (dword_10004777C)
    v3 = 1;
  else
    v3 = disable_defaultip == 0;
  v4 = v3;
  byte_10004A382 = v4;
}

uint64_t sub_10000CF28(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  unsigned int v4;
  int *v5;
  unsigned int v6;
  char *v7;
  uint64_t v8;
  int *v9;
  unsigned int v10;
  int Mask;
  uint64_t result;
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

  v2 = (int)a1;
  v3 = (char *)&ipcp_wantoptions + 52 * (int)a1;
  v6 = *((_DWORD *)v3 + 8);
  v5 = (int *)(v3 + 32);
  v4 = v6;
  if (!v6)
  {
    v4 = htonl((ifunit + 175140976));
    *v5 = v4;
    *((_BYTE *)&ipcp_wantoptions + 52 * (int)v2 + 8) = 1;
  }
  v7 = (char *)&ipcp_wantoptions + 52 * (int)v2;
  v10 = *((_DWORD *)v7 + 7);
  v9 = (int *)(v7 + 28);
  v8 = v10;
  if (!v10)
  {
    v8 = htonl((ifunit + 171982912));
    *v9 = v8;
    *((_BYTE *)&ipcp_wantoptions + 52 * (int)v2 + 7) = 1;
    byte_10004A382 = 0;
  }
  Mask = GetMask(v8);
  result = sifaddr(a1, v8, v4, Mask);
  if ((_DWORD)result)
  {
    result = sifnpafmode(a1, 33, ip_src_address_filter);
    if ((_DWORD)result)
    {
      result = sifup();
      if ((_DWORD)result)
      {
        result = sifnpmode(a1, 33, 3);
        if ((_DWORD)result)
        {
          if (*((_BYTE *)&ipcp_wantoptions + 52 * (int)v2 + 3) && sifdefaultroute())
            dword_10004A384[v2] = 1;
          if (*((_BYTE *)&ipcp_wantoptions + 52 * (int)v2 + 4) && sifproxyarp(a1, *v5))
            dword_10004A388[v2] = 1;
          if (byte_10004A36C)
            sifdns(*v5, *v5);
          if (byte_10004A36D)
            sifwins();
          notice("local  IP address %I", v13, v14, v15, v16, v17, v18, v19, *v9);
          notice("remote IP address %I", v20, v21, v22, v23, v24, v25, v26, *v5);
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL sub_10000D118(_BYTE *a1, int a2)
{
  _BOOL8 result;
  uint64_t v3;
  _BYTE *v4;

  result = 0;
  if (a2 >= 24 && !(a1[11] | ((a1[10] & 0x1F) << 8)))
  {
    if (a1[13] != 6)
      return 1;
    v3 = 4 * (a1[4] & 0xF);
    if (a2 - 4 >= (v3 + 20))
    {
      v4 = &a1[v3 + 4];
      if ((v4[13] & 1) == 0 || a2 - 4 != ((v4[12] >> 2) & 0x3C) + (_DWORD)v3)
        return 1;
    }
  }
  return result;
}

uint64_t sub_10000D18C(int a1)
{
  return *((unsigned int *)&ipcp_fsm + 20 * a1 + 2);
}

uint64_t sub_10000D1A4()
{
  if (ipdata_print_hook)
    return ipdata_print_hook();
  else
    return 0;
}

void *ip_ntoa()
{
  slprintf((int)&unk_10004A31C, 64, "%I");
  return &unk_10004A31C;
}

char *setipaddr(char *a1, uint64_t a2, int a3)
{
  char *result;
  _BYTE *v6;
  in_addr_t v7;
  hostent *v8;
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
  const char *v23;
  int v24;
  in_addr_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  hostent *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  result = strchr(a1, 58);
  if (result)
  {
    if (a3)
    {
      v6 = result;
      if (result != a1 && option_priority >= dword_10004A35C)
      {
        *result = 0;
        v7 = inet_addr(a1);
        if (v7 == -1)
        {
          v8 = gethostbyname(a1);
          if (!v8)
          {
            option_error("unknown host: %s", v9, v10, v11, v12, v13, v14, v15, (int)a1);
            return 0;
          }
          v7 = **(_DWORD **)v8->h_addr_list;
        }
        if (bad_ip_adrs())
        {
          slprintf((int)&unk_10004A31C, 64, "%I");
          option_error("bad local IP address %s", v16, v17, v18, v19, v20, v21, v22, (int)&unk_10004A31C);
          return 0;
        }
        if (v7)
          dword_10004777C = v7;
        *v6 = 58;
        dword_10004A35C = option_priority;
      }
      v24 = v6[1];
      v23 = v6 + 1;
      if (v24 && option_priority >= dword_10004A360)
      {
        v25 = inet_addr(v23);
        if (v25 == -1)
        {
          v33 = gethostbyname(v23);
          if (!v33)
          {
            option_error("unknown host: %s", v34, v35, v36, v37, v38, v39, v40, (int)v23);
            return 0;
          }
          v25 = **(_DWORD **)v33->h_addr_list;
          if (!remote_name)
            __strlcpy_chk(&remote_name, v23, 256, 256);
        }
        if (bad_ip_adrs())
        {
          slprintf((int)&unk_10004A31C, 64, "%I");
          option_error("bad remote IP address %s", v26, v27, v28, v29, v30, v31, v32, (int)&unk_10004A31C);
          return 0;
        }
        if (v25)
          dword_100047780 = v25;
        dword_10004A360 = option_priority;
      }
    }
    return (char *)1;
  }
  return result;
}

uint64_t parse_dotted_ip(const char *a1, unsigned int *a2)
{
  unsigned int v4;
  char *v5;
  unsigned int v6;
  int v7;
  char v8;
  char *v9;
  char *__endptr;

  __endptr = 0;
  v4 = strtoul(a1, &__endptr, 0);
  v5 = __endptr;
  if (__endptr == a1)
    return 0;
  v6 = 0;
  v7 = 3;
  v8 = 24;
  while (v4 < 0x100)
  {
    v6 |= v4 << v8;
    if (!v7)
    {
      v4 = v6;
      goto LABEL_11;
    }
    if (*v5 == 46)
    {
      v9 = v5 + 1;
      --v7;
      v4 = strtoul(v5 + 1, &__endptr, 0);
      v5 = __endptr;
      v8 -= 8;
      if (__endptr != v9)
        continue;
    }
    return 0;
  }
  if (v7 < 3)
    return 0;
LABEL_11:
  *a2 = v4;
  return ((_DWORD)v5 - (_DWORD)a1);
}

uint64_t sub_10000D4A8(const char **a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  v10 = 0;
  result = int_option(*a1, &v10);
  if ((_DWORD)result)
  {
    if ((v10 - 17) > 0xFFFFFFF0)
    {
      dword_1000477DC = v10 - 1;
      dword_100047774 = v10 - 1;
      slprintf((int)&unk_10004A364, 8, "%d");
      return 1;
    }
    else
    {
      option_error("vj-max-slots value must be between 2 and 16", v2, v3, v4, v5, v6, v7, v8, v9);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000D52C(const char **a1)
{
  in_addr_t v2;
  hostent *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v2 = inet_addr(*a1);
  if (v2 == -1)
  {
    v3 = gethostbyname(*a1);
    if (!v3)
    {
      option_error("invalid address parameter '%s' for ms-dns option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
      return 0;
    }
    v2 = **(_DWORD **)v3->h_addr_list;
  }
  v11 = dword_1000477F0;
  if (!dword_1000477F0)
    v11 = v2;
  dword_1000477EC = v11;
  dword_1000477F0 = v2;
  return 1;
}

uint64_t sub_10000D5B0(const char **a1)
{
  in_addr_t v2;
  hostent *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v2 = inet_addr(*a1);
  if (v2 == -1)
  {
    v3 = gethostbyname(*a1);
    if (!v3)
    {
      option_error("invalid address parameter '%s' for ms-wins option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
      return 0;
    }
    v2 = **(_DWORD **)v3->h_addr_list;
  }
  v11 = dword_1000477F8;
  if (!dword_1000477F8)
    v11 = v2;
  dword_1000477F4 = v11;
  dword_1000477F8 = v2;
  return 1;
}

uint64_t sub_10000D634(const char **a1)
{
  const char *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v13;

  v13 = 0;
  v2 = *a1;
  v3 = parse_dotted_ip(*a1, &v13);
  v4 = htonl(v13);
  if (!v3 || v2[v3] || (netmask & ~v4) != 0)
  {
    option_error("invalid netmask value '%s'", v5, v6, v7, v8, v9, v10, v11, (int)*a1);
    return 0;
  }
  else
  {
    netmask = v4;
    slprintf((int)&unk_10004A36E, 20, "%I");
    return 1;
  }
}

uint64_t sub_10000D6E0(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  uint64_t result;

  if (dword_10004777C)
    a2(a3, "%I", dword_10004777C);
  result = ((uint64_t (*)(uint64_t, const char *))a2)(a3, ":");
  if (dword_100047780)
    return ((uint64_t (*)(uint64_t, const char *, ...))a2)(a3, "%I", dword_100047780);
  return result;
}

int *sub_10000D758(int *result)
{
  int v1;
  char *v2;
  char v3;
  char *v4;
  char *v5;
  char *v6;
  _DWORD *v7;
  int v8;
  char v9;
  char *v10;
  char v11;
  __int128 v12;

  v1 = *result;
  v2 = (char *)&ipcp_wantoptions + 52 * *result;
  if (*v2 || (v3 = *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 1)) != 0)
  {
    if (*((_BYTE *)&ipcp_allowoptions + 52 * v1))
      v3 = 1;
    else
      v3 = *((_BYTE *)&ipcp_allowoptions + 52 * v1 + 1) != 0;
  }
  v4 = (char *)&ipcp_gotoptions + 52 * v1;
  v5 = (char *)&ipcp_wantoptions + 52 * v1;
  v5[2] = v3;
  if (!*((_DWORD *)v5 + 7))
    *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 7) = 1;
  v6 = (char *)&ipcp_wantoptions + 52 * v1;
  v8 = *((_DWORD *)v6 + 8);
  v7 = v6 + 32;
  if (!v8)
    *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 8) = 1;
  v9 = byte_10004A36C;
  v10 = (char *)&ipcp_wantoptions + 52 * v1;
  v10[9] = byte_10004A36C;
  v10[10] = v9;
  v11 = byte_10004A36D;
  v10[11] = byte_10004A36D;
  v10[12] = v11;
  v12 = *((_OWORD *)v2 + 1);
  *(_OWORD *)v4 = *(_OWORD *)v2;
  *((_OWORD *)v4 + 1) = v12;
  *((_OWORD *)v4 + 2) = *((_OWORD *)v2 + 2);
  *((_DWORD *)v4 + 12) = *((_DWORD *)v2 + 12);
  if (!byte_10004A382)
    *((_DWORD *)&ipcp_gotoptions + 13 * v1 + 7) = 0;
  if (ip_choose_hook)
  {
    result = (int *)ip_choose_hook(v7);
    if (*v7)
      *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 8) = 0;
  }
  return result;
}

uint64_t sub_10000D8A4(int *a1, uint8x8_t a2)
{
  int v2;
  _BYTE *v3;
  char *v4;
  _BYTE *v5;
  int v6;
  char *v7;
  _BYTE *v8;
  int v9;
  char *v10;
  _BYTE *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int8x16_t v17;

  v2 = *a1;
  v3 = (char *)&ipcp_gotoptions + 52 * *a1;
  if ((*((_BYTE *)&ipcp_wantoptions + 52 * *a1) || *((_BYTE *)&ipcp_wantoptions + 52 * v2 + 1)) && !*v3)
  {
    v4 = (char *)&ipcp_gotoptions + 52 * v2;
    v6 = v4[1];
    v5 = v4 + 1;
    if (!v6)
      *v5 = 1;
  }
  if (*((_BYTE *)&ipcp_wantoptions + 52 * v2 + 5))
  {
    v7 = (char *)&ipcp_gotoptions + 52 * v2;
    v9 = v7[5];
    v8 = v7 + 5;
    if (!v9)
    {
      v10 = (char *)&ipcp_gotoptions + 52 * v2;
      v12 = v10[6];
      v11 = v10 + 6;
      if (!v12 && *((_BYTE *)&ipcp_hisoptions + 52 * v2 + 5) && *((_BYTE *)&ipcp_hisoptions + 52 * v2 + 6))
      {
        *v8 = 1;
        *v11 = 1;
        *((_DWORD *)&ipcp_gotoptions + 13 * v2 + 4) = *((_DWORD *)&ipcp_hisoptions + 13 * v2 + 4);
      }
    }
  }
  v13 = *v3;
  if (*v3)
  {
    v14 = 0;
  }
  else if (*((_BYTE *)&ipcp_gotoptions + 52 * v2 + 1))
  {
    v14 = 10;
  }
  else
  {
    v14 = 0;
  }
  v15 = *((unsigned __int8 *)&ipcp_gotoptions + 52 * v2 + 5);
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v2 + 5))
  {
    if (*((_BYTE *)&ipcp_gotoptions + 52 * v2 + 6))
      v15 = 4;
    else
      v15 = 6;
  }
  if (v13)
    v16 = 6;
  else
    v16 = 0;
  a2.i32[0] = *(_DWORD *)((char *)&ipcp_gotoptions + 52 * v2 + 9);
  v17.i64[0] = 0x600000006;
  v17.i64[1] = 0x600000006;
  return (vaddvq_s32((int32x4_t)vbicq_s8(v17, (int8x16_t)vceqzq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a2)))))+ v16+ v15+ v14);
}

int *sub_10000DA0C(int *result, uint64_t a2, int *a3)
{
  uint64_t v4;
  int v5;
  _BYTE *v6;
  int v7;
  char *v8;
  _BYTE *v9;
  int v10;
  char *v11;
  _BYTE *v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  _BYTE *v17;
  int v18;
  int v19;
  char *v20;
  char *v21;
  char *v22;
  int v23;
  char *v24;
  _BYTE *v25;
  int v26;
  int v27;
  char *v28;
  _BYTE *v29;
  int v30;
  int v31;
  char *v32;
  _BYTE *v33;
  int v34;
  int v35;
  char *v36;
  _BYTE *v37;
  int v38;
  int v39;

  v4 = a2;
  v5 = *result;
  v6 = (char *)&ipcp_gotoptions + 52 * *result;
  v7 = *a3;
  if (!*v6)
  {
    v16 = (char *)&ipcp_gotoptions + 52 * v5;
    v18 = v16[1];
    v17 = v16 + 1;
    if (v18)
    {
      v19 = v7 - 10;
      if (v7 < 10)
      {
        *v17 = 0;
      }
      else
      {
        *(_WORD *)a2 = 2561;
        v20 = (char *)&ipcp_gotoptions + 52 * v5;
        *(_DWORD *)(a2 + 2) = bswap32(ntohl(*((unsigned int *)v20 + 7)));
        result = (int *)ntohl(*((unsigned int *)v20 + 8));
        *(_DWORD *)(v4 + 6) = bswap32(result);
        v4 += 10;
        v7 = v19;
      }
    }
  }
  v8 = (char *)&ipcp_gotoptions + 52 * v5;
  v10 = v8[5];
  v9 = v8 + 5;
  if (v10)
  {
    v11 = (char *)&ipcp_gotoptions + 52 * v5;
    v13 = v11[6];
    v12 = v11 + 6;
    if (v13)
      v14 = 4;
    else
      v14 = 6;
    v15 = v7 - v14;
    if (v7 >= v14)
    {
      *(_BYTE *)v4 = 2;
      *(_BYTE *)(v4 + 1) = v14;
      v21 = (char *)&ipcp_gotoptions + 52 * v5;
      *(_BYTE *)(v4 + 2) = BYTE1(*((_DWORD *)v21 + 4));
      *(_BYTE *)(v4 + 3) = *((_DWORD *)v21 + 4);
      if (*v12)
      {
        v4 += 4;
      }
      else
      {
        v22 = (char *)&ipcp_gotoptions + 52 * v5;
        *(_BYTE *)(v4 + 4) = *((_DWORD *)v22 + 5);
        *(_BYTE *)(v4 + 5) = v22[24];
        v4 += 6;
      }
      v7 = v15;
    }
    else
    {
      *v9 = 0;
    }
  }
  if (*v6)
  {
    v23 = v7 - 6;
    if (v7 < 6)
    {
      *v6 = 0;
    }
    else
    {
      *(_WORD *)v4 = 1539;
      result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 7));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      v7 = v23;
    }
  }
  v24 = (char *)&ipcp_gotoptions + 52 * v5;
  v26 = v24[9];
  v25 = v24 + 9;
  if (v26)
  {
    v27 = v7 - 6;
    if (v7 < 6)
    {
      *v25 = 0;
    }
    else
    {
      *(_WORD *)v4 = 1665;
      result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 9));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      v7 = v27;
    }
  }
  v28 = (char *)&ipcp_gotoptions + 52 * v5;
  v30 = v28[10];
  v29 = v28 + 10;
  if (v30)
  {
    v31 = v7 - 6;
    if (v7 < 6)
    {
      *v29 = 0;
    }
    else
    {
      *(_WORD *)v4 = 1667;
      result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 10));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      v7 = v31;
    }
  }
  v32 = (char *)&ipcp_gotoptions + 52 * v5;
  v34 = v32[11];
  v33 = v32 + 11;
  if (v34)
  {
    v35 = v7 - 6;
    if (v7 < 6)
    {
      *v33 = 0;
    }
    else
    {
      *(_WORD *)v4 = 1666;
      result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 11));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      v7 = v35;
    }
  }
  v36 = (char *)&ipcp_gotoptions + 52 * v5;
  v38 = v36[12];
  v37 = v36 + 12;
  if (v38)
  {
    v39 = v7 - 6;
    if (v7 < 6)
    {
      *v37 = 0;
    }
    else
    {
      *(_WORD *)v4 = 1668;
      result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 12));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v7 = v39;
    }
  }
  *a3 -= v7;
  return result;
}

uint64_t sub_10000DCBC(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  BOOL v15;
  int v17;

  v8 = a3;
  v9 = (unsigned __int8 *)a2;
  v10 = *a1;
  v11 = 52 * *a1;
  v12 = *((unsigned __int8 *)&ipcp_gotoptions + v11);
  if (!*((_BYTE *)&ipcp_gotoptions + v11) && *((_BYTE *)&ipcp_gotoptions + 52 * v10 + 1))
  {
    v8 = a3 - 10;
    if ((int)a3 < 10
      || *(_BYTE *)(a2 + 1) != 10
      || *(_BYTE *)a2 != 1
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 7) != htonl(bswap32(*(_DWORD *)(a2 + 2)))
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 8) != htonl(bswap32(*(_DWORD *)(v9 + 6))))
    {
      goto LABEL_57;
    }
    v9 += 10;
  }
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 5))
  {
    if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 6))
      v13 = 4;
    else
      v13 = 6;
    v8 -= v13;
    if (v8 < 0)
      goto LABEL_57;
    v14 = v13 == v9[1] && *v9 == 2;
    if (!v14 || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 4) != bswap32(*((unsigned __int16 *)v9 + 1)) >> 16)
      goto LABEL_57;
    if (!*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 6))
    {
      if (*((_DWORD *)&ipcp_gotoptions + 13 * v10 + 5) != v9[4]
        || v9[5] != *((unsigned __int8 *)&ipcp_gotoptions + 52 * v10 + 24))
      {
        goto LABEL_57;
      }
      v9 += 6;
      if (!v12)
        goto LABEL_21;
      goto LABEL_16;
    }
    v9 += 4;
  }
  if (v12)
  {
LABEL_16:
    v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 3
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 7) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
LABEL_21:
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 9))
  {
    v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 129
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 9) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 10))
  {
    v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 131
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 10) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 11))
  {
    v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 130
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 11) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
  if (!*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 12)
    || (v15 = __OFSUB__(v8, 6), v8 -= 6, v8 < 0 == v15)
    && v9[1] == 6
    && *v9 == 132
    && *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 12) == htonl(bswap32(*(_DWORD *)(v9 + 2))))
  {
    if (!v8)
      return 1;
  }
LABEL_57:
  if (debug)
    dbglog("ipcp_ackci: received bad Ack!", a2, a3, a4, a5, a6, a7, a8, v17);
  return 0;
}

uint64_t sub_10000DFEC(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v8;
  int v9;
  char *v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned __int8 v20;
  uint64_t v21;
  int v22;
  int v23;
  char *v24;
  BOOL v25;
  int v26;
  BOOL v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  char *v32;
  _BYTE *v33;
  unsigned __int8 v34;
  char v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t result;
  int v43;
  unsigned __int8 v44;
  _BYTE *v45;
  unsigned int v46;
  unsigned __int8 v47;
  int v48;
  char v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;

  v8 = (unsigned __int8 *)a2;
  v9 = *a1;
  v10 = (char *)&ipcp_gotoptions + 52 * *a1;
  v11 = *v10;
  v12 = v10[5];
  v48 = *((_DWORD *)v10 + 5);
  v49 = v10[6];
  v46 = *((_DWORD *)v10 + 4);
  v47 = v10[24];
  v13 = *((_DWORD *)v10 + 7);
  v56 = v10[1];
  v57 = *((_DWORD *)v10 + 8);
  v50 = *((_DWORD *)v10 + 10);
  v51 = *((_DWORD *)v10 + 9);
  v52 = *((_DWORD *)v10 + 12);
  v53 = *((_DWORD *)v10 + 11);
  if (*v10)
    v14 = 1;
  else
    v14 = v10[1] == 0;
  v55 = v10[5];
  if (v14)
    goto LABEL_6;
  v15 = 0;
  v21 = (a3 - 10);
  if ((int)a3 < 10 || *(_BYTE *)(a2 + 1) != 10)
    goto LABEL_7;
  if (*(_BYTE *)a2 != 1)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v22 = htonl(bswap32(*(_DWORD *)(a2 + 2)));
  v23 = htonl(bswap32(*(_DWORD *)(v8 + 6)));
  v24 = (char *)&ipcp_gotoptions + 52 * v9;
  if (v22)
    v25 = v24[7] == 0;
  else
    v25 = 1;
  if (!v25)
    v13 = v22;
  v26 = v24[8];
  if (v23)
    v27 = v26 == 0;
  else
    v27 = 1;
  v28 = v57;
  if (!v27)
    v28 = v23;
  v57 = v28;
  v15 = 1;
  v8 += 10;
  v12 = v55;
  a3 = v21;
LABEL_7:
  v59 = v15;
  if (v12)
  {
    v16 = v8[1];
    if ((v16 | 2) == 6 && (v17 = a3 - v16, (int)a3 >= v16) && *v8 == 2)
    {
      v18 = __rev16(*((unsigned __int16 *)v8 + 1));
      if (v16 != 6)
      {
        v8 += 4;
        if (v18 == 55 || v18 == 45)
        {
          v58 = 1;
          v44 = v12;
          v49 = 1;
          v46 = v18;
        }
        else
        {
          v44 = 0;
          v58 = 1;
        }
        goto LABEL_35;
      }
      if (v18 != 45)
      {
        v44 = 0;
        v58 = 1;
        v8 += 6;
        goto LABEL_35;
      }
      v19 = v48;
      if (v48 >= v8[4])
        v19 = v8[4];
      v48 = v19;
      v49 = 0;
      v20 = v47;
      if (!v8[5])
        v20 = 0;
      v47 = v20;
      v58 = 1;
      v8 += 6;
    }
    else
    {
      v58 = 0;
      v17 = a3;
    }
    v44 = v12;
  }
  else
  {
    v58 = 0;
    v44 = 0;
    v17 = a3;
  }
LABEL_35:
  if (!v11)
    goto LABEL_45;
  v29 = 0;
  if (v8[1] != 6 || v17 < 6)
    goto LABEL_46;
  if (*v8 != 3)
  {
LABEL_45:
    v29 = 0;
    goto LABEL_46;
  }
  v30 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
  if (v30)
    v31 = *((_BYTE *)&ipcp_gotoptions + 52 * v9 + 7) == 0;
  else
    v31 = 1;
  if (!v31)
    v13 = v30;
  v29 = 1;
  v8 += 6;
  v17 -= 6;
LABEL_46:
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 9) && v8[1] == 6 && v17 >= 6 && *v8 == 129)
  {
    v51 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v8 += 6;
    v17 -= 6;
  }
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 10) && v8[1] == 6 && v17 >= 6 && *v8 == 131)
  {
    v50 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v8 += 6;
    v17 -= 6;
  }
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 11) && v8[1] == 6 && v17 >= 6 && *v8 == 130)
  {
    v53 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v8 += 6;
    v17 -= 6;
  }
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 12) && v8[1] == 6 && v17 >= 6)
  {
    if (*v8 != 132)
      goto LABEL_67;
    v52 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v8 += 6;
    v17 -= 6;
  }
  if (v17 < 2)
  {
    v35 = v11;
    v34 = v56;
LABEL_107:
    if (a1[2] == 9)
      return 1;
    *v10 = v35;
    v10[1] = v34;
    v10[5] = v44;
    v10[6] = v49;
    *((_DWORD *)v10 + 4) = v46;
    *((_DWORD *)v10 + 5) = v48;
    v10[24] = v47;
    *((_DWORD *)v10 + 7) = v13;
    *((_DWORD *)v10 + 8) = v57;
    *((_DWORD *)v10 + 9) = v51;
    *((_DWORD *)v10 + 10) = v50;
    result = 1;
    *((_DWORD *)v10 + 11) = v53;
    *((_DWORD *)v10 + 12) = v52;
    return result;
  }
LABEL_67:
  v32 = (char *)&ipcp_gotoptions + 52 * v9;
  v33 = v32 + 7;
  v45 = v32 + 8;
  v34 = v56;
  v35 = v11;
  while (1)
  {
    v36 = v8[1];
    if (v36 < 2)
      break;
    v17 -= v36;
    if (v17 < 0)
      break;
    v37 = *v8;
    switch(v37)
    {
      case 1:
        if (v11)
        {
          if (v59 || (_DWORD)v36 != 10)
            goto LABEL_103;
        }
        else if ((_DWORD)v36 != 10 || v56 || v59)
        {
          goto LABEL_103;
        }
        v39 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        if (v39 && *v33)
          v13 = v39;
        v40 = htonl(bswap32(*(_DWORD *)(v8 + 6)));
        v35 = 0;
        if (v40)
        {
          v41 = v57;
          if (*v45)
            v41 = v40;
          v57 = v41;
        }
        v59 = 1;
        break;
      case 3:
        if (v11 || v29 || (_DWORD)v36 != 6)
          goto LABEL_103;
        v38 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        if (v38 && *v33)
          v13 = v38;
        v34 = 0;
        if (v13)
          v35 = 1;
        v29 = 1;
        break;
      case 2:
        if (v55 || v58 || (v36 & 0xFFFFFFFD) != 4)
          goto LABEL_103;
        v58 = 1;
        break;
    }
    v8 += v36;
    if (v17 <= 1)
      goto LABEL_107;
  }
LABEL_103:
  if (debug)
    dbglog("ipcp_nakci: received bad Nak!", a2, a3, a4, a5, a6, a7, a8, v43);
  return 0;
}

uint64_t sub_10000E590(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v8;
  int v9;
  _DWORD *v10;
  _BYTE *v11;
  int v12;
  char v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  char v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  char v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t result;
  int v40;
  int v41;
  int v43;
  int v44;

  v8 = (unsigned __int8 *)a2;
  v9 = *a1;
  v10 = &ipcp_gotoptions;
  v11 = (char *)&ipcp_gotoptions + 52 * *a1;
  v12 = *v11;
  v13 = v11[1];
  v14 = v11[5];
  v43 = v11[10];
  v44 = v11[9];
  v15 = v11[11];
  v16 = v11[12];
  if (!*v11)
  {
    if (v11[1])
    {
      v28 = (a3 - 10);
      if ((int)a3 >= 10 && *(_BYTE *)(a2 + 1) == 10 && *(_BYTE *)a2 == 1)
      {
        v29 = v11[12];
        if (htonl(bswap32(*(_DWORD *)(a2 + 2))) != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 7))
          goto LABEL_54;
        v30 = htonl(bswap32(*(_DWORD *)(v8 + 6)));
        v10 = &ipcp_gotoptions;
        if (v30 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 8))
          goto LABEL_54;
        v16 = v29;
        v13 = 0;
        v8 += 10;
        a3 = v28;
      }
    }
  }
  if (v14)
  {
    v17 = v8[1];
    v18 = *((_BYTE *)&ipcp_gotoptions + 52 * v9 + 6) ? 4 : 6;
    v19 = v18 != v17 || (int)a3 < v17;
    if (!v19 && *v8 == 2)
    {
      if (*((_DWORD *)&ipcp_gotoptions + 13 * v9 + 4) != bswap32(*((unsigned __int16 *)v8 + 1)) >> 16)
        goto LABEL_54;
      a3 = (a3 - v17);
      if (!*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 6))
      {
        if (*((_DWORD *)&ipcp_gotoptions + 13 * v9 + 5) != v8[4]
          || v8[5] != *((unsigned __int8 *)&ipcp_gotoptions + 52 * v9 + 24))
        {
          goto LABEL_54;
        }
        LOBYTE(v14) = 0;
        v8 += 6;
        if (!v12)
          goto LABEL_20;
        goto LABEL_15;
      }
      LOBYTE(v14) = 0;
      v8 += 4;
    }
  }
  if (v12)
  {
LABEL_15:
    if (v8[1] == 6)
    {
      v20 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 3)
      {
        v21 = v15;
        v22 = v9;
        v23 = v16;
        v24 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        v10 = &ipcp_gotoptions;
        v16 = v23;
        v9 = v22;
        if (v24 != *((_DWORD *)&ipcp_gotoptions + 13 * v22 + 7))
          goto LABEL_54;
        v15 = v21;
        LOBYTE(v12) = 0;
        v8 += 6;
        a3 = v20;
      }
    }
  }
LABEL_20:
  if (v44)
  {
    if (v8[1] == 6)
    {
      v25 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 129)
      {
        v26 = v14;
        v14 = v16;
        v27 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        v10 = &ipcp_gotoptions;
        if (v27 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 9))
          goto LABEL_54;
        v16 = v14;
        LOBYTE(v14) = v26;
        LOBYTE(v44) = 0;
        v8 += 6;
        a3 = v25;
      }
    }
  }
  else
  {
    LOBYTE(v44) = 0;
  }
  if (v43)
  {
    if (v8[1] == 6)
    {
      v31 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 131)
      {
        v32 = v16;
        v33 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        v10 = &ipcp_gotoptions;
        if (v33 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 10))
          goto LABEL_54;
        v16 = v32;
        LOBYTE(v43) = 0;
        v8 += 6;
        a3 = v31;
      }
    }
  }
  else
  {
    LOBYTE(v43) = 0;
  }
  if (v15)
  {
    if (v8[1] == 6)
    {
      v34 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 130)
      {
        v41 = v9;
        v35 = v13;
        v36 = v16;
        v37 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        v16 = v36;
        v13 = v35;
        v9 = v41;
        if (v37 != *((_DWORD *)&ipcp_gotoptions + 13 * v41 + 11))
          goto LABEL_54;
        v10 = &ipcp_gotoptions;
        LOBYTE(v15) = 0;
        v8 += 6;
        a3 = v34;
      }
    }
  }
  if (v16)
  {
    if (v8[1] == 6)
    {
      v38 = (a3 - 6);
      if ((int)a3 >= 6)
      {
        if (*v8 != 132 || htonl(bswap32(*(_DWORD *)(v8 + 2))) != v10[13 * v9 + 12])
          goto LABEL_54;
        LOBYTE(v16) = 0;
        a3 = v38;
      }
    }
  }
  if (!(_DWORD)a3)
  {
    if (a1[2] == 9)
      return 1;
    *v11 = v12;
    v11[1] = v13;
    v11[5] = v14;
    v11[9] = v44;
    v11[10] = v43;
    v11[11] = v15;
    result = 1;
    v11[12] = v16;
    return result;
  }
LABEL_54:
  if (debug)
    dbglog("ipcp_rejci: received bad Reject!", a2, a3, a4, a5, a6, a7, a8, v40);
  return 0;
}

uint64_t sub_10000EA04(int *a1, uint64_t __src, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  char *v10;
  char *v11;
  int v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  _BOOL4 v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  _BOOL4 v27;
  int v28;
  uint64_t v29;
  char *v30;
  unsigned int v31;
  int v32;
  int v33;
  unsigned __int8 v34;
  int v35;
  int v36;
  uint64_t v37;
  _BOOL4 v38;
  char *v39;
  const char *v40;
  int v42;
  _BYTE *v43;
  unsigned __int8 *v44;
  _BYTE *v45;
  int *v47;
  _BYTE *v48;
  _BYTE *v49;
  _BYTE *v50;
  _DWORD *v51;
  int v52;
  unsigned __int8 *v53;
  _DWORD *v54;
  _BYTE *v55;
  _DWORD *v56;
  _BYTE *v57;
  _BYTE *v58;
  _BYTE *v59;
  _DWORD *v60;
  _DWORD *v62;
  unsigned int *v63;
  _BYTE *v64;
  _BYTE *v65;

  v8 = a4;
  v9 = *a1;
  v10 = (char *)&ipcp_hisoptions + 52 * *a1;
  v11 = (char *)&ipcp_allowoptions + 52 * *a1;
  v12 = *a3;
  *((_DWORD *)v10 + 12) = 0;
  v13 = (char *)&ipcp_hisoptions + 52 * v9;
  *((_OWORD *)v13 + 1) = 0u;
  v56 = v13 + 16;
  *((_OWORD *)v13 + 2) = 0u;
  v62 = v13 + 32;
  *(_OWORD *)v10 = 0u;
  v57 = v11 + 5;
  v55 = v10 + 5;
  v50 = v10 + 6;
  v54 = v10 + 20;
  v53 = (unsigned __int8 *)(v10 + 24);
  v47 = (int *)(v11 + 20);
  v45 = v11 + 24;
  v14 = (char *)&ipcp_wantoptions + 52 * v9;
  v44 = (unsigned __int8 *)(v14 + 24);
  v64 = v10 + 1;
  v63 = (unsigned int *)(v14 + 32);
  v49 = v14 + 8;
  v58 = v11 + 1;
  v59 = (char *)&ipcp_allowoptions + 52 * v9;
  v60 = v14 + 28;
  v48 = v14 + 7;
  v65 = (char *)&ipcp_hisoptions + 52 * v9;
  v51 = v10 + 28;
  v43 = v14 + 2;
  v15 = (char *)__src;
  v16 = 2;
  v17 = (char *)__src;
  v52 = v9;
  while (v12)
  {
    v18 = v15;
    if (v12 >= 2
      && ((v19 = v15[1], v19 >= 2) ? (v20 = v12 >= v19) : (v20 = 0), v20))
    {
      v21 = *v15;
      v12 -= v19;
      v15 += v19;
      if (*v18 <= 0x80u)
      {
        if (v21 == 1)
        {
          if (!*v58 || (_DWORD)v19 != 10 || *v65)
          {
LABEL_92:
            v35 = 1;
            goto LABEL_97;
          }
          v28 = htonl(bswap32(*(_DWORD *)(v18 + 2)));
          v29 = *v63;
          if (v28 == (_DWORD)v29)
          {
            if (!v28)
            {
              *v43 = 0;
              v35 = 1;
              LOWORD(v19) = 10;
              goto LABEL_97;
            }
            v30 = v17;
            v26 = 2;
            goto LABEL_77;
          }
          v30 = v17;
          if (v28)
          {
            if (*v49)
              v26 = 2;
            else
              v26 = 3;
            if (*v49 || v8)
              goto LABEL_77;
LABEL_75:
            *(_DWORD *)(v18 + 2) = bswap32(ntohl(v29));
          }
          else if (!v8)
          {
            goto LABEL_75;
          }
          v26 = 3;
LABEL_77:
          v36 = htonl(bswap32(*(_DWORD *)(v18 + 6)));
          v37 = *v60;
          if (v36 != (_DWORD)v37)
          {
            if (v36 && *v48)
            {
              *v60 = v36;
            }
            else
            {
              if (!v8)
                *(_DWORD *)(v18 + 6) = bswap32(ntohl(v37));
              v26 = 3;
            }
          }
          *v64 = 1;
          *v62 = v28;
          *v51 = v36;
          v17 = v30;
          v9 = v52;
          goto LABEL_85;
        }
        if (v21 != 2)
        {
          if (v21 != 3 || !*v59 || (_DWORD)v19 != 6 || *v64)
            goto LABEL_92;
          v24 = htonl(bswap32(*(_DWORD *)(v18 + 2)));
          v25 = *v63;
          if (v24 == (_DWORD)v25)
          {
            if (!v24)
            {
              *v43 = 0;
              v35 = 1;
              LOWORD(v19) = 6;
              goto LABEL_97;
            }
            v26 = 2;
            goto LABEL_73;
          }
          if (v24)
          {
            if (*v49)
              v26 = 2;
            else
              v26 = 3;
            if (*v49 || v8)
              goto LABEL_73;
LABEL_71:
            *(_DWORD *)(v18 + 2) = bswap32(ntohl(v25));
          }
          else if (!v8)
          {
            goto LABEL_71;
          }
          v26 = 3;
LABEL_73:
          *v65 = 1;
          *v62 = v24;
          goto LABEL_85;
        }
        if ((v19 & 0xFFFFFFFD) != 4 || !*v57)
          goto LABEL_92;
        v31 = __rev16(*((unsigned __int16 *)v18 + 1));
        if (v31 == 45)
        {
          *v55 = 1;
          *v56 = 45;
          if ((_DWORD)v19 == 6)
          {
            v32 = v18[4];
            v33 = *v47;
            if (*v47 >= v32)
              v26 = 2;
            else
              v26 = 3;
            if (v33 < v32 && !v8)
            {
              v18[4] = v33;
              v26 = 3;
            }
            v34 = v18[5];
            if (v34)
            {
              if (!*v45)
              {
                v26 = 3;
                if (!v8)
                {
                  v18[5] = *v44;
                  v26 = 3;
                }
              }
            }
            *v54 = v32;
            *v53 = v34;
            goto LABEL_85;
          }
        }
        else
        {
          if ((_DWORD)v19 != 4 || v31 != 55)
            goto LABEL_92;
          *v55 = 1;
          *v56 = 55;
        }
        *v50 = 1;
        *v54 = 15;
        v26 = 2;
        *v53 = 1;
      }
      else
      {
        switch(v21)
        {
          case 129:
          case 131:
            v22 = v21 == 131;
            if ((_DWORD)v19 != 6)
              goto LABEL_92;
            v23 = *((unsigned int *)&ipcp_allowoptions + 13 * v9 + v22 + 9);
            if (!(_DWORD)v23)
              goto LABEL_92;
            break;
          case 130:
          case 132:
            v27 = v21 == 132;
            if ((_DWORD)v19 != 6)
              goto LABEL_92;
            v23 = *((unsigned int *)&ipcp_allowoptions + 13 * v9 + v27 + 11);
            if (!(_DWORD)v23)
              goto LABEL_92;
            break;
          default:
            goto LABEL_92;
        }
        if (htonl(bswap32(*(_DWORD *)(v18 + 2))) != (_DWORD)v23)
        {
          *(_DWORD *)(v18 + 2) = bswap32(ntohl(v23));
          goto LABEL_88;
        }
        v26 = 2;
      }
LABEL_85:
      if (v26 != 2 || (_DWORD)v16 == 2)
      {
        if (v26 != 3)
        {
          v35 = 0;
          goto LABEL_97;
        }
LABEL_88:
        if (v8)
          goto LABEL_92;
        if ((_DWORD)v16 != 4)
        {
          v35 = 0;
          if ((_DWORD)v16 == 2)
          {
            LODWORD(v16) = 3;
            v17 = (char *)__src;
          }
          else
          {
            LODWORD(v16) = 3;
          }
          goto LABEL_97;
        }
      }
    }
    else
    {
      if (debug)
        dbglog("ipcp_reqci: bad CI length!", __src, (uint64_t)a3, a4, a5, a6, a7, a8, v42);
      v35 = 1;
      LOWORD(v19) = v12;
      v12 = 0;
LABEL_97:
      v38 = v16 != 4;
      if ((v35 & v38) != 0)
        v16 = 4;
      else
        v16 = v16;
      if ((v35 & v38) != 0)
        v39 = (char *)__src;
      else
        v39 = v17;
      if (v39 != v18)
        memcpy(v39, v18, (unsigned __int16)v19);
      v17 = &v39[(unsigned __int16)v19];
    }
  }
  if ((_DWORD)v16 != 4 && !*v65 && !*v64 && !v8 && *v43)
  {
    if ((_DWORD)v16 == 2)
    {
      *v43 = 0;
      v17 = (char *)__src;
    }
    *(_WORD *)v17 = 1539;
    *(_DWORD *)(v17 + 2) = bswap32(ntohl(*v63));
    LODWORD(v17) = (_DWORD)v17 + 6;
    v16 = 3;
  }
  *a3 = (_DWORD)v17 - __src;
  if (debug)
  {
    v40 = "REJ";
    if ((_DWORD)v16 == 3)
      v40 = "NAK";
    if ((_DWORD)v16 == 2)
      v40 = "ACK";
    dbglog("ipcp: returning Configure-%s", __src, (uint64_t)a3, a4, a5, a6, a7, a8, (int)v40);
  }
  return v16;
}

void sub_10000F094(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  _BYTE *v10;
  char *v11;
  int *v12;
  int v13;
  char *v14;
  int *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  unsigned int *v27;
  int v28;
  char *v29;
  int v30;
  unsigned int *v31;
  int v32;
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
  char *v46;
  uint64_t v47;
  int *v48;
  unsigned int v49;
  uint64_t v50;
  char *v51;
  char *v52;
  int Mask;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  int *v64;
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
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  int v82;
  char *v83;
  uint64_t **v84;
  char *v85;
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
  int v100;
  int v101;

  v9 = *a1;
  v10 = (char *)&ipcp_hisoptions + 52 * *a1;
  if (debug)
    dbglog("ipcp: up", a2, a3, a4, a5, a6, a7, a8, v100);
  if (!*v10 && !*((_BYTE *)&ipcp_hisoptions + 52 * v9 + 1))
    *((_DWORD *)&ipcp_hisoptions + 13 * v9 + 8) = *((_DWORD *)&ipcp_wantoptions + 13 * v9 + 8);
  v11 = (char *)&ipcp_gotoptions + 52 * v9;
  v13 = *((_DWORD *)v11 + 7);
  v12 = (int *)(v11 + 28);
  if (!v13)
  {
    error("Could not determine local IP address", a2, a3, a4, a5, a6, a7, a8, v100);
    v51 = (char *)&ipcp_fsm + 80 * *a1;
    v52 = "Could not determine local IP address";
LABEL_48:
    fsm_close((uint64_t)v51, v52, v50, v40, v41, v42, v43, v44);
    return;
  }
  v14 = (char *)&ipcp_hisoptions + 52 * v9;
  v16 = *((_DWORD *)v14 + 8);
  v15 = (int *)(v14 + 32);
  if (!v16)
  {
    v17 = htonl((ifunit + 171982912));
    *v15 = v17;
    warning("Could not determine remote IP address: defaulting to %I", v18, v19, v20, v21, v22, v23, v24, v17);
  }
  slprintf((int)byte_10004A31C, 64, "%I");
  script_setenv("IPLOCAL", byte_10004A31C);
  v101 = *v15;
  slprintf((int)byte_10004A31C, 64, "%I");
  script_setenv("IPREMOTE", byte_10004A31C);
  v25 = (char *)&ipcp_gotoptions + 52 * v9;
  v28 = *((_DWORD *)v25 + 9);
  v27 = (unsigned int *)(v25 + 36);
  v26 = v28;
  if (v28)
  {
    v101 = v26;
    slprintf((int)byte_10004A31C, 64, "%I");
    script_setenv("DNS1", byte_10004A31C);
  }
  v29 = (char *)&ipcp_gotoptions + 52 * v9;
  v32 = *((_DWORD *)v29 + 10);
  v31 = (unsigned int *)(v29 + 40);
  v30 = v32;
  if (v32)
  {
    v101 = v30;
    slprintf((int)byte_10004A31C, 64, "%I");
    script_setenv("DNS2", byte_10004A31C);
  }
  if (byte_10004A36C && (*v27 || *v31))
  {
    script_setenv("USEPEERDNS", "1");
    sifdns(*v27, *v31);
  }
  if (byte_10004A36D && *(_QWORD *)((char *)&ipcp_gotoptions + 52 * v9 + 44))
    sifwins();
  if (!auth_ip_addr(*a1, *v15))
  {
    error("Peer is not authorized to use remote address %I", v33, v34, v35, v36, v37, v38, v39, *v15);
    v51 = (char *)&ipcp_fsm + 80 * *a1;
    v52 = "Unauthorized remote IP address";
    goto LABEL_48;
  }
  sifvjcomp(*a1, *((unsigned __int8 *)&ipcp_hisoptions + 52 * v9 + 5), *((unsigned __int8 *)&ipcp_hisoptions + 52 * v9 + 24), *((_DWORD *)&ipcp_hisoptions + 13 * v9 + 5));
  v45 = *v12;
  if (!demand)
  {
    Mask = GetMask(v45);
    if (sifaddr(*a1, *v12, *v15, Mask))
    {
      if (!sifnpafmode(*a1, 33, ip_src_address_filter))
        return;
      if (sifup())
      {
        sifnpmode(*a1, 33, 0);
        v61 = *a1;
        if (*((_BYTE *)&ipcp_wantoptions + 52 * (int)v61 + 3))
        {
          v62 = sifdefaultroute();
          v61 = *a1;
          v63 = *a1;
          if (v62)
            dword_10004A384[(int)v61] = 1;
        }
        else
        {
          v63 = *a1;
        }
        if (*((_BYTE *)&ipcp_wantoptions + 52 * v63 + 4) && sifproxyarp(v61, *v15))
          dword_10004A388[*a1] = 1;
        dword_10004777C = *v12;
        notice("local  IP address %I", v54, v55, v56, v57, v58, v59, v60, dword_10004777C);
        notice("remote IP address %I", v86, v87, v88, v89, v90, v91, v92, *v15);
        if (*v27)
          notice("primary   DNS address %I", v93, v94, v95, v96, v97, v98, v99, *v27);
        if (*v31)
          notice("secondary DNS address %I", v93, v94, v95, v96, v97, v98, v99, *v31);
        goto LABEL_54;
      }
      if (!debug)
        goto LABEL_47;
      v83 = "Interface failed to come up";
      goto LABEL_46;
    }
LABEL_44:
    if (!debug)
    {
LABEL_47:
      v51 = (char *)&ipcp_fsm + 80 * *a1;
      v52 = "Interface configuration failed";
      goto LABEL_48;
    }
    v83 = "Interface configuration failed";
LABEL_46:
    warning(v83, v47, v50, v40, v41, v42, v43, v44, v101);
    goto LABEL_47;
  }
  v46 = (char *)&ipcp_wantoptions + 52 * v9;
  v49 = *((_DWORD *)v46 + 7);
  v48 = (int *)(v46 + 28);
  v47 = v49;
  if ((_DWORD)v45 != v49)
  {
    LODWORD(v50) = *((_DWORD *)&ipcp_wantoptions + 13 * v9 + 8);
LABEL_34:
    v64 = (int *)((char *)&ipcp_wantoptions + 52 * v9 + 32);
    sub_10000F954(*a1, v47, v50);
    if (*v12 == *v48)
    {
      script_unsetenv("OLDIPLOCAL");
    }
    else
    {
      warning("Local IP address changed to %I", v65, v66, v67, v68, v69, v70, v71, *v12);
      v101 = *v48;
      slprintf((int)byte_10004A31C, 64, "%I");
      script_setenv("OLDIPLOCAL", byte_10004A31C);
      *v48 = *v12;
    }
    if (*v15 == *v64)
    {
      script_unsetenv("OLDIPREMOTE");
    }
    else
    {
      warning("Remote IP address changed to %I", v72, v73, v74, v75, v76, v77, v78, *v15);
      v101 = *v64;
      slprintf((int)byte_10004A31C, 64, "%I");
      script_setenv("OLDIPREMOTE", byte_10004A31C);
      *v64 = *v15;
    }
    v79 = GetMask(*v12);
    if (sifaddr(*a1, *v12, *v15, v79))
    {
      v80 = *a1;
      if (*((_BYTE *)&ipcp_wantoptions + 52 * (int)v80 + 3))
      {
        v81 = sifdefaultroute();
        v80 = *a1;
        v82 = *a1;
        if (v81)
          dword_10004A384[(int)v80] = 1;
      }
      else
      {
        v82 = *a1;
      }
      if (*((_BYTE *)&ipcp_wantoptions + 52 * v82 + 4) && sifproxyarp(v80, *v15))
        dword_10004A388[*a1] = 1;
      goto LABEL_53;
    }
    goto LABEL_44;
  }
  v50 = *((unsigned int *)&ipcp_wantoptions + 13 * v9 + 8);
  if (*v15 != (_DWORD)v50)
    goto LABEL_34;
LABEL_53:
  demand_rexmit(33, v47, v50, v40, v41, v42, v43, v44);
  sifnpmode(*a1, 33, 0);
LABEL_54:
  np_up();
  byte_10004A38C = 1;
  v84 = notify((uint64_t **)ip_up_notifier, 0);
  if (ipdata_up_hook)
    v84 = (uint64_t **)ipdata_up_hook(*a1, *v12, *v15);
  if (ip_up_hook)
    ip_up_hook(v84);
  notify((uint64_t **)ip_up_notify, 0);
  if ((byte_10004A390 & 1) == 0 && !dword_10004A394)
  {
    byte_10004A390 = 1;
    if (ip_up_script)
      v85 = (char *)ip_up_script;
    else
      v85 = "/etc/ppp/ip-up";
    sub_10000F9DC(v85);
  }
}

uint64_t sub_10000F7AC(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t **v9;
  uint64_t v10;
  uint64_t result;
  int v12;

  if (debug)
    dbglog("ipcp: down", a2, a3, a4, a5, a6, a7, a8, v12);
  update_link_stats(*a1);
  v9 = notify((uint64_t **)ip_down_notifier, 0);
  if (ipdata_down_hook)
    v9 = (uint64_t **)ipdata_down_hook(*a1);
  if (ip_down_hook)
    ip_down_hook(v9);
  if (byte_10004A38C == 1)
  {
    byte_10004A38C = 0;
    np_down();
  }
  sifvjcomp(*a1, 0, 0, 0);
  notify((uint64_t **)ip_down_notify, 0);
  v10 = *a1;
  if (demand)
  {
    result = sifnpmode(v10, 33, 3);
  }
  else
  {
    sifnpmode(v10, 33, 1);
    sifdown();
    result = sub_10000F954(*a1, *((_DWORD *)&ipcp_gotoptions + 13 * *a1 + 7), *((_DWORD *)&ipcp_hisoptions + 13 * *a1 + 8));
  }
  if (byte_10004A390 == 1 && !dword_10004A394)
  {
    byte_10004A390 = 0;
    if (ip_down_script)
      return sub_10000F9DC((char *)ip_down_script);
    else
      return sub_10000F9DC("/etc/ppp/ip-down");
  }
  return result;
}

void sub_10000F908(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004A398 == 1)
  {
    byte_10004A398 = 0;
    np_finished(*a1, 33, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t **sub_10000F92C(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2)
    return notify((uint64_t **)protocolsready_notifier, 0);
  return result;
}

uint64_t sub_10000F954(uint64_t a1, int a2, int a3)
{
  uint64_t v6;

  v6 = (int)a1;
  if (dword_10004A388[(int)a1])
  {
    cifproxyarp();
    dword_10004A388[v6] = 0;
  }
  if (dword_10004A384[v6])
  {
    cifdefaultroute();
    dword_10004A384[v6] = 0;
  }
  return cifaddr(a1, a2, a3);
}

uint64_t sub_10000F9DC(char *a1)
{
  uint64_t result;
  char *v3[8];
  _BYTE v4[32];
  _BYTE v5[32];
  _BYTE v6[32];

  slprintf((int)v6, 32, "%d");
  slprintf((int)v5, 32, "%I");
  slprintf((int)v4, 32, "%I");
  v3[0] = a1;
  v3[1] = &ifname;
  v3[2] = (char *)&devnam;
  v3[3] = v6;
  v3[4] = v5;
  v3[5] = v4;
  v3[6] = (char *)ipparam;
  v3[7] = 0;
  result = run_program(a1, v3, 0, (uint64_t)sub_10000FAFC, 0);
  dword_10004A394 = result;
  return result;
}

void sub_10000FAFC()
{
  uint64_t v0;
  const char *v1;

  dword_10004A394 = 0;
  if (byte_10004A390 == 1)
  {
    if (dword_100047838 == 9)
      return;
    byte_10004A390 = 0;
    v0 = ip_down_script;
    v1 = "/etc/ppp/ip-down";
  }
  else
  {
    if (dword_100047838 != 9)
      return;
    byte_10004A390 = 1;
    v0 = ip_up_script;
    v1 = "/etc/ppp/ip-up";
  }
  if (v0)
    sub_10000F9DC(v0);
  else
    sub_10000F9DC(v1);
}

double sub_10000FB6C(int a1)
{
  char *v1;
  char *v2;
  char *v3;
  double result;

  v1 = (char *)&lcp_fsm + 80 * a1;
  v2 = (char *)&lcp_wantoptions + 68 * a1;
  v3 = (char *)&lcp_allowoptions + 68 * a1;
  *(_DWORD *)v1 = a1;
  *((_DWORD *)v1 + 1) = 49185;
  *((_QWORD *)v1 + 7) = off_100043808;
  fsm_init((uint64_t)v1);
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + 16) = 0;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_WORD *)(v2 + 3) = 257;
  *((_DWORD *)v2 + 4) = 1500;
  *((_WORD *)v2 + 4) = 257;
  v2[10] = 1;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_DWORD *)v3 + 16) = 0;
  *((_DWORD *)v3 + 4) = 0x4000;
  v3[24] = 7;
  result = 7.74860419e-304;
  *(_DWORD *)(v3 + 3) = 16843009;
  v3[15] = 1;
  *(_DWORD *)(v3 + 7) = 16843009;
  return result;
}

void sub_10000FC2C(int a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char *v11;
  int v12;

  v11 = (char *)&lcp_fsm + 80 * a1;
  v12 = *((_DWORD *)v11 + 3);
  if ((v12 & 0x100) != 0)
  {
    *((_DWORD *)v11 + 3) = v12 & 0xFFFFFEFF;
    fsm_lowerup((uint64_t)&lcp_fsm + 80 * a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8);
  }
  fsm_input((uint64_t)v11, __src, a3, a4, a5, a6, a7, a8, a9);
}

void sub_10000FC8C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  error("Received Protocol-Reject for LCP!", a2, a3, a4, a5, a6, a7, a8, v16);
  fsm_protreject((uint64_t)&lcp_fsm + 80 * a1, v9, v10, v11, v12, v13, v14, v15);
}

void lcp_lowerup(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((ppp_send_config(a1, 1500, 0xFFFFFFFFLL, 0, 0) & 0x80000000) == 0)
  {
    v2 = (int)a1;
    if (lax_recv)
      v3 = 0;
    else
      v3 = 0xFFFFFFFFLL;
    if ((ppp_recv_config(a1, 1500, v3, *((unsigned __int8 *)&lcp_wantoptions + 68 * (int)a1 + 9), *((unsigned __int8 *)&lcp_wantoptions + 68 * (int)a1 + 10)) & 0x80000000) == 0)
    {
      v4 = (char *)&lcp_fsm + 80 * (int)a1;
      peer_mru[v2] = 1500;
      notify((uint64_t **)lcp_lowerup_notify, 0);
      if (listen_time)
      {
        *((_DWORD *)&lcp_fsm + 20 * (int)v2 + 3) |= 0x100u;
        timeout((int)sub_1000105C0);
      }
      else
      {
        fsm_lowerup((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
}

void lcp_lowerdown(int a1)
{
  char *v2;
  unsigned int *v3;
  int v4;
  int v5;

  notify((uint64_t **)lcp_lowerdown_notify, 0);
  v2 = (char *)&lcp_fsm + 80 * a1;
  v5 = *((_DWORD *)v2 + 3);
  v3 = (unsigned int *)(v2 + 12);
  v4 = v5;
  if ((v5 & 0x100) != 0)
    *v3 = v4 & 0xFFFFFEFF;
  else
    fsm_lowerdown((uint64_t)&lcp_fsm + 80 * a1);
}

void lcp_open(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  unsigned int *v9;
  int v10;
  unsigned int v11;

  v8 = (char *)&lcp_fsm + 80 * a1;
  v10 = *((_DWORD *)v8 + 3);
  v9 = (unsigned int *)(v8 + 12);
  v11 = v10 & 0xFFFFFFFA;
  *v9 = v10 & 0xFFFFFFFA;
  if (*((_BYTE *)&lcp_wantoptions + 68 * a1))
  {
    v11 |= 1u;
    *v9 = v11;
  }
  if (*((_BYTE *)&lcp_wantoptions + 68 * a1 + 1))
    *v9 = v11 | 4;
  fsm_open((uint64_t)&lcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void lcp_close(int a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v10;
  _DWORD *v11;
  char *v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v10 = (char *)&lcp_fsm + 80 * a1;
  v11 = v10 + 12;
  if ((v10[13] & 1) != 0)
  {
    untimeout((uint64_t)sub_1000105C0, (uint64_t)v10);
    if ((*v11 & 0x100) != 0)
    {
      *v11 &= ~0x100u;
      fsm_lowerup((uint64_t)v10, (uint64_t)__s, a3, a4, a5, a6, a7, a8);
    }
  }
  if (phase)
    new_phase(9);
  v12 = (char *)&lcp_fsm + 80 * a1;
  v14 = *((_DWORD *)v12 + 2);
  v13 = v12 + 8;
  if (v14 == 3 && (*(_BYTE *)v11 & 5) != 0)
  {
    notice("LCP close (%s).", (uint64_t)__s, a3, a4, a5, a6, a7, a8, (int)__s);
    *v13 = 2;
  }
  else
  {
    fsm_close((uint64_t)v10, __s, a3, a4, a5, a6, a7, a8);
    if (!*v13)
      notice("LCP close (%s).", v15, v16, v17, v18, v19, v20, v21, (int)__s);
  }
  link_terminated();
}

uint64_t sub_10000FF94(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  uint64_t v4;
  unsigned int v6;
  int v7;
  unsigned int v11;
  int v12;
  char *v13;
  const char *v14;
  int v15;
  const char *v16;
  const char *v17;
  char *v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  int v22;
  uint64_t v23;
  const char *v24;
  unsigned int v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  char *v29;
  int64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  int v38;
  int v39;
  int v41;

  if (a2 < 4)
    return 0;
  v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  v7 = v6 - 4;
  if (v6 < 4 || v6 > a2)
    return 0;
  v11 = *a1;
  v12 = a1[1];
  v13 = (char *)(a1 + 4);
  if (v11 - 1 > 0xA)
    v14 = " code=0x%x";
  else
    v14 = " %s";
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if (v11 > 0xB)
  {
LABEL_73:
    if (v7 >= 1)
      goto LABEL_74;
    return ((_DWORD)v13 - (_DWORD)a1);
  }
  if (((1 << v11) & 0x1E) != 0)
  {
    if (v6 < 6)
      goto LABEL_73;
    v16 = " <";
    v17 = ">";
    v18 = v13;
    while (1)
    {
      v19 = v18[1];
      v20 = v19 >= 2 && v7 >= v19;
      if (!v20)
      {
        v13 = v18;
        goto LABEL_74;
      }
      v21 = *v18;
      a3(a4, v16);
      v22 = v21 - 1;
      v13 = v18;
      switch(v22)
      {
        case 0:
          v13 = v18;
          if ((_DWORD)v19 == 4)
          {
            v13 = v18 + 4;
            v23 = a4;
            v24 = "mru %d";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 1:
          v13 = v18;
          if ((_DWORD)v19 == 6)
          {
            v13 = v18 + 6;
            v23 = a4;
            v24 = "asyncmap 0x%x";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 2:
          v13 = v18;
          if (v19 < 4)
            goto LABEL_54;
          a3(a4, "auth ");
          v13 = v18 + 4;
          v25 = __rev16(*((unsigned __int16 *)v18 + 1));
          if (v25 == 49703)
          {
            v23 = a4;
            v24 = "eap";
            goto LABEL_53;
          }
          if (v25 != 49699)
          {
            if (v25 != 49187)
              goto LABEL_52;
            v23 = a4;
            v24 = "pap";
            goto LABEL_53;
          }
          a3(a4, "chap");
          if (v19 < 5)
            goto LABEL_54;
          v32 = *v13;
          switch(v32)
          {
            case 129:
              v33 = a4;
              v34 = " MS-v2";
              goto LABEL_68;
            case 128:
              v33 = a4;
              v34 = " MS";
              goto LABEL_68;
            case 5:
              v33 = a4;
              v34 = " MD5";
LABEL_68:
              a3(v33, v34);
              v13 = v18 + 5;
              break;
          }
LABEL_54:
          if (v13 < &v18[v19])
          {
            v41 = v7;
            v26 = v4;
            v27 = v17;
            v28 = v16;
            v29 = &v18[v19];
            v30 = v29 - v13;
            do
            {
              v31 = *v13++;
              ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v31);
              --v30;
            }
            while (v30);
            v13 = v29;
            v16 = v28;
            v17 = v27;
            v4 = v26;
            v7 = v41;
          }
          v7 -= v19;
          a3(a4, v17);
          v18 = v13;
          if (v7 <= 1)
            goto LABEL_73;
          break;
        case 3:
          v13 = v18;
          if (v19 >= 4)
          {
            a3(a4, "quality ");
            v13 = v18 + 4;
            if (__rev16(*((unsigned __int16 *)v18 + 1)) != 49189)
              goto LABEL_52;
            v23 = a4;
            v24 = "lqr";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 4:
          v13 = v18;
          if ((_DWORD)v19 == 6)
          {
            v13 = v18 + 6;
            v23 = a4;
            v24 = "magic 0x%x";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 6:
          v13 = v18;
          if ((_DWORD)v19 == 2)
          {
            v13 = v18 + 2;
            v23 = a4;
            v24 = "pcomp";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 7:
          v13 = v18;
          if ((_DWORD)v19 == 2)
          {
            v13 = v18 + 2;
            v23 = a4;
            v24 = "accomp";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 12:
          v13 = v18;
          if (v19 >= 3)
          {
            a3(a4, "callback ");
            v13 = v18 + 3;
            if (v18[2] == 6)
            {
              v23 = a4;
              v24 = "CBCP";
            }
            else
            {
LABEL_52:
              v23 = a4;
              v24 = "0x%x";
            }
            goto LABEL_53;
          }
          goto LABEL_54;
        case 16:
          v13 = v18;
          if ((_DWORD)v19 == 4)
          {
            v13 = v18 + 4;
            v23 = a4;
            v24 = "mrru %d";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 17:
          v13 = v18;
          if ((_DWORD)v19 == 2)
          {
            v13 = v18 + 2;
            v23 = a4;
            v24 = "ssnhf";
LABEL_53:
            a3(v23, v24);
          }
          goto LABEL_54;
        case 18:
          a3(a4, "endpoint");
          v13 = v18;
          goto LABEL_54;
        default:
          goto LABEL_54;
      }
    }
  }
  if (((1 << v11) & 0xE00) != 0)
  {
    v20 = v6 >= 8;
    v15 = v6 - 8;
    if (v20)
    {
      ((void (*)(uint64_t, const char *, ...))a3)(a4, " magic=0x%x", bswap32(*((_DWORD *)a1 + 1)));
      v13 = (char *)(a1 + 12);
      v7 = v15;
    }
    goto LABEL_73;
  }
  if (((1 << v11) & 0x60) == 0)
    goto LABEL_73;
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_74:
      v35 = 0;
      v36 = (v7 - 1);
      if (v36 >= 0x1F)
        v37 = 31;
      else
        v37 = v7 - 1;
      v38 = ~v37;
      if (v36 >= 0x1F)
        LODWORD(v36) = 31;
      v39 = v36 + 1;
      do
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v13[v35++]);
      while (v39 != (_DWORD)v35);
      if ((int)v35 >= v7)
      {
        LODWORD(v13) = (_DWORD)v13 + v35;
      }
      else
      {
        a3(a4, " ...");
        LODWORD(v13) = (_DWORD)v13 + v7 + v38 + v35;
      }
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    a3(a4, " ");
    print_string(v13, v6 - 4, a3, a4);
    LODWORD(v13) = (_DWORD)v13 + v7;
  }
  return ((_DWORD)v13 - (_DWORD)a1);
}

void sub_100010518(int a1)
{
  if (byte_10004A3A0 == 1)
  {
    untimeout((uint64_t)sub_100010680, (uint64_t)&lcp_fsm + 80 * a1);
    byte_10004A3A0 = 0;
  }
}

void sub_100010560(int a1)
{
  dword_10004A39C = 0;
  dword_10004A980 = 0;
  byte_10004A3A0 = 0;
  ppp_auxiliary_probe_init();
  if (lcp_echo_interval)
    sub_10001069C((int *)&lcp_fsm + 20 * a1);
}

void sub_1000105C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  v8 = *(_DWORD *)(a1 + 12);
  if ((v8 & 0x100) != 0)
  {
    *(_DWORD *)(a1 + 12) = v8 & 0xFFFFFEFF;
    fsm_lowerup(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

void sub_1000105D8()
{
  link_terminated();
}

void lcp_sprotrej(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  unsigned int *v9;
  char v10;

  v9 = (unsigned int *)((char *)&lcp_fsm + 80 * a1);
  v10 = *((_BYTE *)v9 + 16) + 1;
  *((_BYTE *)v9 + 16) = v10;
  fsm_sdata(v9, 8, v10, (char *)(a2 + 2), (a3 - 2), a6, a7, a8, a9);
}

void lcp_echo_restart(int a1)
{
  int *v1;

  v1 = (int *)((char *)&lcp_fsm + 80 * a1);
  dword_10004A39C = 0;
  if (byte_10004A3A0 == 1)
  {
    untimeout((uint64_t)sub_100010680, (uint64_t)v1);
    byte_10004A3A0 = 0;
  }
  if (lcp_echo_interval)
    sub_10001069C(v1);
}

uint64_t sub_100010680()
{
  uint64_t result;

  if (byte_10004A3A0 == 1)
  {
    byte_10004A3A0 = 0;
    return sub_10001069C();
  }
  return result;
}

void sub_10001069C(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t v11;
  unsigned int __src;

  v11 = 0;
  if (ppp_variable_echo_is_off() && get_idle_time(0, (uint64_t)&v11) && HIDWORD(v11) < lcp_echo_interval)
  {
    dword_10004A39C = 0;
    ppp_auxiliary_probe_stop();
  }
  else
  {
    if (lcp_echo_fails)
    {
      v9 = dword_10004A39C;
      if (dword_10004A39C >= lcp_echo_fails)
      {
        sub_100013304(a1, v2, v3, v4, v5, v6, v7, v8);
        v9 = 0;
        dword_10004A39C = 0;
      }
      ppp_auxiliary_probe_check(v9, (void (*)(uint64_t))sub_100013304, (uint64_t)a1, v4, v5, v6, v7, v8);
    }
    if (a1[2] == 9)
    {
      __src = bswap32(*(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]);
      v10 = dword_10004A980++;
      fsm_sdata((unsigned int *)a1, 9, v10, (char *)&__src, 4, v6, v7, v8, v11);
      ++dword_10004A39C;
    }
  }
  if (a1[2] == 9)
  {
    if (byte_10004A3A0 == 1)
      warning("assertion lcp_echo_timer_running==0 failed", v2, v3, v4, v5, v6, v7, v8, v11);
    timeout((int)sub_100010680);
    byte_10004A3A0 = 1;
  }
}

uint64_t sub_1000107EC()
{
  dword_100047950 = 0;
  xmmword_100047930 = 0u;
  unk_100047940 = 0u;
  lcp_wantoptions = 0u;
  unk_100047920 = 0u;
  lcp_allowoptions = 0u;
  *(_OWORD *)&dword_1000479A8 = 0u;
  xmmword_1000479B8 = 0u;
  unk_1000479C8 = 0u;
  dword_1000479D8 = 0;
  return 1;
}

uint64_t sub_100010820(unsigned int *a1)
{
  uint64_t v2;
  char *v3;
  char *v4;
  __int128 v5;
  __int128 v6;
  char *v7;

  v2 = (int)*a1;
  v3 = (char *)&lcp_wantoptions + 68 * v2;
  v4 = (char *)&lcp_gotoptions + 68 * v2;
  *((_DWORD *)v3 + 8) = magic();
  *((_DWORD *)v3 + 9) = 0;
  *((_DWORD *)v4 + 16) = *((_DWORD *)v3 + 16);
  v5 = *((_OWORD *)v3 + 1);
  *(_OWORD *)v4 = *(_OWORD *)v3;
  *((_OWORD *)v4 + 1) = v5;
  v6 = *((_OWORD *)v3 + 3);
  *((_OWORD *)v4 + 2) = *((_OWORD *)v3 + 2);
  *((_OWORD *)v4 + 3) = v6;
  if (!multilink)
  {
    v7 = (char *)&lcp_gotoptions + 68 * (int)v2;
    *(_WORD *)(v7 + 13) = 0;
    v7[15] = 0;
  }
  if (noendpoint)
    *((_BYTE *)&lcp_allowoptions + 68 * (int)v2 + 15) = 0;
  peer_mru[*a1] = 1500;
  return auth_reset(*a1);
}

uint64_t sub_1000108E4(int *a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  char *v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v1 = *a1;
  v2 = *((unsigned __int8 *)&lcp_gotoptions + 68 * *a1 + 3);
  if (*((_BYTE *)&lcp_gotoptions + 68 * *a1 + 3))
    v2 = 4 * (*((_DWORD *)&lcp_gotoptions + 17 * v1 + 4) != 1500);
  v3 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 4);
  if (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 4))
  {
    if (*((_DWORD *)&lcp_gotoptions + 17 * v1 + 7) == -1)
      v3 = 0;
    else
      v3 = 6;
  }
  v4 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 7);
  if (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 7))
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 6);
    if (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 6))
    {
      v6 = 0;
      v5 = 5;
    }
    else
    {
      v6 = 4 * (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 5) != 0);
    }
  }
  v7 = (char *)&lcp_gotoptions + 68 * v1;
  if (v7[15])
    v8 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 45) + 3;
  else
    v8 = 0;
  v9 = v3 + v2 + 4 * (v4 != 0) + v5 + v6 + 8 * (v7[11] != 0);
  if (v7[12])
    v10 = 3;
  else
    v10 = 0;
  if (v7[8])
    v11 = 6;
  else
    v11 = 0;
  return v9
       + v10
       + v11
       + 2 * (v7[9] != 0)
       + 2 * (v7[10] != 0)
       + 4 * (v7[13] != 0)
       + 2 * (v7[14] != 0)
       + v8;
}

void sub_100010A50(int *a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9;
  uint64_t v10;
  char *v11;
  _DWORD *v12;
  int v13;
  char *v14;
  char *v15;
  int v16;
  char *v17;
  _BYTE *v18;
  int v19;
  uint64_t v20;
  char *v21;
  _BYTE *v22;
  int v23;
  int v24;
  int v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  _BYTE *v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;

  v9 = *a1;
  v10 = a2;
  if (lcp_gotoptions[68 * *a1 + 3])
  {
    v11 = (char *)&lcp_gotoptions[68 * v9];
    v13 = *((_DWORD *)v11 + 4);
    v12 = v11 + 16;
    v10 = a2;
    if (v13 != 1500)
    {
      *(_WORD *)a2 = 1025;
      *(_BYTE *)(a2 + 2) = BYTE1(*v12);
      v10 = a2 + 4;
      *(_BYTE *)(a2 + 3) = *v12;
    }
  }
  if (lcp_gotoptions[68 * v9 + 4])
  {
    v14 = (char *)&lcp_gotoptions[68 * v9];
    v16 = *((_DWORD *)v14 + 7);
    v15 = v14 + 28;
    if (v16 != -1)
    {
      *(_WORD *)v10 = 1538;
      *(_BYTE *)(v10 + 2) = v15[3];
      *(_BYTE *)(v10 + 3) = *((_WORD *)v15 + 1);
      *(_BYTE *)(v10 + 4) = BYTE1(*(_DWORD *)v15);
      *(_BYTE *)(v10 + 5) = *(_DWORD *)v15;
      v10 += 6;
    }
  }
  v17 = (char *)&lcp_gotoptions[68 * v9];
  v19 = v17[7];
  v18 = v17 + 7;
  if (!v19 || (*(_DWORD *)v10 = 667026435, v10 += 4, v20 = v10, !*v18))
  {
    v21 = (char *)&lcp_gotoptions[68 * v9];
    v23 = v21[6];
    v22 = v21 + 6;
    if (v23)
    {
      *(_DWORD *)v10 = 599917827;
      v24 = lcp_gotoptions[68 * v9 + 24];
      if ((v24 & 1) != 0)
      {
        LOBYTE(v25) = -127;
      }
      else if ((v24 & 2) != 0)
      {
        LOBYTE(v25) = 0x80;
      }
      else
      {
        v25 = (v24 << 29 >> 31) & 5;
      }
      v20 = v10 + 5;
      *(_BYTE *)(v10 + 4) = v25;
      if (*v18 || *v22)
        goto LABEL_20;
    }
    else
    {
      v20 = v10;
    }
    if (lcp_gotoptions[68 * v9 + 5])
    {
      *(_DWORD *)v20 = 599786499;
      v20 += 4;
    }
  }
LABEL_20:
  if (lcp_gotoptions[68 * v9 + 11])
  {
    *(_DWORD *)v20 = 633341956;
    v26 = (char *)&lcp_gotoptions[68 * v9];
    *(_BYTE *)(v20 + 4) = v26[43];
    *(_BYTE *)(v20 + 5) = *((_WORD *)v26 + 21);
    *(_BYTE *)(v20 + 6) = BYTE1(*((_DWORD *)v26 + 10));
    *(_BYTE *)(v20 + 7) = *((_DWORD *)v26 + 10);
    v20 += 8;
  }
  if (lcp_gotoptions[68 * v9 + 12])
  {
    *(_WORD *)v20 = 781;
    *(_BYTE *)(v20 + 2) = 6;
    v20 += 3;
  }
  if (lcp_gotoptions[68 * v9 + 8])
  {
    *(_WORD *)v20 = 1541;
    v27 = (char *)&lcp_gotoptions[68 * v9];
    *(_BYTE *)(v20 + 2) = v27[35];
    *(_BYTE *)(v20 + 3) = *((_WORD *)v27 + 17);
    *(_BYTE *)(v20 + 4) = BYTE1(*((_DWORD *)v27 + 8));
    *(_BYTE *)(v20 + 5) = *((_DWORD *)v27 + 8);
    v20 += 6;
  }
  if (lcp_gotoptions[68 * v9 + 9])
  {
    *(_WORD *)v20 = 519;
    v20 += 2;
  }
  if (lcp_gotoptions[68 * v9 + 10])
  {
    *(_WORD *)v20 = 520;
    v20 += 2;
  }
  if (lcp_gotoptions[68 * v9 + 13])
  {
    *(_WORD *)v20 = 1041;
    v28 = (char *)&lcp_gotoptions[68 * v9];
    *(_BYTE *)(v20 + 2) = BYTE1(*((_DWORD *)v28 + 5));
    *(_BYTE *)(v20 + 3) = *((_DWORD *)v28 + 5);
    v20 += 4;
  }
  if (lcp_gotoptions[68 * v9 + 14])
  {
    *(_WORD *)v20 = 530;
    v20 += 2;
  }
  if (lcp_gotoptions[68 * v9 + 15])
  {
    *(_BYTE *)v20 = 19;
    v29 = (char *)&lcp_gotoptions[68 * v9];
    v31 = v29[45];
    v30 = v29 + 45;
    *(_BYTE *)(v20 + 1) = v31 + 3;
    v32 = v20 + 3;
    *(_BYTE *)(v20 + 2) = *(v30 - 1);
    if (*v30)
    {
      v33 = 0;
      v34 = (char *)&lcp_gotoptions[68 * v9 + 46];
      do
      {
        *(_BYTE *)(v32 + v33) = v34[v33];
        ++v33;
      }
      while (v33 < *v30);
      v20 = v32 + v33;
    }
    else
    {
      v20 += 3;
    }
  }
  if (v20 - a2 != *a3)
    error("Bug in lcp_addci: wrong length", a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_100010D78(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  BOOL v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  int v20;
  int vars0;

  v8 = *a1;
  if (lcp_gotoptions[68 * *a1 + 3])
  {
    v9 = *(_DWORD *)&lcp_gotoptions[68 * v8 + 16];
    if (v9 != 1500)
    {
      v11 = __OFSUB__((_DWORD)a3, 4);
      a3 = (a3 - 4);
      if ((int)a3 < 0 != v11
        || *(_BYTE *)(a2 + 1) != 4
        || *(_BYTE *)a2 != 1
        || v9 != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
      {
        goto LABEL_89;
      }
      a2 += 4;
    }
  }
  if (lcp_gotoptions[68 * v8 + 4])
  {
    v10 = *(_DWORD *)&lcp_gotoptions[68 * v8 + 28];
    if (v10 != -1)
    {
      v11 = __OFSUB__((_DWORD)a3, 6);
      a3 = (a3 - 6);
      if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 6 || *(_BYTE *)a2 != 2 || bswap32(*(_DWORD *)(a2 + 2)) != v10)
        goto LABEL_89;
      a2 += 6;
    }
  }
  if (lcp_gotoptions[68 * v8 + 7])
  {
    v11 = __OFSUB__((_DWORD)a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 4 || *(_BYTE *)a2 != 3)
      goto LABEL_89;
    v12 = bswap32(*(unsigned __int16 *)(a2 + 2));
    v13 = 49703;
LABEL_15:
    if (v13 != HIWORD(v12))
      goto LABEL_89;
    a2 += 4;
    goto LABEL_39;
  }
  if (lcp_gotoptions[68 * v8 + 6])
  {
    v11 = __OFSUB__((_DWORD)a3, 5);
    a3 = (a3 - 5);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 5
      || *(_BYTE *)a2 != 3
      || bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16 != 49699)
    {
      goto LABEL_89;
    }
    v14 = lcp_gotoptions[68 * v8 + 24];
    if ((v14 & 1) != 0)
      v15 = 129;
    else
      v15 = (v14 & 2) != 0 ? 128 : (v14 << 29 >> 31) & 5;
    if (v15 != *(unsigned __int8 *)(a2 + 4))
      goto LABEL_89;
    a2 += 5;
  }
  else if (lcp_gotoptions[68 * v8 + 5])
  {
    v11 = __OFSUB__((_DWORD)a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 4 || *(_BYTE *)a2 != 3)
      goto LABEL_89;
    v12 = bswap32(*(unsigned __int16 *)(a2 + 2));
    v13 = 49187;
    goto LABEL_15;
  }
LABEL_39:
  if (lcp_gotoptions[68 * v8 + 11])
  {
    v11 = __OFSUB__((_DWORD)a3, 8);
    a3 = (a3 - 8);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 8
      || *(_BYTE *)a2 != 4
      || bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16 != 49189
      || bswap32(*(_DWORD *)(a2 + 4)) != *(_DWORD *)&lcp_gotoptions[68 * v8 + 40])
    {
      goto LABEL_89;
    }
    a2 += 8;
  }
  if (lcp_gotoptions[68 * v8 + 12])
  {
    v11 = __OFSUB__((_DWORD)a3, 3);
    a3 = (a3 - 3);
    if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 3 || *(_BYTE *)a2 != 13 || *(_BYTE *)(a2 + 2) != 6)
      goto LABEL_89;
    a2 += 3;
  }
  if (lcp_gotoptions[68 * v8 + 8])
  {
    v11 = __OFSUB__((_DWORD)a3, 6);
    a3 = (a3 - 6);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 6
      || *(_BYTE *)a2 != 5
      || bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * v8 + 32])
    {
      goto LABEL_89;
    }
    a2 += 6;
  }
  if (lcp_gotoptions[68 * v8 + 9])
  {
    v11 = __OFSUB__((_DWORD)a3, 2);
    a3 = (a3 - 2);
    if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 2 || *(_BYTE *)a2 != 7)
      goto LABEL_89;
    a2 += 2;
  }
  if (lcp_gotoptions[68 * v8 + 10])
  {
    v11 = __OFSUB__((_DWORD)a3, 2);
    a3 = (a3 - 2);
    if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 2 || *(_BYTE *)a2 != 8)
      goto LABEL_89;
    a2 += 2;
  }
  if (lcp_gotoptions[68 * v8 + 13])
  {
    v11 = __OFSUB__((_DWORD)a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 4
      || *(_BYTE *)a2 != 17
      || *(_DWORD *)&lcp_gotoptions[68 * v8 + 20] != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
    {
      goto LABEL_89;
    }
    a2 += 4;
  }
  if (lcp_gotoptions[68 * v8 + 14])
  {
    v11 = __OFSUB__((_DWORD)a3, 2);
    a3 = (a3 - 2);
    if ((int)a3 < 0 != v11 || *(_BYTE *)(a2 + 1) != 2 || *(_BYTE *)a2 != 18)
      goto LABEL_89;
    a2 += 2;
  }
  if (lcp_gotoptions[68 * v8 + 15])
  {
    v16 = &lcp_gotoptions[68 * v8];
    v17 = v16[45];
    a3 = (a3 - (v17 + 3));
    if ((int)a3 < 0
      || (_DWORD)v17 + 3 != *(unsigned __int8 *)(a2 + 1)
      || *(_BYTE *)a2 != 19
      || *(unsigned __int8 *)(a2 + 2) != v16[44])
    {
      goto LABEL_89;
    }
    if (v16[45])
    {
      v18 = (unsigned __int8 *)(a2 + 3);
      v19 = &lcp_gotoptions[68 * v8 + 46];
      do
      {
        v20 = *v19++;
        if (*v18 != v20)
          goto LABEL_89;
        ++v18;
      }
      while (--v17);
    }
  }
  if (!(_DWORD)a3)
    return 1;
LABEL_89:
  if (debug)
    dbglog("lcp_acki: received bad Ack!", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t sub_1000111E8(int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  signed int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  signed int v40;
  int v41;
  char v42;
  char v43;
  char v44;
  int v45;
  unsigned __int8 *v46;
  unsigned int v47;
  uint64_t v48;
  char v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  signed int v53;
  char v54;
  char v55;
  unsigned int v56;
  signed int v57;
  char v58;
  unsigned int v59;
  signed int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 *v64;
  uint64_t v65;
  char v66;
  BOOL v67;
  char v68;
  char v69;
  char v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  char v74;
  uint64_t result;
  int v76;
  char v77;
  char v78;
  char v79;
  int *v80;
  signed int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  BOOL v90;
  char v91;
  uint64_t v92;
  int v93;
  char v94;
  unsigned __int8 v95;
  int v96;
  char v97;
  unsigned int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  char v103;
  char v104;
  char v105;
  char v106;
  signed int v107;
  signed int v108;
  signed int v109;
  int v110;
  char v111;
  char v112;
  char v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned __int8 v118;
  unsigned __int8 v119;
  unsigned __int8 v120;
  int v121;
  unsigned __int8 v122;
  unsigned __int8 v123;
  int v124;
  int v125;
  int v126;
  unsigned int v127;
  char v128;
  char v129;
  char v130;
  unsigned __int8 *v131;
  unsigned __int8 *v132;
  char v133;
  char v134;
  char v135;
  uint64_t v136;
  char v137;
  char v138;
  int v139;
  unsigned int v140;
  __int16 v141;
  unsigned __int8 v142;
  __int16 v143;
  unsigned __int8 v144;
  __int128 v145;
  uint64_t v146;

  v4 = (uint64_t)a1;
  v5 = *a1;
  v6 = lcp_gotoptions;
  v7 = &lcp_gotoptions[68 * *a1];
  v143 = *(_WORD *)v7;
  v144 = v7[2];
  v8 = v7[5];
  LODWORD(v9) = v7[6];
  LODWORD(v10) = v7[7];
  v122 = v7[10];
  v123 = v7[9];
  v11 = v7[11];
  v12 = v7[12];
  v13 = v7[14];
  v14 = v7[15];
  v16 = *((_DWORD *)v7 + 4);
  v15 = *((_DWORD *)v7 + 5);
  LOBYTE(v121) = v7[24];
  v142 = v7[27];
  v141 = *(_WORD *)(v7 + 25);
  v17 = *((_DWORD *)v7 + 7);
  v18 = *((unsigned int *)v7 + 8);
  v19 = *((_DWORD *)v7 + 10);
  v110 = *((_DWORD *)v7 + 9);
  v146 = *(_QWORD *)(v7 + 60);
  v145 = *(_OWORD *)(v7 + 44);
  if (!v7[3])
    goto LABEL_12;
  v20 = 0;
  v137 = 1;
  if ((int)a3 < 4 || v16 == 1500)
    goto LABEL_13;
  if (*(_BYTE *)(a2 + 1) != 4 || *(_BYTE *)a2 != 1)
  {
LABEL_12:
    v20 = 0;
    v137 = 1;
    goto LABEL_13;
  }
  v137 = 0;
  v21 = *(unsigned __int16 *)(a2 + 2);
  a2 += 4;
  v22 = __rev16(v21);
  if (v22 < 0x5DD || (int)v22 <= *((_DWORD *)&lcp_wantoptions + 17 * v5 + 4))
    v16 = v22;
  v20 = 1;
  a3 = (a3 - 4);
LABEL_13:
  if (!v7[4])
    goto LABEL_19;
  v133 = 1;
  v134 = 0;
  if (v17 != -1 && (int)a3 >= 6)
  {
    if (*(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 2)
    {
      v24 = *(_DWORD *)(a2 + 2);
      a2 += 6;
      v17 |= bswap32(v24);
      v133 = 0;
      v134 = 1;
      a3 = (a3 - 6);
      goto LABEL_20;
    }
LABEL_19:
    v133 = 1;
    v134 = 0;
  }
LABEL_20:
  v132 = &lcp_gotoptions[68 * v5 + 6];
  v119 = v7[8];
  v120 = v7[4];
  v118 = v7[13];
  v139 = v7[3];
  v140 = v16;
  if (!v7[6] && !v7[5])
  {
    v25 = 0;
    if (!v7[7] || (int)a3 <= 3)
    {
      LOBYTE(v26) = v7[14];
      v27 = v7[11];
      v28 = a2;
      v29 = a3;
      v126 = 0;
      v124 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      goto LABEL_62;
    }
LABEL_26:
    v26 = v7[14];
    if (*(_BYTE *)a2 != 3)
    {
      v25 = 0;
      v126 = 0;
      v124 = 0;
      v27 = v7[11];
      v28 = a2;
      v29 = a3;
      goto LABEL_62;
    }
    v25 = 0;
    v30 = *(unsigned __int8 *)(a2 + 1);
    if (v30 < 4 || (v29 = a3 - v30, a3 < v30))
    {
      v27 = v7[11];
      v28 = a2;
      v29 = a3;
      v126 = 0;
      v124 = 0;
      goto LABEL_62;
    }
    v28 = a2 + 4;
    v31 = __rev16(*(unsigned __int16 *)(a2 + 2));
    if (v30 == 4 && v31 == 49187)
    {
      if (v7[7])
        goto LABEL_32;
      if (!v7[6])
        goto LABEL_200;
      v124 = 0;
      v126 = 1;
      v27 = v7[11];
      LOBYTE(v9) = 0;
      v25 = v7[5];
      LOBYTE(v10) = 0;
LABEL_62:
      v135 = 0;
      if (v27)
      {
        a3 = (v29 - 8);
        if ((int)v29 >= 8)
        {
          if (*(_BYTE *)(v28 + 1) == 8 && *(_BYTE *)v28 == 4)
          {
            a2 = v28 + 8;
            if (bswap32(*(unsigned __int16 *)(v28 + 2)) >> 16 == 49189)
              v19 = bswap32(*(_DWORD *)(v28 + 4));
            else
              v11 = 0;
            v135 = 1;
            goto LABEL_70;
          }
          v135 = 0;
        }
      }
      a2 = v28;
      a3 = v29;
LABEL_70:
      v13 = v26;
      goto LABEL_71;
    }
    if (v30 != 5 || v31 != 49699)
    {
      v34 = v7[7];
      v35 = v30 - 4;
      if (v30 == 4)
      {
        v34 = v7[7];
        if (v31 == 49703)
        {
          v34 = v7[7];
          if (v7[7])
          {
            v97 = v20;
            v36 = v7[11];
            v107 = *((_DWORD *)v7 + 5);
            v98 = *((_DWORD *)v7 + 8);
            v100 = v17;
            v102 = v7[7];
            v10 = v7[12];
            v114 = *((_DWORD *)v7 + 10);
            v37 = v7[15];
            v38 = v7[14];
            v39 = v4;
            v136 = v30 - 4;
            dbglog("Unexpected Conf-Nak for EAP", (uint64_t)lcp_gotoptions, a3, v11, v18, v14, v26, v4, v96);
            v35 = v136;
            v6 = lcp_gotoptions;
            v4 = v39;
            LOBYTE(v26) = v38;
            v14 = v37;
            v18 = v98;
            v17 = v100;
            v19 = v114;
            v12 = v10;
            LODWORD(v10) = v102;
            v15 = v107;
            v11 = v36;
            v20 = v97;
            v34 = lcp_gotoptions[68 * v5 + 7];
          }
        }
      }
      v40 = v15;
      v41 = v17;
      if (v34)
      {
        v42 = 0;
        v43 = v8;
        v44 = v9;
      }
      else
      {
        if (*v132)
          v43 = v8;
        else
          v43 = 0;
        if (*v132)
          v44 = 0;
        else
          v44 = v9;
        v42 = v10;
      }
      v28 += v35;
      v45 = v8;
      v27 = lcp_gotoptions[68 * v5 + 11];
      v126 = v9;
      v124 = v10;
      LOBYTE(v8) = v43;
      LOBYTE(v9) = v44;
      v25 = v45;
      LOBYTE(v10) = v42;
      v17 = v41;
      v15 = v40;
      goto LABEL_62;
    }
    v28 = a2 + 5;
    v32 = *(unsigned __int8 *)(a2 + 4);
    if (v7[7])
    {
      switch(v32)
      {
        case 5:
          LOBYTE(v10) = 0;
          v89 = v7[24];
          v90 = (v121 & 4) == 0;
          v91 = 4;
          break;
        case 128:
          LOBYTE(v10) = 0;
          v89 = v7[24];
          v90 = (v121 & 2) == 0;
          v91 = 2;
          break;
        case 129:
          LOBYTE(v10) = 0;
          v33 = v7[24];
          if ((v33 & 1) != 0)
            v33 = 1;
          LOBYTE(v121) = v33;
          goto LABEL_33;
        default:
LABEL_32:
          LOBYTE(v10) = 0;
LABEL_33:
          v124 = 1;
          v27 = v7[11];
          v25 = v7[5];
          v126 = v7[6];
          goto LABEL_62;
      }
      if (!v90)
        v89 = v91;
      LOBYTE(v121) = v89;
      goto LABEL_33;
    }
    if (!v7[6])
    {
      v126 = 0;
      v124 = 0;
      LOBYTE(v10) = 0;
      v27 = v7[11];
      v25 = v7[5];
      LOBYTE(v8) = 0;
      goto LABEL_62;
    }
    v18 = v7[12];
    if ((v121 & 1) == v32 && (v121 & 6) == 0)
      goto LABEL_200;
    if (v32 == 5)
    {
      v92 = v7[12];
      v93 = v7[24];
      if ((v7[24] & 4) == 0)
        goto LABEL_217;
      v124 = 0;
      LOBYTE(v10) = 0;
      v94 = 4;
    }
    else
    {
      v92 = v7[12];
      if (v32 != 128)
      {
        v93 = v7[24];
        if (v32 == 129 && (v7[24] & 1) != 0)
        {
          v124 = 0;
          LOBYTE(v10) = 0;
          v126 = 1;
          v27 = v7[11];
          LOBYTE(v121) = 1;
LABEL_223:
          v18 = *((unsigned int *)v7 + 8);
          v25 = v7[5];
          LOBYTE(v9) = v7[6];
          v15 = *((_DWORD *)v7 + 5);
LABEL_224:
          v12 = v92;
          goto LABEL_62;
        }
LABEL_217:
        v124 = 0;
        LOBYTE(v10) = 0;
        v121 = (v93 - 1) & v93;
        if (v121)
          v95 = v7[6];
        else
          v95 = 0;
        v126 = 1;
        v27 = v7[11];
        LOBYTE(v9) = v95;
        v15 = *((_DWORD *)v7 + 5);
        v18 = *((unsigned int *)v7 + 8);
        v25 = v7[5];
        goto LABEL_224;
      }
      v93 = v7[24];
      if ((v7[24] & 2) == 0)
        goto LABEL_217;
      v124 = 0;
      LOBYTE(v10) = 0;
      v94 = 2;
    }
    LOBYTE(v121) = v94;
    v126 = 1;
    v27 = v7[11];
    goto LABEL_223;
  }
  if ((int)a3 >= 4)
    goto LABEL_26;
  v124 = 0;
  v126 = 0;
  v25 = 0;
  v135 = 0;
LABEL_71:
  v46 = &lcp_gotoptions[68 * v5];
  if (v46[12] && (int)a3 >= 3 && *(_BYTE *)(a2 + 1) == 3 && *(_BYTE *)a2 == 13)
  {
    v12 = 0;
    a2 += 3;
    a3 = (a3 - 3);
  }
  v131 = &lcp_gotoptions[68 * v5 + 8];
  v125 = v25;
  if (!*v131)
  {
    v130 = 0;
    v113 = 1;
    v52 = v12;
    goto LABEL_85;
  }
  v47 = v19;
  v48 = (a3 - 6);
  if ((int)a3 < 6)
  {
    v130 = 0;
    v113 = 1;
    v52 = v12;
    goto LABEL_84;
  }
  if (*(_BYTE *)(a2 + 1) != 6 || *(_BYTE *)a2 != 5)
  {
    v52 = v12;
    v130 = 0;
    v113 = 1;
LABEL_84:
    v19 = v47;
    goto LABEL_85;
  }
  a2 += 6;
  v127 = v11;
  v130 = 1;
  v105 = v9;
  v108 = v15;
  v115 = v47;
  v49 = v13;
  v50 = v17;
  v103 = v10;
  v10 = v14;
  v9 = v4;
  v51 = magic();
  v6 = lcp_gotoptions;
  v4 = v9;
  v14 = v10;
  LOBYTE(v10) = v103;
  LOBYTE(v9) = v105;
  v52 = v12;
  v15 = v108;
  v11 = v127;
  v18 = v51;
  v17 = v50;
  v13 = v49;
  v46 = &lcp_gotoptions[68 * v5];
  v113 = 0;
  a3 = v48;
  v19 = v115;
LABEL_85:
  v53 = v15;
  v54 = 0;
  if (lcp_gotoptions[68 * v5 + 9] && (int)a3 >= 2)
  {
    if (*(_BYTE *)(a2 + 1) == 2 && *(_BYTE *)a2 == 7)
    {
      v123 = 0;
      a2 += 2;
      v54 = 1;
      a3 = (a3 - 2);
    }
    else
    {
      v54 = 0;
    }
  }
  if (lcp_gotoptions[68 * v5 + 10] && (int)a3 >= 2)
  {
    if (*(_BYTE *)(a2 + 1) == 2 && *(_BYTE *)a2 == 8)
    {
      v122 = 0;
      a2 += 2;
      v128 = 1;
      a3 = (a3 - 2);
    }
    else
    {
      v128 = 0;
    }
  }
  else
  {
    v128 = 0;
  }
  v55 = 0;
  if (lcp_gotoptions[68 * v5 + 13] && (int)a3 >= 4)
  {
    if (*(_BYTE *)(a2 + 1) == 4 && *(_BYTE *)a2 == 17)
    {
      v56 = *(unsigned __int16 *)(a2 + 2);
      a2 += 4;
      v57 = __rev16(v56);
      if (v57 <= *((_DWORD *)&lcp_wantoptions + 17 * v5 + 5))
        v53 = v57;
      else
        v53 = v15;
      v55 = 1;
      a3 = (a3 - 4);
    }
    else
    {
      v55 = 0;
    }
  }
  v58 = 0;
  if (lcp_gotoptions[68 * v5 + 14] && (int)a3 >= 2)
  {
    if (*(_BYTE *)(a2 + 1) == 2 && *(_BYTE *)a2 == 18)
    {
      v13 = 0;
      a2 += 2;
      v58 = 1;
      a3 = (a3 - 2);
    }
    else
    {
      v58 = 0;
    }
  }
  if (!lcp_gotoptions[68 * v5 + 15] || (int)a3 <= 2)
  {
LABEL_119:
    if ((int)a3 < 2)
    {
      v60 = v53;
      v61 = v18;
LABEL_188:
      if (*(_DWORD *)(v4 + 8) == 9)
        return 1;
      if ((v113 & 1) != 0)
      {
        v76 = 0;
      }
      else
      {
        v76 = v110 + 1;
        if (v110 + 1 >= lcp_loopbackfail)
        {
          v101 = v17;
          v129 = v11;
          v117 = v19;
          v138 = v52;
          v112 = v8;
          v77 = v14;
          v78 = v10;
          v79 = v9;
          LODWORD(v9) = v61;
          v80 = (int *)v4;
          v81 = v60;
          notice("Serial line is looped back.", (uint64_t)v6, a3, v11, v18, v14, v52, v4, v96);
          v82 = *v80;
          v61 = v9;
          LOBYTE(v9) = v79;
          LOBYTE(v10) = v78;
          lcp_close(v82, "Loopback detected", v83, v84, v85, v86, v87, v88);
          v60 = v81;
          v17 = v101;
          LOBYTE(v14) = v77;
          LOBYTE(v8) = v112;
          LOBYTE(v52) = v138;
          v19 = v117;
          LOBYTE(v11) = v129;
          *(_DWORD *)status = 17;
        }
      }
      *(_WORD *)v7 = v143;
      v7[2] = v144;
      v7[3] = v139;
      v7[4] = v120;
      v7[5] = v8;
      v7[6] = v9;
      v7[7] = v10;
      v7[8] = v119;
      v7[9] = v123;
      v7[10] = v122;
      v7[11] = v11;
      v7[12] = v52;
      v7[13] = v118;
      v7[14] = v13;
      v7[15] = v14;
      *((_DWORD *)v7 + 4) = v140;
      *((_DWORD *)v7 + 5) = v60;
      v7[24] = v121;
      v7[27] = v142;
      *(_WORD *)(v7 + 25) = v141;
      *((_DWORD *)v7 + 7) = v17;
      *((_DWORD *)v7 + 8) = v61;
      *((_DWORD *)v7 + 9) = v76;
      *((_DWORD *)v7 + 10) = v19;
      *(_QWORD *)(v7 + 60) = v146;
      result = 1;
      *(_OWORD *)(v7 + 44) = v145;
      return result;
    }
    goto LABEL_121;
  }
  if (*(_BYTE *)a2 == 19)
  {
    v59 = *(unsigned __int8 *)(a2 + 1);
    if (v59 >= 3 && a3 >= v59)
    {
      v14 = 0;
      a2 += *(unsigned __int8 *)(a2 + 1);
      a3 = a3 - v59;
      v6 = lcp_gotoptions;
      goto LABEL_119;
    }
  }
LABEL_121:
  v104 = v10;
  v106 = v9;
  v111 = v8;
  v99 = v18;
  v116 = v19;
  v109 = v53;
  v62 = v14;
  v63 = v52;
  v10 = v11;
  v6 = v46 + 11;
  v64 = &lcp_gotoptions[68 * v5];
  v11 = (uint64_t)(v64 + 5);
  v18 = (uint64_t)(v64 + 7);
  v14 = (uint64_t)(v64 + 28);
  v26 = (uint64_t)(v64 + 16);
  while (2)
  {
    v65 = *(unsigned __int8 *)(a2 + 1);
    if (v65 >= 2)
    {
      a3 = (a3 - v65);
      if ((int)a3 >= 0)
      {
        switch(*(_BYTE *)a2)
        {
          case 1:
            if (v7[3])
            {
              if (*(_DWORD *)v26 == 1500)
                v66 = v20;
              else
                v66 = 1;
              if ((_DWORD)v65 != 4 || (v66 & 1) != 0)
                goto LABEL_200;
            }
            else
            {
              if ((_DWORD)v65 == 4)
                v70 = v137 ^ 1;
              else
                v70 = 1;
              if ((v70 & 1) != 0)
                goto LABEL_200;
            }
            v71 = __rev16(*(unsigned __int16 *)(a2 + 2));
            v72 = v139;
            if (v71 < 0x5DC)
              v72 = 1;
            v139 = v72;
            v73 = v140;
            if (v71 < 0x5DC)
              v73 = v71;
            v140 = v73;
            goto LABEL_164;
          case 2:
            if (lcp_gotoptions[68 * v5 + 4])
            {
              v67 = *(_DWORD *)v14 == -1;
              v68 = v134;
LABEL_145:
              if (!v67)
                v68 = 1;
              if ((_DWORD)v65 != 6)
                goto LABEL_200;
LABEL_163:
              if ((v68 & 1) != 0)
                goto LABEL_200;
            }
            else
            {
              v74 = v133;
              if ((_DWORD)v65 != 6)
                v74 = 0;
              if ((v74 & 1) == 0)
                goto LABEL_200;
            }
LABEL_164:
            a2 += v65;
            if ((int)a3 > 1)
              continue;
            v11 = v10;
            v52 = v63;
            v14 = v62;
            LOBYTE(v9) = v106;
            v60 = v109;
            v61 = v99;
            v19 = v116;
            LOBYTE(v8) = v111;
            LOBYTE(v10) = v104;
            break;
          case 3:
            if (*v132 | v126 || *(_BYTE *)v11 || v125 || *(_BYTE *)v18 || v124)
              goto LABEL_200;
            goto LABEL_164;
          case 4:
            v68 = v135;
            if (*v6)
              v68 = 1;
            if ((_DWORD)v65 != 8)
              goto LABEL_200;
            goto LABEL_163;
          case 5:
            v67 = *v131 == 0;
            v68 = v130;
            goto LABEL_145;
          case 7:
            if ((_DWORD)v65 == 2)
              v68 = v54;
            else
              v68 = 1;
            if (lcp_gotoptions[68 * v5 + 9])
              goto LABEL_200;
            goto LABEL_163;
          case 8:
            if ((_DWORD)v65 == 2)
              v68 = v128;
            else
              v68 = 1;
            if (lcp_gotoptions[68 * v5 + 10])
              goto LABEL_200;
            goto LABEL_163;
          case 0x11:
            if ((_DWORD)v65 == 4)
              v68 = v55;
            else
              v68 = 1;
            if (lcp_gotoptions[68 * v5 + 13])
              goto LABEL_200;
            goto LABEL_163;
          case 0x12:
            if ((_DWORD)v65 == 2)
              v69 = v58;
            else
              v69 = 1;
            if (lcp_gotoptions[68 * v5 + 14] || (v69 & 1) != 0)
              goto LABEL_200;
            v13 = 1;
            goto LABEL_164;
          case 0x13:
            if (lcp_gotoptions[68 * v5 + 15] || v65 < 3)
              goto LABEL_200;
            goto LABEL_164;
          default:
            goto LABEL_164;
        }
        goto LABEL_188;
      }
    }
    break;
  }
LABEL_200:
  if (debug)
    dbglog("lcp_nakci: received bad Nak!", (uint64_t)v6, a3, v11, v18, v14, v26, v4, v96);
  return 0;
}

uint64_t sub_100011FCC(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  int v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  unsigned __int8 *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t result;
  int v35;

  v3 = *a1;
  v4 = &lcp_gotoptions[68 * (int)v3];
  v5 = v4[3];
  v6 = v4[4];
  v7 = v4[5];
  v8 = v4[6];
  v9 = v4[7];
  v10 = v4[8];
  v11 = v4[9];
  v12 = v4[10];
  v13 = v4[11];
  v14 = v4[12];
  v15 = v4[13];
  v16 = v4[14];
  v17 = v4[15];
  v18 = (a3 - 4);
  if ((int)a3 >= 4 && v4[3] && a2[1] == 4 && *a2 == 1)
  {
    a3 = *(unsigned int *)&lcp_gotoptions[68 * (int)v3 + 16];
    if ((_DWORD)a3 != bswap32(*((unsigned __int16 *)a2 + 1)) >> 16)
      goto LABEL_110;
    v5 = 0;
    a2 += 4;
    a3 = v18;
  }
  if (v4[4])
    v19 = (int)a3 < 6;
  else
    v19 = 1;
  if (!v19 && a2[1] == 6 && *a2 == 2)
  {
    if (bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 28])
      goto LABEL_110;
    v6 = 0;
    a2 += 6;
    a3 = (a3 - 6);
  }
  if (v4[7])
    v20 = (int)a3 < 4;
  else
    v20 = 1;
  if (!v20)
  {
    if (a2[1] != 4 || *a2 != 3)
      goto LABEL_47;
    if (bswap32(*((unsigned __int16 *)a2 + 1)) >> 16 != 49703)
      goto LABEL_110;
    goto LABEL_38;
  }
  if (v4[7])
    goto LABEL_47;
  if (v4[6])
    v21 = (int)a3 < 5;
  else
    v21 = 1;
  if (v21)
  {
    if (!v4[6])
    {
      if (v4[5])
        v22 = (int)a3 < 4;
      else
        v22 = 1;
      if (!v22 && a2[1] == 4 && *a2 == 3)
      {
        v7 = bswap32(*((unsigned __int16 *)a2 + 1));
        v8 = 49187;
        if (WORD1(v7) != 49187)
          goto LABEL_110;
        v7 = 0;
        v8 = 0;
LABEL_38:
        v9 = 0;
        a2 += 4;
        a3 = (a3 - 4);
        goto LABEL_47;
      }
      v8 = 0;
    }
    goto LABEL_46;
  }
  if (a2[1] != 5 || *a2 != 3)
  {
LABEL_46:
    v9 = 0;
    goto LABEL_47;
  }
  v7 = bswap32(*((unsigned __int16 *)a2 + 1));
  v8 = 49699;
  if (WORD1(v7) != 49699)
    goto LABEL_110;
  v7 = a2[4];
  v23 = lcp_gotoptions[68 * (int)v3 + 24];
  if ((v23 & 1) != 0)
    v8 = 129;
  else
    v8 = (v23 & 2) != 0 ? 128 : (v23 << 29 >> 31) & 5;
  if ((_DWORD)v8 != (_DWORD)v7)
    goto LABEL_110;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  a3 = (a3 - 5);
  a2 += 5;
LABEL_47:
  if (v4[11])
    v24 = (int)a3 < 8;
  else
    v24 = 1;
  if (!v24 && a2[1] == 8 && *a2 == 4)
  {
    if (bswap32(*((unsigned __int16 *)a2 + 1)) >> 16 != 49189
      || bswap32(*((_DWORD *)a2 + 1)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 40])
    {
      goto LABEL_110;
    }
    v13 = 0;
    a2 += 8;
    a3 = (a3 - 8);
  }
  if (v4[12])
    v25 = (int)a3 < 3;
  else
    v25 = 1;
  if (!v25 && a2[1] == 3 && *a2 == 13)
  {
    if (a2[2] != 6)
      goto LABEL_110;
    v14 = 0;
    a2 += 3;
    a3 = (a3 - 3);
  }
  if (v4[8])
    v26 = (int)a3 < 6;
  else
    v26 = 1;
  if (!v26 && a2[1] == 6 && *a2 == 5)
  {
    if (bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 32])
      goto LABEL_110;
    v10 = 0;
    a2 += 6;
    a3 = (a3 - 6);
  }
  if (v4[9])
    v27 = (int)a3 < 2;
  else
    v27 = 1;
  if (!v27 && a2[1] == 2 && *a2 == 7)
  {
    v11 = 0;
    a3 = (a3 - 2);
    a2 += 2;
  }
  if (v4[10])
    v28 = (int)a3 < 2;
  else
    v28 = 1;
  if (!v28 && a2[1] == 2 && *a2 == 8)
  {
    v12 = 0;
    a3 = (a3 - 2);
    a2 += 2;
  }
  if (v4[13])
    v29 = (int)a3 < 4;
  else
    v29 = 1;
  if (!v29 && a2[1] == 4 && *a2 == 17)
  {
    if (*(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 20] != bswap32(*((unsigned __int16 *)a2 + 1)) >> 16)
      goto LABEL_110;
    v15 = 0;
    a2 += 4;
    a3 = (a3 - 4);
  }
  if (v4[14] && (int)a3 >= 2 && a2[1] == 2 && *a2 == 18)
  {
    v16 = 0;
    a2 += 2;
    a3 = (a3 - 2);
  }
  if (v4[15])
  {
    v30 = &lcp_gotoptions[68 * (int)v3];
    v31 = v30[45];
    v32 = (a3 - (v31 + 3));
    if ((int)a3 >= (int)v31 + 3 && *a2 == 19 && (_DWORD)v31 + 3 == a2[1])
    {
      v17 = a2[2];
      a3 = v30[44];
      if ((_DWORD)v17 != (_DWORD)a3)
        goto LABEL_110;
      if (v30[45])
      {
        a2 += 3;
        a3 = (uint64_t)&lcp_gotoptions[68 * (int)v3 + 46];
        do
        {
          v17 = *a2;
          v33 = *(unsigned __int8 *)a3++;
          v3 = v33;
          if ((_DWORD)v17 != v33)
            goto LABEL_110;
          ++a2;
        }
        while (--v31);
      }
      v17 = 0;
      a3 = v32;
    }
  }
  if (!(_DWORD)a3)
  {
    if (a1[2] == 9)
      return 1;
    v4[3] = v5;
    v4[4] = v6;
    v4[5] = v7;
    v4[6] = v8;
    v4[7] = v9;
    v4[8] = v10;
    v4[9] = v11;
    v4[10] = v12;
    v4[11] = v13;
    v4[12] = v14;
    v4[13] = v15;
    v4[14] = v16;
    result = 1;
    v4[15] = v17;
    return result;
  }
LABEL_110:
  if (debug)
    dbglog("lcp_rejci: received bad Reject!", (uint64_t)a2, a3, v7, v17, v3, (uint64_t)lcp_gotoptions, v8, v35);
  return 0;
}

uint64_t sub_1000124B4(int *a1, char *__dst, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  unsigned int *v12;
  char *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  char *v16;
  int v17;
  char *v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  unsigned int v22;
  unsigned int *v23;
  int v24;
  unsigned __int8 v25;
  int v26;
  unsigned int v27;
  char *v28;
  int v29;
  unsigned __int8 v30;
  unsigned int v31;
  int v32;
  char v33;
  char *v34;
  int v35;
  char *v36;
  int v37;
  char *v38;
  char v39;
  int v40;
  int v41;
  __int16 v42;
  BOOL v43;
  int v44;
  signed int v45;
  const char *v46;
  int v48;
  char *v49;
  int v50;
  char *v53;
  _BYTE *v54;
  _BYTE *v55;
  _DWORD *v56;
  _BYTE *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  _BYTE *v62;
  int *v63;
  _BYTE *v64;
  char *v65;
  _BYTE *v66;
  _BYTE *v67;
  char *v68;
  char *v69;
  char *v70;
  _BYTE *v71;
  char *v72;
  void *v73;
  _BYTE *v74;
  unsigned __int8 *v75;
  _BYTE *v76;
  _BYTE *v77;
  _BYTE *v78;
  _BYTE *v79;
  _BYTE *v80;
  _BYTE *v81;
  _BYTE *v82;
  _BYTE *v83;
  _BYTE *v84;
  _BYTE *v85;
  _DWORD *v86;
  _BYTE *v87;

  v50 = a4;
  v8 = __dst;
  v9 = 17 * *a1;
  v10 = (char *)&lcp_hisoptions + 68 * *a1;
  v11 = *a3;
  *((_DWORD *)v10 + 16) = 0;
  *((_OWORD *)v10 + 3) = 0u;
  *(_OWORD *)v10 = 0u;
  v76 = v10 + 15;
  v75 = (unsigned __int8 *)(v10 + 44);
  v74 = v10 + 45;
  v73 = v10 + 46;
  v72 = v10 + 14;
  v71 = v10 + 13;
  v70 = v10 + 20;
  v69 = v10 + 10;
  v68 = v10 + 9;
  v66 = v10 + 8;
  v61 = v10 + 6;
  v60 = v10 + 5;
  v59 = v10 + 7;
  v53 = v10 + 24;
  v64 = v10 + 4;
  *((_OWORD *)v10 + 2) = 0u;
  v12 = (unsigned int *)(v10 + 32);
  v62 = v10 + 3;
  v63 = (int *)(v10 + 28);
  *((_OWORD *)v10 + 1) = 0u;
  v65 = v10 + 16;
  v13 = (char *)&lcp_allowoptions + 4 * v9;
  v84 = v13 + 14;
  v85 = v13 + 15;
  v82 = v13 + 10;
  v83 = v13 + 13;
  v81 = v13 + 9;
  v14 = &lcp_gotoptions[4 * v9];
  v77 = v14 + 8;
  v56 = v14 + 32;
  v87 = v13 + 8;
  v80 = v13 + 11;
  v67 = v13 + 5;
  v57 = v13 + 6;
  v54 = v13 + 24;
  v55 = v13 + 7;
  v86 = v13 + 28;
  v78 = v13 + 3;
  v79 = v13 + 4;
  v49 = v13 + 40;
  v58 = (char *)&unk_10004A3A1;
  v15 = 2;
  v16 = __dst;
  while (1)
  {
    v17 = multilink;
LABEL_3:
    v18 = v16;
    if (!v11)
      break;
    if (v11 >= 2
      && ((v19 = v16[1], v19 >= 2) ? (v20 = v11 >= v19) : (v20 = 0), v20))
    {
      v21 = *v16;
      v11 -= v19;
      v16 += v19;
      switch(v21)
      {
        case 1:
          if ((_DWORD)v19 != 4 || !*v78)
            goto LABEL_86;
          v22 = __rev16(*((unsigned __int16 *)v18 + 1));
          if (v22 <= 0x7F)
          {
            *(_DWORD *)v58 = -2147482623;
            v36 = v58 + 4;
            goto LABEL_122;
          }
          *v62 = 1;
          v23 = (unsigned int *)v65;
LABEL_48:
          *v23 = v22;
          goto LABEL_81;
        case 2:
          if ((_DWORD)v19 != 6 || !*v79)
            goto LABEL_86;
          v24 = (v18[2] << 16) | (v18[3] << 8) | v18[4];
          v25 = v18[5];
          v26 = v25 | (v24 << 8);
          if ((*v86 & ~v26) == 0)
          {
            *v64 = 1;
            *v63 = v26;
            goto LABEL_81;
          }
          v35 = v24 << 8;
          *(_WORD *)v58 = 1538;
          v58[2] = (*v86 | v35) >> 24;
          v58[3] = (*v86 | v35) >> 16;
          v58[4] = (unsigned __int16)(*v86 | v35) >> 8;
          v58[5] = v25 | *v86;
          v36 = v58 + 6;
          goto LABEL_122;
        case 3:
          if (v19 < 4 || !*v67 && !*v57 && !*v55)
          {
            v34 = "No auth is possible";
LABEL_100:
            dbglog(v34, (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, v48);
            goto LABEL_86;
          }
          v27 = __rev16(*((unsigned __int16 *)v18 + 1));
          if (v27 == 49703)
          {
            if (*v61 || (_DWORD)v19 != 4 || *v60)
            {
              if (!debug)
                goto LABEL_86;
              v34 = "lcp_reqci: rcvd AUTHTYPE EAP, rejecting...";
              goto LABEL_100;
            }
            if (*v55)
            {
              v28 = v59;
              goto LABEL_80;
            }
            v38 = v58;
            *v58 = 3;
            v36 = v58 + 4;
            if (!*v57)
            {
              *(_WORD *)(v58 + 1) = -16380;
              v39 = 35;
              goto LABEL_119;
            }
LABEL_109:
            *(_WORD *)(v38 + 1) = -15867;
            v38[3] = 35;
            goto LABEL_110;
          }
          if (v27 != 49699)
          {
            if (v27 == 49187)
            {
              if (*v61 || (_DWORD)v19 != 4 || *v59)
              {
                if (!debug)
                  goto LABEL_86;
                v34 = "lcp_reqci: rcvd AUTHTYPE PAP, rejecting...";
                goto LABEL_100;
              }
              if (*v67)
              {
                v28 = v60;
                goto LABEL_80;
              }
              v38 = v58;
              *v58 = 3;
              v36 = v58 + 4;
              if (*v55)
              {
LABEL_107:
                *(_WORD *)(v38 + 1) = -15868;
                v39 = 39;
LABEL_119:
                v38[3] = v39;
                goto LABEL_122;
              }
              goto LABEL_109;
            }
            v38 = v58;
            *v58 = 3;
            v36 = v58 + 4;
            if (*v55)
              goto LABEL_107;
            if (!*v57)
            {
              *(_WORD *)(v58 + 1) = -16380;
              v58[3] = 35;
              goto LABEL_122;
            }
            *(_WORD *)(v58 + 1) = -15867;
            v58[3] = 35;
LABEL_110:
            v40 = *v54;
            if ((v40 & 1) != 0)
            {
              LOBYTE(v41) = -127;
            }
            else if ((v40 & 2) != 0)
            {
              LOBYTE(v41) = 0x80;
            }
            else
            {
              v41 = (v40 << 29 >> 31) & 5;
            }
            v58[4] = v41;
            v36 = v58 + 5;
            goto LABEL_122;
          }
          if (*v60 || (_DWORD)v19 != 5 || *v59)
          {
            if (!debug)
              goto LABEL_86;
            v34 = "lcp_reqci: rcvd AUTHTYPE CHAP, rejecting...";
            goto LABEL_100;
          }
          if (*v57)
          {
            v32 = v18[4];
            if (v32 == 5)
            {
              if ((*v54 & 4) != 0)
              {
                v33 = 4;
                goto LABEL_79;
              }
            }
            else if (v32 == 128)
            {
              if ((*v54 & 2) != 0)
              {
                v33 = 2;
LABEL_79:
                *v53 = v33;
                v28 = v61;
LABEL_80:
                *v28 = 1;
                goto LABEL_81;
              }
            }
            else if (v32 == 129 && (*v54 & 1) != 0)
            {
              v33 = 1;
              goto LABEL_79;
            }
            *(_DWORD *)v58 = 599917827;
            goto LABEL_110;
          }
          *(_WORD *)v58 = 1027;
          v36 = v58 + 4;
          if (*v55)
            v42 = 10178;
          else
            v42 = 9152;
          *((_WORD *)v58 + 1) = v42;
LABEL_122:
          v58 = v36;
          if (v50)
            goto LABEL_86;
LABEL_123:
          v43 = (_DWORD)v15 == 4;
          v15 = 4;
          if (!v43)
            v15 = 3;
          break;
        case 4:
          if ((_DWORD)v19 != 8 || !*v80)
            goto LABEL_86;
          if (bswap32(*((unsigned __int16 *)v18 + 1)) >> 16 == 49189)
            goto LABEL_81;
          *(_DWORD *)v58 = 633341956;
          v58[4] = v49[3];
          v58[5] = *((_WORD *)v49 + 1);
          v58[6] = BYTE1(*(_DWORD *)v49);
          v58[7] = *(_DWORD *)v49;
          v36 = v58 + 8;
          goto LABEL_122;
        case 5:
          if (*v87)
          {
            if ((_DWORD)v19 != 6)
              goto LABEL_86;
            v29 = *v77;
          }
          else
          {
            if ((_DWORD)v19 != 6)
              goto LABEL_86;
            v29 = *v77;
            if (!*v77)
              goto LABEL_86;
          }
          v31 = bswap32(*(_DWORD *)(v18 + 2));
          if (v29 && v31 == *v56)
          {
            v37 = magic();
            *(_WORD *)v58 = 1541;
            v58[2] = HIBYTE(v37);
            v58[3] = BYTE2(v37);
            v58[4] = BYTE1(v37);
            v58[5] = v37;
            v58 += 6;
            goto LABEL_123;
          }
          *v66 = 1;
          *v12 = v31;
LABEL_81:
          if ((_DWORD)v15 == 2)
            continue;
          goto LABEL_3;
        case 7:
          if ((_DWORD)v19 != 2 || !*v81)
            goto LABEL_86;
          v28 = v68;
          goto LABEL_80;
        case 8:
          if ((_DWORD)v19 != 2 || !*v82)
            goto LABEL_86;
          v28 = v69;
          goto LABEL_80;
        case 17:
          if ((_DWORD)v19 != 4 || !*v83 || !v17)
            goto LABEL_86;
          v22 = __rev16(*((unsigned __int16 *)v18 + 1));
          *v71 = 1;
          v23 = (unsigned int *)v70;
          goto LABEL_48;
        case 18:
          if ((_DWORD)v19 != 2 || !*v84 || !v17)
            goto LABEL_86;
          v28 = v72;
          goto LABEL_80;
        case 19:
          if ((v19 - 24) < 0xFFFFFFEB || !*v85)
            goto LABEL_86;
          v30 = v18[2];
          *v76 = 1;
          *v75 = v30;
          *v74 = v19 - 3;
          memcpy(v73, v18 + 3, (v19 - 3));
          goto LABEL_81;
        default:
          if (debug)
            dbglog("lcp_reqci: rcvd unknown option %d", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, *v18);
          goto LABEL_86;
      }
    }
    else
    {
      if (debug)
        dbglog("lcp_reqci: bad CI length!", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, v48);
      LODWORD(v19) = v11;
      v11 = 0;
LABEL_86:
      if (v18 != v8)
        memcpy(v8, v18, (int)v19);
      v8 += (int)v19;
      v15 = 4;
    }
  }
  if ((_DWORD)v15 == 4)
  {
    v44 = (_DWORD)v8 - (_DWORD)__dst;
    goto LABEL_130;
  }
  if ((_DWORD)v15 != 3)
  {
    v44 = (_DWORD)v16 - (_DWORD)__dst;
LABEL_130:
    *a3 = v44;
    goto LABEL_132;
  }
  v45 = (_DWORD)v58 - &unk_10004A3A1;
  *a3 = v45;
  memcpy(__dst, &unk_10004A3A1, v45);
LABEL_132:
  if (debug)
  {
    v46 = "REJ";
    if ((_DWORD)v15 == 3)
      v46 = "NAK";
    if ((_DWORD)v15 == 2)
      v46 = "ACK";
    dbglog("lcp_reqci: returning CONF%s.", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, (int)v46);
  }
  return v15;
}

void sub_100012DDC(int *a1)
{
  uint64_t v2;
  unsigned __int8 *v3;
  _BYTE *v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *a1;
  if (!lcp_gotoptions[68 * (int)v2 + 8])
    *(_DWORD *)&lcp_gotoptions[68 * (int)v2 + 32] = 0;
  if (!lcp_hisoptions[68 * (int)v2 + 8])
    *(_DWORD *)&lcp_hisoptions[68 * (int)v2 + 32] = 0;
  v3 = &lcp_hisoptions[68 * (int)v2];
  v5 = v3[3];
  v4 = v3 + 3;
  if (v5)
    v6 = *(unsigned int *)&lcp_hisoptions[68 * (int)v2 + 16];
  else
    v6 = 1500;
  if (lcp_gotoptions[68 * (int)v2 + 3])
  {
    v7 = *((_DWORD *)&lcp_wantoptions + 17 * v2 + 4);
    v8 = *(_DWORD *)&lcp_gotoptions[68 * v2 + 16];
    if ((int)v7 <= (int)v8)
      v9 = v8;
    else
      v9 = v7;
  }
  else
  {
    v9 = 1500;
  }
  if ((int)v6 >= (int)v9)
    v10 = v9;
  else
    v10 = v6;
  if (v10 >= *((_DWORD *)&lcp_allowoptions + 17 * v2 + 4))
    v11 = *((_DWORD *)&lcp_allowoptions + 17 * v2 + 4);
  else
    v11 = v10;
  netif_set_mtu(v2, v11);
  if (lcp_hisoptions[68 * v2 + 4])
    v12 = *(unsigned int *)&lcp_hisoptions[68 * (int)v2 + 28];
  else
    v12 = 0xFFFFFFFFLL;
  ppp_send_config(*a1, v6, v12, lcp_hisoptions[68 * (int)v2 + 9], lcp_hisoptions[68 * (int)v2 + 10]);
  if (lax_recv)
  {
    v13 = 0;
  }
  else if (lcp_gotoptions[68 * (int)v2 + 4])
  {
    v13 = *(unsigned int *)&lcp_gotoptions[68 * (int)v2 + 28];
  }
  else
  {
    v13 = 0xFFFFFFFFLL;
  }
  ppp_recv_config(*a1, v9, v13, lcp_gotoptions[68 * (int)v2 + 9], lcp_gotoptions[68 * (int)v2 + 10]);
  if (*v4)
    peer_mru[*a1] = *(_DWORD *)&lcp_hisoptions[68 * (int)v2 + 16];
  notify((uint64_t **)lcp_up_notify, 0);
  sub_100010560(*a1);
  link_established(*a1, v14, v15, v16, v17, v18, v19, v20);
}

uint64_t sub_100012FB8(unsigned int *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = v2;
  if (byte_10004A3A0 == 1)
  {
    untimeout((uint64_t)sub_100010680, (uint64_t)&lcp_fsm + 80 * (int)v2);
    byte_10004A3A0 = 0;
    v2 = *a1;
  }
  link_down(v2);
  notify((uint64_t **)lcp_down_notify, 0);
  v4 = 0xFFFFFFFFLL;
  ppp_send_config(*a1, 1500, 0xFFFFFFFFLL, 0, 0);
  if (lcp_gotoptions[68 * v3 + 4])
    v4 = *(unsigned int *)&lcp_gotoptions[68 * v3 + 28];
  result = ppp_recv_config(*a1, 1500, v4, lcp_gotoptions[68 * v3 + 9], lcp_gotoptions[68 * v3 + 10]);
  peer_mru[*a1] = 1500;
  return result;
}

uint64_t sub_1000130A0(unsigned int *a1)
{
  return link_required(*a1);
}

uint64_t sub_1000130A8(unsigned int *a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char *v9;
  int v10;
  __int16 *v11;
  __int16 **v12;
  __int16 *v13;
  int v15;
  _QWORD v16[3];

  v8 = 0;
  switch((int)a2)
  {
    case 8:
      if ((int)a5 <= 1)
      {
        if (!debug)
          return 1;
        v9 = "lcp_rprotrej: Rcvd short Protocol-Reject packet!";
LABEL_24:
        dbglog(v9, a2, a3, (uint64_t)a4, a5, a6, a7, a8, v15);
        return 1;
      }
      if (a1[2] != 9)
      {
        if (!debug)
          return 1;
        v15 = a1[2];
        v9 = "Protocol-Reject discarded: LCP in state %d";
        goto LABEL_24;
      }
      v10 = __rev16(*a4);
      v11 = protocols;
      if (!protocols)
      {
LABEL_18:
        warning("Protocol-Reject for unsupported protocol 0x%x", a2, a3, (uint64_t)a4, a5, a6, a7, a8, v10);
        return 1;
      }
      v12 = (__int16 **)&off_100043898;
      while ((unsigned __int16)*v11 != v10 || !*((_BYTE *)v11 + 80))
      {
        v13 = *v12++;
        v11 = v13;
        if (!v13)
          goto LABEL_18;
      }
      (*((void (**)(_QWORD))v11 + 3))(*a1);
      return 1;
    case 9:
      if (a1[2] == 9)
      {
        *(_BYTE *)a4 = lcp_gotoptions[68 * *a1 + 35];
        *((_BYTE *)a4 + 1) = *(_WORD *)&lcp_gotoptions[68 * *a1 + 34];
        *((_BYTE *)a4 + 2) = BYTE1(*(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]);
        *((_BYTE *)a4 + 3) = *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32];
        fsm_sdata(a1, 10, a3, (char *)a4, a5, a6, a7, a8, v15);
      }
      return 1;
    case 10:
      if ((int)a5 <= 3)
      {
        dbglog("lcp: received short Echo-Reply, length %d", a2, a3, (uint64_t)a4, a5, a6, a7, a8, a5);
        return 1;
      }
      if (lcp_gotoptions[68 * *a1 + 8] && bswap32(*(_DWORD *)a4) == *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32])
        goto LABEL_28;
      dword_10004A39C = 0;
      ppp_variable_echo_stop((uint64_t)a1, a2, a3, (uint64_t)a4, a5, a6, a7, a8);
      ppp_auxiliary_probe_stop();
      return 1;
    case 11:
      return 1;
    case 13:
      if (a1[2] != 9)
        return 1;
      if ((int)a5 > 7)
      {
        if (lcp_gotoptions[68 * *a1 + 8] && bswap32(*(_DWORD *)a4) == *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32])
        {
LABEL_28:
          warning("appear to have received our own echo-reply!", a2, a3, (uint64_t)a4, a5, a6, a7, a8, v15);
        }
        else
        {
          v16[0] = bswap32(*((_DWORD *)a4 + 1));
          v16[1] = a4 + 4;
          v16[2] = (a5 - 8);
          notify_with_ptr((uint64_t **)lcp_timeremaining_notify, (uint64_t)v16);
        }
      }
      else
      {
        dbglog("lcp: received short Time-remaining, length %d", a2, a3, (uint64_t)a4, a5, a6, a7, a8, a5);
      }
      return 1;
    default:
      return v8;
  }
}

void sub_100013304(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  int v22;

  if (a1[2] == 9)
  {
    info("No response to %d echo-requests", a2, a3, a4, a5, a6, a7, a8, dword_10004A39C);
    notice("Serial link appears to be disconnected.", v9, v10, v11, v12, v13, v14, v15, v22);
    lcp_close(*a1, "Peer not responding", v16, v17, v18, v19, v20, v21);
    *(_DWORD *)status = 15;
  }
}

uint64_t magic_init()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  get_host_seed();
  return getpid();
}

uint64_t magic()
{
  return arc4random() & 0x7FFFFFFF;
}

uint64_t mrand48(void)
{
  return arc4random() & 0x7FFFFFFF;
}

_BYTE *random_bytes(_BYTE *result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  unsigned int v4;

  if (a2 >= 1)
  {
    v2 = result;
    v3 = a2;
    do
    {
      result = (_BYTE *)arc4random();
      v4 = (result >> 24) & 0x7F;
      if (!v4)
        LOBYTE(v4) = 1;
      *v2++ = v4;
      --v3;
    }
    while (v3);
  }
  return result;
}

double drand48(void)
{
  return (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  mode_t v12;
  uid_t v13;
  uint64_t v14;
  __int16 *v15;
  __int16 **v16;
  __int16 *v17;
  uint64_t v18;
  void (*v19)(uint64_t);
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
  __int16 *v51;
  __int16 **v52;
  uint64_t (*v53)(uint64_t);
  __int16 *v54;
  void (*v55)(uint64_t);
  __n128 v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
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
  passwd *v74;
  const char *pw_name;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  pid_t v84;
  _DWORD *v85;
  int v86;
  BOOL v87;
  BOOL v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t);
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  int v118;
  void (*v119)(uint64_t);
  const char **v120;
  unsigned int v121;
  BOOL v122;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  pid_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
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
  uint64_t packet;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  __int16 *v166;
  __int16 **v167;
  int v168;
  void (*v169)(_QWORD, void *, _QWORD);
  unsigned int (*v170)(_QWORD);
  __int16 *v171;
  int v172;
  __int16 *v173;
  int v174;
  uint64_t v175;
  BOOL v176;
  __int16 *v177;
  __int16 **v178;
  void (*v179)(_QWORD);
  __int16 *v180;
  uint64_t v181;
  uint64_t v182;
  BOOL v183;
  __int16 *v184;
  __int16 **v185;
  void (*v186)(_QWORD);
  __int16 *v187;
  uint64_t v188;
  uint64_t v189;
  BOOL v190;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _UNKNOWN **v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t);
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t (*v214)(uint64_t);
  int v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t i;
  int v226;
  uint64_t v227;
  int v228;
  pid_t v229;
  char v230[16];
  int v231;

  v231 = 0;
  openlog("pppd", 9, 120);
  setlogmask(127);
  qword_10004A988 = (uint64_t)pthread_self();
  link_stats_valid = 0;
  new_phase(1);
  script_env = 0;
  if (gethostname(hostname, 0x100uLL) < 0)
  {
    option_error("Couldn't get hostname: %m", v5, v6, v7, v8, v9, v10, v11, v226);
    exit(1);
  }
  byte_100047C07 = 0;
  v12 = umask(0x1FFu);
  umask(v12 | 0x12);
  v13 = getuid();
  v14 = 0;
  uid = v13;
  privileged = v13 == 0;
  if (v13)
  {
    privileged = sys_check_controller();
    v14 = uid;
  }
  v227 = v14;
  slprintf((int)v230, 16, "%d");
  script_setenv("ORIG_UID", v230);
  ngroups = getgroups(16, groups);
  magic_init();
  v15 = protocols;
  if (protocols)
  {
    v16 = (__int16 **)&off_100043898;
    do
    {
      (*((void (**)(_QWORD))v15 + 1))(0);
      v17 = *v16++;
      v15 = v17;
    }
    while (v17);
  }
  tty_init();
  progname = (uint64_t)*argv;
  sys_install_options();
  if (!options_from_file("/etc/ppp/options", privileged == 0, 0, 1)
    || !options_from_user()
    || !parse_args(argc - 1, argv + 1)
    || controlled && !options_from_controller())
  {
    goto LABEL_14;
  }
  v18 = options_from_file("/etc/ppp/postoptions", 0, 0, 1);
  if (!(_DWORD)v18)
    goto LABEL_14;
  devnam_fixed = 1;
  v19 = *(void (**)(uint64_t))(the_channel + 8);
  if (v19)
    v19(v18);
  if (debug)
    setlogmask(255);
  if (geteuid())
  {
    option_error("must be root to run %s, since it is not setuid-root", v20, v21, v22, v23, v24, v25, v26, (int)*argv);
    exit(3);
  }
  if (!ppp_available())
  {
    option_error("%s", v27, v28, v29, v30, v31, v32, v33, (int)no_ppp_msg[0]);
    exit(4);
  }
  v34 = check_options();
  v42 = sys_check_options(v34, v35, v36, v37, v38, v39, v40, v41);
  if (!(_DWORD)v42)
LABEL_14:
    exit(2);
  v50 = auth_check_options(v42, v43, v44, v45, v46, v47, v48, v49);
  v51 = protocols;
  if (protocols)
  {
    v52 = (__int16 **)&off_100043898;
    do
    {
      v53 = (uint64_t (*)(uint64_t))*((_QWORD *)v51 + 14);
      if (v53)
        v50 = v53(v50);
      v54 = *v52++;
      v51 = v54;
    }
    while (v54);
  }
  v55 = *(void (**)(uint64_t))(the_channel + 16);
  if (v55)
    v55(v50);
  if (dump_options | dryrun)
  {
    init_pr_log(0, 6);
    print_options((void (*)(const char *, const char *, ...))pr_log, 0);
    end_pr_log();
    if (dryrun)
      die(0);
  }
  v56.n128_f64[0] = sys_init();
  v57 = system_inited_notify;
  if (system_inited_notify)
  {
    do
    {
      v58 = *(_QWORD *)v57;
      (*(void (**)(_QWORD, _QWORD, __n128))(v57 + 8))(*(_QWORD *)(v57 + 16), 0, v56);
      v57 = v58;
    }
    while (v58);
  }
  v59 = open("/dev/null", 2, v56.n128_f64[0], v227);
  dword_10004A990 = v59;
  if ((v59 & 0x80000000) != 0)
    fatal("Couldn't open %s: %m", v60, v61, v62, v63, v64, v65, v66, (int)"/dev/null");
  if (v59 <= 2)
  {
    do
    {
      v59 = dup(v59);
      if ((v59 & 0x80000000) != 0)
        fatal("Critical shortage of file descriptors: dup failed: %m", v67, v68, v69, v70, v71, v72, v73, v228);
      dword_10004A990 = v59;
    }
    while (v59 < 3);
  }
  if (!(nodetach | updetach))
    detach();
  v74 = getpwuid(uid);
  if (!v74 || (pw_name = v74->pw_name) == 0)
    pw_name = "(unknown)";
  sys_log(5, "pppd %s (Apple version %s) started by %s, uid %d", "2.4.2", "884", pw_name, uid);
  script_setenv("PPPLOGNAME", pw_name);
  if ((_BYTE)devnam)
    script_setenv("DEVICE", (const char *)&devnam);
  v229 = getpid();
  slprintf((int)v230, 16, "%d");
  script_setenv("PPPD_PID", v230);
  if (controlfd != -1)
    add_fd(controlfd);
  v76 = sub_1000149C0();
  byte_10004A994 = 0;
  if (demand)
  {
    dword_10004A998 = open_ppp_loopback();
    set_ifunit(1, v77, v78, v79, v80, v81, v82, v83);
    demand_conf();
    v84 = getpid();
    sub_100014DBC(v84);
  }
  v85 = &unk_100047000;
  if (!holdfirst)
  {
    do_callback = 0;
    goto LABEL_56;
  }
  need_holdoff = 1;
  while (1)
  {
    if (v85[794])
      v76 = holdoff;
    else
      v76 = 0;
    v231 = v76;
    if (holdoff_hook)
    {
      v76 = holdoff_hook();
      v231 = v76;
    }
    if ((int)v76 >= 1)
    {
      new_phase(11);
      timeout((int)sub_100015438);
      got_sigterm = 0;
      got_sighup = 0;
      do
      {
        sub_100014EB0();
        if (kill_link)
          v76 = new_phase(3);
      }
      while (phase == 11);
      if (!persist)
      {
LABEL_284:
        v216 = dword_10004ADB8;
        if (dword_10004ADB8 >= 1)
        {
          do
          {
            if (debug)
            {
              dbglog("Waiting for %d child processes...", v89, v90, v91, v92, v93, v94, v95, v216);
              for (i = qword_10004ADC0; i; i = *(_QWORD *)(i + 32))
                dbglog("  script %s, pid %d", v217, v218, v219, v220, v221, v222, v223, *(_QWORD *)(i + 8));
            }
            if ((sub_100015440(1) & 0x80000000) != 0)
              break;
            v216 = dword_10004ADB8;
          }
          while (dword_10004ADB8 > 0);
        }
        die(*(int *)status);
      }
    }
LABEL_56:
    listen_time = 0;
    v85[794] = 1;
    dword_10004A99C = -1;
    *(_DWORD *)status = 0;
    devstatus = 0;
    ++unsuccess;
    v86 = do_callback;
    doing_callback = do_callback;
    do_callback = 0;
    if (demand)
      v87 = v86 == 0;
    else
      v87 = 0;
    if (v87)
    {
      new_phase(3);
      demand_unblock();
      add_fd(dword_10004A998);
      do
      {
        sub_100014EB0();
        if (kill_link)
          v88 = persist == 0;
        else
          v88 = 0;
      }
      while (!v88 && !get_loop_output());
      remove_fd(dword_10004A998);
      if (kill_link)
        v96 = persist == 0;
      else
        v96 = 0;
      if (v96)
        goto LABEL_284;
      demand_block();
      info("Starting link", v97, v98, v99, v100, v101, v102, v103, v229);
    }
    v104 = (uint64_t (*)(uint64_t))start_link_hook;
    if (!start_link_hook)
      break;
    if (*(_QWORD *)(the_channel + 96))
    {
      v105 = retry_pre_start_link_check;
      if (retry_pre_start_link_check < 0)
      {
        v105 = 0;
        retry_pre_start_link_check = 0;
      }
      v106 = v105 + 2;
      while (1)
      {
        v76 = (*(uint64_t (**)(uint64_t))(the_channel + 96))(v76);
        if (!(_DWORD)v76)
          break;
        if (--v106 < 2)
        {
          v114 = 25;
          goto LABEL_136;
        }
      }
      v104 = (uint64_t (*)(uint64_t))start_link_hook;
    }
    v76 = v104(v76);
    v231 = v76;
    if ((_DWORD)v76)
      break;
    v114 = 5;
LABEL_136:
    *(_DWORD *)status = v114;
LABEL_259:
    sys_statusnotify(v76, v107, v108, v109, v110, v111, v112, v113, v229);
    if (!demand)
    {
      if (byte_10004A9B8 && unlink(&byte_10004A9B8) < 0 && *__error() != 2)
        warning("unable to delete pid file %s: %m", v89, v90, v91, v92, v93, v94, v95, (int)&byte_10004A9B8);
      byte_10004A9B8 = 0;
    }
    if (!persist)
      goto LABEL_284;
    if (maxfail >= 1 && unsuccess >= maxfail)
      goto LABEL_284;
    if (demand)
      demand_discard();
  }
  sys_publish_remoteaddress((const char *)remoteaddress);
  v76 = new_phase(2);
  v115 = connect_started_notify;
  if (connect_started_notify)
  {
    do
    {
      v116 = *(_QWORD *)v115;
      v76 = (*(uint64_t (**)(_QWORD, _QWORD))(v115 + 8))(*(_QWORD *)(v115 + 16), 0);
      v115 = v116;
    }
    while (v116);
  }
  LOBYTE(v117) = 0;
  v118 = 0;
  link_up_done = 0;
  redialingcount = 0;
  redialingalternate = 0;
  while (1)
  {
    if (v118 || (_BYTE)v117)
    {
      v119 = *(void (**)(uint64_t))(the_channel + 72);
      if (v119)
      {
        v119(v76);
        LOBYTE(v117) = redialingalternate;
      }
      if (redialalternate)
      {
        v87 = v117 == 0;
        v120 = (const char **)&remoteaddress;
        if (!v87)
          v120 = (const char **)&altremoteaddress;
        sys_publish_remoteaddress(*v120);
        LOBYTE(v117) = redialingalternate;
      }
    }
    else
    {
      LOBYTE(v117) = 0;
    }
    v121 = redialtimer;
    if (redialtimer)
      v122 = redialingcount == 0;
    else
      v122 = 1;
    if (!v122 && v117 == 0)
    {
      if (hasbusystate)
      {
        new_phase(13);
        v121 = redialtimer;
      }
      sleep(v121);
      if (hasbusystate)
        new_phase(2);
    }
    if (kill_link)
      break;
    v76 = (*(uint64_t (**)(int *))(the_channel + 24))(&v231);
    dword_10004A99C = v76;
    v117 = redialingalternate;
    if (redialalternate)
    {
      v117 = redialingalternate == 0;
      redialingalternate = redialingalternate == 0;
    }
    if (!v117)
      ++redialingcount;
    if (busycode != -1 && v231 == busycode)
    {
      v118 = redialingcount;
      if (redialingcount <= redialcount && kill_link == 0)
        continue;
    }
    goto LABEL_122;
  }
  v76 = dword_10004A99C;
LABEL_122:
  if ((v76 & 0x80000000) != 0)
  {
    v85 = (_DWORD *)&unk_100047000;
    if ((_DWORD)v76 != -2)
    {
      v137 = connect_fail_notify;
      if (connect_fail_notify)
      {
        v138 = v231;
        do
        {
          v139 = *(_QWORD *)v137;
          v76 = (*(uint64_t (**)(_QWORD, uint64_t))(v137 + 8))(*(_QWORD *)(v137 + 16), v138);
          v137 = v139;
        }
        while (v139);
      }
      goto LABEL_255;
    }
    if (dword_10004A9A0)
      sub_100015224(1);
LABEL_249:
    v76 = new_phase(10);
    v207 = disconnect_started_notify;
    v208 = *(int *)status;
    if (disconnect_started_notify)
    {
      do
      {
        v209 = *(_QWORD *)v207;
        v76 = (*(uint64_t (**)(_QWORD, uint64_t))(v207 + 8))(*(_QWORD *)(v207 + 16), v208);
        v207 = v209;
      }
      while (v209);
    }
    v210 = *(uint64_t (**)(uint64_t))(the_channel + 32);
    if (v210)
      v76 = v210(v76);
    v211 = disconnect_done_notify;
    v212 = *(int *)status;
    if (disconnect_done_notify)
    {
      do
      {
        v213 = *(_QWORD *)v211;
        v76 = (*(uint64_t (**)(_QWORD, uint64_t))(v211 + 8))(*(_QWORD *)(v211 + 16), v212);
        v211 = v213;
      }
      while (v213);
    }
LABEL_255:
    if (phase != 10)
      v76 = new_phase(10);
    v214 = *(uint64_t (**)(uint64_t))(the_channel + 72);
    if (v214)
      v76 = v214(v76);
    goto LABEL_259;
  }
  v85 = &unk_100047000;
  if (!link_up_done)
  {
    if (link_up_hook)
    {
      v231 = link_up_hook();
      if (!v231)
      {
        v136 = 5;
LABEL_248:
        *(_DWORD *)status = v136;
        goto LABEL_249;
      }
    }
    link_up_done = 1;
  }
  v126 = connect_success_notify;
  if (connect_success_notify)
  {
    do
    {
      v127 = *(_QWORD *)v126;
      (*(void (**)(_QWORD, _QWORD))(v126 + 8))(*(_QWORD *)(v126 + 16), 0);
      v126 = v127;
    }
    while (v127);
  }
  sys_publish_remoteaddress((const char *)remoteaddress);
  dword_1000438E0 = (*(uint64_t (**)(_QWORD))(the_channel + 40))(dword_10004A99C);
  if ((dword_1000438E0 & 0x80000000) == 0)
  {
    if (demand)
    {
      v135 = ifunit;
    }
    else
    {
      v140 = getpid();
      sub_100014DBC(v140);
      v135 = ifunit;
      if (!demand && (ifunit & 0x80000000) == 0)
      {
        set_ifunit(1, v128, v129, v130, v131, v132, v133, v134);
        v135 = ifunit;
      }
    }
    if (v135 < 0)
      notice("Starting negotiation on %s", v128, v129, v130, v131, v132, v133, v134, (int)&ppp_devnam);
    else
      notice("Connect: %s <--> %s", v128, v129, v130, v131, v132, v133, v134, (int)&ifname);
    gettimeofday(&stru_10004A9A8, 0);
    script_unsetenv("CONNECT_TIME");
    script_unsetenv("BYTES_SENT");
    script_unsetenv("BYTES_RCVD");
    lcp_lowerup(0);
    add_fd(dword_1000438E0);
    lcp_open(0, v141, v142, v143, v144, v145, v146, v147);
    *(_DWORD *)status = 10;
    new_phase(4);
    while (phase)
    {
      sub_100014EB0();
      packet = read_packet(&inpacket_buf);
      if ((packet & 0x80000000) != 0)
        goto LABEL_192;
      v163 = packet;
      if ((_DWORD)packet)
      {
        if (packet <= 3)
        {
          if (debug < 2)
            goto LABEL_192;
          v229 = packet;
          v164 = "received short packet:%.*B";
          goto LABEL_154;
        }
        dump_packet((int)"rcvd", (uint64_t)&inpacket_buf, packet, v158, v159, v160, v161, v162);
        if (snoop_recv_hook)
          snoop_recv_hook(&inpacket_buf, v163);
        v165 = __rev16((unsigned __int16)word_1000486FE);
        if ((_DWORD)v165 != 49185 && dword_1000478C8 != 9)
        {
          if (debug < 2)
            goto LABEL_192;
          v164 = "Discarded non-LCP packet when LCP not open";
LABEL_154:
          dbglog(v164, v156, v157, v158, v159, v160, v161, v162, v229);
          goto LABEL_192;
        }
        if ((_DWORD)v165 == 49703
          || (v165 & 0xFFFFFDFF) == 0xC023
          || (v165 & 0xFFFFFFFB) == 0xC021
          || phase > 5
          || !unexpected_network_packet(0, v165, v157, v158, v159, v160, v161, v162))
        {
          v166 = protocols;
          if (protocols)
          {
            v167 = (__int16 **)&off_100043898;
            do
            {
              v168 = (unsigned __int16)*v166;
              if ((_DWORD)v165 == v168 && *((_BYTE *)v166 + 80))
              {
                (*((void (**)(_QWORD, void *, _QWORD))v166 + 2))(0, &unk_100048700, (v163 - 4));
                goto LABEL_192;
              }
              if ((_DWORD)v165 == (v168 & 0x7FFF) && *((_BYTE *)v166 + 80))
              {
                v169 = (void (*)(_QWORD, void *, _QWORD))*((_QWORD *)v166 + 9);
                if (v169)
                {
                  v169(0, &unk_100048700, (v163 - 4));
                  goto LABEL_192;
                }
                v170 = (unsigned int (*)(_QWORD))*((_QWORD *)v166 + 19);
                if (v170 && v170(0) == 9)
                  goto LABEL_192;
              }
              v171 = *v167++;
              v166 = v171;
            }
            while (v171);
          }
          if (debug)
          {
            v172 = (unsigned __int16)protocol_list;
            if (!protocol_list)
              goto LABEL_190;
            v173 = &word_1000438F8;
            while ((_DWORD)v165 != v172)
            {
              v174 = (unsigned __int16)*v173;
              v173 += 8;
              v172 = v174;
              if (!v174)
                goto LABEL_190;
            }
            v175 = *((_QWORD *)v173 - 1);
            if (v175)
              warning("Unsupported protocol '%s' (0x%x) received", v156, v157, v158, v159, v160, v161, v162, v175);
            else
LABEL_190:
              warning("Unsupported protocol 0x%x received", v156, v157, v158, v159, v160, v161, v162, v165);
          }
          lcp_sprotrej(0, (uint64_t)&inpacket_buf, v163, v158, v159, v160, v161, v162, v229);
        }
        else if (debug >= 2)
        {
          dbglog("discarding proto 0x%x in phase %d", v156, v157, v158, v159, v160, v161, v162, v165);
        }
      }
      else
      {
        notice("Modem hangup", v156, v157, v158, v159, v160, v161, v162, v229);
        hungup = 1;
        if (*(_DWORD *)status != 5)
          *(_DWORD *)status = 16;
        lcp_lowerdown(0);
        link_terminated();
      }
LABEL_192:
      if (stop_link)
        v176 = phase == 8;
      else
        v176 = 0;
      if (v176)
      {
        new_phase(12);
        ppp_hold();
        auth_hold();
        v177 = protocols;
        if (protocols)
        {
          v178 = (__int16 **)&off_100043898;
          do
          {
            v179 = (void (*)(_QWORD))*((_QWORD *)v177 + 17);
            if (v179)
              v179(0);
            v180 = *v178++;
            v177 = v180;
          }
          while (v180);
        }
        v181 = stop_notify;
        if (stop_notify)
        {
          do
          {
            v182 = *(_QWORD *)v181;
            (*(void (**)(_QWORD, _QWORD))(v181 + 8))(*(_QWORD *)(v181 + 16), 0);
            v181 = v182;
          }
          while (v182);
        }
      }
      if (cont_link)
        v183 = phase == 12;
      else
        v183 = 0;
      if (v183)
      {
        new_phase(8);
        ppp_cont();
        auth_cont();
        v184 = protocols;
        if (protocols)
        {
          v185 = (__int16 **)&off_100043898;
          do
          {
            v186 = (void (*)(_QWORD))*((_QWORD *)v184 + 18);
            if (v186)
              v186(0);
            v187 = *v185++;
            v184 = v187;
          }
          while (v187);
        }
        v188 = cont_notify;
        if (cont_notify)
        {
          do
          {
            v189 = *(_QWORD *)v188;
            (*(void (**)(_QWORD, _QWORD))(v188 + 8))(*(_QWORD *)(v188 + 16), 0);
            v188 = v189;
          }
          while (v189);
        }
      }
      if (kill_link)
      {
        if (do_modem_hungup)
          v190 = 0;
        else
          v190 = stop_link == 0;
        if (!v190 || phase == 12)
        {
          if (do_modem_hungup)
          {
            notice("Modem hangup", v156, v157, v158, v159, v160, v161, v162, v229);
            do_modem_hungup = 0;
          }
          hungup = 1;
          lcp_lowerdown(0);
          link_terminated();
        }
        lcp_close(0, "User request", v157, v158, v159, v160, v161, v162);
      }
      if (open_ccp_flag && (phase - 7) <= 1)
      {
        dword_100047604 = 2;
        off_100041DD8(0, v156, v157, v158, v159, v160, v161, v162);
      }
      sys_runloop();
    }
    if (link_stats_valid)
    {
      info("Connect time %d.%d minutes.", v148, v149, v150, v151, v152, v153, v154, (link_connect_time + 5) / 0x3Cu);
      info("Sent %u bytes, received %u bytes.", v192, v193, v194, v195, v196, v197, v198, dword_1000480D8);
    }
    v85 = (_DWORD *)&unk_100047000;
    v199 = &off_100043000;
    if (!demand)
    {
      if (byte_10004A9B8 && unlink(&byte_10004A9B8) < 0 && *__error() != 2)
        warning("unable to delete pid file %s: %m", v200, v201, v202, v203, v204, v205, v206, (int)&byte_10004A9B8);
      byte_10004A9B8 = 0;
      v199 = &off_100043000;
    }
    remove_fd(*((_DWORD *)v199 + 568));
    clean_check();
    (*(void (**)(_QWORD))(the_channel + 48))(dword_10004A99C);
    *((_DWORD *)v199 + 568) = -1;
    if (!hungup)
      lcp_lowerdown(0);
    if (!demand)
      script_unsetenv("IFNAME");
    goto LABEL_249;
  }
  v136 = 1;
  goto LABEL_248;
}

uint64_t reopen_log()
{
  openlog("pppd", 9, 120);
  return setlogmask(127);
}

uint64_t new_phase(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  phase = result;
  if (new_phase_hook)
    result = new_phase_hook(result);
  v2 = phasechange;
  if (phasechange)
  {
    do
    {
      v3 = *(_QWORD *)v2;
      result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 8))(*(_QWORD *)(v2 + 16), v1);
      v2 = v3;
    }
    while (v3);
  }
  return result;
}

void script_setenv(const char *a1, const char *a2)
{
  size_t v4;
  size_t v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  _QWORD *v14;

  v4 = strlen(a1);
  v5 = strlen(a2);
  v6 = v5 + v4;
  v7 = malloc_type_malloc(v5 + v4 + 3, 0x3CBA5F19uLL);
  if (!v7)
    return;
  v8 = v7;
  slprintf((int)v7, v6 + 2, "%s=%s");
  v9 = (_QWORD *)script_env;
  if (script_env)
  {
    v10 = *(char **)script_env;
    if (*(_QWORD *)script_env)
    {
      v11 = 0;
      while (strncmp(v10, a1, v4) || v10[v4] != 61)
      {
        v12 = v11 + 1;
        v10 = (char *)v9[++v11];
        if (!v10)
          goto LABEL_12;
      }
      free(v10);
      *(_QWORD *)(script_env + 8 * v11) = v8;
      return;
    }
    v12 = 0;
  }
  else
  {
    v13 = malloc_type_malloc(0x80uLL, 0x10040436913F5uLL);
    script_env = (uint64_t)v13;
    if (!v13)
      return;
    v9 = v13;
    v12 = 0;
    s_env_nalloc = 16;
  }
LABEL_12:
  if (v12 + 1 >= s_env_nalloc)
  {
    v14 = malloc_type_realloc(v9, 8 * (v12 + 17), 0x10040436913F5uLL);
    if (!v14)
      return;
    v9 = v14;
    script_env = (uint64_t)v14;
    s_env_nalloc = v12 + 17;
  }
  v9[v12] = v8;
  *(_QWORD *)(script_env + 8 * (v12 + 1)) = 0;
}

void die(int a1)
{
  sub_100015BE8();
  notify((uint64_t **)exitnotify, a1);
  sys_log(6, "Exit.");
  exit(a1);
}

uint64_t **notify(uint64_t **result, int a2)
{
  uint64_t v2;
  uint64_t *v3;

  if (result)
  {
    v2 = a2;
    do
    {
      v3 = *result;
      ((void (*)(uint64_t *, uint64_t))result[1])(result[2], v2);
      result = (uint64_t **)v3;
    }
    while (v3);
  }
  return result;
}

void detach()
{
  pid_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  int v12[2];
  char v13[16];

  if (!detached)
  {
    if (pipe(v12) == -1)
      *(_QWORD *)v12 = -1;
    v0 = fork();
    if (v0 < 0)
    {
      error("Couldn't detach (fork failed: %m)", v1, v2, v3, v4, v5, v6, v7, v10);
      die(1);
    }
    if (v0)
    {
      v11 = v0;
      v8 = pidchange;
      if (pidchange)
      {
        do
        {
          v9 = *(_QWORD *)v8;
          (*(void (**)(_QWORD, _QWORD))(v8 + 8))(*(_QWORD *)(v8 + 16), v11);
          v8 = v9;
        }
        while (v9);
      }
      if (byte_10004A9B8)
        sub_100015A84(v11);
      if (byte_10004ADC8)
        sub_100014DBC(v11);
      exit(0);
    }
    setsid();
    chdir("/");
    dup2(dword_10004A990, 0);
    dup2(dword_10004A990, 1);
    dup2(dword_10004A990, 2);
    detached = 1;
    if (log_default)
      log_to_fd = -1;
    getpid();
    slprintf((int)v13, 16, "%d");
    script_setenv("PPPD_PID", v13);
    close(v12[1]);
    complete_read(v12[0], v13, 1uLL);
    close(v12[0]);
    sys_reinit();
  }
}

uint64_t sub_1000149C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  sigaction v9;

  *(_QWORD *)&v9.sa_mask = 1074675715;
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000158FC;
  if (sigaction(1, &v9, 0) < 0)
  {
    v8 = 1;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000159C0;
  if (sigaction(2, &v9, 0) < 0)
  {
    v8 = 2;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000159C0;
  if (sigaction(15, &v9, 0) < 0)
  {
    v8 = 15;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100016670;
  if (sigaction(20, &v9, 0) < 0)
  {
    v8 = 20;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000166D4;
  if (sigaction(18, &v9, 0) < 0)
  {
    v8 = 18;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100016794;
  if (sigaction(19, &v9, 0) < 0)
  {
    v8 = 19;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100016820;
  if (sigaction(30, &v9, 0) < 0)
  {
    v8 = 30;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100016888;
  if (sigaction(31, &v9, 0) < 0)
  {
    v8 = 31;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(6, &v9, 0) < 0)
  {
    v8 = 6;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(14, &v9, 0) < 0)
  {
    v8 = 14;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(8, &v9, 0) < 0)
  {
    v8 = 8;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(4, &v9, 0) < 0)
  {
    v8 = 4;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(13, &v9, 0) < 0)
  {
    v8 = 13;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(3, &v9, 0) < 0)
  {
    v8 = 3;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(11, &v9, 0) < 0)
  {
    v8 = 11;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(10, &v9, 0) < 0)
  {
    v8 = 10;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(7, &v9, 0) < 0)
  {
    v8 = 7;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(27, &v9, 0) < 0)
  {
    v8 = 27;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(12, &v9, 0) < 0)
  {
    v8 = 12;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(5, &v9, 0) < 0)
  {
    v8 = 5;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(26, &v9, 0) < 0)
  {
    v8 = 26;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  if (sigaction(24, &v9, 0) < 0)
  {
    v8 = 24;
    goto LABEL_48;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000168EC;
  result = sigaction(25, &v9, 0);
  if ((result & 0x80000000) != 0)
  {
    v8 = 25;
LABEL_48:
    fatal("Couldn't establish signal handler (%d): %m", v0, v1, v2, v3, v4, v5, v6, v8);
  }
  return result;
}

void set_ifunit(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pid_t v9;
  pid_t v10;

  info("Using interface %s%d", a2, a3, a4, a5, a6, a7, a8, (int)"ppp");
  slprintf((int)&ifname, 32, "%s%d");
  script_setenv("IFNAME", &ifname);
  if (a1)
  {
    v9 = getpid();
    sub_100015A84(v9);
    v10 = getpid();
    sub_100014DBC(v10);
  }
}

void sub_100014DBC(int a1)
{
  FILE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FILE *v10;

  if (linkname)
  {
    script_setenv("LINKNAME", &linkname);
    slprintf((int)&byte_10004ADC8, 1024, "%sppp-%s.pid");
    v2 = fopen(&byte_10004ADC8, "w");
    if (v2)
    {
      v10 = v2;
      fprintf(v2, "%d\n", a1);
      if (ifname)
        fprintf(v10, "%s\n", &ifname);
      fclose(v10);
    }
    else
    {
      error("Failed to create pid file %s: %m", v3, v4, v5, v6, v7, v8, v9, (int)&byte_10004ADC8);
      byte_10004ADC8 = 0;
    }
  }
}

void sub_100014EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  timeval *v10;
  uint64_t v11;
  __n128 v12;
  void (*v13)(uint64_t, __n128);
  uint64_t ready;
  _DWORD *i;
  __n128 v16;
  int v17;
  int v18;
  sigset_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = 0;
  v21 = 0;
  v19 = 0;
  open_ccp_flag = 0;
  kill_link = 0;
  cont_link = 0;
  stop_link = 0;
  if (!sigsetjmp(dword_10004B1E0, 1))
  {
    sigprocmask(1, &v19, 0);
    if (got_sighup || got_sigterm || got_sigusr2 || (byte_10004B2A4 & 1) != 0 || got_sigtstp || got_sigcont)
    {
      sigprocmask(2, &v19, 0);
    }
    else
    {
      byte_10004A994 = 1;
      sigprocmask(2, &v19, 0);
      if (qword_10004B1D8)
      {
        getabsolutetime((uint64_t)&qword_10004B1C8);
        v7 = *(_QWORD *)qword_10004B1D8 - qword_10004B1C8;
        v20 = v7;
        v8 = v7;
        v9 = *(_DWORD *)(qword_10004B1D8 + 8) - dword_10004B1D0;
        LODWORD(v21) = v9;
        if (v9 < 0)
        {
          LODWORD(v21) = v9 + 1000000;
          v20 = v7 - 1;
          v8 = v7 - 1;
        }
        if (v8 < 0)
        {
          LODWORD(v21) = 0;
          v20 = 0;
        }
        v10 = (timeval *)&v20;
      }
      else
      {
        v10 = 0;
      }
      v12.n128_f64[0] = wait_input(v10);
      if (wait_input_hook)
        v11 = wait_input_hook(v12.n128_f64[0]);
      v13 = *(void (**)(uint64_t, __n128))(the_channel + 88);
      if (v13)
        v13(v11, v12);
    }
  }
  if (controlfd != -1)
  {
    ready = is_ready_fd(controlfd);
    if ((_DWORD)ready)
      ppp_control(ready, v0, v1, v2, v3, v4, v5, v6, v18);
  }
  byte_10004A994 = 0;
  for (i = (_DWORD *)qword_10004B1D8; qword_10004B1D8; i = (_DWORD *)qword_10004B1D8)
  {
    v16.n128_f64[0] = getabsolutetime((uint64_t)&qword_10004B1C8);
    if (v17 < 0)
      fatal("Failed to get time of day: %m", v0, v1, v2, v3, v4, v5, v6, v18);
    if (*(_QWORD *)i >= qword_10004B1C8 && (*(_QWORD *)i != qword_10004B1C8 || i[2] > dword_10004B1D0))
      break;
    qword_10004B1D8 = *((_QWORD *)i + 4);
    (*((void (**)(_QWORD, __n128))i + 3))(*((_QWORD *)i + 2), v16);
    free(i);
  }
  if (got_sigtstp)
  {
    info("Stopping on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigtstp);
    stop_link = 1;
    got_sigtstp = 0;
  }
  if (got_sigcont)
  {
    info("Resuming on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigcont);
    cont_link = 1;
    got_sigcont = 0;
  }
  if (got_sighup)
  {
    info("Hangup (SIGHUP)", v0, v1, v2, v3, v4, v5, v6, v18);
    kill_link = 1;
    got_sighup = 0;
    if (*(_DWORD *)status != 16)
      *(_DWORD *)status = 5;
  }
  if (got_sigterm)
  {
    info("Terminating on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigterm);
    kill_link = 1;
    persist = 0;
    *(_DWORD *)status = 5;
    got_sigterm = 0;
  }
  if (byte_10004B2A4 == 1)
  {
    sub_100015440(0);
    byte_10004B2A4 = 0;
  }
  if (got_sigusr2)
  {
    open_ccp_flag = 1;
    got_sigusr2 = 0;
  }
}

uint64_t sub_100015224(int a1)
{
  sigaction v3;
  sigaction v4;

  v3.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v3.sa_mask = 0;
  v4.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(_QWORD *)&v4.sa_mask = 0;
  sigaction(a1, &v4, &v3);
  kill(0, a1);
  return sigaction(a1, &v3, 0);
}

void script_unsetenv(const char *a1)
{
  int v2;
  char *v3;
  uint64_t v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = strlen(a1);
  if (script_env)
  {
    v3 = *(char **)script_env;
    if (*(_QWORD *)script_env)
    {
      v4 = 0;
      v5 = v2;
      v6 = script_env + 8;
      while (strncmp(v3, a1, v5) || v3[v5] != 61)
      {
        v3 = *(char **)(v6 + v4);
        v4 += 8;
        if (!v3)
          return;
      }
      free(v3);
      do
      {
        v7 = *(_QWORD *)(script_env + v4 + 8);
        *(_QWORD *)(script_env + v4) = v7;
        v4 += 8;
      }
      while (v7);
    }
  }
}

void timeout(int a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  v4 = v3;
  v5 = v2;
  v6 = v1;
  v7 = *(_QWORD *)&a1;
  v8 = malloc_type_malloc(0x28uLL, 0x10A004043506912uLL);
  if (!v8)
    fatal("Out of memory in timeout()!", v9, v10, v11, v12, v13, v14, v15, v23);
  v16 = v8;
  v8[2] = v6;
  v8[3] = v7;
  getabsolutetime((uint64_t)&qword_10004B1C8);
  v17 = qword_10004B1C8 + v5;
  *(_QWORD *)v16 = v17;
  v18 = dword_10004B1D0 + v4;
  v16[2] = dword_10004B1D0 + v4;
  if (v18 > 999999)
  {
    v17 += v18 / 0xF4240u;
    *(_QWORD *)v16 = v17;
    v18 %= 0xF4240u;
    v16[2] = v18;
  }
  v19 = &qword_10004B1D8;
  v20 = (uint64_t *)qword_10004B1D8;
  if (qword_10004B1D8)
  {
    v21 = *(_QWORD *)qword_10004B1D8;
    if (v17 >= *(_QWORD *)qword_10004B1D8)
    {
      v22 = qword_10004B1D8;
      while (v17 != v21 || v18 >= *(_DWORD *)(v22 + 8))
      {
        v20 = *(uint64_t **)(v22 + 32);
        v19 = (uint64_t *)(v22 + 32);
        if (v20)
        {
          v21 = *v20;
          v22 = *(_QWORD *)(v22 + 32);
          if (v17 >= *v20)
            continue;
        }
        goto LABEL_13;
      }
      v20 = (uint64_t *)v22;
    }
  }
LABEL_13:
  *((_QWORD *)v16 + 4) = v20;
  *v19 = (uint64_t)v16;
}

uint64_t sub_100015438()
{
  return new_phase(3);
}

uint64_t sub_100015440(int a1)
{
  _BOOL4 v1;
  pid_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD *v12;
  char v13;
  const char *v14;
  const char *v15;
  void (*v16)(_QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  if (!dword_10004ADB8)
    return 0;
  v26 = 0;
  v1 = a1 == 0;
  v2 = waitpid(-1, &v26, v1);
  if ((v2 - 1) <= 0xFFFFFFFD)
  {
    while (1)
    {
      v10 = (_QWORD *)qword_10004ADC0;
      if (!qword_10004ADC0)
        goto LABEL_9;
      v11 = &qword_10004ADC0;
      if (*(_DWORD *)qword_10004ADC0 != v2)
        break;
LABEL_8:
      v13 = 0;
      --dword_10004ADB8;
      *v11 = v10[4];
LABEL_10:
      if ((v26 & 0x7F) != 0 && (v26 & 0x7F) != 0x7F)
      {
        v15 = "??";
        if ((v13 & 1) == 0)
          v15 = (const char *)v10[1];
        warning("Child process %s (pid %d) terminated with signal %d", v3, v4, v5, v6, v7, v8, v9, (int)v15);
        if ((v13 & 1) != 0)
          goto LABEL_24;
      }
      else
      {
        if (debug)
        {
          v14 = "??";
          if ((v13 & 1) == 0)
            v14 = (const char *)v10[1];
          dbglog("Script %s finished (pid %d), status = 0x%x", v3, v4, v5, v6, v7, v8, v9, (int)v14);
        }
        if ((v13 & 1) != 0)
          goto LABEL_24;
      }
      v16 = (void (*)(_QWORD))v10[2];
      if (v16)
        v16(v10[3]);
      free(v10);
LABEL_24:
      v2 = waitpid(-1, &v26, v1);
      if ((v2 - 1) >= 0xFFFFFFFE)
        goto LABEL_25;
    }
    while (1)
    {
      v12 = v10;
      v10 = (_QWORD *)v10[4];
      if (!v10)
        break;
      if (*(_DWORD *)v10 == v2)
      {
        v11 = v12 + 4;
        goto LABEL_8;
      }
    }
LABEL_9:
    v13 = 1;
    goto LABEL_10;
  }
LABEL_25:
  if (v2 != -1)
    return 0;
  if (*__error() != 10)
  {
    if (*__error() != 4)
      error("Error waiting for child process: %m", v18, v19, v20, v21, v22, v23, v24, v25);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void ppp_control(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v33;
  int v34;
  _BYTE v35[1014];

  v9 = fcntl(controlfd, 3);
  if ((_DWORD)v9 == -1 || (v17 = v9, fcntl(controlfd, 4, v9 | 4) == -1))
  {
    warning("Couldn't set controlfd to nonblock: %m", v10, v11, v12, v13, v14, v15, v16, a9);
  }
  else
  {
    v18 = getc((FILE *)controlfile);
    if (v18 == 91)
      ungetc(91, (FILE *)controlfile);
    fcntl(controlfd, 4, v17);
    if (feof((FILE *)controlfile))
      goto LABEL_37;
    clearerr((FILE *)controlfile);
    if (v18 != 91)
      return;
    v34 = 0;
    v19 = getword((FILE *)controlfile, (uint64_t)v35, &v34, (int)"controller");
    if (!(_DWORD)v19)
LABEL_37:
      die(1);
    while (*(_QWORD *)v35 != 0x534E4F4954504F5BLL || *(unsigned __int16 *)&v35[8] != 93)
    {
      if (*(_QWORD *)v35 == 0x4E4E4F435349445BLL && *(_QWORD *)&v35[5] == 0x5D5443454E4E4FLL)
      {
        error("[DISCONNECT]", v20, v21, v22, v23, v24, v25, v26, v33);
        sub_1000158FC(1);
      }
      else if (*(_QWORD *)v35 == 0x414E494D5245545BLL && *(unsigned int *)&v35[8] == 6112596)
      {
        error("[TERMINATE]", v20, v21, v22, v23, v24, v25, v26, v33);
        sub_1000159C0(15);
      }
      else
      {
        if (*(_QWORD *)v35 == 0x4C4C4154534E495BLL && *(unsigned __int16 *)&v35[8] == 93)
        {
          sys_install(v19, v20, v21, v22, v23, v24, v25, v26);
          return;
        }
        if (*(_QWORD *)v35 == 0x4154534E494E555BLL && *(unsigned int *)&v35[8] == 6114380)
        {
          sys_uninstall(v19, v20, v21, v22, v23, v24, v25, v26);
          return;
        }
        if (*(_DWORD *)v35 == 1347372379 && *(unsigned __int16 *)&v35[4] == 93)
          goto LABEL_37;
      }
      v19 = getword((FILE *)controlfile, (uint64_t)v35, &v34, (int)"controller");
      if (!(_DWORD)v19)
        goto LABEL_37;
    }
    options_from_controller();
    if (dump_options)
    {
      init_pr_log(0, 6);
      print_options((void (*)(const char *, const char *, ...))pr_log, 0);
      end_pr_log();
    }
  }
}

uint64_t sub_1000158FC(uint64_t result)
{
  int v1;
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sighup = v1;
    kill_link = 1;
    if (dword_10004A9A0)
      result = sub_100015224(v1);
    v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        v5 = *(_QWORD *)v4;
        result = (*(uint64_t (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v4 + 16), v1);
        v4 = v5;
      }
      while (v5);
    }
    if (!hungup)
      *(_DWORD *)status = 5;
    if (byte_10004A994 == 1)
      siglongjmp(dword_10004B1E0, 1);
  }
  return result;
}

uint64_t sub_1000159C0(uint64_t result)
{
  int v1;
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sigterm = v1;
    kill_link = 1;
    persist = 0;
    *(_DWORD *)status = 5;
    if (dword_10004A9A0)
      result = sub_100015224(v1);
    v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        v5 = *(_QWORD *)v4;
        result = (*(uint64_t (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v4 + 16), v1);
        v4 = v5;
      }
      while (v5);
    }
    if (byte_10004A994 == 1)
      siglongjmp(dword_10004B1E0, 1);
  }
  return result;
}

void sub_100015A84(int a1)
{
  FILE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FILE *v10;

  slprintf((int)&byte_10004A9B8, 1024, "%s%s.pid");
  v2 = fopen(&byte_10004A9B8, "w");
  if (v2)
  {
    v10 = v2;
    fprintf(v2, "%d\n", a1);
    fclose(v10);
  }
  else
  {
    error("Failed to create pid file %s: %m", v3, v4, v5, v6, v7, v8, v9, (int)&byte_10004A9B8);
    byte_10004A9B8 = 0;
  }
}

uint64_t ppp_send_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  int v6;

  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(the_channel + 56);
  if (!v5)
    return 0;
  v6 = error_count;
  v5(a2, a3, a4, a5);
  if (error_count == v6)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t ppp_recv_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  int v6;

  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(the_channel + 64);
  if (!v5)
    return 0;
  v6 = error_count;
  v5(a2, a3, a4, a5);
  if (error_count == v6)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

void sub_100015BE8()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  v0 = sys_cleanup();
  if ((dword_1000438E0 & 0x80000000) == 0)
    v0 = (*(uint64_t (**)(_QWORD))(the_channel + 48))(dword_10004A99C);
  v1 = *(void (**)(uint64_t))(the_channel + 72);
  if (v1)
    v1(v0);
  if (byte_10004A9B8 && unlink(&byte_10004A9B8) < 0 && *__error() != 2)
    warning("unable to delete pid file %s: %m", v2, v3, v4, v5, v6, v7, v8, (int)&byte_10004A9B8);
  byte_10004A9B8 = 0;
  if (byte_10004ADC8 && unlink(&byte_10004ADC8) < 0 && *__error() != 2)
    warning("unable to delete pid file %s: %m", v9, v10, v11, v12, v13, v14, v15, (int)&byte_10004ADC8);
  byte_10004ADC8 = 0;
}

void update_link_stats(uint64_t a1)
{
  timeval v1;
  char v2[32];

  if (get_ppp_stats(a1, &link_stats))
  {
    v1.tv_sec = 0;
    *(_QWORD *)&v1.tv_usec = 0;
    if ((gettimeofday(&v1, 0) & 0x80000000) == 0)
    {
      link_connect_time = LODWORD(v1.tv_sec) - qword_10004A9A8;
      link_stats_valid = 1;
      slprintf((int)v2, 32, "%u");
      script_setenv("CONNECT_TIME", v2);
      slprintf((int)v2, 32, "%u");
      script_setenv("BYTES_SENT", v2);
      slprintf((int)v2, 32, "%u");
      script_setenv("BYTES_RCVD", v2);
    }
  }
}

void untimeout(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;

  v2 = (uint64_t *)qword_10004B1D8;
  if (qword_10004B1D8)
  {
    v3 = &qword_10004B1D8;
    while (v2[3] != a1 || v2[2] != a2)
    {
      v3 = v2 + 4;
      v2 = (uint64_t *)v2[4];
      if (!v2)
        return;
    }
    *v3 = v2[4];
    free(v2);
  }
}

uint64_t safe_fork()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  int v7[2];

  if (pipe(v7) == -1)
    *(_QWORD *)v7 = -1;
  v0 = fork();
  if ((v0 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v1 = v0;
  if ((_DWORD)v0)
  {
    close(v7[1]);
    complete_read(v7[0], &v6, 1uLL);
    v2 = v7[0];
  }
  else
  {
    sys_close();
    options_close();
    v3 = fork_notifier;
    if (fork_notifier)
    {
      do
      {
        v4 = *(_QWORD *)v3;
        (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v3 + 16), 0);
        v3 = v4;
      }
      while (v4);
    }
    close(v7[0]);
    v1 = 0;
    v2 = v7[1];
  }
  close(v2);
  return v1;
}

uint64_t device_script(uint64_t a1, int a2, int a3, int a4, uid_t a5, const void *a6, int a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  unsigned int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  gid_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int __fd[2];

  v59 = -1;
  *(_QWORD *)__fd = -1;
  if (a6 && pipe(__fd) == -1)
  {
    v31 = "Failed to setup pipe with device script: %m";
    goto LABEL_16;
  }
  ++dword_10004A9A0;
  v21 = safe_fork();
  if (v21 < 0)
  {
    --dword_10004A9A0;
    v31 = "Failed to create child process: %m";
LABEL_16:
    error(v31, v14, v15, v16, v17, v18, v19, v20, v58);
    return 0xFFFFFFFFLL;
  }
  v22 = v21;
  if (!v21)
  {
    v32 = a3;
    do
    {
      v33 = dup(a2);
      if ((v33 & 0x80000000) != 0)
        goto LABEL_23;
    }
    while (v33 < 3);
    close(v33);
LABEL_23:
    v34 = log_to_fd;
    v35 = a2;
    v36 = dup(a2);
    v37 = dup(v32);
    if (log_to_fd < 0)
    {
      v58 = 384;
      v38 = open("/etc/ppp/connect-errors", 521);
    }
    else
    {
      v38 = dup(log_to_fd);
    }
    v39 = v38;
    close(v35);
    close(v32);
    close(v34);
    close(0);
    close(1);
    v40 = close(2);
    v41 = *(void (**)(uint64_t))(the_channel + 80);
    if (v41)
      v41(v40);
    closelog();
    close(dword_10004A990);
    if (__fd[1] != -1)
    {
      close(__fd[1]);
      __fd[1] = -1;
    }
    dup2(v36, 0);
    close(v36);
    dup2(v37, 1);
    close(v37);
    if ((v39 & 0x80000000) == 0)
    {
      dup2(v39, 2);
      close(v39);
    }
    v42 = 3;
    if (__fd[0] != -1)
    {
      dup2(__fd[0], 3);
      close(__fd[0]);
      __fd[0] = 3;
      v42 = 4;
    }
    closeallfrom(v42);
    if (a5 == -1)
      a5 = uid;
    setuid(a5);
    if (getuid() == a5)
    {
      v50 = getgid();
      setgid(v50);
      execle("/bin/sh", "sh");
      error("could not exec /bin/sh: %m", v51, v52, v53, v54, v55, v56, v57, (int)"-c");
      exit(99);
    }
    error("setuid failed", v43, v44, v45, v46, v47, v48, v49, v58);
    exit(1);
  }
  if (__fd[0] != -1)
  {
    close(__fd[0]);
    __fd[0] = -1;
  }
  if (__fd[1] != -1)
  {
    write(__fd[1], a6, a7);
    close(__fd[1]);
    __fd[1] = -1;
  }
  if (a4)
  {
    record_child(v22, a1, 0, 0);
    return 0;
  }
  else
  {
    while (waitpid(v22, &v59, 0) < 0)
    {
      if (*__error() != 4)
        fatal("error waiting for (dis)connection process: %m", v24, v25, v26, v27, v28, v29, v30, v58);
    }
    --dword_10004A9A0;
    return BYTE1(v59);
  }
}

void record_child(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  ++dword_10004ADB8;
  v8 = malloc_type_malloc(0x28uLL, 0x10B00401A278E7DuLL);
  if (v8)
  {
    *(_DWORD *)v8 = a1;
    v8[1] = a2;
    v8[2] = a3;
    v16 = qword_10004ADC0;
    v8[3] = a4;
    v8[4] = v16;
    qword_10004ADC0 = (uint64_t)v8;
  }
  else
  {
    warning("losing track of %s process", v9, v10, v11, v12, v13, v14, v15, a2);
  }
}

uint64_t run_program(const char *a1, char *const *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  gid_t v28;
  void (*v29)(void);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  stat v38;

  memset(&v38, 0, sizeof(v38));
  *__error() = 22;
  if (stat(a1, &v38) < 0 || ((v38.st_mode & 0xF000) == 0x8000 ? (v17 = (v38.st_mode & 0x49) == 0) : (v17 = 1), v17))
  {
    if (a3 || *__error() != 2)
      warning("Can't execute %s: %m", v10, v11, v12, v13, v14, v15, v16, (int)a1);
    return 0;
  }
  else
  {
    v20 = safe_fork();
    if ((_DWORD)v20 == -1)
    {
      error("Failed to create child process for %s: %m", v21, v22, v23, v24, v25, v26, v27, (int)a1);
      return 0xFFFFFFFFLL;
    }
    else
    {
      v18 = v20;
      if (!(_DWORD)v20)
      {
        setsid();
        umask(0x3Fu);
        chdir("/");
        setuid(0);
        v28 = getegid();
        setgid(v28);
        closelog();
        v29 = *(void (**)(void))(the_channel + 80);
        if (v29)
          v29();
        dup2(dword_10004A990, 0);
        dup2(dword_10004A990, 1);
        dup2(dword_10004A990, 2);
        close(dword_10004A990);
        closeallfrom(3);
        if (setpriority(0, 0, 0) < 0)
          warning("can't reset priority to 0: %m", v30, v31, v32, v33, v34, v35, v36, v37);
        execve(a1, a2, (char *const *)script_env);
        if (a3 || *__error() != 2)
        {
          reopen_log();
          sys_log(3, "Can't execute %s: %m", a1);
          closelog();
        }
        _exit(-1);
      }
      if (debug)
        dbglog("Script %s started (pid %d)", v21, v22, v23, v24, v25, v26, v27, (int)a1);
      record_child(v18, (uint64_t)a1, a4, a5);
    }
  }
  return v18;
}

_QWORD *add_notifier(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = malloc_type_malloc(0x18uLL, 0xA00402214FCE6uLL);
  if (!result)
    novm((int)"notifier struct", v7, v8, v9, v10, v11, v12, v13);
  *result = *a1;
  result[1] = a2;
  result[2] = a3;
  *a1 = result;
  return result;
}

void novm(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fatal("Virtual memory exhausted allocating %s\n", a2, a3, a4, a5, a6, a7, a8, a1);
}

_QWORD *add_notifier_last(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *i;

  result = malloc_type_malloc(0x18uLL, 0xA00402214FCE6uLL);
  if (!result)
    novm((int)"notifier struct", v7, v8, v9, v10, v11, v12, v13);
  *result = 0;
  result[1] = a2;
  result[2] = a3;
  for (i = *a1; i; i = (_QWORD *)*i)
    a1 = (_QWORD **)i;
  *a1 = result;
  return result;
}

void remove_notifier(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3 = *a1;
  if (*a1)
  {
    while (1)
    {
      v4 = v3;
      if (v3[1] == a2 && v3[2] == a3)
        break;
      v3 = (_QWORD *)*v3;
      a1 = (_QWORD **)v4;
      if (!*v4)
        return;
    }
    *a1 = (_QWORD *)*v3;
    free(v3);
  }
}

uint64_t **notify_with_ptr(uint64_t **result, uint64_t a2)
{
  uint64_t *v3;

  if (result)
  {
    do
    {
      v3 = *result;
      ((void (*)(uint64_t *, uint64_t))result[1])(result[2], a2);
      result = (uint64_t **)v3;
    }
    while (v3);
  }
  return result;
}

void sub_100016670()
{
  _opaque_pthread_t *v0;
  _opaque_pthread_t *v1;

  v0 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v1 = pthread_self(), pthread_equal(v0, v1)))
  {
    byte_10004B2A4 = 1;
    if (byte_10004A994 == 1)
      siglongjmp(dword_10004B1E0, 1);
  }
}

uint64_t sub_1000166D4(uint64_t result)
{
  int v1;
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sigtstp = v1;
    if ((phase | 4) != 0xC)
    {
      got_sighup = 1;
      if (dword_10004A9A0)
        result = sub_100015224(v1);
    }
    v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        v5 = *(_QWORD *)v4;
        result = (*(uint64_t (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v4 + 16), v1);
        v4 = v5;
      }
      while (v5);
    }
    if (byte_10004A994 == 1)
      siglongjmp(dword_10004B1E0, 1);
  }
  return result;
}

uint64_t sub_100016794(uint64_t result)
{
  int v1;
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sigcont = v1;
    v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        v5 = *(_QWORD *)v4;
        result = (*(uint64_t (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v4 + 16), v1);
        v4 = v5;
      }
      while (v5);
    }
    if (byte_10004A994 == 1)
      siglongjmp(dword_10004B1E0, 1);
  }
  return result;
}

uint64_t sub_100016820()
{
  _opaque_pthread_t *v0;
  _opaque_pthread_t *v1;
  uint64_t result;
  BOOL v3;

  v0 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v1 = pthread_self(), result = pthread_equal(v0, v1), (_DWORD)result))
  {
    v3 = debug == 0;
    debug = debug == 0;
    if (v3)
      return setlogmask(255);
    else
      return setlogmask(31);
  }
  return result;
}

void sub_100016888()
{
  _opaque_pthread_t *v0;
  _opaque_pthread_t *v1;

  v0 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v1 = pthread_self(), pthread_equal(v0, v1)))
  {
    got_sigusr2 = 1;
    if (byte_10004A994 == 1)
      siglongjmp(dword_10004B1E0, 1);
  }
}

uint64_t sub_1000168EC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _opaque_pthread_t *v9;
  _opaque_pthread_t *v10;
  uint64_t result;

  v9 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v10 = pthread_self(), result = pthread_equal(v9, v10), (_DWORD)result))
  {
    if (byte_10004B2A8 == 1)
      _exit(127);
    byte_10004B2A8 = 1;
    error("Fatal signal %d", a2, a3, a4, a5, a6, a7, a8, a1);
    if (dword_10004A9A0)
      sub_100015224(15);
    notify((uint64_t **)sigreceived, a1);
    die(127);
  }
  return result;
}

uint64_t sub_10001698C(const char **a1)
{
  size_t v2;
  size_t v3;

  gethostname(hostname, 0x100uLL);
  if (**a1)
  {
    if (**a1 != 46)
    {
      v2 = strlen(hostname);
      strncat(hostname, ".", 255 - v2);
    }
    v3 = strlen(hostname);
    domain = (uint64_t)&hostname[v3];
    strncat(hostname, *a1, 255 - v3);
  }
  byte_100047C07 = 0;
  return 1;
}

uint64_t sub_100016A30(char **a1)
{
  return options_from_file(*a1, 1, 1, privileged_option);
}

uint64_t sub_100016A48(const char **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  const char *v10;
  int v11;
  int v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int v23;

  v8 = *(unsigned __int8 *)*a1;
  if (!**a1 || v8 == 47)
  {
LABEL_3:
    option_error("call option value may not contain .. or start with /", a2, a3, a4, a5, a6, a7, a8, v23);
    return 0;
  }
  v10 = *a1;
  while (v8 == 46)
  {
    if (v10[1] == 46 && (!v10[2] || v10[2] == 47))
      goto LABEL_3;
    do
    {
LABEL_11:
      if (v8 == 47)
        break;
      v11 = *(unsigned __int8 *)++v10;
      v8 = v11;
    }
    while (v11);
    if (v8 == 47)
      ++v10;
    v8 = *(unsigned __int8 *)v10;
  }
  if (v8)
    goto LABEL_11;
  v12 = strlen(*a1) + 16;
  v13 = (char *)malloc_type_malloc(v12, 0xCDC12224uLL);
  if (!v13)
    novm((int)"call file name", v14, v15, v16, v17, v18, v19, v20);
  v21 = v13;
  slprintf((int)v13, v12, "%s%s");
  v22 = options_from_file(v21, 0, 1, 1);
  free(v21);
  return v22;
}

uint64_t sub_100016B5C()
{
  if (phase == 1)
  {
    fprintf(__stderrp, "pppd version %s (Apple version %s)\n", "2.4.2", "884");
    exit(0);
  }
  return 0;
}

uint64_t sub_100016BC0()
{
  if (phase == 1)
  {
    sub_100017358();
    exit(0);
  }
  return 0;
}

uint64_t sub_100016BF4(const char **a1)
{
  uid_t v2;
  int v3;
  int v4;
  char *v5;
  mode_t v6;
  size_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  stat v22;

  if (!privileged_option)
  {
    v2 = getuid();
    seteuid(v2);
  }
  v3 = open(*a1, 2569, 420);
  if (v3 < 0)
  {
    if (*__error() == 17)
    {
      v4 = open(*a1, 9, v21);
      goto LABEL_22;
    }
    if (privileged_option)
    {
      v5 = dirname((char *)*a1);
      sys_log(4, "Warning: Creating directory for log file = %s\n", *a1);
      v6 = umask(0);
      v7 = (int)(strlen(v5) + 1);
      v8 = (char *)malloc_type_malloc(v7, 0x77CB451BuLL);
      if (!v8)
        goto LABEL_21;
      v9 = v8;
      memset(&v22, 0, sizeof(v22));
      strlcpy(v8, v5, v7);
      v10 = *v9 == 47;
      while (1)
      {
        if (v9[v10])
        {
          if (v9[v10] != 47)
          {
            v11 = 0;
            goto LABEL_19;
          }
          v11 = 0;
          v9[v10] = 0;
        }
        else
        {
          v11 = 1;
        }
        if (mkdir(v9, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v9, &v22) < 0))
        {
LABEL_20:
          free(v9);
          umask(v6);
LABEL_21:
          v4 = open(*a1, 2569, 420);
LABEL_22:
          v3 = v4;
          break;
        }
        v9[v10] = 47;
LABEL_19:
        ++v10;
        if (v11)
          goto LABEL_20;
      }
    }
  }
  v12 = *__error();
  if (!privileged_option)
  {
    seteuid(0);
    if ((v3 & 0x80000000) == 0)
      goto LABEL_25;
LABEL_29:
    *__error() = v12;
    option_error("Can't open log file %s: %m", v13, v14, v15, v16, v17, v18, v19, (int)*a1);
    return 1;
  }
  if (v3 < 0)
    goto LABEL_29;
LABEL_25:
  __strlcpy_chk(&unk_10004B2B0, *a1, 1024, 1024);
  if ((dword_100044F20 & 0x80000000) == 0)
    close(dword_100044F20);
  dword_100044F20 = v3;
  log_to_fd = v3;
  log_default = 0;
  return 1;
}

uint64_t sub_100016E2C(_BYTE **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (uint64_t)*a1;
  if (sys_loadplugin(*a1))
    option_error("Couldn't load plugin %s", v2, v3, v4, v5, v6, v7, v8, v1);
  return 1;
}

uint64_t sub_100016E70(_BYTE **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (uint64_t)*a1;
  if (!sys_loadplugin(*a1))
    return 1;
  option_error("Couldn't load plugin %s", v2, v3, v4, v5, v6, v7, v8, v1);
  return 0;
}

uint64_t sub_100016EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  char *v9;
  int v10;

  if (sys_check_controller())
  {
    v7 = dup(0);
    controlfd = v7;
    if (v7 == -1)
    {
      v9 = "Can't duplicate control file descripor: %m";
    }
    else
    {
      controlfile = (uint64_t)fdopen(v7, "r");
      if (controlfile)
      {
        statusfd = dup(1);
        if (statusfd != -1)
        {
          if (log_default)
          {
            log_to_fd = -1;
            log_default = 0;
          }
          result = 1;
          controlled = 1;
          return result;
        }
        v9 = "Can't duplicate status file descripor: %m";
      }
      else
      {
        close(controlfd);
        v9 = "Can't open control file descripor: %m";
      }
    }
  }
  else
  {
    v9 = "Can't verify the controller started the connection";
  }
  option_error(v9, v0, v1, v2, v3, v4, v5, v6, v10);
  if (controlfile)
  {
    fclose((FILE *)controlfile);
    controlfile = 0;
    controlfd = -1;
  }
  if (statusfd == -1)
    return 0;
  close(statusfd);
  result = 0;
  statusfd = -1;
  return result;
}

uint64_t parse_args(int a1, const char **a2)
{
  uint64_t v2;
  int v4;
  const char **v5;
  uint64_t v6;
  const char *v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;

  privileged_option = privileged;
  option_source = (uint64_t)"command line";
  option_priority = 2;
  v2 = 1;
  if (a1 >= 1)
  {
    v4 = a1;
    while (1)
    {
      v7 = *a2;
      v5 = a2 + 1;
      v6 = (uint64_t)v7;
      v8 = sub_100017110(v7);
      if (!v8)
        break;
      v16 = (*((_DWORD *)v8 + 2) | 2) != 2 && ((*((_DWORD *)v8 + 8) >> 9) & 1) == 0;
      if (v4 <= v16)
      {
        option_error("too few parameters for option %s", v9, v10, v11, v12, v13, v14, v15, v6);
        return 0;
      }
      if (!sub_1000173B4((uint64_t)v8, v6, v5, v11, v12, v13, v14, v15))
        return 0;
      a2 = &v5[v16];
      v17 = __OFADD__(v4, ~v16);
      v4 += ~v16;
      if ((v4 < 0) ^ v17 | (v4 == 0))
        return 1;
    }
    option_error("unrecognized option '%s'", v9, v10, v11, v12, v13, v14, v15, v6);
    if (phase == 1)
      fprintf(__stderrp, "pppd version %s\nUsage: %s [ options ], where options are:\n\t<device>\tCommunicate over the named device\n\t<speed>\t\tSet the baud rate to <speed>\n\t<loc>:<rem>\tSet the local and/or remote interface IP\n\t\t\taddresses.  Either one may be omitted.\n\tasyncmap <n>\tSet the desired async map to hex <n>\n\tauth\t\tRequire authentication from peer\n        connect <p>     Invoke shell command <p> to set up the serial line\n\tcrtscts\t\tUse hardware RTS/CTS flow control\n\tdefaultroute\tAdd default route through interface\n\tfile <f>\tTake options from file <f>\n\tmodem\t\tUse modem control lines\n\tmru <n>\t\tSet MRU value to <n> for negotiation\nSee pppd(8) for more options.\n", "2.4.2", (const char *)progname);
    return 0;
  }
  return v2;
}

char **sub_100017110(const char *a1)
{
  int v2;
  char i;
  char v4;
  char **v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int16 *v11;
  uint64_t v12;
  char *v13;

  v2 = 0;
  for (i = 1; ; i = 0)
  {
    v4 = i;
    if (general_options)
      break;
LABEL_6:
    if (auth_options)
    {
      v5 = &auth_options;
      while (!sub_100018AFC(a1, (uint64_t)v5, v2))
      {
        v7 = v5[12];
        v5 += 12;
        if (!v7)
          goto LABEL_10;
      }
      return v5;
    }
LABEL_10:
    v8 = qword_10004B6B0;
    if (qword_10004B6B0)
    {
      while (1)
      {
        v5 = *(char ***)v8;
        if (**(_QWORD **)v8)
          break;
LABEL_14:
        v8 = *(_QWORD *)(v8 + 8);
        if (!v8)
          goto LABEL_15;
      }
      while (!sub_100018AFC(a1, (uint64_t)v5, v2))
      {
        v9 = v5[12];
        v5 += 12;
        if (!v9)
          goto LABEL_14;
      }
      return v5;
    }
LABEL_15:
    v5 = *(char ***)the_channel;
    if (**(_QWORD **)the_channel)
    {
      while (!sub_100018AFC(a1, (uint64_t)v5, v2))
      {
        v10 = v5[12];
        v5 += 12;
        if (!v10)
          goto LABEL_18;
      }
      return v5;
    }
LABEL_18:
    v11 = protocols;
    if (protocols)
    {
      v12 = 0;
      while (1)
      {
        v5 = (char **)*((_QWORD *)v11 + 13);
        if (v5)
        {
          if (*v5)
            break;
        }
LABEL_24:
        v11 = (&protocols)[++v12];
        if (!v11)
          goto LABEL_25;
      }
      while (!sub_100018AFC(a1, (uint64_t)v5, v2))
      {
        v13 = v5[12];
        v5 += 12;
        if (!v13)
          goto LABEL_24;
      }
      return v5;
    }
LABEL_25:
    v2 = 1;
    if ((v4 & 1) == 0)
      return 0;
  }
  v5 = &general_options;
  while (!sub_100018AFC(a1, (uint64_t)v5, v2))
  {
    v6 = v5[12];
    v5 += 12;
    if (!v6)
      goto LABEL_6;
  }
  return v5;
}

void option_error(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9[1024];

  vslprintf(v9, 1024, a1, &a9);
  if (phase == 1)
    fprintf(__stderrp, "%s: %s\n", (const char *)progname, v9);
  sys_log(3, "%s", v9);
}

uint64_t sub_100017358()
{
  uint64_t result;

  if (phase == 1)
    return fprintf(__stderrp, "pppd version %s\nUsage: %s [ options ], where options are:\n\t<device>\tCommunicate over the named device\n\t<speed>\t\tSet the baud rate to <speed>\n\t<loc>:<rem>\tSet the local and/or remote interface IP\n\t\t\taddresses.  Either one may be omitted.\n\tasyncmap <n>\tSet the desired async map to hex <n>\n\tauth\t\tRequire authentication from peer\n        connect <p>     Invoke shell command <p> to set up the serial line\n\tcrtscts\t\tUse hardware RTS/CTS flow control\n\tdefaultroute\tAdd default route through interface\n\tfile <f>\tTake options from file <f>\n\tmodem\t\tUse modem control lines\n\tmru <n>\t\tSet MRU value to <n> for negotiation\nSee pppd(8) for more options.\n", "2.4.2", (const char *)progname);
  return result;
}

uint64_t sub_1000173B4(uint64_t a1, uint64_t a2, const char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t result;
  size_t v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  size_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _BYTE *v25;
  int v26;
  const char *v27;
  int v28;
  int v29;
  signed int v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  signed int *v40;
  signed int v41;
  signed int *v42;
  char *v43;
  BOOL *v44;
  int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t i;
  void (*v62)(void);
  signed int v63;
  int v64;

  v11 = 0;
  v63 = 0;
  current_option = *(_QWORD *)a1;
  v12 = *(_DWORD *)(a1 + 32);
  do
  {
    v13 = *(_DWORD *)(a1 + v11 + 32);
    v11 -= 96;
  }
  while ((v13 & 0x100000) != 0);
  if (((privileged_option != 0) & (v12 >> 25)) != 0)
    v14 = option_priority + 100;
  else
    v14 = option_priority;
  if ((v13 & 0x80000) != 0)
  {
    v15 = *(__int16 *)(a1 + v11 + 160);
    if (v14 < v15)
    {
      result = 1;
      if (v14 == 2 && v15 >= 101)
      {
        option_error("%s%s set in %s cannot be overridden\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
        return 0;
      }
      return result;
    }
    if (v14 >= 101 && v15 == 2)
    {
      warning("%s%s from %s overrides command line", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
      v12 = *(_DWORD *)(a1 + 32);
    }
  }
  if ((v12 & 0x4000000) != 0 && phase != 1)
  {
    option_error("%s%s cannot be changed after initialization", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
    return 0;
  }
  if ((v12 & 0x1000) != 0 && !privileged_option)
  {
    option_error("using the %s%s requires root privilege", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
    return 0;
  }
  if ((v12 & 0x800000) != 0 && !**(_BYTE **)(a1 + 40))
  {
    option_error("%s%s is disabled", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
    return 0;
  }
  if ((v12 & 0x8000000) != 0 && devnam_fixed)
  {
    option_error("the %s%s may not be changed in %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
    return 0;
  }
  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
    case 1:
    case 7:
      result = (*(uint64_t (**)(const char **))(a1 + 16))(a3);
      if ((_DWORD)result)
      {
        if ((*(_BYTE *)(a1 + 34) & 1) != 0)
        {
          v17 = strlen(*a3);
          v18 = (char *)malloc_type_malloc(v17 + 25, 0x2D404562uLL);
          if (v18)
          {
            v19 = v18;
            v20 = v18 + 16;
            v21 = strlen(*a3);
            strlcpy(v20, *a3, v21 + 1);
            v22 = option_source;
            *v19 = 0;
            v19[1] = v22;
            v23 = (_QWORD *)(a1 + 40);
            do
            {
              v24 = v23;
              v23 = (_QWORD *)*v23;
            }
            while (v23);
            *v24 = v19;
          }
        }
        goto LABEL_86;
      }
      return result;
    case 2:
      **(_BYTE **)(a1 + 16) = v12;
      v25 = *(_BYTE **)(a1 + 40);
      if (!v25)
        goto LABEL_86;
      v26 = *(_DWORD *)(a1 + 32);
      if ((v26 & 0x400000) == 0)
      {
        if ((v26 & 0x1000000) != 0)
        {
          *v25 = 0;
          goto LABEL_86;
        }
        if ((v26 & 0x10000) != 0)
        {
          LOBYTE(v12) = *v25 & ~(_BYTE)v12;
        }
        else
        {
          if ((v26 & 0x800) == 0)
            goto LABEL_86;
          LOBYTE(v12) = *v25 | v12;
        }
      }
      *v25 = v12;
      goto LABEL_86;
    case 3:
      if ((v12 & 0x200) != 0)
      {
        v28 = 0;
      }
      else
      {
        v27 = *a3;
        v64 = 0;
        result = sub_10001881C(v27, &v64, 0);
        if (!(_DWORD)result)
          return result;
        v28 = v64;
        v12 = *(_DWORD *)(a1 + 32);
        if (((v12 & 0x4000) != 0 && v64 < *(_DWORD *)(a1 + 52) || (v12 & 0x8000) != 0 && v64 > *(_DWORD *)(a1 + 48))
          && ((v12 & 0x10000) == 0 || v64))
        {
          v29 = *(_DWORD *)(a1 + 32) & 0xC000;
          switch(v29)
          {
            case 49152:
              option_error("%s value must be%s between %d and %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
              break;
            case 32768:
              option_error("%s value must be%s <= %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
              break;
            case 16384:
              option_error("%s value must be%s >= %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
              break;
          }
          return 0;
        }
      }
      if ((v12 & 0x80) != 0)
        v39 = -256;
      else
        v39 = 0;
      v30 = (v39 & 0xFFFFFF00 | v12) + v28;
      if ((v12 & 0x800) != 0)
        v30 += **(_DWORD **)(a1 + 16);
      v40 = *(signed int **)(a1 + 16);
      if ((v12 & 0x20000) != 0 && !privileged_option)
      {
        v41 = *v40;
        if ((v12 & 0x40000) != 0)
        {
          if (!v41)
            goto LABEL_77;
          if (!v30)
            goto LABEL_73;
        }
        if (v30 > v41)
        {
LABEL_73:
          option_error("%s value cannot be increased", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
          return 0;
        }
      }
      goto LABEL_77;
    case 4:
      if ((v12 & 0x200) != 0)
      {
        v30 = ((char)v12 >> 7) & 0xFFFFFF00 | v12;
      }
      else
      {
        result = sub_10001881C(*a3, &v63, 16);
        if (!(_DWORD)result)
          return result;
        v12 = *(_DWORD *)(a1 + 32);
        v30 = v63;
      }
      v40 = *(signed int **)(a1 + 16);
      if ((v12 & 0x400) != 0)
        v30 |= *v40;
LABEL_77:
      *v40 = v30;
      v42 = *(signed int **)(a1 + 40);
      if (v42 && (*(_BYTE *)(a1 + 34) & 0x40) != 0)
        *v42 = v30;
LABEL_86:
      v44 = *(BOOL **)(a1 + 40);
      if (v44)
      {
        v45 = *(_DWORD *)(a1 + 32);
        if ((v45 & 0x30C10800) == 0)
          *v44 = (v45 & 0x1000000) == 0;
      }
      v46 = a1 + v11;
      if (*(_QWORD *)(a1 + v11 + 152))
      {
        v47 = *(void **)(v46 + 176);
        if (v47)
        {
          v48 = a1 + v11;
          v49 = malloc_type_realloc(v47, 8 * *(int *)(a1 + v11 + 184) + 8, 0x10040436913F5uLL);
          if (v49)
          {
            *(_QWORD *)(v46 + 176) = v49;
            v50 = *(int *)(v48 + 184);
            v49[v50] = option_source;
            *(_DWORD *)(v48 + 184) = v50 + 1;
          }
        }
        else
        {
          v51 = malloc_type_malloc(8uLL, 0x10040436913F5uLL);
          *(_QWORD *)(v46 + 176) = v51;
          if (!v51)
            novm((int)"option other source", v52, v53, v54, v55, v56, v57, v58);
          *v51 = option_source;
          *(_DWORD *)(a1 + v11 + 184) = 1;
        }
      }
      else
      {
        *(_QWORD *)(v46 + 152) = option_source;
      }
      v59 = a1 + v11;
      *(_WORD *)(v59 + 160) = v14;
      *(_WORD *)(v59 + 162) = -21845 * ((-96 - v11) >> 5);
      if (*(_DWORD *)(a1 + 8) == 5 && (*(_BYTE *)(a1 + 34) & 1) != 0)
      {
        v60 = strlen(*a3);
        if (v60 >= 1)
        {
          for (i = 0; i != v60; (*a3)[i++] = 42)
            ;
        }
      }
      if (phase != 1)
      {
        v62 = *(void (**)(void))(a1 + 72);
        if (v62)
          v62();
      }
      result = 1;
      break;
    case 5:
      if ((v12 & 0x2000) != 0)
      {
        strlcpy(*(char **)(a1 + 16), *a3, *(int *)(a1 + 48));
        v43 = *(char **)(a1 + 40);
        if (v43 && (*(_BYTE *)(a1 + 34) & 0x40) != 0)
          strlcpy(v43, *a3, *(int *)(a1 + 48));
      }
      else
      {
        v31 = strdup(*a3);
        if (!v31)
          novm((int)"option argument", v32, v33, v34, v35, v36, v37, v38);
        **(_QWORD **)(a1 + 16) = v31;
      }
      goto LABEL_86;
    case 6:
      result = (*(uint64_t (**)(uint64_t, const char **, uint64_t))(a1 + 16))(a2, a3, 1);
      if (!(_DWORD)result)
        return result;
      goto LABEL_86;
    default:
      goto LABEL_86;
  }
  return result;
}

uint64_t options_from_file(char *__filename, int a2, int a3, int a4)
{
  uid_t v8;
  FILE *v9;
  int v10;
  int v11;
  uint64_t v12;
  char *v13;
  const char *v14;
  char *v15;
  char *v16;
  char **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v36;
  char v37[1024];
  _BYTE v38[1024];
  const char *v39;

  if (a3)
  {
    v8 = getuid();
    seteuid(v8);
  }
  v39 = 0;
  v9 = fopen(__filename, "r");
  v10 = *__error();
  if (a3)
    seteuid(0);
  if (v9)
  {
    v11 = privileged_option;
    privileged_option = a4;
    v12 = option_source;
    v13 = strdup(__filename);
    v14 = "file";
    if (v13)
      v14 = v13;
    option_source = (uint64_t)v14;
    v15 = "In file %s: unrecognized option '%s'";
    while (1)
    {
      v16 = v13;
      if (!getword(v9, (uint64_t)v37, &v36, (int)__filename))
      {
        v34 = 1;
        goto LABEL_26;
      }
      v17 = sub_100017110(v37);
      if (!v17)
        break;
      v25 = (uint64_t)v17;
      if ((*((_DWORD *)v17 + 2) | 2) != 2 && (*((_BYTE *)v17 + 33) & 2) == 0)
      {
        if (!getword(v9, (uint64_t)v38, &v36, (int)__filename))
        {
          v15 = "In file %s: too few parameters for option '%s'";
          break;
        }
        v39 = v38;
      }
      v26 = sub_1000173B4(v25, (uint64_t)v37, &v39, v20, v21, v22, v23, v24);
      v13 = 0;
      if (!v26)
        goto LABEL_25;
    }
    option_error(v15, v18, v19, v20, v21, v22, v23, v24, (int)__filename);
LABEL_25:
    v34 = 0;
LABEL_26:
    fclose(v9);
    privileged_option = v11;
    option_source = v12;
    if (v16)
      free(v16);
  }
  else
  {
    *__error() = v10;
    if (a2)
    {
      option_error("Can't open options file %s: %m", v27, v28, v29, v30, v31, v32, v33, (int)__filename);
      return 0;
    }
    else
    {
      v34 = 1;
      if (v10 != 2 && v10 != 20)
        warning("Warning: can't open options file %s: %m", v27, v28, v29, v30, v31, v32, v33, (int)__filename);
    }
  }
  return v34;
}

uint64_t getword(FILE *a1, uint64_t a2, _DWORD *a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  __uint32_t v22;
  unsigned int v23;
  unint64_t v24;
  __uint32_t v26;
  int v27;
  char v28;
  unsigned int v29;
  char v31;
  __darwin_ct_rune_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  LODWORD(v8) = 0;
  v9 = 0;
  *a3 = 0;
  v10 = 1;
  while (1)
  {
LABEL_2:
    v11 = v8;
    v12 = v10;
    v8 = v9;
    do
    {
      v9 = v8;
      v13 = getc(a1);
      if (v13 == -1)
        goto LABEL_19;
      v21 = v13;
      if (v13 == 10)
      {
        LODWORD(v8) = 0;
        v10 = 1;
        if ((v12 & 1) != 0)
        {
          LODWORD(v8) = 0;
          v9 = 0;
          *a3 = 1;
        }
        goto LABEL_2;
      }
      v8 = 1;
    }
    while ((_DWORD)v9);
    if ((v12 & 1) == 0)
      goto LABEL_26;
    v10 = 0;
    v9 = 0;
    if (v13 != 92)
    {
      if (v13 == 35)
      {
        LODWORD(v8) = 0;
        v10 = 1;
        v9 = 1;
        continue;
      }
      v22 = v13 > 0x7F ? __maskrune(v13, 0x4000uLL) : _DefaultRuneLocale.__runetype[v13] & 0x4000;
      LODWORD(v8) = 0;
      v9 = 0;
      v10 = 1;
      if (!v22)
        break;
    }
  }
  if (v21 != 39 && v21 != 34)
  {
LABEL_26:
    v23 = 0;
    goto LABEL_27;
  }
  v23 = v21;
  v21 = getc(a1);
  if (v21 != -1)
  {
LABEL_27:
    v24 = 0;
    while (1)
    {
      while (!v11)
      {
        if (v23)
        {
          if (v21 == v23)
            goto LABEL_22;
        }
        else
        {
          if (v21 > 0x7F)
            v26 = __maskrune(v21, 0x4000uLL);
          else
            v26 = _DefaultRuneLocale.__runetype[v21] & 0x4000;
          if (v21 == 35 || v26)
          {
            ungetc(v21, a1);
            goto LABEL_22;
          }
        }
        if (v21 == 92)
        {
          v11 = 1;
          goto LABEL_41;
        }
        if (v24 <= 0x3FE)
          *(_BYTE *)(a2 + v24) = v21;
LABEL_73:
        v21 = getc(a1);
LABEL_74:
        v11 = 0;
        ++v24;
        if (v21 == -1)
          goto LABEL_20;
      }
      if (v21 != 10)
        break;
      v11 = 0;
LABEL_41:
      v21 = getc(a1);
      if (v21 == -1)
        goto LABEL_20;
    }
    if ((int)v21 > 109)
    {
      switch(v21)
      {
        case 'n':
          v27 = 1;
          v28 = 10;
          break;
        case 'r':
          v27 = 1;
          v28 = 13;
          break;
        case 's':
          v27 = 1;
          v28 = 32;
          break;
        case 't':
          v27 = 1;
          v28 = 9;
          break;
        default:
          goto LABEL_57;
      }
LABEL_70:
      if (v24 <= 0x3FE)
        *(_BYTE *)(a2 + v24) = v28;
      if (!v27)
        goto LABEL_74;
      goto LABEL_73;
    }
    switch(v21)
    {
      case 'a':
        v27 = 1;
        v28 = 7;
        goto LABEL_70;
      case 'b':
        v27 = 1;
        v28 = 8;
        goto LABEL_70;
      case 'f':
        v27 = 1;
        v28 = 12;
        goto LABEL_70;
    }
LABEL_57:
    if ((v21 & 0xFFFFFFF8) == 0x30)
    {
      v29 = 0;
      v28 = 0;
      do
      {
        v28 = v21 & 7 | (8 * v28);
        v21 = getc(a1);
      }
      while ((v21 & 0xFFFFFFF8) == 0x30 && v29++ < 2);
    }
    else
    {
      if (v21 != 120)
      {
        v27 = 1;
        v28 = v21;
        goto LABEL_70;
      }
      v21 = getc(a1);
      if (v21 <= 0xFF)
      {
        v31 = 0;
        v28 = 0;
        while ((_DefaultRuneLocale.__runetype[v21] & 0x10000) != 0)
        {
          v32 = __toupper(v21);
          if (v32 <= 58)
            v33 = -48;
          else
            v33 = -55;
          v28 = v32 + 16 * v28 + v33;
          v21 = getc(a1);
          v27 = 0;
          v34 = (v21 > 0xFF) | v31;
          v31 = 1;
          if ((v34 & 1) != 0)
            goto LABEL_70;
        }
      }
      else
      {
        v28 = 0;
      }
    }
    v27 = 0;
    goto LABEL_70;
  }
LABEL_19:
  LODWORD(v24) = 0;
LABEL_20:
  if (ferror(a1))
  {
    if (!*__error())
      *__error() = 5;
    option_error("Error reading %s: %m", v35, v36, v37, v38, v39, v40, v41, a4);
    die(1);
  }
  if (!(_DWORD)v24)
    return 0;
LABEL_22:
  if ((int)v24 >= 1024)
  {
    option_error("warning: word in file %s too long (%.20s...)", v14, v15, v16, v17, v18, v19, v20, a4);
    LODWORD(v24) = 1023;
  }
  *(_BYTE *)(a2 + (int)v24) = 0;
  return 1;
}

uint64_t options_from_user()
{
  uid_t v0;
  passwd *v1;
  char *pw_dir;
  size_t v3;
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v0 = getuid();
  v1 = getpwuid(v0);
  if (!v1)
    return 1;
  pw_dir = v1->pw_dir;
  if (!pw_dir || !*pw_dir)
    return 1;
  v3 = strlen(v1->pw_dir);
  v4 = v3 + 8;
  v5 = (char *)malloc_type_malloc(v3 + 8, 0x5DE84661uLL);
  if (!v5)
    novm((int)"init file name", v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  slprintf((int)v5, v4, "%s/%s");
  option_priority = 1;
  v14 = options_from_file(v13, 0, 1, privileged);
  free(v13);
  return v14;
}

uint64_t options_for_tty()
{
  char *v0;
  const char *v1;
  size_t v2;
  int v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t i;
  uint64_t v14;

  v0 = strstr((char *)&devnam, "/dev/");
  if (v0)
    v1 = v0 + 5;
  else
    v1 = (const char *)&devnam;
  if (*v1 && strcmp(v1, "tty"))
  {
    v2 = strlen(v1);
    v3 = v2 + 18;
    v4 = (char *)malloc_type_malloc(v2 + 18, 0x70968256uLL);
    if (!v4)
      novm((int)"tty init file name", v5, v6, v7, v8, v9, v10, v11);
    v12 = v4;
    slprintf((int)v4, v3, "%s%s");
    for (i = 17; ; ++i)
    {
      if (v12[i] == 47)
      {
        v12[i] = 46;
      }
      else if (!v12[i])
      {
        option_priority = 1;
        v14 = options_from_file(v12, 0, 0, 1);
        free(v12);
        return v14;
      }
    }
  }
  return 1;
}

uint64_t options_from_list(uint64_t a1, int a2)
{
  uint64_t v2;
  char *v3;
  char **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t result;
  const char *v14;

  privileged_option = a2;
  option_source = (uint64_t)"secrets file";
  option_priority = 3;
  if (!a1)
    return 1;
  v2 = a1;
  v14 = 0;
  v3 = "In secrets file: unrecognized option '%s'";
  while (1)
  {
    v4 = sub_100017110(*(const char **)(v2 + 8));
    if (!v4)
      break;
    v12 = (uint64_t *)v2;
    if ((*((_DWORD *)v4 + 2) | 2) != 2)
    {
      v12 = (uint64_t *)v2;
      if ((*((_BYTE *)v4 + 33) & 2) == 0)
      {
        v12 = *(uint64_t **)v2;
        if (!*(_QWORD *)v2)
        {
          v3 = "In secrets file: too few parameters for option '%s'";
          break;
        }
        v14 = (const char *)v12[1];
      }
    }
    result = sub_1000173B4((uint64_t)v4, *(_QWORD *)(v2 + 8), &v14, v7, v8, v9, v10, v11);
    if (!(_DWORD)result)
      return result;
    v2 = *v12;
    if (!*v12)
      return 1;
  }
  option_error(v3, v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(v2 + 8));
  return 0;
}

char **override_value(const char *a1, int a2, uint64_t a3)
{
  char **result;
  _WORD *v6;
  int v7;

  result = sub_100017110(a1);
  if (result)
  {
    v6 = (_WORD *)result + 81;
    do
    {
      v7 = *(_DWORD *)(v6 - 65);
      v6 -= 48;
    }
    while ((v7 & 0x100000) != 0);
    if ((v7 & 0x80000) != 0 && (__int16)*(v6 - 1) > a2)
    {
      return 0;
    }
    else
    {
      *(v6 - 1) = a2;
      *(_QWORD *)(v6 - 5) = a3;
      *v6 = -1;
      return (char **)1;
    }
  }
  return result;
}

_QWORD *add_options(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
  if (!result)
    novm((int)"option list entry", v3, v4, v5, v6, v7, v8, v9);
  v10 = qword_10004B6B0;
  *result = a1;
  result[1] = v10;
  qword_10004B6B0 = (uint64_t)result;
  return result;
}

uint64_t check_options()
{
  uint64_t result;

  result = dword_100044F20;
  if ((dword_100044F20 & 0x80000000) == 0 && dword_100044F20 != log_to_fd)
    return close(dword_100044F20);
  return result;
}

int *print_options(void (*a1)(const char *, const char *, ...), const char *a2)
{
  uint64_t i;
  int *result;
  __int16 *v6;
  __int16 **v7;
  __int16 *v8;

  a1(a2, "pppd options in effect:\n");
  sub_10001845C((int *)&general_options, a1, a2);
  sub_10001845C((int *)&auth_options, a1, a2);
  for (i = qword_10004B6B0; i; i = *(_QWORD *)(i + 8))
    sub_10001845C(*(int **)i, a1, a2);
  result = sub_10001845C(*(int **)the_channel, a1, a2);
  v6 = protocols;
  if (protocols)
  {
    v7 = (__int16 **)&off_100043898;
    do
    {
      result = sub_10001845C(*((int **)v6 + 13), a1, a2);
      v8 = *v7++;
      v6 = v8;
    }
    while (v8);
  }
  return result;
}

int *sub_10001845C(int *result, void (*a2)(const char *, const char *, ...), const char *a3)
{
  int *v5;
  uint64_t v6;
  const char **v7;
  int v8;
  int *v9;
  const char *v10;
  _DWORD *v11;
  unsigned int v12;
  const char *v13;
  const char *v14;
  _BYTE *v15;
  const char *v16;
  int v17;
  int v18;
  const char *v19;
  uint64_t v20;
  char v21;
  uint64_t **i;
  const char *v23;

  if (*(_QWORD *)result)
  {
    v5 = result;
    do
    {
      if (*((_WORD *)v5 + 32))
      {
        v6 = *((__int16 *)v5 + 33);
        if (v6 != -1)
        {
          v7 = (const char **)&v5[24 * *((__int16 *)v5 + 33)];
          v8 = *((_DWORD *)v7 + 8);
          if ((v8 & 0x40000000) == 0)
          {
            v9 = &v5[24 * *((__int16 *)v5 + 33)];
            v12 = v9[2];
            v11 = v9 + 2;
            v10 = (const char *)v12;
            switch(v12)
            {
              case 0u:
              case 1u:
              case 7u:
                a2(a3, "%s", *v7);
                if ((*v11 | 2) != 2 && (*((_BYTE *)v7 + 33) & 2) == 0)
                {
                  a2(a3, " ");
                  v8 = *((_DWORD *)v7 + 8);
                  goto LABEL_10;
                }
                goto LABEL_41;
              case 2u:
                if (**(unsigned __int8 **)&v5[24 * *((__int16 *)v5 + 33) + 4] == v8
                  || (v8 & 0x800) != 0
                  && (v15 = *(_BYTE **)&v5[24 * *((__int16 *)v5 + 33) + 10]) != 0
                  && (v8 & *v15) != 0)
                {
                  v13 = a3;
                  v14 = "%s";
                  goto LABEL_40;
                }
                goto LABEL_41;
              case 3u:
                if ((v8 & 0x80) != 0)
                  v17 = -256;
                else
                  v17 = 0;
                v18 = **(_DWORD **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                if ((v8 & 0x200) == 0)
                {
                  v23 = (const char *)**(unsigned int **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                  v13 = a3;
                  v14 = "%s %d";
                  goto LABEL_40;
                }
                v19 = (const char *)(v17 & 0xFFFFFF00 | *((_DWORD *)v7 + 8));
                a2(a3, "%s", *v7);
                if (v18 != (_DWORD)v19)
                {
                  if ((*((_BYTE *)v7 + 33) & 8) == 0)
                  {
                    v23 = v19;
                    v13 = a3;
                    v14 = " # oops: %d not %d\n";
                    goto LABEL_40;
                  }
                  while (v18 > (int)v19)
                  {
                    a2(a3, " %s", *v7);
                    v18 -= (int)v19;
                  }
                }
                goto LABEL_41;
              case 4u:
                a2(a3, "%s", *v7);
                if ((*((_BYTE *)v7 + 33) & 2) == 0)
                {
                  v13 = a3;
                  v14 = " %x";
                  goto LABEL_40;
                }
                goto LABEL_41;
              case 5u:
                v16 = "??????";
                if ((v8 & 0x10000) == 0)
                {
                  v16 = *(const char **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                  if ((v8 & 0x2000) == 0)
                    v16 = *(const char **)v16;
                }
                v23 = v16;
                v13 = a3;
                v14 = "%s %q";
                goto LABEL_40;
              case 6u:
LABEL_10:
                if ((v8 & 0x10000000) != 0)
                {
                  (*(void (**)(int *, void (*)(const char *, const char *, ...), const char *))&v5[24 * (int)v6 + 10])(&v5[24 * (int)v6], a2, a3);
                  goto LABEL_41;
                }
                if ((v8 & 0x20000000) != 0)
                {
                  v14 = *(const char **)&v5[24 * (int)v6 + 10];
                  if ((v8 & 0x2000) == 0)
                    v14 = *(const char **)v14;
                  v13 = "%q";
                  goto LABEL_40;
                }
                if ((v8 & 0x10000) == 0)
                {
                  v13 = a3;
                  v14 = "xxx # [don't know how to print value]";
LABEL_40:
                  a2(v13, v14);
                  goto LABEL_41;
                }
                for (i = *(uint64_t ***)&v5[24 * (int)v6 + 10]; ; a2(a3, "\t\t# (from %s)\n%s ", (const char *)i[1], *v7))
                {
                  a2(a3, "%q", i + 2, v23);
                  i = (uint64_t **)*i;
                  if (!i)
                    break;
                }
LABEL_41:
                a2(a3, "\t\t# (from %s", *((const char **)v5 + 7));
                if (v5[22] >= 1)
                {
                  v20 = 0;
                  do
                    a2(a3, ", %s", *(const char **)(*((_QWORD *)v5 + 10) + 8 * v20++));
                  while (v20 < v5[22]);
                }
                result = (int *)((uint64_t (*)(const char *, const char *))a2)(a3, ")\n");
                break;
              default:
                v23 = v10;
                v13 = a3;
                v14 = "# %s value (type %d??)";
                goto LABEL_40;
            }
          }
        }
      }
      do
      {
        v21 = *((_BYTE *)v5 + 130);
        v5 += 24;
      }
      while ((v21 & 0x10) != 0);
    }
    while (*(_QWORD *)v5);
  }
  return result;
}

uint64_t int_option(const char *a1, _DWORD *a2)
{
  uint64_t result;
  int v4;

  v4 = 0;
  result = sub_10001881C(a1, &v4, 0);
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t sub_10001881C(const char *a1, _DWORD *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *__endptr;

  __endptr = 0;
  *a2 = strtoul(a1, &__endptr, a3);
  if (__endptr != a1)
    return 1;
  option_error("invalid numeric parameter '%s' for %s option", v4, v5, v6, v7, v8, v9, v10, (int)a1);
  return 0;
}

uint64_t options_from_controller()
{
  void *v0;
  int v1;
  char **v4;
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
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  uint64_t v23;
  int v25;
  _DWORD size[3];
  __int16 v27;
  _BYTE v28[1024];
  const char *v29;
  void *v30;

  v0 = 0;
  v25 = 0;
  v29 = 0;
  v30 = 0;
  v1 = privileged_option;
  privileged_option = controlled;
  option_source = (uint64_t)"controller";
  option_priority = 2;
  while (1)
  {
    do
    {
      if (!getword((FILE *)controlfile, (uint64_t)&size[1], &v25, (int)"controller"))
      {
LABEL_22:
        v23 = 1;
        if (!v0)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    while (*(_QWORD *)&size[1] == 0x534E4F4954504F5BLL && v27 == 93);
    if (size[1] == 1347372379 && LOWORD(size[2]) == 93)
      goto LABEL_22;
    v4 = sub_100017110((const char *)&size[1]);
    if (!v4)
    {
      option_error("In controller file descriptor: unrecognized option '%s'", v5, v6, v7, v8, v9, v10, v11, (int)&size[1]);
      goto LABEL_26;
    }
    v12 = (uint64_t)v4;
    v29 = 0;
    v30 = 0;
    bzero(v28, 0x400uLL);
    v18 = *(_DWORD *)(v12 + 8);
    if ((v18 | 2) != 2)
      break;
LABEL_13:
    if (!sub_1000173B4(v12, (uint64_t)&size[1], &v29, v13, v14, v15, v16, v17))
      goto LABEL_26;
  }
  if ((*(_BYTE *)(v12 + 33) & 2) != 0)
  {
    v21 = 0;
LABEL_19:
    if (v18 == 7)
    {
      size[0] = 0;
      if (!sub_10001881C(v21, size, 0))
        goto LABEL_26;
      v22 = size[0];
      v0 = malloc_type_malloc(size[0], 0xE8E030C8uLL);
      fread(v0, v22, 1uLL, (FILE *)controlfile);
      v30 = v0;
    }
    goto LABEL_13;
  }
  if (getword((FILE *)controlfile, (uint64_t)v28, &v25, (int)"controller"))
  {
    v21 = v28;
    v29 = v28;
    v18 = *(_DWORD *)(v12 + 8);
    goto LABEL_19;
  }
  option_error("In controller file descriptor: too few parameters for option '%s'", v19, v20, v13, v14, v15, v16, v17, (int)&size[1]);
LABEL_26:
  v23 = 0;
  if (v0)
LABEL_23:
    free(v0);
LABEL_24:
  privileged_option = v1;
  return v23;
}

uint64_t options_close()
{
  uint64_t result;

  if (controlfile)
  {
    fclose((FILE *)controlfile);
    controlfile = 0;
    controlfd = -1;
  }
  result = statusfd;
  if (statusfd != -1)
  {
    result = close(statusfd);
    statusfd = -1;
  }
  controlled = 0;
  return result;
}

uint64_t sub_100018AFC(const char *a1, uint64_t a2, int a3)
{
  if ((*(_DWORD *)(a2 + 8) == 6) != a3)
    return 0;
  if (a3)
    return (*(uint64_t (**)(const char *, _QWORD, _QWORD))(a2 + 16))(a1, 0, 0);
  return strcmp(a1, *(const char **)a2) == 0;
}

uint64_t closeall()
{
  int v0;
  unsigned int v1;

  v0 = getdtablesize();
  if (v0 >= 1)
  {
    v1 = v0 + 1;
    do
    {
      close(v1 - 2);
      --v1;
    }
    while (v1 > 1);
  }
  open("/dev/null", 2, 0);
  dup(0);
  return dup(0);
}

uint64_t closeallfrom(int a1)
{
  DIR *v2;
  DIR *v3;
  int v4;
  uint64_t result;
  dirent *v6;
  dirent v7;

  v2 = opendir("/dev/fd");
  if (v2)
  {
    v3 = v2;
    memset(&v7, 0, 512);
    v6 = 0;
    while (!readdir_r(v3, &v7, &v6) && v6)
    {
      v4 = atoi(v6->d_name);
      if (v4 >= a1 && v4 != v3->__dd_fd)
        close(v4);
    }
    return closedir(v3);
  }
  else
  {
    for (result = getdtablesize(); a1 < (int)result; result = getdtablesize())
      close(a1++);
  }
  return result;
}

uint64_t load_kext(uint64_t a1, int a2)
{
  pid_t v4;
  pid_t v5;
  uint64_t v6;

  v4 = fork();
  if (v4 < 0)
    return 1;
  v5 = v4;
  if (!v4)
  {
    closeall();
    if (a2)
      execle("/sbin/kextload", "kextload", "-b", a1, 0, 0);
    else
      execle("/sbin/kextload", "kextload", a1, 0, 0);
    exit(1);
  }
  v6 = 1;
  while (waitpid(v5, 0, 0) < 0)
  {
    if (*__error() != 4)
      return v6;
  }
  return 0;
}

void sys_install(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int vars0;

  if (qword_10004B978 != -1)
    dispatch_once(&qword_10004B978, &stru_10003CB48);
  if (byte_10004B975)
  {
    notice("Committed PPP store on install command\n", a2, a3, a4, a5, a6, a7, a8, vars0);
    SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0, 0);
  }
}

void sys_uninstall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex Count;
  CFIndex v9;
  const void **v10;
  const void **v11;
  const __CFArray *v12;
  int v13;

  if (qword_10004B978 != -1)
    dispatch_once(&qword_10004B978, &stru_10003CB48);
  if (byte_10004B975)
  {
    notice("Received uninstall command\n", a2, a3, a4, a5, a6, a7, a8, v13);
    if (publish_dict)
    {
      Count = CFDictionaryGetCount((CFDictionaryRef)publish_dict);
      if (Count >= 1)
      {
        v9 = Count;
        v10 = (const void **)CFAllocatorAllocate(kCFAllocatorDefault, 8 * Count, 0);
        if (v10)
        {
          v11 = v10;
          CFDictionaryGetKeysAndValues((CFDictionaryRef)publish_dict, v10, 0);
          v12 = CFArrayCreate(kCFAllocatorDefault, v11, v9, &kCFTypeArrayCallBacks);
          SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, 0, v12, 0);
          if (v12)
            CFRelease(v12);
          CFAllocatorDeallocate(kCFAllocatorDefault, v11);
        }
      }
    }
  }
}

_QWORD *sys_install_options()
{
  return add_options((uint64_t)&sys_options);
}

BOOL sys_check_controller()
{
  _BOOL8 result;
  kern_return_t v1;
  audit_token_t atoken;
  uid_t euidp;
  audit_token_t v4;
  mach_port_t sp[2];

  if (qword_10004B978 != -1)
    dispatch_once(&qword_10004B978, &stru_10003CB48);
  if (byte_10004B975)
  {
    sys_log(5, "NetworkExtension is the controller");
    return 1;
  }
  else
  {
    *(_QWORD *)sp = 0;
    memset(&v4, 0, sizeof(v4));
    euidp = 0;
    v1 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
    result = 0;
    if (!v1)
    {
      if (sub_1000312A4(sp[1], sp, &v4))
      {
        return 0;
      }
      else
      {
        atoken = v4;
        audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
        return (sp[0] | euidp) == 0;
      }
    }
  }
  return result;
}

void sys_log(int a1, char *a2, ...)
{
  char v4;
  char v5;
  os_log_type_t v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  CFStringRef v10;
  CFStringRef v11;
  NSObject *v12;
  uint8_t buf[24];
  va_list va;

  va_start(va, a2);
  if (qword_10004B978 != -1)
    dispatch_once(&qword_10004B978, &stru_10003CB48);
  if (byte_10004B975)
  {
    if (a1 == 6)
      v4 = 1;
    else
      v4 = 2;
    if (a1 < 6)
      v4 = 0;
    if (a1 == 3)
      v5 = 16;
    else
      v5 = v4;
    if (a1 >= 3)
      v6 = v5;
    else
      v6 = OS_LOG_TYPE_FAULT;
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, v6))
    {
      v8 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (v8)
      {
        v9 = v8;
        v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v8, va);
        if (v10)
        {
          v11 = v10;
          v12 = ne_log_obj();
          if (os_log_type_enabled(v12, v6))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, v6, "%@", buf, 0xCu);
          }
          CFRelease(v11);
        }
        CFRelease(v9);
      }
    }
  }
  else
  {
    vsyslog(a1, a2, va);
  }
}

const __CFData *Unserialize(UInt8 *bytes, CFIndex length)
{
  const __CFData *result;
  const __CFData *v3;
  CFPropertyListRef v4;

  result = CFDataCreate(0, bytes, length);
  if (result)
  {
    v3 = result;
    v4 = CFPropertyListCreateFromXMLData(0, result, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

void CopyControllerData()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int tidp;
  audit_token_t atoken;
  uid_t euidp;
  audit_token_t v13;
  int v14;
  unsigned int v15;
  UInt8 *v16;
  mach_port_t sp;

  sp = 0;
  v16 = 0;
  v14 = 1001;
  v15 = 0;
  memset(&v13, 0, sizeof(v13));
  euidp = 0;
  if (!bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp))
  {
    v0 = sub_100031070(sp, 0, &v16, &v15, &v14, &v13);
    if (v0 | v14)
    {
      v8 = "cannot get private system options from controller\n";
    }
    else
    {
      atoken = v13;
      audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
      if (euidp)
      {
        v8 = "cannot authenticate private system options from controller\n";
      }
      else
      {
        systemOptions = (uint64_t)Unserialize(v16, v15);
        v9 = sub_100031070(sp, 1, &v16, &v15, &v14, &v13);
        if (v9 | v14)
        {
          v8 = "cannot get private user options from controller\n";
        }
        else
        {
          atoken = v13;
          audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
          if (!euidp)
          {
            userOptions = (uint64_t)Unserialize(v16, v15);
            return;
          }
          v8 = "cannot authenticate private user options from controller\n";
        }
      }
    }
    error(v8, v1, v2, v3, v4, v5, v6, v7, tidp);
  }
}

void CopyServerData()
{
  const __SCPreferences *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __SCPreferences *v8;
  const __CFDictionary *Value;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeID v25;
  int v26;

  v0 = SCPreferencesCreate(0, CFSTR("pppd"), CFSTR("com.apple.RemoteAccessServers.plist"));
  if (!v0)
    fatal("Cannot open servers plist\n", v1, v2, v3, v4, v5, v6, v7, v26);
  v8 = v0;
  Value = (const __CFDictionary *)SCPreferencesGetValue(v0, CFSTR("Servers"));
  if (!Value)
    fatal("No servers found in servers plist\n", v10, v11, v12, v13, v14, v15, v16, v26);
  v17 = CFDictionaryGetValue(Value, (const void *)serveridRef);
  systemOptions = (uint64_t)v17;
  if (!v17 || (v25 = CFGetTypeID(v17), v25 != CFDictionaryGetTypeID()))
    fatal("Server ID '%s' not found in servers plist\n", v18, v19, v20, v21, v22, v23, v24, serverid);
  CFRetain((CFTypeRef)systemOptions);
  CFRelease(v8);
}

BOOL sys_protocolsreadynotify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int vars0;

  byte_10004B6B8 = 1;
  dbglog("Received protocol dictionaries\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return sub_100019450(v8, v9, v10, v11, v12, v13, v14, v15);
}

BOOL sub_100019450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *NetworkServiceEntity;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v25;

  if (demand)
    return 0;
  if (phase != 8 || byte_10004B6B8 == 0)
    return 0;
  if (acsp_use_dhcp | byte_100046F00 && byte_10004B6B9 == 0)
    return 0;
  if (!publish_dict)
    return 1;
  if (qword_10004B978 != -1)
    dispatch_once(&qword_10004B978, &stru_10003CB48);
  if (byte_10004B975)
  {
    if (cfgCache)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        v11 = Mutable;
        v25 = &ifname;
        v12 = CFStringCreateWithFormat(0, 0, CFSTR("%s"));
        if (v12)
        {
          v13 = v12;
          CFDictionarySetValue(v11, kSCPropInterfaceName, v12);
          CFRelease(v13);
        }
        NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv4);
        if (NetworkServiceEntity)
        {
          v15 = NetworkServiceEntity;
          if (!SCDynamicStoreSetValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity, v11))
          {
            v16 = SCError();
            SCErrorString(v16);
            warning("SCDynamicStoreSetValue Ifname %s failed: %s\n", v17, v18, v19, v20, v21, v22, v23, (int)&ifname);
          }
          CFRelease(v15);
        }
        CFRelease(v11);
      }
    }
    sys_notify(266, 22, byte_10004B858, a4, a5, a6, a7, a8, (int)v25);
    return 1;
  }
  notice("Committed PPP store\n", a2, a3, a4, a5, a6, a7, a8, (int)v25);
  return SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0, 0) != 0;
}

BOOL sys_acspdhcpreadynotify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int vars0;

  byte_10004B6B9 = 1;
  dbglog("Received acsp/dhcp dictionaries\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return sub_100019450(v8, v9, v10, v11, v12, v13, v14, v15);
}

double sys_init()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFUUID *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  dispatch_queue_global_t global_queue;
  void *v22;
  void *v23;
  pid_t v24;
  CFMutableDictionaryRef Mutable;
  __CFRunLoop *Current;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  double result;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  mach_timebase_info info;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  char buffer[8];
  uint64_t v87;
  intptr_t (*v88)(uint64_t, xpc_object_t);
  void *v89;
  uint64_t *v90;
  NSObject *v91;

  openlog("pppd", 9, 120);
  setlogmask(127);
  if (debug)
    setlogmask(255);
  setsid();
  v0 = sub_100019E20();
  ppp_sockfd = v0;
  if (v0 < 0)
    fatal("Couldn't open PF_PPP: %m", v1, v2, v3, v4, v5, v6, v7, v80);
  v8 = fcntl(v0, 3);
  if (v8 == -1 || (v80 = v8 | 4, fcntl(ppp_sockfd, 4) == -1))
    warning("Couldn't set PF_PPP to nonblock: %m", v9, v10, v11, v12, v13, v14, v15, v80);
  info = 0;
  dword_10004B6BC = socket(2, 2, 0);
  if (dword_10004B6BC < 0)
  {
    v39 = __error();
    fatal("Couldn't create IP socket: %m(%d)", v40, v41, v42, v43, v44, v45, v46, *v39);
  }
  v16 = serviceid;
  if (!serviceid)
  {
    v17 = CFUUIDCreate(0);
    v18 = CFUUIDCreateString(0, v17);
    CFStringGetCString(v18, buffer, 100, 0x8000100u);
    serviceid = (uint64_t)strdup(buffer);
    if (!serviceid)
    {
      v72 = __error();
      fatal("Couldn't allocate memory to create temporary service id: %m(%d)", v73, v74, v75, v76, v77, v78, v79, *v72);
    }
    CFRelease(v18);
    CFRelease(v17);
    v16 = serviceid;
  }
  serviceidRef = (uint64_t)CFStringCreateWithFormat(0, 0, CFSTR("%s"), v16);
  if (!serviceidRef)
  {
    v47 = __error();
    fatal("Couldn't allocate memory to create service id reference: %m(%d)", v48, v49, v50, v51, v52, v53, v54, *v47);
  }
  if (controlled)
  {
    if (qword_10004B978 != -1)
      dispatch_once(&qword_10004B978, &stru_10003CB48);
    if (byte_10004B975)
    {
      if (qword_10004B988 != -1)
        dispatch_once(&qword_10004B988, &stru_10003CBB0);
      v19 = qword_10004B980;
      if (qword_10004B980)
      {
        v82 = 0;
        v83 = &v82;
        v84 = 0x2000000000;
        v85 = 0;
        v20 = dispatch_semaphore_create(0);
        global_queue = dispatch_get_global_queue(0, 0);
        *(_QWORD *)buffer = _NSConcreteStackBlock;
        v87 = 0x40000000;
        v88 = sub_100020078;
        v89 = &unk_10003CB70;
        v90 = &v82;
        v91 = v20;
        ne_session_get_info(v19, 3, global_queue, buffer);
        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v20);
        v22 = (void *)v83[3];
        if (v22 && xpc_get_type(v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          if (xpc_dictionary_get_value((xpc_object_t)v83[3], "SessionLegacyServiceConfiguration"))
            systemOptions = _CFXPCCreateCFObjectFromXPCObject();
          if (xpc_dictionary_get_value((xpc_object_t)v83[3], "SessionLegacyUserConfiguration"))
            userOptions = _CFXPCCreateCFObjectFromXPCObject();
        }
        v23 = (void *)v83[3];
        if (v23)
          xpc_release(v23);
        _Block_object_dispose(&v82, 8);
      }
    }
    else
    {
      CopyControllerData();
    }
  }
  cfgCache = (uint64_t)SCDynamicStoreCreate(0, CFSTR("pppd"), 0, 0);
  if (!cfgCache)
  {
    v55 = SCError();
    v56 = SCErrorString(v55);
    fatal("SCDynamicStoreCreate failed: %s", v57, v58, v59, v60, v61, v62, v63, v56);
  }
  if (nodetach)
  {
    v24 = getpid();
    publish_dictnumentry(kSCEntNetPPP, CFSTR("pid"), v24);
  }
  publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPStatus, phase);
  if (serverid)
  {
    serveridRef = (uint64_t)CFStringCreateWithFormat(0, 0, CFSTR("%s"), serverid);
    if (!serveridRef)
    {
      v64 = __error();
      fatal("Couldn't allocate memory to create server id reference: %m(%d)", v65, v66, v67, v68, v69, v70, v71, *v64);
    }
    CopyServerData();
    publish_dictstrentry(kSCEntNetInterface, CFSTR("ServerID"), (const char *)serverid, 0);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  publish_dict = (uint64_t)Mutable;
  if (!controlled && Mutable)
  {
    rls = (uint64_t)SCDynamicStoreCreateRunLoopSource(kCFAllocatorDefault, (SCDynamicStoreRef)cfgCache, 0);
    if (rls)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)rls, kCFRunLoopDefaultMode);
    }
    else
    {
      v27 = SCError();
      v28 = SCErrorString(v27);
      notice("SCDynamicStoreCreateRunLoopSource FAILED %s", v29, v30, v31, v32, v33, v34, v35, v28);
    }
    SCDynamicStoreSetDisconnectCallBack(cfgCache, sub_100019FEC);
  }
  add_notifier(&phasechange, (uint64_t)sub_10001A0E4, 0);
  add_notifier(&exitnotify, (uint64_t)sub_10001A2AC, 0);
  if (statusfd != -1)
  {
    add_notifier(&ip_up_notify, (uint64_t)sub_10001A340, 10);
    add_notifier(&ip_down_notify, (uint64_t)sub_10001A340, 11);
    add_notifier(&lcp_up_notify, (uint64_t)sub_10001A340, 8);
    add_notifier(&lcp_down_notify, (uint64_t)sub_10001A340, 9);
    add_notifier(&lcp_lowerup_notify, (uint64_t)sub_10001A340, 6);
    add_notifier(&lcp_lowerdown_notify, (uint64_t)sub_10001A340, 7);
    add_notifier(&auth_start_notify, (uint64_t)sub_10001A340, 12);
    add_notifier(&auth_withpeer_fail_notify, (uint64_t)sub_10001A340, 13);
    add_notifier(&auth_withpeer_success_notify, (uint64_t)sub_10001A340, 14);
    add_notifier(&connectscript_started_notify, (uint64_t)sub_10001A340, 2);
    add_notifier(&connectscript_finished_notify, (uint64_t)sub_10001A340, 3);
    add_notifier(&terminalscript_started_notify, (uint64_t)sub_10001A340, 4);
    add_notifier(&terminalscript_finished_notify, (uint64_t)sub_10001A340, 5);
    add_notifier(&connect_started_notify, (uint64_t)sub_10001A340, 15);
    add_notifier(&connect_success_notify, (uint64_t)sub_10001A340, 17);
    add_notifier(&connect_fail_notify, (uint64_t)sub_10001A340, 16);
    add_notifier(&disconnect_started_notify, (uint64_t)sub_10001A340, 18);
    add_notifier(&disconnect_done_notify, (uint64_t)sub_10001A340, 19);
    add_notifier(&stop_notify, (uint64_t)sub_10001A340, 20);
    add_notifier(&cont_notify, (uint64_t)sub_10001A340, 21);
  }
  add_notifier(&lcp_timeremaining_notify, (uint64_t)sub_10001A35C, 0);
  add_notifier(&auth_peer_success_notify, (uint64_t)sub_10001A41C, 0);
  add_notifier(&protocolsready_notifier, (uint64_t)sys_protocolsreadynotify, 0);
  add_notifier(&acspdhcpready_notifier, (uint64_t)sys_acspdhcpreadynotify, 0);
  if (!mach_timebase_info(&info))
  {
    LODWORD(v36) = info.numer;
    LODWORD(v37) = info.denom;
    *(double *)&timeScaleMicroSeconds = (double)v36 / (double)v37 / 1000.0;
    *(double *)&timeScaleSeconds = *(double *)&timeScaleMicroSeconds / 1000000.0;
  }
  result = 0.0;
  xmmword_10004B720 = 0u;
  unk_10004B730 = 0u;
  xmmword_10004B700 = 0u;
  unk_10004B710 = 0u;
  xmmword_10004B6E0 = 0u;
  unk_10004B6F0 = 0u;
  xmmword_10004B6C0 = 0u;
  *(_OWORD *)algn_10004B6D0 = 0u;
  xmmword_10004B740 = 0u;
  *(_OWORD *)algn_10004B750 = 0u;
  xmmword_10004B760 = 0u;
  unk_10004B770 = 0u;
  xmmword_10004B780 = 0u;
  unk_10004B790 = 0u;
  xmmword_10004B7A0 = 0u;
  unk_10004B7B0 = 0u;
  dword_10004B7C0 = 0;
  return result;
}

uint64_t sub_100019E20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  int v17;
  sockaddr v18;

  v0 = socket(34, 3, 1);
  if ((v0 & 0x80000000) != 0)
  {
    error("Couldn't open PF_PPP: %m", v1, v2, v3, v4, v5, v6, v7, v17);
    return 0xFFFFFFFFLL;
  }
  v8 = v0;
  *(_QWORD *)&v18.sa_len = 74248;
  if (connect(v0, &v18, 8u) < 0)
  {
    error("Couldn't connect to PF_PPP: %m", v9, v10, v11, v12, v13, v14, v15, v17);
    close(v8);
    return 0xFFFFFFFFLL;
  }
  return v8;
}

uint64_t publish_dictnumentry(CFStringRef entity, const void *a2, int a3)
{
  CFStringRef NetworkServiceEntity;
  const __CFString *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  uint64_t v8;
  int valuePtr;

  valuePtr = a3;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity)
    return 12;
  v5 = NetworkServiceEntity;
  v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    v7 = v6;
    publish_keyentry(v5, a2, v6);
    CFRelease(v7);
    v8 = 0;
  }
  else
  {
    v8 = 12;
  }
  CFRelease(v5);
  return v8;
}

uint64_t publish_dictstrentry(CFStringRef entity, const void *a2, const char *a3, CFStringEncoding a4)
{
  CFStringRef NetworkServiceEntity;
  const __CFString *v8;
  CFStringRef v9;
  CFStringRef v10;
  uint64_t v11;

  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity)
    return 12;
  v8 = NetworkServiceEntity;
  v9 = CFStringCreateWithCString(0, a3, a4);
  if (v9)
  {
    v10 = v9;
    publish_keyentry(v8, a2, v9);
    CFRelease(v10);
    v11 = 0;
  }
  else
  {
    v11 = 12;
  }
  CFRelease(v8);
  return v11;
}

void sub_100019FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex Count;
  int v9;
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
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;

  dbglog("DynamicStore Server has reconnected, republish keys", a2, a3, a4, a5, a6, a7, a8, v43);
  if (publish_dict)
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)publish_dict);
    if (Count)
    {
      v9 = Count;
      CFRelease((CFTypeRef)cfgCache);
      cfgCache = (uint64_t)SCDynamicStoreCreate(0, CFSTR("pppd"), 0, 0);
      if (!cfgCache)
      {
        v34 = SCError();
        v35 = SCErrorString(v34);
        fatal("republish_dict SCDynamicStoreCreate failed: %s", v36, v37, v38, v39, v40, v41, v42, v35);
      }
      dbglog("republish_dict: processing %d keys", v10, v11, v12, v13, v14, v15, v16, v9);
      if (demand)
      {
        if (publish_dict)
          SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0, 0);
      }
      else if (!sub_100019450(v17, v18, v19, v20, v21, v22, v23, v24))
      {
        v25 = SCError();
        v26 = SCErrorString(v25);
        warning("republish_dict SCDynamicStoreSetMultiple failed key: %s\n", v27, v28, v29, v30, v31, v32, v33, v26);
      }
    }
  }
}

void sub_10001A0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  CFStringRef v17;
  int v18;
  const __CFString *v19;
  double v20;
  int v21;

  publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPStatus, a2);
  switch(a2)
  {
    case 0:
    case 3:
    case 11:
      v15 = *(_DWORD *)status;
      v16 = 1;
      goto LABEL_7;
    case 2:
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPRetryConnectTime);
      goto LABEL_10;
    case 4:
      dword_10004B990 = (*(double *)&timeScaleSeconds * (double)mach_absolute_time());
      publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPConnectTime, dword_10004B990);
      if (!maxconnect)
        goto LABEL_10;
      v17 = kSCPropNetPPPDisconnectTime;
      v18 = dword_10004B990 + maxconnect;
      v19 = kSCEntNetPPP;
LABEL_9:
      publish_dictnumentry(v19, v17, v18);
LABEL_10:
      if (phase)
        sys_notify(268, phase, ifunit, v10, v11, v12, v13, v14, a9);
      return;
    case 10:
      unpublish_dictentry(kSCEntNetPPP, CFSTR("AuthPeerName"));
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress);
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPConnectTime);
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
      v16 = 23;
      v15 = 0;
LABEL_7:
      sys_notify(266, v16, v15, v10, v11, v12, v13, v14, v21);
      goto LABEL_10;
    case 13:
      v20 = (double)redialtimer;
      v18 = (int)(v20 + (double)mach_absolute_time() * *(double *)&timeScaleSeconds);
      v19 = kSCEntNetPPP;
      v17 = kSCPropNetPPPRetryConnectTime;
      goto LABEL_9;
    default:
      goto LABEL_10;
  }
}

void sub_10001A2AC(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  unpublish_dict(kSCEntNetPPP);
  unpublish_dict(kSCEntNetDNS);
  unpublish_dict(kSCEntNetProxies);
  unpublish_dict(kSCEntNetInterface);
  sys_notify(266, 1, a2, v3, v4, v5, v6, v7, v8);
  if (cfgCache)
  {
    CFRelease((CFTypeRef)cfgCache);
    cfgCache = 0;
  }
  if (publish_dict)
  {
    CFRelease((CFTypeRef)publish_dict);
    publish_dict = 0;
  }
}

void sub_10001A340(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9;

  if (a1 == 16)
    v9 = 8;
  else
    v9 = a2;
  sys_notify(266, a1, v9, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_10001A35C(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  unsigned int v4;

  v3 = mach_absolute_time();
  if (*a2 != -1)
  {
    v4 = *a2 + (*(double *)&timeScaleSeconds * (double)v3);
    if (maxconnect)
    {
      if (v4 >= dword_10004B990 + maxconnect)
        v4 = dword_10004B990 + maxconnect;
    }
    if (!v4)
      return unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
    return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime, v4);
  }
  if (maxconnect)
  {
    v4 = dword_10004B990 + maxconnect;
    if (dword_10004B990 + maxconnect)
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime, v4);
  }
  return unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
}

uint64_t sub_10001A41C(uint64_t a1, uint64_t a2)
{
  return publish_dictstrentry(kSCEntNetPPP, CFSTR("AuthPeerName"), *(const char **)(a2 + 8), 0x8000100u);
}

uint64_t sys_cleanup()
{
  BOOL v0;
  __CFRunLoop *Current;
  uint64_t result;
  __int128 v3;
  __int128 v4;

  if (controlled)
    v0 = 1;
  else
    v0 = rls == 0;
  if (!v0)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)rls, kCFRunLoopDefaultMode);
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)rls);
    CFRelease((CFTypeRef)rls);
    rls = 0;
  }
  v3 = 0u;
  v4 = 0u;
  result = cifroute();
  if (byte_10004B7C4 == 1)
  {
    __strlcpy_chk(&v3, &ifname, 16, 16);
    result = ioctl(dword_10004B6BC, 0xC0206911uLL, &v3);
    if ((result & 0x80000000) == 0 && (v4 & 1) != 0)
    {
      LOWORD(v4) = v4 & 0xFFFE;
      result = ioctl(dword_10004B6BC, 0x80206910uLL, &v3);
    }
  }
  if (dword_10004B7C8)
    result = cifaddr(result, dword_10004B7C8, dword_10004B7CC);
  if (dword_10004B7D0)
    return cifproxyarp();
  return result;
}

uint64_t cifroute()
{
  BOOL v0;

  if (addifroute)
    v0 = dword_10004B848 == 0;
  else
    v0 = 1;
  if (!v0)
  {
    route_interface(2, dword_10004B840, dword_10004B844, 23, &ifname, 0);
    dword_10004B848 = 0;
  }
  return 1;
}

uint64_t cifaddr(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  cifroute();
  dword_10004B7C8 = 0;
  __strlcpy_chk(&v13, &ifname, 16, 16);
  *((_QWORD *)&v14 + 1) = 0;
  LODWORD(v14) = 528;
  DWORD1(v14) = a2;
  *((_QWORD *)&v15 + 1) = 0;
  LODWORD(v15) = 528;
  DWORD1(v15) = a3;
  v16 = 0uLL;
  if (ioctl(dword_10004B6BC, 0x80206919uLL) < 0)
  {
    if (*__error() != 49)
      warning("Couldn't delete interface address: %m", v6, v7, v8, v9, v10, v11, v12, (int)&v13);
    return 0;
  }
  else
  {
    unpublish_dict(kSCEntNetIPv4);
    return 1;
  }
}

uint64_t cifdefaultroute()
{
  byte_10004B858 = 0;
  ppp_create_ipv6_dummy_primary(1);
  return unpublish_dictentry(kSCEntNetIPv4, kSCPropNetOverridePrimary);
}

uint64_t cifproxyarp()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;

  if (byte_10004B960 == 1)
  {
    byte_10004B960 = 0;
    BYTE3(xmmword_10004B85C) = 2;
    dword_10004B870 = ++dword_10004B95C;
    v0 = socket(17, 3, 17);
    if (v0 < 0)
    {
      error("Couldn't delete proxy arp entry: socket: %m", v1, v2, v3, v4, v5, v6, v7, v17);
    }
    else
    {
      v8 = v0;
      if ((write(v0, &xmmword_10004B85C, (unsigned __int16)xmmword_10004B85C) & 0x8000000000000000) == 0)
      {
        close(v8);
        dword_10004B7D0 = 0;
        return 1;
      }
      error("Couldn't delete proxy arp entry: %m", v9, v10, v11, v12, v13, v14, v15, v17);
      close(v8);
    }
  }
  return 0;
}

void sys_runloop()
{
  BOOL v0;
  __CFRunLoop *Current;

  if (controlled)
    v0 = 1;
  else
    v0 = rls == 0;
  if (!v0)
  {
    if (kill_link)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }
    else
    {
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.0, 1u);
    }
  }
}

void set_network_signature(char *__s, const char *a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  size_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_10004B7D8)
  {
    free((void *)qword_10004B7D8);
    qword_10004B7D8 = 0;
  }
  if (__s)
  {
    v13 = strlen(__s);
    v14 = strlen(a2) + v13 + 1;
    if (!a3)
      goto LABEL_9;
  }
  else
  {
    v14 = 0;
    if (!a3)
      goto LABEL_9;
  }
  v15 = strlen(a3);
  v16 = strlen(a4) + v15;
  if (__s)
    v17 = 2;
  else
    v17 = 1;
  v14 += v17 + v16;
LABEL_9:
  if (!v14)
    return;
  v18 = v14 + 1;
  v19 = (char *)malloc_type_malloc(v18, 0xFD38B035uLL);
  qword_10004B7D8 = (uint64_t)v19;
  if (!v19)
  {
    warning("no memory to create network signature", v20, v21, v22, v23, v24, v25, v26, a9);
    return;
  }
  *v19 = 0;
  if (__s)
  {
    strlcat(v19, __s, v18);
    strlcat((char *)qword_10004B7D8, "=", v18);
    strlcat((char *)qword_10004B7D8, a2, v18);
    if (!a3)
      return;
    strlcat((char *)qword_10004B7D8, ";", v18);
    v19 = (char *)qword_10004B7D8;
  }
  else if (!a3)
  {
    return;
  }
  strlcat(v19, a3, v18);
  strlcat((char *)qword_10004B7D8, "=", v18);
  strlcat((char *)qword_10004B7D8, a4, v18);
}

CFStringRef set_server_peer(in_addr_t a1)
{
  in_addr v2;
  char *v3;
  CFStringRef result;

  if (qword_10004B7E0)
  {
    CFRelease((CFTypeRef)qword_10004B7E0);
    qword_10004B7E0 = 0;
  }
  v2.s_addr = a1;
  v3 = inet_ntoa(v2);
  result = CFStringCreateWithCString(0, v3, 0x600u);
  qword_10004B7E0 = (uint64_t)result;
  return result;
}

uint64_t sys_close()
{
  uint64_t result;

  if (dword_10004B6BC != -1)
  {
    close(dword_10004B6BC);
    dword_10004B6BC = -1;
  }
  result = ppp_sockfd;
  if (ppp_sockfd != -1)
  {
    result = close(ppp_sockfd);
    ppp_sockfd = -1;
  }
  return result;
}

void sys_notify(__int16 a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  size_t v12;
  int v13;
  size_t v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _WORD *v23;
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;

  if (statusfd != -1)
  {
    v12 = strlen((const char *)serviceid);
    v13 = v12;
    v14 = (uint64_t)((v12 << 32) + 0x1C00000000) >> 32;
    v15 = malloc_type_malloc(v14, 0xC2DA915FuLL);
    if (v15)
    {
      v23 = v15;
      bzero(v15, v14);
      v23[1] = a1;
      *v23 |= 0x8000u;
      *((_DWORD *)v23 + 3) = v13;
      *((_DWORD *)v23 + 4) = 8;
      memmove(v23 + 10, (const void *)serviceid, v13);
      v24 = (_DWORD *)((char *)v23 + v13 + 20);
      *v24 = a2;
      v24[1] = a3;
      if (write(statusfd, v23, v14) != v14)
        warning("can't talk to PPPController : %m", v25, v26, v27, v28, v29, v30, v31, v32);
      free(v23);
    }
    else
    {
      warning("no memory to send event to PPPController", v16, v17, v18, v19, v20, v21, v22, a9);
    }
  }
}

void sys_statusnotify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  sys_notify(267, *(int *)status, devstatus, a4, a5, a6, a7, a8, a9);
}

uint64_t sys_check_options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int vars0;

  if (crtscts != 2)
    return 1;
  warning("DTR/CTS flow control is not supported on this system", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ppp_available()
{
  int v0;

  no_ppp_msg[0] = "Mac OS X lacks kernel support for PPP.  \n"
                  "To include PPP support in the kernel, please follow \n"
                  "the steps detailed in the README.MacOSX file.\n";
  v0 = socket(34, 3, 1);
  if (v0 < 0)
  {
    if (noload)
      return 0;
    if (load_kext((uint64_t)"com.apple.nke.ppp", 1))
      return 0;
    v0 = socket(34, 3, 1);
    if (v0 < 0)
      return 0;
  }
  close(v0);
  return 1;
}

uint64_t tty_establish_ppp(int a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  void *v15;

  ioctl(a1, 0x2000740DuLL, 0);
  if (sync_serial)
    v2 = 14;
  else
    v2 = 5;
  dword_100045290 = v2;
  if (ioctl(a1, 0x8004741BuLL, &dword_100045290) < 0 && *__error() != 5)
  {
    v13 = "Couldn't set tty to PPP discipline: %m";
    goto LABEL_12;
  }
  v10 = generic_establish_ppp(a1, 0);
  if ((_DWORD)v10 == -1)
  {
    v15 = &unk_10004B7E8;
    if ((ioctl(a1, 0x8004741BuLL) & 0x80000000) == 0 || *__error() == 5)
      return 0xFFFFFFFFLL;
    v13 = "ioctl(TIOCSETD, TTYDISC): %m";
LABEL_12:
    error(v13, v3, v4, v5, v6, v7, v8, v9, (int)v15);
    return 0xFFFFFFFFLL;
  }
  v11 = v10;
  v12 = sub_10001AFE8(dword_100045294);
  sub_10001AF80(v11, v12 & 0xF0FFFFFF);
  return v11;
}

uint64_t generic_establish_ppp(int a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
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
  int v35;
  char *v37;
  char *v38;
  int *v39;
  int *v40;
  int v41;
  int v42;

  v42 = 0;
  v39 = &v42;
  if (ioctl(a1, 0x40047437uLL) == -1)
  {
    v37 = "Couldn't get link number: %m";
LABEL_19:
    error(v37, v3, v4, v5, v6, v7, v8, v9, (int)v39);
    return 0xFFFFFFFFLL;
  }
  dbglog("using link %d", v3, v4, v5, v6, v7, v8, v9, v42);
  v10 = sub_100019E20();
  if (v10 < 0)
  {
    v37 = "Couldn't reopen PF_PPP: %m";
    goto LABEL_19;
  }
  v11 = v10;
  v40 = &v42;
  if (ioctl(v10, 0x80047438uLL) < 0)
  {
    error("Couldn't attach to the ppp link %d: %m", v12, v13, v14, v15, v16, v17, v18, v42);
  }
  else
  {
    v19 = fcntl(v11, 3);
    if (v19 == -1 || (LODWORD(v40) = v19 | 4, fcntl(v11, 4) == -1))
      warning("Couldn't set ppp socket link to nonblock: %m", v20, v21, v22, v23, v24, v25, v26, (int)v40);
    dword_100045294 = v11;
    if (looped || (ifunit = -1, multilink) || (sub_10001B1E0() & 0x80000000) == 0)
    {
      if (a2 && (v41 = a2, ioctl(ppp_sockfd, 0x80107434uLL) < 0))
      {
        v38 = "Couldn't set the delegate interface: %m";
      }
      else
      {
        if (looped)
        {
          v34 = ppp_sockfd;
          v35 = sub_10001AFE8(ppp_sockfd);
          sub_10001AF80(v34, v35 & 0xFFFFFDFF);
          looped = 0;
        }
        if (multilink || (add_fd(ppp_sockfd), (ioctl(v11, 0x8004743AuLL, &ifunit) & 0x80000000) == 0))
        {
          sub_10001B378(kdebugflag);
          return dword_100045294;
        }
        v41 = ifunit;
        v38 = "Couldn't attach to PPP unit %d: %m";
      }
      error(v38, v27, v28, v29, v30, v31, v32, v33, v41);
    }
  }
  close(v11);
  return 0xFFFFFFFFLL;
}

int *sub_10001AF80(int a1, int a2)
{
  int *result;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v11 = a2;
  result = (int *)ioctl(a1, 0x80047459uLL, &v11);
  if ((result & 0x80000000) != 0)
  {
    result = __error();
    if (*result != 5)
    {
      v3 = v11;
      __error();
      fatal("ioctl(PPPIOCSFLAGS, %x): %m", v4, v5, v6, v7, v8, v9, v10, v3);
    }
  }
  return result;
}

uint64_t sub_10001AFE8(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v9 = 0;
  if ((ioctl(a1, 0x4004745AuLL) & 0x80000000) == 0)
    return v9;
  if (*__error() != 5)
    fatal("ioctl(PPPIOCGFLAGS): %m", v2, v3, v4, v5, v6, v7, v8, (int)&v9);
  return 0;
}

void tty_disestablish_ppp(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!hungup)
  {
    if (ioctl(a1, 0x8004741BuLL) < 0 && *__error() != 5)
      error("ioctl(TIOCSETD, TTYDISC): %m", v2, v3, v4, v5, v6, v7, v8, (int)&unk_10004B7E8);
    if (ioctl(a1, 0x2000740EuLL, 0) < 0 && *__error() != 5)
    {
      v9 = __error();
      warning("ioctl(TIOCNXCL): %m(%d)", v10, v11, v12, v13, v14, v15, v16, *v9);
    }
  }
  generic_disestablish_ppp();
}

void generic_disestablish_ppp()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v9 = 0;
  close(dword_100045294);
  dword_100045294 = -1;
  if (demand)
  {
    looped = 1;
    v0 = ppp_sockfd;
    v1 = sub_10001AFE8(ppp_sockfd);
    sub_10001AF80(v0, v1 | 0x200);
  }
  else
  {
    unpublish_dictentry(kSCEntNetPPP, kSCPropInterfaceName);
    if ((ifunit & 0x80000000) == 0 && ioctl(ppp_sockfd, 0x8004743CuLL, &v9) < 0)
      error("Couldn't release PPP unit ppp_sockfd %d: %m", v2, v3, v4, v5, v6, v7, v8, ppp_sockfd);
  }
  if (!multilink)
    remove_fd(ppp_sockfd);
}

uint64_t sub_10001B1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9[32];

  ifunit = req_unit;
  v7 = ioctl(ppp_sockfd, 0xC004743EuLL);
  if ((v7 & 0x80000000) != 0 && (req_unit & 0x80000000) == 0)
  {
    if (*__error() != 17)
    {
LABEL_7:
      error("Couldn't create new ppp unit: %m", v0, v1, v2, v3, v4, v5, v6, (int)&ifunit);
      return v7;
    }
    warning("Couldn't allocate PPP unit %d as it is already in use", v0, v1, v2, v3, v4, v5, v6, (int)&ifunit);
    ifunit = -1;
    v7 = ioctl(ppp_sockfd, 0xC004743EuLL);
  }
  if ((v7 & 0x80000000) != 0)
    goto LABEL_7;
  slprintf((int)v9, 32, "%s%d");
  publish_dictstrentry(kSCEntNetPPP, kSCPropInterfaceName, v9, 0);
  return v7;
}

uint64_t add_fd(int a1)
{
  uint64_t result;

  result = __darwin_check_fd_set_overflow(a1, &xmmword_10004B6C0, 0);
  if ((_DWORD)result)
    *(_DWORD *)((char *)&xmmword_10004B6C0 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  if (dword_10004B7C0 < a1)
    dword_10004B7C0 = a1;
  return result;
}

void sub_10001B378(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v8 = a1;
  if ((ifunit & 0x80000000) == 0 && ioctl(ppp_sockfd, 0x80047440uLL) < 0 && *__error() != 5)
    error("ioctl(PPPIOCSDEBUG): %m", v1, v2, v3, v4, v5, v6, v7, (int)&v8);
}

uint64_t unpublish_dictentry(CFStringRef entity, const void *a2)
{
  const __CFString *NetworkServiceEntity;
  const __CFString *v4;

  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity)
    return 12;
  v4 = NetworkServiceEntity;
  unpublish_keyentry(NetworkServiceEntity, a2);
  CFRelease(v4);
  return 0;
}

uint64_t remove_fd(int a1)
{
  uint64_t result;

  result = __darwin_check_fd_set_overflow(a1, &xmmword_10004B6C0, 0);
  if ((_DWORD)result)
    *(_DWORD *)((char *)&xmmword_10004B6C0 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) &= ~(1 << a1);
  return result;
}

void clean_check()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    v16 = 0;
    if (!ioctl(dword_100045294, 0x4004745AuLL))
    {
      v7 = ((~v16 & 0xF000000u) - 0x1000000) >> 24;
      if (v7 <= 7 && ((0x8Bu >> v7) & 1) != 0)
      {
        v8 = off_10003CBD0[(char)v7];
        warning("Serial link is not 8-bit clean:", v0, v1, v2, v3, v4, v5, v6, (int)&v16);
        warning("All received characters had %s", v9, v10, v11, v12, v13, v14, v15, (int)v8);
      }
    }
  }
}

void set_up_tty(int a1, int a2)
{
  uint64_t v4;
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
  uint64_t v17;
  tcflag_t v18;
  int v19;
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
  void *v34;
  termios v35;

  LODWORD(v34) = 0;
  if (ioctl(a1, 0x20007461uLL) == -1)
    error("set_up_tty, can't set controlling terminal: %m", v4, v5, v6, v7, v8, v9, v10, 0);
  memset(&v35, 0, sizeof(v35));
  if (tcgetattr(a1, &v35) < 0)
  {
    error("tcgetattr: %m", v11, v12, v13, v14, v15, v16, v17, (int)v34);
  }
  else
  {
    if ((byte_10004B7EC & 1) == 0)
    {
      *(termios *)byte_10004B7F0 = v35;
      v34 = &unk_10004B838;
      ioctl(a1, 0x40087468uLL);
    }
    v18 = v35.c_cflag & 0xFFFFFFFFFFFF68FFLL;
    if (a2 || crtscts < 1)
    {
      if (crtscts < 0)
        v18 = v35.c_cflag & 0xFFFFFFFFFFFC68FFLL;
    }
    else if (crtscts != 2)
    {
      v18 = v35.c_cflag & 0xFFFFFFFFFFFC68FFLL | 0x30000;
    }
    v35.c_cflag = v18 | 0x4B00;
    if (a2 || !modem)
      v35.c_cflag = v18 | 0xCB00;
    *(_OWORD *)&v35.c_iflag = xmmword_10003B600;
    v35.c_lflag = 0;
    *(_WORD *)&v35.c_cc[16] = 1;
    if (crtscts == -2)
    {
      v35.c_iflag = 1541;
      *(_WORD *)&v35.c_cc[12] = 4881;
    }
    if (inspeed)
    {
      cfsetospeed(&v35, inspeed);
      cfsetispeed(&v35, inspeed);
      v19 = inspeed;
    }
    else
    {
      v19 = cfgetospeed(&v35);
      inspeed = v19;
      if (!v19)
        fatal("Baud rate for %s is 0; need explicit baud rate", v20, v21, v22, v23, v24, v25, v26, (int)&devnam);
    }
    baud_rate = v19;
    if (tcsetattr(a1, 2, &v35) < 0)
      fatal("tcsetattr: %m", v27, v28, v29, v30, v31, v32, v33, (int)v34);
    byte_10004B7EC = 1;
  }
}

void set_up_tty_local(int a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  tcflag_t c_cflag;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  termios v19;

  memset(&v19, 0, sizeof(v19));
  if (tcgetattr(a1, &v19) < 0)
  {
    error("tcgetattr: %m", v4, v5, v6, v7, v8, v9, v10, v19.c_iflag);
  }
  else
  {
    *(_WORD *)&v19.c_cc[16] = 1;
    c_cflag = v19.c_cflag;
    v19.c_cflag &= ~0x8000uLL;
    if (a2 || !modem)
      v19.c_cflag = c_cflag | 0x8000;
    if (tcsetattr(a1, 0, &v19) < 0)
      fatal("tcsetattr: %m", v12, v13, v14, v15, v16, v17, v18, v19.c_iflag);
  }
}

uint64_t restore_tty(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  if (byte_10004B7EC == 1)
  {
    v1 = result;
    if (!default_device)
      *(_QWORD *)&byte_10004B7F0[24] &= 0xFFFFFFFFFFFFFFE7;
    if (!hungup)
    {
      if (tcsetattr(result, 2, (const termios *)byte_10004B7F0) < 0 && *__error() != 6)
        warning("tcsetattr: %m", v2, v3, v4, v5, v6, v7, v8, v9);
      result = ioctl(v1, 0x80087467uLL, &unk_10004B838);
    }
    byte_10004B7EC = 0;
  }
  return result;
}

uint64_t setdtr(int a1, int a2)
{
  int v3;

  v3 = 2;
  if (a2)
    return ioctl(a1, 0x8004746CuLL, &v3);
  else
    return ioctl(a1, 0x8004746BuLL, &v3);
}

uint64_t get_pty(int *a1, int *a2, char *a3, uid_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  termios v15;

  if (openpty(a1, a2, a3, 0, 0) < 0)
    return 0;
  memset(&v15, 0, sizeof(v15));
  fchown(*a2, a4, 0xFFFFFFFF);
  fchmod(*a2, 0x180u);
  if (tcgetattr(*a2, &v15))
  {
    v13 = "couldn't get attributes on pty: %m";
  }
  else
  {
    *(_OWORD *)&v15.c_iflag = xmmword_10003B610;
    v15.c_cflag = v15.c_cflag & 0xFFFFFFFFFFFFE0FFLL | 0xB00;
    v15.c_lflag = 0;
    if ((tcsetattr(*a2, 2, &v15) & 0x80000000) == 0)
      return 1;
    v13 = "couldn't set attributes on pty: %m";
  }
  warning(v13, v6, v7, v8, v9, v10, v11, v12, v15.c_iflag);
  return 1;
}

uint64_t open_ppp_loopback()
{
  looped = 1;
  if ((sub_10001B1E0() & 0x80000000) != 0)
    die(1);
  sub_10001AF80(ppp_sockfd, 512);
  sub_10001B378(kdebugflag);
  dword_100045294 = -1;
  return ppp_sockfd;
}

void output(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9;
  const void *v11;
  unsigned int v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a3;
  dump_packet((int)"sent", a2, a3, a4, a5, a6, a7, a8);
  v12 = *(unsigned __int8 *)(a2 + 2);
  v11 = (const void *)(a2 + 2);
  if (v12 <= 0xBF)
    v13 = &ppp_sockfd;
  else
    v13 = &dword_100045294;
  if (write(*v13, v11, v9 - 2) < 0 && *__error() != 5)
    error("write: %m", v14, v15, v16, v17, v18, v19, v20, a9);
}

double wait_input(timeval *a1)
{
  double result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  xmmword_10004B780 = xmmword_10004B700;
  unk_10004B790 = unk_10004B710;
  xmmword_10004B7A0 = xmmword_10004B720;
  unk_10004B7B0 = unk_10004B730;
  xmmword_10004B740 = xmmword_10004B6C0;
  *(_OWORD *)algn_10004B750 = *(_OWORD *)algn_10004B6D0;
  xmmword_10004B760 = xmmword_10004B6E0;
  unk_10004B770 = unk_10004B6F0;
  if (select(dword_10004B7C0 + 1, (fd_set *)&xmmword_10004B740, 0, 0, a1) < 0)
  {
    if (*__error() != 4)
      fatal("select: %m", v2, v3, v4, v5, v6, v7, v8, v9);
    result = 0.0;
    xmmword_10004B7A0 = 0u;
    unk_10004B7B0 = 0u;
    xmmword_10004B780 = 0u;
    unk_10004B790 = 0u;
    xmmword_10004B760 = 0u;
    unk_10004B770 = 0u;
    xmmword_10004B740 = 0u;
    *(_OWORD *)algn_10004B750 = 0u;
  }
  return result;
}

uint64_t wait_input_fd(int a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  timeval v6;
  unsigned int v7;
  fd_set v8;

  v6.tv_sec = a2 / 1000;
  *(&v6.tv_usec + 1) = 0;
  v6.tv_usec = a2 % 1000;
  memset(&v8, 0, sizeof(v8));
  if (__darwin_check_fd_set_overflow(a1, &v8, 0))
    *(__int32_t *)((char *)v8.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  while (1)
  {
    v3 = select(a1 + 1, &v8, 0, &v8, &v6);
    v4 = v3;
    v7 = v3;
    if ((v3 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
      return v4;
  }
  if ((_DWORD)v3)
  {
    if (ioctl(a1, 0x4004667FuLL, &v7, v6.tv_sec, *(_QWORD *)&v6.tv_usec) == -1)
      return 0xFFFFFFFFLL;
    else
      return v7;
  }
  return v4;
}

uint64_t is_ready_fd(int a1)
{
  uint64_t result;

  result = __darwin_check_fd_set_overflow(a1, &xmmword_10004B740, 0);
  if ((_DWORD)result)
    return (*(_DWORD *)((char *)&xmmword_10004B740 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> a1) & 1;
  return result;
}

uint64_t read_packet(_WORD *a1)
{
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
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
  int v18;

  *a1 = 1023;
  v1 = a1 + 1;
  if (dword_100045294 < 0)
  {
    v2 = -1;
  }
  else
  {
    v2 = read(dword_100045294, v1, 0x5DEuLL);
    if ((v2 & 0x80000000) == 0)
      goto LABEL_12;
    if (*__error() != 35 && *__error() != 4)
      error("read from socket link: %m", v3, v4, v5, v6, v7, v8, v9, v18);
  }
  if ((ifunit & 0x80000000) == 0)
  {
    v2 = read(ppp_sockfd, v1, 0x5DEuLL);
    if (v2 < 0 && *__error() != 35 && *__error() != 4)
      error("read from socket bundle: %m", v10, v11, v12, v13, v14, v15, v16, v18);
  }
LABEL_12:
  if (v2 >= 1)
    return (v2 + 2);
  else
    return v2;
}

uint64_t get_loop_output()
{
  uint64_t packet;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  packet = read_packet(&inpacket_buf);
  if ((int)packet < 1)
    return 0;
  v7 = packet;
  LODWORD(v8) = 0;
  do
  {
    if (loop_frame((uint64_t)&inpacket_buf, v7, v1, v2, v3, v4, v5, v6))
      v8 = 1;
    else
      v8 = v8;
    v7 = read_packet(&inpacket_buf);
  }
  while ((int)v7 > 0);
  return v8;
}

void tty_send_config(uint64_t a1, int a2, int a3, int a4)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  int v28;

  v28 = a2;
  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    v27 = 0;
    if (ioctl(dword_100045294, 0x80047457uLL) < 0)
      fatal("ioctl(PPPIOCSASYNCMAP): %m", v6, v7, v8, v9, v10, v11, v12, (int)&v28);
    if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
      fatal("ioctl (PPPIOCGFLAGS): %m", v13, v14, v15, v16, v17, v18, v19, (int)&v27);
    v27 = (a3 != 0) | (2 * (a4 != 0)) | v27 & 0xFFDFFFFC | ((sync_serial != 0) << 21);
    if (ioctl(dword_100045294, 0x80047459uLL) < 0)
      fatal("ioctl(PPPIOCSFLAGS): %m", v20, v21, v22, v23, v24, v25, v26, (int)&v27);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, a3);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, a4);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPTransmitACCM, v28);
  }
}

void generic_send_config(uint64_t a1, uint64_t a2, int a3, int a4)
{
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
  unsigned int v20;

  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    v20 = 0;
    if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
      fatal("ioctl (PPPIOCGFLAGS): %m", v6, v7, v8, v9, v10, v11, v12, (int)&v20);
    v20 = (a3 != 0) | (2 * (a4 != 0)) | v20 & 0xFFFFFFFC;
    if (ioctl(dword_100045294, 0x80047459uLL) < 0)
      fatal("ioctl(PPPIOCSFLAGS): %m", v13, v14, v15, v16, v17, v18, v19, (int)&v20);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, a3);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, a4);
  }
}

uint64_t netif_set_mtu(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  __strlcpy_chk(&v11, &ifname, 16, 16);
  LODWORD(v12) = a2;
  if (ioctl(dword_10004B6BC, 0x80206934uLL) < 0)
    error("ioctl (SIOCSIFMTU): %m", v3, v4, v5, v6, v7, v8, v9, (int)&v11);
  return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMTU, a2);
}

uint64_t netif_get_mtu()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  __strlcpy_chk(&v8, &ifname, 16, 16);
  if ((ioctl(dword_10004B6BC, 0xC0206933uLL) & 0x80000000) == 0)
    return v9;
  error("ioctl (SIOCGIFMTU): %m", v0, v1, v2, v3, v4, v5, v6, (int)&v8);
  return 0;
}

void ppp_hold()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;

  v8 = 0;
  if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
  {
    v7 = "ioctl (PPPIOCGFLAGS): %m";
  }
  else
  {
    v8 |= 0x20u;
    if ((ioctl(dword_100045294, 0x80047459uLL) & 0x80000000) == 0)
      return;
    v7 = "ioctl(PPPIOCSFLAGS): %m";
  }
  warning(v7, v0, v1, v2, v3, v4, v5, v6, (int)&v8);
}

void ppp_cont()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;

  v8 = 0;
  if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
  {
    v7 = "ioctl (PPPIOCGFLAGS): %m";
  }
  else
  {
    v8 &= ~0x20u;
    if ((ioctl(dword_100045294, 0x80047459uLL) & 0x80000000) == 0)
      return;
    v7 = "ioctl(PPPIOCSFLAGS): %m";
  }
  warning(v7, v0, v1, v2, v3, v4, v5, v6, (int)&v8);
}

void tty_set_xaccm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!hungup
    && (dword_100045294 & 0x80000000) == 0
    && ioctl(dword_100045294, 0x8020744FuLL, a1) < 0
    && *__error() != 25)
  {
    warning("ioctl(set extended ACCM): %m", v9, v10, v11, v12, v13, v14, v15, a9);
  }
}

uint64_t tty_recv_config(uint64_t result, int a2, uint64_t a3, int a4)
{
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
  unsigned int v33;
  int v34;
  int v35;

  v34 = a2;
  v35 = result;
  if (!hungup)
  {
    result = dword_100045294;
    if ((dword_100045294 & 0x80000000) == 0)
    {
      v33 = 0;
      if (ioctl(dword_100045294, 0x80047452uLL) < 0)
        fatal("ioctl(PPPIOCSMRU): %m", v5, v6, v7, v8, v9, v10, v11, (int)&v35);
      if (ioctl(dword_100045294, 0x80047454uLL) < 0)
        fatal("ioctl(PPPIOCSRASYNCMAP): %m", v12, v13, v14, v15, v16, v17, v18, (int)&v34);
      if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
        fatal("ioctl (PPPIOCGFLAGS): %m", v19, v20, v21, v22, v23, v24, v25, (int)&v33);
      v33 = v33 & 0xFFFFFFEF | (16 * (a4 == 0));
      if (ioctl(dword_100045294, 0x80047459uLL) < 0)
        fatal("ioctl(PPPIOCSFLAGS): %m", v26, v27, v28, v29, v30, v31, v32, (int)&v33);
      publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMRU, v35);
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPReceiveACCM, v34);
    }
  }
  return result;
}

uint64_t generic_recv_config(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int v27;

  v27 = result;
  if (!hungup)
  {
    result = dword_100045294;
    if ((dword_100045294 & 0x80000000) == 0)
    {
      v26 = 0;
      if (ioctl(dword_100045294, 0x80047452uLL) < 0)
        fatal("ioctl(PPPIOCSMRU): %m", v5, v6, v7, v8, v9, v10, v11, (int)&v27);
      if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
        fatal("ioctl (PPPIOCGFLAGS): %m", v12, v13, v14, v15, v16, v17, v18, (int)&v26);
      v26 = v26 & 0xFFFFFFEF | (16 * (a4 == 0));
      if (ioctl(dword_100045294, 0x80047459uLL) < 0)
        fatal("ioctl(PPPIOCSFLAGS): %m", v19, v20, v21, v22, v23, v24, v25, (int)&v26);
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMRU, v27);
    }
  }
  return result;
}

uint64_t ccp_test(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v5;
  int v6;
  int v7;

  v5 = a2;
  v6 = a3;
  v7 = a4;
  if ((ioctl(ppp_sockfd, 0x8010744DuLL, &v5) & 0x80000000) == 0)
    return 1;
  if (*__error() == 55)
    return 0;
  return 0xFFFFFFFFLL;
}

void ccp_flags_set(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;

  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    v13 = 0;
    if (ioctl(ppp_sockfd, 0x4004745AuLL) < 0)
    {
      v12 = "ioctl (PPPIOCGFLAGS): %m";
    }
    else
    {
      v13 = ((a2 != 0) << 6) | ((a3 != 0) << 7) | v13 & 0xFFFFFF3F;
      if ((ioctl(ppp_sockfd, 0x80047459uLL) & 0x80000000) == 0)
        return;
      v12 = "ioctl(PPPIOCSFLAGS): %m";
    }
    error(v12, v5, v6, v7, v8, v9, v10, v11, (int)&v13);
  }
}

uint64_t ccp_fatal_error()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;

  v8 = 0;
  if ((ioctl(dword_100045294, 0x4004745AuLL) & 0x80000000) == 0)
    return v8 & 0x800000;
  error("ioctl(PPPIOCGFLAGS): %m", v0, v1, v2, v3, v4, v5, v6, (int)&v8);
  return 0;
}

BOOL get_idle_time(uint64_t a1, uint64_t a2)
{
  return ioctl(ppp_sockfd, 0x4008743FuLL, a2) >= 0;
}

uint64_t get_ppp_stats(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _DWORD v18[7];

  v17 = 0u;
  memset(v18, 0, sizeof(v18));
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  __strlcpy_chk(&v14, &ifname, 16, 16);
  if (ioctl(dword_10004B6BC, 0xC05C697BuLL) < 0)
  {
    error("Couldn't get PPP statistics: %m", v3, v4, v5, v6, v7, v8, v9, (int)&v14);
    return 0;
  }
  else
  {
    v10 = HIDWORD(v15);
    v11 = DWORD2(v16);
    v12 = v17;
    *a2 = DWORD1(v15);
    a2[1] = v11;
    a2[2] = v10;
    a2[3] = v12;
    return 1;
  }
}

uint64_t sifvjcomp(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;

  v16 = 0;
  v17 = a4;
  v15 = &v16;
  if (ioctl(ppp_sockfd, 0x4004745AuLL) < 0)
  {
    v14 = "ioctl (PPPIOCGFLAGS): %m";
  }
  else
  {
    v16 = (4 * (a2 != 0)) | (8 * (a3 == 0)) | v16 & 0xFFFFFFF3;
    v15 = &v16;
    if (ioctl(ppp_sockfd, 0x80047459uLL) < 0)
    {
      v14 = "ioctl(PPPIOCSFLAGS): %m";
    }
    else
    {
      if (!a2 || (v15 = (unsigned int *)&v17, (ioctl(ppp_sockfd, 0x80047451uLL) & 0x80000000) == 0))
      {
        publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPIPCPCompressionVJ, a2);
        return 1;
      }
      v14 = "ioctl(PPPIOCSMAXCID): %m";
    }
  }
  error(v14, v6, v7, v8, v9, v10, v11, v12, (int)v15);
  return 0;
}

uint64_t sifup()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char *v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  __strlcpy_chk(&v9, &ifname, 16, 16);
  if (ioctl(dword_10004B6BC, 0xC0206911uLL) < 0)
  {
    v8 = "ioctl (SIOCGIFFLAGS): %m";
  }
  else
  {
    LOWORD(v10) = v10 | 1;
    if ((ioctl(dword_10004B6BC, 0x80206910uLL) & 0x80000000) == 0)
    {
      result = 1;
      byte_10004B7C4 = 1;
      return result;
    }
    v8 = "ioctl(SIOCSIFFLAGS): %m";
  }
  error(v8, v0, v1, v2, v3, v4, v5, v6, (int)&v9);
  return 0;
}

uint64_t sifnpmode(uint64_t a1, int a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v12[2];

  v12[0] = a2;
  v12[1] = a3;
  if ((ioctl(ppp_sockfd, 0x8008744BuLL, v12) & 0x80000000) == 0)
    return 1;
  error("ioctl(set NP %d mode to %d): %m", v4, v5, v6, v7, v8, v9, v10, a2);
  return 0;
}

uint64_t sifnpafmode(uint64_t a1, int a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v12[2];

  v12[0] = a2;
  v12[1] = a3;
  if ((ioctl(ppp_sockfd, 0x80087435uLL, v12) & 0x80000000) == 0)
    return 1;
  error("ioctl(set NPAF %d mode to %d): %m", v4, v5, v6, v7, v8, v9, v10, a2);
  return 0;
}

uint64_t sifdown()
{
  BOOL v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  v11 = 33;
  if (ioctl(ppp_sockfd, 0xC008744CuLL, &v11))
    v0 = 1;
  else
    v0 = HIDWORD(v11) == 1;
  if (v0)
  {
    LODWORD(v11) = 87;
    if (ioctl(ppp_sockfd, 0xC008744CuLL, &v11) || HIDWORD(v11) == 1)
    {
      __strlcpy_chk(&v12, &ifname, 16, 16);
      if (ioctl(dword_10004B6BC, 0xC0206911uLL) < 0)
      {
        v10 = "ioctl (SIOCGIFFLAGS): %m";
      }
      else
      {
        LOWORD(v13) = v13 & 0xFFFE;
        if ((ioctl(dword_10004B6BC, 0x80206910uLL) & 0x80000000) == 0)
        {
          byte_10004B7C4 = 0;
          return 1;
        }
        v10 = "ioctl(SIOCSIFFLAGS): %m";
      }
      error(v10, v2, v3, v4, v5, v6, v7, v8, (int)&v12);
    }
  }
  return 0;
}

uint64_t sifroute(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a4 != -1 && addifroute)
  {
    dword_10004B840 = a4 & a2;
    dword_10004B844 = a4;
    dword_10004B848 = route_interface(1, a4 & a2, a4, 23, &ifname, 0);
  }
  return 1;
}

uint64_t route_interface(int a1, int a2, int a3, char a4, const char *a5, int a6)
{
  int v11;
  int v12;
  unsigned int v13;
  size_t v14;
  char v15;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int *v26;
  char *v27;
  char *v28;
  char *v29;
  int v30;
  int v31;
  char v32[16];
  char v33[16];
  __int128 __buf;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v30 = a3;
  v31 = a2;
  v11 = socket(17, 3, 17);
  if (v11 < 0)
  {
    v17 = addr2ascii(2, &v31, 4, v33);
    addr2ascii(2, &v30, 4, v32);
    error("route_interface: open routing socket failed, %m. (address %s, mask %s, interface %s, host %d).", v18, v19, v20, v21, v22, v23, v24, v17);
  }
  else
  {
    v12 = v11;
    __buf = 0u;
    v35 = 0u;
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    BYTE3(__buf) = a1;
    if (a6)
      v13 = 2053;
    else
      v13 = 2049;
    BYTE2(__buf) = 5;
    DWORD1(v35) = 1;
    *((_QWORD *)&__buf + 1) = v13 | 0x300000000;
    WORD6(v39) = 528;
    LODWORD(v40) = a2;
    v14 = strlen(a5);
    WORD6(v40) = 4628;
    if (v14 >= 0xC)
      v15 = 12;
    else
      v15 = v14;
    LOBYTE(v41) = a4;
    BYTE1(v41) = v15;
    __strncpy_chk((char *)&v41 + 4, a5);
    if (v30)
    {
      HIDWORD(__buf) |= 4u;
      LOWORD(v42) = 528;
      DWORD1(v42) = v30;
    }
    LOWORD(__buf) = 144;
    if ((write(v12, &__buf, 0x90uLL) & 0x8000000000000000) == 0)
    {
      close(v12);
      return 1;
    }
    if (a1 == 2)
      v25 = 7;
    else
      v25 = 3;
    v26 = __error();
    v27 = strerror(*v26);
    v28 = addr2ascii(2, &v31, 4, v33);
    v29 = addr2ascii(2, &v30, 4, v32);
    sys_log(v25, "route_interface: write routing socket failed, %s. (address %s, mask %s, interface %s, host %d).", v27, v28, v29, a5, a6);
    close(v12);
  }
  return 0;
}

uint64_t sifaddr(uint64_t a1, int a2, unsigned int a3, int a4)
{
  int *v7;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  if ((byte_10004B84C & 1) == 0)
  {
    __strlcpy_chk(&v35, &ifname, 16, 16);
    if (ioctl(dword_10004B6BC, 0xC0206950uLL, &v35) < 0)
    {
      v7 = __error();
      error("Couldn't plumb IP to the interface: %d %m", v8, v9, v10, v11, v12, v13, v14, *v7);
    }
    byte_10004B84C = 1;
  }
  __strlcpy_chk(&v37, &ifname, 16, 16);
  *((_QWORD *)&v38 + 1) = 0;
  LODWORD(v38) = 528;
  DWORD1(v38) = a2;
  *((_QWORD *)&v39 + 1) = 0;
  LODWORD(v39) = 528;
  DWORD1(v39) = a3;
  v40 = 0uLL;
  if (a4)
  {
    LOWORD(v40) = 528;
    DWORD1(v40) = a4;
  }
  v35 = 0u;
  v36 = 0u;
  __strlcpy_chk(&v35, &ifname, 16, 16);
  if (ioctl(dword_10004B6BC, 0x80206919uLL) < 0 && *__error() != 49)
    warning("Couldn't remove interface address: %m", v15, v16, v17, v18, v19, v20, v21, (int)&v35);
  v22 = ioctl(dword_10004B6BC, 0x8040691AuLL, &v37);
  if ((v22 & 0x80000000) != 0)
  {
    if (*__error() != 17)
    {
      error("Couldn't set interface address: %m", v24, v25, v26, v27, v28, v29, v30, v34);
      return 0;
    }
    warning("Couldn't set interface address: Address %I already exists", v24, v25, v26, v27, v28, v29, v30, a2);
  }
  dword_10004B7C8 = a2;
  dword_10004B7CC = a3;
  if (looplocal)
  {
    v31 = ppp_sockfd;
    v32 = sub_10001AFE8(ppp_sockfd);
    sub_10001AF80(v31, v32 | 0x1000000);
    v22 = route_interface(1, a2, 0, 23, &ifname, 1);
  }
  sifroute(v22, a2, v23, a4);
  publish_stateaddr(a2, a3);
  return 1;
}

CFMutableDictionaryRef publish_stateaddr(unsigned int a1, unsigned int a2)
{
  CFMutableDictionaryRef result;
  __CFDictionary *v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  CFStringRef v8;
  CFStringRef v9;
  CFMutableArrayRef v10;
  __CFArray *v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  CFStringRef v18;
  CFStringRef v19;
  const __CFString *NetworkServiceEntity;
  const __CFString *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (!cfgCache)
    return 0;
  result = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (result)
  {
    v5 = result;
    Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v7 = Mutable;
      v8 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a1, BYTE1(a1), BYTE2(a1), HIBYTE(a1));
      if (v8)
      {
        v9 = v8;
        CFArrayAppendValue(v7, v8);
        CFRelease(v9);
        CFDictionarySetValue(v5, kSCPropNetIPv4Addresses, v7);
      }
      CFRelease(v7);
    }
    v10 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
    if (v10)
    {
      v11 = v10;
      v12 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
      if (v12)
      {
        v13 = v12;
        CFArrayAppendValue(v11, v12);
        CFRelease(v13);
        CFDictionarySetValue(v5, kSCPropNetIPv4DestAddresses, v11);
      }
      CFRelease(v11);
    }
    v14 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a1, BYTE1(a1), BYTE2(a1), HIBYTE(a1));
    if (v14)
    {
      v15 = v14;
      CFDictionarySetValue(v5, kSCPropNetIPv4Router, v14);
      CFRelease(v15);
    }
    v16 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), &ifname);
    if (v16)
    {
      v17 = v16;
      CFDictionarySetValue(v5, kSCPropInterfaceName, v16);
      CFRelease(v17);
    }
    if (qword_10004B7D8)
    {
      v18 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), qword_10004B7D8);
      if (v18)
      {
        v19 = v18;
        CFDictionarySetValue(v5, CFSTR("NetworkSignature"), v18);
        CFRelease(v19);
      }
    }
    if (qword_10004B7E0)
      CFDictionarySetValue(v5, CFSTR("ServerAddress"), (const void *)qword_10004B7E0);
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv4);
    if (NetworkServiceEntity)
    {
      v21 = NetworkServiceEntity;
      if (!sub_10001E0A0(NetworkServiceEntity, v5))
      {
        v22 = SCError();
        SCErrorString(v22);
        warning("SCDynamicStoreSetValue IP %s failed: %s\n", v23, v24, v25, v26, v27, v28, v29, (int)&ifname);
      }
      CFRelease(v21);
    }
    CFRelease(v5);
    return (CFMutableDictionaryRef)1;
  }
  return result;
}

uint64_t uifaddr(uint64_t a1, unsigned int a2, unsigned int a3, int a4)
{
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
  CFStringRef NetworkServiceEntity;
  const __CFString *v31;
  void *Value;
  void *v33;
  CFTypeID v35;
  CFMutableDictionaryRef MutableCopy;
  CFTypeID v37;
  CFMutableArrayRef Mutable;
  __CFArray *v39;
  CFStringRef v40;
  CFStringRef v41;
  CFMutableArrayRef v42;
  __CFArray *v43;
  CFStringRef v44;
  CFStringRef v45;
  CFStringRef v46;
  CFStringRef v47;
  CFStringRef v48;
  CFStringRef v49;
  CFStringRef v50;
  CFStringRef v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFMutableDictionaryRef v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  int v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;

  cifroute();
  if ((byte_10004B84C & 1) == 0)
  {
    error("Interface should have been plumbed already", v7, v8, v9, v10, v11, v12, v13, v86);
    return 0xFFFFFFFFLL;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  __strlcpy_chk(&v90, &ifname, 16, 16);
  *((_QWORD *)&v91 + 1) = 0;
  LODWORD(v91) = 528;
  DWORD1(v91) = a2;
  *((_QWORD *)&v92 + 1) = 0;
  LODWORD(v92) = 528;
  DWORD1(v92) = a3;
  v93 = 0uLL;
  if (a4)
  {
    LOWORD(v93) = 528;
    DWORD1(v93) = a4;
  }
  v88 = 0u;
  v89 = 0u;
  __strlcpy_chk(&v88, &ifname, 16, 16);
  if (ioctl(dword_10004B6BC, 0x80206919uLL) < 0 && *__error() != 49)
    warning("Couldn't remove interface address: %m", v14, v15, v16, v17, v18, v19, v20, (int)&v88);
  v21 = ioctl(dword_10004B6BC, 0x8040691AuLL, &v90);
  if ((v21 & 0x80000000) != 0)
  {
    if (*__error() != 17)
    {
      error("Couldn't set interface address: %m", v23, v24, v25, v26, v27, v28, v29, v87);
      return 0;
    }
    warning("Couldn't set interface address: Address %I already exists", v23, v24, v25, v26, v27, v28, v29, a2);
  }
  dword_10004B7C8 = a2;
  dword_10004B7CC = a3;
  sifroute(v21, a2, v22, a4);
  if (cfgCache)
  {
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv4);
    if (NetworkServiceEntity)
    {
      v31 = NetworkServiceEntity;
      if (publish_dict)
      {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, NetworkServiceEntity);
        v33 = Value;
        if (Value)
        {
          CFRetain(Value);
LABEL_18:
          v35 = CFGetTypeID(v33);
          if (v35 == CFDictionaryGetTypeID())
          {
            MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v33);
            CFRelease(v33);
            if (MutableCopy)
            {
              v37 = CFGetTypeID(MutableCopy);
              if (v37 == CFDictionaryGetTypeID())
              {
                Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                if (Mutable)
                {
                  v39 = Mutable;
                  v40 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
                  if (v40)
                  {
                    v41 = v40;
                    CFArrayAppendValue(v39, v40);
                    CFRelease(v41);
                    CFDictionarySetValue(MutableCopy, kSCPropNetIPv4Addresses, v39);
                  }
                  CFRelease(v39);
                }
                v42 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                if (v42)
                {
                  v43 = v42;
                  v44 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a3, BYTE1(a3), BYTE2(a3), HIBYTE(a3));
                  if (v44)
                  {
                    v45 = v44;
                    CFArrayAppendValue(v43, v44);
                    CFRelease(v45);
                    CFDictionarySetValue(MutableCopy, kSCPropNetIPv4DestAddresses, v43);
                  }
                  CFRelease(v43);
                }
                v46 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
                if (v46)
                {
                  v47 = v46;
                  CFDictionarySetValue(MutableCopy, kSCPropNetIPv4Router, v46);
                  CFRelease(v47);
                }
                v48 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), &ifname);
                if (v48)
                {
                  v49 = v48;
                  CFDictionarySetValue(MutableCopy, kSCPropInterfaceName, v48);
                  CFRelease(v49);
                }
                if (qword_10004B7D8)
                {
                  v50 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), qword_10004B7D8);
                  if (v50)
                  {
                    v51 = v50;
                    CFDictionarySetValue(MutableCopy, CFSTR("NetworkSignature"), v50);
                    CFRelease(v51);
                  }
                }
                if (qword_10004B7E0)
                  CFDictionarySetValue(MutableCopy, CFSTR("ServerAddress"), (const void *)qword_10004B7E0);
                if (!sub_10001E0A0(v31, MutableCopy))
                {
                  v52 = SCError();
                  SCErrorString(v52);
                  warning("SCDynamicStoreSetValue IP %s failed: %s\n", v53, v54, v55, v56, v57, v58, v59, (int)&ifname);
                }
              }
              else
              {
                v78 = SCError();
                SCErrorString(v78);
                warning("CFDictionaryCreateMutableCopy IP %s failed: %s\n", v79, v80, v81, v82, v83, v84, v85, (int)&ifname);
              }
              v69 = MutableCopy;
              goto LABEL_47;
            }
            v70 = SCError();
            SCErrorString(v70);
            warning("CFDictionaryCreateMutableCopy IP %s failed: %s\n", v71, v72, v73, v74, v75, v76, v77, (int)&ifname);
            goto LABEL_48;
          }
          v60 = 0;
LABEL_42:
          v61 = SCError();
          SCErrorString(v61);
          warning("SCDynamicStoreCopyValue IP %s failed: %s\n", v62, v63, v64, v65, v66, v67, v68, (int)&ifname);
          if ((v60 & 1) == 0)
          {
            v69 = (CFMutableDictionaryRef)v33;
LABEL_47:
            CFRelease(v69);
          }
LABEL_48:
          CFRelease(v31);
          return 1;
        }
      }
      else
      {
        v33 = (void *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity);
        if (v33)
          goto LABEL_18;
      }
      v60 = 1;
      goto LABEL_42;
    }
  }
  return 1;
}

uint64_t unpublish_dict(CFStringRef entity)
{
  CFStringRef NetworkServiceEntity;
  const __CFString *v2;
  _BOOL8 v3;

  if (!cfgCache)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity)
    return 12;
  v2 = NetworkServiceEntity;
  if (publish_dict)
    CFDictionaryRemoveValue((CFMutableDictionaryRef)publish_dict, NetworkServiceEntity);
  v3 = SCDynamicStoreRemoveValue((SCDynamicStoreRef)cfgCache, v2) == 0;
  CFRelease(v2);
  return v3;
}

uint64_t sif6addr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v31;
  int v32;
  __int128 *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[18];

  v5 = socket(30, 2, 0);
  if (v5 < 0)
  {
    error("Can't create IPv6 socket: %m", v6, v7, v8, v9, v10, v11, v12, v32);
  }
  else
  {
    v13 = v5;
    v14 = if_nametoindex(&ifname);
    if (v14)
    {
      v22 = v14;
      memset(v41, 0, sizeof(v41));
      __strlcpy_chk(v41, &ifname, 16, 16);
      v33 = v41;
      if (ioctl(v13, 0xC080696EuLL) < 0)
      {
        v31 = "sif6addr: can't attach IPv6 protocol: %m";
      }
      else
      {
        v39 = 0u;
        v40 = 0u;
        v38 = 0u;
        v36 = 0u;
        memset(v37, 0, sizeof(v37));
        v34 = 0u;
        v35 = 0u;
        __strlcpy_chk(&v34, &ifname, 16, 16);
        LOWORD(v35) = 7708;
        WORD4(v35) = -32514;
        *(_QWORD *)&v36 = a2;
        WORD5(v35) = htons(v22);
        WORD6(v36) = 7708;
        WORD2(v37[0]) = -32514;
        *(_QWORD *)((char *)v37 + 12) = a3;
        WORD3(v37[0]) = WORD5(v35);
        WORD4(v37[1]) = 7708;
        *(_QWORD *)&v38 = -1;
        *((_QWORD *)&v38 + 1) = -1;
        *((_QWORD *)&v40 + 1) = -1;
        v33 = &v34;
        if ((ioctl(v13, 0xC0806982uLL) & 0x80000000) == 0)
        {
          close(v13);
          return 1;
        }
        v31 = "sif6addr: can't set LL address: %m";
      }
      error(v31, v23, v24, v25, v26, v27, v28, v29, (int)v33);
    }
    else
    {
      error("sifaddr6: no interface %s", v15, v16, v17, v18, v19, v20, v21, (int)&ifname);
    }
    close(v13);
  }
  return 0;
}

uint64_t cif6addr()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
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
  uint64_t v23;
  int v24;
  _OWORD v25[18];
  _OWORD v26[2];

  v0 = socket(30, 2, 0);
  if (v0 < 0)
  {
    error("Can't create IPv6 socket: %m", v1, v2, v3, v4, v5, v6, v7, v24);
  }
  else
  {
    v8 = v0;
    memset(v26, 0, sizeof(v26));
    memset(v25, 0, sizeof(v25));
    __strlcpy_chk(v26, &ifname, 16, 16);
    if ((ioctl(v8, 0xC0206951uLL, v26) & 0x80000000) == 0)
    {
      close(v8);
      return 1;
    }
    __strlcpy_chk(v25, &ifname, 16, 16);
    if (ioctl(v8, 0xC1206983uLL) < 0)
      warning("Can't stop LL address: %m", v10, v11, v12, v13, v14, v15, v16, (int)v25);
    __strlcpy_chk(v25, &ifname, 16, 16);
    if (ioctl(v8, 0xC120696FuLL) < 0)
      warning("Can't detach IPv6 protocol: %m", v17, v18, v19, v20, v21, v22, v23, (int)v25);
    close(v8);
  }
  return 0;
}

uint64_t ether_to_eui64(uint64_t a1)
{
  __CFDictionary *v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  kern_return_t MatchingServices;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  kern_return_t ParentEntry;
  io_object_t v15;
  io_registry_entry_t v16;
  const __CFData *CFProperty;
  const __CFData *v18;
  UInt8 buffer[4];
  __int16 v22;
  io_iterator_t existing[2];
  CFRange v24;

  v2 = IOServiceMatching("IOEthernetInterface");
  if (v2)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v4 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("IOPrimaryInterface"), kCFBooleanTrue);
      CFDictionarySetValue(v2, CFSTR("IOPropertyMatch"), v4);
      CFRelease(v4);
    }
  }
  *(_QWORD *)existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v2, existing);
  if (MatchingServices)
  {
    ParentEntry = MatchingServices;
LABEL_6:
    warning("Can't get hardware interface address for en0 (error = %d)\n", v6, v7, v8, v9, v10, v11, v12, ParentEntry);
    return 0;
  }
  v22 = 0;
  *(_DWORD *)buffer = 0;
  v15 = IOIteratorNext(existing[0]);
  if (v15)
  {
    v16 = v15;
    do
    {
      ParentEntry = IORegistryEntryGetParentEntry(v16, "IOService", &existing[1]);
      if (!ParentEntry)
      {
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(existing[1], CFSTR("IOMACAddress"), kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          v18 = CFProperty;
          v24.location = 0;
          v24.length = 6;
          CFDataGetBytes(CFProperty, v24, buffer);
          CFRelease(v18);
        }
        IOObjectRelease(existing[1]);
      }
      IOObjectRelease(v16);
      v16 = IOIteratorNext(existing[0]);
    }
    while (v16);
    IOObjectRelease(existing[0]);
    if (ParentEntry)
      goto LABEL_6;
  }
  else
  {
    IOObjectRelease(existing[0]);
  }
  if (*(_DWORD *)buffer == dword_10004B84D && v22 == word_10004B851)
    return 0;
  if (*(_DWORD *)buffer == dword_100045298 && v22 == word_10004529C)
    return 0;
  *(_BYTE *)a1 = buffer[0] | 2;
  *(_WORD *)(a1 + 1) = *(_WORD *)&buffer[1];
  *(_WORD *)(a1 + 3) = -257;
  *(_BYTE *)(a1 + 5) = buffer[3];
  *(_WORD *)(a1 + 6) = v22;
  return 1;
}

void ppp_create_ipv6_dummy_primary(int a1)
{
  BOOL v1;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v7;
  __CFArray *v8;
  __CFArray *v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFStringRef v12;
  CFStringRef v13;
  int valuePtr;

  valuePtr = 1;
  if (noipv6override)
    v1 = 1;
  else
    v1 = cfgCache == 0;
  if (!v1 && serviceidRef != 0)
  {
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv6);
    if (NetworkServiceEntity)
    {
      v5 = NetworkServiceEntity;
      if (a1)
      {
        unpublish_dict(NetworkServiceEntity);
      }
      else
      {
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          v7 = Mutable;
          v8 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
          if (v8)
          {
            v9 = v8;
            CFArrayAppendValue(v8, CFSTR("::1"));
            CFDictionarySetValue(v7, kSCPropNetIPv6Addresses, v9);
            CFRelease(v9);
          }
          CFDictionarySetValue(v7, kSCPropNetIPv6Router, CFSTR("::1"));
          v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
          if (v10)
          {
            v11 = v10;
            CFDictionarySetValue(v7, kSCPropNetOverridePrimary, v10);
            CFRelease(v11);
          }
          CFDictionarySetValue(v7, CFSTR("IsNULL"), kCFBooleanTrue);
          v12 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), &ifname);
          if (v12)
          {
            v13 = v12;
            CFDictionarySetValue(v7, kSCPropInterfaceName, v12);
            CFRelease(v13);
          }
          sub_10001E0A0(v5, v7);
          CFRelease(v7);
        }
      }
      CFRelease(v5);
    }
  }
}

BOOL sub_10001E0A0(CFStringRef key, CFPropertyListRef value)
{
  _BOOL8 v4;

  if (demand)
    v4 = SCDynamicStoreSetValue((SCDynamicStoreRef)cfgCache, key, value) != 0;
  else
    v4 = 1;
  if (!publish_dict)
    return 0;
  CFDictionarySetValue((CFMutableDictionaryRef)publish_dict, key, value);
  return v4;
}

uint64_t sifdefaultroute()
{
  byte_10004B858 = 1;
  ppp_create_ipv6_dummy_primary(0);
  return publish_dictnumentry(kSCEntNetIPv4, kSCPropNetOverridePrimary, 1);
}

uint64_t publish_dns_wins_entry(CFStringRef entity, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, const void *a8, void *key, void *value, int a11)
{
  CFStringRef NetworkServiceEntity;
  const __CFString *v19;
  const __CFDictionary *v20;
  CFMutableDictionaryRef MutableCopy;
  uint64_t v22;
  const __CFDictionary *v23;
  CFMutableDictionaryRef v24;
  CFTypeID v25;
  __CFArray *v26;
  __CFArray *v27;
  const __CFArray *v28;
  int v29;
  CFTypeID v30;
  CFIndex v31;
  __CFArray *Mutable;
  const __CFArray *v33;
  const __CFArray *v34;
  CFIndex Count;
  __CFArray *v36;
  CFTypeID v37;
  CFIndex v38;
  __CFArray *v39;
  __CFArray *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeID v50;
  const __CFArray *cf;

  if (publish_dict | cfgCache)
  {
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
    if (NetworkServiceEntity)
    {
      v19 = NetworkServiceEntity;
      if (publish_dict)
      {
        v20 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, NetworkServiceEntity);
        if (v20)
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v20);
          goto LABEL_11;
        }
      }
      else
      {
        v20 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity);
        if (v20)
        {
          v23 = v20;
          v24 = CFDictionaryCreateMutableCopy(0, 0, v20);
          CFRelease(v23);
          if (v24)
            goto LABEL_12;
          goto LABEL_9;
        }
      }
      MutableCopy = CFDictionaryCreateMutable(v20, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
LABEL_11:
      v24 = MutableCopy;
      if (MutableCopy)
      {
LABEL_12:
        v25 = CFGetTypeID(v24);
        if (v25 != CFDictionaryGetTypeID())
          goto LABEL_46;
        if (a11 || (v33 = (const __CFArray *)CFDictionaryGetValue(v24, a2)) == 0)
        {
          cf = 0;
        }
        else
        {
          v34 = v33;
          v50 = CFGetTypeID(v33);
          cf = v34;
          if (v50 == CFArrayGetTypeID())
          {
            Count = CFArrayGetCount(v34);
            v26 = CFArrayCreateMutableCopy(0, Count + 1, v34);
LABEL_16:
            v27 = v26;
            if (v26)
            {
              CFArrayAppendValue(v26, a3);
              if (a4)
                CFArrayAppendValue(v27, a4);
              CFDictionarySetValue(v24, a2, v27);
              CFRelease(v27);
              if (a5)
              {
                v28 = cf;
                v29 = a11;
                if (!a11)
                  v28 = (const __CFArray *)CFDictionaryGetValue(v24, a5);
                if (v28 && (v30 = CFGetTypeID(v28), v30 == CFArrayGetTypeID()))
                {
                  v31 = CFArrayGetCount(v28);
                  Mutable = CFArrayCreateMutableCopy(0, v31 + 1, v28);
                }
                else
                {
                  Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                }
                v36 = Mutable;
                if (!Mutable)
                  goto LABEL_46;
                CFArrayAppendValue(Mutable, a6);
                CFDictionarySetValue(v24, a5, v36);
                CFRelease(v36);
              }
              else
              {
                v28 = cf;
                v29 = a11;
              }
              if (a7)
              {
                if (!v29)
                  v28 = (const __CFArray *)CFDictionaryGetValue(v24, a7);
                if (v28 && (v37 = CFGetTypeID(v28), v37 == CFArrayGetTypeID()))
                {
                  v38 = CFArrayGetCount(v28);
                  v39 = CFArrayCreateMutableCopy(0, v38 + 1, v28);
                }
                else
                {
                  v39 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                }
                v40 = v39;
                if (!v39)
                  goto LABEL_46;
                CFArrayAppendValue(v39, a8);
                CFDictionarySetValue(v24, a7, v40);
                CFRelease(v40);
              }
              if (key)
                CFDictionarySetValue(v24, key, value);
              if (sub_10001E0A0(v19, v24))
              {
                v22 = 1;
LABEL_47:
                CFRelease(v19);
                goto LABEL_48;
              }
              v41 = SCError();
              SCErrorString(v41);
              warning("SCDynamicStoreSetValue DNS/WINS %s failed: %s\n", v42, v43, v44, v45, v46, v47, v48, (int)&ifname);
            }
LABEL_46:
            v22 = 0;
            goto LABEL_47;
          }
        }
        v26 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
        goto LABEL_16;
      }
LABEL_9:
      v22 = 0;
      v24 = (CFMutableDictionaryRef)v19;
LABEL_48:
      CFRelease(v24);
      return v22;
    }
  }
  return 0;
}

uint64_t sifdns(unsigned int a1, unsigned int a2)
{
  CFNumberRef v4;
  const __CFString *v5;
  CFStringRef v6;
  CFStringRef v7;
  unsigned int v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t valuePtr;

  valuePtr = 100000;
  v4 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  if (v4)
  {
    v5 = (const __CFString *)v4;
    v6 = CFStringCreateWithCString(0, (const char *)&unk_100032B1A, 0x8000100u);
    if (v6)
    {
      v7 = v6;
      notify_post("com.apple.system.dns.delay");
      v8 = a1 & 0xFF000000 | (BYTE2(a1) << 16) | (BYTE1(a1) << 8) | a1;
      if (v8
        && (v9 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a1, BYTE1(a1), BYTE2(a1), HIBYTE(a1))) != 0)
      {
        v10 = v9;
        v11 = 0;
        v12 = a2 & 0xFF000000 | (BYTE2(a2) << 16) | (BYTE1(a2) << 8) | a2;
        if (v12 && v12 != v8)
          v11 = CFStringCreateWithFormat(0, 0, CFSTR("%d.%d.%d.%d"), a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
        v13 = 1;
        if (publish_dns_wins_entry(kSCEntNetDNS, kSCPropNetDNSServerAddresses, v10, v11, kSCPropNetDNSSupplementalMatchDomains, v7, kSCPropNetDNSSupplementalMatchOrders, v5, kSCPropNetDNSConfirmedServiceID, (void *)serviceidRef, 1))publish_dns_wins_entry(kSCEntNetProxies, kSCPropNetProxiesSupplementalMatchDomains, v7, 0, kSCPropNetProxiesSupplementalMatchOrders, v5, 0,
            0,
            0,
            0,
            1);
        else
          v13 = 0;
        CFRelease(v5);
        CFRelease(v10);
        if (!v11)
          goto LABEL_16;
      }
      else
      {
        v13 = 0;
        v11 = v5;
      }
      CFRelease(v11);
    }
    else
    {
      v13 = 0;
      v7 = v5;
    }
LABEL_16:
    CFRelease(v7);
    return v13;
  }
  return 0;
}

uint64_t sifwins()
{
  return 0;
}

uint64_t sifproxyarp(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  int v12;
  char *v13;
  uint64_t v14;
  const char *i;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  int v27;
  const char *v28;
  char v29;
  __int128 v30;
  __int128 v31;

  xmmword_10004B85C = 0u;
  *(_OWORD *)algn_10004B86C = 0u;
  xmmword_10004B87C = 0u;
  unk_10004B88C = 0u;
  xmmword_10004B89C = 0u;
  unk_10004B8AC = 0u;
  xmmword_10004B8BC = 0u;
  unk_10004B8CC = 0u;
  xmmword_10004B8DC = 0u;
  unk_10004B8EC = 0u;
  xmmword_10004B8FC = 0u;
  unk_10004B90C = 0u;
  xmmword_10004B91C = 0u;
  unk_10004B92C = 0u;
  xmmword_10004B93C = 0u;
  unk_10004B94C = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = 1024;
  v28 = &v29;
  v26 = &v27;
  if (ioctl(dword_10004B6BC, 0xC00C6924uLL) < 0)
  {
    error("ioctl(SIOCGIFCONF): %m", v3, v4, v5, v6, v7, v8, v9, (int)&v27);
  }
  else if (v27 >= 1)
  {
    v10 = v28;
    v11 = &v28[v27];
    while (1)
    {
      if (v10[17] == 2)
      {
        v12 = *((_DWORD *)v10 + 5);
        __strlcpy_chk(&v30, v10, 16, 16);
        v26 = (int *)&v30;
        if ((ioctl(dword_10004B6BC, 0xC0206911uLL) & 0x80000000) == 0 && (v31 & 0x9B) == 3)
        {
          v26 = (int *)&v30;
          if ((ioctl(dword_10004B6BC, 0xC0206925uLL) & 0x80000000) == 0 && (DWORD1(v31) & (v12 ^ a2)) == 0)
            break;
        }
      }
      v10 += *((unsigned __int8 *)v10 + 16) + 16;
      if (v10 >= v11)
        goto LABEL_12;
    }
    info("found interface %s for proxy arp", v3, v4, v5, v6, v7, v8, v9, (int)v10);
    for (i = v28; i < v11; i += *((unsigned __int8 *)i + 16) + 16)
    {
      if (!strcmp(v10, i) && i[17] == 18)
      {
        __memcpy_chk((char *)&xmmword_10004B8BC + 12, i + 16, *((unsigned __int8 *)i + 16), 148);
        v17 = socket(17, 3, 17);
        if (v17 < 0)
        {
          v13 = "Couldn't add proxy arp entry: socket: %m";
          goto LABEL_13;
        }
        v18 = v17;
        WORD1(xmmword_10004B85C) = 261;
        dword_10004B870 = ++dword_10004B95C;
        *((_QWORD *)&xmmword_10004B85C + 1) = 0x300004804;
        LODWORD(xmmword_10004B87C) = 4;
        word_10004B8B8 = 528;
        LODWORD(xmmword_10004B8BC) = a2;
        v14 = 1;
        WORD5(xmmword_10004B8BC) = 1;
        LOWORD(xmmword_10004B85C) = BYTE12(xmmword_10004B8BC) + 108;
        if ((write(v17, &xmmword_10004B85C, BYTE12(xmmword_10004B8BC) + 108) & 0x8000000000000000) == 0)
        {
          close(v18);
          byte_10004B960 = 1;
          dword_10004B7D0 = a2;
          return v14;
        }
        error("Couldn't add proxy arp entry: %m", v19, v20, v21, v22, v23, v24, v25, (int)v26);
        close(v18);
        return 0;
      }
    }
  }
LABEL_12:
  v13 = "Cannot determine ethernet address for proxy ARP";
LABEL_13:
  error(v13, v3, v4, v5, v6, v7, v8, v9, (int)v26);
  return 0;
}

uint64_t GetMask(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v16;
  char *v17;
  char v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v1 = ntohl(a1);
  v2 = v1;
  if (v1 >> 30 == 2)
    v3 = -65536;
  else
    v3 = -256;
  if (v1 < 0)
    v4 = v3;
  else
    v4 = 4278190080;
  v5 = netmask;
  v6 = htonl(v4) | v5;
  v16 = 1024;
  v17 = &v18;
  if (ioctl(dword_10004B6BC, 0xC00C6924uLL) < 0)
  {
    warning("ioctl(SIOCGIFCONF): %m", v7, v8, v9, v10, v11, v12, v13, (int)&v16);
  }
  else
  {
    v14 = (unint64_t)v17;
    do
    {
      if (*(_BYTE *)(v14 + 17) == 2
        && ((ntohl(*(unsigned int *)(v14 + 20)) ^ v2) & v4) == 0)
      {
        __strlcpy_chk(&v19, v14, 16, 16);
        if ((ioctl(dword_10004B6BC, 0xC0206911uLL, &v19) & 0x80000000) == 0
          && (v20 & 0x19) == 1
          && (ioctl(dword_10004B6BC, 0xC0206925uLL, &v19) & 0x80000000) == 0)
        {
          v6 = DWORD1(v20) | v6;
        }
      }
      v14 += 16 + *(unsigned __int8 *)(v14 + 16);
    }
    while (v14 < (unint64_t)&v17[v16]);
  }
  return v6;
}

uint64_t have_route_to()
{
  return 0xFFFFFFFFLL;
}

uint64_t get_host_seed()
{
  return gethostid();
}

uint64_t sys_loadplugin(_BYTE *a1)
{
  size_t v2;
  const __CFURL *v3;
  const __CFURL *v4;
  __CFBundle *v5;
  __CFBundle *v6;
  uint64_t (*FunctionPointerForName)(__CFBundle *);
  uint64_t v8;
  char __s[1024];

  if (*a1 == 47)
  {
    __strlcpy_chk(__s, a1, 1024, 1024);
  }
  else
  {
    __strlcpy_chk(__s, "/System/Library/SystemConfiguration/PPPController.bundle/PlugIns/", 1024, 1024);
    __strlcat_chk(__s, a1, 1024, 1024);
  }
  v2 = strlen(__s);
  v3 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v2, 1u);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = v3;
  v5 = CFBundleCreate(0, v3);
  if (v5)
  {
    v6 = v5;
    if (CFBundleLoadExecutable(v5)
      && (FunctionPointerForName = (uint64_t (*)(__CFBundle *))CFBundleGetFunctionPointerForName(v6, CFSTR("start"))) != 0)
    {
      v8 = FunctionPointerForName(v6);
    }
    else
    {
      v8 = 0xFFFFFFFFLL;
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }
  CFRelease(v4);
  return v8;
}

uint64_t sys_eaploadplugin(_BYTE *a1, uint64_t a2)
{
  size_t v4;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFString *v12;
  const __CFString *v13;
  CFTypeID v14;
  CFIndex Length;
  char *v16;
  char *v17;
  CFIndex v18;
  __CFBundle *v19;
  __CFBundle *v20;
  uint64_t v21;
  int valuePtr;
  char __s[1024];

  if (*a1 == 47)
  {
    __strlcpy_chk(__s, a1, 1024, 1024);
  }
  else
  {
    __strlcpy_chk(__s, "/System/Library/SystemConfiguration/PPPController.bundle/PlugIns/", 1024, 1024);
    __strlcat_chk(__s, a1, 1024, 1024);
  }
  v4 = strlen(__s);
  v5 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v4, 1u);
  if (v5)
  {
    v6 = v5;
    v7 = CFBundleCopyInfoDictionaryForURL(v5);
    if (v7)
    {
      v8 = v7;
      valuePtr = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_QWORD *)(a2 + 96) = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("EAPType"));
      if (Value)
      {
        v10 = Value;
        v11 = CFGetTypeID(Value);
        if (v11 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v10, kCFNumberSInt32Type, &valuePtr);
          *(_BYTE *)(a2 + 8) = valuePtr;
        }
      }
      v12 = (const __CFString *)CFDictionaryGetValue(v8, CFSTR("EAPName"));
      if (v12)
      {
        v13 = v12;
        v14 = CFGetTypeID(v12);
        if (v14 == CFStringGetTypeID())
        {
          Length = CFStringGetLength(v13);
          v16 = (char *)malloc_type_malloc(Length + 1, 0x816B4DEFuLL);
          *(_QWORD *)(a2 + 16) = v16;
          if (v16)
          {
            v17 = v16;
            v18 = CFStringGetLength(v13);
            CFStringGetCString(v13, v17, v18 + 1, 0x8000100u);
          }
        }
      }
      CFRelease(v8);
      v19 = CFBundleCreate(0, v6);
      if (v19)
      {
        v20 = v19;
        if (CFBundleLoadExecutable(v19))
        {
          *(_QWORD *)(a2 + 40) = CFBundleGetFunctionPointerForName(v20, CFSTR("Init"));
          *(_QWORD *)(a2 + 48) = CFBundleGetFunctionPointerForName(v20, CFSTR("Dispose"));
          *(_QWORD *)(a2 + 56) = CFBundleGetFunctionPointerForName(v20, CFSTR("Process"));
          *(_QWORD *)(a2 + 64) = CFBundleGetFunctionPointerForName(v20, CFSTR("Free"));
          *(_QWORD *)(a2 + 72) = CFBundleGetFunctionPointerForName(v20, CFSTR("GetAttribute"));
          *(_QWORD *)(a2 + 80) = CFBundleGetFunctionPointerForName(v20, CFSTR("InteractiveUI"));
          *(_QWORD *)(a2 + 88) = CFBundleGetFunctionPointerForName(v20, CFSTR("PrintPacket"));
          v21 = 0;
          *(_QWORD *)(a2 + 96) = CFBundleGetFunctionPointerForName(v20, CFSTR("Identity"));
          *(_QWORD *)(a2 + 32) = v20;
LABEL_19:
          CFRelease(v6);
          return v21;
        }
        CFRelease(v20);
      }
    }
    v21 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  return 0xFFFFFFFFLL;
}

uint64_t publish_keyentry(const __CFString *key, const void *a2, const void *a3)
{
  const __CFDictionary *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!cfgCache)
    return 0;
  if (key
    && publish_dict
    && CFDictionaryContainsKey((CFDictionaryRef)publish_dict, key)
    && (Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, key)) != 0)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v8 = MutableCopy;
  if (!MutableCopy)
    return 0;
  CFDictionarySetValue(MutableCopy, a2, a3);
  if (!sub_10001E0A0(key, v8))
  {
    v9 = SCError();
    v10 = SCErrorString(v9);
    warning("publish_entry SCDSet() failed: %s\n", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  CFRelease(v8);
  return 1;
}

uint64_t unpublish_keyentry(const __CFString *key, const void *a2)
{
  const __CFDictionary *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (cfgCache)
  {
    if (key)
    {
      if (publish_dict)
      {
        if (CFDictionaryContainsKey((CFDictionaryRef)publish_dict, key))
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, key);
          if (Value)
          {
            MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
            if (MutableCopy)
            {
              v6 = MutableCopy;
              CFDictionaryRemoveValue(MutableCopy, a2);
              if (!sub_10001E0A0(key, v6))
              {
                v7 = SCError();
                v8 = SCErrorString(v7);
                warning("unpublish_keyentry SCDSet() failed: %s\n", v9, v10, v11, v12, v13, v14, v15, v8);
              }
              CFRelease(v6);
            }
          }
        }
      }
    }
  }
  return 0;
}

double getabsolutetime(uint64_t a1)
{
  double result;
  uint64_t v3;
  double v4;

  result = *(double *)&timeScaleSeconds;
  if (*(double *)&timeScaleSeconds != 0.0)
  {
    v3 = mach_absolute_time();
    v4 = *(double *)&timeScaleSeconds * (double)v3;
    *(_QWORD *)a1 = (uint64_t)v4;
    result = (double)(uint64_t)v4 * -1000000.0 + (double)v3 * *(double *)&timeScaleMicroSeconds;
    *(_DWORD *)(a1 + 8) = (int)result;
  }
  return result;
}

const char *sys_publish_remoteaddress(const char *result)
{
  if (result)
    return (const char *)publish_dictstrentry(kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress, result, 0x8000100u);
  return result;
}

uint64_t sys_reinit()
{
  pid_t v0;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  cfgCache = (uint64_t)SCDynamicStoreCreate(0, CFSTR("pppd"), 0, 0);
  if (!cfgCache)
  {
    v2 = SCError();
    v3 = SCErrorString(v2);
    fatal("SCDynamicStoreCreate failed: %s", v4, v5, v6, v7, v8, v9, v10, v3);
  }
  v0 = getpid();
  return publish_dictnumentry(kSCEntNetPPP, CFSTR("pid"), v0);
}

uint64_t route_gateway(int a1, int a2, int a3, int a4, int a5)
{
  int v10;
  int v11;
  unsigned int v12;
  int *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  int v19;
  int *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  int v26;
  int v27;
  __int16 __buf;
  char v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  char v40[16];
  char v41[16];
  char v42[16];

  v26 = a3;
  v27 = a2;
  v25 = a4;
  v10 = socket(17, 3, 17);
  if (v10 < 0)
  {
    v14 = __error();
    v15 = strerror(*v14);
    v16 = addr2ascii(2, &v27, 4, v42);
    v17 = addr2ascii(2, &v26, 4, v41);
    v18 = addr2ascii(2, &v25, 4, v40);
    sys_log(6, "host_gateway: open routing socket failed, %s. (address %s, mask %s, gateway %s, use-gateway %d).", v15, v16, v17, v18, a5);
  }
  else
  {
    v11 = v10;
    v31 = 0u;
    v32 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    v30 = a1;
    if (a5)
      v12 = 2051;
    else
      v12 = 2049;
    v29 = 5;
    LODWORD(v32) = 1;
    *(_QWORD *)((char *)&v31 + 4) = v12 | 0x700000000;
    WORD4(v36) = 528;
    HIDWORD(v36) = a2;
    WORD4(v37) = 528;
    HIDWORD(v37) = a4;
    WORD4(v38) = 528;
    HIDWORD(v38) = a3;
    __buf = 140;
    if ((write(v10, &__buf, 0x8CuLL) & 0x8000000000000000) == 0)
    {
      close(v11);
      return 1;
    }
    if (a1 == 2)
      v19 = 7;
    else
      v19 = 3;
    v20 = __error();
    v21 = strerror(*v20);
    v22 = addr2ascii(2, &v27, 4, v42);
    v23 = addr2ascii(2, &v26, 4, v41);
    v24 = addr2ascii(2, &v25, 4, v40);
    sys_log(v19, "host_gateway: write routing socket failed, %s. (address %s, mask %s, gateway %s, use-gateway %d).", v21, v22, v23, v24, a5);
    close(v11);
  }
  return 0;
}

uint64_t ppp_ip_probe_send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
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
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;

  dbglog("%s: starting", a2, a3, a4, a5, a6, a7, a8, (int)"ppp_ip_probe_send");
  if (!session || !*(_DWORD *)session)
    return 0xFFFFFFFFLL;
  if_nametoindex(*(const char **)(session + 16));
  v15 = session;
  *(_DWORD *)(session + 312) = 0;
  if (*(_BYTE *)(v15 + 253) != 2 || !*(_DWORD *)(v15 + 256))
  {
    info("%s: no goog-dns address", v8, v9, v10, v11, v12, v13, v14, (int)"ppp_ip_probe_send");
    goto LABEL_8;
  }
  dbglog("%s: found goog-dns address", v8, v9, v10, v11, v12, v13, v14, (int)"ppp_ip_probe_send");
  v16 = sub_10001F69C();
  *(_DWORD *)(session + 300) = v16;
  if (v16 == -1)
  {
LABEL_8:
    v31 = 0;
    goto LABEL_9;
  }
  add_fd(v16);
  dbglog("%s: sent to goog-dns over scope %d", v24, v25, v26, v27, v28, v29, v30, (int)"ppp_ip_probe_send");
  v31 = 1;
LABEL_9:
  if (*(_BYTE *)(session + 269) != 2 || !*(_DWORD *)(session + 272))
  {
    v56 = "%s: no peer address";
LABEL_19:
    dbglog(v56, v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
LABEL_20:
    if (v31)
      goto LABEL_21;
    return 0xFFFFFFFFLL;
  }
  dbglog("%s: found peer address", v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
  v32 = sub_10001F69C();
  v33 = session;
  *(_DWORD *)(session + 304) = v32;
  if (v32 != -1)
  {
    add_fd(v32);
    dbglog("%s: sent to peer over scope %d", v34, v35, v36, v37, v38, v39, v40, (int)"ppp_ip_probe_send");
    ++v31;
    v33 = session;
  }
  if (*(_BYTE *)(v33 + 285) != 2 || !*(_DWORD *)(v33 + 288))
  {
    v56 = "%s: no alternate peer address";
    goto LABEL_19;
  }
  dbglog("%s: found alternate peer address", v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
  v41 = sub_10001F69C();
  *(_DWORD *)(session + 308) = v41;
  if (v41 == -1)
    goto LABEL_20;
  add_fd(v41);
  info("%s: sent to alternate peer over scope %d", v49, v50, v51, v52, v53, v54, v55, (int)"ppp_ip_probe_send");
LABEL_21:
  dbglog("%s: %d probes sent", v42, v43, v44, v45, v46, v47, v48, (int)"ppp_ip_probe_send");
  v57 = session;
  ++*(_DWORD *)(session + 316);
  if (!*(_DWORD *)(v57 + 248))
  {
    *(_DWORD *)(v57 + 248) = 1;
    timeout((int)sub_10001F800);
  }
  return 0;
}

uint64_t sub_10001F69C()
{
  uint64_t v0;
  int v1;
  unsigned __int16 v2;
  unsigned __int16 v3;
  const sockaddr *v4;
  const sockaddr *v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  int v11;
  int v12;
  uint16x4_t v13;

  v0 = __chkstk_darwin();
  v3 = v2;
  v5 = v4;
  v6 = v0;
  v12 = v1;
  if ((v0 & 0x80000000) != 0)
  {
    v8 = v1;
    v9 = socket(2, 2, 1);
    if ((v9 & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
    v6 = v9;
    if (v8 && setsockopt(v9, 0, 25, &v12, 4u))
    {
LABEL_3:
      close(v6);
      return 0xFFFFFFFFLL;
    }
    v11 = 65663;
    setsockopt(v6, 0xFFFF, 4098, &v11, 4u);
  }
  v13.i32[0] = 8;
  v13.i16[3] = htons(v3);
  v13.i16[2] = getpid();
  v7 = vaddvq_s32((int32x4_t)vmovl_u16(v13));
  v13.i16[1] = ~(HIWORD(v7) + v7 + ((HIWORD(v7) + (unsigned __int16)v7) >> 16));
  if (sendto(v6, &v13, 8uLL, 0, v5, 0x10u) != 8)
    goto LABEL_3;
  return v6;
}

void sub_10001F800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (session
    && *(_DWORD *)session
    && (*(int *)(session + 316) > 14 || ppp_ip_probe_send(a1, a2, a3, a4, a5, a6, a7, a8)))
  {
    error("ppp_auxiliary_probe timed out", a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t ppp_ip_probe_stop()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  uint64_t result;
  int v11;

  v0 = session;
  if (!session || !*(_DWORD *)session)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(session + 248))
  {
    *(_DWORD *)(session + 248) = 0;
    untimeout((uint64_t)sub_10001F800, 0);
    dbglog("ppp_auxiliary_probe stopped", v1, v2, v3, v4, v5, v6, v7, v11);
    v0 = session;
  }
  for (i = 300; i != 312; i += 4)
  {
    v9 = *(_DWORD *)(v0 + i);
    if (v9 >= 1)
    {
      remove_fd(v9);
      close(*(_DWORD *)(session + i));
      v0 = session;
      *(_DWORD *)(session + i) = -1;
    }
  }
  result = 0;
  *(_QWORD *)(v0 + 312) = 0;
  return result;
}

double ppp_session_clear(uint64_t a1)
{
  double result;

  if (a1)
  {
    *(_QWORD *)(a1 + 320) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_DWORD *)(a1 + 308) = -1;
    *(_QWORD *)(a1 + 300) = -1;
  }
  return result;
}

BOOL ppp_variable_echo_is_off()
{
  return !session || !*(_DWORD *)session || wait_underlying_interface_up == 0;
}

void ppp_variable_echo_start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  if (session && *(_DWORD *)session && (wait_underlying_interface_up != 0) | byte_10004B964 & 1 && !lcp_echos_hastened)
  {
    dbglog("ppp_variable_echo_start", a2, a3, a4, a5, a6, a7, a8, v8);
    lcp_echo_interval_slow = lcp_echo_interval;
    lcp_echo_interval = 1;
    lcp_echo_fails_slow = lcp_echo_fails;
    if (lcp_echo_fails >= 11)
      lcp_echo_fails = 10;
    lcp_echos_hastened = 1;
    lcp_echo_restart(0);
  }
}

void ppp_variable_echo_stop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  int v9;

  if (session && *(_DWORD *)session)
  {
    if (wait_underlying_interface_up)
      v8 = 0;
    else
      v8 = byte_10004B964 == 0;
    if (!v8)
    {
      dbglog("received echo-reply, ppp_variable_echo_stop!", a2, a3, a4, a5, a6, a7, a8, v9);
      wait_underlying_interface_up = 0;
      byte_10004B964 = 0;
      if (lcp_echos_hastened)
      {
        lcp_echo_interval = lcp_echo_interval_slow;
        lcp_echo_fails = lcp_echo_fails_slow;
        lcp_echos_hastened = 0;
      }
    }
  }
}

void ppp_auxiliary_probe_ip_up()
{
  byte_10004B968 = 1;
}

void ppp_auxiliary_probe_ip_down()
{
  byte_10004B968 = 0;
}

_QWORD *ppp_auxiliary_probe_init()
{
  _QWORD *result;

  dword_10004B96C = 0;
  dword_10004B970 = 0;
  if ((byte_10004B974 & 1) == 0)
  {
    add_notifier(&ip_up_notify, (uint64_t)ppp_auxiliary_probe_ip_up, 0);
    result = add_notifier(&ip_down_notify, (uint64_t)ppp_auxiliary_probe_ip_down, 0);
    byte_10004B974 = 1;
  }
  return result;
}

uint64_t ppp_auxiliary_probe_stop()
{
  uint64_t result;

  result = ppp_ip_probe_stop();
  dword_10004B96C = 0;
  dword_10004B970 = 0;
  return result;
}

void ppp_auxiliary_probe_check(int a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  int v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  if (a1 >= 2)
  {
    v8 = byte_10004B968 && wait_underlying_interface_up == 0;
    if (v8 && (byte_10004B964 & 1) == 0)
    {
      v9 = dword_10004B96C;
      if (dword_10004B96C)
      {
        ++dword_10004B96C;
        if (v9 >= 1 && dword_10004B970 != 0)
        {
          error("no echo-reply, despite successful ppp_auxiliary_probe!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
          if (a2)
            a2(a3);
        }
      }
      else
      {
        error("no echo-reply, start ppp_auxiliary_probe!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
        ppp_ip_probe_send(v12, v13, v14, v15, v16, v17, v18, v19);
        dword_10004B96C = 1;
        dword_10004B970 = 0;
      }
    }
  }
}

void ppp_process_auxiliary_probe_input()
{
  uint64_t v0;
  int v1;
  uint64_t i;
  int v3;
  int ready;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v0 = session;
  if (session)
  {
    v12 = 0;
    if (*(_DWORD *)session)
    {
      v1 = 0;
      for (i = 75; i != 78; ++i)
      {
        v3 = *(_DWORD *)(v0 + 4 * i);
        if (v3 >= 1)
        {
          ready = is_ready_fd(v3);
          v0 = session;
          if (ready)
          {
            v12 = 0;
            read(*(_DWORD *)(session + 4 * i), &v12, 1uLL);
            remove_fd(*(_DWORD *)(session + 4 * i));
            if (v12 >= 1)
            {
              ++*(_DWORD *)(session + 312);
              ++v1;
              dbglog("ppp_auxiliary_probe[%d] response!", v5, v6, v7, v8, v9, v10, v11, i - 75);
            }
            close(*(_DWORD *)(session + 4 * i));
            v0 = session;
            *(_DWORD *)(session + 4 * i) = -1;
          }
        }
      }
      if (v1)
      {
        if (*(_DWORD *)(v0 + 248))
        {
          *(_DWORD *)(v0 + 248) = 0;
          untimeout((uint64_t)sub_10001F800, 0);
        }
        if (dword_10004B96C)
          ++dword_10004B970;
      }
    }
  }
}

void ppp_start_public_nat_port_mapping_timer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session && !*(_DWORD *)(session + 32) && !*(_DWORD *)(session + 36))
  {
    notice("starting wait-port-mapping timer for %s: %d secs", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(session + 8));
    timeout((int)sub_10001FDF0);
    *(_DWORD *)(session + 36) = 1;
  }
}

void sub_10001FDF0()
{
  void (*v0)(void);

  if (session && *(_DWORD *)session && *(_DWORD *)(session + 36))
  {
    *(_DWORD *)(session + 36) = 0;
    sys_log(3, "NAT's public interface down for more than %d secs... starting faster probe.\n", 20);
    v0 = *(void (**)(void))(session + 240);
    if (v0)
    {
      byte_10004B964 = 1;
      v0();
    }
  }
}

void ppp_stop_public_nat_port_mapping_timer()
{
  if (session && *(_DWORD *)session)
  {
    if (*(_DWORD *)(session + 36))
    {
      untimeout((uint64_t)sub_10001FDF0, 0);
      *(_DWORD *)(session + 36) = 0;
    }
  }
}

void ppp_block_public_nat_port_mapping_timer()
{
  if (session)
  {
    if (*(_DWORD *)session)
    {
      ppp_stop_public_nat_port_mapping_timer();
      *(_DWORD *)(session + 32) = 1;
    }
  }
}

void ppp_unblock_public_nat_port_mapping_timer()
{
  if (session)
  {
    if (*(_DWORD *)session)
      *(_DWORD *)(session + 32) = 0;
  }
}

uint64_t sys_setup_security_session()
{
  _BOOL8 v0;
  mach_port_t special_port[2];

  if (qword_10004B978 != -1)
    dispatch_once(&qword_10004B978, &stru_10003CB48);
  if (!byte_10004B975)
    return setup_security_context();
  *(_QWORD *)special_port = 0;
  if (qword_10004B988 != -1)
    dispatch_once(&qword_10004B988, &stru_10003CBB0);
  if (qword_10004B980)
  {
    v0 = 1;
    if (ne_session_copy_security_session_info(qword_10004B980, &special_port[1], special_port)
      && special_port[1]
      && special_port[0]
      && !task_set_special_port(mach_task_self_, 4, special_port[1]))
    {
      v0 = audit_session_join(special_port[0]) == 0;
    }
  }
  else
  {
    v0 = 1;
  }
  if (special_port[1])
    mach_port_deallocate(mach_task_self_, special_port[1]);
  if (special_port[0])
    mach_port_deallocate(mach_task_self_, special_port[0]);
  return v0;
}

void sub_10002004C(id a1)
{
  byte_10004B975 = getenv("NetworkExtension") != 0;
}

intptr_t sub_100020078(uint64_t a1, xpc_object_t object)
{
  if (object)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_retain(object);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000200B0(id a1)
{
  char *v1;
  uuid_t uu;

  v1 = getenv("NetworkExtension");
  if (v1)
  {
    memset(uu, 0, sizeof(uu));
    if (!uuid_parse(v1, uu))
      qword_10004B980 = ne_session_create(uu, 1);
  }
}

const char *tdb_error(uint64_t a1)
{
  uint64_t v1;
  int v2;
  const char *result;

  if (!a1)
    return "Invalid tdb context";
  v1 = 0;
  v2 = *(_DWORD *)(a1 + 40);
  result = "Invalid error code";
  while (v2 != dword_10003CC10[v1])
  {
    v1 += 4;
    if (v1 == 24)
      return result;
  }
  return *(const char **)&dword_10003CC10[v1 + 2];
}

uint64_t tdb_update(_DWORD *a1, char *a2, size_t a3, const void *a4, uint64_t a5)
{
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    return 0xFFFFFFFFLL;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v10 = 596579247 * a3;
  if (a3)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v10 += a2[v12++] << (v11 % 0x18);
      v11 += 5;
    }
    while (a3 > v12);
  }
  v13 = 1103515243 * v10 + 12345;
  sub_1000202E4((uint64_t)a1, v13 % a1[20]);
  v14 = sub_10002036C(a1, a2, a3, v13, (unsigned int *)&v18);
  if (!v14
    || a5 + a3 > v18
    || (v15 = v14, sub_100020468((uint64_t)a1, v14 + v19 + 24, a4, a5) == -1))
  {
    v16 = 0xFFFFFFFFLL;
  }
  else if (a5 == HIDWORD(v19))
  {
    v16 = 0;
  }
  else
  {
    HIDWORD(v19) = a5;
    v16 = sub_100020468((uint64_t)a1, v15, &v18, 0x18u);
  }
  sub_100020504((uint64_t)a1, v13 % a1[20]);
  return v16;
}

uint64_t sub_1000202E4(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (a2 < -1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a1 + 80) > a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (a2 + 1);
    v6 = *(_DWORD *)(v4 + 4 * v5);
    if (v6)
    {
LABEL_5:
      result = 0;
      *(_DWORD *)(v4 + 4 * v5) = v6 + 1;
      return result;
    }
    if (!sub_1000219A4((_DWORD *)a1, 4 * a2 + 1024, 1, 3, 9))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD *)(v4 + 4 * v5);
      goto LABEL_5;
    }
  }
  return 0xFFFFFFFFLL;
}

void *sub_10002036C(_DWORD *a1, const void *a2, size_t a3, unsigned int a4, unsigned int *a5)
{
  unsigned int v10;
  size_t v11;
  void *result;
  void *v13;
  int v14;
  unsigned int v15;

  v15 = 0;
  if (sub_1000214CC((uint64_t)a1, 4 * (a4 % a1[20]) + 44, &v15, 4u) != -1)
  {
    v10 = v15;
    if (v15)
    {
      while (sub_100020984(a1, v10, a5) != -1)
      {
        if (a5[4] == a4)
        {
          v11 = a5[2];
          if (a3 == v11)
          {
            result = sub_1000206B8((uint64_t)a1, v15 + 24, v11);
            if (!result)
              return result;
            v13 = result;
            v14 = memcmp(a2, result, a3);
            free(v13);
            if (!v14)
              return (void *)v15;
          }
        }
        v10 = a5[1];
        v15 = v10;
        if (!v10)
          return 0;
      }
    }
  }
  return 0;
}

uint64_t sub_100020468(uint64_t a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v9;

  if (sub_100021BD4((_DWORD *)a1, a4 + a2))
    return 0xFFFFFFFFLL;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    memcpy((void *)(v9 + a2), a3, a4);
  }
  else if (lseek(*(_DWORD *)(a1 + 16), a2, 0) != a2 || write(*(_DWORD *)(a1 + 16), a3, a4) != a4)
  {
    *(_DWORD *)(a1 + 40) = 2;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t sub_100020504(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (a2 < -1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a1 + 80) <= a2)
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (a2 + 1);
  v6 = *(_DWORD *)(v4 + 4 * v5);
  if (v6 == 1)
  {
    if (sub_1000219A4((_DWORD *)a1, 4 * a2 + 1024, 0, 3, 9))
      return 0xFFFFFFFFLL;
    v4 = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(v4 + 4 * v5);
  }
  else if (!v6)
  {
    *(_DWORD *)(a1 + 40) = 3;
    return 0xFFFFFFFFLL;
  }
  result = 0;
  *(_DWORD *)(v4 + 4 * v5) = v6 - 1;
  return result;
}

void *tdb_fetch(_DWORD *a1, char *a2, size_t a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v6 = 596579247 * a3;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v6 += a2[v8++] << (v7 % 0x18);
      v7 += 5;
    }
    while (a3 > v8);
  }
  v9 = 1103515243 * v6 + 12345;
  sub_1000202E4((uint64_t)a1, v9 % a1[20]);
  v10 = sub_10002036C(a1, a2, a3, v9, (unsigned int *)&v13);
  if (v10)
    v11 = sub_1000206B8((uint64_t)a1, v10 + v14 + 24, HIDWORD(v14));
  else
    v11 = 0;
  sub_100020504((uint64_t)a1, v9 % a1[20]);
  return v11;
}

void *sub_1000206B8(uint64_t a1, unsigned int a2, size_t size)
{
  unsigned int v3;
  void *v6;

  v3 = size;
  v6 = malloc_type_malloc(size, 0x229D7296uLL);
  if (v6)
  {
    if (sub_1000214CC(a1, a2, v6, v3) == -1)
    {
      free(v6);
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 40) = 4;
  }
  return v6;
}

_DWORD *tdb_exists(_DWORD *result, char *a2, size_t a3)
{
  _DWORD *v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  _QWORD v11[3];

  if (result)
  {
    v5 = result;
    memset(v11, 0, sizeof(v11));
    v6 = 596579247 * a3;
    if (a3)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v6 += a2[v8++] << (v7 % 0x18);
        v7 += 5;
      }
      while (a3 > v8);
    }
    v9 = 1103515243 * v6 + 12345;
    sub_1000202E4((uint64_t)result, v9 % result[20]);
    v10 = sub_10002036C(v5, a2, a3, v9, (unsigned int *)v11);
    sub_100020504((uint64_t)v5, v9 % v5[20]);
    return (_DWORD *)(v10 != 0);
  }
  return result;
}

uint64_t tdb_traverse(_DWORD *a1, unsigned int (*a2)(_DWORD *, char *, _QWORD, char *, _QWORD, uint64_t), uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a1[20])
    return 0;
  v6 = 0;
  v7 = 0;
  v15 = 0;
  v13 = 0;
  v14 = 0;
  v12 = 0;
  while (1)
  {
    sub_1000202E4((uint64_t)a1, v6);
    if (sub_1000214CC((uint64_t)a1, 4 * (v6 % a1[20]) + 44, &v15, 4u) == -1)
      break;
    v8 = v15;
    if (v15)
    {
      while (sub_100020984(a1, v8, (unsigned int *)&v12) != -1)
      {
        v9 = (char *)sub_1000206B8((uint64_t)a1, v15 + 24, (HIDWORD(v13) + v13));
        if (!v9)
          break;
        v10 = v9;
        v7 = (v7 + 1);
        if (a2 && a2(a1, v9, v13, &v9[v13], HIDWORD(v13), a3))
        {
          free(v10);
          goto LABEL_17;
        }
        free(v10);
        v8 = HIDWORD(v12);
        v15 = HIDWORD(v12);
        if (!HIDWORD(v12))
          goto LABEL_11;
      }
      break;
    }
LABEL_11:
    sub_100020504((uint64_t)a1, v6 % a1[20]);
    if (++v6 >= a1[20])
      return v7;
  }
  v7 = 0xFFFFFFFFLL;
LABEL_17:
  sub_100020504((uint64_t)a1, v6 % a1[20]);
  return v7;
}

uint64_t sub_100020984(_DWORD *a1, unsigned int a2, unsigned int *a3)
{
  uint64_t result;

  result = sub_1000214CC((uint64_t)a1, a2, a3, 0x18u);
  if ((_DWORD)result != -1)
  {
    if (a3[5] == 637606297)
    {
      if (sub_100021BD4(a1, a3[1]))
        return 0xFFFFFFFFLL;
      else
        return 0;
    }
    else
    {
      a1[10] = 1;
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void *tdb_firstkey(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  void *v5;
  uint64_t v7;
  size_t size;
  uint64_t v9;
  unsigned int v10;

  if (a1)
  {
    v10 = 0;
    if (a1[20])
    {
      v2 = 0;
      v7 = 0;
      size = 0;
      v3 = 44;
      v9 = 0;
      while (1)
      {
        sub_1000202E4((uint64_t)a1, v2);
        if (sub_1000214CC((uint64_t)a1, v3, &v10, 4u) == -1)
          break;
        v4 = v10;
        if (v10)
          goto LABEL_8;
        sub_100020504((uint64_t)a1, v2 % a1[20]);
        ++v2;
        v3 += 4;
        if (v2 >= a1[20])
        {
          v4 = v10;
          if (!v10)
            return 0;
LABEL_8:
          if (sub_100020984(a1, v4, (unsigned int *)&v7) != -1)
          {
            v5 = sub_1000206B8((uint64_t)a1, v10 + 24, size);
            sub_100020504((uint64_t)a1, v2 % a1[20]);
            return v5;
          }
          break;
        }
      }
      sub_100020504((uint64_t)a1, v2 % a1[20]);
    }
  }
  return 0;
}

void *tdb_nextkey(_DWORD *a1, char *a2, size_t a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  uint64_t v15;
  size_t size;
  uint64_t v17;
  unsigned int v18;

  if (a1)
  {
    v15 = 0;
    size = 0;
    v17 = 0;
    v6 = 596579247 * a3;
    if (a3)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v6 += a2[v8++] << (v7 % 0x18);
        v7 += 5;
      }
      while (a3 > v8);
    }
    v9 = 1103515243 * v6 + 12345;
    v10 = v9 % a1[20];
    sub_1000202E4((uint64_t)a1, v10);
    v18 = sub_10002036C(a1, a2, a3, v9, (unsigned int *)&v15);
    if (v18)
      v18 = HIDWORD(v15);
    while (!v18)
    {
      sub_100020504((uint64_t)a1, v10++);
      v11 = a1[20];
      if (v10 >= v11 - 1)
        return 0;
      v12 = 4 * (v10 % v11) + 44;
      sub_1000202E4((uint64_t)a1, v10);
      if (sub_1000214CC((uint64_t)a1, v12, &v18, 4u) == -1)
        goto LABEL_13;
    }
    if (sub_100020984(a1, v18, (unsigned int *)&v15) != -1)
    {
      v13 = sub_1000206B8((uint64_t)a1, v18 + 24, size);
      sub_100020504((uint64_t)a1, v10);
      return v13;
    }
LABEL_13:
    sub_100020504((uint64_t)a1, v10);
  }
  return 0;
}

uint64_t tdb_delete(_DWORD *a1, char *a2, size_t a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  __int128 v21;
  uint64_t v22;
  size_t size[2];
  uint64_t v24;
  unsigned int v25;

  if (!a1)
    return 0xFFFFFFFFLL;
  v25 = 0;
  size[1] = 0;
  v24 = 0;
  size[0] = 0;
  v22 = 0;
  v6 = 596579247 * a3;
  v21 = 0uLL;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v6 += a2[v8++] << (v7 % 0x18);
      v7 += 5;
    }
    while (a3 > v8);
  }
  v9 = 1103515243 * v6 + 12345;
  sub_1000202E4((uint64_t)a1, v9 % a1[20]);
  if (sub_1000214CC((uint64_t)a1, 4 * (v9 % a1[20]) + 44, &v25, 4u) != -1)
  {
    v10 = v25;
    if (v25)
    {
      v11 = 0;
      while (sub_100020984(a1, v10, (unsigned int *)size) != -1)
      {
        if (v9 == (_DWORD)v24 && a3 == LODWORD(size[1]))
        {
          v12 = sub_1000206B8((uint64_t)a1, v25 + 24, LODWORD(size[1]));
          if (!v12)
            break;
          v13 = v12;
          if (!memcmp(a2, v12, a3))
          {
            if (v11)
            {
              DWORD1(v21) = HIDWORD(size[0]);
              v17 = (char *)&v21;
              v18 = (uint64_t)a1;
              v19 = v11;
              v20 = 24;
            }
            else
            {
              v19 = 4 * (v9 % a1[20]) + 44;
              v18 = (uint64_t)a1;
              v17 = (char *)size + 4;
              v20 = 4;
            }
            if (sub_100020468(v18, v19, v17, v20) == -1)
            {
              free(v13);
              break;
            }
            sub_100020504((uint64_t)a1, v9 % a1[20]);
            sub_1000202E4((uint64_t)a1, -1);
            if (sub_1000214CC((uint64_t)a1, 0x28u, (char *)size + 4, 4u) != -1)
            {
              HIDWORD(v24) = -637606298;
              if (sub_100020468((uint64_t)a1, v25, size, 0x18u) != -1
                && sub_100020468((uint64_t)a1, 0x28u, &v25, 4u) != -1)
              {
                free(v13);
                v15 = 0;
                v14 = -1;
                goto LABEL_17;
              }
            }
            free(v13);
            v14 = -1;
            goto LABEL_16;
          }
          free(v13);
        }
        v11 = v25;
        v21 = *(_OWORD *)size;
        v22 = v24;
        v10 = HIDWORD(size[0]);
        v25 = HIDWORD(size[0]);
        if (!HIDWORD(size[0]))
          break;
      }
    }
  }
  v14 = v9 % a1[20];
LABEL_16:
  v15 = 0xFFFFFFFFLL;
LABEL_17:
  sub_100020504((uint64_t)a1, v14);
  return v15;
}

uint64_t tdb_store(uint64_t a1, char *a2, unint64_t a3, const void *a4, size_t a5, int a6)
{
  int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  unsigned int v17;
  unsigned int v18;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  size_t v26;
  char *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  char *v34;
  char *v35;
  __int128 v36;
  unsigned int v37;
  char *v38;
  int v39;
  unsigned int v41;
  __int128 v42;
  uint64_t v43;
  _QWORD v44[2];
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  unsigned int v50;
  char __buf;
  int v52;
  _QWORD v53[2];
  uint64_t v54;

  if (!a1)
    return 0xFFFFFFFFLL;
  v42 = 0uLL;
  v43 = 0;
  v12 = 596579247 * a3;
  if (a3)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      v12 += a2[v14++] << (v13 % 0x18);
      v13 += 5;
    }
    while (a3 > v14);
  }
  if (a6 == 2)
  {
    if (tdb_exists((_DWORD *)a1, a2, a3))
    {
      *(_DWORD *)(a1 + 40) = 5;
      return 0xFFFFFFFFLL;
    }
  }
  else if (!tdb_update((_DWORD *)a1, a2, a3, a4, a5))
  {
    return 0;
  }
  v50 = 0;
  v48 = 0uLL;
  v49 = 0;
  v46 = 0uLL;
  v47 = 0;
  v44[0] = 0;
  v44[1] = 0;
  v45 = 0;
  sub_1000202E4(a1, -1);
  if (sub_1000214CC(a1, 0x28u, &v50, 4u) != -1)
  {
    v41 = 1103515243 * v12 + 12345;
    v16 = a5 + a3;
    while (1)
    {
      v17 = v50;
      if (v50)
        break;
LABEL_21:
      v53[0] = 0;
      v53[1] = 0;
      v54 = 0;
      v52 = 0;
      __buf = 0;
      sub_1000202E4(a1, -1);
      sub_100021BD4((_DWORD *)a1, *(_DWORD *)(a1 + 20) + 1);
      v20 = *(_DWORD *)(a1 + 16);
      v21 = *(_DWORD *)(a1 + 20);
      v22 = 10 * (a5 + a3) + 240 + v21;
      if (v20 != -1)
      {
        lseek(v20, v22 | 0x1FFFu, 0);
        if (write(*(_DWORD *)(a1 + 16), &__buf, 1uLL) != 1)
          goto LABEL_35;
      }
      v23 = (v22 & 0xFFFFE000) - v21;
      LODWORD(v53[0]) = v23 + 8168;
      HIDWORD(v54) = -637606298;
      if (sub_1000214CC(a1, 0x28u, (char *)v53 + 4, 4u) == -1)
        goto LABEL_35;
      v24 = v23 + 0x2000;
      v25 = *(_DWORD *)(a1 + 16);
      v26 = (*(_DWORD *)(a1 + 20) + v23 + 0x2000);
      *(_DWORD *)(a1 + 20) = v26;
      if (v25 == -1)
      {
        *(_QWORD *)(a1 + 8) = malloc_type_realloc(*(void **)(a1 + 8), v26, 0xF2C7ABuLL);
        LODWORD(v26) = *(_DWORD *)(a1 + 20);
      }
      if (sub_100020468(a1, (int)v26 - v24, v53, 0x18u) == -1
        || (v52 = *(_DWORD *)(a1 + 20) - v24, sub_100020468(a1, 0x28u, &v52, 4u) == -1))
      {
LABEL_35:
        sub_100020504(a1, -1);
        goto LABEL_49;
      }
      sub_100020504(a1, -1);
      if (sub_1000214CC(a1, 0x28u, &v50, 4u) == -1)
        goto LABEL_49;
    }
    v18 = 0;
    while (sub_1000214CC(a1, v17, &v48, 0x18u) != -1 && HIDWORD(v49) == -637606298)
    {
      if (v48 >= v16)
      {
        if ((unint64_t)(a5 + a3) + 52 < v48)
        {
          LODWORD(v44[0]) = v48 - (v16 & 0xFFFFFFFC) - 28;
          HIDWORD(v44[0]) = DWORD1(v48);
          HIDWORD(v45) = -637606298;
          LODWORD(v48) = (v16 & 0xFFFFFFFC) + 4;
          DWORD1(v48) = (v16 & 0xFFFFFFFC) + v50 + 28;
          if (sub_100020468(a1, DWORD1(v48), v44, 0x18u) == -1
            || sub_100020468(a1, v50, &v48, 0x18u) == -1)
          {
            break;
          }
        }
        if (v18)
        {
          DWORD1(v46) = DWORD1(v48);
          v27 = (char *)&v46;
          v28 = a1;
          v29 = v18;
          v30 = 24;
        }
        else
        {
          v28 = a1;
          v29 = 40;
          v27 = (char *)&v48 + 4;
          v30 = 4;
        }
        if (sub_100020468(v28, v29, v27, v30) == -1)
          break;
        v15 = 0xFFFFFFFFLL;
        sub_100020504(a1, -1);
        v31 = v50;
        LODWORD(v53[0]) = v50;
        if (!v50)
          return v15;
        sub_1000202E4(a1, v41 % *(_DWORD *)(a1 + 80));
        if (a6 != 2)
          tdb_delete((_DWORD *)a1, a2, a3);
        if (sub_1000214CC(a1, v31, &v42, 0x18u) != -1 && HIDWORD(v43) == -637606298)
        {
          v32 = 4 * (v41 % *(_DWORD *)(a1 + 80)) + 44;
          if (sub_1000214CC(a1, v32, (char *)&v42 + 4, 4u) != -1)
          {
            *((_QWORD *)&v42 + 1) = __PAIR64__(a5, a3);
            LODWORD(v43) = 1103515243 * v12 + 12345;
            HIDWORD(v43) = 637606297;
            v33 = v16 + 24;
            v34 = (char *)malloc_type_malloc(v16 + 24, 0x69B34AF8uLL);
            if (v34)
            {
              v35 = v34;
              v36 = v42;
              *((_QWORD *)v34 + 2) = v43;
              *(_OWORD *)v34 = v36;
              v37 = v32;
              v38 = v34 + 24;
              memcpy(v34 + 24, a2, a3);
              memcpy(&v38[a3], a4, a5);
              v39 = sub_100020468(a1, v31, v35, v33);
              free(v35);
              if (v39 != -1 && sub_100020468(a1, v37, v53, 4u) != -1)
              {
                sub_100020504(a1, v41 % *(_DWORD *)(a1 + 80));
                return 0;
              }
            }
            else
            {
              *(_DWORD *)(a1 + 40) = 4;
            }
          }
        }
        sub_100020504(a1, v41 % *(_DWORD *)(a1 + 80));
        return 0xFFFFFFFFLL;
      }
      v46 = v48;
      v47 = v49;
      v18 = v50;
      v17 = DWORD1(v48);
      v50 = DWORD1(v48);
      if (!DWORD1(v48))
        goto LABEL_21;
    }
  }
LABEL_49:
  v15 = 0xFFFFFFFFLL;
  sub_100020504(a1, -1);
  return v15;
}

uint64_t sub_1000214CC(uint64_t a1, unsigned int a2, void *a3, unsigned int a4)
{
  uint64_t v9;

  if (sub_100021BD4((_DWORD *)a1, a4 + a2))
    return 0xFFFFFFFFLL;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    memcpy(a3, (const void *)(v9 + a2), a4);
  }
  else if (lseek(*(_DWORD *)(a1 + 16), a2, 0) != a2 || read(*(_DWORD *)(a1 + 16), a3, a4) != a4)
  {
    *(_DWORD *)(a1 + 40) = 2;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

_OWORD *tdb_open(char *a1, int a2, char a3, __int16 a4, unsigned int a5)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  stat v22;
  __int128 v23;
  __int128 __fd;
  _BYTE v25[56];
  _OWORD v26[4];
  _BYTE __buf[32];
  uint64_t v28;

  memset(&v22, 0, sizeof(v22));
  __fd = 0u;
  memset(v25, 0, sizeof(v25));
  LODWORD(__fd) = -1;
  v23 = 0uLL;
  if ((a4 & 3) != 1)
  {
    if (a2)
      v8 = a2;
    else
      v8 = 128;
    DWORD2(__fd) = (a4 & 3) == 0;
    if (a1)
    {
      v9 = open(a1, a4, a5);
      LODWORD(__fd) = v9;
      if (v9 == -1)
        goto LABEL_41;
      fcntl(v9, 2, 1);
    }
    sub_1000219A4(&v23, 0, 1, 3, 9);
    if ((a3 & 1) != 0 && !sub_1000219A4(&v23, 4u, 1, 3, 8))
    {
      ftruncate(__fd, 0);
      sub_1000219A4(&v23, 4u, 0, 3, 8);
    }
    sub_1000219A4(&v23, 4u, 1, 1, 9);
    if (read(__fd, &v25[12], 0x28uLL) == 40
      && !(*(_QWORD *)&v25[12] ^ 0x656C696620424454 | *(unsigned __int16 *)&v25[20] ^ 0xALL)
      && *(_DWORD *)&v25[44] == 637606248)
    {
      goto LABEL_14;
    }
    if ((a4 & 0x200) == 0)
    {
LABEL_41:
      if ((_QWORD)v23)
        free((void *)v23);
      goto LABEL_43;
    }
    memset(&__buf[10], 0, 22);
    strcpy(__buf, "TDB file\n");
    LODWORD(v28) = 637606248;
    HIDWORD(v28) = v8;
    lseek(__fd, 0, 0);
    ftruncate(__fd, 0);
    if ((_DWORD)__fd == -1 || write(__fd, __buf, 0x28uLL) == 40)
    {
      memset(v26, 0, sizeof(v26));
      if (v8 >= 15)
      {
        v10 = 0;
        v11 = 40;
        while ((_DWORD)__fd == -1 || write(__fd, v26, 0x40uLL) == 64)
        {
          v11 += 64;
          v10 -= 16;
          if (v8 + 16 + v10 <= 30)
          {
            v12 = -v10;
            goto LABEL_26;
          }
        }
        goto LABEL_40;
      }
      v12 = 0;
      v11 = 40;
LABEL_26:
      if (v12 <= v8)
      {
        v13 = v8 - v12 + 1;
        while ((_DWORD)__fd == -1 || write(__fd, v26, 4uLL) == 4)
        {
          v11 += 4;
          if (!--v13)
            goto LABEL_31;
        }
        goto LABEL_40;
      }
LABEL_31:
      v14 = __fd;
      if ((_DWORD)__fd != -1)
        goto LABEL_34;
      *((_QWORD *)&v23 + 1) = malloc_type_calloc(v11, 1uLL, 0xF41A3DF4uLL);
      DWORD1(__fd) = v11;
      if (*((_QWORD *)&v23 + 1))
      {
        *(_OWORD *)&v25[12] = *(_OWORD *)__buf;
        *(_OWORD *)&v25[28] = *(_OWORD *)&__buf[16];
        *(_QWORD *)&v25[44] = v28;
        v14 = __fd;
LABEL_34:
        lseek(v14, 0, 0);
        if ((_DWORD)__fd == -1)
          goto LABEL_37;
        if (read(__fd, &v25[12], 0x28uLL) == 40)
        {
LABEL_14:
          if ((_DWORD)__fd != -1)
          {
            fstat(__fd, &v22);
            *(_QWORD *)&v23 = strdup(a1);
            DWORD1(__fd) = v22.st_size;
          }
LABEL_37:
          *(_QWORD *)v25 = malloc_type_calloc((*(_DWORD *)&v25[48] + 1), 4uLL, 0x100004052888210uLL);
          if (*(_QWORD *)v25)
          {
            v15 = malloc_type_malloc(0x58uLL, 0x10900406C209894uLL);
            if (v15)
            {
              v16 = v15;
              v17 = __fd;
              *v15 = v23;
              v15[1] = v17;
              v18 = *(_OWORD *)v25;
              v19 = *(_OWORD *)&v25[16];
              v20 = *(_OWORD *)&v25[32];
              *((_QWORD *)v15 + 10) = *(_QWORD *)&v25[48];
              v15[3] = v19;
              v15[4] = v20;
              v15[2] = v18;
              sub_1000219A4(&v23, 0, 0, 3, 9);
              return v16;
            }
          }
          goto LABEL_41;
        }
        goto LABEL_41;
      }
    }
LABEL_40:
    *(_DWORD *)&v25[8] = 2;
    goto LABEL_41;
  }
LABEL_43:
  if ((_DWORD)__fd != -1)
    close(__fd);
  if (*((_QWORD *)&v23 + 1))
    munmap(*((void **)&v23 + 1), DWORD1(__fd));
  return 0;
}

uint64_t sub_1000219A4(_DWORD *a1, unsigned int a2, int a3, __int16 a4, int a5)
{
  int v6;
  uint64_t result;
  _QWORD v9[2];
  int v10;
  __int16 v11;
  __int16 v12;

  v6 = a1[4];
  if (v6 == -1)
    return 0;
  if (a1[6])
    return 0xFFFFFFFFLL;
  if (a3 != 1)
    a4 = 2;
  v11 = a4;
  v12 = 0;
  v9[0] = a2;
  v9[1] = 1;
  v10 = 0;
  result = fcntl(v6, a5, v9);
  if ((_DWORD)result)
  {
    a1[10] = 3;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t tdb_close(unsigned int *a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = *(void **)a1;
  if (v2)
    free(v2);
  v3 = a1[4];
  if (v3 != -1)
    close(v3);
  v4 = (void *)*((_QWORD *)a1 + 4);
  if (v4)
    free(v4);
  v5 = (void *)*((_QWORD *)a1 + 1);
  if (v5)
  {
    if (a1[4] == -1)
      free(v5);
    else
      munmap(v5, a1[5]);
  }
  *((_QWORD *)a1 + 10) = 0;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  free(a1);
  return 0;
}

uint64_t tdb_writelock(uint64_t a1)
{
  if (a1)
    return sub_1000202E4(a1, -1);
  else
    return 0xFFFFFFFFLL;
}

uint64_t tdb_writeunlock(uint64_t a1)
{
  if (a1)
    return sub_100020504(a1, -1);
  else
    return 0xFFFFFFFFLL;
}

uint64_t tdb_lockchain(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = 596579247 * a3;
  if (a3)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v3 += *(char *)(a2 + v5++) << (v4 % 0x18);
      v4 += 5;
    }
    while (a3 > v5);
  }
  return sub_1000202E4(a1, (1103515243 * v3 + 12345) % *(_DWORD *)(a1 + 80));
}

uint64_t tdb_unlockchain(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = 596579247 * a3;
  if (a3)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v3 += *(char *)(a2 + v5++) << (v4 % 0x18);
      v4 += 5;
    }
    while (a3 > v5);
  }
  return sub_100020504(a1, (1103515243 * v3 + 12345) % *(_DWORD *)(a1 + 80));
}

uint64_t sub_100021BD4(_DWORD *a1, unsigned int a2)
{
  int v3;
  uint64_t result;
  stat v6;

  if (a1[5] >= a2)
    return 0;
  v3 = a1[4];
  if (v3 == -1)
    return 0;
  memset(&v6, 0, sizeof(v6));
  fstat(v3, &v6);
  if (v6.st_size <= a2)
  {
    a1[10] = 2;
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    a1[5] = v6.st_size;
  }
  return result;
}

BOOL sub_100021C60(char *__s2, uint64_t a2, int a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  stat v13;
  _BYTE v14[1024];

  if (!*__s2)
    return 0;
  v4 = __s2;
  memset(&v13, 0, sizeof(v13));
  if (strncmp("/dev/", __s2, 5uLL))
  {
    __strlcpy_chk(v14, "/dev/", 1024, 1024);
    __strlcat_chk(v14, v4, 1024, 1024);
    v4 = v14;
  }
  if (stat(v4, &v13) < 0)
  {
    if (!a3)
      return *__error() != 2;
    option_error("Couldn't stat %s: %m", v5, v6, v7, v8, v9, v10, v11, (int)v4);
    return 0;
  }
  if ((v13.st_mode & 0xF000) != 0x2000)
  {
    if (a3)
      option_error("%s is not a character device", v5, v6, v7, v8, v9, v10, v11, (int)v4);
    return 0;
  }
  if (a3)
  {
    __strlcpy_chk(&devnam, v4, 1024, 1024);
    *(stat *)devstat = v13;
    default_device = 0;
  }
  return 1;
}

uint64_t sub_100021DE4(const char *a1, uint64_t a2, int a3)
{
  int v5;
  char *__endptr;

  __endptr = 0;
  v5 = strtol(a1, &__endptr, 0);
  if (__endptr == a1)
    return 0;
  if (*__endptr || v5 == 0)
    return 0;
  if (a3)
  {
    inspeed = v5;
    slprintf((int)&unk_10004B994, 16, "%d");
  }
  return 1;
}

uint64_t sub_100021E70()
{
  connect_script = 0;
  initializer = 0;
  disconnect_script = 0;
  default_device = 1;
  LOBYTE(devnam) = 0;
  inspeed = 0;
  return 1;
}

uint64_t sub_100021EB4()
{
  dword_10004792C |= 0xA0000u;
  byte_100047914 = 1;
  crtscts = -2;
  return 1;
}

uint64_t sub_100021EE8(const char **a1)
{
  const char *i;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  char *__endptr;

  i = *a1;
  if (**a1)
  {
    __endptr = 0;
    v2 = 1;
    while (1)
    {
      v3 = strtol(i, &__endptr, 16);
      v11 = __endptr;
      if (i == __endptr)
        break;
      if (v3 > 0xFF || v3 == 94)
      {
        option_error("can't escape character 0x%x", v4, v5, v6, v7, v8, v9, v10, v3);
        v2 = 0;
      }
      else
      {
        xmit_accm[v3 >> 5] |= 1 << v3;
      }
      for (i = v11; ; ++i)
      {
        v12 = *(unsigned __int8 *)i;
        if (v12 != 32 && v12 != 44)
          break;
      }
      if (!*i)
        goto LABEL_15;
    }
    option_error("escape parameter contains invalid hex number '%s'", v4, v5, v6, v7, v8, v9, v10, (int)i);
    return 0;
  }
  else
  {
    v2 = 1;
LABEL_15:
    dword_1000479B4 = xmit_accm[0];
  }
  return v2;
}

uint64_t sub_100021FF0(uint64_t a1, uint64_t (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  char v4;
  int v5;
  int v6;
  uint64_t result;

  v4 = 0;
  v5 = 0;
  do
  {
    while (1)
    {
      v6 = v5 == 125 ? 127 : v5;
      if (((xmit_accm[v6 >> 5] >> v6) & 1) == 0)
        break;
      if ((v4 & 1) != 0)
        a2(a3, ",");
      result = a2(a3, "%x", v6);
      v5 = v6 + 1;
      v4 = 1;
      if (v6 >= 255)
        return result;
    }
    v5 = v6 + 1;
  }
  while (v6 < 255);
  if ((v4 & 1) == 0)
    return a2(a3, "oops # nothing escaped");
  return result;
}

void tty_process_extra_options()
{
  BOOL v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  if (notty)
    v0 = 0;
  else
    v0 = ptycommand == 0;
  if (!v0)
  {
    using_pty = 1;
    return;
  }
  using_pty = pty_socket != 0;
  if (!pty_socket)
  {
    if (default_device)
    {
      if (!isatty(0) || (v8 = ttyname(0)) == 0)
      {
        option_error("no device specified and stdin is not a tty", v1, v2, v3, v4, v5, v6, v7, v16);
        goto LABEL_14;
      }
      __strlcpy_chk(&devnam, v8, 1024, 1024);
      if (stat((const char *)&devnam, (stat *)devstat) < 0)
        fatal("Couldn't stat default device %s: %m", v9, v10, v11, v12, v13, v14, v15, (int)&devnam);
    }
    if (options_for_tty())
      return;
LABEL_14:
    exit(2);
  }
}

uint64_t tty_check_options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  BOOL v10;
  BOOL v11;
  int v12;
  int v13;
  uint64_t result;
  char *v15;
  const char *v16;
  int v17;
  stat v18;

  if (demand)
    v8 = connect_script == 0;
  else
    v8 = 0;
  if (v8 && ptycommand == 0)
  {
    v15 = "connect script is required for demand-dialling\n";
    goto LABEL_50;
  }
  if (connect_script)
    v10 = 0;
  else
    v10 = holdoff_specified == 0;
  if (v10)
    holdoff = 0;
  memset(&v18, 0, sizeof(v18));
  if (using_pty)
  {
    if (!default_device)
    {
      if (notty)
        v16 = "notty";
      else
        v16 = "pty";
      option_error("%s option precludes specifying device name", a2, a3, a4, a5, a6, a7, a8, (int)v16);
LABEL_51:
      exit(2);
    }
    if (ptycommand && notty)
    {
      v15 = "pty option is incompatible with notty option";
    }
    else
    {
      if (ptycommand)
        v11 = 0;
      else
        v11 = notty == 0;
      v12 = !v11;
      if (!pty_socket || !v12)
      {
        default_device = notty;
        lockflag = 0;
        modem = 0;
        if (notty && log_to_fd <= 1)
          log_to_fd = -1;
        goto LABEL_35;
      }
      v15 = "socket option is incompatible with pty and notty";
    }
LABEL_50:
    option_error(v15, a2, a3, a4, a5, a6, a7, a8, v17);
    goto LABEL_51;
  }
  if ((fstat(0, &v18) & 0x80000000) == 0 && (v18.st_mode & 0xF000) == 0x2000 && v18.st_rdev == *(_DWORD *)&devstat[24])
  {
    default_device = 1;
    v13 = fcntl(0, 3);
    if (v13 != -1 && (v13 & 3) == 2)
      privopen = 1;
  }
LABEL_35:
  if (default_device)
    nodetach = 1;
  result = log_to_fd;
  if ((log_to_fd & 0x80000000) == 0)
  {
    result = fstat(log_to_fd, &v18);
    if ((result & 0x80000000) == 0 && (v18.st_mode & 0xF000) == 0x2000 && v18.st_rdev == *(_DWORD *)&devstat[24])
      log_to_fd = -1;
  }
  return result;
}

uint64_t connect_tty(_DWORD *a1)
{
  _DWORD *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
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
  BOOL v41;
  int v42;
  int v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  int v55;
  const char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  int v67;
  unsigned __int16 v68;
  in_addr_t v69;
  hostent *v70;
  uint64_t v71;
  uint64_t v72;
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
  uint64_t v86;
  char *v87;
  int v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
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
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
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
  unsigned int v161;
  int v162;
  const void *v163;
  stat v164;
  sockaddr v165;
  char *__endptr;

  *a1 = -1;
  __strlcpy_chk(ppp_devnam, &devnam, 1024, 1024);
  dword_10004B9A8 = -1;
  v2 = &unk_10004B000;
  dword_10004B9AC = -1;
  dword_10004B9A4 = -1;
  if (using_pty)
    v3 = 0;
  else
    v3 = record_file == 0;
  if (!v3)
  {
    if (!get_pty(&dword_10004B9A8, &dword_10004B9AC, ppp_devnam, uid))
    {
      error("Couldn't allocate pseudo-tty", v4, v5, v6, v7, v8, v9, v10, v161);
      v14 = 1;
      goto LABEL_56;
    }
    clocal = 1;
    set_up_tty(dword_10004B9AC, 1);
  }
  if (lockflag && !privopen)
  {
    if ((lock((char *)&devnam) & 0x80000000) != 0)
    {
      v14 = 6;
      goto LABEL_56;
    }
    locked = 1;
  }
  hungup = 0;
  do_modem_hungup = 0;
  if (redialingalternate && (v11 = altconnect_script) != 0)
  {
    v12 = altconnect_data;
    v13 = altconnect_data_len;
  }
  else if (doing_callback)
  {
    v12 = 0;
    v13 = 0;
    v11 = callback_script;
  }
  else
  {
    v11 = connect_script;
    v12 = connect_data;
    v13 = connect_data_len;
  }
  memset(&v164, 0, sizeof(v164));
  if (!(_BYTE)devnam)
  {
LABEL_60:
    if (kill_link)
      return 0xFFFFFFFFLL;
    *(_DWORD *)status = 9;
    if (ptycommand)
    {
      if (record_file)
      {
        if (pipe((int *)&v165) < 0 || pipe((int *)&__endptr) < 0)
          fatal("Couldn't create pipes for record option: %m", v47, v48, v49, v50, v51, v52, v53, v161);
        fcntl(*(int *)&v165.sa_len, 2, 1);
        v161 = 1;
        fcntl(SHIDWORD(__endptr), 2);
        v54 = &unk_100049000;
        if (device_script(ptycommand, (int)__endptr, *(int *)&v165.sa_data[2], 1, 0xFFFFFFFF, 0, 0))
        {
          close(*(int *)&v165.sa_len);
          close(*(int *)&v165.sa_data[2]);
          close((int)__endptr);
          v55 = HIDWORD(__endptr);
LABEL_69:
          close(v55);
          return 0xFFFFFFFFLL;
        }
        v163 = (const void *)v12;
        v88 = sub_10002339C(*(unsigned int *)&v165.sa_len, SHIDWORD(__endptr));
        close(*(int *)&v165.sa_len);
        close(*(int *)&v165.sa_data[2]);
        close((int)__endptr);
        close(SHIDWORD(__endptr));
        if (!v88)
          return 0xFFFFFFFFLL;
      }
      else
      {
        v163 = (const void *)v12;
        notify((uint64_t **)connectscript_started_notify, 0);
        v45 = 0xFFFFFFFFLL;
        if ((device_script(ptycommand, dword_10004B9A8, dword_10004B9A8, 1, 0xFFFFFFFF, 0, 0) & 0x80000000) != 0)
          return v45;
        dword_10004B9B0 = v2[619];
        close(dword_10004B9A8);
        dword_10004B9A8 = -1;
        if (pty_delay)
        {
          if ((int)wait_input_fd(dword_10004B9B0, pty_delay) < 1)
            return v45;
        }
        notify((uint64_t **)connectscript_finished_notify, 0);
        v54 = (_QWORD *)&unk_100049000;
      }
      goto LABEL_95;
    }
    v163 = (const void *)v12;
    v56 = (const char *)pty_socket;
    if (!pty_socket)
    {
      if (notty)
      {
        v54 = (_QWORD *)&unk_100049000;
        if (!sub_10002339C(0, 1))
          return 0xFFFFFFFFLL;
      }
      else
      {
        v54 = (_QWORD *)&unk_100049000;
        if (record_file && !sub_10002339C(dword_10004B9B0, dword_10004B9B0))
          return 0xFFFFFFFFLL;
      }
      goto LABEL_95;
    }
    __endptr = 0;
    v57 = strchr((char *)pty_socket, 58);
    if (!v57
      || (v65 = v57, v66 = v57 + 1, v67 = strtol(v57 + 1, &__endptr, 10), v65 == v56)
      || v67 < 0
      || __endptr == v66)
    {
      v87 = "Can't parse host:port for socket destination";
    }
    else
    {
      v68 = v67;
      *v65 = 0;
      v69 = inet_addr(v56);
      if (v69 == -1)
      {
        v70 = gethostbyname(v56);
        if (!v70)
        {
          error("%s: unknown host in socket option", v71, v72, v73, v74, v75, v76, v77, (int)v56);
          *v65 = 58;
          return 0xFFFFFFFFLL;
        }
        v69 = **(_DWORD **)v70->h_addr_list;
      }
      *v65 = 58;
      v78 = socket(2, 1, 0);
      if ((v78 & 0x80000000) == 0)
      {
        v79 = v78;
        *(_QWORD *)&v165.sa_len = 512;
        *(_QWORD *)&v165.sa_data[6] = 0;
        *(_WORD *)v165.sa_data = htons(v68);
        *(_DWORD *)&v165.sa_data[2] = v69;
        if (connect(v79, &v165, 0x10u) < 0)
        {
          error("Can't connect to %s: %m", v80, v81, v82, v83, v84, v85, v86, (int)v56);
          v55 = v79;
          goto LABEL_69;
        }
        v54 = (_QWORD *)&unk_100049000;
        if (!sub_10002339C(v79, v79))
          return 0xFFFFFFFFLL;
LABEL_95:
        if (v11)
        {
          v89 = (_BYTE *)initializer;
          if (!*(_BYTE *)v11 && !initializer)
            goto LABEL_134;
        }
        else
        {
          v89 = (_BYTE *)initializer;
          if (!initializer)
          {
            v11 = 0;
            goto LABEL_134;
          }
        }
        if (dword_10004B9A4 != -1 && !default_device && modem)
        {
          setdtr(dword_10004B9A4, 0);
          sleep(1u);
          setdtr(dword_10004B9A4, 1);
          v89 = (_BYTE *)initializer;
        }
        if (v89 && *v89)
        {
          if (kill_link)
            return 0xFFFFFFFFLL;
          notify((uint64_t **)initscript_started_notify, 0);
          v90 = device_script(initializer, dword_10004B9B0, dword_10004B9B0, 0, 0xFFFFFFFF, 0, 0);
          if ((_DWORD)v90)
          {
            error("Initializer script failed", v91, v92, v93, v94, v95, v96, v97, v161);
            v98 = 18;
LABEL_123:
            *(_DWORD *)status = v98;
            return 0xFFFFFFFFLL;
          }
          if (kill_link)
          {
            disconnect_tty(v90, v91, v92, v93, v94, v95, v96, v97, v161);
            return 0xFFFFFFFFLL;
          }
          notify((uint64_t **)initscript_finished_notify, 0);
          info("Serial port initialized.", v99, v100, v101, v102, v103, v104, v105, v161);
        }
        if (v11 && *(_BYTE *)v11)
        {
          if (kill_link)
            return 0xFFFFFFFFLL;
          notify((uint64_t **)connectscript_started_notify, 0);
          v106 = device_script(v11, dword_10004B9B0, dword_10004B9B0, 0, connector_uid, v163, v13);
          *a1 = v106;
          if (v106)
          {
            if (cancelcode == -1 || v106 != cancelcode)
            {
              error("Connect script failed", v107, v108, v109, v110, v111, v112, v113, v161);
              v98 = 8;
              goto LABEL_123;
            }
            goto LABEL_161;
          }
          if (kill_link)
            return 4294967294;
          notify((uint64_t **)connectscript_finished_notify, 0);
          info("Serial connection established.", v114, v115, v116, v117, v118, v119, v120, v161);
          if (link_up_hook && !link_up_hook())
            goto LABEL_161;
          link_up_done = 1;
        }
        if (dword_10004B9A4 != -1)
        {
          *(_DWORD *)&v165.sa_len = 0;
          if (ioctl(dword_10004B9A4, 0x4004746AuLL, &v165) != -1 && (v165.sa_len & 0x40) != 0)
          {
            clocal = 0;
            set_up_tty_local(dword_10004B9A4, 0);
          }
        }
        if (doing_callback == 1)
          v11 = 0;
LABEL_134:
        if (!v11 && modem && (_BYTE)devnam)
        {
          ioctl(dword_10004B9B0, 0x2000740EuLL, 0);
          while (1)
          {
            v121 = open((const char *)&devnam, 2);
            if ((v121 & 0x80000000) == 0)
              break;
            if (*__error() != 4)
            {
              error("Failed to reopen %s: %m", v122, v123, v124, v125, v126, v127, v128, (int)&devnam);
              *(_DWORD *)status = 7;
            }
            if (!persist)
              return 0xFFFFFFFFLL;
            v45 = 0xFFFFFFFFLL;
            if (*__error() == 4 && !hungup && kill_link == 0)
              continue;
            return v45;
          }
          v130 = v121;
          if (ioctl(v121, 0x2000740DuLL, 0) < 0)
          {
            error("Failed to reacquire the port %s exclusively: %m", v131, v132, v133, v134, v135, v136, v137, (int)&devnam);
            *(_DWORD *)status = 7;
            v55 = v130;
            goto LABEL_69;
          }
          close(v130);
          v54 = &unk_100049000;
        }
        v162 = baud_rate;
        slprintf((int)&v165, 16, "%d");
        script_setenv("SPEED", (const char *)&v165);
        if (!terminal_window_hook && (!terminal_script || !*(_BYTE *)terminal_script))
        {
LABEL_164:
          if (welcomer
            && *(_BYTE *)welcomer
            && device_script(welcomer, dword_10004B9B0, dword_10004B9B0, 0, 0xFFFFFFFF, 0, 0))
          {
            warning("Welcome script failed", v154, v155, v156, v157, v158, v159, v160, v162);
          }
          if (v11 | v54[400])
            listen_time = connect_delay;
          return dword_10004B9B0;
        }
        if (!kill_link)
        {
          notify((uint64_t **)terminalscript_started_notify, 0);
          if (terminal_window_hook)
            v138 = terminal_window_hook(terminal_script, dword_10004B9B0, dword_10004B9B0);
          else
            v138 = device_script(terminal_script, dword_10004B9B0, dword_10004B9B0, 0, 0xFFFFFFFF, (const void *)terminal_data, terminal_data_len);
          *a1 = v138;
          if (v138)
          {
            if (cancelcode == -1 || v138 != cancelcode)
            {
              error("Terminal script failed", v139, v140, v141, v142, v143, v144, v145, v162);
              v146 = 20;
              goto LABEL_173;
            }
LABEL_161:
            v146 = 5;
LABEL_173:
            *(_DWORD *)status = v146;
            return 4294967294;
          }
          if (!kill_link)
          {
            notify((uint64_t **)terminalscript_finished_notify, 0);
            info("Terminal connection established.", v147, v148, v149, v150, v151, v152, v153, v162);
            goto LABEL_164;
          }
        }
        return 4294967294;
      }
      v87 = "Can't create socket: %m";
    }
    error(v87, v58, v59, v60, v61, v62, v63, v64, v161);
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    if (privopen)
      v15 = 0;
    else
      v15 = word_1000452F0 < 100;
    v16 = v15;
    if (v16 == 1)
      seteuid(uid);
    dword_10004B9B0 = open((const char *)&devnam, 6, 0);
    v17 = *__error();
    if (v16)
      seteuid(0);
    if ((dword_10004B9B0 & 0x80000000) == 0)
    {
      v161 = 0;
      if (ioctl(dword_10004B9B0, 0x2000740DuLL) < 0)
      {
        v17 = *__error();
        goto LABEL_33;
      }
      dword_10004B9A4 = dword_10004B9B0;
      v25 = fcntl(dword_10004B9B0, 3);
      if (v25 == -1 || (v161 = v25 & 0xFFFFFFFB, fcntl(dword_10004B9B0, 4) < 0))
        warning("Couldn't reset non-blocking mode on device: %m", v26, v27, v28, v29, v30, v31, v32, v161);
      if (fstat(dword_10004B9B0, &v164) < 0 || fchmod(dword_10004B9B0, v164.st_mode & 0xFFED) < 0)
        warning("Couldn't restrict write permissions to %s: %m", v33, v34, v35, v36, v37, v38, v39, (int)&devnam);
      else
        tty_mode = v164.st_mode;
      if (v11)
      {
        v40 = initializer;
        if (*(_BYTE *)v11)
          v41 = 0;
        else
          v41 = initializer == 0;
        v42 = !v41;
        clocal = v42;
        v43 = dword_10004B9B0;
        if (*(_BYTE *)v11)
        {
          v44 = 1;
          v2 = (_DWORD *)&unk_10004B000;
LABEL_59:
          set_up_tty(v43, v44);
          goto LABEL_60;
        }
      }
      else
      {
        v40 = initializer;
        clocal = initializer != 0;
        v43 = dword_10004B9B0;
      }
      v2 = &unk_10004B000;
      v44 = v40 != 0;
      goto LABEL_59;
    }
LABEL_33:
    *__error() = v17;
    if (v17 != 4)
      break;
    if (!persist)
      return 0xFFFFFFFFLL;
  }
  if (dword_10004B9B0 < 0)
  {
    error("Failed to open %s: %m", v18, v19, v20, v21, v22, v23, v24, (int)&devnam);
  }
  else
  {
    error("Failed to acquire %s in exclusive mode : %m", v18, v19, v20, v21, v22, v23, v24, (int)&devnam);
    close(dword_10004B9B0);
    dword_10004B9B0 = -1;
  }
  v14 = 7;
LABEL_56:
  *(_DWORD *)status = v14;
  return 0xFFFFFFFFLL;
}

void disconnect_tty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (disconnect_script)
    v9 = hungup == 0;
  else
    v9 = 0;
  if (v9)
  {
    if ((dword_10004B9A4 & 0x80000000) == 0)
      clocal = 1;
    set_up_tty_local(dword_10004B9A4, 1);
    if (device_script(disconnect_script, dword_10004B9B0, dword_10004B9B0, 0, disconnector_uid, (const void *)disconnect_data, disconnect_data_len))warning("disconnect script failed", v10, v11, v12, v13, v14, v15, v16, a9);
    else
      info("Serial link disconnected.", v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

void tty_do_send_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  int v12;

  v8 = a4;
  v9 = a3;
  v10 = a2;
  tty_set_xaccm((uint64_t)xmit_accm, a2, a3, a4, a5, a6, a7, a8, v12);
  tty_send_config(a1, v10, v9, v8);
}

uint64_t cleanup_tty()
{
  uint64_t v0;
  BOOL v1;
  uint64_t result;

  v0 = dword_10004B9A4;
  if ((dword_10004B9A4 & 0x80000000) == 0)
  {
    if (default_device)
      v1 = 1;
    else
      v1 = modem == 0;
    if (!v1)
    {
      setdtr(dword_10004B9A4, 0);
      sleep(1u);
      v0 = dword_10004B9A4;
    }
    restore_tty(v0);
    if ((unsigned __int16)tty_mode != 0xFFFF && fchmod(dword_10004B9A4, tty_mode))
      chmod((const char *)&devnam, tty_mode);
    close(dword_10004B9A4);
    dword_10004B9A4 = -1;
  }
  result = tty_close_fds();
  if (locked)
  {
    result = unlock();
    locked = 0;
  }
  return result;
}

uint64_t tty_close_fds()
{
  uint64_t result;

  if ((dword_10004B9A8 & 0x80000000) == 0)
    close(dword_10004B9A8);
  if ((dword_10004B9AC & 0x80000000) == 0)
    close(dword_10004B9AC);
  result = dword_10004B9A4;
  if ((dword_10004B9A4 & 0x80000000) == 0)
  {
    result = close(dword_10004B9A4);
    dword_10004B9A4 = -1;
  }
  return result;
}

_QWORD *tty_init()
{
  _QWORD *result;

  add_notifier(&pidchange, (uint64_t)sub_1000232D4, 0);
  result = add_notifier(&sigreceived, (uint64_t)sub_1000232EC, 0);
  dword_10004B9A4 = -1;
  the_channel = (uint64_t)&tty_channel;
  dword_100049CF0 = 1610612736;
  return result;
}

uint64_t sub_1000232D4()
{
  uint64_t result;

  if (locked)
    return relock();
  return result;
}

void sub_1000232EC(uint64_t a1, uint64_t a2)
{
  int v3;

  v3 = 0;
  if (a2 == 1 && dword_10004B9A4 != -1 && phase != 12)
  {
    ioctl(dword_10004B9A4, 0x4004746AuLL, &v3);
    if (!clocal && (v3 & 0x40) == 0)
    {
      hungup = 1;
      do_modem_hungup = 1;
      if ((phase - 11) <= 0xFFFFFFFD)
        *(_DWORD *)status = 16;
    }
  }
}

uint64_t sub_10002339C(uint64_t a1, int a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  gid_t v21;
  int v22;

  v4 = safe_fork();
  if (v4 == -1)
  {
    error("Can't fork process for character shunt: %m", v5, v6, v7, v8, v9, v10, v11, v22);
    return 0;
  }
  else
  {
    v12 = v4;
    if (!v4)
    {
      close(dword_10004B9AC);
      setuid(uid);
      if (getuid() == uid)
      {
        v21 = getgid();
        setgid(v21);
        sys_close();
        if (!nodetach)
          log_to_fd = -1;
        sub_1000234C8(a1, a2, (const char *)record_file);
      }
      fatal("setuid failed", v14, v15, v16, v17, v18, v19, v20, v22);
    }
    charshunt_pid = v4;
    add_notifier(&sigreceived, (uint64_t)sub_100023F40, 0);
    close(dword_10004B9A8);
    dword_10004B9A8 = -1;
    dword_10004B9B0 = dword_10004B9AC;
    record_child(v12, (uint64_t)"pppd (charshunt)", (uint64_t)sub_100023F64, 0);
    return 1;
  }
}

void sub_1000234C8(uint64_t a1, int a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FILE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
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
  uint64_t v35;
  const char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  unint64_t tv_sec;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  BOOL v53;
  BOOL v54;
  int v55;
  int v56;
  __int32_t *v57;
  int v58;
  timeval *v59;
  int v60;
  __int32_t *v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  _BOOL4 v73;
  int v75;
  BOOL v76;
  int v77;
  int v78;
  FILE *v79;
  ssize_t v80;
  ssize_t v81;
  _WORD *v82;
  ssize_t v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int *v93;
  int v94;
  ssize_t v95;
  int v96;
  unsigned int v97;
  int v98;
  int v99;
  unsigned int v100;
  ssize_t v101;
  char *v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  _WORD *v109;
  int *v110;
  ssize_t v111;
  FILE *v112;
  ssize_t v113;
  __int32_t *v114;
  int v115;
  __int32_t *v116;
  int v117;
  timeval v119;
  uint64_t v120;
  uint64_t v121;
  timeval v122;
  timeval v123;
  fd_set v124;
  fd_set v125;

  signal(1, (void (__cdecl *)(int))1);
  signal(2, 0);
  signal(15, 0);
  signal(20, 0);
  signal(30, 0);
  signal(31, 0);
  signal(6, 0);
  signal(14, 0);
  signal(8, 0);
  signal(4, 0);
  signal(13, 0);
  signal(3, 0);
  signal(11, 0);
  signal(10, 0);
  signal(7, 0);
  signal(27, 0);
  signal(12, 0);
  signal(5, 0);
  signal(26, 0);
  signal(24, 0);
  signal(25, 0);
  if ((int)a1 > 1023 || a2 > 1023 || dword_10004B9A8 >= 1024)
    fatal("internal error: file descriptor too large (%d, %d, %d)", v5, v6, v7, v8, v9, v10, v11, a1);
  if (a3)
  {
    v12 = fopen(a3, "a");
    if (!v12)
      error("Couldn't create record file %s: %m", v13, v14, v15, v16, v17, v18, v19, (int)a3);
  }
  else
  {
    v12 = 0;
  }
  v20 = fcntl(dword_10004B9A8, 3);
  if (v20 == -1 || (v103 = v20 | 4, fcntl(dword_10004B9A8, 4) == -1))
    warning("couldn't set pty master to nonblock: %m", v21, v22, v23, v24, v25, v26, v27, v103);
  v28 = fcntl(a1, 3);
  if (v28 == -1 || (v104 = v28 | 4, fcntl(a1, 4) == -1))
  {
    v36 = "tty";
    if (!(_DWORD)a1)
      v36 = "stdin";
    warning("couldn't set %s to nonblock: %m", v29, v30, v31, v32, v33, v34, v35, (int)v36);
  }
  if (a2 != (_DWORD)a1)
  {
    v37 = fcntl(a2, 3);
    if (v37 == -1 || (v104 = v37 | 4, fcntl(a2, 4) == -1))
      warning("couldn't set stdout to nonblock: %m", v38, v39, v40, v41, v42, v43, v44, v104);
  }
  memset(&v125, 0, sizeof(v125));
  memset(&v124, 0, sizeof(v124));
  v122.tv_sec = 0;
  *(_QWORD *)&v122.tv_usec = 0;
  v120 = 0;
  v121 = 0;
  gettimeofday(&v122, 0);
  if (max_data_rate)
  {
    v45 = max_data_rate / 10;
    if (max_data_rate / 10 <= 100)
      v45 = 100;
  }
  else
  {
    v45 = 1505;
  }
  v107 = v45;
  v123.tv_sec = 0;
  *(_QWORD *)&v123.tv_usec = 0;
  v46 = dword_10004B9A8;
  if (dword_10004B9A8 <= a2)
    v46 = a2;
  v47 = v46 + 1;
  if (v12)
  {
    gettimeofday(&v123, 0);
    putc(7, v12);
    tv_sec = v123.tv_sec;
    putc((unint64_t)v123.tv_sec >> 24, v12);
    putc(tv_sec >> 16, v12);
    putc(tv_sec >> 8, v12);
    putc(tv_sec, v12);
    v123.tv_usec = 0;
  }
  v112 = v12;
  v113 = 0;
  v49 = 0;
  v50 = 0;
  v105 = 0;
  v106 = 0;
  v110 = 0;
  v111 = 0;
  v109 = 0;
  v115 = 1 << a1;
  v114 = &v125.fds_bits[(unint64_t)(int)a1 >> 5];
  v117 = 1 << a2;
  v116 = &v124.fds_bits[(unint64_t)a2 >> 5];
  v51 = 1;
  v52 = 1;
  v53 = 1;
  v54 = 1;
  v108 = 0x100000001;
  while (1)
  {
    v120 = 0;
    LODWORD(v121) = 10000;
    memset(&v125, 0, sizeof(v125));
    memset(&v124, 0, sizeof(v124));
    if (!v50)
      break;
    if (v52)
    {
      v55 = dword_10004B9A8;
      if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v124, 0))
      {
        v56 = 1 << v55;
        v57 = &v124.fds_bits[(unint64_t)v55 >> 5];
LABEL_36:
        v59 = 0;
        *v57 |= v56;
        if (v49)
          goto LABEL_39;
        goto LABEL_43;
      }
      goto LABEL_38;
    }
    v59 = (timeval *)&v120;
    if (v49)
    {
LABEL_39:
      if (!v51)
      {
        v59 = (timeval *)&v120;
        goto LABEL_49;
      }
      v60 = __darwin_check_fd_set_overflow(a2, &v124, 0);
      v61 = &v124.fds_bits[(unint64_t)a2 >> 5];
      v62 = 1 << a2;
      if (!v60)
        goto LABEL_49;
      goto LABEL_46;
    }
LABEL_43:
    if (v54)
    {
      v63 = a1;
      v64 = dword_10004B9A8;
      if (!__darwin_check_fd_set_overflow(dword_10004B9A8, &v125, 0))
      {
        a1 = v63;
        goto LABEL_49;
      }
      v62 = 1 << v64;
      v61 = &v125.fds_bits[(unint64_t)v64 >> 5];
      a1 = v63;
LABEL_46:
      *v61 |= v62;
    }
LABEL_49:
    if (select(v47, &v125, &v124, 0, v59) < 0)
    {
      if (*__error() != 4)
        fatal("select", v65, v66, v67, v68, v69, v70, v71, v104);
    }
    else
    {
      if (max_data_rate)
      {
        v119.tv_sec = 0;
        *(_QWORD *)&v119.tv_usec = 0;
        gettimeofday(&v119, 0);
        v72 = (int)(((double)(v119.tv_usec - v122.tv_usec) / 1000000.0 + (double)(v119.tv_sec - v122.tv_sec))
                  * (double)max_data_rate);
        v73 = v72 < 0;
        if (v105 < v72 || v72 < 0)
          v75 = 0;
        else
          v75 = v105 - v72;
        v76 = __OFSUB__(v106, v72);
        v77 = v106 - v72;
        if (v77 < 0 != v76)
          v73 = 1;
        if (v73)
          v78 = 0;
        else
          v78 = v77;
        v122 = v119;
      }
      else
      {
        v75 = 0;
        v78 = 0;
      }
      v79 = v112;
      v80 = v113;
      v81 = v111;
      v82 = v109;
      if (__darwin_check_fd_set_overflow(a1, &v125, 0) && (*v114 & v115) != 0)
      {
        v83 = read(a1, &inpacket_buf, 0x5E0uLL);
        v81 = v83;
        if ((v83 & 0x80000000) != 0)
        {
          if (*__error() != 5)
          {
            if (*__error() != 4 && *__error() != 35)
            {
              v102 = "Error reading standard input: %m";
LABEL_136:
              error(v102, v86, v87, v88, v89, v90, v91, v92, v104);
LABEL_131:
              exit(0);
            }
            v81 = 0;
            goto LABEL_85;
          }
        }
        else if ((_DWORD)v83)
        {
          v84 = dword_10004B9A8;
          if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v124, 0))
            *(__int32_t *)((char *)v124.fds_bits + (((unint64_t)v84 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v84;
          if (v112)
          {
            v85 = sub_100023F70(v112, 2, &inpacket_buf, v81, &v123);
LABEL_78:
            if (!v85)
              v79 = 0;
          }
          goto LABEL_85;
        }
        write(dword_10004B9A8, &inpacket_buf, 0);
        if (v112)
        {
          v85 = sub_100023F70(v112, 4, 0, 0, &v123);
          v81 = 0;
          LODWORD(v108) = 0;
          goto LABEL_78;
        }
        v81 = 0;
        LODWORD(v108) = 0;
LABEL_85:
        v82 = &inpacket_buf;
      }
      v93 = v110;
      v94 = dword_10004B9A8;
      if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v125, 0)
        && ((*(unsigned int *)((char *)v125.fds_bits + (((unint64_t)v94 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v94) & 1) != 0)
      {
        v95 = read(dword_10004B9A8, &outpacket_buf, 0x5E0uLL);
        v80 = v95;
        if ((v95 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
LABEL_97:
            close(a2);
            if (v79)
            {
              v81 = 0;
              v80 = 0;
              v108 = 0;
              if (!sub_100023F70(v79, 3, 0, 0, &v123))
                v79 = 0;
            }
            else
            {
              v81 = 0;
              v80 = 0;
              v108 = 0;
            }
          }
          else
          {
            if (*__error() != 4 && *__error() != 35)
            {
              v102 = "Error reading pseudo-tty master: %m";
              goto LABEL_136;
            }
            v80 = 0;
          }
LABEL_105:
          v93 = &outpacket_buf;
          goto LABEL_106;
        }
        if (!(_DWORD)v95)
          goto LABEL_97;
        if (__darwin_check_fd_set_overflow(a2, &v124, 0))
          *v116 |= v117;
        if (!v79)
          goto LABEL_105;
        v93 = &outpacket_buf;
        if (!sub_100023F70(v79, 1, &outpacket_buf, v80, &v123))
          v79 = 0;
      }
LABEL_106:
      if (__darwin_check_fd_set_overflow(a2, &v124, 0) && (*v116 & v117) != 0)
      {
        if ((int)v80 + v78 <= v107)
          v96 = v80;
        else
          v96 = v107 - v78;
        v97 = write(a2, v93, v96);
        if ((v97 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
            v80 = 0;
            HIDWORD(v108) = 0;
          }
          else if (*__error() != 35 && *__error() != 4)
          {
            v102 = "Error writing standard output: %m";
            goto LABEL_136;
          }
        }
        else
        {
          v93 = (int *)((char *)v93 + v97);
          v80 = v80 - v97;
          v78 += v97;
        }
      }
      v98 = dword_10004B9A8;
      v110 = v93;
      if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v124, 0)
        && ((*(unsigned int *)((char *)v124.fds_bits + (((unint64_t)v98 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v98) & 1) != 0)
      {
        if ((int)v81 + v75 <= v107)
          v99 = v81;
        else
          v99 = v107 - v75;
        v100 = write(dword_10004B9A8, v82, v99);
        if ((v100 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
            v81 = 0;
            LODWORD(v108) = 0;
          }
          else if (*__error() != 35 && *__error() != 4)
          {
            v102 = "Error writing pseudo-tty master: %m";
            goto LABEL_136;
          }
        }
        else
        {
          v82 = (_WORD *)((char *)v82 + v100);
          v81 = v81 - v100;
          v75 += v100;
        }
      }
      v109 = v82;
      v112 = v79;
      v113 = v80;
      v50 = (_DWORD)v81 != 0;
      v49 = (_DWORD)v80 != 0;
      v54 = HIDWORD(v108) != 0;
      v101 = v81;
      v53 = (_DWORD)v108 != 0;
      v105 = v75;
      v106 = v78;
      v52 = v75 < v107;
      v51 = v78 < v107;
      v111 = v101;
      if (!(_DWORD)v101 && !(_DWORD)v113 && !v108)
        goto LABEL_131;
    }
  }
  if (v53)
  {
    v58 = __darwin_check_fd_set_overflow(a1, &v125, 0);
    v57 = v114;
    v56 = v115;
    if (v58)
      goto LABEL_36;
  }
LABEL_38:
  v59 = 0;
  if (v49)
    goto LABEL_39;
  goto LABEL_43;
}

uint64_t sub_100023F40(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v3;

  result = charshunt_pid;
  if (charshunt_pid)
  {
    if (a2 == 2)
      v3 = 2;
    else
      v3 = 15;
    return kill(charshunt_pid, v3);
  }
  return result;
}

void sub_100023F64()
{
  charshunt_pid = 0;
}

uint64_t sub_100023F70(FILE *a1, int a2, const void *a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int128 v20;

  v20 = 0uLL;
  gettimeofday((timeval *)&v20, 0);
  SDWORD2(v20) /= 100000;
  v10 = DWORD2(v20) - a5[2] + 10 * (v20 - *a5);
  if ((int)v10 >= 1)
  {
    if (v10 < 0x100)
    {
      v11 = 6;
    }
    else
    {
      putc(5, a1);
      putc(HIBYTE(v10), a1);
      putc(HIWORD(v10), a1);
      v11 = v10 >> 8;
    }
    putc(v11, a1);
    putc(v10, a1);
    *(_OWORD *)a5 = v20;
  }
  putc(a2, a1);
  if (a3)
  {
    putc(a4 >> 8, a1);
    putc(a4, a1);
    fwrite(a3, a4, 1uLL, a1);
  }
  fflush(a1);
  if (!ferror(a1))
    return 1;
  error("Error writing record file: %m", v12, v13, v14, v15, v16, v17, v18, v20);
  return 0;
}

double sub_1000240C4(int a1)
{
  char *v1;
  double result;

  v1 = (char *)&upap + 64 * (uint64_t)a1;
  *(_DWORD *)v1 = a1;
  *((_QWORD *)v1 + 1) = 0;
  *((_DWORD *)v1 + 4) = 0;
  *((_QWORD *)v1 + 3) = 0;
  *((_QWORD *)v1 + 4) = 0;
  *(_QWORD *)(v1 + 37) = 0;
  *((_DWORD *)v1 + 12) = 3;
  *(_QWORD *)&result = 0x1E0000000ALL;
  *((_QWORD *)v1 + 7) = 0x1E0000000ALL;
  return result;
}

void sub_100024100(int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char *v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  int v13;
  char *v14;
  int v15;
  _DWORD *v16;
  int v17;
  char v18;
  unsigned int *v19;
  char v20;
  char *v21;
  _DWORD *v22;
  int v23;
  char *v24;
  _DWORD *v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unsigned __int8 *v30;
  size_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
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
  char *__s;
  _BYTE v61[256];

  if ((int)a3 > 3)
  {
    v10 = __rev16(*((unsigned __int16 *)a2 + 1));
    if (v10 > 3)
    {
      if (v10 <= a3)
      {
        v11 = a1;
        v12 = (int *)((char *)&upap + 64 * (uint64_t)a1);
        v13 = *a2;
        if (v13 == 3)
        {
          v24 = (char *)&upap + 64 * (uint64_t)a1;
          v26 = *((_DWORD *)v24 + 9);
          v25 = v24 + 36;
          if (v26 != 3)
            return;
          if (v10 == 4)
          {
            if (debug)
              dbglog("pap_rauthnak: ignoring missing msg-length.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
          }
          else if (a2[4])
          {
            if (v10 - 5 < a2[4])
            {
              if (debug)
              {
                v9 = "pap_rauthnak: rcvd short packet.";
                goto LABEL_10;
              }
              return;
            }
            info("Remote message: %0.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a2[4]);
          }
          *v25 = 5;
          error("PAP authentication failed", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
          auth_withpeer_fail(*v12, 49187);
          return;
        }
        if (v13 != 2)
        {
          if (v13 != 1)
            return;
          v14 = (char *)&upap + 64 * (uint64_t)a1;
          v17 = *((_DWORD *)v14 + 10);
          v16 = v14 + 40;
          v15 = v17;
          if (v17 < 3)
            return;
          v18 = a2[1];
          if (v15 == 5)
          {
            v19 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
            v20 = 3;
          }
          else
          {
            if (v15 != 4)
            {
              if (v10 == 4
                || (v27 = a2[4], v28 = v10 - v27 - 6, v28 < 0)
                || (v29 = (uint64_t)(a2 + 5), v30 = &a2[a2[4] + 5], v31 = *v30, v28 < v31))
              {
                if (debug)
                  dbglog("pap_rauth: rcvd short packet.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
              }
              else
              {
                __s = 0;
                v32 = v30 + 1;
                v33 = check_passwd((_QWORD *)*v12, (uint64_t)(a2 + 5), v27, (uint64_t)(v30 + 1), v31, &__s);
                bzero(v32, v31);
                if (v33 == 2)
                {
                  if (auth_number())
                  {
                    v33 = 2;
                  }
                  else
                  {
                    warning("calling number %q is not authorized", v34, v35, v36, v37, v38, v39, v40, (int)&remote_number);
                    v33 = 3;
                  }
                }
                v41 = strlen(__s);
                if (v41 >= 255)
                  v45 = 255;
                else
                  v45 = v41;
                sub_100024C18((unsigned int *)v12, v33, v18, __s, v45, v42, v43, v44, v59);
                slprintf((int)v61, 256, "%.*v");
                if (v33 == 2)
                {
                  *v16 = 4;
                  notice("PAP peer authentication succeeded for %q", v46, v47, v48, v49, v50, v51, v52, (int)v61);
                  auth_peer_success(*v12, 49187, 0, v29, v27);
                }
                else
                {
                  *v16 = 5;
                  warning("PAP peer authentication failed for %q", v46, v47, v48, v49, v50, v51, v52, (int)v61);
                  auth_peer_fail(*v12, 49187, v53, v54, v55, v56, v57, v58);
                }
                if (*((int *)&upap + 16 * v11 + 15) >= 1)
                  untimeout((uint64_t)sub_100024B70, (uint64_t)v12);
              }
              return;
            }
            v19 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
            v20 = 2;
          }
          sub_100024C18(v19, v20, v18, &unk_100032B1A, 0, a6, a7, a8, v59);
          return;
        }
        v21 = (char *)&upap + 64 * (uint64_t)a1;
        v23 = *((_DWORD *)v21 + 9);
        v22 = v21 + 36;
        if (v23 != 3)
          return;
        if (v10 == 4)
        {
          if (debug)
            dbglog("pap_rauthack: ignoring missing msg-length.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
        }
        else if (a2[4])
        {
          if (v10 - 5 < a2[4])
          {
            if (debug)
            {
              v9 = "pap_rauthack: rcvd short packet.";
              goto LABEL_10;
            }
            return;
          }
          info("Remote message: %0.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a2[4]);
        }
        *v22 = 4;
        notice("PAP authentication succeeded", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
        auth_withpeer_success(*v12, 49187, 0);
        return;
      }
      if (debug)
      {
        v9 = "pap_input: rcvd short packet.";
        goto LABEL_10;
      }
    }
    else if (debug)
    {
      v9 = "pap_input: rcvd illegal length.";
      goto LABEL_10;
    }
  }
  else if (debug)
  {
    v9 = "pap_input: rcvd short header.";
LABEL_10:
    dbglog(v9, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

void sub_100024610(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v9 = (char *)&upap + 64 * (uint64_t)a1;
  if (*((_DWORD *)v9 + 9) == 3)
  {
    error("PAP authentication failed due to protocol-reject", a2, a3, a4, a5, a6, a7, a8, v16);
    auth_withpeer_fail(a1, 49187);
  }
  if (*((_DWORD *)v9 + 10) == 3)
  {
    error("PAP authentication of peer failed (protocol-reject)", a2, a3, a4, a5, a6, a7, a8, v16);
    auth_peer_fail(a1, 49187, v10, v11, v12, v13, v14, v15);
  }
  sub_100024738(a1);
}

void sub_100024688(int a1)
{
  uint64_t v1;
  char *v2;
  _DWORD *v3;
  int v4;
  int v5;
  char *v6;
  _DWORD *v7;
  int v8;
  int v9;

  v1 = a1;
  v2 = (char *)&upap + 64 * (uint64_t)a1;
  v5 = *((_DWORD *)v2 + 9);
  v3 = v2 + 36;
  v4 = v5;
  if (v5 == 2)
  {
    sub_100024A44((unsigned int *)&upap + 16 * (uint64_t)a1);
  }
  else if (!v4)
  {
    *v3 = 1;
  }
  v6 = (char *)&upap + 64 * v1;
  v9 = *((_DWORD *)v6 + 10);
  v7 = v6 + 40;
  v8 = v9;
  if (v9 == 2)
  {
    *v7 = 3;
    if (*((int *)&upap + 16 * v1 + 15) >= 1)
      timeout((int)sub_100024B70);
  }
  else if (!v8)
  {
    *v7 = 1;
  }
}

void sub_100024738(int a1)
{
  uint64_t v1;
  char *v2;

  v1 = a1;
  v2 = (char *)&upap + 64 * (uint64_t)a1;
  if (*((_DWORD *)v2 + 9) == 3)
    untimeout((uint64_t)sub_100024BAC, (uint64_t)v2);
  if (*((_DWORD *)v2 + 10) == 3 && *((int *)&upap + 16 * v1 + 15) >= 1)
    untimeout((uint64_t)sub_100024B70, (uint64_t)v2);
  *(_QWORD *)(v2 + 36) = 0;
}

uint64_t sub_1000247B8(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  unsigned int v6;
  unsigned int v7;
  int v11;
  int v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  char *v18;
  int v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;

  if (a2 < 4)
    return 0;
  v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  v7 = v6 - 4;
  if (v6 < 4 || v6 > a2)
    return 0;
  v11 = *a1;
  v12 = a1[1];
  v13 = a1 + 4;
  if ((v11 - 1) > 2)
    v14 = " code=0x%x";
  else
    v14 = " %s";
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 2) < 2)
  {
    if (v6 < 5)
      return ((_DWORD)v13 - (_DWORD)a1);
    v15 = *v13;
    if (v7 <= v15)
      goto LABEL_25;
    v16 = &v13[v15 + 1];
    v17 = v7 - (v15 + 1);
    a3(a4, " ");
    v18 = (char *)(a1 + 5);
    v19 = v15;
    goto LABEL_16;
  }
  if (v11 == 1)
  {
    if (v6 < 5)
      return ((_DWORD)v13 - (_DWORD)a1);
    v20 = *v13;
    if (v7 < (int)v20 + 2)
      goto LABEL_25;
    v21 = v13[v20 + 1];
    v22 = v20 + 2 + v21;
    v17 = v7 - v22;
    if (v7 < v22)
      goto LABEL_25;
    v16 = &v13[v22];
    a3(a4, " user=");
    print_string((char *)a1 + 5, v20, a3, a4);
    a3(a4, " password=");
    if (!byte_100046080)
    {
      v18 = (char *)&v13[v20 + 2];
      v19 = v21;
LABEL_16:
      print_string(v18, v19, a3, a4);
      goto LABEL_24;
    }
    a3(a4, "<hidden>");
  }
  else
  {
    v16 = a1 + 4;
    v17 = v6 - 4;
  }
LABEL_24:
  v7 = v17;
  v13 = v16;
  if (v17 >= 1)
  {
LABEL_25:
    v23 = v7 + 1;
    do
    {
      v24 = *v13++;
      ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
      --v23;
    }
    while (v23 > 1);
  }
  return ((_DWORD)v13 - (_DWORD)a1);
}

void upap_authwithpeer(int a1, char *__s, const char *a3)
{
  char *v4;
  int v5;
  int v6;

  v4 = (char *)&upap + 64 * (uint64_t)a1;
  *((_QWORD *)v4 + 1) = __s;
  *((_DWORD *)v4 + 4) = strlen(__s);
  *((_QWORD *)v4 + 3) = a3;
  v5 = strlen(a3);
  v6 = *((_DWORD *)v4 + 9);
  *((_DWORD *)v4 + 8) = v5;
  *((_DWORD *)v4 + 13) = 0;
  if ((v6 | 2) == 2)
    *((_DWORD *)v4 + 9) = 2;
  else
    sub_100024A44((unsigned int *)v4);
}

void sub_100024A44(unsigned int *a1)
{
  size_t v2;
  int v3;
  char v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v2 = (int)a1[4];
  v3 = v2 + a1[8];
  outpacket_buf = 599786495;
  LOBYTE(word_100048120) = 1;
  v4 = *((_BYTE *)a1 + 44) + 1;
  *((_BYTE *)a1 + 44) = v4;
  HIBYTE(word_100048120) = v4;
  LOBYTE(word_100048122) = (unsigned __int16)(v3 + 6) >> 8;
  HIBYTE(word_100048122) = v3 + 6;
  byte_100048124 = v2;
  memcpy(byte_100048125, *((const void **)a1 + 1), v2);
  v5 = &byte_100048125[a1[4]];
  *v5 = a1[8];
  memcpy(v5 + 1, *((const void **)a1 + 3), (int)a1[8]);
  output(*a1, (uint64_t)&outpacket_buf, (v3 + 10), v6, v7, v8, v9, v10, v11);
  timeout((int)sub_100024BAC);
  ++a1[13];
  a1[9] = 3;
}

void upap_authpeer(int a1)
{
  char *v1;
  _DWORD *v2;
  int v3;

  v1 = (char *)&upap + 64 * (uint64_t)a1;
  v3 = *((_DWORD *)v1 + 10);
  v2 = v1 + 40;
  if ((v3 | 2) == 2)
  {
    *v2 = 2;
  }
  else
  {
    *v2 = 3;
    if (*((int *)&upap + 16 * (uint64_t)a1 + 15) >= 1)
      timeout((int)sub_100024B70);
  }
}

void sub_100024B70(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[10] == 3)
  {
    auth_peer_fail(*a1, 49187, a3, a4, a5, a6, a7, a8);
    a1[10] = 5;
  }
}

void sub_100024BAC(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;

  if (a1[9] == 3)
  {
    if (a1[13] >= a1[14])
    {
      error("No response to PAP authenticate-requests", a2, a3, a4, a5, a6, a7, a8, v9);
      a1[9] = 5;
      auth_withpeer_fail(*a1, 49187);
    }
    else
    {
      sub_100024A44(a1);
    }
  }
}

void sub_100024C18(unsigned int *a1, char a2, char a3, void *__src, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  outpacket_buf = 599786495;
  LOBYTE(word_100048120) = a2;
  HIBYTE(word_100048120) = a3;
  LOBYTE(word_100048122) = (unsigned __int16)(a5 + 5) >> 8;
  HIBYTE(word_100048122) = a5 + 5;
  byte_100048124 = a5;
  memcpy(byte_100048125, __src, a5);
  output(*a1, (uint64_t)&outpacket_buf, (a5 + 9), v11, v12, v13, v14, v15, a9);
}

uint64_t slprintf(int a1, int a2, void *a3)
{
  return vslprintf(a1, a2, a3);
}

uint64_t vslprintf(char *a1, int a2, char *__src, int *a4)
{
  char *v4;
  int v6;
  uint64_t i;
  char *v8;
  int v9;
  int v10;
  char *v11;
  int v12;
  int v13;
  int *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int *v19;
  int v20;
  int v21;
  int v22;
  const char **v23;
  const char *v24;
  int v25;
  int v27;
  int v28;
  int v29;
  BOOL v30;
  char v31;
  int v32;
  unsigned __int8 **v33;
  unsigned __int8 *v34;
  int v35;
  uint64_t v36;
  unsigned __int8 *v37;
  unsigned int v38;
  __int16 *v39;
  __int16 **v40;
  __int16 *v41;
  __int16 *v42;
  __int16 **v43;
  __int16 *v44;
  int *v45;
  unsigned __int8 *v46;
  int v47;
  unint64_t v48;
  unsigned int v49;
  unsigned int *v50;
  char *v51;
  uint64_t v52;
  unsigned int *v53;
  unint64_t v54;
  int *v55;
  unsigned int *v56;
  unint64_t v57;
  int v58;
  uint64_t *v59;
  uint64_t v60;
  int *v61;
  unsigned int *v62;
  unint64_t v63;
  char **v64;
  char *v65;
  int v66;
  int v68;
  unsigned int *v69;
  char *v70;
  unint64_t *v71;
  unint64_t v72;
  BOOL v73;
  int v74;
  int v75;
  size_t v76;
  int v77;
  int v78;
  uint64_t (*v79)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **);
  int v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  int __dst;
  char *v88;
  uint64_t v89;
  time_t v90;
  int *v91;
  _BYTE v92[31];
  char v93;

  v4 = a1;
  v90 = 0;
  v91 = a4;
  v88 = 0;
  v89 = 0;
  __dst = (int)a1;
  if (a2 < 2)
    goto LABEL_200;
  v6 = a2 - 1;
  v4 = a1;
  while (1)
  {
    for (i = 0; __src[i] && __src[i] != 37; ++i)
      ;
    v8 = &__src[i];
    if (&__src[i] > __src)
    {
      if (v6 >= (int)i)
        v9 = i;
      else
        v9 = v6;
      memcpy(v4, __src, v9);
      v4 += v9;
      v6 -= v9;
      __src = v8;
    }
    if (!*__src)
      goto LABEL_200;
    v11 = __src + 1;
    v10 = __src[1];
    if (v10 == 48)
    {
      v13 = __src[2];
      v12 = 48;
      v11 = __src + 2;
    }
    else
    {
      v12 = 32;
      v13 = __src[1];
    }
    if (v13 == 42)
    {
      v14 = v91;
      v91 += 2;
      v15 = *v14;
      v17 = *++v11;
      v16 = v17;
    }
    else
    {
      v16 = (char)v13;
      if (((char)v13 - 48) > 9)
      {
        v15 = 0;
      }
      else
      {
        v15 = 0;
        do
        {
          v15 = v16 + 10 * v15 - 48;
          v18 = *++v11;
          v16 = v18;
        }
        while ((v18 - 48) < 0xA);
      }
    }
    if (v16 == 46)
    {
      v16 = v11[1];
      if (v16 == 42)
      {
        v19 = v91;
        v91 += 2;
        v20 = *v19;
        v21 = v11[2];
        v11 += 2;
        v16 = v21;
      }
      else if ((v16 - 48) > 9)
      {
        v20 = 0;
        ++v11;
      }
      else
      {
        v20 = 0;
        ++v11;
        do
        {
          v20 = v16 + 10 * v20 - 48;
          v22 = *++v11;
          v16 = v22;
        }
        while ((v22 - 48) < 0xA);
      }
    }
    else
    {
      v20 = -1;
    }
    __src = v11 + 1;
    if (v16 > 87)
      break;
    switch(v16)
    {
      case 'B':
        v45 = v91;
        v91 += 2;
        if (v20 >= 1)
        {
          v46 = *(unsigned __int8 **)v45;
          v47 = v20 + 1;
          do
          {
            v49 = *v46++;
            v48 = v49;
            if (v10 != 48 && v6 >= 1)
            {
              *v4++ = 32;
              --v6;
            }
            if (v6 >= 1)
            {
              *v4 = a0123456789abcd[v48 >> 4];
              if (v6 == 1)
              {
                v6 = 0;
                ++v4;
              }
              else
              {
                v6 -= 2;
                v4[1] = a0123456789abcd[v48 & 0xF];
                v4 += 2;
              }
            }
            --v47;
          }
          while (v47 > 1);
        }
        goto LABEL_148;
      case 'I':
        v50 = (unsigned int *)v91;
        v91 += 2;
        ntohl(*v50);
        v51 = v92;
        slprintf((int)v92, 32, "%d.%d.%d.%d");
LABEL_135:
        v66 = strlen(v51);
        if (v20 >= v66 || v20 <= -1)
          v68 = v66;
        else
          v68 = v20;
LABEL_162:
        if (v15 >= 1)
        {
          v74 = v15 >= v6 ? v6 : v15;
          v75 = v74 - v68;
          if (v74 - v68 >= 1)
          {
            v76 = (v74 + ~v68) + 1;
            memset(v4, v12, v76);
            v6 -= v75;
            v4 += v76;
          }
        }
        if (v68 >= v6)
          v77 = v6;
        else
          v77 = v68;
        memcpy(v4, v51, v77);
        v4 += v77;
        v73 = __OFSUB__(v6, v77);
        v6 -= v77;
        if ((v6 < 0) ^ v73 | (v6 == 0))
          goto LABEL_200;
        break;
      case 'P':
        v88 = v4;
        LODWORD(v89) = v6 + 1;
        v33 = (unsigned __int8 **)v91;
        v91 += 2;
        v34 = *v33;
        v91 = (int *)(v33 + 2);
        v35 = *((_DWORD *)v33 + 2);
        v36 = (v35 - 4);
        if (v35 < 4)
          goto LABEL_146;
        if (*v34 == 255 && v34[1] == 3)
        {
          v37 = v34 + 4;
          v38 = __rev16(*((unsigned __int16 *)v34 + 1));
          v39 = protocols;
          if (protocols)
          {
            v40 = (__int16 **)&off_100043898;
            v41 = protocols;
            do
            {
              if (v38 == (unsigned __int16)*v41)
              {
                sub_10002573C((uint64_t)&v88, "[%s");
                v78 = (*((uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **))v41
                       + 8))(v37, v36, sub_10002573C, &v88);
                sub_10002573C((uint64_t)&v88, "]");
                LODWORD(v36) = v36 - v78;
                goto LABEL_144;
              }
              v42 = *v40++;
              v41 = v42;
            }
            while (v42);
            if (protocols)
            {
              v43 = (__int16 **)&off_100043898;
              while (v38 != (*v39 & 0x7FFF))
              {
                v44 = *v43++;
                v39 = v44;
                if (!v44)
                  goto LABEL_197;
              }
              if (*((_QWORD *)v39 + 12))
              {
                sub_10002573C((uint64_t)&v88, "[%s data");
                v79 = (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **))*((_QWORD *)v39 + 20);
                if (v79)
                {
                  v80 = v79(v37, v36, sub_10002573C, &v88);
                  v37 += v80;
                  LODWORD(v36) = v36 - v80;
                }
                sub_10002573C((uint64_t)&v88, "]\n");
                if ((int)v36 >= 1)
                {
                  do
                  {
                    if ((int)v36 >= 16)
                      v81 = 16;
                    else
                      v81 = v36;
                    sub_10002573C((uint64_t)&v88, "  ");
                    v82 = 0;
                    do
                    {
                      v83 = v82;
                      if (v82 == 8)
                        sub_10002573C((uint64_t)&v88, "  ");
                      sub_10002573C((uint64_t)&v88, "%.1B");
                      v82 = v83 + 1;
                    }
                    while (v83 + 1 < v81);
                    if (v82 <= 0xF)
                    {
                      v84 = 15 - v83;
                      do
                      {
                        if (v84 == 8)
                          sub_10002573C((uint64_t)&v88, "  ");
                        sub_10002573C((uint64_t)&v88, "   ");
                        --v84;
                      }
                      while (v84);
                    }
                    sub_10002573C((uint64_t)&v88, "   '");
                    v85 = 0;
                    do
                    {
                      sub_10002573C((uint64_t)&v88, "%c");
                      ++v85;
                    }
                    while (v85 < (int)v81);
                    sub_10002573C((uint64_t)&v88, "'\n");
                    v37 += 16;
                    v73 = __OFSUB__((_DWORD)v36, 16);
                    LODWORD(v36) = v36 - 16;
                  }
                  while (!(((int)v36 < 0) ^ v73 | ((_DWORD)v36 == 0)));
                }
LABEL_146:
                v70 = "%.*B";
                goto LABEL_147;
              }
            }
          }
LABEL_197:
          sub_10002573C((uint64_t)&v88, "[proto=0x%x]");
        }
        else
        {
          LODWORD(v36) = v35;
        }
LABEL_144:
        if ((int)v36 < 33)
          goto LABEL_146;
        v70 = "%.32B ...";
LABEL_147:
        sub_10002573C((uint64_t)&v88, v70);
        v4 = v88;
        v6 = v89 - 1;
LABEL_148:
        if (v6 <= 0)
          goto LABEL_200;
        break;
      default:
LABEL_116:
        *v4++ = 37;
        if (v16 != 37)
          __src = v11;
        --v6;
        goto LABEL_148;
    }
  }
  switch(v16)
  {
    case 'c':
      v55 = v91;
      v91 += 2;
      v92[0] = *v55;
      v92[1] = 0;
      v51 = v92;
      goto LABEL_135;
    case 'd':
      v56 = (unsigned int *)v91;
      v91 += 2;
      v57 = *v56;
      v54 = -(int)v57;
      if ((v57 & 0x80000000) == 0)
        v54 = v57;
      v52 = (v57 >> 31) & 1;
      goto LABEL_151;
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'n':
    case 'r':
    case 'w':
      goto LABEL_116;
    case 'l':
      v58 = *__src;
      if (v58 == 117)
      {
        LODWORD(v52) = 0;
        __src = v11 + 2;
        v71 = (unint64_t *)v91;
        v91 += 2;
        v54 = *v71;
      }
      else
      {
        if (v58 != 100)
        {
          *(_WORD *)v4 = 27685;
          v4 += 2;
          v6 -= 2;
          goto LABEL_148;
        }
        __src = v11 + 2;
        v59 = (uint64_t *)v91;
        v91 += 2;
        v60 = *v59;
        if (v60 >= 0)
          v54 = v60;
        else
          v54 = -v60;
        v52 = (unint64_t)v60 >> 63;
      }
LABEL_151:
      v63 = 10;
LABEL_152:
      v93 = 0;
      v51 = &v93;
      while (v51 > &v92[v52])
      {
        v72 = v54;
        v54 /= v63;
        *--v51 = a0123456789abcd[v72 - v54 * v63];
        v73 = __OFSUB__(v20--, 1);
        if ((v20 < 0) ^ v73 | (v20 == 0))
        {
          if (v63 > v72)
            break;
        }
      }
      if ((_DWORD)v52 == 2)
      {
        *((_WORD *)v51 - 1) = 30768;
        v51 -= 2;
      }
      else if ((_DWORD)v52 == 1)
      {
        *--v51 = 45;
      }
      v68 = &v93 - (_DWORD)v51;
      goto LABEL_162;
    case 'm':
      v61 = __error();
      v51 = strerror(*v61);
      goto LABEL_135;
    case 'o':
      LODWORD(v52) = 0;
      v62 = (unsigned int *)v91;
      v91 += 2;
      v54 = *v62;
      v63 = 8;
      goto LABEL_152;
    case 'p':
      v52 = (uint64_t)v91;
      v91 += 2;
      v54 = *(_QWORD *)v52;
      LODWORD(v52) = 2;
      goto LABEL_132;
    case 'q':
    case 'v':
      v23 = (const char **)v91;
      v91 += 2;
      v24 = *v23;
      if (v10 != 48 || v20 < 0)
      {
        v25 = strlen(*v23);
        if (v20 >= v25 || v20 < 0)
          v20 = v25;
      }
      if (v20 < 1 || v6 < 1)
        goto LABEL_148;
LABEL_43:
      v28 = *v24++;
      v27 = v28;
      v29 = v28;
      if (v16 == 113 || (v27 & 0x80000000) == 0)
      {
        if (v16 != 113)
        {
          if (v29 >= 0x20 && (v29 - 127) >= 0x21)
          {
LABEL_59:
            --v6;
            *v4++ = v29;
            goto LABEL_70;
          }
          goto LABEL_61;
        }
        if (v29 == 92 || v29 == 34)
        {
          --v6;
          *v4++ = 92;
        }
      }
      else
      {
        *v4 = 77;
        v30 = v6 >= 2;
        v6 -= 2;
        if (v30)
        {
          v4[1] = 45;
          v4 += 2;
        }
        else
        {
          v6 = 0;
          ++v4;
        }
        v29 -= 128;
      }
      if (v29 >= 32 && (v29 - 127) >= 0x21)
      {
        if (!v6)
          break;
        goto LABEL_59;
      }
      if (v16 == 113)
      {
        if (v6)
        {
          v32 = v6 - 1;
          *v4++ = 92;
        }
        else
        {
          v32 = 0;
        }
        switch(v29)
        {
          case 8:
            if (v32)
            {
              v6 = v32 - 1;
              v31 = 98;
              goto LABEL_64;
            }
            break;
          case 9:
            if (v32)
            {
              v6 = v32 - 1;
              v31 = 116;
              goto LABEL_64;
            }
            break;
          case 10:
            if (v32)
            {
              v6 = v32 - 1;
              v31 = 110;
              goto LABEL_64;
            }
            break;
          case 12:
            if (v32)
            {
              v6 = v32 - 1;
              v31 = 102;
              goto LABEL_64;
            }
            break;
          default:
            if (v32)
            {
              *v4 = 120;
              if (v32 == 1)
              {
                ++v4;
              }
              else
              {
                v4[1] = a0123456789abcd[(unint64_t)v29 >> 4];
                if (v32 != 2)
                {
                  v6 = v32 - 3;
                  v4[2] = a0123456789abcd[v29 & 0xF];
                  v4 += 3;
                  goto LABEL_70;
                }
                v4 += 2;
              }
            }
            break;
        }
        break;
      }
LABEL_61:
      if (v29 == 9)
      {
        if (!v6)
          break;
        --v6;
        v31 = 9;
LABEL_64:
        *v4++ = v31;
LABEL_70:
        if (v20 < 2)
          goto LABEL_148;
        --v20;
        if (!v6)
          goto LABEL_148;
        goto LABEL_43;
      }
      if (!v6)
        break;
      *v4 = 94;
      if (v6 != 1)
      {
        v6 -= 2;
        v4[1] = v29 ^ 0x40;
        v4 += 2;
        goto LABEL_70;
      }
      ++v4;
      break;
    case 's':
      v64 = (char **)v91;
      v91 += 2;
      v51 = *v64;
      goto LABEL_135;
    case 't':
      time(&v90);
      v65 = ctime(&v90);
      v51 = v65 + 4;
      v65[19] = 0;
      goto LABEL_135;
    case 'u':
      LODWORD(v52) = 0;
      v69 = (unsigned int *)v91;
      v91 += 2;
      v54 = *v69;
      goto LABEL_151;
    case 'x':
      goto LABEL_115;
    default:
      if (v16 != 88)
        goto LABEL_116;
LABEL_115:
      LODWORD(v52) = 0;
      v53 = (unsigned int *)v91;
      v91 += 2;
      v54 = *v53;
LABEL_132:
      v63 = 16;
      goto LABEL_152;
  }
LABEL_200:
  *v4 = 0;
  return ((_DWORD)v4 - __dst);
}

uint64_t sub_10002573C(uint64_t a1, void *__src)
{
  uint64_t result;

  result = vslprintf(*(_QWORD *)a1, *(_DWORD *)(a1 + 8), __src);
  *(_QWORD *)a1 += (int)result;
  *(_DWORD *)(a1 + 8) -= result;
  return result;
}

size_t init_pr_log(size_t result, int a2)
{
  qword_10004BAB8 = (uint64_t)byte_10004B9B8;
  if (result)
  {
    __strlcpy_chk(byte_10004B9B8, result, 256, 256);
    result = strlen(byte_10004B9B8);
    qword_10004BAB8 = (uint64_t)&byte_10004B9B8[result];
  }
  dword_10004BAC0 = a2;
  return result;
}

void end_pr_log()
{
  if ((char *)qword_10004BAB8 != byte_10004B9B8)
  {
    *(_BYTE *)qword_10004BAB8 = 0;
    sub_10002582C(dword_10004BAC0, byte_10004B9B8);
  }
}

void sub_10002582C(int a1, const char *a2)
{
  int v4;
  tm *v5;
  int v6;
  time_t v7;
  char __buf[64];

  sys_log(a1, "%s", a2);
  if ((log_to_fd & 0x80000000) == 0 && (a1 != 7 || debug))
  {
    v7 = 0;
    v4 = strlen(a2);
    time(&v7);
    v5 = localtime(&v7);
    v6 = strftime(__buf, 0x40uLL, "%c : ", v5);
    if (write(log_to_fd, __buf, v6) != v6)
      log_to_fd = -1;
    if (v4 >= 1)
      v4 -= a2[v4 - 1] == 10;
    if (write(log_to_fd, a2, v4) != v4 || write(log_to_fd, "\n", 1uLL) != 1)
      log_to_fd = -1;
  }
}

void pr_log(uint64_t a1, char *__src, ...)
{
  char *v2;
  int v3;
  char *v4;
  char *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  int v9;
  char __s[256];
  va_list va;

  va_start(va, __src);
  v2 = __s;
  v3 = vslprintf(__s, 256, __src, (int *)va);
  v4 = strchr(__s, 10);
  v5 = v4;
  v6 = (uint64_t *)qword_10004BAB8;
  if ((char *)qword_10004BAB8 == byte_10004B9B8)
    goto LABEL_10;
  v2 = __s;
  v7 = (_DWORD)v4 - __s;
  if (!v4)
    v7 = v3;
  v8 = (uint64_t *)(qword_10004BAB8 + v7);
  if (v8 >= &qword_10004BAB8)
  {
LABEL_9:
    *(_BYTE *)v6 = 0;
    sub_10002582C(dword_10004BAC0, byte_10004B9B8);
    qword_10004BAB8 = (uint64_t)byte_10004B9B8;
LABEL_10:
    while (v5)
    {
      *v5 = 0;
      sub_10002582C(dword_10004BAC0, v2);
      v2 = v5 + 1;
      v5 = strchr(v5 + 1, 10);
    }
    v9 = &__s[v3] - (_DWORD)v2;
    if (v9 >= 1)
    {
      __memcpy_chk(byte_10004B9B8, v2, v3, 256);
      qword_10004BAB8 = (uint64_t)&byte_10004B9B8[v9];
    }
    return;
  }
  if (v7 >= 1)
  {
    memcpy((void *)qword_10004BAB8, __s, v7);
    qword_10004BAB8 = (uint64_t)v8;
    v6 = v8;
  }
  if (v5)
  {
    v2 = v5 + 1;
    v5 = strchr(v5 + 1, 10);
    goto LABEL_9;
  }
}

uint64_t print_string(char *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  const char *v11;

  a3(a4, "\"");
  if (a2 >= 1)
  {
    v7 = a2 + 1;
    do
    {
      v9 = *a1++;
      v8 = v9;
      if ((v9 - 32) > 0x5E)
      {
        if (v8 == 9)
        {
          v10 = a4;
          v11 = "\\t";
        }
        else if (v8 == 13)
        {
          v10 = a4;
          v11 = "\\r";
        }
        else
        {
          v10 = a4;
          if (v8 == 10)
            v11 = "\\n";
          else
            v11 = "\\%.3o";
        }
      }
      else
      {
        if (v8 == 92 || v8 == 34)
          a3(a4, "\\");
        v10 = a4;
        v11 = "%c";
      }
      a3(v10, v11);
      --v7;
    }
    while (v7 > 1);
  }
  return ((uint64_t (*)(uint64_t, const char *))a3)(a4, "\"");
}

void fatal(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  sub_100025C78(3, a1, &a9);
  die(1);
}

void sub_100025C78(int a1, char *a2, int *a3)
{
  char v4[4096];

  vslprintf(v4, 4096, a2, a3);
  sub_10002582C(a1, v4);
}

void error(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9[4096];

  vslprintf(v9, 4096, a1, &a9);
  sub_10002582C(3, v9);
  ++error_count;
}

void warning(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9[4096];

  vslprintf(v9, 4096, a1, &a9);
  sub_10002582C(4, v9);
}

void notice(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9[4096];

  vslprintf(v9, 4096, a1, &a9);
  sub_10002582C(5, v9);
}

void info(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9[4096];

  vslprintf(v9, 4096, a1, &a9);
  sub_10002582C(6, v9);
}

void dbglog(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9[4096];

  vslprintf(v9, 4096, a1, &a9);
  sub_10002582C(7, v9);
}

void dump_packet(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  BOOL v9;
  unsigned int v11;
  int v12;

  if (debug)
  {
    if ((int)a3 < 8)
      goto LABEL_17;
    v8 = __rev16(*(unsigned __int16 *)(a2 + 2));
    v9 = debug <= 1 && unsuccess == 0;
    if (!v9 || v8 != 49185)
      goto LABEL_17;
    v11 = __rev16(*(unsigned __int16 *)(a2 + 6));
    v12 = *(unsigned __int8 *)(a2 + 4);
    if ((v12 - 9) >= 2)
    {
      if (v12 != 13 || v11 <= 3)
        goto LABEL_17;
    }
    else if (v11 < 4)
    {
LABEL_17:
      dbglog("%s %P", a2, a3, a4, a5, a6, a7, a8, a1);
      return;
    }
    if (v11 <= (int)a3 - 4)
      return;
    goto LABEL_17;
  }
}

uint64_t complete_read(int a1, char *a2, size_t a3)
{
  unint64_t v6;
  size_t v7;
  ssize_t v8;

  if (!a3)
    return 0;
  v6 = 0;
  v7 = a3;
  do
  {
    while (1)
    {
      v8 = read(a1, a2, v7);
      if (v8 < 0)
        break;
      if (v8)
      {
        v6 += v8;
        a2 += v8;
        v7 = a3 - v6;
        if (a3 > v6)
          continue;
      }
      return v6;
    }
  }
  while (*__error() == 4);
  return -1;
}

uint64_t lock(char *a1)
{
  char *v2;
  char *v3;
  char *i;
  char *v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
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
  int v47;
  uint64_t v48;
  char __dst[1024];
  char __buf[12];

  v2 = strstr(a1, "dev/");
  if (v2)
  {
    v3 = __dst;
    strncpy(__dst, v2 + 4, 0x3FFuLL);
    __dst[1023] = 0;
    for (i = strrchr(__dst, 47); i; i = strrchr(__dst, 47))
    {
      *i = 95;
      v3 = __dst;
    }
  }
  else
  {
    v5 = strrchr(a1, 47);
    if (v5)
      v3 = v5 + 1;
    else
      v3 = a1;
  }
  slprintf((int)&byte_10004BAC4, 1024, "%s/LCK..%s");
  v6 = open(&byte_10004BAC4, 2562, 420, v3);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_9:
    getpid();
    slprintf((int)__buf, 12, "%10d\n");
    write(v6, __buf, 0xBuLL);
    close(v6);
    return 0;
  }
  while (1)
  {
    if (*__error() != 17)
    {
      error("Can't create lock file %s: %m", v8, v9, v10, v11, v12, v13, v14, (int)&byte_10004BAC4);
      goto LABEL_28;
    }
    v15 = open(&byte_10004BAC4, 0, 0);
    if (v15 < 0)
      break;
    v16 = v15;
    v17 = read(v15, __buf, 0xBuLL);
    close(v16);
    if (v17 <= 0)
    {
      error("Can't read pid from lock file %s", v18, v19, v20, v21, v22, v23, v24, (int)&byte_10004BAC4);
      goto LABEL_28;
    }
    __buf[v17] = 0;
    v25 = atoi(__buf);
    if ((_DWORD)v25 == getpid())
      return 1;
    if ((_DWORD)v25 && (kill(v25, 0) != -1 || *__error() != 3))
    {
      notice("Device %s is locked by pid %d", v26, v27, v28, v29, v30, v31, v32, (int)v3);
      goto LABEL_28;
    }
    if (unlink(&byte_10004BAC4))
    {
      warning("Couldn't remove stale lock on %s", v33, v34, v35, v36, v37, v38, v39, (int)v3);
      goto LABEL_28;
    }
    v48 = v25;
    notice("Removed stale lock on %s (pid %d)", v33, v34, v35, v36, v37, v38, v39, (int)v3);
LABEL_20:
    v47 = open(&byte_10004BAC4, 2562, 420, v48);
    if ((v47 & 0x80000000) == 0)
    {
      v6 = v47;
      goto LABEL_9;
    }
  }
  if (*__error() == 2)
    goto LABEL_20;
  error("Can't open existing lock file %s: %m", v40, v41, v42, v43, v44, v45, v46, (int)&byte_10004BAC4);
LABEL_28:
  byte_10004BAC4 = 0;
  return 0xFFFFFFFFLL;
}

uint64_t relock()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BYTE __buf[12];

  if (byte_10004BAC4)
  {
    v0 = open(&byte_10004BAC4, 1, 0);
    if ((v0 & 0x80000000) == 0)
    {
      v8 = v0;
      slprintf((int)__buf, 12, "%10d\n");
      write(v8, __buf, 0xBuLL);
      close(v8);
      return 0;
    }
    error("Couldn't reopen lock file %s: %m", v1, v2, v3, v4, v5, v6, v7, (int)&byte_10004BAC4);
    byte_10004BAC4 = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t unlock()
{
  uint64_t result;

  if (byte_10004BAC4)
  {
    result = unlink(&byte_10004BAC4);
    byte_10004BAC4 = 0;
  }
  return result;
}

void log_vpn_interface_address_event(int a1, _DWORD *a2, int a3, int a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24[16];
  char v25[16];
  char v26[16];
  char v27[16];

  if (a2)
  {
    v23 = ntohl(a2[16]);
    switch(a2[5])
    {
      case 1:
        addr2ascii(2, a5, 4, v27);
        sub_10002682C(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        v15 = "%s: Address added. previous interface setting (name: %s, address: %s), current interface setting (name: %s"
              "%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 2:
        addr2ascii(2, a5, 4, v27);
        sub_10002682C(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        v15 = "%s: Address changed. previous interface setting (name: %s, address: %s), current interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 3:
        addr2ascii(2, a5, 4, v27);
        sub_10002682C(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        v15 = "%s: Address deleted. previous interface setting (name: %s, address: %s), deleted interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 7:
        addr2ascii(2, a5, 4, v27);
        sub_10002682C(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        v15 = "%s: ARP collided. previous interface setting (name: %s, address: %s), conflicting interface setting (name:"
              " %s%d, family: %s, address: %s, mac: %x:%x:%x:%x:%x:%x).";
        break;
      default:
        addr2ascii(2, a5, 4, v27);
        sub_10002682C(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        v15 = "%s: Other Address event (%d). previous interface setting (name: %s, address: %s), other interface setting "
              "(name: %s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
    }
    notice(v15, v8, v9, v10, v11, v12, v13, v14, a1);
  }
  else
  {
    addr2ascii(2, a5, 4, v27);
    notice("%s: %d secs TIMEOUT waiting for interface to be reconfigured. previous setting (name: %s, address: %s).", v16, v17, v18, v19, v20, v21, v22, a1);
  }
}

char *sub_10002682C(int a1)
{
  char *v1;

  if ((a1 - 1) < 0xE)
    return (&off_10003CC98)[a1 - 1];
  v1 = byte_10004BEC4;
  snprintf(byte_10004BEC4, 0x10uLL, "%d", a1);
  return v1;
}

BOOL check_vpn_interface_or_service_unrecoverable(const __SCDynamicStore *a1, uint64_t a2, uint64_t a3, char *cStr, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  CFStringRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  __CFArray *Mutable;
  __CFArray *v20;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v22;
  CFStringRef NetworkServiceEntity;
  CFStringRef v24;
  const __CFDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFIndex Count;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFIndex v41;
  const void **v42;
  const void **v43;
  int v45;
  int v46;
  uint64_t i;
  const __CFString *v48;
  const __CFDictionary *v49;
  CFTypeID TypeID;
  CFTypeID v51;
  const void *Value;
  CFTypeID v53;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFString *ValueAtIndex;
  CFStringRef v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CFStringRef v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const void *v73;
  CFTypeID v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const void *v82;
  CFTypeID v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const __CFDictionary *theDict;
  __int16 valuePtr;
  _OWORD v94[64];
  _BYTE v95[1032];

  v8 = a2;
  if (!a1)
  {
    dbglog("%s: invalid SCDynamicStore reference", a2, a3, (uint64_t)cStr, a5, a6, a7, a8, a2);
    return 0;
  }
  if ((*(_DWORD *)(a3 + 20) & 0xFFFFFFFE) != 2)
    return 0;
  memset(v95, 0, 512);
  memset(v94, 0, 512);
  v10 = CFStringCreateWithCStringNoCopy(0, cStr, 0x600u, kCFAllocatorNull);
  if (v10)
  {
    v18 = v10;
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v20 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainSetup, v18, kSCEntNetAirPort);
    CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
    CFRelease(NetworkInterfaceEntity);
    v22 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v18, kSCEntNetAirPort);
    CFArrayAppendValue(Mutable, v22);
    CFRelease(v22);
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetInterface);
    CFArrayAppendValue(v20, NetworkServiceEntity);
    CFRelease(NetworkServiceEntity);
    v24 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetIPv4);
    CFArrayAppendValue(v20, v24);
    CFRelease(v24);
    v25 = SCDynamicStoreCopyMultiple(a1, Mutable, v20);
    CFRelease(Mutable);
    CFRelease(v20);
    if (v25)
    {
      Count = CFDictionaryGetCount(v25);
      if (Count <= 0)
      {
        notice("%s: empty SCDynamicStore dictionary", v34, v35, v36, v37, v38, v39, v40, v8);
        CFRelease(v18);
        v45 = 0;
        v46 = 0;
      }
      else
      {
        v41 = Count;
        if ((unint64_t)Count < 0x81)
        {
          v43 = (const void **)v94;
          v42 = (const void **)v95;
        }
        else
        {
          v42 = (const void **)CFAllocatorAllocate(0, 8 * Count, 0);
          v43 = (const void **)CFAllocatorAllocate(0, 8 * v41, 0);
        }
        theDict = v25;
        CFDictionaryGetKeysAndValues(v25, v42, v43);
        v46 = 0;
        for (i = 0; i != v41; ++i)
        {
          v48 = (const __CFString *)v42[i];
          v49 = (const __CFDictionary *)v43[i];
          TypeID = CFStringGetTypeID();
          if (v48)
          {
            if (CFGetTypeID(v48) == TypeID)
            {
              v51 = CFDictionaryGetTypeID();
              if (v49)
              {
                if (CFGetTypeID(v49) == v51)
                {
                  if (CFStringHasSuffix(v48, kSCEntNetInterface))
                  {
                    Value = CFDictionaryGetValue(v49, kSCPropNetInterfaceDeviceName);
                    v53 = CFStringGetTypeID();
                    if (Value && CFGetTypeID(Value) == v53 && CFEqual(v18, Value))
                    {
                      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v48, CFSTR("/"));
                      if (CFArrayGetCount(ArrayBySeparatingStrings) < 4)
                      {
                        v72 = 0;
                      }
                      else
                      {
                        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3);
                        v56 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, ValueAtIndex, kSCEntNetIPv4);
                        if (v56)
                        {
                          v64 = v56;
                          if (CFDictionaryGetValue(theDict, v56))
                          {
                            v72 = 0;
                          }
                          else
                          {
                            notice("%s: detected disabled IPv4 Config", v65, v66, v67, v68, v69, v70, v71, v8);
                            v72 = 1;
                          }
                          CFRelease(v64);
                        }
                        else
                        {
                          notice("%s: detected disabled IPv4 Config", v57, v58, v59, v60, v61, v62, v63, v8);
                          v72 = 1;
                        }
                      }
                      if (ArrayBySeparatingStrings)
                        CFRelease(ArrayBySeparatingStrings);
                      v46 = 1;
                      v45 = 1;
                      if (v72)
                        goto LABEL_49;
                    }
                  }
                  else if (CFStringHasSuffix(v48, kSCEntNetAirPort))
                  {
                    if (CFStringHasPrefix(v48, kSCDynamicStoreDomainSetup))
                    {
                      v73 = CFDictionaryGetValue(v49, CFSTR("PowerEnabled"));
                      v74 = CFBooleanGetTypeID();
                      if (v73 && CFGetTypeID(v73) == v74 && CFEqual(v73, kCFBooleanFalse))
                      {
                        notice("%s: detected AirPort, PowerEnable == FALSE", v75, v76, v77, v78, v79, v80, v81, v8);
                        v45 = 1;
                        goto LABEL_49;
                      }
                    }
                    else if (CFStringHasPrefix(v48, kSCDynamicStoreDomainState))
                    {
                      valuePtr = 0;
                      v82 = CFDictionaryGetValue(v49, CFSTR("Power Status"));
                      v83 = CFNumberGetTypeID();
                      if (v82)
                      {
                        if (CFGetTypeID(v82) == v83
                          && CFNumberGetValue((CFNumberRef)v82, kCFNumberShortType, &valuePtr)
                          && !valuePtr)
                        {
                          notice("%s: detected AirPort, PowerStatus == 0", v84, v85, v86, v87, v88, v89, v90, v8);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        v45 = 0;
LABEL_49:
        CFRelease(v18);
        if (v42 != (const void **)v95)
        {
          CFAllocatorDeallocate(0, v42);
          CFAllocatorDeallocate(0, v43);
        }
        v25 = theDict;
      }
      CFRelease(v25);
      return v45 || v46 == 0;
    }
    notice("%s: failed to initialize SCDynamicStore dictionary", v26, v27, v28, v29, v30, v31, v32, v8);
    CFRelease(v18);
  }
  else
  {
    notice("%s: failed to initialize interface CFString", v11, v12, v13, v14, v15, v16, v17, v8);
  }
  v45 = 0;
  v46 = 0;
  return v45 || v46 == 0;
}

BOOL check_vpn_interface_address_change(int a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v5;
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    if ((*(_DWORD *)(a2 + 20) - 1) <= 1)
    {
      v5 = *(unsigned int *)(a2 + 48);
      if (*a5 != (_DWORD)v5 && ntohl(v5) >> 16 != 43518)
        return 1;
    }
  }
  return result;
}

BOOL check_vpn_interface_alternate(int a1, uint64_t a2)
{
  return a1
      && (*(_DWORD *)(a2 + 20) - 1) <= 1
      && ntohl(*(unsigned int *)(a2 + 48)) >> 16 != 43518;
}

double sub_100026F80(int a1)
{
  char *v1;
  double result;

  v1 = (char *)&eap + 416 * a1;
  *((_OWORD *)v1 + 24) = 0u;
  *((_OWORD *)v1 + 25) = 0u;
  *((_OWORD *)v1 + 22) = 0u;
  *((_OWORD *)v1 + 23) = 0u;
  *((_OWORD *)v1 + 20) = 0u;
  *((_OWORD *)v1 + 21) = 0u;
  *((_OWORD *)v1 + 18) = 0u;
  *((_OWORD *)v1 + 19) = 0u;
  *((_OWORD *)v1 + 16) = 0u;
  *((_OWORD *)v1 + 17) = 0u;
  *((_OWORD *)v1 + 14) = 0u;
  *((_OWORD *)v1 + 15) = 0u;
  *((_OWORD *)v1 + 12) = 0u;
  *((_OWORD *)v1 + 13) = 0u;
  *((_OWORD *)v1 + 10) = 0u;
  *((_OWORD *)v1 + 11) = 0u;
  *((_OWORD *)v1 + 8) = 0u;
  *((_OWORD *)v1 + 9) = 0u;
  *((_OWORD *)v1 + 6) = 0u;
  *((_OWORD *)v1 + 7) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_DWORD *)v1 + 1) = 0;
  *((_DWORD *)v1 + 2) = 0;
  *(_DWORD *)v1 = a1;
  *((_QWORD *)v1 + 38) = 0xA00000003;
  result = NAN;
  *((_QWORD *)v1 + 44) = -1;
  return result;
}

void sub_100026FE8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  __int16 v9;
  unsigned int v11;
  int v12;
  int *v15;
  int v16;
  int v17;
  const char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _DWORD *v28;
  int v29;
  char *v30;
  unsigned __int8 *v31;
  int v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  char *v42;
  uint64_t v43;
  int v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t *v56;
  char *v57;
  _WORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _DWORD *v66;
  BOOL v67;
  __int16 mtu;
  uint64_t v69;
  char *v70;
  unsigned int (*v71)(uint64_t, char *);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  char *v76;
  char *v77;
  _WORD *v78;
  uint64_t v79;
  BOOL v80;
  __int16 v81;
  uint64_t v82;
  char *v83;
  unsigned int (*v84)(uint64_t, char *);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  unsigned int *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
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
  uint64_t v104;
  uint64_t v105;
  int v106;

  if ((int)a3 < 4)
    return;
  v9 = a3;
  v11 = __rev16(*(unsigned __int16 *)(a2 + 2));
  v12 = v11 - 4;
  if (v11 < 4 || v11 > a3)
    return;
  v15 = (int *)((char *)&eap + 416 * a1);
  v16 = *(unsigned __int8 *)(a2 + 1);
  switch(*(_BYTE *)a2)
  {
    case 1:
      if (v11 == 4)
        return;
      if ((*((_DWORD *)&eap + 104 * a1 + 1) - 1) < 2)
        return;
      v17 = *(unsigned __int8 *)(a2 + 4);
      switch(v17)
      {
        case 3:
          return;
        case 2:
          info("Remote message: %0.*v", a2, a3, a4, a5, a6, a7, a8, v11 - 5);
          outpacket_buf = 667026431;
          LOBYTE(word_100048120) = 2;
          HIBYTE(word_100048120) = v16;
          word_100048122 = 1024;
          v25 = *v15;
          v26 = 8;
          break;
        case 1:
          v18 = (const char *)*((_QWORD *)&eap + 52 * a1 + 2);
          v19 = strlen(v18);
          outpacket_buf = 667026431;
          LOBYTE(word_100048120) = 2;
          HIBYTE(word_100048120) = v16;
          LOBYTE(word_100048122) = (unsigned __int16)(v19 + 5) >> 8;
          HIBYTE(word_100048122) = v19 + 5;
          byte_100048124 = 1;
          memcpy(byte_100048125, v18, v19 + 1 - 1);
          v25 = *v15;
          v26 = (v19 + 9);
          break;
        default:
          v42 = (char *)&eap + 416 * a1;
          v43 = *((_QWORD *)v42 + 40);
          if (v43)
          {
            if (*(unsigned __int8 *)(v43 + 8) != v17)
            {
              error("EAP received an unexpected request for type %d", a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 4));
              return;
            }
            goto LABEL_26;
          }
          v55 = v42 + 320;
          v56 = &eap_extensions;
          while (1)
          {
            v56 = (uint64_t *)*v56;
            if (!v56)
              break;
            if (*((unsigned __int8 *)v56 + 8) == v17)
            {
              *(_QWORD *)v55 = v56;
              v57 = (char *)&eap + 416 * a1;
              *((_QWORD *)v57 + 42) = malloc_type_malloc(0x40uLL, 0x1090040C3ADEBCBuLL);
              v58 = malloc_type_malloc(0x18uLL, 0x10900405F3747B1uLL);
              *((_QWORD *)v57 + 43) = v58;
              v66 = (_DWORD *)*((_QWORD *)v57 + 42);
              if (v66)
                v67 = v58 == 0;
              else
                v67 = 1;
              if (!v67)
              {
                *v66 = 64;
                *v58 = 24;
                mtu = netif_get_mtu();
                v69 = *((_QWORD *)v57 + 42);
                *(_WORD *)(v69 + 4) = mtu;
                v70 = (char *)&eap + 416 * a1;
                *(_OWORD *)(v69 + 24) = *((_OWORD *)v70 + 1);
                *(_QWORD *)(v69 + 40) = *((_QWORD *)v70 + 4);
                *(_QWORD *)(v69 + 48) = dbglog;
                *(_QWORD *)(v69 + 56) = error;
                *(_DWORD *)(v69 + 6) = 0;
                v71 = *(unsigned int (**)(uint64_t, char *))(*(_QWORD *)v55 + 40);
                *(_QWORD *)(v69 + 16) = *(_QWORD *)(*(_QWORD *)v55 + 32);
                if (v71(v69, v70 + 328))
                {
                  v75 = (const char *)v56[2];
                  if (!v75)
                    v75 = "???";
                  error("EAP cannot initialize plugin for %s (request type %d)", v72, v73, v74, a5, a6, a7, a8, (int)v75);
                  auth_withpeer_fail(*v15, 49703);
                  return;
                }
LABEL_26:
                sub_10002845C((unsigned int *)v15, 4, a2, v9, a5, a6, a7, a8, a9);
                return;
              }
LABEL_69:
              novm((int)"Couldn't allocate memory for EAP Plugin data", v59, v60, v61, v62, v63, v64, v65);
            }
          }
          error("EAP refuse to authenticate using type %d", a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 4));
          if (!eap_extensions)
            return;
          error("EAP send NAK requesting type %d", v93, v94, v95, v96, v97, v98, v99, *(unsigned __int8 *)(eap_extensions + 8));
          outpacket_buf = 667026431;
          LOBYTE(word_100048120) = 2;
          HIBYTE(word_100048120) = v16;
          word_100048122 = 1536;
          byte_100048124 = 3;
          byte_100048125[0] = *(_BYTE *)(eap_extensions + 8);
          v25 = *v15;
          v26 = 10;
          break;
      }
      output(v25, (uint64_t)&outpacket_buf, v26, v20, v21, v22, v23, v24, a9);
      return;
    case 2:
      v27 = (char *)&eap + 416 * a1;
      v29 = *((_DWORD *)v27 + 2);
      v28 = v27 + 8;
      if ((v29 - 1) < 2)
        return;
      if (v11 == 4)
        return;
      v30 = (char *)&eap + 416 * a1;
      if (v30[296] != v16)
        return;
      v31 = (unsigned __int8 *)(a2 + 5);
      v32 = *(unsigned __int8 *)(a2 + 4);
      v33 = (char *)&eap + 416 * a1;
      if (v32 == 3)
      {
        if (!*((_QWORD *)v33 + 48))
          return;
        v34 = v33 + 384;
        untimeout((uint64_t)sub_10002804C, (uint64_t)v15);
        v39 = *v31;
        v40 = *(_QWORD *)v34;
        v41 = &eap_extensions;
        while (1)
        {
          v41 = (uint64_t *)*v41;
          if (!v41)
            break;
          if (*((unsigned __int8 *)v41 + 8) == v39)
            goto LABEL_52;
        }
        if (*(_BYTE *)(v40 + 8))
        {
LABEL_52:
          v76 = (char *)&eap + 416 * a1;
          (*(void (**)(_QWORD))(v40 + 48))(*((_QWORD *)v76 + 49));
          free(*((void **)v76 + 50));
          free(*((void **)v76 + 51));
          *(_OWORD *)v34 = 0u;
          *((_OWORD *)v34 + 1) = 0u;
          if (v41)
            goto LABEL_54;
          v41 = *(uint64_t **)v40;
          if (*(_QWORD *)v40)
            goto LABEL_54;
          v54 = "Server and client disagree on EAP type";
LABEL_68:
          error(v54, v47, v48, v49, v50, v51, v52, v53, v106);
          *v28 = 6;
          auth_peer_fail(*v15, 49703, v100, v101, v102, v103, v104, v105);
          return;
        }
LABEL_62:
        v89 = (unsigned int *)v15;
        v90 = 4;
        v91 = a2;
        v92 = v9;
LABEL_64:
        sub_100028134(v89, v90, v91, v92, v35, v36, v37, v38, a9);
        return;
      }
      v44 = v33[298];
      if (v44 && v32 != v44)
        return;
      untimeout((uint64_t)sub_10002804C, (uint64_t)v15);
      if (v32 != 1)
        goto LABEL_62;
      if (v12 >= 256)
        v45 = 256;
      else
        v45 = v12;
      v46 = v45 - 1;
      memcpy((char *)&eap + 416 * a1 + 40, v31, (v45 - 1));
      *((_BYTE *)&eap + 416 * a1 + v46 + 40) = 0;
      v41 = (uint64_t *)eap_extensions;
      if (!eap_extensions)
      {
        v54 = "No EAP server protocol available";
        goto LABEL_68;
      }
LABEL_54:
      v77 = (char *)&eap + 416 * a1;
      *((_QWORD *)v77 + 48) = v41;
      v77[298] = *((_BYTE *)v41 + 8);
      *((_QWORD *)v77 + 50) = malloc_type_malloc(0x40uLL, 0x1090040C3ADEBCBuLL);
      v78 = malloc_type_malloc(0x18uLL, 0x10900405F3747B1uLL);
      *((_QWORD *)v77 + 51) = v78;
      v79 = *((_QWORD *)v77 + 50);
      if (v79)
        v80 = v78 == 0;
      else
        v80 = 1;
      if (v80)
        goto LABEL_69;
      *(_WORD *)v79 = 64;
      *v78 = 24;
      *(_BYTE *)(v79 + 2) = 1;
      *(_BYTE *)(v79 + 3) = v30[296] + 1;
      v81 = netif_get_mtu();
      v82 = *((_QWORD *)v77 + 50);
      *(_WORD *)(v82 + 4) = v81;
      v83 = (char *)&eap + 416 * a1;
      *(_QWORD *)(v82 + 32) = 0;
      *(_QWORD *)(v82 + 40) = 0;
      *(_QWORD *)(v82 + 48) = dbglog;
      *(_QWORD *)(v82 + 56) = error;
      *(_DWORD *)(v82 + 6) = 0;
      v84 = *(unsigned int (**)(uint64_t, char *))(*((_QWORD *)v77 + 48) + 40);
      *(_QWORD *)(v82 + 16) = *(_QWORD *)(*((_QWORD *)v77 + 48) + 32);
      *(_QWORD *)(v82 + 24) = v83 + 40;
      if (!v84(v82, v83 + 392))
      {
        v89 = (unsigned int *)v15;
        v90 = 1;
        v91 = 0;
        v92 = 0;
        goto LABEL_64;
      }
      v88 = (const char *)v41[2];
      if (!v88)
        v88 = "???";
      error("EAP cannot initialize plugin for %s (request type %d)", v85, v86, v87, v35, v36, v37, v38, (int)v88);
      return;
    case 3:
      if (*((_DWORD *)&eap + 104 * a1 + 1) != 4)
        goto LABEL_26;
      return;
    case 4:
      goto LABEL_26;
    default:
      warning("Unknown EAP code (%d) received.", a2, a3, a4, a5, a6, a7, a8, 416);
      return;
  }
}

double sub_1000276A4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((_DWORD *)&eap + 104 * a1 + 2) >= 2u)
    auth_peer_fail(a1, 49703, a3, a4, a5, a6, a7, a8);
  if (*((_DWORD *)&eap + 104 * a1 + 1) >= 2u)
    auth_withpeer_fail(a1, 49703);
  return sub_100027794(a1);
}

void sub_100027718(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int *v9;
  unsigned int v10;
  int v11;
  char *v12;
  int v13;
  int *v14;
  int v15;
  int v16;

  v9 = (unsigned int *)((char *)&eap + 416 * a1);
  v10 = v9[1];
  if (v10)
  {
    if (v10 != 2)
      goto LABEL_6;
    v11 = 3;
  }
  else
  {
    v11 = 1;
  }
  v9[1] = v11;
LABEL_6:
  v12 = (char *)&eap + 416 * a1;
  v15 = *((_DWORD *)v12 + 2);
  v14 = (int *)(v12 + 8);
  v13 = v15;
  if (v15)
  {
    if (v13 != 2)
      return;
    sub_100027C60(v9, a2, a3, a4, a5, a6, a7, a8);
    v16 = 3;
  }
  else
  {
    v16 = 1;
  }
  *v14 = v16;
}

double sub_100027794(int a1)
{
  char *v2;
  int v3;
  void *v5;
  double result;
  char *v7;
  uint64_t v8;
  _OWORD *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _OWORD *v13;
  char *v14;

  v2 = (char *)&eap + 416 * a1;
  v3 = *((_DWORD *)v2 + 2);
  if (v3 == 3 || v3 == 5)
  {
    v5 = sub_10002804C;
LABEL_10:
    untimeout((uint64_t)v5, (uint64_t)v2);
    goto LABEL_11;
  }
  if (v3 == 4 && *((_DWORD *)&eap + 104 * a1 + 75))
  {
    v5 = sub_1000280E4;
    goto LABEL_10;
  }
LABEL_11:
  v7 = (char *)&eap + 416 * a1;
  *((_DWORD *)v7 + 1) = 0;
  *((_DWORD *)v7 + 2) = 0;
  v8 = *((_QWORD *)v7 + 40);
  if (v8)
  {
    v9 = v7 + 320;
    v10 = (char *)&eap + 416 * a1;
    (*(void (**)(_QWORD))(v8 + 48))(*((_QWORD *)v10 + 41));
    free(*((void **)v10 + 42));
    free(*((void **)v10 + 43));
    result = 0.0;
    *v9 = 0u;
    v9[1] = 0u;
  }
  v11 = (char *)&eap + 416 * a1;
  v12 = *((_QWORD *)v11 + 48);
  if (v12)
  {
    v13 = v11 + 384;
    v14 = (char *)&eap + 416 * a1;
    (*(void (**)(_QWORD))(v12 + 48))(*((_QWORD *)v14 + 49));
    free(*((void **)v14 + 50));
    free(*((void **)v14 + 51));
    result = 0.0;
    *v13 = 0u;
    v13[1] = 0u;
  }
  return result;
}

uint64_t sub_10002788C(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t v13;
  int v14;
  const char *v15;
  char *v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  uint64_t *v21;
  const char *v22;
  char *v23;
  uint64_t *v24;
  void (*v25)(void (*)(uint64_t, const char *), uint64_t, uint64_t, char *, _QWORD);
  int v26;

  if (a2 < 4)
    return 0;
  v6 = a1[2];
  v7 = a1[3];
  v8 = v7 | (v6 << 8);
  v9 = v8 - 4;
  if (v8 < 4 || v8 > a2)
    return 0;
  v13 = *a1;
  v14 = a1[1];
  if ((v13 - 1) > 3u)
    v15 = " code=0x%x";
  else
    v15 = " %s";
  a3(a4, v15);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v14);
  if ((v13 - 1) < 2)
  {
    if (v8 >= 5)
    {
      v18 = a1[4];
      if ((v18 - 1) >= 3)
      {
        v21 = &eap_extensions;
        while (1)
        {
          v21 = (uint64_t *)*v21;
          if (!v21)
            break;
          if (*((unsigned __int8 *)v21 + 8) == v18)
            goto LABEL_27;
        }
        v22 = " type=0x%x ";
      }
      else
      {
LABEL_27:
        v22 = " %s ";
      }
      a3(a4, v22);
      v17 = v8 - 5;
      if (v8 != 5)
      {
        v23 = (char *)(a1 + 5);
        if ((v18 - 1) >= 2u)
        {
          v24 = &eap_extensions;
          while (1)
          {
            v24 = (uint64_t *)*v24;
            if (!v24)
              break;
            if (*((unsigned __int8 *)v24 + 8) == v18)
            {
              v25 = (void (*)(void (*)(uint64_t, const char *), uint64_t, uint64_t, char *, _QWORD))v24[11];
              if (v25)
              {
                v25(a3, a4, v13, v23, v8 - 5);
                return v17 + 5;
              }
              break;
            }
          }
          a3(a4, "<");
          do
          {
            v26 = *v23++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, "%.2x", v26);
            --v9;
          }
          while (v9 > 1);
        }
        else
        {
          a3(a4, "<");
          print_string(v23, v8 - 5, a3, a4);
        }
        a3(a4, ">");
      }
      return v17 + 5;
    }
    goto LABEL_23;
  }
  v16 = (char *)(a1 + 4);
  if ((v13 - 3) >= 2)
  {
    if (v8 >= 5)
    {
      v19 = (v6 << 8) + v7 - 3;
      do
      {
        v20 = *v16++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v20);
        --v19;
      }
      while (v19 > 1);
      goto LABEL_15;
    }
LABEL_23:
    v17 = 0;
    return v17 + 5;
  }
  a3(a4, " ");
  print_string(v16, v8 - 4, a3, a4);
LABEL_15:
  v17 = v8 - 4;
  return v17 + 5;
}

uint64_t EapAuthWithPeer(uint64_t result)
{
  int v1;
  _QWORD *v2;
  BOOL v3;
  uint64_t (*v4)(char *, uint64_t);
  int64x2_t *v5;
  int v6;

  v1 = result;
  v2 = (_QWORD *)eap_extensions;
  if (username)
    v3 = 1;
  else
    v3 = eap_extensions == 0;
  if (!v3)
  {
    do
    {
      v4 = (uint64_t (*)(char *, uint64_t))v2[12];
      if (v4)
      {
        result = v4(&username, 256);
        if (!(_DWORD)result)
          break;
      }
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  v5 = (int64x2_t *)((char *)&eap + 416 * v1);
  v5[1] = vdupq_n_s64((unint64_t)&username);
  v5[2].i64[0] = (uint64_t)&passwd;
  if ((v5->i32[1] & 0xFFFFFFFD) != 0)
    v6 = 3;
  else
    v6 = 2;
  v5->i32[1] = v6;
  return result;
}

void EapAuthPeer(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  char *v9;
  int v10;
  int v11;

  v8 = (char *)&eap + 416 * a1;
  v10 = *((_DWORD *)v8 + 2);
  v9 = v8 + 8;
  *((_QWORD *)v9 + 2) = 0;
  *((_QWORD *)v9 + 3) = 0;
  *((_QWORD *)v9 + 1) = &user;
  v9[290] = 1;
  *((_DWORD *)v9 + 76) = 0;
  v9[288] = 1;
  if ((v10 | 2) == 2)
  {
    v11 = 2;
  }
  else
  {
    sub_100027C60((unsigned int *)&eap + 104 * a1, a2, a3, a4, a5, a6, a7, a8);
    v11 = 3;
  }
  *(_DWORD *)v9 = v11;
}

void sub_100027C60(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;

  outpacket_buf = 667026431;
  LOBYTE(word_100048120) = 1;
  HIBYTE(word_100048120) = *((_BYTE *)a1 + 296);
  word_100048122 = 1280;
  byte_100048124 = *((_BYTE *)a1 + 298);
  output(*a1, (uint64_t)&outpacket_buf, 9, a4, a5, a6, a7, a8, v9);
  timeout((int)sub_10002804C);
  ++a1[78];
}

void EapLostSuccess(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  int v9;
  _BYTE v10[2];
  __int16 v11;

  v10[0] = 3;
  v8 = (char *)&eap + 416 * a1;
  v10[1] = v8[297];
  v11 = 1024;
  if (*((_DWORD *)v8 + 1) != 4)
    sub_10002845C((unsigned int *)&eap + 104 * a1, 4, (uint64_t)v10, 4, a5, a6, a7, a8, v9);
}

void EapLostFailure(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int *v8;
  int v9;
  _BYTE v10[2];
  __int16 v11;

  v8 = (unsigned int *)((char *)&eap + 416 * a1);
  v10[0] = 4;
  v10[1] = *((_BYTE *)v8 + 297);
  v11 = 1024;
  sub_10002845C(v8, 4, (uint64_t)v10, 4, a5, a6, a7, a8, v9);
}

uint64_t EAPAllowedAddr()
{
  return 1;
}

uint64_t EapExtAdd(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = &eap_extensions;
  v2 = eap_extensions;
  if (eap_extensions)
  {
    while (1)
    {
      v1 = (uint64_t *)v2;
      if (*(unsigned __int8 *)(v2 + 8) == *(unsigned __int8 *)(a1 + 8))
        return 1;
      v2 = *(_QWORD *)v2;
      if (!*v1)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v3 = 0;
    *v1 = a1;
    *(_QWORD *)a1 = 0;
  }
  return v3;
}

uint64_t EAPClientUIThread(int a1)
{
  _opaque_pthread_t *v2;
  unsigned int (*v4)(_QWORD, _QWORD, char *, char *);
  char __buf;

  __buf = -1;
  v2 = pthread_self();
  if (!pthread_detach(v2))
  {
    v4 = *(unsigned int (**)(_QWORD, _QWORD, char *, char *))(*((_QWORD *)&eap + 52 * a1 + 40) + 80);
    if (v4)
    {
      if (!v4(*((_QWORD *)&eap + 52 * a1 + 45), *((unsigned int *)&eap + 104 * a1 + 92), (char *)&eap + 416 * a1 + 360, (char *)&eap + 416 * a1 + 368))__buf = 0;
    }
  }
  write(SHIDWORD(qword_100049F58), &__buf, 1uLL);
  return 0;
}

uint64_t EapGetClientSecret(unsigned int *a1, const char *a2, const char *a3, void *a4, int *a5)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int secret;
  uint64_t result;

  v6 = (int)a3;
  secret = get_secret((_QWORD *)*a1, a2, a3, a4, a5, 0);
  result = 0;
  if (!secret)
  {
    *a5 = 0;
    warning("No EAP secret found for authenticating us to %s", v7, v8, v9, v10, v11, v12, v13, v6);
    return 1;
  }
  return result;
}

uint64_t EapGetServerSecret(unsigned int *a1, const char *a2, const char *a3, void *a4, int *a5)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (int)a3;
  if (get_secret((_QWORD *)*a1, a2, a3, a4, a5, 1))
    return 0;
  *a5 = 0;
  warning("No EAP secret found for authenticating %s", v7, v8, v9, v10, v11, v12, v13, v6);
  return 1;
}

uint64_t sub_100027F30(_BYTE **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;

  v2 = (uint64_t)*a1;
  v3 = malloc_type_malloc(0x68uLL, 0x10B0040F6A58395uLL);
  if (!v3)
    novm((int)"Couldn't allocate memory for EAP plugin", v4, v5, v6, v7, v8, v9, v10);
  v11 = v3;
  v3[12] = 0;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  if (sys_eaploadplugin(*a1, (uint64_t)v3))
  {
    option_error("Couldn't load EAP plugin %s", v12, v13, v14, v15, v16, v17, v18, v2);
    return 1;
  }
  if (v11[5] && v11[6] && v11[7])
  {
    v20 = *((unsigned __int8 *)v11 + 8);
    v21 = &eap_extensions;
    v22 = &eap_extensions;
    while (1)
    {
      v22 = (uint64_t *)*v22;
      if (!v22)
        break;
      if (*((unsigned __int8 *)v22 + 8) == v20)
      {
        option_error("EAP plugin %s is trying to use an already loaded EAP type %d", v12, v13, v14, v15, v16, v17, v18, v2);
        return 0;
      }
    }
    while (1)
    {
      v23 = *v21;
      if (!*v21)
        break;
      v21 = (uint64_t *)*v21;
      if (*(unsigned __int8 *)(v23 + 8) == v20)
        return 1;
    }
    *v21 = (uint64_t)v11;
    *v11 = 0;
    return 1;
  }
  option_error("EAP plugin %s has no Init() Dispose() or Process() function", v12, v13, v14, v15, v16, v17, v18, v2);
  return 0;
}

void sub_10002804C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v9 = *(_DWORD *)(a1 + 8);
  if (v9 == 5 || v9 == 3)
  {
    if (*(_DWORD *)(a1 + 312) >= *(_DWORD *)(a1 + 308))
    {
      error("Peer failed to respond to EAP challenge", a2, a3, a4, a5, a6, a7, a8, v18);
      *(_DWORD *)(a1 + 8) = 6;
      auth_peer_fail(*(_DWORD *)a1, 49703, v12, v13, v14, v15, v16, v17);
    }
    else if (*(_BYTE *)(a1 + 298) == 1)
    {
      sub_100027C60();
    }
    else
    {
      sub_100028134((unsigned int *)a1, 6, 0, 0, a5, a6, a7, a8, a9);
    }
  }
}

uint64_t sub_1000280E4(uint64_t result)
{
  uint64_t v1;

  if (*(_DWORD *)(result + 8) == 4)
  {
    v1 = result;
    ++*(_BYTE *)(result + 296);
    *(_DWORD *)(result + 312) = 0;
    result = sub_100028134();
    *(_DWORD *)(v1 + 8) = 5;
  }
  return result;
}

void sub_100028134(unsigned int *a1, __int16 a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  int v24;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void (*v33)(_QWORD, uint64_t);
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int (*v44)(_QWORD, uint64_t *);
  uint64_t v45;
  uint64_t v46;
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
  const char *v59;
  size_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;

  v9 = *((_QWORD *)a1 + 48);
  if (v9)
  {
    v11 = *((_QWORD *)a1 + 50);
    *(_WORD *)(v11 + 6) = a2;
    *(_QWORD *)(v11 + 16) = a3;
    *(_WORD *)(v11 + 8) = a4;
    v12 = *((_QWORD *)a1 + 51);
    *(_DWORD *)(v12 + 2) = 0;
    *(_QWORD *)(v12 + 8) = 0;
    *(_QWORD *)(v12 + 16) = 0;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(v9 + 56))(*((_QWORD *)a1 + 49), v11))
    {
      v20 = *(const char **)(*((_QWORD *)a1 + 48) + 16);
      if (!v20)
        v20 = "???";
      error("EAP error while processing packet for %s (request type %d, error %d)", v13, v14, v15, v16, v17, v18, v19, (int)v20);
    }
    else
    {
      v21 = *((_QWORD *)a1 + 51);
      v22 = *(unsigned __int16 *)(v21 + 2);
      v23 = v22 > 6;
      v24 = (1 << v22) & 0x62;
      if (!v23 && v24 != 0)
      {
        v26 = *(const void **)(v21 + 8);
        if (v26 && (v14 = *(unsigned __int16 *)(v21 + 4), (v14 - 1501) > 0xFFFFFA26))
        {
          outpacket_buf = 667026431;
          memcpy(&word_100048120, v26, v14);
          v32 = word_100048120;
          a1[78] = 0;
          *((_BYTE *)a1 + 296) = HIBYTE(word_100048120);
          v33 = *(void (**)(_QWORD, uint64_t))(*((_QWORD *)a1 + 48) + 64);
          if (v33)
            v33(*((_QWORD *)a1 + 49), v21);
          output(*a1, (uint64_t)&outpacket_buf, *(unsigned __int16 *)(v21 + 4) + 4, v27, v28, v29, v30, v31, v63);
          v34 = *(unsigned __int16 *)(v21 + 2);
          if (v34 == 5)
          {
            timeout((int)sub_10002804C);
            v34 = *(unsigned __int16 *)(v21 + 2);
          }
          ++a1[78];
          if (v34 == 6 && (a1[2] | 2) != 6)
          {
            if (*(_QWORD *)(v21 + 16))
              v35 = *(const char **)(v21 + 16);
            else
              v35 = (const char *)(a1 + 10);
            untimeout((uint64_t)sub_10002804C, (uint64_t)a1);
            if (v32 == 3)
            {
              v43 = a1[2];
              a1[2] = 4;
              if (v43 == 3)
              {
                v44 = *(unsigned int (**)(_QWORD, uint64_t *))(*((_QWORD *)a1 + 48) + 72);
                if (v44)
                {
                  v65 = 0;
                  v64 = 1;
                  if (v44(*((_QWORD *)a1 + 49), &v64)
                    || (WORD1(v64) >= 0x10u ? (v58 = 16) : (v58 = WORD1(v64)),
                        __memmove_chk(&mppe_send_key, v65, v58, 16),
                        LOWORD(v64) = 2,
                        (*(unsigned int (**)(_QWORD, uint64_t *))(*((_QWORD *)a1 + 48) + 72))(*((_QWORD *)a1 + 49), &v64)))
                  {
                    v59 = *(const char **)(*((_QWORD *)a1 + 48) + 16);
                    if (!v59)
                      v59 = "???";
                    dbglog("EAP plugin %s (type %d) does not have %s attribute", v45, v46, v47, v48, v49, v50, v51, (int)v59);
                  }
                  else
                  {
                    if (WORD1(v64) >= 0x10u)
                      v62 = 16;
                    else
                      v62 = WORD1(v64);
                    __memmove_chk(&mppe_recv_key, v65, v62, 16);
                  }
                }
                v60 = strlen(v35);
                auth_peer_success(*a1, 49703, 0, (uint64_t)v35, v60);
              }
              v61 = a1[75];
              if ((_DWORD)v61)
                timeout((int)sub_1000280E4);
              notice("EAP peer authentication succeeded for %s", v36, v61, v38, v39, v40, v41, v42, (int)v35);
            }
            else
            {
              error("EAP peer authentication failed for remote host %s", v36, v37, v38, v39, v40, v41, v42, (int)v35);
              a1[2] = 6;
              auth_peer_fail(*a1, 49703, v52, v53, v54, v55, v56, v57);
            }
          }
        }
        else
        {
          error("EAP plugin tries to send a packet with with incorrect data", (uint64_t)v26, v14, v15, v16, v17, v18, v19, a9);
        }
      }
    }
  }
}

void sub_10002845C(unsigned int *a1, __int16 a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(_QWORD, uint64_t *);
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
  void (*v44)(_QWORD, uint64_t);
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;

  v9 = *((_QWORD *)a1 + 40);
  if (v9)
  {
    v11 = *((_QWORD *)a1 + 42);
    *(_WORD *)(v11 + 6) = a2;
    *(_QWORD *)(v11 + 16) = a3;
    *(_WORD *)(v11 + 8) = a4;
    v12 = *((_QWORD *)a1 + 43);
    *(_DWORD *)(v12 + 2) = 0;
    *(_QWORD *)(v12 + 8) = 0;
    *(_QWORD *)(v12 + 16) = 0;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(v9 + 56))(*((_QWORD *)a1 + 41), v11))
    {
      v20 = *(const char **)(*((_QWORD *)a1 + 40) + 16);
      if (!v20)
        v20 = "???";
      error("EAP error while processing packet for %s (request type %d, error %d)", v13, v14, v15, v16, v17, v18, v19, (int)v20);
    }
    else
    {
      v21 = *((_QWORD *)a1 + 43);
      switch(*(_WORD *)(v21 + 2))
      {
        case 1:
          v22 = *(const void **)(v21 + 8);
          if (!v22 || (v14 = *(unsigned __int16 *)(v21 + 4), (v14 - 1501) <= 0xFFFFFA26))
          {
            v23 = "EAP plugin tries to send a packet with with incorrect data";
            goto LABEL_20;
          }
          outpacket_buf = 667026431;
          memcpy(&word_100048120, v22, v14);
          *((_BYTE *)a1 + 297) = HIBYTE(word_100048120);
          v44 = *(void (**)(_QWORD, uint64_t))(*((_QWORD *)a1 + 40) + 64);
          if (v44)
            v44(*((_QWORD *)a1 + 41), v21);
          output(*a1, (uint64_t)&outpacket_buf, *(unsigned __int16 *)(v21 + 4) + 4, v39, v40, v41, v42, v43, a9);
          break;
        case 2:
          *((_QWORD *)a1 + 45) = *(_QWORD *)(v21 + 8);
          a1[92] = *(unsigned __int16 *)(v21 + 4);
          if (pipe((int *)a1 + 88) < 0)
          {
            v23 = "EAP failed to create pipe for User Interface...\n";
LABEL_20:
            error(v23, (uint64_t)v22, v14, v15, v16, v17, v18, v19, a9);
          }
          else if (pthread_create((pthread_t *)a1 + 47, 0, (void *(__cdecl *)(void *))EAPClientUIThread, (void *)(int)*a1))
          {
            error("EAP failed to create thread for client User Interface...\n", v24, v25, v26, v27, v28, v29, v30, v48);
            close(a1[88]);
            close(a1[89]);
          }
          else
          {
            wait_input_hook = sub_100028784;
            add_fd(a1[88]);
          }
          break;
        case 3:
          v31 = *(unsigned int (**)(_QWORD, uint64_t *))(*((_QWORD *)a1 + 40) + 72);
          if (v31)
          {
            v50 = 0;
            v49 = 1;
            if (v31(*((_QWORD *)a1 + 41), &v49)
              || (WORD1(v49) >= 0x10u ? (v45 = 16) : (v45 = WORD1(v49)),
                  __memmove_chk(&mppe_send_key, v50, v45, 16),
                  LOWORD(v49) = 2,
                  (*(unsigned int (**)(_QWORD, uint64_t *))(*((_QWORD *)a1 + 40) + 72))(*((_QWORD *)a1 + 41), &v49)))
            {
              v46 = *(const char **)(*((_QWORD *)a1 + 40) + 16);
              if (!v46)
                v46 = "???";
              dbglog("EAP plugin %s (type %d) does not have %s attribute", v32, v33, v34, v35, v36, v37, v38, (int)v46);
            }
            else
            {
              if (WORD1(v49) >= 0x10u)
                v47 = 16;
              else
                v47 = WORD1(v49);
              __memmove_chk(&mppe_recv_key, v50, v47, 16);
            }
          }
          a1[1] = 4;
          auth_withpeer_success(*a1, 49703, 0);
          break;
        case 4:
          error("EAP authentication failed", v13, v14, v15, v16, v17, v18, v19, v48);
          auth_withpeer_fail(*a1, 49703);
          break;
        case 7:
          auth_withpeer_cancelled(*a1, 49703, v14, v15, v16, v17, v18, v19);
          break;
        default:
          return;
      }
    }
  }
}

void sub_100028784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  unsigned __int8 v8;

  if ((_DWORD)qword_100049F58 != -1 && is_ready_fd(qword_100049F58))
  {
    v8 = 0;
    read(qword_100049F58, &v8, 1uLL);
    wait_input_hook = 0;
    remove_fd(qword_100049F58);
    close(qword_100049F58);
    close(SHIDWORD(qword_100049F58));
    qword_100049F58 = -1;
    if (v8 == 255)
    {
      v7 = *(const char **)(qword_100049F38 + 16);
      if (!v7)
        v7 = "???";
      error("EAP error while requesting user input for %s (request type %d)", v0, v1, v2, v3, v4, v5, v6, (int)v7);
    }
    else
    {
      sub_10002845C(&eap, 5, qword_100049F60, dword_100049F68);
    }
  }
}

void sub_10002885C(int a1)
{
  char *v2;

  v2 = (char *)&ecp_fsm + 80 * a1;
  *(_DWORD *)v2 = a1;
  *((_DWORD *)v2 + 1) = 32851;
  *((_QWORD *)v2 + 7) = &unk_1000464D8;
  fsm_init((uint64_t)v2);
  ecp_wantoptions[a1] = 0;
  *(_QWORD *)&ecp_gotoptions[8 * a1] = 0;
  ecp_allowoptions[a1] = 0;
  ecp_hisoptions[a1] = 0;
}

uint64_t sub_1000288D0()
{
  return 0;
}

double sub_1000288D8(int a1)
{
  char *v1;
  char *v2;
  char *v3;
  double result;

  v1 = (char *)&ipv6cp_fsm + 80 * a1;
  v2 = (char *)&ipv6cp_wantoptions + 52 * a1;
  v3 = (char *)&ipv6cp_allowoptions + 52 * a1;
  *(_DWORD *)v1 = a1;
  *((_DWORD *)v1 + 1) = 32855;
  *((_QWORD *)v1 + 7) = off_100046A78;
  fsm_init((uint64_t)v1);
  result = 0.0;
  *((_DWORD *)v2 + 12) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_DWORD *)v3 + 12) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(_DWORD *)v2 = 1;
  *(_DWORD *)v3 = 1;
  return result;
}

void sub_100028964(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  fsm_input((uint64_t)&ipv6cp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_100028978(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_protreject((uint64_t)&ipv6cp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_10002898C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_lowerup((uint64_t)&ipv6cp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_1000289A0(int a1)
{
  fsm_lowerdown((uint64_t)&ipv6cp_fsm + 80 * a1);
}

void sub_1000289B4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_open((uint64_t)&ipv6cp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
  byte_10004BF28 = 1;
}

void sub_1000289E4(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_close((uint64_t)&ipv6cp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000289F8(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  unsigned int v6;
  int v7;
  int v11;
  int v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  int v17;
  BOOL v18;
  unsigned __int8 *v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  unsigned __int8 *v23;
  int64_t v24;
  int v25;
  unsigned int v26;
  int v27;

  if (a2 < 4)
    return 0;
  v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  v7 = v6 - 4;
  if (v6 < 4 || v6 > a2)
    return 0;
  v11 = *a1;
  v12 = a1[1];
  v13 = a1 + 4;
  if ((v11 - 1) > 6)
    v14 = " code=0x%x";
  else
    v14 = " %s";
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        v15 = v13[1];
        if (v15 < 2 || v7 < v15)
          goto LABEL_41;
        v17 = *v13;
        a3(a4, " <");
        if (v17 == 1)
        {
          v19 = v13;
          if ((_DWORD)v15 == 10)
          {
            v19 = v13 + 10;
            v22 = eui64_ntoa(*(_QWORD *)(v13 + 2));
            snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v22);
            v20 = a4;
            v21 = "addr %s";
            goto LABEL_28;
          }
        }
        else
        {
          v18 = v17 == 2 && v15 >= 4;
          v19 = v13;
          if (v18)
          {
            v19 = v13 + 4;
            a3(a4, "compress ");
            v20 = a4;
            v21 = "0x%x";
LABEL_28:
            a3(v20, v21);
          }
        }
        if (v19 < &v13[v15])
        {
          v23 = &v13[v15];
          v24 = v23 - v19;
          do
          {
            v25 = *v19++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v25);
            --v24;
          }
          while (v24);
          v19 = v23;
        }
        v7 -= v15;
        a3(a4, ">");
        v13 = v19;
        if (v7 <= 1)
          goto LABEL_40;
      }
    }
LABEL_39:
    v19 = a1 + 4;
LABEL_40:
    v13 = v19;
    if (v7 < 1)
      return ((_DWORD)v13 - (_DWORD)a1);
    goto LABEL_41;
  }
  if ((v11 - 5) >= 2)
    goto LABEL_39;
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_41:
      v26 = v7 + 1;
      do
      {
        v27 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
        --v26;
      }
      while (v26 > 1);
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v13) = (_DWORD)v13 + v7;
  }
  return ((_DWORD)v13 - (_DWORD)a1);
}

void sub_100028C88()
{
  int v0;
  BOOL v1;
  int v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  if (!byte_100046A20)
    return;
  v0 = dword_10004A018;
  if (dword_10004A024)
    v1 = dword_10004A018 == 0;
  else
    v1 = 0;
  if (!v1 || dword_10004A01C != 0)
    goto LABEL_13;
  if (!ether_to_eui64((uint64_t)&qword_10004A030))
  {
    v0 = dword_10004A018;
LABEL_13:
    if (!v0)
    {
      v4 = qword_10004A030;
      v3 = HIDWORD(qword_10004A030);
      if (dword_10004A020)
        v5 = qword_10004A030 == 0;
      else
        v5 = 0;
      if (v5)
      {
        LODWORD(qword_10004A030) = 0;
        v6 = ntohl(dword_10004777C);
        v3 = htonl(v6);
        HIDWORD(qword_10004A030) = v3;
        v4 = 0;
        if (v3)
          dword_10004A018 = 1;
      }
      if (!(v3 | v4))
      {
        do
        {
          LODWORD(qword_10004A030) = magic();
          HIDWORD(qword_10004A030) = magic();
          LOBYTE(qword_10004A030) = qword_10004A030 & 0xFD;
        }
        while (!qword_10004A030);
      }
    }
    goto LABEL_23;
  }
  dword_10004A018 = 1;
LABEL_23:
  if (dword_10004A01C)
    v7 = 1;
  else
    v7 = dword_10004A020 == 0;
  if (!v7 && !qword_10004A038)
  {
    LODWORD(qword_10004A038) = 0;
    v8 = ntohl(dword_100047780);
    HIDWORD(qword_10004A038) = htonl(v8);
    if (HIDWORD(qword_10004A038))
      dword_10004A01C = 1;
  }
}

BOOL sub_100028DDC(unsigned __int8 *a1, int a2)
{
  int v3;

  if (a2 < 44)
    return 0;
  v3 = a1[10];
  if (v3 != 6)
    return v3 != 44;
  return a2 >= 0x40 && ((a1[57] & 1) == 0 || a2 - 4 != ((a1[56] >> 2) & 0x3C) + 40);
}

uint64_t sub_100028E3C(int a1)
{
  return *((unsigned int *)&ipv6cp_fsm + 20 * a1 + 2);
}

char *llv6_ntoa(unint64_t a1)
{
  char *v1;

  v1 = eui64_ntoa(a1);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v1);
  return byte_10004BED4;
}

uint64_t sub_100028E9C(char **a1)
{
  const char *v1;
  char *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  const char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  unsigned int v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;

  v1 = *a1;
  v2 = strchr(*a1, 44);
  if (!v2)
    v2 = (char *)&v1[strlen(v1)];
  v26 = 0;
  v27 = 0;
  if (v2 == v1)
  {
    if (!*v1)
      goto LABEL_31;
  }
  else
  {
    v3 = *v2;
    *v2 = 0;
    if (inet_pton(30, v1, &v26))
      v11 = (_DWORD)v26 == 0;
    else
      v11 = 0;
    v12 = v11 && HIDWORD(v26) == 0;
    if (!v12 || !v27)
    {
      option_error("Illegal interface identifier (local): %s", v4, v5, v6, v7, v8, v9, v10, (int)v1);
      return 0;
    }
    if (option_priority >= dword_10004BF14)
    {
      qword_10004A030 = v27;
      dword_10004A018 = 1;
      dword_10004BF14 = option_priority;
    }
    *v2 = v3;
    if (!v3)
      goto LABEL_31;
  }
  v14 = v2[1];
  v13 = v2 + 1;
  if (v14)
  {
    if (inet_pton(30, v13, &v26))
      v22 = (_DWORD)v26 == 0;
    else
      v22 = 0;
    v23 = v22 && HIDWORD(v26) == 0;
    if (v23 && v27)
    {
      if (option_priority >= dword_10004BF18)
      {
        qword_10004A038 = v27;
        dword_10004A01C = 1;
        dword_10004BF18 = option_priority;
      }
      goto LABEL_31;
    }
    option_error("Illegal interface identifier (remote): %s", v15, v16, v17, v18, v19, v20, v21, (int)v13);
    return 0;
  }
LABEL_31:
  v24 = override_value("+ipv6", option_priority, option_source);
  result = 1;
  if (v24)
    byte_100046A20 = 1;
  return result;
}

uint64_t sub_100029048(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  char *v5;
  uint64_t result;
  char *v7;

  if (dword_10004A018)
  {
    v5 = eui64_ntoa(qword_10004A030);
    snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v5);
    a2(a3, "%s", byte_10004BED4);
  }
  result = ((uint64_t (*)(uint64_t, const char *))a2)(a3, ",");
  if (dword_10004A01C)
  {
    v7 = eui64_ntoa(qword_10004A038);
    snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v7);
    return ((uint64_t (*)(uint64_t, const char *, ...))a2)(a3, "%s", byte_10004BED4);
  }
  return result;
}

__n128 sub_100029120(int *a1)
{
  int v1;
  char *v2;
  int v3;
  char *v4;
  _DWORD *v5;
  int v6;
  char *v7;
  __int128 v8;
  __n128 result;

  v1 = *a1;
  v2 = (char *)&ipv6cp_wantoptions + 52 * *a1;
  v3 = *(_DWORD *)v2;
  if (*(_DWORD *)v2)
    v3 = *((_DWORD *)&ipv6cp_allowoptions + 13 * v1) != 0;
  v4 = (char *)&ipv6cp_wantoptions + 52 * v1;
  *((_DWORD *)v4 + 1) = v3;
  if (!*((_DWORD *)v4 + 3))
  {
    v5 = (_DWORD *)((char *)&ipv6cp_wantoptions + 52 * v1 + 36);
    do
    {
      *v5 = magic();
      v6 = magic();
      *((_DWORD *)&ipv6cp_wantoptions + 13 * v1 + 10) = v6;
      *(_BYTE *)v5 &= ~2u;
    }
    while (!(*v5 | v6));
  }
  v7 = (char *)&ipv6cp_gotoptions + 52 * v1;
  v8 = *((_OWORD *)v2 + 2);
  *((_OWORD *)v7 + 1) = *((_OWORD *)v2 + 1);
  *((_OWORD *)v7 + 2) = v8;
  result = *(__n128 *)v2;
  *(_OWORD *)v7 = *(_OWORD *)v2;
  *((_DWORD *)v7 + 11) = 0;
  *((_DWORD *)v7 + 12) = 0;
  return result;
}

uint64_t sub_1000291E4(int *a1)
{
  _DWORD *v1;
  int v2;

  v1 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *a1);
  if (*v1)
    v2 = 10;
  else
    v2 = 0;
  return v2 | (4 * (v1[7] != 0));
}

int *sub_10002921C(int *result, uint64_t a2, int *a3)
{
  int v3;
  _DWORD *v4;
  int v5;
  char *v6;
  _DWORD *v7;
  int v8;
  char *v9;

  v3 = *result;
  v4 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *result);
  v5 = *a3;
  if (*v4)
  {
    if (v5 < 10)
    {
      *v4 = 0;
    }
    else
    {
      *(_WORD *)a2 = 2561;
      *(_QWORD *)(a2 + 2) = *(_QWORD *)((char *)&ipv6cp_gotoptions + 52 * v3 + 36);
      a2 += 10;
      v5 -= 10;
    }
  }
  v6 = (char *)&ipv6cp_gotoptions + 52 * v3;
  v8 = *((_DWORD *)v6 + 7);
  v7 = v6 + 28;
  if (v8)
  {
    if (v5 < 4)
    {
      *v7 = 0;
    }
    else
    {
      *(_WORD *)a2 = 1026;
      v9 = (char *)&ipv6cp_gotoptions + 52 * v3;
      *(_BYTE *)(a2 + 2) = v9[33];
      *(_BYTE *)(a2 + 3) = v9[32];
      v5 -= 4;
    }
  }
  *a3 -= v5;
  return result;
}

BOOL sub_1000292C0(int *a1, uint64_t a2, int a3)
{
  int v3;
  BOOL v4;
  char *v6;
  char *v7;
  int v8;

  v3 = *a1;
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * *a1))
  {
    v4 = __OFSUB__(a3, 10);
    a3 -= 10;
    if (a3 < 0 != v4)
      return 0;
    if (*(_BYTE *)(a2 + 1) != 10 || *(_BYTE *)a2 != 1)
      return 0;
    v6 = (char *)&ipv6cp_gotoptions + 52 * v3;
    v8 = *((_DWORD *)v6 + 9);
    v7 = v6 + 36;
    if (v8 != *(_DWORD *)(a2 + 2) || *((_DWORD *)v7 + 1) != *(_DWORD *)(a2 + 6))
      return 0;
    a2 += 10;
  }
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * v3 + 7))
  {
    v4 = __OFSUB__(a3, 4);
    a3 -= 4;
    if (a3 < 0 != v4
      || *(_BYTE *)(a2 + 1) != 4
      || *(_BYTE *)a2 != 2
      || *((unsigned __int16 *)&ipv6cp_gotoptions + 26 * v3 + 16) != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
    {
      return 0;
    }
  }
  return !a3;
}

uint64_t sub_100029384(int *a1, unsigned __int8 *a2, int a3)
{
  int *v3;
  int v4;
  int v5;
  char *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  int i;
  int v18;
  int v19;
  uint64_t v20;
  _DWORD *v21;
  char *v22;
  _DWORD *v23;
  _DWORD *v24;
  uint64_t v25;
  int v26;
  int v29;
  int j;
  int v32;
  int v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  __int128 v39;
  uint64_t v40;

  v3 = a1;
  v4 = 0;
  v5 = *a1;
  v6 = (char *)&ipv6cp_gotoptions + 52 * *a1;
  v7 = *(_DWORD *)v6;
  v39 = *(_OWORD *)(v6 + 4);
  v40 = *(_QWORD *)(v6 + 20);
  v8 = *((_DWORD *)v6 + 7);
  v9 = *((_DWORD *)v6 + 8);
  v11 = *((_DWORD *)v6 + 9);
  v10 = *((_DWORD *)v6 + 10);
  v12 = *(_QWORD *)(v6 + 44);
  v13 = a3 - 10;
  if (a3 < 10 || !v7)
    goto LABEL_12;
  if (a2[1] != 10 || *a2 != 1)
  {
    v4 = 0;
LABEL_12:
    v18 = *((_DWORD *)v6 + 7);
    v14 = a2;
    v13 = a3;
    goto LABEL_13;
  }
  v14 = a2 + 10;
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 2))
  {
    v33 = *(_DWORD *)v6;
    v35 = *(_QWORD *)(v6 + 44);
    v37 = *((_DWORD *)v6 + 8);
    v15 = *((_DWORD *)v6 + 7);
    v10 = *(_DWORD *)(a2 + 6);
    v16 = *(_DWORD *)(a2 + 2);
    for (i = v16; ; i = v16 & 0xFD)
    {
      v11 = v16 & 0xFFFFFF00 | i;
      if (v11 | v10)
      {
        if (v11 != *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 11)
          || v10 != *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 12))
        {
          break;
        }
      }
      v16 = magic();
      v10 = magic();
    }
    v18 = *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 7);
    v4 = 1;
    v8 = v15;
    v9 = v37;
    v12 = v35;
    v7 = v33;
  }
  else
  {
    v4 = 1;
    v18 = *((_DWORD *)v6 + 7);
  }
LABEL_13:
  v19 = 0;
  if (v18 && v14[1] == 4 && v13 >= 4)
  {
    if (*v14 != 2)
    {
      v19 = 0;
LABEL_22:
      v34 = v3;
      v36 = v12;
      v38 = v9;
      v32 = v8;
      v21 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * v5 + 28);
      v22 = (char *)&ipv6cp_gotoptions + 52 * v5;
      v23 = v22 + 8;
      v24 = v22 + 44;
      while (1)
      {
        v25 = v14[1];
        if (v25 < 2)
          return 0;
        v13 -= v25;
        if (v13 < 0)
          return 0;
        v26 = *v14;
        if (v26 == 1)
        {
          if ((_DWORD)v25 != 10 || *(_DWORD *)v6 != 0 || v4 != 0)
            return 0;
          if (*v23)
          {
            v10 = *(_DWORD *)(v14 + 6);
            v29 = *(_DWORD *)(v14 + 2);
            for (j = v29; ; LOBYTE(v29) = j & 0xFD)
            {
              v11 = j & 0xFFFFFF00 | v29;
              if (v11 | v10)
              {
                if (v11 != *v24 || v10 != v24[1])
                  break;
              }
              j = magic();
              v10 = magic();
            }
          }
          v4 = 1;
          v7 = 1;
        }
        else if (v26 == 2)
        {
          v20 = 0;
          if ((_DWORD)v25 != 4 || *v21 || v19)
            return v20;
          v19 = 1;
        }
        v14 += v25;
        if (v13 <= 1)
        {
          v3 = v34;
          v12 = v36;
          v8 = v32;
          v9 = v38;
          if (v13)
            return 0;
          goto LABEL_48;
        }
      }
    }
    v8 = 0;
    v14 += 4;
    v19 = 1;
    v13 -= 4;
  }
  if (v13 >= 2)
    goto LABEL_22;
  if (v13)
    return 0;
LABEL_48:
  if (v3[2] != 9)
  {
    *(_DWORD *)v6 = v7;
    *(_OWORD *)(v6 + 4) = v39;
    *(_QWORD *)(v6 + 20) = v40;
    *((_DWORD *)v6 + 7) = v8;
    *((_DWORD *)v6 + 8) = v9;
    *((_DWORD *)v6 + 9) = v11;
    *((_DWORD *)v6 + 10) = v10;
    *(_QWORD *)(v6 + 44) = v12;
  }
  return 1;
}

uint64_t sub_100029668(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  _DWORD *v5;
  int v6;
  char *v7;
  char *v8;
  int v9;

  v3 = result;
  v4 = *(_DWORD *)result;
  v5 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *(int *)result);
  LODWORD(result) = *v5;
  v6 = v5[7];
  if (a3 >= 10 && (_DWORD)result && *(_BYTE *)(a2 + 1) == 10 && *(_BYTE *)a2 == 1)
  {
    v7 = (char *)&ipv6cp_gotoptions + 52 * v4;
    v9 = *((_DWORD *)v7 + 9);
    v8 = v7 + 36;
    if (*(_DWORD *)(a2 + 2) != v9)
      return 0;
    result = 0;
    if (*(_DWORD *)(a2 + 6) != *((_DWORD *)v8 + 1))
      return result;
    a2 += 10;
    a3 -= 10;
  }
  if (v6)
  {
    if (*(_BYTE *)(a2 + 1) == 4 && a3 >= 4)
    {
      if (*(_BYTE *)a2 != 2
        || *((unsigned __int16 *)&ipv6cp_gotoptions + 26 * v4 + 16) != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
      {
        return 0;
      }
      v6 = 0;
      a3 -= 4;
    }
  }
  if (a3)
    return 0;
  if (*(_DWORD *)(v3 + 8) != 9)
  {
    *v5 = result;
    v5[7] = v6;
  }
  return 1;
}

uint64_t sub_10002974C(int *a1, char *__src, int *a3, int a4)
{
  int v4;
  int v5;
  char *v6;
  char *v7;
  unint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  _BOOL4 v24;
  char *v25;
  uint64_t v26;
  char *v27;
  _DWORD *v28;
  int v29;
  int v31;
  _BOOL4 v33;
  _QWORD *v36;
  char *v37;
  _DWORD *v38;

  v4 = *a1;
  v37 = (char *)&ipv6cp_hisoptions + 52 * *a1;
  v38 = (_DWORD *)((char *)&ipv6cp_allowoptions + 52 * *a1);
  v31 = *a1;
  v5 = *a3;
  *((_DWORD *)v37 + 12) = 0;
  *((_OWORD *)v37 + 1) = 0u;
  *((_OWORD *)v37 + 2) = 0u;
  *(_OWORD *)v37 = 0u;
  v6 = (char *)&ipv6cp_gotoptions + 52 * v4;
  v7 = v6 + 36;
  v8 = (unint64_t *)((char *)&ipv6cp_wantoptions + 52 * v4 + 44);
  v9 = (uint64_t *)(v6 + 44);
  v36 = v37 + 44;
  v33 = a4 != 0;
  v10 = 2;
  v11 = __src;
  v12 = __src;
  while (v5)
  {
    v13 = v11;
    if (v5 < 2
      || ((v14 = v11[1], v14 >= 2) ? (v15 = v5 >= v14) : (v15 = 0), !v15))
    {
      LOWORD(v14) = v5;
      v16 = 1;
      v5 = 0;
      goto LABEL_43;
    }
    v16 = *v11;
    v5 -= v14;
    v11 += v14;
    if (v16 != 1)
    {
      v16 = 1;
      goto LABEL_43;
    }
    if ((_DWORD)v14 != 10 || !*v38)
      goto LABEL_43;
    v17 = *(_QWORD *)(v13 + 2);
    LODWORD(v18) = v17;
    v19 = HIDWORD(v17);
    if (!v17 && !*(_QWORD *)v7)
    {
      v16 = 1;
      goto LABEL_42;
    }
    if (!*v8 || *v8 == v17 || *v9)
    {
      if (!v17 || *(_QWORD *)v7 == v17)
      {
        if (!*v9)
        {
          v17 = *v8;
          v19 = HIDWORD(*v8);
          v18 = *v8;
        }
        v20 = v17;
        while (!(v19 | v18)
             || (_DWORD)v18 == *(_DWORD *)v7 && (_DWORD)v19 == *((_DWORD *)v7 + 1))
        {
          LODWORD(v17) = magic();
          v19 = magic();
          v20 = v17 & 0xFD;
          LODWORD(v18) = v17 & 0xFFFFFFFD;
        }
        v21 = v17 & 0xFFFFFF00 | v20 | (v19 << 32);
        goto LABEL_30;
      }
      *(_DWORD *)v37 = 1;
      *v36 = v17;
      if ((_DWORD)v10 == 2)
      {
        v16 = 0;
LABEL_42:
        LOWORD(v14) = 10;
        goto LABEL_43;
      }
    }
    else
    {
      v21 = *v8;
      v20 = *v8;
      v19 = HIDWORD(*v8);
      v17 = *v8;
LABEL_30:
      *v9 = v21;
      v22 = v17 & 0xFFFFFF00 | v20 | (v19 << 32);
      *(_QWORD *)(v13 + 2) = v22;
      *(_DWORD *)v37 = 1;
      *v36 = v22;
      if (a4)
      {
        LOWORD(v14) = 10;
        v16 = v33;
        goto LABEL_43;
      }
      if ((_DWORD)v10 != 4)
      {
        v23 = (_DWORD)v10 == 2;
        LOWORD(v14) = 10;
        LODWORD(v10) = 3;
        v16 = v33;
        if (v23)
          v16 = 0;
        if (v23)
          v12 = __src;
LABEL_43:
        v24 = v10 != 4;
        if ((v16 & v24) != 0)
          v10 = 4;
        else
          v10 = v10;
        if ((v16 & v24) != 0)
          v25 = __src;
        else
          v25 = v12;
        v26 = (unsigned __int16)v14;
        if (v25 != v13)
          memcpy(v25, v13, (unsigned __int16)v14);
        v12 = &v25[v26];
      }
    }
  }
  if ((_DWORD)v10 != 4 && !*(_DWORD *)v37 && !a4)
  {
    v27 = (char *)&ipv6cp_wantoptions + 52 * v31;
    v29 = *((_DWORD *)v27 + 1);
    v28 = v27 + 4;
    if (v29)
    {
      if ((_DWORD)v10 == 2)
      {
        *v28 = 0;
        v12 = __src;
      }
      *(_WORD *)v12 = 2561;
      *(_QWORD *)(v12 + 2) = *v8;
      LODWORD(v12) = (_DWORD)v12 + 10;
      v10 = 3;
    }
  }
  *a3 = (_DWORD)v12 - (_DWORD)__src;
  return v10;
}

void sub_100029AA4(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  char *v10;
  uint64_t *v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int v42;
  int v43;
  char *v44;
  int v45;
  int v46;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  int v52;
  int v53;

  v9 = *a1;
  if (!*((_DWORD *)&ipv6cp_hisoptions + 13 * (int)*a1))
    *(_QWORD *)((char *)&ipv6cp_hisoptions + 52 * (int)v9 + 44) = *(_QWORD *)((char *)&ipv6cp_wantoptions
                                                                            + 52 * (int)v9
                                                                            + 44);
  if (!no_ifaceid_neg)
  {
    v41 = (char *)&ipv6cp_hisoptions + 52 * (int)v9;
    v42 = *((_DWORD *)v41 + 11);
    v43 = *((_DWORD *)v41 + 12);
    if (v43 | v42)
    {
      v44 = (char *)&ipv6cp_gotoptions + 52 * (int)v9;
      v45 = *((_DWORD *)v44 + 9);
      v46 = *((_DWORD *)v44 + 10);
      if (v46 | v45)
      {
        if (v45 != v42 || v46 != v43)
          goto LABEL_4;
        v48 = "local and remote LL addresses are equal";
      }
      else
      {
        v48 = "Could not determine local LL address";
      }
    }
    else
    {
      v48 = "Could not determine remote LL address";
    }
    error(v48, a2, a3, a4, a5, a6, a7, a8, v52);
    v50 = (char *)&ipv6cp_fsm + 80 * (int)*a1;
    v51 = v48;
    goto LABEL_27;
  }
LABEL_4:
  v10 = (char *)&ipv6cp_gotoptions + 52 * (int)v9;
  v12 = *(_QWORD *)(v10 + 36);
  v11 = (uint64_t *)(v10 + 36);
  v13 = eui64_ntoa(v12);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v13);
  script_setenv("LLLOCAL", byte_10004BED4);
  v14 = (char *)&ipv6cp_hisoptions + 52 * (int)v9;
  v16 = *(_QWORD *)(v14 + 44);
  v15 = (uint64_t *)(v14 + 44);
  v17 = eui64_ntoa(v16);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v17);
  script_setenv("LLREMOTE", byte_10004BED4);
  if (!sif6addr(*a1, *v11, *v15))
  {
    if (debug)
    {
      v49 = "sif6addr failed";
LABEL_21:
      warning(v49, v18, v19, v20, v21, v22, v23, v24, v53);
    }
LABEL_22:
    v50 = (char *)&ipv6cp_fsm + 80 * (int)*a1;
    v51 = "Interface configuration failed";
LABEL_27:
    fsm_close((uint64_t)v50, v51, v19, v20, v21, v22, v23, v24);
    return;
  }
  if (!sifup())
  {
    if (debug)
    {
      v49 = "sifup failed (IPV6)";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  sifnpmode(*a1, 87, 0);
  v25 = eui64_ntoa(*v11);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v25);
  notice("local  LL address %s", v26, v27, v28, v29, v30, v31, v32, (int)byte_10004BED4);
  v33 = eui64_ntoa(*v15);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v33);
  notice("remote LL address %s", v34, v35, v36, v37, v38, v39, v40, (int)byte_10004BED4);
  np_up();
  byte_10004BF1C = 1;
  if ((byte_10004BF20 & 1) == 0 && !dword_10004BF24)
  {
    byte_10004BF20 = 1;
    sub_100029E84("/etc/ppp/ipv6-up");
  }
}

uint64_t sub_100029D7C(unsigned int *a1)
{
  uint64_t result;

  update_link_stats(*a1);
  if (byte_10004BF1C == 1)
  {
    byte_10004BF1C = 0;
    np_down();
  }
  sifnpmode(*a1, 87, 1);
  sifdown();
  result = cif6addr();
  if (byte_10004BF20 == 1 && dword_10004BF24 == 0)
  {
    byte_10004BF20 = 0;
    return sub_100029E84("/etc/ppp/ipv6-down");
  }
  return result;
}

void sub_100029E38(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004BF28 == 1)
  {
    byte_10004BF28 = 0;
    np_finished(*a1, 87, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t **sub_100029E5C(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2)
    return notify((uint64_t **)protocolsready_notifier, 0);
  return result;
}

uint64_t sub_100029E84(char *a1)
{
  char *v2;
  char *v3;
  uint64_t result;
  char *v5[8];
  _BYTE v6[32];
  char v7[32];
  char __str[32];

  snprintf(__str, 0x20uLL, "%d", baud_rate);
  v2 = eui64_ntoa(qword_10004A064);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v2);
  __strlcpy_chk(v7, byte_10004BED4, 32, 32);
  v3 = eui64_ntoa(qword_10004A0D4);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v3);
  __strlcpy_chk(v6, byte_10004BED4, 32, 32);
  v5[0] = a1;
  v5[1] = &ifname;
  v5[2] = (char *)&devnam;
  v5[3] = __str;
  v5[4] = v7;
  v5[5] = v6;
  v5[6] = (char *)ipparam;
  v5[7] = 0;
  result = run_program(a1, v5, 0, (uint64_t)sub_100029FE4, 0);
  dword_10004BF24 = result;
  return result;
}

void sub_100029FE4()
{
  const char *v0;

  dword_10004BF24 = 0;
  if (byte_10004BF20 == 1)
  {
    if (dword_10004A0E8 == 9)
      return;
    v0 = "/etc/ppp/ipv6-down";
  }
  else
  {
    if (dword_10004A0E8 != 9)
      return;
    v0 = "/etc/ppp/ipv6-up";
  }
  byte_10004BF20 ^= 1u;
  sub_100029E84(v0);
}

char *eui64_ntoa(unint64_t a1)
{
  snprintf(byte_10004BF29, 0x20uLL, "%02x%02x:%02x%02x:%02x%02x:%02x%02x", a1, BYTE1(a1), BYTE2(a1), BYTE3(a1), BYTE4(a1), BYTE5(a1), BYTE6(a1), HIBYTE(a1));
  return byte_10004BF29;
}

void sub_10002A0A8(int a1)
{
  char *v1;

  v1 = (char *)&acscp_fsm + 80 * a1;
  acsp_no_routes = 0;
  acsp_no_domains = 0;
  *(_DWORD *)v1 = a1;
  *((_DWORD *)v1 + 1) = 33333;
  *((_QWORD *)v1 + 7) = off_100046F58;
  fsm_init((uint64_t)v1);
  *(_QWORD *)&acscp_wantoptions = 0x100000000;
  *((_QWORD *)&acscp_wantoptions + 1) = &_mh_execute_header;
  acscp_allowoptions = 0x100000000;
  *(_QWORD *)&byte_10004A178 = &_mh_execute_header;
}

void sub_10002A11C(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  fsm_input((uint64_t)&acscp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_10002A130(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_protreject((uint64_t)&acscp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_10002A144(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_lowerup((uint64_t)&acscp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_10002A158(int a1)
{
  fsm_lowerdown((uint64_t)&acscp_fsm + 80 * a1);
}

void sub_10002A16C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_open((uint64_t)&acscp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
  byte_10004BF4C = 1;
}

void sub_10002A19C(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fsm_close((uint64_t)&acscp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10002A1B0(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  unsigned int v6;
  int v7;
  int v11;
  int v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  int v17;
  unsigned __int8 *v18;
  const char *v19;
  unsigned __int8 *v20;
  int64_t v21;
  int v22;
  unsigned int v23;
  int v24;

  if (a2 < 4)
    return 0;
  v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  v7 = v6 - 4;
  if (v6 < 4 || v6 > a2)
    return 0;
  v11 = *a1;
  v12 = a1[1];
  v13 = a1 + 4;
  if ((v11 - 1) > 6)
    v14 = " code=0x%x";
  else
    v14 = " %s";
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        v15 = v13[1];
        if (v15 < 2 || v7 < v15)
          goto LABEL_36;
        v17 = *v13;
        a3(a4, " <");
        if (v17 == 1)
          break;
        v18 = v13;
        if (v17 == 2)
        {
          v19 = "domain vers %d";
LABEL_23:
          v18 = v13 + 6;
          htonl(bswap32(*(_DWORD *)(v13 + 2)));
          a3(a4, v19);
        }
        if (v18 < &v13[v15])
        {
          v20 = &v13[v15];
          v21 = v20 - v18;
          do
          {
            v22 = *v18++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v22);
            --v21;
          }
          while (v21);
          v18 = v20;
        }
        v7 -= v15;
        a3(a4, ">");
        v13 = v18;
        if (v7 <= 1)
          goto LABEL_35;
      }
      v19 = "route vers %d";
      goto LABEL_23;
    }
LABEL_34:
    v18 = a1 + 4;
LABEL_35:
    v13 = v18;
    if (v7 < 1)
      return ((_DWORD)v13 - (_DWORD)a1);
    goto LABEL_36;
  }
  if ((v11 - 5) >= 2)
    goto LABEL_34;
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_36:
      v23 = v7 + 1;
      do
      {
        v24 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
        --v23;
      }
      while (v23 > 1);
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v13) = (_DWORD)v13 + v7;
  }
  return ((_DWORD)v13 - (_DWORD)a1);
}

_QWORD *sub_10002A3F4()
{
  BOOL v0;
  _QWORD *result;

  if (byte_100046F00)
    v0 = 0;
  else
    v0 = acsp_use_dhcp == 0;
  if (!v0 || acsp_intercept_dhcp != 0)
  {
    result = add_notifier(&phasechange, (uint64_t)acsp_init_plugins, 0);
    if (acsp_intercept_dhcp)
      ip_src_address_filter |= 4u;
  }
  if (acsp_use_dhcp)
    ip_src_address_filter |= 8u;
  return result;
}

uint64_t sub_10002A484(int a1)
{
  return *((unsigned int *)&acscp_fsm + 20 * a1 + 2);
}

double sub_10002A49C()
{
  double result;

  result = *(double *)&acscp_wantoptions;
  acscp_gotoptions = acscp_wantoptions;
  return result;
}

uint64_t sub_10002A4B8()
{
  int v0;
  int v1;

  if ((_BYTE)acscp_gotoptions)
    v0 = 6;
  else
    v0 = 0;
  if (BYTE8(acscp_gotoptions))
    v1 = 6;
  else
    v1 = 0;
  return (v1 + v0);
}

void sub_10002A4E4(uint64_t a1, uint64_t a2, int *a3)
{
  int v3;

  v3 = *a3;
  if ((_BYTE)acscp_gotoptions)
  {
    if (v3 < 6)
    {
      LOBYTE(acscp_gotoptions) = 0;
    }
    else
    {
      *(_WORD *)a2 = 1537;
      *(_BYTE *)(a2 + 2) = BYTE7(acscp_gotoptions);
      *(_BYTE *)(a2 + 3) = BYTE6(acscp_gotoptions);
      *(_BYTE *)(a2 + 4) = BYTE5(acscp_gotoptions);
      *(_BYTE *)(a2 + 5) = BYTE4(acscp_gotoptions);
      a2 += 6;
      v3 -= 6;
    }
  }
  if (BYTE8(acscp_gotoptions))
  {
    if (v3 < 6)
    {
      BYTE8(acscp_gotoptions) = 0;
    }
    else
    {
      *(_WORD *)a2 = 1538;
      *(_BYTE *)(a2 + 2) = HIBYTE(acscp_gotoptions);
      *(_BYTE *)(a2 + 3) = BYTE14(acscp_gotoptions);
      *(_BYTE *)(a2 + 4) = BYTE13(acscp_gotoptions);
      *(_BYTE *)(a2 + 5) = BYTE12(acscp_gotoptions);
      v3 -= 6;
    }
  }
  *a3 -= v3;
}

uint64_t sub_10002A5A4(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v3;
  BOOL v4;
  BOOL v5;

  if ((_BYTE)acscp_gotoptions)
  {
    v3 = __OFSUB__(a3, 6);
    a3 -= 6;
    if (a3 < 0 != v3)
      return 0;
    v4 = *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 1;
    if (!v4 || DWORD1(acscp_gotoptions) != bswap32(*(_DWORD *)(a2 + 2)))
      return 0;
    a2 += 6;
  }
  if (BYTE8(acscp_gotoptions))
  {
    if (a3 >= 6)
    {
      v5 = *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 2;
      if (v5 && a3 == 6 && HIDWORD(acscp_gotoptions) == bswap32(*(_DWORD *)(a2 + 2)))
        return 1;
    }
  }
  else if (!a3)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_10002A644(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  v3 = DWORD1(acscp_gotoptions);
  v4 = HIDWORD(acscp_gotoptions);
  if ((_BYTE)acscp_gotoptions && a3 >= 6 && *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 1)
  {
    v5 = *(_DWORD *)(a2 + 2);
    a2 += 6;
    v6 = bswap32(v5);
    if (v6 < 2)
      v3 = v6;
    a3 -= 6;
  }
  if (BYTE8(acscp_gotoptions))
  {
    if (*(_BYTE *)(a2 + 1) == 6 && a3 >= 6)
    {
      if (*(_BYTE *)a2 != 2)
        goto LABEL_17;
      a3 -= 6;
      v8 = *(_DWORD *)(a2 + 2);
      a2 += 6;
      v9 = bswap32(v8);
      if (v9 < 2)
        v4 = v9;
    }
  }
  if (a3 < 3)
  {
LABEL_19:
    if (*(_DWORD *)(a1 + 8) != 9)
    {
      DWORD1(acscp_gotoptions) = v3;
      HIDWORD(acscp_gotoptions) = v4;
    }
    return 1;
  }
  else
  {
LABEL_17:
    while (1)
    {
      v10 = *(unsigned __int8 *)(a2 + 1);
      a3 -= v10;
      if (a3 < 0)
        return 0;
      a2 += v10;
      if (a3 <= 2)
        goto LABEL_19;
    }
  }
}

uint64_t sub_10002A71C(uint64_t a1, uint64_t a2, int a3)
{
  char v3;
  char v4;
  uint64_t v5;

  v3 = acscp_gotoptions;
  v4 = BYTE8(acscp_gotoptions);
  if ((_BYTE)acscp_gotoptions && a3 >= 6 && *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 1)
  {
    v5 = 0;
    if (bswap32(*(_DWORD *)(a2 + 2)) != DWORD1(acscp_gotoptions))
      return v5;
    v3 = 0;
    a2 += 6;
    a3 -= 6;
  }
  if (!BYTE8(acscp_gotoptions))
    goto LABEL_15;
  if (*(_BYTE *)(a2 + 1) != 6 || a3 < 6)
    goto LABEL_15;
  if (*(_BYTE *)a2 != 2)
    return 0;
  v5 = 0;
  if (bswap32(*(_DWORD *)(a2 + 2)) == HIDWORD(acscp_gotoptions))
  {
    v4 = 0;
    a3 -= 6;
LABEL_15:
    if (a3)
      return 0;
    if (*(_DWORD *)(a1 + 8) != 9)
    {
      LOBYTE(acscp_gotoptions) = v3;
      BYTE8(acscp_gotoptions) = v4;
    }
    return 1;
  }
  return v5;
}

uint64_t sub_10002A7E8(int a1, unsigned __int8 *__src, int *a3, int a4)
{
  int v5;
  int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  char *v9;
  unsigned __int8 *v10;
  int v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  uint64_t *v18;
  int *v19;
  BOOL v20;
  _BOOL4 v21;
  char *v22;
  uint64_t v23;
  _BOOL4 v25;

  v5 = *a3;
  acscp_hisoptions = 0;
  *(_QWORD *)&byte_10004A188 = 0;
  v25 = a4 != 0;
  v6 = acscp_allowoptions;
  v7 = 2;
  v8 = __src;
  v9 = (char *)__src;
LABEL_2:
  v10 = v8;
LABEL_3:
  v11 = byte_10004A178;
  v12 = dword_10004A17C;
  v13 = v10;
  v14 = HIDWORD(acscp_allowoptions);
  while (v5)
  {
    if (v5 < 2 || ((v15 = v13[1], v15 >= 2) ? (v16 = v5 >= v15) : (v16 = 0), !v16))
    {
      LOWORD(v15) = v5;
      v17 = 1;
      v8 = v13;
      v5 = 0;
      goto LABEL_33;
    }
    v17 = *v13;
    v5 -= v15;
    v8 = &v13[v15];
    if (v17 == 2)
    {
      v17 = 1;
      if ((_DWORD)v15 != 6 || !v11)
        goto LABEL_33;
      v18 = (uint64_t *)&byte_10004A188;
      if (bswap32(*(_DWORD *)(v13 + 2)) > v12)
      {
        HIBYTE(v14) = HIBYTE(v12);
        v19 = &dword_10004A17C;
        goto LABEL_23;
      }
    }
    else
    {
      if (v17 != 1)
      {
        v17 = 1;
        goto LABEL_33;
      }
      if ((_DWORD)v15 != 6 || !v6)
        goto LABEL_33;
      v18 = &acscp_hisoptions;
      if (bswap32(*(_DWORD *)(v13 + 2)) > v14)
      {
        v19 = (int *)&acscp_allowoptions + 1;
LABEL_23:
        v13[2] = HIBYTE(v14);
        v13[3] = *((_WORD *)v19 + 1);
        v13[4] = BYTE1(*v19);
        v13[5] = *v19;
        if (a4)
        {
          LOWORD(v15) = 6;
          v17 = v25;
        }
        else
        {
          v10 = v8;
          if ((_DWORD)v7 == 4)
            goto LABEL_3;
          v20 = (_DWORD)v7 == 2;
          LOWORD(v15) = 6;
          LODWORD(v7) = 3;
          v17 = v25;
          if (v20)
            v17 = 0;
          if (v20)
            v9 = (char *)__src;
        }
LABEL_33:
        v21 = v7 != 4;
        if ((v17 & v21) != 0)
          v7 = 4;
        else
          v7 = v7;
        if ((v17 & v21) != 0)
          v22 = (char *)__src;
        else
          v22 = v9;
        v23 = (unsigned __int16)v15;
        if (v22 != (char *)v13)
        {
          memcpy(v22, v13, (unsigned __int16)v15);
          v6 = acscp_allowoptions;
        }
        v9 = &v22[v23];
        goto LABEL_2;
      }
    }
    *(_BYTE *)v18 = 1;
    v13 = v8;
    if ((_DWORD)v7 == 2)
    {
      v17 = 0;
      v13 = v10;
      LOWORD(v15) = 6;
      goto LABEL_33;
    }
  }
  *a3 = (_DWORD)v9 - (_DWORD)__src;
  return v7;
}

void sub_10002AA10()
{
  __int16 mtu;
  uint64_t **v1;

  mtu = netif_get_mtu();
  v1 = notify((uint64_t **)acsp_up_notifier, 0);
  if (acsp_up_hook)
    acsp_up_hook(v1);
  check_protocols_ready();
  acsp_start(mtu);
}

uint64_t (*sub_10002AA5C())(void)
{
  uint64_t (*result)(void);

  notify((uint64_t **)acsp_down_notifier, 0);
  acsp_stop();
  result = acsp_down_hook;
  if (acsp_down_hook)
    return (uint64_t (*)(void))acsp_down_hook();
  return result;
}

void sub_10002AA94(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004BF4C == 1)
  {
    byte_10004BF4C = 0;
    np_finished(*a1, 565, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t **sub_10002AAB8(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2)
    return notify((uint64_t **)protocolsready_notifier, 0);
  return result;
}

void acsp_init_plugins()
{
  char i;
  char v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  qword_10004BF50 = 0;
  remove_notifier((_QWORD **)&phasechange, (uint64_t)acsp_init_plugins, 0);
  sub_10002ACB0();
  for (i = 1; ; i = 0)
  {
    v1 = i;
    v2 = malloc_type_malloc(0x78uLL, 0x10A0040E44D7C7EuLL);
    if (!v2)
      break;
    v10 = v2;
    if ((v1 & 1) != 0)
    {
      *((_BYTE *)v2 + 64) = 1;
      if (!sub_10002CEF0(v2, 1))
      {
        v18 = &qword_10004BF58;
LABEL_9:
        v19 = v10[9];
        *(_QWORD *)(v19 + 48) = *v18;
        if (*((_BYTE *)v10 + 64) == 2)
          add_notifier_last((_QWORD **)&ip_up_notify, (uint64_t)sub_10002CFCC, v19);
        else
          add_notifier(&ip_up_notify, (uint64_t)sub_10002CFCC, v19);
        add_notifier(&ip_down_notify, (uint64_t)sub_10002D00C, v10[9]);
        *(_QWORD *)((char *)v10 + 12) = 0x2000000000;
        v10[4] = 0;
        v10[5] = 0;
        *((_WORD *)v10 + 24) = 16;
        *v10 = qword_10004BF50;
        qword_10004BF50 = (uint64_t)v10;
        goto LABEL_13;
      }
    }
    else
    {
      *((_BYTE *)v2 + 64) = 2;
      if (!sub_10002CEF0(v2, 2))
      {
        v18 = &qword_10004BF60;
        goto LABEL_9;
      }
    }
    error("error initializing acsp plugin type\n", v11, v12, v13, v14, v15, v16, v17, v20);
    free(v10);
LABEL_13:
    if ((v1 & 1) == 0)
    {
      ipdata_input_hook = (uint64_t (*)(void))sub_10002B4FC;
      ipdata_up_hook = (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_10002BEEC;
      ipdata_down_hook = (uint64_t (*)(_QWORD))sub_10002BFB4;
      ipdata_print_hook = (uint64_t (*)(void))sub_10002C010;
      return;
    }
  }
  error("acscp unable allocate plugin structures\n", v3, v4, v5, v6, v7, v8, v9, v20);
  byte_100046F00 = 0;
}

void sub_10002ACB0()
{
  const __SCPreferences *v0;
  const __SCPreferences *v1;
  const __CFDictionary *Value;
  const __CFDictionary *v3;
  CFStringRef v4;
  CFStringRef v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const __CFString *v12;
  const __CFString *v13;
  CFTypeID v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  CFTypeID v17;
  const __CFArray *v18;
  const __CFArray *v19;
  CFTypeID v20;
  CFIndex Count;
  const __CFArray *v22;
  const __CFArray *v23;
  CFTypeID v24;
  const __CFArray *v25;
  const __CFArray *v26;
  CFTypeID v27;
  CFIndex v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFIndex v36;
  const __CFArray *v37;
  const __CFString *ValueAtIndex;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;
  in_addr *v49;
  in_addr *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  in_addr_t s_addr;
  const __CFDictionary *v59;
  const __CFDictionary *v60;
  CFTypeID v61;
  const __CFArray *v62;
  const __CFArray *v63;
  CFTypeID v64;
  CFIndex v65;
  const __CFArray *v66;
  const __CFArray *v67;
  CFTypeID v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  CFIndex v76;
  CFIndex i;
  const __CFString *v78;
  size_t v79;
  size_t v80;
  in_addr *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  in_addr *v89;
  size_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const __CFString *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  SCDynamicStoreRef v107;
  const __SCDynamicStore *v108;
  const __CFString *NetworkGlobalEntity;
  const __CFString *v110;
  const __CFDictionary *v111;
  const __CFDictionary *v112;
  CFTypeID v113;
  const __CFString *v114;
  const __CFString *v115;
  CFTypeID v116;
  int v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  int v127;
  size_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  CFIndex v138;
  const __CFArray *v139;
  uint64_t v140;
  in_addr v141[2];
  in_addr v142;
  char buffer[1024];

  qword_10004BF58 = 0;
  qword_10004BF60 = 0;
  if (serverid)
  {
    v0 = SCPreferencesCreate(0, CFSTR("pppd"), CFSTR("com.apple.RemoteAccessServers.plist"));
    if (v0)
    {
      v1 = v0;
      Value = (const __CFDictionary *)SCPreferencesGetValue(v0, CFSTR("Servers"));
      if (Value)
      {
        v3 = Value;
        v4 = CFStringCreateWithCString(0, (const char *)serverid, 0);
        if (!v4)
        {
LABEL_9:
          CFRelease(v1);
          return;
        }
        v5 = v4;
        v6 = (const __CFDictionary *)CFDictionaryGetValue(v3, v4);
        if (v6)
        {
          v7 = v6;
          if (!acsp_no_routes)
          {
            v15 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetIPv4);
            if (v15)
            {
              v16 = v15;
              v17 = CFGetTypeID(v15);
              if (v17 == CFDictionaryGetTypeID())
              {
                v18 = (const __CFArray *)CFDictionaryGetValue(v16, CFSTR("OfferedRouteAddresses"));
                if (v18)
                {
                  v19 = v18;
                  v20 = CFGetTypeID(v18);
                  if (v20 == CFArrayGetTypeID())
                  {
                    Count = CFArrayGetCount(v19);
                    v22 = (const __CFArray *)CFDictionaryGetValue(v16, CFSTR("OfferedRouteMasks"));
                    if (v22)
                    {
                      v23 = v22;
                      v24 = CFGetTypeID(v22);
                      if (v24 == CFArrayGetTypeID())
                      {
                        v138 = CFArrayGetCount(v19);
                        v25 = (const __CFArray *)CFDictionaryGetValue(v16, CFSTR("OfferedRouteTypes"));
                        if (v25)
                        {
                          v26 = v25;
                          v140 = Count;
                          v27 = CFGetTypeID(v25);
                          if (v27 == CFArrayGetTypeID())
                          {
                            v28 = CFArrayGetCount(v26);
                            if (v140 == v138 && v140 == v28)
                            {
                              v139 = v26;
                              LOBYTE(acscp_allowoptions) = 1;
                              if (v140 >= 1)
                              {
                                v36 = 0;
                                *(_QWORD *)&v141[0].s_addr = 0;
                                v137 = "ACSP plugin: invalid route type specified\n";
                                v37 = v139;
                                while (1)
                                {
                                  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v36);
                                  buffer[0] = 0;
                                  CFStringGetCString(ValueAtIndex, buffer, 1024, 0x8000100u);
                                  v39 = (const __CFString *)CFArrayGetValueAtIndex(v23, v36);
                                  LOBYTE(v142.s_addr) = 0;
                                  CFStringGetCString(v39, (char *)&v142, 1024, 0x8000100u);
                                  v40 = (const __CFString *)CFArrayGetValueAtIndex(v37, v36);
                                  if (CFStringCompare(v40, CFSTR("Private"), 0))
                                  {
                                    if (CFStringCompare(v40, CFSTR("Public"), 0))
                                      goto LABEL_84;
                                    v48 = 2;
                                  }
                                  else
                                  {
                                    v48 = 1;
                                  }
                                  v49 = (in_addr *)malloc_type_malloc(0x20uLL, 0x1020040983EA955uLL);
                                  if (!v49)
                                    break;
                                  v50 = v49;
                                  *(_OWORD *)&v49->s_addr = 0u;
                                  *(_OWORD *)&v49[4].s_addr = 0u;
                                  if (!inet_aton(buffer, &v141[1]) || !inet_aton((const char *)&v142, v141))
                                  {
                                    error("ACSP plugin: invalid ip address or mask specified\n", v51, v52, v53, v54, v55, v56, v57, (int)"ACSP plugin: invalid route type specified\n");
                                    free(v50);
                                    goto LABEL_86;
                                  }
                                  s_addr = v141[0].s_addr;
                                  v50[2].s_addr = (in_addr_t)v141[1];
                                  v50[3].s_addr = s_addr;
                                  LOWORD(v50[5].s_addr) = v48;
                                  v50[6].s_addr = 0;
                                  *(_QWORD *)&v50->s_addr = qword_10004BF58;
                                  qword_10004BF58 = (uint64_t)v50;
                                  ++v36;
                                  v37 = v139;
                                  if (v140 == v36)
                                    goto LABEL_7;
                                }
                                v137 = "ACSP plugin: no memory\n";
LABEL_84:
                                error(v137, v41, v42, v43, v44, v45, v46, v47, (int)v137);
                                LOBYTE(acscp_allowoptions) = 0;
                              }
                              if (!qword_10004BF58)
LABEL_86:
                                LOBYTE(acscp_allowoptions) = 0;
                            }
                            else
                            {
                              error("ACSP plugin: while reading prefs - route address, mask, and type counts not equal\n", v29, v30, v31, v32, v33, v34, v35, (int)v137);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_7:
          if (!acsp_no_domains)
          {
            v59 = (const __CFDictionary *)CFDictionaryGetValue(v7, kSCEntNetDNS);
            if (v59)
            {
              v60 = v59;
              v61 = CFGetTypeID(v59);
              if (v61 == CFDictionaryGetTypeID())
              {
                v62 = (const __CFArray *)CFDictionaryGetValue(v60, CFSTR("OfferedSearchDomains"));
                if (v62)
                {
                  v63 = v62;
                  v64 = CFGetTypeID(v62);
                  if (v64 == CFArrayGetTypeID())
                  {
                    v65 = CFArrayGetCount(v63);
                    v66 = (const __CFArray *)CFDictionaryGetValue(v60, CFSTR("OfferedSearchDomainServers"));
                    v67 = v66;
                    if (v66 && (v68 = CFGetTypeID(v66), v68 == CFArrayGetTypeID()))
                    {
                      v76 = v65;
                      if (CFArrayGetCount(v67) != v65)
                      {
                        error("ACSP plugin: search domain count not equal to search domain server count\n", v69, v70, v71, v72, v73, v74, v75, (int)v137);
                        goto LABEL_8;
                      }
                    }
                    else
                    {
                      v76 = 0;
                    }
                    v142.s_addr = 0;
                    byte_10004A178 = 1;
                    if (v65)
                    {
                      if (v65 >= 1)
                      {
                        for (i = 0; v65 != i; ++i)
                        {
                          v78 = (const __CFString *)CFArrayGetValueAtIndex(v63, i);
                          buffer[0] = 0;
                          CFStringGetCString(v78, buffer, 1024, 0x8000100u);
                          v79 = strlen(buffer);
                          if (v79)
                          {
                            v80 = v79;
                            v81 = (in_addr *)malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
                            if (!v81)
                            {
                              error("ACSP plugin: no memory\n", v82, v83, v84, v85, v86, v87, v88, (int)v137);
                              byte_10004A178 = 0;
                              break;
                            }
                            v89 = v81;
                            v90 = v80 + 1;
                            v91 = malloc_type_malloc(v90, 0xD9CA7187uLL);
                            *(_QWORD *)&v89[4].s_addr = v91;
                            if (!v91)
                            {
                              error("ACSP plugin: no memory\n", v92, v93, v94, v95, v96, v97, v98, (int)v137);
                              byte_10004A178 = 0;
                              free(v89);
                              break;
                            }
                            memcpy(v91, buffer, v90);
                            if (v76)
                            {
                              v99 = (const __CFString *)CFArrayGetValueAtIndex(v67, i);
                              buffer[0] = 0;
                              CFStringGetCString(v99, buffer, 1024, 0x8000100u);
                              if (!inet_aton(buffer, &v142))
                              {
                                error("ACSP plugin: invalid ip address specified for DNS server\n", v100, v101, v102, v103, v104, v105, v106, (int)v137);
                                free(v89);
                                goto LABEL_93;
                              }
                              v89[2].s_addr = v142.s_addr;
                            }
                            else
                            {
                              v89[2].s_addr = 0;
                            }
                            *(_QWORD *)&v89->s_addr = qword_10004BF60;
                            qword_10004BF60 = (uint64_t)v89;
                          }
                        }
                      }
                    }
                    else
                    {
                      v107 = SCDynamicStoreCreate(0, CFSTR("pppd"), 0, 0);
                      if (v107)
                      {
                        v108 = v107;
                        NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetDNS);
                        if (NetworkGlobalEntity)
                        {
                          v110 = NetworkGlobalEntity;
                          v111 = (const __CFDictionary *)SCDynamicStoreCopyValue(v108, NetworkGlobalEntity);
                          if (v111)
                          {
                            v112 = v111;
                            v113 = CFGetTypeID(v111);
                            if (v113 == CFDictionaryGetTypeID())
                            {
                              v114 = (const __CFString *)CFDictionaryGetValue(v112, kSCPropNetDNSDomainName);
                              if (v114)
                              {
                                v115 = v114;
                                v116 = CFGetTypeID(v114);
                                if (v116 == CFStringGetTypeID())
                                {
                                  buffer[0] = 0;
                                  CFStringGetCString(v115, buffer, 1024, 0x8000100u);
                                  v117 = strlen(buffer);
                                  if (v117)
                                  {
                                    v118 = malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
                                    if (v118)
                                    {
                                      v126 = v118;
                                      v127 = v117 + 1;
                                      v128 = v117 + 1;
                                      v129 = malloc_type_malloc(v127, 0x50471A90uLL);
                                      v126[2] = v129;
                                      if (v129)
                                      {
                                        memcpy(v129, buffer, v128);
                                        *((_DWORD *)v126 + 2) = 0;
                                        *v126 = qword_10004BF60;
                                        qword_10004BF60 = (uint64_t)v126;
                                      }
                                      else
                                      {
                                        error("ACSP plugin: no memory\n", v130, v131, v132, v133, v134, v135, v136, (int)v137);
                                        free(v126);
                                      }
                                    }
                                    else
                                    {
                                      error("ACSP plugin: no memory\n", v119, v120, v121, v122, v123, v124, v125, (int)v137);
                                    }
                                  }
                                }
                              }
                            }
                            CFRelease(v110);
                          }
                          else
                          {
                            v112 = (const __CFDictionary *)v110;
                          }
                          CFRelease(v112);
                        }
                        CFRelease(v108);
                      }
                    }
                    if (!qword_10004BF60)
LABEL_93:
                      byte_10004A178 = 0;
                  }
                }
              }
            }
          }
        }
LABEL_8:
        CFRelease(v5);
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (!acsp_no_routes)
      LOBYTE(acscp_wantoptions) = 1;
    if (!acsp_no_domains)
      BYTE8(acscp_wantoptions) = 1;
    buffer[0] = 0;
    v8 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    if (!v8)
      goto LABEL_22;
    v9 = v8;
    v10 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, v8);
    if (v10)
    {
      v11 = v10;
      v12 = (const __CFString *)CFDictionaryGetValue(v10, kSCPropNetIPv4Router);
      if (v12)
      {
        v13 = v12;
        v14 = CFGetTypeID(v12);
        if (v14 == CFStringGetTypeID())
          CFStringGetCString(v13, buffer, 32, 0x8000100u);
      }
      CFRelease(v11);
    }
    CFRelease(v9);
    if (buffer[0])
      inet_aton(buffer, (in_addr *)&dword_10004BF68);
    else
LABEL_22:
      dword_10004BF68 = 0;
  }
}

void sub_10002B4FC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  uint64_t v28;
  int v29;
  int v30;
  BOOL v31;
  int v32;
  char *v34;
  signed int v35;
  int v36;
  uint64_t **v37;
  unsigned __int8 *v38;
  uint64_t v39;
  int v40;
  int v41;
  int *v42;
  unsigned int v43;
  _OWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v70;
  char *v71;
  uint64_t **v72;
  uint64_t **v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  __int16 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int16 v93;
  unsigned int v94;
  _QWORD *v95;
  _QWORD *v96;
  size_t v97;
  int v98;
  uint64_t v99;
  __int16 *v100;
  int v101;
  uint64_t v102;
  int v103;
  char v104;
  unsigned int v105;
  int v106;
  unsigned int v107;
  unsigned int v108;
  char v109;
  int v110;
  char v111;
  char *v112;
  unsigned int v113;
  uint64_t *v114;
  _BYTE *v115;
  uint64_t v116;
  int v117;
  int v118;
  uint64_t v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  int v124;
  char *__stringp;
  char __s[16];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int16 v140;

  if (!acsp_intercept_dhcp
    || ntohl(*(unsigned int *)(a2 + 16)) != -1
    || ntohs(*(unsigned __int16 *)(a2 + 20)) != 68
    || ntohs(*(unsigned __int16 *)(a2 + 22)) != 67)
  {
    if (!acsp_use_dhcp
      || *(_DWORD *)(a2 + 16) != (_DWORD)a4
      || ntohs(*(unsigned __int16 *)(a2 + 20)) != 67
      || ntohs(*(unsigned __int16 *)(a2 + 22)) != 68)
    {
      return;
    }
    if (a3 > 0x10E)
    {
      if (!qword_10004BF70)
        return;
      ntohl(*(unsigned int *)(a2 + 40));
      if (bswap32(*(_DWORD *)(a2 + 264)) == 1669485411)
      {
        if (*(_BYTE *)(a2 + 268) == 53 && *(_BYTE *)(a2 + 269) == 1 && *(_BYTE *)(a2 + 270) == 5)
        {
          __stringp = 0;
          v35 = a3 - 271;
          if ((int)(a3 - 271) >= 1)
          {
            v36 = *(unsigned __int8 *)(a2 + 271);
            if (v36 != 255)
            {
              v37 = 0;
              v38 = (unsigned __int8 *)(a2 + 271);
              do
              {
                if (v36)
                {
                  v39 = v38[1];
                  v40 = v35 - 2;
                  v25 = __OFSUB__(v40, (_DWORD)v39);
                  v41 = v40 - v39;
                  if ((v41 < 0) ^ v25 | (v41 == 0))
                  {
LABEL_106:
                    v34 = "DHCP packet received with incorrect message option\n";
                    goto LABEL_104;
                  }
                  v42 = (int *)(v38 + 2);
                  v124 = v41;
                  switch(v36)
                  {
                    case 1:
                      v57 = *v42;
                      v58 = qword_10004BF70;
                      v59 = *(unsigned int *)(qword_10004BF70 + 36);
                      if (*v42)
                        v60 = (_DWORD)v59 == (_DWORD)a4;
                      else
                        v60 = 0;
                      if (v60 && (v59 = a4, *(_DWORD *)(qword_10004BF70 + 24) != v57))
                      {
                        *(_DWORD *)(qword_10004BF70 + 24) = v57;
                        if (!uifaddr(a1, a4, *(_DWORD *)(v58 + 40), v57))
                        {
                          v74 = v38[2];
                          v75 = qword_10004BF70;
                          ntohl(*(unsigned int *)(qword_10004BF70 + 36));
                          ntohl(*(unsigned int *)(v75 + 40));
                          notice("failed to configure dhcp option 'subnet mask' = %d.%d.%d.%d, our %x, his %x\n", v76, v77, v78, v79, v80, v81, v82, v74);
                        }
                      }
                      else
                      {
                        v61 = *v42;
                        ntohl(v59);
                        ntohl(*(unsigned int *)(v58 + 24));
                        info("ignoring dhcp option 'subnet mask' = %d.%d.%d.%d, current addr %x, current mask %x\n", v62, v63, v64, v65, v66, v67, v68, v61);
                      }
                      break;
                    case 15:
                      if (v37)
                      {
                        notice("ignoring dhcp option 'domain name', option already processed.\n", v10, v11, v12, v13, v14, v15, v16, v123);
                        break;
                      }
                      __memcpy_chk(__s, v38 + 2, v39, 2048);
                      __s[v39] = 0;
                      __stringp = __s;
                      v70 = ",";
                      if (!strchr(__s, 44))
                      {
                        v70 = ";";
                        if (!strchr(__s, 59))
                        {
                          v70 = "\n";
                          if (!strchr(__s, 10))
                          {
                            v70 = "\r";
                            if (!strchr(__s, 13))
                            {
                              if (strchr(__s, 32))
                                v70 = " ";
                              else
                                v70 = &algn_10003B6CF;
                            }
                          }
                        }
                      }
                      v71 = strsep(&__stringp, v70);
                      v72 = 0;
                      while (1)
                      {
                        if (v71 && !*v71)
                        {
                          v37 = v72;
                        }
                        else
                        {
                          v73 = (uint64_t **)malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
                          if (!v73)
                          {
                            error("failed to allocate domain from DHCP packet\n", v10, v11, v12, v13, v14, v15, v16, v123);
                            v37 = v72;
                            goto LABEL_75;
                          }
                          v37 = v73;
                          v73[1] = 0;
                          v73[2] = 0;
                          *v73 = (uint64_t *)v72;
                          if (!v71)
                          {
                            v73[2] = (uint64_t *)__s;
                            goto LABEL_75;
                          }
                          v73[2] = (uint64_t *)v71;
                          v72 = v73;
                        }
                        v71 = strsep(&__stringp, v70);
                        if (!v71)
                          goto LABEL_75;
                      }
                    case 249:
                      if (v38[1])
                      {
                        v43 = 0;
                        do
                        {
                          v44 = malloc_type_malloc(0x20uLL, 0x1020040983EA955uLL);
                          if (!v44)
                          {
                            error("DHCP: no memory\n", v45, v46, v47, v48, v49, v50, v51, v123);
                            return;
                          }
                          v52 = v44;
                          *v44 = 0u;
                          v44[1] = 0u;
                          v53 = *((unsigned __int8 *)v42 + v43);
                          v54 = htonl((-1 << -(char)v53));
                          *((_DWORD *)v52 + 3) = v54;
                          LODWORD(v55) = v53 >> 3;
                          if ((v53 & 7) != 0)
                            v55 = (v55 + 1);
                          else
                            v55 = v55;
                          *((_DWORD *)v52 + 2) = *(int *)((char *)v42 + v43 + 1) & v54;
                          *((_DWORD *)v52 + 4) = *(int *)((char *)v42 + v55 + v43 + 1);
                          *((_WORD *)v52 + 10) = 1;
                          *((_DWORD *)v52 + 6) = 0;
                          v56 = qword_10004BF70;
                          *(_QWORD *)v52 = *(_QWORD *)(qword_10004BF70 + 8);
                          *(_QWORD *)(v56 + 8) = v52;
                          v43 += v55 + 5;
                        }
                        while (v43 < v39);
                      }
                      else
                      {
                        v52 = *(_OWORD **)(qword_10004BF70 + 8);
                      }
                      sub_10002D9A0((uint64_t *)v52);
                      break;
                  }
LABEL_75:
                  v38 = (unsigned __int8 *)v42 + v39;
                  v35 = v124;
                }
                else
                {
                  ++v38;
                  --v35;
                }
                v36 = *v38;
              }
              while (v36 != 255 && v35 > 0);
              if (v37)
              {
                sub_10002DB74(v37);
                do
                {
                  v114 = *v37;
                  free(v37);
                  v37 = (uint64_t **)v114;
                }
                while (v114);
              }
            }
          }
          untimeout((uint64_t)sub_10002DED8, qword_10004BF70);
          *(_DWORD *)qword_10004BF70 = 5;
          notify((uint64_t **)acspdhcpready_notifier, 0);
          return;
        }
LABEL_103:
        v34 = "DHCP packet received with incorrect message type\n";
        goto LABEL_104;
      }
LABEL_102:
      v34 = "DHCP packet received with incorrect cookie\n";
      goto LABEL_104;
    }
LABEL_41:
    v34 = "DHCP packet received with incorrect length\n";
    goto LABEL_104;
  }
  if (a3 <= 0x10E)
    goto LABEL_41;
  if (bswap32(*(_DWORD *)(a2 + 264)) != 1669485411)
    goto LABEL_102;
  if (*(_BYTE *)(a2 + 268) != 53 || *(_BYTE *)(a2 + 269) != 1 || *(_BYTE *)(a2 + 270) != 8)
    goto LABEL_103;
  v17 = 0;
  v18 = *(unsigned int *)(a2 + 40);
  WORD2(__stringp) = 0;
  LODWORD(__stringp) = 0;
  *(_OWORD *)__s = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v19 = a3 - 271;
  v140 = 0;
  if ((int)(a3 - 271) < 1)
  {
    v21 = 0;
  }
  else
  {
    v20 = *(unsigned __int8 *)(a2 + 271);
    v21 = 0;
    if (v20 != 255)
    {
      v21 = 0;
      v17 = 0;
      v22 = (unsigned __int8 *)(a2 + 271);
      do
      {
        if (v20)
        {
          v23 = v22[1];
          v24 = v19 - 2;
          v25 = __OFSUB__(v24, (_DWORD)v23);
          v19 = v24 - v23;
          if ((v19 < 0) ^ v25 | (v19 == 0))
            goto LABEL_106;
          v26 = v22 + 2;
          if (v20 == 55 && (_DWORD)v23)
          {
            v27 = v26;
            v28 = v23;
            do
            {
              v30 = *v27++;
              v29 = v30;
              v10 = v30 == 15;
              if (qword_10004BF58)
                v31 = v29 == 249;
              else
                v31 = 0;
              if (v31)
                v32 = 1;
              else
                v32 = v21;
              if (v10 && qword_10004BF60 != 0)
                v17 = 1;
              else
                v21 = v32;
              --v28;
            }
            while (v28);
          }
          v22 = &v26[v23];
        }
        else
        {
          ++v22;
          --v19;
        }
        v20 = *v22;
      }
      while (v20 != 255 && v19 > 0);
    }
  }
  if (!(v17 | v21))
    return;
  outpacket_buf = 553649151;
  qword_100048134 = 0;
  v83 = *(_DWORD *)(a2 + 30);
  v84 = *(_WORD *)(a2 + 34);
  v85 = *(_OWORD *)(a2 + 214);
  v86 = *(_OWORD *)(a2 + 246);
  v138 = *(_OWORD *)(a2 + 230);
  v139 = v86;
  v87 = *(_OWORD *)(a2 + 150);
  v88 = *(_OWORD *)(a2 + 182);
  v134 = *(_OWORD *)(a2 + 166);
  v135 = v88;
  v136 = *(_OWORD *)(a2 + 198);
  v137 = v85;
  v89 = *(_OWORD *)(a2 + 86);
  v90 = *(_OWORD *)(a2 + 118);
  v130 = *(_OWORD *)(a2 + 102);
  v131 = v90;
  v132 = *(_OWORD *)(a2 + 134);
  v133 = v87;
  v91 = *(_OWORD *)(a2 + 54);
  v92 = *(_OWORD *)(a2 + 70);
  v93 = *(_WORD *)(a2 + 262);
  *(_OWORD *)__s = *(_OWORD *)(a2 + 38);
  v127 = v91;
  v128 = v92;
  v129 = v89;
  unk_1000481F6 = v137;
  unk_100048206 = v138;
  unk_100048216 = v139;
  unk_1000481B6 = v87;
  unk_1000481C6 = v134;
  unk_1000481D6 = v135;
  unk_1000481E6 = v136;
  unk_100048176 = v89;
  unk_100048186 = v130;
  unk_100048196 = v131;
  unk_1000481A6 = v132;
  *(_OWORD *)((char *)&dword_100048144 + 2) = *(_OWORD *)__s;
  unk_100048156 = v91;
  *(_QWORD *)&byte_100048128 = 0;
  *(_QWORD *)&word_100048120 = 0;
  dword_100048130 = 0;
  LODWORD(__stringp) = v83;
  WORD2(__stringp) = v84;
  v140 = v93;
  word_10004813C = 258;
  *(_DWORD *)&byte_10004813E = v83;
  word_100048142 = v84;
  LOWORD(dword_100048144) = 0;
  word_100048226 = v93;
  unk_100048166 = v92;
  qword_100048228 = 0x3605013563538263;
  LOBYTE(word_100048230) = 4;
  v94 = ntohl(a4);
  *(_DWORD *)((char *)&word_100048230 + 1) = bswap32(v94);
  if (v17)
  {
    v95 = (_QWORD *)qword_10004BF60;
    do
    {
      v96 = v95;
      v95 = (_QWORD *)*v95;
    }
    while (v95);
    LOBYTE(word_100048235) = 15;
    v97 = strlen((const char *)v96[2]);
    if ((v97 << 32) + 0x11B00000000 > 0x5DF00000000)
    {
      v34 = "Domain name too large for DHCP\n";
      goto LABEL_104;
    }
    v98 = v97;
    v99 = v97 << 32;
    HIBYTE(word_100048235) = v97;
    memcpy(&qword_100048237, (const void *)v96[2], (int)v97);
    v100 = (__int16 *)((char *)&qword_100048237 + (v99 >> 32));
    v101 = v98 + 283;
  }
  else
  {
    v100 = &word_100048235;
    v101 = 281;
  }
  if (!v21 || (v102 = qword_10004BF58) == 0)
  {
LABEL_142:
    *(_BYTE *)v100 = -1;
    v116 = (v101 + 1);
    if ((int)v116 <= 0)
      v117 = -(-(int)v116 & 3);
    else
      v117 = ((_BYTE)v101 + 1) & 3;
    if (v116 <= 0x5DF)
    {
      v25 = __OFSUB__(v117, 1);
      v118 = v117 - 1;
      if (v118 < 0 == v25)
      {
        if (v118 >= (1502 - v101))
          v119 = (1502 - v101);
        else
          v119 = v118;
        bzero((char *)v100 + 1, v119 + 1);
        v116 = (v101 + v119 + 2);
      }
    }
    v120 = ntohl(v18);
    sub_10002DCFC(a1, v116, v94, 0x43u, v120, 68, v121, v122, v123);
    return;
  }
  v103 = 0;
  v104 = 1;
  while (1)
  {
    while ((*(_WORD *)(v102 + 20) & 1) == 0)
    {
      v102 = *(_QWORD *)v102;
      if (!v102)
      {
        if ((v104 & 1) != 0)
          goto LABEL_142;
LABEL_141:
        v115 = (char *)v100 - (v103 + 1);
        *v115 = v103;
        v100 = (__int16 *)&v115[v103 + 1];
        v101 += v103 + 2;
        goto LABEL_142;
      }
    }
    if ((v104 & 1) != 0)
      break;
LABEL_125:
    v105 = ntohl(*(unsigned int *)(v102 + 12));
    v106 = ntohl(*(unsigned int *)(v102 + 8));
    v107 = 32;
    if ((v105 & 1) == 0)
    {
      v108 = v105;
      do
      {
        if (!--v107)
          break;
        v109 = v108;
        v108 >>= 1;
      }
      while ((v109 & 2) == 0);
    }
    if ((v107 & 7) != 0)
      v110 = (v107 >> 3) + 1;
    else
      v110 = v107 >> 3;
    if ((v101 - 1499 + v110) < 0xFFFFFA20)
    {
      v34 = "Static routes list too large DHCP\n";
      goto LABEL_104;
    }
    v111 = v106 & v105;
    *(_BYTE *)v100 = v107;
    *((_BYTE *)v100 + 1) = (v106 & v105) >> 24;
    *((_BYTE *)v100 + 2) = (v106 & v105) >> 16;
    *((_BYTE *)v100 + 3) = (unsigned __int16)(v106 & v105) >> 8;
    v112 = (char *)v100 - (4 - v110);
    *((_BYTE *)v100 + 4) = v111;
    v113 = ntohl(a5);
    v104 = 0;
    v100 = (__int16 *)(v112 + 9);
    *(_DWORD *)(v112 + 5) = bswap32(v113);
    v103 += v110 + 5;
    v102 = *(_QWORD *)v102;
    if (!v102)
      goto LABEL_141;
  }
  if ((v101 - 1502) > 0xFFFFFA1F)
  {
    *v100++ = 249;
    goto LABEL_125;
  }
  v34 = "No space for DHCP routes\n";
LABEL_104:
  warning(v34, v10, v11, v12, v13, v14, v15, v16, v123);
}

void sub_10002BEEC(unsigned int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (acsp_use_dhcp && off_100046F48(a1) != 9)
  {
    v12 = malloc_type_malloc(0x30uLL, 0x1090040B760FDDAuLL);
    qword_10004BF70 = (uint64_t)v12;
    if (v12)
    {
      v12[2] = 0u;
      *(_OWORD *)((char *)v12 + 20) = 0u;
      *(_OWORD *)((char *)v12 + 4) = 0u;
      *((_DWORD *)v12 + 8) = a1;
      *((_DWORD *)v12 + 9) = a2;
      *((_DWORD *)v12 + 10) = a3;
      *(_DWORD *)v12 = 1;
      sub_10002DF5C(a1, a2);
    }
    else
    {
      error("ACSP plugin: no memory to allocate DHCP routes context\n", v13, v14, v15, v16, v17, v18, v19, a9);
    }
  }
}

void sub_10002BFB4()
{
  BOOL v0;

  if (acsp_use_dhcp)
    v0 = qword_10004BF70 == 0;
  else
    v0 = 1;
  if (!v0)
  {
    sub_10002D7F0(*(uint64_t **)(qword_10004BF70 + 8));
    untimeout((uint64_t)sub_10002DED8, qword_10004BF70);
    free((void *)qword_10004BF70);
    qword_10004BF70 = 0;
  }
}

uint64_t sub_10002C010(uint64_t a1, unsigned int a2, void (*a3)(uint64_t, const char *, ...), uint64_t a4)
{
  in_addr v8;
  char *v9;
  in_addr v10;
  char *v11;
  int v12;
  const char *v13;
  in_addr v14;
  char *v15;
  in_addr v16;
  char *v17;
  in_addr v18;
  char *v19;
  in_addr v20;
  char *v21;
  uint64_t i;
  int v23;
  const char *v24;
  int v25;
  int v26;
  unsigned __int8 *v27;
  int v28;
  unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  unsigned __int8 *v40;
  int v41;
  uint64_t v42;
  const char *v43;
  int v44;
  uint64_t v45;
  unsigned __int8 *v46;
  int v47;
  uint64_t v48;
  unsigned __int8 *v49;
  int v50;
  const char *v53;
  int v54;
  char v55[16];
  char __str[2048];

  if (ntohs(*(unsigned __int16 *)(a1 + 20)) - 67 > 1
    || ntohs(*(unsigned __int16 *)(a1 + 22)) - 67 > 1)
  {
    return 0;
  }
  v8.s_addr = *(_DWORD *)(a1 + 12);
  v9 = inet_ntoa(v8);
  a3(a4, " <src addr %s>", v9);
  v10.s_addr = *(_DWORD *)(a1 + 16);
  v11 = inet_ntoa(v10);
  a3(a4, " <dst addr %s>", v11);
  v12 = *(unsigned __int8 *)(a1 + 28);
  if ((v12 - 1) >= 2)
  {
    v53 = " <bootp code invalid!>";
    goto LABEL_72;
  }
  if (v12 == 1)
    v13 = "Request";
  else
    v13 = "Reply";
  a3(a4, " <BOOTP %s>", v13);
  if (debug >= 2)
  {
    a3(a4, " <htype %d>", *(unsigned __int8 *)(a1 + 29));
    a3(a4, " <hlen %d>", *(unsigned __int8 *)(a1 + 30));
    a3(a4, " <hops %d>", *(unsigned __int8 *)(a1 + 31));
    a3(a4, " <xid %d>", *(_DWORD *)(a1 + 32));
    a3(a4, " <flags %d>", *(unsigned __int16 *)(a1 + 38));
    v14.s_addr = *(_DWORD *)(a1 + 40);
    v15 = inet_ntoa(v14);
    a3(a4, " <client address %s>", v15);
    v16.s_addr = *(_DWORD *)(a1 + 44);
    v17 = inet_ntoa(v16);
    a3(a4, " <your address %s>", v17);
    v18.s_addr = *(_DWORD *)(a1 + 48);
    v19 = inet_ntoa(v18);
    a3(a4, " <server address %s>", v19);
    v20.s_addr = *(_DWORD *)(a1 + 52);
    v21 = inet_ntoa(v20);
    a3(a4, " <gateway address %s>", v21);
    snprintf(__str, 0x800uLL, "%02x", *(unsigned __int8 *)(a1 + 56));
    for (i = 0; i != 15; ++i)
    {
      snprintf(v55, 0x10uLL, ":%02x", *(unsigned __int8 *)(a1 + 57 + i));
      __strlcat_chk(__str, v55, 2048, 2048);
    }
    a3(a4, " <hardware address %s>", __str);
    a3(a4, " <server host name \"%s\">", (const char *)(a1 + 72));
    a3(a4, " <boot file name \"%s\">", (const char *)(a1 + 136));
  }
  if (bswap32(*(_DWORD *)(a1 + 264)) != 1669485411)
  {
    v53 = " <cookie invalid!>";
    goto LABEL_72;
  }
  if (debug >= 2)
    a3(a4, " <cookie 0x%x>", 1669485411);
  if (*(_BYTE *)(a1 + 268) != 53
    || *(_BYTE *)(a1 + 269) != 1
    || (v23 = *(unsigned __int8 *)(a1 + 270), v23 != 5) && v23 != 8)
  {
    v53 = " <type invalid!>";
    goto LABEL_72;
  }
  if (v23 == 8)
    v24 = "INFORM";
  else
    v24 = "ACK";
  a3(a4, " <type %s>", v24);
  v25 = *(unsigned __int8 *)(a1 + 271);
  if (v25 == 255 || (v26 = a2 - 271, (int)(a2 - 271) < 1))
  {
LABEL_66:
    if (debug <= 1)
      return a2;
    else
      return 0;
  }
  v27 = (unsigned __int8 *)(a1 + 271);
  while (!v25)
  {
    ++v27;
    --v26;
LABEL_61:
    v25 = *v27;
    if (v25 == 255 || v26 <= 0)
      goto LABEL_66;
  }
  v28 = v26 - 2;
  if (v26 != 2)
  {
    v29 = v27 + 2;
    v30 = v27[1];
    __str[0] = 0;
    if (v25 <= 50)
    {
      switch(v25)
      {
        case 1:
          v31 = a4;
          v32 = " <subnet mask %d.%d.%d.%d>";
          break;
        case 12:
          __memcpy_chk(__str, v27 + 2, v30, 2048);
          __str[v30] = 0;
          v31 = a4;
          v32 = " <host name \"%s\">";
          break;
        case 15:
          __memcpy_chk(__str, v27 + 2, v30, 2048);
          __str[v30] = 0;
          v31 = a4;
          v32 = " <domain name \"%s\">";
          break;
        default:
LABEL_42:
          v31 = a4;
          v32 = " <option %d>";
          break;
      }
LABEL_59:
      a3(v31, v32);
    }
    else
    {
      switch(v25)
      {
        case '3':
          v31 = a4;
          v32 = " <lease time %d sec>";
          goto LABEL_59;
        case '4':
        case '5':
        case '8':
        case '9':
        case ':':
        case ';':
          goto LABEL_42;
        case '6':
          v54 = v26 - 2;
          strcpy(__str, "0x");
          if ((_DWORD)v30)
          {
            v39 = v30;
            v40 = v27 + 2;
            do
            {
              v41 = *v40++;
              snprintf(v55, 0x10uLL, "%02x", v41);
              __strlcat_chk(__str, v55, 2048, 2048);
              --v39;
            }
            while (v39);
          }
          v42 = a4;
          v43 = " <server id %s>";
          goto LABEL_55;
        case '7':
          v44 = v26 - 2;
          v45 = v30;
          v46 = v27 + 2;
          if ((_DWORD)v30)
          {
            do
            {
              v47 = *v46++;
              snprintf(v55, 0x10uLL, " 0x%x", v47);
              __strlcat_chk(__str, v55, 2048, 2048);
              --v45;
            }
            while (v45);
          }
          a3(a4, " <parameters =%s>", __str);
          v28 = v44;
          goto LABEL_60;
        case '<':
          __memcpy_chk(__str, v27 + 2, v30, 2048);
          __str[v30] = 0;
          v31 = a4;
          v32 = " <vendor class id \"%s\">";
          goto LABEL_59;
        case '=':
          v54 = v26 - 2;
          strcpy(__str, "0x");
          if ((_DWORD)v30)
          {
            v48 = v30;
            v49 = v27 + 2;
            do
            {
              v50 = *v49++;
              snprintf(v55, 0x10uLL, "%02x", v50);
              __strlcat_chk(__str, v55, 2048, 2048);
              --v48;
            }
            while (v48);
          }
          v42 = a4;
          v43 = " <client id %s>";
LABEL_55:
          a3(v42, v43);
          break;
        default:
          if (v25 != 249)
            goto LABEL_42;
          v54 = v26 - 2;
          a3(a4, " <static routes");
          if ((_DWORD)v30)
          {
            v33 = 0;
            do
            {
              v34 = v29[v33];
              v35 = -1 << -(char)v34;
              if ((v34 & 7) != 0)
                v36 = (v34 >> 3) + 1;
              else
                v36 = v34 >> 3;
              v37 = v35 & ntohl(*(unsigned int *)&v29[v33 + 1]);
              v38 = ntohl(*(unsigned int *)&v29[v36 + v33 + 1]);
              v33 += v36 + 5;
              a3(a4, " %d.%d.%d.%d/%d.%d.%d.%d/%d.%d.%d.%d", HIBYTE(v37), BYTE2(v37), BYTE1(v37), v37, HIBYTE(v35), BYTE2(v35), BYTE1(v35), v35, HIBYTE(v38), BYTE2(v38), BYTE1(v38), v38);
            }
            while (v33 < (int)v30);
          }
          a3(a4, ">");
          break;
      }
      v28 = v54;
    }
LABEL_60:
    v27 = &v29[v30];
    v26 = v28 - v30;
    goto LABEL_61;
  }
  v53 = " <option %d zero len!>";
LABEL_72:
  a3(a4, v53);
  return 0;
}

void acsp_start(__int16 a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_10002BFB4();
  for (i = qword_10004BF50; i; i = *(_QWORD *)i)
  {
    *(_WORD *)(i + 18) = a1;
    *(_DWORD *)(i + 20) = 1;
    *(_QWORD *)(i + 24) = 0;
    *(_DWORD *)(i + 50) = 0;
    *(_QWORD *)(i + 56) = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t))(i + 96))(*(_QWORD *)(i + 72), i + 16, i + 48);
    sub_10002C998(i, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t acsp_stop()
{
  uint64_t i;
  uint64_t result;

  for (i = qword_10004BF50; i; i = *(_QWORD *)i)
  {
    if (*(_DWORD *)(i + 12))
    {
      untimeout((uint64_t)sub_10002C94C, i);
      *(_DWORD *)(i + 12) = 0;
    }
    *(_DWORD *)(i + 20) = 2;
    *(_QWORD *)(i + 24) = 0;
    *(_DWORD *)(i + 50) = 0;
    *(_QWORD *)(i + 56) = 0;
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(i + 96))(*(_QWORD *)(i + 72), i + 16, i + 48);
  }
  return result;
}

void acsp_data_input(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char *v9;
  __int16 v10;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((int)a3 >= 8)
  {
    v10 = a3;
    v12 = &qword_10004BF50;
    do
    {
      v12 = (uint64_t *)*v12;
      if (!v12)
      {
        v9 = "ACSP packet received with invalid type\n";
        goto LABEL_12;
      }
    }
    while (*((unsigned __int8 *)v12 + 64) != *a2);
    if ((ntohs(*((unsigned __int16 *)a2 + 2)) & 4) != 0
      && *((_DWORD *)v12 + 3) == 1
      && a2[1] == *((unsigned __int8 *)v12 + 8))
    {
      untimeout((uint64_t)sub_10002C94C, (uint64_t)v12);
      *((_DWORD *)v12 + 3) = 0;
    }
    *((_WORD *)v12 + 10) = 3;
    v12[3] = (uint64_t)a2;
    *((_WORD *)v12 + 11) = v10;
    v12[7] = 0;
    *(_DWORD *)((char *)v12 + 50) = 0;
    ((void (*)(uint64_t, uint64_t *, uint64_t *))v12[12])(v12[9], v12 + 2, v12 + 6);
    sub_10002C998((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v9 = "ACSP packet received was too short\n";
LABEL_12:
    error(v9, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_10002C94C(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 20) = 4;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 50) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 96))(*(_QWORD *)(a1 + 72), a1 + 16, a1 + 48);
  return sub_10002C998(a1);
}

void sub_10002C998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD, uint64_t);
  int v22;

  v9 = a1 + 48;
  v10 = a1 + 16;
  while (1)
  {
    v11 = "ACSP plugin for option # %d attempted to invoke UI - not supported\n";
    switch(*(_WORD *)(a1 + 50))
    {
      case 0:
        return;
      case 1:
      case 3:
        v12 = *(unsigned __int16 *)(a1 + 52);
        v13 = v12 < 8 || v12 > *(unsigned __int16 *)(a1 + 18);
        v11 = "ACSP plugin for option # %d trying to send packet of invalid length\n";
        if (v13)
          goto LABEL_10;
        v14 = *(_QWORD *)(a1 + 56);
        *(_WORD *)v14 = 1023;
        v15 = htons(565);
        *(_WORD *)(v14 + 2) = v15;
        if (*(_WORD *)(a1 + 50) == 3)
        {
          if (*(_DWORD *)(a1 + 12))
            untimeout((uint64_t)sub_10002C94C, a1);
          *(_DWORD *)(a1 + 12) = 1;
          *(_BYTE *)(a1 + 8) = *(_BYTE *)(v14 + 5);
          timeout((int)sub_10002C94C);
        }
        output(0, *(_QWORD *)(a1 + 56), *(unsigned __int16 *)(a1 + 52), v16, v17, v18, v19, v20, v22);
        v21 = *(void (**)(_QWORD, uint64_t))(a1 + 88);
        if (v21)
          v21(*(_QWORD *)(a1 + 72), v9);
        return;
      case 2:
        goto LABEL_10;
      case 4:
        v11 = "ACSP plugin for option # %d attempted timeout action with invalid time value\n";
        if (*(_WORD *)(a1 + 52) != 4)
          goto LABEL_10;
        *(_DWORD *)(a1 + 12) = 2;
        timeout((int)sub_10002C94C);
        return;
      case 5:
        if (*(_DWORD *)(a1 + 12))
        {
          untimeout((uint64_t)sub_10002C94C, a1);
          *(_DWORD *)(a1 + 12) = 0;
        }
        return;
      default:
        v11 = "ACSP plugin for option # %d trying to perform invalid action\n";
LABEL_10:
        error(v11, a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 64));
        *(_DWORD *)(a1 + 20) = 6;
        *(_QWORD *)(a1 + 24) = 0;
        *(_QWORD *)(a1 + 56) = 0;
        *(_DWORD *)(a1 + 50) = 0;
        (*(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 96))(*(_QWORD *)(a1 + 72), v10, v9);
        break;
    }
  }
}

uint64_t acsp_printpkt(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *, ...), uint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  unsigned int v9;
  char v10;
  int v11;
  unsigned __int8 *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  char v17;
  char *v18;
  char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  int v37;
  uint64_t v38;
  char v39[256];
  char v40[16];

  result = 0;
  if (a1 && a2 >= 8)
  {
    v38 = 0;
    v8 = ntohs(*((unsigned __int16 *)a1 + 1));
    if (v8 >= 8)
      v9 = v8 - 8;
    else
      v9 = 0;
    v10 = ntohs(*((unsigned __int16 *)a1 + 2));
    v11 = *a1;
    v37 = (int)a1;
    if (v11 == 2)
    {
      v12 = a1 + 8;
      v22 = " START";
      v23 = (const char *)&unk_100032B1A;
      if ((v10 & 2) == 0)
        v22 = (const char *)&unk_100032B1A;
      v24 = " END";
      if ((v10 & 1) == 0)
        v24 = (const char *)&unk_100032B1A;
      v25 = " REQUIRE-ACK";
      if ((v10 & 8) == 0)
        v25 = (const char *)&unk_100032B1A;
      if ((v10 & 4) != 0)
        v23 = " ACK";
      a3(a4, " <payload len %d, packet seq %d, %s, flags:%s%s%s%s>", v9, a1[1], "CI_DOMAINS", v22, v24, v25, v23);
      if (v9 >= 8)
      {
        do
        {
          v26 = *(_QWORD *)v12;
          v38 = v26;
          v27 = ntohs(WORD2(v26));
          v28 = v27;
          if (v27 >= 0x100)
            v29 = 256;
          else
            v29 = v27;
          if (v27)
            __memcpy_chk(v39, v12 + 6, v29, 256);
          v39[v29] = 0;
          if ((_DWORD)v26)
          {
            addr2ascii(2, &v38, 4, v40);
            v30 = a4;
            v31 = "\n    <domain: name %s, server %s>";
          }
          else
          {
            v30 = a4;
            v31 = "\n    <domain: name %s>";
          }
          a3(v30, v31);
          v32 = v28 + 6;
          v9 -= v32;
          v12 += v32;
        }
        while (v9 > 7);
      }
    }
    else if (v11 == 1)
    {
      v12 = a1 + 8;
      v13 = " START";
      if ((v10 & 2) == 0)
        v13 = (const char *)&unk_100032B1A;
      v14 = " END";
      if ((v10 & 1) == 0)
        v14 = (const char *)&unk_100032B1A;
      v15 = " REQUIRE-ACK";
      if ((v10 & 8) == 0)
        v15 = (const char *)&unk_100032B1A;
      v16 = " ACK";
      if ((v10 & 4) == 0)
        v16 = (const char *)&unk_100032B1A;
      a3(a4, " <payload len %d, packet seq %d, %s, flags:%s%s%s%s>", v9, a1[1], "CI_ROUTES", v13, v14, v15, v16);
      if (v9 >= 0xC)
      {
        do
        {
          v17 = ntohs(*((unsigned __int16 *)v12 + 4));
          v18 = addr2ascii(2, v12, 4, v40);
          v19 = addr2ascii(2, v12 + 4, 4, v39);
          if ((v17 & 1) != 0)
            v20 = " PRIVATE";
          else
            v20 = (const char *)&unk_100032B1A;
          if ((v17 & 2) != 0)
            v21 = " PUBLIC";
          else
            v21 = (const char *)&unk_100032B1A;
          a3(a4, "\n    <route: address %s, mask %s, flags:%s%s>", v18, v19, v20, v21);
          v9 -= 12;
          v12 += 12;
        }
        while (v9 > 0xB);
      }
    }
    else
    {
      v33 = " START";
      v34 = (const char *)&unk_100032B1A;
      if ((v10 & 2) == 0)
        v33 = (const char *)&unk_100032B1A;
      v35 = " END";
      if ((v10 & 1) == 0)
        v35 = (const char *)&unk_100032B1A;
      v36 = " REQUIRE-ACK";
      if ((v10 & 8) == 0)
        v36 = (const char *)&unk_100032B1A;
      if ((v10 & 4) != 0)
        v34 = " ACK";
      a3(a4, " <payload len %d, packet seq %d, CI_TYPE %d, flags:%s%s%s%s>", v9, a1[1], v11, v33, v35, v36, v34);
      LODWORD(v12) = (_DWORD)a1 + 8;
    }
    return ((_DWORD)v12 - v37);
  }
  return result;
}

uint64_t sub_10002CEF0(_QWORD *a1, char a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  int v22;

  v4 = malloc_type_malloc(0x40uLL, 0x109004061D8AE16uLL);
  if (v4)
  {
    v12 = v4;
    v13 = malloc_type_malloc(0x5DCuLL, 0x4DF37E9BuLL);
    v12[4] = v13;
    if (v13)
    {
      result = 0;
      *((_DWORD *)v12 + 10) = 1500;
      *(_BYTE *)v12 = a2;
      *(_QWORD *)((char *)v12 + 4) = &_mh_execute_header;
      v12[2] = 0;
      *((_BYTE *)v12 + 12) = 0;
      v12[6] = 0;
      *((_DWORD *)v12 + 14) = 0;
      a1[9] = v12;
      a1[10] = sub_10002D058;
      a1[11] = 0;
      a1[12] = sub_10002D05C;
      a1[13] = 0;
      a1[14] = nullsub_1;
      return result;
    }
    error("ACSP plugin: no memory\n", v14, v15, v16, v17, v18, v19, v20, v22);
    free(v12);
  }
  else
  {
    error("ACSP plugin: no memory\n", v5, v6, v7, v8, v9, v10, v11, v22);
  }
  return 0xFFFFFFFFLL;
}

uint64_t **sub_10002CFCC(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 1;
  if (*(_DWORD *)(a1 + 4) == 1 && *(_DWORD *)(a1 + 8) == 5 && !*(_DWORD *)(a1 + 56))
    return sub_10002D740((unsigned __int8 *)a1);
  else
    return notify((uint64_t **)acspdhcpready_notifier, 0);
}

void sub_10002D00C(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  if (*(_DWORD *)(a1 + 4) == 1 && *(_DWORD *)(a1 + 56))
  {
    if (*(_BYTE *)a1 == 1)
      sub_10002D7F0(*(uint64_t **)(a1 + 48));
    *(_DWORD *)(a1 + 56) = 0;
  }
}

void sub_10002D05C(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  char *v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  _QWORD *v38;
  _QWORD *v39;
  int v40;
  int v41;

  switch(*(_WORD *)(a2 + 4))
  {
    case 1:
      if (*a1 == 1)
      {
        if (!(_BYTE)acscp_gotoptions)
        {
          if ((_BYTE)acscp_hisoptions)
          {
LABEL_5:
            *((_DWORD *)a1 + 1) = 2;
            a1[12] = 0;
            *((_DWORD *)a1 + 5) = 0;
            sub_10002D55C(a1, a2, a3);
            ++a1[12];
            v12 = 4;
            goto LABEL_15;
          }
          goto LABEL_38;
        }
      }
      else if (!BYTE8(acscp_gotoptions))
      {
        if (byte_10004A188)
          goto LABEL_5;
LABEL_38:
        *((_DWORD *)a1 + 1) = 0;
        a1[12] = 0;
        *((_DWORD *)a1 + 5) = 0;
        return;
      }
      a1[12] = 0;
      *((_DWORD *)a1 + 5) = 0;
      *(_QWORD *)(a1 + 4) = 0x200000001;
      return;
    case 2:
      v13 = *((_DWORD *)a1 + 2);
      if (v13 == 5)
        goto LABEL_9;
      if (v13 == 4)
      {
        *(_WORD *)(a3 + 2) = 5;
LABEL_9:
        if (*((_DWORD *)a1 + 14))
        {
          *((_DWORD *)a1 + 14) = 0;
          if (*a1 == 1)
          {
            sub_10002D7F0(*((uint64_t **)a1 + 6));
            *((_DWORD *)a1 + 14) = 0;
          }
        }
      }
      if (*((_DWORD *)a1 + 1) == 1)
        sub_10002D50C((uint64_t)a1);
      v12 = 1;
LABEL_15:
      *((_DWORD *)a1 + 2) = v12;
      return;
    case 3:
      v14 = *(_QWORD *)(a2 + 8);
      v15 = *((_DWORD *)a1 + 2);
      if (v15 == 4)
      {
        if ((ntohs(*(unsigned __int16 *)(v14 + 4)) & 4) == 0)
          return;
        if (*((_QWORD *)a1 + 3))
        {
          sub_10002D55C(a1, a2, a3);
          ++a1[12];
          return;
        }
LABEL_36:
        *((_DWORD *)a1 + 2) = 5;
        notify((uint64_t **)acspdhcpready_notifier, 0);
      }
      else
      {
        if (v15 != 3)
        {
          if (v15 != 2)
            return;
          if ((ntohs(*(unsigned __int16 *)(v14 + 4)) & 2) == 0)
          {
            v16 = "ACSP plugin: received first packet with no start flag\n";
            goto LABEL_31;
          }
          *((_DWORD *)a1 + 2) = 3;
        }
        if (*(unsigned __int8 *)(v14 + 1) != a1[12])
          goto LABEL_61;
        v18 = *(unsigned __int16 *)(a2 + 6);
        v19 = *a1;
        if (v19 != 2)
        {
          if (v19 != 1)
            return;
          if ((v18 & 3) != 0)
          {
            v16 = "ACSP plugin: received packet with invalid len\n";
            goto LABEL_31;
          }
          if (v18 >= 0xD)
          {
            v36 = v14 + 8;
            v37 = v18 + 4;
            while (1)
            {
              v38 = malloc_type_malloc(0x20uLL, 0x1020040983EA955uLL);
              if (!v38)
                break;
              v39 = v38;
              *(_OWORD *)v38 = 0u;
              *((_OWORD *)v38 + 1) = 0u;
              v40 = *(_DWORD *)(v36 + 4);
              *((_DWORD *)v38 + 2) = v40 & *(_DWORD *)v36;
              *((_DWORD *)v38 + 3) = v40;
              *((_WORD *)v38 + 10) = ntohs(*(unsigned __int16 *)(v36 + 8));
              *v39 = *((_QWORD *)a1 + 6);
              *((_QWORD *)a1 + 6) = v39;
              v37 -= 12;
              v36 += 12;
              if (v37 <= 16)
                goto LABEL_55;
            }
LABEL_58:
            v16 = "ACSP plugin: no memory\n";
            goto LABEL_31;
          }
          goto LABEL_55;
        }
        if (v18 < 0xB)
        {
LABEL_55:
          ++a1[12];
          if ((ntohs(*(unsigned __int16 *)(v14 + 4)) & 1) != 0)
          {
            *((_DWORD *)a1 + 2) = 5;
            if (*((_DWORD *)a1 + 4))
              sub_10002D740(a1);
            else
              notify((uint64_t **)acspdhcpready_notifier, 0);
          }
LABEL_61:
          if ((ntohs(*(unsigned __int16 *)(v14 + 4)) & 8) != 0)
            sub_10002D790((uint64_t)a1, a2, a3);
          return;
        }
        v20 = v18 - 8;
        v21 = (int *)(v14 + 8);
        while (1)
        {
          v22 = *v21;
          v23 = *((unsigned __int16 *)v21 + 2);
          v24 = malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
          if (!v24)
            goto LABEL_58;
          v25 = v24;
          v26 = ntohs(v23);
          v27 = malloc_type_malloc(v26 + 1, 0x1D618CF4uLL);
          v25[2] = v27;
          if (!v27)
            break;
          *((_DWORD *)v25 + 2) = v22;
          memcpy(v27, (char *)v21 + 6, v26);
          *(_BYTE *)(v25[2] + v26) = 0;
          *v25 = *((_QWORD *)a1 + 6);
          *((_QWORD *)a1 + 6) = v25;
          v35 = v26 + 6;
          v20 -= v35;
          v21 = (int *)((char *)v21 + v35);
          if (v20 <= 2)
            goto LABEL_55;
        }
        error("ACSP plugin: no memory\n", v28, v29, v30, v31, v32, v33, v34, v41);
        free(v25);
      }
      return;
    case 4:
      if (*((_DWORD *)a1 + 2) != 4)
      {
        v16 = "ACSP plugin: received unexpected timeout\n";
LABEL_31:
        error(v16, a2, a3, a4, a5, a6, a7, a8, a9);
        return;
      }
      v17 = *((_DWORD *)a1 + 5);
      *((_DWORD *)a1 + 5) = v17 + 1;
      if (v17 <= 9)
      {
        *(_QWORD *)(a3 + 8) = *((_QWORD *)a1 + 4);
        *(_WORD *)(a3 + 4) = *((_WORD *)a1 + 21) + 4;
        *(_WORD *)(a3 + 2) = 3;
        return;
      }
      error("ACSP plugin: no acknowlegement from peer\n", a2, a3, a4, a5, a6, a7, a8, v41);
      goto LABEL_36;
    case 5:
      v16 = "ACSP plugin: unexpected notification received\n";
      goto LABEL_31;
    case 6:
      error("ACSP plugin: error notificationr received\n", a2, a3, a4, a5, a6, a7, a8, v41);
      if (*((_DWORD *)a1 + 2) == 4)
        *(_WORD *)(a3 + 2) = 5;
      goto LABEL_36;
    default:
      return;
  }
}

void sub_10002D50C(uint64_t a1)
{
  void **i;

  for (i = *(void ***)(a1 + 48); i; i = *(void ***)(a1 + 48))
  {
    if (*(_BYTE *)a1 != 1)
      free(i[2]);
    *(_QWORD *)(a1 + 48) = *i;
    free(i);
  }
}

uint64_t sub_10002D55C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  unsigned __int16 v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  __int16 v18;
  uint64_t *v19;
  uint64_t **v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  int v24;
  uint64_t result;

  v5 = *((_QWORD *)a1 + 4);
  if (*((unsigned __int16 *)a1 + 20) >= *(unsigned __int16 *)(a2 + 2))
    v6 = *(_WORD *)(a2 + 2);
  else
    v6 = *((_WORD *)a1 + 20);
  if (*((_DWORD *)a1 + 2) == 1)
  {
    v7 = htons(2);
    *((_QWORD *)a1 + 3) = *((_QWORD *)a1 + 6);
  }
  else
  {
    v7 = 0;
  }
  v8 = v6 - 4;
  *(_WORD *)(v5 + 8) = v7;
  v9 = *a1;
  *(_BYTE *)(v5 + 4) = v9;
  *(_BYTE *)(v5 + 5) = a1[12];
  v10 = ntohs(v7);
  *(_WORD *)(v5 + 8) = htons(v10 | 8u);
  *(_WORD *)(v5 + 10) = 0;
  if (v9 == 1)
  {
    v20 = (uint64_t **)*((_QWORD *)a1 + 3);
    v13 = 8;
    if (v20 && v8 >= 0x14u)
    {
      v21 = v5 + 12;
      LOWORD(v22) = 20;
      do
      {
        v13 = v22;
        *(_QWORD *)v21 = v20[1];
        *(_WORD *)(v21 + 8) = htons(*((unsigned __int16 *)v20 + 10));
        *(_WORD *)(v21 + 10) = htons(0);
        v20 = (uint64_t **)*v20;
        *((_QWORD *)a1 + 3) = v20;
        v22 = v13 + 12;
        v21 += 12;
        if (v20)
          v23 = v22 > v8;
        else
          v23 = 1;
      }
      while (!v23);
    }
LABEL_24:
    if (v20)
      goto LABEL_28;
LABEL_27:
    v24 = ntohs(*(unsigned __int16 *)(v5 + 8));
    *(_WORD *)(v5 + 8) = htons(v24 | 1u);
    goto LABEL_28;
  }
  if (v9 != 2)
  {
    v20 = (uint64_t **)*((_QWORD *)a1 + 3);
    v13 = 8;
    goto LABEL_24;
  }
  v11 = *((_QWORD *)a1 + 3);
  if (!v11)
  {
    v13 = 8;
    goto LABEL_27;
  }
  v12 = v5 + 12;
  v13 = 8;
  while (1)
  {
    v14 = strlen(*(const char **)(v11 + 16));
    v15 = v14;
    v16 = v14 + 6;
    if (v14 + 6 + v13 > v8)
      break;
    v17 = *(_DWORD *)(v11 + 8);
    v18 = htons((unsigned __int16)v14);
    *(_DWORD *)v12 = v17;
    *(_WORD *)(v12 + 4) = v18;
    memcpy((void *)(v12 + 6), *(const void **)(*((_QWORD *)a1 + 3) + 16), v15);
    v13 += v16;
    v19 = (uint64_t *)*((_QWORD *)a1 + 3);
    v11 = *v19;
    *((_QWORD *)a1 + 3) = *v19;
    v12 += v16;
    if (!v11)
      goto LABEL_27;
  }
LABEL_28:
  *(_WORD *)(a3 + 2) = 3;
  *((_WORD *)a1 + 21) = v13;
  result = htons(v13);
  *(_WORD *)(v5 + 6) = result;
  *(_WORD *)(a3 + 4) = v13 + 4;
  *(_QWORD *)(a3 + 8) = *((_QWORD *)a1 + 4);
  return result;
}

uint64_t **sub_10002D740(unsigned __int8 *a1)
{
  int v2;
  uint64_t *v3;

  v2 = *a1;
  v3 = (uint64_t *)*((_QWORD *)a1 + 6);
  if (v2 == 1)
    sub_10002D9A0(v3);
  else
    sub_10002DB74((uint64_t **)v3);
  *((_DWORD *)a1 + 14) = 1;
  return notify((uint64_t **)acspdhcpready_notifier, 0);
}

uint64_t sub_10002D790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v5 + 4) = *(_BYTE *)a1;
  *(_BYTE *)(v5 + 5) = *(_BYTE *)(v4 + 1);
  *(_WORD *)(v5 + 8) = htons(4);
  result = htons(8);
  *(_WORD *)(v5 + 6) = result;
  *(_WORD *)(v5 + 10) = 0;
  *(_DWORD *)(a3 + 2) = 786433;
  *(_QWORD *)(a3 + 8) = v5;
  return result;
}

void sub_10002D7F0(uint64_t *a1)
{
  uint64_t *v1;
  __int16 v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21[16];
  char v22[16];
  char v23[16];

  if (a1)
  {
    v1 = a1;
    do
    {
      if (*((_DWORD *)v1 + 6))
      {
        *((_DWORD *)v1 + 6) = 0;
        v2 = *((_WORD *)v1 + 10);
        if ((v2 & 1) == 0)
        {
          if ((v2 & 2) == 0)
            goto LABEL_14;
          v3 = *((_DWORD *)v1 + 2);
          if (!v3 || route_gateway(2, v3, *((_DWORD *)v1 + 3), dword_10004BF68, 0))
            goto LABEL_14;
          v4 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          addr2ascii(2, &dword_10004BF68, 4, v21);
          error("ACSP plugin: error removing public net route. (%s/%s -> %s).", v5, v6, v7, v8, v9, v10, v11, v4);
          goto LABEL_12;
        }
        v12 = *((_DWORD *)v1 + 2);
        if (!v12)
        {
          cifdefaultroute();
          goto LABEL_14;
        }
        if (!route_interface(2, v12, *((_DWORD *)v1 + 3), 23, &ifname, 0))
        {
          v13 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          error("ACSP plugin: error removing private net route. (%s/%s).", v14, v15, v16, v17, v18, v19, v20, v13);
LABEL_12:
          *((_DWORD *)v1 + 6) = 1;
        }
      }
LABEL_14:
      v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
}

void sub_10002D9A0(uint64_t *a1)
{
  uint64_t *v1;
  __int16 v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21[16];
  char v22[16];
  char v23[16];

  if (a1)
  {
    v1 = a1;
    sleep(1u);
    cifdefaultroute();
    cifroute();
    do
    {
      *((_DWORD *)v1 + 6) = 1;
      v2 = *((_WORD *)v1 + 10);
      if ((v2 & 1) != 0)
      {
        v12 = *((_DWORD *)v1 + 2);
        if (!v12)
        {
          sifdefaultroute();
          goto LABEL_14;
        }
        if (!route_interface(1, v12, *((_DWORD *)v1 + 3), 23, &ifname, 0))
        {
          v13 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          error("ACSP plugin: error installing private net route. (%s/%s).", v14, v15, v16, v17, v18, v19, v20, v13);
          goto LABEL_11;
        }
      }
      else if ((v2 & 2) != 0)
      {
        v3 = *((_DWORD *)v1 + 2);
        if (!v3)
        {
          cifdefaultroute();
          goto LABEL_14;
        }
        if (!route_gateway(1, v3, *((_DWORD *)v1 + 3), dword_10004BF68, 1))
        {
          v4 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          addr2ascii(2, &dword_10004BF68, 4, v21);
          error("ACSP plugin: error installing public net route. (%s/%s -> %s).", v5, v6, v7, v8, v9, v10, v11, v4);
LABEL_11:
          *((_DWORD *)v1 + 6) = 0;
        }
      }
LABEL_14:
      v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
}

void sub_10002DB74(uint64_t **a1)
{
  CFNumberRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFNumberRef v10;
  int v11;
  CFStringRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFStringRef v20;
  char *v21;
  int key;
  uint64_t valuePtr;

  valuePtr = 100000;
  v2 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  if (v2)
  {
    v10 = v2;
    if (a1)
    {
      v11 = 1;
      while (1)
      {
        v12 = CFStringCreateWithCString(0, (const char *)a1[2], 0x8000100u);
        if (!v12)
        {
          v21 = "ACSP plugin: error adding domain name - could not create CFString\n";
          goto LABEL_11;
        }
        v20 = v12;
        if (!publish_dns_wins_entry(kSCEntNetDNS, kSCPropNetDNSSearchDomains, v20, 0, kSCPropNetDNSSupplementalMatchDomains, v20, kSCPropNetDNSSupplementalMatchOrders, v10, CFSTR("ConfirmedServiceID"), (void *)serviceidRef, v11))break;
        publish_dns_wins_entry(kSCEntNetProxies, kSCPropNetDNSSupplementalMatchDomains, v20, 0, kSCPropNetDNSSupplementalMatchOrders, v10, 0, 0, 0, 0, v11);
        CFRelease(v20);
        v11 = 0;
        a1 = (uint64_t **)*a1;
        if (!a1)
          goto LABEL_12;
      }
      CFRelease(v20);
      v21 = "ACSP plugin: error adding domain name\n";
LABEL_11:
      error(v21, v13, v14, v15, v16, v17, v18, v19, key);
    }
LABEL_12:
    CFRelease(v10);
  }
  else
  {
    error("ACSP plugin: error adding domain name - could not create CFNumber\n", v3, v4, v5, v6, v7, v8, v9, key);
  }
}

void sub_10002DCFC(unsigned int a1, uint64_t a2, unsigned int a3, unsigned __int8 a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9;
  char v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  __int16 v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;

  v9 = a5;
  v10 = a3;
  v25 = HIBYTE(a3);
  byte_100048128 = HIBYTE(a3);
  v12 = HIWORD(a3);
  byte_100048129 = BYTE2(a3);
  v13 = a3 >> 8;
  LOBYTE(word_10004812A) = BYTE1(a3);
  HIBYTE(word_10004812A) = a3;
  v14 = HIBYTE(a5);
  byte_10004812C = HIBYTE(a5);
  v15 = HIWORD(a5);
  byte_10004812D = BYTE2(a5);
  v16 = a5 >> 8;
  byte_10004812E = BYTE1(a5);
  byte_10004812F = a5;
  LOWORD(dword_100048130) = 4352;
  v17 = a2 - 4;
  BYTE2(dword_100048130) = (unsigned __int16)(a2 - 24) >> 8;
  BYTE5(qword_100048134) = a2 - 24;
  BYTE4(qword_100048134) = (unsigned __int16)(a2 - 24) >> 8;
  HIBYTE(dword_100048130) = a2 - 24;
  LOBYTE(qword_100048134) = 0;
  *(_WORD *)((char *)&qword_100048134 + 1) = a4;
  BYTE3(qword_100048134) = a6;
  HIWORD(qword_100048134) = 0;
  sub_10002DE64((unsigned __int8 *)&byte_100048128, a2 - 12);
  word_100048120 = 69;
  LOBYTE(word_100048122) = HIBYTE(v17);
  HIBYTE(word_100048122) = v17;
  v18 = word_100046FD0;
  byte_100048124 = HIBYTE(word_100046FD0);
  word_100046FD0 += 2;
  byte_100048125[0] = v18 + 1;
  *(_DWORD *)algn_100048126 = 289406976;
  word_10004812A = 0;
  byte_10004812C = v25;
  byte_10004812D = v12;
  byte_10004812E = v13;
  byte_10004812F = v10;
  LOBYTE(dword_100048130) = v14;
  BYTE1(dword_100048130) = v15;
  BYTE2(dword_100048130) = v16;
  HIBYTE(dword_100048130) = v9;
  v19 = sub_10002DE64((unsigned __int8 *)&word_100048120, 20);
  word_10004812A = __rev16(ntohs(v19));
  output(a1, (uint64_t)&outpacket_buf, a2, v20, v21, v22, v23, v24, a9);
}

uint64_t sub_10002DE64(unsigned __int8 *a1, int a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  if (a2 < 2)
  {
    v2 = 0;
    if (a2)
LABEL_7:
      v2 += *a1;
  }
  else
  {
    v2 = 0;
    v3 = a2;
    do
    {
      v4 = *(unsigned __int16 *)a1;
      a1 += 2;
      v2 += v4;
      if ((int)v2 < 0)
        v2 = (v2 >> 16) + (unsigned __int16)v2;
      v5 = v3 - 2;
      v6 = v3 > 3;
      v3 -= 2;
    }
    while (v6);
    if (v5)
      goto LABEL_7;
  }
  if ((unint64_t)v2 >= 0x10000)
  {
    do
      v2 = (v2 >> 16) + (unsigned __int16)v2;
    while ((unint64_t)v2 >> 16);
  }
  return (unsigned __int16)~(_WORD)v2;
}

void sub_10002DED8(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int v10;

  if (*a1 == 4)
  {
    v9 = a1[1];
    a1[1] = v9 + 1;
    if (v9 > 3)
    {
      dbglog("No DHCP server replied\n", a2, a3, a4, a5, a6, a7, a8, v10);
      *a1 = 5;
    }
    else
    {
      sub_10002DF5C(a1[8], a1[9]);
    }
    if (a1[1] == 2)
      notify((uint64_t **)acspdhcpready_notifier, 0);
  }
}

void sub_10002DF5C(unsigned int a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  bzero(&word_100048120, 0x5DCuLL);
  outpacket_buf = 553649151;
  word_10004813C = 2049;
  byte_10004813E = 6;
  v4 = word_100046FD2;
  word_100048140 = 0;
  LOBYTE(word_100048142) = (unsigned __int16)(word_100046FD2 + 2) >> 8;
  word_100046FD2 += 4;
  HIBYTE(word_100048142) = v4 + 3;
  v5 = ntohl(a2);
  dword_100048144 = 0;
  byte_100048148 = HIBYTE(v5);
  byte_100048149 = BYTE2(v5);
  byte_10004814A = BYTE1(v5);
  byte_10004814B = v5;
  qword_10004814C = 0;
  *(uint64_t *)((char *)&qword_10004814C + 7) = 0;
  byte_10004815B = 1;
  qword_10004815C = 0;
  *(_DWORD *)((char *)&qword_10004815C + 7) = 0;
  byte_100048167 = 1;
  qword_100048228 = 0x3D08013563538263;
  word_100048230 = 2055;
  byte_100048233 = 0;
  LOBYTE(word_100048235) = 1;
  qword_100048237 = 0xF9012B2C06063700;
  word_10004823F = -241;
  sub_10002DCFC(a1, 294, v5, 0x44u, 0xFFFFFFFF, 67, v6, v7, v8);
  *(_DWORD *)qword_10004BF70 = 4;
  timeout((int)sub_10002DED8);
}

uint64_t chap_register_digest(uint64_t result)
{
  *(_QWORD *)(result + 64) = qword_10004BF78;
  qword_10004BF78 = result;
  return result;
}

void chap_auth_peer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  char v18;

  if ((dword_10004BF80 & 2) != 0)
  {
    error("CHAP: peer authentication already started!", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    v9 = qword_10004BF78;
    if (!qword_10004BF78)
LABEL_5:
      fatal("CHAP digest 0x%x requested but not available", a2, a3, a4, a5, a6, a7, a8, a3);
    while (*(_DWORD *)v9 != (_DWORD)a3)
    {
      v9 = *(_QWORD *)(v9 + 64);
      if (!v9)
        goto LABEL_5;
    }
    qword_10004BF88 = a2;
    qword_10004BF90 = v9;
    v17 = drand48();
    v18 = dword_10004BF80;
    dword_10004BF80 |= 2u;
    *(_DWORD *)algn_10004BF84 = vcvtd_n_s64_f64(v17, 8uLL);
    if ((v18 & 1) != 0)
      sub_10002E15C(&dword_10004BF80, v10, v11, v12, v13, v14, v15, v16);
  }
}

void sub_10002E15C(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int *v10;
  uint64_t v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;

  v9 = *a1;
  *a1 &= ~0x10u;
  if ((v9 & 0x20) == 0)
  {
    a1[6] = 0;
    a1[8] = 599917567;
    v10 = a1 + 8;
    (*(void (**)(int *))(*((_QWORD *)a1 + 2) + 8))(a1 + 10);
    v11 = *((unsigned __int8 *)a1 + 40);
    v12 = strlen(*((const char **)a1 + 1));
    memcpy((char *)v10 + v11 + 9, *((const void **)a1 + 1), v12);
    v13 = v11 + v12 + 5;
    v14 = (v11 + v12 + 9);
    a1[7] = v14;
    *((_BYTE *)a1 + 36) = 1;
    *((_BYTE *)a1 + 38) = HIBYTE(v13);
    *((_BYTE *)a1 + 39) = v13;
    v15 = *a1;
    v16 = a1[1] + 1;
    *((_BYTE *)a1 + 37) = *((_BYTE *)a1 + 4) + 1;
    *a1 = v15 | 0x20;
    a1[1] = v16;
LABEL_5:
    output(0, (uint64_t)(a1 + 8), v14, a4, a5, a6, a7, a8, v17);
    ++a1[6];
    *a1 |= 0x10u;
    timeout((int)sub_10002E15C);
    return;
  }
  if (a1[6] < chap_max_transmits)
  {
    v14 = a1[7];
    goto LABEL_5;
  }
  *a1 = v9 & 0xFFFFFFC3 | 0xC;
  auth_peer_fail(0, 49699, a3, a4, a5, a6, a7, a8);
}

void chap_auth_with_peer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9;

  if ((xmmword_10004C1F0 & 2) != 0)
  {
    error("CHAP: authentication with peer already started!", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    v9 = qword_10004BF78;
    if (!qword_10004BF78)
LABEL_5:
      fatal("CHAP digest 0x%x requested but not available", a2, a3, a4, a5, a6, a7, a8, a3);
    while (*(_DWORD *)v9 != (_DWORD)a3)
    {
      v9 = *(_QWORD *)(v9 + 64);
      if (!v9)
        goto LABEL_5;
    }
    *((_QWORD *)&xmmword_10004C1F0 + 1) = a2;
    *(_QWORD *)&xmmword_10004C200 = v9;
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 2;
  }
}

_QWORD *sub_10002E31C()
{
  xmmword_10004C380 = 0u;
  unk_10004C390 = 0u;
  xmmword_10004C360 = 0u;
  unk_10004C370 = 0u;
  xmmword_10004C340 = 0u;
  unk_10004C350 = 0u;
  xmmword_10004C320 = 0u;
  unk_10004C330 = 0u;
  xmmword_10004C300 = 0u;
  unk_10004C310 = 0u;
  xmmword_10004C2E0 = 0u;
  unk_10004C2F0 = 0u;
  xmmword_10004C2C0 = 0u;
  unk_10004C2D0 = 0u;
  xmmword_10004C2A0 = 0u;
  unk_10004C2B0 = 0u;
  xmmword_10004C280 = 0u;
  unk_10004C290 = 0u;
  xmmword_10004C260 = 0u;
  unk_10004C270 = 0u;
  xmmword_10004C240 = 0u;
  unk_10004C250 = 0u;
  xmmword_10004C220 = 0u;
  unk_10004C230 = 0u;
  xmmword_10004C200 = 0u;
  unk_10004C210 = 0u;
  xmmword_10004C1F0 = 0u;
  bzero(&dword_10004BF80, 0x270uLL);
  chap_md5_init();
  return chapms_init();
}

void sub_10002E384(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  int v35;
  unsigned int (*v36)(unsigned __int8 *, uint64_t, char *);
  unsigned int v37;
  int v39;
  const char *v40;
  char v41;
  _BOOL4 v42;
  int v43;
  uint64_t (*v44)(unsigned __int8 *, uint64_t);
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  const char *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  size_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  size_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  int v100;
  unsigned int v101;
  _BYTE v102[257];
  char v103[257];
  int v104;
  char v105;
  char v106;
  char v107;
  char v108;
  _BYTE v109[324];

  if ((int)a3 < 4)
    return;
  v9 = __rev16(*((unsigned __int16 *)a2 + 1));
  v10 = v9 - 4;
  if (v9 < 4 || v9 > a3)
    return;
  v12 = a2[1];
  v13 = a2 + 4;
  v14 = *a2;
  if ((v14 - 3) < 2)
  {
    v34 = xmmword_10004C1F0;
    if ((xmmword_10004C1F0 & 7) != 3)
      return;
    v35 = xmmword_10004C1F0 | 4;
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 4;
    if ((v34 & 0x10) != 0)
    {
      LODWORD(xmmword_10004C1F0) = v35 & 0xFFFFFFEF;
      untimeout((uint64_t)sub_10002F00C, (uint64_t)&xmmword_10004C1F0);
    }
    if ((_DWORD)v14 == 3)
    {
      v36 = *(unsigned int (**)(unsigned __int8 *, uint64_t, char *))(xmmword_10004C200 + 32);
      if (v36)
      {
        if (!v36(v13, v10, (char *)&xmmword_10004C200 + 8))
          goto LABEL_73;
LABEL_61:
        auth_withpeer_success(0, 49699, *(_DWORD *)xmmword_10004C200);
        return;
      }
      v49 = "CHAP authentication succeeded";
LABEL_57:
      if ((_DWORD)v10)
        info("%s: %.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (int)v49);
      else
        info("%s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (int)v49);
      if ((_DWORD)v14 != 3)
        goto LABEL_73;
      goto LABEL_61;
    }
    v44 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(xmmword_10004C200 + 40);
    if (!v44)
    {
      v49 = "CHAP authentication failed";
      goto LABEL_57;
    }
    byte_10004C4A2 = 0;
    v45 = v44(v13, v10);
    if (v45 == 2)
    {
      if (byte_10004C3A0 != 1 || (byte_10004C3A0 = 0, byte_10004C5A2 != (_DWORD)v12))
      {
        LODWORD(xmmword_10004C1F0) = v34;
        v46 = (uint64_t)v13;
        v47 = v10;
        v48 = 0;
        goto LABEL_71;
      }
    }
    else
    {
      if (v45 != 1)
        goto LABEL_73;
      if (byte_10004C3A0 != 1 || (byte_10004C3A0 = 0, byte_10004C5A2 != (_DWORD)v12))
      {
        LODWORD(xmmword_10004C1F0) = v34;
        v46 = (uint64_t)v13;
        v47 = v10;
        v48 = 1;
LABEL_71:
        if (!sub_10002F1A4(v46, v47, v48))
          return;
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 4;
LABEL_73:
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 8;
        auth_withpeer_fail(0, 49699);
        return;
      }
    }
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFFB;
    return;
  }
  if ((_DWORD)v14 == 2)
  {
    v37 = dword_10004BF80;
    if ((dword_10004BF80 & 1) != 0 && v10 >= 2 && byte_10004BFA5 == (_DWORD)v12)
    {
      if ((dword_10004BF80 & 0x20) != 0)
      {
        v50 = v10 + ~a2[4];
        if (v50 < 0)
          return;
        if ((dword_10004BF80 & 0x10) != 0)
        {
          dword_10004BF80 &= ~0x10u;
          untimeout((uint64_t)sub_10002E15C, (uint64_t)&dword_10004BF80);
        }
        if (explicit_remote)
        {
          v40 = &remote_name;
        }
        else
        {
          LODWORD(v99) = v50;
          v40 = (const char *)&v104;
          slprintf((int)&v104, 257, "%.*v");
        }
        v74 = (uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))chap_verify_hook;
        if (!chap_verify_hook)
          v74 = sub_10002F0C0;
        v39 = v74(v40, (const char *)qword_10004BF88, v12, qword_10004BF90, (uint64_t)&unk_10004BFA8, (uint64_t)(a2 + 4), (uint64_t)&byte_10004C0EC, 256);
        if (v39 && auth_number())
        {
          v37 = dword_10004BF80;
        }
        else
        {
          v37 = dword_10004BF80 | 8;
          dword_10004BF80 |= 8u;
        }
      }
      else
      {
        if ((dword_10004BF80 & 4) == 0)
          return;
        v39 = 0;
        v40 = 0;
      }
      outpacket_buf = 599917567;
      v75 = strlen(&byte_10004C0EC);
      v81 = v75;
      v82 = (v37 >> 3) & 1;
      if (v39 == -1)
        v82 = 1;
      if (v82)
        v83 = 4;
      else
        v83 = 3;
      LOBYTE(word_100048120) = v83;
      HIBYTE(word_100048120) = v12;
      LOBYTE(word_100048122) = (unsigned __int16)(v75 + 4) >> 8;
      HIBYTE(word_100048122) = v75 + 4;
      if (v75 >= 1)
        memcpy(&byte_100048124, &byte_10004C0EC, v75);
      output(0, (uint64_t)&outpacket_buf, (v81 + 8), v76, v77, v78, v79, v80, (int)v99);
      byte_10004C3A1 = 0;
      v91 = dword_10004BF80;
      if (v39 == -1)
      {
        dword_10004BF80 |= 0x20u;
        ++byte_10004BFA5;
        __strlcpy_chk(&byte_10004C3A1, v40, 257, 257);
      }
      else if ((dword_10004BF80 & 4) == 0)
      {
        dword_10004BF80 = dword_10004BF80 & 0xFFFFFFDB | 4;
        if ((v91 & 8) != 0)
        {
          notice("CHAP peer authentication failed for %q", v84, v85, v86, v87, v88, v89, v90, (int)v40);
          auth_peer_fail(0, 49699, v93, v94, v95, v96, v97, v98);
        }
        else
        {
          notice("CHAP peer authentication succeeded for %q", v84, v85, v86, v87, v88, v89, v90, (int)v40);
          v92 = strlen(v40);
          auth_peer_success(0, 49699, *(_DWORD *)qword_10004BF90, (uint64_t)v40, v92);
          if (chap_rechallenge_time)
          {
            dword_10004BF80 |= 0x10u;
            v33 = sub_10002E15C;
LABEL_26:
            timeout((int)v33);
          }
        }
      }
    }
  }
  else if ((_DWORD)v14 == 1)
  {
    if (v10 >= 2 && (xmmword_10004C1F0 & 3) == 3)
    {
      v16 = *v13;
      if (v10 > v16)
      {
        if ((xmmword_10004C1F0 & 0x10) != 0)
        {
          LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEF;
          untimeout((uint64_t)sub_10002F00C, (uint64_t)&xmmword_10004C1F0);
          v16 = *v13;
        }
        v101 = 0;
        v100 = v10 + ~v16;
        slprintf((int)v103, 257, "%.*v");
        if (explicit_remote || remote_name && !v103[0])
          __strlcpy_chk(v103, &remote_name, 257, 257);
        if (!get_secret(0, *((const char **)&xmmword_10004C1F0 + 1), v103, v102, (int *)&v101, 0))
        {
          v101 = 0;
          warning("No CHAP secret found for authenticating us to %q", v17, v18, v19, v20, v21, v22, v23, (int)v103);
        }
        byte_10004C3A0 = 0;
        v104 = 599917567;
        (*(void (**)(_BYTE *, uint64_t, _QWORD, unsigned __int8 *, _BYTE *, _QWORD, char *))(xmmword_10004C200 + 24))(v109, v12, *((_QWORD *)&xmmword_10004C1F0 + 1), a2 + 4, v102, v101, (char *)&xmmword_10004C200 + 8);
        __memset_chk(v102, 0, (int)v101, 257);
        v24 = v109[0];
        v25 = strlen(*((const char **)&xmmword_10004C1F0 + 1));
        memcpy(&v109[v109[0] + 1], *((const void **)&xmmword_10004C1F0 + 1), v25);
        v26 = v24 + v25;
        v105 = 2;
        v106 = v12;
        v107 = (unsigned __int16)(v26 + 5) >> 8;
        v108 = v26 + 5;
        v27 = v26 + 9;
        output(0, (uint64_t)&v104, v26 + 9, v28, v29, v30, v31, v32, v100);
        HIDWORD(xmmword_10004C240) = v27;
        __memcpy_chk(&unk_10004C250, &v104, v27, 336);
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEB | 0x10;
        v33 = sub_10002F00C;
        goto LABEL_26;
      }
    }
  }
  else if (chap_unknown_hook)
  {
    v41 = dword_10004BF80;
    if ((dword_10004BF80 & 1) != 0)
    {
      v42 = 0;
      byte_10004C0EC = 0;
      if ((dword_10004BF80 & 4) == 0)
      {
        v99 = &byte_10004C0EC;
        v43 = chap_unknown_hook(&byte_10004C3A1, qword_10004BF88, v14, v12, qword_10004BF90, &unk_10004BFA8, v13, v10);
        if (v43 == -2)
          return;
        if (v43)
        {
          v41 = dword_10004BF80;
          v42 = v43 == -1;
        }
        else
        {
          v42 = 0;
          v41 = dword_10004BF80 | 8;
          dword_10004BF80 |= 8u;
        }
      }
      outpacket_buf = 599917567;
      v51 = strlen(&byte_10004C0EC);
      v57 = v51;
      if (v42 | ((v41 & 8) >> 3))
        v58 = 4;
      else
        v58 = 3;
      LOBYTE(word_100048120) = v58;
      HIBYTE(word_100048120) = v12;
      LOBYTE(word_100048122) = (unsigned __int16)(v51 + 4) >> 8;
      HIBYTE(word_100048122) = v51 + 4;
      if (v51 >= 1)
        memcpy(&byte_100048124, &byte_10004C0EC, v51);
      output(0, (uint64_t)&outpacket_buf, (v57 + 8), v52, v53, v54, v55, v56, (int)v99);
      if (!v42)
      {
        v66 = dword_10004BF80;
        if ((dword_10004BF80 & 4) == 0)
        {
          dword_10004BF80 |= 4u;
          if ((v66 & 8) != 0)
          {
            notice("CHAP peer authentication failed for %q", v59, v60, v61, v62, v63, v64, v65, (int)&byte_10004C3A1);
            auth_peer_fail(0, 49699, v68, v69, v70, v71, v72, v73);
          }
          else
          {
            notice("CHAP peer authentication succeeded for %q", v59, v60, v61, v62, v63, v64, v65, (int)&byte_10004C3A1);
            v67 = strlen(&byte_10004C3A1);
            auth_peer_success(0, 49699, *(_DWORD *)qword_10004BF90, (uint64_t)&byte_10004C3A1, v67);
            if (chap_rechallenge_time)
            {
              dword_10004BF80 |= 0x10u;
              timeout((int)sub_10002E15C);
            }
          }
        }
      }
    }
  }
}

void sub_10002ECB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  int v9;

  v8 = dword_10004BF80;
  if ((dword_10004BF80 & 0x10) != 0)
  {
    dword_10004BF80 &= ~0x10u;
    untimeout((uint64_t)sub_10002E15C, (uint64_t)&dword_10004BF80);
    v8 = dword_10004BF80;
  }
  if ((v8 & 2) != 0)
  {
    dword_10004BF80 = 0;
    auth_peer_fail(0, 49699, a3, a4, a5, a6, a7, a8);
  }
  v9 = xmmword_10004C1F0;
  if ((xmmword_10004C1F0 & 0x10) != 0)
  {
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEF;
    untimeout((uint64_t)sub_10002F00C, (uint64_t)&xmmword_10004C1F0);
    v9 = xmmword_10004C1F0;
  }
  if ((v9 & 6) == 2)
  {
    LODWORD(xmmword_10004C1F0) = v9 & 0xFFFFFFFD;
    auth_withpeer_fail(0, 49699);
  }
}

void sub_10002ED68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  chapms_reinit();
  LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 1;
  v7 = dword_10004BF80;
  dword_10004BF80 |= 1u;
  if ((v7 & 2) != 0)
    sub_10002E15C(&dword_10004BF80, v0, v1, v2, v3, v4, v5, v6);
}

void sub_10002EDB0()
{
  if ((xmmword_10004C1F0 & 0x10) != 0)
    untimeout((uint64_t)sub_10002F00C, (uint64_t)&xmmword_10004C1F0);
  LODWORD(xmmword_10004C1F0) = 0;
  if ((dword_10004BF80 & 0x10) != 0)
    untimeout((uint64_t)sub_10002E15C, (uint64_t)&dword_10004BF80);
  dword_10004BF80 = 0;
  if (byte_10004C5A4 == 1)
  {
    pthread_cancel((pthread_t)qword_10004C5C0);
    byte_10004C5A4 = 0;
  }
}

uint64_t sub_10002EE30(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  int v5;
  int v6;
  uint64_t v7;
  int v12;
  int v13;
  const char *v14;
  unsigned __int8 *v15;
  char *v16;
  int v17;
  unsigned int v18;
  char *v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;

  if (a2 < 4)
    return 0;
  v5 = a1[2];
  v6 = a1[3];
  v7 = v6 | (v5 << 8);
  if (v7 < 4 || v7 > a2)
    return 0;
  v12 = *a1;
  v13 = a1[1];
  v25 = v7 - 4;
  if ((v12 - 1) > 3)
    v14 = " code=0x%x";
  else
    v14 = " %s";
  a3(a4, v14);
  v15 = a1 + 4;
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v13);
  if ((v12 - 1) < 2)
  {
    if (v7 >= 5)
    {
      v18 = *v15;
      if (v25 <= v18)
        return v7;
      v19 = (char *)(a1 + 5);
      v20 = v25 + ~v18;
      a3(a4, " <");
      if (v18)
      {
        v21 = v18 + 1;
        do
        {
          v22 = *v19++;
          ((void (*)(uint64_t, const char *, ...))a3)(a4, "%.2x", v22);
          --v21;
        }
        while (v21 > 1);
      }
      a3(a4, ">, name = ");
      v16 = v19;
      v17 = v20;
      goto LABEL_15;
    }
    return 4;
  }
  if ((v12 - 3) < 2)
  {
    a3(a4, " ");
    v16 = (char *)(a1 + 4);
    v17 = v7 - 4;
LABEL_15:
    print_string(v16, v17, a3, a4);
    return v7;
  }
  if (v7 < 5)
    return 4;
  v23 = (v5 << 8) + v6 - 3;
  do
  {
    v24 = *v15++;
    ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
    --v23;
  }
  while (v23 > 1);
  return v7;
}

void sub_10002F00C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  unsigned int v10;
  int v11;

  v9 = *a1;
  v10 = *a1 & 0xFFFFFFEF;
  *a1 = v10;
  if ((v9 & 0x40) == 0)
  {
    a1[22] = 0;
    *a1 = v10 | 0x40;
LABEL_4:
    output(0, (uint64_t)(a1 + 24), a1[23], a4, a5, a6, a7, a8, v11);
    ++a1[22];
    *a1 |= 0x10u;
    timeout((int)sub_10002F00C);
    return;
  }
  if ((int)a1[22] < chap_max_transmits)
    goto LABEL_4;
  *a1 = v9 & 0xFFFFFFA3 | 0xC;
  auth_peer_fail(0, 49699, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10002F0C0(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v23;
  _BYTE v24[256];

  v23 = 0;
  if (get_secret(0, a1, a2, v24, (int *)&v23, 1))
    return (*(uint64_t (**)(uint64_t, const char *, _BYTE *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 16))(a3, a1, v24, v23, a5, a6, a7, a8);
  error("No CHAP secret found for authenticating %q", v15, v16, v17, v18, v19, v20, v21, (int)a1);
  return 0;
}

uint64_t sub_10002F1A4(uint64_t a1, int a2, int a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  if ((byte_10004C5A4 & 1) != 0)
    return 0;
  if (qword_10004C5A8)
    free((void *)qword_10004C5A8);
  v7 = (a2 + 4);
  v8 = malloc_type_malloc(v7, 0x4BEE6F19uLL);
  qword_10004C5A8 = (uint64_t)v8;
  if (!v8)
  {
    error("CHAP: cannot allocate memory to save packet", v9, v10, v11, v12, v13, v14, v15, v30);
    return 0xFFFFFFFFLL;
  }
  memcpy(v8, (const void *)(a1 - 4), v7);
  dword_10004C5B0 = a3;
  if (pipe((int *)&qword_10004C5B8) < 0)
  {
    error("chap failed to create pipe for User Interface...\n", v16, v17, v18, v19, v20, v21, v22, v30);
    goto LABEL_11;
  }
  if (pthread_create((pthread_t *)&qword_10004C5C0, 0, (void *(__cdecl *)(void *))sub_10002F2DC, 0))
  {
    error("chap failed to create thread for client User Interface...\n", v23, v24, v25, v26, v27, v28, v29, v30);
    close(qword_10004C5B8);
    close(SHIDWORD(qword_10004C5B8));
LABEL_11:
    free((void *)qword_10004C5A8);
    qword_10004C5A8 = 0;
    return 0xFFFFFFFFLL;
  }
  wait_input_hook = (uint64_t (*)(double))sub_10002F364;
  add_fd(qword_10004C5B8);
  result = 0;
  byte_10004C5A4 = 1;
  return result;
}

uint64_t sub_10002F2DC()
{
  _opaque_pthread_t *v0;
  char *v1;
  uint64_t *v2;
  char __buf;

  __buf = -1;
  v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    if (byte_10004C4A2)
      v1 = &byte_10004C4A2;
    else
      v1 = 0;
    if (dword_10004C5B0 == 1)
      v2 = &change_password_hook;
    else
      v2 = &retry_password_hook;
    if (!((unsigned int (*)(char *))*v2)(v1))
      __buf = 0;
  }
  write(SHIDWORD(qword_10004C5B8), &__buf, 1uLL);
  return 0;
}

void sub_10002F364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  char v23;
  _BYTE v24[257];
  char v25[257];
  int v26;
  _WORD v27[748];

  if ((_DWORD)qword_10004C5B8 != -1 && is_ready_fd(qword_10004C5B8))
  {
    v22 = 0;
    byte_10004C5A4 = 0;
    v23 = 0;
    read(qword_10004C5B8, &v23, 1uLL);
    wait_input_hook = 0;
    remove_fd(qword_10004C5B8);
    close(qword_10004C5B8);
    close(SHIDWORD(qword_10004C5B8));
    qword_10004C5B8 = -1;
    if (v23)
    {
      v25[0] = 0;
      if (explicit_remote | remote_name)
        __strlcpy_chk(v25, &remote_name, 257, 257);
      if (!get_secret(0, *((const char **)&xmmword_10004C1F0 + 1), v25, v24, (int *)&v22, 0))
      {
        v22 = 0;
        warning("No CHAP secret found for authenticating us to %q", v0, v1, v2, v3, v4, v5, v6, (int)v25);
      }
      v26 = 599917567;
      if (dword_10004C5B0 == 1)
      {
        v7 = strlen(new_passwd);
        v8 = (*(uint64_t (**)(_WORD *, _QWORD, uint64_t, _BYTE *, _QWORD, char *, size_t, char *))(xmmword_10004C200 + 48))(v27, *((_QWORD *)&xmmword_10004C1F0 + 1), qword_10004C5A8, v24, v22, new_passwd, v7, (char *)&xmmword_10004C200 + 8);
        if (!v8)
          save_new_password();
      }
      else
      {
        v8 = (*(uint64_t (**)(_WORD *, _QWORD, uint64_t, _BYTE *, _QWORD, char *))(xmmword_10004C200 + 56))(v27, *((_QWORD *)&xmmword_10004C1F0 + 1), qword_10004C5A8, v24, v22, (char *)&xmmword_10004C200 + 8);
      }
      __memset_chk(v24, 0, (int)v22, 257);
      byte_10004C3A0 = 1;
      byte_10004C5A2 = *(_BYTE *)(qword_10004C5A8 + 1);
      free((void *)qword_10004C5A8);
      qword_10004C5A8 = 0;
      if (!v8)
        output(0, (uint64_t)&v26, __rev16(v27[1]) + 4, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      free((void *)qword_10004C5A8);
      qword_10004C5A8 = 0;
      v15 = xmmword_10004C1F0;
      if ((xmmword_10004C1F0 & 0x10) != 0)
      {
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEF;
        untimeout((uint64_t)sub_10002F00C, (uint64_t)&xmmword_10004C1F0);
        v15 = xmmword_10004C1F0;
      }
      LODWORD(xmmword_10004C1F0) = v15 | 4;
      auth_withpeer_cancelled(0, 49699, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t setup_security_context()
{
  kern_return_t v0;
  uint64_t v1;
  _OWORD v3[2];
  int v4;
  mach_port_name_t v5;
  mach_port_t sp[2];

  *(_QWORD *)sp = 0;
  v5 = 0;
  v4 = 0;
  memset(v3, 0, sizeof(v3));
  v0 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
  if (v0)
  {
    if (v0 == 1102)
      return 0xFFFFFFFFLL;
    else
      return 4294967294;
  }
  else
  {
    v1 = sub_100030E84(sp[1], sp, &v5, &v4, v3);
    mach_port_deallocate(mach_task_self_, sp[1]);
    if (!(_DWORD)v1)
    {
      if (!sp[0]
        || (v1 = task_set_special_port(mach_task_self_, 4, sp[0]),
            mach_port_deallocate(mach_task_self_, sp[0]),
            !(_DWORD)v1))
      {
        if (v5)
        {
          if (!audit_session_join(v5))
            return 4294967293;
          mach_port_deallocate(mach_task_self_, v5);
        }
        return 0;
      }
    }
  }
  return v1;
}

BOOL DesSetkey(uint64_t a1, uint8x8_t a2, uint8x8_t a3)
{
  uint64_t v3;
  int v4;
  int16x8_t v5;
  int v6;
  int v7;
  uint32x4_t v8;
  _QWORD v10[8];
  char v11;
  unsigned __int32 v12;
  char v13;
  char v14;
  char v15;

  v3 = 0;
  v4 = *(unsigned __int8 *)(a1 + 4);
  a2.i32[0] = *(_DWORD *)a1;
  v5 = (int16x8_t)vmovl_u8(a2);
  v11 = v5.i8[0] & 0xFE;
  a3.i32[0] = *(_DWORD *)(a1 + 1);
  v6 = *(unsigned __int8 *)(a1 + 5);
  v13 = ((v6 | (v4 << 8)) >> 5) & 0xFE;
  *(int8x8_t *)v5.i8 = vand_s8((int8x8_t)vshl_u16((uint16x4_t)vorr_s8((int8x8_t)vshl_n_s16(*(int16x4_t *)v5.i8, 8uLL), (int8x8_t)*(_OWORD *)&vmovl_u8(a3)), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0xFE00FE00FE00FELL);
  v12 = vmovn_s16(v5).u32[0];
  v7 = *(unsigned __int8 *)(a1 + 6);
  v14 = ((v7 | (v6 << 8)) >> 6) & 0xFE;
  v15 = 2 * v7;
  do
  {
    v8 = (uint32x4_t)vdupq_n_s32(*(&v11 + v3));
    v10[v3++] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_10003B700), (int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_10003B6F0))), (int8x8_t)0x101010101010101);
  }
  while (v3 != 8);
  *__error() = 0;
  setkey((const char *)v10);
  return *__error() == 0;
}

uint64_t DesEncrypt(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  unsigned int v4;
  uint32x4_t v5;
  int *v6;
  uint64_t result;
  unsigned int v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  BOOL v14;
  _QWORD v15[8];

  v3 = 0;
  v4 = -8;
  do
  {
    v5 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(a1 + v3));
    v15[v3] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B700), (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B6F0))), (int8x8_t)0x101010101010101);
    v4 += 8;
    ++v3;
  }
  while (v4 < 0x38);
  *__error() = 0;
  encrypt((char *)v15, 0);
  v6 = __error();
  result = 0;
  if (!*v6)
  {
    v8 = 0;
    v9 = (unsigned __int8 *)v15;
    do
    {
      v10 = 0;
      v11 = 7;
      v12 = v9;
      do
      {
        v13 = *v12++;
        v10 |= v13 << v11--;
      }
      while (v11 != -1);
      v9 += 8;
      *a2++ = v10;
      v14 = v8 >= 0x38;
      v8 += 8;
    }
    while (!v14);
    return 1;
  }
  return result;
}

uint64_t DesDecrypt(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  unsigned int v4;
  uint32x4_t v5;
  int *v6;
  uint64_t result;
  unsigned int v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  BOOL v14;
  _QWORD v15[8];

  v3 = 0;
  v4 = -8;
  do
  {
    v5 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(a1 + v3));
    v15[v3] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B700), (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B6F0))), (int8x8_t)0x101010101010101);
    v4 += 8;
    ++v3;
  }
  while (v4 < 0x38);
  *__error() = 0;
  encrypt((char *)v15, 1);
  v6 = __error();
  result = 0;
  if (!*v6)
  {
    v8 = 0;
    v9 = (unsigned __int8 *)v15;
    do
    {
      v10 = 0;
      v11 = 7;
      v12 = v9;
      do
      {
        v13 = *v12++;
        v10 |= v13 << v11--;
      }
      while (v11 != -1);
      v9 += 8;
      *a2++ = v10;
      v14 = v8 >= 0x38;
      v8 += 8;
    }
    while (!v14);
    return 1;
  }
  return result;
}

uint64_t chap_md5_init()
{
  return chap_register_digest((uint64_t)&unk_100047208);
}

_BYTE *sub_10002FA54(_BYTE *a1)
{
  unsigned int v2;

  v2 = vcvtd_n_s64_f64(drand48(), 3uLL);
  *a1 = v2 + 16;
  return random_bytes(a1 + 1, v2 + 16);
}

uint64_t sub_10002FA84(char a1, uint64_t a2, const void *a3, CC_LONG a4, unsigned __int8 *a5, uint64_t a6, int a7, int a8)
{
  const void *v13;
  CC_LONG v14;
  uint64_t v15;
  char *v17;
  char data;
  CC_MD5_CTX c;
  unsigned __int8 md[8];
  uint64_t v22;

  memset(&c, 0, sizeof(c));
  data = a1;
  if (*(_BYTE *)a6 != 16)
    goto LABEL_6;
  v13 = a5 + 1;
  v14 = *a5;
  CC_MD5_Init(&c);
  v15 = 1;
  CC_MD5_Update(&c, &data, 1u);
  CC_MD5_Update(&c, a3, a4);
  CC_MD5_Update(&c, v13, v14);
  CC_MD5_Final(md, &c);
  if (*(_QWORD *)md == *(_QWORD *)(a6 + 1) && v22 == *(_QWORD *)(a6 + 9))
  {
    v17 = "Access granted";
  }
  else
  {
LABEL_6:
    v15 = 0;
    v17 = "Access denied";
  }
  slprintf(a7, a8, v17);
  return v15;
}

uint64_t sub_10002FBB0(_BYTE *a1, char a2, uint64_t a3, unsigned __int8 *a4, const void *a5, CC_LONG a6)
{
  const void *v9;
  CC_LONG v10;
  uint64_t result;
  char data;
  CC_MD5_CTX c;

  memset(&c, 0, sizeof(c));
  data = a2;
  v9 = a4 + 1;
  v10 = *a4;
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, &data, 1u);
  CC_MD5_Update(&c, a5, a6);
  CC_MD5_Update(&c, v9, v10);
  result = CC_MD5_Final(a1 + 1, &c);
  *a1 = 16;
  return result;
}

uint64_t sub_10002FC58(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, _DWORD *a7, _DWORD *a8)
{
  mach_port_t reply_port;
  uint64_t v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t msg;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  NDR_record_t v27;
  int v28;

  msg.msgh_size = 0;
  v17 = 4;
  v18 = a2;
  v19 = 16777472;
  v20 = a3;
  v21 = a4;
  v22 = 1245184;
  v23 = a5;
  v24 = 1114112;
  v25 = a6;
  v26 = 1245184;
  v27 = NDR_record;
  v28 = a3;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x465000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 3, 0x5Cu, 0x3Cu, reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        v13 = 4294966988;
      }
      else if (msg.msgh_id == 18100)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v13 = 4294966996;
          if (v17 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v19) << 16 == 1114112)
          {
            v13 = 0;
            v14 = HIDWORD(v21);
            *a7 = v18;
            *a8 = v14;
            return v13;
          }
        }
        else if (msg.msgh_size == 36)
        {
          v13 = 4294966996;
          if (HIDWORD(v18))
          {
            if (msg.msgh_remote_port)
              v13 = 4294966996;
            else
              v13 = HIDWORD(v18);
          }
        }
        else
        {
          v13 = 4294966996;
        }
      }
      else
      {
        v13 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v13;
}

uint64_t sub_10002FE58(int a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_name_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE msg[36];
  __int128 v13;

  *(_OWORD *)&msg[20] = 0u;
  v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x465100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
      return v8;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 18101)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 44)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v8 = *(unsigned int *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              v11 = DWORD1(v13);
              *a2 = v13;
              *a3 = v11;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v9 = 1;
          else
            v9 = *(_DWORD *)&msg[32] == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = *(unsigned int *)&msg[32];
          goto LABEL_23;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[12]);
  return v8;
}

uint64_t sub_10002FFC4(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;

  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x465200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18102)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            v11 = DWORD1(v14);
            if (DWORD1(v14) == (_DWORD)v15)
            {
              v10 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_100030194(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;

  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x465300000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18103)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            v11 = DWORD1(v14);
            if (DWORD1(v14) == (_DWORD)v15)
            {
              v10 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_100030364(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;

  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x465400000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18104)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            v11 = DWORD1(v14);
            if (DWORD1(v14) == (_DWORD)v15)
            {
              v10 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_100030534(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  mach_port_t reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_msg_header_t msg;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  NDR_record_t v17;
  int v18;
  int v19;

  v13 = 1;
  v14 = a2;
  v15 = 16777472;
  v16 = a3;
  v17 = NDR_record;
  v18 = a3;
  v19 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x465500000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v8 = mach_msg(&msg, 3, 0x3Cu, 0x30u, reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v9;
    }
    if (msg.msgh_id == 71)
    {
      v9 = 4294966988;
    }
    else if (msg.msgh_id == 18105)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v10 = 1;
          else
            v10 = HIDWORD(v14) == 0;
          if (v10)
            v9 = 4294966996;
          else
            v9 = HIDWORD(v14);
          goto LABEL_23;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v9;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v9;
}

uint64_t sub_1000306DC(mach_port_t a1, int a2, _DWORD *a3)
{
  mach_port_t reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  mach_msg_header_t v10;
  NDR_record_t v11;
  __int128 v12;

  v12 = 0u;
  v10.msgh_size = 0;
  v11 = NDR_record;
  LODWORD(v12) = a2;
  reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(_QWORD *)&v10.msgh_voucher_port = 0x465600000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    reply_port = v10.msgh_local_port;
  }
  v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      v7 = 4294966988;
    }
    else if (v10.msgh_id == 18106)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            v7 = v12;
            if (!(_DWORD)v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port)
            v8 = 1;
          else
            v8 = (_DWORD)v12 == 0;
          if (v8)
            v7 = 4294966996;
          else
            v7 = v12;
          goto LABEL_23;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t sub_100030850(int a1, _DWORD *a2)
{
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x465700000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 18107)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v7 = 1;
          else
            v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v7)
            v6 = 4294966996;
          else
            v6 = *(unsigned int *)&rcv_name_12[16];
          goto LABEL_23;
        }
      }
      v6 = 4294966996;
    }
    else
    {
      v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t sub_1000309B0(int a1, _DWORD *a2)
{
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x465800000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 18108)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v7 = 1;
          else
            v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v7)
            v6 = 4294966996;
          else
            v6 = *(unsigned int *)&rcv_name_12[16];
          goto LABEL_23;
        }
      }
      v6 = 4294966996;
    }
    else
    {
      v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t sub_100030B10(mach_port_t a1, int a2, _DWORD *a3)
{
  mach_port_t reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  mach_msg_header_t v10;
  NDR_record_t v11;
  __int128 v12;

  v12 = 0u;
  v10.msgh_size = 0;
  v11 = NDR_record;
  LODWORD(v12) = a2;
  reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(_QWORD *)&v10.msgh_voucher_port = 0x465900000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    reply_port = v10.msgh_local_port;
  }
  v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      v7 = 4294966988;
    }
    else if (v10.msgh_id == 18109)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            v7 = v12;
            if (!(_DWORD)v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port)
            v8 = 1;
          else
            v8 = (_DWORD)v12 == 0;
          if (v8)
            v7 = 4294966996;
          else
            v7 = v12;
          goto LABEL_23;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t sub_100030C84(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7, int a8, int a9, _DWORD *a10, _DWORD *a11)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  NDR_record_t v28;
  int v29;
  int v30;
  int v31;
  int v32;

  v18 = 4;
  v17.msgh_size = 0;
  v19 = a2;
  v20 = 16777472;
  v21 = a3;
  v22 = a4;
  v23 = 1245184;
  v24 = a5;
  v25 = 1114112;
  v26 = a6;
  v27 = 1245184;
  v28 = NDR_record;
  v29 = a3;
  v30 = a7;
  v31 = a8;
  v32 = a9;
  reply_port = mig_get_reply_port();
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = reply_port;
  v17.msgh_bits = -2147478253;
  *(_QWORD *)&v17.msgh_voucher_port = 0x465D00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v17);
    reply_port = v17.msgh_local_port;
  }
  v13 = mach_msg(&v17, 3, 0x68u, 0x3Cu, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v17.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (v17.msgh_id == 18113)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (v18 == 1 && v17.msgh_size == 52 && !v17.msgh_remote_port && HIWORD(v20) << 16 == 1114112)
          {
            v14 = 0;
            v15 = HIDWORD(v22);
            *a10 = v19;
            *a11 = v15;
            return v14;
          }
        }
        else if (v17.msgh_size == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port)
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_reply_port(v17.msgh_local_port);
  }
  return v14;
}

uint64_t sub_100030E84(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  mach_port_name_t reply_port;
  uint64_t v11;
  uint64_t v12;
  int v14;
  __int128 v15;
  _BYTE msg[36];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x465F00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v11 = mach_msg((mach_msg_header_t *)msg, 50331651, 0x18u, 0x84u, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v12;
  }
  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v12;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v12 = 4294966988;
    goto LABEL_27;
  }
  if (*(_DWORD *)&msg[20] != 18115)
  {
    v12 = 4294966995;
    goto LABEL_27;
  }
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      v12 = 4294966996;
      if (*(_DWORD *)&msg[32])
      {
        if (*(_DWORD *)&msg[8])
          v12 = 4294966996;
        else
          v12 = *(unsigned int *)&msg[32];
      }
    }
    else
    {
      v12 = 4294966996;
    }
    goto LABEL_27;
  }
  v12 = 4294966996;
  if (*(_DWORD *)&msg[24] != 2
    || *(_DWORD *)&msg[4] != 64
    || *(_DWORD *)&msg[8]
    || WORD1(v17) << 16 != 1114112
    || HIWORD(v17) << 16 != 1114112)
  {
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v12;
  }
  if (HIDWORD(v18) || v19 < 0x20)
    return 4294966987;
  v12 = 0;
  v14 = DWORD1(v17);
  *a2 = *(_DWORD *)&msg[28];
  *a3 = v14;
  *a4 = DWORD2(v18);
  v15 = v21;
  *a5 = v20;
  a5[1] = v15;
  return v12;
}

uint64_t sub_100031070(mach_port_t a1, int a2, _QWORD *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  mach_port_t reply_port;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __int128 v16;
  mach_msg_header_t msg;
  _BYTE v18[12];
  __int128 v19;
  __int128 v20;
  _BYTE v21[60];

  memset(v21, 0, sizeof(v21));
  v20 = 0u;
  v19 = 0u;
  msg.msgh_size = 0;
  *(NDR_record_t *)v18 = NDR_record;
  *(_DWORD *)&v18[8] = a2;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x466000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 50331651, 0x24u, 0x80u, reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if ((_DWORD)v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    v13 = 4294966988;
    goto LABEL_27;
  }
  if (msg.msgh_id != 18116)
  {
    v13 = 4294966995;
    goto LABEL_27;
  }
  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      v13 = 4294966996;
      if (*(_DWORD *)&v18[8])
      {
        if (msg.msgh_remote_port)
          v13 = 4294966996;
        else
          v13 = *(unsigned int *)&v18[8];
      }
    }
    else
    {
      v13 = 4294966996;
    }
    goto LABEL_27;
  }
  v13 = 4294966996;
  if (*(_DWORD *)v18 != 1
    || msg.msgh_size != 60
    || msg.msgh_remote_port
    || BYTE3(v19) != 1
    || (v14 = DWORD1(v19), DWORD1(v19) != (_DWORD)v20))
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v13;
  }
  if (DWORD2(v20) || HIDWORD(v20) < 0x20)
    return 4294966987;
  v13 = 0;
  *a3 = *(_QWORD *)&v18[4];
  *a4 = v14;
  *a5 = DWORD1(v20);
  v16 = *(_OWORD *)&v21[28];
  *a6 = *(_OWORD *)&v21[12];
  a6[1] = v16;
  return v13;
}

uint64_t sub_1000312A4(int a1, _DWORD *a2, _OWORD *a3)
{
  mach_port_name_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BYTE *v11;
  __int128 v12;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = 0;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x466100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 50331651, 0x18u, 0x6Cu, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v8;
  }
  if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v8;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v8 = 4294966988;
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  if (*(_DWORD *)&msg[20] != 18117)
  {
    v8 = 4294966995;
    goto LABEL_23;
  }
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_22;
  if (*(_DWORD *)&msg[4] != 40)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      if (*(_DWORD *)&msg[8])
        v9 = 1;
      else
        v9 = *(_DWORD *)&msg[32] == 0;
      if (v9)
        v8 = 4294966996;
      else
        v8 = *(unsigned int *)&msg[32];
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (*(_DWORD *)&msg[8])
  {
LABEL_22:
    v8 = 4294966996;
    goto LABEL_23;
  }
  v8 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_23;
  v11 = &msg[(*(unsigned int *)&msg[4] + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u)
    return 4294966987;
  v8 = 0;
  *a2 = v14;
  v12 = *(_OWORD *)(v11 + 36);
  *a3 = *(_OWORD *)(v11 + 20);
  a3[1] = v12;
  return v8;
}
