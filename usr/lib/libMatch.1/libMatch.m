uint64_t matchExec(uint64_t a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  __int128 v23;
  void *__dst[2];
  size_t __n[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[256];
  _QWORD v31[66];

  v31[64] = *MEMORY[0x24BDAC8D0];
  if (a3 && (*a3 - 256) < 0xFFFFFF01)
    return 4294967293;
  v9 = *(_QWORD *)(a1 + 56);
  if (!v9)
  {
    result = matchPack(a1, 0, 0);
    if ((_DWORD)result)
      return result;
    v9 = *(_QWORD *)(a1 + 56);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  __dst[1] = 0;
  *(_OWORD *)__n = 0u;
  v23 = 0u;
  __dst[0] = a2;
  if (a3)
  {
    LODWORD(__dst[1]) = *a3;
    __n[0] = 16 * LODWORD(__dst[1]);
    LOWORD(v29) = *(_WORD *)(v9 + 16);
    if (LODWORD(__dst[1]))
    {
      v10 = 0x100 / ((16 * LODWORD(__dst[1])) | 0xAuLL);
      goto LABEL_12;
    }
  }
  else
  {
    LODWORD(__dst[1]) = 0;
    __n[0] = 0;
    LOWORD(v29) = *(_WORD *)(v9 + 16);
  }
  LODWORD(v10) = 25;
LABEL_12:
  LOWORD(__n[1]) = v10;
  *(_QWORD *)&v28 = a1;
  *((_QWORD *)&v28 + 1) = *(_QWORD *)v9;
  *((_QWORD *)&v29 + 1) = *(_QWORD *)(v9 + 8);
  *(_QWORD *)&v26 = v30;
  DWORD2(v26) = 0;
  *(_QWORD *)&v27 = v31;
  DWORD2(v27) = 0;
  v11 = a2;
  if (!(_DWORD)v10)
  {
    if (!expandBuffers((uint64_t)&v23))
      return 4294967292;
    v11 = __dst[0];
  }
  v12 = a2[1];
  *(_QWORD *)&v23 = *a2;
  v13 = v23;
  *((_QWORD *)&v23 + 1) = v12;
  *v11 = 0;
  *((_QWORD *)__dst[0] + 1) = v12 - v13;
  if (LODWORD(__dst[1]) >= 2)
    memset((char *)__dst[0] + 16, 255, 16 * (LODWORD(__dst[1]) - 1));
  DWORD2(v26) = 0;
  v14 = *((_QWORD *)&v23 + 1);
  *(_DWORD *)(v26 + 6) = 0;
  if (v13 <= v14)
    __asm { BR              X9 }
  *a4 = 0;
  if (a3)
    *a3 = __dst[1];
  if (LODWORD(__dst[1]))
  {
    v15 = 0;
    v16 = (unint64_t *)__dst[0];
    v17 = v23;
    v18 = *((_QWORD *)&v23 + 1) - v23;
    v19 = LODWORD(__dst[1]);
    do
    {
      v20 = *v16;
      if (*v16 > v18 || ((v21 = v16[1], v21 <= v18) ? (v22 = v20 > v21) : (v22 = 1), v22))
      {
        *v16 = 0;
        v16[1] = 0;
      }
      else
      {
        *v16 = v17 + v20;
        v16[1] = v17 + v21;
      }
      ++v15;
      v16 += 2;
    }
    while (v15 < v19);
  }
  if ((_BYTE *)v26 != v30)
    (*(void (**)(_QWORD, _QWORD))(a1 + 16))(v26, *(_QWORD *)(a1 + 24));
  return 0;
}

uint64_t expandBuffers(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32) + 10;
  v2 = *(unsigned __int16 *)(a1 + 96);
  if (v1 > 0x3FFFFFFF / v2)
    return 0;
  result = (*(uint64_t (**)(unint64_t, _QWORD))(*(_QWORD *)(a1 + 80) + 8))(2 * v1 * v2, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 24));
  if (result)
  {
    v5 = result;
    memcpy((void *)result, *(const void **)(a1 + 48), v1 * *(unsigned int *)(a1 + 56));
    *(_QWORD *)(a1 + 48) = v5;
    v6 = (void *)(v5 + v1 * v2);
    memcpy(v6, *(const void **)(a1 + 64), v1 * *(unsigned int *)(a1 + 72));
    *(_QWORD *)(a1 + 64) = v6;
    *(_WORD *)(a1 + 40) = v2;
    return 1;
  }
  return result;
}

