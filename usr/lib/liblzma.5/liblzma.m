uint64_t lzma_auto_decoder(_QWORD *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    v6 = auto_decoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v7 = a1[7];
      *(_BYTE *)(v7 + 96) = 1;
      *(_BYTE *)(v7 + 99) = 1;
    }
  }
  return v6;
}

uint64_t lzma_strm_init(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 11;
  v2 = (_QWORD *)a1[7];
  if (!v2)
  {
    v2 = lzma_alloc(0x68uLL, a1[6]);
    a1[7] = v2;
    if (!v2)
      return 5;
    *v2 = 0;
    v2[1] = -1;
    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    *((_OWORD *)v2 + 4) = 0u;
  }
  v3 = 0;
  *((_BYTE *)v2 + 100) = 0;
  *((_DWORD *)v2 + 24) = 0;
  v4 = a1[7];
  *(_DWORD *)(v4 + 80) = 0;
  *(_BYTE *)(v4 + 101) = 0;
  a1[2] = 0;
  a1[5] = 0;
  return v3;
}

void lzma_end(uint64_t a1)
{
  uint64_t v2;
  double end;
  uint64_t v4;
  void (*v5)(_QWORD, _QWORD, double);

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
    {
      end = lzma_next_end(v2, *(_QWORD *)(a1 + 48));
      v4 = *(_QWORD *)(a1 + 48);
      if (v4 && (v5 = *(void (**)(_QWORD, _QWORD, double))(v4 + 8)) != 0)
        v5(*(_QWORD *)(v4 + 16), *(_QWORD *)(a1 + 56), end);
      else
        free(*(void **)(a1 + 56));
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

uint64_t alone_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8, __n128 a9, int a10)
{
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x24BDAC8D0];
  if (*a7 < a8)
  {
    v17 = *(_DWORD *)(a1 + 80);
    if (v17 == 4)
      return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))(a1 + 24))(*(_QWORD *)a1, a2, a3, a4, a5, a6, a7, a8, a10);
    while (1)
    {
      v18 = *a4;
      if (*a4 >= a5)
        return 0;
      switch(v17)
      {
        case 0:
          if (lzma_lzma_lclppb_decode((_DWORD *)(a1 + 120), *(unsigned __int8 *)(a3 + v18)))
            return 7;
          v17 = 1;
          goto LABEL_12;
        case 1:
          v19 = *(_QWORD *)(a1 + 88);
          v20 = *(_DWORD *)(a1 + 120) | ((unint64_t)*(unsigned __int8 *)(a3 + v18) << (8 * v19));
          *(_DWORD *)(a1 + 120) = v20;
          *(_QWORD *)(a1 + 88) = ++v19;
          if (v19 == 4)
          {
            if (*(_BYTE *)(a1 + 84))
            {
              if (v20 != -1)
              {
                v21 = (v20 - 1) | ((v20 - 1) >> 2) | (((v20 - 1) | ((v20 - 1) >> 2)) >> 3);
                v22 = v21 | (v21 >> 4) | ((v21 | (v21 >> 4)) >> 8);
                if ((v22 | HIWORD(v22)) + 1 != v20)
                  return 7;
              }
            }
            *(_QWORD *)(a1 + 88) = 0;
            v17 = 2;
LABEL_12:
            *(_DWORD *)(a1 + 80) = v17;
          }
          else
          {
            v17 = 1;
          }
          *a4 = v18 + 1;
          goto LABEL_24;
        case 2:
          v23 = *(_QWORD *)(a1 + 88);
          v24 = ((unint64_t)*(unsigned __int8 *)(a3 + v18) << (8 * v23)) | *(_QWORD *)(a1 + 96);
          *a4 = v18 + 1;
          *(_QWORD *)(a1 + 88) = ++v23;
          *(_QWORD *)(a1 + 96) = v24;
          if (v23 >= 8)
          {
            if (*(_BYTE *)(a1 + 84) && v24 - 0x4000000000 < 0xFFFFFFBFFFFFFFFFLL)
              return 7;
            *(_DWORD *)(a1 + 168) = 1;
            *(_QWORD *)(a1 + 172) = v24;
            v25 = lzma_lzma_decoder_memusage((unsigned int *)(a1 + 120)) + 0x8000;
            *(_QWORD *)(a1 + 112) = v25;
            *(_QWORD *)(a1 + 88) = 0;
            *(_DWORD *)(a1 + 80) = 3;
LABEL_21:
            if (v25 > *(_QWORD *)(a1 + 104))
              return 6;
            v28[0] = 0x4000000000000002;
            v28[1] = lzma_lzma_decoder_init;
            v28[2] = a1 + 120;
            memset(&v28[3], 0, 24);
            result = lzma_next_filter_init(a1, a2, v28, a9);
            if ((_DWORD)result)
              return result;
            v17 = 4;
            *(_DWORD *)(a1 + 80) = 4;
          }
          else
          {
            v17 = 2;
          }
LABEL_24:
          if (v17 == 4)
            return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))(a1 + 24))(*(_QWORD *)a1, a2, a3, a4, a5, a6, a7, a8, a10);
          break;
        case 3:
          v25 = *(_QWORD *)(a1 + 112);
          goto LABEL_21;
        default:
          return 11;
      }
    }
  }
  return 0;
}

uint64_t lzma_lz_decoder_init(char **a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(char *, uint64_t, _QWORD, _QWORD, unint64_t *))
{
  char *v8;
  char *v9;
  uint64_t result;
  __n128 v11;
  unint64_t v12;
  void *v13;
  char *v14;
  size_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v8 = *a1;
  if (!*a1)
  {
    v9 = (char *)lzma_alloc(0x10C0uLL, a2);
    if (!v9)
      return 5;
    v8 = v9;
    *a1 = v9;
    a1[3] = (char *)lz_decode;
    a1[4] = (char *)lz_decoder_end;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 4) = 0;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    *((_QWORD *)v9 + 10) = 0;
    *((_QWORD *)v9 + 11) = 0;
    *((_QWORD *)v9 + 12) = -1;
    *(_OWORD *)(v9 + 104) = 0u;
    *(_OWORD *)(v9 + 120) = 0u;
    *(_OWORD *)(v9 + 136) = 0u;
    *(_OWORD *)(v9 + 152) = 0u;
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
  result = a4(v8 + 48, a2, *a3, a3[2], &v16);
  if ((_DWORD)result)
    return result;
  v12 = v16;
  if (v16 >= 0x1000)
  {
    if (v16 > 0xFFFFFFFFFFFFFFF0)
      return 5;
  }
  else
  {
    v12 = 4096;
  }
  v16 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (*((_QWORD *)v8 + 4) == v16)
    goto LABEL_11;
  lzma_free(*(void **)v8, a2);
  v13 = lzma_alloc(v16, a2);
  *(_QWORD *)v8 = v13;
  if (!v13)
    return 5;
  *((_QWORD *)v8 + 4) = v16;
LABEL_11:
  v14 = *a1;
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 2) = 0;
  *(_BYTE *)(*((_QWORD *)v14 + 4) + *(_QWORD *)v14 - 1) = 0;
  v14[40] = 0;
  if (v17 && v18)
  {
    if (v18 >= v16)
      v15 = v16;
    else
      v15 = v18;
    memcpy(*(void **)v8, (const void *)(v17 + v18 - v15), v15);
    *((_QWORD *)v8 + 1) = v15;
    *((_QWORD *)v8 + 2) = v15;
  }
  *((_WORD *)v8 + 84) = 0;
  *((_QWORD *)v8 + 22) = 0;
  *((_QWORD *)v8 + 23) = 0;
  return lzma_next_filter_init((uint64_t)(v8 + 88), a2, a3 + 3, v11);
}

void *lzma_alloc(unint64_t a1, uint64_t a2)
{
  size_t v2;

  if (a1 <= 1)
    v2 = 1;
  else
    v2 = a1;
  if (a2 && *(_QWORD *)a2)
    return (void *)(*(uint64_t (**)(_QWORD, uint64_t, size_t))a2)(*(_QWORD *)(a2 + 16), 1, v2);
  else
    return malloc_type_malloc(v2, 0xF28FC463uLL);
}

uint64_t lzma_next_filter_init(uint64_t a1, uint64_t a2, _QWORD *a3, __n128 a4)
{
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD *, __n128);

  v7 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, __n128))a3[1];
  if (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, __n128))(a1 + 16) != v7)
  {
    a4.n128_f64[0] = lzma_next_end(a1, a2);
    v7 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *, __n128))a3[1];
  }
  *(_QWORD *)(a1 + 8) = *a3;
  *(_QWORD *)(a1 + 16) = v7;
  if (v7)
    return v7(a1, a2, a3, a4);
  else
    return 0;
}

BOOL lzma_lzma_lclppb_decode(_DWORD *a1, unsigned int a2)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  int v6;

  if (a2 > 0xE0)
    return 1;
  v3 = (((a2 - ((unsigned __int16)(109 * a2) >> 8)) >> 1) + ((109 * a2) >> 8)) >> 5;
  a1[7] = v3;
  v4 = (a2 - 45 * v3);
  v5 = 57 * v4;
  v6 = v4 - 9 * ((57 * v4) >> 9);
  a1[5] = v6;
  a1[6] = v5 >> 9;
  return v6 + (v5 >> 9) > 4;
}

uint64_t lzma_lzma_decoder_memusage(unsigned int *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  BOOL v4;

  v1 = a1[5];
  if (v1 > 4)
    return -1;
  v2 = a1[6];
  v3 = v2 + v1;
  v4 = v2 > 4 || v3 > 4;
  if (v4 || a1[7] > 4)
    return -1;
  else
    return lzma_lz_decoder_memusage(*a1) + 28352;
}

uint64_t lzma_lzma_decoder_init(char **a1, uint64_t a2, _QWORD *a3)
{
  return lzma_lz_decoder_init(a1, a2, a3, (uint64_t (*)(char *, uint64_t, _QWORD, _QWORD, unint64_t *))lzma_decoder_init);
}

uint64_t lzma_lz_decoder_memusage(uint64_t a1)
{
  return a1 + 4288;
}

uint64_t lzma_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned int v5;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  uint64_t result;
  uint64_t v16;

  v5 = *(_DWORD *)(a4 + 20);
  if (v5 > 4)
    return 11;
  v7 = *(_DWORD *)(a4 + 24);
  v8 = v7 + v5;
  v9 = v7 > 4 || v8 > 4;
  if (v9 || *(_DWORD *)(a4 + 28) > 4u)
    return 11;
  if (a3 == 0x4000000000000002)
  {
    v11 = *(_DWORD *)(a4 + 48);
    if (v11 > 1)
      return 8;
    v12 = *(_QWORD *)(a4 + 52);
    if (v11)
      v13 = 1;
    else
      v13 = v12 == -1;
    v14 = v13;
  }
  else
  {
    v14 = 1;
    v12 = -1;
  }
  result = lzma_lzma_decoder_create(a1, a2, (unsigned int *)a4, a5);
  if (!(_DWORD)result)
  {
    lzma_decoder_reset(*a1, (_DWORD *)a4);
    result = 0;
    v16 = *a1;
    *(_QWORD *)(v16 + 28312) = v12;
    *(_BYTE *)(v16 + 28320) = v14;
  }
  return result;
}

void lzma_decoder_reset(uint64_t a1, _DWORD *a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  _WORD *v9;
  uint64_t v10;
  _WORD *v11;
  _WORD *v12;
  uint64_t i;
  unsigned int v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;

  v17 = a1 + 28268;
  v15 = (_DWORD *)(a1 + 27240);
  v3 = (_DWORD *)(a1 + 26212);
  v4 = a2[6];
  v16 = a2[7];
  v5 = a2[5];
  v6 = 1;
  do
    memset_pattern16((void *)(a1 + 1536 * (v6 - 1)), &unk_2299575E0, 0x600uLL);
  while (!(v6++ >> (v4 + v5)));
  v8 = 0;
  *(_DWORD *)(v17 + 36) = v5;
  *(_DWORD *)(v17 + 40) = ~(-1 << v4);
  *(_OWORD *)(a1 + 28280) = 0u;
  *(_DWORD *)(a1 + 28296) = 0;
  *(_DWORD *)(v17 + 32) = ~(-1 << v16);
  v9 = (_WORD *)(a1 + 24576);
  *(_QWORD *)v17 = 0xFFFFFFFFLL;
  *(_DWORD *)(v17 + 8) = 5;
  do
  {
    v10 = -(-1 << v16);
    v11 = v9;
    do
    {
      *v11 = 1024;
      v11[240] = 1024;
      ++v11;
      --v10;
    }
    while (v10);
    v12 = (_WORD *)(a1 + 2 * v8);
    v12[12480] = 1024;
    v12[12492] = 1024;
    ++v8;
    v9 += 16;
    v12[12504] = 1024;
    v12[12516] = 1024;
  }
  while (v8 != 12);
  for (i = 0; i != 512; i += 128)
    memset_pattern16((void *)(a1 + 25440 + i), &unk_2299575E0, 0x80uLL);
  memset_pattern16((void *)(a1 + 25952), &unk_2299575E0, 0xE4uLL);
  memset_pattern16((void *)(a1 + 26180), &unk_2299575E0, 0x20uLL);
  v14 = 0;
  *v3 = 67109888;
  *v15 = 67109888;
  do
  {
    memset_pattern16((void *)(a1 + 26216 + 16 * v14), &unk_2299575E0, 0x10uLL);
    memset_pattern16((void *)(a1 + 26472 + 16 * v14), &unk_2299575E0, 0x10uLL);
    memset_pattern16((void *)(a1 + 27244 + 16 * v14), &unk_2299575E0, 0x10uLL);
    memset_pattern16((void *)(a1 + 27500 + 16 * v14++), &unk_2299575E0, 0x10uLL);
  }
  while (!(v14 >> v16));
  memset_pattern16((void *)(a1 + 26728), &unk_2299575E0, 0x200uLL);
  memset_pattern16((void *)(a1 + 27756), &unk_2299575E0, 0x200uLL);
  *(_DWORD *)(v17 + 56) = 1;
  *(_QWORD *)(a1 + 28328) = 0;
  *(_QWORD *)(a1 + 28344) = 0;
  *(_QWORD *)(a1 + 28336) = 0;
}

double lzma_decode(uint64_t a1, const void **a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  char *v25;
  BOOL v26;
  _BOOL8 v27;
  char *v28;
  int v29;
  unsigned __int16 *v30;
  unsigned __int16 *v31;
  _BYTE *v32;
  const void *v33;
  unsigned int v34;
  unint64_t v35;
  int v36;
  char v37;
  unsigned int v38;
  int v39;
  _WORD *v40;
  int v41;
  unsigned int v42;
  const void *v43;
  int v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int v67;
  int v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  uint64_t v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  int v77;
  _WORD *v78;
  int v79;
  unsigned int v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  _WORD *v85;
  int v86;
  unsigned int v87;
  int v88;
  _WORD *v89;
  int v90;
  unsigned int v91;
  int v92;
  _WORD *v93;
  int v94;
  unsigned int v95;
  _BYTE *v96;
  int v97;
  _WORD *v98;
  int v99;
  unsigned int v100;
  uint64_t v101;
  unsigned int v102;
  int v103;
  int v104;
  unsigned int v105;
  int v106;
  _WORD *v107;
  int v108;
  unsigned int v109;
  int v110;
  _WORD *v111;
  int v112;
  unsigned int v113;
  int v114;
  _WORD *v115;
  int v116;
  unsigned int v117;
  int v118;
  _WORD *v119;
  int v120;
  unsigned int v121;
  int v122;
  _WORD *v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  BOOL v128;
  int v129;
  int v130;
  _WORD *v131;
  int v132;
  unsigned int v133;
  int v134;
  _WORD *v135;
  int v136;
  unsigned int v137;
  int v138;
  _WORD *v139;
  int v140;
  unsigned int v141;
  int v142;
  _WORD *v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  BOOL v148;
  int v149;
  int v150;
  int v151;
  unsigned int v152;
  int v153;
  _WORD *v154;
  int v155;
  unsigned int v156;
  int v157;
  _WORD *v158;
  int v159;
  unsigned int v160;
  int v161;
  _WORD *v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  unsigned int v166;
  BOOL v167;
  int v168;
  _WORD *v169;
  int v170;
  unsigned int v171;
  int v172;
  int v173;
  unsigned int v174;
  int v175;
  _WORD *v176;
  int v177;
  unsigned int v178;
  int v179;
  _WORD *v180;
  int v181;
  unsigned int v182;
  int v183;
  _WORD *v184;
  int v185;
  unsigned int v186;
  int v187;
  _WORD *v188;
  int v189;
  unsigned int v190;
  int v191;
  _WORD *v192;
  int v193;
  unsigned int v194;
  int v195;
  _WORD *v196;
  int v197;
  unsigned int v198;
  int v199;
  _WORD *v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  BOOL v205;
  int v206;
  _WORD *v207;
  int v208;
  unsigned int v209;
  int v210;
  _WORD *v211;
  unsigned int v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  BOOL v216;
  int v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  unsigned int v221;
  unsigned int v222;
  int v223;
  _WORD *v224;
  int v225;
  unsigned int v226;
  int v227;
  _WORD *v228;
  int v229;
  unsigned int v230;
  int v231;
  uint64_t v232;
  unsigned int v233;
  unsigned int v234;
  int v235;
  _WORD *v236;
  int v237;
  unsigned int v238;
  int v239;
  _WORD *v240;
  int v241;
  unsigned int v242;
  int v243;
  uint64_t v244;
  unsigned int v245;
  unsigned int v246;
  int v247;
  uint64_t v248;
  unsigned int v249;
  unsigned int v250;
  int v251;
  _WORD *v252;
  int v253;
  unsigned int v254;
  int v255;
  uint64_t v256;
  unsigned int v257;
  unsigned int v258;
  int v259;
  _WORD *v260;
  unsigned int v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int v264;
  BOOL v265;
  int v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  unsigned int v270;
  BOOL v271;
  int v272;
  unsigned int v273;
  int v274;
  uint64_t v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  unsigned int v279;
  BOOL v280;
  int v281;
  uint64_t v282;
  unsigned int v283;
  unsigned int v284;
  unsigned int v285;
  unsigned int v286;
  BOOL v287;
  int v288;
  uint64_t v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  BOOL v294;
  int v295;
  uint64_t v296;
  unsigned int v297;
  unsigned int v298;
  unsigned int v299;
  unsigned int v300;
  BOOL v301;
  int v302;
  unsigned int v303;
  unsigned int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  _WORD *v309;
  int v310;
  unsigned int v311;
  int v312;
  _WORD *v313;
  int v314;
  unsigned int v315;
  int v316;
  _WORD *v317;
  int v318;
  unsigned int v319;
  int v320;
  _WORD *v321;
  unsigned int v322;
  unsigned int v323;
  unsigned int v324;
  unsigned __int16 *v325;
  _BOOL8 v326;
  size_t v327;
  const void *v328;
  unsigned int v329;
  uint64_t v330;
  double result;
  int v332;
  unsigned int v333;
  char *v334;
  char *v335;
  char *v336;
  unsigned __int8 *v337;
  int v338;
  uint64_t v339;
  int v340;
  unsigned int v341;
  unsigned int v342;
  unsigned int v343;
  unsigned int v344;
  BOOL v345;
  int v346;
  uint64_t v347;
  int v348;
  unsigned int v349;
  unsigned int v350;
  unsigned int v351;
  unsigned int v352;
  BOOL v353;
  int v354;
  uint64_t v355;
  int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v359;
  unsigned int v360;
  BOOL v361;
  int v362;
  uint64_t v363;
  int v364;
  unsigned int v365;
  unsigned int v366;
  unsigned int v367;
  unsigned int v368;
  BOOL v369;
  int v370;
  uint64_t v371;
  int v372;
  unsigned int v373;
  unsigned int v374;
  unsigned int v375;
  unsigned int v376;
  BOOL v377;
  int v378;
  uint64_t v379;
  int v380;
  unsigned int v381;
  unsigned int v382;
  unsigned int v383;
  unsigned int v384;
  BOOL v385;
  int v386;
  uint64_t v387;
  int v388;
  unsigned int v389;
  unsigned int v390;
  unsigned int v391;
  unsigned int v392;
  BOOL v393;
  uint64_t v394;
  int v395;
  unsigned int v396;
  unsigned int v397;
  int v398;
  int v399;
  uint64_t v400;
  uint64_t v401;
  int v402;
  int v403;
  char v404;
  unsigned int *v405;
  _QWORD *v407;
  const void *v408;
  int v409;
  unsigned int v410;
  unsigned int v411;
  unsigned int v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  int v417;
  unsigned int v418;
  unint64_t v419;
  unint64_t v420;
  unsigned int v421;
  const void *v422;
  unsigned int v423;
  _BYTE *v424;
  unsigned int v425;
  unsigned int v426;
  int v427;
  unint64_t v428;

  v5 = a1;
  v6 = *(_DWORD *)(a1 + 28276);
  if (v6)
  {
    v7 = 0;
    v8 = *a4;
    v9 = a3 + *a4;
    v10 = *a4 - a5;
    v11 = 0xFFFFFFFFLL;
    do
    {
      if (!(v10 + v7) || v6 - 5 == (_DWORD)v7 && *(_BYTE *)(v9 + v7))
        return result;
      v12 = *(unsigned __int8 *)(v9 + v7) | (*(_DWORD *)(a1 + 28272) << 8);
      *a4 = v8 + v7 + 1;
      *(_DWORD *)(a1 + 28272) = v12;
      *(_DWORD *)(a1 + 28276) = v6 + v11;
      ++v7;
      --v11;
    }
    while (v6 != (_DWORD)v7);
    v407 = a4;
    v13 = v8 + v7;
  }
  else
  {
    v12 = *(_DWORD *)(a1 + 28272);
    v407 = a4;
    v13 = *a4;
  }
  v15 = (unint64_t)a2[1];
  v14 = (unint64_t)a2[2];
  v428 = v15;
  v16 = (char *)a2[3];
  v17 = (unsigned int *)(a1 + 28268);
  v18 = *(_DWORD *)(a1 + 28268);
  v19 = *(_DWORD *)(a1 + 28280);
  v20 = *(unsigned int *)(a1 + 28284);
  v425 = *(_DWORD *)(a1 + 28288);
  v426 = *(_DWORD *)(a1 + 28292);
  v421 = *(_DWORD *)(a1 + 28296);
  v21 = *(_QWORD *)(a1 + 28328);
  v22 = *(_DWORD *)(a1 + 28336);
  v23 = *(_DWORD *)(a1 + 28340);
  v24 = *(_DWORD *)(a1 + 28348);
  v427 = *(_DWORD *)(a1 + 28344);
  v25 = *(char **)(a1 + 28312);
  v26 = v25 == (char *)-1;
  v27 = v25 > &v16[-v15] || v25 == (char *)-1;
  v408 = a2[1];
  v28 = &v25[v15];
  if (!v27)
    v16 = v28;
  v420 = (unint64_t)v16;
  v29 = *(_DWORD *)(a1 + 28324);
  v404 = v26;
  v30 = (unsigned __int16 *)(a1 + 27240);
  v31 = (unsigned __int16 *)(a1 + 26212);
  v32 = *a2;
  v33 = a2[4];
  v413 = v17[10];
  v405 = v17;
  v412 = v17[9];
  v423 = v17[8];
  v34 = v423 & v15;
  v35 = v420;
  v424 = v32;
  v422 = v33;
  v415 = a5;
  v416 = v5;
  v414 = a3;
  switch(v29)
  {
    case 0:
    case 1:
      goto LABEL_18;
    case 2:
      goto LABEL_31;
    case 3:
      goto LABEL_37;
    case 4:
      goto LABEL_43;
    case 5:
      goto LABEL_49;
    case 6:
      goto LABEL_55;
    case 7:
      goto LABEL_61;
    case 8:
      goto LABEL_67;
    case 9:
      goto LABEL_73;
    case 10:
      goto LABEL_512;
    case 11:
      goto LABEL_526;
    case 12:
      goto LABEL_540;
    case 13:
      goto LABEL_554;
    case 14:
      goto LABEL_568;
    case 15:
      goto LABEL_582;
    case 16:
      goto LABEL_596;
    case 17:
      goto LABEL_610;
    case 18:
      goto LABEL_617;
    case 19:
      goto LABEL_80;
    case 20:
      goto LABEL_88;
    case 21:
      goto LABEL_93;
    case 22:
      goto LABEL_169;
    case 23:
      goto LABEL_188;
    case 24:
      goto LABEL_127;
    case 25:
      goto LABEL_132;
    case 26:
      goto LABEL_144;
    case 27:
      goto LABEL_156;
    case 28:
      goto LABEL_138;
    case 29:
      goto LABEL_150;
    case 30:
      goto LABEL_182;
    case 31:
      goto LABEL_235;
    case 32:
      goto LABEL_252;
    case 33:
      goto LABEL_270;
    case 34:
      goto LABEL_295;
    case 35:
      goto LABEL_301;
    case 36:
      goto LABEL_317;
    case 37:
      goto LABEL_335;
    case 38:
      goto LABEL_353;
    case 39:
      goto LABEL_359;
    case 40:
      goto LABEL_371;
    case 41:
      goto LABEL_390;
    case 42:
      goto LABEL_405;
    case 43:
      goto LABEL_464;
    case 44:
      goto LABEL_469;
    case 45:
      goto LABEL_475;
    case 46:
      goto LABEL_481;
    case 47:
      goto LABEL_487;
    case 48:
      goto LABEL_628;
    case 49:
      goto LABEL_100;
    case 50:
      goto LABEL_113;
    case 51:
      goto LABEL_105;
    case 52:
      goto LABEL_121;
    case 53:
      goto LABEL_176;
    case 54:
      goto LABEL_205;
    case 55:
      goto LABEL_210;
    case 56:
      goto LABEL_216;
    case 57:
      goto LABEL_222;
    case 58:
      goto LABEL_241;
    case 59:
      goto LABEL_246;
    case 60:
      goto LABEL_264;
    case 61:
      goto LABEL_282;
    case 62:
      goto LABEL_258;
    case 63:
      goto LABEL_276;
    case 64:
      goto LABEL_323;
    case 65:
      goto LABEL_329;
    case 66:
      goto LABEL_341;
    case 67:
      goto LABEL_347;
    case 68:
      goto LABEL_365;
    case 69:
      goto LABEL_377;
    case 70:
      break;
    default:
      v36 = 0;
      goto LABEL_639;
  }
LABEL_495:
  v325 = v30;
  v326 = v27;
  if (v35 - v428 >= v24)
    v327 = v24;
  else
    v327 = (v35 - v428);
  v24 -= v327;
  if (v327 <= v20)
  {
    v417 = v23;
    v418 = v24;
    v419 = v14;
    if (v428 <= v20)
    {
      v410 = v20;
      v411 = v19;
      v332 = v428 + ~(_DWORD)v20;
      v333 = -v332;
      v334 = v32;
      v335 = &v32[v428];
      v336 = &v334[v332 + (_DWORD)v33];
      if (v327 <= -v332)
      {
        memmove(v335, v336, v327);
      }
      else
      {
        v409 = v428 + ~(_DWORD)v20;
        memmove(v335, v336, -v332);
        v327 = (v327 + v409);
        v428 += v333;
        memcpy(&v334[v428], v334, v327);
      }
      v24 = v418;
      v428 += v327;
      a5 = v415;
      v5 = v416;
      v14 = v419;
      v20 = v410;
      v19 = v411;
      v23 = v417;
      a3 = v414;
      v35 = v420;
      v32 = v424;
      v33 = v422;
    }
    else
    {
      v329 = v19;
      v330 = v20;
      memcpy(&v424[v428], &v424[v428 + ~(unint64_t)v20], v327);
      v33 = v422;
      v32 = v424;
      v20 = v330;
      v5 = v416;
      v19 = v329;
      v14 = v419;
      v428 += v327;
      v23 = v417;
      v24 = v418;
      a3 = v414;
      a5 = v415;
      v35 = v420;
    }
  }
  else
  {
    do
    {
      if (v428 <= v20)
        v328 = v33;
      else
        v328 = 0;
      v32[v428] = v32[~(unint64_t)v20 + (_QWORD)v328 + v428];
      ++v428;
      LODWORD(v327) = v327 - 1;
    }
    while ((_DWORD)v327);
  }
  if (v14 <= v428)
    v14 = v428;
  if (v24)
  {
    v36 = 0;
    v17 = v405;
    v405[14] = 70;
    goto LABEL_639;
  }
  v27 = v326;
  v30 = v325;
  while (1)
  {
    while (1)
    {
      v34 = v423 & v428;
LABEL_18:
      v37 = v428 != v35 || v27;
      if ((v37 & 1) == 0)
      {
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v17 = v405;
            v405[14] = 0;
            v428 = v35;
            goto LABEL_638;
          }
          v18 <<= 8;
          v402 = *(unsigned __int8 *)(a3 + v13++);
          v12 = v402 | (v12 << 8);
        }
        if (!v12)
        {
          v36 = 1;
LABEL_727:
          v428 = v35;
          goto LABEL_635;
        }
        v404 = 1;
        if (!*((_BYTE *)v405 + 52))
        {
          v36 = 9;
          goto LABEL_727;
        }
      }
      if (HIBYTE(v18))
      {
        v38 = v18;
      }
      else
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 1;
          goto LABEL_637;
        }
        v38 = v18 << 8;
        v39 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v39 | (v12 << 8);
      }
      v40 = (_WORD *)(v5 + 32 * v19 + 2 * v34 + 24576);
      v41 = (unsigned __int16)*v40;
      v18 = (v38 >> 11) * v41;
      v42 = v12 - v18;
      if (v12 < v18)
        break;
      v18 = v38 - v18;
      *v40 -= *v40 >> 5;
      v12 = v42;
LABEL_80:
      v76 = v426;
      v426 = v425;
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v17 = v405;
          v405[14] = 19;
          v13 = a5;
          v426 = v76;
          goto LABEL_639;
        }
        v18 <<= 8;
        v77 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v77 | (v12 << 8);
      }
      v78 = (_WORD *)(v5 + 2 * v19 + 24960);
      v79 = (unsigned __int16)*v78;
      v80 = (v18 >> 11) * v79;
      if (v12 < v80)
      {
        *v78 = v79 + ((2048 - v79) >> 5);
        if (v19 >= 7)
          v19 = 10;
        else
          v19 = 7;
        v22 = 1;
        v18 = (v18 >> 11) * v79;
        v425 = v20;
        v421 = v76;
        v35 = v420;
LABEL_88:
        if (!HIBYTE(v18))
        {
          if (v13 != a5)
          {
            v18 <<= 8;
            v81 = *(unsigned __int8 *)(a3 + v13++);
            v12 = v81 | (v12 << 8);
            goto LABEL_91;
          }
          v36 = 0;
          v399 = 20;
          goto LABEL_637;
        }
LABEL_91:
        v82 = *v31;
        v83 = (v18 >> 11) * v82;
        if (v12 >= v83)
        {
          v18 -= v83;
          *v31 -= *v31 >> 5;
          v12 -= v83;
LABEL_127:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 24;
              goto LABEL_637;
            }
            v103 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v103 | (v12 << 8);
          }
          v104 = v31[1];
          v105 = (v18 >> 11) * v104;
          if (v12 >= v105)
          {
            v18 -= v105;
            v31[1] -= v31[1] >> 5;
            v12 -= v105;
LABEL_138:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 28;
                goto LABEL_637;
              }
              v110 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v110 | (v12 << 8);
            }
            v111 = (_WORD *)(v5 + 2 * v22 + 26728);
            v112 = (unsigned __int16)*v111;
            v113 = (v18 >> 11) * v112;
            v22 *= 2;
            if (v12 >= v113)
            {
              v18 -= v113;
              *v111 -= *v111 >> 5;
              v22 |= 1u;
              v12 -= v113;
            }
            else
            {
              *v111 = v112 + ((2048 - v112) >> 5);
              v18 = (v18 >> 11) * v112;
            }
LABEL_150:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 29;
                goto LABEL_637;
              }
              v118 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v118 | (v12 << 8);
            }
            v119 = (_WORD *)(v5 + 2 * v22 + 26728);
            v120 = (unsigned __int16)*v119;
            v121 = (v18 >> 11) * v120;
            v22 *= 2;
            if (v12 >= v121)
            {
              v18 -= v121;
              *v119 -= *v119 >> 5;
              v22 |= 1u;
              v12 -= v121;
            }
            else
            {
              *v119 = v120 + ((2048 - v120) >> 5);
              v18 = (v18 >> 11) * v120;
            }
LABEL_182:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 30;
                goto LABEL_637;
              }
              v138 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v138 | (v12 << 8);
            }
            v139 = (_WORD *)(v5 + 2 * v22 + 26728);
            v140 = (unsigned __int16)*v139;
            v141 = (v18 >> 11) * v140;
            v22 *= 2;
            if (v12 >= v141)
            {
              v18 -= v141;
              *v139 -= *v139 >> 5;
              v22 |= 1u;
              v12 -= v141;
            }
            else
            {
              *v139 = v140 + ((2048 - v140) >> 5);
              v18 = (v18 >> 11) * v140;
            }
LABEL_235:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 31;
                goto LABEL_637;
              }
              v168 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v168 | (v12 << 8);
            }
            v169 = (_WORD *)(v5 + 2 * v22 + 26728);
            v170 = (unsigned __int16)*v169;
            v171 = (v18 >> 11) * v170;
            v22 *= 2;
            if (v12 >= v171)
            {
              v18 -= v171;
              *v169 -= *v169 >> 5;
              v22 |= 1u;
              v12 -= v171;
            }
            else
            {
              *v169 = v170 + ((2048 - v170) >> 5);
              v18 = (v18 >> 11) * v170;
            }
LABEL_252:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 32;
                goto LABEL_637;
              }
              v179 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v179 | (v12 << 8);
            }
            v180 = (_WORD *)(v5 + 2 * v22 + 26728);
            v181 = (unsigned __int16)*v180;
            v182 = (v18 >> 11) * v181;
            v22 *= 2;
            if (v12 >= v182)
            {
              v18 -= v182;
              *v180 -= *v180 >> 5;
              v22 |= 1u;
              v12 -= v182;
            }
            else
            {
              *v180 = v181 + ((2048 - v181) >> 5);
              v18 = (v18 >> 11) * v181;
            }
LABEL_270:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 33;
                goto LABEL_637;
              }
              v191 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v191 | (v12 << 8);
            }
            v192 = (_WORD *)(v5 + 2 * v22 + 26728);
            v193 = (unsigned __int16)*v192;
            v194 = (v18 >> 11) * v193;
            v22 *= 2;
            if (v12 >= v194)
            {
              v18 -= v194;
              *v192 -= *v192 >> 5;
              v22 |= 1u;
              v12 -= v194;
            }
            else
            {
              *v192 = v193 + ((2048 - v193) >> 5);
              v18 = (v18 >> 11) * v193;
            }
LABEL_295:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 34;
                goto LABEL_637;
              }
              v206 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v206 | (v12 << 8);
            }
            v207 = (_WORD *)(v5 + 2 * v22 + 26728);
            v208 = (unsigned __int16)*v207;
            v209 = (v18 >> 11) * v208;
            v22 *= 2;
            if (v12 >= v209)
            {
              v18 -= v209;
              *v207 -= *v207 >> 5;
              v22 |= 1u;
              v12 -= v209;
            }
            else
            {
              *v207 = v208 + ((2048 - v208) >> 5);
              v18 = (v18 >> 11) * v208;
            }
LABEL_301:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 35;
                goto LABEL_637;
              }
              v210 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v210 | (v12 << 8);
            }
            v211 = (_WORD *)(v5 + 2 * v22 + 26728);
            v212 = (unsigned __int16)*v211;
            v213 = (v18 >> 11) * v212;
            v214 = v212 - (v212 >> 5);
            v215 = v212 + ((2048 - v212) >> 5);
            v216 = v12 >= v213;
            if (v12 < v213)
            {
              v18 = v213;
            }
            else
            {
              LOWORD(v215) = v214;
              v18 -= v213;
            }
            if (v12 >= v213)
              v12 -= v213;
            if (v216)
              v217 = (2 * v22) | 1;
            else
              v217 = 2 * v22;
            *v211 = v215;
            v24 = v217 - 238;
          }
          else
          {
            v31[1] = v104 + ((2048 - v104) >> 5);
            v18 = (v18 >> 11) * v104;
LABEL_132:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 25;
                goto LABEL_637;
              }
              v106 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v106 | (v12 << 8);
            }
            v107 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 26472);
            v108 = (unsigned __int16)*v107;
            v109 = (v18 >> 11) * v108;
            v22 *= 2;
            if (v12 >= v109)
            {
              v18 -= v109;
              *v107 -= *v107 >> 5;
              v22 |= 1u;
              v12 -= v109;
            }
            else
            {
              *v107 = v108 + ((2048 - v108) >> 5);
              v18 = (v18 >> 11) * v108;
            }
LABEL_144:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 26;
                goto LABEL_637;
              }
              v114 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v114 | (v12 << 8);
            }
            v115 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 26472);
            v116 = (unsigned __int16)*v115;
            v117 = (v18 >> 11) * v116;
            v22 *= 2;
            if (v12 >= v117)
            {
              v18 -= v117;
              *v115 -= *v115 >> 5;
              v22 |= 1u;
              v12 -= v117;
            }
            else
            {
              *v115 = v116 + ((2048 - v116) >> 5);
              v18 = (v18 >> 11) * v116;
            }
LABEL_156:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 27;
                goto LABEL_637;
              }
              v122 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v122 | (v12 << 8);
            }
            v123 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 26472);
            v124 = (unsigned __int16)*v123;
            v125 = (v18 >> 11) * v124;
            v126 = v124 - (v124 >> 5);
            v127 = v124 + ((2048 - v124) >> 5);
            v128 = v12 >= v125;
            if (v12 < v125)
            {
              v18 = v125;
            }
            else
            {
              LOWORD(v127) = v126;
              v18 -= v125;
            }
            if (v12 >= v125)
              v12 -= v125;
            if (v128)
              v129 = (2 * v22) | 1;
            else
              v129 = 2 * v22;
            *v123 = v127;
            v24 = v129 + 2;
          }
        }
        else
        {
          *v31 = v82 + ((2048 - v82) >> 5);
          v18 = (v18 >> 11) * v82;
LABEL_93:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 21;
              goto LABEL_637;
            }
            v18 <<= 8;
            v84 = *(unsigned __int8 *)(a3 + v13++);
            v12 = v84 | (v12 << 8);
          }
          v85 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 26216);
          v86 = (unsigned __int16)*v85;
          v87 = (v18 >> 11) * v86;
          v22 *= 2;
          if (v12 >= v87)
          {
            v18 -= v87;
            *v85 -= *v85 >> 5;
            v22 |= 1u;
            v12 -= v87;
          }
          else
          {
            *v85 = v86 + ((2048 - v86) >> 5);
            v18 = (v18 >> 11) * v86;
          }
LABEL_169:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 22;
              goto LABEL_637;
            }
            v130 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v130 | (v12 << 8);
          }
          v131 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 26216);
          v132 = (unsigned __int16)*v131;
          v133 = (v18 >> 11) * v132;
          v22 *= 2;
          if (v12 >= v133)
          {
            v18 -= v133;
            *v131 -= *v131 >> 5;
            v22 |= 1u;
            v12 -= v133;
          }
          else
          {
            *v131 = v132 + ((2048 - v132) >> 5);
            v18 = (v18 >> 11) * v132;
          }
LABEL_188:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 23;
              goto LABEL_637;
            }
            v142 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v142 | (v12 << 8);
          }
          v143 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 26216);
          v144 = (unsigned __int16)*v143;
          v145 = (v18 >> 11) * v144;
          v146 = v144 - (v144 >> 5);
          v147 = v144 + ((2048 - v144) >> 5);
          v148 = v12 >= v145;
          if (v12 < v145)
          {
            v18 = v145;
          }
          else
          {
            LOWORD(v147) = v146;
            v18 -= v145;
          }
          if (v12 >= v145)
            v12 -= v145;
          if (v148)
            v149 = (2 * v22) | 1;
          else
            v149 = 2 * v22;
          *v143 = v147;
          v24 = v149 - 6;
        }
        LODWORD(v218) = v24 - 2;
        if (v24 >= 6)
          v218 = 3;
        else
          v218 = v218;
        v21 = v5 + (v218 << 7) + 25440;
        v22 = 1;
LABEL_317:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 36;
            goto LABEL_637;
          }
          v219 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v219 | (v12 << 8);
        }
        v220 = v22;
        v221 = *(unsigned __int16 *)(v21 + 2 * v22);
        v222 = (v18 >> 11) * v221;
        v22 *= 2;
        if (v12 >= v222)
        {
          v18 -= v222;
          *(_WORD *)(v21 + 2 * v220) = v221 - (v221 >> 5);
          v22 |= 1u;
          v12 -= v222;
        }
        else
        {
          *(_WORD *)(v21 + 2 * v220) = v221 + ((2048 - v221) >> 5);
          v18 = (v18 >> 11) * v221;
        }
LABEL_335:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 37;
            goto LABEL_637;
          }
          v231 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v231 | (v12 << 8);
        }
        v232 = v22;
        v233 = *(unsigned __int16 *)(v21 + 2 * v22);
        v234 = (v18 >> 11) * v233;
        v22 *= 2;
        if (v12 >= v234)
        {
          v18 -= v234;
          *(_WORD *)(v21 + 2 * v232) = v233 - (v233 >> 5);
          v22 |= 1u;
          v12 -= v234;
        }
        else
        {
          *(_WORD *)(v21 + 2 * v232) = v233 + ((2048 - v233) >> 5);
          v18 = (v18 >> 11) * v233;
        }
LABEL_353:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 38;
            goto LABEL_637;
          }
          v243 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v243 | (v12 << 8);
        }
        v244 = v22;
        v245 = *(unsigned __int16 *)(v21 + 2 * v22);
        v246 = (v18 >> 11) * v245;
        v22 *= 2;
        if (v12 >= v246)
        {
          v18 -= v246;
          *(_WORD *)(v21 + 2 * v244) = v245 - (v245 >> 5);
          v22 |= 1u;
          v12 -= v246;
        }
        else
        {
          *(_WORD *)(v21 + 2 * v244) = v245 + ((2048 - v245) >> 5);
          v18 = (v18 >> 11) * v245;
        }
LABEL_359:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 39;
            goto LABEL_637;
          }
          v247 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v247 | (v12 << 8);
        }
        v248 = v22;
        v249 = *(unsigned __int16 *)(v21 + 2 * v22);
        v250 = (v18 >> 11) * v249;
        v22 *= 2;
        if (v12 >= v250)
        {
          v18 -= v250;
          *(_WORD *)(v21 + 2 * v248) = v249 - (v249 >> 5);
          v22 |= 1u;
          v12 -= v250;
        }
        else
        {
          *(_WORD *)(v21 + 2 * v248) = v249 + ((2048 - v249) >> 5);
          v18 = (v18 >> 11) * v249;
        }
LABEL_371:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 40;
            goto LABEL_637;
          }
          v255 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v255 | (v12 << 8);
        }
        v256 = v22;
        v257 = *(unsigned __int16 *)(v21 + 2 * v22);
        v258 = (v18 >> 11) * v257;
        v22 *= 2;
        if (v12 >= v258)
        {
          v18 -= v258;
          *(_WORD *)(v21 + 2 * v256) = v257 - (v257 >> 5);
          v22 |= 1u;
          v12 -= v258;
        }
        else
        {
          *(_WORD *)(v21 + 2 * v256) = v257 + ((2048 - v257) >> 5);
          v18 = (v18 >> 11) * v257;
        }
LABEL_390:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 41;
            goto LABEL_637;
          }
          v266 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v266 | (v12 << 8);
        }
        v267 = *(unsigned __int16 *)(v21 + 2 * v22);
        v268 = (v18 >> 11) * v267;
        v269 = v267 - (v267 >> 5);
        v270 = v267 + ((2048 - v267) >> 5);
        v271 = v12 >= v268;
        if (v12 >= v268)
        {
          v18 -= v268;
        }
        else
        {
          LOWORD(v269) = v270;
          v18 = v268;
        }
        if (v12 >= v268)
          v12 -= v268;
        if (v271)
          v272 = (2 * v22) | 1;
        else
          v272 = 2 * v22;
        *(_WORD *)(v21 + 2 * v22) = v269;
        v22 = v272 - 64;
        if ((v272 - 64) >= 4)
        {
          v273 = v22 >> 1;
          LODWORD(v20) = v272 & 1 | 2;
          if (v22 > 0xD)
          {
            v23 = v273 - 5;
            do
            {
LABEL_464:
              if (!HIBYTE(v18))
              {
                if (v13 == a5)
                {
                  v36 = 0;
                  v399 = 43;
                  goto LABEL_637;
                }
                v18 <<= 8;
                v305 = *(unsigned __int8 *)(a3 + v13++);
                v12 = v305 | (v12 << 8);
              }
              v306 = v12 - (v18 >> 1);
              v307 = (v306 >> 31) & (v18 >> 1);
              v18 >>= 1;
              v12 = v307 + v306;
              LODWORD(v20) = (v306 >> 31) + 2 * v20 + 1;
              --v23;
            }
            while (v23);
            v20 = (16 * v20);
            v22 = 1;
LABEL_469:
            if (!HIBYTE(v18))
            {
              if (v13 != a5)
              {
                v308 = *(unsigned __int8 *)(a3 + v13);
                v18 <<= 8;
                ++v13;
                v12 = v308 | (v12 << 8);
                goto LABEL_472;
              }
              v36 = 0;
              v399 = 44;
              goto LABEL_637;
            }
LABEL_472:
            v309 = (_WORD *)(v5 + 2 * v22 + 26180);
            v310 = (unsigned __int16)*v309;
            v311 = (v18 >> 11) * v310;
            v22 *= 2;
            if (v12 >= v311)
            {
              v18 -= v311;
              *v309 -= *v309 >> 5;
              v22 |= 1u;
              v20 = (v20 + 1);
              v12 -= v311;
            }
            else
            {
              *v309 = v310 + ((2048 - v310) >> 5);
              v18 = (v18 >> 11) * v310;
            }
LABEL_475:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 45;
                goto LABEL_637;
              }
              v312 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v312 | (v12 << 8);
            }
            v313 = (_WORD *)(v5 + 2 * v22 + 26180);
            v314 = (unsigned __int16)*v313;
            v315 = (v18 >> 11) * v314;
            v22 *= 2;
            if (v12 >= v315)
            {
              v18 -= v315;
              *v313 -= *v313 >> 5;
              v22 |= 1u;
              v20 = (v20 + 2);
              v12 -= v315;
            }
            else
            {
              *v313 = v314 + ((2048 - v314) >> 5);
              v18 = (v18 >> 11) * v314;
            }
LABEL_481:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 46;
                goto LABEL_637;
              }
              v316 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v316 | (v12 << 8);
            }
            v317 = (_WORD *)(v5 + 2 * v22 + 26180);
            v318 = (unsigned __int16)*v317;
            v319 = (v18 >> 11) * v318;
            v22 *= 2;
            if (v12 >= v319)
            {
              v18 -= v319;
              *v317 -= *v317 >> 5;
              v22 |= 1u;
              v20 = (v20 + 4);
              v12 -= v319;
            }
            else
            {
              *v317 = v318 + ((2048 - v318) >> 5);
              v18 = (v18 >> 11) * v318;
            }
LABEL_487:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 47;
                goto LABEL_637;
              }
              v320 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v320 | (v12 << 8);
            }
            v321 = (_WORD *)(v5 + 2 * v22 + 26180);
            v322 = (unsigned __int16)*v321;
            v323 = (v18 >> 11) * v322;
            if (v12 >= v323)
            {
              v18 -= v323;
              v324 = v322 - (v322 >> 5);
              v20 = (v20 + 8);
              v12 -= v323;
            }
            else
            {
              v324 = v322 + ((2048 - v322) >> 5);
              v18 = v323;
            }
            *v321 = v324;
            if ((_DWORD)v20 == -1)
            {
              if ((v404 & 1) != 0)
              {
LABEL_628:
                if (!HIBYTE(v18))
                {
                  if (v13 == a5)
                  {
                    v36 = 0;
                    v399 = 48;
                    goto LABEL_637;
                  }
                  v398 = *(unsigned __int8 *)(a3 + v13);
                  v18 <<= 8;
                  ++v13;
                  v12 = v398 | (v12 << 8);
                }
                if (v12)
                  v36 = 9;
                else
                  v36 = 1;
                goto LABEL_635;
              }
LABEL_634:
              v36 = 9;
LABEL_635:
              v17 = v405;
              goto LABEL_639;
            }
          }
          else
          {
            v427 = 0;
            v23 = v273 - 1;
            v20 = ((_DWORD)v20 << (v273 - 1));
            v21 = v5 + 2 * v20 - 2 * v22 + 25950;
            v22 = 1;
LABEL_405:
            switch(v23)
            {
              case 1:
                goto LABEL_457;
              case 2:
                goto LABEL_442;
              case 3:
                goto LABEL_430;
              case 4:
                goto LABEL_418;
              case 5:
                if (HIBYTE(v18))
                  goto LABEL_409;
                if (v13 == a5)
                {
                  v36 = 0;
                  v17 = v405;
                  v405[14] = 42;
                  v23 = 5;
                  goto LABEL_638;
                }
                v274 = *(unsigned __int8 *)(a3 + v13);
                v18 <<= 8;
                ++v13;
                v12 = v274 | (v12 << 8);
LABEL_409:
                v275 = v22;
                v276 = *(unsigned __int16 *)(v21 + 2 * v22);
                v277 = (v18 >> 11) * v276;
                v278 = v276 - (v276 >> 5);
                v279 = v276 + ((2048 - v276) >> 5);
                v280 = v12 >= v277;
                if (v12 < v277)
                {
                  v18 = v277;
                }
                else
                {
                  LOWORD(v279) = v278;
                  v18 -= v277;
                }
                if (v12 >= v277)
                  v12 -= v277;
                if (v280)
                {
                  LODWORD(v20) = v20 + 1;
                  v22 = (2 * v22) | 1;
                }
                else
                {
                  v22 *= 2;
                }
                *(_WORD *)(v21 + 2 * v275) = v279;
                ++v427;
LABEL_418:
                if (HIBYTE(v18))
                  goto LABEL_421;
                if (v13 == a5)
                {
                  v36 = 0;
                  v17 = v405;
                  v405[14] = 42;
                  v23 = 4;
                  goto LABEL_638;
                }
                v281 = *(unsigned __int8 *)(a3 + v13);
                v18 <<= 8;
                ++v13;
                v12 = v281 | (v12 << 8);
LABEL_421:
                v282 = v22;
                v283 = *(unsigned __int16 *)(v21 + 2 * v22);
                v284 = (v18 >> 11) * v283;
                v285 = v283 - (v283 >> 5);
                v286 = v283 + ((2048 - v283) >> 5);
                v287 = v12 >= v284;
                if (v12 < v284)
                {
                  v18 = v284;
                }
                else
                {
                  LOWORD(v286) = v285;
                  v18 -= v284;
                }
                if (v12 >= v284)
                  v12 -= v284;
                if (v287)
                {
                  LODWORD(v20) = (1 << v427) + v20;
                  v22 = (2 * v22) | 1;
                }
                else
                {
                  v22 *= 2;
                }
                *(_WORD *)(v21 + 2 * v282) = v286;
                ++v427;
LABEL_430:
                if (HIBYTE(v18))
                  goto LABEL_433;
                if (v13 == a5)
                {
                  v36 = 0;
                  v17 = v405;
                  v405[14] = 42;
                  v23 = 3;
                  goto LABEL_638;
                }
                v288 = *(unsigned __int8 *)(a3 + v13);
                v18 <<= 8;
                ++v13;
                v12 = v288 | (v12 << 8);
LABEL_433:
                v289 = v22;
                v290 = *(unsigned __int16 *)(v21 + 2 * v22);
                v291 = (v18 >> 11) * v290;
                v292 = v290 - (v290 >> 5);
                v293 = v290 + ((2048 - v290) >> 5);
                v294 = v12 >= v291;
                if (v12 < v291)
                {
                  v18 = v291;
                }
                else
                {
                  LOWORD(v293) = v292;
                  v18 -= v291;
                }
                if (v12 >= v291)
                  v12 -= v291;
                if (v294)
                {
                  LODWORD(v20) = (1 << v427) + v20;
                  v22 = (2 * v22) | 1;
                }
                else
                {
                  v22 *= 2;
                }
                *(_WORD *)(v21 + 2 * v289) = v293;
                ++v427;
LABEL_442:
                if (HIBYTE(v18))
                  goto LABEL_445;
                if (v13 == a5)
                {
                  v36 = 0;
                  v17 = v405;
                  v405[14] = 42;
                  v23 = 2;
                  goto LABEL_638;
                }
                v295 = *(unsigned __int8 *)(a3 + v13);
                v18 <<= 8;
                ++v13;
                v12 = v295 | (v12 << 8);
LABEL_445:
                v296 = v22;
                v297 = *(unsigned __int16 *)(v21 + 2 * v22);
                v298 = (v18 >> 11) * v297;
                v299 = v297 - (v297 >> 5);
                v300 = v297 + ((2048 - v297) >> 5);
                v301 = v12 >= v298;
                if (v12 < v298)
                {
                  v18 = v298;
                }
                else
                {
                  LOWORD(v300) = v299;
                  v18 -= v298;
                }
                if (v12 >= v298)
                  v12 -= v298;
                if (v301)
                  v20 = ((1 << v427) + v20);
                else
                  v20 = v20;
                if (v301)
                  v22 = (2 * v22) | 1;
                else
                  v22 *= 2;
                *(_WORD *)(v21 + 2 * v296) = v300;
                ++v427;
                v32 = v424;
                v33 = v422;
LABEL_457:
                if (HIBYTE(v18))
                  goto LABEL_460;
                if (v13 == a5)
                {
                  v36 = 0;
                  v17 = v405;
                  v405[14] = 42;
                  v23 = 1;
                  goto LABEL_638;
                }
                v302 = *(unsigned __int8 *)(a3 + v13);
                v18 <<= 8;
                ++v13;
                v12 = v302 | (v12 << 8);
LABEL_460:
                v303 = *(unsigned __int16 *)(v21 + 2 * v22);
                v304 = (v18 >> 11) * v303;
                if (v12 >= v304)
                {
                  *(_WORD *)(v21 + 2 * v22) = v303 - (v303 >> 5);
                  v18 -= v304;
                  v23 = 1;
                  v20 = ((1 << v427) + v20);
                  v12 -= v304;
                }
                else
                {
                  *(_WORD *)(v21 + 2 * v22) = v303 + ((2048 - v303) >> 5);
                  v23 = 1;
                  v18 = (v18 >> 11) * v303;
                }
                break;
              default:
                break;
            }
          }
        }
        else
        {
          v20 = (v272 - 64);
        }
        if (v14 <= v20)
          goto LABEL_634;
        goto LABEL_495;
      }
      v18 -= v80;
      *v78 -= *v78 >> 5;
      if (!v14)
      {
        v36 = 9;
        v12 -= v80;
        v426 = v76;
        goto LABEL_635;
      }
      v12 -= v80;
      v426 = v76;
      v35 = v420;
LABEL_100:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 49;
          goto LABEL_637;
        }
        v88 = *(unsigned __int8 *)(a3 + v13);
        v18 <<= 8;
        ++v13;
        v12 = v88 | (v12 << 8);
      }
      v89 = (_WORD *)(v5 + 2 * v19 + 24984);
      v90 = (unsigned __int16)*v89;
      v91 = (v18 >> 11) * v90;
      if (v12 >= v91)
      {
        v18 -= v91;
        *v89 -= *v89 >> 5;
        v12 -= v91;
LABEL_121:
        if (!HIBYTE(v18))
        {
          if (v13 != a5)
          {
            v97 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v97 | (v12 << 8);
            goto LABEL_124;
          }
          v36 = 0;
          v399 = 52;
LABEL_637:
          v17 = v405;
          v405[14] = v399;
LABEL_638:
          v13 = a5;
          goto LABEL_639;
        }
LABEL_124:
        v98 = (_WORD *)(v5 + 2 * v19 + 25008);
        v99 = (unsigned __int16)*v98;
        v100 = (v18 >> 11) * v99;
        if (v12 >= v100)
        {
          v18 -= v100;
          *v98 -= *v98 >> 5;
          v12 -= v100;
LABEL_176:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 53;
              goto LABEL_637;
            }
            v134 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v134 | (v12 << 8);
          }
          v135 = (_WORD *)(v5 + 2 * v19 + 25032);
          v136 = (unsigned __int16)*v135;
          v137 = (v18 >> 11) * v136;
          v102 = v425;
          if (v12 >= v137)
          {
            v18 -= v137;
            *v135 -= *v135 >> 5;
            v12 -= v137;
            v101 = v421;
            v421 = v426;
          }
          else
          {
            *v135 = v136 + ((2048 - v136) >> 5);
            v18 = (v18 >> 11) * v136;
            v101 = v426;
          }
        }
        else
        {
          *v98 = v99 + ((2048 - v99) >> 5);
          v18 = (v18 >> 11) * v99;
          v101 = v425;
          v102 = v426;
        }
LABEL_201:
        v425 = v20;
        v426 = v102;
        if (v19 >= 7)
          v19 = 11;
        else
          v19 = 8;
        v22 = 1;
        v20 = v101;
        v32 = v424;
LABEL_205:
        if (!HIBYTE(v18))
        {
          if (v13 == a5)
          {
            v36 = 0;
            v399 = 54;
            goto LABEL_637;
          }
          v150 = *(unsigned __int8 *)(a3 + v13);
          v18 <<= 8;
          ++v13;
          v12 = v150 | (v12 << 8);
        }
        v151 = *v30;
        v152 = (v18 >> 11) * v151;
        if (v12 >= v152)
        {
          v18 -= v152;
          *v30 -= *v30 >> 5;
          v12 -= v152;
LABEL_241:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 58;
              goto LABEL_637;
            }
            v172 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v172 | (v12 << 8);
          }
          v173 = v30[1];
          v174 = (v18 >> 11) * v173;
          if (v12 >= v174)
          {
            v18 -= v174;
            v30[1] -= v30[1] >> 5;
            v12 -= v174;
LABEL_258:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 62;
                goto LABEL_637;
              }
              v183 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v183 | (v12 << 8);
            }
            v184 = (_WORD *)(v5 + 2 * v22 + 27756);
            v185 = (unsigned __int16)*v184;
            v186 = (v18 >> 11) * v185;
            v22 *= 2;
            if (v12 >= v186)
            {
              v18 -= v186;
              *v184 -= *v184 >> 5;
              v22 |= 1u;
              v12 -= v186;
            }
            else
            {
              *v184 = v185 + ((2048 - v185) >> 5);
              v18 = (v18 >> 11) * v185;
            }
LABEL_276:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 63;
                goto LABEL_637;
              }
              v195 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v195 | (v12 << 8);
            }
            v196 = (_WORD *)(v5 + 2 * v22 + 27756);
            v197 = (unsigned __int16)*v196;
            v198 = (v18 >> 11) * v197;
            v22 *= 2;
            if (v12 >= v198)
            {
              v18 -= v198;
              *v196 -= *v196 >> 5;
              v22 |= 1u;
              v12 -= v198;
            }
            else
            {
              *v196 = v197 + ((2048 - v197) >> 5);
              v18 = (v18 >> 11) * v197;
            }
LABEL_323:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 64;
                goto LABEL_637;
              }
              v223 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v223 | (v12 << 8);
            }
            v224 = (_WORD *)(v5 + 2 * v22 + 27756);
            v225 = (unsigned __int16)*v224;
            v226 = (v18 >> 11) * v225;
            v22 *= 2;
            if (v12 >= v226)
            {
              v18 -= v226;
              *v224 -= *v224 >> 5;
              v22 |= 1u;
              v12 -= v226;
            }
            else
            {
              *v224 = v225 + ((2048 - v225) >> 5);
              v18 = (v18 >> 11) * v225;
            }
LABEL_329:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 65;
                goto LABEL_637;
              }
              v227 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v227 | (v12 << 8);
            }
            v228 = (_WORD *)(v5 + 2 * v22 + 27756);
            v229 = (unsigned __int16)*v228;
            v230 = (v18 >> 11) * v229;
            v22 *= 2;
            if (v12 >= v230)
            {
              v18 -= v230;
              *v228 -= *v228 >> 5;
              v22 |= 1u;
              v12 -= v230;
            }
            else
            {
              *v228 = v229 + ((2048 - v229) >> 5);
              v18 = (v18 >> 11) * v229;
            }
LABEL_341:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 66;
                goto LABEL_637;
              }
              v235 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v235 | (v12 << 8);
            }
            v236 = (_WORD *)(v5 + 2 * v22 + 27756);
            v237 = (unsigned __int16)*v236;
            v238 = (v18 >> 11) * v237;
            v22 *= 2;
            if (v12 >= v238)
            {
              v18 -= v238;
              *v236 -= *v236 >> 5;
              v22 |= 1u;
              v12 -= v238;
            }
            else
            {
              *v236 = v237 + ((2048 - v237) >> 5);
              v18 = (v18 >> 11) * v237;
            }
LABEL_347:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 67;
                goto LABEL_637;
              }
              v239 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v239 | (v12 << 8);
            }
            v240 = (_WORD *)(v5 + 2 * v22 + 27756);
            v241 = (unsigned __int16)*v240;
            v242 = (v18 >> 11) * v241;
            v22 *= 2;
            if (v12 >= v242)
            {
              v18 -= v242;
              *v240 -= *v240 >> 5;
              v22 |= 1u;
              v12 -= v242;
            }
            else
            {
              *v240 = v241 + ((2048 - v241) >> 5);
              v18 = (v18 >> 11) * v241;
            }
LABEL_365:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 68;
                goto LABEL_637;
              }
              v251 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v251 | (v12 << 8);
            }
            v252 = (_WORD *)(v5 + 2 * v22 + 27756);
            v253 = (unsigned __int16)*v252;
            v254 = (v18 >> 11) * v253;
            v22 *= 2;
            if (v12 >= v254)
            {
              v18 -= v254;
              *v252 -= *v252 >> 5;
              v22 |= 1u;
              v12 -= v254;
            }
            else
            {
              *v252 = v253 + ((2048 - v253) >> 5);
              v18 = (v18 >> 11) * v253;
            }
LABEL_377:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 69;
                goto LABEL_637;
              }
              v259 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v259 | (v12 << 8);
            }
            v260 = (_WORD *)(v5 + 2 * v22 + 27756);
            v261 = (unsigned __int16)*v260;
            v262 = (v18 >> 11) * v261;
            v263 = v261 - (v261 >> 5);
            v264 = v261 + ((2048 - v261) >> 5);
            v265 = v12 >= v262;
            if (v12 < v262)
            {
              v18 = v262;
            }
            else
            {
              LOWORD(v264) = v263;
              v18 -= v262;
            }
            if (v12 >= v262)
              v12 -= v262;
            if (v265)
              v22 = (2 * v22) | 1;
            else
              v22 *= 2;
            *v260 = v264;
            v24 = v22 - 238;
          }
          else
          {
            v30[1] = v173 + ((2048 - v173) >> 5);
            v18 = (v18 >> 11) * v173;
LABEL_246:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 59;
                goto LABEL_637;
              }
              v175 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v175 | (v12 << 8);
            }
            v176 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 27500);
            v177 = (unsigned __int16)*v176;
            v178 = (v18 >> 11) * v177;
            v22 *= 2;
            if (v12 >= v178)
            {
              v18 -= v178;
              *v176 -= *v176 >> 5;
              v22 |= 1u;
              v12 -= v178;
            }
            else
            {
              *v176 = v177 + ((2048 - v177) >> 5);
              v18 = (v18 >> 11) * v177;
            }
LABEL_264:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 60;
                goto LABEL_637;
              }
              v187 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v187 | (v12 << 8);
            }
            v188 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 27500);
            v189 = (unsigned __int16)*v188;
            v190 = (v18 >> 11) * v189;
            v22 *= 2;
            if (v12 >= v190)
            {
              v18 -= v190;
              *v188 -= *v188 >> 5;
              v22 |= 1u;
              v12 -= v190;
            }
            else
            {
              *v188 = v189 + ((2048 - v189) >> 5);
              v18 = (v18 >> 11) * v189;
            }
LABEL_282:
            if (!HIBYTE(v18))
            {
              if (v13 == a5)
              {
                v36 = 0;
                v399 = 61;
                goto LABEL_637;
              }
              v199 = *(unsigned __int8 *)(a3 + v13);
              v18 <<= 8;
              ++v13;
              v12 = v199 | (v12 << 8);
            }
            v200 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 27500);
            v201 = (unsigned __int16)*v200;
            v202 = (v18 >> 11) * v201;
            v203 = v201 - (v201 >> 5);
            v204 = v201 + ((2048 - v201) >> 5);
            v205 = v12 >= v202;
            if (v12 < v202)
            {
              v18 = v202;
            }
            else
            {
              LOWORD(v204) = v203;
              v18 -= v202;
            }
            if (v12 >= v202)
              v12 -= v202;
            if (v205)
              v22 = (2 * v22) | 1;
            else
              v22 *= 2;
            *v200 = v204;
            v24 = v22 + 2;
          }
        }
        else
        {
          *v30 = v151 + ((2048 - v151) >> 5);
          v18 = (v18 >> 11) * v151;
LABEL_210:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 55;
              goto LABEL_637;
            }
            v153 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v153 | (v12 << 8);
          }
          v154 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 27244);
          v155 = (unsigned __int16)*v154;
          v156 = (v18 >> 11) * v155;
          v22 *= 2;
          if (v12 >= v156)
          {
            v18 -= v156;
            *v154 -= *v154 >> 5;
            v22 |= 1u;
            v12 -= v156;
          }
          else
          {
            *v154 = v155 + ((2048 - v155) >> 5);
            v18 = (v18 >> 11) * v155;
          }
LABEL_216:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 56;
              goto LABEL_637;
            }
            v157 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v157 | (v12 << 8);
          }
          v158 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 27244);
          v159 = (unsigned __int16)*v158;
          v160 = (v18 >> 11) * v159;
          v22 *= 2;
          if (v12 >= v160)
          {
            v18 -= v160;
            *v158 -= *v158 >> 5;
            v22 |= 1u;
            v12 -= v160;
          }
          else
          {
            *v158 = v159 + ((2048 - v159) >> 5);
            v18 = (v18 >> 11) * v159;
          }
LABEL_222:
          if (!HIBYTE(v18))
          {
            if (v13 == a5)
            {
              v36 = 0;
              v399 = 57;
              goto LABEL_637;
            }
            v161 = *(unsigned __int8 *)(a3 + v13);
            v18 <<= 8;
            ++v13;
            v12 = v161 | (v12 << 8);
          }
          v162 = (_WORD *)(v5 + 16 * v34 + 2 * v22 + 27244);
          v163 = (unsigned __int16)*v162;
          v164 = (v18 >> 11) * v163;
          v165 = v163 - (v163 >> 5);
          v166 = v163 + ((2048 - v163) >> 5);
          v167 = v12 >= v164;
          if (v12 < v164)
          {
            v18 = v164;
          }
          else
          {
            LOWORD(v166) = v165;
            v18 -= v164;
          }
          if (v12 >= v164)
            v12 -= v164;
          if (v167)
            v22 = (2 * v22) | 1;
          else
            v22 *= 2;
          *v162 = v166;
          v24 = v22 - 6;
        }
        goto LABEL_495;
      }
      *v89 = v90 + ((2048 - v90) >> 5);
      v18 = (v18 >> 11) * v90;
LABEL_105:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 51;
          goto LABEL_637;
        }
        v92 = *(unsigned __int8 *)(a3 + v13);
        v18 <<= 8;
        ++v13;
        v12 = v92 | (v12 << 8);
      }
      v93 = (_WORD *)(v5 + 32 * v19 + 2 * v34 + 25056);
      v94 = (unsigned __int16)*v93;
      v95 = (v18 >> 11) * v94;
      if (v12 >= v95)
      {
        v18 -= v95;
        *v93 -= *v93 >> 5;
        v12 -= v95;
        v101 = v20;
        LODWORD(v20) = v425;
        v102 = v426;
        goto LABEL_201;
      }
      *v93 = v94 + ((2048 - v94) >> 5);
      if (v19 >= 7)
        v19 = 11;
      else
        v19 = 9;
      v18 = (v18 >> 11) * v94;
LABEL_113:
      if (v428 == v35)
      {
        v36 = 0;
        v403 = 50;
        goto LABEL_654;
      }
      if (v428 <= v20)
        v96 = v33;
      else
        v96 = 0;
      v32[v428] = v96[v428 + ~(unint64_t)v20 + (_QWORD)v32];
      if (v428 + 1 > v14)
        v14 = v428 + 1;
      ++v428;
    }
    *v40 = v41 + ((2048 - v41) >> 5);
    v43 = v428 ? 0 : v33;
    v21 = v5 + 1536 * (((v428 & v413) << v412) + (v32[v428 - 1 + (_QWORD)v43] >> (8 - v412)));
    v22 = 1;
    if (v19 > 6)
    {
      if (v428 <= v20)
        v337 = (unsigned __int8 *)v33;
      else
        v337 = 0;
      v24 = 2 * v337[v428 + ~(unint64_t)v20 + (_QWORD)v32];
      v427 = 256;
LABEL_512:
      v338 = v427 & v24;
      v339 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 10;
          goto LABEL_637;
        }
        v18 <<= 8;
        v340 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v340 | (v12 << 8);
      }
      v341 = *(unsigned __int16 *)(v21 + 2 * v339);
      v342 = (v18 >> 11) * v341;
      v343 = v341 - (v341 >> 5);
      v344 = v341 + ((2048 - v341) >> 5);
      v345 = v12 >= v342;
      if (v12 < v342)
      {
        v18 = v342;
      }
      else
      {
        LOWORD(v344) = v343;
        v18 -= v342;
      }
      if (v12 >= v342)
        v12 -= v342;
      if (v345)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v345)
        v338 ^= v427;
      v427 = v338;
      *(_WORD *)(v21 + 2 * v339) = v344;
      v24 *= 2;
LABEL_526:
      v346 = v427 & v24;
      v347 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 11;
          goto LABEL_637;
        }
        v18 <<= 8;
        v348 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v348 | (v12 << 8);
      }
      v349 = *(unsigned __int16 *)(v21 + 2 * v347);
      v350 = (v18 >> 11) * v349;
      v351 = v349 - (v349 >> 5);
      v352 = v349 + ((2048 - v349) >> 5);
      v353 = v12 >= v350;
      if (v12 < v350)
      {
        v18 = v350;
      }
      else
      {
        LOWORD(v352) = v351;
        v18 -= v350;
      }
      if (v12 >= v350)
        v12 -= v350;
      if (v353)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v353)
        v346 ^= v427;
      v427 = v346;
      *(_WORD *)(v21 + 2 * v347) = v352;
      v24 *= 2;
LABEL_540:
      v354 = v427 & v24;
      v355 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 12;
          goto LABEL_637;
        }
        v18 <<= 8;
        v356 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v356 | (v12 << 8);
      }
      v357 = *(unsigned __int16 *)(v21 + 2 * v355);
      v358 = (v18 >> 11) * v357;
      v359 = v357 - (v357 >> 5);
      v360 = v357 + ((2048 - v357) >> 5);
      v361 = v12 >= v358;
      if (v12 < v358)
      {
        v18 = v358;
      }
      else
      {
        LOWORD(v360) = v359;
        v18 -= v358;
      }
      if (v12 >= v358)
        v12 -= v358;
      if (v361)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v361)
        v354 ^= v427;
      v427 = v354;
      *(_WORD *)(v21 + 2 * v355) = v360;
      v24 *= 2;
LABEL_554:
      v362 = v427 & v24;
      v363 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 13;
          goto LABEL_637;
        }
        v18 <<= 8;
        v364 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v364 | (v12 << 8);
      }
      v365 = *(unsigned __int16 *)(v21 + 2 * v363);
      v366 = (v18 >> 11) * v365;
      v367 = v365 - (v365 >> 5);
      v368 = v365 + ((2048 - v365) >> 5);
      v369 = v12 >= v366;
      if (v12 < v366)
      {
        v18 = v366;
      }
      else
      {
        LOWORD(v368) = v367;
        v18 -= v366;
      }
      if (v12 >= v366)
        v12 -= v366;
      if (v369)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v369)
        v362 ^= v427;
      v427 = v362;
      *(_WORD *)(v21 + 2 * v363) = v368;
      v24 *= 2;
LABEL_568:
      v370 = v427 & v24;
      v371 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 14;
          goto LABEL_637;
        }
        v18 <<= 8;
        v372 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v372 | (v12 << 8);
      }
      v373 = *(unsigned __int16 *)(v21 + 2 * v371);
      v374 = (v18 >> 11) * v373;
      v375 = v373 - (v373 >> 5);
      v376 = v373 + ((2048 - v373) >> 5);
      v377 = v12 >= v374;
      if (v12 < v374)
      {
        v18 = v374;
      }
      else
      {
        LOWORD(v376) = v375;
        v18 -= v374;
      }
      if (v12 >= v374)
        v12 -= v374;
      if (v377)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v377)
        v370 ^= v427;
      v427 = v370;
      *(_WORD *)(v21 + 2 * v371) = v376;
      v24 *= 2;
LABEL_582:
      v378 = v427 & v24;
      v379 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 15;
          goto LABEL_637;
        }
        v18 <<= 8;
        v380 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v380 | (v12 << 8);
      }
      v381 = *(unsigned __int16 *)(v21 + 2 * v379);
      v382 = (v18 >> 11) * v381;
      v383 = v381 - (v381 >> 5);
      v384 = v381 + ((2048 - v381) >> 5);
      v385 = v12 >= v382;
      if (v12 < v382)
      {
        v18 = v382;
      }
      else
      {
        LOWORD(v384) = v383;
        v18 -= v382;
      }
      if (v12 >= v382)
        v12 -= v382;
      if (v385)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v385)
        v378 ^= v427;
      v427 = v378;
      *(_WORD *)(v21 + 2 * v379) = v384;
      v24 *= 2;
LABEL_596:
      v386 = v427 & v24;
      v387 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 16;
          goto LABEL_637;
        }
        v18 <<= 8;
        v388 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v388 | (v12 << 8);
      }
      v389 = *(unsigned __int16 *)(v21 + 2 * v387);
      v390 = (v18 >> 11) * v389;
      v391 = v389 - (v389 >> 5);
      v392 = v389 + ((2048 - v389) >> 5);
      v393 = v12 >= v390;
      if (v12 < v390)
      {
        v18 = v390;
      }
      else
      {
        LOWORD(v392) = v391;
        v18 -= v390;
      }
      if (v12 >= v390)
        v12 -= v390;
      if (v393)
        v22 = (2 * v22) | 1;
      else
        v22 *= 2;
      if (!v393)
        v386 ^= v427;
      v427 = v386;
      *(_WORD *)(v21 + 2 * v387) = v392;
      v24 *= 2;
      v33 = v422;
LABEL_610:
      v394 = v427 + v22 + (v427 & v24);
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 17;
          goto LABEL_637;
        }
        v18 <<= 8;
        v395 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v395 | (v12 << 8);
      }
      v396 = *(unsigned __int16 *)(v21 + 2 * v394);
      v397 = (v18 >> 11) * v396;
      v22 *= 2;
      if (v12 >= v397)
      {
        v18 -= v397;
        *(_WORD *)(v21 + 2 * v394) = v396 - (v396 >> 5);
        v22 |= 1u;
        v12 -= v397;
        v427 &= v24;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v394) = v396 + ((2048 - v396) >> 5);
        v427 ^= v427 & v24;
        v18 = (v18 >> 11) * v396;
      }
    }
    else
    {
LABEL_31:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 2;
          goto LABEL_637;
        }
        v18 <<= 8;
        v44 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v44 | (v12 << 8);
      }
      v45 = v22;
      v46 = *(unsigned __int16 *)(v21 + 2 * v22);
      v47 = (v18 >> 11) * v46;
      v22 *= 2;
      if (v12 >= v47)
      {
        v18 -= v47;
        *(_WORD *)(v21 + 2 * v45) = v46 - (v46 >> 5);
        v22 |= 1u;
        v12 -= v47;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v45) = v46 + ((2048 - v46) >> 5);
        v18 = (v18 >> 11) * v46;
      }
LABEL_37:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 3;
          goto LABEL_637;
        }
        v18 <<= 8;
        v48 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v48 | (v12 << 8);
      }
      v49 = v22;
      v50 = *(unsigned __int16 *)(v21 + 2 * v22);
      v51 = (v18 >> 11) * v50;
      v22 *= 2;
      if (v12 >= v51)
      {
        v18 -= v51;
        *(_WORD *)(v21 + 2 * v49) = v50 - (v50 >> 5);
        v22 |= 1u;
        v12 -= v51;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v49) = v50 + ((2048 - v50) >> 5);
        v18 = (v18 >> 11) * v50;
      }
LABEL_43:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 4;
          goto LABEL_637;
        }
        v18 <<= 8;
        v52 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v52 | (v12 << 8);
      }
      v53 = v22;
      v54 = *(unsigned __int16 *)(v21 + 2 * v22);
      v55 = (v18 >> 11) * v54;
      v22 *= 2;
      if (v12 >= v55)
      {
        v18 -= v55;
        *(_WORD *)(v21 + 2 * v53) = v54 - (v54 >> 5);
        v22 |= 1u;
        v12 -= v55;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v53) = v54 + ((2048 - v54) >> 5);
        v18 = (v18 >> 11) * v54;
      }
LABEL_49:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 5;
          goto LABEL_637;
        }
        v18 <<= 8;
        v56 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v56 | (v12 << 8);
      }
      v57 = v22;
      v58 = *(unsigned __int16 *)(v21 + 2 * v22);
      v59 = (v18 >> 11) * v58;
      v22 *= 2;
      if (v12 >= v59)
      {
        v18 -= v59;
        *(_WORD *)(v21 + 2 * v57) = v58 - (v58 >> 5);
        v22 |= 1u;
        v12 -= v59;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v57) = v58 + ((2048 - v58) >> 5);
        v18 = (v18 >> 11) * v58;
      }
LABEL_55:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 6;
          goto LABEL_637;
        }
        v18 <<= 8;
        v60 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v60 | (v12 << 8);
      }
      v61 = v22;
      v62 = *(unsigned __int16 *)(v21 + 2 * v22);
      v63 = (v18 >> 11) * v62;
      v22 *= 2;
      if (v12 >= v63)
      {
        v18 -= v63;
        *(_WORD *)(v21 + 2 * v61) = v62 - (v62 >> 5);
        v22 |= 1u;
        v12 -= v63;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v61) = v62 + ((2048 - v62) >> 5);
        v18 = (v18 >> 11) * v62;
      }
LABEL_61:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 7;
          goto LABEL_637;
        }
        v18 <<= 8;
        v64 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v64 | (v12 << 8);
      }
      v65 = v22;
      v66 = *(unsigned __int16 *)(v21 + 2 * v22);
      v67 = (v18 >> 11) * v66;
      v22 *= 2;
      if (v12 >= v67)
      {
        v18 -= v67;
        *(_WORD *)(v21 + 2 * v65) = v66 - (v66 >> 5);
        v22 |= 1u;
        v12 -= v67;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v65) = v66 + ((2048 - v66) >> 5);
        v18 = (v18 >> 11) * v66;
      }
LABEL_67:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 8;
          goto LABEL_637;
        }
        v18 <<= 8;
        v68 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v68 | (v12 << 8);
      }
      v69 = v22;
      v70 = *(unsigned __int16 *)(v21 + 2 * v22);
      v71 = (v18 >> 11) * v70;
      v22 *= 2;
      if (v12 >= v71)
      {
        v18 -= v71;
        *(_WORD *)(v21 + 2 * v69) = v70 - (v70 >> 5);
        v22 |= 1u;
        v12 -= v71;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v69) = v70 + ((2048 - v70) >> 5);
        v18 = (v18 >> 11) * v70;
      }
LABEL_73:
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          v36 = 0;
          v399 = 9;
          goto LABEL_637;
        }
        v18 <<= 8;
        v72 = *(unsigned __int8 *)(a3 + v13++);
        v12 = v72 | (v12 << 8);
      }
      v73 = v22;
      v74 = *(unsigned __int16 *)(v21 + 2 * v22);
      v75 = (v18 >> 11) * v74;
      v22 *= 2;
      if (v12 >= v75)
      {
        v18 -= v75;
        *(_WORD *)(v21 + 2 * v73) = v74 - (v74 >> 5);
        v22 |= 1u;
        v12 -= v75;
      }
      else
      {
        *(_WORD *)(v21 + 2 * v73) = v74 + ((2048 - v74) >> 5);
        v18 = (v18 >> 11) * v74;
      }
    }
    v19 = lzma_decode_next_state[v19];
LABEL_617:
    if (v428 == v35)
      break;
    v32[v428] = v22;
    if (v428 + 1 > v14)
      v14 = v428 + 1;
    ++v428;
  }
  v36 = 0;
  v403 = 18;
LABEL_654:
  v17 = v405;
  v405[14] = v403;
  v428 = v35;
LABEL_639:
  a2[1] = (const void *)v428;
  a2[2] = (const void *)v14;
  *v17 = v18;
  v17[1] = v12;
  *v407 = v13;
  v17[2] = 0;
  v17[3] = v19;
  v17[4] = v20;
  v17[5] = v425;
  v17[6] = v426;
  v17[7] = v421;
  *(_QWORD *)(v5 + 28328) = v21;
  v17[17] = v22;
  v17[18] = v23;
  v17[19] = v427;
  v17[20] = v24;
  v400 = *(_QWORD *)(v5 + 28312);
  if (v400 == -1 || (v401 = (uint64_t)v408 + v400 - v428, (*(_QWORD *)(v5 + 28312) = v401) != 0) || v36)
  {
    if (v36 == 1)
    {
      *(_QWORD *)&result = 0xFFFFFFFFLL;
      *(_QWORD *)v17 = 0xFFFFFFFFLL;
      v17[2] = 5;
      v17[14] = 1;
    }
  }
  return result;
}

uint64_t lzma_lzma_decoder_create(_QWORD *a1, uint64_t a2, unsigned int *a3, _QWORD *a4)
{
  void *v7;
  uint64_t result;
  uint64_t v9;

  if (*a1)
    goto LABEL_4;
  v7 = lzma_alloc(0x6EC0uLL, a2);
  *a1 = v7;
  if (v7)
  {
    a1[1] = lzma_decode;
    a1[2] = lzma_decoder_reset;
    a1[3] = lzma_decoder_uncompressed;
LABEL_4:
    result = 0;
    v9 = *((_QWORD *)a3 + 1);
    *a4 = *a3;
    a4[1] = v9;
    a4[2] = a3[4];
    return result;
  }
  return 5;
}

uint64_t lz_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int a9)
{
  _QWORD *v16;
  _QWORD *v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  if (!*(_QWORD *)(a1 + 112))
    return decode_buffer(a1, a3, a4, a5, a6, a7, a8);
  if (*a7 >= a8)
    return 0;
  HIDWORD(v21) = a9;
  v16 = (_QWORD *)(a1 + 176);
  v17 = (_QWORD *)(a1 + 184);
  while (1)
  {
    if (!*(_BYTE *)(a1 + 168) && *v16 == *v17)
    {
      *v16 = 0;
      *(_QWORD *)(a1 + 184) = 0;
      LODWORD(v21) = HIDWORD(v21);
      result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 112))(*(_QWORD *)(a1 + 88), a2, a3, a4, a5, a1 + 192, a1 + 184, 4096, v21);
      if ((_DWORD)result)
      {
        if ((_DWORD)result != 1)
          return result;
        *(_BYTE *)(a1 + 168) = 1;
      }
      else if (!*v17)
      {
        return 0;
      }
    }
    v19 = *(_QWORD *)(a1 + 184);
    if (*(_BYTE *)(a1 + 169))
      break;
    result = decode_buffer(a1, a1 + 192, a1 + 176, v19, a6, a7, a8);
    if ((_DWORD)result)
    {
      if ((_DWORD)result != 1)
        return result;
      *(_BYTE *)(a1 + 169) = 1;
      v20 = *a7;
    }
    else
    {
      v20 = *a7;
      if (*(_BYTE *)(a1 + 168) && v20 < a8)
        return 9;
    }
    if (v20 >= a8)
      return 0;
  }
  if (v19)
    return 9;
  return *(unsigned __int8 *)(a1 + 168);
}

uint64_t decode_buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v11 = (_QWORD *)(a1 + 8);
  v12 = *a6;
  while (1)
  {
    while (1)
    {
      v13 = *(_QWORD *)(a1 + 8);
      v14 = *(_QWORD *)(a1 + 32);
      if (v13 == v14)
      {
        v13 = 0;
        *v11 = 0;
      }
      v15 = v14 - v13;
      if (a7 - v12 < v15)
        v15 = a7 - v12;
      *(_QWORD *)(a1 + 24) = v15 + v13;
      v16 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56))(*(_QWORD *)(a1 + 48), a1, a2, a3, a4);
      v17 = *(_QWORD *)(a1 + 8);
      if (v17 != v13)
        memcpy((void *)(a5 + v12), (const void *)(*(_QWORD *)a1 + v13), v17 - v13);
      v12 += v17 - v13;
      *a6 = v12;
      if (!*(_BYTE *)(a1 + 40))
        break;
      *v11 = 0;
      v11[1] = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + *(_QWORD *)a1 - 1) = 0;
      *(_BYTE *)(a1 + 40) = 0;
      if ((_DWORD)v16 || v12 == a7)
        return v16;
    }
    if ((_DWORD)v16 || v12 == a7)
      break;
    if (v17 < *(_QWORD *)(a1 + 32))
      return 0;
  }
  return v16;
}

uint64_t auto_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  if (*(uint64_t (**)())(a1 + 16) != auto_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = auto_decoder_init;
  if (a4 > 0x3F)
    return 8;
  v8 = *(_QWORD **)a1;
  if (!*(_QWORD *)a1)
  {
    v8 = lzma_alloc(0x60uLL, a2);
    if (!v8)
      return 5;
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 24) = auto_decode;
    *(_QWORD *)(a1 + 32) = auto_decoder_end;
    *(_QWORD *)(a1 + 48) = auto_decoder_get_check;
    *(_QWORD *)(a1 + 56) = auto_decoder_memconfig;
    *v8 = 0;
    v8[1] = -1;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
  }
  v9 = 0;
  if (a3 <= 1)
    v10 = 1;
  else
    v10 = a3;
  v8[10] = v10;
  *((_DWORD *)v8 + 22) = a4;
  *((_DWORD *)v8 + 23) = 0;
  return v9;
}

double lzma_next_end(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  void (*v4)(void *);
  void *v5;
  double result;

  v2 = (_OWORD *)(a1 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    v4 = *(void (**)(void *))(a1 + 32);
    if (v4)
    {
      v5 = *(void **)a1;
    }
    else
    {
      if (!a2 || (v4 = *(void (**)(void *))(a2 + 8)) == 0)
      {
        free(*(void **)a1);
        goto LABEL_9;
      }
      v5 = *(void **)(a2 + 16);
    }
    v4(v5);
LABEL_9:
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = -1;
    result = 0.0;
    *v2 = 0u;
    v2[1] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
  }
  return result;
}

void lz_decoder_end(uint64_t a1, uint64_t a2)
{
  void (*v4)(void *, uint64_t);
  void *v5;

  lzma_next_end(a1 + 88, a2);
  lzma_free(*(void **)a1, a2);
  v4 = *(void (**)(void *, uint64_t))(a1 + 80);
  v5 = *(void **)(a1 + 48);
  if (v4)
    v4(v5, a2);
  else
    lzma_free(v5, a2);
  lzma_free((void *)a1, a2);
}

void lzma_free(void *a1, uint64_t a2)
{
  void (*v2)(_QWORD, void *);

  if (a2 && (v2 = *(void (**)(_QWORD, void *))(a2 + 8)) != 0)
    v2(*(_QWORD *)(a2 + 16), a1);
  else
    free(a1);
}

void auto_decoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

void alone_decoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

uint64_t lzma_code(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(_QWORD, _QWORD);
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  if (!*(_QWORD *)a1 && *(_QWORD *)(a1 + 8))
    return 11;
  if (!*(_QWORD *)(a1 + 24) && *(_QWORD *)(a1 + 32))
    return 11;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    return 11;
  result = 11;
  if (a2 <= 4)
  {
    v5 = *(uint64_t (**)(_QWORD, _QWORD))(v3 + 24);
    if (v5)
    {
      if (*(_BYTE *)(v3 + a2 + 96))
      {
        if (*(_QWORD *)(a1 + 64))
          return 8;
        if (*(_QWORD *)(a1 + 72))
          return 8;
        if (*(_QWORD *)(a1 + 80))
          return 8;
        if (*(_QWORD *)(a1 + 88))
          return 8;
        if (*(_QWORD *)(a1 + 104))
          return 8;
        if (*(_QWORD *)(a1 + 112))
          return 8;
        if (*(_QWORD *)(a1 + 120))
          return 8;
        if (*(_DWORD *)(a1 + 128))
          return 8;
        v9 = a1;
        if (*(_DWORD *)(a1 + 132))
        {
          return 8;
        }
        else
        {
          result = 1;
          switch(*(_DWORD *)(v3 + 80))
          {
            case 0:
              if (a2 - 1 < 4)
                *(_DWORD *)(v3 + 80) = a2;
              goto LABEL_33;
            case 1:
              if (a2 != 1)
                return 11;
              goto LABEL_32;
            case 2:
              if (a2 != 2)
                return 11;
              goto LABEL_32;
            case 3:
              if (a2 != 3)
                return 11;
              goto LABEL_32;
            case 4:
              if (a2 != 4)
                return 11;
LABEL_32:
              if (*(_QWORD *)(v3 + 88) != *(_QWORD *)(a1 + 8))
                return 11;
LABEL_33:
              result = v5(*(_QWORD *)v3, *(_QWORD *)(a1 + 48));
              v6 = *(_QWORD *)(v9 + 56);
              *(_QWORD *)(v6 + 88) = *(_QWORD *)(v9 + 8);
              switch((int)result)
              {
                case 0:
                  if (*(_BYTE *)(v6 + 101))
                    return 10;
                  result = 0;
                  *(_BYTE *)(v6 + 101) = 1;
                  return result;
                case 1:
                  v7 = *(_DWORD *)(v6 + 80) - 1;
                  if (v7 > 3)
                    v8 = 5;
                  else
                    v8 = dword_229953300[v7];
                  *(_DWORD *)(v6 + 80) = v8;
                  goto LABEL_46;
                case 2:
                case 3:
                case 4:
                case 6:
                  goto LABEL_46;
                case 5:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                  goto LABEL_38;
                case 12:
                  *(_BYTE *)(v6 + 101) = 0;
                  if (*(_DWORD *)(v6 + 80) == 3)
                    *(_DWORD *)(v6 + 80) = 0;
                  return 12;
                default:
                  if ((_DWORD)result == 101)
                  {
                    result = 0;
LABEL_46:
                    *(_BYTE *)(v6 + 101) = 0;
                  }
                  else
                  {
LABEL_38:
                    *(_DWORD *)(v6 + 80) = 6;
                  }
                  break;
              }
              break;
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

uint64_t auto_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int16x8_t a9, int a10)
{
  int v12;
  unint64_t v19;
  int v20;
  uint64_t result;
  int v22;

  v12 = *(_DWORD *)(a1 + 92);
  if (v12 != 2)
  {
    if (v12 != 1)
    {
      if (v12)
        return 11;
      v19 = *a4;
      if (*a4 >= a5)
        return 0;
      *(_DWORD *)(a1 + 92) = 1;
      v20 = *(unsigned __int8 *)(a3 + v19);
      if (v20 == 76)
      {
        result = lzma_lzip_decoder_init(a1, a2, *(_QWORD *)(a1 + 80), *(_DWORD *)(a1 + 88));
        if ((_DWORD)result)
          return result;
      }
      else if (v20 == 253)
      {
        result = lzma_stream_decoder_init(a1, a2, *(_QWORD *)(a1 + 80), *(_DWORD *)(a1 + 88), a9);
        if ((_DWORD)result)
          return result;
      }
      else
      {
        result = lzma_alone_decoder_init(a1, a2, *(_QWORD *)(a1 + 80), 1);
        if ((_DWORD)result)
          return result;
        v22 = *(_DWORD *)(a1 + 88);
        if ((v22 & 1) != 0)
          return 2;
        if ((v22 & 4) != 0)
          return 4;
      }
    }
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, uint64_t, uint64_t, int))(a1 + 24))(*(_QWORD *)a1, a2, a3, a4, a5, a6, a7, a8, a10);
    if ((_DWORD)result != 1)
      return result;
    if ((*(_BYTE *)(a1 + 88) & 8) == 0)
      return 1;
    *(_DWORD *)(a1 + 92) = 2;
  }
  if (*a4 >= a5)
    return a10 == 3;
  else
    return 9;
}

uint64_t lzma_alone_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  if (*(uint64_t (**)())(a1 + 16) != lzma_alone_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_alone_decoder_init;
  v8 = *(_QWORD **)a1;
  if (!*(_QWORD *)a1)
  {
    v8 = lzma_alloc(0xE8uLL, a2);
    if (!v8)
      return 5;
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 24) = alone_decode;
    *(_QWORD *)(a1 + 32) = alone_decoder_end;
    *(_QWORD *)(a1 + 56) = alone_decoder_memconfig;
    *v8 = 0;
    v8[1] = -1;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
  }
  v9 = 0;
  *((_DWORD *)v8 + 20) = 0;
  *((_BYTE *)v8 + 84) = a4;
  *((_DWORD *)v8 + 30) = 0;
  v8[16] = 0;
  *((_DWORD *)v8 + 34) = 0;
  if (a3 <= 1)
    v10 = 1;
  else
    v10 = a3;
  v8[11] = 0;
  v8[12] = 0;
  v8[13] = v10;
  v8[14] = 0x8000;
  return v9;
}

uint64_t tuklib_physmem()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sysconf(29);
  v1 = sysconf(200);
  if (v1 == -1 || v0 == -1)
    return 0;
  else
    return v1 * v0;
}

uint64_t tuklib_cpucores()
{
  int v0;
  size_t v4;
  int v5;
  int v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v6 = 0x300000006;
  v5 = 0;
  v4 = 4;
  v0 = sysctl(v6, 2u, &v5, &v4, 0, 0);
  if (v5 <= 0 || v4 != 4 || v0 == -1)
    return 0;
  else
    return v5;
}

uint64_t lzma_version_number()
{
  return 50040032;
}

const char *lzma_version_string()
{
  return "5.4.3";
}

void *lzma_alloc_zero(unint64_t a1, _QWORD *a2)
{
  size_t v2;
  void *v3;
  void *v4;

  if (a1 <= 1)
    v2 = 1;
  else
    v2 = a1;
  if (!a2 || !*a2)
    return malloc_type_calloc(1uLL, v2, 0xB1AC765uLL);
  v3 = (void *)((uint64_t (*)(_QWORD, uint64_t, size_t))*a2)(a2[2], 1, v2);
  v4 = v3;
  if (v3)
    bzero(v3, v2);
  return v4;
}

size_t lzma_bufcpy(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  v8 = *a2;
  v9 = *a5;
  if (a3 - *a2 >= (unint64_t)(a6 - *a5))
    v10 = a6 - *a5;
  else
    v10 = a3 - *a2;
  if (v10)
    memcpy((void *)(a4 + v9), (const void *)(a1 + v8), v10);
  *a2 = v10 + v8;
  *a5 = v10 + v9;
  return v10;
}

uint64_t lzma_next_filter_update(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != *(_QWORD *)(a1 + 8))
    return 11;
  if (*a3 == -1)
    return 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD *))(a1 + 64))(*(_QWORD *)a1, a2, 0, a3);
}

_QWORD *lzma_get_progress(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t (*v4)(_QWORD);

  v3 = (_QWORD *)result[7];
  v4 = (uint64_t (*)(_QWORD))v3[5];
  if (v4)
    return (_QWORD *)v4(*v3);
  *a2 = result[2];
  *a3 = result[5];
  return result;
}

uint64_t lzma_get_check(uint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(_QWORD);

  v1 = *(_QWORD **)(a1 + 56);
  v2 = (uint64_t (*)(_QWORD))v1[6];
  if (v2)
    return v2(*v1);
  else
    return 0;
}

uint64_t lzma_memusage(uint64_t result)
{
  _QWORD *v1;
  unsigned int (*v2)(_QWORD, uint64_t *, uint64_t *, _QWORD);
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = *(_QWORD **)(result + 56);
    if (v1 && (v2 = (unsigned int (*)(_QWORD, uint64_t *, uint64_t *, _QWORD))v1[7]) != 0)
    {
      v3 = 0;
      v4 = 0;
      if (v2(*v1, &v4, &v3, 0))
        return 0;
      else
        return v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t lzma_memlimit_get(uint64_t result)
{
  _QWORD *v1;
  unsigned int (*v2)(_QWORD, uint64_t *, uint64_t *, _QWORD);
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = *(_QWORD **)(result + 56);
    if (v1 && (v2 = (unsigned int (*)(_QWORD, uint64_t *, uint64_t *, _QWORD))v1[7]) != 0)
    {
      v3 = 0;
      v4 = 0;
      if (v2(*v1, &v3, &v4, 0))
        return 0;
      else
        return v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t lzma_memlimit_set(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t (*v3)(_QWORD, uint64_t *, uint64_t *, uint64_t);
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 11;
  v2 = *(_QWORD **)(a1 + 56);
  if (!v2)
    return 11;
  v3 = (uint64_t (*)(_QWORD, uint64_t *, uint64_t *, uint64_t))v2[7];
  if (!v3)
    return 11;
  v6 = 0;
  v7 = 0;
  if (a2 <= 1)
    v4 = 1;
  else
    v4 = a2;
  return v3(*v2, &v6, &v7, v4);
}

uint64_t lzma_block_compressed_size(uint64_t a1, unint64_t a2)
{
  int v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  if (!lzma_block_unpadded_size(a1))
    return 11;
  v4 = *(_DWORD *)(a1 + 4);
  v5 = lzma_check_size(*(_DWORD *)(a1 + 8)) + v4;
  v6 = a2 >= v5;
  v7 = a2 - v5;
  if (v7 == 0 || !v6)
    return 9;
  v8 = *(_QWORD *)(a1 + 16);
  if (v8 != -1 && v8 != v7)
    return 9;
  result = 0;
  *(_QWORD *)(a1 + 16) = v7;
  return result;
}

uint64_t lzma_block_unpadded_size(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;

  if (result)
  {
    if (*(_DWORD *)result > 1u)
      return 0;
    v1 = *(unsigned int *)(result + 4);
    if ((v1 - 8) > 0x3F8 || (*(_DWORD *)(result + 4) & 3) != 0)
      return 0;
    v3 = *(_QWORD *)(result + 16);
    if (v3 < -1 || v3 == 0)
    {
      return 0;
    }
    else
    {
      v5 = *(_DWORD *)(result + 8);
      if (v5 >= 0x10)
        result = 0;
      else
        result = -1;
      if (v3 != -1 && v5 <= 0xF)
      {
        v6 = v3 + v1;
        v7 = lzma_check_size(v5);
        if (v6 + (unint64_t)v7 <= 0x7FFFFFFFFFFFFFFCLL)
          return v6 + v7;
        else
          return 0;
      }
    }
  }
  return result;
}

unint64_t lzma_block_total_size(uint64_t a1)
{
  uint64_t v1;

  v1 = lzma_block_unpadded_size(a1);
  if (v1 == -1)
    return -1;
  else
    return (v1 + 3) & 0xFFFFFFFFFFFFFFFCLL;
}

BOOL lzma_easy_preset(_QWORD *a1, int a2)
{
  _QWORD *v3;
  int v4;

  v3 = a1 + 10;
  v4 = lzma_lzma_preset((uint64_t)(a1 + 10), a2);
  if (!v4)
  {
    *a1 = 33;
    a1[1] = v3;
    a1[2] = -1;
  }
  return v4 != 0;
}

uint64_t lzma_filters_copy(uint64_t *a1, void *__dst, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  _QWORD *v18;
  void **v19;
  void *v20;
  _QWORD __src[10];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = 11;
  if (!a1 || !__dst)
    return v3;
  v6 = *a1;
  if (*a1 != -1)
  {
    v8 = 0;
    while (v8 != 4)
    {
      __src[2 * v8] = v6;
      v9 = &a1[2 * v8];
      v11 = v9[1];
      v10 = (const void **)(v9 + 1);
      if (v11)
      {
        if (v6 != 0x4000000000000001)
        {
          v13 = 0;
          v14 = &qword_229953328;
          while (v13 != -11)
          {
            v15 = *v14;
            v14 += 3;
            --v13;
            if (v6 == v15)
            {
              v12 = -v13;
              goto LABEL_14;
            }
          }
          v3 = 8;
          if (!v8)
            return v3;
LABEL_24:
          v19 = (void **)&__src[2 * v8 - 1];
          do
          {
            --v8;
            v20 = *v19;
            v19 -= 2;
            lzma_free(v20, a3);
          }
          while (v8);
          return v3;
        }
        v12 = 0;
LABEL_14:
        v16 = features[3 * v12 + 1];
        v17 = lzma_alloc(v16, a3);
        __src[2 * v8 + 1] = v17;
        if (!v17)
        {
          v3 = 5;
          if (!v8)
            return v3;
          goto LABEL_24;
        }
        memcpy(v17, *v10, v16);
      }
      else
      {
        __src[2 * v8 + 1] = 0;
      }
      ++v8;
      v6 = a1[2 * v8];
      if (v6 == -1)
        goto LABEL_21;
    }
    v3 = 8;
    goto LABEL_24;
  }
  v8 = 0;
LABEL_21:
  v18 = &__src[2 * v8];
  *v18 = -1;
  v18[1] = 0;
  memcpy(__dst, __src, 16 * v8 + 16);
  return 0;
}

void lzma_filters_free(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  if (a1 && *a1 != -1)
  {
    v4 = 0;
    do
    {
      v5 = &a1[v4];
      lzma_free((void *)a1[v4 + 1], a2);
      *v5 = -1;
      v5[1] = 0;
      if (v4 == 6)
        break;
      v4 += 2;
    }
    while (v5[2] != -1);
  }
}

uint64_t lzma_validate_chain(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t result;

  if (!a1)
    return 11;
  v2 = *a1;
  if (*a1 == -1)
    return 11;
  v3 = 0;
  v4 = 0;
  v5 = 1;
  do
  {
    if (v2 != 0x4000000000000001)
    {
      v7 = 0;
      v8 = &qword_229953328;
      while (v7 != -11)
      {
        v9 = *v8;
        v8 += 3;
        --v7;
        if (v2 == v9)
        {
          v6 = -v7;
          if (!v5)
            return 8;
          goto LABEL_11;
        }
      }
      return 8;
    }
    v6 = 0;
    if (!v5)
      return 8;
LABEL_11:
    if (v6 < 3)
      ++v3;
    v5 = v6 - 3 < 8;
    ++v4;
    v2 = a1[2 * v4];
  }
  while (v2 != -1);
  result = 8;
  if (v4 <= 4 && v6 <= 2 && v3 <= 3)
  {
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t lzma_raw_coder_init(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t), char a5)
{
  uint64_t *v7;
  uint64_t filter_init;
  __n128 v11;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v27;
  _QWORD v28[2];
  _QWORD v29[14];

  v7 = a3;
  v29[13] = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  filter_init = lzma_validate_chain(a3, &v27);
  if (!(_DWORD)filter_init)
  {
    v12 = v27;
    if ((a5 & 1) != 0)
    {
      if (v27)
      {
        v13 = &v28[3 * v27 - 1];
        v14 = v27;
        do
        {
          v15 = a4(*v7);
          if (!v15)
            return 8;
          v16 = *(_QWORD *)(v15 + 8);
          if (!v16)
            return 8;
          v17 = *v7;
          v18 = v7[1];
          v7 += 2;
          *(v13 - 2) = v17;
          *(v13 - 1) = v16;
          *v13 = v18;
          v13 -= 3;
        }
        while (--v14);
      }
    }
    else if (v27)
    {
      v19 = v29;
      v20 = v27;
      do
      {
        v21 = a4(*v7);
        if (!v21)
          return 8;
        v22 = *(_QWORD *)(v21 + 8);
        if (!v22)
          return 8;
        v23 = *v7;
        v24 = v7[1];
        v7 += 2;
        *(v19 - 2) = v23;
        *(v19 - 1) = v22;
        *v19 = v24;
        v19 += 3;
      }
      while (--v20);
    }
    v25 = &v28[3 * v12];
    *v25 = -1;
    v25[1] = 0;
    filter_init = lzma_next_filter_init(a1, a2, v28, v11);
    if ((_DWORD)filter_init)
      lzma_next_end(a1, a2);
  }
  return filter_init;
}

uint64_t lzma_raw_coder_memusage(uint64_t (*a1)(uint64_t), uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD);
  uint64_t v11;
  unint64_t v12;

  if (!lzma_validate_chain(a2, &v12))
  {
    v5 = 0;
    v8 = *a2;
    v7 = a2 + 2;
    v6 = v8;
    while (1)
    {
      v9 = a1(v6);
      if (!v9)
        break;
      v10 = *(uint64_t (**)(_QWORD))(v9 + 16);
      if (v10)
      {
        result = v10(*(v7 - 1));
        if (result == -1)
          return result;
        v5 += result;
      }
      else
      {
        v5 += 1024;
      }
      v11 = *v7;
      v7 += 2;
      v6 = v11;
      if (v11 == -1)
        return v5 + 0x8000;
    }
  }
  return -1;
}

void *lzma_index_init(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  v2 = lzma_alloc(0x50uLL, a1);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    v2[1] = 0;
    *((_DWORD *)v2 + 6) = 0;
    v2[2] = 0;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    v2[8] = 512;
    *((_DWORD *)v2 + 18) = 0;
    v4 = lzma_alloc(0xA8uLL, a1);
    if (v4)
    {
      v4[4] = 0;
      *(_OWORD *)v4 = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_DWORD *)v4 + 10) = 1;
      v4[11] = 0;
      v4[12] = 0;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_DWORD *)v4 + 20) = 0;
      *((_DWORD *)v4 + 26) = -1;
      v4[20] = 0;
      index_tree_append((uint64_t)v3, v4);
    }
    else
    {
      lzma_free(v3, a1);
      return 0;
    }
  }
  return v3;
}

uint64_t index_tree_append(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(result + 16);
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = v2;
  v3 = *(_DWORD *)(result + 24) + 1;
  *(_DWORD *)(result + 24) = v3;
  if (*(_QWORD *)result)
  {
    *(_QWORD *)(v2 + 32) = a2;
    *(_QWORD *)(result + 16) = a2;
    if (v3 != 1 << (__clz(v3) ^ 0x1F))
    {
      v4 = __clz(__rbit32(v3)) + 2;
      do
      {
        a2 = (_QWORD *)a2[2];
        --v4;
      }
      while (v4);
      v5 = a2[4];
      v6 = a2[2];
      v7 = (_QWORD *)(v6 + 32);
      if (!v6)
        v7 = (_QWORD *)result;
      *v7 = v5;
      *(_QWORD *)(v5 + 16) = v6;
      v8 = *(_QWORD *)(v5 + 24);
      a2[4] = v8;
      if (v8)
        *(_QWORD *)(v8 + 16) = a2;
      *(_QWORD *)(v5 + 24) = a2;
      a2[2] = v5;
    }
  }
  else
  {
    *(_QWORD *)result = a2;
    *(_QWORD *)(result + 8) = a2;
    *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

void lzma_index_end(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (a1)
  {
    v4 = *a1;
    if (v4)
      index_tree_node_end(v4, a2, (uint64_t (*)(_QWORD, _QWORD))index_stream_end);
    lzma_free(a1, a2);
  }
}

void index_stream_end(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = a1[7];
  if (v4)
    index_tree_node_end(v4, a2, (uint64_t (*)(_QWORD, _QWORD))lzma_free);
  lzma_free(a1, a2);
}

uint64_t lzma_index_prealloc(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  v2 = 0xFFFFFFFFFFFFFFBLL;
  if (a2 < 0xFFFFFFFFFFFFFFBLL)
    v2 = a2;
  *(_QWORD *)(result + 64) = v2;
  return result;
}

uint64_t lzma_index_memusage(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v4;
  uint64_t v5;

  v2 = 8288 * ((a2 + 511) >> 9);
  v4 = -113 - 296 * a1 >= v2
    && a2 <= 0xFD08E5500FD0800
    && (unint64_t)(a1 - 0x100000000) >= 0xFFFFFFFF00000001;
  v5 = 296 * a1 + v2 + 112;
  if (v4)
    return v5;
  else
    return -1;
}

uint64_t lzma_index_memused(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v5;
  uint64_t v6;

  v1 = *(unsigned int *)(a1 + 24);
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 8288 * ((v2 + 511) >> 9);
  v5 = -113 - 296 * (unint64_t)v1 < v3 || v2 > 0xFD08E5500FD0800 || v1 == 0;
  v6 = v3 + 296 * v1 + 112;
  if (v5)
    return -1;
  else
    return v6;
}

uint64_t lzma_index_block_count(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t lzma_index_stream_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

unint64_t lzma_index_size(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 56);
  return (v1 + lzma_vli_size(*(_QWORD *)(a1 + 48)) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t lzma_index_total_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

unint64_t lzma_index_stream_size(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[5];
  v2 = a1[7];
  return v1 + ((v2 + lzma_vli_size(a1[6]) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL) + 24;
}

uint64_t lzma_index_file_size(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v1 = *(_QWORD **)(a1 + 16);
  v2 = v1[9];
  if (v2)
    v2 = (*(_QWORD *)(v2 + 16 * *(_QWORD *)(v2 + 56) + 72) + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v3 = v1[1] + v2 + v1[20] + 24;
  if (v3 < 0)
    return -1;
  v4 = v1[12];
  v5 = lzma_vli_size(v1[11]);
  if ((uint64_t)(((v4 + (v5 + 1) + 7) & 0xFFFFFFFFFFFFFFFCLL) + v3) < 0)
    return -1;
  else
    return ((v4 + (v5 + 1) + 7) & 0xFFFFFFFFFFFFFFFCLL) + v3;
}

uint64_t lzma_index_uncompressed_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t lzma_index_checks(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(unsigned int *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)(v3 + 104) != -1)
    return (1 << *(_DWORD *)(v3 + 120)) | result;
  return result;
}

uint64_t lzma_index_padding_size(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 56);
  return (3 - v1 - lzma_vli_size(*(_QWORD *)(a1 + 48))) & 3;
}

__n128 lzma_index_stream_flags(uint64_t a1, uint64_t a2)
{
  __n128 result;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  if (a1 && a2 && !lzma_stream_flags_compare(a2, a2))
  {
    v5 = *(_QWORD *)(a1 + 16);
    result = *(__n128 *)a2;
    v6 = *(_OWORD *)(a2 + 16);
    v7 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(v5 + 152) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)(v5 + 136) = v7;
    *(_OWORD *)(v5 + 120) = v6;
    *(__n128 *)(v5 + 104) = result;
  }
  return result;
}

uint64_t lzma_index_stream_padding(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = 11;
  if (a1 && (a2 & 0x8000000000000003) == 0)
  {
    v5 = *(_QWORD *)(a1 + 16);
    v6 = *(_QWORD *)(v5 + 160);
    *(_QWORD *)(v5 + 160) = 0;
    v7 = lzma_index_file_size(a1);
    if (v7 + a2 >= 0)
      v8 = a2;
    else
      v8 = v6;
    result = ((v7 + a2) >> 63) & 9;
    *(_QWORD *)(v5 + 160) = v8;
  }
  return result;
}

uint64_t lzma_index_append(_QWORD *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  result = 11;
  if ((a4 & 0x8000000000000000) == 0 && a1 && a3 - 0x7FFFFFFFFFFFFFFDLL >= 0x8000000000000008)
  {
    v9 = (_QWORD *)a1[2];
    v10 = (_QWORD *)v9[9];
    if (v10)
    {
      v11 = &v10[2 * v10[7]];
      v12 = v11[8];
      v13 = (v11[9] + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }
    if ((uint64_t)(v12 + a4) >= 0)
    {
      v34 = v12 + a4;
      v14 = lzma_vli_size(a3);
      v15 = lzma_vli_size(a4);
      v16 = ((v13 + a3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + v9[1] + v9[20] + 24;
      if (v16 >= 0)
      {
        v31 = v13;
        v32 = v13 + a3;
        v29 = v9[11] + 1;
        v33 = (v15 + v14);
        v30 = v9[12];
        if ((uint64_t)(((v33 + 7 + v30 + lzma_vli_size(v29) + 1) & 0xFFFFFFFFFFFFFFFCLL) + v16) >= 0)
        {
          v17 = a1[7];
          v18 = a1[6] + 1;
          if (((v33 + 7 + v17 + lzma_vli_size(v18) + 1) & 0xFFFFFFFFFFFFFFFCLL) <= 0x400000000)
          {
            if (v10 && (v19 = v10[7] + 1, v19 < v10[6]))
            {
              v10[7] = v19;
              v21 = v33;
              v20 = v34;
              v22 = v32;
              v24 = v29;
              v23 = v30;
            }
            else
            {
              v25 = lzma_alloc(16 * a1[8] + 64, a2);
              if (!v25)
                return 5;
              v10 = v25;
              v25[7] = 0;
              v26 = a1[8];
              a1[8] = 512;
              *v25 = v12;
              v25[1] = v31;
              v25[5] = v9[11] + 1;
              v25[6] = v26;
              index_tree_append((uint64_t)(v9 + 7), v25);
              v19 = v10[7];
              v23 = v9[12];
              v17 = a1[7];
              v24 = v9[11] + 1;
              v18 = a1[6] + 1;
              v21 = v33;
              v20 = v34;
              v22 = v32;
            }
            result = 0;
            v27 = &v10[2 * v19];
            v27[8] = v20;
            v27[9] = v22;
            v9[11] = v24;
            v9[12] = v23 + v21;
            v28 = a1[5] + ((a3 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            a1[4] += a4;
            a1[5] = v28;
            a1[6] = v18;
            a1[7] = v17 + v21;
            return result;
          }
        }
      }
    }
    return 9;
  }
  return result;
}

uint64_t lzma_index_cat(int64x2_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int32 v20;
  int64x2_t v21;
  int64x2_t v22;
  uint64_t v23;
  uint64_t v24;
  int64x2_t *v25;

  result = 11;
  if (a1 && a2)
  {
    v7 = lzma_index_file_size((uint64_t)a1);
    if (lzma_index_file_size(a2) + v7 < 0)
      return 9;
    if (*(_QWORD *)(a2 + 32) + a1[2].i64[0] < 0)
      return 9;
    v8 = a1[3].i64[1];
    v9 = lzma_vli_size(a1[3].u64[0]) + 1;
    v10 = *(_QWORD *)(a2 + 56);
    if (((v8 + v10 + v9 + lzma_vli_size(*(_QWORD *)(a2 + 48)) + 1 + 11) & 0xFFFFFFFFFFFFFFFCLL) > 0x400000000)
    {
      return 9;
    }
    else
    {
      v11 = a1[1].i64[0];
      v12 = *(_QWORD **)(v11 + 72);
      if (v12)
      {
        v13 = v12[7] + 1;
        if (v13 < v12[6])
        {
          v14 = lzma_alloc(16 * v13 + 64, a3);
          if (!v14)
            return 5;
          v15 = v14;
          v16 = *(_OWORD *)v12;
          v17 = *((_OWORD *)v12 + 1);
          v14[4] = v12[4];
          *(_OWORD *)v14 = v16;
          *((_OWORD *)v14 + 1) = v17;
          v18 = v12[7];
          v14[6] = v18 + 1;
          v14[7] = v18;
          v14[5] = v12[5];
          memcpy(v14 + 8, v12 + 8, 16 * (v18 + 1));
          v19 = v12[2];
          if (v19)
            *(_QWORD *)(v19 + 32) = v15;
          if (*(_QWORD **)(v11 + 64) == v12)
          {
            *(_QWORD *)(v11 + 56) = v15;
            *(_QWORD *)(v11 + 64) = v15;
          }
          *(_QWORD *)(v11 + 72) = v15;
          lzma_free(v12, a3);
          v11 = a1[1].i64[0];
        }
      }
      v20 = a1[4].i32[2];
      if (*(_DWORD *)(v11 + 104) != -1)
        v20 |= 1 << *(_DWORD *)(v11 + 120);
      a1[4].i32[2] = v20;
      v22.i64[0] = a1[2].i64[0];
      v22.i64[1] = v7;
      v23 = a1[3].i64[0];
      v24 = 0;
      LODWORD(v24) = a1[1].i32[2];
      v25 = a1;
      index_cat_helper(&v22, *(int64x2_t **)a2);
      v21 = vaddq_s64(a1[3], *(int64x2_t *)(a2 + 48));
      a1[2] = vaddq_s64(a1[2], *(int64x2_t *)(a2 + 32));
      a1[3] = v21;
      a1[4].i32[2] |= *(_DWORD *)(a2 + 72);
      lzma_free((void *)a2, a3);
      return 0;
    }
  }
  return result;
}

uint64_t index_cat_helper(int64x2_t *a1, int64x2_t *a2)
{
  int64x2_t *v4;
  uint64_t result;

  do
  {
    v4 = (int64x2_t *)a2[2].i64[0];
    if (a2[1].i64[1])
      index_cat_helper(a1);
    *a2 = vaddq_s64(*a2, *a1);
    a2[2].i32[2] += a1[1].i32[2];
    a2[3].i64[0] += a1[1].i64[0];
    result = index_tree_append(a1[2].i64[0], a2);
    a2 = v4;
  }
  while (v4);
  return result;
}

uint64_t *lzma_index_dup(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  __int128 v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  BOOL v30;
  uint64_t *v31;
  uint64_t *v32;

  v4 = (uint64_t *)lzma_alloc(0x50uLL, a2);
  v5 = v4;
  if (v4)
  {
    *v4 = 0;
    v4[1] = 0;
    *((_DWORD *)v4 + 6) = 0;
    v4[2] = 0;
    v4[8] = 512;
    *((_DWORD *)v4 + 18) = 0;
    v6 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v4 + 3) = v6;
    v7 = *(uint64_t **)(a1 + 8);
    v8 = v7 + 11;
    if ((unint64_t)v7[11] <= 0xFFFFFFFFFFFFFFBLL)
    {
      do
      {
        v11 = *v7;
        v10 = v7[1];
        v12 = *((_DWORD *)v7 + 10);
        v13 = v7[6];
        v14 = (char *)lzma_alloc(0xA8uLL, a2);
        if (!v14)
          break;
        v15 = v14;
        *(_QWORD *)v14 = v11;
        *((_QWORD *)v14 + 1) = v10;
        *((_QWORD *)v14 + 3) = 0;
        *((_QWORD *)v14 + 4) = 0;
        *((_QWORD *)v14 + 2) = 0;
        *((_DWORD *)v14 + 10) = v12;
        *((_QWORD *)v14 + 6) = v13;
        *((_QWORD *)v14 + 7) = 0;
        v16 = (uint64_t)(v14 + 56);
        *((_QWORD *)v14 + 8) = 0;
        *((_QWORD *)v14 + 9) = 0;
        *((_DWORD *)v14 + 20) = 0;
        v17 = *v8;
        v18 = v7[12];
        *((_QWORD *)v14 + 11) = *v8;
        *((_QWORD *)v14 + 12) = v18;
        v19 = *(_OWORD *)(v7 + 13);
        v20 = *(_OWORD *)(v7 + 15);
        v21 = *(_OWORD *)(v7 + 17);
        *((_QWORD *)v14 + 19) = v7[19];
        *(_OWORD *)(v14 + 136) = v21;
        *(_OWORD *)(v14 + 120) = v20;
        *(_OWORD *)(v14 + 104) = v19;
        *((_QWORD *)v14 + 20) = v7[20];
        if (v7[8])
        {
          v22 = lzma_alloc(16 * v17 + 64, a2);
          if (!v22)
          {
            index_stream_end(v15, a2);
            break;
          }
          v23 = v22;
          v24 = 0;
          *v22 = 0;
          v22[1] = 0;
          v22[5] = 1;
          v25 = *v8 - 1;
          v22[6] = *v8;
          v22[7] = v25;
          v26 = (_QWORD *)v7[8];
          v27 = v22 + 8;
LABEL_9:
          while (1)
          {
            memcpy(&v27[2 * v24], v26 + 8, 16 * v26[7] + 16);
            v24 += v26[7] + 1;
            v28 = (_QWORD *)v26[4];
            v29 = v26;
            if (!v28)
              break;
            do
            {
              v26 = v28;
              v28 = (_QWORD *)v28[3];
            }
            while (v28);
          }
          while (1)
          {
            v26 = (_QWORD *)v29[2];
            if (!v26)
              break;
            v30 = v26[4] == (_QWORD)v29;
            v29 = (_QWORD *)v29[2];
            if (!v30)
              goto LABEL_9;
          }
          index_tree_append(v16, v23);
        }
        index_tree_append((uint64_t)v5, v15);
        v31 = (uint64_t *)v7[4];
        if (!v31)
        {
          while (1)
          {
            v32 = (uint64_t *)v7[2];
            if (!v32)
              return v5;
            v30 = v32[4] == (_QWORD)v7;
            v7 = (uint64_t *)v7[2];
            if (!v30)
              goto LABEL_21;
          }
        }
        do
        {
          v32 = v31;
          v31 = (uint64_t *)v31[3];
        }
        while (v31);
LABEL_21:
        v8 = v32 + 11;
        v7 = v32;
      }
      while ((unint64_t)v32[11] <= 0xFFFFFFFFFFFFFFBLL);
    }
    lzma_index_end(v5, a2);
    return 0;
  }
  return v5;
}

double lzma_index_iter_init(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)(a1 + 256) = a2;
  result = 0.0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  return result;
}

double lzma_index_iter_rewind(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  return result;
}

uint64_t lzma_index_iter_next(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD **v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  if (a2 > 3)
    return 1;
  v3 = *(_QWORD *)(a1 + 264);
  v4 = *(_QWORD *)(a1 + 280);
  if (a2 == 1)
    goto LABEL_8;
  v5 = *(_QWORD *)(a1 + 288);
  if (v5 == 2)
  {
    v6 = (_QWORD **)(v3 + 64);
    goto LABEL_10;
  }
  if (v5 != 1)
  {
    if (!v5)
    {
      v6 = (_QWORD **)(a1 + 272);
LABEL_10:
      v7 = *v6;
      goto LABEL_16;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(a1 + 272);
  v9 = *(_QWORD **)(v8 + 32);
  if (v9)
  {
    do
    {
      v7 = v9;
      v9 = (_QWORD *)v9[3];
    }
    while (v9);
  }
  else
  {
    do
    {
      v7 = *(_QWORD **)(v8 + 16);
      if (!v7)
        break;
      v10 = v7[4] == v8;
      v8 = *(_QWORD *)(v8 + 16);
    }
    while (v10);
  }
LABEL_16:
  while (v3)
  {
    if (!v7)
      goto LABEL_34;
    if (v4 >= v7[7])
    {
      v4 = v7[4];
      if (!v4)
      {
        while (1)
        {
          v13 = (_QWORD *)v7[2];
          if (!v13)
            break;
          v10 = v13[4] == (_QWORD)v7;
          v7 = (_QWORD *)v7[2];
          if (!v10)
          {
            v4 = 0;
            v7 = v13;
            goto LABEL_42;
          }
        }
LABEL_34:
        while (1)
        {
          v14 = *(_QWORD *)(v3 + 32);
          v15 = v3;
          if (!v14)
            break;
          do
          {
            v3 = v14;
            v14 = *(_QWORD *)(v14 + 24);
          }
          while (v14);
LABEL_39:
          if (a2 < 2)
            goto LABEL_49;
          v7 = *(_QWORD **)(v3 + 64);
          if (v7)
            goto LABEL_41;
        }
        while (1)
        {
          v3 = *(_QWORD *)(v15 + 16);
          if (!v3)
            return 1;
          v10 = *(_QWORD *)(v3 + 32) == v15;
          v15 = *(_QWORD *)(v15 + 16);
          if (!v10)
            goto LABEL_39;
        }
      }
      do
      {
        v7 = (_QWORD *)v4;
        v4 = *(_QWORD *)(v4 + 24);
      }
      while (v4);
    }
    else
    {
      ++v4;
    }
LABEL_42:
    if (a2 != 3)
      goto LABEL_50;
    if (v4)
    {
      if (v7[2 * v4 + 6] != v7[2 * v4 + 8])
        goto LABEL_50;
    }
    else if (*v7 != v7[8])
    {
      v4 = 0;
      goto LABEL_50;
    }
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8);
  if (a2 >= 2)
  {
    while (1)
    {
LABEL_21:
      v7 = *(_QWORD **)(v3 + 64);
      if (v7)
      {
LABEL_41:
        v4 = 0;
        goto LABEL_42;
      }
      v11 = *(_QWORD *)(v3 + 32);
      v12 = v3;
      if (!v11)
        break;
      do
      {
        v3 = v11;
        v11 = *(_QWORD *)(v11 + 24);
      }
      while (v11);
    }
    while (1)
    {
      v3 = *(_QWORD *)(v12 + 16);
      if (!v3)
        return 1;
      v10 = *(_QWORD *)(v3 + 32) == v12;
      v12 = *(_QWORD *)(v12 + 16);
      if (!v10)
        goto LABEL_21;
    }
  }
LABEL_49:
  v4 = 0;
  v7 = *(_QWORD **)(v3 + 64);
LABEL_50:
  *(_QWORD *)(a1 + 264) = v3;
  *(_QWORD *)(a1 + 272) = v7;
  *(_QWORD *)(a1 + 280) = v4;
  iter_set_info((uint64_t **)a1);
  return 0;
}

uint64_t iter_set_info(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;

  v3 = a1[33];
  v2 = a1[34];
  if (v2)
  {
    if ((uint64_t *)a1[32][2] == v3 && (uint64_t *)v3[9] == v2)
    {
      if ((uint64_t *)v3[8] == v2)
      {
        a1[36] = (uint64_t *)2;
        a1[34] = 0;
      }
      else
      {
        a1[36] = (uint64_t *)1;
        a1[34] = (uint64_t *)v2[2];
      }
    }
    else
    {
      a1[36] = 0;
    }
  }
  else
  {
    a1[36] = (uint64_t *)2;
  }
  v4 = a1[35];
  v5 = v3[11];
  a1[4] = (uint64_t *)*((unsigned int *)v3 + 10);
  a1[5] = (uint64_t *)v5;
  v7 = (uint64_t *)*v3;
  v6 = (uint64_t *)v3[1];
  a1[6] = v6;
  a1[7] = v7;
  v8 = v3 + 13;
  if (*((_DWORD *)v3 + 26) == -1)
    v8 = 0;
  *a1 = v8;
  a1[10] = (uint64_t *)v3[20];
  v9 = v3[9];
  if (v9)
  {
    v10 = v3[12];
    result = lzma_vli_size(v5);
    v12 = *(uint64_t **)(v9 + 16 * *(_QWORD *)(v9 + 56) + 64);
    v13 = ((v10 + (result + 1) + 7) & 0xFFFFFFFFFFFFFFFCLL)
        + ((*(_QWORD *)(v9 + 16 * *(_QWORD *)(v9 + 56) + 72) + 3) & 0xFFFFFFFFFFFFFFFCLL);
  }
  else
  {
    result = lzma_vli_size(0);
    v12 = 0;
    v13 = ((result + 1) + 7) & 0x1FFFFFFFCLL;
  }
  a1[8] = (uint64_t *)(v13 + 24);
  a1[9] = v12;
  if (v2)
  {
    v14 = (uint64_t *)((char *)v4 + v2[5]);
    a1[18] = v14;
    a1[15] = (uint64_t *)((char *)v14 + v3[6]);
    if (v4)
    {
      v15 = (uint64_t)v4 - 1;
      v16 = (v2[2 * ((_QWORD)v4 - 1) + 9] + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    else
    {
      v16 = v2[1];
      v15 = -1;
    }
    a1[19] = (uint64_t *)v16;
    v17 = &v2[2 * v15 + 8];
    if (!v4)
      v17 = v2;
    v18 = (uint64_t *)*v17;
    v19 = &v2[2 * (_QWORD)v4 + 8];
    v20 = (uint64_t *)(*v19 - (_QWORD)v18);
    v21 = v19[1] - v16;
    a1[21] = v20;
    a1[22] = (uint64_t *)v21;
    a1[23] = (uint64_t *)((v21 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    v22 = v16 + 12;
    a1[19] = (uint64_t *)v22;
    a1[20] = v18;
    a1[16] = (uint64_t *)((char *)v6 + v22);
    a1[17] = (uint64_t *)((char *)v7 + (_QWORD)v18);
  }
  return result;
}

uint64_t lzma_index_iter_locate(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v2 = *(_QWORD *)(a1 + 256);
  if (*(_QWORD *)(v2 + 32) <= a2)
    return 1;
  v3 = 0;
  v4 = *(unint64_t **)v2;
  do
  {
    if (*v4 > a2)
    {
      v5 = 3;
    }
    else
    {
      v3 = v4;
      v5 = 4;
    }
    v4 = (unint64_t *)v4[v5];
  }
  while (v4);
  v6 = a2 - *v3;
  v7 = (unint64_t *)v3[7];
  do
  {
    if (*v7 > v6)
    {
      v8 = 3;
    }
    else
    {
      v4 = v7;
      v8 = 4;
    }
    v7 = (unint64_t *)v7[v8];
  }
  while (v7);
  v9 = v4[7];
  if (v9)
  {
    v10 = 0;
    do
    {
      v11 = v10 + ((v9 - v10) >> 1);
      if (v4[2 * v11 + 8] > v6)
        v9 = v10 + ((v9 - v10) >> 1);
      else
        v10 = v11 + 1;
    }
    while (v10 < v9);
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(a1 + 264) = v3;
  *(_QWORD *)(a1 + 272) = v4;
  *(_QWORD *)(a1 + 280) = v10;
  iter_set_info((uint64_t **)a1);
  return 0;
}

uint64_t index_tree_node_end(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(_QWORD, _QWORD);

  v5 = *(_QWORD *)(a1 + 24);
  v8 = a3;
  if (v5)
  {
    index_tree_node_end(v5, a2, a3);
    a3 = v8;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    index_tree_node_end(v6, a2, v8);
    a3 = v8;
  }
  return a3(a1, a2);
}

uint64_t lzma_stream_flags_compare(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_DWORD *)a1 || *(_DWORD *)a2)
    return 8;
  v3 = *(_DWORD *)(a1 + 16);
  if (v3 > 0xF)
    return 11;
  v4 = *(_DWORD *)(a2 + 16);
  if (v4 > 0xF)
    return 11;
  if (v3 != v4)
    return 9;
  v5 = *(_QWORD *)(a1 + 8);
  if (v5 == -1)
    return 0;
  v6 = *(_QWORD *)(a2 + 8);
  if (v6 == -1)
    return 0;
  result = 11;
  if ((unint64_t)(v5 - 4) < 0x3FFFFFFFDLL
    && (v5 & 3) == 0
    && (unint64_t)(v6 - 4) < 0x3FFFFFFFDLL
    && (v6 & 3) == 0)
  {
    if (v5 == v6)
      return 0;
    return 9;
  }
  return result;
}

uint64_t lzma_vli_size(unint64_t a1)
{
  uint64_t v1;
  BOOL v2;

  v1 = 0;
  if ((a1 & 0x8000000000000000) == 0)
  {
    do
    {
      v1 = (v1 + 1);
      v2 = a1 > 0x7F;
      a1 >>= 7;
    }
    while (v2);
  }
  return v1;
}

uint64_t lzma_alone_encoder(_QWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = alone_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t alone_encoder_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _QWORD *v7;
  __n128 v8;
  unsigned int v10;
  unsigned int v11;
  int v12;
  BOOL v13;
  int v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x24BDAC8D0];
  if (*(uint64_t (**)())(a1 + 16) != alone_encoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = alone_encoder_init;
  v6 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    v7 = lzma_alloc(0x70uLL, a2);
    if (!v7)
      return 5;
    v6 = (uint64_t)v7;
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 24) = alone_encode;
    *(_QWORD *)(a1 + 32) = alone_encoder_end;
    *v7 = 0;
    v7[1] = -1;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
  }
  *(_DWORD *)(v6 + 80) = 0;
  *(_QWORD *)(v6 + 88) = 0;
  if ((lzma_lzma_lclppb_encode(a3, (_BYTE *)(v6 + 96)) & 1) != 0 || *a3 < 0x1000u)
    return 8;
  v10 = (*a3 - 1) | ((*a3 - 1) >> 2) | (((*a3 - 1) | ((*a3 - 1) >> 2)) >> 3);
  v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
  v12 = v11 | HIWORD(v11);
  v13 = __CFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    v14 = -1;
  *(_DWORD *)(v6 + 97) = v14;
  *(_QWORD *)(v6 + 101) = -1;
  v15[0] = 0x4000000000000001;
  v15[1] = lzma_lzma_encoder_init;
  v15[2] = a3;
  memset(&v15[3], 0, 24);
  return lzma_next_filter_init(v6, a2, v15, v8);
}

uint64_t alone_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8)
{
  uint64_t v16;
  uint64_t *v17;
  int v18;

  if (*a7 >= a8)
    return 0;
  v16 = a1 + 96;
  v17 = (uint64_t *)(a1 + 88);
  v18 = *(_DWORD *)(a1 + 80);
  while (!v18)
  {
    lzma_bufcpy(v16, v17, 13, a6, a7, a8);
    if ((unint64_t)*v17 >= 0xD)
    {
      v18 = 1;
      *(_DWORD *)(a1 + 80) = 1;
      if (*a7 < a8)
        continue;
    }
    return 0;
  }
  if (v18 == 1)
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, unint64_t))(a1 + 24))(*(_QWORD *)a1, a2, a3, a4, a5, a6, a7, a8);
  else
    return 11;
}

void alone_encoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

unint64_t lzma_block_buffer_bound64(unint64_t a1)
{
  unint64_t v1;

  if (a1 <= 0x7FFFFFFFFFFFFBBCLL && (v1 = 3 * ((a1 + 0xFFFF) >> 16), 0x7FFFFFFFFFFFFBBBLL - v1 >= a1))
    return ((a1 + v1 + 4) & 0xFFFFFFFFFFFFFFFCLL) + 92;
  else
    return 0;
}

unint64_t lzma_block_buffer_bound(unint64_t a1)
{
  unint64_t v1;

  if (a1 <= 0x7FFFFFFFFFFFFBBCLL && (v1 = 3 * ((a1 + 0xFFFF) >> 16), 0x7FFFFFFFFFFFFBBBLL - v1 >= a1))
    return ((a1 + v1 + 4) & 0xFFFFFFFFFFFFFFFCLL) + 92;
  else
    return 0;
}

uint64_t lzma_block_buffer_encode(uint64_t a1, uint64_t a2, char *a3, unint64_t a4, uint64_t a5, uint64_t *a6, unint64_t a7)
{
  return block_buffer_encode(a1, a2, a3, a4, a5, a6, a7, 1);
}

uint64_t block_buffer_encode(uint64_t a1, uint64_t a2, char *a3, unint64_t a4, uint64_t a5, uint64_t *a6, unint64_t a7, int a8)
{
  BOOL v11;
  uint64_t result;
  uint64_t v16;
  unsigned int v17;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[10];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 11;
  if (a4)
    v11 = a3 == 0;
  else
    v11 = 0;
  result = 11;
  if (!v11)
  {
    if (a5)
    {
      if (a6)
      {
        v16 = *a6;
        if (a7 >= *a6)
        {
          if (*(_DWORD *)a1 > 1u)
            return 8;
          v17 = *(_DWORD *)(a1 + 8);
          if (v17 <= 0xF && (!a8 || *(_QWORD *)(a1 + 32)))
          {
            if (!lzma_check_is_supported(*(_DWORD *)(a1 + 8)))
              return 3;
            v20 = a7 - (((_BYTE)a7 - (_BYTE)v16) & 3);
            v21 = lzma_check_size(v17);
            if (v20 - v16 <= v21)
              return 10;
            *(_QWORD *)(a1 + 24) = a4;
            if (a4 > 0x7FFFFFFFFFFFFBBCLL || (v22 = 3 * ((a4 + 0xFFFF) >> 16), 0x7FFFFFFFFFFFFBBBLL - v22 < a4))
            {
              *(_QWORD *)(a1 + 16) = 0;
              return 9;
            }
            v23 = v21;
            v24 = v20 - v21;
            *(_QWORD *)(a1 + 16) = a4 + v22 + 1;
            if (a8)
            {
              result = block_encode_normal(a1, a2, (uint64_t)a3, a4, a5, a6, v24);
              if (!(_DWORD)result)
              {
LABEL_27:
                v25 = *(_QWORD *)(a1 + 16);
                if ((v25 & 3) != 0)
                {
                  v26 = v25 + 1;
                  do
                  {
                    v27 = (*a6)++;
                    *(_BYTE *)(a5 + v27) = 0;
                    v11 = (v26++ & 3) == 0;
                  }
                  while (!v11);
                }
                if (!(_DWORD)v23)
                  return 0;
                v29 = 0;
                memset(v28, 0, sizeof(v28));
                lzma_check_init((uint64_t)v28, *(_DWORD *)(a1 + 8));
                lzma_check_update((uint64_t)v28, *(_DWORD *)(a1 + 8), a3, a4);
                lzma_check_finish((uint64_t)v28, *(_DWORD *)(a1 + 8));
                memcpy((void *)(a1 + 40), v28, v23);
                memcpy((void *)(a5 + *a6), v28, v23);
                result = 0;
                *a6 += v23;
                return result;
              }
              if ((_DWORD)result != 10)
                return result;
            }
            result = block_encode_uncompressed(a1, (uint64_t)a3, a4, a5, a6, v24);
            if ((_DWORD)result)
              return result;
            goto LABEL_27;
          }
        }
      }
    }
  }
  return result;
}

uint64_t lzma_block_uncomp_encode(uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t *a5, unint64_t a6)
{
  return block_buffer_encode(a1, 0, a2, a3, a4, a5, a6, 0);
}

uint64_t block_encode_normal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v14 = lzma_block_header_size(a1);
  if (!(_DWORD)v14)
  {
    v15 = *a6;
    v16 = *(unsigned int *)(a1 + 4);
    if (a7 - *a6 <= v16)
    {
      return 10;
    }
    else
    {
      v17 = v15 + v16;
      *a6 = v15 + v16;
      v20 = *(_QWORD *)(a1 + 16);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v22[0] = 0;
      v22[1] = -1;
      v14 = lzma_raw_encoder_init((uint64_t)v22, a2, *(uint64_t **)(a1 + 32));
      if (!(_DWORD)v14)
      {
        if (a7 - v17 <= v20)
          v18 = a7;
        else
          v18 = v20 + v17;
        v21 = 0;
        v14 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, int))&v23
               + 1))(v22[0], a2, a3, &v21, a4, a5, a6, v18, 3);
      }
      lzma_next_end((uint64_t)v22, a2);
      if ((_DWORD)v14)
      {
        if ((_DWORD)v14 == 1)
        {
          *(_QWORD *)(a1 + 16) = *a6 - (v15 + *(unsigned int *)(a1 + 4));
          if (!lzma_block_header_encode(a1, (char *)(a5 + v15)))
            return 0;
          v14 = 11;
        }
      }
      else
      {
        v14 = 10;
      }
      *a6 = v15;
    }
  }
  return v14;
}

uint64_t block_encode_uncompressed(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t result;
  int v14;
  size_t v15;
  unint64_t v16;
  char v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[7];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  memset(v21, 0, sizeof(v21));
  LODWORD(v21[0]) = 4096;
  v22[0] = 33;
  v22[1] = v21;
  v22[2] = -1;
  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v22;
  if (lzma_block_header_size(a1))
  {
    *(_QWORD *)(a1 + 32) = v12;
    return 11;
  }
  if (a6 - *a5 >= *(_QWORD *)(a1 + 16) + (unint64_t)*(unsigned int *)(a1 + 4))
  {
    v14 = lzma_block_header_encode(a1, (char *)(a4 + *a5));
    *(_QWORD *)(a1 + 32) = v12;
    if (v14)
      return 11;
    v15 = *a5 + *(unsigned int *)(a1 + 4);
    if (a3)
    {
      v16 = 0;
      v17 = 1;
      do
      {
        *a5 = v15 + 1;
        *(_BYTE *)(a4 + v15) = v17;
        if (a3 - v16 >= 0x10000)
          v18 = 0x10000;
        else
          v18 = a3 - v16;
        v19 = (*a5)++;
        *(_BYTE *)(a4 + v19) = (unsigned __int16)(v18 - 1) >> 8;
        v20 = (*a5)++;
        *(_BYTE *)(a4 + v20) = v18 - 1;
        memcpy((void *)(a4 + *a5), (const void *)(a2 + v16), v18);
        v16 += v18;
        v15 = *a5 + v18;
        *a5 = v15;
        v17 = 2;
      }
      while (v16 < a3);
    }
    result = 0;
    *a5 = v15 + 1;
    *(_BYTE *)(a4 + v15) = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = v12;
    return 10;
  }
  return result;
}

uint64_t lzma_block_encoder_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v7;
  uint64_t v8;
  _QWORD *v9;

  if (*(uint64_t (**)())(a1 + 16) != lzma_block_encoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_block_encoder_init;
  if (!a3)
    return 11;
  if (*(_DWORD *)a3 > 1u)
    return 8;
  v7 = *(_DWORD *)(a3 + 8);
  if (v7 > 0xF)
    return 11;
  if (!lzma_check_is_supported(*(_DWORD *)(a3 + 8)))
    return 3;
  v8 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
  {
LABEL_12:
    *(_DWORD *)(v8 + 88) = 0;
    *(_QWORD *)(v8 + 80) = a3;
    *(_QWORD *)(v8 + 104) = 0;
    *(_QWORD *)(v8 + 112) = 0;
    *(_QWORD *)(v8 + 96) = 0;
    lzma_check_init(v8 + 120, v7);
    return lzma_raw_encoder_init(v8, a2, *(uint64_t **)(a3 + 32));
  }
  v9 = lzma_alloc(0x120uLL, a2);
  if (v9)
  {
    v8 = (uint64_t)v9;
    *(_QWORD *)a1 = v9;
    *(_QWORD *)(a1 + 24) = block_encode;
    *(_QWORD *)(a1 + 32) = block_encoder_end;
    *(_QWORD *)(a1 + 64) = block_encoder_update;
    *v9 = 0;
    v9[1] = -1;
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    v7 = *(_DWORD *)(a3 + 8);
    goto LABEL_12;
  }
  return 5;
}

uint64_t block_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int a9)
{
  uint64_t v9;
  uint64_t v10;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v21;
  size_t v22;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v33;

  v9 = *a4;
  if ((*(_QWORD *)(a1 + 104) ^ 0x7FFFFFFFFFFFFFFFuLL) < a5 - *a4)
    return 9;
  v15 = *(_DWORD *)(a1 + 88);
  if (v15)
  {
    if (v15 == 2)
      goto LABEL_17;
    if (v15 != 1)
      return 11;
    v16 = *(_QWORD *)(a1 + 96);
LABEL_7:
    if ((v16 & 3) != 0)
    {
      v17 = *a7;
      if (*a7 <= a8)
        v18 = a8;
      else
        v18 = *a7;
      v19 = v16 + 1;
      while (v18 != v17)
      {
        *(_BYTE *)(a6 + v17++) = 0;
        *a7 = v17;
        *(_QWORD *)(a1 + 96) = v19;
        if ((v19++ & 3) == 0)
          goto LABEL_15;
      }
      return 0;
    }
LABEL_15:
    v21 = *(_DWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (!v21)
      return 1;
    lzma_check_finish(a1 + 120, v21);
    *(_DWORD *)(a1 + 88) = 2;
LABEL_17:
    v22 = lzma_check_size(*(_DWORD *)(*(_QWORD *)(a1 + 80) + 8));
    lzma_bufcpy(a1 + 120, (uint64_t *)(a1 + 112), v22, a6, a7, a8);
    if (*(_QWORD *)(a1 + 112) < v22)
      return 0;
    memcpy((void *)(*(_QWORD *)(a1 + 80) + 40), (const void *)(a1 + 120), v22);
    return 1;
  }
  v25 = *a7;
  v26 = (*(uint64_t (**)(_QWORD))(a1 + 24))(*(_QWORD *)a1);
  v27 = *a7 - v25;
  v28 = *(_QWORD *)(a1 + 96);
  if (0x7FFFFFFFFFFFFBBCLL - v28 < v27)
    return 9;
  v10 = v26;
  v29 = *a4;
  v30 = *a4 - v9;
  v31 = v28 + v27;
  v32 = *(_QWORD *)(a1 + 104) + v30;
  *(_QWORD *)(a1 + 96) = v31;
  *(_QWORD *)(a1 + 104) = v32;
  if (v29 != v9)
    lzma_check_update(a1 + 120, *(_DWORD *)(*(_QWORD *)(a1 + 80) + 8), (char *)(a3 + v9), v30);
  if (a9 != 1 && (_DWORD)v10 == 1)
  {
    v33 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(*(_QWORD *)(a1 + 80) + 16) = v33;
    *(_DWORD *)(a1 + 88) = 1;
    v16 = v33;
    goto LABEL_7;
  }
  return v10;
}

void block_encoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

uint64_t block_encoder_update(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (*(_DWORD *)(a1 + 88))
    return 11;
  else
    return lzma_next_filter_update(a1, a2, a4);
}

uint64_t lzma_block_encoder(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = lzma_block_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_WORD *)(v5 + 96) = 257;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t lzma_block_header_size(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (*(_DWORD *)a1 > 1u)
    return 8;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 == -1)
  {
    v5 = 6;
LABEL_8:
    v6 = *(_QWORD *)(a1 + 24);
    if (v6 != -1)
    {
      v7 = lzma_vli_size(v6);
      if (!v7)
        return 11;
      v5 += v7;
    }
    v8 = *(uint64_t **)(a1 + 32);
    if (v8 && *v8 != -1)
    {
      v9 = 0;
      for (i = 16; i != 80; i += 16)
      {
        v13 = 0;
        result = lzma_filter_flags_size(&v13, v8);
        if ((_DWORD)result)
          return result;
        ++v9;
        v5 += v13;
        v11 = *(_QWORD *)(a1 + 32);
        v8 = (uint64_t *)(v11 + 16 * v9);
        v12 = *(_QWORD *)(v11 + i);
        if (v12 == -1)
        {
          result = 0;
          *(_DWORD *)(a1 + 4) = (v5 + 3) & 0xFFFFFFFC;
          return result;
        }
      }
    }
    return 11;
  }
  v4 = lzma_vli_size(*(_QWORD *)(a1 + 16));
  result = 11;
  if (v3 && v4)
  {
    v5 = v4 + 6;
    goto LABEL_8;
  }
  return result;
}

uint64_t lzma_block_header_encode(uint64_t a1, char *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;

  if (lzma_block_unpadded_size(a1) && *(uint64_t *)(a1 + 24) >= -1)
  {
    v4 = (*(_DWORD *)(a1 + 4) - 4);
    *a2 = v4 >> 2;
    a2[1] = 0;
    v13 = 2;
    v5 = *(_QWORD *)(a1 + 16);
    if (v5 != -1)
    {
      result = lzma_vli_encode(v5, 0, (uint64_t)a2, &v13, v4);
      if ((_DWORD)result)
        return result;
      a2[1] |= 0x40u;
    }
    v7 = *(_QWORD *)(a1 + 24);
    if (v7 != -1)
    {
      result = lzma_vli_encode(v7, 0, (uint64_t)a2, &v13, v4);
      if ((_DWORD)result)
        return result;
      a2[1] |= 0x80u;
    }
    v8 = *(_QWORD **)(a1 + 32);
    if (v8 && *v8 != -1)
    {
      v9 = 0;
      v10 = -1;
      while (v10 != 3)
      {
        result = lzma_filter_flags_encode(&v8[v9], (uint64_t)a2, &v13, v4);
        if ((_DWORD)result)
          return result;
        v8 = *(_QWORD **)(a1 + 32);
        v11 = v8[v9 + 2];
        ++v10;
        v9 += 2;
        if (v11 == -1)
        {
          a2[1] |= v10;
          bzero(&a2[v13], v4 - v13);
          v12 = lzma_crc32(a2, v4, 0);
          result = 0;
          *(_DWORD *)&a2[v4] = v12;
          return result;
        }
      }
    }
  }
  return 11;
}

uint64_t lzma_easy_buffer_encode(int a1, unsigned int a2, uint64_t a3, char *a4, unint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8)
{
  _OWORD v16[12];

  memset(v16, 0, sizeof(v16));
  if (lzma_easy_preset(v16, a1))
    return 8;
  else
    return lzma_stream_buffer_encode((unint64_t)v16, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t lzma_easy_encoder(_QWORD *a1, int a2, int a3)
{
  _OWORD v6[12];

  memset(v6, 0, sizeof(v6));
  if (lzma_easy_preset(v6, a2))
    return 8;
  else
    return lzma_stream_encoder(a1, (uint64_t *)v6, a3);
}

uint64_t lzma_easy_encoder_memusage(int a1)
{
  _OWORD v2[12];

  memset(v2, 0, sizeof(v2));
  if (lzma_easy_preset(v2, a1))
    return 0xFFFFFFFFLL;
  else
    return lzma_raw_encoder_memusage((uint64_t *)v2);
}

uint64_t lzma_microlzma_encoder(_QWORD *a1, _DWORD *a2)
{
  uint64_t v4;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = microlzma_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
      lzma_end((uint64_t)a1);
    else
      *(_BYTE *)(a1[7] + 99) = 1;
  }
  return v4;
}

uint64_t microlzma_encoder_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _QWORD *v7;
  __n128 v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  if (*(uint64_t (**)())(a1 + 16) != microlzma_encoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = microlzma_encoder_init;
  v6 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    v7 = lzma_alloc(0x58uLL, a2);
    if (!v7)
      return 5;
    v6 = (uint64_t)v7;
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 24) = microlzma_encode;
    *(_QWORD *)(a1 + 32) = microlzma_encoder_end;
    *v7 = 0;
    v7[1] = -1;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
  }
  if ((lzma_lzma_lclppb_encode(a3, (_BYTE *)(v6 + 80)) & 1) != 0)
    return 8;
  v10[0] = 0x4000000000000001;
  v10[1] = lzma_lzma_encoder_init;
  v10[2] = a3;
  memset(&v10[3], 0, 24);
  return lzma_next_filter_init(v6, a2, v10, v8);
}

uint64_t microlzma_encode(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;

  v17 = *a7;
  v18 = *a4;
  v20 = 0;
  if (((unsigned int (*)(_QWORD, uint64_t *, uint64_t))a1[9])(*a1, &v20, a8 - v17))
    return 11;
  result = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, int))a1[3])(*a1, a2, a3, a4, a5, a6, a7, a8, a9);
  if (!(_DWORD)result)
    return 11;
  if ((_DWORD)result == 1)
  {
    *(_BYTE *)(a6 + v17) = ~*((_BYTE *)a1 + 80);
    *a4 = v20 + v18;
  }
  return result;
}

void microlzma_encoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

uint64_t lzma_raw_buffer_encode(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, unint64_t a7)
{
  BOOL v8;
  BOOL v10;
  uint64_t result;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _QWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  if (a4)
    v8 = a3 == 0;
  else
    v8 = 0;
  v10 = v8 || a5 == 0 || a6 == 0;
  if (v10 || *a6 > a7)
    return 11;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20[0] = 0;
  v20[1] = -1;
  result = lzma_raw_encoder_init((uint64_t)v20, a2, a1);
  if (!(_DWORD)result)
  {
    v17 = *a6;
    v19 = 0;
    v18 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, unint64_t *, unint64_t, int))&v21
           + 1))(v20[0], a2, a3, &v19, a4, a5, a6, a7, 3);
    lzma_next_end((uint64_t)v20, a2);
    if (v18 == 1)
    {
      return 0;
    }
    else
    {
      if (v18)
        result = v18;
      else
        result = 10;
      *a6 = v17;
    }
  }
  return result;
}

BOOL lzma_filter_encoder_is_supported(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = 0;
  do
  {
    v2 = encoders[v1];
    if (v2 == a1)
      break;
    v3 = v1 == 70;
    v1 += 7;
  }
  while (!v3);
  return v2 == a1;
}

uint64_t *encoder_find(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  while (encoders[v1] != a1)
  {
    v1 += 7;
    if (v1 == 77)
      return 0;
  }
  return &encoders[v1];
}

uint64_t lzma_filters_update(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t *v8;
  __int128 v9;
  _BYTE v11[80];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 56) + 64))
    return 11;
  if (lzma_raw_coder_memusage((uint64_t (*)(uint64_t))encoder_find, a2) == -1)
    return 8;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = a2[v5 + 2];
    v5 += 2;
    ++v4;
  }
  while (v6 != -1);
  if (v4)
  {
    v7 = &v11[v5 * 8 - 16];
    v8 = a2;
    do
    {
      v9 = *(_OWORD *)v8;
      v8 += 2;
      *v7-- = v9;
      --v4;
    }
    while (v4);
  }
  *(_QWORD *)&v11[v5 * 8] = -1;
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t *, _BYTE *))(*(_QWORD *)(a1 + 56) + 64))(**(_QWORD **)(a1 + 56), *(_QWORD *)(a1 + 48), a2, v11);
}

uint64_t lzma_raw_encoder_memusage(uint64_t *a1)
{
  return lzma_raw_coder_memusage((uint64_t (*)(uint64_t))encoder_find, a1);
}

uint64_t lzma_raw_encoder_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return lzma_raw_coder_init(a1, a2, a3, (uint64_t (*)(uint64_t))encoder_find, 1);
}

uint64_t lzma_raw_encoder(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = lzma_raw_coder_init(a1[7], a1[6], a2, (uint64_t (*)(uint64_t))encoder_find, 1);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_WORD *)(v5 + 96) = 257;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

unint64_t lzma_mt_block_size(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  v1 = *a1;
  if (*a1 != -1)
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      if (v1 != 0x4000000000000001)
      {
        v5 = -2;
        v6 = &qword_24F2A4040;
        do
        {
          v7 = *v6;
          v6 += 7;
          ++v5;
        }
        while (v7 != v1);
        if (!v5)
        {
          v8 = lzma_lzma2_block_size((unsigned int *)a1[2 * v3 + 1]);
          if (v8 > v4)
            v4 = v8;
          if (!v8)
            break;
        }
      }
      ++v3;
      v1 = a1[2 * v3];
      if (v1 == -1)
        return v4;
    }
  }
  return 0;
}

uint64_t lzma_properties_size(int *a1, uint64_t *a2)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a2;
  v3 = &dword_24F2A4030;
  v4 = 10;
  while (*((_QWORD *)v3 - 5) != v2)
  {
    v3 += 14;
    if (--v4 == -1)
    {
      if (v2 < 0)
        return 11;
      else
        return 8;
    }
  }
  if (v4 == 8 || (unint64_t)-v4 < 0xFFFFFFFFFFFFFFF8)
  {
    v5 = 0;
    *a1 = *v3;
    return v5;
  }
  return (*((uint64_t (**)(int *, uint64_t))v3 - 1))(a1, a2[1]);
}

uint64_t lzma_properties_encode(_QWORD *a1)
{
  uint64_t v1;

  v1 = 0;
  while (encoders[v1] != *a1)
  {
    v1 += 7;
    if (v1 == 77)
      return 11;
  }
  return ((uint64_t (*)(_QWORD))encoders[v1 + 6])(a1[1]);
}

uint64_t lzma_filter_flags_size(int *a1, uint64_t *a2)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;

  if ((unint64_t)*a2 >> 62)
    return 11;
  result = lzma_properties_size(a1, a2);
  if (!(_DWORD)result)
  {
    v5 = lzma_vli_size(*a2);
    v6 = *a1;
    v7 = lzma_vli_size(*a1);
    result = 0;
    *a1 = v6 + v5 + v7;
  }
  return result;
}

uint64_t lzma_filter_flags_encode(uint64_t *a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v5;
  uint64_t result;
  unsigned int v10;

  v5 = *a1;
  if (v5 >> 62)
    return 11;
  result = lzma_vli_encode(v5, 0, a2, a3, a4);
  if (!(_DWORD)result)
  {
    v10 = 0;
    result = lzma_properties_size((int *)&v10, a1);
    if (!(_DWORD)result)
    {
      result = lzma_vli_encode(v10, 0, a2, a3, a4);
      if (!(_DWORD)result)
      {
        if (a4 - *a3 < v10)
          return 11;
        result = lzma_properties_encode(a1);
        if (!(_DWORD)result)
          *a3 += v10;
      }
    }
  }
  return result;
}

uint64_t lzma_index_encoder_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t result;

  if (*(uint64_t (**)())(a1 + 16) != lzma_index_encoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_index_encoder_init;
  if (!a3)
    return 11;
  v6 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
LABEL_7:
    lzma_index_iter_init((uint64_t)(v6 + 2), a3);
    result = 0;
    *(_DWORD *)v6 = 0;
    v6[1] = a3;
    v6[40] = 0;
    *((_DWORD *)v6 + 82) = 0;
    return result;
  }
  v7 = lzma_alloc(0x150uLL, a2);
  *(_QWORD *)a1 = v7;
  if (v7)
  {
    v6 = v7;
    *(_QWORD *)(a1 + 24) = index_encode;
    *(_QWORD *)(a1 + 32) = index_encoder_end;
    goto LABEL_7;
  }
  return 5;
}

uint64_t index_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  unint64_t v8;
  uint64_t *v13;
  int v14;
  unint64_t *v15;
  unint64_t *v16;
  int v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v8 = *a7;
  if (*a7 >= a8)
    return 0;
  v13 = (uint64_t *)(a1 + 320);
  v25 = a1 + 16;
  v15 = (unint64_t *)(a1 + 192);
  v14 = *(_DWORD *)a1;
  v16 = (unint64_t *)(a1 + 184);
  v17 = *(_DWORD *)a1;
  v18 = *a7;
  while (2)
  {
    switch(v17)
    {
      case 0:
        *(_BYTE *)(a6 + v18) = 0;
        *a7 = v18 + 1;
        v14 = 1;
        *(_DWORD *)a1 = 1;
        v17 = 1;
        goto LABEL_18;
      case 1:
        v20 = lzma_index_block_count(*(_QWORD *)(a1 + 8));
        v21 = lzma_vli_encode(v20, v13, a6, a7, a8);
        if ((_DWORD)v21 != 1)
          goto LABEL_20;
        *(_QWORD *)(a1 + 320) = 0;
        v14 = 4;
        *(_DWORD *)a1 = 4;
        v17 = 4;
        goto LABEL_18;
      case 2:
      case 3:
        v19 = v16;
        if (v14 != 2)
          goto LABEL_16;
        goto LABEL_15;
      case 4:
        if (lzma_index_iter_next(v25, 2u))
        {
          *(_QWORD *)(a1 + 320) = lzma_index_padding_size(*(_QWORD *)(a1 + 8));
          v14 = 5;
          *(_DWORD *)a1 = 5;
          goto LABEL_13;
        }
        *(_DWORD *)a1 = 2;
LABEL_15:
        v19 = v15;
LABEL_16:
        v21 = lzma_vli_encode(*v19, v13, a6, a7, a8);
        if ((_DWORD)v21 != 1)
        {
LABEL_20:
          v22 = v21;
          goto LABEL_21;
        }
        *(_QWORD *)(a1 + 320) = 0;
        v14 = *(_DWORD *)a1 + 1;
        *(_DWORD *)a1 = v14;
        v17 = v14;
        goto LABEL_18;
      case 5:
        if (!*v13)
        {
          *(_DWORD *)(a1 + 328) = lzma_crc32((char *)(a6 + v8), v18 - v8, *(_DWORD *)(a1 + 328));
          *(_DWORD *)a1 = 6;
LABEL_25:
          while (a8 != v18)
          {
            v23 = *(_QWORD *)(a1 + 320);
            *(_BYTE *)(a6 + v18++) = *(_DWORD *)(a1 + 328) >> (8 * v23);
            *a7 = v18;
            *(_QWORD *)(a1 + 320) = v23 + 1;
            if ((unint64_t)(v23 + 1) >= 4)
              return 1;
          }
          return 0;
        }
        --*v13;
        *a7 = v18 + 1;
        *(_BYTE *)(a6 + v18) = 0;
LABEL_13:
        v17 = 5;
LABEL_18:
        v18 = *a7;
        if (*a7 < a8)
          continue;
        v22 = 0;
LABEL_21:
        if (*a7 != v8)
          *(_DWORD *)(a1 + 328) = lzma_crc32((char *)(a6 + v8), *a7 - v8, *(_DWORD *)(a1 + 328));
        return v22;
      case 6:
        goto LABEL_25;
      default:
        return 11;
    }
  }
}

uint64_t lzma_index_encoder(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = lzma_index_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t lzma_index_buffer_encode(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD v16[2];
  _OWORD v17[19];
  __int128 v18;

  result = 11;
  if (a1 && a2 && a3 && a4 >= *a3)
  {
    v9 = a4 - *a3;
    if (v9 >= lzma_index_size(a1))
    {
      v18 = 0u;
      memset(v17, 0, sizeof(v17));
      v16[0] = 0;
      lzma_index_iter_init((uint64_t)v17, a1);
      v16[1] = a1;
      *(_QWORD *)&v18 = 0;
      DWORD2(v18) = 0;
      v10 = *a3;
      v15 = index_encode((uint64_t)v16, v11, v12, v13, v14, a2, a3, a4);
      result = 0;
      if (v15 != 1)
      {
        *a3 = v10;
        return 11;
      }
    }
    else
    {
      return 10;
    }
  }
  return result;
}

int64_t lzma_stream_buffer_bound(unint64_t a1)
{
  int64_t v1;

  v1 = lzma_block_buffer_bound(a1);
  if (v1 > 0x7FFFFFFFFFFFFFCFLL || v1 == 0)
    return 0;
  else
    return v1 + 48;
}

uint64_t lzma_stream_buffer_encode(unint64_t a1, unsigned int a2, uint64_t a3, char *a4, unint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8)
{
  uint64_t v8;
  BOOL v12;
  uint64_t v16;
  unint64_t v17;
  unint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = 11;
  if (a1 && a2 <= 0xF)
  {
    v12 = a5 && a4 == 0;
    if (!v12 && a6 && a7)
    {
      v16 = *a7;
      v17 = a8 - *a7;
      if (a8 < *a7)
        return 11;
      if (!lzma_check_is_supported(a2))
        return 3;
      if (v17 < 0x19)
        return 10;
      v29 = 0;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      LODWORD(v27) = a2;
      if (lzma_stream_header_encode(&v26, a6 + v16))
        return 11;
      v30 = v16 + 12;
      v21 = a8 - 12;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v31 = 0u;
      DWORD2(v31) = a2;
      v33 = a1;
      if (a5)
      {
        v8 = lzma_block_buffer_encode((uint64_t)&v31, a3, a4, a5, a6, &v30, v21);
        if ((_DWORD)v8)
          return v8;
        v22 = (uint64_t *)lzma_index_init(a3);
        if (v22)
        {
          v23 = v22;
          v24 = lzma_block_unpadded_size((uint64_t)&v31);
          v25 = lzma_index_append(v23, a3, v24, *((unint64_t *)&v32 + 1));
          if ((_DWORD)v25)
          {
            v8 = v25;
            lzma_index_end(v23, a3);
            return v8;
          }
          goto LABEL_23;
        }
      }
      else
      {
        v23 = (uint64_t *)lzma_index_init(a3);
        if (v23)
        {
LABEL_23:
          v8 = lzma_index_buffer_encode((uint64_t)v23, a6, (unint64_t *)&v30, v21);
          *((_QWORD *)&v26 + 1) = lzma_index_size((uint64_t)v23);
          lzma_index_end(v23, a3);
          if ((_DWORD)v8)
            return v8;
          if (!lzma_stream_footer_encode((uint64_t)&v26, a6 + v30))
          {
            v8 = 0;
            *a7 = v30 + 12;
            return v8;
          }
          return 11;
        }
      }
      return 5;
    }
  }
  return v8;
}

uint64_t lzma_stream_encoder(_QWORD *a1, uint64_t *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    v6 = stream_encoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v7 = a1[7];
      *(_BYTE *)(v7 + 100) = 1;
      *(_DWORD *)(v7 + 96) = 16843009;
    }
  }
  return v6;
}

uint64_t stream_encoder_init(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t result;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  if (*(uint64_t (**)())(a1 + 16) != stream_encoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = stream_encoder_init;
  if (!a3)
    return 11;
  v8 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
  {
    v9 = *(uint64_t **)(v8 + 456);
  }
  else
  {
    v11 = lzma_alloc(0x5E0uLL, a2);
    if (!v11)
      return 5;
    v8 = (uint64_t)v11;
    v9 = 0;
    *(_QWORD *)(a1 + 24) = stream_encode;
    *(_QWORD *)(a1 + 32) = stream_encoder_end;
    *(_QWORD *)(a1 + 64) = stream_encoder_update;
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(v8 + 296) = -1;
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = -1;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *(_OWORD *)(v8 + 72) = 0u;
    *(_QWORD *)(v8 + 376) = 0;
    *(_QWORD *)(v8 + 384) = -1;
    *(_QWORD *)(v8 + 456) = 0;
    *(_OWORD *)(v8 + 392) = 0u;
    *(_OWORD *)(v8 + 408) = 0u;
    *(_OWORD *)(v8 + 424) = 0u;
    *(_OWORD *)(v8 + 440) = 0u;
  }
  *(_DWORD *)v8 = 0;
  *(_DWORD *)(v8 + 88) = 0;
  *(_DWORD *)(v8 + 96) = a4;
  lzma_index_end(v9, a2);
  v12 = lzma_index_init(a2);
  *(_QWORD *)(v8 + 456) = v12;
  if (!v12)
    return 5;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  LODWORD(v14) = a4;
  result = lzma_stream_header_encode(&v13, v8 + 480);
  if (!(_DWORD)result)
  {
    *(_OWORD *)(v8 + 464) = xmmword_229953440;
    return stream_encoder_update(v8, a2, a3, 0);
  }
  return result;
}

uint64_t stream_encode(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int a9)
{
  char *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  if (*a7 >= a8)
    return 0;
  v21 = a1 + 376;
  v14 = (char *)(a1 + 480);
  v16 = a1 + 88;
  v15 = *(_DWORD *)a1;
  v17 = (uint64_t *)(a1 + 464);
  while (2)
  {
    switch(v15)
    {
      case 0:
      case 2:
      case 5:
        lzma_bufcpy((uint64_t)v14, v17, *(_QWORD *)(a1 + 472), a6, a7, a8);
        if (*(_QWORD *)(a1 + 464) < *(_QWORD *)(a1 + 472))
          return 0;
        v18 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 != 5)
        {
          *(_QWORD *)(a1 + 464) = 0;
          v15 = v18 + 1;
          goto LABEL_22;
        }
        result = 1;
        break;
      case 1:
        if (*a4 == a5)
        {
          if (a9 == 3)
          {
            result = lzma_index_encoder_init(v21, a2, *(_QWORD *)(a1 + 456));
            if (!(_DWORD)result)
            {
              v15 = 4;
              goto LABEL_22;
            }
          }
          else
          {
            result = a9 != 0;
          }
        }
        else if (*(_BYTE *)(a1 + 4) || (result = block_encoder_init(a1, a2), !(_DWORD)result))
        {
          *(_BYTE *)(a1 + 4) = 0;
          if (lzma_block_header_encode(v16, v14))
            goto LABEL_26;
          *(_QWORD *)(a1 + 472) = *(unsigned int *)(a1 + 92);
          v15 = 2;
          goto LABEL_22;
        }
        break;
      case 3:
        result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t *, unint64_t, _DWORD))(a1 + 32))(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8, stream_encode_convert[a9]);
        if (a9 != 1 && (_DWORD)result == 1)
        {
          v20 = lzma_block_unpadded_size(v16);
          result = lzma_index_append(*(_QWORD **)(a1 + 456), a2, v20, *(_QWORD *)(a1 + 112));
          if (!(_DWORD)result)
          {
            v15 = 1;
            goto LABEL_22;
          }
        }
        break;
      case 4:
        result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t *, unint64_t, _DWORD))(a1 + 400))(*(_QWORD *)(a1 + 376), a2, 0, 0, 0, a6, a7, a8, 0);
        if ((_DWORD)result == 1)
        {
          v28 = 0;
          v26 = 0u;
          v27 = 0u;
          v25 = 0u;
          *((_QWORD *)&v25 + 1) = lzma_index_size(*(_QWORD *)(a1 + 456));
          LODWORD(v26) = *(_DWORD *)(a1 + 96);
          if (lzma_stream_footer_encode((uint64_t)&v25, (uint64_t)v14))
            goto LABEL_26;
          *(_QWORD *)(a1 + 472) = 12;
          v15 = 5;
LABEL_22:
          *(_DWORD *)a1 = v15;
          if (*a7 < a8)
            continue;
          return 0;
        }
        break;
      default:
LABEL_26:
        result = 11;
        break;
    }
    return result;
  }
}

void stream_encoder_end(uint64_t a1, uint64_t a2)
{
  lzma_next_end(a1 + 8, a2);
  lzma_next_end(a1 + 376, a2);
  lzma_index_end(*(uint64_t **)(a1 + 456), a2);
  lzma_filters_free((_QWORD *)(a1 + 296), a2);
  lzma_free((void *)a1, a2);
}

uint64_t stream_encoder_update(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD __dst[5];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = lzma_filters_copy(a3, __dst, a2);
  if (!(_DWORD)v8)
  {
    if (*(_DWORD *)a1 > 1u)
    {
      if (*(_DWORD *)a1 > 3u)
      {
        v8 = 11;
      }
      else
      {
        v8 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t *, uint64_t))(a1 + 72))(*(_QWORD *)(a1 + 8), a2, a3, a4);
        if (!(_DWORD)v8)
          goto LABEL_7;
      }
    }
    else
    {
      *(_BYTE *)(a1 + 4) = 0;
      *(_QWORD *)(a1 + 120) = __dst;
      v8 = block_encoder_init(a1, a2);
      *(_QWORD *)(a1 + 120) = a1 + 296;
      if (!(_DWORD)v8)
      {
        *(_BYTE *)(a1 + 4) = 1;
LABEL_7:
        v9 = a1 + 296;
        lzma_filters_free((_QWORD *)v9, a2);
        v8 = 0;
        v10 = __dst[3];
        *(_OWORD *)(v9 + 32) = __dst[2];
        *(_OWORD *)(v9 + 48) = v10;
        *(_OWORD *)(v9 + 64) = __dst[4];
        v11 = __dst[1];
        *(_OWORD *)v9 = __dst[0];
        *(_OWORD *)(v9 + 16) = v11;
        return v8;
      }
    }
    lzma_filters_free(__dst, a2);
  }
  return v8;
}

uint64_t block_encoder_init(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = a1 + 88;
  *(_QWORD *)(a1 + 104) = -1;
  *(_QWORD *)(a1 + 112) = -1;
  result = lzma_block_header_size(a1 + 88);
  if (!(_DWORD)result)
    return lzma_block_encoder_init(a1 + 8, a2, v4);
  return result;
}

uint64_t lzma_stream_header_encode(_DWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  if (*a1)
    return 8;
  *(_DWORD *)a2 = 1484404733;
  *(_WORD *)(a2 + 4) = 90;
  if (a1[4] > 0xFu)
    return 11;
  *(_BYTE *)(a2 + 6) = 0;
  v3 = a2 + 6;
  *(_BYTE *)(a2 + 7) = a1[4];
  v4 = lzma_crc32((char *)(a2 + 6), 2uLL, 0);
  result = 0;
  *(_DWORD *)(v3 + 2) = v4;
  return result;
}

uint64_t lzma_stream_footer_encode(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v3;
  int v6;

  if (*(_DWORD *)a1)
    return 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 - 4 > 0x3FFFFFFFCLL || (*(_QWORD *)(a1 + 8) & 3) != 0)
    return 11;
  *(_DWORD *)(a2 + 4) = (v3 >> 2) - 1;
  if (*(_DWORD *)(a1 + 16) > 0xFu)
    return 11;
  *(_BYTE *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 9) = *(_DWORD *)(a1 + 16);
  v6 = lzma_crc32((char *)(a2 + 4), 6uLL, 0);
  result = 0;
  *(_DWORD *)a2 = v6;
  *(_WORD *)(a2 + 10) = lzma_footer_magic;
  return result;
}

uint64_t lzma_vli_encode(unint64_t a1, uint64_t *a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v6;
  uint64_t *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  v6 = *a4;
  v7 = &v12;
  if (a2)
  {
    v7 = a2;
    result = 10;
  }
  else
  {
    result = 11;
  }
  if (v6 < a5)
  {
    result = 11;
    if ((a1 & 0x8000000000000000) == 0)
    {
      v9 = *v7;
      if ((unint64_t)*v7 <= 8)
      {
        v10 = a1 >> (7 * v9);
        v11 = v9 + 1;
        do
        {
          if (v10 < 0x80)
          {
            *(_BYTE *)(a3 + v6) = v10;
            *a4 = v6 + 1;
            *v7 = v11;
            return v7 != &v12;
          }
          *(_BYTE *)(a3 + v6) = v10 | 0x80;
          *v7 = v11;
          v10 >>= 7;
          *a4 = ++v6;
          ++v11;
        }
        while (a5 != v6);
        if (v7 == &v12)
          return 11;
        else
          return 0;
      }
    }
  }
  return result;
}

uint64_t alone_decoder_memconfig(uint64_t a1, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  uint64_t result;

  *a2 = *(_QWORD *)(a1 + 112);
  *a3 = *(_QWORD *)(a1 + 104);
  if (!a4)
    return 0;
  if (*(_QWORD *)(a1 + 112) > a4)
    return 6;
  result = 0;
  *(_QWORD *)(a1 + 104) = a4;
  return result;
}

uint64_t lzma_alone_decoder(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = lzma_alone_decoder_init(a1[7], a1[6], a2, 0);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t auto_decoder_get_check(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[6];
  if (v1)
    return v1(*a1);
  else
    return 0;
}

uint64_t auto_decoder_memconfig(_QWORD *a1, unint64_t *a2, _QWORD *a3, unint64_t a4)
{
  uint64_t (*v6)(_QWORD, unint64_t *, _QWORD *, unint64_t);
  uint64_t result;

  v6 = (uint64_t (*)(_QWORD, unint64_t *, _QWORD *, unint64_t))a1[7];
  if (v6)
  {
    result = v6(*a1, a2, a3, a4);
    if (!a4)
      return result;
  }
  else
  {
    *a2 = 0x8000;
    *a3 = a1[10];
    if (!a4)
      return 0;
    if (*a2 <= a4)
      result = 0;
    else
      result = 6;
  }
  if (!(_DWORD)result)
    a1[10] = a4;
  return result;
}

uint64_t lzma_block_buffer_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  BOOL v18;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  if (!a4)
    return 11;
  v15 = *a4;
  if (!a3 && v15 != a5)
    return 11;
  v16 = 11;
  if (a7 && v15 <= a5)
  {
    v18 = *a7 != a8 && a6 == 0;
    if (!v18 && *a7 <= a8)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23[0] = 0;
      v23[1] = -1;
      v16 = lzma_block_decoder_init((uint64_t)v23, a2, a1);
      if (!(_DWORD)v16)
      {
        v20 = *a4;
        v21 = *a7;
        v22 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))&v24
               + 1))(v23[0], a2, a3, a4, a5, a6, a7, a8, 3);
        if ((_DWORD)v22 == 1)
        {
          v16 = 0;
        }
        else
        {
          v16 = v22;
          if (!(_DWORD)v22)
          {
            if (*a4 == a5)
              v16 = 9;
            else
              v16 = 10;
          }
          *a4 = v20;
          *a7 = v21;
        }
      }
      lzma_next_end((uint64_t)v23, a2);
    }
  }
  return v16;
}

uint64_t lzma_block_decoder_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  char *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (*(uint64_t (**)())(a1 + 16) != lzma_block_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_block_decoder_init;
  if (!lzma_block_unpadded_size(a3) || *(uint64_t *)(a3 + 24) < -1)
    return 11;
  v6 = *(char **)a1;
  if (!*(_QWORD *)a1)
  {
    v7 = (char *)lzma_alloc(0x138uLL, a2);
    if (!v7)
      return 5;
    v6 = v7;
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 24) = block_decode;
    *(_QWORD *)(a1 + 32) = block_decoder_end;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = -1;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *(_OWORD *)(v7 + 72) = 0u;
  }
  *(_DWORD *)v6 = 0;
  *((_QWORD *)v6 + 12) = 0;
  *((_QWORD *)v6 + 13) = 0;
  *((_QWORD *)v6 + 11) = a3;
  v8 = *(_QWORD *)(a3 + 16);
  if (v8 == -1)
  {
    v11 = *(unsigned int *)(a3 + 4);
    v9 = *(_DWORD *)(a3 + 8);
    v8 = 0x7FFFFFFFFFFFFFFCLL - (v11 + lzma_check_size(v9));
  }
  else
  {
    v9 = *(_DWORD *)(a3 + 8);
  }
  v12 = *(_QWORD *)(a3 + 24);
  if (v12 == -1)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  *((_QWORD *)v6 + 14) = v8;
  *((_QWORD *)v6 + 15) = v12;
  *((_QWORD *)v6 + 16) = 0;
  lzma_check_init((uint64_t)(v6 + 136), v9);
  v13 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
    LOBYTE(v13) = *(_BYTE *)(a3 + 200) != 0;
  v6[304] = v13;
  return lzma_raw_decoder_init((uint64_t)(v6 + 8), a2, *(uint64_t **)(a3 + 32));
}

uint64_t block_decode(int *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  char v31;
  BOOL v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  size_t v40;
  uint64_t v41;

  v12 = *a1;
  if (!*a1)
  {
    v18 = *a4;
    v19 = *a7;
    v20 = *((_QWORD *)a1 + 14) - *((_QWORD *)a1 + 12);
    if (a5 - *a4 < v20)
      v20 = a5 - *a4;
    v21 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t))a1 + 4))(*((_QWORD *)a1 + 1), a2, a3, a4, v20 + v18);
    v22 = *a4;
    v23 = *a7;
    v24 = *a7 - v19;
    v25 = *((_QWORD *)a1 + 12) + *a4 - v18;
    v26 = *((_QWORD *)a1 + 13) + v24;
    *((_QWORD *)a1 + 12) = v25;
    *((_QWORD *)a1 + 13) = v26;
    if (!(_DWORD)v21)
    {
      v27 = *((_QWORD *)a1 + 11);
      v28 = *(_QWORD *)(v27 + 16);
      v29 = v26 == *(_QWORD *)(v27 + 24);
      v30 = v23 < a8 || v29;
      v31 = v25 == v28 ? v30 : 0;
      v32 = v22 < a5 && v29;
      result = 9;
      if ((v31 & 1) != 0 || v32)
        return result;
    }
    if (!*((_BYTE *)a1 + 304) && v23 != v19)
      lzma_check_update((uint64_t)(a1 + 34), *(_DWORD *)(*((_QWORD *)a1 + 11) + 8), (char *)(a6 + v19), v24);
    result = v21;
    if ((_DWORD)v21 != 1)
      return result;
    v34 = *((_QWORD *)a1 + 11);
    v13 = *((_QWORD *)a1 + 12);
    v35 = *(_QWORD *)(v34 + 16);
    if (v35 != -1 && v35 != v13)
      return 9;
    v36 = *((_QWORD *)a1 + 13);
    v37 = *(_QWORD *)(v34 + 24);
    if (v37 != -1 && v37 != v36)
      return 9;
    *(_QWORD *)(v34 + 16) = v13;
    *(_QWORD *)(v34 + 24) = v36;
    *a1 = 1;
LABEL_5:
    while ((v13 & 3) != 0)
    {
      v14 = *a4;
      if (*a4 >= a5)
        return 0;
      *((_QWORD *)a1 + 12) = ++v13;
      *a4 = v14 + 1;
      if (*(_BYTE *)(a3 + v14))
        return 9;
    }
    v38 = *(_DWORD *)(*((_QWORD *)a1 + 11) + 8);
    if (!v38)
      return 1;
    if (!*((_BYTE *)a1 + 304))
      lzma_check_finish((uint64_t)(a1 + 34), v38);
    *a1 = 2;
LABEL_37:
    v39 = *((_QWORD *)a1 + 11);
    v40 = lzma_check_size(*(_DWORD *)(v39 + 8));
    lzma_bufcpy(a3, a4, a5, v39 + 40, (uint64_t *)a1 + 16, v40);
    if (*((_QWORD *)a1 + 16) < v40)
      return 0;
    if (!*((_BYTE *)a1 + 304))
    {
      v41 = *((_QWORD *)a1 + 11);
      if (lzma_check_is_supported(*(_DWORD *)(v41 + 8)))
      {
        if (memcmp((const void *)(v41 + 40), a1 + 34, v40))
          return 9;
      }
    }
    return 1;
  }
  if (v12 == 2)
    goto LABEL_37;
  if (v12 == 1)
  {
    v13 = *((_QWORD *)a1 + 12);
    goto LABEL_5;
  }
  return 11;
}

void block_decoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1 + 8, a2);
  lzma_free(a1, a2);
}

uint64_t lzma_block_decoder(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = lzma_block_decoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t lzma_block_header_decode(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t i;
  _QWORD *v9;
  unint64_t v10;
  char v12;
  unint64_t *v13;
  unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;

  if (!a1)
    return 11;
  v4 = 11;
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      for (i = 0; i != 80; i += 16)
      {
        v9 = (_QWORD *)(v6 + i);
        *v9 = -1;
        v9[1] = 0;
      }
      if (*(_DWORD *)a1 > 1u)
        *(_DWORD *)a1 = 1;
      *(_BYTE *)(a1 + 200) = 0;
      v10 = 4 * *a3;
      if ((_DWORD)v10 + 4 != *(_DWORD *)(a1 + 4) || *(_DWORD *)(a1 + 8) > 0xFu)
        return 11;
      if (lzma_crc32(a3, 4 * *a3, 0) == *(_DWORD *)&a3[v10])
      {
        v12 = a3[1];
        if ((v12 & 0x3C) != 0)
          return 8;
        v21 = 2;
        v13 = (unint64_t *)(a1 + 16);
        if ((v12 & 0x40) == 0)
        {
          *v13 = -1;
LABEL_19:
          v14 = (unint64_t *)(a1 + 24);
          if (a3[1] < 0)
          {
            v4 = lzma_vli_decode(v14, 0, (uint64_t)a3, &v21, v10);
            if ((_DWORD)v4)
              return v4;
          }
          else
          {
            *v14 = -1;
          }
          v15 = 0;
          v16 = 16 * (a3[1] & 3) + 16;
          while (1)
          {
            v17 = lzma_filter_flags_decode((unint64_t *)(*(_QWORD *)(a1 + 32) + v15), a2, (uint64_t)a3, &v21, v10);
            if ((_DWORD)v17)
              break;
            v15 += 16;
            if (v16 == v15)
            {
              v18 = v21;
              if (v21 <= v10)
                v19 = v10;
              else
                v19 = v21;
              while (v19 != v18)
              {
                v20 = a3[v18++];
                v21 = v18;
                if (v20)
                {
                  v4 = 8;
                  goto LABEL_34;
                }
              }
              return 0;
            }
          }
          v4 = v17;
LABEL_34:
          lzma_filters_free(*(_QWORD **)(a1 + 32), a2);
          return v4;
        }
        v4 = lzma_vli_decode(v13, 0, (uint64_t)a3, &v21, v10);
        if ((_DWORD)v4)
          return v4;
        if (lzma_block_unpadded_size(a1))
          goto LABEL_19;
      }
      return 9;
    }
  }
  return v4;
}

uint64_t lzma_easy_decoder_memusage(int a1)
{
  _OWORD v2[12];

  memset(v2, 0, sizeof(v2));
  if (lzma_easy_preset(v2, a1))
    return 0xFFFFFFFFLL;
  else
    return lzma_raw_decoder_memusage((uint64_t *)v2);
}

uint64_t lzma_raw_buffer_decode(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  uint64_t v9;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  _QWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v9 = 11;
  if (a3)
  {
    if (a4)
    {
      if (a7)
      {
        if (a6)
        {
          if (*a4 <= a5 && *a7 <= a8)
          {
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            v22[0] = 0;
            v22[1] = -1;
            v9 = lzma_raw_decoder_init((uint64_t)v22, a2, a1);
            if (!(_DWORD)v9)
            {
              v16 = *a4;
              v17 = *a7;
              v18 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))&v23
                     + 1))(v22[0], a2, a3, a4, a5, a6, a7, a8, 3);
              if ((_DWORD)v18 == 1)
              {
                v9 = 0;
              }
              else
              {
                v9 = v18;
                if (!(_DWORD)v18)
                {
                  if (*a4 == a5)
                  {
                    v9 = 9;
                    if (*a7 == a8)
                    {
                      v20 = 0;
                      (*((void (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, char *, uint64_t *, uint64_t, int))&v23
                       + 1))(v22[0], a2, a3, a4, a5, &v21, &v20, 1, 3);
                      if (v20 == 1)
                        v9 = 10;
                      else
                        v9 = 9;
                    }
                  }
                  else
                  {
                    v9 = 10;
                  }
                }
                *a4 = v16;
                *a7 = v17;
              }
              lzma_next_end((uint64_t)v22, a2);
            }
          }
        }
      }
    }
  }
  return v9;
}

BOOL lzma_filter_decoder_is_supported(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = 0;
  do
  {
    v2 = decoders[v1];
    if (v2 == a1)
      break;
    v3 = v1 == 40;
    v1 += 4;
  }
  while (!v3);
  return v2 == a1;
}

uint64_t *decoder_find(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  while (decoders[v1] != a1)
  {
    v1 += 4;
    if (v1 == 44)
      return 0;
  }
  return &decoders[v1];
}

uint64_t lzma_raw_decoder_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return lzma_raw_coder_init(a1, a2, a3, (uint64_t (*)(uint64_t))decoder_find, 0);
}

uint64_t lzma_raw_decoder(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = lzma_raw_coder_init(a1[7], a1[6], a2, (uint64_t (*)(uint64_t))decoder_find, 0);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t lzma_raw_decoder_memusage(uint64_t *a1)
{
  return lzma_raw_coder_memusage((uint64_t (*)(uint64_t))decoder_find, a1);
}

uint64_t lzma_properties_decode(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = 0;
  v2 = *a1;
  a1[1] = 0;
  v3 = a1 + 1;
  while (decoders[v1] != v2)
  {
    v1 += 4;
    if (v1 == 44)
      return 8;
  }
  return ((uint64_t (*)(_QWORD *))decoders[v1 + 3])(v3);
}

uint64_t lzma_filter_flags_decode(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  uint64_t result;
  unint64_t v10;

  a1[1] = 0;
  result = lzma_vli_decode(a1, 0, a3, a4, a5);
  if (!(_DWORD)result)
  {
    if (*a1 >> 62)
      return 9;
    v10 = 0;
    result = lzma_vli_decode(&v10, 0, a3, a4, a5);
    if (!(_DWORD)result)
    {
      if (a5 - *a4 < v10)
        return 9;
      result = lzma_properties_decode((uint64_t *)a1);
      *a4 += v10;
    }
  }
  return result;
}

uint64_t lzma_index_decoder_init(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4)
{
  _QWORD *v8;
  uint64_t result;
  _QWORD *v10;
  void *v11;
  uint64_t v12;

  if (*(uint64_t (**)())(a1 + 16) != lzma_index_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_index_decoder_init;
  if (!a3)
    return 11;
  v8 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
    lzma_index_end((uint64_t *)v8[2], a2);
  }
  else
  {
    v10 = lzma_alloc(0x48uLL, a2);
    if (!v10)
      return 5;
    v8 = v10;
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 24) = index_decode;
    *(_QWORD *)(a1 + 32) = index_decoder_end;
    *(_QWORD *)(a1 + 56) = index_decoder_memconfig;
    v10[2] = 0;
  }
  v8[3] = a3;
  *a3 = 0;
  v11 = lzma_index_init(a2);
  v8[2] = v11;
  if (!v11)
    return 5;
  result = 0;
  *(_DWORD *)v8 = 0;
  if (a4 <= 1)
    v12 = 1;
  else
    v12 = a4;
  v8[1] = v12;
  v8[4] = 0;
  v8[7] = 0;
  *((_DWORD *)v8 + 16) = 0;
  return result;
}

uint64_t index_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v5;
  char *v10;
  unint64_t *v11;
  int v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  unint64_t *v28;

  v5 = *a4;
  if (*a4 >= a5)
    return 0;
  v10 = (char *)(a1 + 56);
  v11 = (unint64_t *)(a1 + 40);
  v28 = (unint64_t *)(a1 + 48);
  v13 = (unint64_t *)(a1 + 32);
  v12 = *(_DWORD *)a1;
  v14 = *a4;
  while (2)
  {
    switch(v12)
    {
      case 0:
        *a4 = v14 + 1;
        if (*(_BYTE *)(a3 + v14))
          return 9;
        v12 = 1;
        goto LABEL_27;
      case 1:
        v16 = lzma_vli_decode(v13, v10, a3, a4, a5);
        if ((_DWORD)v16 != 1)
          goto LABEL_30;
        *(_QWORD *)(a1 + 56) = 0;
        *(_DWORD *)a1 = 2;
LABEL_15:
        if ((unint64_t)lzma_index_memusage(1, *(_QWORD *)(a1 + 32)) > *(_QWORD *)(a1 + 8))
        {
          v22 = 6;
          goto LABEL_32;
        }
        lzma_index_prealloc(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32));
        v17 = *(_QWORD *)(a1 + 32) == 0;
        goto LABEL_24;
      case 2:
        goto LABEL_15;
      case 3:
      case 4:
        if (v12 == 3)
          v15 = v11;
        else
          v15 = v28;
        v16 = lzma_vli_decode(v15, v10, a3, a4, a5);
        if ((_DWORD)v16 != 1)
        {
LABEL_30:
          v22 = v16;
          goto LABEL_32;
        }
        *(_QWORD *)(a1 + 56) = 0;
        if (*(_DWORD *)a1 == 3)
        {
          if (*v11 - 0x7FFFFFFFFFFFFFFDLL < 0x8000000000000008)
            return 9;
          v12 = 4;
        }
        else
        {
          v21 = lzma_index_append(*(_QWORD **)(a1 + 16), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          if ((_DWORD)v21)
            return v21;
          v17 = (*v13)-- == 1;
LABEL_24:
          if (v17)
            v12 = 5;
          else
            v12 = 3;
        }
LABEL_27:
        *(_DWORD *)a1 = v12;
        goto LABEL_28;
      case 5:
        v18 = lzma_index_padding_size(*(_QWORD *)(a1 + 16));
        v19 = v18;
        *(_QWORD *)(a1 + 56) = v18;
        *(_DWORD *)a1 = 6;
        if (!v18)
          goto LABEL_34;
        goto LABEL_20;
      case 6:
        v19 = *(_QWORD *)v10;
        if (!*(_QWORD *)v10)
        {
LABEL_34:
          v14 = *a4;
          *(_DWORD *)(a1 + 64) = lzma_crc32((char *)(a3 + v5), *a4 - v5, *(_DWORD *)(a1 + 64));
          *(_DWORD *)a1 = 7;
LABEL_35:
          while (a5 != v14)
          {
            v23 = *(_QWORD *)(a1 + 56);
            v24 = *(_DWORD *)(a1 + 64) >> (8 * v23);
            *a4 = v14 + 1;
            if (*(unsigned __int8 *)(a3 + v14) != v24)
              return 9;
            v25 = v23 + 1;
            *(_QWORD *)v10 = v25;
            ++v14;
            if (v25 >= 4)
            {
              **(_QWORD **)(a1 + 24) = *(_QWORD *)(a1 + 16);
              *(_QWORD *)(a1 + 16) = 0;
              return 1;
            }
          }
          return 0;
        }
LABEL_20:
        *(_QWORD *)v10 = v19 - 1;
        v20 = (*a4)++;
        if (*(_BYTE *)(a3 + v20))
          return 9;
        v12 = 6;
LABEL_28:
        v14 = *a4;
        if (*a4 < a5)
          continue;
        v22 = 0;
LABEL_32:
        if (*a4 != v5)
          *(_DWORD *)(a1 + 64) = lzma_crc32((char *)(a3 + v5), *a4 - v5, *(_DWORD *)(a1 + 64));
        return v22;
      case 7:
        goto LABEL_35;
      default:
        return 11;
    }
  }
}

void index_decoder_end(uint64_t **a1, uint64_t a2)
{
  lzma_index_end(a1[2], a2);
  lzma_free(a1, a2);
}

uint64_t index_decoder_memconfig(uint64_t a1, uint64_t *a2, _QWORD *a3, unint64_t a4)
{
  uint64_t result;

  *a2 = lzma_index_memusage(1, *(_QWORD *)(a1 + 32));
  *a3 = *(_QWORD *)(a1 + 8);
  if (!a4)
    return 0;
  if (*a2 > a4)
    return 6;
  result = 0;
  *(_QWORD *)(a1 + 8) = a4;
  return result;
}

uint64_t lzma_index_decoder(_QWORD *a1, _QWORD *a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    v6 = lzma_index_decoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v7 = a1[7];
      *(_BYTE *)(v7 + 96) = 1;
      *(_BYTE *)(v7 + 99) = 1;
    }
  }
  return v6;
}

uint64_t lzma_index_buffer_decode(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6)
{
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  void *v18[2];
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  result = 11;
  if (a1 && a2 && a4 && a5)
  {
    if (*a5 <= a6)
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      *(_OWORD *)v18 = 0u;
      v13 = *a2;
      v18[1] = a1;
      *a1 = 0;
      v18[0] = lzma_index_init(a3);
      if (v18[0])
      {
        LODWORD(v17) = 0;
        if (v13 <= 1)
          v14 = 1;
        else
          v14 = v13;
        *((_QWORD *)&v17 + 1) = v14;
        *(_QWORD *)&v19 = 0;
        *((_QWORD *)&v20 + 1) = 0;
        LODWORD(v21) = 0;
        v15 = *a5;
        v16 = index_decode((uint64_t)&v17, a3, a4, a5, a6);
        result = 0;
        if ((_DWORD)v16 != 1)
        {
          lzma_index_end((uint64_t *)v18[0], a3);
          *a5 = v15;
          if ((_DWORD)v16)
          {
            if ((_DWORD)v16 == 6)
            {
              *a2 = lzma_index_memusage(1, v19);
              return 6;
            }
            else
            {
              return v16;
            }
          }
          else
          {
            return 9;
          }
        }
      }
      else
      {
        return 5;
      }
    }
    else
    {
      return 11;
    }
  }
  return result;
}

_OWORD *lzma_index_hash_init(_OWORD *a1, uint64_t a2)
{
  _OWORD *v2;

  v2 = a1;
  if (a1 || (v2 = lzma_alloc(0x1C0uLL, a2)) != 0)
  {
    *(_DWORD *)v2 = 0;
    *(_OWORD *)((char *)v2 + 8) = 0u;
    *(_OWORD *)((char *)v2 + 24) = 0u;
    v2[13] = 0u;
    v2[14] = 0u;
    *((_QWORD *)v2 + 53) = 0;
    *((_QWORD *)v2 + 54) = 0;
    *((_QWORD *)v2 + 52) = 0;
    *((_DWORD *)v2 + 110) = 0;
    lzma_check_init((uint64_t)v2 + 40, 10);
    lzma_check_init((uint64_t)(v2 + 15), 10);
  }
  return v2;
}

unint64_t lzma_index_hash_size(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  return (v1 + lzma_vli_size(*(_QWORD *)(a1 + 24)) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t lzma_index_hash_append(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (!a1)
    return 11;
  result = 11;
  if ((a3 & 0x8000000000000000) == 0 && a2 - 0x7FFFFFFFFFFFFFFDLL >= 0x8000000000000008 && !*(_DWORD *)a1)
  {
    hash_append((_QWORD *)(a1 + 8), a2, a3);
    v5 = *(_QWORD *)(a1 + 8);
    if (v5 < 0 || (*(_QWORD *)(a1 + 16) & 0x8000000000000000) != 0)
    {
      return 9;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 24);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = (v7 + lzma_vli_size(v6) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL;
      result = 9;
      if (v8 <= 0x400000000)
        return ((uint64_t)(v5 + v8 + 24) >> 63) & 9;
    }
  }
  return result;
}

uint64_t hash_append(_QWORD *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6;
  int v7;
  uint64_t v8;
  _QWORD data[3];

  data[2] = *MEMORY[0x24BDAC8D0];
  v6 = a1[1] + a3;
  *a1 += (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  a1[1] = v6;
  v7 = lzma_vli_size(a2);
  v8 = a1[3] + lzma_vli_size(a3) + v7;
  ++a1[2];
  a1[3] = v8;
  data[0] = a2;
  data[1] = a3;
  return lzma_check_update((uint64_t)(a1 + 4), 10, (char *)data, 0x10uLL);
}

uint64_t lzma_index_hash_decode(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4;
  char *v9;
  int v10;
  _QWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t *v29;
  unint64_t *v30;

  v4 = *a3;
  if (*a3 >= a4)
    return 10;
  v9 = (char *)(a1 + 432);
  v29 = (unint64_t *)(a1 + 424);
  v30 = (unint64_t *)(a1 + 416);
  v11 = (_QWORD *)(a1 + 208);
  v10 = *(_DWORD *)a1;
  v12 = (unint64_t *)(a1 + 408);
  v13 = *a3;
  while (2)
  {
    switch(v10)
    {
      case 0:
        *a3 = v13 + 1;
        if (*(_BYTE *)(a2 + v13))
          return 9;
        v10 = 1;
        goto LABEL_28;
      case 1:
        v15 = lzma_vli_decode(v12, v9, a2, a3, a4);
        if ((_DWORD)v15 != 1)
          goto LABEL_32;
        v17 = *(_QWORD *)(a1 + 408);
        if (v17 != *(_QWORD *)(a1 + 24))
          return 9;
        *(_QWORD *)v9 = 0;
        v18 = v17 == 0;
        goto LABEL_25;
      case 2:
      case 3:
        if (v10 == 2)
          v14 = v30;
        else
          v14 = v29;
        v15 = lzma_vli_decode(v14, v9, a2, a3, a4);
        if ((_DWORD)v15 != 1)
        {
LABEL_32:
          v23 = v15;
          goto LABEL_33;
        }
        *(_QWORD *)(a1 + 432) = 0;
        v16 = *(_QWORD *)(a1 + 416);
        if (*(_DWORD *)a1 == 2)
        {
          if (v16 - 0x7FFFFFFFFFFFFFFDLL < 0x8000000000000008)
            return 9;
          v10 = 3;
        }
        else
        {
          hash_append(v11, v16, *(_QWORD *)(a1 + 424));
          if (*(_QWORD *)(a1 + 8) < *(_QWORD *)(a1 + 208)
            || *(_QWORD *)(a1 + 16) < *(_QWORD *)(a1 + 216)
            || *(_QWORD *)(a1 + 32) < *(_QWORD *)(a1 + 232))
          {
            return 9;
          }
          v18 = (*v12)-- == 1;
LABEL_25:
          if (v18)
            v10 = 4;
          else
            v10 = 2;
        }
LABEL_28:
        *(_DWORD *)a1 = v10;
        goto LABEL_29;
      case 4:
        v19 = *(_DWORD *)(a1 + 232);
        v20 = lzma_vli_size(*(_QWORD *)(a1 + 224));
        v21 = ~(v20 + (_BYTE)v19) & 3;
        *(_QWORD *)(a1 + 432) = v21;
        *(_DWORD *)a1 = 5;
        if ((~(v20 + (_BYTE)v19) & 3) == 0)
          goto LABEL_35;
        goto LABEL_19;
      case 5:
        v21 = *(_QWORD *)v9;
        if (!*(_QWORD *)v9)
        {
LABEL_35:
          if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a1 + 208))
            return 9;
          if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a1 + 216))
            return 9;
          if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a1 + 232))
            return 9;
          lzma_check_finish(a1 + 40, 10);
          lzma_check_finish(a1 + 240, 10);
          v24 = lzma_check_size(0xAu);
          if (memcmp((const void *)(a1 + 40), (const void *)(a1 + 240), v24))
            return 9;
          *(_DWORD *)(a1 + 440) = lzma_crc32((char *)(a2 + v4), *a3 - v4, *(_DWORD *)(a1 + 440));
          *(_DWORD *)a1 = 6;
LABEL_43:
          v23 = 1;
          while (1)
          {
            v26 = *a3;
            if (*a3 == a4)
              break;
            v27 = *(_DWORD *)(a1 + 440) >> (8 * *(_BYTE *)(a1 + 432));
            *a3 = v26 + 1;
            if (*(unsigned __int8 *)(a2 + v26) != v27)
              return 9;
            v28 = *(_QWORD *)v9 + 1;
            *(_QWORD *)v9 = v28;
            if (v28 >= 4)
              return v23;
          }
          return 0;
        }
LABEL_19:
        *(_QWORD *)v9 = v21 - 1;
        v22 = (*a3)++;
        if (*(_BYTE *)(a2 + v22))
          return 9;
        v10 = 5;
LABEL_29:
        v13 = *a3;
        if (*a3 < a4)
          continue;
        v23 = 0;
LABEL_33:
        if (*a3 != v4)
          *(_DWORD *)(a1 + 440) = lzma_crc32((char *)(a2 + v4), *a3 - v4, *(_DWORD *)(a1 + 440));
        return v23;
      case 6:
        goto LABEL_43;
      default:
        return 11;
    }
  }
}

uint64_t lzma_stream_buffer_decode(unint64_t *a1, char a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6, uint64_t a7, unint64_t *a8, unint64_t a9)
{
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (!a5)
    return 11;
  v16 = *a5;
  if (!a4 && v16 != a6)
    return 11;
  v17 = 11;
  if (a8)
  {
    if (v16 <= a6)
    {
      v19 = *a8;
      if ((a7 || v19 == a9) && (a2 & 4) == 0 && v19 <= a9)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v24[0] = 0;
        v24[1] = -1;
        v17 = lzma_stream_decoder_init((uint64_t)v24, a3, *a1, a2, (int16x8_t)0);
        if (!(_DWORD)v17)
        {
          v20 = *a5;
          v22 = *a8;
          v21 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))&v25
                 + 1))(v24[0], a3, a4, a5, a6, a7, a8, a9, 3);
          if ((_DWORD)v21 == 1)
          {
            v17 = 0;
          }
          else
          {
            v17 = v21;
            *a5 = v20;
            *a8 = v22;
            if ((_DWORD)v21 == 6)
            {
              v23 = 0;
              (*((void (**)(_QWORD, unint64_t *, uint64_t *, _QWORD))&v27 + 1))(v24[0], a1, &v23, 0);
            }
            else if (!(_DWORD)v21)
            {
              if (*a5 == a6)
                v17 = 9;
              else
                v17 = 10;
            }
          }
        }
        lzma_next_end((uint64_t)v24, a3);
      }
    }
  }
  return v17;
}

uint64_t lzma_microlzma_decoder(_QWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10;
  uint64_t v11;

  v10 = lzma_strm_init(a1);
  if (!(_DWORD)v10)
  {
    v10 = microlzma_decoder_init(a1[7], a1[6], a2, a3, a4 != 0, a5);
    if ((_DWORD)v10)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v11 = a1[7];
      *(_BYTE *)(v11 + 96) = 1;
      *(_BYTE *)(v11 + 99) = 1;
    }
  }
  return v10;
}

uint64_t microlzma_decoder_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  _QWORD *v12;
  uint64_t v13;

  if (*(uint64_t (**)())(a1 + 16) != microlzma_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = microlzma_decoder_init;
  v12 = *(_QWORD **)a1;
  if (!*(_QWORD *)a1)
  {
    v12 = lzma_alloc(0x68uLL, a2);
    if (!v12)
      return 5;
    *(_QWORD *)a1 = v12;
    *(_QWORD *)(a1 + 24) = microlzma_decode;
    *(_QWORD *)(a1 + 32) = microlzma_decoder_end;
    *v12 = 0;
    v12[1] = -1;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_5;
    return 8;
  }
  if (a4 < 0)
    return 8;
LABEL_5:
  v13 = 0;
  v12[10] = a3;
  v12[11] = a4;
  *((_BYTE *)v12 + 100) = a5;
  *((_DWORD *)v12 + 24) = a6;
  *((_BYTE *)v12 + 101) = 0;
  return v13;
}

uint64_t microlzma_decode(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t v9;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;
  unsigned int v24;
  __n128 v25;
  BOOL v26;
  unsigned int v27;
  uint64_t v28;
  char v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[8];

  v9 = a8;
  v35[6] = *MEMORY[0x24BDAC8D0];
  v16 = *a4;
  v17 = *a7;
  v18 = a1[10];
  if (a5 - *a4 <= v18)
    v19 = a5;
  else
    v19 = v18 + *a4;
  v20 = *((unsigned __int8 *)a1 + 100);
  if (!*((_BYTE *)a1 + 100))
  {
    v21 = a1[11];
    if (a8 - v17 > v21)
      v9 = v21 + v17;
  }
  if (*((_BYTE *)a1 + 101))
  {
LABEL_8:
    LODWORD(result) = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, uint64_t *, uint64_t, int))a1[3])(*a1, a2, a3, a4, v19, a6, a7, v9, a9);
    v23 = v16 - *a4 + a1[10];
    a1[10] = v23;
    if (*((_BYTE *)a1 + 100))
    {
      if (v23)
        v24 = 9;
      else
        v24 = 1;
      if ((_DWORD)result == 1)
        return v24;
      else
        return result;
    }
    else
    {
      v26 = v17 - *a7 + a1[11] == 0;
      a1[11] += v17 - *a7;
      if (v26)
        v27 = 1;
      else
        v27 = result;
      if ((_DWORD)result == 1)
        return 9;
      else
        return v27;
    }
  }
  if (v16 >= v19)
    return 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  memset(v30, 0, sizeof(v30));
  LODWORD(v30[0]) = *((_DWORD *)a1 + 24);
  *(_QWORD *)((char *)&v31 + 4) = -1;
  if (v20)
    *(_QWORD *)((char *)&v31 + 4) = a1[11];
  if (lzma_lzma_lclppb_decode(v30, *(unsigned __int8 *)(a3 + v16) ^ 0xFF))
    return 8;
  *a4 = v16 + 1;
  v35[0] = 0x4000000000000002;
  v35[1] = lzma_lzma_decoder_init;
  v35[2] = v30;
  memset(&v35[3], 0, 24);
  result = lzma_next_filter_init((uint64_t)a1, a2, v35, v25);
  if (!(_DWORD)result)
  {
    v29 = 0;
    v28 = 0;
    if (((unsigned int (*)(_QWORD, uint64_t, char *, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, _DWORD))a1[3])(*a1, a2, &v29, &v28, 1, a6, a7, v9, 0))
    {
      return 11;
    }
    *((_BYTE *)a1 + 101) = 1;
    goto LABEL_8;
  }
  return result;
}

void microlzma_decoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

uint64_t lzma_stream_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4, int16x8_t a5)
{
  char *v9;
  _OWORD *v10;
  uint64_t result;
  char *v12;
  uint64_t v13;
  _OWORD *v14;

  if (*(uint64_t (**)())(a1 + 16) != lzma_stream_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_stream_decoder_init;
  if (a4 > 0x3F)
    return 8;
  v9 = *(char **)a1;
  if (*(_QWORD *)a1)
  {
    v10 = (_OWORD *)*((_QWORD *)v9 + 44);
  }
  else
  {
    v12 = (char *)lzma_alloc(0x588uLL, a2);
    if (!v12)
      return 5;
    v9 = v12;
    v10 = 0;
    *(_QWORD *)(a1 + 24) = stream_decode;
    *(_QWORD *)(a1 + 32) = stream_decoder_end;
    *(_QWORD *)(a1 + 48) = stream_decoder_get_check;
    *(_QWORD *)(a1 + 56) = stream_decoder_memconfig;
    *(_QWORD *)a1 = v9;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = -1;
    a5.i8[8] = 0;
    a5.i8[9] = 0;
    a5.i8[10] = 0;
    a5.i8[11] = 0;
    a5.i8[12] = 0;
    a5.i8[13] = 0;
    a5.i8[14] = 0;
    a5.i8[15] = 0;
    *(_OWORD *)(v9 + 24) = 0u;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *(_OWORD *)(v9 + 72) = 0u;
    *((_QWORD *)v9 + 44) = 0;
  }
  if (a3 <= 1)
    v13 = 1;
  else
    v13 = a3;
  *((_QWORD *)v9 + 45) = v13;
  *((_QWORD *)v9 + 46) = 0x8000;
  v9[376] = a4 & 1;
  *(int16x4_t *)a5.i8 = vdup_n_s16(a4);
  a5.i32[0] &= 0xFF00FFu;
  a5.i16[2] = a5.u8[4];
  a5.i16[3] = a5.u8[6];
  *(uint16x4_t *)a5.i8 = vshl_u16(*(uint16x4_t *)a5.i8, (uint16x4_t)0xFFFDFFFCFFFEFFFFLL);
  a5.i32[0] &= 0xFF01FF01;
  a5.i16[2] &= 0xFF01u;
  a5.i16[3] &= 0xFF01u;
  *(_DWORD *)(v9 + 377) = vmovn_s16(a5).u32[0];
  v9[381] = 1;
  v14 = lzma_index_hash_init(v10, a2);
  *((_QWORD *)v9 + 44) = v14;
  if (v14)
  {
    result = 0;
    *(_DWORD *)v9 = 0;
    *((_QWORD *)v9 + 48) = 0;
    return result;
  }
  return 5;
}

uint64_t stream_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  _OWORD v36[3];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v14 = (char *)(a1 + 392);
  v15 = (uint64_t *)(a1 + 384);
  v32 = a1 + 296;
  v16 = a1 + 88;
  v18 = a1 + 8;
  v17 = *(_DWORD *)a1;
  while (2)
  {
    switch(v17)
    {
      case 0:
        lzma_bufcpy(a3, a4, a5, (uint64_t)v14, v15, 12);
        if ((unint64_t)*v15 < 0xC)
          return 0;
        *v15 = 0;
        v19 = lzma_stream_header_decode(v32, (uint64_t)v14);
        if ((_DWORD)v19)
        {
          v28 = v19;
          if ((_DWORD)v19 == 7)
          {
            if (*(_BYTE *)(a1 + 381))
              return 7;
            else
              return 9;
          }
        }
        else
        {
          *(_BYTE *)(a1 + 381) = 0;
          v20 = *(_DWORD *)(a1 + 312);
          *(_DWORD *)(a1 + 96) = v20;
          *(_DWORD *)a1 = 1;
          if (*(_BYTE *)(a1 + 376) && !v20)
          {
            return 2;
          }
          else if (*(_BYTE *)(a1 + 377) && !lzma_check_is_supported(v20))
          {
            return 3;
          }
          else
          {
            if (!*(_BYTE *)(a1 + 378))
              goto LABEL_10;
            return 4;
          }
        }
        return v28;
      case 1:
LABEL_10:
        if (*a4 >= a5)
          return 0;
        if (*v15)
        {
          v21 = *(_DWORD *)(a1 + 92);
        }
        else
        {
          if (!*(_BYTE *)(a3 + *a4))
          {
            v17 = 4;
            *(_DWORD *)a1 = 4;
            continue;
          }
          v21 = 4 * *(unsigned __int8 *)(a3 + *a4) + 4;
          *(_DWORD *)(a1 + 92) = v21;
        }
        lzma_bufcpy(a3, a4, a5, (uint64_t)v14, v15, v21);
        if (*(_QWORD *)(a1 + 384) < (unint64_t)*(unsigned int *)(a1 + 92))
          return 0;
        *(_QWORD *)(a1 + 384) = 0;
        *(_DWORD *)a1 = 2;
        goto LABEL_33;
      case 2:
LABEL_33:
        *(_DWORD *)(a1 + 88) = 1;
        *(_QWORD *)(a1 + 120) = v36;
        v22 = lzma_block_header_decode(v16, a2, v14);
        if ((_DWORD)v22)
          return v22;
        *(_BYTE *)(a1 + 288) = *(_BYTE *)(a1 + 379);
        v27 = lzma_raw_decoder_memusage((uint64_t *)v36);
        if (v27 == -1)
        {
          v28 = 8;
LABEL_50:
          lzma_filters_free(v36, a2);
          *(_QWORD *)(a1 + 120) = 0;
          return v28;
        }
        *(_QWORD *)(a1 + 368) = v27;
        if (v27 > *(_QWORD *)(a1 + 360))
        {
          v28 = 6;
          goto LABEL_50;
        }
        v28 = lzma_block_decoder_init(v18, a2, v16);
        lzma_filters_free(v36, a2);
        *(_QWORD *)(a1 + 120) = 0;
        if ((_DWORD)v28)
          return v28;
        *(_DWORD *)a1 = 3;
LABEL_38:
        v22 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t, uint64_t, uint64_t, uint64_t, int))(a1 + 32))(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8, a9);
        if ((_DWORD)v22 != 1)
          return v22;
        v29 = *(_QWORD *)(a1 + 352);
        v30 = lzma_block_unpadded_size(v16);
        v22 = lzma_index_hash_append(v29, v30, *(_QWORD *)(a1 + 112));
        if ((_DWORD)v22)
          return v22;
        v17 = 1;
        *(_DWORD *)a1 = 1;
        continue;
      case 3:
        goto LABEL_38;
      case 4:
        if (*a4 >= a5)
          return 0;
        v22 = lzma_index_hash_decode(*(_QWORD *)(a1 + 352), a3, (unint64_t *)a4, a5);
        if ((_DWORD)v22 != 1)
          return v22;
        *(_DWORD *)a1 = 5;
LABEL_16:
        lzma_bufcpy(a3, a4, a5, (uint64_t)v14, v15, 12);
        if ((unint64_t)*v15 < 0xC)
          return 0;
        *v15 = 0;
        v37 = 0;
        memset(v36, 0, sizeof(v36));
        v23 = lzma_stream_footer_decode((uint64_t)v36, (uint64_t)v14);
        if (v23)
        {
          if (v23 == 7)
            return 9;
          else
            return v23;
        }
        v24 = lzma_index_hash_size(*(_QWORD *)(a1 + 352));
        if (v24 != *((_QWORD *)&v36[0] + 1))
          return 9;
        v22 = lzma_stream_flags_compare(v32, (uint64_t)v36);
        if ((_DWORD)v22)
          return v22;
        if (!*(_BYTE *)(a1 + 380))
          return 1;
        *(_DWORD *)a1 = 6;
LABEL_22:
        v25 = *a4;
        if (*a4 >= a5)
        {
LABEL_42:
          if (a9 != 3)
            return 0;
          if (*v15)
            return 9;
          return 1;
        }
        while (!*(_BYTE *)(a3 + v25))
        {
          *a4 = ++v25;
          *v15 = (*(_DWORD *)v15 + 1) & 3;
          if (a5 == v25)
            goto LABEL_42;
        }
        if (!*v15)
        {
          v26 = lzma_index_hash_init(*(_OWORD **)(a1 + 352), a2);
          *(_QWORD *)(a1 + 352) = v26;
          if (!v26)
            return 5;
          v17 = 0;
          *(_DWORD *)a1 = 0;
          *(_QWORD *)(a1 + 384) = 0;
          continue;
        }
        *a4 = v25 + 1;
        return 9;
      case 5:
        goto LABEL_16;
      case 6:
        goto LABEL_22;
      default:
        return 11;
    }
  }
}

void stream_decoder_end(_QWORD *a1, uint64_t a2)
{
  double end;

  end = lzma_next_end((uint64_t)(a1 + 1), a2);
  lzma_index_hash_end(a1[44], a2, end);
  lzma_free(a1, a2);
}

uint64_t stream_decoder_get_check(uint64_t a1)
{
  return *(unsigned int *)(a1 + 312);
}

uint64_t stream_decoder_memconfig(uint64_t a1, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  uint64_t result;

  *a2 = *(_QWORD *)(a1 + 368);
  *a3 = *(_QWORD *)(a1 + 360);
  if (!a4)
    return 0;
  if (*(_QWORD *)(a1 + 368) > a4)
    return 6;
  result = 0;
  *(_QWORD *)(a1 + 360) = a4;
  return result;
}

uint64_t lzma_stream_decoder(_QWORD *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6;
  int16x8_t v7;
  uint64_t v8;

  v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    v6 = lzma_stream_decoder_init(a1[7], a1[6], a2, a3, v7);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v8 = a1[7];
      *(_BYTE *)(v8 + 96) = 1;
      *(_BYTE *)(v8 + 99) = 1;
    }
  }
  return v6;
}

uint64_t lzma_stream_header_decode(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _BYTE *v6;

  if (*(_DWORD *)a2 != 1484404733 || *(_WORD *)(a2 + 4) != 90)
    return 7;
  v6 = (_BYTE *)(a2 + 6);
  if (lzma_crc32((char *)(a2 + 6), 2uLL, 0) != *(_DWORD *)(a2 + 8))
    return 9;
  if (*v6 || *(unsigned __int8 *)(a2 + 7) > 0xFu)
    return 8;
  result = 0;
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 16) = *(_BYTE *)(a2 + 7) & 0xF;
  *(_QWORD *)(a1 + 8) = -1;
  return result;
}

uint64_t lzma_stream_footer_decode(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(unsigned __int16 *)(a2 + 10) != (unsigned __int16)lzma_footer_magic)
    return 7;
  if (lzma_crc32((char *)(a2 + 4), 6uLL, 0) != *(_DWORD *)a2)
    return 9;
  if (*(_BYTE *)(a2 + 8) || *(unsigned __int8 *)(a2 + 9) > 0xFu)
    return 8;
  result = 0;
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 16) = *(_BYTE *)(a2 + 9) & 0xF;
  *(_QWORD *)(a1 + 8) = 4 * *(unsigned int *)(a2 + 4) + 4;
  return result;
}

uint64_t lzma_vli_decode(unint64_t *a1, char *a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char i;
  int v12;
  uint64_t v13;
  BOOL v14;
  char v16;

  if (a2)
  {
    v5 = *(_QWORD *)a2;
    if (*(_QWORD *)a2)
    {
      if (v5 > 8)
        return 11;
      v6 = *a1;
    }
    else
    {
      v6 = 0;
      *a1 = 0;
    }
    if (v6 >> (7 * v5))
      return 11;
    v7 = *a4;
    if (*a4 >= a5)
      return 10;
  }
  else
  {
    *a1 = 0;
    v7 = *a4;
    if (*a4 >= a5)
      return 9;
    v6 = 0;
    v5 = 0;
    a2 = &v16;
  }
  v9 = 0;
  if (a5 <= v7 + 1)
    v10 = v7 + 1;
  else
    v10 = a5;
  for (i = 7 * v5; ; i += 7)
  {
    v12 = *(unsigned __int8 *)(a3 + v7 + v9);
    v6 += (unint64_t)(v12 & 0x7F) << i;
    v13 = v5 + v9;
    if ((v12 & 0x80) == 0)
      break;
    if (v13 == 8)
    {
      *a4 = v7 - v5 + 9;
      v8 = 9;
      *(_QWORD *)a2 = 9;
      *a1 = v6;
      return v8;
    }
    ++v9;
    if (v7 + v9 >= a5)
    {
      *a4 = v10;
      *(_QWORD *)a2 = v5 + v9;
      *a1 = v6;
      if (a2 == &v16)
        return 9;
      else
        return 0;
    }
  }
  *a4 = v7 + v9 + 1;
  *(_QWORD *)a2 = v13 + 1;
  *a1 = v6;
  if (v12)
    v14 = 0;
  else
    v14 = (unint64_t)(v13 + 1) > 1;
  if (v14)
    return 9;
  else
    return a2 != &v16;
}

uint64_t lzma_check_is_supported(unsigned int a1)
{
  if (a1 <= 0xF)
    return lzma_check_is_supported_available_checks[a1];
  else
    return 0;
}

uint64_t lzma_check_size(unsigned int a1)
{
  if (a1 <= 0xF)
    return lzma_check_size_check_sizes[a1];
  else
    return 0xFFFFFFFFLL;
}

uint64_t lzma_check_init(uint64_t result, int a2)
{
  switch(a2)
  {
    case 10:
      return CC_SHA256_Init((CC_SHA256_CTX *)(result + 64));
    case 4:
      *(_QWORD *)(result + 64) = 0;
      break;
    case 1:
      *(_DWORD *)(result + 64) = 0;
      break;
  }
  return result;
}

uint64_t lzma_check_update(uint64_t result, int a2, char *data, unint64_t len)
{
  unint64_t v4;
  char *v5;
  uint64_t v6;

  v4 = len;
  v5 = data;
  v6 = result;
  switch(a2)
  {
    case 10:
      if (HIDWORD(len))
      {
        do
        {
          CC_SHA256_Update((CC_SHA256_CTX *)(v6 + 64), v5, 0xFFFFFFFF);
          v5 += 0xFFFFFFFFLL;
          v4 -= 0xFFFFFFFFLL;
        }
        while (HIDWORD(v4));
      }
      return CC_SHA256_Update((CC_SHA256_CTX *)(v6 + 64), v5, v4);
    case 4:
      result = lzma_crc64((unint64_t)data, len, *(_QWORD *)(result + 64));
      *(_QWORD *)(v6 + 64) = result;
      break;
    case 1:
      result = lzma_crc32(data, len, *(_DWORD *)(result + 64));
      *(_DWORD *)(v6 + 64) = result;
      break;
  }
  return result;
}

uint64_t lzma_check_finish(uint64_t result, int a2)
{
  switch(a2)
  {
    case 10:
      return CC_SHA256_Final((unsigned __int8 *)result, (CC_SHA256_CTX *)(result + 64));
    case 4:
      *(_QWORD *)result = *(_QWORD *)(result + 64);
      break;
    case 1:
      *(_DWORD *)result = *(_DWORD *)(result + 64);
      break;
  }
  return result;
}

uint64_t lzma_crc32(char *a1, unint64_t a2, int a3)
{
  unsigned int v3;
  char *v4;
  char *v5;
  int v6;
  int64_t v8;
  char *v9;
  int v10;
  unint64_t v11;
  unsigned int v12;
  int v13;

  v3 = ~a3;
  if (a2 >= 9)
  {
    if ((a1 & 7) != 0)
    {
      v4 = a1 + 1;
      v5 = a1;
      do
      {
        v6 = *v5++;
        v3 = lzma_crc32_table[v3 ^ v6] ^ (v3 >> 8);
        --a2;
      }
      while ((v4++ & 7) != 0);
      a1 += 8 - (a1 & 7);
    }
    v8 = a2 & 0xFFFFFFFFFFFFFFF8;
    a2 &= 7u;
    if (v8 >= 1)
    {
      v9 = &a1[v8];
      do
      {
        v10 = *(_DWORD *)a1;
        v11 = *((unsigned int *)a1 + 1);
        a1 += 8;
        v12 = v10 ^ v3;
        v3 = lzma_crc32_table[BYTE1(v12) + 1536] ^ lzma_crc32_table[v12 + 1792] ^ lzma_crc32_table[BYTE2(v12) + 1280] ^ lzma_crc32_table[HIBYTE(v12) + 1024] ^ lzma_crc32_table[v11 + 768] ^ lzma_crc32_table[BYTE1(v11) + 512] ^ lzma_crc32_table[BYTE2(v11) + 256] ^ *(_DWORD *)((char *)lzma_crc32_table + ((v11 >> 22) & 0x3FC));
      }
      while (a1 < v9);
    }
  }
  for (; a2; --a2)
  {
    v13 = *a1++;
    v3 = lzma_crc32_table[v3 ^ v13] ^ (v3 >> 8);
  }
  return ~v3;
}

uint64_t lzma_crc64(unint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;
  int64_t v8;
  unint64_t v9;
  int v10;
  unsigned int v11;

  v3 = ~a3;
  if (a2 >= 5)
  {
    if ((a1 & 3) != 0)
    {
      v4 = a1 + 1;
      v5 = (unsigned __int8 *)a1;
      do
      {
        v6 = *v5++;
        v3 = lzma_crc64_table[v3 ^ (unint64_t)v6] ^ (v3 >> 8);
        --a2;
      }
      while ((v4++ & 3) != 0);
      a1 = a1 - (a1 & 3) + 4;
    }
    v8 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    a2 &= 3u;
    if (v8 >= 1)
    {
      v9 = a1 + v8;
      do
      {
        v10 = *(_DWORD *)a1;
        a1 += 4;
        v3 = lzma_crc64_table[(v10 ^ v3) + 768] ^ HIDWORD(v3) ^ lzma_crc64_table[((unsigned __int16)(v10 ^ v3) >> 8)
                                                                                                + 512] ^ lzma_crc64_table[((v10 ^ v3) >> 16) + 256] ^ lzma_crc64_table[(v10 ^ v3) >> 24];
      }
      while (a1 < v9);
    }
  }
  for (; a2; --a2)
  {
    v11 = *(unsigned __int8 *)a1++;
    v3 = lzma_crc64_table[v3 ^ (unint64_t)v11] ^ (v3 >> 8);
  }
  return ~v3;
}

uint64_t lzma_lzip_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (*(uint64_t (**)())(a1 + 16) != lzma_lzip_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_lzip_decoder_init;
  if (a4 > 0x3F)
    return 8;
  v8 = *(char **)a1;
  if (!*(_QWORD *)a1)
  {
    v8 = (char *)lzma_alloc(0x118uLL, a2);
    if (!v8)
      return 5;
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 24) = lzip_decode;
    *(_QWORD *)(a1 + 32) = lzip_decoder_end;
    *(_QWORD *)(a1 + 48) = lzip_decoder_get_check;
    *(_QWORD *)(a1 + 56) = lzip_decoder_memconfig;
    *((_QWORD *)v8 + 25) = 0;
    *((_QWORD *)v8 + 26) = -1;
    *(_OWORD *)(v8 + 216) = 0u;
    *(_OWORD *)(v8 + 232) = 0u;
    *(_OWORD *)(v8 + 248) = 0u;
    *(_OWORD *)(v8 + 264) = 0u;
  }
  v9 = 0;
  if (a3 <= 1)
    v10 = 1;
  else
    v10 = a3;
  *((_QWORD *)v8 + 4) = v10;
  *((_QWORD *)v8 + 5) = 0x8000;
  v8[48] = (a4 & 4) != 0;
  v8[49] = (a4 & 0x10) != 0;
  *(_DWORD *)v8 = 0;
  v8[50] = (a4 & 8) != 0;
  v8[51] = 1;
  *((_QWORD *)v8 + 7) = 0;
  return v9;
}

uint64_t lzip_decode(int *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  int v14;
  uint64_t *v15;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unint64_t v27;
  uint64_t filter_init;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v39;
  uint64_t v41;
  unsigned int *v42;
  _QWORD v45[8];

  v45[6] = *MEMORY[0x24BDAC8D0];
  v14 = *a1;
  v41 = (uint64_t)(a1 + 16);
  v15 = (uint64_t *)(a1 + 14);
  v42 = (unsigned int *)(a1 + 22);
  v39 = (uint64_t)(a1 + 50);
  v16 = (__n128)xmmword_2299574B0;
  while (2)
  {
    switch(v14)
    {
      case 0:
        v17 = *v15;
        if ((unint64_t)*v15 > 3)
          goto LABEL_9;
        v18 = 0;
        v19 = *a4;
        v20 = a5 - *a4;
        if (a5 < *a4)
          v20 = 0;
        while (2)
        {
          if (v20 == v18)
            return a9 == 3 && *((_BYTE *)a1 + 51) == 0;
          if (*(unsigned __int8 *)(a3 + v19 + v18) == aLzip[v17 + v18])
          {
            *a4 = v19 + v18 + 1;
            *v15 = v17 + v18++ + 1;
            if (v17 + v18 == 4)
            {
LABEL_9:
              *((_QWORD *)a1 + 7) = 0;
              a1[2] = 0;
              *((_OWORD *)a1 + 1) = xmmword_2299574B0;
              *a1 = 1;
              goto LABEL_10;
            }
            continue;
          }
          break;
        }
        if (*((_BYTE *)a1 + 51))
          return 7;
        else
          return 1;
      case 1:
LABEL_10:
        v21 = *a4;
        if (*a4 >= a5)
          return 0;
        v22 = v21 + 1;
        *a4 = v21 + 1;
        v23 = *(unsigned __int8 *)(a3 + v21);
        a1[1] = v23;
        if (v23 > 1)
          return 8;
        ++*((_QWORD *)a1 + 3);
        *a1 = 2;
        if (!*((_BYTE *)a1 + 48))
        {
LABEL_15:
          if (v22 >= a5)
            return 0;
          *a4 = v22 + 1;
          v24 = *(unsigned __int8 *)(a3 + v22);
          ++*((_QWORD *)a1 + 3);
          v25 = v24 & 0x1F;
          if ((v25 - 30) < 0xFFFFFFEE)
            return 9;
          if (v24 >= 0x20 && v25 == 12)
            return 9;
          a1[22] = (1 << v25) - (v24 >> 5 << (v25 - 4));
          *((_QWORD *)a1 + 12) = 0;
          *(_QWORD *)(a1 + 27) = 3;
          a1[29] = 2;
          v27 = lzma_lzma_decoder_memusage(v42) + 0x8000;
          *((_QWORD *)a1 + 5) = v27;
          *a1 = 3;
LABEL_23:
          if (v27 > *((_QWORD *)a1 + 4))
            return 6;
          v45[0] = 0x4000000000000001;
          v45[1] = lzma_lzma_decoder_init;
          v45[2] = v42;
          memset(&v45[3], 0, 24);
          filter_init = lzma_next_filter_init(v39, a2, v45, v16);
          if ((_DWORD)filter_init)
            return filter_init;
          a1[2] = 0;
          *a1 = 4;
LABEL_26:
          v29 = *a4;
          v30 = *a7;
          v37 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t, uint64_t, uint64_t *, uint64_t, int))a1
                 + 28))(*((_QWORD *)a1 + 25), a2, a3, a4, a5, a6, a7, a8, a9);
          v31 = *a7;
          v32 = *a7 - v30;
          v33 = *a4 - v29 + *((_QWORD *)a1 + 3);
          *((_QWORD *)a1 + 2) += v32;
          *((_QWORD *)a1 + 3) = v33;
          if (!*((_BYTE *)a1 + 49) && v31 != v30)
            a1[2] = lzma_crc32((char *)(a6 + v30), v32, a1[2]);
          if ((_DWORD)v37 != 1)
            return v37;
          *a1 = 5;
LABEL_31:
          if (a1[1])
            v34 = 20;
          else
            v34 = 12;
          lzma_bufcpy(a3, a4, a5, v41, v15, v34);
          if (*((_QWORD *)a1 + 7) < v34)
            return 0;
          *((_QWORD *)a1 + 7) = 0;
          v35 = *((_QWORD *)a1 + 3) + v34;
          *((_QWORD *)a1 + 3) = v35;
          if (!*((_BYTE *)a1 + 49) && a1[2] != a1[16]
            || *((_QWORD *)a1 + 2) != *(_QWORD *)(a1 + 17)
            || a1[1] && v35 != *(_QWORD *)(a1 + 19))
          {
            return 9;
          }
          if (!*((_BYTE *)a1 + 50))
            return 1;
          v14 = 0;
          *((_BYTE *)a1 + 51) = 0;
          *a1 = 0;
          continue;
        }
        return 4;
      case 2:
        v22 = *a4;
        goto LABEL_15;
      case 3:
        v27 = *((_QWORD *)a1 + 5);
        goto LABEL_23;
      case 4:
        goto LABEL_26;
      case 5:
        goto LABEL_31;
      default:
        return 11;
    }
  }
}

void lzip_decoder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1 + 200, a2);
  lzma_free(a1, a2);
}

uint64_t lzip_decoder_get_check()
{
  return 1;
}

uint64_t lzip_decoder_memconfig(uint64_t a1, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  uint64_t result;

  *a2 = *(_QWORD *)(a1 + 40);
  *a3 = *(_QWORD *)(a1 + 32);
  if (!a4)
    return 0;
  if (*(_QWORD *)(a1 + 40) > a4)
    return 6;
  result = 0;
  *(_QWORD *)(a1 + 32) = a4;
  return result;
}

uint64_t lzma_lzip_decoder(_QWORD *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    v6 = lzma_lzip_decoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v7 = a1[7];
      *(_BYTE *)(v7 + 96) = 1;
      *(_BYTE *)(v7 + 99) = 1;
    }
  }
  return v6;
}

unint64_t lzma_lz_encoder_memusage(uint64_t *a1)
{
  _OWORD v2[6];
  __int128 v3;
  uint64_t v4;

  v4 = 0;
  v3 = 0u;
  memset(v2, 0, sizeof(v2));
  if ((lz_encoder_prepare((uint64_t)v2, 0, a1) & 1) != 0)
    return -1;
  else
    return DWORD2(v2[0]) + 4 * (v4 + (unint64_t)HIDWORD(v3)) + 240;
}

uint64_t lz_encoder_prepare(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t, int);
  void *v20;
  _BOOL4 v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  char v32;
  int v33;

  v3 = a3[1];
  if (v3 - 1610612737 < 0xFFFFFFFFA0000FFFLL)
    return 1;
  v6 = a3[3];
  v5 = a3[4];
  if (v5 > v6)
    return 1;
  v10 = *a3;
  v11 = *a3 + v3;
  v12 = a3[2] + v6;
  *(_DWORD *)(a1 + 12) = v11;
  *(_DWORD *)(a1 + 16) = v12;
  v13 = (v12 + v10) >> 1;
  v14 = *(_DWORD *)(a1 + 8);
  v15 = (v3 >> 1) + v11 + v12 + v13 + 0x80000;
  *(_DWORD *)(a1 + 8) = v15;
  v16 = *(void **)a1;
  if (v16 && v14 != v15)
  {
    lzma_free(v16, a2);
    *(_QWORD *)a1 = 0;
    v6 = a3[3];
    v5 = a3[4];
    v3 = a3[1];
  }
  *(_DWORD *)(a1 + 96) = v5;
  *(_DWORD *)(a1 + 100) = v6;
  v17 = v3 + 1;
  *(_DWORD *)(a1 + 84) = v3 + 1;
  v18 = *((_DWORD *)a3 + 10);
  result = 1;
  if (v18 <= 17)
  {
    if (v18 == 3)
    {
      v19 = lzma_mf_hc3_skip;
      v20 = lzma_mf_hc3_find;
    }
    else
    {
      if (v18 != 4)
        return result;
      v19 = lzma_mf_hc4_skip;
      v20 = lzma_mf_hc4_find;
    }
  }
  else
  {
    switch(v18)
    {
      case 18:
        v21 = 0;
        *(_QWORD *)(a1 + 48) = lzma_mf_bt2_find;
        *(_QWORD *)(a1 + 56) = lzma_mf_bt2_skip;
        v22 = 0xFFFF;
        *(_DWORD *)(a1 + 88) = 0xFFFF;
        goto LABEL_28;
      case 19:
        v19 = lzma_mf_bt3_skip;
        v20 = lzma_mf_bt3_find;
        break;
      case 20:
        v19 = lzma_mf_bt4_skip;
        v20 = lzma_mf_bt4_find;
        break;
      default:
        return result;
    }
  }
  *(_QWORD *)(a1 + 48) = v20;
  *(_QWORD *)(a1 + 56) = v19;
  v23 = v18 & 0xF;
  v21 = (v18 & 0x10) == 0;
  v24 = (v3 - 1) | ((v3 - 1) >> 1) | ((((_DWORD)v3 - 1) | ((v3 - 1) >> 1)) >> 2);
  v22 = ((v24 | (v24 >> 4)) >> 1) | ((v24 | (v24 >> 4)) >> 9) | 0xFFFF;
  v25 = v22 >> 1;
  if (v23 == 3)
    v25 = 0xFFFFFF;
  if (v22 > 0x1000000)
    v22 = v25;
  *(_DWORD *)(a1 + 88) = v22;
  if (v23 > 2)
  {
    if (v23 == 3)
      v26 = 1025;
    else
      v26 = 66561;
    v27 = v22 + v26;
    goto LABEL_29;
  }
LABEL_28:
  v27 = v22 + 1;
LABEL_29:
  v29 = *(_DWORD *)(a1 + 108);
  v28 = *(_DWORD *)(a1 + 112);
  v30 = v17 << !v21;
  *(_DWORD *)(a1 + 108) = v27;
  *(_DWORD *)(a1 + 112) = v30;
  if (v29 != v27 || v28 != v30)
  {
    lzma_free(*(void **)(a1 + 64), a2);
    *(_QWORD *)(a1 + 64) = 0;
    lzma_free(*(void **)(a1 + 72), a2);
    *(_QWORD *)(a1 + 72) = 0;
  }
  v31 = *((_DWORD *)a3 + 11);
  *(_DWORD *)(a1 + 92) = v31;
  result = 0;
  if (!v31)
  {
    if (v21)
      v32 = 2;
    else
      v32 = 1;
    if (v21)
      v33 = 4;
    else
      v33 = 16;
    *(_DWORD *)(a1 + 92) = (*(_DWORD *)(a1 + 96) >> v32) + v33;
  }
  return result;
}

uint64_t lzma_lz_encoder_init(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t (*a4)(_QWORD *, _QWORD *, _QWORD, _QWORD, _OWORD *))
{
  _QWORD *v7;
  _QWORD *v9;
  uint64_t result;
  char *v11;
  void *v12;
  uint64_t v13;
  __n128 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  size_t v20;
  _OWORD v21[3];
  __int128 v22;

  v7 = (_QWORD *)*a1;
  if (!*a1)
  {
    v9 = lzma_alloc(0xF0uLL, (uint64_t)a2);
    if (!v9)
      return 5;
    v7 = v9;
    *a1 = v9;
    a1[3] = lz_encode;
    a1[4] = lz_encoder_end;
    a1[8] = lz_encoder_update;
    a1[9] = lz_encoder_set_out_limit;
    v9[5] = 0;
    *((_DWORD *)v9 + 12) = 0;
    *((_DWORD *)v9 + 37) = 0;
    *((_DWORD *)v9 + 38) = 0;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    v9[13] = 0;
    v9[14] = 0;
    v9[20] = 0;
    v9[21] = -1;
    *((_OWORD *)v9 + 11) = 0u;
    *((_OWORD *)v9 + 12) = 0u;
    *((_OWORD *)v9 + 13) = 0u;
    *((_OWORD *)v9 + 14) = 0u;
  }
  v22 = 0u;
  memset(v21, 0, sizeof(v21));
  result = a4(v7, a2, *a3, a3[2], v21);
  if ((_DWORD)result)
    return result;
  if ((lz_encoder_prepare((uint64_t)(v7 + 5), (uint64_t)a2, (uint64_t *)v21) & 1) != 0)
    return 8;
  if (!v7[5])
  {
    v11 = (char *)lzma_alloc((*((_DWORD *)v7 + 12) + 4), (uint64_t)a2);
    v7[5] = v11;
    if (!v11)
      return 5;
    *(_DWORD *)&v11[*((unsigned int *)v7 + 12)] = 0;
  }
  *((_DWORD *)v7 + 15) = *((_DWORD *)v7 + 31);
  v7[8] = 0;
  v7[9] = 0;
  *((_DWORD *)v7 + 20) = 0;
  v12 = (void *)v7[13];
  v13 = *((unsigned int *)v7 + 37);
  if (!v12)
  {
    v7[13] = lzma_alloc_zero(4 * v13, a2);
    v15 = lzma_alloc(4 * *((unsigned int *)v7 + 38), (uint64_t)a2);
    v7[14] = v15;
    v16 = (void *)v7[13];
    if (v16 && v15)
      goto LABEL_14;
    lzma_free(v16, (uint64_t)a2);
    v7[13] = 0;
    lzma_free((void *)v7[14], (uint64_t)a2);
    v7[14] = 0;
    return 5;
  }
  bzero(v12, 4 * v13);
LABEL_14:
  *((_DWORD *)v7 + 30) = 0;
  v17 = v22;
  if ((_QWORD)v22)
  {
    v18 = DWORD2(v22);
    if (DWORD2(v22))
    {
      v19 = *((_DWORD *)v7 + 12);
      if (DWORD2(v22) >= v19)
        v20 = v19;
      else
        v20 = DWORD2(v22);
      *((_DWORD *)v7 + 19) = v20;
      memcpy((void *)v7[5], (const void *)(v17 + v18 - v20), v20);
      *((_DWORD *)v7 + 36) = 1;
      v14.n128_f64[0] = ((double (*)(_QWORD *, _QWORD))v7[12])(v7 + 5, *((unsigned int *)v7 + 19));
    }
  }
  *((_DWORD *)v7 + 36) = 0;
  return lzma_next_filter_init((uint64_t)(v7 + 20), (uint64_t)a2, a3 + 3, v14);
}

uint64_t lz_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8, int a9)
{
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t (*v21)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t, _QWORD, uint64_t *, _QWORD, int);
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  BOOL v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v33;

  v16 = a1 + 40;
  while (*a7 < a8 && (a9 || *a4 < a5))
  {
    if (!*(_DWORD *)(a1 + 144))
    {
      v17 = *(_DWORD *)(a1 + 64);
      if (v17 >= *(_DWORD *)(a1 + 72))
      {
        if (v17 >= *(_DWORD *)(a1 + 48) - *(_DWORD *)(a1 + 56))
        {
          v19 = (v17 - *(_DWORD *)(a1 + 52)) & 0xFFFFFFF0;
          memmove(*(void **)(a1 + 40), (const void *)(*(_QWORD *)(a1 + 40) + v19), (*(_DWORD *)(a1 + 76) - v19));
          v20 = *(_DWORD *)(a1 + 64) - v19;
          *(_DWORD *)(a1 + 60) += v19;
          *(_DWORD *)(a1 + 64) = v20;
          v18 = *(_DWORD *)(a1 + 76) - v19;
          *(_DWORD *)(a1 + 72) -= v19;
          *(_DWORD *)(a1 + 76) = v18;
        }
        else
        {
          v18 = *(_DWORD *)(a1 + 76);
        }
        v33 = v18;
        v21 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t, _QWORD, uint64_t *, _QWORD, int))(a1 + 184);
        if (v21)
        {
          v22 = v21(*(_QWORD *)(a1 + 160), a2, a3, a4, a5, *(_QWORD *)(a1 + 40), &v33, *(unsigned int *)(a1 + 48), a9);
        }
        else
        {
          lzma_bufcpy(a3, a4, a5, *(_QWORD *)(a1 + 40), &v33, *(unsigned int *)(a1 + 48));
          if (a9)
            v22 = *a4 == a5;
          else
            v22 = 0;
        }
        v23 = v33;
        *(_DWORD *)(a1 + 76) = v33;
        *(_DWORD *)(*(_QWORD *)(a1 + 40) + v23) = 0;
        if ((_DWORD)v22 == 1)
        {
          v22 = 0;
          *(_DWORD *)(a1 + 144) = a9;
          v24 = *(_DWORD *)(a1 + 76);
          goto LABEL_19;
        }
        v25 = *(_DWORD *)(a1 + 76);
        v26 = *(_DWORD *)(a1 + 56);
        v27 = v25 >= v26;
        v24 = v25 - v26;
        if (v24 != 0 && v27)
LABEL_19:
          *(_DWORD *)(a1 + 72) = v24;
        v28 = *(_DWORD *)(a1 + 80);
        if (v28)
        {
          v29 = *(_DWORD *)(a1 + 64);
          if (v29 < *(_DWORD *)(a1 + 72))
          {
            *(_DWORD *)(a1 + 80) = 0;
            *(_DWORD *)(a1 + 64) = v29 - v28;
            (*(void (**)(uint64_t))(a1 + 96))(v16);
          }
        }
        if ((_DWORD)v22)
          return v22;
      }
    }
    v30 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t *, unint64_t))(a1 + 8))(*(_QWORD *)a1, v16, a6, a7, a8);
    if ((_DWORD)v30)
    {
      v22 = v30;
      *(_DWORD *)(a1 + 144) = 0;
      return v22;
    }
  }
  return 0;
}

void lz_encoder_end(void **a1, uint64_t a2)
{
  void (*v4)(void *, uint64_t);
  void *v5;

  lzma_next_end((uint64_t)(a1 + 20), a2);
  lzma_free(a1[14], a2);
  lzma_free(a1[13], a2);
  lzma_free(a1[5], a2);
  v4 = (void (*)(void *, uint64_t))a1[2];
  v5 = *a1;
  if (v4)
    v4(v5, a2);
  else
    lzma_free(v5, a2);
  lzma_free(a1, a2);
}

uint64_t lz_encoder_update(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(_QWORD, uint64_t);
  uint64_t result;

  v4 = (uint64_t (*)(_QWORD, uint64_t))a1[3];
  if (!v4)
    return 11;
  result = v4(*a1, a4);
  if (!(_DWORD)result)
    return lzma_next_filter_update((uint64_t)(a1 + 20), a2, (_QWORD *)(a4 + 16));
  return result;
}

uint64_t lz_encoder_set_out_limit(_QWORD *a1)
{
  uint64_t (*v2)(_QWORD);

  if (a1[23])
    return 8;
  v2 = (uint64_t (*)(_QWORD))a1[4];
  if (!v2)
    return 8;
  else
    return v2(*a1);
}

uint64_t lzma_mf_is_supported(unsigned int a1)
{
  char v1;
  uint64_t result;

  if (a1 > 0x14)
    return 0;
  v1 = a1;
  result = 1;
  if (((1 << v1) & 0x1C0018) == 0)
    return 0;
  return result;
}

uint64_t lzma_mf_find(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v15;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 48))(a1, a3);
  if (v6)
  {
    v7 = *(unsigned int *)(a3 + 8 * (v6 - 1));
    if ((_DWORD)v7 == *(_DWORD *)(a1 + 96))
    {
      v8 = *(unsigned int *)(a1 + 24);
      v9 = *(_DWORD *)(a1 + 36) - v8;
      v10 = *(_DWORD *)(a1 + 100);
      if (v9 + 1 < v10)
        v11 = (v9 + 1);
      else
        v11 = v10;
      if (v7 >= v11)
      {
LABEL_10:
        v7 = v11;
      }
      else
      {
        v12 = *(_QWORD *)a1 + v8 - 1;
        while (1)
        {
          v13 = *(_DWORD *)(v12 + v7)
              - *(_DWORD *)(~(unint64_t)*(unsigned int *)(a3 + 8 * (v6 - 1) + 4)
                          + v12
                          + v7);
          if (v13)
            break;
          LODWORD(v7) = v7 + 4;
          if (v7 >= v11)
            goto LABEL_10;
        }
        if (*(_WORD *)(v12 + v7) == *(_WORD *)(~(unint64_t)*(unsigned int *)(a3
                                                                                                 + 8
                                                                                                 * (v6 - 1)
                                                                                                 + 4)
                                                            + v12
                                                            + v7))
        {
          LODWORD(v7) = v7 + 2;
          v15 = BYTE2(v13);
        }
        else
        {
          v15 = *(_BYTE *)(v12 + v7)
              - *(_BYTE *)(~(unint64_t)*(unsigned int *)(a3 + 8 * (v6 - 1) + 4)
                         + v12
                         + v7);
        }
        if (!v15)
          LODWORD(v7) = v7 + 1;
        if (v7 >= v11)
          v7 = v11;
        else
          v7 = v7;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  *a2 = v6;
  ++*(_DWORD *)(a1 + 28);
  return v7;
}

uint64_t lzma_mf_hc3_find(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v23;
  char v24;
  unsigned int v25;

  v4 = *(unsigned int *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 36) - v4);
  v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || (v6 = v5, v5 > 2))
  {
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 + v4);
    v9 = *(_DWORD *)(a1 + 20) + v4;
    v10 = lzma_crc32_table[*v8] ^ v8[1];
    v11 = v10 & 0x3FF;
    v12 = (v10 ^ (v8[2] << 8)) & *(_DWORD *)(a1 + 88);
    v13 = *(_QWORD *)(a1 + 64);
    v14 = v9 - *(_DWORD *)(v13 + 4 * (v10 & 0x3FF));
    v12 += 1024;
    v15 = *(_DWORD *)(v13 + 4 * v12);
    *(_DWORD *)(v13 + 4 * v11) = v9;
    *(_DWORD *)(v13 + 4 * v12) = v9;
    v16 = *(_DWORD *)(a1 + 84);
    if (v14 < v16)
    {
      v17 = &v8[-v14];
      if (*v17 == *v8)
      {
        if (v6 < 3)
        {
LABEL_10:
          *a2 = v6;
          a2[1] = v14 - 1;
        }
        else
        {
          v18 = 2;
          while (1)
          {
            v19 = *(_DWORD *)&v17[v18] - *(_DWORD *)&v8[v18];
            if (v19)
              break;
            v18 += 4;
            if (v18 >= v6)
              goto LABEL_10;
          }
          v23 = v18 + 2;
          if ((_WORD)v19)
          {
            v23 = v18;
            v24 = v19;
          }
          else
          {
            v24 = BYTE2(v19);
          }
          v25 = v23 | (v24 == 0);
          if (v25 >= v6)
            v21 = v6;
          else
            v21 = v25;
          *a2 = v21;
          a2[1] = v14 - 1;
          if (v6 > v25)
          {
            v20 = 1;
            goto LABEL_13;
          }
        }
        *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * *(unsigned int *)(a1 + 80)) = v15;
        move_pos(a1);
        return 1;
      }
    }
    v20 = 0;
    v21 = 2;
LABEL_13:
    v7 = (unint64_t)((char *)hc_find_func(v6, v9, v8, v15, *(_DWORD *)(a1 + 92), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), v16, &a2[2 * v20], v21)- (char *)a2) >> 3;
    move_pos(a1);
    return v7;
  }
  v7 = 0;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t move_pos(uint64_t result)
{
  int v1;
  int v2;
  int v3;
  int v4;

  v1 = *(_DWORD *)(result + 80);
  if (v1 + 1 == *(_DWORD *)(result + 84))
    v2 = 0;
  else
    v2 = v1 + 1;
  *(_DWORD *)(result + 80) = v2;
  v3 = *(_DWORD *)(result + 20);
  v4 = *(_DWORD *)(result + 24) + 1;
  *(_DWORD *)(result + 24) = v4;
  if (v3 + v4 == -1)
    return normalize(result);
  return result;
}

_DWORD *hc_find_func(uint64_t a1, int a2, unsigned __int8 *a3, int a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8, _DWORD *a9, unsigned int a10)
{
  _DWORD *result;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  char v19;

  result = a9;
  *(_DWORD *)(a6 + 4 * a7) = a4;
  if (a5)
  {
    v12 = a2 - a4;
    if (a2 - a4 < a8)
    {
      v13 = a10;
      do
      {
        if (a7 >= v12)
          v14 = 0;
        else
          v14 = a8;
        v15 = *(_DWORD *)(a6 + 4 * (a7 - v12 + v14));
        v16 = &a3[-v12];
        if (v16[v13] != a3[v13] || *v16 != *a3)
          goto LABEL_25;
        v17 = a1;
        if (a1 >= 2)
        {
          LODWORD(v17) = 1;
          while (1)
          {
            v18 = *(_DWORD *)&v16[v17] - *(_DWORD *)&a3[v17];
            if (v18)
              break;
            LODWORD(v17) = v17 + 4;
            if (v17 >= a1)
            {
              v17 = a1;
              goto LABEL_22;
            }
          }
          if (*(_WORD *)&v16[v17] == *(_WORD *)&a3[v17])
          {
            LODWORD(v17) = v17 + 2;
            v19 = BYTE2(v18);
          }
          else
          {
            v19 = v16[v17] - a3[v17];
          }
          if (!v19)
            LODWORD(v17) = v17 + 1;
          if (v17 >= a1)
            v17 = a1;
          else
            v17 = v17;
        }
LABEL_22:
        if (v13 < v17)
        {
          *result = v17;
          result[1] = v12 - 1;
          result += 2;
          if ((_DWORD)v17 == (_DWORD)a1)
            return result;
        }
        else
        {
LABEL_25:
          v17 = v13;
        }
        if (!--a5)
          break;
        v12 = a2 - v15;
        v13 = v17;
      }
      while (a2 - v15 < a8);
    }
  }
  return result;
}

uint64_t lzma_mf_hc3_skip(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v3 = result;
  do
  {
    v4 = *(unsigned int *)(v3 + 24);
    if ((*(_DWORD *)(v3 + 36) - v4) > 2)
    {
      v5 = (unsigned __int8 *)(*(_QWORD *)v3 + v4);
      v6 = *(_DWORD *)(v3 + 20) + v4;
      v7 = lzma_crc32_table[*v5] ^ v5[1];
      v8 = v7 & 0x3FF;
      LODWORD(v5) = ((v7 ^ (v5[2] << 8)) & *(_DWORD *)(v3 + 88)) + 1024;
      v9 = *(_QWORD *)(v3 + 64);
      v10 = *(_QWORD *)(v3 + 72);
      v11 = *(_DWORD *)(v9 + 4 * v5);
      *(_DWORD *)(v9 + 4 * v8) = v6;
      *(_DWORD *)(v9 + 4 * v5) = v6;
      *(_DWORD *)(v10 + 4 * *(unsigned int *)(v3 + 80)) = v11;
      result = move_pos(v3);
    }
    else
    {
      *(_DWORD *)(v3 + 24) = v4 + 1;
      ++*(_DWORD *)(v3 + 40);
    }
    --a2;
  }
  while (a2);
  return result;
}

unint64_t lzma_mf_hc4_find(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  char v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int v28;
  char v29;
  unsigned int v30;

  v4 = *(unsigned int *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 36) - v4);
  v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || (v6 = v5, v5 > 3))
  {
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 + v4);
    v9 = *(_DWORD *)(a1 + 20) + v4;
    v10 = lzma_crc32_table[*v8] ^ v8[1];
    v11 = v10 & 0x3FF;
    v12 = v10 ^ (v8[2] << 8);
    v13 = *(_QWORD *)(a1 + 64);
    v14 = *(_DWORD *)(v13 + 4 * v11);
    v15 = v9 - v14;
    v16 = (unsigned __int16)v12 + 1024;
    v17 = *(_DWORD *)(v13 + 4 * v16);
    v18 = v9 - v17;
    v19 = ((v12 ^ (32 * lzma_crc32_table[v8[3]])) & *(_DWORD *)(a1 + 88)) + 66560;
    v20 = *(_DWORD *)(v13 + 4 * v19);
    *(_DWORD *)(v13 + 4 * v11) = v9;
    *(_DWORD *)(v13 + 4 * v16) = v9;
    *(_DWORD *)(v13 + 4 * v19) = v9;
    v21 = *(_DWORD *)(a1 + 84);
    if (v9 - v14 < v21 && v8[-v15] == *v8)
    {
      v22 = 0;
      v23 = 2;
      *(_DWORD *)a2 = 2;
      *((_DWORD *)a2 + 1) = v15 - 1;
      v24 = 1;
    }
    else
    {
      v24 = 0;
      v22 = 1;
      v23 = 1;
    }
    v25 = v17 == v14 || v18 >= v21;
    if (v25 || v8[-v18] != *v8)
    {
      if ((v22 & 1) != 0)
      {
        LODWORD(v7) = 0;
LABEL_33:
        if (v23 <= 3)
          v23 = 3;
        v7 = (unint64_t)((char *)hc_find_func(v6, v9, v8, v20, *(_DWORD *)(a1 + 92), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), v21, &a2[8 * v7], v23)- a2) >> 3;
        goto LABEL_36;
      }
      v26 = -(uint64_t)v15;
      v7 = 1;
    }
    else
    {
      v26 = -(uint64_t)v18;
      v7 = v24 + 1;
      *(_DWORD *)&a2[8 * v24 + 4] = v18 - 1;
      v23 = 3;
    }
    if (v23 >= v6)
    {
LABEL_21:
      *(_DWORD *)&a2[8 * (v7 - 1)] = v6;
    }
    else
    {
      v27 = &v8[v26];
      while (1)
      {
        v28 = *(_DWORD *)&v27[v23] - *(_DWORD *)&v8[v23];
        if (v28)
          break;
        v23 += 4;
        if (v23 >= v6)
          goto LABEL_21;
      }
      if (*(_WORD *)&v27[v23] == *(_WORD *)&v8[v23])
      {
        v23 += 2;
        v29 = BYTE2(v28);
      }
      else
      {
        v29 = v27[v23] - v8[v23];
      }
      if (v29)
        v30 = v23;
      else
        v30 = v23 + 1;
      if (v30 >= v6)
        v23 = v6;
      else
        v23 = v30;
      *(_DWORD *)&a2[8 * (v7 - 1)] = v23;
      if (v6 > v30)
        goto LABEL_33;
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * *(unsigned int *)(a1 + 80)) = v20;
LABEL_36:
    move_pos(a1);
    return v7;
  }
  v7 = 0;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t lzma_mf_hc4_skip(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v3 = result;
  do
  {
    v4 = *(unsigned int *)(v3 + 24);
    if ((*(_DWORD *)(v3 + 36) - v4) > 3)
    {
      v5 = (unsigned __int8 *)(*(_QWORD *)v3 + v4);
      v6 = *(_DWORD *)(v3 + 20) + v4;
      v7 = lzma_crc32_table[*v5] ^ v5[1];
      v8 = v7 & 0x3FF;
      v9 = v7 ^ (v5[2] << 8);
      LODWORD(v5) = ((v9 ^ (32 * lzma_crc32_table[v5[3]])) & *(_DWORD *)(v3 + 88)) + 66560;
      v10 = *(_QWORD *)(v3 + 64);
      v11 = *(_QWORD *)(v3 + 72);
      v12 = *(_DWORD *)(v10 + 4 * v5);
      *(_DWORD *)(v10 + 4 * v8) = v6;
      *(_DWORD *)(v10 + 4 * ((unsigned __int16)v9 + 1024)) = v6;
      *(_DWORD *)(v10 + 4 * v5) = v6;
      *(_DWORD *)(v11 + 4 * *(unsigned int *)(v3 + 80)) = v12;
      result = move_pos(v3);
    }
    else
    {
      *(_DWORD *)(v3 + 24) = v4 + 1;
      ++*(_DWORD *)(v3 + 40);
    }
    --a2;
  }
  while (a2);
  return result;
}

unint64_t lzma_mf_bt2_find(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;

  v4 = *(unsigned int *)(a1 + 24);
  v5 = *(_DWORD *)(a1 + 36) - v4;
  v6 = *(_DWORD *)(a1 + 96);
  if (v6 > v5 && (v5 < 2 || (v6 = v5, *(_DWORD *)(a1 + 104) == 1)))
  {
    v7 = 0;
    *(_DWORD *)(a1 + 24) = v4 + 1;
    ++*(_DWORD *)(a1 + 40);
  }
  else
  {
    v8 = (unsigned __int16 *)(*(_QWORD *)a1 + v4);
    v9 = *v8;
    v11 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    v12 = *(_DWORD *)(v11 + 4 * v9);
    v13 = *(_DWORD *)(a1 + 20) + v4;
    *(_DWORD *)(v11 + 4 * v9) = v13;
    v7 = (unint64_t)((char *)bt_find_func(v6, v13, (uint64_t)v8, v12, *(_DWORD *)(a1 + 92), v10, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84), a2, 1u)- (char *)a2) >> 3;
    move_pos(a1);
  }
  return v7;
}

unsigned int *bt_find_func(unsigned int a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8, unsigned int *a9, unsigned int a10)
{
  unsigned int *result;
  _DWORD *v12;
  _DWORD *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v18;
  _DWORD *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  int v23;

  result = a9;
  v12 = (_DWORD *)(a6 + 8 * a7);
  v13 = v12 + 1;
  if (!a5 || (v14 = a2 - a4, a2 - a4 >= a8))
  {
LABEL_30:
    *v13 = 0;
    *v12 = 0;
    return result;
  }
  v15 = 0;
  v16 = 0;
  while (1)
  {
    if (a7 >= v14)
      v18 = 0;
    else
      v18 = a8;
    v19 = (_DWORD *)(a6 + 8 * (a7 - v14 + v18));
    v20 = a3 - v14;
    if (v16 >= v15)
      v21 = v15;
    else
      v21 = v16;
    if (*(unsigned __int8 *)(v20 + v21) != *(unsigned __int8 *)(a3 + v21))
      goto LABEL_25;
    v22 = v21 + 1;
    v21 = a1;
    if (v22 < a1)
    {
      while (1)
      {
        v23 = *(_DWORD *)(v20 + v22) - *(_DWORD *)(a3 + v22);
        if (v23)
          break;
        v22 += 4;
        if (v22 >= a1)
        {
          v21 = a1;
          goto LABEL_22;
        }
      }
      if (*(_WORD *)(v20 + v22) == *(_WORD *)(a3 + v22))
      {
        v22 += 2;
        LOBYTE(v23) = BYTE2(v23);
      }
      if ((_BYTE)v23)
        v21 = v22;
      else
        v21 = v22 + 1;
      if (v21 >= a1)
        v21 = a1;
    }
LABEL_22:
    if (a10 >= v21)
      goto LABEL_25;
    *result = v21;
    result[1] = v14 - 1;
    result += 2;
    if (v21 == a1)
      break;
    a10 = v21;
LABEL_25:
    if (*(unsigned __int8 *)(v20 + v21) >= *(unsigned __int8 *)(a3 + v21))
    {
      *v13 = a4;
      v13 = v19;
      v16 = v21;
    }
    else
    {
      *v12 = a4;
      v12 = ++v19;
      v15 = v21;
    }
    if (--a5)
    {
      a4 = *v19;
      v14 = a2 - *v19;
      if (v14 < a8)
        continue;
    }
    goto LABEL_30;
  }
  *v12 = *v19;
  *v13 = v19[1];
  return result;
}

uint64_t lzma_mf_bt2_skip(uint64_t a1, int a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  unsigned __int16 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  do
  {
    v4 = *(unsigned int *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 36) - v4;
    result = *(unsigned int *)(a1 + 96);
    if (result > v5
      && (v5 < 2 || (result = (*(_DWORD *)(a1 + 36) - v4), *(_DWORD *)(a1 + 104) == 1)))
    {
      *(_DWORD *)(a1 + 24) = v4 + 1;
      ++*(_DWORD *)(a1 + 40);
    }
    else
    {
      v7 = (unsigned __int16 *)(*(_QWORD *)a1 + v4);
      v8 = *v7;
      v10 = *(_QWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 72);
      v11 = *(_DWORD *)(v10 + 4 * v8);
      v12 = *(_DWORD *)(a1 + 20) + v4;
      *(_DWORD *)(v10 + 4 * v8) = v12;
      bt_skip_func(result, v12, (uint64_t)v7, v11, *(_DWORD *)(a1 + 92), v9, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84));
      result = move_pos(a1);
    }
    --a2;
  }
  while (a2);
  return result;
}

uint64_t bt_skip_func(uint64_t result, int a2, uint64_t a3, int a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8)
{
  _DWORD *v8;
  _DWORD *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  _DWORD *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v8 = (_DWORD *)(a6 + 8 * a7);
  v9 = v8 + 1;
  if (a5 && (v10 = a2 - a4, a2 - a4 < a8))
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = a7 >= v10 ? 0 : a8;
      v14 = (_DWORD *)(a6 + 8 * (a7 - v10 + v13));
      v15 = a3 - v10;
      v16 = v12 >= v11 ? v11 : v12;
      v17 = *(unsigned __int8 *)(v15 + v16);
      v18 = *(unsigned __int8 *)(a3 + v16);
      if (v17 == v18)
        break;
LABEL_21:
      if (v17 >= v18)
      {
        *v9 = a4;
        v9 = v14;
        v12 = v16;
      }
      else
      {
        *v8 = a4;
        v8 = ++v14;
        v11 = v16;
      }
      if (--a5)
      {
        a4 = *v14;
        v10 = a2 - *v14;
        if (v10 < a8)
          continue;
      }
      goto LABEL_26;
    }
    ++v16;
    while (v16 < result)
    {
      v19 = *(_DWORD *)(v15 + v16) - *(_DWORD *)(a3 + v16);
      if (v19)
      {
        if (*(_WORD *)(v15 + v16) == *(_WORD *)(a3 + v16))
        {
          v16 += 2;
          LOBYTE(v19) = BYTE2(v19);
        }
        if (!(_BYTE)v19)
          ++v16;
        if (v16 < result)
        {
          v17 = *(unsigned __int8 *)(v15 + v16);
          v18 = *(unsigned __int8 *)(a3 + v16);
          goto LABEL_21;
        }
        break;
      }
      v16 += 4;
    }
    *v8 = *v14;
    *v9 = v14[1];
  }
  else
  {
LABEL_26:
    *v9 = 0;
    *v8 = 0;
  }
  return result;
}

uint64_t lzma_mf_bt3_find(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v23;
  char v24;
  unsigned int v25;

  v4 = *(unsigned int *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 36) - v4);
  v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || v5 >= 3 && (v6 = v5, *(_DWORD *)(a1 + 104) != 1))
  {
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 + v4);
    v9 = *(_DWORD *)(a1 + 20) + v4;
    v10 = lzma_crc32_table[*v8] ^ v8[1];
    v11 = v10 & 0x3FF;
    v12 = (v10 ^ (v8[2] << 8)) & *(_DWORD *)(a1 + 88);
    v13 = *(_QWORD *)(a1 + 64);
    v14 = v9 - *(_DWORD *)(v13 + 4 * (v10 & 0x3FF));
    v12 += 1024;
    v15 = *(_DWORD *)(v13 + 4 * v12);
    *(_DWORD *)(v13 + 4 * v11) = v9;
    *(_DWORD *)(v13 + 4 * v12) = v9;
    v16 = *(_DWORD *)(a1 + 84);
    if (v14 < v16)
    {
      v17 = &v8[-v14];
      if (*v17 == *v8)
      {
        if (v6 < 3)
        {
LABEL_11:
          *a2 = v6;
          a2[1] = v14 - 1;
        }
        else
        {
          v18 = 2;
          while (1)
          {
            v19 = *(_DWORD *)&v8[v18] - *(_DWORD *)&v17[v18];
            if (v19)
              break;
            v18 += 4;
            if (v18 >= v6)
              goto LABEL_11;
          }
          v23 = v18 + 2;
          if ((_WORD)v19)
          {
            v23 = v18;
            v24 = v19;
          }
          else
          {
            v24 = BYTE2(v19);
          }
          v25 = v23 | (v24 == 0);
          if (v25 >= v6)
            v21 = v6;
          else
            v21 = v25;
          *a2 = v21;
          a2[1] = v14 - 1;
          if (v6 > v25)
          {
            v20 = 1;
            goto LABEL_14;
          }
        }
        bt_skip_func(v6, v9, (uint64_t)v8, v15, *(_DWORD *)(a1 + 92), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), v16);
        move_pos(a1);
        return 1;
      }
    }
    v20 = 0;
    v21 = 2;
LABEL_14:
    v7 = (unint64_t)((char *)bt_find_func(v6, v9, (uint64_t)v8, v15, *(_DWORD *)(a1 + 92), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), v16, &a2[2 * v20], v21)- (char *)a2) >> 3;
    move_pos(a1);
    return v7;
  }
  v7 = 0;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t lzma_mf_bt3_skip(uint64_t a1, int a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  unsigned __int8 *v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  do
  {
    v4 = *(unsigned int *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 36) - v4;
    result = *(unsigned int *)(a1 + 96);
    if (result > v5
      && (v5 < 3 || (result = (*(_DWORD *)(a1 + 36) - v4), *(_DWORD *)(a1 + 104) == 1)))
    {
      *(_DWORD *)(a1 + 24) = v4 + 1;
      ++*(_DWORD *)(a1 + 40);
    }
    else
    {
      v7 = (unsigned __int8 *)(*(_QWORD *)a1 + v4);
      v8 = *(_DWORD *)(a1 + 20) + v4;
      v9 = lzma_crc32_table[*v7] ^ v7[1];
      v10 = v9 & 0x3FF;
      v11 = ((v9 ^ (v7[2] << 8)) & *(_DWORD *)(a1 + 88)) + 1024;
      v13 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 72);
      v14 = *(_DWORD *)(v13 + 4 * v11);
      *(_DWORD *)(v13 + 4 * v10) = v8;
      *(_DWORD *)(v13 + 4 * v11) = v8;
      bt_skip_func(result, v8, (uint64_t)v7, v14, *(_DWORD *)(a1 + 92), v12, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84));
      result = move_pos(a1);
    }
    --a2;
  }
  while (a2);
  return result;
}

unint64_t lzma_mf_bt4_find(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  char v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int v28;
  char v30;
  unsigned int v31;

  v4 = *(unsigned int *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 36) - v4);
  v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || v5 >= 4 && (v6 = v5, *(_DWORD *)(a1 + 104) != 1))
  {
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 + v4);
    v9 = *(_DWORD *)(a1 + 20) + v4;
    v10 = lzma_crc32_table[*v8] ^ v8[1];
    v11 = v10 & 0x3FF;
    v12 = v10 ^ (v8[2] << 8);
    v13 = *(_QWORD *)(a1 + 64);
    v14 = *(_DWORD *)(v13 + 4 * v11);
    v15 = v9 - v14;
    v16 = (unsigned __int16)v12 + 1024;
    v17 = *(_DWORD *)(v13 + 4 * v16);
    v18 = v9 - v17;
    v19 = ((v12 ^ (32 * lzma_crc32_table[v8[3]])) & *(_DWORD *)(a1 + 88)) + 66560;
    v20 = *(_DWORD *)(v13 + 4 * v19);
    *(_DWORD *)(v13 + 4 * v11) = v9;
    *(_DWORD *)(v13 + 4 * v16) = v9;
    *(_DWORD *)(v13 + 4 * v19) = v9;
    v21 = *(_DWORD *)(a1 + 84);
    if (v9 - v14 < v21 && v8[-v15] == *v8)
    {
      v22 = 0;
      v23 = 2;
      *(_DWORD *)a2 = 2;
      *((_DWORD *)a2 + 1) = v15 - 1;
      v24 = 1;
    }
    else
    {
      v24 = 0;
      v22 = 1;
      v23 = 1;
    }
    v25 = v17 == v14 || v18 >= v21;
    if (v25 || v8[-v18] != *v8)
    {
      if ((v22 & 1) != 0)
      {
        LODWORD(v7) = 0;
        goto LABEL_17;
      }
      v26 = -(uint64_t)v15;
      v7 = 1;
    }
    else
    {
      v26 = -(uint64_t)v18;
      v7 = v24 + 1;
      *(_DWORD *)&a2[8 * v24 + 4] = v18 - 1;
      v23 = 3;
    }
    if (v23 >= v6)
    {
LABEL_25:
      *(_DWORD *)&a2[8 * (v7 - 1)] = v6;
LABEL_26:
      bt_skip_func(v6, v9, (uint64_t)v8, v20, *(_DWORD *)(a1 + 92), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), v21);
LABEL_27:
      move_pos(a1);
      return v7;
    }
    v27 = &v8[v26];
    while (1)
    {
      v28 = *(_DWORD *)&v8[v23] - *(_DWORD *)&v27[v23];
      if (v28)
        break;
      v23 += 4;
      if (v23 >= v6)
        goto LABEL_25;
    }
    if (*(_WORD *)&v8[v23] == *(_WORD *)&v27[v23])
    {
      v23 += 2;
      v30 = BYTE2(v28);
    }
    else
    {
      v30 = v8[v23] - v27[v23];
    }
    if (v30)
      v31 = v23;
    else
      v31 = v23 + 1;
    if (v31 >= v6)
      v23 = v6;
    else
      v23 = v31;
    *(_DWORD *)&a2[8 * (v7 - 1)] = v23;
    if (v6 <= v31)
      goto LABEL_26;
LABEL_17:
    if (v23 <= 3)
      v23 = 3;
    v7 = (unint64_t)((char *)bt_find_func(v6, v9, (uint64_t)v8, v20, *(_DWORD *)(a1 + 92), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), v21, (unsigned int *)&a2[8 * v7], v23)- a2) >> 3;
    goto LABEL_27;
  }
  v7 = 0;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t lzma_mf_bt4_skip(uint64_t a1, int a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  unsigned __int8 *v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  do
  {
    v4 = *(unsigned int *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 36) - v4;
    result = *(unsigned int *)(a1 + 96);
    if (result > v5
      && (v5 < 4 || (result = (*(_DWORD *)(a1 + 36) - v4), *(_DWORD *)(a1 + 104) == 1)))
    {
      *(_DWORD *)(a1 + 24) = v4 + 1;
      ++*(_DWORD *)(a1 + 40);
    }
    else
    {
      v7 = (unsigned __int8 *)(*(_QWORD *)a1 + v4);
      v8 = *(_DWORD *)(a1 + 20) + v4;
      v9 = lzma_crc32_table[*v7] ^ v7[1];
      v10 = v9 & 0x3FF;
      v11 = v9 ^ (v7[2] << 8);
      v12 = ((v11 ^ (32 * lzma_crc32_table[v7[3]])) & *(_DWORD *)(a1 + 88)) + 66560;
      v14 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 72);
      v15 = *(_DWORD *)(v14 + 4 * v12);
      *(_DWORD *)(v14 + 4 * v10) = v8;
      *(_DWORD *)(v14 + 4 * ((unsigned __int16)v11 + 1024)) = v8;
      *(_DWORD *)(v14 + 4 * v12) = v8;
      bt_skip_func(result, v8, (uint64_t)v7, v15, *(_DWORD *)(a1 + 92), v13, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84));
      result = move_pos(a1);
    }
    --a2;
  }
  while (a2);
  return result;
}

uint64_t normalize(uint64_t result)
{
  unsigned int v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  v1 = ~*(_DWORD *)(result + 84);
  if (*(_DWORD *)(result + 108))
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 64);
    do
    {
      v4 = *(_DWORD *)(v3 + 4 * v2);
      v5 = v4 >= v1;
      v6 = v4 - v1;
      if (!v5)
        v6 = 0;
      *(_DWORD *)(v3 + 4 * v2++) = v6;
    }
    while (v2 < *(unsigned int *)(result + 108));
  }
  if (*(_DWORD *)(result + 112))
  {
    v7 = 0;
    v8 = *(_QWORD *)(result + 72);
    do
    {
      v9 = *(_DWORD *)(v8 + 4 * v7);
      v5 = v9 >= v1;
      v10 = v9 - v1;
      if (!v5)
        v10 = 0;
      *(_DWORD *)(v8 + 4 * v7++) = v10;
    }
    while (v7 < *(unsigned int *)(result + 112));
  }
  *(_DWORD *)(result + 20) -= v1;
  return result;
}

const char *lzma_str_to_filters(uint64_t a1, int *a2, _QWORD *a3, unsigned int a4, _QWORD *a5)
{
  const char *v5;
  char v7;
  int *v9;
  unint64_t i;
  int v12;
  unsigned __int8 *v13;
  size_t v14;
  char *v15;
  uint64_t j;
  int v17;
  uint64_t v18;
  uint64_t k;
  int v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  size_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  int v32;
  uint64_t *v33;
  void **v34;
  void *v35;
  int v36;
  char *v37;
  char *v38;
  void *v39;
  void *v40;
  int v41;
  const char *v43;
  char *v44;
  unsigned __int8 *v45;
  char *v47;
  unint64_t v48;
  uint64_t __src[10];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = "Unexpected NULL pointer argument(s) to lzma_str_to_filters()";
  if (!a1 || !a3)
    return v5;
  v7 = a4;
  if (a4 > 3)
    return "Unsupported flags to lzma_str_to_filters()";
  v9 = a2;
  for (i = a1 + 1; ; ++i)
  {
    v12 = *(unsigned __int8 *)(i - 1);
    if (v12 != 32)
      break;
  }
  if (!*(_BYTE *)(i - 1))
  {
    v47 = (char *)(i - 1);
    v5 = "Empty string is not allowed, try \"6\" if a default value is needed";
    goto LABEL_75;
  }
  v13 = (unsigned __int8 *)(i - 1);
  v47 = (char *)(i - 1);
  if ((v12 - 48) < 0xA)
  {
    --i;
    goto LABEL_12;
  }
  if (v12 == 45)
  {
    v17 = *(unsigned __int8 *)i;
    if ((v17 - 48) <= 9)
    {
      v47 = (char *)i;
      LOBYTE(v12) = v17;
LABEL_12:
      v14 = strlen((const char *)i);
      v15 = (char *)memchr((void *)i, 32, v14);
      if (v15)
      {
        for (j = 1; v15[j] == 32; ++j)
          ;
        if (v15[j])
          goto LABEL_72;
      }
      else
      {
        v15 = (char *)(i + v14);
      }
      v36 = (char)v12 - 48;
      v47 = (char *)(i + 1);
      if (i + 1 < (unint64_t)v15)
      {
        v36 |= 0x80000000;
        v37 = &v15[~i];
        v38 = (char *)(i + 2);
        v5 = "Unsupported preset flag";
        while (*(v38 - 1) == 101)
        {
          v47 = v38++;
          if (!--v37)
            goto LABEL_69;
        }
        goto LABEL_75;
      }
LABEL_69:
      v39 = lzma_alloc(0x70uLL, (uint64_t)a5);
      if (!v39)
      {
        v5 = "Memory allocation failed";
        goto LABEL_75;
      }
      v40 = v39;
      if (!lzma_lzma_preset((uint64_t)v39, v36))
      {
        v5 = 0;
        *a3 = 33;
        a3[1] = v40;
        a3[2] = -1;
        a3[3] = 0;
        goto LABEL_75;
      }
      lzma_free(v40, (uint64_t)a5);
LABEL_72:
      v5 = "Unsupported preset";
      goto LABEL_75;
    }
  }
  v18 = 0;
  v5 = "The maximum number of filters is four";
  do
  {
    if (v18 == 4)
    {
LABEL_61:
      v34 = (void **)&__src[2 * v18 - 1];
      do
      {
        --v18;
        v35 = *v34;
        v34 -= 2;
        lzma_free(v35, (uint64_t)a5);
      }
      while (v18);
      goto LABEL_63;
    }
    if (v12 == 45 && v13[1] == 45)
    {
      v13 += 2;
      v47 = (char *)v13;
    }
    for (k = 0; ; ++k)
    {
      v20 = v13[k];
      if (v20 != 45)
        break;
      if (v13[k + 1] == 45)
        goto LABEL_33;
LABEL_32:
      ;
    }
    if (v13[k] && v20 != 32)
      goto LABEL_32;
LABEL_33:
    if (!k)
    {
      v5 = "Filter name is missing";
      goto LABEL_60;
    }
    v21 = &v13[k];
    v22 = &v13[k];
    if (v13 >= &v13[k])
    {
LABEL_39:
      v25 = (uint64_t)&v13[k];
    }
    else
    {
      v23 = 0;
      while (1)
      {
        v24 = v13[v23];
        if (v24 == 61 || v24 == 58)
          break;
        if (k == ++v23)
          goto LABEL_39;
      }
      v22 = &v13[v23];
      v25 = (uint64_t)&v13[v23 + 1];
    }
    v26 = v22 - v13;
    if ((unint64_t)(v22 - v13) > 0xB)
    {
LABEL_59:
      v5 = "Unknown filter name";
      goto LABEL_60;
    }
    v44 = (char *)v25;
    v45 = v21;
    v27 = 0xFFFFFFFFFFFFFE20;
    while (memcmp(v13, &filter_name_map[v27 + 480], v26) || filter_name_map[v26 + 480 + v27])
    {
      v27 += 48;
      if (!v27)
        goto LABEL_59;
    }
    if ((v7 & 1) == 0 && v27 == -480)
    {
      v5 = "This filter cannot be used in the .xz format";
      goto LABEL_60;
    }
    v28 = lzma_alloc_zero(*(unsigned int *)&filter_name_map[v27 + 492], a5);
    if (!v28)
    {
      v5 = "Memory allocation failed";
      goto LABEL_60;
    }
    v29 = v28;
    v47 = v44;
    v30 = (*(uint64_t (**)(char **, unsigned __int8 *, void *))&filter_name_map[v27 + 504])(&v47, v45, v28);
    if (v30)
    {
      v43 = (const char *)v30;
      lzma_free(v29, (uint64_t)a5);
      v5 = v43;
LABEL_60:
      if (v18)
        goto LABEL_61;
      goto LABEL_63;
    }
    __src[2 * v18] = *(_QWORD *)&filter_name_map[v27 + 496];
    __src[2 * v18 + 1] = (uint64_t)v29;
    v13 = (unsigned __int8 *)v47;
    v12 = *v47;
    if (v12 == 32)
    {
      v31 = v47 + 1;
      do
      {
        v47 = v31;
        v32 = *v31++;
        v12 = v32;
      }
      while (v32 == 32);
      v13 = (unsigned __int8 *)(v31 - 1);
    }
    ++v18;
  }
  while (v12);
  v33 = &__src[2 * v18];
  *v33 = -1;
  v33[1] = 0;
  if ((v7 & 2) == 0)
  {
    v48 = 0;
    if (lzma_validate_chain(__src, &v48))
    {
      v5 = "Invalid filter chain ('lzma2' missing at the end?)";
      goto LABEL_61;
    }
  }
  memcpy(a3, __src, 16 * v18 + 16);
  v5 = 0;
LABEL_63:
  v9 = a2;
LABEL_75:
  if (v9)
  {
    v41 = (_DWORD)v47 - a1;
    if ((unint64_t)&v47[-a1] >= 0x7FFFFFFF)
      v41 = 0x7FFFFFFF;
    *v9 = v41;
  }
  return v5;
}

uint64_t lzma_str_from_filters(_QWORD *a1, uint64_t *a2, int a3, uint64_t a4)
{
  char v6;
  uint64_t result;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  unsigned int v31;
  char *v32;
  uint64_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  char *v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  size_t v42;
  char *v43;
  const char *v44;
  size_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  const char *__src;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;

  if (!a1)
    return 11;
  *a1 = 0;
  if (!a2)
    return 11;
  v6 = a3;
  if ((a3 & 0xFFFFFF0F) != 0 || *a2 == -1)
    return 8;
  v8 = a4;
  v9 = lzma_alloc(0x320uLL, a4);
  v54 = v9;
  if (!v9)
    return 5;
  v55 = 0;
  v10 = ":";
  if ((v6 & 0x40) != 0)
    v10 = "=";
  if (*a2 == -1)
  {
    v46 = v9;
LABEL_81:
    if (v55 == 799)
    {
      lzma_free(v46, v8);
      v46 = 0;
      result = 11;
    }
    else
    {
      result = 0;
      *((_BYTE *)v46 + v55) = 0;
    }
    *a1 = v46;
    return result;
  }
  __src = v10;
  v11 = 0;
  v12 = a2;
  while (1)
  {
    if (v11 == 4)
    {
LABEL_77:
      v47 = v54;
      v48 = v8;
      goto LABEL_78;
    }
    if ((v6 & 0x80) == 0 && v11)
    {
      if (v55 == 799)
        v13 = 799;
      else
        v13 = v55 + 1;
      memcpy((char *)v54 + v55, " ", v55 != 799);
      v55 = v13;
    }
    v52 = v11;
    v15 = (v6 & 0x80) == 0 || v11 == 0;
    if ((v6 & 0x40) != 0 || !v15)
    {
      v16 = v55;
      if ((unint64_t)(799 - v55) >= 2)
        v17 = 2;
      else
        v17 = 799 - v55;
      memcpy((char *)v54 + v55, "--", v17);
      v55 = v17 + v16;
    }
    v18 = 0;
    v19 = *v12;
    v20 = -9;
    while (*(_QWORD *)&filter_name_map[v18 + 16] != v19)
    {
      ++v20;
      v18 += 48;
      if (v18 == 480)
        goto LABEL_77;
    }
    v50 = v8;
    v21 = strlen(&filter_name_map[v18]);
    v23 = v54;
    v22 = v55;
    v24 = v21 >= 799 - v55 ? 799 - v55 : v21;
    memcpy((char *)v54 + v55, &filter_name_map[v18], v24);
    v55 = v24 + v22;
    if ((v6 & 0x30) != 0)
    {
      v53 = a2[2 * v52 + 1];
      if (v53)
      {
        v25 = &filter_name_map[v18];
        v26 = 40;
        if ((v6 & 0x10) == 0)
          v26 = 41;
        v27 = v25[v26];
        if (v25[v26])
        {
          v28 = 0;
          v29 = *((_QWORD *)v25 + 4);
          v30 = __src;
          v51 = v25[v26];
          do
          {
            if (*(_BYTE *)(v29 + 24 * v28 + 12) != 3)
            {
              v31 = *(_DWORD *)(v53 + *(unsigned __int16 *)(v29 + 24 * v28 + 14));
              if (v31 || (*(_BYTE *)(v29 + 24 * v28 + 13) & 4) == 0)
              {
                v32 = (char *)v54;
                if (v55 == 799)
                  v33 = 799;
                else
                  v33 = v55 + 1;
                memcpy((char *)v54 + v55, v30, v55 != 799);
                v34 = strlen((const char *)(v29 + 24 * v28));
                if (v34 >= 799 - v33)
                  v35 = 799 - v33;
                else
                  v35 = v34;
                memcpy(&v32[v33], (const void *)(v29 + 24 * v28), v35);
                v36 = v35 + v33 != 799;
                v37 = &v32[v35 + v33];
                if (v35 + v33 == 799)
                  v38 = 799;
                else
                  v38 = v35 + v33 + 1;
                memcpy(v37, "=", v36);
                v55 = v38;
                v39 = *(unsigned __int8 *)(v29 + 24 * v28 + 13);
                if ((v39 & 1) != 0)
                {
                  v40 = *(_QWORD *)(v29 + 24 * v28 + 16);
                  if (*(_BYTE *)v40)
                  {
                    while (*(_DWORD *)(v40 + 12) != v31)
                    {
                      v41 = *(unsigned __int8 *)(v40 + 16);
                      v40 += 16;
                      if (!v41)
                        goto LABEL_62;
                    }
                    v45 = strlen((const char *)v40);
                    if (v45 >= 799 - v38)
                      v42 = 799 - v38;
                    else
                      v42 = v45;
                    v43 = &v32[v38];
                    v44 = (const char *)v40;
                  }
                  else
                  {
LABEL_62:
                    if ((unint64_t)(799 - v38) >= 7)
                      v42 = 7;
                    else
                      v42 = 799 - v38;
                    v43 = &v32[v38];
                    v44 = "UNKNOWN";
                  }
                  memcpy(v43, v44, v42);
                  v55 = v42 + v38;
                }
                else
                {
                  str_append_u32(&v54, v31, (v39 >> 1) & 1);
                }
                v30 = ",";
                v27 = v51;
              }
            }
            ++v28;
          }
          while (v28 != v27);
        }
        goto LABEL_75;
      }
      if (v20 <= 0xFFFFFFFFFFFFFFF8)
        break;
    }
LABEL_75:
    v11 = v52 + 1;
    v12 = &a2[2 * v52 + 2];
    v8 = v50;
    if (*v12 == -1)
    {
      v46 = v54;
      goto LABEL_81;
    }
  }
  v47 = v23;
  v48 = v50;
LABEL_78:
  lzma_free(v47, v48);
  return 8;
}

void *str_append_str(_QWORD *a1, char *__s)
{
  size_t v4;
  uint64_t v5;
  size_t v6;
  void *result;

  v4 = strlen(__s);
  v5 = a1[1];
  if (v4 >= 799 - v5)
    v6 = 799 - v5;
  else
    v6 = v4;
  result = memcpy((void *)(*a1 + v5), __s, v6);
  a1[1] += v6;
  return result;
}

uint64_t lzma_str_list_filters(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  const char *v14;
  const char *v15;
  const char *v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  const char *v21;
  const char *v22;
  size_t v23;
  size_t v24;
  const char *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  size_t v31;
  char *v32;
  size_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  size_t v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  char *v45;
  size_t v46;
  size_t v47;
  int v48;
  size_t v49;
  char *v50;
  _QWORD *v51;
  const char *v52;
  unsigned int v53;
  const char *__src;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;

  if (!a1)
    return 11;
  v4 = a3;
  *a1 = 0;
  if ((a3 & 0xFFFFFF8E) != 0)
    return 8;
  v9 = (char *)lzma_alloc(0x320uLL, a4);
  v58 = v9;
  if (!v9)
    return 5;
  v10 = v9;
  v51 = a1;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v55 = v4 & 0x30;
  v14 = "\n";
  if ((v4 & 0x30) == 0)
    v14 = " ";
  __src = v14;
  if ((v4 & 0x40) != 0)
    v15 = "=";
  else
    v15 = ":";
  v52 = v15;
  v16 = "lzma1";
  v53 = v4;
  v56 = a2;
  do
  {
    if (a2 == -1)
    {
      if ((v4 & 1) == 0 && !v12)
        goto LABEL_68;
    }
    else if (*(_QWORD *)&v16[48 * v12 + 16] != a2)
    {
      goto LABEL_68;
    }
    if ((v13 & 1) != 0)
    {
      v17 = v11 != 799;
      v18 = &v10[v11];
      if (v11 != 799)
        ++v11;
      memcpy(v18, __src, v17);
    }
    v19 = v4;
    if ((v4 & 0x40) != 0)
    {
      if ((unint64_t)(799 - v11) >= 2)
        v20 = 2;
      else
        v20 = 799 - v11;
      memcpy(&v10[v11], "--", v20);
      v11 += v20;
      v16 = "lzma1";
    }
    v21 = v16;
    v22 = &v16[48 * v12];
    v23 = strlen(v22);
    if (v23 >= 799 - v11)
      v24 = 799 - v11;
    else
      v24 = v23;
    memcpy(&v10[v11], v22, v24);
    v11 += v24;
    v59 = v11;
    if (v55)
    {
      v57 = v12;
      v25 = &v21[48 * v12];
      v26 = v25 + 40;
      if ((v19 & 0x10) == 0)
        v26 = v25 + 41;
      v27 = *v26;
      if (*v26)
      {
        v28 = 0;
        v29 = *((_QWORD *)v25 + 4);
        v30 = v52;
        do
        {
          v31 = v11 != 799;
          v32 = &v10[v11];
          if (v11 != 799)
            ++v11;
          memcpy(v32, v30, v31);
          v33 = strlen((const char *)(v29 + 24 * v28));
          if (v33 >= 799 - v11)
            v34 = 799 - v11;
          else
            v34 = v33;
          memcpy(&v10[v11], (const void *)(v29 + 24 * v28), v34);
          v35 = v34 + v11;
          if (799 - v35 >= 2)
            v36 = 2;
          else
            v36 = 799 - v35;
          memcpy(&v10[v35], "=<", v36);
          v11 = v36 + v35;
          v59 = v11;
          if (*(_BYTE *)(v29 + 24 * v28 + 12) == 3)
          {
            if ((unint64_t)(799 - v11) >= 6)
              v37 = 6;
            else
              v37 = 799 - v11;
            memcpy(&v10[v11], "0-9[e]", v37);
            v11 += v37;
          }
          else
          {
            v38 = *(unsigned __int8 *)(v29 + 24 * v28 + 13);
            if ((v38 & 1) != 0)
            {
              v42 = *(_QWORD *)(v29 + 24 * v28 + 16);
              if (*(_BYTE *)v42)
              {
                v43 = 0;
                do
                {
                  if (v43)
                  {
                    v44 = v11 != 799;
                    v45 = &v10[v11];
                    if (v11 != 799)
                      ++v11;
                    memcpy(v45, "|", v44);
                  }
                  v46 = strlen((const char *)v42);
                  if (v46 >= 799 - v11)
                    v47 = 799 - v11;
                  else
                    v47 = v46;
                  memcpy(&v10[v11], (const void *)v42, v47);
                  v11 += v47;
                  v48 = *(unsigned __int8 *)(v42 + 16);
                  v42 += 16;
                  --v43;
                }
                while (v48);
              }
            }
            else
            {
              v39 = (v38 >> 1) & 1;
              v40 = v29 + 24 * v28;
              str_append_u32(&v58, *(_DWORD *)(v40 + 16), v39);
              if (v59 == 799)
                v41 = 799;
              else
                v41 = v59 + 1;
              memcpy(&v58[v59], "-", v59 != 799);
              v59 = v41;
              str_append_u32(&v58, *(_DWORD *)(v40 + 20), v39);
              v10 = v58;
              v11 = v59;
            }
          }
          v49 = v11 != 799;
          v50 = &v10[v11];
          if (v11 != 799)
            ++v11;
          memcpy(v50, ">", v49);
          v59 = v11;
          ++v28;
          v30 = ",";
        }
        while (v28 != v27);
        v13 = 1;
        v4 = v53;
        a2 = v56;
        v12 = v57;
        v16 = "lzma1";
      }
      else
      {
        v4 = v19;
        v16 = v21;
        v13 = 1;
        a2 = v56;
        v12 = v57;
      }
    }
    else
    {
      v13 = 1;
      v16 = v21;
      v4 = v19;
      a2 = v56;
    }
LABEL_68:
    ++v12;
  }
  while (v12 != 10);
  if ((v13 & 1) == 0)
  {
    lzma_free(v10, a4);
    return 8;
  }
  if (v11 == 799)
  {
    lzma_free(v10, a4);
    v10 = 0;
    result = 11;
  }
  else
  {
    result = 0;
    v10[v11] = 0;
  }
  *v51 = v10;
  return result;
}

void *str_append_u32(_QWORD *a1, unsigned int a2, int a3)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  char *v8;
  BOOL v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = 0;
    if ((a2 & 0x3FF) == 0 && a3)
    {
      v5 = 0;
      do
      {
        v6 = a2;
        a2 >>= 10;
        v4 = v5 + 1;
        if ((v6 & 0xFFC00) != 0)
          break;
      }
      while (v5++ < 2);
    }
    HIWORD(v12[0]) = 0;
    v8 = (char *)v12 + 7;
    do
    {
      *--v8 = (a2 % 0xA) | 0x30;
      v9 = a2 > 9;
      a2 /= 0xAu;
    }
    while (v9);
    str_append_str(a1, v8);
    v10 = (char *)&str_append_u32_suffixes + 4 * v4;
  }
  else
  {
    v10 = "0";
  }
  return str_append_str(a1, v10);
}

const char *parse_lzma12(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  const char *result;

  lzma_lzma_preset(a3, 6);
  result = parse_options(a1, a2, a3, (uint64_t)"preset", 9);
  if (!result)
  {
    if ((*(_DWORD *)(a3 + 24) + *(_DWORD *)(a3 + 20)) <= 4)
      return 0;
    else
      return "The sum of lc and lp must not exceed 4";
  }
  return result;
}

const char *parse_bcj(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  return parse_options(a1, a2, a3, (uint64_t)"start", 1);
}

const char *parse_delta(uint64_t *a1, _BYTE *a2, _QWORD *a3)
{
  *a3 = 0x100000000;
  return parse_options(a1, a2, (uint64_t)a3, (uint64_t)"dist", 1);
}

const char *parse_options(uint64_t *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t i;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v16;
  size_t v17;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  size_t v23;
  _BYTE *v24;
  int v25;
  uint64_t v26;
  _BYTE *v27;
  unsigned __int8 v28;
  unsigned int v29;
  _BYTE *v30;
  int v31;
  int v32;
  char v33;
  char v34;
  _DWORD *v35;
  int v36;
  _BYTE *v37;
  const char *result;
  uint64_t v39;
  const char *v40;

  v5 = *a1;
  if (*a1 < (unint64_t)a2)
  {
    v40 = "Invalid multiplier suffix (KiB, MiB, or GiB)";
    while (1)
    {
      for (i = -v5; ; --i)
      {
        v10 = *(unsigned __int8 *)v5;
        if (v10 != 44)
          break;
        *a1 = ++v5;
        if ((_BYTE *)v5 == a2)
          return 0;
      }
      if (!*(_BYTE *)v5)
        break;
      v11 = memchr((void *)v5, 44, (size_t)&a2[-v5]);
      if (v11)
        v12 = (unint64_t)v11;
      else
        v12 = (unint64_t)a2;
      v13 = v12;
      v14 = memchr((void *)v5, 61, v12 - v5);
      if (v10 == 61 || v14 == 0)
        return "Options must be 'name=value' pairs separated with commas";
      v16 = v14;
      v17 = (size_t)&v14[-v5];
      if ((unint64_t)&v14[-v5] > 0xB || a5 == 0)
        return "Unknown option name";
      v19 = &v14[i];
      v20 = a4;
      v21 = a5;
      v39 = v20;
      while (memcmp((const void *)v5, (const void *)v20, v17) || v19[v20])
      {
        v20 += 24;
        if (!--v21)
          return "Unknown option name";
      }
      v22 = v16 + 1;
      *a1 = (uint64_t)(v16 + 1);
      v23 = v13 - (_QWORD)(v16 + 1);
      if ((_BYTE *)v13 == v16 + 1)
        return "Option value cannot be empty";
      v24 = (_BYTE *)v13;
      if (*(_BYTE *)(v20 + 12) == 3)
      {
        v25 = (char)v16[1] - 48;
        *a1 = (uint64_t)(v16 + 2);
        a4 = v39;
        if ((unint64_t)(v16 + 2) < v13)
        {
          v25 |= 0x80000000;
          v26 = v13 - (_QWORD)v16 - 2;
          v27 = v16 + 3;
          while (*(v27 - 1) == 101)
          {
            *a1 = (uint64_t)v27++;
            if (!--v26)
              goto LABEL_30;
          }
          return "Unsupported preset flag";
        }
LABEL_30:
        if (lzma_lzma_preset(a3, v25))
          return "Unsupported preset";
      }
      else
      {
        a4 = v39;
        if ((*(_BYTE *)(v20 + 13) & 1) != 0)
        {
          if (v23 > 0xB)
            return "Invalid option value";
          v35 = *(_DWORD **)(v20 + 16);
          if (!*(_BYTE *)v35)
            return "Invalid option value";
          while (memcmp(v22, v35, v23) || *((_BYTE *)v35 + v23))
          {
            v36 = *((unsigned __int8 *)v35 + 16);
            v35 += 4;
            result = "Invalid option value";
            if (!v36)
              return result;
          }
          v29 = v35[3];
          v24 = (_BYTE *)v13;
        }
        else
        {
          v28 = *v22;
          if ((*v22 - 58) < 0xF6u)
            return "Value is not a non-negative decimal integer";
          v29 = 0;
          v30 = v16 + 3;
          do
          {
            if (v29 > 0x19999999)
              return "Value out of range";
            v31 = 5 * v29;
            if (47 - v28 < 2 * v31)
              return "Value out of range";
            v29 = 2 * v31 + v28 - 48;
            if ((unint64_t)(v30 - 1) >= v13)
              goto LABEL_63;
            v32 = (char)*(v30 - 1);
            v28 = *(v30++ - 1);
          }
          while ((v32 - 48) < 0xA);
          if ((*(_BYTE *)(v20 + 13) & 2) == 0)
          {
            v40 = "This option does not support any integer suffixes";
LABEL_77:
            *a1 = (uint64_t)(v30 - 2);
            return v40;
          }
          v33 = v32 - 71;
          if ((v32 - 71) > 0x26)
            goto LABEL_77;
          if (((1 << v33) & 0x100000001) != 0)
          {
            v34 = 30;
          }
          else if (((1 << v33) & 0x1000000010) != 0)
          {
            v34 = 10;
          }
          else
          {
            if (((1 << v33) & 0x4000000040) == 0)
              goto LABEL_77;
            v34 = 20;
          }
          v37 = v30 - 1;
          if ((unint64_t)(v30 - 1) < v13 && *(v30 - 1) == 105)
            v37 = v30;
          if ((unint64_t)v37 < v13 && *v37 == 66)
            ++v37;
          if ((unint64_t)v37 < v13)
            goto LABEL_77;
          if (v29 > 0xFFFFFFFF >> v34)
            return "Value out of range";
          v29 <<= v34;
LABEL_63:
          if (v29 < *(_DWORD *)(v20 + 16) || v29 > *(_DWORD *)(v20 + 20))
            return "Value out of range";
        }
        *(_DWORD *)(a3 + *(unsigned __int16 *)(v20 + 14)) = v29;
        *a1 = (uint64_t)v24;
      }
      result = 0;
      v5 = *a1;
      if (*a1 >= (unint64_t)a2)
        return result;
    }
  }
  return 0;
}

uint64_t lzma_lzma_encode(uint64_t a1, unsigned __int8 **a2, uint64_t a3, uint64_t *a4, uint64_t a5, unsigned int a6)
{
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int i;
  uint64_t v17;
  int v18;
  uint64_t result;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _DWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  int k;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  int v54;
  BOOL v55;
  unsigned int v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  uint64_t v74;
  uint64_t v75;
  char v76;
  _QWORD *v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;

  if (!*(_BYTE *)(a1 + 2933))
  {
    if (*((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 8))
    {
      if (!*((_DWORD *)a2 + 26))
        return 0;
    }
    else
    {
      v12 = 1;
      ((void (*)(unsigned __int8 **, uint64_t))a2[7])(a2, 1);
      *((_DWORD *)a2 + 7) = 0;
      *(_DWORD *)(a1 + 4 * *(_QWORD *)(a1 + 32) + 48) = 0;
      v13 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 8 * v13 + 264) = a1 + 27524;
      v14 = v13 + 1;
      *(_QWORD *)(a1 + 32) = v13 + 1;
      v15 = **a2;
      for (i = 7; i != -1; --i)
      {
        *(_DWORD *)(a1 + 4 * v14 + 48) = (v15 >> i) & 1;
        v17 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 8 * v17 + 264) = a1 + 2948 + 2 * v12;
        v14 = v17 + 1;
        *(_QWORD *)(a1 + 32) = v14;
        v18 = (v15 >> i) & 1 | (2 * v12);
        v12 = v18;
      }
      ++*(_QWORD *)(a1 + 688);
    }
    *(_BYTE *)(a1 + 2933) = 1;
  }
  if ((rc_encode((unint64_t *)a1, a3, a4, a5) & 1) != 0)
    return 0;
  result = 1;
  if (!*(_BYTE *)(a1 + 2934))
  {
    v20 = a1 + 264;
    while (1)
    {
      v21 = *((_DWORD *)a2 + 6);
      if (a6 != -1 && (v21 - *((_DWORD *)a2 + 7) >= a6 || (unint64_t)(*a4 + *(_QWORD *)(a1 + 8) + 4) > 0xEFFE))
        goto LABEL_73;
      if (v21 >= *((_DWORD *)a2 + 8))
      {
        if (!*((_DWORD *)a2 + 26))
          return 0;
        if (!*((_DWORD *)a2 + 7))
        {
LABEL_73:
          v77 = *(_QWORD **)(a1 + 704);
          if (v77)
            *v77 = *(_QWORD *)(a1 + 688);
          if (*(_BYTE *)(a1 + 2935))
          {
            v78 = *(_DWORD *)(a1 + 2936) & *(_DWORD *)(a1 + 688);
            v79 = a1 + 32 * *(unsigned int *)(a1 + 712) + 2 * v78;
            *(_DWORD *)(a1 + 48 + 4 * *(_QWORD *)(a1 + 32)) = 1;
            v80 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)(a1 + 264 + 8 * v80) = v79 + 27524;
            v81 = v80 + 1;
            *(_QWORD *)(a1 + 32) = v80 + 1;
            v82 = a1 + 2 * *(unsigned int *)(a1 + 712);
            *(_DWORD *)(a1 + 48 + 4 * v81) = 0;
            v83 = v82 + 27908;
            v84 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)(a1 + 264 + 8 * v84) = v83;
            *(_QWORD *)(a1 + 32) = v84 + 1;
            match(a1, v78, 0xFFFFFFFF, 2u);
          }
          v85 = 5;
          do
          {
            v86 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)(a1 + 32) = v86 + 1;
            *(_DWORD *)(a1 + 4 * v86 + 48) = 4;
            --v85;
          }
          while (v85);
          v87 = rc_encode((unint64_t *)a1, a3, a4, a5);
          result = 1;
          if (v87)
          {
            *(_BYTE *)(a1 + 2934) = 1;
            return 0;
          }
          return result;
        }
      }
      v88 = 0;
      if (*(_BYTE *)(a1 + 2932))
        lzma_lzma_optimum_fast(a1, (uint64_t)a2, &v88, (unsigned int *)&v88 + 1);
      else
        lzma_lzma_optimum_normal(a1, (uint64_t)a2, (unsigned int *)&v88, (unsigned int *)&v88 + 1, *(_DWORD *)(a1 + 688));
      v22 = v88;
      v23 = HIDWORD(v88);
      v24 = *(_DWORD *)(a1 + 688);
      v25 = *(_DWORD *)(a1 + 2936) & v24;
      v26 = a1 + 32 * *(unsigned int *)(a1 + 712) + 2 * v25 + 27524;
      v27 = (_DWORD *)(a1 + 4 * *(_QWORD *)(a1 + 32) + 48);
      if ((_DWORD)v88 == -1)
        break;
      *v27 = 1;
      v28 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 8 * v28++ + 264) = v26;
      *(_QWORD *)(a1 + 32) = v28;
      v29 = a1 + 2 * *(unsigned int *)(a1 + 712) + 27908;
      v30 = (_DWORD *)(a1 + 4 * v28 + 48);
      if (v22 <= 3)
      {
        *v30 = 1;
        v31 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 8 * v31 + 264) = v29;
        v32 = v31 + 1;
        *(_QWORD *)(a1 + 32) = v32;
        if ((_DWORD)v22)
        {
          v33 = *(_DWORD *)(a1 + 4 * v22 + 716);
          v34 = a1 + 2 * *(unsigned int *)(a1 + 712) + 27932;
          *(_DWORD *)(a1 + 48 + 4 * v32) = 1;
          v35 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)(a1 + 8 * v35 + 264) = v34;
          v36 = v35 + 1;
          *(_QWORD *)(a1 + 32) = v35 + 1;
          v37 = a1 + 2 * *(unsigned int *)(a1 + 712) + 27956;
          v38 = (_DWORD *)(a1 + 48 + 4 * v36);
          if ((_DWORD)v22 == 1)
          {
            *v38 = 0;
            v39 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)(a1 + 8 * v39 + 264) = v37;
            *(_QWORD *)(a1 + 32) = v39 + 1;
          }
          else
          {
            *v38 = 1;
            v64 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)(a1 + 264 + 8 * v64) = v37;
            v65 = v64 + 1;
            *(_QWORD *)(a1 + 32) = v64 + 1;
            v66 = a1 + 2 * *(unsigned int *)(a1 + 712) + 27980;
            *(_DWORD *)(a1 + 4 * v65 + 48) = v22 - 2;
            v67 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)(a1 + 264 + 8 * v67) = v66;
            *(_QWORD *)(a1 + 32) = v67 + 1;
            if ((_DWORD)v22 == 3)
              *(_DWORD *)(a1 + 728) = *(_DWORD *)(a1 + 724);
            *(_DWORD *)(a1 + 724) = *(_DWORD *)(a1 + 720);
          }
          *(_DWORD *)(a1 + 720) = *(_DWORD *)(a1 + 716);
          *(_DWORD *)(a1 + 716) = v33;
        }
        else
        {
          v59 = a1 + 2 * *(unsigned int *)(a1 + 712) + 27932;
          *(_DWORD *)(a1 + 48 + 4 * v32) = 0;
          v60 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)(a1 + 264 + 8 * v60) = v59;
          v61 = v60 + 1;
          *(_QWORD *)(a1 + 32) = v60 + 1;
          v62 = a1 + 32 * *(unsigned int *)(a1 + 712) + 2 * v25;
          *(_DWORD *)(a1 + 48 + 4 * v61) = v23 != 1;
          v63 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)(a1 + 264 + 8 * v63) = v62 + 28004;
          *(_QWORD *)(a1 + 32) = v63 + 1;
        }
        if ((_DWORD)v23 == 1)
        {
          v58 = 9;
        }
        else
        {
          length(a1, a1 + 47664, v25, v23, *(_BYTE *)(a1 + 2932));
          v58 = 8;
        }
        if (*(_DWORD *)(a1 + 712) >= 7u)
          v58 = 11;
LABEL_50:
        *(_DWORD *)(a1 + 712) = v58;
        goto LABEL_51;
      }
      *v30 = 0;
      v49 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 8 * v49 + 264) = v29;
      *(_QWORD *)(a1 + 32) = v49 + 1;
      match(a1, v25, v22 - 4, v23);
LABEL_51:
      *((_DWORD *)a2 + 7) -= v23;
      v68 = *(_QWORD *)(a1 + 696);
      if (v68)
      {
        v69 = *(_QWORD *)a1;
        v70 = *(_QWORD *)(a1 + 8);
        LODWORD(v71) = *(_DWORD *)(a1 + 16);
        v72 = *(_QWORD *)(a1 + 24);
        for (j = *(_QWORD *)(a1 + 40); ; ++j)
        {
          if (!BYTE3(v71))
          {
            if (v69 >> 24 != 255)
            {
              if (v68 - v72 <= (unint64_t)(v70 - 1))
              {
LABEL_72:
                *(_QWORD *)(a1 + 32) = 0;
                goto LABEL_73;
              }
              v72 += v70;
              v70 = 0;
            }
            ++v70;
            v69 = ((_DWORD)v69 << 8);
            LODWORD(v71) = (_DWORD)v71 << 8;
          }
          if (j == *(_QWORD *)(a1 + 32))
            break;
          switch(*(_DWORD *)(v20 + 4 * j - 216))
          {
            case 0:
              LODWORD(v71) = (v71 >> 11) * **(unsigned __int16 **)(v20 + 8 * j);
              break;
            case 1:
              v74 = (v71 >> 11) * **(unsigned __int16 **)(v20 + 8 * j);
              v69 += v74;
              LODWORD(v71) = v71 - v74;
              break;
            case 2:
              LODWORD(v71) = v71 >> 1;
              break;
            case 3:
              v71 = v71 >> 1;
              v69 += v71;
              break;
            default:
              continue;
          }
        }
        v75 = 5;
        do
        {
          if (v69 >> 24 != 255)
          {
            if (v68 - v72 <= (unint64_t)(v70 - 1))
              goto LABEL_72;
            v72 += v70;
            v70 = 0;
          }
          ++v70;
          v69 = ((_DWORD)v69 << 8);
          --v75;
        }
        while (v75);
      }
      *(_QWORD *)(a1 + 688) += v23;
      v76 = rc_encode((unint64_t *)a1, a3, a4, a5);
      result = 0;
      if ((v76 & 1) != 0)
        return result;
    }
    *v27 = 0;
    v40 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 8 * v40 + 264) = v26;
    v41 = v40 + 1;
    *(_QWORD *)(a1 + 32) = v41;
    v42 = *((_DWORD *)a2 + 6) - *((_DWORD *)a2 + 7);
    v43 = (*a2)[v42];
    v44 = a1
        + 1536
        * (((*a2)[v42 - 1] >> (8 - *(_DWORD *)(a1 + 2940))) + ((*(_DWORD *)(a1 + 2944) & v24) << *(_DWORD *)(a1 + 2940)))
        + 2948;
    if (*(_DWORD *)(a1 + 712) > 6u)
    {
      v50 = (*a2)[v42 + ~*(_DWORD *)(a1 + 716)];
      v51 = v43 | 0x100;
      v52 = 256;
      do
      {
        *(_DWORD *)(a1 + 4 * v41 + 48) = (v51 >> 7) & 1;
        v53 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 8 * v53 + 264) = v44 + 2 * (v52 + (v51 >> 8) + (v52 & (2 * v50)));
        v54 = (2 * v51) ^ (2 * v50);
        v50 *= 2;
        v41 = v53 + 1;
        *(_QWORD *)(a1 + 32) = v41;
        v52 &= ~v54;
        v55 = v51 >= 0x8000;
        v51 *= 2;
      }
      while (!v55);
    }
    else
    {
      v45 = 1;
      for (k = 7; k != -1; --k)
      {
        *(_DWORD *)(a1 + 4 * v41 + 48) = (v43 >> k) & 1;
        v47 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 8 * v47 + 264) = v44 + 2 * v45;
        v41 = v47 + 1;
        *(_QWORD *)(a1 + 32) = v41;
        v48 = (v43 >> k) & 1 | (2 * v45);
        v45 = v48;
      }
    }
    v56 = *(_DWORD *)(a1 + 712);
    v57 = v56 - 6;
    if (v56 <= 9)
      v57 = v56 - 3;
    if (v56 >= 4)
      v58 = v57;
    else
      v58 = 0;
    goto LABEL_50;
  }
  return result;
}

uint64_t rc_encode(unint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _WORD *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1[5];
  if (v4 < a1[4])
  {
    LODWORD(v5) = *((_DWORD *)a1 + 4);
    while (2)
    {
      if (!BYTE3(v5))
      {
        v6 = *a1;
        if (*a1 >> 24 != 255)
        {
          v8 = *a3;
          while (v8 != a4)
          {
            *(_BYTE *)(a2 + v8) = *((_BYTE *)a1 + 20) + *((_BYTE *)a1 + 4);
            v8 = *a3 + 1;
            *a3 = v8;
            ++a1[3];
            *((_BYTE *)a1 + 20) = -1;
            v9 = a1[1] - 1;
            a1[1] = v9;
            if (!v9)
            {
              v6 = *a1;
              *((_BYTE *)a1 + 20) = BYTE3(*a1);
              LODWORD(v5) = *((_DWORD *)a1 + 4);
              v4 = a1[5];
              v7 = 1;
              goto LABEL_10;
            }
          }
          return 1;
        }
        v7 = a1[1] + 1;
LABEL_10:
        *a1 = ((_DWORD)v6 << 8);
        a1[1] = v7;
        LODWORD(v5) = (_DWORD)v5 << 8;
        *((_DWORD *)a1 + 4) = v5;
      }
      switch(*((_DWORD *)a1 + v4 + 12))
      {
        case 0:
          v10 = (_WORD *)a1[v4 + 33];
          v11 = (unsigned __int16)*v10;
          LODWORD(v5) = (v5 >> 11) * v11;
          *((_DWORD *)a1 + 4) = v5;
          v12 = v11 + ((2048 - v11) >> 5);
          goto LABEL_14;
        case 1:
          v10 = (_WORD *)a1[v4 + 33];
          v13 = (unsigned __int16)*v10;
          v14 = (v5 >> 11) * v13;
          *a1 += v14;
          LODWORD(v5) = v5 - v14;
          *((_DWORD *)a1 + 4) = v5;
          v12 = v13 - (v13 >> 5);
LABEL_14:
          *v10 = v12;
          goto LABEL_17;
        case 2:
          LODWORD(v5) = v5 >> 1;
          *((_DWORD *)a1 + 4) = v5;
          goto LABEL_17;
        case 3:
          v5 = v5 >> 1;
          *((_DWORD *)a1 + 4) = v5;
          *a1 += v5;
          goto LABEL_17;
        case 4:
          *((_DWORD *)a1 + 4) = -1;
          v16 = *a1;
          break;
        default:
LABEL_17:
          a1[5] = ++v4;
          if (v4 >= a1[4])
            goto LABEL_18;
          continue;
      }
      break;
    }
    while (v16 >> 24 == 255)
    {
      v17 = a1[1] + 1;
LABEL_26:
      v16 = ((_DWORD)v16 << 8);
      *a1 = v16;
      a1[1] = v17;
      a1[5] = ++v4;
      if (v4 >= a1[4])
      {
        v15 = 0;
        *(_OWORD *)a1 = xmmword_2299575C0;
        *((_DWORD *)a1 + 4) = -1;
        *((_BYTE *)a1 + 20) = 0;
        a1[4] = 0;
        a1[5] = 0;
        a1[3] = 0;
        return v15;
      }
    }
    v18 = *a3;
    while (v18 != a4)
    {
      *(_BYTE *)(a2 + v18) = *((_BYTE *)a1 + 20) + *((_BYTE *)a1 + 4);
      v18 = *a3 + 1;
      *a3 = v18;
      ++a1[3];
      *((_BYTE *)a1 + 20) = -1;
      v19 = a1[1] - 1;
      a1[1] = v19;
      if (!v19)
      {
        v16 = *a1;
        *((_BYTE *)a1 + 20) = BYTE3(*a1);
        v4 = a1[5];
        v17 = 1;
        goto LABEL_26;
      }
    }
    return 1;
  }
LABEL_18:
  v15 = 0;
  a1[4] = 0;
  a1[5] = 0;
  return v15;
}

uint64_t lzma_lzma_encoder_reset(uint64_t a1, _DWORD *a2)
{
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v9;
  _WORD *v10;
  _WORD *v11;
  uint64_t v12;
  _WORD *v13;
  uint64_t i;
  uint64_t result;

  if (!is_options_valid(a2))
    return 8;
  v4 = -1 << a2[7];
  *(_DWORD *)(a1 + 2936) = ~v4;
  v5 = a2[6];
  *(_DWORD *)(a1 + 2940) = a2[5];
  *(_DWORD *)(a1 + 2944) = ~(-1 << v5);
  *(_OWORD *)a1 = xmmword_2299575C0;
  *(_DWORD *)(a1 + 16) = -1;
  *(_BYTE *)(a1 + 20) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 712) = 0u;
  *(_DWORD *)(a1 + 728) = 0;
  v6 = a2[6] + a2[5];
  v7 = 1;
  do
    memset_pattern16((void *)(a1 + 2948 + 1536 * (v7 - 1)), &unk_2299575E0, 0x600uLL);
  while (!(v7++ >> v6));
  v9 = 0;
  v10 = (_WORD *)(a1 + 27524);
  do
  {
    v11 = v10;
    v12 = -v4;
    do
    {
      *v11 = 1024;
      v11[240] = 1024;
      ++v11;
      --v12;
    }
    while (v12);
    v13 = (_WORD *)(a1 + 2 * v9);
    v13[13954] = 1024;
    v13[13966] = 1024;
    ++v9;
    v10 += 16;
    v13[13978] = 1024;
    v13[13990] = 1024;
  }
  while (v9 != 12);
  memset_pattern16((void *)(a1 + 28900), &unk_2299575E0, 0xE4uLL);
  for (i = 0; i != 512; i += 128)
    memset_pattern16((void *)(a1 + 28388 + i), &unk_2299575E0, 0x80uLL);
  memset_pattern16((void *)(a1 + 29128), &unk_2299575E0, 0x20uLL);
  length_encoder_reset((_DWORD *)(a1 + 29160), 1 << a2[7], *(_BYTE *)(a1 + 2932));
  length_encoder_reset((_DWORD *)(a1 + 47664), 1 << a2[7], *(_BYTE *)(a1 + 2932));
  result = 0;
  *(_DWORD *)(a1 + 69244) = 0x7FFFFFFF;
  *(_QWORD *)(a1 + 69312) = 0x7FFFFFFFLL;
  *(_DWORD *)(a1 + 69320) = 0;
  return result;
}

BOOL is_options_valid(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  BOOL v5;

  v1 = a1[5];
  if (v1 > 4)
    return 0;
  v2 = a1[6];
  v3 = v2 + v1;
  if (v2 <= 4)
  {
    v4 = v3 >= 4;
    v5 = v3 == 4;
  }
  else
  {
    v4 = 1;
    v5 = 0;
  }
  return (v5 || !v4) && a1[7] <= 4u && (a1[9] - 2) <= 0x10F && (a1[8] - 1) < 2;
}

void length_encoder_reset(_DWORD *a1, unsigned int a2, char a3)
{
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;

  *a1 = 67109888;
  if (a2)
  {
    v6 = 0;
    v7 = 16 * a2;
    do
    {
      memset_pattern16(&a1[v6 / 4 + 1], &unk_2299575E0, 0x10uLL);
      memset_pattern16(&a1[v6 / 4 + 65], &unk_2299575E0, 0x10uLL);
      v6 += 16;
    }
    while (v7 != v6);
    memset_pattern16(a1 + 129, &unk_2299575E0, 0x200uLL);
    if ((a3 & 1) == 0)
    {
      v8 = 0;
      do
        length_update_prices((uint64_t)a1, v8++);
      while (a2 != v8);
    }
  }
  else
  {
    memset_pattern16(a1 + 129, &unk_2299575E0, 0x200uLL);
  }
}

uint64_t lzma_lzma_encoder_create(void **a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  void *v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v9 = *a1;
  if (!v9)
  {
    v9 = lzma_alloc(0x3CED0uLL, a2);
    *a1 = v9;
    if (!v9)
      return 5;
  }
  v10 = a4[8];
  if (v10 == 2)
  {
    *((_BYTE *)v9 + 2932) = 0;
    if (*a4 > 0x60000000)
      return 8;
    v11 = 0;
    v12 = -2;
    do
    {
      v13 = 1 << v11++;
      v12 += 2;
    }
    while (v13 < *a4);
    *((_DWORD *)v9 + 17310) = v12;
    v14 = a4[10] & 0xF;
    if (v14 <= a4[9])
      v14 = a4[9];
    v15 = v14 - 1;
    *((_DWORD *)v9 + 11899) = v15;
    *((_DWORD *)v9 + 16525) = v15;
  }
  else
  {
    if (v10 != 1)
      return 8;
    *((_BYTE *)v9 + 2932) = 1;
  }
  v16 = *((_QWORD *)a4 + 1);
  if (v16)
    v17 = a4[4] != 0;
  else
    v17 = 0;
  *((_BYTE *)v9 + 2933) = v17;
  *((_BYTE *)v9 + 2934) = 0;
  *((_QWORD *)v9 + 86) = 0;
  *((_QWORD *)v9 + 88) = 0;
  *((_QWORD *)v9 + 87) = 0;
  *((_BYTE *)v9 + 2935) = a3 == 0x4000000000000001;
  if (a3 != 0x4000000000000002)
    goto LABEL_18;
  v18 = a4[12];
  if (v18 > 1)
    return 8;
  *((_BYTE *)v9 + 2935) = v18;
LABEL_18:
  v19 = *a4;
  *(_QWORD *)a5 = 4096;
  *(_QWORD *)(a5 + 8) = v19;
  *(_OWORD *)(a5 + 16) = xmmword_2299575D0;
  LODWORD(v20) = a4[9];
  v21 = *((_QWORD *)a4 + 5);
  *(_QWORD *)(a5 + 40) = v21;
  if ((v21 & 0xFu) <= v20)
    v20 = v20;
  else
    v20 = v21 & 0xF;
  *(_QWORD *)(a5 + 32) = v20;
  *(_QWORD *)(a5 + 48) = v16;
  *(_DWORD *)(a5 + 56) = a4[4];
  return lzma_lzma_encoder_reset((uint64_t)v9, a4);
}

uint64_t lzma_lzma_encoder_init(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  return lzma_lz_encoder_init(a1, a2, a3, (uint64_t (*)(_QWORD *, _QWORD *, _QWORD, _QWORD, _OWORD *))lzma_encoder_init);
}

uint64_t lzma_encoder_init(void **a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  a1[1] = lzma_encode;
  a1[4] = lzma_lzma_set_out_limit;
  return lzma_lzma_encoder_create(a1, a2, a3, a4, a5);
}

uint64_t lzma_lzma_encoder_memusage(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7[2];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!is_options_valid(a1))
    return -1;
  v2 = *a1;
  v7[0] = 4096;
  v7[1] = v2;
  v8 = xmmword_2299575D0;
  LODWORD(v3) = a1[9];
  v10 = *((_QWORD *)a1 + 5);
  if ((v10 & 0xFu) <= v3)
    v3 = v3;
  else
    v3 = v10 & 0xF;
  v4 = *((_QWORD *)a1 + 1);
  v9 = v3;
  v11 = v4;
  v12 = 0;
  LODWORD(v12) = a1[4];
  v5 = lzma_lz_encoder_memusage(v7);
  if (v5 == -1)
    return -1;
  else
    return v5 + 249552;
}

uint64_t lzma_lzma_lclppb_encode(_DWORD *a1, _BYTE *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v5;
  uint64_t result;

  v2 = a1[5];
  if (v2 > 4)
    return 1;
  v3 = a1[6];
  if (v3 > 4 || v3 + v2 > 4)
    return 1;
  v5 = a1[7];
  if (v5 > 4)
    return 1;
  result = 0;
  *a2 = 9 * (5 * v5 + v3) + v2;
  return result;
}

uint64_t lzma_lzma_props_encode(_DWORD *a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v6;
  uint64_t result;

  if (!a1)
    return 11;
  v3 = a1[5];
  if (v3 > 4)
    return 11;
  v4 = a1[6];
  if (v4 > 4 || v4 + v3 > 4)
    return 11;
  v6 = a1[7];
  if (v6 > 4)
    return 11;
  result = 0;
  *(_BYTE *)a2 = 9 * (5 * v6 + v4) + v3;
  *(_DWORD *)(a2 + 1) = *a1;
  return result;
}

BOOL lzma_mode_is_supported(int a1)
{
  return (a1 - 1) < 2;
}

double match(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  _DWORD *v7;
  int v8;
  unsigned int v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int i;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  double result;

  v7 = (_DWORD *)(a1 + 69244);
  if (*(_DWORD *)(a1 + 712) >= 7u)
    v8 = 10;
  else
    v8 = 7;
  *(_DWORD *)(a1 + 712) = v8;
  length(a1, a1 + 29160, a2, a4, *(_BYTE *)(a1 + 2932));
  if (a3 >> 13)
  {
    if (a3 >> 25)
      v9 = lzma_fastpos[(unint64_t)a3 >> 24] + 48;
    else
      v9 = lzma_fastpos[(unint64_t)a3 >> 12] + 24;
  }
  else
  {
    v9 = lzma_fastpos[a3];
  }
  v10 = (double *)(a1 + 716);
  LODWORD(v11) = a4 - 2;
  if (a4 >= 6)
    v11 = 3;
  else
    v11 = v11;
  v12 = a1 + (v11 << 7) + 28388;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = 1;
  for (i = 5; i != -1; --i)
  {
    *(_DWORD *)(a1 + 4 * v13 + 48) = (v9 >> i) & 1;
    v16 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 8 * v16 + 264) = v12 + 2 * v14;
    v13 = v16 + 1;
    *(_QWORD *)(a1 + 32) = v13;
    v17 = (v9 >> i) & 1 | (2 * v14);
    v14 = v17;
  }
  if (v9 >= 4)
  {
    v18 = (v9 >> 1) - 1;
    v19 = (v9 & 1 | 2) << ((v9 >> 1) - 1);
    v20 = a3 - v19;
    if (v9 > 0xD)
    {
      v24 = (v9 >> 1) - 6;
      do
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v25 + 1;
        *(_DWORD *)(a1 + 4 * v25 + 48) = (v20 >> 4 >> v24--) & 1 | 2;
      }
      while (v24 != -1);
      v26 = v20 & 0xF;
      v27 = *(_QWORD *)(a1 + 32);
      v28 = 1;
      v29 = -4;
      do
      {
        *(_DWORD *)(a1 + 4 * v27 + 48) = v26 & 1;
        v30 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 8 * v30 + 264) = a1 + 29128 + 2 * v28;
        v27 = v30 + 1;
        *(_QWORD *)(a1 + 32) = v27;
        v28 = v26 & 1 | (2 * v28);
        v26 >>= 1;
      }
      while (!__CFADD__(v29++, 1));
      ++v7[17];
    }
    else
    {
      v21 = a1 + 2 * v19 - 2 * v9 + 28898;
      v22 = 1;
      do
      {
        *(_DWORD *)(a1 + 4 * v13 + 48) = v20 & 1;
        v23 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 8 * v23 + 264) = v21 + 2 * v22;
        v13 = v23 + 1;
        *(_QWORD *)(a1 + 32) = v13;
        v22 = v20 & 1 | (2 * v22);
        v20 >>= 1;
        --v18;
      }
      while (v18);
    }
  }
  *(_DWORD *)(a1 + 728) = *(_DWORD *)(a1 + 724);
  result = *v10;
  *(double *)(a1 + 720) = *v10;
  *(_DWORD *)(a1 + 716) = a3;
  ++*v7;
  return result;
}

uint64_t length(uint64_t result, uint64_t a2, unsigned int a3, int a4, char a5)
{
  unsigned int v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int k;
  uint64_t v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int j;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  int i;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;

  v5 = a4 - 2;
  v6 = (_DWORD *)(result + 4 * *(_QWORD *)(result + 32) + 48);
  if ((a4 - 2) > 7)
  {
    v13 = 1;
    *v6 = 1;
    v14 = *(_QWORD *)(result + 32);
    *(_QWORD *)(result + 8 * v14 + 264) = a2;
    v15 = v14 + 1;
    *(_QWORD *)(result + 32) = v14 + 1;
    v16 = a4 - 10;
    v17 = a2 + 2;
    v18 = (_DWORD *)(result + 4 * v15 + 48);
    if ((a4 - 10) > 7)
    {
      *v18 = 1;
      v25 = *(_QWORD *)(result + 32);
      *(_QWORD *)(result + 8 * v25 + 264) = v17;
      v26 = v25 + 1;
      *(_QWORD *)(result + 32) = v25 + 1;
      v27 = a4 - 18;
      for (i = 7; i != -1; --i)
      {
        *(_DWORD *)(result + 4 * v26 + 48) = (v27 >> i) & 1;
        v29 = *(_QWORD *)(result + 32);
        *(_QWORD *)(result + 8 * v29 + 264) = a2 + 516 + 2 * v13;
        v26 = v29 + 1;
        *(_QWORD *)(result + 32) = v26;
        v30 = (v27 >> i) & 1 | (2 * v13);
        v13 = v30;
      }
    }
    else
    {
      *v18 = 0;
      v19 = *(_QWORD *)(result + 32);
      *(_QWORD *)(result + 8 * v19 + 264) = v17;
      v20 = v19 + 1;
      *(_QWORD *)(result + 32) = v19 + 1;
      v21 = 1;
      for (j = 2; j != -1; --j)
      {
        *(_DWORD *)(result + 4 * v20 + 48) = (v16 >> j) & 1;
        v23 = *(_QWORD *)(result + 32);
        *(_QWORD *)(result + 8 * v23 + 264) = a2 + 16 * a3 + 260 + 2 * v21;
        v20 = v23 + 1;
        *(_QWORD *)(result + 32) = v20;
        v24 = (v16 >> j) & 1 | (2 * v21);
        v21 = v24;
      }
    }
  }
  else
  {
    *v6 = 0;
    v7 = *(_QWORD *)(result + 32);
    *(_QWORD *)(result + 8 * v7 + 264) = a2;
    v8 = v7 + 1;
    *(_QWORD *)(result + 32) = v7 + 1;
    v9 = 1;
    for (k = 2; k != -1; --k)
    {
      *(_DWORD *)(result + 4 * v8 + 48) = (v5 >> k) & 1;
      v11 = *(_QWORD *)(result + 32);
      *(_QWORD *)(result + 8 * v11 + 264) = a2 + 16 * a3 + 4 + 2 * v9;
      v8 = v11 + 1;
      *(_QWORD *)(result + 32) = v8;
      v12 = (v5 >> k) & 1 | (2 * v9);
      v9 = v12;
    }
  }
  if ((a5 & 1) == 0)
  {
    v31 = a2 + 4 * a3;
    v32 = *(_DWORD *)(v31 + 18440) - 1;
    *(_DWORD *)(v31 + 18440) = v32;
    if (!v32)
      return length_update_prices(a2, a3);
  }
  return result;
}

uint64_t length_update_prices(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;

  v2 = *(unsigned int *)(result + 18436);
  *(_DWORD *)(result + 4 * a2 + 18440) = v2;
  v3 = (unint64_t)*(unsigned __int16 *)result >> 4;
  v4 = lzma_rc_prices[v3 ^ 0x7F];
  v5 = (unint64_t)*(unsigned __int16 *)(result + 2) >> 4;
  v6 = lzma_rc_prices[v5];
  v7 = lzma_rc_prices[v5 ^ 0x7F];
  v8 = result + 1088 * a2 + 1028;
  if (v2 >= 8)
    v9 = 8;
  else
    v9 = v2;
  if ((_DWORD)v9)
  {
    v10 = 0;
    v11 = lzma_rc_prices[v3];
    do
    {
      v12 = 0;
      v13 = v10 + 8;
      do
      {
        v14 = v13 >> 1;
        if ((v13 & 1) != 0)
          v15 = 2032;
        else
          v15 = 0;
        v12 += lzma_rc_prices[(v15 ^ (unint64_t)*(unsigned __int16 *)(result + 16 * a2 + 4 + 2 * v14)) >> 4];
        v13 >>= 1;
      }
      while (v14 != 1);
      *(_DWORD *)(v8 + 4 * v10++) = v12 + v11;
    }
    while (v10 != v9);
  }
  if (v2 >= 0x10)
    v16 = 16;
  else
    v16 = v2;
  if (v9 < v16)
  {
    v17 = v6 + v4;
    v18 = result + 16 * a2 + 260;
    do
    {
      v19 = 0;
      v20 = v9;
      do
      {
        v21 = v20 >> 1;
        if ((v20 & 1) != 0)
          v22 = 2032;
        else
          v22 = 0;
        v19 += lzma_rc_prices[(v22 ^ (unint64_t)*(unsigned __int16 *)(v18 + 2 * v21)) >> 4];
        v20 >>= 1;
      }
      while (v21 != 1);
      *(_DWORD *)(v8 + 4 * v9++) = v17 + v19;
    }
    while (v9 != v16);
    LODWORD(v9) = v16;
  }
  if (v9 < v2)
  {
    v23 = v7 + v4;
    v24 = result + 516;
    v9 = v9;
    do
    {
      v25 = 0;
      v26 = v9 + 240;
      do
      {
        v27 = v26 >> 1;
        if ((v26 & 1) != 0)
          result = 2032;
        else
          result = 0;
        v25 += lzma_rc_prices[(result ^ (unint64_t)*(unsigned __int16 *)(v24 + 2 * v27)) >> 4];
        v26 >>= 1;
      }
      while (v27 != 1);
      *(_DWORD *)(v8 + 4 * v9++) = v23 + v25;
    }
    while (v9 != v2);
  }
  return result;
}

uint64_t lzma_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (*(_DWORD *)(a2 + 104) == 1)
    return 8;
  else
    return lzma_lzma_encode(a1, (unsigned __int8 **)a2, a3, a4, a5, 0xFFFFFFFF);
}

uint64_t lzma_lzma_set_out_limit(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 < 6)
    return 10;
  result = 0;
  *(_QWORD *)(a1 + 696) = a3;
  *(_QWORD *)(a1 + 704) = a2;
  *(_BYTE *)(a1 + 2935) = 0;
  return result;
}

uint64_t lzma_lzma_preset(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v2 = a2 & 0x1F;
  v3 = 1;
  if ((a2 & 0x1Fu) <= 9 && (a2 & 0x7FFFFFE0) == 0)
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_OWORD *)(a1 + 16) = xmmword_229957600;
    *(_DWORD *)a1 = 1 << lzma_lzma_preset_dict_pow2[v2];
    if (v2 > 3)
    {
      v7 = 0;
      if ((_DWORD)v2 == 5)
        v9 = 32;
      else
        v9 = 64;
      if ((_DWORD)v2 == 4)
        v6 = 16;
      else
        v6 = v9;
      v5 = 20;
      v8 = 2;
    }
    else
    {
      if ((a2 & 0x1F) != 0)
        v5 = 4;
      else
        v5 = 3;
      if (v2 >= 2)
        v6 = 273;
      else
        v6 = 128;
      v7 = lzma_lzma_preset_depths[v2];
      v8 = 1;
    }
    *(_DWORD *)(a1 + 32) = v8;
    *(_DWORD *)(a1 + 36) = v6;
    *(_DWORD *)(a1 + 40) = v5;
    *(_DWORD *)(a1 + 44) = v7;
    if (a2 < 0)
    {
      v10 = 0;
      *(_DWORD *)(a1 + 32) = 2;
      *(_DWORD *)(a1 + 40) = 20;
      v11 = 192;
      if ((_DWORD)v2 != 3 && (_DWORD)v2 != 5)
      {
        v10 = 512;
        v11 = 273;
      }
      v3 = 0;
      *(_DWORD *)(a1 + 36) = v11;
      *(_DWORD *)(a1 + 44) = v10;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t lzma_outq_memusage(unint64_t a1, unsigned int a2)
{
  if (a2 <= 0x4000 && HIWORD(a1) == 0)
    return (a1 + 64) * 2 * a2;
  else
    return -1;
}

uint64_t *lzma_outq_clear_cache(uint64_t a1, uint64_t a2)
{
  uint64_t *result;
  uint64_t v5;
  uint64_t v6;

  for (result = *(uint64_t **)(a1 + 24); result; result = *(uint64_t **)(a1 + 24))
  {
    v5 = *result;
    --*(_DWORD *)(a1 + 52);
    v6 = *(_QWORD *)(a1 + 32) - result[2] - 64;
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = v6;
    lzma_free(result, a2);
  }
  return result;
}

void lzma_outq_clear_cache2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(uint64_t **)(a1 + 24);
  if (v4)
  {
    while (1)
    {
      v7 = *v4;
      if (!*v4)
        break;
      --*(_DWORD *)(a1 + 52);
      v8 = *(_QWORD *)(a1 + 32) - v4[2] - 64;
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = v8;
      lzma_free(v4, a2);
      v4 = *(uint64_t **)(a1 + 24);
    }
    v9 = v4[2];
    if (v9 != a3)
    {
      --*(_DWORD *)(a1 + 52);
      v10 = *(_QWORD *)(a1 + 32) - v9 - 64;
      *(_QWORD *)(a1 + 24) = 0;
      *(_QWORD *)(a1 + 32) = v10;
      lzma_free(v4, a2);
    }
  }
}

uint64_t lzma_outq_init(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;

  if (a3 > 0x4000)
    return 8;
  v6 = 2 * a3;
  while (*(_QWORD *)a1)
    move_head_to_cache((uint64_t *)a1, a2);
  while (1)
  {
    v11 = *(_DWORD *)(a1 + 52);
    if (v6 >= v11)
      break;
    v7 = *(uint64_t **)(a1 + 24);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *v7;
    *(_DWORD *)(a1 + 52) = v11 - 1;
    v10 = v8 - v7[2] - 64;
    *(_QWORD *)(a1 + 24) = v9;
    *(_QWORD *)(a1 + 32) = v10;
    lzma_free(v7, a2);
  }
  result = 0;
  *(_DWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t *move_head_to_cache(uint64_t *result, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result;
  v3 = (_QWORD *)*result;
  v4 = *(_QWORD *)*result;
  *result = v4;
  if (!v4)
    result[1] = 0;
  v5 = result[3];
  if (v5 && *(_QWORD *)(v5 + 16) != v3[2])
  {
    result = lzma_outq_clear_cache((uint64_t)result, a2);
    v5 = v2[3];
  }
  *v3 = v5;
  v2[3] = (uint64_t)v3;
  --*((_DWORD *)v2 + 12);
  v2[5] = v2[5] - v3[2] - 64;
  return result;
}

uint64_t *lzma_outq_end(uint64_t *a1, uint64_t a2)
{
  while (*a1)
    move_head_to_cache(a1, a2);
  return lzma_outq_clear_cache((uint64_t)a1, a2);
}

uint64_t lzma_outq_prealloc_buf(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v6 = *(_QWORD *)(a1 + 24);
  if (v6 && *(_QWORD *)(v6 + 16) == a3)
    return 0;
  if (a3 > 0xFFFFFFFFFFFFFFBFLL)
    return 5;
  v8 = a3 + 64;
  lzma_outq_clear_cache(a1, a2);
  v9 = lzma_alloc(a3 + 64, a2);
  *(_QWORD *)(a1 + 24) = v9;
  if (!v9)
    return 5;
  v10 = v9;
  result = 0;
  *v10 = 0;
  v10[2] = a3;
  ++*(_DWORD *)(a1 + 52);
  *(_QWORD *)(a1 + 32) += v8;
  return result;
}

uint64_t lzma_outq_get_buf(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)v2;
  *(_QWORD *)v2 = 0;
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    v3 = (_QWORD *)a1;
  *v3 = v2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(v2 + 8) = a2;
  *(_BYTE *)(v2 + 40) = 0;
  *(_DWORD *)(v2 + 44) = 1;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  ++*(_DWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) += *(_QWORD *)(v2 + 16) + 64;
  return v2;
}

BOOL lzma_outq_is_readable(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if (!*a1)
    return 0;
  if ((unint64_t)a1[2] >= *(_QWORD *)(v1 + 24))
    return *(_BYTE *)(v1 + 40) != 0;
  return 1;
}

uint64_t lzma_outq_read(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  if (!*((_DWORD *)a1 + 12))
    return 0;
  v11 = a1 + 2;
  v12 = *a1;
  lzma_bufcpy(*a1 + 64, a1 + 2, *(_QWORD *)(*a1 + 24), a3, a4, a5);
  if (!*(_BYTE *)(v12 + 40) || *v11 < *(_QWORD *)(v12 + 24))
    return 0;
  if (a6)
    *a6 = *(_QWORD *)(v12 + 48);
  if (a7)
    *a7 = *(_QWORD *)(v12 + 56);
  v13 = *(unsigned int *)(v12 + 44);
  move_head_to_cache(a1, a2);
  a1[2] = 0;
  return v13;
}

_QWORD *lzma_outq_enable_partial_output(_QWORD *result, uint64_t (*a2)(void))
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *result;
  if (*result && !*(_BYTE *)(v2 + 40))
  {
    v3 = result;
    result = *(_QWORD **)(v2 + 8);
    if (result)
    {
      result = (_QWORD *)a2();
      *(_QWORD *)(*v3 + 8) = 0;
    }
  }
  return result;
}

uint64_t lzma_lzma_optimum_fast(uint64_t result, uint64_t a2, _DWORD *a3, unsigned int *a4)
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  int v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v32;
  size_t v33;
  unsigned int v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;

  v7 = result;
  v8 = *(_DWORD *)(a2 + 96);
  v38 = 0;
  if (*(_DWORD *)(a2 + 28))
  {
    v9 = *(_DWORD *)(result + 2928);
    v38 = *(_DWORD *)(result + 2924);
  }
  else
  {
    result = lzma_mf_find(a2, &v38, result + 732);
    v9 = result;
  }
  v10 = *(unsigned int *)(a2 + 24);
  v11 = *(_DWORD *)(a2 + 36) - v10;
  if ((v11 + 1) < 0x111)
    v12 = (v11 + 1);
  else
    v12 = 273;
  if (v12 >= 2)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = (char *)(*(_QWORD *)a2 + v10);
    do
    {
      v17 = *(unsigned int *)(v7 + 4 * v13 + 716);
      if (*(unsigned __int16 *)(v16 - 1) == *(unsigned __int16 *)&v16[-v17 - 2])
      {
        if ((_DWORD)v12 == 2)
        {
          v18 = 2;
        }
        else
        {
          v19 = 0;
          v20 = &v16[-v17];
          while (1)
          {
            result = *(unsigned int *)&v20[v19];
            v21 = *(_DWORD *)&v16[v19 + 1] - result;
            if (v21)
              break;
            v22 = v19 + 6;
            v19 += 4;
            if (v22 >= v12)
            {
              v18 = v12;
              goto LABEL_22;
            }
          }
          v23 = v19 + 2;
          v24 = v19 + 4;
          result = HIWORD(v21);
          if ((_WORD)v21)
          {
            v24 = v23;
            v25 = v21;
          }
          else
          {
            v25 = BYTE2(v21);
          }
          v18 = v24 | (v25 == 0);
          if (v18 >= v12)
            v18 = v12;
        }
LABEL_22:
        if (v18 >= v8)
        {
          *a3 = v13;
          *a4 = v18;
          v32 = v18 - 1;
          if (v18 == 1)
            return result;
          goto LABEL_51;
        }
        if (v18 > v15)
        {
          v15 = v18;
          v14 = v13;
        }
      }
      ++v13;
    }
    while (v13 != 4);
    if (v9 >= v8)
    {
      *a3 = *(_DWORD *)(v7 + 8 * (v38 - 1) + 736) + 4;
      *a4 = v9;
      v32 = v9 - 1;
      if (v9 == 1)
        return result;
      goto LABEL_51;
    }
    if (v9 < 2)
    {
      v27 = 0;
    }
    else
    {
      v26 = v38;
      v27 = *(_DWORD *)(v7 + 8 * (v38 - 1) + 736);
      if (v38 >= 2)
      {
        v28 = (unsigned int *)(v7 + 8 * v38 + 720);
        do
        {
          v29 = *(v28 - 1);
          if (v9 != v29 + 1)
            break;
          v30 = *v28;
          if (*v28 >= v27 >> 7)
            break;
          v28 -= 2;
          v38 = --v26;
          v27 = v30;
          v9 = v29;
        }
        while (v26 > 1);
      }
      if (v27 > 0x7F && v9 == 2)
        v9 = 1;
    }
    if (v15 >= 2 && (v15 + 1 >= v9 || v15 + 2 >= v9 && v27 > 0x200 || v15 + 3 >= v9 && v27 > 0x8000))
    {
      *a3 = v14;
      *a4 = v15;
      v32 = v15 - 1;
LABEL_51:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a2, v32);
      *(_DWORD *)(a2 + 28) += v32;
      return result;
    }
    if (v12 >= 3)
    {
      LODWORD(v33) = v9 - 1;
      if (v9 > 1)
      {
        result = lzma_mf_find(a2, (_DWORD *)(v7 + 2924), v7 + 732);
        *(_DWORD *)(v7 + 2928) = result;
        if (result < 2)
          goto LABEL_64;
        v34 = *(_DWORD *)(v7 + 8 * (*(_DWORD *)(v7 + 2924) - 1) + 736);
        if (result < v9 || v34 >= v27)
        {
          v35 = (_DWORD)result == v9 + 1;
          if (v27 < v34 >> 7)
            v35 = 0;
          if (result <= v9 + 1 && !v35 && (v9 < 3 || (int)result + 1 < v9 || v27 >> 7 <= v34))
          {
LABEL_64:
            v36 = 0;
            if (v33 <= 2)
              v33 = 2;
            else
              v33 = v33;
            v37 = v7 + 716;
            while (1)
            {
              result = memcmp(v16, &v16[-*(unsigned int *)(v37 + v36) - 1], v33);
              if (!(_DWORD)result)
                break;
              v36 += 4;
              if (v36 == 16)
              {
                *a3 = v27 + 4;
                *a4 = v9;
                v32 = v9 - 2;
                if (v9 != 2)
                  goto LABEL_51;
                return result;
              }
            }
          }
        }
      }
    }
  }
  *a3 = -1;
  *a4 = 1;
  return result;
}

uint64_t lzma_lzma_optimum_normal(uint64_t result, uint64_t a2, unsigned int *a3, unsigned int *a4, int a5)
{
  unsigned int *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int *v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned int *v40;
  unsigned int *v41;
  uint64_t i;
  int v43;
  unsigned int v44;
  int v45;
  unsigned int v46;
  int v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  int v55;
  unsigned __int8 *v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unint64_t v61;
  int v62;
  int v63;
  char v64;
  unsigned int v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  int v71;
  int v72;
  int v73;
  unint64_t v74;
  unint64_t v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  uint64_t v79;
  unsigned int v80;
  uint64_t v81;
  unsigned __int16 *v82;
  unsigned __int16 *v83;
  unsigned __int16 *v84;
  unsigned __int16 *v85;
  unsigned int v86;
  unint64_t v87;
  int v88;
  unint64_t v89;
  int v90;
  int v91;
  int *v92;
  int v93;
  int v94;
  unsigned int v95;
  _DWORD *v96;
  uint64_t v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  int v111;
  int v112;
  unsigned int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  BOOL v120;
  unsigned int v121;
  BOOL v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unsigned __int8 *v126;
  int v127;
  int v128;
  unint64_t v129;
  int v130;
  int v131;
  char v132;
  unsigned int v133;
  unint64_t v134;
  unsigned int v135;
  unsigned int *v136;
  unsigned int v137;
  BOOL v138;
  uint64_t v139;
  int v140;
  unint64_t v141;
  unsigned int v142;
  _DWORD *v143;
  uint64_t v144;
  unsigned int v145;
  uint64_t v146;
  unsigned __int16 *v147;
  int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  int v153;
  uint64_t v154;
  unsigned int v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _DWORD *v163;
  unsigned int v164;
  unsigned int *v165;
  uint64_t v166;
  uint64_t v167;
  unsigned __int16 *v168;
  uint64_t v169;
  unsigned int v170;
  unsigned __int8 *v171;
  unsigned int v172;
  unsigned int v173;
  int v174;
  unsigned int v175;
  unsigned int v176;
  unint64_t v177;
  _DWORD *v178;
  unint64_t v179;
  int v180;
  unint64_t v181;
  int v182;
  int v183;
  uint64_t v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int *v187;
  uint64_t v188;
  unsigned int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  unsigned int v193;
  int v194;
  int literal_price;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  int v199;
  unsigned int v200;
  uint64_t v201;
  uint64_t v202;
  _DWORD *v203;
  unsigned int v204;
  unsigned int *v205;
  uint64_t v206;
  unsigned int v207;
  unsigned int v208;
  uint64_t v209;
  unsigned int v210;
  unsigned int v211;
  unsigned int v212;
  unint64_t v213;
  _DWORD *v214;
  unsigned int v215;
  int v216;
  uint64_t v217;
  uint64_t v218;
  unint64_t v219;
  char v220;
  uint64_t v221;
  char v222;
  uint64_t v223;
  int v224;
  unsigned int j;
  unsigned int v226;
  uint64_t v227;
  int v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int *v231;
  uint64_t v232;
  unsigned __int8 *v233;
  unsigned int v234;
  unsigned int v235;
  int v236;
  unsigned int v237;
  int v238;
  uint64_t v239;
  unint64_t v240;
  unint64_t v241;
  int v242;
  unsigned int v243;
  unsigned int v244;
  unint64_t v245;
  _DWORD *v246;
  unsigned int v247;
  unsigned int *v248;
  uint64_t v249;
  unsigned int v250;
  int v251;
  unsigned int v252;
  int v253;
  int v254;
  uint64_t v255;
  unint64_t v256;
  unsigned int v257;
  uint64_t v258;
  int v259;
  char v260;
  uint64_t v261;
  uint64_t v262;
  unsigned int v263;
  unsigned int *v264;
  uint64_t v265;
  int v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  int *v270;
  int v271;
  unsigned int v272;
  int v273;
  unsigned int *v274;
  unsigned int *v275;
  int *v276;
  unsigned int *v277;
  uint64_t v278;
  int v279;
  unint64_t v280;
  unsigned int v281;
  uint64_t v282;
  unsigned int v283;
  unint64_t v284;
  unsigned int v285;
  int v286;
  unsigned __int16 *v287;
  uint64_t v288;
  unsigned __int16 *v289;
  uint64_t v290;
  int v291;
  unsigned __int16 *v292;
  unsigned int v294;
  int v295;
  int v296;
  unsigned int v297;
  uint64_t v298;
  unsigned int v299;
  uint64_t v300;
  uint64_t v301;
  unsigned int v302;
  unsigned __int16 *v303;
  int v304;
  unsigned int v305;
  unsigned int v306;
  uint64_t v307;
  int v308;
  int v309;
  int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned __int8 *v313;
  unsigned int v314;
  unsigned int v315;
  unsigned int v316;
  unsigned int v317;
  unsigned int v318;
  uint64_t v319;
  unint64_t v320;
  unsigned __int16 *v321;
  unsigned __int8 *v322;
  int v323;
  __int128 v324;
  uint64_t v325;

  v5 = a3;
  v6 = result;
  v325 = *MEMORY[0x24BDAC8D0];
  v7 = (unsigned int *)(result + 67208);
  v8 = *(_DWORD *)(result + 69320);
  if (*(_DWORD *)(result + 69316) != v8)
  {
    v13 = *(_DWORD *)(result + 44 * v8 + 69344);
    v12 = *(_DWORD *)(result + 44 * v8 + 69348);
    *a4 = v13 - v8;
    *a3 = v12;
    *(_DWORD *)(result + 69320) = v13;
    return result;
  }
  if (*(_DWORD *)(a2 + 28))
  {
    v10 = *(_DWORD *)(a2 + 96);
    v11 = *(_DWORD *)(result + 2928);
    v323 = *(_DWORD *)(result + 2924);
  }
  else
  {
    if (*(_DWORD *)(result + 69244) >= 0x80u)
    {
      v14 = 0;
      v15 = result + 66224;
      do
      {
        v16 = (_OWORD *)(v6 + (v14 << 8) + 66168);
        if (v7[508])
        {
          v17 = 0;
          do
          {
            v18 = 0;
            v19 = v17 + 64;
            do
            {
              v20 = v19 >> 1;
              if ((v19 & 1) != 0)
                v21 = 2032;
              else
                v21 = 0;
              v18 += lzma_rc_prices[(v21 ^ (unint64_t)*(unsigned __int16 *)(v6 + (v14 << 7) + 28388 + 2 * v20)) >> 4];
              v19 >>= 1;
            }
            while (v20 != 1);
            *((_DWORD *)v16 + v17++) = v18;
            v22 = v7[508];
          }
          while (v17 < v22);
          if (v22 >= 0xF)
          {
            v23 = 0;
            v24 = 112;
            do
            {
              *(_DWORD *)(v15 + 4 * v23) = *(_DWORD *)(v15 + 4 * v23) + (v24 & 0xFFFFFFF0) - 80;
              v25 = v23 + 15;
              ++v23;
              v24 += 8;
            }
            while (v25 < v7[508]);
          }
        }
        *(_OWORD *)(v6 + (v14++ << 9) + 67192) = *v16;
        v15 += 256;
      }
      while (v14 != 4);
      v26 = 4u;
      v27 = v7;
      do
      {
        v28 = 0;
        v29 = lzma_fastpos[v26];
        v30 = (v29 >> 1) - 1;
        v31 = (lzma_fastpos[v26] & 1 | 2) << ((lzma_fastpos[v26] >> 1) - 1);
        v32 = v6 + 28900 + 2 * v31 - 2 * v29 - 2;
        v33 = v26 - v31;
        v34 = 1;
        do
        {
          v35 = v33 & 1;
          v33 >>= 1;
          if (v35)
            v36 = 2032;
          else
            v36 = 0;
          v28 += lzma_rc_prices[(v36 ^ (unint64_t)*(unsigned __int16 *)(v32 + 2 * v34)) >> 4];
          v34 = v35 | (2 * v34);
          --v30;
        }
        while (v30);
        v37 = 0;
        v38 = v6 + 66168 + 4 * v29;
        v39 = v27;
        do
        {
          *v39 = *(_DWORD *)(v38 + v37) + v28;
          v37 += 256;
          v39 += 128;
        }
        while (v37 != 1024);
        ++v26;
        ++v27;
      }
      while (v26 != 128);
      v7[509] = 0;
    }
    v40 = v5;
    v41 = a4;
    if (v7[526] >= 0x10)
    {
      for (i = 0; i != 16; ++i)
      {
        v43 = 0;
        v44 = 1;
        v45 = -4;
        v46 = i;
        do
        {
          v47 = v46 & 1;
          v46 >>= 1;
          if (v47)
            v48 = 2032;
          else
            v48 = 0;
          v43 += lzma_rc_prices[(v48 ^ (unint64_t)*(unsigned __int16 *)(v6 + 29128 + 2 * v44)) >> 4];
          v44 = v47 | (2 * v44);
          v49 = __CFADD__(v45++, 1);
        }
        while (!v49);
        *(_DWORD *)(v6 + 4 * i + 69248) = v43;
      }
      v7[526] = 0;
    }
    v10 = *(_DWORD *)(a2 + 96);
    v323 = 0;
    result = lzma_mf_find(a2, &v323, v6 + 732);
    v11 = result;
    a4 = v41;
    v5 = v40;
  }
  v50 = *(unsigned int *)(a2 + 24);
  v51 = *(_DWORD *)(a2 + 36) - v50 + 1;
  if (v51 > 0x110)
  {
    v51 = 273;
  }
  else if (v51 <= 1)
  {
LABEL_65:
    *v5 = -1;
    *a4 = 1;
    return result;
  }
  v52 = 0;
  v53 = 0;
  v54 = *(_QWORD *)a2 + v50;
  v55 = *(unsigned __int16 *)(v54 - 1);
  v56 = (unsigned __int8 *)(v54 - 2);
  do
  {
    result = *(unsigned int *)(v6 + 4 * v52 + 716);
    if (v55 == *(unsigned __int16 *)&v56[-result])
    {
      v57 = v51;
      if (v51 >= 3)
      {
        v58 = 0;
        v59 = v54 - result;
        while (1)
        {
          v60 = *(_DWORD *)(v54 + 1 + v58) - *(_DWORD *)(v59 + v58);
          if (v60)
            break;
          v61 = v58 + 6;
          v58 += 4;
          if (v61 >= v51)
          {
            v57 = v51;
            goto LABEL_57;
          }
        }
        v62 = v58 + 2;
        v63 = v58 + 4;
        if ((_WORD)v60)
        {
          v63 = v62;
          v64 = v60;
        }
        else
        {
          v64 = BYTE2(v60);
        }
        v57 = v63 | (v64 == 0);
        if (v57 >= v51)
          v57 = v51;
      }
LABEL_57:
      *((_DWORD *)&v324 + v52) = v57;
      result = *((unsigned int *)&v324 + v53);
      if (v57 > result)
        v53 = v52;
    }
    else
    {
      *((_DWORD *)&v324 + v52) = 0;
    }
    ++v52;
  }
  while (v52 != 4);
  v65 = *((_DWORD *)&v324 + v53);
  if (v65 >= v10)
  {
    *v5 = v53;
    *a4 = v65;
    v67 = v65 - 1;
    if (v65 == 1)
      return result;
LABEL_69:
    result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a2, v67);
    *(_DWORD *)(a2 + 28) += v67;
    return result;
  }
  if (v11 >= v10)
  {
    *v5 = *(_DWORD *)(v6 + 8 * (v323 - 1) + 736) + 4;
    *a4 = v11;
    v67 = v11 - 1;
    if (v11 == 1)
      return result;
    goto LABEL_69;
  }
  v66 = *(unsigned __int8 *)(~(unint64_t)*(unsigned int *)(v6 + 716) + v54 - 1);
  if (v65 <= 1 && v11 <= 1 && v66 != v55)
    goto LABEL_65;
  v274 = (unsigned int *)(v6 + 69344);
  v275 = v7;
  v282 = a2;
  v276 = (int *)v5;
  v277 = a4;
  v68 = *(unsigned int *)(v6 + 712);
  *(_DWORD *)(v6 + 69324) = v68;
  v69 = *(_DWORD *)(v6 + 2936) & a5;
  v320 = v6 + 32 * v68;
  v70 = (unint64_t)*(unsigned __int16 *)(v320 + 2 * v69 + 27524) >> 4;
  v71 = lzma_rc_prices[v70];
  result = get_literal_price(v6, a5, *v56, v68 > 6, v66, v55);
  *(_DWORD *)(v6 + 69384) = result + v71;
  v72 = -1;
  *(_DWORD *)(v6 + 69392) = -1;
  *(_BYTE *)(v6 + 69372) = 0;
  v73 = lzma_rc_prices[v70 ^ 0x7F];
  v74 = v6 + 2 * v68;
  v75 = (unint64_t)*(unsigned __int16 *)(v74 + 27908) >> 4;
  v76 = lzma_rc_prices[v75 ^ 0x7F] + v73;
  if (v66 == v55)
  {
    v77 = v76
        + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v74 + 27932) >> 4]
        + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v320 + 2 * v69 + 28004) >> 4];
    if (v77 >= (int)result + v71)
    {
      v72 = -1;
    }
    else
    {
      v72 = 0;
      *(_DWORD *)(v6 + 69384) = v77;
      *(_DWORD *)(v6 + 69392) = 0;
    }
  }
  if (v11 <= v65)
    v78 = v65;
  else
    v78 = v11;
  if (v78 <= 1)
  {
    *v276 = v72;
    *v277 = 1;
    return result;
  }
  *(_DWORD *)(v6 + 69388) = 0;
  *(_OWORD *)(v6 + 69352) = *(_OWORD *)(v6 + 716);
  v79 = 44 * v78 + 69340;
  v80 = v78;
  do
  {
    *(_DWORD *)(v6 + v79) = 0x40000000;
    --v78;
    v79 -= 44;
  }
  while (v78 > 1);
  v81 = 0;
  v82 = (unsigned __int16 *)(v6 + 2 * v68);
  v83 = v82 + 13966;
  v84 = v82 + 13978;
  v85 = v82 + 13990;
  result = (uint64_t)&v324;
  do
  {
    v86 = *((_DWORD *)&v324 + v81);
    if (v86 < 2)
      goto LABEL_93;
    v87 = (unint64_t)*v83 >> 4;
    if (v81)
    {
      v88 = lzma_rc_prices[v87 ^ 0x7FLL];
      v89 = (unint64_t)*v84 >> 4;
      if (v81 != 1)
      {
        v90 = lzma_rc_prices[v89 ^ 0x7FLL] + v88;
        v88 = lzma_rc_prices[((2 - (_WORD)v81) & 0x7F0 ^ (unint64_t)*v85) >> 4];
        goto LABEL_89;
      }
    }
    else
    {
      v88 = lzma_rc_prices[v87];
      v89 = ((unint64_t)*(unsigned __int16 *)(v6 + 32 * v68 + 2 * v69 + 28004) >> 4) ^ 0x7F;
    }
    v90 = lzma_rc_prices[v89];
LABEL_89:
    v91 = v88 + v76 + v90;
    v92 = (int *)(v6 + 1088 * v69 + 48692 + 4 * (v86 - 2));
    do
    {
      v93 = *v92--;
      v94 = v91 + v93;
      v95 = v86;
      v96 = (_DWORD *)(v6 + 44 * v86 + 69340);
      if ((v91 + v93) < *v96)
      {
        *v96 = v94;
        v97 = v6 + 44 * v95 + 69324;
        *(_DWORD *)(v97 + 20) = 0;
        *(_DWORD *)(v97 + 24) = v81;
        *(_BYTE *)(v97 + 4) = 0;
      }
      v86 = v95 - 1;
    }
    while (v95 - 1 > 1);
LABEL_93:
    ++v81;
  }
  while (v81 != 4);
  if (v324 >= 2)
    v98 = v324 + 1;
  else
    v98 = 2;
  if (v98 <= v11)
  {
    v251 = lzma_rc_prices[v75];
    v252 = -1;
    do
      ++v252;
    while (v98 > *(_DWORD *)(v6 + 8 * v252 + 732));
    v253 = v251 + v73;
    v254 = v323;
    result = 69340;
    while (1)
    {
      v255 = v6 + 8 * v252;
      v256 = *(unsigned int *)(v255 + 736);
      v257 = v98 - 2;
      v258 = v98 >= 6 ? 3 : v257;
      if (v256 > 0x7F)
      {
        if ((v256 & 0x80000000) != 0)
          v260 = 30;
        else
          v260 = 18;
        if ((v256 & 0x80000000) != 0)
          v261 = 60;
        else
          v261 = 36;
        if (v256 < 0x80000)
          v260 = 6;
        v262 = lzma_fastpos[v256 >> v260];
        if (v256 < 0x80000)
          v261 = 12;
        v259 = *(_DWORD *)(v6 + 4 * (v256 & 0xF) + 69248) + *(_DWORD *)(v6 + (v258 << 8) + 4 * (v261 + v262) + 66168);
      }
      else
      {
        v259 = *(_DWORD *)(v6 + (v258 << 9) + 4 * v256 + 67192);
      }
      v263 = v253 + v259 + *(_DWORD *)(v6 + 1088 * v69 + 4 * v257 + 30188);
      v264 = (unsigned int *)(v6 + 44 * v98 + 69340);
      if (v263 < *v264)
      {
        *v264 = v263;
        v265 = v6 + 44 * v98 + 69324;
        *(_DWORD *)(v265 + 20) = 0;
        *(_DWORD *)(v265 + 24) = v256 + 4;
        *(_BYTE *)(v265 + 4) = 0;
      }
      if (v257 + 2 == *(_DWORD *)(v255 + 732) && ++v252 == v254)
        break;
      v98 = v257 + 3;
    }
  }
  if (v80 != -1)
  {
    v99 = v80;
    v100 = 0;
    v324 = *(_OWORD *)(v6 + 716);
    v278 = v6 + 69352;
    v298 = v6 + 69384;
    v286 = ~a5;
    v285 = 4094;
    v101 = 1;
    while (1)
    {
      v316 = v99;
      result = lzma_mf_find(v282, (_DWORD *)(v6 + 2924), v6 + 732);
      *(_DWORD *)(v6 + 2928) = result;
      if (result >= *(_DWORD *)(v282 + 96))
      {
        v250 = v101;
        goto LABEL_356;
      }
      v102 = *(_QWORD *)v282;
      v103 = *(unsigned int *)(v282 + 24);
      v104 = *(_DWORD *)(v282 + 36) - v103;
      v281 = v104 + 1;
      if (v104 + 1 < (4095 - v101))
        v105 = v104 + 1;
      else
        v105 = 4095 - v101;
      v311 = v105;
      v305 = *(_DWORD *)(v6 + 2924);
      v106 = *(unsigned int *)(v6 + 44 * v101 + 69344);
      v307 = v100;
      v294 = *(_DWORD *)(v282 + 96);
      v283 = result;
      if (*(_BYTE *)(v6 + 44 * v101 + 69328))
      {
        if (*(_BYTE *)(v6 + 44 * v101 + 69329))
        {
          v107 = v6 + 69324 + 44 * v101;
          v108 = *(_DWORD *)(v107 + 8);
          v109 = *(_DWORD *)(v107 + 12);
          if (*(_DWORD *)(v6 + 69324 + 44 * v108) >= 7u)
            v110 = 11;
          else
            v110 = 8;
          if (*(_DWORD *)(v6 + 69324 + 44 * v108) >= 7u)
            v111 = 10;
          else
            v111 = 7;
          if (*(_DWORD *)(v6 + 69324 + 44 * v108) >= 7u)
            v112 = -6;
          else
            v112 = -3;
          if (v109 >= 4)
            v110 = v111;
          v113 = v110 + v112;
          if (v101 == v106)
          {
LABEL_124:
            if (*(_DWORD *)(v6 + 44 * v101 + 69348))
            {
              if (v113 >= 0xA)
                v115 = -6;
              else
                v115 = -3;
              v116 = v115 + v113;
              if (v113 >= 4)
                v114 = v116;
              else
                v114 = 0;
            }
            else if (v113 >= 7)
            {
              v114 = 11;
            }
            else
            {
              v114 = 9;
            }
            goto LABEL_152;
          }
          if (v113 >= 7)
            v114 = 11;
          else
            v114 = 8;
          if (v109 > 3)
            goto LABEL_151;
          goto LABEL_142;
        }
        v117 = *(_DWORD *)(v6 + 44 * (v106 - 1) + 69324);
        if (v117 >= 0xA)
          v118 = -6;
        else
          v118 = -3;
        v119 = v118 + v117;
        if (v117 >= 4)
          v113 = v119;
        else
          v113 = 0;
        v120 = v101 == v106;
        LODWORD(v106) = v106 - 1;
        if (v120)
          goto LABEL_124;
      }
      else
      {
        v113 = *(_DWORD *)(v6 + 44 * v106 + 69324);
        if (v101 - 1 == v106)
          goto LABEL_124;
      }
      v109 = *(_DWORD *)(v6 + 44 * v101 + 69348);
      v108 = v106;
      if (v109 > 3)
      {
        if (v113 >= 7)
          v114 = 10;
        else
          v114 = 7;
LABEL_151:
        LODWORD(v324) = v109 - 4;
        v124 = v278 + 44 * v108;
        *(_QWORD *)((char *)&v324 + 4) = *(_QWORD *)v124;
        HIDWORD(v324) = *(_DWORD *)(v124 + 8);
LABEL_152:
        v123 = v307;
        goto LABEL_153;
      }
      if (v113 >= 7)
        v114 = 11;
      else
        v114 = 8;
LABEL_142:
      LODWORD(v324) = *(_DWORD *)(v6 + 44 * v108 + 4 * v109 + 69352);
      if (v109)
      {
        v121 = v109 + 1;
        memcpy((char *)&v324 + 4, (const void *)(v278 + 44 * v108), 4 * (v109 + 1) - 4);
        v122 = v109 > 2;
        v123 = v307;
        if (v122)
          goto LABEL_153;
      }
      else
      {
        v121 = 1;
        v123 = v307;
      }
      v154 = v121;
      do
      {
        *((_DWORD *)&v324 + v154) = *(_DWORD *)(v278 + 44 * v108 + 4 * v154);
        ++v154;
      }
      while ((_DWORD)v154 != 4);
LABEL_153:
      v125 = v102 + v103 - 1;
      *(_DWORD *)(v6 + 44 * v101 + 69324) = v114;
      *(_OWORD *)(44 * v123 + 69340 + v6 + 56) = v324;
      v126 = (unsigned __int8 *)(v102 + v103 - 2);
      v127 = *(_DWORD *)(v6 + 44 * v101 + 69340);
      v321 = (unsigned __int16 *)v125;
      v322 = v126;
      v310 = *(_DWORD *)(v6 + 2936);
      v288 = v114;
      v319 = v310 & (v101 + a5);
      v313 = (unsigned __int8 *)(~(unint64_t)v324 + v125);
      v128 = *v313;
      v129 = (unint64_t)*(unsigned __int16 *)(v6 + 32 * v114 + 2 * v319 + 27524) >> 4;
      v122 = v114 > 6;
      v131 = v126[1];
      v132 = v122;
      v291 = v101 + a5;
      v130 = lzma_rc_prices[v129];
      v133 = v127 + get_literal_price(v6, (int)v101 + a5, *v126, v132, v128, v126[1]) + v130;
      v134 = v101 + 1;
      v137 = *(_DWORD *)(v6 + 44 * v101 + 69384);
      v136 = (unsigned int *)(v6 + 44 * v101 + 69384);
      v135 = v137;
      v138 = v133 < v137;
      if (v133 < v137)
      {
        *v136 = v133;
        v139 = v6 + 44 * v134 + 69324;
        *(_DWORD *)(v139 + 20) = v101;
        *(_DWORD *)(v139 + 24) = -1;
        *(_BYTE *)(v139 + 4) = 0;
        v135 = v133;
      }
      v140 = v127 + lzma_rc_prices[v129 ^ 0x7FLL];
      v141 = (unint64_t)*(unsigned __int16 *)(v6 + 2 * v288 + 27908) >> 4;
      v304 = v140 + lzma_rc_prices[v141 ^ 0x7F];
      v99 = v316;
      result = (uint64_t)lzma_fastpos;
      v142 = v294;
      if (v128 == v131)
      {
        v143 = (_DWORD *)(v6 + 44 * v134 + 69344);
        v144 = v310 & (v101 + a5);
        if (v101 <= *v143 || *(_DWORD *)(v6 + 44 * v134 + 69348))
        {
          v145 = v304
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 2 * v288 + 27932) >> 4]
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 32 * v288 + 2 * v319 + 28004) >> 4];
          if (v145 <= v135)
          {
            *v136 = v145;
            *v143 = v101;
            v146 = v6 + 44 * v134 + 69324;
            *(_DWORD *)(v146 + 24) = 0;
            *(_BYTE *)(v146 + 4) = 0;
            v138 = 1;
          }
        }
      }
      else
      {
        v144 = v310 & (v101 + a5);
      }
      v147 = v321;
      v284 = v101 + 1;
      if (v311 < 2)
        goto LABEL_329;
      v280 = v141;
      v279 = v140;
      v148 = v131;
      if (v311 >= v294)
        v149 = v294;
      else
        v149 = v311;
      if (v128 == v148)
        v138 = 1;
      if (v138)
      {
        v150 = v311;
      }
      else
      {
        if (v294 + 1 < v311)
          v151 = v294 + 1;
        else
          v151 = v311;
        v150 = v311;
        if (v151 >= 2)
        {
          v152 = 1;
          while (1)
          {
            v153 = *(_DWORD *)((char *)v321 + v152) - *(_DWORD *)&v313[v152];
            if (v153)
              break;
            v152 += 4;
            if (v152 >= v151)
              goto LABEL_190;
          }
          if (*(unsigned __int16 *)((char *)v321 + v152) == *(_WORD *)&v313[v152])
          {
            v152 += 2;
            LOBYTE(v153) = BYTE2(v153);
          }
          if (!(_BYTE)v153)
            ++v152;
          if (v152 < v151)
            v151 = v152;
        }
LABEL_190:
        v155 = v151 - 3;
        if (v151 - 3 <= 0xFFFFFFFD)
        {
          if (v288 >= 0xA)
            v156 = -6;
          else
            v156 = -3;
          LODWORD(v157) = v156 + v288;
          if (v288 >= 4)
            v157 = v157;
          else
            v157 = 0;
          v158 = v310 & (v291 + 1);
          v159 = *(unsigned __int16 *)(v6 + 32 * v157 + 2 * v158 + 27524);
          v160 = *(unsigned __int16 *)(v6 + 2 * v157 + 27908);
          v161 = v151 + v101;
          if (v161 > v316)
          {
            v162 = v161 - v316;
            v163 = (_DWORD *)(v298 + 44 * v316);
            do
            {
              *v163 = 0x40000000;
              v163 += 11;
              --v162;
            }
            while (v162);
            v99 = v161;
          }
          v164 = v133
               + lzma_rc_prices[(v159 >> 4) ^ 0x7F]
               + lzma_rc_prices[(v160 >> 4) ^ 0x7F]
               + *(_DWORD *)(v6 + 1088 * v158 + 4 * v155 + 48692)
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 2 * v157 + 27932) >> 4]
               + lzma_rc_prices[((unint64_t)*(unsigned __int16 *)(v6 + 32 * v157 + 2 * v158 + 28004) >> 4) ^ 0x7F];
          v165 = (unsigned int *)(v6 + 44 * v161 + 69340);
          if (v164 < *v165)
          {
            *v165 = v164;
            v166 = v6 + 44 * v161 + 69324;
            *(_QWORD *)(v166 + 20) = v134;
            *(_WORD *)(v166 + 4) = 1;
          }
          v147 = v321;
          v142 = v294;
        }
      }
      v167 = 0;
      v168 = (unsigned __int16 *)(v6 + 2 * v288);
      v303 = v168 + 13966;
      v292 = v168 + 13978;
      v287 = v168 + 13990;
      v289 = (unsigned __int16 *)(v6 + 32 * v288 + 2 * v144 + 28004);
      v169 = 11;
      if (v288 <= 6)
        v169 = 8;
      v290 = v169;
      v301 = 1088 * v144 + 48692;
      v170 = 2;
      v299 = v149;
      do
      {
        v171 = &v322[-*((unsigned int *)&v324 + v167)];
        if (*v147 != *(unsigned __int16 *)v171)
          goto LABEL_261;
        v172 = v149;
        if (v149 >= 3)
        {
          v173 = 2;
          while (1)
          {
            v174 = *(_DWORD *)&v147[v173 / 2] - *(_DWORD *)&v171[v173];
            if (v174)
              break;
            v173 += 4;
            if (v173 >= v149)
            {
              v172 = v149;
              goto LABEL_218;
            }
          }
          if (v147[v173 / 2] == *(_WORD *)&v171[v173])
          {
            v173 += 2;
            LOBYTE(v174) = BYTE2(v174);
          }
          v175 = v173 | (v174 == 0);
          if (v175 >= v149)
            v172 = v149;
          else
            v172 = v175;
        }
LABEL_218:
        v176 = v99;
        if (v99 < v172 + v101)
        {
          v177 = v101 + v172 - (unint64_t)v99;
          v178 = (_DWORD *)(v298 + 44 * v99);
          do
          {
            *v178 = 0x40000000;
            v178 += 11;
            --v177;
          }
          while (v177);
          v176 = v172 + v101;
        }
        v179 = (unint64_t)*v303 >> 4;
        v308 = v172 + v101;
        if (v167)
        {
          v180 = lzma_rc_prices[v179 ^ 0x7FLL];
          v181 = (unint64_t)*v292 >> 4;
          if (v167 != 1)
          {
            v182 = lzma_rc_prices[v181 ^ 0x7FLL] + v180;
            v180 = lzma_rc_prices[((2 - (_WORD)v167) & 0x7F0 ^ (unint64_t)*v287) >> 4];
            goto LABEL_227;
          }
        }
        else
        {
          v180 = lzma_rc_prices[v179];
          v181 = ((unint64_t)*v289 >> 4) ^ 0x7F;
        }
        v182 = lzma_rc_prices[v181];
LABEL_227:
        v183 = v180 + v304 + v182;
        v184 = v301 + 4 * (v172 - 2);
        v185 = v172;
        do
        {
          v186 = *(_DWORD *)(v6 + v184) + v183;
          v187 = (unsigned int *)(v6 + 44 * (v101 + v185) + 69340);
          if (v186 < *v187)
          {
            *v187 = v186;
            v188 = v6 + 44 * (v101 + v185) + 69324;
            *(_DWORD *)(v188 + 20) = v101;
            *(_DWORD *)(v188 + 24) = v167;
            *(_BYTE *)(v188 + 4) = 0;
          }
          --v185;
          v184 -= 4;
        }
        while (v185 > 1);
        v189 = v172 + 1;
        if (!v167)
          v170 = v172 + 1;
        if (v189 + v142 >= v150)
          v190 = v150;
        else
          v190 = v189 + v142;
        v314 = v176;
        if (v189 >= v190)
        {
          v190 = v172 + 1;
          v147 = v321;
        }
        else
        {
          v191 = v172 + 1;
          v147 = v321;
          while (1)
          {
            v192 = *(_DWORD *)((char *)v321 + v191) - *(_DWORD *)&v171[v191];
            if (v192)
              break;
            v191 += 4;
            if (v191 >= v190)
              goto LABEL_248;
          }
          if (*(unsigned __int16 *)((char *)v321 + v191) == *(_WORD *)&v171[v191])
          {
            v191 += 2;
            LOBYTE(v192) = BYTE2(v192);
          }
          v147 = v321;
          if (!(_BYTE)v192)
            ++v191;
          if (v191 < v190)
            v190 = v191;
        }
LABEL_248:
        v193 = v190 - v189;
        v194 = v190 - v189 - 2;
        if (v193 < 2)
        {
          v99 = v314;
          LODWORD(v144) = v310 & (v101 + a5);
        }
        else
        {
          v297 = v194;
          v312 = v170;
          v317 = v99;
          v296 = *(_DWORD *)(v6 + 1088 * v319 + 4 * (v172 - 2) + 48692);
          v295 = lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6
                                                                      + 27524
                                                                      + 32 * v290
                                                                      + 2 * ((v172 + v291) & v310)) >> 4];
          literal_price = get_literal_price(v6, v172 + v291, *((unsigned __int8 *)v147 + v172 - 1), 1, v171[v172], *((unsigned __int8 *)v147 + v172));
          v196 = (v172 + v291 + 1) & v310;
          v197 = *(unsigned __int16 *)(v6 + 27524 + 2 * v196 + 160);
          v198 = *(unsigned __int16 *)(v6 + 27918);
          v199 = v308 + 1;
          v200 = v193 + v308 + 1;
          v99 = v314;
          if (v314 >= v200)
          {
            v123 = v307;
          }
          else
          {
            v201 = v317;
            if (v317 <= (unint64_t)(v101 + v172))
              v201 = v101 + v172;
            v202 = v101 + v190 - v201;
            v203 = (_DWORD *)(v298 + 44 * v201);
            do
            {
              *v203 = 0x40000000;
              v203 += 11;
              --v202;
            }
            while (v202);
            v99 = v193 + v199;
            v123 = v307;
          }
          v150 = v311;
          LODWORD(v144) = v310 & (v101 + a5);
          v204 = v296
               + v183
               + v295
               + literal_price
               + lzma_rc_prices[(v197 >> 4) ^ 0x7F]
               + lzma_rc_prices[(v198 >> 4) ^ 0x7F]
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 27942) >> 4]
               + *(_DWORD *)(v6 + 1088 * v196 + 4 * v297 + 48692)
               + lzma_rc_prices[((unint64_t)*(unsigned __int16 *)(v6 + 2 * v196 + 28164) >> 4) ^ 0x7F];
          v205 = (unsigned int *)(v6 + 44 * v200 + 69340);
          if (v204 < *v205)
          {
            *v205 = v204;
            v206 = v6 + 44 * v200 + 69324;
            *(_DWORD *)(v206 + 20) = v199;
            *(_DWORD *)(v206 + 24) = 0;
            *(_WORD *)(v206 + 4) = 257;
            *(_DWORD *)(v206 + 8) = v101;
            *(_DWORD *)(v206 + 12) = v167;
          }
          result = (uint64_t)lzma_fastpos;
          v147 = v321;
          v142 = v294;
          v170 = v312;
        }
        v149 = v299;
LABEL_261:
        ++v167;
      }
      while (v167 != 4);
      v207 = v283;
      v208 = v305;
      if (v283 > v149)
      {
        v208 = 0;
        do
          v209 = v6 + 8 * v208++;
        while (v149 > *(_DWORD *)(v209 + 732));
        *(_DWORD *)(v209 + 732) = v149;
        v207 = v149;
      }
      if (v207 >= v170)
      {
        v210 = v207 + v101;
        if (v99 < v210)
        {
          v211 = v208;
          if (v283 >= v142)
            v212 = v142;
          else
            v212 = v283;
          if (v212 >= v285)
            v212 = v285;
          if (v212 >= v281)
            v212 = v281;
          v213 = v99 - (unint64_t)(v212 + v101);
          v214 = (_DWORD *)(v298 + 44 * v99);
          do
          {
            *v214 = 0x40000000;
            v214 += 11;
            v49 = __CFADD__(v213++, 1);
          }
          while (!v49);
          v99 = v210;
          v208 = v211;
        }
        v215 = -1;
        do
          ++v215;
        while (v170 > *(_DWORD *)(v6 + 8 * v215 + 732));
        v216 = v279 + lzma_rc_prices[v280];
        v217 = 7;
        if (v288 > 6)
          v217 = 10;
        v300 = v217;
        v315 = v142 + 1;
        v306 = v208;
        do
        {
          v218 = v6 + 8 * v215;
          v219 = *(unsigned int *)(v218 + 736);
          if ((v219 & 0x80000000) != 0)
            v220 = 30;
          else
            v220 = 18;
          v221 = 60;
          if ((v219 & 0x80000000) == 0)
            v221 = 36;
          if (v219 >= 0x80000)
            v222 = v220;
          else
            v222 = 6;
          v223 = 12;
          if (v219 >= 0x80000)
            v223 = v221;
          v224 = *(_DWORD *)(v218 + 732);
          for (j = v170; ; ++j)
          {
            v226 = j - 2;
            if (j >= 6)
              v227 = 3;
            else
              v227 = v226;
            if (v219 > 0x7F)
              v228 = *(_DWORD *)(v6 + 4 * (v219 & 0xF) + 69248)
                   + *(_DWORD *)(v6 + (v227 << 8) + 4 * (v223 + lzma_fastpos[v219 >> v222]) + 66168);
            else
              v228 = *(_DWORD *)(v6 + (v227 << 9) + 4 * v219 + 67192);
            v229 = v216 + v228 + *(_DWORD *)(v6 + 1088 * v144 + 4 * v226 + 30188);
            v230 = v123 + j + 1;
            v231 = (unsigned int *)(v6 + 44 * v230 + 69340);
            if (v229 < *v231)
            {
              *v231 = v229;
              v232 = v6 + 44 * v230 + 69324;
              *(_DWORD *)(v232 + 20) = v101;
              *(_DWORD *)(v232 + 24) = v219 + 4;
              *(_BYTE *)(v232 + 4) = 0;
            }
            if (j == v224)
              break;
          }
          v233 = &v322[-v219];
          v170 = j + 1;
          v234 = v315 + j;
          if (v315 + j >= v311)
            v234 = v311;
          v235 = j + 1;
          if (v170 < v234)
          {
            v235 = j + 1;
            while (1)
            {
              v236 = *(_DWORD *)((char *)v321 + v235) - *(_DWORD *)&v233[v235];
              if (v236)
                break;
              v235 += 4;
              if (v235 >= v234)
              {
                v235 = v234;
                goto LABEL_318;
              }
            }
            if (*(unsigned __int16 *)((char *)v321 + v235) == *(_WORD *)&v233[v235])
            {
              v235 += 2;
              LOBYTE(v236) = BYTE2(v236);
            }
            if (!(_BYTE)v236)
              ++v235;
            if (v235 >= v234)
              v235 = v234;
          }
LABEL_318:
          v237 = ~j + v235;
          if (v237 < 2)
          {
            LODWORD(v144) = v310 & (v101 + a5);
          }
          else
          {
            v302 = v235;
            v318 = v99;
            v309 = lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6
                                                                        + 27524
                                                                        + 32 * v300
                                                                        + 2 * ((j - v286) & v310)) >> 4];
            v238 = get_literal_price(v6, j - v286, *((unsigned __int8 *)v321 + j - 1), 1, v233[j], *((unsigned __int8 *)v321 + j));
            v99 = v318;
            v239 = (((j - v286) & v310) + 1) & v310;
            v123 = v307;
            v240 = *(unsigned __int16 *)(v6 + 27524 + 2 * v239 + 128);
            v241 = *(unsigned __int16 *)(v6 + 27916);
            v242 = v307 + j + 2;
            v243 = v237 + v242;
            if (v318 >= v237 + v242)
            {
              LODWORD(v144) = v310 & (v101 + a5);
              v244 = v302;
            }
            else
            {
              v244 = v302;
              v245 = v101 + v302 - (unint64_t)v318;
              v246 = (_DWORD *)(v298 + 44 * v318);
              LODWORD(v144) = v310 & (v101 + a5);
              do
              {
                *v246 = 0x40000000;
                v246 += 11;
                --v245;
              }
              while (v245);
              v99 = v243;
            }
            v247 = v229
                 + v309
                 + v238
                 + lzma_rc_prices[(v240 >> 4) ^ 0x7F]
                 + lzma_rc_prices[(v241 >> 4) ^ 0x7F]
                 + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 27940) >> 4]
                 + *(_DWORD *)(v6 + 1088 * v239 + 4 * (v244 - j - 3) + 48692)
                 + lzma_rc_prices[((unint64_t)*(unsigned __int16 *)(v6 + 2 * v239 + 28132) >> 4) ^ 0x7F];
            v248 = (unsigned int *)(v6 + 44 * v243 + 69340);
            if (v247 < *v248)
            {
              *v248 = v247;
              v249 = v6 + 44 * v243 + 69324;
              *(_DWORD *)(v249 + 20) = v242;
              *(_DWORD *)(v249 + 24) = 0;
              *(_WORD *)(v249 + 4) = 257;
              *(_DWORD *)(v249 + 8) = v101;
              *(_DWORD *)(v249 + 12) = v219 + 4;
            }
            result = (uint64_t)lzma_fastpos;
            v170 = j + 1;
          }
          ++v215;
        }
        while (v215 != v306);
      }
LABEL_329:
      v100 = v123 + 1;
      --v285;
      --v286;
      v250 = ++v101;
      if (v284 >= v99)
      {
LABEL_356:
        v275[527] = v250;
        v267 = *(_DWORD *)(v6 + 44 * v250 + 69344);
        v266 = *(_DWORD *)(v6 + 44 * v250 + 69348);
        do
        {
          v268 = v250;
          v250 = v267;
          v269 = v267;
          v270 = (int *)(v6 + 69324 + 44 * v267 + 24);
          if (*(_BYTE *)(v6 + 69324 + 44 * v268 + 4))
          {
            *(_BYTE *)(v6 + 69324 + 44 * v267-- + 4) = 0;
            if (*(_BYTE *)(v6 + 69324 + 44 * v268 + 5))
            {
              result = v6 + 69324 + 44 * v267;
              *(_BYTE *)(result + 4) = 0;
              *(_QWORD *)(result + 20) = *(_QWORD *)(v6 + 69324 + 44 * v268 + 8);
            }
            v271 = -1;
          }
          else
          {
            v271 = *v270;
            v267 = *(_DWORD *)(v6 + 44 * v267 + 69344);
          }
          *v270 = v266;
          *(_DWORD *)(v6 + 44 * v269 + 69344) = v268;
          v266 = v271;
        }
        while (v269);
        v272 = *v274;
        v273 = *(_DWORD *)(v6 + 69348);
        v275[528] = *v274;
        *v277 = v272;
        *v276 = v273;
        return result;
      }
    }
  }
  return result;
}

uint64_t get_literal_price(uint64_t result, int a2, unsigned int a3, char a4, int a5, int a6)
{
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  v6 = result
     + 1536
     * ((a3 >> (8 - *(_DWORD *)(result + 2940))) + ((*(_DWORD *)(result + 2944) & a2) << *(_DWORD *)(result + 2940)))
     + 2948;
  v7 = a6 + 256;
  LODWORD(result) = 0;
  if ((a4 & 1) != 0)
  {
    v8 = 256;
    do
    {
      v9 = v8 & (2 * a5);
      v10 = v8 + (v7 >> 8);
      v11 = (v7 & 0x80) == 0;
      v7 *= 2;
      v12 = v7 ^ (2 * a5);
      a5 *= 2;
      v13 = *(unsigned __int16 *)(v6 + 2 * (v10 + v9));
      if (v11)
        v14 = 0;
      else
        v14 = 2032;
      result = result + lzma_rc_prices[(v14 ^ v13) >> 4];
      v8 &= ~v12;
    }
    while (v7 < 0x10000);
  }
  else
  {
    do
    {
      v15 = v7 >> 1;
      if ((v7 & 1) != 0)
        v16 = 2032;
      else
        v16 = 0;
      result = result + lzma_rc_prices[(v16 ^ (unint64_t)*(unsigned __int16 *)(v6 + 2 * v15)) >> 4];
      v7 >>= 1;
    }
    while (v15 != 1);
  }
  return result;
}

uint64_t lzma_file_info_decoder(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  v8 = lzma_strm_init(a1);
  if (!(_DWORD)v8)
  {
    v8 = lzma_file_info_decoder_init(a1[7], a1[6], (uint64_t)(a1 + 12), a2, a3, a4);
    if ((_DWORD)v8)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v9 = a1[7];
      *(_BYTE *)(v9 + 96) = 1;
      *(_BYTE *)(v9 + 99) = 1;
    }
  }
  return v8;
}

uint64_t lzma_file_info_decoder_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  void *v12;
  uint64_t *v13;
  uint64_t result;
  void *v15;
  uint64_t v16;

  if (*(uint64_t (**)())(a1 + 16) != lzma_file_info_decoder_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = lzma_file_info_decoder_init;
  if (!a4)
    return 11;
  v12 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    v13 = (uint64_t *)*((_QWORD *)v12 + 15);
  }
  else
  {
    v15 = lzma_alloc(0x2160uLL, a2);
    if (!v15)
      return 5;
    v12 = v15;
    v13 = 0;
    *(_QWORD *)(a1 + 24) = file_info_decode;
    *(_QWORD *)(a1 + 32) = file_info_decoder_end;
    *(_QWORD *)(a1 + 56) = file_info_decoder_memconfig;
    *(_QWORD *)a1 = v12;
    *((_QWORD *)v12 + 4) = 0;
    *((_QWORD *)v12 + 5) = -1;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    *((_OWORD *)v12 + 5) = 0u;
    *((_OWORD *)v12 + 6) = 0u;
    *((_QWORD *)v12 + 15) = 0;
    *((_QWORD *)v12 + 17) = 0;
  }
  *(_DWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 3) = a6;
  lzma_index_end(v13, a2);
  *((_QWORD *)v12 + 15) = 0;
  lzma_index_end(*((uint64_t **)v12 + 17), a2);
  result = 0;
  *((_QWORD *)v12 + 16) = 0;
  *((_QWORD *)v12 + 17) = 0;
  *((_QWORD *)v12 + 18) = a4;
  *((_QWORD *)v12 + 19) = a3;
  if (a5 <= 1)
    v16 = 1;
  else
    v16 = a5;
  *((_QWORD *)v12 + 20) = v16;
  *((_OWORD *)v12 + 21) = xmmword_229953440;
  return result;
}

uint64_t file_info_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  __int128 v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v9 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 8);
  v61 = *a4;
  if (v9 >= a5 - *a4)
    v10 = a5;
  else
    v10 = v9 + v61;
  v11 = a1 + 352;
  v12 = (uint64_t *)(a1 + 336);
  v13 = a1 + 280;
  v59 = a1 + 168;
  v60 = a1 + 32;
  v14 = (uint64_t *)(a1 + 120);
  v62 = a1 + 224;
  v15 = *(_DWORD *)a1;
  v58 = a1 + 351;
  while (2)
  {
    switch(v15)
    {
      case 0:
        if (*(_QWORD *)(a1 + 24) < 0xCuLL)
        {
          result = 7;
        }
        else
        {
          *(_QWORD *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(_QWORD *)(a1 + 344));
          if (*(_QWORD *)(a1 + 336) < *(_QWORD *)(a1 + 344))
            goto LABEL_75;
          result = lzma_stream_header_decode(v59, v11);
          if (!(_DWORD)result)
          {
            v17 = *(_QWORD *)(a1 + 24);
            if ((v17 & 0x8000000000000003) != 0)
              goto LABEL_73;
            *(_QWORD *)(a1 + 16) = v17;
            goto LABEL_11;
          }
        }
        break;
      case 1:
LABEL_11:
        *(_DWORD *)a1 = 2;
        result = reverse_seek(a1, v61, a4, v10);
        if (!(_DWORD)result)
          goto LABEL_12;
        break;
      case 2:
LABEL_12:
        *(_QWORD *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(_QWORD *)(a1 + 344));
        v18 = *(_QWORD *)(a1 + 344);
        if (*(_QWORD *)(a1 + 336) < v18)
          goto LABEL_75;
        v19 = 0;
        if (v18)
        {
          v20 = v58;
          while (!*(_BYTE *)(v20 + v18))
          {
            --v20;
            if (v18 == ++v19)
            {
              v19 = *(_QWORD *)(a1 + 344);
              break;
            }
          }
        }
        v21 = *(_QWORD *)(a1 + 128) + v19;
        *(_QWORD *)(a1 + 128) = v21;
        *(_QWORD *)(a1 + 16) -= v19;
        v22 = v18 - v19;
        if (!v22)
        {
          v15 = 1;
          goto LABEL_72;
        }
        if ((v21 & 3) != 0)
          goto LABEL_73;
        *(_DWORD *)a1 = 3;
        *(_QWORD *)(a1 + 336) = v22;
        *(_QWORD *)(a1 + 344) = v22;
        if (v22 > 0xB)
          goto LABEL_23;
        result = reverse_seek(a1, v61, a4, v10);
        if (!(_DWORD)result)
          goto LABEL_23;
        break;
      case 3:
LABEL_23:
        *(_QWORD *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(_QWORD *)(a1 + 344));
        v23 = *(_QWORD *)(a1 + 344);
        if (*(_QWORD *)(a1 + 336) < v23)
          goto LABEL_75;
        *(_QWORD *)(a1 + 16) -= 12;
        v24 = v23 - 12;
        *(_QWORD *)(a1 + 344) = v24;
        LODWORD(result) = lzma_stream_footer_decode(v13, v11 + v24);
        if ((_DWORD)result == 7)
          result = 9;
        else
          result = result;
        if (!(_DWORD)result)
        {
          v25 = *(_QWORD *)(a1 + 16);
          v26 = *(_QWORD *)(a1 + 288);
          if (v25 < v26 + 12)
            goto LABEL_73;
          v27 = v25 - v26;
          *(_QWORD *)(a1 + 16) = v27;
          *(_DWORD *)a1 = 4;
          v28 = *(_QWORD *)(a1 + 344);
          v29 = v28 >= v26;
          v30 = v28 - v26;
          if (v29)
          {
            *v12 = v30;
            goto LABEL_34;
          }
          *v12 = 0;
          v12[1] = 0;
          v31 = *(_QWORD *)(a1 + 8);
          v32 = *a4;
          if (v31 + v61 - *a4 <= v27 && v31 + v10 - v32 >= v27)
          {
            *a4 = v27 - v31 + v32;
            *(_QWORD *)(a1 + 8) = v27;
            goto LABEL_34;
          }
          **(_QWORD **)(a1 + 152) = v27;
          *a4 = v10;
          *(_QWORD *)(a1 + 8) = v27;
          result = 12;
        }
        break;
      case 4:
LABEL_34:
        v33 = *(_QWORD *)(a1 + 136);
        if (v33)
        {
          v33 = lzma_index_memused(v33);
          v34 = *(_QWORD *)(a1 + 160);
          if (v33 > v34)
            goto LABEL_74;
        }
        else
        {
          v34 = *(_QWORD *)(a1 + 160);
        }
        result = lzma_index_decoder_init(v60, a2, v14, v34 - v33);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a1 + 112) = *(_QWORD *)(a1 + 288);
          *(_DWORD *)a1 = 5;
          goto LABEL_40;
        }
        break;
      case 5:
LABEL_40:
        v35 = v5;
        v36 = v14;
        v37 = *(_QWORD *)(a1 + 344);
        if (v37)
        {
          v38 = *(_QWORD *)(a1 + 336);
          LODWORD(result) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD, _DWORD))(a1 + 56))(*(_QWORD *)(a1 + 32), a2, v11, v12, v37, 0, 0, 0, 0);
          v39 = v38 - *(_QWORD *)(a1 + 336) + *(_QWORD *)(a1 + 112);
          *(_QWORD *)(a1 + 112) = v39;
        }
        else
        {
          v40 = *a4;
          v41 = *(_QWORD *)(a1 + 112);
          if (v10 - *a4 <= v41)
            v42 = v10;
          else
            v42 = v41 + *a4;
          LODWORD(result) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD, _DWORD))(a1 + 56))(*(_QWORD *)(a1 + 32), a2, a3, a4, v42, 0, 0, 0, 0);
          v43 = *a4;
          v39 = v40 - *a4 + *(_QWORD *)(a1 + 112);
          *(_QWORD *)(a1 + 112) = v39;
          *(_QWORD *)(a1 + 8) += v43 - v40;
        }
        if ((_DWORD)result == 1)
        {
          if (!v39
            && (v44 = lzma_index_total_size(*(_QWORD *)(a1 + 120)) + 12,
                v45 = *(_QWORD *)(a1 + 16),
                v29 = v45 >= v44,
                v46 = v45 - v44,
                v29))
          {
            *(_QWORD *)(a1 + 16) = v46;
            if (!v46)
            {
              v47 = *(_OWORD *)(v59 + 16);
              *(_OWORD *)v62 = *(_OWORD *)v59;
              *(_OWORD *)(v62 + 16) = v47;
              *(_OWORD *)(v62 + 32) = *(_OWORD *)(v59 + 32);
              *(_QWORD *)(v62 + 48) = *(_QWORD *)(v59 + 48);
              v15 = 7;
              v14 = v36;
              v5 = v35;
              goto LABEL_72;
            }
            *(_DWORD *)a1 = 6;
            *(_QWORD *)(a1 + 16) = v46 + 12;
            v48 = *(_QWORD *)(a1 + 344);
            if (v48)
            {
              v49 = v48 - *(_QWORD *)(a1 + 288);
              v29 = v49 >= v44;
              v50 = v49 - v44;
              if (v29)
              {
                v51 = v50 + 12;
                *(_QWORD *)(a1 + 336) = v51;
                *(_QWORD *)(a1 + 344) = v51;
                v14 = v36;
                v5 = v35;
                goto LABEL_57;
              }
            }
            result = reverse_seek(a1, v61, a4, v10);
            v14 = v36;
            v5 = v35;
            if (!(_DWORD)result)
              goto LABEL_57;
          }
          else
          {
LABEL_73:
            result = 9;
          }
        }
        else
        {
          if (v39)
            v57 = 0;
          else
            v57 = 9;
          if ((_DWORD)result)
            result = result;
          else
            result = v57;
        }
        break;
      case 6:
LABEL_57:
        *(_QWORD *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(_QWORD *)(a1 + 344));
        v52 = *(_QWORD *)(a1 + 344);
        if (*(_QWORD *)(a1 + 336) < v52)
        {
LABEL_75:
          result = 0;
        }
        else
        {
          *(_QWORD *)(a1 + 16) -= 12;
          v53 = v52 - 12;
          *(_QWORD *)(a1 + 336) = v53;
          *(_QWORD *)(a1 + 344) = v53;
          LODWORD(result) = lzma_stream_header_decode(v62, v11 + v53);
          if ((_DWORD)result == 7)
            result = 9;
          else
            result = result;
          if (!(_DWORD)result)
          {
            *(_DWORD *)a1 = 7;
            goto LABEL_63;
          }
        }
        break;
      case 7:
LABEL_63:
        result = lzma_stream_flags_compare(v62, v13);
        if (!(_DWORD)result)
        {
          lzma_index_stream_flags(*v14, v13);
          if (v54 || lzma_index_stream_padding(*(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128)))
            goto LABEL_74;
          *(_QWORD *)(a1 + 128) = 0;
          v55 = *(_QWORD *)(a1 + 136);
          if (!v55 || (result = lzma_index_cat((int64x2_t *)*v14, v55, a2), !(_DWORD)result))
          {
            v56 = *(_QWORD *)(a1 + 120);
            *(_QWORD *)(a1 + 136) = v56;
            *(_QWORD *)(a1 + 120) = 0;
            if (*(_QWORD *)(a1 + 16))
            {
              if (*(_QWORD *)(a1 + 344))
                v15 = 2;
              else
                v15 = 1;
LABEL_72:
              *(_DWORD *)a1 = v15;
              continue;
            }
            **(_QWORD **)(a1 + 144) = v56;
            *(_QWORD *)(a1 + 136) = 0;
            *a4 = v10;
            result = 1;
          }
        }
        break;
      default:
LABEL_74:
        result = 11;
        break;
    }
    return result;
  }
}

void file_info_decoder_end(uint64_t **a1, uint64_t a2)
{
  lzma_next_end((uint64_t)(a1 + 4), a2);
  lzma_index_end(a1[15], a2);
  lzma_index_end(a1[17], a2);
  lzma_free(a1, a2);
}

uint64_t file_info_decoder_memconfig(uint64_t a1, uint64_t *a2, _QWORD *a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = 0;
  v8 = *(_QWORD *)(a1 + 136);
  if (v8)
    v9 = lzma_index_memused(v8);
  else
    v9 = 0;
  v10 = *(_QWORD *)(a1 + 120);
  if (v10)
  {
    v11 = lzma_index_memused(v10);
    v15 = v11;
  }
  else if (*(_DWORD *)a1 == 5)
  {
    v14 = 0;
    if ((*(unsigned int (**)(_QWORD, uint64_t *, uint64_t *, _QWORD))(a1 + 88))(*(_QWORD *)(a1 + 32), &v15, &v14, 0))
    {
      return 11;
    }
    v11 = v15;
  }
  else
  {
    v11 = 0;
  }
  *a2 = v11 + v9;
  if (!(v11 + v9))
    *a2 = lzma_index_memusage(1, 0);
  *a3 = *(_QWORD *)(a1 + 160);
  if (!a4)
    return 0;
  if (*a2 > a4)
    return 6;
  if (!*(_QWORD *)(a1 + 120) && *(_DWORD *)a1 == 5)
  {
    v13 = 0;
    v14 = 0;
    if ((*(unsigned int (**)(_QWORD, uint64_t *, uint64_t *, unint64_t))(a1 + 88))(*(_QWORD *)(a1 + 32), &v14, &v13, a4 - v9))
    {
      return 11;
    }
  }
  result = 0;
  *(_QWORD *)(a1 + 160) = a4;
  return result;
}

uint64_t reverse_seek(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4 < 0x18)
    return 9;
  v6 = v4 - 12;
  if (v4 - 12 >= 0x2000)
    v6 = 0x2000;
  *(_QWORD *)(a1 + 336) = 0;
  *(_QWORD *)(a1 + 344) = v6;
  v7 = v4 - v6;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *a3;
  if (v8 + a2 - *a3 <= v7 && v8 + a4 - v9 >= v7)
  {
    v5 = 0;
    a4 = v7 - v8 + v9;
  }
  else
  {
    **(_QWORD **)(a1 + 152) = v7;
    v5 = 12;
  }
  *a3 = a4;
  *(_QWORD *)(a1 + 8) = v7;
  return v5;
}

uint64_t lzma_decoder_uncompressed(uint64_t result, uint64_t a2, char a3)
{
  *(_QWORD *)(result + 28312) = a2;
  *(_BYTE *)(result + 28320) = a3;
  return result;
}

uint64_t lzma_lzma_decoder_memusage_nocheck(unsigned int *a1)
{
  return lzma_lz_decoder_memusage(*a1) + 28352;
}

uint64_t lzma_lzma_props_decode(_QWORD *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;

  if (a4 != 5)
    return 8;
  v7 = lzma_alloc(0x70uLL, a2);
  if (!v7)
    return 5;
  v8 = *a3;
  if (v8 <= 0xE0
    && (v9 = (((v8 - ((unsigned __int16)(109 * v8) >> 8)) >> 1) + ((109 * v8) >> 8)) >> 5,
        v7[7] = v9,
        v10 = (v8 - 45 * v9),
        v11 = 57 * v10,
        v12 = v10 - 9 * ((57 * v10) >> 9),
        v7[5] = v12,
        v7[6] = v11 >> 9,
        v12 + (v11 >> 9) <= 4))
  {
    v13 = 0;
    *v7 = *(_DWORD *)(a3 + 1);
    *((_QWORD *)v7 + 1) = 0;
    v7[4] = 0;
    *a1 = v7;
  }
  else
  {
    lzma_free(v7, a2);
    return 8;
  }
  return v13;
}

uint64_t lzma_lzma2_encoder_init(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  return lzma_lz_encoder_init(a1, a2, a3, (uint64_t (*)(_QWORD *, _QWORD *, _QWORD, _QWORD, _OWORD *))lzma2_encoder_init);
}

uint64_t lzma2_encoder_init(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
{
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  BOOL v15;
  uint64_t result;
  uint64_t v17;

  if (!a4)
    return 11;
  v9 = *(void **)a1;
  if (!v9)
  {
    v9 = lzma_alloc(0x100A8uLL, a2);
    if (!v9)
      return 5;
    *(_QWORD *)a1 = v9;
    *(_QWORD *)(a1 + 8) = lzma2_encode;
    *(_QWORD *)(a1 + 16) = lzma2_encoder_end;
    *(_QWORD *)(a1 + 24) = lzma2_encoder_options_update;
    *((_QWORD *)v9 + 1) = 0;
  }
  v10 = *a4;
  v11 = a4[2];
  *((_OWORD *)v9 + 2) = a4[1];
  *((_OWORD *)v9 + 3) = v11;
  *((_OWORD *)v9 + 1) = v10;
  v12 = a4[3];
  v13 = a4[4];
  v14 = a4[6];
  *((_OWORD *)v9 + 6) = a4[5];
  *((_OWORD *)v9 + 7) = v14;
  *((_OWORD *)v9 + 4) = v12;
  *((_OWORD *)v9 + 5) = v13;
  *(_DWORD *)v9 = 0;
  v15 = 1;
  *((_WORD *)v9 + 64) = 1;
  if (*((_QWORD *)v9 + 3))
    v15 = *((_DWORD *)v9 + 8) == 0;
  *((_BYTE *)v9 + 130) = v15;
  result = lzma_lzma_encoder_create((void **)v9 + 1, a2, 33, (unsigned int *)v9 + 4, (uint64_t)a5);
  if (!(_DWORD)result)
  {
    v17 = a5[1];
    result = 0;
    if (!((unint64_t)(v17 + *a5) >> 16))
      *a5 = 0x10000 - v17;
  }
  return result;
}

uint64_t lzma_lzma2_encoder_memusage(unsigned int *a1)
{
  uint64_t v1;

  v1 = lzma_lzma_encoder_memusage(a1);
  if (v1 == -1)
    return -1;
  else
    return v1 + 65704;
}

uint64_t lzma_lzma2_props_encode(_DWORD *a1, char *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t result;
  char v9;

  if (!a1)
    return 11;
  if (*a1 <= 0x1000u)
    v2 = 4095;
  else
    v2 = *a1 - 1;
  v3 = v2 | (v2 >> 2) | ((v2 | (v2 >> 2)) >> 3);
  v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  v5 = v4 | HIWORD(v4);
  if ((_DWORD)v5 == -1)
  {
    v9 = 40;
  }
  else
  {
    v6 = v5 + 1;
    if (v5 > 0x1FFE)
    {
      if (v5 > 0x1FFFFFE)
        v7 = lzma_fastpos[(unint64_t)v6 >> 24] + 48;
      else
        v7 = lzma_fastpos[(unint64_t)v6 >> 12] + 24;
    }
    else
    {
      v7 = lzma_fastpos[v6];
    }
    v9 = v7 - 24;
  }
  result = 0;
  *a2 = v9;
  return result;
}

uint64_t lzma_lzma2_block_size(unsigned int *a1)
{
  uint64_t v1;

  v1 = *a1;
  if (v1 <= 0x55555)
    return 0x100000;
  else
    return 3 * v1;
}

uint64_t lzma2_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  char *v9;
  uint64_t *v10;
  int v11;
  size_t *v12;
  uint64_t result;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  size_t v28;
  unint64_t v29;
  uint64_t *v30;
  size_t v31;
  size_t v32;
  BOOL v33;
  __int16 v34;
  char v35;
  __int16 v36;
  char v37;
  int v38;
  _BYTE *v39;
  int v40;
  _DWORD *v41;
  uint64_t v42;
  char *v43;
  uint64_t *v44;
  uint64_t *v45;

  v5 = *a4;
  if (*a4 < a5)
  {
    v6 = a5;
    v9 = (char *)(a1 + 160);
    v44 = (uint64_t *)(a1 + 152);
    v45 = (uint64_t *)(a1 + 136);
    v10 = (uint64_t *)(a1 + 144);
    v11 = *(_DWORD *)a1;
    v41 = (_DWORD *)(a1 + 16);
    v42 = a1 + 166;
    v43 = (char *)(a1 + 160);
    v12 = (size_t *)(a1 + 136);
    while (2)
    {
      switch(v11)
      {
        case 0:
          if (*(_DWORD *)(a2 + 36) - *(_DWORD *)(a2 + 24) + *(_DWORD *)(a2 + 28))
          {
            if (!*(_BYTE *)(a1 + 129) || (result = lzma_lzma_encoder_reset(*(_QWORD *)(a1 + 8), v41), !(_DWORD)result))
            {
              LODWORD(v14) = 0;
              *v45 = 0;
              v45[1] = 0;
              *(_DWORD *)a1 = 1;
              goto LABEL_9;
            }
          }
          else
          {
            v40 = *(_DWORD *)(a2 + 104);
            if (v40 == 3)
            {
              *a4 = v5 + 1;
              *(_BYTE *)(a3 + v5) = 0;
            }
            return v40 != 0;
          }
          return result;
        case 1:
          v14 = *v45;
LABEL_9:
          v15 = 0x200000 - v14;
          v16 = *(_DWORD *)(a2 + 100);
          v17 = *(_DWORD *)(a2 + 24);
          v18 = *(_DWORD *)(a2 + 28);
          if (v15 >= v16)
            v19 = v15 + v17 - (v16 + v18);
          else
            v19 = 0;
          v20 = lzma_lzma_encode(*(_QWORD *)(a1 + 8), (unsigned __int8 **)a2, v42, v10, 0x10000, v19);
          v21 = *(unsigned int *)(a2 + 28);
          v22 = *(_QWORD *)(a1 + 136) + (v18 + *(_DWORD *)(a2 + 24) - (v17 + v21));
          *(_QWORD *)(a1 + 136) = v22;
          if (v20 != 1)
            return 0;
          v23 = *v10;
          if (*v10 >= v22)
          {
            v34 = v22 + v21;
            *(_QWORD *)(a1 + 136) = v22 + v21;
            *(_DWORD *)(a2 + 28) = 0;
            if (*(_BYTE *)(a1 + 130))
              v35 = 1;
            else
              v35 = 2;
            *(_BYTE *)(a1 + 160) = v35;
            v36 = v34 - 1;
            *(_BYTE *)(a1 + 161) = HIBYTE(v36);
            *(_BYTE *)(a1 + 162) = v36;
            *(_QWORD *)(a1 + 152) = 0;
            *(_WORD *)(a1 + 129) = 1;
            v11 = 3;
            goto LABEL_40;
          }
          v24 = *(unsigned __int8 *)(a1 + 128);
          if (*(_BYTE *)(a1 + 128))
          {
            v25 = 0;
            if (*(_BYTE *)(a1 + 130))
              v26 = -32;
            else
              v26 = -64;
            *v9 = v26;
          }
          else
          {
            if (*(_BYTE *)(a1 + 129))
              v37 = -96;
            else
              v37 = 0x80;
            *(_BYTE *)(a1 + 161) = v37;
            v25 = 1;
          }
          *(_QWORD *)(a1 + 152) = v25;
          v38 = v22 - 1;
          v39 = (_BYTE *)(a1 + v25);
          v39[160] = *(_BYTE *)(a1 + v25 + 160) + BYTE2(v38);
          v39[161] = BYTE1(v38);
          v39[162] = v38;
          v39[163] = (unsigned __int16)(v23 - 1) >> 8;
          v39[164] = v23 - 1;
          if (v24)
          {
            lzma_lzma_lclppb_encode(v41, &v9[v25 + 5]);
            v23 = *v10;
          }
          *(_WORD *)(a1 + 128) = 0;
          *(_BYTE *)(a1 + 130) = 0;
          v27 = v23 + 6;
          *(_QWORD *)(a1 + 144) = v23 + 6;
          *(_DWORD *)a1 = 2;
          goto LABEL_39;
        case 2:
          v27 = *v10;
LABEL_39:
          lzma_bufcpy((uint64_t)v9, v44, v27, a3, a4, v6);
          v11 = 0;
          result = 0;
          if (*v44 == *v10)
            goto LABEL_40;
          return result;
        case 3:
          lzma_bufcpy((uint64_t)v9, v44, 3, a3, a4, v6);
          if (*v44 != 3)
            return 0;
          *(_DWORD *)a1 = 4;
          v5 = *a4;
          goto LABEL_20;
        case 4:
LABEL_20:
          v28 = v6 - v5;
          v29 = v6;
          v30 = v10;
          v31 = *v12;
          if (v28 >= *v12)
            v32 = *v12;
          else
            v32 = v28;
          memcpy((void *)(a3 + v5), (const void *)(*(_QWORD *)a2 + *(unsigned int *)(a2 + 24) - v31), v32);
          v11 = 0;
          result = 0;
          *a4 = v32 + v5;
          *v12 = v31 - v32;
          v33 = v31 > v28;
          v10 = v30;
          v6 = v29;
          v9 = v43;
          if (v33)
            return result;
LABEL_40:
          *(_DWORD *)a1 = v11;
LABEL_41:
          v5 = *a4;
          if (*a4 >= v6)
            return 0;
          continue;
        default:
          goto LABEL_41;
      }
    }
  }
  return 0;
}

void lzma2_encoder_end(void **a1, uint64_t a2)
{
  lzma_free(a1[1], a2);
  lzma_free(a1, a2);
}

uint64_t lzma2_encoder_options_update(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v8;

  v2 = *(_DWORD **)(a2 + 8);
  if (!v2 || *(_DWORD *)a1)
    return 11;
  v5 = v2[5];
  if (*(_DWORD *)(a1 + 36) == v5 && *(_DWORD *)(a1 + 40) == v2[6] && *(_DWORD *)(a1 + 44) == v2[7])
    return 0;
  if (v5 > 4)
    return 8;
  v6 = v2[6];
  if (v6 > 4 || v6 + v5 > 4)
    return 8;
  v8 = v2[7];
  if (v8 > 4)
    return 8;
  v3 = 0;
  *(_DWORD *)(a1 + 36) = v5;
  *(_DWORD *)(a1 + 40) = v6;
  *(_DWORD *)(a1 + 44) = v8;
  *(_WORD *)(a1 + 128) = 257;
  return v3;
}

uint64_t lzma_simple_arm64_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm64_code, 0, 4, 4, 1, a4);
}

uint64_t lzma_simple_arm64_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm64_code, 0, 4, 4, 0, a4);
}

uint64_t arm64_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t i;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unint64_t v12;
  int v13;
  unsigned int v14;
  int v15;

  if (a5 >= 4)
  {
    for (i = 0; ; i += 4)
    {
      v7 = a2 + i;
      v8 = *(_DWORD *)(a4 + i);
      if ((v8 & 0xFC000000) == 0x94000000)
      {
        v9 = v7 >> 2;
        if (!a3)
          v9 = -v9;
        v10 = (v8 + v9) & 0x3FFFFFF | 0x94000000;
      }
      else
      {
        if ((v8 & 0x9F000000) != 0x90000000 || (((v8 >> 3) + 0x20000) & 0x1C0000) != 0)
          goto LABEL_13;
        v13 = (v8 >> 3) & 0x1FFFFC | (v8 >> 29) & 3;
        v14 = v8 & 0x9000001F;
        v15 = v7 >> 12;
        if (!a3)
          v15 = -v15;
        v10 = (((v13 + v15) & 3) << 29) | v14 | (8 * (v13 + v15)) & 0x1FFFE0 | -((v13 + v15) & 0x20000) & 0xE00000;
      }
      *(_DWORD *)(a4 + i) = v10;
LABEL_13:
      result = i + 4;
      v12 = i + 8;
      if (v12 > a5)
        return result;
    }
  }
  return 0;
}

uint64_t lzma_lzma2_decoder_init(char **a1, uint64_t a2, _QWORD *a3)
{
  return lzma_lz_decoder_init(a1, a2, a3, (uint64_t (*)(char *, uint64_t, _QWORD, _QWORD, unint64_t *))lzma2_decoder_init);
}

uint64_t lzma2_decoder_init(char **a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char *v9;
  BOOL v10;

  v9 = *a1;
  if (!v9)
  {
    v9 = (char *)lzma_alloc(0xB8uLL, a2);
    if (!v9)
      return 5;
    *a1 = v9;
    a1[1] = (char *)lzma2_decode;
    a1[4] = (char *)lzma2_decoder_end;
    *(_OWORD *)(v9 + 8) = 0u;
    *(_OWORD *)(v9 + 24) = 0u;
    *((_QWORD *)v9 + 5) = 0;
  }
  *(_DWORD *)v9 = 0;
  v10 = 1;
  v9[64] = 1;
  if (*(_QWORD *)(a4 + 8))
    v10 = *(_DWORD *)(a4 + 16) == 0;
  v9[65] = v10;
  return lzma_lzma_decoder_create((_QWORD *)v9 + 1, a2, (unsigned int *)a4, a5);
}

uint64_t lzma_lzma2_decoder_memusage(unsigned int *a1)
{
  return lzma_lzma_decoder_memusage_nocheck(a1) + 184;
}

uint64_t lzma_lzma2_props_decode(_QWORD *a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t result;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  BOOL v10;
  int v11;

  if (a4 != 1)
    return 8;
  if (*a3 > 0x28u)
    return 8;
  v7 = lzma_alloc(0x70uLL, a2);
  if (!v7)
    return 5;
  v8 = v7;
  result = 0;
  v9 = *a3;
  v10 = v9 == 40;
  v11 = (v9 & 1 | 2) << ((*a3 >> 1) + 11);
  if (v10)
    v11 = -1;
  *(_DWORD *)v8 = v11;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 0;
  *a1 = v8;
  return result;
}

uint64_t lzma2_decode(int *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  uint64_t *v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  int v16;
  uint64_t result;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  size_t v22;
  unint64_t v23;

  v10 = (uint64_t *)(a2 + 8);
  v11 = a1 + 18;
  while (1)
  {
    while (1)
    {
      v12 = *a4;
      v13 = *a1;
      if (a5 <= *a4)
        break;
      switch(v13)
      {
        case 0:
          v14 = *(unsigned __int8 *)(a3 + v12);
          *a4 = v12 + 1;
          if (!v14)
            return 1;
          if (v14 > 0xDF || v14 == 1)
          {
            *((_WORD *)a1 + 32) = 257;
            v16 = 1;
          }
          else
          {
            v16 = *((unsigned __int8 *)a1 + 65);
            if (*((_BYTE *)a1 + 65))
              return 9;
          }
          if ((v14 & 0x80) != 0)
          {
            *((_QWORD *)a1 + 6) = (unint64_t)(v14 & 0x1F) << 16;
            *a1 = 1;
            if (v14 < 0xC0)
            {
              if (*((_BYTE *)a1 + 64))
                return 9;
              a1[1] = 6;
              if (v14 >= 0xA0)
              {
                (*((void (**)(_QWORD, _DWORD *))a1 + 3))(*((_QWORD *)a1 + 1), v11);
                v16 = *((unsigned __int8 *)a1 + 65);
              }
            }
            else
            {
              *((_BYTE *)a1 + 64) = 0;
              a1[1] = 5;
            }
          }
          else
          {
            if (v14 > 2)
              return 9;
            *(_QWORD *)a1 = 0x700000003;
          }
          if (v16)
          {
            result = 0;
            *((_BYTE *)a1 + 65) = 0;
            *(_BYTE *)(a2 + 40) = 1;
            return result;
          }
          break;
        case 1:
          *a4 = v12 + 1;
          *((_QWORD *)a1 + 6) += (unint64_t)*(unsigned __int8 *)(a3 + v12) << 8;
          *a1 = 2;
          continue;
        case 2:
          *a4 = v12 + 1;
          *((_QWORD *)a1 + 6) += *(unsigned __int8 *)(a3 + v12) + 1;
          *a1 = 3;
          (*((void (**)(_QWORD))a1 + 4))(*((_QWORD *)a1 + 1));
          continue;
        case 3:
          *a4 = v12 + 1;
          *((_QWORD *)a1 + 7) = (unint64_t)*(unsigned __int8 *)(a3 + v12) << 8;
          *a1 = 4;
          continue;
        case 4:
          *a4 = v12 + 1;
          *((_QWORD *)a1 + 7) += *(unsigned __int8 *)(a3 + v12) + 1;
          *a1 = a1[1];
          continue;
        case 5:
          *a4 = v12 + 1;
          if (lzma_lzma_lclppb_decode(v11, *(unsigned __int8 *)(a3 + v12)))
            return 9;
          (*((void (**)(_QWORD, _DWORD *))a1 + 3))(*((_QWORD *)a1 + 1), v11);
          *a1 = 6;
          continue;
        case 6:
          goto LABEL_12;
        case 7:
          v20 = *((_QWORD *)a1 + 7);
          if (a5 - *a4 <= v20)
            v21 = a5;
          else
            v21 = v20 + v12;
          v22 = lzma_bufcpy(a3, a4, v21, *(_QWORD *)a2, v10, *(_QWORD *)(a2 + 24));
          *((_QWORD *)a1 + 7) = v20 - v22;
          v23 = *(_QWORD *)(a2 + 8);
          if (v23 > *(_QWORD *)(a2 + 16))
            *(_QWORD *)(a2 + 16) = v23;
          if (v20 != v22)
            return 0;
          *a1 = 0;
          continue;
        default:
          return 11;
      }
    }
    if (v13 != 6)
      return 0;
LABEL_12:
    result = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t))a1 + 2))(*((_QWORD *)a1 + 1), a2, a3, a4, a5);
    v18 = *a4 - v12;
    v19 = *((_QWORD *)a1 + 7);
    if (v19 < v18)
      return 9;
    *((_QWORD *)a1 + 7) = v19 - v18;
    if ((_DWORD)result != 1)
      return result;
    if (v19 != v18)
      return 9;
    *a1 = 0;
  }
}

void lzma2_decoder_end(void **a1, uint64_t a2)
{
  lzma_free(a1[1], a2);
  lzma_free(a1, a2);
}

uint64_t lzma_stream_decoder_mt(_QWORD *a1, int8x16_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = stream_decoder_mt_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }
  return v4;
}

uint64_t stream_decoder_mt_init(uint64_t a1, uint64_t a2, int8x16_t *a3)
{
  _DWORD *v6;
  int8x16_t v7;
  int8x16_t v8;
  int16x8_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t result;
  _OWORD *v13;
  char *v14;
  pthread_mutex_t *v15;

  if ((a3->i32[1] - 16385) < 0xFFFFC000 || a3->i32[0] > 0x3Fu)
    return 8;
  if (*(uint64_t (**)())(a1 + 16) != stream_decoder_mt_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = stream_decoder_mt_init;
  v6 = *(_DWORD **)a1;
  if (!*(_QWORD *)a1)
  {
    v14 = (char *)lzma_alloc(0x700uLL, a2);
    if (v14)
    {
      v6 = v14;
      *(_QWORD *)a1 = v14;
      v15 = (pthread_mutex_t *)(v14 + 552);
      if (!pthread_mutex_init((pthread_mutex_t *)(v14 + 552), 0))
      {
        v6[166] = 0;
        if (!pthread_cond_init((pthread_cond_t *)(v6 + 154), 0))
        {
          *(_QWORD *)(a1 + 24) = stream_decode_mt;
          *(_QWORD *)(a1 + 32) = stream_decoder_mt_end;
          *(_QWORD *)(a1 + 48) = stream_decoder_mt_get_check;
          *(_QWORD *)(a1 + 56) = stream_decoder_mt_memconfig;
          *(_QWORD *)(a1 + 40) = stream_decoder_mt_get_progress;
          *((_QWORD *)v6 + 37) = -1;
          *(_OWORD *)(v6 + 122) = 0u;
          *(_OWORD *)(v6 + 126) = 0u;
          *(_OWORD *)(v6 + 130) = 0u;
          *(_OWORD *)(v6 + 134) = 0u;
          *((_QWORD *)v6 + 1) = 0;
          *((_QWORD *)v6 + 2) = -1;
          *(_OWORD *)(v6 + 6) = 0u;
          *(_OWORD *)(v6 + 10) = 0u;
          *(_OWORD *)(v6 + 14) = 0u;
          *(_OWORD *)(v6 + 18) = 0u;
          *((_QWORD *)v6 + 86) = 0;
          *((_QWORD *)v6 + 54) = 0;
          v6[114] = 0;
          *((_QWORD *)v6 + 58) = 0;
          *((_QWORD *)v6 + 59) = 0;
          goto LABEL_6;
        }
        pthread_mutex_destroy(v15);
      }
      lzma_free(v6, a2);
    }
    return 5;
  }
LABEL_6:
  lzma_filters_free((_QWORD *)v6 + 37, a2);
  threads_end((uint64_t)v6, a2);
  *v6 = 0;
  *(_QWORD *)(v6 + 111) = 0;
  *((_QWORD *)v6 + 60) = 0;
  *(_OWORD *)(v6 + 174) = 0u;
  *((_QWORD *)v6 + 91) = 0;
  *((_QWORD *)v6 + 93) = 0;
  *((_QWORD *)v6 + 92) = 0;
  v6[110] = a3[1].i32[0];
  v7 = a3[4];
  v8 = (int8x16_t)vcgtq_u64((uint64x2_t)v7, (uint64x2_t)vdupq_n_s64(1uLL));
  v9 = (int16x8_t)vsubq_s64((int64x2_t)vandq_s8(v7, v8), (int64x2_t)vmvnq_s8(v8));
  *((int16x8_t *)v6 + 42) = v9;
  if (v9.i64[0] > (unint64_t)v9.i64[1])
    *((_QWORD *)v6 + 84) = v9.i64[1];
  v10 = a3->u8[0];
  *((_BYTE *)v6 + 752) = v10 & 1;
  v9.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)vdup_n_s16(v10), (uint16x4_t)0xFFFDFFFCFFFEFFFFLL) & 0xFF01FF01FF01FF01;
  *(_DWORD *)((char *)v6 + 753) = vmovn_s16(v9).u32[0];
  *((_BYTE *)v6 + 757) = (v10 & 0x20) != 0;
  *((_WORD *)v6 + 379) = 1;
  *((_QWORD *)v6 + 95) = 0;
  v11 = a3->u32[1];
  v6[113] = v11;
  result = lzma_outq_init((uint64_t)(v6 + 122), a2, v11);
  if (!(_DWORD)result)
  {
    v13 = lzma_index_hash_init(*((_OWORD **)v6 + 54), a2);
    *((_QWORD *)v6 + 54) = v13;
    if (v13)
    {
      result = 0;
      *v6 = 0;
      *((_QWORD *)v6 + 95) = 0;
      return result;
    }
    return 5;
  }
  return result;
}

uint64_t stream_decode_mt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  unint64_t v10;
  uint64_t *v11;
  char *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  _OWORD *v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t thread;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t buf;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  pthread_mutex_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  _OWORD *v88;
  int v89;
  char *v90;
  _OWORD v94[3];
  uint64_t v95;
  char v96;
  int64x2_t v97;

  v10 = a5;
  v11 = a4;
  v96 = 0;
  v89 = 1;
  if (a9 != 3)
    v89 = *a4 == a5 && *(_BYTE *)(a1 + 759) == 0;
  v15 = (char *)(a1 + 768);
  v16 = (uint64_t *)(a1 + 760);
  v97 = 0uLL;
  v83 = a1 + 8;
  v84 = (_QWORD *)(a1 + 488);
  v87 = a1 + 376;
  v88 = (_OWORD *)(a1 + 88);
  *(_BYTE *)(a1 + 759) = 0;
  v85 = (uint64_t *)(a1 + 296);
  v86 = (uint64_t *)(a1 + 760);
  v80 = (pthread_mutex_t *)(a1 + 552);
  v17 = *(_DWORD *)a1;
  v90 = (char *)(a1 + 768);
  while (2)
  {
    switch(v17)
    {
      case 0:
        v18 = v10;
        v19 = *v11;
        v20 = v18;
        lzma_bufcpy(a3, v11, v18, (uint64_t)v15, v16, 12);
        *(_QWORD *)(a1 + 736) += *v11 - v19;
        if (*(_QWORD *)(a1 + 760) < 0xCuLL)
          return 0;
        *v16 = 0;
        v21 = lzma_stream_header_decode(v87, (uint64_t)v15);
        if ((_DWORD)v21)
        {
          v30 = v21;
          if ((_DWORD)v21 == 7)
          {
            if (*(_BYTE *)(a1 + 758))
              return 7;
            else
              return 9;
          }
        }
        else
        {
          *(_BYTE *)(a1 + 758) = 0;
          v22 = *(_DWORD *)(a1 + 392);
          *(_DWORD *)(a1 + 96) = v22;
          *(_DWORD *)a1 = 1;
          if (*(_BYTE *)(a1 + 752) && !v22)
          {
            return 2;
          }
          else if (*(_BYTE *)(a1 + 753) && !lzma_check_is_supported(v22))
          {
            return 3;
          }
          else
          {
            v10 = v20;
            if (!*(_BYTE *)(a1 + 754))
              goto LABEL_14;
            return 4;
          }
        }
        return v30;
      case 1:
LABEL_14:
        v23 = *v11;
        if (*v11 >= v10)
        {
          v40 = *v11;
          goto LABEL_54;
        }
        if (*v16)
        {
          v24 = *(_DWORD *)(a1 + 92);
        }
        else
        {
          if (!*(_BYTE *)(a3 + v23))
            goto LABEL_62;
          v24 = 4 * *(unsigned __int8 *)(a3 + v23) + 4;
          *(_DWORD *)(a1 + 92) = v24;
        }
        lzma_bufcpy(a3, v11, v10, (uint64_t)v15, v16, v24);
        if (*(_QWORD *)(a1 + 760) < (unint64_t)*(unsigned int *)(a1 + 92))
        {
          v40 = *v11;
LABEL_54:
          *(_QWORD *)(a1 + 736) += v40 - v23;
          if (a9 == 3 && *(_BYTE *)(a1 + 757))
            goto LABEL_129;
          v29 = read_output_and_wait(a1, a2, a6, a7, a8, 0, v89, &v97, &v96);
          if ((_DWORD)v29)
            return v29;
          if (!*(_DWORD *)(a1 + 448))
            return 0;
LABEL_103:
          v17 = 11;
          goto LABEL_104;
        }
        *(_QWORD *)(a1 + 760) = 0;
        *(_DWORD *)(a1 + 88) = 1;
        *(_QWORD *)(a1 + 120) = v85;
        v41 = lzma_block_header_decode((uint64_t)v88, a2, v15);
        if (v41)
        {
          *(_QWORD *)(a1 + 736) += *v11 - v23;
          if (v41 != 1)
          {
            if (v41 == 102)
            {
LABEL_62:
              v17 = 7;
              goto LABEL_104;
            }
            *(_DWORD *)(a1 + 448) = v41;
            goto LABEL_103;
          }
        }
        else
        {
          *(_BYTE *)(a1 + 288) = *(_BYTE *)(a1 + 755);
          *(_QWORD *)(a1 + 736) += *v11 - v23;
        }
        v45 = lzma_raw_decoder_memusage(v85);
        *(_QWORD *)(a1 + 712) = v45;
        if (v45 == -1)
        {
          *(_DWORD *)(a1 + 448) = 8;
          goto LABEL_103;
        }
        v25 = v45;
        *(_DWORD *)a1 = 2;
LABEL_18:
        if (v25 > *(_QWORD *)(a1 + 680))
        {
          v30 = read_output_and_wait(a1, a2, a6, a7, a8, 0, 1, &v97, &v96);
          if (!(_DWORD)v30)
          {
            if (*(_DWORD *)(a1 + 536))
              return 0;
            else
              return 6;
          }
          return v30;
        }
        v81 = a6;
        v26 = v10;
        v27 = *(_QWORD *)(a1 + 104);
        if (v27 > 0x5555555555555555 || (v28 = *(_QWORD *)(a1 + 112), v28 >= 0x5555555555555556))
        {
          v17 = 5;
          *(_DWORD *)a1 = 5;
          goto LABEL_66;
        }
        v42 = ((v27 + 3) & 0xFFFFFFFFFFFFFFFCLL) + lzma_check_size(*(_DWORD *)(a1 + 392));
        *(_QWORD *)(a1 + 720) = v42;
        v43 = v28 + v42 + 64;
        if (__CFADD__(v43, v25) || (v44 = v43 + v25, *(_QWORD *)(a1 + 728) = v44, v44 > *(_QWORD *)(a1 + 672)))
        {
          v17 = 5;
          *(_DWORD *)a1 = 5;
          v15 = v90;
LABEL_66:
          v10 = v26;
          a6 = v81;
          continue;
        }
        lzma_next_end(v83, a2);
        *(_QWORD *)(a1 + 688) = 0;
        v46 = *(_QWORD *)(a1 + 432);
        v47 = lzma_block_unpadded_size((uint64_t)v88);
        v48 = lzma_index_hash_append(v46, v47, *(_QWORD *)(a1 + 112));
        v10 = v26;
        if (v48)
        {
          *(_DWORD *)(a1 + 448) = v48;
          v17 = 11;
          *(_DWORD *)a1 = 11;
          v15 = v90;
          a6 = v81;
          continue;
        }
        *(_DWORD *)a1 = 3;
        v15 = v90;
        a6 = v81;
LABEL_75:
        LOBYTE(v94[0]) = 0;
        v29 = read_output_and_wait(a1, a2, a6, a7, a8, v94, 1, &v97, &v96);
        if ((_DWORD)v29)
          return v29;
        if (*(_DWORD *)(a1 + 448))
        {
LABEL_93:
          v17 = 11;
          *(_DWORD *)a1 = 11;
          v16 = v86;
          continue;
        }
        if (!LOBYTE(v94[0]))
          return 0;
        v49 = v11;
        pthread_mutex_lock(v80);
        v50 = *(_QWORD *)(a1 + 696);
        v51 = *(_QWORD *)(a1 + 704);
        v52 = *(_QWORD *)(a1 + 472);
        pthread_mutex_unlock(v80);
        v53 = *(_QWORD *)(a1 + 672) - *(_QWORD *)(a1 + 728);
        v54 = v51 + v50;
        if (*(_QWORD *)(a1 + 520) + v54 > v53)
          lzma_outq_clear_cache2((uint64_t)v84, a2, *(_QWORD *)(a1 + 112));
        v11 = v49;
        if (v52)
        {
          v15 = v90;
          if (*(_QWORD *)(a1 + 528) + v54 > v53
            && (*(_QWORD *)(v52 + 384) > *(_QWORD *)(a1 + 712) || (v52 = *(_QWORD *)(v52 + 392)) != 0))
          {
            v55 = 0;
            do
            {
              lzma_next_end(v52 + 96, a2);
              v55 += *(_QWORD *)(v52 + 384);
              *(_QWORD *)(v52 + 384) = 0;
              v52 = *(_QWORD *)(v52 + 392);
            }
            while (v52);
          }
          else
          {
            v55 = 0;
          }
        }
        else
        {
          v55 = 0;
          v15 = v90;
        }
        pthread_mutex_lock(v80);
        *(_QWORD *)(a1 + 704) -= v55;
        *(_QWORD *)(a1 + 696) += *(_QWORD *)(a1 + 712) + *(_QWORD *)(a1 + 720);
        pthread_mutex_unlock(v80);
        thread = lzma_outq_prealloc_buf((uint64_t)v84, a2, *(_QWORD *)(a1 + 112));
        if ((_DWORD)thread || (thread = get_thread(a1, a2), (_DWORD)thread))
        {
          v30 = thread;
          goto LABEL_134;
        }
        v57 = *(_QWORD *)(a1 + 480);
        *(_QWORD *)(v57 + 384) = *(_QWORD *)(a1 + 712);
        v58 = v88[5];
        v59 = v88[6];
        v60 = v88[8];
        *(_OWORD *)(v57 + 288) = v88[7];
        *(_OWORD *)(v57 + 304) = v60;
        *(_OWORD *)(v57 + 256) = v58;
        *(_OWORD *)(v57 + 272) = v59;
        v61 = v88[1];
        v62 = v88[2];
        v63 = v88[4];
        *(_OWORD *)(v57 + 224) = v88[3];
        *(_OWORD *)(v57 + 240) = v63;
        *(_OWORD *)(v57 + 192) = v61;
        *(_OWORD *)(v57 + 208) = v62;
        *(_OWORD *)(v57 + 176) = *v88;
        v64 = v88[9];
        v65 = v88[10];
        v66 = v88[12];
        *(_OWORD *)(v57 + 352) = v88[11];
        *(_OWORD *)(v57 + 368) = v66;
        *(_OWORD *)(v57 + 320) = v64;
        *(_OWORD *)(v57 + 336) = v65;
        v67 = lzma_block_decoder_init(*(_QWORD *)(a1 + 480) + 96, a2, *(_QWORD *)(a1 + 480) + 176);
        lzma_filters_free(v85, a2);
        v68 = *(_QWORD *)(a1 + 480);
        *(_QWORD *)(v68 + 208) = 0;
        if (v67)
        {
          *(_DWORD *)(a1 + 448) = v67;
          v10 = a5;
          goto LABEL_93;
        }
        v69 = *(_QWORD *)(a1 + 720);
        *(_QWORD *)(v68 + 16) = v69;
        v70 = lzma_alloc(v69, a2);
        v71 = *(_QWORD *)(a1 + 480);
        *(_QWORD *)(v71 + 8) = v70;
        if (v70)
        {
          buf = lzma_outq_get_buf((uint64_t)v84, v71);
          v73 = *(_QWORD *)(a1 + 480);
          *(_QWORD *)(v73 + 64) = buf;
          pthread_mutex_lock((pthread_mutex_t *)(v73 + 400));
          v74 = *(_QWORD *)(a1 + 480);
          *(_DWORD *)v74 = 1;
          pthread_cond_signal((pthread_cond_t *)(v74 + 464));
          pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 480) + 400));
          pthread_mutex_lock(v80);
          lzma_outq_enable_partial_output(v84, (uint64_t (*)(void))worker_enable_partial_update);
          pthread_mutex_unlock(v80);
          *(_DWORD *)a1 = 4;
          v10 = a5;
          v16 = v86;
LABEL_96:
          if (a9 == 3)
          {
            v75 = *(uint64_t **)(a1 + 480);
            if (*(_BYTE *)(a1 + 757) && v10 - *v11 < v75[2] - v75[3])
            {
LABEL_129:
              threads_stop(a1);
              return 9;
            }
          }
          else
          {
            v75 = *(uint64_t **)(a1 + 480);
          }
          v76 = v75[2];
          *(_QWORD *)&v94[0] = v75[3];
          lzma_bufcpy(a3, v11, v10, v75[1], (uint64_t *)v94, v76);
          pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 480) + 400));
          v77 = *(_QWORD *)(a1 + 480);
          *(_QWORD *)(v77 + 24) = *(_QWORD *)&v94[0];
          pthread_cond_signal((pthread_cond_t *)(v77 + 464));
          pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 480) + 400));
          v30 = read_output_and_wait(a1, a2, a6, a7, a8, 0, v89, &v97, &v96);
          if ((_DWORD)v30)
            return v30;
          if (*(_DWORD *)(a1 + 448))
            goto LABEL_103;
          if (*(_QWORD *)(*(_QWORD *)(a1 + 480) + 24) < *(_QWORD *)(*(_QWORD *)(a1 + 480) + 16))
            return v30;
          *(_QWORD *)(a1 + 480) = 0;
          v17 = 1;
LABEL_104:
          *(_DWORD *)a1 = v17;
          continue;
        }
        v30 = 5;
LABEL_134:
        threads_stop(a1);
        return v30;
      case 2:
        v25 = *(_QWORD *)(a1 + 712);
        goto LABEL_18;
      case 3:
        goto LABEL_75;
      case 4:
        goto LABEL_96;
      case 5:
        v29 = read_output_and_wait(a1, a2, a6, a7, a8, 0, 1, &v97, &v96);
        if ((_DWORD)v29)
          return v29;
        if (*(_DWORD *)(a1 + 536))
          return 0;
        lzma_outq_clear_cache((uint64_t)v84, a2);
        threads_end(a1, a2);
        v30 = lzma_block_decoder_init(v83, a2, (uint64_t)v88);
        lzma_filters_free(v85, a2);
        *(_QWORD *)(a1 + 120) = 0;
        if ((_DWORD)v30)
          return v30;
        *(_QWORD *)(a1 + 688) = *(_QWORD *)(a1 + 712);
        *(_DWORD *)a1 = 6;
LABEL_26:
        v79 = *v11;
        v82 = *a7;
        v29 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t))(a1 + 32))(*(_QWORD *)(a1 + 8), a2, a3, v11, v10);
        *(_QWORD *)(a1 + 736) += *v11 - v79;
        *(_QWORD *)(a1 + 744) += *a7 - v82;
        if ((_DWORD)v29 != 1)
          return v29;
        v31 = *(_QWORD *)(a1 + 432);
        v32 = lzma_block_unpadded_size((uint64_t)v88);
        v29 = lzma_index_hash_append(v31, v32, *(_QWORD *)(a1 + 112));
        if ((_DWORD)v29)
          return v29;
        v17 = 1;
        *(_DWORD *)a1 = 1;
        v16 = v86;
        v15 = v90;
        continue;
      case 6:
        goto LABEL_26;
      case 7:
        v29 = read_output_and_wait(a1, a2, a6, a7, a8, 0, 1, &v97, &v96);
        if ((_DWORD)v29)
          return v29;
        if (*(_DWORD *)(a1 + 536))
          return 0;
        *(_DWORD *)a1 = 8;
LABEL_32:
        v33 = v16;
        v34 = *v11;
        if (*v11 >= v10)
          return 0;
        v29 = lzma_index_hash_decode(*(_QWORD *)(a1 + 432), a3, (unint64_t *)v11, v10);
        v35 = *v11;
        *(_QWORD *)(a1 + 736) += *v11 - v34;
        if ((_DWORD)v29 != 1)
          return v29;
        *(_DWORD *)a1 = 9;
        v16 = v33;
        v15 = v90;
LABEL_36:
        lzma_bufcpy(a3, v11, a5, (uint64_t)v15, v16, 12);
        *(_QWORD *)(a1 + 736) += *v11 - v35;
        if (*(_QWORD *)(a1 + 760) < 0xCuLL)
          return 0;
        *v16 = 0;
        v95 = 0;
        memset(v94, 0, sizeof(v94));
        v36 = lzma_stream_footer_decode((uint64_t)v94, (uint64_t)v15);
        if (v36)
        {
          if (v36 == 7)
            return 9;
          else
            return v36;
        }
        v37 = lzma_index_hash_size(*(_QWORD *)(a1 + 432));
        if (v37 != *((_QWORD *)&v94[0] + 1))
          return 9;
        v29 = lzma_stream_flags_compare(v87, (uint64_t)v94);
        if ((_DWORD)v29)
          return v29;
        if (!*(_BYTE *)(a1 + 756))
          return 1;
        *(_DWORD *)a1 = 10;
        v10 = a5;
LABEL_42:
        v38 = *v11;
        if (*v11 >= v10)
        {
LABEL_107:
          if (a9 != 3)
            return 0;
          if (*v16)
            return 9;
          return 1;
        }
        while (!*(_BYTE *)(a3 + v38))
        {
          *v11 = ++v38;
          ++*(_QWORD *)(a1 + 736);
          *(_QWORD *)(a1 + 760) = (*(_DWORD *)(a1 + 760) + 1) & 3;
          if (v10 == v38)
            goto LABEL_107;
        }
        if (*v16)
        {
          *v11 = v38 + 1;
          ++*(_QWORD *)(a1 + 736);
          return 9;
        }
        v39 = lzma_index_hash_init(*(_OWORD **)(a1 + 432), a2);
        *(_QWORD *)(a1 + 432) = v39;
        if (!v39)
          return 5;
        v17 = 0;
        *(_DWORD *)a1 = 0;
        *(_QWORD *)(a1 + 760) = 0;
        continue;
      case 8:
        goto LABEL_32;
      case 9:
        v35 = *v11;
        goto LABEL_36;
      case 10:
        goto LABEL_42;
      case 11:
        if (*(_BYTE *)(a1 + 757))
          return *(unsigned int *)(a1 + 448);
        v30 = read_output_and_wait(a1, a2, a6, a7, a8, 0, 1, &v97, &v96);
        if ((_DWORD)v30)
          return v30;
        if (*(_DWORD *)(a1 + 536))
          return 0;
        return *(unsigned int *)(a1 + 448);
      default:
        return 11;
    }
  }
}

void stream_decoder_mt_end(uint64_t *a1, uint64_t a2)
{
  double v4;

  threads_end((uint64_t)a1, a2);
  lzma_outq_end(a1 + 61, a2);
  lzma_next_end((uint64_t)(a1 + 1), a2);
  lzma_filters_free(a1 + 37, a2);
  lzma_index_hash_end(a1[54], a2, v4);
  lzma_free(a1, a2);
}

uint64_t stream_decoder_mt_get_check(uint64_t a1)
{
  return *(unsigned int *)(a1 + 392);
}

uint64_t stream_decoder_mt_memconfig(uint64_t a1, unint64_t *a2, _QWORD *a3, unint64_t a4)
{
  pthread_mutex_t *v8;
  uint64_t result;

  v8 = (pthread_mutex_t *)(a1 + 552);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  *a2 = *(_QWORD *)(a1 + 696) + *(_QWORD *)(a1 + 688) + *(_QWORD *)(a1 + 704) + *(_QWORD *)(a1 + 520);
  pthread_mutex_unlock(v8);
  if (!(*a2 >> 15))
    *a2 = 0x8000;
  *a3 = *(_QWORD *)(a1 + 680);
  if (!a4)
    return 0;
  if (*a2 > a4)
    return 6;
  result = 0;
  *(_QWORD *)(a1 + 680) = a4;
  return result;
}

uint64_t stream_decoder_mt_get_progress(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  pthread_mutex_t *v6;
  unint64_t v7;
  uint64_t v8;
  pthread_mutex_t *v9;

  v6 = (pthread_mutex_t *)(a1 + 552);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  *a2 = *(_QWORD *)(a1 + 736);
  *a3 = *(_QWORD *)(a1 + 744);
  if (*(_DWORD *)(a1 + 456))
  {
    v7 = 0;
    v8 = 400;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 464) + v8));
      v9 = (pthread_mutex_t *)(*(_QWORD *)(a1 + 464) + v8);
      *a2 += *(_QWORD *)&v9[-6].__opaque[48];
      *a3 += v9[-5].__sig;
      pthread_mutex_unlock(v9);
      ++v7;
      v8 += 528;
    }
    while (v7 < *(unsigned int *)(a1 + 456));
  }
  return pthread_mutex_unlock(v6);
}

double threads_end(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double result;

  if (*(_DWORD *)(a1 + 456))
  {
    v4 = 0;
    v5 = 400;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 464) + v5));
      v6 = *(_QWORD *)(a1 + 464) + v5;
      *(_DWORD *)(v6 - 400) = 3;
      pthread_cond_signal((pthread_cond_t *)(v6 + 64));
      pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 464) + v5));
      ++v4;
      v7 = *(unsigned int *)(a1 + 456);
      v5 += 528;
    }
    while (v4 < v7);
    if ((_DWORD)v7)
    {
      v8 = 0;
      v9 = 520;
      do
      {
        pthread_join(*(pthread_t *)(*(_QWORD *)(a1 + 464) + v9), 0);
        ++v8;
        v9 += 528;
      }
      while (v8 < *(unsigned int *)(a1 + 456));
    }
  }
  lzma_free(*(void **)(a1 + 464), a2);
  *(_DWORD *)(a1 + 456) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 696) = 0u;
  return result;
}

uint64_t threads_stop(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;

  if (*(_DWORD *)(result + 456))
  {
    v1 = result;
    v2 = 0;
    v3 = 400;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(v1 + 464) + v3));
      v4 = *(_QWORD *)(v1 + 464);
      v5 = (_DWORD *)(v4 + v3 - 400);
      if (*v5)
      {
        *v5 = 2;
        pthread_cond_signal((pthread_cond_t *)(v4 + v3 + 64));
        v4 = *(_QWORD *)(v1 + 464);
      }
      result = pthread_mutex_unlock((pthread_mutex_t *)(v4 + v3));
      ++v2;
      v3 += 528;
    }
    while (v2 < *(unsigned int *)(v1 + 456));
  }
  return result;
}

uint64_t read_output_and_wait(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, _BYTE *a6, int a7, int64x2_t *a8, _BYTE *a9)
{
  pthread_mutex_t *v14;
  uint64_t *v15;
  int64x2_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unsigned int v22;
  int64x2_t v23;
  int64x2_t v25;
  pthread_cond_t *v27;
  timespec __tp;

  v14 = (pthread_mutex_t *)(a1 + 552);
  v15 = (uint64_t *)(a1 + 488);
  v27 = (pthread_cond_t *)(a1 + 616);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  v16.i64[0] = 999999999;
  v25 = v16;
  while (1)
  {
    v17 = *a4;
    while (1)
    {
      v18 = lzma_outq_read(v15, a2, a3, a4, a5, 0, 0);
      if ((_DWORD)v18 != 1)
        break;
      lzma_outq_enable_partial_output(v15, (uint64_t (*)(void))worker_enable_partial_update);
    }
    v19 = v18;
    if ((_DWORD)v18)
      break;
    if (*a4 == a5 && *a4 != v17)
      *(_BYTE *)(a1 + 759) = 1;
    v19 = *(unsigned int *)(a1 + 444);
    if ((_DWORD)v19)
    {
      if (*(_BYTE *)(a1 + 757))
        break;
      *(_DWORD *)(a1 + 448) = 11;
    }
    if (a6
      && *(_QWORD *)(a1 + 672) - (*(_QWORD *)(a1 + 696) + *(_QWORD *)(a1 + 528)) >= *(_QWORD *)(a1 + 728)
      && *(_DWORD *)(a1 + 536) < *(_DWORD *)(a1 + 544)
      && (*(_DWORD *)(a1 + 456) < *(_DWORD *)(a1 + 452) || *(_QWORD *)(a1 + 472)))
    {
      v19 = 0;
      *a6 = 1;
      goto LABEL_35;
    }
    if (!a7
      || !*(_DWORD *)(a1 + 536)
      || lzma_outq_is_readable(v15)
      || (v21 = *(_QWORD *)(a1 + 480)) != 0
      && *(_DWORD *)(v21 + 88)
      && *(_QWORD *)(*(_QWORD *)(v21 + 64) + 32) == *(_QWORD *)(v21 + 24))
    {
      v19 = 0;
      goto LABEL_35;
    }
    v22 = *(_DWORD *)(a1 + 440);
    if (v22)
    {
      if (!*a9)
      {
        *a9 = 1;
        a8->i64[0] = v22 / 0x3E8uLL;
        a8->i64[1] = 1000000 * (v22 % 0x3E8);
        __tp.tv_sec = 0;
        __tp.tv_nsec = 0;
        clock_gettime(*(clockid_t *)(a1 + 664), &__tp);
        v23 = vaddq_s64(*a8, (int64x2_t)__tp);
        *(int8x16_t *)a8 = vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_s64(vdupq_laneq_s64(v23, 1), v25).i64[0], 0), (int8x16_t)vaddq_s64(v23, (int64x2_t)xmmword_229959730), (int8x16_t)v23);
      }
      if (pthread_cond_timedwait(v27, v14, (const timespec *)a8))
      {
        v19 = 101;
LABEL_35:
        pthread_mutex_unlock(v14);
        return v19;
      }
    }
    else
    {
      pthread_cond_wait(v27, v14);
    }
  }
  pthread_mutex_unlock(v14);
  if ((_DWORD)v19 != 101)
    threads_stop(a1);
  return v19;
}

uint64_t get_thread(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  char *v9;
  int v10;
  char *v11;
  pthread_cond_t *v12;
  char *v13;
  pthread_t *v14;
  sigset_t v15;
  sigset_t v16;

  v4 = (pthread_mutex_t *)(a1 + 552);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  v5 = *(_QWORD *)(a1 + 472);
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 384);
    *(_QWORD *)(a1 + 472) = *(_QWORD *)(v5 + 392);
    *(_QWORD *)(a1 + 480) = v5;
    *(_QWORD *)(a1 + 704) -= v6;
  }
  pthread_mutex_unlock(v4);
  v7 = *(char **)(a1 + 480);
  if (v7)
    goto LABEL_4;
  v9 = *(char **)(a1 + 464);
  if (v9 || (v9 = (char *)lzma_alloc(528 * *(unsigned int *)(a1 + 452), a2), (*(_QWORD *)(a1 + 464) = v9) != 0))
  {
    v10 = *(_DWORD *)(a1 + 456);
    v7 = &v9[528 * v10];
    if (!pthread_mutex_init((pthread_mutex_t *)(v7 + 400), 0))
    {
      v11 = &v9[528 * v10];
      v12 = (pthread_cond_t *)(v11 + 464);
      *((_DWORD *)v11 + 128) = 0;
      if (!pthread_cond_init((pthread_cond_t *)(v11 + 464), 0))
      {
        *(_DWORD *)v7 = 0;
        v13 = &v9[528 * v10];
        *((_QWORD *)v13 + 1) = 0;
        *((_QWORD *)v13 + 2) = 0;
        *((_QWORD *)v13 + 6) = a1;
        *((_QWORD *)v13 + 7) = a2;
        *((_QWORD *)v13 + 8) = 0;
        *((_QWORD *)v13 + 12) = 0;
        *((_QWORD *)v13 + 13) = -1;
        *((_OWORD *)v13 + 7) = 0u;
        *((_OWORD *)v13 + 8) = 0u;
        *((_OWORD *)v13 + 9) = 0u;
        *((_OWORD *)v13 + 10) = 0u;
        *((_QWORD *)v13 + 48) = 0;
        v14 = (pthread_t *)(v13 + 520);
        v15 = -1;
        v16 = 0;
        pthread_sigmask(3, &v15, &v16);
        LODWORD(v14) = pthread_create(v14, 0, (void *(__cdecl *)(void *))worker_decoder, &v9[528 * v10]);
        pthread_sigmask(3, &v16, 0);
        if (!(_DWORD)v14)
        {
          ++*(_DWORD *)(a1 + 456);
          *(_QWORD *)(a1 + 480) = v7;
LABEL_4:
          result = 0;
          *((_QWORD *)v7 + 3) = 0;
          *((_QWORD *)v7 + 4) = 0;
          *((_QWORD *)v7 + 5) = 0;
          *((_QWORD *)v7 + 9) = 0;
          *((_QWORD *)v7 + 10) = 0;
          *((_DWORD *)v7 + 22) = 0;
          return result;
        }
        pthread_cond_destroy(v12);
      }
      pthread_mutex_destroy((pthread_mutex_t *)(v7 + 400));
    }
  }
  return 5;
}

uint64_t worker_enable_partial_update(uint64_t a1)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 400));
  *(_DWORD *)(a1 + 88) = 1;
  pthread_cond_signal((pthread_cond_t *)(a1 + 464));
  return pthread_mutex_unlock(v2);
}

uint64_t worker_decoder(int *a1)
{
  pthread_mutex_t *v2;
  pthread_cond_t *v3;
  int *v4;
  _QWORD *v5;
  int *v6;
  uint64_t v7;
  int v8;
  __int128 v9;
  uint64_t v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int64x2_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = (pthread_mutex_t *)(a1 + 100);
  v3 = (pthread_cond_t *)(a1 + 116);
  v4 = a1 + 8;
  v5 = a1 + 18;
  v6 = a1 + 10;
  v7 = (uint64_t)(a1 + 24);
LABEL_2:
  pthread_mutex_lock(v2);
  while (1)
  {
    v8 = *a1;
    if (!*a1)
      goto LABEL_10;
    if (v8 == 2)
    {
      *a1 = 0;
      pthread_mutex_unlock(v2);
      pthread_mutex_lock((pthread_mutex_t *)(*((_QWORD *)a1 + 6) + 552));
      v13 = *((_QWORD *)a1 + 2);
      v14 = *((_QWORD *)a1 + 6);
      goto LABEL_22;
    }
    if (v8 == 3)
      break;
    v9 = *((_OWORD *)a1 + 2);
    *(_OWORD *)(a1 + 18) = v9;
    v10 = *((_QWORD *)a1 + 3);
    v11 = a1[22];
    if (v10 != (_QWORD)v9 || v11 == 1)
    {
      pthread_mutex_unlock(v2);
      v15 = *((_QWORD *)a1 + 4);
      v16 = v10 - v15;
      v17 = v15 + 0x4000;
      if (v16 <= 0x4000)
        v18 = v10;
      else
        v18 = v17;
      v19 = (*((uint64_t (**)(_QWORD, _QWORD, _QWORD, int *, uint64_t, uint64_t, int *, _QWORD, _DWORD))a1 + 15))(*((_QWORD *)a1 + 12), *((_QWORD *)a1 + 7), *((_QWORD *)a1 + 1), v4, v18, *((_QWORD *)a1 + 8) + 64, v6, *(_QWORD *)(*((_QWORD *)a1 + 8) + 16), 0);
      if (v19)
      {
        v20 = v19;
        lzma_free(*((void **)a1 + 1), *((_QWORD *)a1 + 7));
        *((_QWORD *)a1 + 1) = 0;
        pthread_mutex_lock(v2);
        if (*a1 != 3)
          *a1 = 0;
        pthread_mutex_unlock(v2);
        pthread_mutex_lock((pthread_mutex_t *)(*((_QWORD *)a1 + 6) + 552));
        v21 = *((int64x2_t *)a1 + 2);
        *(int64x2_t *)(*((_QWORD *)a1 + 6) + 736) = vaddq_s64(*(int64x2_t *)(*((_QWORD *)a1 + 6) + 736), v21);
        *v5 = 0;
        v5[1] = 0;
        v22 = *((_QWORD *)a1 + 8);
        *(_QWORD *)(v22 + 24) = v21.i64[1];
        *(_QWORD *)(v22 + 32) = *((_QWORD *)a1 + 4);
        *(_BYTE *)(v22 + 40) = 1;
        *(_DWORD *)(v22 + 44) = v20;
        *((_QWORD *)a1 + 8) = 0;
        v14 = *((_QWORD *)a1 + 6);
        if (v20 != 1 && !*(_DWORD *)(v14 + 444))
          *(_DWORD *)(v14 + 444) = v20;
        v13 = *((_QWORD *)a1 + 2);
LABEL_22:
        v23 = *(_QWORD *)(v14 + 696);
        *((_QWORD *)a1 + 2) = 0;
        v24 = *((_QWORD *)a1 + 48);
        *(_QWORD *)(v14 + 696) = v23 - (v13 + v24);
        *(_QWORD *)(v14 + 704) += v24;
        *((_QWORD *)a1 + 49) = *(_QWORD *)(v14 + 472);
        *(_QWORD *)(v14 + 472) = a1;
LABEL_23:
        pthread_cond_signal((pthread_cond_t *)(v14 + 616));
        pthread_mutex_unlock((pthread_mutex_t *)(*((_QWORD *)a1 + 6) + 552));
        goto LABEL_2;
      }
      if (v11)
      {
        a1[22] = 2;
        pthread_mutex_lock((pthread_mutex_t *)(*((_QWORD *)a1 + 6) + 552));
        v25 = *((_QWORD *)a1 + 8);
        v14 = *((_QWORD *)a1 + 6);
        *(_QWORD *)(v25 + 24) = *((_QWORD *)a1 + 5);
        *(_QWORD *)(v25 + 32) = *((_QWORD *)a1 + 4);
        goto LABEL_23;
      }
      goto LABEL_2;
    }
LABEL_10:
    pthread_cond_wait(v3, v2);
  }
  pthread_mutex_unlock(v2);
  lzma_free(*((void **)a1 + 1), *((_QWORD *)a1 + 7));
  lzma_next_end(v7, *((_QWORD *)a1 + 7));
  pthread_mutex_destroy(v2);
  pthread_cond_destroy(v3);
  return 0;
}

uint64_t lzma_delta_coder_init(char **a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  _DWORD *v7;
  uint64_t v8;

  v6 = *a1;
  if (!v6)
  {
    v6 = (char *)lzma_alloc(0x160uLL, a2);
    if (!v6)
      return 5;
    *a1 = v6;
    a1[4] = (char *)delta_coder_end;
    *(_QWORD *)v6 = 0;
    *((_QWORD *)v6 + 1) = -1;
    *((_OWORD *)v6 + 1) = 0u;
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *((_OWORD *)v6 + 4) = 0u;
  }
  v7 = *(_DWORD **)(a3 + 16);
  if (!v7)
    return 8;
  if (*v7)
    return 8;
  v8 = v7[1];
  if ((v8 - 257) < 0xFFFFFF00)
    return 8;
  *((_QWORD *)v6 + 10) = v8;
  v6[88] = 0;
  *(_OWORD *)(v6 + 105) = 0u;
  *(_OWORD *)(v6 + 121) = 0u;
  *(_OWORD *)(v6 + 137) = 0u;
  *(_OWORD *)(v6 + 153) = 0u;
  *(_OWORD *)(v6 + 169) = 0u;
  *(_OWORD *)(v6 + 185) = 0u;
  *(_OWORD *)(v6 + 201) = 0u;
  *(_OWORD *)(v6 + 217) = 0u;
  *(_OWORD *)(v6 + 233) = 0u;
  *(_OWORD *)(v6 + 249) = 0u;
  *(_OWORD *)(v6 + 89) = 0u;
  *(_OWORD *)(v6 + 265) = 0u;
  *(_OWORD *)(v6 + 281) = 0u;
  *(_OWORD *)(v6 + 297) = 0u;
  *(_OWORD *)(v6 + 313) = 0u;
  *(_OWORD *)(v6 + 329) = 0u;
  return lzma_next_filter_init((uint64_t)v6, a2, (_QWORD *)(a3 + 24), (__n128)0);
}

void delta_coder_end(void *a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1, a2);
}

uint64_t lzma_delta_coder_memusage(_DWORD *a1)
{
  if (!a1 || *a1)
    return -1;
  if ((a1[1] - 257) < 0xFFFFFF00)
    return -1;
  return 352;
}

uint64_t lzma_delta_encoder_init(char **a1, uint64_t a2, uint64_t a3)
{
  a1[3] = (char *)delta_encode;
  a1[8] = (char *)delta_encoder_update;
  return lzma_delta_coder_init(a1, a2, a3);
}

uint64_t delta_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t (*v12)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *);
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  char v17;
  unsigned __int8 v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _BYTE *v26;
  char v27;
  unsigned __int8 v28;
  unint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;

  v12 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *))(a1 + 24);
  if (v12)
  {
    v13 = *a7;
    result = v12(*(_QWORD *)a1, a2, a3, a4, a5, a6, a7);
    v15 = *a7 - v13;
    if (*a7 != v13)
    {
      v16 = (char *)(a6 + v13);
      v17 = *(_BYTE *)(a1 + 80);
      v18 = *(_BYTE *)(a1 + 88);
      do
      {
        v19 = *(_BYTE *)(a1 + 89 + (v18 + v17));
        v20 = *v16;
        v21 = v18--;
        *(_BYTE *)(a1 + 89 + v21) = *v16;
        *v16++ = v20 - v19;
        --v15;
      }
      while (v15);
      *(_BYTE *)(a1 + 88) = v18;
    }
  }
  else
  {
    v22 = *a4;
    v23 = a5 - *a4;
    v24 = *a7;
    if (v23 >= a8 - *a7)
      v23 = a8 - *a7;
    if (v23)
    {
      v25 = (char *)(a3 + v22);
      v26 = (_BYTE *)(a6 + v24);
      v27 = *(_BYTE *)(a1 + 80);
      v28 = *(_BYTE *)(a1 + 88);
      v29 = v23;
      do
      {
        v30 = *(_BYTE *)(a1 + 89 + (v28 + v27));
        v31 = *v25++;
        v32 = v28--;
        *(_BYTE *)(a1 + 89 + v32) = v31;
        *v26++ = v31 - v30;
        --v29;
      }
      while (v29);
      *(_BYTE *)(a1 + 88) = v28;
    }
    v33 = v23 + v22;
    *a4 = v33;
    *a7 = v23 + v24;
    v34 = v33 == a5;
    return a9 && v34;
  }
  return result;
}

uint64_t delta_encoder_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return lzma_next_filter_update(a1, a2, (_QWORD *)(a4 + 16));
}

uint64_t lzma_delta_props_encode(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  if (lzma_delta_coder_memusage((_DWORD *)a1) == -1)
    return 11;
  result = 0;
  *a2 = *(_BYTE *)(a1 + 4) - 1;
  return result;
}

uint64_t lzma_delta_decoder_init(char **a1, uint64_t a2, uint64_t a3)
{
  a1[3] = (char *)delta_decode;
  return lzma_delta_coder_init(a1, a2, a3);
}

uint64_t delta_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _BYTE *v13;
  char v14;
  unsigned __int8 v15;
  char v16;
  uint64_t v17;

  v10 = *a7;
  result = (*(uint64_t (**)(_QWORD))(a1 + 24))(*(_QWORD *)a1);
  v12 = *a7 - v10;
  if (*a7 != v10)
  {
    v13 = (_BYTE *)(a6 + v10);
    v14 = *(_BYTE *)(a1 + 80);
    v15 = *(_BYTE *)(a1 + 88);
    do
    {
      v16 = *v13 + *(_BYTE *)(a1 + 89 + (v15 + v14));
      *v13++ = v16;
      v17 = v15--;
      *(_BYTE *)(a1 + 89 + v17) = v16;
      --v12;
    }
    while (v12);
    *(_BYTE *)(a1 + 88) = v15;
  }
  return result;
}

uint64_t lzma_delta_props_decode(_QWORD *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t result;
  int v9;

  if (a4 != 1)
    return 8;
  v6 = lzma_alloc(0x28uLL, a2);
  if (!v6)
    return 5;
  v7 = v6;
  result = 0;
  v9 = *a3 + 1;
  *v7 = 0;
  v7[1] = v9;
  *a1 = v7;
  return result;
}

uint64_t lzma_simple_coder_init(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, char a8, __n128 a9)
{
  uint64_t v13;
  int *v14;
  int v15;
  uint64_t v20;
  _QWORD *v21;
  void *v22;

  v13 = *a1;
  if (*a1)
    goto LABEL_2;
  v20 = 2 * a6;
  v21 = lzma_alloc(2 * a6 + 144, a2);
  if (!v21)
    return 5;
  v13 = (uint64_t)v21;
  a1[3] = (uint64_t)simple_code;
  a1[4] = (uint64_t)simple_coder_end;
  *a1 = (uint64_t)v21;
  a1[8] = (uint64_t)simple_coder_update;
  *v21 = 0;
  v21[1] = -1;
  a9 = 0uLL;
  *((_OWORD *)v21 + 1) = 0u;
  *((_OWORD *)v21 + 2) = 0u;
  *((_OWORD *)v21 + 3) = 0u;
  *((_OWORD *)v21 + 4) = 0u;
  v21[11] = a4;
  v21[14] = v20;
  if (a5)
  {
    v22 = lzma_alloc(a5, a2);
    *(_QWORD *)(v13 + 96) = v22;
    if (!v22)
      return 5;
  }
  else
  {
    v21[12] = 0;
  }
LABEL_2:
  v14 = *(int **)(a3 + 16);
  if (v14)
  {
    v15 = *v14;
    *(_DWORD *)(v13 + 104) = v15;
    if ((v15 & (a7 - 1)) != 0)
      return 8;
  }
  else
  {
    *(_DWORD *)(v13 + 104) = 0;
  }
  *(_BYTE *)(v13 + 81) = a8;
  *(_BYTE *)(v13 + 80) = 0;
  *(_QWORD *)(v13 + 128) = 0;
  *(_QWORD *)(v13 + 136) = 0;
  *(_QWORD *)(v13 + 120) = 0;
  return lzma_next_filter_init(v13, a2, (_QWORD *)(a3 + 24), a9);
}

uint64_t simple_code(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t result;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  size_t v22;
  uint64_t v23;
  size_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (a9 == 1)
    return 8;
  v19 = *(_QWORD *)(a1 + 120);
  v18 = *(_QWORD *)(a1 + 128);
  v20 = (uint64_t *)(a1 + 120);
  if (v19 < v18)
  {
    lzma_bufcpy(a1 + 144, v20, v18, a6, a7, a8);
    v19 = *(_QWORD *)(a1 + 120);
    if (v19 < *(_QWORD *)(a1 + 128))
      return 0;
    if (*(_BYTE *)(a1 + 80))
      return 1;
  }
  v34 = a6;
  v35 = a3;
  v32 = a4;
  v33 = a5;
  v21 = (_QWORD *)(a1 + 136);
  v22 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 128) = 0;
  v23 = *a7;
  v24 = v22 - v19;
  if (v22 != v19 && a8 - *a7 <= v24)
  {
    if (v19)
    {
      memmove((void *)(a1 + 144), (const void *)(a1 + 144 + v19), v22 - v19);
      v22 = *(_QWORD *)(a1 + 136) - *(_QWORD *)(a1 + 120);
      *(_QWORD *)(a1 + 136) = v22;
      *(_QWORD *)(a1 + 120) = 0;
    }
    v28 = v35;
    goto LABEL_19;
  }
  if (v22 != v19)
    memcpy((void *)(v34 + v23), (const void *)(a1 + v19 + 144), v24);
  *a7 = v24 + v23;
  result = copy_or_code(a1, a2, v35, v32, v33, v34, a7, a8, a9);
  if (!(_DWORD)result)
  {
    v26 = *a7 - v23;
    if (*a7 == v23)
    {
      v27 = 0;
    }
    else
    {
      v30 = *a7 - v23;
      v27 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1 + 88))(*(_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 104), *(unsigned __int8 *)(a1 + 81), v34 + v23, v30);
      v26 = v30;
      *(_DWORD *)(a1 + 104) += v27;
    }
    v28 = v35;
    v22 = v26 - v27;
    *(_QWORD *)(a1 + 120) = 0;
    *(_QWORD *)(a1 + 136) = v26 - v27;
    if (*(_BYTE *)(a1 + 80))
    {
      *v21 = 0;
      return *(_BYTE *)(a1 + 80) && *v20 == *v21;
    }
    if (v26 != v27)
    {
      v31 = *a7 - v22;
      *a7 = v31;
      memcpy((void *)(a1 + 144), (const void *)(v34 + v31), v22);
    }
LABEL_19:
    if (v22)
    {
      result = copy_or_code(a1, a2, v28, v32, v33, a1 + 144, (uint64_t *)(a1 + 136), *(_QWORD *)(a1 + 112), a9);
      if ((_DWORD)result)
        return result;
      v29 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1 + 88))(*(_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 104), *(unsigned __int8 *)(a1 + 81), a1 + 144, *(_QWORD *)(a1 + 136));
      *(_DWORD *)(a1 + 104) += v29;
      *(_QWORD *)(a1 + 128) = v29;
      if (*(_BYTE *)(a1 + 80))
      {
        v29 = *(_QWORD *)(a1 + 136);
        *(_QWORD *)(a1 + 128) = v29;
      }
      lzma_bufcpy(a1 + 144, v20, v29, v34, a7, a8);
    }
    return *(_BYTE *)(a1 + 80) && *v20 == *v21;
  }
  return result;
}

void simple_coder_end(void **a1, uint64_t a2)
{
  lzma_next_end((uint64_t)a1, a2);
  lzma_free(a1[12], a2);
  lzma_free(a1, a2);
}

uint64_t simple_coder_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return lzma_next_filter_update(a1, a2, (_QWORD *)(a4 + 16));
}

uint64_t copy_or_code(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t (*v12)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t);
  uint64_t result;
  BOOL v14;

  v12 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t))(a1 + 24);
  if (v12)
  {
    result = v12(*(_QWORD *)a1, a2, a3, a4, a5);
    if ((_DWORD)result)
    {
      if ((_DWORD)result != 1)
        return result;
      *(_BYTE *)(a1 + 80) = 1;
    }
  }
  else
  {
    lzma_bufcpy(a3, a4, a5, a6, a7, a8);
    v14 = a9 != 3 || *(_BYTE *)(a1 + 81) == 0;
    if (!v14 && *a4 == a5)
    {
      result = 0;
      *(_BYTE *)(a1 + 80) = 1;
      return result;
    }
  }
  return 0;
}

uint64_t lzma_simple_props_size(int *a1, _DWORD *a2)
{
  int v2;

  if (a2)
    v2 = 4 * (*a2 != 0);
  else
    v2 = 0;
  *a1 = v2;
  return 0;
}

uint64_t lzma_simple_props_encode(_DWORD *a1, _DWORD *a2)
{
  if (a1 && *a1)
    *a2 = *a1;
  return 0;
}

uint64_t lzma_simple_props_decode(_QWORD *a1, uint64_t a2, int *a3, uint64_t a4)
{
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  uint64_t result;

  if (!a4)
    return 0;
  if (a4 != 4)
    return 8;
  v7 = lzma_alloc(4uLL, a2);
  if (!v7)
    return 5;
  v8 = v7;
  v9 = *a3;
  *v7 = *a3;
  if (v9)
  {
    result = 0;
    *a1 = v8;
  }
  else
  {
    lzma_free(v7, a2);
    return 0;
  }
  return result;
}

double lzma_simple_x86_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return x86_coder_init(a1, a2, a3, 1, a4);
}

double x86_coder_init(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, __n128 a5)
{
  double result;

  if (!lzma_simple_coder_init(a1, a2, a3, (uint64_t)x86_code, 8uLL, 5, 1, a4, a5))
  {
    result = NAN;
    **(_QWORD **)(*a1 + 96) = 0xFFFFFFFB00000000;
  }
  return result;
}

double lzma_simple_x86_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return x86_coder_init(a1, a2, a3, 0, a4);
}

unint64_t x86_code(unsigned int *a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5;
  unint64_t result;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  int i;
  int v20;

  v5 = a5 - 5;
  if (a5 < 5)
    return 0;
  result = 0;
  v8 = *a1;
  if (a2 - a1[1] <= 5)
    v9 = a1[1];
  else
    v9 = a2 - 5;
  do
  {
    if ((*(_BYTE *)(a4 + result) + 22) <= 0xFDu)
    {
      ++result;
      continue;
    }
    v10 = result + a2;
    if ((_DWORD)result + a2 - v9 <= 5)
    {
      if (v10 != v9)
      {
        if (v10 - v9 <= 1)
          v11 = 1;
        else
          v11 = v10 - v9;
        do
        {
          v8 = (2 * v8) & 0xEE;
          --v11;
        }
        while (v11);
      }
    }
    else
    {
      v8 = 0;
    }
    v12 = *(unsigned __int8 *)(a4 + result + 4);
    if ((v12 + 1) > 1u)
    {
      v13 = 1;
LABEL_29:
      ++result;
      v8 |= v13;
      v9 = v10;
      continue;
    }
    v13 = 17;
    if (((0xE8uLL >> ((v8 >> 1) & 7)) & 1) != 0 || v8 > 0x1F)
      goto LABEL_29;
    v14 = result + 1;
    v15 = v10 + 5;
    if (!a3)
      v15 = -5 - v10;
    v16 = ((v12 << 24) | (*(unsigned __int8 *)(a4 + result + 3) << 16) | (*(unsigned __int8 *)(a4 + result + 2) << 8) | *(unsigned __int8 *)(a4 + result + 1))
        + v15;
    if (v8)
    {
      v17 = 8 * x86_code_MASK_TO_BIT_NUMBER[v8 >> 1];
      v18 = 24 - v17;
      for (i = -1 << -v17; ; v16 = v15 + (v16 ^ ~i))
      {
        v20 = (v16 >> v18);
        if (v20 != 255 && v20 != 0)
          break;
      }
    }
    v8 = 0;
    *(_BYTE *)(a4 + result + 4) = (int)(v16 << 7) >> 31;
    *(_BYTE *)(a4 + result + 3) = BYTE2(v16);
    *(_BYTE *)(a4 + result + 2) = BYTE1(v16);
    result += 5;
    v9 = v10;
    *(_BYTE *)(a4 + v14) = v16;
  }
  while (result <= v5);
  *a1 = v8;
  a1[1] = v9;
  return result;
}

uint64_t lzma_simple_powerpc_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)powerpc_code, 0, 4, 4, 1, a4);
}

uint64_t lzma_simple_powerpc_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)powerpc_code, 0, 4, 4, 0, a4);
}

uint64_t powerpc_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  int v13;
  _BYTE *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;

  if (a5 < 4)
    return 0;
  v6 = 0;
  v7 = -a2;
  v8 = a4 + 1;
  do
  {
    v10 = v8 + v6;
    v11 = *(_BYTE *)(a4 + v6);
    if ((v11 & 0xFC) == 0x48)
    {
      v12 = *(_BYTE *)(v10 + 2);
      if ((v12 & 3) == 1)
      {
        v13 = (v11 & 3) << 24;
        v14 = (_BYTE *)(v8 + v6);
        v15 = *(unsigned __int8 *)(v8 + v6 + 1);
        v16 = v12 & 0xFC;
        v17 = a2 + v6;
        if (!a3)
          v17 = v7;
        v18 = v13 + v17 + v16;
        v19 = v18 + (*(unsigned __int8 *)(v8 + v6) << 16) + (v15 << 8);
        *(_BYTE *)(v10 - 1) = HIBYTE(v19) & 3 | 0x48;
        *v14 = BYTE2(v19);
        v14[1] = (unsigned __int16)(v18 + ((_WORD)v15 << 8)) >> 8;
        *(_BYTE *)(v10 + 2) = v18 | 1;
      }
    }
    result = v6 + 4;
    v20 = v6 + 8;
    v7 -= 4;
    v6 += 4;
  }
  while (v20 <= a5);
  return result;
}

uint64_t lzma_simple_ia64_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)ia64_code, 0, 16, 16, 1, a4);
}

uint64_t lzma_simple_ia64_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)ia64_code, 0, 16, 16, 0, a4);
}

uint64_t ia64_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64x2_t v8;
  int64x2_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  int64x2_t v27;

  if (a5 < 0x10)
    return 0;
  result = 0;
  v6 = a4 + 1;
  v7 = 16;
  v8 = (uint64x2_t)vdupq_n_s64(6uLL);
  v9 = vdupq_n_s64(2uLL);
  v10 = a4;
  do
  {
    v11 = 0;
    v12 = *(_BYTE *)(a4 + result);
    v13 = result + a2;
    result = v7;
    v14 = ia64_code_BRANCH_TABLE[v12 & 0x1F];
    if (a3)
      v15 = v13;
    else
      v15 = -v13;
    v16 = v15 >> 4;
    v17 = 5;
    do
    {
      if (((v14 >> v11) & 1) != 0)
      {
        v18 = 0;
        v19 = 0;
        v20 = (_BYTE *)(v6 + (v17 >> 3));
        v21 = (unsigned __int8 *)(v10 + (v17 >> 3));
        do
        {
          v22 = *v21++;
          v19 += (unint64_t)v22 << v18;
          v18 += 8;
        }
        while (v18 != 48);
        v23 = v19 >> (v17 & 7);
        if ((v23 & 0x1E000000E00) == 0xA000000000)
        {
          v24 = 0;
          v25 = v16 + ((v23 >> 13) & 0xFFFFF | (v23 >> 16) & 0x100000);
          v26 = ((v23 & 0xFFFFFFEE00001FFFLL | ((unint64_t)(v25 & 0xFFFFF) << 13) & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v25 & 0x100000) >> 20) & 1) << 36)) << (v17 & 7)) | v19 & ~(-1 << (v17 & 7));
          v27 = (int64x2_t)xmmword_2299575C0;
          do
          {
            if ((vmovn_s64((int64x2_t)vcgtq_u64(v8, (uint64x2_t)v27)).u8[0] & 1) != 0)
              *(v20 - 1) = v26 >> v24;
            if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v27)).i32[1] & 1) != 0)
              *v20 = v26 >> (v24 + 8);
            v27 = vaddq_s64(v27, v9);
            v24 += 16;
            v20 += 2;
          }
          while (v24 != 48);
        }
      }
      ++v11;
      v17 += 41;
    }
    while (v11 != 3);
    v7 = result + 16;
    v10 += 16;
    v6 += 16;
  }
  while (result + 16 <= a5);
  return result;
}

uint64_t lzma_simple_arm_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm_code, 0, 4, 4, 1, a4);
}

uint64_t lzma_simple_arm_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm_code, 0, 4, 4, 0, a4);
}

uint64_t arm_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  unsigned int v11;
  unint64_t v12;

  if (a5 < 4)
    return 0;
  v6 = 0;
  v7 = -8 - a2;
  v8 = a4 + 1;
  do
  {
    v9 = (unsigned __int8 *)(v8 + v6);
    if (*(unsigned __int8 *)(v8 + v6 + 2) == 235)
    {
      v10 = 4 * ((v9[1] << 16) | (*v9 << 8) | *(v9 - 1));
      if (a3)
        v11 = a2 + 8 + v6 + v10;
      else
        v11 = v7 + v10;
      v9[1] = v11 >> 18;
      *(_BYTE *)(v8 + v6) = v11 >> 10;
      *(v9 - 1) = v11 >> 2;
    }
    result = v6 + 4;
    v12 = v6 + 8;
    v7 -= 4;
    v6 += 4;
  }
  while (v12 <= a5);
  return result;
}

uint64_t lzma_simple_armthumb_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)armthumb_code, 0, 4, 2, 1, a4);
}

uint64_t lzma_simple_armthumb_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)armthumb_code, 0, 4, 2, 0, a4);
}

uint64_t armthumb_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v6;
  char v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unint64_t v13;

  if (a5 < 4)
    return 0;
  v6 = 0;
  do
  {
    v7 = *(_BYTE *)(a4 + v6 + 1);
    if ((v7 & 0xF8) == 0xF0)
    {
      v8 = *(unsigned __int8 *)(a4 + v6 + 3);
      if ((~v8 & 0xF8) == 0)
      {
        v9 = ((v7 & 7) << 19) | (*(unsigned __int8 *)(a4 + v6) << 11) | ((v8 & 7) << 8);
        v10 = v6 + 2;
        v11 = 2 * (v9 | *(unsigned __int8 *)(a4 + v6 + 2));
        if (a3)
          v12 = a2 + 4 + v6 + v11;
        else
          v12 = v11 - (v6 + a2) - 4;
        *(_BYTE *)(a4 + v6 + 1) = (v12 >> 20) & 7 | 0xF0;
        *(_BYTE *)(a4 + v6) = v12 >> 12;
        *(_BYTE *)(a4 + v6 + 3) = (v12 >> 9) | 0xF8;
        v6 += 2;
        *(_BYTE *)(a4 + v10) = v12 >> 1;
      }
    }
    result = v6 + 2;
    v13 = v6 + 6;
    v6 += 2;
  }
  while (v13 <= a5);
  return result;
}

uint64_t lzma_stream_encoder_mt(_QWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    v4 = stream_encoder_mt_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }
    else
    {
      v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_WORD *)(v5 + 98) = 257;
      *(_BYTE *)(v5 + 100) = 1;
    }
  }
  return v4;
}

uint64_t stream_encoder_mt_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  unsigned int v7;
  char *v8;
  int v9;
  unsigned int v10;
  char *v11;
  pthread_mutex_t *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  int v17[2];
  _OWORD v18[12];

  if (*(uint64_t (**)())(a1 + 16) != stream_encoder_mt_init)
    lzma_next_end(a1, a2);
  *(_QWORD *)(a1 + 16) = stream_encoder_mt_init;
  memset(v18, 0, sizeof(v18));
  v16 = 0;
  *(_QWORD *)v17 = 0;
  v15 = 0;
  result = get_options((uint64_t)a3, (uint64_t *)v18, (uint64_t **)v17, &v16, &v15);
  if (!(_DWORD)result)
  {
    if (lzma_raw_encoder_memusage(*(uint64_t **)v17) == -1)
      return 8;
    v7 = a3[8];
    if (v7 > 0xF)
      return 11;
    if (!lzma_check_is_supported(v7))
      return 3;
    v8 = *(char **)a1;
    if (*(_QWORD *)a1)
    {
      v9 = *((_DWORD *)v8 + 108);
LABEL_12:
      *(_DWORD *)v8 = 0;
      *((_QWORD *)v8 + 1) = v16;
      *((_QWORD *)v8 + 51) = v15;
      *((_DWORD *)v8 + 105) = 0;
      *((_QWORD *)v8 + 56) = 0;
      if (v9 == a3[1])
      {
        threads_stop_0((uint64_t)v8, 1);
        v10 = a3[1];
      }
      else
      {
        threads_end_0((uint64_t)v8, a2);
        *((_QWORD *)v8 + 53) = 0;
        *((_QWORD *)v8 + 54) = 0;
        *((_QWORD *)v8 + 55) = 0;
        v13 = lzma_alloc(568 * a3[1], a2);
        *((_QWORD *)v8 + 53) = v13;
        if (!v13)
          return 5;
        v10 = a3[1];
        *((_DWORD *)v8 + 108) = v10;
      }
      result = lzma_outq_init((uint64_t)(v8 + 344), a2, v10);
      if ((_DWORD)result)
        return result;
      *((_DWORD *)v8 + 104) = a3[4];
      lzma_filters_free((_QWORD *)v8 + 2, a2);
      lzma_filters_free((_QWORD *)v8 + 12, a2);
      result = lzma_filters_copy(*(uint64_t **)v17, v8 + 16, a2);
      if ((_DWORD)result)
        return result;
      lzma_index_end(*((uint64_t **)v8 + 22), a2);
      v14 = lzma_index_init(a2);
      *((_QWORD *)v8 + 22) = v14;
      if (v14)
      {
        *((_DWORD *)v8 + 66) = 0;
        *((_DWORD *)v8 + 70) = a3[8];
        result = lzma_stream_header_encode((_DWORD *)v8 + 66, (uint64_t)(v8 + 320));
        if (!(_DWORD)result)
        {
          *((_QWORD *)v8 + 42) = 0;
          *((_QWORD *)v8 + 57) = 0;
          *((_QWORD *)v8 + 58) = 12;
        }
        return result;
      }
      return 5;
    }
    v11 = (char *)lzma_alloc(0x250uLL, a2);
    if (!v11)
      return 5;
    v8 = v11;
    *(_QWORD *)a1 = v11;
    v12 = (pthread_mutex_t *)(v11 + 472);
    if (!pthread_mutex_init((pthread_mutex_t *)(v11 + 472), 0))
    {
      *((_DWORD *)v8 + 146) = 0;
      if (!pthread_cond_init((pthread_cond_t *)(v8 + 536), 0))
      {
        v9 = 0;
        *(_QWORD *)(a1 + 24) = stream_encode_mt;
        *(_QWORD *)(a1 + 32) = stream_encoder_mt_end;
        *(_QWORD *)(a1 + 40) = get_progress;
        *(_QWORD *)(a1 + 64) = stream_encoder_mt_update;
        *((_QWORD *)v8 + 2) = -1;
        *((_QWORD *)v8 + 12) = -1;
        *((_QWORD *)v8 + 24) = -1;
        *(_OWORD *)(v8 + 200) = 0u;
        *(_OWORD *)(v8 + 216) = 0u;
        *(_OWORD *)(v8 + 232) = 0u;
        *(_OWORD *)(v8 + 248) = 0u;
        *((_OWORD *)v8 + 11) = 0u;
        *(_OWORD *)(v8 + 344) = 0u;
        *(_OWORD *)(v8 + 360) = 0u;
        *(_OWORD *)(v8 + 376) = 0u;
        *(_OWORD *)(v8 + 392) = 0u;
        *(_OWORD *)(v8 + 424) = 0u;
        goto LABEL_12;
      }
      pthread_mutex_destroy(v12);
    }
    lzma_free(v8, a2);
    *(_QWORD *)a1 = 0;
    return 5;
  }
  return result;
}

uint64_t lzma_stream_encoder_mt_memusage(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  _OWORD v14[12];

  memset(v14, 0, sizeof(v14));
  v12 = 0;
  v13 = 0;
  v11 = 0;
  if (get_options(a1, (uint64_t *)v14, &v13, &v12, &v11))
    return -1;
  v3 = *(unsigned int *)(a1 + 4);
  v4 = v12;
  result = lzma_raw_encoder_memusage(v13);
  if (result != -1)
  {
    v5 = result;
    result = lzma_outq_memusage(v11, v3);
    if (result != -1)
    {
      v6 = *(_DWORD *)(a1 + 4);
      if (-33361 - 568 * (unint64_t)v6 < v4 * v3)
        return -1;
      v7 = v4 * v3 + 568 * v6 + 33360;
      if (__CFADD__(v7, v5 * v3))
        return -1;
      v8 = v7 + v5 * v3;
      v9 = __CFADD__(v8, result);
      v10 = v8 + result;
      if (v9)
        return -1;
      else
        return v10;
    }
  }
  return result;
}

uint64_t get_options(uint64_t a1, uint64_t *a2, uint64_t **a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t *v10;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;

  if (!a1)
    return 11;
  if (*(_DWORD *)a1)
    return 8;
  if ((*(_DWORD *)(a1 + 4) - 16385) < 0xFFFFC000)
    return 8;
  v10 = *(uint64_t **)(a1 + 24);
  if (!v10)
  {
    v12 = lzma_easy_preset(a2, *(_DWORD *)(a1 + 20));
    v10 = a2;
    if (v12)
      return 8;
  }
  *a3 = v10;
  v13 = *(_QWORD *)(a1 + 8);
  if (v13)
  {
    if (!(v13 >> 50))
    {
      *a4 = v13;
      goto LABEL_12;
    }
    return 8;
  }
  v13 = lzma_mt_block_size(v10);
  *a4 = v13;
  if (!v13)
    return 8;
LABEL_12:
  v14 = lzma_block_buffer_bound64(v13);
  *a5 = v14;
  if (v14)
    return 0;
  else
    return 5;
}

uint64_t stream_encode_mt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int64x2_t a9, int a10)
{
  uint64_t v12;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t buf;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int64x2_t v39;
  BOOL i;
  pthread_cond_t *v42;
  pthread_mutex_t *v43;
  uint64_t v44;
  unsigned int v45;
  pthread_t *v46;
  int64x2_t v47;
  int v48;
  _OWORD *__dst;
  uint64_t v50;
  pthread_cond_t *v51;
  timespec v53;
  unint64_t v54;
  unint64_t v55;
  sigset_t v56[9];

  v12 = a6;
  switch(*(_DWORD *)a1)
  {
    case 0:
      lzma_bufcpy(a1 + 320, (uint64_t *)(a1 + 336), 12, a6, a7, a8);
      if (*(_QWORD *)(a1 + 336) < 0xCuLL)
        return 0;
      *(_QWORD *)(a1 + 336) = 0;
      *(_DWORD *)a1 = 1;
      goto LABEL_5;
    case 1:
LABEL_5:
      v50 = v12;
      v48 = 0;
      v54 = 0;
      v55 = 0;
      __dst = (_OWORD *)(a1 + 96);
      v51 = (pthread_cond_t *)(a1 + 536);
      v53.tv_sec = 0;
      v53.tv_nsec = 0;
      a9.i64[0] = 999999999;
      v47 = a9;
      break;
    case 2:
      goto LABEL_83;
    case 3:
      goto LABEL_87;
    default:
      return 11;
  }
  while (1)
  {
    v12 = v50;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
      v17 = *(unsigned int *)(a1 + 420);
      if (!(_DWORD)v17)
        v17 = lzma_outq_read((uint64_t *)(a1 + 344), a2, v50, a7, a8, &v55, &v54);
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
      if ((_DWORD)v17 != 1)
      {
        if (!(_DWORD)v17)
          goto LABEL_14;
        goto LABEL_78;
      }
      v18 = lzma_index_append(*(_QWORD **)(a1 + 176), a2, v55, v54);
      if ((_DWORD)v18)
      {
        v17 = v18;
LABEL_78:
        threads_stop_0(a1, 0);
        return v17;
      }
    }
    while (*a7 < a8);
    while (1)
    {
LABEL_14:
      v19 = *a4;
      v20 = *(_QWORD *)(a1 + 448);
      if (*a4 >= a5)
      {
        if (!a10 || !v20)
          goto LABEL_55;
        goto LABEL_31;
      }
      if (v20)
        goto LABEL_31;
      if (*(_DWORD *)(a1 + 392) >= *(_DWORD *)(a1 + 400))
        goto LABEL_29;
      v17 = lzma_outq_prealloc_buf(a1 + 344, a2, *(_QWORD *)(a1 + 408));
      if (!(_DWORD)v17)
      {
        if (*(_QWORD *)__dst != -1 || (v17 = lzma_filters_copy((uint64_t *)(a1 + 16), __dst, a2), !(_DWORD)v17))
        {
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
          v21 = *(_QWORD *)(a1 + 440);
          if (v21)
          {
            *(_QWORD *)(a1 + 448) = v21;
            *(_QWORD *)(a1 + 440) = *(_QWORD *)(v21 + 432);
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
          v22 = *(_QWORD *)(a1 + 448);
          if (v22)
            goto LABEL_22;
          v30 = *(_DWORD *)(a1 + 436);
          if (v30 == *(_DWORD *)(a1 + 432))
            goto LABEL_29;
          v44 = *(_QWORD *)(a1 + 424);
          v45 = *(_DWORD *)(a1 + 436);
          v22 = v44 + 568 * v30;
          v35 = lzma_alloc(*(_QWORD *)(a1 + 8), a2);
          *(_QWORD *)(v22 + 8) = v35;
          if (v35)
          {
            v43 = (pthread_mutex_t *)(v44 + 568 * v45 + 440);
            if (!pthread_mutex_init(v43, 0))
            {
              v36 = v44 + 568 * v45;
              *(_DWORD *)(v36 + 552) = 0;
              v42 = (pthread_cond_t *)(v36 + 504);
              if (!pthread_cond_init((pthread_cond_t *)(v36 + 504), 0))
              {
                *(_DWORD *)v22 = 0;
                v37 = v44 + 568 * v45;
                *(_QWORD *)(v37 + 32) = a1;
                *(_QWORD *)(v37 + 40) = a2;
                *(_QWORD *)(v37 + 48) = 0;
                *(_QWORD *)(v37 + 56) = 0;
                *(_QWORD *)(v37 + 64) = 0;
                *(_QWORD *)(v37 + 72) = -1;
                *(_OWORD *)(v37 + 80) = 0u;
                *(_OWORD *)(v37 + 96) = 0u;
                *(_OWORD *)(v37 + 112) = 0u;
                *(_OWORD *)(v37 + 128) = 0u;
                *(_QWORD *)(v37 + 352) = -1;
                v46 = (pthread_t *)(v37 + 560);
                *(_QWORD *)v56 = 0xFFFFFFFFLL;
                pthread_sigmask(3, v56, &v56[1]);
                LODWORD(v46) = pthread_create(v46, 0, (void *(__cdecl *)(void *))worker_start, (void *)v22);
                pthread_sigmask(3, &v56[1], 0);
                if (!(_DWORD)v46)
                {
                  ++*(_DWORD *)(a1 + 436);
                  *(_QWORD *)(a1 + 448) = v22;
LABEL_22:
                  pthread_mutex_lock((pthread_mutex_t *)(v22 + 440));
                  v23 = *(_QWORD *)(a1 + 448);
                  *(_DWORD *)v23 = 1;
                  *(_QWORD *)(v23 + 16) = 0;
                  buf = lzma_outq_get_buf(a1 + 344, 0);
                  v25 = *(_QWORD *)(a1 + 448);
                  *(_QWORD *)(v25 + 24) = buf;
                  lzma_filters_free((_QWORD *)(v25 + 352), a2);
                  v26 = *(_OWORD **)(a1 + 448);
                  v26[22] = *__dst;
                  v27 = *(_OWORD *)(a1 + 112);
                  v28 = *(_OWORD *)(a1 + 128);
                  v29 = *(_OWORD *)(a1 + 160);
                  v26[25] = *(_OWORD *)(a1 + 144);
                  v26[26] = v29;
                  v26[23] = v27;
                  v26[24] = v28;
                  *(_QWORD *)(a1 + 96) = -1;
                  pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 448) + 504));
                  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 448) + 440));
LABEL_29:
                  v17 = 0;
                  goto LABEL_30;
                }
                pthread_cond_destroy(v42);
              }
              pthread_mutex_destroy(v43);
            }
            lzma_free(*(void **)(v22 + 8), a2);
          }
          v17 = 5;
        }
      }
LABEL_30:
      v20 = *(_QWORD *)(a1 + 448);
      if (!v20)
        goto LABEL_53;
LABEL_31:
      v31 = *(_QWORD *)(v20 + 8);
      *(_QWORD *)&v56[1] = *(_QWORD *)(v20 + 16);
      lzma_bufcpy(a3, a4, a5, v31, (uint64_t *)&v56[1], *(_QWORD *)(a1 + 8));
      if (*(_QWORD *)&v56[1] == *(_QWORD *)(a1 + 8))
      {
        v32 = 1;
      }
      else
      {
        v33 = a10 && *a4 == a5;
        v32 = v33;
      }
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 448) + 440));
      v34 = *(_QWORD *)(a1 + 448);
      if (!*(_DWORD *)v34)
        break;
      *(_QWORD *)(v34 + 16) = *(_QWORD *)&v56[1];
      if (v32)
      {
        *(_DWORD *)v34 = 2;
        pthread_cond_signal((pthread_cond_t *)(v34 + 504));
        pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 448) + 440));
        *(_QWORD *)(a1 + 448) = 0;
      }
      else
      {
        pthread_cond_signal((pthread_cond_t *)(v34 + 504));
        pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 448) + 440));
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v34 + 440));
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
    v17 = *(unsigned int *)(a1 + 420);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
LABEL_53:
    if ((_DWORD)v17)
      goto LABEL_78;
    v19 = *a4;
LABEL_55:
    if (v19 == a5)
      break;
LABEL_61:
    if (*a7 == a8)
      return 0;
    v38 = *(_DWORD *)(a1 + 416);
    if (v38 && !v48)
    {
      v53.tv_sec = v38 / 0x3E8uLL;
      v53.tv_nsec = 1000000 * (v38 % 0x3E8);
      *(_QWORD *)&v56[1] = 0;
      *(_QWORD *)&v56[3] = 0;
      clock_gettime(*(clockid_t *)(a1 + 584), (timespec *)&v56[1]);
      v39 = vaddq_s64((int64x2_t)v53, *(int64x2_t *)&v56[1]);
      v53 = (timespec)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_s64(vdupq_laneq_s64(v39, 1), v47).i64[0], 0), (int8x16_t)vaddq_s64(v39, (int64x2_t)xmmword_229959730), (int8x16_t)v39);
      v48 = 1;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
LABEL_66:
    for (i = 0;
          (v19 >= a5 || !*(_QWORD *)(a1 + 440) || *(_DWORD *)(a1 + 392) >= *(_DWORD *)(a1 + 400))
       && !lzma_outq_is_readable((uint64_t *)(a1 + 344))
       && *(_DWORD *)(a1 + 420) == 0
       && !i;
          i = pthread_cond_timedwait(v51, (pthread_mutex_t *)(a1 + 472), &v53) != 0)
    {
      if (!*(_DWORD *)(a1 + 416))
      {
        pthread_cond_wait(v51, (pthread_mutex_t *)(a1 + 472));
        goto LABEL_66;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
    if (i)
      return 101;
  }
  if (!a10)
    return 0;
  if (a10 == 4)
    return 1;
  if (*(_DWORD *)(a1 + 392))
    goto LABEL_61;
  if (a10 == 2)
    return 1;
  if (a10 != 3)
    goto LABEL_61;
  v17 = lzma_index_encoder_init(a1 + 184, a2, *(_QWORD *)(a1 + 176));
  if (!(_DWORD)v17)
  {
    *(_DWORD *)a1 = 2;
    *(_QWORD *)(a1 + 464) += lzma_index_size(*(_QWORD *)(a1 + 176)) + 12;
LABEL_83:
    v17 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t *, unint64_t, _DWORD))(a1 + 208))(*(_QWORD *)(a1 + 184), a2, 0, 0, 0, v12, a7, a8, 0);
    if ((_DWORD)v17 == 1)
    {
      *(_QWORD *)(a1 + 272) = lzma_index_size(*(_QWORD *)(a1 + 176));
      if (lzma_stream_footer_encode(a1 + 264, a1 + 320))
      {
        return 11;
      }
      else
      {
        *(_DWORD *)a1 = 3;
LABEL_87:
        lzma_bufcpy(a1 + 320, (uint64_t *)(a1 + 336), 12, v12, a7, a8);
        return *(_QWORD *)(a1 + 336) > 0xBuLL;
      }
    }
  }
  return v17;
}

void stream_encoder_mt_end(uint64_t a1, uint64_t a2)
{
  threads_end_0(a1, a2);
  lzma_outq_end((uint64_t *)(a1 + 344), a2);
  lzma_filters_free((_QWORD *)(a1 + 16), a2);
  lzma_filters_free((_QWORD *)(a1 + 96), a2);
  lzma_next_end(a1 + 184, a2);
  lzma_index_end(*(uint64_t **)(a1 + 176), a2);
  pthread_cond_destroy((pthread_cond_t *)(a1 + 536));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 472));
  lzma_free((void *)a1, a2);
}

uint64_t get_progress(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  pthread_mutex_t *v6;
  unint64_t v7;
  uint64_t v8;
  pthread_mutex_t *v9;

  v6 = (pthread_mutex_t *)(a1 + 472);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
  *a2 = *(_QWORD *)(a1 + 456);
  *a3 = *(_QWORD *)(a1 + 464);
  if (*(_DWORD *)(a1 + 436))
  {
    v7 = 0;
    v8 = 440;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 424) + v8));
      v9 = (pthread_mutex_t *)(*(_QWORD *)(a1 + 424) + v8);
      *a2 += *(_QWORD *)&v9[-7].__opaque[48];
      *a3 += v9[-6].__sig;
      pthread_mutex_unlock(v9);
      ++v7;
      v8 += 568;
    }
    while (v7 < *(unsigned int *)(a1 + 436));
  }
  return pthread_mutex_unlock(v6);
}

uint64_t stream_encoder_mt_update(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  __int128 v8;
  __int128 v9;
  _OWORD __dst[5];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)a1 > 1u || *(_QWORD *)(a1 + 448))
    return 11;
  if (lzma_raw_encoder_memusage(a3) == -1)
    return 8;
  v4 = lzma_filters_copy(a3, __dst, a2);
  if (!(_DWORD)v4)
  {
    lzma_filters_free((_QWORD *)(a1 + 16), a2);
    lzma_filters_free((_QWORD *)(a1 + 96), a2);
    v8 = __dst[3];
    *(_OWORD *)(a1 + 48) = __dst[2];
    *(_OWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 80) = __dst[4];
    v9 = __dst[1];
    *(_OWORD *)(a1 + 16) = __dst[0];
    *(_OWORD *)(a1 + 32) = v9;
  }
  return v4;
}

void threads_end_0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (*(_DWORD *)(a1 + 436))
  {
    v4 = 0;
    v5 = 440;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 424) + v5));
      v6 = *(_QWORD *)(a1 + 424) + v5;
      *(_DWORD *)(v6 - 440) = 4;
      pthread_cond_signal((pthread_cond_t *)(v6 + 64));
      pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 424) + v5));
      ++v4;
      v7 = *(unsigned int *)(a1 + 436);
      v5 += 568;
    }
    while (v4 < v7);
    if ((_DWORD)v7)
    {
      v8 = 0;
      v9 = 560;
      do
      {
        pthread_join(*(pthread_t *)(*(_QWORD *)(a1 + 424) + v9), 0);
        ++v8;
        v9 += 568;
      }
      while (v8 < *(unsigned int *)(a1 + 436));
    }
  }
  lzma_free(*(void **)(a1 + 424), a2);
}

uint64_t threads_stop_0(uint64_t result, int a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(result + 436))
  {
    v3 = result;
    v4 = 0;
    v5 = 440;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(v3 + 424) + v5));
      v6 = *(_QWORD *)(v3 + 424) + v5;
      *(_DWORD *)(v6 - 440) = 3;
      pthread_cond_signal((pthread_cond_t *)(v6 + 64));
      result = pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(v3 + 424) + v5));
      ++v4;
      v7 = *(unsigned int *)(v3 + 436);
      v5 += 568;
    }
    while (v4 < v7);
    if ((_DWORD)v7 && a2)
    {
      v8 = 0;
      do
      {
        v9 = 568 * v8;
        pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(v3 + 424) + 568 * v8 + 440));
        while (1)
        {
          v10 = *(_QWORD *)(v3 + 424);
          if (!*(_DWORD *)(v10 + v9))
            break;
          v9 = 568 * v8;
          pthread_cond_wait((pthread_cond_t *)(v10 + 568 * v8 + 504), (pthread_mutex_t *)(v10 + 568 * v8 + 440));
        }
        result = pthread_mutex_unlock((pthread_mutex_t *)(v10 + 568 * v8++ + 440));
      }
      while (v8 < *(unsigned int *)(v3 + 436));
    }
  }
  return result;
}

uint64_t worker_start(uint64_t a1)
{
  pthread_mutex_t *v2;
  pthread_cond_t *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = (pthread_mutex_t *)(a1 + 440);
  v3 = (pthread_cond_t *)(a1 + 504);
  v4 = a1 + 144;
  v5 = (_QWORD *)(a1 + 352);
  v6 = a1 + 184;
  v7 = a1 + 64;
  v8 = (_QWORD *)(a1 + 48);
  v32 = a1 + 64;
  while (1)
  {
    pthread_mutex_lock(v2);
    while (1)
    {
      v9 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 == 3)
      {
        *(_DWORD *)a1 = 0;
        pthread_cond_signal(v3);
        v9 = *(_DWORD *)a1;
      }
      if (v9)
        break;
      pthread_cond_wait(v3, v2);
    }
    pthread_mutex_unlock(v2);
    v33 = 0;
    if (v9 < 3)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_DWORD *)(v10 + 280);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
      v13 = *(_QWORD *)(v10 + 8);
      *(_QWORD *)(a1 + 144) = 0;
      *(_QWORD *)(a1 + 152) = v11;
      *(_QWORD *)(a1 + 160) = v12;
      *(_QWORD *)(a1 + 168) = v13;
      *(_QWORD *)(a1 + 176) = v5;
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v6 + 16) = 0u;
      *(_OWORD *)(v6 + 32) = 0u;
      *(_OWORD *)(v6 + 48) = 0u;
      *(_OWORD *)(v6 + 64) = 0u;
      *(_OWORD *)(v6 + 80) = 0u;
      *(_OWORD *)(v6 + 96) = 0u;
      *(_OWORD *)(v6 + 112) = 0u;
      *(_OWORD *)(v6 + 128) = 0u;
      *(_OWORD *)(v6 + 144) = 0u;
      *(_QWORD *)(v6 + 160) = 0;
      v14 = lzma_block_header_size(v4);
      if (v14 || (v14 = lzma_block_encoder_init(v7, *(_QWORD *)(a1 + 40), v4)) != 0)
      {
        worker_error(a1, v14);
        v9 = 3;
        goto LABEL_40;
      }
      v15 = 0;
      v33 = *(unsigned int *)(a1 + 148);
      v34 = 0;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
      do
      {
        pthread_mutex_lock(v2);
        v17 = v33;
        *(_QWORD *)(a1 + 48) = v34;
        *(_QWORD *)(a1 + 56) = v17;
        while (v15 == *(_QWORD *)(a1 + 16))
        {
          v9 = *(_DWORD *)a1;
          if (*(_DWORD *)a1 != 1)
            goto LABEL_17;
          pthread_cond_wait(v3, v2);
        }
        v9 = *(_DWORD *)a1;
        v15 = *(_QWORD *)(a1 + 16);
LABEL_17:
        pthread_mutex_unlock(v2);
        if (v9 > 2)
          goto LABEL_38;
        if (v9 == 2)
          v18 = 3;
        else
          v18 = 0;
        if ((unint64_t)(v15 - v34) <= 0x4000)
        {
          v19 = v15;
        }
        else
        {
          v18 = 0;
          v19 = v34 + 0x4000;
        }
        v20 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t, unint64_t *, unint64_t, int))(a1 + 88))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 8), &v34, v19, *(_QWORD *)(a1 + 24) + 64, &v33, v16, v18);
        if (v20)
        {
          v21 = v20;
          if (v20 == 1)
          {
            v22 = lzma_block_header_encode(v4, (char *)(*(_QWORD *)(a1 + 24) + 64));
            if (!v22)
              goto LABEL_37;
            v21 = v22;
          }
          v23 = a1;
LABEL_33:
          worker_error(v23, v21);
          v9 = 3;
          goto LABEL_38;
        }
      }
      while (v33 < v16);
      pthread_mutex_lock(v2);
      while (1)
      {
        v9 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 != 1)
          break;
        pthread_cond_wait(v3, v2);
      }
      v24 = *(_QWORD *)(a1 + 16);
      pthread_mutex_unlock(v2);
      if (v9 <= 2)
      {
        v33 = 0;
        if (lzma_block_uncomp_encode(v4, *(char **)(a1 + 8), v24, *(_QWORD *)(a1 + 24) + 64, (uint64_t *)&v33, v16))
        {
          v23 = a1;
          v21 = 11;
          goto LABEL_33;
        }
LABEL_37:
        v25 = lzma_block_unpadded_size(v4);
        v26 = *(_QWORD *)(a1 + 24);
        *(_QWORD *)(v26 + 48) = v25;
        *(_QWORD *)(v26 + 56) = *(_QWORD *)(a1 + 168);
        v9 = 2;
      }
LABEL_38:
      v7 = v32;
    }
    if (v9 == 4)
      break;
LABEL_40:
    pthread_mutex_lock(v2);
    if (*(_DWORD *)a1 != 4)
    {
      *(_DWORD *)a1 = 0;
      pthread_cond_signal(v3);
    }
    pthread_mutex_unlock(v2);
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
    v27 = *(_QWORD *)(a1 + 24);
    v28 = v33;
    if (v9 == 2)
    {
      *(_QWORD *)(v27 + 24) = v33;
      *(_BYTE *)(v27 + 40) = 1;
    }
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(_QWORD *)(v29 + 464);
    *(_QWORD *)(v29 + 456) += *(_QWORD *)(v27 + 56);
    *(_QWORD *)(v29 + 464) = v30 + v28;
    *v8 = 0;
    v8[1] = 0;
    *(_QWORD *)(a1 + 432) = *(_QWORD *)(v29 + 440);
    *(_QWORD *)(v29 + 440) = a1;
    pthread_cond_signal((pthread_cond_t *)(v29 + 536));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
  }
  lzma_filters_free(v5, *(_QWORD *)(a1 + 40));
  pthread_mutex_destroy(v2);
  pthread_cond_destroy(v3);
  lzma_next_end(v7, *(_QWORD *)(a1 + 40));
  lzma_free(*(void **)(a1 + 8), *(_QWORD *)(a1 + 40));
  return 0;
}

uint64_t worker_error(uint64_t a1, int a2)
{
  uint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v4 + 420))
    *(_DWORD *)(v4 + 420) = a2;
  pthread_cond_signal((pthread_cond_t *)(v4 + 536));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
}

uint64_t lzma_simple_sparc_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)sparc_code, 0, 4, 4, 1, a4);
}

uint64_t lzma_simple_sparc_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)sparc_code, 0, 4, 4, 0, a4);
}

uint64_t sparc_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unint64_t v18;

  if (a5 >= 4)
  {
    v6 = 0;
    v7 = -a2;
    v8 = a4 + 1;
    while (1)
    {
      v9 = *(unsigned __int8 *)(a4 + v6);
      if (v9 == 127)
      {
        v10 = *(unsigned __int8 *)(v8 + v6);
        if (v10 >= 0xC0)
        {
          v11 = v6 + 1;
          goto LABEL_10;
        }
      }
      else if (v9 == 64)
      {
        v10 = *(unsigned __int8 *)(v8 + v6);
        if (v10 < 0x40)
        {
          v11 = v6 | 1;
LABEL_10:
          v12 = (v9 << 24) | (v10 << 16);
          v13 = v8 + v6;
          v14 = v12 | (*(unsigned __int8 *)(v8 + v6 + 1) << 8) | *(unsigned __int8 *)(v8 + v6 + 2);
          v15 = a2 + v6;
          if (!a3)
            v15 = v7;
          v16 = v15 + 4 * v14;
          v17 = (int)(v16 << 7) >> 9;
          *(_BYTE *)(a4 + v6) = HIBYTE(v17) & 0x3F | 0x40;
          *(_BYTE *)(a4 + v11) = (v17 & 0x3FC00000 | (v16 >> 2) & 0x3FFFFF) >> 16;
          *(_BYTE *)(v13 + 1) = v16 >> 10;
          *(_BYTE *)(v13 + 2) = v16 >> 2;
        }
      }
      result = v6 + 4;
      v18 = v6 + 8;
      v7 -= 4;
      v6 += 4;
      if (v18 > a5)
        return result;
    }
  }
  return 0;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x24BDAF9B8](*(_QWORD *)&a1, a2, a3);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x24BDB00F0](*(_QWORD *)&a1);
}

