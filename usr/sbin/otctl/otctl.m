double sub_1000042DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = sub_100004404(a2);
  v5 = malloc_type_malloc(104 * v4 + 208, 0x109004046C4FC64uLL);
  *(_QWORD *)(a1 + 16) = v5;
  *v5 = unk_100020448;
  v5[1] = unk_100020458;
  *((_QWORD *)v5 + 12) = 0;
  v5[4] = unk_100020488;
  v5[5] = unk_100020498;
  v5[2] = xmmword_100020468;
  v5[3] = unk_100020478;
  if (v4)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = *(_QWORD *)(a2 + 16);
      if (!*(_BYTE *)(v8 + v6 + 80))
        goto LABEL_6;
      if (SecIsInternalRelease())
        break;
LABEL_7:
      v6 += 104;
      if (!--v4)
        goto LABEL_10;
    }
    v8 = *(_QWORD *)(a2 + 16);
LABEL_6:
    v9 = *(_QWORD *)(a1 + 16) + 104 * v7++;
    v10 = (__int128 *)(v8 + v6);
    v11 = *v10;
    v12 = v10[2];
    *(_OWORD *)(v9 + 16) = v10[1];
    *(_OWORD *)(v9 + 32) = v12;
    *(_OWORD *)v9 = v11;
    v13 = v10[3];
    v14 = v10[4];
    v15 = v10[5];
    *(_QWORD *)(v9 + 96) = *((_QWORD *)v10 + 12);
    *(_OWORD *)(v9 + 64) = v14;
    *(_OWORD *)(v9 + 80) = v15;
    *(_OWORD *)(v9 + 48) = v13;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_10:
  v16 = *(_QWORD *)(a1 + 16) + 104 * v7;
  *(_QWORD *)(v16 + 96) = 0;
  result = 0.0;
  *(_OWORD *)(v16 + 64) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 32) = 0u;
  *(_OWORD *)(v16 + 48) = 0u;
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  return result;
}

uint64_t sub_100004404(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  _OWORD v4[6];
  uint64_t v5;

  if (!a1)
    return 0;
  v1 = *(char **)(a1 + 16);
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v2 = 0;
  if (v1)
  {
    do
    {
      if (!memcmp(v1, v4, 0x68uLL))
        break;
      ++v2;
      v1 += 104;
    }
    while (v2 != 1024);
  }
  return v2;
}

uint64_t sub_100004478(uint64_t result)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  _QWORD v36[3];
  char v37[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char __str[8];
  _QWORD v46[3];

  if (!result)
    return result;
  memset(v36, 170, sizeof(v36));
  sub_1000042DC((uint64_t)v36, result);
  v1 = sub_100004404((uint64_t)v36);
  v2 = (const char *)v36[0];
  if (!v36[0])
    v2 = "command";
  printf("usage: %s", v2);
  if (v1)
  {
    v3 = 0;
    v4 = v1;
    while (!*(_BYTE *)(v36[2] + v3))
    {
LABEL_17:
      v3 += 104;
      if (!--v4)
      {
        v7 = 0;
        v8 = v1;
        while (2)
        {
          if (!*(_QWORD *)(v36[2] + v7 + 8) || *(_BYTE *)(v36[2] + v7))
            goto LABEL_31;
          printf(" [--%s", *(const char **)(v36[2] + v7 + 8));
          if (v36[2])
          {
            v9 = *(_QWORD *)(v36[2] + v7 + 48);
            if (*(_QWORD *)(v36[2] + v7 + 56))
            {
              if (!v9)
                goto LABEL_30;
LABEL_27:
              v10 = *(const char **)(v36[2] + v7 + 40);
              if (!v10)
                v10 = "arg";
              printf(" %s", v10);
            }
            else if (v9 || *(_QWORD *)(v36[2] + v7 + 88))
            {
              goto LABEL_27;
            }
          }
LABEL_30:
          putchar(93);
LABEL_31:
          v7 += 104;
          if (!--v8)
          {
            v11 = 16;
            v12 = v1;
            do
            {
              if (*(_QWORD *)(v36[2] + v11))
                printf(" [%s]", *(const char **)(v36[2] + v11));
              v11 += 104;
              --v12;
            }
            while (v12);
            v13 = 0;
            v14 = v1;
            do
            {
              if (*(_QWORD *)(v36[2] + v13 + 24))
              {
                if (*(_BYTE *)(v36[2] + v13 + 32))
                  printf(" [<%s>]");
                else
                  printf(" <%s>");
              }
              v13 += 104;
              --v14;
            }
            while (v14);
            goto LABEL_42;
          }
          continue;
        }
      }
    }
    printf(" [-%c", *(char *)(v36[2] + v3));
    if (v36[2])
    {
      v5 = *(_QWORD *)(v36[2] + v3 + 48);
      if (*(_QWORD *)(v36[2] + v3 + 56))
      {
        if (!v5)
          goto LABEL_16;
      }
      else if (!v5 && !*(_QWORD *)(v36[2] + v3 + 88))
      {
        goto LABEL_16;
      }
      v6 = *(const char **)(v36[2] + v3 + 40);
      if (!v6)
        v6 = "arg";
      printf(" %s", v6);
    }
LABEL_16:
    putchar(93);
    goto LABEL_17;
  }
LABEL_42:
  putchar(10);
  if (v36[1])
    printf("\n%s\n", (const char *)v36[1]);
  puts("\npositional arguments:");
  if (!v1)
  {
    puts("\noptional arguments:");
    puts("\noptional commands:");
    return putchar(10);
  }
  v15 = 0;
  v16 = v1;
  do
  {
    if (*(_QWORD *)(v36[2] + v15 + 24))
      printf("  %-31s %s\n", *(const char **)(v36[2] + v15 + 24), *(const char **)(v36[2] + v15 + 72));
    v15 += 104;
    --v16;
  }
  while (v16);
  puts("\noptional arguments:");
  v17 = 88;
  v18 = v1;
  do
  {
    if (!*(_BYTE *)(v36[2] + v17 - 88))
      goto LABEL_80;
    if (*(_QWORD *)(v36[2] + v17 - 80))
    {
      printf("  -%c", *(char *)(v36[2] + v17 - 88));
      v19 = v36[2];
      v20 = *(_QWORD *)(v36[2] + v17 - 40);
      if (*(_QWORD *)(v36[2] + v17 - 32))
      {
        if (!v20)
          goto LABEL_63;
      }
      else if (!v20 && !*(_QWORD *)(v36[2] + v17))
      {
        goto LABEL_63;
      }
      v22 = *(const char **)(v36[2] + v17 - 48);
      if (!v22)
        v22 = "arg";
      printf(" %s", v22);
      v19 = v36[2];
LABEL_63:
      v23 = v19 + v17;
      if (*(_QWORD *)(v19 + v17 - 80))
      {
        v25 = v23 - 40;
        v24 = *(_QWORD *)(v23 - 40);
        if (*(_QWORD *)(v25 + 8))
        {
          if (v24)
            goto LABEL_72;
        }
        else if (v24 || *(_QWORD *)(v19 + v17))
        {
LABEL_72:
          strlen(*(const char **)(v19 + v17 - 80));
          if (*(_QWORD *)(v19 + v17 - 48))
            v27 = *(const char **)(v19 + v17 - 48);
          else
            v27 = "arg";
          strlen(v27);
          printf(", --%s %-*s");
          goto LABEL_79;
        }
        if (*(_QWORD *)(v19 + v17 - 48))
          v26 = *(const char **)(v19 + v17 - 48);
        else
          v26 = "arg";
        strlen(v26);
        printf(", --%-*s");
      }
      goto LABEL_79;
    }
    v21 = *(_QWORD *)(v36[2] + v17 - 40);
    if (*(_QWORD *)(v36[2] + v17 - 32))
    {
      if (v21)
        goto LABEL_78;
    }
    else if (v21 || *(_QWORD *)(v36[2] + v17))
    {
LABEL_78:
      printf("  -%c %-*s");
      goto LABEL_79;
    }
    printf("  -%-30c");
LABEL_79:
    puts(*(const char **)(v36[2] + v17 - 16));
LABEL_80:
    v17 += 104;
    --v18;
  }
  while (v18);
  v28 = v1;
  while (2)
  {
    if (*(_QWORD *)(v36[2] + v18 + 8) && !*(_BYTE *)(v36[2] + v18))
    {
      v29 = *(_QWORD *)(v36[2] + v18 + 48);
      if (*(_QWORD *)(v36[2] + v18 + 56))
      {
        if (!v29)
          goto LABEL_86;
LABEL_89:
        memset(v46, 170, 22);
        *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v44 = v30;
        v42 = v30;
        v43 = v30;
        v40 = v30;
        v41 = v30;
        v38 = v30;
        v39 = v30;
        *(_OWORD *)v37 = v30;
        v31 = *(_QWORD *)(v36[2] + v18 + 88);
        v32 = *(const char **)(v36[2] + v18 + 40);
        if (!v32)
          v32 = "arg";
        if (v31)
          v33 = "%s %s...";
        else
          v33 = "%s %s";
        if (v31)
          v34 = "%s [repeatable]";
        else
          v34 = "%s";
        snprintf(__str, 0x1EuLL, v33, *(_QWORD *)(v36[2] + v18 + 8), v32);
        snprintf(v37, 0x80uLL, v34, *(_QWORD *)(v36[2] + v18 + 72));
        printf("  --%-28s %s\n", __str, v37);
      }
      else
      {
        if (v29 || *(_QWORD *)(v36[2] + v18 + 88))
          goto LABEL_89;
LABEL_86:
        printf("  --%-28s %s\n", *(const char **)(v36[2] + v18 + 8), *(const char **)(v36[2] + v18 + 72));
      }
    }
    v18 += 104;
    if (--v28)
      continue;
    break;
  }
  puts("\noptional commands:");
  v35 = 0;
  do
  {
    if (*(_QWORD *)(v36[2] + v35 + 16))
      printf("  %-30s %s\n", *(const char **)(v36[2] + v35 + 16), *(const char **)(v36[2] + v35 + 72));
    v35 += 104;
    --v1;
  }
  while (v1);
  return putchar(10);
}

char **sub_100004A40(uint64_t a1, const char *a2)
{
  _DWORD *v4;
  char **result;
  void **v6;
  uint64_t v7;

  v4 = *(_DWORD **)(a1 + 56);
  if (v4)
    *v4 = *(_DWORD *)(a1 + 64);
  result = *(char ***)(a1 + 48);
  if (result)
    result = (char **)asprintf(result, "%.1048576s", a2);
  v6 = *(void ***)(a1 + 88);
  if (v6)
  {
    v7 = **(_QWORD **)(a1 + 96);
    **(_QWORD **)(a1 + 88) = malloc_type_realloc(*v6, 8 * (v7 + 1), 0x10040436913F5uLL);
    result = (char **)asprintf((char **)(**(_QWORD **)(a1 + 88) + 8 * v7), "%.1048576s", a2);
    **(_QWORD **)(a1 + 96) = v7 + 1;
  }
  return result;
}

