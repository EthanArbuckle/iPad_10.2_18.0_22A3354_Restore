uint64_t ETLDIAGLoggingGetDefaultView(capabilities::radio *a1)
{
  if (capabilities::radio::mav20Plus(a1))
    return 2;
  else
    return 0;
}

void ETLDIAGCreateQMDL2Header(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;
  char *v4;
  char *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  _BYTE *v12;
  char *v13;
  char *v14;
  unint64_t v15;
  __int128 *v16;
  _OWORD *v17;
  unint64_t v18;
  __int128 v19;
  char *v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  size_t v32;
  _BYTE *v33;
  char *v34;
  char *v35;
  _BYTE *v36;
  char *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  size_t v49;
  char *v50;
  char *v51;
  _BYTE *v52;
  char *v53;
  char v54;
  unint64_t v55;
  char *v56;
  __int128 *v57;
  unint64_t v58;
  __int128 v59;
  _QWORD *v60;
  uint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t *v64;
  _BYTE *v65;
  _BYTE *v66;
  char v67;
  unint64_t v68;
  char *v69;
  _BYTE *v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  size_t v74;
  _BYTE *v75;
  char *v76;
  _BYTE *v77;
  char *v78;
  char v79;
  char *p_p;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  size_t v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  _OWORD *v94;
  __int128 *v95;
  unint64_t v96;
  __int128 v97;
  char v98;
  uint64_t v99;
  unint64_t v100;
  _OWORD *v101;
  __int128 *v102;
  unint64_t v103;
  __int128 v104;
  _QWORD *v105;
  uint64_t *v106;
  unint64_t v107;
  uint64_t v108;
  __int128 *v109;
  char *v110;
  unint64_t v111;
  __int128 v112;
  uint64_t *v113;
  char *v114;
  unint64_t v115;
  uint64_t v116;
  char v117;
  char *v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  unint64_t v123;
  __int128 v124;
  char *v125;
  char *v126;
  unint64_t v127;
  uint64_t v128;
  char *v129;
  char v130;
  _BYTE *v131;
  void *v132;
  unint64_t v133;
  size_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  size_t v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  _BYTE *v146;
  unint64_t v147;
  char *v148;
  unint64_t v149;
  char *v150;
  unint64_t v151;
  char *v152;
  uint64_t v153;
  unint64_t v154;
  char *v155;
  char *v156;
  unint64_t v157;
  __int128 v158;
  char *v159;
  char *v160;
  unint64_t v161;
  uint64_t v162;
  char *v163;
  char v164;
  _BYTE *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  size_t v177;
  void *v178;
  char *v179;
  uint64_t v180;
  _BYTE *v181;
  char *v182;
  char v183;
  unint64_t v184;
  _OWORD *v185;
  __int128 *v186;
  unint64_t v187;
  __int128 v188;
  _QWORD *v189;
  uint64_t *v190;
  unint64_t v191;
  uint64_t v192;
  unint64_t v193;
  __int128 *v194;
  _OWORD *v195;
  unint64_t v196;
  __int128 v197;
  char *v198;
  _QWORD *v199;
  unint64_t v200;
  uint64_t v201;
  _BYTE *v202;
  _BYTE *v203;
  uint64_t v204;
  unsigned int v205;
  unint64_t *v206;
  void *__p;
  unint64_t v208;
  uint64_t v209;

  v2 = (unint64_t *)(a1 + 56);
  insertVectorFromData<unsigned int>((_QWORD *)(a1 + 56), ((*(_DWORD *)(a1 + 16) - *(_DWORD *)(a1 + 8)) & 0xFFFFFFF0)+ 47 * (*(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 32))+ 14);
  v4 = *(char **)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v5 = v4;
  if ((unint64_t)v4 < v3)
  {
    *v4 = 2;
    v6 = v4 + 1;
    goto LABEL_32;
  }
  v7 = (char *)*v2;
  v8 = (unint64_t)&v4[-*v2];
  v9 = v8 + 1;
  if ((uint64_t)(v8 + 1) < 0)
    goto LABEL_288;
  v10 = v3 - (_QWORD)v7;
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v9;
  if (v11)
    v12 = operator new(v11);
  else
    v12 = 0;
  v13 = &v12[v8];
  v14 = &v12[v11];
  v12[v8] = 2;
  v6 = &v12[v8 + 1];
  if (v4 != v7)
  {
    if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20)
      goto LABEL_28;
    if (v8 >= 0x20)
    {
      v15 = v8 & 0xFFFFFFFFFFFFFFE0;
      v16 = (__int128 *)(v4 - 16);
      v17 = &v12[v4 - 16 - v7];
      v18 = v8 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v19 = *v16;
        *(v17 - 1) = *(v16 - 1);
        *v17 = v19;
        v17 -= 2;
        v16 -= 2;
        v18 -= 32;
      }
      while (v18);
      if (v8 == v15)
      {
LABEL_30:
        v5 = (char *)*v2;
        *(_QWORD *)(a1 + 56) = v12;
        *(_QWORD *)(a1 + 64) = v6;
        *(_QWORD *)(a1 + 72) = v14;
        if (!v5)
          goto LABEL_32;
        goto LABEL_31;
      }
      if ((v8 & 0x18) == 0)
      {
        v13 -= v15;
        v5 = &v4[-v15];
        goto LABEL_28;
      }
    }
    else
    {
      v15 = 0;
    }
    v5 = &v4[-(v8 & 0xFFFFFFFFFFFFFFF8)];
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    v20 = &v4[-v15 - 8];
    v21 = &v12[v20 - v7];
    v22 = v15 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v23 = *(_QWORD *)v20;
      v20 -= 8;
      *v21-- = v23;
      v22 += 8;
    }
    while (v22);
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_30;
LABEL_28:
    v24 = v13 - 1;
    do
    {
      v25 = *--v5;
      *v24-- = v25;
    }
    while (v5 != v7);
    goto LABEL_30;
  }
  *(_QWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v14;
  if (v4)
LABEL_31:
    operator delete(v5);
LABEL_32:
  *(_QWORD *)(a1 + 64) = v6;
  v26 = *(_QWORD *)(a1 + 72);
  if ((unint64_t)v6 >= v26)
  {
    v28 = (_BYTE *)*v2;
    v29 = (unint64_t)&v6[-*v2];
    v30 = v29 + 1;
    if ((uint64_t)(v29 + 1) >= 0)
    {
      v31 = v26 - (_QWORD)v28;
      if (2 * v31 > v30)
        v30 = 2 * v31;
      if (v31 >= 0x3FFFFFFFFFFFFFFFLL)
        v32 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v32 = v30;
      if (v32)
        v33 = operator new(v32);
      else
        v33 = 0;
      v34 = &v33[v29];
      v35 = &v33[v32];
      v33[v29] = 1;
      v27 = (uint64_t)&v33[v29 + 1];
      if (v6 == v28)
      {
        *(_QWORD *)(a1 + 56) = v34;
        *(_QWORD *)(a1 + 64) = v27;
        *(_QWORD *)(a1 + 72) = v35;
LABEL_52:
        operator delete(v6);
        goto LABEL_53;
      }
      if (v29 < 8 || (unint64_t)(v28 - v33) < 0x20)
      {
        v36 = v6;
        goto LABEL_47;
      }
      if (v29 >= 0x20)
      {
        v193 = v29 & 0xFFFFFFFFFFFFFFE0;
        v194 = (__int128 *)(v6 - 16);
        v195 = &v33[v6 - 16 - v28];
        v196 = v29 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v197 = *v194;
          *(v195 - 1) = *(v194 - 1);
          *v195 = v197;
          v195 -= 2;
          v194 -= 2;
          v196 -= 32;
        }
        while (v196);
        if (v29 == v193)
          goto LABEL_49;
        if ((v29 & 0x18) == 0)
        {
          v34 -= v193;
          v36 = &v6[-v193];
LABEL_47:
          v37 = v34 - 1;
          do
          {
            v38 = *--v36;
            *v37-- = v38;
          }
          while (v36 != v28);
          goto LABEL_49;
        }
      }
      else
      {
        v193 = 0;
      }
      v36 = &v6[-(v29 & 0xFFFFFFFFFFFFFFF8)];
      v34 -= v29 & 0xFFFFFFFFFFFFFFF8;
      v198 = &v6[-v193 - 8];
      v199 = &v33[v198 - v28];
      v200 = v193 - (v29 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v201 = *(_QWORD *)v198;
        v198 -= 8;
        *v199-- = v201;
        v200 += 8;
      }
      while (v200);
      if (v29 != (v29 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_47;
LABEL_49:
      v6 = *(_BYTE **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v33;
      *(_QWORD *)(a1 + 64) = v27;
      *(_QWORD *)(a1 + 72) = v35;
      if (!v6)
        goto LABEL_53;
      goto LABEL_52;
    }
LABEL_288:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  *v6 = 1;
  v27 = (uint64_t)(v6 + 1);
LABEL_53:
  *(_QWORD *)(a1 + 64) = v27;
  v206 = v2;
  insertVectorFromData<unsigned int>(v2, (*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 4);
  v39 = *(_QWORD *)(a1 + 8);
  v204 = *(_QWORD *)(a1 + 16);
  if (v39 == v204)
    goto LABEL_91;
  while (2)
  {
    insertVectorFromData<unsigned int>(v206, *(_DWORD *)v39);
    insertVectorFromData<unsigned short>(v206, *(_WORD *)(v39 + 4));
    insertVectorFromData<unsigned short>(v206, *(_WORD *)(v39 + 6));
    v40 = 0;
    v41 = *(_BYTE **)(a1 + 64);
    do
    {
      v43 = *(_BYTE *)(v39 + v40 + 8);
      v44 = *(_QWORD *)(a1 + 72);
      if ((unint64_t)v41 < v44)
      {
        *v41 = v43;
        v42 = (uint64_t)(v41 + 1);
        goto LABEL_58;
      }
      v45 = *v206;
      v46 = (unint64_t)&v41[-*v206];
      v47 = v46 + 1;
      if ((uint64_t)(v46 + 1) < 0)
        goto LABEL_288;
      v48 = v44 - v45;
      if (2 * v48 > v47)
        v47 = 2 * v48;
      if (v48 >= 0x3FFFFFFFFFFFFFFFLL)
        v49 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v49 = v47;
      if (!v49)
      {
        v50 = 0;
        v51 = &v41[-*v206];
        *(_BYTE *)v46 = v43;
        v42 = v46 + 1;
        if (v41 == (_BYTE *)v45)
          goto LABEL_75;
LABEL_70:
        if (v46 < 8
          || &v50[v46 - 1] - &v41[~v45] > (unint64_t)&v50[v46 - 1]
          || v45 > (unint64_t)(v41 - 1)
          || v45 - (unint64_t)v50 < 0x20)
        {
          v52 = v41;
        }
        else
        {
          if (v46 < 0x20)
          {
            v55 = 0;
            goto LABEL_86;
          }
          v55 = v46 & 0xFFFFFFFFFFFFFFE0;
          v56 = &v50[v46 - 16];
          v57 = (__int128 *)(v41 - 16);
          v58 = v46 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v59 = *v57;
            *((_OWORD *)v56 - 1) = *(v57 - 1);
            *(_OWORD *)v56 = v59;
            v56 -= 32;
            v57 -= 2;
            v58 -= 32;
          }
          while (v58);
          if (v46 == v55)
            goto LABEL_74;
          if ((v46 & 0x18) != 0)
          {
LABEL_86:
            v52 = &v41[-(v46 & 0xFFFFFFFFFFFFFFF8)];
            v51 -= v46 & 0xFFFFFFFFFFFFFFF8;
            v60 = &v41[-v55 - v45 - 8 + (_QWORD)v50];
            v61 = (uint64_t *)&v41[-v55 - 8];
            v62 = v55 - (v46 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              v63 = *v61--;
              *v60-- = v63;
              v62 += 8;
            }
            while (v62);
            if (v46 == (v46 & 0xFFFFFFFFFFFFFFF8))
              goto LABEL_74;
            goto LABEL_72;
          }
          v51 -= v55;
          v52 = &v41[-v55];
        }
LABEL_72:
        v53 = v51 - 1;
        do
        {
          v54 = *--v52;
          *v53-- = v54;
        }
        while (v52 != (_BYTE *)v45);
LABEL_74:
        v41 = (_BYTE *)*v206;
        v51 = v50;
        goto LABEL_75;
      }
      v50 = (char *)operator new(v49);
      v51 = &v50[v46];
      v50[v46] = v43;
      v42 = (uint64_t)&v50[v46 + 1];
      if (v41 != (_BYTE *)v45)
        goto LABEL_70;
LABEL_75:
      *(_QWORD *)(a1 + 56) = v51;
      *(_QWORD *)(a1 + 64) = v42;
      *(_QWORD *)(a1 + 72) = &v50[v49];
      if (v41)
        operator delete(v41);
LABEL_58:
      *(_QWORD *)(a1 + 64) = v42;
      ++v40;
      v41 = (_BYTE *)v42;
    }
    while (v40 != 8);
    v39 += 16;
    if (v39 != v204)
      continue;
    break;
  }
LABEL_91:
  v64 = v206;
  insertVectorFromData<unsigned int>(v206, *(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 32));
  v208 = 0xAAAAAAAAAAAAAAAALL;
  v209 = 0x5AAAAAAAAAAAAAALL;
  __p = (void *)0xAAAA006D65646F6DLL;
  v65 = *(_BYTE **)(a1 + 32);
  v202 = *(_BYTE **)(a1 + 40);
  if (v65 == v202)
    return;
  v205 = 0;
  v66 = *(_BYTE **)(a1 + 64);
  while (2)
  {
    v203 = v65;
    v67 = *v65;
    v68 = *(_QWORD *)(a1 + 72);
    if ((unint64_t)v66 < v68)
    {
      *v66 = v67;
      v69 = v66 + 1;
      goto LABEL_114;
    }
    v70 = (_BYTE *)*v64;
    v71 = (unint64_t)&v66[-*v64];
    v72 = v71 + 1;
    if ((uint64_t)(v71 + 1) < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v73 = v68 - (_QWORD)v70;
    if (2 * v73 > v72)
      v72 = 2 * v73;
    if (v73 >= 0x3FFFFFFFFFFFFFFFLL)
      v74 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v74 = v72;
    if (!v74)
    {
      v75 = 0;
      v76 = &v66[-*v64];
      *(_BYTE *)v71 = v67;
      v69 = (char *)(v71 + 1);
      if (v66 != v70)
        goto LABEL_104;
LABEL_112:
      *(_QWORD *)(a1 + 56) = v76;
      *(_QWORD *)(a1 + 64) = v69;
      *(_QWORD *)(a1 + 72) = &v75[v74];
      if (!v66)
        goto LABEL_114;
      goto LABEL_113;
    }
    v75 = operator new(v74);
    v76 = &v75[v71];
    v75[v71] = v67;
    v69 = &v75[v71 + 1];
    if (v66 == v70)
      goto LABEL_112;
LABEL_104:
    if (v71 < 8 || (unint64_t)(v70 - v75) < 0x20)
    {
      v77 = v66;
      goto LABEL_107;
    }
    if (v71 >= 0x20)
    {
      v100 = v71 & 0xFFFFFFFFFFFFFFE0;
      v101 = &v75[v71 - 16];
      v102 = (__int128 *)(v66 - 16);
      v103 = v71 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v104 = *v102;
        *(v101 - 1) = *(v102 - 1);
        *v101 = v104;
        v101 -= 2;
        v102 -= 2;
        v103 -= 32;
      }
      while (v103);
      if (v71 != v100)
      {
        if ((v71 & 0x18) == 0)
        {
          v76 -= v100;
          v77 = &v66[-v100];
          goto LABEL_107;
        }
        goto LABEL_148;
      }
    }
    else
    {
      v100 = 0;
LABEL_148:
      v77 = &v66[-(v71 & 0xFFFFFFFFFFFFFFF8)];
      v76 -= v71 & 0xFFFFFFFFFFFFFFF8;
      v105 = &v75[&v66[-v100] - v70 - 8];
      v106 = (uint64_t *)&v66[-v100 - 8];
      v107 = v100 - (v71 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v108 = *v106--;
        *v105-- = v108;
        v107 += 8;
      }
      while (v107);
      if (v71 != (v71 & 0xFFFFFFFFFFFFFFF8))
      {
LABEL_107:
        v78 = v76 - 1;
        do
        {
          v79 = *--v77;
          *v78-- = v79;
        }
        while (v77 != v70);
      }
    }
    v66 = (_BYTE *)*v64;
    *(_QWORD *)(a1 + 56) = v75;
    *(_QWORD *)(a1 + 64) = v69;
    *(_QWORD *)(a1 + 72) = &v75[v74];
    if (v66)
LABEL_113:
      operator delete(v66);
LABEL_114:
    *(_QWORD *)(a1 + 64) = v69;
    if (v209 >= 0)
      p_p = (char *)&__p;
    else
      p_p = (char *)__p;
    if (v209 >= 0)
      v81 = HIBYTE(v209);
    else
      v81 = v208;
    if ((uint64_t)v81 < 1)
      goto LABEL_185;
    v82 = *(_QWORD *)(a1 + 72);
    if (v82 - (uint64_t)v69 >= (uint64_t)v81)
    {
      v92 = p_p;
      v93 = v69;
      if (v81 < 0x20)
        goto LABEL_295;
      v92 = p_p;
      v93 = v69;
      if ((unint64_t)(v69 - p_p) < 0x20)
        goto LABEL_295;
      v92 = &p_p[v81 & 0xFFFFFFFFFFFFFFE0];
      v93 = &v69[v81 & 0xFFFFFFFFFFFFFFE0];
      v94 = v69 + 16;
      v95 = (__int128 *)(p_p + 16);
      v96 = v81 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v97 = *v95;
        *(v94 - 1) = *(v95 - 1);
        *v94 = v97;
        v94 += 2;
        v95 += 2;
        v96 -= 32;
      }
      while (v96);
      if (v81 != (v81 & 0x7FFFFFFFFFFFFFE0))
      {
LABEL_295:
        do
        {
          v98 = *v92++;
          *v93++ = v98;
        }
        while (v92 != &p_p[v81]);
      }
      *(_QWORD *)(a1 + 64) = v93;
      goto LABEL_185;
    }
    v83 = *(char **)(a1 + 56);
    v84 = v69 - v83;
    v85 = v69 - v83 + v81;
    if (v85 < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v86 = v82 - (_QWORD)v83;
    if (2 * v86 > v85)
      v85 = 2 * v86;
    if (v86 >= 0x3FFFFFFFFFFFFFFFLL)
      v87 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v87 = v85;
    if (!v87)
    {
      v88 = 0;
      v89 = (char *)(v69 - v83);
      v90 = (char *)(v84 + v81);
      if (v81 >= 8)
        goto LABEL_139;
LABEL_130:
      v91 = v89;
      goto LABEL_162;
    }
    v88 = (char *)operator new(v87);
    v89 = &v88[v84];
    v90 = &v88[v84 + v81];
    if (v81 < 8)
      goto LABEL_130;
LABEL_139:
    v91 = v89;
    if ((char *)(&v88[(_QWORD)v69] - v83 - (_QWORD)p_p) < (char *)0x20)
    {
      do
      {
LABEL_162:
        v117 = *p_p++;
        *v91++ = v117;
      }
      while (v91 != v90);
      goto LABEL_163;
    }
    if (v81 >= 0x20)
    {
      v99 = v81 & 0x7FFFFFFFFFFFFFE0;
      v109 = (__int128 *)(p_p + 16);
      v110 = &v88[v84 + 16];
      v111 = v81 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v112 = *v109;
        *((_OWORD *)v110 - 1) = *(v109 - 1);
        *(_OWORD *)v110 = v112;
        v109 += 2;
        v110 += 32;
        v111 -= 32;
      }
      while (v111);
      if (v81 == v99)
        goto LABEL_163;
      if ((v81 & 0x18) != 0)
        goto LABEL_156;
      p_p += v99;
      v91 = &v89[v99];
      goto LABEL_162;
    }
    v99 = 0;
LABEL_156:
    v91 = &v89[v81 & 0xFFFFFFFFFFFFFFF8];
    v113 = (uint64_t *)&p_p[v99];
    v114 = &v88[&v69[v99] - v83];
    v115 = v99 - (v81 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v116 = *v113++;
      *(_QWORD *)v114 = v116;
      v114 += 8;
      v115 += 8;
    }
    while (v115);
    p_p += v81 & 0xFFFFFFFFFFFFFFF8;
    if (v81 != (v81 & 0x7FFFFFFFFFFFFFF8))
      goto LABEL_162;
LABEL_163:
    if (v69 == v83)
    {
      v119 = 0;
      v64 = v206;
    }
    else
    {
      if (v84 < 8)
      {
        v118 = v69;
        goto LABEL_179;
      }
      v118 = v69;
      if ((unint64_t)(v83 - v88) < 0x20)
        goto LABEL_179;
      if (v84 >= 0x20)
      {
        v120 = v84 & 0xFFFFFFFFFFFFFFE0;
        v121 = &v88[v84 - 16];
        v122 = v69 - 16;
        v123 = v84 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v124 = *(_OWORD *)v122;
          *((_OWORD *)v121 - 1) = *((_OWORD *)v122 - 1);
          *(_OWORD *)v121 = v124;
          v121 -= 32;
          v122 -= 32;
          v123 -= 32;
        }
        while (v123);
        if (v84 != v120)
        {
          if ((v84 & 0x18) == 0)
          {
            v89 -= v120;
            v118 = &v69[-v120];
            goto LABEL_179;
          }
          goto LABEL_174;
        }
      }
      else
      {
        v120 = 0;
LABEL_174:
        v118 = &v69[-(v84 & 0xFFFFFFFFFFFFFFF8)];
        v89 -= v84 & 0xFFFFFFFFFFFFFFF8;
        v125 = &v88[&v69[-v120] - v83 - 8];
        v126 = &v69[-v120 - 8];
        v127 = v120 - (v84 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          v128 = *(_QWORD *)v126;
          v126 -= 8;
          *(_QWORD *)v125 = v128;
          v125 -= 8;
          v127 += 8;
        }
        while (v127);
        if (v84 != (v84 & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_179:
          v129 = v89 - 1;
          do
          {
            v130 = *--v118;
            *v129-- = v130;
          }
          while (v118 != v83);
        }
      }
      v131 = *(_BYTE **)(a1 + 64);
      v89 = v88;
      v119 = v131 - v69;
      v64 = v206;
      if (v131 != v69)
        memmove(v90, v69, v131 - v69);
    }
    v132 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v89;
    *(_QWORD *)(a1 + 64) = &v90[v119];
    *(_QWORD *)(a1 + 72) = &v88[v87];
    if (v132)
      operator delete(v132);
LABEL_185:
    v133 = HIBYTE(v209);
    if (v209 < 0)
      v133 = v208;
    if (v133 == 30)
      goto LABEL_238;
    v134 = 30 - v133;
    v136 = *(char **)(a1 + 64);
    v135 = *(_QWORD *)(a1 + 72);
    if (v135 - (uint64_t)v136 >= v134)
    {
      if (v134)
      {
        bzero(*(void **)(a1 + 64), v134);
        *(_QWORD *)(a1 + 64) = &v136[v134];
      }
      else
      {
        v146 = *(_BYTE **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v146;
        if (v146 != v136)
          memmove(v136, v136, v146 - v136);
        bzero(v136, 0);
      }
      goto LABEL_238;
    }
    v137 = *(char **)(a1 + 56);
    v138 = v136 - v137;
    v139 = v136 - v137 + v134;
    if (v139 < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v140 = v135 - (_QWORD)v137;
    if (2 * v140 > v139)
      v139 = 2 * v140;
    if (v140 >= 0x3FFFFFFFFFFFFFFFLL)
      v141 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v141 = v139;
    if (!v141)
    {
      v142 = 0;
      v143 = (char *)(v136 - v137);
      v144 = (char *)(v138 + v134);
      v145 = (char *)(v136 - v137);
      if (v134 >= 8)
        goto LABEL_204;
      goto LABEL_215;
    }
    v142 = (char *)operator new(v141);
    v143 = &v142[v138];
    v144 = &v142[v138 + v134];
    v145 = &v142[v138];
    if (v134 < 8)
    {
      do
LABEL_215:
        *v145++ = 0;
      while (v145 != v144);
      goto LABEL_216;
    }
LABEL_204:
    if (v134 >= 0x20)
    {
      v147 = v134 & 0xFFFFFFFFFFFFFFE0;
      v148 = &v142[v138 + 16];
      v149 = v134 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        *((_OWORD *)v148 - 1) = 0uLL;
        *(_OWORD *)v148 = 0uLL;
        v148 += 32;
        v149 -= 32;
      }
      while (v149);
      if (v134 == v147)
        goto LABEL_216;
      if ((v134 & 0x18) != 0)
        goto LABEL_210;
      v145 = &v143[v147];
      goto LABEL_215;
    }
    v147 = 0;
LABEL_210:
    v145 = &v143[v134 & 0xFFFFFFFFFFFFFFF8];
    v150 = &v142[&v136[v147] - v137];
    v151 = v147 - (v134 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *(_QWORD *)v150 = 0;
      v150 += 8;
      v151 += 8;
    }
    while (v151);
    if (v134 != (v134 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_215;
LABEL_216:
    if (v136 == v137)
    {
      v153 = 0;
    }
    else
    {
      if (v138 < 8)
      {
        v152 = v136;
        goto LABEL_232;
      }
      v152 = v136;
      if ((unint64_t)(v137 - v142) < 0x20)
        goto LABEL_232;
      if (v138 >= 0x20)
      {
        v154 = v138 & 0xFFFFFFFFFFFFFFE0;
        v155 = &v142[v138 - 16];
        v156 = v136 - 16;
        v157 = v138 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v158 = *(_OWORD *)v156;
          *((_OWORD *)v155 - 1) = *((_OWORD *)v156 - 1);
          *(_OWORD *)v155 = v158;
          v155 -= 32;
          v156 -= 32;
          v157 -= 32;
        }
        while (v157);
        if (v138 != v154)
        {
          if ((v138 & 0x18) == 0)
          {
            v143 -= v154;
            v152 = &v136[-v154];
            goto LABEL_232;
          }
          goto LABEL_227;
        }
      }
      else
      {
        v154 = 0;
LABEL_227:
        v152 = &v136[-(v138 & 0xFFFFFFFFFFFFFFF8)];
        v143 -= v138 & 0xFFFFFFFFFFFFFFF8;
        v159 = &v142[&v136[-v154] - v137 - 8];
        v160 = &v136[-v154 - 8];
        v161 = v154 - (v138 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          v162 = *(_QWORD *)v160;
          v160 -= 8;
          *(_QWORD *)v159 = v162;
          v159 -= 8;
          v161 += 8;
        }
        while (v161);
        if (v138 != (v138 & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_232:
          v163 = v143 - 1;
          do
          {
            v164 = *--v152;
            *v163-- = v164;
          }
          while (v152 != v137);
        }
      }
      v165 = *(_BYTE **)(a1 + 64);
      v143 = v142;
      v153 = v165 - v136;
      if (v165 != v136)
        memmove(v144, v136, v165 - v136);
    }
    v166 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v143;
    *(_QWORD *)(a1 + 64) = &v144[v153];
    *(_QWORD *)(a1 + 72) = &v142[v141];
    v64 = v206;
    if (v166)
      operator delete(v166);
LABEL_238:
    v167 = *(_QWORD *)(a1 + 8);
    insertVectorFromData<unsigned int>(v64, *(_DWORD *)(v167 + 16 * v205));
    v168 = v205;
    v169 = v167 + 16 * v205;
    insertVectorFromData<unsigned short>(v64, *(_WORD *)(v169 + 4));
    insertVectorFromData<unsigned short>(v64, *(_WORD *)(v169 + 6));
    v170 = 0;
    ++v205;
    v66 = *(_BYTE **)(a1 + 64);
    while (2)
    {
      while (1)
      {
        v171 = *(_BYTE *)(v167 + 16 * v168 + v170 + 8);
        v172 = *(_QWORD *)(a1 + 72);
        if ((unint64_t)v66 >= v172)
          break;
        *v66++ = v171;
        *(_QWORD *)(a1 + 64) = v66;
        if (++v170 == 8)
          goto LABEL_93;
      }
      v173 = *v64;
      v174 = (unint64_t)&v66[-v173];
      v175 = (uint64_t)&v66[-v173 + 1];
      if (v175 < 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v176 = v172 - v173;
      if (2 * v176 > v175)
        v175 = 2 * v176;
      if (v176 >= 0x3FFFFFFFFFFFFFFFLL)
        v177 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v177 = v175;
      if (v177)
      {
        v178 = operator new(v177);
        v179 = (char *)v178 + v174;
        *((_BYTE *)v178 + v174) = v171;
        v180 = (uint64_t)v178 + v174 + 1;
        if (v66 != (_BYTE *)v173)
        {
LABEL_249:
          if (v174 < 8
            || v178 > &v66[(_QWORD)v178 - v173 - 1]
            || v173 > (unint64_t)(v66 - 1)
            || v173 - (unint64_t)v178 < 0x20)
          {
            v181 = v66;
          }
          else if (v174 >= 0x20)
          {
            v184 = v174 & 0xFFFFFFFFFFFFFFE0;
            v185 = (char *)v178 + v174 - 16;
            v186 = (__int128 *)(v66 - 16);
            v187 = v174 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v188 = *v186;
              *(v185 - 1) = *(v186 - 1);
              *v185 = v188;
              v185 -= 2;
              v186 -= 2;
              v187 -= 32;
            }
            while (v187);
            if (v174 == v184)
              goto LABEL_253;
            if ((v174 & 0x18) != 0)
              goto LABEL_269;
            v179 -= v184;
            v181 = &v66[-v184];
          }
          else
          {
            v184 = 0;
LABEL_269:
            v181 = &v66[-(v174 & 0xFFFFFFFFFFFFFFF8)];
            v179 -= v174 & 0xFFFFFFFFFFFFFFF8;
            v189 = &v66[-v184 - v173 - 8 + (_QWORD)v178];
            v190 = (uint64_t *)&v66[-v184 - 8];
            v191 = v184 - (v174 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              v192 = *v190--;
              *v189-- = v192;
              v191 += 8;
            }
            while (v191);
            if (v174 == (v174 & 0xFFFFFFFFFFFFFFF8))
            {
LABEL_253:
              v64 = v206;
              v66 = (_BYTE *)*v206;
              *(_QWORD *)(a1 + 56) = v178;
              *(_QWORD *)(a1 + 64) = v180;
              *(_QWORD *)(a1 + 72) = (char *)v178 + v177;
              if (v66)
                goto LABEL_254;
              goto LABEL_255;
            }
          }
          v182 = v179 - 1;
          do
          {
            v183 = *--v181;
            *v182-- = v183;
          }
          while (v181 != (_BYTE *)v173);
          goto LABEL_253;
        }
      }
      else
      {
        v178 = 0;
        v179 = &v66[-v173];
        *(_BYTE *)v174 = v171;
        v180 = v174 + 1;
        if (v66 != (_BYTE *)v173)
          goto LABEL_249;
      }
      v64 = v206;
      *(_QWORD *)(a1 + 56) = v179;
      *(_QWORD *)(a1 + 64) = v180;
      *(_QWORD *)(a1 + 72) = (char *)v178 + v177;
      if (v66)
LABEL_254:
        operator delete(v66);
LABEL_255:
      v66 = (_BYTE *)v180;
      *(_QWORD *)(a1 + 64) = v180;
      if (++v170 != 8)
        continue;
      break;
    }
LABEL_93:
    v65 = v203 + 1;
    if (v203 + 1 != v202)
      continue;
    break;
  }
  if (SHIBYTE(v209) < 0)
    operator delete(__p);
}

void sub_212EAA48C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void insertVectorFromData<unsigned int>(_QWORD *a1, int a2)
{
  unint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  __int128 *v17;
  _OWORD *v18;
  unint64_t v19;
  __int128 v20;
  char *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  unint64_t v27;
  char *v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  size_t v34;
  _BYTE *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char v40;
  char *v41;
  unint64_t v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  size_t v47;
  _BYTE *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char v53;
  uint64_t v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  size_t v59;
  _BYTE *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  __int128 *v69;
  _OWORD *v70;
  unint64_t v71;
  __int128 v72;
  char *v73;
  _QWORD *v74;
  unint64_t v75;
  uint64_t v76;
  __int128 *v77;
  _OWORD *v78;
  unint64_t v79;
  __int128 v80;
  char *v81;
  _QWORD *v82;
  unint64_t v83;
  uint64_t v84;
  __int128 *v85;
  _OWORD *v86;
  unint64_t v87;
  __int128 v88;
  char *v89;
  _QWORD *v90;
  unint64_t v91;
  uint64_t v92;

  v5 = (char *)a1[1];
  v4 = a1[2];
  v6 = v5;
  if ((unint64_t)v5 < v4)
  {
    *v5 = a2;
    v7 = v5 + 1;
    goto LABEL_31;
  }
  v8 = (char *)*a1;
  v9 = (unint64_t)&v5[-*a1];
  v10 = v9 + 1;
  if ((uint64_t)(v9 + 1) < 0)
    goto LABEL_128;
  v11 = v4 - (_QWORD)v8;
  if (2 * v11 > v10)
    v10 = 2 * v11;
  if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = v10;
  if (v12)
  {
    v13 = operator new(v12);
    v14 = &v13[v9];
    v15 = &v13[v12];
    v13[v9] = a2;
    v7 = &v13[v9 + 1];
    if (v5 != v8)
    {
LABEL_11:
      if (v9 < 8 || (unint64_t)(v8 - v13) < 0x20)
        goto LABEL_27;
      if (v9 >= 0x20)
      {
        v16 = v9 & 0xFFFFFFFFFFFFFFE0;
        v17 = (__int128 *)(v5 - 16);
        v18 = &v13[v5 - 16 - v8];
        v19 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v20 = *v17;
          *(v18 - 1) = *(v17 - 1);
          *v18 = v20;
          v18 -= 2;
          v17 -= 2;
          v19 -= 32;
        }
        while (v19);
        if (v9 == v16)
        {
LABEL_29:
          v6 = (char *)*a1;
          *a1 = v13;
          a1[1] = v7;
          a1[2] = v15;
          if (!v6)
            goto LABEL_31;
          goto LABEL_30;
        }
        if ((v9 & 0x18) == 0)
        {
          v14 -= v16;
          v6 = &v5[-v16];
          goto LABEL_27;
        }
      }
      else
      {
        v16 = 0;
      }
      v6 = &v5[-(v9 & 0xFFFFFFFFFFFFFFF8)];
      v14 -= v9 & 0xFFFFFFFFFFFFFFF8;
      v21 = &v5[-v16 - 8];
      v22 = &v13[v21 - v8];
      v23 = v16 - (v9 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v24 = *(_QWORD *)v21;
        v21 -= 8;
        *v22-- = v24;
        v23 += 8;
      }
      while (v23);
      if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_29;
LABEL_27:
      v25 = v14 - 1;
      do
      {
        v26 = *--v6;
        *v25-- = v26;
      }
      while (v6 != v8);
      goto LABEL_29;
    }
  }
  else
  {
    v13 = 0;
    v14 = &v5[-*a1];
    v15 = 0;
    *(_BYTE *)v9 = a2;
    v7 = (char *)(v9 + 1);
    if (v5 != v8)
      goto LABEL_11;
  }
  *a1 = v14;
  a1[1] = v7;
  a1[2] = v15;
  if (v5)
LABEL_30:
    operator delete(v6);
LABEL_31:
  a1[1] = v7;
  v27 = a1[2];
  if ((unint64_t)v7 >= v27)
  {
    v30 = (char *)*a1;
    v31 = (unint64_t)&v7[-*a1];
    v32 = v31 + 1;
    if ((uint64_t)(v31 + 1) < 0)
      goto LABEL_128;
    v33 = v27 - (_QWORD)v30;
    if (2 * v33 > v32)
      v32 = 2 * v33;
    if (v33 >= 0x3FFFFFFFFFFFFFFFLL)
      v34 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v34 = v32;
    if (v34)
      v35 = operator new(v34);
    else
      v35 = 0;
    v36 = &v35[v31];
    v37 = &v35[v34];
    v35[v31] = BYTE1(a2);
    v28 = &v35[v31 + 1];
    if (v7 == v30)
    {
      *a1 = v36;
      a1[1] = v28;
      a1[2] = v37;
LABEL_54:
      operator delete(v7);
      a1[1] = v28;
      v29 = a1[2];
      if ((unint64_t)v28 < v29)
        goto LABEL_51;
      goto LABEL_55;
    }
    if (v31 < 8 || (unint64_t)(v30 - v35) < 0x20)
    {
      v38 = v7;
      goto LABEL_47;
    }
    if (v31 >= 0x20)
    {
      v66 = v31 & 0xFFFFFFFFFFFFFFE0;
      v69 = (__int128 *)(v7 - 16);
      v70 = &v35[v7 - 16 - v30];
      v71 = v31 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v72 = *v69;
        *(v70 - 1) = *(v69 - 1);
        *v70 = v72;
        v70 -= 2;
        v69 -= 2;
        v71 -= 32;
      }
      while (v71);
      if (v31 == v66)
        goto LABEL_49;
      if ((v31 & 0x18) == 0)
      {
        v36 -= v66;
        v38 = &v7[-v66];
LABEL_47:
        v39 = v36 - 1;
        do
        {
          v40 = *--v38;
          *v39-- = v40;
        }
        while (v38 != v30);
        goto LABEL_49;
      }
    }
    else
    {
      v66 = 0;
    }
    v38 = &v7[-(v31 & 0xFFFFFFFFFFFFFFF8)];
    v36 -= v31 & 0xFFFFFFFFFFFFFFF8;
    v73 = &v7[-v66 - 8];
    v74 = &v35[v73 - v30];
    v75 = v66 - (v31 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v76 = *(_QWORD *)v73;
      v73 -= 8;
      *v74-- = v76;
      v75 += 8;
    }
    while (v75);
    if (v31 != (v31 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_47;
LABEL_49:
    v7 = (char *)*a1;
    *a1 = v35;
    a1[1] = v28;
    a1[2] = v37;
    if (!v7)
    {
      a1[1] = v28;
      v29 = a1[2];
      if ((unint64_t)v28 < v29)
        goto LABEL_51;
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  *v7 = BYTE1(a2);
  v28 = v7 + 1;
  a1[1] = v7 + 1;
  v29 = a1[2];
  if ((unint64_t)(v7 + 1) < v29)
  {
LABEL_51:
    *v28 = BYTE2(a2);
    v41 = v28 + 1;
    a1[1] = v28 + 1;
    v42 = a1[2];
    if ((unint64_t)(v28 + 1) < v42)
      goto LABEL_72;
LABEL_75:
    v55 = (char *)*a1;
    v56 = (unint64_t)&v41[-*a1];
    v57 = v56 + 1;
    if ((uint64_t)(v56 + 1) >= 0)
    {
      v58 = v42 - (_QWORD)v55;
      if (2 * v58 > v57)
        v57 = 2 * v58;
      if (v58 >= 0x3FFFFFFFFFFFFFFFLL)
        v59 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v59 = v57;
      if (v59)
        v60 = operator new(v59);
      else
        v60 = 0;
      v61 = &v60[v56];
      v62 = &v60[v59];
      v60[v56] = HIBYTE(a2);
      v54 = (uint64_t)&v60[v56 + 1];
      if (v41 == v55)
      {
        *a1 = v61;
        a1[1] = v54;
        a1[2] = v62;
LABEL_93:
        operator delete(v41);
        goto LABEL_94;
      }
      if (v56 < 8 || (unint64_t)(v55 - v60) < 0x20)
      {
        v63 = v41;
        goto LABEL_88;
      }
      if (v56 >= 0x20)
      {
        v68 = v56 & 0xFFFFFFFFFFFFFFE0;
        v85 = (__int128 *)(v41 - 16);
        v86 = &v60[v41 - 16 - v55];
        v87 = v56 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v88 = *v85;
          *(v86 - 1) = *(v85 - 1);
          *v86 = v88;
          v86 -= 2;
          v85 -= 2;
          v87 -= 32;
        }
        while (v87);
        if (v56 == v68)
          goto LABEL_90;
        if ((v56 & 0x18) == 0)
        {
          v61 -= v68;
          v63 = &v41[-v68];
LABEL_88:
          v64 = v61 - 1;
          do
          {
            v65 = *--v63;
            *v64-- = v65;
          }
          while (v63 != v55);
          goto LABEL_90;
        }
      }
      else
      {
        v68 = 0;
      }
      v63 = &v41[-(v56 & 0xFFFFFFFFFFFFFFF8)];
      v61 -= v56 & 0xFFFFFFFFFFFFFFF8;
      v89 = &v41[-v68 - 8];
      v90 = &v60[v89 - v55];
      v91 = v68 - (v56 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v92 = *(_QWORD *)v89;
        v89 -= 8;
        *v90-- = v92;
        v91 += 8;
      }
      while (v91);
      if (v56 != (v56 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_88;
LABEL_90:
      v41 = (char *)*a1;
      *a1 = v60;
      a1[1] = v54;
      a1[2] = v62;
      if (!v41)
        goto LABEL_94;
      goto LABEL_93;
    }
LABEL_128:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
LABEL_55:
  v43 = (char *)*a1;
  v44 = (unint64_t)&v28[-*a1];
  v45 = v44 + 1;
  if ((uint64_t)(v44 + 1) < 0)
    goto LABEL_128;
  v46 = v29 - (_QWORD)v43;
  if (2 * v46 > v45)
    v45 = 2 * v46;
  if (v46 >= 0x3FFFFFFFFFFFFFFFLL)
    v47 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v47 = v45;
  if (v47)
    v48 = operator new(v47);
  else
    v48 = 0;
  v49 = &v48[v44];
  v50 = &v48[v47];
  v48[v44] = BYTE2(a2);
  v41 = &v48[v44 + 1];
  if (v28 == v43)
  {
    *a1 = v49;
    a1[1] = v41;
    a1[2] = v50;
    goto LABEL_74;
  }
  if (v44 < 8 || (unint64_t)(v43 - v48) < 0x20)
  {
    v51 = v28;
    goto LABEL_68;
  }
  if (v44 >= 0x20)
  {
    v67 = v44 & 0xFFFFFFFFFFFFFFE0;
    v77 = (__int128 *)(v28 - 16);
    v78 = &v48[v28 - 16 - v43];
    v79 = v44 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v80 = *v77;
      *(v78 - 1) = *(v77 - 1);
      *v78 = v80;
      v78 -= 2;
      v77 -= 2;
      v79 -= 32;
    }
    while (v79);
    if (v44 == v67)
      goto LABEL_70;
    if ((v44 & 0x18) == 0)
    {
      v49 -= v67;
      v51 = &v28[-v67];
LABEL_68:
      v52 = v49 - 1;
      do
      {
        v53 = *--v51;
        *v52-- = v53;
      }
      while (v51 != v43);
      goto LABEL_70;
    }
  }
  else
  {
    v67 = 0;
  }
  v51 = &v28[-(v44 & 0xFFFFFFFFFFFFFFF8)];
  v49 -= v44 & 0xFFFFFFFFFFFFFFF8;
  v81 = &v28[-v67 - 8];
  v82 = &v48[v81 - v43];
  v83 = v67 - (v44 & 0xFFFFFFFFFFFFFFF8);
  do
  {
    v84 = *(_QWORD *)v81;
    v81 -= 8;
    *v82-- = v84;
    v83 += 8;
  }
  while (v83);
  if (v44 != (v44 & 0xFFFFFFFFFFFFFFF8))
    goto LABEL_68;
LABEL_70:
  v28 = (char *)*a1;
  *a1 = v48;
  a1[1] = v41;
  a1[2] = v50;
  if (!v28)
  {
    a1[1] = v41;
    v42 = a1[2];
    if ((unint64_t)v41 >= v42)
      goto LABEL_75;
    goto LABEL_72;
  }
LABEL_74:
  operator delete(v28);
  a1[1] = v41;
  v42 = a1[2];
  if ((unint64_t)v41 >= v42)
    goto LABEL_75;
LABEL_72:
  *v41 = HIBYTE(a2);
  v54 = (uint64_t)(v41 + 1);
LABEL_94:
  a1[1] = v54;
}

void insertVectorFromData<unsigned short>(_QWORD *a1, __int16 a2)
{
  unint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  __int128 *v17;
  _OWORD *v18;
  unint64_t v19;
  __int128 v20;
  char *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  _BYTE *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char v39;
  unint64_t v40;
  __int128 *v41;
  _OWORD *v42;
  unint64_t v43;
  __int128 v44;
  char *v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;

  v5 = (char *)a1[1];
  v4 = a1[2];
  v6 = v5;
  if ((unint64_t)v5 < v4)
  {
    *v5 = a2;
    v7 = v5 + 1;
    goto LABEL_31;
  }
  v8 = (char *)*a1;
  v9 = (unint64_t)&v5[-*a1];
  v10 = v9 + 1;
  if ((uint64_t)(v9 + 1) < 0)
    goto LABEL_64;
  v11 = v4 - (_QWORD)v8;
  if (2 * v11 > v10)
    v10 = 2 * v11;
  if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = v10;
  if (v12)
  {
    v13 = operator new(v12);
    v14 = &v13[v9];
    v15 = &v13[v12];
    v13[v9] = a2;
    v7 = &v13[v9 + 1];
    if (v5 != v8)
    {
LABEL_11:
      if (v9 < 8 || (unint64_t)(v8 - v13) < 0x20)
        goto LABEL_27;
      if (v9 >= 0x20)
      {
        v16 = v9 & 0xFFFFFFFFFFFFFFE0;
        v17 = (__int128 *)(v5 - 16);
        v18 = &v13[v5 - 16 - v8];
        v19 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v20 = *v17;
          *(v18 - 1) = *(v17 - 1);
          *v18 = v20;
          v18 -= 2;
          v17 -= 2;
          v19 -= 32;
        }
        while (v19);
        if (v9 == v16)
        {
LABEL_29:
          v6 = (char *)*a1;
          *a1 = v13;
          a1[1] = v7;
          a1[2] = v15;
          if (!v6)
            goto LABEL_31;
          goto LABEL_30;
        }
        if ((v9 & 0x18) == 0)
        {
          v14 -= v16;
          v6 = &v5[-v16];
          goto LABEL_27;
        }
      }
      else
      {
        v16 = 0;
      }
      v6 = &v5[-(v9 & 0xFFFFFFFFFFFFFFF8)];
      v14 -= v9 & 0xFFFFFFFFFFFFFFF8;
      v21 = &v5[-v16 - 8];
      v22 = &v13[v21 - v8];
      v23 = v16 - (v9 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v24 = *(_QWORD *)v21;
        v21 -= 8;
        *v22-- = v24;
        v23 += 8;
      }
      while (v23);
      if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_29;
LABEL_27:
      v25 = v14 - 1;
      do
      {
        v26 = *--v6;
        *v25-- = v26;
      }
      while (v6 != v8);
      goto LABEL_29;
    }
  }
  else
  {
    v13 = 0;
    v14 = &v5[-*a1];
    v15 = 0;
    *(_BYTE *)v9 = a2;
    v7 = (char *)(v9 + 1);
    if (v5 != v8)
      goto LABEL_11;
  }
  *a1 = v14;
  a1[1] = v7;
  a1[2] = v15;
  if (v5)
LABEL_30:
    operator delete(v6);
LABEL_31:
  a1[1] = v7;
  v27 = a1[2];
  if ((unint64_t)v7 >= v27)
  {
    v29 = (char *)*a1;
    v30 = (unint64_t)&v7[-*a1];
    v31 = v30 + 1;
    if ((uint64_t)(v30 + 1) >= 0)
    {
      v32 = v27 - (_QWORD)v29;
      if (2 * v32 > v31)
        v31 = 2 * v32;
      if (v32 >= 0x3FFFFFFFFFFFFFFFLL)
        v33 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v33 = v31;
      if (v33)
        v34 = operator new(v33);
      else
        v34 = 0;
      v35 = &v34[v30];
      v36 = &v34[v33];
      v34[v30] = HIBYTE(a2);
      v28 = (uint64_t)&v34[v30 + 1];
      if (v7 == v29)
      {
        *a1 = v35;
        a1[1] = v28;
        a1[2] = v36;
LABEL_51:
        operator delete(v7);
        goto LABEL_52;
      }
      if (v30 < 8 || (unint64_t)(v29 - v34) < 0x20)
      {
        v37 = v7;
        goto LABEL_46;
      }
      if (v30 >= 0x20)
      {
        v40 = v30 & 0xFFFFFFFFFFFFFFE0;
        v41 = (__int128 *)(v7 - 16);
        v42 = &v34[v7 - 16 - v29];
        v43 = v30 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v44 = *v41;
          *(v42 - 1) = *(v41 - 1);
          *v42 = v44;
          v42 -= 2;
          v41 -= 2;
          v43 -= 32;
        }
        while (v43);
        if (v30 == v40)
          goto LABEL_48;
        if ((v30 & 0x18) == 0)
        {
          v35 -= v40;
          v37 = &v7[-v40];
LABEL_46:
          v38 = v35 - 1;
          do
          {
            v39 = *--v37;
            *v38-- = v39;
          }
          while (v37 != v29);
          goto LABEL_48;
        }
      }
      else
      {
        v40 = 0;
      }
      v37 = &v7[-(v30 & 0xFFFFFFFFFFFFFFF8)];
      v35 -= v30 & 0xFFFFFFFFFFFFFFF8;
      v45 = &v7[-v40 - 8];
      v46 = &v34[v45 - v29];
      v47 = v40 - (v30 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v48 = *(_QWORD *)v45;
        v45 -= 8;
        *v46-- = v48;
        v47 += 8;
      }
      while (v47);
      if (v30 != (v30 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_46;
LABEL_48:
      v7 = (char *)*a1;
      *a1 = v34;
      a1[1] = v28;
      a1[2] = v36;
      if (!v7)
        goto LABEL_52;
      goto LABEL_51;
    }
LABEL_64:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  *v7 = HIBYTE(a2);
  v28 = (uint64_t)(v7 + 1);
LABEL_52:
  a1[1] = v28;
}

void ETLDIAGLoggingGetGUIDString(unsigned int *a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  void **v6;
  std::string::size_type v7;
  std::string *v8;
  __int128 v9;
  void **v10;
  std::string::size_type v11;
  std::string *v12;
  __int128 v13;
  void **v14;
  std::string::size_type v15;
  void **v16;
  std::string::size_type v17;
  void **v18;
  std::string::size_type v19;
  void **v20;
  std::string::size_type v21;
  void **v22;
  std::string::size_type v23;
  void **v24;
  std::string::size_type v25;
  void **v26;
  std::string::size_type v27;
  void **v28;
  std::string::size_type v29;
  void **v30;
  std::string::size_type v31;
  std::string v32;
  void *__p[2];
  int64_t v34;

  memset(a2, 170, sizeof(std::string));
  *((_BYTE *)&a2->__r_.__value_.__s + 23) = 0;
  a2->__r_.__value_.__s.__data_[0] = 0;
  if (!a1)
    return;
  ctu::hex0((ctu *)*a1);
  v4 = std::string::append(&v32, "-", 1uLL);
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v34 = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  if (v34 >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if (v34 >= 0)
    v7 = HIBYTE(v34);
  else
    v7 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v6, v7);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_10;
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_10;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_10:
  ctu::hex0((ctu *)*((unsigned __int16 *)a1 + 2));
  v8 = std::string::append(&v32, "-", 1uLL);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v34 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (v34 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  if (v34 >= 0)
    v11 = HIBYTE(v34);
  else
    v11 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v10, v11);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_18;
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_18;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_18:
  ctu::hex0((ctu *)*((unsigned __int16 *)a1 + 3));
  v12 = std::string::append(&v32, "-", 1uLL);
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v34 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (v34 >= 0)
    v14 = __p;
  else
    v14 = (void **)__p[0];
  if (v34 >= 0)
    v15 = HIBYTE(v34);
  else
    v15 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v14, v15);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_26;
LABEL_95:
    operator delete(v32.__r_.__value_.__l.__data_);
    goto LABEL_26;
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_95;
LABEL_26:
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 8));
  if (v34 >= 0)
    v16 = __p;
  else
    v16 = (void **)__p[0];
  if (v34 >= 0)
    v17 = HIBYTE(v34);
  else
    v17 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v16, v17);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 9));
  if (v34 >= 0)
    v18 = __p;
  else
    v18 = (void **)__p[0];
  if (v34 >= 0)
    v19 = HIBYTE(v34);
  else
    v19 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v18, v19);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  std::string::append(a2, "-", 1uLL);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 10));
  if (v34 >= 0)
    v20 = __p;
  else
    v20 = (void **)__p[0];
  if (v34 >= 0)
    v21 = HIBYTE(v34);
  else
    v21 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v20, v21);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 11));
  if (v34 >= 0)
    v22 = __p;
  else
    v22 = (void **)__p[0];
  if (v34 >= 0)
    v23 = HIBYTE(v34);
  else
    v23 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v22, v23);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 12));
  if (v34 >= 0)
    v24 = __p;
  else
    v24 = (void **)__p[0];
  if (v34 >= 0)
    v25 = HIBYTE(v34);
  else
    v25 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v24, v25);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 13));
  if (v34 >= 0)
    v26 = __p;
  else
    v26 = (void **)__p[0];
  if (v34 >= 0)
    v27 = HIBYTE(v34);
  else
    v27 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v26, v27);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 14));
  if (v34 >= 0)
    v28 = __p;
  else
    v28 = (void **)__p[0];
  if (v34 >= 0)
    v29 = HIBYTE(v34);
  else
    v29 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v28, v29);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 15));
  if (v34 >= 0)
    v30 = __p;
  else
    v30 = (void **)__p[0];
  if (v34 >= 0)
    v31 = HIBYTE(v34);
  else
    v31 = (std::string::size_type)__p[1];
  std::string::append(a2, (const std::string::value_type *)v30, v31);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
}