uint64_t addNodeToList(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, int a5)
{
  __int16 v6;
  size_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t result;
  size_t v18;

  v6 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v10 + 10;
  v12 = *a2;
  v13 = *((unsigned int *)a2 + 2);
  if ((_DWORD)v13)
  {
    v14 = (_DWORD *)(v12 + 2);
    v15 = *((unsigned int *)a2 + 2);
    while (*((unsigned __int16 *)v14 - 1) != a4 || *v14 != a5)
    {
      v14 = (_DWORD *)((char *)v14 + v11);
      if (!--v15)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    if (v13 >= *(unsigned __int16 *)(a1 + 40))
    {
      result = expandBuffers(a1);
      if (!(_DWORD)result)
        return result;
      v12 = *a2;
      v16 = *((_DWORD *)a2 + 2);
      v10 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v16 = *((_DWORD *)a2 + 2);
    }
    v18 = v12 + v11 * v13;
    *((_DWORD *)a2 + 2) = v16 + 1;
    *(_WORD *)v18 = v6;
    *(_DWORD *)(v18 + 2) = a5;
    *(_DWORD *)(v18 + 6) = *(_DWORD *)(a3 + 6);
    if (v10)
      memcpy((void *)(v18 + 10), (const void *)(a3 + 10), v10);
  }
  return 1;
}

uint64_t matchOptimize(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  _QWORD *v16;
  _DWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *v35;
  _DWORD *v36;
  size_t v37;
  _DWORD *v38;
  _DWORD *v39;
  int v40;
  _DWORD *v41;
  int *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 *v51;
  uint64_t v52;
  int v53;
  uint64_t i;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  _DWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int *v70;
  int v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  unint64_t v89;
  unint64_t v90;
  int v91;
  int v92;
  BOOL v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BYTE *v103;
  unint64_t v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  int v109;
  unsigned int v110;
  _BYTE *v111;
  uint64_t v112;
  unsigned int *v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  size_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned int *v123;
  uint64_t v124;
  _QWORD *v125;
  _DWORD *v126;
  _DWORD *v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  _DWORD *v131;
  uint64_t v132;
  unsigned int v133;
  int v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unsigned int v144;
  unint64_t j;
  int v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  _BYTE *v153;
  int v154;
  uint64_t v155;
  _DWORD *v156;
  unsigned int v157;
  int v158;
  unsigned int v159;
  int v160;
  _BYTE *v161;
  uint64_t v162;
  uint64_t v163;
  int v164;
  _DWORD *v165;
  _DWORD *v166;
  uint64_t v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v174;
  int *v175;
  char v176;
  int *__src;
  _BYTE *v178;
  _QWORD *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  _BYTE *v183;
  int v184;
  uint64_t v185;
  int *v186;
  uint64_t v187;
  int v188;
  uint64_t v189;
  _DWORD *v190;
  _DWORD *v191;
  uint64_t v192;
  _QWORD *v193;
  unsigned int v194;
  unsigned int v195;
  unsigned int v196;
  uint64_t v197;
  uint64_t v198;
  _OWORD v199[2];
  uint64_t v200;

  v200 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  v2 = a1;
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(unsigned int *)(v3 + 36);
  v5 = (int *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(16 * v4, *(_QWORD *)(a1 + 24));
  if (!v5)
    return 4294967292;
  v6 = v5;
  bzero(v5, 16 * v4);
  __src = v6;
  v7 = &v6[2 * v4];
  *(_QWORD *)(v3 + 16) = v7;
  v8 = v3 + 16;
  *(_QWORD *)(v8 + 8) = &v7[v4];
  v174 = v8;
  *(_DWORD *)(v8 + 16) = 0;
  v9 = *(_QWORD *)(v2 + 64);
  *(_DWORD *)(*(_QWORD *)(v9 + 16) + 4 * *(unsigned int *)(v9 + 8)) = 1;
  if (*(_DWORD *)(v9 + 12))
  {
    v10 = 0;
    do
      nodeModRefs(v2, v10++, 1);
    while (v10 < *(_DWORD *)(v9 + 12));
  }
  simplifyBranches(v2, v6);
  v11 = *(_QWORD *)(v2 + 64);
  v175 = &v6[*(unsigned int *)(v11 + 36)];
  v197 = *(_QWORD *)(v11 + 16);
  v12 = v6;
  v180 = v2;
  do
  {
    v181 = *(unsigned int *)(v11 + 12);
    if (!(_DWORD)v181)
      break;
    v13 = 0;
    v176 = 0;
    do
    {
      v14 = v11 + 16 * v13;
      v183 = (_BYTE *)(v14 + 40);
      if (*(_BYTE *)(v14 + 40) != 39)
        goto LABEL_39;
      v182 = v13;
      v17 = *(_DWORD **)(v14 + 48);
      v16 = (_QWORD *)(v14 + 48);
      v15 = v17;
      v18 = v17[1];
      if (!(_DWORD)v18)
        goto LABEL_38;
      v19 = 0;
      v178 = (_BYTE *)(v11 + 16 * v182 + 41);
      v179 = v16;
      v186 = v12;
      while (1)
      {
        v20 = v15[v19 + 2];
        if (*(_DWORD *)(v197 + 4 * v20) == 1)
        {
          v21 = v11 + 16 * v20;
          v23 = *(unsigned __int8 *)(v21 + 40);
          v22 = (unsigned __int8 *)(v21 + 40);
          v24 = (1 << v23) & 0x1D000000010000;
          v25 = v23 > 0x34 || v24 == 0;
          v26 = v19 + 1;
          if (!v25 && v26 < v18)
            break;
        }
LABEL_36:
        ++v19;
        v18 = v15[1];
        if (v19 >= v18)
        {
          v2 = v180;
          goto LABEL_38;
        }
      }
      v184 = v15[v19 + 2];
      v28 = 1;
LABEL_21:
      v194 = v28;
      v29 = 0;
      v188 = v26;
      v191 = v15;
      v30 = v26;
      v31 = 4 * v26 + 8;
      v32 = (char *)v15 + v31;
      while (1)
      {
        v33 = *(unsigned int *)&v32[4 * v29];
        v34 = v11;
        v35 = (unsigned __int8 *)(v11 + 16 * v33 + 40);
        if (*(_DWORD *)(v197 + 4 * v33) == 1 && !nodeCmp(v22, (unsigned __int8 *)(v11 + 16 * v33 + 40)))
        {
          v186[v194] = v33;
          v36 = v191;
          if (*v191 >= 2u)
          {
            v37 = 4 * (v191[1] - 1) + 8;
            v38 = (_DWORD *)(*(uint64_t (**)(size_t, _QWORD))(v180 + 8))(v37, *(_QWORD *)(v180 + 24));
            if (!v38)
              goto LABEL_191;
            v39 = v38;
            memcpy(v38, v191, v37);
            *v39 = 1;
            *v183 = 39;
            *v178 = 126;
            v36 = v39;
            *v179 = v39;
          }
          v28 = v194 + 1;
          LODWORD(v26) = v30 + v29;
          v40 = v36[1];
          v36[1] = v40 - 1;
          v41 = v36;
          memmove((char *)v36 + v31, &v36[(v30 + v29 + 1) + 2], 4 * (~v188 + v40 - v29));
          v15 = v41;
          v18 = v41[1];
          v11 = v34;
          if (v18 <= (v188 + v29))
            goto LABEL_34;
          goto LABEL_21;
        }
        if (nodesMightOverlap(v22, v35))
          break;
        ++v29;
        v31 += 4;
        v11 = v34;
        if (v29 + v30 >= v18)
          goto LABEL_33;
      }
      v11 = v34;
LABEL_33:
      v28 = v194;
      v15 = v191;
LABEL_34:
      if (v28 < 2)
      {
        v12 = v186;
        goto LABEL_36;
      }
      v42 = v186;
      *v186 = v184;
      v2 = v180;
      v13 = v182;
      if (v15[1] == 1)
      {
        *v183 = 49;
        *(_DWORD *)(v11 + 16 * v182 + 44) = v15[2];
        (*(void (**)(void))(v180 + 16))();
        v11 = v34;
      }
      v43 = *v22;
LABEL_44:
      if (v43 == 34)
      {
        for (i = 1; i != v28; nodeModRefCount(v180, v42[i++], -1))
          ;
        v176 = 1;
        v12 = v42;
        v11 = v34;
        goto LABEL_39;
      }
      v44 = 0;
      v12 = v42;
      v42 = v175;
      do
      {
        v175[v44] = *(_DWORD *)(v11 + 16 * v12[v44] + 44);
        if (v44)
        {
          *(_DWORD *)(v197 + 4 * v12[v44]) = 0;
          v45 = v12[v44];
          v46 = *(_QWORD *)(v180 + 64);
          v47 = v46 + 16 * v45;
          *(_BYTE *)(v47 + 40) = -1;
          *(_DWORD *)(v47 + 44) = -1;
          v48 = *(_QWORD *)(v46 + 24);
          v49 = *(unsigned int *)(v46 + 32);
          *(_DWORD *)(v46 + 32) = v49 + 1;
          *(_DWORD *)(v48 + 4 * v49) = v45;
        }
        ++v44;
      }
      while (v28 != v44);
      v50 = 0;
      v51 = (unsigned __int8 *)(v11 + 16 * *v175 + 40);
      while (1)
      {
        v52 = v175[v50];
        if (*(_DWORD *)(v197 + 4 * v52) > 1u)
          break;
        v53 = nodeCmp(v51, (unsigned __int8 *)(v11 + 16 * v52 + 40));
        v11 = v34;
        if (v53)
          break;
        if (v28 == ++v50)
        {
          v43 = *v51;
          v175 = v12;
          goto LABEL_44;
        }
      }
      v55 = *(_QWORD *)(v180 + 64);
      v56 = *(unsigned int *)(v55 + 12);
      if (v56 >= *(_DWORD *)(v55 + 36))
      {
LABEL_189:
        v97 = 0xFFFFFFFFLL;
        goto LABEL_192;
      }
      *(_DWORD *)(v55 + 12) = v56 + 1;
      *(_DWORD *)(*(_QWORD *)(v55 + 16) + 4 * v56) = 1;
      v57 = v11 + 16 * v56;
      v58 = (_BYTE *)(v57 + 40);
      v59 = v11;
      v60 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(v180 + 8))(4 * v28 + 8, *(_QWORD *)(v180 + 24));
      if (!v60)
      {
        *v58 = 34;
        *(_DWORD *)(v57 + 44) = -1;
        goto LABEL_191;
      }
      *v58 = 39;
      v61 = v59 + 40 + 16 * v56;
      *(_BYTE *)(v61 + 1) = 33;
      *(_DWORD *)(v61 + 4) = -1;
      *(_QWORD *)(v61 + 8) = v60;
      v176 = 1;
      *v60 = 1;
      v60[1] = v28;
      memcpy(v60 + 2, v175, 4 * v28);
      *(_DWORD *)(v59 + 40 + 16 * *v12 + 4) = v56;
      v2 = v180;
      v11 = v59;
LABEL_38:
      v13 = v182;
LABEL_39:
      ++v13;
    }
    while (v13 != v181);
  }
  while ((v176 & 1) != 0);
  simplifyBranches(v2, __src);
  v62 = *(_QWORD *)(v2 + 64);
  v63 = *(unsigned int *)(v62 + 12);
  memset(__src, 255, 4 * v63);
  if ((_DWORD)v63)
  {
    v64 = 0;
    v65 = v62 + 40;
    do
    {
      if (*(_BYTE *)(v65 + 16 * v64) == 39)
      {
        v66 = v65 + 16 * v64;
        *(_DWORD *)(v66 + 4) = -1;
        v67 = v66 + 4;
        v68 = *(_QWORD *)(v67 + 4);
        v69 = *(unsigned int *)(v68 + 4);
        if ((_DWORD)v69)
        {
          v70 = (unsigned int *)(v68 + 8);
          v71 = -1;
          do
          {
            v73 = *v70++;
            v72 = v73;
            if ((*(unsigned __int8 *)(v65 + 16 * v73) | 4) == 0x34 && v64 == *(_DWORD *)(v65 + 16 * v72 + 4))
            {
              if (v71 != -1)
              {
                *(_DWORD *)v67 = -1;
                break;
              }
              *(_DWORD *)v67 = v72;
              v71 = v72;
            }
            --v69;
          }
          while (v69);
        }
      }
      ++v64;
    }
    while (v64 != v63);
  }
  v74 = *(_QWORD *)(v2 + 64);
  v75 = *(unsigned int *)(v74 + 12);
  if (!(_DWORD)v75)
    goto LABEL_186;
  v76 = 0;
  v77 = 0;
  v78 = *(_QWORD *)(v74 + 16);
  v189 = *(unsigned int *)(v74 + 12);
  while (2)
  {
    v79 = v74 + 16 * v76;
    v81 = *(unsigned __int8 *)(v79 + 40);
    v80 = (unsigned __int8 *)(v79 + 40);
    if (v81 == 39)
    {
      v82 = *(_QWORD *)(v74 + 16 * v76 + 48);
      memset(v199, 0, sizeof(v199));
      v83 = *(unsigned int *)(v82 + 4);
      if ((_DWORD)v83)
      {
        v84 = 0;
        v85 = 0;
        v86 = v82 + 8;
        while (1)
        {
          v87 = *(unsigned int *)(v86 + 4 * v84);
          v88 = *(unsigned __int8 *)(v74 + 16 * v87 + 40);
          if (v88 == 16)
          {
            v89 = *(unsigned __int8 *)(v74 + 16 * v87 + 48);
            v90 = v89 >> 3;
            v91 = *((unsigned __int8 *)v199 + (v89 >> 3));
            v92 = 1 << (v89 & 7);
            if ((v92 & v91) != 0)
              goto LABEL_93;
            *((_BYTE *)v199 + v90) = v91 | v92;
          }
          else
          {
            if ((v85 & 1) != 0)
            {
              v85 = 1;
              goto LABEL_93;
            }
            v93 = v88 != 48 || *(_DWORD *)(v74 + 16 * v76 + 44) == -1;
            if (v93 || v76 != *(_DWORD *)(v74 + 16 * v87 + 44))
              goto LABEL_92;
            v85 = 1;
            v77 = *(_DWORD *)(v86 + 4 * v84);
          }
          if (v83 == ++v84)
            goto LABEL_94;
        }
      }
      LODWORD(v84) = 0;
LABEL_92:
      v85 = 0;
LABEL_93:
      if ((_DWORD)v84 == (_DWORD)v83)
      {
LABEL_94:
        v94 = v83 - (v85 & 1);
        if (v94 - 16 >= 0xFFFFFFF2)
        {
          v195 = v77;
          if ((v85 & 1) == 0)
          {
            v192 = (uint64_t)v80;
            goto LABEL_108;
          }
          if ((_DWORD)v83)
          {
            v95 = 0;
            while (1)
            {
              v96 = *(unsigned int *)(v82 + 8 + 4 * v95);
              if (*(_BYTE *)(v74 + 16 * v96 + 40) == 16
                && !isStraightLineUntilDotStar(v74 + 40, v96, (uint64_t)__src))
              {
                break;
              }
              if (v83 == ++v95)
                goto LABEL_106;
            }
          }
          else
          {
            LODWORD(v95) = 0;
          }
          if ((_DWORD)v95 == (_DWORD)v83)
          {
LABEL_106:
            v97 = 0xFFFFFFFFLL;
            nodeModRefCount(v180, v195, -1);
            v98 = *(unsigned int *)(v74 + 12);
            if (v98 >= *(_DWORD *)(v74 + 36))
              goto LABEL_192;
            *(_DWORD *)(v74 + 12) = v98 + 1;
            *(_DWORD *)(*(_QWORD *)(v74 + 16) + 4 * v98) = 1;
            *v80 = 56;
            *(_DWORD *)(v74 + 40 + 16 * v76 + 4) = v98;
            v192 = v74 + 40 + 16 * v98;
            LODWORD(v83) = *(_DWORD *)(v82 + 4);
LABEL_108:
            v99 = v180;
            v100 = 8 * v83 + 8;
            v101 = *(_QWORD *)(v180 + 24);
            v102 = (*(uint64_t (**)(uint64_t, uint64_t))(v180 + 8))(v100, v101);
            if (!v102)
              goto LABEL_191;
            v103 = (_BYTE *)v102;
            *(_DWORD *)v102 = 1;
            *(_WORD *)(v102 + 4) = 255;
            *(_BYTE *)(v102 + 6) = v94;
            if (v94 > 0xFF)
              goto LABEL_189;
            if (*(_DWORD *)(v82 + 4))
            {
              v104 = 0;
              v105 = 0;
              do
              {
                v106 = *(unsigned int *)(v82 + 8 + 4 * v104);
                v107 = v74 + 16 * v106;
                v109 = *(unsigned __int8 *)(v107 + 40);
                v108 = (_BYTE *)(v107 + 40);
                if (v109 == 16)
                {
                  v110 = *(unsigned __int8 *)(v74 + 16 * v106 + 48);
                  if (v110 < v103[4])
                    v103[4] = v110;
                  if (v110 > v103[5])
                    v103[5] = v110;
                  v111 = &v103[8 * v105];
                  v111[8] = v110;
                  v112 = v74 + 16 * v106;
                  v114 = *(_DWORD *)(v112 + 44);
                  v113 = (unsigned int *)(v112 + 44);
                  *((_DWORD *)v111 + 3) = v114;
                  ++v105;
                  LODWORD(v111) = *(_DWORD *)(v78 + 4 * v106) - 1;
                  *(_DWORD *)(v78 + 4 * v106) = (_DWORD)v111;
                  if ((_DWORD)v111)
                  {
                    nodeModRefCount(v180, *v113, 1);
                  }
                  else
                  {
                    *v108 = -1;
                    *v113 = -1;
                    v115 = *(_QWORD *)(v74 + 24);
                    v116 = *(unsigned int *)(v74 + 32);
                    *(_DWORD *)(v74 + 32) = v116 + 1;
                    *(_DWORD *)(v115 + 4 * v116) = v106;
                  }
                }
                ++v104;
              }
              while (v104 < *(unsigned int *)(v82 + 4));
              v117 = v103[6];
              v99 = v180;
            }
            else
            {
              v117 = v94;
            }
            qsort(v103 + 8, v117, 8uLL, (int (__cdecl *)(const void *, const void *))charAltEntryCmp);
            nodeModPtrRefs(v80, -1, *(uint64_t (**)(_QWORD, uint64_t))(v99 + 16), v101);
            *(_BYTE *)v192 = 18;
            *(_DWORD *)(v192 + 4) = -1;
            *(_QWORD *)(v192 + 8) = v103;
          }
          v75 = v189;
          v77 = v195;
        }
      }
    }
    if (++v76 != v75)
      continue;
    break;
  }
  v118 = *(_QWORD *)(v180 + 64);
  v198 = *(unsigned int *)(v118 + 12);
  if (!(_DWORD)v198)
    goto LABEL_186;
  v119 = 0;
  v196 = 0;
  v185 = *(_QWORD *)(v118 + 16);
  v187 = *(_QWORD *)(v180 + 64);
  v120 = v118 + 40;
  while (1)
  {
    v121 = v120 + 16 * v119;
    if (*(_BYTE *)v121 != 39)
      goto LABEL_163;
    v123 = (unsigned int *)(v121 + 4);
    v122 = *(unsigned int *)(v121 + 4);
    if ((_DWORD)v122 == -1)
      goto LABEL_163;
    v124 = v120 + 16 * v119;
    v127 = *(_DWORD **)(v124 + 8);
    v125 = (_QWORD *)(v124 + 8);
    v126 = v127;
    v128 = *(unsigned __int8 *)(v120 + 16 * v122);
    if (v128 != 48)
      break;
    if (v126[1] == 2)
    {
      v133 = v126[2];
      if (v133 == (_DWORD)v122)
        v133 = v126[3];
      v134 = *(unsigned __int8 *)(v120 + 16 * v133);
      v196 = v133;
      if ((v134 - 16) < 3 || v134 == 52)
      {
        if (isStraightLineUntilDotStar(v120, v133, (uint64_t)__src))
        {
          *(_BYTE *)v121 = 56;
          *v123 = v133;
          v135 = v180;
          goto LABEL_162;
        }
      }
      else if (v134 == 34)
      {
        nodeModPtrRefs((unsigned __int8 *)(v120 + 16 * v119), -1, *(uint64_t (**)(_QWORD, uint64_t))(v180 + 16), *(_QWORD *)(v180 + 24));
        nodeModRefCount(v180, v122, -1);
        *(_BYTE *)v121 = 49;
        *v123 = v133;
      }
    }
LABEL_163:
    if (++v119 == v198)
    {
      v148 = *(_QWORD *)(v180 + 64);
      v149 = *(unsigned int *)(v148 + 12);
      if ((_DWORD)v149)
      {
        v150 = 0;
        v151 = *(_QWORD *)(v148 + 16);
        do
        {
          v152 = v148 + 16 * v150;
          v154 = *(unsigned __int8 *)(v152 + 40);
          v153 = (_BYTE *)(v152 + 40);
          if (v154 == 16)
          {
            v155 = v148 + 40 + 16 * v150;
            v157 = *(_DWORD *)(v155 + 4);
            v156 = (_DWORD *)(v155 + 4);
            v158 = *(_BYTE *)(v148 + 40 + 16 * v157) & 0xFE;
            if (v158 == 16)
            {
              v159 = 0;
              v160 = 0;
              v161 = v153;
              while (1)
              {
                if (v158 == 16 && v159 <= 0x3E)
                {
                  *((_BYTE *)__src + v159++) = v161[8];
                }
                else
                {
                  if (v158 != 17)
                    goto LABEL_177;
                  memcpy((char *)__src + v159, (const void *)(*((_QWORD *)v161 + 1) + 8), *(unsigned int *)(*((_QWORD *)v161 + 1) + 4));
                  v159 += *(_DWORD *)(*((_QWORD *)v161 + 1) + 4);
                }
                v162 = *((unsigned int *)v161 + 1);
                if (*(_DWORD *)(v151 + 4 * v162) > 1u)
                  break;
                v163 = v148 + 16 * v162;
                v164 = *(unsigned __int8 *)(v163 + 40);
                v161 = (_BYTE *)(v163 + 40);
                v158 = v164;
                ++v160;
              }
              ++v160;
LABEL_177:
              if (v159 >= 4)
              {
                v165 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(v180 + 8))(v159 + 8, *(_QWORD *)(v180 + 24));
                if (!v165)
                  goto LABEL_191;
                v166 = v165;
                *v165 = 1;
                v165[1] = v159;
                memcpy(v165 + 2, __src, v159);
                v167 = *v156;
                v168 = v160 - 1;
                if (v160 == 1)
                {
                  LODWORD(v171) = *v156;
                }
                else
                {
                  v169 = *(_QWORD *)(v148 + 24);
                  do
                  {
                    *(_DWORD *)(v151 + 4 * v167) = 0;
                    v170 = v148 + 16 * v167;
                    v171 = *(unsigned int *)(v170 + 44);
                    *(_BYTE *)(v170 + 40) = -1;
                    *(_DWORD *)(v170 + 44) = -1;
                    v172 = *(unsigned int *)(v148 + 32);
                    *(_DWORD *)(v148 + 32) = v172 + 1;
                    *(_DWORD *)(v169 + 4 * v172) = v167;
                    v167 = v171;
                    --v168;
                  }
                  while (v168);
                }
                *v153 = 17;
                *(_QWORD *)(v148 + 16 * v150 + 48) = v166;
                *v156 = v171;
              }
            }
          }
          ++v150;
        }
        while (v150 != v149);
      }
LABEL_186:
      v97 = splitAltNodes(v180);
LABEL_192:
      v141 = v174;
      goto LABEL_193;
    }
  }
  if (v128 != 52)
    goto LABEL_163;
  v190 = v126;
  v193 = v125;
  v129 = v126[1];
  if (!(_DWORD)v129)
  {
    LODWORD(v130) = 0;
    goto LABEL_150;
  }
  v130 = 0;
  v131 = v126 + 2;
  while (2)
  {
    v132 = v131[v130];
    if ((_DWORD)v132 == (_DWORD)v122)
    {
LABEL_137:
      if (v129 == ++v130)
        goto LABEL_151;
      continue;
    }
    break;
  }
  if (!nodesMightOverlap((unsigned __int8 *)(v120 + 16 * v122), (unsigned __int8 *)(v120 + 16 * v132)))
  {
    v196 = v132;
    goto LABEL_137;
  }
  v196 = v132;
LABEL_150:
  if ((_DWORD)v130 != (_DWORD)v129)
    goto LABEL_163;
LABEL_151:
  if ((_DWORD)v129 == 2)
  {
    v136 = v193;
    *v123 = v196;
    v137 = v180;
    v138 = *(_QWORD *)(v180 + 24);
    goto LABEL_161;
  }
  v138 = *(_QWORD *)(v180 + 24);
  v139 = (*(uint64_t (**)(uint64_t, uint64_t))(v180 + 8))(4 * (v129 - 1) + 8, v138);
  if (!v139)
  {
LABEL_191:
    v97 = 4294967292;
    goto LABEL_192;
  }
  v140 = *(unsigned int *)(v187 + 12);
  v141 = v174;
  if (v140 < *(_DWORD *)(v187 + 36))
  {
    *(_DWORD *)(v187 + 12) = v140 + 1;
    *(_DWORD *)(*(_QWORD *)(v187 + 16) + 4 * v140) = 1;
    v142 = v120 + 16 * v140;
    *(_BYTE *)v142 = 39;
    *(_DWORD *)(v142 + 4) = -1;
    *(_QWORD *)(v142 + 8) = v139;
    *(_QWORD *)v139 = 1;
    v136 = v193;
    v143 = v190[1];
    if ((_DWORD)v143)
    {
      v144 = 0;
      for (j = 0; j < v143; ++j)
      {
        v146 = v190[j + 2];
        if (v146 != (_DWORD)v122)
        {
          v147 = v139 + 4 * v144++;
          *(_DWORD *)(v139 + 4) = v144;
          *(_DWORD *)(v147 + 8) = v146;
          v143 = v190[1];
        }
      }
    }
    *v123 = v140;
    *(_DWORD *)(v185 + 4 * v140) = 1;
    v137 = v180;
LABEL_161:
    nodeModPtrRefs((unsigned __int8 *)(v120 + 16 * v119), -1, *(uint64_t (**)(_QWORD, uint64_t))(v137 + 16), v138);
    *(_BYTE *)v121 = 54;
    *v136 = *(_QWORD *)(v120 + 16 * v122 + 8);
    nodeModPtrRefs((unsigned __int8 *)(v120 + 16 * v119), 1, 0, 0);
    v135 = v137;
LABEL_162:
    nodeModRefCount(v135, v122, -1);
    goto LABEL_163;
  }
  v97 = 0xFFFFFFFFLL;
LABEL_193:
  (*(void (**)(int *, _QWORD))(v180 + 16))(__src, *(_QWORD *)(v180 + 24));
  *(_QWORD *)v141 = 0;
  *(_QWORD *)(v141 + 8) = 0;
  *(_DWORD *)(v141 + 16) = 0;
  return v97;
}

uint64_t simplifyBranches(uint64_t result, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  unsigned int v18;

  v2 = *(_QWORD *)(result + 64);
  v3 = *(_DWORD *)(v2 + 12);
  if (v3)
  {
    v5 = result;
    v6 = v3 - 1;
    v7 = 16 * (v3 - 1);
    v8 = 40;
    do
    {
      v9 = v2 + v7;
      v10 = *(unsigned __int8 *)(v2 + v7 + 40);
      if ((v10 - 38) >= 2)
      {
        if (v10 == 49)
        {
LABEL_7:
          v18 = 0;
          recurseThroughBranches(v5, a2, &v18, v6, 1);
          v11 = v18;
          if (v18 == 1)
          {
            v12 = *a2;
            v13 = *(_QWORD *)(v5 + 64);
            v14 = (unsigned __int8 *)(v13 + v7 + v8);
            *(_OWORD *)v14 = *(_OWORD *)(v13 + 16 * v12 + 40);
            nodeModPtrRefs(v14, 1, 0, 0);
            nodeModRefs(v5, v6, 1);
            result = nodeModRefCount(v5, v12, -1);
          }
          else
          {
            *(_BYTE *)(v9 + 40) = 39;
            v15 = v2 + v7;
            *(_BYTE *)(v15 + 41) = 126;
            *(_DWORD *)(v15 + 44) = -1;
            v16 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(v5 + 8))(4 * v11 + 8, *(_QWORD *)(v5 + 24));
            *v16 = 1;
            v17 = v18;
            v16[1] = v18;
            result = (uint64_t)memcpy(v16 + 2, a2, 4 * v17);
            *(_QWORD *)(v15 + 48) = v16;
          }
        }
      }
      else if (*(_BYTE *)(v9 + 41) != 126)
      {
        goto LABEL_7;
      }
      v2 -= 16;
      --v6;
      v8 -= 16;
    }
    while (v6 != -1);
  }
  return result;
}