uint64_t start(int a1, char *const *a2)
{
  unint64_t v2;
  option *v3;
  size_t v4;
  char *v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  const char *v11;
  int *v12;
  uint64_t v13;
  int v14;
  option *v15;
  option *v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  size_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  const char **p_name;
  unint64_t v25;
  char *v26;
  const char *v27;
  size_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  const char **v44;
  _QWORD *v45;
  _QWORD *v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  uint64_t v52;
  id v53;
  char **v54;
  __CFString *v55;
  void *v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  EscrowRequestCLI *v70;
  void *v71;
  id v72;
  EscrowRequestCLI *v73;
  void *v74;
  void *v75;
  void *v76;
  OTControlCLI *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  __CFString *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  _BOOL8 v100;
  _BOOL8 v101;
  OTControlCLI *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  void *v107;
  EscrowRequestCLI *v108;
  uint64_t v109;
  uint64_t v110;
  __CFString *v111;
  void *v112;
  __CFString *v113;
  __CFString *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *context;
  uint64_t v120;
  void *v121;
  OTControlCLI *v122;
  char v123;
  void *v124;
  __CFString *v126;
  char **v128;
  id v129;
  id v130;
  _QWORD v131[3];
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
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
  int v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  uint64_t v191;
  int v192;
  void *v193[3];
  _QWORD v194[2];
  __int128 v195;
  __int128 v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  __int128 v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208;
  const char *v209;
  __int128 v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  __int128 v214;
  __int128 v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  __int128 v220;
  uint64_t v221;
  _OWORD v222[527];

  v184 = 0;
  v183 = 0;
  v182 = 0;
  v181 = 0;
  v180 = 0;
  v179 = 0;
  v178 = 0;
  v177 = 0;
  v176 = 0;
  v175 = 0;
  v174 = 0;
  v173 = 0;
  v172 = 0;
  v170 = 0;
  v171 = 0;
  v168 = 0;
  v169 = 0;
  v166 = 0;
  v167 = 0;
  v164 = 0;
  v165 = 0;
  v162 = 0;
  v163 = 0;
  v160 = 0;
  v161 = 0;
  v159 = 0;
  v158 = 0;
  v156 = 0;
  v157 = 0;
  v154 = 0;
  v155 = 0;
  v152 = 0;
  v153 = 0;
  v150 = 0;
  v151 = 0;
  v148 = 0;
  v149 = 0;
  v147 = 0;
  v146 = 0;
  v144 = 0;
  v145 = 0;
  v142 = 0;
  v143 = 0;
  v140 = 0;
  v141 = 0;
  v138 = 0;
  v139 = 0;
  v136 = 0;
  v137 = 0;
  v134 = 0;
  v135 = 0;
  v132 = 0;
  v133 = 0;
  memset(v222, 170, 0x20E8uLL);
  v194[0] = 115;
  v195 = 0u;
  v196 = 0u;
  v198 = 0;
  v199 = 0;
  v201 = 0u;
  v194[1] = "secret";
  v197 = &v155;
  v200 = "escrow secret";
  v203 = 101;
  v207 = 0u;
  v208 = 0;
  v205 = 0u;
  v206 = 0u;
  v210 = 0u;
  v202 = 0;
  v211 = 0;
  v204 = "bottleID";
  *(_QWORD *)&v207 = &v157;
  v209 = "bottle record id";
  v221 = 0;
  v218 = 0;
  v220 = 0u;
  v215 = 0u;
  v217 = 0;
  v212 = 114;
  v214 = 0u;
  v213 = "skipRateLimiting";
  v216 = &v154;
  v219 = " enter values YES or NO, option defaults to NO, This gives you the opportunity to skip the rate limiting check "
         "when performing the cuttlefish health check";
  LOBYTE(v222[0]) = 106;
  *((_QWORD *)&v222[0] + 1) = "json";
  memset(&v222[1], 0, 17);
  *(_OWORD *)((char *)&v222[2] + 8) = 0u;
  *((_QWORD *)&v222[3] + 1) = (char *)&v148 + 4;
  LODWORD(v222[4]) = 1;
  *((_QWORD *)&v222[4] + 1) = "Output in JSON";
  LOBYTE(v222[5]) = 0;
  *(_OWORD *)((char *)&v222[5] + 8) = 0u;
  BYTE8(v222[6]) = 105;
  *(_QWORD *)&v222[7] = "recordID";
  BYTE8(v222[8]) = 0;
  *(_OWORD *)((char *)&v222[7] + 8) = 0u;
  *(_QWORD *)&v222[9] = 0;
  *((_QWORD *)&v222[9] + 1) = &v153;
  *(_QWORD *)&v222[10] = 0;
  DWORD2(v222[10]) = 1;
  *(_QWORD *)&v222[11] = "recordID";
  BYTE8(v222[11]) = 0;
  memset(&v222[18], 0, 24);
  memset(&v222[16], 0, 24);
  memset(&v222[14], 0, 32);
  *(_QWORD *)&v222[13] = 111;
  v222[12] = 0u;
  *((_QWORD *)&v222[13] + 1) = "overrideForAccountScript";
  *(_QWORD *)&v222[16] = &v152;
  *((_QWORD *)&v222[17] + 1) = " enter values YES or NO, option defaults to NO, This flag is only meant for the setup acc"
                               "ount for icloud cdp signin script";
  *((_QWORD *)&v222[25] + 1) = 0;
  *(_OWORD *)((char *)&v222[24] + 8) = 0u;
  v222[23] = 0uLL;
  *(_OWORD *)((char *)&v222[21] + 8) = 0u;
  *(_OWORD *)((char *)&v222[20] + 8) = 0u;
  *((_QWORD *)&v222[19] + 1) = 99;
  *(_QWORD *)&v222[20] = "overrideEscrowCache";
  *((_QWORD *)&v222[22] + 1) = &v151;
  *(_QWORD *)&v222[24] = " enter values YES or NO, option defaults to NO, include this if you want to force an escrow rec"
                         "ord fetch from cuttlefish for the freshest of escrow records";
  LOBYTE(v222[26]) = 69;
  *((_QWORD *)&v222[26] + 1) = "enable";
  memset(&v222[27], 0, 17);
  *(_OWORD *)((char *)&v222[28] + 8) = 0u;
  *((_QWORD *)&v222[29] + 1) = (char *)&v149 + 4;
  LODWORD(v222[30]) = 1;
  *((_QWORD *)&v222[30] + 1) = "Enable something (pair with a modification command)";
  LOBYTE(v222[31]) = 0;
  *(_OWORD *)((char *)&v222[31] + 8) = 0u;
  BYTE8(v222[32]) = 80;
  *(_QWORD *)&v222[33] = "pause";
  BYTE8(v222[34]) = 0;
  *(_OWORD *)((char *)&v222[33] + 8) = 0u;
  v222[35] = 0u;
  *(_QWORD *)&v222[36] = &v149;
  DWORD2(v222[36]) = 1;
  *(_QWORD *)&v222[37] = "Pause something (pair with a modification command)";
  BYTE8(v222[37]) = 0;
  memset(&v222[38], 0, 17);
  *((_QWORD *)&v222[39] + 1) = "notifyIdMS";
  memset(&v222[40], 0, 17);
  *(_OWORD *)((char *)&v222[41] + 8) = 0u;
  *((_QWORD *)&v222[42] + 1) = &v148;
  LODWORD(v222[43]) = 1;
  *((_QWORD *)&v222[43] + 1) = "Notify IdMS on reset";
  LOBYTE(v222[44]) = 1;
  BYTE8(v222[45]) = 0;
  *(_OWORD *)((char *)&v222[44] + 8) = 0u;
  *(_QWORD *)&v222[46] = "forceFetch";
  BYTE8(v222[47]) = 0;
  *(_OWORD *)((char *)&v222[46] + 8) = 0u;
  v222[48] = 0u;
  *(_QWORD *)&v222[49] = &v147;
  DWORD2(v222[49]) = 1;
  *(_QWORD *)&v222[50] = "Force fetch from cuttlefish";
  BYTE8(v222[50]) = 0;
  memset(&v222[51], 0, 17);
  *((_QWORD *)&v222[52] + 1) = "repair";
  memset(&v222[53], 0, 17);
  *(_OWORD *)((char *)&v222[54] + 8) = 0u;
  *((_QWORD *)&v222[55] + 1) = &v146;
  LODWORD(v222[56]) = 1;
  *((_QWORD *)&v222[56] + 1) = "Perform repair as part of health check";
  LOBYTE(v222[57]) = 0;
  *((_QWORD *)&v222[64] + 1) = 0;
  *(_OWORD *)((char *)&v222[63] + 8) = 0u;
  v222[62] = 0uLL;
  *(_OWORD *)((char *)&v222[60] + 8) = 0u;
  *(_OWORD *)((char *)&v222[59] + 8) = 0u;
  *((_QWORD *)&v222[58] + 1) = 97;
  *(_OWORD *)((char *)&v222[57] + 8) = 0u;
  *(_QWORD *)&v222[59] = "machineID";
  *((_QWORD *)&v222[61] + 1) = &v150;
  *(_QWORD *)&v222[63] = "machineID override";
  memset(&v222[70], 0, 32);
  *(_QWORD *)&v222[65] = 0;
  memset(&v222[66], 0, 56);
  *((_QWORD *)&v222[65] + 1) = "altDSID";
  *(_QWORD *)&v222[68] = &v145;
  *((_QWORD *)&v222[69] + 1) = "altDSID (for sign-in/out)";
  *((_QWORD *)&v222[77] + 1) = 0;
  *(_OWORD *)((char *)&v222[76] + 8) = 0u;
  v222[75] = 0uLL;
  *(_OWORD *)((char *)&v222[73] + 8) = 0u;
  *(_OWORD *)((char *)&v222[72] + 8) = 0u;
  *(_QWORD *)&v222[72] = "entropy";
  *((_QWORD *)&v222[74] + 1) = &v155;
  *(_QWORD *)&v222[76] = "escrowed entropy in JSON";
  memset(&v222[83], 0, 32);
  *(_QWORD *)&v222[78] = 0;
  memset(&v222[79], 0, 56);
  *((_QWORD *)&v222[78] + 1) = "appleID";
  *(_QWORD *)&v222[81] = &v142;
  *((_QWORD *)&v222[82] + 1) = "AppleID";
  *((_QWORD *)&v222[90] + 1) = 0;
  *(_OWORD *)((char *)&v222[89] + 8) = 0u;
  v222[88] = 0uLL;
  *(_OWORD *)((char *)&v222[86] + 8) = 0u;
  *(_OWORD *)((char *)&v222[85] + 8) = 0u;
  *(_QWORD *)&v222[85] = "dsid";
  *((_QWORD *)&v222[87] + 1) = &v141;
  *(_QWORD *)&v222[89] = "DSID";
  BYTE8(v222[89]) = 1;
  memset(&v222[96], 0, 32);
  *(_QWORD *)&v222[91] = 0;
  memset(&v222[92], 0, 56);
  *((_QWORD *)&v222[91] + 1) = "container";
  *(_QWORD *)&v222[94] = &v144;
  *((_QWORD *)&v222[95] + 1) = "CloudKit container name";
  *((_QWORD *)&v222[103] + 1) = 0;
  *(_OWORD *)((char *)&v222[102] + 8) = 0u;
  v222[101] = 0uLL;
  *(_OWORD *)((char *)&v222[99] + 8) = 0u;
  *(_OWORD *)((char *)&v222[98] + 8) = 0u;
  *(_QWORD *)&v222[98] = "context";
  *((_QWORD *)&v222[100] + 1) = &v156;
  *(_QWORD *)&v222[102] = "Context name";
  memset(&v222[109], 0, 32);
  *(_QWORD *)&v222[104] = 0;
  memset(&v222[105], 0, 56);
  *((_QWORD *)&v222[104] + 1) = "radar";
  *(_QWORD *)&v222[107] = &v143;
  *((_QWORD *)&v222[108] + 1) = "Radar number";
  *((_QWORD *)&v222[116] + 1) = 0;
  *(_OWORD *)((char *)&v222[115] + 8) = 0u;
  v222[114] = 0uLL;
  *(_OWORD *)((char *)&v222[112] + 8) = 0u;
  *(_OWORD *)((char *)&v222[111] + 8) = 0u;
  *(_QWORD *)&v222[111] = "wrapping-key";
  *((_QWORD *)&v222[113] + 1) = &v140;
  *(_QWORD *)&v222[115] = "Wrapping key (for joinWithCustodianRecoveryKey)";
  BYTE8(v222[115]) = 1;
  memset(&v222[122], 0, 32);
  *(_QWORD *)&v222[117] = 0;
  memset(&v222[118], 0, 56);
  *((_QWORD *)&v222[117] + 1) = "wrapped-key";
  *(_QWORD *)&v222[120] = &v139;
  *((_QWORD *)&v222[121] + 1) = "Wrapped key (for joinWithCustodianRecoveryKey)";
  LOBYTE(v222[122]) = 1;
  *((_QWORD *)&v222[129] + 1) = 0;
  *(_OWORD *)((char *)&v222[128] + 8) = 0u;
  v222[127] = 0uLL;
  *(_OWORD *)((char *)&v222[125] + 8) = 0u;
  *(_OWORD *)((char *)&v222[124] + 8) = 0u;
  *(_QWORD *)&v222[124] = "claim-token";
  *((_QWORD *)&v222[126] + 1) = &v138;
  *(_QWORD *)&v222[128] = "Claim token for inheritance";
  BYTE8(v222[128]) = 1;
  memset(&v222[135], 0, 32);
  *(_QWORD *)&v222[130] = 0;
  memset(&v222[131], 0, 56);
  *((_QWORD *)&v222[130] + 1) = "custodianUUID";
  *(_QWORD *)&v222[133] = &v137;
  *((_QWORD *)&v222[134] + 1) = "UUID for joinWithCustodianRecoveryKey";
  LOBYTE(v222[135]) = 1;
  *((_QWORD *)&v222[142] + 1) = 0;
  *(_OWORD *)((char *)&v222[141] + 8) = 0u;
  v222[140] = 0uLL;
  *(_OWORD *)((char *)&v222[138] + 8) = 0u;
  *(_OWORD *)((char *)&v222[137] + 8) = 0u;
  *(_QWORD *)&v222[137] = "inheritanceUUID";
  *((_QWORD *)&v222[139] + 1) = &v136;
  *(_QWORD *)&v222[141] = "UUID for joinWithInheritanceKey";
  BYTE8(v222[141]) = 1;
  memset(&v222[148], 0, 32);
  *(_QWORD *)&v222[143] = 0;
  memset(&v222[144], 0, 56);
  *((_QWORD *)&v222[143] + 1) = "timeout";
  *(_QWORD *)&v222[146] = &v135;
  *((_QWORD *)&v222[147] + 1) = "timeout for command (in s)";
  *((_QWORD *)&v222[155] + 1) = 0;
  *(_OWORD *)((char *)&v222[154] + 8) = 0u;
  v222[153] = 0uLL;
  *(_OWORD *)((char *)&v222[151] + 8) = 0u;
  *(_OWORD *)((char *)&v222[150] + 8) = 0u;
  *(_QWORD *)&v222[150] = "idms-target-context";
  *((_QWORD *)&v222[152] + 1) = &v133;
  *(_QWORD *)&v222[154] = "idmsTargetContext";
  BYTE8(v222[154]) = 1;
  memset(&v222[161], 0, 25);
  *(_QWORD *)&v222[156] = 0;
  memset(&v222[157], 0, 56);
  *((_QWORD *)&v222[156] + 1) = "idms-cuttlefish-password";
  *(_QWORD *)&v222[159] = &v132;
  *((_QWORD *)&v222[160] + 1) = "idmsCuttlefishPassword";
  LOBYTE(v222[161]) = 1;
  *(_QWORD *)&v222[163] = 0;
  *((_QWORD *)&v222[163] + 1) = "start";
  *(_QWORD *)&v222[164] = 0;
  BYTE8(v222[164]) = 0;
  v222[165] = 0u;
  *(_QWORD *)&v222[166] = (char *)&v184 + 4;
  DWORD2(v222[166]) = 1;
  *(_QWORD *)&v222[167] = "Start Octagon state machine";
  BYTE8(v222[167]) = 1;
  *((_QWORD *)&v222[169] + 1) = 0;
  memset(&v222[168], 0, 17);
  *(_QWORD *)&v222[170] = "sign-in";
  *((_QWORD *)&v222[170] + 1) = 0;
  LOBYTE(v222[171]) = 0;
  *(_OWORD *)((char *)&v222[171] + 8) = 0u;
  *((_QWORD *)&v222[172] + 1) = &v184;
  LODWORD(v222[173]) = 1;
  *((_QWORD *)&v222[173] + 1) = "Inform Cuttlefish container of sign in";
  LOBYTE(v222[174]) = 1;
  *(_QWORD *)&v222[176] = 0;
  BYTE8(v222[175]) = 0;
  *(_OWORD *)((char *)&v222[174] + 8) = 0u;
  *((_QWORD *)&v222[176] + 1) = "sign-out";
  *(_QWORD *)&v222[177] = 0;
  BYTE8(v222[177]) = 0;
  v222[178] = 0u;
  *(_QWORD *)&v222[179] = (char *)&v183 + 4;
  DWORD2(v222[179]) = 1;
  *(_QWORD *)&v222[180] = "Inform Cuttlefish container of sign out";
  BYTE8(v222[180]) = 1;
  *((_QWORD *)&v222[182] + 1) = 0;
  memset(&v222[181], 0, 17);
  *(_QWORD *)&v222[183] = "status";
  *((_QWORD *)&v222[183] + 1) = 0;
  LOBYTE(v222[184]) = 0;
  *(_OWORD *)((char *)&v222[184] + 8) = 0u;
  *((_QWORD *)&v222[185] + 1) = (char *)&v179 + 4;
  LODWORD(v222[186]) = 1;
  *((_QWORD *)&v222[186] + 1) = "Report Octagon status";
  LOBYTE(v222[187]) = 0;
  *(_QWORD *)&v222[189] = 0;
  BYTE8(v222[188]) = 0;
  *(_OWORD *)((char *)&v222[187] + 8) = 0u;
  *((_QWORD *)&v222[189] + 1) = "resetoctagon";
  *(_QWORD *)&v222[190] = 0;
  BYTE8(v222[190]) = 0;
  v222[191] = 0u;
  *(_QWORD *)&v222[192] = &v183;
  DWORD2(v222[192]) = 1;
  *(_QWORD *)&v222[193] = "Reset and establish new Octagon trust";
  BYTE8(v222[193]) = 1;
  *((_QWORD *)&v222[195] + 1) = 0;
  memset(&v222[194], 0, 17);
  *(_QWORD *)&v222[196] = "resetProtectedData";
  *((_QWORD *)&v222[238] + 1) = "Trigger an Escrow Request request";
  v222[256] = 0u;
  *((_QWORD *)&v222[263] + 1) = (char *)&v160 + 4;
  *(_QWORD *)&v222[371] = 0;
  BYTE8(v222[370]) = 0;
  *(_OWORD *)((char *)&v222[369] + 8) = 0u;
  *((_QWORD *)&v222[368] + 1) = "Store an inheritance key";
  LODWORD(v222[368]) = 1;
  LOBYTE(v222[369]) = 1;
  v222[360] = 0u;
  LOBYTE(v222[366]) = 0;
  *(_OWORD *)((char *)&v222[366] + 8) = 0u;
  *((_QWORD *)&v222[367] + 1) = (char *)&v167 + 4;
  memset(&v222[363], 0, 17);
  *(_QWORD *)&v222[365] = "store-inheritance-key";
  *((_QWORD *)&v222[365] + 1) = 0;
  DWORD2(v222[361]) = 1;
  *(_QWORD *)&v222[362] = "Generate an inheritance key";
  BYTE8(v222[362]) = 1;
  *((_QWORD *)&v222[364] + 1) = 0;
  *(_QWORD *)&v222[361] = &v168;
  *(_QWORD *)&v222[359] = 0;
  BYTE8(v222[359]) = 0;
  *(_QWORD *)&v222[358] = 0;
  BYTE8(v222[357]) = 0;
  *(_OWORD *)((char *)&v222[356] + 8) = 0u;
  *((_QWORD *)&v222[358] + 1) = "generate-inheritance-key";
  *((_QWORD *)&v222[355] + 1) = "Create an inheritance key";
  LODWORD(v222[355]) = 1;
  LOBYTE(v222[356]) = 1;
  v222[347] = 0u;
  LOBYTE(v222[353]) = 0;
  *(_OWORD *)((char *)&v222[353] + 8) = 0u;
  *((_QWORD *)&v222[354] + 1) = (char *)&v168 + 4;
  memset(&v222[350], 0, 17);
  *(_QWORD *)&v222[352] = "create-inheritance-key";
  *((_QWORD *)&v222[352] + 1) = 0;
  DWORD2(v222[348]) = 1;
  *(_QWORD *)&v222[349] = "Check a custodian recovery key for existence";
  BYTE8(v222[349]) = 1;
  *((_QWORD *)&v222[351] + 1) = 0;
  *(_QWORD *)&v222[348] = (char *)&v171 + 4;
  *(_QWORD *)&v222[346] = 0;
  BYTE8(v222[346]) = 0;
  *(_QWORD *)&v222[345] = 0;
  BYTE8(v222[344]) = 0;
  *(_OWORD *)((char *)&v222[343] + 8) = 0u;
  *((_QWORD *)&v222[345] + 1) = "check-custodian-recovery-key";
  *((_QWORD *)&v222[342] + 1) = "Remove a custodian recovery key";
  LODWORD(v222[342]) = 1;
  LOBYTE(v222[343]) = 1;
  v222[334] = 0u;
  LOBYTE(v222[340]) = 0;
  *(_OWORD *)((char *)&v222[340] + 8) = 0u;
  *((_QWORD *)&v222[341] + 1) = &v172;
  memset(&v222[337], 0, 17);
  *(_QWORD *)&v222[339] = "remove-custodian-recovery-key";
  *((_QWORD *)&v222[339] + 1) = 0;
  DWORD2(v222[335]) = 1;
  *(_QWORD *)&v222[336] = "Preflight join with a custodian recovery key";
  BYTE8(v222[336]) = 1;
  *((_QWORD *)&v222[338] + 1) = 0;
  *(_QWORD *)&v222[335] = (char *)&v172 + 4;
  *(_QWORD *)&v222[333] = 0;
  BYTE8(v222[333]) = 0;
  *(_QWORD *)&v222[332] = 0;
  BYTE8(v222[331]) = 0;
  *(_OWORD *)((char *)&v222[330] + 8) = 0u;
  *((_QWORD *)&v222[332] + 1) = "preflight-join-with-custodian-recovery-key";
  *((_QWORD *)&v222[329] + 1) = "Join with a custodian recovery key";
  LODWORD(v222[329]) = 1;
  LOBYTE(v222[330]) = 1;
  v222[321] = 0u;
  LOBYTE(v222[327]) = 0;
  *(_OWORD *)((char *)&v222[327] + 8) = 0u;
  *((_QWORD *)&v222[328] + 1) = &v173;
  memset(&v222[324], 0, 17);
  *(_QWORD *)&v222[326] = "join-with-custodian-recovery-key";
  *((_QWORD *)&v222[326] + 1) = 0;
  DWORD2(v222[322]) = 1;
  *(_QWORD *)&v222[323] = "Create a custodian recovery key";
  BYTE8(v222[323]) = 1;
  *((_QWORD *)&v222[325] + 1) = 0;
  *(_QWORD *)&v222[322] = (char *)&v173 + 4;
  *(_QWORD *)&v222[320] = 0;
  BYTE8(v222[320]) = 0;
  *(_QWORD *)&v222[319] = 0;
  BYTE8(v222[318]) = 0;
  *(_OWORD *)((char *)&v222[317] + 8) = 0u;
  *((_QWORD *)&v222[319] + 1) = "create-custodian-recovery-key";
  *((_QWORD *)&v222[316] + 1) = "Reset an account's CDP contents (escrow records, kvs data, cuttlefish)";
  LODWORD(v222[316]) = 1;
  LOBYTE(v222[317]) = 1;
  v222[308] = 0u;
  LOBYTE(v222[314]) = 0;
  *(_OWORD *)((char *)&v222[314] + 8) = 0u;
  *((_QWORD *)&v222[315] + 1) = &v174;
  memset(&v222[311], 0, 17);
  *(_QWORD *)&v222[313] = "reset-account-cdp-contents";
  *((_QWORD *)&v222[313] + 1) = 0;
  DWORD2(v222[309]) = 1;
  *(_QWORD *)&v222[310] = "Silent record recovery";
  BYTE8(v222[310]) = 0;
  *((_QWORD *)&v222[312] + 1) = 0;
  *(_QWORD *)&v222[309] = (char *)&v174 + 4;
  *(_QWORD *)&v222[307] = 0;
  BYTE8(v222[307]) = 0;
  *(_QWORD *)&v222[306] = 0;
  BYTE8(v222[305]) = 0;
  *(_OWORD *)((char *)&v222[304] + 8) = 0u;
  *((_QWORD *)&v222[306] + 1) = "recover-record-silent";
  *((_QWORD *)&v222[303] + 1) = "Recover record";
  LODWORD(v222[303]) = 1;
  LOBYTE(v222[304]) = 0;
  v222[295] = 0u;
  LOBYTE(v222[301]) = 0;
  *(_OWORD *)((char *)&v222[301] + 8) = 0u;
  *((_QWORD *)&v222[302] + 1) = &v175;
  memset(&v222[298], 0, 17);
  *(_QWORD *)&v222[300] = "recover-record";
  *((_QWORD *)&v222[300] + 1) = 0;
  DWORD2(v222[296]) = 1;
  *(_QWORD *)&v222[297] = "Fetch All Escrow Records";
  BYTE8(v222[297]) = 0;
  *((_QWORD *)&v222[299] + 1) = 0;
  *(_QWORD *)&v222[296] = (char *)&v175 + 4;
  *(_QWORD *)&v222[294] = 0;
  BYTE8(v222[294]) = 0;
  *(_QWORD *)&v222[293] = 0;
  BYTE8(v222[292]) = 0;
  *(_OWORD *)((char *)&v222[291] + 8) = 0u;
  *((_QWORD *)&v222[293] + 1) = "fetchAllEscrowRecords";
  *((_QWORD *)&v222[290] + 1) = "Fetch Escrow Records";
  LODWORD(v222[290]) = 1;
  LOBYTE(v222[291]) = 0;
  v222[282] = 0u;
  LOBYTE(v222[288]) = 0;
  *(_OWORD *)((char *)&v222[288] + 8) = 0u;
  *((_QWORD *)&v222[289] + 1) = &v176;
  memset(&v222[285], 0, 17);
  *(_QWORD *)&v222[287] = "fetchEscrowRecords";
  *((_QWORD *)&v222[287] + 1) = 0;
  DWORD2(v222[283]) = 1;
  *(_QWORD *)&v222[284] = "Trigger a TapToRadar";
  BYTE8(v222[284]) = 1;
  *((_QWORD *)&v222[286] + 1) = 0;
  *(_QWORD *)&v222[283] = (char *)&v176 + 4;
  *(_QWORD *)&v222[281] = 0;
  BYTE8(v222[281]) = 0;
  *(_QWORD *)&v222[280] = 0;
  BYTE8(v222[279]) = 0;
  *(_OWORD *)((char *)&v222[278] + 8) = 0u;
  *((_QWORD *)&v222[280] + 1) = "taptoradar";
  *((_QWORD *)&v222[277] + 1) = "Trigger a refetch of the CKKS policy";
  LODWORD(v222[277]) = 1;
  LOBYTE(v222[278]) = 0;
  v222[269] = 0u;
  LOBYTE(v222[275]) = 0;
  *(_OWORD *)((char *)&v222[275] + 8) = 0u;
  *((_QWORD *)&v222[276] + 1) = &v177;
  memset(&v222[272], 0, 17);
  *(_QWORD *)&v222[274] = "ckks-policy";
  *((_QWORD *)&v222[274] + 1) = 0;
  DWORD2(v222[270]) = 1;
  *(_QWORD *)&v222[271] = "Simulate receiving a Octagon push notification";
  BYTE8(v222[271]) = 1;
  *((_QWORD *)&v222[273] + 1) = 0;
  *(_QWORD *)&v222[270] = &v160;
  *(_QWORD *)&v222[268] = 0;
  BYTE8(v222[268]) = 0;
  *(_QWORD *)&v222[267] = 0;
  BYTE8(v222[266]) = 0;
  *(_OWORD *)((char *)&v222[265] + 8) = 0u;
  *((_QWORD *)&v222[267] + 1) = "simulate-receive-push";
  *((_QWORD *)&v222[264] + 1) = "Check Octagon Health status";
  LODWORD(v222[264]) = 1;
  LOBYTE(v222[265]) = 0;
  *(_QWORD *)&v222[257] = (char *)&v177 + 4;
  *((_QWORD *)&v222[261] + 1) = 0;
  LOBYTE(v222[262]) = 0;
  *(_OWORD *)((char *)&v222[262] + 8) = 0u;
  *(_QWORD *)&v222[261] = "health";
  *((_QWORD *)&v222[260] + 1) = 0;
  memset(&v222[259], 0, 17);
  *((_QWORD *)&v222[196] + 1) = 0;
  *(_QWORD *)&v222[258] = "Store any pending Escrow Request prerecords";
  DWORD2(v222[257]) = 1;
  BYTE8(v222[258]) = 0;
  *((_QWORD *)&v222[254] + 1) = "er-store";
  *(_OWORD *)((char *)&v222[252] + 8) = 0u;
  *(_QWORD *)&v222[255] = 0;
  BYTE8(v222[255]) = 0;
  LOBYTE(v222[197]) = 0;
  *((_QWORD *)&v222[251] + 1) = "Delete all Escrow Request requests";
  LOBYTE(v222[252]) = 0;
  *(_QWORD *)&v222[254] = 0;
  BYTE8(v222[253]) = 0;
  *((_QWORD *)&v222[250] + 1) = &v178;
  *(_OWORD *)((char *)&v222[249] + 8) = 0u;
  LODWORD(v222[251]) = 1;
  *(_QWORD *)&v222[248] = "er-reset";
  memset(&v222[246], 0, 17);
  *((_QWORD *)&v222[248] + 1) = 0;
  LOBYTE(v222[249]) = 0;
  v222[243] = 0u;
  BYTE8(v222[245]) = 0;
  *((_QWORD *)&v222[247] + 1) = 0;
  *(_QWORD *)&v222[244] = (char *)&v178 + 4;
  DWORD2(v222[244]) = 1;
  *(_QWORD *)&v222[245] = "Report status on any pending Escrow Request requests";
  *(_OWORD *)((char *)&v222[239] + 8) = 0u;
  *((_QWORD *)&v222[241] + 1) = "er-status";
  *(_QWORD *)&v222[242] = 0;
  BYTE8(v222[242]) = 0;
  BYTE8(v222[240]) = 0;
  LOBYTE(v222[239]) = 1;
  *(_QWORD *)&v222[241] = 0;
  *((_QWORD *)&v222[228] + 1) = "depart";
  LOBYTE(v222[236]) = 0;
  *(_OWORD *)((char *)&v222[236] + 8) = 0u;
  *((_QWORD *)&v222[237] + 1) = &v179;
  LODWORD(v222[238]) = 1;
  *(_QWORD *)&v222[229] = 0;
  *(_QWORD *)&v222[235] = "er-trigger";
  *((_QWORD *)&v222[235] + 1) = 0;
  *(_QWORD *)&v222[232] = "Depart from Octagon Trust";
  BYTE8(v222[232]) = 1;
  *((_QWORD *)&v222[234] + 1) = 0;
  memset(&v222[233], 0, 17);
  BYTE8(v222[229]) = 0;
  v222[230] = 0u;
  *(_QWORD *)&v222[231] = &v180;
  DWORD2(v222[231]) = 1;
  *(_OWORD *)((char *)&v222[197] + 8) = 0u;
  *(_QWORD *)&v222[228] = 0;
  BYTE8(v222[227]) = 0;
  *(_OWORD *)((char *)&v222[226] + 8) = 0u;
  *((_QWORD *)&v222[224] + 1) = (char *)&v180 + 4;
  LODWORD(v222[225]) = 1;
  *((_QWORD *)&v222[225] + 1) = "Recover using this bottle";
  LOBYTE(v222[226]) = 0;
  *(_QWORD *)&v222[222] = "recover";
  *((_QWORD *)&v222[222] + 1) = 0;
  LOBYTE(v222[223]) = 0;
  *(_OWORD *)((char *)&v222[223] + 8) = 0u;
  memset(&v222[220], 0, 17);
  *((_QWORD *)&v222[221] + 1) = 0;
  *(_QWORD *)&v222[218] = &v181;
  DWORD2(v222[218]) = 1;
  *(_QWORD *)&v222[219] = "Fetch all viable bottles";
  BYTE8(v222[219]) = 0;
  *((_QWORD *)&v222[215] + 1) = "allBottles";
  *(_QWORD *)&v222[216] = 0;
  BYTE8(v222[216]) = 0;
  v222[217] = 0u;
  *((_QWORD *)&v222[198] + 1) = (char *)&v182 + 4;
  *((_QWORD *)&v222[212] + 1) = "Modify or view user-controllable views status (If one of --enable or --pause is passed, "
                                "will modify status)";
  LOBYTE(v222[213]) = 1;
  *(_QWORD *)&v222[215] = 0;
  BYTE8(v222[214]) = 0;
  *(_OWORD *)((char *)&v222[213] + 8) = 0u;
  LODWORD(v222[199]) = 1;
  LOBYTE(v222[210]) = 0;
  *(_OWORD *)((char *)&v222[210] + 8) = 0u;
  *((_QWORD *)&v222[211] + 1) = (char *)&v181 + 4;
  LODWORD(v222[212]) = 1;
  *(_QWORD *)&v222[209] = "user-controllable-views";
  *((_QWORD *)&v222[209] + 1) = 0;
  *(_QWORD *)&v222[206] = "Reset Octagon trust";
  BYTE8(v222[206]) = 1;
  *((_QWORD *)&v222[208] + 1) = 0;
  memset(&v222[207], 0, 17);
  BYTE8(v222[203]) = 0;
  v222[204] = 0u;
  *(_QWORD *)&v222[205] = &v182;
  DWORD2(v222[205]) = 1;
  BYTE8(v222[201]) = 0;
  *(_OWORD *)((char *)&v222[200] + 8) = 0u;
  *((_QWORD *)&v222[202] + 1) = "reset";
  *(_QWORD *)&v222[203] = 0;
  LOBYTE(v222[200]) = 1;
  *(_QWORD *)&v222[202] = 0;
  *((_QWORD *)&v222[199] + 1) = "Reset ProtectedData";
  *((_QWORD *)&v222[371] + 1) = "join-with-inheritance-key";
  *(_QWORD *)&v222[372] = 0;
  v222[373] = 0u;
  BYTE8(v222[372]) = 0;
  *(_QWORD *)&v222[374] = &v167;
  DWORD2(v222[374]) = 1;
  *(_QWORD *)&v222[375] = "Join with an inheritance key";
  BYTE8(v222[375]) = 1;
  *((_QWORD *)&v222[377] + 1) = 0;
  memset(&v222[376], 0, 17);
  *(_QWORD *)&v222[378] = "preflight-join-with-inheritance-key";
  *((_QWORD *)&v222[378] + 1) = 0;
  LOBYTE(v222[379]) = 0;
  *(_OWORD *)((char *)&v222[379] + 8) = 0u;
  *((_QWORD *)&v222[380] + 1) = (char *)&v166 + 4;
  LODWORD(v222[381]) = 1;
  *((_QWORD *)&v222[381] + 1) = "Preflight join with an inheritance key";
  LOBYTE(v222[382]) = 1;
  *(_QWORD *)&v222[384] = 0;
  BYTE8(v222[383]) = 0;
  *(_OWORD *)((char *)&v222[382] + 8) = 0u;
  *((_QWORD *)&v222[384] + 1) = "remove-inheritance-key";
  *(_QWORD *)&v222[385] = 0;
  v222[386] = 0u;
  BYTE8(v222[385]) = 0;
  *(_QWORD *)&v222[387] = &v166;
  DWORD2(v222[387]) = 1;
  *(_QWORD *)&v222[388] = "Remove an inheritance key";
  BYTE8(v222[388]) = 1;
  *((_QWORD *)&v222[390] + 1) = 0;
  memset(&v222[389], 0, 17);
  *(_QWORD *)&v222[391] = "check-inheritance-key";
  *((_QWORD *)&v222[391] + 1) = 0;
  LOBYTE(v222[392]) = 0;
  *(_OWORD *)((char *)&v222[392] + 8) = 0u;
  *((_QWORD *)&v222[393] + 1) = (char *)&v165 + 4;
  LODWORD(v222[394]) = 1;
  *((_QWORD *)&v222[394] + 1) = "Check an inheritance key for existence";
  LOBYTE(v222[395]) = 1;
  *(_QWORD *)&v222[397] = 0;
  BYTE8(v222[396]) = 0;
  *(_OWORD *)((char *)&v222[395] + 8) = 0u;
  *((_QWORD *)&v222[397] + 1) = "recreate-inheritance-key";
  *(_QWORD *)&v222[398] = 0;
  v222[399] = 0u;
  BYTE8(v222[398]) = 0;
  *(_QWORD *)&v222[400] = &v165;
  DWORD2(v222[400]) = 1;
  *(_QWORD *)&v222[401] = "Recreate an inheritance key";
  BYTE8(v222[401]) = 1;
  *((_QWORD *)&v222[403] + 1) = 0;
  memset(&v222[402], 0, 17);
  *(_QWORD *)&v222[404] = "create-inheritance-key-with-claim-wrapping";
  *((_QWORD *)&v222[404] + 1) = 0;
  LOBYTE(v222[405]) = 0;
  *(_OWORD *)((char *)&v222[405] + 8) = 0u;
  *((_QWORD *)&v222[406] + 1) = (char *)&v164 + 4;
  LODWORD(v222[407]) = 1;
  *((_QWORD *)&v222[407] + 1) = "Create an inheritance key given claim+wrapping key";
  LOBYTE(v222[408]) = 1;
  *(_QWORD *)&v222[410] = 0;
  BYTE8(v222[409]) = 0;
  *(_OWORD *)((char *)&v222[408] + 8) = 0u;
  *((_QWORD *)&v222[410] + 1) = "tlk-recoverability";
  *(_QWORD *)&v222[411] = 0;
  v222[412] = 0u;
  BYTE8(v222[411]) = 0;
  *(_QWORD *)&v222[413] = (char *)&v159 + 4;
  DWORD2(v222[413]) = 1;
  *(_QWORD *)&v222[414] = "Evaluate tlk recoverability for an account";
  BYTE8(v222[414]) = 1;
  *((_QWORD *)&v222[416] + 1) = 0;
  memset(&v222[415], 0, 17);
  *(_QWORD *)&v222[417] = "set-machine-id-override";
  *((_QWORD *)&v222[417] + 1) = 0;
  LOBYTE(v222[418]) = 0;
  *(_OWORD *)((char *)&v222[418] + 8) = 0u;
  *((_QWORD *)&v222[419] + 1) = &v159;
  LODWORD(v222[420]) = 1;
  *((_QWORD *)&v222[420] + 1) = "Set machineID override";
  LOBYTE(v222[421]) = 0;
  *(_QWORD *)&v222[423] = 0;
  BYTE8(v222[422]) = 0;
  *(_OWORD *)((char *)&v222[421] + 8) = 0u;
  *((_QWORD *)&v222[423] + 1) = "remove-recovery-key";
  *(_QWORD *)&v222[424] = 0;
  v222[425] = 0u;
  BYTE8(v222[424]) = 0;
  *(_QWORD *)&v222[426] = (char *)&v170 + 4;
  DWORD2(v222[426]) = 1;
  *(_QWORD *)&v222[427] = "Remove a recovery key";
  BYTE8(v222[427]) = 1;
  *((_QWORD *)&v222[429] + 1) = 0;
  memset(&v222[428], 0, 17);
  *(_QWORD *)&v222[430] = "set-recovery-key";
  *((_QWORD *)&v222[430] + 1) = 0;
  LOBYTE(v222[431]) = 0;
  *(_OWORD *)((char *)&v222[431] + 8) = 0u;
  *((_QWORD *)&v222[432] + 1) = &v171;
  LODWORD(v222[433]) = 1;
  *((_QWORD *)&v222[433] + 1) = "Set a recovery key";
  LOBYTE(v222[434]) = 1;
  *(_QWORD *)&v222[436] = 0;
  BYTE8(v222[435]) = 0;
  *(_OWORD *)((char *)&v222[434] + 8) = 0u;
  *((_QWORD *)&v222[436] + 1) = "join-with-recovery-key";
  *(_QWORD *)&v222[437] = 0;
  v222[438] = 0u;
  BYTE8(v222[437]) = 0;
  *(_QWORD *)&v222[439] = &v170;
  DWORD2(v222[439]) = 1;
  *(_QWORD *)&v222[440] = "Join with a recovery key";
  BYTE8(v222[440]) = 1;
  *((_QWORD *)&v222[442] + 1) = 0;
  memset(&v222[441], 0, 17);
  *(_QWORD *)&v222[443] = "check-recovery-key";
  *((_QWORD *)&v222[443] + 1) = 0;
  LOBYTE(v222[444]) = 0;
  *(_OWORD *)((char *)&v222[444] + 8) = 0u;
  *((_QWORD *)&v222[445] + 1) = (char *)&v169 + 4;
  LODWORD(v222[446]) = 1;
  *((_QWORD *)&v222[446] + 1) = "Check a recovery key";
  LOBYTE(v222[447]) = 1;
  *(_QWORD *)&v222[449] = 0;
  BYTE8(v222[448]) = 0;
  *(_OWORD *)((char *)&v222[447] + 8) = 0u;
  *((_QWORD *)&v222[449] + 1) = "preflight-join-with-recovery-key";
  *(_QWORD *)&v222[450] = 0;
  v222[451] = 0u;
  BYTE8(v222[450]) = 0;
  *(_QWORD *)&v222[452] = &v169;
  DWORD2(v222[452]) = 1;
  *(_QWORD *)&v222[453] = "Preflight join with a recovery key";
  BYTE8(v222[453]) = 1;
  memset(&v222[460], 0, 25);
  memset(&v222[458], 0, 24);
  memset(&v222[456], 0, 32);
  memset(&v222[454], 0, 24);
  *((_QWORD *)&v222[455] + 1) = "recoveryKey";
  *(_QWORD *)&v222[458] = &v134;
  *((_QWORD *)&v222[459] + 1) = "recovery key";
  *(_QWORD *)&v222[462] = 0;
  *((_QWORD *)&v222[462] + 1) = "enable-walrus";
  *(_QWORD *)&v222[463] = 0;
  BYTE8(v222[463]) = 0;
  v222[464] = 0u;
  *(_QWORD *)&v222[465] = (char *)&v162 + 4;
  DWORD2(v222[465]) = 1;
  *(_QWORD *)&v222[466] = "Enable Walrus Setting";
  BYTE8(v222[466]) = 1;
  *((_QWORD *)&v222[468] + 1) = 0;
  memset(&v222[467], 0, 17);
  *(_QWORD *)&v222[469] = "disable-walrus";
  *((_QWORD *)&v222[469] + 1) = 0;
  LOBYTE(v222[470]) = 0;
  *(_OWORD *)((char *)&v222[470] + 8) = 0u;
  *((_QWORD *)&v222[471] + 1) = &v162;
  LODWORD(v222[472]) = 1;
  *((_QWORD *)&v222[472] + 1) = "Disable Walrus Setting";
  LOBYTE(v222[473]) = 1;
  *(_QWORD *)&v222[475] = 0;
  BYTE8(v222[474]) = 0;
  *(_OWORD *)((char *)&v222[473] + 8) = 0u;
  *((_QWORD *)&v222[475] + 1) = "enable-webaccess";
  *(_QWORD *)&v222[476] = 0;
  BYTE8(v222[476]) = 0;
  v222[477] = 0u;
  *(_QWORD *)&v222[478] = (char *)&v161 + 4;
  DWORD2(v222[478]) = 1;
  *(_QWORD *)&v222[479] = "Enable Web Access Setting";
  BYTE8(v222[479]) = 1;
  *((_QWORD *)&v222[481] + 1) = 0;
  memset(&v222[480], 0, 17);
  *(_QWORD *)&v222[482] = "disable-webaccess";
  *((_QWORD *)&v222[482] + 1) = 0;
  LOBYTE(v222[483]) = 0;
  *(_OWORD *)((char *)&v222[483] + 8) = 0u;
  *((_QWORD *)&v222[484] + 1) = &v161;
  LODWORD(v222[485]) = 1;
  *((_QWORD *)&v222[485] + 1) = "Disable Web Access Setting";
  LOBYTE(v222[486]) = 1;
  *(_QWORD *)&v222[488] = 0;
  BYTE8(v222[487]) = 0;
  *(_OWORD *)((char *)&v222[486] + 8) = 0u;
  *((_QWORD *)&v222[488] + 1) = "fetch-account-state";
  *(_QWORD *)&v222[489] = 0;
  BYTE8(v222[489]) = 0;
  v222[490] = 0u;
  *(_QWORD *)&v222[491] = &v164;
  DWORD2(v222[491]) = 1;
  *(_QWORD *)&v222[492] = "Fetch Account Settings";
  BYTE8(v222[492]) = 1;
  *((_QWORD *)&v222[494] + 1) = 0;
  memset(&v222[493], 0, 17);
  *(_QWORD *)&v222[495] = "fetch-account-wide-state";
  *((_QWORD *)&v222[495] + 1) = 0;
  LOBYTE(v222[496]) = 0;
  *(_OWORD *)((char *)&v222[496] + 8) = 0u;
  *((_QWORD *)&v222[497] + 1) = (char *)&v163 + 4;
  LODWORD(v222[498]) = 1;
  *((_QWORD *)&v222[498] + 1) = "Fetch Account Wide Settings";
  LOBYTE(v222[499]) = 1;
  *(_QWORD *)&v222[501] = 0;
  BYTE8(v222[500]) = 0;
  *(_OWORD *)((char *)&v222[499] + 8) = 0u;
  *((_QWORD *)&v222[501] + 1) = "fetch-account-wide-state-default";
  *(_QWORD *)&v222[502] = 0;
  BYTE8(v222[502]) = 0;
  v222[503] = 0u;
  *(_QWORD *)&v222[504] = &v163;
  DWORD2(v222[504]) = 1;
  *(_QWORD *)&v222[505] = "Fetch Account Wide Settings with Default";
  BYTE8(v222[505]) = 1;
  *((_QWORD *)&v222[507] + 1) = 0;
  memset(&v222[506], 0, 17);
  *(_QWORD *)&v222[508] = "print-account-metadata";
  *((_QWORD *)&v222[508] + 1) = 0;
  LOBYTE(v222[509]) = 0;
  *(_OWORD *)((char *)&v222[509] + 8) = 0u;
  *((_QWORD *)&v222[510] + 1) = (char *)&v147 + 4;
  LODWORD(v222[511]) = 1;
  *((_QWORD *)&v222[511] + 1) = "Print Account Metadata";
  LOBYTE(v222[512]) = 1;
  *(_QWORD *)&v222[514] = 0;
  BYTE8(v222[513]) = 0;
  *(_OWORD *)((char *)&v222[512] + 8) = 0u;
  *((_QWORD *)&v222[514] + 1) = "reroll";
  *(_QWORD *)&v222[515] = 0;
  BYTE8(v222[515]) = 0;
  v222[516] = 0u;
  *(_QWORD *)&v222[517] = &v158;
  DWORD2(v222[517]) = 1;
  *(_QWORD *)&v222[518] = "Reroll PeerID";
  BYTE8(v222[518]) = 1;
  memset(&v222[519], 0, 120);
  v131[0] = "otctl";
  v131[1] = "Control and report on Octagon Trust";
  v131[2] = v194;
  memset(v193, 170, sizeof(v193));
  sub_1000042DC((uint64_t)v193, (uint64_t)v131);
  v2 = sub_100004404((uint64_t)v193);
  v3 = (option *)malloc_type_calloc(v2 + 1, 0x20uLL, 0x10500402E37B38AuLL);
  v4 = 2 * v2 + 2;
  v5 = (char *)malloc_type_malloc(v4, 0x83F72549uLL);
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = (char *)v193[2];
  v10 = (char *)v193[2] + 48;
  do
  {
    if (v7 >= v2)
      goto LABEL_13;
    v11 = (const char *)*((_QWORD *)v10 - 5);
    if (v11)
    {
      v3[v7].name = v11;
      v13 = *(_QWORD *)v10;
      v12 = (int *)*((_QWORD *)v10 + 1);
      if (v12)
      {
        v14 = 2 * (v13 != 0);
      }
      else if (v13)
      {
        v14 = 1;
      }
      else
      {
        v14 = *((_QWORD *)v10 + 5) != 0;
      }
      v15 = &v3[v7];
      v15->has_arg = v14;
      v15->flag = v12;
      v15->val = *((_DWORD *)v10 + 4);
      ++v7;
    }
    ++v8;
    v10 += 104;
  }
  while (v8 <= v2);
  if (v7 < v2)
  {
    v16 = &v3[v7];
    v16->name = 0;
    v16->has_arg = 0;
    v16->flag = 0;
    v16->val = 0;
LABEL_14:
    v17 = 0;
    v18 = v9 + 48;
    v19 = v2;
    while (1)
    {
      if (*((_BYTE *)v18 - 48))
      {
        if (v17 >= v4)
          goto LABEL_25;
        v5[v17] = *((_BYTE *)v18 - 48);
        v20 = v17 + 1;
        if (!v18[1] && (*v18 || v18[5]))
        {
          if (v20 >= v4)
          {
LABEL_25:
            v123 = 0;
            goto LABEL_28;
          }
          v5[v20] = 58;
          v17 += 2;
        }
        else
        {
          ++v17;
        }
      }
      v18 += 13;
      if (!--v19)
      {
        v123 = 0;
        goto LABEL_27;
      }
    }
  }
LABEL_13:
  if (v2)
    goto LABEL_14;
  v17 = 0;
  v123 = 1;
LABEL_27:
  v5[v17] = 0;
LABEL_28:
  v192 = 0;
  do
  {
    while (1)
    {
      v21 = getopt_long(a1, a2, v6, v3, &v192);
      if (v21)
        break;
      if (!v192)
      {
LABEL_167:
        sub_100004478((uint64_t)v193);
        exit(1);
      }
      if ((v123 & 1) == 0)
      {
        v23 = 0;
        p_name = &v3[v192].name;
        v25 = v2;
        do
        {
          v26 = (char *)v193[2] + v23;
          v27 = *(const char **)((char *)v193[2] + v23 + 8);
          if (v27)
          {
            if (*p_name)
            {
              v28 = strlen(*(const char **)((char *)v193[2] + v23 + 8));
              if (!strncmp(*p_name, v27, v28))
              {
                v29 = *((_OWORD *)v26 + 5);
                v189 = *((_OWORD *)v26 + 4);
                v190 = v29;
                v191 = *((_QWORD *)v26 + 12);
                v30 = *((_OWORD *)v26 + 1);
                v185 = *(_OWORD *)v26;
                v186 = v30;
                v31 = *((_OWORD *)v26 + 3);
                v187 = *((_OWORD *)v26 + 2);
                v188 = v31;
                sub_100004A40((uint64_t)&v185, optarg);
              }
            }
          }
          v23 += 104;
          --v25;
        }
        while (v25);
      }
    }
    if (v21 == -1)
    {
      v39 = optind;
      if (optind >= a1)
      {
LABEL_71:
        free(v193[2]);
        free(v3);
        free(v6);
      }
      else
      {
        v40 = 0;
        do
        {
          v41 = v40;
          if ((v123 & 1) == 0)
          {
            v42 = 0;
            v43 = (char *)v193[2];
            v44 = (const char **)((char *)v193[2] + 16);
            while (!*v44 || strcmp(a2[v39], *v44))
            {
              ++v42;
              v44 += 13;
              if (v2 == v42)
                goto LABEL_60;
            }
            v47 = &v43[104 * v42];
            v48 = *((_OWORD *)v47 + 5);
            v189 = *((_OWORD *)v47 + 4);
            v190 = v48;
            v191 = *((_QWORD *)v47 + 12);
            v49 = *((_OWORD *)v47 + 1);
            v185 = *(_OWORD *)v47;
            v186 = v49;
            v50 = *((_OWORD *)v47 + 3);
            v187 = *((_OWORD *)v47 + 2);
            v188 = v50;
            sub_100004A40((uint64_t)&v185, 0);
            goto LABEL_71;
          }
LABEL_60:
          v36 = v193[2];
          if (v41 >= v2)
            goto LABEL_50;
          v45 = (char *)v193[2] + 104 * v41 + 24;
          v40 = v41;
          while (!*v45)
          {
            ++v40;
            v45 += 13;
            if (v2 == v40)
              goto LABEL_49;
          }
          v46 = (_QWORD *)*((_QWORD *)v193[2] + 13 * v40 + 6);
          if (v46)
          {
            *v46 = a2[v39];
            ++v40;
          }
          ++v39;
        }
        while ((_DWORD)v39 != a1);
        free(v193[2]);
        free(v3);
        free(v6);
        if (v41 >= v2)
          goto LABEL_51;
      }
      v51 = objc_autoreleasePoolPush();
      v130 = 0;
      v52 = objc_claimAutoreleasedReturnValue(+[OTControl controlObject:error:](OTControl, "controlObject:error:", 1, &v130));
      v53 = v130;
      if (v53 || !v52)
      {
        objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description"))), "UTF8String");
        errx(1, "no OTControl failed: %s");
      }
      if (v156)
        v54 = (char **)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v156, 4));
      else
        v54 = (char **)OTDefaultContext;
      v128 = v54;
      if (v144)
      {
        v126 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v144, 4));
      }
      else
      {
        v126 = CFSTR("com.apple.security.keychain");
        v55 = CFSTR("com.apple.security.keychain");
      }
      if (v145)
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v145, 4));
      else
        v124 = 0;
      if (v141)
        v109 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v141, 4));
      else
        v109 = 0;
      if (v142)
        v120 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v142, 4));
      else
        v120 = 0;
      if (v154)
        v111 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v154, 4));
      else
        v111 = CFSTR("NO");
      if (v140)
        v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v140, 4));
      else
        v118 = 0;
      if (v139)
        v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v139, 4));
      else
        v117 = 0;
      if (v138)
        v110 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v138, 4));
      else
        v110 = 0;
      if (v137)
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v137, 4));
      else
        v116 = 0;
      if (v136)
        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v136, 4));
      else
        v115 = 0;
      if (v135)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v135, 4));
        v57 = (double)(uint64_t)objc_msgSend(v56, "integerValue");

      }
      else
      {
        v57 = 600.0;
      }
      if (v133)
        v58 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v133, 4));
      else
        v58 = 0;
      if (v132)
        v59 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v132, 4));
      else
        v59 = 0;
      if (v152)
        v114 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v152, 4));
      else
        v114 = CFSTR("NO");
      context = v51;
      if (v151)
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v151, 4));
      else
        v60 = CFSTR("NO");
      v113 = v60;
      v106 = -[__CFString isEqualToString:](v60, "isEqualToString:", CFSTR("YES"));
      v61 = (void *)v58;
      if (v134)
        v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v134, 4));
      else
        v112 = 0;
      v121 = (void *)v52;
      v122 = -[OTControlCLI initWithOTControl:]([OTControlCLI alloc], "initWithOTControl:", v52);
      v62 = objc_alloc((Class)OTControlArguments);
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "UUIDString"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("otctl-flowID-%@"), v64));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "UUIDString"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("otctl-deviceSessionID-%@"), v67));
      v69 = objc_msgSend(v62, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:", v126, v128, v124, v65, v68);

      v70 = [EscrowRequestCLI alloc];
      v129 = 0;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowRequest request:](SecEscrowRequest, "request:", &v129));
      v72 = v129;
      v73 = -[EscrowRequestCLI initWithEscrowRequest:](v70, "initWithEscrowRequest:", v71);

      if (v72)
      {
        objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "description"))), "UTF8String");
        errx(1, "SecEscrowRequest failed: %s");
      }
      v74 = v61;
      v75 = v121;
      v76 = (void *)v59;
      v108 = v73;
      if ((_DWORD)v183)
      {
        v77 = v122;
        v78 = -[OTControlCLI resetOctagon:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:timeout:](v122, "resetOctagon:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:timeout:", v69, v74, v59, (_DWORD)v148 != 0, v57);
LABEL_128:
        v37 = v78;
        v79 = (void *)v109;
        v80 = (void *)v120;
LABEL_134:
        v83 = (void *)v110;
        v82 = v111;
LABEL_135:

        objc_autoreleasePoolPop(context);
        return v37;
      }
      v77 = v122;
      if (HIDWORD(v182))
      {
        v80 = (void *)v120;
        v79 = (void *)v109;
        v81 = -[OTControlCLI resetProtectedData:appleID:dsid:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:](v122, "resetProtectedData:appleID:dsid:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:", v69, v120, v109, v74, v59, (_DWORD)v148 != 0);
LABEL_133:
        v37 = v81;
        goto LABEL_134;
      }
      if ((_DWORD)v182)
      {
        v80 = (void *)v120;
        v79 = (void *)v109;
        v81 = -[OTControlCLI reset:appleID:dsid:](v122, "reset:appleID:dsid:", v69, v120, v109);
        goto LABEL_133;
      }
      if (HIDWORD(v181))
      {
        v83 = (void *)v110;
        v82 = v111;
        if (HIDWORD(v149) && (_DWORD)v149)
        {
          sub_100004478((uint64_t)v131);
          v37 = 1;
          v79 = (void *)v109;
          v80 = (void *)v120;
        }
        else
        {
          v79 = (void *)v109;
          v80 = (void *)v120;
          if (v149)
            v84 = -[OTControlCLI setUserControllableViewsSyncStatus:enabled:](v122, "setUserControllableViewsSyncStatus:enabled:", v69, HIDWORD(v149) != 0);
          else
            v84 = -[OTControlCLI fetchUserControllableViewsSyncStatus:](v122, "fetchUserControllableViewsSyncStatus:", v69);
          v37 = v84;
        }
        goto LABEL_135;
      }
      if ((_DWORD)v181)
      {
        v78 = -[OTControlCLI fetchAllBottles:control:overrideEscrowCache:](v122, "fetchAllBottles:control:overrideEscrowCache:", v69, v121, v106);
        goto LABEL_128;
      }
      if (HIDWORD(v180))
      {
        if (v155)
          v85 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v155, 4));
        else
          v85 = 0;
        v107 = (void *)v85;
        if (v157)
        {
          v86 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v157, 4));
          v87 = (void *)v86;
          if (v85 && v86)
          {
            v88 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v85, 0);
            if (!v88)
              errx(1, "bad base64 string passed to --entropy");
            v89 = v88;
            v37 = -[OTControlCLI recoverUsingBottleID:entropy:arguments:control:](v122, "recoverUsingBottleID:entropy:arguments:control:", v87, v88, v69, v121);

            goto LABEL_159;
          }
        }
        else
        {
          v87 = 0;
        }
        sub_100004478((uint64_t)v131);
        v37 = 1;
