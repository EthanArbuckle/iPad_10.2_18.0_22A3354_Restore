uint64_t start(int a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  char v7;
  const char **v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  int v12;
  FILE *v13;
  int *v14;
  FILE *v15;
  size_t v16;
  BOOL v17;
  const char *v19;
  FILE *v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  int v25;
  FILE *v26;
  FILE *v27;
  const char *v28;
  int v29;
  const char *v30;
  FILE *v31;
  const char *v32;
  char *v33;
  unsigned int v34;
  int v35;
  FILE *v36;
  char *v37;
  int *v38;
  int v39;
  FILE *v40;
  char *v41;
  int v42;
  FILE *v43;
  char *v44;
  int v45;
  FILE *v46;
  char *v47;
  _removefile_state *v49;
  int v50;
  FILE *v51;
  char *v52;
  uint64_t v53;
  FILE *v54;
  const char *v55;
  int v56;
  int v57;
  FILE *v58;
  char *v59;
  int v60;
  int v61;
  int v62;
  FILE *v63;
  char *v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int *v69;
  FILE *v70;
  int v71;
  FILE *v72;
  const char *v73;
  int v74;
  FILE *v75;
  const char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  int v82;
  char v83;
  char v84[1024];
  char v85[64];
  _WORD v86[2];
  int v87;
  __darwin_time_t v88[4];
  removefile_state_t state;
  pthread_t v90;
  pthread_mutex_t v91;
  pthread_cond_t v92;
  int v93;
  _DWORD v94[2];
  uint64_t v95;
  unsigned __int16 v96;
  int v97;
  int v98;
  unsigned int v99;
  char v100[868];
  statfs v101;

  if (a1 == 1 || (v4 = strcmp(*(const char **)(a2 + 8), "--init"), v5 = v4, a1 == 2) && !v4)
  {
    fwrite("usage: dirs_cleaner [--init] directory ...\n", 0x2BuLL, 1uLL, __stderrp);
    exit(64);
  }
  bzero(v84, 0x520uLL);
  if (v5)
  {
    v86[0] = 5;
    if (a1 < 2)
      return 0;
    v82 = v5;
    v6 = 1;
    goto LABEL_11;
  }
  if (!sub_10000354C(v88, 0x14u, 0))
    v99 |= 1u;
  v86[0] = 5;
  if (a1 > 2)
  {
    v82 = 0;
    v6 = 2;
LABEL_11:
    v83 = 0;
    v7 = 0;
    v8 = (const char **)(a2 + 8 * v6);
    v9 = a1 - v6;
    while (1)
    {
      v10 = *v8;
      bzero(&v101, 0x878uLL);
      bzero(v100, 0x400uLL);
      v11 = realpath_DARWIN_EXTSN(v10, v100);
      if (v11)
      {
        v12 = statfs(v11, &v101);
        if (v12)
        {
          v13 = __stderrp;
          strerror(v12);
          fprintf(v13, "%s: statfs: (%s, NULL, ...) failed with errno=%d: %s\n");
        }
        else
        {
          v16 = strlen(v101.f_mntonname);
          if (v16 == 12)
          {
            if (*(_QWORD *)v101.f_mntonname == 0x657461766972702FLL && *(_DWORD *)&v101.f_mntonname[8] == 1918989871)
              goto LABEL_32;
          }
          else if (v16 == 19)
          {
            v17 = *(_QWORD *)v101.f_mntonname == 0x657461766972702FLL
               && *(_QWORD *)&v101.f_mntonname[8] == 0x626F6D2F7261762FLL;
            if (v17 && *(_QWORD *)&v101.f_mntonname[11] == 0x656C69626F6D2F72)
            {
              v19 = "/private/var/mobile/dirs_cleaner/";
              goto LABEL_33;
            }
          }
          v21 = __stderrp;
          strerror(22);
          fprintf(v21, "%s: (bad path: %s, NULL, ...) failed with errno=%d: %s\n");
        }
      }
      else
      {
        v14 = __error();
        v15 = __stderrp;
        strerror(*v14);
        fprintf(v15, "%s: realpath: (%s, NULL, ...) failed with errno=%d: %s\n");
      }
LABEL_32:
      v19 = "/private/var/dirs_cleaner/";
LABEL_33:
      v22 = __strlcpy_chk(v85, v19, 61, 64);
      v23 = v22;
      if ((unint64_t)(v22 - 1) > 0x3B)
      {
        v26 = __stderrp;
        strerror(22);
        fprintf(v26, "%s: strlcpy(%s, %s, %zu) failed with errno=%d: %s\n");
LABEL_41:
        v85[0] = 0;
        v25 = v99 | 1;
        goto LABEL_42;
      }
      if (v84[v22 + 1023] != 47)
      {
        v23 = v22 + 1;
        *(_WORD *)&v84[v22 + 1024] = 47;
      }
      if (mkdir(v85, 0x1C0u))
      {
        v24 = __error();
        if (*v24 != 17)
        {
          v27 = __stderrp;
          strerror(*v24);
          fprintf(v27, "%s: mkdir(%s, 0700) failed with errno=%d: %s\n");
          goto LABEL_41;
        }
      }
      v84[v23 + 1026] = 0;
      v98 = v23;
      v25 = v99;
LABEL_42:
      v28 = *v8;
      v99 = v25 & 0xFFFFFFFD;
      if (realpath_DARWIN_EXTSN(v28, v84) && (v87 = 1073971208, !getattrlist(v84, v86, v94, 0x18uLL, 0)))
      {
        if (v94[1] == 2)
        {
          v96 &= 0xFFFu;
          if (!strncmp("/tmp", v28, 4uLL))
          {
            v96 = 1023;
            v95 = 0;
          }
LABEL_50:
          v34 = v99;
          if ((v99 & 1) == 0)
          {
            *(_WORD *)&v84[v98 + 1024] = 22616;
            if (mkdtemp(v85))
            {
              v87 = 1073971200;
              *(_QWORD *)&v101.f_bsize = v95;
              LODWORD(v101.f_blocks) = v96;
              HIDWORD(v101.f_blocks) = v97;
              if (setattrlist(v85, v86, &v101, 0x10uLL, 0))
              {
                v35 = *__error();
                v36 = __stderrp;
                v37 = strerror(v35);
                fprintf(v36, "%s: setattrlist(%s, ...) failed with errno=%d: %s\n", "dc_swap_dirs", v85, v35, v37);
                if (!v35)
                {
LABEL_63:
                  if ((v99 & 2) == 0)
                  {
                    v83 = 1;
                    goto LABEL_66;
                  }
                  goto LABEL_64;
                }
              }
              else
              {
                if (!renamex_np(v84, v85, 2u))
                  goto LABEL_63;
                v42 = *__error();
                v43 = __stderrp;
                v44 = strerror(v42);
                fprintf(v43, "%s: renamex_np(%s, %s, RENAME_SWAP) failed with errno=%d: %s\n", "dc_swap_dirs", v84, v85, v42, v44);
                if (!v42)
                  goto LABEL_63;
              }
              v99 |= 2u;
              if (rmdir(v85))
              {
                v45 = *__error();
                v46 = __stderrp;
                v47 = strerror(v45);
                fprintf(v46, "%s: rmdir(%s) failed with errno=%d: %s\n", "dc_swap_dirs", v85, v45, v47);
              }
              goto LABEL_63;
            }
            v39 = *__error();
            v40 = __stderrp;
            v41 = strerror(v39);
            fprintf(v40, "%s: mkdtemp(%s) failed with errno=%d: %s\n", "dc_reset", v85, v39, v41);
            v34 = v99;
          }
          v99 = v34 | 2;
LABEL_64:
          v29 = sub_100003338(v84, 1);
          if (!v29)
            goto LABEL_66;
          v30 = "dc_clean_sync: %s: %s\n";
          goto LABEL_46;
        }
        v38 = __error();
        v29 = 20;
        *v38 = 20;
      }
      else
      {
        v29 = *__error();
        if (!v29)
          goto LABEL_50;
      }
      v30 = "dc_reset: %s: %s\n";
LABEL_46:
      v31 = __stderrp;
      v32 = *v8;
      v33 = strerror(v29);
      fprintf(v31, v30, v32, v33);
      v7 = 1;
LABEL_66:
      ++v8;
      if (!--v9)
      {
        if (v82)
          return 0;
        if ((v7 & 1) != 0)
        {
          if ((v99 & 1) == 0)
          {
            v84[v98 + 1024] = 0;
            sub_100003338(v84, 0);
          }
          return 0;
        }
        if ((v83 & 1) == 0 || !sub_1000033F8((uint64_t)v84))
          return 0;
        v84[v98 + 1024] = 0;
        v49 = removefile_state_alloc();
        state = v49;
        if (!v49)
        {
          v54 = __stderrp;
          v77 = 12;
          v78 = strerror(12);
          v55 = "%s: removefile_state_alloc(...) failed with errno=%d: %s\n";
LABEL_80:
          fprintf(v54, v55, "dc_init_thread_ctx", v77, v78, v81);
          goto LABEL_88;
        }
        if (removefile_state_set(v49, 3u, sub_100003614))
        {
          v50 = *__error();
          v51 = __stderrp;
          v52 = strerror(v50);
          fprintf(v51, "%s: failed to set error cb!\n failed with errno=%d: %s\n", "dc_init_thread_ctx", v50, v52);
        }
        v53 = pthread_mutex_init(&v91, 0);
        if ((_DWORD)v53)
        {
          v54 = __stderrp;
          v77 = v53;
          v78 = strerror(v53);
          v55 = "%s: pthread_mutex_init(...) failed with errno=%d: %s\n";
          goto LABEL_80;
        }
        v56 = pthread_cond_init(&v92, 0);
        if (v56)
        {
          v57 = v56;
          v58 = __stderrp;
          v59 = strerror(v56);
          fprintf(v58, "%s: pthread_cond_init(...) failed with errno=%d: %s\n", "dc_init_thread_ctx", v57, v59);
          goto LABEL_87;
        }
        v60 = pthread_mutex_lock(&v91);
        if (v60)
        {
          v74 = v60;
          v75 = __stderrp;
          v80 = strerror(v60);
          v76 = "dtc_lock";
        }
        else
        {
          v61 = pthread_create(&v90, 0, (void *(__cdecl *)(void *))sub_10000369C, v84);
          if (v61)
          {
            v62 = v61;
            v63 = __stderrp;
            v64 = strerror(v61);
            fprintf(v63, "%s: pthread_create(...) failed with errno=%d: %s\n", "dc_init_thread_ctx", v62, v64);
            v65 = pthread_mutex_unlock(&v91);
            if (!v65)
            {
              pthread_cond_destroy(&v92);
LABEL_87:
              pthread_mutex_destroy(&v91);
LABEL_88:
              if ((v99 & 4) == 0)
              {
LABEL_94:
                removefile_state_free(state);
                return 0;
              }
              v66 = pthread_mutex_lock(&v91);
              if (v66)
              {
                v71 = v66;
                v72 = __stderrp;
                v79 = strerror(v66);
                v73 = "dtc_lock";
              }
              else if ((v99 & 8) == 0 && (v99 |= 8u, (v67 = pthread_cond_signal(&v92)) != 0))
              {
                v71 = v67;
                v72 = __stderrp;
                v79 = strerror(v67);
                v73 = "dtc_signal";
              }
              else
              {
                v68 = pthread_mutex_unlock(&v91);
                if (!v68)
                {
                  pthread_join(v90, 0);
                  pthread_cond_destroy(&v92);
                  pthread_mutex_destroy(&v91);
                  goto LABEL_94;
                }
                v71 = v68;
                v72 = __stderrp;
                v79 = strerror(v68);
                v73 = "dtc_unlock";
              }
              fprintf(v72, "dirs_cleaner: tag=%s err=%d err_str=%s\n", v73, v71, v79);
LABEL_104:
              exit(71);
            }
          }
          else
          {
            v93 = 4;
            v99 |= 4u;
            v65 = pthread_mutex_unlock(&v91);
            if (!v65)
            {
              if (removefile(v85, state, 0x303u))
              {
                v69 = __error();
                if (*v69 != 89)
                {
                  v70 = __stderrp;
                  strerror(*v69);
                  fprintf(v70, "%s: removefile(%s, ...) failed with errno=%d: %s\n");
                }
              }
              goto LABEL_88;
            }
          }
          v74 = v65;
          v75 = __stderrp;
          v80 = strerror(v65);
          v76 = "dtc_unlock";
        }
        fprintf(v75, "dirs_cleaner: tag=%s err=%d err_str=%s\n", v76, v74, v80);
        goto LABEL_104;
      }
    }
  }
  return 0;
}