uint64_t splitAltNodes(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  uint64_t v22;
  unsigned __int8 *v23;

  v1 = *(_QWORD *)(a1 + 64);
  v2 = *(unsigned int *)(v1 + 12);
  if (!(_DWORD)v2)
    return 0;
  v4 = 0;
  while (1)
  {
    v5 = v1 + 16 * v4;
    v23 = (unsigned __int8 *)(v5 + 40);
    if (*(_BYTE *)(v5 + 40) == 39)
    {
      v8 = *(_QWORD *)(v5 + 48);
      v6 = (uint64_t *)(v5 + 48);
      v7 = v8;
      v9 = (_DWORD *)(v8 + 4);
      if (*(_DWORD *)(v8 + 4) >= 0x10u)
        break;
    }
LABEL_11:
    if (++v4 >= v2)
      return 0;
  }
  v22 = v4;
  while (1)
  {
    v10 = *(unsigned int *)(v1 + 12);
    if (v10 >= *(_DWORD *)(v1 + 36))
      return 0xFFFFFFFFLL;
    *(_DWORD *)(v1 + 12) = v10 + 1;
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 4 * v10) = 1;
    v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8);
    v12 = *(_QWORD *)(a1 + 24);
    v13 = v11(68, v12);
    if (!v13)
      return 4294967292;
    v14 = v13;
    v15 = (_DWORD *)v11(4 * (*v9 - 14) + 8, v12);
    if (!v15)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 16))(v14, v12);
      return 4294967292;
    }
    v16 = v15;
    *(_QWORD *)v14 = 0xF00000001;
    v17 = *(_OWORD *)(v7 + 8);
    v18 = *(_OWORD *)(v7 + 24);
    v19 = *(_OWORD *)(v7 + 40);
    *(_QWORD *)(v14 + 56) = *(_QWORD *)(v7 + 56);
    *(_OWORD *)(v14 + 40) = v19;
    *(_OWORD *)(v14 + 24) = v18;
    *(_OWORD *)(v14 + 8) = v17;
    *(_DWORD *)(v14 + 64) = v10;
    v20 = *v9 - 14;
    *v15 = 1;
    v15[1] = v20;
    memcpy(v15 + 2, (const void *)(v7 + 64), 4 * (*v9 - 14));
    *(_BYTE *)(v1 + 16 * v10 + 40) = 39;
    *(_QWORD *)(v1 + 16 * v10 + 48) = v16;
    nodeModPtrRefs(v23, -1, *(uint64_t (**)(_QWORD, uint64_t))(a1 + 16), v12);
    *v6 = v14;
    v9 = (_DWORD *)(v14 + 4);
    v7 = v14;
    if (*(_DWORD *)(v14 + 4) <= 0xFu)
    {
      v2 = *(unsigned int *)(v1 + 12);
      v4 = v22;
      goto LABEL_11;
    }
  }
}

uint64_t nodeModRefs(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;

  v4 = result;
  v5 = *(_QWORD *)(result + 64);
  v6 = a2;
  v7 = v5 + 16 * a2;
  v10 = *(unsigned __int8 *)(v7 + 40);
  v9 = (unsigned __int8 *)(v7 + 40);
  v8 = v10;
  v11 = (1 << v10) & 0x8400040000;
  v12 = v10 > 0x27 || v11 == 0;
  if (v12 && v8 != 255)
  {
    result = nodeModRefCount(result, *(_DWORD *)(v5 + 16 * a2 + 44), a3);
    v8 = *v9;
  }
  switch(v8)
  {
    case 0x12u:
      v13 = *(_QWORD *)(v5 + 16 * v6 + 48);
      if (*(_BYTE *)(v13 + 6))
      {
        v14 = 0;
        v15 = (unsigned int *)(v13 + 12);
        do
        {
          v16 = *v15;
          v15 += 2;
          result = nodeModRefCount(v4, v16, a3);
          ++v14;
        }
        while (v14 < *(unsigned __int8 *)(v13 + 6));
      }
      break;
    case 0x27u:
      v17 = *(_QWORD *)(v5 + 16 * v6 + 48);
      if (*(_DWORD *)(v17 + 4))
      {
        v18 = 0;
        do
          result = nodeModRefCount(v4, *(_DWORD *)(v17 + 8 + 4 * v18++), a3);
        while (v18 < *(unsigned int *)(v17 + 4));
      }
      break;
    case 0x26u:
      return nodeModRefCount(v4, *(_DWORD *)(v5 + 16 * v6 + 48), a3);
  }
  return result;
}

uint64_t nodeModRefCount(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(result + 64);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_DWORD *)(v4 + 4 * a2) + a3;
  *(_DWORD *)(v4 + 4 * a2) = v5;
  if (!v5)
  {
    v7 = a2;
    result = nodeModRefs();
    v8 = v3 + 16 * v7;
    *(_BYTE *)(v8 + 40) = -1;
    *(_DWORD *)(v8 + 44) = -1;
    v9 = *(_QWORD *)(v3 + 24);
    v10 = *(unsigned int *)(v3 + 32);
    *(_DWORD *)(v3 + 32) = v10 + 1;
    *(_DWORD *)(v9 + 4 * v10) = a2;
  }
  return result;
}

uint64_t recurseThroughBranches(uint64_t result, int *a2, _DWORD *a3, unsigned int a4, int a5)
{
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = *(_QWORD *)(result + 64);
  if (*(_DWORD *)(*(_QWORD *)(v8 + 16) + 4 * a4) >= 2u && a5 == 0)
    goto LABEL_12;
  v10 = a5;
  v11 = result;
  v12 = v8 + 16 * a4;
  v13 = *(unsigned __int8 *)(v12 + 40);
  switch(v13)
  {
    case '&':
      recurseThroughBranches(result, a2, a3, *(unsigned int *)(v12 + 44), 0);
      v24 = (unsigned int *)(v12 + 48);
LABEL_21:
      result = recurseThroughBranches(v11, a2, a3, *v24, 0);
LABEL_22:
      if ((v10 & 1) != 0)
        return result;
      --*(_DWORD *)(*(_QWORD *)(v8 + 16) + 4 * a4);
      v25 = *(_QWORD *)(v11 + 64);
      v26 = v25 + 16 * a4;
      *(_BYTE *)(v26 + 40) = -1;
      *(_DWORD *)(v26 + 44) = -1;
      v27 = *(_QWORD *)(v25 + 24);
      v28 = *(unsigned int *)(v25 + 32);
      *(_DWORD *)(v25 + 32) = v28 + 1;
      v23 = (unsigned int *)(v27 + 4 * v28);
      goto LABEL_24;
    case '1':
      v24 = (unsigned int *)(v8 + 16 * a4 + 44);
      goto LABEL_21;
    case '\'':
      v14 = v8 + 16 * a4;
      v17 = *(_QWORD *)(v14 + 48);
      v16 = (uint64_t *)(v14 + 48);
      v15 = v17;
      if (*(_DWORD *)(v17 + 4))
      {
        v18 = 0;
        do
        {
          result = recurseThroughBranches(v11, a2, a3, *(unsigned int *)(v15 + 4 * v18++ + 8), 0);
          v15 = *v16;
        }
        while (v18 < *(unsigned int *)(*v16 + 4));
      }
      goto LABEL_22;
  }
LABEL_12:
  if (!*a3)
  {
    v22 = 0;
LABEL_18:
    ++*a3;
    v23 = (unsigned int *)&a2[v22];
LABEL_24:
    *v23 = a4;
    return result;
  }
  v19 = *a3;
  v20 = a2;
  while (1)
  {
    v21 = *v20++;
    if (v21 == a4)
      return result;
    if (!--v19)
    {
      v22 = *a3;
      goto LABEL_18;
    }
  }
}

uint64_t nodeCmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v3;
  int v4;
  uint64_t result;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  int v13;

  if (a1 == a2)
    return 0;
  v3 = *a1;
  v4 = *a2;
  result = (v3 - v4);
  if (v3 == v4)
  {
    v6 = a1[1];
    v7 = a2[1];
    result = (v6 - v7);
    if (v6 == v7)
    {
      result = 0;
      switch(v3)
      {
        case ' ':
        case '!':
        case '0':
        case '1':
        case '2':
        case '3':
          return result;
        case '"':
        case '#':
        case '$':
          v8 = *((_DWORD *)a1 + 2);
          v9 = *((_DWORD *)a2 + 2);
          goto LABEL_8;
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
          goto LABEL_11;
        case '4':
          v10 = *((_QWORD *)a1 + 1);
          v11 = *((_QWORD *)a2 + 1);
          v12 = *(unsigned int *)(v10 + 4);
          v13 = *(_DWORD *)(v11 + 4);
          result = (v12 - v13);
          if ((_DWORD)v12 == v13)
            return memcmp((const void *)(v10 + 8), (const void *)(v11 + 8), v12);
          return result;
        default:
          if (v3 == 16)
          {
            v8 = a1[8];
            v9 = a2[8];
LABEL_8:
            result = (v8 - v9);
          }
          else
          {
LABEL_11:
            result = 1;
          }
          break;
      }
    }
  }
  return result;
}

BOOL nodesMightOverlap(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  _BOOL8 result;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned __int8 v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  unsigned __int8 v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  unsigned int i;

  v2 = *a1;
  if (v2 != 52)
  {
    if (v2 == 16)
    {
      v3 = *a2;
      if (v3 != 52)
      {
        if (v3 == 16)
          return a1[8] == a2[8];
        return 1;
      }
      v13 = *((_QWORD *)a2 + 1);
      v14 = *(_DWORD *)(v13 + 4);
      if (v14)
      {
        v15 = a1[8];
        v16 = 2;
        v17 = v13 + 8;
        do
        {
          v18 = *(unsigned __int8 *)(v17 + v16 - 2);
          v19 = *(_BYTE *)(v17 + v16 - 1) - v18;
          v20 = v15 - v18;
          result = v20 <= v19;
          if (v16 >= v14)
            break;
          v16 += 2;
        }
        while (v20 > v19);
        return result;
      }
      return 0;
    }
    return 1;
  }
  v5 = *a2;
  if (v5 == 52)
  {
    v21 = *((_QWORD *)a1 + 1);
    v22 = *(_DWORD *)(v21 + 4);
    if (!v22)
      return 0;
    v23 = 0;
    v24 = *((_QWORD *)a2 + 1);
    v25 = v21 + 8;
    while (1)
    {
      v26 = *(_BYTE *)(v25 + v23);
      v27 = v23 | 1;
      v28 = *(_BYTE *)(v24 + v23 + 8);
      if ((v28 - v26) <= (*(_BYTE *)(v25 + v27) - v26)
        || (v26 - v28) <= (*(_BYTE *)(v24 + v27 + 8) - v28))
      {
        break;
      }
      for (i = 0; i < v22; i += 2)
        ;
      result = 0;
      v23 += 2;
      if (v23 >= v22)
        return result;
    }
    return 1;
  }
  if (v5 != 16)
    return 1;
  v6 = *((_QWORD *)a1 + 1);
  v7 = *(_DWORD *)(v6 + 4);
  if (!v7)
    return 0;
  v8 = 2;
  v9 = v6 + 8;
  do
  {
    v10 = *(unsigned __int8 *)(v9 + v8 - 2);
    v11 = *(_BYTE *)(v9 + v8 - 1) - v10;
    v12 = a2[8] - v10;
    result = v12 <= v11;
    if (v8 >= v7)
      break;
    v8 += 2;
  }
  while (v12 > v11);
  return result;
}

uint64_t isStraightLineUntilDotStar(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v3;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  BOOL v17;

  v3 = *(_DWORD *)(a3 + 4 * a2);
  if (v3 == -2)
    return 1;
  if (v3 != -1)
    return 0;
  v6 = a2;
  *(_DWORD *)(a3 + 4 * a2) = a2;
  while (1)
  {
    v7 = *(unsigned __int8 *)(a1 + 16 * v6);
    if (v7 == 18)
      break;
    if (v7 == 34)
      goto LABEL_18;
    if (v7 == 39)
    {
      v14 = *(unsigned int *)(a1 + 16 * v6 + 4);
      if ((_DWORD)v14 != -1 && *(_BYTE *)(a1 + 16 * v14) == 48 && *(_DWORD *)(*(_QWORD *)(a1 + 16 * v6 + 8) + 4) == 2)
        goto LABEL_18;
      goto LABEL_19;
    }
    v8 = *(unsigned int *)(a1 + 16 * v6 + 4);
    *(_DWORD *)(a3 + 4 * v8) = v6;
    v6 = v8;
  }
  v10 = *(_QWORD *)(a1 + 16 * v6 + 8);
  v11 = *(unsigned __int8 *)(v10 + 6);
  if (!*(_BYTE *)(v10 + 6))
  {
LABEL_18:
    v15 = -2;
    result = 1;
    goto LABEL_20;
  }
  v12 = (unsigned int *)(v10 + 12);
  while (1)
  {
    v13 = *v12;
    v12 += 2;
    if ((isStraightLineUntilDotStar(a1, v13, a3) & 1) == 0)
      break;
    if (!--v11)
      goto LABEL_18;
  }
LABEL_19:
  result = 0;
  v15 = -3;
  do
  {
LABEL_20:
    v16 = *(unsigned int *)(a3 + 4 * v6);
    *(_DWORD *)(a3 + 4 * v6) = v15;
    v17 = v16 == v6;
    v6 = v16;
  }
  while (!v17);
  return result;
}

uint64_t charAltEntryCmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 - *a2;
}

uint64_t matchValidate()
{
  return 0xFFFFFFFFLL;
}

uint64_t matchUnpack(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void (*v9)(_QWORD, _QWORD);
  uint64_t result;
  size_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(_BYTE *, uint64_t);
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  unsigned __int16 v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned __int16 v22;
  unsigned __int8 *v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  unsigned __int16 *v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unsigned __int16 *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_BYTE *, uint64_t);

  if (*(_QWORD *)(a3 + 32))
  {
    v8 = *(_QWORD *)(a3 + 56);
    if (v8)
    {
      (*(void (**)(uint64_t, _QWORD))(a3 + 16))(v8, *(_QWORD *)(a3 + 24));
      *(_QWORD *)(a3 + 56) = 0;
    }
    v9 = *(void (**)(_QWORD, _QWORD))(a3 + 48);
    if (v9)
      v9(*(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 24));
    *(_QWORD *)(a3 + 32) = 0;
    *(_QWORD *)(a3 + 48) = 0;
  }
  result = 0xFFFFFFFFLL;
  if (a2 >= 6 && *(_DWORD *)a1 == 50331648)
  {
    v11 = *(unsigned __int16 *)(a1 + 4);
    v12 = a2 - (v11 + 6);
    if (a2 >= v11 + 6 && !HIDWORD(v12) && *(_WORD *)(a1 + 4))
    {
      v14 = *(void (**)(_BYTE *, uint64_t))(a3 + 16);
      v13 = *(_QWORD *)(a3 + 24);
      v15 = (_BYTE *)(*(uint64_t (**)(_QWORD, uint64_t))(a3 + 8))(*(unsigned __int16 *)(a1 + 4), v13);
      if (v15)
      {
        v16 = v15;
        v38 = v14;
        v17 = a1 + 6;
        bzero(v15, v11);
        v18 = 0;
        while (2)
        {
          v16[v18] = 1;
          v19 = *(unsigned __int8 *)(v17 + v18);
          LOWORD(v20) = 2;
          switch(v19 & 0xF)
          {
            case 0u:
            case 4u:
            case 8u:
            case 0xAu:
            case 0xCu:
              LOWORD(v20) = 3;
              goto LABEL_20;
            case 2u:
            case 5u:
            case 6u:
            case 7u:
              goto LABEL_20;
            case 3u:
              v20 = 3 * (v19 >> 4) + 1;
              goto LABEL_20;
            case 9u:
              LOWORD(v20) = 1;
              goto LABEL_20;
            case 0xBu:
            case 0xDu:
              v20 = (v19 >> 3) | 1;
              goto LABEL_20;
            case 0xFu:
              v20 = ((v19 >> 3) & 0x1E) - 1;
LABEL_20:
              v18 += v20;
              if (v11 > v18)
                continue;
              if ((_DWORD)v11 != v18)
                goto LABEL_56;
              v21 = 0;
              v22 = 0;
              break;
            default:
              goto LABEL_56;
          }
          break;
        }
        while (2)
        {
          v23 = (unsigned __int8 *)(v17 + v22);
          v24 = *v23;
          v25 = 2;
          switch(v24 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xCuLL:
              v25 = 3;
              goto LABEL_29;
            case 2uLL:
            case 5uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_29;
            case 3uLL:
              v25 = 3 * (v24 >> 4) + 1;
              goto LABEL_29;
            case 9uLL:
              v25 = 1;
              goto LABEL_29;
            case 0xBuLL:
            case 0xDuLL:
              v25 = (v24 >> 3) | 1;
              goto LABEL_29;
            case 0xFuLL:
              v25 = ((v24 >> 3) & 0x1E) - 1;
LABEL_29:
              if (v25 > (int)v11 - v21)
                goto LABEL_56;
              break;
            default:
              goto LABEL_56;
          }
          switch(v24 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xCuLL:
              if (*(unsigned __int16 *)(v23 + 1) + (v24 >> 2) > v12)
                goto LABEL_56;
              goto LABEL_52;
            case 2uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_52;
            case 3uLL:
              if (v24 < 0x20)
                goto LABEL_56;
              v27 = v24 >> 4;
              v28 = (unsigned __int16 *)(v23 + 1);
              while (1)
              {
                v30 = *v28;
                v28 = (unsigned __int16 *)((char *)v28 + 3);
                v29 = v30;
                if (v30 >= v11 || !v16[v29])
                  goto LABEL_56;
                if (!--v27)
                  goto LABEL_53;
              }
            case 5uLL:
              goto LABEL_53;
            case 9uLL:
              v31 = (v24 >> 4) & 7;
              if (v31 < 4)
                goto LABEL_52;
              if (v31 != 4)
                goto LABEL_56;
              goto LABEL_53;
            case 0xAuLL:
              v26 = *(unsigned __int16 *)(v23 + 1);
              if (v26 >= v11 || !v16[v26])
                goto LABEL_56;
              goto LABEL_53;
            case 0xBuLL:
            case 0xDuLL:
              if (v24 < 0x10)
                goto LABEL_56;
              goto LABEL_52;
            case 0xFuLL:
              if (v24 < 0x20)
                goto LABEL_52;
              v32 = (unsigned __int16 *)(v23 + 1);
              v33 = (v24 >> 4) - 1;
              break;
            default:
              goto LABEL_56;
          }
          do
          {
            v35 = *v32++;
            v34 = v35;
            if (v35 >= v11 || !v16[v34])
              goto LABEL_56;
            --v33;
          }
          while (v33);
LABEL_52:
          if (v25 + v21 == (_DWORD)v11)
          {
LABEL_56:
            v38(v16, v13);
            return 0xFFFFFFFFLL;
          }
LABEL_53:
          v22 += v25;
          v21 = v22;
          if (v22 < v11)
            continue;
          break;
        }
        v38(v16, v13);
        v36 = (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 8))(24, *(_QWORD *)(a3 + 24));
        if (v36)
        {
          v37 = v36;
          result = 0;
          *(_WORD *)(v37 + 16) = v11;
          *(_QWORD *)v37 = v17;
          *(_QWORD *)(v37 + 8) = a1 + v11 + 6;
          *(_QWORD *)(a3 + 32) = a1;
          *(_QWORD *)(a3 + 40) = a2;
          *(_QWORD *)(a3 + 48) = a4;
          *(_QWORD *)(a3 + 56) = v37;
          return result;
        }
      }
      return 4294967292;
    }
  }
  return result;
}