LABEL_159:
        v79 = (void *)v109;
        v83 = (void *)v110;
        v80 = (void *)v120;
        v82 = v111;

LABEL_160:
        v77 = v122;
        goto LABEL_135;
      }
      if ((_DWORD)v180)
      {
        v78 = -[OTControlCLI depart:](v122, "depart:", v69);
        goto LABEL_128;
      }
      if (HIDWORD(v184))
      {
        v77 = v122;
        v90 = -[OTControlCLI startOctagonStateMachine:](v122, "startOctagonStateMachine:", v69);
LABEL_174:
        v37 = v90;
LABEL_175:
        v79 = (void *)v109;
        v80 = (void *)v120;
        v82 = v111;
LABEL_176:
        v83 = (void *)v110;
        v75 = v121;
        goto LABEL_135;
      }
      if ((_DWORD)v184)
      {
        v77 = v122;
        v90 = -[OTControlCLI signIn:](v122, "signIn:", v69);
        goto LABEL_174;
      }
      if (HIDWORD(v183))
      {
        v77 = v122;
        v90 = -[OTControlCLI signOut:](v122, "signOut:", v69);
        goto LABEL_174;
      }
      if (HIDWORD(v179))
      {
        v77 = v122;
        v90 = -[OTControlCLI status:json:](v122, "status:json:", v69, HIDWORD(v148) != 0);
        goto LABEL_174;
      }
      if ((_DWORD)v176)
      {
        v77 = v122;
        v90 = -[OTControlCLI fetchEscrowRecords:json:overrideEscrowCache:](v122, "fetchEscrowRecords:json:overrideEscrowCache:", v69, HIDWORD(v148) != 0, v106);
        goto LABEL_174;
      }
      if (HIDWORD(v175))
      {
        v77 = v122;
        v90 = -[OTControlCLI fetchAllEscrowRecords:json:overrideEscrowCache:](v122, "fetchAllEscrowRecords:json:overrideEscrowCache:", v69, HIDWORD(v148) != 0, v106);
        goto LABEL_174;
      }
      if ((_DWORD)v159)
      {
        if (v150)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v150, 4));
          v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "description")));
          printf("machineID: %s\n", (const char *)objc_msgSend(v92, "UTF8String"));

        }
        else
        {
          puts("unsetting machineID");
          v91 = 0;
        }
        v37 = -[OTControlCLI setMachineIDOverride:machineID:json:](v122, "setMachineIDOverride:machineID:json:", v69, v91, HIDWORD(v148) != 0);

        v77 = v122;
        goto LABEL_175;
      }
      if ((_DWORD)v175)
      {
        if (v153)
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v153, 4));
        else
          v93 = 0;
        if (v155)
        {
          v95 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v155, 4));
          v96 = (void *)v95;
          if (v93 && v95 && v120)
          {
            v37 = -[OTControlCLI performEscrowRecovery:recordID:appleID:secret:overrideForAccountScript:overrideEscrowCache:](v122, "performEscrowRecovery:recordID:appleID:secret:overrideForAccountScript:overrideEscrowCache:", v69, v93, v120, v95, -[__CFString isEqualToString:](v114, "isEqualToString:", CFSTR("YES")), v106);
LABEL_200:

LABEL_206:
            v79 = (void *)v109;
            v83 = (void *)v110;
            v80 = (void *)v120;
            v75 = v121;
            v82 = v111;
            goto LABEL_160;
          }
        }
        else
        {
          v96 = 0;
        }
        sub_100004478((uint64_t)v131);
        v37 = 1;
        goto LABEL_200;
      }
      if (HIDWORD(v174))
      {
        if (v155)
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v155, 4));
          if (v94 && v120)
          {
            v37 = -[OTControlCLI performSilentEscrowRecovery:appleID:secret:](v122, "performSilentEscrowRecovery:appleID:secret:", v69, v120, v94);
LABEL_205:

            goto LABEL_206;
          }
        }
        else
        {
          v94 = 0;
        }
        sub_100004478((uint64_t)v131);
        v37 = 1;
        goto LABEL_205;
      }
      if (HIDWORD(v160))
      {
        v82 = v111;
        v97 = -[__CFString isEqualToString:](v111, "isEqualToString:", CFSTR("YES"));
        v77 = v122;
        v37 = -[OTControlCLI healthCheck:skipRateLimitingCheck:repair:json:](v122, "healthCheck:skipRateLimitingCheck:repair:json:", v69, v97, v146 != 0, HIDWORD(v148) != 0);
        v79 = (void *)v109;
        v80 = (void *)v120;
        goto LABEL_176;
      }
      if ((_DWORD)v160)
      {
        v77 = v122;
        v90 = -[OTControlCLI simulateReceivePush:json:](v122, "simulateReceivePush:json:", v69, HIDWORD(v148) != 0);
        goto LABEL_174;
      }
      if (HIDWORD(v159))
      {
        v77 = v122;
        v90 = -[OTControlCLI tlkRecoverability:](v122, "tlkRecoverability:", v69);
        goto LABEL_174;
      }
      if ((_DWORD)v177)
      {
        v77 = v122;
        v90 = -[OTControlCLI refetchCKKSPolicy:](v122, "refetchCKKSPolicy:", v69);
        goto LABEL_174;
      }
      if (HIDWORD(v176))
      {
        if (!v143)
          v143 = "1";
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        v77 = v122;
        v37 = -[OTControlCLI tapToRadar:description:radar:](v122, "tapToRadar:description:radar:", CFSTR("action"), CFSTR("description"), v98);

        goto LABEL_175;
      }
      if ((_DWORD)v174)
      {
        v77 = v122;
        v90 = -[OTControlCLI resetAccountCDPContentsWithArguments:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:](v122, "resetAccountCDPContentsWithArguments:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:", v69, v74, v59, (_DWORD)v148 != 0);
        goto LABEL_174;
      }
      if (HIDWORD(v173))
      {
        v77 = v122;
        v90 = -[OTControlCLI createCustodianRecoveryKeyWithArguments:uuidString:json:timeout:](v122, "createCustodianRecoveryKeyWithArguments:uuidString:json:timeout:", v69, v116, HIDWORD(v148) != 0, v57);
        goto LABEL_174;
      }
      if ((_DWORD)v173)
      {
        if (v118 && v117 && v116)
        {
          v77 = v122;
          v90 = -[OTControlCLI joinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:](v122, "joinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:", v69, v118, v117, v116, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v172))
      {
        if (v118 && v117 && v116)
        {
          v77 = v122;
          v90 = -[OTControlCLI preflightJoinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:](v122, "preflightJoinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:", v69, v118, v117, v116, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if ((_DWORD)v172)
      {
        if (v116)
        {
          v77 = v122;
          v90 = -[OTControlCLI removeCustodianRecoveryKeyWithArguments:uuidString:timeout:](v122, "removeCustodianRecoveryKeyWithArguments:uuidString:timeout:", v69, v116, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v171))
      {
        if (v116)
        {
          v77 = v122;
          v90 = -[OTControlCLI checkCustodianRecoveryKeyWithArguments:uuidString:timeout:](v122, "checkCustodianRecoveryKeyWithArguments:uuidString:timeout:", v69, v116, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v170))
      {
        v77 = v122;
        v90 = -[OTControlCLI removeRecoveryKeyWithArguments:](v122, "removeRecoveryKeyWithArguments:", v69);
        goto LABEL_174;
      }
      if ((_DWORD)v171)
      {
        v77 = v122;
        v90 = -[OTControlCLI setRecoveryKeyWithArguments:](v122, "setRecoveryKeyWithArguments:", v69);
        goto LABEL_174;
      }
      if ((_DWORD)v170)
      {
        if (v112)
        {
          v77 = v122;
          v90 = -[OTControlCLI joinWithRecoveryKeyWithArguments:recoveryKey:](v122, "joinWithRecoveryKeyWithArguments:recoveryKey:", v69, v112);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v169))
      {
        v77 = v122;
        v90 = -[OTControlCLI checkRecoveryKeyWithArguments:](v122, "checkRecoveryKeyWithArguments:", v69);
        goto LABEL_174;
      }
      if ((_DWORD)v169)
      {
        if (v112)
        {
          v77 = v122;
          v90 = -[OTControlCLI preflightJoinWithRecoveryKeyWithArguments:recoveryKey:](v122, "preflightJoinWithRecoveryKeyWithArguments:recoveryKey:", v69, v112);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v168))
      {
        v77 = v122;
        v90 = -[OTControlCLI createInheritanceKeyWithArguments:uuidString:json:timeout:](v122, "createInheritanceKeyWithArguments:uuidString:json:timeout:", v69, v115, HIDWORD(v148) != 0, v57);
        goto LABEL_174;
      }
      if ((_DWORD)v168)
      {
        v77 = v122;
        v90 = -[OTControlCLI generateInheritanceKeyWithArguments:json:timeout:](v122, "generateInheritanceKeyWithArguments:json:timeout:", v69, HIDWORD(v148) != 0, v57);
        goto LABEL_174;
      }
      if (HIDWORD(v167))
      {
        if (v118 && v117 && v115)
        {
          v77 = v122;
          v90 = -[OTControlCLI storeInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:](v122, "storeInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:", v69, v118, v117, v115, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if ((_DWORD)v167)
      {
        if (v118 && v117 && v115)
        {
          v77 = v122;
          v90 = -[OTControlCLI joinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:](v122, "joinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:", v69, v118, v117, v115, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v166))
      {
        if (v118 && v117 && v115)
        {
          v77 = v122;
          v90 = -[OTControlCLI preflightJoinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:](v122, "preflightJoinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:", v69, v118, v117, v115, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if ((_DWORD)v166)
      {
        if (v115)
        {
          v77 = v122;
          v90 = -[OTControlCLI removeInheritanceKeyWithArguments:uuidString:timeout:](v122, "removeInheritanceKeyWithArguments:uuidString:timeout:", v69, v115, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v165))
      {
        if (v115)
        {
          v77 = v122;
          v90 = -[OTControlCLI checkInheritanceKeyWithArguments:uuidString:timeout:](v122, "checkInheritanceKeyWithArguments:uuidString:timeout:", v69, v115, v57);
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if ((_DWORD)v165)
      {
        if (v118 && v117 && v110)
        {
          v77 = v122;
          v83 = (void *)v110;
          v99 = -[OTControlCLI recreateInheritanceKeyWithArguments:uuidString:wrappingKey:wrappedKey:claimToken:json:timeout:](v122, "recreateInheritanceKeyWithArguments:uuidString:wrappingKey:wrappedKey:claimToken:json:timeout:", v69, v115, v118, v117, v110, HIDWORD(v148) != 0, v57);
LABEL_284:
          v37 = v99;
          v79 = (void *)v109;
          v80 = (void *)v120;
          v75 = v121;
          v82 = v111;
          goto LABEL_135;
        }
      }
      else
      {
        if (!HIDWORD(v164))
        {
          if (HIDWORD(v162))
          {
            v77 = v122;
            v90 = -[OTControlCLI enableWalrusWithArguments:timeout:](v122, "enableWalrusWithArguments:timeout:", v69, v57);
            goto LABEL_174;
          }
          if ((_DWORD)v162)
          {
            v77 = v122;
            v90 = -[OTControlCLI disableWalrusWithArguments:timeout:](v122, "disableWalrusWithArguments:timeout:", v69, v57);
            goto LABEL_174;
          }
          if (HIDWORD(v161))
          {
            v77 = v122;
            v90 = -[OTControlCLI enableWebAccessWithArguments:timeout:](v122, "enableWebAccessWithArguments:timeout:", v69, v57);
            goto LABEL_174;
          }
          if ((_DWORD)v161)
          {
            v77 = v122;
            v90 = -[OTControlCLI disableWebAccessWithArguments:timeout:](v122, "disableWebAccessWithArguments:timeout:", v69, v57);
            goto LABEL_174;
          }
          if ((_DWORD)v164)
          {
            v77 = v122;
            v90 = -[OTControlCLI fetchAccountSettingsWithArguments:json:](v122, "fetchAccountSettingsWithArguments:json:", v69, HIDWORD(v148) != 0);
            goto LABEL_174;
          }
          if (HIDWORD(v163))
          {
            v100 = (_DWORD)v147 != 0;
            v101 = HIDWORD(v148) != 0;
            v77 = v122;
            v102 = v122;
            v103 = v69;
            v104 = 0;
          }
          else
          {
            if (!(_DWORD)v163)
            {
              if ((_DWORD)v179)
              {
                v105 = -[EscrowRequestCLI trigger](v73, "trigger");
              }
              else if (HIDWORD(v178))
              {
                v105 = -[EscrowRequestCLI status](v73, "status");
              }
              else if ((_DWORD)v178)
              {
                v105 = -[EscrowRequestCLI reset](v73, "reset");
              }
              else
              {
                if (!HIDWORD(v177))
                {
                  if (HIDWORD(v147))
                  {
                    v77 = v122;
                    v90 = -[OTControlCLI printAccountMetadataWithArguments:json:](v122, "printAccountMetadataWithArguments:json:", v69, HIDWORD(v148) != 0);
                    goto LABEL_174;
                  }
                  if (v158)
                  {
                    v77 = v122;
                    v90 = -[OTControlCLI rerollWithArguments:json:](v122, "rerollWithArguments:json:", v69, HIDWORD(v148) != 0);
                    goto LABEL_174;
                  }
                  goto LABEL_313;
                }
                v105 = -[EscrowRequestCLI storePrerecordsInEscrow](v73, "storePrerecordsInEscrow");
              }
              v37 = v105;
              goto LABEL_206;
            }
            v100 = (_DWORD)v147 != 0;
            v101 = HIDWORD(v148) != 0;
            v77 = v122;
            v102 = v122;
            v103 = v69;
            v104 = 1;
          }
          v90 = -[OTControlCLI fetchAccountWideSettingsWithArguments:useDefault:forceFetch:json:](v102, "fetchAccountWideSettingsWithArguments:useDefault:forceFetch:json:", v103, v104, v100, v101);
          goto LABEL_174;
        }
        if (v118 && v110)
        {
          v77 = v122;
          v83 = (void *)v110;
          v99 = -[OTControlCLI createInheritanceKeyWithClaimTokenAndWrappingKey:uuidString:claimToken:wrappingKey:json:timeout:](v122, "createInheritanceKeyWithClaimTokenAndWrappingKey:uuidString:claimToken:wrappingKey:json:timeout:", v69, v115, v110, v118, HIDWORD(v148) != 0, v57);
          goto LABEL_284;
        }
      }
LABEL_313:
      sub_100004478((uint64_t)v131);
      v37 = 1;
      goto LABEL_206;
    }
    if (v21 == 104)
      goto LABEL_167;
    if ((v123 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      v32 = (char *)v193[2];
      while (v21 != *v32)
      {
        ++v22;
        v32 += 104;
        if (v2 == v22)
          goto LABEL_49;
      }
      v33 = *((_OWORD *)v32 + 5);
      v189 = *((_OWORD *)v32 + 4);
      v190 = v33;
      v191 = *((_QWORD *)v32 + 12);
      v34 = *((_OWORD *)v32 + 1);
      v185 = *(_OWORD *)v32;
      v186 = v34;
      v35 = *((_OWORD *)v32 + 3);
      v187 = *((_OWORD *)v32 + 2);
      v188 = v35;
      sub_100004A40((uint64_t)&v185, optarg);
    }
  }
  while (v22 != v2);
LABEL_49:
  v36 = v193[2];
LABEL_50:
  free(v36);
  free(v3);
  free(v6);
LABEL_51:
  putchar(10);
  sub_100004478((uint64_t)v131);
  return 1;
}

void sub_100007810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000078E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000079B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000094C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1000099B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000A4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000A7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000A9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000AB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000AC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000ADE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000B430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000B708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000BA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000BD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000BF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000C7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000C970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000D6B4(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a1;
  v4 = a2;
  if (!(v3 | v4))
  {
    NSLog(CFSTR("Must provide either an AppleID or a DSID to fetch a PET"));
    exit(1);
  }
  v5 = (void *)v4;
  v6 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  objc_msgSend(v6, "setUsername:", v3);
  objc_msgSend(v6, "setAuthenticationType:", 1);
  objc_msgSend(v6, "setIsUsernameEditable:", 0);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10000D840;
  v19 = sub_10000D850;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D858;
  v12[3] = &unk_100020768;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "authenticateWithContext:completion:", v6, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void sub_10000D828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D840(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000D850(uint64_t a1)
{

}

void sub_10000D858(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    NSLog(CFSTR("error fetching PET: %@"), v5);
    exit(1);
  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", AKAuthenticationPasswordKey));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D8E0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  FILE *v7;
  id v8;
  const __CFString *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v9 = CFSTR("error");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
      v10 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      sub_10000D9F8(v6);

    }
    else
    {
      v7 = __stderrp;
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
      fprintf(v7, "Error rerolling: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    }
  }
  else
  {
    puts("Reroll successful.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void sub_10000D9F8(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = sub_10000DAC0(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v2, 3, &v6));
  v4 = v6;

  if (v3)
  {
    v5 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4));
    puts((const char *)objc_msgSend(v5, "UTF8String"));
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    NSLog(CFSTR("error during JSONification: %@"), v5);
  }

}

id sub_10000DAC0(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (a1)
  {
    v1 = objc_msgSend(a1, "mutableCopy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "allKeys", 0));
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", v7));
          v9 = sub_10000DC04(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          objc_msgSend(v1, "setObject:forKeyedSubscript:", v10, v7);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id sub_10000DC04(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[2];
  _QWORD v39[2];

  v2 = a1;
  if (!v2)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v3 = objc_opt_class(NSError, v1);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v38[0] = CFSTR("code");
    v4 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
    v38[1] = CFSTR("domain");
    v39[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v39[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
    v8 = objc_msgSend(v7, "mutableCopy");

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v10 = sub_10000DAC0(v9);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("userInfo"));
LABEL_4:

    goto LABEL_10;
  }
  if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v2)
    || (v13 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v2, v13) & 1) != 0))
  {
    v15 = v2;
    goto LABEL_9;
  }
  v17 = objc_opt_class(NSData, v14);
  if ((objc_opt_isKindOfClass(v2, v17) & 1) != 0)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));
    goto LABEL_9;
  }
  v19 = objc_opt_class(NSDictionary, v18);
  if ((objc_opt_isKindOfClass(v2, v19) & 1) != 0)
  {
    v21 = sub_10000DAC0(v2);
    v15 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_9;
  }
  v22 = objc_opt_class(NSArray, v20);
  if ((objc_opt_isKindOfClass(v2, v22) & 1) == 0)
  {
    v32 = objc_opt_class(NSDate, v23);
    if ((objc_opt_isKindOfClass(v2, v32) & 1) != 0)
    {
      v11 = v2;
      v9 = objc_alloc_init((Class)NSISO8601DateFormatter);
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v11));
      goto LABEL_4;
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));
LABEL_9:
    v8 = v15;
    goto LABEL_10;
  }
  v24 = v2;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v24, "count")));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        v30 = sub_10000DC04(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        objc_msgSend(v8, "addObject:", v31, (_QWORD)v33);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v27);
  }

LABEL_10:
  return v8;
}

void sub_10000DF48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  FILE *v11;
  id v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));
    v8 = v10;
    if (*(_BYTE *)(a1 + 32))
    {
      sub_10000D9F8(v10);
LABEL_9:

      goto LABEL_10;
    }
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
    puts((const char *)objc_msgSend(v9, "UTF8String"));
LABEL_8:

    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 32))
  {
    v13 = CFSTR("error");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v14 = v8;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    sub_10000D9F8(v9);
    goto LABEL_8;
  }
  v11 = __stderrp;
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
  fprintf(v11, "Failed to fetch account metadata: %s\n", (const char *)objc_msgSend(v12, "UTF8String"));

LABEL_10:
}

void sub_10000E098(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  FILE *v7;
  id v8;
  const __CFString *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v9 = CFSTR("error");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
      v10 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      sub_10000D9F8(v6);

    }
    else
    {
      v7 = __stderrp;
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
      fprintf(v7, "Failed to set machineID override: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    }
  }
  else
  {
    puts("successfully set machineID override!");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void sub_10000E1B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FILE *v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v23 = CFSTR("error");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      v24 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      sub_10000D9F8(v9);

    }
    else
    {
      v15 = __stderrp;
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
      fprintf(v15, "Failed to fetch account settings: %s\n", (const char *)objc_msgSend(v16, "UTF8String"));

    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v21[0] = CFSTR("walrus");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "walrus"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "enabled")));
      v21[1] = CFSTR("webAccess");
      v22[0] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webAccess"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "enabled")));
      v22[1] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));

      sub_10000D9F8(v14);
    }
    else
    {
      puts("successfully fetched account settings!");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "walrus"));
      if (objc_msgSend(v17, "enabled"))
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      printf("walrus enabled? %s\n", (const char *)-[__CFString UTF8String](v18, "UTF8String"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webAccess"));
      if (objc_msgSend(v19, "enabled"))
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      printf("web access enabled? %s\n", (const char *)-[__CFString UTF8String](v20, "UTF8String"));

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void sub_10000E41C(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "disabling walrus failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successfully disabled walrus");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000E4E8(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "enabling walrus failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successfully enabled walrus");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000E5B4(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "enabling web access failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successfully enabled web access");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000E680(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "disabling webAccess failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successfully disabled webAccess");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000E74C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  FILE *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    fprintf(v7, "createInheritanceKeyWithClaimTokenAndWrappingKey failed: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v9 > 0.0 && objc_msgSend(v6, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v6, "retryInterval");
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionary"));
    v12 = v11;
    if (*(_BYTE *)(a1 + 56))
      sub_10000D9F8(v11);
    else
      sub_10000E858("Created inheritance key with claim+wrappingkey", v11);

  }
}

void sub_10000E858(const char *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a2;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid"))));
  printf("%s %s\n", a1, (const char *)objc_msgSend(v4, "UTF8String"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("uuid")) & 1) == 0)
        {
          v11 = objc_retainAutorelease(v10);
          v12 = (const char *)objc_msgSend(v11, "UTF8String");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11)));
          printf("\t%s: %s\n", v12, (const char *)objc_msgSend(v13, "UTF8String"));

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void sub_10000E9E8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  FILE *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    fprintf(v7, "recreateInheritanceKey failed: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v9 > 0.0 && objc_msgSend(v6, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v6, "retryInterval");
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionary"));
    v12 = v11;
    if (*(_BYTE *)(a1 + 56))
      sub_10000D9F8(v11);
    else
      sub_10000E858("Recreated inheritance key", v11);

  }
}

