void start(int a1, char **a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char **v9;
  const char *v10;
  int v11;
  size_t v12;
  _BYTE *v13;
  int i;
  mach_port_t v15;
  mach_error_t v16;
  mach_msg_type_number_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  mach_zone_name_array_t v21;
  mach_zone_info_array_t v22;
  const char *v23;
  size_t v24;
  _QWORD *v25;
  mach_zone_name_t *v26;
  size_t v27;
  int v28;
  size_t v29;
  const char *v30;
  uint64_t mzi_cur_size;
  unsigned int v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  mach_zone_name_t *v54;
  mach_zone_info_t *v55;
  BOOL v56;
  mach_zone_info_array_t v57;
  uint64_t v58;
  _BYTE *v59;
  mach_zone_name_t *v60;
  mach_zone_info_array_t v61;
  int v62;
  uint64_t v63;
  mach_zone_info_t *v64;
  mach_zone_name_t *v65;
  mach_zone_info_array_t v66;
  int v67;
  mach_zone_name_t *v68;
  _BYTE *v69;
  __int128 v70;
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
  char v85;
  uint64_t j;
  uint64_t v87;
  int v88;
  char *v89;
  mach_zone_name_array_t v90;
  mach_zone_info_array_t v91;
  int (__cdecl *v92)(void *, const void *, const void *);
  uint64_t v93;
  mach_error_t v94;
  FILE **v95;
  FILE *v96;
  FILE *v97;
  FILE *v98;
  BOOL v99;
  _QWORD *v100;
  int v101;
  char v102;
  int v103;
  int v104;
  uint64_t mzi_exhaustible;
  int64x2_t v106;
  uint64_t mzi_collectable;
  uint64_t mzi_sum_size;
  uint64_t mzi_max_size;
  __int128 v110;
  char **v111;
  uint64_t v112;
  mach_zone_name_array_t v113;
  int v114;
  _BYTE *v115;
  uint64_t v116;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt;
  mach_zone_info_array_t info;
  mach_msg_type_number_t namesCnt;
  mach_zone_name_array_t names;
  char __s[16];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 __s1;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;

  names = 0;
  namesCnt = 0;
  info = 0;
  infoCnt = 0;
  memory_info = 0;
  memory_infoCnt = 0;
  v116 = 0;
  signal(2, (void (__cdecl *)(int))sub_1000054C0);
  v4 = *a2;
  v5 = strrchr(*a2, 47);
  if (v5)
    v6 = (uint64_t)(v5 + 1);
  else
    v6 = (uint64_t)v4;
  qword_10000C1F8 = v6;
  v7 = 1;
  if (a1 < 2)
    goto LABEL_41;
  v8 = 0;
  v114 = dword_10000C030;
  v111 = a2;
  v9 = a2 + 1;
  while (1)
  {
    v10 = v9[v8];
    if (!strcmp(v10, "-d"))
    {
      byte_10000C200 = 1;
    }
    else if (!strcmp(v10, "-t"))
    {
      byte_10000C204 = 1;
    }
    else if (!strcmp(v10, "-T"))
    {
      byte_10000C204 = 0;
    }
    else if (!strcmp(v10, "-w"))
    {
      byte_10000C208 = 1;
    }
    else if (!strcmp(v10, "-W"))
    {
      byte_10000C208 = 0;
    }
    else if (!strcmp(v10, "-l"))
    {
      byte_10000C20C = 0;
    }
    else if (!strcmp(v10, "-L"))
    {
      byte_10000C20C = 1;
    }
    else if (!strcmp(v10, "-s"))
    {
      byte_10000C210 = 1;
    }
    else if (!strcmp(v10, "-S"))
    {
      byte_10000C210 = 0;
    }
    else if (!strcmp(v10, "-c"))
    {
      byte_10000C214 = 0;
    }
    else if (!strcmp(v10, "-C"))
    {
      byte_10000C214 = 1;
    }
    else
    {
      if (!strcmp(v10, "-h"))
      {
        v95 = &__stdoutp;
        goto LABEL_177;
      }
      if (!strcmp(v10, "-H"))
      {
        byte_10000C218 = 1;
      }
      else
      {
        if (!strcmp(v10, "-k"))
        {
          v11 = v114 | 0x1E;
        }
        else if (!strcmp(v10, "-kt"))
        {
          v11 = v114 | 0x1C;
        }
        else
        {
          if (strcmp(v10, "-kd"))
          {
            if (!strcmp(v10, "--"))
            {
              v7 = v8 + 2;
LABEL_40:
              a2 = v111;
LABEL_41:
              if (a1 - v7 == 1)
              {
                qword_10000C220 = (uint64_t)a2[v7];
                v12 = strlen((const char *)qword_10000C220);
                goto LABEL_45;
              }
              if (a1 == v7)
              {
                v12 = 0;
                qword_10000C220 = (uint64_t)"";
LABEL_45:
                qword_10000C228 = v12;
                if (byte_10000C200 == 1)
                {
                  byte_10000C210 = 0;
                  byte_10000C214 = 0;
                  byte_10000C218 = 0;
                }
                if (byte_10000C208 == 1)
                {
                  byte_10000C190 = 1;
                  byte_10000C1B0 = 1;
                }
                if (byte_10000C204 == 1)
                  byte_10000C1D0 = 1;
                v13 = 0;
                v100 = 0;
                v99 = 0;
                v102 = 0;
                for (i = 1; ; i = 0)
                {
                  v15 = mach_host_self();
                  v16 = mach_memory_info(v15, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt);
                  if (v16)
                    break;
                  v17 = namesCnt;
                  if (namesCnt != infoCnt)
                  {
                    fprintf(__stderrp, "%s: mach_zone_name/ mach_zone_info: counts not equal?\n");
                    goto LABEL_180;
                  }
                  if (dword_10000C030 != 1)
                  {
                    qword_10000C1D8 = (uint64_t)malloc_type_calloc(0x24uLL, 0x50uLL, 0x10000404247E4FDuLL);
                    v18 = malloc_type_calloc(0x24uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
                    qword_10000C1E0 = (uint64_t)v18;
                    if (!qword_10000C1D8 || !v18)
                    {
                      fprintf(__stderrp, "%s: calloc failed to allocate memory\n");
                      goto LABEL_180;
                    }
                    v17 += 36;
                  }
                  if ((i & 1) != 0)
                  {
                    v13 = malloc_type_malloc(v17, 0xB79C1441uLL);
                    v100 = malloc_type_malloc((unint64_t)infoCnt << 6, 0x1000040FA0F61DDuLL);
                    v19 = infoCnt;
                    qword_10000C1E8 = (uint64_t)&v13[infoCnt];
                    if (!v13 || !v100)
                      goto LABEL_174;
                  }
                  else
                  {
                    v19 = infoCnt;
                  }
                  v101 = i;
                  if ((int)v19 < 1)
                  {
                    v103 = 0;
                  }
                  else
                  {
                    v20 = 0;
                    v103 = 0;
                    v21 = names;
                    v22 = info;
                    v23 = (const char *)qword_10000C220;
                    v24 = qword_10000C228;
                    v113 = names;
                    v115 = v13;
                    v25 = v100;
                    v112 = v19;
                    do
                    {
                      v13[v20] = 0;
                      v26 = &v113[v20];
                      v27 = strnlen(v26->mzn_name, 0x50uLL);
                      if (v24 > v27)
                        goto LABEL_66;
                      v29 = v27 + 1;
                      v30 = (const char *)v21;
                      while (strncmp(v23, v30, v24))
                      {
                        --v29;
                        ++v30;
                        if (v24 == v29)
                        {
                          v28 = 0;
                          v13 = v115;
                          goto LABEL_76;
                        }
                      }
                      mzi_cur_size = v22->mzi_cur_size;
                      v13 = v115;
                      if ((v102 & 1) != 0
                        && mzi_cur_size <= v25[1]
                        && (byte_10000C204 != 1 || v25[5] >= v22->mzi_sum_size >> 1))
                      {
LABEL_66:
                        v28 = 0;
                        goto LABEL_76;
                      }
                      v25[1] = mzi_cur_size;
                      v25[5] = v22->mzi_sum_size;
                      v28 = 1;
                      v115[v20] = 1;
                      v103 = 1;
LABEL_76:
                      v32 = dword_10000C030;
                      if (dword_10000C030 != 1)
                      {
                        v104 = v28;
                        v33 = 0;
                        *(_OWORD *)__s = *(_OWORD *)v26->mzn_name;
                        v34 = *(_OWORD *)&v26->mzn_name[16];
                        v35 = *(_OWORD *)&v26->mzn_name[32];
                        v36 = *(_OWORD *)&v26->mzn_name[64];
                        v126 = *(_OWORD *)&v26->mzn_name[48];
                        v127 = v36;
                        v124 = v34;
                        v125 = v35;
                        v106 = *(int64x2_t *)&v22->mzi_count;
                        v110 = *(_OWORD *)&v22->mzi_elem_size;
                        mzi_sum_size = v22->mzi_sum_size;
                        mzi_max_size = v22->mzi_max_size;
                        mzi_exhaustible = v22->mzi_exhaustible;
                        v37 = *(_OWORD *)&v26->mzn_name[48];
                        v130 = *(_OWORD *)&v26->mzn_name[32];
                        v131 = v37;
                        v132 = *(_OWORD *)&v26->mzn_name[64];
                        v38 = *(_OWORD *)&v26->mzn_name[16];
                        mzi_collectable = v22->mzi_collectable;
                        __s1 = *(_OWORD *)v26->mzn_name;
                        v129 = v38;
                        while (1)
                        {
                          v39 = strlen(*((const char **)&off_10000C000 + v33 + 1));
                          if (!strncmp((const char *)&__s1, *((const char **)&off_10000C000 + v33 + 1), v39))
                            break;
                          if (++v33 == 5)
                            goto LABEL_88;
                        }
                        if (((v32 >> v33) & 1) != 0)
                        {
                          v40 = qword_10000C1F0;
                          v41 = qword_10000C1E0;
                          v13 = v115;
                          if (!qword_10000C1F0)
                            goto LABEL_87;
                          v42 = 0;
                          v43 = (uint64_t *)(qword_10000C1E0 + 24);
                          do
                          {
                            v44 = *v43;
                            v43 += 8;
                            if (v44 == (_QWORD)v110)
                            {
                              v45 = v104;
                              goto LABEL_90;
                            }
                            ++v42;
                          }
                          while (qword_10000C1F0 != v42);
                          if ((unint64_t)qword_10000C1F0 >= 0x23)
                            __assert_rtn("get_kalloc_info_idx", "zprint.c", 809, "kalloc_info_idx < KALLOC_SIZECLASSES - 1");
LABEL_87:
                          ++qword_10000C1F0;
                          v45 = v115[v20];
                          v42 = v40;
LABEL_90:
                          v46 = qword_10000C1D8;
                          if (v45)
                          {
                            *(_BYTE *)(qword_10000C1E8 + v42) = 1;
                            v115[v20] = 0;
                          }
                          *(int64x2_t *)(v41 + (v42 << 6)) = vaddq_s64(*(int64x2_t *)(v41 + (v42 << 6)), v106);
                          if (v42 == qword_10000C1F0 - 1)
                          {
                            v47 = v41;
                            v48 = strlen(__s);
                            if (v48)
                            {
                              v49 = mzi_exhaustible;
                              while (__s[v48] != 46)
                              {
                                if (!--v48)
                                {
                                  v50 = 0;
                                  goto LABEL_100;
                                }
                              }
                              v50 = &__s[v48 + 1];
                            }
                            else
                            {
                              v50 = 0;
                              v49 = mzi_exhaustible;
                            }
LABEL_100:
                            snprintf((char *)(v46 + 80 * v42), 0x50uLL, "kalloc.%s", v50);
                            v41 = v47;
                            v51 = v47 + (v42 << 6);
                            *(_OWORD *)(v51 + 24) = v110;
                            *(_QWORD *)(v51 + 48) = v49;
                            v23 = (const char *)qword_10000C220;
                            v24 = qword_10000C228;
                          }
                          if ((mzi_collectable & 1) != 0)
                            *(_QWORD *)(v41 + (v42 << 6) + 56) = ((*(_QWORD *)(v41 + (v42 << 6) + 56) & 0xFFFFFFFFFFFFFFFELL)
                                                                + mzi_collectable) & 0xFFFFFFFFFFFFFFFELL | *(_QWORD *)(v41 + (v42 << 6) + 56) & 1;
                          v52 = v41 + (v42 << 6);
                          *(_QWORD *)(v52 + 40) += mzi_sum_size;
                          *(_QWORD *)(v52 + 16) += mzi_max_size;
                        }
                        else
                        {
LABEL_88:
                          v13 = v115;
                        }
                      }
                      ++v22;
                      v25 += 8;
                      ++v20;
                      ++v21;
                    }
                    while (v20 != v112);
                  }
                  if (byte_10000C210 == 1)
                  {
                    v53 = infoCnt;
                    v99 = dword_10000C030 != 1;
                    if (dword_10000C030 == 1)
                    {
                      v54 = names;
                      v57 = info;
                    }
                    else
                    {
                      v54 = (mach_zone_name_t *)malloc_type_malloc(80 * (infoCnt + 36), 0x10000404247E4FDuLL);
                      v55 = (mach_zone_info_t *)malloc_type_malloc((unint64_t)(v53 + 36) << 6, 0x1000040FA0F61DDuLL);
                      if (v54)
                        v56 = v55 == 0;
                      else
                        v56 = 1;
                      if (v56)
                      {
LABEL_174:
                        fprintf(__stderrp, "%s: malloc failed to allocate memory\n");
                        goto LABEL_180;
                      }
                      v57 = v55;
                      memcpy(v54, names, 80 * v53);
                      memcpy(&v54[v53], (const void *)qword_10000C1D8, 0xB40uLL);
                      memcpy(v57, info, v53 << 6);
                      memcpy(&v57[v53], (const void *)qword_10000C1E0, 0x900uLL);
                      sub_100006734((vm_address_t)names, info, v53, 1);
                      LODWORD(v53) = v53 + 36;
                    }
                    if ((_DWORD)v53 != 1)
                    {
                      v58 = 0;
                      v59 = v13 + 1;
                      v60 = v54 + 1;
                      v61 = v57 + 1;
                      v62 = v53 - 1;
                      do
                      {
                        v63 = v58 + 1;
                        if (v58 + 1 < (unint64_t)v53)
                        {
                          v64 = &v57[v58];
                          v65 = &v54[v58];
                          v66 = v61;
                          v67 = v62;
                          v68 = v60;
                          v69 = v59;
                          do
                          {
                            if (v66->mzi_cur_size - v66->mzi_count * v66->mzi_elem_size > v64->mzi_cur_size
                                                                                         - v64->mzi_count
                                                                                         * v64->mzi_elem_size)
                            {
                              *(_OWORD *)__s = *(_OWORD *)&v64->mzi_count;
                              v124 = *(_OWORD *)&v64->mzi_max_size;
                              v125 = *(_OWORD *)&v64->mzi_alloc_size;
                              v126 = *(_OWORD *)&v64->mzi_exhaustible;
                              v71 = *(_OWORD *)&v66->mzi_alloc_size;
                              v70 = *(_OWORD *)&v66->mzi_exhaustible;
                              v72 = *(_OWORD *)&v66->mzi_max_size;
                              *(_OWORD *)&v64->mzi_count = *(_OWORD *)&v66->mzi_count;
                              *(_OWORD *)&v64->mzi_max_size = v72;
                              *(_OWORD *)&v64->mzi_alloc_size = v71;
                              *(_OWORD *)&v64->mzi_exhaustible = v70;
                              v73 = *(_OWORD *)__s;
                              v74 = v124;
                              v75 = v126;
                              *(_OWORD *)&v66->mzi_alloc_size = v125;
                              *(_OWORD *)&v66->mzi_exhaustible = v75;
                              *(_OWORD *)&v66->mzi_count = v73;
                              *(_OWORD *)&v66->mzi_max_size = v74;
                              v76 = *(_OWORD *)&v65->mzn_name[64];
                              v77 = *(_OWORD *)&v65->mzn_name[32];
                              v131 = *(_OWORD *)&v65->mzn_name[48];
                              v132 = v76;
                              v78 = *(_OWORD *)&v65->mzn_name[16];
                              __s1 = *(_OWORD *)v65->mzn_name;
                              v129 = v78;
                              v130 = v77;
                              v79 = *(_OWORD *)&v68->mzn_name[16];
                              v80 = *(_OWORD *)&v68->mzn_name[32];
                              v81 = *(_OWORD *)&v68->mzn_name[64];
                              *(_OWORD *)&v65->mzn_name[48] = *(_OWORD *)&v68->mzn_name[48];
                              *(_OWORD *)&v65->mzn_name[64] = v81;
                              *(_OWORD *)&v65->mzn_name[16] = v79;
                              *(_OWORD *)&v65->mzn_name[32] = v80;
                              *(_OWORD *)v65->mzn_name = *(_OWORD *)v68->mzn_name;
                              *(_OWORD *)v68->mzn_name = __s1;
                              v82 = v129;
                              v83 = v130;
                              v84 = v132;
                              *(_OWORD *)&v68->mzn_name[48] = v131;
                              *(_OWORD *)&v68->mzn_name[64] = v84;
                              *(_OWORD *)&v68->mzn_name[16] = v82;
                              *(_OWORD *)&v68->mzn_name[32] = v83;
                              v85 = v13[v58];
                              v13[v58] = *v69;
                              *v69 = v85;
                            }
                            ++v66;
                            ++v69;
                            ++v68;
                            --v67;
                          }
                          while (v67);
                        }
                        ++v59;
                        ++v60;
                        --v62;
                        ++v61;
                        ++v58;
                      }
                      while (v63 != (_DWORD)v53 - 1);
                    }
                    names = v54;
                    info = v57;
                    infoCnt = v53;
                  }
                  v116 = 0;
                  if (v103)
                  {
                    if ((byte_10000C214 & 1) == 0)
                    {
                      if ((v101 & 1) == 0)
                        putchar(10);
                      if ((byte_10000C218 & 1) == 0)
                      {
                        for (j = 0; j != 416; j += 32)
                        {
                          if (*((_BYTE *)&off_10000C038 + j + 24))
                            printf("%*s ", *(_DWORD *)((char *)&off_10000C038 + j + 20)* *(_DWORD *)((char *)&off_10000C038 + j + 16), *(const char **)((char *)&off_10000C038 + j));
                        }
                        putchar(10);
                        v87 = 0;
                        v88 = 0;
                        do
                        {
                          v89 = (char *)&off_10000C038 + v87;
                          if (*((_BYTE *)&off_10000C038 + v87 + 24))
                          {
                            printf("%*s ", *((_DWORD *)v89 + 5) * *((_DWORD *)v89 + 4), *((const char **)v89 + 1));
                            v88 += *((_DWORD *)v89 + 4) + 1;
                          }
                          v87 += 32;
                        }
                        while (v87 != 416);
                        putchar(10);
                        if (v88 >= 1)
                        {
                          do
                          {
                            putchar(45);
                            --v88;
                          }
                          while (v88);
                        }
                        putchar(10);
                      }
                    }
                    sub_10000564C((uint64_t)names, (uint64_t)info, infoCnt, (uint64_t)v13, &v116);
                    if ((byte_10000C210 & 1) == 0 && dword_10000C030 != 1)
                      sub_10000564C(qword_10000C1D8, qword_10000C1E0, 0x24u, qword_10000C1E8, &v116);
                  }
                  v90 = names;
                  v91 = info;
                  if ((v101 & ~byte_10000C20C & 1) != 0)
                  {
                    if (byte_10000C210)
                      v92 = (int (__cdecl *)(void *, const void *, const void *))sub_100006620;
                    else
                      v92 = (int (__cdecl *)(void *, const void *, const void *))sub_100006654;
                    sub_100005D24((uint64_t)memory_info, memory_infoCnt, (uint64_t)info, (uint64_t)names, namesCnt, v116, v92);
                    v90 = names;
                    v91 = info;
                  }
                  sub_100006734((vm_address_t)v90, v91, infoCnt, !v99);
                  if (dword_10000C030 != 1)
                  {
                    v93 = qword_10000C1E8;
                    *(_OWORD *)qword_10000C1E8 = 0u;
                    *(_OWORD *)(v93 + 16) = 0u;
                    *(_DWORD *)(v93 + 32) = 0;
                    qword_10000C1F0 = 0;
                  }
                  if (memory_info)
                  {
                    if (memory_infoCnt)
                    {
                      v94 = vm_deallocate(mach_task_self_, (vm_address_t)memory_info, 176 * memory_infoCnt);
                      if (v94)
                      {
                        v98 = __stderrp;
                        mach_error_string(v94);
                        fprintf(v98, "%s: vm_deallocate: %s\n");
                        goto LABEL_180;
                      }
                    }
                  }
                  if (((byte_10000C208 | byte_10000C204) & 1) != 0
                    && (byte_10000C218 & 1) == 0
                    && (byte_10000C200 & 1) == 0)
                  {
                    puts("\nZONE TOTALS");
                    puts("---------------------------------------------");
                    printf("TOTAL SIZE        = %llu\n", qword_10000C230);
                    printf("TOTAL USED        = %llu\n", qword_10000C238);
                    if (byte_10000C208 == 1)
                    {
                      printf("TOTAL WASTED      = %llu\n", qword_10000C230 - qword_10000C238);
                      printf("TOTAL FRAGMENTED  = %llu\n", qword_10000C240);
                      printf("TOTAL COLLECTABLE = %llu\n", qword_10000C248);
                    }
                    if (byte_10000C204 == 1)
                      printf("TOTAL ALLOCS      = %llu\n", qword_10000C250);
                  }
                  if (byte_10000C200 != 1 || (byte_10000C258 & 1) != 0)
                    exit(0);
                  v102 = 1;
                  sleep(1u);
                }
                if (v16 == 53)
                {
                  v97 = __stderrp;
                  mach_error_string(53);
                  fprintf(v97, "%s: mach_memory_info: %s (entitlement required or rate-limit exceeded)\n");
                }
                else
                {
                  v96 = __stderrp;
                  if (v16 == 8)
                  {
                    mach_error_string(8);
                    fprintf(v96, "%s: mach_memory_info: %s (try running as root)\n");
                  }
                  else
                  {
                    mach_error_string(v16);
                    fprintf(v96, "%s: mach_memory_info: %s\n");
                  }
                }
LABEL_180:
                exit(1);
              }
            }
            else if (*v10 != 45)
            {
              v7 = v8 + 1;
              a2 = v111;
              goto LABEL_41;
            }
            v95 = &__stderrp;
LABEL_177:
            sub_1000054D0(*v95);
          }
          v11 = v114 | 2;
        }
        v114 = v11;
        dword_10000C030 = v11;
      }
    }
    if (a1 - 1 == ++v8)
    {
      v7 = a1;
      goto LABEL_40;
    }
  }
}

void sub_1000054C0()
{
  byte_10000C258 = 1;
}

void sub_1000054D0(FILE *a1)
{
  fprintf(a1, "usage: %s [-w] [-s] [-c] [-h] [-H] [-t] [-d] [-l] [-L] [-k] [-kt] [-kd] [name]\n\n", (const char *)qword_10000C1F8);
  fwrite("\t-w\tshow wasted memory for each zone\n", 0x25uLL, 1uLL, a1);
  fwrite("\t-s\tsort zones by wasted memory\n", 0x20uLL, 1uLL, a1);
  fwrite("\t-c\t(default) display output formatted in columns\n", 0x32uLL, 1uLL, a1);
  fwrite("\t-h\tdisplay this help message\n", 0x1EuLL, 1uLL, a1);
  fwrite("\t-H\thide column names\n", 0x16uLL, 1uLL, a1);
  fwrite("\t-t\tdisplay the total size of allocations over the life of the zone\n", 0x44uLL, 1uLL, a1);
  fwrite("\t-d\tdisplay deltas over time\n", 0x1DuLL, 1uLL, a1);
  fwrite("\t-l\t(default) display wired memory info after zone info\n", 0x38uLL, 1uLL, a1);
  fwrite("\t-L\tdo not show wired memory info, only show zone info\n", 0x37uLL, 1uLL, a1);
  fwrite("\t-k\tcoalesce all kalloc zones for specific size\n", 0x30uLL, 1uLL, a1);
  fwrite("\t-kt\tcoalesce kalloc type/kext zones with default\n", 0x32uLL, 1uLL, a1);
  fwrite("\t-kd\tcoalesce kalloc data zones with default\n", 0x2DuLL, 1uLL, a1);
  fwrite("\nAny option (including default options) can be overridden by specifying the option in upper-case.\n\n", 0x63uLL, 1uLL, a1);
  exit(__stdoutp != a1);
}

uint64_t sub_10000564C(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  BOOL v35;
  int v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if (a3)
  {
    v8 = result;
    v9 = 0;
    v49 = result;
    v50 = a3;
    v10 = result;
    while (!*(_BYTE *)(a4 + v9))
    {
LABEL_73:
      ++v9;
      v10 += 80;
      if (v9 == v50)
        return result;
    }
    v11 = v8 + 80 * v9;
    v12 = (_QWORD *)(a2 + (v9 << 6));
    if ((byte_10000C214 & 1) != 0)
    {
      printf("%.*s zone:\n", 80, (const char *)(v8 + 80 * v9));
      v13 = v12 + 3;
      v14 = v12 + 1;
      printf("\tcur_size:    %lluK bytes (%llu elements)\n", v12[1] >> 10, v12[1] / v12[3]);
      v15 = v12[2];
      v16 = v12[3];
      if (v16)
        v16 = v15 / v16;
      printf("\tmax_size:    %lluK bytes (%llu elements)\n", v15 >> 10, v16);
      printf("\telem_size:   %llu bytes\n", *v13);
      printf("\t# of elems:  %llu\n", *v12);
      v17 = a2 + (v9 << 6);
      v18 = *(_QWORD *)(v17 + 32);
      v19 = *v13;
      if (*v13)
        v19 = v18 / v19;
      result = printf("\talloc_size:  %lluK bytes (%llu elements)\n", v18 >> 10, v19);
      if (*(_QWORD *)(v17 + 48))
        result = puts("\tEXHAUSTIBLE");
      v20 = a2 + (v9 << 6);
      v22 = *(_BYTE *)(v20 + 56);
      v21 = (unint64_t *)(v20 + 56);
      if ((v22 & 1) != 0)
        result = puts("\tCOLLECTABLE");
      if (byte_10000C208 == 1)
      {
        v23 = *v12 * *v13;
        qword_10000C238 += v23;
        v24 = *v14;
        qword_10000C230 += *v14;
        v25 = *v21;
        v26 = *v21 >> 1;
        qword_10000C248 += v26;
        v27 = v24 - v23;
        v28 = v27 - (v25 >> 1);
        qword_10000C240 += v28;
        printf("\t\t\t\t\tWASTED: %llu\n", v27);
        printf("\t\t\t\t\tFRAGMENTED: %llu\n", v28);
        result = printf("\t\t\t\t\tCOLLECTABLE: %llu\n", v26);
      }
      if (byte_10000C204 == 1)
      {
        qword_10000C250 += *(_QWORD *)(a2 + (v9 << 6) + 40);
        result = printf("\t\t\t\t\tTOTAL: %llu\n", qword_10000C250);
      }
LABEL_72:
      *a5 += *v12;
      goto LABEL_73;
    }
    v29 = dword_10000C048;
    v30 = (dword_10000C048 - 1);
    if (dword_10000C048 < 2)
    {
      LODWORD(v31) = 0;
LABEL_26:
      if ((_DWORD)v31 != (_DWORD)v30)
      {
        v36 = v29 - v31;
        v35 = v29 <= (int)v31;
        v8 = v49;
        if (!v35)
        {
          do
          {
            putchar(32);
            --v36;
          }
          while (v36);
        }
        goto LABEL_33;
      }
    }
    else
    {
      v31 = 0;
      do
      {
        v32 = *(unsigned __int8 *)(v10 + v31);
        if (v32 == 32)
        {
          v33 = 46;
        }
        else
        {
          if (!*(_BYTE *)(v10 + v31))
            goto LABEL_26;
          v33 = (char)v32;
        }
        putchar(v33);
        ++v31;
      }
      while (v30 != v31);
    }
    v8 = v49;
    if (*(_BYTE *)(v11 + v30))
      v34 = 36;
    else
      v34 = 32;
    putchar(v34);
LABEL_33:
    if (byte_10000C070)
      printf(" %*llu", unk_10000C06C * dword_10000C068, *(_QWORD *)(a2 + (v9 << 6) + 24));
    if (byte_10000C090)
      printf(" %*lluK", (dword_10000C088 - 1) * unk_10000C08C, *(_QWORD *)(a2 + (v9 << 6) + 8) >> 10);
    v37 = a2 + (v9 << 6);
    v39 = *(_QWORD *)(v37 + 16);
    v38 = (_QWORD *)(v37 + 16);
    if (v39 <= 0x26259FFFFLL)
    {
      if (byte_10000C0B0)
        printf(" %*lluK");
    }
    else if (byte_10000C0B0)
    {
      printf(" %*s");
    }
    if (byte_10000C0D0)
      printf(" %*llu", unk_10000C0CC * dword_10000C0C8, *(_QWORD *)(a2 + (v9 << 6) + 8) / *(_QWORD *)(a2 + (v9 << 6) + 24));
    if (*v38 <= 0x26259FFFFuLL)
    {
      if (byte_10000C0F0)
        printf(" %*llu");
    }
    else if (byte_10000C0F0)
    {
      printf(" %*s");
    }
    if (byte_10000C110)
      printf(" %*llu", unk_10000C10C * dword_10000C108, *v12);
    if (byte_10000C130)
      printf(" %*lluK", (dword_10000C128 - 1) * unk_10000C12C, *(_QWORD *)(a2 + (v9 << 6) + 32) >> 10);
    if (byte_10000C150)
      printf(" %*llu", unk_10000C14C * dword_10000C148, *(_QWORD *)(a2 + (v9 << 6) + 32) / *(_QWORD *)(a2 + (v9 << 6) + 24));
    v40 = (_QWORD *)(a2 + (v9 << 6));
    v41 = *v12 * v40[3];
    qword_10000C238 += v41;
    v42 = v40[1];
    qword_10000C230 += v42;
    v44 = v40[5];
    v43 = v40 + 5;
    qword_10000C250 += v44;
    v45 = v43[2];
    qword_10000C248 += v45 >> 1;
    v46 = v42 - (v41 + (v45 >> 1));
    qword_10000C240 += v46;
    v47 = 67;
    if ((v45 & 1) == 0)
      v47 = 32;
    v48 = 88;
    if (!v43[1])
      v48 = 32;
    printf(" %c%c", v48, v47);
    if (byte_10000C190)
    {
      if (v46 > 0x3FF)
        printf(" %*lluK");
      else
        printf(" %*lluB");
    }
    if (byte_10000C1B0)
    {
      if (v45 > 0x7FF)
        printf(" %*lluK");
      else
        printf(" %*lluB");
    }
    if (byte_10000C1D0)
    {
      if (*v43 > 0x3FFuLL)
        printf(" %*lluK");
      else
        printf(" %*lluB");
    }
    result = putchar(10);
    goto LABEL_72;
  }
  return result;
}

void sub_100005D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, int (__cdecl *a7)(void *, const void *, const void *))
{
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  const __CFDictionary *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  const char *v30;
  size_t v31;
  size_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v42;
  const char *v43;
  size_t v44;
  size_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  const char *v54;
  size_t v55;
  size_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int v63;
  size_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char __str[40];

  v59 = a6;
  v60 = a3;
  v11 = a2;
  v12 = __chkstk_darwin();
  v14 = (char *)&v59 - v13;
  v61 = qword_10000C230;
  v15 = &off_10000C000;
  qword_10000C260 = v12;
  qword_10000C270 = CSSymbolicatorCreateWithMachKernel();
  qword_10000C278 = v16;
  v17 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0, 0);
  qword_10000C268 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryApplyFunction(v17, (CFDictionaryApplierFunction)sub_100006CD4, (void *)qword_10000C268);
  CFRelease(v17);
  v62 = a2;
  if ((_DWORD)a2)
  {
    LODWORD(v64) = a5;
    v18 = 0;
    do
    {
      *(_DWORD *)&v14[4 * v18] = v18;
      ++v18;
    }
    while (v11 != v18);
    v67 = a4;
    v19 = v64;
    v68 = v64;
    qsort_r(v14, v11, 4uLL, &v67, a7);
    if ((_DWORD)v62)
    {
      v20 = 0;
      v65 = 0;
      v66 = 0;
      v63 = 0;
      while (1)
      {
        v21 = *(_DWORD *)&v14[4 * v20];
        v22 = v15[76];
        v23 = *(_QWORD *)(v22 + 176 * v21);
        if ((v23 & 3) != 0 && *(_QWORD *)(v22 + 176 * v21 + 8) == 2)
          v65 = *(_QWORD *)(v22 + 176 * v21 + 16);
        if ((v23 & 0x200) == 0 && (v23 & 0x900) != 0)
          break;
LABEL_36:
        if (++v20 == v11)
          goto LABEL_40;
      }
      if ((v23 & 0x800) != 0)
      {
        if ((v23 & 0x2000) != 0)
        {
          v27 = v22 + 176 * v21;
          v25 = *(_QWORD *)(v27 + 16);
          v26 = *(unsigned __int16 *)(v27 + 66);
          goto LABEL_16;
        }
        v24 = *(unsigned __int16 *)(v22 + 176 * v21 + 66);
        if (v24 < v19)
        {
          v25 = *(_QWORD *)(v22 + 176 * v21 + 16);
          v26 = *(_QWORD *)(v60 + (v24 << 6) + 24);
LABEL_16:
          v66 += v25 / v26;
        }
      }
      if (*(_QWORD *)(v22 + 176 * v21 + 16) > 0x3FFuLL || *(_QWORD *)(v22 + 176 * v21 + 56) >= 0x400uLL)
      {
        v28 = a4;
        v29 = sub_100006824(v21, a4);
        v30 = (const char *)qword_10000C220;
        v31 = qword_10000C228;
        v32 = strlen(v29);
        if (qword_10000C228 > v32)
        {
LABEL_24:
          a4 = v28;
        }
        else
        {
          v33 = 0;
          v34 = v32 - qword_10000C228 + 1;
          while (strncmp(v30, &v29[v33], v31))
          {
            if (v34 == ++v33)
            {
              v15 = (_QWORD *)&off_10000C000;
              v19 = v64;
              goto LABEL_24;
            }
          }
          if ((v63 & 1) == 0)
          {
            puts("-------------------------------------------------------------------------------------------------------------");
            puts("                                                               kmod          vm        peak               cur");
            puts("wired memory                                                     id         tag        size  waste       size");
            puts("-------------------------------------------------------------------------------------------------------------");
          }
          printf("%-67s", v29);
          free(v29);
          v15 = &off_10000C000;
          printf("%12d", *(unsigned __int16 *)(qword_10000C260 + 176 * v21 + 64));
          v19 = v64;
          if (*(_QWORD *)(qword_10000C260 + 176 * v21 + 56))
            printf(" %10lluK");
          else
            printf(" %11s");
          a4 = v28;
          if (*(_QWORD *)(qword_10000C260 + 176 * v21 + 40))
            printf(" %5lluK");
          else
            printf(" %6s");
          printf(" %9lluK", *(_QWORD *)(qword_10000C260 + 176 * v21 + 16) >> 10);
          if ((*(_BYTE *)(qword_10000C260 + 176 * v21 + 1) & 8) == 0)
            qword_10000C230 += *(_QWORD *)(qword_10000C260 + 176 * v21 + 16);
          putchar(10);
          v63 = 1;
        }
      }
      goto LABEL_36;
    }
  }
  else
  {
    v67 = a4;
    v68 = a5;
    qsort_r(v14, v11, 4uLL, &v67, a7);
  }
  v65 = 0;
  v66 = 0;
  v63 = 0;