uint64_t sub_100003338(const char *a1, int a2)
{
  const char *v2;
  _removefile_state *v3;
  _removefile_state *v4;
  int *v5;
  uint64_t v6;
  FILE *v7;
  char *v8;

  if (a2)
    v2 = a1;
  else
    v2 = a1 + 1024;
  v3 = removefile_state_alloc();
  v4 = v3;
  if (v3)
    removefile_state_set(v3, 3u, sub_100003614);
  if (!removefile(v2, v4, 0x303u))
  {
    v6 = 0;
    if (!v4)
      return v6;
    goto LABEL_8;
  }
  v5 = __error();
  v6 = *v5;
  v7 = __stderrp;
  v8 = strerror(*v5);
  fprintf(v7, "%s: removefile(%s, NULL, ...) failed with errno=%d: %s\n", "dc_clean_sync", v2, v6, v8);
  if (v4)
LABEL_8:
    removefile_state_free(v4);
  return v6;
}

BOOL sub_1000033F8(uint64_t a1)
{
  _BOOL8 result;
  int v3;
  FILE *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  statfs v9;

  result = sub_10000354C((__darwin_time_t *)(a1 + 1128), *(_DWORD *)(a1 + 1272), (_QWORD *)(a1 + 1112));
  if (result)
  {
    memset(&v9, 0, 512);
    if (statfs((const char *)a1, &v9))
    {
      v3 = *__error();
      v4 = __stderrp;
      v5 = strerror(v3);
      fprintf(v4, "%s: statfs(%s, ...) failed with errno=%d: %s\n", "dc_should_reclaim", (const char *)a1, v3, v5);
      return 0;
    }
    else
    {
      v6 = 0x40000000 / v9.f_bsize;
      v7 = 5 * v9.f_blocks / 0x64;
      if (v7 < v6)
        v6 = 5 * v9.f_blocks / 0x64;
      if (v7 >= 0x10000000 / v9.f_bsize)
        v8 = v6;
      else
        v8 = 0x10000000 / v9.f_bsize;
      return v8 > v9.f_bfree;
    }
  }
  return result;
}

