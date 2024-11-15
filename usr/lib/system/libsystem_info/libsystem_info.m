char *__si_module_static_darwin_directory_block_invoke()
{
  char *result;

  result = strdup("darwin_directory");
  si_module_static_darwin_directory_si = (uint64_t)result;
  return result;
}

uint64_t __si_module_static_muser_block_invoke()
{
  uint64_t result;

  si_module_static_muser_si = (uint64_t)strdup("muser");
  result = xpc_user_sessions_enabled();
  if (!(_DWORD)result || (result = xpc_user_sessions_get_session_uid(), (_DWORD)result))
    qword_1ECCEFB68 = (uint64_t)muser_is_valid;
  return result;
}

char *__si_module_static_mdns_block_invoke()
{
  char *result;

  si_module_static_mdns_si = (uint64_t)strdup("mdns");
  pthread_atfork((void (*)(void))_mdns_atfork_prepare, (void (*)(void))_mdns_atfork_parent, (void (*)(void))_mdns_atfork_child);
  result = getenv("RES_DEBUG");
  if (result)
    _mdns_debug = 1;
  return result;
}

void freeaddrinfo(addrinfo *a1)
{
  addrinfo *v1;
  sockaddr *ai_addr;
  addrinfo *ai_next;
  char *ai_canonname;

  if (a1)
  {
    v1 = a1;
    do
    {
      ai_addr = v1->ai_addr;
      ai_next = v1->ai_next;
      if (ai_addr)
        free(ai_addr);
      ai_canonname = v1->ai_canonname;
      if (ai_canonname)
        free(ai_canonname);
      free(v1);
      v1 = ai_next;
    }
    while (ai_next);
  }
}

uint64_t __si_module_cache_byname_block_invoke(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;

  v2 = (char *)malloc_type_calloc(1uLL, 0x10E0uLL, 0x1020040EDEB21B6uLL);
  v3 = 0;
  **(_QWORD **)(a1 + 32) = strdup(*(const char **)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v4 + 8) = 0x100000001;
  *(_DWORD *)(v4 + 16) = 1;
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = &si_module_cache_byname_cache_vtable;
  do
  {
    v5 = 20;
    do
    {
      result = pthread_mutex_init((pthread_mutex_t *)&v2[240 * v3], 0);
      --v5;
    }
    while (v5);
    ++v3;
  }
  while (v3 != 18);
  return result;
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  uint64_t v7;
  int v14;
  BOOL v15;
  int v16;
  BOOL v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  _QWORD *v21;
  _OWORD *v22;
  _OWORD *v23;
  const char *v24;
  int v25;
  size_t v26;
  int v27;
  const char *v28;
  int v29;
  size_t v30;
  int v31;
  int v32;
  int v33;

  if (!a1)
    return 4;
  if (a1->sa_family == 18)
    return getnameinfo_link((uint64_t)a1, a2, a3, a4, a5, a6);
  v33 = 0;
  if (a3)
    v15 = a4 == 0;
  else
    v15 = 1;
  v16 = !v15;
  if (a5)
    v17 = a6 == 0;
  else
    v17 = 1;
  v18 = !v17;
  if ((v16 & 1) != 0 || (v14 = 0, v18))
  {
    v19 = a7 | 2;
    if (v16)
      v19 = a7;
    if (v18)
      v20 = v19;
    else
      v20 = v19 | 8;
    v21 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v21 = si_module_with_name("search");
      si_search_search = (uint64_t)v21;
    }
    v22 = si_nameinfo((uint64_t)v21, (uint64_t)a1, v20, 0, &v33, *(uint64_t *)&a6, *(uint64_t *)&a7, v7);
    v23 = v22;
    if (v33 || !v22)
    {
      si_item_release((unsigned int *)v22);
      if ((v33 - 200) >= 0xFFFFFF9D)
        v32 = v33 - 100;
      else
        v32 = 4;
      if (v33)
        return v32;
      else
        return 8;
    }
    v24 = (const char *)*((_QWORD *)v22 + 4);
    if (v24)
    {
      v25 = strlen(v24);
      v26 = (v25 + 1);
      v27 = v25 == -1 ? 0 : v16;
      if (v27 == 1)
      {
        if (v26 > a4)
        {
LABEL_41:
          v14 = 14;
LABEL_50:
          si_item_release((unsigned int *)v23);
          return v14;
        }
        bzero(a3, a4);
        memcpy(a3, *((const void **)v23 + 4), v26);
      }
    }
    v28 = (const char *)*((_QWORD *)v23 + 5);
    if (v28)
    {
      v29 = strlen(v28);
      v30 = (v29 + 1);
      v31 = v29 == -1 ? 0 : v18;
      if (v31 == 1)
      {
        if (v30 > a6)
          goto LABEL_41;
        bzero(a5, a6);
        memcpy(a5, *((const void **)v23 + 5), v30);
      }
    }
    v14 = 0;
    goto LABEL_50;
  }
  return v14;
}

_OWORD *si_nameinfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v10;
  int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 *v15;
  _OWORD *v16;
  int v17;
  char v18;
  int v19;
  uint64_t v20;
  unsigned int *v21;
  const char *v22;
  char *v23;
  int v24;
  int v25;
  char *v26;
  uint64_t v27;
  unsigned int *v28;
  const char *v29;
  int v30;
  __int128 *v31;
  int v32;
  socklen_t v33;
  char *v34;
  int v35;
  char *v37;
  char *v38;
  __int128 v39;
  int v40;
  char v41[16];
  char __s1[46];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C874D8];
  v37 = 0;
  v38 = 0;
  if (!a1 || !a2)
    goto LABEL_31;
  v10 = a3;
  if (a5)
    *a5 = 0;
  v43 = 0;
  v44 = 0;
  v40 = 0;
  v39 = 0uLL;
  v12 = *(unsigned __int8 *)(a2 + 1);
  if (v12 == 30)
  {
    v39 = *(_OWORD *)(a2 + 8);
    v14 = *(unsigned __int16 *)(a2 + 2);
    if (v39 == 255)
    {
      v18 = *(_BYTE *)(a2 + 9);
      if ((v18 & 0xF) != 1)
      {
        v13 = 0;
        if ((v18 & 0xF0) == 0x30 || (v18 & 0xF) != 2)
          goto LABEL_22;
      }
    }
    else if (v39 != 254 || (*(_BYTE *)(a2 + 9) & 0xC0) != 0x80)
    {
      v13 = 0;
      goto LABEL_22;
    }
    if (!WORD1(v39))
    {
      v13 = *(_DWORD *)(a2 + 24);
      WORD1(v39) = bswap32(v13) >> 16;
      goto LABEL_22;
    }
    v13 = __rev16(WORD1(v39));
    v19 = *(_DWORD *)(a2 + 24);
    if (v19 == bswap32(WORD1(v39)) >> 16 || !v19)
    {
LABEL_22:
      if (*(_DWORD *)(a2 + 8) || *(_DWORD *)(a2 + 12))
        goto LABEL_24;
      v24 = *(_DWORD *)(a2 + 16);
      if (v24)
      {
        if (v24 == -65536)
        {
          v25 = *(_DWORD *)(a2 + 20);
          goto LABEL_38;
        }
      }
      else
      {
        v25 = *(_DWORD *)(a2 + 20);
        if ((v25 | 0x1000000) != 0x1000000)
        {
LABEL_38:
          v40 = v25;
          v44 = 0;
          LOWORD(v43) = 528;
          WORD1(v43) = v14;
          v15 = (__int128 *)&v40;
          HIDWORD(v43) = v25;
          if ((a3 & 2) != 0)
            goto LABEL_39;
          goto LABEL_26;
        }
      }
LABEL_24:
      v15 = &v39;
      goto LABEL_25;
    }
LABEL_31:
    if (!a5)
      return 0;
    goto LABEL_32;
  }
  if (v12 != 2)
  {
    if (!a5)
      return 0;
    v16 = 0;
    v17 = 105;
LABEL_33:
    *a5 = v17;
    return v16;
  }
  v13 = 0;
  v40 = *(_DWORD *)(a2 + 4);
  v14 = *(unsigned __int16 *)(a2 + 2);
  v15 = (__int128 *)&v40;
LABEL_25:
  if ((a3 & 2) != 0)
  {
LABEL_39:
    v23 = 0;
    goto LABEL_40;
  }
LABEL_26:
  v20 = si_host_byaddr(a1);
  if (!v20)
    goto LABEL_39;
  v21 = (unsigned int *)v20;
  v22 = *(const char **)(v20 + 32);
  if (!v22)
  {
    si_item_release(v21);
    goto LABEL_31;
  }
  v23 = strdup(v22);
  v38 = v23;
  si_item_release(v21);
  if (!v23)
  {
LABEL_46:
    if (a5)
    {
      v16 = 0;
      v17 = 106;
      goto LABEL_33;
    }
    return 0;
  }
LABEL_40:
  v26 = 0;
  if ((v10 & 8) != 0 || !v14)
    goto LABEL_49;
  v27 = si_service_byport(a1);
  if (!v27)
  {
    v26 = 0;
    goto LABEL_49;
  }
  v28 = (unsigned int *)v27;
  v29 = *(const char **)(v27 + 32);
  if (!v29)
  {
    si_item_release(v28);
    free(v23);
    if (!a5)
      return 0;
LABEL_32:
    v16 = 0;
    v17 = 104;
    goto LABEL_33;
  }
  v26 = strdup(v29);
  v37 = v26;
  si_item_release(v28);
  if (!v26)
  {
    free(v23);
    goto LABEL_46;
  }
LABEL_49:
  if ((v10 & 4) == 0 && !v23)
  {
    v30 = *(unsigned __int8 *)(a2 + 1);
    if (v30 == 30)
    {
      if (!v13)
      {
        v31 = &v39;
        v32 = 30;
        v33 = 46;
LABEL_61:
        if (inet_ntop(v32, v31, __s1, v33))
          v38 = strdup(__s1);
        goto LABEL_63;
      }
      WORD1(v39) = 0;
      if (inet_ntop(30, &v39, __s1, 0x2Eu))
      {
        if (!if_indextoname(v13, v41))
        {
          if (a5)
            *a5 = 104;
          free(v26);
          return 0;
        }
        asprintf(&v38, "%s%%%s", __s1, v41);
      }
    }
    else if (v30 == 2)
    {
      v31 = (__int128 *)&v40;
      v32 = 2;
      v33 = 16;
      goto LABEL_61;
    }
  }
LABEL_63:
  if (!v26)
  {
    asprintf(&v37, "%hu", __rev16(v14));
    v26 = v37;
  }
  v34 = v38;
  if (v38 && v26)
  {
    v16 = LI_ils_create("L4488ss", (uint64_t)v15, a3, a4, (uint64_t)a5, a6, a7, a8, a1);
    v34 = v38;
  }
  else
  {
    v16 = 0;
    if (a5)
    {
      if ((v10 & 4) != 0)
        v35 = 108;
      else
        v35 = 106;
      *a5 = v35;
    }
  }
  free(v34);
  free(v37);
  return v16;
}

_OWORD *LI_ils_create(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  unsigned int v18;
  size_t *v19;
  uint64_t v20;
  unsigned int v21;
  const char **v23;
  const char ***v24;
  const char **v25;
  const char *v26;
  uint64_t v27;
  unsigned int v28;
  size_t *v29;
  unsigned int v30;
  size_t *v32;
  unsigned int v33;
  int v35;
  int v36;
  int v37;
  int v38;
  _OWORD *v39;
  uint64_t v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  _OWORD *v44;
  _QWORD *v45;
  char v46;
  unint64_t v47;
  char *v48;
  _OWORD *v49;
  const char **v50;
  size_t v51;
  const char **v52;
  const char *v53;
  int v54;
  unsigned int v56;
  char *v57;
  const char *v58;
  char *v59;
  size_t v60;
  const char **v61;
  const char *v62;
  size_t v63;
  const char **v64;
  size_t v65;
  const char **v66;
  size_t v67;
  const char ***v68;
  const char **v69;
  unint64_t v70;
  int v71;
  char *v73;
  unsigned int v74;
  const char **v75;
  const char *v76;
  size_t v77;
  const char **v78;
  size_t v79;
  const char **v80;
  const char *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  size_t v85;
  const char **v86;
  const char *v87;
  int v88;
  int v89;
  int v90;
  uint64_t v91;
  char *v92;
  char *v93;
  unsigned int v94;
  const char *v95;
  size_t v96;
  const char **v97;
  const char *v98;
  int v99;
  int v100;
  int v101;
  uint64_t v102;
  char *v103;
  unsigned int v104;
  const char *v105;
  size_t v106;
  const char **v107;
  char **v108;
  uint64_t v109;
  int v110;
  size_t v111;
  const void **v112;
  const void *v113;
  char *v114;
  char *v115;
  int v116;
  int v117;
  BOOL v118;
  _OWORD *v120;
  size_t *v121;
  const char **v122;
  _QWORD *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;

  if (!a1)
    return 0;
  v9 = a1;
  v121 = (size_t *)&a9;
  v10 = *a1;
  if (*a1)
  {
    v11 = 0;
    v12 = 0;
    v13 = a1;
    v14 = 8;
    while (1)
    {
      if (v10 > 82)
      {
        if (v10 <= 98)
        {
          switch(v10)
          {
            case 'S':
              v15 = 0;
              LODWORD(v16) = 0;
              v17 = 0;
              ++v121;
              if ((v11 & 3) != 0)
                v18 = 132 - (v11 & 3);
              else
                v18 = 128;
              v12 = 128;
              goto LABEL_103;
            case 'a':
              if ((v11 & 7) != 0)
                v18 = 16 - (v11 & 7);
              else
                v18 = 8;
              if (v12 <= 8)
                v12 = 8;
              v29 = v121++;
              v17 = *v29;
              if (v17)
              {
                v20 = *(_QWORD *)v17;
                if (*(_QWORD *)v17)
                {
                  v20 = 0;
                  v30 = 1;
                  do
                    v20 += 12;
                  while (*(_QWORD *)(v17 + 8 * v30++));
                }
                goto LABEL_88;
              }
              break;
            case 'b':
              if ((v11 & 7) != 0)
                v18 = 16 - (v11 & 7);
              else
                v18 = 8;
              if (v12 <= 8)
                v12 = 8;
              v19 = v121++;
              v17 = *v19;
              if (v17)
              {
                v20 = *(_QWORD *)v17;
                if (*(_QWORD *)v17)
                {
                  v20 = 0;
                  v21 = 1;
                  do
                    v20 += 16;
                  while (*(_QWORD *)(v17 + 8 * v21++));
                }
                goto LABEL_88;
              }
              break;
            default:
              return 0;
          }
LABEL_90:
          v15 = 0;
          LODWORD(v16) = 0;
          goto LABEL_103;
        }
        if (v10 == 99)
        {
          if ((v11 & 7) != 0)
            v18 = 16 - (v11 & 7);
          else
            v18 = 8;
          if (v12 <= 8)
            v12 = 8;
          v32 = v121++;
          v17 = *v32;
          if (v17)
          {
            v20 = *(_QWORD *)v17;
            if (*(_QWORD *)v17)
            {
              v20 = 0;
              v33 = 1;
              do
                v20 += 24;
              while (*(_QWORD *)(v17 + 8 * v33++));
            }
LABEL_88:
            v17 = v20 + 8;
LABEL_89:
            v15 = HIDWORD(v17);
LABEL_99:
            LODWORD(v16) = v17;
            goto LABEL_103;
          }
          goto LABEL_90;
        }
        if (v10 != 109)
        {
          if (v10 != 115)
            return 0;
          if ((v11 & 7) != 0)
            v18 = 16 - (v11 & 7);
          else
            v18 = 8;
          if (v12 <= 8)
            v12 = 8;
          v23 = (const char **)v121++;
          if (!*v23)
          {
            v15 = 0;
            LODWORD(v16) = 0;
            v17 = 0;
            goto LABEL_103;
          }
          v17 = strlen(*v23) + 1;
          goto LABEL_89;
        }
LABEL_42:
        v15 = 0;
        LODWORD(v16) = 0;
        v17 = 0;
        if ((v11 & 3) != 0)
          v18 = 8 - (v11 & 3);
        else
          v18 = 4;
        if (v12 <= 4)
          v12 = 4;
      }
      else
      {
        if (v10 <= 63)
        {
          switch(v10)
          {
            case '1':
              v15 = 0;
              LODWORD(v16) = 0;
              v17 = 0;
              if (v12 <= 1)
                v12 = 1;
              ++v121;
              v18 = 1;
              goto LABEL_103;
            case '2':
              v15 = 0;
              LODWORD(v16) = 0;
              v17 = 0;
              if ((v11 & 1) != 0)
                v18 = 4 - (v11 & 1);
              else
                v18 = 2;
              if (v12 <= 2)
                v12 = 2;
              goto LABEL_64;
            case '3':
            case '5':
            case '6':
            case '7':
              return 0;
            case '4':
              goto LABEL_42;
            case '8':
              goto LABEL_36;
            default:
              if (v10 != 42)
                return 0;
              if ((v11 & 7) != 0)
                v18 = 16 - (v11 & 7);
              else
                v18 = 8;
              if (v12 <= 8)
                v12 = 8;
              v24 = (const char ***)v121++;
              v25 = *v24;
              if (*v24 && (v26 = *v25) != 0)
              {
                v27 = 0;
                v28 = 1;
                do
                {
                  v27 += strlen(v26) + 9;
                  v26 = v25[v28++];
                }
                while (v26);
              }
              else
              {
                v27 = 0;
              }
              v16 = v27 + 8;
              v15 = HIDWORD(v16);
              v17 = v16;
              break;
          }
          goto LABEL_103;
        }
        if (v10 == 64)
        {
          v15 = 0;
          if ((v11 & 3) != 0)
            v35 = 8 - (v11 & 3);
          else
            v35 = 4;
          v36 = ((_BYTE)v35 + (_BYTE)v11) & 7;
          v118 = v36 == 0;
          v17 = *(unsigned int *)v121;
          v121 += 2;
          v37 = 16 - v36;
          if (v118)
            v37 = 8;
          if (v12 <= 8)
            v12 = 8;
          v18 = v37 + v35;
          goto LABEL_99;
        }
        if (v10 != 76)
          return 0;
LABEL_36:
        v15 = 0;
        LODWORD(v16) = 0;
        v17 = 0;
        if ((v11 & 7) != 0)
          v18 = 16 - (v11 & 7);
        else
          v18 = 8;
        if (v12 <= 8)
          v12 = 8;
      }
LABEL_64:
      ++v121;
LABEL_103:
      v14 += v18 + v17;
      v11 += v18;
      v38 = *++v13;
      v10 = v38;
      if (!v38)
        goto LABEL_107;
    }
  }
  v15 = 0;
  LODWORD(v16) = 0;
  v12 = 0;
  v11 = 0;
  v14 = 8;
LABEL_107:
  v40 = 8;
  if (v12 < 8)
    v40 = v12;
  v41 = *((unsigned int *)align_64 + v40);
  if ((_DWORD)v41)
  {
    v42 = v11 % v41;
    if (v42)
      v43 = (v41 - v42);
    else
      v43 = 0;
  }
  else
  {
    v43 = 0;
  }
  v44 = malloc_type_malloc(v14 + v43, 0xAC2DEF0FuLL);
  v39 = v44;
  if (!v44)
  {
    *__error() = 12;
    return v39;
  }
  v45 = (_QWORD *)((char *)v44 + v11 + v43);
  *v45 = 0x434947414D534C49;
  v122 = (const char **)&a9;
  v46 = *v9;
  if (!*v9)
  {
    v47 = 0;
    v49 = v44;
    if ((_DWORD)v41)
      goto LABEL_211;
    return v39;
  }
  v47 = 0;
  v48 = (char *)(v45 + 1);
  v49 = v44;
  v120 = v44;
  do
  {
    if (v46 > 82)
    {
      if (v46 > 98)
      {
        if (v46 != 99)
        {
          if (v46 == 109)
          {
LABEL_146:
            if ((v47 & 3) != 0)
            {
              v65 = 4 - (v47 & 3);
              bzero(v49, v65);
              v49 = (_OWORD *)((char *)v49 + v65);
              v47 += v65;
            }
            v66 = v122++;
            *(_DWORD *)v49 = *(_DWORD *)v66;
            v49 = (_OWORD *)((char *)v49 + 4);
            v47 += 4;
            goto LABEL_206;
          }
          if (v46 != 115)
            goto LABEL_206;
          if ((v47 & 7) != 0)
          {
            v60 = 8 - (v47 & 7);
            bzero(v49, v60);
            v49 = (_OWORD *)((char *)v49 + v60);
            v47 += v60;
          }
          v61 = v122++;
          v62 = *v61;
          if (*v61)
          {
            *(_QWORD *)v49 = v48;
            v16 = strlen(v62) + 1;
            v15 = HIDWORD(v16);
            memcpy(v48, v62, v16);
            v48 += v16;
          }
          else
          {
            *(_QWORD *)v49 = 0;
          }
          goto LABEL_201;
        }
        if ((v47 & 7) != 0)
        {
          v96 = 8 - (v47 & 7);
          bzero(v49, v96);
          v49 = (_OWORD *)((char *)v49 + v96);
          v47 += v96;
        }
        v97 = v122++;
        v98 = *v97;
        if (v98)
        {
          v99 = 0;
          *(_QWORD *)v49 = v48;
          v100 = 1;
          do
          {
            v101 = v100;
            v102 = *(_QWORD *)&v98[8 * v99++];
            ++v100;
          }
          while (v102);
          v92 = &v48[8 * v99];
          if (*(_QWORD *)v98)
          {
            v103 = &v48[8 * v101];
            v104 = 1;
            v105 = v98;
            do
            {
              *(_QWORD *)v48 = v103;
              v48 += 8;
              *(_OWORD *)v92 = *(_OWORD *)*(_QWORD *)v105;
              v92 += 16;
              v105 = &v98[8 * v104];
              v103 += 16;
              ++v104;
            }
            while (*(_QWORD *)v105);
            v16 = 16;
            goto LABEL_191;
          }
          goto LABEL_190;
        }
      }
      else
      {
        if (v46 == 83)
        {
          if ((v47 & 3) != 0)
          {
            v79 = 4 - (v47 & 3);
            bzero(v49, v79);
            v49 = (_OWORD *)((char *)v49 + v79);
            v47 += v79;
          }
          v80 = v122++;
          v81 = *v80;
          v82 = *((_OWORD *)v81 + 4);
          v125 = *((_OWORD *)v81 + 5);
          v126 = *((_OWORD *)v81 + 6);
          v127 = *((_OWORD *)v81 + 7);
          v83 = *(_OWORD *)v81;
          v124 = *((_OWORD *)v81 + 1);
          v84 = *((_OWORD *)v81 + 3);
          v49[2] = *((_OWORD *)v81 + 2);
          v49[3] = v84;
          *v49 = v83;
          v49[1] = v124;
          v49[6] = v126;
          v49[7] = v127;
          v49[4] = v82;
          v49[5] = v125;
          v49 += 8;
          v47 += 128;
          goto LABEL_206;
        }
        if (v46 != 97)
        {
          if (v46 != 98)
            goto LABEL_206;
          if ((v47 & 7) != 0)
          {
            v51 = 8 - (v47 & 7);
            bzero(v49, v51);
            v49 = (_OWORD *)((char *)v49 + v51);
            v47 += v51;
          }
          v52 = v122++;
          v53 = *v52;
          if (v53)
          {
            v54 = 0;
            *(_QWORD *)v49 = v48;
            while (*(_QWORD *)&v53[8 * v54++])
              ;
            if (*(_QWORD *)v53)
            {
              v56 = 1;
              v57 = v48;
              v58 = v53;
              do
              {
                *(_QWORD *)v48 = &v57[8 * v54];
                *(_QWORD *)&v48[8 * v54] = **(_QWORD **)v58;
                v48 += 8;
                v58 = &v53[8 * v56];
                v57 += 8;
                ++v56;
              }
              while (*(_QWORD *)v58);
              v59 = &v48[8 * v54];
              v16 = 8;
            }
            else
            {
              v59 = &v48[8 * v54];
              v16 = v16 | (v15 << 32);
            }
            v115 = v48;
            v15 = HIDWORD(v16);
            v48 = v59;
          }
          else
          {
            v115 = (char *)v49;
          }
          *(_QWORD *)v115 = 0;
          goto LABEL_201;
        }
        if ((v47 & 7) != 0)
        {
          v85 = 8 - (v47 & 7);
          bzero(v49, v85);
          v49 = (_OWORD *)((char *)v49 + v85);
          v47 += v85;
        }
        v86 = v122++;
        v87 = *v86;
        if (v87)
        {
          v88 = 0;
          *(_QWORD *)v49 = v48;
          v89 = 1;
          do
          {
            v90 = v89;
            v91 = *(_QWORD *)&v87[8 * v88++];
            ++v89;
          }
          while (v91);
          v92 = &v48[8 * v88];
          if (*(_QWORD *)v87)
          {
            v93 = &v48[8 * v90];
            v94 = 1;
            v95 = v87;
            do
            {
              *(_QWORD *)v48 = v93;
              v48 += 8;
              *(_DWORD *)v92 = **(_DWORD **)v95;
              v92 += 4;
              v95 = &v87[8 * v94];
              v93 += 4;
              ++v94;
            }
            while (*(_QWORD *)v95);
            v16 = 4;
            goto LABEL_191;
          }
LABEL_190:
          v16 = v16 | (v15 << 32);
LABEL_191:
          v114 = v48;
          v15 = HIDWORD(v16);
          v48 = v92;
          goto LABEL_192;
        }
      }
      v114 = (char *)v49;
LABEL_192:
      *(_QWORD *)v114 = 0;
LABEL_201:
      v49 = (_OWORD *)((char *)v49 + 8);
LABEL_202:
      v47 += 8;
      goto LABEL_206;
    }
    if (v46 <= 63)
    {
      switch(v46)
      {
        case '1':
          v50 = v122++;
          *(_BYTE *)v49 = *(_DWORD *)v50;
          v49 = (_OWORD *)((char *)v49 + 1);
          break;
        case '2':
          if ((v47 & 1) != 0)
          {
            v77 = 2 - (v47 & 1);
            bzero(v49, v77);
            v49 = (_OWORD *)((char *)v49 + v77);
            v47 += v77;
          }
          v78 = v122++;
          *(_WORD *)v49 = *(_DWORD *)v78;
          v49 = (_OWORD *)((char *)v49 + 2);
          v47 += 2;
          break;
        case '3':
        case '5':
        case '6':
        case '7':
          goto LABEL_206;
        case '4':
          goto LABEL_146;
        case '8':
          goto LABEL_143;
        default:
          if (v46 == 42)
          {
            if ((v47 & 7) != 0)
            {
              v67 = 8 - (v47 & 7);
              bzero(v49, v67);
              v49 = (_OWORD *)((char *)v49 + v67);
              v47 += v67;
            }
            v68 = (const char ***)v122++;
            v69 = *v68;
            *(_QWORD *)v49 = v48;
            if (v69)
            {
              v70 = v41;
              v71 = 0;
              while (v69[v71++])
                ;
              v73 = &v48[8 * v71];
              if (*v69)
              {
                v74 = 1;
                v75 = v69;
                do
                {
                  *(_QWORD *)v48 = v73;
                  v48 += 8;
                  v76 = *v75;
                  v16 = strlen(*v75) + 1;
                  memcpy(v73, v76, v16);
                  v73 += v16;
                  v75 = &v69[v74++];
                }
                while (*v75);
              }
              else
              {
                v16 = v16 | (v15 << 32);
              }
              v41 = v70;
            }
            else
            {
              v73 = v48 + 8;
              v16 = v16 | (v15 << 32);
            }
            v15 = HIDWORD(v16);
            *(_QWORD *)v48 = 0;
            v49 = (_OWORD *)((char *)v49 + 8);
            v47 += 8;
            v48 = v73;
            v39 = v120;
          }
          break;
      }
      goto LABEL_206;
    }
    if (v46 != 64)
    {
      if (v46 != 76)
        goto LABEL_206;
LABEL_143:
      if ((v47 & 7) != 0)
      {
        v63 = 8 - (v47 & 7);
        bzero(v49, v63);
        v49 = (_OWORD *)((char *)v49 + v63);
        v47 += v63;
      }
      v64 = v122++;
      *(_QWORD *)v49 = *v64;
      v49 = (_OWORD *)((char *)v49 + 8);
      goto LABEL_202;
    }
    if ((v47 & 3) != 0)
    {
      v106 = 4 - (v47 & 3);
      bzero(v49, v106);
      v49 = (_OWORD *)((char *)v49 + v106);
      v47 += v106;
    }
    v107 = v122;
    v123 = v122 + 1;
    v16 = *(unsigned int *)v107;
    *(_DWORD *)v49 = v16;
    v108 = (char **)((char *)v49 + 4);
    v109 = v47 + 4;
    v110 = (v47 + 4) & 7;
    if (v110)
    {
      v111 = (8 - v110);
      bzero(v108, v111);
      v108 = (char **)((char *)v108 + v111);
      v109 += v111;
    }
    v112 = (const void **)v123;
    v122 = (const char **)(v123 + 1);
    v113 = *v112;
    if (*v112)
    {
      *v108 = v48;
      memcpy(v48, v113, v16);
      v48 += v16;
    }
    else
    {
      *v108 = 0;
    }
    v15 = 0;
    v49 = v108 + 1;
    v47 = v109 + 8;
LABEL_206:
    v116 = *++v9;
    v46 = v116;
  }
  while (v116);
  if (!(_DWORD)v41)
    return v39;
LABEL_211:
  v117 = v47 % v41;
  if (v117)
    v118 = (_DWORD)v41 == v117;
  else
    v118 = 1;
  if (!v118)
    bzero(v49, (v41 - v117));
  return v39;
}

FILE *_fsi_get_service(uint64_t a1, const char *a2, char *a3, unsigned int a4, int a5)
{
  FILE *result;
  FILE *v10;
  char *line;
  char *v12;
  char *v13;
  char *v14;
  const char **v15;
  int v16;
  const char **v17;
  uint64_t v18;
  char *v19;
  int v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char **v29;
  int v30;
  const char *v31;
  unsigned int *v32;
  _BYTE v33[12];
  char *__s1;
  uint64_t v36;
  uint64_t v37;
  __darwin_time_t v38;
  int v39[3];

  if (!a2 && a5 == 1 || !a4 && a5 == 2)
    return 0;
  result = fopen("/etc/services", "r");
  if (result)
  {
    v10 = result;
    __s1 = a3;
    v37 = 0;
    v38 = 0;
    _fsi_get_validation(a1, 7u, "/etc/services", result, &v38, &v37);
    line = (char *)_fsi_get_line();
    if (!line)
    {
      *(_QWORD *)&v33[4] = 0;
      goto LABEL_38;
    }
    v12 = line;
    *(_DWORD *)&v33[8] = 0;
    *(_QWORD *)v33 = bswap32(a4) >> 16;
    while (1)
    {
      if (*v12 == 35)
        goto LABEL_30;
      v13 = strchr(v12, 35);
      if (v13)
        *v13 = 0;
      v39[0] = 0;
      v14 = (char *)_fsi_tokenize(v12, " \t", 0, v39);
      v15 = (const char **)v14;
      v16 = v39[0];
      if (v39[0] <= 1)
        break;
      v17 = (const char **)(v14 + 16);
      v18 = v39[0] == 2 ? 0 : (uint64_t)(v14 + 16);
      v36 = v18;
      v19 = (char *)*((_QWORD *)v14 + 1);
      v20 = atoi(v19);
      v21 = strchr(v19, 47);
      if (!v21)
        break;
      *v21 = 0;
      if (__s1)
      {
        if (strcmp(__s1, v21 + 1))
          break;
      }
      if (a5)
      {
        if (a5 == 1)
        {
          if (strcmp(a2, *v15))
          {
            if (v16 == 2)
              break;
            v22 = *v17;
            if (!*v17)
              break;
            v29 = (const char **)(v36 + 8);
            do
            {
              v30 = strcmp(a2, v22);
              if (!v30)
                break;
              v31 = *v29++;
              v22 = v31;
            }
            while (v31);
            if (v30)
              break;
          }
        }
        else if (v20 != *(_DWORD *)v33)
        {
          break;
        }
      }
      v32 = (unsigned int *)LI_ils_create("L4488s*4s", (uint64_t)v22, v23, v24, v25, v26, v27, v28, a1);
      free(v15);
      free(v12);
      if (v32)
      {
        if (a5)
        {
          *(_QWORD *)&v33[4] = v32;
LABEL_38:
          fclose(v10);
          return *(FILE **)&v33[4];
        }
        *(_QWORD *)&v33[4] = si_list_add(*(void ***)&v33[4], (uint64_t)v32);
        si_item_release(v32);
      }
LABEL_31:
      v12 = (char *)_fsi_get_line();
      if (!v12)
        goto LABEL_38;
    }
    free(v15);
LABEL_30:
    free(v12);
    goto LABEL_31;
  }
  return result;
}

void *_fsi_get_line()
{
  FILE *v0;
  void *v1;
  size_t v2;
  void *v3;
  char __s[4096];
  uint64_t v6;

  v0 = (FILE *)MEMORY[0x1E0C86820]();
  v6 = *MEMORY[0x1E0C874D8];
  __s[0] = 0;
  v1 = 0;
  if (fgets(__s, 4096, v0) && __s[0])
  {
    if (__s[0] != 35)
      __s[strlen(__s) - 1] = 0;
    v2 = (int)(strlen(__s) + 1);
    v3 = malloc_type_malloc(v2, 0xB36E95uLL);
    v1 = v3;
    if (v3)
      memmove(v3, __s, v2);
  }
  return v1;
}

unsigned int *cache_fetch_item(uint64_t a1, unsigned int a2, char *a3, int a4, int a5)
{
  unsigned int *v5;
  uint64_t v6;
  pthread_mutex_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = 0;
  if (a1 && gL1CacheEnabled)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v11 = (pthread_mutex_t *)(v6 + 240 * a2);
      pthread_mutex_lock(v11);
      for (i = 72; i != 232; i += 8)
      {
        v5 = *(unsigned int **)((char *)&v11->__sig + i);
        if (v5)
        {
          if (si_item_is_valid(*(uint64_t **)((char *)&v11->__sig + i)))
          {
            v15 = si_item_retain((uint64_t)v5, v13, v14);
            v5 = (unsigned int *)v15;
            if (v15 && si_item_match(v15, a2, a3, a4, a5))
              goto LABEL_13;
          }
          else
          {
            si_item_release(v5);
            v5 = 0;
            *(uint64_t *)((char *)&v11->__sig + i) = 0;
          }
        }
        si_item_release(v5);
      }
      v5 = 0;
LABEL_13:
      pthread_mutex_unlock(v11);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

uint64_t si_item_retain(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int *v3;
  unsigned int v4;

  if (result)
  {
    v3 = (unsigned int *)(result + 12);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    if ((v4 & 0x80000000) != 0)
      si_list_add_cold_1(result, a2, a3);
  }
  return result;
}

BOOL si_item_match(_BOOL8 result, int a2, char *__s1, int a4, int a5)
{
  uint64_t v7;
  const char **v8;
  const char *v9;
  const char **v10;
  const char *v11;
  const char *v12;
  const char **v13;
  const char *v14;
  const char **v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char **v19;
  const char *v20;
  const char **v21;
  const char *v22;
  const char **v23;
  const char *v24;
  const char **v25;
  const char *v26;
  int v27;
  const char **v28;
  const char *v29;
  const char **v30;
  const char *v31;

  if (result)
  {
    if (a5)
    {
      v7 = result;
      if (!__s1 && a5 == 1)
        return 0;
      result = 0;
      switch(a2)
      {
        case 1:
        case 2:
          if (a5 == 1)
            goto LABEL_21;
          goto LABEL_52;
        case 3:
        case 5:
          if (a5 != 1)
            return 0;
          goto LABEL_21;
        case 6:
        case 7:
          if (*(_DWORD *)(v7 + 48) != a4)
            return 0;
          if (a5 == 1)
          {
            if (!strcmp(__s1, *(const char **)(v7 + 32)))
              return 1;
            v8 = *(const char ***)(v7 + 40);
            if (v8)
            {
              v9 = *v8;
              if (*v8)
              {
                v10 = v8 + 1;
                do
                {
                  if (!strcmp(__s1, v9))
                    return 1;
                  v11 = *v10++;
                  v9 = v11;
                }
                while (v11);
              }
            }
            return 0;
          }
          return a5 == 2 && !memcmp(__s1, **(const void ***)(v7 + 56), *(int *)(v7 + 52));
        case 8:
          if (a5 == 1)
          {
            if (!strcmp(__s1, *(const char **)(v7 + 32)))
              return 1;
            v13 = *(const char ***)(v7 + 40);
            if (v13)
            {
              v14 = *v13;
              if (*v13)
              {
                v15 = v13 + 1;
                do
                {
                  if (!strcmp(__s1, v14))
                    return 1;
                  v16 = *v15++;
                  v14 = v16;
                }
                while (v16);
              }
            }
            return 0;
          }
          if (a5 != 2)
            return 0;
          v27 = *(_DWORD *)(v7 + 52);
          goto LABEL_54;
        case 9:
          if (a5 == 1)
          {
            if (a4 == 2)
            {
              v17 = *(const char **)(v7 + 56);
              v18 = "tcp";
            }
            else
            {
              if (a4 != 1)
                goto LABEL_70;
              v17 = *(const char **)(v7 + 56);
              v18 = "udp";
            }
            if (strcmp(v18, v17))
              return 0;
LABEL_70:
            if (!strcmp(__s1, *(const char **)(v7 + 32)))
              return 1;
            v28 = *(const char ***)(v7 + 40);
            if (v28)
            {
              v29 = *v28;
              if (*v28)
              {
                v30 = v28 + 1;
                do
                {
                  if (!strcmp(__s1, v29))
                    return 1;
                  v31 = *v30++;
                  v29 = v31;
                }
                while (v31);
              }
            }
            return 0;
          }
          if (a5 != 2 || __s1 && strcmp(__s1, *(const char **)(v7 + 56)))
            return 0;
LABEL_53:
          v27 = *(_DWORD *)(v7 + 48);
LABEL_54:
          if (v27 != a4)
            return 0;
          break;
        case 10:
          if (a5 != 1)
            goto LABEL_52;
          if (!strcmp(__s1, *(const char **)(v7 + 32)))
            return 1;
          v19 = *(const char ***)(v7 + 40);
          if (!v19)
            return 0;
          v20 = *v19;
          if (!*v19)
            return 0;
          v21 = v19 + 1;
          while (strcmp(__s1, v20))
          {
            v22 = *v21++;
            v20 = v22;
            if (!v22)
              return 0;
          }
          return 1;
        case 11:
          if (a5 == 1)
          {
            if (!strcmp(__s1, *(const char **)(v7 + 32)))
              return 1;
            v23 = *(const char ***)(v7 + 40);
            if (v23)
            {
              v24 = *v23;
              if (*v23)
              {
                v25 = v23 + 1;
                do
                {
                  if (!strcmp(__s1, v24))
                    return 1;
                  v26 = *v25++;
                  v24 = v26;
                }
                while (v26);
              }
            }
            return 0;
          }
LABEL_52:
          if (a5 != 2)
            return 0;
          goto LABEL_53;
        case 12:
        case 13:
          if (a5 == 1)
          {
LABEL_21:
            v12 = *(const char **)(v7 + 32);
          }
          else
          {
            if (a5 != 2)
              return 0;
            v12 = *(const char **)(v7 + 40);
          }
          return !strcmp(__s1, v12);
        default:
          return result;
      }
    }
    return 1;
  }
  return result;
}

uint64_t si_item_is_valid(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(void);

  if (a1 && (v1 = *a1) != 0 && (v2 = *(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 8)) != 0)
    return v2();
  else
    return 0;
}

const char *file_is_valid(const char **a1, const char ***a2)
{
  const char *result;
  const char **v4;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = *a1;
      if (*a1)
      {
        v4 = *a2;
        if (*a2 && *v4)
          return (const char *)(strcmp(result, *v4) == 0);
        else
          return 0;
      }
    }
  }
  return result;
}

passwd *__cdecl getpwnam(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_user_byname((uint64_t)v1);
  LI_set_thread_item(101, v2);
  if (v2)
    return (passwd *)(v2 + 32);
  else
    return 0;
}

uint64_t search_user_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  int v8;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v8 = 0;
      while (1)
      {
        module = search_get_module(v1, 1u, &v8);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_user_byname(module);
        if (v4)
        {
          v5 = v4;
          if ((*(_BYTE *)(v1 + 24 * (*(_DWORD *)(v1 + 40) != 0) + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          else
            v6 = 0;
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t search_get_module(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v10;

  if (!a3)
    return 0;
  v3 = (*a3)++;
  v4 = *(_DWORD *)(a1 + 24 * a2 + 16);
  if (v4)
    v5 = v3 >= v4;
  else
    v5 = 1;
  if (v5)
  {
    if (v3 < *(_DWORD *)(a1 + 16))
    {
      v6 = 8 * (int)v3;
      v7 = (char *)(*(_QWORD *)(a1 + 8) + 4 * (int)v3);
      while (1)
      {
        v8 = *v7;
        v7 += 4;
        if ((v8 & 1) == 0)
          break;
        *a3 = v3 + 2;
        v6 += 8;
        if (*(_DWORD *)(a1 + 16) <= ++v3)
          return 0;
      }
      v10 = *(_QWORD *)a1 + v6;
      return *(_QWORD *)v10;
    }
    return 0;
  }
  v10 = *(_QWORD *)(a1 + 24 * a2) + 8 * (int)v3;
  return *(_QWORD *)v10;
}

const char *si_cache_add_item(const char *result, const char **a2, uint64_t a3)
{
  const char *v3;
  unsigned int v6;
  uint64_t v7;
  pthread_mutex_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  if (result != (const char *)a2)
  {
    v3 = result;
    if (result)
    {
      if (a2)
      {
        if (a3)
        {
          result = *a2;
          if (*a2)
          {
            result = (const char *)strcmp(result, *(const char **)v3);
            if ((_DWORD)result)
            {
              result = (const char *)si_module_allows_caching((_BOOL8)a2);
              if ((_DWORD)result)
              {
                v6 = *(_DWORD *)(a3 + 8);
                if (v6 <= 0x11)
                {
                  v7 = *((_QWORD *)v3 + 4);
                  if (v7)
                  {
                    v8 = (pthread_mutex_t *)(v7 + 240 * v6);
                    pthread_mutex_lock(v8);
                    v9 = v7 + 240 * *(unsigned int *)(a3 + 8);
                    v10 = *(int *)(v9 + 64);
                    si_item_release(*(unsigned int **)(v9 + 8 * v10 + 72));
                    v13 = si_item_retain(a3, v11, v12);
                    v14 = v7 + 240 * *(unsigned int *)(a3 + 8);
                    *(_QWORD *)(v14 + 8 * v10 + 72) = v13;
                    if ((int)v10 <= 18)
                      v15 = v10 + 1;
                    else
                      v15 = 0;
                    *(_DWORD *)(v14 + 64) = v15;
                    return (const char *)pthread_mutex_unlock(v8);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned int *cache_user_byuid(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 1u, 0, a2, 2);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  int v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  const char *v7;
  const char **v8;
  _QWORD *v9;

  v2 = _os_feature_enabled_simple_impl();
  if (a1 > 0x1F3 || !v2)
  {
LABEL_14:
    v9 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v9 = si_module_with_name("search");
      si_search_search = (uint64_t)v9;
    }
    v4 = si_user_byuid((uint64_t)v9);
    goto LABEL_17;
  }
  v3 = (_QWORD *)si_search_cache_file_search;
  if (!si_search_cache_file_search)
  {
    v3 = si_module_with_name("cache_file");
    si_search_cache_file_search = (uint64_t)v3;
  }
  v4 = si_user_byuid((uint64_t)v3);
  if (!v4)
  {
    v5 = (_QWORD *)si_search_file_search;
    if (!si_search_file_search)
    {
      v5 = si_module_with_name("file");
      si_search_file_search = (uint64_t)v5;
    }
    v6 = si_user_byuid((uint64_t)v5);
    if (v6)
    {
      v4 = v6;
      v7 = (const char *)si_search_cache_file_search;
      if (!si_search_cache_file_search)
      {
        v7 = (const char *)si_module_with_name("cache_file");
        si_search_cache_file_search = (uint64_t)v7;
      }
      v8 = (const char **)si_search_file_search;
      if (!si_search_file_search)
      {
        v8 = (const char **)si_module_with_name("file");
        si_search_file_search = (uint64_t)v8;
      }
      si_cache_add_item(v7, v8, v4);
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_17:
  LI_set_thread_item(201, v4);
  if (v4)
    return (passwd *)(v4 + 32);
  else
    return 0;
}

uint64_t si_user_byuid(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 24)) != 0)
    return v1();
  else
    return 0;
}

void LI_set_thread_item(int a1, uint64_t a2)
{
  unsigned int *thread_info;
  unsigned int *v4;

  thread_info = LI_get_thread_info(a1);
  if (thread_info)
  {
    v4 = thread_info;
    si_item_release(*(unsigned int **)thread_info);
    *(_QWORD *)v4 = a2;
  }
}

void si_item_release(unsigned int *a1)
{
  unsigned int *v1;
  int v2;

  if (a1)
  {
    v1 = a1 + 3;
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 - 1, v1));
    if (v2 <= 0)
      si_item_release_cold_1();
    if (v2 == 1)
      free(a1);
  }
}

unsigned int *LI_get_thread_info(int a1)
{
  unsigned int *v2;
  unsigned int *result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  pthread_once(&_info_key_initialized, (void (*)(void))_LI_data_init);
  if (_info_key_ok != 1)
    return 0;
  v2 = (unsigned int *)pthread_getspecific(_info_key);
  if (!v2)
  {
    result = (unsigned int *)malloc_type_calloc(1uLL, 0x18uLL, 0x1090040D449AA06uLL);
    if (!result)
      return result;
    v2 = result;
    pthread_setspecific(_info_key, result);
  }
  v4 = *v2;
  if ((_DWORD)v4)
  {
    v5 = 0;
    while (*(_DWORD *)(*((_QWORD *)v2 + 1) + 4 * v5) != a1)
    {
      if (v4 == ++v5)
      {
        *((_QWORD *)v2 + 1) = reallocf(*((void **)v2 + 1), 4 * (v4 + 1));
        v6 = reallocf(*((void **)v2 + 2), 8 * (v4 + 1));
        goto LABEL_12;
      }
    }
    return *(unsigned int **)(*((_QWORD *)v2 + 2) + 8 * v5);
  }
  else
  {
    *((_QWORD *)v2 + 1) = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    v6 = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
LABEL_12:
    *((_QWORD *)v2 + 2) = v6;
    if (*((_QWORD *)v2 + 1))
    {
      if (v6)
      {
        result = (unsigned int *)malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
        if (result)
        {
          v7 = *((_QWORD *)v2 + 2);
          *(_DWORD *)(*((_QWORD *)v2 + 1) + 4 * v4) = a1;
          *(_QWORD *)(v7 + 8 * v4) = result;
          ++*v2;
        }
        return result;
      }
      free(*((void **)v2 + 1));
      v6 = (void *)*((_QWORD *)v2 + 2);
    }
    *((_QWORD *)v2 + 1) = 0;
    if (v6)
      free(v6);
    result = 0;
    *((_QWORD *)v2 + 2) = 0;
  }
  return result;
}

uint64_t search_user_byuid(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  int v8;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v8 = 0;
      while (1)
      {
        module = search_get_module(v1, 1u, &v8);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_user_byuid(module);
        if (v4)
        {
          v5 = v4;
          if ((*(_BYTE *)(v1 + 24 * (*(_DWORD *)(v1 + 40) != 0) + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          else
            v6 = 0;
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t si_user_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16)) != 0)
    return v1();
  else
    return 0;
}

unsigned int *cache_user_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 1u, a2, 0, 1);
}

_OWORD *file_grouplist(uint64_t a1, const char *a2)
{
  unsigned int *v4;
  FILE *v5;
  FILE *v6;
  _BYTE *line;
  _BYTE *v8;
  void *v9;
  uint64_t v10;
  _BYTE **v11;
  const char **v12;
  const char **v13;
  unint64_t v14;
  const char **v15;
  unint64_t v16;
  _BOOL4 v18;
  void *v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  int v30;
  const char **v31;
  uint64_t v32;
  __darwin_time_t v33;
  int v34;

  if (!a2)
    return 0;
  v4 = (unsigned int *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v4)
    si_item_release(v4);
  v5 = fopen("/etc/group", "r");
  if (!v5)
    return 0;
  v6 = v5;
  v34 = 0;
  v33 = 0;
  v32 = 0;
  _fsi_get_validation(a1, 2u, "/etc/group", v5, &v33, &v32);
  line = _fsi_get_line();
  if (!line)
  {
    fclose(v6);
    v9 = 0;
    goto LABEL_30;
  }
  v8 = line;
  v9 = 0;
  v10 = 0;
  do
  {
    if (*v8 == 35)
    {
      v11 = (_BYTE **)v8;
LABEL_10:
      free(v11);
      goto LABEL_11;
    }
    v34 = 0;
    v11 = (_BYTE **)_fsi_tokenize(v8, ":", 1, &v34);
    v12 = (const char **)v11;
    if (v34 != 4)
      goto LABEL_10;
    v34 = 0;
    v13 = (const char **)_fsi_tokenize(v11[3], ",", 1, &v34);
    v14 = v34;
    v31 = v13;
    if (v34 < 1)
    {
      v18 = 0;
      v30 = -2;
    }
    else
    {
      v15 = v13;
      if (!strcmp(a2, *v13))
      {
        v18 = 1;
LABEL_21:
        v30 = atoi(v12[2]);
      }
      else
      {
        v29 = v10;
        v16 = 0;
        while (v14 - 1 != v16)
        {
          if (!strcmp(a2, v15[++v16]))
          {
            v18 = v16 < v14;
            v10 = v29;
            goto LABEL_21;
          }
        }
        v18 = 0;
        v30 = -2;
        v10 = v29;
      }
    }
    free(v12);
    free(v31);
    free(v8);
    if (v18)
    {
      v19 = reallocf(v9, 4 * ((int)v10 + 1));
      v9 = v19;
      if (!v19)
      {
        fclose(v6);
        goto LABEL_30;
      }
      *((_DWORD *)v19 + (int)v10) = v30;
      v10 = (v10 + 1);
    }
LABEL_11:
    v8 = _fsi_get_line();
  }
  while (v8);
  fclose(v6);
  if ((_DWORD)v10)
  {
    v20 = LI_ils_create("L4488s4@", v21, v22, v23, v24, v25, v26, v27, a1);
    goto LABEL_31;
  }
LABEL_30:
  v20 = 0;
LABEL_31:
  free(v9);
  return v20;
}

void *_fsi_tokenize(_BYTE *a1, char *__s, int a3, _DWORD *a4)
{
  int v8;
  uint64_t v9;
  void *appended;
  uint64_t v11;
  _BYTE *i;
  int v13;
  uint64_t v14;
  _BYTE *v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  if (!a1)
    return 0;
  if (a4)
    *a4 = 0;
  if (!__s)
  {
    v26 = reallocf(0, 0x10uLL);
    appended = v26;
    if (v26)
    {
      *v26 = a1;
      v26[1] = 0;
    }
    goto LABEL_38;
  }
  if (!*a1)
    return 0;
  v8 = strlen(__s);
  v9 = 0;
  appended = 0;
  while (1)
  {
    v11 = v9 << 32;
    for (i = &a1[(int)v9]; ; ++i)
    {
      v13 = *i;
      if ((v13 - 9) >= 2 && v13 != 32)
        break;
      LODWORD(v9) = v9 + 1;
      v11 += 0x100000000;
    }
    if (!*i)
      break;
    v14 = v11 >> 32;
    v15 = &a1[v11 >> 32];
    v16 = *v15;
    if (*v15)
    {
      v17 = v9;
      v18 = v9;
      while (1)
      {
        v19 = v8;
        v20 = __s;
        if (v8 >= 1)
          break;
LABEL_17:
        if (v16 > 0x20 || ((1 << v16) & 0x100000600) == 0)
          v18 = v17;
        v14 = ++v17;
        v15 = &a1[v14];
        v16 = a1[v14];
        if (!a1[v14])
        {
          v22 = 0;
          goto LABEL_24;
        }
      }
      while (1)
      {
        v21 = *v20++;
        if (v16 == v21)
          break;
        if (!--v19)
          goto LABEL_17;
      }
      v16 = *v15;
      v22 = 1;
    }
    else
    {
      v22 = 0;
      v18 = v9;
      v17 = v9;
    }
LABEL_24:
    v23 = v16 != 0;
    v24 = v18 + 1;
    if (v17 == (_DWORD)v9)
      v25 = v14;
    else
      v25 = v24;
    a1[v25] = 0;
    appended = _fsi_append_string((uint64_t)i, appended);
    if (a4)
      ++*a4;
    v9 = (v17 + v23);
    if (!a1[(int)v9])
      goto LABEL_33;
  }
  v22 = 1;
LABEL_33:
  if (a3 && v22)
  {
    appended = _fsi_append_string((uint64_t)&a1[(int)v9], appended);
LABEL_38:
    if (a4)
      ++*a4;
  }
  return appended;
}

void *_fsi_append_string(uint64_t a1, void *__ptr)
{
  void *v2;
  unsigned int v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v2 = __ptr;
  if (a1)
  {
    if (__ptr)
    {
      v4 = -1;
      v5 = (uint64_t *)__ptr;
      do
      {
        v6 = *v5++;
        ++v4;
      }
      while (v6);
    }
    else
    {
      v4 = 0;
    }
    v7 = reallocf(__ptr, 8 * (v4 + 2));
    v2 = v7;
    if (v7)
    {
      *((_QWORD *)v7 + v4) = a1;
      *((_QWORD *)v7 + v4 + 1) = 0;
    }
  }
  return v2;
}

void _fsi_get_validation(uint64_t a1, unsigned int a2, const char *a3, FILE *a4, __darwin_time_t *a5, uint64_t *a6)
{
  _DWORD *v9;
  _DWORD *v10;
  int *v11;
  int v12;
  int v13;
  uint64_t tv_nsec;
  const char *v15;
  stat v16;

  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a1)
  {
    if (a3)
    {
      if (gL1CacheEnabled)
      {
        v9 = *(_DWORD **)(a1 + 32);
        if (v9)
        {
          if (((*v9 >> a2) & 1) != 0)
          {
            v10 = &v9[a2];
            v12 = v10[1];
            v11 = v10 + 1;
            if (v12 < 0)
            {
              *(_QWORD *)&v16.st_dev = 0;
              asprintf((char **)&v16, "com.apple.system.info:%s", a3);
              if (!*(_QWORD *)&v16.st_dev)
                return;
              notify_register_check(*(const char **)&v16.st_dev, v11);
              free(*(void **)&v16.st_dev);
              if (!a5)
                goto LABEL_20;
            }
            else if (!a5)
            {
LABEL_20:
              if (!a6)
                return;
              tv_nsec = a2;
              goto LABEL_30;
            }
            if (!notify_peek())
              *a5 = bswap32(0);
            goto LABEL_20;
          }
          memset(&v16, 0, sizeof(v16));
          if (a4)
          {
            v13 = fileno(a4);
            if (fstat(v13, &v16))
              return;
          }
          else
          {
            if (a2 > 0xA)
              v15 = "/etc/ethers";
            else
              v15 = off_1E2E56D08[a2];
            if (stat(v15, &v16))
              return;
          }
          if (a5)
            *a5 = v16.st_mtimespec.tv_sec;
          if (a6)
          {
            tv_nsec = v16.st_mtimespec.tv_nsec;
LABEL_30:
            *a6 = tv_nsec;
          }
        }
      }
    }
  }
}

BOOL si_module_allows_caching(_BOOL8 result)
{
  if (result)
    return *(_QWORD *)(*(_QWORD *)(result + 40) + 8) != 0;
  return result;
}

void **_fsi_get_user(uint64_t a1, const char *a2, int a3, int a4)
{
  const char *v8;
  FILE *v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE *line;
  _BYTE *v13;
  int v14;
  const char **v15;
  const char **v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  void **v27;
  int v28;
  uid_t v29;
  uint64_t v30;
  __darwin_time_t v31;
  _DWORD v32[3];

  if (!a2 && a4 == 1)
    return 0;
  v30 = 0;
  v31 = 0;
  v29 = geteuid();
  if (v29)
  {
    v8 = "/etc/passwd";
    v9 = fopen("/etc/passwd", "r");
    v10 = a1;
    v11 = 0;
  }
  else
  {
    v8 = "/etc/master.passwd";
    v9 = fopen("/etc/master.passwd", "r");
    v10 = a1;
    v11 = 1;
  }
  _fsi_get_validation(v10, v11, v8, v9, &v31, &v30);
  if (!v9)
    return 0;
  line = _fsi_get_line();
  if (!line)
  {
    v27 = 0;
    goto LABEL_30;
  }
  v13 = line;
  v27 = 0;
  if (v29)
    v14 = 7;
  else
    v14 = 10;
  v28 = v14;
  while (*v13 == 35)
  {
LABEL_19:
    free(v13);
LABEL_20:
    v13 = _fsi_get_line();
    if (!v13)
      goto LABEL_30;
  }
  v32[0] = 0;
  v15 = (const char **)_fsi_tokenize(v13, ":", 1, v32);
  v16 = v15;
  if (v32[0] != v14)
    goto LABEL_18;
  v17 = atoi(v15[2]);
  if (!a4)
    goto LABEL_23;
  if (a4 == 2)
  {
    if (v17 == a3)
      goto LABEL_23;
    goto LABEL_18;
  }
  if (a4 != 1 || strcmp(a2, *v16))
  {
LABEL_18:
    free(v16);
    goto LABEL_19;
  }
LABEL_23:
  if (!v29)
  {
    atoi(v16[5]);
    atoi(v16[6]);
  }
  atoi(v16[3]);
  v25 = (unsigned int *)LI_ils_create("L4488ss44LssssL", v18, v19, v20, v21, v22, v23, v24, a1);
  free(v16);
  free(v13);
  v14 = v28;
  if (!v25)
    goto LABEL_20;
  if (!a4)
  {
    v27 = si_list_add(v27, (uint64_t)v25);
    si_item_release(v25);
    goto LABEL_20;
  }
  v27 = (void **)v25;
LABEL_30:
  fclose(v9);
  return v27;
}

void **file_user_byuid(uint64_t a1, int a2)
{
  return _fsi_get_user(a1, 0, a2, 2);
}

_OWORD *muser_user_byuid(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD *user;

  if (a2 < 0x1F5)
    return 0;
  if (!_muser_available())
    return 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "uid");
  xpc_dictionary_set_int64(v5, "query", a2);
  v6 = (void *)_muser_call("getpwuid", v5);
  if (v6)
  {
    v7 = v6;
    user = _muser_extract_user(a1, v6);
    xpc_release(v7);
  }
  else
  {
    user = 0;
  }
  xpc_release(v5);
  return user;
}

uint64_t getgrouplist_internal(uint64_t a1, int a2, int *a3, int *a4)
{
  uint64_t result;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int *v17;
  int v18;

  result = 0;
  if (a1 && a3 && a4)
  {
    v8 = *a4;
    *a4 = 0;
    if (v8 >= 1)
    {
      *a3 = a2;
      *a4 = 1;
      v9 = (_QWORD *)si_search_search;
      if (!si_search_search)
      {
        v9 = si_module_with_name("search");
        si_search_search = (uint64_t)v9;
      }
      v10 = si_grouplist((uint64_t)v9);
      LI_set_thread_item(3, v10);
      if (v10)
      {
        v11 = *(_DWORD *)(v10 + 40);
        if (v11 >= 1)
        {
          v12 = 0;
          v13 = *(_QWORD *)(v10 + 48);
          v14 = 1;
          do
          {
            v15 = *(_DWORD *)(v13 + 4 * v12);
            if (v14 < 1)
            {
LABEL_14:
              if (v14 >= v8)
                return 0xFFFFFFFFLL;
              a3[v14++] = v15;
              *a4 = v14;
              v11 = *(_DWORD *)(v10 + 40);
            }
            else
            {
              v16 = v14;
              v17 = a3;
              while (1)
              {
                v18 = *v17++;
                if (v18 == v15)
                  break;
                if (!--v16)
                  goto LABEL_14;
              }
            }
            ++v12;
          }
          while (v12 < v11);
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t si_grouplist(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 80)) != 0)
    return v1();
  else
    return 0;
}

uint64_t search_groupist(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  int v8;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 32);
    if (v4)
    {
      v8 = 0;
      while (1)
      {
        result = search_get_module(v4, 3u, &v8);
        if (!result)
          break;
        if (result != *(_QWORD *)(v4 + 432))
        {
          v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 40) + 80);
          if (v7)
          {
            result = v7(v3, a2, a3);
            if (result)
              break;
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_OWORD *muser_grouplist(uint64_t a1, const char *a2)
{
  xpc_object_t v4;
  void *v5;
  void *v6;
  void *v7;
  xpc_object_t value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _OWORD *v17;
  size_t count;
  void *v20;
  void *v21;
  _QWORD applier[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  if (*a2 == 95)
    return 0;
  if (!_muser_available())
    return 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "grouplist");
  xpc_dictionary_set_string(v5, "query", a2);
  v6 = (void *)_muser_call("getgrouplist", v5);
  if (v6)
  {
    v7 = v6;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2000000000;
    v26 = 0;
    value = xpc_dictionary_get_value(v6, "grouplist");
    if (value)
    {
      v16 = value;
      if (MEMORY[0x194021CE8]() == MEMORY[0x1E0C88FC0])
      {
        count = xpc_array_get_count(v16);
        v20 = malloc_type_calloc(count + 1, 4uLL, 0x100004052888210uLL);
        v24[3] = (uint64_t)v20;
        applier[0] = MEMORY[0x1E0C87450];
        applier[1] = 0x40000000;
        applier[2] = ___muser_extract_grouplist_block_invoke;
        applier[3] = &unk_1E2E57248;
        applier[4] = &v23;
        xpc_array_apply(v16, applier);
      }
    }
    if (v24[3])
    {
      v17 = LI_ils_create("L4488s4@", v9, v10, v11, v12, v13, v14, v15, a1);
      v21 = (void *)v24[3];
    }
    else
    {
      v21 = 0;
      v17 = 0;
    }
    free(v21);
    _Block_object_dispose(&v23, 8);
    xpc_release(v7);
  }
  else
  {
    v17 = 0;
  }
  xpc_release(v5);
  return v17;
}

BOOL _muser_available()
{
  xpc_object_t v0;

  v0 = _muser_xpc_pipe(0);
  if (v0)
    xpc_release(v0);
  return _si_muser_disabled == 0;
}

xpc_object_t _muser_xpc_pipe(int a1)
{
  xpc_object_t v2;
  uint64_t v3;
  xpc_object_t v4;
  int v5;
  int v6;

  if (_muser_xpc_pipe_once != -1)
    dispatch_once(&_muser_xpc_pipe_once, &__block_literal_global_7);
  if (_si_muser_disabled != 1)
  {
    pthread_mutex_lock(&mutex);
    v2 = (xpc_object_t)__muser_pipe;
    if (a1)
    {
      xpc_release((xpc_object_t)__muser_pipe);
      __muser_pipe = 0;
    }
    else if (__muser_pipe)
    {
LABEL_18:
      v2 = xpc_retain(v2);
LABEL_19:
      pthread_mutex_unlock(&mutex);
      return v2;
    }
    if (xpc_user_sessions_enabled())
    {
      xpc_user_sessions_get_foreground_uid();
      v3 = xpc_pipe_create_with_user_session_uid();
    }
    else
    {
      v3 = xpc_pipe_create();
    }
    v2 = (xpc_object_t)v3;
    __muser_pipe = v3;
    if (!_si_muser_disabled)
    {
      if (v3
        && (v4 = xpc_dictionary_create(0, 0, 0),
            xpc_dictionary_set_string(v4, "reqtype", "available"),
            xpc_dictionary_set_int64(v4, "version", 1),
            v5 = xpc_pipe_routine(),
            xpc_release(v4),
            !v5))
      {
        v6 = xpc_dictionary_get_BOOL(0, "available");
        xpc_release(0);
      }
      else
      {
        v6 = xpc_user_sessions_enabled();
      }
      _si_muser_disabled = v6 ^ 1;
      v2 = (xpc_object_t)__muser_pipe;
    }
    if (!v2)
      goto LABEL_19;
    goto LABEL_18;
  }
  return 0;
}

uint64_t si_group_bygid(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 56)) != 0)
    return v1();
  else
    return 0;
}

void __si_module_static_search_block_invoke()
{
  _QWORD **v0;
  char *v1;
  FILE *v2;
  _BYTE *line;
  _BYTE *v4;
  const char **v5;
  const char *v6;
  unsigned int v7;
  int v8;

  si_module_static_search_si = (uint64_t)strdup("search");
  v0 = (_QWORD **)malloc_type_calloc(1uLL, 0x1B8uLL, 0x10B00409E57A33FuLL);
  qword_1ECCEFD48 = (uint64_t)v0;
  if (si_module_config_modules_for_category((uint64_t)v0, 0, 6, (uint64_t)off_1E2E56DA0))
  {
    free((void *)si_module_static_search_si);
    si_module_static_search_si = 0;
    free(v0);
    qword_1ECCEFD48 = 0;
    si_module_static_search_result = 1;
    return;
  }
  v0[54] = (_QWORD *)**v0;
  v1 = getenv("SYSINFO_CONF_ENABLE");
  if (v1)
  {
    if (!strcmp(v1, "1"))
    {
      v2 = fopen("/etc/sysinfo.conf", "r");
      *__error() = 0;
      if (v2)
      {
        line = _fsi_get_line();
        if (!line)
        {
LABEL_43:
          fclose(v2);
          return;
        }
        v4 = line;
        while (*v4 == 35)
        {
LABEL_42:
          free(v4);
          v4 = _fsi_get_line();
          if (!v4)
            goto LABEL_43;
        }
        v8 = 0;
        v5 = (const char **)_fsi_tokenize(v4, "\t: ", 0, &v8);
        v6 = *v5;
        if (!strcmp(*v5, "default"))
        {
          v7 = 0;
        }
        else if (!strcmp(v6, "user"))
        {
          v7 = 1;
        }
        else if (!strcmp(v6, "group"))
        {
          v7 = 2;
        }
        else if (!strcmp(v6, "grouplist"))
        {
          v7 = 3;
        }
        else if (!strcmp(v6, "netgroup"))
        {
          v7 = 4;
        }
        else if (!strcmp(v6, "alias"))
        {
          v7 = 5;
        }
        else if (!strcmp(v6, "host"))
        {
          v7 = 6;
        }
        else if (!strcmp(v6, "network"))
        {
          v7 = 8;
        }
        else if (!strcmp(v6, "service"))
        {
          v7 = 9;
        }
        else if (!strcmp(v6, "protocol"))
        {
          v7 = 10;
        }
        else if (!strcmp(v6, "rpc"))
        {
          v7 = 11;
        }
        else if (!strcmp(v6, "fs"))
        {
          v7 = 12;
        }
        else if (!strcmp(v6, "mac"))
        {
          v7 = 13;
        }
        else if (!strcmp(v6, "addrinfo"))
        {
          v7 = 15;
        }
        else
        {
          if (strcmp(v6, "nameinfo"))
          {
LABEL_41:
            free(v5);
            goto LABEL_42;
          }
          v7 = 14;
        }
        si_module_config_modules_for_category((uint64_t)v0, v7, v8, (uint64_t)v5);
        goto LABEL_41;
      }
    }
  }
}

uint64_t si_module_config_modules_for_category(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v5;
  size_t v6;
  void *v10;
  uint64_t v11;
  void **v12;
  BOOL v13;
  int v15;
  _DWORD *v16;
  uint64_t v17;
  char **v18;
  uint64_t v19;
  _QWORD *v20;

  v5 = a1 + 24 * a2;
  v6 = (a3 - 1);
  *(_DWORD *)(v5 + 16) = v6;
  if (a3 == 1)
    return 0xFFFFFFFFLL;
  *(_QWORD *)v5 = malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
  v10 = malloc_type_calloc(*(unsigned int *)(v5 + 16), 4uLL, 0x100004052888210uLL);
  v11 = a1 + 24 * a2;
  *(_QWORD *)(v11 + 8) = v10;
  v12 = (void **)(v11 + 8);
  if (*(_QWORD *)v5)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (v13)
  {
    free(*(void **)v5);
    free(*v12);
    return 0xFFFFFFFFLL;
  }
  if (a3 >= 2)
  {
    v15 = 0;
    v16 = (_DWORD *)(a1 + 24 * a2 + 20);
    v17 = a3;
    v18 = (char **)(a4 + 8);
    v19 = v17 - 1;
    do
    {
      v20 = si_module_with_name(*v18);
      if (v20)
      {
        *(_QWORD *)(*(_QWORD *)v5 + 8 * v15++) = v20;
        if (!strcmp(*v18, "cache"))
          *v16 |= 1u;
      }
      ++v18;
      --v19;
    }
    while (v19);
  }
  return 0;
}

_QWORD *si_module_with_name(char *__s1)
{
  const char *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  char *v9;

  v2 = (const char *)si_module_with_name_modules;
  if (!si_module_with_name_modules)
    goto LABEL_5;
  v3 = &qword_1ECCEFD78;
  while (strcmp(__s1, v2))
  {
    v2 = (const char *)v3[1];
    v3 += 3;
    if (!v2)
      goto LABEL_5;
  }
  v4 = (_QWORD *)*v3;
  if (!*v3)
  {
    v4 = (_QWORD *)((uint64_t (*)(void))*(v3 - 1))();
    *v3 = (uint64_t)v4;
    if (!v4)
    {
LABEL_5:
      pthread_mutex_lock(&module_mutex);
      v9 = 0;
      asprintf(&v9, "%s/%s.%s", "/usr/lib/info", __s1, "so");
      if (v9)
      {
        v4 = si_module_with_path(v9, __s1);
        free(v9);
        if (v4)
        {
          v5 = module_count;
          v6 = module_count + 1;
          v7 = reallocf((void *)module_list, 8 * (module_count + 1));
          module_list = (uint64_t)v7;
          if (v7)
          {
            v7[v5] = v4;
            module_count = v6;
          }
        }
      }
      else
      {
        v4 = 0;
        *__error() = 12;
      }
      pthread_mutex_unlock(&module_mutex);
    }
  }
  return v4;
}

uint64_t *si_module_static_file()
{
  if (si_module_static_file_once != -1)
    dispatch_once(&si_module_static_file_once, &__block_literal_global);
  return &si_module_static_file_si;
}

uint64_t si_module_cache_byname(uint64_t a1, dispatch_once_t *predicate, uint64_t a3)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __si_module_cache_byname_block_invoke;
  v5[3] = &__block_descriptor_tmp;
  v5[4] = a1;
  v5[5] = a3;
  if (*predicate != -1)
    dispatch_once(predicate, v5);
  return a1;
}

uint64_t *si_module_static_mdns()
{
  if (si_module_static_mdns_once != -1)
    dispatch_once(&si_module_static_mdns_once, &__block_literal_global_0);
  return &si_module_static_mdns_si;
}

uint64_t *si_module_static_search()
{
  if (si_module_static_search_once != -1)
    dispatch_once(&si_module_static_search_once, &__block_literal_global_1);
  if (si_module_static_search_result)
    return 0;
  else
    return &si_module_static_search_si;
}

uint64_t *si_module_static_muser()
{
  if (si_module_static_muser_once != -1)
    dispatch_once(&si_module_static_muser_once, &__block_literal_global_2);
  return &si_module_static_muser_si;
}

uint64_t *si_module_static_darwin_directory()
{
  if ((_os_feature_enabled_simple_impl() & 1) == 0)
  {
    qword_1ECCEFB58 = 0;
    xmmword_1ECCEFB38 = 0u;
    unk_1ECCEFB48 = 0u;
    xmmword_1ECCEFB18 = 0u;
    unk_1ECCEFB28 = 0u;
    xmmword_1ECCEFAF8 = 0u;
    unk_1ECCEFB08 = 0u;
    xmmword_1ECCEFAD8 = 0u;
    unk_1ECCEFAE8 = 0u;
    xmmword_1ECCEFAB8 = 0u;
    unk_1ECCEFAC8 = 0u;
    xmmword_1ECCEFA98 = 0u;
    unk_1ECCEFAA8 = 0u;
    xmmword_1ECCEFA78 = 0u;
    unk_1ECCEFA88 = 0u;
    xmmword_1ECCEFA58 = 0u;
    unk_1ECCEFA68 = 0u;
    xmmword_1ECCEFA38 = 0u;
    *(_OWORD *)&off_1ECCEFA48 = 0u;
    xmmword_1ECCEFA18 = 0u;
    *(_OWORD *)&off_1ECCEFA28 = 0u;
    si_module_static_darwin_directory_darwin_directory_vtable = 0u;
    *(_OWORD *)&off_1ECCEFA08 = 0u;
  }
  if (si_module_static_darwin_directory_once != -1)
    dispatch_once(&si_module_static_darwin_directory_once, &__block_literal_global_3);
  return &si_module_static_darwin_directory_si;
}

uint64_t si_module_static_cache()
{
  return si_module_cache_byname((uint64_t)&si_module_static_cache_si, &si_module_static_cache_once, (uint64_t)"cache");
}

unsigned int *cache_group_bygid(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 2u, 0, a2, 2);
}

uint64_t si_group_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 48)) != 0)
    return v1();
  else
    return 0;
}

_OWORD *muser_user_byname(uint64_t a1, const char *a2)
{
  xpc_object_t v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD *user;

  if (*a2 == 95)
    return 0;
  if (!_muser_available())
    return 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "username");
  xpc_dictionary_set_string(v5, "query", a2);
  v6 = (void *)_muser_call("getpwnam", v5);
  if (v6)
  {
    v7 = v6;
    user = _muser_extract_user(a1, v6);
    xpc_release(v7);
  }
  else
  {
    user = 0;
  }
  xpc_release(v5);
  return user;
}

void **file_user_byname(uint64_t a1, const char *a2)
{
  return _fsi_get_user(a1, a2, 0, 1);
}

FILE *_fsi_get_group(uint64_t a1, const char *a2, int a3, int a4)
{
  FILE *result;
  FILE *v9;
  _BYTE *line;
  _BYTE *v11;
  const char **v12;
  const char **v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  __darwin_time_t v26;
  int v27;

  if (!a2 && a4 == 1)
    return 0;
  result = fopen("/etc/group", "r");
  if (result)
  {
    v9 = result;
    v26 = 0;
    v25 = 0;
    _fsi_get_validation(a1, 2u, "/etc/group", result, &v26, &v25);
    line = _fsi_get_line();
    if (!line)
    {
      v24 = 0;
      goto LABEL_22;
    }
    v11 = line;
    v24 = 0;
    while (1)
    {
      if (*v11 == 35)
        goto LABEL_14;
      v27 = 0;
      v12 = (const char **)_fsi_tokenize(v11, ":", 1, &v27);
      v13 = v12;
      if (v27 != 4)
        goto LABEL_13;
      v14 = atoi(v12[2]);
      if (a4)
      {
        if (a4 == 2)
        {
          if (v14 != a3)
            goto LABEL_13;
        }
        else if (a4 != 1 || strcmp(a2, *v13))
        {
LABEL_13:
          free(v13);
LABEL_14:
          free(v11);
          goto LABEL_15;
        }
      }
      v27 = 0;
      v23 = _fsi_tokenize(v13[3], ",", 1, &v27);
      v22 = (unsigned int *)LI_ils_create("L4488ss4*", v15, v16, v17, v18, v19, v20, v21, a1);
      free(v13);
      free(v23);
      free(v11);
      if (v22)
      {
        if (a4)
        {
          v24 = (void **)v22;
LABEL_22:
          fclose(v9);
          return (FILE *)v24;
        }
        v24 = si_list_add(v24, (uint64_t)v22);
        si_item_release(v22);
      }
LABEL_15:
      v11 = _fsi_get_line();
      if (!v11)
        goto LABEL_22;
    }
  }
  return result;
}

_OWORD *muser_group_byname(uint64_t a1, char *__s1)
{
  xpc_object_t v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD *group;

  if (*__s1 == 95 && strcmp(__s1, "_analyticsusers") && strcmp(__s1, "_accessory_mobile_share"))
    return 0;
  if (!_muser_available())
    return 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "groupname");
  xpc_dictionary_set_string(v5, "query", __s1);
  v6 = (void *)_muser_call("getgrnam", v5);
  if (v6)
  {
    v7 = v6;
    group = _muser_extract_group(a1, v6);
    xpc_release(v7);
  }
  else
  {
    group = 0;
  }
  xpc_release(v5);
  return group;
}

FILE *file_group_byname(uint64_t a1, const char *a2)
{
  return _fsi_get_group(a1, a2, 0, 1);
}

unsigned int *cache_group_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 2u, a2, 0, 1);
}

uint64_t si_module_static_cache_file()
{
  return si_module_cache_byname((uint64_t)&si_module_static_cache_file_si, &si_module_static_cache_file_once, (uint64_t)"cache_file");
}

_OWORD *muser_group_bygid(uint64_t a1, unsigned int a2)
{
  _OWORD *group;
  xpc_object_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 > 0x1F4 || (group = 0, a2 - 250 <= 0x31) && ((1 << (a2 + 6)) & 0x2001000000001) != 0)
  {
    if (_muser_available() && (v5 = xpc_dictionary_create(0, 0, 0)) != 0)
    {
      v6 = v5;
      xpc_dictionary_set_string(v5, "reqtype", "gid");
      xpc_dictionary_set_int64(v6, "query", a2);
      v7 = (void *)_muser_call("getgrgid", v6);
      if (v7)
      {
        v8 = v7;
        group = _muser_extract_group(a1, v7);
        xpc_release(v8);
      }
      else
      {
        group = 0;
      }
      xpc_release(v6);
    }
    else
    {
      return 0;
    }
  }
  return group;
}

FILE *file_group_bygid(uint64_t a1, int a2)
{
  return _fsi_get_group(a1, 0, a2, 2);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  uid_t identifier;

  identifier = uid;
  return mbr_identifier_to_uuid(0, &identifier, 4uLL, uu);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  int result;
  passwd *v8;
  gid_t *p_gr_gid;
  unsigned int v10;
  group *v11;
  unsigned __int8 *src;

  src = 0;
  result = mbr_identifier_translate(id_type, (gid_t *)identifier, identifier_size, 6u, (char **)&src, 0);
  if (!result)
  {
LABEL_10:
    uuid_copy(uu, src);
    free(src);
    return 0;
  }
  if (result != 5)
    return result;
  if (id_type == 5)
  {
    v11 = getgrnam((const char *)identifier);
    if (v11)
    {
      p_gr_gid = &v11->gr_gid;
      v10 = 1;
LABEL_9:
      result = mbr_identifier_translate(v10, p_gr_gid, 4, 6u, (char **)&src, 0);
      if (result)
        return result;
      goto LABEL_10;
    }
  }
  else if (id_type == 4)
  {
    v8 = getpwnam((const char *)identifier);
    if (v8)
    {
      p_gr_gid = &v8->pw_uid;
      v10 = 0;
      goto LABEL_9;
    }
  }
  return 5;
}

uint64_t mbr_identifier_translate(unsigned int a1, gid_t *a2, uint64_t a3, unsigned int a4, char **a5, int *a6)
{
  uint64_t v6;
  gid_t v12;
  uint64_t v13;
  uint64_t v14;
  host_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t *v19;
  int v20;
  gid_t v21;
  uint64_t v22;
  host_t v23;
  uint64_t multiuser_config_flags;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  _DWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  host_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  host_t v44;
  uint64_t v45;
  host_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  unsigned int v55;
  unsigned __int8 *v56;
  unsigned __int8 *v57;
  int v58;
  unsigned int v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  host_t v63;
  host_t v64;
  host_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t *v71;
  uint64_t *v72;
  char **v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  char *(*v77)(uint64_t, uint64_t, _BYTE *);
  void *v78;
  uint64_t *v79;
  uint64_t *v80;
  char **v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  gid_t *v96;
  uint64_t v97;
  uint32_t multiuser_flags[2];
  uint64_t v99;
  uint64_t (*v100)(uint64_t);
  void *v101;
  uint64_t *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C874D8];
  v6 = 5;
  if (!a3 || !a2 || !a5)
    return v6;
  if (a3 != -1)
  {
    if (a1 >= 2)
    {
      if (a1 == 6 && a3 != 16)
        return 22;
    }
    else if (a3 != 4)
    {
      return 22;
    }
  }
  if (!_os_feature_enabled_simple_impl())
  {
LABEL_70:
    if (a4 > 0x1F)
      return v6;
    if (((1 << a4) & 0x40000003) != 0)
    {
      if (a1 != 6)
        return v6;
      v53 = (char *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
      if (v53)
      {
        v54 = v53;
        if (parse_compatibility_uuid((uint64_t)a2, v53, a6))
        {
          v6 = 0;
          *a5 = v54;
        }
        else
        {
          free(v54);
        }
        return v6;
      }
    }
    else
    {
      if (((1 << a4) & 0x80000030) != 0)
      {
        if (a1)
        {
          if (a1 != 1)
          {
            if (a1 != 6)
              return v6;
            LODWORD(v75) = 0;
            LODWORD(v67) = 0;
            if (!parse_compatibility_uuid((uint64_t)a2, &v67, &v75)
              || !compatibility_name_for_id(v67, v75, a5))
            {
              return v6;
            }
            if (a6)
              *a6 = v75;
            return 0;
          }
          if (!compatibility_name_for_id(*a2, 2, a5))
            return v6;
LABEL_98:
          if (a6)
          {
            v6 = 0;
            v58 = 2;
            goto LABEL_100;
          }
          return 0;
        }
        if (!compatibility_name_for_id(*a2, 1, a5))
          return v6;
        if (!a6)
          return 0;
LABEL_92:
        v6 = 0;
        v58 = 1;
LABEL_100:
        *a6 = v58;
        return v6;
      }
      if (a4 != 6)
        return v6;
      if (a1 == 1)
      {
        v59 = *a2;
        v60 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        if (v60)
        {
          v61 = v60;
          uuid_copy(v60, _group_compat_prefix);
          *((_DWORD *)v61 + 3) = bswap32(v59);
          *a5 = (char *)v61;
          goto LABEL_98;
        }
      }
      else
      {
        if (a1)
          return v6;
        v55 = *a2;
        v56 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        if (v56)
        {
          v57 = v56;
          uuid_copy(v56, _user_compat_prefix);
          *((_DWORD *)v57 + 3) = bswap32(v55);
          *a5 = (char *)v57;
          if (!a6)
            return 0;
          goto LABEL_92;
        }
      }
    }
    return 12;
  }
  v87 = 0;
  v88 = &v87;
  v89 = 0x2000000000;
  v90 = -1;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2000000000;
  v86 = 2;
  v6 = 22;
  switch(a4)
  {
    case 0u:
      if ((a1 & 0xFFFFFFFD) != 4)
        goto LABEL_69;
      goto LABEL_21;
    case 1u:
      if (a1 - 5 < 2)
        goto LABEL_21;
      goto LABEL_69;
    case 2u:
    case 3u:
      goto LABEL_69;
    case 4u:
      if (!a1)
        goto LABEL_31;
      goto LABEL_42;
    case 5u:
      goto LABEL_18;
    case 6u:
LABEL_21:
      switch(a1)
      {
        case 0u:
          goto LABEL_31;
        case 1u:
          goto LABEL_22;
        case 4u:
          goto LABEL_52;
        case 5u:
          goto LABEL_58;
        case 6u:
          goto LABEL_43;
        default:
          v86 = 22;
          goto LABEL_65;
      }
    default:
      if (a4 != 30)
      {
        if (a4 != 31)
          goto LABEL_69;
        if (!a1)
        {
LABEL_31:
          v21 = *a2;
          v13 = MEMORY[0x1E0C87450];
          v75 = MEMORY[0x1E0C87450];
          v76 = 0x40000000;
          v77 = ___dd_mbr_identifier_translate_block_invoke;
          v78 = &unk_1E2E56E68;
          v82 = a4;
          v79 = &v87;
          v80 = &v83;
          v81 = a5;
          v95 = 0;
          v97 = 0;
          v96 = (gid_t *)v21;
          v91 = 0;
          v92 = &v91;
          v93 = 0x2000000000;
          v94 = 0;
          v67 = MEMORY[0x1E0C87450];
          v68 = 0x40000000;
          v69 = ___dd_foreach_record_with_id_block_invoke;
          v70 = &unk_1E2E56F58;
          v71 = &v75;
          v72 = &v91;
          v22 = DarwinDirectoryRecordStoreApplyWithFilter();
          if (!*((_BYTE *)v92 + 24))
          {
            multiuser_flags[0] = 0;
            v23 = MEMORY[0x194021814](v22);
            multiuser_config_flags = host_get_multiuser_config_flags(v23, multiuser_flags);
            if ((_DWORD)multiuser_config_flags)
              goto LABEL_107;
            if ((multiuser_flags[0] & 0x80000000) != 0 && v21 == 501)
            {
              multiuser_flags[0] = 0;
              v64 = MEMORY[0x194021814](multiuser_config_flags, v25, v26, v27, v28, v29);
              if (host_get_multiuser_config_flags(v64, multiuser_flags))
              {
LABEL_120:
                mbr_identifier_translate_cold_2();
                goto LABEL_121;
              }
              LODWORD(v96) = multiuser_flags[0] & 0x3FFFFFFF;
              *(_QWORD *)multiuser_flags = v13;
              v99 = 0x40000000;
              v100 = ___dd_foreach_record_with_id_block_invoke_2;
              v101 = &unk_1E2E56F80;
              v102 = &v75;
              DarwinDirectoryRecordStoreApplyWithFilter();
            }
          }
          _Block_object_dispose(&v91, 8);
          if (!*a5 && a4 == 6)
          {
            v30 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
            if (v30)
            {
              v31 = v30;
              uuid_copy(v30, _user_compat_prefix);
              *((_DWORD *)v31 + 3) = bswap32(*a2);
              *a5 = (char *)v31;
              v19 = v88;
              v20 = 1;
              goto LABEL_39;
            }
            goto LABEL_118;
          }
          goto LABEL_65;
        }
LABEL_18:
        if (a1 == 1)
        {
LABEL_22:
          v12 = *a2;
          v13 = MEMORY[0x1E0C87450];
          v75 = MEMORY[0x1E0C87450];
          v76 = 0x40000000;
          v77 = ___dd_mbr_identifier_translate_block_invoke_2;
          v78 = &unk_1E2E56E90;
          v82 = a4;
          v79 = &v87;
          v80 = &v83;
          v81 = a5;
          v95 = 0;
          v97 = 0;
          v96 = (gid_t *)v12;
          v91 = 0;
          v92 = &v91;
          v93 = 0x2000000000;
          v94 = 0;
          v67 = MEMORY[0x1E0C87450];
          v68 = 0x40000000;
          v69 = ___dd_foreach_record_with_id_block_invoke;
          v70 = &unk_1E2E56F58;
          v71 = &v75;
          v72 = &v91;
          v14 = DarwinDirectoryRecordStoreApplyWithFilter();
          if (*((_BYTE *)v92 + 24))
            goto LABEL_26;
          multiuser_flags[0] = 0;
          v15 = MEMORY[0x194021814](v14);
          v16 = host_get_multiuser_config_flags(v15, multiuser_flags);
          if (!(_DWORD)v16)
          {
            if ((multiuser_flags[0] & 0x80000000) == 0 || v12 != 501)
              goto LABEL_26;
            goto LABEL_108;
          }
          mbr_identifier_translate_cold_2();
LABEL_107:
          v16 = mbr_identifier_translate_cold_2();
LABEL_108:
          multiuser_flags[0] = 0;
          v63 = MEMORY[0x194021814](v16);
          if (host_get_multiuser_config_flags(v63, multiuser_flags))
          {
LABEL_119:
            mbr_identifier_translate_cold_2();
            goto LABEL_120;
          }
          LODWORD(v96) = multiuser_flags[0] & 0x3FFFFFFF;
          *(_QWORD *)multiuser_flags = v13;
          v99 = 0x40000000;
          v100 = ___dd_foreach_record_with_id_block_invoke_2;
          v101 = &unk_1E2E56F80;
          v102 = &v75;
          DarwinDirectoryRecordStoreApplyWithFilter();
LABEL_26:
          _Block_object_dispose(&v91, 8);
          if (!*a5 && a4 == 6)
          {
            v17 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
            if (v17)
            {
              v18 = v17;
              uuid_copy(v17, _group_compat_prefix);
              *((_DWORD *)v18 + 3) = bswap32(*a2);
              *a5 = (char *)v18;
              v19 = v88;
              v20 = 2;
LABEL_39:
              *((_DWORD *)v19 + 6) = v20;
LABEL_50:
              *((_DWORD *)v84 + 6) = 0;
              if (!a6)
                goto LABEL_68;
              goto LABEL_66;
            }
            goto LABEL_117;
          }
          goto LABEL_65;
        }
LABEL_42:
        if (a1 != 6)
          goto LABEL_69;
LABEL_43:
        v32 = MEMORY[0x1E0C87450];
        v75 = MEMORY[0x1E0C87450];
        v76 = 0x40000000;
        v77 = ___dd_mbr_identifier_translate_block_invoke_5;
        v78 = &unk_1E2E56F08;
        v82 = a4;
        v79 = &v87;
        v80 = &v83;
        v81 = a5;
        *(_QWORD *)multiuser_flags = 2;
        v99 = 0;
        v100 = 0;
        uuid_copy((unsigned __int8 *)&v99, (const unsigned __int8 *)a2);
        v67 = v32;
        v68 = 0x40000000;
        v69 = ___dd_foreach_record_with_uuid_block_invoke;
        v70 = &unk_1E2E56FF8;
        v71 = &v75;
        DarwinDirectoryRecordStoreApplyWithFilter();
        if (!*a5)
        {
          v67 = v32;
          v68 = 0x40000000;
          v69 = ___dd_mbr_identifier_translate_block_invoke_6;
          v70 = &unk_1E2E56F30;
          v72 = &v83;
          v73 = a5;
          v74 = a4;
          v71 = &v87;
          v92 = 0;
          v93 = 0;
          v91 = 2;
          uuid_copy((unsigned __int8 *)&v92, (const unsigned __int8 *)a2);
          *(_QWORD *)multiuser_flags = v32;
          v99 = 0x40000000;
          v100 = ___dd_foreach_record_with_uuid_block_invoke;
          v101 = &unk_1E2E56FF8;
          v102 = &v67;
          DarwinDirectoryRecordStoreApplyWithFilter();
          if (!*a5 && a4 <= 0x1E && ((1 << a4) & 0x40000003) != 0)
          {
            v33 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
            if (v33)
            {
              v34 = v33;
              if (!parse_compatibility_uuid((uint64_t)a2, v33, a6))
              {
                free(v34);
                if (!a6)
                  goto LABEL_68;
                goto LABEL_66;
              }
              *a5 = (char *)v34;
              goto LABEL_50;
            }
            mbr_identifier_translate_cold_11();
LABEL_117:
            mbr_identifier_translate_cold_4();
LABEL_118:
            mbr_identifier_translate_cold_1();
            goto LABEL_119;
          }
        }
LABEL_65:
        if (!a6)
        {
LABEL_68:
          v6 = *((unsigned int *)v84 + 6);
LABEL_69:
          _Block_object_dispose(&v83, 8);
          _Block_object_dispose(&v87, 8);
          if ((_DWORD)v6 != 2)
            return v6;
          goto LABEL_70;
        }
LABEL_66:
        if (*a5)
          *a6 = *((_DWORD *)v88 + 6);
        goto LABEL_68;
      }
      if (a1 == 4)
      {
LABEL_52:
        v35 = MEMORY[0x1E0C87450];
        v75 = MEMORY[0x1E0C87450];
        v76 = 0x40000000;
        v77 = ___dd_mbr_identifier_translate_block_invoke_3;
        v78 = &unk_1E2E56EB8;
        v82 = a4;
        v79 = &v87;
        v80 = &v83;
        v81 = a5;
        v96 = a2;
        v97 = 0;
        v95 = 1;
        v91 = 0;
        v92 = &v91;
        v93 = 0x2000000000;
        v94 = 0;
        v67 = MEMORY[0x1E0C87450];
        v68 = 0x40000000;
        v69 = ___dd_foreach_record_with_name_block_invoke;
        v70 = &unk_1E2E56FA8;
        v71 = &v75;
        v72 = &v91;
        v36 = DarwinDirectoryRecordStoreApplyWithFilter();
        if (*((_BYTE *)v92 + 24))
          goto LABEL_62;
        multiuser_flags[0] = 0;
        v37 = MEMORY[0x194021814](v36);
        if (!host_get_multiuser_config_flags(v37, multiuser_flags))
        {
          if ((multiuser_flags[0] & 0x80000000) == 0)
            goto LABEL_62;
          v38 = strcmp((const char *)a2, "mobile");
          if ((_DWORD)v38)
            goto LABEL_62;
          LODWORD(v95) = 0;
          multiuser_flags[0] = 0;
          v44 = MEMORY[0x194021814](v38, v39, v40, v41, v42, v43);
          if (host_get_multiuser_config_flags(v44, multiuser_flags))
          {
LABEL_121:
            mbr_identifier_translate_cold_2();
            goto LABEL_122;
          }
          goto LABEL_115;
        }
        mbr_identifier_translate_cold_2();
LABEL_113:
        mbr_identifier_translate_cold_2();
      }
      if (a1 != 5)
        goto LABEL_42;
LABEL_58:
      v35 = MEMORY[0x1E0C87450];
      v75 = MEMORY[0x1E0C87450];
      v76 = 0x40000000;
      v77 = ___dd_mbr_identifier_translate_block_invoke_4;
      v78 = &unk_1E2E56EE0;
      v82 = a4;
      v79 = &v87;
      v80 = &v83;
      v81 = a5;
      v96 = a2;
      v97 = 0;
      v95 = 1;
      v91 = 0;
      v92 = &v91;
      v93 = 0x2000000000;
      v94 = 0;
      v67 = MEMORY[0x1E0C87450];
      v68 = 0x40000000;
      v69 = ___dd_foreach_record_with_name_block_invoke;
      v70 = &unk_1E2E56FA8;
      v71 = &v75;
      v72 = &v91;
      v45 = DarwinDirectoryRecordStoreApplyWithFilter();
      if (*((_BYTE *)v92 + 24))
      {
LABEL_62:
        _Block_object_dispose(&v91, 8);
        if (!a6)
          goto LABEL_68;
        goto LABEL_66;
      }
      multiuser_flags[0] = 0;
      v46 = MEMORY[0x194021814](v45);
      if (host_get_multiuser_config_flags(v46, multiuser_flags))
        goto LABEL_113;
      if ((multiuser_flags[0] & 0x80000000) == 0)
        goto LABEL_62;
      v47 = strcmp((const char *)a2, "mobile");
      if ((_DWORD)v47)
        goto LABEL_62;
      LODWORD(v95) = 0;
      multiuser_flags[0] = 0;
      v65 = MEMORY[0x194021814](v47, v48, v49, v50, v51, v52);
      if (!host_get_multiuser_config_flags(v65, multiuser_flags))
      {
LABEL_115:
        LODWORD(v96) = multiuser_flags[0] & 0x3FFFFFFF;
        *(_QWORD *)multiuser_flags = v35;
        v99 = 0x40000000;
        v100 = ___dd_foreach_record_with_name_block_invoke_2;
        v101 = &unk_1E2E56FD0;
        v102 = &v75;
        DarwinDirectoryRecordStoreApplyWithFilter();
        goto LABEL_62;
      }
LABEL_122:
      v66 = mbr_identifier_translate_cold_2();
      return _gai_addr_sort(v66);
  }
}

uint64_t _gai_addr_sort(uint64_t a1, uint64_t a2)
{
  return si_destination_compare((unsigned __int8 *)(*(_QWORD *)a2 + 52), 0, (unsigned __int8 *)(*(_QWORD *)a1 + 52), 0, 1);
}

uint64_t _LI_data_init()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&_info_key, (void (__cdecl *)(void *))_LI_data_free);
  if (!(_DWORD)result)
    _info_key_ok = 1;
  return result;
}

char *__si_module_static_file_block_invoke()
{
  char *result;
  __int128 v1;

  si_module_static_file_si = (uint64_t)strdup("file");
  result = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x1020040207AA8A1uLL);
  if (result)
  {
    *(_QWORD *)&v1 = -1;
    *((_QWORD *)&v1 + 1) = -1;
    *(_OWORD *)(result + 36) = v1;
    *(_OWORD *)(result + 20) = v1;
    *(_OWORD *)(result + 4) = v1;
    *(_DWORD *)result = 416;
  }
  qword_1ECCEFE48 = (uint64_t)result;
  return result;
}

void si_set_nat64_v4_requires_synthesis(void *a1)
{
  if (a1)
  {
    nat64_v4_requires_synthesis = a1;
  }
  else
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT))
      si_set_nat64_v4_requires_synthesis_cold_1();
  }
}

void si_set_path_check(void *a1)
{
  if (a1)
  {
    path_check = a1;
  }
  else
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT))
      si_set_path_check_cold_1();
  }
}

void si_set_nat64_v4_synthesize(void *a1)
{
  if (a1)
  {
    nat64_v4_synthesize = a1;
  }
  else
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT))
      si_set_nat64_v4_synthesize_cold_1();
  }
}

void si_libinfo_addrinfo_callback(addrinfo *a1, int a2, void (**a3)(uint64_t, addrinfo *, uint64_t))
{
  void (*v5)(uint64_t, addrinfo *, uint64_t);
  unsigned int v6;
  uint64_t v7;
  addrinfo *v8;
  void (*v9)(uint64_t, addrinfo *, uint64_t);
  uint64_t v10;
  addrinfo *v11;

  if (!a3)
  {
    si_list_release((uint64_t)a1);
    return;
  }
  if (a2 != 15)
  {
    v5 = *a3;
    if (*a3)
    {
      if ((a2 - 200) >= 0xFFFFFF9D)
        v6 = a2 - 100;
      else
        v6 = 4;
      if (a2)
        v7 = v6;
      else
        v7 = 0;
      if (a1)
      {
        v8 = si_list_to_addrinfo(a1);
        si_list_release((uint64_t)a1);
        v5 = *a3;
        v9 = a3[1];
        if (v8)
        {
          v10 = v7;
          v11 = v8;
LABEL_18:
          v5(v10, v11, (uint64_t)v9);
          goto LABEL_19;
        }
        v10 = 6;
      }
      else
      {
        v9 = a3[1];
        v10 = 8;
      }
      v11 = 0;
      goto LABEL_18;
    }
  }
  si_list_release((uint64_t)a1);
LABEL_19:
  free(a3);
}

void **si_addrinfo_list_from_hostent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t *a8)
{
  _QWORD *v14;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  _QWORD v27[2];

  if (a8 && (v14 = (_QWORD *)a8[3]) != 0 && *v14)
  {
    v16 = 0;
    v17 = 8;
    do
    {
      v27[0] = 0;
      v27[1] = 0;
      __memcpy_chk();
      v19 = si_addrinfo_list(a1, a2, v18, a4, 0, (unsigned __int8 *)v27, a5, a6, 0, *a8);
      v16 = si_list_concat(v16, (uint64_t)v19);
      si_list_release((uint64_t)v19);
      v20 = *(_QWORD *)(a8[3] + v17);
      v17 += 8;
    }
    while (v20);
    if (!a7)
      return v16;
  }
  else
  {
    v16 = 0;
    if (!a7)
      return v16;
  }
  v21 = (_QWORD *)a7[3];
  if (v21 && *v21)
  {
    v22 = 8;
    do
    {
      LODWORD(v27[0]) = 0;
      __memcpy_chk();
      v24 = si_addrinfo_list(a1, a2, v23, a4, (uint64_t)v27, 0, a5, 0, *a7, 0);
      v16 = si_list_concat(v16, (uint64_t)v24);
      si_list_release((uint64_t)v24);
      v25 = *(_QWORD *)(a7[3] + v22);
      v22 += 8;
    }
    while (v25);
  }
  return v16;
}

void **si_addrinfo_list(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned __int16 v10;
  int v12;
  _BOOL4 v15;
  int v16;
  unsigned __int16 v17;
  unsigned int *v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int *v27;
  void **v28;
  unsigned int *v29;
  unsigned int *v30;
  void **v31;

  v10 = a7;
  v12 = a4;
  v15 = (a2 & 0x100) == 0 && a6 != 0;
  v16 = (a2 & 0x800) == 0 || v15;
  if (!a6)
  {
    v20 = 0;
    goto LABEL_22;
  }
  v17 = a8;
  if ((_DWORD)a4 != 17 && (_DWORD)a4)
  {
    v20 = 0;
  }
  else
  {
    v19 = (unsigned int *)si_addrinfo_v6(a1, 0, 2, 17, (unsigned __int16)a7, a6, (unsigned __int16)a8, a10);
    v20 = si_list_add(0, (uint64_t)v19);
    si_item_release(v19);
    if (!v12)
      goto LABEL_19;
  }
  if (v12 == 58)
  {
    v21 = v10;
    v22 = v17;
    v23 = a1;
    v24 = 3;
    v25 = 58;
    goto LABEL_21;
  }
  if (v12 != 6)
    goto LABEL_22;
LABEL_19:
  v21 = v10;
  v22 = v17;
  v23 = a1;
  v24 = 1;
  v25 = 6;
LABEL_21:
  v26 = (unsigned int *)si_addrinfo_v6(v23, 0, v24, v25, v21, a6, v22, a10);
  v20 = si_list_add(v20, (uint64_t)v26);
  si_item_release(v26);
LABEL_22:
  if (a5)
  {
    if (v12 != 17 && v12)
    {
      v28 = 0;
    }
    else
    {
      if (v16)
      {
        v27 = (unsigned int *)LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
        v28 = si_list_add(0, (uint64_t)v27);
      }
      else
      {
        v27 = (unsigned int *)si_addrinfo_v4_mapped(a1, 0, 2, 17, v10, a5, 0, a9);
        v20 = si_list_add(v20, (uint64_t)v27);
        v28 = 0;
      }
      si_item_release(v27);
    }
    if (v12 == 6 || !v12)
    {
      if (v16)
      {
        v29 = (unsigned int *)LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
        v28 = si_list_add(v28, (uint64_t)v29);
      }
      else
      {
        v29 = (unsigned int *)si_addrinfo_v4_mapped(a1, 0, 1, 6, v10, a5, 0, a9);
        v20 = si_list_add(v20, (uint64_t)v29);
      }
      si_item_release(v29);
    }
    if (v12 == 1)
    {
      if (v16)
      {
        v30 = (unsigned int *)LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
        v28 = si_list_add(v28, (uint64_t)v30);
      }
      else
      {
        v30 = (unsigned int *)si_addrinfo_v4_mapped(a1, 0, 3, 1, v10, a5, 0, a9);
        v20 = si_list_add(v20, (uint64_t)v30);
      }
      si_item_release(v30);
    }
  }
  else
  {
    v28 = 0;
  }
  v31 = si_list_concat(v20, (uint64_t)v28);
  si_list_release((uint64_t)v28);
  return v31;
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  unsigned int ai_protocol;
  uint64_t ai_socktype;
  int ai_flags;
  unsigned int ai_family;
  _QWORD *v12;
  addrinfo *v13;
  uint64_t v14;
  addrinfo *v15;
  int v16;
  int v17;

  v17 = 0;
  if (!a4)
    return 0;
  *a4 = 0;
  if (!a3)
  {
    ai_protocol = 0;
    ai_socktype = 0;
    ai_family = 0;
LABEL_7:
    ai_flags = 1536;
    goto LABEL_8;
  }
  ai_socktype = a3->ai_socktype;
  ai_protocol = a3->ai_protocol;
  ai_flags = a3->ai_flags;
  ai_family = a3->ai_family;
  if (!a3->ai_flags)
    goto LABEL_7;
LABEL_8:
  v12 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v12 = si_module_with_name("search");
    si_search_search = (uint64_t)v12;
  }
  v13 = (addrinfo *)si_addrinfo((uint64_t)v12, a1, a2, ai_family, ai_socktype, ai_protocol, ai_flags, 0, &v17);
  v14 = (uint64_t)v13;
  if (!v17 && v13 && v13->ai_family)
  {
    *a4 = si_list_to_addrinfo(v13);
    si_list_release(v14);
    v15 = *a4;
    if (!v15)
      return 6;
    if ((ai_flags & 2) == 0)
    {
      do
      {
        free(v15->ai_canonname);
        v15->ai_canonname = 0;
        v15 = v15->ai_next;
      }
      while (v15);
    }
    return v17;
  }
  else
  {
    si_list_release((uint64_t)v13);
    if ((v17 - 200) >= 0xFFFFFF9D)
      v16 = v17 - 100;
    else
      v16 = 4;
    if (v17)
      return v16;
    else
      return 8;
  }
}

void si_list_release(uint64_t a1)
{
  int v2;
  unint64_t v3;

  if (a1)
  {
    do
      v2 = __ldaxr((unsigned int *)a1);
    while (__stlxr(v2 - 1, (unsigned int *)a1));
    if (v2 <= 0)
      si_list_release_cold_1();
    if (v2 == 1)
    {
      if (*(_DWORD *)(a1 + 4))
      {
        v3 = 0;
        do
          si_item_release(*(unsigned int **)(*(_QWORD *)(a1 + 16) + 8 * v3++));
        while (v3 < *(unsigned int *)(a1 + 4));
      }
      free(*(void **)(a1 + 16));
      free((void *)a1);
    }
  }
}

unsigned int *si_addrinfo(uint64_t a1, _BYTE *a2, _BYTE *a3, unsigned int a4, uint64_t a5, unsigned int a6, int a7, char *a8, int *a9)
{
  unsigned int *result;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  const char *v28;
  unsigned int *v29;
  uint64_t (*v30)(uint64_t, char *, char *, int *);
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t i;
  uint64_t v43;
  uint64_t v44;
  int v45;
  unsigned int *v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  int *v54;
  const char *v55;
  unsigned __int8 *v56;
  uint64_t v57;
  unsigned int *v58;
  __int16 v59;
  uint64_t v60;
  unsigned int (*v61)(uint64_t);
  void **v62;
  void **v63;
  uint64_t v64;
  int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  _QWORD v69[2];
  int v70;
  unsigned __int16 v71;
  unsigned int v72;
  unsigned int v73;
  char *v74;

  v72 = 0;
  v73 = a4;
  if (a9)
  {
    *a9 = 0;
    if (!a1)
    {
      result = 0;
      v16 = 104;
LABEL_34:
      *a9 = v16;
      return result;
    }
  }
  else if (!a1)
  {
    return 0;
  }
  if (a2)
  {
    if (*a2)
      v17 = (uint64_t)a2;
    else
      v17 = 0;
    if (a3)
      goto LABEL_10;
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  if (!a3)
    goto LABEL_14;
LABEL_10:
  if (*a3)
    v18 = (uint64_t)a3;
  else
    v18 = 0;
LABEL_15:
  if (!(v17 | v18))
    goto LABEL_16;
  if (a4 > 0x1E || ((1 << a4) & 0x40000005) == 0)
  {
    if (a9)
    {
      result = 0;
      v16 = 105;
      goto LABEL_34;
    }
    return 0;
  }
  if (a5 >= 4 || a6 > 0x3A || ((1 << a6) & 0x400000000020043) == 0)
    goto LABEL_32;
  if ((_DWORD)a5 == 2)
  {
    v19 = 0;
    if (a6 && a6 != 17)
      goto LABEL_32;
  }
  else if ((_DWORD)a5 == 1)
  {
    v19 = 1;
    if (a6 && a6 != 6)
    {
LABEL_32:
      if (a9)
      {
        result = 0;
        v16 = 112;
        goto LABEL_34;
      }
      return 0;
    }
  }
  else
  {
    v19 = 0;
  }
  if ((a7 & 5) == 0)
  {
    if (v17)
    {
      if (strcmp((const char *)v17, "localhost"))
      {
        if (strcmp((const char *)v17, "0.0.0.0"))
        {
          if (strcmp((const char *)v17, "127.0.0.1"))
          {
            if (strcmp((const char *)v17, "::"))
            {
              if (strcmp((const char *)v17, "::1"))
              {
                pthread_once(&_gai_load_libnetwork_load_once, _gai_load_libnetwork_once);
                if (path_check)
                  path_check(v17, v18);
              }
            }
          }
        }
      }
    }
  }
  v20 = a7 & 0xFFFFF5FF | 0x800;
  if ((a7 & 0x200) == 0)
    v20 = a7;
  if (a4 == 30)
  {
    if ((v20 & 0x800) != 0)
      v21 = v20;
    else
      v21 = v20 & 0xFFFFFEFF;
  }
  else
  {
    v21 = v20 & 0xFFFFF6FF;
  }
  if (a6)
    v22 = 0;
  else
    v22 = (_DWORD)a5 == 2;
  v70 = 0;
  v69[0] = 0;
  v69[1] = 0;
  if (v22)
    v23 = 17;
  else
    v23 = a6;
  if (((v23 == 0) & v19) != 0)
    v23 = 6;
  v71 = 0;
  v24 = v21;
  if ((v21 & 0x1000000) != 0)
  {
    v29 = 0;
    if (v17 && v18)
    {
      v68 = v23;
      v74 = 0;
      asprintf(&v74, "%s.%s", (const char *)v18, (const char *)v17);
      v30 = *(uint64_t (**)(uint64_t, char *, char *, int *))(*(_QWORD *)(a1 + 40) + 312);
      if (v30)
      {
        v31 = v30(a1, v74, a8, a9);
        free(v74);
        if (v31)
        {
          v33 = *(unsigned int *)(v31 + 4);
          if ((_DWORD)v33)
          {
            v34 = -1;
            LODWORD(v35) = v24;
            while (2)
            {
              v36 = *(uint64_t **)(v31 + 16);
              v37 = 0x7FFFFFFF;
              v38 = v33;
              do
              {
                v39 = *v36++;
                v40 = *(unsigned __int16 *)(v39 + 32);
                if (v37 > v40 && v34 < v40)
                  v37 = v40;
                --v38;
              }
              while (v38);
              if (v37 != 0x7FFFFFFF)
              {
                for (i = 0; i < v33; ++i)
                {
                  v43 = *(_QWORD *)(*(_QWORD *)(v31 + 16) + 8 * i);
                  v45 = *(unsigned __int16 *)(v43 + 32);
                  v44 = v43 + 32;
                  if (v37 == v45)
                  {
                    v35 = v35 | 0x1000;
                    v46 = _gai_simple(a1, *(_QWORD *)(v44 + 8), (const char *)(v44 + 4), a4, v32, v68, v35, (uint64_t)a8, a9);
                    if (v46)
                    {
                      v29 = v46;
                      goto LABEL_118;
                    }
                    v33 = *(unsigned int *)(v31 + 4);
                  }
                }
                v34 = v37;
                if (v33)
                  continue;
              }
              break;
            }
          }
          v29 = 0;
LABEL_118:
          si_list_release(v31);
          goto LABEL_119;
        }
      }
      else
      {
        free(v74);
      }
      v29 = 0;
    }
LABEL_119:
    v58 = v29;
    goto LABEL_120;
  }
  v67 = v23;
  v25 = _gai_numericserv((const char *)v18, &v71);
  v26 = v25;
  if ((v24 & 0x1000) != 0 && !v25)
    goto LABEL_16;
  if (!v18)
  {
    v28 = 0;
LABEL_98:
    v27 = v24;
    goto LABEL_99;
  }
  v65 = v25;
  if (!strcmp((const char *)v18, "0"))
  {
    v28 = 0;
    v26 = v65;
    goto LABEL_98;
  }
  v26 = v65;
  if (v65)
    v27 = v24 | 0x1000;
  else
    v27 = v24;
  if (v65)
    v28 = (const char *)&v71;
  else
    v28 = (const char *)v18;
LABEL_99:
  v47 = v26;
  v66 = v27;
  result = _gai_nat64_synthesis(a1, (const char *)v17, v28, v26, a4, a5, v67, v27, a8);
  if (!result)
  {
    v48 = _gai_numerichost((char *)v17, (int *)&v73, v66, &v70, v69, &v72);
    if (v48 == -1 || (v66 & 4) != 0 && !v48)
      goto LABEL_16;
    if (v48 == 1)
    {
      v51 = v66 | 4;
      v52 = v73;
      v53 = v67;
      if (v47)
      {
LABEL_105:
        if (v52 == 30)
          v54 = 0;
        else
          v54 = &v70;
        v55 = "localhost";
        if (v17)
          v55 = 0;
        if (v52 == 2)
          v56 = 0;
        else
          v56 = (unsigned __int8 *)v69;
        if (v52 == 2)
          v57 = v51;
        else
          v57 = v51 | 0x800;
        v58 = (unsigned int *)si_addrinfo_list(a1, v57, v49, v53, (uint64_t)v54, v56, v71, v72, (uint64_t)v55, (uint64_t)v55);
        v59 = v57;
        return _gai_sort_list(v58, v59);
      }
      if (!_gai_serv_to_port((const char *)v18, v67, &v71))
      {
        v51 = v66 | 0x1004;
        v53 = v67;
        goto LABEL_105;
      }
LABEL_16:
      if (a9)
      {
        result = 0;
        v16 = 108;
        goto LABEL_34;
      }
      return 0;
    }
    v60 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v60 + 288) || (v61 = *(unsigned int (**)(uint64_t))(v60 + 296)) == 0 || !v61(a1))
    {
      v58 = _gai_simple(a1, v17, v28, v73, v50, v67, v66, (uint64_t)a8, a9);
      v59 = v66;
      return _gai_sort_list(v58, v59);
    }
    LOWORD(v24) = v66;
    v62 = (void **)(*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, uint64_t, _QWORD, _QWORD, char *, int *))(*(_QWORD *)(a1 + 40) + 288))(a1, v17, v28, v73, a5, v67, v66, a8, a9);
    v63 = _gai_nat64_second_pass((uint64_t)v62, a1, v18, a4, a5, v67, a7, (uint64_t)a8);
    if (v63)
    {
      v64 = (uint64_t)v63;
      v62 = si_list_concat(v62, (uint64_t)v63);
      si_list_release(v64);
    }
    v58 = (unsigned int *)v62;
LABEL_120:
    v59 = v24;
    return _gai_sort_list(v58, v59);
  }
  return result;
}

uint64_t _gai_numericserv(const char *a1, _WORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char *__endptr;

  if (!a1)
  {
    if (!a2)
      return 1;
    LOWORD(v5) = 0;
LABEL_10:
    *a2 = v5;
    return 1;
  }
  __endptr = 0;
  v4 = strtol(a1, &__endptr, 10);
  if (!*a1)
    return 0;
  v5 = v4;
  result = 0;
  if (!*__endptr && (v5 & 0x8000000000000000) == 0 && v5 < 0x10000)
  {
    if (!a2)
      return 1;
    goto LABEL_10;
  }
  return result;
}

unsigned int *_gai_nat64_synthesis(uint64_t a1, const char *a2, const char *a3, int a4, unsigned int a5, int a6, uint64_t a7, uint64_t a8, char *a9)
{
  unsigned int *result;
  uint64_t v11;
  int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  uint64_t v27;
  void *v28;
  unsigned __int16 v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  uint8_t buf[4];
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  result = 0;
  v39 = *MEMORY[0x1E0C874D8];
  if (!a2)
    return result;
  v11 = a8;
  if ((a8 & 4) != 0)
    return result;
  if (a5 != 30 && a5)
    return 0;
  v32 = 0;
  if (inet_pton(2, a2, &v32) != 1 || !_gai_nat64_can_v4_address_be_synthesized(&v32))
    return 0;
  v31 = 0;
  v16 = si_inet_config(0, &v31);
  result = 0;
  if (v16 < 0 || !v31)
    return result;
  v30 = 0;
  if (a9)
  {
    v30 = if_nametoindex(a9);
    if (!v30)
      return 0;
  }
  v29 = 0;
  if (a4)
  {
    if (a3)
      v29 = *(_WORD *)a3;
  }
  else
  {
    if (_gai_serv_to_port(a3, a7, &v29))
      return 0;
    v11 = v11 | 0x1000;
  }
  v28 = 0;
  pthread_once(&_gai_load_libnetwork_load_once, _gai_load_libnetwork_once);
  if (!nat64_v4_synthesize)
    return 0;
  v17 = nat64_v4_synthesize(&v30, &v32, &v28);
  pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
  v18 = _gai_log;
  if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v34 = v30;
    v35 = 1024;
    v36 = v32;
    v37 = 1024;
    v38 = v17;
    _os_log_debug_impl(&dword_191F86000, v18, OS_LOG_TYPE_DEBUG, "nat64_v4_synthesize(%d, %{network:in_addr}d, ...) returned %d", buf, 0x14u);
  }
  result = 0;
  if (v17 && v28)
  {
    v20 = 0;
    v21 = 0;
    v22 = v17;
    do
    {
      v23 = si_addrinfo_list(a1, v11, v19, a7, 0, (unsigned __int8 *)v28 + v20, v29, 0, 0, 0);
      if (v23)
      {
        v24 = (uint64_t)v23;
        if (v21)
        {
          v21 = si_list_concat(v21, (uint64_t)v23);
          si_list_release(v24);
        }
        else
        {
          v21 = v23;
        }
      }
      v20 += 16;
      --v22;
    }
    while (v22);
    free(v28);
    if (v21)
    {
      if (!(v11 & 0x400 | a5) || a5 == 30 && (v11 & 0x900) == 0x900)
      {
        v26 = si_addrinfo_list(a1, v11, v25, a7, (uint64_t)&v32, 0, v29, 0, 0, 0);
        if (v26)
        {
          v27 = (uint64_t)v26;
          v21 = si_list_concat(v21, (uint64_t)v26);
          si_list_release(v27);
        }
      }
      return _gai_sort_list((unsigned int *)v21, v11);
    }
    return 0;
  }
  return result;
}

uint64_t _gai_numerichost(char *a1, int *a2, int a3, int *a4, _QWORD *a5, unsigned int *a6)
{
  __int16 v8;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  int v18;
  uint64_t result;
  char *v20;
  char *v21;
  const char *v22;
  char v23;
  int v24;
  unsigned __int8 *v25;
  unsigned int v26;
  int v27;
  BOOL v28;
  unsigned int v29;

  v8 = a3;
  if (!a1)
  {
    v14 = *a2;
    if (*a2)
      v15 = v14 == 2;
    else
      v15 = 1;
    if (v15)
      goto LABEL_14;
    if (v14 != 30)
    {
LABEL_19:
      if (v14 != 30 && v14 != 0)
        return 1;
      *a5 = 0;
      a5[1] = 0;
      if ((a3 & 1) != 0)
        return 1;
      v18 = 0x1000000;
      goto LABEL_39;
    }
    if ((~a3 & 0x900) == 0)
    {
LABEL_14:
      if ((a3 & 1) != 0)
        v16 = 0;
      else
        v16 = 16777343;
      *a4 = v16;
    }
    v14 = *a2;
    goto LABEL_19;
  }
  v12 = inet_pton(2, a1, a4);
  if (!v12)
    v12 = _inet_aton_check();
  if (v12 == 1)
  {
    if (*a2 != 30)
    {
      if (!*a2)
      {
        v13 = 2;
LABEL_45:
        *a2 = v13;
        return 1;
      }
      return 1;
    }
    if ((v8 & 0x800) != 0)
    {
      *a5 = 0;
      a5[1] = 0;
      *((_WORD *)a5 + 5) = -1;
      v18 = *a4;
LABEL_39:
      *((_DWORD *)a5 + 3) = v18;
      return 1;
    }
    return 0xFFFFFFFFLL;
  }
  result = inet_pton(30, a1, a5);
  if ((_DWORD)result != 1)
    return result;
  v20 = strrchr(a1, 37);
  if (v20)
  {
    v21 = v20;
    v24 = v20[1];
    v22 = v20 + 1;
    v23 = v24;
    if (!v24)
      goto LABEL_36;
    v25 = (unsigned __int8 *)(v21 + 2);
    do
    {
      v26 = v23 - 48;
      v27 = *v25++;
      v23 = v27;
      if (v27)
        v28 = v26 >= 0xA;
      else
        v28 = 1;
    }
    while (!v28);
    if (v26 > 9)
      v29 = if_nametoindex(v22);
    else
LABEL_36:
      v29 = atoi(v22);
    *a6 = v29;
  }
  if (*a2 == 2)
    return 0xFFFFFFFFLL;
  if (!*a2)
  {
    v13 = 30;
    goto LABEL_45;
  }
  return 1;
}

void **si_list_concat(void **a1, uint64_t a2)
{
  void **v2;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t i;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  int v13;

  v2 = a1;
  if (a2)
  {
    v4 = *(_DWORD *)(a2 + 4);
    if (v4)
    {
      if (!a1)
      {
        v2 = (void **)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040216EE090uLL);
        *(_DWORD *)v2 = 1;
        v4 = *(_DWORD *)(a2 + 4);
      }
      v5 = reallocf(v2[2], 8 * (*((unsigned int *)v2 + 1) + (unint64_t)v4));
      v2[2] = v5;
      if (v5)
      {
        v8 = *(_DWORD *)(a2 + 4);
        if (v8)
        {
          for (i = 0; i < v8; *((_QWORD *)v2[2] + (v13 + i++)) = v10)
          {
            v10 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * i);
            if (v10)
            {
              v11 = (unsigned int *)(v10 + 12);
              do
                v12 = __ldaxr(v11);
              while (__stlxr(v12 + 1, v11));
              if ((v12 & 0x80000000) != 0)
                si_list_add_cold_1((uint64_t)v5, v6, v7);
              v8 = *(_DWORD *)(a2 + 4);
            }
            v13 = *((_DWORD *)v2 + 1);
          }
        }
        else
        {
          v13 = *((_DWORD *)v2 + 1);
        }
        *((_DWORD *)v2 + 1) = v13 + v8;
      }
      else
      {
        free(v2);
        v2 = 0;
        *__error() = 12;
      }
    }
  }
  return v2;
}

void **si_list_add(void **a1, uint64_t a2)
{
  void **v2;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = a1;
  if (a2)
  {
    if (!a1)
    {
      v4 = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040216EE090uLL);
      v2 = (void **)v4;
      if (!v4)
      {
LABEL_10:
        free(v2);
        v2 = 0;
        *__error() = 12;
        return v2;
      }
      *v4 = 1;
    }
    v5 = reallocf(v2[2], 8 * (*((_DWORD *)v2 + 1) + 1));
    v2[2] = v5;
    if (!v5)
      goto LABEL_10;
    v8 = (unsigned int *)(a2 + 12);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    if ((v9 & 0x80000000) != 0)
      si_list_add_cold_1((uint64_t)v5, v6, v7);
    v10 = v2[2];
    v11 = *((unsigned int *)v2 + 1);
    *((_DWORD *)v2 + 1) = v11 + 1;
    v10[v11] = a2;
    if (!v2[2])
      goto LABEL_10;
  }
  return v2;
}

addrinfo *si_list_to_addrinfo(addrinfo *result)
{
  addrinfo *v1;
  int ai_family;
  addrinfo *v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    ai_family = result->ai_family;
    if (!ai_family)
      return 0;
    result = (addrinfo *)si_item_to_addrinfo(*(_QWORD *)(*(_QWORD *)&result->ai_addrlen + 8 * (ai_family - 1)));
    v3 = result;
    v4 = (ai_family - 2);
    if ((int)v4 >= 0)
    {
      while (1)
      {
        result = (addrinfo *)si_item_to_addrinfo(*(_QWORD *)(*(_QWORD *)&v1->ai_addrlen + 8 * v4));
        if (!result)
          break;
        result->ai_next = v3;
        v3 = result;
        if (v4-- <= 0)
          return result;
      }
      freeaddrinfo(v3);
      return 0;
    }
  }
  return result;
}

_QWORD *si_item_to_addrinfo(uint64_t a1)
{
  _DWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  size_t v6;
  void *v7;
  const char *v8;
  char *v9;

  if (!a1)
    return 0;
  v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1030040D19128EAuLL);
  v3 = v2;
  if (v2)
  {
    v5 = *(_OWORD *)(a1 + 32);
    v4 = a1 + 32;
    *(_OWORD *)v2 = v5;
    v6 = *(unsigned int *)(v4 + 16);
    v2[4] = v6;
    v7 = malloc_type_calloc(1uLL, v6, 0x5B09010EuLL);
    v3[4] = v7;
    if (!v7
      || (memcpy(v7, (const void *)(v4 + 20), *((unsigned int *)v3 + 4)), (v8 = *(const char **)(v4 + 152)) != 0)
      && (v9 = strdup(v8), (v3[3] = v9) == 0))
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

unsigned int *_gai_sort_list(unsigned int *a1, __int16 a2)
{
  unsigned int *v2;
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _BOOL4 v10;
  size_t v11;
  unsigned int *v12;
  unsigned int *v14;
  void *v15;
  unint64_t v16;
  unint64_t i;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = a1;
  if (a1)
  {
    v3 = a1[1];
    if (v3)
    {
      v4 = 0;
      v5 = 0;
      v6 = *((_QWORD *)a1 + 2);
      v7 = a1[1];
      do
      {
        v8 = *(_DWORD **)v6;
        if (*(_DWORD *)(*(_QWORD *)v6 + 36) == 30)
        {
          if (v8[15] || v8[16] || v8[17] != -65536)
            ++v4;
          else
            ++v5;
        }
        v6 += 8;
        --v7;
      }
      while (v7);
    }
    else
    {
      v5 = 0;
      v4 = 0;
    }
    v10 = (a2 & 0x100) == 0 && v4 != 0;
    if ((a2 & 0x800) == 0)
      v10 = 1;
    if (v10 && v5)
    {
      v11 = v3 - v5;
      if (v3 == v5)
        return 0;
      v14 = (unsigned int *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040216EE090uLL);
      if (!v14)
        return v2;
      v12 = v14;
      *v14 = *v2;
      v14[1] = v11;
      v15 = malloc_type_calloc(v11, 8uLL, 0x2004093837F09uLL);
      *((_QWORD *)v12 + 2) = v15;
      if (!v15)
      {
        free(v12);
        return v2;
      }
      v12[2] = 0;
      v16 = v2[1];
      if ((_DWORD)v16)
      {
        for (i = 0; i < v16; ++i)
        {
          v18 = *(unsigned int **)(*((_QWORD *)v2 + 2) + 8 * i);
          if (v18[9] != 30 || v18[15] || v18[16] || v18[17] != -65536)
          {
            v19 = *((_QWORD *)v12 + 2);
            v20 = v12[2];
            v12[2] = v20 + 1;
            *(_QWORD *)(v19 + 8 * v20) = v18;
          }
          else
          {
            si_item_release(v18);
            v16 = v2[1];
          }
        }
      }
      v12[2] = 0;
      free(*((void **)v2 + 2));
      free(v2);
      v3 = v12[1];
    }
    else
    {
      v12 = a1;
    }
    qsort(*((void **)v12 + 2), v3, 8uLL, (int (__cdecl *)(const void *, const void *))_gai_addr_sort);
    return v12;
  }
  return v2;
}

_OWORD *si_addrinfo_v6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;

  if (*a6 == 254 && (a6[1] & 0xC0) == 0x80 && *((_WORD *)a6 + 1))
  {
    v8 = __rev16(*((unsigned __int16 *)a6 + 1));
    if ((_DWORD)a7)
      a7 = a7;
    else
      a7 = v8;
  }
  return LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
}

uint64_t search_wants_addrinfo(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    if (v1)
    {
      v3 = 0;
      result = search_get_module(v1, 0xFu, &v3);
      if (result)
      {
        v2 = *(_QWORD *)(v1 + 432);
        while (result == v2 || !*(_QWORD *)(*(_QWORD *)(result + 40) + 288))
        {
          result = search_get_module(v1, 0xFu, &v3);
          if (!result)
            return result;
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t search_addrinfo(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t v9;
  uint64_t module;
  uint64_t (*v11)(uint64_t);
  int v12;

  if (a9)
    *a9 = 104;
  if (result)
  {
    v9 = *(_QWORD *)(result + 32);
    if (v9)
    {
      v12 = 0;
      while (1)
      {
        module = search_get_module(v9, 0xFu, &v12);
        if (!module)
          break;
        if (module != *(_QWORD *)(v9 + 432))
        {
          v11 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(module + 40) + 288);
          if (v11)
          {
            result = v11(module);
            if (result)
              return result;
          }
        }
      }
      result = 0;
      if (a9 && v12 >= 1)
      {
        result = 0;
        *a9 = 108;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void **mdns_addrinfo(uint64_t a1, char *a2, const char *a3, int a4, unsigned int a5, unsigned int a6, uint64_t a7, char *a8, int *a9)
{
  unsigned int v15;
  int v16;
  unsigned int v17;
  void **v18;
  int v19;
  unsigned __int8 *v20;
  int *v21;
  uint64_t v22;
  uint64_t *v24;
  uint64_t *v25;
  unsigned int v28;
  unsigned __int16 v29;
  _OWORD v30[2];
  uint64_t v31;
  _OWORD v32[2];
  uint64_t v33;
  _OWORD v34[2];
  uint64_t v35;
  __int128 v36;
  int v37;

  if (!a1)
    goto LABEL_20;
  if (a4 == 30)
  {
    v15 = (a7 >> 11) & 1;
LABEL_7:
    v16 = 1;
    goto LABEL_8;
  }
  if (a4 != 2)
  {
    if (a4)
      return 0;
    v15 = 1;
    goto LABEL_7;
  }
  v16 = 0;
  v15 = 1;
LABEL_8:
  if (a9)
    *a9 = 0;
  _mdns_debug_message(";; mdns_addrinfo node %s serv %s\n", a2, a3);
  v35 = 0;
  v34[0] = 0u;
  v32[0] = 0u;
  v33 = 0;
  memset(v30, 0, sizeof(v30));
  v31 = 0;
  v34[1] = 0x400000002uLL;
  v32[1] = 0x100000001EuLL;
  if ((v15 & v16) == 1)
  {
    v28 = a6;
    v17 = 0;
    *(_QWORD *)&v30[0] = v34;
    *((_QWORD *)&v30[0] + 1) = v32;
    goto LABEL_16;
  }
  if (v15)
  {
    v28 = a6;
    *(_QWORD *)&v30[0] = v34;
    v17 = 1;
    goto LABEL_16;
  }
  if (!v16)
  {
LABEL_20:
    if (a9)
    {
      v18 = 0;
      v19 = 3;
      goto LABEL_22;
    }
    return 0;
  }
  v28 = a6;
  *((_QWORD *)&v30[0] + 1) = v32;
  v17 = 28;
LABEL_16:
  v37 = 0;
  v36 = 0uLL;
  v29 = 0;
  if ((a7 & 0x1000) != 0)
  {
    if (!a3)
    {
      v29 = 0;
      if ((a7 & 4) == 0)
        goto LABEL_26;
LABEL_34:
      if (!a2)
        return 0;
      if (a4 == 2)
      {
        v20 = 0;
        v37 = *(_DWORD *)a2;
        v21 = &v37;
        v22 = v28;
      }
      else
      {
        v22 = v28;
        v21 = 0;
        if (a4 == 30)
        {
          v36 = *(_OWORD *)a2;
          v20 = (unsigned __int8 *)&v36;
        }
        else
        {
          v20 = 0;
        }
      }
      return si_addrinfo_list(a1, a7, a5, v22, (uint64_t)v21, v20, v29, 0, 0, 0);
    }
    v29 = *(_WORD *)a3;
  }
  else if (_gai_serv_to_port(a3, v28, &v29))
  {
    if (a9)
    {
      v18 = 0;
      v19 = 108;
LABEL_22:
      *a9 = v19;
      return v18;
    }
    return 0;
  }
  if ((a7 & 4) != 0)
    goto LABEL_34;
LABEL_26:
  if (!a2)
    return 0;
  if (_mdns_search(a2, 1u, v17, a8, (unsigned __int16)(32 * a7) & 0x8000, 0, 0, (uint64_t *)v30)
    || SHIDWORD(v35) <= 0 && SHIDWORD(v33) < 1)
  {
    v18 = 0;
    if (a9)
      *a9 = 108;
  }
  else
  {
    if (v15)
      v24 = (uint64_t *)v34;
    else
      v24 = 0;
    if (v16)
      v25 = (uint64_t *)v32;
    else
      v25 = 0;
    v18 = si_addrinfo_list_from_hostent(a1, a7, a5, v28, v29, 0, v24, v25);
  }
  _mdns_reply_clear((uint64_t)v30);
  return v18;
}

uint64_t _mdns_search_ex(char *a1, unsigned int a2, unsigned int a3, uint32_t a4, int a5, uint64_t a6, unsigned int *a7, uint64_t *a8)
{
  uint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  char v21;
  uint64_t *v22;
  unsigned int *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  int v27;
  DNSServiceErrorType Connection;
  BOOL v29;
  int start;
  int v31;
  int v32;
  int v33;
  uint8_t *v34;
  _BYTE *v35;
  int v36;
  DNSServiceErrorType v37;
  DNSServiceErrorType v38;
  uint64_t v39;
  char v40;
  uint8_t *v41;
  int is_complete;
  char v43;
  const char *v44;
  int v45;
  BOOL v46;
  int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __darwin_time_t v52;
  uint64_t v53;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  __darwin_time_t v58;
  unint64_t v59;
  __darwin_time_t v60;
  __darwin_time_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t *v64;
  _BYTE *v65;
  DNSServiceErrorType v66;
  int v67;
  uint8_t *v68;
  _BOOL4 clear;
  const char *v70;
  _BOOL4 v71;
  BOOL v72;
  const char *v73;
  uint64_t v75;
  unsigned int *v76;
  uint8_t *v77;
  const void *v78;
  DNSServiceErrorType v79;
  uint64_t *v80;
  int v81;
  int v82;
  int v83;
  uint32_t v84;
  int v85;
  int v86[2];
  int kq;
  timespec v89;
  __int16 v90;
  int v91;
  timespec timeout;
  timespec v93;
  __darwin_time_t v94;
  uint64_t v95;
  kevent changelist;
  timeval v97;
  uint8_t buf[16];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  _BYTE v104[80];
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C874D8];
  memset(&changelist, 0, sizeof(changelist));
  v91 = 0;
  si_inet_config(&v91, 0);
  if (v91)
    --v91;
  if (!a1)
    return 0xFFFFFFFFLL;
  v85 = a5;
  *(_QWORD *)v86 = a6;
  v80 = a8;
  if (pthread_is_threaded_np() && pthread_main_np() && os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191F86000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "Warning: Libinfo call to mDNSResponder on main thread", buf, 2u);
  }
  v94 = 0;
  v95 = 0;
  v93 = (timespec)xmmword_191FAB870;
  _mdns_deadline(&v94, &v93);
  timeout = v93;
  memset(buf, 0, sizeof(buf));
  gettimeofday((timeval *)buf, 0);
  v15 = *(_QWORD *)buf;
  v16 = *(_DWORD *)&buf[8];
  *(_OWORD *)buf = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v90 = 0;
  memset(v104, 0, sizeof(v104));
  v103 = 0;
  v105 = 0;
  v17 = kqueue();
  changelist.ident = 1;
  *(_DWORD *)&changelist.filter = 2228214;
  memset(&changelist.fflags, 0, 20);
  kq = v17;
  v18 = 0;
  LODWORD(v19) = 0;
  if (kevent(v17, &changelist, 1, 0, 0, 0))
    goto LABEL_111;
  LODWORD(v19) = 0;
  v75 = 1000 * v16;
  if (a3 <= 1)
    v20 = 1;
  else
    v20 = a3;
  v83 = v20;
  v84 = a4;
  v81 = 0;
  v82 = 3;
  v21 = 1;
  v22 = a8;
  v76 = a7;
  while (1)
  {
    _mdns_debug_message(";; _mdns_search wait loop\n");
    if ((v21 & 1) != 0)
    {
      v23 = a7;
      while (1)
      {
        pthread_mutex_lock(&_mdns_mutex);
        if ((int)v19 >= 1)
        {
          v24 = v19;
          v25 = buf;
          do
          {
            _mdns_query_clear((uint64_t)v25);
            v25 += 88;
            --v24;
          }
          while (v24);
        }
        if (_mdns_sdref)
        {
          v26 = *(_QWORD *)v86;
          v27 = v85;
        }
        else
        {
          v26 = *(_QWORD *)v86;
          v27 = v85;
          if (_mdns_old_sdref)
          {
            ++_mdns_generation;
            DNSServiceRefDeallocate((DNSServiceRef)_mdns_old_sdref);
            _mdns_old_sdref = 0;
          }
          Connection = DNSServiceCreateConnection((DNSServiceRef *)&_mdns_sdref);
          v29 = v82-- < 1;
          if (v29 || Connection)
          {
            pthread_mutex_unlock(&_mdns_mutex);
            v64 = 0;
            v18 = 0;
            LODWORD(v19) = 0;
            v65 = 0;
            goto LABEL_116;
          }
        }
        start = _mdns_query_start((uint64_t)buf, v22, v26, a7, a1, a2, v83, v84, v27, kq);
        if (start | a3)
        {
          v31 = start;
          LODWORD(v19) = 1;
        }
        else
        {
          v31 = _mdns_query_start((uint64_t)v104, v22, v26, a7, a1, a2, 28, v84, v27, kq);
          LODWORD(v19) = 2;
        }
        if (!v31)
          break;
        _mdns_debug_message(";; initialization error %d\n", v31);
        a7 = v23;
        if ((v31 + 65569) > 0x20 || ((1 << (v31 + 33)) & 0x110000041) == 0)
        {
          pthread_mutex_unlock(&_mdns_mutex);
          goto LABEL_110;
        }
        if (_mdns_sdref)
        {
          ++_mdns_generation;
          DNSServiceRefDeallocate((DNSServiceRef)_mdns_sdref);
          _mdns_sdref = 0;
        }
        pthread_mutex_unlock(&_mdns_mutex);
        _mdns_debug_message(";; _mdns_search wait loop\n");
      }
      changelist.ident = DNSServiceRefSockFD((DNSServiceRef)_mdns_sdref);
      *(_DWORD *)&changelist.filter = 0x1FFFF;
      *(_QWORD *)((unint64_t)&changelist | 0xC) = 0;
      *(_QWORD *)(((unint64_t)&changelist | 0xC) + 8) = 0;
      *(_DWORD *)(((unint64_t)&changelist | 0xC) + 0x10) = 0;
      v32 = kq;
      v33 = kevent(kq, &changelist, 1, 0, 0, 0);
      pthread_mutex_unlock(&_mdns_mutex);
      a7 = v23;
      if (v33)
        goto LABEL_110;
    }
    else
    {
      v32 = kq;
    }
    if ((int)v19 <= 0)
      v34 = 0;
    else
      v34 = buf;
    v35 = v104;
    if ((int)v19 <= 1)
      v35 = 0;
    v77 = v34;
    v78 = v35;
    _mdns_debug_message(";; set kevent timeout %ld.%ld [ctx %p %p]\n", timeout.tv_sec, timeout.tv_nsec, v34, v35);
    *__error() = 0;
    if (kevent(v32, 0, 0, &changelist, 1, &timeout) < 0 && *__error() != 4)
      break;
    pthread_mutex_lock(&_mdns_mutex);
    v89.tv_sec = 0;
    v89.tv_nsec = 0;
    v36 = kevent(v32, 0, 0, &changelist, 1, &v89);
    if (!_mdns_sdref)
    {
      _mdns_debug_message(";; _mdns_sdref is NULL, initialize = true\n");
      v38 = 0;
      goto LABEL_49;
    }
    if (v36 >= 1 && (unsigned __int16)changelist.filter == 0xFFFF)
    {
      _mdns_debug_message(";; _mdns_search calling DNSServiceProcessResult\n");
      v37 = DNSServiceProcessResult((DNSServiceRef)_mdns_sdref);
      _mdns_debug_message(";; DNSServiceProcessResult -> %d\n", v37);
      v38 = v37;
      v21 = 0;
      if ((v37 + 65569) <= 0x1C && ((1 << (v37 + 33)) & 0x10000041) != 0)
      {
        _mdns_debug_message(";; DNSServiceProcessResult status %d [ctx %p %p]\n", v37, v77, v78);
        ++_mdns_generation;
        DNSServiceRefDeallocate((DNSServiceRef)_mdns_sdref);
        v38 = 0;
        _mdns_sdref = 0;
LABEL_49:
        v21 = 1;
      }
    }
    else
    {
      if (v36 || changelist.filter != -10)
        _mdns_debug_message(";; kevent m=%d ev.filter=0x%08x\n");
      else
        _mdns_debug_message(";; kevent wakeup\n");
      v21 = 0;
      v38 = 0;
    }
    if ((int)v19 < 1)
    {
      v66 = v38;
      pthread_mutex_unlock(&_mdns_mutex);
      if (v66)
LABEL_106:
        _mdns_debug_message(";; DNSServiceProcessResult error status %d [ctx %p %p]\n");
      else
LABEL_107:
        _mdns_debug_message(";; [%s type %d class %d] done [ctx %p %p]\n");
      a7 = v76;
LABEL_110:
      v18 = 0;
      goto LABEL_111;
    }
    v79 = v38;
    v39 = 0;
    v40 = 1;
    v41 = buf;
    do
    {
      is_complete = _mdns_query_is_complete((uint64_t)v41, (_BYTE *)&v90 + v39);
      v43 = is_complete;
      v44 = "false";
      if (is_complete)
        v44 = "true";
      _mdns_debug_message(";; ctx %d %p error=%d complete=%s\n", v39, v41, *((_DWORD *)v41 + 17), v44);
      v45 = *((_DWORD *)v41 + 17);
      if ((v43 & 1) != 0 || v45)
      {
        if (*((_DWORD *)v41 + 10) == 1)
        {
          v46 = v45 == 0;
          if (v45)
            v47 = 2;
          else
            v47 = 1;
          v81 = v47;
          v48 = "GOT_DATA";
          if (!v46)
            v48 = "GOT_ERROR";
          _mdns_debug_message(";; type ns_t_a got_a_response=%s ctx %p\n", v48, v41);
        }
        _mdns_debug_message(";; [%s type %d class %d] finished processing ctx %p\n");
      }
      else
      {
        v40 = 0;
        _mdns_debug_message(";; [%s type %d class %d] continuing ctx %p\n");
      }
      ++v39;
      v41 += 88;
    }
    while (v19 != v39);
    pthread_mutex_unlock(&_mdns_mutex);
    if (v79)
      goto LABEL_106;
    if ((v40 & 1) != 0)
      goto LABEL_107;
    if (!(v90 | HIBYTE(v90)))
    {
      a7 = v76;
      v22 = v80;
      if (v81 != 1)
        goto LABEL_98;
      v97.tv_sec = 0;
      *(_QWORD *)&v97.tv_usec = 0;
      gettimeofday(&v97, 0);
      v49 = 1000 * v97.tv_usec;
      v29 = v49 < v75;
      v50 = v49 - v75;
      if (v29)
        v51 = v50 + 1000000000;
      else
        v51 = v50;
      v52 = v97.tv_sec - v15 + (v50 >> 63);
      v53 = 2;
      if (!v91)
        v53 = 10;
      if (v51 < 20000001 && v52 == 0)
        v53 = 5;
      v55 = 2 * v52;
      v56 = 2 * v51;
      if (v51 >= 500000001)
      {
        v55 += v56 / 0x3B9ACA00;
        v56 %= 0x3B9ACA00uLL;
      }
      v93.tv_sec = v55 + v53;
      v93.tv_nsec = v56;
      if (timeout.tv_sec - (v55 + v53) - (timeout.tv_nsec < (uint64_t)v56) < 0)
        goto LABEL_98;
      _mdns_debug_message(";; new timeout [%s type %d class %d] (waiting for AAAA) %ld.%ld [ctx %p %p]\n");
      goto LABEL_97;
    }
    v97.tv_sec = 0;
    *(_QWORD *)&v97.tv_usec = 0;
    gettimeofday(&v97, 0);
    v57 = 1000 * v97.tv_usec;
    v58 = v97.tv_sec - v15;
    v59 = v57 - v75;
    v22 = v80;
    if (v57 - v75 < 0)
    {
      v59 += 1000000000;
      v60 = v58 + 4;
      v93.tv_sec = v60;
      goto LABEL_93;
    }
    v60 = v58 + 5;
    v93.tv_sec = v60;
    v93.tv_nsec = v57 - v75;
    if (v59 > 0x3B9ACA00)
    {
      v60 += v59 / 0x3B9ACA00;
      v93.tv_sec = v60;
      v59 %= 0x3B9ACA00uLL;
LABEL_93:
      a7 = v76;
      v93.tv_nsec = v59;
      goto LABEL_95;
    }
    a7 = v76;
LABEL_95:
    if (timeout.tv_sec - v60 - (timeout.tv_nsec < (uint64_t)v59) >= 0)
    {
      _mdns_debug_message(";; new timeout [%s type %d class %d] (waiting for more) %ld.%ld [ctx %p %p]\n");
LABEL_97:
      _mdns_deadline(&v94, &v93);
    }
LABEL_98:
    v97.tv_sec = 0;
    *(_QWORD *)&v97.tv_usec = 0;
    gettimeofday(&v97, 0);
    v61 = v94 - v97.tv_sec;
    v62 = v95 - 1000 * v97.tv_usec;
    timeout.tv_sec = v94 - v97.tv_sec;
    timeout.tv_nsec = v62;
    if (v62 < 0)
    {
      timeout.tv_sec = --v61;
      timeout.tv_nsec = v62 + 1000000000;
    }
    if (v61 < 0)
    {
      _mdns_debug_message(";; [%s type %d class %d] timeout [ctx %p %p]\n", a1, a3, a2, v77, v78);
      goto LABEL_110;
    }
  }
  v18 = -1;
LABEL_111:
  if ((int)v19 <= 0)
    v64 = 0;
  else
    v64 = buf;
  v65 = v104;
  if ((int)v19 <= 1)
    v65 = 0;
LABEL_116:
  _mdns_debug_message(";; finished _mdns_search loop [ctx %p %p]\n", v64, v65);
  pthread_mutex_lock(&_mdns_mutex);
  if ((int)v19 < 1)
  {
    v67 = 0;
  }
  else
  {
    v67 = 0;
    v19 = v19;
    v68 = buf;
    do
    {
      clear = _mdns_query_clear((uint64_t)v68);
      v67 |= clear;
      if (clear)
        v70 = "";
      else
        v70 = "in";
      _mdns_debug_message(";; _mdns_search ctx %p %scomplete\n", v68, v70);
      v68 += 88;
      --v19;
    }
    while (v19);
  }
  v71 = (v90 | HIBYTE(v90)) == 0;
  v72 = (v71 & v67) == 0;
  if ((v71 & v67) != 0)
    v73 = "";
  else
    v73 = "in";
  if (v72)
    v63 = 0xFFFFFFFFLL;
  else
    v63 = v18;
  _mdns_debug_message(";; _mdns_search overall %scomplete\n", v73);
  pthread_mutex_unlock(&_mdns_mutex);
  close_NOCANCEL();
  if (a7)
    *a7 = DWORD2(v99);
  _mdns_debug_message(";; _mdns_search exit res %d\n", v63);
  return v63;
}

void _mdns_query_callback(uint64_t a1, int a2, unsigned int a3, int a4, char *a5, signed int a6, unsigned int a7, unsigned int a8, unsigned __int16 *a9, unsigned int a10, _QWORD *a11)
{
  const char *v18;
  uint64_t i;
  int *v20;
  char *v21;
  unsigned __int16 *v22;
  unsigned int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char **v27;
  char *v28;
  _WORD *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char **v35;
  const char *v36;
  unint64_t v37;
  int v38;
  char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unsigned int v45;
  size_t v46;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  kevent changelist;
  __int128 v54;

  v18 = "";
  if ((a2 & 1) != 0)
    v18 = " (kDNSServiceFlagsMoreComing is set)";
  _mdns_debug_message(";; _mdns_query_callback ctx %p flags=0x%08x%s\n", a11, a2, v18);
  *((_DWORD *)a11 + 16) = a2;
  *((_DWORD *)a11 + 17) = a4;
  *((_WORD *)a11 + 22) = a6;
  if ((a2 & 1) == 0)
  {
    for (i = in_flight; i; i = *(_QWORD *)(i + 80))
    {
      if ((*(_BYTE *)(i + 64) & 1) != 0)
      {
        _mdns_debug_message(";; cleared kDNSServiceFlagsMoreComing flag for ctx %p\n", (const void *)i);
        *(_DWORD *)(i + 64) &= ~1u;
      }
    }
  }
  v54 = 0uLL;
  if (a4)
  {
    _mdns_debug_message(";; [%s type %hu class %hu]: error %d [ctx %p]\n");
    goto LABEL_10;
  }
  v22 = a9;
  if (a6 == 28 && a8 == 16 && *(unsigned __int8 *)a9 == 254 && (*((_BYTE *)a9 + 1) & 0xC0) == 0x80)
  {
    v54 = *(_OWORD *)a9;
    WORD1(v54) = bswap32(a3) >> 16;
    v22 = (unsigned __int16 *)&v54;
  }
  v23 = a10;
  v24 = *a11;
  if (!*a11)
    goto LABEL_66;
  if (!*(_DWORD *)(v24 + 32))
    *(_DWORD *)(v24 + 32) = a3;
  _mdns_hostent_append_alias((_QWORD *)a11[1], a5);
  if (*(_QWORD *)(v24 + 24) - 1 >= (unint64_t)a10)
    *(_QWORD *)(v24 + 24) = a10;
  if (a6 <= 11)
  {
    if (a6 == 1)
      goto LABEL_32;
    if (a6 != 5)
      goto LABEL_48;
    v25 = (char *)_mdns_parse_domain_name((uint64_t)v22, a8);
    _mdns_hostent_append_alias((_QWORD *)a11[1], v25);
    _mdns_debug_message(";; [%s type %hu class %hu] cname %s [ctx %p]\n", a5, 5, a7, v25, a11);
LABEL_40:
    free(v25);
    if (v25)
      goto LABEL_66;
    goto LABEL_60;
  }
  if (a6 == 12)
  {
    v25 = (char *)_mdns_parse_domain_name((uint64_t)v22, a8);
    v27 = (char **)a11[1];
    if (v27 && !*v27)
    {
      v28 = _mdns_canonicalize(v25);
      v27 = (char **)a11[1];
      *v27 = v28;
    }
    _mdns_hostent_append_alias(v27, v25);
    goto LABEL_40;
  }
  if (a6 == 33)
  {
    v29 = malloc_type_calloc(1uLL, 0x18uLL, 0x103004089A9B416uLL);
    if (!v29)
      goto LABEL_66;
    v30 = v29;
    if (a8 <= 5
      || (*v29 = bswap32(*v22) >> 16,
          v29[1] = bswap32(v22[1]) >> 16,
          v29[2] = bswap32(v22[2]) >> 16,
          v31 = _mdns_parse_domain_name((uint64_t)(v22 + 3), a8 - 6),
          (v30[1] = v31) == 0))
    {
      free(v30);
      goto LABEL_60;
    }
    v32 = *(_QWORD *)(v24 + 16);
    if (v32)
    {
      do
      {
        v33 = v32;
        v32 = *(_QWORD *)(v32 + 16);
      }
      while (v32);
      *(_QWORD *)(v33 + 16) = v30;
    }
    else
    {
      *(_QWORD *)(v24 + 16) = v30;
    }
    goto LABEL_66;
  }
  if (a6 != 28)
  {
LABEL_48:
    if ((_mdns_debug & 1) == 0)
      goto LABEL_66;
LABEL_60:
    _mdns_debug_message(";; [%s type %hu class %hu]: malformed reply [ctx %p]\n");
    goto LABEL_10;
  }
LABEL_32:
  v26 = a11[1];
  if (!v26)
    goto LABEL_60;
  if (a6 == 1)
  {
    if (*(_DWORD *)(v26 + 16) != 2)
      goto LABEL_60;
  }
  else if (*(_DWORD *)(v26 + 16) != 30)
  {
    goto LABEL_60;
  }
  if (*(_DWORD *)(v26 + 20) > (signed int)a8)
    goto LABEL_60;
  if (!*(_QWORD *)v26)
  {
    v34 = _mdns_canonicalize(a5);
    v35 = (char **)a11[1];
    *v35 = v34;
    v52 = *(unsigned int *)(v26 + 32);
    if ((int)v52 >= 1 && (v36 = v34) != 0)
    {
      v50 = v26;
      v49 = v35;
      v37 = 0;
      v51 = *(_QWORD *)(v26 + 8);
      v38 = 8 * v52;
      while (1)
      {
        v39 = *(char **)(v51 + 8 * v37);
        v40 = v36;
        if (!strcmp(v39, v36))
          break;
        ++v37;
        v38 -= 8;
        v36 = v40;
        if (v37 >= v52)
        {
          v26 = (uint64_t)v49;
          goto LABEL_64;
        }
      }
      free(v39);
      memmove((void *)(*(_QWORD *)(v50 + 8) + 8 * v37), (const void *)(*(_QWORD *)(v50 + 8) + 8 * v37 + 8), v38);
      --*(_DWORD *)(v50 + 32);
      v26 = a11[1];
LABEL_64:
      v23 = a10;
    }
    else
    {
      v26 = (uint64_t)v35;
    }
  }
  _mdns_hostent_append_addr(v26, v22, *(_DWORD *)(v26 + 20));
LABEL_66:
  v41 = a11[2];
  if (v41)
  {
    v42 = a11[3];
    v43 = a11[4] - v42;
    if (v43 <= 0xB)
    {
      _mdns_debug_message(";; [%s type %hu class %hu]: malformed reply (too small) [ctx %p]\n");
      goto LABEL_10;
    }
    v44 = v41 + v42;
    v45 = _mdns_pack_domain_name(a5, v41 + v42, a11[4] - v42);
    if ((v45 & 0x80000000) != 0)
    {
      _mdns_debug_message(";; [%s type %hu class %hu]: name mismatch [ctx %p]\n");
      goto LABEL_10;
    }
    if (v43 < a8 + v45 + 10)
    {
      _mdns_debug_message(";; [%s type %hu class %hu]: insufficient buffer space for reply [ctx %p]\n");
      goto LABEL_10;
    }
    v46 = a8;
    v47 = v44 + v45;
    *(_WORD *)v47 = __rev16(a6);
    *(_WORD *)(v47 + 2) = __rev16(a7);
    *(_DWORD *)(v47 + 4) = bswap32(v23);
    *(_WORD *)(v47 + 8) = __rev16(a8);
    v48 = v47 + 10;
    memcpy((void *)(v47 + 10), v22, v46);
    *(_WORD *)(a11[2] + 6) = bswap32((bswap32(*(_DWORD *)(a11[2] + 6)) >> 16) + 1) >> 16;
    a11[3] = v48 + v46 - a11[2];
  }
  _mdns_debug_message(";; [%s type %hu class %hu] reply [ctx %p]\n");
LABEL_10:
  if (*((_DWORD *)a11 + 18) != -1)
  {
    _mdns_debug_message(";; _mdns_query_callback sending kevent wakeup\n");
    changelist.ident = 1;
    *(_QWORD *)&changelist.filter = 0x10000000000FFF6;
    changelist.data = 0;
    changelist.udata = 0;
    if (kevent(*((_DWORD *)a11 + 18), &changelist, 1, 0, 0, 0))
    {
      v20 = __error();
      v21 = strerror(*v20);
      _mdns_debug_message(";; kevent EV_TRIGGER: %s [ctx %p]\n", v21, a11);
    }
  }
}

void _mdns_debug_message(char *a1, ...)
{
  char *v1;
  char *v2[2];
  va_list va;

  va_start(va, a1);
  v2[0] = 0;
  if (a1)
  {
    if (_mdns_debug == 1)
    {
      va_copy((va_list)&v2[1], va);
      vasprintf(v2, a1, va);
      v1 = v2[0];
      if (v2[0])
      {
        if (_mdns_debug == 1)
        {
          fputs(v2[0], (FILE *)*MEMORY[0x1E0C874E8]);
          v1 = v2[0];
        }
        free(v1);
      }
    }
  }
}

void _mdns_hostent_append_alias(_QWORD *a1, char *a2)
{
  char *v4;
  char *v5;
  int v6;
  void *v7;
  uint64_t v8;
  const char **v9;
  _QWORD *v10;
  uint64_t v11;

  _mdns_debug_message(";; _mdns_hostent_append_alias(%p, %s)\n", a1, a2);
  if (a1)
  {
    if (a2)
    {
      v4 = _mdns_canonicalize(a2);
      if (v4)
      {
        v5 = v4;
        if (!*a1 || strcmp((const char *)*a1, v4))
        {
          v6 = *((_DWORD *)a1 + 8);
          v7 = (void *)a1[1];
          if (v6 >= 1)
          {
            v8 = *((unsigned int *)a1 + 8);
            v9 = (const char **)a1[1];
            while (strcmp(*v9, v5))
            {
              ++v9;
              if (!--v8)
                goto LABEL_10;
            }
            goto LABEL_14;
          }
LABEL_10:
          v10 = reallocf(v7, 8 * (v6 + 2));
          a1[1] = v10;
          if (v10)
          {
            v11 = *((int *)a1 + 8);
            v10[v11++] = v5;
            *((_DWORD *)a1 + 8) = v11;
            v10[v11] = 0;
            return;
          }
          *((_DWORD *)a1 + 8) = 0;
        }
LABEL_14:
        free(v5);
      }
    }
  }
}

char *_mdns_canonicalize(char *result)
{
  int v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  if (result)
  {
    result = strdup(result);
    if (result)
    {
      v1 = *result;
      if (*result)
      {
        v2 = (unsigned __int8 *)(result + 1);
        v3 = 0xFFFFFFFF00000000;
        do
        {
          if ((v1 - 65) <= 0x19)
            *(v2 - 1) = v1 + 32;
          v4 = *v2++;
          v1 = v4;
          v3 += 0x100000000;
        }
        while (v4);
        v5 = v3 >> 32;
        if (result[v5] == 46)
          result[v5] = 0;
      }
    }
  }
  return result;
}

uint64_t _mdns_hostent_append_addr(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  _mdns_debug_message(";; _mdns_hostent_append_addr(%p, %p, %u)\n", (const void *)a1, a2, a3);
  result = 0;
  if (a1 && a2 && a3)
  {
    v7 = a3;
    v8 = malloc_type_malloc(a3, 0xBA8E3FC7uLL);
    if (v8)
    {
      v9 = v8;
      memcpy(v8, a2, v7);
      v10 = reallocf(*(void **)(a1 + 24), 8 * *(int *)(a1 + 36) + 16);
      *(_QWORD *)(a1 + 24) = v10;
      if (v10)
      {
        v11 = v10;
        result = 0;
        v12 = *(int *)(a1 + 36);
        v11[v12++] = v9;
        *(_DWORD *)(a1 + 36) = v12;
        v11[v12] = 0;
        return result;
      }
      *(_DWORD *)(a1 + 36) = 0;
      free(v9);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _mdns_query_is_complete(uint64_t a1, _BYTE *a2)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  if (!a1)
    return 1;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    if (a2)
      *a2 = 1;
    _mdns_debug_message(";; mdns is_complete type %d ctx %p more coming - incomplete\n");
  }
  else
  {
    if (a2)
      *a2 = 0;
    _mdns_debug_message(";; mdns is_complete type %d ctx %p clear more coming - complete\n",
      *(_DWORD *)(a1 + 40),
      (const void *)a1);
    v3 = *(unsigned __int16 *)(a1 + 44);
    if (*(_DWORD *)(a1 + 40) == v3)
    {
      if (*(unsigned __int16 *)(a1 + 44) > 0x1Bu)
      {
        if (v3 == 33)
        {
          if (*(_QWORD *)a1 && *(_QWORD *)(*(_QWORD *)a1 + 16))
          {
            _mdns_debug_message(";; mdns is_complete type %d ctx %p srv %p complete -> true\n");
            goto LABEL_26;
          }
          goto LABEL_28;
        }
        if (v3 != 28)
          goto LABEL_27;
      }
      else if (v3 != 1)
      {
        if (v3 == 12)
        {
          v4 = *(_QWORD **)(a1 + 8);
          if (v4 && *v4)
          {
            _mdns_debug_message(";; mdns is_complete type %d ctx %p host name %s complete -> true\n");
LABEL_26:
            v7 = " - ";
            v5 = 1;
LABEL_29:
            _mdns_debug_message(";; mdns is_complete type %d ctx %p %scomplete\n",
              *(_DWORD *)(a1 + 40),
              (const void *)a1,
              v7);
            return v5;
          }
          goto LABEL_28;
        }
LABEL_27:
        _mdns_debug_message(";; mdns is_complete unexpected type %d ctx %p\n",
          *(unsigned __int16 *)(a1 + 44),
          (const void *)a1);
        goto LABEL_28;
      }
      v6 = *(_QWORD *)(a1 + 8);
      if (v6 && *(int *)(v6 + 36) >= 1)
      {
        _mdns_debug_message(";; mdns is_complete type %d ctx %p host addr count %d complete -> true\n");
        goto LABEL_26;
      }
LABEL_28:
      v5 = 0;
      v7 = " - in";
      goto LABEL_29;
    }
    _mdns_debug_message(";; mdns is_complete ctx %p type mismatch (%d != %d) - incomplete\n");
  }
  return 0;
}

uint64_t _mdns_query_start(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int *a4, char *__s, unsigned int a6, int a7, uint32_t a8, int a9, int a10)
{
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t RecordWithAttribute;
  uint64_t v22;
  int v23;
  char *v24;
  int v25;
  unsigned int v26;
  char *v27;
  unint64_t v29;
  unsigned int v30;
  BOOL v32;
  BOOL v33;

  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  if (a3 && a4)
  {
    *(_QWORD *)(a1 + 16) = a3;
    v17 = *a4;
    *(_QWORD *)(a1 + 32) = v17;
    if (v17 < 0x10
      || (*(_DWORD *)(a3 + 8) = 0,
          *(_QWORD *)a3 = 0,
          *(_QWORD *)a3 = *(_QWORD *)a3 & 0xFFFF0000F0060000 | (unsigned __int16)arc4random() | 0x10000810000,
          v18 = _mdns_pack_domain_name(__s, a3 + 12, (v17 - 12)),
          (v18 & 0x80000000) != 0))
    {
      v20 = -1;
    }
    else
    {
      v19 = a3 + v18;
      *(_WORD *)(v19 + 12) = bswap32(a7) >> 16;
      *(_WORD *)(v19 + 14) = bswap32(a6) >> 16;
      v20 = (int)(v18 + 16);
    }
    *(_QWORD *)(a1 + 24) = v20;
  }
  *(_QWORD *)(a1 + 56) = _mdns_sdref;
  *(_DWORD *)(a1 + 40) = a7;
  *(_DWORD *)(a1 + 48) = _mdns_generation;
  *(_DWORD *)(a1 + 72) = a10;
  if (a2)
  {
    *(_QWORD *)a1 = a2;
    RecordWithAttribute = 0xFFFFFFFFLL;
    if (a7 <= 11)
    {
      if (a7 == 1)
      {
LABEL_17:
        v22 = *a2;
LABEL_20:
        *(_QWORD *)(a1 + 8) = v22;
        goto LABEL_21;
      }
      if (a7 != 5)
        return RecordWithAttribute;
    }
    else
    {
      if (a7 == 12)
      {
        v22 = *a2;
        if (!*a2)
        {
          v22 = a2[1];
          if (!v22)
            return RecordWithAttribute;
        }
        goto LABEL_20;
      }
      if (a7 != 33)
      {
        if (a7 != 28)
          return RecordWithAttribute;
        ++a2;
        goto LABEL_17;
      }
    }
  }
LABEL_21:
  v23 = strlen(__s);
  if (!v23 || v23 - (__s[v23 - 1] == 46) != 72)
  {
LABEL_26:
    v25 = 0;
LABEL_27:
    v24 = 0;
    goto LABEL_28;
  }
  v24 = 0;
  v25 = 0;
  v26 = __s[58] - 56;
  if (v26 <= 0x2A && ((1 << v26) & 0x60000000603) != 0)
  {
    if (!strncasecmp(__s + 59, ".e.f.ip6.arpa", 0xDuLL))
    {
      v29 = 0;
      while (1)
      {
        v30 = __s[v29];
        if (__s[v29] < 48 || v30 - 58 < 7)
          break;
        v32 = v30 <= 0x66 && v30 - 71 >= 0x1A;
        if (!v32 || __s[v29 + 1] != 46)
          break;
        v33 = v29 > 0x37;
        v29 += 2;
        if (v33)
        {
          v25 = hexval[__s[48]] + 16 * hexval[__s[50]] + (hexval[__s[52]] << 8) + (hexval[__s[54]] << 12);
          if (!v25)
            goto LABEL_27;
          v24 = strdup(__s);
          if (v24)
          {
            v24[48] = 48;
            v24[50] = 48;
            v24[52] = 48;
            v24[54] = 48;
          }
          else
          {
            v25 = 0;
          }
          goto LABEL_28;
        }
      }
    }
    goto LABEL_26;
  }
LABEL_28:
  if (v24)
    v27 = v24;
  else
    v27 = __s;
  if (a8)
  {
    if (v25 && v25 != a8)
      return 0xFFFFFFFFLL;
  }
  else
  {
    a8 = v25;
  }
  _mdns_debug_message(";; mdns query %s type %d class %d ifindex %d [ctx %p]\n", v27, a7, a6, a8, (const void *)a1);
  RecordWithAttribute = DNSServiceQueryRecordWithAttribute((DNSServiceRef *)(a1 + 56), a9 | 0x15000, a8, v27, a7, a6, MEMORY[0x1E0C87CA8], (DNSServiceQueryRecordReply)_mdns_query_callback, (void *)a1);
  if (v27 != __s)
    free(v27);
  *(_QWORD *)(a1 + 80) = in_flight;
  in_flight = a1;
  return RecordWithAttribute;
}

BOOL _mdns_query_clear(uint64_t a1)
{
  int is_complete;
  _DNSServiceRef_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  unsigned __int8 v10;

  if (!a1)
    return 1;
  v10 = 0;
  is_complete = _mdns_query_is_complete(a1, &v10);
  v3 = *(_DNSServiceRef_t **)(a1 + 56);
  if (v3 && *(_DWORD *)(a1 + 48) == _mdns_generation)
    DNSServiceRefDeallocate(v3);
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = -1;
  v4 = &in_flight;
  v5 = in_flight;
  if (in_flight == a1)
  {
LABEL_9:
    *v4 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    while (v5)
    {
      v6 = v5;
      v5 = *(_QWORD *)(v5 + 80);
      if (v5 == a1)
      {
        v4 = (uint64_t *)(v6 + 80);
        goto LABEL_9;
      }
    }
  }
  *(_QWORD *)(a1 + 80) = 0;
  v7 = v10;
  if (v10)
    v8 = 1;
  else
    v8 = is_complete;
  if ((v8 & 1) == 0)
  {
    _mdns_hostent_clear(*(_QWORD *)(a1 + 8));
    *(_QWORD *)(a1 + 24) = -1;
    v7 = v10;
  }
  return (v7 | is_complete) != 0;
}

uint64_t si_inet_config(_DWORD *a1, _DWORD *a2)
{
  int v4;
  int v5;
  int v6;
  ifaddrs *v7;
  sockaddr *ifa_addr;
  int sa_family;
  uint64_t v10;
  ifaddrs *v12;
  int check;

  v12 = 0;
  pthread_mutex_lock(&net_config_mutex);
  check = 1;
  v4 = net_config_token;
  if ((net_config_token & 0x80000000) == 0)
    goto LABEL_29;
  if (notify_register_check("com.apple.system.config.network_change", &net_config_token))
  {
    net_config_token = -1;
    goto LABEL_9;
  }
  v4 = net_config_token;
  if ((net_config_token & 0x80000000) == 0)
  {
LABEL_29:
    if (notify_check(v4, &check))
    {
      check = 1;
    }
    else if (!check)
    {
      goto LABEL_20;
    }
  }
LABEL_9:
  if ((getifaddrs(&v12) & 0x80000000) == 0)
  {
    net_v4_count = 0;
    net_v6_count = 0;
    if (v12)
    {
      v5 = 0;
      v6 = 0;
      v7 = v12;
      do
      {
        ifa_addr = v7->ifa_addr;
        if (ifa_addr && (v7->ifa_flags & 1) != 0)
        {
          sa_family = ifa_addr->sa_family;
          if (sa_family == 30)
          {
            net_v6_count = ++v5;
          }
          else if (sa_family == 2)
          {
            net_v4_count = ++v6;
          }
        }
        v7 = v7->ifa_next;
      }
      while (v7);
    }
    freeifaddrs(v12);
LABEL_20:
    v10 = 0;
    if (!a1)
      goto LABEL_22;
    goto LABEL_21;
  }
  v10 = 0xFFFFFFFFLL;
  if (a1)
LABEL_21:
    *a1 = net_v4_count;
LABEL_22:
  if (a2)
    *a2 = net_v6_count;
  pthread_mutex_unlock(&net_config_mutex);
  return v10;
}

unsigned int if_nametoindex(const char *a1)
{
  ifaddrs *v2;
  ifaddrs *v3;
  sockaddr *ifa_addr;
  unsigned int v5;
  ifaddrs *v7;

  v7 = 0;
  if (getifaddrs(&v7) < 0)
    return 0;
  v2 = v7;
  if (!v7)
  {
LABEL_8:
    freeifaddrs(v2);
LABEL_9:
    v5 = 0;
    *__error() = 6;
    return v5;
  }
  v3 = v7;
  while (1)
  {
    ifa_addr = v3->ifa_addr;
    if (ifa_addr)
    {
      if (ifa_addr->sa_family == 18 && !strcmp(v3->ifa_name, a1))
        break;
    }
    v3 = v3->ifa_next;
    if (!v3)
      goto LABEL_8;
  }
  v5 = *(unsigned __int16 *)ifa_addr->sa_data;
  freeifaddrs(v2);
  if (!v5)
    goto LABEL_9;
  return v5;
}

int getifaddrs(ifaddrs **a1)
{
  size_t v2;
  unint64_t v3;
  size_t v4;
  unsigned __int16 *v5;
  ifaddrs *v6;
  int v8;
  int v9;
  int v10;
  int v11;
  ifaddrs *v12;
  int v13;
  unsigned int v14;
  int v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  int i;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  int v25;
  ifaddrs *v26;
  uint64_t v27;
  ifaddrs *v28;
  ifaddrs *v29;
  size_t v30;
  ifaddrs *v31;
  int v32;
  ifaddrs *v33;
  sockaddr *v34;
  char *v35;
  ifaddrs *v36;
  int v37;
  unsigned int v38;
  int v39;
  _BYTE *v40;
  _BYTE *v41;
  size_t v42;
  int v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  size_t v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  sockaddr *ifa_addr;
  unsigned int v55;
  unsigned int v56;
  ifaddrs **v57;
  ifaddrs *v58;
  int v59;
  char *v60;
  size_t v61;
  int v62[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C874D8];
  v61 = 0;
  *(_OWORD *)v62 = xmmword_191FAB770;
  v63 = 3;
  if ((sysctl(v62, 6u, 0, &v61, 0, 0) & 0x80000000) == 0)
  {
    v2 = v61;
    if (v61 <= 0x800)
      v2 = 2048;
    v3 = 2 * v2;
    if (v3 >= 0x1000000)
      v4 = 0x1000000;
    else
      v4 = v3;
    v61 = v4;
    while (1)
    {
      v5 = (unsigned __int16 *)malloc_type_malloc(v4, 0xA5A569C9uLL);
      if (!v5)
        return -1;
      v6 = (ifaddrs *)v5;
      if ((sysctl(v62, 6u, v5, &v61, 0, 0) & 0x80000000) == 0)
        break;
      free(v6);
      v4 = 2 * v61;
      v61 = v4;
      if (v4 >= 0x1000001)
      {
        *__error() = 55;
        return -1;
      }
    }
    if ((uint64_t)v61 < 1)
    {
      v10 = 0;
      v9 = 0;
      v11 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 1;
      v12 = v6;
      do
      {
        if (BYTE2(v12->ifa_next) == 5)
        {
          v13 = BYTE3(v12->ifa_next);
          if (v13 == 12)
          {
            if (v8)
            {
              if (WORD2(v12->ifa_name) != v8)
LABEL_111:
                abort();
              v14 = HIDWORD(v12->ifa_next) & 0xA4;
              if (v14)
              {
                v15 = 0;
                v16 = &v12->ifa_flags + 1;
                ++v11;
                v17 = &v12->ifa_flags + 1;
                do
                {
                  if (((v14 >> v15) & 1) != 0)
                  {
                    if (*v17)
                      v18 = (*v17 + 3) & 0x1FC;
                    else
                      v18 = 4;
                    if (v15 == 5)
                      goto LABEL_32;
                    v17 += v18;
                  }
                  ++v15;
                }
                while (v15 != 8);
                LODWORD(v18) = 0;
LABEL_32:
                for (i = 0; i != 8; ++i)
                {
                  if (((v14 >> i) & 1) != 0)
                  {
                    v20 = *v16;
                    v21 = ((_WORD)v20 + 3) & 0x1FC;
                    if (i == 2)
                      v22 = v18;
                    else
                      v22 = 4;
                    v23 = v20 == 0;
                    if (*v16)
                      v24 = ((_WORD)v20 + 3) & 0x1FC;
                    else
                      v24 = 4;
                    if (v23)
                      v21 = v22;
                    v10 += v21;
                    v16 += v24;
                  }
                }
              }
            }
          }
          else if (v13 == 14)
          {
            if ((BYTE4(v12->ifa_next) & 0x10) != 0)
            {
              v8 = WORD2(v12->ifa_name);
              ++v11;
              if (LOBYTE(v12[2].ifa_next))
                v25 = ((LOBYTE(v12[2].ifa_next) + 3) & 0x1FC) + 7;
              else
                v25 = 11;
              v10 += v25 + 96;
              v9 += BYTE5(v12[2].ifa_next) + 1;
            }
            else
            {
              v8 = 0;
            }
          }
        }
        v12 = (ifaddrs *)((char *)v12 + LOWORD(v12->ifa_next));
      }
      while (v12 < (ifaddrs *)((char *)v6 + v61));
    }
    if (v10 + v11 + v9 == 1)
    {
      *a1 = 0;
      v26 = v6;
      goto LABEL_99;
    }
    v27 = v10;
    v28 = (ifaddrs *)malloc_type_malloc(v10 + 56 * v11 + v9, 0xEF7CE966uLL);
    if (v28)
    {
      v29 = v28;
      v57 = a1;
      v30 = v11;
      bzero(v28, v30 * 56);
      v31 = v29;
      if ((uint64_t)v61 >= 1)
      {
        v32 = 0;
        v33 = 0;
        v34 = (sockaddr *)&v29[v30];
        v35 = (char *)&v29[v30] + v27;
        v36 = v6;
        v31 = v29;
        do
        {
          if (BYTE2(v36->ifa_next) == 5)
          {
            v37 = BYTE3(v36->ifa_next);
            if (v37 == 12)
            {
              if (v32)
              {
                if (WORD2(v36->ifa_name) != v32)
                  goto LABEL_111;
                v38 = HIDWORD(v36->ifa_next) & 0xA4;
                if (v38)
                {
                  v59 = v32;
                  v39 = 0;
                  v31->ifa_name = v33->ifa_name;
                  v58 = v33;
                  v31->ifa_flags = v33->ifa_flags;
                  v31->ifa_data = 0;
                  v40 = &v36->ifa_flags + 1;
                  v41 = &v36->ifa_flags + 1;
                  v60 = v35;
                  do
                  {
                    if (((v38 >> v39) & 1) != 0)
                    {
                      if (*v41)
                        v42 = (*v41 + 3) & 0x1FC;
                      else
                        v42 = 4;
                      if (v39 == 5)
                        goto LABEL_74;
                      v41 += v42;
                    }
                    ++v39;
                  }
                  while (v39 != 8);
                  v42 = 0;
LABEL_74:
                  v43 = 0;
                  while (2)
                  {
                    if (((1 << v43) & 0xA4 & HIDWORD(v36->ifa_next)) != 0)
                    {
                      v44 = *v40;
                      v45 = v44 + 3;
                      v46 = ((_WORD)v44 + 3) & 0x1FC;
                      if (*v40)
                        v47 = v45 & 0x1FC;
                      else
                        v47 = 4;
                      switch(v43)
                      {
                        case 2:
                          v31->ifa_netmask = v34;
                          if (v44)
                          {
                            memcpy(v34, v40, v45 & 0x1FC);
                            v34 = (sockaddr *)((char *)v34 + v46);
                          }
                          else
                          {
                            bzero(v34, v42);
                            v34 = (sockaddr *)((char *)v34 + v42);
                          }
                          break;
                        case 7:
                          v31->ifa_dstaddr = v34;
LABEL_86:
                          memcpy(v34, v40, v47);
                          v34 = (sockaddr *)((char *)v34 + v47);
                          break;
                        case 5:
                          v31->ifa_addr = v34;
                          goto LABEL_86;
                      }
                      v40 += v47;
                    }
                    if (++v43 == 8)
                    {
                      v35 = v60;
                      v32 = v59;
                      v33 = v58;
                      goto LABEL_95;
                    }
                    continue;
                  }
                }
              }
            }
            else if (v37 == 14)
            {
              if ((BYTE4(v36->ifa_next) & 0x10) != 0)
              {
                v32 = WORD2(v36->ifa_name);
                v31->ifa_name = v35;
                v31->ifa_flags = v36->ifa_name;
                memcpy(v35, &v36[2].ifa_name, BYTE5(v36[2].ifa_next));
                v35[BYTE5(v36[2].ifa_next)] = 0;
                v35 += BYTE5(v36[2].ifa_next) + 1;
                v31->ifa_addr = v34;
                memcpy(v34, &v36[2], LOBYTE(v36[2].ifa_next));
                if (LOBYTE(v36[2].ifa_next))
                  v48 = (LOBYTE(v36[2].ifa_next) + 3) & 0x1FC;
                else
                  v48 = 4;
                v49 = (char *)((unint64_t)&v34->sa_data[v48 + 5] & 0xFFFFFFFFFFFFFFF8);
                v31->ifa_data = v49;
                v50 = *(_OWORD *)&v36->ifa_data;
                v51 = *(_OWORD *)&v36[1].ifa_name;
                v52 = *(_OWORD *)&v36[1].ifa_dstaddr;
                *((_OWORD *)v49 + 4) = *(_OWORD *)&v36[1].ifa_addr;
                *((_OWORD *)v49 + 5) = v52;
                *((_OWORD *)v49 + 2) = v50;
                *((_OWORD *)v49 + 3) = v51;
                v53 = *(_OWORD *)&v36->ifa_netmask;
                *(_OWORD *)v49 = *(_OWORD *)&v36->ifa_flags;
                *((_OWORD *)v49 + 1) = v53;
                v34 = (sockaddr *)(v49 + 96);
                v33 = v31;
LABEL_95:
                v31->ifa_next = v31 + 1;
                ++v31;
              }
              else
              {
                v32 = 0;
              }
            }
          }
          v36 = (ifaddrs *)((char *)v36 + LOWORD(v36->ifa_next));
        }
        while (v36 < (ifaddrs *)((char *)v6 + v61));
      }
      free(v6);
      if (&v31[-1] >= v29)
      {
        v31[-1].ifa_next = 0;
        *v57 = v29;
        do
        {
          ifa_addr = v29->ifa_addr;
          if (ifa_addr->sa_family == 30 && ifa_addr->sa_data[6] == 254)
          {
            v55 = ifa_addr->sa_data[7];
            if ((v55 & 0xC0) == 0x80 || v55 >= 0xC0)
            {
              v56 = *(unsigned __int16 *)&ifa_addr->sa_data[8];
              *(_WORD *)&ifa_addr->sa_data[8] = 0;
              if (!*(_DWORD *)&ifa_addr[1].sa_data[6])
                *(_DWORD *)&ifa_addr[1].sa_data[6] = __rev16(v56);
            }
          }
          v29 = v29->ifa_next;
        }
        while (v29);
        return 0;
      }
      *v57 = 0;
      v26 = v29;
LABEL_99:
      free(v26);
      return 0;
    }
    free(v6);
  }
  return -1;
}

uint64_t _mdns_search(char *a1, unsigned int a2, unsigned int a3, char *a4, int a5, uint64_t a6, unsigned int *a7, uint64_t *a8)
{
  if (a4 && (LODWORD(a4) = if_nametoindex(a4), !(_DWORD)a4))
    return 0xFFFFFFFFLL;
  else
    return _mdns_search_ex(a1, a2, a3, (uint32_t)a4, a5, a6, a7, a8);
}

uint64_t _mdns_deadline(__darwin_time_t *a1, _QWORD *a2)
{
  uint64_t result;
  __darwin_suseconds_t tv_usec;
  __darwin_time_t v6;
  uint64_t v7;
  timeval v8;

  v8.tv_sec = 0;
  *(_QWORD *)&v8.tv_usec = 0;
  result = gettimeofday(&v8, 0);
  tv_usec = v8.tv_usec;
  v6 = *a2 + v8.tv_sec;
  *a1 = v6;
  v7 = a2[1] + 1000 * tv_usec;
  a1[1] = v7;
  if (v7 > 1000000000)
  {
    *a1 = v7 / 0x3B9ACA00uLL + v6;
    a1[1] = v7 % 0x3B9ACA00uLL;
  }
  return result;
}

uint64_t _gai_serv_to_port(const char *a1, uint64_t a2, _WORD *a3)
{
  _QWORD *v4;
  uint64_t v5;

  if (_gai_numericserv(a1, a3))
    return 0;
  v4 = si_search();
  v5 = si_service_byname((uint64_t)v4);
  if (v5)
  {
    if (a3)
      *a3 = bswap32(*(unsigned __int16 *)(v5 + 48)) >> 16;
    si_item_release((unsigned int *)v5);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void **_gai_nat64_second_pass(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  void **v8;
  uint64_t v10;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int v28;
  int v30;
  uint8_t buf[8];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 0;
  v8 = 0;
  if ((a7 & 4) == 0)
  {
    v10 = *(unsigned int *)(a1 + 4);
    if ((_DWORD)v10)
    {
      if (a4 == 30 || !a4)
      {
        v15 = *(_QWORD *)(a1 + 16);
        do
        {
          v16 = *(_DWORD **)v15;
          if (*(_DWORD *)(*(_QWORD *)v15 + 36) == 30 && (v16[15] || v16[16] || v16[17] != -65536))
            return 0;
          v15 += 8;
          --v10;
        }
        while (v10);
        v17 = 0;
        v8 = 0;
        v28 = a7 & 0xFFFFF5FF;
        while (1)
        {
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v17);
          v19 = v18 + 32;
          v20 = *(_DWORD *)(v18 + 36);
          if (v20 == 30)
          {
            v21 = (int *)(v19 + 40);
          }
          else
          {
            if (v20 != 2)
              goto LABEL_26;
            v21 = (int *)(v19 + 24);
          }
          pthread_once(&_gai_load_libnetwork_load_once, _gai_load_libnetwork_once);
          if (nat64_v4_requires_synthesis)
          {
            v22 = nat64_v4_requires_synthesis(v21);
            pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
            v23 = _gai_log;
            if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_DEBUG))
            {
              v26 = *v21;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v26;
              LOWORD(v32) = 1024;
              *(_DWORD *)((char *)&v32 + 2) = v22;
              _os_log_debug_impl(&dword_191F86000, v23, OS_LOG_TYPE_DEBUG, "nat64_v4_requires_synthesis(%{network:in_addr}d) == %{BOOL}d", buf, 0xEu);
              if ((v22 & 1) == 0)
                goto LABEL_26;
            }
            else if (!v22)
            {
              goto LABEL_26;
            }
            *(_QWORD *)buf = 0;
            v32 = 0;
            if (!inet_ntop(2, v21, (char *)buf, 0x10u))
              goto LABEL_26;
            v30 = 0;
            v24 = si_addrinfo(a2, buf, a3, 30, a5, a6, v28, a8, &v30);
            if (!v24)
              goto LABEL_26;
            v25 = v24;
            if (!v30)
            {
              if (!v8)
              {
                v8 = (void **)v24;
                goto LABEL_26;
              }
              v8 = si_list_concat(v8, v24);
            }
            si_list_release(v25);
          }
LABEL_26:
          if (++v17 >= (unint64_t)*(unsigned int *)(a1 + 4))
            return v8;
        }
      }
      return 0;
    }
  }
  return v8;
}

void *_mdns_parse_domain_name(uint64_t a1, int a2)
{
  void *result;
  int v4;
  size_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  char v10;
  int v11;
  int v12;
  _BYTE *v13;
  int v14;

  result = 0;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      result = 0;
      LODWORD(v5) = 0;
      v6 = 0;
      v7 = 0;
LABEL_4:
      while (2)
      {
        v8 = *(unsigned __int8 *)(a1 + v7);
        v5 = (v5 + v8 + 1);
        result = reallocf(result, v5);
        if (result)
        {
          if (v8)
          {
            v9 = v4 - 1;
            if (v6 >= 1)
            {
              if (v4 == 1)
                v10 = 0;
              else
                v10 = 46;
              *((_BYTE *)result + v6++) = v10;
            }
            v11 = v7 + 1;
            v12 = v7 + 1 + v8;
            v7 += v4;
            v4 = v9 - v8;
            v13 = (_BYTE *)(a1 + v11);
            do
            {
              if (!v9)
              {
                v4 = -1;
                goto LABEL_4;
              }
              v14 = *v13;
              if (v14 == 46)
              {
                v5 = (v5 + 1);
                result = reallocf(result, v5);
                if (!result)
                  return result;
                *((_BYTE *)result + v6++) = 92;
                LOBYTE(v14) = *v13;
              }
              *((_BYTE *)result + v6++) = v14;
              ++v13;
              --v9;
              --v8;
            }
            while (v8);
            v7 = v12;
            if (v4)
              continue;
          }
          *((_BYTE *)result + v6) = 0;
        }
        break;
      }
    }
  }
  return result;
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  uint64_t v7;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  int v12;

  if (a5)
  {
    *a5 = 0;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        v9 = a4;
        if (a4)
        {
          v10 = (_QWORD *)si_search_search;
          if (!si_search_search)
          {
            v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }
          v7 = si_user_byname((uint64_t)v10);
          if (v7)
          {
            v11 = (unsigned int *)v7;
            v12 = copy_user_r(v7 + 32, a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }
            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }
  else
  {
    LODWORD(v7) = 34;
  }
  return v7;
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  uint64_t v8;
  int v10;
  char v11;
  _QWORD *v12;
  unsigned int *v13;
  _QWORD *v14;
  uint64_t v15;
  const char *v16;
  const char **v17;
  _QWORD *v18;
  int v19;

  if (!a5)
  {
    LODWORD(v8) = 34;
    return v8;
  }
  *a5 = 0;
  LODWORD(v8) = 34;
  if (a2)
  {
    if (a3)
    {
      v10 = a4;
      if (a4)
      {
        v11 = _os_feature_enabled_simple_impl();
        if (a1 <= 0x1F3 && (v11 & 1) == 0)
        {
          v12 = (_QWORD *)si_search_cache_file_search;
          if (!si_search_cache_file_search)
          {
            v12 = si_module_with_name("cache_file");
            si_search_cache_file_search = (uint64_t)v12;
          }
          v13 = (unsigned int *)si_user_byuid((uint64_t)v12);
          if (v13)
            goto LABEL_22;
          v14 = (_QWORD *)si_search_file_search;
          if (!si_search_file_search)
          {
            v14 = si_module_with_name("file");
            si_search_file_search = (uint64_t)v14;
          }
          v15 = si_user_byuid((uint64_t)v14);
          if (v15)
          {
            v13 = (unsigned int *)v15;
            v16 = (const char *)si_search_cache_file_search;
            if (!si_search_cache_file_search)
            {
              v16 = (const char *)si_module_with_name("cache_file");
              si_search_cache_file_search = (uint64_t)v16;
            }
            v17 = (const char **)si_search_file_search;
            if (!si_search_file_search)
            {
              v17 = (const char **)si_module_with_name("file");
              si_search_file_search = (uint64_t)v17;
            }
            si_cache_add_item(v16, v17, (uint64_t)v13);
LABEL_22:
            v19 = copy_user_r((uint64_t)(v13 + 8), a2, a3, v10);
            si_item_release(v13);
            if (v19)
            {
              LODWORD(v8) = 34;
            }
            else
            {
              LODWORD(v8) = 0;
              *a5 = a2;
            }
            return v8;
          }
        }
        v18 = (_QWORD *)si_search_search;
        if (!si_search_search)
        {
          v18 = si_module_with_name("search");
          si_search_search = (uint64_t)v18;
        }
        v8 = si_user_byuid((uint64_t)v18);
        v13 = (unsigned int *)v8;
        if (v8)
          goto LABEL_22;
      }
    }
  }
  return v8;
}

uint64_t copy_user_r(uint64_t a1, _QWORD *a2, char *a3, int a4)
{
  const char *v8;
  int v9;
  uint64_t result;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;

  if (!a1)
    return 0xFFFFFFFFLL;
  v8 = *(const char **)a1;
  if (v8)
    v9 = strlen(v8) + 1;
  else
    v9 = 0;
  v11 = *(const char **)(a1 + 8);
  if (v11)
    v9 += strlen(v11) + 1;
  v12 = *(const char **)(a1 + 32);
  if (v12)
    v9 += strlen(v12) + 1;
  v13 = *(const char **)(a1 + 40);
  if (v13)
    v9 += strlen(v13) + 1;
  v14 = *(const char **)(a1 + 48);
  if (v14)
    v9 += strlen(v14) + 1;
  v15 = *(const char **)(a1 + 56);
  if (v15)
    v9 += strlen(v15) + 1;
  if (v9 > a4)
    return 0xFFFFFFFFLL;
  *a2 = 0;
  if (*(_QWORD *)a1)
  {
    *a2 = a3;
    v16 = strlen(*(const char **)a1) + 1;
    memmove(a3, *(const void **)a1, v16);
    a3 += v16;
  }
  a2[1] = 0;
  if (*(_QWORD *)(a1 + 8))
  {
    a2[1] = a3;
    v17 = strlen(*(const char **)(a1 + 8)) + 1;
    memmove(a3, *(const void **)(a1 + 8), v17);
    a3 += v17;
  }
  a2[2] = *(_QWORD *)(a1 + 16);
  a2[4] = 0;
  v18 = *(_QWORD *)(a1 + 32);
  a2[3] = *(_QWORD *)(a1 + 24);
  if (v18)
  {
    a2[4] = a3;
    v19 = strlen(*(const char **)(a1 + 32)) + 1;
    memmove(a3, *(const void **)(a1 + 32), v19);
    a3 += v19;
  }
  a2[5] = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    a2[5] = a3;
    v20 = strlen(*(const char **)(a1 + 40)) + 1;
    memmove(a3, *(const void **)(a1 + 40), v20);
    a3 += v20;
  }
  a2[6] = 0;
  if (*(_QWORD *)(a1 + 48))
  {
    a2[6] = a3;
    v21 = strlen(*(const char **)(a1 + 48)) + 1;
    memmove(a3, *(const void **)(a1 + 48), v21);
    a3 += v21;
  }
  a2[7] = 0;
  if (*(_QWORD *)(a1 + 56))
  {
    a2[7] = a3;
    v22 = strlen(*(const char **)(a1 + 56));
    memmove(a3, *(const void **)(a1 + 56), v22 + 1);
  }
  result = 0;
  a2[8] = *(_QWORD *)(a1 + 64);
  return result;
}

group *__cdecl getgrgid(gid_t a1)
{
  _QWORD *v1;
  group *v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = (group *)si_group_bygid((uint64_t)v1);
  LI_set_thread_item(202, (uint64_t)v2);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

uint64_t search_group_bygid(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 2u, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_group_bygid(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 48;
          if (!*(_DWORD *)(v1 + 64))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  ether_addr *result;
  uint64_t v3;
  _DWORD v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (ether_aton_ep
    || (result = (ether_addr *)malloc_type_calloc(1uLL, 6uLL, 0x1000040274DC3F3uLL),
        (ether_aton_ep = (uint64_t)result) != 0))
  {
    if (sscanf(a1, " %x:%x:%x:%x:%x:%x", v4, &v4[1], &v4[2], &v4[3], &v4[4], &v4[5]) == 6)
    {
      v3 = 0;
      result = (ether_addr *)ether_aton_ep;
      do
      {
        result->octet[v3] = v4[v3];
        ++v3;
      }
      while (v3 != 6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  char *result;

  result = (char *)ether_ntoa_s;
  if (ether_ntoa_s
    || (result = (char *)malloc_type_malloc(0x12uLL, 0x4EEBE028uLL), (ether_ntoa_s = (uint64_t)result) != 0))
  {
    *result = 0;
    snprintf(result, 0x12uLL, "%x:%x:%x:%x:%x:%x", a1->octet[0], a1->octet[1], a1->octet[2], a1->octet[3], a1->octet[4], a1->octet[5]);
    return (char *)ether_ntoa_s;
  }
  return result;
}

uint64_t ___muser_xpc_pipe_block_invoke()
{
  char *v0;
  uint64_t result;
  BOOL v2;
  host_t v3;
  uint32_t multiuser_flags;

  multiuser_flags = 0;
  v0 = getenv("XBS_DISABLE_LIBINFO");
  result = issetugid();
  if (v0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2 || (result = strcmp(v0, "YES"), (_DWORD)result))
  {
    v3 = MEMORY[0x194021814](result);
    result = host_get_multiuser_config_flags(v3, &multiuser_flags);
    if ((_DWORD)result || multiuser_flags >> 30)
      return pthread_atfork((void (*)(void))_muser_fork_prepare, (void (*)(void))_muser_fork_parent, (void (*)(void))_muser_fork_child);
  }
  _si_muser_disabled = 1;
  return result;
}

uint64_t si_search_module_set_flags(char *__s1, int a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v4 = si_module_with_name("search");
    si_search_search = (uint64_t)v4;
  }
  return search_set_flags((uint64_t)v4, __s1, a2);
}

uint64_t search_set_flags(uint64_t result, char *__s1, int a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  const char **v9;

  if (result)
  {
    v3 = *(uint64_t **)(result + 32);
    if (v3)
    {
      v4 = *((unsigned int *)v3 + 4);
      if ((_DWORD)v4)
      {
        v7 = 0;
        v8 = *v3;
        while (1)
        {
          v9 = *(const char ***)(v8 + 8 * v7);
          if (v9)
          {
            if (*v9)
            {
              result = strcmp(__s1, *v9);
              if (!(_DWORD)result)
                break;
            }
          }
          if (v4 == ++v7)
            return result;
        }
        *(_DWORD *)(v3[1] + 4 * v7) = a3;
      }
    }
  }
  return result;
}

uint64_t si_destination_compare(unsigned __int8 *a1, int a2, unsigned __int8 *a3, int a4, int a5)
{
  unint64_t v6;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  NSObject *v19;
  int v20;
  int v21;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  int v43;
  NSObject *v44;
  int v45;
  int v46;
  unsigned int v47;
  _BOOL4 v48;
  NSObject *v49;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  _BOOL4 v62;
  const char *v63;
  int v64;
  int v65;
  _BOOL4 v66;
  _BOOL4 v67;
  _BOOL4 v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL4 v85;
  NSObject *v86;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  int log;
  NSObject *loga;
  unsigned int v98;
  int v99;
  unsigned int v100;
  __int128 v101;
  __int128 v102;
  _OWORD v103[2];
  __int128 v104;
  __int128 v105;
  uint8_t v106[32];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  unsigned int v116;
  __int16 v117;
  int v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C874D8];
  if (!a1)
  {
    v69 = si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT))
      si_destination_compare_cold_1(v69, v70, v71, v72, v73, v74, v75, v76);
    return 0;
  }
  v6 = 0x1EE243000uLL;
  if (!a3)
  {
    v77 = si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT))
      si_destination_compare_cold_2(v77, v78, v79, v80, v81, v82, v83, v84);
    return 0;
  }
  pthread_once(&si_destination_compare_init_cache_init, (void (*)(void))si_destination_compare_init_once);
  v11 = a1[1];
  v12 = v11 == 2 || v11 == 30;
  if (v12)
  {
    v21 = a3[1];
    if (v21 != 2 && v21 != 30)
    {
      v24 = 1;
      if (v11 == 2 || v11 == 30)
        goto LABEL_210;
      goto LABEL_25;
    }
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    memset(v106, 0, sizeof(v106));
    v104 = 0u;
    v105 = 0u;
    memset(v103, 0, sizeof(v103));
    v101 = 0u;
    v102 = 0u;
    v13 = si_destination_lookup(a1, a2, v106);
    v14 = si_destination_lookup(a3, a4, &v101);
    if (v13)
    {
      v15 = v14;
      if (v14)
      {
        if (!a5)
        {
          v25 = 0;
          goto LABEL_41;
        }
        pthread_once(&si_destination_compare_statistics_once, set_loopback_ifindex);
        v16 = v110;
        v17 = v105;
        if ((_DWORD)v110)
        {
          if ((_DWORD)v105)
          {
            if (v110 < v105)
            {
              if (si_compare_settings_0)
                v18 = 3200;
              else
                v18 = 0;
              v98 = v18;
              if (v18 + (int)v110 < v105)
              {
                v19 = si_destination_log;
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218752;
                  v112 = (double)v16 * 0.03125;
                  if (si_compare_settings_1)
                    v20 = 10;
                  else
                    v20 = 0;
                  v113 = 2048;
                  v114 = (double)v17 * 0.03125;
                  v115 = 1024;
                  v116 = v98 >> 5;
                  v117 = 1024;
                  v118 = v20;
                  _os_log_debug_impl(&dword_191F86000, v19, OS_LOG_TYPE_DEBUG, "prefering 1, dst1 min rtt %f < dst2 min rtt %f, leeway %u small leeway %u", buf, 0x22u);
                }
                goto LABEL_209;
              }
              if (si_compare_settings_1)
                v46 = 320;
              else
                v46 = 0;
              v94 = v46;
              v47 = v46 + v110;
              loga = si_destination_log;
              v48 = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG);
              if (v47 < v17)
              {
                if (v48)
                {
                  *(_DWORD *)buf = 134218752;
                  v112 = (double)v16 * 0.03125;
                  v113 = 2048;
                  v114 = (double)v17 * 0.03125;
                  v115 = 1024;
                  v116 = v98 >> 5;
                  v117 = 1024;
                  v118 = v94 >> 5;
                  _os_log_debug_impl(&dword_191F86000, loga, OS_LOG_TYPE_DEBUG, "prefering 1 slightly, dst1 min rtt %f < dst2 min rtt %f, leeway %u small leeway %u", buf, 0x22u);
                }
                v25 = 2;
                goto LABEL_133;
              }
              if (!v48)
              {
LABEL_132:
                v25 = 0;
LABEL_133:
                v6 = 0x1EE243000uLL;
                goto LABEL_134;
              }
              *(_DWORD *)buf = 134218752;
              v112 = (double)v16 * 0.03125;
              v113 = 2048;
              v114 = (double)v17 * 0.03125;
              v115 = 1024;
              v116 = v98 >> 5;
              v117 = 1024;
              v118 = v94 >> 5;
              v63 = "not prefering 1, dst1 min rtt %f < dst2 min rtt %f, leeway %u small leeway %u";
LABEL_219:
              _os_log_debug_impl(&dword_191F86000, loga, OS_LOG_TYPE_DEBUG, v63, buf, 0x22u);
              goto LABEL_132;
            }
            if (v110 > v105)
            {
              if (si_compare_settings_0)
                v43 = 3200;
              else
                v43 = 0;
              v100 = v43;
              if (v110 > v43 + (int)v105)
              {
                v44 = si_destination_log;
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218752;
                  v112 = (double)v16 * 0.03125;
                  if (si_compare_settings_1)
                    v45 = 10;
                  else
                    v45 = 0;
                  v113 = 2048;
                  v114 = (double)v17 * 0.03125;
                  v115 = 1024;
                  v116 = v100 >> 5;
                  v117 = 1024;
                  v118 = v45;
                  _os_log_debug_impl(&dword_191F86000, v44, OS_LOG_TYPE_DEBUG, "prefering 2, dst1 min rtt %f > dst2 min rtt %f, leeway %u small leeway %u", buf, 0x22u);
                }
                goto LABEL_138;
              }
              if (si_compare_settings_1)
                v60 = 320;
              else
                v60 = 0;
              v95 = v60;
              v61 = v60 + v105;
              loga = si_destination_log;
              v62 = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG);
              if (v16 > v61)
              {
                if (v62)
                {
                  *(_DWORD *)buf = 134218752;
                  v112 = (double)v16 * 0.03125;
                  v113 = 2048;
                  v114 = (double)v17 * 0.03125;
                  v115 = 1024;
                  v116 = v100 >> 5;
                  v117 = 1024;
                  v118 = v95 >> 5;
                  _os_log_debug_impl(&dword_191F86000, loga, OS_LOG_TYPE_DEBUG, "prefering 2 slightly, dst1 min rtt %f > dst2 min rtt %f, leeway %u small leeway %u", buf, 0x22u);
                }
                v25 = -2;
                goto LABEL_133;
              }
              if (!v62)
                goto LABEL_132;
              *(_DWORD *)buf = 134218752;
              v112 = (double)v16 * 0.03125;
              v113 = 2048;
              v114 = (double)v17 * 0.03125;
              v115 = 1024;
              v116 = v100 >> 5;
              v117 = 1024;
              v118 = v95 >> 5;
              v63 = "not prefering 2, dst1 min rtt %f > dst2 min rtt %f, leeway %u small leeway %u";
              goto LABEL_219;
            }
            v49 = si_destination_log;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_34(v16, v49);
            v25 = 0;
            v6 = 0x1EE243000uLL;
          }
          else if (DWORD2(v105))
          {
            v25 = 0;
          }
          else
          {
            v25 = 0;
            v51 = DWORD1(v105);
            v52 = 10;
            if (!si_compare_settings_2)
              v52 = 0;
            if (DWORD1(v105) && v52 < DWORD1(v105))
            {
              v53 = si_destination_log;
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_35(v51, v53, v54, v55, v56, v57, v58, v59);
              goto LABEL_209;
            }
          }
        }
        else
        {
          v25 = 0;
          if ((_DWORD)v105 && !DWORD2(v110))
          {
            v25 = 0;
            v33 = DWORD1(v110);
            v34 = 10;
            if (!si_compare_settings_2)
              v34 = 0;
            if (DWORD1(v110) && v34 < DWORD1(v110))
            {
              v35 = si_destination_log;
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_5(v33, v35, v36, v37, v38, v39, v40, v41);
              goto LABEL_138;
            }
          }
        }
LABEL_134:
        if ((BYTE12(v110) & 1) != 0)
        {
          if ((BYTE12(v105) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_27();
            goto LABEL_209;
          }
          v64 = (BYTE12(v110) >> 2) & 1;
          v65 = (BYTE12(v105) >> 2) & 1;
          if (v64 != v65)
          {
            if (v65)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_33();
              goto LABEL_209;
            }
            if (v64)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_32();
              goto LABEL_138;
            }
          }
          if (HIDWORD(v109) == kLoopbackIndex)
          {
            v66 = 1;
          }
          else
          {
            v66 = 0;
            if (v106[1] == 30 && v106[8] == 254)
              v66 = (v106[9] & 0xC0) == 0x80 && *(_DWORD *)&v106[24] == kLoopbackIndex;
          }
          if (HIDWORD(v104) == kLoopbackIndex)
          {
            v68 = 1;
          }
          else
          {
            v68 = 0;
            if (BYTE1(v101) == 30 && BYTE8(v101) == 254)
              v68 = (BYTE9(v101) & 0xC0) == 0x80 && DWORD2(v102) == kLoopbackIndex;
            if (v66 && !v68)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_31();
              goto LABEL_209;
            }
          }
          if (v68 && !v66)
          {
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_30();
            goto LABEL_138;
          }
          if ((BYTE12(v110) & 2) != 0)
          {
            if ((BYTE12(v105) & 2) == 0)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_29();
              goto LABEL_209;
            }
          }
          else if ((BYTE12(v105) & 2) != 0)
          {
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_28();
            goto LABEL_138;
          }
        }
        else if ((BYTE12(v105) & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
            si_destination_compare_cold_26();
LABEL_138:
          v24 = 0xFFFFFFFFLL;
          goto LABEL_210;
        }
LABEL_41:
        v26 = BYTE5(v107);
        v27 = BYTE5(v103[0]);
        if (BYTE5(v107))
        {
          if (!BYTE5(v103[0]))
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_25();
            goto LABEL_209;
          }
        }
        else if (BYTE5(v103[0]))
        {
          v6 = 0x1EE243000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
            si_destination_compare_cold_24();
          goto LABEL_138;
        }
        v93 = v15;
        v99 = a2;
        log = a4;
        v28 = v25;
        v29 = rfc6724_scope_sa((uint64_t)v106);
        v30 = rfc6724_scope_sa((uint64_t)&v107 + 4);
        v31 = rfc6724_scope_sa((uint64_t)&v101);
        v32 = rfc6724_scope_sa((uint64_t)v103 + 4);
        if (v29 == v30)
        {
          a2 = v99;
          if (v31 != v32)
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_22();
            v24 = 1;
LABEL_65:
            a4 = log;
            goto LABEL_210;
          }
        }
        else
        {
          a2 = v99;
          if (v31 == v32)
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_23();
            v24 = 0xFFFFFFFFLL;
            goto LABEL_65;
          }
        }
        v42 = v28;
        a4 = log;
        if ((v109 & 4) != (v104 & 4))
        {
          if ((v109 & 4) != 0)
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_21();
            goto LABEL_209;
          }
          if ((v104 & 4) != 0)
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_20();
            goto LABEL_138;
          }
        }
        if ((v109 & 8) != (v104 & 8))
        {
          if ((v109 & 8) != 0)
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_19();
            goto LABEL_209;
          }
          if ((v104 & 8) != 0)
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_18();
            goto LABEL_138;
          }
        }
        if ((unsigned __int16)v107 == WORD2(v109))
        {
          if (LOWORD(v103[0]) != WORD2(v104))
          {
            v6 = 0x1EE243000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_16();
            goto LABEL_209;
          }
        }
        else if (LOWORD(v103[0]) == WORD2(v104))
        {
          v6 = 0x1EE243000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
            si_destination_compare_cold_17();
          goto LABEL_138;
        }
        if (WORD1(v107) > WORD1(v103[0]))
        {
          v6 = 0x1EE243000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
            si_destination_compare_cold_6();
          goto LABEL_209;
        }
        if (WORD1(v103[0]) > WORD1(v107))
        {
          v6 = 0x1EE243000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
            si_destination_compare_cold_7();
          goto LABEL_138;
        }
        if (v26 == 30)
        {
          if (WORD6(v107) == 544)
          {
            v67 = 0;
LABEL_188:
            if (v27 != 30)
            {
              v85 = 1;
              v6 = 0x1EE243000;
              goto LABEL_199;
            }
            if (WORD6(v103[0]) == 544)
            {
              v85 = 0;
              v6 = 0x1EE243000uLL;
            }
            else
            {
              v6 = 0x1EE243000uLL;
              if (WORD6(v103[0]) != 288)
              {
                v85 = 1;
                goto LABEL_199;
              }
              v85 = HIWORD(v103[0]) != 0;
            }
            if (v67 && !v85)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_15();
              goto LABEL_209;
            }
LABEL_199:
            if (v85 && !v67)
            {
              if (os_log_type_enabled(*(os_log_t *)(v6 + 3704), OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_14();
              goto LABEL_138;
            }
            if (v29 < v31)
            {
              if (os_log_type_enabled(*(os_log_t *)(v6 + 3704), OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_8();
              goto LABEL_209;
            }
            if (v31 < v29)
            {
              if (os_log_type_enabled(*(os_log_t *)(v6 + 3704), OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_9();
              goto LABEL_138;
            }
            if (v42 - 1 < 2)
            {
LABEL_209:
              v24 = 1;
              goto LABEL_210;
            }
            if (v42 > 0xFFFFFFFD)
              goto LABEL_221;
            v91 = common_prefix_length((uint64_t)v106, (uint64_t)&v107 + 4);
            v92 = common_prefix_length((uint64_t)&v101, (uint64_t)v103 + 4);
            if (v91 && v92)
            {
              if (v91 > v92)
              {
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                  si_destination_compare_cold_10();
                goto LABEL_234;
              }
              if (v92 > v91)
              {
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                  si_destination_compare_cold_11();
LABEL_221:
                v24 = 0xFFFFFFFFLL;
LABEL_235:
                a4 = log;
                a2 = v99;
                goto LABEL_210;
              }
            }
            if (v13 != 1 || v93 != 2)
            {
              if (v93 != 1)
              {
                v24 = 0;
                goto LABEL_235;
              }
              v12 = v13 == 2;
              v24 = 0;
              a4 = log;
              a2 = v99;
              if (!v12)
                goto LABEL_210;
              if (os_log_type_enabled(*(os_log_t *)(v6 + 3704), OS_LOG_TYPE_DEBUG))
                si_destination_compare_cold_13();
              goto LABEL_221;
            }
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
              si_destination_compare_cold_12();
LABEL_234:
            v24 = 1;
            goto LABEL_235;
          }
          if (WORD6(v107) == 288)
          {
            v67 = HIWORD(v107) != 0;
            goto LABEL_188;
          }
        }
        v67 = 1;
        goto LABEL_188;
      }
      if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
        si_destination_compare_cold_4();
    }
    else if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
    {
      si_destination_compare_cold_3();
    }
    v24 = 0;
    goto LABEL_210;
  }
  v21 = a3[1];
LABEL_25:
  v23 = v21 == 2 || v21 == 30;
  v24 = (v23 << 31 >> 31);
LABEL_210:
  v86 = *(NSObject **)(v6 + 3704);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    v88 = *a1;
    v89 = *a3;
    if ((int)v24 >= 0)
      v90 = 62;
    else
      v90 = 60;
    if (!(_DWORD)v24)
      v90 = 61;
    *(_DWORD *)v106 = 68159234;
    *(_DWORD *)&v106[4] = v88;
    *(_WORD *)&v106[8] = 2096;
    *(_QWORD *)&v106[10] = a1;
    *(_WORD *)&v106[18] = 1024;
    *(_DWORD *)&v106[20] = a2;
    *(_WORD *)&v106[24] = 1024;
    *(_DWORD *)&v106[26] = v90;
    *(_WORD *)&v106[30] = 1040;
    LODWORD(v107) = v89;
    WORD2(v107) = 2096;
    *(_QWORD *)((char *)&v107 + 6) = a3;
    HIWORD(v107) = 1024;
    LODWORD(v108) = a4;
    _os_log_debug_impl(&dword_191F86000, v86, OS_LOG_TYPE_DEBUG, "%{network:sockaddr}.*P@%u %c %{network:sockaddr}.*P@%u", v106, 0x34u);
  }
  return v24;
}

uint64_t rfc6724_scope_sa(uint64_t a1)
{
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 == 2)
  {
    v8 = bswap32(*(_DWORD *)(a1 + 4));
    v7 = HIWORD(v8) == 43518 || HIBYTE(v8) == 127;
    v6 = 14;
    goto LABEL_13;
  }
  if (v2 != 30)
    return 0;
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 == 255)
  {
    v10 = (*(_BYTE *)(a1 + 9) & 0xF) - 1;
    if (v10 >= 5)
      return 14;
    else
      return dword_191FABA78[v10];
  }
  else
  {
    if (v3 == 254)
    {
      v4 = *(unsigned __int8 *)(a1 + 9);
      v5 = v4 & 0xC0;
      if (v4 <= 0xBF)
        v6 = 14;
      else
        v6 = 5;
      v7 = v5 == 128;
LABEL_13:
      if (v7)
        return 2;
      else
        return v6;
    }
    v11 = *(_QWORD *)(a1 + 15);
    result = 14;
    if (!(*(_QWORD *)(a1 + 8) | v11))
    {
      if (*(_BYTE *)(a1 + 23) == 1)
        return 2;
      else
        return 14;
    }
  }
  return result;
}

uint64_t si_destination_lookup(unsigned __int8 *a1, int a2, _OWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t *v11;
  int v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  size_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  unsigned int v23;
  NSObject *v24;
  char *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;

  pthread_once(&si_destination_compare_init_cache_init, (void (*)(void))si_destination_compare_init_once);
  os_unfair_lock_lock((os_unfair_lock_t)&cache_lock);
  v6 = mach_absolute_time();
  v7 = cache;
  if (!cache)
  {
LABEL_29:
    v23 = *a1;
    if (v23 < 0x1D)
    {
      v25 = (char *)malloc_type_calloc(1uLL, 0x70uLL, 0x1020040DB858CFCuLL);
      if (v25)
      {
        v26 = (uint64_t)v25;
        v27 = (unsigned __int8 *)(v25 + 16);
        __memcpy_chk();
        *(_DWORD *)(v26 + 88) = a2;
        si_destination_fill_netsrc(v27);
        v28 = *(_OWORD *)(v26 + 32);
        *a3 = *(_OWORD *)(v26 + 16);
        a3[1] = v28;
        v29 = *(_OWORD *)(v26 + 48);
        v30 = *(_OWORD *)(v26 + 64);
        v31 = *(_OWORD *)(v26 + 96);
        a3[4] = *(_OWORD *)(v26 + 80);
        a3[5] = v31;
        a3[2] = v29;
        a3[3] = v30;
        v32 = mach_absolute_time();
        v33 = cache;
        *(_QWORD *)v26 = v32;
        *(_QWORD *)(v26 + 8) = v33;
        cache = v26;
        v22 = 2;
        goto LABEL_37;
      }
      v34 = si_destination_log;
      if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
        si_destination_lookup_cold_2(v34);
    }
    else
    {
      v24 = si_destination_log;
      if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
        si_destination_lookup_cold_1(v23, v24);
    }
    v22 = 0;
    goto LABEL_37;
  }
  v8 = v6;
  v9 = 0;
  v10 = cache_timeout;
  v11 = &cache;
  do
  {
    if (v8 - *(_QWORD *)v7 >= v10)
    {
      *v11 = *(_QWORD *)(v7 + 8);
      *(_OWORD *)(v7 + 80) = 0u;
      *(_OWORD *)(v7 + 96) = 0u;
      *(_OWORD *)(v7 + 48) = 0u;
      *(_OWORD *)(v7 + 64) = 0u;
      *(_OWORD *)(v7 + 16) = 0u;
      *(_OWORD *)(v7 + 32) = 0u;
      *(_OWORD *)v7 = 0u;
      free((void *)v7);
      v10 = cache_timeout;
      goto LABEL_24;
    }
    if ((v9 & 1) != 0)
      goto LABEL_5;
    if (*(_DWORD *)(v7 + 88) != a2)
      goto LABEL_22;
    v12 = a1[1];
    if (v12 != *(unsigned __int8 *)(v7 + 17))
      goto LABEL_22;
    v13 = (unsigned __int8 *)(v7 + 16);
    if (v12 == 30)
    {
      if (*((_QWORD *)a1 + 1) != *(_QWORD *)(v7 + 24) || *((_QWORD *)a1 + 2) != *(_QWORD *)(v7 + 32))
      {
LABEL_22:
        v9 = 0;
        goto LABEL_23;
      }
      v14 = *((_DWORD *)a1 + 6);
      v15 = *(_DWORD *)(v7 + 40);
    }
    else
    {
      if (v12 != 2)
      {
        v17 = *a1;
        if ((_DWORD)v17 != *v13 || memcmp(a1, (const void *)(v7 + 16), v17))
          goto LABEL_22;
        goto LABEL_26;
      }
      v14 = *((_DWORD *)a1 + 1);
      v15 = *(_DWORD *)(v7 + 20);
    }
    if (v14 != v15)
      goto LABEL_22;
LABEL_26:
    v18 = *(_OWORD *)(v7 + 32);
    *a3 = *(_OWORD *)v13;
    a3[1] = v18;
    v19 = *(_OWORD *)(v7 + 48);
    v20 = *(_OWORD *)(v7 + 64);
    v21 = *(_OWORD *)(v7 + 96);
    a3[4] = *(_OWORD *)(v7 + 80);
    a3[5] = v21;
    a3[2] = v19;
    a3[3] = v20;
    v7 = *v11;
LABEL_5:
    v9 = 1;
LABEL_23:
    v11 = (uint64_t *)(v7 + 8);
LABEL_24:
    v7 = *v11;
  }
  while (*v11);
  if ((v9 & 1) == 0)
    goto LABEL_29;
  v22 = 1;
LABEL_37:
  os_unfair_lock_unlock((os_unfair_lock_t)&cache_lock);
  return v22;
}

uint64_t common_prefix_length(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  int v7;

  if (*(_BYTE *)(a1 + 1) != 30 || *(_BYTE *)(a2 + 1) != 30)
    return 0;
  result = 0;
  v4 = (unsigned __int8 *)(a1 + 8);
  v5 = (unsigned __int8 *)(a2 + 8);
  v6 = a1 + 16;
  while (1)
  {
    v7 = *v4 ^ *v5;
    if (v7)
      break;
    ++v4;
    ++v5;
    result = (result + 8);
    if ((unint64_t)v4 >= v6)
      return result;
  }
  while ((v7 & 0x80) == 0)
  {
    result = (result + 1);
    LOBYTE(v7) = 2 * v7;
  }
  return result;
}

void si_destination_fill_netsrc(unsigned __int8 *a1)
{
  int v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned __int8 v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t __n[6];
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;

  if (si_destination_fill_netsrc_netsrc_sockfd < 0)
  {
    si_destination_fill_netsrc_netsrc_sockfd = si_destination_create_control_socket();
    if (si_destination_fill_netsrc_netsrc_sockfd < 0)
      return;
  }
  v29 = 0;
  v28 = 0;
  v31 = 0;
  v30 = 0;
  if (si_destination_fill_netsrc_version)
    v2 = 1;
  else
    v2 = 2;
  v3 = *((_DWORD *)a1 + 18);
  v26 = v2;
  v27 = v3;
  if (*a1 >= 0x1DuLL)
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
      si_destination_fill_netsrc_cold_1();
    return;
  }
  __memcpy_chk();
  if (send_NOCANCEL() == 36)
  {
    if (si_destination_fill_netsrc_version == 1)
    {
      memset(__n, 0, 40);
      if (recv_NOCANCEL() == 40)
      {
        *((_DWORD *)a1 + 8) = *(_DWORD *)((char *)&__n[4] + 2);
        if (LOBYTE(__n[0]) <= 0x1CuLL)
          memcpy(a1 + 36, __n, LOBYTE(__n[0]));
        v4 = *(_DWORD *)((char *)&__n[3] + 6);
        *((_DWORD *)a1 + 16) = WORD2(__n[3]);
        *((_DWORD *)a1 + 17) = v4;
        return;
      }
      v16 = si_destination_log;
      if (!os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
        return;
LABEL_25:
      si_destination_fill_netsrc_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      return;
    }
    v25 = 0;
    memset(__n, 0, sizeof(__n));
    if (recv_NOCANCEL() == 56)
    {
      v13 = HIDWORD(__n[5]);
      *((_DWORD *)a1 + 8) = v25;
      *(_OWORD *)(a1 + 36) = *(_OWORD *)__n;
      *((_OWORD *)a1 + 3) = *(_OWORD *)((char *)&__n[1] + 4);
      *((_DWORD *)a1 + 19) = WORD2(v25);
      v15 = HIDWORD(__n[4]);
      v14 = __n[5];
      *((_DWORD *)a1 + 16) = __n[5];
      *((_DWORD *)a1 + 17) = v13;
      *((_QWORD *)a1 + 10) = *(size_t *)((char *)&__n[3] + 4);
      *((_DWORD *)a1 + 22) = v15;
      a1[92] = a1[92] & 0xF8 | (v14 >> 5);
      return;
    }
    v16 = si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
  }
  else
  {
    if (*__error() == 22 && (si_destination_fill_netsrc_version & 1) == 0)
    {
      si_destination_fill_netsrc_version = 1;
      si_destination_fill_netsrc(a1);
    }
    v5 = si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
      si_destination_fill_netsrc_cold_4(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

uint64_t si_destination_create_control_socket()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD v11[4];
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  _OWORD v16[6];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  v0 = socket(32, 2, 2);
  if ((_DWORD)v0 == -1)
  {
    v2 = si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
      si_destination_create_control_socket_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    return 0xFFFFFFFFLL;
  }
  v1 = v0;
  v15 = 1;
  if (setsockopt(v0, 0xFFFF, 4130, &v15, 4u))
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
      si_destination_create_control_socket_cold_7();
LABEL_5:
    close_NOCANCEL();
    return 0xFFFFFFFFLL;
  }
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  __strlcpy_chk();
  if (ioctl(v1, 0xC0644E03uLL, v16) == -1)
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
      si_destination_create_control_socket_cold_2();
    goto LABEL_5;
  }
  v11[1] = 139296;
  v11[2] = v16[0];
  v11[3] = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (connect_NOCANCEL())
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
      si_destination_create_control_socket_cold_6();
    goto LABEL_5;
  }
  v11[0] = 0x20000;
  if (setsockopt(v1, 0xFFFF, 4098, v11, 4u) && os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
    si_destination_create_control_socket_cold_5();
  if (fcntl_NOCANCEL() == -1)
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
      si_destination_create_control_socket_cold_3();
  }
  else if (fcntl_NOCANCEL() == -1 && os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
  {
    si_destination_create_control_socket_cold_4();
  }
  return v1;
}

void endpwent(void)
{
  LI_set_thread_list(1, 0);
}

void _mdns_reply_clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    *(_DWORD *)(a1 + 32) = 0;
    _mdns_hostent_clear(*(_QWORD *)a1);
    _mdns_hostent_clear(*(_QWORD *)(a1 + 8));
    v2 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    if (v2)
    {
      do
      {
        v3 = *(_QWORD *)(v2 + 16);
        free(*(void **)(v2 + 8));
        free((void *)v2);
        v2 = v3;
      }
      while (v3);
    }
  }
}

void _mdns_hostent_clear(uint64_t a1)
{
  void **v2;
  void *v3;
  void **v4;
  void *v5;
  void *v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  void *v11;

  if (a1)
  {
    free(*(void **)a1);
    *(_QWORD *)a1 = 0;
    v2 = *(void ***)(a1 + 8);
    if (v2)
    {
      v3 = *v2;
      if (*v2)
      {
        v4 = v2 + 1;
        do
        {
          free(v3);
          v5 = *v4++;
          v3 = v5;
        }
        while (v5);
      }
      v6 = *(void **)(a1 + 8);
    }
    else
    {
      v6 = 0;
    }
    free(v6);
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 32) = 0;
    v7 = *(void ***)(a1 + 24);
    if (v7)
    {
      v8 = *v7;
      if (*v7)
      {
        v9 = v7 + 1;
        do
        {
          free(v8);
          v10 = *v9++;
          v8 = v10;
        }
        while (v10);
      }
      v11 = *(void **)(a1 + 24);
    }
    else
    {
      v11 = 0;
    }
    free(v11);
    *(_QWORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 36) = 0;
  }
}

uint64_t LI_set_thread_list(int a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = (uint64_t)LI_get_thread_info(a1);
  if (result)
  {
    v4 = result;
    si_list_release(*(_QWORD *)(result + 8));
    result = si_list_reset(a2);
    *(_QWORD *)(v4 + 8) = a2;
  }
  return result;
}

uint64_t si_list_reset(uint64_t result)
{
  if (result)
    *(_DWORD *)(result + 8) = 0;
  return result;
}

uint64_t _mdns_atfork_prepare()
{
  return pthread_mutex_lock(&_mdns_mutex);
}

uint64_t _mdns_atfork_parent()
{
  return pthread_mutex_unlock(&_mdns_mutex);
}

int initgroups(const char *a1, int a2)
{
  int v3;
  int v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v3 = 16;
  getgrouplist_internal((uint64_t)a1, a2, v4, &v3);
  return (int)__initgroups() >> 31;
}

servent *__cdecl getservbyport(int a1, const char *a2)
{
  _QWORD *v2;
  servent *v3;

  v2 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v2 = si_module_with_name("search");
    si_search_search = (uint64_t)v2;
  }
  v3 = (servent *)si_service_byport((uint64_t)v2);
  LI_set_thread_item(209, (uint64_t)v3);
  if (v3)
    return v3 + 1;
  else
    return 0;
}

uint64_t search_service_byport(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 9u, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_service_byport(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 216;
          if (!*(_DWORD *)(v1 + 232))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t si_service_byport(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 176)) != 0)
    return v1();
  else
    return 0;
}

FILE *file_service_byport(uint64_t a1, unsigned int a2, char *a3)
{
  return _fsi_get_service(a1, 0, a3, a2, 2);
}

unsigned int *cache_service_byport(uint64_t a1, int a2, char *a3)
{
  return cache_fetch_item(a1, 9u, a3, a2, 2);
}

group *__cdecl getgrnam(const char *a1)
{
  _QWORD *v1;
  group *v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = (group *)si_group_byname((uint64_t)v1);
  LI_set_thread_item(102, (uint64_t)v2);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

uint64_t search_group_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 2u, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_group_byname(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 48;
          if (!*(_DWORD *)(v1 + 64))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t getaddrinfo_async_handle_reply(uint64_t a1)
{
  si_async_handle_reply(a1);
  return 0;
}

void si_async_handle_reply(uint64_t a1)
{
  uint64_t unit;
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;

  unit = si_async_worklist_find_unit(*(_DWORD *)(a1 + 12));
  if (unit)
  {
    v2 = unit;
    if ((*(_DWORD *)(unit + 60) & 1) != 0)
    {
      v3 = *(void (**)(_QWORD, _QWORD, _QWORD))(unit + 72);
      if (v3)
      {
        v4 = 104;
        if ((*(_DWORD *)(unit + 60) & 2) == 0)
          v4 = 96;
        v3(*(_QWORD *)(unit + v4), *(unsigned int *)(unit + 56), *(_QWORD *)(unit + 80));
        *(_QWORD *)(v2 + 96) = 0;
        *(_QWORD *)(v2 + 104) = 0;
      }
      si_async_workunit_release(v2);
    }
  }
}

uint64_t si_async_worklist_find_unit(int a1)
{
  uint64_t i;

  pthread_mutex_lock(&module_mutex);
  for (i = si_async_worklist; i; i = *(_QWORD *)(i + 112))
  {
    if (*(_DWORD *)(i + 88) == a1)
      break;
  }
  pthread_mutex_unlock(&module_mutex);
  return i;
}

void __si_async_call_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  char *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  mach_port_t v11;
  mach_msg_header_t msg;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (unsigned __int8 *)(v1 + 60);
  if ((*(_DWORD *)(v1 + 60) & 1) != 0)
    goto LABEL_11;
  v3 = *(_QWORD *)v1;
  v4 = *(_DWORD *)(v1 + 8);
  v5 = *(char **)(v1 + 16);
  v6 = *(_BYTE **)(v1 + 24);
  v7 = *(char **)(v1 + 32);
  v8 = *(unsigned int *)(v1 + 40);
  v9 = *(unsigned int *)(v1 + 44);
  if ((*(_DWORD *)(v1 + 60) & 2) != 0)
    *(_QWORD *)(v1 + 104) = si_list_call(v3, v4, v5, v6, v7, v8, v9, *(_DWORD *)(v1 + 48), *(_DWORD *)(v1 + 52), (int *)(v1 + 56));
  else
    *(_QWORD *)(v1 + 96) = si_item_call(v3, v4, v5, (uint64_t)v6, (uint64_t)v7, v8, v9, (int *)(v1 + 56));
  memset(&msg, 0, sizeof(msg));
  do
    v10 = __ldaxr(v2);
  while (__stlxr(v10 | 1, v2));
  if ((v10 & 1) != 0)
  {
LABEL_11:
    si_async_workunit_release(v1);
  }
  else
  {
    v11 = *(_DWORD *)(v1 + 92);
    *(_DWORD *)(v1 + 92) = 0;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_remote_port = v11;
    *(_QWORD *)&msg.msgh_bits = 0x1800000012;
    msg.msgh_id = *(_DWORD *)(v1 + 8);
    if ((mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0) - 268435459) <= 1)
      mach_msg_destroy(&msg);
    si_async_workunit_release(v1);
  }
}

void si_async_workunit_release(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  mach_port_name_t v13;
  ipc_space_t *v14;

  if (a1)
  {
    v2 = (unsigned int *)(a1 + 64);
    do
    {
      v3 = __ldaxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
    {
      pthread_mutex_lock(&module_mutex);
      v5 = &si_async_worklist;
      v6 = si_async_worklist;
      if (si_async_worklist == a1)
      {
LABEL_9:
        *v5 = *(_QWORD *)(a1 + 112);
      }
      else
      {
        while (v6)
        {
          v7 = v6;
          v6 = *(_QWORD *)(v6 + 112);
          if (v6 == a1)
          {
            v5 = (uint64_t *)(v7 + 112);
            goto LABEL_9;
          }
        }
      }
      pthread_mutex_unlock(&module_mutex);
      v8 = *(unsigned int **)(a1 + 96);
      if (v8)
        si_item_release(v8);
      v9 = *(_QWORD *)(a1 + 104);
      if (v9)
        si_list_release(v9);
      v10 = *(void **)(a1 + 16);
      if (v10)
        free(v10);
      v11 = *(void **)(a1 + 24);
      if (v11)
        free(v11);
      v12 = *(void **)(a1 + 32);
      if (v12)
        free(v12);
      v13 = *(_DWORD *)(a1 + 92);
      v14 = (ipc_space_t *)MEMORY[0x1E0C883F0];
      if (v13)
        mach_port_deallocate(*MEMORY[0x1E0C883F0], v13);
      mach_port_mod_refs(*v14, *(_DWORD *)(a1 + 88), 1u, -1);
      free((void *)a1);
    }
  }
}

unsigned int *si_list_call(uint64_t a1, int a2, _BYTE *a3, _BYTE *a4, char *a5, unsigned int a6, uint64_t a7, unsigned int a8, int a9, int *a10)
{
  uint64_t (*v10)(void);
  unsigned int *result;

  if (!a1)
    return 0;
  if (a2 <= 9)
  {
    if (a2 == 2)
    {
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 40);
      if (v10)
        return (unsigned int *)v10();
    }
    else if (a2 == 5)
    {
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 72);
      if (v10)
        return (unsigned int *)v10();
    }
    return 0;
  }
  switch(a2)
  {
    case 10:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 112);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 11:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
    case 20:
    case 21:
    case 23:
    case 24:
    case 26:
    case 27:
      return 0;
    case 13:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 136);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 16:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 160);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 19:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 184);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 22:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 208);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 25:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 232);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 28:
      v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 256);
      if (v10)
        return (unsigned int *)v10();
      return 0;
    case 29:
      result = si_addrinfo(a1, a3, a4, a6, a7, a8, a9, a5, a10);
      break;
    default:
      if (a2 == 34)
      {
        v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 280);
        if (v10)
          return (unsigned int *)v10();
      }
      return 0;
  }
  return result;
}

uint64_t getaddrinfo_async_start(unsigned int *a1, char *a2, char *a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unsigned int v8;

  v6 = 11;
  if (a1)
  {
    v8 = _getaddrinfo_interface_async_call(a2, a3, a4, 0, a5, a6);
    *a1 = v8;
    if (v8)
      return 0;
    else
      return 11;
  }
  return v6;
}

_QWORD *_getaddrinfo_interface_async_call(char *a1, char *a2, int *a3, const char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  int v14;
  _QWORD *result;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  if (a3)
  {
    v11 = a3[2];
    v12 = a3[3];
    v14 = *a3;
    v13 = a3[1];
  }
  else
  {
    v13 = 0;
    v11 = 0;
    v12 = 0;
    v14 = 0;
  }
  result = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040CC6EE3FDuLL);
  if (result)
  {
    v16 = (uint64_t)result;
    if (!v14)
      v14 = 1536;
    *result = a5;
    result[1] = a6;
    result[2] = 15;
    v17 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v17 = si_module_with_name("search");
      si_search_search = (uint64_t)v17;
    }
    LODWORD(v18) = v14;
    return (_QWORD *)si_async_call((uint64_t)v17, 29, a1, a2, a4, v13, v11, v12, v18, (uint64_t)si_libinfo_addrinfo_callback, v16);
  }
  return result;
}

uint64_t si_async_call(uint64_t a1, uint64_t a2, char *__s1, char *a4, const char *a5, uint64_t a6, uint64_t a7, size_t size, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result;
  unsigned int v13;
  int v14;
  int v15;
  char *v17;
  unsigned int v19;
  uint64_t (*v20)(uint64_t, uint64_t, char *, char *, const char *, uint64_t, uint64_t, size_t, uint64_t, uint64_t, uint64_t);
  char *v21;
  char *v22;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  mach_port_name_t v28;
  NSObject *global_queue;
  _QWORD block[5];
  int v31;
  mach_port_name_t name[2];

  result = 0;
  if (!a1 || !a10)
    return result;
  v13 = size;
  v14 = a7;
  v15 = a6;
  v17 = a4;
  v19 = a2;
  v20 = *(uint64_t (**)(uint64_t, uint64_t, char *, char *, const char *, uint64_t, uint64_t, size_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 336);
  if (v20)
    return v20(a1, a2, __s1, a4, a5, a6, a7, size, a9, a10, a11);
  if ((_DWORD)a2 != 30 && (_DWORD)a2 != 12)
  {
    if (__s1)
    {
      v22 = strdup(__s1);
      if (!v22)
        return 0;
      goto LABEL_14;
    }
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  if (!(_DWORD)size)
    goto LABEL_13;
  v21 = (char *)malloc_type_calloc(1uLL, size, 0xE07DE50AuLL);
  if (!v21)
    return 0;
  v22 = v21;
  memcpy(v21, __s1, v13);
LABEL_14:
  if (v17)
  {
    v17 = strdup(v17);
    if (!v17)
    {
      if (v22)
      {
        v24 = v22;
LABEL_43:
        free(v24);
      }
      return 0;
    }
  }
  if (a5)
  {
    v23 = strdup(a5);
    if (!v23)
    {
      if (v22)
        free(v22);
      if (!v17)
        return 0;
      v24 = v17;
      goto LABEL_43;
    }
  }
  else
  {
    v23 = 0;
  }
  v25 = malloc_type_calloc(1uLL, 0x78uLL, 0x10B004069716B4FuLL);
  if (!v25)
  {
    if (v22)
      free(v22);
    if (v17)
      free(v17);
    if (!v23)
      return 0;
    v24 = v23;
    goto LABEL_43;
  }
  v26 = (uint64_t)v25;
  *(_QWORD *)name = 0;
  v31 = 0;
  if (mach_port_allocate(*MEMORY[0x1E0C883F0], 1u, &name[1])
    || MEMORY[0x194021850](*MEMORY[0x1E0C883F0], name[1], 21, name, &v31))
  {
    if (name[1])
      mach_port_mod_refs(*MEMORY[0x1E0C883F0], name[1], 1u, -1);
    if (v22)
      free(v22);
    if (v17)
      free(v17);
    if (v23)
      free(v23);
    v24 = (void *)v26;
    goto LABEL_43;
  }
  v27 = 0;
  *(_QWORD *)v26 = a1;
  *(_DWORD *)(v26 + 8) = v19;
  *(_QWORD *)(v26 + 16) = v22;
  *(_QWORD *)(v26 + 24) = v17;
  *(_QWORD *)(v26 + 32) = v23;
  *(_DWORD *)(v26 + 40) = v15;
  *(_DWORD *)(v26 + 44) = v14;
  *(_DWORD *)(v26 + 48) = v13;
  *(_DWORD *)(v26 + 52) = a9;
  *(_DWORD *)(v26 + 64) = 2;
  if (v19 <= 0x22 && ((1 << v19) & 0x432492464) != 0)
    v27 = 2;
  *(_DWORD *)(v26 + 60) = v27;
  *(_QWORD *)(v26 + 72) = a10;
  *(_QWORD *)(v26 + 80) = a11;
  v28 = name[0];
  *(_DWORD *)(v26 + 88) = name[1];
  *(_DWORD *)(v26 + 92) = v28;
  pthread_mutex_lock(&module_mutex);
  *(_QWORD *)(v26 + 112) = si_async_worklist;
  si_async_worklist = v26;
  pthread_mutex_unlock(&module_mutex);
  global_queue = dispatch_get_global_queue(0, 2uLL);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __si_async_call_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = v26;
  dispatch_async(global_queue, block);
  return *(unsigned int *)(v26 + 88);
}

uint64_t gai_log_init()
{
  _gai_log = (uint64_t)os_log_create("com.apple.network.libinfo", "getaddrinfo");
  return pthread_atfork(0, 0, gai_child_has_forked);
}

void set_loopback_ifindex()
{
  ifaddrs *v0;
  sockaddr *ifa_addr;
  ifaddrs *v2;

  v2 = 0;
  if ((getifaddrs(&v2) & 0x80000000) == 0)
  {
    if (v2)
    {
      v0 = v2;
      while (1)
      {
        ifa_addr = v0->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18 && (v0->ifa_flags & 8) != 0)
            break;
        }
        v0 = v0->ifa_next;
        if (!v0)
          goto LABEL_10;
      }
      kLoopbackIndex = *(unsigned __int16 *)ifa_addr->sa_data;
    }
LABEL_10:
    freeifaddrs(v2);
  }
}

uint64_t si_destination_compare_init_once()
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  cache_timeout = 1000000000 * (unint64_t)info.denom / info.numer;
  si_destination_log = (uint64_t)os_log_create("com.apple.network.libinfo", "si_destination_compare");
  si_compare_settings_0 = 1;
  si_compare_settings_1 = 1;
  si_compare_settings_2 = 1;
  return pthread_atfork(0, 0, si_destination_compare_child_has_forked);
}

void _gai_load_libnetwork_once()
{
  BOOL v0;
  char *v2;
  NSObject *v3;

  if (nat64_v4_requires_synthesis)
    v0 = 0;
  else
    v0 = nat64_v4_synthesize == 0;
  if (v0 && path_check == 0)
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_DEBUG))
      _gai_load_libnetwork_once_cold_5();
    _gai_load_libnetwork_once_handle = (uint64_t)dlopen("/usr/lib/libnetwork.dylib", 5);
    if (_gai_load_libnetwork_once_handle)
    {
      if (!nat64_v4_requires_synthesis)
      {
        pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
        if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR))
          _gai_load_libnetwork_once_cold_4();
      }
      if (!nat64_v4_synthesize)
      {
        pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
        if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR))
          _gai_load_libnetwork_once_cold_3();
      }
      if (!path_check)
      {
        pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
        if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR))
          _gai_load_libnetwork_once_cold_2();
      }
    }
    else
    {
      v2 = dlerror();
      pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
      v3 = _gai_log;
      if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR))
        _gai_load_libnetwork_once_cold_1(v2, v3);
    }
  }
}

void _LI_data_free(_QWORD *a1)
{
  unint64_t v2;
  unint64_t i;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v2 = *(unsigned int *)a1;
    if ((_DWORD)v2)
    {
      for (i = 0; i < v2; ++i)
      {
        v4 = a1[2];
        v5 = *(_QWORD *)(v4 + 8 * i);
        if (v5)
        {
          si_item_release(*(unsigned int **)v5);
          si_list_release(*(_QWORD *)(v5 + 8));
          free((void *)v5);
          v4 = a1[2];
          v2 = *(unsigned int *)a1;
        }
        *(_QWORD *)(v4 + 8 * i) = 0;
      }
    }
    v6 = (void *)a1[1];
    if (v6)
      free(v6);
    a1[1] = 0;
    v7 = (void *)a1[2];
    if (v7)
      free(v7);
    free(a1);
  }
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  ifaddrs *v4;
  ifaddrs *v5;
  sockaddr *ifa_addr;
  int v7;
  ifaddrs *v9;

  v9 = 0;
  if (getifaddrs(&v9) < 0)
    return 0;
  v4 = v9;
  if (v9)
  {
    v5 = v9;
    while (1)
    {
      ifa_addr = v5->ifa_addr;
      if (ifa_addr)
      {
        if (ifa_addr->sa_family == 18 && *(unsigned __int16 *)ifa_addr->sa_data == a1)
          break;
      }
      v5 = v5->ifa_next;
      if (!v5)
        goto LABEL_8;
    }
    strncpy(a2, v5->ifa_name, 0x10uLL);
    v7 = 0;
    v4 = v9;
  }
  else
  {
LABEL_8:
    a2 = 0;
    v7 = 6;
  }
  freeifaddrs(v4);
  *__error() = v7;
  return a2;
}

void endgrent(void)
{
  LI_set_thread_list(2, 0);
}

void herror(const char *a1)
{
  const char **v1;
  const char *v2;
  size_t v3;
  _QWORD *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v1 = (const char **)v5;
    if (*a1)
    {
      v5[0] = a1;
      v5[1] = strlen(a1);
      v5[2] = ": ";
      v5[3] = 2;
      v1 = (const char **)v6;
    }
  }
  else
  {
    v1 = (const char **)v5;
  }
  if (h_errno < 0)
  {
    v2 = "Resolver internal error";
  }
  else if (h_errno > 4)
  {
    v2 = "Unknown resolver error";
  }
  else
  {
    v2 = h_errlist[h_errno];
  }
  *v1 = v2;
  v3 = strlen(v2);
  v1[2] = "\n";
  v4 = v1 + 2;
  *(v4 - 1) = v3;
  v4[1] = 1;
  writev_NOCANCEL();
}

const char *__cdecl hstrerror(int a1)
{
  if (a1 < 0)
    return "Resolver internal error";
  if (a1 > 4)
    return "Unknown resolver error";
  return h_errlist[a1];
}

uint64_t dn_expand(uint64_t a1, unint64_t a2, _BYTE *a3, _BYTE *a4, int a5)
{
  unsigned __int8 *v5;
  unsigned int v6;
  int v7;
  int v8;
  _BYTE *v9;
  unint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  char v14;
  int v15;
  unsigned __int8 *v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned __int8 *v20;
  unsigned int v21;
  unsigned int v22;

  v5 = a3 + 1;
  v6 = *a3;
  if (*a3)
  {
    v7 = 0;
    v8 = -1;
    v9 = a4;
    v10 = (unint64_t)&a4[a5];
    while (1)
    {
      if ((v6 & 0xC0) == 0xC0)
      {
        v16 = (unsigned __int8 *)(a1 + (*v5 | ((v6 & 0x3F) << 8)));
        if ((unint64_t)v16 >= a2)
          return 0xFFFFFFFFLL;
        v17 = (_DWORD)v5 - (_DWORD)a3;
        if (v8 < 0)
          v8 = v17 + 1;
        v7 += 2;
        if ((uint64_t)(a2 - a1) <= v7)
          return 0xFFFFFFFFLL;
        v5 = v16;
      }
      else
      {
        if ((v6 & 0xC0) != 0)
          return 0xFFFFFFFFLL;
        v11 = a4;
        if (v9 != a4)
        {
          if ((unint64_t)v9 >= v10)
            return 0xFFFFFFFFLL;
          *v9 = 46;
          v11 = v9 + 1;
        }
        if ((unint64_t)&v11[v6] >= v10)
          return 0xFFFFFFFFLL;
        v12 = v6;
        v7 += v6 + 1;
        while (v12-- >= 1)
        {
          v15 = *v5++;
          v14 = v15;
          if (v15 == 46)
          {
            if ((unint64_t)&v11[v12 + 2] >= v10)
              return 0xFFFFFFFFLL;
            *v11++ = 92;
          }
          *v11++ = v14;
          if ((unint64_t)v5 >= a2)
            return 0xFFFFFFFFLL;
        }
        v9 = v11;
      }
      v18 = *v5++;
      v6 = v18;
      if (!v18)
        goto LABEL_25;
    }
  }
  v8 = -1;
  v9 = a4;
LABEL_25:
  *v9 = 0;
  v19 = *a4;
  if (*a4)
  {
    v20 = a4 + 1;
    while ((v19 & 0x80) != 0 || (*(_DWORD *)(MEMORY[0x1E0C87458] + 4 * v19 + 60) & 0x4000) == 0)
    {
      v21 = *v20++;
      v19 = v21;
      if (!v21)
        goto LABEL_30;
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_30:
    v22 = (_DWORD)v5 - (_DWORD)a3;
    if (v8 >= 0)
      return v8;
    else
      return v22;
  }
}

uint64_t __dn_skipname(_BYTE *a1, unint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;

  v2 = a1;
  if ((unint64_t)a1 >= a2)
  {
LABEL_10:
    if ((unint64_t)v2 <= a2)
      return ((_DWORD)v2 - (_DWORD)a1);
    else
      return 0xFFFFFFFFLL;
  }
  else
  {
    v2 = a1;
    while (1)
    {
      v3 = v2 + 1;
      v4 = *v2;
      if (!*v2)
      {
        ++v2;
        goto LABEL_10;
      }
      if ((v4 & 0xC0) != 0)
        break;
      v2 = &v3[v4];
      if ((unint64_t)&v3[v4] >= a2)
        goto LABEL_10;
    }
    if ((v4 & 0xC0) == 0xC0)
    {
      v2 += 2;
      goto LABEL_10;
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t _getshort(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

uint64_t _getlong(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t res_init()
{
  return 0;
}

uint64_t res_query(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, int a5)
{
  return _mdns_query(35, a1, a2, a3, a4, a5);
}

uint64_t _mdns_query(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, int a6)
{
  size_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int v13;
  int v14;

  LODWORD(v6) = a6;
  v8 = si_module_with_name("mdns");
  if (v8)
  {
    v9 = (uint64_t)v8;
    v10 = (*(uint64_t (**)(void))(v8[5] + 320))();
    if (v10)
    {
      v11 = (unsigned int *)v10;
      v12 = *(unsigned int *)(v10 + 32);
      if (((v12 | v6) & 0x80000000) != 0)
      {
        h_errno = 3;
        si_item_release((unsigned int *)v10);
        goto LABEL_15;
      }
      if ((int)v12 >= (int)v6)
        v6 = v6;
      else
        v6 = v12;
      memcpy(a5, *(const void **)(v10 + 40), v6);
      si_item_release(v11);
      if (v6 < 0xC)
        goto LABEL_16;
      v13 = BYTE3(*a5) & 0xF;
      if (!v13)
      {
        if ((*a5 & 0xFFFF000000000000) != 0)
          goto LABEL_16;
        v14 = 4;
        goto LABEL_12;
      }
      if (v13 == 2)
      {
        v14 = 2;
        goto LABEL_12;
      }
      if (v13 != 3)
      {
        v14 = 3;
        goto LABEL_12;
      }
    }
    v14 = 1;
LABEL_12:
    h_errno = v14;
LABEL_15:
    v12 = 0xFFFFFFFFLL;
LABEL_16:
    si_module_release(v9);
    return v12;
  }
  h_errno = 3;
  return 0xFFFFFFFFLL;
}

uint64_t res_search(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, int a5)
{
  return _mdns_query(36, a1, a2, a3, a4, a5);
}

if_nameindex *if_nameindex(void)
{
  ifaddrs *v0;
  uint64_t v1;
  uint64_t v2;
  sockaddr *ifa_addr;
  size_t v4;
  BOOL v5;
  uint64_t v6;
  if_nameindex *v7;
  uint64_t v8;
  if_nameindex *v9;
  ifaddrs *v10;
  if_nameindex *v11;
  char *v12;
  sockaddr *v13;
  char *v14;
  ifaddrs *v16;

  v16 = 0;
  if ((getifaddrs(&v16) & 0x80000000) == 0)
  {
    v0 = v16;
    if (v16)
    {
      v1 = 0;
      LODWORD(v2) = 0;
      while (1)
      {
        ifa_addr = v0->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18)
          {
            v4 = strlen(v0->ifa_name);
            v5 = __CFADD__(v1, v4 + 1);
            v1 += v4 + 1;
            if (v5)
              break;
            v2 = v2 + 1;
            v6 = v2 << 31 >> 31;
            if (v6 != v2 || v6 < 0)
              break;
          }
        }
        v0 = v0->ifa_next;
        if (!v0)
          goto LABEL_13;
      }
    }
    else
    {
      LODWORD(v2) = 0;
      v1 = 0;
LABEL_13:
      v8 = 16 * v2 + 16;
      if (!__CFADD__(v8, v1))
      {
        v9 = (if_nameindex *)malloc_type_malloc(v8 + v1, 0xD2F6EC27uLL);
        v7 = v9;
        if (v9)
        {
          v10 = v16;
          v11 = v9;
          if (v16)
          {
            v12 = (char *)&v9[(v2 + 1)];
            v11 = v9;
            do
            {
              v13 = v10->ifa_addr;
              if (v13 && v13->sa_family == 18)
              {
                v11->if_index = *(unsigned __int16 *)v13->sa_data;
                v11->if_name = v12;
                v14 = strcpy(v12, v10->ifa_name);
                ++v11;
                v12 += strlen(v14) + 1;
              }
              v10 = v10->ifa_next;
            }
            while (v10);
          }
          v11->if_index = 0;
          v11->if_name = 0;
        }
        goto LABEL_24;
      }
    }
    v7 = 0;
    *__error() = 84;
LABEL_24:
    freeifaddrs(v16);
    return v7;
  }
  return 0;
}

int inet6_option_space(int a1)
{
  return ((a1 + 9) & 0xFFFFFFF8) + 12;
}

int inet6_option_init(void *a1, cmsghdr **a2, int a3)
{
  int result;

  if ((a3 - 51) < 0xFFFFFFFE)
    return -1;
  result = 0;
  *((_DWORD *)a1 + 2) = a3;
  *(_QWORD *)a1 = 0x290000000CLL;
  *a2 = (cmsghdr *)a1;
  return result;
}

int inet6_option_append(cmsghdr *a1, const __uint8_t *a2, int a3, int a4)
{
  int result;
  uint64_t cmsg_len;
  int v8;
  _BYTE *v9;
  int v10;
  char *v11;
  unsigned int v12;
  char *v13;
  int v14;

  result = -1;
  if (a3 <= 8 && ((1 << a3) & 0x116) != 0 && a4 <= 7)
  {
    v8 = (_DWORD)a1 + 12;
    cmsg_len = a1->cmsg_len;
    v9 = (char *)a1 + cmsg_len;
    if ((_DWORD)cmsg_len == 12)
    {
      v9 += 2;
      a1->cmsg_len = 14;
    }
    v10 = (a4 - ((int)v9 - v8) % a3 + ((a3 + ((int)v9 - v8) % a3 - 1) & -a3)) % a3;
    inet6_insert_padopt(v9, v10);
    a1->cmsg_len += v10;
    v11 = &v9[v10];
    if (*a2)
      v12 = a2[1] + 2;
    else
      v12 = 1;
    memcpy(v11, a2, v12);
    v13 = &v11[v12];
    a1->cmsg_len += v12;
    v14 = (((_DWORD)v13 - v8 + 7) & 0xFFFFFFF8) - ((_DWORD)v13 - v8);
    inet6_insert_padopt(v13, v14);
    result = 0;
    a1->cmsg_len += v14;
    BYTE1(a1[1].cmsg_len) = (((_DWORD)v13 + v14 - v8) >> 3) - 1;
  }
  return result;
}

void inet6_insert_padopt(_BYTE *a1, int a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      *a1 = 0;
    }
    else
    {
      *a1 = 1;
      a1[1] = a2 - 2;
      bzero(a1 + 2, a2 - 2);
    }
  }
}

__uint8_t *__cdecl inet6_option_alloc(cmsghdr *a1, int a2, int a3, int a4)
{
  __uint8_t *v4;
  uint64_t cmsg_len;
  int v8;
  _BYTE *v9;
  int v10;
  __uint8_t *v11;
  int v12;

  v4 = 0;
  if (a3 <= 8 && ((1 << a3) & 0x116) != 0)
  {
    if (a4 <= 7)
    {
      v8 = (_DWORD)a1 + 12;
      cmsg_len = a1->cmsg_len;
      v9 = (char *)a1 + cmsg_len;
      if ((_DWORD)cmsg_len == 12)
      {
        v9 += 2;
        a1->cmsg_len = 14;
      }
      v10 = (a4 - ((int)v9 - v8) % a3 + ((a3 + ((int)v9 - v8) % a3 - 1) & -a3)) % a3;
      inet6_insert_padopt(v9, v10);
      v4 = &v9[v10];
      v11 = &v4[a2];
      a1->cmsg_len += v10 + a2;
      v12 = (((_DWORD)v11 - v8 + 7) & 0xFFFFFFF8) - ((_DWORD)v11 - v8);
      inet6_insert_padopt(v11, v12);
      a1->cmsg_len += v12;
      BYTE1(a1[1].cmsg_len) = (((_DWORD)v11 + v12 - v8) >> 3) - 1;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

int inet6_option_next(const cmsghdr *a1, __uint8_t **a2)
{
  unint64_t cmsg_len;
  uint64_t v3;
  __uint8_t *v4;
  __uint8_t *v5;
  uint64_t v6;
  __uint8_t *v7;
  uint64_t v8;

  if (a1->cmsg_level != 41)
    return -1;
  if ((a1->cmsg_type - 49) > 1)
    return -1;
  cmsg_len = a1->cmsg_len;
  if (cmsg_len < 0x10)
    return -1;
  v3 = 8 * BYTE1(a1[1].cmsg_len);
  if ((unint64_t)(((_WORD)v3 + 11) & 0xFF8) + 12 > cmsg_len)
    return -1;
  v4 = (__uint8_t *)&a1[1].cmsg_type + v3;
  v5 = *a2;
  if (*a2)
  {
    if (*v5)
    {
      if (v5 + 2 > v4)
        return -1;
      v6 = v5[1] + 2;
    }
    else
    {
      v6 = 1;
    }
    v7 = &v5[v6];
    if (v7 > v4)
      return -1;
  }
  else
  {
    v7 = (__uint8_t *)&a1[1].cmsg_len + 2;
  }
  *a2 = v7;
  if (v7 >= v4)
  {
    *a2 = 0;
    return -1;
  }
  if (*v7)
  {
    if (v7 + 2 <= v4)
    {
      v8 = v7[1] + 2;
      goto LABEL_19;
    }
    return -1;
  }
  v8 = 1;
LABEL_19:
  if (&v7[v8] <= v4)
    return 0;
  else
    return -1;
}

int inet6_option_find(const cmsghdr *a1, __uint8_t **a2, int a3)
{
  unint64_t cmsg_len;
  uint64_t v4;
  int result;
  __uint8_t *v6;
  __uint8_t *v7;
  uint64_t v8;
  __uint8_t *v9;
  uint64_t v10;

  if (a1->cmsg_level != 41)
    return -1;
  if ((a1->cmsg_type - 49) > 1)
    return -1;
  cmsg_len = a1->cmsg_len;
  if (cmsg_len < 0x10)
    return -1;
  v4 = 8 * BYTE1(a1[1].cmsg_len);
  if ((unint64_t)(((_WORD)v4 + 11) & 0xFF8) + 12 > cmsg_len)
    return -1;
  v6 = (__uint8_t *)&a1[1].cmsg_type + v4;
  v7 = *a2;
  if (!*a2)
  {
    v9 = (__uint8_t *)&a1[1].cmsg_len + 2;
    goto LABEL_13;
  }
  if (*v7)
  {
    if (v7 + 2 > v6)
      return -1;
    v8 = v7[1] + 2;
  }
  else
  {
    v8 = 1;
  }
  v9 = &v7[v8];
  if (v9 > v6)
    return -1;
LABEL_13:
  *a2 = v9;
  while (1)
  {
    if (v9 >= v6)
    {
      v9 = 0;
      result = -1;
      goto LABEL_24;
    }
    if (*v9 == a3)
      break;
    if (*v9)
    {
      if (v9 + 2 > v6)
        return -1;
      v10 = v9[1] + 2;
    }
    else
    {
      v10 = 1;
    }
    v9 += v10;
    if (v9 > v6)
      return -1;
  }
  result = 0;
LABEL_24:
  *a2 = v9;
  return result;
}

int inet6_opt_init(void *a1, socklen_t a2)
{
  int result;

  result = -1;
  if (a2 && (a2 & 7) == 0)
  {
    if (a1)
      *((_BYTE *)a1 + 1) = (a2 >> 3) - 1;
    return 2;
  }
  return result;
}

int inet6_opt_append(void *a1, socklen_t a2, int a3, __uint8_t a4, socklen_t a5, __uint8_t a6, void **a7)
{
  socklen_t v7;
  char v8;
  signed int v11;
  int v12;
  __uint8_t *v13;
  int v14;
  char *v15;

  v7 = -1;
  if (a4 >= 2u)
  {
    v8 = a5;
    if (a5 <= 0xFF && a6 <= 8u && ((1 << a6) & 0x116) != 0 && a6 <= a5)
    {
      v11 = a3 + a5 + 2;
      if (v11 % a6)
        v12 = a6 - v11 % a6;
      else
        v12 = 0;
      v7 = v12 + v11;
      if (a2 && v7 > a2)
      {
        return -1;
      }
      else if (a1)
      {
        v13 = (__uint8_t *)a1 + a3;
        if (v12 == 1)
        {
          *v13++ = 0;
        }
        else if (v12 >= 1)
        {
          *v13 = 1;
          v14 = v12 - 2;
          v15 = (char *)(v13 + 2);
          v13[1] = v12 - 2;
          bzero(v13 + 2, v12 - 2);
          v13 = (__uint8_t *)&v15[v14];
        }
        *v13 = a4;
        v13[1] = v8;
        *a7 = v13 + 2;
      }
    }
  }
  return v7;
}

int inet6_opt_finish(void *a1, socklen_t a2, int a3)
{
  socklen_t v3;
  int v4;
  char *v5;

  if (a3 > 0)
    v3 = ((a3 - 1) | 7) + 1;
  else
    v3 = 0;
  if (a1)
  {
    if (v3 <= a2)
    {
      v4 = v3 - a3;
      v5 = (char *)a1 + a3;
      if (v3 - a3 == 1)
      {
        *v5 = 0;
      }
      else if (v4 >= 1)
      {
        *v5 = 1;
        v5[1] = v4 - 2;
        bzero(v5 + 2, (v4 - 2));
      }
    }
    else
    {
      return -1;
    }
  }
  return v3;
}

int inet6_opt_set_val(void *a1, int a2, void *a3, socklen_t a4)
{
  memcpy((char *)a1 + a2, a3, a4);
  return a4 + a2;
}

int inet6_opt_next(void *a1, socklen_t a2, int a3, __uint8_t *a4, socklen_t *a5, void **a6)
{
  int v6;
  char *v7;
  char *v8;
  int v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  v6 = -1;
  if (a2 && (a2 & 7) == 0)
  {
    v7 = (char *)a1 + a2;
    v8 = (char *)a1 + 2;
    if (a3)
      v8 = (char *)a1 + a3;
    while (1)
    {
      while (1)
      {
        if (v8 >= v7)
          goto LABEL_14;
        v9 = *v8;
        if (v9 != 1)
          break;
        if (v8 + 2 <= v7)
        {
          v8 += v8[1] + 2;
          if (v8 <= v7)
            continue;
        }
        goto LABEL_14;
      }
      if (*v8)
        break;
      ++v8;
    }
    v10 = v8 + 2;
    if (v8 + 2 > v7 || (v11 = v8[1], v12 = (unint64_t)&v8[v11 + 2], v12 > (unint64_t)v7))
    {
LABEL_14:
      *a6 = 0;
      return -1;
    }
    *a4 = v9;
    *a5 = v11;
    v6 = v12 - (_DWORD)a1;
    *a6 = v10;
  }
  return v6;
}

int inet6_opt_find(void *a1, socklen_t a2, int a3, __uint8_t a4, socklen_t *a5, void **a6)
{
  int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  char *v10;

  v6 = -1;
  if (a2 && (a2 & 7) == 0)
  {
    v7 = (char *)a1 + a2;
    v8 = (char *)a1 + 2;
    if (a3)
      v8 = (char *)a1 + a3;
    if (v8 < v7)
    {
      do
      {
        if (*v8)
        {
          if (v8 + 2 > v7)
            break;
          v9 = v8[1] + 2;
        }
        else
        {
          v9 = 1;
        }
        v10 = &v8[v9];
        if (v10 > v7)
          break;
        if (*v8 == a4)
        {
          *a5 = v9 - 2;
          *a6 = v8 + 2;
          return (_DWORD)v10 - (_DWORD)a1;
        }
        v8 += v9;
      }
      while (v10 < v7);
    }
    *a6 = 0;
    return -1;
  }
  return v6;
}

int inet6_opt_get_val(void *a1, int a2, void *a3, socklen_t a4)
{
  memcpy(a3, (char *)a1 + a2, a4);
  return a4 + a2;
}

size_t inet6_rthdr_space(int a1, int a2)
{
  if ((a2 - 24) >= 0xFFFFFFE9 && a1 == 0)
    return 16 * a2 + 20;
  else
    return 0;
}

cmsghdr *__cdecl inet6_rthdr_init(cmsghdr *result, int a2)
{
  *(_QWORD *)&result->cmsg_level = 0x1800000029;
  if (a2)
    return 0;
  result->cmsg_len = 20;
  *(_QWORD *)&result[1].cmsg_len = 0;
  BYTE2(result[1].cmsg_len) = 0;
  return result;
}

int inet6_rthdr_add(cmsghdr *a1, const in6_addr *a2, unsigned int a3)
{
  int result;
  int cmsg_len_high;
  uint64_t v6;

  result = -1;
  if (a3 <= 1 && !BYTE2(a1[1].cmsg_len) && !a3)
  {
    cmsg_len_high = HIBYTE(a1[1].cmsg_len);
    if (cmsg_len_high != 23)
    {
      result = 0;
      HIBYTE(a1[1].cmsg_len) = cmsg_len_high + 1;
      v6 = BYTE1(a1[1].cmsg_len);
      *(in6_addr *)(&a1[1].cmsg_type + 2 * v6) = *a2;
      LOBYTE(v6) = v6 + 2;
      BYTE1(a1[1].cmsg_len) = v6;
      a1->cmsg_len = 8 * v6 + 20;
    }
  }
  return result;
}

int inet6_rthdr_lasthop(cmsghdr *a1, unsigned int a2)
{
  BOOL v3;
  int v4;

  if (BYTE2(a1[1].cmsg_len))
    return -1;
  if (a2)
    v3 = 1;
  else
    v3 = HIBYTE(a1[1].cmsg_len) > 0x17u;
  v4 = v3;
  return v4 << 31 >> 31;
}

int inet6_rthdr_segments(const cmsghdr *a1)
{
  unsigned int v2;
  char v3;
  int v4;

  if (BYTE2(a1[1].cmsg_len))
    return -1;
  v2 = BYTE1(a1[1].cmsg_len);
  v3 = (v2 > 0x2E) | v2;
  v4 = v2 >> 1;
  if ((v3 & 1) != 0)
    return -1;
  else
    return v4;
}

in6_addr *__cdecl inet6_rthdr_getaddr(cmsghdr *a1, int a2)
{
  unsigned int v2;
  BOOL v5;
  in6_addr *v6;

  if (BYTE2(a1[1].cmsg_len))
    return 0;
  v2 = BYTE1(a1[1].cmsg_len);
  if (v2 > 0x2E || (v2 & 1) != 0)
    return 0;
  v5 = (int)(v2 >> 1) < a2;
  v6 = (in6_addr *)(&a1[1].cmsg_type + 4 * a2);
  if (v5)
    v6 = 0;
  if (a2 >= 1)
    return v6;
  else
    return 0;
}

int inet6_rthdr_getflags(const cmsghdr *a1, int a2)
{
  unsigned int v3;
  int v4;

  if (BYTE2(a1[1].cmsg_len))
    return -1;
  v3 = BYTE1(a1[1].cmsg_len);
  if (a2 <= v3 >> 1)
    v4 = 0;
  else
    v4 = -1;
  if (v3 <= 0x2E && (v3 & 1) == 0)
    return v4;
  else
    return -1;
}

socklen_t inet6_rth_space(int a1, int a2)
{
  if (a2 < 0x80 && a1 == 0)
    return (16 * a2) | 8;
  else
    return 0;
}

void *__cdecl inet6_rth_init(void *a1, socklen_t a2, int a3, int a4)
{
  void *result;
  char v5;

  if (a3)
    return 0;
  v5 = a4;
  result = 0;
  if (a4 <= 0x7F && ((16 * a4) | 8u) <= a2)
  {
    bzero(a1, a2);
    *((_BYTE *)a1 + 1) = 2 * v5;
    *((_WORD *)a1 + 1) = 0;
    *((_DWORD *)a1 + 1) = 0;
    return a1;
  }
  return result;
}

int inet6_rth_add(void *a1, const in6_addr *a2)
{
  uint64_t v3;
  int result;

  if (*((_BYTE *)a1 + 2))
    return -1;
  v3 = *((unsigned __int8 *)a1 + 3);
  if ((_DWORD)v3 == *((unsigned __int8 *)a1 + 1) >> 1)
    return -1;
  result = 0;
  *(in6_addr *)((char *)a1 + 16 * v3 + 8) = *a2;
  *((_BYTE *)a1 + 3) = v3 + 1;
  return result;
}

int inet6_rth_reverse(const void *a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 *v5;
  __int128 *v6;
  __int128 v7;

  if (*((_BYTE *)a1 + 2))
    return -1;
  v3 = *((unsigned __int8 *)a1 + 1);
  if ((v3 & 1) != 0)
    return -1;
  memmove(a2, a1, 8 * v3 + 8);
  *((_BYTE *)a2 + 3) = v3 >> 1;
  if (v3 >= 4)
  {
    LODWORD(v4) = v3 >> 2;
    v5 = (__int128 *)((char *)a2 + 8);
    if (v3 >> 2 <= 1)
      v4 = 1;
    else
      v4 = v4;
    v6 = (__int128 *)((char *)a2 + 16 * (v3 >> 1) - 8);
    do
    {
      v7 = *v5;
      *v5++ = *v6;
      *v6-- = v7;
      --v4;
    }
    while (v4);
  }
  return 0;
}

int inet6_rth_segments(const void *a1)
{
  unsigned int v1;
  unsigned int v2;

  if (*((_BYTE *)a1 + 2))
    return -1;
  v1 = *((unsigned __int8 *)a1 + 1);
  if ((v1 & 1) != 0)
    return -1;
  v2 = v1 >> 1;
  if (v2 < *((unsigned __int8 *)a1 + 3))
    return -1;
  else
    return v2;
}

in6_addr *__cdecl inet6_rth_getaddr(const void *a1, int a2)
{
  unsigned int v2;
  unsigned int v3;

  if (*((_BYTE *)a1 + 2))
    return 0;
  v2 = *((unsigned __int8 *)a1 + 1);
  if ((v2 & 1) != 0)
    return 0;
  v3 = v2 >> 1;
  if (v3 > a2 && v3 >= *((unsigned __int8 *)a1 + 3))
    return (in6_addr *)((char *)a1 + 16 * a2 + 8);
  else
    return 0;
}

const char *si_cache_add_list(const char *result, const char **a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  pthread_mutex_t *v9;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        if (result != (const char *)a2)
        {
          if (*(_DWORD *)(a3 + 4))
          {
            result = *a2;
            if (*a2)
            {
              result = (const char *)strcmp(result, *(const char **)v5);
              if ((_DWORD)result)
              {
                result = (const char *)si_module_allows_caching((_BOOL8)a2);
                if ((_DWORD)result)
                {
                  v6 = **(_QWORD **)(a3 + 16);
                  if (v6)
                  {
                    v7 = *(_DWORD *)(v6 + 8);
                    if (v7 <= 0x11)
                    {
                      v8 = *((_QWORD *)v5 + 4);
                      if (v8)
                      {
                        v9 = (pthread_mutex_t *)(v8 + 240 * v7);
                        pthread_mutex_lock(v9);
                        si_list_release(*(_QWORD *)(v8 + 240 * *(unsigned int *)(v6 + 8) + 232));
                        *(_QWORD *)(v8 + 240 * *(unsigned int *)(v6 + 8) + 232) = si_list_retain((unsigned int *)a3);
                        return (const char *)pthread_mutex_unlock(v9);
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
  }
  return result;
}

void cache_close(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t i;

  if (a1)
  {
    v1 = *(char **)(a1 + 32);
    if (v1)
    {
      v2 = 0;
      v3 = v1 + 72;
      do
      {
        si_list_release(*(_QWORD *)&v1[240 * v2 + 232]);
        for (i = 0; i != 160; i += 8)
        {
          si_item_release(*(unsigned int **)&v3[i]);
          *(_QWORD *)&v3[i] = 0;
        }
        pthread_mutex_destroy((pthread_mutex_t *)&v1[240 * v2++]);
        v3 += 240;
      }
      while (v2 != 18);
      free(v1);
    }
  }
}

unsigned int *cache_user_all(uint64_t a1)
{
  return cache_fetch_list(a1, 1u);
}

unsigned int *cache_group_all(uint64_t a1)
{
  return cache_fetch_list(a1, 2u);
}

unsigned int *cache_grouplist(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 3u, a2, 0, 1);
}

unsigned int *cache_alias_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 5u, a2, 0, 1);
}

unsigned int *cache_alias_all(uint64_t a1)
{
  return cache_fetch_list(a1, 5u);
}

unsigned int *cache_host_byname(uint64_t a1, char *a2, int a3, uint64_t a4, _DWORD *a5)
{
  unsigned int v8;
  unsigned int *result;

  if (a5)
    *a5 = 0;
  if (a3 == 2)
    v8 = 6;
  else
    v8 = 7;
  result = cache_fetch_item(a1, v8, a2, a3, 1);
  if (a5 && !result && !*a5)
    *a5 = 1;
  return result;
}

unsigned int *cache_host_byaddr(uint64_t a1, char *a2, int a3, uint64_t a4, _DWORD *a5)
{
  unsigned int v8;
  unsigned int *result;

  if (a5)
    *a5 = 0;
  if (a3 == 2)
    v8 = 6;
  else
    v8 = 7;
  result = cache_fetch_item(a1, v8, a2, a3, 2);
  if (a5 && !result && !*a5)
    *a5 = 1;
  return result;
}

unsigned int *cache_host_all(uint64_t a1)
{
  return cache_fetch_list(a1, 6u);
}

unsigned int *cache_network_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 8u, a2, 0, 1);
}

unsigned int *cache_network_byaddr(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 8u, 0, a2, 2);
}

unsigned int *cache_network_all(uint64_t a1)
{
  return cache_fetch_list(a1, 8u);
}

unsigned int *cache_service_byname(uint64_t a1, char *a2, char *__s1)
{
  int v5;

  if (!a2)
    return 0;
  if (__s1)
  {
    if (!strcmp(__s1, "tcp"))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  return cache_fetch_item(a1, 9u, a2, v5, 1);
}

unsigned int *cache_service_all(uint64_t a1)
{
  return cache_fetch_list(a1, 9u);
}

unsigned int *cache_protocol_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xAu, a2, 0, 1);
}

unsigned int *cache_protocol_bynumber(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 0xAu, 0, a2, 2);
}

unsigned int *cache_protocol_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xAu);
}

unsigned int *cache_rpc_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xBu, a2, 0, 1);
}

unsigned int *cache_rpc_bynumber(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 0xBu, 0, a2, 2);
}

unsigned int *cache_rpc_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xBu);
}

unsigned int *cache_fs_byspec(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xCu, a2, 0, 1);
}

unsigned int *cache_fs_byfile(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xCu, a2, 0, 2);
}

unsigned int *cache_fs_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xCu);
}

unsigned int *cache_mac_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xDu, a2, 0, 1);
}

unsigned int *cache_mac_bymac(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xDu, a2, 0, 2);
}

unsigned int *cache_mac_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xDu);
}

uint64_t cache_nameinfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  if (a5)
    *a5 = 1;
  return 0;
}

unsigned int *cache_fetch_list(uint64_t a1, unsigned int a2)
{
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int is_valid;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = 0;
  if (a1 && gL1CacheEnabled)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = v3 + 240 * a2;
      pthread_mutex_lock((pthread_mutex_t *)v4);
      v2 = *(unsigned int **)(v4 + 232);
      if (v2)
      {
        if (v2[1])
        {
          v5 = **((_QWORD **)v2 + 2);
          is_valid = si_item_is_valid((uint64_t *)v5);
          v7 = v2[1];
          if (v7 >= 2 && is_valid == 1)
          {
            v9 = 1;
            do
            {
              v10 = *(_QWORD *)(*((_QWORD *)v2 + 2) + 8 * v9);
              if (*(_QWORD *)v10 == *(_QWORD *)v5
                && *(_DWORD *)(v10 + 8) == *(_DWORD *)(v5 + 8)
                && *(_QWORD *)(v10 + 16) == *(_QWORD *)(v5 + 16)
                && *(_QWORD *)(v10 + 24) == *(_QWORD *)(v5 + 24))
              {
                is_valid = 1;
              }
              else
              {
                is_valid = si_item_is_valid(*(uint64_t **)(*((_QWORD *)v2 + 2) + 8 * v9));
                v7 = v2[1];
                v5 = v10;
              }
            }
            while (++v9 < v7 && is_valid == 1);
          }
          if (is_valid)
          {
            v2 = si_list_retain(v2);
          }
          else
          {
            si_list_release((uint64_t)v2);
            v2 = 0;
            *(_QWORD *)(v4 + 232) = 0;
          }
        }
        else
        {
          v2 = 0;
        }
      }
      pthread_mutex_unlock((pthread_mutex_t *)v4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void **file_user_all(uint64_t a1)
{
  return _fsi_get_user(a1, 0, 0, 0);
}

FILE *file_group_all(uint64_t a1)
{
  return _fsi_get_group(a1, 0, 0, 0);
}

void **file_netgroup_byname(uint64_t a1, void **a2)
{
  void **v2;
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
  _OWORD *v14;

  v2 = a2;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      _fsi_check_netgroup_cache(a1);
      pthread_mutex_lock(&file_mutex);
      v5 = *(_QWORD *)(v4 + 56);
      if (!v5)
        goto LABEL_12;
      while (strcmp((const char *)v2, *(const char **)v5))
      {
        v5 = *(_QWORD *)(v5 + 24);
        if (!v5)
          goto LABEL_12;
      }
      v13 = *(_QWORD *)(v5 + 16);
      if (v13)
      {
        v2 = 0;
        do
        {
          v14 = LI_ils_create("L4488sss", v6, v7, v8, v9, v10, v11, v12, a1);
          v2 = si_list_add(v2, (uint64_t)v14);
          v13 = *(_QWORD *)(v13 + 32);
        }
        while (v13);
      }
      else
      {
LABEL_12:
        v2 = 0;
      }
      pthread_mutex_unlock(&file_mutex);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t file_in_netgroup(uint64_t a1, const char *a2, const char *a3, const char *a4, const char *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  const char *v14;
  const char *v15;
  const char *v16;

  if (!a2)
    return 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    return 0;
  _fsi_check_netgroup_cache(a1);
  pthread_mutex_lock(&file_mutex);
  v10 = *(_QWORD *)(v5 + 56);
  if (!v10)
    goto LABEL_19;
  while (strcmp(a2, *(const char **)v10))
  {
    v10 = *(_QWORD *)(v10 + 24);
    if (!v10)
      goto LABEL_19;
  }
  v12 = *(_QWORD **)(v10 + 16);
  if (v12)
  {
    while (1)
    {
      v13 = v12;
      v12 = (_QWORD *)v12[4];
      if ((!a3 || (v14 = (const char *)v13[1]) != 0 && !strcmp(a3, v14))
        && (!a4 || (v15 = (const char *)v13[2]) != 0 && !strcmp(a4, v15)))
      {
        if (!a5)
          break;
        v16 = (const char *)v13[3];
        if (v16)
        {
          if (!strcmp(a5, v16))
            break;
        }
      }
      if (!v12)
        goto LABEL_19;
    }
    v11 = 1;
  }
  else
  {
LABEL_19:
    v11 = 0;
  }
  pthread_mutex_unlock(&file_mutex);
  return v11;
}

void **file_alias_byname(uint64_t a1, const char *a2)
{
  return _fsi_get_alias(a1, a2, 1);
}

void **file_alias_all(uint64_t a1)
{
  return _fsi_get_alias(a1, 0, 0);
}

unsigned int *file_host_byname(uint64_t a1, char *a2, int a3, uint64_t a4, _DWORD *a5)
{
  unsigned int *result;

  if (!a5)
    return _fsi_get_host(a1, a2, 0, a3, 1, 0);
  *a5 = 0;
  result = _fsi_get_host(a1, a2, 0, a3, 1, a5);
  if (!result)
  {
    result = 0;
    if (!*a5)
      *a5 = 1;
  }
  return result;
}

unsigned int *file_host_byaddr(uint64_t a1, void *a2, int a3, uint64_t a4, _DWORD *a5)
{
  unsigned int *result;

  if (!a5)
    return _fsi_get_host(a1, 0, a2, a3, 2, 0);
  *a5 = 0;
  result = _fsi_get_host(a1, 0, a2, a3, 2, a5);
  if (!result)
  {
    result = 0;
    if (!*a5)
      *a5 = 1;
  }
  return result;
}

unsigned int *file_host_all(uint64_t a1)
{
  return _fsi_get_host(a1, 0, 0, 0, 0, 0);
}

FILE *file_network_byname(uint64_t a1, const char *a2)
{
  if (a2)
    return _fsi_get_name_number_aliases(a1, a2, 0, 1, 8);
  else
    return 0;
}

FILE *file_network_byaddr(uint64_t a1, int a2)
{
  return _fsi_get_name_number_aliases(a1, 0, a2, 2, 8);
}

FILE *file_network_all(uint64_t a1)
{
  return _fsi_get_name_number_aliases(a1, 0, 0, 0, 8);
}

FILE *file_service_byname(uint64_t a1, const char *a2, char *a3)
{
  return _fsi_get_service(a1, a2, a3, 0, 1);
}

FILE *file_service_all(uint64_t a1)
{
  return _fsi_get_service(a1, 0, 0, 0, 0);
}

FILE *file_protocol_byname(uint64_t a1, const char *a2)
{
  if (a2)
    return _fsi_get_name_number_aliases(a1, a2, 0, 1, 10);
  else
    return 0;
}

FILE *file_protocol_bynumber(uint64_t a1, int a2)
{
  return _fsi_get_name_number_aliases(a1, 0, a2, 2, 10);
}

FILE *file_protocol_all(uint64_t a1)
{
  return _fsi_get_name_number_aliases(a1, 0, 0, 0, 10);
}

FILE *file_rpc_byname(uint64_t a1, const char *a2)
{
  if (a2)
    return _fsi_get_name_number_aliases(a1, a2, 0, 1, 11);
  else
    return 0;
}

FILE *file_rpc_bynumber(uint64_t a1, int a2)
{
  return _fsi_get_name_number_aliases(a1, 0, a2, 2, 11);
}

FILE *file_rpc_all(uint64_t a1)
{
  return _fsi_get_name_number_aliases(a1, 0, 0, 0, 11);
}

void **file_fs_byspec(uint64_t a1, const char *a2)
{
  return _fsi_get_fs(a1, a2, 1);
}

void **file_fs_byfile(uint64_t a1, const char *a2)
{
  return _fsi_get_fs(a1, a2, 2);
}

void **file_fs_all(uint64_t a1)
{
  return _fsi_get_fs(a1, 0, 0);
}

void **file_mac_byname(uint64_t a1, char *a2)
{
  return _fsi_get_ether(a1, a2, 1);
}

void **file_mac_bymac(uint64_t a1, char *a2)
{
  return _fsi_get_ether(a1, a2, 2);
}

void **file_mac_all(uint64_t a1)
{
  return _fsi_get_ether(a1, 0, 0);
}

unsigned int *file_addrinfo(uint64_t a1, uint64_t a2, const char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9)
{
  if (a9)
    *a9 = 0;
  return _gai_simple(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t _fsi_check_netgroup_cache(uint64_t result)
{
  if (result)
  {
    if (*(_QWORD *)(result + 32))
    {
      pthread_mutex_lock(&file_mutex);
      return pthread_mutex_unlock(&file_mutex);
    }
  }
  return result;
}

void **_fsi_get_alias(uint64_t a1, const char *a2, int a3)
{
  FILE *v6;
  FILE *v7;
  _BYTE *line;
  _BYTE *v9;
  void **v10;
  const char **v11;
  const char **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  void *v22;
  uint64_t v23;
  __darwin_time_t v24;
  int v25;

  if (!a2 && a3 == 1)
    return 0;
  v6 = fopen("/etc/aliases", "r");
  if (!v6)
    return 0;
  v7 = v6;
  v23 = 0;
  v24 = 0;
  _fsi_get_validation(a1, 4u, "/etc/aliases", v6, &v24, &v23);
  line = _fsi_get_line();
  if (!line)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v9 = line;
  v10 = 0;
  while (*v9 == 35)
  {
LABEL_11:
    free(v9);
LABEL_12:
    v9 = _fsi_get_line();
    if (!v9)
      goto LABEL_19;
  }
  v25 = 0;
  v11 = (const char **)_fsi_tokenize(v9, ":", 1, &v25);
  v12 = v11;
  if (v25 <= 1 || a3 && strcmp(a2, *v11))
  {
    free(v12);
    goto LABEL_11;
  }
  v25 = 0;
  v22 = _fsi_tokenize(v12[1], ",", 1, &v25);
  v20 = (unsigned int *)LI_ils_create("L4488s4*4", v13, v14, v15, v16, v17, v18, v19, a1);
  free(v12);
  free(v22);
  free(v9);
  if (!v20)
    goto LABEL_12;
  if (!a3)
  {
    v10 = si_list_add(v10, (uint64_t)v20);
    si_item_release(v20);
    goto LABEL_12;
  }
  v10 = (void **)v20;
LABEL_19:
  fclose(v7);
  return v10;
}

unsigned int *_fsi_get_host(uint64_t a1, char *a2, void *a3, int a4, int a5, _DWORD *a6)
{
  FILE *v12;
  FILE *v13;
  _BYTE *line;
  _BYTE *v15;
  const char **v16;
  const char **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  int v26;
  const char *p_s2;
  int v28;
  const char **v29;
  const char **v30;
  const char **v31;
  int v32;
  const char *v33;
  unsigned int *v34;
  unsigned int *v35;
  void *v37;
  void **v38;
  uint64_t v39;
  char *__s1;
  int v41;
  uint64_t v42;
  __darwin_time_t v43;
  int v44;
  __int128 v45;
  _QWORD v46[2];
  __int128 __s2;
  const char *v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C874D8];
  if ((a2 || a5 != 1) && (a3 || a5 != 2) && (v12 = fopen("/etc/hosts", "r")) != 0)
  {
    v13 = v12;
    __s1 = a2;
    v37 = a3;
    v41 = a5;
    v42 = 0;
    v43 = 0;
    v39 = a1;
    _fsi_get_validation(a1, 5u, "/etc/hosts", v12, &v43, &v42);
    line = _fsi_get_line();
    if (line)
    {
      v15 = line;
      v38 = 0;
      while (1)
      {
        if (*v15 == 35)
          goto LABEL_36;
        v46[0] = 0;
        v46[1] = 0;
        v45 = 0uLL;
        v16 = (const char **)_fsi_tokenize(v15, " \t", 0, (_DWORD *)v46 + 1);
        v17 = v16;
        if (SHIDWORD(v46[0]) <= 1)
          goto LABEL_35;
        v49 = 0;
        v24 = inet_pton(2, *v16, v46);
        if (v24 == 1)
        {
          v44 = v46[0];
          v25 = 4;
          v26 = 2;
          p_s2 = (const char *)&v44;
        }
        else
        {
          if (inet_pton(30, *v17, &v45) != 1)
            goto LABEL_35;
          __s2 = v45;
          v25 = 16;
          v26 = 30;
          p_s2 = (const char *)&__s2;
        }
        v48 = p_s2;
        v28 = HIDWORD(v46[0]);
        v29 = v17 + 2;
        if (SHIDWORD(v46[0]) >= 3)
          v30 = v17 + 2;
        else
          v30 = 0;
        if (v41)
        {
          if (v26 != a4)
            goto LABEL_35;
          if (v41 == 1)
          {
            if (strcmp(__s1, v17[1]))
            {
              if (v28 < 3)
                goto LABEL_35;
              p_s2 = *v29;
              if (!*v29)
                goto LABEL_35;
              v31 = v30 + 1;
              do
              {
                v32 = strcmp(__s1, p_s2);
                if (!v32)
                  break;
                v33 = *v31++;
                p_s2 = v33;
              }
              while (v33);
              if (v32)
              {
LABEL_35:
                free(v17);
LABEL_36:
                free(v15);
                goto LABEL_37;
              }
            }
          }
          else if (memcmp(v37, p_s2, v25))
          {
            goto LABEL_35;
          }
        }
        if (v24 == 1)
          v34 = (unsigned int *)LI_ils_create("L4488s*44a", (uint64_t)p_s2, v18, v19, v20, v21, v22, v23, v39);
        else
          v34 = (unsigned int *)LI_ils_create("L4488s*44c", (uint64_t)p_s2, v18, v19, v20, v21, v22, v23, v39);
        v35 = v34;
        free(v17);
        free(v15);
        if (v35)
        {
          if (v41)
          {
            fclose(v13);
            return v35;
          }
          v38 = si_list_add(v38, (uint64_t)v35);
          si_item_release(v35);
        }
LABEL_37:
        v15 = _fsi_get_line();
        if (!v15)
          goto LABEL_42;
      }
    }
    v38 = 0;
LABEL_42:
    fclose(v13);
    return (unsigned int *)v38;
  }
  else
  {
    v35 = 0;
    if (a6)
      *a6 = 3;
  }
  return v35;
}

FILE *_fsi_get_name_number_aliases(uint64_t a1, const char *a2, int a3, int a4, int a5)
{
  unsigned int v7;
  const char *v8;
  FILE *result;
  FILE *v10;
  char *line;
  char *v12;
  char *v13;
  const char **v14;
  const char **v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char **v25;
  const char **v26;
  const char **v27;
  int v28;
  const char *v29;
  unsigned int *v30;
  unsigned int *v31;
  void **v32;
  unsigned int v34;
  int v35;
  uint64_t v38;
  __darwin_time_t v39;
  int v40;

  switch(a5)
  {
    case 8:
      v7 = 6;
      v8 = "/etc/networks";
      break;
    case 11:
      v7 = 9;
      v8 = "/etc/rpc";
      break;
    case 10:
      v7 = 8;
      v8 = "/etc/protocols";
      break;
    default:
LABEL_43:
      abort();
  }
  result = fopen(v8, "r");
  if (!result)
    return result;
  v10 = result;
  v35 = a5;
  v38 = 0;
  v39 = 0;
  _fsi_get_validation(a1, v7, v8, result, &v39, &v38);
  line = (char *)_fsi_get_line();
  if (!line)
  {
    v32 = 0;
    goto LABEL_40;
  }
  v12 = line;
  v32 = 0;
  v34 = a5 - 10;
  while (1)
  {
    if (*v12 == 35)
      goto LABEL_15;
    v13 = strchr(v12, 35);
    if (v13)
      *v13 = 0;
    v40 = 0;
    v14 = (const char **)_fsi_tokenize(v12, " \t", 0, &v40);
    v15 = v14;
    v16 = v40;
    if (v40 < 2)
    {
LABEL_14:
      free(v15);
LABEL_15:
      free(v12);
      goto LABEL_16;
    }
    v17 = atoi(v14[1]);
    v25 = v15 + 2;
    if (v16 == 2)
      v26 = 0;
    else
      v26 = v15 + 2;
    if (a4)
    {
      if (a4 == 1)
      {
        if (strcmp(a2, *v15))
        {
          if (v16 == 2)
            goto LABEL_14;
          v18 = *v25;
          if (!*v25)
            goto LABEL_14;
          v27 = v26 + 1;
          do
          {
            v28 = strcmp(a2, v18);
            if (!v28)
              break;
            v29 = *v27++;
            v18 = v29;
          }
          while (v29);
          if (v28)
            goto LABEL_14;
        }
      }
      else if (v17 != a3)
      {
        goto LABEL_14;
      }
    }
    if (v34 >= 2)
    {
      if (v35 != 8)
        goto LABEL_43;
      v30 = (unsigned int *)LI_ils_create("L4488s*44", (uint64_t)v18, v19, v20, v21, v22, v23, v24, a1);
    }
    else
    {
      v30 = (unsigned int *)LI_ils_create("L4488s*4", (uint64_t)v18, v19, v20, v21, v22, v23, v24, a1);
    }
    v31 = v30;
    free(v15);
    free(v12);
    if (v31)
      break;
LABEL_16:
    v12 = (char *)_fsi_get_line();
    if (!v12)
      goto LABEL_40;
  }
  if (!a4)
  {
    v32 = si_list_add(v32, (uint64_t)v31);
    si_item_release(v31);
    goto LABEL_16;
  }
  v32 = (void **)v31;
LABEL_40:
  fclose(v10);
  return (FILE *)v32;
}

void **_fsi_get_fs(uint64_t a1, const char *a2, int a3)
{
  void **v6;
  unsigned int *v8;
  char *v9;
  char *v10;
  _BOOL4 v11;
  FILE *v12;
  uint64_t v13;
  uint64_t v14;
  FILE *v15;
  _BYTE *line;
  _BYTE *v17;
  const char **v18;
  const char **v19;
  int v20;
  char *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char **v33;
  const char *v34;
  const char *v35;
  void *v36;
  unsigned int *v37;
  unsigned int *v38;
  const char **v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  void **v52;
  char *__s1;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  __darwin_time_t v57;
  uint64_t v58;
  __darwin_time_t v59;
  size_t size[5];
  statfs v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C874D8];
  if (!a2 && a3)
    return 0;
  v56 = 0;
  v57 = 0;
  memset(&v61, 0, 512);
  v6 = 0;
  if (statfs("/", &v61))
    return v6;
  v58 = 0;
  v59 = 0;
  size[0] = 0;
  v8 = 0;
  if (sysctlbyname("vfs.generic.apfs.edt_fstab", 0, size, 0, 0) || !size[0])
  {
LABEL_12:
    v11 = a3 == 0;
    v6 = (void **)v8;
    goto LABEL_13;
  }
  v9 = (char *)malloc_type_malloc(size[0], 0x7B7B7701uLL);
  if (!v9)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v10 = v9;
  if (sysctlbyname("vfs.generic.apfs.edt_fstab", v9, size, 0, 0))
  {
    free(v10);
    goto LABEL_11;
  }
  size[0] /= 0xECuLL;
  _fsi_get_validation(a1, 0xAu, "/etc/fstab", 0, &v59, &v58);
  v48 = 0;
  v6 = 0;
LABEL_57:
  v49 = 236 * v48;
  while (v48 < size[0])
  {
    switch(a3)
    {
      case 0:
        goto LABEL_66;
      case 2:
        v51 = &v10[v49 + 32];
        v50 = a2;
        break;
      case 1:
        v50 = a2;
        v51 = &v10[v49];
        break;
      default:
        goto LABEL_65;
    }
    if (!strcmp(v50, v51))
    {
LABEL_66:
      v8 = (unsigned int *)LI_ils_create("L4488sssss44", v41, v42, v43, v44, v45, v46, v47, a1);
      goto LABEL_67;
    }
LABEL_65:
    v8 = 0;
LABEL_67:
    v49 += 236;
    ++v48;
    if (v8)
    {
      if (a3)
        goto LABEL_12;
      v6 = si_list_add(v6, (uint64_t)v8);
      si_item_release(v8);
      goto LABEL_57;
    }
  }
  free(v10);
  if (a3)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v11 = 1;
  if (!v6)
  {
LABEL_13:
    if (*(_DWORD *)v61.f_fstypename ^ 0x73667061 | v61.f_fstypename[4])
    {
      v54 = v11;
      v12 = fopen("/etc/fstab", "r");
      if (v12)
      {
        v15 = v12;
        __s1 = (char *)a2;
        _fsi_get_validation(a1, 0xAu, "/etc/fstab", v12, &v57, &v56);
        line = _fsi_get_line();
        if (!line)
        {
LABEL_46:
          fclose(v15);
          return v6;
        }
        v17 = line;
        v55 = a1;
        while (2)
        {
          if (*v17 != 35)
          {
            LODWORD(size[0]) = 0;
            v18 = (const char **)_fsi_tokenize(v17, " \t", 0, size);
            v19 = v18;
            v20 = size[0];
            if ((LODWORD(size[0]) - 7) <= 0xFFFFFFFC)
              goto LABEL_34;
            if (LODWORD(size[0]) >= 5)
            {
              atoi(v18[4]);
              if (v20 == 6)
                atoi(v19[5]);
            }
            v21 = strdup(v19[3]);
            if (v21)
            {
              v22 = v21;
              LODWORD(size[0]) = 0;
              v23 = _fsi_tokenize(v21, ",", 0, size);
              if (v23)
              {
                v31 = v23;
                v32 = LODWORD(size[0]);
                v33 = (const char **)v23;
                if (SLODWORD(size[0]) >= 1)
                {
                  do
                  {
                    v34 = *v33;
                    if (!strcmp(*v33, "rw"))
                      break;
                    if (!strcmp(v34, "ro"))
                      break;
                    if (!strcmp(v34, "sw"))
                      break;
                    if (!strcmp(v34, "xx"))
                      break;
                    ++v33;
                    --v32;
                  }
                  while (v32);
                }
                if (a3)
                {
                  if (a3 != 2)
                  {
                    if (a3 == 1)
                    {
                      v35 = *v19;
                      goto LABEL_41;
                    }
                    goto LABEL_42;
                  }
                  v35 = v19[1];
LABEL_41:
                  if (strcmp(__s1, v35))
                  {
LABEL_42:
                    free(v19);
                    break;
                  }
                }
                v37 = (unsigned int *)LI_ils_create("L4488sssss44", v24, v25, v26, v27, v28, v29, v30, v55);
                free(v19);
                free(v31);
                free(v22);
                free(v17);
                if (v37)
                {
                  if (!v54)
                  {
                    fclose(v15);
                    return (void **)v37;
                  }
                  v6 = si_list_add(v6, (uint64_t)v37);
                  si_item_release(v37);
                }
LABEL_37:
                v17 = _fsi_get_line();
                if (!v17)
                  goto LABEL_46;
                continue;
              }
              free(v19);
              v36 = v22;
            }
            else
            {
LABEL_34:
              v36 = v19;
            }
            free(v36);
          }
          break;
        }
        free(v17);
        goto LABEL_37;
      }
      size[0] = MEMORY[0x1E0C87450];
      size[1] = 0x40000000;
      size[2] = (size_t)___fsi_fs_root_block_invoke;
      size[3] = (size_t)&__block_descriptor_tmp_40;
      size[4] = a1;
      if (rootfs_once != -1)
        dispatch_once(&rootfs_once, size);
      v38 = (unsigned int *)si_item_retain(rootfs, v13, v14);
      v39 = (const char **)(v38 + 8);
      if (!v38)
        v39 = 0;
      if (a3)
      {
        if (a3 == 2)
        {
          if (v39)
          {
            v40 = v39[1];
            goto LABEL_76;
          }
        }
        else if (a3 == 1 && v39)
        {
          v40 = *v39;
LABEL_76:
          v52 = v6;
          v6 = (void **)v38;
          if (!strcmp(a2, v40))
            return v6;
          return v52;
        }
        return v6;
      }
      v52 = si_list_add(v6, (uint64_t)v38);
      si_item_release(v38);
      return v52;
    }
  }
  return v6;
}

void ___fsi_fs_root_block_invoke()
{
  uint64_t v0;
  dev_t st_dev;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  DIR *v10;
  DIR *v11;
  char *f_mntfromname;
  size_t v13;
  char *v14;
  char *v15;
  stat v16;
  dirent *v17;
  stat v18;
  statfs v19;
  dirent v20;
  char buf[1024];
  char v22[1024];
  uint64_t v23;

  v0 = MEMORY[0x1E0C86820]();
  v23 = *MEMORY[0x1E0C874D8];
  memset(&v16, 0, sizeof(v16));
  memset(&v19, 0, 512);
  if ((stat("/", &v16) & 0x80000000) == 0
    && (statfs("/", &v19) & 0x80000000) == 0
    && (*(_QWORD *)v19.f_fstypename != 0x736668746E7973
     || (stat("/root", &v16) & 0x80000000) == 0 && (statfs("/root", &v19) & 0x80000000) == 0))
  {
    st_dev = v16.st_dev;
    __strlcpy_chk();
    if (devname_r(st_dev, 0x6000u, buf, 1024))
    {
      __strlcat_chk();
      v9 = strdup(v22);
      if (v9)
      {
LABEL_25:
        rootfs = (uint64_t)LI_ils_create("L4488sssss44", v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(v0 + 32));
        free(v9);
        return;
      }
    }
    else
    {
      memset(&v18, 0, sizeof(v18));
      v17 = 0;
      memset(&v20, 0, 512);
      v10 = opendir("/dev/");
      if (v10)
      {
        v11 = v10;
        while (1)
        {
          v9 = 0;
          if (readdir_r(v11, &v20, &v17) || !v17)
            break;
          if (v17->d_type == 6)
          {
            __strlcat_chk();
            if (!stat(v22, &v18) && v18.st_rdev == st_dev)
            {
              v9 = strdup(v22);
              break;
            }
          }
          v22[5] = 0;
        }
        closedir(v11);
        if (v9)
          goto LABEL_25;
      }
    }
    f_mntfromname = v19.f_mntfromname;
    v13 = 1024;
    v14 = strnstr(v19.f_mntfromname, "@", 0x400uLL);
    if (v14)
    {
      v13 = 1024;
      do
      {
        v15 = v14 + 1;
        v13 = &f_mntfromname[v13] - (v14 + 1);
        v14 = strnstr(v14 + 1, "@", v13);
        f_mntfromname = v15;
      }
      while (v14);
    }
    else
    {
      v15 = v19.f_mntfromname;
    }
    v9 = strndup(v15, v13);
    goto LABEL_25;
  }
}

void **_fsi_get_ether(uint64_t a1, char *a2, int a3)
{
  char *v6;
  FILE *v7;
  FILE *v8;
  _BYTE *line;
  _BYTE *v10;
  void **v11;
  unsigned int *v12;
  uint64_t v14;
  __darwin_time_t v15;

  if (!a2 && a3)
    return 0;
  if (a3 == 2)
  {
    v6 = si_standardize_mac_address(a2);
    if (!v6)
      return 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = fopen("/etc/ethers", "r");
  if (!v7)
    return 0;
  v8 = v7;
  v14 = 0;
  v15 = 0;
  _fsi_get_validation(a1, 0xBu, "/etc/ethers", v7, &v15, &v14);
  line = _fsi_get_line();
  if (!line)
  {
    v11 = 0;
    goto LABEL_23;
  }
  v10 = line;
  v11 = 0;
  while (1)
  {
    if (*v10 == 35)
    {
      free(v10);
      goto LABEL_16;
    }
    if (a3 != 2)
      break;
    v12 = (unsigned int *)_fsi_parse_ether(a1, v6, 2, v10);
    free(v10);
    if (v12)
      goto LABEL_22;
LABEL_16:
    v10 = _fsi_get_line();
    if (!v10)
      goto LABEL_23;
  }
  v12 = (unsigned int *)_fsi_parse_ether(a1, a2, a3, v10);
  free(v10);
  if (!v12)
    goto LABEL_16;
  if (!a3)
  {
    v11 = si_list_add(v11, (uint64_t)v12);
    si_item_release(v12);
    goto LABEL_16;
  }
LABEL_22:
  v11 = (void **)v12;
LABEL_23:
  fclose(v8);
  return v11;
}

_OWORD *_fsi_parse_ether(uint64_t a1, const char *a2, int a3, _BYTE *a4)
{
  char **v7;
  char **v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  const char *v18;
  const char *v19;
  void *v20;
  _OWORD *v21;
  int v23;

  v23 = 0;
  v7 = (char **)_fsi_tokenize(a4, " \t", 1, &v23);
  v8 = v7;
  if (v23 == 2)
  {
    v9 = si_standardize_mac_address(*v7);
    if (v9)
    {
      v17 = v9;
      if (a3)
      {
        if (a3 == 2)
        {
          v19 = a2;
          v18 = v17;
        }
        else
        {
          if (a3 != 1)
          {
LABEL_10:
            free(v8);
            v20 = v17;
            goto LABEL_11;
          }
          v18 = v8[1];
          v19 = a2;
        }
        if (strcmp(v19, v18))
          goto LABEL_10;
      }
      v21 = LI_ils_create("L4488ss", v10, v11, v12, v13, v14, v15, v16, a1);
      free(v8);
      free(v17);
      return v21;
    }
  }
  v20 = v8;
LABEL_11:
  free(v20);
  return 0;
}

int *kvbuf_query(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _BYTE *v9;
  malloc_zone_t *v10;
  int *v11;
  int *v12;
  unsigned int v13;
  char **v14;
  int v15;
  char **v16;
  char **v18;
  char __str[32];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 0;
  v9 = a1;
  v10 = malloc_default_zone();
  v11 = (int *)kvbuf_new_zone(v10);
  v12 = v11;
  if (v11)
  {
    kvbuf_add_dict((uint64_t)v11);
    v18 = (char **)&a9;
    while (1)
    {
      v13 = *v9;
      if (v13 > 0x72)
      {
        if (v13 != 115)
        {
          if (v13 != 117)
            goto LABEL_15;
          ++v18;
          snprintf(__str, 0x20uLL, "%u");
          goto LABEL_12;
        }
        v16 = v18++;
        kvbuf_add_val((uint64_t)v12, *v16);
      }
      else
      {
        if (v13 == 105)
        {
          ++v18;
          snprintf(__str, 0x20uLL, "%d");
LABEL_12:
          v15 = strlen(__str);
          kvbuf_add_val_len((uint64_t)v12, __str, v15 + 1);
          goto LABEL_15;
        }
        if (v13 == 107)
        {
          v14 = v18++;
          kvbuf_add_key(v12, *v14);
        }
        else if (!*v9)
        {
          return v12;
        }
      }
LABEL_15:
      ++v9;
    }
  }
  return v12;
}

_QWORD *kvbuf_new()
{
  malloc_zone_t *v0;

  v0 = malloc_default_zone();
  return kvbuf_new_zone(v0);
}

void kvbuf_add_dict(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  if (a1)
  {
    kvbuf_grow((unsigned int *)a1, 4);
    v2 = *(unsigned int **)(a1 + 8);
    if (v2)
    {
      v3 = *(_DWORD *)a1;
      v4 = *(_DWORD *)a1 + 4;
      *(_DWORD *)a1 = v4;
      *(_DWORD *)(a1 + 20) = v3;
      *(_QWORD *)(a1 + 24) = v4;
      *(_DWORD *)(a1 + 32) = 0;
      *v2 = bswap32(bswap32(*v2) + 1);
    }
  }
}

void kvbuf_add_key(int *a1, char *__s)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  _DWORD *v11;
  int v12;

  if (a1)
  {
    if (__s)
    {
      v4 = strlen(__s);
      kvbuf_grow((unsigned int *)a1, v4 + 9);
      v5 = *((_QWORD *)a1 + 1);
      if (v5)
      {
        v6 = (v4 + 1);
        v7 = a1[5];
        v8 = *(_DWORD *)(v5 + v7);
        v9 = bswap32(v8);
        if (v8)
          v10 = *a1;
        else
          v10 = v7 + 4;
        a1[6] = v10;
        *(_DWORD *)(v5 + v7) = bswap32(v9 + 1);
        v11 = (_DWORD *)(*((_QWORD *)a1 + 1) + *a1);
        *v11++ = bswap32(v6);
        memcpy(v11, __s, (v4 + 1));
        a1[7] = v4 + *a1 + 5;
        *(_DWORD *)((char *)v11 + v6) = 0;
        v12 = *a1 + v4 + 9;
        *a1 = v12;
        a1[8] = v12;
      }
    }
  }
}

void kvbuf_add_val(uint64_t a1, char *__s)
{
  unsigned int v4;

  if (a1)
  {
    if (__s)
    {
      v4 = strlen(__s) + 1;
      kvbuf_add_val_len(a1, __s, v4);
    }
  }
}

_QWORD *kvbuf_query_key_val(const char *a1, const char *a2)
{
  int v4;
  unsigned int v5;
  int v6;
  _DWORD *v7;
  _QWORD *v8;
  size_t v9;
  _DWORD *v10;
  size_t v11;
  char *v12;
  int *v13;

  if (!a1)
    return 0;
  v4 = strlen(a1);
  if (a2)
  {
    v5 = strlen(a2) + 1;
    v6 = 0x1000000;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = malloc_type_calloc(1uLL, 0x28uLL, 0x101004062FF10B7uLL);
  v8 = v7;
  if (v7)
  {
    v9 = v4 + v5 + 21;
    v7[4] = v9;
    *v7 = v9;
    v10 = malloc_type_calloc(1uLL, v9, 0x722E801DuLL);
    v8[1] = v10;
    if (v10)
    {
      v11 = (v4 + 1);
      *(_QWORD *)v10 = 0x100000001000000;
      v10[2] = bswap32(v11);
      v12 = (char *)(v10 + 3);
      memcpy(v10 + 3, a1, v11);
      v13 = (int *)&v12[v11];
      *v13 = v6;
      if (a2)
      {
        v13[1] = bswap32(v5);
        memcpy(v13 + 2, a2, v5);
      }
      return v8;
    }
    free(v8);
    return 0;
  }
  return v8;
}

_QWORD *kvbuf_query_key_int(const char *a1, int a2)
{
  char __str[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  snprintf(__str, 0x20uLL, "%d", a2);
  return kvbuf_query_key_val(a1, __str);
}

_QWORD *kvbuf_query_key_uint(const char *a1, int a2)
{
  char __str[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  snprintf(__str, 0x20uLL, "%u", a2);
  return kvbuf_query_key_val(a1, __str);
}

_QWORD *kvbuf_new_zone(malloc_zone_t *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (!a1)
    return 0;
  v2 = malloc_type_zone_calloc(a1, 1uLL, 0x28uLL, 0x101004062FF10B7uLL);
  v3 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 4) = 128;
    v4 = malloc_type_zone_calloc(a1, 1uLL, 0x80uLL, 0xF75D253AuLL);
    v3[1] = v4;
    if (v4)
    {
      *(_DWORD *)v3 = 4;
      *((_DWORD *)v3 + 5) = 4;
      return v3;
    }
    free(v3);
    return 0;
  }
  return v3;
}

_QWORD *kvbuf_init_zone(malloc_zone_t *a1, const void *a2, unsigned int a3)
{
  _DWORD *v6;
  _QWORD *v7;
  void *v8;

  if (!a1)
    return 0;
  v6 = malloc_type_zone_calloc(a1, 1uLL, 0x28uLL, 0x101004062FF10B7uLL);
  v7 = v6;
  if (v6)
  {
    v6[4] = a3;
    *v6 = a3;
    if (a3)
    {
      v8 = malloc_type_zone_calloc(a1, 1uLL, a3, 0xFFFFDB30uLL);
      v7[1] = v8;
      if (v8)
      {
        memcpy(v8, a2, a3);
        return v7;
      }
      free(v7);
      return 0;
    }
  }
  return v7;
}

_QWORD *kvbuf_init(const void *a1, unsigned int a2)
{
  malloc_zone_t *v4;

  v4 = malloc_default_zone();
  return kvbuf_init_zone(v4, a1, a2);
}

double kvbuf_grow(unsigned int *ptr, int a2)
{
  int v3;
  unsigned int v4;
  malloc_zone_t *v5;
  void *v6;
  size_t v7;
  char *v8;
  double result;
  void *v10;

  if (a2)
  {
    v3 = *((_QWORD *)ptr + 1) ? a2 : a2 + 4;
    v4 = v3 + *ptr;
    if (v4 > ptr[4])
    {
      ptr[4] = (v4 + 255) & 0xFFFFFF00;
      v5 = malloc_zone_from_ptr(ptr);
      v6 = (void *)*((_QWORD *)ptr + 1);
      v7 = ptr[4];
      if (v6)
      {
        v8 = (char *)malloc_type_zone_realloc(v5, v6, v7, 0x6B8D38ABuLL);
        if (v8)
        {
          *((_QWORD *)ptr + 1) = v8;
          bzero(&v8[*ptr], ptr[4] - *ptr);
          return result;
        }
        free(*((void **)ptr + 1));
      }
      else
      {
        v10 = malloc_type_zone_calloc(v5, 1uLL, v7, 0x50C23019uLL);
        *((_QWORD *)ptr + 1) = v10;
        if (v10)
        {
          *ptr = 4;
          ptr[5] = 4;
          return result;
        }
      }
      *((_QWORD *)ptr + 4) = 0;
      result = 0.0;
      *(_OWORD *)ptr = 0u;
      *((_OWORD *)ptr + 1) = 0u;
    }
  }
  return result;
}

void kvbuf_add_val_len(uint64_t a1, const void *a2, unsigned int a3)
{
  unsigned int v6;
  uint64_t v7;
  _DWORD *v8;
  unsigned int v9;

  if (a1 && a2 && a3)
  {
    v6 = a3 + 4;
    kvbuf_grow((unsigned int *)a1, a3 + 4);
    v7 = *(_QWORD *)(a1 + 8);
    if (v7)
    {
      *(_DWORD *)(v7 + *(unsigned int *)(a1 + 28)) = bswap32(bswap32(*(_DWORD *)(v7 + *(unsigned int *)(a1 + 28))) + 1);
      v8 = (_DWORD *)(*(_QWORD *)(a1 + 8) + *(unsigned int *)(a1 + 32));
      *v8 = bswap32(a3);
      memcpy(v8 + 1, a2, a3);
      v9 = *(_DWORD *)a1 + v6;
      *(_DWORD *)a1 = v9;
      *(_DWORD *)(a1 + 32) = v9;
    }
  }
}

uint64_t kvbuf_get_len(uint64_t a1)
{
  return bswap32(*(_DWORD *)(a1 - 4));
}

void kvbuf_make_purgeable(uint64_t a1)
{
  void *v1;

  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    if (v1)
      malloc_make_purgeable(v1);
  }
}

_QWORD *kvbuf_make_nonpurgeable(_QWORD *result)
{
  if (result)
  {
    result = (_QWORD *)result[1];
    if (result)
      return (_QWORD *)(malloc_make_nonpurgeable(result) != 0);
  }
  return result;
}

void kvbuf_free(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
      free(v2);
    a1[4] = 0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    free(a1);
  }
}

unsigned int *kvbuf_append_kvbuf(unsigned int *result, uint64_t a2)
{
  unsigned int v3;
  unsigned int *v4;
  size_t v5;

  if (result && a2)
  {
    v3 = **(_DWORD **)(a2 + 8);
    if (v3)
    {
      v4 = result;
      **((_DWORD **)result + 1) = bswap32(bswap32(v3) + bswap32(**((_DWORD **)result + 1)));
      v5 = (*(_DWORD *)a2 - 4);
      kvbuf_grow(result, *(_DWORD *)a2 - 4);
      result = (unsigned int *)memcpy((void *)(*((_QWORD *)v4 + 1) + *v4), (const void *)(*(_QWORD *)(a2 + 8) + 4), v5);
      *v4 += v5;
    }
  }
  return result;
}

uint64_t kvbuf_reset(uint64_t a1)
{
  unsigned int *v1;

  if (a1
    && (v1 = *(unsigned int **)(a1 + 8)) != 0
    && (*(_QWORD *)(a1 + 28) = 0, *(_QWORD *)(a1 + 20) = 0, *(_DWORD *)a1 >= 4u))
  {
    return bswap32(*v1);
  }
  else
  {
    return 0;
  }
}

uint64_t kvbuf_next_dict(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int *v7;
  uint64_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;

  if (!a1)
    return 0;
  v1 = *((_QWORD *)a1 + 1);
  if (!v1)
    return 0;
  *((_QWORD *)a1 + 3) = 0;
  a1[8] = 0;
  v2 = a1[5];
  if ((_DWORD)v2)
  {
    v3 = v1 + v2;
    v4 = *(_DWORD *)(v1 + v2);
    LODWORD(v2) = v2 + 4;
    a1[5] = v2;
    if (v4)
    {
      v5 = 0;
      v6 = bswap32(v4);
      v7 = (unsigned int *)(v3 + 4);
      do
      {
        v8 = bswap32(*v7);
        v9 = (char *)v7 + v8;
        v10 = v2 + v8;
        a1[5] = v10 + 4;
        v11 = *((_DWORD *)v9 + 1);
        v7 = (unsigned int *)(v9 + 8);
        LODWORD(v2) = v10 + 8;
        a1[5] = v2;
        if (v11)
        {
          v12 = bswap32(v11);
          do
          {
            v13 = bswap32(*v7);
            v7 = (unsigned int *)((char *)v7 + v13 + 4);
            LODWORD(v2) = v2 + v13 + 4;
            a1[5] = v2;
            --v12;
          }
          while (v12);
        }
        ++v5;
      }
      while (v5 != v6);
    }
    v2 = v2;
    if ((unint64_t)v2 + 4 <= *a1)
      return bswap32(*(_DWORD *)(v1 + v2));
    return 0;
  }
  v14 = *a1;
  if (*a1 < 4)
    return 0;
  v2 = 4;
  a1[5] = 4;
  if (v14 < 8)
    return 0;
  return bswap32(*(_DWORD *)(v1 + v2));
}

unsigned int *kvbuf_next_key(unsigned int *a1, _DWORD *a2)
{
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;
  uint64_t v17;
  unsigned int *v19;
  uint64_t v20;

  v2 = 0;
  if (a1 && a2)
  {
    *a2 = 0;
    v3 = *((_QWORD *)a1 + 1);
    if (!v3)
      return 0;
    v4 = a1[5];
    if (!(_DWORD)v4)
      return 0;
    a1[7] = 0;
    a1[8] = 0;
    v5 = a1[6];
    if ((_DWORD)v5)
    {
      v6 = v3 + v5;
      v7 = bswap32(*(_DWORD *)(v3 + v5));
      v8 = *a1;
      v9 = v7 + 4;
      if (v7 + 4 + v5 > v8)
        return 0;
      v10 = (v5 + v9);
      a1[6] = v10;
      if (v10 + 4 > v8)
        return 0;
      v11 = (unsigned int *)(v6 + v9);
      v12 = *v11;
      v13 = v10 + 4;
      a1[6] = v10 + 4;
      if (v12)
      {
        v14 = bswap32(v12);
        v15 = v11 + 1;
        while ((unint64_t)v13 + 4 <= v8 && v8 >= v13 + v7)
        {
          v17 = bswap32(*v15) + 4;
          v15 = (unsigned int *)((char *)v15 + v17);
          v13 += v17;
          a1[6] = v13;
          if (!--v14)
            goto LABEL_19;
        }
        return 0;
      }
    }
    else
    {
      v8 = *a1;
      v13 = v4 + 4;
      if (v4 + 4 > v8)
        return 0;
      a1[6] = v13;
    }
LABEL_19:
    if ((unint64_t)v13 + 4 > v8)
      return 0;
    v19 = (unsigned int *)(v3 + v13);
    v20 = v13 + bswap32(*v19) + 4;
    a1[7] = v20;
    if (v20 + 4 <= v8)
    {
      v2 = v19 + 1;
      *a2 = bswap32(*(_DWORD *)(v3 + v20));
    }
    else
    {
      v2 = 0;
      a1[7] = 0;
    }
  }
  return v2;
}

unsigned int *kvbuf_next_val(unsigned int *a1)
{
  return kvbuf_next_val_len(a1, 0);
}

unsigned int *kvbuf_next_val_len(unsigned int *result, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (!result)
    return result;
  v2 = *((_QWORD *)result + 1);
  if (!v2)
    return 0;
  v3 = result[7];
  if (!(_DWORD)v3)
    return 0;
  v4 = result[8];
  if (!(_DWORD)v4)
  {
    v6 = *result;
    LODWORD(v4) = v3 + 4;
    if (v3 + 4 <= v6)
    {
      result[8] = v4;
      LODWORD(v5) = bswap32(*(_DWORD *)(v2 + v4));
      goto LABEL_9;
    }
    return 0;
  }
  v5 = bswap32(*(_DWORD *)(v2 + v4));
  v6 = *result;
  if (v4 + v5 + 4 > v6)
    return 0;
  LODWORD(v4) = v4 + v5 + 4;
  result[8] = v4;
LABEL_9:
  v4 = v4;
  if ((unint64_t)v4 + 4 > v6)
    return 0;
  if (a2)
  {
    *a2 = v5;
    v4 = result[8];
  }
  return (unsigned int *)(v2 + v4 + 4);
}

_QWORD *kvbuf_decode(uint64_t a1)
{
  unsigned int *v2;
  int v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  _QWORD *v7;
  size_t v8;
  _DWORD *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  size_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  char *v30;
  unint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;

  if (!a1)
    return 0;
  v2 = *(unsigned int **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *(_DWORD *)a1 - 4;
  if (*(_DWORD *)a1 < 4u)
    return 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)a1;
  v6 = *v2;
  v4 = v2 + 1;
  v5 = v6;
  *(_DWORD *)(a1 + 16) = v3;
  if (!v6)
    return 0;
  v7 = malloc_type_calloc(1uLL, 0x18uLL, 0x102004023CB03E4uLL);
  if (!v7)
    return v7;
  v8 = bswap32(v5);
  *(_DWORD *)v7 = v8;
  v9 = malloc_type_calloc(v8, 0x20uLL, 0x10900401CF81AC1uLL);
  v7[1] = v9;
  if (!v9)
  {
    free(v7);
    return 0;
  }
  if (*(_DWORD *)v7)
  {
    v10 = 0;
    while (1)
    {
      v11 = *(_DWORD *)(a1 + 16);
      if (v11 <= 3)
        break;
      v12 = *v4++;
      *(_DWORD *)(a1 + 16) = v11 - 4;
      v13 = bswap32(v12);
      v9[8 * v10] = v13;
      if (v12)
      {
        v14 = malloc_type_calloc(v13, 8uLL, 0x50040EE9192B6uLL);
        v15 = v7[1];
        *(_QWORD *)(v15 + 32 * v10 + 8) = v14;
        if (!v14)
          break;
        v16 = malloc_type_calloc(*(unsigned int *)(v15 + 32 * v10), 4uLL, 0x100004052888210uLL);
        v17 = v7[1];
        *(_QWORD *)(v17 + 32 * v10 + 16) = v16;
        if (!v16)
          break;
        v18 = malloc_type_calloc(*(unsigned int *)(v17 + 32 * v10), 8uLL, 0x80040B8603338uLL);
        v9 = (_DWORD *)v7[1];
        *(_QWORD *)&v9[8 * v10 + 6] = v18;
        if (!v18)
          break;
        if (v9[8 * v10])
        {
          v19 = 0;
          do
          {
            v20 = *(_DWORD *)(a1 + 16);
            if (v20 <= 3)
              goto LABEL_32;
            v22 = *v4;
            v21 = v4 + 1;
            v23 = v20 - 4;
            *(_DWORD *)(a1 + 16) = v23;
            v24 = bswap32(v22);
            v25 = v23 >= v24;
            v26 = v23 - v24;
            if (!v25)
              goto LABEL_32;
            *(_QWORD *)(*(_QWORD *)&v9[8 * v10 + 2] + 8 * v19) = v21;
            *(_DWORD *)(a1 + 16) = v26;
            if (v26 <= 3)
              goto LABEL_32;
            v27 = (unsigned int *)((char *)v21 + v24);
            v28 = *v27;
            v4 = v27 + 1;
            *(_DWORD *)(a1 + 16) = v26 - 4;
            v29 = bswap32(v28);
            v9 = (_DWORD *)v7[1];
            *(_DWORD *)(*(_QWORD *)&v9[8 * v10 + 4] + 4 * v19) = v29;
            if (v28)
            {
              *(_QWORD *)(*(_QWORD *)(v7[1] + 32 * v10 + 24) + 8 * v19) = malloc_type_calloc(v29 + 1, 8uLL, 0x50040EE9192B6uLL);
              v9 = (_DWORD *)v7[1];
              v30 = (char *)&v9[8 * v10];
              if (!*(_QWORD *)(*((_QWORD *)v30 + 3) + 8 * v19))
                goto LABEL_32;
              if (*(_DWORD *)(*((_QWORD *)v30 + 2) + 4 * v19))
              {
                v31 = 0;
                v32 = *(_DWORD *)(a1 + 16);
                while (v32 > 3)
                {
                  v33 = *v4;
                  v34 = v32 - 4;
                  *(_DWORD *)(a1 + 16) = v34;
                  v35 = bswap32(v33);
                  v25 = v34 >= v35;
                  v32 = v34 - v35;
                  if (!v25)
                    break;
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v9[8 * v10 + 6] + 8 * v19) + 8 * v31) = v4 + 1;
                  v4 = (unsigned int *)((char *)v4 + v35 + 4);
                  *(_DWORD *)(a1 + 16) = v32;
                  ++v31;
                  v9 = (_DWORD *)v7[1];
                  if (v31 >= *(unsigned int *)(*(_QWORD *)&v9[8 * v10 + 4] + 4 * v19))
                    goto LABEL_28;
                }
                goto LABEL_32;
              }
            }
LABEL_28:
            ;
          }
          while (++v19 < (unint64_t)v9[8 * v10]);
        }
      }
      if (++v10 >= (unint64_t)*(unsigned int *)v7)
        goto LABEL_30;
    }
LABEL_32:
    kvarray_free(v7);
    return 0;
  }
LABEL_30:
  v7[2] = a1;
  return v7;
}

void kvarray_free(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;

  if (a1)
  {
    if (*(_DWORD *)a1)
    {
      v2 = 0;
      do
      {
        v3 = a1[1];
        if (*(_DWORD *)(v3 + 32 * v2))
        {
          v4 = 0;
          do
          {
            v5 = *(_QWORD *)(v3 + 32 * v2 + 24);
            if (v5)
            {
              v6 = *(void **)(v5 + 8 * v4);
              if (v6)
              {
                free(v6);
                v3 = a1[1];
              }
            }
            ++v4;
          }
          while (v4 < *(unsigned int *)(v3 + 32 * v2));
        }
        v7 = *(void **)(v3 + 32 * v2 + 8);
        if (v7)
        {
          free(v7);
          v3 = a1[1];
        }
        v8 = *(void **)(v3 + 32 * v2 + 16);
        if (v8)
        {
          free(v8);
          v3 = a1[1];
        }
        v9 = *(void **)(v3 + 32 * v2 + 24);
        if (v9)
          free(v9);
        ++v2;
      }
      while (v2 < *(unsigned int *)a1);
    }
    *(_DWORD *)a1 = 0;
    v10 = (void *)a1[1];
    if (v10)
      free(v10);
    a1[1] = 0;
    v11 = (_QWORD *)a1[2];
    if (v11)
      kvbuf_free(v11);
    free(a1);
  }
}

_QWORD *si_search()
{
  _QWORD *result;

  result = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    result = si_module_with_name("search");
    si_search_search = (uint64_t)result;
  }
  return result;
}

void si_libinfo_general_callback(unsigned int *a1, int a2, unsigned int *a3)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;

  if (a3)
  {
    if (a2 == 15 || !*(_QWORD *)a3)
    {
      free(a3);
      si_item_release(a1);
    }
    else
    {
      v5 = a3[5];
      if ((v5 & 0x80000000) == 0)
        LI_set_thread_item(a3[4] + v5, (uint64_t)a1);
      v6 = a3[4];
      if (v6 <= 0xC && ((1 << v6) & 0x1FCE) != 0)
      {
        if (a1)
          v7 = a1 + 8;
        else
          v7 = 0;
        (*(void (**)(unsigned int *, _QWORD))a3)(v7, *((_QWORD *)a3 + 1));
      }
      free(a3);
    }
  }
}

passwd *__cdecl getpwuuid(uuid_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_user_byuuid((uint64_t)v1);
  LI_set_thread_item(301, v2);
  if (v2)
    return (passwd *)(v2 + 32);
  else
    return 0;
}

void setpwent(void)
{
  LI_set_thread_list(1, 0);
}

passwd *getpwent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  uint64_t v2;

  thread_list = (uint64_t)LI_get_thread_list(1);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_user_all((uint64_t)v1);
    LI_set_thread_list(1, thread_list);
  }
  v2 = si_list_next(thread_list);
  if (v2)
    return (passwd *)(v2 + 32);
  else
    return 0;
}

int setpassent(int a1)
{
  unsigned int *thread_list;

  thread_list = LI_get_thread_list(1);
  si_list_reset((uint64_t)thread_list);
  return thread_list != 0;
}

group *__cdecl getgruuid(uuid_t a1)
{
  _QWORD *v1;
  group *v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = (group *)si_group_byuuid((uint64_t)v1);
  LI_set_thread_item(302, (uint64_t)v2);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

void setgrent(void)
{
  LI_set_thread_list(2, 0);
}

group *getgrent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  group *v2;

  thread_list = (uint64_t)LI_get_thread_list(2);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_group_all((uint64_t)v1);
    LI_set_thread_list(2, thread_list);
  }
  v2 = (group *)si_list_next(thread_list);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

int setgroupent(int a1)
{
  unsigned int *thread_list;

  thread_list = LI_get_thread_list(2);
  si_list_reset((uint64_t)thread_list);
  return thread_list != 0;
}

int innetgr(const char *a1, const char *a2, const char *a3, const char *a4)
{
  _QWORD *v4;

  v4 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v4 = si_module_with_name("search");
    si_search_search = (uint64_t)v4;
  }
  return si_in_netgroup((uint64_t)v4);
}

void setnetgrent(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_netgroup_byname((uint64_t)v1);
  LI_set_thread_list(4, v2);
}

int getnetgrent(char **a1, char **a2, char **a3)
{
  unsigned int *thread_list;
  char **v7;

  thread_list = LI_get_thread_list(4);
  v7 = (char **)si_list_next((uint64_t)thread_list);
  if (v7)
  {
    *a1 = v7[4];
    *a2 = v7[5];
    *a3 = v7[6];
    LODWORD(v7) = 1;
  }
  return (int)v7;
}

void endnetgrent(void)
{
  LI_set_thread_list(4, 0);
}

int getgrouplist_2(const char *a1, int a2, int *a3, int *a4)
{
  if (a1 && a3)
    return _getgrouplist_2_internal((uint64_t)a1, a2, (int **)a3);
  else
    return 0;
}

uint64_t _getgrouplist_2_internal(uint64_t a1, int a2, int **a3)
{
  _QWORD *v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int *v14;
  int v15;

  v5 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v5 = si_module_with_name("search");
    si_search_search = (uint64_t)v5;
  }
  v6 = si_grouplist((uint64_t)v5);
  LI_set_thread_item(3, v6);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = (int *)malloc_type_calloc(*(int *)(v6 + 40) + 1, 4uLL, 0x100004052888210uLL);
  if (!v7)
    return 0xFFFFFFFFLL;
  *v7 = a2;
  v8 = *(_QWORD *)(v6 + 48);
  if (v8 && (v9 = *(_DWORD *)(v6 + 40), v9 >= 1))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = *(_DWORD *)(v8 + 4 * v10);
      if ((int)v11 < 1)
      {
LABEL_12:
        v7[(int)v11] = v12;
        v11 = (v11 + 1);
        v9 = *(_DWORD *)(v6 + 40);
      }
      else
      {
        v13 = v11;
        v14 = v7;
        while (1)
        {
          v15 = *v14++;
          if (v15 == v12)
            break;
          if (!--v13)
            goto LABEL_12;
        }
      }
      ++v10;
    }
    while (v10 < v9);
  }
  else
  {
    v11 = 1;
  }
  *a3 = v7;
  return v11;
}

uint64_t getgroupcount(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v4;

  v4 = 0;
  v2 = _getgrouplist_2_internal(a1, a2, (int **)&v4);
  if (v4)
    free(v4);
  return v2;
}

aliasent *__cdecl alias_getbyname(const char *a1)
{
  _QWORD *v1;
  aliasent *v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = (aliasent *)si_alias_byname((uint64_t)v1);
  LI_set_thread_item(105, (uint64_t)v2);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

void alias_setent(void)
{
  LI_set_thread_list(5, 0);
}

aliasent *alias_getent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  aliasent *v2;

  thread_list = (uint64_t)LI_get_thread_list(5);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_alias_all((uint64_t)v1);
    LI_set_thread_list(5, thread_list);
  }
  v2 = (aliasent *)si_list_next(thread_list);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

void alias_endent(void)
{
  LI_set_thread_list(5, 0);
}

void freehostent(hostent *a1)
{
  if (a1)
    si_item_release((unsigned int *)&a1[-1]);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  int v2;
  _QWORD *v3;
  uint64_t v4;
  hostent *v5;
  in_addr_t s_addr;
  in_addr v8[2];

  *(_QWORD *)&v8[0].s_addr = 0;
  v2 = inet_aton(a1, v8);
  v3 = (_QWORD *)si_search_search;
  if (v2 == 1)
  {
    if (!si_search_search)
    {
      v3 = si_module_with_name("search");
      si_search_search = (uint64_t)v3;
    }
    v4 = si_ipnode_byname((uint64_t)v3, (char *)a1, 2, 0, 0, (int *)&v8[1]);
  }
  else
  {
    if (!si_search_search)
    {
      v3 = si_module_with_name("search");
      si_search_search = (uint64_t)v3;
    }
    v4 = si_host_byname((uint64_t)v3);
  }
  v5 = (hostent *)v4;
  s_addr = v8[1].s_addr;
  if (v8[1].s_addr >= 0xA)
  {
    s_addr = 3;
    v8[1].s_addr = 3;
  }
  h_errno = s_addr;
  LI_set_thread_item(106, v4);
  if (v5)
    return v5 + 1;
  else
    return 0;
}

_QWORD *gethostbyname_async_call(char *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  result = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040CC6EE3FDuLL);
  if (result)
  {
    v7 = (uint64_t)result;
    *result = a2;
    result[1] = a3;
    result[2] = 0x6400000006;
    v8 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v8 = si_module_with_name("search");
      si_search_search = (uint64_t)v8;
    }
    LODWORD(v9) = 0;
    return (_QWORD *)si_async_call((uint64_t)v8, 11, a1, 0, 0, 2, 0, 0, v9, (uint64_t)si_libinfo_general_callback, v7);
  }
  return result;
}

hostent *__cdecl gethostbyname2(const char *a1, int a2)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  hostent *v7;
  in_addr_t s_addr;
  _QWORD v10[2];
  in_addr v11[2];

  v4 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v4 = si_module_with_name("search");
    si_search_search = (uint64_t)v4;
  }
  v10[1] = 0;
  *(_QWORD *)&v11[0].s_addr = 0;
  v10[0] = 0;
  if (a2 == 30)
  {
    v5 = inet_pton(30, a1, v10);
  }
  else
  {
    if (a2 != 2)
      goto LABEL_9;
    v5 = inet_aton(a1, v11);
  }
  if (v5 == 1)
  {
    v6 = si_ipnode_byname((uint64_t)v4, (char *)a1, a2, 0, 0, (int *)&v11[1]);
    goto LABEL_10;
  }
LABEL_9:
  v6 = si_host_byname((uint64_t)v4);
LABEL_10:
  v7 = (hostent *)v6;
  s_addr = v11[1].s_addr;
  if (v11[1].s_addr >= 0xA)
  {
    s_addr = 3;
    v11[1].s_addr = 3;
  }
  h_errno = s_addr;
  LI_set_thread_item(106, v6);
  if (v7)
    return v7 + 1;
  else
    return 0;
}

hostent *__cdecl gethostbyaddr(const void *a1, socklen_t a2, int a3)
{
  _QWORD *v3;
  hostent *v4;

  v3 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v3 = si_module_with_name("search");
    si_search_search = (uint64_t)v3;
  }
  v4 = (hostent *)si_host_byaddr((uint64_t)v3);
  h_errno = 0;
  LI_set_thread_item(206, (uint64_t)v4);
  if (v4)
    return v4 + 1;
  else
    return 0;
}

_QWORD *gethostbyaddr_async_call(char *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  result = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040CC6EE3FDuLL);
  if (result)
  {
    v11 = (uint64_t)result;
    *result = a4;
    result[1] = a5;
    result[2] = 0xC800000006;
    v12 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v12 = si_module_with_name("search");
      si_search_search = (uint64_t)v12;
    }
    LODWORD(v13) = 0;
    return (_QWORD *)si_async_call((uint64_t)v12, 12, a1, 0, 0, a3, 0, a2, v13, (uint64_t)si_libinfo_general_callback, v11);
  }
  return result;
}

hostent *__cdecl getipnodebyname(const char *a1, int a2, int a3, int *a4)
{
  __int16 v5;
  _QWORD *v8;
  hostent *v9;
  int v10;
  unsigned int v12;

  v5 = a3;
  v12 = 0;
  v8 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v8 = si_module_with_name("search");
    si_search_search = (uint64_t)v8;
  }
  v9 = (hostent *)si_ipnode_byname((uint64_t)v8, (char *)a1, a2, v5, 0, (int *)&v12);
  if (a4)
  {
    v10 = v12;
    if (v12 > 9)
      v10 = 3;
    *a4 = v10;
  }
  if (v9)
    return v9 + 1;
  else
    return 0;
}

hostent *__cdecl getipnodebyaddr(const void *a1, size_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  hostent *v7;

  if (a2 == 16 && a3 == 30 && a1)
  {
    v4 = 0;
    while (!*((_BYTE *)a1 + v4))
    {
      if (++v4 == 10)
      {
        if (*((unsigned __int8 *)a1 + 10) == 255 && *((unsigned __int8 *)a1 + 11) == 255)
          goto LABEL_12;
        break;
      }
    }
    for (i = 0; i != 12; ++i)
    {
      if (*((_BYTE *)a1 + i))
        break;
    }
  }
LABEL_12:
  v6 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v6 = si_module_with_name("search");
    si_search_search = (uint64_t)v6;
  }
  v7 = (hostent *)si_host_byaddr((uint64_t)v6);
  if (v7)
    return v7 + 1;
  else
    return 0;
}

void sethostent(int a1)
{
  LI_set_thread_list(6, 0);
}

hostent *gethostent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  hostent *v2;

  thread_list = (uint64_t)LI_get_thread_list(6);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_host_all((uint64_t)v1);
    LI_set_thread_list(6, thread_list);
  }
  v2 = (hostent *)si_list_next(thread_list);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

void endhostent(void)
{
  LI_set_thread_list(6, 0);
}

int ether_hostton(const char *a1, ether_addr *a2)
{
  int result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t i;
  _DWORD v8[6];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  result = -1;
  if (a1 && a2)
  {
    v5 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v5 = si_module_with_name("search");
      si_search_search = (uint64_t)v5;
    }
    v6 = si_mac_byname((uint64_t)v5);
    LI_set_thread_item(113, v6);
    if (v6 && sscanf(*(const char **)(v6 + 40), " %x:%x:%x:%x:%x:%x", v8, &v8[1], &v8[2], &v8[3], &v8[4], &v8[5]) == 6)
    {
      for (i = 0; i != 6; ++i)
        a2->octet[i] = v8[i];
      return 0;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

int ether_ntohost(char *a1, const ether_addr *a2)
{
  int result;
  uint64_t i;
  _QWORD *v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  char __str[256];
  _DWORD v10[6];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  result = -1;
  if (a1 && a2)
  {
    for (i = 0; i != 6; ++i)
      v10[i] = a2->octet[i];
    snprintf(__str, 0x100uLL, "%x:%x:%x:%x:%x:%x", v10[0], v10[1], v10[2], v10[3], v10[4], v10[5]);
    v5 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v5 = si_module_with_name("search");
      si_search_search = (uint64_t)v5;
    }
    v6 = si_mac_bymac((uint64_t)v5);
    LI_set_thread_item(213, v6);
    if (v6)
    {
      v7 = *(const char **)(v6 + 32);
      v8 = strlen(v7);
      memcpy(a1, v7, v8 + 1);
      return 0;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

netent *__cdecl getnetbyname(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_network_byname((uint64_t)v1);
  LI_set_thread_item(108, v2);
  if (v2)
    return (netent *)(v2 + 32);
  else
    return 0;
}

netent *__cdecl getnetbyaddr(uint32_t a1, int a2)
{
  _QWORD *v2;
  uint64_t v3;

  if (a2 != 2)
    return 0;
  v2 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v2 = si_module_with_name("search");
    si_search_search = (uint64_t)v2;
  }
  v3 = si_network_byaddr((uint64_t)v2);
  LI_set_thread_item(208, v3);
  if (v3)
    return (netent *)(v3 + 32);
  else
    return 0;
}

void setnetent(int a1)
{
  LI_set_thread_list(8, 0);
}

netent *getnetent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  uint64_t v2;

  thread_list = (uint64_t)LI_get_thread_list(8);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_network_all((uint64_t)v1);
    LI_set_thread_list(8, thread_list);
  }
  v2 = si_list_next(thread_list);
  if (v2)
    return (netent *)(v2 + 32);
  else
    return 0;
}

void endnetent(void)
{
  LI_set_thread_list(8, 0);
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  _QWORD *v2;
  servent *v3;

  v2 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v2 = si_module_with_name("search");
    si_search_search = (uint64_t)v2;
  }
  v3 = (servent *)si_service_byname((uint64_t)v2);
  LI_set_thread_item(109, (uint64_t)v3);
  if (v3)
    return v3 + 1;
  else
    return 0;
}

void setservent(int a1)
{
  LI_set_thread_list(9, 0);
}

servent *getservent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  servent *v2;

  thread_list = (uint64_t)LI_get_thread_list(9);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_service_all((uint64_t)v1);
    LI_set_thread_list(9, thread_list);
  }
  v2 = (servent *)si_list_next(thread_list);
  if (v2)
    return v2 + 1;
  else
    return 0;
}

void endservent(void)
{
  LI_set_thread_list(9, 0);
}

protoent *__cdecl getprotobyname(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_protocol_byname((uint64_t)v1);
  LI_set_thread_item(110, v2);
  if (v2)
    return (protoent *)(v2 + 32);
  else
    return 0;
}

protoent *__cdecl getprotobynumber(int a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_protocol_bynumber((uint64_t)v1);
  LI_set_thread_item(210, v2);
  if (v2)
    return (protoent *)(v2 + 32);
  else
    return 0;
}

void setprotoent(int a1)
{
  LI_set_thread_list(10, 0);
}

protoent *getprotoent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  uint64_t v2;

  thread_list = (uint64_t)LI_get_thread_list(10);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_protocol_all((uint64_t)v1);
    LI_set_thread_list(10, thread_list);
  }
  v2 = si_list_next(thread_list);
  if (v2)
    return (protoent *)(v2 + 32);
  else
    return 0;
}

void endprotoent(void)
{
  LI_set_thread_list(10, 0);
}

rpcent *__cdecl getrpcbyname(const char *name)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_rpc_byname((uint64_t)v1);
  LI_set_thread_item(111, v2);
  if (v2)
    return (rpcent *)(v2 + 32);
  else
    return 0;
}

rpcent *__cdecl getrpcbynumber(int number)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_rpc_bynumber((uint64_t)v1);
  LI_set_thread_item(211, v2);
  if (v2)
    return (rpcent *)(v2 + 32);
  else
    return 0;
}

void setrpcent(int stayopen)
{
  LI_set_thread_list(11, 0);
}

rpcent *getrpcent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  uint64_t v2;

  thread_list = (uint64_t)LI_get_thread_list(11);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_rpc_all((uint64_t)v1);
    LI_set_thread_list(11, thread_list);
  }
  v2 = si_list_next(thread_list);
  if (v2)
    return (rpcent *)(v2 + 32);
  else
    return 0;
}

void endrpcent(void)
{
  LI_set_thread_list(11, 0);
}

fstab *__cdecl getfsspec(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_fs_byspec((uint64_t)v1);
  LI_set_thread_item(112, v2);
  if (v2)
    return (fstab *)(v2 + 32);
  else
    return 0;
}

fstab *__cdecl getfsfile(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)si_search_search;
  if (!si_search_search)
  {
    v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }
  v2 = si_fs_byfile((uint64_t)v1);
  LI_set_thread_item(212, v2);
  if (v2)
    return (fstab *)(v2 + 32);
  else
    return 0;
}

int setfsent(void)
{
  LI_set_thread_list(12, 0);
  return 1;
}

fstab *getfsent(void)
{
  uint64_t thread_list;
  _QWORD *v1;
  uint64_t v2;

  thread_list = (uint64_t)LI_get_thread_list(12);
  if (!thread_list)
  {
    v1 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }
    thread_list = si_fs_all((uint64_t)v1);
    LI_set_thread_list(12, thread_list);
  }
  v2 = si_list_next(thread_list);
  if (v2)
    return (fstab *)(v2 + 32);
  else
    return 0;
}

void endfsent(void)
{
  LI_set_thread_list(12, 0);
}

uint64_t getaddrinfo_async_send(unsigned int *a1, char *a2, char *a3, int *a4)
{
  uint64_t v4;
  unsigned int v6;

  v4 = 11;
  if (a1)
  {
    v6 = _getaddrinfo_interface_async_call(a2, a3, a4, 0, 0, 0);
    *a1 = v6;
    if (v6)
      return 0;
    else
      return 11;
  }
  return v4;
}

uint64_t getaddrinfo_async_receive()
{
  return 11;
}

_QWORD *_getnameinfo_interface_async_call(char *a1, size_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  result = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040CC6EE3FDuLL);
  if (result)
  {
    v13 = (uint64_t)result;
    *result = a5;
    result[1] = a6;
    result[2] = 15;
    v14 = (_QWORD *)si_search_search;
    if (!si_search_search)
    {
      v14 = si_module_with_name("search");
      si_search_search = (uint64_t)v14;
    }
    LODWORD(v15) = 0;
    return (_QWORD *)si_async_call((uint64_t)v14, 30, a1, 0, a4, a3, 0, a2, v15, (uint64_t)si_libinfo_nameinfo_callback, v13);
  }
  return result;
}

void si_libinfo_nameinfo_callback(uint64_t a1, int a2, void (**a3)(uint64_t, char *, char *, uint64_t))
{
  void (*v5)(uint64_t, char *, char *, uint64_t);
  unsigned int v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  void (*v10)(uint64_t, char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  const char *v14;

  if (a3)
  {
    if (a2 == 15 || (v5 = *a3) == 0)
    {
      si_item_release((unsigned int *)a1);
    }
    else
    {
      if ((a2 - 200) >= 0xFFFFFF9D)
        v6 = a2 - 100;
      else
        v6 = 4;
      if (a2)
        v7 = v6;
      else
        v7 = 0;
      if (a1)
      {
        LI_set_thread_item(14, a1);
        v8 = *(const char **)(a1 + 32);
        if (v8)
          v9 = strdup(v8);
        else
          v9 = 0;
        v14 = *(const char **)(a1 + 40);
        if (v14)
          v13 = strdup(v14);
        else
          v13 = 0;
        v5 = *a3;
        v10 = a3[1];
        v11 = v7;
        v12 = v9;
      }
      else
      {
        v10 = a3[1];
        v11 = v7;
        v12 = 0;
        v13 = 0;
      }
      v5(v11, v12, v13, (uint64_t)v10);
    }
    free(a3);
  }
}

uint64_t getnameinfo_async_start(unsigned int *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unsigned int v8;

  v6 = 11;
  if (a1)
  {
    v8 = _getnameinfo_interface_async_call(a2, a3, a4, 0, a5, a6);
    *a1 = v8;
    if (v8)
      return 0;
    else
      return 11;
  }
  return v6;
}

uint64_t getnameinfo_async_send(unsigned int *a1, char *a2, size_t a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v6;

  v4 = 11;
  if (a1)
  {
    v6 = _getnameinfo_interface_async_call(a2, a3, a4, 0, 0, 0);
    *a1 = v6;
    if (v6)
      return 0;
    else
      return 11;
  }
  return v4;
}

uint64_t getnameinfo_async_handle_reply(uint64_t a1)
{
  si_async_handle_reply(a1);
  return 0;
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  uint64_t v7;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  int v12;

  if (a5)
  {
    *a5 = 0;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        v9 = a4;
        if (a4)
        {
          v10 = (_QWORD *)si_search_search;
          if (!si_search_search)
          {
            v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }
          v7 = si_group_byname((uint64_t)v10);
          if (v7)
          {
            v11 = (unsigned int *)v7;
            v12 = copy_group_r(v7 + 32, (uint64_t)a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }
            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }
  else
  {
    LODWORD(v7) = 34;
  }
  return v7;
}

uint64_t copy_group_r(uint64_t a1, uint64_t a2, _QWORD *a3, int a4)
{
  const char *v8;
  int v9;
  uint64_t result;
  const char *v11;
  int v12;
  const char **v13;
  const char *v14;
  uint64_t v15;
  const char **v16;
  uint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  int v23;

  if (!a1)
    return 0xFFFFFFFFLL;
  v8 = *(const char **)a1;
  if (v8)
    v9 = strlen(v8) + 1;
  else
    v9 = 0;
  v11 = *(const char **)(a1 + 8);
  if (v11)
    v9 += strlen(v11) + 1;
  v12 = v9 + 8;
  v13 = *(const char ***)(a1 + 24);
  if (v13 && (v14 = *v13) != 0)
  {
    v15 = 0;
    v16 = v13 + 1;
    do
    {
      v17 = v15;
      v12 += strlen(v14) + 9;
      ++v15;
      v14 = v16[v17];
    }
    while (v14);
  }
  else
  {
    LODWORD(v15) = 0;
  }
  if (v12 > a4)
    return 0xFFFFFFFFLL;
  *(_QWORD *)a2 = 0;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)a2 = a3;
    v18 = strlen(*(const char **)a1) + 1;
    memmove(a3, *(const void **)a1, v18);
    a3 = (_QWORD *)((char *)a3 + v18);
  }
  *(_QWORD *)(a2 + 8) = 0;
  if (*(_QWORD *)(a1 + 8))
  {
    *(_QWORD *)(a2 + 8) = a3;
    v19 = strlen(*(const char **)(a1 + 8)) + 1;
    memmove(a3, *(const void **)(a1 + 8), v19);
    a3 = (_QWORD *)((char *)a3 + v19);
  }
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 24) = 0;
  if (*(_QWORD *)(a1 + 24))
  {
    *(_QWORD *)(a2 + 24) = a3;
    if ((_DWORD)v15)
    {
      v20 = 0;
      v21 = (char *)&a3[(v15 + 1)];
      v22 = 8 * v15;
      do
      {
        a3[v20 / 8] = v21;
        v23 = strlen(*(const char **)(*(_QWORD *)(a1 + 24) + v20)) + 1;
        memmove(v21, *(const void **)(*(_QWORD *)(a1 + 24) + v20), v23);
        v21 += v23;
        v20 += 8;
      }
      while (v22 != v20);
      a3 = (_QWORD *)((char *)a3 + v20);
    }
  }
  result = 0;
  *a3 = 0;
  return result;
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  uint64_t v7;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  int v12;

  if (a5)
  {
    *a5 = 0;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        v9 = a4;
        if (a4)
        {
          v10 = (_QWORD *)si_search_search;
          if (!si_search_search)
          {
            v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }
          v7 = si_group_bygid((uint64_t)v10);
          if (v7)
          {
            v11 = (unsigned int *)v7;
            v12 = copy_group_r(v7 + 32, (uint64_t)a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }
            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }
  else
  {
    LODWORD(v7) = 34;
  }
  return v7;
}

int getgruuid_r(uuid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  uint64_t v7;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  int v12;

  if (a5)
  {
    *a5 = 0;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        v9 = a4;
        if (a4)
        {
          v10 = (_QWORD *)si_search_search;
          if (!si_search_search)
          {
            v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }
          v7 = si_group_byuuid((uint64_t)v10);
          if (v7)
          {
            v11 = (unsigned int *)v7;
            v12 = copy_group_r(v7 + 32, (uint64_t)a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }
            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }
  else
  {
    LODWORD(v7) = 34;
  }
  return v7;
}

int getpwuuid_r(uuid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  uint64_t v7;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  int v12;

  if (a5)
  {
    *a5 = 0;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        v9 = a4;
        if (a4)
        {
          v10 = (_QWORD *)si_search_search;
          if (!si_search_search)
          {
            v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }
          v7 = si_user_byuuid((uint64_t)v10);
          if (v7)
          {
            v11 = (unsigned int *)v7;
            v12 = copy_user_r(v7 + 32, a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }
            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }
  else
  {
    LODWORD(v7) = 34;
  }
  return v7;
}

char *__cdecl user_from_uid(uid_t a1, int a2)
{
  passwd *v4;
  char *v5;

  v4 = getpwuid(a1);
  if (v4)
    return v4->pw_name;
  if (a2)
    return 0;
  v5 = user_from_uid_buf;
  snprintf(user_from_uid_buf, 0x10uLL, "%u", a1);
  return v5;
}

char *__cdecl group_from_gid(gid_t a1, int a2)
{
  group *v4;
  char *v5;

  v4 = getgrgid(a1);
  if (v4)
    return v4->gr_name;
  if (a2)
    return 0;
  v5 = group_from_gid_buf;
  snprintf(group_from_gid_buf, 0x10uLL, "%u", a1);
  return v5;
}

const prdb_ent *__cdecl prdb_getbyname(const char *a1)
{
  return 0;
}

const prdb_ent *prdb_get(void)
{
  return 0;
}

bootparamsent *__cdecl bootparams_getbyname(const char *a1)
{
  return 0;
}

bootparamsent *bootparams_getent(void)
{
  return 0;
}

uint64_t mdns_is_valid()
{
  return 0;
}

_OWORD *mdns_hostbyname(uint64_t a1, char *a2, int a3, char *a4, int *a5)
{
  int v10;
  _OWORD *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _OWORD v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  if (a5)
  {
    *a5 = 0;
    v10 = 3;
    if (!a1 || !a2)
      goto LABEL_24;
  }
  else
  {
    v11 = 0;
    if (!a1 || !a2)
      return v11;
  }
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  memset(v22, 0, sizeof(v22));
  v23 = 0;
  if (a3 == 30)
  {
    DWORD1(v25) = 16;
    *((_QWORD *)&v22[0] + 1) = &v24;
    v12 = 28;
  }
  else
  {
    if (a3 != 2)
    {
      if (a5)
      {
LABEL_23:
        v10 = 3;
        goto LABEL_24;
      }
      return 0;
    }
    DWORD1(v25) = 4;
    *(_QWORD *)&v22[0] = &v24;
    v12 = 1;
  }
  _mdns_debug_message(";; mdns_hostbyname %s type %u class %u\n", a2, v12, 1);
  LODWORD(v25) = a3;
  if (_mdns_search(a2, 1u, v12, a4, 0, 0, 0, (uint64_t *)v22) || !HIDWORD(v26))
  {
    _mdns_reply_clear((uint64_t)v22);
    if (a5)
    {
      v10 = 1;
LABEL_24:
      v11 = 0;
      *a5 = v10;
      return v11;
    }
    return 0;
  }
  time(0);
  if (a3 == 30)
    v20 = "L4488s*44c";
  else
    v20 = "L4488s*44a";
  v11 = LI_ils_create(v20, v13, v14, v15, v16, v17, v18, v19, a1);
  _mdns_reply_clear((uint64_t)v22);
  if (a5 && !v11)
    goto LABEL_23;
  return v11;
}

_OWORD *mdns_hostbyaddr(uint64_t a1, unsigned __int8 *a2, int a3, const char *a4, int *a5)
{
  int v10;
  _OWORD *v11;
  unsigned int v12;
  int v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned int v16;
  char *v17;
  char *v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _OWORD v29[2];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  char *v36[8];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C874D8];
  if (a5)
  {
    *a5 = 0;
    v10 = 3;
    if (!a1 || !a2)
      goto LABEL_36;
  }
  else
  {
    v11 = 0;
    if (!a1 || !a2)
      return v11;
  }
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  memset(v29, 0, sizeof(v29));
  v30 = 0;
  if (a3 == 30)
  {
    if (!a4 && *a2 == 254 && (a2[1] & 0xC0) == 0x80)
    {
      v12 = __rev16(*((unsigned __int16 *)a2 + 1));
      v35 = *(_OWORD *)a2;
      WORD1(v35) = 0;
      if (v12)
      {
        v14 = (unsigned __int8 *)&v35;
        if ((_is_v6addr_ifaddr(&v35, v12) & 1) != 0)
        {
          v12 = -1;
          goto LABEL_21;
        }
      }
    }
    else
    {
      v12 = 0;
    }
    v14 = a2;
LABEL_21:
    v15 = 0;
    DWORD1(v32) = 16;
    *((_QWORD *)&v29[0] + 1) = &v31;
    v37 = 0;
    do
    {
      v16 = *v14++;
      v17 = (char *)v36 + v15;
      v17[63] = 46;
      v17[62] = hexchar[(unint64_t)v16 >> 4];
      v17[61] = 46;
      v17[60] = hexchar[v16 & 0xF];
      v15 -= 4;
    }
    while (v15 != -64);
    v34 = 0;
    asprintf(&v34, "%sip6.arpa.", (const char *)v36);
    v18 = v34;
    goto LABEL_26;
  }
  if (a3 != 2)
    goto LABEL_31;
  v12 = 0;
  v13 = *a2;
  if (!a4 && v13 == 169)
  {
    if (a2[1] == 254)
    {
      v12 = (int)(_is_v4addr_ifaddr(a2) << 31) >> 31;
      v13 = *a2;
    }
    else
    {
      v12 = 0;
      v13 = 169;
    }
  }
  DWORD1(v32) = 4;
  *(_QWORD *)&v29[0] = &v31;
  v36[0] = 0;
  asprintf(v36, "%u.%u.%u.%u.in-addr.arpa.", a2[3], a2[2], a2[1], v13);
  v18 = v36[0];
LABEL_26:
  LODWORD(v32) = a3;
  _mdns_debug_message(";; mdns_hostbyaddr %s type %u class %u\n", v18, 12, 1);
  if (a4)
  {
    v12 = if_nametoindex(a4);
    if (!v12)
    {
      free(v18);
LABEL_34:
      _mdns_reply_clear((uint64_t)v29);
      if (a5)
      {
        v10 = 1;
        goto LABEL_36;
      }
      return 0;
    }
  }
  v19 = _mdns_search_ex(v18, 1u, 0xCu, v12, 0, 0, 0, (uint64_t *)v29);
  free(v18);
  if (v19)
    goto LABEL_34;
  if (_mdns_hostent_append_addr((uint64_t)&v31, a2, DWORD1(v32)))
  {
    _mdns_hostent_clear((uint64_t)&v31);
LABEL_31:
    if (a5)
    {
LABEL_32:
      v10 = 3;
LABEL_36:
      v11 = 0;
      *a5 = v10;
      return v11;
    }
    return 0;
  }
  time(0);
  if (a3 == 30)
    v28 = "L4488s*44c";
  else
    v28 = "L4488s*44a";
  v11 = LI_ils_create(v28, v21, v22, v23, v24, v25, v26, v27, a1);
  _mdns_hostent_clear((uint64_t)&v31);
  if (a5 && !v11)
    goto LABEL_32;
  return v11;
}

void **mdns_srv_byname(uint64_t a1, char *a2, char *a3, _DWORD *a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  unsigned int *v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (a1)
  {
    if (a4)
      *a4 = 0;
    _mdns_debug_message(";; mdns_srv_byname %s type %u class %u\n", a2, 33, 1);
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v7 = _mdns_search(a2, 1u, 0x21u, a3, 0, 0, 0, (uint64_t *)&v19);
    v15 = 0;
    if (!v7)
    {
      v16 = v20;
      if ((_QWORD)v20)
      {
        v15 = 0;
        do
        {
          v17 = (unsigned int *)LI_ils_create("L4488222s", v8, v9, v10, v11, v12, v13, v14, a1);
          v15 = si_list_add(v15, (uint64_t)v17);
          si_item_release(v17);
          v16 = *(_QWORD *)(v16 + 16);
        }
        while (v16);
      }
      else
      {
        v15 = 0;
      }
    }
    _mdns_reply_clear((uint64_t)&v19);
  }
  else
  {
    v15 = 0;
    if (a4)
      *a4 = 3;
  }
  return v15;
}

_OWORD *mdns_item_call()
{
  uint64_t v0;
  const char *v1;
  char *v2;
  unsigned int v3;
  unsigned int v4;
  int *v5;
  int *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  int v21;
  _OWORD v23[2];
  uint64_t v24;
  _OWORD v25[2];
  uint64_t v26;
  uint64_t v27[5];
  unsigned int v28;
  char v29[65536];
  uint64_t v30;

  v0 = MEMORY[0x1E0C86820]();
  v6 = v5;
  v30 = *MEMORY[0x1E0C874D8];
  v28 = 0x10000;
  if (!v0 || (v7 = (char *)v1) == 0)
  {
    if (v5)
    {
      v20 = 0;
      v21 = 3;
LABEL_16:
      *v6 = v21;
      return v20;
    }
    return 0;
  }
  v8 = v4;
  v9 = v3;
  v10 = v2;
  v11 = v0;
  if (v5)
    *v5 = 0;
  _mdns_debug_message(";; mdns_item_call %s type %u class %u\n", v1, v4, v3);
  v25[0] = 0u;
  v23[0] = 0u;
  v24 = 0;
  v25[1] = 0x400000002uLL;
  v23[1] = 0x100000001EuLL;
  v26 = 0;
  v27[0] = (uint64_t)v25;
  v27[1] = (uint64_t)v23;
  memset(&v27[2], 0, 24);
  if (_mdns_search(v7, v9, v8, v10, 0, (uint64_t)v29, &v28, v27) || !v28 || v28 > 0x10000)
  {
    _mdns_reply_clear((uint64_t)v27);
    if (v6)
    {
      v20 = 0;
      v21 = 1;
      goto LABEL_16;
    }
    return 0;
  }
  v19 = LI_ils_create("L4488@@", v12, v13, v14, v15, v16, v17, v18, v11);
  v20 = v19;
  if (v6 && !v19)
    *v6 = 3;
  _mdns_reply_clear((uint64_t)v27);
  return v20;
}

unint64_t _mdns_pack_domain_name(char *__s, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  char *v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  const char *v10;
  char v11;
  int v12;
  BOOL v13;

  v3 = 0xFFFFFFFFLL;
  if (__s && a2 && a3)
  {
    v6 = __s;
    v7 = 0;
    LODWORD(v3) = 0;
    while (1)
    {
      v8 = v6;
      v9 = strchr(v6, 46);
      if (!v9)
        v9 = (char *)&v8[strlen(v8)];
      if ((unint64_t)(v9 - v8) > 0x3F)
        break;
      *(_BYTE *)(a2 + v7) = (_BYTE)v9 - (_BYTE)v8;
      v3 = (v3 + 1);
      if (v8 >= v9)
      {
        v10 = v8;
      }
      else
      {
        v10 = v8;
        if ((int)v3 < a3)
        {
          v3 = (int)v3;
          v10 = v8;
          do
          {
            v11 = *v10++;
            *(_BYTE *)(a2 + v3++) = v11;
          }
          while (v10 < v9 && v3 < a3);
        }
      }
      v12 = *(unsigned __int8 *)v10;
      v6 = (char *)(v10 + 1);
      v7 = (int)v3;
      if (v12)
        v13 = (int)v3 >= a3;
      else
        v13 = 1;
      if (v13)
      {
        if ((int)v3 < a3)
        {
          if (v9 == v8 || (v3 = (v3 + 1), *(_BYTE *)(a2 + v7) = 0, v7 = (int)v3, (int)v3 < a3))
          {
            *(_BYTE *)(a2 + v7) = 0;
            return v3;
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return v3;
}

uint64_t _is_v4addr_ifaddr(_DWORD *a1)
{
  uint64_t v2;
  ifaddrs *v3;
  sockaddr *ifa_addr;
  ifaddrs *v6;

  v6 = 0;
  if (getifaddrs(&v6))
    return 0;
  if (v6)
  {
    v3 = v6;
    while (1)
    {
      if ((v3->ifa_flags & 1) != 0)
      {
        ifa_addr = v3->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 2 && *(_DWORD *)&ifa_addr->sa_data[2] == *a1)
            break;
        }
      }
      v3 = v3->ifa_next;
      if (!v3)
        goto LABEL_10;
    }
    v2 = 1;
  }
  else
  {
LABEL_10:
    v2 = 0;
  }
  freeifaddrs(v6);
  return v2;
}

uint64_t _is_v6addr_ifaddr(_QWORD *a1, int a2)
{
  uint64_t v4;
  ifaddrs *v5;
  sockaddr *ifa_addr;
  uint64_t v7;
  uint64_t v8;
  ifaddrs *v11;

  v11 = 0;
  if (getifaddrs(&v11))
    return 0;
  if (v11)
  {
    v5 = v11;
    while (1)
    {
      if ((v5->ifa_flags & 1) != 0)
      {
        ifa_addr = v5->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 30 && *(_DWORD *)&ifa_addr[1].sa_data[6] == a2)
          {
            v8 = *(_QWORD *)&ifa_addr->sa_data[6];
            v7 = *(_QWORD *)&ifa_addr[1].sa_len;
            if (v8 == *a1 && v7 == a1[1])
              break;
          }
        }
      }
      v5 = v5->ifa_next;
      if (!v5)
        goto LABEL_14;
    }
    v4 = 1;
  }
  else
  {
LABEL_14:
    v4 = 0;
  }
  freeifaddrs(v11);
  return v4;
}

uint64_t _mdns_atfork_child()
{
  _mdns_old_sdref = _mdns_sdref;
  _mdns_sdref = 0;
  return pthread_mutex_unlock(&_mdns_mutex);
}

void search_close(uint64_t a1)
{
  char *v1;
  uint64_t i;
  void *v3;
  char *v4;

  if (a1)
  {
    v1 = *(char **)(a1 + 32);
    if (v1)
    {
      for (i = 0; i != 432; i += 24)
      {
        v3 = *(void **)&v1[i];
        if (v3)
        {
          free(v3);
          v4 = &v1[i];
          *(_QWORD *)v4 = 0;
          *((_QWORD *)v4 + 2) = 0;
        }
      }
      free(v1);
    }
  }
}

uint64_t search_is_valid()
{
  return 0;
}

uint64_t search_user_byuuid(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    if (v1)
    {
      v2 = 0;
      do
      {
        result = search_get_module(v1, 1u, &v2);
        if (!result)
          break;
        result = si_user_byuuid(result);
      }
      while (!result);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void **search_user_all(uint64_t a1)
{
  return search_list(a1, 1u, (uint64_t (*)(void))si_user_all);
}

uint64_t search_group_byuuid(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    if (v1)
    {
      v2 = 0;
      do
      {
        result = search_get_module(v1, 2u, &v2);
        if (!result)
          break;
        result = si_group_byuuid(result);
      }
      while (!result);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void **search_group_all(uint64_t a1)
{
  return search_list(a1, 2u, (uint64_t (*)(void))si_group_all);
}

void **search_netgroup_byname(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void **v5;
  char v6;
  uint64_t module;
  uint64_t v8;
  uint64_t v9;
  int v11;

  if (!a1)
    return 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  v3 = 0;
  v4 = 96;
  if (!*(_DWORD *)(v2 + 112))
    v4 = 0;
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (v3 = *(const char **)(v2 + 432)) == 0
    || (v5 = (void **)si_netgroup_byname(*(_QWORD *)(v2 + 432))) == 0)
  {
    v5 = 0;
    v11 = 0;
    v6 = 1;
    while (1)
    {
      module = search_get_module(v2, 4u, &v11);
      if (!module)
        break;
      if (module != *(_QWORD *)(v2 + 432))
      {
        v8 = si_netgroup_byname(module);
        if (v8)
        {
          v9 = v8;
          v5 = si_list_concat(v5, v8);
          si_list_release(v9);
        }
        else
        {
          v6 = 0;
        }
      }
    }
    if (v5 != 0 && (v6 & 1) != 0)
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
  }
  return v5;
}

uint64_t search_in_netgroup(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    if (v1)
    {
      v2 = 0;
      while (1)
      {
        result = search_get_module(v1, 4u, &v2);
        if (!result)
          break;
        if (si_in_netgroup(result))
          return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t search_alias_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 5u, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_alias_byname(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 120;
          if (!*(_DWORD *)(v1 + 136))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

void **search_alias_all(uint64_t a1)
{
  return search_list(a1, 5u, (uint64_t (*)(void))si_alias_all);
}

uint64_t search_host_byname(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int *a5)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t module;
  const char **v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  int v16;

  if (a5)
  {
    *a5 = 0;
    if (!a1 || !a2 || (v6 = *(_QWORD *)(a1 + 32)) == 0)
    {
      v7 = 0;
      v8 = 3;
LABEL_6:
      *a5 = v8;
      return v7;
    }
LABEL_10:
    if (a3 == 30)
      v9 = 7;
    else
      v9 = 6;
    v16 = 0;
    while (1)
    {
      module = search_get_module(v6, v9, &v16);
      if (!module)
        break;
      v11 = (const char **)module;
      v12 = si_host_byname(module);
      if (v12)
      {
        v7 = v12;
        if (*(_DWORD *)(v6 + 24 * v9 + 16))
          v13 = v9;
        else
          v13 = 0;
        if ((*(_BYTE *)(v6 + 24 * v13 + 20) & 1) != 0)
          v14 = *(const char **)(v6 + 432);
        else
          v14 = 0;
        si_cache_add_item(v14, v11, v7);
        return v7;
      }
    }
    if (!a5)
      return 0;
    v7 = 0;
    v8 = 1;
    goto LABEL_6;
  }
  v7 = 0;
  if (a1 && a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
      return 0;
    goto LABEL_10;
  }
  return v7;
}

uint64_t search_host_byaddr(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int *a5)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t module;
  const char **v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  int v16;

  if (a5)
  {
    *a5 = 0;
    if (!a1 || !a2 || (v6 = *(_QWORD *)(a1 + 32)) == 0)
    {
      v7 = 0;
      v8 = 3;
LABEL_6:
      *a5 = v8;
      return v7;
    }
LABEL_10:
    if (a3 == 30)
      v9 = 7;
    else
      v9 = 6;
    v16 = 0;
    while (1)
    {
      module = search_get_module(v6, v9, &v16);
      if (!module)
        break;
      v11 = (const char **)module;
      v12 = si_host_byaddr(module);
      if (v12)
      {
        v7 = v12;
        if (*(_DWORD *)(v6 + 24 * v9 + 16))
          v13 = v9;
        else
          v13 = 0;
        if ((*(_BYTE *)(v6 + 24 * v13 + 20) & 1) != 0)
          v14 = *(const char **)(v6 + 432);
        else
          v14 = 0;
        si_cache_add_item(v14, v11, v7);
        return v7;
      }
    }
    if (!a5)
      return 0;
    v7 = 0;
    v8 = 1;
    goto LABEL_6;
  }
  v7 = 0;
  if (a1 && a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
      return 0;
    goto LABEL_10;
  }
  return v7;
}

void **search_host_all(uint64_t a1)
{
  return search_list(a1, 6u, (uint64_t (*)(void))si_host_all);
}

uint64_t search_network_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 8u, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_network_byname(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 192;
          if (!*(_DWORD *)(v1 + 208))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t search_network_byaddr(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 8u, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_network_byaddr(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 192;
          if (!*(_DWORD *)(v1 + 208))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

void **search_network_all(uint64_t a1)
{
  return search_list(a1, 8u, (uint64_t (*)(void))si_network_all);
}

uint64_t search_service_byname(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t module;
  const char **v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v10;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v10 = 0;
      while (1)
      {
        module = search_get_module(v3, 9u, &v10);
        if (!module)
          break;
        v5 = (const char **)module;
        v6 = si_service_byname(module);
        if (v6)
        {
          v2 = v6;
          v7 = 0;
          v8 = 216;
          if (!*(_DWORD *)(v3 + 232))
            v8 = 0;
          if ((*(_BYTE *)(v3 + v8 + 20) & 1) != 0)
            v7 = *(const char **)(v3 + 432);
          si_cache_add_item(v7, v5, v2);
          return v2;
        }
      }
    }
    return 0;
  }
  return v2;
}

void **search_service_all(uint64_t a1)
{
  return search_list(a1, 9u, (uint64_t (*)(void))si_service_all);
}

uint64_t search_protocol_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xAu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_protocol_byname(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 240;
          if (!*(_DWORD *)(v1 + 256))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t search_protocol_bynumber(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xAu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_protocol_bynumber(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 240;
          if (!*(_DWORD *)(v1 + 256))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

void **search_protocol_all(uint64_t a1)
{
  return search_list(a1, 0xAu, (uint64_t (*)(void))si_protocol_all);
}

uint64_t search_rpc_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xBu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_rpc_byname(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 264;
          if (!*(_DWORD *)(v1 + 280))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t search_rpc_bynumber(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xBu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_rpc_bynumber(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 264;
          if (!*(_DWORD *)(v1 + 280))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

void **search_rpc_all(uint64_t a1)
{
  return search_list(a1, 0xBu, (uint64_t (*)(void))si_rpc_all);
}

uint64_t search_fs_byspec(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xCu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_fs_byspec(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 288;
          if (!*(_DWORD *)(v1 + 304))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t search_fs_byfile(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xCu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_fs_byfile(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 288;
          if (!*(_DWORD *)(v1 + 304))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

void **search_fs_all(uint64_t a1)
{
  return search_list(a1, 0xCu, (uint64_t (*)(void))si_fs_all);
}

uint64_t search_mac_byname(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xDu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_mac_byname(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 312;
          if (!*(_DWORD *)(v1 + 328))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

uint64_t search_mac_bymac(uint64_t a1)
{
  uint64_t v1;
  uint64_t module;
  const char **v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v9;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1)
    {
      v9 = 0;
      while (1)
      {
        module = search_get_module(v1, 0xDu, &v9);
        if (!module)
          break;
        v3 = (const char **)module;
        v4 = si_mac_bymac(module);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = 312;
          if (!*(_DWORD *)(v1 + 328))
            v7 = 0;
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0)
            v6 = *(const char **)(v1 + 432);
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }
  return 0;
}

void **search_mac_all(uint64_t a1)
{
  return search_list(a1, 0xDu, (uint64_t (*)(void))si_mac_all);
}

uint64_t search_nameinfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  uint64_t v9;
  uint64_t module;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char **v14;
  _OWORD *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int v19;
  int v21;

  if (a5)
    *a5 = 104;
  if (!a1)
    return 0;
  v9 = *(_QWORD *)(a1 + 32);
  if (!v9)
    return 0;
  v21 = 0;
  while (1)
  {
    module = search_get_module(v9, 0xEu, &v21);
    if (!module)
      break;
    v14 = (const char **)module;
    v15 = si_nameinfo(module, a2, a3, a4, a5, v11, v12, v13);
    if (v15)
    {
      v16 = (uint64_t)v15;
      v17 = 0;
      v18 = 336;
      if (!*(_DWORD *)(v9 + 352))
        v18 = 0;
      if ((*(_BYTE *)(v9 + v18 + 20) & 1) != 0)
        v17 = *(const char **)(v9 + 432);
      si_cache_add_item(v17, v14, v16);
      if (a5)
      {
        v19 = 0;
LABEL_18:
        *a5 = v19;
        return v16;
      }
      return v16;
    }
  }
  v16 = 0;
  if (a5 && v21 >= 1)
  {
    v19 = 108;
    goto LABEL_18;
  }
  return v16;
}

uint64_t search_srv_byname(uint64_t result, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t module;
  uint64_t (*v7)(void);
  int v8;

  if (result)
  {
    v4 = *(_QWORD *)(result + 32);
    if (v4)
    {
      v8 = 0;
      while (1)
      {
        module = search_get_module(v4, 0x11u, &v8);
        if (!module)
          break;
        if (module != *(_QWORD *)(v4 + 432))
        {
          v7 = *(uint64_t (**)(void))(*(_QWORD *)(module + 40) + 312);
          if (v7)
          {
            result = v7();
            if (result)
              return result;
          }
        }
      }
      result = 0;
      if (a4 && v8 >= 1)
      {
        result = 0;
        *a4 = 108;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void **search_list(uint64_t a1, unsigned int a2, uint64_t (*a3)(void))
{
  void **v3;
  uint64_t v6;
  unsigned int v8;
  uint64_t module;
  const char **v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  const char *v15;
  int v16;

  v3 = 0;
  if (!a1 || !a3)
    return v3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
    return 0;
  v8 = *(_DWORD *)(v6 + 24 * a2 + 16) ? a2 : 0;
  if ((*(_BYTE *)(v6 + 24 * v8 + 20) & 1) != 0 && *(_QWORD *)(v6 + 432))
  {
    v15 = *(const char **)(v6 + 432);
    v3 = (void **)a3();
    if (v3)
      return v3;
  }
  else
  {
    v15 = 0;
  }
  v16 = 0;
  module = search_get_module(v6, a2, &v16);
  if (!module)
    return 0;
  v10 = (const char **)module;
  v3 = 0;
  v14 = 1;
  do
  {
    while (v10 != *(const char ***)(v6 + 432)
         && (a2 - 1 > 1 || !_os_feature_enabled_simple_impl() || strcmp(*v10, "file")))
    {
      v11 = ((uint64_t (*)(const char **))a3)(v10);
      if (v11)
      {
        v12 = v11;
        v3 = si_list_concat(v3, v11);
        si_list_release(v12);
        break;
      }
      v10 = (const char **)search_get_module(v6, a2, &v16);
      v14 = 0;
      if (!v10)
        return v3;
    }
    v10 = (const char **)search_get_module(v6, a2, &v16);
  }
  while (v10);
  if (v3 != 0 && (v14 & 1) != 0)
    si_cache_add_list(v15, (const char **)a1, (uint64_t)v3);
  return v3;
}

uint64_t si_list_next(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = *(unsigned int *)(result + 8);
    if (v1 >= *(_DWORD *)(result + 4))
    {
      return 0;
    }
    else
    {
      v2 = *(_QWORD *)(result + 16);
      *(_DWORD *)(result + 8) = v1 + 1;
      return *(_QWORD *)(v2 + 8 * v1);
    }
  }
  return result;
}

unsigned int *si_list_retain(unsigned int *result)
{
  unsigned int v1;

  if (result)
  {
    do
      v1 = __ldaxr(result);
    while (__stlxr(v1 + 1, result));
    if ((v1 & 0x80000000) != 0)
      si_list_retain_cold_1();
  }
  return result;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 175, a4);
}

const char *__cdecl gai_strerror(int a1)
{
  if ((a1 - 1) > 0xD)
    return "Unknown error";
  else
    return off_1E2E56DD0[a1 - 1];
}

_OWORD *si_addrinfo_v4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return LI_ils_create("L448844444Ss", a2, a3, a4, a5, a6, a7, a8, a1);
}

_OWORD *si_addrinfo_v4_mapped(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return LI_ils_create("L448844444Ss", a2, a3, a4, a5, a6, a7, a8, a1);
}

unsigned int *_gai_simple(uint64_t a1, uint64_t a2, const char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9)
{
  unsigned int *result;
  int v14;
  unsigned int *v15;
  unsigned int *v16;
  uint64_t *v17;
  uint64_t *v18;
  unsigned int *v19;
  unsigned __int16 v20;

  v20 = 0;
  if ((a7 & 0x1000) != 0)
  {
    if (!a3)
    {
      if (a9)
      {
        result = 0;
        v14 = 3;
        goto LABEL_15;
      }
      return 0;
    }
    v20 = *(_WORD *)a3;
  }
  else if (_gai_serv_to_port(a3, a6, &v20))
  {
    if (a9)
    {
      result = 0;
      v14 = 108;
LABEL_15:
      *a9 = v14;
      return result;
    }
    return 0;
  }
  if ((a7 & 4) != 0)
  {
    if (a4 == 30)
    {
      v16 = (unsigned int *)si_host_byaddr(a1);
      v15 = 0;
      goto LABEL_24;
    }
    if (a4 == 2)
      v15 = (unsigned int *)si_host_byaddr(a1);
    else
      v15 = 0;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  if ((a4 | 2) == 2)
    v15 = (unsigned int *)si_host_byname(a1);
  else
    v15 = 0;
  if (a4 != 30 && a4)
    goto LABEL_23;
  v16 = (unsigned int *)si_host_byname(a1);
LABEL_24:
  if (v15)
    v17 = (uint64_t *)(v15 + 8);
  else
    v17 = 0;
  if (v16)
    v18 = (uint64_t *)(v16 + 8);
  else
    v18 = 0;
  v19 = (unsigned int *)si_addrinfo_list_from_hostent(a1, a7, (uint64_t)a3, a6, v20, 0, v17, v18);
  si_item_release(v15);
  si_item_release(v16);
  return _gai_sort_list(v19, a7);
}

uint64_t si_srv_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 312)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_wants_addrinfo(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(void);

  if (a1 && (v1 = *(_QWORD *)(a1 + 40), *(_QWORD *)(v1 + 288)) && (v2 = *(uint64_t (**)(void))(v1 + 296)) != 0)
    return v2();
  else
    return 0;
}

BOOL _gai_nat64_can_v4_address_be_synthesized(unsigned int *a1)
{
  unsigned int v1;
  _BOOL8 result;
  BOOL v4;
  unsigned int v6;

  if (!a1)
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    result = os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    _gai_nat64_can_v4_address_be_synthesized_cold_1();
    return 0;
  }
  v1 = bswap32(*a1);
  if ((v1 & 0xFF000000) == 0 || (v1 & 0xFF000000) == 2130706432)
    return 0;
  v4 = v1 >> 8 == 12605539 || (v1 & 0xFFFF0000) == -1442971648;
  if (v4 || (v1 & 0xFFFFFFF8) == -1073741824)
    return 0;
  v6 = v1 >> 28;
  return *a1 != -1 && v6 != 14;
}

uint64_t si_ipnode_byname(uint64_t a1, char *a2, int a3, __int16 a4, uint64_t a5, int *a6)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *hostent6;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  _BOOL4 v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  _BOOL4 v34;
  int v35;
  void **v36;
  void **v37;
  const char **v38;
  const char *v39;
  uint64_t v40;
  _DWORD **v41;
  uint64_t v42;
  const char **v43;
  const char *v44;
  uint64_t v45;
  _OWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v56;
  in_addr v57;
  uint64_t v58;
  in_addr_t s_addr;
  uint64_t v60;
  in_addr_t *p_s_addr;
  uint64_t v62;
  uint64_t v63;

  v9 = (uint64_t)a2;
  v63 = *MEMORY[0x1E0C874D8];
  v57.s_addr = 0;
  v56 = 0uLL;
  if (a6)
    *a6 = 0;
  v58 = 0;
  if (a3 != 2)
  {
    if (a3 != 30)
      goto LABEL_74;
    if (inet_pton(30, a2, &v56) == 1)
    {
      v24 = *((_QWORD *)&v56 + 1);
      v23 = v56;
      v25 = a1;
      v26 = v9;
    }
    else
    {
      if (inet_aton((const char *)v9, &v57) != 1)
        goto LABEL_18;
      if ((a4 & 0xA00) == 0)
        goto LABEL_49;
      *(_QWORD *)&v56 = 0;
      DWORD2(v56) = -65536;
      HIDWORD(v56) = v57;
      v24 = *((_QWORD *)&v56 + 1);
      v25 = a1;
      v26 = v9;
      v23 = 0;
    }
    hostent6 = make_hostent6(v25, v26, v23, v24, v19, v20, v21, v22);
    goto LABEL_14;
  }
  if (inet_aton(a2, &v57) == 1)
  {
    s_addr = v57.s_addr;
    if (!v9)
    {
LABEL_15:
      if (!a6 || v9)
        return v9;
      goto LABEL_76;
    }
    p_s_addr = &s_addr;
    v62 = 0;
    v60 = 0;
    hostent6 = LI_ils_create("L4488s*44a", v11, v12, v13, v14, v15, v16, v17, a1);
LABEL_14:
    v9 = (uint64_t)hostent6;
    goto LABEL_15;
  }
LABEL_18:
  v27 = 0;
  v28 = 0;
  v58 = 0;
  if ((a4 & 0x400) != 0)
  {
    if ((si_inet_config((_DWORD *)&v58 + 1, &v58) & 0x80000000) != 0)
      goto LABEL_74;
    v28 = v58;
    v27 = HIDWORD(v58);
    if (!v58)
      goto LABEL_74;
  }
  if (a3 == 2)
  {
    v29 = 0;
    LOBYTE(v30) = 0;
    if ((a4 & 0x400) != 0 && !v27)
      goto LABEL_74;
  }
  else
  {
    if ((a4 & 0xA00) == 0)
    {
      LOBYTE(v30) = 0;
      v31 = 1;
      v29 = 0;
      if ((a4 & 0x400) != 0 && !v28)
        goto LABEL_74;
      goto LABEL_32;
    }
    v29 = (a4 & 0x100) == 0;
    v30 = (unsigned __int16)(a4 & 0x100) >> 8;
  }
  v31 = 0;
  if (!v29 && (v30 & 1) == 0)
  {
    v32 = 0;
    v29 = 0;
    v33 = 0;
    goto LABEL_33;
  }
LABEL_32:
  v33 = v31;
  v32 = si_host_byname(a1);
  LOBYTE(v31) = v30;
LABEL_33:
  if (v32)
    v34 = 0;
  else
    v34 = v29;
  if (a3 != 2 && (v31 & 1) == 0 && !v34)
  {
    v9 = 0;
LABEL_44:
    if (v33)
    {
      si_item_release((unsigned int *)v9);
      if (!a6)
        return v32;
      v9 = v32;
      if (v32)
        return v9;
      goto LABEL_51;
    }
    if (!(v32 | v9))
    {
LABEL_49:
      if (a6)
      {
        v9 = 0;
LABEL_51:
        v35 = 1;
LABEL_77:
        *a6 = v35;
        return v9;
      }
      return 0;
    }
    v36 = (void **)malloc_type_calloc(1uLL, 0x30uLL, 0x10900400D5AB4AFuLL);
    if (v36)
    {
      v37 = v36;
      if (v9)
      {
        *v36 = (void *)lower_case(*(const char **)(v9 + 32));
        v38 = *(const char ***)(v9 + 40);
        if (v38)
        {
          v39 = *v38;
          if (*v38)
          {
            v40 = 8;
            do
            {
              merge_alias(v39, (uint64_t)v37);
              v39 = *(const char **)(*(_QWORD *)(v9 + 40) + v40);
              v40 += 8;
            }
            while (v39);
          }
        }
        v41 = *(_DWORD ***)(v9 + 56);
        if (*v41)
        {
          v42 = 8;
          do
          {
            *(_QWORD *)&v56 = 0;
            DWORD2(v56) = -65536;
            HIDWORD(v56) = **v41;
            append_addr(&v56, (uint64_t)v37);
            v41 = (_DWORD **)(*(_QWORD *)(v9 + 56) + v42);
            v42 += 8;
          }
          while (*v41);
        }
      }
      if (v32)
      {
        if (!*v37)
          *v37 = (void *)lower_case(*(const char **)(v32 + 32));
        v43 = *(const char ***)(v32 + 40);
        if (v43)
        {
          v44 = *v43;
          if (*v43)
          {
            v45 = 8;
            do
            {
              merge_alias(v44, (uint64_t)v37);
              v44 = *(const char **)(*(_QWORD *)(v32 + 40) + v45);
              v45 += 8;
            }
            while (v44);
          }
        }
        v46 = **(_OWORD ***)(v32 + 56);
        if (v46)
        {
          v47 = 8;
          do
          {
            append_addr(v46, (uint64_t)v37);
            v46 = *(_OWORD **)(*(_QWORD *)(v32 + 56) + v47);
            v47 += 8;
          }
          while (v46);
        }
      }
      si_item_release((unsigned int *)v9);
      si_item_release((unsigned int *)v32);
      v9 = (uint64_t)LI_ils_create("L4488s*44c", v48, v49, v50, v51, v52, v53, v54, a1);
      free_build_hostent(v37);
      return v9;
    }
    si_item_release((unsigned int *)v9);
    si_item_release((unsigned int *)v32);
LABEL_74:
    if (a6)
    {
      v9 = 0;
LABEL_76:
      v35 = 3;
      goto LABEL_77;
    }
    return 0;
  }
  v9 = si_host_byname(a1);
  if (a3 != 2)
    goto LABEL_44;
  si_item_release((unsigned int *)v32);
  if (a6 && !v9)
    goto LABEL_51;
  return v9;
}

_OWORD *make_hostent6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C874D8];
  v9[0] = a3;
  v9[1] = a4;
  if (!a2)
    return 0;
  v9[3] = v9;
  v9[4] = 0;
  v9[2] = 0;
  return LI_ils_create("L4488s*44c", a2, a3, a4, a5, a6, a7, a8, a1);
}

const char *lower_case(const char *result)
{
  const char *v1;
  size_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = strlen(result);
    result = (const char *)malloc_type_malloc(v2 + 1, 0x4231B706uLL);
    if (result)
    {
      v3 = *(unsigned __int8 *)v1;
      if (*v1)
      {
        v4 = 0;
        do
        {
          if ((v3 - 65) < 0x1A)
            LOBYTE(v3) = v3 + 32;
          result[v4] = v3;
          v5 = v4 + 1;
          v3 = v1[++v4];
        }
        while (v3);
      }
      else
      {
        v5 = 0;
      }
      result[v5] = 0;
    }
  }
  return result;
}

const char *merge_alias(const char *result, uint64_t a2)
{
  const char *v3;
  const char *v4;
  int v5;
  const char **v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(const char **)a2;
  if (v3)
  {
    v4 = result;
    result = (const char *)strcmp(result, v3);
    if ((_DWORD)result)
    {
      v5 = *(_DWORD *)(a2 + 32);
      if (v5 < 1)
      {
LABEL_7:
        if (v5)
          result = (const char *)reallocf(*(void **)(a2 + 8), 8 * (v5 + 2));
        else
          result = (const char *)malloc_type_calloc(2uLL, 8uLL, 0x10040436913F5uLL);
        *(_QWORD *)(a2 + 8) = result;
        if (result)
        {
          result = lower_case(v4);
          v8 = *(int *)(a2 + 32);
          *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8 * v8) = result;
          *(_DWORD *)(a2 + 32) = v8 + 1;
          *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8 * (v8 + 1)) = 0;
        }
        else
        {
          *(_DWORD *)(a2 + 32) = 0;
        }
      }
      else
      {
        v6 = *(const char ***)(a2 + 8);
        v7 = *(unsigned int *)(a2 + 32);
        while (1)
        {
          result = (const char *)strcmp(v4, *v6);
          if (!(_DWORD)result)
            break;
          ++v6;
          if (!--v7)
            goto LABEL_7;
        }
      }
    }
  }
  return result;
}

_OWORD *append_addr(_OWORD *result, uint64_t a2)
{
  _OWORD *v3;
  int v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;

  if (result)
  {
    v3 = result;
    v4 = *(_DWORD *)(a2 + 36);
    if (v4)
      result = reallocf(*(void **)(a2 + 24), 8 * (v4 + 2));
    else
      result = malloc_type_calloc(2uLL, 8uLL, 0x10040436913F5uLL);
    *(_QWORD *)(a2 + 24) = result;
    if (result)
    {
      result = malloc_type_malloc(0x10uLL, 0x76CAC5BAuLL);
      v5 = *(int *)(a2 + 36);
      *(_QWORD *)(*(_QWORD *)(a2 + 24) + 8 * v5) = result;
      v6 = *(_OWORD **)(*(_QWORD *)(a2 + 24) + 8 * v5);
      if (v6)
      {
        *v6 = *v3;
        v7 = *(int *)(a2 + 36) + 1;
        *(_DWORD *)(a2 + 36) = v7;
        *(_QWORD *)(*(_QWORD *)(a2 + 24) + 8 * v7) = 0;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 36) = 0;
    }
  }
  return result;
}

void free_build_hostent(void **a1)
{
  void *v2;
  void **v3;
  void *v4;
  void **v5;
  void *v6;
  void **v7;
  void *v8;
  unsigned int v9;

  v2 = *a1;
  if (v2)
    free(v2);
  *a1 = 0;
  v3 = (void **)a1[1];
  if (v3)
  {
    v4 = *v3;
    if (*v3)
    {
      v5 = v3 + 1;
      do
      {
        free(v4);
        v6 = *v5++;
        v4 = v6;
      }
      while (v6);
      v3 = (void **)a1[1];
    }
    free(v3);
  }
  a1[1] = 0;
  v7 = (void **)a1[3];
  if (v7)
  {
    v8 = *v7;
    if (*v7)
    {
      v9 = 1;
      do
      {
        free(v8);
        v7 = (void **)a1[3];
        v8 = v7[v9++];
      }
      while (v8);
    }
    free(v7);
  }
  free(a1);
}

void gai_child_has_forked()
{
  _gai_log = MEMORY[0x1E0C88E98];
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

_QWORD *si_module_with_path(const char *a1, const char *a2)
{
  int v2;
  void *v4;
  void *v5;
  unsigned int (*v6)(_QWORD *);
  unsigned int (*v7)(_QWORD *);
  _QWORD *v8;
  char *v9;
  char *v10;

  v2 = 22;
  if (!a1 || !a2)
    goto LABEL_14;
  v4 = dlopen(a1, 4);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (unsigned int (*)(_QWORD *))si_mod_dlsym(v4, a2, "init");
  if (!v6 || (v7 = v6, !si_mod_dlsym(v5, a2, "close")))
  {
    dlclose(v5);
    goto LABEL_12;
  }
  v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10F00401C06F9BCuLL);
  v9 = strdup(a2);
  v10 = v9;
  if (!v8 || !v9)
  {
    free(v8);
    free(v10);
    dlclose(v5);
    v2 = 12;
    goto LABEL_14;
  }
  *v8 = v9;
  *(_QWORD *)((char *)v8 + 12) = 1;
  v8[3] = v5;
  if (v7(v8))
  {
    dlclose(v5);
    free(v8);
    free(v10);
LABEL_12:
    v2 = 61;
LABEL_14:
    v8 = 0;
    *__error() = v2;
  }
  return v8;
}

void *si_mod_dlsym(void *a1, const char *a2, const char *a3)
{
  void *v4;
  char *__symbol;

  if (!a3)
    return 0;
  __symbol = 0;
  asprintf(&__symbol, "%s_%s", a2, a3);
  if (!__symbol)
    return 0;
  v4 = dlsym(a1, __symbol);
  free(__symbol);
  return v4;
}

uint64_t si_module_retain(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  if (result && (*(_BYTE *)(result + 16) & 1) == 0)
  {
    v1 = (unsigned int *)(result + 12);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }
  return result;
}

void si_module_release(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  signed int v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;

  if (!a1)
    return;
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    return;
  v2 = (unsigned int *)(a1 + 12);
  do
  {
    v3 = __ldaxr(v2);
    v4 = __OFSUB__(v3, 1);
    v5 = v3 - 1;
  }
  while (__stlxr(v5, v2));
  if (!((v5 < 0) ^ v4 | (v5 == 0)))
    return;
  pthread_mutex_lock(&module_mutex);
  if (!module_count)
  {
LABEL_14:
    pthread_mutex_unlock(&module_mutex);
    return;
  }
  v6 = 0;
  v7 = (void *)module_list;
  v8 = (_QWORD *)(module_list + 8);
  while (*(v8 - 1) != a1)
  {
    ++v6;
    ++v8;
    if (module_count == v6)
      goto LABEL_14;
  }
  if (module_count == 1)
  {
    free((void *)module_list);
    module_list = 0;
    module_count = 0;
    goto LABEL_14;
  }
  v9 = (module_count - 1);
  if ((int)v6 + 1 < module_count)
  {
    v10 = (module_count - 1) - v6;
    do
    {
      *(v8 - 1) = *v8;
      ++v8;
      --v10;
    }
    while (v10);
  }
  module_count = v9;
  module_list = (uint64_t)reallocf(v7, 8 * v9);
  if (!module_list)
    module_count = 0;
  pthread_mutex_unlock(&module_mutex);
  v11 = **(void (***)(uint64_t))(a1 + 40);
  if (v11)
    v11(a1);
  v12 = *(void **)(a1 + 24);
  if (v12)
    dlclose(v12);
  free(*(void **)a1);
  free((void *)a1);
}

uint64_t si_module_name(uint64_t result)
{
  if (result)
    return *(_QWORD *)result;
  return result;
}

uint64_t si_module_vers(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t si_user_byuuid(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 32)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_user_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 40)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_group_byuuid(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 64)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_group_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 72)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_netgroup_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 88)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_in_netgroup(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 96)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_alias_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 104)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_alias_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 112)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_host_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 120)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_host_byaddr(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 128)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_host_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 136)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_mac_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 264)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_mac_bymac(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 272)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_mac_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 280)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_network_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 144)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_network_byaddr(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 152)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_network_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 160)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_service_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 168)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_service_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 184)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_protocol_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 192)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_protocol_bynumber(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 200)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_protocol_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 208)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_rpc_byname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 216)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_rpc_bynumber(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 224)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_rpc_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 232)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_fs_byspec(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 240)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_fs_byfile(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 248)) != 0)
    return v1();
  else
    return 0;
}

uint64_t si_fs_all(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 256)) != 0)
    return v1();
  else
    return 0;
}

_OWORD *si_item_call(uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8)
{
  uint64_t (*v8)(void);
  uint64_t (*v9)(void);
  _OWORD *result;
  uint64_t (*v11)(void);
  uint64_t (*v12)(void);
  uint64_t (*v13)(void);

  if (!a1)
    return 0;
  switch(a2)
  {
    case 0:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 1:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 24);
      if (!v11)
        return 0;
      return (_OWORD *)v11();
    case 3:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 48);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 4:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 56);
      if (!v11)
        return 0;
      return (_OWORD *)v11();
    case 8:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 80);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 9:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 104);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 11:
      v12 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 120);
      if (!v12)
        return 0;
      return (_OWORD *)v12();
    case 12:
      v12 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 128);
      if (!v12)
        return 0;
      return (_OWORD *)v12();
    case 14:
    case 23:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 144);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 15:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 152);
      if (!v11)
        return 0;
      return (_OWORD *)v11();
    case 17:
      v13 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 168);
      if (!v13)
        return 0;
      return (_OWORD *)v13();
    case 18:
      v13 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 176);
      if (!v13)
        return 0;
      return (_OWORD *)v13();
    case 20:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 192);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 21:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 200);
      if (!v11)
        return 0;
      return (_OWORD *)v11();
    case 24:
      v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 224);
      if (!v11)
        return 0;
      return (_OWORD *)v11();
    case 26:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 240);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 27:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 248);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 30:
      return si_nameinfo(a1, (uint64_t)a3, a6, a5, a8, a6, a7, (uint64_t)a8);
    case 31:
      return (_OWORD *)si_ipnode_byname(a1, a3, a6, a7, a5, a8);
    case 32:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 264);
      if (!v8)
        return 0;
      goto LABEL_16;
    case 33:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 272);
      if (!v8)
        return 0;
LABEL_16:
      result = (_OWORD *)v8();
      break;
    case 35:
    case 36:
      v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 320);
      if (!v9)
        return 0;
      result = (_OWORD *)v9();
      break;
    default:
      return 0;
  }
  return result;
}

void si_async_cancel(int a1)
{
  uint64_t unit;
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  void (*v5)(_QWORD, uint64_t, _QWORD);

  unit = si_async_worklist_find_unit(a1);
  if (unit)
  {
    v2 = unit;
    v3 = (unsigned __int8 *)(unit + 60);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 | 1, v3));
    v5 = *(void (**)(_QWORD, uint64_t, _QWORD))(unit + 72);
    if (v5)
      v5(0, 15, *(_QWORD *)(unit + 80));
    si_async_workunit_release(v2);
  }
}

char *si_standardize_mac_address(char *result)
{
  const char *v1;
  ether_addr *v2;
  ether_addr *v3;
  uint64_t i;
  unsigned int v5;
  char *v6;
  char *v7;
  char v8[3];
  char v9[3];
  char v10[3];
  char v11[3];
  char v12[3];
  char v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  if (result)
  {
    v1 = result;
    pthread_mutex_lock(&module_mutex);
    v2 = ether_aton(v1);
    if (v2)
    {
      v3 = v2;
      for (i = 0; i != 18; i += 3)
      {
        v5 = v3->octet[0];
        v3 = (ether_addr *)((char *)v3 + 1);
        v6 = &v8[i];
        if (v5 >= 0x10uLL)
          sprintf(v6, "%x");
        else
          sprintf(v6, "0%x");
      }
      pthread_mutex_unlock(&module_mutex);
      v7 = 0;
      asprintf(&v7, "%s:%s:%s:%s:%s:%s", v8, v9, v10, v11, v12, v13);
      return v7;
    }
    else
    {
      pthread_mutex_unlock(&module_mutex);
      return 0;
    }
  }
  return result;
}

unsigned int *LI_get_thread_item(int a1)
{
  unsigned int *result;

  result = LI_get_thread_info(a1);
  if (result)
    return *(unsigned int **)result;
  return result;
}

unsigned int *LI_get_thread_list(int a1)
{
  unsigned int *result;

  result = LI_get_thread_info(a1);
  if (result)
    return (unsigned int *)*((_QWORD *)result + 1);
  return result;
}

uint64_t parse_compatibility_uuid(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;

  if (*(_QWORD *)a1 != 0xCCCCDDDDEEEEFFFFLL || *(_DWORD *)(a1 + 8) != -1431651397)
  {
    if (*(_QWORD *)a1 != 0xCDABEFCDABEFCDABLL || *(_DWORD *)(a1 + 8) != -271733777)
      return 0;
    *a2 = bswap32(*(_DWORD *)(a1 + 12));
    if (!a3)
      return 1;
    LODWORD(result) = 2;
LABEL_14:
    *a3 = result;
    return 1;
  }
  *a2 = bswap32(*(_DWORD *)(a1 + 12));
  result = 1;
  if (a3)
    goto LABEL_14;
  return result;
}

BOOL compatibility_name_for_id(gid_t a1, int a2, char **a3)
{
  int v6;
  uint64_t v7;
  int v8;
  int v10;
  uint64_t v11;
  BOOL v12;
  char *v13;
  uint64_t v14;
  passwd *v15;
  passwd v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  if (sysconf(71) == 0xFFFFFFFFLL)
    return 0;
  if (a2 == 2)
  {
    v10 = MEMORY[0x1E0C86820]();
    memset(&v16, 0, 32);
    v15 = 0;
    v8 = getgrgid_r(a1, (group *)&v16, (char *)&v14 - ((v11 + 15) & 0x1FFFFFFF0), v10, (group **)&v15);
    goto LABEL_7;
  }
  if (a2 != 1)
    return 0;
  v6 = MEMORY[0x1E0C86820]();
  memset(&v16, 0, sizeof(v16));
  v15 = 0;
  v8 = getpwuid_r(a1, &v16, (char *)&v14 - ((v7 + 15) & 0x1FFFFFFF0), v6, &v15);
LABEL_7:
  if (v8)
    v12 = 1;
  else
    v12 = v15 == 0;
  if (v12)
    return 0;
  v13 = strdup(v16.pw_name);
  *a3 = v13;
  return v13 != 0;
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  gid_t identifier;

  identifier = gid;
  return mbr_identifier_to_uuid(1, &identifier, 4uLL, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  int v5;
  int v6;
  int v7;
  void *v8;
  int v10;
  void *v11;

  v11 = 0;
  v10 = 0;
  v5 = mbr_identifier_translate(6u, (gid_t *)uu, 16, 0x1Eu, (char **)&v11, &v10);
  if (!v5)
  {
    if (v10 == 1)
      v6 = 0;
    else
      v6 = -1;
    if (v10 == 2)
      v7 = 1;
    else
      v7 = v6;
    *id_type = v7;
    v8 = v11;
    *uid_or_gid = *(_DWORD *)v11;
    free(v8);
  }
  return v5;
}

int mbr_sid_to_uuid(const nt_sid_t *sid, uuid_t uu)
{
  return 5;
}

uint64_t mbr_uuid_to_sid_type()
{
  return 5;
}

int mbr_uuid_to_sid(const uuid_t uu, nt_sid_t *sid)
{
  return 5;
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  uint64_t v3;

  return mbr_check_membership_ext(6, (const char *)user, 16, 6, group, v3, ismember);
}

uint64_t mbr_check_membership_ext(int a1, const char *a2, uint64_t a3, int a4, const unsigned __int8 *a5, uint64_t a6, _DWORD *a7)
{
  uint64_t result;

  if (!_os_feature_enabled_simple_impl())
    return 5;
  result = _dd_mbr_check_membership_ext(a1, a2, a3, a4, a5, a7);
  if (result >= 2)
  {
    if ((_DWORD)result == 2)
      return 0;
    else
      return 22;
  }
  return result;
}

uint64_t mbr_check_membership_refresh(const char *a1, const unsigned __int8 *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return mbr_check_membership_ext(6, a1, 16, 6, a2, a6, a3);
}

uint64_t _dd_mbr_check_membership_ext(int a1, const char *src, uint64_t a3, int a4, const unsigned __int8 *a5, _DWORD *a6)
{
  uint64_t v6;
  const unsigned __int8 *v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  host_t v13;
  host_t v14;
  _QWORD *v15;
  unsigned int v16;
  uint64_t v17;
  host_t v18;
  uint64_t multiuser_config_flags;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  host_t v23;
  host_t v24;
  _QWORD *v25;
  unsigned int v26;
  uint64_t v27;
  host_t v28;
  uint64_t v29;
  uint64_t v30;
  host_t v32;
  host_t v33;
  uint64_t v34;
  _QWORD v35[8];
  _QWORD v36[8];
  _QWORD v37[8];
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[6];
  _QWORD v41[3];
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  const unsigned __int8 *v62;
  uint64_t v63;
  uint32_t multiuser_flags[2];
  uint64_t v65;
  uint64_t (*v66)(uint64_t);
  void *v67;
  _QWORD *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C874D8];
  *a6 = 0;
  v6 = 3;
  if (!src)
    return v6;
  v7 = a5;
  if (!a5)
    return v6;
  v10 = src;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2000000000;
  v46 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2000000000;
  v42 = -2;
  if (!a1)
  {
    if (a3 == 4)
    {
      v16 = *(_DWORD *)src;
      v10 = (const char *)MEMORY[0x1E0C87450];
      v38[0] = MEMORY[0x1E0C87450];
      v38[1] = 0x40000000;
      v38[2] = ___dd_mbr_check_membership_ext_block_invoke_3;
      v38[3] = &unk_1E2E57070;
      v38[4] = &v43;
      v38[5] = v41;
      v57 = 0;
      v59 = 0;
      v58 = v16;
      v53 = 0;
      v54 = &v53;
      v55 = 0x2000000000;
      v56 = 0;
      v47 = MEMORY[0x1E0C87450];
      v48 = 0x40000000;
      v49 = ___dd_foreach_record_with_id_block_invoke;
      v50 = &unk_1E2E56F58;
      v51 = v38;
      v52 = &v53;
      v17 = DarwinDirectoryRecordStoreApplyWithFilter();
      if (!*((_BYTE *)v54 + 24))
      {
        multiuser_flags[0] = 0;
        v18 = MEMORY[0x194021814](v17);
        multiuser_config_flags = host_get_multiuser_config_flags(v18, multiuser_flags);
        if (!(_DWORD)multiuser_config_flags)
        {
          if ((multiuser_flags[0] & 0x80000000) == 0 || v16 != 501)
            goto LABEL_17;
          goto LABEL_44;
        }
LABEL_43:
        multiuser_config_flags = mbr_identifier_translate_cold_2();
LABEL_44:
        multiuser_flags[0] = 0;
        v32 = MEMORY[0x194021814](multiuser_config_flags);
        if (!host_get_multiuser_config_flags(v32, multiuser_flags))
        {
          LODWORD(v58) = multiuser_flags[0] & 0x3FFFFFFF;
          *(_QWORD *)multiuser_flags = v10;
          v65 = 0x40000000;
          v66 = ___dd_foreach_record_with_id_block_invoke_2;
          v67 = &unk_1E2E56F80;
          v15 = v38;
          goto LABEL_46;
        }
        mbr_identifier_translate_cold_2();
LABEL_53:
        mbr_identifier_translate_cold_2();
LABEL_54:
        mbr_identifier_translate_cold_2();
        goto LABEL_55;
      }
LABEL_17:
      _Block_object_dispose(&v53, 8);
      goto LABEL_20;
    }
LABEL_40:
    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&v43, 8);
    free((void *)v44[3]);
    return v6;
  }
  if (a1 != 6)
  {
    if (a1 == 4)
    {
      v11 = MEMORY[0x1E0C87450];
      v40[0] = MEMORY[0x1E0C87450];
      v40[1] = 0x40000000;
      v40[2] = ___dd_mbr_check_membership_ext_block_invoke;
      v40[3] = &unk_1E2E57020;
      v40[4] = &v43;
      v40[5] = v41;
      v58 = (unint64_t)src;
      v59 = 0;
      v57 = 1;
      v53 = 0;
      v54 = &v53;
      v55 = 0x2000000000;
      v56 = 0;
      v47 = MEMORY[0x1E0C87450];
      v48 = 0x40000000;
      v49 = ___dd_foreach_record_with_name_block_invoke;
      v50 = &unk_1E2E56FA8;
      v51 = v40;
      v52 = &v53;
      v12 = DarwinDirectoryRecordStoreApplyWithFilter();
      if (!*((_BYTE *)v54 + 24))
      {
        multiuser_flags[0] = 0;
        v13 = MEMORY[0x194021814](v12);
        if (!host_get_multiuser_config_flags(v13, multiuser_flags))
        {
          if ((multiuser_flags[0] & 0x80000000) == 0 || strcmp(v10, "mobile"))
            goto LABEL_17;
          LODWORD(v57) = 0;
          multiuser_flags[0] = 0;
          v14 = MEMORY[0x194021814]();
          if (!host_get_multiuser_config_flags(v14, multiuser_flags))
          {
            LODWORD(v58) = multiuser_flags[0] & 0x3FFFFFFF;
            *(_QWORD *)multiuser_flags = v11;
            v65 = 0x40000000;
            v66 = ___dd_foreach_record_with_name_block_invoke_2;
            v67 = &unk_1E2E56FD0;
            v15 = v40;
LABEL_46:
            v68 = v15;
            DarwinDirectoryRecordStoreApplyWithFilter();
            goto LABEL_17;
          }
          goto LABEL_53;
        }
        mbr_identifier_translate_cold_2();
        goto LABEL_43;
      }
      goto LABEL_17;
    }
    goto LABEL_40;
  }
  if (a3 != 16)
    goto LABEL_40;
  v20 = MEMORY[0x1E0C87450];
  v39[0] = MEMORY[0x1E0C87450];
  v39[1] = 0x40000000;
  v39[2] = ___dd_mbr_check_membership_ext_block_invoke_2;
  v39[3] = &unk_1E2E57048;
  v39[4] = &v43;
  v39[5] = v41;
  *(_QWORD *)multiuser_flags = 2;
  v65 = 0;
  v66 = 0;
  uuid_copy((unsigned __int8 *)&v65, (const unsigned __int8 *)src);
  v47 = v20;
  v48 = 0x40000000;
  v49 = ___dd_foreach_record_with_uuid_block_invoke;
  v50 = &unk_1E2E56FF8;
  v51 = v39;
  DarwinDirectoryRecordStoreApplyWithFilter();
LABEL_20:
  if (!v44[3])
  {
    v6 = 1;
    goto LABEL_40;
  }
  v57 = 0;
  v58 = (unint64_t)&v57;
  v59 = 0x2000000000;
  v60 = 0;
  if (a4 == 1)
  {
    v26 = *(_DWORD *)v7;
    v7 = (const unsigned __int8 *)MEMORY[0x1E0C87450];
    v35[0] = MEMORY[0x1E0C87450];
    v35[1] = 0x40000000;
    v35[2] = ___dd_mbr_check_membership_ext_block_invoke_6;
    v35[3] = &unk_1E2E570E8;
    v35[4] = &v43;
    v35[5] = v41;
    v35[6] = &v57;
    v35[7] = a6;
    v61 = 0;
    v63 = 0;
    v62 = (const unsigned __int8 *)v26;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2000000000;
    v56 = 0;
    v47 = MEMORY[0x1E0C87450];
    v48 = 0x40000000;
    v49 = ___dd_foreach_record_with_id_block_invoke;
    v50 = &unk_1E2E56F58;
    v51 = v35;
    v52 = &v53;
    v27 = DarwinDirectoryRecordStoreApplyWithFilter();
    if (!*((_BYTE *)v54 + 24))
    {
      multiuser_flags[0] = 0;
      v28 = MEMORY[0x194021814](v27);
      v29 = host_get_multiuser_config_flags(v28, multiuser_flags);
      if (!(_DWORD)v29)
      {
        if ((multiuser_flags[0] & 0x80000000) == 0 || v26 != 501)
          goto LABEL_35;
LABEL_49:
        multiuser_flags[0] = 0;
        v33 = MEMORY[0x194021814](v29);
        if (!host_get_multiuser_config_flags(v33, multiuser_flags))
        {
          LODWORD(v62) = multiuser_flags[0] & 0x3FFFFFFF;
          *(_QWORD *)multiuser_flags = v7;
          v65 = 0x40000000;
          v66 = ___dd_foreach_record_with_id_block_invoke_2;
          v67 = &unk_1E2E56F80;
          v25 = v35;
          goto LABEL_51;
        }
        goto LABEL_54;
      }
LABEL_48:
      v29 = mbr_identifier_translate_cold_2();
      goto LABEL_49;
    }
LABEL_35:
    _Block_object_dispose(&v53, 8);
LABEL_37:
    v6 = 2 * (*(_BYTE *)(v58 + 24) == 0);
LABEL_39:
    _Block_object_dispose(&v57, 8);
    goto LABEL_40;
  }
  if (a4 == 6)
  {
    v30 = MEMORY[0x1E0C87450];
    v36[0] = MEMORY[0x1E0C87450];
    v36[1] = 0x40000000;
    v36[2] = ___dd_mbr_check_membership_ext_block_invoke_5;
    v36[3] = &unk_1E2E570C0;
    v36[4] = &v43;
    v36[5] = v41;
    v36[6] = &v57;
    v36[7] = a6;
    *(_QWORD *)multiuser_flags = 2;
    v65 = 0;
    v66 = 0;
    uuid_copy((unsigned __int8 *)&v65, v7);
    v47 = v30;
    v48 = 0x40000000;
    v49 = ___dd_foreach_record_with_uuid_block_invoke;
    v50 = &unk_1E2E56FF8;
    v51 = v36;
    DarwinDirectoryRecordStoreApplyWithFilter();
    goto LABEL_37;
  }
  if (a4 != 5)
  {
    v6 = 3;
    goto LABEL_39;
  }
  v21 = MEMORY[0x1E0C87450];
  v37[0] = MEMORY[0x1E0C87450];
  v37[1] = 0x40000000;
  v37[2] = ___dd_mbr_check_membership_ext_block_invoke_4;
  v37[3] = &unk_1E2E57098;
  v37[4] = &v43;
  v37[5] = v41;
  v37[6] = &v57;
  v37[7] = a6;
  v62 = v7;
  v63 = 0;
  v61 = 1;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2000000000;
  v56 = 0;
  v47 = MEMORY[0x1E0C87450];
  v48 = 0x40000000;
  v49 = ___dd_foreach_record_with_name_block_invoke;
  v50 = &unk_1E2E56FA8;
  v51 = v37;
  v52 = &v53;
  v22 = DarwinDirectoryRecordStoreApplyWithFilter();
  if (*((_BYTE *)v54 + 24))
    goto LABEL_35;
  multiuser_flags[0] = 0;
  v23 = MEMORY[0x194021814](v22);
  if (host_get_multiuser_config_flags(v23, multiuser_flags))
  {
    mbr_identifier_translate_cold_2();
    goto LABEL_48;
  }
  if ((multiuser_flags[0] & 0x80000000) == 0 || strcmp((const char *)v7, "mobile"))
    goto LABEL_35;
  LODWORD(v61) = 0;
  multiuser_flags[0] = 0;
  v24 = MEMORY[0x194021814]();
  if (!host_get_multiuser_config_flags(v24, multiuser_flags))
  {
    LODWORD(v62) = multiuser_flags[0] & 0x3FFFFFFF;
    *(_QWORD *)multiuser_flags = v21;
    v65 = 0x40000000;
    v66 = ___dd_foreach_record_with_name_block_invoke_2;
    v67 = &unk_1E2E56FD0;
    v25 = v37;
LABEL_51:
    v68 = v25;
    DarwinDirectoryRecordStoreApplyWithFilter();
    goto LABEL_35;
  }
LABEL_55:
  v34 = mbr_identifier_translate_cold_2();
  return mbr_check_membership_by_id(v34);
}

uint64_t mbr_check_membership_by_id(const char *a1, int a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7;

  v7 = a2;
  return mbr_check_membership_ext(6, a1, 16, 1, (const unsigned __int8 *)&v7, a6, a3);
}

uint64_t mbr_reset_cache()
{
  return 5;
}

uint64_t mbr_close_connections()
{
  return 5;
}

uint64_t mbr_user_name_to_uuid(void *identifier, uuid_t uu)
{
  return mbr_identifier_to_uuid(4, identifier, 0xFFFFFFFFFFFFFFFFLL, uu);
}

uint64_t mbr_group_name_to_uuid(void *identifier, uuid_t uu)
{
  return mbr_identifier_to_uuid(5, identifier, 0xFFFFFFFFFFFFFFFFLL, uu);
}

int mbr_check_service_membership(const uuid_t user, const char *servicename, int *ismember)
{
  int result;
  char __str[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (!_os_feature_enabled_simple_impl())
    return 5;
  snprintf(__str, 0x400uLL, "com.apple.access_%s", servicename);
  result = _dd_mbr_check_membership_ext(6, (const char *)user, 16, 5, (const unsigned __int8 *)__str, ismember);
  if (result >= 3)
    return 22;
  return result;
}

int mbr_sid_to_string(const nt_sid_t *sid, char *string)
{
  return 5;
}

int mbr_string_to_sid(const char *string, nt_sid_t *sid)
{
  return 5;
}

uint64_t mbr_uuid_to_string(const unsigned __int8 *a1, char *a2)
{
  uuid_unparse_upper(a1, a2);
  return 0;
}

uint64_t mbr_set_identifier_ttl()
{
  return 5;
}

char *___dd_mbr_identifier_translate_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = _dd_extract_result(*(_DWORD *)(a1 + 56), a2);
  **(_QWORD **)(a1 + 48) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a3 = 1;
  return result;
}

char *_dd_extract_result(unsigned int a1, uint64_t a2)
{
  unsigned __int8 *v3;
  unsigned __int8 *v5;
  unsigned __int8 *v6;

  if ((a1 & 0xFFFFFFFB) == 1)
  {
    if (*(_BYTE *)a2 != 1)
      return 0;
  }
  else if ((a1 & 0xFFFFFFFB) == 0 && *(_BYTE *)a2)
  {
    return 0;
  }
  v3 = 0;
  if (a1 > 0x1F)
    return (char *)v3;
  if (((1 << a1) & 0x40000003) != 0)
  {
    v5 = (unsigned __int8 *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
    if (v5)
    {
      v3 = v5;
      *(_DWORD *)v5 = *(_DWORD *)(a2 + 4);
      return (char *)v3;
    }
    _dd_extract_result_cold_1();
  }
  else
  {
    if (((1 << a1) & 0x80000030) != 0)
      return strdup(*(const char **)(a2 + 8));
    if (a1 != 6)
      return (char *)v3;
    v6 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    if (v6)
    {
      v3 = v6;
      uuid_copy(v6, (const unsigned __int8 *)(a2 + 16));
      return (char *)v3;
    }
  }
  _dd_extract_result_cold_2();
  return (char *)___dd_mbr_identifier_translate_block_invoke_2();
}

char *___dd_mbr_identifier_translate_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = _dd_extract_result(*(_DWORD *)(a1 + 56), a2);
  **(_QWORD **)(a1 + 48) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a3 = 1;
  return result;
}

char *___dd_mbr_identifier_translate_block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = _dd_extract_result(*(_DWORD *)(a1 + 56), a2);
  **(_QWORD **)(a1 + 48) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a3 = 1;
  return result;
}

char *___dd_mbr_identifier_translate_block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = _dd_extract_result(*(_DWORD *)(a1 + 56), a2);
  **(_QWORD **)(a1 + 48) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a3 = 1;
  return result;
}

char *___dd_mbr_identifier_translate_block_invoke_5(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = _dd_extract_result(*(_DWORD *)(a1 + 56), a2);
  **(_QWORD **)(a1 + 48) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a3 = 1;
  return result;
}

char *___dd_mbr_identifier_translate_block_invoke_6(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = _dd_extract_result(*(_DWORD *)(a1 + 56), a2);
  **(_QWORD **)(a1 + 48) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a3 = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_id_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_id_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___dd_foreach_record_with_name_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_name_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___dd_foreach_record_with_uuid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

char *___dd_mbr_check_membership_ext_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = strdup(*(const char **)(a2 + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(a2 + 40);
  *a3 = 1;
  return result;
}

char *___dd_mbr_check_membership_ext_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = strdup(*(const char **)(a2 + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(a2 + 40);
  *a3 = 1;
  return result;
}

char *___dd_mbr_check_membership_ext_block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char *result;

  result = strdup(*(const char **)(a2 + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(a2 + 40);
  *a3 = 1;
  return result;
}

uint64_t ___dd_mbr_check_membership_ext_block_invoke_4(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  int v5;
  uint64_t *v6;
  const char *v7;
  uint64_t *v8;
  uint64_t v9;

  v4 = result;
  v5 = 1;
  if (*(_DWORD *)(a2 + 4) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v6 = *(uint64_t **)(a2 + 40);
    result = *v6;
    if (*v6)
    {
      v7 = *(const char **)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24);
      v8 = v6 + 1;
      while (1)
      {
        result = strcmp((const char *)result, v7);
        if (!(_DWORD)result)
          break;
        v9 = *v8++;
        result = v9;
        if (!v9)
          goto LABEL_6;
      }
      v5 = 1;
    }
    else
    {
LABEL_6:
      v5 = 0;
    }
  }
  **(_DWORD **)(v4 + 56) = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

uint64_t ___dd_mbr_check_membership_ext_block_invoke_5(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  int v5;
  uint64_t *v6;
  const char *v7;
  uint64_t *v8;
  uint64_t v9;

  v4 = result;
  v5 = 1;
  if (*(_DWORD *)(a2 + 4) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v6 = *(uint64_t **)(a2 + 40);
    result = *v6;
    if (*v6)
    {
      v7 = *(const char **)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24);
      v8 = v6 + 1;
      while (1)
      {
        result = strcmp((const char *)result, v7);
        if (!(_DWORD)result)
          break;
        v9 = *v8++;
        result = v9;
        if (!v9)
          goto LABEL_6;
      }
      v5 = 1;
    }
    else
    {
LABEL_6:
      v5 = 0;
    }
  }
  **(_DWORD **)(v4 + 56) = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

uint64_t ___dd_mbr_check_membership_ext_block_invoke_6(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  int v5;
  uint64_t *v6;
  const char *v7;
  uint64_t *v8;
  uint64_t v9;

  v4 = result;
  v5 = 1;
  if (*(_DWORD *)(a2 + 4) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v6 = *(uint64_t **)(a2 + 40);
    result = *v6;
    if (*v6)
    {
      v7 = *(const char **)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24);
      v8 = v6 + 1;
      while (1)
      {
        result = strcmp((const char *)result, v7);
        if (!(_DWORD)result)
          break;
        v9 = *v8++;
        result = v9;
        if (!v9)
          goto LABEL_6;
      }
      v5 = 1;
    }
    else
    {
LABEL_6:
      v5 = 0;
    }
  }
  **(_DWORD **)(v4 + 56) = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return abort_with_reason();
}

int getdomainname(char *a1, int a2)
{
  size_t v3;
  int v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v3 = a2;
  *(_QWORD *)v4 = 0x1600000001;
  return sysctl(v4, 2u, a1, &v3, 0, 0);
}

int setdomainname(const char *a1, int a2)
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C874D8];
  v3[0] = 0x1600000001;
  return sysctl((int *)v3, 2u, 0, 0, (void *)a1, a2);
}

int xdr_domainname(XDR *a1, domainname *a2)
{
  return xdr_string(a1, a2, 0x40u);
}

int xdr_keydat(XDR *a1, keydat *a2)
{
  return xdr_bytes(a1, &a2->keydat_val, &a2->keydat_len, 0x400u);
}

int xdr_mapname(XDR *a1, mapname *a2)
{
  return xdr_string(a1, a2, 0x40u);
}

int xdr_peername(XDR *a1, peername *a2)
{
  return xdr_string(a1, a2, 0x40u);
}

int xdr_valdat(XDR *a1, valdat *a2)
{
  return xdr_bytes(a1, &a2->valdat_val, &a2->valdat_len, 0x400u);
}

int xdr_ypbind_binding(XDR *a1, ypbind_binding *a2)
{
  int result;

  result = xdr_opaque(a1, a2->ypbind_binding_addr, 4u);
  if (result)
    return xdr_opaque(a1, a2->ypbind_binding_port, 2u);
  return result;
}

int xdr_ypbind_resp(XDR *a1, ypbind_resp *a2)
{
  if (!xdr_ypbind_resptype(a1, &a2->ypbind_status))
    return 0;
  if (a2->ypbind_status != YPBIND_SUCC_VAL)
  {
    if (a2->ypbind_status == YPBIND_FAIL_VAL)
      return xdr_u_int(a1, (unsigned int *)&a2->ypbind_resp_u);
    return 0;
  }
  return xdr_ypbind_binding(a1, (ypbind_binding *)&a2->ypbind_resp_u);
}

int xdr_ypbind_setdom(XDR *a1, ypbind_setdom *a2)
{
  if (xdr_domainname(a1, &a2->ypsetdom_domain) && xdr_ypbind_binding(a1, &a2->ypsetdom_binding))
    return xdr_u_int(a1, &a2->ypsetdom_vers);
  else
    return 0;
}

int xdr_ypmaplist(XDR *a1, ypmaplist *a2)
{
  int result;

  result = xdr_mapname(a1, &a2->map);
  if (result)
    return xdr_pointer(a1, (char **)&a2->next, 0x10u, (xdrproc_t)xdr_ypmaplist);
  return result;
}

int xdr_ypreq_key(XDR *a1, ypreq_key *a2)
{
  if (xdr_domainname(a1, &a2->domain) && xdr_mapname(a1, &a2->map))
    return xdr_keydat(a1, &a2->key);
  else
    return 0;
}

int xdr_ypreq_nokey(XDR *a1, ypreq_nokey *a2)
{
  int result;

  result = xdr_domainname(a1, &a2->domain);
  if (result)
    return xdr_mapname(a1, &a2->map);
  return result;
}

int xdr_ypresp_all(XDR *a1, ypresp_all *a2)
{
  int result;

  result = xdr_BOOL(a1, &a2->more);
  if (result)
  {
    if (a2->more)
    {
      if (a2->more == 1)
        return xdr_ypresp_key_val(a1, &a2->ypresp_all_u.val);
      else
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

int xdr_ypresp_key_val(XDR *a1, ypresp_key_val *a2)
{
  if (xdr_ypstat(a1, &a2->stat) && xdr_valdat(a1, &a2->val))
    return xdr_keydat(a1, &a2->key);
  else
    return 0;
}

int xdr_ypresp_maplist(XDR *a1, ypresp_maplist *a2)
{
  int result;

  result = xdr_ypstat(a1, &a2->stat);
  if (result)
    return xdr_pointer(a1, (char **)&a2->maps, 0x10u, (xdrproc_t)xdr_ypmaplist);
  return result;
}

int xdr_ypresp_master(XDR *a1, ypresp_master *a2)
{
  int result;

  result = xdr_ypstat(a1, &a2->stat);
  if (result)
    return xdr_peername(a1, &a2->peer);
  return result;
}

int xdr_ypresp_order(XDR *a1, ypresp_order *a2)
{
  int result;

  result = xdr_ypstat(a1, (ypstat *)a2);
  if (result)
    return xdr_u_int(a1, &a2->ordernum);
  return result;
}

int xdr_ypresp_val(XDR *a1, ypresp_val *a2)
{
  int result;

  result = xdr_ypstat(a1, &a2->stat);
  if (result)
    return xdr_valdat(a1, &a2->val);
  return result;
}

uint64_t xdr_ypresp_all_seq(XDR *a1, _QWORD *a2)
{
  uint64_t stat;
  size_t keydat_len;
  _BYTE *v6;
  _BYTE *v7;
  size_t valdat_len;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  ypresp_all v14;

  memset(&v14, 0, sizeof(v14));
  while (1)
  {
    if (!xdr_ypresp_all(a1, &v14))
    {
      xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
      v11 = 0;
      *a2 = -6;
      return v11;
    }
    if (!v14.more)
    {
      xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
      return 0;
    }
    stat = v14.ypresp_all_u.val.stat;
    if (v14.ypresp_all_u.val.stat != YP_TRUE)
      break;
    keydat_len = (int)v14.ypresp_all_u.val.key.keydat_len;
    v6 = malloc_type_malloc((int)v14.ypresp_all_u.val.key.keydat_len + 1, 0x33F0C99DuLL);
    v7 = v6;
    if (v6)
    {
      memcpy(v6, v14.ypresp_all_u.val.key.keydat_val, keydat_len);
      v7[keydat_len] = 0;
    }
    valdat_len = (int)v14.ypresp_all_u.val.val.valdat_len;
    v9 = malloc_type_malloc((int)v14.ypresp_all_u.val.val.valdat_len + 1, 0x7921E901uLL);
    v10 = v9;
    if (!v9)
    {
      free(v7);
      xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
LABEL_16:
      free(v10);
      return 0;
    }
    memcpy(v9, v14.ypresp_all_u.val.val.valdat_val, valdat_len);
    *((_BYTE *)v10 + valdat_len) = 0;
    xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
    if (!v7)
      goto LABEL_16;
    v11 = 1;
    v12 = ypresp_allfn(1, v7, v14.ypresp_all_u.val.key.keydat_len, v10, v14.ypresp_all_u.val.val.valdat_len, ypresp_data);
    *a2 = 1;
    free(v7);
    free(v10);
    if (v12)
      return v11;
  }
  if (v14.ypresp_all_u.val.stat == YP_NOMORE)
  {
    xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
  }
  else
  {
    xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
    *a2 = stat;
  }
  return 1;
}

int yp_all(const char *a1, const char *a2, ypall_callback *a3)
{
  size_t v6;
  int v7;
  size_t v8;
  CLIENT *v10;
  CLIENT *v11;
  char *data;
  int v13;
  unsigned int v14[2];
  dom_binding *v15;
  const char *v16;
  const char *v17;
  sockaddr_in v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  if (!a1 || !*a1)
    return 1;
  v6 = strlen(a1);
  v7 = 1;
  if (a2)
  {
    if (v6 <= 0x40)
    {
      if (*a2)
      {
        v8 = strlen(a2);
        if (a3)
        {
          if (v8 <= 0x40)
          {
            v16 = 0;
            v17 = 0;
            *(_QWORD *)v14 = 0;
            v15 = 0;
            if (_yp_dobind(a1, &v15))
            {
              return 3;
            }
            else
            {
              v13 = -1;
              v18 = *(sockaddr_in *)((char *)v15 + 76);
              v18.sin_port = 0;
              v10 = clnttcp_create(&v18, 0x186A4u, 2u, &v13, 0, 0);
              if (v10)
              {
                v11 = v10;
                v16 = a1;
                v17 = a2;
                data = a3->data;
                ypresp_allfn = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a3->foreach;
                ypresp_data = (uint64_t)data;
                ((void (*)(void))v10->cl_ops->cl_call)();
                ((void (*)(CLIENT *))v11->cl_ops->cl_destroy)(v11);
                if (*(_QWORD *)v14)
                  v7 = ypprot_err(v14[0]);
                else
                  v7 = 0;
              }
              else
              {
                puts("clnttcp_create failed");
                v7 = 9;
              }
              _yp_unbind((uint64_t)v15);
            }
          }
        }
      }
    }
  }
  return v7;
}

int _yp_dobind(const char *a1, dom_binding **a2)
{
  int v4;
  pid_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t *v11;
  int result;
  uint64_t *v13;
  pthread_t v14;
  int v15;
  uint64_t v16;
  CLIENT *v18;
  CLIENT *v19;
  __int16 v20;
  int v21;
  uint64_t v22;
  CLIENT *v23;
  char *v24;
  CLIENT *v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t state64;
  int token;
  int v31;
  uint64_t v32;
  int v33;
  char *__src;
  sockaddr_in v35;
  uint64_t v36;
  timeval v37;

  v36 = *MEMORY[0x1E0C874D8];
  __src = (char *)a1;
  v4 = open_NOCANCEL();
  if (v4 == -1)
    return 10;
  if (flock(v4, 6) != -1
    || (v33 = 0,
        v32 = 0,
        *(_QWORD *)&v35.sin_len = 0,
        *(_QWORD *)v35.sin_zero = 0,
        v31 = 0,
        state64 = 0,
        *__error() != 35))
  {
    close_NOCANCEL();
    return 10;
  }
  close_NOCANCEL();
  v5 = getpid();
  v6 = v5;
  if (_yp_dobind_pid != -1 && _yp_dobind_pid != v5)
  {
    v7 = (_QWORD *)_ypbindlist;
    if (_ypbindlist)
    {
      do
      {
        v8 = v7[13];
        if (v8)
          (*(void (**)(void))(*(_QWORD *)(v8 + 8) + 32))();
        v9 = (_QWORD *)*v7;
        free(v7);
        v7 = v9;
      }
      while (v9);
    }
    _ypbindlist = 0;
  }
  _yp_dobind_pid = v6;
  if (a2)
    *a2 = 0;
  if (!a1 || !*a1)
    return 1;
  v10 = &_ypbindlist;
  while (1)
  {
    v10 = (uint64_t *)*v10;
    if (!v10)
      break;
    if (!strcmp(a1, (const char *)v10 + 8))
    {
      v11 = v10;
      goto LABEL_25;
    }
  }
  v13 = (uint64_t *)malloc_type_calloc(1uLL, 0x80uLL, 0x1020040C3F770D4uLL);
  if (!v13)
    return 6;
  v11 = v13;
  *((_DWORD *)v13 + 24) = -1;
  v13[15] = 0;
LABEL_25:
  v28 = 0;
  token = -1;
  v14 = pthread_self();
  asprintf(&v28, "self.thread.%lu", v14);
  if (v28)
  {
    notify_register_plain();
    free(v28);
  }
  v15 = 0;
  while (1)
  {
    if (token != -1)
    {
      state64 = 0;
      notify_get_state(token, &state64);
      if (state64 == 4)
      {
        if (!v10)
          free(v11);
        v27 = token;
        goto LABEL_70;
      }
    }
    v16 = v11[15];
    if ((unint64_t)(v16 + 1) >= 2 && v16 != -2)
      break;
    *(_QWORD *)v35.sin_zero = 0;
    *(_DWORD *)&v35.sin_len = 528;
    v35.sin_addr.s_addr = 16777343;
    v31 = -1;
    v18 = clnttcp_create(&v35, 0x186A7u, 2u, &v31, 0, 0);
    if (!v18)
    {
      clnt_pcreateerror("clnttcp_create");
      goto LABEL_62;
    }
    v19 = v18;
    if ((v35.sin_port & 0xFC) != 0 || v35.sin_port == 5120)
    {
      ((void (*)(CLIENT *))v18->cl_ops->cl_destroy)(v18);
LABEL_62:
      if (!v10)
        free(v11);
      v27 = token;
      if (token == -1)
        return 10;
LABEL_70:
      notify_cancel(v27);
      return 10;
    }
    if (!((unint64_t (*)(CLIENT *, uint64_t, int (__cdecl *)(XDR *, domainname *), char **, int (__cdecl *)(XDR *, ypbind_resp *), uint64_t *, _QWORD, _QWORD))v18->cl_ops->cl_call)(v18, 1, xdr_domainname, &__src, xdr_ypbind_resp, &v32, _yplib_timeout, 0))
    {
      ((void (*)(CLIENT *))v19->cl_ops->cl_destroy)(v19);
      if ((v33 & 0xFC) != 0 || (unsigned __int16)v33 == 5120)
        goto LABEL_62;
      *(uint64_t *)((char *)v11 + 76) = 0;
      *(uint64_t *)((char *)v11 + 84) = 0;
      *((_WORD *)v11 + 38) = 528;
      v20 = v33;
      *((_WORD *)v11 + 39) = v33;
      *((_DWORD *)v11 + 20) = HIDWORD(v32);
      *((_WORD *)v11 + 46) = v20;
      v11[15] = 2;
      strncpy((char *)v11 + 8, __src, 0x40uLL);
      *((_BYTE *)v11 + 72) = 0;
      break;
    }
    if (v10 || v15)
      fprintf((FILE *)*MEMORY[0x1E0C874E0], "YP server for domain %s not responding, still trying\n", __src);
    ++v15;
    ((void (*)(CLIENT *))v19->cl_ops->cl_destroy)(v19);
LABEL_57:
    v26 = -2;
    if (v16 != -2)
      v26 = -1;
    v11[15] = v26;
  }
  if (_yplib_timeout >= 0)
    v21 = _yplib_timeout;
  else
    v21 = _yplib_timeout + 1;
  v22 = v11[13];
  if (v22)
    (*(void (**)(void))(*(_QWORD *)(v22 + 8) + 32))();
  *((_DWORD *)v11 + 24) = -1;
  if (v16 == -2)
  {
    v23 = clnttcp_create((sockaddr_in *)((char *)v11 + 76), 0x186A4u, 2u, (int *)v11 + 24, 0, 0);
    v11[13] = (uint64_t)v23;
    if (v23)
      goto LABEL_71;
    v24 = "clnttcp_create";
    goto LABEL_56;
  }
  v37.tv_sec = (uint64_t)v21 >> 1;
  *(_QWORD *)&v37.tv_usec = 0;
  v25 = clntudp_create((sockaddr_in *)((char *)v11 + 76), 0x186A4u, 2u, v37, (int *)v11 + 24);
  v11[13] = (uint64_t)v25;
  if (!v25)
  {
    v24 = "clntudp_create";
LABEL_56:
    clnt_pcreateerror(v24);
    goto LABEL_57;
  }
LABEL_71:
  if (token != -1)
    notify_cancel(token);
  if (fcntl_NOCANCEL() == -1)
  {
    perror("fcntl: F_SETFD");
    if (!v10)
    {
LABEL_75:
      *v11 = _ypbindlist;
      _ypbindlist = (uint64_t)v11;
    }
  }
  else if (!v10)
  {
    goto LABEL_75;
  }
  result = 0;
  if (a2)
    *a2 = (dom_binding *)v11;
  return result;
}

uint64_t _yp_unbind(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 104);
  if (result)
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 32))();
  *(_QWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 96) = -1;
  return result;
}

int yp_bind(const char *a1)
{
  return _yp_dobind(a1, 0);
}

void yp_unbind(const char *a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t *v7;

  v2 = 0;
  v3 = &_ypbindlist;
  while (1)
  {
    v3 = (uint64_t *)*v3;
    if (!v3)
      break;
    v4 = v2;
    v5 = strcmp(a1, (const char *)v3 + 8);
    v2 = v3;
    if (!v5)
    {
      v6 = v3[13];
      if (v6)
        (*(void (**)(void))(*(_QWORD *)(v6 + 8) + 32))();
      if (v4)
        v7 = v4;
      else
        v7 = &_ypbindlist;
      *v7 = *v3;
      free(v3);
      return;
    }
  }
}

int yp_first(const char *a1, const char *a2, char **a3, int *a4, char **a5, int *a6)
{
  size_t v12;
  int v13;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  dom_binding *v21[3];
  unsigned int v22[4];
  void *__src[2];
  void *v24;

  if (!a1 || !*a1)
    return 1;
  v12 = strlen(a1);
  v13 = 1;
  if (a2 && v12 <= 0x40 && *a2 && strlen(a2) <= 0x40)
  {
    v21[0] = 0;
    *a5 = 0;
    *a3 = 0;
    *a6 = 0;
    *a4 = 0;
    if (_yp_dobind(a1, v21))
    {
      return 3;
    }
    else
    {
      v15 = 0;
      v13 = 3;
      while (1)
      {
        v21[1] = (dom_binding *)a1;
        v21[2] = (dom_binding *)a2;
        *(_OWORD *)v22 = 0u;
        *(_OWORD *)__src = 0u;
        v24 = 0;
        if (!(**(unsigned int (***)(void))(*((_QWORD *)v21[0] + 13) + 8))())
          break;
        if (v15)
          clnt_perror(*((CLIENT **)v21[0] + 13), "yp_first: clnt_call");
        if (yp_first_proto)
          v16 = -1;
        else
          v16 = -2;
        yp_first_proto ^= 1u;
        *((_QWORD *)v21[0] + 15) = v16;
        --v15;
        if (_yp_dobind(a1, v21))
          return v13;
      }
      v13 = ypprot_err(v22[0]);
      if (!v13)
      {
        v17 = (int)v22[2];
        *a4 = v22[2];
        v18 = (char *)malloc_type_malloc(v17 + 1, 0x84039E87uLL);
        *a3 = v18;
        if (v18)
        {
          memcpy(v18, __src[0], *a4);
          v13 = 0;
          (*a3)[*a4] = 0;
        }
        else
        {
          v13 = 7;
        }
        v19 = SLODWORD(__src[1]);
        *a6 = (int)__src[1];
        v20 = (char *)malloc_type_malloc(v19 + 1, 0xA6B2FB57uLL);
        *a5 = v20;
        if (v20)
        {
          memcpy(v20, v24, *a6);
          (*a5)[*a6] = 0;
        }
        else
        {
          v13 = 7;
        }
      }
      xdr_free((xdrproc_t)xdr_ypresp_key_val, v22);
      _yp_unbind((uint64_t)v21[0]);
    }
  }
  return v13;
}

int yp_get_default_domain(char **a1)
{
  int result;

  *a1 = 0;
  if (!_yp_domain && getdomainname(&_yp_domain, 256) < 0)
    return 12;
  result = 0;
  *a1 = &_yp_domain;
  return result;
}

int yp_maplist(const char *a1, ypmaplist **a2)
{
  int v3;
  uint64_t v4;
  const char *v5;
  dom_binding *v7;
  dom_binding *v8;
  const char *v9;

  v8 = 0;
  v9 = a1;
  if (_yp_dobind(a1, &v8))
    return 3;
  v3 = 0;
  while ((**(unsigned int (***)(void))(*((_QWORD *)v8 + 13) + 8))())
  {
    if (v3)
      clnt_perror(*((CLIENT **)v8 + 13), "yp_maplist: clnt_call");
    if (yp_maplist_proto)
      v4 = -1;
    else
      v4 = -2;
    yp_maplist_proto ^= 1u;
    v5 = v9;
    *((_QWORD *)v8 + 15) = v4;
    --v3;
    if (_yp_dobind(v5, &v8))
      return 3;
  }
  v7 = v8;
  *a2 = 0;
  _yp_unbind((uint64_t)v7);
  return ypprot_err(0);
}

int yp_master(const char *a1, const char *a2, char **a3)
{
  size_t v6;
  int v7;
  size_t v8;
  int v10;
  uint64_t v11;
  char *v12;
  unsigned int v13[2];
  char *__s1;
  dom_binding *v15;

  if (!a1 || !*a1)
    return 1;
  v6 = strlen(a1);
  v7 = 1;
  if (a2)
  {
    if (v6 <= 0x40)
    {
      if (*a2)
      {
        v8 = strlen(a2);
        if (a3)
        {
          if (v8 <= 0x40)
          {
            v15 = 0;
            if (_yp_dobind(a1, &v15))
            {
              return 3;
            }
            else
            {
              v10 = 0;
              v7 = 3;
              while (1)
              {
                *(_QWORD *)v13 = 0;
                __s1 = 0;
                if (!(**(unsigned int (***)(void))(*((_QWORD *)v15 + 13) + 8))())
                  break;
                if (v10)
                  clnt_perror(*((CLIENT **)v15 + 13), "yp_master: clnt_call");
                if (yp_master_proto)
                  v11 = -1;
                else
                  v11 = -2;
                yp_master_proto ^= 1u;
                *((_QWORD *)v15 + 15) = v11;
                --v10;
                if (_yp_dobind(a1, &v15))
                  return v7;
              }
              v7 = ypprot_err(v13[0]);
              if (!v7)
              {
                v12 = strdup(__s1);
                *a3 = v12;
                if (v12)
                  v7 = 0;
                else
                  v7 = 7;
              }
              xdr_free((xdrproc_t)xdr_ypresp_master, v13);
              _yp_unbind((uint64_t)v15);
            }
          }
        }
      }
    }
  }
  return v7;
}

int yp_order(const char *a1, const char *a2, int *a3)
{
  size_t v6;
  int v7;
  size_t v8;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13[2];
  dom_binding *v14;

  if (!a1 || !*a1)
    return 1;
  v6 = strlen(a1);
  v7 = 1;
  if (a2)
  {
    if (v6 <= 0x40)
    {
      if (*a2)
      {
        v8 = strlen(a2);
        if (a3)
        {
          if (v8 <= 0x40)
          {
            v14 = 0;
            if (_yp_dobind(a1, &v14))
            {
              return 3;
            }
            else
            {
              v10 = 0;
              v7 = 3;
              while (1)
              {
                *(_QWORD *)v13 = 0;
                v11 = (**(uint64_t (***)(_QWORD, uint64_t))(*((_QWORD *)v14 + 13) + 8))(*((_QWORD *)v14 + 13), 10);
                if (!v11)
                {
                  *a3 = v13[1];
                  xdr_free((xdrproc_t)xdr_ypresp_order, v13);
                  v7 = ypprot_err(v13[0]);
                  goto LABEL_24;
                }
                if (v11 == 10)
                  break;
                if (v10)
                  clnt_perror(*((CLIENT **)v14 + 13), "yp_order: clnt_call");
                if (yp_order_proto)
                  v12 = -1;
                else
                  v12 = -2;
                yp_order_proto ^= 1u;
                *((_QWORD *)v14 + 15) = v12;
                --v10;
                if (_yp_dobind(a1, &v14))
                  return v7;
              }
              v7 = 6;
LABEL_24:
              _yp_unbind((uint64_t)v14);
            }
          }
        }
      }
    }
  }
  return v7;
}

char *__cdecl yperr_string(int a1)
{
  char *v1;

  if (a1 < 0x11)
    return off_1E2E57108[a1];
  v1 = yperr_string_err;
  snprintf(yperr_string_err, 0x50uLL, "YP unknown error %d\n", a1);
  return v1;
}

int yp_match(const char *a1, const char *a2, const char *a3, int a4, char **a5, int *a6)
{
  size_t v12;
  int v13;
  size_t v14;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v20[2];
  uint64_t v21;
  const char *v22;
  unsigned int v23[2];
  uint64_t v24;
  void *__src;
  dom_binding *v26;

  if (!a1 || !*a1)
    return 1;
  v12 = strlen(a1);
  v13 = 1;
  if (a2)
  {
    if (v12 <= 0x40)
    {
      if (*a2)
      {
        v14 = strlen(a2);
        if (a4)
        {
          if (a3 && v14 <= 0x40)
          {
            v26 = 0;
            v21 = 0;
            *a5 = 0;
            *a6 = 0;
            if (_yp_dobind(a1, &v26))
            {
              return 3;
            }
            else
            {
              v16 = 0;
              v13 = 3;
              while (1)
              {
                v20[0] = a1;
                v20[1] = a2;
                v22 = a3;
                *(_QWORD *)v23 = 0;
                LODWORD(v21) = a4;
                v24 = 0;
                __src = 0;
                if (!(**(unsigned int (***)(_QWORD, uint64_t, int (__cdecl *)(XDR *, ypreq_key *), _QWORD *))(*((_QWORD *)v26 + 13) + 8))(*((_QWORD *)v26 + 13), 3, xdr_ypreq_key, v20))break;
                if (v16)
                  clnt_perror(*((CLIENT **)v26 + 13), "yp_match: clnt_call");
                v17 = -2;
                if (yp_match_proto)
                  v17 = -1;
                yp_match_proto ^= 1u;
                *((_QWORD *)v26 + 15) = v17;
                --v16;
                if (_yp_dobind(a1, &v26))
                  return v13;
              }
              v13 = ypprot_err(v23[0]);
              if (!v13)
              {
                v18 = (int)v24;
                *a6 = v24;
                v19 = (char *)malloc_type_malloc(v18 + 1, 0xBD35BD1FuLL);
                *a5 = v19;
                if (v19)
                {
                  memcpy(v19, __src, *a6);
                  v13 = 0;
                  (*a5)[*a6] = 0;
                }
                else
                {
                  v13 = 6;
                }
              }
              xdr_free((xdrproc_t)xdr_ypresp_val, v23);
              _yp_unbind((uint64_t)v26);
            }
          }
        }
      }
    }
  }
  return v13;
}

int yp_next(const char *a1, const char *a2, const char *a3, int a4, char **a5, int *a6, char **a7, int *a8)
{
  size_t v16;
  int v17;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  dom_binding *v25[3];
  uint64_t v26;
  const char *v27;
  unsigned int v28[4];
  void *__src[2];
  void *v30;

  if (!a1 || !*a1)
    return 1;
  v16 = strlen(a1);
  v17 = 1;
  if (a2 && v16 <= 0x40 && *a2 && strlen(a2) <= 0x40)
  {
    v26 = 0;
    v25[0] = 0;
    *a7 = 0;
    *a5 = 0;
    *a8 = 0;
    *a6 = 0;
    if (_yp_dobind(a1, v25))
    {
      return 3;
    }
    else
    {
      v19 = 0;
      v17 = 3;
      while (1)
      {
        v25[1] = (dom_binding *)a1;
        v25[2] = (dom_binding *)a2;
        v27 = a3;
        LODWORD(v26) = a4;
        *(_OWORD *)v28 = 0u;
        *(_OWORD *)__src = 0u;
        v30 = 0;
        if (!(**(unsigned int (***)(void))(*((_QWORD *)v25[0] + 13) + 8))())
          break;
        if (v19)
          clnt_perror(*((CLIENT **)v25[0] + 13), "yp_next: clnt_call");
        v20 = -2;
        if (yp_next_proto)
          v20 = -1;
        yp_next_proto ^= 1u;
        *((_QWORD *)v25[0] + 15) = v20;
        --v19;
        if (_yp_dobind(a1, v25))
          return v17;
      }
      v17 = ypprot_err(v28[0]);
      if (!v17)
      {
        v21 = (int)v28[2];
        *a6 = v28[2];
        v22 = (char *)malloc_type_malloc(v21 + 1, 0x257186C2uLL);
        *a5 = v22;
        if (v22)
        {
          memcpy(v22, __src[0], *a6);
          v17 = 0;
          (*a5)[*a6] = 0;
        }
        else
        {
          v17 = 7;
        }
        v23 = SLODWORD(__src[1]);
        *a8 = (int)__src[1];
        v24 = (char *)malloc_type_malloc(v23 + 1, 0xD74BD26uLL);
        *a7 = v24;
        if (v24)
        {
          memcpy(v24, v30, *a8);
          (*a7)[*a8] = 0;
        }
        else
        {
          v17 = 7;
        }
      }
      xdr_free((xdrproc_t)xdr_ypresp_key_val, v28);
      _yp_unbind((uint64_t)v25[0]);
    }
  }
  return v17;
}

int xdr_x_passwd(XDR *a1, x_passwd *a2)
{
  int result;

  result = xdr_string(a1, &a2->pw_name, 0xFFFFFFFF);
  if (result)
  {
    result = xdr_string(a1, &a2->pw_passwd, 0xFFFFFFFF);
    if (result)
    {
      result = xdr_int(a1, &a2->pw_uid);
      if (result)
      {
        result = xdr_int(a1, &a2->pw_gid);
        if (result)
        {
          result = xdr_string(a1, &a2->pw_gecos, 0xFFFFFFFF);
          if (result)
          {
            result = xdr_string(a1, &a2->pw_dir, 0xFFFFFFFF);
            if (result)
              return xdr_string(a1, &a2->pw_shell, 0xFFFFFFFF) != 0;
          }
        }
      }
    }
  }
  return result;
}

int xdr_yppasswd(XDR *a1, yppasswd *a2)
{
  int result;

  result = xdr_string(a1, &a2->oldpass, 0xFFFFFFFF);
  if (result)
    return xdr_x_passwd(a1, &a2->newpw);
  return result;
}

int ypprot_err(unsigned int a1)
{
  if (a1 + 8 > 0xA)
    return 6;
  else
    return dword_191FAB9C0[a1 + 8];
}

AUTH *authnone_create(void)
{
  uint64_t v0;
  void *v1;
  __int128 v2;
  uint64_t v3;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  XDR v6;

  v0 = authnone_private;
  if (!authnone_private)
  {
    v1 = malloc_type_calloc(1uLL, 0x60uLL, 0x103004071B1A283uLL);
    v0 = (uint64_t)v1;
    if (!v1)
      return (AUTH *)v0;
    authnone_private = (uint64_t)v1;
  }
  if (!*(_DWORD *)(v0 + 92))
  {
    memset(&v6, 0, sizeof(v6));
    v2 = *(_OWORD *)&_null_auth.oa_flavor;
    *(_OWORD *)(v0 + 24) = *(_OWORD *)&_null_auth.oa_flavor;
    v3 = *(_QWORD *)&_null_auth.oa_length;
    *(_QWORD *)(v0 + 40) = *(_QWORD *)&_null_auth.oa_length;
    *(_OWORD *)v0 = v2;
    *(_QWORD *)(v0 + 16) = v3;
    *(_QWORD *)(v0 + 56) = ops;
    xdrmem_create(&v6, (char *)(v0 + 72), 0x14u, XDR_ENCODE);
    xdr_opaque_auth(&v6, v0);
    xdr_opaque_auth(&v6, v0 + 24);
    *(_DWORD *)(v0 + 92) = ((uint64_t (*)(XDR *))v6.x_ops->x_getpostn)(&v6);
    x_destroy = v6.x_ops->x_destroy;
    if (x_destroy)
      ((void (*)(XDR *))x_destroy)(&v6);
  }
  return (AUTH *)v0;
}

uint64_t authnone_marshal(uint64_t a1, uint64_t a2)
{
  if (authnone_private)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a2 + 8) + 24))(a2, authnone_private + 72, *(unsigned int *)(authnone_private + 92));
  else
    return 0;
}

uint64_t authnone_validate()
{
  return 1;
}

uint64_t authnone_refresh()
{
  return 0;
}

AUTH *__cdecl authunix_create(char *a1, int a2, int a3, int a4, int *a5)
{
  char *v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  __int128 v14;
  unsigned int v15;
  size_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  XDR v21;
  timeval v22;
  authunix_parms v23;
  char __src[400];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  v10 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x1030040C13B3F82uLL);
  if (!v10)
  {
    fwrite("authunix_create: out of memory\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
    return (AUTH *)v10;
  }
  v11 = (char *)malloc_type_calloc(1uLL, 0x1C8uLL, 0x1010040138B38ECuLL);
  if (!v11)
  {
    v19 = v10;
LABEL_9:
    free(v19);
    fwrite("authunix_create: out of memory\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
    return 0;
  }
  v12 = v11;
  memset(&v23, 0, 32);
  v22.tv_sec = 0;
  *(_QWORD *)&v22.tv_usec = 0;
  memset(&v21, 0, sizeof(v21));
  *((_QWORD *)v10 + 7) = auth_unix_ops;
  *((_QWORD *)v10 + 8) = v11;
  v13 = *(_QWORD *)&_null_auth.oa_length;
  *((_QWORD *)v11 + 5) = *(_QWORD *)&_null_auth.oa_length;
  v14 = *(_OWORD *)&_null_auth.oa_flavor;
  *(_OWORD *)(v11 + 24) = *(_OWORD *)&_null_auth.oa_flavor;
  *(_OWORD *)(v10 + 24) = v14;
  *((_QWORD *)v10 + 5) = v13;
  *((_DWORD *)v11 + 12) = 0;
  gettimeofday(&v22, 0);
  v23.aup_time = v22.tv_sec;
  v23.aup_machname = a1;
  v23.aup_uid = a2;
  v23.aup_gid = a3;
  v23.aup_len = a4;
  v23.aup_gids = a5;
  xdrmem_create(&v21, __src, 0x190u, XDR_ENCODE);
  if (!xdr_authunix_parms(&v21, &v23))
    abort();
  v15 = ((uint64_t (*)(XDR *))v21.x_ops->x_getpostn)(&v21);
  *((_DWORD *)v12 + 4) = v15;
  *(_DWORD *)v12 = 1;
  v16 = v15;
  v17 = malloc_type_calloc(1uLL, v15, 0x2885E68BuLL);
  v12[1] = v17;
  if (!v17)
  {
    free(v10);
    v19 = v12;
    goto LABEL_9;
  }
  memmove(v17, __src, v16);
  v18 = v12[2];
  *(_OWORD *)v10 = *(_OWORD *)v12;
  *((_QWORD *)v10 + 2) = v18;
  marshal_new_auth((uint64_t)v10);
  return (AUTH *)v10;
}

AUTH *authunix_create_default(void)
{
  uid_t v0;
  gid_t v1;
  int v2;
  int v3;
  gid_t v5[16];
  char v6[256];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (gethostname(v6, 0xFFuLL) == -1 || (v6[255] = 0, v0 = geteuid(), v1 = getegid(), v2 = getgroups(16, v5), v2 < 0))
    abort();
  if (v2 >= maxgrplist)
    v3 = maxgrplist;
  else
    v3 = v2;
  return authunix_create(v6, v0, v1, v3, (int *)v5);
}

uint64_t authunix_marshal(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a2 + 8) + 24))(a2, *(_QWORD *)(a1 + 64) + 52, *(unsigned int *)(*(_QWORD *)(a1 + 64) + 452));
}

uint64_t authunix_validate(uint64_t a1, uint64_t a2)
{
  __int128 *v3;
  void *v4;
  __int128 v5;
  XDR v7;

  if (*(_DWORD *)a2 == 2)
  {
    memset(&v7, 0, sizeof(v7));
    v3 = *(__int128 **)(a1 + 64);
    xdrmem_create(&v7, *(char **)(a2 + 8), *(_DWORD *)(a2 + 16), XDR_DECODE);
    v4 = (void *)*((_QWORD *)v3 + 4);
    if (v4)
    {
      free(v4);
      *((_QWORD *)v3 + 4) = 0;
    }
    if (xdr_opaque_auth(&v7, (uint64_t)v3 + 24))
    {
      v3 = (__int128 *)((char *)v3 + 24);
    }
    else
    {
      v7.x_op = XDR_FREE;
      xdr_opaque_auth(&v7, (uint64_t)v3 + 24);
      *((_QWORD *)v3 + 4) = 0;
    }
    v5 = *v3;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v3 + 2);
    *(_OWORD *)a1 = v5;
    marshal_new_auth(a1);
  }
  return 1;
}

uint64_t authunix_refresh(uint64_t a1)
{
  __int128 *v1;
  char *v2;
  uint64_t v4;
  __int128 v5;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  XDR v8;
  timeval v9;
  authunix_parms v10;

  v1 = *(__int128 **)(a1 + 64);
  memset(&v10, 0, 32);
  memset(&v8, 0, sizeof(v8));
  v2 = (char *)*((_QWORD *)v1 + 1);
  if (*(char **)(a1 + 8) == v2)
    return 0;
  ++*((_DWORD *)v1 + 12);
  v10.aup_machname = 0;
  v10.aup_gids = 0;
  xdrmem_create(&v8, v2, *((_DWORD *)v1 + 4), XDR_DECODE);
  if (xdr_authunix_parms(&v8, &v10))
  {
    v9.tv_sec = 0;
    *(_QWORD *)&v9.tv_usec = 0;
    gettimeofday(&v9, 0);
    v10.aup_time = v9.tv_sec;
    v8.x_op = XDR_ENCODE;
    ((void (*)(XDR *, _QWORD))v8.x_ops->x_setpostn)(&v8, 0);
    v4 = xdr_authunix_parms(&v8, &v10);
    if ((_DWORD)v4)
    {
      v5 = *v1;
      *(_QWORD *)(a1 + 16) = *((_QWORD *)v1 + 2);
      *(_OWORD *)a1 = v5;
      marshal_new_auth(a1);
    }
  }
  else
  {
    v4 = 0;
  }
  v8.x_op = XDR_FREE;
  xdr_authunix_parms(&v8, &v10);
  x_destroy = v8.x_ops->x_destroy;
  if (x_destroy)
    ((void (*)(XDR *))x_destroy)(&v8);
  return v4;
}

void authunix_destroy(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 64);
  free(*(void **)(v2 + 8));
  v3 = *(void **)(v2 + 32);
  if (v3)
    free(v3);
  free(*(void **)(a1 + 64));
  v4 = *(void **)(a1 + 32);
  if (v4)
    free(v4);
  free((void *)a1);
}

void marshal_new_auth(uint64_t a1)
{
  uint64_t v2;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  XDR v4;

  memset(&v4, 0, sizeof(v4));
  v2 = *(_QWORD *)(a1 + 64);
  xdrmem_create(&v4, (char *)(v2 + 52), 0x190u, XDR_ENCODE);
  if (xdr_opaque_auth(&v4, a1) && xdr_opaque_auth(&v4, a1 + 24))
    *(_DWORD *)(v2 + 452) = ((uint64_t (*)(XDR *))v4.x_ops->x_getpostn)(&v4);
  else
    perror("auth_none.c - Fatal marshalling problem");
  x_destroy = v4.x_ops->x_destroy;
  if (x_destroy)
    ((void (*)(XDR *))x_destroy)(&v4);
}

int xdr_authunix_parms(XDR *a1, authunix_parms *a2)
{
  return xdr_u_long(a1, &a2->aup_time)
      && xdr_string(a1, &a2->aup_machname, 0xFFu)
      && xdr_int(a1, &a2->aup_uid)
      && xdr_int(a1, &a2->aup_gid)
      && xdr_array(a1, (char **)&a2->aup_gids, &a2->aup_len, 0x10u, 4u, (xdrproc_t)xdr_int);
}

const char *muser_is_valid(const char **a1, const char ***a2)
{
  const char *result;
  const char **v4;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = *a1;
      if (*a1)
      {
        v4 = *a2;
        if (*a2 && *v4)
          return (const char *)(strcmp(result, *v4) == 0);
        else
          return 0;
      }
    }
  }
  return result;
}

uint64_t _muser_call(const char *a1, void *a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  char v6;
  NSObject *v7;
  int v8;
  int v9;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  v4 = _muser_xpc_pipe(0);
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_string(a2, "procname", a1);
    xpc_dictionary_set_uint64(a2, "version", 1uLL);
    v6 = 0;
    v7 = MEMORY[0x1E0C88E98];
    while (1)
    {
      v8 = xpc_pipe_routine();
      v9 = v8;
      if (v8 != 32 && v8 != 35)
        break;
      if ((v6 & 1) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR))
          _muser_call_cold_1(v9);
        break;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        _muser_call_cold_2(buf, v9, &v12);
      xpc_release(v5);
      v6 = 1;
      v5 = _muser_xpc_pipe(1);
      if (!v5)
        return 0;
    }
    xpc_release(v5);
  }
  return 0;
}

_OWORD *_muser_extract_user(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _QWORD applier[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  _QWORD v17[12];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x6000000000;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 3;
  v17[3] = "";
  v17[4] = "*";
  v17[5] = 0;
  v17[6] = 0;
  v17[7] = "";
  v17[8] = "";
  v17[9] = "/var/empty";
  v17[10] = "/usr/bin/false";
  v17[11] = 0;
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = ___muser_extract_user_block_invoke;
  applier[3] = &unk_1E2E571F8;
  applier[4] = v17;
  applier[5] = &v13;
  xpc_dictionary_apply(xdict, applier);
  v10 = 0;
  if (!*((_DWORD *)v14 + 6))
    v10 = LI_ils_create("L4488ss44LssssL", v3, v4, v5, v6, v7, v8, v9, a1);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  return v10;
}

uint64_t _muser_fork_prepare()
{
  return pthread_mutex_lock(&mutex);
}

uint64_t _muser_fork_parent()
{
  return pthread_mutex_unlock(&mutex);
}

uint64_t _muser_fork_child()
{
  if (__muser_pipe)
  {
    xpc_pipe_invalidate();
    __muser_pipe = 0;
  }
  return pthread_mutex_unlock(&mutex);
}

uint64_t ___muser_extract_user_block_invoke(uint64_t a1, char *__s1, void *a3)
{
  const char *v6;
  const char *string_ptr;
  const char *v8;
  const char *v9;

  if (!__s1)
    return 1;
  if (!strcmp(__s1, "pw_name"))
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (!string_ptr)
      return 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = string_ptr;
    goto LABEL_12;
  }
  if (strcmp(__s1, "pw_passwd"))
  {
    if (!strcmp(__s1, "pw_uid"))
    {
      if (MEMORY[0x194021CE8](a3) != MEMORY[0x1E0C89010])
        return 1;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = xpc_int64_get_value(a3);
    }
    else
    {
      if (strcmp(__s1, "pw_gid"))
      {
        if (!strcmp(__s1, "pw_dir"))
        {
          v9 = xpc_string_get_string_ptr(a3);
          if (v9)
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72) = v9;
        }
        else if (!strcmp(__s1, "pw_shell"))
        {
          v6 = xpc_string_get_string_ptr(a3);
          if (v6)
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80) = v6;
        }
        return 1;
      }
      if (MEMORY[0x194021CE8](a3) != MEMORY[0x1E0C89010])
        return 1;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = xpc_int64_get_value(a3);
    }
LABEL_12:
    --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    return 1;
  }
  v8 = xpc_string_get_string_ptr(a3);
  if (v8)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v8;
  return 1;
}

_OWORD *_muser_extract_group(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _QWORD applier[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3800000000;
  v22 = 0;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 2;
  v20 = "";
  v21 = "*";
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = ___muser_extract_group_block_invoke;
  applier[3] = &unk_1E2E57220;
  applier[4] = &v17;
  applier[5] = &v13;
  xpc_dictionary_apply(xdict, applier);
  v10 = 0;
  if (!*((_DWORD *)v14 + 6))
  {
    v10 = LI_ils_create("L4488ss4*", v3, v4, v5, v6, v7, v8, v9, a1);
    free((void *)v18[6]);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t ___muser_extract_group_block_invoke(uint64_t a1, char *__s1, void *a3)
{
  size_t count;
  size_t i;
  const char *string_ptr;

  if (!__s1)
    return 1;
  if (!strcmp(__s1, "gr_name"))
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (!string_ptr)
      return 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = string_ptr;
LABEL_14:
    --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    return 1;
  }
  if (!strcmp(__s1, "gr_gid"))
  {
    if (MEMORY[0x194021CE8](a3) != MEMORY[0x1E0C89010])
      return 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = xpc_int64_get_value(a3);
    goto LABEL_14;
  }
  if (!strcmp(__s1, "gr_members") && MEMORY[0x194021CE8](a3) == MEMORY[0x1E0C88FC0])
  {
    count = xpc_array_get_count(a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = malloc_type_malloc(8 * count + 8, 0x10040436913F5uLL);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 8 * count) = 0;
    if (count)
    {
      for (i = 0; i != count; ++i)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 8 * i) = xpc_array_get_string(a3, i);
    }
  }
  return 1;
}

BOOL ___muser_extract_grouplist_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = MEMORY[0x194021CE8](a3);
  v7 = MEMORY[0x1E0C89010];
  if (v6 == MEMORY[0x1E0C89010])
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 4 * a2) = xpc_int64_get_value(a3);
  }
  else
  {
    free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return v6 == v7;
}

int bindresvport_sa(int a1, sockaddr *a2)
{
  sockaddr *v3;
  int sa_family;
  int v5;
  socklen_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;
  int *v13;
  socklen_t v14;
  socklen_t v15;
  int v16;
  int v17;
  sockaddr v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  v17 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = (sockaddr)0;
  v19 = 0u;
  v15 = 0;
  if (a2)
  {
    v3 = a2;
    sa_family = a2->sa_family;
  }
  else
  {
    v15 = 128;
    if (getsockname(a1, &v18, &v15) == -1)
      return -1;
    sa_family = v18.sa_family;
    v3 = &v18;
    __memset_chk();
  }
  if (sa_family == 30)
  {
    v6 = 28;
    v15 = 28;
    v16 = 2;
    v7 = 14;
    v5 = 41;
    goto LABEL_9;
  }
  if (sa_family != 2)
  {
    *__error() = 46;
    return -1;
  }
  v5 = 0;
  v6 = 16;
  v15 = 16;
  v16 = 2;
  v7 = 19;
LABEL_9:
  v8 = *(unsigned __int16 *)v3->sa_data;
  v3->sa_family = sa_family;
  v3->sa_len = v6;
  if (v8)
    return bind(a1, v3, v6);
  v14 = 4;
  v9 = getsockopt(a1, v5, v7, &v17, &v14);
  if ((v9 & 0x80000000) == 0)
  {
    v9 = setsockopt(a1, v5, v7, &v16, 4u);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = bind(a1, v3, v15);
      v12 = *__error();
      if (v10)
      {
        if ((setsockopt(a1, v5, v7, &v17, 4u) & 0x80000000) == 0)
          return v10;
        v13 = __error();
      }
      else
      {
        if (v3 == &v18 || (getsockname(a1, v3, &v15) & 0x80000000) == 0)
          return 0;
        v13 = __error();
        v10 = 0;
      }
      *v13 = v12;
      return v10;
    }
  }
  return v9;
}

CLIENT *__cdecl clnt_create(char *a1, unsigned int a2, unsigned int a3, char *a4)
{
  CLIENT *result;
  int cl_private;
  int v9;
  clnt_stat v10;
  int v11;
  sockaddr_in v12;
  uint64_t v13;
  timeval v14;

  v13 = *MEMORY[0x1E0C874D8];
  result = (CLIENT *)gethostbyname(a1);
  if (!result)
  {
    rpc_createerr.cf_stat = RPC_UNKNOWNHOST;
    return result;
  }
  if (LODWORD(result->cl_private) == 2)
  {
    *(_QWORD *)&v12.sin_len = 512;
    *(_QWORD *)v12.sin_zero = 0;
    __memmove_chk();
    result = (CLIENT *)getprotobyname(a4);
    if (result)
    {
      v11 = -1;
      cl_private = (int)result->cl_private;
      if (cl_private == 6)
        return clnttcp_create(&v12, a2, a3, &v11, 0, 0);
      if (cl_private == 17)
      {
        v14.tv_sec = 5;
        *(_QWORD *)&v14.tv_usec = 0;
        return clntudp_create(&v12, a2, a3, v14, &v11);
      }
      result = 0;
      v10 = RPC_SYSTEMERROR;
    }
    else
    {
      v10 = RPC_UNKNOWNPROTO;
    }
    rpc_createerr.cf_stat = v10;
    v9 = 46;
  }
  else
  {
    result = 0;
    rpc_createerr.cf_stat = RPC_SYSTEMERROR;
    v9 = 47;
  }
  rpc_createerr.cf_error.ru.RE_errno = v9;
  return result;
}

char *__cdecl clnt_sperror(CLIENT *a1, char *a2)
{
  char *v4;
  size_t v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  int __errnum[2];
  int v15;

  v4 = (char *)buf;
  if (buf || (v4 = (char *)malloc_type_malloc(0x100uLL, 0xEF1A3884uLL), (buf = (uint64_t)v4) != 0))
  {
    v15 = 0;
    *(_QWORD *)__errnum = 0;
    ((void (*)(CLIENT *, int *))a1->cl_ops->cl_geterr)(a1, __errnum);
    sprintf(v4, "%s: ", a2);
    v5 = strlen(v4);
    v6 = 0;
    v7 = &v4[v5];
    v8 = "RPC: (unknown error code)";
    while (rpc_errlist[v6] != __errnum[0])
    {
      v6 += 4;
      if (v6 == 72)
        goto LABEL_8;
    }
    v8 = *(const char **)&rpc_errlist[v6 + 2];
LABEL_8:
    v9 = strcpy(&v4[v5], v8);
    v10 = &v7[strlen(v9)];
    switch(__errnum[0])
    {
      case 0:
      case 1:
      case 2:
      case 5:
      case 8:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
        goto LABEL_21;
      case 3:
      case 4:
        strerror(__errnum[1]);
        sprintf(v10, "; errno = %s");
        goto LABEL_20;
      case 6:
      case 9:
        sprintf(v10, "; low version = %u, high version = %u");
        goto LABEL_20;
      case 7:
        v11 = 0;
        break;
      default:
        sprintf(v10, "; s1 = %u, s2 = %u");
        goto LABEL_20;
    }
    while (auth_errlist[v11] != __errnum[1])
    {
      v11 += 4;
      if (v11 == 32)
      {
        v12 = 0;
        goto LABEL_17;
      }
    }
    v12 = *(const char **)&auth_errlist[v11 + 2];
LABEL_17:
    strcpy(v10, "; why = ");
    v10 += strlen(v10);
    if (v12)
      strcpy(v10, v12);
    else
      sprintf(v10, "(unknown authentication error - %d)");
LABEL_20:
    v10 += strlen(v10);
LABEL_21:
    *(_WORD *)v10 = 10;
  }
  return v4;
}

char *__cdecl clnt_sperrno(clnt_stat a1)
{
  uint64_t v2;
  char *result;

  v2 = 0;
  result = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4;
    if (v2 == 72)
      return result;
  }
  return *(char **)&rpc_errlist[v2 + 2];
}

void clnt_perror(CLIENT *a1, char *a2)
{
  FILE *v2;
  char *v3;

  v2 = (FILE *)*MEMORY[0x1E0C874E0];
  v3 = clnt_sperror(a1, a2);
  fputs(v3, v2);
}

void clnt_perrno(clnt_stat a1)
{
  uint64_t v2;
  const char *v3;

  v2 = 0;
  v3 = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4;
    if (v2 == 72)
      goto LABEL_4;
  }
  v3 = *(const char **)&rpc_errlist[v2 + 2];
LABEL_4:
  fputs(v3, (FILE *)*MEMORY[0x1E0C874E0]);
}

char *__cdecl clnt_spcreateerror(char *a1)
{
  char *v2;
  uint64_t v3;
  const char *v4;
  size_t v5;
  uint64_t v6;
  char *v7;
  size_t v9;

  v2 = (char *)buf;
  if (buf || (v2 = (char *)malloc_type_malloc(0x100uLL, 0xEF1A3884uLL), (buf = (uint64_t)v2) != 0))
  {
    sprintf(v2, "%s: ", a1);
    v3 = 0;
    v4 = "RPC: (unknown error code)";
    while (rpc_errlist[v3] != rpc_createerr.cf_stat)
    {
      v3 += 4;
      if (v3 == 72)
        goto LABEL_8;
    }
    v4 = *(const char **)&rpc_errlist[v3 + 2];
LABEL_8:
    strcat(v2, v4);
    if (rpc_createerr.cf_stat == RPC_SYSTEMERROR)
    {
      *(_DWORD *)&v2[strlen(v2)] = 2108704;
      if (rpc_createerr.cf_error.ru.RE_errno >= 1 && rpc_createerr.cf_error.ru.RE_errno < *MEMORY[0x1E0C87A70])
      {
        v7 = strerror(rpc_createerr.cf_error.ru.RE_errno);
LABEL_21:
        strcat(v2, v7);
        goto LABEL_22;
      }
      v9 = strlen(v2);
      sprintf(&v2[v9], "Error %d", rpc_createerr.cf_error.ru.RE_errno);
    }
    else if (rpc_createerr.cf_stat == RPC_PMAPFAILURE)
    {
      v5 = strlen(v2);
      v6 = 0;
      *(_DWORD *)&v2[v5] = 2108704;
      v7 = "RPC: (unknown error code)";
      while (rpc_errlist[v6] != rpc_createerr.cf_error.re_status)
      {
        v6 += 4;
        if (v6 == 72)
          goto LABEL_21;
      }
      v7 = *(char **)&rpc_errlist[v6 + 2];
      goto LABEL_21;
    }
LABEL_22:
    *(_WORD *)&v2[strlen(v2)] = 10;
  }
  return v2;
}

void clnt_pcreateerror(char *a1)
{
  FILE *v1;
  char *v2;

  v1 = (FILE *)*MEMORY[0x1E0C874E0];
  v2 = clnt_spcreateerror(a1);
  fputs(v2, v1);
}

CLIENT *__cdecl clntraw_create(unsigned int a1, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  void (*v6)(uint64_t);
  rpc_msg v8;

  v4 = clntraw_private;
  if (!clntraw_private)
  {
    v5 = malloc_type_calloc(1uLL, 0x22C8uLL, 0x10F0040E0640BEDuLL);
    v4 = (uint64_t)v5;
    if (!v5)
      return (CLIENT *)v4;
    clntraw_private = (uint64_t)v5;
  }
  v8.rm_xid = 0;
  memset(&v8.ru.RM_rmb.ru, 0, 56);
  *(_QWORD *)&v8.rm_direction = 0x200000000;
  *(_QWORD *)(&v8.ru.RM_rmb.rp_stat + 1) = __PAIR64__(a2, a1);
  xdrmem_create((XDR *)(v4 + 24), (char *)(v4 + 8872), 0x18u, XDR_ENCODE);
  if (!xdr_callhdr((XDR *)(v4 + 24), &v8))
    perror("clnt_raw.c - Fatal header serialization error.");
  *(_DWORD *)(v4 + 8896) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 32) + 32))(v4 + 24);
  v6 = *(void (**)(uint64_t))(*(_QWORD *)(v4 + 32) + 56);
  if (v6)
    v6(v4 + 24);
  xdrmem_create((XDR *)(v4 + 24), (char *)(v4 + 72), 0x2260u, XDR_FREE);
  *(_QWORD *)(v4 + 8) = client_ops;
  *(_QWORD *)v4 = authnone_create();
  return (CLIENT *)v4;
}

uint64_t clntraw_call(uint64_t a1, int a2, unsigned int (*a3)(uint64_t, uint64_t, _QWORD), uint64_t a4, char *a5, char *a6)
{
  uint64_t v6;
  _DWORD *v12;
  uint64_t re_status;
  uint64_t v14;
  rpc_err v16;
  rpc_msg v17;
  int v18;

  v18 = a2;
  v6 = clntraw_private;
  if (!clntraw_private)
    return 16;
  v12 = (_DWORD *)(clntraw_private + 24);
  memset(&v17, 0, sizeof(v17));
  *(_QWORD *)&v16.re_status = 0;
  v16.ru.RE_vers.high = 0;
  while (1)
  {
    *(_DWORD *)(v6 + 24) = 0;
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 + 32) + 40))(v6 + 24, 0);
    ++*(_DWORD *)(v6 + 8872);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 + 32) + 24))(v6 + 24, v6 + 8872, *(unsigned int *)(v6 + 8896))|| !(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)(v6 + 32) + 8))(v6 + 24, &v18)|| !(*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)a1 + 56) + 8))()|| !a3(v6 + 24, a4, 0))
    {
      return 1;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 32) + 32))(v6 + 24);
    svc_getreq(1);
    *(_DWORD *)(v6 + 24) = 1;
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 + 32) + 40))(v6 + 24, 0);
    v17.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
    v17.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = a6;
    v17.ru.RM_cmb.cb_verf.oa_base = a5;
    if (!xdr_replymsg((XDR *)(v6 + 24), &v17))
      return 2;
    _seterr_reply(&v17, &v16);
    re_status = v16.re_status;
    v14 = *(_QWORD *)(*(_QWORD *)a1 + 56);
    if (v16.re_status == RPC_SUCCESS)
      break;
    if (!(*(unsigned int (**)(void))(v14 + 24))())
      return re_status;
  }
  re_status = 7;
  if ((*(unsigned int (**)(void))(v14 + 16))())
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)a1 + 56) + 16))())
      re_status = 0;
    else
      re_status = 7;
    if (v17.ru.RM_rmb.ru.RP_ar.ar_verf.oa_base)
    {
      *v12 = 2;
      xdr_opaque_auth((XDR *)(v6 + 24), (uint64_t)&v17.ru.RM_rmb.ru);
    }
  }
  return re_status;
}

uint64_t clntraw_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  uint64_t v3;

  v3 = clntraw_private;
  if (!clntraw_private)
    return 16;
  *(_DWORD *)(clntraw_private + 24) = 2;
  return a2(v3 + 24, a3, 0);
}

uint64_t clntraw_control()
{
  return 0;
}

_QWORD *clnttcp_create_timeout(sockaddr_in *a1, uint64_t a2, uint64_t a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, _OWORD *a8)
{
  _QWORD *v16;
  _DWORD *v17;
  unsigned int v18;
  int v19;
  int v20;
  void (*v21)(_DWORD *);
  int *v22;
  int v24;
  rpc_msg v25;
  timeval v26;
  timeval v27;

  memset(&v25, 0, sizeof(v25));
  v16 = malloc_type_calloc(1uLL, 0x18uLL, 0x3004039D06D92uLL);
  if (!v16)
  {
    rpc_createerr.cf_stat = RPC_SYSTEMERROR;
    v22 = __error();
    v17 = 0;
LABEL_21:
    rpc_createerr.cf_error.ru.RE_errno = *v22;
    goto LABEL_22;
  }
  v17 = malloc_type_calloc(1uLL, 0x88uLL, 0x10F0040E18C1070uLL);
  if (!v17)
  {
    rpc_createerr.cf_stat = RPC_SYSTEMERROR;
    v22 = __error();
    goto LABEL_21;
  }
  if (a1->sin_port)
    goto LABEL_6;
  v27.tv_sec = 6;
  *(_QWORD *)&v27.tv_usec = a7;
  v18 = pmap_getport_timeout(a1, a2, a3, v27);
  if (!v18)
  {
LABEL_22:
    free(v17);
    free(v16);
    return 0;
  }
  a1->sin_port = __rev16(v18);
LABEL_6:
  if (*a4 < 0)
  {
    v24 = socket(2, 1, 6);
    *a4 = v24;
    bindresvport(v24, 0);
    if (*a4 < 0 || (connect_NOCANCEL() & 0x80000000) != 0)
    {
      rpc_createerr.cf_stat = RPC_SYSTEMERROR;
      rpc_createerr.cf_error.ru.RE_errno = *__error();
LABEL_30:
      close_NOCANCEL();
      goto LABEL_22;
    }
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  v17[1] = v19;
  *v17 = *a4;
  *((_QWORD *)v17 + 1) = 60;
  v17[4] = 0;
  v17[6] = 0;
  if (a8)
  {
    *(_OWORD *)(v17 + 2) = *a8;
    v17[6] = 1;
  }
  *(sockaddr_in *)(v17 + 7) = *a1;
  v20 = open_NOCANCEL();
  if (v20 < 0 || read_NOCANCEL() != 4)
  {
    v26.tv_sec = 0;
    *(_QWORD *)&v26.tv_usec = 0;
    gettimeofday(&v26, 0);
    v25.rm_xid = getpid() ^ LODWORD(v26.tv_sec) ^ v26.tv_usec;
  }
  if (v20 >= 1)
    close_NOCANCEL();
  *(_QWORD *)&v25.rm_direction = 0x200000000;
  *(_QWORD *)(&v25.ru.RM_rmb.rp_stat + 1) = __PAIR64__(a3, a2);
  xdrmem_create((XDR *)(v17 + 22), (char *)v17 + 56, 0x18u, XDR_ENCODE);
  if (!xdr_callhdr((XDR *)(v17 + 22), &v25))
  {
    if (!v17[1])
      goto LABEL_22;
    goto LABEL_30;
  }
  v17[20] = (*(uint64_t (**)(_DWORD *))(*((_QWORD *)v17 + 12) + 32))(v17 + 22);
  v21 = *(void (**)(_DWORD *))(*((_QWORD *)v17 + 12) + 56);
  if (v21)
    v21(v17 + 22);
  xdrrec_create((XDR *)(v17 + 22), a5, a6, v17, (int (__cdecl *)(void *, void *, int))readtcp, (int (__cdecl *)(void *, void *, int))writetcp);
  v16[1] = &tcp_ops;
  v16[2] = v17;
  *v16 = authnone_create();
  return v16;
}

CLIENT *__cdecl clnttcp_create(sockaddr_in *a1, unsigned int a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  return (CLIENT *)clnttcp_create_timeout(a1, *(uint64_t *)&a2, *(uint64_t *)&a3, a4, a5, a6, 0, 0);
}

uint64_t clnttcp_call(_QWORD *a1, int a2, unsigned int (*a3)(uint64_t, uint64_t, _QWORD), uint64_t a4, unsigned int (*a5)(uint64_t, uint64_t, _QWORD), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _DWORD *v12;
  unsigned int *v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t result;
  int v19;
  _BOOL4 v22;
  rpc_msg v26;
  int v27;

  v27 = a2;
  v8 = a1[2];
  memset(&v26, 0, sizeof(v26));
  if (!*(_DWORD *)(v8 + 24))
  {
    *(_QWORD *)(v8 + 8) = a7;
    *(_QWORD *)(v8 + 16) = a8;
  }
  v9 = v8 + 56;
  if (a5)
  {
    v10 = a8;
    v11 = (a7 | a8) != 0;
  }
  else
  {
    v11 = 0;
    v10 = a8;
  }
  v12 = (_DWORD *)(v8 + 88);
  v13 = (unsigned int *)(v8 + 44);
  v22 = (a7 | v10) == 0;
  v14 = 2;
  while (1)
  {
    *(_DWORD *)(v8 + 88) = 0;
    *(_DWORD *)(v8 + 44) = 0;
    v15 = *(_DWORD *)(v8 + 56) - 1;
    *(_DWORD *)(v8 + 56) = v15;
    v16 = v9;
    if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)(v8 + 96) + 24))(v8 + 88)
      || !(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)(v8 + 96) + 8))(v8 + 88, &v27)
      || !(*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 56) + 8))()
      || !a3(v8 + 88, a4, 0))
    {
      if (!*v13)
        *v13 = 1;
      xdrrec_endofrecord((XDR *)(v8 + 88), 1);
      return *v13;
    }
    if (!xdrrec_endofrecord((XDR *)(v8 + 88), v11))
    {
      result = 3;
      goto LABEL_34;
    }
    if (!v11)
      return 0;
    if (v22)
      break;
    *v12 = 1;
    v26.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
    v26.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = 0;
    v26.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_void;
    if (!xdrrec_skiprecord((XDR *)(v8 + 88)))
      return *v13;
    v17 = bswap32(v15);
    while (1)
    {
      if (!xdr_replymsg((XDR *)(v8 + 88), &v26))
      {
        result = *v13;
        if ((_DWORD)result)
          return result;
        goto LABEL_20;
      }
      if (v26.rm_xid == v17)
        break;
LABEL_20:
      v26.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
      v26.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = 0;
      v26.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_void;
      if (!xdrrec_skiprecord((XDR *)(v8 + 88)))
        return *v13;
    }
    _seterr_reply(&v26, (rpc_err *)(v8 + 44));
    if (!*v13)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 56) + 16))())
      {
        if (!a5(v8 + 88, a6, 0) && !*v13)
          *v13 = 2;
      }
      else
      {
        *(_QWORD *)v13 = 0x600000007;
      }
      if (v26.ru.RM_rmb.ru.RP_ar.ar_verf.oa_base)
      {
        *v12 = 2;
        xdr_opaque_auth((XDR *)(v8 + 88), (uint64_t)&v26.ru.RM_rmb.ru);
      }
      return *v13;
    }
    if (v14)
    {
      --v14;
      v19 = (*(uint64_t (**)(void))(*(_QWORD *)(*a1 + 56) + 24))();
      v9 = v16;
      if (v19)
        continue;
    }
    return *v13;
  }
  result = 5;
LABEL_34:
  *v13 = result;
  return result;
}

uint64_t clnttcp_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD *)(v2 + 44);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 52);
  *(_QWORD *)a2 = v3;
  return result;
}

uint64_t clnttcp_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v3 + 88) = 2;
  return a2(v3 + 88, a3, 0);
}

void clnttcp_destroy(_QWORD *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = a1[2];
  if (*(_DWORD *)(v2 + 4))
    close_NOCANCEL();
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(v2 + 96) + 56);
  if (v3)
    v3(v2 + 88);
  free((void *)v2);
  free(a1);
}

uint64_t clnttcp_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  __int128 v5;

  v3 = *(_QWORD *)(a1 + 16);
  if (a2 == 3)
  {
    v5 = *(_OWORD *)(v3 + 28);
LABEL_7:
    *a3 = v5;
    return 1;
  }
  if (a2 == 2)
  {
    v5 = *(_OWORD *)(v3 + 8);
    goto LABEL_7;
  }
  if (a2 != 1)
    return 0;
  *(_OWORD *)(v3 + 8) = *a3;
  result = 1;
  *(_DWORD *)(v3 + 24) = 1;
  return result;
}

uint64_t readtcp(int *a1, uint64_t a2, int a3)
{
  int v4;
  int v5;
  uint64_t result;
  int v7;
  _OWORD v8[8];

  if (!a3)
    return 0;
  memset(v8, 0, sizeof(v8));
  v4 = *a1;
  if (__darwin_check_fd_set_overflow(*a1, v8, 0))
    *(_DWORD *)((char *)v8 + (((unint64_t)v4 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v4;
  while (1)
  {
    v5 = select_NOCANCEL();
    if (v5 != -1)
      break;
    if (*__error() != 4)
    {
      a1[11] = 4;
      a1[12] = *__error();
      return 0xFFFFFFFFLL;
    }
  }
  if (v5)
  {
    result = read_NOCANCEL();
    if ((_DWORD)result == -1)
    {
      v7 = *__error();
      a1[11] = 4;
      a1[12] = v7;
    }
    else
    {
      if ((_DWORD)result)
        return result;
      *(_QWORD *)(a1 + 11) = 0x3600000004;
    }
  }
  else
  {
    a1[11] = 5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t writetcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v6;
  int v7;
  BOOL v8;
  int v9;

  v3 = a3;
  if ((int)a3 >= 1)
  {
    v6 = a3;
    while (1)
    {
      v7 = write_NOCANCEL();
      if (v7 == -1)
        break;
      a2 += v7;
      v8 = __OFSUB__(v6, v7);
      v6 -= v7;
      if ((v6 < 0) ^ v8 | (v6 == 0))
        return v3;
    }
    v9 = *__error();
    *(_DWORD *)(a1 + 44) = 3;
    *(_DWORD *)(a1 + 48) = v9;
    return 0xFFFFFFFFLL;
  }
  return v3;
}

_QWORD *clntudp_bufcreate_timeout(sockaddr_in *a1, unsigned int a2, unsigned int a3, int *a4, int a5, int a6, _OWORD *a7, _OWORD *a8)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  int *v20;
  unsigned int v21;
  sockaddr_in v22;
  int v23;
  int v24;
  int v26;
  socklen_t v27[2];
  rpc_msg v28;
  timeval v29;
  unsigned int v30;

  memset(&v28, 0, sizeof(v28));
  *(_QWORD *)v27 = 0;
  v16 = malloc_type_calloc(1uLL, 0x18uLL, 0x3004039D06D92uLL);
  if (!v16)
  {
    rpc_createerr.cf_stat = RPC_SYSTEMERROR;
    rpc_createerr.cf_error.ru.RE_errno = *__error();
    return v16;
  }
  v17 = (a5 + 3) & 0xFFFFFFFC;
  v18 = (a6 + 3) & 0xFFFFFFFC;
  v30 = (a6 + 3) & 0xFFFFFFFC;
  v19 = (int *)malloc_type_calloc(1uLL, v17 + v18 + 152, 0x83777A57uLL);
  if (!v19)
  {
    rpc_createerr.cf_stat = RPC_SYSTEMERROR;
    rpc_createerr.cf_error.ru.RE_errno = *__error();
LABEL_26:
    free(v16);
    return 0;
  }
  v20 = v19;
  *((_QWORD *)v19 + 17) = (char *)v19 + v18 + 148;
  if (!a1->sin_port)
  {
    v21 = pmap_getport_timeout(a1);
    if (!v21)
    {
LABEL_25:
      free(v20);
      goto LABEL_26;
    }
    a1->sin_port = __rev16(v21);
  }
  v16[1] = &udp_ops;
  v16[2] = v20;
  v22 = *a1;
  *((_QWORD *)v20 + 4) = 1;
  *(sockaddr_in *)(v20 + 2) = v22;
  v20[6] = 16;
  v20[33] = v17;
  v20[36] = v18;
  v20[10] = 0;
  if (a7)
    *((_OWORD *)v20 + 2) = *a7;
  *((_QWORD *)v20 + 6) = -1;
  v20[14] = -1;
  if (a8)
    *((_OWORD *)v20 + 3) = *a8;
  v23 = open_NOCANCEL();
  if (v23 < 0 || read_NOCANCEL() != 4)
  {
    v29.tv_sec = 0;
    *(_QWORD *)&v29.tv_usec = 0;
    gettimeofday(&v29, 0);
    v28.rm_xid = getpid() ^ LODWORD(v29.tv_sec) ^ v29.tv_usec;
  }
  if (v23 >= 1)
    close_NOCANCEL();
  *(_QWORD *)&v28.rm_direction = 0x200000000;
  *(_QWORD *)(&v28.ru.RM_rmb.rp_stat + 1) = __PAIR64__(a3, a2);
  xdrmem_create((XDR *)(v20 + 20), *((char **)v20 + 17), v17, XDR_ENCODE);
  if (!xdr_callhdr((XDR *)(v20 + 20), &v28))
    goto LABEL_25;
  v20[32] = (*(uint64_t (**)(int *))(*((_QWORD *)v20 + 11) + 32))(v20 + 20);
  if (*a4 < 0)
  {
    v26 = 1;
    v24 = socket(2, 2, 17);
    *a4 = v24;
    if (v24 < 0)
    {
      rpc_createerr.cf_stat = RPC_SYSTEMERROR;
      rpc_createerr.cf_error.ru.RE_errno = *__error();
    }
    else
    {
      bindresvport(v24, 0);
      ioctl(*a4, 0x8004667EuLL, &v26);
      v20[1] = 1;
      v27[0] = 0;
      v27[1] = 4;
      if (!getsockopt(*a4, 0xFFFF, 4098, v27, &v27[1]))
      {
        v27[1] = 4;
        if (v18 <= v27[0] || !setsockopt(*a4, 0xFFFF, 4098, &v30, 4u))
          goto LABEL_18;
      }
      close_NOCANCEL();
      *a4 = -1;
    }
    goto LABEL_25;
  }
  v20[1] = 0;
LABEL_18:
  *v20 = *a4;
  *v16 = authnone_create();
  return v16;
}

CLIENT *__cdecl clntudp_bufcreate(sockaddr_in *a1, unsigned int a2, unsigned int a3, timeval a4, int *a5, unsigned int a6, unsigned int a7)
{
  timeval v8;

  v8 = a4;
  return (CLIENT *)clntudp_bufcreate_timeout(a1, a2, a3, a5, a6, a7, &v8, 0);
}

CLIENT *__cdecl clntudp_create(sockaddr_in *a1, unsigned int a2, unsigned int a3, timeval a4, int *a5)
{
  timeval v6;

  v6 = a4;
  return (CLIENT *)clntudp_bufcreate_timeout(a1, a2, a3, a5, 8800, 8800, &v6, 0);
}

uint64_t clntudp_call(_QWORD *a1, int a2, unsigned int (*a3)(uint64_t, uint64_t, _QWORD), uint64_t a4, char *a5, char *a6, uint64_t a7, signed int a8)
{
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  signed int v27;
  int v28;
  uint64_t result;
  signed int v31;
  rpc_err *v32;
  uint64_t v33;
  char v34;
  signed int v35;
  uint64_t v36;
  XDR v39;
  rpc_msg v40;
  __int128 v41;
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
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v10 = a1;
  v61 = *MEMORY[0x1E0C874D8];
  v58 = a2;
  v11 = a1[2];
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
  v41 = 0u;
  v42 = 0u;
  memset(&v40, 0, sizeof(v40));
  if (*(_QWORD *)(v11 + 48) != -1)
  {
    a8 = *(_DWORD *)(v11 + 56);
    a7 = *(_QWORD *)(v11 + 48);
  }
  v36 = 0;
  v57 = 0;
  v59 = 0;
  v60 = 0;
  memset(&v39, 0, 32);
  v31 = a8;
  if (a7)
    v12 = 0;
  else
    v12 = a8 == 0;
  v13 = v12;
  v34 = v13;
  v35 = 0;
  v32 = (rpc_err *)(v11 + 64);
  v33 = a7;
  v14 = 2;
  *(_OWORD *)&v39.x_base = 0uLL;
LABEL_10:
  *(_DWORD *)(v11 + 80) = 0;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v11 + 88) + 40))(v11 + 80, *(unsigned int *)(v11 + 128));
  ++**(_WORD **)(v11 + 136);
  if (!(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)(v11 + 88) + 8))(v11 + 80, &v58)
    || !(*(unsigned int (**)(void))(*(_QWORD *)(*v10 + 56) + 8))()
    || !a3(v11 + 80, a4, 0))
  {
    result = 1;
LABEL_48:
    v32->re_status = result;
    return result;
  }
  v15 = a4;
  v16 = (*(int (**)(uint64_t))(*(_QWORD *)(v11 + 88) + 32))(v11 + 80);
  if (sendto_NOCANCEL() != v16)
  {
LABEL_46:
    v28 = *__error();
    result = 3;
    goto LABEL_44;
  }
  if ((v34 & 1) != 0)
  {
LABEL_47:
    result = 5;
    goto LABEL_48;
  }
  while (1)
  {
    v40.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
    v40.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = a6;
    v40.ru.RM_cmb.cb_verf.oa_base = a5;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v17 = *(_DWORD *)v11;
    if (__darwin_check_fd_set_overflow(*(_DWORD *)v11, &v41, 0))
      *(_DWORD *)((char *)&v41 + (((unint64_t)v17 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v17;
LABEL_17:
    while (1)
    {
      v53 = v45;
      v54 = v46;
      v55 = v47;
      v56 = v48;
      v49 = v41;
      v50 = v42;
      v51 = v43;
      v52 = v44;
      v18 = select_NOCANCEL();
      if (v18 != -1)
        break;
      if (*__error() != 4)
        goto LABEL_43;
    }
    if (v18)
      break;
    v20 = *(_QWORD *)(v11 + 32);
    v21 = *(_DWORD *)(v11 + 40);
    v22 = v21 + v35;
    if (v21 + v35 <= 999999)
    {
      v26 = v20 + v36;
      v27 = v21 + v35;
    }
    else
    {
      v23 = v36 + v20;
      v24 = v35 + v21;
      if (v22 >= 1999999)
        v22 = 1999999;
      v25 = v24 + 999999 - v22;
      v26 = v23 + v25 / 0xF4240 + 1;
      v27 = v24 - 1000000 + v25 % 0xF4240 - v25;
    }
    if (v26 >= v33 && (v26 != v33 || v27 >= v31))
      goto LABEL_47;
    v35 = v27;
    v36 = v26;
    if (sendto_NOCANCEL() != v16)
      goto LABEL_46;
  }
  do
  {
    v57 = 16;
    v19 = recvfrom_NOCANCEL();
    if ((v19 & 0x80000000) == 0)
    {
      if ((v19 & 0xFFFFFFFC) == 0 || *(_DWORD *)(v11 + 148) != **(_DWORD **)(v11 + 136))
        goto LABEL_17;
      xdrmem_create(&v39, (char *)(v11 + 148), v19, XDR_DECODE);
      if (!xdr_replymsg(&v39, &v40))
      {
        v32->re_status = RPC_CANTDECODERES;
        return v32->re_status;
      }
      _seterr_reply(&v40, v32);
      if (v32->re_status == RPC_SUCCESS)
      {
        if (!(*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 56) + 16))())
          *(_QWORD *)&v32->re_status = 0x600000007;
        if (v40.ru.RM_rmb.ru.RP_ar.ar_verf.oa_base)
        {
          *(_DWORD *)(v11 + 80) = 2;
          xdr_opaque_auth((XDR *)(v11 + 80), (uint64_t)&v40.ru.RM_rmb.ru);
        }
        return v32->re_status;
      }
      a4 = v15;
      v10 = a1;
      if (!v14)
        return v32->re_status;
      --v14;
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 56) + 24))())
        return v32->re_status;
      goto LABEL_10;
    }
  }
  while (*__error() == 4);
  if (*__error() == 35)
    goto LABEL_17;
LABEL_43:
  v28 = *__error();
  result = 4;
LABEL_44:
  *(_DWORD *)(v11 + 64) = result;
  *(_DWORD *)(v11 + 68) = v28;
  return result;
}

uint64_t clntudp_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD *)(v2 + 64);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 72);
  *(_QWORD *)a2 = v3;
  return result;
}

uint64_t clntudp_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v3 + 80) = 2;
  return a2(v3 + 80, a3, 0);
}

void clntudp_destroy(_QWORD *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = a1[2];
  if (*(_DWORD *)(v2 + 4))
    close_NOCANCEL();
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(v2 + 88) + 56);
  if (v3)
    v3(v2 + 80);
  free((void *)v2);
  free(a1);
}

uint64_t clntudp_control(uint64_t a1, int a2, _OWORD *a3)
{
  _OWORD *v3;
  uint64_t result;
  __int128 v5;

  v3 = *(_OWORD **)(a1 + 16);
  switch(a2)
  {
    case 1:
      v3[3] = *a3;
      goto LABEL_9;
    case 2:
      v5 = v3[3];
      goto LABEL_8;
    case 3:
      v5 = *(_OWORD *)((char *)v3 + 8);
      goto LABEL_8;
    case 4:
      v3[2] = *a3;
      goto LABEL_9;
    case 5:
      v5 = v3[2];
LABEL_8:
      *a3 = v5;
LABEL_9:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t si_destination_compare_no_dependencies(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t result;
  unsigned int v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (a1)
  {
    if (a2)
    {
      v4 = rfc6724_precedence(a1);
      v5 = rfc6724_precedence(a2);
      if (v4 > v5)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
          si_destination_compare_no_dependencies_cold_3();
        return 1;
      }
      if (v5 > v4)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
          si_destination_compare_no_dependencies_cold_4();
        return 0xFFFFFFFFLL;
      }
      v7 = rfc6724_scope_sa(a1);
      v8 = rfc6724_scope_sa(a2);
      if (v7 < v8)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
          si_destination_compare_no_dependencies_cold_5();
        return 1;
      }
      if (v8 < v7)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
          si_destination_compare_no_dependencies_cold_6();
        return 0xFFFFFFFFLL;
      }
      return 0;
    }
    v17 = si_destination_log;
    result = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      si_destination_compare_no_dependencies_cold_2(v17, v18, v19, v20, v21, v22, v23, v24);
      return 0;
    }
  }
  else
  {
    v9 = si_destination_log;
    result = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      si_destination_compare_no_dependencies_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
      return 0;
    }
  }
  return result;
}

uint64_t rfc6724_precedence(uint64_t result)
{
  int v1;
  unsigned int v2;

  if (result)
  {
    v1 = *(unsigned __int8 *)(result + 1);
    if (v1 != 2)
    {
      if (v1 != 30)
        return 0;
      v2 = *(_DWORD *)(result + 8);
      if (v2)
      {
        if ((unsigned __int16)v2 == 544)
          return 30;
        if ((unsigned __int16)v2 == 288 && v2 < 0x10000)
          return 5;
        if ((v2 & 0xFE) == 0xFC)
          return 3;
        if ((v2 & 0xC0FF) == 0xC0FE)
          return 1;
LABEL_15:
        if ((unsigned __int16)v2 == 65087)
          return 1;
        else
          return 40;
      }
      if (*(_DWORD *)(result + 12))
        goto LABEL_14;
      if (!*(_DWORD *)(result + 16) && *(_DWORD *)(result + 20) == 0x1000000)
        return 50;
      if (*(_DWORD *)(result + 16) != -65536)
      {
LABEL_14:
        if (!*(_DWORD *)(result + 12)
          && !*(_DWORD *)(result + 16)
          && (*(_DWORD *)(result + 20) | 0x1000000) != 0x1000000)
        {
          return 1;
        }
        goto LABEL_15;
      }
    }
    return 35;
  }
  return result;
}

void si_destination_compare_child_has_forked()
{
  cache_lock = 0;
  si_destination_log = MEMORY[0x1E0C88E98];
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x10u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xAu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 4u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 4u);
}

int getrpcport(char *a1, int a2, int a3, int a4)
{
  hostent *v7;
  sockaddr_in v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  v7 = gethostbyname(a1);
  if (v7)
  {
    *(_QWORD *)&v9.sin_len = 512;
    *(_QWORD *)v9.sin_zero = 0;
    __memmove_chk();
    LODWORD(v7) = pmap_getport(&v9, a2, a3, a4);
  }
  return (int)v7;
}

int pmap_set(unsigned int a1, unsigned int a2, int a3, int a4)
{
  unsigned __int16 v4;
  _QWORD *v8;
  _QWORD *v9;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  sockaddr_in v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C874D8];
  v16 = -1;
  if (pmap_wakeup())
    goto LABEL_2;
  v11 = 0;
  *(_QWORD *)&v17.sin_len = 0x100007F00000200;
  *(_QWORD *)v17.sin_zero = 0;
  v8 = clntudp_bufcreate_timeout(&v17, 0x186A0u, 2u, &v16, 400, 400, &set_retry_timeout, &set_total_timeout);
  if (!v8)
    return (int)v8;
  v9 = v8;
  v12 = a1;
  v13 = a2;
  v14 = a3;
  v15 = v4;
  if ((*(unsigned int (**)(void))v8[1])())
  {
LABEL_2:
    LODWORD(v8) = 0;
  }
  else
  {
    (*(void (**)(_QWORD *))(v9[1] + 32))(v9);
    close_NOCANCEL();
    LODWORD(v8) = v11;
  }
  return (int)v8;
}

int pmap_unset(unsigned int a1, unsigned int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  sockaddr_in v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = -1;
  if (pmap_wakeup())
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v7 = 0;
    *(_QWORD *)&v13.sin_len = 0x100007F00000200;
    *(_QWORD *)v13.sin_zero = 0;
    v4 = clntudp_bufcreate_timeout(&v13, 0x186A0u, 2u, &v12, 400, 400, &unset_retry_timeout, &unset_total_timeout);
    if (v4)
    {
      v5 = v4;
      v8 = a1;
      v9 = a2;
      v10 = 0;
      v11 = 0;
      (*(void (**)(void))v4[1])();
      (*(void (**)(_QWORD *))(v5[1] + 32))(v5);
      close_NOCANCEL();
      LODWORD(v4) = v7;
    }
  }
  return (int)v4;
}

const char *darwin_directory_cached_item_is_valid(const char **a1, uint64_t a2)
{
  const char *result;
  const char **v5;
  uint64_t v6;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = *a1;
      if (*a1)
      {
        v5 = *(const char ***)a2;
        if (*(_QWORD *)a2 && *v5 && !strcmp(result, *v5))
        {
          v6 = *(_QWORD *)(a2 + 16);
          if ((v6 & 0x100000000000000) != 0)
            return (const char *)1;
          else
            return (const char *)(DarwinDirectoryGetGeneration() == (unsigned __int16)v6);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t darwin_directory_user_byname(uint64_t a1, const char *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  host_t v6;
  uint64_t v7;
  uint64_t v8;
  host_t v10;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint32_t multiuser_flags[2];
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C874D8];
  v2 = &v13;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v3 = MEMORY[0x1E0C87450];
  v12[0] = MEMORY[0x1E0C87450];
  v12[1] = 0x40000000;
  v12[2] = __darwin_directory_user_byname_block_invoke;
  v12[3] = &unk_1E2E57430;
  v12[4] = &v13;
  v12[5] = a1;
  if (!a2)
    goto LABEL_7;
  v33 = a2;
  v34 = 0;
  v32 = 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = 0;
  v22 = MEMORY[0x1E0C87450];
  v23 = 0x40000000;
  v24 = ___dd_foreach_record_with_name_block_invoke_0;
  v25 = &unk_1E2E57458;
  v26 = v12;
  v27 = &v28;
  v5 = DarwinDirectoryRecordStoreApplyWithFilter();
  if (*((_BYTE *)v29 + 24))
  {
LABEL_6:
    _Block_object_dispose(&v28, 8);
    v2 = v14;
LABEL_7:
    v8 = v2[3];
    _Block_object_dispose(&v13, 8);
    return v8;
  }
  multiuser_flags[0] = 0;
  v6 = MEMORY[0x194021814](v5);
  if (host_get_multiuser_config_flags(v6, multiuser_flags))
  {
    v7 = mbr_identifier_translate_cold_2();
  }
  else
  {
    if ((multiuser_flags[0] & 0x80000000) == 0)
      goto LABEL_6;
    v7 = strcmp(a2, "mobile");
    if ((_DWORD)v7)
      goto LABEL_6;
  }
  LODWORD(v32) = 0;
  multiuser_flags[0] = 0;
  v10 = MEMORY[0x194021814](v7);
  if (!host_get_multiuser_config_flags(v10, multiuser_flags))
  {
    LODWORD(v33) = multiuser_flags[0] & 0x3FFFFFFF;
    *(_QWORD *)multiuser_flags = v3;
    v18 = 0x40000000;
    v19 = ___dd_foreach_record_with_name_block_invoke_2_0;
    v20 = &unk_1E2E57480;
    v21 = v12;
    DarwinDirectoryRecordStoreApplyWithFilter();
    goto LABEL_6;
  }
  v11 = mbr_identifier_translate_cold_2();
  return darwin_directory_user_byuid(v11);
}

uint64_t darwin_directory_user_byuid(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  host_t v5;
  uint64_t multiuser_config_flags;
  uint64_t v7;
  host_t v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t multiuser_flags[2];
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C874D8];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v3 = MEMORY[0x1E0C87450];
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __darwin_directory_user_byuid_block_invoke;
  v11[3] = &unk_1E2E574A8;
  v11[4] = &v12;
  v11[5] = a1;
  v31 = 0;
  v33 = 0;
  v32 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = 0;
  v21 = MEMORY[0x1E0C87450];
  v22 = 0x40000000;
  v23 = ___dd_foreach_record_with_id_block_invoke_0;
  v24 = &unk_1E2E574D0;
  v25 = v11;
  v26 = &v27;
  v4 = DarwinDirectoryRecordStoreApplyWithFilter();
  if (*((_BYTE *)v28 + 24))
    goto LABEL_5;
  multiuser_flags[0] = 0;
  v5 = MEMORY[0x194021814](v4);
  multiuser_config_flags = host_get_multiuser_config_flags(v5, multiuser_flags);
  if ((_DWORD)multiuser_config_flags)
  {
    multiuser_config_flags = mbr_identifier_translate_cold_2();
  }
  else if (a2 != 501 || (multiuser_flags[0] & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  multiuser_flags[0] = 0;
  v9 = MEMORY[0x194021814](multiuser_config_flags);
  if (!host_get_multiuser_config_flags(v9, multiuser_flags))
  {
    LODWORD(v32) = multiuser_flags[0] & 0x3FFFFFFF;
    *(_QWORD *)multiuser_flags = v3;
    v17 = 0x40000000;
    v18 = ___dd_foreach_record_with_id_block_invoke_2_0;
    v19 = &unk_1E2E574F8;
    v20 = v11;
    DarwinDirectoryRecordStoreApplyWithFilter();
LABEL_5:
    _Block_object_dispose(&v27, 8);
    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
    return v7;
  }
  v10 = mbr_identifier_translate_cold_2();
  return darwin_directory_user_byuuid(v10);
}

uint64_t darwin_directory_user_byuuid(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C874D8];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = MEMORY[0x1E0C87450];
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __darwin_directory_user_byuuid_block_invoke;
  v5[3] = &unk_1E2E57520;
  v5[4] = &v6;
  v5[5] = a1;
  v15 = 2;
  v16[0] = 0;
  v16[1] = 0;
  uuid_copy((unsigned __int8 *)v16, a2);
  v10 = v2;
  v11 = 0x40000000;
  v12 = ___dd_foreach_record_with_uuid_block_invoke_0;
  v13 = &unk_1E2E57548;
  v14 = v5;
  DarwinDirectoryRecordStoreApplyWithFilter();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t darwin_directory_user_all()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2000000000;
  v5 = 0;
  DarwinDirectoryRecordStoreApply();
  v0 = v3[3];
  _Block_object_dispose(&v2, 8);
  return v0;
}

uint64_t darwin_directory_group_byname(uint64_t a1, const char *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  host_t v6;
  uint64_t v7;
  uint64_t v8;
  host_t v10;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint32_t multiuser_flags[2];
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C874D8];
  v2 = &v13;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v3 = MEMORY[0x1E0C87450];
  v12[0] = MEMORY[0x1E0C87450];
  v12[1] = 0x40000000;
  v12[2] = __darwin_directory_group_byname_block_invoke;
  v12[3] = &unk_1E2E57598;
  v12[4] = &v13;
  v12[5] = a1;
  if (!a2)
    goto LABEL_7;
  v33 = a2;
  v34 = 0;
  v32 = 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = 0;
  v22 = MEMORY[0x1E0C87450];
  v23 = 0x40000000;
  v24 = ___dd_foreach_record_with_name_block_invoke_0;
  v25 = &unk_1E2E57458;
  v26 = v12;
  v27 = &v28;
  v5 = DarwinDirectoryRecordStoreApplyWithFilter();
  if (*((_BYTE *)v29 + 24))
  {
LABEL_6:
    _Block_object_dispose(&v28, 8);
    v2 = v14;
LABEL_7:
    v8 = v2[3];
    _Block_object_dispose(&v13, 8);
    return v8;
  }
  multiuser_flags[0] = 0;
  v6 = MEMORY[0x194021814](v5);
  if (host_get_multiuser_config_flags(v6, multiuser_flags))
  {
    v7 = mbr_identifier_translate_cold_2();
  }
  else
  {
    if ((multiuser_flags[0] & 0x80000000) == 0)
      goto LABEL_6;
    v7 = strcmp(a2, "mobile");
    if ((_DWORD)v7)
      goto LABEL_6;
  }
  LODWORD(v32) = 0;
  multiuser_flags[0] = 0;
  v10 = MEMORY[0x194021814](v7);
  if (!host_get_multiuser_config_flags(v10, multiuser_flags))
  {
    LODWORD(v33) = multiuser_flags[0] & 0x3FFFFFFF;
    *(_QWORD *)multiuser_flags = v3;
    v18 = 0x40000000;
    v19 = ___dd_foreach_record_with_name_block_invoke_2_0;
    v20 = &unk_1E2E57480;
    v21 = v12;
    DarwinDirectoryRecordStoreApplyWithFilter();
    goto LABEL_6;
  }
  v11 = mbr_identifier_translate_cold_2();
  return darwin_directory_group_bygid(v11);
}

uint64_t darwin_directory_group_bygid(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  host_t v5;
  uint64_t multiuser_config_flags;
  uint64_t v7;
  host_t v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t multiuser_flags[2];
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C874D8];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v3 = MEMORY[0x1E0C87450];
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __darwin_directory_group_bygid_block_invoke;
  v11[3] = &unk_1E2E575C0;
  v11[4] = &v12;
  v11[5] = a1;
  v31 = 0;
  v33 = 0;
  v32 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = 0;
  v21 = MEMORY[0x1E0C87450];
  v22 = 0x40000000;
  v23 = ___dd_foreach_record_with_id_block_invoke_0;
  v24 = &unk_1E2E574D0;
  v25 = v11;
  v26 = &v27;
  v4 = DarwinDirectoryRecordStoreApplyWithFilter();
  if (*((_BYTE *)v28 + 24))
    goto LABEL_5;
  multiuser_flags[0] = 0;
  v5 = MEMORY[0x194021814](v4);
  multiuser_config_flags = host_get_multiuser_config_flags(v5, multiuser_flags);
  if ((_DWORD)multiuser_config_flags)
  {
    multiuser_config_flags = mbr_identifier_translate_cold_2();
  }
  else if (a2 != 501 || (multiuser_flags[0] & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  multiuser_flags[0] = 0;
  v9 = MEMORY[0x194021814](multiuser_config_flags);
  if (!host_get_multiuser_config_flags(v9, multiuser_flags))
  {
    LODWORD(v32) = multiuser_flags[0] & 0x3FFFFFFF;
    *(_QWORD *)multiuser_flags = v3;
    v17 = 0x40000000;
    v18 = ___dd_foreach_record_with_id_block_invoke_2_0;
    v19 = &unk_1E2E574F8;
    v20 = v11;
    DarwinDirectoryRecordStoreApplyWithFilter();
LABEL_5:
    _Block_object_dispose(&v27, 8);
    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
    return v7;
  }
  v10 = mbr_identifier_translate_cold_2();
  return darwin_directory_group_byuuid(v10);
}

uint64_t darwin_directory_group_byuuid(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C874D8];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = MEMORY[0x1E0C87450];
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __darwin_directory_group_byuuid_block_invoke;
  v5[3] = &unk_1E2E575E8;
  v5[4] = &v6;
  v5[5] = a1;
  v15 = 2;
  v16[0] = 0;
  v16[1] = 0;
  uuid_copy((unsigned __int8 *)v16, a2);
  v10 = v2;
  v11 = 0x40000000;
  v12 = ___dd_foreach_record_with_uuid_block_invoke_0;
  v13 = &unk_1E2E57548;
  v14 = v5;
  DarwinDirectoryRecordStoreApplyWithFilter();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t darwin_directory_group_all()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2000000000;
  v5 = 0;
  DarwinDirectoryRecordStoreApply();
  v0 = v3[3];
  _Block_object_dispose(&v2, 8);
  return v0;
}

_OWORD *darwin_directory_grouplist(uint64_t a1, const char *a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  host_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  host_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  _QWORD v28[3];
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint32_t multiuser_flags[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C874D8];
  v4 = &v30;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2000000000;
  v33 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2000000000;
  v29 = 0;
  v5 = MEMORY[0x1E0C87450];
  v27[0] = MEMORY[0x1E0C87450];
  v27[1] = 0x40000000;
  v27[2] = __darwin_directory_grouplist_block_invoke;
  v27[3] = &unk_1E2E57638;
  v27[4] = v28;
  v27[5] = &v30;
  if (!a2)
    goto LABEL_7;
  v50 = a2;
  v51 = 0;
  v49 = 1;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2000000000;
  LOBYTE(v48) = 0;
  v39 = MEMORY[0x1E0C87450];
  v40 = 0x40000000;
  v41 = (uint64_t)___dd_foreach_record_with_name_block_invoke_0;
  v42 = &unk_1E2E57458;
  v43 = v27;
  v44 = &v45;
  v6 = DarwinDirectoryRecordStoreApplyWithFilter();
  if (!*((_BYTE *)v46 + 24))
  {
    multiuser_flags[0] = 0;
    v7 = MEMORY[0x194021814](v6);
    if (host_get_multiuser_config_flags(v7, multiuser_flags))
      goto LABEL_16;
    if ((multiuser_flags[0] & 0x80000000) != 0)
    {
      v8 = strcmp(a2, "mobile");
      if (!(_DWORD)v8)
        goto LABEL_17;
    }
  }
  while (1)
  {
    _Block_object_dispose(&v45, 8);
    v4 = v31;
LABEL_7:
    if (!*((_BYTE *)v4 + 24))
    {
      v16 = 0;
LABEL_14:
      _Block_object_dispose(v28, 8);
      _Block_object_dispose(&v30, 8);
      return v16;
    }
    v39 = 0;
    v40 = (uint64_t)&v39;
    v41 = 0x2000000000;
    v42 = 0;
    *(_QWORD *)multiuser_flags = 0;
    v35 = (uint64_t)multiuser_flags;
    v36 = 0x2000000000;
    v37 = 16;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2000000000;
    v48 = 0;
    v48 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
    if (v46[3])
    {
      DarwinDirectoryRecordStoreApply();
      if (*(_QWORD *)(v40 + 24))
        v16 = LI_ils_create("L4488s4@", v9, v10, v11, v12, v13, v14, v15, a1);
      else
        v16 = 0;
      _Block_object_dispose(&v45, 8);
      free((void *)v46[3]);
      _Block_object_dispose(multiuser_flags, 8);
      _Block_object_dispose(&v39, 8);
      goto LABEL_14;
    }
    darwin_directory_grouplist_cold_1();
LABEL_16:
    v8 = mbr_identifier_translate_cold_2();
LABEL_17:
    LODWORD(v49) = 0;
    multiuser_flags[0] = 0;
    v18 = MEMORY[0x194021814](v8);
    if (host_get_multiuser_config_flags(v18, multiuser_flags))
      break;
    LODWORD(v50) = multiuser_flags[0] & 0x3FFFFFFF;
    *(_QWORD *)multiuser_flags = v5;
    v35 = 0x40000000;
    v36 = (uint64_t)___dd_foreach_record_with_name_block_invoke_2_0;
    v37 = (uint64_t)&unk_1E2E57480;
    v38 = v27;
    DarwinDirectoryRecordStoreApplyWithFilter();
  }
  v19 = mbr_identifier_translate_cold_2();
  return __darwin_directory_user_byname_block_invoke(v19, v20, v21, v22, v23, v24, v25, v26);
}

_OWORD *__darwin_directory_user_byname_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *result;

  result = _dd_extract_user(*(_QWORD *)(a1 + 40), a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = 1;
  return result;
}

_OWORD *_dd_extract_user(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return LI_ils_create("L4488ss44LssssL", a2, a3, a4, a5, a6, a7, a8, a1);
}

uint64_t ___dd_foreach_record_with_name_block_invoke_0(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_name_block_invoke_2_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_OWORD *__darwin_directory_user_byuid_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *result;

  result = _dd_extract_user(*(_QWORD *)(a1 + 40), a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_id_block_invoke_0(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_id_block_invoke_2_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_OWORD *__darwin_directory_user_byuuid_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *result;

  result = _dd_extract_user(*(_QWORD *)(a1 + 40), a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = 1;
  return result;
}

uint64_t ___dd_foreach_record_with_uuid_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __darwin_directory_user_all_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int *user;
  unsigned int *v10;

  user = (unsigned int *)_dd_extract_user(*(_QWORD *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  if (user)
  {
    v10 = user;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = si_list_add(*(void ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24), (uint64_t)user);
    si_item_release(v10);
  }
}

_OWORD *__darwin_directory_group_byname_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *result;

  result = _dd_extract_group(*(_QWORD *)(a1 + 40), a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = 1;
  return result;
}

_OWORD *_dd_extract_group(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return LI_ils_create("L4488ss4*", a2, a3, a4, a5, a6, a7, a8, a1);
}

_OWORD *__darwin_directory_group_bygid_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *result;

  result = _dd_extract_group(*(_QWORD *)(a1 + 40), a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = 1;
  return result;
}

_OWORD *__darwin_directory_group_byuuid_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *result;

  result = _dd_extract_group(*(_QWORD *)(a1 + 40), a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = 1;
  return result;
}

void __darwin_directory_group_all_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int *group;
  unsigned int *v10;

  group = (unsigned int *)_dd_extract_group(*(_QWORD *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  if (group)
  {
    v10 = group;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = si_list_add(*(void ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24), (uint64_t)group);
    si_item_release(v10);
  }
}

uint64_t __darwin_directory_grouplist_block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

pmaplist *__darwin_directory_grouplist_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  pmaplist **v3;
  pmaplist *result;
  const char *v6;
  pmaplist **i;
  pmaplist *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  sockaddr_in *v14;

  v3 = *(pmaplist ***)(a2 + 40);
  result = *v3;
  if (*v3)
  {
    v6 = (const char *)a1[7];
    for (i = v3 + 1; ; ++i)
    {
      result = (pmaplist *)strcmp((const char *)result, v6);
      if (!(_DWORD)result)
        break;
      v8 = *i;
      result = v8;
      if (!v8)
        return result;
    }
    v9 = *(_DWORD *)(a2 + 4);
    v10 = *(_QWORD *)(a1[4] + 8);
    v11 = *(_QWORD *)(v10 + 24);
    v12 = *(_QWORD *)(a1[5] + 8);
    if (v11 == *(_QWORD *)(v12 + 24))
    {
      *(_QWORD *)(v12 + 24) = 2 * v11;
      result = (pmaplist *)reallocf(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), 4 * *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (!v13)
      {
        __darwin_directory_grouplist_block_invoke_2_cold_1();
        return pmap_getmaps(v14);
      }
      v10 = *(_QWORD *)(a1[4] + 8);
      v11 = *(_QWORD *)(v10 + 24);
    }
    else
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
    *(_QWORD *)(v10 + 24) = v11 + 1;
    *(_DWORD *)(v13 + 4 * v11) = v9;
  }
  return result;
}

pmaplist *__cdecl pmap_getmaps(sockaddr_in *a1)
{
  CLIENT *v2;
  CLIENT *v3;
  int v5;
  pmaplist *v6;

  v6 = 0;
  v5 = -1;
  a1->sin_port = 28416;
  v2 = clnttcp_create(a1, 0x186A0u, 2u, &v5, 0x32u, 0x1F4u);
  if (v2)
  {
    v3 = v2;
    if (((uint64_t (*)(void))v2->cl_ops->cl_call)())
      clnt_perror(v3, "pmap_getmaps rpc problem");
    ((void (*)(CLIENT *))v3->cl_ops->cl_destroy)(v3);
  }
  close_NOCANCEL();
  a1->sin_port = 0;
  return v6;
}

uint64_t pmap_getport_timeout(sockaddr_in *a1, uint64_t a2, uint64_t a3, timeval a4)
{
  CLIENT *v5;
  CLIENT *v6;
  int v8;
  unsigned __int16 v9;

  if (*(_QWORD *)&a4.tv_usec)
    a4 = *(timeval *)*(_QWORD *)&a4.tv_usec;
  else
    a4.tv_sec = 5;
  v9 = 0;
  v8 = -1;
  a1->sin_port = 28416;
  v5 = clntudp_bufcreate(a1, 0x186A0u, 2u, a4, &v8, 0x190u, 0x190u);
  if (v5)
  {
    v6 = v5;
    if (((uint64_t (*)(void))v5->cl_ops->cl_call)())
    {
      rpc_createerr.cf_stat = RPC_PMAPFAILURE;
      ((void (*)(CLIENT *, rpc_err *))v6->cl_ops->cl_geterr)(v6, &rpc_createerr.cf_error);
    }
    else if (!v9)
    {
      rpc_createerr.cf_stat = RPC_PROGNOTREGISTERED;
    }
    ((void (*)(CLIENT *))v6->cl_ops->cl_destroy)(v6);
  }
  close_NOCANCEL();
  a1->sin_port = 0;
  return v9;
}

unsigned __int16 pmap_getport(sockaddr_in *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;

  v4 = 0;
  return pmap_getport_timeout(a1, *(uint64_t *)&a2, *(uint64_t *)&a3, *(timeval *)&a4);
}

int xdr_pmap(XDR *a1, pmap *a2)
{
  if (xdr_u_long(a1, &a2->pm_prog) && xdr_u_long(a1, &a2->pm_vers) && xdr_u_long(a1, &a2->pm_prot))
    return xdr_u_long(a1, &a2->pm_port);
  else
    return 0;
}

int xdr_pmaplist(XDR *a1, pmaplist **a2)
{
  char **v2;
  xdr_op x_op;
  _BOOL4 i;
  int result;
  char *v7;
  int v8;

  v2 = (char **)a2;
  x_op = a1->x_op;
  if (!a2)
    goto LABEL_3;
LABEL_2:
  for (i = *v2 == 0; ; i = 1)
  {
    v8 = !i;
    result = xdr_BOOL(a1, &v8);
    if (!result)
      break;
    if (!v8)
      return 1;
    if (x_op == XDR_FREE)
    {
      v7 = *v2;
      result = xdr_reference(a1, v2, 0x18u, (xdrproc_t)xdr_pmap);
      if (!result)
        return result;
    }
    else
    {
      result = xdr_reference(a1, v2, 0x18u, (xdrproc_t)xdr_pmap);
      if (!result)
        return result;
      v7 = *v2;
    }
    v2 = (char **)(v7 + 16);
    if (v7 != (char *)-16)
      goto LABEL_2;
LABEL_3:
    ;
  }
  return result;
}

clnt_stat pmap_rmtcall(sockaddr_in *a1, unsigned int a2, unsigned int a3, unsigned int a4, xdrproc_t a5, caddr_t a6, xdrproc_t a7, caddr_t a8, timeval a9, unsigned int *a10)
{
  CLIENT *v18;
  CLIENT *v19;
  clnt_stat v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  timeval v27;

  v26 = -1;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  a1->sin_port = 28416;
  v27.tv_sec = 3;
  *(_QWORD *)&v27.tv_usec = 0;
  v18 = clntudp_create(a1, 0x186A0u, 2u, v27, &v26);
  if (v18)
  {
    v19 = v18;
    *(_QWORD *)&v24 = __PAIR64__(a3, a2);
    DWORD2(v24) = a4;
    *(_QWORD *)&v25 = a6;
    *((_QWORD *)&v25 + 1) = a5;
    *(_QWORD *)&v22 = a10;
    *(_QWORD *)&v23 = a8;
    *((_QWORD *)&v23 + 1) = a7;
    v20 = ((uint64_t (*)(CLIENT *, uint64_t, int (__cdecl *)(XDR *, rmtcallargs *), __int128 *, int (__cdecl *)(XDR *, rmtcallres *), __int128 *, __darwin_time_t, _QWORD))v18->cl_ops->cl_call)(v18, 5, xdr_rmtcall_args, &v24, xdr_rmtcallres, &v22, a9.tv_sec, *(_QWORD *)&a9.tv_usec);
    ((void (*)(CLIENT *))v19->cl_ops->cl_destroy)(v19);
  }
  else
  {
    v20 = RPC_FAILED;
  }
  close_NOCANCEL();
  a1->sin_port = 0;
  return v20;
}

int xdr_rmtcall_args(XDR *a1, rmtcallargs *a2)
{
  int result;
  uint64_t v5;
  unsigned int *p_arglen;
  int v7;
  uint64_t v8;

  result = xdr_u_long(a1, &a2->prog);
  if (result)
  {
    result = xdr_u_long(a1, &a2->vers);
    if (result)
    {
      result = xdr_u_long(a1, &a2->proc);
      if (result)
      {
        v5 = ((uint64_t (*)(XDR *))a1->x_ops->x_getpostn)(a1);
        p_arglen = &a2->arglen;
        result = xdr_u_long(a1, &a2->arglen);
        if (result)
        {
          v7 = ((uint64_t (*)(XDR *))a1->x_ops->x_getpostn)(a1);
          result = ((uint64_t (*)(XDR *, caddr_t, _QWORD))a2->xdr_args)(a1, a2->args_ptr, 0);
          if (result)
          {
            v8 = ((uint64_t (*)(XDR *))a1->x_ops->x_getpostn)(a1);
            *p_arglen = v8 - v7;
            ((void (*)(XDR *, uint64_t))a1->x_ops->x_setpostn)(a1, v5);
            result = xdr_u_long(a1, p_arglen);
            if (result)
            {
              ((void (*)(XDR *, uint64_t))a1->x_ops->x_setpostn)(a1, v8);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

int xdr_rmtcallres(XDR *a1, rmtcallres *a2)
{
  int result;
  char *port_ptr;

  port_ptr = (char *)a2->port_ptr;
  result = xdr_reference(a1, &port_ptr, 4u, (xdrproc_t)xdr_u_long);
  if (result)
  {
    result = xdr_u_long(a1, &a2->resultslen);
    if (result)
    {
      a2->port_ptr = (unsigned int *)port_ptr;
      return ((uint64_t (*)(XDR *, caddr_t, _QWORD))a2->xdr_results)(a1, a2->results_ptr, 0);
    }
  }
  return result;
}

clnt_stat clnt_broadcast(unsigned int a1, unsigned int a2, unsigned int a3, xdrproc_t a4, char *a5, xdrproc_t a6, char *a7, int (*a8)(void))
{
  unsigned int v8;
  uint64_t (*v9)(uint64_t, _QWORD *);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(XDR *, uint64_t, _QWORD);
  char *v13;
  char *v14;
  int (__cdecl *v15)(XDR *, void *, unsigned int);
  int (__cdecl *v16)(XDR *, void *, unsigned int);
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  char *v25;
  char *v26;
  __int128 v27;
  in_addr v28;
  in_addr_t v29;
  uint64_t v30;
  char *v31;
  unsigned int v32;
  const char *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  uint64_t v39;
  int *v40;
  uint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  void (__cdecl *v46)(__rpc_xdr *);
  __darwin_time_t tv_sec;
  clnt_stat v48;
  const char *v49;
  int (__cdecl *v51)(XDR *, void *, unsigned int);
  char *v52;
  uint64_t (*v53)(uint64_t, _QWORD *);
  uint64_t v54;
  AUTH *v55;
  void (*v56)(XDR *, uint64_t, _QWORD);
  timeval v57;
  rpc_msg v58;
  __int128 v59;
  __int128 v60;
  rmtcallargs v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  int v79;
  int v80;
  XDR v81;
  int v82;
  char *v83;
  char v84[8800];
  __int128 v85;
  __int128 v86;
  _QWORD v87[2];
  uint64_t v88;
  uint64_t v89;
  _DWORD v90[20];
  uint64_t v91;

  v8 = MEMORY[0x1E0C86820](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5, a6, a7, a8);
  v53 = v9;
  v11 = v10;
  v56 = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = v8;
  v91 = *MEMORY[0x1E0C874D8];
  v55 = authunix_create_default();
  memset(&v81, 0, sizeof(v81));
  v80 = 0;
  v79 = 1;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v62 = 0;
  v88 = 0;
  v89 = 0;
  v87[0] = 0;
  v87[1] = 0;
  memset(&v61, 0, sizeof(v61));
  v59 = 0u;
  v60 = 0u;
  memset(&v58, 0, sizeof(v58));
  v57.tv_sec = 0;
  *(_QWORD *)&v57.tv_usec = 0;
  v22 = socket(2, 2, 17);
  v23 = v22;
  if (v22 < 0)
  {
    v33 = "Cannot create socket for broadcast rpc";
LABEL_63:
    perror(v33);
    v48 = RPC_CANTSEND;
    goto LABEL_64;
  }
  if (setsockopt(v22, 0xFFFF, 32, &v79, 4u) < 0)
  {
    v33 = "Cannot set socket option SO_BROADCAST";
    goto LABEL_63;
  }
  v54 = v11;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  if (__darwin_check_fd_set_overflow(v23, &v71, 0))
    *((_DWORD *)&v71 + (v23 >> 5)) |= 1 << v23;
  v82 = 8800;
  v83 = v84;
  v51 = v16;
  v52 = v14;
  if (ioctl(v23, 0xC00C6924uLL, &v82) < 0)
  {
    perror("broadcast: ioctl (get interface configuration)");
    goto LABEL_24;
  }
  if (v82 < 1)
  {
LABEL_24:
    v24 = 0;
    goto LABEL_25;
  }
  v24 = 0;
  v25 = &v84[v82];
  v26 = v84;
  do
  {
    if (v26[17] == 2)
    {
      v27 = *((_OWORD *)v26 + 1);
      v85 = *(_OWORD *)v26;
      v86 = v27;
      if (ioctl(v23, 0xC0206911uLL, &v85) < 0)
      {
        perror("broadcast: ioctl (get interface flags)");
      }
      else if ((~(unsigned __int16)v86 & 3) == 0)
      {
        if (ioctl(v23, 0xC0206923uLL, &v85) < 0)
        {
          v28.s_addr = *((_DWORD *)v26 + 5);
          v29 = inet_netof(v28);
          v90[v24] = inet_makeaddr(v29, 0).s_addr;
        }
        else
        {
          v90[v24] = DWORD1(v86);
        }
        ++v24;
      }
    }
    v32 = v26[16];
    v31 = v26 + 16;
    LODWORD(v30) = v32;
    if (v32 <= 0x10)
      v30 = 16;
    else
      v30 = v30;
    v26 = &v31[v30];
  }
  while (v26 < v25);
LABEL_25:
  v88 = 1862271488;
  v89 = 0;
  v34 = open_NOCANCEL();
  if (v34 < 0 || read_NOCANCEL() != 4)
  {
    gettimeofday(&v57, 0);
    HIDWORD(v62) = getpid() ^ LODWORD(v57.tv_sec) ^ v57.tv_usec;
  }
  if (v34 >= 1)
    close_NOCANCEL();
  v57.tv_usec = 0;
  v58.rm_xid = HIDWORD(v62);
  *(_OWORD *)&v58.rm_direction = xmmword_191FABA90;
  v58.ru.RM_cmb.cb_proc = 5;
  v35 = *(_QWORD *)&v55->ah_cred.oa_length;
  *(_OWORD *)(&v58.ru.RM_rmb.ru.RP_dr.ru.RJ_why + 1) = *(_OWORD *)&v55->ah_cred.oa_flavor;
  *((_QWORD *)&v58.ru.RM_rmb.ru.RP_dr + 3) = v35;
  v36 = *(_QWORD *)&v55->ah_verf.oa_length;
  *((_OWORD *)&v58.ru.RM_rmb.ru.RP_dr + 2) = *(_OWORD *)&v55->ah_verf.oa_flavor;
  *((_QWORD *)&v58.ru.RM_rmb + 7) = v36;
  v61.prog = v21;
  v61.vers = v20;
  v61.proc = v18;
  v61.args_ptr = v52;
  v61.xdr_args = v51;
  *(_QWORD *)&v59 = &v62;
  *(_QWORD *)&v60 = v54;
  *((_QWORD *)&v60 + 1) = v56;
  xdrmem_create(&v81, (char *)&v85, 0x578u, XDR_ENCODE);
  if (xdr_callmsg(&v81, &v58) && xdr_rmtcall_args(&v81, &v61))
  {
    v37 = ((uint64_t (*)(XDR *))v81.x_ops->x_getpostn)(&v81);
    x_destroy = v81.x_ops->x_destroy;
    if (x_destroy)
      ((void (*)(XDR *))x_destroy)(&v81);
    v57.tv_sec = 4;
    v39 = v37;
    while (2)
    {
      if (v24 >= 1)
      {
        v40 = v90;
        v41 = v24;
        while (1)
        {
          v42 = *v40++;
          HIDWORD(v88) = v42;
          if (sendto_NOCANCEL() != v39)
            break;
          if (!--v41)
            goto LABEL_39;
        }
        v33 = "Cannot send broadcast packet";
        goto LABEL_63;
      }
LABEL_39:
      if (v53)
      {
        while (1)
        {
          while (1)
          {
            v58.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
            v58.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = (caddr_t)&v59;
            v58.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_rmtcallres;
            v67 = v75;
            v68 = v76;
            v69 = v77;
            v70 = v78;
            v63 = v71;
            v64 = v72;
            v65 = v73;
            v66 = v74;
            v43 = select_NOCANCEL();
            if (v43 != -1)
              break;
            if (*__error() != 4)
            {
              v49 = "Broadcast select problem";
LABEL_60:
              perror(v49);
              v48 = RPC_CANTRECV;
              goto LABEL_64;
            }
          }
          if (!v43)
            break;
          while (1)
          {
            v80 = 16;
            v44 = recvfrom_NOCANCEL();
            if ((v44 & 0x80000000) == 0)
              break;
            if (*__error() != 4)
            {
              v49 = "Cannot receive reply to broadcast";
              goto LABEL_60;
            }
          }
          if ((v44 & 0xFFFFFFFC) != 0)
          {
            xdrmem_create(&v81, v84, v44, XDR_DECODE);
            v45 = 0;
            if (xdr_replymsg(&v81, &v58)
              && v58.rm_xid == HIDWORD(v62)
              && !v58.ru.RM_cmb.cb_rpcvers
              && !v58.ru.RM_cmb.cb_cred.oa_length)
            {
              WORD1(v87[0]) = bswap32((unsigned __int16)v62) >> 16;
              v45 = v53(v54, v87);
            }
            v81.x_op = XDR_FREE;
            v58.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_void;
            xdr_replymsg(&v81, &v58);
            v56(&v81, v54, 0);
            v46 = v81.x_ops->x_destroy;
            if (v46)
              ((void (*)(XDR *))v46)(&v81);
            if (v45)
              goto LABEL_61;
          }
        }
        tv_sec = v57.tv_sec;
        v57.tv_sec += 2;
        v48 = RPC_TIMEDOUT;
        if (tv_sec < 13)
          continue;
      }
      else
      {
LABEL_61:
        v48 = RPC_SUCCESS;
      }
      break;
    }
  }
  else
  {
    v48 = RPC_CANTENCODEARGS;
  }
LABEL_64:
  close_NOCANCEL();
  v55->ah_ops->ah_destroy(v55);
  return v48;
}

uint64_t pmap_wakeup()
{
  uint64_t v0;

  if (socket(1, 1, 0) == -1)
    return 0xFFFFFFFFLL;
  if (connect_NOCANCEL() == -1)
  {
    v0 = 0xFFFFFFFFLL;
  }
  else
  {
    read_NOCANCEL();
    v0 = 0;
  }
  close_NOCANCEL();
  return v0;
}

int xdr_callmsg(XDR *a1, rpc_msg *a2)
{
  xdr_op x_op;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  const void *v10;
  size_t v11;
  int result;
  unsigned int oa_length;
  unsigned int v14;
  _DWORD *v15;
  msg_type rm_direction;
  _DWORD *v17;
  size_t v18;
  size_t v19;
  caddr_t v20;
  caddr_t oa_base;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  char *v25;

  x_op = a1->x_op;
  if (a1->x_op == XDR_ENCODE)
  {
    oa_length = a2->ru.RM_cmb.cb_cred.oa_length;
    if (oa_length > 0x190)
      return 0;
    v14 = a2->ru.RM_cmb.cb_verf.oa_length;
    if (v14 > 0x190)
      return 0;
    v15 = (_DWORD *)((uint64_t (*)(XDR *, _QWORD))a1->x_ops->x_inline)(a1, ((oa_length + 3) & 0xFFFFFFFC) + ((v14 + 3) & 0xFFFFFFFC) + 40);
    if (v15)
    {
      rm_direction = a2->rm_direction;
      *v15 = bswap32(a2->rm_xid);
      v15[1] = bswap32(rm_direction);
      if (rm_direction)
        return 0;
      v15[2] = bswap32(a2->ru.RM_cmb.cb_rpcvers);
      if (a2->ru.RM_cmb.cb_rpcvers != 2)
        return 0;
      v15[3] = bswap32(a2->ru.RM_cmb.cb_prog);
      v15[4] = bswap32(a2->ru.RM_cmb.cb_vers);
      v15[5] = bswap32(a2->ru.RM_cmb.cb_proc);
      v15[6] = bswap32(a2->ru.RM_rmb.ru.RP_dr.ru.RJ_versions.high);
      v17 = v15 + 8;
      v15[7] = bswap32(a2->ru.RM_cmb.cb_cred.oa_length);
      v18 = a2->ru.RM_cmb.cb_cred.oa_length;
      if ((_DWORD)v18)
      {
        memmove(v15 + 8, a2->ru.RM_cmb.cb_cred.oa_base, v18);
        v17 = (_DWORD *)((char *)v17 + ((a2->ru.RM_cmb.cb_cred.oa_length + 3) & 0xFFFFFFFC));
      }
      *v17 = bswap32(a2->ru.RM_rmb.ru.RP_ar.ru.AR_versions.low);
      v17[1] = bswap32(a2->ru.RM_cmb.cb_verf.oa_length);
      v19 = a2->ru.RM_cmb.cb_verf.oa_length;
      if ((_DWORD)v19)
      {
        v20 = (caddr_t)(v17 + 2);
        oa_base = a2->ru.RM_cmb.cb_verf.oa_base;
LABEL_46:
        memmove(v20, oa_base, v19);
      }
      return 1;
    }
    x_op = a1->x_op;
  }
  if (x_op == XDR_DECODE
    && (v5 = (unsigned int *)((uint64_t (*)(XDR *, uint64_t))a1->x_ops->x_inline)(a1, 32)) != 0)
  {
    a2->rm_xid = bswap32(*v5);
    v6 = v5[1];
    a2->rm_direction = bswap32(v6);
    if (v6)
      return 0;
    v7 = v5[2];
    a2->ru.RM_cmb.cb_rpcvers = bswap32(v7);
    if (v7 != 0x2000000)
      return 0;
    a2->ru.RM_cmb.cb_prog = bswap32(v5[3]);
    a2->ru.RM_cmb.cb_vers = bswap32(v5[4]);
    a2->ru.RM_cmb.cb_proc = bswap32(v5[5]);
    a2->ru.RM_cmb.cb_cred.oa_flavor = bswap32(v5[6]);
    v8 = v5[7];
    v9 = bswap32(v8);
    a2->ru.RM_cmb.cb_cred.oa_length = v9;
    if (v8)
    {
      if (v9 > 0x190)
        return 0;
      if (!a2->ru.RM_cmb.cb_cred.oa_base)
      {
        a2->ru.RM_cmb.cb_cred.oa_base = (caddr_t)malloc_type_calloc(1uLL, v9, 0x61ADAD25uLL);
        LODWORD(v9) = a2->ru.RM_cmb.cb_cred.oa_length;
      }
      v10 = (const void *)((uint64_t (*)(XDR *, _QWORD))a1->x_ops->x_inline)(a1, ((_DWORD)v9 + 3) & 0xFFFFFFFC);
      v11 = a2->ru.RM_cmb.cb_cred.oa_length;
      if (v10)
      {
        memmove(a2->ru.RM_cmb.cb_cred.oa_base, v10, v11);
      }
      else
      {
        result = xdr_opaque(a1, a2->ru.RM_cmb.cb_cred.oa_base, v11);
        if (!result)
          return result;
      }
    }
    v22 = (unsigned int *)((uint64_t (*)(XDR *, uint64_t))a1->x_ops->x_inline)(a1, 8);
    if (v22)
    {
      a2->ru.RM_cmb.cb_verf.oa_flavor = bswap32(*v22);
      v23 = bswap32(v22[1]);
      a2->ru.RM_cmb.cb_verf.oa_length = v23;
      if (!v23)
        return 1;
      goto LABEL_35;
    }
    result = xdr_enum(a1, &a2->ru.RM_cmb.cb_verf.oa_flavor);
    if (result)
    {
      result = xdr_u_int(a1, &a2->ru.RM_cmb.cb_verf.oa_length);
      if (result)
      {
        v23 = a2->ru.RM_cmb.cb_verf.oa_length;
        if (!v23)
          return 1;
LABEL_35:
        if (v23 > 0x190)
          return 0;
        if (!a2->ru.RM_cmb.cb_verf.oa_base)
        {
          a2->ru.RM_cmb.cb_verf.oa_base = (caddr_t)malloc_type_calloc(1uLL, v23, 0xB63AB26AuLL);
          v23 = a2->ru.RM_cmb.cb_verf.oa_length;
        }
        v24 = ((uint64_t (*)(XDR *, _QWORD))a1->x_ops->x_inline)(a1, (v23 + 3) & 0xFFFFFFFC);
        v19 = a2->ru.RM_cmb.cb_verf.oa_length;
        if (v24)
        {
          v25 = (char *)v24;
          v20 = a2->ru.RM_cmb.cb_verf.oa_base;
          oa_base = v25;
          goto LABEL_46;
        }
        result = xdr_opaque(a1, a2->ru.RM_cmb.cb_verf.oa_base, v19);
        if (!result)
          return result;
        return 1;
      }
    }
  }
  else
  {
    result = xdr_u_long(a1, &a2->rm_xid);
    if (result)
    {
      result = xdr_enum(a1, (int *)&a2->rm_direction);
      if (result)
      {
        if (a2->rm_direction)
          return 0;
        result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_rpcvers);
        if (!result)
          return result;
        if (a2->ru.RM_cmb.cb_rpcvers != 2)
          return 0;
        result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_prog);
        if (result)
        {
          result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_vers);
          if (result)
          {
            result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_proc);
            if (result)
            {
              result = xdr_opaque_auth(a1, (uint64_t)&a2->ru.RM_rmb.ru.RP_ar.ar_verf.oa_base);
              if (result)
                return xdr_opaque_auth(a1, (uint64_t)&a2->ru.RM_rmb.ru.RP_ar.ru.AR_results);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t xdr_opaque_auth(XDR *a1, uint64_t a2)
{
  uint64_t result;

  result = xdr_enum(a1, (int *)a2);
  if ((_DWORD)result)
    return xdr_bytes(a1, (char **)(a2 + 8), (unsigned int *)(a2 + 16), 0x190u);
  return result;
}

int xdr_des_block(XDR *a1, des_block *a2)
{
  return xdr_opaque(a1, (char *)a2, 8u);
}

uint64_t xdr_accepted_reply(XDR *a1, uint64_t a2)
{
  uint64_t result;
  int v5;

  result = xdr_opaque_auth(a1, a2);
  if ((_DWORD)result)
  {
    result = xdr_enum(a1, (int *)(a2 + 24));
    if ((_DWORD)result)
    {
      v5 = *(_DWORD *)(a2 + 24);
      if (v5 == 2)
      {
        result = xdr_u_long(a1, (unsigned int *)(a2 + 32));
        if ((_DWORD)result)
          return xdr_u_long(a1, (unsigned int *)(a2 + 36));
      }
      else if (v5)
      {
        return 1;
      }
      else
      {
        return (*(uint64_t (**)(XDR *, _QWORD, _QWORD))(a2 + 40))(a1, *(_QWORD *)(a2 + 32), 0);
      }
    }
  }
  return result;
}

uint64_t xdr_rejected_reply(XDR *a1, uint64_t a2)
{
  if (!xdr_enum(a1, (int *)a2))
    return 0;
  if (*(_DWORD *)a2 != 1)
  {
    if (!*(_DWORD *)a2 && xdr_u_long(a1, (unsigned int *)(a2 + 4)))
      return xdr_u_long(a1, (unsigned int *)(a2 + 8));
    return 0;
  }
  return xdr_enum(a1, (int *)(a2 + 4));
}

int xdr_replymsg(XDR *a1, rpc_msg *a2)
{
  if (xdr_u_long(a1, &a2->rm_xid) && xdr_enum(a1, (int *)&a2->rm_direction) && a2->rm_direction == REPLY)
    return xdr_union(a1, (int *)&a2->ru, (char *)&a2->ru.RM_rmb.ru, (const xdr_discrim *)&reply_dscrm, 0);
  else
    return 0;
}

int xdr_callhdr(XDR *a1, rpc_msg *a2)
{
  msg_type *p_rm_direction;

  *(_QWORD *)&a2->rm_direction = 0x200000000;
  p_rm_direction = &a2->rm_direction;
  if (a1->x_op == XDR_ENCODE
    && xdr_u_long(a1, &a2->rm_xid)
    && xdr_enum(a1, (int *)p_rm_direction)
    && xdr_u_long(a1, (unsigned int *)p_rm_direction + 1)
    && xdr_u_long(a1, &a2->ru.RM_cmb.cb_prog))
  {
    return xdr_u_long(a1, &a2->ru.RM_cmb.cb_vers);
  }
  else
  {
    return 0;
  }
}

void _seterr_reply(rpc_msg *a1, rpc_err *a2)
{
  unsigned int cb_rpcvers;
  unsigned int oa_length;
  unsigned int cb_vers;
  unsigned int cb_proc;
  clnt_stat v6;

  cb_rpcvers = a1->ru.RM_cmb.cb_rpcvers;
  if (cb_rpcvers == 1)
  {
    cb_vers = a1->ru.RM_cmb.cb_vers;
    if (cb_vers)
    {
      if (cb_vers == 1)
      {
        a2->re_status = RPC_AUTHERROR;
        cb_proc = a1->ru.RM_cmb.cb_proc;
LABEL_9:
        a2->ru.RE_errno = cb_proc;
        return;
      }
      *(_QWORD *)&a2->re_status = 0x100000010;
    }
    else
    {
      a2->re_status = RPC_VERSMISMATCH;
      a2->ru.RE_errno = a1->ru.RM_cmb.cb_proc;
      cb_vers = a1->ru.RM_rmb.ru.RP_dr.ru.RJ_versions.high;
    }
LABEL_15:
    a2->ru.RE_vers.high = cb_vers;
    return;
  }
  if (cb_rpcvers)
  {
    a2->re_status = RPC_FAILED;
    cb_proc = a1->ru.RM_cmb.cb_rpcvers;
    goto LABEL_9;
  }
  oa_length = a1->ru.RM_cmb.cb_cred.oa_length;
  switch(oa_length)
  {
    case 0u:
      a2->re_status = RPC_SUCCESS;
      return;
    case 1u:
      v6 = RPC_PROGUNAVAIL;
      goto LABEL_19;
    case 2u:
      a2->re_status = RPC_PROGVERSMISMATCH;
      a2->ru.RE_errno = a1->ru.RM_cmb.cb_verf.oa_flavor;
      cb_vers = a1->ru.RM_rmb.ru.RP_ar.ru.AR_versions.high;
      goto LABEL_15;
    case 3u:
      v6 = RPC_PROCUNAVAIL;
      goto LABEL_19;
    case 4u:
      v6 = RPC_CANTDECODEARGS;
      goto LABEL_19;
    case 5u:
      v6 = RPC_SYSTEMERROR;
LABEL_19:
      a2->re_status = v6;
      break;
    default:
      *(_QWORD *)&a2->re_status = 16;
      a2->ru.RE_vers.high = oa_length;
      break;
  }
}

void xprt_register(SVCXPRT *a1)
{
  unint64_t xp_sock;
  _QWORD *v3;
  int v4;

  xp_sock = a1->xp_sock;
  v3 = (_QWORD *)xports;
  if (!xports)
  {
    v3 = malloc_type_calloc(1uLL, 0x2000uLL, 0x2004093837F09uLL);
    xports = (uint64_t)v3;
  }
  if ((int)xp_sock <= 1023)
  {
    v3[xp_sock] = a1;
    if (__darwin_check_fd_set_overflow(xp_sock, &svc_fdset, 0))
      *(__int32_t *)((char *)svc_fdset.fds_bits + ((xp_sock >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << xp_sock;
    v4 = svc_maxfd;
    if (svc_maxfd <= (int)xp_sock)
      v4 = xp_sock;
    svc_maxfd = v4;
  }
}

void xprt_unregister(SVCXPRT *a1)
{
  uint64_t xp_sock;
  int v2;
  uint64_t v3;
  BOOL v4;

  xp_sock = a1->xp_sock;
  if ((int)xp_sock <= 1023 && *(SVCXPRT **)(xports + 8 * (int)xp_sock) == a1)
  {
    *(_QWORD *)(xports + 8 * (int)xp_sock) = 0;
    if (__darwin_check_fd_set_overflow(xp_sock, &svc_fdset, 0))
      *(__int32_t *)((char *)svc_fdset.fds_bits + (((unint64_t)(int)xp_sock >> 3) & 0x1FFFFFFFFFFFFFFCLL)) &= ~(1 << xp_sock);
    if ((_DWORD)xp_sock == svc_maxfd)
    {
      v2 = (xp_sock & ((int)xp_sock >> 31)) - 1;
      v3 = xp_sock - 1;
      while (1)
      {
        v4 = __OFSUB__((_DWORD)xp_sock, 1);
        LODWORD(xp_sock) = xp_sock - 1;
        if ((int)xp_sock < 0 != v4)
          break;
        if (*(_QWORD *)(xports + 8 * v3--))
          goto LABEL_11;
      }
      LODWORD(xp_sock) = v2;
LABEL_11:
      svc_maxfd = xp_sock;
    }
  }
}

int svc_register(SVCXPRT *a1, unsigned int a2, unsigned int a3, void (*a4)(void), int a5)
{
  uint64_t v10;
  _DWORD *v11;

  v10 = svc_head;
  if (svc_head)
  {
    while (*(_DWORD *)(v10 + 8) != a2 || *(_DWORD *)(v10 + 12) != a3)
    {
      v10 = *(_QWORD *)v10;
      if (!v10)
        goto LABEL_5;
    }
    if (*(void (**)(void))(v10 + 16) != a4)
    {
      LODWORD(v11) = 0;
      return (int)v11;
    }
  }
  else
  {
LABEL_5:
    v11 = malloc_type_calloc(1uLL, 0x18uLL, 0x10A00409D8FE3EAuLL);
    if (!v11)
      return (int)v11;
    v11[2] = a2;
    v11[3] = a3;
    *((_QWORD *)v11 + 2) = a4;
    *(_QWORD *)v11 = svc_head;
    svc_head = (uint64_t)v11;
  }
  if (a5)
    LODWORD(v11) = pmap_set(a2, a3, a5, a1->xp_port);
  else
    LODWORD(v11) = 1;
  return (int)v11;
}

void svc_unregister(unsigned int a1, unsigned int a2)
{
  uint64_t *v2;
  uint64_t *v5;
  uint64_t *v6;

  v2 = (uint64_t *)svc_head;
  if (svc_head)
  {
    v5 = 0;
    while (1)
    {
      v6 = v2;
      if (*((_DWORD *)v2 + 2) == a1 && *((_DWORD *)v2 + 3) == a2)
        break;
      v2 = (uint64_t *)*v2;
      v5 = v6;
      if (!*v6)
        return;
    }
    if (!v5)
      v5 = &svc_head;
    *v5 = *v2;
    free(v2);
    pmap_unset(a1, a2);
  }
}

int svc_sendreply(SVCXPRT *a1, xdrproc_t a2, char *a3)
{
  __int128 v3;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0u;
  v7 = 0u;
  v3 = *(_OWORD *)&a1->xp_verf.oa_flavor;
  v5[0] = 0u;
  v5[1] = v3;
  DWORD1(v5[0]) = 1;
  *(_QWORD *)&v6 = *(_QWORD *)&a1->xp_verf.oa_length;
  *(_QWORD *)&v7 = a3;
  *((_QWORD *)&v7 + 1) = a2;
  v8 = 0;
  return a1->xp_ops->xp_reply(a1, v5, a3);
}

void svcerr_noproc(SVCXPRT *a1)
{
  __int128 v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0u;
  v4 = 0u;
  v1 = *(_OWORD *)&a1->xp_verf.oa_flavor;
  v2[0] = 0u;
  v2[1] = v1;
  DWORD1(v2[0]) = 1;
  *(_QWORD *)&v3 = *(_QWORD *)&a1->xp_verf.oa_length;
  DWORD2(v3) = 3;
  a1->xp_ops->xp_reply(a1, v2);
}

void svcerr_decode(SVCXPRT *a1)
{
  __int128 v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0u;
  v4 = 0u;
  v1 = *(_OWORD *)&a1->xp_verf.oa_flavor;
  v2[0] = 0u;
  v2[1] = v1;
  DWORD1(v2[0]) = 1;
  *(_QWORD *)&v3 = *(_QWORD *)&a1->xp_verf.oa_length;
  DWORD2(v3) = 4;
  a1->xp_ops->xp_reply(a1, v2);
}

void svcerr_systemerr(SVCXPRT *a1)
{
  __int128 v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0u;
  v4 = 0u;
  v1 = *(_OWORD *)&a1->xp_verf.oa_flavor;
  v2[0] = 0u;
  v2[1] = v1;
  DWORD1(v2[0]) = 1;
  *(_QWORD *)&v3 = *(_QWORD *)&a1->xp_verf.oa_length;
  DWORD2(v3) = 5;
  a1->xp_ops->xp_reply(a1, v2);
}

void svcerr_auth(SVCXPRT *a1, auth_stat a2)
{
  __int128 v2;
  int v3;
  auth_stat v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = 0u;
  v5 = 0;
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  *(_QWORD *)((char *)&v2 + 4) = 0x100000001;
  v3 = 1;
  v4 = a2;
  a1->xp_ops->xp_reply(a1, &v2);
}

void svcerr_weakauth(SVCXPRT *a1)
{
  _OWORD v1[4];
  uint64_t v2;

  v1[0] = 0u;
  v2 = 0;
  memset(&v1[2], 0, 32);
  *(_QWORD *)((char *)v1 + 4) = 0x100000001;
  v1[1] = 0x500000001uLL;
  a1->xp_ops->xp_reply(a1, v1);
}

void svcerr_noprog(SVCXPRT *a1)
{
  __int128 v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0u;
  v4 = 0u;
  v1 = *(_OWORD *)&a1->xp_verf.oa_flavor;
  v2[0] = 0u;
  v2[1] = v1;
  DWORD1(v2[0]) = 1;
  *(_QWORD *)&v3 = *(_QWORD *)&a1->xp_verf.oa_length;
  DWORD2(v3) = 1;
  a1->xp_ops->xp_reply(a1, v2);
}

void svcerr_progvers(SVCXPRT *a1, unsigned int a2, unsigned int a3)
{
  __int128 v3;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0u;
  v6 = 0u;
  v7 = 0;
  v3 = *(_OWORD *)&a1->xp_verf.oa_flavor;
  v4[0] = 0u;
  v4[1] = v3;
  DWORD1(v4[0]) = 1;
  *(_QWORD *)&v5 = *(_QWORD *)&a1->xp_verf.oa_length;
  DWORD2(v5) = 2;
  LODWORD(v6) = a2;
  DWORD1(v6) = a3;
  a1->xp_ops->xp_reply(a1, v4, *(_QWORD *)&a3);
}

void svc_getreq(int a1)
{
  fd_set v1;

  memset(&v1.fds_bits[1], 0, 124);
  v1.fds_bits[0] = a1;
  svc_getreqset(&v1);
}

void svc_getreqset(fd_set *a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  __int128 *v6;
  auth_stat v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  svc_req v15;
  rpc_msg v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD v24[52];

  v24[50] = *MEMORY[0x1E0C874D8];
  *(_OWORD *)(&v16.ru.RM_rmb.ru.RP_dr + 2) = 0uLL;
  memset(&v16, 0, 32);
  memset(&v15, 0, 40);
  v16.ru.RM_cmb.cb_cred.oa_base = &v22;
  v16.ru.RM_cmb.cb_verf.oa_base = (caddr_t)&v23;
  *((_QWORD *)&v16.ru.RM_rmb + 7) = 0;
  v15.rq_clntcred = (caddr_t)v24;
  v15.rq_xprt = 0;
  v1 = svc_maxfd;
  if ((svc_maxfd & 0x80000000) == 0)
  {
    v2 = 0;
    while (1)
    {
      v3 = a1->fds_bits[0];
      a1 = (fd_set *)((char *)a1 + 4);
      if (v3)
        break;
LABEL_32:
      v2 += 32;
      if (v2 > v1)
        return;
    }
    v4 = __clz(__rbit32(v3));
    while ((int)((v2 | 1) + v4) <= svc_maxfd + 1)
    {
      v5 = *(_QWORD *)(xports + 8 * (int)(v4 | v2));
      if (v5)
      {
        v6 = (__int128 *)(v5 + 40);
        do
        {
          if ((**(unsigned int (***)(uint64_t, rpc_msg *))(v5 + 8))(v5, &v16))
          {
            v15.rq_xprt = (SVCXPRT *)v5;
            *(_QWORD *)&v15.rq_prog = *(_QWORD *)(&v16.ru.RM_rmb.rp_stat + 1);
            v15.rq_proc = v16.ru.RM_cmb.cb_proc;
            v15.rq_cred = v16.ru.RM_cmb.cb_cred;
            v7 = _authenticate(&v15, &v16);
            if (v7)
            {
              v17 = 0u;
              *((_QWORD *)&v18 + 1) = 0;
              v21 = 0;
              v19 = 0u;
              v20 = 0u;
              *(_QWORD *)((char *)&v17 + 4) = 0x100000001;
              LODWORD(v18) = 1;
              DWORD1(v18) = v7;
            }
            else
            {
              v8 = svc_head;
              if (svc_head)
              {
                v9 = 0;
                v10 = 0;
                v11 = -1;
                do
                {
                  if (*(_DWORD *)(v8 + 8) == v15.rq_prog)
                  {
                    v12 = *(_DWORD *)(v8 + 12);
                    if (v12 == v15.rq_vers)
                    {
                      (*(void (**)(svc_req *, uint64_t))(v8 + 16))(&v15, v5);
                      goto LABEL_25;
                    }
                    if (v12 < v11)
                      v11 = *(_DWORD *)(v8 + 12);
                    if (v12 > v9)
                      v9 = *(_DWORD *)(v8 + 12);
                    v10 = 1;
                  }
                  v8 = *(_QWORD *)v8;
                }
                while (v8);
                if (!v10)
                  goto LABEL_23;
                v21 = 0;
                v19 = 0u;
                v20 = 0u;
                v17 = 0u;
                v18 = 0u;
                DWORD1(v17) = 1;
                v18 = *v6;
                *(_QWORD *)&v19 = *(_QWORD *)(v5 + 56);
                DWORD2(v19) = 2;
                *(_QWORD *)&v20 = __PAIR64__(v9, v11);
              }
              else
              {
LABEL_23:
                v21 = 0;
                v19 = 0u;
                v20 = 0u;
                v17 = 0u;
                v18 = 0u;
                DWORD1(v17) = 1;
                v18 = *v6;
                *(_QWORD *)&v19 = *(_QWORD *)(v5 + 56);
                DWORD2(v19) = 1;
              }
            }
            (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)(v5 + 8) + 24))(v5, &v17);
          }
LABEL_25:
          v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 8))(v5);
        }
        while (v13 == 1);
        if (!v13)
          (*(void (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 40))(v5);
      }
      v3 ^= 1 << v4;
      v4 = __clz(__rbit32(v3));
      if (!v3)
      {
        v1 = svc_maxfd;
        goto LABEL_32;
      }
    }
  }
}

auth_stat _authenticate(svc_req *a1, rpc_msg *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  SVCXPRT *rq_xprt;
  authunix_parms *rq_clntcred;
  uint64_t oa_length;
  unsigned int *v10;
  size_t v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  int *aup_gids;
  uint64_t v18;
  unsigned int v19;
  auth_stat v20;
  SVCXPRT *v21;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  XDR v23;
  uint64_t v24;
  uint64_t v25;

  v4 = *(_OWORD *)(&a2->ru.RM_rmb.ru.RP_dr.ru.RJ_why + 1);
  *(_QWORD *)&a1->rq_cred.oa_length = *((_QWORD *)&a2->ru.RM_rmb.ru.RP_dr + 3);
  *(_OWORD *)&a1->rq_cred.oa_flavor = v4;
  rq_xprt = a1->rq_xprt;
  rq_xprt->xp_verf.oa_flavor = _null_auth.oa_flavor;
  rq_xprt->xp_verf.oa_length = 0;
  switch(a1->rq_cred.oa_flavor)
  {
    case 0:
      return 0;
    case 1:
      v24 = v2;
      v25 = v3;
      memset(&v23, 0, sizeof(v23));
      rq_clntcred = (authunix_parms *)a1->rq_clntcred;
      rq_clntcred->aup_machname = (char *)&rq_clntcred[1];
      rq_clntcred->aup_gids = &rq_clntcred[7].aup_uid;
      oa_length = a2->ru.RM_cmb.cb_cred.oa_length;
      xdrmem_create(&v23, a2->ru.RM_cmb.cb_cred.oa_base, oa_length, XDR_DECODE);
      v10 = (unsigned int *)((uint64_t (*)(XDR *, uint64_t))v23.x_ops->x_inline)(&v23, oa_length);
      if (v10)
      {
        rq_clntcred->aup_time = bswap32(*v10);
        v11 = bswap32(v10[1]);
        if (v11 > 0xFF)
          goto LABEL_17;
        v12 = v10 + 2;
        memmove(rq_clntcred->aup_machname, v10 + 2, v11);
        rq_clntcred->aup_machname[v11] = 0;
        v13 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
        rq_clntcred->aup_uid = bswap32(*(unsigned int *)((char *)v12 + v13));
        rq_clntcred->aup_gid = bswap32(*(unsigned int *)((char *)v12 + v13 + 4));
        v14 = *(unsigned int *)((char *)v12 + v13 + 8);
        v15 = bswap32(v14);
        if (v15 > 0x10)
          goto LABEL_17;
        rq_clntcred->aup_len = v15;
        if (v14)
        {
          v16 = (unsigned int *)((char *)v12 + v13 + 12);
          aup_gids = rq_clntcred->aup_gids;
          if (v15 <= 1)
            v18 = 1;
          else
            v18 = v15;
          do
          {
            v19 = *v16++;
            *aup_gids++ = bswap32(v19);
            --v18;
          }
          while (v18);
        }
        if (v13 + 4 * v15 + 20 > oa_length)
          goto LABEL_17;
LABEL_15:
        v20 = AUTH_OK;
        v21 = a1->rq_xprt;
        v21->xp_verf.oa_flavor = 0;
        v21->xp_verf.oa_length = 0;
        goto LABEL_18;
      }
      if (xdr_authunix_parms(&v23, rq_clntcred))
        goto LABEL_15;
      v23.x_op = XDR_FREE;
      xdr_authunix_parms(&v23, rq_clntcred);
LABEL_17:
      v20 = AUTH_BADCRED;
LABEL_18:
      x_destroy = v23.x_ops->x_destroy;
      if (x_destroy)
        ((void (*)(XDR *))x_destroy)(&v23);
      return v20;
    case 2:
      return 2;
    default:
      return 2;
  }
}

SVCXPRT *svcraw_create(void)
{
  char *v0;
  SVCXPRT *v1;

  v0 = (char *)malloc_type_calloc(1uLL, 0x2470uLL, 0x10F004012DF63FBuLL);
  if (!v0)
    return 0;
  v1 = (SVCXPRT *)(v0 + 8800);
  *((_DWORD *)v0 + 2200) = 0;
  *((_WORD *)v0 + 4402) = 0;
  *((_QWORD *)v0 + 1101) = server_ops;
  *((_QWORD *)v0 + 1106) = v0 + 8928;
  xdrmem_create((XDR *)v0 + 185, v0, 0x2260u, XDR_FREE);
  return v1;
}

uint64_t svcraw_recv()
{
  return 0;
}

uint64_t svcraw_getargs()
{
  return 0;
}

uint64_t svcraw_reply()
{
  return 0;
}

uint64_t svcraw_freeargs()
{
  return 0;
}

uint64_t svcraw_stat()
{
  return 2;
}

SVCXPRT *__cdecl svctcp_create(int a1, unsigned int a2, unsigned int a3)
{
  int v6;
  char *v7;
  char *v8;
  SVCXPRT *v9;
  SVCXPRT *v10;
  socklen_t v12;
  sockaddr_in v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 16;
  v6 = a1;
  if (a1 == -1)
  {
    v6 = socket(2, 1, 6);
    if (v6 < 0)
    {
      perror("svctcp_.c - udp socket creation problem");
      return 0;
    }
  }
  *(_QWORD *)&v13.sin_len = 512;
  *(_QWORD *)v13.sin_zero = 0;
  if (bindresvport(v6, &v13))
  {
    v13.sin_port = 0;
    bind(v6, (const sockaddr *)&v13, 0x10u);
  }
  if (getsockname(v6, (sockaddr *)&v13, &v12) || listen(v6, 2))
  {
    perror("svctcp_.c - cannot getsockname or listen");
    if (a1 == -1)
      close_NOCANCEL();
    return 0;
  }
  v7 = (char *)malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
  if (!v7)
  {
    fwrite("svctcp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
    return 0;
  }
  v8 = v7;
  *(_DWORD *)v7 = a2;
  *((_DWORD *)v7 + 1) = a3;
  v9 = (SVCXPRT *)malloc_type_calloc(1uLL, 0x50uLL, 0x10300405518D66FuLL);
  v10 = v9;
  if (v9)
  {
    v9->xp_p2 = 0;
    v9->xp_verf = _null_auth;
    v9->xp_p1 = v8;
    v9->xp_ops = (SVCXPRT::xp_ops *)svctcp_rendezvous_op;
    v9->xp_port = bswap32(v13.sin_port) >> 16;
    v9->xp_sock = v6;
    xprt_register(v9);
  }
  else
  {
    free(v8);
    fwrite("svctcp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
  }
  return v10;
}

uint64_t rendezvous_request(uint64_t a1)
{
  unsigned int *v1;
  int v2;
  SVCXPRT *v3;

  v1 = *(unsigned int **)(a1 + 64);
  while (1)
  {
    v2 = accept_NOCANCEL();
    if ((v2 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
      return 0;
  }
  v3 = makefd_xprt(v2, *v1, v1[1]);
  v3->xp_raddr = 0uLL;
  v3->xp_addrlen = 16;
  return 0;
}

void svctcp_destroy(SVCXPRT *a1)
{
  _QWORD *xp_p1;
  void (*v3)(_QWORD *);

  xp_p1 = a1->xp_p1;
  xprt_unregister(a1);
  close_NOCANCEL();
  if (a1->xp_port)
  {
    a1->xp_port = 0;
  }
  else
  {
    v3 = *(void (**)(_QWORD *))(xp_p1[2] + 56);
    if (v3)
      v3(xp_p1 + 1);
  }
  free(xp_p1);
  free(a1);
}

uint64_t rendezvous_stat()
{
  return 2;
}

void rendezvous_abort()
{
  abort();
}

SVCXPRT *makefd_xprt(int a1, unsigned int a2, unsigned int a3)
{
  SVCXPRT *v6;
  char *v7;
  char *v8;

  v6 = (SVCXPRT *)malloc_type_calloc(1uLL, 0x50uLL, 0x10300405518D66FuLL);
  if (v6)
  {
    v7 = (char *)malloc_type_calloc(1uLL, 0x1C8uLL, 0x10F00403D1B6E79uLL);
    if (v7)
    {
      v8 = v7;
      *(_DWORD *)v7 = 2;
      xdrrec_create((XDR *)(v7 + 8), a2, a3, v6, (int (__cdecl *)(void *, void *, int))readtcp_0, (int (__cdecl *)(void *, void *, int))writetcp_0);
      v6->xp_p1 = v8;
      v6->xp_p2 = 0;
      v6->xp_verf.oa_base = v8 + 56;
      v6->xp_addrlen = 0;
      v6->xp_ops = (SVCXPRT::xp_ops *)svctcp_op;
      v6->xp_port = 0;
      v6->xp_sock = a1;
      xprt_register(v6);
    }
    else
    {
      fwrite("svc_tcp: makefd_xprt: out of memory\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
      free(v6);
      return 0;
    }
  }
  else
  {
    fwrite("svc_tcp: makefd_xprt: out of memory\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
  }
  return v6;
}

uint64_t readtcp_0(int *a1)
{
  int v2;
  int v3;
  unint64_t v4;
  uint64_t result;
  fd_set v6;

  v2 = *a1;
  v3 = 1 << *a1;
  v4 = (unint64_t)*a1 >> 5;
  do
  {
    while (1)
    {
      v6 = svc_fdset;
      if (__darwin_check_fd_set_overflow(v2, &v6, 0))
        v6.fds_bits[v4] |= v3;
      if ((int)select_NOCANCEL() > 0)
        break;
      if (*__error() != 4)
        goto LABEL_11;
    }
  }
  while (!__darwin_check_fd_set_overflow(v2, &v6, 0) || (v6.fds_bits[v4] & v3) == 0);
  result = read_NOCANCEL();
  if ((int)result <= 0)
  {
LABEL_11:
    **((_DWORD **)a1 + 8) = 0;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t writetcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v6;
  unsigned int v7;
  BOOL v8;

  v3 = a3;
  if ((int)a3 >= 1)
  {
    v6 = a3;
    while (1)
    {
      v7 = write_NOCANCEL();
      if ((v7 & 0x80000000) != 0)
        break;
      a2 += v7;
      v8 = __OFSUB__(v6, v7);
      v6 -= v7;
      if ((v6 < 0) ^ v8 | (v6 == 0))
        return v3;
    }
    **(_DWORD **)(a1 + 64) = 0;
    return 0xFFFFFFFFLL;
  }
  return v3;
}

uint64_t svctcp_recv(uint64_t a1, rpc_msg *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)(v3 + 8) = 1;
  result = xdrrec_skiprecord((XDR *)(v3 + 8));
  if ((_DWORD)result)
  {
    result = xdr_callmsg((XDR *)(v3 + 8), a2);
    if ((_DWORD)result)
    {
      *(_DWORD *)(v3 + 4) = a2->rm_xid;
      return 1;
    }
  }
  return result;
}

uint64_t svctcp_stat(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 64);
  if (!*(_DWORD *)v1)
    return 0;
  if (xdrrec_eof((XDR *)(v1 + 8)))
    return 2;
  return 1;
}

uint64_t svctcp_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  return a2(*(_QWORD *)(a1 + 64) + 8, a3, 0);
}

uint64_t svctcp_reply(uint64_t a1, rpc_msg *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)(v2 + 8) = 0;
  v2 += 8;
  a2->rm_xid = *(_DWORD *)(v2 - 4);
  v3 = xdr_replymsg((XDR *)v2, a2);
  xdrrec_endofrecord((XDR *)v2, 1);
  return v3;
}

uint64_t svctcp_freeargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)(v3 + 8) = 2;
  return a2(v3 + 8, a3, 0);
}

SVCXPRT *__cdecl svcudp_bufcreate(int a1, unsigned int a2, unsigned int a3)
{
  int v6;
  SVCXPRT *v7;
  _DWORD *v8;
  _DWORD *v9;
  unsigned int v10;
  size_t v11;
  char *v12;
  SVCXPRT *v13;
  socklen_t v15;
  sockaddr_in v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  v15 = 16;
  v6 = a1;
  if (a1 == -1)
  {
    v6 = socket(2, 2, 17);
    if (v6 < 0)
    {
      perror("svcudp_create: socket creation problem");
      return 0;
    }
  }
  *(_QWORD *)&v16.sin_len = 512;
  *(_QWORD *)v16.sin_zero = 0;
  if (bindresvport(v6, &v16))
  {
    v16.sin_port = 0;
    bind(v6, (const sockaddr *)&v16, 0x10u);
  }
  if (getsockname(v6, (sockaddr *)&v16, &v15))
  {
    perror("svcudp_create - cannot getsockname");
    if (a1 == -1)
      close_NOCANCEL();
    return 0;
  }
  v7 = (SVCXPRT *)malloc_type_calloc(1uLL, 0x50uLL, 0x10300405518D66FuLL);
  if (!v7)
  {
    fwrite("svcudp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
    return v7;
  }
  v8 = malloc_type_calloc(1uLL, 0x1D0uLL, 0x10F0040882F3134uLL);
  if (!v8)
  {
    v13 = v7;
LABEL_16:
    free(v13);
    fwrite("svcudp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
    return 0;
  }
  v9 = v8;
  if (a2 <= a3)
    v10 = a3;
  else
    v10 = a2;
  v11 = (v10 + 3) & 0xFFFFFFFC;
  *v8 = v11;
  v12 = (char *)malloc_type_calloc(1uLL, v11, 0x2983501BuLL);
  v7->xp_p1 = v12;
  if (!v12)
  {
    free(v7);
    v13 = (SVCXPRT *)v9;
    goto LABEL_16;
  }
  xdrmem_create((XDR *)(v9 + 2), v12, *v9, XDR_DECODE);
  *((_QWORD *)v9 + 57) = 0;
  v7->xp_p2 = (caddr_t)v9;
  v7->xp_verf.oa_base = (caddr_t)(v9 + 14);
  v7->xp_ops = (SVCXPRT::xp_ops *)&svcudp_op;
  v7->xp_port = bswap32(v16.sin_port) >> 16;
  v7->xp_sock = v6;
  xprt_register(v7);
  return v7;
}

SVCXPRT *__cdecl svcudp_create(int a1)
{
  return svcudp_bufcreate(a1, 0x2260u, 0x2260u);
}

uint64_t svcudp_recv(uint64_t a1, rpc_msg *a2)
{
  uint64_t v4;
  _OWORD *v5;
  int v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = (_OWORD *)(a1 + 20);
  do
  {
    *(_DWORD *)(a1 + 16) = 16;
    v6 = recvfrom_NOCANCEL();
  }
  while (v6 == -1 && *__error() == 4);
  if ((v6 & 0xFFFFFFF0) == 0)
    return 0;
  *(_DWORD *)(v4 + 8) = 1;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 + 16) + 40))(v4 + 8, 0);
  result = xdr_callmsg((XDR *)(v4 + 8), a2);
  if ((_DWORD)result)
  {
    *(_DWORD *)(v4 + 4) = a2->rm_xid;
    if (*(_QWORD *)(v4 + 456))
    {
      v8 = *(_QWORD *)(a1 + 72);
      v9 = *(_QWORD *)(v8 + 456);
      v10 = *(_QWORD *)(*(_QWORD *)(v9 + 8) + 8 * (*(_DWORD *)(v8 + 4) % (4 * *(_DWORD *)v9)));
      if (v10)
      {
        while (*(_DWORD *)v10 != *(_DWORD *)(v8 + 4)
             || *(_DWORD *)(v10 + 4) != *(_DWORD *)(v9 + 36)
             || *(_DWORD *)(v10 + 8) != *(_DWORD *)(v9 + 32)
             || *(_DWORD *)(v10 + 12) != *(_DWORD *)(v9 + 28)
             || *(_QWORD *)(v10 + 16) != *(_QWORD *)(v9 + 40)
             || *(_QWORD *)(v10 + 24) != *(_QWORD *)(v9 + 48))
        {
          v10 = *(_QWORD *)(v10 + 48);
          if (!v10)
            goto LABEL_17;
        }
        sendto_NOCANCEL();
      }
      else
      {
LABEL_17:
        *(_DWORD *)(v9 + 36) = a2->ru.RM_cmb.cb_proc;
        *(_DWORD *)(v9 + 32) = a2->ru.RM_cmb.cb_vers;
        *(_DWORD *)(v9 + 28) = a2->ru.RM_cmb.cb_prog;
        *(_OWORD *)(v9 + 40) = *v5;
      }
    }
    return 1;
  }
  return result;
}

uint64_t svcudp_stat()
{
  return 2;
}

uint64_t svcudp_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  return a2(*(_QWORD *)(a1 + 72) + 8, a3, 0);
}

uint64_t svcudp_reply(uint64_t a1, rpc_msg *a2)
{
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  BOOL v14;
  char *v15;
  char *v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  FILE *v22;
  const char *v23;

  v4 = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(v4 + 8) = 0;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 + 16) + 40))(v4 + 8, 0);
  a2->rm_xid = *(_DWORD *)(v4 + 4);
  result = xdr_replymsg((XDR *)(v4 + 8), a2);
  if ((_DWORD)result)
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 16) + 32))(v4 + 8);
    v7 = sendto_NOCANCEL();
    result = 0;
    if (v7 == v6)
    {
      result = 1;
      if ((v6 & 0x80000000) == 0)
      {
        if (*(_QWORD *)(v4 + 456))
        {
          v8 = *(unsigned int **)(a1 + 72);
          v9 = *((_QWORD *)v8 + 57);
          v10 = *(char **)(*(_QWORD *)(v9 + 16) + 8 * *(unsigned int *)(v9 + 24));
          if (v10)
          {
            v11 = (_QWORD *)(*(_QWORD *)(v9 + 8) + 8 * (*(_DWORD *)v10 % (4 * *(_DWORD *)v9)));
            do
            {
              v12 = v11;
              v13 = (char *)*v11;
              v11 = (_QWORD *)(*v11 + 48);
              if (v13)
                v14 = v13 == v10;
              else
                v14 = 1;
            }
            while (!v14);
            if (v13)
            {
              *v12 = *((_QWORD *)v10 + 6);
              v15 = (char *)*((_QWORD *)v10 + 4);
LABEL_17:
              *((_DWORD *)v10 + 10) = v6;
              *((_QWORD *)v10 + 4) = *(_QWORD *)(a1 + 64);
              *(_QWORD *)(a1 + 64) = v15;
              xdrmem_create((XDR *)(v8 + 2), v15, *v8, XDR_ENCODE);
              v18 = v8[1];
              *(_DWORD *)v10 = v18;
              *(int32x2_t *)(v10 + 4) = vrev64_s32(*(int32x2_t *)(v9 + 32));
              *((_DWORD *)v10 + 3) = *(_DWORD *)(v9 + 28);
              *((_OWORD *)v10 + 1) = *(_OWORD *)(v9 + 40);
              v19 = v18 % (4 * **(_DWORD **)(*(_QWORD *)(a1 + 72) + 456));
              v20 = *(_QWORD *)(v9 + 8);
              *((_QWORD *)v10 + 6) = *(_QWORD *)(v20 + 8 * v19);
              *(_QWORD *)(v20 + 8 * v19) = v10;
              v21 = *(unsigned int *)(v9 + 24);
              *(_QWORD *)(*(_QWORD *)(v9 + 16) + 8 * v21) = v10;
              *(_DWORD *)(v9 + 24) = (v21 + 1) % *(_DWORD *)v9;
              return 1;
            }
            v22 = (FILE *)*MEMORY[0x1E0C874E0];
            v23 = "cache_set: victim not found";
          }
          else
          {
            v16 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x9E3E6DFAuLL);
            if (v16)
            {
              v10 = v16;
              v17 = (char *)malloc_type_calloc(1uLL, *v8, 0xB7174E35uLL);
              if (v17)
              {
                v15 = v17;
                goto LABEL_17;
              }
              free(v10);
              v22 = (FILE *)*MEMORY[0x1E0C874E0];
              v23 = "cache_set: could not allocate new rpc_buffer";
            }
            else
            {
              v22 = (FILE *)*MEMORY[0x1E0C874E0];
              v23 = "cache_set: victim alloc failed";
            }
          }
          fprintf(v22, "%s\n", v23);
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t svcudp_freeargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(v3 + 8) = 2;
  return a2(v3 + 8, a3, 0);
}

void svcudp_destroy(SVCXPRT *a1)
{
  _QWORD *xp_p2;
  void (*v3)(_QWORD *);

  xp_p2 = a1->xp_p2;
  xprt_unregister(a1);
  close_NOCANCEL();
  v3 = *(void (**)(_QWORD *))(xp_p2[2] + 56);
  if (v3)
    v3(xp_p2 + 1);
  free(a1->xp_p1);
  free(xp_p2);
  free(a1);
}

void xdr_free(xdrproc_t a1, void *a2)
{
  _OWORD v2[3];

  memset(v2, 0, sizeof(v2));
  LODWORD(v2[0]) = 2;
  ((void (*)(_OWORD *, void *, _QWORD))a1)(v2, a2, 0);
}

int xdr_void(void)
{
  return 1;
}

int xdr_int(XDR *a1, int *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_u_int(XDR *a1, unsigned int *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_long(XDR *a1, int *a2)
{
  xdr_op x_op;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
    return ((uint64_t (*)(void))a1->x_ops->x_getlong)();
  if (x_op)
    return 0;
  return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_u_long(XDR *a1, unsigned int *a2)
{
  xdr_op x_op;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
    return ((uint64_t (*)(void))a1->x_ops->x_getlong)();
  if (x_op)
    return 0;
  return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_int32_t(XDR *a1, int32_t *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_u_int32_t(XDR *a1, u_int32_t *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_short(XDR *a1, __int16 *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_u_short(XDR *a1, unsigned __int16 *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_int16_t(XDR *a1, int16_t *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_u_int16_t(XDR *a1, u_int16_t *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_char(XDR *a1, char *a2)
{
  int result;
  int v4;

  v4 = *a2;
  result = xdr_int(a1, &v4);
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

int xdr_u_char(XDR *a1, unsigned __int8 *a2)
{
  int result;
  unsigned int v4;

  v4 = *a2;
  result = xdr_u_int(a1, &v4);
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

int xdr_BOOL(XDR *a1, int *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_opaque(XDR *a1, char *a2, unsigned int a3)
{
  unsigned int v4;
  xdr_op x_op;
  int v6;
  int result;
  int v8;
  _BYTE v9[4];

  if (!a3)
    return 1;
  v4 = a3 & 3;
  x_op = a1->x_op;
  if (a1->x_op)
  {
    if (x_op != XDR_FREE)
    {
      if (x_op != XDR_DECODE)
        return 0;
      v6 = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_getbytes)(a1, a2);
      result = v6 != 0;
      if (v4)
      {
        if (v6)
          return ((uint64_t (*)(XDR *, _BYTE *, _QWORD))a1->x_ops->x_getbytes)(a1, v9, 4 - v4);
      }
      return result;
    }
    return 1;
  }
  v8 = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_putbytes)(a1, a2);
  result = v8 != 0;
  if (v4 && v8)
    return ((uint64_t (*)(XDR *, void *, _QWORD))a1->x_ops->x_putbytes)(a1, &xdr_zero, 4 - v4);
  return result;
}

int xdr_bytes(XDR *a1, char **a2, unsigned int *a3, unsigned int a4)
{
  void *v8;
  int result;
  size_t v10;
  xdr_op x_op;

  v8 = *a2;
  result = xdr_u_int(a1, a3);
  if (result)
  {
    v10 = *a3;
    x_op = a1->x_op;
    if (v10 > a4)
    {
      if (x_op != XDR_FREE)
        return 0;
      goto LABEL_12;
    }
    if (x_op)
    {
      if (x_op == XDR_FREE)
      {
LABEL_12:
        if (v8)
        {
          free(v8);
          *a2 = 0;
        }
        return 1;
      }
      if (x_op == XDR_DECODE)
      {
        if (!(_DWORD)v10)
          return 1;
        if (v8)
          return xdr_opaque(a1, (char *)v8, v10);
        v8 = malloc_type_calloc(1uLL, v10, 0xD02C8CFCuLL);
        *a2 = (char *)v8;
        if (v8)
          return xdr_opaque(a1, (char *)v8, v10);
        warnx("xdr_bytes: out of memory");
      }
      return 0;
    }
    return xdr_opaque(a1, (char *)v8, v10);
  }
  return result;
}

int xdr_netobj(XDR *a1, netobj *a2)
{
  return xdr_bytes(a1, &a2->n_bytes, &a2->n_len, 0x400u);
}

int xdr_union(XDR *a1, int *a2, char *a3, const xdr_discrim *a4, xdrproc_t a5)
{
  xdrproc_t proc;
  xdrproc_t *i;
  int v12;

  if (xdr_long(a1, a2))
  {
    proc = a4->proc;
    if (proc)
    {
      if (a4->value == *a2)
        return ((uint64_t (*)(XDR *, char *, _QWORD))proc)(a1, a3, 0);
      for (i = &a4[1].proc; ; i += 2)
      {
        proc = *i;
        if (!*i)
          break;
        v12 = *((_DWORD *)i - 2);
        if (v12 == *a2)
          return ((uint64_t (*)(XDR *, char *, _QWORD))proc)(a1, a3, 0);
      }
    }
    proc = a5;
    if (a5)
      return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))proc)(a1, a3, 0);
  }
  return 0;
}

int xdr_string(XDR *a1, char **a2, unsigned int a3)
{
  char *v6;
  int result;
  uint64_t v8;
  xdr_op x_op;
  unsigned int v10;

  v6 = *a2;
  v10 = 0;
  if (a1->x_op == XDR_ENCODE)
  {
LABEL_4:
    v10 = strlen(v6);
    goto LABEL_5;
  }
  if (a1->x_op == XDR_FREE)
  {
    if (!v6)
      return 1;
    goto LABEL_4;
  }
LABEL_5:
  result = xdr_u_int(a1, &v10);
  if (!result)
    return result;
  v8 = v10;
  if (v10 > a3)
    return 0;
  x_op = a1->x_op;
  if (a1->x_op == XDR_ENCODE)
    return xdr_opaque(a1, v6, v8);
  if (x_op == XDR_FREE)
  {
    free(v6);
    *a2 = 0;
  }
  else
  {
    if (x_op != XDR_DECODE)
      return 0;
    if (v10 != -1)
    {
      if (!v6)
      {
        v6 = (char *)malloc_type_calloc(1uLL, v10 + 1, 0x3EC4BC73uLL);
        *a2 = v6;
        if (!v6)
        {
          warnx("xdr_string: out of memory");
          return 0;
        }
      }
      v6[v8] = 0;
      return xdr_opaque(a1, v6, v8);
    }
  }
  return 1;
}

int xdr_wrapstring(XDR *a1, char **a2)
{
  return xdr_string(a1, a2, 0xFFFFFFFF);
}

int xdr_int64_t(XDR *a1, int64_t *a2)
{
  xdr_op x_op;
  int result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C874D8];
  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op != XDR_DECODE)
  {
    if (x_op)
      return 0;
    v6[0] = __ROR8__(*a2, 32);
    result = ((uint64_t (*)(XDR *, _QWORD *))a1->x_ops->x_putlong)(a1, v6);
    if (result)
      return ((uint64_t (*)(XDR *, char *))a1->x_ops->x_putlong)(a1, (char *)v6 + 4);
    return result;
  }
  result = ((uint64_t (*)(XDR *, _QWORD *))a1->x_ops->x_getlong)(a1, v6);
  if (result)
  {
    result = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_getlong)(a1, (char *)v6 + 4);
    if (result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }
  return result;
}

int xdr_u_int64_t(XDR *a1, u_int64_t *a2)
{
  xdr_op x_op;
  int result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C874D8];
  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op != XDR_DECODE)
  {
    if (x_op)
      return 0;
    v6[0] = __ROR8__(*a2, 32);
    result = ((uint64_t (*)(XDR *, _QWORD *))a1->x_ops->x_putlong)(a1, v6);
    if (result)
      return ((uint64_t (*)(XDR *, char *))a1->x_ops->x_putlong)(a1, (char *)v6 + 4);
    return result;
  }
  result = ((uint64_t (*)(XDR *, _QWORD *))a1->x_ops->x_getlong)(a1, v6);
  if (result)
  {
    result = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_getlong)(a1, (char *)v6 + 4);
    if (result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }
  return result;
}

int xdr_array(XDR *a1, char **a2, unsigned int *a3, unsigned int a4, unsigned int a5, xdrproc_t a6)
{
  char *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  char *v18;

  v12 = *a2;
  if (!xdr_u_int(a1, a3))
    return 0;
  v13 = *a3;
  if ((v13 > a4 || ((a5 * (unint64_t)v13) & 0xFFFFFFFF00000000) != 0) && a1->x_op != XDR_FREE)
    return 0;
  if (v12)
    goto LABEL_6;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (a1->x_op == XDR_DECODE)
  {
    if (v13)
    {
      v18 = (char *)malloc_type_calloc(1uLL, v13 * a5, 0x421D8FDEuLL);
      *a2 = v18;
      if (v18)
      {
        v12 = v18;
        bzero(v18, v13 * a5);
LABEL_7:
        v14 = a5;
        v15 = 1;
        do
        {
          v16 = ((uint64_t (*)(XDR *, char *, _QWORD))a6)(a1, v12, 0);
          v17 = v16;
          if (v15 >= v13)
            break;
          v12 += v14;
          ++v15;
        }
        while (v16);
        goto LABEL_17;
      }
      warnx("xdr_array: out of memory");
      return 0;
    }
    return 1;
  }
LABEL_6:
  if (v13)
    goto LABEL_7;
  v17 = 1;
LABEL_17:
  if (a1->x_op == XDR_FREE)
  {
    free(*a2);
    *a2 = 0;
  }
  return v17;
}

int xdr_vector(XDR *a1, char *a2, unsigned int a3, unsigned int a4, xdrproc_t a5)
{
  unsigned int v6;
  uint64_t v9;
  int result;

  if (!a3)
    return 1;
  v6 = a3;
  v9 = a4;
  while (1)
  {
    result = ((uint64_t (*)(XDR *, char *, _QWORD))a5)(a1, a2, 0);
    if (!result)
      break;
    a2 += v9;
    if (!--v6)
      return 1;
  }
  return result;
}

int xdr_float(XDR *a1, float *a2)
{
  xdr_op x_op;
  int result;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op == XDR_DECODE)
  {
    result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result)
      return result;
    *a2 = 0.0;
    return 1;
  }
  if (x_op)
    return 0;
  else
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_double(XDR *a1, double *a2)
{
  xdr_op x_op;
  int result;
  int v6;

  x_op = a1->x_op;
  if (a1->x_op == XDR_FREE)
    return 1;
  if (x_op != XDR_DECODE)
  {
    if (x_op)
      return 0;
    v6 = *((_DWORD *)a2 + 1);
    result = ((uint64_t (*)(XDR *, int *))a1->x_ops->x_putlong)(a1, &v6);
    if (result)
    {
      v6 = *(_DWORD *)a2;
      return ((uint64_t (*)(XDR *, int *))a1->x_ops->x_putlong)(a1, &v6);
    }
    return result;
  }
  v6 = 0;
  result = ((uint64_t (*)(XDR *, int *))a1->x_ops->x_getlong)(a1, &v6);
  if (result)
  {
    *((_DWORD *)a2 + 1) = v6;
    v6 = 0;
    result = ((uint64_t (*)(XDR *, int *))a1->x_ops->x_getlong)(a1, &v6);
    if (result)
    {
      *(_DWORD *)a2 = v6;
      return 1;
    }
  }
  return result;
}

void xdrmem_create(XDR *a1, char *a2, unsigned int a3, xdr_op a4)
{
  uint64_t (**v4)();

  a1->x_op = a4;
  v4 = xdrmem_ops_unaligned;
  if ((a2 & 3) == 0)
    v4 = xdrmem_ops_aligned;
  a1->x_ops = (const __rpc_xdr::xdr_ops *)v4;
  a1->x_private = a2;
  a1->x_base = a2;
  a1->x_handy = a3;
}

uint64_t xdrmem_getlong_unaligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  unsigned int *v6;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(_QWORD *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_putlong_unaligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  **(_DWORD **)(a1 + 24) = bswap32(*a2);
  *(_QWORD *)(a1 + 24) += 4;
  return 1;
}

uint64_t xdrmem_getbytes(uint64_t a1, void *__dst, size_t __len)
{
  unsigned int v3;
  BOOL v4;
  int v5;
  unsigned int v7;

  v3 = *(_DWORD *)(a1 + 40);
  v4 = v3 >= __len;
  v5 = v3 - __len;
  if (!v4)
    return 0;
  v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(__dst, *(const void **)(a1 + 24), __len);
  *(_QWORD *)(a1 + 24) += v7;
  return 1;
}

uint64_t xdrmem_putbytes(uint64_t a1, const void *a2, size_t __len)
{
  unsigned int v3;
  BOOL v4;
  int v5;
  unsigned int v7;

  v3 = *(_DWORD *)(a1 + 40);
  v4 = v3 >= __len;
  v5 = v3 - __len;
  if (!v4)
    return 0;
  v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(*(void **)(a1 + 24), a2, __len);
  *(_QWORD *)(a1 + 24) += v7;
  return 1;
}

uint64_t xdrmem_getpos(uint64_t a1)
{
  if ((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 32)) >= 0xFFFFFFFFLL)
    return 0xFFFFFFFFLL;
  else
    return *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 32);
}

uint64_t xdrmem_setpos(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32) + a2;
  v3 = *(_QWORD *)(a1 + 24) + *(unsigned int *)(a1 + 40);
  if (v2 > v3)
    return 0;
  *(_QWORD *)(a1 + 24) = v2;
  v4 = v3 - v2;
  if (v4 > 0xFFFFFFFFLL)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  return 1;
}

uint64_t xdrmem_inline_unaligned()
{
  return 0;
}

uint64_t xdrmem_getlong_aligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  unsigned int *v6;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(_QWORD *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_putlong_aligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  _DWORD *v6;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v6 = *(_DWORD **)(a1 + 24);
  *v6 = bswap32(*a2);
  *(_QWORD *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_inline_aligned(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= a2;
  v4 = v2 - a2;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v5 + a2;
  return v5;
}

void xdrrec_create(XDR *a1, unsigned int a2, unsigned int a3, void *a4, int (__cdecl *a5)(void *, void *, int), int (__cdecl *a6)(void *, void *, int))
{
  void **v12;
  void **v13;
  size_t v14;
  void *v15;
  size_t v16;
  char *v17;
  char *v18;

  v12 = (void **)malloc_type_calloc(1uLL, 0x98uLL, 0x10900401867FBDDuLL);
  if (v12)
  {
    v13 = v12;
    if (a2 >= 0x64)
      v14 = (a2 + 3) & 0xFFFFFFFC;
    else
      v14 = 4000;
    *((_DWORD *)v12 + 26) = v14;
    v15 = malloc_type_calloc(1uLL, v14, 0x5E6E2593uLL);
    v13[2] = v15;
    if (v15)
    {
      if (a3 >= 0x64)
        v16 = (a3 + 3) & 0xFFFFFFFC;
      else
        v16 = 4000;
      *((_DWORD *)v13 + 27) = v16;
      v17 = (char *)malloc_type_calloc(1uLL, v16, 0xC95FAF89uLL);
      v13[9] = v17;
      if (v17)
      {
        a1->x_ops = (const __rpc_xdr::xdr_ops *)xdrrec_ops;
        a1->x_private = v13;
        *v13 = a4;
        v13[1] = a6;
        v18 = (char *)v13[2];
        v13[5] = v18;
        v13[3] = v18 + 4;
        v13[4] = &v18[v14];
        *((_DWORD *)v13 + 12) = 0;
        v13[7] = a5;
        v13[8] = (void *)v16;
        v13[10] = &v17[v16];
        v13[11] = &v17[v16];
        v13[12] = (void *)0x100000000;
        v13[16] = v13 + 15;
        v13[14] = 0;
        v13[17] = 0;
        *((_DWORD *)v13 + 36) = 0;
      }
      else
      {
        xdrrec_create_cold_1(v13 + 2, v13);
      }
    }
    else
    {
      warnx("xdrrec_create: out of memory");
      free(v13);
    }
  }
  else
  {
    warnx("xdrrec_create: out of memory");
  }
}

int xdrrec_skiprecord(XDR *a1)
{
  _DWORD *x_private;
  int result;
  int v4;
  int v5;

  x_private = a1->x_private;
  if (x_private[28])
  {
    v5 = 0;
    if (!__xdrrec_getrec((uint64_t)a1, &v5, 0)
      && (*((_QWORD *)x_private + 10) != *((_QWORD *)x_private + 11) || v5 != 1))
    {
      return 0;
    }
    x_private[24] = 0;
  }
  else
  {
    while (1)
    {
      v4 = x_private[24];
      if (v4 <= 0)
      {
        if (x_private[25])
          break;
      }
      result = skip_input_bytes((uint64_t)x_private, v4);
      if (result)
      {
        x_private[24] = 0;
        if (x_private[25])
          continue;
        result = set_input_fragment(x_private);
        if (result)
          continue;
      }
      return result;
    }
    x_private[25] = 0;
  }
  return 1;
}

uint64_t __xdrrec_getrec(uint64_t a1, int *a2, int a3)
{
  _QWORD *v5;
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v5 = *(_QWORD **)(a1 + 24);
  if (!*((_DWORD *)v5 + 29))
  {
    result = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v5[7])(*v5, v5[16], (4 - *((_DWORD *)v5 + 34)));
    if (!(_DWORD)result)
      goto LABEL_11;
    if ((result & 0x80000000) != 0)
      goto LABEL_15;
    v5[16] += (int)result;
    v11 = *((_DWORD *)v5 + 34) + result;
    *((_DWORD *)v5 + 34) = v11;
    if (v11 < 4)
    {
LABEL_10:
      result = 0;
      v10 = 1;
      goto LABEL_16;
    }
    v12 = bswap32(*((_DWORD *)v5 + 30));
    *((_DWORD *)v5 + 30) = v12;
    v13 = v12 & 0x7FFFFFFF;
    if ((v12 & 0x7FFFFFFF) == 0
      || (v14 = *((_DWORD *)v5 + 37), v13 > v14)
      || (v15 = *((_DWORD *)v5 + 35) + v13, (int)v15 > v14))
    {
LABEL_15:
      v10 = 0;
      result = 0;
      goto LABEL_16;
    }
    *((_DWORD *)v5 + 35) = v15;
    if (v15 > *((_DWORD *)v5 + 27))
    {
      realloc_stream((void **)v5, v15);
      v12 = *((_DWORD *)v5 + 30);
    }
    if ((v12 & 0x80000000) != 0)
    {
      *((_DWORD *)v5 + 30) = v12 & 0x7FFFFFFF;
      *((_DWORD *)v5 + 25) = 1;
    }
  }
  result = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v5[7])(*v5, v5[9] + *((int *)v5 + 36), (*((_DWORD *)v5 + 35) - *((_DWORD *)v5 + 36)));
  if ((result & 0x80000000) != 0)
    goto LABEL_15;
  if (!(_DWORD)result)
  {
LABEL_11:
    v10 = 2 * (a3 == 0);
    goto LABEL_16;
  }
  v7 = *((_DWORD *)v5 + 35);
  v8 = *((_DWORD *)v5 + 36) + result;
  *((_DWORD *)v5 + 36) = v8;
  if (v8 != v7)
    goto LABEL_10;
  *((_DWORD *)v5 + 29) = 0;
  v5[16] = v5 + 15;
  *((_DWORD *)v5 + 34) = 0;
  if (!*((_DWORD *)v5 + 25))
    goto LABEL_10;
  *((_DWORD *)v5 + 24) = v8;
  v9 = v5[9];
  v5[10] = v9;
  v5[11] = v9 + v8;
  *((_DWORD *)v5 + 35) = 0;
  *((_DWORD *)v5 + 36) = 0;
  v10 = 1;
  result = 1;
LABEL_16:
  *a2 = v10;
  return result;
}

uint64_t skip_input_bytes(uint64_t a1, int a2)
{
  int i;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (a2 < 1)
    return 1;
  for (i = a2; i > 0; i -= v5)
  {
    while (1)
    {
      v4 = *(_QWORD *)(a1 + 80);
      LODWORD(v5) = *(_DWORD *)(a1 + 88) - v4;
      if ((_DWORD)v5)
        break;
      result = fill_input_buf(a1);
      if (!(_DWORD)result)
        return result;
    }
    if (i >= v5)
      v5 = v5;
    else
      v5 = i;
    *(_QWORD *)(a1 + 80) = v4 + v5;
  }
  return 1;
}

uint64_t set_input_fragment(_DWORD *a1)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;
  unsigned int __dst;

  if (a1[28])
    return 0;
  __dst = 0;
  result = get_input_bytes((uint64_t)a1, (char *)&__dst, 4);
  if ((_DWORD)result)
  {
    v3 = __dst;
    v4 = bswap32(__dst);
    a1[25] = v4 >> 31;
    if (v3)
    {
      a1[24] = v4 & 0x7FFFFFFF;
      return 1;
    }
    return 0;
  }
  return result;
}

int xdrrec_eof(XDR *a1)
{
  _DWORD *x_private;
  int v2;

  x_private = a1->x_private;
  while (1)
  {
    v2 = x_private[24];
    if (v2 <= 0)
    {
      if (x_private[25])
        break;
    }
    if (skip_input_bytes((uint64_t)x_private, v2))
    {
      x_private[24] = 0;
      if (x_private[25] || set_input_fragment(x_private))
        continue;
    }
    return 1;
  }
  return *((_QWORD *)x_private + 10) == *((_QWORD *)x_private + 11);
}

int xdrrec_endofrecord(XDR *a1, int a2)
{
  _DWORD *x_private;
  uint64_t v3;

  x_private = a1->x_private;
  if (a2
    || x_private[12]
    || (v3 = *((_QWORD *)x_private + 3), (unint64_t)(v3 + 4) >= *((_QWORD *)x_private + 4)))
  {
    x_private[12] = 0;
    return flush_out((uint64_t)x_private, 1);
  }
  else
  {
    **((_DWORD **)x_private + 5) = bswap32((v3 - *((_QWORD *)x_private + 5) + 2147483644) | 0x80000000);
    *((_QWORD *)x_private + 5) = v3;
    *((_QWORD *)x_private + 3) = v3 + 4;
    return 1;
  }
}

uint64_t flush_out(uint64_t a1, int a2)
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = *(_DWORD *)(a1 + 24);
  **(_DWORD **)(a1 + 40) = bswap32((v3 - *(_QWORD *)(a1 + 40) - 4) | ((a2 == 1) << 31));
  v4 = v3 - *(_QWORD *)(a1 + 16);
  if ((*(unsigned int (**)(_QWORD))(a1 + 8))(*(_QWORD *)a1) != v4)
    return 0;
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 24) = v5 + 4;
  return 1;
}

void **realloc_stream(void **result, unsigned int a2)
{
  void **v3;
  void *v4;

  if (*((_DWORD *)result + 27) < a2)
  {
    v3 = result;
    v4 = (void *)(int)a2;
    result = (void **)malloc_type_realloc(result[9], (int)a2, 0x4A51991uLL);
    if (result)
    {
      v3[10] = (char *)v3[10] + (int)result - *((_DWORD *)v3 + 18);
      v3[11] = (char *)v4 + (_QWORD)result;
      *((_DWORD *)v3 + 27) = a2;
      v3[8] = v4;
      v3[9] = result;
    }
  }
  return result;
}

uint64_t xdrrec_getlong(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t result;
  unsigned int __dst;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned int **)(v3 + 80);
  __dst = 0;
  if (*(_DWORD *)(v3 + 96) < 4u || *(_QWORD *)(v3 + 88) - (_QWORD)v4 < 4uLL)
  {
    result = xdrrec_getbytes(a1, (char *)&__dst, 4u);
    if (!(_DWORD)result)
      return result;
    *a2 = bswap32(__dst);
  }
  else
  {
    *a2 = bswap32(*v4);
    *(_DWORD *)(v3 + 96) -= 4;
    *(_QWORD *)(v3 + 80) = v4 + 1;
  }
  return 1;
}

uint64_t xdrrec_putlong(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  _DWORD *v4;
  unint64_t v5;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_DWORD **)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if ((unint64_t)(v4 + 1) > v5)
  {
    *(_QWORD *)(v3 + 24) = v4;
    *(_DWORD *)(v3 + 48) = 1;
    result = flush_out(v3, 0);
    if (!(_DWORD)result)
      return result;
    v4 = *(_DWORD **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v4 + 1;
  }
  *v4 = bswap32(*a2);
  return 1;
}

uint64_t xdrrec_getbytes(uint64_t a1, char *__dst, unsigned int a3)
{
  unsigned int v3;
  _DWORD *v5;
  unsigned int v6;
  uint64_t result;
  int v8;

  if (!a3)
    return 1;
  v3 = a3;
  v5 = *(_DWORD **)(a1 + 24);
  while (1)
  {
    while (1)
    {
      v6 = v5[24];
      if (!v6)
        break;
      if (v3 >= v6)
        v8 = v5[24];
      else
        v8 = v3;
      result = get_input_bytes((uint64_t)v5, __dst, v8);
      if ((_DWORD)result)
      {
        __dst += v8;
        v5[24] -= v8;
        result = 1;
        v3 -= v8;
        if (v3)
          continue;
      }
      return result;
    }
    if (v5[25])
      break;
    result = set_input_fragment(v5);
    if (!(_DWORD)result)
      return result;
  }
  return 0;
}

uint64_t xdrrec_putbytes(uint64_t a1, char *__src, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v6;
  void *v7;
  size_t v8;
  uint64_t v9;
  size_t v10;

  v3 = 1;
  if (a3)
  {
    v4 = a3;
    v6 = *(_QWORD *)(a1 + 24);
    while (1)
    {
      v7 = *(void **)(v6 + 24);
      v8 = *(_QWORD *)(v6 + 32) - (_QWORD)v7 >= (unint64_t)v4 ? v4 : *(_QWORD *)(v6 + 32) - (_QWORD)v7;
      memmove(v7, __src, v8);
      v9 = *(_QWORD *)(v6 + 32);
      v10 = *(_QWORD *)(v6 + 24) + v8;
      *(_QWORD *)(v6 + 24) = v10;
      if (v10 == v9)
      {
        *(_DWORD *)(v6 + 48) = 1;
        if (!flush_out(v6, 0))
          break;
      }
      __src += v8;
      v4 -= v8;
      if (!v4)
        return 1;
    }
    return 0;
  }
  return v3;
}

off_t xdrrec_getpos(uint64_t a1)
{
  uint64_t v2;
  off_t result;

  v2 = *(_QWORD *)(a1 + 24);
  result = lseek(**(_DWORD **)v2, 0, 1);
  if (result != -1)
  {
    if (*(_DWORD *)a1 == 1)
    {
      return result - *(_QWORD *)(v2 + 88) + *(_QWORD *)(v2 + 80);
    }
    else if (*(_DWORD *)a1)
    {
      return -1;
    }
    else
    {
      return result + *(_QWORD *)(v2 + 24) - *(_QWORD *)(v2 + 16);
    }
  }
  return result;
}

uint64_t xdrrec_setpos(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  unint64_t v11;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = xdrrec_getpos(a1);
  if (v5 == -1)
    return 0;
  v6 = v5 - a2;
  if (*(_DWORD *)a1 == 1)
  {
    v8 = *(_DWORD *)(v4 + 96);
    v9 = __OFSUB__(v8, v6);
    v10 = v8 - v6;
    if (!((v10 < 0) ^ v9 | (v10 == 0)))
    {
      v11 = *(_QWORD *)(v4 + 80) - v6;
      if (v11 <= *(_QWORD *)(v4 + 88) && v11 >= *(_QWORD *)(v4 + 72))
      {
        *(_QWORD *)(v4 + 80) = v11;
        *(_DWORD *)(v4 + 96) = v10;
        return 1;
      }
    }
    return 0;
  }
  if (*(_DWORD *)a1)
    return 0;
  v7 = *(_QWORD *)(v4 + 24) - v6;
  if (v7 <= *(_QWORD *)(v4 + 40) || v7 >= *(_QWORD *)(v4 + 32))
    return 0;
  *(_QWORD *)(v4 + 24) = v7;
  return 1;
}

uint64_t xdrrec_inline(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 24);
  if (*(_DWORD *)a1 != 1)
  {
    if (!*(_DWORD *)a1)
    {
      result = *(_QWORD *)(v2 + 24);
      v4 = result + a2;
      if (v4 <= *(_QWORD *)(v2 + 32))
      {
        *(_QWORD *)(v2 + 24) = v4;
        return result;
      }
    }
    return 0;
  }
  v5 = *(_DWORD *)(v2 + 96);
  v6 = v5 >= a2;
  v7 = v5 - a2;
  if (!v6)
    return 0;
  result = *(_QWORD *)(v2 + 80);
  v8 = result + a2;
  if (v8 > *(_QWORD *)(v2 + 88))
    return 0;
  *(_DWORD *)(v2 + 96) = v7;
  *(_QWORD *)(v2 + 80) = v8;
  return result;
}

void xdrrec_destroy(uint64_t a1)
{
  void **v1;

  v1 = *(void ***)(a1 + 24);
  free(v1[2]);
  free(v1[9]);
  free(v1);
}

uint64_t get_input_bytes(uint64_t a1, char *__dst, int a3)
{
  int v3;
  const void *v6;
  uint64_t result;
  const void *v8;
  unint64_t v9;
  size_t v10;

  v3 = a3;
  if (*(_DWORD *)(a1 + 112))
  {
    v6 = *(const void **)(a1 + 80);
    if (*(_DWORD *)(a1 + 88) - (int)v6 < a3)
      return 0;
    memcpy(__dst, v6, a3);
    *(_QWORD *)(a1 + 80) += v3;
    return 1;
  }
  if (a3 < 1)
    return 1;
  do
  {
    while (1)
    {
      v8 = *(const void **)(a1 + 80);
      v9 = *(_QWORD *)(a1 + 88) - (_QWORD)v8;
      if (v9)
        break;
      result = fill_input_buf(a1);
      if (!(_DWORD)result)
        return result;
    }
    if (v9 >= v3)
      v10 = v3;
    else
      v10 = *(_QWORD *)(a1 + 88) - (_QWORD)v8;
    memmove(__dst, v8, v10);
    *(_QWORD *)(a1 + 80) += v10;
    __dst += v10;
    v3 -= v10;
    result = 1;
  }
  while (v3 >= 1);
  return result;
}

uint64_t fill_input_buf(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  int v5;

  if (*(_DWORD *)(a1 + 112))
    return 0;
  v3 = *(_QWORD *)(a1 + 88) & 3;
  v4 = *(_QWORD *)(a1 + 72) + v3;
  v5 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 56))(*(_QWORD *)a1, v4, (*(_DWORD *)(a1 + 64) - v3));
  if (v5 == -1)
    return 0;
  *(_QWORD *)(a1 + 80) = v4;
  *(_QWORD *)(a1 + 88) = v4 + v5;
  return 1;
}

int xdr_reference(XDR *a1, char **a2, unsigned int a3, xdrproc_t a4)
{
  char *v7;
  int v8;
  size_t v9;
  char *v10;

  v7 = *a2;
  if (!*a2)
  {
    if (a1->x_op == XDR_FREE)
      return 1;
    if (a1->x_op == XDR_DECODE)
    {
      v9 = a3;
      v10 = (char *)malloc_type_calloc(1uLL, a3, 0xC66CADD8uLL);
      *a2 = v10;
      if (!v10)
      {
        warnx("xdr_reference: out of memory");
        return 0;
      }
      v7 = v10;
      bzero(v10, v9);
    }
    else
    {
      v7 = 0;
    }
  }
  v8 = ((uint64_t (*)(XDR *, char *, _QWORD))a4)(a1, v7, 0);
  if (a1->x_op == XDR_FREE)
  {
    free(v7);
    *a2 = 0;
  }
  return v8;
}

int xdr_pointer(XDR *a1, char **a2, unsigned int a3, xdrproc_t a4)
{
  int result;
  int v9;

  v9 = *a2 != 0;
  result = xdr_BOOL(a1, &v9);
  if (result)
  {
    if (v9)
    {
      return xdr_reference(a1, a2, a3, a4);
    }
    else
    {
      *a2 = 0;
      return 1;
    }
  }
  return result;
}

void xdrstdio_create(XDR *a1, FILE *a2, xdr_op a3)
{
  a1->x_op = a3;
  a1->x_ops = (const __rpc_xdr::xdr_ops *)xdrstdio_ops;
  a1->x_handy = 0;
  a1->x_private = a2;
  a1->x_base = 0;
}

uint64_t xdrstdio_getlong(uint64_t a1, _DWORD *a2)
{
  size_t v3;
  uint64_t result;
  unsigned int __ptr;

  __ptr = 0;
  v3 = fread(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24));
  result = 0;
  if (v3 == 1)
  {
    *a2 = bswap32(__ptr);
    return 1;
  }
  return result;
}

BOOL xdrstdio_putlong(uint64_t a1, unsigned int *a2)
{
  unsigned int __ptr;

  __ptr = bswap32(*a2);
  return fwrite(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_getbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !(_DWORD)__size || fread(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_putbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !(_DWORD)__size || fwrite(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

uint64_t xdrstdio_getpos(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1940216DC](*(_QWORD *)(a1 + 24));
  if (result >= 0xFFFFFFFFLL)
    return 0xFFFFFFFFLL;
  return result;
}

BOOL xdrstdio_setpos(uint64_t a1, unsigned int a2)
{
  return fseek(*(FILE **)(a1 + 24), a2, 0) >= 0;
}

uint64_t xdrstdio_inline()
{
  return 0;
}

uint64_t xdrstdio_destroy(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 24));
}

uint64_t ntohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t htonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t ntohs(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t htons(unsigned int a1)
{
  return __rev16(a1);
}

int rcmd_af(char **a1, int a2, const char *a3, const char *a4, const char *a5, int *a6, int a7)
{
  int v14;
  FILE **v15;
  int v16;
  FILE *v17;
  const char *v18;
  FILE *v19;
  int *v20;
  char *v21;
  addrinfo *ai_next;
  char *ai_canonname;
  int v24;
  addrinfo *v25;
  uint64_t v26;
  int v27;
  int v28;
  addrinfo *v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  const char *v38;
  FILE *v39;
  int *v40;
  char *v41;
  FILE *v42;
  char *v43;
  int *v44;
  char *v45;
  int *v46;
  FILE *v47;
  int v48;
  uint64_t v49;
  int v50;
  int *v51;
  int *v52;
  FILE *v53;
  int *v54;
  char *v55;
  __int16 v57;
  FILE *v58;
  int *v59;
  FILE *v60;
  int *v61;
  char *v62;
  int v63;
  char *v64;
  const char *v65;
  int *v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  addrinfo *v76;
  addrinfo v77;
  char __s[8];
  uint64_t v79;
  char v80[1025];
  char __str[8];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C874D8];
  v76 = 0;
  v89 = 0u;
  v88 = 0u;
  v87 = 0u;
  v86 = 0u;
  v85 = 0u;
  v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v75 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v68 = 0u;
  getpid();
  memset(&v77.ai_addrlen, 0, 32);
  v77.ai_flags = 2;
  v77.ai_family = a7;
  *(_QWORD *)&v77.ai_socktype = 1;
  snprintf(__str, 8uLL, "%d", bswap32(a2) >> 16);
  v14 = getaddrinfo(*a1, __str, &v77, &v76);
  v15 = (FILE **)MEMORY[0x1E0C874E0];
  if (v14)
  {
    v16 = v14;
    v17 = (FILE *)*MEMORY[0x1E0C874E0];
    v18 = gai_strerror(v14);
    fprintf(v17, "rcmd: getaddrinfo: %s\n", v18);
    if (v16 == 11)
    {
      v19 = *v15;
      v20 = __error();
      v21 = strerror(*v20);
      fprintf(v19, "rcmd: getaddrinfo: %s\n", v21);
    }
    return -1;
  }
  ai_next = v76;
  ai_canonname = v76->ai_canonname;
  if (ai_canonname && strlen(v76->ai_canonname) + 1 <= 0x400)
    *a1 = strncpy(rcmd_af_canonnamebuf, ai_canonname, 0x401uLL);
  v64 = (char *)a5;
  v65 = a4;
  v66 = a6;
  v24 = 1;
  v25 = ai_next;
  do
  {
    v25 = v25->ai_next;
    --v24;
  }
  while (v25);
  v26 = sigblock(0x8000);
  v27 = 0;
  v67 = 1023;
  v28 = 1;
LABEL_10:
  v29 = ai_next;
  do
  {
    while (1)
    {
      v30 = rresvport_af(&v67, v29->ai_family);
      if (v30 < 0)
        break;
      fcntl_NOCANCEL();
      if ((connect_NOCANCEL() & 0x80000000) == 0)
      {
        if (v66)
        {
          v33 = rresvport_af(&v67, v29->ai_family);
          if ((v33 & 0x80000000) == 0)
          {
            v34 = v33;
            listen(v33, 1);
            v63 = v67;
            snprintf(__s, 8uLL, "%d", v67);
            strlen(__s);
            v35 = write_NOCANCEL();
            if (v35 == strlen(__s) + 1)
            {
              if (v30 <= v34)
                v36 = v34;
              else
                v36 = v30;
              if (v36 <= 0x3FF)
              {
                v48 = 1 << v34;
                v49 = v34 >> 5;
                while (1)
                {
                  v75 = 0u;
                  v73 = 0u;
                  v74 = 0u;
                  v71 = 0u;
                  v72 = 0u;
                  v69 = 0u;
                  v70 = 0u;
                  v68 = 0u;
                  if (__darwin_check_fd_set_overflow(v30, &v68, 0))
                    *((_DWORD *)&v68 + (v30 >> 5)) |= 1 << v30;
                  if (__darwin_check_fd_set_overflow(v34, &v68, 0))
                    *((_DWORD *)&v68 + v49) |= v48;
                  *__error() = 0;
                  if ((int)select_NOCANCEL() < 1
                    || !__darwin_check_fd_set_overflow(v34, &v68, 0)
                    || (*((_DWORD *)&v68 + v49) & v48) == 0)
                  {
                    v52 = __error();
                    v53 = (FILE *)*MEMORY[0x1E0C874E0];
                    if (*v52)
                    {
                      v54 = __error();
                      v55 = strerror(*v54);
                      fprintf(v53, "rcmd: select (setting up stderr): %s\n", v55);
                    }
                    else
                    {
                      fwrite("select: protocol failure in circuit setup\n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
                    }
                    goto LABEL_63;
                  }
                  v50 = accept_NOCANCEL();
                  if (BYTE1(v82) != 30 && BYTE1(v82) != 2)
                    break;
                  if (WORD1(v82) != 5120)
                  {
                    v57 = __rev16(WORD1(v82));
                    goto LABEL_70;
                  }
                  close_NOCANCEL();
                }
                v57 = 0;
LABEL_70:
                close_NOCANCEL();
                v38 = v65;
                v37 = v63;
                if (v50 < 0)
                {
                  v60 = (FILE *)*MEMORY[0x1E0C874E0];
                  v61 = __error();
                  v62 = strerror(*v61);
                  fprintf(v60, "rcmd: accept: %s\n", v62);
                  goto LABEL_64;
                }
                *v66 = v50;
                if ((v57 & 0xFE00) == 0x200)
                  goto LABEL_39;
                fwrite("socket: protocol failure in circuit setup.\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
                if (!v63)
                  goto LABEL_64;
              }
              else
              {
                fwrite("rcmd: too many files\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
              }
            }
            else
            {
              v39 = (FILE *)*MEMORY[0x1E0C874E0];
              v40 = __error();
              v41 = strerror(*v40);
              fprintf(v39, "rcmd: write (setting up stderr): %s\n", v41);
            }
            goto LABEL_63;
          }
        }
        else
        {
          write_NOCANCEL();
          v37 = 0;
          v38 = v65;
LABEL_39:
          strlen(a3);
          write_NOCANCEL();
          strlen(v38);
          write_NOCANCEL();
          strlen(v64);
          write_NOCANCEL();
          if (read_NOCANCEL() == 1)
          {
            sigsetmask(v26);
            freeaddrinfo(v76);
            return v30;
          }
          v42 = (FILE *)*MEMORY[0x1E0C874E0];
          v43 = *a1;
          v44 = __error();
          v45 = strerror(*v44);
          fprintf(v42, "rcmd: %s: %s\n", v43, v45);
          if (v37)
LABEL_63:
            close_NOCANCEL();
        }
LABEL_64:
        close_NOCANCEL();
        sigsetmask(v26);
        freeaddrinfo(v76);
        return -1;
      }
      close_NOCANCEL();
      if (*__error() != 48)
      {
        if (*__error() == 61)
          v27 = 1;
        ai_next = v29->ai_next;
        if (!ai_next && (!v27 || v28 >= 17))
        {
          v58 = (FILE *)*MEMORY[0x1E0C874E0];
          v59 = __error();
          strerror(*v59);
          fprintf(v58, "%s: %s\n");
          goto LABEL_59;
        }
        if (v24)
        {
          v31 = v26;
          v32 = *__error();
          getnameinfo(v29->ai_addr, v29->ai_addrlen, v80, 0x401u, 0, 0, 34);
          fprintf((FILE *)*MEMORY[0x1E0C874E0], "connect to address %s: ", v80);
          *__error() = v32;
          v26 = v31;
          perror(0);
          ai_next = v29->ai_next;
          if (ai_next)
          {
LABEL_25:
            if (!v24)
              goto LABEL_10;
LABEL_29:
            getnameinfo(ai_next->ai_addr, ai_next->ai_addrlen, v80, 0x401u, 0, 0, 34);
            fprintf((FILE *)*MEMORY[0x1E0C874E0], "Trying %s...\n", v80);
            goto LABEL_10;
          }
        }
        else if (ai_next)
        {
          goto LABEL_25;
        }
        *(_QWORD *)__s = v28;
        v79 = 0;
        nanosleep_NOCANCEL();
        v27 = 0;
        v28 *= 2;
        ai_next = v76;
        if (!v24)
          goto LABEL_10;
        goto LABEL_29;
      }
      --v67;
    }
    if (*__error() == 35)
      break;
    v29 = v29->ai_next;
  }
  while (v29);
  v46 = __error();
  v47 = (FILE *)*MEMORY[0x1E0C874E0];
  if (*v46 == 35)
  {
    fwrite("rcmd: socket: All ports in use\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
  }
  else
  {
    v51 = __error();
    strerror(*v51);
    fprintf(v47, "rcmd: socket: %s\n");
  }
LABEL_59:
  freeaddrinfo(v76);
  sigsetmask(v26);
  return -1;
}

int rresvport_af(int *a1, int a2)
{
  int v3;
  int v4;
  sockaddr v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  memset(v6, 0, sizeof(v6));
  v6[0].sa_family = a2;
  if (a2 == 30)
  {
    v6[0].sa_len = 28;
    *(in6_addr *)&v6[0].sa_data[6] = in6addr_any;
  }
  else
  {
    if (a2 != 2)
    {
      *__error() = 47;
      return -1;
    }
    v6[0].sa_len = 16;
  }
  v3 = socket(a2, 1, 0);
  if (v3 < 0)
    return -1;
  v4 = v3;
  *(_WORD *)v6[0].sa_data = 0;
  if (bindresvport_sa(v3, v6) == -1)
  {
    close_NOCANCEL();
    return -1;
  }
  *a1 = bswap32(*(unsigned __int16 *)v6[0].sa_data) >> 16;
  return v4;
}

int rcmd(char **a1, int a2, const char *a3, const char *a4, const char *a5, int *a6)
{
  return rcmd_af(a1, (unsigned __int16)a2, a3, a4, a5, a6, 2);
}

int rresvport(int *a1)
{
  return rresvport_af(a1, 2);
}

int iruserok_sa(const void *a1, int a2, int a3, const char *a4, const char *a5)
{
  int v5;
  const char *v6;
  const char *v7;
  unsigned int v8;
  socklen_t v9;
  int v10;
  const char *v11;
  const char *v12;
  int v13;
  FILE *v14;
  char v15;
  uid_t v16;
  int v17;
  const char *v18;
  passwd *v20;
  passwd v21;
  stat v22;
  char v23[6533];
  sockaddr v24[8];
  char v25[1024];
  uint64_t v26;

  ((void (*)(const void *, _QWORD, _QWORD, const char *, const char *))MEMORY[0x1E0C86820])(a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
  v9 = v8;
  v26 = *MEMORY[0x1E0C874D8];
  if (v8 > 0x80)
    return -1;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  memset(&v22, 0, sizeof(v22));
  memset(&v21, 0, sizeof(v21));
  memset(v24, 0, sizeof(v24));
  v20 = 0;
  __memcpy_chk();
  v14 = 0;
  if (!v13)
    v14 = fopen("/etc/hosts.equiv", "r");
  v15 = 1;
  while (1)
  {
    if (v14)
    {
      if (!__ivaliduser_sa(v14, v24, v9, v11, v12))
      {
        v10 = 0;
        goto LABEL_26;
      }
      fclose(v14);
    }
    if ((v15 & 1) == 0)
      return -1;
    if (!(__check_rhosts_file | v13))
      return -1;
    memset(&v21, 0, sizeof(v21));
    bzero(v23, 0x1985uLL);
    v20 = 0;
    if (getpwnam_r(v11, &v21, v23, 0x1985uLL, &v20))
      return -1;
    __strcpy_chk();
    __strcat_chk();
    v16 = geteuid();
    seteuid(v20->pw_uid);
    v14 = fopen(v25, "r");
    seteuid(v16);
    if (!v14)
      return -1;
    if (lstat(v25, &v22) < 0)
    {
      v18 = ".rhosts lstat failed";
      goto LABEL_25;
    }
    if ((v22.st_mode & 0xF000) != 0x8000)
    {
      v18 = ".rhosts not regular file";
      goto LABEL_25;
    }
    v17 = fileno(v14);
    if (fstat(v17, &v22) < 0)
    {
      v18 = ".rhosts fstat failed";
      goto LABEL_25;
    }
    if (v22.st_uid && v22.st_uid != v20->pw_uid)
      break;
    v15 = 0;
    if ((v22.st_mode & 0x12) != 0)
    {
      v18 = ".rhosts writeable by other than owner";
      goto LABEL_25;
    }
  }
  v18 = "bad .rhosts owner";
LABEL_25:
  __rcmd_errstr = (uint64_t)v18;
  v10 = -1;
LABEL_26:
  fclose(v14);
  return v10;
}

uint64_t __ivaliduser_sa(FILE *a1, sockaddr *a2, socklen_t a3, const char *a4, const char *a5)
{
  int v10;
  int v11;
  const char *v12;
  char *v13;
  __darwin_ct_rune_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  char *p_s;
  char *v19;
  __darwin_ct_rune_t v20;
  int v21;
  char *v22;
  int v23;
  char v25;
  int v26;
  int v27;
  const char *v28;
  const char *v30;
  char *v31;
  char v32[256];
  char __s;
  char v34;
  _BYTE v35[398];

  *(_QWORD *)&v35[382] = *MEMORY[0x1E0C874D8];
  getnameinfo(a2, a3, v32, 0x100u, 0, 0, 4);
  v10 = 0;
  v11 = 0;
  v12 = &v34;
  v13 = v35;
  do
  {
    while (1)
    {
LABEL_2:
      if (!fgets(&__s, 384, a1))
        return 0xFFFFFFFFLL;
      if (strchr(&__s, 10))
        break;
      do
        v21 = getc(a1);
      while (v21 != 10 && v21 != -1);
    }
    v14 = __s;
  }
  while (__s == 10 || __s == 35);
  v31 = v13;
  v15 = v12;
  v16 = a4;
  v17 = a5;
  p_s = &__s;
  v30 = v15;
  v19 = (char *)v15;
  while (v14 <= 9)
  {
    if (!v14)
      goto LABEL_22;
    if (v14 == 9)
      goto LABEL_23;
LABEL_13:
    if ((v14 & 0x80) == 0)
    {
      if ((*(_DWORD *)(MEMORY[0x1E0C87458] + 4 * v14 + 60) & 0x8000) == 0)
        goto LABEL_16;
LABEL_15:
      LOBYTE(v14) = __tolower(v14);
      goto LABEL_16;
    }
    if (__maskrune(v14, 0x8000uLL))
      goto LABEL_15;
LABEL_16:
    *p_s = v14;
    v20 = *++p_s;
    v14 = v20;
    ++v19;
  }
  if (v14 == 10)
  {
LABEL_22:
    v22 = p_s;
    goto LABEL_34;
  }
  if (v14 != 32)
    goto LABEL_13;
LABEL_23:
  *p_s = 0;
  while (1)
  {
    v23 = *v19;
    if (v23 != 32 && v23 != 9)
      break;
    ++v19;
  }
  v22 = v19;
  while (v23 > 0x20u || ((1 << v23) & 0x100000601) == 0)
  {
    v25 = *++v22;
    LOBYTE(v23) = v25;
  }
  p_s = v19;
LABEL_34:
  *v22 = 0;
  a5 = v17;
  if (__s == 45)
  {
    a4 = v16;
    if (v34 == 64)
    {
      v12 = v30;
      if (!innetgr(v31, v32, 0, 0))
        goto LABEL_48;
    }
    else
    {
      v12 = v30;
      if (!__icheckhost(a2, a3, v30))
        goto LABEL_48;
    }
  }
  else
  {
    a4 = v16;
    if (__s == 43)
    {
      v12 = v30;
      if (v34)
      {
        if (v34 == 64)
          v26 = innetgr(v31, v32, 0, 0);
        else
          v26 = __icheckhost(a2, a3, v30);
        v11 = v26;
      }
      else
      {
        v11 = 1;
      }
    }
    else
    {
      v11 = __icheckhost(a2, a3, &__s);
      v12 = v30;
    }
LABEL_48:
    v27 = *p_s;
    if (v27 != 45)
    {
      if (v27 == 43)
      {
        v28 = p_s + 1;
        if (!p_s[1])
        {
          v10 = 1;
          goto LABEL_65;
        }
        if (p_s[1] == 64)
        {
          v10 = innetgr(p_s + 2, 0, a5, 0);
          goto LABEL_65;
        }
      }
      else
      {
        if (!v11)
          goto LABEL_65;
        if (*p_s)
          v28 = p_s;
        else
          v28 = a4;
      }
      v10 = strcmp(a5, v28) == 0;
      goto LABEL_65;
    }
    if (!v11)
      goto LABEL_65;
    if (p_s[1] != 64)
    {
      if (!p_s[1] || !strcmp(a5, p_s + 1))
        return 0xFFFFFFFFLL;
LABEL_65:
      v13 = v31;
      if (v11 && v10)
        return 0;
      goto LABEL_2;
    }
    if (!innetgr(p_s + 2, 0, a5, 0))
      goto LABEL_65;
  }
  return 0xFFFFFFFFLL;
}

int ruserok(const char *a1, int a2, const char *a3, const char *a4)
{
  int v7;
  addrinfo *v8;
  addrinfo *v9;
  addrinfo *v11;
  addrinfo v12;

  v11 = 0;
  memset(&v12, 0, sizeof(v12));
  v12.ai_socktype = 2;
  if (getaddrinfo(a1, "0", &v12, &v11))
    return -1;
  v8 = v11;
  if (v11)
  {
    while (iruserok_sa(v8->ai_addr, v8->ai_addrlen, a2, a3, a4))
    {
      v8 = v8->ai_next;
      if (!v8)
      {
        v7 = -1;
        goto LABEL_9;
      }
    }
    v7 = 0;
LABEL_9:
    v9 = v11;
  }
  else
  {
    v9 = 0;
    v7 = -1;
  }
  freeaddrinfo(v9);
  return v7;
}

int iruserok(unint64_t a1, int a2, const char *a3, const char *a4)
{
  _DWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v6 = 0;
  v5[0] = 528;
  v5[1] = a1;
  return iruserok_sa(v5, 16, a2, a3, a4);
}

uint64_t __icheckhost(sockaddr *a1, socklen_t a2, const char *a3)
{
  sockaddr *v4;
  uint64_t v5;
  addrinfo *v6;
  addrinfo *v7;
  addrinfo *v9;
  addrinfo v10;
  char __s2[1025];
  char __s1[1025];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a1;
  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0;
  v14 = 0;
  if (a1->sa_family == 30
    && !*(_DWORD *)&a1->sa_data[6]
    && !*(_DWORD *)&a1->sa_data[10]
    && *(_DWORD *)&a1[1].sa_len == -65536)
  {
    v13 = 528;
    v14 = 0;
    HIDWORD(v13) = *(_DWORD *)&a1[1].sa_data[2];
    a2 = 16;
    v4 = (sockaddr *)&v13;
  }
  __s1[0] = 0;
  v5 = 0;
  if (!getnameinfo(v4, a2, __s1, 0x401u, 0, 0, 34))
  {
    memset(&v10, 0, sizeof(v10));
    v10.ai_family = v4->sa_family;
    v10.ai_socktype = 2;
    v9 = 0;
    if (getaddrinfo(a3, "0", &v10, &v9))
    {
      return 0;
    }
    else
    {
      v6 = v9;
      if (v9)
      {
        while (1)
        {
          __s2[0] = 0;
          if (!getnameinfo(v6->ai_addr, v6->ai_addrlen, __s2, 0x401u, 0, 0, 34) && !strcmp(__s1, __s2))
            break;
          v6 = v6->ai_next;
          if (!v6)
          {
            v5 = 0;
            goto LABEL_16;
          }
        }
        v5 = 1;
LABEL_16:
        v7 = v9;
      }
      else
      {
        v7 = 0;
        v5 = 0;
      }
      freeaddrinfo(v7);
    }
  }
  return v5;
}

int ether_line(const char *a1, ether_addr *a2, char *a3)
{
  int v4;
  uint64_t i;
  _DWORD v7[6];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v4 = sscanf(a1, " %x:%x:%x:%x:%x:%x %s", v7, &v7[1], &v7[2], &v7[3], &v7[4], &v7[5], a3);
  if (v4 != 7)
    return 7 - v4;
  for (i = 0; i != 6; ++i)
    a2->octet[i] = v7[i];
  return 0;
}

int getifmaddrs(ifmaddrs **a1)
{
  unsigned int i;
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  int v6;
  int v7;
  unsigned __int16 *v8;
  int v9;
  _BYTE *v10;
  uint64_t v11;
  size_t v12;
  ifmaddrs *v13;
  ifmaddrs *v14;
  size_t v15;
  char *v16;
  ifmaddrs *v17;
  unsigned __int16 *v18;
  int v19;
  _BYTE *v20;
  sockaddr **p_ifma_name;
  sockaddr **p_ifma_lladdr;
  size_t v23;
  char **v24;
  int result;
  ifmaddrs *v26;
  ifmaddrs **v27;
  ifmaddrs *v28;
  sockaddr **p_ifma_addr;
  size_t size;
  int v31[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  size = 0;
  *(_OWORD *)v31 = xmmword_191FAB770;
  v32 = 6;
  if (sysctl(v31, 6u, 0, &size, 0, 0) < 0)
    return -1;
  for (i = 0; ; ++i)
  {
    v3 = (unsigned __int16 *)malloc_type_malloc(size, 0x6C240B7uLL);
    if (!v3)
      return -1;
    v4 = v3;
    if ((sysctl(v31, 6u, v3, &size, 0, 0) & 0x80000000) == 0)
      break;
    if (*__error() != 12 || i >= 4)
      goto LABEL_50;
    free(v4);
    if (sysctl(v31, 6u, 0, &size, 0, 0) < 0)
      return -1;
  }
  if ((uint64_t)size < 1)
  {
    v6 = 0;
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = 1;
    v8 = v4;
    do
    {
      if (*((_BYTE *)v8 + 2) == 5 && *((_BYTE *)v8 + 3) == 19 && (*((_DWORD *)v8 + 1) & 0x20) != 0)
      {
        v9 = 0;
        v10 = v8 + 10;
        do
        {
          if ((((*((_DWORD *)v8 + 1) & 0x32u) >> v9) & 1) != 0)
          {
            if (*v10)
              v11 = (*v10 + 3) & 0x1FC;
            else
              v11 = 4;
            v6 += v11;
            v10 += v11;
          }
          ++v9;
        }
        while (v9 != 8);
        ++v7;
      }
      v8 = (unsigned __int16 *)((char *)v8 + *v8);
    }
    while (v8 < (unsigned __int16 *)((char *)v4 + size));
  }
  v12 = 32 * v7;
  v13 = (ifmaddrs *)malloc_type_malloc(v12 + v6, 0xDC940E9BuLL);
  if (!v13)
  {
LABEL_50:
    free(v4);
    return -1;
  }
  v14 = v13;
  bzero(v13, v12);
  v15 = size;
  if ((uint64_t)size <= 0)
  {
    free(v4);
    goto LABEL_54;
  }
  v26 = v14;
  v27 = a1;
  v16 = (char *)&v14[v12 / 0x20];
  v17 = v14;
  v18 = v4;
  do
  {
    if (*((_BYTE *)v18 + 2) == 5 && *((_BYTE *)v18 + 3) == 19 && (v18[2] & 0x20) != 0)
    {
      v19 = 0;
      v20 = v18 + 10;
      v28 = v17;
      p_ifma_addr = &v17->ifma_addr;
      p_ifma_name = &v17->ifma_name;
      p_ifma_lladdr = &v17->ifma_lladdr;
      while (((1 << v19) & 0x32 & *((_DWORD *)v18 + 1)) == 0)
      {
LABEL_45:
        if (++v19 == 8)
        {
          v28->ifma_next = v28 + 1;
          v15 = size;
          v17 = v28 + 1;
          goto LABEL_47;
        }
      }
      if (*v20)
        v23 = (*v20 + 3) & 0x1FC;
      else
        v23 = 4;
      v24 = (char **)p_ifma_lladdr;
      if (v19 != 1)
      {
        if (v19 == 5)
        {
          v24 = (char **)p_ifma_addr;
        }
        else
        {
          v24 = (char **)p_ifma_name;
          if (v19 != 4)
            goto LABEL_44;
        }
      }
      *v24 = v16;
      memcpy(v16, v20, v23);
LABEL_44:
      v16 += v23;
      v20 += v23;
      goto LABEL_45;
    }
LABEL_47:
    v18 = (unsigned __int16 *)((char *)v18 + *v18);
  }
  while (v18 < (unsigned __int16 *)((char *)v4 + v15));
  free(v4);
  v14 = v26;
  a1 = v27;
  if (v17 > v26)
  {
    result = 0;
    v17[-1].ifma_next = 0;
    *v27 = v26;
    return result;
  }
LABEL_54:
  *a1 = 0;
  free(v14);
  return 0;
}

uint64_t getnameinfo_link(uint64_t a1, int a2, char *__str, size_t __size, _BYTE *a5, uint64_t a6)
{
  size_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  unsigned int v14;
  uint64_t result;

  v6 = __size;
  if (a5 && a6)
    *a5 = 0;
  v8 = *(unsigned __int8 *)(a1 + 5);
  v9 = *(unsigned __int8 *)(a1 + 6);
  if (*(_BYTE *)(a1 + 5))
  {
    *__str = 0;
    if ((_DWORD)v9)
    {
      v10 = a1 + v8 + 8;
      goto LABEL_9;
    }
    return 0;
  }
  if (*(_BYTE *)(a1 + 6))
  {
    v10 = a1 + v8 + 8;
    *__str = 0;
LABEL_9:
    v11 = 0;
    v12 = __str;
    while (1)
    {
      v13 = v11 ? ":" : "";
      v14 = snprintf(v12, v6, "%s%02x", v13, *(unsigned __int8 *)(v10 + v11));
      if ((v14 & 0x80000000) != 0 || v6 <= v14)
        break;
      v12 += v14;
      v6 -= v14;
      if (v9 == ++v11)
        return 0;
    }
    goto LABEL_20;
  }
  if (!*(_BYTE *)(a1 + 7))
  {
    if (snprintf(__str, __size, "link#%d", *(unsigned __int16 *)(a1 + 2)) > __size)
    {
LABEL_20:
      result = 6;
      goto LABEL_21;
    }
    return 0;
  }
  result = 0;
LABEL_21:
  *__str = 0;
  return result;
}

char *configuration_profile_create_notification_key(char *result)
{
  char *v1;

  v1 = 0;
  if (result)
  {
    if (*result == 47)
    {
      asprintf(&v1, "%s%s");
    }
    else
    {
      if (strchr(result + 1, 47))
        return 0;
      asprintf(&v1, "%s%s/%s.plist");
    }
    return v1;
  }
  return result;
}

uint64_t configuration_profile_copy_property_list(_BYTE *a1)
{
  int v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  stat v7;
  char __str[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 0;
  __str[0] = 0;
  if (*a1 == 47)
  {
    snprintf(__str, 0x400uLL, "%s");
  }
  else
  {
    if (strchr(a1 + 1, 47))
      return 0;
    snprintf(__str, 0x400uLL, "%s/%s.plist");
  }
  if (!__str[0])
    return 0;
  v1 = open_NOCANCEL();
  if (v1 < 0)
    return 0;
  v2 = v1;
  memset(&v7, 0, sizeof(v7));
  if (fstat(v1, &v7) < 0 || (v3 = mmap(0, v7.st_size, 1, 2, v2, 0), v3 == (void *)-1))
  {
    v5 = 0;
  }
  else
  {
    v4 = v3;
    v5 = xpc_create_from_plist();
    munmap(v4, v7.st_size);
  }
  close_NOCANCEL();
  return v5;
}

void si_list_add_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("si_item_retain", "si_data.c", a3, "rc >= 1");
}

void si_list_retain_cold_1()
{
  __assert_rtn("si_list_retain", "si_data.c", 138, "rc >= 1");
}

void si_list_release_cold_1()
{
  __assert_rtn("si_list_release", "si_data.c", 152, "rc >= 0");
}

void si_item_release_cold_1()
{
  __assert_rtn("si_item_release", "si_data.c", 189, "rc >= 0");
}

void si_set_nat64_v4_requires_synthesis_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_191F86000, v0, v1, "new_requires_synthesis is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_set_nat64_v4_synthesize_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_191F86000, v0, v1, "new_synthesize is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_set_path_check_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_191F86000, v0, v1, "new_path_check is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _gai_nat64_can_v4_address_be_synthesized_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_191F86000, v0, v1, "ipv4_addr is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _gai_load_libnetwork_once_cold_1(const char *a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v2 = "?";
  if (a1)
    v2 = a1;
  v3 = 136446210;
  v4 = v2;
  _os_log_error_impl(&dword_191F86000, a2, OS_LOG_TYPE_ERROR, "dlopen(\"...libnetwork.dylib\") failed: %{public}s", (uint8_t *)&v3, 0xCu);
}

void _gai_load_libnetwork_once_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_191F86000, v0, v1, "libnetwork.dylib did not set path_check", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _gai_load_libnetwork_once_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_191F86000, v0, v1, "libnetwork.dylib did not set nat64_v4_synthesize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _gai_load_libnetwork_once_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_191F86000, v0, v1, "libnetwork.dylib did not set nat64_v4_requires_synthesis", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _gai_load_libnetwork_once_cold_5()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_191F86000, v0, OS_LOG_TYPE_DEBUG, "Opening libnetwork.dylib", v1, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t mbr_identifier_translate_cold_1()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0_1();
  return mbr_identifier_translate_cold_2(v0);
}

uint64_t mbr_identifier_translate_cold_2()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0_1();
  return mbr_identifier_translate_cold_4(v0);
}

uint64_t mbr_identifier_translate_cold_4()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0_1();
  return mbr_identifier_translate_cold_11(v0);
}

uint64_t mbr_identifier_translate_cold_11()
{
  OUTLINED_FUNCTION_0_1();
  return _dd_extract_result_cold_1();
}

uint64_t _dd_extract_result_cold_1()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0_1();
  return _dd_extract_result_cold_2(v0);
}

void _dd_extract_result_cold_2()
{
  int v0;

  v0 = OUTLINED_FUNCTION_0_1();
  _muser_call_cold_1(v0);
}

void _muser_call_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C874D8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_191F86000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR, "_muser_call: Failure (%d) with retry, bailing", (uint8_t *)v1, 8u);
}

void _muser_call_cold_2(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl(&dword_191F86000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEBUG, "_muser_call: Error from xpc pipe (%d), retrying", buf, 8u);
}

void _muser_xpc_pipe_cold_1(int a1)
{
  _DWORD v1[2];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  v1[0] = 67109378;
  v1[1] = a1;
  v2 = 2080;
  v3 = xpc_strerror();
  _os_log_error_impl(&dword_191F86000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v1, 0x12u);
}

void si_destination_create_control_socket_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_191F86000, a1, a3, "socket(PF_SYSTEM, SOCK_DGRAM, SYSPROTO_CONTROL) failed: %m", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void si_destination_create_control_socket_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_191F86000, v0, v1, "ioctl(%d, CTLIOCGINFO, ...) failed: %m", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void si_destination_create_control_socket_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_191F86000, v0, v1, "fcntl(%d, F_GETFL, 0) failed: %m", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void si_destination_create_control_socket_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_191F86000, v0, v1, "fcntl(%d, F_SETFL, %d) failed: %m", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_create_control_socket_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_191F86000, v0, v1, "setsockopt(%d, SOL_SOCKET, SO_RCVBUF, %d) failed: %m", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_create_control_socket_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_191F86000, v0, v1, "connect(%d, ...) ctl_id=%u, failed: %m", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_create_control_socket_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_191F86000, v0, v1, "setsockopt(%d, SOL_SOCKET, SO_NOSIGPIPE, ...) failed: %m", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_191F86000, a1, a3, "%{public}s dst1 is NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_191F86000, a1, a3, "%{public}s dst2 is NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "si_destination_lookup for dst1 failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "si_destination_lookup for dst2 failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_191F86000, a2, a3, "prefer 2, dst 1 has no successful connections and %u attempts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "Rule 6, prefer d1, d1 precedence %d > d2 precedence %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "Rule 6, prefer d2, d2 precedence %d > d1 precedence %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "Rule 8, prefer d1, d1 scope %d < d2 scope %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_9()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "Rule 8, prefer d2, d2 scope %d < d1 scope %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 9, prefer d1, d1 shares more common prefix", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 9, prefer d2, d2 shares more common prefix", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer d1, known while d2 not known", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer d2, known while d1 not known", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 7, prefer d2, d1 src is not native", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 7, prefer d1, d2 src is not native", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 5, prefer d1, d2 dst label does not match src label", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 5, prefer d2, d1 dst label does not match src label", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 3a, prefer d1, d2 source is optimistic", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 3a, prefer d2, d1 source is optimistic", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 3, prefer d1, d2 source is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_21()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 3, prefer d2, d1 source is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 2, prefer d1, d2 dst scope does not match src scope", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_23()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 2, prefer d2, d1 dst scope does not match src scope", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 1, prefer d2, d1 is not routable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_25()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "Rule 1, prefer d1, d2 is not routable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_26()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer 2, dst 1 has no route", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_27()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer 1, dst 2 has no route", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer 2, dst 2 is local, dst 1 is not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_29()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer 1, dst 1 is local, dst 2 is not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer 2, dst 2 is loopback, dst 1 is not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_31()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer 1, dst 1 is loopback, dst 2 is not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_32()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer dst 2, dst 1 is p2p, dst 2 is not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_33()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "prefer dst 1, dst 2 is p2p, dst 1 is not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_cold_34(unsigned int a1, NSObject *a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  v2 = 134217984;
  v3 = (double)a1 * 0.03125;
  _os_log_debug_impl(&dword_191F86000, a2, OS_LOG_TYPE_DEBUG, "no preference, equal min rtt %f", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_35(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_191F86000, a2, a3, "prefer 1, dst 2 has no successful connections and %u attempts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void si_destination_compare_no_dependencies_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_191F86000, a1, a3, "%{public}s dst1 is NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_no_dependencies_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_191F86000, a1, a3, "%{public}s dst2 is NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_no_dependencies_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "ND Rule 6, prefer d1, d1 precedence %d > d2 precedence %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_no_dependencies_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "ND Rule 6, prefer d2, d2 precedence %d > d1 precedence %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_no_dependencies_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "ND Rule 8, prefer d1, d1 scope %d < d2 scope %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_no_dependencies_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_191F86000, v0, v1, "ND Rule 8, prefer d2, d2 scope %d < d1 scope %d", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_lookup_cold_1(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C874D8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_191F86000, a2, OS_LOG_TYPE_ERROR, "(dst_sa->sa_len %u > sizeof(cache_entry->dce_entry.d_dst.addr))", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void si_destination_lookup_cold_2(os_log_t log)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  v1 = 134218242;
  v2 = 112;
  v3 = 96;
  _os_log_error_impl(&dword_191F86000, log, OS_LOG_TYPE_ERROR, "calloc(%zu) failed: %m", (uint8_t *)&v1, 0xEu);
  OUTLINED_FUNCTION_5();
}

void si_destination_fill_netsrc_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_191F86000, v0, v1, "sockaddr is too big", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void si_destination_fill_netsrc_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_191F86000, a1, a3, "recv failed: %m", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void si_destination_fill_netsrc_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_191F86000, a1, a3, "send failed: %m", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void darwin_directory_grouplist_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  __darwin_directory_grouplist_block_invoke_2_cold_1();
}

void __darwin_directory_grouplist_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  svc_run();
}

void svc_run(void)
{
  int v0;
  fd_set v1;

  do
  {
    while (1)
    {
      do
      {
        memcpy(&v1, &svc_fdset, sizeof(v1));
        v0 = select_NOCANCEL();
      }
      while (!v0);
      if (v0 == -1)
        break;
      svc_getreqset(&v1);
    }
  }
  while (*__error() == 4);
  perror("svc_run: - select failed");
}

void xdrrec_create_cold_1(void **a1, void *a2)
{
  warnx("xdrrec_create: out of memory");
  free(*a1);
  free(a2);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x1E0C87C80](sdRef);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1E0C87C88](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecordWithAttribute(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t ifindex, const char *name, uint16_t rrtype, uint16_t rrclass, const DNSServiceAttribute *attr, DNSServiceQueryRecordReply callback, void *context)
{
  return MEMORY[0x1E0C87C90](sdRef, *(_QWORD *)&flags, *(_QWORD *)&ifindex, name, rrtype, rrclass, attr, callback);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x1E0C87C98](sdRef);
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x1E0C87CA0](sdRef);
}

uint64_t DarwinDirectoryGetGeneration()
{
  return MEMORY[0x1E0C87C68]();
}

uint64_t DarwinDirectoryRecordStoreApply()
{
  return MEMORY[0x1E0C87C70]();
}

uint64_t DarwinDirectoryRecordStoreApplyWithFilter()
{
  return MEMORY[0x1E0C87C78]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1E0C87D78](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __initgroups()
{
  return MEMORY[0x1E0C87DD8]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C874A0](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C874A8]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C874B0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C874B8]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C874F0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C874F8]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C87500]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C87518](*(_QWORD *)&a1);
}

uint64_t _inet_aton_check()
{
  return MEMORY[0x1E0C87520]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1E0C87CB8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88E90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EA8](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB0](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB8](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C87FB8]();
}

uint64_t accept_NOCANCEL()
{
  return MEMORY[0x1E0C87FC0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C87608]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C87630](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C87FD8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1E0C88020]();
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C87680](a1);
}

uint64_t connect_NOCANCEL()
{
  return MEMORY[0x1E0C88030]();
}

char *__cdecl devname_r(dev_t a1, mode_t a2, char *buf, int len)
{
  return (char *)MEMORY[0x1E0C87698](*(_QWORD *)&a1, a2, buf, *(_QWORD *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F98](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C87028](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C87340](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C87348]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C87350](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C87358](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C876C0](a1);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1E0C88098]();
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C876E8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C876F0](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C876F8](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C880D0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C87728](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87730](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C87740](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C87748](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C87750](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C87768](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C87798](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1E0C877A0](a1);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C88150]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x1E0C88178](*(_QWORD *)&a1, a2);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1E0C877B0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C881B0](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C881B8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C877C8](a1, a2);
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1E0C881F8](*(_QWORD *)&host, multiuser_flags);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return MEMORY[0x1E0C877D8](a1, a2);
}

in_addr inet_makeaddr(in_addr_t a1, in_addr_t a2)
{
  return (in_addr)MEMORY[0x1E0C877E0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

in_addr_t inet_netof(in_addr a1)
{
  return MEMORY[0x1E0C877E8](*(_QWORD *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C877F0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C877F8](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C88228](*(_QWORD *)&a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1E0C88230]();
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1E0C88240](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x1E0C88288]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x1E0C88290](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C882A8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C88338](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C88348](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C88358](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1E0C88378](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C883B8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C88400](info);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1E0C88928]();
}

int malloc_make_nonpurgeable(void *ptr)
{
  return MEMORY[0x1E0C88938](ptr);
}

void malloc_make_purgeable(void *ptr)
{
  MEMORY[0x1E0C88940](ptr);
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

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88990](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88998](zone, ptr, size, type_id);
}

malloc_zone_t *__cdecl malloc_zone_from_ptr(const void *ptr)
{
  return (malloc_zone_t *)MEMORY[0x1E0C889A0](ptr);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C88500](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C88518](a1, a2);
}

uint64_t nanosleep_NOCANCEL()
{
  return MEMORY[0x1E0C87868]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C889D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C889E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C889E8](*(_QWORD *)&token, state64);
}

uint64_t notify_peek()
{
  return MEMORY[0x1E0C889F8]();
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C88A08](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x1E0C88A18]();
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1E0C88530]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C87878](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C88EF8](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

void perror(const char *a1)
{
  MEMORY[0x1E0C87888](a1);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x1E0C88CA0](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C88D28](a1);
}

int pthread_is_threaded_np(void)
{
  return MEMORY[0x1E0C88D38]();
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C88D40](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C88D58]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D60](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C88D68](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D70](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D80](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C88D88](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C88DB8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C88DC8](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C878A0](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C878A8](__base, __nel, __width, __compar);
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1E0C88648]();
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C878C8](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C889B0](__ptr, __size);
}

uint64_t recv_NOCANCEL()
{
  return MEMORY[0x1E0C878D8]();
}

uint64_t recvfrom_NOCANCEL()
{
  return MEMORY[0x1E0C88658]();
}

uint64_t select_NOCANCEL()
{
  return MEMORY[0x1E0C88670]();
}

uint64_t send_NOCANCEL()
{
  return MEMORY[0x1E0C87910]();
}

uint64_t sendto_NOCANCEL()
{
  return MEMORY[0x1E0C886A8]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1E0C886B8](*(_QWORD *)&a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C886F8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int sigblock(int a1)
{
  return MEMORY[0x1E0C87928](*(_QWORD *)&a1);
}

int sigsetmask(int a1)
{
  return MEMORY[0x1E0C87938](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C88728](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87958](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87960](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C88738](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C88740](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C87980](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87988](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C87998](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C879F0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C879F8](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C87A08](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87A18](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A48](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C87A88](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C87A90](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C87AB8](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C87B08](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B18](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

void warnx(const char *a1, ...)
{
  MEMORY[0x1E0C87B38](a1);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x1E0C888E8]();
}

uint64_t writev_NOCANCEL()
{
  return MEMORY[0x1E0C888F8]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C89060](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C89070](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C89088](xarray, index);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C89158]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C89190](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891C0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C89200](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C89220](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C89230](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C89238](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C89280](xint);
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x1E0C89298]();
}

uint64_t xpc_pipe_create_with_user_session_uid()
{
  return MEMORY[0x1E0C892A0]();
}

uint64_t xpc_pipe_invalidate()
{
  return MEMORY[0x1E0C892A8]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x1E0C892B0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C892C0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C892C8](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C892D0]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C892E8](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C89300]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C89308]();
}