uint64_t matchPack(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  BOOL v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  int v23;
  int v24;
  char *v25;
  char *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned __int16 i;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  int v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  size_t v46;
  char *v47;
  unsigned __int8 *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  int v52;
  char *v53;
  int v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  _DWORD *v59;
  char *v60;
  int v61;
  uint64_t v62;
  unsigned int v63;
  unsigned int v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char v68;
  uint64_t v69;
  unsigned int v70;
  int v71;
  int v72;
  char v73;
  uint64_t v74;
  _BYTE *v75;
  size_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  size_t v80;
  char *v81;
  uint64_t v82;
  int v84;
  void (*v85)(char *, _QWORD);
  uint64_t v87;
  uint64_t v88;
  __int16 v89;
  char *v90;
  char *v91;
  size_t v92;
  char *v93;
  char *v94;
  char *v95;

  v6 = (unint64_t *)(a1 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_2:
    if (a2)
      *a2 = *(_QWORD *)(a1 + 32);
    v7 = 0;
    if (a3)
      *a3 = *(_QWORD *)(a1 + 40);
    return v7;
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (!v8)
    return 4294967293;
  v9 = (char *)(unsigned __int16)*(_DWORD *)(v8 + 12);
  if (HIWORD(*(_DWORD *)(v8 + 12)))
    v10 = 1;
  else
    v10 = (_DWORD)v9 == 0;
  if (v10)
    return 0xFFFFFFFFLL;
  v11 = (char *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(8 * (_QWORD)v9, *(_QWORD *)(a1 + 24));
  if (!v11)
    return 4294967292;
  v12 = v11;
  memset(v11, 255, 4 * (_QWORD)v9);
  v13 = 0;
  v14 = 0;
  v15 = &v12[2 * (_QWORD)v9];
  v16 = &v15[2 * (_QWORD)v9];
  *(_DWORD *)v16 = *(_DWORD *)(v8 + 8);
  v95 = v12;
  v17 = (uint64_t)&v12[4 * (_QWORD)v9 - 4];
  v18 = 1;
LABEL_16:
  v19 = 4 * v18;
  while (v19)
  {
    v20 = *(unsigned int *)(v17 + v19);
    if (WORD1(v20))
      return 0xFFFFFFFFLL;
    --v18;
    v19 -= 4;
    if (*(__int16 *)&v15[2 * v20] == -1)
    {
      v21 = v9;
      while (1)
      {
        v22 = 0;
        v23 = *(unsigned __int8 *)(v8 + 16 * v20 + 40);
        v7 = 0xFFFFFFFFLL;
        if (v23 <= 0x21)
        {
          if (v23 == 16)
          {
            v27 = 2;
          }
          else
          {
            if (v23 != 17)
            {
              v25 = 0;
              v26 = 0;
              if (v23 != 18)
                goto LABEL_139;
              v37 = 3 * *(unsigned __int8 *)(*(_QWORD *)(v8 + 16 * v20 + 48) + 6);
              *(_WORD *)&v15[2 * v20] = v14;
              v14 += v37 + 1;
              v9 = v21;
              v38 = *(_QWORD *)(v8 + 16 * v20 + 48);
              v39 = *(unsigned __int8 *)(v38 + 6);
              if (*(_BYTE *)(v38 + 6))
              {
                v40 = (int *)(v38 + 12);
                do
                {
                  v42 = *v40;
                  v40 += 2;
                  v41 = v42;
                  if (*(__int16 *)&v15[2 * v42] == -1)
                    *(_DWORD *)&v16[4 * v18++] = v41;
                  --v39;
                }
                while (v39);
              }
              goto LABEL_16;
            }
            v13 += *(unsigned int *)(*(_QWORD *)(v8 + 16 * v20 + 48) + 4);
            v27 = 3;
          }
          *(_WORD *)&v15[2 * v20] = v14;
          v14 += v27;
LABEL_50:
          v29 = *(unsigned int *)(v8 + 16 * v20 + 44);
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          switch(*(_BYTE *)(v8 + 16 * v20 + 40))
          {
            case '"':
            case '#':
            case '$':
              v24 = 2;
              goto LABEL_30;
            case '%':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
            case '.':
            case '/':
            case '5':
            case '7':
              goto LABEL_139;
            case '&':
              *(_WORD *)&v15[2 * v20] = v14;
              v14 += 3;
              goto LABEL_38;
            case '\'':
              v31 = *(_DWORD *)(*(_QWORD *)(v8 + 16 * v20 + 48) + 4);
              if (!v31)
              {
                v22 = 0;
                v25 = 0;
                v26 = 0;
LABEL_146:
                v7 = 0xFFFFFFFFLL;
                goto LABEL_139;
              }
              *(_WORD *)&v15[2 * v20] = v14;
              v14 = v14 + 2 * v31 - 1;
LABEL_42:
              v32 = *(_QWORD *)(v8 + 16 * v20 + 48);
              v33 = *(_DWORD *)(v32 + 4);
              v29 = *(unsigned int *)(v32 + 8);
              if (v33 >= 2)
              {
                for (i = 1; i < v33; ++i)
                {
                  v35 = *(unsigned int *)(v32 + 4 * i + 8);
                  if (*(__int16 *)&v15[2 * v35] == -1)
                  {
                    *(_DWORD *)&v16[4 * v18++] = v35;
                    v33 = *(_DWORD *)(v32 + 4);
                  }
                }
              }
              break;
            case '0':
            case '2':
            case '3':
            case '8':
              v24 = 1;
              goto LABEL_30;
            case '1':
              goto LABEL_30;
            case '4':
            case '6':
              v24 = *(_DWORD *)(*(_QWORD *)(v8 + 16 * v20 + 48) + 4) + 1;
              goto LABEL_30;
            default:
              v25 = 0;
              v26 = 0;
              if (v23 != 255)
                goto LABEL_139;
LABEL_30:
              *(_WORD *)&v15[2 * v20] = v14;
              v14 += v24;
              if (v23 > 38)
              {
                if (v23 == 39)
                  goto LABEL_42;
                if (v23 == 255)
                  goto LABEL_55;
              }
              else
              {
                if (v23 == 38)
                {
LABEL_38:
                  v28 = v8 + 16 * v20;
                  v29 = *(unsigned int *)(v28 + 44);
                  v30 = *(unsigned int *)(v28 + 48);
                  if (*(__int16 *)&v15[2 * v30] == -1)
                    *(_DWORD *)&v16[4 * v18++] = v30;
                  break;
                }
                if (v23 == 34)
                  goto LABEL_55;
              }
              goto LABEL_50;
          }
        }
        v36 = *(unsigned __int16 *)&v15[2 * v29];
        if (v36 != 0xFFFF)
        {
          *(_WORD *)&v95[2 * v20] = v36;
          v14 += 3;
LABEL_55:
          v9 = v21;
          goto LABEL_16;
        }
        v7 = 0xFFFFFFFFLL;
        v20 = v29;
        if (v29 >> 16)
          return v7;
      }
    }
  }
  v43 = v13 + (unsigned __int16)v14 + 6;
  v44 = v13;
  v26 = (char *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(v43, *(_QWORD *)(a1 + 24));
  v94 = v26;
  if (!v26)
  {
    v22 = 0;
    v25 = 0;
    v7 = 4294967292;
    goto LABEL_139;
  }
  if (v44 > 0x10000)
  {
    v22 = 0;
    v26 = 0;
    v7 = 4294967292;
    v25 = v94;
    goto LABEL_139;
  }
  v87 = v43;
  v88 = (unsigned __int16)v14;
  v26 = (char *)(*(uint64_t (**)(unint64_t, _QWORD))(a1 + 8))(v44, *(_QWORD *)(a1 + 24));
  v45 = 0;
  v46 = 0;
  v25 = v94;
  *(_DWORD *)v94 = 50331648;
  *((_WORD *)v94 + 2) = v14;
  v47 = v94 + 6;
  v48 = (unsigned __int8 *)(v8 + 40);
  v49 = v94 + 65541;
  v89 = v14;
  v21 = &jpt_228FB7988;
  v13 = 10;
  v50 = v95;
  v93 = v94 + 6;
  v90 = v9;
  v91 = v26;
  do
  {
    v51 = *(unsigned __int16 *)&v15[2 * (_QWORD)v45];
    v52 = *v48;
    if (v51 == 0xFFFF)
    {
      v53 = v49;
      if (v52 != 255)
        goto LABEL_130;
    }
    else
    {
      v53 = &v47[v51];
      if (*v48 > 0x21u)
      {
        v54 = v52 - 34;
        v55 = 6;
        switch(v54)
        {
          case 0:
            v55 = 5;
            goto LABEL_86;
          case 1:
            goto LABEL_86;
          case 2:
            v55 = 7;
            goto LABEL_86;
          case 14:
          case 16:
          case 17:
          case 22:
            v55 = 9;
            goto LABEL_86;
          case 15:
            goto LABEL_128;
          case 18:
            v55 = 11;
            goto LABEL_86;
          case 20:
            v55 = 13;
            goto LABEL_86;
          default:
            goto LABEL_79;
        }
      }
      switch(v52)
      {
        case 16:
          v55 = 2;
          break;
        case 17:
          v55 = 0;
          break;
        case 18:
          v55 = 3;
          break;
        default:
LABEL_79:
          v55 = 15;
          break;
      }
LABEL_86:
      *v53 = v55;
      v56 = *v48;
      if (v56 <= 0x21)
      {
        switch(v56)
        {
          case 0x10u:
            v53[1] = v48[8];
            break;
          case 0x11u:
            v74 = *((_QWORD *)v48 + 1);
            v92 = v46;
            v75 = memmem(v26, v46, (const void *)(v74 + 8), *(unsigned int *)(v74 + 4));
            if (v75)
            {
              v76 = v92;
              v77 = v75 - v91;
              v26 = v91;
            }
            else
            {
              memcpy(&v91[v92], (const void *)(v74 + 8), *(unsigned int *)(v74 + 4));
              v26 = v91;
              v77 = v92;
              v76 = v92 + *(unsigned int *)(v74 + 4);
            }
            v7 = 0xFFFFFFFFLL;
            v50 = v95;
            v47 = v94 + 6;
            v49 = v94 + 65541;
            v13 = 10;
            if (v77 > 0xFFFFFFFFLL)
            {
              v22 = 0;
              goto LABEL_139;
            }
            *(_WORD *)(v53 + 1) = v77;
            *v53 = *v53 & 3 | (4 * *(_BYTE *)(*((_QWORD *)v48 + 1) + 4));
            v46 = v76;
            v9 = v90;
            break;
          case 0x12u:
            v57 = *((_QWORD *)v48 + 1);
            *v53 = v55 | (16 * *(_BYTE *)(v57 + 6));
            if (*(_BYTE *)(v57 + 6))
            {
              v58 = 0;
              v59 = (_DWORD *)(v57 + 12);
              v60 = &v94[v51 + 9];
              do
              {
                *v60 = *((_BYTE *)v59 - 4);
                v61 = *v59;
                v59 += 2;
                *((_WORD *)v60 - 1) = *(_WORD *)&v15[2 * v61];
                ++v58;
                v60 += 3;
              }
              while (v58 < *(unsigned __int8 *)(v57 + 6));
            }
            break;
        }
      }
      else
      {
        switch(*v48)
        {
          case '"':
          case '#':
          case '$':
            *(_WORD *)v53 = *(_WORD *)v53 & 0xF | (16 * *((_WORD *)v48 + 4));
            break;
          case '&':
            *v53 = v55 | 0x20;
            *(_WORD *)(v53 + 1) = *(_WORD *)&v15[2 * *((unsigned int *)v48 + 2)];
            break;
          case '\'':
            v69 = *((_QWORD *)v48 + 1);
            *v53 = v55 | (16 * *(_BYTE *)(v69 + 4));
            v70 = *(_DWORD *)(v69 + 4);
            if (v70 >= 2)
            {
              v71 = 1;
              v72 = 1;
              do
              {
                *(_WORD *)&v53[2 * v71 - 2 + 1] = *(_WORD *)&v15[2
                                                               * *(unsigned int *)(v69
                                                                                 + 4 * (unsigned __int16)v72++
                                                                                 + 8)];
                v71 = (unsigned __int16)v72;
              }
              while (v70 > (unsigned __int16)v72);
            }
            break;
          case '0':
            *v53 = v55;
            break;
          case '2':
            v73 = v55 | 0x10;
            goto LABEL_113;
          case '3':
            v73 = v55 | 0x20;
            goto LABEL_113;
          case '4':
          case '6':
            v62 = *((_QWORD *)v48 + 1);
            v63 = *(_DWORD *)(v62 + 4);
            if (v63 > 0x1FF)
            {
              v22 = 0;
              goto LABEL_146;
            }
            v64 = v63 >> 1;
            *v53 = v55 & 0xF | (16 * ((v63 >> 1) & 0xF));
            if (v63 >= 2)
            {
              if (v64 <= 1)
                v65 = 1;
              else
                v65 = v64;
              v66 = (char *)(v62 + 9);
              v67 = &v94[v51 + 8];
              do
              {
                *(v67 - 1) = *(v66 - 1);
                v68 = *v66;
                v66 += 2;
                *v67 = v68;
                v67 += 2;
                --v65;
              }
              while (v65);
            }
            break;
          case '8':
            v73 = v55 | 0x30;
LABEL_113:
            *v53 = v73;
            break;
          default:
            break;
        }
      }
      v78 = *v53;
      LODWORD(v79) = 2;
      switch(v78 & 0xF)
      {
        case 0uLL:
        case 4uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xCuLL:
          LODWORD(v79) = 3;
          break;
        case 2uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 3uLL:
          v79 = 3 * (v78 >> 4) + 1;
          break;
        case 9uLL:
          LODWORD(v79) = 1;
          break;
        case 0xBuLL:
        case 0xDuLL:
          LODWORD(v79) = (v78 >> 3) | 1;
          break;
        case 0xFuLL:
          LODWORD(v79) = ((v78 >> 3) & 0x1E) - 1;
          break;
        default:
          LODWORD(v79) = 0;
          break;
      }
      v53 += v79;
    }
LABEL_128:
    if (*(__int16 *)&v50[2 * (_QWORD)v45] != -1)
    {
      *v53 = 10;
      *(_WORD *)(v53 + 1) = *(_WORD *)&v50[2 * (_QWORD)v45];
    }
LABEL_130:
    ++v45;
    v48 += 16;
  }
  while (v45 != v9);
  v80 = v46;
  v81 = v26;
  v82 = (*(uint64_t (**)(uint64_t, _QWORD, char *, uint64_t))(a1 + 8))(24, *(_QWORD *)(a1 + 24), v21, 10);
  v22 = v82;
  if (v82)
  {
    *(_WORD *)(v82 + 16) = v89;
    *(_QWORD *)v82 = v93;
    *(_QWORD *)(v82 + 8) = &v93[v88];
    memcpy(&v93[v88], v81, v80);
    while (!__ldaxr(v6))
    {
      if (!__stlxr(v22, v6))
      {
        v84 = 0;
        v7 = 0;
        *(_QWORD *)(a1 + 32) = v94;
        *(_QWORD *)(a1 + 40) = v87;
        v85 = *(void (**)(char *, _QWORD))(a1 + 16);
        *(_QWORD *)(a1 + 48) = v85;
        v85(v95, *(_QWORD *)(a1 + 24));
        goto LABEL_140;
      }
    }
    v7 = 0;
    __clrex();
  }
  else
  {
    v7 = 4294967292;
  }
  v26 = v81;
LABEL_139:
  v81 = v26;
  (*(void (**)(unint64_t, _QWORD, char *, uint64_t))(a1 + 16))(v22, *(_QWORD *)(a1 + 24), v21, v13);
  v84 = 1;
  (*(void (**)(char *, _QWORD))(a1 + 16))(v95, *(_QWORD *)(a1 + 24));
LABEL_140:
  (*(void (**)(char *, _QWORD))(a1 + 16))(v81, *(_QWORD *)(a1 + 24));
  if (v84)
    (*(void (**)(char *, _QWORD))(a1 + 16))(v25, *(_QWORD *)(a1 + 24));
  if (!(_DWORD)v7)
    goto LABEL_2;
  return v7;
}

uint64_t matchDiagram(int a1, _QWORD *a2, const char *a3)
{
  FILE *v6;
  int v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  const char *v13;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  unsigned int v22;
  const char *v23;
  size_t v24;
  int v25;
  unsigned __int8 **v26;
  unsigned __int8 *v27;
  unint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unsigned __int8 *v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  uint64_t v47;
  unint64_t v48;
  int *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  unint64_t v53;
  int v55;
  int v56;

  v6 = fdopen(a1, "w");
  v7 = dup(a1);
  if (a2[8] || a2[4])
  {
    v55 = v7;
    fwrite("digraph nfa {\n\t/*nodesep=.15;*/\n\trankdir=LR;\n", 0x2DuLL, 1uLL, v6);
    fprintf(v6, "\tlabel = \"%s\";\n", a3);
    v56 = a1;
    if (a2[4])
    {
      fwrite("\tnstart [shape=Msquare, label=\"S\"];\n", 0x24uLL, 1uLL, v6);
      v8 = a2[7];
      if (*(_WORD *)(v8 + 16))
      {
        v9 = *(_BYTE **)v8;
        v10 = *(_QWORD *)v8 + *(unsigned __int16 *)(v8 + 16);
        v11 = *(_BYTE **)v8;
        while (2)
        {
          if ((*v11 & 0x7F) != 0x49)
          {
            fprintf(v6, "\tn%d [shape=", (_DWORD)v11 - (_DWORD)v9);
            v12 = *v11;
            switch(v12 & 0xF)
            {
              case 0u:
              case 4u:
              case 8u:
              case 0xCu:
                fprintf(v6, "circle, label=\"%.*s");
                break;
              case 2u:
                fprintf(v6, "circle, label=\"%c");
                break;
              case 5u:
                fprintf(v6, "Msquare, label=\"E%d");
                break;
              case 6u:
                fprintf(v6, "Mcircle, label=\"%d)");
                break;
              case 7u:
                fprintf(v6, "Mcircle, label=\"(%d");
                break;
              case 9u:
                switch((v12 >> 4) & 7)
                {
                  case 0u:
                    v13 = "Mcircle, label=\".";
                    goto LABEL_24;
                  case 1u:
                    v13 = "Mcircle, label=\"^";
                    goto LABEL_24;
                  case 2u:
                    v13 = "Mcircle, label=\"$";
LABEL_24:
                    v14 = 17;
                    goto LABEL_25;
                  case 3u:
                    v13 = "Mcircle, label=\".*";
                    goto LABEL_18;
                  default:
                    goto LABEL_26;
                }
              case 0xAu:
                fprintf(v6, "Mcircle, label=\"%c");
                break;
              case 0xBu:
                v13 = "Mcircle, label=\"[]";
LABEL_18:
                v14 = 18;
                goto LABEL_25;
              case 0xDu:
                v13 = "Mcircle, label=\"[]*";
                v14 = 19;
LABEL_25:
                fwrite(v13, v14, 1uLL, v6);
                break;
              case 0xFu:
                fprintf(v6, "Mcircle, headport=n, label=\"%c");
                break;
              default:
                fprintf(v6, "hexagon, label=\"%d");
                break;
            }
LABEL_26:
            if ((*v11 & 0xF) == 5)
              fprintf(v6, "\"]; /* n=%p, type=%d, end */\n");
            else
              fprintf(v6, "\"]; /* n=%p, type=%d */\n");
          }
          v15 = *v11;
          LODWORD(v16) = 2;
          switch(v15 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xCuLL:
              LODWORD(v16) = 3;
              goto LABEL_35;
            case 2uLL:
            case 5uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_35;
            case 3uLL:
              v16 = 3 * (v15 >> 4) + 1;
              goto LABEL_35;
            case 9uLL:
              LODWORD(v16) = 1;
              goto LABEL_35;
            case 0xBuLL:
            case 0xDuLL:
              LODWORD(v16) = (v15 >> 3) | 1;
              goto LABEL_35;
            case 0xFuLL:
              LODWORD(v16) = ((v15 >> 3) & 0x1E) - 1;
LABEL_35:
              v11 += v16;
              if ((unint64_t)v11 >= v10)
                goto LABEL_72;
              continue;
            default:
              goto LABEL_72;
          }
        }
      }
      goto LABEL_72;
    }
    v17 = a2[8];
    fwrite("\tnstart [shape=Msquare, label=\"S\"];\n", 0x24uLL, 1uLL, v6);
    v18 = *(unsigned int *)(v17 + 12);
    if (v17 + 40 + 16 * v18 - 16 < (unint64_t)(v17 + 40))
    {
LABEL_72:
      fputc(10, v6);
      if (a2[4])
      {
        fprintf(v6, "\tnstart -> n%d:w;\n", 0);
        v26 = (unsigned __int8 **)a2[7];
        if (*((_WORD *)v26 + 8))
        {
          v27 = *v26;
          v28 = (unint64_t)&(*v26)[*((unsigned __int16 *)v26 + 8)];
          v29 = *v26;
          while (2)
          {
            v30 = *v29;
            switch(v30 & 0xF)
            {
              case 3u:
                if (v30 >= 0x10)
                {
                  v31 = 0;
                  v32 = (char *)(v29 + 3);
                  do
                  {
                    fprintf(v6, "\tn%d -> n%d [label=\"%c\"];\n",
                      (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                      *((unsigned __int16 *)v32 - 1),
                      *v32);
                    ++v31;
                    v32 += 3;
                  }
                  while (v31 < (unint64_t)*v29 >> 4);
                }
                goto LABEL_89;
              case 5u:
                goto LABEL_89;
              case 9u:
                if ((v30 & 0x70) == 0x30)
                  fprintf(v6, "\tn%d:e -> n%d:w;\n",
                    (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                    (unsigned __int16)((_WORD)v29 - (_WORD)v27));
                goto LABEL_88;
              case 0xDu:
                fprintf(v6, "\tn%d:e -> n%d:w;\n");
                goto LABEL_89;
              case 0xFu:
                fprintf(v6, "\tn%d -> n%d:w;\n",
                  (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                  (unsigned __int16)((_WORD)v29 - (_WORD)v27 + ((v30 >> 3) & 0x1E) - 1));
                if (*v29 >= 0x20u)
                {
                  v33 = 0;
                  do
                  {
                    fprintf(v6, "\tn%d -> n%d:w [arrowhead=odot];\n",
                      (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                      *(unsigned __int16 *)&v29[2 * v33 + 1]);
                    v34 = v33 + 2;
                    ++v33;
                  }
                  while (v34 < (unint64_t)*v29 >> 4);
                }
                goto LABEL_89;
              default:
LABEL_88:
                fprintf(v6, "\tn%d -> n%d:w;\n");
LABEL_89:
                v35 = *v29;
                LODWORD(v36) = 2;
                switch(v35 & 0xF)
                {
                  case 0uLL:
                  case 4uLL:
                  case 8uLL:
                  case 0xAuLL:
                  case 0xCuLL:
                    LODWORD(v36) = 3;
                    goto LABEL_95;
                  case 2uLL:
                  case 5uLL:
                  case 6uLL:
                  case 7uLL:
                    goto LABEL_95;
                  case 3uLL:
                    v36 = 3 * (v35 >> 4) + 1;
                    goto LABEL_95;
                  case 9uLL:
                    LODWORD(v36) = 1;
                    goto LABEL_95;
                  case 0xBuLL:
                  case 0xDuLL:
                    LODWORD(v36) = (v35 >> 3) | 1;
                    goto LABEL_95;
                  case 0xFuLL:
                    LODWORD(v36) = ((v35 >> 3) & 0x1E) - 1;
LABEL_95:
                    v29 += v36;
                    if ((unint64_t)v29 >= v28)
                      goto LABEL_135;
                    continue;
                  default:
                    goto LABEL_135;
                }
            }
          }
        }
        goto LABEL_135;
      }
      v37 = a2[8];
      fprintf(v6, "\tnstart -> n%d:w\n", *(_DWORD *)(v37 + 8));
      v38 = *(unsigned int *)(v37 + 12);
      if (!(_DWORD)v38)
      {
LABEL_135:
        fwrite("\n}\n", 3uLL, 1uLL, v6);
        fflush(v6);
        fclose(v6);
        dup2(v55, v56);
        return 0;
      }
      v39 = v37 + 40;
      v40 = v37 + 40 + 16 * v38;
      v41 = (unsigned __int8 *)(v37 + 40);
      while (1)
      {
        if (*(_DWORD *)(v37 + 12) <= ((unint64_t)&v41[-v39] >> 4))
          goto LABEL_128;
        v42 = *v41;
        if (v42 == 255)
          goto LABEL_128;
        v43 = *((_DWORD *)v41 + 1);
        if (*v41 > 0x26u)
        {
          if (v42 == 39)
          {
            v52 = *((_QWORD *)v41 + 1);
            if (*(_DWORD *)(v52 + 4))
            {
              v53 = 0;
              do
              {
                if (*(_BYTE *)(v39 + 16 * *(unsigned int *)(v52 + 8 + 4 * v53)) == 49)
                  fprintf(v6, "\tn%d -> n%d [arrowhead=odot];\n");
                else
                  fprintf(v6, "\tn%d -> n%d:s [arrowhead=odot];\n");
                ++v53;
              }
              while (v53 < *(unsigned int *)(v52 + 4));
            }
            goto LABEL_128;
          }
          if (v42 == 54 || (v44 = *((_DWORD *)v41 + 1), v42 == 56))
          {
            fprintf(v6, "\tn%d:e -> n%d:w;\n", (unint64_t)&v41[-v39] >> 4, (unint64_t)&v41[-v39] >> 4);
            v44 = *((_DWORD *)v41 + 1);
          }
        }
        else
        {
          if (v42 == 18)
          {
            v47 = *((_QWORD *)v41 + 1);
            if (*(_BYTE *)(v47 + 6))
            {
              v48 = 0;
              v49 = (int *)(v47 + 12);
              do
              {
                v50 = *((unsigned __int8 *)v49 - 4);
                v51 = *v49;
                v49 += 2;
                fprintf(v6, "\tn%d -> n%d [label=\"%c\"];\n", (unint64_t)&v41[-v39] >> 4, v51, v50);
                ++v48;
              }
              while (v48 < *(unsigned __int8 *)(v47 + 6));
            }
            goto LABEL_128;
          }
          if (v42 == 34)
            goto LABEL_128;
          v44 = *((_DWORD *)v41 + 1);
          if (v42 == 38)
          {
            v45 = v41[1];
            if (v45 == 42)
            {
              fprintf(v6, "\tn%d:n -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
              if (*(_BYTE *)(v39 + 16 * *((unsigned int *)v41 + 2)) == 49)
                goto LABEL_133;
              fprintf(v6, "\tn%d:s -> n%d:s [arrowhead=odot];\n");
            }
            else
            {
              if (v45 != 43)
              {
                fprintf(v6, "\tn%d:n -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
                if (*(_BYTE *)(v39 + 16 * *((unsigned int *)v41 + 2)) != 49)
                {
                  fprintf(v6, "\tn%d:s -> n%d:w [arrowhead=odot];\n");
                  goto LABEL_128;
                }
LABEL_133:
                fprintf(v6, "\tn%d:s -> n%d [arrowhead=odot];\n");
                goto LABEL_128;
              }
              fprintf(v6, "\tn%d:e -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
              fprintf(v6, "\tn%d:n -> n%d:n [arrowhead=odot];\n");
            }
            goto LABEL_128;
          }
        }
        v46 = *(unsigned __int8 *)(v39 + 16 * v44);
        if (v46 == 38)
        {
          if (*(_BYTE *)(v39 + 16 * v44 + 1) != 42)
          {
LABEL_127:
            fprintf(v6, "\tn%d -> n%d:w;\n");
            goto LABEL_128;
          }
        }
        else if (v46 != 49)
        {
          goto LABEL_127;
        }
        fprintf(v6, "\tn%d -> n%d;\n");
LABEL_128:
        v41 += 16;
        if ((unint64_t)v41 >= v40)
          goto LABEL_135;
      }
    }
    v19 = 16 * v18 - 16;
    while (1)
    {
      v20 = (_BYTE *)(v17 + v19 + 40);
      if (*v20 != 255)
        break;
LABEL_71:
      v19 -= 16;
      if (v17 + v19 + 40 < v17 + 40)
        goto LABEL_72;
    }
    v21 = v19 >> 4;
    if (*(_DWORD *)(v17 + 12) < (v19 >> 4))
      LODWORD(v21) = *(_DWORD *)(v17 + 12);
    fprintf(v6, "\tn%d [shape=", v21);
    v22 = *v20;
    if (v22 > 0x21)
    {
      switch(*v20)
      {
        case '"':
          fprintf(v6, "Msquare, label=\"E%d");
          goto LABEL_66;
        case '#':
          fprintf(v6, "Mcircle, label=\"%d)");
          goto LABEL_66;
        case '$':
          fprintf(v6, "Mcircle, label=\"(%d");
          goto LABEL_66;
        case '&':
        case '\'':
          fprintf(v6, "Mcircle, headport=n, label=\"%c");
          goto LABEL_66;
        case '0':
          v23 = "Mcircle, label=\".";
          goto LABEL_57;
        case '1':
          fprintf(v6, "Mcircle, label=\"%c");
          goto LABEL_66;
        case '2':
          v23 = "Mcircle, label=\"^";
          goto LABEL_57;
        case '3':
          v23 = "Mcircle, label=\"$";
LABEL_57:
          v24 = 17;
          break;
        case '4':
          v23 = "Mcircle, label=\"[]";
          goto LABEL_61;
        case '6':
          v23 = "Mcircle, label=\"[]*";
          v24 = 19;
          goto LABEL_62;
        case '8':
          v23 = "Mcircle, label=\".*";
          goto LABEL_61;
        default:
          goto LABEL_65;
      }
      goto LABEL_62;
    }
    switch(v22)
    {
      case 0x10u:
        fprintf(v6, "circle, label=\"%c");
        break;
      case 0x11u:
        fprintf(v6, "circle, label=\"%.*s");
        break;
      case 0x12u:
        v23 = "diamond, label=\"{}";
LABEL_61:
        v24 = 18;
LABEL_62:
        fwrite(v23, v24, 1uLL, v6);
        break;
      default:
LABEL_65:
        fprintf(v6, "hexagon, label=\"%d");
        break;
    }
LABEL_66:
    v25 = *v20;
    if (v25 == 34)
    {
      fprintf(v6, "\"]; /* n=%p, type=%d, end */\n");
    }
    else if (v25 == 38)
    {
      fprintf(v6, "\"]; /* n=%p, type=%d, left=n%u, right=n%u */\n");
    }
    else
    {
      fprintf(v6, "\"]; /* n=%p, type=%d, next=n%u, data=%u */\n");
    }
    goto LABEL_71;
  }
  return 0xFFFFFFFFLL;
}

size_t printGraphNode(FILE *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int v24;

  v6 = a2 + 16 * a3;
  fprintf(a1, "[#%x->%x ", a3, *(_DWORD *)(v6 + 44));
  switch(*(_BYTE *)(v6 + 40))
  {
    case 0x10:
      fprintf(a1, "'%c'");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x11:
      fprintf(a1, "\"%.*s\"");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x12:
      v8 = *(_QWORD *)(a2 + 16 * a3 + 48);
      fputc(123, a1);
      if (*(_BYTE *)(v8 + 6))
      {
        v9 = 0;
        v10 = (int *)(v8 + 12);
        do
        {
          if (v9)
            fputc(32, a1);
          v11 = *((char *)v10 - 4);
          v12 = *v10;
          v10 += 2;
          fprintf(a1, "'%c'->%x", v11, v12);
          ++v9;
        }
        while (v9 < *(unsigned __int8 *)(v8 + 6));
      }
      putchar(125);
      goto LABEL_13;
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
    case 0x21:
    case 0x2F:
    case 0x35:
    case 0x37:
      goto LABEL_5;
    case 0x22:
      fprintf(a1, "E r=%d");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x23:
LABEL_13:
      v13 = 41;
      goto LABEL_41;
    case 0x24:
      v13 = 40;
      goto LABEL_41;
    case 0x25:
      v7 = "(?";
      goto LABEL_43;
    case 0x26:
      fprintf(a1, "->%x alt:%c");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x27:
      fwrite("alts", 4uLL, 1uLL, a1);
      v14 = a2 + 16 * a3;
      v17 = *(_QWORD *)(v14 + 48);
      v16 = (uint64_t *)(v14 + 48);
      v15 = v17;
      if (*(_DWORD *)(v17 + 4))
      {
        v18 = 0;
        do
        {
          fprintf(a1, " ->%x", *(_DWORD *)(v15 + 4 * v18++ + 8));
          v15 = *v16;
        }
        while (v18 < *(unsigned int *)(*v16 + 4));
      }
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x28:
      v7 = "cons";
      goto LABEL_24;
    case 0x29:
      v13 = 42;
      goto LABEL_41;
    case 0x2A:
      v7 = "*?";
      goto LABEL_43;
    case 0x2B:
      v13 = 43;
      goto LABEL_41;
    case 0x2C:
      v7 = "+?";
      goto LABEL_43;
    case 0x2D:
      v13 = 63;
      goto LABEL_41;
    case 0x2E:
      v7 = "??";
      goto LABEL_43;
    case 0x30:
      v13 = 46;
      goto LABEL_41;
    case 0x31:
      v7 = "[S]";
      v19 = 3;
      goto LABEL_44;
    case 0x32:
      v13 = 94;
      goto LABEL_41;
    case 0x33:
      v13 = 36;
      goto LABEL_41;
    case 0x34:
      fputc(91, a1);
      goto LABEL_37;
    case 0x36:
      fwrite("*[", 2uLL, 1uLL, a1);
LABEL_37:
      v20 = a2 + 16 * a3;
      v23 = *(_QWORD *)(v20 + 48);
      v22 = (uint64_t *)(v20 + 48);
      v21 = v23;
      if (*(_DWORD *)(v23 + 4))
      {
        v24 = 0;
        do
        {
          fprintf(a1, "%c-%c", *(char *)(v21 + 8 + v24), *(char *)(v21 + 8 + v24 + 1));
          v24 += 2;
          v21 = *v22;
        }
        while (v24 < *(_DWORD *)(*v22 + 4));
      }
      v13 = 93;
LABEL_41:
      fputc(v13, a1);
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x38:
      v7 = ".*";
LABEL_43:
      v19 = 2;
      goto LABEL_44;
    default:
      if (*(unsigned __int8 *)(v6 + 40) == 255)
      {
        v7 = "DEAD";
LABEL_24:
        v19 = 4;
LABEL_44:
        fwrite(v7, v19, 1uLL, a1);
      }
      else
      {
LABEL_5:
        fprintf(a1, "(unknown type %x)");
      }
      return fwrite("]\n", 2uLL, 1uLL, a1);
  }
}

size_t printRunNode(FILE *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unint64_t v9;
  char *v10;
  int v11;
  const char *v12;
  size_t v13;
  unsigned int v15;

  v5 = a3;
  v6 = **(_QWORD **)(a2 + 56);
  v7 = (unsigned __int8 *)(v6 + a3);
  fprintf(a1, "[#%x ", a3);
  v8 = *v7;
  switch(v8 & 0xF)
  {
    case 0u:
    case 4u:
    case 8u:
    case 0xCu:
      fprintf(a1, "\"%.*s\"");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 2u:
      fprintf(a1, "'%c'");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 3u:
      fputc(123, a1);
      if (*v7 >= 0x10u)
      {
        v9 = 0;
        v10 = (char *)(v5 + v6 + 3);
        do
        {
          if (v9)
            fputc(32, a1);
          fprintf(a1, "'%c'->%x", *v10, *((unsigned __int16 *)v10 - 1));
          ++v9;
          v10 += 3;
        }
        while (v9 < (unint64_t)*v7 >> 4);
      }
      v11 = 125;
      goto LABEL_14;
    case 5u:
      fprintf(a1, "E r=%d");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 6u:
      v11 = 41;
      goto LABEL_14;
    case 7u:
      v11 = 40;
LABEL_14:
      fputc(v11, a1);
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 9u:
      switch((v8 >> 4) & 7)
      {
        case 0u:
          v11 = 46;
          goto LABEL_14;
        case 1u:
          v11 = 94;
          goto LABEL_14;
        case 2u:
          v11 = 36;
          goto LABEL_14;
        case 3u:
          v12 = ".*";
          v13 = 2;
          goto LABEL_21;
        default:
          return fwrite("]\n", 2uLL, 1uLL, a1);
      }
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0xAu:
      fprintf(a1, "->%x [S]");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0xBu:
      v12 = "[...]";
      v13 = 5;
      goto LABEL_21;
    case 0xDu:
      v12 = "[...]*";
      v13 = 6;
LABEL_21:
      fwrite(v12, v13, 1uLL, a1);
      break;
    case 0xFu:
      fprintf(a1, "alts ->%x", a3 + ((v8 >> 3) & 0x1E) - 1);
      if (*v7 >= 0x20u)
      {
        v15 = 1;
        do
          fprintf(a1, " ->%x", *(unsigned __int16 *)&v7[2 * v15++ - 1]);
        while (v15 < *v7 >> 4);
      }
      break;
    default:
      fprintf(a1, "(unknown type %x)");
      break;
  }
  return fwrite("]\n", 2uLL, 1uLL, a1);
}

uint64_t matchPrintNodes(int a1, uint64_t a2)
{
  FILE *v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned __int16 v14;
  uint64_t v15;

  v4 = fdopen(a1, "w");
  v5 = dup(a1);
  v6 = *(uint64_t **)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 64);
  v8 = *v6;
  if (*v6)
  {
    v9 = *((unsigned __int16 *)v6 + 8);
    fprintf(v4, "== matchPrintNodes: run nodes (start=0, count=%x) ==\n", *((unsigned __int16 *)v6 + 8));
    if (v9)
    {
      v10 = 0;
      while (2)
      {
        printRunNode(v4, a2, v10);
        v11 = *(unsigned __int8 *)(v8 + v10);
        LOWORD(v12) = 2;
        switch(v11 & 0xF)
        {
          case 0u:
          case 4u:
          case 8u:
          case 0xAu:
          case 0xCu:
            LOWORD(v12) = 3;
            goto LABEL_10;
          case 2u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_10;
          case 3u:
            v12 = 3 * (v11 >> 4) + 1;
            goto LABEL_10;
          case 9u:
            LOWORD(v12) = 1;
            goto LABEL_10;
          case 0xBu:
          case 0xDu:
            v12 = (v11 >> 3) | 1;
            goto LABEL_10;
          case 0xFu:
            v12 = ((v11 >> 3) & 0x1E) - 1;
LABEL_10:
            v10 += v12;
            if (v9 <= v10)
              break;
            continue;
          default:
            return 0xFFFFFFFFLL;
        }
        break;
      }
    }
    fwrite("== end nodes==\n", 0xFuLL, 1uLL, v4);
  }
  if (v7)
  {
    fprintf(v4, "== matchPrintNodes: graph nodes (start=%x, count=%x) ==\n", *(_DWORD *)(v7 + 8), *(_DWORD *)(v7 + 12));
    if (*(_DWORD *)(v7 + 12))
    {
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = *(_QWORD *)(v7 + 16);
        if (v15)
          fprintf(v4, "rc=%u ", *(_DWORD *)(v15 + 4 * v14));
        printGraphNode(v4, v7, v13);
        v13 = ++v14;
      }
      while (*(_DWORD *)(v7 + 12) > v14);
    }
    fwrite("== end nodes==\n", 0xFuLL, 1uLL, v4);
  }
  fflush(v4);
  fclose(v4);
  dup2(v5, a1);
  return 0;
}

uint64_t matchInit(uint64_t *a1, void *(*a2)(size_t a1), void (__cdecl *a3)(void *), uint64_t a4)
{
  BOOL v7;
  int v8;
  void *(*v9)(size_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  void (__cdecl *v13)(void *);

  if (a2)
    v7 = a3 == 0;
  else
    v7 = 1;
  v8 = v7;
  if (v7)
  {
    v9 = malloc_wrapper;
    v10 = ((uint64_t (*)(uint64_t, uint64_t))malloc_wrapper)(72, a4);
  }
  else
  {
    v9 = a2;
    v10 = ((uint64_t (*)(uint64_t, uint64_t))a2)(72, a4);
  }
  if (!v10)
    return 4294967292;
  v11 = v10;
  result = 0;
  v13 = free_wrapper;
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  if (!v8)
    v13 = a3;
  *(_OWORD *)(v11 + 32) = 0uLL;
  *(_OWORD *)(v11 + 48) = 0uLL;
  *(_DWORD *)v11 = 1;
  *(_QWORD *)(v11 + 8) = v9;
  *(_QWORD *)(v11 + 16) = v13;
  *(_QWORD *)(v11 + 24) = a4;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *a1 = v11;
  return result;
}

uint64_t matchSetOption(unsigned int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t result;

  if (!a1)
    return 4294967294;
  if (a2 != 1)
    return 4294967293;
  result = 0;
  *a1 = *a1 & 0xFFFFFFFE | (a9 != 0);
  return result;
}

unsigned __int8 *nodeModPtrRefs(unsigned __int8 *result, int a2, uint64_t (*a3)(_QWORD, uint64_t), uint64_t a4)
{
  unsigned int v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  _DWORD *v8;

  v4 = *result;
  v5 = v4 > 0x36;
  v6 = (1 << v4) & 0x50008000060000;
  v7 = v5 || v6 == 0;
  if (!v7)
  {
    v8 = (_DWORD *)*((_QWORD *)result + 1);
    v7 = *v8 + a2 == 0;
    *v8 += a2;
    if (v7)
      return (unsigned __int8 *)a3(*((_QWORD *)result + 1), a4);
  }
  return result;
}

uint64_t nfaFree(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  unint64_t v5;
  uint64_t *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  int v11;

  if (*(_DWORD *)(a1 + 36) && *(_DWORD *)(a1 + 12))
  {
    v5 = 0;
    v6 = (uint64_t *)(a1 + 48);
    do
    {
      v7 = *((unsigned __int8 *)v6 - 8);
      v8 = v7 > 0x36;
      v9 = (1 << v7) & 0x50008000060000;
      if (!v8 && v9 != 0)
      {
        v11 = *(_DWORD *)*v6 - 1;
        *(_DWORD *)*v6 = v11;
        if (!v11)
          a2(*v6, a3);
      }
      v6 += 2;
      ++v5;
    }
    while (v5 < *(unsigned int *)(a1 + 12));
  }
  return a2(a1, a3);
}

uint64_t matchFree(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 64);
    if (v2)
      nfaFree(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24));
    v3 = *(_QWORD *)(v1 + 56);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v3, *(_QWORD *)(v1 + 24));
    if (*(_QWORD *)(v1 + 32))
    {
      v4 = *(void (**)(void))(v1 + 48);
      if (v4)
        v4();
    }
    return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(v1, *(_QWORD *)(v1 + 24));
  }
  return result;
}

void *malloc_wrapper(size_t a1)
{
  return malloc_type_malloc(a1, 0xA073BEEDuLL);
}

uint64_t matchCompile(uint64_t a1, unsigned __int8 *a2, unint64_t a3, int a4)
{
  uint64_t v4;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int8 v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  _OWORD v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  unsigned __int8 *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v29 = 0u;
  v30 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  memset(v16, 0, sizeof(v16));
  v31 = a2;
  v32 = (unint64_t)&a2[a3];
  BYTE9(v32) = *(_BYTE *)a1 & 1;
  *((_QWORD *)&v28 + 1) = a1;
  if (a3 > 0x1553555)
    return 0xFFFFFFFFLL;
  v7 = 6 * a3 + 6;
  v8 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(16 * v7 + 56, *(_QWORD *)(a1 + 24));
  if (!v8)
    return 4294967292;
  v9 = v8;
  *(_DWORD *)(v8 + 12) = 0;
  *(_QWORD *)v8 = a1;
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_DWORD *)(v8 + 32) = 0;
  *(_DWORD *)(v8 + 36) = v7;
  LODWORD(v17) = 0;
  *(_QWORD *)&v29 = v8;
  *((_QWORD *)&v29 + 1) = v8 + 40;
  LODWORD(v30) = 0;
  BYTE4(v28) = 1;
  *((_QWORD *)&v27 + 1) = 0;
  LODWORD(v28) = 0;
  BYTE4(v17) = 33;
  *(_QWORD *)((char *)&v19 + 4) = 1;
  v10 = tokenize(&v31);
  v11 = v10;
  if (v10 == 50)
  {
    BYTE5(v28) = 1;
  }
  else
  {
    BYTE5(v28) = 0;
    handleToken((uint64_t)v16, 0x30u);
    handleOperator((uint64_t)v16, 0x2Au);
  }
  if (BYTE9(v32))
    v12 = 37;
  else
    v12 = 36;
  handleOperator((uint64_t)v16, v12);
  do
  {
    v13 = handleToken((uint64_t)v16, v11);
    if ((_DWORD)v13)
    {
      v4 = v13;
      v29 = 0uLL;
      (*(void (**)(uint64_t, _QWORD))(a1 + 16))(v9, *(_QWORD *)(a1 + 24));
      return v4;
    }
    v14 = tokenize(&v31);
    v11 = v14;
  }
  while (v14 != 34);
  if (DWORD2(v27) && (evaluateOperator((uint64_t)v16, 0x23u), BYTE4(v28) = 0, DWORD2(v27)))
  {
    (*(void (**)(uint64_t, _QWORD))(a1 + 16))(v9, *(_QWORD *)(a1 + 24));
    return 4294967291;
  }
  else
  {
    handleOperator((uint64_t)v16, 0x22u);
    evaluateOperator((uint64_t)v16, 0x21u);
    v4 = 0;
    *(_DWORD *)(*((_QWORD *)&v29 + 1) + 16 * v30 + 8) = a4;
    *(_QWORD *)(a1 + 64) = v9;
  }
  return v4;
}

uint64_t tokenize(unsigned __int8 **a1)
{
  char v1;
  unint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  unsigned __int8 v7;
  char v8;
  char v9;
  char v10;
  unsigned int v11;
  char *v12;
  char v13;
  char v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unint64_t v37;
  char v38;
  unsigned int i;
  unsigned int v40;

  v1 = 0;
  v3 = *a1;
  v2 = (unint64_t)a1[1];
  do
  {
    if ((unint64_t)v3 >= v2)
      return 34;
    v4 = v3 + 1;
    *a1 = v3 + 1;
    v5 = *v3;
    if ((v1 & 1) != 0 || *((_BYTE *)a1 + 16))
      goto LABEL_66;
    v1 = 1;
    ++v3;
  }
  while (v5 == 92);
  v6 = (unint64_t)v4 < v2 && *v4 == 63;
  if (v5 > 62)
  {
    if (v5 > 93)
    {
      if (v5 == 94)
        return 50;
      if (v5 == 124)
        return 38;
    }
    else
    {
      if (v5 == 63)
      {
        if (v6)
        {
          *a1 = v4 + 1;
          return 46;
        }
        else
        {
          return 45;
        }
      }
      if (v5 == 91)
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = (char *)a1 + 28;
        v13 = 1;
        while (2)
        {
          v14 = 0;
          v12[v11] = 0;
          do
          {
            if ((unint64_t)v4 >= v2)
              return 34;
            v15 = v4++;
            *a1 = v4;
            v16 = *v15;
            if ((v14 & 1) != 0)
              goto LABEL_32;
            v14 = 1;
          }
          while (v16 == 92);
          switch(v16)
          {
            case '-':
              if ((v9 & 1) != 0)
              {
                v13 = 0;
                v8 = 1;
                goto LABEL_36;
              }
              v16 = 45;
              break;
            case '^':
              if ((v13 & 1) != 0)
              {
                v13 = 1;
                v10 = 1;
                goto LABEL_37;
              }
              v16 = 94;
              break;
            case ']':
              if ((v13 & 1) == 0)
              {
                if ((v8 & 1) != 0)
                  v12[v11 - 1] = 45;
                if (!v11)
                  goto LABEL_56;
                if (v11 <= 2)
                {
                  v11 = 0;
                  if ((v10 & 1) == 0)
                    goto LABEL_61;
                  v38 = *v12;
                  goto LABEL_60;
                }
LABEL_38:
                v20 = 0;
                v21 = (char *)a1 + 30;
                v22 = 2;
                v23 = v11;
                do
                {
                  v24 = 0;
                  v25 = v20;
                  v20 += 2;
                  LODWORD(v26) = v25;
                  do
                  {
                    if (v21[v24] >= v12[v26])
                      v26 = v26;
                    else
                      v26 = (v22 + v24);
                    v24 += 2;
                  }
                  while (v22 + v24 < v23);
                  if (v25 != v26)
                  {
                    v27 = v12[v26];
                    v12[v26] = v12[v25];
                    v12[v25] = v27;
                    v28 = v26 + 1;
                    v29 = v12[v28];
                    v30 = v25 | 1;
                    v12[v28] = v12[v30];
                    v12[v30] = v29;
                  }
                  v22 += 2;
                  v21 += 2;
                }
                while (v22 < v23);
                v31 = 0;
                v11 = 0;
                do
                {
                  v32 = *((unsigned __int8 *)a1 + v31 + 30);
                  v33 = v11 + 1;
                  v34 = v12[v33];
                  if (v32 <= v34)
                  {
                    v36 = *((unsigned __int8 *)a1 + v31 + 31);
                    if (v34 > v36)
                      LOBYTE(v36) = v12[v33];
                    v12[v33] = v36;
                  }
                  else
                  {
                    v35 = v11 + 2;
                    if (v31 + 2 == v35)
                    {
                      v11 = v31 + 2;
                    }
                    else
                    {
                      v12[v35] = v32;
                      v12[v11 + 3] = *((_BYTE *)a1 + v31 + 31);
                      v11 += 2;
                    }
                  }
                  v37 = v31 + 4;
                  v31 += 2;
                }
                while (v37 < v23);
LABEL_56:
                if ((v10 & 1) == 0)
                {
LABEL_61:
                  *((_DWORD *)a1 + 6) = v11 + 2;
                  return 52;
                }
                v38 = *v12;
                if (v11)
                {
                  for (i = 0; i < v11; v12[v40] = v12[i] - 1)
                  {
                    v40 = i + 1;
                    v12[i] = v12[i + 1] + 1;
                    i += 2;
                  }
                }
LABEL_60:
                v12[v11] = v12[v11 + 1] + 1;
                v12[v11 + 1] = v38 - 1;
                goto LABEL_61;
              }
              v16 = 93;
              break;
          }
LABEL_32:
          *((_BYTE *)a1 + 18) = v16;
          if ((v8 & 1) != 0)
          {
            v17 = v11 - 1;
            v12[v17] = v16;
            v18 = v11 - 2;
            v19 = v12[v18];
            v13 = 0;
            v8 = 0;
            v9 = 0;
            if (v16 < v19)
            {
              v12[v17] = v19;
              v12[v18] = v16;
            }
LABEL_37:
            v4 = v15 + 1;
            if (v11 < 0x20)
              continue;
            goto LABEL_38;
          }
          break;
        }
        v13 = 0;
        v8 = 0;
        v12[v11] = v16;
        v12[v11 + 1] = v16;
        v11 += 2;
LABEL_36:
        v9 = 1;
        goto LABEL_37;
      }
    }
LABEL_66:
    *((_BYTE *)a1 + 18) = v5;
    return 16;
  }
  switch(v5)
  {
    case '$':
      v7 = 51;
      break;
    case '(':
      if (v6)
        *a1 = v4 + 1;
      if (*((unsigned __int8 *)a1 + 17) == v6)
        v7 = 36;
      else
        v7 = 37;
      break;
    case ')':
      v7 = 35;
      break;
    case '*':
      if (v6)
      {
        *a1 = v4 + 1;
        v7 = 42;
      }
      else
      {
        v7 = 41;
      }
      break;
    case '+':
      if (v6)
      {
        *a1 = v4 + 1;
        v7 = 44;
      }
      else
      {
        v7 = 43;
      }
      break;
    case '.':
      v7 = 48;
      break;
    default:
      goto LABEL_66;
  }
  return v7;
}

uint64_t handleToken(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;

  if ((a2 & 0x30) == 0x20)
  {
    handleOperator(a1, a2);
    return 0;
  }
  if (!*(_BYTE *)(a1 + 436))
    handleOperator(a1, 0x28u);
  v5 = *(_QWORD *)(a1 + 448);
  v6 = *(_QWORD *)(a1 + 456);
  v7 = *(unsigned int *)(v5 + 12);
  *(_DWORD *)(v5 + 12) = v7 + 1;
  v8 = v6 + 16 * v7;
  *(_BYTE *)v8 = a2;
  *(_BYTE *)(v8 + 1) = 95;
  *(_QWORD *)(v8 + 4) = -1;
  if (a2 == 16)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 456) + 16 * v7 + 8) = *(_BYTE *)(a1 + 490);
  }
  else if (a2 == 52)
  {
    v9 = *(unsigned int *)(a1 + 496) + 8;
    v10 = (_DWORD *)(*(uint64_t (**)(size_t, _QWORD))(**(_QWORD **)(a1 + 448) + 8))(v9, *(_QWORD *)(**(_QWORD **)(a1 + 448) + 24));
    if (!v10)
      return 4294967292;
    v11 = v10;
    memcpy(v10, (const void *)(a1 + 492), v9);
    *v11 = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 456) + 16 * v7 + 8) = v11;
  }
  v12 = *(unsigned int *)(a1 + 256);
  if (v12 <= 0x1F)
  {
    *(_WORD *)(a1 + 8 * v12) = v7;
    if (!WORD1(v7))
    {
      *(_WORD *)(a1 + 8 * *(unsigned int *)(a1 + 256) + 2) = v7;
      v13 = *(unsigned int *)(a1 + 256);
      *(_DWORD *)(a1 + 8 * v13 + 4) = *(_DWORD *)(a1 + 424);
      *(_DWORD *)(a1 + 256) = v13 + 1;
    }
  }
  result = 0;
  *(_BYTE *)(a1 + 436) = 0;
  return result;
}