LABEL_40:
  if (!qword_10000C228)
  {
    printf("%-67s", "zones");
    printf("%12s", "");
    printf(" %11s", "");
    printf(" %6s", "");
    printf(" %9lluK", v61 >> 10);
    putchar(10);
  }
  v64 = v11;
  if ((v63 & 1) != 0)
  {
    if (v66)
    {
      snprintf(__str, 0x28uLL, "%lld of %lld", v66, v59);
      printf("zone tags%100s\n", __str);
    }
    snprintf(__str, 0x28uLL, "%6.2fM of %6.2fM", (double)(unint64_t)qword_10000C230 * 0.0009765625 * 0.0009765625, (double)v65 * 0.0009765625 * 0.0009765625);
    printf("total%104s\n", __str);
    v11 = v64;
  }
  if ((_DWORD)v62)
  {
    v35 = 0;
    LODWORD(v66) = 0;
    do
    {
      v36 = *(_DWORD *)&v14[4 * v35];
      v37 = v15[76];
      v38 = *(_QWORD *)(v37 + 176 * v36 + 48);
      if (v38)
      {
        v39 = *(_QWORD *)(v37 + 176 * v36);
        if ((v39 & 0x200) == 0)
        {
          v40 = *(_QWORD *)(v37 + 176 * v36 + 16);
          if ((v39 & 0x900) == 0 || v38 != v40)
          {
            v42 = sub_100006824(*(_DWORD *)&v14[4 * v35], 0);
            v43 = (const char *)qword_10000C220;
            v44 = qword_10000C228;
            v45 = strlen(v42);
            if (qword_10000C228 <= v45)
            {
              v46 = 0;
              v47 = v45 - qword_10000C228 + 1;
              while (strncmp(v43, &v42[v46], v44))
              {
                if (v47 == ++v46)
                {
                  v11 = v64;
                  v15 = (_QWORD *)&off_10000C000;
                  goto LABEL_72;
                }
              }
              if ((v66 & 1) == 0)
              {
                puts("-------------------------------------------------------------------------------------------------------------");
                puts("                                                                        largest        peak               cur");
                puts("maps                                                           free        free        size              size");
                puts("-------------------------------------------------------------------------------------------------------------");
              }
              printf("%-55s", v42);
              free(v42);
              v15 = &off_10000C000;
              v11 = v64;
              if (*(_QWORD *)(qword_10000C260 + 176 * v36 + 24))
                printf(" %10lluK");
              else
                printf(" %11s");
              if (*(_QWORD *)(qword_10000C260 + 176 * v36 + 32))
                printf(" %10lluK");
              else
                printf(" %11s");
              if (*(_QWORD *)(qword_10000C260 + 176 * v36 + 56))
                printf(" %10lluK");
              else
                printf(" %11s");
              printf(" %16lluK", v38 >> 10);
              putchar(10);
              LODWORD(v66) = 1;
            }
          }
        }
      }
LABEL_72:
      ++v35;
    }
    while (v35 != v11);
    if ((_DWORD)v62)
    {
      v48 = 0;
      v49 = 0;
      do
      {
        v50 = *(_DWORD *)&v14[4 * v48];
        v51 = v15[76];
        v52 = *(_QWORD *)(v51 + 176 * v50 + 16);
        if (v52)
        {
          if ((*(_BYTE *)(v51 + 176 * v50 + 1) & 0x10) != 0)
          {
            v53 = sub_100006824(v50, 0);
            v54 = (const char *)qword_10000C220;
            v55 = qword_10000C228;
            v56 = strlen(v53);
            if (qword_10000C228 <= v56)
            {
              v57 = 0;
              v58 = v56 - qword_10000C228 + 1;
              while (strncmp(v54, &v53[v57], v55))
              {
                if (v58 == ++v57)
                {
                  v11 = v64;
                  v15 = (_QWORD *)&off_10000C000;
                  goto LABEL_85;
                }
              }
              v11 = v64;
              v15 = (_QWORD *)&off_10000C000;
              if ((v49 & 1) == 0)
              {
                puts("-------------------------------------------------------------------------------------------------------------");
                puts("                                                                                                          cur");
                puts("zone views                                                                                              inuse");
                puts("-------------------------------------------------------------------------------------------------------------");
              }
              printf("%-55s", v53);
              free(v53);
              printf(" %11s", "");
              printf(" %11s", "");
              printf(" %11s", "");
              printf(" %16lluK", v52 >> 10);
              putchar(10);
              v49 = 1;
            }
          }
        }
LABEL_85:
        ++v48;
      }
      while (v48 != v11);
    }
  }
  qword_10000C230 = v61;
}