BOOL sub_10000354C(__darwin_time_t *a1, unsigned int a2, _QWORD *a3)
{
  int v6;
  FILE *v7;
  char *v8;
  __darwin_time_t v9;
  __darwin_time_t v10;
  timeval v12;

  v12.tv_sec = 0;
  *(_QWORD *)&v12.tv_usec = 0;
  if (gettimeofday(&v12, 0))
  {
    v6 = *__error();
    v7 = __stderrp;
    v8 = strerror(v6);
    fprintf(v7, "%s: gettimeofday(...) failed with errno=%d: %s\n", "dtc_timespan2timespec", v6, v8);
    v9 = 0;
  }
  else if (a3)
  {
    v10 = a2;
    if (*a3 - v12.tv_sec < a2)
      v10 = *a3 - v12.tv_sec;
    v9 = v10 + v12.tv_sec;
    if (*a3 <= v12.tv_sec)
      v9 = 0;
  }
  else
  {
    v9 = v12.tv_sec + a2;
  }
  *a1 = v9;
  return v9 != 0;
}

uint64_t sub_100003614(_removefile_state *a1)
{
  int dst;

  dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
    fprintf(__stderrp, "dc removefile unknown error on path: %s ");
  else
    fprintf(__stderrp, "dc removefile error: %d on path: %s ");
  fwrite("...continuing...\n", 0x11uLL, 1uLL, __stderrp);
  return 1;
}