void sub_212EAB228(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 + 23) < 0)
    operator delete(*(void **)v21);
  _Unwind_Resume(exception_object);
}

uint64_t ETLDIAGGetGUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  capabilities::radio *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int *p_dst;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  capabilities::diag *v29;
  uint64_t *v30;
  char v31;
  const char *v32;
  size_t v33;
  unint64_t i;
  _OWORD *v35;
  unint64_t v36;
  _OWORD *v37;
  _OWORD *v38;
  _OWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  _BYTE *v47;
  unint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  _BYTE *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  size_t v55;
  _BYTE *v56;
  char *v57;
  unint64_t v58;
  _OWORD *v59;
  __int128 *v60;
  unint64_t v61;
  __int128 v62;
  _QWORD *v63;
  uint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char v68;
  std::string::size_type v69;
  std::string *v70;
  std::string::size_type v71;
  std::string *v72;
  uint64_t v73;
  const void **v74;
  uint64_t v75;
  const void **v76;
  const void *v77;
  uint64_t v78;
  uint64_t v79;
  const void *v80;
  uint64_t v81;
  uint64_t v82;
  std::string::size_type v83;
  std::string *v84;
  _QWORD *v85;
  _QWORD *v86;
  std::string::size_type v87;
  std::string *v88;
  uint64_t v89;
  const void **v90;
  uint64_t v91;
  const void **v92;
  const void *v93;
  uint64_t v94;
  uint64_t v95;
  std::string *v96;
  const void *v97;
  uint64_t v98;
  uint64_t v99;
  std::string *v100;
  const char *SubsysCmdString;
  size_t v102;
  std::string::size_type v103;
  std::string *v104;
  uint64_t v105;
  const void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  const void **v116;
  int v117;
  unsigned __int16 v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  void *__p[2];
  __int128 v128;
  unint64_t v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  std::string __dst;
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v129 = 0xAAAAAAAAAAAAAAAALL;
  v139 = v4;
  v138 = v4;
  v137 = v4;
  v136 = v4;
  v135 = v4;
  v134 = v4;
  v133 = v4;
  v132 = v4;
  v131 = v4;
  v128 = v4;
  v126 = v4;
  *(_OWORD *)__p = v4;
  v124 = v4;
  v125 = v4;
  v123 = v4;
  v5 = MEMORY[0x24BEDB870];
  v6 = MEMORY[0x24BEDB870] + 64;
  v130 = MEMORY[0x24BEDB870] + 64;
  v7 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v122 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v122 + *(_QWORD *)(v122 - 24)) = v7;
  v8 = (std::ios_base *)((char *)&v122 + *(_QWORD *)(v122 - 24));
  std::ios_base::init(v8, &v123);
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v122 = v5 + 24;
  v130 = v6;
  v9 = (capabilities::radio *)std::streambuf::basic_streambuf();
  *(_QWORD *)&v123 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v128 = 0u;
  LODWORD(v129) = 16;
  v119 = (uint64_t)&v119;
  v120 = &v119;
  v121 = 0;
  if (!capabilities::radio::mavLegacy(v9))
  {
    LODWORD(__dst.__r_.__value_.__l.__data_) = 2070;
    p_dst = (int *)&__dst;
    v18 = v120;
    if (v120 == &v119
      || (*((_DWORD *)v120 + 4) = 2070,
          v19 = (uint64_t *)v18[1],
          p_dst = (int *)__dst.__r_.__value_.__r.__words + 1,
          v19 == &v119))
    {
      std::list<ETLDiagQueryGUIDSubSysCMDCode>::__insert_with_sentinel[abi:ne180100]<ETLDiagQueryGUIDSubSysCMDCode const*,ETLDiagQueryGUIDSubSysCMDCode const*>(&v119, &v119, p_dst, (int *)__dst.__r_.__value_.__r.__words + 1);
    }
    else
    {
      v20 = v119;
      v21 = *v19;
      *(_QWORD *)(v21 + 8) = *(_QWORD *)(v119 + 8);
      **(_QWORD **)(v20 + 8) = v21;
      do
      {
        v22 = (uint64_t *)v19[1];
        --v121;
        operator delete(v19);
        v19 = v22;
      }
      while (v22 != &v119);
    }
    goto LABEL_25;
  }
  LODWORD(__dst.__r_.__value_.__r.__words[2]) = 6680;
  *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = xmmword_212EAFE5C;
  v10 = v120;
  if (v120 == &v119)
  {
    v23 = (int *)&__dst;
LABEL_24:
    std::list<ETLDiagQueryGUIDSubSysCMDCode>::__insert_with_sentinel[abi:ne180100]<ETLDiagQueryGUIDSubSysCMDCode const*,ETLDiagQueryGUIDSubSysCMDCode const*>(&v119, &v119, v23, (int *)&__dst.__r_.__value_.__r.__words[2] + 1);
    goto LABEL_25;
  }
  *((_DWORD *)v120 + 4) = __dst.__r_.__value_.__l.__data_;
  v11 = v10[1];
  if ((uint64_t *)v11 == &v119)
  {
    v16 = 1;
LABEL_23:
    v23 = (int *)((char *)&__dst + 4 * v16);
    goto LABEL_24;
  }
  *(_DWORD *)(v11 + 16) = HIDWORD(__dst.__r_.__value_.__r.__words[0]);
  v12 = *(_QWORD *)(v11 + 8);
  if ((uint64_t *)v12 == &v119)
  {
    v16 = 2;
    goto LABEL_23;
  }
  *(_DWORD *)(v12 + 16) = __dst.__r_.__value_.__r.__words[1];
  v13 = *(_QWORD *)(v12 + 8);
  if ((uint64_t *)v13 == &v119)
  {
    v16 = 3;
    goto LABEL_23;
  }
  *(_DWORD *)(v13 + 16) = HIDWORD(__dst.__r_.__value_.__r.__words[1]);
  v14 = *(_QWORD *)(v13 + 8);
  if ((uint64_t *)v14 == &v119)
  {
    v16 = 4;
    goto LABEL_23;
  }
  *(_DWORD *)(v14 + 16) = __dst.__r_.__value_.__r.__words[2];
  v15 = *(uint64_t **)(v14 + 8);
  v16 = 5;
  if (v15 == &v119)
    goto LABEL_23;
  v24 = v119;
  v25 = *v15;
  *(_QWORD *)(v25 + 8) = *(_QWORD *)(v119 + 8);
  **(_QWORD **)(v24 + 8) = v25;
  do
  {
    v26 = (uint64_t *)v15[1];
    --v121;
    operator delete(v15);
    v15 = v26;
  }
  while (v26 != &v119);