uint64_t sub_100006620(uint64_t a1, int *a2, int *a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  _BOOL4 v6;

  v3 = *(_QWORD *)(qword_10000C260 + 176 * *a2 + 16);
  v4 = *(_QWORD *)(qword_10000C260 + 176 * *a3 + 16);
  v5 = v3 > v4;
  v6 = v3 < v4;
  if (v5)
    return 0xFFFFFFFFLL;
  else
    return v6;
}

CFComparisonResult sub_100006654(uint64_t *a1, int *a2, int *a3)
{
  char *v5;
  char *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFComparisonResult v9;
  CFRange v11;

  v5 = sub_100006824(*a2, *a1);
  v6 = sub_100006824(*a3, *a1);
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
  v8 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0x8000100u);
  v11.length = CFStringGetLength(v7);
  v11.location = 0;
  v9 = CFStringCompareWithOptionsAndLocale(v7, v8, v11, 0x40uLL, 0);
  CFRelease(v7);
  CFRelease(v8);
  free(v5);
  free(v6);
  return v9;
}

void sub_100006734(vm_address_t address, void *a2, unsigned int a3, char a4)
{
  mach_error_t v6;
  FILE *v7;
  const char *v8;
  char *v9;

  if ((a4 & 1) == 0)
  {
    free((void *)address);
LABEL_12:
    free(a2);
    return;
  }
  if (address && a3 && (v6 = vm_deallocate(mach_task_self_, address, 80 * a3)) != 0
    || a2 && a3 && (v6 = vm_deallocate(mach_task_self_, (vm_address_t)a2, (unint64_t)a3 << 6)) != 0)
  {
    v7 = __stderrp;
    v8 = (const char *)qword_10000C1F8;
    v9 = mach_error_string(v6);
    fprintf(v7, "%s: vm_deallocate: %s\n", v8, v9);
    exit(1);
  }
  if (dword_10000C030 != 1)
  {
    free((void *)qword_10000C1D8);
    a2 = (void *)qword_10000C1E0;
    goto LABEL_12;
  }
}

