uint64_t sub_100002A6C(uint64_t a1)
{
  int *v2;
  int *v3;
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  char *v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void **v23;
  unsigned int v24;
  NSObject *v26;
  uint64_t v27;
  void **v28;
  uint64_t v29;
  int v30;
  char *v31;

  v31 = (char *)malloc_type_malloc(0x10uLL, 0x1080040FC6463CFuLL);
  if (!v31)
    return 12;
  if (qword_100020708)
  {
    *(_OWORD *)v31 = *(_OWORD *)qword_100020708;
  }
  else
  {
    *(_QWORD *)v31 = 0;
    *((_QWORD *)v31 + 1) = 0;
  }
  v2 = (int *)malloc_type_malloc(4 * *(int *)(a1 + 128), 0x100004052888210uLL);
  if (!v2)
    goto LABEL_57;
  v3 = v2;
  if (*(int *)(a1 + 128) < 1)
  {
    v12 = *((_DWORD *)v31 + 3);
    v6 = (int *)(v31 + 8);
    v13 = 8 * v12;
    if (*((_DWORD *)v31 + 2) < v12)
      goto LABEL_29;
LABEL_28:
    v12 += 128;
    goto LABEL_29;
  }
  v4 = 0;
  v5 = 0;
  v6 = (int *)(v31 + 8);
  do
  {
    v7 = *v6;
    if ((int)v7 < 1)
    {
      LODWORD(v8) = 0;
    }
    else
    {
      v8 = 0;
      v9 = *(_DWORD *)(a1 + 112);
      v10 = *(_QWORD *)v31;
      while (1)
      {
        v11 = *(_QWORD *)(v10 + 8 * v8);
        if ((!v9 || v9 == *(_DWORD *)(v11 + 8))
          && !strcmp(*(const char **)(*(_QWORD *)(a1 + 136) + 8 * v4), *(const char **)v11)
          && ((*(_DWORD *)(a1 + 188) & 0x100) != 0 && (*(_WORD *)(v11 + 14) & 1) != 0
           || (*(_DWORD *)(a1 + 188) & 0x100) == 0 && (*(_WORD *)(v11 + 14) & 1) == 0))
        {
          break;
        }
        if (v7 == ++v8)
          goto LABEL_22;
      }
      v3[v4] = v8;
      ++*(_DWORD *)(v11 + 16);
      LODWORD(v7) = *v6;
    }
    if ((int)v8 >= (int)v7)
    {
LABEL_22:
      v3[v4] = -1;
      ++v5;
    }
    ++v4;
  }
  while (v4 < *(int *)(a1 + 128));
  v12 = *((_DWORD *)v31 + 3);
  v13 = 8 * v12;
  if (*((_DWORD *)v31 + 2) + v5 < v12)
    goto LABEL_29;
  if (v5 <= 127)
    goto LABEL_28;
  v12 += (v5 + 31) & 0xFFFFFFE0;
LABEL_29:
  v14 = (char *)malloc_type_calloc(v12, 8uLL, 0x2004093837F09uLL);
  if (!v14)
    goto LABEL_56;
  v15 = v14;
  if (*(_QWORD *)v31)
    memcpy(v14, *(const void **)v31, v13);
  v16 = *v6;
  v30 = v12;
  if (*(int *)(a1 + 128) < 1)
  {
LABEL_40:
    qsort(v15, v16, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100002E54);
    *(_QWORD *)v31 = v15;
    *((_DWORD *)v31 + 2) = v16;
    *((_DWORD *)v31 + 3) = v30;
    v23 = (void **)qword_100020708;
    qword_100020708 = (uint64_t)v31;
    __dmb(0xBu);
    do
    {
      do
        v24 = __ldxr(&dword_100020718);
      while (__stxr(v24, &dword_100020718));
      if (!v24)
        break;
      usleep(0x2710u);
    }
    while ((void **)qword_100020710 == v23);
    if (v23)
    {
      free(*v23);
      free(v23);
    }
    free(v3);
    return 0;
  }
  v17 = 0;
  v18 = 0;
  while (1)
  {
    v19 = v3[v18];
    if ((_DWORD)v19 == -1)
      break;
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + v17 + 8) = *(_QWORD *)(*(_QWORD *)&v15[8 * v19] + 24);
    __dmb(0xBu);
    *(_QWORD *)(*(_QWORD *)&v15[8 * v3[v18]] + 24) = *(_QWORD *)(a1 + 200) + v17;
LABEL_39:
    ++v18;
    v17 += 16;
    if (v18 >= *(int *)(a1 + 128))
      goto LABEL_40;
  }
  v20 = malloc_type_malloc(0x20uLL, 0x10300405734DD4FuLL);
  *(_QWORD *)&v15[8 * v16] = v20;
  if (!v20)
    goto LABEL_48;
  v21 = *(_QWORD *)(a1 + 136);
  *v20 = strdup(*(const char **)(v21 + 8 * v18));
  v22 = *(_QWORD *)&v15[8 * v16];
  if (*(_QWORD *)v22)
  {
    *(_DWORD *)(v22 + 8) = *(_DWORD *)(a1 + 112);
    *(_WORD *)(v22 + 12) = strlen(*(const char **)(v21 + 8 * v18));
    *(_WORD *)(v22 + 14) = (*(_DWORD *)(a1 + 188) >> 8) & 1;
    *(_DWORD *)(v22 + 16) = 1;
    *(_QWORD *)(v22 + 24) = *(_QWORD *)(a1 + 200) + v17;
    ++v16;
    goto LABEL_39;
  }
  free(*(void **)&v15[8 * v16]);
LABEL_48:
  v26 = sub_1000094B4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    sub_10001570C();
  v27 = *v6;
  if ((int)v27 < v16)
  {
    v28 = (void **)&v15[8 * v27];
    v29 = v16 - v27;
    do
    {
      if (*v28)
        free(*v28);
      ++v28;
      --v29;
    }
    while (v29);
  }
  free(v15);
LABEL_56:
  free(v3);
LABEL_57:
  free(v31);
  return 12;
}

uint64_t sub_100002E54(const char ***a1, const char ***a2)
{
  return -strcmp(**a1, **a2);
}

uint64_t sub_100002E7C(unint64_t a1)
{
  const char *v2;
  int v3;
  _opaque_pthread_t *v4;
  uid_t v5;
  passwd *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint64_t (***v16)();
  BOOL v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  uid_t v23;
  int i;
  uint64_t v25;
  unint64_t v26;
  unsigned __int8 *v27;
  char v28;
  unsigned int v29;
  int v30;
  int v31;
  NSObject *v32;
  int v33;
  int v34;
  NSObject *v35;
  const char *v36;
  uint32_t v37;
  NSObject *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int32_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  uint64_t v49;
  _OWORD *v50;
  int v52;
  const char **v53;
  uint64_t (*v54)(_QWORD, uint64_t, _QWORD *, _OWORD *, _DWORD *, _DWORD *, mach_msg_type_number_t *, _QWORD *, _DWORD *);
  int v55;
  unsigned int v56;
  uint64_t v57;
  size_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  unint64_t v71;
  unsigned __int8 *v72;
  char v73;
  unsigned int v74;
  int v75;
  int v76;
  NSObject *v77;
  char v78;
  char *v79;
  char v80;
  char *v81;
  int v82;
  __int128 v83;
  _OWORD *v84;
  int v85;
  BOOL v86;
  __int128 v87;
  char *v88;
  char *v89;
  char *v90;
  char v91;
  unsigned __int8 *v92;
  int v93;
  NSObject *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  __int128 v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  size_t v107;
  int v108;
  int v109;
  unint64_t v110;
  int v111;
  NSObject *v112;
  uint64_t v114;
  uint64_t (*v115)(_QWORD);
  int v116;
  int v117;
  NSObject *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  kern_return_t v123;
  kern_return_t v124;
  NSObject *v125;
  NSObject *v126;
  uint64_t v127;
  int v128;
  int v129;
  void *v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  uint64_t v135;
  int v136;
  int v137;
  int *v138;
  char *v139;
  int v140;
  int v141;
  pthread_cond_t *v142;
  int v143;
  char v144;
  char *v145;
  uint64_t v146;
  uid_t *v147;
  uint64_t v148;
  int v149;
  unsigned int v150;
  stat v151;
  char __str[50];
  statfs buf;
  __int128 v154;
  _OWORD v155[16];
  _DWORD v156[32];
  _DWORD v157[32];
  _QWORD v158[32];
  mach_msg_type_number_t thread_info_outCnt[2];
  _QWORD v160[33];
  _DWORD v161[32];

  v2 = "client";
  v3 = *(_DWORD *)(a1 + 188);
  if ((v3 & 0x20) != 0)
    v2 = "disklogger";
  snprintf(__str, 0x32uLL, "com.apple.fseventsd.%s.%d", v2, *(_DWORD *)(a1 + 248));
  pthread_setname_np(__str);
  v4 = pthread_self();
  *(_DWORD *)(a1 + 320) = pthread_mach_thread_np(v4);
  if ((v3 & 0x20) != 0)
    setiopolicy_np(0, 1, 2);
  v5 = *(_DWORD *)(a1 + 252);
  v147 = (uid_t *)(a1 + 252);
  if (v5)
  {
    if (!*(_QWORD *)(a1 + 344))
    {
      v6 = getpwuid(v5);
      if (v6)
      {
        *(_QWORD *)(a1 + 344) = strdup(v6->pw_name);
      }
      else
      {
        v7 = sub_1000094B4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_1000168DC((uint64_t)v147, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if (*v147 && *(_DWORD *)(a1 + 112))
      sub_100013024();
  }
  if ((*(_DWORD *)(a1 + 188) & 0x400) == 0)
  {
    sub_100010BEC(a1);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    *(_DWORD *)(a1 + 188) |= 0x400u;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
  v144 = v3;
  if (*v147)
  {
    pthread_setugid_np(*v147, *(_DWORD *)(a1 + 256));
    v14 = *(const char **)(a1 + 344);
    if (v14)
    {
      if (initgroups(v14, *(_DWORD *)(a1 + 256)) < 0)
      {
        v15 = sub_1000094B4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v135 = *(_QWORD *)(a1 + 344);
          v3 = *(_DWORD *)(a1 + 252);
          v136 = *(_DWORD *)(a1 + 256);
          v137 = *__error();
          v138 = __error();
          v139 = strerror(*v138);
          buf.f_bsize = 136316162;
          *(_QWORD *)&buf.f_iosize = v135;
          WORD2(buf.f_blocks) = 1024;
          *(_DWORD *)((char *)&buf.f_blocks + 6) = v3;
          LOBYTE(v3) = v144;
          WORD1(buf.f_bfree) = 1024;
          HIDWORD(buf.f_bfree) = v136;
          LOWORD(buf.f_bavail) = 1024;
          *(_DWORD *)((char *)&buf.f_bavail + 2) = v137;
          HIWORD(buf.f_bavail) = 2080;
          buf.f_files = (uint64_t)v139;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "client_loop: initgroups failed for user %s uid %d gid %d (err: %d/%s)", (uint8_t *)&buf, 0x28u);
        }
      }
    }
  }
  v16 = &off_100020000;
  if (!dword_1000206C8)
  {
    v142 = (pthread_cond_t *)(a1 + 64);
    v50 = (_OWORD *)(a1 + 260);
    v150 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_NO_REPORT | 1;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 188) & 0x1A) != 0)
        goto LABEL_22;
      pthread_mutex_lock((pthread_mutex_t *)a1);
      if (!*((_DWORD *)v16 + 434) && (*(_DWORD *)(a1 + 188) & 0x21B) == 0)
      {
        if ((v3 & 0x20) != 0)
        {
          if (pthread_cond_wait(v142, (pthread_mutex_t *)a1))
            goto LABEL_26;
        }
        else
        {
          *(_QWORD *)&buf.f_bsize = 0;
          buf.f_blocks = 0;
          v160[1] = 0;
          v160[0] = 0;
          gettimeofday((timeval *)&buf, 0);
          v160[0] = *(_QWORD *)&buf.f_bsize + 15;
          v160[1] = 0;
          if (pthread_cond_timedwait(v142, (pthread_mutex_t *)a1, (const timespec *)v160) == 60
            && *(_DWORD *)(a1 + 240) == *(_DWORD *)(a1 + 244))
          {
            *(_DWORD *)(a1 + 188) |= 0x800u;
            pthread_mutex_unlock((pthread_mutex_t *)a1);
            pthread_exit(0);
          }
        }
      }
      pthread_mutex_unlock((pthread_mutex_t *)a1);
      if (!*((_DWORD *)v16 + 434) || (v3 & 0x20) != 0)
        break;
LABEL_238:
      if (*((_DWORD *)v16 + 434))
        goto LABEL_22;
    }
    if ((*(_DWORD *)(a1 + 188) & 2) != 0
      || ((*(_DWORD *)(a1 + 188) & 1) != 0 ? (v52 = sub_100010E20(a1)) : (v52 = 0), (*(_DWORD *)(a1 + 188) & 2) != 0))
    {
LABEL_216:
      memset(&buf, 0, 40);
      thread_info_outCnt[0] = 10;
      v123 = thread_info(*(_DWORD *)(a1 + 320), 3u, (thread_info_t)&buf, thread_info_outCnt);
      if (v123)
      {
        v124 = v123;
        v125 = sub_1000094B4();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v160[0]) = 136315394;
          *(_QWORD *)((char *)v160 + 4) = "client_get_thread_info";
          WORD2(v160[1]) = 1024;
          *(_DWORD *)((char *)&v160[1] + 6) = v124;
          _os_log_error_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%s : [%d]thread_info", (uint8_t *)v160, 0x12u);
        }
      }
      else
      {
        *(_OWORD *)(a1 + 324) = *(_OWORD *)&buf.f_bsize;
      }
      if ((*(_DWORD *)(a1 + 188) & 8) == 0)
      {
        if ((*(_DWORD *)(a1 + 188) & 0x10) == 0)
          goto LABEL_233;
        if (*(_QWORD *)(a1 + 120))
        {
          if (syscall(348, *(_QWORD *)(a1 + 120)))
          {
            v126 = sub_1000094B4();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
              v127 = *(_QWORD *)(a1 + 120);
              buf.f_bsize = 136315138;
              *(_QWORD *)&buf.f_iosize = v127;
              _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "client: failed to chdir back to %s", (uint8_t *)&buf, 0xCu);
            }
            goto LABEL_233;
          }
        }
        else if (sub_100013024())
        {
          goto LABEL_233;
        }
        *(_DWORD *)(a1 + 188) &= ~0x10u;
        goto LABEL_233;
      }
      v128 = open(".", 0);
      if (v128 >= 1)
      {
        v129 = v128;
        if (!fcntl(v128, 50, &buf))
        {
          v130 = *(void **)(a1 + 120);
          if (v130)
            free(v130);
          *(_QWORD *)(a1 + 120) = strdup((const char *)&buf);
        }
        close(v129);
      }
      *(_DWORD *)(a1 + 188) &= ~8u;
      *(_DWORD *)(a1 + 188) |= 0x40u;
      syscall(348, "/");
LABEL_233:
      if ((v3 & 0x20) != 0)
      {
        while (1)
        {
          v131 = __ldxr((unsigned int *)&unk_100020700);
          if (v131 != 1)
            break;
          if (!__stxr(0, (unsigned int *)&unk_100020700))
          {
            sub_100009F54((uint64_t (*)(void))sub_10000A1FC);
            goto LABEL_238;
          }
        }
        __clrex();
      }
      goto LABEL_238;
    }
    memset(v155, 0, sizeof(v155));
    if ((*(_DWORD *)(a1 + 188) & 0x200) != 0)
    {
      v53 = *(const char ***)(a1 + 136);
      *(_QWORD *)&v155[0] = *v53;
      v160[0] = strlen(*v53) + 1;
      v161[0] = 0x8000000;
      *(_QWORD *)thread_info_outCnt = *(_QWORD *)(a1 + 168);
      v156[0] = 0;
      v54 = *(uint64_t (**)(_QWORD, uint64_t, _QWORD *, _OWORD *, _DWORD *, _DWORD *, mach_msg_type_number_t *, _QWORD *, _DWORD *))(a1 + 208);
      if (v54)
      {
        v55 = v54(*(_QWORD *)(a1 + 216), 1, v160, v155, v161, v156, thread_info_outCnt, v158, v157);
        if (!v55)
        {
          *(_DWORD *)(a1 + 188) &= ~0x200u;
          if ((*(_DWORD *)(a1 + 188) & 2) != 0)
            goto LABEL_216;
LABEL_98:
          v56 = sub_100007B5C((_DWORD *)a1);
          if (v56)
          {
            v57 = v56;
            v58 = (int)v56;
            v59 = (char *)malloc_type_malloc(8 * (int)v56, 0x2004093837F09uLL);
            if (!v59)
              goto LABEL_22;
            v60 = v59;
            if ((int)v58 <= 0)
            {
              qsort(v59, v58, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100007E90);
LABEL_214:
              free(v60);
              v16 = &off_100020000;
            }
            else
            {
              v61 = 0;
              v62 = *(_DWORD *)(a1 + 224);
              do
              {
                *(_QWORD *)&v59[8 * v61] = *(_QWORD *)(*(_QWORD *)(a1 + 416)
                                                     + 8 * (((int)v61 + *(_DWORD *)(a1 + 240)) % v62));
                ++v61;
              }
              while (v57 != v61);
              qsort(v59, v58, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100007E90);
              v63 = 0;
              v64 = *(_DWORD *)(a1 + 224);
              do
              {
                *(_QWORD *)(*(_QWORD *)(a1 + 416) + 8 * (((int)v63 + *(_DWORD *)(a1 + 240)) % v64)) = *(_QWORD *)&v60[8 * v63];
                ++v63;
              }
              while (v57 != v63);
              v141 = v57;
              v65 = 0;
              v66 = 0;
              v140 = 0;
              v67 = a1 + 352;
              v145 = v60;
              do
              {
                v143 = v65;
                if ((*(_DWORD *)(a1 + 188) & 2) != 0)
                  break;
                LODWORD(v68) = v141 - v65;
                if ((v141 - v143) >= 0x20)
                  v68 = 32;
                else
                  v68 = v68;
                v146 = v68;
                if ((_DWORD)v68)
                {
                  v69 = 0;
                  v70 = 0;
                  while (1)
                  {
                    memset(&v151, 0, sizeof(v151));
                    v148 = v69;
                    v66 = *(_QWORD *)&v60[8 * v69 + 8 * v143];
                    v71 = *(unsigned int *)(a1 + 192);
                    v72 = (unsigned __int8 *)(v66 + (v71 >> 3) + 56);
                    v73 = v71 & 7;
                    v74 = 0x80u >> (v71 & 7);
                    v75 = -129 >> v73;
                    do
                      v76 = __ldxr(v72);
                    while (__stxr(v76 & v75, v72));
                    v149 = v70;
                    if ((v74 & v76) == 0)
                    {
                      v77 = sub_1000094B4();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        v111 = *(_DWORD *)(a1 + 192);
                        buf.f_bsize = 134218240;
                        *(_QWORD *)&buf.f_iosize = v66;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v111;
                        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "client loop: event %p did not have my bit (%d) set!", (uint8_t *)&buf, 0x12u);
                      }
                    }
                    if (*v147)
                      break;
LABEL_178:
                    v104 = 0;
                    v105 = *(const char **)(v66 + 120);
                    do
                    {
                      v106 = *(const char **)(v67 + v104);
                      if (!v106)
                        break;
                      v107 = strlen(*(const char **)(v67 + v104));
                      if (!strncmp(v105, v106, v107))
                        goto LABEL_189;
                      v104 += 8;
                    }
                    while (v104 != 64);
                    v108 = v149;
                    *((_QWORD *)v155 + v149) = v105;
                    v160[v149] = *(__int16 *)(v66 + 52);
                    v109 = *(_DWORD *)(v66 + 20);
                    v161[v149] = v109;
                    v156[v149] = *(_DWORD *)(v66 + 28);
                    *(_QWORD *)&thread_info_outCnt[2 * v149] = *(_QWORD *)(v66 + 32);
                    v158[v149] = *(_QWORD *)(v66 + 40);
                    v157[v149] = *(_DWORD *)(v66 + 48);
                    if ((*(_DWORD *)(a1 + 188) & 0x1000) != 0 && *(_DWORD *)(a1 + 248) == *(_DWORD *)(v66 + 24))
                      v161[v149] = v109 | 0x200000;
                    v110 = *(_QWORD *)(v66 + 32);
                    v60 = v145;
                    if (v110 > *(_QWORD *)(a1 + 160))
                      *(_QWORD *)(a1 + 160) = v110;
LABEL_190:
                    v70 = v108 + 1;
                    v69 = v148 + 1;
                    if (v148 + 1 == v146)
                      goto LABEL_193;
                  }
                  v78 = 1;
                  while (2)
                  {
                    if (*(_DWORD *)(a1 + 292) || (*(_BYTE *)(v66 + 23) & 6) != 0)
                      goto LABEL_178;
                    v79 = *(char **)(v66 + 120);
                    if (*v79)
                    {
                      if (strncmp(*(const char **)(v66 + 120), ".docid/", 7uLL) && strncmp(v79, ".activity/", 0xAuLL))
                      {
                        v80 = 1;
                        goto LABEL_128;
                      }
                      v154 = 0uLL;
                      DWORD2(v154) = *(_DWORD *)(v66 + 28);
                      sub_100009F54((uint64_t (*)(void))sub_10000BF2C);
                      v79 = (char *)v154;
                      if ((_QWORD)v154)
                      {
                        v80 = 0;
                        goto LABEL_128;
                      }
                      v94 = sub_1000094B4();
                      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                      {
                        v95 = *(_DWORD *)(v66 + 28);
                        buf.f_bsize = 136315394;
                        *(_QWORD *)&buf.f_iosize = "client_process_events";
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v95;
                        _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%s: path for pseudo path  device(%d)  is not available", (uint8_t *)&buf, 0x12u);
                      }
LABEL_156:
                      if ((*(_DWORD *)(a1 + 188) & 0x40) == 0 || (v78 & 1) == 0)
                        goto LABEL_189;
                      memset(&buf, 0, 512);
                      v101 = *(const char **)(a1 + 120);
                      if (v101)
                      {
                        if (!statfs(v101, &buf)
                          && buf.f_fsid.val[0] == *(_DWORD *)(a1 + 112)
                          && syscall(348, *(_QWORD *)(a1 + 120)))
                        {
                          v112 = sub_1000094B4();
                          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                          {
                            v114 = *(_QWORD *)(a1 + 120);
                            LODWORD(v154) = 136315138;
                            *(_QWORD *)((char *)&v154 + 4) = v114;
                            _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "client: failed to chdir back to %s", (uint8_t *)&v154, 0xCu);
                          }
LABEL_189:
                          v108 = v149 - 1;
                          v60 = v145;
                          goto LABEL_190;
                        }
                      }
                      else if (sub_100013024())
                      {
                        goto LABEL_189;
                      }
                      v78 = 0;
                      *(_DWORD *)(a1 + 188) &= 0xFFFFFFAF;
                      if (!*(_DWORD *)(a1 + 252))
                        goto LABEL_178;
                      continue;
                    }
                    break;
                  }
                  v80 = 1;
                  v79 = ".";
LABEL_128:
                  if (!lstat(v79, &v151))
                  {
                    if (!*(_DWORD *)(a1 + 248))
                      sub_1000168B4();
                    goto LABEL_133;
                  }
                  if (*__error() == 2)
                    goto LABEL_130;
                  if (*__error() == 63)
                  {
                    v88 = strrchr(v79, 47);
                    if (v88)
                    {
                      v89 = v88;
                      v90 = v88 + 1;
                      if (strlen(v88 + 1) >= 0xFF)
                      {
                        v91 = *v90;
                        if (*v90)
                        {
                          v92 = (unsigned __int8 *)(v89 + 2);
                          while ((v91 & 0x80) == 0)
                          {
                            v93 = *v92++;
                            v91 = v93;
                            if (!v93)
                              goto LABEL_176;
                          }
LABEL_130:
                          v81 = sub_10001308C(v79);
                          v82 = access(v81, 4);
                          v83 = v50[1];
                          v84 = v50;
                          *(_OWORD *)&buf.f_bsize = *v50;
                          *(_OWORD *)&buf.f_bfree = v83;
                          v85 = sandbox_check_by_audit_token(&buf, "file-read-metadata", v150);
                          free(v81);
                          if (!(v82 | v85))
                          {
                            v86 = 1;
                            goto LABEL_152;
                          }
                          v96 = *(unsigned int *)(a1 + 128);
                          if ((int)v96 < 1)
                          {
                            v86 = 0;
LABEL_152:
                            v50 = v84;
                          }
                          else
                          {
                            v97 = 0;
                            v98 = *(char **)(v66 + 120);
                            v99 = *(_QWORD *)(a1 + 136);
                            v100 = 8 * v96;
                            while (!strstr(v98, *(const char **)(v99 + v97)))
                            {
                              v97 += 8;
                              if (v100 == v97)
                              {
                                v86 = 0;
                                LOBYTE(v3) = v144;
                                goto LABEL_152;
                              }
                            }
                            v102 = *(const char **)(v99 + v97);
                            if (*(_DWORD *)(a1 + 112))
                            {
                              if (*v102)
                                v79 = *(char **)(v99 + v97);
                              else
                                v79 = ".";
                              LOBYTE(v3) = v144;
                              v50 = v84;
                              if (!lstat(v79, &v151))
                              {
                                v67 = a1 + 352;
                                if (v151.st_uid != *v147)
                                  goto LABEL_176;
LABEL_133:
                                v87 = v50[1];
                                *(_OWORD *)&buf.f_bsize = *v50;
                                *(_OWORD *)&buf.f_bfree = v87;
LABEL_134:
                                v86 = sandbox_check_by_audit_token(&buf, "file-read-metadata", v150) == 0;
                                if ((v80 & 1) == 0)
LABEL_154:
                                  free(v79);
LABEL_155:
                                if (v86)
                                  goto LABEL_178;
                                goto LABEL_156;
                              }
                            }
                            else
                            {
                              LOBYTE(v3) = v144;
                              v50 = v84;
                              if (!lstat(v102, &v151))
                              {
                                v67 = a1 + 352;
                                if (v151.st_uid != *v147)
                                  goto LABEL_176;
                                v103 = v50[1];
                                *(_OWORD *)&buf.f_bsize = *v50;
                                *(_OWORD *)&buf.f_bfree = v103;
                                goto LABEL_134;
                              }
                            }
                            v86 = 0;
                          }
                          v67 = a1 + 352;
                          if ((v80 & 1) == 0)
                            goto LABEL_154;
                          goto LABEL_155;
                        }
                      }
                    }
                  }
LABEL_176:
                  v86 = 0;
                  if ((v80 & 1) == 0)
                    goto LABEL_154;
                  goto LABEL_155;
                }
                v70 = 0;
LABEL_193:
                v115 = *(uint64_t (**)(_QWORD))(a1 + 208);
                if (v115 && (*(_DWORD *)(a1 + 188) & 2) == 0 && v70 >= 1)
                {
                  v116 = v115(*(_QWORD *)(a1 + 216));
                  if (v116)
                  {
                    if (v116 == 268435459)
                      *(_DWORD *)(a1 + 188) |= 2u;
                    *(_DWORD *)(a1 + 188) |= 1u;
                    if (!*(_QWORD *)(a1 + 152))
                      *(_QWORD *)(a1 + 152) = *(_QWORD *)thread_info_outCnt;
                    v140 = v116;
                    v117 = *(_DWORD *)(a1 + 184);
                    *(_DWORD *)(a1 + 184) = v117 + 1;
                    if (v117 >= 5)
                    {
                      v118 = sub_1000094B4();
                      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                      {
                        v122 = *(_DWORD *)(a1 + 248);
                        buf.f_bsize = 134218496;
                        *(_QWORD *)&buf.f_iosize = a1;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v122;
                        WORD1(buf.f_bfree) = 1024;
                        HIDWORD(buf.f_bfree) = dword_1000206A0;
                        _os_log_error_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "SLOWDOWN: client %p (pid %d) sleeping due to too many errors (num usleeps %d)", (uint8_t *)&buf, 0x18u);
                      }
                      sleep(2u);
                      *(_DWORD *)(a1 + 184) = 0;
                    }
                  }
                  else
                  {
                    ++*(_QWORD *)(a1 + 304);
                    v140 = 0;
                    *(_QWORD *)(a1 + 296) += strlen(*(const char **)(v66 + 120));
                  }
                }
                if ((_DWORD)v146)
                {
                  v119 = (uint64_t *)&v60[8 * v143];
                  v120 = v146;
                  do
                  {
                    v121 = *v119++;
                    sub_100006B64(v121);
                    --v120;
                  }
                  while (v120);
                }
                *(_DWORD *)(a1 + 240) = (*(_DWORD *)(a1 + 240) + v146) % *(_DWORD *)(a1 + 224);
                if (v140 == 268435460 || v140 == 268435469)
                  goto LABEL_214;
                v67 = a1 + 352;
                v65 = v146 + v143;
              }
              while ((int)v146 + v143 < v141);
              free(v60);
              v16 = &off_100020000;
              if (v140)
                goto LABEL_22;
            }
          }
          goto LABEL_216;
        }
        v52 = v55;
        if (v55 == 268435459)
        {
          *(_DWORD *)(a1 + 188) |= 2u;
          if ((*(_DWORD *)(a1 + 188) & 2) != 0)
            goto LABEL_216;
LABEL_96:
          *(_QWORD *)&buf.f_bsize = 0;
          buf.f_blocks = 0;
          gettimeofday((timeval *)&buf, 0);
          *(_QWORD *)&v151.st_dev = *(_QWORD *)&buf.f_bsize + 1;
          v151.st_ino = 0;
          pthread_mutex_lock((pthread_mutex_t *)a1);
          pthread_cond_timedwait(v142, (pthread_mutex_t *)a1, (const timespec *)&v151);
          pthread_mutex_unlock((pthread_mutex_t *)a1);
          goto LABEL_216;
        }
      }
    }
    if ((*(_DWORD *)(a1 + 188) & 2) != 0)
      goto LABEL_216;
    if (v52)
      goto LABEL_96;
    goto LABEL_98;
  }
LABEL_22:
  if (*((_DWORD *)v16 + 434))
    v17 = (v3 & 0x20) == 0;
  else
    v17 = 0;
  if (!v17)
  {
LABEL_26:
    if (*v147 && *(_DWORD *)(a1 + 112))
      syscall(348, "/");
    pthread_mutex_lock((pthread_mutex_t *)a1);
    *(_DWORD *)(a1 + 188) |= 2u;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    do
      v18 = __ldxr(&dword_10002071C);
    while (__stxr(v18, &dword_10002071C));
    if (v18)
    {
      v19 = 0;
      do
      {
        usleep(0x1388u);
        do
          v20 = __ldxr(&dword_10002071C);
        while (__stxr(v20, &dword_10002071C));
        if (v20)
          v21 = v19 >= 0x1387;
        else
          v21 = 1;
        ++v19;
      }
      while (!v21);
    }
    pthread_mutex_lock(&stru_100020140);
    v22 = sub_100007B5C((_DWORD *)a1);
    if (v22 >= 1)
    {
      v23 = v22;
      for (i = 0; i != v23; ++i)
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 416) + 8 * ((*(_DWORD *)(a1 + 240) + i) % *(_DWORD *)(a1 + 224)));
        if (v25)
        {
          v26 = *(unsigned int *)(a1 + 192);
          v27 = (unsigned __int8 *)(v25 + (v26 >> 3) + 56);
          v28 = v26 & 7;
          v29 = 0x80u >> (v26 & 7);
          v30 = -129 >> v28;
          do
            v31 = __ldxr(v27);
          while (__stxr(v31 & v30, v27));
          if ((v29 & v31) != 0)
          {
            sub_100006B64(v25);
          }
          else
          {
            v38 = sub_1000094B4();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = *(_DWORD *)(v25 + 20);
              v40 = *(_DWORD *)(a1 + 192);
              v41 = *(char *)(v25 + 56);
              v42 = *(char *)(v25 + 57);
              v43 = *(_DWORD *)(a1 + 240);
              v44 = *(_DWORD *)(a1 + 244);
              buf.f_bsize = 134220032;
              *(_QWORD *)&buf.f_iosize = v25;
              WORD2(buf.f_blocks) = 1024;
              *(_DWORD *)((char *)&buf.f_blocks + 6) = v39;
              WORD1(buf.f_bfree) = 1024;
              HIDWORD(buf.f_bfree) = v40;
              LOWORD(buf.f_bavail) = 1024;
              *(_DWORD *)((char *)&buf.f_bavail + 2) = v41;
              HIWORD(buf.f_bavail) = 1024;
              LODWORD(buf.f_files) = v42;
              WORD2(buf.f_files) = 1024;
              *(_DWORD *)((char *)&buf.f_files + 6) = i;
              WORD1(buf.f_ffree) = 1024;
              HIDWORD(buf.f_ffree) = v43;
              LOWORD(buf.f_fsid.val[0]) = 1024;
              *(int32_t *)((char *)buf.f_fsid.val + 2) = v44;
              HIWORD(buf.f_fsid.val[1]) = 1024;
              buf.f_owner = v23;
              v35 = v38;
              v36 = "client drain: event %p (mask 0x%x) did not have my bit (%d) set! (0x%x 0x%x) (i %d rd %d wr %d, num_pending %d)";
              v37 = 60;
              goto LABEL_53;
            }
          }
        }
        else
        {
          v32 = sub_1000094B4();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = *(_DWORD *)(a1 + 240) + i;
            v34 = *(_DWORD *)(a1 + 224);
            buf.f_bsize = 67109120;
            buf.f_iosize = v33 % v34;
            v35 = v32;
            v36 = "client drain: *** encountered a NULL entry at idx %d";
            v37 = 8;
LABEL_53:
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&buf, v37);
          }
        }
      }
    }
    sub_10000B9A8(a1);
    sub_10000BD90(a1);
    pthread_mutex_unlock(&stru_100020140);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    if ((v144 & 0x20) == 0)
      sub_100009B34(*(_QWORD *)(a1 + 216));
    free(*(void **)(a1 + 200));
    if (*(int *)(a1 + 128) >= 1)
    {
      v45 = 0;
      do
      {
        free(*(void **)(*(_QWORD *)(a1 + 136) + 8 * v45));
        *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8 * v45++) = 0;
      }
      while (v45 < *(int *)(a1 + 128));
    }
    free(*(void **)(a1 + 136));
    *(_QWORD *)(a1 + 136) = 0;
    for (j = 352; j != 416; j += 8)
    {
      free(*(void **)(a1 + j));
      *(_QWORD *)(a1 + j) = 0;
    }
    v47 = *(void **)(a1 + 120);
    if (v47)
      free(v47);
    v48 = *(void **)(a1 + 344);
    if (v48)
      free(v48);
    if ((*(_DWORD *)(a1 + 188) & 0x1000) != 0)
    {
      pthread_mutex_lock(&stru_100020008);
      v49 = 0;
      while (dword_100021858[v49] != *(_DWORD *)(a1 + 248))
      {
        if (++v49 == 32)
          goto LABEL_243;
      }
      dword_100021858[v49] = 0;
LABEL_243:
      pthread_mutex_unlock(&stru_100020008);
    }
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    pthread_cond_destroy((pthread_cond_t *)(a1 + 64));
    free((void *)a1);
    if ((v144 & 0x20) != 0)
    {
      do
        v132 = __ldxr((unsigned int *)&dword_100020724);
      while (__stxr(v132 - 1, (unsigned int *)&dword_100020724));
    }
  }
  do
    v133 = __ldxr((unsigned int *)&dword_100020720);
  while (__stxr(v133 - 1, (unsigned int *)&dword_100020720));
  return 0;
}

uint64_t sub_1000041F0(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t (***v15)();
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t (**v19)();
  uint64_t (**v20)();
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  pthread_rwlock_t *v30;
  int v31;
  unsigned int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  _QWORD *v37;
  unsigned int v38;
  uint64_t *v39;
  _BYTE *v40;
  int v41;
  unsigned int v42;
  unsigned __int8 *v43;
  int v44;
  unsigned int v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  unsigned int v49;
  NSObject *v50;
  int32_t v51;
  int v52;
  NSObject *v53;
  gzFile_s *v54;
  gzFile_s *v55;
  uint64_t v56;
  NSObject *v57;
  int v58;
  int v59;
  int have;
  const char *v61;
  NSObject *v62;
  int v63;
  unsigned int v64;
  unsigned __int8 *v65;
  int v66;
  int v67;
  _QWORD *v68;
  unsigned int v69;
  size_t v70;
  uint64_t v71;
  _QWORD *v72;
  const char *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t *v78;
  int v79;
  NSObject *v80;
  _QWORD *v81;
  NSObject *v82;
  int v83;
  _DWORD *v84;
  NSObject *v85;
  int32_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int32_t v91;
  int v92;
  uint64_t v93;
  const char *v94;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  gzFile_s *v103;
  uint64_t v104;
  _QWORD *v105;
  int v106;
  int v107;
  unint64_t v108;
  char v109;
  uint64_t v110;
  pthread_rwlock_t *v111;
  char v112;
  char v113[15];
  char v114;
  char v115[15];
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  int v121;
  __int16 v122;
  int32_t v123;
  statfs v124;

  sub_1000075A8((uint64_t)&unk_100021758);
  if (a2)
  {
    v13 = 0;
    v14 = a2;
    v15 = &off_100020000;
    v98 = a6;
    v99 = a7;
    v97 = a4;
    v96 = a2;
    while (1)
    {
      v16 = sub_100004D38(*(_DWORD *)(a6 + 4 * v13));
      if (!v16)
      {
        v22 = (uint64_t)v15[233];
        goto LABEL_18;
      }
      v17 = v16;
      v18 = (uint64_t *)(v16 + 128);
      v19 = v15[233];
      if (*(_QWORD *)(v16 + 128))
        v20 = *(uint64_t (***)())(v16 + 128);
      else
        v20 = v15[233];
      if ((*(_DWORD *)(v16 + 32) & 0x80) == 0 && (*(_DWORD *)(v16 + 32) & 4) != 0)
        goto LABEL_58;
      bzero(&v124, 0x878uLL);
      if (strnstr(*(const char **)(a4 + 8 * v13), ".fseventsd", 0x400uLL)
        || strnstr(*(const char **)(a4 + 8 * v13), ".Spotlight-V100", 0x400uLL))
      {
        goto LABEL_119;
      }
      if (statfs(*(const char **)(v17 + 8), &v124) || v124.f_fsid.val[0] != *(_DWORD *)v17)
        break;
      if (time(0) - *(_QWORD *)(v17 + 40) >= 16)
      {
        v21 = sub_1000094B4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v94 = *(const char **)(v17 + 8);
          *(_DWORD *)buf = 136315138;
          v117 = v94;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Events arrived for %s after an unmount request! Re-initializing.", buf, 0xCu);
        }
        *(_DWORD *)(v17 + 32) &= ~0x80u;
        *(_DWORD *)(v17 + 32) |= 0x2004u;
        sub_10000AC78(v17);
        *(_DWORD *)(v17 + 32) &= ~0x2000u;
LABEL_56:
        v20 = (uint64_t (**)())*v18;
      }
      v19 = v15[233];
LABEL_58:
      if ((*(_DWORD *)(v17 + 32) & 0x1000) == 0)
      {
        v54 = (gzFile_s *)v17;
        if (v20)
          v22 = (uint64_t)v20;
        else
          v22 = (uint64_t)v19;
        if (((uint64_t)v54[1].next & 0x40) == 0)
        {
          v55 = v54;
LABEL_65:
          if (((uint64_t)v55[1].next & 2) != 0)
          {
            v56 = (uint64_t)v55;
            v57 = sub_1000094B4();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              v93 = *(_QWORD *)(v56 + 8);
              v124.f_bsize = 136315138;
              *(_QWORD *)&v124.f_iosize = v93;
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "event id's wrapped for volume %s", (uint8_t *)&v124, 0xCu);
            }
            sub_10000C20C(v22 + 2304);
            sub_10000D7B4(v22, 1);
            *(_DWORD *)(v22 + 252) = 0;
            *(_QWORD *)(v22 + 8) = 0;
            v55 = (gzFile_s *)v56;
            sub_10000D9AC(v56, v22);
            *(_DWORD *)(v56 + 32) &= ~2u;
          }
          v23 = *(const char **)(a4 + 8 * v13);
          v24 = *(_QWORD *)(a3 + 8 * v13);
          v103 = v55;
          if (*(_DWORD *)(a6 + 4 * v13) == v55->have)
          {
            v58 = strncmp(v23, "/.docid/", 8uLL);
            v59 = strncmp(v23, "/.activity/", 0xBuLL);
            have = 1;
            if (v58 && v59 && (have = v103[1].have, have < 1))
            {
              v61 = v23;
            }
            else
            {
              v61 = v23;
              do
              {
                if (*v61 == 47)
                {
                  --have;
                }
                else if (!*v61)
                {
                  break;
                }
                ++v61;
              }
              while (have > 0);
            }
            v109 = 0;
            v24 = &v23[v24] - v61;
            v23 = v61;
          }
          else
          {
            v109 = 0;
          }
LABEL_19:
          v25 = *(_QWORD *)(a7 + 8 * v13);
          if (v25 > *(_QWORD *)(v22 + 8))
          {
            *(_QWORD *)(v22 + 8) = v25;
            v25 = *(_QWORD *)(a7 + 8 * v13);
          }
          v26 = *(_QWORD *)(a8 + 8 * v13);
          v108 = v25;
          v106 = *(_DWORD *)(a5 + 4 * v13);
          v107 = *(_DWORD *)(a9 + 4 * v13);
          if (v23[v24 - 1])
          {
            v27 = v23[v24];
            v28 = sub_1000094B4();
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
            if (v27)
            {
              if (v29)
              {
                v124.f_bsize = 136315394;
                *(_QWORD *)&v124.f_iosize = v23;
                WORD2(v124.f_blocks) = 2048;
                *(uint64_t *)((char *)&v124.f_blocks + 6) = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "add_fname: path <<%s>> has len %zd but no trailing nul char!", (uint8_t *)&v124, 0x16u);
              }
            }
            else
            {
              if (v29)
              {
                v124.f_bsize = 136315394;
                *(_QWORD *)&v124.f_iosize = v23;
                WORD2(v124.f_blocks) = 2048;
                *(uint64_t *)((char *)&v124.f_blocks + 6) = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "add_fname: path <<%s>> has len %zd but should be +1!", (uint8_t *)&v124, 0x16u);
              }
              ++v24;
            }
          }
          v30 = (pthread_rwlock_t *)(v22 + 2304);
          v31 = *(_DWORD *)(v22 + 2512);
          v110 = v13;
          v111 = (pthread_rwlock_t *)(v22 + 2304);
          if (3 * v31 + 3 <= (4 * *(_DWORD *)(v22 + 2520)))
          {
            v32 = 2 * v31 + 2;
            if (v32 >= 0x80000)
            {
              if (!*(_DWORD *)(v22 + 2516))
              {
                v33 = sub_1000094B4();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  v91 = *(_DWORD *)(v22 + 2520);
                  v92 = *(_DWORD *)(v22 + 2512);
                  v124.f_bsize = 67109376;
                  v124.f_iosize = v91;
                  LOWORD(v124.f_blocks) = 1024;
                  *(_DWORD *)((char *)&v124.f_blocks + 2) = v92;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "fname table has grown too large. (filled %d / mask 0x%x)\n", (uint8_t *)&v124, 0xEu);
                }
                *(_DWORD *)(v22 + 2516) = 1;
              }
              goto LABEL_82;
            }
            *(_DWORD *)buf = 0;
            v34 = sub_1000129E8(v32, buf);
            if (v34)
            {
              v35 = v34;
              v104 = v24;
              pthread_rwlock_wrlock((pthread_rwlock_t *)(v22 + 2304));
              v36 = 0;
              v37 = *(_QWORD **)(v22 + 2504);
              *(_QWORD *)(v22 + 2504) = v35;
              v38 = *(_DWORD *)(v22 + 2512);
              *(_DWORD *)(v22 + 2512) = *(_DWORD *)buf;
              *(_DWORD *)(v22 + 2520) = 0;
              while (1)
              {
                v39 = (uint64_t *)v37[v36];
                if (v39)
                  break;
LABEL_52:
                if (++v36 > v38)
                {
                  v30 = (pthread_rwlock_t *)(v22 + 2304);
                  pthread_rwlock_unlock(v111);
                  free(v37);
                  v24 = v104;
                  goto LABEL_82;
                }
              }
              while (2)
              {
                v40 = (_BYTE *)v39[5];
                v41 = *v40;
                if (*v40)
                {
                  v42 = 0;
                  v43 = v40 + 1;
                  do
                  {
                    v42 = dword_100020298[v41 ^ HIBYTE(v42)] ^ (v42 << 8);
                    v44 = *v43++;
                    v41 = v44;
                  }
                  while (v44);
                }
                else
                {
                  v42 = 0;
                }
                if (v42 <= 1)
                  v42 = 1;
                v45 = *(_DWORD *)(v22 + 2512);
                v46 = (uint64_t *)(*(_QWORD *)(v22 + 2504) + 8 * (v45 & v42));
                v47 = *v46;
                if (*v46)
                {
                  v48 = (uint64_t *)*v39;
                  *v39 = v47;
                  goto LABEL_50;
                }
                v49 = *(_DWORD *)(v22 + 2520) + 1;
                *(_DWORD *)(v22 + 2520) = v49;
                if (v49 > v45)
                {
                  v50 = sub_1000094B4();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    v51 = *(_DWORD *)(v22 + 2520);
                    v52 = *(_DWORD *)(v22 + 2512);
                    v124.f_bsize = 67109376;
                    v124.f_iosize = v51;
                    LOWORD(v124.f_blocks) = 1024;
                    *(_DWORD *)((char *)&v124.f_blocks + 2) = v52;
                    _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "fname table is screwed up! filled buckets %u / table_mask %u)", (uint8_t *)&v124, 0xEu);
                  }
                }
                v47 = *v46;
                v48 = (uint64_t *)*v39;
                *v39 = *v46;
                if (v47)
LABEL_50:
                  *(_QWORD *)(v47 + 8) = v39;
                *v46 = (uint64_t)v39;
                v39[1] = (uint64_t)v46;
                v39 = v48;
                if (!v48)
                  goto LABEL_52;
                continue;
              }
            }
            v62 = sub_1000094B4();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              sub_10001685C(&v114, v115);
          }
LABEL_82:
          v63 = *(unsigned __int8 *)v23;
          if (*v23)
          {
            v64 = 0;
            v65 = (unsigned __int8 *)(v23 + 1);
            do
            {
              v64 = dword_100020298[v63 ^ HIBYTE(v64)] ^ (v64 << 8);
              v66 = *v65++;
              v63 = v66;
            }
            while (v66);
          }
          else
          {
            v64 = 0;
          }
          if (v64 <= 1)
            v67 = 1;
          else
            v67 = v64;
          pthread_rwlock_wrlock(v30);
          v105 = (_QWORD *)(*(_QWORD *)(v22 + 2504) + 8 * (*(_DWORD *)(v22 + 2512) & v67));
          v68 = (_QWORD *)*v105;
          if (*v105)
          {
            v69 = 0;
            v70 = v24;
            v71 = v24 - 1;
            while (1)
            {
              v72 = v68;
              v68 = (_QWORD *)*v68;
              if (v72[3] == v26)
              {
                v73 = (const char *)v72[5];
                if (!strncmp(v73, v23, v70) && !v73[v71])
                  break;
              }
              ++v69;
              if (!v68)
                goto LABEL_98;
            }
LABEL_112:
            pthread_rwlock_unlock(v111);
            v83 = *((_DWORD *)v72 + 9) | v106;
            v72[2] = v108;
            v72[3] = v26;
            *((_DWORD *)v72 + 9) = v83;
            *((_DWORD *)v72 + 8) = v107;
            a6 = v98;
            v13 = v110;
            v15 = &off_100020000;
          }
          else
          {
            v70 = v24;
            v69 = 0;
LABEL_98:
            v74 = *(_DWORD *)(v22 + 2548);
            if (v74 < *(_DWORD *)(v22 + 2544))
            {
              v75 = *(_QWORD *)(v22 + 2536);
              *(_DWORD *)(v22 + 2548) = v74 + 1;
              if (v69 > dword_100020728)
                dword_100020728 = v69;
              ++*(_DWORD *)(v22 + 2524);
              v76 = v75 + 48 * v74;
              *(_DWORD *)(v76 + 36) = 0;
              v77 = sub_1000076D4(v23, v70);
              *(_QWORD *)(v76 + 40) = v77;
              v78 = (uint64_t *)(v76 + 40);
              if (v77[v70 - 1])
              {
                v79 = dword_10002069C++;
                if (v79 <= 49)
                {
                  v80 = sub_1000094B4();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                  {
                    v88 = *v78;
                    v124.f_bsize = 136315394;
                    *(_QWORD *)&v124.f_iosize = v88;
                    WORD2(v124.f_blocks) = 2048;
                    *(uint64_t *)((char *)&v124.f_blocks + 6) = v70;
                    _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "add_fname: path <<%s>> has len %zd", (uint8_t *)&v124, 0x16u);
                  }
                }
              }
              v72 = (_QWORD *)(v75 + 48 * v74);
              v81 = (_QWORD *)*v105;
              if (*v105)
              {
                *(_QWORD *)(v22 + 2528) += v70;
                v81[1] = v72;
              }
              else
              {
                ++*(_DWORD *)(v22 + 2520);
                *(_QWORD *)(v22 + 2528) += v70;
              }
              *v72 = v81;
              *v105 = v72;
              v72[1] = v105;
              goto LABEL_112;
            }
            v82 = sub_1000094B4();
            v13 = v110;
            v15 = &off_100020000;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v86 = *(_DWORD *)(v22 + 2544);
              v87 = *(_DWORD *)(v22 + 2548);
              v124.f_bsize = 67109634;
              v124.f_iosize = v86;
              LOWORD(v124.f_blocks) = 1024;
              *(_DWORD *)((char *)&v124.f_blocks + 2) = v87;
              HIWORD(v124.f_blocks) = 2080;
              v124.f_bfree = (uint64_t)v23;
              _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "too many filenames in the table (max %d cur %d) : path %s\n", (uint8_t *)&v124, 0x18u);
            }
            pthread_rwlock_unlock(v111);
            a6 = v98;
          }
          a7 = v99;
          a4 = v97;
          v14 = v96;
          if ((v109 & 1) == 0 && *(_DWORD *)(v22 + 2524) >= 0xAAAu)
          {
            memset(&v124.f_bfree, 0, 24);
            *(_QWORD *)&v124.f_bsize = v103;
            v124.f_blocks = v22;
            v84 = malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0x31F9D4DBuLL);
            v124.f_bfree = (uint64_t)v84;
            if (v84)
            {
              v124.f_bavail = 0x40000;
              *(_QWORD *)v84 = 1145852723;
              v84[2] = 12;
              LODWORD(v124.f_files) = 12;
              sub_10000C04C(0, v111, (unsigned int (*)(uint64_t, uint64_t))sub_10000E8E0, (uint64_t)&v124);
              sub_10000E9E8(v103, v22, (uint64_t)&v124, 1);
              malloc_zone_free((malloc_zone_t *)qword_1000206B8, (void *)v124.f_bfree);
              sub_10000C20C((uint64_t)v111);
            }
            else
            {
              v85 = sub_1000094B4();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                sub_100016830(&v112, v113);
            }
          }
          goto LABEL_119;
        }
        v55 = (gzFile_s *)sub_100004D38(-1);
        v22 = (uint64_t)v15[233];
        if (v55)
          goto LABEL_65;
LABEL_18:
        v103 = 0;
        v23 = *(const char **)(a4 + 8 * v13);
        v24 = *(_QWORD *)(a3 + 8 * v13);
        v109 = 1;
        goto LABEL_19;
      }
LABEL_119:
      if (++v13 == v14)
        goto LABEL_124;
    }
    v53 = sub_1000094B4();
    v18 = &qword_100020748;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v89 = *(_QWORD *)(v17 + 8);
      v90 = *(_DWORD *)v17;
      *(_DWORD *)buf = 136315906;
      v117 = "disk_logger_callback";
      v118 = 2080;
      v119 = v89;
      v120 = 1024;
      v121 = v90;
      v122 = 1024;
      v123 = v124.f_fsid.val[0];
      _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s: Assign to global disk logger - mount_point[%s], di->dev[%d] sfs.f_fsid.val[0]=[%d]", buf, 0x22u);
    }
    goto LABEL_56;
  }
LABEL_124:
  sub_100007528((uint64_t)&unk_100021758);
  return 0;
}

uint64_t sub_100004D38(int a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v1 = (uint64_t *)qword_1000206E8;
  if (!qword_1000206E8)
    return 0;
  if (*(int *)(qword_1000206E8 + 8) < 1)
    goto LABEL_15;
  v3 = 0;
  v4 = 0;
  result = 0;
  v6 = -1;
  do
  {
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)qword_1000206E8 + v3) + 32) & 0x4010) == 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)qword_1000206E8 + v3);
      if (*(_DWORD *)v7 == a1)
      {
        if (*(_QWORD *)(v7 + 128))
        {
          v8 = *(_QWORD *)qword_1000206E8 + v3;
          return *(_QWORD *)v8;
        }
        v6 = v4;
      }
      else if ((*(_DWORD *)(v7 + 32) & 1) != 0)
      {
        result = *(_QWORD *)(*(_QWORD *)qword_1000206E8 + v3);
      }
    }
    ++v4;
    v3 += 8;
  }
  while (v4 < *(int *)(qword_1000206E8 + 8));
  if ((v6 & 0x80000000) == 0)
  {
    v8 = *(_QWORD *)qword_1000206E8 + 8 * v6;
    return *(_QWORD *)v8;
  }
  if (!result)
  {
LABEL_15:
    v9 = sub_1000094B4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100014E84();
    v8 = *v1;
    return *(_QWORD *)v8;
  }
  return result;
}

uint64_t sub_100004E34(int *a1, int a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v14;
  int v16;
  kern_return_t v17;
  mach_error_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  int v32;
  int v33;
  kern_return_t v34;
  mach_error_t v35;
  NSObject *v36;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  time_t v45;
  int v46;
  uint64_t v47;
  int v48;
  vm_address_t v49;
  vm_address_t address;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;

  v49 = 0;
  address = 0;
  if (!a1)
  {
    v21 = sub_1000094B4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100014890(v21, v22, v23, v24, v25, v26, v27, v28);
    v20 = 0xFFFFFFFFLL;
    v14 = -1;
    v16 = -1;
    goto LABEL_21;
  }
  v14 = a2;
  v16 = 4 * a2;
  v17 = vm_allocate(mach_task_self_, &address, 4 * a2, -150994943);
  if (v17)
  {
    v18 = v17;
    v19 = sub_1000094B4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100014A14(v18, v19);
    v14 = 0;
    address = 0;
    v20 = 4294967294;
    goto LABEL_23;
  }
  v48 = v14;
  if (v14)
  {
    LODWORD(v29) = v14;
    v14 = 0;
    v29 = v29;
    v30 = a3;
    do
    {
      v31 = *v30;
      v30 += 2;
      v32 = v14 + v31;
      v33 = v14 + v31 + 8;
      if (a1[38])
        v32 = v33;
      if (a1[39])
        v14 = v32 + 4;
      else
        v14 = v32;
      --v29;
    }
    while (v29);
  }
  v34 = vm_allocate(mach_task_self_, &v49, v14, -150994943);
  if (!v34)
  {
    v47 = a7;
    if (v48)
    {
      v38 = 0;
      v39 = 0;
      do
      {
        *(_DWORD *)(address + 4 * v38) = v39;
        strlcpy((char *)(v49 + v39), *(const char **)(a4 + 8 * v38), 0x400uLL);
        v39 += a3[2 * v38];
        if (a1[38])
        {
          if (a8)
            v40 = *(_QWORD *)(a8 + 8 * v38);
          else
            v40 = 0;
          *(_QWORD *)(v49 + v39) = v40;
          v39 += 8;
        }
        if (a1[39])
        {
          if (a9)
            v41 = *(_DWORD *)(a9 + 4 * v38);
          else
            v41 = 0;
          *(_DWORD *)(v49 + v39) = v41;
          v39 += 4;
        }
        ++v38;
      }
      while (v48 != v38);
    }
    else
    {
      v39 = 0;
    }
    if (v39 != v14)
    {
      v42 = sub_1000094B4();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v52 = "callback_client";
        v53 = 1024;
        v54 = v48;
        v55 = 1024;
        v56 = v39;
        v57 = 1024;
        v58 = v14;
        v59 = 1024;
        v60 = v48;
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s: ERROR: npaths=%d j=%d paths_blob_size=%d i=%d", buf, 0x24u);
      }
      v43 = sub_1000094B4();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        sub_100014900(v43);
    }
    v44 = sub_100005238(*a1, 0x2710u, v48, address, v48, a5, v48, v47, v48, v49, v14);
    v20 = v44;
    if (!(_DWORD)v44 || (_DWORD)v44 == 268435459)
      goto LABEL_21;
    v45 = time(0);
    if (v45 - qword_100020270 < 5)
    {
      if (v45 - qword_100020270 < 2 || (v46 = a1[34], dword_100020278 == v46))
      {
LABEL_53:
        if ((_DWORD)v20 == 268435460)
        {
          ++dword_1000206A0;
          usleep(0x186A0u);
          v20 = 268435460;
        }
        goto LABEL_21;
      }
    }
    else
    {
      v46 = a1[34];
    }
    qword_100020270 = v45;
    dword_100020278 = v46;
    goto LABEL_53;
  }
  v35 = v34;
  v36 = sub_1000094B4();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    sub_100014990(v35, v36);
  v49 = 0;
  v20 = 4294967293;
LABEL_21:
  if (address)
    vm_deallocate(mach_task_self_, address, v16);
LABEL_23:
  if (v49)
    vm_deallocate(mach_task_self_, v49, v14);
  return v20;
}

uint64_t sub_100005238(int a1, mach_msg_timeout_t timeout, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  uint64_t v12;
  _BYTE msg[28];
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  NDR_record_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;

  v15 = a4;
  v16 = 16777472;
  v17 = 4 * a5;
  v18 = a6;
  v19 = 16777472;
  v20 = 4 * a7;
  v21 = a8;
  v22 = 16777472;
  v23 = 8 * a9;
  v24 = a10;
  v25 = 16777472;
  v26 = a11;
  v27 = NDR_record;
  v28 = a3;
  v29 = a5;
  v30 = a7;
  v31 = a9;
  v32 = a11;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100019250;
  if (&_voucher_mach_msg_set)
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v12 = mach_msg((mach_msg_header_t *)msg, 17, 0x78u, 0, 0, timeout, 0);
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(mach_task_self_, *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v12;
}

uint64_t sub_100005350()
{
  thread_act_t v0;
  thread_act_t v1;
  int v2;
  uint64_t v4;
  int *v5;
  int v6;
  uint64_t v7;
  int *v8;
  int v9;
  int v10;
  int64_t v12;
  ssize_t v13;
  ssize_t v14;
  NSObject *v15;
  NSObject *v16;
  integer_t policy_info;
  BOOLean_t get_default;
  mach_msg_type_number_t policy_infoCnt[4];
  integer_t v20;
  ssize_t v21;
  __int16 v22;
  int v23;

  v0 = mach_thread_self();
  pthread_setname_np("com.apple.fseventsd.dev.fsevents");
  policy_info = 19;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  v20 = 0;
  v1 = mach_thread_self();
  get_default = 1;
  policy_infoCnt[0] = 1;
  if (!thread_policy_get(v1, 1u, &v20, policy_infoCnt, &get_default))
  {
    v20 = 0;
    thread_policy_set(v1, 1u, &v20, 1u);
  }
  mach_port_deallocate(mach_task_self_, v1);
  if (!dword_1000206C8)
  {
    while (1)
    {
      pthread_mutex_lock(&stru_1000201C0);
      v4 = qword_100020730;
      if (qword_100020730)
        break;
      do
      {
LABEL_13:
        v7 = v4;
        v4 = *(_QWORD *)(v4 + 32);
      }
      while (v4);
      v8 = (int *)sub_10000C29C(1, 0x10000);
      *(_QWORD *)(v7 + 32) = v8;
      if (v8)
      {
        v5 = v8;
        ++dword_10002073C;
        goto LABEL_16;
      }
      pthread_cond_signal(&stru_100020200);
      pthread_mutex_unlock(&stru_1000201C0);
      v16 = sub_1000094B4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100017398(policy_infoCnt, (_BYTE *)policy_infoCnt + 1);
      sleep(2u);
LABEL_35:
      if (dword_1000206C8)
        goto LABEL_4;
    }
    v5 = (int *)qword_100020730;
    while (1)
    {
      v6 = v5[3];
      if (*v5 - v6 >= 0x8000 || v5[1] == v6)
        break;
      v5 = (int *)*((_QWORD *)v5 + 4);
      if (!v5)
        goto LABEL_13;
    }
LABEL_16:
    v9 = v5[1];
    v10 = v5[3];
    if (v9 == v5[2] && v9 == v10)
    {
      v10 = 0;
      *((_QWORD *)v5 + 1) = 0;
      v5[1] = 0;
    }
    v12 = *v5 - (uint64_t)v10;
    pthread_mutex_unlock(&stru_1000201C0);
    v13 = read(dword_100020048, (void *)(*((_QWORD *)v5 + 3) + v10), v12);
    if (v13 < 0)
    {
      if (*__error() == 9)
        goto LABEL_4;
    }
    else
    {
      v14 = v13;
      if (v13)
      {
        if (v13 <= v12)
        {
          v5[3] += v13;
          pthread_mutex_lock(&stru_1000201C0);
          pthread_cond_signal(&stru_100020200);
          pthread_mutex_unlock(&stru_1000201C0);
        }
        else
        {
          v15 = sub_1000094B4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v20 = 134218240;
            v21 = v14;
            v22 = 1024;
            v23 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fsevent_producer: ************* DANGER : read %zd bytes but buffer is only %u", (uint8_t *)&v20, 0x12u);
          }
        }
      }
      else if (dword_1000206C8)
      {
        goto LABEL_4;
      }
    }
    goto LABEL_35;
  }
LABEL_4:
  if (*__error() != 9)
  {
    v2 = dword_100020048;
    if ((dword_100020048 & 0x80000000) == 0)
    {
      dword_100020048 = -1;
      close(v2);
    }
  }
  pthread_mutex_lock(&stru_1000201C0);
  pthread_cond_signal(&stru_100020200);
  pthread_mutex_unlock(&stru_1000201C0);
  return 0;
}

uint64_t sub_100005688()
{
  thread_act_t v0;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  unsigned int v19;
  char v20;
  _BYTE v21[11];
  integer_t policy_info;
  timeval v23;
  timeval v24;
  timespec v25;

  v25.tv_sec = 0;
  v25.tv_nsec = 0;
  v24.tv_sec = 0;
  *(_QWORD *)&v24.tv_usec = 0;
  v23.tv_sec = 0;
  *(_QWORD *)&v23.tv_usec = 0;
  v0 = mach_thread_self();
  pthread_setname_np("com.apple.fseventsd.notify");
  policy_info = 18;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  if (!dword_1000206C8)
  {
    v2 = 0;
    v3 = 9999;
    while (1)
    {
      while (1)
      {
        pthread_mutex_lock(&stru_1000201C0);
LABEL_5:
        v4 = qword_100020730;
        if (!qword_100020730)
          break;
        while (1)
        {
          v5 = *(_DWORD *)(v4 + 4);
          if (v5 != *(_DWORD *)(v4 + 12) || *(_DWORD *)(v4 + 8) > v5)
            break;
          v4 = *(_QWORD *)(v4 + 32);
          if (!v4)
            goto LABEL_9;
        }
        pthread_mutex_unlock(&stru_1000201C0);
LABEL_19:
        v8 = 0;
        if (v4)
        {
          while (1)
          {
            if (v8 >= 101)
            {
              v17 = sub_1000094B4();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                sub_1000173C4(&v20, v21);
              goto LABEL_48;
            }
            v9 = *(_DWORD *)(v4 + 8);
            v10 = *(_DWORD *)(v4 + 12);
            if (v9 < v10)
              goto LABEL_25;
            if (v9 > v10 && *(_DWORD *)(v4 + 4) == v9)
              break;
LABEL_26:
            if (dword_1000206C8)
              goto LABEL_48;
            v11 = *(int *)(v4 + 4);
            v12 = v9 - v11;
            sub_100005BC8((_DWORD *)(*(_QWORD *)(v4 + 24) + v11), v9 - v11, (uint64_t)&qword_100021830, (void (*)(uint64_t, uint64_t, uint64_t, __int16 *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _DWORD, uint64_t))sub_1000066BC, 0);
            *(_DWORD *)(v4 + 4) += v12;
            if (dword_1000206CC)
              goto LABEL_30;
LABEL_32:
            v2 = 1;
LABEL_33:
            gettimeofday(&v23, 0);
            v3 = sub_1000078BC((uint64_t)&v23);
            sub_100005A2C(&qword_100021830);
            if (!v4)
              goto LABEL_48;
            v15 = *(_DWORD *)(v4 + 4);
            if (v15 == *(_DWORD *)(v4 + 8) && v15 <= *(_DWORD *)(v4 + 12))
            {
              v4 = *(_QWORD *)(v4 + 32) ? *(_QWORD *)(v4 + 32) : qword_100020730;
              if (!v4)
                goto LABEL_48;
              v16 = *(_DWORD *)(v4 + 4);
              if (v16 == *(_DWORD *)(v4 + 8) && v16 <= *(_DWORD *)(v4 + 12))
                goto LABEL_48;
            }
            ++v8;
          }
          *(_DWORD *)(v4 + 4) = 0;
LABEL_25:
          *(_DWORD *)(v4 + 8) = v10;
          v9 = v10;
          goto LABEL_26;
        }
        if (dword_1000206CC)
        {
LABEL_30:
          v13 = -dword_1000206CC;
          sub_100007E04((void (*)(_QWORD))sub_10000C364);
          do
            v14 = __ldxr((unsigned int *)&dword_1000206CC);
          while (__stxr(v14 + v13, (unsigned int *)&dword_1000206CC));
          goto LABEL_32;
        }
        if (v2)
          goto LABEL_33;
LABEL_48:
        if (dword_1000206C8)
          return sub_10000BEB0();
      }
LABEL_9:
      if (dword_1000206CC)
      {
        pthread_mutex_unlock(&stru_1000201C0);
        if (dword_1000206CC)
        {
          v18 = -dword_1000206CC;
          sub_100007E04((void (*)(_QWORD))sub_10000C364);
          do
          {
            v4 = 0;
            v19 = __ldxr((unsigned int *)&dword_1000206CC);
            v2 = 1;
          }
          while (__stxr(v19 + v18, (unsigned int *)&dword_1000206CC));
        }
        else
        {
          v4 = 0;
        }
        goto LABEL_19;
      }
      gettimeofday(&v24, 0);
      if ((unint64_t)(v3 - 1500001) < 0xFFFFFFFFFFE91CA0)
        v3 = 1500000;
      v6 = 1000 * v3 + 1000 * v24.tv_usec;
      v25.tv_sec = v6 / 0x3B9ACA00 + v24.tv_sec;
      v25.tv_nsec = v6 % 0x3B9ACA00;
      v7 = pthread_cond_timedwait(&stru_100020200, &stru_1000201C0, &v25);
      if (!v7)
      {
LABEL_15:
        if (!dword_1000206CC && dword_1000206C8)
        {
          pthread_mutex_unlock(&stru_1000201C0);
          return sub_10000BEB0();
        }
        goto LABEL_5;
      }
      if (v7 != 60)
      {
        if (dword_1000206C8)
          goto LABEL_15;
        goto LABEL_5;
      }
      pthread_mutex_unlock(&stru_1000201C0);
      gettimeofday(&v23, 0);
      v3 = sub_1000078BC((uint64_t)&v23);
      sub_100005A2C(&qword_100021830);
    }
  }
  return sub_10000BEB0();
}

uint64_t sub_100005A2C(uint64_t *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  int v11;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;

  pthread_mutex_lock(&stru_100020100);
  v2 = *((_DWORD *)a1 + 5);
  if (v2 <= 0xFFFFFDFF)
  {
    v3 = v2 + 512;
    do
    {
      v4 = *a1;
      v5 = (_DWORD)a1[1] & v2;
      v6 = *(_DWORD **)(*a1 + 8 * v5);
      if (v6)
      {
        do
        {
          v7 = *(_QWORD *)v6;
          if (!v6[4])
          {
            if (v7)
              *(_QWORD *)(v7 + 8) = *((_QWORD *)v6 + 1);
            **((_QWORD **)v6 + 1) = v7;
            if (!*(_QWORD *)(v4 + 8 * v5))
            {
              v8 = *((_DWORD *)a1 + 4) - 1;
              *((_DWORD *)a1 + 4) = v8;
              if (v8 > *((_DWORD *)a1 + 2))
              {
                v9 = sub_1000094B4();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  v10 = *((_DWORD *)a1 + 4);
                  v11 = *((_DWORD *)a1 + 2);
                  *(_DWORD *)buf = 67109376;
                  v14 = v10;
                  v15 = 1024;
                  v16 = v11;
                  _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "event table is screwed up! filled buckets %u / table_mask %u)", buf, 0xEu);
                }
              }
            }
            sub_100007BB4(*((const char **)v6 + 15), *((__int16 *)v6 + 26));
            *((_QWORD *)v6 + 15) = 0;
            malloc_zone_free((malloc_zone_t *)qword_1000206C0, v6);
          }
          v6 = (_DWORD *)v7;
        }
        while (v7);
        v2 = *((_DWORD *)a1 + 5);
      }
      *((_DWORD *)a1 + 5) = ++v2;
    }
    while (v2 < v3);
  }
  return pthread_mutex_unlock(&stru_100020100);
}

uint64_t sub_100005BC8(_DWORD *a1, int a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, __int16 *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _DWORD, uint64_t), uint64_t a5)
{
  _DWORD *v5;
  unint64_t v6;
  int v7;
  unsigned __int16 *v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  char *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  int *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  NSObject *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  char *v44;
  const char *v45;
  char *v46;
  const char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  BOOL v52;
  int v53;
  NSObject *v54;
  uint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v62;
  int v63;
  uint64_t v64;
  unint64_t v65;
  const char *v66;
  int v67;
  _BYTE v68[12];
  int v69;
  uint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int64_t v83;
  int64_t v84;
  unsigned int v86;
  int v87;
  size_t v88;
  _BYTE *v89;
  uint64_t v90;
  char v94;
  char v95[5];
  __int16 v96;
  int v97;
  int v98;
  uint8_t __str[1024];
  uint8_t v100[4];
  uint64_t v101;
  uint8_t v102[4];
  uint64_t v103;

  v96 = 47;
  if (a2 >= 1)
  {
    v87 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = 0;
    v69 = 0;
    v67 = 0;
    v88 = 0;
    v80 = 0;
    v81 = 0;
    v82 = 0;
    v83 = 0;
    v84 = a2;
    v5 = a1;
    v6 = (unint64_t)a1 + a2;
    v65 = v6;
    while (1)
    {
      v7 = *v5;
      v8 = (unsigned __int16 *)(v5 + 2);
      if ((*v5 & 0xFFF) != 0x3E7)
      {
        v86 = v5[1];
        v9 = 1 << *(_BYTE *)v5;
        v10 = (byte_100020288 & ((*v5 & 0x2000u) >> 13)) != 0 ? v9 | 0x20000000 : v9;
        if (qword_1000206D0[dword_1000206E0] != -1)
          break;
      }
      ++dword_100020738;
      v57 = &qword_1000206D0[dword_1000206E0];
      do
        v58 = __ldxr(v57);
      while (__stxr(v58 + 1, v57));
      if (v58 == -2)
      {
        v59 = sub_1000094B4();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          sub_100015C14(v102, &v103, v59);
        sub_100009F54((uint64_t (*)(void))sub_10000C350);
        a4(a3, 0xFFFFFFFFLL, 0, &v96, 2, 2, 2415919104, -1, 0, 0, a5);
      }
      else
      {
        a4(a3, 0xFFFFFFFFLL, 0, &v96, 2, 2, 0x80000000, v58 + 1, 0, 0, a5);
      }
      if (*v8 == 45887)
      {
        v8 = (unsigned __int16 *)v5 + 5;
      }
      else
      {
        v60 = sub_1000094B4();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          sub_100015BE8(&v94, v95);
      }
LABEL_148:
      v5 = v8;
      if ((char *)v8 - (char *)a1 >= v84)
        return 1;
    }
    if ((unint64_t)v8 >= v6)
      goto LABEL_148;
    v11 = 0;
    v77 = 0;
    v78 = 0;
    *(_DWORD *)&v68[8] = 0;
    v76 = 0;
    v79 = 0;
    v89 = 0;
    v90 = 0;
    v12 = 0;
    *(_QWORD *)v68 = (v7 - 11);
    v13 = "created";
    if (v7 == 12)
      v13 = "changed";
    v66 = v13;
    while (1)
    {
      v14 = *v8;
      if (v14 == 45887)
      {
        ++v8;
        goto LABEL_148;
      }
      v15 = v8[1];
      v16 = (int *)(v8 + 2);
      v17 = &qword_1000206D0[dword_1000206E0];
      do
      {
        v18 = __ldxr(v17);
        v19 = v18 + 1;
      }
      while (__stxr(v18 + 1, v17));
      if (v18 == -2)
      {
        v20 = sub_1000094B4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_100015C54(v100, &v101, v20);
        sub_100009F54((uint64_t (*)(void))sub_10000C350);
        a4(a3, 0xFFFFFFFFLL, 0, &v96, 2, 2, 2415919104, -1, 0, 0, a5);
        v21 = &qword_1000206D0[dword_1000206E0];
        do
        {
          v22 = __ldxr(v21);
          v19 = v22 + 1;
        }
        while (__stxr(v22 + 1, v21));
      }
      if (v7 != 15)
        break;
      switch(v11)
      {
        case 0:
          if (v14 == 4)
          {
            v69 = 0;
            v70 = 0;
            v74 = 0;
            v75 = 0;
            v72 = 0;
            v73 = 0;
            v71 = 0;
            v87 = 0;
            v67 = *v16;
          }
          else
          {
            v67 = 0;
            v69 = 0;
            v70 = 0;
            v74 = 0;
            v75 = 0;
            v72 = 0;
            v73 = 0;
            v71 = 0;
            v87 = 0;
          }
          break;
        case 1:
          if (v14 == 9)
          {
            v87 |= 1u;
            v90 = *v16;
            v69 = *v16;
          }
          break;
        case 2:
          if (v14 == 7)
          {
            v75 = *(_QWORD *)v16;
            v29 = v87 | 2;
            goto LABEL_52;
          }
          break;
        case 3:
          if (v14 == 5)
          {
            v74 = *(_QWORD *)v16;
            v29 = v87 | 4;
            goto LABEL_52;
          }
          break;
        case 4:
          if (v14 == 5)
          {
            v73 = *(_QWORD *)v16;
            v29 = v87 | 8;
            goto LABEL_52;
          }
          break;
        case 5:
          if (v14 == 4)
          {
            v72 = *v16;
            v29 = v87 | 0x10;
            goto LABEL_52;
          }
          break;
        case 6:
          if (v14 == 4)
          {
            v71 = *v16;
            v29 = v87 | 0x20;
            goto LABEL_52;
          }
          break;
        case 7:
          if (v14 == 5)
          {
            v70 = *(_QWORD *)v16;
            v29 = v87 | 0x40;
LABEL_52:
            v87 = v29;
          }
          break;
        case 8:
          if (v14 == 5 && (v87 & 0x5F) != 0)
          {
            v30 = (snprintf((char *)__str, 0x400uLL, "/.activity/%d/%d/%lld/%lld/%lld/%u/%u/%lld", v67, v69, v75, v74, v73, v72, v71, v70)+ 1);
            a4(a3, v86, v90, (__int16 *)__str, v30, v30, v10, v19, 0, 0, a5);
          }
          break;
        default:
          break;
      }
LABEL_125:
      v8 = (unsigned __int16 *)((char *)v16 + v15);
      ++v11;
      if ((unint64_t)v16 + v15 >= v6)
        goto LABEL_148;
    }
    if ((v14 - 1) > 1)
    {
      switch(v14)
      {
        case 5:
          if (*(_DWORD *)v68 > 1u)
          {
            v23 = v76;
          }
          else
          {
            v23 = v76;
            if (!v76)
            {
              *(_QWORD *)&v68[4] = *(_QWORD *)v16;
              v23 = 1;
            }
          }
          v51 = v79 == 2 && v23 == 1;
          v52 = *(_DWORD *)v68 > 1u;
          if (!v51)
            v52 = 1;
          if (v52)
          {
            v76 = v23;
          }
          else
          {
            v53 = snprintf((char *)__str, 0x400uLL, "/.docid/%lld/%s/%lld/src=%lld,dst=%lld", (int)v90, v66, *(_QWORD *)&v68[4], v77, v78)+ 1;
            v6 = v65;
            v83 = strrchr((char *)__str, 47) - (char *)__str + 2;
            ((void (*)(uint64_t, _QWORD, uint64_t, uint8_t *, _QWORD))a4)(a3, v86, v90, __str, v53);
            v76 = 1;
            v79 = 2;
          }
          break;
        case 7:
          if ((_DWORD)v15 == 4)
            v31 = *v16;
          else
            v31 = *(_QWORD *)v16;
          if (v79)
            v49 = v77;
          else
            v49 = v31;
          v81 = v31;
          v50 = v78;
          if (v79)
            v50 = v31;
          v77 = v49;
          v78 = v50;
          ++v79;
          break;
        case 9:
          v32 = *v16;
          v90 = *v16;
          if (v7 == 13)
          {
            v97 = *v16;
            *(_QWORD *)__str = 0;
            sub_1000075A8((uint64_t)&unk_100021758);
            if (sub_100011D84(&v97, __str))
            {
              sub_100007528((uint64_t)&unk_100021758);
              v98 = v32;
              ioctl(dword_100020048, 0x80047368uLL, &v98);
            }
            else
            {
              *(_DWORD *)(*(_QWORD *)__str + 32) |= 0x400u;
              sub_100007528((uint64_t)&unk_100021758);
              while (!__ldxr((unsigned int *)&unk_100020700))
              {
                if (!__stxr(1u, (unsigned int *)&unk_100020700))
                  goto LABEL_133;
              }
              __clrex();
LABEL_133:
              if (qword_100020748)
              {
                v56 = *(_QWORD *)(qword_100020748 + 16);
                if (v56)
                  sub_100007D3C(v56);
              }
            }
          }
          v28 = v83;
          if (v12)
          {
            if (v89 && (v80 & 0x2000000000000000) != 0)
            {
              *v89 = v80;
              v28 = strlen(v12) + 1;
              v10 = v10 | 0x20000000;
            }
            v6 = v65;
            v64 = a5;
            v63 = 0;
            v62 = 0;
            goto LABEL_124;
          }
          v6 = v65;
          break;
        case 10:
          v33 = *v16;
          v34 = *v16 & 0xF000;
          v35 = v10 | 0x800000;
          v36 = v10 | 0x1000000;
          if (v34 != 0x4000)
            v36 = v10;
          if (v34 != 0x8000)
            v35 = v36;
          if (v34 == 40960)
            v37 = v10 | 0x400000;
          else
            v37 = v35;
          if (v33 < 0)
            v37 |= 0x100000u;
          HIDWORD(v80) = *v16;
          v10 = v37 | (v33 >> 11) & 0x80000;
          break;
        case 11:
          v82 = *v16;
          break;
        case 12:
          v81 = *(_QWORD *)(v8 + 2);
          v38 = *((_DWORD *)v8 + 4);
          v90 = *((unsigned int *)v8 + 3);
          v82 = *((_DWORD *)v8 + 6);
          v39 = v38 & 0xF000;
          v40 = v10 | 0x800000;
          v41 = v10 | 0x1000000;
          if (v39 != 0x4000)
            v41 = v10;
          if (v39 != 0x8000)
            v40 = v41;
          if (v39 == 40960)
            v42 = v10 | 0x400000;
          else
            v42 = v40;
          if (v38 < 0)
            v42 |= 0x100000u;
          HIDWORD(v80) = *((_DWORD *)v8 + 4);
          v10 = v42 | (v38 >> 11) & 0x80000;
          if (v12)
          {
            if (v89)
            {
              v43 = *(_QWORD *)(v8 + 2);
              v28 = v83;
              if ((v38 & 0x20000000) != 0)
                goto LABEL_120;
            }
            else
            {
              v43 = *(_QWORD *)(v8 + 2);
              v28 = v83;
            }
            goto LABEL_123;
          }
          break;
        default:
          goto LABEL_125;
      }
      goto LABEL_125;
    }
    if (*(_BYTE *)v16 == 47)
    {
      v12 = (char *)(v8 + 2);
    }
    else
    {
      v24 = sub_1000094B4();
      v12 = (char *)&unk_100020230;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136315138;
        *(_QWORD *)&__str[4] = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "consumer: DANGER! fname does not begin with a '/' (%s)", __str, 0xCu);
      }
    }
    if (v12[1])
    {
      v25 = strrchr(v12, 47);
      if (!v25)
        goto LABEL_114;
      v26 = v25;
      v27 = v25 - 12;
      if (v25 - 12 <= v12 || strncmp(v25 - 12, "/..namedfork", 0xCuLL))
      {
LABEL_37:
        v89 = v26 + 1;
        LOBYTE(v80) = v26[1];
        v88 = strlen(v12) + 1;
        v28 = v26 - v12 + 2;
        goto LABEL_117;
      }
      v10 = v10 | 0x200;
      *v27 = 0;
      v44 = strrchr(v12, 47);
      if (v44)
      {
        v26 = v44;
        v45 = v44 + 1;
        if (v44[1])
        {
          *v44 = 0;
          v46 = strrchr(v12, 47);
          if (v46 && (v47 = v45, v48 = v46, !strcmp(v46 + 1, v47)))
            v26 = v48;
          else
            *v26 = 47;
        }
        goto LABEL_37;
      }
      if (v12[1])
      {
LABEL_114:
        v54 = sub_1000094B4();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__str = 136315138;
          *(_QWORD *)&__str[4] = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "consumer: DANGER! last_slash is NULL and fname <<%s>> looks bad.", __str, 0xCu);
        }
      }
    }
    v28 = 2;
    v88 = 2;
    v89 = 0;
LABEL_117:
    if ((_DWORD)v90)
    {
      if (v89)
      {
        v43 = v81;
        if ((v80 & 0x2000000000000000) != 0)
        {
LABEL_120:
          *v89 = v80;
          v28 = strlen(v12) + 1;
          v10 = v10 | 0x20000000;
        }
      }
      else
      {
        v43 = v81;
      }
LABEL_123:
      v64 = a5;
      v63 = v82;
      v62 = v43;
LABEL_124:
      v83 = v28;
      a4(a3, v86, v90, (__int16 *)v12, v88, v28, v10, v19, v62, v63, v64);
    }
    else
    {
      v83 = v28;
      v90 = 0;
    }
    goto LABEL_125;
  }
  return 1;
}

uint64_t sub_1000066BC(uint64_t a1, int a2, int a3, char *__s1, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, int a10)
{
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  NSObject *v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v47;
  _QWORD v49[2];

  do
    v15 = __ldaxr(&dword_100020718);
  while (__stlxr(v15 + 1, &dword_100020718));
  qword_100020710 = qword_100020708;
  if (!qword_100020708)
  {
    do
      v16 = __ldaxr(&dword_100020718);
    while (__stlxr(v16 - 1, &dword_100020718));
    return 0;
  }
  if ((a7 & 0x80000000) == 0)
  {
    LOBYTE(v49[0]) = 0;
    v47 = !strncmp(__s1, "/.docid/", 8uLL) || !strncmp(__s1, "/.activity/", 0xBuLL);
    v18 = __s1;
    if (a3)
      v18 = (char *)sub_1000073C0(a3, __s1, v49);
    if (!v18)
      sub_1000158B4();
    if (!strncmp(v18, ".Spotlight-V100", 0xFuLL)
      || !strncmp(v18, ".fseventsd", 0xAuLL)
      || !strncmp(v18, ".MobileBackups", 0xEuLL)
      || !strncmp(v18, "Backups.backupdb", 0x10uLL))
    {
      v17 = 0;
    }
    else
    {
      v45 = a1;
      v17 = 0;
      if (!strnstr(v18, "/.ubd/", 0x400uLL) && !LOBYTE(v49[0]))
      {
        pthread_mutex_lock(&stru_100020180);
        v19 = (_QWORD *)qword_100020710;
        if (*(int *)(qword_100020710 + 8) < 1)
        {
          v17 = 0;
        }
        else
        {
          v43 = a7;
          v44 = a8;
          v20 = 0;
          v17 = 0;
          v42 = a7 & 0xFE23F800;
          do
          {
            if (*(_DWORD *)(*(_QWORD *)(*v19 + 8 * v20) + 8) != -1)
            {
              v21 = *(unsigned __int16 *)(*(_QWORD *)(*v19 + 8 * v20) + 12);
              if (v21 >= 2 && *(_BYTE *)(**(_QWORD **)(*v19 + 8 * v20) + v21 - 1) == 47)
                --v21;
              v22 = __s1;
              if (a3)
              {
                if (*(_DWORD *)(*(_QWORD *)(*v19 + 8 * v20) + 8))
                  v22 = v18;
                else
                  v22 = __s1;
              }
              if (!strncmp(**(const char ***)(*v19 + 8 * v20), v22, v21))
              {
                if (v21 < 2 || ((v23 = v22[v21], v23 != 47) ? (v24 = v23 == 0) : (v24 = 1), v24))
                {
                  if (!*(_DWORD *)(*(_QWORD *)(*v19 + 8 * v20) + 8)
                    || *(_DWORD *)(*(_QWORD *)(*v19 + 8 * v20) + 8) == a3)
                  {
                    if ((((*(_WORD *)(*(_QWORD *)(*v19 + 8 * v20) + 14) & 1) == 0) & ~v47) != 0)
                    {
                      v27 = (char *)(__s1 - v22 + a6);
                      if ((unint64_t)v27 >= v21)
                      {
                        v28 = v27 - 1;
                        v29 = __s1[a6 - 1];
                        __s1[a6 - 1] = 0;
                        v30 = sub_100006C28(v45, a2, a3, v22, v42, v44, a9, a10);
                        if (v30)
                        {
                          v31 = v30;
                          sub_10000723C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)qword_100020710 + 8 * v20) + 24), v30);
                          sub_100006B64(v31);
                          v17 = (v17 + 1);
                        }
                        v28[(_QWORD)v22] = v29;
                      }
                    }
                    else
                    {
                      v25 = sub_100006C28(v45, a2, a3, v22, v43, v44, a9, a10);
                      if (v25)
                      {
                        v26 = v25;
                        sub_10000723C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)qword_100020710 + 8 * v20) + 24), v25);
                        sub_100006B64(v26);
                        v17 = (v17 + 1);
                      }
                    }
                  }
                }
              }
            }
            ++v20;
            v19 = (_QWORD *)qword_100020710;
          }
          while (v20 < *(int *)(qword_100020710 + 8));
        }
        pthread_mutex_unlock(&stru_100020180);
      }
    }
    qword_100020710 = 0;
    do
      v32 = __ldaxr(&dword_100020718);
    while (__stlxr(v32 - 1, &dword_100020718));
    return v17;
  }
  v33 = sub_100006C28(a1, -1, 0, __s1, a7, a8, a9, a10);
  if (!v33)
  {
    v41 = sub_1000094B4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1000158DC();
    return 0;
  }
  v34 = v33;
  do
    v35 = __ldaxr(&dword_10002071C);
  while (__stlxr(v35 + 1, &dword_10002071C));
  v36 = 0;
  v17 = 0;
  do
  {
    v37 = xmmword_100020758[v36];
    if (v37 && (*(_DWORD *)(v37 + 188) & 2) == 0)
    {
      v49[0] = xmmword_100020758[v36];
      v49[1] = 0;
      sub_10000723C((uint64_t)v49, v34);
      v17 = (v17 + 1);
    }
    ++v36;
  }
  while (v36 != 512);
  do
    v38 = __ldaxr(&dword_10002071C);
  while (__stlxr(v38 - 1, &dword_10002071C));
  sub_100006B64(v34);
  qword_100020710 = 0;
  do
    v39 = __ldaxr(&dword_100020718);
  while (__stlxr(v39 - 1, &dword_100020718));
  return v17;
}

uint64_t sub_100006B64(uint64_t a1)
{
  unsigned int *v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  v1 = (unsigned int *)(a1 + 16);
  do
  {
    v2 = __ldaxr(v1);
    v3 = (v2 - 1);
  }
  while (__stlxr(v3, v1));
  if (v2 <= 0)
  {
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000156AC();
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100015648();
    v6 = sub_1000094B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000155CC();
    MEMORY[0xAA] = -1159983646;
  }
  return v3;
}

uint64_t sub_100006C28(uint64_t a1, int a2, int a3, const char *a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v11;
  BOOL v12;
  unsigned __int8 *v13;
  char *v14;
  int v15;
  uint64_t v16;
  size_t v17;
  unsigned int *v18;
  int v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  _QWORD *v25;
  unsigned int v26;
  uint64_t *v27;
  _BYTE *v28;
  int v29;
  unsigned int v30;
  unsigned __int8 *v31;
  int v32;
  unsigned int v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  unsigned int v37;
  NSObject *v38;
  unsigned int v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  int v43;
  unsigned int v44;
  unsigned __int8 *v45;
  int v46;
  uint64_t *v47;
  _QWORD *v48;
  uint64_t v49;
  int v50;
  const char *v51;
  char *v52;
  size_t v53;
  int v54;
  char *v55;
  int v56;
  NSObject *v57;
  _QWORD *v58;
  int v59;
  uint64_t v60;
  int v61;
  unsigned int *v63;
  int v64;
  uint64_t v65;
  NSObject *v66;
  int v71;
  int *v73;
  int v75;
  uint8_t buf[4];
  unsigned int v77;
  __int16 v78;
  int v79;

  v8 = a5;
  v11 = *(unsigned __int8 *)a4;
  if (*a4)
  {
    v12 = 0;
    v13 = (unsigned __int8 *)(a4 + 1);
    v14 = (char *)a4;
    while (1)
    {
      if (!v12 || v11 != 47)
      {
        *v14++ = v11;
        if (v14 - a4 == 1023)
        {
          *v14 = 0;
          v16 = 1023;
          goto LABEL_12;
        }
        v11 = *(v13 - 1);
      }
      v12 = v11 == 47;
      v15 = *v13++;
      v11 = v15;
      if (!v15)
        goto LABEL_10;
    }
  }
  v14 = (char *)a4;
LABEL_10:
  *v14 = 0;
  v16 = v14 - a4;
LABEL_12:
  v17 = v16 + 1;
  if (a4[v16])
  {
    if (a4[v17])
    {
      v71 = a4[v16];
      a4[v16] = 0;
    }
    else
    {
      v71 = 0;
      v17 = v16 + 2;
    }
  }
  else
  {
    v71 = 0;
  }
  v18 = (unsigned int *)(a1 + 16);
  v19 = *(_DWORD *)(a1 + 8);
  v73 = (int *)(a1 + 8);
  if (3 * v19 + 3 <= (4 * *(_DWORD *)(a1 + 16)))
  {
    v20 = 2 * v19 + 2;
    if (v20 >= 0x80000)
    {
      if (!*(_DWORD *)(a1 + 12))
      {
        v21 = sub_1000094B4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1000159E8(a1 + 16, v73, v21);
        *(_DWORD *)(a1 + 12) = 1;
      }
      goto LABEL_45;
    }
    v75 = 0;
    v22 = sub_1000129E8(v20, &v75);
    if (v22)
    {
      v23 = v22;
      pthread_mutex_lock(&stru_100020100);
      v24 = 0;
      *(_QWORD *)(a1 + 16) = 0;
      v25 = *(_QWORD **)a1;
      *(_QWORD *)a1 = v23;
      v26 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v75;
      while (1)
      {
        v27 = (uint64_t *)v25[v24];
        if (v27)
          break;
LABEL_41:
        if (++v24 > v26)
        {
          pthread_mutex_unlock(&stru_100020100);
          free(v25);
          v8 = a5;
          goto LABEL_45;
        }
      }
      while (1)
      {
        v28 = (_BYTE *)v27[15];
        v29 = *v28;
        if (*v28)
        {
          v30 = 0;
          v31 = v28 + 1;
          do
          {
            v30 = dword_100020298[v29 ^ HIBYTE(v30)] ^ (v30 << 8);
            v32 = *v31++;
            v29 = v32;
          }
          while (v32);
        }
        else
        {
          v30 = 0;
        }
        if (v30 <= 1)
          v30 = 1;
        v33 = *(_DWORD *)(a1 + 8);
        v34 = (uint64_t *)(*(_QWORD *)a1 + 8 * (v33 & v30));
        v35 = *v34;
        if (*v34)
        {
          v36 = (uint64_t *)*v27;
          *v27 = v35;
        }
        else
        {
          v37 = *v18 + 1;
          *v18 = v37;
          if (v37 > v33)
          {
            v38 = sub_1000094B4();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = *v18;
              v40 = *v73;
              *(_DWORD *)buf = 67109376;
              v77 = v39;
              v78 = 1024;
              v79 = v40;
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "event table is screwed up! filled buckets %u / table_mask %u)", buf, 0xEu);
            }
          }
          v35 = *v34;
          v36 = (uint64_t *)*v27;
          *v27 = *v34;
          if (!v35)
            goto LABEL_40;
        }
        *(_QWORD *)(v35 + 8) = v27;
LABEL_40:
        *v34 = (uint64_t)v27;
        v27[1] = (uint64_t)v34;
        v27 = v36;
        if (!v36)
          goto LABEL_41;
      }
    }
    v41 = sub_1000094B4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_100015A60();
  }
LABEL_45:
  v42 = sub_1000071B8(a2);
  v43 = *(unsigned __int8 *)a4;
  if (*a4)
  {
    v44 = 0;
    v45 = (unsigned __int8 *)(a4 + 1);
    do
    {
      v44 = dword_100020298[v43 ^ HIBYTE(v44)] ^ (v44 << 8);
      v46 = *v45++;
      v43 = v46;
    }
    while (v46);
  }
  else
  {
    v44 = 0;
  }
  if (v44 <= 1)
    v44 = 1;
  v47 = (uint64_t *)(*(_QWORD *)a1 + 8 * (*(_DWORD *)(a1 + 8) & v44));
  if ((v8 & 0x6000000) == 0)
  {
    v48 = (_QWORD *)*v47;
    if (*v47)
    {
      do
      {
        v49 = (uint64_t)v48;
        v48 = (_QWORD *)*v48;
        v50 = *(_DWORD *)(v49 + 24);
        if (v42)
        {
          if (v50 != a2)
            continue;
        }
        else if (sub_1000071B8(v50))
        {
          continue;
        }
        if (*(_QWORD *)(v49 + 40) == a7)
        {
          v51 = *(const char **)(v49 + 120);
          if (!strncmp(v51, a4, v17) && !v51[v17 - 1])
          {
            v63 = (unsigned int *)(v49 + 16);
            do
            {
              v64 = __ldaxr(v63);
              v65 = (v64 + 1);
            }
            while (__stlxr(v65, v63));
            v53 = v17;
            v54 = a8;
            if (v64 <= -2)
            {
              v66 = sub_1000094B4();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                sub_100015978(v49, v65, v66);
            }
            if (*v63 == 1)
              *(_DWORD *)(v49 + 20) = 0;
            v60 = a6;
            v61 = a5;
            v59 = v71;
LABEL_73:
            *(_DWORD *)(v49 + 20) |= v61;
            *(_DWORD *)(v49 + 24) = a2;
            *(_QWORD *)(v49 + 32) = v60;
            *(_QWORD *)(v49 + 40) = a7;
            *(_DWORD *)(v49 + 48) = v54;
            if (v59)
              goto LABEL_74;
            return v49;
          }
        }
      }
      while (v48);
    }
  }
  v52 = (char *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206C0, 0x80uLL, 0x10B00402042220DuLL);
  v49 = (uint64_t)v52;
  if (v52)
  {
    *((_QWORD *)v52 + 2) = 1;
    *((_DWORD *)v52 + 7) = a3;
    v53 = v17;
    *((_WORD *)v52 + 26) = v17;
    *((_QWORD *)v52 + 5) = a7;
    v54 = a8;
    *((_DWORD *)v52 + 12) = a8;
    *(_OWORD *)(v52 + 56) = 0u;
    *(_OWORD *)(v52 + 72) = 0u;
    *(_OWORD *)(v52 + 88) = 0u;
    *(_OWORD *)(v52 + 104) = 0u;
    v55 = sub_1000076D4(a4, v17);
    *(_QWORD *)(v49 + 120) = v55;
    if (v55[v17 - 1])
    {
      v56 = dword_100020698++;
      if (v56 <= 49)
      {
        v57 = sub_1000094B4();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          sub_100015908();
      }
    }
    v58 = (_QWORD *)*v47;
    if (*v47)
      v58[1] = v49;
    else
      ++*v18;
    v60 = a6;
    v61 = a5;
    v59 = v71;
    *(_QWORD *)v49 = v58;
    *v47 = v49;
    *(_QWORD *)(v49 + 8) = v47;
    goto LABEL_73;
  }
  v53 = v17;
  LOBYTE(v59) = v71;
  if (v71)
LABEL_74:
    a4[v53 - 1] = v59;
  return v49;
}

BOOL sub_1000071B8(int a1)
{
  _BOOL8 v2;
  unint64_t v3;
  unint64_t v4;
  int v5;

  pthread_mutex_lock(&stru_100020008);
  if (dword_100021858[0] == a1)
  {
    v2 = 1;
  }
  else
  {
    v3 = 0;
    do
    {
      v4 = v3;
      if (v3 == 31)
        break;
      v5 = dword_100021858[++v3];
    }
    while (v5 != a1);
    v2 = v4 < 0x1F;
  }
  pthread_mutex_unlock(&stru_100020008);
  return v2;
}

uint64_t sub_10000723C(uint64_t result, uint64_t a2)
{
  _DWORD **v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  unsigned __int8 *v13;
  int v14;
  unsigned __int8 v15;
  unint64_t v16;
  unsigned __int8 *v17;
  int v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;

  v3 = (_DWORD **)result;
  do
    v4 = __ldaxr(&dword_10002071C);
  while (__stlxr(v4 + 1, &dword_10002071C));
  if (result)
  {
    v5 = a2 + 56;
    do
    {
      if (((*v3)[47] & 2) == 0)
      {
        v6 = (*v3)[48];
        v7 = (unsigned __int8 *)(v5 + (v6 >> 3));
        v8 = 0x80u >> (v6 & 7);
        do
          v9 = __ldxr(v7);
        while (__stxr(v9 | v8, v7));
        if ((v8 & v9) == 0)
        {
          v10 = (uint64_t)*v3;
          result = sub_100007B5C(*v3);
          v11 = *v3;
          if ((int)result >= *(_DWORD *)(v10 + 224) - 1)
          {
            v16 = v11[48];
            v17 = (unsigned __int8 *)(v5 + (v16 >> 3));
            v18 = -129 >> (v16 & 7);
            do
              v19 = __ldxr(v17);
            while (__stxr(v19 & v18, v17));
            v20 = (uint64_t)*v3;
            if (((*v3)[47] & 1) == 0)
            {
              *(_DWORD *)(v20 + 188) |= 1u;
              *(_QWORD *)(v20 + 152) = *(_QWORD *)(a2 + 32);
            }
          }
          else if ((v11[47] & 0x80) != 0 && *(_DWORD *)(a2 + 24) == v11[62])
          {
            v12 = v11[48];
            v13 = (unsigned __int8 *)(v5 + (v12 >> 3));
            v14 = -129 >> (v12 & 7);
            do
              v15 = __ldxr(v13);
            while (__stxr(v15 & v14, v13));
          }
          else
          {
            result = sub_100007840(a2);
            v21 = (uint64_t)*v3;
            *(_QWORD *)(*((_QWORD *)*v3 + 52) + 8 * (int)(*v3)[61]) = a2;
            *(_DWORD *)(v21 + 244) = (*(_DWORD *)(v21 + 244) + 1) % *(_DWORD *)(v21 + 224);
          }
        }
      }
      v3 = (_DWORD **)v3[1];
    }
    while (v3);
  }
  do
    v22 = __ldaxr(&dword_10002071C);
  while (__stlxr(v22 - 1, &dword_10002071C));
  return result;
}

const char *sub_1000073C0(int a1, char *__s1, _BYTE *a3)
{
  const char *v3;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v3 = __s1;
  *a3 = 0;
  if (a1)
  {
    if (!strncmp(__s1, "/.docid/", 8uLL) || !strncmp(v3, "/.activity/", 0xBuLL))
    {
      ++v3;
    }
    else
    {
      sub_1000075A8((uint64_t)&unk_100021758);
      v6 = qword_1000206E8;
      if (!qword_1000206E8)
        goto LABEL_25;
      if (*(int *)(qword_1000206E8 + 8) < 1)
      {
        LODWORD(v7) = 0;
      }
      else
      {
        v7 = 0;
        do
        {
          if (**(_DWORD **)(*(_QWORD *)v6 + 8 * v7) == a1)
          {
            if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8 * v7) + 32) & 0x8000) != 0)
            {
              *a3 = 1;
            }
            else if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8 * v7) + 32) & 0x50) == 0)
            {
              break;
            }
          }
          ++v7;
        }
        while (v7 < *(int *)(v6 + 8));
      }
      if ((int)v7 < *(_DWORD *)(v6 + 8))
      {
        v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8 * v7) + 24);
        if (v8 < 1)
        {
          LODWORD(v9) = 0;
        }
        else
        {
          v9 = 0;
          do
          {
            if (v3[v9] == 47)
            {
              --v8;
            }
            else if (!v3[v9])
            {
              break;
            }
            ++v9;
          }
          while (v8 > 0);
        }
        sub_100007528((uint64_t)&unk_100021758);
        v3 += v9;
      }
      else
      {
LABEL_25:
        sub_100007528((uint64_t)&unk_100021758);
      }
    }
  }
  return v3;
}

uint64_t sub_100007528(uint64_t a1)
{
  int *v2;
  int v3;
  int v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (int *)sub_100007664((pthread_key_t *)a1);
  if (v2)
  {
    v3 = *v2;
    if (!*v2)
      sub_100007D14();
    if (v3 < 1)
      v4 = v3 + 1;
    else
      v4 = v3 - 1;
    *v2 = v4;
    if (v4)
      return 0;
  }
  else
  {
    v6 = sub_1000094B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100014BA0(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_1000075A8(uint64_t a1)
{
  int *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v2 = (int *)sub_100007664((pthread_key_t *)a1);
  if (v2)
  {
    v3 = *v2;
    if (*v2 < 0)
      sub_100007CEC();
    *v2 = v3 + 1;
    if (v3)
    {
      return 0;
    }
    else
    {
      v4 = pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
      if ((_DWORD)v4)
      {
        v13 = sub_1000094B4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_100014C80(v4);
      }
    }
  }
  else
  {
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100014C10(v5, v6, v7, v8, v9, v10, v11, v12);
    return pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
  }
  return v4;
}

void *sub_100007664(pthread_key_t *a1)
{
  void *v2;
  _DWORD *v3;

  v2 = pthread_getspecific(*a1);
  if (!v2)
  {
    v3 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    v2 = v3;
    if (v3)
    {
      *v3 = 0;
      if (pthread_setspecific(*a1, v3))
      {
        free(v2);
        return 0;
      }
    }
  }
  return v2;
}

char *sub_1000076D4(const char *a1, size_t a2)
{
  size_t v2;
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  char **v9;
  char *v10;
  char *v11;
  char *v12;
  int *v13;

  v2 = a2;
  if (a1[a2 - 1] && !a1[a2])
    v2 = a2 + 1;
  v4 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    v5 = 0;
    v6 = (unsigned __int8 *)(a1 + 1);
    do
    {
      v5 = dword_100020298[v4 ^ HIBYTE(v5)] ^ (v5 << 8);
      v7 = *v6++;
      v4 = v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  if (v5 <= 1)
    v8 = 1;
  else
    v8 = v5;
  pthread_mutex_lock(&stru_100020050);
  v9 = (char **)(qword_100021848 + 8 * (dword_100021854 & v8));
  v10 = *v9;
  if (*v9)
  {
    while (strncmp(v10 + 20, a1, v2) || v10[v2 + 19])
    {
      v10 = *(char **)v10;
      if (!v10)
        goto LABEL_16;
    }
    v13 = (int *)(v10 + 16);
  }
  else
  {
LABEL_16:
    v11 = (char *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206A8, v2 + 24, 0x9FA32475uLL);
    if (!v11)
    {
      pthread_mutex_unlock(&stru_100020050);
      return 0;
    }
    v10 = v11;
    *((_DWORD *)v11 + 4) = 1;
    strlcpy(v11 + 20, a1, v2);
    v12 = *v9;
    *(_QWORD *)v10 = *v9;
    if (v12)
      *((_QWORD *)v12 + 1) = v10;
    *v9 = v10;
    *((_QWORD *)v10 + 1) = v9;
    v13 = &dword_100021850;
  }
  ++*v13;
  pthread_mutex_unlock(&stru_100020050);
  return v10 + 20;
}

uint64_t sub_100007840(uint64_t a1)
{
  unsigned int *v1;
  int v2;
  uint64_t v3;
  NSObject *v4;

  v1 = (unsigned int *)(a1 + 16);
  do
  {
    v2 = __ldaxr(v1);
    v3 = (v2 + 1);
  }
  while (__stlxr(v3, v1));
  if (v2 <= -2)
  {
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10001556C();
    MEMORY[0x99] = -1159983647;
  }
  return v3;
}

uint64_t sub_1000078BC(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  unsigned int v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 buffer;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;

  v1 = *(int *)(a1 + 8) + 1000000 * *(_QWORD *)a1;
  do
    v2 = __ldaxr(&dword_10002071C);
  while (__stlxr(v2 + 1, &dword_10002071C));
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = xmmword_100020758[v3];
    if (!v5 || (*(_DWORD *)(v5 + 188) & 2) != 0)
      goto LABEL_28;
    v6 = *(_QWORD *)(v5 + 144);
    if ((*(_DWORD *)(v5 + 188) & 4) != 0)
    {
      v8 = *(_QWORD *)(v5 + 176);
      v7 = v1 - v6;
    }
    else if (!v6 || ((v7 = v1 - v6, v8 = *(_QWORD *)(v5 + 176), v8 >= 0x3E8) ? (v9 = v7 >= 2 * v8) : (v9 = 0), v9))
    {
      *(_QWORD *)(v5 + 144) = v1;
LABEL_19:
      if (*(_DWORD *)(v5 + 240) != *(_DWORD *)(v5 + 244)
        && v4 - 1 >= (unint64_t)(*(_QWORD *)(v5 + 176) - v1 + *(_QWORD *)(v5 + 144)))
      {
        v4 = *(_QWORD *)(v5 + 176) - v1 + *(_QWORD *)(v5 + 144);
      }
      goto LABEL_22;
    }
    if (v7 < v8 && (int)sub_100007B5C((_DWORD *)xmmword_100020758[v3]) <= *(_DWORD *)(v5 + 224) / 2)
      goto LABEL_19;
    if (*(_DWORD *)(v5 + 240) != *(_DWORD *)(v5 + 244))
    {
      *(_QWORD *)(v5 + 144) = v1;
      sub_100007D3C(v5);
    }
LABEL_22:
    if ((unint64_t)(v1 - *(_QWORD *)(v5 + 312)) >= 0x141DD76001)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      buffer = 0u;
      v22 = 0u;
      if ((*(_DWORD *)(v5 + 188) & 0x20) != 0 && proc_pidinfo(*(_DWORD *)(v5 + 248), 4, 0, &buffer, 96) != 96)
      {
        v10 = sub_1000094B4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_DWORD *)(v5 + 248);
          *(_DWORD *)buf = 67109120;
          v28 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to gather process task information for pid: %i", buf, 8u);
        }
      }
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000;
      v14[2] = sub_100013528;
      v14[3] = &unk_10001C7E8;
      v14[4] = v5;
      v17 = v23;
      v18 = v24;
      v19 = v25;
      v20 = v26;
      v15 = buffer;
      v16 = v22;
      analytics_send_event_lazy("com.apple.massStorage.FUNInfo.fsevents_1", v14);
      *(_QWORD *)(v5 + 312) = v1;
    }
LABEL_28:
    ++v3;
  }
  while (v3 != 512);
  do
    v12 = __ldaxr(&dword_10002071C);
  while (__stlxr(v12 - 1, &dword_10002071C));
  return v4;
}

uint64_t sub_100007B5C(_DWORD *a1)
{
  int v2;
  int v3;

  v3 = a1[60];
  v2 = a1[61];
  if (v3 <= v2)
    return (v2 - v3);
  else
    return (a1[56] - v3 + v2);
}

uint64_t sub_100007BB4(const char *a1, size_t a2)
{
  size_t v2;
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  char *v9;
  int v11;
  char *v12;

  v2 = a2;
  if (a1[a2 - 1] && !a1[a2])
    v2 = a2 + 1;
  v4 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    v5 = 0;
    v6 = (unsigned __int8 *)(a1 + 1);
    do
    {
      v5 = dword_100020298[v4 ^ HIBYTE(v5)] ^ (v5 << 8);
      v7 = *v6++;
      v4 = v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  if (v5 <= 1)
    v8 = 1;
  else
    v8 = v5;
  pthread_mutex_lock(&stru_100020050);
  v9 = *(char **)(qword_100021848 + 8 * (dword_100021854 & v8));
  if (!v9)
    goto LABEL_16;
  while (strncmp(v9 + 20, a1, v2) || v9[v2 + 19])
  {
    v9 = *(char **)v9;
    if (!v9)
      goto LABEL_16;
  }
  v11 = *((_DWORD *)v9 + 4) - 1;
  *((_DWORD *)v9 + 4) = v11;
  if (v11)
  {
LABEL_16:
    pthread_mutex_unlock(&stru_100020050);
  }
  else
  {
    v12 = *(char **)v9;
    if (*(_QWORD *)v9)
      *((_QWORD *)v12 + 1) = *((_QWORD *)v9 + 1);
    **((_QWORD **)v9 + 1) = v12;
    --dword_100021850;
    pthread_mutex_unlock(&stru_100020050);
    malloc_zone_free((malloc_zone_t *)qword_1000206A8, v9);
  }
  return 0;
}

void sub_100007CEC()
{
  __assert_rtn("fsevent_rwlock_rdlock", "fseventsd_implementation.c", 259, "*pLockCount >= 0");
}

void sub_100007D14()
{
  __assert_rtn("fsevent_rwlock_unlock", "fseventsd_implementation.c", 231, "*pLockCount != 0");
}

uint64_t sub_100007D3C(uint64_t a1)
{
  pthread_t v3;
  pthread_attr_t v4;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  if ((*(_DWORD *)(a1 + 188) & 0x800) != 0)
  {
    memset(&v4, 0, sizeof(v4));
    v3 = 0;
    if ((*(_DWORD *)(a1 + 188) & 0x20) != 0)
      sub_10001588C();
    *(_DWORD *)(a1 + 188) &= ~0x800u;
    pthread_attr_init(&v4);
    pthread_attr_setdetachstate(&v4, 2);
    pthread_create(&v3, &v4, (void *(__cdecl *)(void *))sub_100002E7C, (void *)a1);
    pthread_attr_destroy(&v4);
  }
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

uint64_t sub_100007E04(void (*a1)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;

  sub_1000075A8((uint64_t)&unk_100021758);
  v2 = qword_1000206E8;
  if (qword_1000206E8 && *(int *)(qword_1000206E8 + 8) >= 1)
  {
    v3 = 0;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)v2 + 8 * v3) && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8 * v3) + 32) & 0x20) != 0)
        a1(*(_QWORD *)(*(_QWORD *)v2 + 8 * v3));
      ++v3;
    }
    while (v3 < *(int *)(v2 + 8));
  }
  return sub_100007528((uint64_t)&unk_100021758);
}

uint64_t sub_100007E90(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unsigned int v5;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 32);
  v4 = v2 > v3;
  if (v2 >= v3)
    v5 = 0;
  else
    v5 = -1;
  if (v4)
    return 1;
  else
    return v5;
}

uint64_t sub_100007EB0()
{
  _BOOL8 v0;
  int v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  timespec v13;

  if (dword_1000206C8)
    return 0;
  if (dword_100020750)
    return 1;
  pthread_mutex_lock(&stru_100020090);
  if (dword_100020750)
  {
    pthread_mutex_unlock(&stru_100020090);
    return 1;
  }
  v13.tv_sec = 0;
  v13.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v13);
  v13.tv_sec += 10;
  while (!dword_1000206C8)
  {
    v2 = pthread_cond_timedwait(&stru_1000200D0, &stru_100020090, &v13);
    if (dword_100020750)
    {
      v0 = dword_1000206C8 == 0;
      goto LABEL_19;
    }
    v3 = v2;
    if (v2)
    {
      if (v2 == 60)
      {
        v4 = sub_1000094B4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          sub_100017134(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      else
      {
        v12 = sub_1000094B4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_1000170BC(v3);
      }
      break;
    }
  }
  v0 = 0;
LABEL_19:
  pthread_mutex_unlock(&stru_100020090);
  return v0;
}

uint64_t sub_100007FEC(uint64_t a1, int a2, unsigned int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  char **v14;
  unsigned int v15;
  char __s1[1024];

  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  if (a2 > 8)
    return 28;
  if (a2 >= 1)
  {
    v9 = a3;
    v10 = a2;
    v11 = a2;
    v12 = a3;
    do
    {
      v13 = *v12++;
      if (strnlen((const char *)(a5 + v13), 0x401uLL) > 0x400)
        return 22;
      --v11;
    }
    while (v11);
    v14 = (char **)(a1 + 48);
    do
    {
      v15 = *v9++;
      __strlcpy_chk(__s1, a5 + v15, 1024, 1024);
      *v14++ = strdup(__s1);
      --v10;
    }
    while (v10);
  }
  result = 0;
  *(_DWORD *)(a1 + 40) = a2;
  return result;
}

uint64_t sub_1000080F4(int a1, int a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, unsigned int a8, unsigned int a9, unsigned int *a10, int a11, uint64_t a12, unsigned int a13, uint64_t a14, int a15, uint64_t a16, mach_port_name_t *a17, _OWORD *a18)
{
  __int128 v25;
  mach_port_t v26;
  uint64_t v27;
  uint64_t v28;
  ipc_space_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  ipc_space_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v43;
  uintptr_t v44;
  __int128 v45;
  _QWORD *v46;
  _DWORD *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const void *v58;
  int v59;
  mach_port_t previous;
  audit_token_t atoken;
  pid_t pidp;
  gid_t egidp[4];

  *(_QWORD *)egidp = 0;
  pidp = 0;
  v25 = a18[1];
  *(_OWORD *)atoken.val = *a18;
  *(_OWORD *)&atoken.val[4] = v25;
  audit_token_to_au32(&atoken, 0, &egidp[1], egidp, 0, 0, &pidp, 0, 0);
  v26 = mach_task_self_;
  *a17 = 0;
  if (a4 == a6)
  {
    v59 = a2;
    if (a9 == a11)
    {
      if (a4 > 0x1000 || a9 > 0x400000)
      {
        v33 = v26;
        v31 = 268435459;
        v36 = sub_1000094B4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_100013F1C();
      }
      else if (a8 > 0x400000 || a13 > 0x400000)
      {
        v33 = v26;
        v31 = 268435459;
        v37 = sub_1000094B4();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_100013F88();
      }
      else if (a4)
      {
        v27 = 0;
        while (*(_DWORD *)(a5 + 4 * v27) <= a8)
        {
          if (a4 == ++v27)
            goto LABEL_11;
        }
        v33 = v26;
        v31 = 268435459;
        v38 = sub_1000094B4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          sub_1000142A0();
      }
      else
      {
LABEL_11:
        if ((int)a9 < 1)
        {
LABEL_15:
          v29 = v26;
          v30 = mach_port_allocate(v26, 1u, a17);
          if ((_DWORD)v30)
          {
            v31 = v30;
            v32 = sub_1000094B4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              sub_100014224(v31);
            goto LABEL_35;
          }
          v58 = a7;
          previous = 0;
          v33 = v29;
          v40 = mach_port_request_notification(v29, *a17, 70, 1u, *a17, 0x15u, &previous);
          if ((_DWORD)v40)
          {
            v31 = v40;
            v41 = sub_1000094B4();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              sub_1000141A8(v31);
          }
          else
          {
            v43 = a14;
            if (previous)
            {
              mach_port_deallocate(mach_task_self_, previous);
              v43 = a14;
            }
            v44 = *a17;
            v45 = a18[1];
            *(_OWORD *)atoken.val = *a18;
            *(_OWORD *)&atoken.val[4] = v45;
            v46 = sub_100009220(v59, v44, a3, a4, a5, a8, v58, v43, a15, a16, pidp, egidp[1], egidp[0], &atoken);
            if (v46)
            {
              v47 = v46;
              if (sub_100007FEC((uint64_t)v46, a9, a10, a13, a12))
              {
                v31 = 268435459;
                *v47 = 0;
                sub_100009CBC((uint64_t)v47);
                v48 = sub_1000094B4();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  sub_10001413C();
              }
              else
              {
                if (!sub_100008560((uint64_t)v47))
                  return 0;
                v31 = 268435459;
                *v47 = 0;
                sub_100009CBC((uint64_t)v47);
                v57 = sub_1000094B4();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  sub_1000140D0();
              }
              goto LABEL_35;
            }
            v31 = 268435459;
            v49 = sub_1000094B4();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              sub_100014060(v49, v50, v51, v52, v53, v54, v55, v56);
          }
        }
        else
        {
          v28 = 0;
          while (a10[v28] <= a13)
          {
            if (a9 == ++v28)
              goto LABEL_15;
          }
          v33 = v26;
          v31 = 268435459;
          v39 = sub_1000094B4();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            sub_100013FF4();
        }
      }
    }
    else
    {
      v33 = v26;
      v31 = 268435459;
      v35 = sub_1000094B4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_10001430C();
    }
  }
  else
  {
    v33 = v26;
    v31 = 268435459;
    v34 = sub_1000094B4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100014378();
  }
  if (*a17)
  {
    mach_port_mod_refs(v33, *a17, 1u, -1);
LABEL_35:
    *a17 = 0;
  }
  return v31;
}

uint64_t sub_100008560(uint64_t a1)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  __int128 v16;
  NSObject *v17;
  unsigned int v19;
  _OWORD v20[2];
  pthread_t v21;
  void *v22;
  pthread_attr_t __attr;

  if (!sub_100007EB0())
    return 22;
  v2 = *(_DWORD *)(a1 + 120);
  v3 = (2 * v2) & 4 | (((v2 >> 3) & 1) << 7);
  if ((v2 & 0x20) != 0)
  {
    v3 |= 0x1000u;
    pthread_mutex_lock(&stru_100020008);
    v4 = 0;
    while (dword_100021858[v4])
    {
      if (++v4 == 32)
        goto LABEL_8;
    }
    dword_100021858[v4] = *(_DWORD *)(a1 + 136);
LABEL_8:
    pthread_mutex_unlock(&stru_100020008);
    v2 = *(_DWORD *)(a1 + 120);
  }
  if ((v2 & 0x80) != 0)
    v5 = 0x2000;
  else
    v5 = 459;
  v6 = (16 * v2) & 0x100 | v3 | ((v2 & 0x80) << 7);
  if ((v2 & 0x40) != 0)
  {
    v6 |= 0x2000u;
    *(_DWORD *)(a1 + 152) = 1;
  }
  if ((v2 & 0x100) != 0)
  {
    v6 |= 0x8000u;
    *(_DWORD *)(a1 + 156) = 1;
  }
  v21 = 0;
  v22 = 0;
  memset(&__attr, 0, sizeof(__attr));
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_DWORD *)(a1 + 16);
  v9 = *(_DWORD *)(a1 + 20);
  v10 = *(_DWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = *(_QWORD *)(a1 + 128);
  v13 = *(_DWORD *)(a1 + 136);
  v14 = *(_DWORD *)(a1 + 140);
  v15 = *(_DWORD *)(a1 + 144);
  v16 = *(_OWORD *)(a1 + 176);
  v20[0] = *(_OWORD *)(a1 + 160);
  v20[1] = v16;
  if (sub_100008974(v13, v8, v7, v9, (_QWORD *)(a1 + 48), v10, v11, v5, v12, v6, (uint64_t)sub_100004E34, a1, v14, v15, v20, (unint64_t *)&v22))
  {
    v17 = sub_1000094B4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100017460();
    return 22;
  }
  do
    v19 = __ldxr((unsigned int *)&dword_100020720);
  while (__stxr(v19 + 1, (unsigned int *)&dword_100020720));
  sub_100009208(a1);
  pthread_attr_init(&__attr);
  pthread_attr_setdetachstate(&__attr, 2);
  if ((v6 & 0x4000) != 0)
    pthread_attr_set_qos_class_np(&__attr, QOS_CLASS_USER_INTERACTIVE, 0);
  pthread_create(&v21, &__attr, (void *(__cdecl *)(void *))sub_100002E7C, v22);
  pthread_attr_destroy(&__attr);
  return 0;
}

BOOL sub_100008764(_OWORD *a1, const char *a2)
{
  const __CFString *v3;
  __int128 v4;
  __SecTask *v5;
  __SecTask *v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  CFTypeID v9;
  _BOOL8 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  audit_token_t cf;

  if (a2)
  {
    v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
    v4 = a1[1];
    *(_OWORD *)cf.val = *a1;
    *(_OWORD *)&cf.val[4] = v4;
    v5 = SecTaskCreateWithAuditToken(0, &cf);
    if (v5)
    {
      v6 = v5;
      *(_QWORD *)cf.val = 0;
      v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, v3, (CFErrorRef *)&cf);
      if (v7)
      {
        v8 = v7;
        v9 = CFGetTypeID(v7);
        v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
        CFRelease(v8);
      }
      else
      {
        v10 = 0;
      }
      if (*(_QWORD *)cf.val)
        CFRelease(*(CFTypeRef *)cf.val);
      CFRelease(v6);
      if (v3)
LABEL_19:
        CFRelease(v3);
    }
    else
    {
      v19 = sub_1000094B4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100015AFC(v19, v20, v21, v22, v23, v24, v25, v26);
      v10 = 0;
      if (v3)
        goto LABEL_19;
    }
  }
  else
  {
    v11 = sub_1000094B4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100015A8C(v11, v12, v13, v14, v15, v16, v17, v18);
    return 0;
  }
  return v10;
}

void sub_100008898(uint64_t a1, unint64_t a2, uint64_t a3, mach_error_t a4)
{
  NSObject *v8;
  mach_msg_header_t *msg;
  NSObject *v10;

  if (a4)
  {
    v8 = sub_1000094B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100013E58(a4, a2, v8);
  }
  if (a2 > 0xD)
    goto LABEL_10;
  if (((1 << a2) & 0x2182) != 0)
    return;
  if (a2 == 2)
  {
    if ((dispatch_mach_mig_demux(a1, &off_100020000, 1, a3) & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
      mach_msg_destroy(msg);
    }
  }
  else
  {
LABEL_10:
    v10 = sub_1000094B4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100013DD4(a2, v10);
  }
}

uint64_t sub_100008974(int a1, int a2, uint64_t a3, unsigned int a4, _QWORD *a5, unsigned int a6, uint64_t a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, int a13, int a14, _OWORD *a15, unint64_t *a16)
{
  uint64_t v24;
  pthread_mutex_t *v25;
  unint64_t v26;
  pthread_cond_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  const char *v33;
  char *v34;
  const char *v35;
  NSObject *v36;
  uint64_t v37;
  char **v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t i;
  int v50;
  int v51;
  unsigned int v52;
  uint64_t v53;
  char __s[16];
  __int128 v55;

  if (a2 && a4 >= 2 && a13)
    return 22;
  v25 = (pthread_mutex_t *)malloc_type_calloc(8 * a8 + 424, 1uLL, 0x7A25EB3BuLL);
  if (!v25)
    return 12;
  v26 = (unint64_t)v25;
  v52 = a6;
  v53 = a7;
  pthread_mutex_init(v25, 0);
  v27 = (pthread_cond_t *)(v26 + 64);
  pthread_cond_init((pthread_cond_t *)(v26 + 64), 0);
  *(_DWORD *)(v26 + 128) = a4;
  v28 = a4;
  v29 = malloc_type_calloc(a4, 8uLL, 0x10040436913F5uLL);
  *(_QWORD *)(v26 + 136) = v29;
  if (!v29)
  {
    v24 = 12;
LABEL_48:
    free(*(void **)(v26 + 200));
    v44 = *(void **)(v26 + 136);
    if (v44)
    {
      if (a4)
      {
        v45 = 0;
        v46 = 8 * v28;
        do
        {
          v47 = *(void **)(*(_QWORD *)(v26 + 136) + v45);
          if (v47)
          {
            free(v47);
            *(_QWORD *)(*(_QWORD *)(v26 + 136) + v45) = 0;
          }
          v45 += 8;
        }
        while (v46 != v45);
        v44 = *(void **)(v26 + 136);
      }
      free(v44);
    }
    for (i = 352; i != 416; i += 8)
    {
      free(*(void **)(v26 + i));
      *(_QWORD *)(v26 + i) = 0;
    }
    pthread_cond_destroy(v27);
    free((void *)v26);
    v26 = 0;
    goto LABEL_59;
  }
  v50 = a1;
  v51 = a8;
  if (!a4)
    goto LABEL_30;
  v30 = 0;
  while (1)
  {
    v31 = *(char **)(a3 + 8 * v30);
    if (!a2)
    {
LABEL_19:
      v35 = v31;
      goto LABEL_21;
    }
    if (*v31 == 47 && !v31[1])
      break;
    v32 = strstr(*(char **)(a3 + 8 * v30), "/.docid");
    if (v32)
    {
      if (strcmp(v32, "/.docid"))
        goto LABEL_22;
      v33 = ".docid";
    }
    else
    {
      v34 = strstr(v31, "/.activity");
      if (!v34)
        goto LABEL_19;
      if (strcmp(v34, "/.activity"))
        goto LABEL_22;
      v33 = ".activity";
    }
    *(_QWORD *)(*(_QWORD *)(v26 + 136) + 8 * v30) = strdup(v33);
LABEL_23:
    if (a4 == ++v30)
      goto LABEL_30;
  }
  v35 = (const char *)&unk_1000187EA;
LABEL_21:
  *(_QWORD *)(*(_QWORD *)(v26 + 136) + 8 * v30) = strdup(v35);
LABEL_22:
  if (*(_QWORD *)(*(_QWORD *)(v26 + 136) + 8 * v30))
    goto LABEL_23;
  v36 = sub_1000094B4();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    sub_100015B6C();
  if (a4 != (_DWORD)v30)
  {
    if (v30 < a4)
    {
      do
        *(_QWORD *)(*(_QWORD *)(v26 + 136) + 8 * v30++) = 0;
      while (a4 != v30);
    }
    v24 = 12;
    goto LABEL_47;
  }
LABEL_30:
  *(_OWORD *)(v26 + 384) = 0u;
  *(_OWORD *)(v26 + 400) = 0u;
  *(_OWORD *)(v26 + 352) = 0u;
  *(_OWORD *)(v26 + 368) = 0u;
  if (v52)
  {
    v37 = v52;
    v38 = (char **)(v26 + 352);
    do
    {
      __strlcpy_chk(__s, *a5, 1024, 1024);
      if (__s[strlen(__s) - 1] != 47)
        __strlcat_chk(__s, "/", 1024, 1024);
      *v38++ = strdup(__s);
      ++a5;
      --v37;
    }
    while (v37);
  }
  *(_DWORD *)(v26 + 112) = a2;
  *(_QWORD *)(v26 + 208) = a11;
  *(_QWORD *)(v26 + 216) = a12;
  *(_QWORD *)(v26 + 176) = v53;
  *(_DWORD *)(v26 + 224) = v51;
  *(_QWORD *)(v26 + 232) = a9;
  *(_DWORD *)(v26 + 188) = a10;
  *(_QWORD *)(v26 + 416) = v26 + 424;
  *(_DWORD *)(v26 + 248) = v50;
  *(_DWORD *)(v26 + 252) = a13;
  *(_DWORD *)(v26 + 256) = a14;
  v39 = a15[1];
  *(_OWORD *)(v26 + 260) = *a15;
  *(_OWORD *)(v26 + 276) = v39;
  v40 = a15[1];
  *(_OWORD *)__s = *a15;
  v55 = v40;
  *(_DWORD *)(v26 + 292) = sub_100008764(__s, "com.apple.private.vfs.authorized-access");
  v41 = (char *)malloc_type_malloc(16 * a4, 0x20040A4A59CD2uLL);
  *(_QWORD *)(v26 + 200) = v41;
  if (!v41)
  {
    v24 = 12;
LABEL_47:
    v27 = (pthread_cond_t *)(v26 + 64);
    goto LABEL_48;
  }
  v27 = (pthread_cond_t *)(v26 + 64);
  if (a4)
  {
    v42 = v41 + 8;
    v43 = a4;
    do
    {
      *(v42 - 1) = v26;
      *v42 = 0;
      v42 += 2;
      --v43;
    }
    while (v43);
  }
  pthread_mutex_lock(&stru_100020140);
  v24 = sub_1000090CC(v26);
  if ((_DWORD)v24)
  {
LABEL_42:
    pthread_mutex_unlock(&stru_100020140);
    goto LABEL_48;
  }
  v24 = sub_100002A6C(v26);
  if ((_DWORD)v24)
  {
    sub_10000BD90(v26);
    goto LABEL_42;
  }
  pthread_mutex_unlock(&stru_100020140);
LABEL_59:
  *a16 = v26;
  return v24;
}

NSObject *sub_100008E08(uintptr_t handle)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD handler[5];

  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, handle, 0, (dispatch_queue_t)qword_100020248);
  v2 = v1;
  if (v1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100009520;
    handler[3] = &unk_10001C6C8;
    handler[4] = v1;
    dispatch_source_set_event_handler(v1, handler);
  }
  else
  {
    v3 = sub_1000094B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100013CC4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return v2;
}

void *sub_100008EB0(int a1, uintptr_t a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12, int a13, _OWORD *a14)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  __int128 v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD handler[5];

  v22 = malloc_type_calloc(1uLL, 0xC8uLL, 0x10B004086E55B40uLL);
  if (!v22)
  {
    v29 = sub_1000094B4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1000144BC(v29, v30, v31, v32, v33, v34, v35, v36);
    return 0;
  }
  v23 = v22;
  v24 = malloc_type_malloc(a6, 0x9984850uLL);
  *((_QWORD *)v23 + 4) = v24;
  if (!v24)
  {
    v37 = sub_1000094B4();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_10001452C(v37, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_18;
  }
  memcpy(v24, a7, a6);
  v25 = malloc_type_malloc(8 * a4, 0x10040436913F5uLL);
  *((_QWORD *)v23 + 3) = v25;
  if (!v25)
  {
    v45 = sub_1000094B4();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_10001459C(v45, v46, v47, v48, v49, v50, v51, v52);
    goto LABEL_17;
  }
  if (a4)
  {
    v26 = 0;
    do
    {
      *(_QWORD *)(*((_QWORD *)v23 + 3) + 8 * v26) = *((_QWORD *)v23 + 4) + *(unsigned int *)(a5 + 4 * v26);
      ++v26;
    }
    while (a4 != v26);
  }
  *((_DWORD *)v23 + 4) = a3;
  *((_DWORD *)v23 + 5) = a4;
  *(_DWORD *)v23 = a1;
  *((_DWORD *)v23 + 1) = a2;
  v27 = sub_100008E08(a2);
  *((_QWORD *)v23 + 1) = v27;
  if (!v27)
  {
    v53 = sub_1000094B4();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      sub_10001460C(v53, v54, v55, v56, v57, v58, v59, v60);
LABEL_17:
    free(*((void **)v23 + 4));
LABEL_18:
    free(v23);
    return 0;
  }
  *((_QWORD *)v23 + 14) = a8;
  *((_DWORD *)v23 + 30) = a9;
  *((_QWORD *)v23 + 16) = a10;
  *((_DWORD *)v23 + 34) = a11;
  *((_DWORD *)v23 + 35) = a12;
  *((_DWORD *)v23 + 36) = a13;
  *((_DWORD *)v23 + 37) = 1;
  v28 = a14[1];
  *((_OWORD *)v23 + 10) = *a14;
  *((_OWORD *)v23 + 11) = v28;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100009AA4;
  handler[3] = &unk_10001C6E8;
  handler[4] = v23;
  dispatch_source_set_cancel_handler(v27, handler);
  dispatch_activate(*((dispatch_object_t *)v23 + 1));
  return v23;
}

uint64_t sub_1000090CC(uint64_t a1)
{
  int *v1;
  int v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int v7;
  int v8;
  int *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = 0;
  v3 = (int *)(a1 + 248);
  v2 = *(_DWORD *)(a1 + 248);
  v4 = -1;
  v5 = dword_1000218D8;
  while (1)
  {
    v7 = *v5;
    v5 += 2;
    v6 = v7;
    if (v7)
      v8 = -1;
    else
      v8 = (int)v1;
    if (v4 == -1)
      v4 = v8;
    if (v2 == v6)
      break;
    v1 = (int *)((char *)v1 + 1);
    if (v1 == (int *)512)
    {
      if (v4 == -1)
      {
        v22 = sub_1000094B4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_100015820(v22, v23, v24, v25, v26, v27, v28, v29);
        return 28;
      }
      v1 = &dword_1000218D8[2 * v4];
      *v1 = v2;
      v1[1] = 0;
      LODWORD(v1) = v4;
      break;
    }
  }
  v9 = &dword_1000218D8[2 * (int)v1];
  if (v9[1] <= 511)
  {
    for (i = 0; i != 512; ++i)
    {
      if (!xmmword_100020758[i])
      {
        v21 = 0;
        *(_DWORD *)(a1 + 192) = i;
        __dmb(0xBu);
        xmmword_100020758[i] = a1;
        ++v9[1];
        return v21;
      }
    }
    if ((_DWORD)v1 == v4)
      *v9 = 0;
    v13 = sub_1000094B4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000157B4(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v10 = sub_1000094B4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100015738(v3, v10, v11);
  }
  return 28;
}

uint64_t sub_100009208(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(result + 148);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

_QWORD *sub_100009220(int a1, uintptr_t a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12, int a13, _OWORD *a14)
{
  __int128 v14;
  _QWORD *result;
  _OWORD v16[2];

  v14 = a14[1];
  v16[0] = *a14;
  v16[1] = v14;
  result = sub_100008EB0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, v16);
  if (result)
  {
    result[24] = qword_100020260;
    qword_100020260 = (uint64_t)result;
    ++dword_100020268;
  }
  return result;
}

void sub_10000928C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  mach_port_name_t *v4;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  const void *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  int v23;
  _OWORD v25[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 5 || *(_DWORD *)(a1 + 4) != 160)
  {
    v3 = -304;
    goto LABEL_17;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(_BYTE *)(a1 + 51) != 1
    || *(_BYTE *)(a1 + 67) != 1
    || *(_BYTE *)(a1 + 83) != 1
    || *(_BYTE *)(a1 + 99) != 1
    || *(_DWORD *)(a1 + 120) != *(_DWORD *)(a1 + 52) >> 2
    || *(_DWORD *)(a1 + 68) != *(_DWORD *)(a1 + 124)
    || *(_DWORD *)(a1 + 132) != *(_DWORD *)(a1 + 84) >> 2
    || *(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 136))
  {
    v3 = -300;
    goto LABEL_17;
  }
  v2 = a1 + 160;
  if (*(_DWORD *)(a1 + 160) || *(_DWORD *)(a1 + 164) <= 0x1Fu)
  {
    v3 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  v4 = (mach_port_name_t *)(a2 + 28);
  *(_QWORD *)(a2 + 32) = 0x14000000000000;
  v6 = *(_DWORD *)(a1 + 12);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = *(_DWORD *)(a1 + 112);
  v9 = *(_DWORD *)(a1 + 116);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_DWORD *)(a1 + 52) >> 2;
  v12 = *(const void **)(a1 + 56);
  v13 = *(_DWORD *)(a1 + 68);
  v14 = *(_DWORD *)(a1 + 128);
  v15 = *(unsigned int **)(a1 + 72);
  v16 = *(_DWORD *)(a1 + 84) >> 2;
  v17 = *(_QWORD *)(a1 + 88);
  v18 = *(_DWORD *)(a1 + 100);
  v19 = *(_QWORD *)(a1 + 140);
  v20 = *(_DWORD *)(a1 + 148);
  v21 = *(_QWORD *)(a1 + 152);
  v22 = *(_OWORD *)(v2 + 36);
  v25[0] = *(_OWORD *)(v2 + 20);
  v25[1] = v22;
  v23 = sub_1000080F4(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v4, v25);
  mig_deallocate(*(_QWORD *)(a1 + 88), *(unsigned int *)(a1 + 100));
  *(_QWORD *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 100) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 84));
  *(_QWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  if (v23)
  {
    *(_DWORD *)(a2 + 32) = v23;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 40;
    *(_DWORD *)(a2 + 24) = 1;
  }
}

uint64_t sub_1000094B4()
{
  if (qword_100020238 != -1)
    dispatch_once(&qword_100020238, &stru_10001C6A8);
  return qword_100020240;
}

void sub_1000094F4(id a1)
{
  qword_100020240 = (uint64_t)os_log_create("com.apple.fsevents", "daemon");
}

void sub_100009520(uint64_t a1)
{
  NSObject *v1;
  int handle;
  int v3;
  int v4;
  NSObject *v5;

  v1 = *(NSObject **)(a1 + 32);
  handle = dispatch_source_get_handle(v1);
  v3 = dispatch_mig_server(v1, 4096, sub_100009594);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100013D34(handle, v4, v5);
  }
}

uint64_t sub_100009594(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  char *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  audit_token_t atoken;
  pid_t pidp;

  if (a1->msgh_id != 70)
    return sub_100013C30(a1, (uint64_t)a2);
  v4 = (char *)a1 + ((a1->msgh_size + 3) & 0x1FFFFFFFCLL);
  pidp = 0;
  mig_reply_setup(a1, a2);
  a2[1].msgh_remote_port = -305;
  if (!*(_DWORD *)v4 && *((_DWORD *)v4 + 1) >= 0x34u)
  {
    v5 = *(_OWORD *)(v4 + 36);
    *(_OWORD *)atoken.val = *(_OWORD *)(v4 + 20);
    *(_OWORD *)&atoken.val[4] = v5;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    if (!pidp)
    {
      v6 = sub_100009A7C(a1->msgh_local_port);
      if (v6)
      {
        v7 = v6;
        sub_100011B24(v6);
        sub_100009CBC(v7);
      }
    }
  }
  return 1;
}

void start(int a1, uint64_t a2)
{
  int v2;
  const char *v3;
  kern_return_t v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  kern_return_t v11;
  NSObject *v12;
  pthread_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  kern_return_t v19;

  v2 = 3;
  if (a1 == 2)
  {
    if (!strcmp("-d", *(const char **)(a2 + 8)))
      v2 = 35;
    else
      v2 = 3;
  }
  v3 = getprogname();
  openlog(v3, v2, 24);
  v4 = bootstrap_check_in(bootstrap_port, "com.apple.FSEvents", (mach_port_t *)&dword_100020250);
  if (v4)
  {
    v11 = v4;
    v12 = sub_1000094B4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    v15 = "main";
    v16 = 2080;
    v17 = bootstrap_strerror(v11);
    v18 = 1024;
    v19 = v11;
    v8 = "%s: ERROR: bootstrap_check_in() => %s (%d)";
    v9 = v12;
    v10 = 28;
  }
  else
  {
    qword_100020248 = (uint64_t)dispatch_queue_create("com.apple.fseventsd.mach_channel_queue", 0);
    qword_100020258 = dispatch_mach_create_f("com.apple.fseventsd.f2d.channel", qword_100020248, 0, sub_100008898);
    dispatch_set_qos_class_fallback();
    dispatch_mach_connect(qword_100020258, dword_100020250, 0, 0);
    v13 = 0;
    v5 = pthread_create(&v13, 0, (void *(__cdecl *)(void *))sub_100011AE4, 0);
    if (!v5)
      dispatch_main();
    v6 = v5;
    v7 = sub_1000094B4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      closelog();
      exit(1);
    }
    *(_DWORD *)buf = 136315394;
    v15 = "main";
    v16 = 1024;
    LODWORD(v17) = v6;
    v8 = "%s: ERROR: pthread_create() => %d";
    v9 = v7;
    v10 = 18;
  }
  _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
  goto LABEL_12;
}

uint64_t sub_100009850(int a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v3 = sub_100009A7C(a1);
  if (v3)
  {
    v4 = v3;
    nullsub_1();
    sub_100011BE8(v4, a2);
  }
  else
  {
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000143E4();
  }
  return 0;
}

uint64_t sub_1000098C0(uint64_t a1, _QWORD *a2)
{
  sub_10001101C(a2);
  return 0;
}

uint64_t sub_1000098DC(uint64_t a1, int a2, char *a3)
{
  sub_100010F24(a2, a3);
  return 0;
}

uint64_t sub_1000098FC(uint64_t a1, int a2, unint64_t a3, uint64_t *a4)
{
  sub_100011058(a2, a3, a4);
  return 0;
}

uint64_t sub_100009920(uint64_t a1, int a2, unint64_t a3, int *a4, int a5)
{
  uint64_t v6;
  int v7;

  if (a5)
  {
    v6 = 5;
    v7 = 13;
  }
  else
  {
    v7 = sub_10001128C(a2, a3);
    v6 = 0;
  }
  *a4 = v7;
  return v6;
}

uint64_t sub_100009964(int a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;

  v1 = sub_100009A7C(a1);
  if (v1)
  {
    v2 = v1;
    nullsub_1();
    sub_100011B24(v2);
    sub_100009CBC(v2);
  }
  else
  {
    v3 = sub_1000094B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100014450();
  }
  return 0;
}

void sub_1000099CC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void sub_100009A04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100009A48(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100009A5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100009A7C(int a1)
{
  uint64_t result;

  for (result = qword_100020260; result; result = *(_QWORD *)(result + 192))
  {
    if (*(_DWORD *)(result + 4) == a1)
      break;
  }
  return result;
}

void sub_100009AA4(uint64_t a1)
{
  void **v1;
  kern_return_t v2;
  mach_error_t v3;
  NSObject *v4;

  v1 = (void **)(a1 + 32);
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  *((_QWORD *)*v1 + 1) = 0;
  v2 = mach_port_mod_refs(mach_task_self_, *((_DWORD *)*v1 + 1), 1u, -1);
  if (v2)
  {
    v3 = v2;
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10001467C((int)v1, v3);
  }
  free(*v1);
}

void sub_100009B34(uint64_t a1)
{
  unsigned int *v2;
  int v3;
  uint64_t i;
  kern_return_t v5;
  mach_error_t v6;
  NSObject *v7;
  NSObject *v8;

  v2 = (unsigned int *)(a1 + 148);
  do
    v3 = __ldxr(v2);
  while (__stxr(v3 - 1, v2));
  if (v3 <= 0)
  {
    v8 = sub_1000094B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100014708(a1, (int *)v2, v8);
  }
  else if (v3 == 1)
  {
    *(_DWORD *)(a1 + 20) = 0;
    free(*(void **)(a1 + 24));
    *(_QWORD *)(a1 + 24) = 0;
    free(*(void **)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
    for (i = 48; i != 112; i += 8)
    {
      free(*(void **)(a1 + i));
      *(_QWORD *)(a1 + i) = 0;
    }
    if (*(_DWORD *)a1)
    {
      v5 = mach_port_deallocate(mach_task_self_, *(_DWORD *)a1);
      if (v5)
      {
        v6 = v5;
        v7 = sub_1000094B4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_100014798(a1, v6);
      }
    }
    *(_DWORD *)a1 = 0;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
  }
}

void sub_100009C34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = qword_100020260;
  if (qword_100020260 == a1)
  {
    qword_100020260 = *(_QWORD *)(a1 + 192);
    goto LABEL_13;
  }
  if (qword_100020260)
  {
    do
    {
      v2 = v1;
      v1 = *(_QWORD *)(v1 + 192);
    }
    while (v1 != a1 && v1 != 0);
    if (v1)
    {
      *(_QWORD *)(v2 + 192) = *(_QWORD *)(v1 + 192);
LABEL_13:
      --dword_100020268;
      return;
    }
  }
  v4 = sub_1000094B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100014820(v4, v5, v6, v7, v8, v9, v10, v11);
}

void sub_100009CBC(uint64_t a1)
{
  sub_100009C34(a1);
  sub_100009B34(a1);
}

void sub_100009D08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void sub_100009D14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t sub_100009D38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;

  v2 = pthread_rwlock_init((pthread_rwlock_t *)(a1 + 8), 0);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100014B1C(v3, v4);
  }
  else
  {
    v3 = pthread_key_create((pthread_key_t *)a1, (void (__cdecl *)(void *))&_free);
    if ((_DWORD)v3)
    {
      v5 = sub_1000094B4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_100014A98(v3, v5);
    }
  }
  return v3;
}

uint64_t sub_100009DCC(uint64_t a1)
{
  int *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;

  v2 = (int *)sub_100007664((pthread_key_t *)a1);
  if (!v2)
    return pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
  v3 = *v2;
  if (*v2 >= 1)
    sub_100014CFC();
  --*v2;
  if (v3 < 0)
    return 0;
  v4 = pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
  if ((_DWORD)v4)
  {
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100014D24(v4);
  }
  return v4;
}

uint64_t sub_100009E68(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  int *v17;

  if (!a1)
  {
    v10 = dword_100020048;
    if ((dword_100020048 & 0x80000000) == 0)
    {
      dword_100020048 = -1;
      return close(v10);
    }
    return 0;
  }
  v7 = open("/dev/fsevents", 0);
  v8 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    v15 = a3;
    v16 = a4;
    v17 = &dword_100020048;
    v14 = a2;
    v9 = ioctl(v7, 0x80187301uLL, &v14);
    if ((v9 & 0x80000000) != 0)
    {
      v12 = v9;
      v13 = sub_1000094B4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100014DA0(v13);
      close(v8);
      return v12;
    }
    close(v8);
    return 0;
  }
  return v8;
}

uint64_t sub_100009F54(uint64_t (*a1)(void))
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  NSObject *v18;

  sub_1000075A8((uint64_t)&unk_100021758);
  if (qword_1000206E8)
  {
    v2 = malloc_type_calloc(*(int *)(qword_1000206E8 + 8), 8uLL, 0x2004093837F09uLL);
    if (v2)
    {
      v3 = v2;
      memcpy(v2, *(const void **)qword_1000206E8, 8 * *(int *)(qword_1000206E8 + 8));
      v4 = *(_DWORD *)(qword_1000206E8 + 8);
      if (v4 <= 0)
      {
        sub_100007528((uint64_t)&unk_100021758);
        v14 = 0;
      }
      else
      {
        v5 = (v4 - 1);
        v6 = v5;
        do
        {
          v7 = v3[v6];
          if ((*(_DWORD *)(v7 + 32) & 0x50) != 0)
          {
            v3[v6] = 0;
          }
          else
          {
            v8 = (unsigned int *)(v7 + 36);
            do
              v9 = __ldxr(v8);
            while (__stxr(v9 + 1, v8));
          }
          v10 = v6-- <= 0;
        }
        while (!v10);
        sub_100007528((uint64_t)&unk_100021758);
        v11 = v5;
        while (1)
        {
          v12 = v3[v11];
          if (v12)
          {
            if ((*(_DWORD *)(v12 + 32) & 0x50) == 0)
            {
              v13 = a1();
              if ((_DWORD)v13)
                break;
            }
          }
          v10 = v11-- <= 0;
          if (v10)
          {
            v14 = 0;
            goto LABEL_18;
          }
        }
        v14 = v13;
        do
        {
LABEL_18:
          v15 = v3[v5];
          if (v15)
          {
            v16 = (unsigned int *)(v15 + 36);
            do
              v17 = __ldxr(v16);
            while (__stxr(v17 - 1, v16));
          }
          v10 = v5-- <= 0;
        }
        while (!v10);
      }
      free(v3);
    }
    else
    {
      v18 = sub_1000094B4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100014E14();
      sub_100007528((uint64_t)&unk_100021758);
      return 12;
    }
  }
  else
  {
    sub_100007528((uint64_t)&unk_100021758);
    return 0;
  }
  return v14;
}

void sub_10000A120(const char *a1, char *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[2];
  int v15;

  v12 = xmmword_1000191F4;
  v13 = 0;
  v14[0] = 0;
  v14[1] = 0;
  v15 = 0;
  if (a1 && a2)
  {
    if (getattrlist(a1, &v12, v14, 0x14uLL, 0))
    {
      v3 = sub_1000094B4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        sub_100014F20();
    }
    else
    {
      uuid_unparse((const unsigned __int8 *)v14 + 4, a2);
    }
  }
  else
  {
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100014EB0(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

uint64_t sub_10000A1FC(uint32_t *a1)
{
  uint32_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint32_t v11;
  int v12;
  uint64_t v13;
  statfs v14;

  v1 = *a1;
  v11 = *a1;
  if ((a1[8] & 0x400) != 0)
  {
    v13 = 0;
    if (dword_1000206C8)
    {
LABEL_27:
      v14.f_bsize = v1;
      ioctl(dword_100020048, 0x80047368uLL, &v14);
      return 0;
    }
    memset(&v14, 0, 512);
    if (qword_100020748)
    {
      v2 = *(_QWORD *)(qword_100020748 + 16);
      if (v2)
        sub_100007D3C(v2);
    }
    v12 = 0;
    sub_1000075A8((uint64_t)&unk_100021758);
    if (sub_100011D84(&v11, &v13))
    {
LABEL_26:
      sub_100007528((uint64_t)&unk_100021758);
      goto LABEL_27;
    }
    v3 = v13;
    if (v13)
    {
      if (statfs(*(const char **)(v13 + 8), &v14))
      {
        v4 = sub_1000094B4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          sub_100014FA0();
      }
      else
      {
        if (sub_10000AA98((uint64_t)&v14, &v12))
          goto LABEL_17;
        if (v12 == 2)
        {
          v5 = *(_DWORD *)(v3 + 32) | 0x9040;
        }
        else
        {
          if (v12 != 1)
            goto LABEL_17;
          v5 = *(_DWORD *)(v3 + 32) | 0x1000;
        }
        *(_DWORD *)(v3 + 32) = v5;
      }
    }
LABEL_17:
    if ((*(_DWORD *)(v3 + 32) & 1) == 0)
    {
      *(_DWORD *)(v3 + 32) &= ~4u;
      *(_DWORD *)(v3 + 32) |= 0x80u;
      *(_DWORD *)(v3 + 32) &= ~0x400u;
      v6 = (unsigned int *)(v3 + 36);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      sub_100007528((uint64_t)&unk_100021758);
      if (qword_100020748)
      {
        v8 = *(_QWORD *)(qword_100020748 + 16);
        if (v8)
          sub_100007D3C(v8);
      }
      sub_10000BE1C(*(_DWORD *)v3, 1);
      usleep(0xC350u);
      do
        v9 = __ldxr(v6);
      while (__stxr(v9 - 1, v6));
      sub_10000EF9C(v3);
      *(_QWORD *)(v3 + 40) = time(0);
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  return 0;
}

uint64_t sub_10000A440()
{
  malloc_zone_t *zone;
  int v1;
  unsigned int v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  char *v11;
  char *v12;
  int v13;
  char *v14;
  NSObject *v15;
  char *v16;
  int v17;
  int v18;
  _DWORD *v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  _DWORD *v36;
  int v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  int v44;
  char __s1[1024];

  zone = malloc_create_zone(0x10000uLL, 0);
  qword_1000206B8 = (uint64_t)zone;
  if (zone)
    malloc_set_zone_name(zone, "DiskLoggerBufferZone");
  v38 = 0;
  v1 = sub_10000A8D0(&v38);
  if (v1 < 1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  sub_100009D38((uint64_t)&unk_100021758);
  v3 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  if (!v3)
  {
    free(v38);
    return 12;
  }
  v4 = v3;
  v5 = malloc_type_calloc(v2, 8uLL, 0x2004093837F09uLL);
  if (!v5)
  {
    free(v4);
    v30 = v38;
    goto LABEL_41;
  }
  v6 = v5;
  v36 = v4;
  v7 = 0;
  while (1)
  {
    v37 = 0;
    v8 = malloc_type_calloc(0x88uLL, 1uLL, 0xB1905879uLL);
    v6[v7] = v8;
    if (!v8)
      break;
    v9 = v8;
    v10 = v38;
    v11 = (char *)v38 + 2168 * v7;
    v13 = *((_DWORD *)v11 + 12);
    v12 = v11 + 48;
    *v8 = v13;
    v14 = strdup(v12 + 40);
    *((_QWORD *)v9 + 1) = v14;
    if (sub_10000A96C(v12 + 40, __s1))
    {
      *(_QWORD *)(v6[v7] + 16) = strdup(__s1);
      v14 = *(char **)(v6[v7] + 16);
    }
    else
    {
      v15 = sub_1000094B4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_DWORD *)v6[v7];
        *(_DWORD *)buf = 136315650;
        v40 = "init_dev_info";
        v41 = 2080;
        v42 = v12 + 40;
        v43 = 1024;
        v44 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Could not resolve nofirmlink  path, fallback to mount_point[%s] dev[%d]\n", buf, 0x1Cu);
      }
      *(_QWORD *)(v6[v7] + 16) = strdup(v12 + 40);
    }
    v16 = v14;
    do
    {
      while (1)
      {
        v18 = *v16++;
        v17 = v18;
        if (v18 != 47)
          break;
        ++*(_DWORD *)(v6[v7] + 24);
      }
    }
    while (v17);
    v19 = (_DWORD *)v6[v7];
    if (v14[1])
      ++v19[6];
    v20 = v10[542 * v7 + 16];
    v19[7] = v20;
    v19[8] = 4;
    if ((v20 & 0x4000) != 0)
    {
      v19[8] |= 1u;
      dword_1000206F0 = *(_DWORD *)v12;
    }
    v37 = 0;
    if (sub_10000AA98((uint64_t)&v10[542 * v7], &v37))
      v21 = 256;
    else
      v21 = 64;
    *(_DWORD *)(v6[v7] + 32) |= v21;
    if (v37 == 2)
    {
      v24 = sub_1000094B4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v28 = v6[v7];
        v29 = *(char **)(v28 + 8);
        LODWORD(v28) = *(_DWORD *)v28;
        *(_DWORD *)buf = 136315650;
        v40 = "init_dev_info";
        v41 = 2080;
        v42 = v29;
        v43 = 1024;
        v44 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: mount_point(%s) dev(%d) will be completely ignored", buf, 0x1Cu);
      }
      v23 = 32832;
      goto LABEL_33;
    }
    if (v37 == 1)
    {
      v22 = sub_1000094B4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = v6[v7];
        v27 = *(char **)(v26 + 8);
        LODWORD(v26) = *(_DWORD *)v26;
        *(_DWORD *)buf = 136315650;
        v40 = "init_dev_info";
        v41 = 2080;
        v42 = v27;
        v43 = 1024;
        v44 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Logging disabled (no_log) completely for device: mount_point(%s) dev(%d)", buf, 0x1Cu);
      }
      v23 = 4096;
LABEL_33:
      *(_DWORD *)(v6[v7] + 32) |= v23;
    }
    if (++v7 == v2)
    {
      v34 = (uint64_t)v36;
      *(_QWORD *)v36 = v6;
      v36[2] = v2;
      __dmb(0xBu);
      qword_1000206E8 = v34;
      sub_100009F54((uint64_t (*)(void))sub_10000AC78);
      pthread_create((pthread_t *)&qword_100020280, 0, (void *(__cdecl *)(void *))sub_10000B7D4, 0);
      free(v38);
      return 0;
    }
  }
  v31 = sub_1000094B4();
  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
  v33 = v38;
  if (v32)
    sub_100015010();
  free(v6);
  free(v36);
  v30 = v33;
LABEL_41:
  free(v30);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000A8D0(_QWORD *a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t result;
  void *v6;

  v2 = 1000;
  while (1)
  {
    v3 = getfsstat(0, 0, 2);
    if (v3 < 0)
      return 0;
    v4 = 2168 * v3 + 2168;
    result = (uint64_t)malloc_type_malloc(v4, 0x789CADBuLL);
    if (!result)
      return result;
    v6 = (void *)result;
    result = getfsstat((statfs *)result, v4, 2);
    if ((result & 0x80000000) == 0)
      goto LABEL_7;
    free(v6);
    if (!--v2)
    {
      v6 = 0;
      result = 0xFFFFFFFFLL;
LABEL_7:
      *a1 = v6;
      return result;
    }
  }
}

char *sub_10000A96C(const char *a1, char *a2)
{
  NSObject *v3;
  __int128 v5;
  int v6;
  int v7;
  _OWORD v8[66];

  v5 = xmmword_10001920C;
  memset(v8, 0, 512);
  v6 = 0;
  v7 = 32;
  DWORD1(v5) = 0x80000000;
  if (getattrlist(a1, &v5, v8, 0x420uLL, 0x20u) == -1)
  {
    v3 = sub_1000094B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100015088();
    return 0;
  }
  else if (a2)
  {
    strlcpy(a2, (const char *)&v8[1] + SDWORD2(v8[1]) + 8, 0x400uLL);
  }
  else
  {
    return (char *)&v8[1] + SDWORD2(v8[1]) + 8;
  }
  return a2;
}

uint64_t sub_10000AA98(uint64_t a1, int *a2)
{
  int v4;
  uint64_t result;
  int v6;
  char *v7;
  stat v8;
  __int16 v9;
  char __str[1024];

  if (a2)
    *a2 = 0;
  if ((*(_BYTE *)(a1 + 65) & 0x40) != 0)
    return 1;
  memset(&v8, 0, sizeof(v8));
  snprintf(__str, 0x400uLL, "%s/.fseventsd/no_log", (const char *)(a1 + 88));
  if ((*(_BYTE *)(a1 + 65) & 0x10) != 0 && !lstat(__str, &v8))
  {
    if (!a2)
      return 0;
    result = 0;
    v6 = 1;
    goto LABEL_19;
  }
  snprintf(__str, 0x400uLL, "%s/.fseventsd/ignore", (const char *)(a1 + 88));
  v4 = *(_DWORD *)(a1 + 64);
  if ((v4 & 0x1000) == 0)
    goto LABEL_9;
  if (!lstat(__str, &v8))
  {
    if (!a2)
      return 0;
    result = 0;
    v6 = 2;
LABEL_19:
    *a2 = v6;
    return result;
  }
  v4 = *(_DWORD *)(a1 + 64);
LABEL_9:
  if ((v4 & 0x21) != 0)
    return 0;
  if (strcmp((const char *)(a1 + 72), "apfs"))
  {
    if ((v4 & 0x100000) == 0)
      goto LABEL_13;
LABEL_23:
    v7 = strstr((char *)(a1 + 88), "/Users/");
    result = 0;
    if ((v4 & 0x1000) == 0 || !v7)
      return result;
    goto LABEL_25;
  }
  v9 = 0;
  if (!APFSVolumeRole(a1 + 1112, &v9, 0) && v9 == 576)
    return 1;
  v4 = *(_DWORD *)(a1 + 64);
  if ((v4 & 0x100000) != 0)
    goto LABEL_23;
LABEL_13:
  if ((v4 & 0x1000) == 0)
    return 0;
LABEL_25:
  result = strcmp((const char *)(a1 + 88), "/dev");
  if ((_DWORD)result)
  {
    result = strcmp((const char *)(a1 + 72), "acfs");
    if ((_DWORD)result)
      return (v4 & 0x200) == 0 && strcmp((const char *)(a1 + 88), "/private/var/wireless/baseband_data");
  }
  return result;
}

uint64_t sub_10000AC78(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _DWORD *v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  int v10;
  int v11;
  NSObject *v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  int *v32;
  void **v33;
  NSObject *v34;
  size_t v35;
  uint64_t v36;
  __darwin_time_t v37;
  __darwin_time_t tv_sec;
  uint64_t v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  int v52;
  stat v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  statfs buf;
  char __s1[1024];
  statfs v59;

  v55 = 0;
  v56 = 0;
  v54 = 0;
  memset(&v59, 0, 512);
  v2 = *(_QWORD *)(a1 + 128);
  if (v2 && v2 != qword_100020748)
  {
    v3 = sub_1000094B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000153FC();
    return 0;
  }
  v4 = (_DWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 32) & 0x100) == 0 || (*v4 & 0x1000) != 0 && (*v4 & 1) == 0)
  {
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100015108();
    return 0;
  }
  v6 = (char *)malloc_type_calloc(0x9F8uLL, 1uLL, 0x3A070EA9uLL);
  if (!v6)
    return 0;
  v7 = (uint64_t)v6;
  *((_QWORD *)v6 + 3) = 0x100002000;
  pthread_rwlock_init((pthread_rwlock_t *)(v6 + 48), 0);
  v8 = *(_BYTE **)(a1 + 8);
  if (*v8 == 47 && v8[1])
    snprintf((char *)(v7 + 256), 0x400uLL, "%s/.fseventsd", *(const char **)(a1 + 8));
  else
    __strlcpy_chk(v7 + 256, "/.fseventsd", 1024, 1024);
  v9 = 1;
  while (1)
  {
    v10 = open((const char *)(v7 + 256), 0x20000000);
    if (v10 < 0)
    {
      v12 = sub_1000094B4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 8);
        v16 = *(_DWORD *)a1;
        buf.f_bsize = 136315906;
        *(_QWORD *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v15;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <2> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
      }
      memset(&v53, 0, sizeof(v53));
    }
    else
    {
      v11 = v10;
      if (fstatfs(v10, &v59)
        || v59.f_fsid.val[0] != *(_DWORD *)a1
        || v59.f_fsid.val[0] == dword_1000206F0 && (*v4 & 1) == 0)
      {
        v17 = sub_1000094B4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 8);
          v19 = *(_DWORD *)a1;
          buf.f_bsize = 136315906;
          *(_QWORD *)&buf.f_iosize = "create_dls_callback";
          WORD2(buf.f_blocks) = 2080;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
          HIWORD(buf.f_bfree) = 2080;
          buf.f_bavail = v18;
          LOWORD(buf.f_files) = 1024;
          *(_DWORD *)((char *)&buf.f_files + 2) = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <1> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
        }
LABEL_59:
        close(v11);
LABEL_60:
        free((void *)v7);
        return 0;
      }
      memset(&v53, 0, sizeof(v53));
      if (fstat(v11, &v53) || (v53.st_mode & 0xF000) == 0x4000)
        goto LABEL_54;
      close(v11);
    }
    v13 = *(unsigned __int8 **)(a1 + 8);
    v14 = *v13;
    if ((v9 & 1) == 0)
      break;
    if (v14 == 47 && !v13[1])
    {
      __strlcpy_chk(v7 + 256, "/private/var/db/fseventsd", 1024, 1024);
      v9 = 0;
      if ((*(_WORD *)(a1 + 28) & 0x4001) != 0)
        goto LABEL_39;
    }
    else
    {
      snprintf((char *)(v7 + 256), 0x400uLL, "%s%s", *(const char **)(a1 + 8), "/private/var/db/fseventsd");
      v9 = 0;
    }
  }
  if (v14 == 47 && v13[1])
    snprintf((char *)(v7 + 256), 0x400uLL, "%s/.fseventsd", *(const char **)(a1 + 8));
  else
    __strlcpy_chk(v7 + 256, "/.fseventsd", 1024, 1024);
LABEL_39:
  unlink((const char *)(v7 + 256));
  if (mkdir((const char *)(v7 + 256), 0x1C0u) && ((*v4 & 1) == 0 || *__error() != 30))
  {
    v20 = sub_1000094B4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100015364();
  }
  v21 = open((const char *)(v7 + 256), 0x20000000);
  if (v21 < 0)
  {
    v28 = sub_1000094B4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v39 = *(_QWORD *)(a1 + 8);
      v40 = *(_DWORD *)a1;
      buf.f_bsize = 136315906;
      *(_QWORD *)&buf.f_iosize = "create_dls_callback";
      WORD2(buf.f_blocks) = 2080;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
      HIWORD(buf.f_bfree) = 2080;
      buf.f_bavail = v39;
      LOWORD(buf.f_files) = 1024;
      *(_DWORD *)((char *)&buf.f_files + 2) = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <3> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
    }
    if ((*v4 & 1) == 0)
    {
      v29 = sub_1000094B4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = *(_QWORD *)(a1 + 8);
        v31 = *(_DWORD *)a1;
        buf.f_bsize = 136315906;
        *(_QWORD *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v30;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <4> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
      }
      goto LABEL_60;
    }
    strcpy((char *)(v7 + 256), "/tmp");
    v11 = open((const char *)(v7 + 256), 0);
  }
  else
  {
    v11 = v21;
    if ((*v4 & 1) != 0 || (*(_BYTE *)(a1 + 28) & 1) != 0)
    {
      v25 = sub_1000094B4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 8);
        v27 = *(_DWORD *)a1;
        buf.f_bsize = 136315906;
        *(_QWORD *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v26;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: Use fallback log directory for read only root fs [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      if (fstatfs(v21, &v59)
        || v59.f_fsid.val[0] != *(_DWORD *)a1
        || v59.f_fsid.val[0] == dword_1000206F0 && (*v4 & 1) == 0)
      {
        v22 = sub_1000094B4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v51 = *(_QWORD *)(a1 + 8);
          v52 = *(_DWORD *)a1;
          buf.f_bsize = 136315906;
          *(_QWORD *)&buf.f_iosize = "create_dls_callback";
          WORD2(buf.f_blocks) = 2080;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
          HIWORD(buf.f_bfree) = 2080;
          buf.f_bavail = v51;
          LOWORD(buf.f_files) = 1024;
          *(_DWORD *)((char *)&buf.f_files + 2) = v52;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <5> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
        }
        close(v11);
        rmdir((const char *)(v7 + 256));
        goto LABEL_60;
      }
LABEL_54:
      __s1[0] = 0;
      fstatfs(v11, &v59);
      fcntl(v11, 50, __s1);
      if (v59.f_fsid.val[0] != *(_DWORD *)a1 || strcmp(__s1, (const char *)(v7 + 256)))
      {
        v23 = sub_1000094B4();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_1000152F4((uint64_t)__s1, v7 + 256);
        unlink((const char *)(v7 + 256));
        goto LABEL_59;
      }
    }
  }
  v32 = (int *)(v7 + 32);
  v33 = (void **)(v7 + 40);
  if (sub_10000DB58(v11, (_DWORD *)(v7 + 32), (_DWORD *)(v7 + 36), (_QWORD *)(v7 + 40), (unsigned int (*)(char *))sub_10000DD1C, &v55, &v54))
  {
    v34 = sub_1000094B4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100015294();
    goto LABEL_60;
  }
  *(_DWORD *)(v7 + 248) = 65537;
  sub_10000DD80(v7 + 2304);
  v35 = *(unsigned int *)(v7 + 32);
  if ((int)v35 < 2)
    goto LABEL_90;
  qsort(*v33, v35, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000DE08);
  if (!((v54 - v55) >> 31))
    goto LABEL_90;
  if (*v32 < 1)
  {
    LODWORD(v36) = 0;
  }
  else
  {
    v36 = 0;
    v37 = 0;
    while (1)
    {
      snprintf(__s1, 0x400uLL, "%s/%.16llx", (const char *)(v7 + 256), *((_QWORD *)*v33 + v36));
      if (lstat(__s1, &v53))
        break;
      if (v53.st_size)
      {
        tv_sec = v53.st_ctimespec.tv_sec;
        if (v53.st_ctimespec.tv_sec < v37)
        {
          v42 = sub_1000094B4();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            buf.f_bsize = 134218498;
            *(_QWORD *)&buf.f_iosize = v53.st_ctimespec.tv_sec;
            WORD2(buf.f_blocks) = 2048;
            *(uint64_t *)((char *)&buf.f_blocks + 6) = v37;
            HIWORD(buf.f_bfree) = 2080;
            buf.f_bavail = v7 + 256;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Log files out of order (%ld < %ld) in %s.", (uint8_t *)&buf, 0x20u);
          }
          goto LABEL_89;
        }
      }
      else
      {
        tv_sec = v37;
      }
      ++v36;
      v37 = tv_sec;
      if (v36 >= *v32)
        goto LABEL_89;
    }
    v41 = sub_1000094B4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_100015234();
  }
LABEL_89:
  if ((_DWORD)v36 != *v32)
  {
    v50 = sub_1000094B4();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_1000151D4();
    v43 = 0;
  }
  else
  {
LABEL_90:
    v43 = 1;
  }
  if ((*v4 & 0x2000) == 0)
    sub_10000D2C8(a1, v7);
  v44 = *v32;
  if ((int)v44 >= 1)
  {
    v45 = v44 + 1;
    while (sub_10000DE20(v7, *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8 * (v45 - 2)), &v56))
    {
      memset(&buf, 0, 512);
      if (!statfs(*(const char **)(a1 + 8), &buf) && buf.f_fsid.val[0] == *(_DWORD *)a1 && (unint64_t)--v45 > 1)
        continue;
      goto LABEL_103;
    }
    if (v56 > qword_1000206D0[dword_1000206E0])
    {
      qword_1000206D0[dword_1000206E0 ^ 1] = v56;
      do
        v46 = __ldaxr((unsigned int *)&dword_1000206E0);
      while (__stlxr(v46 ^ 1, (unsigned int *)&dword_1000206E0));
    }
  }
LABEL_103:
  *(_QWORD *)(v7 + 8) = 0;
  if (sub_10000E6D4(a1, v7))
  {
    if ((*v4 & 1) == 0 || strcmp((const char *)(v7 + 256), "/tmp"))
    {
      v47 = sub_1000094B4();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        sub_100015174();
    }
    goto LABEL_109;
  }
  if ((v43 & 1) == 0)
  {
LABEL_109:
    sub_10000D7B4(v7, 1);
    sub_10000D9AC(a1, v7);
  }
  *(_QWORD *)(a1 + 128) = v7;
  if ((*(_DWORD *)(a1 + 32) & 1) != 0)
  {
    qword_100020748 = v7;
    v48 = v7;
  }
  else
  {
    v48 = qword_100020748;
    if (!qword_100020748)
      return 0;
  }
  v49 = *(_QWORD *)(v48 + 16);
  if (v49)
    *(_QWORD *)(v7 + 16) = v49;
  return 0;
}

uint64_t sub_10000B7D4()
{
  CFFileDescriptorNativeDescriptor v0;
  NSObject *v1;
  __CFFileDescriptor *v2;
  __CFFileDescriptor *v3;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  pthread_setname_np("com.apple.fseventsd.volume");
  qword_1000206F8 = (uint64_t)CFRunLoopGetCurrent();
  setiopolicy_np(0, 1, 2);
  v0 = sub_100011E7C();
  if (v0 < 0)
  {
    v1 = sub_1000094B4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      sub_100015540();
  }
  v2 = CFFileDescriptorCreate(0, v0, 1u, (CFFileDescriptorCallBack)sub_100011EF0, 0);
  if (v2)
  {
    v3 = v2;
    RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v2, 0);
    if (RunLoopSource)
    {
      v5 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000206F8, RunLoopSource, kCFRunLoopDefaultMode);
      CFRelease(v5);
      CFFileDescriptorEnableCallBacks(v3, 1uLL);
    }
    else
    {
      v14 = sub_1000094B4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000154D0(v14, v15, v16, v17, v18, v19, v20, v21);
      CFFileDescriptorInvalidate(v3);
      CFRelease(v3);
    }
  }
  else
  {
    v6 = sub_1000094B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100015460(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  CFRunLoopRun();
  return 0;
}

uint64_t sub_10000B90C()
{
  if (qword_1000206F8)
    CFRunLoopStop((CFRunLoopRef)qword_1000206F8);
  return pthread_join((pthread_t)qword_100020280, 0);
}

uint64_t sub_10000B93C(_BYTE *a1, int a2)
{
  unsigned int v2;
  int v3;
  int v4;
  unsigned __int8 *v5;
  int v6;

  if (a2)
  {
    v2 = 0;
    do
    {
      v3 = *a1++;
      v2 = dword_100020298[v3 ^ HIBYTE(v2)] ^ (v2 << 8);
      --a2;
    }
    while (a2);
  }
  else
  {
    v4 = *a1;
    if (*a1)
    {
      v2 = 0;
      v5 = a1 + 1;
      do
      {
        v2 = dword_100020298[v4 ^ HIBYTE(v2)] ^ (v2 << 8);
        v6 = *v5++;
        v4 = v6;
      }
      while (v6);
    }
    else
    {
      v2 = 0;
    }
  }
  if (v2 <= 1)
    return 1;
  else
    return v2;
}

uint64_t sub_10000B9A8(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void **v30;
  unsigned int v31;
  uint64_t v32;
  __int128 v33;
  uint8_t buf[4];
  _QWORD v35[2];

  if (qword_100020708)
  {
    v2 = (int *)malloc_type_malloc(0x10uLL, 0x1080040FC6463CFuLL);
    if (v2)
    {
      v3 = (uint64_t)v2;
      *(_OWORD *)v2 = *(_OWORD *)qword_100020708;
      v4 = malloc_type_malloc(8 * v2[3], 0x2004093837F09uLL);
      if (v4)
      {
        v5 = v4;
        pthread_mutex_lock(&stru_100020180);
        memcpy(v5, *(const void **)v3, 8 * *(int *)(v3 + 12));
        *(_QWORD *)v3 = v5;
        if (*(int *)(a1 + 128) >= 1)
        {
          v6 = 0;
          v7 = 0;
          while (1)
          {
            v8 = *(unsigned int *)(v3 + 8);
            if ((int)v8 < 1)
            {
              LODWORD(v9) = 0;
              goto LABEL_31;
            }
            v9 = 0;
            v10 = *(_DWORD *)(a1 + 112);
            v11 = *(_QWORD **)v3;
            while (1)
            {
              v12 = v11[v9];
              if ((!v10 || v10 == *(_DWORD *)(v12 + 8))
                && !strcmp(*(const char **)(*(_QWORD *)(a1 + 136) + 8 * v6), *(const char **)v12))
              {
                v13 = *(_QWORD **)(v12 + 24);
                if (v13)
                  break;
              }
LABEL_16:
              if (++v9 == v8)
              {
                LODWORD(v9) = v8;
                goto LABEL_31;
              }
            }
            v14 = 0;
            while (1)
            {
              v15 = v13;
              if (*v13 == a1 && v13 == (_QWORD *)(*(_QWORD *)(a1 + 200) + 16 * v6))
                break;
              v13 = (_QWORD *)v13[1];
              v14 = v15;
              if (!v13)
                goto LABEL_16;
            }
            v16 = v13[1];
            if (v14)
            {
              v14[1] = v16;
            }
            else
            {
              *(_QWORD *)(v12 + 24) = v16;
              v11 = *(_QWORD **)v3;
            }
            v15[1] = 0;
            v17 = (char *)&v11[v9];
            v18 = *(_QWORD *)v17;
            v19 = *(_QWORD *)(*(_QWORD *)v17 + 24);
            v20 = *(_DWORD *)(*(_QWORD *)v17 + 16) - 1;
            *(_DWORD *)(*(_QWORD *)v17 + 16) = v20;
            if (v20)
              break;
            if (v19)
            {
              v25 = sub_1000094B4();
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                goto LABEL_31;
              v26 = *(_QWORD *)(*(_QWORD *)v3 + 8 * v9);
              *(_DWORD *)buf = 67109376;
              LODWORD(v35[0]) = v9;
              WORD2(v35[0]) = 2048;
              *(_QWORD *)((char *)v35 + 6) = v26;
              v23 = v25;
              v24 = "remove_paths: prefix_table inconsistent.  refcount == 0 but client_list is non-NULL! prefix_table[%d] = %p";
              goto LABEL_29;
            }
            *(_DWORD *)(v18 + 8) = -1;
            memmove(v17, &v11[(v9 + 1)], 8 * (*(_DWORD *)(v3 + 8) + ~(_DWORD)v9));
            --*(_DWORD *)(v3 + 8);
            LODWORD(v9) = v9 - 1;
            *(_QWORD *)(v18 + 24) = v7;
            v7 = v18;
LABEL_31:
            if ((int)v9 >= *(_DWORD *)(v3 + 8))
            {
              v27 = sub_1000094B4();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8 * v6);
                *(_DWORD *)buf = 136315138;
                v35[0] = v28;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "remove_paths: did not find prefix header for path %s", buf, 0xCu);
              }
            }
            if (++v6 >= *(int *)(a1 + 128))
              goto LABEL_39;
          }
          if (v19)
            goto LABEL_31;
          v21 = sub_1000094B4();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_31;
          v22 = *(_QWORD *)(*(_QWORD *)v3 + 8 * v9);
          *(_DWORD *)buf = 67109376;
          LODWORD(v35[0]) = v9;
          WORD2(v35[0]) = 2048;
          *(_QWORD *)((char *)v35 + 6) = v22;
          v23 = v21;
          v24 = "remove_paths: prefix_table inconsistent.  refcount > 0 but client_list is NULL! prefix_table[%d] = %p";
LABEL_29:
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
          goto LABEL_31;
        }
        v7 = 0;
LABEL_39:
        pthread_mutex_unlock(&stru_100020180);
        v30 = (void **)qword_100020708;
        qword_100020708 = v3;
        __dmb(0xBu);
        do
        {
          do
            v31 = __ldxr(&dword_100020718);
          while (__stxr(v31, &dword_100020718));
          if (!v31)
            break;
          usleep(0x2710u);
        }
        while ((void **)qword_100020710 == v30);
        if (v30)
        {
          free(*v30);
          free(v30);
        }
        if (v7)
        {
          do
          {
            v32 = *(_QWORD *)(v7 + 24);
            free(*(void **)v7);
            *(_QWORD *)&v33 = 0xD9D9D9D9D9D9D9D9;
            *((_QWORD *)&v33 + 1) = 0xD9D9D9D9D9D9D9D9;
            *(_OWORD *)v7 = v33;
            *(_OWORD *)(v7 + 16) = v33;
            free((void *)v7);
            v7 = v32;
          }
          while (v32);
        }
        return 0;
      }
      free((void *)v3);
    }
    return 12;
  }
  return 0;
}

uint64_t sub_10000BD90(unint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  int64x2_t v6;
  int32x2_t v7;

  v1 = 0;
  v2 = *(_DWORD *)(a1 + 248);
  do
  {
    if (v2 == dword_1000218D8[v1])
    {
      v3 = dword_1000218D8[v1 + 1];
      v4 = __OFSUB__(v3--, 1);
      dword_1000218D8[v1 + 1] = v3;
      if ((v3 < 0) ^ v4 | (v3 == 0))
        dword_1000218D8[v1] = 0;
    }
    v1 += 2;
  }
  while (v1 != 1024);
  v5 = 0;
  v6 = vdupq_n_s64(a1);
  do
  {
    v7 = vmovn_s64(vceqq_s64((int64x2_t)xmmword_100020758[v5], v6));
    if ((v7.i8[0] & 1) != 0)
      *(_QWORD *)&xmmword_100020758[v5] = 0;
    if ((v7.i8[4] & 1) != 0)
      *((_QWORD *)&xmmword_100020758[v5] + 1) = 0;
    ++v5;
  }
  while (v5 != 256);
  return 0;
}

uint64_t sub_10000BE1C(int a1, int a2)
{
  uint64_t i;
  uint64_t v5;
  int v6;

  pthread_mutex_lock(&stru_100020140);
  for (i = 0; i != 4096; i += 8)
  {
    v5 = *(_QWORD *)((char *)xmmword_100020758 + i);
    if (v5 && *(_DWORD *)(v5 + 112) == a1)
    {
      if (a2 == 1)
      {
        v6 = 8;
      }
      else
      {
        if (a2 != 2)
        {
LABEL_9:
          sub_100007D3C(v5);
          continue;
        }
        v6 = 16;
      }
      *(_DWORD *)(v5 + 188) |= v6;
      goto LABEL_9;
    }
  }
  return pthread_mutex_unlock(&stru_100020140);
}

uint64_t sub_10000BEB0()
{
  unsigned int v0;
  uint64_t i;
  uint64_t result;
  unsigned int v3;

  do
    v0 = __ldaxr(&dword_10002071C);
  while (__stlxr(v0 + 1, &dword_10002071C));
  for (i = 0; i != 512; ++i)
  {
    result = xmmword_100020758[i];
    if (result && (*(_DWORD *)(result + 188) & 2) == 0 && (*(_DWORD *)(result + 188) & 0x20) != 0)
      result = sub_100007D3C(result);
  }
  do
    v3 = __ldaxr(&dword_10002071C);
  while (__stlxr(v3 - 1, &dword_10002071C));
  return result;
}

uint64_t sub_10000BF2C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)(a2 + 8))
    return 0;
  *(_QWORD *)a2 = strdup(*(const char **)(a1 + 8));
  return 1;
}

uint64_t sub_10000BF70(uint64_t a1, uint64_t a2)
{
  const char *v4;
  size_t v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v4 = *(const char **)(a1 + 40);
  v5 = strlen(v4);
  v6 = *(unsigned int *)(a2 + 32);
  if (v5 + v6 + 25 >= *(_QWORD *)(a2 + 24))
    return 28;
  v7 = v5 + 1;
  memcpy((void *)(*(_QWORD *)(a2 + 16) + v6), v4, v5 + 1);
  result = 0;
  v9 = *(_DWORD *)(a2 + 32) + v7;
  *(_DWORD *)(a2 + 32) = v9;
  *(_QWORD *)(*(_QWORD *)(a2 + 16) + v9) = *(_QWORD *)(a1 + 16);
  v10 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(*(_QWORD *)(a2 + 16) + v10) = *(_DWORD *)(a1 + 36);
  v11 = *(_DWORD *)(a2 + 32) + 4;
  *(_DWORD *)(a2 + 32) = v11;
  *(_QWORD *)(*(_QWORD *)(a2 + 16) + v11) = *(_QWORD *)(a1 + 24);
  v12 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v12;
  *(_DWORD *)(*(_QWORD *)(a2 + 16) + v12) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 32) += 4;
  return result;
}

void sub_10000C04C(uint64_t a1, pthread_rwlock_t *a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  size_t v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  size_t v16;
  uint64_t *v17;
  uint64_t v18;

  if (!a1 || (*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
  {
    pthread_rwlock_rdlock(a2);
    v8 = (uint64_t *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B0, 8 * *(unsigned int *)&a2[1].__opaque[12], 0x2004093837F09uLL);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_DWORD *)a2[1].__opaque;
      if ((v12 + 1) > 1)
        v13 = (v12 + 1);
      else
        v13 = 1;
      do
      {
        v14 = *(_QWORD **)(a2[1].__sig + 8 * v10);
        if (v14)
        {
          v15 = *(unsigned int *)&a2[1].__opaque[12];
          do
          {
            if (v11 < v15)
              v8[v11++] = (uint64_t)v14;
            v14 = (_QWORD *)*v14;
          }
          while (v14);
        }
        ++v10;
      }
      while (v10 != v13);
      if (!a1 || (*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
      {
        qsort(v8, v11, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C1F8);
        if (v11)
        {
          v16 = v11 - 1;
          v17 = v9;
          do
          {
            if (a1 && ((*(_DWORD *)(a1 + 32) & 0x90) != 0 || (*(_DWORD *)(a1 + 32) & 4) == 0))
              break;
            v18 = *v17++;
          }
          while (!a3(v18, a4) && v16-- != 0);
        }
      }
      pthread_rwlock_unlock(a2);
      malloc_zone_free((malloc_zone_t *)qword_1000206B0, v9);
    }
    else
    {
      pthread_rwlock_unlock(a2);
    }
  }
}

uint64_t sub_10000C1F8(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(*(_QWORD *)a1 + 40), *(const char **)(*(_QWORD *)a2 + 40));
}

uint64_t sub_10000C20C(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t **v4;
  uint64_t *v5;
  size_t v6;

  pthread_rwlock_wrlock((pthread_rwlock_t *)a1);
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 200);
  do
  {
    v4 = *(uint64_t ***)(v3 + 8 * v2);
    if (v4)
    {
      do
      {
        v5 = *v4;
        v6 = strlen((const char *)v4[5]);
        sub_100007BB4((const char *)v4[5], v6 + 1);
        v4[5] = 0;
        v4 = (uint64_t **)v5;
      }
      while (v5);
      v3 = *(_QWORD *)(a1 + 200);
    }
    *(_QWORD *)(v3 + 8 * v2++) = 0;
  }
  while (v2 <= *(_DWORD *)(a1 + 208));
  *(_QWORD *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 244) = 0;
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

_QWORD *sub_10000C29C(int a1, int a2)
{
  int v3;
  _QWORD *v4;
  size_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;

  if (a1 < 1)
  {
    v7 = 0;
  }
  else
  {
    v3 = a1;
    v4 = 0;
    v5 = a2;
    while (1)
    {
      v6 = malloc_type_malloc(0x28uLL, 0x10300407BD0FDCAuLL);
      if (!v6)
        break;
      v7 = v6;
      *(_DWORD *)v6 = a2;
      *(_QWORD *)((char *)v6 + 12) = 0;
      *(_QWORD *)((char *)v6 + 4) = 0;
      v8 = malloc_type_malloc(v5, 0x6F4A520EuLL);
      v7[3] = v8;
      if (!v8)
      {
        free(v7);
        break;
      }
      v7[4] = v4;
      v4 = v7;
      if (!--v3)
        goto LABEL_10;
    }
    v7 = v4;
  }
LABEL_10:
  __dmb(0xBu);
  return v7;
}

uint64_t sub_10000C350(uint64_t a1)
{
  *(_DWORD *)(a1 + 32) |= 2u;
  return 0;
}

uint64_t sub_10000C364(uint64_t result)
{
  uint64_t v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  int v7;
  size_t v8;

  if (*(_QWORD *)(result + 8))
  {
    v1 = result;
    if ((*(_DWORD *)(result + 32) & 0x10) == 0)
    {
      v2 = &qword_1000206D0[dword_1000206E0];
      do
      {
        v3 = __ldxr(v2);
        v4 = v3 + 1;
      }
      while (__stxr(v3 + 1, v2));
      if (v3 == -2)
      {
        sub_100009F54((uint64_t (*)(void))sub_10000C350);
        v5 = &qword_1000206D0[dword_1000206E0];
        do
        {
          v6 = __ldxr(v5);
          v4 = v6 + 1;
        }
        while (__stxr(v6 + 1, v5));
      }
      if ((*(_DWORD *)(v1 + 32) & 4) != 0)
        v7 = 0x2000000;
      else
        v7 = 0x4000000;
      v8 = strlen(*(const char **)(v1 + 16));
      result = sub_1000066BC((uint64_t)&qword_100021830, -1, *(_DWORD *)v1, *(char **)(v1 + 16), (int)v8 + 1, v8 + 1, v7, v4, 0, 0);
      if ((*(_DWORD *)(v1 + 32) & 4) == 0)
        *(_DWORD *)(v1 + 32) |= 0x10u;
      *(_DWORD *)(v1 + 32) &= ~0x20u;
    }
  }
  return result;
}

uint64_t sub_10000C470()
{
  pthread_mutex_lock(&stru_1000201C0);
  pthread_cond_signal(&stru_100020200);
  return pthread_mutex_unlock(&stru_1000201C0);
}

uint64_t sub_10000C4A8()
{
  uint64_t result;

  dword_1000206C8 = 1;
  __dmb(0xBu);
  result = dword_100020048;
  if ((dword_100020048 & 0x80000000) == 0)
  {
    dword_100020048 = -1;
    return close(result);
  }
  return result;
}

char *sub_10000C4D4(int a1)
{
  char *result;
  char buffer[4096];

  if (proc_pidpath(a1, buffer, 0x1000u) < 1)
    result = 0;
  else
    result = basename(buffer);
  if (!result)
    return "(unknown)";
  return result;
}

__CFDictionary *sub_10000C56C()
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v1;
  __CFDictionary *v2;
  __CFDictionary *v3;
  int v4;
  uint64_t v5;
  int v6;
  char *v7;
  uint64_t v8;
  CFMutableDictionaryRef v9;
  __CFDictionary *v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  CFIndex v15;
  CFMutableArrayRef v16;
  __CFArray *v17;
  uint64_t v18;
  CFStringRef v19;
  CFStringRef v20;
  NSObject *v21;
  NSObject *v22;
  CFMutableArrayRef v23;
  __CFArray *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  CFStringRef v28;
  CFStringRef v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFDictionary *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __CFDictionary *theDict;
  __CFArray *theArray;
  int v60;
  char v61;
  char v62[15];
  char v63;
  char v64[15];
  char v65;
  char v66[15];
  char v67;
  char v68[7];
  double v69;

  pthread_mutex_lock(&stru_100020140);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v32 = sub_1000094B4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_100015C94(v32, v33, v34, v35, v36, v37, v38, v39);
LABEL_47:
    v40 = 0;
    goto LABEL_48;
  }
  v1 = Mutable;
  v2 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v2)
  {
    v41 = sub_1000094B4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_100015C94(v41, v42, v43, v44, v45, v46, v47, v48);
LABEL_46:
    CFRelease(v1);
    goto LABEL_47;
  }
  v3 = v2;
  sub_10000CCBC(v2, CFSTR("proc_name"), "%s", "fseventsd");
  sub_10000CCBC(v3, CFSTR("num_clients"), "%d", (_QWORD *)dword_100020720);
  sub_10000CCBC(v3, CFSTR("curr_event_id"), "%llu", (_QWORD *)qword_1000206D0[dword_1000206E0]);
  sub_10000CCBC(v3, CFSTR("string_table_count"), "%u", (_QWORD *)dword_100021850);
  theDict = v1;
  CFDictionaryAddValue(v1, CFSTR("global_state"), v3);
  CFRelease(v3);
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v4 = dword_100020720;
  if (dword_100020720 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = "%s";
    do
    {
      v8 = xmmword_100020758[v5];
      if (v8)
      {
        v9 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!v9)
        {
          v49 = sub_1000094B4();
          v1 = theDict;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            sub_100015C94(v49, v50, v51, v52, v53, v54, v55, v56);
          goto LABEL_46;
        }
        v10 = v9;
        v11 = sub_10000C4D4(*(_DWORD *)(v8 + 248));
        sub_10000CCBC(v10, CFSTR("client_name"), v7, v11);
        sub_10000CCBC(v10, CFSTR("client_pid"), "%d", (_QWORD *)*(int *)(v8 + 248));
        sub_10000CCBC(v10, CFSTR("client_uid"), "%d", (_QWORD *)*(unsigned int *)(v8 + 252));
        sub_10000CCBC(v10, CFSTR("client_gid"), "%d", (_QWORD *)*(unsigned int *)(v8 + 256));
        sub_10000CCBC(v10, CFSTR("dev_to_watch"), "%d", (_QWORD *)*(int *)(v8 + 112));
        v12 = *(_QWORD **)(v8 + 120);
        if (v12)
          sub_10000CCBC(v10, CFSTR("working_dir"), v7, v12);
        v60 = v6;
        sub_10000CCBC(v10, CFSTR("last_update"), "%llu", *(_QWORD **)(v8 + 144));
        sub_10000CCBC(v10, CFSTR("dropped_id"), "%llu", *(_QWORD **)(v8 + 152));
        sub_10000CCBC(v10, CFSTR("last_id"), "%llu", *(_QWORD **)(v8 + 160));
        sub_10000CCBC(v10, CFSTR("last_history_id"), "%llu", *(_QWORD **)(v8 + 168));
        sub_10000CCBC(v10, CFSTR("update_interval"), "%llu", *(_QWORD **)(v8 + 176));
        sub_10000CCBC(v10, CFSTR("num_errors"), "%d", (_QWORD *)*(int *)(v8 + 184));
        sub_10000CCBC(v10, CFSTR("client_flags"), "%d", (_QWORD *)*(int *)(v8 + 188));
        sub_10000CCBC(v10, CFSTR("max_events"), "%d", (_QWORD *)*(int *)(v8 + 224));
        sub_10000CCBC(v10, CFSTR("num_paths"), "%d", (_QWORD *)*(int *)(v8 + 128));
        sub_10000CCBC(v10, CFSTR("start_id"), "%llu", *(_QWORD **)(v8 + 232));
        sub_10000CCBC(v10, CFSTR("vfs_authorized_access"), "%d", (_QWORD *)*(unsigned int *)(v8 + 292));
        sub_10000CCBC(v10, CFSTR("num_events"), "%llu", *(_QWORD **)(v8 + 304));
        sub_10000CCBC(v10, CFSTR("allocated_bytes"), "%llu", *(_QWORD **)(v8 + 296));
        sub_10000CCBC(v10, CFSTR("client_thread"), "%d", (_QWORD *)*(unsigned int *)(v8 + 320));
        sub_10000CCBC(v10, CFSTR("client_index"), "%d", (_QWORD *)*(int *)(v8 + 192));
        v69 = (double)*(int *)(v8 + 328) / 1000000.0 + (double)*(int *)(v8 + 324);
        sub_10000CCBC(v10, CFSTR("user_time"), "%f", &v69);
        v69 = (double)*(int *)(v8 + 336) / 1000000.0 + (double)*(int *)(v8 + 332);
        sub_10000CCBC(v10, CFSTR("system_time"), "%f", &v69);
        v13 = *(_QWORD **)(v8 + 344);
        if (v13)
          sub_10000CCBC(v10, CFSTR("pw_name"), v7, v13);
        v14 = v7;
        v15 = *(unsigned int *)(v8 + 128);
        if ((int)v15 >= 1)
        {
          v16 = CFArrayCreateMutable(kCFAllocatorDefault, v15, &kCFTypeArrayCallBacks);
          if (v16)
          {
            v17 = v16;
            if (*(int *)(v8 + 128) >= 1)
            {
              v18 = 0;
              do
              {
                v19 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(*(_QWORD *)(v8 + 136) + 8 * v18), 0x8000100u);
                if (v19)
                {
                  v20 = v19;
                  CFArrayAppendValue(v17, v19);
                  CFRelease(v20);
                }
                else
                {
                  v21 = sub_1000094B4();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    sub_100015D88(&v67, v68);
                }
                ++v18;
              }
              while (v18 < *(int *)(v8 + 128));
            }
            CFDictionaryAddValue(v10, CFSTR("path_table"), v17);
            CFRelease(v17);
          }
          else
          {
            v22 = sub_1000094B4();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              sub_100015D5C(&v65, v66);
          }
        }
        v23 = CFArrayCreateMutable(kCFAllocatorDefault, 8, &kCFTypeArrayCallBacks);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
          v26 = v8 + 352;
          do
          {
            v27 = *(const char **)(v26 + v25);
            if (!v27)
              break;
            v28 = CFStringCreateWithCString(kCFAllocatorDefault, v27, 0x8000100u);
            if (v28)
            {
              v29 = v28;
              CFArrayAppendValue(v24, v28);
              CFRelease(v29);
            }
            else
            {
              v30 = sub_1000094B4();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                sub_100015D30(&v63, v64);
            }
            v25 += 8;
          }
          while (v25 != 64);
          if (CFArrayGetCount(v24) >= 1)
            CFDictionaryAddValue(v10, CFSTR("exclusion_paths"), v24);
          CFRelease(v24);
        }
        else
        {
          v31 = sub_1000094B4();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_100015D04(&v61, v62);
        }
        v6 = v60 + 1;
        CFArrayAppendValue(theArray, v10);
        CFRelease(v10);
        v4 = dword_100020720;
        v7 = v14;
      }
      ++v5;
    }
    while (v6 < v4);
  }
  v40 = theDict;
  CFDictionaryAddValue(theDict, CFSTR("clients"), theArray);
  CFRelease(theArray);
LABEL_48:
  pthread_mutex_unlock(&stru_100020140);
  return v40;
}

double sub_10000CCBC(__CFDictionary *a1, const __CFString *a2, char *__s1, _QWORD *a4)
{
  double result;
  CFStringRef v9;
  CFStringRef v10;
  NSObject *v11;

  if (!strcmp(__s1, "%llu"))
  {
    if (!a4)
      return result;
    v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%llu"), a4);
  }
  else if (!strcmp(__s1, "%s"))
  {
    v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s"), a4);
  }
  else if (!strcmp(__s1, "%f"))
  {
    result = *(double *)a4;
    if (*(double *)a4 == 0.0)
      return result;
    v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%f"), *a4);
  }
  else if (!strcmp(__s1, "%u"))
  {
    if (!(_DWORD)a4)
      return result;
    v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%u"), a4);
  }
  else
  {
    if (!(_DWORD)a4)
      return result;
    v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a4);
  }
  v10 = v9;
  if (v9)
  {
    CFDictionaryAddValue(a1, a2, v9);
    CFRelease(v10);
  }
  else
  {
    v11 = sub_1000094B4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100015DB4(a2, v11);
  }
  return result;
}

uint64_t sub_10000CE40(uint64_t result)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  char *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  char *v29;
  int v30;
  int v31;
  int v32;
  uint8_t buf[4];
  _BYTE v34[20];
  double v35;
  _BYTE v36[10];
  uint64_t v37;

  if ((_DWORD)result == 30)
  {
    pthread_mutex_lock(&stru_100020140);
    v1 = sub_1000094B4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      sub_100015E30();
    v2 = 0;
    while (1)
    {
      v3 = xmmword_100020758[v2];
      if (v3)
        break;
LABEL_22:
      if (++v2 == 512)
        return pthread_mutex_unlock(&stru_100020140);
    }
    v4 = *(_QWORD *)(v3 + 232);
    v5 = sub_1000094B4();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4 == -1)
    {
      if (v6)
      {
        v29 = sub_10000C4D4(*(_DWORD *)(v3 + 248));
        v30 = *(_DWORD *)(v3 + 248);
        v31 = *(_DWORD *)(v3 + 188);
        v32 = *(_DWORD *)(v3 + 128);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v34 = v29;
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)&v34[10] = v30;
        *(_WORD *)&v34[14] = 1024;
        *(_DWORD *)&v34[16] = v31;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = v32;
        v13 = v5;
        v14 = "\t%s pid %d, flags 0x%x, #paths %d, sinceWhen: Now\n";
        v15 = 30;
        goto LABEL_25;
      }
    }
    else if (v6)
    {
      v7 = sub_10000C4D4(*(_DWORD *)(v3 + 248));
      v8 = *(_DWORD *)(v3 + 248);
      v9 = *(_DWORD *)(v3 + 188);
      v10 = *(_DWORD *)(v3 + 128);
      v11 = *(_QWORD *)(v3 + 232);
      v12 = qword_1000206D0[dword_1000206E0] - v11;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v34 = v7;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v8;
      *(_WORD *)&v34[14] = 1024;
      *(_DWORD *)&v34[16] = v9;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v10;
      HIWORD(v35) = 2048;
      *(_QWORD *)v36 = v11;
      *(_WORD *)&v36[8] = 2048;
      v37 = v12;
      v13 = v5;
      v14 = "\t%s pid %d, flags 0x%x, #paths %d, sinceWhen: 0x%llx [delta: %llu]\n";
      v15 = 50;
LABEL_25:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
    }
    v16 = sub_1000094B4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(v3 + 296);
      v24 = *(_QWORD *)(v3 + 304);
      v26 = (double)*(int *)(v3 + 328) / 1000000.0 + (double)*(int *)(v3 + 324);
      v27 = (double)*(int *)(v3 + 332);
      v28 = (double)*(int *)(v3 + 336) / 1000000.0;
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v34 = v24;
      *(_WORD *)&v34[8] = 2048;
      *(_QWORD *)&v34[10] = v25;
      *(_WORD *)&v34[18] = 2048;
      v35 = v26;
      *(_WORD *)v36 = 2048;
      *(double *)&v36[2] = v28 + v27;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "\t\tnum_events[%llu] allocated_bytes[%llu] user_time[%.2f] system_time[%.2f]\n", buf, 0x2Au);
    }
    if (*(int *)(v3 + 128) >= 1)
    {
      v17 = 0;
      do
      {
        v18 = sub_1000094B4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(*(_QWORD *)(v3 + 136) + 8 * v17);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v34 = v17;
          *(_WORD *)&v34[4] = 2080;
          *(_QWORD *)&v34[6] = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "\t\t%d: %s\n", buf, 0x12u);
        }
        ++v17;
      }
      while (v17 < *(int *)(v3 + 128));
    }
    v20 = 0;
    v21 = v3 + 352;
    do
    {
      if (!*(_QWORD *)(v21 + v20))
        break;
      v22 = sub_1000094B4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(v21 + v20);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v34 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "\t\tExcluded %s\n", buf, 0xCu);
      }
      v20 += 8;
    }
    while (v20 != 64);
    goto LABEL_22;
  }
  return result;
}

uint64_t sub_10000D1F0(uint64_t a1)
{
  int v1;
  int v2;
  NSObject *v3;
  uint64_t v4;
  char __str[1024];

  snprintf(__str, 0x400uLL, "%s/.ramdisk-boot-done", (const char *)(a1 + 256));
  v1 = open(__str, 0x20000000);
  if (v1 < 1)
    return 0;
  v2 = v1;
  if (unlink(__str))
  {
    v3 = sub_1000094B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100015ECC();
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  close(v2);
  return v4;
}

void sub_10000D2C8(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  int v6;
  __darwin_time_t tv_sec;
  time_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t f_flags;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[8];
  int v18;
  int v19;
  uint64_t v20;
  stat v21;
  uint8_t v22[4];
  uint64_t v23;
  __int16 v24;
  _BYTE *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  __darwin_time_t v29;
  __int16 v30;
  time_t v31;
  __int16 v32;
  time_t v33;
  statfs buf;
  _BYTE v35[37];
  char __str[1024];

  memset(&v21, 0, sizeof(v21));
  v20 = 0;
  if (!sub_10000D1F0(a2))
  {
    snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
    v5 = open(__str, 0x20000000);
    if (v5 < 0)
      return;
    v6 = v5;
    if (fstat(v5, &v21) || (v21.st_mode & 0xF000) != 0x8000)
    {
      v10 = sub_1000094B4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000160E4();
    }
    else
    {
      tv_sec = v21.st_ctimespec.tv_sec;
      v8 = time(0);
      if (fsctl(__str, 0x40046812uLL, &v20, 0))
      {
        v9 = sub_1000094B4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_10001606C();
LABEL_17:
        *(_DWORD *)(a1 + 32) |= 0x200u;
        close(v6);
LABEL_18:
        sub_10000D7B4(a2, 1);
        sub_10000D9AC(a1, a2);
        return;
      }
      if (fsctl(__str, 0x40046813uLL, (char *)&v20 + 4, 0))
      {
        v11 = sub_1000094B4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_100015FE4(v11);
        goto LABEL_17;
      }
      if (HIDWORD(v20) > tv_sec && HIDWORD(v20) - tv_sec > 119 || v8 - v20 >= 120 && v8 - tv_sec > 5)
      {
        close(v6);
        memset(v35, 0, sizeof(v35));
        sub_10000A120((const char *)(a2 + 256), v35);
        memset(&buf, 0, 512);
        v12 = statfs((const char *)(a2 + 256), &buf);
        if (v12)
          f_flags = 0;
        else
          f_flags = buf.f_flags;
        if (v12)
          v14 = 0;
        else
          v14 = (buf.f_flags >> 9) & 1;
        v15 = sub_1000094B4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v22 = 136316418;
          v23 = a2 + 256;
          v24 = 2080;
          v25 = v35;
          v26 = 2048;
          v27 = f_flags;
          v28 = 2048;
          v29 = HIDWORD(v20) - tv_sec;
          v30 = 2048;
          v31 = v8 - v20;
          v32 = 2048;
          v33 = v8 - tv_sec;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "event logs in %s with volume UUID [%s] and f_flags[0x%llx] out of sync with volume.  destroying old logs. (%ld %ld %ld)", v22, 0x3Eu);
        }
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 0x40000000;
        v17[2] = sub_10000D6BC;
        v17[3] = &unk_10001C708;
        v17[4] = f_flags;
        v17[5] = v14;
        v17[6] = tv_sec;
        v17[7] = v8;
        v18 = HIDWORD(v20);
        v19 = v20;
        analytics_send_event_lazy("com.apple.fseventsd.resetlogs", v17);
        v16 = sub_1000094B4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_100015F5C();
        goto LABEL_18;
      }
    }
    close(v6);
    return;
  }
  v4 = sub_1000094B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 136315138;
    *(_QWORD *)&buf.f_iosize = "check_vol_last_mod_time";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: ram disk boot detected", (uint8_t *)&buf, 0xCu);
  }
}

xpc_object_t sub_10000D6BC(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "statfs_f_flags", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_int64(v2, "is_mnt_removable", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_int64(v2, "last_mount_time", *(unsigned int *)(a1 + 64));
  xpc_dictionary_set_int64(v2, "last_event_time", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "current_time", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_int64(v2, "mount_time", *(unsigned int *)(a1 + 68));
  xpc_dictionary_set_int64(v2, "last_mount_diff", *(unsigned int *)(a1 + 64) - *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "current_mount_diff", *(_QWORD *)(a1 + 56) - *(unsigned int *)(a1 + 68));
  xpc_dictionary_set_int64(v2, "last_event_diff", *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 48));
  return v2;
}

void sub_10000D7B4(uint64_t a1, int a2)
{
  const char *v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  size_t v9;
  NSObject *v10;
  int *v11;
  char *v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  char *v16;
  char v17[1024];

  v4 = (const char *)(a1 + 256);
  v5 = __strlcpy_chk(v17, a1 + 256, 1024, 1024);
  v17[v5] = 47;
  v6 = (int *)(a1 + 32);
  if (*(int *)(a1 + 32) >= 1)
  {
    v7 = 0;
    v8 = &v17[v5 + 1];
    v9 = 1023 - v5;
    do
    {
      snprintf(v8, v9, "%.16llx", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v7));
      if (unlink(v17) && (*__error() != 30 || strcmp(v4, "/.fseventsd")))
      {
        v10 = sub_1000094B4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = __error();
          v12 = strerror(*v11);
          *(_DWORD *)buf = 136315394;
          v14 = v17;
          v15 = 2080;
          v16 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to unlink old log file %s (%s)", buf, 0x16u);
        }
      }
      ++v7;
    }
    while (v7 < *v6);
  }
  if (a2)
  {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 48));
    free(*(void **)(a1 + 40));
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(a1 + 40) = 0;
    ++*(_WORD *)(a1 + 248);
    *(_WORD *)(a1 + 250) = 1;
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 48));
  }
  else
  {
    free(*(void **)(a1 + 40));
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(a1 + 40) = 0;
    ++*(_WORD *)(a1 + 248);
    *(_WORD *)(a1 + 250) = 1;
  }
}

void sub_10000D9AC(uint64_t a1, uint64_t a2)
{
  const unsigned __int8 *v4;
  const char *v5;
  int v6;
  int v7;
  size_t v8;
  ssize_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  char __str[1024];

  v4 = (const unsigned __int8 *)(a1 + 48);
  uuid_generate((unsigned __int8 *)(a1 + 48));
  uuid_unparse(v4, (char *)(a1 + 64));
  v5 = (const char *)(a2 + 256);
  snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
  unlink(__str);
  v6 = open_dprotected_np(__str, 536872450, 4, 0, 384);
  if (v6 < 0)
  {
    if ((*(_DWORD *)(a1 + 32) & 1) == 0 || *__error() != 30)
    {
      v11 = sub_1000094B4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100016238();
    }
  }
  else
  {
    v7 = v6;
    v8 = strlen((const char *)(a1 + 64));
    v9 = write(v7, (const void *)(a1 + 64), v8);
    if (v9 == strlen((const char *)(a1 + 64)))
    {
      if ((*(_DWORD *)(a1 + 32) & 1) == 0 || strcmp(v5, "/tmp"))
      {
        v10 = sub_1000094B4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100016164((uint64_t)v5);
      }
    }
    else
    {
      unlink(__str);
      v12 = sub_1000094B4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000161D8();
    }
    close(v7);
  }
}

uint64_t sub_10000DB58(int a1, _DWORD *a2, _DWORD *a3, _QWORD *a4, unsigned int (*a5)(char *), unint64_t *a6, unint64_t *a7)
{
  DIR *v14;
  DIR *v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  _QWORD *v19;
  unint64_t v20;
  dirent *v21;
  dirent *v22;
  int v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _DWORD *v30;
  _DWORD *v31;
  _QWORD *v32;
  unint64_t *v33;
  unint64_t *v34;

  *a3 = 0;
  *a2 = 0;
  *a4 = 0;
  *a7 = 0;
  *a6 = 0;
  v14 = fdopendir(a1);
  if (!v14)
  {
    close(a1);
    return *__error();
  }
  v15 = v14;
  v30 = a2;
  v31 = a3;
  v32 = a4;
  v33 = a6;
  v34 = a7;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = -1;
  while (1)
  {
    do
    {
      v21 = readdir(v15);
      if (!v21)
      {
        *v30 = v16;
        *v31 = v18;
        *v32 = v19;
        *v33 = v20;
        *v34 = v17;
        closedir(v15);
        return 0;
      }
      v22 = v21;
    }
    while (a5 && !a5(v21->d_name));
    if (v16 < v18)
    {
      v23 = v18;
      v24 = v19;
      goto LABEL_11;
    }
    v23 = v18 + 100;
    v25 = malloc_type_calloc(v18 + 100, 8uLL, 0x100004000313F17uLL);
    if (!v25)
      break;
    v24 = v25;
    if (v19)
    {
      memcpy(v25, v19, 8 * v18);
      free(v19);
    }
LABEL_11:
    v26 = strtoull(v22->d_name, 0, 16);
    v24[v16] = v26;
    if (v26 <= v17)
      v27 = v17;
    else
      v27 = v26;
    if (v26 >= v20)
      v28 = v20;
    else
      v28 = v26;
    if (v26 < v20)
      v27 = v17;
    if (v26 + 1 > 1)
    {
      v17 = v27;
      v20 = v28;
      ++v16;
    }
    v18 = v23;
    v19 = v24;
  }
  if (v19)
    free(v19);
  closedir(v15);
  return 12;
}

BOOL sub_10000DD1C(_BYTE *a1)
{
  _BOOL8 v1;
  char *v2;
  int v3;
  uint64_t v4;

  v1 = *a1 == 0;
  if ((char)*a1 >= 1)
  {
    if ((_DefaultRuneLocale.__runetype[*a1] & 0x10000) != 0)
    {
      v2 = a1 + 1;
      do
      {
        v3 = *v2++;
        v4 = v3;
      }
      while (v3 >= 1 && (_DefaultRuneLocale.__runetype[v4] & 0x10000) != 0);
      return (_DWORD)v4 == 0;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void *sub_10000DD80(uint64_t a1)
{
  _DWORD *v2;
  void *result;

  *(_QWORD *)(a1 + 240) = 0;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  v2 = (_DWORD *)(a1 + 208);
  pthread_rwlock_init((pthread_rwlock_t *)a1, 0);
  *(_QWORD *)(a1 + 200) = sub_1000129E8(4096, v2);
  result = malloc_type_malloc(0x1FFE0uLL, 0x10B00407F4A3208uLL);
  *(_QWORD *)(a1 + 232) = result;
  *(_DWORD *)(a1 + 240) = 2730;
  return result;
}

uint64_t sub_10000DE08(_QWORD *a1, _QWORD *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 > *a2;
}

uint64_t sub_10000DE20(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v5;
  int v6;
  gzFile v7;
  gzFile_s *v8;
  uint64_t (***v9)();
  int8x8_t *v10;
  int8x8_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  int v17;
  int v18;
  unsigned int v21;
  unsigned int v22;
  int v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  __int32 v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v36;
  __int32 v38;
  unsigned int v39;
  __int32 v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v44;
  int8x8_t *v45;
  NSObject *v46;
  gzFile_s *v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  __int32 v52;
  int v53;
  int v54;
  gzFile_s *v55;
  uint64_t v56;
  int v57;
  __int32 v58;
  int v59;
  stat v60;
  uint8_t buf[4];
  _BYTE v62[30];
  int v63;
  __int16 v64;
  int v65;
  uint8_t v66[4];
  uint64_t v67;
  uint8_t v68[4];
  uint64_t v69;
  uint8_t v70[4];
  uint64_t v71;
  uint8_t v72[4];
  uint64_t v73;
  uint8_t v74[4];
  uint64_t v75;
  char __str[1024];

  memset(&v60, 0, sizeof(v60));
  *a3 = 0;
  snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(a1 + 256), a2);
  v5 = open(__str, 0x20000000);
  if (v5 < 0)
  {
LABEL_91:
    v41 = sub_1000094B4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_100016298();
    return 22;
  }
  v6 = v5;
  if (fstat(v5, &v60) || (v60.st_mode & 0xF000) != 0x8000)
  {
    close(v6);
    goto LABEL_91;
  }
  if (!v60.st_size)
  {
    close(v6);
    return 22;
  }
  v7 = gzdopen(v6, "rb");
  if (!v7)
  {
    v44 = sub_1000094B4();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_100016318();
    close(v6);
    return *__error();
  }
  v8 = v7;
  v9 = &off_100020000;
  v10 = (int8x8_t *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0x86324632uLL);
  if (!v10)
  {
    gzclose(v8);
    return 12;
  }
  v11 = v10;
  v12 = gzread(v8, v10, 0x10000u);
  if (v12 < 1)
  {
    v16 = 0;
    v45 = 0;
    goto LABEL_107;
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v57 = 0;
  v58 = 0;
  v56 = 0;
  v55 = v8;
  do
  {
    if (!v14 && v12 <= 0xB)
    {
      v46 = sub_1000094B4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_100016378();
      goto LABEL_103;
    }
    v18 = v11->i32[0];
    if (v11->i32[0] > 1145852720)
    {
      if ((v18 - 1145852721) >= 3)
        goto LABEL_25;
      if (v13)
        goto LABEL_28;
      v17 = v11[1].i32[0];
    }
    else
    {
      if (v18 != 827542596 && v18 != 844319812 && v18 != 861097028)
      {
LABEL_25:
        v17 = v11[1].i32[0];
        if (v17 <= 0x40000)
        {
          if (v13)
            goto LABEL_28;
          goto LABEL_27;
        }
        v51 = sub_1000094B4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = v11->i32[0];
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v62 = v52;
          *(_WORD *)&v62[4] = 1024;
          strcpy(&v62[6], "1SLD");
          v62[11] = 8;
          *(_QWORD *)&v62[12] = v56;
          *(_WORD *)&v62[20] = 2080;
          *(_QWORD *)&v62[22] = __str;
          _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "get_last_event_id: magic is wrong (0x%.8x != 0x%.8x; cur_pos %lld) in file %s",
            buf,
            0x22u);
        }
LABEL_103:
        v47 = v8;
LABEL_104:
        gzclose(v47);
        malloc_zone_free((malloc_zone_t *)qword_1000206B8, v11);
        return 22;
      }
      if (v13)
        goto LABEL_28;
      v17 = bswap32(v11[1].u32[0]);
    }
LABEL_27:
    v58 = v11->i32[1];
    v11->i32[1] = 0;
LABEL_28:
    v13 += v12;
    v59 = v17;
    if (v13 < v17)
    {
      v14 += v12;
      goto LABEL_85;
    }
    v21 = sub_10000B93C(v11, v17);
    v22 = v21;
    if (v18 == 827542596 || v18 == 861097028 || v18 == 844319812)
      v22 = bswap32(v21);
    v16 = (char *)&v11[1] + 4;
    if (v58 != v22)
    {
      v23 = sub_100012A70(v11, v59);
      if (v58 != v23)
      {
        v49 = v23;
        v50 = sub_1000094B4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v62 = v58;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = v49;
          *(_WORD *)&v62[10] = 2080;
          *(_QWORD *)&v62[12] = __str;
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "get_last_event_id: checksum mis-match: file 0x%.8x, calculated 0x%.8x in file %s", buf, 0x18u);
        }
        v47 = v55;
        goto LABEL_104;
      }
    }
    switch(v18)
    {
      case 827542596:
        v24 = 0;
        break;
      case 861097028:
        v24 = 3;
        break;
      case 844319812:
        v24 = 1;
        break;
      default:
        goto LABEL_43;
    }
    sub_100012ADC(v11, v13, v24);
LABEL_43:
    v25 = (unint64_t)v11 + v11[1].i32[0];
    while ((unint64_t)v16 < v25)
    {
      v26 = (unint64_t)v16;
      do
      {
        if (!*(_BYTE *)v26)
          break;
        ++v26;
      }
      while (v26 < v25);
      if (v26 - (unint64_t)v16 - 1024 <= 0xFFFFFFFFFFFFFBFELL)
      {
        v29 = sub_1000094B4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_1000163EC(v74, &v75, v29);
        break;
      }
      v16 = (char *)(v26 + 1);
      if (v26 + 1 >= v25)
      {
        v30 = sub_1000094B4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v40 = v11[1].i32[0];
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)v62 = v16 - (char *)v11;
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = v40;
          *(_WORD *)&v62[14] = 2080;
          *(_QWORD *)&v62[16] = __str;
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = v57;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "get_last_event_id: ptr out-of-bounds (%ld > %d) in file %s (counter %d)", buf, 0x22u);
        }
        v31 = sub_1000094B4();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v62 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "get_last_event_id: path was: <%s>", buf, 0xCu);
        }
        break;
      }
      if (v26 + 9 > v25)
      {
        v32 = sub_1000094B4();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_100016430(v72, &v73, v32);
        break;
      }
      if (v15 <= *(_QWORD *)(v26 + 1))
        v15 = *(_QWORD *)(v26 + 1);
      v16 = (char *)(v26 + 13);
      if (v26 + 13 > v25)
      {
        v33 = sub_1000094B4();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_100016474(v70, &v71, v33);
        v16 = (char *)(v26 + 9);
        break;
      }
      v27 = v11->i32[0];
      if (v11->i32[0] == 1145852722 || v27 == 844319812)
      {
        v28 = v26 + 21;
        if (v28 > v25)
        {
          v34 = sub_1000094B4();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            sub_1000164FC(v68, &v69, v34);
          break;
        }
      }
      else
      {
        v28 = v26 + 13;
      }
      if (v27 == 1145852723 || v27 == 861097028)
      {
        v16 = (char *)(v28 + 12);
        if (v28 + 12 > v25)
        {
          v36 = sub_1000094B4();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_1000164B8(v66, &v67, v36);
          v16 = (char *)v28;
          break;
        }
      }
      else
      {
        v16 = (char *)v28;
      }
    }
    v14 = 0;
    if (v58 == v22)
    {
      v38 = v11[1].i32[0];
      v8 = v55;
      if (v38)
      {
        v14 = 0x40000 - v38;
        __memmove_chk(v11, &v11->i8[v38], v14, 0x40000);
      }
    }
    else
    {
      v8 = v55;
    }
    ++v57;
    v56 += v13;
    v13 = 0;
LABEL_85:
    if (0x40000 - v14 >= 0x10000)
      v39 = 0x10000;
    else
      v39 = 0x40000 - v14;
    v12 = gzread(v8, (char *)v11 + v14, v39);
    v17 = v59;
  }
  while (v12 > 0);
  v45 = v11;
  v9 = &off_100020000;
  if (v15)
  {
    v42 = 0;
    *a3 = v15 + 1;
    goto LABEL_109;
  }
LABEL_107:
  v48 = sub_1000094B4();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    if (v45)
    {
      v53 = v45[1].i32[0];
      v54 = v45[1].i32[1];
    }
    else
    {
      v53 = -123;
      v54 = -123;
    }
    *(_DWORD *)buf = 134219008;
    *(_QWORD *)v62 = a2;
    *(_WORD *)&v62[8] = 2048;
    *(_QWORD *)&v62[10] = v16;
    *(_WORD *)&v62[18] = 2048;
    *(_QWORD *)&v62[20] = v11;
    *(_WORD *)&v62[28] = 1024;
    v63 = v53;
    v64 = 1024;
    v65 = v54;
    _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "did not find any event id's in %.16llx (ptr %p buff %p / iptr[2] %d / iptr[3] %d\n", buf, 0x2Cu);
  }
  v42 = 22;
LABEL_109:
  malloc_zone_free((malloc_zone_t *)v9[215], v11);
  gzclose(v8);
  return v42;
}

uint64_t sub_10000E6D4(uint64_t a1, uint64_t a2)
{
  const char *v3;
  int v4;
  int v5;
  _BYTE *v6;
  ssize_t v7;
  uint64_t result;
  NSObject *v9;
  stat v10;
  char __str[1024];

  memset(&v10, 0, sizeof(v10));
  v3 = (const char *)(a2 + 256);
  snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
  v4 = open(__str, 0x20000000);
  if (v4 < 0)
  {
    if ((*(_DWORD *)(a1 + 32) & 1) == 0 || strcmp(v3, "/tmp"))
    {
      v9 = sub_1000094B4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100016540();
    }
    return 2;
  }
  v5 = v4;
  if (fstat(v4, &v10) || (v10.st_mode & 0xF000) != 0x8000)
  {
    close(v5);
    return 22;
  }
  v6 = (_BYTE *)(a1 + 64);
  v7 = read(v5, (void *)(a1 + 64), 0x40uLL);
  if (v7 <= 0)
  {
    close(v5);
    unlink(__str);
    *v6 = 0;
    return 2;
  }
  if (v7 == 64)
  {
    close(v5);
    unlink(__str);
    *v6 = 0;
    return 22;
  }
  *(_BYTE *)(a1 + v7 + 64) = 0;
  close(v5);
  result = uuid_parse((const char *)(a1 + 64), (unsigned __int8 *)(a1 + 48));
  if ((_DWORD)result)
  {
    unlink(__str);
    return 22;
  }
  return result;
}

void sub_10000E864(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 128);
  if (v2)
  {
    if (!*(_DWORD *)(v2 + 28))
    {
      v3 = *(_QWORD *)(a2 + 40);
      if (v3 > 0x1388 || 100 * v3 / *(_QWORD *)(a2 + 8) >= 6)
      {
        v4 = sub_1000094B4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          sub_1000165BC();
        *(_DWORD *)(v2 + 28) = 1;
      }
    }
  }
}

uint64_t sub_10000E8E0(uint64_t a1, uint64_t a2)
{
  const char *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v4 = *(const char **)(a1 + 40);
  v5 = strlen(v4);
  v6 = *(unsigned int *)(a2 + 32);
  if (v5 + v6 + 25 >= *(_QWORD *)(a2 + 24))
  {
    sub_10000E9E8(*(gzFile *)a2, *(_QWORD *)(a2 + 8), a2, 0);
    v7 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(v7 + 4) = 0xC00000000;
    v6 = 12;
    *(_DWORD *)(a2 + 32) = 12;
    v4 = *(const char **)(a1 + 40);
  }
  else
  {
    v7 = *(_QWORD *)(a2 + 16);
  }
  v8 = v5 + 1;
  memcpy((void *)(v7 + v6), v4, v8);
  v9 = *(_DWORD *)(a2 + 32) + v8;
  *(_DWORD *)(a2 + 32) = v9;
  *(_QWORD *)(*(_QWORD *)(a2 + 16) + v9) = *(_QWORD *)(a1 + 16);
  v10 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(*(_QWORD *)(a2 + 16) + v10) = *(_DWORD *)(a1 + 36);
  v11 = *(_DWORD *)(a2 + 32) + 4;
  *(_DWORD *)(a2 + 32) = v11;
  *(_QWORD *)(*(_QWORD *)(a2 + 16) + v11) = *(_QWORD *)(a1 + 24);
  v12 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v12;
  *(_DWORD *)(*(_QWORD *)(a2 + 16) + v12) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 32) += 4;
  return 0;
}

gzFile sub_10000E9E8(gzFile result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  gzFile_s *v8;
  uint64_t v9;
  gzFile v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;

  v7 = (uint64_t)result;
  if (!*(_DWORD *)(a2 + 28))
  {
    sub_10000D7B4(a2, 1);
    sub_10000D9AC(v7, a2);
    *(_DWORD *)(a2 + 252) = 0;
    result = sub_100012C88(v7, a2, 1);
    if (!result)
      return result;
    v8 = result;
    *(_DWORD *)(a2 + 28) = 1;
    if (a4)
      goto LABEL_7;
LABEL_6:
    if (*(_DWORD *)(a3 + 32) < 0xDu)
      return result;
    goto LABEL_7;
  }
  v8 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_7:
  v9 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)v9 = 1145852723;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a3 + 32);
  *(_DWORD *)(v9 + 4) = sub_10000B93C((_BYTE *)v9, *(_DWORD *)(a3 + 32));
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 48));
  if (!v8)
  {
    v10 = sub_100012C88(v7, a2, 0);
    if (!v10)
    {
      *(_DWORD *)(a2 + 28) = 0;
      return (gzFile)pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
    }
    v8 = v10;
    *(_DWORD *)(a2 + 28) = 1;
  }
  v11 = gzwrite(v8, *(voidpc *)(a3 + 16), *(_DWORD *)(a3 + 32));
  if (gzflush(v8, 2))
  {
    v12 = sub_1000094B4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000167C8();
  }
  if (v11 == *(_DWORD *)(a3 + 32))
  {
    v13 = *(_QWORD *)a2 + *(_QWORD *)(a3 + 24);
    *(_QWORD *)a2 = v13;
    v14 = gzclose(v8);
    v15 = v14;
    if (a4 || v13 >= 0x400000)
    {
      if (v14)
      {
        if (*__error() == 28)
          *(_DWORD *)(a2 + 28) = 0;
        v18 = sub_1000094B4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100016620(a2, v15, v18);
        sub_10000D7B4(a2, 0);
        sub_10000D9AC(v7, a2);
      }
      *(_QWORD *)(*(_QWORD *)(a3 + 16) + 4) = 0xC00000000;
      *(_QWORD *)a2 = 0;
      *(_DWORD *)(a2 + 252) = 0;
    }
    else
    {
      *(_DWORD *)(a2 + 252) = 1;
    }
  }
  else
  {
    v16 = sub_1000094B4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10001672C(a3, a2, v16);
    if (*__error() == 28)
    {
      *(_DWORD *)(a2 + 28) = 0;
      gzclose(v8);
      *(_QWORD *)(*(_QWORD *)(a3 + 16) + 4) = 0xC00000000;
      v17 = sub_1000094B4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1000166C8();
      sub_10000D7B4(a2, 0);
      sub_10000D9AC(v7, a2);
    }
  }
  return (gzFile)pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
}

uint64_t sub_10000ECA8()
{
  pid_t v0;
  NSObject *v1;
  uint64_t result;
  unsigned int v3;
  unsigned int v4;
  _OWORD v5[2];
  const char *v6;
  pthread_attr_t v7;

  memset(&v7, 0, sizeof(v7));
  v6 = "/";
  memset(v5, 0, sizeof(v5));
  qword_1000206B0 = (uint64_t)malloc_default_zone();
  v0 = getpid();
  if (sub_100008974(v0, 0, (uint64_t)&v6, 1u, 0, 0, 30000000, *(_DWORD *)(qword_100020748 + 24), -1, 256, (uint64_t)sub_1000041F0, qword_100020748, 0, 0, v5, (unint64_t *)(qword_100020748 + 16)))
  {
    v1 = sub_1000094B4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      sub_100016888();
    return 22;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(qword_100020748 + 16) + 188) |= 0x20u;
    do
      v3 = __ldxr((unsigned int *)&dword_100020724);
    while (__stxr(v3 + 1, (unsigned int *)&dword_100020724));
    do
      v4 = __ldxr((unsigned int *)&dword_100020720);
    while (__stxr(v4 + 1, (unsigned int *)&dword_100020720));
    sub_100009F54((uint64_t (*)(void))sub_10000EE44);
    pthread_attr_init(&v7);
    pthread_attr_setdetachstate(&v7, 2);
    pthread_create(&qword_100021828, &v7, (void *(__cdecl *)(void *))sub_100002E7C, *(void **)(qword_100020748 + 16));
    pthread_attr_destroy(&v7);
    result = 0;
    __dmb(0xBu);
    dword_100020740 = 1;
  }
  return result;
}

uint64_t sub_10000EE44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 128);
  if (v2 && !*(_QWORD *)(v2 + 16))
    *(_QWORD *)(v2 + 16) = a2;
  return 0;
}

uint64_t sub_10000EE60(uint64_t a1)
{
  uint64_t v2;
  pthread_rwlock_t *v3;
  _QWORD v5[2];
  void *ptr;
  __int128 v7;

  v2 = *(_QWORD *)(a1 + 128);
  v3 = (pthread_rwlock_t *)(v2 + 2304);
  v5[0] = a1;
  v5[1] = v2;
  ptr = malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0x2A67FEB9uLL);
  v7 = xmmword_100019230;
  DWORD2(v7) = 12;
  sub_10000C04C(0, v3, (unsigned int (*)(uint64_t, uint64_t))sub_10000E8E0, (uint64_t)v5);
  sub_10000E9E8((gzFile)a1, *(_QWORD *)(a1 + 128), (uint64_t)v5, 1);
  malloc_zone_free((malloc_zone_t *)qword_1000206B8, ptr);
  return sub_10000C20C((uint64_t)v3);
}

void sub_10000EF08(uint64_t a1)
{
  void **v2;
  NSObject *v3;

  v2 = *(void ***)(a1 + 128);
  if (*(int *)(a1 + 36) < 1)
  {
    if (v2)
    {
      sub_10000C20C((uint64_t)(v2 + 288));
      free(*(void **)(*(_QWORD *)(a1 + 128) + 2536));
      free(*(void **)(*(_QWORD *)(a1 + 128) + 2504));
      free(v2[5]);
      free(v2);
      *(_QWORD *)(a1 + 128) = 0;
    }
  }
  else
  {
    v3 = sub_1000094B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100016944();
  }
}

uint64_t sub_10000EF9C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v4;
  NSObject *v5;
  char __str[1024];

  v1 = *(_QWORD *)(a1 + 128);
  if (v1)
  {
    if (dword_1000206C8 || v1 != qword_100020748)
    {
      if ((*(_DWORD *)(a1 + 32) & 1) != 0 || v1 != qword_100020748)
      {
        sub_10000EE60(a1);
        snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v1 + 256));
        utimes(__str, 0);
        if ((*(_DWORD *)(a1 + 32) & 0x200) != 0)
        {
          sub_10000D7B4(v1, 1);
          snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v1 + 256));
          unlink(__str);
          if (rmdir((const char *)(v1 + 256)))
          {
            v5 = sub_1000094B4();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              sub_1000169E0();
          }
        }
        if (!dword_1000206C8)
          *(_DWORD *)(a1 + 32) &= ~0x800u;
      }
      else
      {
        v4 = sub_1000094B4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          sub_1000169B4();
      }
    }
  }
  return 0;
}

uint64_t sub_10000F0FC()
{
  uint64_t result;

  *(_QWORD *)(qword_100020748 + 16) = 0;
  result = sub_100009F54((uint64_t (*)(void))sub_10000EF9C);
  qword_100020748 = 0;
  return result;
}

uint64_t sub_10000F134(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  pthread_rwlock_t *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v27;
  int8x8_t *v28;
  unsigned int v29;
  uid_t v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  int *v41;
  char *v42;
  unsigned int v43;
  pthread_rwlock_t *v44;
  int v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  statfs v51;
  char __str[1024];

  v50 = 0;
  v3 = (_DWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 32) & 0x50) != 0)
  {
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100016AE8();
  }
  else if ((*v3 & 0x90) == 0 && (*v3 & 4) != 0)
  {
    v6 = *(_DWORD *)(a2 + 112);
    if (!v6 || v6 == *(_DWORD *)a1)
    {
      v7 = *(_QWORD *)(a1 + 128);
      if (v7 && *(_QWORD *)(v7 + 16))
      {
        v8 = 0;
        v9 = *(_QWORD *)(a2 + 232);
        v10 = (pthread_rwlock_t *)(v7 + 48);
        v47 = (const char *)(v7 + 256);
        v44 = (pthread_rwlock_t *)(v7 + 48);
LABEL_11:
        pthread_rwlock_rdlock(v10);
        v11 = *(_DWORD *)(v7 + 32);
        if (v11 >= 1)
        {
          v12 = 0;
          v13 = *(_DWORD *)(v7 + 32);
          while (1)
          {
            v14 = v12 + v13;
            if (v12 + v13 >= 0)
              v15 = v12 + v13;
            else
              v15 = v14 + 1;
            LODWORD(v16) = v15 >> 1;
            v17 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8 * (v15 >> 1));
            if (v17 <= v9)
            {
              if (v17 >= v9)
              {
                if ((v14 + 3) <= 1)
LABEL_24:
                  LODWORD(v16) = v12 - (v12 > 0);
                v18 = *(unsigned __int16 *)(v7 + 248);
                v46 = *(unsigned __int16 *)(v7 + 250);
                while (1)
                {
                  v19 = v18;
                  v20 = v11;
                  pthread_rwlock_unlock(v44);
                  v45 = v20;
                  v43 = v20 - 1;
                  if ((int)v16 >= v20 - 1)
                  {
                    v18 = v19;
                  }
                  else
                  {
                    v16 = (int)v16;
                    v48 = v20 - 1;
                    v49 = 0;
                    v18 = v19;
                    while ((*(_DWORD *)(a2 + 188) & 0x1A) == 0)
                    {
                      if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0)
                        return 0;
                      pthread_rwlock_rdlock(v44);
                      if (__PAIR64__(v46, v19) != __PAIR64__(*(unsigned __int16 *)(v7 + 250), *(unsigned __int16 *)(v7 + 248)))
                      {
                        pthread_rwlock_unlock(v44);
                        *(_DWORD *)(a2 + 188) |= 1u;
                        v24 = v9;
                        if (v49)
                          v24 = v49;
                        v10 = (pthread_rwlock_t *)(v7 + 48);
                        v9 = v24;
                        goto LABEL_11;
                      }
                      snprintf(__str, 0x400uLL, "%s/%.16llx", v47, *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8 * v16));
                      v49 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8 * v16 + 8);
                      pthread_rwlock_unlock(v44);
                      if (sub_10000F7A8(a1, a2, __str, *(_QWORD *)(a2 + 232)))
                      {
                        memset(&v51, 0, 512);
                        if (statfs(*(const char **)(a1 + 8), &v51) || v51.f_fsid.val[0] != *(_DWORD *)a1)
                        {
                          v27 = sub_1000094B4();
                          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                            sub_100016A88();
                          return 0;
                        }
                      }
                      if (v48 == ++v16)
                      {
                        LODWORD(v16) = v43;
                        break;
                      }
                    }
                  }
                  sub_100007D3C(*(_QWORD *)(v7 + 16));
                  if (v8 <= 100)
                    v21 = 100;
                  else
                    v21 = v8;
                  v22 = v21 + 1;
                  while (1)
                  {
                    usleep(0x3E8u);
                    if ((*v3 & 0x90) != 0)
                      break;
                    if ((*v3 & 4) == 0)
                      break;
                    v23 = *(_QWORD *)(v7 + 16);
                    if (!v23 || *(_DWORD *)(v23 + 240) == *(_DWORD *)(v23 + 244))
                      break;
                    if (v22 == ++v8)
                    {
                      v8 = v22;
                      break;
                    }
                  }
                  if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0)
                    return 0;
                  pthread_rwlock_rdlock(v44);
                  if (v45 > *(_DWORD *)(*(_QWORD *)(a1 + 128) + 32)
                    || (_DWORD)v18 != *(unsigned __int16 *)(v7 + 248)
                    || v46 != *(unsigned __int16 *)(v7 + 250))
                  {
                    break;
                  }
                  v11 = *(_DWORD *)(v7 + 32);
                  if (v45 >= v11)
                  {
                    if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0 || !*(_QWORD *)(v7 + 16))
                    {
                      pthread_rwlock_unlock(v44);
                      return 0;
                    }
                    if (v45 >= 1)
                    {
                      v36 = *(_QWORD *)(v7 + 40);
                      if (v36)
                      {
                        snprintf(__str, 0x400uLL, "%s/%.16llx", v47, *(_QWORD *)(v36 + 8 * v43));
                        sub_10000F7A8(a1, a2, __str, *(_QWORD *)(a2 + 232));
                      }
                    }
                    goto LABEL_64;
                  }
                }
                *(_DWORD *)(a2 + 188) |= 1u;
LABEL_64:
                v28 = (int8x8_t *)sub_10000FD00(a1, v7, (unsigned int *)&v50 + 1);
                if ((*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*v3 & 4) != 0 && *(_QWORD *)(v7 + 16))
                {
                  pthread_rwlock_unlock(v44);
                  v29 = HIDWORD(v50);
                  if (HIDWORD(v50))
                  {
                    v28[1].i32[0] = HIDWORD(v50);
                    v30 = *(_DWORD *)(a2 + 252);
                    if (v30)
                    {
                      pthread_setugid_np(v30, *(_DWORD *)(a2 + 256));
                      v31 = *(const char **)(a2 + 344);
                      if (v31)
                      {
                        if (initgroups(v31, *(_DWORD *)(a2 + 256)) < 0)
                        {
                          v32 = sub_1000094B4();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                          {
                            v37 = *(_QWORD *)(a2 + 344);
                            v38 = *(_DWORD *)(a2 + 252);
                            v39 = *(_DWORD *)(a2 + 256);
                            v40 = *__error();
                            v41 = __error();
                            v42 = strerror(*v41);
                            v51.f_bsize = 136316162;
                            *(_QWORD *)&v51.f_iosize = v37;
                            WORD2(v51.f_blocks) = 1024;
                            *(_DWORD *)((char *)&v51.f_blocks + 6) = v38;
                            WORD1(v51.f_bfree) = 1024;
                            HIDWORD(v51.f_bfree) = v39;
                            LOWORD(v51.f_bavail) = 1024;
                            *(_DWORD *)((char *)&v51.f_bavail + 2) = v40;
                            HIWORD(v51.f_bavail) = 2080;
                            v51.f_files = (uint64_t)v42;
                            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "scan_for_old_events: initgroups failed for user %s uid %d gid %d (err: %d/%s)", (uint8_t *)&v51, 0x28u);
                          }
                        }
                      }
                    }
                    if (sub_10000FE68(a1, a2, v28, v29, 0, *(_QWORD *)(a2 + 232), &v50, 0, 0))
                    {
                      v33 = sub_1000094B4();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                        sub_100016A5C();
                    }
                  }
                  if (*(_DWORD *)(a2 + 252))
                    pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
                }
                else
                {
                  pthread_rwlock_unlock(v44);
                }
                free(v28);
                return 0;
              }
              v12 = v16 + 1;
            }
            else
            {
              v13 = v16;
            }
            if (v12 >= v13)
              goto LABEL_24;
          }
        }
        v12 = 0;
        goto LABEL_24;
      }
      v25 = sub_1000094B4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v34 = *(_QWORD *)(a1 + 8);
        if (v7)
          v35 = *(_QWORD *)(v7 + 16);
        else
          v35 = 0;
        v51.f_bsize = 136315650;
        *(_QWORD *)&v51.f_iosize = v34;
        WORD2(v51.f_blocks) = 2048;
        *(uint64_t *)((char *)&v51.f_blocks + 6) = v7;
        HIWORD(v51.f_bfree) = 2048;
        v51.f_bavail = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "scan_old: bailing out because device mounted @ %s has dls %p and dls->fci %p", (uint8_t *)&v51, 0x20u);
      }
    }
  }
  return 0;
}

uint64_t sub_10000F7A8(uint64_t a1, uint64_t a2, const char *a3, unint64_t a4)
{
  int v8;
  int v9;
  gzFile v10;
  gzFile_s *v11;
  int8x8_t *v12;
  int8x8_t *v13;
  uid_t v14;
  const char *v15;
  NSObject *v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v22;
  int v23;
  _BOOL4 v24;
  uid_t v25;
  uid_t v26;
  gid_t v27;
  gid_t v28;
  signed int v29;
  unsigned int v30;
  int v31;
  NSObject *v32;
  const char *v33;
  int v34;
  int *v35;
  char *v36;
  int v37;
  gzFile_s *file;
  uint64_t v39;
  int v40;
  stat v41;
  int v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  _BYTE v46[10];
  _BYTE v47[6];
  __int16 v48;
  _BYTE v49[10];
  __int16 v50;
  gid_t v51;
  __int16 v52;
  gid_t v53;

  v42 = 0;
  if (qword_1000228D8 != -1)
    dispatch_once(&qword_1000228D8, &stru_10001C7C8);
  memset(&v41, 0, sizeof(v41));
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000228E0, 0xFFFFFFFFFFFFFFFFLL);
  v8 = open(a3, 0x20000000);
  v9 = v8;
  if (v8 < 0 || fstat(v8, &v41) || (v41.st_mode & 0xF000) != 0x8000)
  {
    if (a1
      && (*(_DWORD *)(a1 + 32) & 0x1000) == 0
      && (v20 = sub_1000094B4(), os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)))
    {
      v23 = *__error();
      v24 = (v41.st_mode & 0xF000) == 0x8000;
      v25 = getuid();
      v26 = geteuid();
      v27 = getgid();
      v28 = getegid();
      *(_DWORD *)buf = 136316930;
      v44 = a3;
      v45 = 1024;
      *(_DWORD *)v46 = v9;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v23;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = v24;
      v48 = 1024;
      *(_DWORD *)v49 = v25;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v26;
      v50 = 1024;
      v51 = v27;
      v52 = 1024;
      v53 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "read_disk_log: problems with history file: %s (fd %d, errno %d ; is_reg %d; uid %d/%d gid %d/%d)",
        buf,
        0x36u);
      if (v9 < 0)
        goto LABEL_31;
    }
    else if (v9 < 0)
    {
LABEL_31:
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
      return 22;
    }
    close(v9);
    goto LABEL_31;
  }
  if (!v41.st_size)
  {
    close(v9);
LABEL_33:
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return 0;
  }
  v10 = gzdopen(v9, "r");
  if (v10)
  {
    v11 = v10;
    v12 = (int8x8_t *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0xE67EBE19uLL);
    if (v12)
    {
      v13 = v12;
      file = v11;
      v14 = *(_DWORD *)(a2 + 252);
      if (v14)
      {
        pthread_setugid_np(v14, *(_DWORD *)(a2 + 256));
        v15 = *(const char **)(a2 + 344);
        if (v15)
        {
          if (initgroups(v15, *(_DWORD *)(a2 + 256)) < 0)
          {
            v16 = sub_1000094B4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v33 = *(const char **)(a2 + 344);
              v37 = *(_DWORD *)(a2 + 252);
              v40 = *(_DWORD *)(a2 + 256);
              v34 = *__error();
              v35 = __error();
              v36 = strerror(*v35);
              *(_DWORD *)buf = 136316162;
              v44 = v33;
              v45 = 1024;
              *(_DWORD *)v46 = v37;
              *(_WORD *)&v46[4] = 1024;
              *(_DWORD *)&v46[6] = v40;
              *(_WORD *)v47 = 1024;
              *(_DWORD *)&v47[2] = v34;
              v48 = 2080;
              *(_QWORD *)v49 = v36;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "read_disk_log: initgroups failed for user %s uid %d gid %d (err: %d/%s)", buf, 0x28u);
            }
          }
        }
      }
      if ((*(_DWORD *)(a1 + 32) & 0x80) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
      {
        v17 = 0;
        v29 = 0;
        v39 = 0;
        v18 = 0;
        do
        {
          if ((*(_DWORD *)(a2 + 188) & 2) != 0)
            break;
          v30 = 0x40000 - v29 >= 0x10000 ? 0x10000 : 0x40000 - v29;
          v31 = gzread(file, (char *)v13 + v29, v30);
          v17 = v31;
          if (v31 < 1)
            break;
          *(_DWORD *)buf = 0;
          v39 += v31;
          if (!v29 && v31 <= 0xB)
          {
            v32 = sub_1000094B4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              sub_100016BC0();
            goto LABEL_17;
          }
          v29 += v31;
          if (!sub_10000FE68(a1, a2, v13, v29, 1, a4, &v42, (int *)buf, 1))
            v18 = 1;
          if (v42 && *(_DWORD *)buf == 2)
          {
            v29 = 0x40000 - v42;
            __memmove_chk(v13, &v13->i8[v42], 0x40000 - v42, 0x40000);
          }
          else if (v42)
          {
            v29 = 0;
          }
        }
        while ((*(_DWORD *)(a1 + 32) & 0x80) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0);
      }
      else
      {
        v17 = 0;
        v39 = 0;
LABEL_17:
        v18 = 0;
      }
      gzclose(file);
      malloc_zone_free((malloc_zone_t *)qword_1000206B8, v13);
      if (!v18
        && (*(_DWORD *)(a1 + 32) & 0x80) == 0
        && (*(_DWORD *)(a1 + 32) & 4) != 0
        && (*(_DWORD *)(a2 + 188) & 2) == 0)
      {
        v19 = sub_1000094B4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = a3;
          v45 = 2048;
          *(_QWORD *)v46 = v39;
          *(_WORD *)&v46[8] = 1024;
          *(_DWORD *)v47 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "read_disk_log: error processing log file %s (total_read %lld, size %d)", buf, 0x1Cu);
        }
      }
      if (*(_DWORD *)(a2 + 252))
        pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
      goto LABEL_33;
    }
    gzclose(v11);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return 12;
  }
  else
  {
    v22 = sub_1000094B4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100016B60();
    close(v9);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return *__error();
  }
}

_DWORD *sub_10000FD00(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v4;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v9;
  _DWORD *v10;
  NSObject *v11;
  uint64_t v13;
  int v14;
  _QWORD v15[4];
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;

  v4 = *(_DWORD *)(a2 + 2524);
  if (!v4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v16 = 0;
  v6 = *(_QWORD *)(a2 + 2528) + 24 * v4;
  v7 = v6 + 4096;
  if (v6 + 4096 < 0)
  {
    v11 = sub_1000094B4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a2 + 2528);
      v14 = *(_DWORD *)(a2 + 2524);
      *(_DWORD *)buf = 134218496;
      v18 = v7;
      v19 = 2048;
      v20 = v13;
      v21 = 1024;
      v22 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "in mem disk log size is bad: 0x%zx (string size: %zu num items %d)\n", buf, 0x1Cu);
    }
    v4 = 0;
    goto LABEL_8;
  }
  v9 = malloc_type_malloc(v6 + 4096, 0x5B6FCD30uLL);
  v10 = v9;
  if (v9)
  {
    v15[0] = 0;
    v15[1] = a2;
    v15[2] = v9;
    v15[3] = v7;
    LODWORD(v16) = 12;
    *(_QWORD *)v9 = 1145852723;
    v9[2] = 12;
    sub_10000C04C(a1, (pthread_rwlock_t *)(a2 + 2304), (unsigned int (*)(uint64_t, uint64_t))sub_10000BF70, (uint64_t)v15);
    v4 = v16;
    v10[2] = v16;
  }
  else
  {
    v4 = 0;
  }
LABEL_9:
  *a3 = v4;
  return v10;
}

uint64_t sub_10000FE68(uint64_t a1, uint64_t a2, int8x8_t *a3, unsigned int a4, int a5, unint64_t a6, _DWORD *a7, int *a8, char a9)
{
  int v16;
  char v17;
  int v18;
  __int32 v19;
  int v20;
  uint64_t v21;
  __int32 v22;
  unsigned int v23;
  int v24;
  __int32 v25;
  unsigned int *v26;
  const char **v27;
  const char **v28;
  uint64_t v29;
  size_t v30;
  size_t v31;
  uint64_t v32;
  const char **v33;
  int v34;
  const char **v35;
  const char *v36;
  size_t v37;
  size_t v38;
  int v40;
  BOOL v41;
  const char *v42;
  char *v43;
  uint64_t v44;
  _DWORD *v45;
  int *v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  char *v53;
  unint64_t v54;
  __int32 v55;
  unsigned int *v56;
  uint64_t v57;
  char *v58;
  int v59;
  int v60;
  BOOL v61;
  int v62;
  char *v63;
  const char *v64;
  int v65;
  uint64_t v66;
  size_t v67;
  char *v68;
  const char **v69;
  size_t v70;
  const char *v71;
  const char *v72;
  __int128 v73;
  int v74;
  char *v75;
  int v76;
  __int128 v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  const char *v85;
  size_t v86;
  uint64_t v87;
  char *v88;
  const char *v89;
  __int128 v90;
  __int128 v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  __int32 v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v144;
  uint64_t v145;
  char *__s1;
  unsigned int v147;
  _OWORD *v148;
  size_t __size;
  unsigned int *v150;
  uint64_t v151;
  unint64_t v152;
  _DWORD *v153;
  size_t v154;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  stat v159;
  uint64_t v160;
  uint64_t v161;
  char *__endptr;
  char *__s2;
  unsigned int v164;
  uint64_t v165;
  unint64_t v166;
  unsigned int v167;
  stat v168;
  char v169[1024];
  size_t v170;

  v167 = 0;
  v166 = 0;
  v165 = 0;
  v164 = 0;
  v16 = a3->i32[0];
  v17 = 1;
  if (a3->i32[0] > 1145852721)
  {
    if (v16 == 1145852722)
      goto LABEL_9;
    v18 = 1145852723;
  }
  else
  {
    if (v16 == 844319812)
      goto LABEL_9;
    v18 = 861097028;
  }
  if (v16 == v18)
    v17 = 3;
  else
    v17 = 0;
LABEL_9:
  __s2 = 0;
  __endptr = 0;
  bzero(&v161, 0x588uLL);
  v160 = a2;
  *a7 = 0;
  if (a8)
    *a8 = 0;
  v19 = a3->i32[0];
  v156 = a2;
  if (a3->i32[0] > 1145852720)
  {
    if ((v19 - 1145852721) < 3)
    {
      v20 = a3[1].i32[0];
      goto LABEL_18;
    }
  }
  else if (v19 == 827542596 || v19 == 844319812 || v19 == 861097028)
  {
    v20 = bswap32(a3[1].u32[0]);
    goto LABEL_18;
  }
  v20 = a3[1].i32[0];
  if (v20 > 0x40000)
  {
    v99 = sub_1000094B4();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      sub_100016F2C();
    return 22;
  }
LABEL_18:
  if (a5)
  {
    v21 = 22;
    if (v20 > 0x40000 || v20 > a4)
      return v21;
    v22 = a3->i32[1];
    a3->i32[1] = 0;
    v23 = sub_10000B93C(a3, v20);
    if (v19 == 827542596 || v19 == 861097028 || v19 == 844319812)
      v23 = bswap32(v23);
    if (v22 == v23)
    {
      if (a8)
      {
        v24 = 2;
LABEL_31:
        *a8 = v24;
      }
    }
    else
    {
      if (v22 != sub_100012A70(a3, v20))
      {
        v100 = sub_1000094B4();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          sub_100016ECC();
        return v21;
      }
      if (a8)
      {
        v24 = 1;
        goto LABEL_31;
      }
    }
  }
  v25 = a3->i32[0];
  if (a3->i32[0] == 827542596 || v25 == 861097028 || v25 == 844319812)
    sub_100012ADC(a3, (int)a4, v17);
  v26 = (unsigned int *)(v156 + 128);
  v27 = (const char **)malloc_type_malloc(16 * *(int *)(v156 + 128), 0x1010040466105CCuLL);
  if (!v27)
  {
    v92 = sub_1000094B4();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      sub_100016C34((uint64_t)v26, v92, v93, v94, v95, v96, v97, v98);
    return 12;
  }
  v152 = a6;
  v153 = a7;
  v28 = v27;
  __strlcpy_chk(v169, *(_QWORD *)(a1 + 16), 1024, 1024);
  v29 = *(_QWORD *)(a1 + 16);
  v30 = strlen((const char *)v29);
  v31 = v30;
  v154 = v30;
  if (*(_BYTE *)v29 == 47)
  {
    v154 = v30;
    if (*(_BYTE *)(v29 + 1))
    {
      *(_WORD *)&v169[v30] = 47;
      v154 = v30 + 1;
    }
  }
  v150 = (unsigned int *)(v156 + 128);
  v32 = *v26;
  if ((int)v32 >= 1)
  {
    v33 = *(const char ***)(v156 + 136);
    v34 = *(_DWORD *)(v156 + 112);
    v35 = v28 + 1;
    do
    {
      v36 = *v33;
      v37 = strlen(*v33);
      *(v35 - 1) = (const char *)v37;
      if (v34)
        goto LABEL_43;
      v38 = v37;
      if (!strncmp((const char *)v29, v36, v31) && v38 >= v31)
      {
        if (v31 == 1 || ((v40 = v36[v31], v40 != 47) ? (v41 = v40 == 0) : (v41 = 1), v41))
        {
          v42 = &v36[v31];
          *v35 = &v36[v31];
          if (v36[v31] == 47)
            *v35 = ++v42;
          *(v35 - 1) = (const char *)(&v36[v38] - v42);
          goto LABEL_44;
        }
      }
      if (*v36 != 47 || v36[1])
      {
LABEL_43:
        *v35 = v36;
      }
      else
      {
        *(v35 - 1) = 0;
        *v35 = (const char *)&unk_1000187EA;
      }
LABEL_44:
      v35 += 2;
      ++v33;
      --v32;
    }
    while (v32);
  }
  v43 = (char *)&a3[1] + 4;
  __size = 1024 - v154;
  v44 = v156;
  v148 = (_OWORD *)(v156 + 260);
  v147 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_NO_REPORT | 1;
  v151 = v156 + 352;
  v45 = v153;
  v46 = (int *)a1;
LABEL_63:
  v47 = a3[1].i32[0];
  v48 = (unint64_t)a3 + v47;
  while (1)
  {
    if ((unint64_t)v43 >= v48)
      goto LABEL_181;
    v49 = v43;
    v50 = 0;
    __s2 = v43;
    v51 = (char *)a3 + v47;
    while (v43[v50])
    {
      if (v48 - (_QWORD)v43 == ++v50)
        goto LABEL_70;
    }
    v51 = &v43[v50];
LABEL_70:
    v52 = v51 - v43 + 1;
    v170 = v52;
    if (v52 >= 0x401)
    {
      v101 = sub_1000094B4();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        sub_100016C9C(v101, v102, v103, v104, v105, v106, v107, v108);
LABEL_181:
      v21 = 0;
      goto LABEL_195;
    }
    v53 = &v43[v52];
    if ((unint64_t)&v43[v52] >= v48)
      break;
    if (a9 && ((v46[8] & 0xD0) != 0 || (v46[8] & 4) == 0))
      goto LABEL_181;
    if ((unint64_t)(v53 + 8) > v48)
    {
      v111 = sub_1000094B4();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        sub_100016D0C(v111, v112, v113, v114, v115, v116, v117, v118);
      goto LABEL_194;
    }
    v43 = v53 + 12;
    v54 = *(_QWORD *)v53;
    v166 = *(_QWORD *)v53;
    if ((unint64_t)(v53 + 12) > v48)
    {
      v119 = sub_1000094B4();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        sub_100016D7C(v119, v120, v121, v122, v123, v124, v125, v126);
      goto LABEL_194;
    }
    v167 = *((_DWORD *)v53 + 2);
    v55 = a3->i32[0];
    if (a3->i32[0] == 1145852722 || v55 == 844319812)
    {
      if ((unint64_t)(v53 + 20) > v48)
      {
        v127 = sub_1000094B4();
        if (!os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          goto LABEL_194;
        goto LABEL_189;
      }
      v165 = *(_QWORD *)v43;
      v43 = v53 + 20;
    }
    if (v55 == 1145852723 || v55 == 861097028)
    {
      v56 = (unsigned int *)(v43 + 8);
      if ((unint64_t)(v43 + 8) > v48)
      {
        v127 = sub_1000094B4();
        if (!os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          goto LABEL_194;
LABEL_189:
        sub_100016DEC(v127, v128, v129, v130, v131, v132, v133, v134);
        goto LABEL_194;
      }
      v57 = *(_QWORD *)v43;
      v43 += 12;
      v165 = v57;
      if ((unint64_t)v43 > v48)
      {
        v135 = sub_1000094B4();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
          sub_100016E5C(v135, v136, v137, v138, v139, v140, v141, v142);
        goto LABEL_194;
      }
      v164 = *v56;
    }
    if (v54 > v152 || (*(_DWORD *)(v44 + 188) & 0x4000) != 0)
    {
      v144 = strncmp(v49, ".docid/", 7uLL);
      if (v144)
      {
        if (strncmp(v49, ".activity/1/", 0xCuLL))
        {
          strlcpy(&v169[v154], v49, __size);
          v145 = 0;
          v58 = v169;
LABEL_104:
          __s1 = v58;
          v66 = *v150;
          if ((int)v66 >= 1)
          {
            v67 = v170 - 1;
            v68 = __s2;
            v69 = v28 + 1;
            while (1)
            {
              v70 = (size_t)*(v69 - 1);
              if (v70 <= v67)
              {
                v71 = *v69;
                if (v70 >= 2 && v71[v70 - 1] == 47)
                  --v70;
                if (!strncmp(v71, v68, v70) && (v70 < 2 || !v68[v70] || v68[v70] == 47))
                  break;
              }
              v69 += 2;
              if (!--v66)
              {
LABEL_115:
                v45 = v153;
                v46 = (int *)a1;
                v44 = v156;
                goto LABEL_63;
              }
            }
            v46 = (int *)a1;
            v44 = v156;
            v45 = v153;
            if (!*(_DWORD *)(v156 + 112) || *v68 != 47)
            {
              if (*(_DWORD *)(v156 + 252))
              {
                v72 = __s1;
                memset(&v168, 0, sizeof(v168));
                if (HIDWORD(v145))
                  v72 = *(const char **)(a1 + 16);
                v73 = *(_OWORD *)(v156 + 276);
                *(_OWORD *)&v159.st_dev = *v148;
                *(_OWORD *)&v159.st_uid = v73;
                v74 = sandbox_check_by_audit_token(&v159, "file-read-metadata", v147);
                if (lstat(v72, &v168) | v74)
                {
                  if (*__error() != 2)
                  {
LABEL_169:
                    v44 = v156;
                    goto LABEL_63;
                  }
                  memset(&v159, 0, sizeof(v159));
                  v75 = sub_10001308C(v72);
                  v76 = access(v75, 4);
                  v77 = *(_OWORD *)(v156 + 276);
                  v157 = *v148;
                  v158 = v77;
                  v78 = sandbox_check_by_audit_token(&v157, "file-read-metadata", v147);
                  free(v75);
                  if (v76)
                  {
                    v79 = *v150;
                    if ((int)v79 < 1)
                      goto LABEL_168;
                    v80 = 0;
                    v81 = *(_QWORD *)(v156 + 136);
                    v82 = 8 * v79;
                    while (!strstr(__s1, *(const char **)(v81 + v80)))
                    {
                      v80 += 8;
                      if (v82 == v80)
                        goto LABEL_168;
                    }
                    v89 = *(const char **)(v81 + v80);
                    if (!*(_DWORD *)(v156 + 112) || *v89)
                    {
                      if (!lstat(v89, &v159) && v159.st_uid == *(_DWORD *)(v156 + 252))
                      {
                        v90 = *(_OWORD *)(v156 + 276);
                        v157 = *v148;
                        v158 = v90;
                        goto LABEL_167;
                      }
                      goto LABEL_168;
                    }
                    if (lstat(".", &v159) || v159.st_uid != *(_DWORD *)(v156 + 252))
                      goto LABEL_168;
                    v91 = *(_OWORD *)(v156 + 276);
                    v157 = *v148;
                    v158 = v91;
LABEL_167:
                    if (sandbox_check_by_audit_token(&v157, "file-read-metadata", v147))
                    {
LABEL_168:
                      v46 = (int *)a1;
                      goto LABEL_169;
                    }
                  }
                  else if (v78)
                  {
                    goto LABEL_168;
                  }
                }
                v68 = __s2;
              }
              v83 = 0;
              v84 = 0;
              do
              {
                v85 = *(const char **)(v151 + v83);
                if (!v85)
                  break;
                v86 = strlen(*(const char **)(v151 + v83));
                if (*(_DWORD *)(v156 + 112))
                {
                  if (!strncmp(v68, v85, v86))
                    v84 = 1;
                }
                else if (!strncmp(__s1, v85, v86))
                {
                  goto LABEL_115;
                }
                v83 += 8;
                v45 = v153;
              }
              while (v83 != 64);
              v46 = (int *)a1;
              v44 = v156;
              if (!v84 && (v166 > v152 || (*(_DWORD *)(v156 + 188) & 0x4000) != 0))
              {
                if (!*(_QWORD *)(v156 + 208) || (*(_DWORD *)(v156 + 188) & 2) != 0)
                  goto LABEL_181;
                if (v166 > *(_QWORD *)(v156 + 168) || (*(_DWORD *)(v156 + 188) & 0x4000) != 0)
                  *(_QWORD *)(v156 + 168) = v166;
                if (!*(_DWORD *)(v156 + 112) && *v68 != 47)
                {
                  v87 = v154;
                  if (HIDWORD(v145))
                    v87 = 1;
                  v170 += v87;
                  v68 = __s1;
                  __s2 = __s1;
                }
                if (((v145 | ((*(_DWORD *)(v156 + 188) & 0x100u) >> 8)) & 1) == 0 && v144)
                {
                  v88 = strrchr(v68, 47);
                  if (v88 > v68)
                  {
                    v88[1] = 0;
                    v170 = strlen(v68) + 1;
                  }
                  v167 &= 0xFE23F800;
                }
                v21 = sub_1000131C4((unsigned int *)&v160, &v170, (const char **)&__s2, &v167, (unsigned int *)a1, &v166, &v165, &v164);
                if ((_DWORD)v21 && (_DWORD)v21 != 268435460)
                  goto LABEL_195;
              }
            }
          }
          goto LABEL_63;
        }
        v62 = strtoull(v49 + 12, &__endptr, 10);
        v60 = *v46;
        LODWORD(v145) = 1;
        v63 = &v169[v154];
        if (*v46 != v62)
        {
          v64 = ".activity/1/%lld";
          goto LABEL_100;
        }
LABEL_99:
        strlcpy(v63, v49, __size);
      }
      else
      {
        v59 = strtoull(v49 + 7, &__endptr, 10);
        if (!strncmp(v49, ".activity/1/", 0xCuLL))
        {
          v65 = strtoull(v49 + 12, &__endptr, 10);
          v60 = *v46;
          LODWORD(v145) = 1;
          v61 = *v46 == v65;
        }
        else
        {
          LODWORD(v145) = 0;
          v60 = *v46;
          v61 = *v46 == v59;
        }
        v63 = &v169[v154];
        if (v61)
        {
          v44 = v156;
          goto LABEL_99;
        }
        v64 = ".docid/%lld";
        v44 = v156;
LABEL_100:
        snprintf(v63, __size, v64, v60);
        if (__endptr)
          strlcat(v63, __endptr, __size);
        __s2 = v63;
        v170 = strlen(v63) + 1;
      }
      HIDWORD(v145) = 1;
      v58 = &v169[v154 - 1];
      goto LABEL_104;
    }
  }
  v109 = sub_1000094B4();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
  {
    v110 = a3[1].i32[0];
    v168.st_dev = 134218240;
    *(_QWORD *)&v168.st_mode = v53 - (char *)a3;
    WORD2(v168.st_ino) = 1024;
    *(_DWORD *)((char *)&v168.st_ino + 6) = v110;
    _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "process_disk_event_buf: ptr out-of-bounds (%ld > max %d)", (uint8_t *)&v168, 0x12u);
  }
LABEL_194:
  v21 = 22;
LABEL_195:
  sub_100013370((uint64_t)&v160);
  *v45 = a3[1].i32[0];
  free(v28);
  return v21;
}

uint64_t sub_100010BEC(uint64_t a1)
{
  int v2;
  uint64_t v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  uint64_t v18;
  int v19;
  char *v20;
  char __s[1024];
  size_t v22;

  v18 = 0;
  v17 = 0;
  if (*(_QWORD *)(a1 + 232) == -1)
    return 0;
  v2 = dword_100020740;
  if (dword_100020740)
  {
LABEL_3:
    v3 = sub_100009F54((uint64_t (*)(void))sub_10000F134);
  }
  else
  {
    while (v2 != 10)
    {
      v4 = v2;
      if ((*(_DWORD *)(a1 + 188) & 0x1A) == 0)
      {
        usleep(0x3D090u);
        v2 = v4 + 1;
        if (!dword_100020740)
          continue;
      }
      if (v4 < 9)
        goto LABEL_3;
      break;
    }
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100017090();
    v3 = 0;
  }
  if (*(_QWORD *)(a1 + 208) && (*(_DWORD *)(a1 + 188) & 2) == 0)
  {
    if (**(_QWORD **)(a1 + 136))
    {
      if ((*(_DWORD *)(a1 + 188) & 1) != 0 && (*(_DWORD *)(a1 + 188) & 0x4000) == 0)
        v3 = sub_100010E20(a1);
      if (!(_DWORD)v3)
      {
        __strlcpy_chk(__s, **(_QWORD **)(a1 + 136), 1024, 1024);
        v22 = strlen(__s) + 1;
        v20 = __s;
        v19 = 0x8000000;
        if (!*(_QWORD *)(a1 + 168))
          *(_QWORD *)(a1 + 168) = *(_QWORD *)(a1 + 232);
        v6 = (*(uint64_t (**)(_QWORD, uint64_t, size_t *, char **, int *, _QWORD, uint64_t, uint64_t *, int *))(a1 + 208))(*(_QWORD *)(a1 + 216), 1, &v22, &v20, &v19, 0, a1 + 168, &v18, &v17);
        v3 = v6;
        if ((_DWORD)v6)
        {
          if ((_DWORD)v6 == 268435459)
            *(_DWORD *)(a1 + 188) |= 2u;
          v7 = sub_1000094B4();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_10001701C(a1, v3, v7);
          *(_DWORD *)(a1 + 188) |= 0x200u;
        }
      }
    }
    else
    {
      v8 = sub_1000094B4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100016FAC(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  return v3;
}

uint64_t sub_100010E20(uint64_t a1)
{
  unint64_t v2;
  uint64_t (*v3)(_QWORD, uint64_t, uint64_t *, const char **, int *, int *, unint64_t *, uint64_t *, int *);
  uint64_t result;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;

  v11 = **(const char ***)(a1 + 136);
  v8 = strlen(v11) + 1;
  v9 = 0;
  v6 = 0x40000000;
  v7 = 0;
  v2 = *(_QWORD *)(a1 + 152);
  v10 = v2;
  if (v2 > *(_QWORD *)(a1 + 160))
    *(_QWORD *)(a1 + 160) = v2;
  v5 = 0;
  v3 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t *, const char **, int *, int *, unint64_t *, uint64_t *, int *))(a1 + 208);
  if (!v3)
    return 0;
  result = v3(*(_QWORD *)(a1 + 216), 1, &v8, &v11, &v6, &v5, &v10, &v9, &v7);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 268435459)
    {
      *(_DWORD *)(a1 + 188) |= 2u;
      return 268435459;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 188) &= ~1u;
    *(_QWORD *)(a1 + 152) = 0;
  }
  return result;
}

uint64_t sub_100010F24(int a1, char *a2)
{
  uint64_t result;
  uint64_t v5;
  const char *v6;
  size_t v7;

  result = sub_100007EB0();
  if ((_DWORD)result)
  {
    sub_1000075A8((uint64_t)&unk_100021758);
    v5 = sub_100004D38(a1);
    if (v5)
    {
      if ((*(_DWORD *)(v5 + 32) & 0x40) != 0)
      {
        strcpy(a2, "NO-UUID-VOLUME-IS-IGNORED");
      }
      else if (*(_DWORD *)v5 == a1)
      {
        v6 = (const char *)(v5 + 64);
        v7 = strlen((const char *)(v5 + 64));
        strncpy(a2, v6, v7);
      }
      else
      {
        strcpy(a2, "NO-UUID-UNKNOWN-DEVICE");
      }
    }
    else
    {
      strcpy(a2, "NO-UUID-NO-DEV-INFO");
    }
    return sub_100007528((uint64_t)&unk_100021758);
  }
  else
  {
    strcpy(a2, "NO-UUID-NO-DEV-INFO");
  }
  return result;
}

uint64_t sub_10001101C(_QWORD *a1)
{
  uint64_t result;

  result = sub_100007EB0();
  if ((_DWORD)result)
    *a1 = qword_1000206D0[dword_1000206E0];
  return result;
}

uint64_t sub_100011058(int a1, unint64_t a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  stat v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  char __str[1024];

  result = sub_100007EB0();
  if ((_DWORD)result)
  {
    memset(&v18, 0, sizeof(v18));
    sub_1000075A8((uint64_t)&unk_100021758);
    *a3 = 0;
    v7 = sub_100004D38(a1);
    if (v7)
    {
      v8 = v7;
      if ((*(_DWORD *)(v7 + 32) & 0x40) == 0)
      {
        v9 = *(_QWORD *)(v7 + 128);
        if (v9)
        {
          v10 = *(unsigned int *)(v9 + 32);
          if ((int)v10 >= 1)
          {
            while (1)
            {
              v11 = v10 - 1;
              snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(*(_QWORD *)(v8 + 128) + 256), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 128) + 40) + 8 * (v10 - 1)));
              if (!lstat(__str, &v18)
                && (v18.st_mode & 0xF000) == 0x8000
                && v18.st_ctimespec.tv_sec <= a2
                && v18.st_size > 0)
              {
                break;
              }
              --v10;
              if ((unint64_t)(v11 + 1) <= 1)
                goto LABEL_11;
            }
            if ((v10 & 0xFFFFFFFE) == 0)
            {
LABEL_11:
              v12 = sub_1000094B4();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                sub_1000171A4();
              *a3 = 0;
              return sub_100007528((uint64_t)&unk_100021758);
            }
            v13 = sub_10000DE20(*(_QWORD *)(v8 + 128), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 128) + 40) + 8 * (v10 - 1)), a3);
            if (v13)
            {
              v14 = v13;
              *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 128) + 40) + 8 * (v10 - 2));
              v15 = sub_1000094B4();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 128) + 40) + 8 * (v10 - 1));
                v17 = *a3;
                *(_DWORD *)buf = 67109888;
                v20 = v10 - 1;
                v21 = 2048;
                v22 = v17;
                v23 = 1024;
                v24 = v14;
                v25 = 2048;
                v26 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to get last id from log file %d so using last id == 0x%llx (ret %d; %.16llx)\n",
                  buf,
                  0x22u);
              }
            }
          }
        }
      }
    }
    return sub_100007528((uint64_t)&unk_100021758);
  }
  return result;
}

uint64_t sub_10001128C(int a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  NSObject *v11;
  int v13;
  char *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  stat v20;
  char __str[773];
  uint8_t buf[4];
  char *v23;

  if (!sub_100007EB0())
    return 0xFFFFFFFFLL;
  sub_1000075A8((uint64_t)&unk_100021758);
  v4 = sub_100004D38(a1);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  memset(&v20, 0, sizeof(v20));
  if ((*(_DWORD *)(v4 + 32) & 0x40) != 0 || (v6 = *(_QWORD *)(v4 + 128)) == 0 || !*(_DWORD *)(v6 + 32))
  {
    sub_100007528((uint64_t)&unk_100021758);
    return 0xFFFFFFFFLL;
  }
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v6 + 48));
  v7 = *(_QWORD *)(v5 + 128);
  if (*(int *)(v7 + 32) < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8 * v8);
      if (a2 != -1 && v10 >= a2)
        break;
      snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(v7 + 256), v10);
      if (!lstat(__str, &v20) && (v20.st_mode & 0xF000) == 0x8000)
      {
        v11 = sub_1000094B4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v23 = __str;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "    purge_events: deleting: %s", buf, 0xCu);
        }
        unlink(__str);
        ++v9;
      }
      ++v8;
      v7 = *(_QWORD *)(v5 + 128);
    }
    while (v8 < *(int *)(v7 + 32));
    if (v9)
    {
      snprintf((char *)buf, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v7 + 256));
      unlink((const char *)buf);
      sub_10000D9AC(v5, *(_QWORD *)(v5 + 128));
      v7 = *(_QWORD *)(v5 + 128);
    }
  }
  v13 = *(_DWORD *)(v7 + 32);
  v14 = *(char **)(v7 + 40);
  if (v13 <= v9)
  {
    free(v14);
    v18 = *(_QWORD *)(v5 + 128);
    *(_QWORD *)(v18 + 32) = 0;
    *(_QWORD *)(v18 + 40) = 0;
    ++*(_WORD *)(v18 + 248);
    v19 = 1;
  }
  else
  {
    memmove(v14, &v14[8 * v9], 8 * (v13 - v9));
    v15 = *(_QWORD *)(v5 + 128);
    v16 = *(_DWORD *)(v15 + 36);
    v17 = *(_DWORD *)(v15 + 32) - v9;
    *(_DWORD *)(v15 + 32) = v17;
    bzero((void *)(*(_QWORD *)(v15 + 40) + 8 * v17), 8 * (v16 - v17));
    v18 = *(_QWORD *)(v5 + 128);
    v19 = *(_WORD *)(v18 + 250) + 1;
  }
  *(_WORD *)(v18 + 250) = v19;
  pthread_rwlock_unlock((pthread_rwlock_t *)(v18 + 48));
  sub_100007528((uint64_t)&unk_100021758);
  return 0;
}

uint64_t sub_100011530()
{
  NSObject *global_queue;
  dispatch_queue_global_t v1;
  uint64_t i;
  int v3;
  int v4;
  malloc_zone_t *zone;
  NSObject *v6;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  pthread_t v11;
  pthread_attr_t v12;
  _QWORD v13[2];

  memset(&v12, 0, sizeof(v12));
  v11 = 0;
  signal(2, (void (__cdecl *)(int))sub_10000C4A8);
  signal(3, (void (__cdecl *)(int))sub_10000C4A8);
  signal(15, (void (__cdecl *)(int))sub_10000C4A8);
  signal(1, (void (__cdecl *)(int))sub_10000C4A8);
  signal(30, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(-32768, 0);
  qword_100020290 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, global_queue);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100020290, &stru_10001C748);
  dispatch_resume((dispatch_object_t)qword_100020290);
  v1 = dispatch_get_global_queue(0, 0);
  os_state_add_handler(v1, &stru_10001C788);
  for (i = 0; i != 256; ++i)
  {
    v3 = (_DWORD)i << 24;
    v4 = 8;
    do
    {
      if (v3 >= 0)
        v3 *= 2;
      else
        v3 = (2 * v3) ^ 0x4C11DB7;
      --v4;
    }
    while (v4);
    dword_100020298[i] = v3;
  }
  dword_10002073C = 2;
  qword_100020730 = (uint64_t)sub_10000C29C(2, 0x10000);
  if (qword_100020730)
  {
    zone = malloc_create_zone(0, 0);
    qword_1000206A8 = (uint64_t)zone;
    if (zone)
      malloc_set_zone_name(zone, "PathStringZone");
    qword_100021848 = 0;
    *(_QWORD *)&dword_100021850 = 0;
    qword_100021848 = (uint64_t)sub_1000129E8(4096, &dword_100021854);
    qword_1000206C0 = (uint64_t)malloc_default_zone();
    qword_100021830 = 0;
    qword_100021840 = 0;
    qword_100021838 = 0;
    qword_100021830 = (uint64_t)sub_1000129E8(4096, &qword_100021838);
    bzero(xmmword_100020758, 0x1000uLL);
    bzero(dword_1000218D8, 0x1000uLL);
    sub_10000A440();
    if (!qword_100020748)
    {
      v9 = sub_1000094B4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000171FC();
      while (1)
        sleep(0x15180u);
    }
    pthread_cond_init(&stru_100020200, 0);
    pthread_mutex_init(&stru_1000201C0, 0);
    pthread_mutex_init(&stru_100020140, 0);
    v13[0] = 0x101010101010101;
    v13[1] = 0x101010101010101;
    if (!sub_100009E68(1, (uint64_t)v13, 16, 0x2000))
    {
      ioctl(dword_100020048, 0x20007365uLL, 0);
      if (!ioctl(dword_100020048, 0x20007366uLL, 0))
        byte_100020288 = 1;
      pthread_attr_init(&v12);
      pthread_create(&v11, &v12, (void *(__cdecl *)(void *))sub_100005350, 0);
      pthread_attr_destroy(&v12);
      if (sub_10000ECA8())
      {
        v10 = sub_1000094B4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100017228();
      }
      pthread_mutex_lock(&stru_100020090);
      dword_100020750 = 1;
      pthread_cond_broadcast(&stru_1000200D0);
      pthread_mutex_unlock(&stru_100020090);
      sub_100005688();
      pthread_join(v11, 0);
      sub_10000B90C();
      while (dword_100020724)
        usleep(0xC350u);
      sub_10000F0FC();
      exit(0);
    }
    v6 = sub_1000094B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100017254(v6);
    return 22;
  }
  else
  {
    v8 = sub_1000094B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000171D0();
    return 12;
  }
}

void sub_1000118F0(id a1)
{
  sub_10000CE40(30);
}

os_state_data_s *__cdecl sub_1000118F8(id a1, os_state_hints_s *a2)
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  const __CFData *Data;
  unsigned int Length;
  NSObject *v6;
  uint64_t v7;
  const void *Value;
  const __CFData *v9;
  unsigned int v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  CFRange v15;
  CFRange v16;

  if (a2->var2 != 3)
  {
    v12 = sub_1000094B4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10001736C();
    return 0;
  }
  v2 = sub_10000C56C();
  if (!v2)
  {
    v13 = sub_1000094B4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000172C8();
    return 0;
  }
  v3 = v2;
  Data = CFPropertyListCreateData(kCFAllocatorDefault, v2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  Length = CFDataGetLength(Data);
  if (Length <= 0x8000)
  {
    CFRelease(v3);
    v11 = (char *)malloc_type_calloc(1uLL, Length + 200, 0x280E3D90uLL);
    __strlcpy_chk(v11 + 136, "FSEvents Client State", 64, 64);
    *(_DWORD *)v11 = 1;
    *((_DWORD *)v11 + 1) = Length;
    v16.location = 0;
    v16.length = Length;
    CFDataGetBytes(Data, v16, (UInt8 *)v11 + 200);
  }
  else
  {
    v6 = sub_1000094B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000172F4(Length, v6, v7);
    Value = CFDictionaryGetValue(v3, CFSTR("global_state"));
    v9 = CFPropertyListCreateData(kCFAllocatorDefault, Value, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFRelease(v3);
    v10 = CFDataGetLength(v9);
    v11 = (char *)malloc_type_calloc(1uLL, v10 + 200, 0xD8A49280uLL);
    __strlcpy_chk(v11 + 136, "FSEvents Global State", 64, 64);
    *(_DWORD *)v11 = 1;
    *((_DWORD *)v11 + 1) = v10;
    v15.location = 0;
    v15.length = v10;
    CFDataGetBytes(v9, v15, (UInt8 *)v11 + 200);
    if (v9)
      CFRelease(v9);
  }
  if (Data)
    CFRelease(Data);
  return (os_state_data_s *)v11;
}

uint64_t sub_100011AE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100011530();
  v0 = sub_1000094B4();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_1000173F0(v0, v1, v2, v3, v4, v5, v6, v7);
  return 0;
}

void sub_100011B24(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;

  if (sub_100007EB0())
  {
    pthread_mutex_lock(&stru_100020140);
    for (i = 0; i != 512; ++i)
    {
      v3 = xmmword_100020758[i];
      if (v3 && *(_QWORD *)(v3 + 216) == a1)
      {
        pthread_mutex_lock((pthread_mutex_t *)xmmword_100020758[i]);
        *(_DWORD *)(v3 + 188) |= 2u;
        pthread_mutex_unlock((pthread_mutex_t *)v3);
        sub_100007D3C(v3);
        pthread_mutex_unlock(&stru_100020140);
        return;
      }
    }
    pthread_mutex_unlock(&stru_100020140);
    v4 = sub_1000094B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000174D4(a1, v4, v5);
  }
}

uint64_t sub_100011BE8(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  pthread_t v8;
  pthread_attr_t v9;

  result = sub_100007EB0();
  if ((_DWORD)result)
  {
    v5 = 0;
    while (1)
    {
      pthread_mutex_lock(&stru_100020140);
      v6 = 0;
      while (1)
      {
        v7 = xmmword_100020758[v6];
        if (v7)
        {
          if (*(_QWORD *)(v7 + 216) == a1)
            break;
        }
        if (++v6 == 512)
          return pthread_mutex_unlock(&stru_100020140);
      }
      if (!pthread_mutex_trylock((pthread_mutex_t *)xmmword_100020758[v6]))
        break;
      pthread_mutex_unlock(&stru_100020140);
      result = sleep(1u);
      if (++v5 == 10)
        return result;
    }
    if ((*(_DWORD *)(v7 + 188) & 0x800) != 0)
    {
      memset(&v9, 0, sizeof(v9));
      v8 = 0;
      if ((*(_DWORD *)(v7 + 188) & 0x20) != 0)
        sub_100017564();
      *(_DWORD *)(v7 + 188) &= ~0x800u;
      pthread_attr_init(&v9);
      pthread_attr_setdetachstate(&v9, 2);
      pthread_create(&v8, &v9, (void *(__cdecl *)(void *))sub_100002E7C, (void *)v7);
      pthread_attr_destroy(&v9);
    }
    pthread_cond_signal((pthread_cond_t *)(v7 + 64));
    pthread_mutex_unlock((pthread_mutex_t *)v7);
    *a2 = *(_QWORD *)(v7 + 160);
    return pthread_mutex_unlock(&stru_100020140);
  }
  return result;
}

uint64_t sub_100011D84(_DWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t result;

  v3 = qword_1000206E8;
  if (qword_1000206E8)
  {
    if (*(int *)(qword_1000206E8 + 8) < 1)
    {
      LODWORD(v4) = 0;
    }
    else
    {
      v4 = 0;
      do
      {
        if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)qword_1000206E8 + 8 * v4) + 32) & 0x50) == 0
          && **(_DWORD **)(*(_QWORD *)qword_1000206E8 + 8 * v4) == *a1)
        {
          break;
        }
        ++v4;
      }
      while (v4 < *(int *)(qword_1000206E8 + 8));
    }
  }
  else
  {
    if (dword_1000206C8)
      return 2;
    v5 = sub_1000094B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001758C();
    MEMORY[0x123] = 195936478;
    v3 = qword_1000206E8;
    if (!qword_1000206E8)
      return 2;
    LODWORD(v4) = 0;
  }
  if ((int)v4 < *(_DWORD *)(v3 + 8))
  {
    result = 0;
    *a2 = *(_QWORD *)(*(_QWORD *)v3 + 8 * v4);
    return result;
  }
  return 2;
}

uint64_t sub_100011E7C()
{
  uint64_t v0;
  uint64_t v1;
  kevent v3;

  v0 = kqueue();
  if ((v0 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v1 = v0;
  v3.ident = 0;
  *(_DWORD *)&v3.filter = 131063;
  memset(&v3.fflags, 0, 20);
  if (kevent(v0, &v3, 1, 0, 0, 0))
  {
    close(v1);
    return 0xFFFFFFFFLL;
  }
  return v1;
}

void sub_100011EF0(__CFFileDescriptor *a1)
{
  __CFFileDescriptor *v1;
  CFFileDescriptorNativeDescriptor NativeDescriptor;
  int v3;
  NSObject *v4;
  CFFileDescriptorNativeDescriptor v5;
  __CFFileDescriptor *v6;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v8;
  __CFFileDescriptor *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _DWORD *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  char *v62;
  _DWORD *v63;
  _DWORD *v64;
  int v65;
  uint64_t v66;
  char *v67;
  const char *v68;
  char *v69;
  NSObject *v70;
  char *v71;
  int v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  NSObject *v87;
  uint64_t v88;
  int v89;
  uint64_t i;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  _DWORD *v97;
  unsigned int v98;
  __CFFileDescriptor *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  char *v104;
  _BYTE timeout[22];
  __int16 v106;
  int v107;
  kevent eventlist;

  v1 = a1;
  NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  memset(&eventlist, 0, sizeof(eventlist));
  *(_QWORD *)timeout = 0;
  *(_QWORD *)&timeout[8] = 0;
  do
  {
    if (dword_1000206C8 || kevent(NativeDescriptor, 0, 0, &eventlist, 1, (const timespec *)timeout) != -1)
      goto LABEL_13;
  }
  while (*__error() == 4);
  v3 = *__error();
  if (!v3)
  {
LABEL_13:
    if (dword_1000206C8)
      goto LABEL_14;
    v104 = 0;
    if (qword_100020748)
    {
      v10 = *(_QWORD *)(qword_100020748 + 16);
      if (v10)
        sub_100007D3C(v10);
    }
    v11 = sub_10000A8D0(&v104);
    if (v11 <= 0)
    {
      v33 = sub_1000094B4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_1000175B8();
      goto LABEL_14;
    }
    v12 = v11;
    v99 = v1;
    usleep(0xC350u);
    sub_100009DCC((uint64_t)&unk_100021758);
    v13 = qword_1000206E8;
    if (*(int *)(qword_1000206E8 + 8) >= 1)
    {
      v14 = 0;
      do
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v14++) + 32) |= 8u;
      while (v14 < *(int *)(v13 + 8));
    }
    v15 = 0;
    v100 = 0;
    v16 = 0;
    v17 = v104;
    v102 = v12;
    do
    {
      v18 = &v17[2168 * v15];
      *(_DWORD *)v18 = 0;
      if (*(int *)(v13 + 8) < 1)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        v19 = 0;
        v20 = v17;
        v21 = &v17[2168 * v15];
        v22 = v21 + 48;
        v23 = v21 + 88;
        while ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v19) + 32) & 0x4030) != 0
             || *v22 != **(_DWORD **)(*(_QWORD *)v13 + 8 * v19)
             || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v19) + 8)
             || strcmp(v23, *(const char **)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v19) + 8)))
        {
          if (++v19 >= *(int *)(v13 + 8))
            goto LABEL_32;
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v19) + 32) &= ~8u;
        ++v16;
        sub_10000E864(*(_QWORD *)(*(_QWORD *)v13 + 8 * v19), (uint64_t)v18);
        v13 = qword_1000206E8;
LABEL_32:
        v17 = v20;
      }
      if ((int)v19 >= *(_DWORD *)(v13 + 8))
      {
        v100 = 1;
        *(_DWORD *)v18 = 1;
        ++v16;
      }
      ++v15;
    }
    while (v15 != v102);
    if (*(int *)(v13 + 8) < 1)
    {
      v25 = 0;
      v26 = v16;
      v27 = v100;
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = v16;
      v27 = v100;
      do
      {
        if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) & 0x4000) != 0)
        {
          v27 = 1;
        }
        else if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) & 8) != 0
               && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) & 0x30) == 0)
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) &= 0xFFFFFFF3;
          ++v26;
          v28 = *(_QWORD *)(*(_QWORD *)v13 + 8 * v24);
          v29 = *(_DWORD *)(v28 + 32);
          v30 = v29 | 0x800;
          v31 = v29 & 0xFFFFFF7F;
          if ((*(_DWORD *)(v28 + 32) & 0x80) != 0)
            v32 = v31;
          else
            v32 = v30;
          *(_DWORD *)(v28 + 32) = v32;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) |= 0x20u;
          v25 = 1;
        }
        else if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) & 8) != 0
               && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) & 0x30) != 0)
        {
          ++v26;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8 * v24) + 32) &= ~8u;
        }
        ++v24;
      }
      while (v24 < *(int *)(v13 + 8));
    }
    if (!v27)
    {
      sub_100007528((uint64_t)&unk_100021758);
      free(v17);
      v1 = v99;
      if (v25)
      {
        do
          v49 = __ldxr((unsigned int *)&dword_1000206CC);
        while (__stxr(v49 + 1, (unsigned int *)&dword_1000206CC));
        goto LABEL_140;
      }
LABEL_14:
      v9 = v1;
      goto LABEL_15;
    }
    v42 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
    if (v42)
    {
      v43 = v42;
      v44 = malloc_type_calloc(v26, 8uLL, 0x2004093837F09uLL);
      if (v44)
      {
        v45 = v44;
        v46 = qword_1000206E8;
        v101 = (uint64_t)v43;
        if (*(int *)(qword_1000206E8 + 8) < 1)
        {
          v48 = 0;
        }
        else
        {
          v47 = 0;
          v48 = 0;
          do
          {
            if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v46 + 8 * v47) + 32) & 0x4000) == 0)
            {
              v44[v48++] = *(_QWORD *)(*(_QWORD *)v46 + 8 * v47);
              v46 = qword_1000206E8;
            }
            ++v47;
          }
          while (v47 < *(int *)(v46 + 8));
        }
        v61 = 0;
        while (1)
        {
          v103 = 0;
          v62 = &v17[2168 * v61];
          if (*(_DWORD *)v62)
            break;
LABEL_112:
          if (++v61 == v102)
            goto LABEL_116;
        }
        v63 = malloc_type_calloc(0x88uLL, 1uLL, 0x50201608uLL);
        v45[v48] = v63;
        if (!v63)
        {
          v86 = sub_1000094B4();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            LODWORD(eventlist.ident) = 136315138;
            *(uintptr_t *)((char *)&eventlist.ident + 4) = (uintptr_t)&v17[2168 * v61 + 88];
            _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "NO MEMORY for new device for mount point %s\n", (uint8_t *)&eventlist, 0xCu);
          }
LABEL_116:
          if (v48 != v26)
          {
            v87 = sub_1000094B4();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              sub_10001763C();
          }
          *(_QWORD *)v101 = v45;
          *(_DWORD *)(v101 + 8) = v48;
          v88 = qword_1000206E8;
          qword_1000206E8 = v101;
          if (v88)
          {
            v89 = *(_DWORD *)(v88 + 8);
            v1 = v99;
            if (v89 >= 1)
            {
              for (i = 0; i < v89; ++i)
              {
                v91 = *(_QWORD *)(*(_QWORD *)v88 + 8 * i);
                if ((*(_DWORD *)(v91 + 32) & 0x4000) != 0)
                {
                  sub_10000EF08(v91);
                  free(*(void **)(*(_QWORD *)v88 + 8 * i));
                  *(_QWORD *)(*(_QWORD *)v88 + 8 * i) = 0;
                  v89 = *(_DWORD *)(v88 + 8);
                }
              }
              v48 = *(_DWORD *)(v101 + 8);
            }
          }
          else
          {
            v1 = v99;
          }
          if (v48 >= 1)
          {
            v92 = 0;
            v93 = *(_QWORD *)v101;
            do
            {
              v94 = *(_QWORD *)(v93 + 8 * v92);
              if ((*(_DWORD *)(v94 + 32) & 0x800) != 0)
              {
                sub_10000EF9C(v94);
                v93 = *(_QWORD *)v101;
                v94 = *(_QWORD *)(*(_QWORD *)v101 + 8 * v92);
                *(_DWORD *)(v94 + 32) &= ~0x800u;
              }
              if ((*(_DWORD *)(v94 + 32) & 0x10) != 0)
              {
                v95 = *(void **)(v94 + 8);
                if (v95)
                {
                  free(v95);
                  v96 = *(_QWORD *)v101;
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v101 + 8 * v92) + 8) = 0;
                  free(*(void **)(*(_QWORD *)(v96 + 8 * v92) + 16));
                  v93 = *(_QWORD *)v101;
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v101 + 8 * v92) + 16) = 0;
                  v97 = *(_DWORD **)(v93 + 8 * v92);
                  *v97 = 0;
                }
                else
                {
                  v97 = *(_DWORD **)(v93 + 8 * v92);
                }
                if (!v97[9])
                  v97[8] |= 0x4000u;
              }
              ++v92;
            }
            while (v92 < *(int *)(v101 + 8));
          }
          sub_100007528((uint64_t)&unk_100021758);
          free(*(void **)v88);
          free((void *)v88);
          free(v17);
          do
            v98 = __ldxr((unsigned int *)&dword_1000206CC);
          while (__stxr(v98 + 1, (unsigned int *)&dword_1000206CC));
LABEL_140:
          sub_10000C470();
          goto LABEL_14;
        }
        v64 = v63;
        v65 = v48;
        v66 = v48;
        v67 = &v17[2168 * v61];
        *v63 = *((_DWORD *)v67 + 12);
        v68 = v67 + 88;
        v69 = strdup(v67 + 88);
        *((_QWORD *)v64 + 1) = v69;
        if (sub_10000A96C(v68, (char *)&eventlist))
        {
          *(_QWORD *)(v45[v66] + 16) = strdup((const char *)&eventlist);
          v69 = *(char **)(v45[v66] + 16);
        }
        else
        {
          v70 = sub_1000094B4();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v81 = *(_DWORD *)v45[v66];
            *(_DWORD *)timeout = 136315650;
            *(_QWORD *)&timeout[4] = "handle_vfs_event";
            *(_WORD *)&timeout[12] = 2080;
            *(_QWORD *)&timeout[14] = v69;
            v106 = 1024;
            v107 = v81;
            _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%s: Could not resolve nofirmlink  path, fallback to mount_point[%s] dev[%d]\n", timeout, 0x1Cu);
          }
          *(_QWORD *)(v45[v66] + 16) = strdup(v68);
        }
        v71 = v69;
        do
        {
          while (1)
          {
            v73 = *v71++;
            v72 = v73;
            if (v73 != 47)
              break;
            ++*(_DWORD *)(v45[v66] + 24);
          }
        }
        while (v72);
        v74 = v45[v66];
        if (v69[1])
          ++*(_DWORD *)(v74 + 24);
        *(_DWORD *)(v74 + 32) = 36;
        v75 = sub_10000AA98((uint64_t)v62, &v103);
        v76 = v45[v66];
        v77 = *(_DWORD *)(v76 + 32);
        if (v75)
        {
          *(_DWORD *)(v76 + 32) = v77 | 0x100;
          v78 = v103;
          if (v103)
          {
LABEL_104:
            if (v78 == 2)
            {
              *(_DWORD *)(v45[v66] + 32) |= 0x8040u;
              v80 = sub_1000094B4();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                v84 = v45[v66];
                v85 = *(_QWORD *)(v84 + 8);
                LODWORD(v84) = *(_DWORD *)v84;
                *(_DWORD *)timeout = 136315650;
                *(_QWORD *)&timeout[4] = "handle_vfs_event";
                *(_WORD *)&timeout[12] = 2080;
                *(_QWORD *)&timeout[14] = v85;
                v106 = 1024;
                v107 = v84;
                _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%s: mount_point(%s) dev(%d) will be completely ignored", timeout, 0x1Cu);
              }
            }
            else if (v78 == 1)
            {
              v79 = sub_1000094B4();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                v82 = v45[v66];
                v83 = *(_QWORD *)(v82 + 8);
                LODWORD(v82) = *(_DWORD *)v82;
                *(_DWORD *)timeout = 136315650;
                *(_QWORD *)&timeout[4] = "handle_vfs_event";
                *(_WORD *)&timeout[12] = 2080;
                *(_QWORD *)&timeout[14] = v83;
                v106 = 1024;
                v107 = v82;
                _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s: Logging disabled (no_log) completely for device: mount_point(%s) dev(%d)", timeout, 0x1Cu);
              }
              *(_DWORD *)(v45[v66] + 32) |= 0x1000u;
            }
            v48 = v65 + 1;
            goto LABEL_112;
          }
          sub_10000AC78(v76);
        }
        else
        {
          *(_DWORD *)(v76 + 32) = v77 | 0x40;
        }
        v78 = v103;
        goto LABEL_104;
      }
      v60 = sub_1000094B4();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        sub_100017610();
      sub_100007528((uint64_t)&unk_100021758);
      free(v43);
    }
    else
    {
      v59 = sub_1000094B4();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_1000175E4();
      sub_100007528((uint64_t)&unk_100021758);
    }
    free(v17);
    v1 = v99;
    goto LABEL_14;
  }
  v4 = sub_1000094B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10001777C();
  if (v3 != 9)
  {
    CFFileDescriptorInvalidate(v1);
    CFRelease(v1);
  }
  v5 = sub_100011E7C();
  if (v5 < 0)
  {
    v34 = sub_1000094B4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10001769C(v34, v35, v36, v37, v38, v39, v40, v41);
  }
  else
  {
    v6 = CFFileDescriptorCreate(0, v5, 1u, (CFFileDescriptorCallBack)sub_100011EF0, 0);
    RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v6, 0);
    if (RunLoopSource)
    {
      v8 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000206F8, RunLoopSource, kCFRunLoopDefaultMode);
      CFRelease(v8);
      v9 = v6;
LABEL_15:
      CFFileDescriptorEnableCallBacks(v9, 1uLL);
      return;
    }
    v50 = sub_1000094B4();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_10001770C(v50, v51, v52, v53, v54, v55, v56, v57);
    CFFileDescriptorInvalidate(v6);
    CFRelease(v6);
  }
  dword_1000206C8 = 1;
  __dmb(0xBu);
  v58 = dword_100020048;
  if ((dword_100020048 & 0x80000000) == 0)
  {
    dword_100020048 = -1;
    close(v58);
  }
}

void *sub_1000129E8(int a1, _DWORD *a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;

  if (a1 < 1)
    return 0;
  v3 = 1;
  do
  {
    v4 = v3;
    v3 *= 2;
  }
  while ((int)v4 <= a1);
  v5 = v4 >> 1;
  v6 = malloc_type_malloc(8 * (v4 >> 1), 0x2004093837F09uLL);
  v7 = v6;
  if (v6)
  {
    if (v5 <= 1)
      v8 = 1;
    else
      v8 = v5;
    bzero(v6, 8 * v8);
    *a2 = v5 - 1;
  }
  return v7;
}

uint64_t sub_100012A70(_BYTE *a1, int a2)
{
  unsigned int v2;
  int v3;
  int v4;
  unsigned __int8 *v5;
  int v6;

  if (a2)
  {
    v2 = 0;
    do
    {
      v3 = *a1++;
      v2 ^= dword_100020298[v3 ^ HIBYTE(v2)];
      --a2;
    }
    while (a2);
  }
  else
  {
    v4 = *a1;
    if (*a1)
    {
      v2 = 0;
      v5 = a1 + 1;
      do
      {
        v2 ^= dword_100020298[v4 ^ HIBYTE(v2)];
        v6 = *v5++;
        v4 = v6;
      }
      while (v6);
    }
    else
    {
      v2 = 0;
    }
  }
  if (v2 <= 1)
    return 1;
  else
    return v2;
}

void sub_100012ADC(int8x8_t *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  BOOL v4;
  unint64_t *v5;
  unint64_t v6;
  char *v8;
  __int32 v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  *a1 = vrev32_s8(*a1);
  v3 = bswap32(a1[1].u32[0]);
  a1[1].i32[0] = v3;
  v4 = v3 <= 0x40000 && v3 <= a2;
  v5 = (unint64_t *)((char *)&a1[1] + 4);
  v6 = (unint64_t)a1 + v3;
  if (v4 && (unint64_t)v5 < v6)
  {
    while (1)
    {
      v11 = v5;
      do
      {
        if (!*(_BYTE *)v11)
          break;
        v11 = (unint64_t *)((char *)v11 + 1);
      }
      while ((unint64_t)v11 < v6);
      v12 = (char *)v11 - (char *)v5 + 1;
      if (v12 >= 0x401)
      {
        v13 = sub_1000094B4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1000177EC(v13, v14, v15, v16, v17, v18, v19, v20);
        return;
      }
      v8 = (char *)v5 + v12;
      if ((unint64_t)v8 >= v6)
        return;
      if ((unint64_t)(v8 + 8) > v6)
        break;
      *(_QWORD *)v8 = bswap64(*(_QWORD *)v8);
      v5 = (unint64_t *)(v8 + 12);
      if ((unint64_t)(v8 + 12) > v6)
      {
        v29 = sub_1000094B4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_1000178CC(v29, v30, v31, v32, v33, v34, v35, v36);
        return;
      }
      *((_DWORD *)v8 + 2) = bswap32(*((_DWORD *)v8 + 2));
      v9 = a1[1].i32[0];
      if ((a3 & 1) != 0)
      {
        v10 = (unint64_t)(v8 + 20);
        if (v10 > (unint64_t)a1 + v9)
        {
          v37 = sub_1000094B4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            sub_1000179AC(v37, v38, v39, v40, v41, v42, v43, v44);
          return;
        }
        *v5 = bswap64(*v5);
        v5 = (unint64_t *)v10;
      }
      if ((a3 & 2) != 0)
      {
        if ((char *)v5 + 4 > (char *)a1 + v9)
        {
          v45 = sub_1000094B4();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            sub_10001793C(v45, v46, v47, v48, v49, v50, v51, v52);
          return;
        }
        *(_DWORD *)v5 = bswap32(*(_DWORD *)v5);
        v9 = a1[1].i32[0];
        v5 = (unint64_t *)((char *)v5 + 4);
      }
      v6 = (unint64_t)a1 + v9;
      if ((unint64_t)v5 >= v6)
        return;
    }
    v21 = sub_1000094B4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10001785C(v21, v22, v23, v24, v25, v26, v27, v28);
  }
}

gzFile sub_100012C88(uint64_t a1, uint64_t a2, int a3)
{
  gzFile v3;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  size_t v12;
  NSObject *v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD *v20;
  const void *v21;
  stat v22;
  char __s2[8];
  __int16 v24;

  memset(&v22, 0, sizeof(v22));
  if ((*(_DWORD *)(a1 + 32) & 0x1040) != 0)
    return 0;
  v6 = *(_QWORD *)(a2 + 8);
  if (!v6)
  {
    v6 = qword_1000206D0[dword_1000206E0];
    *(_QWORD *)(a2 + 8) = v6;
  }
  v7 = 0;
  v8 = 0;
  while (1)
  {
    if (*(_DWORD *)(a2 + 252))
    {
      v9 = open((const char *)(a2 + 1280), 536870922);
    }
    else
    {
      v8 = v6 + 1;
      snprintf((char *)(a2 + 1280), 0x400uLL, "%s/%.16llx", (const char *)(a2 + 256), v6 + 1);
      v9 = open_dprotected_np((const char *)(a2 + 1280), 536874498, 4, 0, 384);
    }
    v10 = v9;
    if ((v9 & 0x80000000) == 0)
      break;
    if (*__error() != 17 || v7 >= 0x64)
      goto LABEL_16;
    ++v7;
    v6 = *(_QWORD *)(a2 + 8) + 1;
    *(_QWORD *)(a2 + 8) = v6;
  }
  if (fstat(v9, &v22) || (v22.st_mode & 0xF000) != 0x8000)
  {
    __error();
    close(v10);
LABEL_16:
    v11 = sub_1000094B4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100017B04();
    v10 = open("/dev/null", 2);
    if (v10 < 0)
    {
      v18 = sub_1000094B4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      goto LABEL_39;
    }
  }
  v12 = strlen((const char *)(a2 + 256));
  __s2[0] = 0;
  if (fcntl(v10, 50, __s2) || strncmp((const char *)(a2 + 256), __s2, v12) || __s2[v12] != 47)
  {
    if (*(_QWORD *)__s2 != 0x6C756E2F7665642FLL || v24 != 108)
    {
      v14 = sub_1000094B4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100017A90(a2 + 256);
    }
    close(v10);
    v10 = open("/dev/null", 2);
    if (v10 < 0)
    {
      v18 = sub_1000094B4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
LABEL_38:
        sub_100017A1C(v18);
LABEL_39:
      v3 = 0;
LABEL_41:
      *(_DWORD *)(a2 + 28) = 0;
      return v3;
    }
  }
  v3 = gzdopen(v10, "ab");
  if (!v3)
  {
    close(v10);
    goto LABEL_41;
  }
  if (a3)
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 48));
  if (*(_DWORD *)(a2 + 252))
    goto LABEL_48;
  v15 = *(_DWORD *)(a2 + 32);
  v16 = *(int *)(a2 + 36);
  if (v15 >= (int)v16)
  {
    v20 = malloc_type_calloc(v16 + 100, 8uLL, 0x100004000313F17uLL);
    if (!v20)
      goto LABEL_48;
    v17 = v20;
    v21 = *(const void **)(a2 + 40);
    if (v21)
    {
      memcpy(v20, v21, 8 * *(int *)(a2 + 36));
      free(*(void **)(a2 + 40));
    }
    *(_QWORD *)(a2 + 40) = v17;
    v15 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 36) += 100;
  }
  else
  {
    v17 = *(_QWORD **)(a2 + 40);
  }
  v17[v15] = v8;
  *(_DWORD *)(a2 + 32) = v15 + 1;
LABEL_48:
  if (a3)
    pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
  return v3;
}

uint64_t sub_100013024()
{
  sub_100009F54((uint64_t (*)(void))sub_10000BF2C);
  return 2;
}

char *sub_10001308C(const char *a1)
{
  char *v2;
  char *v3;
  const char *v4;
  int v5;
  int v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v9;
  int v10;
  char v11;

  v2 = (char *)malloc_type_malloc(0x400uLL, 0xD11DD80FuLL);
  v3 = v2;
  if (v2)
  {
    if (a1 && *a1)
    {
      v4 = &a1[strlen(a1) - 1];
      while (v4 > a1)
      {
        v5 = *(unsigned __int8 *)v4--;
        if (v5 != 47)
        {
          while (v4 > a1)
          {
            v6 = *(unsigned __int8 *)v4--;
            if (v6 == 47)
            {
              ++v4;
              goto LABEL_13;
            }
          }
          goto LABEL_19;
        }
      }
LABEL_13:
      v7 = v4 - a1;
      if (v4 == a1)
      {
LABEL_19:
        if (*a1 == 47)
          v11 = 47;
        else
          v11 = 46;
        *v3 = v11;
        v3[1] = 0;
        return v3;
      }
      v8 = (unsigned __int8 *)(v4 - 1);
      do
      {
        v9 = v7;
        if (v8 <= (unsigned __int8 *)a1)
          break;
        v10 = *v8--;
        --v7;
      }
      while (v10 == 47);
      if (v9 < 0x400)
      {
        __memcpy_chk(v3, a1, v9, 1024);
        v3[v9] = 0;
      }
      else
      {
        *__error() = 63;
        free(v3);
        return 0;
      }
    }
    else
    {
      *(_WORD *)v2 = 46;
    }
  }
  return v3;
}

void sub_1000131A4(id a1)
{
  qword_1000228E0 = (uint64_t)dispatch_semaphore_create(8);
}

uint64_t sub_1000131C4(unsigned int *a1, size_t *a2, const char **a3, unsigned int *a4, unsigned int *a5, _QWORD *a6, _QWORD *a7, unsigned int *a8)
{
  uint64_t v8;
  unsigned int *v9;
  size_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unsigned int v24;
  int v25;

  v8 = a1[354];
  if (v8 >= 0x20)
    sub_100017B90();
  v9 = a8;
  if ((*(_DWORD *)(*(_QWORD *)a1 + 188) & 0x100) != 0)
  {
    v15 = *a2;
    v16 = *a3;
  }
  else
  {
    v15 = *a2;
    v16 = *a3;
    if ((_DWORD)v8)
    {
      v17 = (v8 - 1);
      v18 = *(const char **)&a1[2 * v17 + 258];
      if (!strncmp(v18, v16, v15))
      {
        v25 = v18[v15 - 1];
        v9 = a8;
        if (!v25)
        {
          result = 0;
          a1[v17 + 66] |= *a4;
          *(_QWORD *)&a1[2 * a1[354] + 96] = *a6;
          return result;
        }
      }
      else
      {
        v9 = a8;
      }
    }
  }
  *(_QWORD *)&a1[2 * v8 + 2] = v15;
  a1[v8 + 66] = *a4;
  v19 = a1[354];
  *(_QWORD *)&a1[2 * v19 + 98] = *a6;
  a1[v19 + 322] = *a5;
  v20 = strdup(v16);
  v21 = a1[354];
  *(_QWORD *)&a1[2 * v21 + 258] = v20;
  *(_QWORD *)&a1[2 * v21 + 162] = *a7;
  a1[v21 + 226] = *v9;
  v22 = a1[354];
  if (*(_QWORD *)&a1[2 * v22 + 258])
  {
    result = 0;
  }
  else if (*a3)
  {
    result = 12;
  }
  else
  {
    result = 0;
  }
  v24 = v22 + 1;
  a1[354] = v24;
  if (v24 >= 0x20)
    return sub_100013370((uint64_t)a1);
  return result;
}

uint64_t sub_100013370(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  int v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;

  if ((*(_DWORD *)(*(_QWORD *)a1 + 188) & 1) != 0)
  {
    v2 = sub_1000094B4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_100017BB8();
    sub_100010E20(*(_QWORD *)a1);
  }
  v3 = *(unsigned int *)(a1 + 1416);
  if ((_DWORD)v3)
  {
    v4 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 208))(*(_QWORD *)(*(_QWORD *)a1 + 216), v3, a1 + 8, a1 + 1032, a1 + 264, a1 + 1288, a1 + 392, a1 + 648, a1 + 904);
    v5 = v4;
    if ((_DWORD)v4)
    {
      v6 = *(_QWORD *)a1;
      if ((_DWORD)v4 == 268435459)
        *(_DWORD *)(v6 + 188) |= 2u;
      if ((*(_DWORD *)(v6 + 188) & 2) == 0)
      {
        *(_DWORD *)(v6 + 188) |= 1u;
        v7 = sub_1000094B4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_DWORD *)(a1 + 1416);
          v12 = *(_DWORD *)(*(_QWORD *)a1 + 248);
          *(_DWORD *)buf = 136315906;
          v14 = "client_buffer_flush";
          v15 = 1024;
          v16 = v11;
          v17 = 1024;
          v18 = v12;
          v19 = 1024;
          v20 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: failed to send %u events to client pid: %d (status: %d)", buf, 0x1Eu);
        }
      }
    }
    if (*(_DWORD *)(a1 + 1416))
    {
      v8 = 0;
      v9 = a1 + 1032;
      do
      {
        free(*(void **)(v9 + 8 * v8));
        *(_QWORD *)(v9 + 8 * v8++) = 0;
      }
      while (v8 < *(unsigned int *)(a1 + 1416));
    }
  }
  else
  {
    v5 = 0;
  }
  *(_DWORD *)(a1 + 1416) = 0;
  return v5;
}

void *sub_100013528(_QWORD *a1)
{
  xpc_object_t v2;
  void *v3;
  char *v4;
  int64_t v5;
  const char *v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if ((*(_DWORD *)(a1[4] + 188) & 0x20) != 0)
  {
    xpc_dictionary_set_string(v2, "metric_type", "global");
    xpc_dictionary_set_int64(v3, "resident_size", a1[6]);
    xpc_dictionary_set_int64(v3, "virtual_size", a1[5]);
    xpc_dictionary_set_int64(v3, "string_table_count", dword_100021850);
    xpc_dictionary_set_int64(v3, "event_id", qword_1000206D0[dword_1000206E0] - *(_QWORD *)(a1[4] + 160));
    v5 = dword_100020720;
    v6 = "num_clients";
  }
  else
  {
    xpc_dictionary_set_string(v2, "metric_type", "client");
    v4 = sub_10000C4D4(*(_DWORD *)(a1[4] + 248));
    xpc_dictionary_set_string(v3, "client_name", v4);
    xpc_dictionary_set_int64(v3, "client_pid", *(int *)(a1[4] + 248));
    xpc_dictionary_set_int64(v3, "num_paths", *(int *)(a1[4] + 128));
    v5 = *(_QWORD *)(a1[4] + 296);
    v6 = "allocated_bytes";
  }
  xpc_dictionary_set_int64(v3, v6, v5);
  return v3;
}

void sub_100013684(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100013690(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000136A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1000136AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1000136C0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_1000136EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

_BYTE *sub_1000136F8(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_100013720(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_100013760(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

char *sub_10001376C(int *a1)
{
  return strerror(*a1);
}

void sub_100013774(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

int *sub_100013784()
{
  return __error();
}

void sub_100013794(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x18u);
}

void sub_100013804(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

double sub_100013810()
{
  return 2.0542726e-289;
}

void sub_100013850(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10001385C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Au);
}

int *sub_1000138C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 24) = a1;
  return __error();
}

char *sub_1000138D0@<X0>(int __errnum@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return strerror(__errnum);
}

uint64_t sub_100013900(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 66007) >= 0xFFFFFFF9)
    return (uint64_t)*(&off_10001C808 + 5 * (v1 - 66000) + 5);
  else
    return 0;
}

_DWORD *sub_100013940(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_100009850(result[3], (_QWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_1000139B8(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_1000098DC(result[3], result[8], (char *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 72;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100013A38(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_1000098C0(result[3], (_QWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100013AB0(uint64_t result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = sub_1000098FC(*(unsigned int *)(result + 12), *(_DWORD *)(result + 32), *(_QWORD *)(result + 36), (uint64_t *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100013B34(uint64_t result, uint64_t a2)
{
  int v3;
  NDR_record_t v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 7u)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  result = sub_100009920(*(unsigned int *)(result + 12), *(_DWORD *)(result + 32), *(_QWORD *)(result + 36), (int *)(a2 + 36), *(_QWORD *)(result + 56));
  *(_DWORD *)(a2 + 32) = result;
  v4 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_8;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_100013BD8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    result = (_DWORD *)sub_100009964(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100013C30(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 66007) >= 0xFFFFFFF9
    && (v5 = (void (*)(void))*(&off_10001C808 + 5 * (v4 - 66000) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100013CC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: dispatch_source_create() failed", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100013D34(int a1, int a2, os_log_t log)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100020250 == a1)
    v3 = "public";
  else
    v3 = "private";
  v4 = 136315394;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "f2d: ERROR: dispatch_mig_server(%s) => %d", (uint8_t *)&v4, 0x12u);
  sub_1000099FC();
}

void sub_100013DD4(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "fseventsd_mach_channel_handler";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: unhandled dispatch_mach_reason[%lu]", (uint8_t *)&v2, 0x16u);
  sub_1000099FC();
}

void sub_100013E58(mach_error_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  mach_error_t v12;

  v5 = 136315906;
  v6 = "fseventsd_mach_channel_handler";
  v7 = 2048;
  v8 = a2;
  v9 = 2080;
  v10 = mach_error_string(a1);
  v11 = 1024;
  v12 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: reason(%lu) ERROR:  %s (%d)", (uint8_t *)&v5, 0x26u);
}

void sub_100013F1C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_1000099E0();
  sub_1000099CC((void *)&_mh_execute_header, v0, v1, "%s: num_paths(%d) > MAX_NUM_PATHS || num_exclude_paths(%d) > MAX_NUM_PATHS*PATH_MAX", v2, v3, v4);
  sub_1000099FC();
}

void sub_100013F88()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_1000099E0();
  sub_1000099CC((void *)&_mh_execute_header, v0, v1, "%s: paths_blobCnt(%d) > MAX_NUM_PATHS*PATH_MAX || exclude_paths_blobCnt(%d)", v2, v3, v4);
  sub_1000099FC();
}

void sub_100013FF4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_1000099E0();
  sub_1000099CC((void *)&_mh_execute_header, v0, v1, "%s: exclude_path_offsets[%d] > exclude_paths_blobCnt(%d)", v2, v3, v4);
  sub_1000099FC();
}

void sub_100014060(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: clientp = add_client() => NULL", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_1000140D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100009A14();
  sub_100009A04((void *)&_mh_execute_header, v0, v1, "%s: implementation_added_client() => %d", v2, v3, v4, v5, 2u);
  sub_1000099FC();
}

void sub_10001413C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100009A14();
  sub_100009A04((void *)&_mh_execute_header, v0, v1, "%s: set_exclusion_paths() => %d", v2, v3, v4, v5, 2u);
  sub_1000099FC();
}

void sub_1000141A8(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  mach_error_string(a1);
  sub_100009A28();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s: ERROR: mach_port_request_notification() => %s (%d)", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_100014224(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  mach_error_string(a1);
  sub_100009A28();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s: ERROR: mach_port_allocate() => %s (%d)", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_1000142A0()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_1000099E0();
  sub_1000099CC((void *)&_mh_execute_header, v0, v1, "%s: path_offsets[%d] > paths_blobCnt(%d)", v2, v3, v4);
  sub_1000099FC();
}

void sub_10001430C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_1000099E0();
  sub_1000099CC((void *)&_mh_execute_header, v0, v1, "%s: num_exclude_paths(%d) != exclude_path_offsetsCnt(%d)", v2, v3, v4);
  sub_1000099FC();
}

void sub_100014378()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_1000099E0();
  sub_1000099CC((void *)&_mh_execute_header, v0, v1, "%s: num_paths(%d) != path_offsetsCnt(%d)", v2, v3, v4);
  sub_1000099FC();
}

void sub_1000143E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100009A14();
  sub_100009A04((void *)&_mh_execute_header, v0, v1, "%s: ERROR: get_client_with_matching_f2d_private_port(0x%x) => NULL", v2, v3, v4, v5, 2u);
  sub_1000099FC();
}

void sub_100014450()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100009A14();
  sub_100009A04((void *)&_mh_execute_header, v0, v1, "%s: ERROR: get_client_with_matching_f2d_private_port(0x%x) => NULL", v2, v3, v4, v5, 2u);
  sub_1000099FC();
}

void sub_1000144BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp = malloc() failed", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001452C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp->paths_blob = malloc() failed", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001459C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp->paths = malloc() failed", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001460C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: create_dispatch_source_for_f2d_port failed", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001467C(int a1, mach_error_t error_value)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  mach_error_string(error_value);
  sub_100009CE0();
  sub_100009D14((void *)&_mh_execute_header, v2, v3, "%s: f2d_private_source cancel: ERROR: mach_port_mod_refs(0x%x, MACH_PORT_RIGHT_RECEIVE, -1) => %s (%d)", v4, v5, v6, v7, 2u);
  sub_100009D28();
}

void sub_100014708(uint64_t a1, int *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *a2;
  v5 = 134218496;
  v6 = a1;
  v7 = 2048;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  sub_100009D08((void *)&_mh_execute_header, a3, (uint64_t)a3, "dealloc_client: DANGER: clientp %p (%p) has refcount %d", (uint8_t *)&v5);
}

void sub_100014798(int a1, mach_error_t error_value)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  mach_error_string(error_value);
  sub_100009CE0();
  sub_100009D14((void *)&_mh_execute_header, v2, v3, "%s: ERROR: mach_port_deallocate(clientp->d2f_port = 0x%x) => %s (%d)", v4, v5, v6, v7, 2u);
  sub_100009D28();
}

void sub_100014820(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: client not found", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100014890(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp == NULL", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100014900(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;

  v1 = 136315394;
  v2 = "callback_client";
  v3 = 2080;
  v4 = "j == paths_blob_size";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "fseventsd: %s(): failed assertion '%s'\n", (uint8_t *)&v1, 0x16u);
  sub_1000099FC();
}

void sub_100014990(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[10];

  mach_error_string(a1);
  v4[0] = 136315650;
  sub_100009A28();
  sub_100009D08((void *)&_mh_execute_header, a2, v3, "%s: ERROR: vm_allocate of paths_blob failed: %s (%d)", (uint8_t *)v4);
  sub_100009A6C();
}

void sub_100014A14(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[10];

  mach_error_string(a1);
  v4[0] = 136315650;
  sub_100009A28();
  sub_100009D08((void *)&_mh_execute_header, a2, v3, "%s: ERROR: vm_allocate of array_of_path_offsets failed: %s (%d)", (uint8_t *)v4);
  sub_100009A6C();
}

void sub_100014A98(int a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;

  strerror(a1);
  v4 = 136315394;
  v5 = "fsevent_rwlock_init";
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, a2, v3, "%s Unable to create rwlock key [%s]\n", (uint8_t *)&v4);
  sub_1000136E0();
}

void sub_100014B1C(int a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;

  strerror(a1);
  v4 = 136315394;
  v5 = "fsevent_rwlock_init";
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, a2, v3, "%s Unable to initialize rwlock [%s]\n", (uint8_t *)&v4);
  sub_1000136E0();
}

void sub_100014BA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s Unable to acquire LockCount\n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100014C10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s Unable to acquire LockCount\n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100014C80(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000138D0(a1, __stack_chk_guard);
  sub_1000137C4();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s Unable to acquire rdlock %s [%d]\n", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_100014CFC()
{
  __assert_rtn("fsevent_rwlock_wrlock", "fseventsd_implementation.c", 286, "*pLockCount <= 0");
}

void sub_100014D24(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000138D0(a1, __stack_chk_guard);
  sub_1000137C4();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s Unable to acquire wrlock %s [%d]\n", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_100014DA0(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_100013784();
  sub_10001376C(v2);
  sub_100013734();
  sub_100013684((void *)&_mh_execute_header, a1, v3, "/dev/fsevents clone failed! (%s)", v4);
  sub_1000136E0();
}

void sub_100014E14()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100009A14();
  sub_1000136EC((void *)&_mh_execute_header, v0, v1, "%s: No Memory for %d devices", (uint8_t *)v2);
  sub_1000099FC();
}

void sub_100014E84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "no root di?!\n", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100014EB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: parameter error", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100014F20()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000138C8(__stack_chk_guard);
  v0 = __error();
  sub_10001376C(v0);
  sub_100013740();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s: getattrlist failed (%d):[%s]", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_100014FA0()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  sub_100013850(__stack_chk_guard);
  v2[0] = 136315394;
  sub_1000138B4();
  sub_1000136AC((void *)&_mh_execute_header, v0, v1, "%s: could not stat the fs @ %s", (uint8_t *)v2);
  sub_1000099FC();
}

void sub_100015010()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1000137B8();
  sub_100013684((void *)&_mh_execute_header, v0, (uint64_t)v0, "init_dev_info: no memory dev info of mount point %s\n", v1);
  sub_1000099FC();
}

void sub_100015088()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000138C8(__stack_chk_guard);
  v0 = __error();
  sub_10001376C(v0);
  sub_100013740();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s: err(%d): [%s]\n", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_100015108()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_1000138D8();
  sub_1000136C0((void *)&_mh_execute_header, v0, v1, "volume %s does not support logging (flags 0x%x).", v2, v3);
  sub_1000099FC();
}

void sub_100015174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "Failed to load UUID.  Removing all old log files in %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_1000151D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "Problem with log files.  Removing all old log files in %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100015234()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "Can't stat log file: %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100015294()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_1000137A0();
  sub_1000136C0((void *)&_mh_execute_header, v0, v1, "create_dls: failed to get dirlist for %s, error %d", v2, v3);
  sub_1000099FC();
}

void sub_1000152F4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  int v3;
  uint64_t v4;

  v3 = 136315394;
  v4 = a2;
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, v2, (uint64_t)v2, "log dir %s does not match path %s.  bailing out.", (uint8_t *)&v3);
  sub_1000099FC();
}

void sub_100015364()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100013890();
  __error();
  v0 = __error();
  sub_10001376C(v0);
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "failed to make the directory %s (%d/%s)", v3, v4, v5, v6, 2u);
  sub_100009D28();
}

void sub_1000153FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000137B8();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "creating a dls for %s but it already has one...", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100015460(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: failed to create the cffd", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_1000154D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: failed to create the cffd run loop source!", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100015540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "volume_mounted_run_loop: failed to init the vfs event kqueue!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_10001556C()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  sub_1000137A0();
  sub_1000136C0((void *)&_mh_execute_header, v0, v1, "add_event_ref: event @ %p had bogus refcount %d", v2, v3);
  sub_1000099FC();
}

void sub_1000155CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013810();
  sub_10001385C((void *)&_mh_execute_header, v0, v1, "remove_event_ref: mask 0x%x dev %d client_map 0x%x 0x%x", v2, v3, v4, v5, v6);
  sub_100013708();
}

void sub_100015648()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000137B8();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "remove_event_ref: path: %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_1000156AC()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  sub_1000137A0();
  sub_1000136C0((void *)&_mh_execute_header, v0, v1, "remove_event_ref: event @ %p had bogus refcount %d", v2, v3);
  sub_1000099FC();
}

void sub_10001570C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "add_paths_to_prefix_table: bad news: no memory for operation.", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100015738(int *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = 512;
  sub_100013760((void *)&_mh_execute_header, a2, a3, "too many clients for pid %d (limit %d)", (uint8_t *)v4);
  sub_1000099FC();
}

void sub_1000157B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013774((void *)&_mh_execute_header, a1, a3, "too many clients in system (limit %d)", a5, a6, a7, a8, 0);
  sub_1000136B8();
}

void sub_100015820(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013774((void *)&_mh_execute_header, a1, a3, "too many processes with clients in system (limit %d)", a5, a6, a7, a8, 0);
  sub_1000136B8();
}

void sub_10001588C()
{
  __assert_rtn("client_wakeup", "fseventsd_implementation.c", 4880, "!(fci->flags & CLIENT_IS_INTERNAL)");
}

void sub_1000158B4()
{
  __assert_rtn("is_ignored_directory", "fseventsd_implementation.c", 1033, "path");
}

void sub_1000158DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "can not allocate a kernel-dropped event!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100015908()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100013850(__stack_chk_guard);
  sub_1000137B8();
  sub_10001386C();
  sub_1000136AC((void *)&_mh_execute_header, v0, (uint64_t)v0, "add_event: path <<%s>> has len %zu", v1);
  sub_1000099FC();
}

void sub_100015978(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LOWORD(v3) = 2048;
  *(_QWORD *)((char *)&v3 + 2) = a1;
  sub_1000136C0((void *)&_mh_execute_header, a2, a3, "consumer thread: bad ref count %d on entry %p", 67109376, (const void *)v3);
  sub_1000099FC();
}

void sub_1000159E8(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  uint64_t v3;

  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *a2;
  sub_100013720((void *)&_mh_execute_header, (uint64_t)a2, a3, "event table has grown too large. (filled %d / mask 0x%x)", 67109376, v3);
  sub_1000099FC();
}

void sub_100015A60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "failed to resize the hash table.", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100015A8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: NULL entitlement parameter", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100015AFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: unable to create task for audit token", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100015B6C()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  int v3[4];
  __int16 v4;
  int v5;

  v3[0] = 136315650;
  sub_100009A14();
  v4 = v0;
  v5 = v1;
  sub_100013794((void *)&_mh_execute_header, v2, (uint64_t)v2, "%s: empty path table index(%d)  with device id(%d) - skipping \n", (uint8_t *)v3);
  sub_1000099FC();
}

void sub_100015BE8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "dropped event message is inconsistent.", v3);
}

void sub_100015C14(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = -1;
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "1: event id's wrapping to zero! (0x%llx)", a1);
}

void sub_100015C54(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = -1;
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "2: event id's wrapping to zero! (0x%llx)", a1);
}

void sub_100015C94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: CFDictionaryCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100015D04(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "exclusion_paths cfMutableArray was not created", v3);
}

void sub_100015D30(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "exclusion_paths cfStr was not created", v3);
}

void sub_100015D5C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "path_table cfMutableArray was not created", v3);
}

void sub_100015D88(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "path_table cfStr was not created", v3);
}

void sub_100015DB4(const __CFString *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  CFStringGetCStringPtr(a1, 0x8000100u);
  sub_100013734();
  sub_100013684((void *)&_mh_execute_header, a2, v3, "%s val was not created", v4);
  sub_1000136E0();
}

void sub_100015E30()
{
  uint64_t v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[10];
  uint64_t v5;
  __int16 v6;
  int v7;

  sub_1000138EC();
  v5 = v0;
  v6 = 1024;
  v7 = v1;
  sub_100013794((void *)&_mh_execute_header, v2, v3, "fseventsd internal state [num_clients: %d, current_event_id: 0x%llx string_table_count[%d]\n", v4);
  sub_1000099FC();
}

void sub_100015ECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100013890();
  sub_1000138C8(__stack_chk_guard);
  sub_100009A48((void *)&_mh_execute_header, v0, v1, "%s: error removing [%s] (%d)", v2, v3, v4, v5, 2u);
  sub_100009A6C();
}

void sub_100015F5C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1000137B8();
  sub_10001386C();
  sub_1000136AC((void *)&_mh_execute_header, v0, (uint64_t)v0, "event %s for %s", v1);
  sub_1000099FC();
}

void sub_100015FE4(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "check_vol_last_mod_time: failed to get last mtime (%d)\n", (uint8_t *)v3, 8u);
  sub_1000099FC();
}

void sub_10001606C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[10];
  uint64_t v4;

  sub_100013890();
  sub_100013784();
  sub_1000138EC();
  v4 = v1;
  sub_1000136EC((void *)&_mh_execute_header, v0, v2, "check_vol_last_mod_time:XXX failed to get mount time (%d; &mount_time == %p)\n",
    v3);
  sub_1000136E0();
}

void sub_1000160E4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100013840();
  sub_100013784();
  sub_10001389C();
  sub_1000137E4();
  sub_100013794((void *)&_mh_execute_header, v0, v1, "check_vol_last_mod_time: problems with history file: %s (%d ; is_reg %d)",
    v2);
  sub_10001378C();
}

void sub_100016164(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v2 = 136315394;
  v3 = a1;
  sub_10001386C();
  sub_1000136AC((void *)&_mh_execute_header, v1, (uint64_t)v1, "log dir: %s getting new uuid: %s", (uint8_t *)&v2);
  sub_1000099FC();
}

void sub_1000161D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "failed to store the uuid in %s.  unlinking it.", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100016238()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "failed to create the uuid file %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100016298()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100013840();
  sub_100013784();
  sub_10001389C();
  sub_1000137E4();
  sub_100013794((void *)&_mh_execute_header, v0, v1, "get_last_event_id: problems with history file: %s (%d ; is_reg %d)",
    v2);
  sub_10001378C();
}

void sub_100016318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "get_last_event_id: failed to gzopen %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100016378()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "get_last_event_id";
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, v0, v1, "%s: malformed history archive - header too small - (%s)\n", (uint8_t *)&v2);
  sub_1000099FC();
}

void sub_1000163EC(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - > PATH_MAX \n", a1);
}

void sub_100016430(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_EVENTID_SIZE truncated", a1);
}

void sub_100016474(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_EVENTMASK_SIZE truncated", a1);
}

void sub_1000164B8(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_FILEID_SIZE+DLS_DOCID_SIZE truncated", a1);
}

void sub_1000164FC(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013684((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_FILEID_SIZE truncated", a1);
}

void sub_100016540()
{
  NSObject *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  sub_100013890();
  v2 = sub_100013784();
  sub_10001376C(v2);
  v4 = 136315394;
  v5 = v1;
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, v0, v3, "could not open <<%s>> (%s)\n", (uint8_t *)&v4);
  sub_1000136E0();
}

void sub_1000165BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000137B8();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "re-enabling logs in %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100016620(uint64_t a1, int a2, NSObject *a3)
{
  int v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;

  v6 = *sub_100013784();
  v8[0] = 67109634;
  v8[1] = a2;
  v9 = 1024;
  v10 = v6;
  v11 = 2080;
  v12 = a1 + 256;
  sub_100013794((void *)&_mh_execute_header, a3, v7, "disk logger: gzclose() failed (%d/%d) removing all old log files in %s", (uint8_t *)v8);
  sub_10001378C();
}

void sub_1000166C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000137B8();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "disk logger: removing all old log files in %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_10001672C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  char *v13;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = a2 + 1280;
  v6 = __error();
  v8 = 134218498;
  v9 = v4;
  v10 = 2080;
  v11 = v5;
  v12 = 2080;
  v13 = sub_10001376C(v6);
  sub_100013804((void *)&_mh_execute_header, a3, v7, "disk logger: failed to write %zu bytes to log file %s (err: %s).", (uint8_t *)&v8);
  sub_100009D28();
}

void sub_1000167C8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_1000138D8();
  sub_1000136C0((void *)&_mh_execute_header, v0, v1, "gzflush(%s) returned %d", v2, v3);
  sub_1000099FC();
}

void sub_100016830(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "could not allocate buffer for logging file names!\n", v3);
}

void sub_10001685C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "failed to resize the hash table.", v3);
}

void sub_100016888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "Failed to create disk logger client.", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000168B4()
{
  __assert_rtn("client_process_events", "fseventsd_implementation.c", 4327, "me->pid != 0");
}

void sub_1000168DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013774((void *)&_mh_execute_header, a2, a3, "could not get login info for uid %d\n", a5, a6, a7, a8, 0);
  sub_1000136B8();
}

void sub_100016944()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100013734();
  sub_10001386C();
  sub_1000136AC((void *)&_mh_execute_header, v0, (uint64_t)v0, "Leaking dev_info_t: 0x%p dls: 0x%p", v1);
  sub_1000099FC();
}

void sub_1000169B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "DANGER! trying to cleanup the global dls for something that is not the root fs!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000169E0()
{
  NSObject *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  sub_100013890();
  v2 = sub_100013784();
  sub_10001376C(v2);
  v4 = 136315394;
  v5 = v1;
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, v0, v3, "unmounting: failed to remove log dir %s (%s)", (uint8_t *)&v4);
  sub_1000136E0();
}

void sub_100016A5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "scan_for_old_events: error processing in-memory disk bound event buffer", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100016A88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013850(__stack_chk_guard);
  sub_1000137B8();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "scan_for_old_events_callback: mount point %s appears to be gone!", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100016AE8()
{
  NSObject *v0;
  uint8_t v1[40];

  sub_100013734();
  sub_100013828();
  sub_100009D08((void *)&_mh_execute_header, v0, (uint64_t)v0, "scan_for_old: I should not be called for di %p (%s) flags 0x%x", v1);
  sub_100013708();
}

void sub_100016B60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013734();
  sub_100009A5C((void *)&_mh_execute_header, v0, v1, "read_disk_log: failed to gzopen %s", v2, v3, v4, v5, v6);
  sub_1000099FC();
}

void sub_100016BC0()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "read_disk_log";
  sub_100013710();
  sub_1000136AC((void *)&_mh_execute_header, v0, v1, "%s: malformed history archive - header too small - (%s)\n", (uint8_t *)&v2);
  sub_1000099FC();
}

void sub_100016C34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013774((void *)&_mh_execute_header, a2, a3, "process_disk_event_buf: no memory for %d paths\n", a5, a6, a7, a8, 0);
  sub_1000136B8();
}

void sub_100016C9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - > PATH_MAX \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100016D0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - event_id truncated", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100016D7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - event_mask truncated", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100016DEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - file_id truncated", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100016E5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - doc_id truncated", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100016ECC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100013878();
  sub_100013720((void *)&_mh_execute_header, v0, v1, "process_disk_event_buf: checksum mis-match: file 0x%.8x, calculated 0x%.8x", v2, v3);
  sub_1000099FC();
}

void sub_100016F2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100013810();
  sub_10001385C((void *)&_mh_execute_header, v0, v1, "process_disk_event_buf: magic is wrong (0x%.8x != (0x%.8x <OR> 0x%.8x <OR> 0x%.8x))", v2, v3, v4, v5, v6);
  sub_100013708();
}

void sub_100016FAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: empty path table - skipping \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001701C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;

  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *(_DWORD *)(a1 + 248);
  sub_100013720((void *)&_mh_execute_header, a2, a3, "failed sending HISTORY_DONE (%d) to pid %d\n", 67109376, v3);
  sub_1000099FC();
}

void sub_100017090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "scan_for_old_events: disk logger never started up!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000170BC(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000138D0(a1, __stack_chk_guard);
  sub_100013740();
  sub_100009A48((void *)&_mh_execute_header, v1, v2, "%s: unexpected error (%d):[%s]", v3, v4, v5, v6, 2u);
  sub_100009A6C();
}

void sub_100017134(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: ETIMEDOUT", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_1000171A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "requested timestamp is prior to the earliest log file.  setting event-id to zero\n", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000171D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "failed to initialize fsevent buffers.", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000171FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "No global disk logger state?!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100017228()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "Failed to create the disk logger thread!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100017254(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_100013784();
  sub_10001376C(v2);
  sub_100013734();
  sub_100013684((void *)&_mh_execute_header, a1, v3, "Could not access /dev/fsevents. (%s)", v4);
  sub_1000136E0();
}

void sub_1000172C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "client_state_cfdict is NULL", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000172F4(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a1 - 0x8000;
  sub_100013760((void *)&_mh_execute_header, a2, a3, "serialized_client_state_size is %dKB and is (%d)KB greater than the MAX_STATEDUMP_SIZE", (uint8_t *)v3);
  sub_1000099FC();
}

void sub_10001736C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "hints osh_api is not equal to OS_STATE_API_REQUEST", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100017398(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "fsevent producer: no memory for buffers!", v3);
}

void sub_1000173C4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000136F8(a1, a2);
  sub_1000136A0((void *)&_mh_execute_header, v2, (uint64_t)v2, "fsevent consumer: spinning too much?!\n", v3);
}

void sub_1000173F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s : failed to startup the fsevents main loop.", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100017460()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  sub_100013850(__stack_chk_guard);
  v2[0] = 136315394;
  sub_1000138B4();
  sub_1000136AC((void *)&_mh_execute_header, v0, v1, "%s : failed to add client for path %s", (uint8_t *)v2);
  sub_1000099FC();
}

void sub_1000174D4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = **(_QWORD **)(a1 + 24);
  v4 = 136315650;
  v5 = "implementation_removed_client";
  v6 = 2048;
  v7 = a1;
  v8 = 2080;
  v9 = v3;
  sub_100013804((void *)&_mh_execute_header, a2, a3, "%s: did not find client %p for path = '%s'", (uint8_t *)&v4);
  sub_100013708();
}

void sub_100017564()
{
  __assert_rtn("client_try_wakeup", "fseventsd_implementation.c", 4855, "!(fci->flags & CLIENT_IS_INTERNAL)");
}

void sub_10001758C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "global dev table should not be NULL!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000175B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: failed to get the mntinfo!", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_1000175E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: no memory for dev_table_t", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_100017610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000136D4();
  sub_100013690((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: no memory for di_table", v2, v3, v4, v5, v6);
  sub_1000136B8();
}

void sub_10001763C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100013878();
  sub_100013720((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: mismatched num mounts! j %d, num_mounts %d", v2, v3);
  sub_1000099FC();
}

void sub_10001769C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: init_vfs_event failure", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001770C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: CreateRunLoopSource failure", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001777C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100009A14();
  sub_1000136EC((void *)&_mh_execute_header, v0, v1, "%s: Error: %d, restarting vfs events", (uint8_t *)v2);
  sub_1000099FC();
}

void sub_1000177EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - > PATH_MAX \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001785C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - DLS_EVENTID_SIZE \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_1000178CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - DLS_EVENTMASK_SIZE \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_10001793C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - DLS_DOCID_SIZE \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_1000179AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A5C((void *)&_mh_execute_header, a1, a3, "%s: malformed history file - DLS_FILEID_SIZE \n", a5, a6, a7, a8, 2u);
  sub_1000099FC();
}

void sub_100017A1C(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_100013784();
  sub_10001376C(v2);
  sub_100013734();
  sub_100013684((void *)&_mh_execute_header, a1, v3, "disk logger: can't even open /dev/null? (%s)", v4);
  sub_1000136E0();
}

void sub_100017A90(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v2 = 136315394;
  v3 = a1;
  sub_10001386C();
  sub_1000136AC((void *)&_mh_execute_header, v1, (uint64_t)v1, "disk logger: my log dir moved! (should be: %s but is: %s).", (uint8_t *)&v2);
  sub_1000099FC();
}

void sub_100017B04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  __int16 v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  sub_100013840();
  v3 = __error();
  sub_10001376C(v3);
  v6 = 136315650;
  v7 = v2;
  sub_100013710();
  v8 = v4;
  v9 = v1;
  sub_100013804((void *)&_mh_execute_header, v0, v5, "disk logger: failed to open output file %s (%s). mount point %s", (uint8_t *)&v6);
  sub_100009D28();
}

void sub_100017B90()
{
  __assert_rtn("client_buffer_event", "fseventsd_implementation.c", 8494, "buffer->nitems < EVENT_CHUNK");
}

void sub_100017BB8()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  sub_100013850(__stack_chk_guard);
  v2 = 136315650;
  v3 = "client_buffer_flush";
  sub_100013828();
  sub_100009D08((void *)&_mh_execute_header, v0, v1, "%s: sending client(%p) USER DROPPED event to pid %d\n", (uint8_t *)&v2);
  sub_100013708();
}
