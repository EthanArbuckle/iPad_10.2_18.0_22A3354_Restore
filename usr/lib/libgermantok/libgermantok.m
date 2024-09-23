uint64_t germantok_tokenize()
{
  uint64_t v0;
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  int v16;
  char v17;
  int32_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  BOOL v24;
  const UChar *v25;
  int v26;
  unsigned int v27;
  BOOL v28;
  int v29;
  int32_t v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  char v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  int *v42;
  uint64_t v43;
  int v44;
  int v45;
  double v46;
  uint64_t v47;
  double v48;
  int v49;
  long double v50;
  double *v51;
  uint64_t v52;
  char v53;
  int v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  char v59;
  int32_t v60;
  _QWORD *v61;
  _QWORD *v62;
  int st_ino;
  double v64;
  uint64_t *p_tv_nsec;
  stat *v66;
  uint64_t *v67;
  int v68;
  stat *v69;
  double v70;
  double v71;
  uint64_t *v72;
  __darwin_time_t tv_sec;
  __darwin_time_t v74;
  __darwin_time_t *v75;
  int v76;
  int32_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  unint64_t v85;
  unint64_t v86;
  unsigned __int8 *v87;
  unint64_t v88;
  _QWORD *v90;
  uint64_t v91;
  size_t v92;
  UErrorCode v93;
  CFIndex Length;
  CFIndex *v95;
  CFIndex v96;
  _QWORD *v97;
  _QWORD *v98;
  int v99;
  int v100;
  void *v101;
  void *v102;
  unint64_t st_size;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  stat *v112;
  char v113;
  __CFString *theString;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int32_t v120;
  uint64_t v121;
  uint64_t v122;
  _OWORD v123[2];
  uint64_t v124;
  UErrorCode pErrorCode;
  UErrorCode v126[2];
  _OWORD v127[32];
  __int16 srcLength;
  __int16 srcLength_2;
  char v130[100];
  _QWORD v131[2101];
  _BYTE v132[24];
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _BYTE *v136;
  __int16 v137;
  _BYTE v138[1600];
  uint64_t *v139;
  unsigned __int16 v140;
  char v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  int v149;
  __int16 v150;
  char v151;
  _BYTE v152[111];
  UChar v153[5];
  UChar v154;
  UniChar v155[99];
  stat v156[55];
  uint64_t v157;

  v0 = MEMORY[0x24BDAC7A8]();
  theString = v1;
  v122 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v119 = v0;
  v157 = *MEMORY[0x24BDAC8D0];
  memset(v127, 0, sizeof(v127));
  v131[2000] = v131;
  v150 = 0;
  pthread_mutex_lock(&__gt_mutex);
  v13 = __gt_germanTokenizerInitializeTrie__gt_refContext;
  if (!__gt_germanTokenizerInitializeTrie__gt_refContext)
  {
    __gt_germanTokenizerInitializeTrie__gt_refContext = (uint64_t)malloc_type_malloc(0x18uLL, 0x10A00404568A766uLL);
    if (getenv("APPLE_FRAMEWORKS_ROOT"))
    {
      __strlcpy_chk();
      __strlcat_chk();
      __strlcat_chk();
      v99 = open((const char *)v156, 0, 0);
    }
    else
    {
      v99 = open("/usr/share/germantok/german.index", 0, 0);
    }
    v100 = v99;
    if (v99 == -1)
    {
      v102 = (void *)__gt_germanTokenizerInitializeTrie__gt_refContext;
    }
    else
    {
      memset(v156, 0, 144);
      fstat(v99, v156);
      v101 = mmap(0, v156[0].st_size, 1, 1, v100, 0);
      v102 = (void *)__gt_germanTokenizerInitializeTrie__gt_refContext;
      *(_QWORD *)(__gt_germanTokenizerInitializeTrie__gt_refContext + 8) = v101;
      if (v101 != (void *)-1)
      {
        v116 = v10;
        close(v100);
        st_size = v156[0].st_size;
        v104 = __gt_germanTokenizerInitializeTrie__gt_refContext;
        *(_QWORD *)__gt_germanTokenizerInitializeTrie__gt_refContext = v156[0].st_size;
        v105 = *(_QWORD *)(v104 + 8);
        v106 = (char *)malloc_type_malloc(0x48uLL, 0x1090040DA38FBB1uLL);
        if (v106)
        {
          *((_QWORD *)v106 + 8) = 0;
          *((_OWORD *)v106 + 2) = 0u;
          *((_OWORD *)v106 + 3) = 0u;
          *(_OWORD *)v106 = 0u;
          *((_OWORD *)v106 + 1) = 0u;
          *((_QWORD *)v106 + 1) = v105;
          *((_QWORD *)v106 + 5) = st_size;
          if (st_size >= 0x18 && v105)
          {
            *(_DWORD *)v106 = *(_DWORD *)(v105 + 4);
            *((_QWORD *)v106 + 2) = v105 + *(unsigned int *)(v105 + 12);
            v107 = *(_QWORD *)(v105 + 16);
            *(_QWORD *)&v108 = v107;
            *((_QWORD *)&v108 + 1) = HIDWORD(v107);
            *(_OWORD *)(v106 + 24) = v108;
          }
          v13 = __gt_germanTokenizerInitializeTrie__gt_refContext;
          *(_QWORD *)(__gt_germanTokenizerInitializeTrie__gt_refContext + 16) = v106;
          v10 = v116;
          goto LABEL_2;
        }
        v102 = (void *)__gt_germanTokenizerInitializeTrie__gt_refContext;
        *(_QWORD *)(__gt_germanTokenizerInitializeTrie__gt_refContext + 16) = 0;
      }
    }
    free(v102);
    __gt_germanTokenizerInitializeTrie__gt_refContext = 0;
    pthread_mutex_unlock(&__gt_mutex);
    return 0;
  }
LABEL_2:
  *(_QWORD *)&v127[0] = *(_QWORD *)(v13 + 16);
  pthread_mutex_unlock(&__gt_mutex);
  result = v150;
  if ((v12 & 0x80000000) != 0 || v150 >= v10)
    return result;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  LOWORD(v19) = v150;
  v20 = v12;
  v21 = (int)v12;
  v22 = v119;
  v109 = v6;
  v110 = v4;
  v111 = v8;
  v115 = v10;
  v117 = (int)v12;
  v118 = v12;
  do
  {
    if (v15 != v20)
    {
      v23 = *(unsigned __int16 *)(v22 + 2 * v15);
      if (v23 >= 0x30)
      {
        v24 = v23 - 58 > 0x26 || ((1 << (v23 - 58)) & 0x7E0000007FLL) == 0;
        if (v24 && v23 - 0x2000 >= 0xE81 && v23 - 123 >= 0x45 && (v23 & 0xFFFFFFDF) != 0xD7)
        {
          ++v18;
          v17 = 1;
          goto LABEL_175;
        }
      }
    }
    if ((v17 & 1) == 0)
      goto LABEL_174;
    v121 = v16;
    v25 = (const UChar *)(v22 + 2 * v16);
    v26 = *v25;
    if ((v26 - 65) >= 0x1A)
    {
      v27 = v26 - 196;
      v28 = v27 > 0x18;
      v29 = (1 << v27) & 0x1040001;
      if (v28 || v29 == 0)
      {
        if (v8)
        {
          v61 = (_QWORD *)(v8 + 16 * result);
          *v61 = v121;
          v61[1] = v18;
        }
        if (v6)
          *(_QWORD *)(v6 + 8 * result) = 0;
        if (v4)
        {
          v62 = (_QWORD *)(v4 + 16 * result);
          *v62 = 0;
          v62[1] = 0;
        }
        if (v122)
          *(_QWORD *)(v122 + 8 * result) = 0;
        goto LABEL_173;
      }
    }
    v149 = 0;
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v151 = 0;
    v136 = v132;
    v132[0] = 0;
    v134 = 0;
    v135 = 0;
    v133 = 0;
    v142 = xmmword_208397F00;
    v139 = (uint64_t *)v138;
    v140 = 0;
    v137 = 0;
    v141 = 0;
    pErrorCode = U_ZERO_ERROR;
    srcLength_2 = v18;
    v120 = v18;
    v31 = u_strToLower((UChar *)v127 + 4, 256, v25, v18, "en_us", &pErrorCode);
    srcLength = v31;
    if (pErrorCode)
      goto LABEL_165;
    if (v31 << 16 > 6488064)
      goto LABEL_165;
    u_strToUTF8(v130, 100, 0, (const UChar *)v127 + 4, (__int16)v31, &pErrorCode);
    if (pErrorCode)
      goto LABEL_165;
    v32 = v130[0];
    if (v130[0])
    {
      v33 = 0;
      while (1)
      {
        if (v32 == 101)
        {
          if ((_DWORD)v33)
          {
            v34 = v130[v33 - 1] - 65;
            if (v34 < 0x35 && ((0x10400100104001uLL >> v34) & 1) != 0)
              break;
          }
        }
        v32 = v130[++v33];
        if (!v32)
          goto LABEL_27;
      }
      v35 = 1;
    }
    else
    {
LABEL_27:
      v35 = 0;
    }
    v124 = 0;
    memset(v123, 0, sizeof(v123));
    v36 = strlen(v130);
    __gt_getWordData((uint64_t *)v127, (uint64_t)v123, v130);
    if (!DWORD1(v123[0]) || !BYTE2(v123[0]))
    {
      __gt_findSubstrings();
      v52 = (v36 - 1);
      __gt_tokenizeHelper((uint64_t)v127, v52, (uint64_t)v132, 0, (uint64_t)v25);
      if (v141)
        goto LABEL_165;
      v53 = v35 ^ 1;
      if (v140)
        v53 = 1;
      if ((v53 & 1) == 0)
      {
        v151 = 1;
        v54 = srcLength;
        if (srcLength >= 1)
        {
          v55 = 0;
          v56 = 0;
          while (1)
          {
            v57 = v56 + 1;
            v58 = *((unsigned __int16 *)v127 + v56 + 4);
            if ((int)v57 < v54)
            {
              if (*((unsigned __int16 *)v127 + v56 + 4) > 0x60u)
              {
                if (v58 == 117)
                {
                  if (*((_WORD *)v127 + (int)v57 + 4) == 101)
                  {
                    v59 = 1;
                    LOWORD(v58) = 252;
                    goto LABEL_76;
                  }
                }
                else if (v58 == 111)
                {
                  if (*((_WORD *)v127 + (int)v57 + 4) == 101)
                  {
                    v59 = 1;
                    LOWORD(v58) = 246;
                    goto LABEL_76;
                  }
                }
                else if (v58 == 97 && *((_WORD *)v127 + v57 + 4) == 101)
                {
                  v59 = 1;
                  LOWORD(v58) = 228;
                  goto LABEL_76;
                }
              }
              else if (v58 == 65)
              {
                if (*((_WORD *)v127 + (int)v57 + 4) == 101)
                {
                  v59 = 1;
                  LOWORD(v58) = 196;
                  goto LABEL_76;
                }
              }
              else if (v58 == 79)
              {
                if (*((_WORD *)v127 + (int)v57 + 4) == 101)
                {
                  v59 = 1;
                  LOWORD(v58) = 214;
                  goto LABEL_76;
                }
              }
              else if (v58 == 85 && *((_WORD *)v127 + (int)v57 + 4) == 101)
              {
                v59 = 1;
                LOWORD(v58) = 220;
LABEL_76:
                ++v56;
                goto LABEL_78;
              }
            }
            v59 = 0;
LABEL_78:
            *((_WORD *)&v156[0].st_dev + v55) = v58;
            v152[v55] = v59;
            v60 = v55 + 1;
            if (v55 <= 0x62)
            {
              ++v56;
              ++v55;
              if (v56 < v54)
                continue;
            }
            goto LABEL_160;
          }
        }
        v60 = 0;
LABEL_160:
        srcLength = v60;
        u_memcpy((UChar *)v127 + 4, (const UChar *)v156, v60);
        u_strToUTF8(v130, 100, 0, (const UChar *)v127 + 4, srcLength, &pErrorCode);
        v8 = v111;
        if (pErrorCode)
          goto LABEL_165;
        __gt_findSubstrings();
        __gt_tokenizeHelper((uint64_t)v127, v52, (uint64_t)v132, 0, (uint64_t)v25);
      }
    }
    if (v141)
      goto LABEL_165;
    v37 = v140;
    if (!v140)
      goto LABEL_165;
    v139 = (uint64_t *)v138;
    if ((__int16)v140 < 1)
    {
      v41 = 0;
    }
    else
    {
      v38 = 0;
      v39 = (uint64_t *)v138;
      do
      {
        v40 = *v39;
        v41 = (uint64_t *)(&v156[0].st_dev + 10 * v38);
        v41[4] = *v39;
        *v41 = 0xFFEFFFFFFFFFFFFFLL;
        v42 = (int *)(v41 + 1);
        v43 = *(_QWORD *)(v40 + 40);
        if (v43)
        {
          v44 = 0;
          v45 = 0;
          v46 = -1.79769313e308;
          while (1)
          {
            v47 = v43;
            if (*(_BYTE *)v40)
              break;
            if (v46 == -1.79769313e308)
              v48 = 0.0;
            else
              v48 = v46;
            v46 = v48 + log((double)*(int *)(v40 + 32));
            *(double *)v41 = v46;
            if (v44 <= 1)
              v49 = 1;
            else
              v49 = v44;
            v44 = v49 * *(_DWORD *)(v40 + 16);
            ++v45;
            v43 = *(_QWORD *)(v47 + 40);
            v40 = v47;
            if (!v43)
              goto LABEL_46;
          }
          v45 = 1;
          *v42 = 1;
          *v41 = 0xFFEFFFFFFFFFFFFFLL;
          v46 = -1.79769313e308;
        }
        else
        {
          v45 = 0;
          v44 = 0;
          v46 = -1.79769313e308;
LABEL_46:
          *v42 = v45;
        }
        v50 = pow((double)v44, 1.0 / (double)v45);
        v51 = (double *)(&v156[0].st_dev + 10 * v38);
        v51[2] = v46 * (1.0 / (double)v45);
        v51[3] = v50;
        v139 = ++v39;
        ++v38;
      }
      while (v38 != v37);
    }
    qsort(v156, (__int16)v37, 0x28uLL, (int (__cdecl *)(const void *, const void *))__gt_compareParseScoresDescending);
    st_ino = v156[0].st_ino;
    v64 = *(double *)&v156[0].st_uid;
    v6 = v109;
    v4 = v110;
    v8 = v111;
    v10 = v115;
    if (*(double *)&v156[0].st_uid < 4.09434456 && srcLength / SLODWORD(v156[0].st_ino) < 5)
      goto LABEL_165;
    p_tv_nsec = &v156[0].st_atimespec.tv_nsec;
    v66 = v156;
    while (p_tv_nsec <= v41)
    {
      v67 = p_tv_nsec;
      while (1)
      {
        v68 = st_ino - *((_DWORD *)p_tv_nsec + 2);
        if (v68 >= 1 && v64 + (double)v68 * -0.287682072 < *((double *)p_tv_nsec + 2))
          break;
        p_tv_nsec += 5;
        if (p_tv_nsec > v41)
          goto LABEL_107;
      }
      v66 = (stat *)v67;
      v64 = *((double *)v67 + 2);
      st_ino = *((_DWORD *)v67 + 2);
      p_tv_nsec = v67 + 5;
    }
LABEL_107:
    while (1)
    {
      v72 = &v66->st_atimespec.tv_nsec;
      if (&v66->st_atimespec.tv_nsec > v41)
        break;
      v69 = v66;
      v70 = *(double *)&v66->st_rdev;
      v71 = *(double *)&v66->st_uid + -0.287682072;
      v66 = (stat *)((char *)v66 + 40);
      while (*((double *)v72 + 3) <= v70 || v71 >= *((double *)v72 + 2) || *((int *)v72 + 2) <= 1)
      {
        v72 += 5;
        if (v72 > v41)
        {
          v66 = v69;
          goto LABEL_113;
        }
      }
    }
LABEL_113:
    if (SLODWORD(v66->st_ino) > 10)
      goto LABEL_165;
    tv_sec = v66->st_atimespec.tv_sec;
    v75 = (__darwin_time_t *)(tv_sec + 40);
    v74 = *(_QWORD *)(tv_sec + 40);
    v112 = v66;
    if (!v74)
    {
      v10 = v115;
      goto LABEL_165;
    }
    v76 = 0;
    v113 = 1;
    do
    {
      if (!*(_QWORD *)(*(_QWORD *)(v112->st_atimespec.tv_sec + 40) + 40) && !*(_QWORD *)(tv_sec + 24))
        goto LABEL_157;
      *(_QWORD *)v126 = 0;
      u_strFromUTF8(&v154, 100, (int32_t *)&v126[1], &v130[*(_QWORD *)(tv_sec + 8)], *(_DWORD *)(tv_sec + 16), v126);
      v126[0] = U_ZERO_ERROR;
      v77 = u_strToUpper(v153, 5, &v154, 1, "en", v126);
      if (v111)
      {
        v78 = *(_QWORD *)(tv_sec + 8);
        v79 = v130;
        v80 = &v130[v78];
        if (v78 < 1)
        {
          v81 = 0;
        }
        else
        {
          v81 = 0;
          do
          {
            ++v81;
            v79 += __gt_utf8ByteLength_utf8_len_table[(unint64_t)*v79 >> 4];
          }
          while (v79 < v80);
        }
        v82 = *(_QWORD *)(tv_sec + 16);
        if (v82 < 1)
        {
          v83 = 0;
          if (v151)
            goto LABEL_134;
        }
        else
        {
          v83 = 0;
          v84 = &v80[v82];
          do
          {
            ++v83;
            v80 += __gt_utf8ByteLength_utf8_len_table[(unint64_t)*v80 >> 4];
          }
          while (v80 < v84);
          if (v151)
          {
            v85 = v81 + v83;
            v86 = v81;
            do
            {
              if (v152[v86])
                ++v83;
              ++v86;
            }
            while (v86 < v85);
LABEL_134:
            v87 = v152;
            v88 = v81;
            if (v81)
            {
              do
              {
                if (*v87++)
                  ++v88;
                --v81;
              }
              while (v81);
              v81 = v88;
            }
          }
        }
        v90 = (_QWORD *)(v111 + 16 * v150);
        *v90 = v81 + v121;
        v90[1] = v83;
      }
      if (v109)
      {
        v91 = 2;
        if ((v113 & 1) == 0)
          v91 = 0;
        *(_QWORD *)(v109 + 8 * v150) = v91;
        v113 = 0;
      }
      if (*(_BYTE *)(tv_sec + 1))
      {
        v92 = *(_QWORD *)(tv_sec + 16) + *(_QWORD *)(tv_sec + 8);
        if (v92 < strlen(v130) && v130[v92] == 101)
          ++*(_QWORD *)(v111 + 16 * v150 + 8);
        v93 = v126[1];
        v155[v126[1] - 1] = 101;
        v126[1] = v93 + 1;
      }
      if (v122)
        *(_QWORD *)(v122 + 8 * v150) = 2;
      if (v110)
      {
        Length = CFStringGetLength(theString);
        v95 = (CFIndex *)(v110 + 16 * v150);
        v96 = v77 + v126[1] - 1;
        *v95 = Length;
        v95[1] = v96;
      }
      if (theString)
      {
        CFStringAppendCharacters(theString, v153, v77);
        CFStringAppendCharacters(theString, v155, (int)v126[1] - 1);
      }
      ++v150;
      ++v76;
      if (v115 == v150)
        break;
      v74 = *v75;
LABEL_157:
      tv_sec = v74;
      v75 = (__darwin_time_t *)(v74 + 40);
      v74 = *(_QWORD *)(v74 + 40);
    }
    while (v74);
    v10 = v115;
    if (v76)
    {
      LOWORD(v19) = v150;
      v16 = v15;
      v22 = v119;
      v21 = v117;
      v20 = v118;
      goto LABEL_174;
    }
LABEL_165:
    v19 = v150;
    if (v8)
    {
      v97 = (_QWORD *)(v8 + 16 * v150);
      *v97 = v121;
      v97[1] = v120;
    }
    v22 = v119;
    v20 = v118;
    if (v6)
      *(_QWORD *)(v6 + 8 * v19) = 2;
    v21 = v117;
    if (v4)
    {
      v98 = (_QWORD *)(v4 + 16 * v19);
      *v98 = 0;
      v98[1] = 0;
    }
    if (v122)
      *(_QWORD *)(v122 + 8 * v19) = 0;
LABEL_173:
    LOWORD(v19) = v19 + 1;
    v150 = v19;
    v16 = v15;
LABEL_174:
    v18 = 0;
    v17 = 0;
    ++v16;
LABEL_175:
    result = (__int16)v19;
    if (v15 >= v21)
      break;
    ++v15;
  }
  while ((__int16)v19 < v10);
  return result;
}