char *sub_100006824(int a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  const char *Path;
  char *v7;
  const __CFDictionary *Value;
  const __CFString *v9;
  uint64_t SymbolWithAddressAtTime;
  const char *Name;
  uint64_t SourceInfoWithAddressAtTime;
  uint64_t v13;
  uint64_t v14;
  int LineNumber;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  size_t v20;
  int v22;
  char *v24;
  char *__s;
  char *v26;

  v24 = 0;
  __s = 0;
  v3 = qword_10000C260;
  v5 = qword_10000C260 + 176 * a1;
  if ((*(_QWORD *)v5 & 0x400) != 0)
  {
    asprintf(&__s, "%s");
  }
  else
  {
    Path = *(const char **)(v5 + 8);
    switch(*(_QWORD *)v5)
    {
      case 0u:
        v26 = 0;
        switch((unint64_t)Path)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
          case 0xCuLL:
          case 0xDuLL:
          case 0xEuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x19uLL:
          case 0x1AuLL:
          case 0x1BuLL:
          case 0x1CuLL:
          case 0x1DuLL:
          case 0x1EuLL:
          case 0x1FuLL:
          case 0x20uLL:
          case 0x21uLL:
          case 0x23uLL:
            goto LABEL_17;
          case 0x22uLL:
            break;
          default:
            if (Path == (const char *)255)
              goto LABEL_17;
            break;
        }
        asprintf(&v26, "VM_KERN_MEMORY_%lld");
        goto LABEL_21;
      case 1u:
        Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)qword_10000C268, *(const void **)(v5 + 8));
        if (Value
          && (v9 = (const __CFString *)CFDictionaryGetValue(Value, kCFBundleIdentifierKey),
              CFStringGetCStringPtr(v9, 0x8000100u)))
        {
          asprintf(&__s, "%s");
        }
        else
        {
          asprintf(&__s, "(unloaded kmod)");
        }
        goto LABEL_6;
      case 2u:
        if (Path
          && (SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime(qword_10000C270, qword_10000C278, *(_QWORD *)(v5 + 8), 0x8000000000000000), (Name = (const char *)CSSymbolGetName(SymbolWithAddressAtTime)) != 0))
        {
          asprintf(&__s, "%s", Name);
          SourceInfoWithAddressAtTime = CSSymbolicatorGetSourceInfoWithAddressAtTime(qword_10000C270, qword_10000C278, Path, 0x8000000000000000);
          v14 = v13;
          Path = (const char *)CSSourceInfoGetPath();
          if (!Path)
            goto LABEL_6;
          LineNumber = CSSourceInfoGetLineNumber(SourceInfoWithAddressAtTime, v14);
          printf(" (%s:%d)", Path, LineNumber);
        }
        else
        {
          asprintf(&__s, "site 0x%qx");
        }
        break;
      case 3u:
        v26 = 0;
        if ((unint64_t)Path > 0xD)
          asprintf(&v26, "VM_KERN_COUNT_%lld");
        else