uint64_t handleOperator(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v2 = result;
  if (a2 == 35)
  {
    if (!*(_DWORD *)(result + 424))
      return result;
    result = evaluateOperator(result, 0x23u);
    goto LABEL_12;
  }
  if ((a2 & 0xFE) != 0x24)
  {
    result = evaluateOperator(result, a2);
    v5 = *(unsigned int *)(v2 + 292);
    if (v5 <= 0x1F)
    {
      *(_BYTE *)(v2 + v5 + 260) = a2;
      v6 = *(unsigned int *)(v2 + 292);
      *(_DWORD *)(v2 + 4 * v6 + 296) = *(_DWORD *)(v2 + 432);
      *(_DWORD *)(v2 + 292) = v6 + 1;
    }
    if (a2 - 41 < 6)
    {
LABEL_12:
      v7 = 0;
LABEL_22:
      *(_BYTE *)(v2 + 436) = v7;
      return result;
    }
LABEL_21:
    v7 = 1;
    goto LABEL_22;
  }
  if (a2 != 36 || *(int *)(result + 432) <= 16)
  {
    if (*(_BYTE *)(result + 436))
    {
      LODWORD(v4) = *(_DWORD *)(result + 292);
    }
    else
    {
      result = evaluateOperator(result, 0x28u);
      v4 = *(unsigned int *)(v2 + 292);
      if (v4 <= 0x1F)
      {
        *(_BYTE *)(v2 + v4 + 260) = 40;
        v8 = *(unsigned int *)(v2 + 292);
        *(_DWORD *)(v2 + 4 * v8 + 296) = *(_DWORD *)(v2 + 432);
        LODWORD(v4) = v8 + 1;
        *(_DWORD *)(v2 + 292) = v8 + 1;
      }
      *(_BYTE *)(v2 + 436) = 1;
    }
    if (v4 <= 0x1F)
    {
      *(_BYTE *)(v2 + v4 + 260) = a2;
      v9 = *(unsigned int *)(v2 + 292);
      *(_DWORD *)(v2 + 4 * v9 + 296) = *(_DWORD *)(v2 + 432);
      *(_DWORD *)(v2 + 292) = v9 + 1;
    }
    if (a2 == 36)
      *(int32x2_t *)(v2 + 428) = vadd_s32(*(int32x2_t *)(v2 + 428), (int32x2_t)0x100000001);
    ++*(_DWORD *)(v2 + 424);
    goto LABEL_21;
  }
  return result;
}