uint64_t __gt_getWordData(uint64_t *a1, uint64_t a2, char *__s)
{
  char *v3;
  uint64_t v6;
  uint64_t result;
  int8x8_t v8;
  unsigned int v9;
  int *v10;
  int v11;
  int v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  unsigned int *v20;
  unsigned int v21;
  _DWORD *v22;
  unsigned int *v23;
  unsigned __int8 *v24;
  unsigned int v25;
  unsigned __int8 *v26;
  char *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  size_t v31;
  int v32;
  unsigned int v33;
  int v34;
  int v35;

  v3 = __s;
  v6 = *a1;
  result = strlen(__s);
  v9 = result;
  v10 = (int *)v6;
  while (1)
  {
    v11 = *v10;
    v12 = v11 & 3;
    if (v12 != 2)
      break;
    v14 = *(_QWORD *)(v6 + 8);
    v15 = (v11 - 2);
    v13 = (unsigned int *)(v14 + v15);
    if (!v9)
    {
LABEL_31:
      v33 = *v13;
      goto LABEL_32;
    }
    v16 = *v3;
    v17 = v16 >> 5;
    v18 = v13[(v16 >> 5) + 1];
    if (((v18 >> v16) & 1) == 0)
      goto LABEL_30;
    if (v16 >= 0x20)
    {
      v19 = 0;
      if (v17 <= 1)
        v17 = 1;
      else
        v17 = v17;
      v20 = (unsigned int *)(v14 + v15 + 4);
      do
      {
        v21 = *v20++;
        v8 = vcnt_s8((int8x8_t)v21);
        v8.i16[0] = vaddlv_u8((uint8x8_t)v8);
        v19 += v8.i32[0];
        --v17;
      }
      while (v17);
    }
    else
    {
      v19 = 0;
    }
    v8.i32[0] = v18 & ~(-1 << (v16 & 0x1F));
    v8 = vcnt_s8(v8);
    v8.i16[0] = vaddlv_u8((uint8x8_t)v8);
    v10 = (int *)&v13[v19 + v8.i32[0] + 10];
LABEL_16:
    --v9;
    ++v3;
  }
  if (v12 == 3)
  {
    v13 = (unsigned int *)(*(_QWORD *)(v6 + 8) + (v11 - 3));
    if (!v9)
      goto LABEL_31;
    v10 = (int *)&v13[*v3 + 1];
    goto LABEL_16;
  }
  if (v12 != 1)
  {
LABEL_30:
    v33 = 0;
    goto LABEL_32;
  }
  v22 = (_DWORD *)(*(_QWORD *)(v6 + 16) + (v11 - 1));
  v23 = v22 + 1;
  if (v9)
  {
    v25 = *v22;
    v24 = (unsigned __int8 *)(v22 + 2);
    v26 = (unsigned __int8 *)v23 + v25;
    if (v24 < v26)
    {
      while (1)
      {
        v29 = *v24;
        v27 = (char *)(v24 + 1);
        v28 = v29;
        v30 = v29 - v9;
        v31 = v29 >= v9 ? v9 : v28;
        result = memcmp(v27, v3, v31);
        v32 = (_DWORD)result ? result : v30;
        if (v32 > 0)
          break;
        if (!v32)
        {
          v33 = *(_DWORD *)&v27[v28];
          goto LABEL_32;
        }
        v33 = 0;
        v24 = (unsigned __int8 *)&v27[v28 + 4];
        if (v24 >= v26)
          goto LABEL_32;
      }
    }
    goto LABEL_30;
  }
  v33 = *v23;
LABEL_32:
  *(_DWORD *)(a2 + 4) = v33 & 0xFFFFF;
  *(_BYTE *)(a2 + 2) = (v33 & 0x800000) != 0;
  *(_BYTE *)a2 = (v33 & 0x400000) != 0;
  *(_BYTE *)(a2 + 1) = (v33 & 0x200000) != 0;
  v34 = HIBYTE(v33) & 0xF;
  if (v34 == 15)
    v35 = -1;
  else
    v35 = 100 * v34;
  *(_DWORD *)(a1[2078] + 8) = v35;
  return result;
}