LABEL_17:
          asprintf(&v26, "%s");
LABEL_21:
        Path = 0;
        v7 = v26;
        __s = v26;
        if (v26)
          goto LABEL_22;
        return v7;
      default:
        asprintf(&__s, "");
        break;
    }
  }
  Path = 0;
LABEL_6:
  v7 = __s;
  if (__s)
  {
LABEL_22:
    v16 = *(_QWORD *)v5;
    if ((v16 & 0x800) != 0)
    {
      v17 = strlen(v7);
      v26 = 0;
      v18 = v3 + 176 * a1;
      if ((v16 & 0x2000) != 0)
      {
        asprintf(&v26, "size.%d", *(unsigned __int16 *)(v18 + 66));
        v7 = __s;
        v19 = v26;
      }
      else
      {
        v19 = (char *)(a2 + 80 * *(unsigned __int16 *)(v18 + 66));
        v26 = v19;
      }
      v20 = strnlen(v19, 0x50uLL);
      if (v20 + v17 <= 0x3D || v20 >= 0x3D)
        v22 = v17;
      else
        v22 = 61 - v20;
      asprintf(&v24, "%.*s[%.*s]", v22, v7, v20, v19);
      free(__s);
      v7 = v24;
      __s = v24;
    }
    if (v7 && Path)
    {
      asprintf(&v24, "%-64s%3ld", v7, Path);
      free(__s);
      return v24;
    }
  }
  return v7;
}

void sub_100006CD4(int a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const __CFNumber *Value;
  unsigned int valuePtr;

  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("OSBundleLoadTag"));
  CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a3, (const void *)valuePtr, theDict);
}