LABEL_25:
  v116 = (const void **)&v125 + 1;
  v27 = 9;
LABEL_26:
  v28 = v27;
  std::ios_base::clear((std::ios_base *)((char *)&v122 + *(_QWORD *)(v122 - 24)), 0);
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 64) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a2 + 80) = capabilities::diag::diagVersion(v29);
  _ETLDebugPrint();
  v117 = v28;
  v30 = v120;
  if (v120 == &v119)
    goto LABEL_159;
  v31 = 0;
  do
  {
    while (1)
    {
      v118 = *(_DWORD *)(a2 + 80);
      ETLDiagGetSubsysCmdString();
      _ETLDebugPrint();
      _ETLDebugPrint();
      if ((ETLDiagCreateGUIDDB() & 1) == 0)
        break;
      std::ios_base::clear((std::ios_base *)((char *)&v122 + *(_QWORD *)(v122 - 24)), 0);
      ETLDiagGetSubsysCmdString();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      if (MEMORY[4])
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)"ETLDiagCreateGUIDDB failed with status: ", 40);
        std::ostream::operator<<();
        if ((v129 & 0x10) != 0)
        {
          v89 = *((_QWORD *)&v128 + 1);
          v90 = (const void **)&v125 + 1;
          if (*((_QWORD *)&v128 + 1) < (unint64_t)v126)
          {
            *((_QWORD *)&v128 + 1) = v126;
            v89 = v126;
            v90 = (const void **)&v125 + 1;
          }
        }
        else
        {
          if ((v129 & 8) == 0)
          {
            v83 = 0;
            *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 0;
            v84 = &__dst;
            goto LABEL_145;
          }
          v89 = v125;
          v90 = (const void **)&v124;
        }
        v93 = *v90;
        v83 = v89 - (_QWORD)*v90;
        if (v83 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v83 >= 0x17)
        {
          v94 = (v83 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v83 | 7) != 0x17)
            v94 = v83 | 7;
          v95 = v94 + 1;
          v96 = (std::string *)operator new(v94 + 1);
          __dst.__r_.__value_.__l.__size_ = v83;
          __dst.__r_.__value_.__r.__words[2] = v95 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v96;
          v84 = v96;
        }
        else
        {
          *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v89 - *(_BYTE *)v90;
          v84 = &__dst;
          if (!v83)
            goto LABEL_145;
        }
        memmove(v84, v93, v83);