uint64_t evaluateOperator(uint64_t result, unsigned int a2)
{
  int32x2_t *v3;
  __int32 v4;
  uint64_t v5;
  unsigned int v6;
  int32x2_t v7;
  int32x2_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int32 v13;
  int32x2_t *v14;
  __int32 v15;
  int32x2_t *v16;
  unsigned int v17;
  int32x2_t *v18;
  int32x2_t v19;
  int32x2_t v20;
  uint64_t v21;
  int32x2_t v22;
  int32x2_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int32x2_t *v27;
  int32x2_t v28;
  int32x2_t v29;
  uint64_t v30;
  uint64_t v31;
  int32x2_t v32;
  int32x2_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  int32x2_t *v37;
  int32x2_t v38;
  int32x2_t v39;
  uint64_t v40;
  int32x2_t v41;
  int32x2_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  int32x2_t *v47;
  int32x2_t v48;
  int32x2_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  int32x2_t v54;
  int32x2_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  int32x2_t v59;
  int32x2_t v60;
  uint64_t v61;
  int32x2_t v62;
  int32x2_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int32x2_t v67;
  int32x2_t v68;
  uint64_t v69;
  uint64_t v70;
  int32x2_t v71;
  int32x2_t v72;
  uint64_t v73;
  uint64_t v74;
  int32x2_t v75;
  int32x2_t v76;
  uint64_t v77;
  uint64_t v78;
  int32x2_t v79;
  int32x2_t v80;
  uint64_t v81;
  uint64_t v82;
  int32x2_t v83;
  uint64_t v84;
  unsigned int v85;
  int32x2_t *v86;
  int32x2_t v87;
  int32x2_t v88;
  uint64_t v89;
  uint64_t v90;
  int32x2_t v91;
  int32x2_t v92;
  uint64_t v93;
  uint64_t v94;
  int32x2_t v95;
  uint64_t v96;
  uint64_t v97;

  v3 = (int32x2_t *)result;
  while (2)
  {
    while (1)
    {
      v4 = v3[36].i32[1];
      if (a2 != 35)
        break;
      if (v4)
        goto LABEL_7;
LABEL_9:
      result = verifyOperandCount((uint64_t)v3, 1);
      v7 = v3[56];
      v8 = v3[57];
      v9 = *(unsigned int *)(*(_QWORD *)&v7 + 12);
      *(_DWORD *)(*(_QWORD *)&v7 + 12) = v9 + 1;
      v10 = (v3[32].i32[0] - 1);
      v3[32].i32[0] = v10;
      v11 = *(_QWORD *)&v8 + 16 * v9;
      *(_WORD *)v11 = 17698;
      *(_QWORD *)(v11 + 4) = -1;
      v3[58].i32[0] = v9;
      *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v3[v10].u16[1] + 4) = v9;
      v12 = v3[32].u32[0];
      if (v12 <= 0x1F)
      {
        v3[v12].i16[0] = v3[v10].i16[0];
LABEL_30:
        v3[v3[32].u32[0]].i16[1] = v9;
        if (!WORD1(v9))
        {
LABEL_31:
          v66 = v3[32].u32[0];
          v3[v66].i32[1] = v3[53].i32[0];
          v3[32].i32[0] = v66 + 1;
        }
      }
    }
    if (v4 && v3[32].u8[v4 - 1 + 4] >= a2)
    {
LABEL_7:
      v5 = (v4 - 1);
      v3[36].i32[1] = v5;
      switch(v3[32].i8[v5 + 4])
      {
        case '!':
          result = verifyOperandCount((uint64_t)v3, 1);
          v6 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v6;
          *(_DWORD *)(*(_QWORD *)&v3[56] + 8) = v3[v6].u16[0];
          continue;
        case '"':
          goto LABEL_9;
        case '$':
          result = verifyOperandCount((uint64_t)v3, 1);
          v85 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v85;
          v86 = &v3[v85];
          v87 = v3[56];
          v88 = v3[57];
          v89 = *(unsigned int *)(*(_QWORD *)&v87 + 12);
          *(_DWORD *)(*(_QWORD *)&v87 + 12) = v89 + 1;
          v90 = *(_QWORD *)&v88 + 16 * v89;
          *(_WORD *)v90 = 10531;
          *(_QWORD *)(v90 + 4) = -1;
          v91 = v3[56];
          v92 = v3[57];
          v93 = *(unsigned int *)(*(_QWORD *)&v91 + 12);
          *(_DWORD *)(*(_QWORD *)&v91 + 12) = v93 + 1;
          v91.i32[0] = v86->u16[0];
          v94 = *(_QWORD *)&v92 + 16 * v93;
          *(_WORD *)v94 = 10276;
          *(_DWORD *)(v94 + 4) = v91.i32[0];
          *(_DWORD *)(v94 + 8) = -1;
          v95 = v3[57];
          *(_DWORD *)(*(_QWORD *)&v95 + 16 * v86->u16[1] + 4) = v89;
          *(_DWORD *)(*(_QWORD *)&v95 + 16 * v93 + 8) = v3[37].i32[v3[36].u32[1]];
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v89 + 8) = v3[37].i32[v3[36].u32[1]];
          v3[53] = vadd_s32(v3[53], (int32x2_t)-1);
          v96 = v3[32].u32[0];
          if (v96 <= 0x1F)
          {
            v3[v96].i16[0] = v93;
            if (!WORD1(v93))
            {
              v3[v3[32].u32[0]].i16[1] = v89;
              if (!WORD1(v89))
              {
                v97 = v3[32].u32[0];
                v3[v97].i32[1] = v3[53].i32[0];
                v3[32].i32[0] = v97 + 1;
              }
            }
          }
          return result;
        case '%':
          result = verifyOperandCount((uint64_t)v3, 1);
          --v3[53].i32[0];
          return result;
        case '&':
          result = verifyOperandCount((uint64_t)v3, 2);
          v13 = v3[32].i32[0];
          if (v13)
          {
            v3[32].i32[0] = v13 - 1;
            v14 = &v3[v13 - 1];
            if (v13 != 1)
            {
              v15 = v13 - 2;
              v3[32].i32[0] = v15;
              v16 = &v3[v15];
              goto LABEL_34;
            }
          }
          else
          {
            v14 = 0;
          }
          v16 = 0;
LABEL_34:
          if (v3[53].i32[0] == 1)
          {
            if (v3[54].i8[5])
            {
              v67 = v3[57];
              if (*(_BYTE *)(*(_QWORD *)&v67 + 16 * v14->u16[0]) != 50)
              {
                v68 = v3[56];
                v69 = *(unsigned int *)(*(_QWORD *)&v68 + 12);
                *(_DWORD *)(*(_QWORD *)&v68 + 12) = v69 + 1;
                v70 = *(_QWORD *)&v67 + 16 * v69;
                *(_WORD *)v70 = 11824;
                *(_QWORD *)(v70 + 4) = -1;
                v71 = v3[56];
                v72 = v3[57];
                v73 = *(unsigned int *)(*(_QWORD *)&v71 + 12);
                *(_DWORD *)(*(_QWORD *)&v71 + 12) = v73 + 1;
                v71.i32[0] = v14->u16[0];
                v74 = *(_QWORD *)&v72 + 16 * v73;
                *(_WORD *)v74 = 10790;
                *(_DWORD *)(v74 + 4) = v71.i32[0];
                *(_DWORD *)(v74 + 8) = v69;
                *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v69 + 4) = v73;
                v14->i16[0] = v73;
                if (WORD1(v73))
                  return result;
              }
            }
          }
          v75 = v3[56];
          v76 = v3[57];
          v77 = *(unsigned int *)(*(_QWORD *)&v75 + 12);
          *(_DWORD *)(*(_QWORD *)&v75 + 12) = v77 + 1;
          v78 = *(_QWORD *)&v76 + 16 * v77;
          *(_WORD *)v78 = 29489;
          *(_QWORD *)(v78 + 4) = -1;
          v76.i32[0] = v16->u16[0];
          v79 = v3[56];
          v80 = v3[57];
          v81 = *(unsigned int *)(*(_QWORD *)&v79 + 12);
          *(_DWORD *)(*(_QWORD *)&v79 + 12) = v81 + 1;
          v79.i32[0] = v14->u16[0];
          v82 = *(_QWORD *)&v80 + 16 * v81;
          *(_WORD *)v82 = 31782;
          *(_DWORD *)(v82 + 4) = v76.i32[0];
          *(_DWORD *)(v82 + 8) = v79.i32[0];
          v83 = v3[57];
          *(_DWORD *)(*(_QWORD *)&v83 + 16 * v16->u16[1] + 4) = v77;
          *(_DWORD *)(*(_QWORD *)&v83 + 16 * v14->u16[1] + 4) = v77;
          v84 = v3[32].u32[0];
          if (v84 <= 0x1F)
          {
            v3[v84].i16[0] = v81;
            if (!WORD1(v81))
            {
              v3[v3[32].u32[0]].i16[1] = v77;
              if (!WORD1(v77))
                goto LABEL_31;
            }
          }
          continue;
        case '(':
          result = verifyOperandCount((uint64_t)v3, 2);
          v44 = v3[32].u32[0];
          v45 = v44 - 1;
          v44 -= 2;
          v3[32].i32[0] = v44;
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v3[v44].u16[1] + 4) = v3[v45].u16[0];
          if (v44 > 0x1F)
            continue;
          v3[v3[32].u32[0]].i16[1] = v3[v45].i16[1];
          goto LABEL_31;
        case ')':
          result = verifyOperandCount((uint64_t)v3, 1);
          v17 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v17;
          v18 = &v3[v17];
          v19 = v3[56];
          v20 = v3[57];
          v9 = *(unsigned int *)(*(_QWORD *)&v19 + 12);
          *(_DWORD *)(*(_QWORD *)&v19 + 12) = v9 + 1;
          v21 = *(_QWORD *)&v20 + 16 * v9;
          *(_WORD *)v21 = 29489;
          *(_QWORD *)(v21 + 4) = -1;
          v22 = v3[56];
          v23 = v3[57];
          v24 = *(unsigned int *)(*(_QWORD *)&v22 + 12);
          *(_DWORD *)(*(_QWORD *)&v22 + 12) = v24 + 1;
          v22.i32[0] = v18->u16[0];
          v25 = *(_QWORD *)&v23 + 16 * v24;
          *(_WORD *)v25 = 10790;
          *(_DWORD *)(v25 + 4) = v22.i32[0];
          *(_DWORD *)(v25 + 8) = v9;
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v18->u16[1] + 4) = v24;
          goto LABEL_28;
        case '*':
          result = verifyOperandCount((uint64_t)v3, 1);
          v46 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v46;
          v47 = &v3[v46];
          v48 = v3[56];
          v49 = v3[57];
          v50 = *(unsigned int *)(*(_QWORD *)&v48 + 12);
          *(_DWORD *)(*(_QWORD *)&v48 + 12) = v50 + 1;
          v48.i32[0] = v47->u16[0];
          v51 = *(_QWORD *)&v49 + 16 * v50;
          *(_WORD *)v51 = 10790;
          *(_DWORD *)(v51 + 4) = -1;
          *(_DWORD *)(v51 + 8) = v48.i32[0];
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v47->u16[1] + 4) = v50;
          v52 = v3[32].u32[0];
          if (v52 > 0x1F)
            continue;
          v3[v52].i16[0] = v50;
          if (WORD1(v50))
            continue;
          v3[v3[32].u32[0]].i16[1] = v50;
          goto LABEL_31;
        case '+':
          result = verifyOperandCount((uint64_t)v3, 1);
          v26 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v26;
          v27 = &v3[v26];
          v28 = v3[56];
          v29 = v3[57];
          v30 = *(unsigned int *)(*(_QWORD *)&v28 + 12);
          *(_DWORD *)(*(_QWORD *)&v28 + 12) = v30 + 1;
          v31 = *(_QWORD *)&v29 + 16 * v30;
          *(_WORD *)v31 = 29489;
          *(_QWORD *)(v31 + 4) = -1;
          v32 = v3[56];
          v33 = v3[57];
          v34 = *(unsigned int *)(*(_QWORD *)&v32 + 12);
          *(_DWORD *)(*(_QWORD *)&v32 + 12) = v34 + 1;
          v32.i32[0] = v27->u16[0];
          v35 = *(_QWORD *)&v33 + 16 * v34;
          *(_WORD *)v35 = 11046;
          *(_DWORD *)(v35 + 4) = v32.i32[0];
          *(_DWORD *)(v35 + 8) = v30;
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v27->u16[1] + 4) = v34;
          goto LABEL_23;
        case ',':
          result = verifyOperandCount((uint64_t)v3, 1);
          v53 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v53;
          v27 = &v3[v53];
          v54 = v3[56];
          v55 = v3[57];
          v30 = *(unsigned int *)(*(_QWORD *)&v54 + 12);
          *(_DWORD *)(*(_QWORD *)&v54 + 12) = v30 + 1;
          v54.i32[0] = v27->u16[0];
          v56 = *(_QWORD *)&v55 + 16 * v30;
          *(_WORD *)v56 = 11046;
          *(_DWORD *)(v56 + 4) = -1;
          *(_DWORD *)(v56 + 8) = v54.i32[0];
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v27->u16[1] + 4) = v30;
LABEL_23:
          v57 = v3[32].u32[0];
          if (v57 <= 0x1F)
          {
            v3[v57].i16[0] = v27->i16[0];
            v3[v3[32].u32[0]].i16[1] = v30;
            if (!WORD1(v30))
              goto LABEL_31;
          }
          continue;
        case '-':
          result = verifyOperandCount((uint64_t)v3, 1);
          v58 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v58;
          v37 = &v3[v58];
          v59 = v3[56];
          v60 = v3[57];
          v9 = *(unsigned int *)(*(_QWORD *)&v59 + 12);
          *(_DWORD *)(*(_QWORD *)&v59 + 12) = v9 + 1;
          v61 = *(_QWORD *)&v60 + 16 * v9;
          *(_WORD *)v61 = 29489;
          *(_QWORD *)(v61 + 4) = -1;
          v62 = v3[56];
          v63 = v3[57];
          v24 = *(unsigned int *)(*(_QWORD *)&v62 + 12);
          *(_DWORD *)(*(_QWORD *)&v62 + 12) = v24 + 1;
          v62.i32[0] = v37->u16[0];
          v64 = *(_QWORD *)&v63 + 16 * v24;
          *(_WORD *)v64 = 16166;
          *(_DWORD *)(v64 + 4) = v62.i32[0];
          *(_DWORD *)(v64 + 8) = v9;
          goto LABEL_27;
        case '.':
          result = verifyOperandCount((uint64_t)v3, 1);
          v36 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v36;
          v37 = &v3[v36];
          v38 = v3[56];
          v39 = v3[57];
          v9 = *(unsigned int *)(*(_QWORD *)&v38 + 12);
          *(_DWORD *)(*(_QWORD *)&v38 + 12) = v9 + 1;
          v40 = *(_QWORD *)&v39 + 16 * v9;
          *(_WORD *)v40 = 29489;
          *(_QWORD *)(v40 + 4) = -1;
          v41 = v3[56];
          v42 = v3[57];
          v24 = *(unsigned int *)(*(_QWORD *)&v41 + 12);
          *(_DWORD *)(*(_QWORD *)&v41 + 12) = v24 + 1;
          v41.i32[0] = v37->u16[0];
          v43 = *(_QWORD *)&v42 + 16 * v24;
          *(_WORD *)v43 = 16166;
          *(_DWORD *)(v43 + 4) = v9;
          *(_DWORD *)(v43 + 8) = v41.i32[0];