void sub_10000EAF4(uint64_t a1, int a2, void *a3)
{
  id v5;
  FILE *v6;
  id v7;
  void *v8;
  double v9;
  unsigned int v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v14 = v5;
  if (!v5)
  {
    v12 = "does not exist";
    if (a2)
      v12 = "exists";
    printf("successful check of inheritance key: %s\n", v12);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (a2)
      *(_DWORD *)(v13 + 24) = 0;
    else
      *(_DWORD *)(v13 + 24) = 1;
    goto LABEL_10;
  }
  v6 = __stderrp;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
  fprintf(v6, "checking inheritance key failed: %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v8 = v14;
  if (v9 > 0.0)
  {
    v10 = objc_msgSend(v14, "isRetryable");
    v8 = v14;
    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v14, "retryInterval");
      sleep(v11);
LABEL_10:
      v8 = v14;
    }
  }

}

void sub_10000EBF8(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "remove inheritance key failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successful removal of inheritance key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000ECC4(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "preflight joinWithInheritanceKey failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successful preflight join from inheritance key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000ED90(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "joinWithInheritanceKey failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successful join from inheritance key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000EE5C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("storeInheritanceKey failed: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v5 > 0.0 && objc_msgSend(v7, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v7, "retryInterval");
      sleep(v6);
    }
  }
  else
  {
    puts("successful store of inheritance key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000EF10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    printf("generateInheritanceKey failed: %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v8 > 0.0 && objc_msgSend(v6, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v6, "retryInterval");
      sleep(v9);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dictionary"));
    v11 = v10;
    if (*(_BYTE *)(a1 + 56))
      sub_10000D9F8(v10);
    else
      sub_10000E858("Generated inheritance key", v10);

  }
}