LABEL_145:
        v84->__r_.__value_.__s.__data_[v83] = 0;
        goto LABEL_156;
      }
      if (v118 != MEMORY[0xC])
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)"ETLDiagCreateGUIDDB request/response version mismatch: ", 55);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)"request ", 8);
        v85 = (_QWORD *)std::ostream::operator<<();
        v86 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v85, (uint64_t)", ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v86, (uint64_t)"response ", 9);
        std::ostream::operator<<();
        if ((v129 & 0x10) != 0)
        {
          v91 = *((_QWORD *)&v128 + 1);
          v92 = (const void **)&v125 + 1;
          if (*((_QWORD *)&v128 + 1) < (unint64_t)v126)
          {
            *((_QWORD *)&v128 + 1) = v126;
            v91 = v126;
            v92 = (const void **)&v125 + 1;
          }
        }
        else
        {
          if ((v129 & 8) == 0)
          {
            v87 = 0;
            *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 0;
            v88 = &__dst;
            goto LABEL_155;
          }
          v91 = v125;
          v92 = (const void **)&v124;
        }
        v97 = *v92;
        v87 = v91 - (_QWORD)*v92;
        if (v87 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v87 >= 0x17)
        {
          v98 = (v87 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v87 | 7) != 0x17)
            v98 = v87 | 7;
          v99 = v98 + 1;
          v100 = (std::string *)operator new(v98 + 1);
          __dst.__r_.__value_.__l.__size_ = v87;
          __dst.__r_.__value_.__r.__words[2] = v99 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v100;
          v88 = v100;
        }
        else
        {
          *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v91 - *(_BYTE *)v92;
          v88 = &__dst;
          if (!v87)
          {
LABEL_155:
            v88->__r_.__value_.__s.__data_[v87] = 0;
LABEL_156:
            _ETLDebugPrint();
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__dst.__r_.__value_.__l.__data_);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)" [subsystem: ", 13);
            SubsysCmdString = (const char *)ETLDiagGetSubsysCmdString();
            v102 = strlen(SubsysCmdString);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)SubsysCmdString, v102);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)"]", 1);