uint64_t sub_10000369C(uint64_t a1)
{
  pthread_mutex_t *v2;
  int v3;
  int v4;
  FILE *v5;
  char *v6;
  int v7;
  FILE *v9;
  FILE *v10;

  v2 = (pthread_mutex_t *)(a1 + 1160);
  v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 1160));
  if (v3)
  {
LABEL_12:
    v9 = __stderrp;
    strerror(v3);
    fprintf(v9, "dirs_cleaner: tag=%s err=%d err_str=%s\n");
    goto LABEL_13;
  }
  while ((*(_BYTE *)(a1 + 1308) & 8) == 0)
  {
    v3 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 1224), v2, (const timespec *)(a1 + 1128));
    if (v3)
    {
      if (v3 != 60)
        goto LABEL_12;
      if (!sub_1000033F8(a1))
      {
        if (removefile_cancel(*(removefile_state_t *)(a1 + 1144)))
        {
          v4 = *__error();
          v5 = __stderrp;
          v6 = strerror(v4);
          fprintf(v5, "%s: removefile_cancel(...) failed with errno=%d: %s\n", "dtc_timer", v4, v6);
        }
        *(_DWORD *)(a1 + 1308) |= 8u;
      }
    }
  }
  v7 = pthread_mutex_unlock(v2);
  if (v7)
  {
    v10 = __stderrp;
    strerror(v7);
    fprintf(v10, "dirs_cleaner: tag=%s err=%d err_str=%s\n");
LABEL_13:
    exit(71);
  }
  return 0;
}