void sub_10000F00C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  FILE *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    fprintf(v7, "createInheritanceKey failed: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v9 > 0.0 && objc_msgSend(v6, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v6, "retryInterval");
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionary"));
    v12 = v11;
    if (*(_BYTE *)(a1 + 56))
      sub_10000D9F8(v11);
    else
      sub_10000E858("Created inheritance key", v11);

  }
}

void sub_10000F118(uint64_t a1, int a2, void *a3)
{
  FILE *v3;
  const char *v6;
  const char *v7;
  id v8;

  if (a3)
  {
    v3 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description")));
    fprintf(v3, "preflight join with recovery key failed: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

  }
  else
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    v7 = "failure";
    if (a2)
      v7 = "success";
    printf("preflight joined using recovery key %s, in octagon: %s\n", v6, v7);
    if (a2)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_10000F1D4(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "joining with recovery key failed: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    printf("successfully joined using recovery key %s, in octagon\n", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_10000F270(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "set recovery key failed: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    printf("successfully registered recovery key %s, in octagon\n", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_10000F30C(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "remove recovery key failed: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("successful removal of recovery key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000F398(uint64_t a1, int a2, void *a3)
{
  id v5;
  FILE *v6;
  id v7;
  void *v8;
  double v9;
  unsigned int v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v14 = v5;
  if (!v5)
  {
    v12 = "does not exist";
    if (a2)
      v12 = "exists";
    printf("successful check of custodian recovery key: %s\n", v12);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (a2)
      *(_DWORD *)(v13 + 24) = 0;
    else
      *(_DWORD *)(v13 + 24) = 1;
    goto LABEL_10;
  }
  v6 = __stderrp;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
  fprintf(v6, "checking custodian recovery key failed: %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v8 = v14;
  if (v9 > 0.0)
  {
    v10 = objc_msgSend(v14, "isRetryable");
    v8 = v14;
    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v14, "retryInterval");
      sleep(v11);
LABEL_10:
      v8 = v14;
    }
  }

}

void sub_10000F49C(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "remove custodian recovery key failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successful removal of custodian recovery key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000F568(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "preflightJoinWithCustodianRecoveryKey failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successful preflight join from custodian recovery key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000F634(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "joinWithCustodianRecoveryKey failed: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("successful join from custodian recovery key");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_10000F700(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  FILE *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    fprintf(v7, "createCustodianRecoveryKey failed: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v9 > 0.0 && objc_msgSend(v6, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v6, "retryInterval");
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionary"));
    v12 = v11;
    if (*(_BYTE *)(a1 + 56))
      sub_10000D9F8(v11);
    else
      sub_10000E858("Created custodian key", v11);

  }
}

intptr_t sub_10000F80C(uint64_t a1, void *a2)
{
  FILE *v3;
  id v4;

  if (a2)
  {
    v3 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v3, "Error resetting account cdp content: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("Succeeded resetting account cdp content");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000F898(uint64_t a1, int a2, void *a3)
{
  FILE *v3;
  __CFString *v5;
  id v6;

  if (a3)
  {
    v3 = __stderrp;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description")));
    fprintf(v3, "Error setting user controllable views: %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    if (a2)
      v5 = CFSTR("enabled");
    else
      v5 = CFSTR("paused");
    printf("User controllable views are currently %s.\n", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000F948(uint64_t a1, int a2, void *a3)
{
  FILE *v3;
  __CFString *v5;
  id v6;

  if (a3)
  {
    v3 = __stderrp;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description")));
    fprintf(v3, "Error setting user controllable views: %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    if (a2)
      v5 = CFSTR("enabled");
    else
      v5 = CFSTR("paused");
    printf("User controllable views are now %s.\n", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000F9F8(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "Error trigger TTR: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("Trigger TTR completed.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000FA84(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "Error refetching CKKS policy: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("CKKS refetch completed.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000FB10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  FILE *v7;
  id v8;
  const __CFString *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v9 = CFSTR("error");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
      v10 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      sub_10000D9F8(v6);

    }
    else
    {
      v7 = __stderrp;
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
      fprintf(v7, "Error simulating push: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
      sub_10000D9F8(&__NSDictionary0__struct);
    else
      puts("Simulated push sent.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void sub_10000FC3C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FILE *v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v15 = CFSTR("error");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      v16 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
      sub_10000D9F8(v9);

    }
    else
    {
      v12 = __stderrp;
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
      fprintf(v12, "Error checking health: %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

    }
  }
  else
  {
    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));
      v11 = v10;
      if (*(_BYTE *)(a1 + 40))
      {
        sub_10000D9F8(v10);
      }
      else
      {
        puts("Checking Octagon Health completed.");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
        puts((const char *)objc_msgSend(v14, "UTF8String"));

      }
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void sub_10000FDB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = secLogObjForScope("clique");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      v22 = 138412290;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData errored: %@\n", (uint8_t *)&v22, 0xCu);
    }

  }
  else
  {
    if (v12)
    {
      v22 = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData succeeded: %@, %@\n", (uint8_t *)&v22, 0x16u);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;
  v15 = v9;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v7;
  v18 = v7;

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v8;
  v21 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000FF54(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  printf("partial recovery bottleID: %s\n", -[NSString UTF8String](objc_retainAutorelease(a2), "UTF8String"));
}

void sub_10000FF88(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  printf("preferred bottleID: %s\n", -[NSString UTF8String](objc_retainAutorelease(a2), "UTF8String"));
}

intptr_t sub_10000FFBC(uint64_t a1, void *a2)
{
  FILE *v3;
  id v4;
  id v5;

  if (a2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v3 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v3, "Error recovering: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description")));
    printf("Succeeded recovering bottled peer %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100010078(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  FILE *v12;
  id v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  const __CFString *v84;
  void *v85;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      v12 = __stderrp;
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
      fprintf(v12, "Error fetching status: %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

      goto LABEL_59;
    }
    v84 = CFSTR("error");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v85 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
    sub_10000D9F8(v11);

    goto LABEL_7;
  }
  if (v7)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    if (*(_BYTE *)(a1 + 48))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTControlCLI annotateStatus:](OTControlCLI, "annotateStatus:", v7));
      sub_10000D9F8(v10);
LABEL_7:

      goto LABEL_59;
    }
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("containerName"))));
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contextID"))));
    printf("Status for %s,%s:\n", v15, (const char *)objc_msgSend(v16, "UTF8String"));

    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("activeAccount"))));
    printf("Active account: %s\n", (const char *)objc_msgSend(v17, "UTF8String"));

    putchar(10);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("state")));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description")));
    printf("State: %s\n", (const char *)objc_msgSend(v19, "UTF8String"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stateFlags")));
    v21 = objc_msgSend(v20, "count");
    if (v21)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stateFlags")));
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
      v22 = (const char *)objc_msgSend(v4, "UTF8String");
    }
    else
    {
      v22 = "none";
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statePendingFlags")));
    if (objc_msgSend(v23, "count"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statePendingFlags")));
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description")));
      printf("Flags: %s; Flags Pending: %s\n\n", v22, (const char *)objc_msgSend(v25, "UTF8String"));

    }
    else
    {
      printf("Flags: %s; Flags Pending: %s\n\n", v22, "none");
    }
    v70 = a1;

    if (v21)
    {

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contextDump")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v73 = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("peers")));
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v79 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("peerID")));
          if (v35)
          {
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, v35);
            objc_msgSend(v28, "addObject:", v35);
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
      }
      while (v31);
    }
    v72 = v7;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("custodian_recovery_keys")));
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(_QWORD *)v75 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("peerID")));
          if (v43)
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v42, v43);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      }
      while (v39);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("self")));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("peerID")));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("stableInfo")));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("dynamicInfo")));
    if (v45)
    {
      v48 = objc_msgSend(v28, "mutableCopy");
      objc_msgSend(*(id *)(v70 + 32), "printPeer:prefix:", v44, CFSTR("    Self: "));
      putchar(10);
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v44, v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("included")));
      puts("Trusted peers (by me):");
      v69 = v48;
      if (v49 && objc_msgSend(v49, "count"))
      {
        objc_msgSend(*(id *)(v70 + 32), "printPeers:egoPeerID:informationOnPeers:informationOnCRKs:", v49, v45, v27, v36);
        objc_msgSend(v48, "removeObjectsInArray:", v49);
      }
      else
      {
        puts("    No trusted peers.");
      }
      v68 = v49;
      putchar(10);
      v66 = v47;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("excluded")));
      puts("Excluded peers (by me):");
      v7 = v72;
      if (v50 && objc_msgSend(v50, "count"))
      {
        objc_msgSend(*(id *)(v70 + 32), "printPeers:egoPeerID:informationOnPeers:informationOnCRKs:", v50, v45, v27, v36);
        v51 = v69;
        objc_msgSend(v69, "removeObjectsInArray:", v50);
      }
      else
      {
        puts("    No excluded peers.");
        v51 = v69;
      }
      putchar(10);
      puts("Other peers (included/excluded by others):");
      v67 = v45;
      if (objc_msgSend(v51, "count"))
        objc_msgSend(*(id *)(v70 + 32), "printPeers:egoPeerID:informationOnPeers:informationOnCRKs:", v51, v45, v27, v36);
      else
        puts("    No other peers.");
      v52 = v68;
      putchar(10);
      v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("recovery_encryption_public_key")));
      v54 = v46;
      if (v53)
      {
        v55 = (void *)v53;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("recovery_signing_public_key")));

        if (v56)
        {
          puts("Recovery Key:");
          v57 = objc_alloc((Class)NSData);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("recovery_signing_public_key")));
          v71 = objc_msgSend(v57, "initWithData:", v58);

          v7 = v72;
          v59 = objc_alloc((Class)NSData);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("recovery_encryption_public_key")));
          v61 = objc_msgSend(v59, "initWithData:", v60);

          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "base64EncodedStringWithOptions:", 0));
          v63 = v61;
          v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "base64EncodedStringWithOptions:", 0)));
          printf("    Encryption public key: %s\n", (const char *)objc_msgSend(v64, "UTF8String"));
          v65 = objc_retainAutorelease(v62);
          printf("    Signing public key: %s\n", (const char *)objc_msgSend(v65, "UTF8String"));
          putchar(10);

          v52 = v68;
        }
      }

      v9 = 0;
      v46 = v54;
      v47 = v66;
      v45 = v67;
    }
    else
    {
      puts("No current identity for this device.\n");
      if (objc_msgSend(v28, "count"))
      {
        puts("All peers currently in this account:");
        objc_msgSend(*(id *)(v70 + 32), "printPeers:egoPeerID:informationOnPeers:informationOnCRKs:", v28, 0, v27, v36);
      }
      else
      {
        puts("No peers currently exist for this account.");
      }
      v9 = 0;
      v7 = v72;
    }
    putchar(10);

  }
  else if (*(_BYTE *)(a1 + 48))
  {
    sub_10000D9F8(&off_100021658);
  }
  else
  {
    fwrite("Fetching status had no error and gave no result!\n", 0x31uLL, 1uLL, __stderrp);
  }