LABEL_159:
            if (!v117)
            {
              if ((v129 & 0x10) != 0)
              {
                v105 = *((_QWORD *)&v128 + 1);
                if (*((_QWORD *)&v128 + 1) < (unint64_t)v126)
                {
                  *((_QWORD *)&v128 + 1) = v126;
                  v105 = v126;
                }
              }
              else
              {
                if ((v129 & 8) == 0)
                {
                  v103 = 0;
                  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 0;
                  v104 = &__dst;
                  goto LABEL_175;
                }
                v105 = v125;
                v116 = (const void **)&v124;
              }
              v106 = *v116;
              v103 = v105 - (_QWORD)*v116;
              if (v103 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              if (v103 >= 0x17)
              {
                v107 = (v103 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v103 | 7) != 0x17)
                  v107 = v103 | 7;
                v108 = v107 + 1;
                v104 = (std::string *)operator new(v107 + 1);
                __dst.__r_.__value_.__l.__size_ = v103;
                __dst.__r_.__value_.__r.__words[2] = v108 | 0x8000000000000000;
                __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
              }
              else
              {
                *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v105 - *(_BYTE *)v116;
                v104 = &__dst;
                if (!v103)
                {
LABEL_175:
                  v104->__r_.__value_.__s.__data_[v103] = 0;
                  if (*(char *)(a3 + 23) < 0)
                    operator delete(*(void **)a3);
                  v109 = 0;
                  *(std::string *)a3 = __dst;
                  *(_BYTE *)a2 = 0;
                  if (v121)
                    goto LABEL_181;
                  goto LABEL_183;
                }
              }
              memmove(v104, v106, v103);
              goto LABEL_175;
            }
            usleep(0x7A120u);
            v27 = v117 - 1;
            goto LABEL_26;
          }
        }
        memmove(v88, v97, v87);
        goto LABEL_155;
      }
      _ETLDebugPrint();
      if (MEMORY[0x11])
      {
        for (i = 0; i < MEMORY[0x11]; ++i)
        {
          v35 = (_OWORD *)(MEMORY[0x12] + 20 * i);
          v37 = *(_OWORD **)(a2 + 16);
          v36 = *(_QWORD *)(a2 + 24);
          if ((unint64_t)v37 < v36)
          {
            *v37 = *v35;
            v38 = v37 + 1;
            goto LABEL_49;
          }
          v39 = *(_OWORD **)(a2 + 8);
          v40 = v37 - v39;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 60)
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          v42 = v36 - (_QWORD)v39;
          if (v42 >> 3 > v41)
            v41 = v42 >> 3;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0)
            v43 = 0xFFFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
          {
            if (v43 >> 60)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v44 = (char *)operator new(16 * v43);
            v45 = &v44[16 * v40];
            *(_OWORD *)v45 = *v35;
            v46 = (uint64_t)v45;
            if (v37 == v39)
            {
LABEL_47:
              v38 = v45 + 16;
              *(_QWORD *)(a2 + 8) = v46;
              *(_QWORD *)(a2 + 16) = v45 + 16;
              *(_QWORD *)(a2 + 24) = &v44[16 * v43];
              if (!v37)
                goto LABEL_49;
LABEL_48:
              operator delete(v37);
              goto LABEL_49;
            }
          }
          else
          {
            v44 = 0;
            v45 = (char *)(16 * v40);
            *(_OWORD *)(16 * v40) = *v35;
            v46 = 16 * v40;
            if (v37 == v39)
              goto LABEL_47;
          }
          do
          {
            *(_OWORD *)(v46 - 16) = *(v37 - 1);
            v46 -= 16;
            --v37;
          }
          while (v37 != v39);
          v37 = *(_OWORD **)(a2 + 8);
          v38 = v45 + 16;
          *(_QWORD *)(a2 + 8) = v46;
          *(_QWORD *)(a2 + 16) = v45 + 16;
          *(_QWORD *)(a2 + 24) = &v44[16 * v43];
          if (v37)
            goto LABEL_48;
LABEL_49:
          *(_QWORD *)(a2 + 16) = v38;
          ETLDIAGLoggingGetGUIDString((unsigned int *)(MEMORY[0x12] + 20 * i), &__dst);
          _ETLDebugPrint();
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__dst.__r_.__value_.__l.__data_);
            if (MEMORY[0xC] == 3)
            {
LABEL_53:
              v47 = (_BYTE *)(MEMORY[0x12] + 21 * i + 20);
              v49 = *(_BYTE **)(a2 + 40);
              v48 = *(_QWORD *)(a2 + 48);
              if ((unint64_t)v49 < v48)
              {
                *v49 = *v47;
                v50 = (uint64_t)(v49 + 1);
LABEL_65:
                *(_QWORD *)(a2 + 40) = v50;
                _ETLDebugPrint();
                continue;
              }
              v51 = *(_BYTE **)(a2 + 32);
              v52 = v49 - v51;
              v53 = v49 - v51 + 1;
              if (v53 < 0)
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              v54 = v48 - (_QWORD)v51;
              if (2 * v54 > v53)
                v53 = 2 * v54;
              if (v54 >= 0x3FFFFFFFFFFFFFFFLL)
                v55 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v55 = v53;
              if (v55)
              {
                v56 = operator new(v55);
                v57 = &v56[v52];
                v56[v52] = *v47;
                v50 = (uint64_t)&v56[v52 + 1];
                if (v49 == v51)
                {
LABEL_63:
                  *(_QWORD *)(a2 + 32) = v57;
                  *(_QWORD *)(a2 + 40) = v50;
                  *(_QWORD *)(a2 + 48) = &v56[v55];
                  if (!v49)
                    goto LABEL_65;
LABEL_64:
                  operator delete(v49);
                  goto LABEL_65;
                }
              }
              else
              {
                v56 = 0;
                v57 = (char *)(v49 - v51);
                *(_BYTE *)v52 = *v47;
                v50 = v52 + 1;
                if (v49 == v51)
                  goto LABEL_63;
              }
              if (v52 >= 8 && (unint64_t)(v51 - v56) >= 0x20)
              {
                if (v52 >= 0x20)
                {
                  v58 = v52 & 0xFFFFFFFFFFFFFFE0;
                  v59 = &v56[v52 - 16];
                  v60 = (__int128 *)(v49 - 16);
                  v61 = v52 & 0xFFFFFFFFFFFFFFE0;
                  do
                  {
                    v62 = *v60;
                    *(v59 - 1) = *(v60 - 1);
                    *v59 = v62;
                    v59 -= 2;
                    v60 -= 2;
                    v61 -= 32;
                  }
                  while (v61);
                  if (v52 == v58)
                    goto LABEL_86;
                  if ((v52 & 0x18) != 0)
                    goto LABEL_79;
                  v57 -= v58;
                  v49 -= v58;
                }
                else
                {
                  v58 = 0;
LABEL_79:
                  v57 -= v52 & 0xFFFFFFFFFFFFFFF8;
                  v63 = &v56[&v49[-v58] - v51 - 8];
                  v64 = (uint64_t *)&v49[-v58 - 8];
                  v65 = v58 - (v52 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    v66 = *v64--;
                    *v63-- = v66;
                    v65 += 8;
                  }
                  while (v65);
                  v49 -= v52 & 0xFFFFFFFFFFFFFFF8;
                  if (v52 == (v52 & 0xFFFFFFFFFFFFFFF8))
                  {
LABEL_86:
                    v49 = *(_BYTE **)(a2 + 32);
                    *(_QWORD *)(a2 + 32) = v56;
                    *(_QWORD *)(a2 + 40) = v50;
                    *(_QWORD *)(a2 + 48) = &v56[v55];
                    if (!v49)
                      goto LABEL_65;
                    goto LABEL_64;
                  }
                }
              }
              v67 = v57 - 1;
              do
              {
                v68 = *--v49;
                *v67-- = v68;
              }
              while (v49 != v51);
              goto LABEL_86;
            }
          }
          else if (MEMORY[0xC] == 3)
          {
            goto LABEL_53;
          }
        }
      }
      ETLDiagReleaseGUIDDB();
      v30 = (uint64_t *)v30[1];
      v31 = 1;
      if (v30 == &v119)
        goto LABEL_91;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)" ", 1);
    v32 = (const char *)ETLDiagGetSubsysCmdString();
    v33 = strlen(v32);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)v32, v33);
    ETLDiagGetSubsysCmdString();
    _ETLDebugPrint();
    v30 = (uint64_t *)v30[1];
  }
  while (v30 != &v119);
  if ((v31 & 1) == 0)
    goto LABEL_159;
LABEL_91:
  if (*(_QWORD *)(a2 + 8) == *(_QWORD *)(a2 + 16))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)"All subsystems returned empty GUID", 34);
    if ((v129 & 0x10) != 0)
    {
      v75 = *((_QWORD *)&v128 + 1);
      v76 = (const void **)&v125 + 1;
      if (*((_QWORD *)&v128 + 1) < (unint64_t)v126)
      {
        *((_QWORD *)&v128 + 1) = v126;
        v75 = v126;
        v76 = (const void **)&v125 + 1;
      }
    }
    else
    {
      if ((v129 & 8) == 0)
      {
        v71 = 0;
        *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 0;
        v72 = &__dst;
        goto LABEL_123;
      }
      v75 = v125;
      v76 = (const void **)&v124;
    }
    v80 = *v76;
    v71 = v75 - (_QWORD)*v76;
    if (v71 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v71 >= 0x17)
    {
      v81 = (v71 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v71 | 7) != 0x17)
        v81 = v71 | 7;
      v82 = v81 + 1;
      v72 = (std::string *)operator new(v81 + 1);
      __dst.__r_.__value_.__l.__size_ = v71;
      __dst.__r_.__value_.__r.__words[2] = v82 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v72;
    }
    else
    {
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v75 - *(_BYTE *)v76;
      v72 = &__dst;
      if (!v71)
        goto LABEL_123;
    }
    memmove(v72, v80, v71);
LABEL_123:
    v72->__r_.__value_.__s.__data_[v71] = 0;
LABEL_124:
    _ETLDebugPrint();
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_159;
  }
  if (*(_DWORD *)(a2 + 80) != 3)
    goto LABEL_180;
  if (*(_QWORD *)(a2 + 32) == *(_QWORD *)(a2 + 40))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v122, (uint64_t)"All subsystems returned empty DIAG ID", 37);
    if ((v129 & 0x10) != 0)
    {
      v73 = *((_QWORD *)&v128 + 1);
      v74 = (const void **)&v125 + 1;
      if (*((_QWORD *)&v128 + 1) < (unint64_t)v126)
      {
        *((_QWORD *)&v128 + 1) = v126;
        v73 = v126;
        v74 = (const void **)&v125 + 1;
      }
    }
    else
    {
      if ((v129 & 8) == 0)
      {
        v69 = 0;
        *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 0;
        v70 = &__dst;
        goto LABEL_113;
      }
      v73 = v125;
      v74 = (const void **)&v124;
    }
    v77 = *v74;
    v69 = v73 - (_QWORD)*v74;
    if (v69 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v69 >= 0x17)
    {
      v78 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v69 | 7) != 0x17)
        v78 = v69 | 7;
      v79 = v78 + 1;
      v70 = (std::string *)operator new(v78 + 1);
      __dst.__r_.__value_.__l.__size_ = v69;
      __dst.__r_.__value_.__r.__words[2] = v79 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v70;
    }
    else
    {
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v73 - *(_BYTE *)v74;
      v70 = &__dst;
      if (!v69)
        goto LABEL_113;
    }
    memmove(v70, v77, v69);
LABEL_113:
    v70->__r_.__value_.__s.__data_[v69] = 0;
    goto LABEL_124;
  }
  ETLDIAGCreateQMDL2Header(a2);
LABEL_180:
  v109 = 1;
  *(_BYTE *)a2 = 1;
  if (v121)
  {
LABEL_181:
    v111 = v119;
    v110 = v120;
    v112 = *v120;
    *(_QWORD *)(v112 + 8) = *(_QWORD *)(v119 + 8);
    **(_QWORD **)(v111 + 8) = v112;
    v121 = 0;
    if (v110 != &v119)
    {
      do
      {
        v113 = (uint64_t *)v110[1];
        operator delete(v110);
        v110 = v113;
      }
      while (v113 != &v119);
    }
  }