LABEL_27:
          *(_DWORD *)(*(_QWORD *)&v3[57] + 16 * v37->u16[1] + 4) = v9;
LABEL_28:
          v65 = v3[32].u32[0];
          if (v65 <= 0x1F)
          {
            v3[v65].i16[0] = v24;
            if (!WORD1(v24))
              goto LABEL_30;
          }
          continue;
        default:
          continue;
      }
    }
    return result;
  }
}

uint64_t matchDup(uint64_t *a1, _QWORD *a2)
{
  uint64_t matched;
  void *(*v4)(size_t);
  void (__cdecl *v5)(void *);

  matched = 4294967293;
  if (a1)
  {
    if (a2)
    {
      v4 = (void *(*)(size_t))a2[1];
      if (v4)
      {
        v5 = (void (__cdecl *)(void *))a2[2];
        if (v5)
        {
          matched = matchInit(a1, v4, v5, a2[3]);
          if (!(_DWORD)matched)
          {
            matched = matchCopy(*a1, (uint64_t)a2);
            if ((_DWORD)matched)
              matchFree(*a1);
          }
        }
      }
    }
  }
  return matched;
}

uint64_t matchCopy(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t *v5;
  uint64_t result;
  void *v7;
  uint64_t v8;
  const void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 32))
    return 4294967293;
  v5 = (uint64_t *)(a1 + 64);
  if (*(_QWORD *)(a1 + 64) || *(_QWORD *)(a1 + 56))
    return 4294967293;
  if (*(_QWORD *)(a2 + 32))
  {
    v7 = (void *)((uint64_t (*)(_QWORD))v3)(*(_QWORD *)(a2 + 40));
    *(_QWORD *)(a1 + 32) = v7;
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 16);
      v9 = *(const void **)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = v8;
      memcpy(v7, v9, *(_QWORD *)(a2 + 40));
      if (!*(_QWORD *)(a2 + 56))
        goto LABEL_11;
      v10 = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(24, *(_QWORD *)(a1 + 24));
      *(_QWORD *)(a1 + 56) = v10;
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a2 + 32);
        *v10 = v11 + **(_QWORD **)(a2 + 56) - v12;
        *(_WORD *)(*(_QWORD *)(a1 + 56) + 16) = *(_WORD *)(*(_QWORD *)(a2 + 56) + 16);
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v11 + *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8) - v12;
        *(_WORD *)(*(_QWORD *)(a1 + 56) + 18) = *(_WORD *)(*(_QWORD *)(a2 + 56) + 18);