LABEL_59:

}

void sub_1000109B4(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = __stderrp;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v4, "Error resetting: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v6 > 0.0 && objc_msgSend(v8, "isRetryable"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v8, "retryInterval");
      sleep(v7);
    }
  }
  else
  {
    puts("reset and establish:");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void sub_100010A80(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "Error departing clique: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("Departing clique completed.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100010B0C(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "Error signing out: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("Sign out complete.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100010B98(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "Error signing in: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("Sign in complete.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100010C24(uint64_t a1, void *a2)
{
  FILE *v2;
  id v4;

  if (a2)
  {
    v2 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    fprintf(v2, "Error starting state machine: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    puts("state machine started.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100011878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011894(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000118A4(uint64_t a1)
{

}

void sub_1000118AC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  id obj;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKRetryAfter")));

  v5 = obj;
  if (obj)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_QWORD *)(v6 + 40))
    {
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), obj);
      v5 = obj;
      goto LABEL_6;
    }
    objc_msgSend(obj, "doubleValue");
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "doubleValue");
    v5 = obj;
    if (v8 < v9)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_5;
    }
  }
LABEL_6:

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__isCKServerInternalError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isCKServerInternalError");
}

id objc_msgSend__isRetryableNSURLError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isRetryableNSURLError");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTlkSharesForVouchedIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTlkSharesForVouchedIdentity:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "altDSID");
}