LABEL_183:
  v122 = *MEMORY[0x24BEDB800];
  *(uint64_t *)((char *)&v122 + *(_QWORD *)(v122 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  *(_QWORD *)&v123 = MEMORY[0x24BEDB848] + 16;
  if (SBYTE7(v128) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A7D34](&v130);
  return v109;
}

void sub_212EAC2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  std::list<ETLDiagQueryGUIDSubSysCMDCode>::~list((uint64_t *)va);
  std::ostringstream::~ostringstream((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t *std::list<ETLDiagQueryGUIDSubSysCMDCode>::~list(uint64_t *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  if (a1[2])
  {
    v3 = *a1;
    v2 = (uint64_t *)a1[1];
    v4 = *v2;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v3 + 8) = v4;
    a1[2] = 0;
    if (v2 != a1)
    {
      do
      {
        v5 = (uint64_t *)v2[1];
        operator delete(v2);
        v2 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A7D34](a1 + 112);
  return a1;
}

uint64_t ETLADPLLoggingEnable()
{
  return ETLMaverickADPLEnable();
}

uint64_t ETLQDSSLoggingEnable()
{
  return ETLMaverickQDSSEnable();
}

uint64_t ETLDIAGLoggingConfigure(capabilities::diag *a1, uint64_t a2)
{
  unsigned __int8 v4;
  unsigned int (*v5)(void);
  uint64_t v7;
  _BOOL4 v8;
  __int128 v9;
  int EnabledEquipIDs;
  uint64_t i;
  int NumRanges;
  int v13;
  __int128 v14;
  int v15;
  unsigned int v16;
  int v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  std::string *v22;
  std::string::size_type size;
  uint64_t v24;
  char v25;
  int v26;
  char *v27;
  int v28;
  char *v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  __int16 *v35;
  unint64_t v36;
  __int16 *v37;
  capabilities::diag *v38;
  char v39;
  std::string v40;
  std::string v41;
  std::string v42;
  std::string v43;
  int __val;
  unsigned int v45;
  _QWORD v46[2];
  void *__p[2];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
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
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = atomic_load((unsigned __int8 *)&qword_253E92BD8);
  if ((v4 & 1) == 0)
  {
    v38 = (capabilities::diag *)__cxa_guard_acquire(&qword_253E92BD8);
    if ((_DWORD)v38)
    {
      capabilities::diag::supportedInterfaces(v38);
      capabilities::diag::operator|();
      _MergedGlobals = capabilities::diag::operator&() == 0;
      __cxa_guard_release(&qword_253E92BD8);
    }
  }
  v5 = *(unsigned int (**)(void))(*(_QWORD *)a1 + 56);
  if (!v5)
    return 0;
  if (!v5() || *((_QWORD *)a1 + 1) == 0)
    return 0;
  _ETLDebugPrint();
  if (_MergedGlobals)
    _ETLDIAGLoggingPing((uint64_t)a1, a2);
  if ((*((_DWORD *)a1 + 4) | 2) == 2)
  {
    v7 = _ETLDIAGLoggingMSGSwitch(a1, 0, a2);
    v8 = 0;
    if (!(_DWORD)v7)
      goto LABEL_64;
  }
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49 = v9;
  v50 = v9;
  *(_OWORD *)__p = v9;
  v48 = v9;
  EnabledEquipIDs = ETLDMCLogGetEnabledEquipIDs();
  if (!EnabledEquipIDs)
  {
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "No log equip ID found in DMC file", 0x21uLL);
LABEL_63:
    v8 = 0;
    goto LABEL_64;
  }
  if (!*((_BYTE *)a1 + 20))
    ETLFlushResponseFull();
  for (i = 0; i != EnabledEquipIDs; ++i)
  {
    v43.__r_.__value_.__r.__words[0] = 0;
    LODWORD(v42.__r_.__value_.__l.__data_) = 0;
    ETLLOGEquipIDAsString();
    _ETLDebugPrint();
    if ((ETLDMCLogGetMask() & 1) == 0)
    {
      v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get log mask from DMC", 0x1FuLL);
      goto LABEL_63;
    }
    if ((ETLLOGSetMaskWithRetry() & 1) == 0)
    {
      v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to set log masks", 0x17uLL);
      goto LABEL_63;
    }
  }
  NumRanges = ETLDMCEventGetNumRanges();
  if (!NumRanges)
  {
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "No event ranges found in DMC file", 0x21uLL);
    goto LABEL_63;
  }
  _ETLDebugPrint();
  v13 = 1;
  while (1)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      **(_BYTE **)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      if (*((_BYTE *)a1 + 20))
        goto LABEL_27;
    }
    else
    {
      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 23) = 0;
      if (*((_BYTE *)a1 + 20))
        goto LABEL_27;
    }
    ETLFlushResponseFull();
LABEL_27:
    _ETLDebugPrint();
    if ((ETLEVENTEnable() & 1) != 0)
      break;
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to enable events", 0x17uLL);
LABEL_21:
    if (++v13 == 4)
      goto LABEL_63;
  }
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v77 = v14;
  v78 = v14;
  v75 = v14;
  v76 = v14;
  v73 = v14;
  v74 = v14;
  v71 = v14;
  v72 = v14;
  v69 = v14;
  v70 = v14;
  v67 = v14;
  v68 = v14;
  v65 = v14;
  v66 = v14;
  v63 = v14;
  v64 = v14;
  v61 = v14;
  v62 = v14;
  v59 = v14;
  v60 = v14;
  v57 = v14;
  v58 = v14;
  v55 = v14;
  v56 = v14;
  v53 = v14;
  v54 = v14;
  v51 = v14;
  v52 = v14;
  v49 = v14;
  v50 = v14;
  *(_OWORD *)__p = v14;
  v48 = v14;
  v45 = 0;
  v7 = ETLEVENTGetMask();
  if ((v7 & 1) == 0)
  {
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get current event mask", 0x20uLL);
    goto LABEL_21;
  }
  if (v45 > 0x1000)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      *(_QWORD *)(a2 + 8) = 22;
      v30 = *(char **)a2;
    }
    else
    {
      *(_BYTE *)(a2 + 23) = 22;
      v30 = (char *)a2;
    }
    v8 = 0;
    strcpy(v30, "Invalid event bit mask");
    goto LABEL_64;
  }
  bzero(__p, ((unint64_t)v45 + 7) >> 3);
  v15 = 0;
  while (2)
  {
    __val = -1431655766;
    if ((ETLDMCEventGetRange() & 1) == 0)
    {
      v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get event range from DMC", 0x22uLL);
      goto LABEL_21;
    }
    if (v45 < HIWORD(__val))
    {
      std::to_string(&v41, HIWORD(__val));
      v18 = std::string::insert(&v41, 0, "Invalid event range: event range last (from DMC): ", 0x32uLL);
      v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
      v42.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v19;
      v18->__r_.__value_.__l.__size_ = 0;
      v18->__r_.__value_.__r.__words[2] = 0;
      v18->__r_.__value_.__r.__words[0] = 0;
      v20 = std::string::append(&v42, ", maskBits (from BBFW): ", 0x18uLL);
      v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
      v43.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v21;
      v20->__r_.__value_.__l.__size_ = 0;
      v20->__r_.__value_.__r.__words[2] = 0;
      v20->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v40, v45);
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v22 = &v40;
      else
        v22 = (std::string *)v40.__r_.__value_.__r.__words[0];
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v40.__r_.__value_.__r.__words[2]);
      else
        size = v40.__r_.__value_.__l.__size_;
      v7 = (uint64_t)std::string::append(&v43, (const std::string::value_type *)v22, size);
      v24 = *(_QWORD *)v7;
      v46[0] = *(_QWORD *)(v7 + 8);
      *(_QWORD *)((char *)v46 + 7) = *(_QWORD *)(v7 + 15);
      v25 = *(_BYTE *)(v7 + 23);
      *(_QWORD *)(v7 + 8) = 0;
      *(_QWORD *)(v7 + 16) = 0;
      *(_QWORD *)v7 = 0;
      if (*(char *)(a2 + 23) < 0)
      {
        v39 = v25;
        operator delete(*(void **)a2);
        v25 = v39;
      }
      *(_QWORD *)a2 = v24;
      *(_QWORD *)(a2 + 8) = v46[0];
      *(_QWORD *)(a2 + 15) = *(_QWORD *)((char *)v46 + 7);
      *(_BYTE *)(a2 + 23) = v25;
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v40.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_50:
          if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_51;
          goto LABEL_57;
        }
      }
      else if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_50;
      }
      operator delete(v43.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_51:
        if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_21;
LABEL_58:
        operator delete(v41.__r_.__value_.__l.__data_);
        goto LABEL_21;
      }
LABEL_57:
      operator delete(v42.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_21;
      goto LABEL_58;
    }
    v16 = (unsigned __int16)__val;
    if ((unsigned __int16)__val <= HIWORD(__val))
    {
      v17 = HIWORD(__val) + 1;
      do
      {
        *((_BYTE *)__p + ((unint64_t)v16 >> 3)) |= 1 << (v16 & 7);
        ++v16;
      }
      while (v17 != v16);
    }
    if (++v15 != NumRanges)
      continue;
    break;
  }
  if ((ETLEVENTSetMask() & 1) == 0)
  {
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to set event masks", 0x19uLL);
    goto LABEL_21;
  }
  if (!dword_253E92BD0)
  {
    ETLMESSAGEGetSubsystemIDRanges();
    if (dword_253E92BD0 < 0x81)
    {
      _ETLDebugPrint();
      if (dword_253E92BD0)
      {
        v36 = 0;
        v37 = &word_253E92BEA;
        do
        {
          _ETLDebugPrint();
          ++v36;
          v37 += 2;
        }
        while (v36 < dword_253E92BD0);
      }
      goto LABEL_94;
    }
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Received more message ranges than expected", 0x2AuLL);
    goto LABEL_63;
  }
LABEL_94:
  v31 = ETLDMCMessageGetNumRanges();
  if (v31)
  {
    _ETLDebugPrint();
    v32 = 0;
    while (1)
    {
LABEL_97:
      LODWORD(v42.__r_.__value_.__l.__data_) = -1431655766;
      v43.__r_.__value_.__r.__words[0] = 0;
      if ((ETLDMCMessageGetRangeAndMasks() & 1) == 0)
      {
        v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get event range from DMC file", 0x27uLL);
        goto LABEL_119;
      }
      _ETLDebugPrint();
      v34 = dword_253E92BD0;
      if (dword_253E92BD0)
      {
        v35 = &word_253E92BEA;
        while (*(unsigned __int16 *)&v42.__r_.__value_.__s.__data_[2] > (unsigned __int16)*v35
             || LOWORD(v42.__r_.__value_.__l.__data_) < (unsigned __int16)*(v35 - 1))
        {
          v35 += 2;
          if (!--v34)
          {
            ETLDMCDebugGetMessageRange();
            v7 = _ETLDebugPrint();
            if (SBYTE7(v48) < 0)
              operator delete(__p[0]);
            v33 = 0;
            if (++v32 == v31)
              goto LABEL_120;
            goto LABEL_97;
          }
        }
      }
      if (!*((_BYTE *)a1 + 20))
        ETLFlushResponseFull();
      v7 = ETLMESSAGESetSubsystemRuntimeMasksWithRetry();
      if ((v7 & 1) == 0)
        break;
      v33 = 1;
      if (++v32 == v31)
        goto LABEL_120;
    }
    v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to configure message range", 0x21uLL);
LABEL_119:
    v33 = 0;
LABEL_120:
    v8 = v33 != 0;
  }
  else
  {
    v7 = _ETLDebugPrint();
    v8 = 1;
  }
LABEL_64:
  v26 = capabilities::radio::mav20Plus((capabilities::radio *)v7);
  if ((v8 & v26) != 1)
  {
    v28 = v8 & (v26 ^ 1);
    if (!*((_BYTE *)a1 + 23))
      goto LABEL_76;
    goto LABEL_82;
  }
  if (!*(_DWORD *)(_ETLDMCGetView() + 48))
  {
    _ETLDebugPrint();
LABEL_72:
    v28 = 1;
    if (!*((_BYTE *)a1 + 23))
      goto LABEL_76;
    goto LABEL_82;
  }
  if ((ETLQtraceSend() & 1) != 0)
    goto LABEL_72;
  if (*(char *)(a2 + 23) < 0)
  {
    *(_QWORD *)(a2 + 8) = 22;
    v27 = *(char **)a2;
  }
  else
  {
    *(_BYTE *)(a2 + 23) = 22;
    v27 = (char *)a2;
  }
  v28 = 0;
  strcpy(v27, "Failed to send QTraces");
  if (!*((_BYTE *)a1 + 23))
  {
LABEL_76:
    if (*((_BYTE *)a1 + 21) && v28)
      v28 = ETLMaverickADPLEnable();
    if (*((_BYTE *)a1 + 22) && v28)
      v28 = ETLMaverickQDSSEnable();
  }
LABEL_82:
  if (*((_DWORD *)a1 + 4) <= 1u)
  {
    if (v28)
      v28 = _ETLDIAGLoggingMSGSwitch(a1, 1, a2);
  }
  if (v28)
  {
    _ETLDebugPrint();
    return 1;
  }
  _ETLDebugPrint();
  return 0;
}

void sub_212EACE8C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253E92BD8);
  _Unwind_Resume(a1);
}

void sub_212EACEA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (a48 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ETLDIAGLoggingPing(uint64_t a1, uint64_t a2)
{
  int i;
  char *v5;
  uint64_t result;

  for (i = 1; i != 21; ++i)
  {
    while (1)
    {
      if ((*(char *)(a2 + 23) & 0x80000000) == 0)
      {
        *(_BYTE *)a2 = 0;
        *(_BYTE *)(a2 + 23) = 0;
        _ETLDebugPrint();
        if (*(_BYTE *)(a1 + 20))
          goto LABEL_10;
LABEL_9:
        ETLFlushResponseFull();
        goto LABEL_10;
      }
      **(_BYTE **)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      _ETLDebugPrint();
      if (!*(_BYTE *)(a1 + 20))
        goto LABEL_9;
LABEL_10:
      result = ETLBBPing();
      if ((result & 1) == 0)
        break;
      result = ETLBBPingCheckResponse();
      if ((result & 1) == 0)
      {
        result = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get ping response", 0x1BuLL);
        if (++i != 21)
          continue;
      }
      return result;
    }
    if (*(char *)(a2 + 23) < 0)
    {
      *(_QWORD *)(a2 + 8) = 19;
      v5 = *(char **)a2;
    }
    else
    {
      *(_BYTE *)(a2 + 23) = 19;
      v5 = (char *)a2;
    }
    strcpy(v5, "Failed to send ping");
  }
  return result;
}

BOOL _ETLDIAGLoggingMSGSwitch(capabilities::diag *a1, uint64_t a2, uint64_t a3)
{
  BOOL v5;
  unsigned int v6;

  v5 = 1;
  v6 = 1;
  if ((capabilities::diag::supportsBSPFlagSet(a1) & 1) != 0)
  {
    while (*(char *)(a3 + 23) < 0)
    {
      **(_BYTE **)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      _ETLDebugPrint();
      if (!*((_BYTE *)a1 + 20))
        goto LABEL_4;
LABEL_5:
      if ((ETLMaverickSetFlags() & 1) == 0)
      {
        std::string::__assign_external((std::string *)a3, "Failed to set message master switch", 0x23uLL);
        v5 = v6++ < 0xA;
        if (v6 != 11)
          continue;
      }
      return v5;
    }
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 23) = 0;
    _ETLDebugPrint();
    if (*((_BYTE *)a1 + 20))
      goto LABEL_5;
LABEL_4:
    ETLFlushResponseFull();
    goto LABEL_5;
  }
  do
  {
    if (*(char *)(a3 + 23) < 0)
    {
      **(_BYTE **)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      _ETLDebugPrint();
      if (*((_BYTE *)a1 + 20))
        goto LABEL_13;
LABEL_12:
      ETLFlushResponseFull();
      goto LABEL_13;
    }
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 23) = 0;
    _ETLDebugPrint();
    if (!*((_BYTE *)a1 + 20))
      goto LABEL_12;
LABEL_13:
    if ((ETLMESSAGESetFlags() & 1) != 0)
      break;
    std::string::__assign_external((std::string *)a3, "Failed to set message master switch", 0x23uLL);
    v5 = v6++ < 0xA;
  }
  while (v6 != 11);
  return v5;
}

uint64_t ETLDIAGLoggingUnconfigure(_BYTE *a1, uint64_t a2)
{
  unsigned __int8 v4;
  unsigned int (*v5)(void);
  uint64_t v7;
  BOOL v8;
  unsigned int i;
  int v10;
  capabilities::diag *v12;

  v4 = atomic_load((unsigned __int8 *)&qword_253E92BE0);
  if ((v4 & 1) == 0)
  {
    v12 = (capabilities::diag *)__cxa_guard_acquire(&qword_253E92BE0);
    if ((_DWORD)v12)
    {
      capabilities::diag::supportedInterfaces(v12);
      capabilities::diag::operator|();
      byte_253E92BC9 = capabilities::diag::operator&() == 0;
      __cxa_guard_release(&qword_253E92BE0);
    }
  }
  v5 = *(unsigned int (**)(void))(*(_QWORD *)a1 + 56);
  if (!v5)
    return 0;
  if (!v5() || *((_QWORD *)a1 + 1) == 0)
    return 0;
  _ETLDebugPrint();
  if (byte_253E92BC9)
    _ETLDIAGLoggingPing((uint64_t)a1, a2);
  v7 = _ETLDIAGLoggingMSGSwitch((capabilities::diag *)a1, 0, a2);
  v8 = 0;
  if ((_DWORD)v7)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      **(_BYTE **)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 23) = 0;
    }
    _ETLDebugPrint();
    if (a1[20])
    {
      if ((ETLMESSAGESetAllSubsystemRunTimeMasks() & 1) != 0)
        goto LABEL_29;
    }
    else
    {
      ETLFlushResponseFull();
      if ((ETLMESSAGESetAllSubsystemRunTimeMasks() & 1) != 0)
        goto LABEL_29;
    }
    std::string::__assign_external((std::string *)a2, "Failed to clear message masks", 0x1DuLL);
    if (*(char *)(a2 + 23) < 0)
    {
      **(_BYTE **)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 23) = 0;
    }
    _ETLDebugPrint();
    if (!a1[20])
      ETLFlushResponseFull();
    if ((ETLMESSAGESetAllSubsystemRunTimeMasks() & 1) == 0)
    {
      std::string::__assign_external((std::string *)a2, "Failed to clear message masks", 0x1DuLL);
      if (*(char *)(a2 + 23) < 0)
      {
        **(_BYTE **)a2 = 0;
        *(_QWORD *)(a2 + 8) = 0;
      }
      else
      {
        *(_BYTE *)a2 = 0;
        *(_BYTE *)(a2 + 23) = 0;
      }
      _ETLDebugPrint();
      if (!a1[20])
        ETLFlushResponseFull();
      if ((ETLMESSAGESetAllSubsystemRunTimeMasks() & 1) == 0)
      {
        v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to clear message masks", 0x1DuLL);
        v8 = 0;
        goto LABEL_59;
      }
    }