uint64_t __btrie_find_common_prefix(uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4, unint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  unsigned int v23;
  unint64_t v24;
  unsigned __int8 *v25;
  char *v26;
  size_t v27;
  unsigned int v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t result;
  int v39;
  unsigned int *v40;
  unsigned int v41;
  uint8x8_t v42;

  v13 = a2 & 3;
  switch(v13)
  {
    case 1:
      v17 = (_DWORD *)(*(_QWORD *)(a1 + 16) + (a2 - 1));
      v18 = v17 + 1;
      v19 = v17[1];
      if (!v19)
        goto LABEL_43;
      if (a7)
        *(_QWORD *)(a7 + 8 * *a5) = &a3[-a8];
      v20 = *a5;
      v21 = *a5 + 1;
      *a5 = v21;
      *(_DWORD *)(a6 + 4 * v20) = v19;
      if (v21 <= 0x3FF)
      {
LABEL_43:
        if (!a4)
          return 0;
        v23 = *v17;
        v22 = (char *)(v17 + 2);
        v24 = (unint64_t)v18 + v23;
        if ((unint64_t)v22 >= v24)
          return 0;
        v25 = &a3[-a8];
        while (1)
        {
          v28 = *v22;
          v26 = v22 + 1;
          v27 = v28;
          if (v28 <= a4)
          {
            v29 = memcmp(v26, a3, v27);
            if (v29 > 0)
              return 0;
            if (!v29)
            {
              v30 = *a5;
              if (a7)
              {
                *(_QWORD *)(a7 + 8 * v30) = &v25[v27];
                v30 = *a5;
              }
              *a5 = v30 + 1;
              *(_DWORD *)(a6 + 4 * v30) = *(_DWORD *)&v26[v27];
              if (*a5 > 0x3FF)
                break;
            }
          }
          v22 = &v26[v27 + 4];
          if ((unint64_t)v22 >= v24)
            return 0;
        }
      }
      break;
    case 2:
      v31 = *(_QWORD *)(a1 + 8);
      v32 = (a2 - 2);
      v33 = *(_DWORD *)(v31 + v32);
      if (!v33)
        goto LABEL_44;
      if (a7)
        *(_QWORD *)(a7 + 8 * *a5) = &a3[-a8];
      v34 = *a5;
      v35 = *a5 + 1;
      *a5 = v35;
      *(_DWORD *)(a6 + 4 * v34) = v33;
      if (v35 <= 0x3FF)
      {
LABEL_44:
        if (a4)
        {
          v36 = *a3;
          v37 = v36 >> 5;
          if (((*(_DWORD *)(v31 + v32 + 4 * (v36 >> 5) + 4) >> v36) & 1) != 0)
          {
            if (v36 >= 0x20)
            {
              v39 = 0;
              if (v37 <= 1)
                v37 = 1;
              else
                v37 = v37;
              v40 = (unsigned int *)(v32 + v31 + 4);
              do
              {
                v41 = *v40++;
                v42 = (uint8x8_t)vcnt_s8((int8x8_t)v41);
                v42.i16[0] = vaddlv_u8(v42);
                v39 += v42.i32[0];
                --v37;
              }
              while (v37);
            }
LABEL_39:
            result = __btrie_find_common_prefix();
            if (!(_DWORD)result)
              return result;
            return 1;
          }
        }
        return 0;
      }
      break;
    case 3:
      v14 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + (a2 - 3));
      if (!v14)
        goto LABEL_8;
      if (a7)
        *(_QWORD *)(a7 + 8 * *a5) = &a3[-a8];
      v15 = *a5;
      v16 = *a5 + 1;
      *a5 = v16;
      *(_DWORD *)(a6 + 4 * v15) = v14;
      if (v16 <= 0x3FF)
      {
LABEL_8:
        if (a4)
          goto LABEL_39;
        return 0;
      }
      break;
    default:
      return 0;
  }
  return 1;
}