id objc_msgSend_annotateStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "annotateStatus:");
}

id objc_msgSend_appleAccountSignedIn_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleAccountSignedIn:reply:");
}

id objc_msgSend_appleAccountSignedOut_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleAccountSignedOut:reply:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_authInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authInfo");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cdpInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cdpInfo");
}

id objc_msgSend_checkAndPrintEscrowRecords_error_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAndPrintEscrowRecords:error:json:");
}

id objc_msgSend_checkCustodianRecoveryKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCustodianRecoveryKey:uuid:reply:");
}

id objc_msgSend_checkCustodianRecoveryKeyWithArguments_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCustodianRecoveryKeyWithArguments:uuidString:timeout:");
}

id objc_msgSend_checkInheritanceKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInheritanceKey:uuid:reply:");
}

id objc_msgSend_checkInheritanceKeyWithArguments_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInheritanceKeyWithArguments:uuidString:timeout:");
}

id objc_msgSend_checkRecoveryKeyWithArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkRecoveryKeyWithArguments:");
}

id objc_msgSend_clearTlkSharesForVouchedIdentitys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearTlkSharesForVouchedIdentitys");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectableEscrowRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectableEscrowRecords");
}

id objc_msgSend_collectableTlkShares(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectableTlkShares");
}