LABEL_29:
    if (ETLDMCLogGetEnabledEquipIDs())
    {
      if (*(char *)(a2 + 23) < 0)
      {
        **(_BYTE **)a2 = 0;
        *(_QWORD *)(a2 + 8) = 0;
      }
      else
      {
        *(_BYTE *)a2 = 0;
        *(_BYTE *)(a2 + 23) = 0;
      }
      _ETLDebugPrint();
      if (!a1[20])
        ETLFlushResponseFull();
      if ((ETLLOGClearAllEnabledMasksWithRetry() & 1) != 0)
        goto LABEL_51;
      std::string::__assign_external((std::string *)a2, "Failed to clear log masks", 0x19uLL);
      if (*(char *)(a2 + 23) < 0)
      {
        **(_BYTE **)a2 = 0;
        *(_QWORD *)(a2 + 8) = 0;
      }
      else
      {
        *(_BYTE *)a2 = 0;
        *(_BYTE *)(a2 + 23) = 0;
      }
      _ETLDebugPrint();
      if (!a1[20])
        ETLFlushResponseFull();
      if ((ETLLOGClearAllEnabledMasksWithRetry() & 1) != 0)
        goto LABEL_51;
      std::string::__assign_external((std::string *)a2, "Failed to clear log masks", 0x19uLL);
      if (*(char *)(a2 + 23) < 0)
      {
        **(_BYTE **)a2 = 0;
        *(_QWORD *)(a2 + 8) = 0;
      }
      else
      {
        *(_BYTE *)a2 = 0;
        *(_BYTE *)(a2 + 23) = 0;
      }
      _ETLDebugPrint();
      if (!a1[20])
        ETLFlushResponseFull();
      if ((ETLLOGClearAllEnabledMasksWithRetry() & 1) != 0)
      {
LABEL_51:
        ETLLOGDisable();
        v8 = 1;
        for (i = 1; i != 11; ++i)
        {
          if (*(char *)(a2 + 23) < 0)
          {
            **(_BYTE **)a2 = 0;
            *(_QWORD *)(a2 + 8) = 0;
          }
          else
          {
            *(_BYTE *)a2 = 0;
            *(_BYTE *)(a2 + 23) = 0;
          }
          _ETLDebugPrint();
          if (!a1[20])
            ETLFlushResponseFull();
          v7 = ETLEVENTEnable();
          if ((v7 & 1) != 0)
            break;
          v7 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to clear event masks", 0x1BuLL);
          v8 = i < 0xA;
        }
        goto LABEL_59;
      }
      std::string::__assign_external((std::string *)a2, "Failed to clear log masks", 0x19uLL);
    }
    else
    {
      std::string::__assign_external((std::string *)a2, "No log equip ID found in DMC file", 0x21uLL);
    }
    v7 = ETLLOGDisable();
    v8 = 0;
  }
LABEL_59:
  if (capabilities::radio::mav20Plus((capabilities::radio *)v7))
  {
    if (!v8)
      goto LABEL_66;
    if ((ETLQtraceClearSend() & 1) == 0)
    {
      std::string::__assign_external((std::string *)a2, "Failed to send to clear QTraces", 0x1FuLL);
      goto LABEL_66;
    }
  }
  else if (!v8)
  {
LABEL_66:
    v10 = 0;
    if (a1[20])
      goto LABEL_68;
    goto LABEL_67;
  }
  v10 = _ETLDIAGLoggingMSGSwitch((capabilities::diag *)a1, 0, a2);
  if (a1[20])
    goto LABEL_68;
LABEL_67:
  ETLFlushResponseFull();
LABEL_68:
  if (!a1[23] && a1[21] | a1[22])
  {
    usleep(0x55730u);
    if (a1[21] && v10)
      v10 = ETLMaverickADPLEnable();
    if (a1[22])
    {
      if (v10)
        v10 = ETLMaverickQDSSEnable();
    }
  }
  if (v10)
  {
    _ETLDebugPrint();
    return 1;
  }
  _ETLDebugPrint();
  return 0;
}

void sub_212EAD8A4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253E92BE0);
  _Unwind_Resume(a1);
}

_QWORD **ETLDIAGLoggingCreateHash()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  std::ios_base *v5;
  const std::ios_base *v6;
  uint64_t v7;
  const std::locale::facet *v8;
  char v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char *v13;
  char v14;
  int v15;
  unsigned __int8 v16;
  std::string *v17;
  std::string::size_type size;
  size_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  std::string::size_type v23;
  char *v24;
  int v25;
  std::string *v26;
  char *v27;
  size_t v28;
  void *v29;
  void *v30;
  int v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  std::locale::__imp *locale;
  char *v36;
  size_t v37;
  std::string::size_type v38;
  std::string *p_dst;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char **v44;
  char *v45;
  char **v46;
  unint64_t v47;
  char *v48;
  _QWORD *v49;
  char *v50;
  BOOL v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  _BYTE *v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char **v65;
  _QWORD **v66;
  std::locale v67;
  std::string v68;
  std::string __dst;
  void *__p[3];
  char *__lasts;
  std::string v72;
  _QWORD v73[2];
  _QWORD v74[72];

  v74[70] = *MEMORY[0x24BDAC8D0];
  v0 = (_QWORD **)operator new(0x18uLL);
  v0[1] = 0;
  v0[2] = 0;
  v65 = (char **)(v0 + 1);
  *v0 = v0 + 1;
  memset(v74, 170, 0x230uLL);
  v1 = MEMORY[0x24BEDB838];
  v2 = MEMORY[0x24BEDB838] + 64;
  v3 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v4 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  v74[51] = MEMORY[0x24BEDB838] + 64;
  v73[0] = v3;
  *(_QWORD *)((char *)v73 + *(_QWORD *)(v3 - 24)) = v4;
  v73[1] = 0;
  v5 = (std::ios_base *)((char *)v73 + *(_QWORD *)(v73[0] - 24));
  std::ios_base::init(v5, v74);
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  v73[0] = v1 + 24;
  v74[51] = v2;
  MEMORY[0x2199A7C80](v74);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)v73 + *(_QWORD *)(v73[0] - 24)), *(_DWORD *)((char *)&v74[2] + *(_QWORD *)(v73[0] - 24)) | 4);
  if (!*(_DWORD *)((char *)&v74[2] + *(_QWORD *)(v73[0] - 24)))
  {
    memset(&v72, 0, sizeof(v72));
    std::string::reserve(&v72, 0x12CuLL);
    v6 = (const std::ios_base *)((char *)v73 + *(_QWORD *)(v73[0] - 24));
    if ((v6->__rdstate_ & 2) == 0)
    {
      v66 = v0;
      do
      {
        std::ios_base::getloc(v6);
        v8 = std::locale::use_facet(&v67, MEMORY[0x24BEDB350]);
        v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
        std::locale::~locale(&v67);
        LOBYTE(v67.__locale_) = -86;
        MEMORY[0x2199A7C98](&v67, v73, 1);
        if (!LOBYTE(v67.__locale_))
          goto LABEL_47;
        if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
        {
          *v72.__r_.__value_.__l.__data_ = 0;
          v72.__r_.__value_.__l.__size_ = 0;
        }
        else
        {
          v72.__r_.__value_.__s.__data_[0] = 0;
          *((_BYTE *)&v72.__r_.__value_.__s + 23) = 0;
        }
        v10 = 0;
        while (1)
        {
          v12 = *(_QWORD **)((char *)&v74[3] + *(_QWORD *)(v73[0] - 24));
          v13 = (char *)v12[3];
          if (v13 == (char *)v12[4])
            break;
          v12[3] = v13 + 1;
          v14 = *v13;
LABEL_19:
          if (v9 == v14)
          {
            v25 = 0;
            goto LABEL_46;
          }
          v16 = HIBYTE(v72.__r_.__value_.__r.__words[2]);
          if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
          {
            size = (v72.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
            if (v72.__r_.__value_.__l.__size_ == size)
            {
              if ((v72.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                std::string::__throw_length_error[abi:ne180100]();
              v17 = (std::string *)v72.__r_.__value_.__r.__words[0];
              v19 = 0x7FFFFFFFFFFFFFF7;
              if (size <= 0x3FFFFFFFFFFFFFF2)
              {
LABEL_26:
                if (size + 1 > 2 * size)
                  v20 = size + 1;
                else
                  v20 = 2 * size;
                v21 = (v20 & 0x7FFFFFFFFFFFFFF8) + 8;
                if ((v20 | 7) != 0x17)
                  v21 = v20 | 7;
                if (v20 >= 0x17)
                  v19 = v21 + 1;
                else
                  v19 = 23;
              }
              v22 = operator new(v19);
              v23 = (std::string::size_type)v22;
              if (!size || (memmove(v22, v17, size), size != 22))
                operator delete(v17);
              v72.__r_.__value_.__r.__words[0] = v23;
              v72.__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
              goto LABEL_39;
            }
            size = v72.__r_.__value_.__l.__size_;
            v23 = v72.__r_.__value_.__r.__words[0];
LABEL_39:
            v72.__r_.__value_.__l.__size_ = size + 1;
            v24 = (char *)(v23 + size);
            *v24 = v14;
            v24[1] = 0;
            --v10;
            if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_15;
          }
          else
          {
            if (HIBYTE(v72.__r_.__value_.__r.__words[2]) == 22)
            {
              v17 = &v72;
              size = 22;
              goto LABEL_26;
            }
            *((_BYTE *)&v72.__r_.__value_.__s + 23) = (*((_BYTE *)&v72.__r_.__value_.__s + 23) + 1) & 0x7F;
            v11 = (char *)&v72 + v16;
            *v11 = v14;
            v11[1] = 0;
            --v10;
            if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
            {
LABEL_15:
              if (v72.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
              {
                v25 = 4;
                goto LABEL_46;
              }
            }
          }
        }
        v15 = (*(uint64_t (**)(_QWORD *))(*v12 + 80))(v12);
        v14 = v15;
        if (v15 != -1)
          goto LABEL_19;
        if (v10)
          v25 = 2;
        else
          v25 = 6;
LABEL_46:
        std::ios_base::clear((std::ios_base *)((char *)v73 + *(_QWORD *)(v73[0] - 24)), *(_DWORD *)((char *)&v74[2] + *(_QWORD *)(v73[0] - 24)) | v25);
        v0 = v66;
LABEL_47:
        v7 = *(_QWORD *)(v73[0] - 24);
        if ((*((_BYTE *)&v74[2] + v7) & 5) != 0)
          goto LABEL_8;
        if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
        {
          v26 = (std::string *)v72.__r_.__value_.__r.__words[0];
          if (*v72.__r_.__value_.__l.__data_ - 58 < 0xFFFFFFF6)
            goto LABEL_8;
          __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
LABEL_53:
          memset(__p, 170, sizeof(__p));
          v27 = strtok_r((char *)v26, ":", &__lasts);
          v28 = strlen(v27);
          if (v28 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v29 = (void *)v28;
          if (v28 >= 0x17)
          {
            v33 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v28 | 7) != 0x17)
              v33 = v28 | 7;
            v34 = v33 + 1;
            v30 = operator new(v33 + 1);
            __p[1] = v29;
            __p[2] = (void *)(v34 | 0x8000000000000000);
            __p[0] = v30;
          }
          else
          {
            HIBYTE(__p[2]) = v28;
            v30 = __p;
            if (!v28)
            {
              LOBYTE(__p[0]) = 0;
              v31 = SHIBYTE(__p[2]);
              if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
                goto LABEL_57;
LABEL_63:
              if (!__p[1])
                goto LABEL_6;
              v32 = (void **)__p[0];
LABEL_65:
              locale = (std::locale::__imp *)atoll((const char *)v32);
              memset(&__dst, 170, sizeof(__dst));
              v36 = strtok_r(0, "\n", &__lasts);
              v37 = strlen(v36);
              if (v37 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              v38 = v37;
              if (v37 >= 0x17)
              {
                v41 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v37 | 7) != 0x17)
                  v41 = v37 | 7;
                v42 = v41 + 1;
                p_dst = (std::string *)operator new(v41 + 1);
                __dst.__r_.__value_.__l.__size_ = v38;
                __dst.__r_.__value_.__r.__words[2] = v42 | 0x8000000000000000;
                __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
              }
              else
              {
                *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v37;
                p_dst = &__dst;
                if (!v37)
                {
                  v0 = v66;
                  __dst.__r_.__value_.__s.__data_[0] = 0;
                  v40 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
                  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    goto LABEL_69;
LABEL_75:
                  v43 = (void *)__dst.__r_.__value_.__r.__words[0];
                  if (__dst.__r_.__value_.__l.__size_)
                  {
                    v67.__locale_ = locale;
                    std::string::__init_copy_ctor_external(&v68, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                    locale = v67.__locale_;
                    goto LABEL_77;
                  }
LABEL_120:
                  operator delete(v43);
                  if (SHIBYTE(__p[2]) < 0)
LABEL_6:
                    operator delete(__p[0]);
LABEL_7:
                  v7 = *(_QWORD *)(v73[0] - 24);
                  goto LABEL_8;
                }
              }
              memmove(p_dst, v36, v38);
              v0 = v66;
              p_dst->__r_.__value_.__s.__data_[v38] = 0;
              v40 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                goto LABEL_75;
LABEL_69:
              if (v40)
              {
                v67.__locale_ = locale;
                v68 = __dst;
LABEL_77:
                v44 = v65;
                while (1)
                {
                  v45 = *v44;
                  v46 = v44;
                  if (!*v44)
                    break;
                  while (1)
                  {
                    v44 = (char **)v45;
                    v47 = *((_QWORD *)v45 + 4);
                    if ((unint64_t)locale < v47)
                      break;
                    if (v47 >= (unint64_t)locale)
                      goto LABEL_114;
                    v45 = v44[1];
                    if (!v45)
                    {
                      v46 = v44 + 1;
                      goto LABEL_83;
                    }
                  }
                }
LABEL_83:
                v48 = (char *)operator new(0x40uLL);
                *((_QWORD *)v48 + 4) = locale;
                *(std::string *)(v48 + 40) = v68;
                memset(&v68, 0, sizeof(v68));
                *(_QWORD *)v48 = 0;
                *((_QWORD *)v48 + 1) = 0;
                *((_QWORD *)v48 + 2) = v44;
                *v46 = v48;
                v49 = (_QWORD *)**v0;
                if (v49)
                {
                  *v0 = v49;
                  v48 = *v46;
                }
                v50 = *v65;
                v51 = v48 == *v65;
                v48[24] = v51;
                if (!v51)
                {
                  do
                  {
                    v52 = *((_QWORD *)v48 + 2);
                    if (*(_BYTE *)(v52 + 24))
                      break;
                    v53 = *(char **)(v52 + 16);
                    v54 = *(_QWORD *)v53;
                    if (*(_QWORD *)v53 == v52)
                    {
                      v57 = *((_QWORD *)v53 + 1);
                      if (!v57 || (v58 = *(unsigned __int8 *)(v57 + 24), v55 = (_BYTE *)(v57 + 24), v58))
                      {
                        if (*(char **)v52 == v48)
                        {
                          v59 = (uint64_t *)*((_QWORD *)v48 + 2);
                        }
                        else
                        {
                          v59 = *(uint64_t **)(v52 + 8);
                          v60 = *v59;
                          *(_QWORD *)(v52 + 8) = *v59;
                          if (v60)
                          {
                            *(_QWORD *)(v60 + 16) = v52;
                            v53 = *(char **)(v52 + 16);
                          }
                          v59[2] = (uint64_t)v53;
                          *(_QWORD *)(*(_QWORD *)(v52 + 16) + 8 * (**(_QWORD **)(v52 + 16) != v52)) = v59;
                          *v59 = v52;
                          *(_QWORD *)(v52 + 16) = v59;
                          v53 = (char *)v59[2];
                          v52 = *(_QWORD *)v53;
                        }
                        *((_BYTE *)v59 + 24) = 1;
                        v53[24] = 0;
                        v63 = *(_QWORD *)(v52 + 8);
                        *(_QWORD *)v53 = v63;
                        if (v63)
                          *(_QWORD *)(v63 + 16) = v53;
                        *(_QWORD *)(v52 + 16) = *((_QWORD *)v53 + 2);
                        *(_QWORD *)(*((_QWORD *)v53 + 2) + 8 * (**((_QWORD **)v53 + 2) != (_QWORD)v53)) = v52;
                        *(_QWORD *)(v52 + 8) = v53;
                        goto LABEL_112;
                      }
                    }
                    else if (!v54 || (v56 = *(unsigned __int8 *)(v54 + 24), v55 = (_BYTE *)(v54 + 24), v56))
                    {
                      if (*(char **)v52 == v48)
                      {
                        v61 = *((_QWORD *)v48 + 1);
                        *(_QWORD *)v52 = v61;
                        if (v61)
                        {
                          *(_QWORD *)(v61 + 16) = v52;
                          v53 = *(char **)(v52 + 16);
                        }
                        *((_QWORD *)v48 + 2) = v53;
                        *(_QWORD *)(*(_QWORD *)(v52 + 16) + 8 * (**(_QWORD **)(v52 + 16) != v52)) = v48;
                        *((_QWORD *)v48 + 1) = v52;
                        *(_QWORD *)(v52 + 16) = v48;
                        v53 = (char *)*((_QWORD *)v48 + 2);
                      }
                      else
                      {
                        v48 = (char *)*((_QWORD *)v48 + 2);
                      }
                      v48[24] = 1;
                      v53[24] = 0;
                      v52 = *((_QWORD *)v53 + 1);
                      v62 = *(char **)v52;
                      *((_QWORD *)v53 + 1) = *(_QWORD *)v52;
                      if (v62)
                        *((_QWORD *)v62 + 2) = v53;
                      *(_QWORD *)(v52 + 16) = *((_QWORD *)v53 + 2);
                      *(_QWORD *)(*((_QWORD *)v53 + 2) + 8 * (**((_QWORD **)v53 + 2) != (_QWORD)v53)) = v52;
                      *(_QWORD *)v52 = v53;
LABEL_112:
                      *((_QWORD *)v53 + 2) = v52;
                      break;
                    }
                    *(_BYTE *)(v52 + 24) = 1;
                    v48 = v53;
                    v53[24] = v53 == v50;
                    *v55 = 1;
                  }
                  while (v53 != v50);
                }
                v0[2] = (_QWORD *)((char *)v0[2] + 1);
LABEL_114:
                if ((SHIBYTE(v68.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
                  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    goto LABEL_116;
LABEL_119:
                  v43 = (void *)__dst.__r_.__value_.__r.__words[0];
                  goto LABEL_120;
                }
                operator delete(v68.__r_.__value_.__l.__data_);
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                  goto LABEL_119;
              }
LABEL_116:
              if (SHIBYTE(__p[2]) < 0)
                goto LABEL_6;
              goto LABEL_7;
            }
          }
          memmove(v30, v27, (size_t)v29);
          *((_BYTE *)v29 + (_QWORD)v30) = 0;
          v31 = SHIBYTE(__p[2]);
          if (SHIBYTE(__p[2]) < 0)
            goto LABEL_63;
LABEL_57:
          if (v31)
          {
            v32 = __p;
            goto LABEL_65;
          }
          goto LABEL_7;
        }
        if (v72.__r_.__value_.__s.__data_[0] - 58 >= 0xFFFFFFF6)
        {
          __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
          v26 = &v72;
          goto LABEL_53;
        }
LABEL_8:
        v6 = (const std::ios_base *)((char *)v73 + v7);
      }
      while ((*((_BYTE *)&v74[2] + v7) & 2) == 0);
    }
    if (!std::filebuf::close())
      std::ios_base::clear((std::ios_base *)((char *)v73 + *(_QWORD *)(v73[0] - 24)), *(_DWORD *)((char *)&v74[2] + *(_QWORD *)(v73[0] - 24)) | 4);
    if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v72.__r_.__value_.__l.__data_);
  }
  v73[0] = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)v73 + *(_QWORD *)(v73[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x2199A7C8C](v74);
  std::istream::~istream();
  MEMORY[0x2199A7D34](&v74[51]);
  return v0;
}

void sub_212EAE238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34)
{
  __cxa_end_catch();
  if (a33 < 0)
    operator delete(__p);
  std::ifstream::~ifstream(&a34);
  _Unwind_Resume(a1);
}

void sub_212EAE244(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_212EAE254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40)
{
  void *v40;

  operator delete(v40);
  if (a32 < 0)
    operator delete(__p);
  if (a39 < 0)
    operator delete(a34);
  std::ifstream::~ifstream(&a40);
  _Unwind_Resume(a1);
}

void sub_212EAE2C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  std::istream::~istream();
  MEMORY[0x2199A7D34](a13);
  JUMPOUT(0x212EAE2FCLL);
}

void sub_212EAE304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,...)
{
  va_list va;

  va_start(va, a26);
  std::locale::~locale(&a10);
  if (a26 < 0)
    operator delete(a21);
  std::ifstream::~ifstream((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x2199A7C8C](a1 + 2);
  std::istream::~istream();
  MEMORY[0x2199A7D34](a1 + 53);
  return a1;
}

uint64_t ETLDIAGLoggingGetStringForKey(unint64_t a1, const char **a2, _QWORD *a3)
{
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  const char *v12;

  v3 = 0;
  if (a2 && a3)
  {
    *a2 = "notfound.c:--WRONG HASH FILE--";
    v6 = (_QWORD *)a3[1];
    v4 = (char *)(a3 + 1);
    v5 = v6;
    if (!v6)
      return 0;
    v7 = v4;
    do
    {
      v8 = v5[4];
      v9 = v8 >= a1;
      if (v8 >= a1)
        v10 = v5;
      else
        v10 = v5 + 1;
      if (v9)
        v7 = (char *)v5;
      v5 = (_QWORD *)*v10;
    }
    while (*v10);
    if (v7 == v4 || *((_QWORD *)v7 + 4) > a1)
      return 0;
    v12 = v7 + 40;
    if (v7[63] < 0)
      v12 = *(const char **)v12;
    *a2 = v12;
    return 1;
  }
  return v3;
}

void ETLDIAGLoggingGetAvailableDMCNames(void **a1@<X8>)
{
  _OWORD *v2;
  uint64_t v3;
  char *v4;
  const char *v5;
  size_t v6;
  size_t v7;
  __int128 *p_dst;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  void **v22;
  __int128 __dst;
  unint64_t v24;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v2 = operator new(0x40uLL);
  v3 = 0;
  *v2 = xmmword_212EAFE70;
  v2[1] = unk_212EAFE80;
  v2[2] = xmmword_212EAFE90;
  v2[3] = unk_212EAFEA0;
  do
  {
    v5 = (const char *)ETLDMCKeyword();
    v6 = strlen(v5);
    if (v6 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = v6;
    if (v6 >= 0x17)
    {
      v11 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17)
        v11 = v6 | 7;
      v12 = v11 + 1;
      p_dst = (__int128 *)operator new(v11 + 1);
      *((_QWORD *)&__dst + 1) = v7;
      v24 = v12 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v24) = v6;
      p_dst = &__dst;
      if (!v6)
      {
        LOBYTE(__dst) = 0;
        v10 = (void **)a1[1];
        v9 = (unint64_t)a1[2];
        if ((unint64_t)v10 < v9)
          goto LABEL_2;
        goto LABEL_13;
      }
    }
    memmove(p_dst, v5, v7);
    *((_BYTE *)p_dst + v7) = 0;
    v10 = (void **)a1[1];
    v9 = (unint64_t)a1[2];
    if ((unint64_t)v10 < v9)
    {
LABEL_2:
      *(_OWORD *)v10 = __dst;
      v10[2] = (void *)v24;
      v4 = (char *)(v10 + 3);
      goto LABEL_3;
    }
LABEL_13:
    v13 = (void **)*a1;
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (_BYTE *)*a1) >> 3);
    v15 = v14 + 1;
    if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (_QWORD)v13) >> 3);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x555555555555555)
      v17 = 0xAAAAAAAAAAAAAAALL;
    else
      v17 = v15;
    if (v17)
    {
      if (v17 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v18 = (char *)operator new(24 * v17);
    }
    else
    {
      v18 = 0;
    }
    v19 = &v18[24 * v14];
    v20 = &v18[24 * v17];
    *(_OWORD *)v19 = __dst;
    *((_QWORD *)v19 + 2) = v24;
    v4 = v19 + 24;
    if (v10 == v13)
    {
      *a1 = v19;
      a1[1] = v4;
      a1[2] = v20;
    }
    else
    {
      do
      {
        v21 = *(_OWORD *)(v10 - 3);
        *((_QWORD *)v19 - 1) = *(v10 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        *(v10 - 2) = 0;
        *(v10 - 1) = 0;
        *(v10 - 3) = 0;
        v10 -= 3;
      }
      while (v10 != v13);
      v10 = (void **)*a1;
      v22 = (void **)a1[1];
      *a1 = v19;
      a1[1] = v4;
      a1[2] = v20;
      while (v22 != v10)
      {
        if (*((char *)v22 - 1) < 0)
          operator delete(*(v22 - 3));
        v22 -= 3;
      }
    }
    if (v10)
      operator delete(v10);
LABEL_3:
    a1[1] = v4;
    ++v3;
  }
  while (v3 != 16);
  operator delete(v2);
}