LABEL_11:
        v13 = *(_DWORD **)(a2 + 64);
        if (!v13)
          return 0;
        goto LABEL_14;
      }
      (*(void (**)(_QWORD, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 24));
    }
    return 4294967292;
  }
  v13 = *(_DWORD **)(a2 + 64);
  if (!v13)
    return 4294967293;
LABEL_14:
  result = nfaCopy(v5, v13, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(_QWORD *)(a1 + 24), 0);
  if (!(_DWORD)result)
    **(_QWORD **)(a1 + 64) = a1;
  return result;
}

uint64_t matchCombine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
  {
    if (!a3)
      return 0;
    return matchCombine2(a1, a3);
  }
  result = matchCombine2(a1, a2);
  if (a3 && !(_DWORD)result)
    return matchCombine2(a1, a3);
  return result;
}

uint64_t matchCombine2(uint64_t a1, uint64_t a2)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v14;

  v14 = 0;
  v4 = *(_DWORD **)(a1 + 64);
  if (!v4)
    return matchCopy(a1, a2);
  v5 = *(_DWORD **)(a2 + 64);
  if (!v5)
    return 4294967293;
  v6 = v5[3] + 1;
  v7 = v6 << 31 >> 31;
  v8 = 4294967293;
  if (v7 == v6 && (v7 & 0x8000000000000000) == 0)
  {
    v8 = nfaCopy((uint64_t *)&v14, v4, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(_QWORD *)(a1 + 24), v7);
    if (!(_DWORD)v8)
    {
      v9 = (uint64_t)v14;
      *v14 = a1;
      v10 = *(_DWORD *)(v9 + 8);
      v11 = *(unsigned int *)(v9 + 12);
      *(_DWORD *)(v9 + 12) = v11 + 1;
      v12 = v9 + 16 * v11;
      *(_WORD *)(v12 + 40) = 31782;
      *(_DWORD *)(v12 + 44) = v10;
      v8 = nfaCopyNodes(v9, (_DWORD *)(v12 + 48), v5, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8), *(uint64_t (**)(_QWORD, uint64_t))(a1 + 16), *(_QWORD *)(a1 + 24));
      if ((_DWORD)v8)
      {
        nfaFree(v9, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(_QWORD *)(a1 + 24));
      }
      else
      {
        *(_DWORD *)(v9 + 8) = v11;
        nfaFree(*(_QWORD *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(_QWORD *)(a1 + 24));
        *(_QWORD *)(a1 + 64) = v9;
      }
    }
  }
  return v8;
}

uint64_t verifyOperandCount(uint64_t result, int a2)
{
  int v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    v2 = 0;
    v3 = *(unsigned int *)(result + 256);
    v4 = v3 - 1;
    v5 = 1;
    do
    {
      if (v5 > v3 || *(_DWORD *)(result + 8 * v4 + 4) < *(_DWORD *)(result + 424))
        ++v2;
      ++v5;
      --v4;
    }
    while (a2 + 1 != v5);
    for (; v2; --v2)
    {
      v6 = *(_QWORD *)(result + 448);
      v7 = *(_QWORD *)(result + 456);
      v8 = *(unsigned int *)(v6 + 12);
      *(_DWORD *)(v6 + 12) = v8 + 1;
      v9 = v7 + 16 * v8;
      *(_WORD *)v9 = 25905;
      *(_QWORD *)(v9 + 4) = -1;
      v10 = *(unsigned int *)(result + 256);
      if (v10 <= 0x1F)
      {
        *(_WORD *)(result + 8 * v10) = v8;
        if (!WORD1(v8))
        {
          *(_WORD *)(result + 8 * *(unsigned int *)(result + 256) + 2) = v8;
          v11 = *(unsigned int *)(result + 256);
          *(_DWORD *)(result + 8 * v11 + 4) = *(_DWORD *)(result + 424);
          *(_DWORD *)(result + 256) = v11 + 1;
        }
      }
    }
  }
  return result;
}

uint64_t nfaCopy(uint64_t *a1, _DWORD *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t), uint64_t a5, int a6)
{
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;

  v11 = a2[9] + a6;
  v12 = a3(16 * v11 + 56, a5);
  if (!v12)
    return 4294967292;
  v13 = v12;
  v16 = 0;
  *(_DWORD *)(v12 + 12) = 0;
  *(_QWORD *)v12 = *(_QWORD *)a2;
  *(_DWORD *)(v12 + 32) = 0;
  *(_DWORD *)(v12 + 36) = v11;
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  v14 = nfaCopyNodes(v12, &v16, a2, a3, a4, a5);
  if ((_DWORD)v14)
  {
    a4(v13, a5);
  }
  else
  {
    *(_DWORD *)(v13 + 8) = v16;
    *(_QWORD *)v13 = 0;
    *a1 = v13;
  }
  return v14;
}

uint64_t nfaCopyNodes(uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t (*a5)(_QWORD, uint64_t), uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unint64_t v11;
  const void **v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  uint64_t v17;
  size_t v18;
  _DWORD *v19;
  _DWORD *v20;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t result;
  int v27;
  _DWORD *v28;
  _DWORD *v29;

  if (!a3[9])
    return 4294967292;
  v6 = *(unsigned int *)(a1 + 12);
  v7 = a3[3];
  if (!(_DWORD)v7)
  {
    *(_DWORD *)(a1 + 12) = v6;
LABEL_25:
    result = 0;
    *a2 = a3[2] + v6;
    return result;
  }
  v28 = a3;
  v29 = a2;
  v10 = 0;
  v27 = *(_DWORD *)(a1 + 12);
  v11 = a1 + 16 * v6 + 40;
  v12 = (const void **)(a3 + 12);
  v13 = (unsigned __int8 *)v11;
  v14 = (unsigned __int8 *)v11;
  while (1)
  {
    *(_OWORD *)v13 = *(_OWORD *)(v12 - 1);
    v16 = *v14;
    v14 += 16;
    v15 = v16;
    if (v16 <= 38)
    {
      if (v15 == 17)
        goto LABEL_10;
      if (v15 == 18)
      {
        v17 = 8 * *((unsigned __int8 *)*v12 + 6);
        goto LABEL_12;
      }
      goto LABEL_14;
    }
    if (v15 == 39)
      break;
    if (v15 == 52)
    {
LABEL_10:
      v17 = *((unsigned int *)*v12 + 1);
      goto LABEL_12;
    }
LABEL_14:
    ++v10;
    v12 += 2;
    v13 = v14;
    if (v7 == v10)
    {
      LODWORD(v6) = v27;
      *(_DWORD *)(a1 + 12) += v7;
      a3 = v28;
      a2 = v29;
      if (v27)
      {
        v21 = v11 + 16 * v7;
        do
        {
          v22 = *(_DWORD *)(v11 + 4);
          if (v22 != -1)
            *(_DWORD *)(v11 + 4) = v22 + v27;
          if (*(_BYTE *)v11 == 38)
          {
            v23 = *(_DWORD *)(v11 + 8);
            if (v23 != -1)
              *(_DWORD *)(v11 + 8) = v23 + v27;
          }
          v11 += 16;
        }
        while (v11 < v21);
      }
      goto LABEL_25;
    }
  }
  v17 = 4 * *((unsigned int *)*v12 + 1);
LABEL_12:
  v18 = v17 + 8;
  v19 = (_DWORD *)a4(v17 + 8, a6);
  if (v19)
  {
    v20 = v19;
    *((_QWORD *)v13 + 1) = v19;
    memcpy(v19, *v12, v18);
    *v20 = 1;
    goto LABEL_14;
  }
  for (; v10; --v10)
  {
    nodeModPtrRefs((unsigned __int8 *)v11, -1, a5, a6);
    v11 += 16;
  }
  return 4294967292;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return (void *)MEMORY[0x24BDAEE90](__big, __big_len, __little, __little_len);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