size_t __gt_findSubstrings()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  size_t result;
  int v6;
  uint64_t v7;
  int v8;
  int *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v25[1024];
  _DWORD v26[1024];
  uint64_t v27;

  v0 = MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v27 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v0 + 16624) = v0 + 624;
  v2 = 2079;
  v3 = 656;
  do
  {
    if ((v2 - 2079) <= 0x63)
      *(_QWORD *)(v0 + 8 * v2) = 0;
    *(_QWORD *)(v0 + v3) = 0;
    ++v2;
    v3 += 40;
  }
  while ((_DWORD)v2 != 2479);
  v4 = v0 + 524;
  result = strlen((const char *)(v0 + 524));
  v6 = result;
  if ((int)result >= 1)
  {
    v7 = 0;
    v8 = 0;
    v23 = result;
    while (1)
    {
      v9 = *(int **)v1;
      v24 = 0;
      result = __btrie_find_common_prefix((uint64_t)v9, *v9, (unsigned __int8 *)(v4 + v7), v6 - (int)v7, &v24, (uint64_t)v26, (uint64_t)v25, v4 + v7);
      v10 = v24;
      if (v24)
        break;
LABEL_24:
      if (++v7 == v23)
        return result;
    }
    v11 = 0;
    if (v8 <= 398)
      v12 = 398;
    else
      v12 = v8;
    v13 = (v12 - v8);
    v14 = v7 - 1;
    while (1)
    {
      v15 = v25[v11] >= 0x100uLL ? 256 : v25[v11];
      if (v14 + (int)v15 > 99)
        break;
      v16 = v26[v11];
      v17 = HIBYTE(v16) & 0xF;
      v18 = 100 * v17;
      if (v17 == 15)
        v18 = -1;
      v19 = *(_QWORD *)(v1 + 16624);
      *(_DWORD *)(v19 + 8) = v18;
      *(_DWORD *)(v19 + 4) = v26[v11] & 0xFFFFF;
      *(_BYTE *)(v19 + 2) = (v16 & 0x800000) != 0;
      *(_BYTE *)v19 = (v16 & 0x400000) != 0;
      *(_BYTE *)(v19 + 1) = (v16 & 0x200000) != 0;
      *(_QWORD *)(v19 + 16) = v7;
      *(_QWORD *)(v19 + 24) = v15;
      v20 = v1 + 8 * (v14 + (int)v15);
      v21 = *(_QWORD *)(v20 + 16632);
      if (v21)
      {
        do
        {
          v22 = v21;
          v21 = *(_QWORD *)(v21 + 32);
        }
        while (v21);
        *(_QWORD *)(v22 + 32) = v19;
      }
      else
      {
        *(_QWORD *)(v20 + 16632) = v19;
        v19 = *(_QWORD *)(v1 + 16624);
      }
      *(_QWORD *)(v1 + 16624) = v19 + 40;
      if (v11 == v13)
        break;
      ++v8;
      if (v10 <= ++v11)
        goto LABEL_24;
    }
  }
  return result;
}