id objc_msgSend_collectedEscrowRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectedEscrowRecords");
}

id objc_msgSend_collectedTlkShares(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectedTlkShares");
}

id objc_msgSend_containerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerName");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextID");
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "control");
}

id objc_msgSend_controlObject_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlObject:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCustodianRecoveryKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCustodianRecoveryKey:uuid:reply:");
}

id objc_msgSend_createCustodianRecoveryKeyWithArguments_uuidString_json_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCustodianRecoveryKeyWithArguments:uuidString:json:timeout:");
}

id objc_msgSend_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInheritanceKey:uuid:claimTokenData:wrappingKeyData:reply:");
}

id objc_msgSend_createInheritanceKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInheritanceKey:uuid:reply:");
}

id objc_msgSend_createInheritanceKeyWithArguments_uuidString_json_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInheritanceKeyWithArguments:uuidString:json:timeout:");
}

id objc_msgSend_createInheritanceKeyWithClaimTokenAndWrappingKey_uuidString_claimToken_wrappingKey_json_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInheritanceKeyWithClaimTokenAndWrappingKey:uuidString:claimToken:wrappingKey:json:timeout:");
}

id objc_msgSend_createRecoveryKey_recoveryKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRecoveryKey:recoveryKey:reply:");
}

id objc_msgSend_cuttlefishRetryAfter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cuttlefishRetryAfter");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_depart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "depart:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableWalrusWithArguments_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableWalrusWithArguments:timeout:");
}

id objc_msgSend_disableWebAccessWithArguments_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableWebAccessWithArguments:timeout:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enableWalrusWithArguments_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableWalrusWithArguments:timeout:");
}

id objc_msgSend_enableWebAccessWithArguments_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableWebAccessWithArguments:timeout:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_escrowInformationMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escrowInformationMetadata");
}

id objc_msgSend_escrowRecordGarbageCollectionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escrowRecordGarbageCollectionEnabled");
}

id objc_msgSend_escrowRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escrowRequest");
}

id objc_msgSend_fetchAccountSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAccountSettings:reply:");
}

id objc_msgSend_fetchAccountSettingsWithArguments_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAccountSettingsWithArguments:json:");
}

id objc_msgSend_fetchAccountWideSettingsDefaultWithForceFetch_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAccountWideSettingsDefaultWithForceFetch:configuration:error:");
}

id objc_msgSend_fetchAccountWideSettingsWithArguments_useDefault_forceFetch_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAccountWideSettingsWithArguments:useDefault:forceFetch:json:");
}

id objc_msgSend_fetchAccountWideSettingsWithForceFetch_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAccountWideSettingsWithForceFetch:configuration:error:");
}

id objc_msgSend_fetchAllBottles_control_overrideEscrowCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllBottles:control:overrideEscrowCache:");
}

id objc_msgSend_fetchAllEscrowRecords_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllEscrowRecords:error:");
}

id objc_msgSend_fetchAllEscrowRecords_json_overrideEscrowCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllEscrowRecords:json:overrideEscrowCache:");
}

id objc_msgSend_fetchAllViableBottles_source_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllViableBottles:source:reply:");
}

id objc_msgSend_fetchEscrowRecords_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchEscrowRecords:error:");
}

id objc_msgSend_fetchEscrowRecords_json_overrideEscrowCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchEscrowRecords:json:overrideEscrowCache:");
}

id objc_msgSend_fetchStatuses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchStatuses:");
}

id objc_msgSend_fetchUserControllableViewsSyncStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserControllableViewsSyncStatus:");
}

id objc_msgSend_fetchUserControllableViewsSyncStatus_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserControllableViewsSyncStatus:reply:");
}

id objc_msgSend_generateInheritanceKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateInheritanceKey:uuid:reply:");
}

id objc_msgSend_generateInheritanceKeyWithArguments_json_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateInheritanceKeyWithArguments:json:timeout:");
}

id objc_msgSend_getAccountMetadata_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccountMetadata:reply:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_healthCheck_skipRateLimitingCheck_repair_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "healthCheck:skipRateLimitingCheck:repair:json:");
}

id objc_msgSend_healthCheck_skipRateLimitingCheck_repair_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "healthCheck:skipRateLimitingCheck:repair:reply:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithContainerName_contextID_altDSID_flowID_deviceSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:");
}

id objc_msgSend_initWithContextData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContextData:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithEscrowRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEscrowRequest:");
}

id objc_msgSend_initWithOTControl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOTControl:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithWrappedKey_wrappingKey_uuid_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWrappedKey:wrappingKey:uuid:error:");
}

id objc_msgSend_initWithWrappedKeyData_wrappingKeyData_claimTokenData_uuid_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWrappedKeyData:wrappingKeyData:claimTokenData:uuid:error:");
}

id objc_msgSend_initWithWrappedKeyData_wrappingKeyData_uuid_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWrappedKeyData:wrappingKeyData:uuid:error:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isCuttlefishError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCuttlefishError:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isRecoveryKeySet_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecoveryKeySet:error:");
}

id objc_msgSend_isRetryable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRetryable");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithCustodianRecoveryKey:custodianRecoveryKey:reply:");
}

id objc_msgSend_joinWithCustodianRecoveryKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_joinWithInheritanceKey_inheritanceKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithInheritanceKey:inheritanceKey:reply:");
}

id objc_msgSend_joinWithInheritanceKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_joinWithRecoveryKey_recoveryKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithRecoveryKey:recoveryKey:reply:");
}

id objc_msgSend_joinWithRecoveryKeyWithArguments_recoveryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithRecoveryKeyWithArguments:recoveryKey:");
}

id objc_msgSend_leaveClique_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leaveClique:reply:");
}

id objc_msgSend_leaveTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leaveTrust");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_makeConfigurationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeConfigurationContext");
}

id objc_msgSend_moveRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveRequest");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_peerInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerInfo");
}

id objc_msgSend_peersCleanedup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peersCleanedup");
}

id objc_msgSend_performEscrowRecovery_cdpContext_escrowRecord_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performEscrowRecovery:cdpContext:escrowRecord:error:");
}

id objc_msgSend_performEscrowRecovery_recordID_appleID_secret_overrideForAccountScript_overrideEscrowCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performEscrowRecovery:recordID:appleID:secret:overrideForAccountScript:overrideEscrowCache:");
}

id objc_msgSend_performSilentEscrowRecovery_appleID_secret_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSilentEscrowRecovery:appleID:secret:");
}

id objc_msgSend_performSilentEscrowRecovery_cdpContext_allRecords_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSilentEscrowRecovery:cdpContext:allRecords:error:");
}

id objc_msgSend_postEscrowCFU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEscrowCFU");
}

id objc_msgSend_postRepairCFU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postRepairCFU");
}

id objc_msgSend_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightJoinWithCustodianRecoveryKey:custodianRecoveryKey:reply:");
}

id objc_msgSend_preflightJoinWithCustodianRecoveryKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightJoinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_preflightJoinWithInheritanceKey_inheritanceKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightJoinWithInheritanceKey:inheritanceKey:reply:");
}

id objc_msgSend_preflightJoinWithInheritanceKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightJoinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_preflightJoinWithRecoveryKeyWithArguments_recoveryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightJoinWithRecoveryKeyWithArguments:recoveryKey:");
}

id objc_msgSend_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:");
}

id objc_msgSend_printAccountMetadataWithArguments_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printAccountMetadataWithArguments:json:");
}

id objc_msgSend_printCRKWithPeer_information_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCRKWithPeer:information:prefix:");
}

id objc_msgSend_printPeer_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printPeer:prefix:");
}

id objc_msgSend_printPeers_egoPeerID_informationOnPeers_informationOnCRKs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printPeers:egoPeerID:informationOnPeers:informationOnCRKs:");
}

id objc_msgSend_recordId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordId");
}

id objc_msgSend_recoverUsingBottleID_entropy_arguments_control_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoverUsingBottleID:entropy:arguments:control:");
}

id objc_msgSend_recreateInheritanceKey_uuid_oldIK_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recreateInheritanceKey:uuid:oldIK:reply:");
}

id objc_msgSend_recreateInheritanceKeyWithArguments_uuidString_wrappingKey_wrappedKey_claimToken_json_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recreateInheritanceKeyWithArguments:uuidString:wrappingKey:wrappedKey:claimToken:json:timeout:");
}

id objc_msgSend_refetchCKKSPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refetchCKKSPolicy:");
}

id objc_msgSend_refetchCKKSPolicy_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refetchCKKSPolicy:reply:");
}

id objc_msgSend_removeCustodianRecoveryKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCustodianRecoveryKey:uuid:reply:");
}

id objc_msgSend_removeCustodianRecoveryKeyWithArguments_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCustodianRecoveryKeyWithArguments:uuidString:timeout:");
}

id objc_msgSend_removeInheritanceKey_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInheritanceKey:uuid:reply:");
}

id objc_msgSend_removeInheritanceKeyWithArguments_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInheritanceKeyWithArguments:uuidString:timeout:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeRecoveryKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeRecoveryKey:reply:");
}

id objc_msgSend_removeRecoveryKeyWithArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeRecoveryKeyWithArguments:");
}

id objc_msgSend_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request:");
}

id objc_msgSend_reroll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reroll");
}

id objc_msgSend_reroll_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reroll:reply:");
}

id objc_msgSend_rerollWithArguments_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rerollWithArguments:json:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_reset_appleID_dsid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset:appleID:dsid:");
}

id objc_msgSend_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAccountCDPContents:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:");
}

id objc_msgSend_resetAccountCDPContentsWithArguments_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAccountCDPContentsWithArguments:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:");
}

id objc_msgSend_resetAcountData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAcountData:error:");
}

id objc_msgSend_resetAllRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAllRequests:");
}

id objc_msgSend_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:");
}

id objc_msgSend_resetOctagon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetOctagon");
}

id objc_msgSend_resetOctagon_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetOctagon:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:timeout:");
}

id objc_msgSend_resetProtectedData_appleID_dsid_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetProtectedData:appleID:dsid:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:");
}

id objc_msgSend_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:");
}

id objc_msgSend_restoreFromBottle_entropy_bottleID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreFromBottle:entropy:bottleID:reply:");
}

id objc_msgSend_retryInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryInterval");
}

id objc_msgSend_setAccountSetting_setting_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountSetting:setting:reply:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAuthInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthInfo:");
}

id objc_msgSend_setAuthenticationAppleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationAppleID:");
}

id objc_msgSend_setAuthenticationAppleid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationAppleid:");
}

id objc_msgSend_setAuthenticationPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationPassword:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setCdpInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCdpInfo:");
}

id objc_msgSend_setContainerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainerName:");
}

id objc_msgSend_setContainsIcdpData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainsIcdpData:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEscrowFetchSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEscrowFetchSource:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setMachineIDOverride_machineID_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMachineIDOverride:machineID:json:");
}

id objc_msgSend_setMachineIDOverride_machineID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMachineIDOverride:machineID:reply:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOldPeerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOldPeerID:");
}

id objc_msgSend_setOverrideForSetupAccountScript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideForSetupAccountScript:");
}

id objc_msgSend_setPasswordEquivalentToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordEquivalentToken:");
}

id objc_msgSend_setPeerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerID:");
}

id objc_msgSend_setRecoveryKeyWithArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecoveryKeyWithArguments:");
}

id objc_msgSend_setRecoverySecret_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecoverySecret:");
}

id objc_msgSend_setSecureElementIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecureElementIdentity:");
}

id objc_msgSend_setSilentRecoveryAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSilentRecoveryAttempt:");
}

id objc_msgSend_setSyncingPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncingPolicy:");
}

id objc_msgSend_setUserControllableViewsSyncStatus_enabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserControllableViewsSyncStatus:enabled:");
}

id objc_msgSend_setUserControllableViewsSyncStatus_enabled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserControllableViewsSyncStatus:enabled:reply:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setUsesMultipleIcsc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsesMultipleIcsc:");
}

id objc_msgSend_setVoucher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVoucher:");
}

id objc_msgSend_setVoucherSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVoucherSignature:");
}

id objc_msgSend_setWalrus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWalrus:");
}

id objc_msgSend_setWebAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebAccess:");
}

id objc_msgSend_signIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signIn:");
}

id objc_msgSend_signOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signOut:");
}

id objc_msgSend_simulateReceivePush_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simulateReceivePush:json:");
}

id objc_msgSend_simulateReceivePush_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simulateReceivePush:reply:");
}

id objc_msgSend_startOctagonStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOctagonStateMachine:");
}

id objc_msgSend_startOctagonStateMachine_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOctagonStateMachine:reply:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_status_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status:json:");
}

id objc_msgSend_status_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status:reply:");
}

id objc_msgSend_storeInheritanceKey_ik_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeInheritanceKey:ik:reply:");
}

id objc_msgSend_storeInheritanceKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_storePrerecordsInEscrow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storePrerecordsInEscrow");
}

id objc_msgSend_storePrerecordsInEscrow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storePrerecordsInEscrow:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_superfluousPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superfluousPeers");
}

id objc_msgSend_superfluousPeersCleanupEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superfluousPeersCleanupEnabled");
}

id objc_msgSend_tapToRadar_description_radar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapToRadar:description:radar:");
}

id objc_msgSend_tapToRadar_description_radar_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapToRadar:description:radar:reply:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_tlkRecoverability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlkRecoverability:");
}

id objc_msgSend_tlkRecoverabilityForEscrowRecord_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlkRecoverabilityForEscrowRecord:error:");
}

id objc_msgSend_tlkShareGarbageCollectionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlkShareGarbageCollectionEnabled");
}

id objc_msgSend_tlkSharesForVouchedIdentityAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlkSharesForVouchedIdentityAtIndex:");
}

id objc_msgSend_tlkSharesForVouchedIdentitysCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlkSharesForVouchedIdentitysCount");
}

id objc_msgSend_totalEscrowRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalEscrowRecords");
}

id objc_msgSend_totalPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalPeers");
}

id objc_msgSend_totalTlkShares(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalTlkShares");
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trigger");
}

id objc_msgSend_triggerEscrowUpdate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerEscrowUpdate:error:");
}

id objc_msgSend_trustedPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustedPeers");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_walrus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walrus");
}

id objc_msgSend_webAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webAccess");
}