void sub_212EAE66C(_Unwind_Exception *a1)
{
  void **v1;

  std::vector<std::string>::~vector[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_212EAE680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void **v15;
  void *v16;

  if (a15 < 0)
  {
    operator delete(__p);
    operator delete(v16);
    std::vector<std::string>::~vector[abi:ne180100](v15);
    _Unwind_Resume(a1);
  }
  operator delete(v16);
  std::vector<std::string>::~vector[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CEEA3C0, MEMORY[0x24BEDAAF0]);
}

void sub_212EAE7A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  uint64_t v6;
  std::string *v7;
  std::string::size_type v8;
  std::string::size_type v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    v6 = 22;
    v7 = this;
LABEL_6:
    v9 = 2 * v6;
    if (__n > 2 * v6)
      v9 = __n;
    v10 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    v11 = v9 | 7;
    if (v11 == 23)
      v11 = v10;
    v12 = v11 + 1;
    v13 = operator new(v11 + 1);
    memcpy(v13, __s, __n);
    if (v6 != 22)
      operator delete(v7);
    this->__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    this->__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    goto LABEL_13;
  }
  v8 = this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL;
  v6 = v8 - 1;
  if (__n > v8 - 1)
  {
    if (0x7FFFFFFFFFFFFFF7 - v8 < __n - (v8 - 1))
      std::string::__throw_length_error[abi:ne180100]();
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
    goto LABEL_6;
  }
  v13 = (void *)this->__r_.__value_.__r.__words[0];
  memmove(this->__r_.__value_.__l.__data_, __s, __n);
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
    goto LABEL_14;
  }
LABEL_13:
  this->__r_.__value_.__l.__size_ = __n;
LABEL_14:
  *((_BYTE *)v13 + __n) = 0;
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

_QWORD *std::list<ETLDiagQueryGUIDSubSysCMDCode>::__insert_with_sentinel[abi:ne180100]<ETLDiagQueryGUIDSubSysCMDCode const*,ETLDiagQueryGUIDSubSysCMDCode const*>(_QWORD *result, uint64_t *a2, int *a3, int *a4)
{
  _QWORD *v7;
  _QWORD *v8;
  int *v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  uint64_t v14;

  if (a3 != a4)
  {
    v7 = result;
    result = operator new(0x18uLL);
    v8 = result;
    *result = 0;
    result[1] = 0;
    v10 = *a3;
    v9 = a3 + 1;
    *((_DWORD *)result + 4) = v10;
    v11 = 1;
    if (v9 != a4)
    {
      v12 = result;
      do
      {
        result = operator new(0x18uLL);
        v13 = *v9++;
        *result = v12;
        result[1] = 0;
        *((_DWORD *)result + 4) = v13;
        v12[1] = result;
        ++v11;
        v12 = result;
      }
      while (v9 != a4);
    }
    v14 = *a2;
    *(_QWORD *)(v14 + 8) = v8;
    *v8 = v14;
    *a2 = (uint64_t)result;
    result[1] = a2;
    v7[2] += v11;
  }
  return result;
}

void sub_212EAEA80(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_212EAEAA0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const std::locale::facet *v12;
  uint64_t v13;
  BOOL v14;
  size_t v15;
  size_t v16;
  std::locale::__imp *v17;
  uint64_t v18;
  uint64_t v19;
  void *locale;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  std::locale __b[3];

  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x2199A7CB0](v24, a1);
  if (LOBYTE(v24[0]))
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v12 = std::locale::use_facet(__b, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    else
    {
      v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    if (v14)
      v16 = 0;
    else
      v16 = v15;
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        if (v16 >= 0x17)
        {
          v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17)
            v18 = v16 | 7;
          v19 = v18 + 1;
          v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((_BYTE *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0)
          locale = __b;
        else
          locale = __b[0].__locale_;
        v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(_QWORD *)v7 + 96))(v7, locale, v16);
        v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16)
            goto LABEL_34;
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((_QWORD *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x2199A7CBC](v24);
  return a1;
}

void sub_212EAED10(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x2199A7CBC](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x212EAECE4);
}

void sub_212EAED70(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _GLOBAL__sub_I_ETLDIAGLogging_cpp(capabilities::radio *a1)
{
  uint64_t result;
  int v2;

  result = capabilities::radio::mav20Plus(a1);
  if ((_DWORD)result)
    v2 = 2;
  else
    v2 = 0;
  dword_253E92BCC = v2;
  return result;
}

uint64_t ETLBBPing()
{
  return MEMORY[0x24BED3E48]();
}

uint64_t ETLBBPingCheckResponse()
{
  return MEMORY[0x24BED3E50]();
}

uint64_t ETLDMCEventGetNumRanges()
{
  return MEMORY[0x24BED3D90]();
}

uint64_t ETLDMCEventGetRange()
{
  return MEMORY[0x24BED3D98]();
}

uint64_t ETLDMCKeyword()
{
  return MEMORY[0x24BED3DA0]();
}

uint64_t ETLDMCLogGetEnabledEquipIDs()
{
  return MEMORY[0x24BED3DA8]();
}

uint64_t ETLDMCLogGetMask()
{
  return MEMORY[0x24BED3DB0]();
}

uint64_t ETLDMCMessageGetNumRanges()
{
  return MEMORY[0x24BED3DB8]();
}

uint64_t ETLDMCMessageGetRangeAndMasks()
{
  return MEMORY[0x24BED3DC0]();
}

uint64_t ETLDiagCreateGUIDDB()
{
  return MEMORY[0x24BED3E88]();
}

uint64_t ETLDiagGetSubsysCmdString()
{
  return MEMORY[0x24BED3E90]();
}

uint64_t ETLDiagReleaseGUIDDB()
{
  return MEMORY[0x24BED3E98]();
}

uint64_t ETLEVENTEnable()
{
  return MEMORY[0x24BED3DC8]();
}

uint64_t ETLEVENTGetMask()
{
  return MEMORY[0x24BED3DD0]();
}

uint64_t ETLEVENTSetMask()
{
  return MEMORY[0x24BED3DD8]();
}

uint64_t ETLFlushResponseFull()
{
  return MEMORY[0x24BED3EA0]();
}

uint64_t ETLLOGClearAllEnabledMasksWithRetry()
{
  return MEMORY[0x24BED3DE0]();
}

uint64_t ETLLOGDisable()
{
  return MEMORY[0x24BED3DE8]();
}

uint64_t ETLLOGEquipIDAsString()
{
  return MEMORY[0x24BED3DF0]();
}

uint64_t ETLLOGSetMaskWithRetry()
{
  return MEMORY[0x24BED3DF8]();
}

uint64_t ETLMESSAGEGetSubsystemIDRanges()
{
  return MEMORY[0x24BED3E00]();
}

uint64_t ETLMESSAGESetAllSubsystemRunTimeMasks()
{
  return MEMORY[0x24BED3E08]();
}

uint64_t ETLMESSAGESetFlags()
{
  return MEMORY[0x24BED3E10]();
}

uint64_t ETLMESSAGESetSubsystemRuntimeMasksWithRetry()
{
  return MEMORY[0x24BED3E18]();
}

uint64_t ETLMaverickADPLEnable()
{
  return MEMORY[0x24BED3EF8]();
}

uint64_t ETLMaverickQDSSEnable()
{
  return MEMORY[0x24BED3F48]();
}

uint64_t ETLMaverickSetFlags()
{
  return MEMORY[0x24BED3F68]();
}

uint64_t ETLQtraceClearSend()
{
  return MEMORY[0x24BED3E20]();
}

uint64_t ETLQtraceSend()
{
  return MEMORY[0x24BED3E28]();
}

uint64_t _ETLDMCGetView()
{
  return MEMORY[0x24BED3E30]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x24BED3FB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ETLDMCDebugGetMessageRange()
{
  return MEMORY[0x24BED3E38]();
}

uint64_t capabilities::diag::diagVersion(capabilities::diag *this)
{
  return MEMORY[0x24BED91F8](this);
}

uint64_t capabilities::diag::supportsBSPFlagSet(capabilities::diag *this)
{
  return MEMORY[0x24BED9208](this);
}

uint64_t capabilities::diag::supportedInterfaces(capabilities::diag *this)
{
  return MEMORY[0x24BED9210](this);
}

uint64_t capabilities::diag::operator&()
{
  return MEMORY[0x24BED9218]();
}

uint64_t capabilities::diag::operator|()
{
  return MEMORY[0x24BED9220]();
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x24BED92C0](this);
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  return MEMORY[0x24BED92C8](this);
}

uint64_t ctu::hex0(ctu *this)
{
  return MEMORY[0x24BED9BE8](this);
}

{
  return MEMORY[0x24BED9BF0](this);
}

{
  return MEMORY[0x24BED9BF8](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF70]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CEEA400(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CEEA408(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x24BDAD268](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x24BDAFFF8](__str, __sep, __lasts);
}