uint64_t __gt_tokenizeHelper(uint64_t result, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int32_t v30;
  int v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t i;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  const char *v67;
  unsigned int v68;
  uint64_t v69;
  _OWORD v70[2];
  uint64_t v71;
  UErrorCode pErrorCode;
  char __s[100];
  UChar dest[8];
  __int128 v75;
  uint64_t v76;
  char v77[100];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  if ((a2 - 100) < 0xFFFFFF9F)
    return result;
  v5 = a5;
  v6 = a4;
  v7 = a2;
  v8 = result;
  v9 = result + 36632;
  v10 = a2;
  v69 = a3;
  if (a4)
    goto LABEL_3;
  v43 = *(unsigned __int8 *)(result + 524 + a2);
  v44 = (a2 - 1);
  v45 = *(unsigned __int8 *)(result + 524 + v44);
  v68 = a2 - 2;
  v46 = *(unsigned __int8 *)(result + 524 + (a2 - 2));
  if (v45 == 101)
  {
    if ((_DWORD)v43 == 101)
    {
LABEL_88:
      v50 = *(_QWORD *)(a3 + 40);
      if (v50)
        goto LABEL_3;
      do
      {
        if (byte_208397F20[v50] == v45)
          goto LABEL_105;
        ++v50;
      }
      while (v50 != 5);
      v51 = "e";
      goto LABEL_99;
    }
    if ((_DWORD)v43 != 115 && (_DWORD)v43 != 110)
      goto LABEL_3;
    for (i = 0; i != 5; ++i)
    {
      if (byte_208397F20[i] == v46)
        goto LABEL_81;
    }
    if ((_DWORD)v43 == 115)
      v48 = "es";
    else
      v48 = "en";
    result = __gt_tokenizeHelper(result, v68, a3, v48, a5);
    a3 = v69;
    if (*(_BYTE *)(v9 + 1626))
      return result;
  }
LABEL_81:
  if ((_DWORD)v43 == 101)
    goto LABEL_88;
  if ((_DWORD)v43 != 110)
  {
    if ((_DWORD)v43 != 115)
      goto LABEL_105;
    v49 = 0;
    while (byte_208397F25[v49] != v45)
    {
      if (++v49 == 6)
        goto LABEL_98;
    }
    if (v49 != 3 || v46 == 116)
    {
LABEL_105:
      if (v45 != 115 || (_DWORD)v43 != 116)
        goto LABEL_3;
      v52 = "st";
      v53 = v8;
      v54 = v68;
      goto LABEL_108;
    }
LABEL_98:
    v51 = "s";
LABEL_99:
    result = __gt_tokenizeHelper(v8, (v7 - 1), a3, v51, v5);
    a3 = v69;
    if (*(_BYTE *)(v9 + 1626))
      return result;
    goto LABEL_105;
  }
  if (v45 == 108 || v45 == 114)
  {
    v52 = "n";
    v53 = v8;
    v54 = (v7 - 1);
LABEL_108:
    result = __gt_tokenizeHelper(v53, v54, a3, v52, v5);
    if (*(_BYTE *)(v9 + 1626))
      return result;
LABEL_3:
    v11 = *(_QWORD *)(v8 + 8 * v10 + 16632);
    if (!v11)
      return result;
    while (1)
    {
      v13 = *(_QWORD *)(v11 + 16);
      v12 = *(_QWORD *)(v11 + 24);
      v14 = (uint64_t *)(v11 + 16);
      v15 = v12 + v13;
      if (v12 + v13 <= (int)v13)
        goto LABEL_13;
      v16 = (int)v13;
      do
      {
        while (v16 > 99)
        {
          if (v15 <= ++v16)
            goto LABEL_13;
        }
        v17 = *(unsigned __int8 *)(v8 + v16++ + 38280);
      }
      while (v15 > v16 && v17);
      if (v17 || *(_QWORD *)(v9 + 1632) == v13 && *(_QWORD *)(v9 + 1640) == v12)
        goto LABEL_13;
      if (v13 < 0 || v15 >= 99)
        goto LABEL_95;
      result = __strncpy_chk();
      v18 = *(_QWORD *)(v11 + 24);
      if (v18 << 32 < 1)
      {
        v19 = 0;
        v21 = v69;
      }
      else
      {
        v19 = 0;
        v20 = v77;
        v21 = v69;
        do
        {
          ++v19;
          v20 += __gt_utf8ByteLength_utf8_len_table[(unint64_t)*v20 >> 4];
        }
        while (v20 < &v77[(int)v18]);
      }
      v22 = *(_DWORD *)(v11 + 4);
      if (!v22)
        goto LABEL_13;
      v23 = v22 > 50 || v19 >= 6;
      if (!v23 || *(_BYTE *)v11 && v19 <= 5 && v22 <= 999 && *(_BYTE *)(v11 + 2))
        goto LABEL_13;
      if (*(_DWORD *)(v21 + 36))
      {
        v24 = v6;
        v25 = *(_QWORD *)(v21 + 16) + v18;
        v67 = v24;
        if (v24)
          v25 += strlen(v24);
        v26 = *(__int16 *)(v8 + 522);
        v27 = v26 - 1;
        if (*v14 < v26)
          v27 = *v14;
        v28 = v27 & ~(v27 >> 63);
        v29 = v28 + v25 <= v26 ? v25 : v26 - v28;
        v6 = v67;
        if (v29)
          break;
      }
LABEL_47:
      v77[v18] = 101;
      v77[*(_QWORD *)(v11 + 24) + 1] = 0;
      v76 = 0;
      *(_OWORD *)dest = 0u;
      v75 = 0u;
      result = __gt_getWordData((uint64_t *)v8, (uint64_t)dest, v77);
      v32 = dest[2];
      if (*(_DWORD *)&dest[2])
      {
        v33 = v8 + 38280;
        if (*(int *)&dest[2] >= 3 * *(_DWORD *)(v11 + 4))
        {
          *(_DWORD *)(v11 + 4) = *(_DWORD *)&dest[2];
          v32 = 1;
        }
        else
        {
          v32 = 0;
        }
        v34 = v69;
      }
      else
      {
        v34 = v69;
        v33 = v8 + 38280;
      }
      if (*(_BYTE *)(v11 + 1))
      {
        v35 = *(_QWORD *)(v11 + 16);
        v36 = *(_QWORD *)(v11 + 24) + v35;
        if (v36 > (int)v35)
        {
          v35 = (int)v35;
          do
          {
            if (v35 <= 99)
              *(_BYTE *)(v33 + v35) = 1;
            ++v35;
          }
          while (v36 != v35);
        }
      }
      v37 = *(_QWORD *)v9;
      *(_QWORD *)v9 += 48;
      v38 = (__int16)++*(_WORD *)(v9 + 8);
      if (v38 > 398)
        goto LABEL_95;
      *(_OWORD *)(v37 + 56) = *(_OWORD *)v14;
      v39 = *(_QWORD *)v9;
      *(_BYTE *)(v39 + 1) = v32;
      *(_QWORD *)(v39 + 24) = v6;
      *(_DWORD *)(v39 + 32) = *(_DWORD *)(v11 + 4);
      v40 = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v39 + 36) = v40;
      *(_QWORD *)(v39 + 40) = v34;
      *(_BYTE *)v39 = 0;
      if (v6 && v40)
      {
        result = strlen(v6);
        v41 = result + *(_QWORD *)(v11 + 24);
        *(_QWORD *)(v9 + 1632) = *(_QWORD *)(v11 + 16);
        *(_QWORD *)(v9 + 1640) = v41;
      }
      if (!*v14)
      {
        **(_QWORD **)(v9 + 1616) = v39;
        v42 = *(_WORD *)(v9 + 1624) + 1;
        *(_WORD *)(v9 + 1624) = v42;
        *(_QWORD *)(v9 + 1616) += 8;
        if (v42 > 198)
        {
LABEL_95:
          *(_BYTE *)(v9 + 1626) = 1;
          return result;
        }
      }
      if (!*(_BYTE *)(v9 + 1626))
      {
        result = __gt_tokenizeHelper(v8, (v7 - *(_DWORD *)(v11 + 24)), *(_QWORD *)v9, 0, v5);
        if (*(_BYTE *)(v9 + 1626))
          return result;
      }
LABEL_13:
      v11 = *(_QWORD *)(v11 + 32);
      if (!v11)
        return result;
    }
    pErrorCode = U_ZERO_ERROR;
    v30 = u_strToLower(dest, 100, (const UChar *)(v5 + 2 * v28), v29, "en_us", &pErrorCode);
    pErrorCode = U_ZERO_ERROR;
    u_strToUTF8(__s, 100, 0, dest, v30, &pErrorCode);
    v71 = 0;
    memset(v70, 0, sizeof(v70));
    __gt_getWordData((uint64_t *)v8, (uint64_t)v70, __s);
    v31 = *(_DWORD *)(v69 + 36);
    if (DWORD1(v70[0]))
    {
      if (SDWORD1(v70[0]) <= v31)
      {
LABEL_46:
        v18 = *(_QWORD *)(v11 + 24);
        goto LABEL_47;
      }
    }
    else if ((v31 & 0x80000000) == 0)
    {
      goto LABEL_46;
    }
    *(_BYTE *)v69 = 1;
    goto LABEL_46;
  }
  v55 = 0;
  v56 = byte_208397F20;
  v66 = v9;
  while (1)
  {
    if (v56[v55] == v45)
    {
      v57 = v44;
      v58 = v5;
      v59 = v10;
      v60 = v7;
      v61 = v43;
      v62 = v6;
      v63 = v44;
      v64 = v5;
      v65 = v56;
      result = __gt_tokenizeHelper(v8, v57, a3, "n", v58);
      v56 = v65;
      v5 = v64;
      v44 = v63;
      v6 = v62;
      v43 = v61;
      v7 = v60;
      v10 = v59;
      v9 = v66;
      a3 = v69;
      if (*(_BYTE *)(v66 + 1626))
        return result;
    }
    if (++v55 == 5)
      goto LABEL_105;
  }
}

uint64_t __gt_compareParseScoresDescending(uint64_t a1, uint64_t a2)
{
  double v2;
  unsigned int v3;

  v2 = *(double *)(a2 + 16) - *(double *)(a1 + 16);
  if (v2 == 0.0)
    v3 = 0;
  else
    v3 = -1;
  if (v2 > 0.0)
    return 1;
  else
    return v3;
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x24BDAC920]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

UChar *__cdecl u_memcpy(UChar *dest, const UChar *src, int32_t count)
{
  return (UChar *)MEMORY[0x24BEDBFD8](dest, src, *(_QWORD *)&count);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x24BEDBFE8](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

int32_t u_strToLower(UChar *dest, int32_t destCapacity, const UChar *src, int32_t srcLength, const char *locale, UErrorCode *pErrorCode)
{
  return MEMORY[0x24BEDBFF8](dest, *(_QWORD *)&destCapacity, src, *(_QWORD *)&srcLength, locale, pErrorCode);
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x24BEDC000](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

