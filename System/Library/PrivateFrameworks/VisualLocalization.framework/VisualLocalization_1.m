void vl_dog_free_octave_list(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  signed int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  unsigned int *v31;
  unsigned int v32;
  signed int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;

  if ((uint64_t)*a1 >= 1)
  {
    v1 = 0;
    v47 = a1;
    do
    {
      v48 = a1[1];
      v49 = v1;
      v3 = v48 + 72 * v1;
      if (*(uint64_t *)v3 >= 1)
      {
        v4 = 0;
        do
        {
          v5 = *(_QWORD *)(v3 + 8);
          v6 = (_QWORD *)(v5 + 24 * v4);
          if (*v6)
          {
            v7 = *(_QWORD *)(*v6 - 16 * *(_QWORD *)(v5 + 24 * v4 + 16) - 8);
            v8 = (unsigned int *)(v7 + 24);
            do
            {
              v9 = __ldaxr(v8);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, v8));
            if (v10 < 0)
LABEL_51:
              __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
            if (v10)
            {
              do
                v11 = __ldaxr(&qword_254A77330);
              while (__stlxr(v11 - 1, &qword_254A77330));
              do
                v12 = __ldaxr((unint64_t *)&unk_254A77338);
              while (__stlxr(v12, (unint64_t *)&unk_254A77338));
              do
                v13 = __ldaxr(&global_stats);
              while (__stlxr(v13, &global_stats));
              do
                v14 = __ldaxr(&pmem_total_refs);
              while (__stlxr(v14 - 1, &pmem_total_refs));
              do
                v15 = __ldaxr(&_pmem_total_blocks);
              while (__stlxr(v15, &_pmem_total_blocks));
              do
                v16 = __ldaxr(&pmem_bytes_allocated);
              while (__stlxr(v16, &pmem_bytes_allocated));
            }
            else
            {
              v17 = -*(_QWORD *)(v7 + 8);
              do
                v18 = __ldaxr(&qword_254A77330);
              while (__stlxr(v18 - 1, &qword_254A77330));
              do
                v19 = __ldaxr((unint64_t *)&unk_254A77338);
              while (__stlxr(v19 - 1, (unint64_t *)&unk_254A77338));
              do
                v20 = __ldaxr(&global_stats);
              while (__stlxr(v20 + v17, &global_stats));
              do
                v21 = __ldaxr(&pmem_total_refs);
              while (__stlxr(v21 - 1, &pmem_total_refs));
              do
                v22 = __ldaxr(&_pmem_total_blocks);
              while (__stlxr(v22 - 1, &_pmem_total_blocks));
              do
                v23 = __ldaxr(&pmem_bytes_allocated);
              while (__stlxr(v23 + v17, &pmem_bytes_allocated));
              (*(void (**)(uint64_t))(v7 + 40))(v7);
              free((void *)v7);
            }
          }
          *v6 = 0;
          ++v4;
        }
        while (v4 < *(_QWORD *)v3);
      }
      free(*(void **)(v3 + 8));
      v24 = v48 + 72 * v49;
      v26 = *(_QWORD *)(v24 + 24);
      v25 = (_QWORD *)(v24 + 24);
      if (v26 >= 1)
      {
        v27 = 0;
        v28 = (_QWORD *)(v48 + 72 * v49 + 32);
        v50 = v25;
        do
        {
          v29 = (_QWORD *)(*v28 + 24 * v27);
          if (*v29)
          {
            v30 = *(_QWORD *)(*v29 - 16 * *(_QWORD *)(*v28 + 24 * v27 + 16) - 8);
            v31 = (unsigned int *)(v30 + 24);
            do
            {
              v32 = __ldaxr(v31);
              v33 = v32 - 1;
            }
            while (__stlxr(v33, v31));
            if (v33 < 0)
              goto LABEL_51;
            if (v33)
            {
              do
                v34 = __ldaxr(&qword_254A77330);
              while (__stlxr(v34 - 1, &qword_254A77330));
              do
                v35 = __ldaxr((unint64_t *)&unk_254A77338);
              while (__stlxr(v35, (unint64_t *)&unk_254A77338));
              do
                v36 = __ldaxr(&global_stats);
              while (__stlxr(v36, &global_stats));
              do
                v37 = __ldaxr(&pmem_total_refs);
              while (__stlxr(v37 - 1, &pmem_total_refs));
              do
                v38 = __ldaxr(&_pmem_total_blocks);
              while (__stlxr(v38, &_pmem_total_blocks));
              do
                v39 = __ldaxr(&pmem_bytes_allocated);
              while (__stlxr(v39, &pmem_bytes_allocated));
            }
            else
            {
              v40 = -*(_QWORD *)(v30 + 8);
              do
                v41 = __ldaxr(&qword_254A77330);
              while (__stlxr(v41 - 1, &qword_254A77330));
              do
                v42 = __ldaxr((unint64_t *)&unk_254A77338);
              while (__stlxr(v42 - 1, (unint64_t *)&unk_254A77338));
              do
                v43 = __ldaxr(&global_stats);
              while (__stlxr(v43 + v40, &global_stats));
              do
                v44 = __ldaxr(&pmem_total_refs);
              while (__stlxr(v44 - 1, &pmem_total_refs));
              do
                v45 = __ldaxr(&_pmem_total_blocks);
              while (__stlxr(v45 - 1, &_pmem_total_blocks));
              do
                v46 = __ldaxr(&pmem_bytes_allocated);
              while (__stlxr(v46 + v40, &pmem_bytes_allocated));
              (*(void (**)(uint64_t))(v30 + 40))(v30);
              free((void *)v30);
              v25 = v50;
            }
          }
          *v29 = 0;
          ++v27;
        }
        while (v27 < *v25);
      }
      v2 = v48 + 72 * v49;
      free(*(void **)(v2 + 32));
      free(*(void **)(v2 + 56));
      v1 = v49 + 1;
      a1 = v47;
    }
    while (v49 + 1 < *v47);
  }
  free((void *)a1[1]);
}

uint64_t vl_dog_calculate_keypoints(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *a4 = 0;
  if (a6)
  {
    if (*(_DWORD *)(a6 + 212))
    {
      *(_QWORD *)(a6 + 120) -= mach_absolute_time();
    }
    else
    {
      clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a6 + 32));
      clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a6 + 16));
      clock_gettime(_CLOCK_MONOTONIC, (timespec *)a6);
    }
    vl_dog_create_octave_list_pwin(a1, a2, a3);
    vl_timer_stop(a6);
    if (*(_DWORD *)(a6 + 212))
    {
      printf("Verbose : ");
      printf("Total time for %40s : %7.3f ms", (const char *)(a6 + 148), (double)*(uint64_t *)(a6 + 120) * 0.000001);
      putchar(10);
      if (a7)
        goto LABEL_9;
    }
    else
    {
      log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v12, v13, v14, v15, v16, v17, v18, (char)&str_4_1);
      if (a7)
        goto LABEL_9;
    }
    return vl_dog_extract_keypoints_pwin();
  }
  vl_dog_create_octave_list_pwin(a1, a2, a3);
  if (!a7)
    return vl_dog_extract_keypoints_pwin();
LABEL_9:
  if (*(_DWORD *)(a7 + 212))
  {
    *(_QWORD *)(a7 + 120) -= mach_absolute_time();
  }
  else
  {
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a7 + 32));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a7 + 16));
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)a7);
  }
  vl_dog_extract_keypoints_pwin();
  vl_timer_stop(a7);
  if (!*(_DWORD *)(a7 + 212))
    return log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v20, v21, v22, v23, v24, v25, v26, (char)&str_4_1);
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a7 + 148), (double)*(uint64_t *)(a7 + 120) * 0.000001);
  return putchar(10);
}

void create_initial_image(uint64_t a1, uint64_t *a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  int v8;
  int8x8_t *v9;
  uint64_t v10;
  uint64_t v11;
  int16x8_t *v12;
  int v13;
  int8x8_t *v14;
  int16x8_t *v15;
  int v16;
  int16x8_t *v17;
  int8x8_t *v18;
  uint64_t v19;
  int16x8_t v22;
  int16x8_t v27;
  int v28;
  __int16 v29;
  float v30;
  double v31;
  BOOL v32;
  double v33;
  int v34;
  uint64_t v35;
  float *v36;
  float32x4_t v37;
  __int128 v38;
  float32x4_t *v39;
  unint64_t v40;
  int v41;
  float *v42;
  uint64_t v43;
  float v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  _WORD *v48;
  uint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  float32x4_t v54;
  float32x4_t *v55;
  uint64_t v56;
  float32x4_t v57;
  uint64_t v58;
  float *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _WORD *v68;
  uint64_t v69;
  float v70;
  _WORD *v71;
  uint64_t v72;
  char *v73;
  _WORD *v74;
  float v75;
  uint64_t v76;
  float *v77;
  float v78;
  unsigned int v79;
  float v80;
  float v81;
  _WORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int16 *v89;
  float v90;
  uint64_t v91;
  float *v92;
  __int16 *v93;
  float v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  int v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  float v111;
  uint64_t v112;
  float *v113;
  float v114;
  unsigned int v115;
  float v116;
  uint64_t v117;
  __int16 *v118;
  unsigned int v119;
  float v120;
  uint64_t v121;
  float *v122;
  float v123;
  float v124;
  float *v125;
  __int16 *v126;
  uint64_t v127;
  float v128;
  uint64_t v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  float v148;
  uint64_t v149;
  float *v150;
  float v151;
  float v152;
  unint64_t v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  float32x4_t *v157;
  uint16x8_t *v158;
  float32x4_t v159;
  float32x4_t v160;
  float32x4_t v161;
  float32x4_t v162;
  uint16x8_t v163;
  float32x4_t v164;
  float32x4_t v165;
  float32x4_t v166;
  float32x4_t v167;
  unint64_t v168;
  unsigned __int16 *v169;
  float *v170;
  float v171;
  float v172;
  unsigned int v173;
  int v174;
  uint64_t v175;
  float v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint16x8_t *v181;
  uint64_t v182;
  float32x4_t *v183;
  float32x4_t v184;
  float32x4_t v185;
  float32x4_t v186;
  float32x4_t v187;
  uint16x8_t v188;
  float32x4_t v189;
  float32x4_t v190;
  float32x4_t v191;
  float32x4_t v192;
  unsigned __int16 *v193;
  float *v194;
  uint64_t v195;
  float v196;
  float v197;
  unsigned int v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  int v207;
  unsigned int v208;
  uint64_t v209;
  unsigned int v210;
  float v211;
  uint64_t v212;
  float v213;
  uint64_t v214;
  float *v215;
  float v216;
  unsigned int v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  float32x4_t *v223;
  int16x8_t *v224;
  int8x16_t v225;
  uint16x8_t v226;
  int8x16_t v227;
  uint16x8_t v228;
  float32x4_t v229;
  float32x4_t v230;
  float32x4_t v231;
  float32x4_t v232;
  float32x4_t v233;
  float32x4_t v234;
  float32x4_t v235;
  float32x4_t v236;
  float32x4_t v237;
  float *v238;
  float v239;
  uint64_t v240;
  unsigned int *v241;
  unsigned int v242;
  signed int v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  unint64_t v248;
  unint64_t v249;
  uint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  int v257;
  unint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  int v262;
  int v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t v266;
  uint64_t v267;
  int v268;
  int v269;
  uint64_t v270;
  int v271;
  int v272;
  uint64_t v273;
  _WORD *v274;
  uint64_t v276;
  int v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  __int128 v281;
  uint64_t v282;
  float32x4_t *v283;

  v5 = *(unsigned int *)(a1 + 8);
  v6 = *(int *)(a1 + 12);
  v7 = 2 * (int)v5;
  v264 = pmem_alloc_ex(v7 * (v6 + 16), 0, 0);
  if ((_DWORD)v5 != *(_DWORD *)(a1 + 8))
    __assert_rtn("create_initial_image", "vl_dog.c", 555, "(&img_input)->x_size == (img)->x_size");
  if ((_DWORD)v6 != *(_DWORD *)(a1 + 12))
    __assert_rtn("create_initial_image", "vl_dog.c", 555, "(&img_input)->y_size == (img)->y_size");
  v276 = v6;
  if ((int)v6 >= 1 && (int)v5 >= 1)
  {
    v8 = 0;
    v9 = *(int8x8_t **)a1;
    v10 = *(_QWORD *)(a1 + 16) - (int)v5;
    v11 = v5 & 0xFFFFFFE0;
    v12 = (int16x8_t *)(v264 + 16 * (int)v5);
    do
    {
      if (v5 >= 0x20)
      {
        v16 = v5;
        if (v12 >= (int16x8_t *)((char *)v9 + v5) || v9 >= (int8x8_t *)&v12->i16[(v5 - 1) + 1])
        {
          v14 = (int8x8_t *)((char *)v9 + v11);
          v15 = (int16x8_t *)((char *)v12 + 2 * (v5 & 0xFFFFFFE0));
          v17 = v12 + 2;
          v18 = v9 + 2;
          v19 = v5 & 0xFFFFFFE0;
          do
          {
            _Q0 = *(int16x8_t *)v18[-2].i8;
            _Q1 = *(int16x8_t *)v18->i8;
            v22 = vshll_n_s8(*(int8x8_t *)_Q0.i8, 8uLL);
            __asm { SHLL2           V0.8H, V0.16B, #8 }
            v27 = vshll_n_s8(*v18, 8uLL);
            __asm { SHLL2           V1.8H, V1.16B, #8 }
            v17[-2] = v22;
            v17[-1] = _Q0;
            *v17 = v27;
            v17[1] = _Q1;
            v17 += 4;
            v18 += 4;
            v19 -= 32;
          }
          while (v19);
          v13 = v5 & 0x7FFFFFE0;
          if (v11 == v5)
            goto LABEL_6;
        }
        else
        {
          v13 = 0;
          v14 = v9;
          v15 = v12;
        }
      }
      else
      {
        v13 = 0;
        v14 = v9;
        v15 = v12;
        v16 = v5;
      }
      v28 = v16 - v13;
      do
      {
        v29 = v14->u8[0];
        v14 = (int8x8_t *)((char *)v14 + 1);
        v15->i16[0] = v29 << 8;
        v15 = (int16x8_t *)((char *)v15 + 2);
        --v28;
      }
      while (v28);
LABEL_6:
      v9 = (int8x8_t *)((char *)v14 + v10);
      ++v8;
      v12 = v15;
    }
    while (v8 != (_DWORD)v6);
  }
  v278 = v6;
  v265 = v264 + 16 * (int)v5;
  v274 = malloc_type_calloc((int)v5, 2uLL, 0x1000040BDFB0063uLL);
  v30 = (float)(a3 * 6.0) + 1.0;
  v31 = v30;
  v32 = v30 <= 0.0;
  v33 = -0.5;
  if (!v32)
    v33 = 0.5;
  v34 = (int)(v33 + v31);
  LODWORD(v35) = v34 | 1;
  v36 = (float *)malloc_type_calloc(v34 | 1, 4uLL, 0x100004052888210uLL);
  v39 = (float32x4_t *)v36;
  v273 = v34 | 1u;
  if (v34 < 0)
  {
    v277 = 0;
    v257 = v34;
    v52 = v34 >> 1;
    v48 = v274;
    v49 = a2;
    v50 = v264 + 16 * (int)v5;
    v53 = v34 | 1u;
    v51 = v278;
    v268 = v278 - (v34 >> 1);
    v271 = v34 >> 1;
    if ((int)v5 < 1)
      goto LABEL_73;
    goto LABEL_60;
  }
  if ((int)v35 <= 1)
    v35 = 1;
  else
    v35 = v35;
  v40 = v34 >> 1;
  v41 = -(v34 >> 1);
  LODWORD(v38) = 0;
  v42 = v36;
  v43 = v35;
  v44 = -0.5 / (float)(a3 * a3);
  do
  {
    v281 = v38;
    v45 = expf((float)(v44 * (float)v41) * (float)v41);
    v38 = v281;
    *v42++ = v45;
    *(float *)&v38 = *(float *)&v281 + v45;
    ++v41;
    --v43;
  }
  while (v43);
  if (v35 >= 8)
  {
    v46 = v35 & 0x7FFFFFF8;
    v54 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v38, 0);
    v55 = v39 + 1;
    v56 = v46;
    v47 = (int)v5;
    v48 = v274;
    v49 = a2;
    v50 = v264 + 16 * (int)v5;
    v51 = v278;
    do
    {
      v37 = vdivq_f32(v55[-1], v54);
      v57 = vdivq_f32(*v55, v54);
      v55[-1] = v37;
      *v55 = v57;
      v55 += 2;
      v56 -= 8;
    }
    while (v56);
  }
  else
  {
    v46 = 0;
    v47 = (int)v5;
    v48 = v274;
    v49 = a2;
    v50 = v264 + 16 * (int)v5;
    v51 = v278;
  }
  v58 = v35 - v46;
  v59 = &v39->f32[v46];
  do
  {
    *v59 = *v59 / *(float *)&v38;
    ++v59;
    --v58;
  }
  while (v58);
  v53 = v34 | 1u;
  v52 = v34 >> 1;
  if (v34 <= 1)
  {
    v257 = v34;
    v277 = 0;
    v268 = v51 - v40;
    v271 = v34 >> 1;
    if ((int)v5 < 1)
      goto LABEL_73;
    goto LABEL_60;
  }
  if ((int)v47 < 1)
  {
    v277 = 1;
    if ((int)v51 >= 1)
      goto LABEL_103;
    goto LABEL_163;
  }
  v60 = 0;
  v61 = *v49;
  v62 = v49[2];
  v63 = v40 + 1;
  v37.i32[0] = 0.5;
  v64 = v34 >> 1;
  do
  {
    v65 = v63;
    v66 = v60 * v62;
    if (v60 <= v40)
    {
      v72 = 0;
      v73 = &v39->i8[4 * v63];
      v74 = (_WORD *)(v264 + 18 * (int)v47);
      do
      {
        v75 = 0.0;
        v76 = v65;
        v77 = (float *)v39;
        do
        {
          v78 = *v77++;
          HIWORD(v79) = HIWORD(v78);
          v75 = v75 + v78;
          --v76;
        }
        while (v76);
        LOWORD(v79) = *(_WORD *)(v50 + 2 * v72);
        v80 = (float)v79;
        v81 = v75 * v80;
        v82 = v74;
        do
        {
          LOWORD(v80) = *v82;
          v80 = (float)LODWORD(v80);
          v81 = v81 + (float)(v80 * *(float *)&v73[4 * v76++]);
          v82 = (_WORD *)((char *)v82 + v7);
        }
        while (v64 != v76);
        if (v81 <= 0.0)
          *(float *)&v38 = -0.5;
        else
          *(float *)&v38 = 0.5;
        *(_WORD *)(v61 + 2 * (v72 + v66)) = (int)(float)(v81 + *(float *)&v38);
        ++v72;
        ++v74;
      }
      while (v72 != v5);
    }
    else
    {
      v67 = 0;
      v68 = (_WORD *)(v264 + 18 * (int)v47);
      do
      {
        v69 = 0;
        v70 = 0.0;
        v71 = v68;
        do
        {
          LOWORD(v38) = *v71;
          *(float *)&v38 = (float)v38;
          v70 = v70 + (float)(*(float *)&v38 * v39->f32[v69]);
          v71 = (_WORD *)((char *)v71 + v7);
          ++v69;
        }
        while (v64 != v69);
        if (v70 <= 0.0)
          *(float *)&v38 = -0.5;
        else
          *(float *)&v38 = 0.5;
        *(_WORD *)(v61 + 2 * (v67 + v66)) = (int)(float)(v70 + *(float *)&v38);
        ++v67;
        ++v68;
      }
      while (v67 != v5);
    }
    ++v60;
    ++v64;
    v63 = v65 - 1;
  }
  while (v60 != v40);
  v257 = v34;
  v277 = 1;
  v268 = v51 - v40;
  v271 = v34 >> 1;
  if ((int)v5 >= 1)
  {
LABEL_60:
    if (v268 > v52)
    {
      v83 = 0;
      v84 = *v49;
      v85 = v49[2];
      v86 = v52;
      v87 = v52;
      do
      {
        if (v87 - v86 > v87 + v86)
        {
          bzero((void *)(v84 + 2 * v85 * (v83 + v86)), 2 * v5);
          v51 = v278;
          v52 = v271;
          v53 = v273;
          v48 = v274;
          v49 = a2;
          v50 = v264 + 16 * (int)v5;
        }
        else
        {
          v88 = 0;
          v89 = (__int16 *)(v264 + (int)v5 * (2 * (int)v83 + 16));
          do
          {
            v90 = 0.0;
            v91 = v53;
            v92 = (float *)v39;
            v93 = v89;
            do
            {
              v37.i16[0] = *v93;
              v37.f32[0] = (float)v37.u32[0];
              v94 = *v92++;
              v90 = v90 + (float)(v37.f32[0] * v94);
              v93 = (__int16 *)((char *)v93 + v7);
              --v91;
            }
            while (v91);
            if (v90 <= 0.0)
              v37.f32[0] = -0.5;
            else
              v37.f32[0] = 0.5;
            *(_WORD *)(v84 + 2 * (v88 + v87 * v85)) = (int)(float)(v90 + v37.f32[0]);
            ++v88;
            ++v89;
          }
          while (v88 != v5);
        }
        ++v87;
        ++v83;
      }
      while ((_DWORD)v276 - (v257 & 0xFFFFFFFE) != (_DWORD)v83);
    }
  }
LABEL_73:
  v95 = v277 ^ 1;
  if ((int)v5 < 1)
    v95 = 1;
  if ((v95 & 1) == 0)
  {
    v96 = 0;
    v97 = (v51 - 1) * (int)v5;
    v98 = *v49;
    v99 = v49[2];
    v100 = (int)v276 - 2;
    v101 = v268;
    v261 = v268;
    v102 = v52;
    v103 = v51 - 1 - v52;
    v259 = 2 * v99;
    v260 = v52;
    v104 = v100 + 1;
    v105 = v264 + (2 * v100 + 16) * (int)v5;
    v106 = 1;
    v107 = 2;
    v266 = v99;
    v258 = v105;
    do
    {
      v108 = v107;
      ++v106;
      v109 = v101 * v99;
      if (v101 - v102 <= v100)
      {
        v117 = 0;
        v118 = (__int16 *)v105;
        do
        {
          if (v101 >= v103)
          {
            v120 = 0.0;
            v121 = v108;
            v122 = (float *)v39;
            do
            {
              v123 = *v122++;
              v37.i16[1] = HIWORD(v123);
              v120 = v120 + v123;
              --v121;
            }
            while (v121);
            v119 = v106;
          }
          else
          {
            v119 = 0;
            v120 = 0.0;
          }
          v37.i16[0] = *(_WORD *)(v50 + 2 * (v117 + v97));
          v37.f32[0] = (float)v37.u32[0];
          v124 = v120 * v37.f32[0];
          v125 = &v39->f32[v119];
          v126 = v118;
          v127 = v104;
          do
          {
            v37.i16[0] = *v126;
            v37.f32[0] = (float)v37.u32[0];
            v128 = *v125++;
            v124 = v124 + (float)(v37.f32[0] * v128);
            --v127;
            v126 -= (int)v5;
          }
          while (v127 > v101 - v102);
          if (v124 <= 0.0)
            v37.f32[0] = -0.5;
          else
            v37.f32[0] = 0.5;
          *(_WORD *)(v98 + 2 * (v117 + v109)) = (int)(float)(v124 + v37.f32[0]);
          ++v117;
          ++v118;
        }
        while (v117 != v5);
      }
      else if (v101 < v103)
      {
        v282 = v96;
        v269 = v106;
        bzero((void *)(v98 + v259 * (v96 + v261)), 2 * v5);
        v106 = v269;
        v105 = v258;
        v102 = v260;
        v100 = (int)v276 - 2;
        v50 = v264 + 16 * (int)v5;
        v99 = v266;
        v96 = v282;
        v51 = v278;
        v52 = v271;
        v53 = v273;
        v48 = v274;
        v49 = a2;
      }
      else
      {
        v110 = 0;
        do
        {
          v111 = 0.0;
          v112 = v108;
          v113 = (float *)v39;
          do
          {
            v114 = *v113++;
            HIWORD(v115) = HIWORD(v114);
            v111 = v111 + v114;
            --v112;
          }
          while (v112);
          LOWORD(v115) = *(_WORD *)(v50 + 2 * (v110 + v97));
          v116 = v111 * (float)v115;
          if (v116 <= 0.0)
            v37.f32[0] = -0.5;
          else
            v37.f32[0] = 0.5;
          *(_WORD *)(v98 + 2 * (v110 + v109)) = (int)(float)(v116 + v37.f32[0]);
          ++v110;
        }
        while (v110 != v5);
      }
      ++v101;
      v107 = v108 + 1;
      ++v96;
    }
    while (v101 < v51);
  }
  v47 = (int)v5;
  v34 = v257;
  if ((int)v51 >= 1)
  {
LABEL_103:
    v279 = 0;
    v129 = 0;
    v263 = v52 + 1;
    v262 = -v52;
    v130 = v34 & 0xFFFFFFFE;
    v131 = v52;
    v132 = v52;
    v133 = 1 - v52;
    v134 = v5 - v52;
    v135 = v5 - v130;
    v136 = (int)v47 - 2;
    v137 = v47 - 1 - v52;
    v267 = v53 & 0xFFFFFFF0;
    v270 = v134;
    v280 = v136 + 2 * v52 + 1;
    v283 = v39 + 2;
    v272 = v52;
    while (1)
    {
      if (v277)
      {
        v138 = 0;
        v139 = *v49;
        v140 = v49[2];
        v141 = v140 * v129;
        v142 = *v49 + v140 * v279 + 18;
        v143 = v263;
        v144 = v263;
        v145 = v262;
        v146 = v52;
        while (1)
        {
          if (v145 <= 1)
            v147 = 1;
          else
            v147 = v145;
          v148 = 0.0;
          if (v52 >= (int)v138)
          {
            v149 = v143;
            v150 = (float *)v39;
            do
            {
              v151 = *v150++;
              v37.i16[1] = HIWORD(v151);
              v148 = v148 + v151;
              --v149;
            }
            while (v149);
          }
          v37.i16[0] = *(_WORD *)(v139 + 2 * v141);
          v152 = v148 * (float)v37.u32[0];
          if (v133 > (int)v138)
            goto LABEL_107;
          v153 = v144 - 1;
          v154 = (v147 + v146);
          if (v153 < 0x10)
            break;
          v156 = v153 & 0xFFFFFFFFFFFFFFF0;
          v157 = (float32x4_t *)((char *)v283 + 4 * v154);
          v155 = v153 & 0xFFFFFFFFFFFFFFF0 | 1;
          v154 += v153 & 0xFFFFFFFFFFFFFFF0;
          v158 = (uint16x8_t *)v142;
          do
          {
            v159 = v157[-2];
            v160 = v157[-1];
            v161 = *v157;
            v162 = v157[1];
            v157 += 4;
            v163 = v158[-1];
            v164 = vmulq_f32(v160, vcvtq_f32_u32(vmovl_high_u16(v163)));
            v165 = vmulq_f32(v159, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v163.i8)));
            v166 = vmulq_f32(v162, vcvtq_f32_u32(vmovl_high_u16(*v158)));
            v167 = vmulq_f32(v161, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v158->i8)));
            v152 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v152 + v165.f32[0]) + v165.f32[1]) + v165.f32[2]) + v165.f32[3]) + v164.f32[0])
                                                                                                 + v164.f32[1])
                                                                                         + v164.f32[2])
                                                                                 + v164.f32[3])
                                                                         + v167.f32[0])
                                                                 + v167.f32[1])
                                                         + v167.f32[2])
                                                 + v167.f32[3])
                                         + v166.f32[0])
                                 + v166.f32[1])
                         + v166.f32[2])
                 + v166.f32[3];
            v158 += 2;
            v156 -= 16;
          }
          while (v156);
          if (v153 != (v153 & 0xFFFFFFFFFFFFFFF0))
            goto LABEL_123;
LABEL_107:
          if (v152 <= 0.0)
            v37.f32[0] = -0.5;
          else
            v37.f32[0] = 0.5;
          v48[v138++] = (int)(float)(v152 + v37.f32[0]);
          --v146;
          --v143;
          ++v145;
          ++v144;
          if (v138 == v132)
            goto LABEL_126;
        }
        v155 = 1;
LABEL_123:
        v168 = v144 - v155;
        v169 = (unsigned __int16 *)(v139 + 2 * (v141 + v155));
        v170 = &v39->f32[v154];
        do
        {
          v171 = *v170++;
          v172 = v171;
          v173 = *v169++;
          v152 = v152 + (float)(v172 * (float)v173);
          --v168;
        }
        while (v168);
        goto LABEL_107;
      }
LABEL_126:
      if ((int)v270 > v52)
      {
        v174 = 0;
        v175 = v131;
        do
        {
          v176 = 0.0;
          if (v175 - v131 <= v175 + v131)
          {
            v177 = *v49;
            v178 = v49[2];
            if (v53 >= 0x10)
            {
              v180 = v267 + v174;
              v181 = (uint16x8_t *)(v177 + 2 * (v174 + v129 * v178) + 16);
              v182 = v267;
              v183 = v39 + 2;
              do
              {
                v184 = v183[-2];
                v185 = v183[-1];
                v186 = *v183;
                v187 = v183[1];
                v183 += 4;
                v188 = v181[-1];
                v189 = vmulq_f32(v185, vcvtq_f32_u32(vmovl_high_u16(v188)));
                v190 = vmulq_f32(v184, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v188.i8)));
                v191 = vmulq_f32(v187, vcvtq_f32_u32(vmovl_high_u16(*v181)));
                v192 = vmulq_f32(v186, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v181->i8)));
                v176 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v176 + v190.f32[0]) + v190.f32[1]) + v190.f32[2]) + v190.f32[3]) + v189.f32[0]) + v189.f32[1])
                                                                                             + v189.f32[2])
                                                                                     + v189.f32[3])
                                                                             + v192.f32[0])
                                                                     + v192.f32[1])
                                                             + v192.f32[2])
                                                     + v192.f32[3])
                                             + v191.f32[0])
                                     + v191.f32[1])
                             + v191.f32[2])
                     + v191.f32[3];
                v181 += 2;
                v182 -= 16;
              }
              while (v182);
              v179 = v267;
            }
            else
            {
              v179 = 0;
              v180 = v174;
            }
            v193 = (unsigned __int16 *)(v177 + 2 * (v180 + v129 * v178));
            v194 = &v39->f32[v179];
            v195 = v53 - v179;
            do
            {
              v196 = *v194++;
              v197 = v196;
              v198 = *v193++;
              v176 = v176 + (float)(v197 * (float)v198);
              --v195;
            }
            while (v195);
          }
          if (v176 <= 0.0)
            v37.f32[0] = -0.5;
          else
            v37.f32[0] = 0.5;
          v48[v175++] = (int)(float)(v176 + v37.f32[0]);
          ++v174;
        }
        while (v174 != v135);
      }
      v199 = *v49;
      v200 = v49[2];
      v201 = v200 * v129;
      if (v277)
        break;
LABEL_104:
      memcpy((void *)(v199 + 2 * v201), v48, v7);
      v48 = v274;
      v49 = a2;
      ++v129;
      v279 += 2;
      v52 = v272;
      v53 = v273;
      if (v129 == v276)
        goto LABEL_163;
    }
    v202 = 0;
    v203 = v280 - v47;
    v204 = v201 + v47 - 1;
    v205 = v199 + 2 * (v136 + v200 * v129) - 14;
    v206 = v199 + v200 * v279;
    v207 = 1;
    v208 = 2;
    v209 = v270;
    while (1)
    {
      ++v207;
      if (v209 >= v137)
      {
        v213 = 0.0;
        v214 = v208;
        v215 = (float *)v39;
        do
        {
          v216 = *v215++;
          HIWORD(v217) = HIWORD(v216);
          v213 = v213 + v216;
          --v214;
        }
        while (v214);
        v210 = v207;
        LOWORD(v217) = *(_WORD *)(v199 + 2 * v204);
        v37.f32[0] = (float)v217;
        v211 = v213 * v37.f32[0];
        v212 = v209 - v131;
        if (v209 - v131 > v136)
          goto LABEL_143;
      }
      else
      {
        v210 = 0;
        v37.i16[0] = *(_WORD *)(v199 + 2 * v204);
        v37.f32[0] = (float)v37.u32[0];
        v211 = 0.0 * v37.f32[0];
        v212 = v209 - v131;
        if (v209 - v131 > v136)
          goto LABEL_143;
      }
      v218 = v280 - (v202 + v47);
      v219 = v210;
      if (v218 < 0x10)
      {
        v220 = (int)v47 - 2;
        v221 = v210;
LABEL_158:
        v238 = &v39->f32[v221];
        do
        {
          v37.i16[0] = *(_WORD *)(v206 + 2 * v220);
          v37.f32[0] = (float)v37.u32[0];
          v239 = *v238++;
          v211 = v211 + (float)(v37.f32[0] * v239);
          v32 = v220-- <= v212;
        }
        while (!v32);
        goto LABEL_143;
      }
      v222 = v203 & 0xFFFFFFFFFFFFFFF0;
      v220 = v136 - (v218 & 0xFFFFFFFFFFFFFFF0);
      v221 = (v218 & 0xFFFFFFFFFFFFFFF0) + v219;
      v223 = (float32x4_t *)((char *)v283 + 4 * v219);
      v224 = (int16x8_t *)v205;
      do
      {
        v225 = (int8x16_t)vrev64q_s16(*v224);
        v226 = (uint16x8_t)vextq_s8(v225, v225, 8uLL);
        v227 = (int8x16_t)vrev64q_s16(v224[-1]);
        v228 = (uint16x8_t)vextq_s8(v227, v227, 8uLL);
        v229 = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v226.i8));
        v230 = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v228.i8));
        v231 = v223[-2];
        v232 = v223[-1];
        v233 = *v223;
        v234 = v223[1];
        v223 += 4;
        v37 = vmulq_f32(v232, vcvtq_f32_u32(vmovl_high_u16(v226)));
        v235 = vmulq_f32(v231, v229);
        v236 = vmulq_f32(v234, vcvtq_f32_u32(vmovl_high_u16(v228)));
        v237 = vmulq_f32(v233, v230);
        v211 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v211 + v235.f32[0]) + v235.f32[1]) + v235.f32[2]) + v235.f32[3]) + v37.f32[0])
                                                                                             + v37.f32[1])
                                                                                     + v37.f32[2])
                                                                             + v37.f32[3])
                                                                     + v237.f32[0])
                                                             + v237.f32[1])
                                                     + v237.f32[2])
                                             + v237.f32[3])
                                     + v236.f32[0])
                             + v236.f32[1])
                     + v236.f32[2])
             + v236.f32[3];
        v224 -= 2;
        v222 -= 16;
      }
      while (v222);
      if (v218 != (v218 & 0xFFFFFFFFFFFFFFF0))
        goto LABEL_158;
LABEL_143:
      if (v211 <= 0.0)
        v37.f32[0] = -0.5;
      else
        v37.f32[0] = 0.5;
      v48[v209++] = (int)(float)(v211 + v37.f32[0]);
      ++v208;
      ++v202;
      --v203;
      if (v209 >= v47)
        goto LABEL_104;
    }
  }
LABEL_163:
  free(v48);
  free(v39);
  if (v264)
  {
    v240 = *(_QWORD *)(v265 - 16 * v47 - 8);
    v241 = (unsigned int *)(v240 + 24);
    do
    {
      v242 = __ldaxr(v241);
      v243 = v242 - 1;
    }
    while (__stlxr(v243, v241));
    if (v243 < 0)
      __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
    if (v243)
    {
      do
        v244 = __ldaxr(&qword_254A77330);
      while (__stlxr(v244 - 1, &qword_254A77330));
      do
        v245 = __ldaxr((unint64_t *)&unk_254A77338);
      while (__stlxr(v245, (unint64_t *)&unk_254A77338));
      do
        v246 = __ldaxr(&global_stats);
      while (__stlxr(v246, &global_stats));
      do
        v247 = __ldaxr(&pmem_total_refs);
      while (__stlxr(v247 - 1, &pmem_total_refs));
      do
        v248 = __ldaxr(&_pmem_total_blocks);
      while (__stlxr(v248, &_pmem_total_blocks));
      do
        v249 = __ldaxr(&pmem_bytes_allocated);
      while (__stlxr(v249, &pmem_bytes_allocated));
    }
    else
    {
      v250 = -*(_QWORD *)(v240 + 8);
      do
        v251 = __ldaxr(&qword_254A77330);
      while (__stlxr(v251 - 1, &qword_254A77330));
      do
        v252 = __ldaxr((unint64_t *)&unk_254A77338);
      while (__stlxr(v252 - 1, (unint64_t *)&unk_254A77338));
      do
        v253 = __ldaxr(&global_stats);
      while (__stlxr(v253 + v250, &global_stats));
      do
        v254 = __ldaxr(&pmem_total_refs);
      while (__stlxr(v254 - 1, &pmem_total_refs));
      do
        v255 = __ldaxr(&_pmem_total_blocks);
      while (__stlxr(v255 - 1, &_pmem_total_blocks));
      do
        v256 = __ldaxr(&pmem_bytes_allocated);
      while (__stlxr(v256 + v250, &pmem_bytes_allocated));
      (*(void (**)(uint64_t))(v240 + 40))(v240);
      free((void *)v240);
    }
  }
}

int8x16_t *create_pyr(int8x16_t *result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint16x8_t **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int8x16_t v33;
  int v34;
  int16x8_t *v35;
  int16x8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int16x8_t *v42;
  int16x8_t *v43;
  int8x16_t *v44;
  int v45;
  __int16 v46;
  __int16 v47;
  __int16 v48;
  int8x16_t *v49;
  int16x8_t *v50;
  int16x8_t *v51;
  uint64_t v52;
  int8x16_t v53;
  uint64_t v54;

  if ((int)result >= -1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(a2 + 8);
    v5 = *(_DWORD *)(v4 + 8);
    v6 = *(_DWORD *)(v4 + 12);
    v7 = (_DWORD)result + 2;
    v54 = ((_DWORD)result + 2);
    if ((int)result + 2 <= 1)
      v7 = 1;
    v8 = 2 * v5 * (v6 + 16);
    v9 = 24 * v7;
    v10 = 4;
    do
    {
      v14 = *(_QWORD *)a2;
      v15 = *(_QWORD *)(a2 + 16);
      if (*(_QWORD *)a2 >= v15)
      {
        v16 = 2 * v15;
        v17 = v15 == 0;
        v18 = 10;
        if (!v17)
          v18 = v16;
        if (v18 <= v14)
          v19 = v14 + 1;
        else
          v19 = v18;
        if (v19)
        {
          *(_QWORD *)(a2 + 8) = malloc_type_realloc(*(void **)(a2 + 8), 24 * v19, 0x2DECA4BFuLL);
          v14 = *(_QWORD *)a2;
        }
        *(_QWORD *)(a2 + 16) = v19;
      }
      *(_QWORD *)a2 = v14 + 1;
      v11 = *(_QWORD *)(a2 + 8);
      v12 = v11 + 24 * v14;
      v13 = (uint16x8_t **)(v11 + v3);
      *(_DWORD *)(v12 + 8) = v5;
      *(_DWORD *)(v12 + 12) = v6;
      *(_QWORD *)(v12 + 16) = v5;
      *(_QWORD *)v12 = pmem_alloc_ex(v8, 0, 0) + 16 * *(_QWORD *)(v12 + 16);
      vl_gauss16(v13, (uint64_t *)v12, *(float *)(*(_QWORD *)(a2 + 56) + v10));
      v3 += 24;
      v10 += 4;
    }
    while (v9 != v3);
    for (i = 0; ; ++i)
    {
      v21 = *(_QWORD *)(a2 + 24);
      v22 = *(_QWORD *)(a2 + 40);
      if (v21 >= v22)
      {
        if (v22)
          v23 = 2 * v22;
        else
          v23 = 10;
        if (v23 <= v21)
          v24 = v21 + 1;
        else
          v24 = v23;
        if (v24)
        {
          *(_QWORD *)(a2 + 32) = malloc_type_realloc(*(void **)(a2 + 32), 24 * v24, 0x4CB8FCFDuLL);
          v21 = *(_QWORD *)(a2 + 24);
        }
        *(_QWORD *)(a2 + 40) = v24;
      }
      *(_QWORD *)(a2 + 24) = v21 + 1;
      v25 = *(_QWORD *)(a2 + 32) + 24 * v21;
      *(_DWORD *)(v25 + 8) = v5;
      *(_DWORD *)(v25 + 12) = v6;
      *(_QWORD *)(v25 + 16) = v5;
      v26 = pmem_alloc_ex(v8, 0, 0);
      v27 = *(_QWORD *)(v25 + 16);
      result = (int8x16_t *)(v26 + 16 * v27);
      *(_QWORD *)v25 = result;
      v28 = *(_QWORD *)(a2 + 8);
      v29 = v28 + 24 * i;
      v30 = *(int *)(v25 + 8);
      if ((_DWORD)v30 != *(_DWORD *)(v29 + 32))
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer+1])))->x_size");
      v31 = i + 1;
      v32 = *(_DWORD *)(v25 + 12);
      if (v32 != *(_DWORD *)(v28 + 24 * (i + 1) + 12))
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer+1])))->y_size");
      if ((_DWORD)v30 != *(_DWORD *)(v28 + 24 * i + 8))
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer])))->x_size");
      if (v32 != *(_DWORD *)(v28 + 24 * i + 12))
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer])))->y_size");
      v33.i64[0] = 0x8000800080008000;
      v33.i64[1] = 0x8000800080008000;
      if (v32 >= 1 && (int)v30 >= 1)
        break;
LABEL_16:
      if (v31 == v54)
        return result;
    }
    v34 = 0;
    v35 = *(int16x8_t **)(v29 + 24);
    v36 = *(int16x8_t **)v29;
    v37 = v27 - v30;
    v38 = *(_QWORD *)(v28 + 24 * v31 + 16) - v30;
    v39 = *(_QWORD *)(v28 + 24 * i + 16) - v30;
    v40 = 2 * (v30 & 0xFFFFFFF0);
    while (1)
    {
      if (v30 >= 0x10)
      {
        v41 = 0;
        if ((unint64_t)((char *)result - (char *)v35) >= 0x20
          && (unint64_t)((char *)result - (char *)v36) >= 0x20)
        {
          v42 = (int16x8_t *)((char *)v36 + v40);
          v43 = (int16x8_t *)((char *)v35 + v40);
          v44 = (int8x16_t *)((char *)result + v40);
          v49 = result + 1;
          v50 = v35 + 1;
          v51 = v36 + 1;
          v52 = v30 & 0xFFFFFFF0;
          do
          {
            v53 = veorq_s8((int8x16_t)vsubq_s16(*v50, *v51), v33);
            v49[-1] = veorq_s8((int8x16_t)vsubq_s16(v50[-1], v51[-1]), v33);
            *v49 = v53;
            v49 += 2;
            v50 += 2;
            v51 += 2;
            v52 -= 16;
          }
          while (v52);
          v41 = v30 & 0x7FFFFFF0;
          if ((v30 & 0xFFFFFFF0) == v30)
            goto LABEL_34;
          goto LABEL_38;
        }
      }
      else
      {
        v41 = 0;
      }
      v42 = v36;
      v43 = v35;
      v44 = result;
LABEL_38:
      v45 = v30 - v41;
      do
      {
        v47 = v43->i16[0];
        v43 = (int16x8_t *)((char *)v43 + 2);
        v46 = v47;
        v48 = v42->i16[0];
        v42 = (int16x8_t *)((char *)v42 + 2);
        v44->i16[0] = (v46 - v48) ^ 0x8000;
        v44 = (int8x16_t *)((char *)v44 + 2);
        --v45;
      }
      while (v45);
LABEL_34:
      result = (int8x16_t *)((char *)v44 + 2 * v37);
      v35 = (int16x8_t *)((char *)v43 + 2 * v38);
      ++v34;
      v36 = (int16x8_t *)((char *)v42 + 2 * v39);
      if (v34 == v32)
        goto LABEL_16;
    }
  }
  return result;
}

uint64_t create_pyr2(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int16x8_t **v10;
  int16x8_t *v11;
  int8x16_t v12;
  int16x8_t *v13;
  int16x8_t **v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int8x16_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int16x8_t *v24;
  int v25;
  int16x8_t *v26;
  int16x8_t *v27;
  int8x16_t *v28;
  int v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  int8x16_t *v33;
  int16x8_t *v34;
  int16x8_t *v35;
  uint64_t v36;
  int8x16_t v37;

  if ((int)result >= -1)
  {
    v3 = 0;
    v4 = (result + 2);
    if ((int)v4 <= 1)
      v5 = 1;
    else
      v5 = result + 2;
    v6 = 24 * v5;
    v7 = 4;
    do
    {
      vl_gauss16((uint16x8_t **)(a2[1] + v3), (uint64_t *)(a2[1] + v3 + 24), *(float *)(a2[7] + v7));
      v3 += 24;
      v7 += 4;
    }
    while (v6 != v3);
    v8 = 0;
    v9 = a2[4];
    v10 = (int16x8_t **)a2[1];
    v11 = *v10;
    v12.i64[0] = 0x8000800080008000;
    v12.i64[1] = 0x8000800080008000;
    while (1)
    {
      v13 = v11;
      result = v9 + 24 * v8;
      v14 = &v10[3 * v8];
      v15 = *(int *)(result + 8);
      if ((_DWORD)v15 != *((_DWORD *)v14 + 8))
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer+1])))->x_size");
      v16 = v8 + 1;
      v17 = *(_DWORD *)(v9 + 24 * v8 + 12);
      if (v17 != HIDWORD(v10[3 * v8 + 4]))
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer+1])))->y_size");
      if ((_DWORD)v15 != LODWORD(v10[3 * v8 + 1]))
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer])))->x_size");
      if (v17 != HIDWORD(v10[3 * v8 + 1]))
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer])))->y_size");
      v11 = v14[3];
      if (v17 >= 1 && (int)v15 >= 1)
        break;
LABEL_8:
      v8 = v16;
      if (v16 == v4)
        return result;
    }
    v18 = 0;
    v19 = *(int8x16_t **)result;
    v20 = 3 * v8;
    v21 = *(_QWORD *)(v9 + 24 * v8 + 16) - v15;
    result = (uint64_t)v10[3 * v16 + 2]->i64 - v15;
    v22 = (uint64_t)v10[v20 + 2]->i64 - v15;
    v23 = 2 * (v15 & 0xFFFFFFF0);
    v24 = v11;
    while (1)
    {
      if (v15 >= 0x10)
      {
        v25 = 0;
        if ((unint64_t)((char *)v19 - (char *)v24) >= 0x20
          && (unint64_t)((char *)v19 - (char *)v13) >= 0x20)
        {
          v26 = (int16x8_t *)((char *)v13 + v23);
          v27 = (int16x8_t *)((char *)v24 + v23);
          v28 = (int8x16_t *)((char *)v19 + v23);
          v33 = v19 + 1;
          v34 = v24 + 1;
          v35 = v13 + 1;
          v36 = v15 & 0xFFFFFFF0;
          do
          {
            v37 = veorq_s8((int8x16_t)vsubq_s16(*v34, *v35), v12);
            v33[-1] = veorq_s8((int8x16_t)vsubq_s16(v34[-1], v35[-1]), v12);
            *v33 = v37;
            v33 += 2;
            v34 += 2;
            v35 += 2;
            v36 -= 16;
          }
          while (v36);
          v25 = v15 & 0x7FFFFFF0;
          if ((v15 & 0xFFFFFFF0) == v15)
            goto LABEL_16;
          goto LABEL_20;
        }
      }
      else
      {
        v25 = 0;
      }
      v26 = v13;
      v27 = v24;
      v28 = v19;
LABEL_20:
      v29 = v15 - v25;
      do
      {
        v31 = v27->i16[0];
        v27 = (int16x8_t *)((char *)v27 + 2);
        v30 = v31;
        v32 = v26->i16[0];
        v26 = (int16x8_t *)((char *)v26 + 2);
        v28->i16[0] = (v30 - v32) ^ 0x8000;
        v28 = (int8x16_t *)((char *)v28 + 2);
        --v29;
      }
      while (v29);
LABEL_16:
      v19 = (int8x16_t *)((char *)v28 + 2 * v21);
      v24 = (int16x8_t *)((char *)v27 + 2 * result);
      ++v18;
      v13 = (int16x8_t *)((char *)v26 + 2 * v22);
      if (v18 == v17)
        goto LABEL_8;
    }
  }
  return result;
}

void vl_height_get_for_latlon(int *a1, uint64_t a2, float a3, float a4)
{
  uint64_t v4;
  __double2 v8;
  double v9;
  __double2 v10;
  int v11;
  float64x2_t v12;
  float32x2_t v13;
  float64x2_t v14;
  float v15;
  float32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  float v19;
  BOOL v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __double2 v30;
  double v31;
  __double2 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float64x2_t v37;
  double v38;
  float64x2_t v39;

  v4 = *((_QWORD *)a1 + 15) / (a1[1] * (uint64_t)*a1);
  if ((int)v4 >= 1)
  {
    v39 = *(float64x2_t *)(a1 + 14);
    v8 = __sincos_stret(a3);
    v9 = 6378137.0 / sqrt(v8.__sinval * -0.00669437999 * v8.__sinval + 1.0);
    v38 = v8.__sinval * (v9 * 0.99330562) - *((double *)a1 + 12);
    v37 = *(float64x2_t *)(a1 + 2);
    v10 = __sincos_stret(a4);
    v11 = 0;
    v12 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)a1 + 2), v10.__sinval * (v8.__cosval * v9) - *((double *)a1 + 11)), v37, v10.__cosval * (v8.__cosval * v9) - *((double *)a1 + 10)), v39, v38);
    v13 = vcvt_f32_f64(v12);
    v14 = v12;
    do
    {
      v16 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 26)));
      v17 = vcvt_s32_f32(vmul_f32(vadd_f32(vmul_f32(v16, (float32x2_t)0x3F0000003F000000), v13), vdiv_f32(vcvt_f32_s32(*(int32x2_t *)a1), v16)));
      v18 = vcgt_s32(*(int32x2_t *)a1, v17);
      if ((v18.i8[0] & 1) != 0
        && (v17.i32[0] & 0x80000000) == 0
        && (v17.i32[1] & 0x80000000) == 0
        && (v18.i8[4] & 1) != 0)
      {
        v19 = *(float *)(*((_QWORD *)a1 + 16)
                       + 4 * (int)(v17.i32[0] + (v17.i32[1] + HIDWORD(*(_QWORD *)a1) * v11) * *(_QWORD *)a1));
        v20 = v19 != 3.4028e38 && v19 <= 80000.0;
        if (v20 && v19 >= -80000.0)
        {
          v22 = v19;
          v23 = *((double *)a1 + 10)
              + v14.f64[1] * *((double *)a1 + 2)
              + *((double *)a1 + 1) * v14.f64[0]
              + *((double *)a1 + 3) * v22;
          v24 = v14.f64[1] * *((double *)a1 + 8);
          v25 = *((double *)a1 + 12);
          v26 = *((double *)a1 + 11)
              + v14.f64[1] * *((double *)a1 + 5)
              + *((double *)a1 + 4) * v14.f64[0]
              + *((double *)a1 + 6) * v22;
          v27 = v25 + v24 + *((double *)a1 + 7) * v14.f64[0] + *((double *)a1 + 9) * v22;
          v28 = sqrt(v26 * v26 + v23 * v23);
          if (v28 >= 0.001)
          {
            v29 = atan2(v25 + v24 + *((double *)a1 + 7) * v14.f64[0] + *((double *)a1 + 9) * v22, v28 * 0.996647189);
          }
          else
          {
            v29 = dbl_210BCAB20[v27 < 0.0];
            v28 = 0.001;
          }
          v30 = __sincos_stret(v29);
          v31 = atan2(v27 + v30.__sinval * (v30.__sinval * v30.__sinval) * 42841.3115, v28 + v30.__cosval * (v30.__cosval * v30.__cosval) * -42697.6727);
          v32 = __sincos_stret(v31);
          v33 = *(_QWORD *)a2;
          v34 = *(_QWORD *)(a2 + 16);
          if (*(_QWORD *)a2 >= v34)
          {
            if (v34)
              v35 = 2 * v34;
            else
              v35 = 64;
            if (v35 <= v33)
              v36 = v33 + 1;
            else
              v36 = v35;
            if (v36)
            {
              *(_QWORD *)(a2 + 8) = malloc_type_realloc(*(void **)(a2 + 8), 4 * v36, 0xD660BEBAuLL);
              v33 = *(_QWORD *)a2;
            }
            *(_QWORD *)(a2 + 16) = v36;
          }
          *(_QWORD *)a2 = v33 + 1;
          v15 = v28 / v32.__cosval + -6378137.0 / sqrt(v32.__sinval * -0.00669437999 * v32.__sinval + 1.0);
          *(float *)(*(_QWORD *)(a2 + 8) + 4 * v33) = v15;
        }
      }
      ++v11;
    }
    while ((_DWORD)v4 != v11);
  }
}

int *vl_height_get_for_cs(int *result, double *a2, uint64_t a3, float a4, float a5)
{
  uint64_t v5;
  double *v8;
  int v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  float v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  float v38;
  int v39;
  int v40;
  float v41;
  BOOL v42;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;

  v5 = *((_QWORD *)result + 15) / (result[1] * (uint64_t)*result);
  if ((int)v5 >= 1)
  {
    v8 = (double *)result;
    v9 = 0;
    v10 = a4;
    v11 = a5;
    v12 = 0.5;
    v51 = a5;
    v52 = a4;
    do
    {
      v14 = a2[2];
      v16 = a2[8];
      v15 = a2[9];
      v17 = a2[5];
      v18 = a2[10];
      v19 = a2[11];
      v20 = v8[1];
      v22 = v8[10];
      v21 = v8[11];
      v23 = v15 + a2[1] * v11 + *a2 * v10 + v14 * 0.0 - v22;
      v24 = v8[4];
      v25 = v18 + a2[4] * v11 + a2[3] * v10 + v17 * 0.0 - v21;
      v26 = v8[7];
      v27 = v8[12];
      v28 = v19 + a2[7] * v11 + a2[6] * v10 + v16 * 0.0 - v27;
      v29 = v24 * v25 + v20 * v23 + v26 * v28;
      v30 = v29;
      v31 = v8[14];
      v32 = (int)(float)((float)((float)*(int *)v8 / v31) * (float)((float)(v31 * v12) + v30));
      if (*(_DWORD *)v8 > v32 && (v32 & 0x80000000) == 0)
      {
        v33 = v8[2];
        v34 = v8[5];
        v35 = v8[8];
        v36 = v25 * v34 + v33 * v23 + v35 * v28;
        v37 = v36;
        v38 = v8[13];
        v39 = *((_DWORD *)v8 + 1);
        v40 = (int)(float)((float)((float)(v38 * v12) + v37) * (float)((float)v39 / v38));
        if ((v40 & 0x80000000) == 0 && v39 > v40)
        {
          v41 = *(float *)(*((_QWORD *)v8 + 16) + 4 * (v32 + (v40 + v39 * v9) * *(_DWORD *)v8));
          v42 = v41 != 3.4028e38 && v41 <= 80000.0;
          if (v42 && v41 >= -80000.0)
          {
            v44 = v8[3];
            v45 = v8[6];
            v46 = v8[9];
            v47 = *(_QWORD *)a3;
            v48 = *(_QWORD *)(a3 + 16);
            if (*(_QWORD *)a3 >= v48)
            {
              if (v48)
                v49 = 2 * v48;
              else
                v49 = 64;
              if (v49 <= v47)
                v50 = v47 + 1;
              else
                v50 = v49;
              if (v50)
              {
                v64 = a2[9];
                v65 = a2[2];
                v62 = a2[5];
                v63 = a2[8];
                v60 = a2[11];
                v61 = a2[10];
                v58 = v8[11];
                v59 = v8[12];
                v56 = v8[10];
                v57 = v8[7];
                v54 = v8[6];
                v55 = v8[9];
                v53 = v8[3];
                result = (int *)malloc_type_realloc(*(void **)(a3 + 8), 4 * v50, 0x80A02E46uLL);
                v44 = v53;
                v45 = v54;
                v46 = v55;
                v22 = v56;
                v26 = v57;
                v21 = v58;
                v27 = v59;
                v19 = v60;
                v18 = v61;
                v17 = v62;
                v16 = v63;
                v15 = v64;
                v14 = v65;
                v12 = 0.5;
                v11 = v51;
                v10 = v52;
                *(_QWORD *)(a3 + 8) = result;
                v47 = *(_QWORD *)a3;
              }
              *(_QWORD *)(a3 + 16) = v50;
            }
            *(_QWORD *)a3 = v47 + 1;
            v13 = v17 * (v21 + v34 * v36 + v24 * v29 + v45 * v41 - v18)
                + v14 * (v22 + v33 * v36 + v20 * v29 + v44 * v41 - v15)
                + v16 * (v27 + v35 * v36 + v26 * v29 + v46 * v41 - v19);
            *(float *)(*(_QWORD *)(a3 + 8) + 4 * v47) = v13;
          }
        }
      }
      ++v9;
    }
    while ((_DWORD)v5 != v9);
  }
  return result;
}

float vl_height_get_for_global(uint64_t a1, double *a2)
{
  double v2;
  double v3;
  double v4;
  float64x2_t v5;
  float64x2_t v11;
  int64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  int32x4_t v15;
  int64x2_t v16;
  float v17;
  float v19;

  v2 = *a2 - *(double *)(a1 + 80);
  v3 = a2[1] - *(double *)(a1 + 88);
  v4 = a2[2] - *(double *)(a1 + 96);
  v5 = (float64x2_t)vextq_s8(*(int8x16_t *)(a1 + 104), *(int8x16_t *)(a1 + 104), 8uLL);
  __asm
  {
    FMOV            V5.2D, #0.5
    FMOV            V6.2D, #-0.5
  }
  v11 = vaddq_f64(vmulq_f64(v5, _Q5), _Q6);
  v12.i64[0] = (int)*(_QWORD *)a1;
  v12.i64[1] = (int)HIDWORD(*(_QWORD *)a1);
  v13 = vcvtq_f64_s64(v12);
  v14 = vmulq_f64(vdivq_f64(v13, v5), vaddq_f64(v11, vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), v3), *(float64x2_t *)(a1 + 8), v2), *(float64x2_t *)(a1 + 56), v4)));
  v15 = (int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f64(v14, v13));
  *(int32x2_t *)v15.i8 = vmovn_s64((int64x2_t)v15);
  v15.i32[0] = vmovn_s32(v15).u32[0];
  v16 = (int64x2_t)vmvnq_s8((int8x16_t)vcltzq_f64(v14));
  v15.i32[1] = vmovn_s32(vmovn_hight_s64(*(int32x2_t *)&v16, v16)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(*(int16x4_t *)v15.i8, 0xFuLL))) & 1) == 0)
    return 3.4028e38;
  v17 = *(float *)(*(_QWORD *)(a1 + 128) + 4 * (int)((int)v14.f64[0] + *(_QWORD *)a1 * (int)v14.f64[1]));
  if (v17 > 80000.0 || v17 < -80000.0)
    return 3.4028e38;
  v19 = v3 * *(double *)(a1 + 48) + *(double *)(a1 + 24) * v2 + *(double *)(a1 + 72) * v4;
  return v17 - v19;
}

BOOL g_pinhole_to_pixel_jac(double *a1, double *a2, int a3, double *a4, unsigned int a5, int a6, int a7, float64x2_t *a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double *a17, uint64_t a18, uint64_t a19, float64x2_t *a20,float64x2_t *a21)
{
  double v26;
  double v27;
  double v31;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v54;
  double v55;
  float64x2_t v56;
  float64x2_t v57;
  double v58;
  double v59;
  double v60;
  float64x2_t v61;
  float64x2_t v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  float64x2_t *v66;
  float64x2_t v67;
  uint64_t v68;
  double *v69;
  double *v70;
  double v71;
  double v75;
  double v76;
  double v77;
  double v78;
  double v80[2];

  v26 = a14;
  v27 = a13;
  v31 = a10;
  v33 = a15 + a9 * a11;
  v34 = a16 + a10 * a11;
  v35 = sqrt(v34 * v34 + v33 * v33);
  v78 = v34;
  if ((a3 - 15) >= 0xFFFFFFFD)
  {
    v80[0] = 0.0;
    v77 = a15 + a9 * a11;
    g_interp_bspline3_mix2(a5, a4, v80, a21, 1, v35 * 0.707106781, 0.0, 0.0);
    v33 = v77;
    v43 = v48 + 1.0;
    v47 = v48 + 1.0 + v35 * v80[0];
    v46 = v80[0] * 0.707106781;
    if (!a1)
      goto LABEL_11;
    goto LABEL_10;
  }
  v75 = v31;
  if (a3 != 15)
    __assert_rtn("g_pinhole_to_pixel_jac", "g_camera.c", 1146, "0");
  v36 = 1.41421356 / (double)(int)(a5 - 1);
  v37 = (int)(v35 / v36);
  if ((int)(a5 - 2) < v37)
    v37 = a5 - 2;
  v38 = v35 / v36 - (double)v37;
  v39 = v37;
  v40 = a4[v37];
  v41 = v37 + 1;
  v42 = a4[v41];
  v43 = (1.0 - v38) * v40 + 1.0 + v38 * v42;
  v44 = v42 - v40;
  v45 = v42 - v40;
  if (a21)
  {
    v76 = v33;
    bzero(a21, 8 * (int)a5);
    v33 = v76;
    a21->f64[v39] = 1.0 - v38;
    a21->f64[v41] = v38;
    v45 = a4[v41] - a4[v39];
  }
  v46 = v44 / v36;
  v47 = v43 + v35 * v45 / v36;
  v26 = a14;
  v31 = v75;
  v27 = a13;
  if (a1)
LABEL_10:
    *a1 = (v27 + 1.0) * (double)a6 * 0.5 + v33 * v43 * (double)a6 * 0.5 + -0.5;
LABEL_11:
  if (a2)
    *a2 = (v26 + 1.0) * (double)a7 * 0.5 + v78 * (v43 * a12) * (double)a6 * 0.5 + -0.5;
  __asm { FMOV            V1.2D, #0.5 }
  if (a8)
  {
    v54 = v33 * (v46 * a11) / v35;
    v55 = v78 * (v46 * a11) / v35;
    v56.f64[0] = v43 * a11 + v33 * v54;
    v56.f64[1] = v33 * v55;
    v57.f64[0] = v78 * a12 * v54;
    v57.f64[1] = v43 * a12 * a11 + v78 * a12 * v55;
    *a8 = vmulq_f64(vmulq_n_f64(v56, (double)a6), _Q1);
    a8[1] = vmulq_f64(vmulq_n_f64(v57, (double)a6), _Q1);
  }
  if (a17)
  {
    v58 = (v78 * v31 + v33 * a9) * v46 / v35;
    *a17 = (v33 * v58 + v43 * a9) * (double)a6 * 0.5;
    a17[1] = (v78 * a12 * v58 + v43 * a12 * v31) * (double)a6 * 0.5;
  }
  if (a18)
  {
    *(_QWORD *)a18 = 0;
    *(double *)(a18 + 8) = v78 * v43 * (double)a6 * 0.5;
  }
  if (a19)
  {
    *(double *)a19 = (double)a6 * 0.5;
    *(_QWORD *)(a19 + 8) = 0;
    *(_QWORD *)(a19 + 16) = 0;
    *(double *)(a19 + 24) = (double)a7 * 0.5;
  }
  if (a20)
  {
    v59 = v33 * v46 / v35;
    v60 = v78 * v46 / v35;
    v61.f64[0] = v43 + v33 * v59;
    v61.f64[1] = v33 * v60;
    v62.f64[0] = v78 * a12 * v59;
    v62.f64[1] = v78 * a12 * v60 + a12 * v43;
    *a20 = vmulq_f64(vmulq_n_f64(v61, (double)a6), _Q1);
    a20[1] = vmulq_f64(vmulq_n_f64(v62, (double)a6), _Q1);
  }
  if ((int)a5 >= 1 && a21)
  {
    v63 = (double)a6;
    if (a5 < 2)
    {
      v64 = 0;
LABEL_30:
      v68 = a5 - v64;
      v69 = &a21->f64[v64 + a5];
      v70 = &a21->f64[v64];
      do
      {
        v71 = *v70;
        *v69++ = v78 * (*v70 * a12) * v63 * 0.5;
        *v70++ = v33 * v71 * v63 * 0.5;
        --v68;
      }
      while (v68);
      return v47 < 0.0;
    }
    v64 = a5 & 0xFFFFFFFE;
    v65 = v64;
    v66 = a21;
    do
    {
      v67 = *v66;
      *(float64x2_t *)((char *)v66 + 8 * a5) = vmulq_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(*v66, a12), v78), v63), _Q1);
      *v66++ = vmulq_f64(vmulq_n_f64(vmulq_n_f64(v67, v33), v63), _Q1);
      v65 -= 2;
    }
    while (v65);
    if (v64 != a5)
      goto LABEL_30;
  }
  return v47 < 0.0;
}

uint64_t g_improj_to_xyz(uint64_t a1, int a2, int a3, double *a4, double *a5, double *a6, double a7, double a8)
{
  unsigned int v8;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double sinval;
  double v31;
  long double v32;
  long double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  long double v48;
  double v49;
  long double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  unsigned int v66;
  double v67;
  __double2 v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  int v99;
  double v100;
  double *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  int v108;
  double v109;
  double *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  int v115;
  double v116;
  double *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  int v124;
  double v125;
  double *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  int v131;
  double v132;
  double *v133;
  double v134;
  double v135;
  double v136;
  __double2 v137;
  double v138;
  double v139;
  __double2 v140;
  __double2 v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  long double v147;
  double v148;
  long double v149;
  double v150;
  int v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  long double v198;
  double v199;
  double v200;
  long double v201;
  double v202;
  int v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  __double2 v225;
  double v226;
  double v227;
  __double2 v228;
  double v229;
  double v230;
  unsigned int v231;
  unint64_t v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  unint64_t v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double cosval;
  double v258;

  v256 = 0.0;
  cosval = 0.0;
  v255 = 0.0;
  v15 = a7 + 0.5;
  v16 = a8 + 0.5;
  switch(*(_DWORD *)a1)
  {
    case 0:
      cosval = 1.0;
      v17 = -(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      v18 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      v19 = *(double *)(a1 + 56);
      v20 = *(double *)(a1 + 64);
      v21 = *(double *)(a1 + 72);
      if (v19 != 0.0 || v20 != 0.0 || (v22 = 1.0, v21 != 0.0))
      {
        v23 = sqrt(v17 * v17 + v18 * v18);
        v24 = 1.0
            - (v23 * (v19 + (v20 + v21 * v23) * v23) * v23 + 1.0 + -1.0)
            / (v23 * (v23 * (v23 * (v21 * 5.0) + v20 * 4.0) + v19 * 3.0) * v23 + 1.0);
        v25 = v24
            - (v24 * (v23 * v24 * (v19 + (v20 + v21 * (v23 * v24)) * (v23 * v24)) * (v23 * v24) + 1.0) + -1.0)
            / (v23 * v24 * (v23 * v24 * (v21 * 5.0 * (v23 * v24) + v20 * 4.0) + v19 * 3.0) * (v23 * v24) + 1.0);
        v26 = v25
            - (v25 * (v23 * v25 * (v19 + (v20 + v21 * (v23 * v25)) * (v23 * v25)) * (v23 * v25) + 1.0) + -1.0)
            / (v23 * v25 * (v23 * v25 * (v21 * 5.0 * (v23 * v25) + v20 * 4.0) + v19 * 3.0) * (v23 * v25) + 1.0);
        v27 = v26
            - (v26 * (v23 * v26 * (v19 + (v20 + v21 * (v23 * v26)) * (v23 * v26)) * (v23 * v26) + 1.0) + -1.0)
            / (v23 * v26 * (v23 * v26 * (v21 * 5.0 * (v23 * v26) + v20 * 4.0) + v19 * 3.0) * (v23 * v26) + 1.0);
        v28 = v23 * v27;
        v22 = v27
            - (v27 * (v28 * (v19 + (v20 + v21 * v28) * v28) * v28 + 1.0) + -1.0)
            / (v28 * (v28 * (v21 * 5.0 * v28 + v20 * 4.0) + v19 * 3.0) * v28 + 1.0);
      }
      v29 = 0;
      sinval = v17 * v22 - *(double *)(a1 + 40);
      v31 = v18 * v22 - *(double *)(a1 + 48);
      break;
    case 1:
      v137 = __sincos_stret(-(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * *(double *)(a1 + 8)));
      sinval = v137.__sinval;
      cosval = v137.__cosval;
      v138 = v16 / (double)a3 + -0.5;
      v29 = 0;
      v31 = -(*(double *)(a1 + 32) - v138 * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      break;
    case 2:
      v139 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * *(double *)(a1 + 16));
      v140 = __sincos_stret(-(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * *(double *)(a1 + 8)));
      v141 = __sincos_stret(v139);
      v31 = v141.__sinval;
      v29 = 0;
      cosval = v140.__cosval * v141.__cosval;
      sinval = v140.__sinval * v141.__cosval;
      break;
    case 3:
      cosval = 1.0;
      v32 = -(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      v33 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      v34 = sqrt(v32 * v32 + v33 * v33);
      v35 = *(double *)(a1 + 64);
      v36 = *(double *)(a1 + 72);
      v37 = *(double *)(a1 + 56);
      v38 = 1.0
          - (v34 * (v37 + (v35 + v36 * v34) * v34) * v34 + 1.0 + -1.0)
          / (v34 * (v34 * (v34 * (v36 * 5.0) + v35 * 4.0) + v37 * 3.0) * v34 + 1.0);
      v39 = v38
          - (v38 * (v34 * v38 * (v37 + (v35 + v36 * (v34 * v38)) * (v34 * v38)) * (v34 * v38) + 1.0) + -1.0)
          / (v34 * v38 * (v34 * v38 * (v36 * 5.0 * (v34 * v38) + v35 * 4.0) + v37 * 3.0) * (v34 * v38) + 1.0);
      v40 = v39
          - (v39 * (v34 * v39 * (v37 + (v35 + v36 * (v34 * v39)) * (v34 * v39)) * (v34 * v39) + 1.0) + -1.0)
          / (v34 * v39 * (v34 * v39 * (v36 * 5.0 * (v34 * v39) + v35 * 4.0) + v37 * 3.0) * (v34 * v39) + 1.0);
      v41 = v40
          - (v40 * (v34 * v40 * (v37 + (v35 + v36 * (v34 * v40)) * (v34 * v40)) * (v34 * v40) + 1.0) + -1.0)
          / (v34 * v40 * (v34 * v40 * (v36 * 5.0 * (v34 * v40) + v35 * 4.0) + v37 * 3.0) * (v34 * v40) + 1.0);
      v42 = v34 * v41;
      v43 = v41
          - (v41 * (v42 * (v37 + (v35 + v36 * v42) * v42) * v42 + 1.0) + -1.0)
          / (v42 * (v42 * (v36 * 5.0 * v42 + v35 * 4.0) + v37 * 3.0) * v42 + 1.0);
      v44 = v32 * v43 - *(double *)(a1 + 40);
      v45 = v33 * v43 - *(double *)(a1 + 48);
      v46 = fmin(sqrt(v44 * v44 + v45 * v45), 1.57079319);
      v47 = 0.0;
      if (v46 != 0.0)
        v47 = tan(v46) / v46;
      v29 = 0;
      sinval = v44 * v47;
      v31 = v45 * v47;
      break;
    case 4:
      cosval = 1.0;
      v48 = tan(*(double *)(a1 + 8) * 0.5);
      sinval = (v15 / (double)a2 + -0.5) * v48 + (v15 / (double)a2 + -0.5) * v48;
      v49 = v16 / (double)a3 + -0.5;
      v50 = tan(*(double *)(a1 + 16) * 0.5);
      v29 = 0;
      v31 = v49 * v50 + v49 * v50;
      break;
    case 5:
      v51 = (v15 / (double)a2 + -0.5 - *(double *)(a1 + 24)) * *(double *)(a1 + 8);
      v52 = (v16 / (double)a3 + -0.5 - *(double *)(a1 + 32)) * *(double *)(a1 + 16);
      v53 = sqrt(v51 * v51 + v52 * v52);
      v54 = v51 / (v53 + 1.0e-20);
      v55 = *(double *)(a1 + 56);
      v56 = *(double *)(a1 + 64);
      v57 = *(double *)(a1 + 72);
      v58 = v57 * 5.0;
      v59 = 1.0
          - (v53 * (v55 + (v56 + v57 * v53) * v53) * v53 + 1.0 + -1.0)
          / (v53 * (v53 * (v53 * (v57 * 5.0) + v56 * 4.0) + v55 * 3.0) * v53 + 1.0);
      v60 = v59
          - (v59 * (v53 * v59 * (v55 + (v56 + v57 * (v53 * v59)) * (v53 * v59)) * (v53 * v59) + 1.0) + -1.0)
          / (v53 * v59 * (v53 * v59 * (v57 * 5.0 * (v53 * v59) + v56 * 4.0) + v55 * 3.0) * (v53 * v59) + 1.0);
      v61 = v60
          - (v60 * (v53 * v60 * (v55 + (v56 + v57 * (v53 * v60)) * (v53 * v60)) * (v53 * v60) + 1.0) + -1.0)
          / (v53 * v60 * (v53 * v60 * (v57 * 5.0 * (v53 * v60) + v56 * 4.0) + v55 * 3.0) * (v53 * v60) + 1.0);
      v62 = v61
          - (v61 * (v53 * v61 * (v55 + (v56 + v57 * (v53 * v61)) * (v53 * v61)) * (v53 * v61) + 1.0) + -1.0)
          / (v53 * v61 * (v53 * v61 * (v57 * 5.0 * (v53 * v61) + v56 * 4.0) + v55 * 3.0) * (v53 * v61) + 1.0);
      v63 = v62
          - (v62 * (v53 * v62 * (v55 + (v56 + v57 * (v53 * v62)) * (v53 * v62)) * (v53 * v62) + 1.0) + -1.0)
          / (v53 * v62 * (v53 * v62 * (v57 * 5.0 * (v53 * v62) + v56 * 4.0) + v55 * 3.0) * (v53 * v62) + 1.0);
      v64 = v52 / (v53 + 1.0e-20);
      v65 = v53 * v63;
      v66 = 2
          * (fabs(v53 * v63 * (v55 + (v56 + v57 * (v53 * v63)) * (v53 * v63)) * (v53 * v63) + 1.0 + -1.0 / v63) > 0.01);
      v67 = *(double *)(a1 + 40);
      if (v67 <= 0.174532925)
        v67 = 1.57079633;
      if (v65 > v67)
        v66 = 2;
      if (v65 * (v65 * (v58 * v65 + v56 * 4.0) + v55 * 3.0) * v65 + 1.0 >= 0.0)
        v29 = v66;
      else
        v29 = 2;
      v68 = __sincos_stret(v65);
      sinval = v54 * v68.__sinval;
      v31 = v64 * v68.__sinval;
      cosval = v68.__cosval;
      break;
    case 6:
      v142 = *(double *)(a1 + 56);
      v143 = *(double *)(a1 + 64);
      v144 = *(double *)(a1 + 72);
      v145 = *(double *)(a1 + 24) * 0.000001;
      v146 = *(double *)(a1 + 32) * 0.000001;
      cosval = 1.0;
      v147 = tan(*(double *)(a1 + 8) * 0.5);
      v148 = (v15 / (double)a2 + -0.5) * v147 + (v15 / (double)a2 + -0.5) * v147;
      v149 = tan(*(double *)(a1 + 16) * 0.5);
      v150 = (v16 / (double)a3 + -0.5) * v149 + (v16 / (double)a3 + -0.5) * v149;
      v151 = 5;
      v152 = v150;
      v153 = v148;
      do
      {
        v154 = v152 * v152;
        v155 = v153 * v153;
        v156 = v152 * v152 + v153 * v153;
        v157 = v142 * v156 + 1.0 + v143 * v156 * v156 + v156 * (v144 * v156) * v156;
        v158 = v155 * v155 + v152 * v152 * (v153 * v153 * 6.0 + v152 * v152 * 5.0);
        v159 = v155 * (v155 * v155)
             + v152 * v152 * (v152 * v152 * (v153 * v153 * 15.0 + v152 * v152 * 7.0) + v155 * v155 * 9.0);
        v160 = v148 - (v146 * (v156 + v153 * 2.0) + (v145 + v145) * v153 * v152 + v153 * v157);
        v161 = v150 - (v145 * (v156 + v152 * 2.0) + (v146 + v146) * v153 * v152 + v152 * v157);
        v162 = 0.0
             - (v142 * (v152 * v152 + v153 * v153 * 3.0)
              + 1.0
              + v143 * (v154 * v154 + v153 * v153 * (v152 * v152 * 6.0 + v153 * v153 * 5.0))
              + v144
              * (v154 * (v154 * v154)
               + v153 * v153 * (v153 * v153 * (v152 * v152 * 15.0 + v153 * v153 * 7.0) + v154 * v154 * 9.0))
              + (v146 * (v153 + 1.0) + v145 * v152) * 2.0);
        v163 = 0.0
             - (v142 * (v153 * v153 + v152 * v152 * 3.0)
              + 1.0
              + v143 * v158
              + v144 * v159
              + (v145 * (v152 + 1.0) + v146 * v153) * 2.0);
        v164 = (v146 * v152 + v145 * v153 + v152 * v153 * (v142 + (v144 * 3.0 * v156 + v143 * 2.0) * v156)) * -2.0 + 0.0;
        v165 = v162 * v163 - v164 * v164;
        v153 = v153 + (v164 * v161 - v163 * v160) / v165;
        v152 = v152 + (v164 * v160 - v161 * v162) / v165;
        --v151;
      }
      while (v151);
      v29 = 0;
      sinval = v153 - *(double *)(a1 + 40);
      v31 = v152 - *(double *)(a1 + 48);
      break;
    case 7:
      v166 = *(double *)(a1 + 16);
      v168 = *(double *)(a1 + 32);
      v167 = *(double *)(a1 + 40);
      v169 = -(v168 - (v16 / (double)a3 + -0.5) * v166);
      if (v167 == 0.0 || v169 <= v167)
      {
        v216 = *(double *)(a1 + 48);
        v171 = 1.0;
        if (v216 != 0.0 && v169 < v216)
        {
          v217 = -(*(double *)(a1 + 72) + -1.0) / (v216 + 1.57079633) * 0.5;
          v171 = 1.0;
          v169 = v216 + sqrt(-(v216 - v169) / v217 + 1.0 / v217 * 0.5 * (1.0 / v217 * 0.5)) - 1.0 / v217 * 0.5;
          v218 = fabs(v169) / 1.57079633;
          v219 = fabs(v216) / 1.57079633;
          if (v218 >= v219)
          {
            v220 = (v218 - v219) / (1.0 - v219);
            v221 = *(double *)(a1 + 64);
            v222 = 1.0;
            if (v221 > 0.0)
              v222 = (v220 + v220 / v221 * (v220 / v221)) / (v220 / v221 * (v220 / v221) + 1.0);
            v171 = v220 * (*(double *)(a1 + 56) / 1.57079633 + -1.0) * v222 + 1.0;
          }
        }
      }
      else
      {
        v170 = *(double *)(a1 + 56);
        v171 = 1.0;
        v169 = v167
             + 1.0 / ((v170 + -1.0) / (1.57079633 - v167) * 0.5) * -0.5
             - sqrt(-(v167 - v169) / ((v170 + -1.0) / (1.57079633 - v167) * 0.5)+ 1.0/ ((v170 + -1.0)/ (1.57079633 - v167)* 0.5)* 0.5* (1.0/ ((v170 + -1.0)/ (1.57079633 - v167)* 0.5)* 0.5));
        v172 = fabs(v169) / 1.57079633;
        v173 = fabs(v167) / 1.57079633;
        if (v172 >= v173)
        {
          v174 = *(double *)(a1 + 64);
          v175 = (v172 - v173) / (1.0 - v173);
          v176 = (v170 / 1.57079633 + -1.0) * v175;
          v177 = 1.0;
          if (v174 > 0.0)
            v177 = (v175 + v175 / v174 * (v175 / v174)) / (v175 / v174 * (v175 / v174) + 1.0);
          v171 = v176 * v177 + 1.0;
        }
      }
      v223 = *(double *)(a1 + 8);
      v224 = (v15 / (double)a2 + -0.5) / v171 * v223;
      v225 = __sincos_stret(v169);
      v31 = v225.__sinval;
      v226 = *(double *)(a1 + 24);
      v227 = v224 / v225.__cosval - v226;
      v228 = __sincos_stret(v227);
      cosval = v225.__cosval * v228.__cosval;
      sinval = v225.__cosval * v228.__sinval;
      v229 = fabs(v226 + v227);
      v230 = fabs(v168 + v169);
      if (v229 + v229 <= v223)
        v29 = 2 * (v230 + v230 > v166);
      else
        v29 = 2;
      break;
    case 8:
      cosval = 1.0;
      v178 = -(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      v179 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      v181 = *(double *)(a1 + 64);
      v180 = *(double *)(a1 + 72);
      v182 = *(double *)(a1 + 56);
      if (v182 == 0.0 && v180 == 0.0 && v181 == 0.0 && *(double *)(a1 + 40) == 0.0 && *(double *)(a1 + 48) == 0.0)
      {
        v191 = 1.0;
      }
      else
      {
        v183 = sqrt(v178 * v178 + v179 * v179);
        v184 = *(double *)(a1 + 40);
        v185 = *(double *)(a1 + 48);
        v186 = 1.0
             - (v183
              * (v182 + v183 * (v180 + v183 * (v181 + v183 * (v184 + v183 * v185 * v183) * v183) * v183) * v183)
              * v183
              + 1.0
              + -1.0)
             / (v183
              * (v183
               * (v183
                * (v183 * (v183 * (v183 * (v183 * (v183 * (v183 * (v185 * 11.0)) + v184 * 9.0)) + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * v183
              + 1.0);
        v187 = v186
             - (v186
              * (v183
               * v186
               * (v182
                + v183
                * v186
                * (v180
                 + v183
                 * v186
                 * (v181 + v183 * v186 * (v184 + v185 * (v183 * v186) * (v183 * v186)) * (v183 * v186))
                 * (v183
                  * v186))
                * (v183
                 * v186))
               * (v183
                * v186)
               + 1.0)
              + -1.0)
             / (v183
              * v186
              * (v183
               * v186
               * (v183
                * v186
                * (v183
                 * v186
                 * (v183
                  * v186
                  * (v183 * v186 * (v183 * v186 * (v183 * v186 * (v185 * 11.0 * (v183 * v186)) + v184 * 9.0))
                   + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * (v183
               * v186)
              + 1.0);
        v188 = v187
             - (v187
              * (v183
               * v187
               * (v182
                + v183
                * v187
                * (v180
                 + v183
                 * v187
                 * (v181 + v183 * v187 * (v184 + v185 * (v183 * v187) * (v183 * v187)) * (v183 * v187))
                 * (v183
                  * v187))
                * (v183
                 * v187))
               * (v183
                * v187)
               + 1.0)
              + -1.0)
             / (v183
              * v187
              * (v183
               * v187
               * (v183
                * v187
                * (v183
                 * v187
                 * (v183
                  * v187
                  * (v183 * v187 * (v183 * v187 * (v183 * v187 * (v185 * 11.0 * (v183 * v187)) + v184 * 9.0))
                   + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * (v183
               * v187)
              + 1.0);
        v189 = v188
             - (v188
              * (v183
               * v188
               * (v182
                + v183
                * v188
                * (v180
                 + v183
                 * v188
                 * (v181 + v183 * v188 * (v184 + v185 * (v183 * v188) * (v183 * v188)) * (v183 * v188))
                 * (v183
                  * v188))
                * (v183
                 * v188))
               * (v183
                * v188)
               + 1.0)
              + -1.0)
             / (v183
              * v188
              * (v183
               * v188
               * (v183
                * v188
                * (v183
                 * v188
                 * (v183
                  * v188
                  * (v183 * v188 * (v183 * v188 * (v183 * v188 * (v185 * 11.0 * (v183 * v188)) + v184 * 9.0))
                   + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * (v183
               * v188)
              + 1.0);
        v190 = v183 * v189;
        v191 = v189
             - (v189
              * (v190
               * (v182 + v190 * (v180 + v190 * (v181 + v190 * (v184 + v185 * v190 * v190) * v190) * v190) * v190)
               * v190
               + 1.0)
              + -1.0)
             / (v190
              * (v190
               * (v190
                * (v190 * (v190 * (v190 * (v190 * (v190 * (v185 * 11.0 * v190) + v184 * 9.0)) + v181 * 7.0)) + v180 * 5.0))
               + v182 * 3.0)
              * v190
              + 1.0);
      }
      v29 = 0;
      sinval = v178 * v191;
      v31 = v179 * v191;
      break;
    case 9:
      v192 = *(double *)(a1 + 56);
      v193 = *(double *)(a1 + 64);
      v194 = *(double *)(a1 + 72);
      v195 = *(double *)(a1 + 80);
      v196 = *(double *)(a1 + 88);
      cosval = 1.0;
      v197 = v15 / (double)a2 - *(double *)(a1 + 24);
      v198 = tan(*(double *)(a1 + 8) * 0.5);
      v199 = v197 * v198 + v197 * v198;
      v200 = v16 / (double)a3 - *(double *)(a1 + 32);
      v201 = tan(*(double *)(a1 + 16) * 0.5);
      v202 = v200 * v201 + v200 * v201;
      v203 = 5;
      v31 = v202;
      sinval = v199;
      do
      {
        v204 = v31 * v31;
        v205 = sinval * sinval;
        v206 = v31 * v31 + sinval * sinval;
        v207 = v192 * v206 + 1.0 + v194 * v206 * v206 + v206 * (v193 * v206) * v206;
        v208 = v205 * v205 + v31 * v31 * (sinval * sinval * 6.0 + v31 * v31 * 5.0);
        v209 = v205 * (v205 * v205)
             + v31 * v31 * (v31 * v31 * (sinval * sinval * 15.0 + v31 * v31 * 7.0) + v205 * v205 * 9.0);
        v210 = v199 - (v196 * (v206 + (sinval + sinval) * sinval) + (v195 + v195) * sinval * v31 + sinval * v207);
        v211 = v202 - (v195 * (v206 + (v31 + v31) * v31) + (v196 + v196) * sinval * v31 + v31 * v207);
        v212 = 0.0
             - (v192 * (v31 * v31 + sinval * sinval * 3.0)
              + 1.0
              + v194 * (v204 * v204 + sinval * sinval * (v31 * v31 * 6.0 + sinval * sinval * 5.0))
              + v193
              * (v204 * (v204 * v204)
               + sinval * sinval * (sinval * sinval * (v31 * v31 * 15.0 + sinval * sinval * 7.0) + v204 * v204 * 9.0))
              + (v196 * (sinval * 2.0 + 1.0) + v195 * v31) * 2.0);
        v213 = 0.0
             - (v192 * (sinval * sinval + v31 * v31 * 3.0)
              + 1.0
              + v194 * v208
              + v193 * v209
              + (v195 * (v31 * 2.0 + 1.0) + v196 * sinval) * 2.0);
        v214 = (v196 * v31 + v195 * sinval + v31 * sinval * (v192 + (v193 * 3.0 * v206 + v194 * 2.0) * v206)) * -2.0
             + 0.0;
        v215 = v212 * v213 - v214 * v214;
        sinval = sinval + (v214 * v211 - v213 * v210) / v215;
        v31 = v31 + (v214 * v210 - v211 * v212) / v215;
        --v203;
      }
      while (v203);
      v29 = 0;
      break;
    case 0xA:
      fisheye_kannala_inv(&cosval, &v256, &v255, v15, v16, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), (double)a2, (double)a3);
      v29 = 0;
      v31 = v255;
      sinval = v256;
      break;
    case 0xB:
      v69 = *(double *)(a1 + 24);
      v70 = *(double *)(a1 + 32);
      v71 = *(double *)(a1 + 48);
      v253 = *(double *)(a1 + 40);
      cosval = 1.0;
      v72 = -(v69 - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      v73 = -(v70 - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      v74 = *(double *)(a1 + 56);
      v75 = *(double *)(a1 + 64);
      v76 = *(double *)(a1 + 72);
      v77 = *(double *)(a1 + 80);
      v78 = *(double *)(a1 + 88);
      v79 = *(double *)(a1 + 96);
      v80 = *(double *)(a1 + 104);
      if (v74 + 0.0 + v75 + v76 + v77 + v78 + v79 + v80 == 0.0)
      {
        v87 = 1.0;
      }
      else
      {
        v81 = sqrt(v72 * v72 + v73 * v73);
        v82 = 1.0
            - (v81
             * (v74
              + v81
              * (v75 + v81 * (v76 + v81 * (v77 + v81 * (v78 + v81 * (v79 + v81 * v80 * v81) * v81) * v81) * v81) * v81)
              * v81)
             * v81
             + 1.0
             + -1.0)
            / (v81
             * (v81
              * (v81
               * (v81
                * (v81
                 * (v81
                  * (v81
                   * (v81 * (v81 * (v81 * (v81 * (v81 * (v81 * (v80 * 15.0)) + v79 * 13.0)) + v78 * 11.0)) + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * v81
             + 1.0);
        v83 = v82
            - (v82
             * (v81
              * v82
              * (v74
               + v81
               * v82
               * (v75
                + v81
                * v82
                * (v76
                 + v81
                 * v82
                 * (v77
                  + v81 * v82 * (v78 + v81 * v82 * (v79 + v80 * (v81 * v82) * (v81 * v82)) * (v81 * v82)) * (v81 * v82))
                 * (v81
                  * v82))
                * (v81
                 * v82))
               * (v81
                * v82))
              * (v81
               * v82)
              + 1.0)
             + -1.0)
            / (v81
             * v82
             * (v81
              * v82
              * (v81
               * v82
               * (v81
                * v82
                * (v81
                 * v82
                 * (v81
                  * v82
                  * (v81
                   * v82
                   * (v81
                    * v82
                    * (v81
                     * v82
                     * (v81 * v82 * (v81 * v82 * (v81 * v82 * (v80 * 15.0 * (v81 * v82)) + v79 * 13.0)) + v78 * 11.0))
                    + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * (v81
              * v82)
             + 1.0);
        v84 = v83
            - (v83
             * (v81
              * v83
              * (v74
               + v81
               * v83
               * (v75
                + v81
                * v83
                * (v76
                 + v81
                 * v83
                 * (v77
                  + v81 * v83 * (v78 + v81 * v83 * (v79 + v80 * (v81 * v83) * (v81 * v83)) * (v81 * v83)) * (v81 * v83))
                 * (v81
                  * v83))
                * (v81
                 * v83))
               * (v81
                * v83))
              * (v81
               * v83)
              + 1.0)
             + -1.0)
            / (v81
             * v83
             * (v81
              * v83
              * (v81
               * v83
               * (v81
                * v83
                * (v81
                 * v83
                 * (v81
                  * v83
                  * (v81
                   * v83
                   * (v81
                    * v83
                    * (v81
                     * v83
                     * (v81 * v83 * (v81 * v83 * (v81 * v83 * (v80 * 15.0 * (v81 * v83)) + v79 * 13.0)) + v78 * 11.0))
                    + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * (v81
              * v83)
             + 1.0);
        v85 = v84
            - (v84
             * (v81
              * v84
              * (v74
               + v81
               * v84
               * (v75
                + v81
                * v84
                * (v76
                 + v81
                 * v84
                 * (v77
                  + v81 * v84 * (v78 + v81 * v84 * (v79 + v80 * (v81 * v84) * (v81 * v84)) * (v81 * v84)) * (v81 * v84))
                 * (v81
                  * v84))
                * (v81
                 * v84))
               * (v81
                * v84))
              * (v81
               * v84)
              + 1.0)
             + -1.0)
            / (v81
             * v84
             * (v81
              * v84
              * (v81
               * v84
               * (v81
                * v84
                * (v81
                 * v84
                 * (v81
                  * v84
                  * (v81
                   * v84
                   * (v81
                    * v84
                    * (v81
                     * v84
                     * (v81 * v84 * (v81 * v84 * (v81 * v84 * (v80 * 15.0 * (v81 * v84)) + v79 * 13.0)) + v78 * 11.0))
                    + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * (v81
              * v84)
             + 1.0);
        v86 = v81 * v85;
        v87 = v85
            - (v85
             * (v86
              * (v74
               + v86
               * (v75 + v86 * (v76 + v86 * (v77 + v86 * (v78 + v86 * (v79 + v80 * v86 * v86) * v86) * v86) * v86) * v86)
               * v86)
              * v86
              + 1.0)
             + -1.0)
            / (v86
             * (v86
              * (v86
               * (v86
                * (v86
                 * (v86
                  * (v86
                   * (v86 * (v86 * (v86 * (v86 * (v86 * (v80 * 15.0 * v86) + v79 * 13.0)) + v78 * 11.0)) + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * v86
             + 1.0);
      }
      v29 = 0;
      sinval = v72 * v87 - v253;
      v31 = v73 * v87 - v71;
      break;
    case 0xF:
      v88 = *(double *)(a1 + 24);
      v89 = *(double *)(a1 + 32);
      v90 = a1 + 56;
      v91 = *(double *)(a1 + 8);
      v92 = tan(v91 * 0.5);
      v93 = 1.0;
      v94 = v15 - (v88 + 1.0) * (double)a2 * 0.5;
      v95 = (v94 + v94) / (double)a2;
      v96 = v16 - (v89 + 1.0) * (double)a3 * 0.5;
      v97 = (v96 + v96) / (double)a2 / (*(double *)(a1 + 16) / v91);
      v98 = sqrt(v97 * v97 + v95 * v95);
      v99 = (int)(v98 / 0.128564869);
      if (v99 >= 10)
        v99 = 10;
      v100 = v98 / 0.128564869 - (double)v99;
      v101 = (double *)(v90 + 8 * v99);
      v102 = v101[1];
      v103 = (1.0 - v100) * *v101 + 1.0 + v100 * v102;
      v104 = 1.0 - (v103 + -1.0) / ((v102 - *v101) * v98 / 0.128564869 + v103);
      v105 = v98 * v104;
      v106 = 1.0;
      v107 = 1.0;
      if (v98 * v104 >= 0.0)
      {
        if ((int)(v105 / 0.128564869) >= 10)
          v108 = 10;
        else
          v108 = (int)(v105 / 0.128564869);
        v109 = v105 / 0.128564869 - (double)v108;
        v110 = (double *)(v90 + 8 * v108);
        v111 = v110[1];
        v107 = (1.0 - v109) * *v110 + 1.0 + v109 * v111;
        v106 = v107 + v105 * (v111 - *v110) / 0.128564869;
      }
      v112 = v104 - (v104 * v107 + -1.0) / v106;
      v113 = v98 * v112;
      v114 = 1.0;
      if (v98 * v112 >= 0.0)
      {
        v115 = (int)(v113 / 0.128564869);
        if (v115 >= 10)
          v115 = 10;
        v116 = v113 / 0.128564869 - (double)v115;
        v117 = (double *)(v90 + 8 * v115);
        v118 = v117[1];
        v114 = (1.0 - v116) * *v117 + 1.0 + v116 * v118;
        v93 = v114 + v113 * (v118 - *v117) / 0.128564869;
      }
      v119 = v112 - (v112 * v114 + -1.0) / v93;
      v120 = v98 * v119;
      v121 = 1.0;
      v122 = 1.0;
      v123 = 1.0;
      if (v98 * v119 >= 0.0)
      {
        v124 = (int)(v120 / 0.128564869);
        if (v124 >= 10)
          v124 = 10;
        v125 = v120 / 0.128564869 - (double)v124;
        v126 = (double *)(v90 + 8 * v124);
        v127 = v126[1];
        v123 = (1.0 - v125) * *v126 + 1.0 + v125 * v127;
        v122 = v123 + v120 * (v127 - *v126) / 0.128564869;
      }
      v128 = v119 - (v119 * v123 + -1.0) / v122;
      v129 = v98 * v128;
      v130 = 1.0;
      if (v129 >= 0.0)
      {
        v131 = (int)(v129 / 0.128564869);
        if (v131 >= 10)
          v131 = 10;
        v132 = v129 / 0.128564869 - (double)v131;
        v133 = (double *)(v90 + 8 * v131);
        v134 = v133[1];
        v130 = (1.0 - v132) * *v133 + 1.0 + v132 * v134;
        v121 = v130 + v129 * (v134 - *v133) / 0.128564869;
      }
      v29 = 0;
      v135 = v128 - (v128 * v130 + -1.0) / v121;
      v136 = 1.0 / v92;
      cosval = 1.0;
      sinval = v95 * v135 / v136;
      v31 = v97 * v135 / v136;
      break;
    default:
      if (v8 >= 0xFFFFFFFD)
      {
        v231 = *(_DWORD *)a1 - 12;
        if (v231 >= 3)
          __assert_rtn("g_proj_bspline_cnt", "g_camera.c", 924, "0 && \"Not a spline based camera model.\"");
        v232 = dword_210BCDD20[v231];
        v233 = *(double *)(a1 + 24);
        v234 = *(double *)(a1 + 32);
        v235 = *(double *)(a1 + 8);
        v236 = 1.0 / tan(v235 * 0.5);
        v237 = v15 - (v233 + 1.0) * (double)a2 * 0.5;
        v238 = (v237 + v237) / (double)a2;
        v239 = v16 - (v234 + 1.0) * (double)a3 * 0.5;
        v240 = (v239 + v239) / (double)a2 / (*(double *)(a1 + 16) / v235);
        if (*(double *)(a1 + 56) == 0.0)
        {
          v251 = 0;
          while (v232 - 1 != v251)
          {
            v252 = *(double *)(a1 + 64 + 8 * v251++);
            if (v252 != 0.0)
            {
              if (v251 < v232)
                goto LABEL_76;
              break;
            }
          }
        }
        else
        {
LABEL_76:
          v241 = sqrt(v240 * v240 + v238 * v238);
          v258 = 0.0;
          v254 = v238;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * 0.707106781, 0.0, 0.0);
          v243 = 1.0 - (v242 + 1.0 + -1.0) / (v242 + 1.0 + v241 * v258);
          v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * v243 * 0.707106781, 0.0, 0.0);
          v245 = v243 - (v243 * (v244 + 1.0) + -1.0) / (v244 + 1.0 + v241 * v243 * v258);
          v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * v245 * 0.707106781, 0.0, 0.0);
          v247 = v245 - (v245 * (v246 + 1.0) + -1.0) / (v246 + 1.0 + v241 * v245 * v258);
          v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * v247 * 0.707106781, 0.0, 0.0);
          v249 = v241 * (v247 - (v247 * (v248 + 1.0) + -1.0) / (v248 + 1.0 + v241 * v247 * v258));
          v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v249 * 0.707106781, 0.0, 0.0);
          v238 = v254;
        }
        v29 = 0;
        cosval = 1.0;
        sinval = v238 / v236;
        v31 = v240 / v236;
      }
      else
      {
        printf("Unsupported projection type (%d)\n", *(_DWORD *)a1);
        cosval = 0.0;
        v29 = 1;
        v31 = 0.0;
        sinval = 0.0;
      }
      break;
  }
  *a4 = cosval;
  *a5 = sinval;
  *a6 = v31;
  return v29;
}

double fisheye_kannala_inv(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17)
{
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  __double2 v58;
  double v59;
  double result;

  v25 = (a4 / a16 + -0.5 - a12) * a10;
  v26 = (a5 / a17 + -0.5 - a13) * a11;
  v27 = sqrt(v26 * v26 + v25 * v25);
  v28 = v27 * v27;
  v29 = v28 * v28;
  v30 = 1.0
      - (a6 * (v27 * v27) + 1.0 + a7 * (v28 * v28) + a8 * (v28 * (v28 * v28)) + a9 * (v29 * v29) + -1.0)
      / (a6 * 3.0 * (v27 * v27) + 1.0 + a7 * 5.0 * (v28 * v28) + a8 * 7.0 * (v28 * (v28 * v28)) + a9 * 9.0 * (v29 * v29));
  v31 = v27 * v30 * (v27 * v30);
  v32 = v31 * v31;
  v33 = v30
      - (v30 * (a6 * v31 + 1.0 + a7 * (v31 * v31) + a8 * (v31 * (v31 * v31)) + a9 * (v32 * v32)) + -1.0)
      / (a6 * 3.0 * v31 + 1.0 + a7 * 5.0 * (v31 * v31) + a8 * 7.0 * (v31 * (v31 * v31)) + a9 * 9.0 * (v32 * v32));
  v34 = v27 * v33 * (v27 * v33);
  v35 = v34 * v34;
  v36 = v33
      - (v33 * (a6 * v34 + 1.0 + a7 * (v34 * v34) + a8 * (v34 * (v34 * v34)) + a9 * (v35 * v35)) + -1.0)
      / (a6 * 3.0 * v34 + 1.0 + a7 * 5.0 * (v34 * v34) + a8 * 7.0 * (v34 * (v34 * v34)) + a9 * 9.0 * (v35 * v35));
  v37 = v27 * v36 * (v27 * v36);
  v38 = v37 * v37;
  v39 = v36
      - (v36 * (a6 * v37 + 1.0 + a7 * (v37 * v37) + a8 * (v37 * (v37 * v37)) + a9 * (v38 * v38)) + -1.0)
      / (a6 * 3.0 * v37 + 1.0 + a7 * 5.0 * (v37 * v37) + a8 * 7.0 * (v37 * (v37 * v37)) + a9 * 9.0 * (v38 * v38));
  v40 = v27 * v39 * (v27 * v39);
  v41 = v40 * v40;
  v42 = v39
      - (v39 * (a6 * v40 + 1.0 + a7 * (v40 * v40) + a8 * (v40 * (v40 * v40)) + a9 * (v41 * v41)) + -1.0)
      / (a6 * 3.0 * v40 + 1.0 + a7 * 5.0 * (v40 * v40) + a8 * 7.0 * (v40 * (v40 * v40)) + a9 * 9.0 * (v41 * v41));
  v43 = v27 * v42 * (v27 * v42);
  v44 = v43 * v43;
  v45 = v42
      - (v42 * (a6 * v43 + 1.0 + a7 * (v43 * v43) + a8 * (v43 * (v43 * v43)) + a9 * (v44 * v44)) + -1.0)
      / (a6 * 3.0 * v43 + 1.0 + a7 * 5.0 * (v43 * v43) + a8 * 7.0 * (v43 * (v43 * v43)) + a9 * 9.0 * (v44 * v44));
  v46 = v27 * v45 * (v27 * v45);
  v47 = v46 * v46;
  v48 = v45
      - (v45 * (a6 * v46 + 1.0 + a7 * (v46 * v46) + a8 * (v46 * (v46 * v46)) + a9 * (v47 * v47)) + -1.0)
      / (a6 * 3.0 * v46 + 1.0 + a7 * 5.0 * (v46 * v46) + a8 * 7.0 * (v46 * (v46 * v46)) + a9 * 9.0 * (v47 * v47));
  v49 = v27 * v48 * (v27 * v48);
  v50 = v49 * v49;
  v51 = v48
      - (v48 * (a6 * v49 + 1.0 + a7 * (v49 * v49) + a8 * (v49 * (v49 * v49)) + a9 * (v50 * v50)) + -1.0)
      / (a6 * 3.0 * v49 + 1.0 + a7 * 5.0 * (v49 * v49) + a8 * 7.0 * (v49 * (v49 * v49)) + a9 * 9.0 * (v50 * v50));
  v52 = v27 * v51 * (v27 * v51);
  v53 = v52 * v52;
  v54 = v51
      - (v51 * (a6 * v52 + 1.0 + a7 * (v52 * v52) + a8 * (v52 * (v52 * v52)) + a9 * (v53 * v53)) + -1.0)
      / (a6 * 3.0 * v52 + 1.0 + a7 * 5.0 * (v52 * v52) + a8 * 7.0 * (v52 * (v52 * v52)) + a9 * 9.0 * (v53 * v53));
  v55 = v27 * v54 * (v27 * v54);
  v56 = v26 / (v27 + 1.0e-20);
  v57 = v25 / (v27 + 1.0e-20);
  v58 = __sincos_stret(v27* (v54- (v54 * (a6 * v55 + 1.0 + a7 * (v55 * v55) + a8 * (v55 * (v55 * v55)) + a9 * (v55 * v55 * (v55 * v55))) + -1.0)/ (a6 * 3.0 * v55+ 1.0+ a7 * 5.0 * (v55 * v55)+ a8 * 7.0 * (v55 * (v55 * v55))+ a9 * 9.0 * (v55 * v55 * (v55 * v55)))));
  *a2 = v57 * v58.__sinval;
  *a3 = v56 * v58.__sinval;
  *a1 = v58.__cosval;
  *a2 = *a2 / v58.__cosval - a14;
  *a3 = *a3 / *a1 - a15;
  *a1 = 1.0;
  v59 = 1.0 / sqrt(*a2 * *a2 + 1.0 + *a3 * *a3);
  *a2 = *a2 * v59;
  *a3 = *a3 * v59;
  result = *a1 * v59;
  *a1 = result;
  return result;
}

void g_improj2_to_xyz(uint64_t a1, float64x2_t *a2, double *a3)
{
  unsigned int v3;
  float64x2_t v11;
  uint64_t v12;
  int64x2_t v13;
  double v16;
  double v17;
  double v18;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double sinval;
  double v29;
  __double2 v30;
  __double2 v31;
  float64_t v32;
  float64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __double2 v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float64_t v66;
  long double v67;
  double v68;
  double v69;
  long double v70;
  double v71;
  int v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  int v87;
  unint64_t v88;
  double v89;
  double v90;
  float64_t v91;
  double v92;
  float64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  int v107;
  double v108;
  float64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  float64_t v127;
  long double v128;
  double v129;
  double v130;
  long double v131;
  double v132;
  int v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  uint64_t v148;
  int64x2_t v149;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  uint64_t v167;
  double v168;
  double v169;
  float64_t v170;
  double v171;
  float64_t v172;
  double v173;
  double v174;
  int v175;
  double v176;
  double *v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  int v184;
  double v185;
  double *v186;
  double v187;
  double v188;
  double v189;
  double v190;
  int v191;
  double v192;
  double *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  int v200;
  double v201;
  double *v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  int v208;
  double *v209;
  double v210;
  double v211;
  double v212;
  unint64_t v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double cosval;
  double v221;

  v218 = 0.0;
  v219 = 0.0;
  cosval = 0.0;
  __asm { FMOV            V1.2D, #0.5 }
  v11 = vaddq_f64(*a2, _Q1);
  switch(*(_DWORD *)a1)
  {
    case 0:
      cosval = 1.0;
      v12 = *(_QWORD *)(a1 + 168);
      v13.i64[0] = (int)v12;
      v13.i64[1] = SHIDWORD(v12);
      __asm { FMOV            V1.2D, #-0.5 }
      _Q0 = vsubq_f64(vdivq_f64(vmlaq_f64(v11, _Q1, vcvtq_f64_s64(v13)), *(float64x2_t *)(a1 + 8)), *(float64x2_t *)(a1 + 40));
      v16 = *(double *)(a1 + 72);
      v17 = *(double *)(a1 + 80);
      v18 = *(double *)(a1 + 88);
      if (v16 != 0.0 || v17 != 0.0 || v18 != 0.0)
      {
        _D5 = _Q0.f64[1];
        __asm { FMLA            D4, D5, V0.D[1] }
        v21 = sqrt(_D4);
        v22 = 1.0
            - (v21 * (v16 + (v17 + v18 * v21) * v21) * v21 + 1.0 + -1.0)
            / (v21 * (v21 * (v21 * (v18 * 5.0) + v17 * 4.0) + v16 * 3.0) * v21 + 1.0);
        v23 = v22
            - (v22 * (v21 * v22 * (v16 + (v17 + v18 * (v21 * v22)) * (v21 * v22)) * (v21 * v22) + 1.0) + -1.0)
            / (v21 * v22 * (v21 * v22 * (v18 * 5.0 * (v21 * v22) + v17 * 4.0) + v16 * 3.0) * (v21 * v22) + 1.0);
        v24 = v23
            - (v23 * (v21 * v23 * (v16 + (v17 + v18 * (v21 * v23)) * (v21 * v23)) * (v21 * v23) + 1.0) + -1.0)
            / (v21 * v23 * (v21 * v23 * (v18 * 5.0 * (v21 * v23) + v17 * 4.0) + v16 * 3.0) * (v21 * v23) + 1.0);
        v25 = v24
            - (v24 * (v21 * v24 * (v16 + (v17 + v18 * (v21 * v24)) * (v21 * v24)) * (v21 * v24) + 1.0) + -1.0)
            / (v21 * v24 * (v21 * v24 * (v18 * 5.0 * (v21 * v24) + v17 * 4.0) + v16 * 3.0) * (v21 * v24) + 1.0);
        v26 = v21 * v25;
        _Q0 = vmulq_n_f64(_Q0, v25- (v25 * (v26 * (v16 + (v17 + v18 * v26) * v26) * v26 + 1.0) + -1.0)/ (v26 * (v26 * (v18 * 5.0 * v26 + v17 * 4.0) + v16 * 3.0) * v26 + 1.0));
      }
      v27 = _Q0.f64[0] - *(double *)(a1 + 56);
      sinval = _Q0.f64[1] - *(double *)(a1 + 64);
      goto LABEL_54;
    case 1:
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_camera.c", 1979, (uint64_t)"g_improj2_to_xyz", "TODO: implement this projection type");
      abort();
    case 2:
      v29 = -(*(double *)(a1 + 48) - (v11.f64[1] / (double)*(int *)(a1 + 172) + -0.5) * *(double *)(a1 + 32));
      v30 = __sincos_stret(-(*(double *)(a1 + 40)
                           - (v11.f64[0] / (double)*(int *)(a1 + 168) + -0.5) * *(double *)(a1 + 24)));
      v31 = __sincos_stret(v29);
      sinval = v31.__sinval;
      cosval = v30.__cosval * v31.__cosval;
      v27 = v30.__sinval * v31.__cosval;
      goto LABEL_54;
    case 3:
      cosval = 1.0;
      v32 = (v11.f64[0] + (double)*(int *)(a1 + 168) * -0.5) / *(double *)(a1 + 8) - *(double *)(a1 + 40);
      v33 = (v11.f64[1] + (double)*(int *)(a1 + 172) * -0.5) / *(double *)(a1 + 16) - *(double *)(a1 + 48);
      v34 = sqrt(v32 * v32 + v33 * v33);
      v35 = *(double *)(a1 + 72);
      v36 = *(double *)(a1 + 80);
      v37 = *(double *)(a1 + 88);
      v38 = 1.0
          - (v34 * (v35 + (v36 + v37 * v34) * v34) * v34 + 1.0 + -1.0)
          / (v34 * (v34 * (v34 * (v37 * 5.0) + v36 * 4.0) + v35 * 3.0) * v34 + 1.0);
      v39 = v38
          - (v38 * (v34 * v38 * (v35 + (v36 + v37 * (v34 * v38)) * (v34 * v38)) * (v34 * v38) + 1.0) + -1.0)
          / (v34 * v38 * (v34 * v38 * (v37 * 5.0 * (v34 * v38) + v36 * 4.0) + v35 * 3.0) * (v34 * v38) + 1.0);
      v40 = v39
          - (v39 * (v34 * v39 * (v35 + (v36 + v37 * (v34 * v39)) * (v34 * v39)) * (v34 * v39) + 1.0) + -1.0)
          / (v34 * v39 * (v34 * v39 * (v37 * 5.0 * (v34 * v39) + v36 * 4.0) + v35 * 3.0) * (v34 * v39) + 1.0);
      v41 = v40
          - (v40 * (v34 * v40 * (v35 + (v36 + v37 * (v34 * v40)) * (v34 * v40)) * (v34 * v40) + 1.0) + -1.0)
          / (v34 * v40 * (v34 * v40 * (v37 * 5.0 * (v34 * v40) + v36 * 4.0) + v35 * 3.0) * (v34 * v40) + 1.0);
      v42 = v34 * v41;
      v43 = v41
          - (v41 * (v42 * (v35 + (v36 + v37 * v42) * v42) * v42 + 1.0) + -1.0)
          / (v42 * (v42 * (v37 * 5.0 * v42 + v36 * 4.0) + v35 * 3.0) * v42 + 1.0);
      v44 = v32 * v43 - *(double *)(a1 + 56);
      v45 = v33 * v43 - *(double *)(a1 + 64);
      v46 = fmin(sqrt(v44 * v44 + v45 * v45), 1.57079319);
      v47 = 0.0;
      if (v46 != 0.0)
        v47 = tan(v46) / v46;
      v27 = v44 * v47;
      sinval = v45 * v47;
      goto LABEL_54;
    case 4:
      cosval = 1.0;
      v27 = (v11.f64[0] + (double)*(int *)(a1 + 168) * -0.5) / *(double *)(a1 + 8);
      sinval = (v11.f64[1] + (double)*(int *)(a1 + 172) * -0.5) / *(double *)(a1 + 16);
      goto LABEL_54;
    case 5:
      v48 = *(double *)(a1 + 24) * (v11.f64[0] / (double)*(int *)(a1 + 168) + -0.5 - *(double *)(a1 + 40));
      v49 = *(double *)(a1 + 32) * (v11.f64[1] / (double)*(int *)(a1 + 172) + -0.5 - *(double *)(a1 + 48));
      v50 = sqrt(v48 * v48 + v49 * v49);
      v51 = v48 / (v50 + 1.0e-20);
      v52 = *(double *)(a1 + 72);
      v53 = *(double *)(a1 + 80);
      v54 = *(double *)(a1 + 88);
      v55 = 1.0
          - (v50 * (v52 + (v53 + v54 * v50) * v50) * v50 + 1.0 + -1.0)
          / (v50 * (v50 * (v54 * 5.0 * v50 + v53 * 4.0) + v52 * 3.0) * v50 + 1.0);
      v56 = v55
          - (v55 * (v50 * v55 * (v52 + (v53 + v54 * (v50 * v55)) * (v50 * v55)) * (v50 * v55) + 1.0) + -1.0)
          / (v50 * v55 * (v50 * v55 * (v54 * 5.0 * (v50 * v55) + v53 * 4.0) + v52 * 3.0) * (v50 * v55) + 1.0);
      v57 = v56
          - (v56 * (v50 * v56 * (v52 + (v53 + v54 * (v50 * v56)) * (v50 * v56)) * (v50 * v56) + 1.0) + -1.0)
          / (v50 * v56 * (v50 * v56 * (v54 * 5.0 * (v50 * v56) + v53 * 4.0) + v52 * 3.0) * (v50 * v56) + 1.0);
      v58 = v57
          - (v57 * (v50 * v57 * (v52 + (v53 + v54 * (v50 * v57)) * (v50 * v57)) * (v50 * v57) + 1.0) + -1.0)
          / (v50 * v57 * (v50 * v57 * (v54 * 5.0 * (v50 * v57) + v53 * 4.0) + v52 * 3.0) * (v50 * v57) + 1.0);
      v59 = v49 / (v50 + 1.0e-20);
      v60 = __sincos_stret(v50* (v58- (v58 * (v50 * v58 * (v52 + (v53 + v54 * (v50 * v58)) * (v50 * v58)) * (v50 * v58) + 1.0) + -1.0)/ (v50 * v58 * (v50 * v58 * (v54 * 5.0 * (v50 * v58) + v53 * 4.0) + v52 * 3.0) * (v50 * v58) + 1.0)));
      v27 = v51 * v60.__sinval;
      sinval = v59 * v60.__sinval;
      cosval = v60.__cosval;
      goto LABEL_54;
    case 6:
      v61 = *(double *)(a1 + 72);
      v62 = *(double *)(a1 + 80);
      v63 = *(double *)(a1 + 88);
      v64 = *(double *)(a1 + 40) * 0.000001;
      v65 = *(double *)(a1 + 48) * 0.000001;
      cosval = 1.0;
      v66 = v11.f64[0] / (double)*(int *)(a1 + 168) + -0.5;
      v216 = v11.f64[1];
      v67 = tan(*(double *)(a1 + 24) * 0.5);
      v68 = v67 * v66 + v67 * v66;
      v69 = v216 / (double)*(int *)(a1 + 172) + -0.5;
      v70 = tan(*(double *)(a1 + 32) * 0.5);
      v71 = v70 * v69 + v70 * v69;
      v72 = 5;
      v73 = v71;
      v74 = v68;
      do
      {
        v75 = v73 * v73;
        v76 = v74 * v74;
        v77 = v73 * v73 + v74 * v74;
        v78 = v61 * v77 + 1.0 + v62 * v77 * v77 + v77 * (v63 * v77) * v77;
        v79 = v76 * v76 + v73 * v73 * (v74 * v74 * 6.0 + v73 * v73 * 5.0);
        v80 = v76 * (v76 * v76) + v73 * v73 * (v73 * v73 * (v74 * v74 * 15.0 + v73 * v73 * 7.0) + v76 * v76 * 9.0);
        v81 = v68 - (v65 * (v77 + v74 * 2.0) + (v64 + v64) * v74 * v73 + v74 * v78);
        v82 = v71 - (v64 * (v77 + v73 * 2.0) + (v65 + v65) * v74 * v73 + v73 * v78);
        v83 = 0.0
            - (v61 * (v73 * v73 + v74 * v74 * 3.0)
             + 1.0
             + v62 * (v75 * v75 + v74 * v74 * (v73 * v73 * 6.0 + v74 * v74 * 5.0))
             + v63
             * (v75 * (v75 * v75) + v74 * v74 * (v74 * v74 * (v73 * v73 * 15.0 + v74 * v74 * 7.0) + v75 * v75 * 9.0))
             + (v65 * (v74 + 1.0) + v64 * v73) * 2.0);
        v84 = 0.0
            - (v61 * (v74 * v74 + v73 * v73 * 3.0)
             + 1.0
             + v62 * v79
             + v63 * v80
             + (v64 * (v73 + 1.0) + v65 * v74) * 2.0);
        v85 = (v65 * v73 + v64 * v74 + v73 * v74 * (v61 + (v63 * 3.0 * v77 + v62 * 2.0) * v77)) * -2.0 + 0.0;
        v86 = v83 * v84 - v85 * v85;
        v74 = v74 + (v85 * v82 - v84 * v81) / v86;
        v73 = v73 + (v85 * v81 - v82 * v83) / v86;
        --v72;
      }
      while (v72);
      v27 = v74 - *(double *)(a1 + 56);
      sinval = v73 - *(double *)(a1 + 64);
      goto LABEL_54;
    case 8:
      v107 = *(_DWORD *)(a1 + 172);
      v108 = *(double *)(a1 + 16);
      v109 = (v11.f64[0] + (double)*(int *)(a1 + 168) * -0.5) / *(double *)(a1 + 8);
      cosval = 1.0;
      v27 = v109 - *(double *)(a1 + 40);
      sinval = (v11.f64[1] + (double)v107 * -0.5) / v108 - *(double *)(a1 + 48);
      v111 = *(double *)(a1 + 80);
      v110 = *(double *)(a1 + 88);
      v112 = *(double *)(a1 + 72);
      if (v112 != 0.0 || v110 != 0.0 || v111 != 0.0 || *(double *)(a1 + 56) != 0.0 || *(double *)(a1 + 64) != 0.0)
      {
        v113 = sqrt(v27 * v27 + sinval * sinval);
        v114 = *(double *)(a1 + 56);
        v115 = *(double *)(a1 + 64);
        v116 = 1.0
             - (v113
              * (v112 + v113 * (v110 + v113 * (v111 + v113 * (v114 + v113 * v115 * v113) * v113) * v113) * v113)
              * v113
              + 1.0
              + -1.0)
             / (v113
              * (v113
               * (v113
                * (v113 * (v113 * (v113 * (v113 * (v113 * (v113 * (v115 * 11.0)) + v114 * 9.0)) + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * v113
              + 1.0);
        v117 = v116
             - (v116
              * (v113
               * v116
               * (v112
                + v113
                * v116
                * (v110
                 + v113
                 * v116
                 * (v111 + v113 * v116 * (v114 + v115 * (v113 * v116) * (v113 * v116)) * (v113 * v116))
                 * (v113
                  * v116))
                * (v113
                 * v116))
               * (v113
                * v116)
               + 1.0)
              + -1.0)
             / (v113
              * v116
              * (v113
               * v116
               * (v113
                * v116
                * (v113
                 * v116
                 * (v113
                  * v116
                  * (v113 * v116 * (v113 * v116 * (v113 * v116 * (v115 * 11.0 * (v113 * v116)) + v114 * 9.0))
                   + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * (v113
               * v116)
              + 1.0);
        v118 = v117
             - (v117
              * (v113
               * v117
               * (v112
                + v113
                * v117
                * (v110
                 + v113
                 * v117
                 * (v111 + v113 * v117 * (v114 + v115 * (v113 * v117) * (v113 * v117)) * (v113 * v117))
                 * (v113
                  * v117))
                * (v113
                 * v117))
               * (v113
                * v117)
               + 1.0)
              + -1.0)
             / (v113
              * v117
              * (v113
               * v117
               * (v113
                * v117
                * (v113
                 * v117
                 * (v113
                  * v117
                  * (v113 * v117 * (v113 * v117 * (v113 * v117 * (v115 * 11.0 * (v113 * v117)) + v114 * 9.0))
                   + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * (v113
               * v117)
              + 1.0);
        v119 = v118
             - (v118
              * (v113
               * v118
               * (v112
                + v113
                * v118
                * (v110
                 + v113
                 * v118
                 * (v111 + v113 * v118 * (v114 + v115 * (v113 * v118) * (v113 * v118)) * (v113 * v118))
                 * (v113
                  * v118))
                * (v113
                 * v118))
               * (v113
                * v118)
               + 1.0)
              + -1.0)
             / (v113
              * v118
              * (v113
               * v118
               * (v113
                * v118
                * (v113
                 * v118
                 * (v113
                  * v118
                  * (v113 * v118 * (v113 * v118 * (v113 * v118 * (v115 * 11.0 * (v113 * v118)) + v114 * 9.0))
                   + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * (v113
               * v118)
              + 1.0);
        v120 = v113 * v119;
        v121 = v119
             - (v119
              * (v120
               * (v112 + v120 * (v110 + v120 * (v111 + v120 * (v114 + v115 * v120 * v120) * v120) * v120) * v120)
               * v120
               + 1.0)
              + -1.0)
             / (v120
              * (v120
               * (v120
                * (v120 * (v120 * (v120 * (v120 * (v120 * (v115 * 11.0 * v120) + v114 * 9.0)) + v111 * 7.0)) + v110 * 5.0))
               + v112 * 3.0)
              * v120
              + 1.0);
        v27 = v27 * v121;
        sinval = sinval * v121;
      }
      goto LABEL_54;
    case 9:
      v122 = *(double *)(a1 + 72);
      v123 = *(double *)(a1 + 80);
      v124 = *(double *)(a1 + 88);
      v125 = *(double *)(a1 + 96);
      v126 = *(double *)(a1 + 104);
      cosval = 1.0;
      v127 = v11.f64[0] / (double)*(int *)(a1 + 168) - *(double *)(a1 + 40);
      v217 = v11.f64[1];
      v128 = tan(*(double *)(a1 + 24) * 0.5);
      v129 = v127 * v128 + v127 * v128;
      v130 = v217 / (double)*(int *)(a1 + 172) - *(double *)(a1 + 48);
      v131 = tan(*(double *)(a1 + 32) * 0.5);
      v132 = v130 * v131 + v130 * v131;
      v133 = 5;
      sinval = v132;
      v27 = v129;
      do
      {
        v134 = sinval * sinval;
        v135 = v27 * v27;
        v136 = sinval * sinval + v27 * v27;
        v137 = v122 * v136 + 1.0 + v124 * v136 * v136 + v136 * (v123 * v136) * v136;
        v138 = v135 * v135 + sinval * sinval * (v27 * v27 * 6.0 + sinval * sinval * 5.0);
        v139 = v135 * (v135 * v135)
             + sinval * sinval * (sinval * sinval * (v27 * v27 * 15.0 + sinval * sinval * 7.0) + v135 * v135 * 9.0);
        v140 = v129 - (v126 * (v136 + (v27 + v27) * v27) + (v125 + v125) * v27 * sinval + v27 * v137);
        v141 = v132 - (v125 * (v136 + (sinval + sinval) * sinval) + (v126 + v126) * v27 * sinval + sinval * v137);
        v142 = 0.0
             - (v122 * (sinval * sinval + v27 * v27 * 3.0)
              + 1.0
              + v124 * (v134 * v134 + v27 * v27 * (sinval * sinval * 6.0 + v27 * v27 * 5.0))
              + v123
              * (v134 * (v134 * v134)
               + v27 * v27 * (v27 * v27 * (sinval * sinval * 15.0 + v27 * v27 * 7.0) + v134 * v134 * 9.0))
              + (v126 * (v27 * 2.0 + 1.0) + v125 * sinval) * 2.0);
        v143 = 0.0
             - (v122 * (v27 * v27 + sinval * sinval * 3.0)
              + 1.0
              + v124 * v138
              + v123 * v139
              + (v125 * (sinval * 2.0 + 1.0) + v126 * v27) * 2.0);
        v144 = (v126 * sinval + v125 * v27 + sinval * v27 * (v122 + (v123 * 3.0 * v136 + v124 * 2.0) * v136)) * -2.0
             + 0.0;
        v145 = v142 * v143 - v144 * v144;
        v27 = v27 + (v144 * v141 - v143 * v140) / v145;
        sinval = sinval + (v144 * v140 - v141 * v142) / v145;
        --v133;
      }
      while (v133);
      goto LABEL_54;
    case 0xA:
      fisheye_kannala_inv(&cosval, &v219, &v218, v11.f64[0], v11.f64[1], *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 24), *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), (double)*(int *)(a1 + 168), (double)*(int *)(a1 + 172));
      sinval = v218;
      v27 = v219;
      goto LABEL_54;
    case 0xB:
      v147 = *(double *)(a1 + 56);
      v146 = *(double *)(a1 + 64);
      cosval = 1.0;
      v148 = *(_QWORD *)(a1 + 168);
      v149.i64[0] = (int)v148;
      v149.i64[1] = SHIDWORD(v148);
      __asm { FMOV            V4.2D, #-0.5 }
      _Q3 = vsubq_f64(vdivq_f64(vmlaq_f64(v11, _Q4, vcvtq_f64_s64(v149)), *(float64x2_t *)(a1 + 8)), *(float64x2_t *)(a1 + 40));
      v152 = *(double *)(a1 + 72);
      v153 = *(double *)(a1 + 80);
      v154 = *(double *)(a1 + 88);
      v155 = *(double *)(a1 + 96);
      v156 = *(double *)(a1 + 104);
      v157 = *(double *)(a1 + 112);
      v158 = *(double *)(a1 + 120);
      if (v152 + 0.0 + v153 + v154 + v155 + v156 + v157 + v158 != 0.0)
      {
        _D18 = _Q3.f64[1];
        __asm { FMLA            D17, D18, V3.D[1] }
        v161 = sqrt(_D17);
        v162 = 1.0
             - (v161
              * (v152
               + v161
               * (v153
                + v161
                * (v154 + v161 * (v155 + v161 * (v156 + v161 * (v157 + v161 * v158 * v161) * v161) * v161) * v161)
                * v161)
               * v161)
              * v161
              + 1.0
              + -1.0)
             / (v161
              * (v161
               * (v161
                * (v161
                 * (v161
                  * (v161
                   * (v161
                    * (v161 * (v161 * (v161 * (v161 * (v161 * (v161 * (v158 * 15.0)) + v157 * 13.0)) + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * v161
              + 1.0);
        v163 = v162
             - (v162
              * (v161
               * v162
               * (v152
                + v161
                * v162
                * (v153
                 + v161
                 * v162
                 * (v154
                  + v161
                  * v162
                  * (v155
                   + v161
                   * v162
                   * (v156 + v161 * v162 * (v157 + v158 * (v161 * v162) * (v161 * v162)) * (v161 * v162))
                   * (v161
                    * v162))
                  * (v161
                   * v162))
                 * (v161
                  * v162))
                * (v161
                 * v162))
               * (v161
                * v162)
               + 1.0)
              + -1.0)
             / (v161
              * v162
              * (v161
               * v162
               * (v161
                * v162
                * (v161
                 * v162
                 * (v161
                  * v162
                  * (v161
                   * v162
                   * (v161
                    * v162
                    * (v161
                     * v162
                     * (v161
                      * v162
                      * (v161 * v162 * (v161 * v162 * (v161 * v162 * (v158 * 15.0 * (v161 * v162)) + v157 * 13.0))
                       + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * (v161
               * v162)
              + 1.0);
        v164 = v163
             - (v163
              * (v161
               * v163
               * (v152
                + v161
                * v163
                * (v153
                 + v161
                 * v163
                 * (v154
                  + v161
                  * v163
                  * (v155
                   + v161
                   * v163
                   * (v156 + v161 * v163 * (v157 + v158 * (v161 * v163) * (v161 * v163)) * (v161 * v163))
                   * (v161
                    * v163))
                  * (v161
                   * v163))
                 * (v161
                  * v163))
                * (v161
                 * v163))
               * (v161
                * v163)
               + 1.0)
              + -1.0)
             / (v161
              * v163
              * (v161
               * v163
               * (v161
                * v163
                * (v161
                 * v163
                 * (v161
                  * v163
                  * (v161
                   * v163
                   * (v161
                    * v163
                    * (v161
                     * v163
                     * (v161
                      * v163
                      * (v161 * v163 * (v161 * v163 * (v161 * v163 * (v158 * 15.0 * (v161 * v163)) + v157 * 13.0))
                       + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * (v161
               * v163)
              + 1.0);
        v165 = v164
             - (v164
              * (v161
               * v164
               * (v152
                + v161
                * v164
                * (v153
                 + v161
                 * v164
                 * (v154
                  + v161
                  * v164
                  * (v155
                   + v161
                   * v164
                   * (v156 + v161 * v164 * (v157 + v158 * (v161 * v164) * (v161 * v164)) * (v161 * v164))
                   * (v161
                    * v164))
                  * (v161
                   * v164))
                 * (v161
                  * v164))
                * (v161
                 * v164))
               * (v161
                * v164)
               + 1.0)
              + -1.0)
             / (v161
              * v164
              * (v161
               * v164
               * (v161
                * v164
                * (v161
                 * v164
                 * (v161
                  * v164
                  * (v161
                   * v164
                   * (v161
                    * v164
                    * (v161
                     * v164
                     * (v161
                      * v164
                      * (v161 * v164 * (v161 * v164 * (v161 * v164 * (v158 * 15.0 * (v161 * v164)) + v157 * 13.0))
                       + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * (v161
               * v164)
              + 1.0);
        v166 = v161 * v165;
        _Q3 = vmulq_n_f64(_Q3, v165- (v165* (v166* (v152+ v166* (v153+ v166* (v154 + v166 * (v155 + v166 * (v156 + v166 * (v157 + v158 * v166 * v166) * v166) * v166) * v166)* v166)* v166)* v166+ 1.0)+ -1.0)/ (v166* (v166* (v166* (v166* (v166
                   * (v166
                    * (v166
                     * (v166 * (v166 * (v166 * (v166 * (v166 * (v158 * 15.0 * v166) + v157 * 13.0)) + v156 * 11.0))
                      + v155 * 9.0))
                    + v154 * 7.0))
                  + v153 * 5.0))
                + v152 * 3.0)
               * v166
               + 1.0));
      }
      v27 = _Q3.f64[0] - v147;
      sinval = _Q3.f64[1] - v146;
      goto LABEL_54;
    case 0xF:
      v167 = a1 + 72;
      v168 = 1.0;
      v169 = (double)*(int *)(a1 + 168);
      v170 = v11.f64[0] - (*(double *)(a1 + 40) + 1.0) * v169 * 0.5;
      v171 = (v170 + v170) / v169;
      v172 = v11.f64[1] - (*(double *)(a1 + 48) + 1.0) * (double)*(int *)(a1 + 172) * 0.5;
      v173 = (v172 + v172) / v169 / *(double *)(a1 + 16);
      v174 = sqrt(v173 * v173 + v171 * v171);
      v175 = (int)(v174 / 0.128564869);
      if (v175 >= 10)
        v175 = 10;
      v176 = v174 / 0.128564869 - (double)v175;
      v177 = (double *)(v167 + 8 * v175);
      v178 = v177[1];
      v179 = (1.0 - v176) * *v177 + 1.0 + v176 * v178;
      v180 = 1.0 - (v179 + -1.0) / ((v178 - *v177) * v174 / 0.128564869 + v179);
      v181 = v174 * v180;
      v182 = 1.0;
      v183 = 1.0;
      if (v174 * v180 >= 0.0)
      {
        if ((int)(v181 / 0.128564869) >= 10)
          v184 = 10;
        else
          v184 = (int)(v181 / 0.128564869);
        v185 = v181 / 0.128564869 - (double)v184;
        v186 = (double *)(v167 + 8 * v184);
        v187 = v186[1];
        v183 = (1.0 - v185) * *v186 + 1.0 + v185 * v187;
        v182 = v183 + v181 * (v187 - *v186) / 0.128564869;
      }
      v188 = v180 - (v180 * v183 + -1.0) / v182;
      v189 = v174 * v188;
      v190 = 1.0;
      if (v174 * v188 >= 0.0)
      {
        v191 = (int)(v189 / 0.128564869);
        if (v191 >= 10)
          v191 = 10;
        v192 = v189 / 0.128564869 - (double)v191;
        v193 = (double *)(v167 + 8 * v191);
        v194 = v193[1];
        v190 = (1.0 - v192) * *v193 + 1.0 + v192 * v194;
        v168 = v190 + v189 * (v194 - *v193) / 0.128564869;
      }
      v195 = v188 - (v188 * v190 + -1.0) / v168;
      v196 = v174 * v195;
      v197 = 1.0;
      v198 = 1.0;
      v199 = 1.0;
      if (v174 * v195 >= 0.0)
      {
        v200 = (int)(v196 / 0.128564869);
        if (v200 >= 10)
          v200 = 10;
        v201 = v196 / 0.128564869 - (double)v200;
        v202 = (double *)(v167 + 8 * v200);
        v203 = v202[1];
        v199 = (1.0 - v201) * *v202 + 1.0 + v201 * v203;
        v198 = v199 + v196 * (v203 - *v202) / 0.128564869;
      }
      v204 = *(double *)(a1 + 8);
      v205 = v195 - (v195 * v199 + -1.0) / v198;
      v206 = v174 * v205;
      v207 = 1.0;
      if (v206 >= 0.0)
      {
        v208 = (int)(v206 / 0.128564869);
        if (v208 >= 10)
          v208 = 10;
        v209 = (double *)(v167 + 8 * v208);
        v210 = v209[1];
        v207 = (1.0 - (v206 / 0.128564869 - (double)v208)) * *v209 + 1.0 + (v206 / 0.128564869 - (double)v208) * v210;
        v197 = v207 + v206 * (v210 - *v209) / 0.128564869;
      }
      v211 = v205 - (v205 * v207 + -1.0) / v197;
      v212 = v173 * v211;
      cosval = 1.0;
      v27 = v171 * v211 / v204;
      sinval = v212 / v204;
      goto LABEL_54;
    default:
      if (v3 < 0xFFFFFFFD)
      {
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_camera.c", 2227, (uint64_t)"g_improj2_to_xyz", "TODO: implement this projection type");
        abort();
      }
      v87 = *(_DWORD *)a1 - 12;
      if (v87 >= 3)
        __assert_rtn("g_proj_bspline_cnt", "g_camera.c", 924, "0 && \"Not a spline based camera model.\"");
      v88 = dword_210BCDD20[v87];
      v89 = *(double *)(a1 + 8);
      v90 = (double)*(int *)(a1 + 168);
      v91 = v11.f64[0] - (*(double *)(a1 + 40) + 1.0) * v90 * 0.5;
      v92 = (v91 + v91) / v90;
      v93 = v11.f64[1] - (*(double *)(a1 + 48) + 1.0) * (double)*(int *)(a1 + 172) * 0.5;
      v94 = (v93 + v93) / v90 / *(double *)(a1 + 16);
      if (*(double *)(a1 + 72) != 0.0)
        goto LABEL_19;
      v213 = 0;
      v106 = 1.0;
      break;
  }
  while (v88 - 1 != v213)
  {
    v214 = *(double *)(a1 + 80 + 8 * v213++);
    if (v214 != 0.0)
    {
      if (v213 < v88)
      {
LABEL_19:
        v95 = sqrt(v94 * v94 + v92 * v92);
        v221 = 0.0;
        v215 = v89;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * 0.707106781, 0.0, 0.0);
        v97 = 1.0 - (v96 + 1.0 + -1.0) / (v96 + 1.0 + v95 * v221);
        v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * v97 * 0.707106781, 0.0, 0.0);
        v99 = v97 - (v97 * (v98 + 1.0) + -1.0) / (v98 + 1.0 + v95 * v97 * v221);
        v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * v99 * 0.707106781, 0.0, 0.0);
        v101 = v99 - (v99 * (v100 + 1.0) + -1.0) / (v100 + 1.0 + v95 * v99 * v221);
        v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * v101 * 0.707106781, 0.0, 0.0);
        v103 = v101 - (v101 * (v102 + 1.0) + -1.0) / (v102 + 1.0 + v95 * v101 * v221);
        v104 = v95 * v103;
        v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v104 * 0.707106781, 0.0, 0.0);
        v89 = v215;
        v106 = v103 - (v103 * (v105 + 1.0) + -1.0) / (v105 + 1.0 + v104 * v221);
      }
      break;
    }
  }
  cosval = 1.0;
  v27 = v92 * v106 / v89;
  sinval = v94 * v106 / v89;
LABEL_54:
  *a3 = cosval;
  a3[1] = v27;
  a3[2] = sinval;
}

uint64_t g_xyz_to_improj2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, double *a4@<X3>, unsigned int a5@<W8>)
{
  int v8;
  double v9;
  double v10;
  uint64_t result;
  double v13;
  double v14;
  double v15;
  double v22;
  long double v23;
  double v24;
  double v25;
  long double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  long double v31;
  long double v32;
  double v33;
  long double v34;
  long double v35;
  float64x2_t v36;
  const double *v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v41;
  int64x2_t v42;
  double v44;
  double v48;
  double v49;
  long double v50;
  double v53;
  float64x2_t v54;
  float64x2_t v55;
  long double v59;
  double v60;
  double v61;
  double v62;
  float64x2_t v64;
  int64x2_t v65;
  float64x2_t v67;
  uint64_t v72;
  int64x2_t v73;
  double v77;
  double v78;
  double v79;
  double v82;
  double v83;
  double v84;
  double v85;
  float64x2_t v86;
  float64x2_t v87;
  uint64_t v88;
  int64x2_t v89;
  float64x2_t v90;
  uint64_t v95;
  int64x2_t v96;
  float64x2_t v97;
  double v99;
  double v100;
  double v101;
  double v102;
  uint64_t v103;
  int64x2_t v104;
  float64x2_t v105;
  long double v106;
  long double v107;
  long double v108;
  double v109;
  float64x2_t v112;
  double v115;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v128;
  uint64_t v129;
  int64x2_t v130;
  float64x2_t v132;
  double v134;
  double v135;
  unsigned int v136;
  _BOOL4 v137;
  _BOOL4 v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  double v143;
  long double v144;
  double v145;
  float64x2_t v146;
  float64x2_t v147;
  double v148;

  v8 = *(_DWORD *)a1;
  switch(*(_DWORD *)a1)
  {
    case 0:
      v9 = 1.0;
      v10 = 1.0 / *(double *)a2;
      result = *(double *)a2 < 0.0;
      _Q0 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10), *(float64x2_t *)(a1 + 56));
      v13 = *(double *)(a1 + 72);
      v14 = *(double *)(a1 + 80);
      v15 = *(double *)(a1 + 88);
      if (v13 != 0.0 || v14 != 0.0 || v15 != 0.0)
      {
        _D5 = _Q0.f64[1];
        __asm { FMLA            D1, D5, V0.D[1] }
        v22 = sqrt(_D1);
        v9 = v22 * (v13 + (v14 + v15 * v22) * v22) * v22 + 1.0;
        if (v22 * (v22 * (v22 * (v15 * 5.0) + v14 * 4.0) + v13 * 3.0) * v22 + 1.0 < 0.0)
          result = 1;
      }
      goto LABEL_16;
    case 1:
      v23 = *(double *)(a2 + 8);
      v24 = sqrt(v23 * v23 + *(double *)a2 * *(double *)a2);
      v25 = *(double *)(a2 + 16) / v24;
      v26 = atan2(v23, *(long double *)a2);
      v27 = *(double *)(a1 + 48);
      v28 = *(double *)(a1 + 32);
      *a3 = ((v26
            + *(double *)(a1 + 40)
            + 3.14159265
            + (double)((int)((v26 + *(double *)(a1 + 40) + 3.14159265) * 0.159154943)
                     - (v26 + *(double *)(a1 + 40) + 3.14159265 < 0.0))
            * -6.28318531
            + -3.14159265)
           / *(double *)(a1 + 24)
           + 0.5)
          * (double)*(int *)(a1 + 168)
          + -0.5;
      v29 = (v25 + v27) * 0.5;
      v30 = tan(v28 * 0.5);
      result = 0;
      a3[1] = (v29 / v30 + 0.5) * (double)*(int *)(a1 + 172) + -0.5;
      v10 = 1.0 / v24;
      if (!a4)
        return result;
      goto LABEL_25;
    case 2:
      v31 = *(double *)(a2 + 8);
      v32 = *(double *)(a2 + 16);
      v33 = v31 * v31 + *(double *)a2 * *(double *)a2;
      v34 = atan2(v31, *(long double *)a2) + *(double *)(a1 + 40) + 3.14159265;
      v144 = v34 + (double)((int)(v34 * 0.159154943) - (v34 < 0.0)) * -6.28318531;
      v35 = atan2(v32, sqrt(v33));
      result = 0;
      v36.f64[0] = v144;
      v36.f64[1] = v35;
      v37 = (const double *)&qword_210BCABF8;
      *(_QWORD *)&v38.f64[0] = *(_OWORD *)&vld1q_dup_f64(v37);
      v38.f64[1] = *(float64_t *)(a1 + 48);
      v39 = vdivq_f64(vaddq_f64(v36, v38), *(float64x2_t *)(a1 + 24));
      __asm { FMOV            V1.2D, #0.5 }
      v41 = vaddq_f64(v39, _Q1);
      _Q1.f64[0] = *(float64_t *)(a1 + 168);
      v42.i64[0] = SLODWORD(_Q1.f64[0]);
      v42.i64[1] = SHIDWORD(_Q1.f64[0]);
      __asm { FMOV            V2.2D, #-0.5 }
      *(float64x2_t *)a3 = vmlaq_f64(_Q2, vcvtq_f64_s64(v42), v41);
      v10 = 1.0 / sqrt(v33 + v32 * v32);
      if (!a4)
        return result;
      goto LABEL_25;
    case 3:
      v44 = *(double *)a2;
      v10 = 1.0 / *(double *)a2;
      _Q2 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      _D1 = _Q2.f64[1];
      __asm { FMLA            D0, D1, V2.D[1] }
      v48 = sqrt(_D0);
      v49 = 1.0;
      if (v48 != 0.0)
      {
        v142 = _Q2;
        v145 = 1.0 / *(double *)a2;
        v50 = atan(v48);
        _Q2 = v142;
        v10 = v145;
        v49 = v50 / v48;
      }
      _Q0 = vaddq_f64(vmulq_n_f64(_Q2, v49), *(float64x2_t *)(a1 + 56));
      _D5 = _Q0.f64[1];
      __asm { FMLA            D4, D5, V0.D[1] }
      v53 = sqrt(_D4);
      v9 = v53 * (*(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(a1 + 88) * v53) * v53) * v53 + 1.0;
      result = v53 > 20.0 || v44 < 0.0;
LABEL_16:
      v54 = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), _Q0, v9);
      goto LABEL_24;
    case 4:
      v10 = 1.0 / *(double *)a2;
      result = *(double *)a2 < 0.0;
      v55 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      goto LABEL_47;
    case 5:
      _Q1 = *(float64x2_t *)(a2 + 8);
      v143 = vmulq_f64(_Q1, _Q1).f64[0];
      _D9 = *(double *)(a2 + 16);
      __asm { FMLA            D0, D9, V1.D[1] }
      v59 = sqrt(_D0);
      v146 = vdivq_f64(_Q1, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v59 + 1.0e-20), 0));
      v60 = *(double *)a2;
      v61 = atan2(v59, *(long double *)a2);
      v62 = sqrt(v143 + v60 * v60 + _D9 * _D9);
      if (a4)
        v10 = 1.0 / v62;
      else
        v10 = 0.0;
      result = v61 > 1.57079633;
      __asm { FMOV            V1.2D, #0.5 }
      v64 = vaddq_f64(*(float64x2_t *)(a1 + 40), vaddq_f64(vdivq_f64(vmulq_n_f64(v146, v61* (v61 * (*(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(a1 + 88) * v61) * v61) * v61 + 1.0)), *(float64x2_t *)(a1 + 24)), _Q1));
      _Q1.f64[0] = *(float64_t *)(a1 + 168);
      v65.i64[0] = SLODWORD(_Q1.f64[0]);
      v65.i64[1] = SHIDWORD(_Q1.f64[0]);
      __asm { FMOV            V2.2D, #-0.5 }
      *(float64x2_t *)a3 = vmlaq_f64(_Q2, vcvtq_f64_s64(v65), v64);
      if (!a4)
        return result;
      goto LABEL_25;
    case 6:
      result = *(double *)a2 < 0.0;
      v10 = 1.0 / *(double *)a2;
      v67 = vmulq_f64(*(float64x2_t *)(a1 + 40), (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL));
      _Q5 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10), *(float64x2_t *)(a1 + 56));
      _D7 = _Q5.f64[1];
      __asm
      {
        FMLA            D6, D7, V5.D[1]
        FMOV            V2.2D, #2.0
      }
      v54 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v67, (int8x16_t)v67, 8uLL), vmlaq_f64((float64x2_t)vdupq_lane_s64(_D6, 0), _Q2, _Q5)), vmulq_n_f64(vaddq_f64(v67, v67), _Q5.f64[0]), _Q5, 1), _Q5, (*(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(a1 + 88) * *(double *)&_D6) * *(double *)&_D6)* *(double *)&_D6+ 1.0);
LABEL_24:
      v72 = *(_QWORD *)(a1 + 168);
      v73.i64[0] = (int)v72;
      v73.i64[1] = SHIDWORD(v72);
      __asm
      {
        FMOV            V3.2D, #0.5
        FMOV            V0.2D, #-0.5
      }
      *(float64x2_t *)a3 = vaddq_f64(vmlaq_f64(vmulq_f64(vcvtq_f64_s64(v73), _Q3), *(float64x2_t *)(a1 + 8), v54), _Q0);
      if (a4)
        goto LABEL_25;
      return result;
    case 8:
      v10 = 1.0 / *(double *)a2;
      _Q0 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      result = *(double *)a2 < 0.0;
      v78 = *(double *)(a1 + 80);
      v77 = *(double *)(a1 + 88);
      v79 = *(double *)(a1 + 72);
      if (v79 == 0.0 && v77 == 0.0 && v78 == 0.0 && *(double *)(a1 + 56) == 0.0 && *(double *)(a1 + 64) == 0.0)
      {
        v85 = 1.0;
      }
      else
      {
        _D6 = _Q0.f64[1];
        __asm { FMLA            D5, D6, V0.D[1] }
        v82 = sqrt(_D5);
        v83 = *(double *)(a1 + 56);
        v84 = *(double *)(a1 + 64);
        v85 = v82 * (v79 + v82 * (v77 + v82 * (v78 + v82 * (v83 + v82 * v84 * v82) * v82) * v82) * v82) * v82 + 1.0;
        if (v82
           * (v82
            * (v82
             * (v82 * (v82 * (v82 * (v82 * (v82 * (v82 * (v84 * 11.0)) + v83 * 9.0)) + v78 * 7.0)) + v77 * 5.0))
            + v79 * 3.0)
           * v82
           + 1.0 < 0.0)
          result = 1;
      }
      v86 = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), _Q0, v85);
      v87 = *(float64x2_t *)(a1 + 8);
      v88 = *(_QWORD *)(a1 + 168);
      v89.i64[0] = (int)v88;
      v89.i64[1] = SHIDWORD(v88);
      v90 = vcvtq_f64_s64(v89);
      __asm { FMOV            V3.2D, #0.5 }
      goto LABEL_36;
    case 9:
      result = *(double *)a2 < 0.0;
      v10 = 1.0 / *(double *)a2;
      _Q4 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      _D6 = _Q4.f64[1];
      __asm { FMLA            D5, D6, V4.D[1] }
      v86 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_f64(vmlaq_f64((float64x2_t)vdupq_lane_s64(_D5, 0), _Q4, vaddq_f64(_Q4, _Q4)), (float64x2_t)vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL)), vmulq_n_f64(vaddq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a1 + 96)), _Q4.f64[0]), _Q4, 1), _Q4, (*(double *)(a1 + 72) + (*(double *)(a1 + 88) + *(double *)(a1 + 80) * *(double *)&_D5) * *(double *)&_D5)* *(double *)&_D5+ 1.0);
      v87 = *(float64x2_t *)(a1 + 8);
      v90 = *(float64x2_t *)(a1 + 40);
      v95 = *(_QWORD *)(a1 + 168);
      v96.i64[0] = (int)v95;
      v96.i64[1] = SHIDWORD(v95);
      _Q3 = vcvtq_f64_s64(v96);
LABEL_36:
      v97 = vmlaq_f64(vmulq_f64(v90, _Q3), v87, v86);
      __asm { FMOV            V0.2D, #-0.5 }
      *(float64x2_t *)a3 = vaddq_f64(v97, _Q0);
      if (!a4)
        return result;
      goto LABEL_25;
    case 0xA:
      v99 = *(double *)(a1 + 72);
      v100 = *(double *)(a1 + 80);
      v101 = *(double *)(a1 + 88);
      v102 = *(double *)(a1 + 96);
      v147 = *(float64x2_t *)(a1 + 40);
      v140 = *(float64x2_t *)(a2 + 8);
      v141 = *(float64x2_t *)(a1 + 24);
      v103 = *(_QWORD *)(a1 + 168);
      v104.i64[0] = (int)v103;
      v104.i64[1] = SHIDWORD(v103);
      v105 = vaddq_f64(*(float64x2_t *)(a1 + 56), vdivq_f64(v140, (float64x2_t)vdupq_lane_s64(*(_QWORD *)a2, 0)));
      v106 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v105, v105).f64[1]), v105.f64[0], v105.f64[0]));
      v139 = vdivq_f64(v105, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v106 + 1.0e-20), 0));
      v107 = atan(v106);
      v108 = v107 * v107;
      v109 = v107
           * (v99 * (v107 * v107)
            + 1.0
            + v100 * (v108 * v108)
            + v101 * (v108 * (v108 * v108))
            + v102 * (v108 * v108 * (v108 * v108)));
      _V6.D[1] = v140.f64[1];
      __asm { FMOV            V2.2D, #0.5 }
      v112 = vmulq_f64(vaddq_f64(v147, vaddq_f64(vdivq_f64(vmulq_n_f64(v139, v109), v141), _Q2)), vcvtq_f64_s64(v104));
      _D4 = v140.f64[1];
      __asm { FMLA            D3, D4, V6.D[1] }
      v115 = 1.0 / sqrt(_D3);
      if (a4)
        v10 = v115;
      else
        v10 = 0.0;
      result = v109 > 1.57079633;
      __asm { FMOV            V0.2D, #-0.5 }
      *(float64x2_t *)a3 = vaddq_f64(v112, _Q0);
      if (!a4)
        return result;
      goto LABEL_25;
    case 0xB:
      v117 = 1.0;
      v10 = 1.0 / *(double *)a2;
      v118 = *(double *)(a1 + 72);
      v119 = *(double *)(a1 + 80);
      v120 = *(double *)(a1 + 88);
      v121 = *(double *)(a1 + 96);
      v122 = *(double *)(a1 + 104);
      v123 = *(double *)(a1 + 112);
      v124 = *(double *)(a1 + 120);
      result = *(double *)a2 < 0.0;
      _Q2 = vaddq_f64(*(float64x2_t *)(a1 + 56), vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10));
      if (v118 + 0.0 + v119 + v120 + v121 + v122 + v123 + v124 != 0.0)
      {
        _D18 = _Q2.f64[1];
        __asm { FMLA            D1, D18, V2.D[1] }
        v128 = sqrt(_D1);
        v117 = v128
             * (v118
              + v128
              * (v119
               + v128
               * (v120 + v128 * (v121 + v128 * (v122 + v128 * (v123 + v128 * v124 * v128) * v128) * v128) * v128)
               * v128)
              * v128)
             * v128
             + 1.0;
        if (v128
           * (v128
            * (v128
             * (v128
              * (v128
               * (v128
                * (v128
                 * (v128 * (v128 * (v128 * (v128 * (v128 * (v128 * (v124 * 15.0)) + v123 * 13.0)) + v122 * 11.0))
                  + v121 * 9.0))
                + v120 * 7.0))
              + v119 * 5.0))
            + v118 * 3.0)
           * v128
           + 1.0 < 0.0)
          result = 1;
      }
      v55 = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), _Q2, v117);
LABEL_47:
      v129 = *(_QWORD *)(a1 + 168);
      v130.i64[0] = (int)v129;
      v130.i64[1] = SHIDWORD(v129);
      __asm { FMOV            V3.2D, #0.5 }
      v132 = vmlaq_f64(vmulq_f64(vcvtq_f64_s64(v130), _Q3), *(float64x2_t *)(a1 + 8), v55);
      __asm { FMOV            V0.2D, #-0.5 }
      *(float64x2_t *)a3 = vaddq_f64(v132, _Q0);
      if (!a4)
        return result;
      goto LABEL_25;
    case 0xF:
      v134 = *(double *)(a1 + 8);
      v135 = *(double *)(a1 + 16);
      goto LABEL_55;
    default:
      if (a5 < 0xFFFFFFFD)
        __assert_rtn("g_xyz_to_improj2", "g_camera.c", 6236, "0 && \"Not implemented!\"");
      v134 = *(double *)(a1 + 8);
      v135 = *(double *)(a1 + 16);
      switch(v8)
      {
        case 12:
          v136 = 7;
          break;
        case 14:
LABEL_55:
          v136 = 12;
          break;
        case 13:
          v136 = 10;
          break;
        default:
          __assert_rtn("g_proj_bspline_cnt", "g_camera.c", 924, "0 && \"Not a spline based camera model.\"");
      }
      v137 = *(double *)a2 < 0.0;
      v148 = 1.0 / *(double *)a2;
      v138 = g_pinhole_to_pixel_jac(a3, a3 + 1, v8, (double *)(a1 + 72), v136, *(_DWORD *)(a1 + 168), *(_DWORD *)(a1 + 172), 0, *(double *)(a2 + 8) * v148, v148 * *(double *)(a2 + 16), v134, v135, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0, 0, 0,
               0,
               0);
      v10 = v148;
      if (v138)
        result = v137 | 2u;
      else
        result = v137;
      if (a4)
LABEL_25:
        *a4 = v10;
      return result;
  }
}

double g_coords_conv(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double result;

  v3 = a2[1];
  v4 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a2[2];
  v10 = a2[3];
  v11 = *a2 * *a1 + 0.0 + v3 * v5 + v9 * v7;
  v12 = a1[4];
  v13 = a1[5];
  v14 = *a2 * v4 + 0.0 + v3 * v12 + v9 * v8;
  v15 = a1[8];
  v16 = a1[9];
  v17 = *a2 * v6 + 0.0 + v3 * v13 + v9 * v15;
  v18 = a2[4];
  v19 = a2[5];
  v20 = v10 * *a1 + 0.0 + v18 * v5 + v19 * v7;
  v21 = a2[6];
  v22 = a2[7];
  v23 = v21 * *a1 + 0.0 + v22 * v5;
  v24 = a2[8];
  v25 = v23 + v24 * v7;
  v26 = v10 * v4 + 0.0 + v18 * v12 + v19 * v8;
  v27 = v21 * v4 + 0.0 + v22 * v12;
  v28 = v10 * v6 + 0.0 + v18 * v13 + v19 * v15;
  v29 = v27 + v24 * v8;
  v30 = v21 * v6 + 0.0 + v22 * v13;
  v31 = a1[10];
  v32 = a1[11];
  a3[9] = *a2 * v16 + 0.0 + v3 * v31 + v9 * v32 + a2[9];
  a3[10] = v10 * v16 + 0.0 + v18 * v31 + v19 * v32 + a2[10];
  a3[11] = v21 * v16 + 0.0 + v22 * v31 + v24 * v32 + a2[11];
  *a3 = v11;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v20;
  a3[4] = v26;
  a3[5] = v28;
  result = v30 + v24 * v15;
  a3[6] = v25;
  a3[7] = v29;
  a3[8] = result;
  return result;
}

double g_coords_diff(double *a1, double *a2, uint64_t a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double result;

  v3 = a1[1];
  v4 = a2[1];
  v6 = a1[2];
  v5 = a1[3];
  v8 = a2[2];
  v7 = a2[3];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a2[6];
  v12 = a2[7];
  v13 = *a2 * *a1 + 0.0 + v7 * v5 + v11 * v9;
  v14 = a1[4];
  v15 = a1[5];
  v16 = *a2 * v3 + 0.0 + v7 * v14 + v11 * v10;
  v17 = *a2 * v6 + 0.0 + v7 * v15;
  v18 = a1[8];
  v19 = a1[9];
  v20 = v17 + v11 * v18;
  v21 = a2[4];
  v22 = a2[5];
  v23 = v4 * *a1 + 0.0 + v21 * v5;
  v24 = v4 * v3 + 0.0 + v21 * v14;
  v25 = v4 * v6 + 0.0 + v21 * v15;
  v26 = v23 + v12 * v9;
  v27 = v24 + v12 * v10;
  v28 = v25 + v12 * v18;
  v29 = v8 * *a1 + 0.0 + v22 * v5;
  v30 = a2[8];
  v31 = a2[9];
  v32 = v29 + v30 * v9;
  v33 = v8 * v3 + 0.0 + v22 * v14 + v30 * v10;
  v34 = v8 * v6 + 0.0 + v22 * v15 + v30 * v18;
  v35 = a1[10] - a2[10];
  v36 = a1[11] - a2[11];
  *(_QWORD *)(a3 + 72) = 0;
  v37 = *a2 * (v19 - v31) + 0.0;
  *(double *)(a3 + 72) = v37;
  v38 = v37 + a2[3] * v35;
  *(double *)(a3 + 72) = v38;
  *(double *)(a3 + 72) = v38 + a2[6] * v36;
  *(_QWORD *)(a3 + 80) = 0;
  v39 = a2[1] * (v19 - v31) + 0.0;
  *(double *)(a3 + 80) = v39;
  v40 = v39 + a2[4] * v35;
  *(double *)(a3 + 80) = v40;
  *(double *)(a3 + 80) = v40 + a2[7] * v36;
  *(_QWORD *)(a3 + 88) = 0;
  v41 = a2[2] * (v19 - v31) + 0.0;
  *(double *)(a3 + 88) = v41;
  v42 = v41 + a2[5] * v35;
  *(double *)(a3 + 88) = v42;
  result = v42 + a2[8] * v36;
  *(double *)(a3 + 88) = result;
  *(double *)a3 = v13;
  *(double *)(a3 + 8) = v16;
  *(double *)(a3 + 16) = v20;
  *(double *)(a3 + 24) = v26;
  *(double *)(a3 + 32) = v27;
  *(double *)(a3 + 40) = v28;
  *(double *)(a3 + 48) = v32;
  *(double *)(a3 + 56) = v33;
  *(double *)(a3 + 64) = v34;
  return result;
}

double g_camera_global_to_local(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double result;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v7 = a1[4];
  v6 = a1[5];
  v9 = a1[6];
  v8 = a1[7];
  v10 = a1[8];
  v11 = a1[9];
  v12 = a1[10];
  v13 = a1[11];
  v14 = *a1 * v11 + 0.0 + v5 * v12 + v9 * v13;
  v15 = v3 * v11 + 0.0 + v7 * v12 + v8 * v13;
  v16 = v4 * v11 + 0.0 + v6 * v12 + v10 * v13;
  v17 = a2[1];
  v19 = a2[2];
  v18 = a2[3];
  v20 = a2[6];
  v21 = a2[7];
  v22 = *a1 * *a2 + 0.0 + v5 * v18 + v9 * v20;
  v23 = a2[4];
  v24 = a2[5];
  v25 = *a1 * v17 + 0.0 + v5 * v23 + v9 * v21;
  v26 = a2[8];
  v27 = a2[9];
  v28 = *a1 * v19 + 0.0 + v5 * v24 + v9 * v26;
  v29 = v3 * *a2 + 0.0 + v7 * v18 + v8 * v20;
  v30 = v3 * v17 + 0.0 + v7 * v23 + v8 * v21;
  v31 = v4 * *a2 + 0.0 + v6 * v18 + v10 * v20;
  v32 = v4 * v17 + 0.0 + v6 * v23 + v10 * v21;
  v33 = a2[10];
  v34 = a2[11];
  v35 = *a1 * v27 + 0.0 + v5 * v33 + v9 * v34;
  a3[10] = v3 * v27 + 0.0 + v7 * v33 + v8 * v34 - v15;
  a3[11] = v4 * v27 + 0.0 + v6 * v33 + v10 * v34 - v16;
  *a3 = v22;
  a3[1] = v25;
  a3[2] = v28;
  a3[3] = v29;
  a3[4] = v30;
  a3[5] = v3 * v19 + 0.0 + v7 * v24 + v8 * v26;
  a3[6] = v31;
  a3[7] = v32;
  result = v35 - v14;
  a3[8] = v4 * v19 + 0.0 + v6 * v24 + v10 * v26;
  a3[9] = v35 - v14;
  return result;
}

double g_camera_local_to_global(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double result;

  v3 = a1[1];
  v4 = a2[1];
  v6 = a2[2];
  v5 = a2[3];
  v7 = a2[6];
  v8 = a2[7];
  v9 = a1[2];
  v10 = a1[3];
  v11 = *a1 * *a2 + 0.0 + v3 * v5 + v9 * v7;
  v12 = a2[4];
  v13 = a2[5];
  v14 = *a1 * v4 + 0.0 + v3 * v12 + v9 * v8;
  v15 = a2[8];
  v16 = a2[9];
  v17 = *a1 * v6 + 0.0 + v3 * v13 + v9 * v15;
  v18 = a1[4];
  v19 = a1[5];
  v20 = v10 * *a2 + 0.0 + v18 * v5 + v19 * v7;
  v21 = a1[6];
  v22 = a1[7];
  v23 = v21 * *a2 + 0.0 + v22 * v5;
  v24 = a1[8];
  v25 = v23 + v24 * v7;
  v26 = v10 * v4 + 0.0 + v18 * v12 + v19 * v8;
  v27 = v21 * v4 + 0.0 + v22 * v12;
  v28 = v10 * v6 + 0.0 + v18 * v13 + v19 * v15;
  v29 = v27 + v24 * v8;
  v30 = v21 * v6 + 0.0 + v22 * v13;
  v31 = a2[10];
  v32 = a2[11];
  a3[9] = *a1 * v16 + 0.0 + v3 * v31 + v9 * v32 + a1[9];
  a3[10] = v10 * v16 + 0.0 + v18 * v31 + v19 * v32 + a1[10];
  a3[11] = v21 * v16 + 0.0 + v22 * v31 + v24 * v32 + a1[11];
  *a3 = v11;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v20;
  a3[4] = v26;
  a3[5] = v28;
  result = v30 + v24 * v15;
  a3[6] = v25;
  a3[7] = v29;
  a3[8] = result;
  return result;
}

float g_coordsf_conv(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float result;

  v3 = a2[1];
  v4 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a2[2];
  v10 = a2[3];
  v11 = (float)((float)((float)(*a2 * *a1) + 0.0) + (float)(v3 * v5)) + (float)(v9 * v7);
  v12 = a1[4];
  v13 = a1[5];
  v14 = (float)((float)((float)(*a2 * v4) + 0.0) + (float)(v3 * v12)) + (float)(v9 * v8);
  v15 = a1[8];
  v16 = a1[9];
  v17 = (float)((float)((float)(*a2 * v6) + 0.0) + (float)(v3 * v13)) + (float)(v9 * v15);
  v18 = a2[4];
  v19 = a2[5];
  v20 = (float)((float)((float)(v10 * *a1) + 0.0) + (float)(v18 * v5)) + (float)(v19 * v7);
  v21 = a2[6];
  v22 = a2[7];
  v23 = (float)((float)(v21 * *a1) + 0.0) + (float)(v22 * v5);
  v24 = a2[8];
  v25 = v23 + (float)(v24 * v7);
  v26 = (float)((float)((float)(v10 * v4) + 0.0) + (float)(v18 * v12)) + (float)(v19 * v8);
  v27 = (float)((float)(v21 * v4) + 0.0) + (float)(v22 * v12);
  v28 = (float)((float)((float)(v10 * v6) + 0.0) + (float)(v18 * v13)) + (float)(v19 * v15);
  v29 = v27 + (float)(v24 * v8);
  v30 = (float)((float)(v21 * v6) + 0.0) + (float)(v22 * v13);
  v31 = a1[10];
  v32 = a1[11];
  a3[9] = (float)((float)((float)((float)(*a2 * v16) + 0.0) + (float)(v3 * v31)) + (float)(v9 * v32)) + a2[9];
  a3[10] = (float)((float)((float)((float)(v10 * v16) + 0.0) + (float)(v18 * v31)) + (float)(v19 * v32)) + a2[10];
  a3[11] = (float)((float)((float)((float)(v21 * v16) + 0.0) + (float)(v22 * v31)) + (float)(v24 * v32)) + a2[11];
  *a3 = v11;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v20;
  a3[4] = v26;
  a3[5] = v28;
  result = v30 + (float)(v24 * v15);
  a3[6] = v25;
  a3[7] = v29;
  a3[8] = result;
  return result;
}

float g_coordsf_diff(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  float v11;
  float result;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x2_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float v27;
  float v28;

  v5.i32[0] = *(_DWORD *)(a1 + 8);
  v6.i32[0] = *(_DWORD *)(a1 + 20);
  v11 = *(float *)(a2 + 8);
  result = *(float *)(a2 + 20);
  v7.i32[0] = *(_DWORD *)(a1 + 32);
  v13 = *(float *)(a2 + 32);
  v14 = (float)((float)((float)(v11 * *(float *)v5.i32) + 0.0) + (float)(result * *(float *)v6.i32))
      + (float)(v13 * *(float *)v7.i32);
  v15 = *(float *)(a1 + 36) - *(float *)(a2 + 36);
  v16 = *(float *)(a1 + 40) - *(float *)(a2 + 40);
  v17 = *(float *)(a1 + 44) - *(float *)(a2 + 44);
  v8.i64[0] = *(_QWORD *)a2;
  v9.i64[0] = *(_QWORD *)(a2 + 12);
  v10.i64[0] = *(_QWORD *)(a2 + 24);
  v18 = vdupq_lane_s32(*(int32x2_t *)v10.i8, 1);
  v19 = (float32x4_t)vzip1q_s32(v10, v18);
  v4.i64[0] = *(_QWORD *)a1;
  v3.i64[0] = *(_QWORD *)(a1 + 12);
  v18.i64[0] = *(_QWORD *)(a1 + 24);
  v20 = vmla_n_f32(vmla_n_f32(vmla_n_f32(0, *(float32x2_t *)a1, COERCE_FLOAT(*(_QWORD *)a2)), *(float32x2_t *)v3.i8, *(float *)v9.i32), *(float32x2_t *)v18.i8, *(float *)v10.i32);
  v21 = (float32x4_t)vextq_s8(vextq_s8(v5, v5, 4uLL), v4, 0xCuLL);
  v21.i32[3] = v21.i32[0];
  v22 = vmlaq_f32((float32x4_t)0, v21, (float32x4_t)vzip1q_s32(v8, vdupq_lane_s32(*(int32x2_t *)a2, 1)));
  v23 = (float32x4_t)vextq_s8(vextq_s8(v6, v6, 4uLL), v3, 0xCuLL);
  v23.i32[3] = v23.i32[0];
  v24 = vmlaq_f32(v22, v23, (float32x4_t)vzip1q_s32(v9, vdupq_lane_s32(*(int32x2_t *)v9.i8, 1)));
  v25 = (float32x4_t)vextq_s8(vextq_s8(v7, v7, 4uLL), (int8x16_t)v18, 0xCuLL);
  v25.i32[3] = v25.i32[0];
  v26 = vmlaq_f32(v24, v25, v19);
  *(_DWORD *)(a3 + 36) = 0;
  v25.f32[0] = (float)(*(float *)a2 * v15) + 0.0;
  *(_DWORD *)(a3 + 36) = v25.i32[0];
  v25.f32[0] = v25.f32[0] + (float)(*(float *)(a2 + 12) * v16);
  *(_DWORD *)(a3 + 36) = v25.i32[0];
  *(float *)(a3 + 36) = v25.f32[0] + (float)(*(float *)(a2 + 24) * v17);
  *(_DWORD *)(a3 + 40) = 0;
  v25.f32[0] = (float)(*(float *)(a2 + 4) * v15) + 0.0;
  *(_DWORD *)(a3 + 40) = v25.i32[0];
  v25.f32[0] = v25.f32[0] + (float)(*(float *)(a2 + 16) * v16);
  *(_DWORD *)(a3 + 40) = v25.i32[0];
  *(float *)(a3 + 40) = v25.f32[0] + (float)(*(float *)(a2 + 28) * v17);
  *(_DWORD *)(a3 + 44) = 0;
  v27 = (float)(*(float *)(a2 + 8) * v15) + 0.0;
  *(float *)(a3 + 44) = v27;
  v28 = v27 + (float)(*(float *)(a2 + 20) * v16);
  *(float *)(a3 + 44) = v28;
  *(float *)(a3 + 44) = v28 + (float)(*(float *)(a2 + 32) * v17);
  *(float32x2_t *)a3 = v20;
  *(float32x4_t *)(a3 + 8) = v26;
  *(float32x2_t *)(a3 + 24) = vmla_n_f32(vmla_n_f32(vmla_n_f32(0, *(float32x2_t *)v4.i8, v11), *(float32x2_t *)v3.i8, result), *(float32x2_t *)v18.i8, v13);
  *(float *)(a3 + 32) = v14;
  return result;
}

double g_coords_delta(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double result;

  v3 = a1[1];
  v5 = a1[2];
  v4 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v11 = a1[9];
  v12 = a1[10];
  v13 = a1[11];
  v14 = *a1 * v11 + 0.0 + v4 * v12 + v8 * v13;
  v15 = v3 * v11 + 0.0 + v6 * v12 + v9 * v13;
  v16 = v5 * v11 + 0.0 + v7 * v12 + v10 * v13;
  v17 = a2[1];
  v18 = a2[2];
  v19 = a2[3];
  v20 = *a2 * *a1 + 0.0 + v17 * v3 + v18 * v5;
  v21 = *a2 * v4 + 0.0 + v17 * v6 + v18 * v7;
  v22 = *a2 * v8 + 0.0 + v17 * v9 + v18 * v10;
  v23 = a2[4];
  v24 = a2[5];
  v25 = v19 * *a1 + 0.0 + v23 * v3 + v24 * v5;
  v26 = a2[6];
  v27 = a2[7];
  v28 = v26 * *a1 + 0.0 + v27 * v3;
  v29 = a2[8];
  a3[9] = 0.0 - *a2 * v14 - v17 * v15 - v18 * v16 + a2[9];
  a3[10] = 0.0 - v19 * v14 - v23 * v15 - v24 * v16 + a2[10];
  a3[11] = 0.0 - v26 * v14 - v27 * v15 - v29 * v16 + a2[11];
  *a3 = v20;
  a3[1] = v21;
  a3[2] = v22;
  a3[3] = v25;
  a3[4] = v19 * v4 + 0.0 + v23 * v6 + v24 * v7;
  a3[5] = v19 * v8 + 0.0 + v23 * v9 + v24 * v10;
  result = v26 * v8 + 0.0 + v27 * v9 + v29 * v10;
  a3[6] = v28 + v29 * v5;
  a3[7] = v26 * v4 + 0.0 + v27 * v6 + v29 * v7;
  a3[8] = result;
  return result;
}

double g_coords_angle_diff(double *a1, double *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34[12];
  double v35[4];

  v35[3] = *(double *)MEMORY[0x24BDAC8D0];
  v2 = a1[1];
  v3 = a2[1];
  v5 = a1[2];
  v4 = a1[3];
  v7 = a2[2];
  v6 = a2[3];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a2[6];
  v11 = a2[7];
  v12 = *a2 * *a1 + 0.0 + v6 * v4 + v10 * v8;
  v13 = a1[4];
  v14 = a1[5];
  v15 = *a2 * v2 + 0.0 + v6 * v13 + v10 * v9;
  v16 = a1[8];
  v17 = *a2 * v5 + 0.0 + v6 * v14 + v10 * v16;
  v18 = a2[4];
  v19 = a2[5];
  v20 = v3 * *a1 + 0.0 + v18 * v4 + v11 * v8;
  v21 = v7 * *a1 + 0.0 + v19 * v4;
  v22 = a2[8];
  v23 = v21 + v22 * v8;
  v24 = v3 * v2 + 0.0 + v18 * v13 + v11 * v9;
  v25 = v7 * v2 + 0.0 + v19 * v13;
  v26 = v3 * v5 + 0.0 + v18 * v14 + v11 * v16;
  v27 = v25 + v22 * v9;
  v28 = v7 * v5 + 0.0 + v19 * v14 + v22 * v16;
  v29 = a1[9] - a2[9];
  v30 = a1[10] - a2[10];
  v31 = a1[11] - a2[11];
  v32 = *a2 * v29 + 0.0 + v6 * v30;
  v34[10] = v3 * v29 + 0.0 + v18 * v30 + v11 * v31;
  v34[11] = v7 * v29 + 0.0 + v19 * v30 + v22 * v31;
  v34[0] = v12;
  v34[1] = v15;
  v34[2] = v17;
  v34[3] = v20;
  v34[4] = v24;
  v34[5] = v26;
  v34[6] = v23;
  v34[7] = v27;
  v34[8] = v28;
  v34[9] = v32 + v10 * v31;
  return g_log_so3(v35, v34);
}

void g_proj2_to_g_proj(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  unsigned int v4;
  long double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v4 = *(_DWORD *)a1;
  *(_DWORD *)a2 = *(_DWORD *)a1;
  if (v4 > 0xF)
    goto LABEL_19;
  if (((1 << v4) & 0xB59) == 0)
  {
    if (((1 << v4) & 0xF000) != 0)
    {
      v13 = atan(1.0 / *(double *)(a1 + 8));
      v10 = v13 + v13;
      *(long double *)(a2 + 8) = v13 + v13;
      v12 = (v13 + v13) * *(double *)(a1 + 16);
      goto LABEL_8;
    }
    if (((1 << v4) & 0x420) != 0)
    {
      v10 = *(double *)(a1 + 24);
      v12 = *(double *)(a1 + 32);
      *(double *)(a2 + 8) = v10;
      goto LABEL_8;
    }
LABEL_19:
    log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_camera.c", 6608, (uint64_t)"g_proj2_to_g_proj", "Lens type %d is not implemented!", v4);
    __assert_rtn("g_proj2_to_g_proj", "g_camera.c", 6608, "0");
  }
  v9 = atan((double)*(int *)(a1 + 168) / (*(double *)(a1 + 8) + *(double *)(a1 + 8)));
  v10 = v9 + v9;
  *(long double *)(a2 + 8) = v9 + v9;
  v11 = atan((double)*(int *)(a1 + 172) / (*(double *)(a1 + 16) + *(double *)(a1 + 16)));
  v12 = v11 + v11;
LABEL_8:
  *(double *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 40);
  v14 = fabs(v12);
  if (v14 >= INFINITY && v14 <= INFINITY)
    *(_QWORD *)(a2 + 16) = 0;
  v15 = fabs(v10);
  if (v15 >= INFINITY && v15 <= INFINITY)
    *(_QWORD *)(a2 + 8) = 0;
  v16 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(a2 + 56) = v16;
  v17 = *(_OWORD *)(a1 + 104);
  v18 = *(_OWORD *)(a1 + 120);
  v19 = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 136) = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 120) = v19;
  *(_OWORD *)(a2 + 104) = v18;
  *(_OWORD *)(a2 + 88) = v17;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 56);
  if (a3)
    *a3 = *(_DWORD *)(a1 + 168);
  if (a4)
    *a4 = *(_DWORD *)(a1 + 172);
}

void rowl_setup(int *a1, unsigned int a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  _DWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  int v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  _DWORD *v45;

  if ((int)a2 >= 1)
  {
    bzero(a4, 4 * a2);
    v13 = a1;
    v14 = a2;
    do
    {
      v15 = *v13++;
      ++*(_DWORD *)&a4[4 * v15];
      --v14;
    }
    while (v14);
    if ((int)a2 >= 2)
    {
      v16 = a4 + 4;
      v17 = *(_DWORD *)a4;
      v18 = a2 - 1;
      do
      {
        v17 += *v16;
        *v16++ = v17;
        --v18;
      }
      while (v18);
    }
    v19 = 0;
    do
    {
      v20 = 4 * a1[v19];
      --*(_DWORD *)&a4[v20];
      *(_DWORD *)(a3 + 4 * *(int *)&a4[4 * a1[v19]]) = v19;
      ++v19;
    }
    while (a2 != v19);
    v21 = 0;
    if (a2 < 8)
      goto LABEL_14;
    if ((unint64_t)(a5 - a6) < 0x20)
      goto LABEL_14;
    v21 = a2 & 0xFFFFFFF8;
    v22 = (_OWORD *)(a6 + 16);
    v23 = (_OWORD *)(a5 + 16);
    *(_QWORD *)&v24 = -1;
    *((_QWORD *)&v24 + 1) = -1;
    v25 = v21;
    do
    {
      *(v22 - 1) = v24;
      *v22 = v24;
      v22 += 2;
      *(v23 - 1) = v24;
      *v23 = v24;
      v23 += 2;
      v25 -= 8;
    }
    while (v25);
    if (v21 != a2)
    {
LABEL_14:
      v26 = a2 - v21;
      v27 = 4 * v21;
      v28 = (_DWORD *)(a5 + 4 * v21);
      v29 = (_DWORD *)(a6 + v27);
      do
      {
        *v29++ = -1;
        *v28++ = -1;
        --v26;
      }
      while (v26);
    }
    v30 = 0;
    do
    {
      v31 = v30++;
      LODWORD(v32) = a2;
      if (v30 < a2)
        LODWORD(v32) = *(_DWORD *)&a4[4 * v30];
      v33 = *(int *)&a4[4 * v31];
      if ((int)v32 > (int)v33)
      {
        v32 = (int)v32;
        v34 = (int)v32 - 1;
        v35 = (int *)(a3 + 4 * v34);
        v36 = v31 - 1;
        if (v31)
        {
          v37 = a3 - 4 + 4 * (int)v32;
          v38 = v34 + 1;
          do
          {
            v39 = v35;
            v40 = v36;
            if (v38 != v32)
            {
              v40 = *(_DWORD *)(v37 + 4);
              v39 = (int *)v37;
            }
            --v32;
            *(_DWORD *)(a5 + 4 * *v39) = v40;
            v37 -= 4;
          }
          while (v32 > v33);
        }
        else
        {
          v41 = v34 + 1;
          do
          {
            v42 = v35;
            v43 = a5;
            LODWORD(v44) = v36;
            if (v41 != v32)
            {
              v45 = (_DWORD *)(a3 + 4 * v32);
              *(_DWORD *)(a5 + 4 * (int)*(v45 - 1)) = *v45;
              v44 = (int)*(v45 - 1);
              v42 = (int *)(a5 + 4 * v44);
              v43 = a6;
            }
            --v32;
            *(_DWORD *)(v43 + 4 * *v42) = v44;
          }
          while (v32 > v33);
        }
      }
    }
    while (v30 != a2);
  }
}

_QWORD *cholskyf_create(uint64_t a1, int a2, int a3)
{
  int v6;
  _QWORD *v7;
  char *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;

  v6 = a3 - a2;
  v7 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040B0206AFAuLL);
  v8 = (char *)malloc_type_malloc(8 * a2, 0x100004052888210uLL);
  v7[1] = &v8[4 * a2];
  v7[2] = v8;
  *((_DWORD *)v7 + 6) = a2;
  *((_DWORD *)v7 + 10) = v6;
  *((_DWORD *)v7 + 11) = 1;
  if (a2 < 1)
  {
    v11 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      if (v12 < *(_DWORD *)(a1 + 4 * v10) + (int)v10)
      {
        v13 = v12;
        v14 = ((unint64_t)(v9 + v12) << 32) + 0x100000000;
        do
        {
          v15 = 4 * v13;
          *(_DWORD *)&v8[4 * a2 + v15] = v11;
          *(_DWORD *)&v8[v15] = v10;
          v11 += v14 >> 32;
          ++v13;
          v14 += 0x100000000;
        }
        while (v13 < *(int *)(a1 + 4 * v10) + (uint64_t)(int)v10);
        v12 = v13;
      }
      ++v10;
      --v9;
    }
    while (v10 != a2);
  }
  v16 = v11 + v6 * a3;
  v17 = (char *)malloc_type_malloc(4 * v16, 0x9139AB02uLL);
  *v7 = v17;
  v7[4] = &v17[4 * v11];
  *((_DWORD *)v7 + 7) = v16;
  if (v11 >= 0x7FFFFFFF)
    __assert_rtn("cholskyf_create", "cholsky.c", 631, "cnt < INT32_MAX");
  return v7;
}

void factorizef(uint64_t *a1, float *a2, uint64_t a3, float *a4, int *a5, uint64_t a6, float a7)
{
  unint64_t v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  float *v27;
  uint64_t v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  float v57;
  float v58;
  float *v59;
  float *v60;
  uint64_t v61;
  float v62;
  float v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  int *v70;
  float v71;
  float v72;
  float v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  float *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  float v83;
  float v84;
  float v85;
  int v86;
  float v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  int v95;
  BOOL i;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  float *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  float *v109;
  float *v110;
  float *v111;
  int64_t v112;
  unint64_t v113;
  float v114;
  float *v115;
  uint64_t v116;
  float v117;
  float *v118;
  int64_t v119;
  float v120;
  uint64_t v121;
  float *v122;
  uint64_t v123;
  int v124;
  float *v125;
  uint64_t j;
  float *v127;
  float *v128;
  float v129;
  float v130;
  uint64_t v131;
  float *v132;
  float v133;
  float v134;
  float *v135;
  uint64_t v136;
  float *v137;
  float v138;
  uint64_t v139;
  uint64_t v140;
  float v141;
  float v142;
  float v143;
  float v144;
  uint64_t v145;
  float v146;
  uint64_t v147;
  int v149;
  float *v150;
  char *v151;
  uint64_t v152;
  uint64_t v154;

  v9 = *((unsigned int *)a1 + 6);
  v10 = (int)v9;
  v11 = (float *)a1[4];
  v13 = *a1;
  v12 = a1[1];
  v14 = (int *)a1[2];
  v15 = *((_DWORD *)a1 + 10);
  if (!*((_DWORD *)a1 + 11))
  {
    v149 = *((_DWORD *)a1 + 10);
    v150 = (float *)a1[4];
    v43 = (char *)malloc_type_malloc(16 * (int)v9, 0x100004052888210uLL);
    v44 = &v43[4 * (int)v9];
    v45 = (uint64_t)&v44[4 * (int)v9];
    v46 = v45 + 4 * (int)v9;
    v47 = v43;
    v151 = v44;
    rowl_setup(v14, v9, (uint64_t)v43, v44, v45, v46);
    v48 = v47;
    v49 = a6;
    if ((int)v9 < 1)
    {
LABEL_79:
      free(v48);
      v10 = (int)v9;
      v11 = v150;
      v15 = v149;
      if (!*((_DWORD *)a1 + 10))
        return;
      goto LABEL_80;
    }
    v154 = 0;
    v50 = 0;
    v51 = v13;
    while (1)
    {
      v52 = v50;
      v53 = 4 * v50;
      v54 = v14[v50];
      v55 = *(int *)(v12 + v53);
      v56 = *a2++;
      v57 = v56 + a7;
      v58 = v56 + a7;
      v59 = (float *)(v13 + 4 * v55 + 4 * (v52 - v54));
      *v59 = v56 + a7;
      if (v52 > v54)
      {
        v60 = (float *)(v51 + 4 * (v154 + v55));
        v61 = v54;
        v58 = v57;
        do
        {
          v62 = *v60++;
          v58 = v58 - (float)(v62 * v62);
          *v59 = v58;
          ++v61;
        }
        while (v52 != v61);
      }
      v63 = v57 * 0.000000001;
      if (v58 > v63)
        v63 = v58;
      *v59 = sqrtf(v63);
      v64 = a5[1];
      v152 = v51;
      if (v64 == 1)
      {
        v65 = *(_DWORD *)(v49 + 4 * v52);
        if (v65 == 1)
        {
          v66 = -1;
          a5 += 2;
          v67 = -1;
          v68 = *(_DWORD *)(v46 + 4 * v52);
          if (v68 != -1)
            goto LABEL_37;
        }
        else
        {
          v66 = a5[2];
          v67 = a5[3] + v66;
          v65 = 1;
          a5 += 2;
          v68 = *(_DWORD *)(v46 + 4 * v52);
          if (v68 != -1)
          {
LABEL_37:
            v69 = v13 - 4 * v54 + 4 * v55;
            v70 = a5;
            do
            {
              v71 = 0.0;
              if (v68 < v66 || v68 >= v67)
              {
                v73 = 0.0;
              }
              else
              {
                v72 = *a2++;
                v73 = v72;
              }
              v74 = v68;
              v75 = v14[v74];
              v76 = *(int *)(v12 + v74 * 4);
              v77 = (float *)(v13 + 4 * v76 + 4 * (v52 - v75));
              *v77 = v73;
              if ((int)v75 <= (int)v54)
                LODWORD(v78) = v54;
              else
                LODWORD(v78) = v75;
              v79 = v78 + 3;
              if (v52 > (int)v78 + 3)
              {
                v80 = 0;
                if (v75 <= v54)
                  v81 = v54;
                else
                  v81 = v75;
                v82 = v154 + v81;
                v83 = 0.0;
                v84 = 0.0;
                v85 = 0.0;
                do
                {
                  v85 = v85
                      + (float)(*(float *)(v13 + 4 * v81 + 4 * v76 - 4 * v75 + 4 * v80)
                              * *(float *)(v69 + 4 * v81 + 4 * v80));
                  v86 = v80;
                  v84 = v84 + (float)(v77[v82 + 1 + (int)v80] * v59[v82 + 1 + (int)v80]);
                  v83 = v83 + (float)(v77[v82 + 2 + (int)v80] * v59[v82 + 2 + (int)v80]);
                  v71 = v71 + (float)(v77[v79 - v52] * v59[v79 - v52]);
                  v80 += 4;
                  v79 = v81 + v86 + 7;
                }
                while (v81 + v80 + 3 < v52);
                LODWORD(v78) = v81 + v80;
                v71 = (float)((float)(v85 + v84) + v83) + v71;
                v49 = a6;
              }
              v87 = v73 - v71;
              *v77 = v87;
              v78 = (int)v78;
              if (v52 > (int)v78)
              {
                v88 = v13 - 4 * v75 + 4 * v76;
                do
                {
                  v87 = v87 - (float)(*(float *)(v88 + 4 * v78) * *(float *)(v69 + 4 * v78));
                  *v77 = v87;
                  ++v78;
                }
                while (v52 != v78);
              }
              *v77 = v87 / *v59;
              if (v67 == -1 || v68 + 1 < v67)
              {
                a5 = v70;
              }
              else
              {
                a5 = v70 + 2;
                if (++v65 == *(_DWORD *)(v49 + 4 * v52))
                {
                  v66 = -1;
                  v67 = -1;
                }
                else
                {
                  v66 = v70[2];
                  v67 = v70[3] + v66;
                }
              }
              v68 = *(_DWORD *)(v46 + 4 * v68);
              v70 = a5;
            }
            while (v68 != -1);
          }
        }
      }
      else
      {
        v65 = 0;
        v66 = *a5;
        v67 = v64 + *a5;
        v68 = *(_DWORD *)(v46 + 4 * v52);
        if (v68 != -1)
          goto LABEL_37;
      }
      v50 = v52 + 1;
      v48 = v47;
      if (v52 + 1 < (int)v9)
      {
        v89 = v52 + 2;
        v90 = v9;
        if (v89 < (int)v9)
          v90 = *(_DWORD *)&v151[4 * v89];
        v91 = *(int *)&v151[4 * v50];
        if (v90 > (int)v91)
        {
          v92 = v90;
          do
          {
            --v92;
            v93 = *((_DWORD *)v47 + v92);
            v94 = *(int *)(v45 + 4 * v93);
            v95 = *(_DWORD *)(v46 + 4 * v94);
            for (i = v95 == -1; v95 < v93 && v95 != -1; i = v95 == -1)
            {
              LODWORD(v94) = v95;
              *(_DWORD *)(v45 + 4 * v93) = v95;
              v95 = *(_DWORD *)(v46 + 4 * v95);
            }
            *(_DWORD *)(v46 + 4 * v93) = v95;
            if (!i)
            {
              *(_DWORD *)(v45 + 4 * v95) = v93;
              LODWORD(v94) = *(_DWORD *)(v45 + 4 * v93);
            }
            *(_DWORD *)(v46 + 4 * (int)v94) = v93;
          }
          while (v92 > v91);
        }
      }
      v51 = v152 + 4;
      --v154;
      if (v50 == v9)
        goto LABEL_79;
    }
  }
  if ((int)v9 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = 1;
    v19 = *a1;
    do
    {
      v20 = v14[v17];
      v21 = *(int *)(v12 + 4 * v17);
      v22 = v13 + 4 * v21;
      v23 = *a2++;
      v24 = v23;
      v25 = v23;
      v26 = v17 - v20;
      *(float *)(v22 + 4 * (v17 - v20)) = v23;
      if (v17 > v20)
      {
        v27 = (float *)(v19 + 4 * (v16 + v21));
        v28 = v20;
        v25 = v24;
        do
        {
          v29 = *v27++;
          v25 = v25 - (float)(v29 * v29);
          *(float *)(v22 + 4 * v26) = v25;
          ++v28;
        }
        while (v17 != v28);
      }
      v30 = v24 * 0.000000001;
      if (v25 > v30)
        v30 = v25;
      *(float *)(v22 + 4 * v26) = sqrtf(v30);
      v31 = v17 + 1;
      if (v17 + 1 < v9)
      {
        v32 = v13 - 4 * v20 + 4 * v21;
        v33 = v18;
        do
        {
          v34 = v14[v33];
          v35 = v17 - v34;
          if (v17 < v34)
            break;
          v36 = 0.0;
          if ((int)v33 - (int)v17 < *(_DWORD *)(a3 + 4 * v17))
          {
            v37 = *a2++;
            v36 = v37;
          }
          v38 = *(int *)(v12 + 4 * v33);
          v39 = v13 + 4 * v38;
          *(float *)(v39 + 4 * v35) = v36;
          if (v17 > v34)
          {
            v40 = 4 * (v16 + v38);
            do
            {
              v36 = v36 - (float)(*(float *)(v19 + v40) * *(float *)(v32 + 4 * v34));
              *(float *)(v39 + 4 * v35) = v36;
              ++v34;
              v40 += 4;
            }
            while (v17 != v34);
          }
          *(float *)(v39 + 4 * v35) = v36 / *(float *)(v22 + 4 * v26);
          ++v33;
        }
        while (v33 != v9);
      }
      ++v18;
      v19 += 4;
      --v16;
      ++v17;
    }
    while (v31 != v9);
  }
  if (!v15)
    return;
LABEL_80:
  v99 = v15 + v9;
  if ((int)v9 >= 1)
  {
    if (v15 < 1)
      return;
    v100 = 0;
    v101 = 0;
    v102 = 4 * v99;
    v103 = v13;
    v104 = v11;
    do
    {
      v105 = *(int *)(v12 + 4 * v101);
      v106 = v13 + 4 * v105;
      v107 = v14[v101];
      v108 = v101 - v107;
      if (v101 <= v107)
      {
        v118 = v104;
        v119 = v9;
        do
        {
          v120 = *a4++;
          *v118 = v120;
          *v118 = v120 / *(float *)(v106 + 4 * v108);
          ++v119;
          v118 = (float *)((char *)v118 + v102);
        }
        while (v119 < v99);
      }
      else
      {
        v109 = &v11[v101];
        v110 = (float *)(v103 + 4 * (v100 + v105));
        v111 = v11;
        v112 = v9;
        do
        {
          v113 = (v112 - v9) * v99;
          v114 = *a4;
          v109[v113] = *a4;
          v115 = v110;
          v116 = v107;
          do
          {
            v117 = *v115++;
            v114 = v114 - (float)(v111[v116] * v117);
            v109[v113] = v114;
            ++v116;
          }
          while (v101 != v116);
          ++a4;
          v109[v113] = v114 / *(float *)(v106 + 4 * v108);
          ++v112;
          v111 = (float *)((char *)v111 + v102);
        }
        while (v112 < v99);
      }
      ++v101;
      ++v104;
      v103 += 4;
      --v100;
    }
    while (v101 != v9);
  }
  if (v15 >= 1)
  {
    v121 = (int)v9 + 1;
    v122 = &v11[(v121 - v10) * v99];
    v123 = 4 * v99;
    v124 = -(int)v9;
    v125 = v11;
    for (j = v10; ; ++j)
    {
      v127 = &a4[j - v10];
      v128 = &v11[(j - v10) * v99 + j];
      v129 = *v127;
      *v128 = *v127;
      v130 = v129;
      if (j >= 1)
      {
        v131 = j;
        v132 = v125;
        v130 = v129;
        do
        {
          v133 = *v132++;
          v130 = v130 - (float)(v133 * v133);
          *v128 = v130;
          --v131;
        }
        while (v131);
      }
      v134 = v129 * 0.000000001;
      if (v130 > v134)
        v134 = v130;
      *v128 = sqrtf(v134);
      if (j + 1 >= v99)
        return;
      a4 = v127 + 1;
      v135 = v122;
      v136 = v121;
      do
      {
        v137 = &v11[j + (v136 - v10) * v99];
        v138 = *a4;
        *v137 = *a4;
        if (j < 4)
        {
          LODWORD(v140) = 0;
          v146 = v138 - 0.0;
          *v137 = v146;
          if (j <= 0)
            goto LABEL_103;
LABEL_110:
          v147 = v140;
          do
          {
            v146 = v146 - (float)(v135[v147] * v125[v147]);
            *v137 = v146;
            ++v147;
          }
          while (v147 < j);
          goto LABEL_103;
        }
        v139 = 0;
        v140 = 0;
        v141 = 0.0;
        v142 = 0.0;
        v143 = 0.0;
        v144 = 0.0;
        do
        {
          v144 = v144 + (float)(v135[v139] * v125[v139]);
          v143 = v143 + (float)(v137[v124 + 1 + (int)v140] * v128[v124 + 1 + (int)v140]);
          v142 = v142 + (float)(v137[v124 + 2 + (int)v140] * v128[v124 + 2 + (int)v140]);
          v141 = v141 + (float)(v135[v139 + 3] * v125[v139 + 3]);
          v145 = v140 + 7;
          v140 += 4;
          v139 += 4;
        }
        while (v145 < j);
        v146 = v138 - (float)((float)((float)(v144 + v143) + v142) + v141);
        *v137 = v146;
        if (j > (int)v140)
          goto LABEL_110;
LABEL_103:
        *v137 = v146 / *v128;
        ++v136;
        ++a4;
        v135 = (float *)((char *)v135 + v123);
      }
      while (v99 != (_DWORD)v136);
      ++v121;
      v125 = (float *)((char *)v125 + v123);
      v122 = (float *)((char *)v122 + v123);
      --v124;
    }
  }
}

void cholskyf_solve(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  float *v15;
  float *v16;
  uint64_t v17;
  float *v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  float v26;
  uint64_t v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  float *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  _DWORD *v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t i;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  int32x4_t *v69;
  int32x4_t *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  int v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  float v81;
  int j;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  float *v89;
  uint64_t v90;
  char *v91;
  char *v92;
  __int128 v93;
  uint64_t v94;
  int32x4_t *v95;
  int32x4_t *v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int64x2_t v104;
  int32x4_t v105;
  uint64_t v106;
  int32x4_t v107;
  char *v108;
  float *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;

  v6 = *(unsigned int *)(a1 + 24);
  v7 = *(unsigned int *)(a1 + 40);
  v112 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  v8 = *(int **)(a1 + 16);
  v10 = (int)v7 + (int)v6;
  v11 = (float *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  v12 = v6;
  v13 = v11;
  v14 = a1;
  v15 = *(float **)a1;
  v16 = *(float **)(a1 + 32);
  if ((int)v12 >= 1)
  {
    v17 = 0;
    v18 = v15;
    do
    {
      v20 = *(float *)(a3 + 4 * v17);
      v11[v17] = v20;
      v21 = v8[v17];
      if (v17 > v21)
      {
        do
        {
          v22 = *v18++;
          v20 = v20 - (float)(v22 * v11[v21]);
          v11[v17] = v20;
          ++v21;
        }
        while (v17 != v21);
      }
      v19 = *v18++;
      v11[v17++] = v20 / v19;
    }
    while (v17 != v12);
  }
  v23 = 4 * v10;
  if ((int)v7 >= 1)
  {
    v24 = (int)v12;
    v25 = v16;
    do
    {
      v26 = *(float *)(a3 + 4 * v24);
      v11[v24] = v26;
      if (v24 >= 1)
      {
        v27 = v24;
        v28 = v11;
        do
        {
          v29 = *v25++;
          v30 = v29;
          v31 = *v28++;
          v26 = v26 - (float)(v30 * v31);
          v11[v24] = v26;
          --v27;
        }
        while (v27);
      }
      v11[v24++] = v26 / *v25;
      v25 += v10 - v24 + 1;
    }
    while (v10 > v24);
    v32 = 0;
    v33 = v7 + (int)v12;
    v34 = (uint64_t)&v16[v7 - 1 + v7 * ((int)v12 + (uint64_t)(int)v7) + (int)v12];
    do
    {
      v35 = v33--;
      v36 = v11[v33];
      *(float *)(a2 + 4 * v33) = v36;
      if (v35 < v10)
      {
        v37 = (float *)v34;
        v38 = v32;
        do
        {
          v36 = v36 - (float)(*v37 * *(float *)(a2 + 4 * (v7 + (int)v12) + 4 * v38));
          *(float *)(a2 + 4 * v33) = v36;
          v37 = (float *)((char *)v37 + v23);
          ++v38;
        }
        while ((_DWORD)v38);
      }
      *(float *)(a2 + 4 * v33) = v36 / v16[v33 + ((int)v33 - (int)v12) * (int)v10];
      --v32;
      v34 += v23 ^ 0xFFFFFFFFFFFFFFFCLL;
    }
    while (v33 > (int)v12);
  }
  if (!*(_DWORD *)(v14 + 44))
  {
    v110 = (int)v12;
    v111 = v12;
    v50 = (char *)malloc_type_malloc(16 * (int)v12, 0x100004052888210uLL);
    if ((int)v111 < 1)
    {
LABEL_67:
      free(v50);
      goto LABEL_68;
    }
    v108 = v50;
    v109 = v16;
    v51 = &v50[4 * v110];
    v52 = &v51[4 * v110];
    v53 = &v52[4 * v110];
    bzero(v51, 4 * v111);
    v54 = v8;
    v55 = v111;
    do
    {
      v56 = *v54++;
      ++*(_DWORD *)&v51[4 * v56];
      --v55;
    }
    while (v55);
    v50 = v108;
    if ((int)v111 >= 2)
    {
      v57 = (int *)&v108[4 * v110];
      v60 = *v57;
      v58 = v57 + 1;
      v59 = v60;
      v61 = v111 - 1;
      do
      {
        v59 += *v58;
        *v58++ = v59;
        --v61;
      }
      while (v61);
    }
    for (i = 0; i != v111; ++i)
    {
      v63 = 4 * v8[i];
      --*(_DWORD *)&v51[v63];
      *(_DWORD *)&v108[4 * *(int *)&v51[4 * v8[i]]] = i;
    }
    if (v111 >= 0xC && (unint64_t)(-4 * v110) >= 0x20)
    {
      v64 = v111 & 0x7FFFFFF8;
      v91 = &v108[12 * v110 + 16];
      v92 = &v108[8 * v110 + 16];
      *(_QWORD *)&v93 = -1;
      *((_QWORD *)&v93 + 1) = -1;
      v94 = v111 & 0xFFFFFFF8;
      do
      {
        *((_OWORD *)v91 - 1) = v93;
        *(_OWORD *)v91 = v93;
        v91 += 32;
        *((_OWORD *)v92 - 1) = v93;
        *(_OWORD *)v92 = v93;
        v92 += 32;
        v94 -= 8;
      }
      while (v94);
      if (v64 == v111)
      {
LABEL_45:
        if (v111 >= 0xC
          && (v69 = (int32x4_t *)&v108[12 * v110],
              v70 = (int32x4_t *)&v108[8 * v110],
              (unint64_t)((char *)v69 - (char *)v70) >= 0x20))
        {
          v71 = v111 & 0x7FFFFFF8;
          v95 = v70 + 1;
          v96 = v69 + 1;
          v97 = (int32x4_t)xmmword_210BCABC0;
          v98 = (int32x4_t)xmmword_210BCAB60;
          v99 = (int32x4_t)xmmword_210BCABD0;
          v100.i64[0] = -1;
          v100.i64[1] = -1;
          v101.i64[0] = 0x300000003;
          v101.i64[1] = 0x300000003;
          v102.i64[0] = 0x100000001;
          v102.i64[1] = 0x100000001;
          v103.i64[0] = 0x500000005;
          v103.i64[1] = 0x500000005;
          v104 = vdupq_n_s64(8uLL);
          v105.i64[0] = 0x800000008;
          v105.i64[1] = 0x800000008;
          v106 = v111 & 0xFFFFFFF8;
          do
          {
            v95[-1] = vaddq_s32(v99, v100);
            *v95 = vaddq_s32(v99, v101);
            v107 = vuzp1q_s32(v98, v97);
            v96[-1] = vaddq_s32(v107, v102);
            *v96 = vaddq_s32(v107, v103);
            v97 = (int32x4_t)vaddq_s64((int64x2_t)v97, v104);
            v98 = (int32x4_t)vaddq_s64((int64x2_t)v98, v104);
            v99 = vaddq_s32(v99, v105);
            v95 += 2;
            v96 += 2;
            v106 -= 8;
          }
          while (v106);
          if (v71 == v111)
          {
LABEL_50:
            *(_DWORD *)&v53[4 * (v111 - 1)] = -1;
            v77 = (uint64_t)&v109[v110 - 1];
            v78 = v110;
            do
            {
              v79 = v78 - 1;
              v80 = 4 * (v78 - 1);
              v81 = v13[(unint64_t)v80 / 4];
              *(float *)(a2 + v80) = v81;
              for (j = *(_DWORD *)&v53[v80]; j != -1; j = *(_DWORD *)&v53[v83])
              {
                v83 = 4 * j;
                v81 = v81
                    - (float)(v15[*(int *)(v9 + v83) + v79 - v8[(unint64_t)v83 / 4]] * *(float *)(a2 + v83));
                *(float *)(a2 + 4 * v79) = v81;
              }
              v84 = *(int *)&v51[4 * v79];
              LODWORD(v85) = v111;
              if (v78 < v110)
                LODWORD(v85) = *(_DWORD *)&v51[4 * v78];
              if ((int)v85 > (int)v84)
              {
                v85 = (int)v85;
                do
                {
                  v86 = *(int *)&v108[4 * v85 - 4];
                  v87 = *(int *)&v52[4 * v86];
                  if ((_DWORD)v87 != -1)
                    *(_DWORD *)&v53[4 * v87] = *(_DWORD *)&v53[4 * v86];
                  v88 = *(int *)&v53[4 * v86];
                  if ((_DWORD)v88 != -1)
                    *(_DWORD *)&v52[4 * v88] = *(_DWORD *)&v52[4 * v86];
                  --v85;
                }
                while (v85 > v84);
              }
              if (v112 >= 1)
              {
                v89 = (float *)v77;
                v90 = v110;
                do
                {
                  v81 = v81 - (float)(*v89 * *(float *)(a2 + 4 * v90));
                  *(float *)(a2 + 4 * v79) = v81;
                  ++v90;
                  v89 = (float *)((char *)v89 + v23);
                }
                while (v90 < v10);
              }
              *(float *)(a2 + v80) = v81 / v15[*(int *)(v9 + v80) + v79 - v8[(unint64_t)v80 / 4]];
              v77 -= 4;
              v42 = v78-- <= 1;
            }
            while (!v42);
            goto LABEL_67;
          }
        }
        else
        {
          v71 = 0;
        }
        v72 = 4 * v71;
        v73 = &v108[12 * (int)v110 + 4 * v71];
        v74 = v111 - v71;
        v75 = v71 + 1;
        v76 = &v108[8 * v110 + v72];
        do
        {
          *(_DWORD *)v76 = v75 - 2;
          v76 += 4;
          *(_DWORD *)v73 = v75;
          v73 += 4;
          ++v75;
          --v74;
        }
        while (v74);
        goto LABEL_50;
      }
    }
    else
    {
      v64 = 0;
    }
    v65 = v111 - v64;
    v66 = 4 * v64;
    v67 = &v108[8 * v110 + 4 * v64];
    v68 = &v108[12 * (int)v110 + v66];
    do
    {
      *(_DWORD *)v68 = -1;
      v68 += 4;
      *(_DWORD *)v67 = -1;
      v67 += 4;
      --v65;
    }
    while (v65);
    goto LABEL_45;
  }
  if ((int)v12 >= 1)
  {
    v39 = 0;
    v40 = (uint64_t)&v16[v12 - 1];
    v41 = v12;
    do
    {
      v43 = v41 - 1;
      v44 = 4 * (v41 - 1);
      v45 = v11[(unint64_t)v44 / 4];
      *(float *)(a2 + v44) = v45;
      if (v41 < v12)
      {
        v46 = v39;
        do
        {
          v47 = v8[v12 + v46];
          if (v41 <= v47)
            break;
          v45 = v45 - (float)(v15[*(int *)(v9 + 4 * v12 + 4 * v46) + v43 - v47] * *(float *)(a2 + 4 * v12 + 4 * v46));
          *(float *)(a2 + 4 * v43) = v45;
          ++v46;
        }
        while ((_DWORD)v46);
      }
      if ((int)v7 >= 1)
      {
        v48 = (float *)v40;
        v49 = v12;
        do
        {
          v45 = v45 - (float)(*v48 * *(float *)(a2 + 4 * v49));
          *(float *)(a2 + 4 * v43) = v45;
          ++v49;
          v48 = (float *)((char *)v48 + v23);
        }
        while (v49 < v10);
      }
      *(float *)(a2 + v44) = v45 / v15[*(int *)(v9 + v44) + v43 - v8[(unint64_t)v44 / 4]];
      --v39;
      v40 -= 4;
      v42 = v41-- <= 1;
    }
    while (!v42);
  }
LABEL_68:
  free(v13);
}

uint64_t *vl_locability_model_load(int a1, int a2, uint64_t a3, const char *a4)
{
  _DWORD *v7;
  int v8;
  _DWORD *v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  const char *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *result;
  char v24;
  char v25[512];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = malloc_type_calloc(1uLL, 0x50uLL, 0x10800402CAE816BuLL);
  v9 = v7;
  model = (uint64_t)v7;
  *v7 = a1;
  if (a1 == 100)
  {
    v10 = xmmword_210BCDD30;
    v11 = (uint64_t)v7;
  }
  else
  {
    printf("%sError : ", (const char *)&str_1_0);
    if (a1 == 1)
      printf("Promote your model here!");
    else
      printf("In %s : model version %d not defined");
    putchar(10);
    v10 = xmmword_210BCDD40;
    v11 = model;
  }
  *(_OWORD *)(v9 + 1) = v10;
  v12 = (v8 >> 4) * (a2 / 16);
  free(*(void **)(v11 + 24));
  v13 = malloc_type_malloc(4 * v12 + 4095, 0xAD4DCA7BuLL);
  v14 = model;
  *(_QWORD *)(model + 24) = v13;
  *(_QWORD *)(v14 + 32) = (char *)v13 + (-(int)v13 & 0xFFFLL);
  free(*(void **)(v14 + 40));
  v15 = malloc_type_malloc(0x1003uLL, 0xE2AAD0CuLL);
  v16 = model;
  *(_QWORD *)(model + 40) = v15;
  *(_QWORD *)(v16 + 48) = (char *)v15 + (-(int)v15 & 0xFFFLL);
  free(*(void **)(v16 + 56));
  v17 = malloc_type_malloc(0x1003uLL, 0x2F694810uLL);
  v18 = model;
  *(_QWORD *)(model + 56) = v17;
  *(_QWORD *)(v18 + 64) = (char *)v17 + (-(int)v17 & 0xFFFLL);
  sprintf(v25, "espressos/loc_v%d.mlmodelc", v9[3]);
  if (a4)
    v19 = a4;
  else
    v19 = "com.apple.3dv.vl";
  vl_get_model_path(&v24, v19, v25);
  v20 = (_QWORD *)operator new();
  v21 = (uint64_t *)operator new();
  vl_img_esp_net_t::vl_img_esp_net_t(v21);
  *v20 = v21;
  v22 = (uint64_t *)operator new();
  result = vl_img_esp_net_t::vl_img_esp_net_t(v22);
  v20[1] = v22;
  *(_QWORD *)(model + 72) = v20;
  return result;
}

void sub_210BA74D8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x212BCEB50](v2, 0x1080C40AA79BA9DLL);
  MEMORY[0x212BCEB50](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void vl_locability_model_free()
{
  uint64_t v0;
  vl_img_esp_nets_t *v1;

  v0 = model;
  if (model)
  {
    v1 = *(vl_img_esp_nets_t **)(model + 72);
    if (v1)
    {
      vl_img_esp_nets_t::~vl_img_esp_nets_t(v1);
      MEMORY[0x212BCEB50]();
      *(_QWORD *)(v0 + 72) = 0;
      v0 = model;
    }
    free(*(void **)(v0 + 24));
    free(*(void **)(model + 40));
    free(*(void **)(model + 56));
    free((void *)model);
    model = 0;
  }
}

uint64_t vl_locability_forward()
{
  uint64_t result;
  FILE *v1;
  const char *status_string;
  void *exception;
  uint64_t v4;

  result = espresso_plan_execute_sync();
  if ((result & 0x80000000) != 0)
  {
    v1 = (FILE *)*MEMORY[0x24BDAC8D8];
    status_string = (const char *)espresso_get_status_string();
    fprintf(v1, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 186, status_string);
    exception = __cxa_allocate_exception(0x10uLL);
    v4 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](exception, v4);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_210BA7650(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t *vl_img_esp_net_t::vl_img_esp_net_t(uint64_t *a1)
{
  FILE *v3;
  const char *status_string;
  void *exception;
  uint64_t v6;
  FILE *v7;
  const char *v8;
  uint64_t v9;
  FILE *v10;
  const char *v11;
  uint64_t v12;
  FILE *v13;
  const char *v14;
  uint64_t v15;
  FILE *v16;
  const char *v17;
  uint64_t v18;
  FILE *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  FILE *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  FILE *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  FILE *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  FILE *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  FILE *v39;
  const char *v40;
  void *v41;
  uint64_t v42;

  *a1 = espresso_create_context_auto();
  a1[1] = espresso_create_plan();
  espresso_get_default_storage_type();
  if ((espresso_plan_add_network() & 0x80000000) != 0)
  {
    v3 = (FILE *)*MEMORY[0x24BDAC8D8];
    status_string = (const char *)espresso_get_status_string();
    fprintf(v3, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 68, status_string);
    exception = __cxa_allocate_exception(0x10uLL);
    v6 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](exception, v6);
    goto LABEL_18;
  }
  if ((espresso_network_change_blob_shape() & 0x80000000) != 0)
  {
    v7 = (FILE *)*MEMORY[0x24BDAC8D8];
    v8 = (const char *)espresso_get_status_string();
    fprintf(v7, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 72, v8);
    exception = __cxa_allocate_exception(0x10uLL);
    v9 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](exception, v9);
    goto LABEL_18;
  }
  if ((espresso_network_change_blob_shape() & 0x80000000) != 0)
  {
    v10 = (FILE *)*MEMORY[0x24BDAC8D8];
    v11 = (const char *)espresso_get_status_string();
    fprintf(v10, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 73, v11);
    exception = __cxa_allocate_exception(0x10uLL);
    v12 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](exception, v12);
    goto LABEL_18;
  }
  if ((espresso_network_change_blob_shape() & 0x80000000) != 0)
  {
    v13 = (FILE *)*MEMORY[0x24BDAC8D8];
    v14 = (const char *)espresso_get_status_string();
    fprintf(v13, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 74, v14);
    exception = __cxa_allocate_exception(0x10uLL);
    v15 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](exception, v15);
    goto LABEL_18;
  }
  if ((espresso_plan_build() & 0x80000000) != 0)
  {
    v16 = (FILE *)*MEMORY[0x24BDAC8D8];
    v17 = (const char *)espresso_get_status_string();
    fprintf(v16, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 76, v17);
    exception = __cxa_allocate_exception(0x10uLL);
    v18 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](exception, v18);
LABEL_18:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((espresso_buffer_pack_tensor_shape() & 0x80000000) != 0)
  {
    v19 = (FILE *)*MEMORY[0x24BDAC8D8];
    v20 = (const char *)espresso_get_status_string();
    fprintf(v19, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 84, v20);
    v21 = __cxa_allocate_exception(0x10uLL);
    v22 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](v21, v22);
    __cxa_throw(v21, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((espresso_buffer_pack_tensor_shape() & 0x80000000) != 0)
  {
    v23 = (FILE *)*MEMORY[0x24BDAC8D8];
    v24 = (const char *)espresso_get_status_string();
    fprintf(v23, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 85, v24);
    v25 = __cxa_allocate_exception(0x10uLL);
    v26 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](v25, v26);
    __cxa_throw(v25, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((espresso_buffer_pack_tensor_shape() & 0x80000000) != 0)
  {
    v27 = (FILE *)*MEMORY[0x24BDAC8D8];
    v28 = (const char *)espresso_get_status_string();
    fprintf(v27, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 86, v28);
    v29 = __cxa_allocate_exception(0x10uLL);
    v30 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](v29, v30);
    __cxa_throw(v29, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((espresso_network_bind_buffer() & 0x80000000) != 0)
  {
    v31 = (FILE *)*MEMORY[0x24BDAC8D8];
    v32 = (const char *)espresso_get_status_string();
    fprintf(v31, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 89, v32);
    v33 = __cxa_allocate_exception(0x10uLL);
    v34 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](v33, v34);
    __cxa_throw(v33, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((espresso_network_bind_buffer() & 0x80000000) != 0)
  {
    v35 = (FILE *)*MEMORY[0x24BDAC8D8];
    v36 = (const char *)espresso_get_status_string();
    fprintf(v35, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 91, v36);
    v37 = __cxa_allocate_exception(0x10uLL);
    v38 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](v37, v38);
    __cxa_throw(v37, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((espresso_network_bind_buffer() & 0x80000000) != 0)
  {
    v39 = (FILE *)*MEMORY[0x24BDAC8D8];
    v40 = (const char *)espresso_get_status_string();
    fprintf(v39, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 93, v40);
    v41 = __cxa_allocate_exception(0x10uLL);
    v42 = espresso_get_status_string();
    MEMORY[0x212BCEB2C](v41, v42);
    __cxa_throw(v41, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_210BA7D88(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7D9C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7DB0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7DC4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7DD8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7DEC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7E00(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7E14(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7E28(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7E3C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_210BA7E50(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void vl_img_esp_nets_t::~vl_img_esp_nets_t(vl_img_esp_nets_t *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this)
  {
    espresso_plan_build_clean();
    espresso_plan_destroy();
    espresso_context_destroy();
    MEMORY[0x212BCEB50](v2, 0x1080C40AA79BA9DLL);
  }
  v3 = *((_QWORD *)this + 1);
  if (v3)
  {
    espresso_plan_build_clean();
    espresso_plan_destroy();
    espresso_context_destroy();
    MEMORY[0x212BCEB50](v3, 0x1080C40AA79BA9DLL);
  }
}

_DWORD *vl_match_sss_build(uint64_t a1, void *a2, int a3, int a4, int *a5)
{
  int v9;
  _DWORD *v10;
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
  __int128 v22;
  __int128 v23;
  int v24;
  uint64_t v25;
  __int128 v26;

  v9 = *a5;
  v22 = xmmword_210BCC1A0;
  v23 = xmmword_210BCC1B0;
  v24 = 0;
  v25 = 0x3DCCCCCD3F800000;
  v26 = xmmword_210BCC1C0;
  if (v9 <= 199)
  {
    switch(v9)
    {
      case 'd':
        HIDWORD(v25) = 1065353216;
        v24 = 1;
        DWORD2(v23) = 2;
        *(_QWORD *)&v23 = 0x800000040;
        if (!*(_DWORD *)(a1 + 1564))
          goto LABEL_27;
        goto LABEL_15;
      case 'e':
        v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 4;
        *(_QWORD *)&v23 = 0xA00000040;
        if (!*(_DWORD *)(a1 + 1564))
          goto LABEL_27;
        goto LABEL_15;
      case 'f':
        v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 10;
        *(_QWORD *)&v23 = 0x1000000040;
        if (!*(_DWORD *)(a1 + 1564))
          goto LABEL_27;
        goto LABEL_15;
      case 'g':
        v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 2;
        *(_QWORD *)&v23 = 0x600000040;
        if (!*(_DWORD *)(a1 + 1564))
          goto LABEL_27;
        goto LABEL_15;
      case 'h':
        v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 2;
        goto LABEL_26;
      default:
        if (v9)
          goto LABEL_34;
        if (*(_DWORD *)(a1 + 1564))
          goto LABEL_15;
        goto LABEL_27;
    }
  }
  if (v9 > 201)
  {
    if (v9 == 202)
    {
      DWORD2(v23) = 2;
      *(_QWORD *)((char *)&v26 + 4) = 0x100000006;
LABEL_26:
      *(_QWORD *)&v23 = 0x400000050;
      if (!*(_DWORD *)(a1 + 1564))
        goto LABEL_27;
    }
    else
    {
      if (v9 != 706)
LABEL_34:
        __assert_rtn("sss_par_version", "sss.c", 255, "0 && \"Not implemented\"");
      v24 = 1;
      DWORD2(v23) = 2;
      HIDWORD(v25) = 1065353216;
      DWORD2(v26) = 2;
      *(_QWORD *)&v23 = 0x800000060;
      if (!*(_DWORD *)(a1 + 1564))
        goto LABEL_27;
    }
    goto LABEL_15;
  }
  if (v9 == 200)
  {
    DWORD2(v23) = 2;
    DWORD1(v26) = 6;
    *(_QWORD *)&v23 = 0x200000050;
    if (!*(_DWORD *)(a1 + 1564))
      goto LABEL_27;
LABEL_15:
    *(_QWORD *)(a1 + 1472) -= mach_absolute_time();
    goto LABEL_28;
  }
  DWORD2(v23) = 2;
  *(_QWORD *)((char *)&v26 + 4) = 6;
  *(_QWORD *)&v23 = 0x300000050;
  if (*(_DWORD *)(a1 + 1564))
    goto LABEL_15;
LABEL_27:
  clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 1384));
  clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 1368));
  clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a1 + 1352));
LABEL_28:
  v10 = sss_create_ids(a2, 0, a4, a3, &v22);
  if (!*(_DWORD *)(a1 + 1564))
  {
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 1416));
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 1432));
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a1 + 1400));
    v18 = *(_QWORD *)(a1 + 1408)
        - *(_QWORD *)(a1 + 1360)
        + 1000000000 * (*(_QWORD *)(a1 + 1400) - *(_QWORD *)(a1 + 1352));
    *(_QWORD *)(a1 + 1448) = v18;
    *(_QWORD *)(a1 + 1472) += v18;
    v19 = *(_QWORD *)(a1 + 1424)
        - *(_QWORD *)(a1 + 1376)
        + 1000000000 * (*(_QWORD *)(a1 + 1416) - *(_QWORD *)(a1 + 1368));
    *(_QWORD *)(a1 + 1456) = v19;
    *(_QWORD *)(a1 + 1480) += v19;
    v20 = *(_QWORD *)(a1 + 1440)
        - *(_QWORD *)(a1 + 1392)
        + 1000000000 * (*(_QWORD *)(a1 + 1432) - *(_QWORD *)(a1 + 1384));
    *(_QWORD *)(a1 + 1464) = v20;
    *(_QWORD *)(a1 + 1488) += v20;
    ++*(_DWORD *)(a1 + 1496);
    if (*(_DWORD *)(a1 + 1564))
      goto LABEL_30;
LABEL_32:
    log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v11, v12, v13, v14, v15, v16, v17, (char)&str_4_1);
    return v10;
  }
  *(_QWORD *)(a1 + 1472) += mach_absolute_time();
  if (!*(_DWORD *)(a1 + 1564))
    goto LABEL_32;
LABEL_30:
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 1500), (double)*(uint64_t *)(a1 + 1472) * 0.000001);
  putchar(10);
  return v10;
}

void vl_match_sss(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, int a5, int *a6, _QWORD *a7)
{
  uint64_t v12;
  float *v13;
  float *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float *v26;
  const float *v27;
  uint64_t v28;
  const float *v29;
  float *v30;
  unint64_t v31;
  uint64_t v32;
  int32x2_t *v33;
  float32x2_t *v34;
  int32x2_t v35;
  __int128 v36;
  __int128 v37;
  int v38;
  uint64_t v39;
  __int128 v40;
  float32x4x2_t v41;
  float32x4x2_t v42;
  float32x4x2_t v43;

  v12 = *a2 / a5;
  v13 = (float *)malloc_type_calloc(2 * (int)v12, 4uLL, 0x100004052888210uLL);
  v14 = v13;
  v15 = *a6;
  v36 = xmmword_210BCC1A0;
  v37 = xmmword_210BCC1B0;
  v38 = 0;
  v39 = 0x3DCCCCCD3F800000;
  v40 = xmmword_210BCC1C0;
  if (v15 <= 199)
  {
    switch(v15)
    {
      case 'd':
        HIDWORD(v39) = 1065353216;
        v38 = 1;
        DWORD2(v37) = 2;
        v16 = 0x800000040;
        goto LABEL_20;
      case 'e':
        v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 4;
        v16 = 0xA00000040;
        goto LABEL_20;
      case 'f':
        v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 10;
        v16 = 0x1000000040;
        goto LABEL_20;
      case 'g':
        v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 2;
        v16 = 0x600000040;
        goto LABEL_20;
      case 'h':
        v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 2;
        goto LABEL_19;
      default:
        if (v15)
          goto LABEL_36;
        if ((int)v12 < 1)
          goto LABEL_27;
        goto LABEL_21;
    }
  }
  if (v15 > 201)
  {
    if (v15 == 202)
    {
      DWORD2(v37) = 2;
      *(_QWORD *)((char *)&v40 + 4) = 0x100000006;
LABEL_19:
      v16 = 0x400000050;
    }
    else
    {
      if (v15 != 706)
LABEL_36:
        __assert_rtn("sss_par_version", "sss.c", 255, "0 && \"Not implemented\"");
      v38 = 1;
      DWORD2(v37) = 2;
      HIDWORD(v39) = 1065353216;
      DWORD2(v40) = 2;
      v16 = 0x800000060;
    }
  }
  else
  {
    DWORD2(v37) = 2;
    if (v15 == 200)
    {
      DWORD1(v40) = 6;
      v16 = 0x200000050;
    }
    else
    {
      *(_QWORD *)((char *)&v40 + 4) = 6;
      v16 = 0x300000050;
    }
  }
LABEL_20:
  *(_QWORD *)&v37 = v16;
  if ((int)v12 >= 1)
  {
LABEL_21:
    v17 = a2[1];
    v18 = (float)(255 * a5);
    v19 = (char *)a7[1];
    if (v13)
    {
      v20 = 0;
      v21 = (uint64_t)v13;
      do
      {
        sss_knn(a4, (uint64_t)&v36, v18, v17 + v20 * *(int *)(a4 + 260), v19, v21, 2);
        ++v20;
        v19 += 8;
        v21 += 8;
      }
      while (v12 != v20);
    }
    else
    {
      v22 = 0;
      do
      {
        sss_knn(a4, (uint64_t)&v36, v18, v17 + v22 * *(int *)(a4 + 260), v19, 0, 2);
        ++v22;
        v19 += 8;
      }
      while (v12 != v22);
    }
  }
LABEL_27:
  if ((int)a7[3] >= 1)
  {
    v23 = a7[3];
    v24 = a7[4];
    if (v23 < 8)
    {
      v25 = 0;
LABEL_33:
      v31 = v23 - v25;
      v32 = 8 * v25;
      v33 = (int32x2_t *)&v14[2 * v25];
      v34 = (float32x2_t *)(v24 + v32);
      do
      {
        v35 = *v33++;
        *v34++ = vcvt_f32_s32(v35);
        --v31;
      }
      while (v31);
      goto LABEL_35;
    }
    v25 = a7[3] & 0x7FFFFFF8;
    v26 = (float *)(v24 + 32);
    v27 = v14 + 8;
    v28 = a7[3] & 0xFFFFFFF8;
    do
    {
      v29 = v27 - 8;
      v41 = vld2q_f32(v29);
      v42 = vld2q_f32(v27);
      v43.val[0] = vcvtq_f32_s32((int32x4_t)v41.val[0]);
      v43.val[1] = vcvtq_f32_s32((int32x4_t)v41.val[1]);
      v30 = v26 - 8;
      vst2q_f32(v30, v43);
      v41.val[0] = vcvtq_f32_s32((int32x4_t)v42.val[0]);
      v41.val[1] = vcvtq_f32_s32((int32x4_t)v42.val[1]);
      vst2q_f32(v26, v41);
      v26 += 16;
      v27 += 16;
      v28 -= 8;
    }
    while (v28);
    if ((v23 & 7) != 0)
      goto LABEL_33;
  }
LABEL_35:
  free(v14);
}

uint64_t vl_pose_p2p(float *a1, float *a2, float *a3, float *a4, float *a5, float *a6)
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;

  v6 = *a1;
  v7 = a1[1];
  v8 = *a2;
  v9 = a2[1];
  v10 = a3[1];
  v11 = a3[2];
  v12 = a4[1];
  v13 = a4[2];
  v14 = *a5;
  v15 = a5[1];
  v17 = a5[6];
  v16 = a5[7];
  v113 = (float)(v10 * (float)(v15 - (float)(v16 * *a1))) + (float)(*a3 * (float)(*a5 - (float)(v17 * *a1)));
  v18 = a5[8];
  v19 = a5[2];
  v20 = a5[3];
  v21 = v19 - (float)(v18 * *a1);
  v22 = *a5 - (float)(v17 * *a2);
  v23 = v15 - (float)(v16 * *a2);
  v107 = v19;
  v24 = v19 - (float)(v18 * *a2);
  v25 = a5[4];
  v26 = a5[5];
  v27 = (float)(v10 * (float)(v25 - (float)(v16 * v7))) + (float)(*a3 * (float)(v20 - (float)(v17 * v7)));
  v28 = v26 - (float)(v18 * v7);
  v29 = v20 - (float)(v17 * v9);
  v30 = v25 - (float)(v16 * v9);
  v114 = v18;
  v112 = v26;
  v31 = v26 - (float)(v18 * v9);
  v32 = v7 - v9;
  v33 = (float)((float)(v7 - v9)
              * (float)((float)((float)((float)(v113 - (float)(v11 * v21)) - (float)(*a4 * v22)) - (float)(v12 * v23))
                      + (float)(v13 * v24)))
      - (float)((float)(*a1 - *a2)
              * (float)((float)((float)((float)(v27 - (float)(v11 * v28)) - (float)(*a4 * v29)) - (float)(v12 * v30))
                      + (float)(v13 * v31)));
  v108 = *a1;
  v111 = v7;
  v34 = v10;
  v35 = (float)((float)(v7 - v9)
              * (float)((float)((float)((float)(v10 * (float)((float)(v6 * (float)(v17 * -2.0)) + (float)(v14 * 2.0)))
                                      - (float)(*a3 * (float)((float)(v6 * (float)(v16 * -2.0)) + (float)(v15 * 2.0))))
                              - (float)(v12 * (float)((float)(v8 * (float)(v17 * -2.0)) + (float)(v14 * 2.0))))
                      + (float)(*a4 * (float)((float)(v8 * (float)(v16 * -2.0)) + (float)(v15 * 2.0)))))
      - (float)((float)(v6 - v8)
              * (float)((float)((float)((float)(v10 * (float)((float)(v7 * (float)(v17 * -2.0)) + (float)(v20 * 2.0)))
                                      - (float)(*a3 * (float)((float)(v7 * (float)(v16 * -2.0)) + (float)(v25 * 2.0))))
                              - (float)(v12 * (float)((float)(v9 * (float)(v17 * -2.0)) + (float)(v20 * 2.0))))
                      + (float)(*a4 * (float)((float)(v9 * (float)(v16 * -2.0)) + (float)(v25 * 2.0)))));
  v109 = *a1 - *a2;
  v110 = v12;
  v36 = sqrtf((float)((float)((float)(v109* (float)((float)((float)((float)(v27 + (float)(v11 * v28)) - (float)(*a4 * v29))- (float)(v12 * v30))- (float)(v13 * v31)))- (float)(v32* (float)((float)((float)((float)(v113 + (float)(v11 * v21)) - (float)(*a4 * v22))- (float)(v12 * v23))- (float)(v13 * v24))))* (float)(v33 * -4.0))+ (float)(v35 * v35));
  v37 = (float)(v36 - v35) / (float)(v33 + v33);
  v38 = v17;
  v39 = (float)((float)-v35 - v36) / (float)(v33 + v33);
  v40 = (float)(v37 * v37) + 1.0;
  v41 = (float)(v37 * v37) + -1.0;
  v42 = (float)(v41 * (float)-v17) + (float)((float)(v16 + v16) * v37);
  v43 = v7 * (float)-v18;
  v44 = (float)((float)((float)(v43 * v40) + (float)(v26 * v40)) * (float)-v11)
      + (float)(*a3 * (float)((float)((float)((float)(v25 * -2.0) * v37) + (float)(v7 * v42)) + (float)(v20 * v41)));
  v45 = (float)(v39 * v39) + -1.0;
  v46 = (float)(v45 * (float)-v17) + (float)((float)(v16 + v16) * v39);
  v47 = (float)(v39 * v39) + 1.0;
  v48 = (float)((float)((float)(v43 * v47) + (float)(v112 * v47)) * (float)-v11)
      + (float)(*a3 * (float)((float)((float)((float)(v25 * -2.0) * v39) + (float)(v7 * v46)) + (float)(v20 * v45)));
  v49 = *a1 * (float)-v114;
  v50 = (float)(v15 * -2.0) * v37;
  v51 = (float)((float)((float)(v50 + (float)(*a1 * v42)) + (float)(*a5 * v41)) * (float)-*a3)
      + (float)(v11 * (float)((float)(v49 * v40) + (float)(v107 * v40)));
  v52 = (float)(v15 * -2.0) * v39;
  v53 = (float)((float)((float)(v52 + (float)(*a1 * v46)) + (float)(*a5 * v45)) * (float)-*a3)
      + (float)(a3[2] * (float)((float)(v49 * v47) + (float)(v107 * v47)));
  v54 = *a2 * (float)-v114;
  v55 = (float)(v16 * v41) + (float)((float)(v38 + v38) * v37);
  v56 = (float)((float)((float)(v52 + (float)(*a2 * v46)) + (float)(*a5 * v45)) * (float)-*a4)
      + (float)(v13 * (float)((float)(v54 * v47) + (float)(v107 * v47)));
  v57 = (float)((float)((float)((float)(v50 + (float)(v8 * v42)) + (float)(v14 * v41)) * (float)-*a4)
              + (float)(v13 * (float)((float)(v54 * v40) + (float)(v107 * v40))))
      + (float)((float)-v110
              * (float)((float)((float)((float)(v14 + v14) * v37) - (float)(v8 * v55)) + (float)(v15 * v41)));
  v58 = (float)(v16 * v45) + (float)((float)(v38 + v38) * v39);
  v59 = v56
      + (float)((float)-v110
              * (float)((float)((float)((float)(v14 + v14) * v39) - (float)(*a2 * v58)) + (float)(v15 * v45)));
  v60 = v44
      + (float)(v34 * (float)((float)((float)((float)(v20 + v20) * v37) - (float)(v111 * v55)) + (float)(v25 * v41)));
  v61 = (float)((float)((float)(v14 + v14) * v37) - (float)(*a1 * v55)) + (float)(v15 * v41);
  v62 = (float)((float)(v51 - (float)(v34 * v61)) - v57) / (float)(v109 * v40);
  v63 = -v34;
  v64 = -(float)(v51 + (float)((float)-v34 * v61));
  v65 = v48
      + (float)(v34 * (float)((float)((float)((float)(v20 + v20) * v39) - (float)(v111 * v58)) + (float)(v25 * v45)));
  v66 = (float)((float)((float)(v14 + v14) * v39) - (float)(*a1 * v58)) + (float)(v15 * v45);
  v67 = (float)((float)(v53 - (float)(v34 * v66)) - v59) / (float)(v109 * v47);
  v68 = -(float)(v53 + (float)(v63 * v66));
  v69 = (float)(1.0 - (float)(v37 * v37)) / v40;
  v70 = (float)(v37 + v37) / v40;
  v71 = (float)((float)((float)(*a5 * v69) + 0.0) + (float)(v15 * v70)) + (float)(v107 * 0.0);
  v72 = (float)((float)(0.0 - (float)(*a5 * v70)) + (float)(v15 * v69)) + (float)(v107 * 0.0);
  v73 = v107 + (float)((float)((float)(*a5 * 0.0) + 0.0) + (float)(v15 * 0.0));
  v74 = (float)((float)((float)(v20 * v69) + 0.0) + (float)(v25 * v70)) + (float)(v112 * 0.0);
  v75 = (float)((float)(0.0 - (float)(v20 * v70)) + (float)(v25 * v69)) + (float)(v112 * 0.0);
  v76 = v112 + (float)((float)((float)(v20 * 0.0) + 0.0) + (float)(v25 * 0.0));
  v77 = (float)((float)((float)(v38 * v69) + 0.0) + (float)(v16 * v70)) + (float)(v114 * 0.0);
  v78 = (float)((float)(0.0 - (float)(v38 * v70)) + (float)(v16 * v69)) + (float)(v114 * 0.0);
  v79 = v114 + (float)((float)((float)(v38 * 0.0) + 0.0) + (float)(v16 * 0.0));
  v80 = (float)-(float)(v64 + (float)((float)(*a1 * v62) * v40)) / v40;
  v81 = (float)-(float)(v60 + (float)((float)(v111 * v62) * v40)) / v40;
  *a6 = v77;
  a6[1] = v71;
  a6[2] = v74;
  a6[3] = v78;
  a6[8] = v76;
  a6[9] = (float)((float)(0.0 - (float)(v77 * v62)) + (float)(v71 * v80)) + (float)(v74 * v81);
  a6[6] = v79;
  a6[7] = v73;
  a6[4] = v72;
  a6[5] = v75;
  a6[10] = (float)((float)(0.0 - (float)(v78 * v62)) + (float)(v72 * v80)) + (float)(v75 * v81);
  a6[11] = (float)((float)(0.0 - (float)(v79 * v62)) + (float)(v73 * v80)) + (float)(v76 * v81);
  v82 = (float)(1.0 - (float)(v39 * v39)) / v47;
  v83 = (float)(v39 + v39) / v47;
  v84 = a5[1];
  v85 = a5[2];
  v86 = a5[3];
  v87 = (float)((float)((float)(*a5 * v82) + 0.0) + (float)(v84 * v83)) + (float)(v85 * 0.0);
  v88 = (float)((float)(0.0 - (float)(*a5 * v83)) + (float)(v84 * v82)) + (float)(v85 * 0.0);
  v89 = v85 + (float)((float)((float)(*a5 * 0.0) + 0.0) + (float)(v84 * 0.0));
  v90 = a5[4];
  v91 = a5[5];
  v92 = (float)((float)((float)(v86 * v82) + 0.0) + (float)(v90 * v83)) + (float)(v91 * 0.0);
  v93 = (float)((float)(0.0 - (float)(v86 * v83)) + (float)(v90 * v82)) + (float)(v91 * 0.0);
  v94 = v91 + (float)((float)((float)(v86 * 0.0) + 0.0) + (float)(v90 * 0.0));
  v95 = a5[6];
  v96 = a5[7];
  v97 = (float)((float)(v95 * v82) + 0.0) + (float)(v96 * v83);
  v98 = (float)(0.0 - (float)(v95 * v83)) + (float)(v96 * v82);
  v99 = (float)((float)(v95 * 0.0) + 0.0) + (float)(v96 * 0.0);
  v100 = a5[8];
  v101 = v97 + (float)(v100 * 0.0);
  v102 = v98 + (float)(v100 * 0.0);
  v103 = v100 + v99;
  v104 = (float)-(float)(v68 + (float)((float)(v108 * v67) * v47)) / v47;
  v105 = (float)-(float)(v65 + (float)((float)(v111 * v67) * v47)) / v47;
  a6[12] = v101;
  a6[13] = v87;
  a6[14] = v92;
  a6[15] = v102;
  a6[18] = v103;
  a6[19] = v89;
  a6[16] = v88;
  a6[17] = v93;
  a6[20] = v94;
  a6[21] = (float)((float)(0.0 - (float)(v101 * v67)) + (float)(v87 * v104)) + (float)(v92 * v105);
  a6[22] = (float)((float)(0.0 - (float)(v102 * v67)) + (float)(v88 * v104)) + (float)(v93 * v105);
  a6[23] = (float)((float)(0.0 - (float)(v103 * v67)) + (float)(v89 * v104)) + (float)(v94 * v105);
  return 2;
}

uint64_t vl_pose_p2p_z(float *a1, float *a2, float *a3, float *a4, uint64_t a5)
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;

  v5 = *a1;
  v6 = a1[1];
  v7 = *a2;
  v8 = a2[1];
  v9 = *a3;
  v10 = a3[1];
  v11 = a3[2];
  v12 = *a4;
  v13 = a4[1];
  v14 = a4[2];
  v15 = (float)((float)(*a3 + (float)(v10 * *a1)) - *a4) - (float)(v13 * *a2);
  v16 = *a1 - *a2;
  v17 = (float)((float)(v6 - v8) * v15)
      - (float)(v16 * (float)((float)((float)-(float)(v11 - (float)(v10 * v6)) - (float)(v13 * v8)) + v14));
  v18 = (float)((float)(v6 - v8) * (float)((float)((float)(v10 - (float)(*a3 * *a1)) - v13) + (float)(*a4 * *a2)))
      - (float)(v16 * (float)((float)(v8 * *a4) - (float)(*a3 * v6)));
  v19 = v18 + v18;
  v20 = sqrtf((float)((float)((float)(v16 * (float)((float)((float)(v11 + (float)(v10 * v6)) - (float)(v13 * v8)) - v14))- (float)((float)(v6 - v8) * v15))* (float)(v17 * -4.0))+ (float)(v19 * v19));
  v21 = (float)(v20 - v19) / (float)(v17 + v17);
  v22 = -v13;
  v23 = -v11;
  v24 = (float)((float)-v19 - v20) / (float)(v17 + v17);
  v25 = v6 * (float)-*a3;
  v26 = -(float)(v10 * v6);
  v27 = 1.0 / v16;
  v28 = 1.0 - (float)(v21 * v21);
  v29 = (float)(v21 * v21) + 1.0;
  v30 = 1.0 / v29;
  v31 = v28 * (float)(1.0 / v29);
  v32 = v21 + v21;
  v33 = (float)((float)(v29 * v23) + (float)(v25 * (float)(v21 + v21))) + (float)(v26 * v28);
  v34 = (float)(*a3 * (float)(v28 + (float)(v5 * (float)(v21 + v21))))
      - (float)(v10 * (float)((float)(v21 * 2.0) - (float)(v5 * v28)));
  v35 = (float)(1.0 / v29)
      * (float)(v27
              * (float)(v34
                      - (float)((float)((float)((float)(v21 * 2.0) - (float)(v7 * v28)) * v22)
                              - (float)(*a4 * (float)-(float)(v28 + (float)(v7 * (float)(v21 + v21)))))));
  v36 = v33 + (float)((float)(v6 * v35) * v29);
  v37 = (float)(1.0 / v29) * (float)-(float)(v34 - (float)((float)(*a1 * v35) * v29));
  v38 = -(float)(v32 * v30);
  v39 = -(float)(v28 * v30);
  *(float *)a5 = v38;
  *(float *)(a5 + 4) = v31;
  *(float *)(a5 + 12) = v39;
  *(float *)(a5 + 16) = v38;
  *(_DWORD *)(a5 + 8) = 0;
  *(_OWORD *)(a5 + 20) = xmmword_210BCDD60;
  *(float *)(a5 + 36) = -(float)((float)(v31 * v37) + (float)(v38 * v35));
  *(float *)(a5 + 40) = -(float)((float)(v38 * v37) + (float)(v39 * v35));
  v40 = -(float)(v36 * v30);
  v41 = 1.0 - (float)(v24 * v24);
  v42 = (float)(v24 * v24) + 1.0;
  v43 = v41 * (float)(1.0 / v42);
  v44 = (float)(v9 * (float)(v41 + (float)(v5 * (float)(v24 + v24))))
      - (float)(v10 * (float)((float)(v24 * 2.0) - (float)(v5 * v41)));
  v45 = (float)(1.0 / v42)
      * (float)(v27
              * (float)(v44
                      - (float)((float)((float)((float)(v24 * 2.0) - (float)(v7 * v41)) * v22)
                              - (float)(v12 * (float)-(float)(v41 + (float)(v7 * (float)(v24 + v24)))))));
  v46 = (float)(1.0 / v42) * (float)-(float)(v44 - (float)((float)(v5 * v45) * v42));
  v47 = -(float)((float)(v24 + v24) * (float)(1.0 / v42));
  *(float *)(a5 + 44) = v40;
  *(float *)(a5 + 48) = v47;
  *(float *)(a5 + 52) = v43;
  *(float *)(a5 + 60) = -v43;
  *(float *)(a5 + 64) = v47;
  *(_DWORD *)(a5 + 56) = 0;
  *(_OWORD *)(a5 + 68) = xmmword_210BCDD60;
  *(float *)(a5 + 84) = -(float)((float)(v43 * v46) + (float)(v47 * v45));
  *(float *)(a5 + 88) = -(float)((float)(v47 * v46) + (float)((float)-v43 * v45));
  *(float *)(a5 + 92) = -(float)((float)((float)((float)((float)(v42 * v23) + (float)(v25 * (float)(v24 + v24)))
                                               + (float)(v26 * v41))
                                       + (float)((float)(v6 * v45) * v42))
                               * (float)(1.0 / v42));
  return 2;
}

void lbl_par_ver(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  unint64_t v13;

  *(_OWORD *)(a1 + 232) = xmmword_210BCDD70;
  *(_DWORD *)(a1 + 12) = 256;
  *(_QWORD *)(a1 + 224) = 0x3BA3D70A00000004;
  *(_QWORD *)(a1 + 216) = 0x177000000008;
  *(_QWORD *)(a1 + 4) = 3;
  *(_QWORD *)(a1 + 256) = 0;
  *(_DWORD *)(a1 + 248) = 0;
  memset_pattern16((void *)(a1 + 16), &unk_210BCDDC0, 0xC8uLL);
  *(_DWORD *)(a1 + 16) = 1149239296;
  *(_QWORD *)(a1 + 268) = 0x3E800000BE800000;
  *(_DWORD *)a1 = a2;
  if (a2 <= 999)
  {
    switch(a2)
    {
      case 1:
      case 2:
      case 3:
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 58, (uint64_t)"lbl_par_ver", "Deprecate lbl version %d", a2);
        abort();
      case 4:
        v4 = 100;
        goto LABEL_34;
      case 5:
        *(_DWORD *)(a1 + 236) = 100;
LABEL_28:
        v8 = 2000;
        goto LABEL_31;
      case 6:
        *(_DWORD *)(a1 + 236) = 100;
LABEL_30:
        v8 = 2001;
LABEL_31:
        *(_DWORD *)(a1 + 244) = v8;
        *(_DWORD *)(a1 + 12) = 256;
        return;
      case 7:
LABEL_23:
        *(_QWORD *)(a1 + 236) = 0xBB800000064;
        *(_DWORD *)(a1 + 12) = 128;
        return;
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
        goto LABEL_61;
      case 33:
        *(_DWORD *)(a1 + 236) = 103;
        *(_DWORD *)(a1 + 12) = 256;
        return;
      case 34:
        v4 = 104;
LABEL_34:
        *(_DWORD *)(a1 + 236) = v4;
        *(_QWORD *)(a1 + 16) = 0xBF8000003F000000;
        *(_DWORD *)(a1 + 12) = 256;
        return;
      case 35:
        *(_DWORD *)(a1 + 236) = 105;
        *(_DWORD *)(a1 + 216) = 32;
        *(_DWORD *)(a1 + 12) = 128;
        return;
      case 36:
        v9 = 3001;
        goto LABEL_42;
      case 37:
        *(_DWORD *)(a1 + 236) = 3001;
        *(_QWORD *)(a1 + 16) = 0xBF8000003F000000;
        *(_QWORD *)(a1 + 224) = 0x3C03126FFFFFFFFFLL;
        v10 = xmmword_210BCDDB0;
        goto LABEL_39;
      case 38:
        *(_DWORD *)(a1 + 236) = 3001;
        *(_QWORD *)(a1 + 16) = 0xBF8000003F000000;
        *(_QWORD *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        v10 = xmmword_210BCDD80;
LABEL_39:
        *(_OWORD *)(a1 + 252) = v10;
        v11 = 0x177000000020;
LABEL_48:
        *(_QWORD *)(a1 + 216) = v11;
        *(_DWORD *)(a1 + 12) = 64;
        return;
      case 39:
        *(_DWORD *)(a1 + 236) = 3100;
        *(_QWORD *)(a1 + 16) = 0xBF8000003F000000;
        *(_DWORD *)(a1 + 12) = 64;
        *(_QWORD *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_210BCDD80;
        *(_QWORD *)(a1 + 216) = 0x177000000020;
        return;
      case 40:
        v9 = 3002;
LABEL_42:
        *(_DWORD *)(a1 + 236) = v9;
        *(_QWORD *)(a1 + 16) = 0xBF8000003F000000;
        *(_DWORD *)(a1 + 216) = 32;
        *(_DWORD *)(a1 + 12) = 64;
        return;
      default:
        if (a2 != 807)
        {
          if (a2 == 808)
          {
            *(_DWORD *)(a1 + 236) = 104;
            *(_QWORD *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
            *(_QWORD *)(a1 + 216) = 0x7D000000001;
            *(_OWORD *)(a1 + 252) = xmmword_210BCDD80;
            *(_DWORD *)(a1 + 12) = 256;
            return;
          }
          goto LABEL_61;
        }
        *(_DWORD *)(a1 + 236) = 104;
        *(_QWORD *)(a1 + 224) = 0x3B83126FFFFFFFFFLL;
        *(_QWORD *)(a1 + 252) = 0xC00000001;
        *(_DWORD *)(a1 + 264) = 1;
        *(_QWORD *)(a1 + 216) = 0x5DC00000001;
        *(_DWORD *)(a1 + 12) = 256;
        break;
    }
  }
  else
  {
    if (a2 <= 2099)
    {
      switch(a2)
      {
        case 1000:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          *(_DWORD *)(a1 + 216) = 1;
          *(_DWORD *)(a1 + 12) = 256;
          return;
        case 1001:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          *(_OWORD *)(a1 + 16) = xmmword_210BCDDA0;
          *(_DWORD *)(a1 + 32) = -1082130432;
          *(_DWORD *)(a1 + 12) = 256;
          return;
        case 1002:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          *(_OWORD *)(a1 + 16) = xmmword_210BCDD90;
          *(_DWORD *)(a1 + 12) = 256;
          return;
        case 1003:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          goto LABEL_28;
        case 1004:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          goto LABEL_30;
        case 1005:
          *(_DWORD *)(a1 + 224) = -1;
          goto LABEL_23;
        case 1006:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          v7 = 2;
          goto LABEL_59;
        default:
          if (a2 == 2000)
          {
            log_msg(2, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 206, (uint64_t)"lbl_par_ver", "Please just use version 1000 with input_type=2");
            v5 = 100;
            goto LABEL_26;
          }
          if (a2 == 2001)
          {
            log_msg(2, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 212, (uint64_t)"lbl_par_ver", "Please just use version 3004 with input_type=2");
            v5 = 104;
LABEL_26:
            *(_DWORD *)(a1 + 236) = v5;
            *(_DWORD *)(a1 + 224) = -1;
            *(_DWORD *)(a1 + 12) = 256;
            return;
          }
          break;
      }
LABEL_61:
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 349, (uint64_t)"lbl_par_ver", "Unknown lbl version %d", a2);
      abort();
    }
    switch(a2)
    {
      case 3003:
        v5 = 103;
        goto LABEL_26;
      case 3004:
        *(_DWORD *)(a1 + 236) = 104;
        *(_DWORD *)(a1 + 224) = -1;
        v7 = 1;
        *(_DWORD *)(a1 + 216) = 1;
        goto LABEL_59;
      case 3005:
        *(_DWORD *)(a1 + 236) = 105;
        *(_QWORD *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_210BCDD80;
        *(_QWORD *)(a1 + 216) = 0x7D000000020;
        *(_DWORD *)(a1 + 12) = 128;
        return;
      case 3006:
        *(_DWORD *)(a1 + 236) = 3001;
        *(_DWORD *)(a1 + 224) = -1;
        *(_DWORD *)(a1 + 216) = 32;
        goto LABEL_55;
      case 3007:
        *(_DWORD *)(a1 + 236) = 3001;
        *(_QWORD *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_210BCDD80;
        v11 = 0x5DC00000020;
        goto LABEL_48;
      case 3008:
        v12 = 3001;
        goto LABEL_52;
      case 3009:
        *(_DWORD *)(a1 + 236) = 104;
        *(_QWORD *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_210BCDD80;
        *(_QWORD *)(a1 + 216) = 0x7D000000020;
        goto LABEL_58;
      case 3010:
        v12 = 3002;
LABEL_52:
        *(_DWORD *)(a1 + 236) = v12;
        v13 = 0xFFFFD70AFFFFFFFFLL;
        goto LABEL_54;
      case 3011:
        *(_DWORD *)(a1 + 236) = 3003;
        v13 = 0xD70A00000004;
LABEL_54:
        *(_QWORD *)(a1 + 224) = v13 & 0xFFFFFFFFFFFFLL | 0x3BA3000000000000;
        *(_OWORD *)(a1 + 252) = xmmword_210BCDD80;
        *(_QWORD *)(a1 + 216) = 0x7D000000020;
LABEL_55:
        *(_DWORD *)(a1 + 4) = 1;
        *(_DWORD *)(a1 + 12) = 64;
        return;
      default:
        if (a2 == 2100)
        {
          v6 = 100;
        }
        else
        {
          if (a2 != 2101)
            goto LABEL_61;
          v6 = 104;
        }
        *(_DWORD *)(a1 + 236) = v6;
        *(_DWORD *)(a1 + 224) = -1;
LABEL_58:
        v7 = 1;
LABEL_59:
        *(_DWORD *)(a1 + 4) = v7;
        *(_DWORD *)(a1 + 12) = 256;
        break;
    }
  }
}

void vl_sift_desc(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  float32x4_t *v6;
  char *v7;
  float *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  int8x16_t *v12;
  int8x16_t v13;
  int8x16_t v14;
  float *v15;
  int *v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  __float2 v26;
  float *v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  int32x4_t v41;
  uint64_t v42;
  float v43;
  float v45;
  int v47;
  uint64_t v48;
  BOOL v49;
  float *v50;
  float v51;
  float v52;
  float *v53;
  float v54;
  uint64_t v56;
  float *v57;
  float v58;
  int v60;
  uint64_t v61;
  float v62;
  BOOL v63;
  float v64;
  uint64_t v65;
  float v66;
  float v67;
  float *v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float *v73;
  float v74;
  float v75;
  double v76;
  int32x4_t v77;
  double v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  int32x4_t v91;
  int v92;
  float v93;
  int v94;
  float v95;
  double v96;
  float v97;
  int v98;
  float v99;
  float v100;
  int v101;
  float *v102;
  int v103;
  int v105;
  float *v106;
  float *v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  double v114;
  int v115;
  float v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int32x4_t v121;
  uint64_t v122;
  int v123;
  int64_t v124;
  float v125;
  float v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  float *v131;
  int v132;
  float *v133;
  uint64_t v134;
  char *v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  signed int v141;
  uint64_t v142;
  float *v143;
  unint64_t v144;
  float *v145;
  int32x4_t v146;
  signed int *v147;
  int v148;
  signed int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  _QWORD *v153;
  int32x4_t v154;
  uint64_t v155;
  float32x4_t v156;
  float32x4_t v157;
  int32x4_t v158;
  signed int *v159;
  signed int v160;
  signed int v161;
  float v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  int32x4_t v172;
  int32x4_t v173;
  int32x4_t v174;
  float32x4_t v175;
  float32x4_t v176;
  float *v177;
  uint16x4_t *v178;
  uint64_t v179;
  uint16x8_t *v180;
  uint16x8_t *v181;
  uint64_t v182;
  float32x4_t v183;
  float32x4_t v184;
  uint16x8_t v185;
  float32x4_t v186;
  float32x4_t v187;
  uint16x8_t v188;
  uint16x8_t v189;
  uint16x8_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  float *v194;
  int v195;
  unsigned __int16 *v196;
  float v197;
  uint64_t v198;
  uint64_t v199;
  float32x4_t v200;
  int32x2_t v201;
  uint64_t v202;
  int v203;
  float *v204;
  char *v205;
  int v206;
  uint64_t v207;
  int32x2_t v208;
  uint64_t v209;
  float32x4_t v210;
  int8x16_t v211;
  int8x16_t v212;
  int8x16_t v213;
  int8x16_t v214;
  int8x16_t v215;
  int8x16_t v216;
  int8x16_t v217;
  int8x16_t v218;
  int8x16_t v219;
  int8x16_t v220;
  int8x16_t v221;
  int8x16_t v222;
  int8x16_t v223;
  int8x16_t v224;
  int8x16_t v225;
  int8x16_t v226;
  int8x16_t v227;
  float32x4_t v228;
  uint64_t v229;
  float32x4_t v230;
  float32x4_t v231;
  float32x4_t v232;
  float32x4_t v233;
  float32x4_t v234;
  float32x4_t v235;
  float32x4_t v236;
  float32x4_t v237;
  float32x4_t v238;
  float32x4_t v239;
  float32x4_t v240;
  float32x4_t v241;
  float32x4_t v242;
  float32x4_t v243;
  float32x4_t v244;
  float32x4_t v245;
  float32x4_t v246;
  float32x4_t v247;
  int8x16_t *v248;
  float32x4_t v249;
  float32x4_t v250;
  int8x16_t v251;
  int8x16_t v252;
  float32x4_t v253;
  int8x16_t v254;
  int8x16_t v255;
  float32x4_t v256;
  float32x4_t v257;
  float32x4_t v258;
  float32x4_t v259;
  float32x4_t v260;
  float32x4_t v261;
  float32x4_t v262;
  float32x4_t v263;
  float32x4_t v264;
  float32x4_t v265;
  float32x4_t v266;
  float32x4_t v267;
  float32x4_t v268;
  float32x4_t v269;
  float32x4_t v270;
  float32x4_t v271;
  uint64_t v272;
  float v273;
  float v274;
  uint64_t v275;
  float *v276;
  float32x4_t v277;
  float32x4_t v278;
  int8x16_t v279;
  float32x4_t v280;
  int8x16_t v281;
  float32x4_t v282;
  int8x16_t v283;
  float32x4_t v284;
  float32x4_t v285;
  float32x4_t v286;
  float32x4_t v287;
  float32x4_t v288;
  float32x4_t v289;
  uint64_t v290;
  float *v291;
  float v292;
  float v293;
  float v294;
  BOOL v295;
  float v296;
  float v297;
  float v298;
  float v299;
  float v300;
  uint64_t v301;
  double v302;
  float v303;
  float32x4_t v304;
  uint64_t v305;
  float *v306;
  float32x4_t v307;
  float32x4_t *v308;
  float32x4_t v309;
  float32x4_t v310;
  float32x4_t v311;
  float32x4_t v312;
  float32x4_t v313;
  float64x2_t v314;
  float64x2_t v315;
  float64x2_t v316;
  float64x2_t v320;
  float64x2_t v321;
  float32x4_t v323;
  float32x4_t v324;
  float32x4_t v325;
  float32x4_t v326;
  float32x4_t v327;
  float32x4_t v328;
  float32x4_t v329;
  float32x4_t v330;
  uint64_t v331;
  double *v332;
  uint64_t v333;
  uint64_t v334;
  float *v335;
  float *v336;
  float v337;
  float v338;
  float v339;
  float v340;
  float v341;
  float32x4_t v342;
  uint64_t v343;
  float *v344;
  float64x2_t v345;
  float32x4_t v346;
  float32x4_t v347;
  float32x4_t v348;
  float32x4_t v349;
  float32x4_t v350;
  uint64_t v351;
  float *v352;
  float v353;
  float v354;
  float v355;
  float v356;
  float v357;
  float *v358;
  float *v359;
  float v360;
  float v361;
  float v362;
  float v363;
  float v364;
  float v365;
  float v366;
  float v367;
  float v368;
  float v369;
  float v370;
  float v371;
  float v372;
  float v373;
  float v374;
  unsigned int v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  char *v390;
  char *v391;
  char *v392;
  float *v393;
  uint64_t *v394;
  double v397;
  float v398;
  float v399;
  int v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  float *v406;
  float v407[8];
  _DWORD v408[70];
  float32x2_t v409;
  __int32 v410;
  __int32 v411;
  __int32 v412;
  __int32 v413;
  __int32 v414;
  __int32 v415;
  float32x2_t v416;
  float32x2_t v417;
  __int32 v418;
  __int32 v419;
  __int32 v420;
  __int32 v421;
  __int32 v422;
  __int32 v423;
  float32x2_t v424;
  float32x2_t v425;
  __int32 v426;
  __int32 v427;
  __int32 v428;
  __int32 v429;
  __int32 v430;
  __int32 v431;
  float32x2_t v432;
  float32x2_t v433;
  __int32 v434;
  __int32 v435;
  __int32 v436;
  __int32 v437;
  __int32 v438;
  __int32 v439;
  float32x2_t v440;
  float32x2_t v441;
  __int32 v442;
  __int32 v443;
  __int32 v444;
  __int32 v445;
  __int32 v446;
  __int32 v447;
  float32x2_t v448;
  float32x2_t v449;
  __int32 v450;
  __int32 v451;
  __int32 v452;
  __int32 v453;
  __int32 v454;
  __int32 v455;
  float32x2_t v456;
  float32x2_t v457;
  __int32 v458;
  __int32 v459;
  __int32 v460;
  __int32 v461;
  __int32 v462;
  __int32 v463;
  float32x2_t v464;
  float32x2_t v465;
  __int32 v466;
  __int32 v467;
  __int32 v468;
  __int32 v469;
  __int32 v470;
  __int32 v471;
  float32x2_t v472;
  float32x2_t v473;
  __int32 v474;
  __int32 v475;
  __int32 v476;
  __int32 v477;
  __int32 v478;
  __int32 v479;
  float32x2_t v480;
  float32x2_t v481;
  __int32 v482;
  __int32 v483;
  __int32 v484;
  __int32 v485;
  __int32 v486;
  __int32 v487;
  float32x2_t v488;
  float32x2_t v489;
  __int32 v490;
  __int32 v491;
  __int32 v492;
  __int32 v493;
  __int32 v494;
  __int32 v495;
  float32x2_t v496;
  float32x2_t v497;
  __int32 v498;
  __int32 v499;
  __int32 v500;
  __int32 v501;
  __int32 v502;
  __int32 v503;
  float32x2_t v504;
  float32x2_t v505;
  __int32 v506;
  __int32 v507;
  __int32 v508;
  __int32 v509;
  __int32 v510;
  __int32 v511;
  float32x2_t v512;
  float32x2_t v513;
  __int32 v514;
  __int32 v515;
  __int32 v516;
  __int32 v517;
  __int32 v518;
  __int32 v519;
  float32x2_t v520;
  float32x2_t v521;
  __int32 v522;
  __int32 v523;
  __int32 v524;
  __int32 v525;
  __int32 v526;
  __int32 v527;
  float32x2_t v528;
  float32x2_t v529;
  __int32 v530;
  __int32 v531;
  __int32 v532;
  __int32 v533;
  __int32 v534;
  __int32 v535;
  float32x2_t v536;
  float v537[6];
  float v538[6];
  __int128 v539;
  uint64_t v540;
  float32x4x2_t v541;
  float32x4x2_t v542;

  v540 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (*(_DWORD *)(a4 + 212))
    {
      *(_QWORD *)(a4 + 120) -= mach_absolute_time();
    }
    else
    {
      clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a4 + 32));
      clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a4 + 16));
      clock_gettime(_CLOCK_MONOTONIC, (timespec *)a4);
    }
  }
  v6 = (float32x4_t *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
  v7 = (char *)malloc_type_calloc(0x2208uLL, 4uLL, 0x100004052888210uLL);
  v8 = (float *)v7;
  if (*a2 >= 1)
  {
    v9 = 0;
    v393 = (float *)(v7 + 21780);
    v392 = v7 + 8712;
    v391 = v7 + 13068;
    v390 = v7 + 17424;
    v10 = 32;
    v11 = -0.5;
    v394 = a2;
    v406 = (float *)v7;
    do
    {
      v402 = a2[1];
      v15 = (float *)(v402 + 288 * v9);
      v16 = (int *)(*(_QWORD *)(a3 + 8) + 8 * v9);
      v17 = v16[1];
      v405 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 72 * *v16 + 8);
      v18 = 1.0 / (float)(1 << *v16);
      v19 = v15[1];
      if ((float)(v18 * *v15) <= 0.0)
        v20 = v11;
      else
        v20 = 0.5;
      v21 = v20 + (float)(*v15 * v18);
      if ((float)(v18 * v19) <= 0.0)
        v22 = v11;
      else
        v22 = 0.5;
      v23 = v22 + (float)(v19 * v18);
      v24 = v18 * (float)(v15[2] * 3.75);
      v25 = (float)(360.0 - v15[3]) * 3.14159265 / 180.0;
      *(float *)&v25 = v25;
      v397 = v25;
      v26 = __sincosf_stret(*(float *)&v25);
      bzero(v408, 0x5A0uLL);
      v27 = (float *)malloc_type_realloc(0, 0x1E0uLL, 0xF4287634uLL);
      v28 = v27;
      *(_OWORD *)v27 = 0u;
      *((_OWORD *)v27 + 1) = 0u;
      *((_OWORD *)v27 + 2) = 0u;
      *((_OWORD *)v27 + 3) = 0u;
      *((_OWORD *)v27 + 4) = 0u;
      *((_OWORD *)v27 + 5) = 0u;
      *((_OWORD *)v27 + 6) = 0u;
      *((_OWORD *)v27 + 7) = 0u;
      *((_OWORD *)v27 + 8) = 0u;
      *((_OWORD *)v27 + 9) = 0u;
      *((_OWORD *)v27 + 10) = 0u;
      *((_OWORD *)v27 + 11) = 0u;
      *((_OWORD *)v27 + 12) = 0u;
      *((_OWORD *)v27 + 13) = 0u;
      *((_OWORD *)v27 + 14) = 0u;
      *((_OWORD *)v27 + 15) = 0u;
      *((_OWORD *)v27 + 16) = 0u;
      *((_OWORD *)v27 + 17) = 0u;
      *((_OWORD *)v27 + 18) = 0u;
      *((_OWORD *)v27 + 19) = 0u;
      *((_OWORD *)v27 + 20) = 0u;
      *((_OWORD *)v27 + 21) = 0u;
      *((_OWORD *)v27 + 22) = 0u;
      *((_OWORD *)v27 + 23) = 0u;
      *((_OWORD *)v27 + 24) = 0u;
      *((_OWORD *)v27 + 25) = 0u;
      *((_OWORD *)v27 + 26) = 0u;
      *((_OWORD *)v27 + 27) = 0u;
      *((_OWORD *)v27 + 28) = 0u;
      *((_OWORD *)v27 + 29) = 0u;
      v398 = v21;
      v399 = v23;
      v29 = (float)(int)v21;
      v30 = (float)(int)v23;
      v31 = v29 - (float)(v26.__cosval * v24);
      v32 = v31 + (float)(v26.__sinval * v24);
      *(float *)v41.i32 = v30 + (float)(v26.__sinval * v24);
      v33 = *(float *)v41.i32 + (float)(v26.__cosval * v24);
      v407[0] = v32;
      v407[1] = v33;
      v34 = v29 + (float)(v26.__cosval * v24);
      v35 = v34 + (float)(v26.__sinval * v24);
      v36 = v30 - (float)(v26.__sinval * v24);
      v37 = v36 + (float)(v26.__cosval * v24);
      v407[2] = v35;
      v407[3] = v37;
      v38 = v34 - (float)(v26.__sinval * v24);
      v39 = v36 - (float)(v26.__cosval * v24);
      v407[4] = v38;
      v407[5] = v39;
      v40 = v31 - (float)(v26.__sinval * v24);
      *(float *)v41.i32 = *(float *)v41.i32 - (float)(v26.__cosval * v24);
      v407[6] = v40;
      v407[7] = *(float *)v41.i32;
      v539 = xmmword_210BCABD0;
      if (v37 >= v33)
      {
        v43 = vabds_f32(v37, v33);
        _NF = v35 < v32 && v43 < 0.001;
        if (_NF)
        {
          v33 = v37;
          v32 = v35;
          v42 = 1;
          if (v39 < v37)
          {
LABEL_30:
            v33 = v39;
            goto LABEL_31;
          }
        }
        else
        {
          v42 = 0;
          if (v39 < v33)
            goto LABEL_30;
        }
      }
      else
      {
        v33 = v37;
        v42 = 1;
        if (v39 < v37)
          goto LABEL_30;
      }
      v45 = vabds_f32(v39, v33);
      if (v38 < v32 && v45 < 0.001)
      {
        v33 = v39;
        v32 = v38;
LABEL_31:
        v42 = 2;
      }
      if (*(float *)v41.i32 >= v33)
      {
        v49 = vabds_f32(*(float *)v41.i32, v33) < 0.001 && v40 < v32;
        v48 = 3;
        if (!v49)
          v48 = v42;
        v47 = *(_DWORD *)((unint64_t)&v539 | (4 * v48));
      }
      else
      {
        v47 = 3;
        v48 = 3;
      }
      *(_DWORD *)((unint64_t)&v539 | (4 * v48)) = 0;
      LODWORD(v539) = v47;
      v50 = &v407[2 * v47];
      v51 = *v50;
      v52 = v50[1];
      v53 = &v407[2 * SDWORD1(v539)];
      v54 = v53[1];
      if (v54 <= v52)
      {
        if (vabds_f32(v37, v52) >= 0.001 || v35 <= v51)
        {
          v56 = 0;
          v54 = v52;
          v57 = &v407[2 * SDWORD2(v539)];
          v58 = v57[1];
          if (v58 > v52)
            goto LABEL_54;
          goto LABEL_49;
        }
        v51 = *v53;
      }
      v56 = 1;
      v57 = &v407[2 * SDWORD2(v539)];
      v58 = v57[1];
      if (v58 > v54)
        goto LABEL_54;
LABEL_49:
      if (vabds_f32(v39, v54) < 0.001 && v38 > v51)
      {
        v51 = *v57;
LABEL_54:
        v54 = v58;
        v56 = 2;
      }
      if (v407[2 * SHIDWORD(v539) + 1] <= v54)
      {
        v62 = vabds_f32(*(float *)v41.i32, v54);
        v63 = v40 > v51 && v62 < 0.001;
        v61 = 3;
        if (!v63)
          v61 = v56;
        v60 = *(_DWORD *)((unint64_t)&v539 | (4 * v61));
      }
      else
      {
        v60 = HIDWORD(v539);
        v61 = 3;
      }
      *(_DWORD *)((unint64_t)&v539 | (4 * v61)) = HIDWORD(v539);
      HIDWORD(v539) = v60;
      LODWORD(v61) = DWORD1(v539);
      v64 = v407[2 * SDWORD1(v539)];
      v65 = SDWORD2(v539);
      v66 = v407[2 * SDWORD2(v539)];
      v401 = 288 * v9;
      if (v64 <= v66)
      {
        v67 = v407[2 * SDWORD2(v539)];
        v61 = SDWORD2(v539);
        v66 = v407[2 * SDWORD1(v539)];
        v65 = SDWORD1(v539);
      }
      else
      {
        *(_QWORD *)((char *)&v539 + 4) = __PAIR64__(DWORD1(v539), DWORD2(v539));
        v67 = v64;
        v61 = (int)v61;
      }
      v68 = &v407[2 * (int)v539];
      v69 = *v68;
      v70 = v68[1];
      v71 = v407[2 * v65 + 1];
      v72 = v407[2 * v61 + 1];
      v73 = &v407[2 * v60];
      v75 = *v73;
      v74 = v73[1];
      v76 = round(v70);
      *(double *)v77.i64 = v70 - v76;
      if (*(double *)v77.i64 < 0.0)
        v78 = 0.0;
      else
        v78 = 1.0;
      v79 = v72 - v70;
      v80 = v69 - v67;
      v537[0] = v72 - v70;
      v537[1] = v69 - v67;
      v81 = (float)(v70 * (float)(v69 - v67)) + (float)(v69 * (float)(v72 - v70));
      v82 = v74 - v72;
      v537[2] = v81;
      v537[3] = v74 - v72;
      v83 = v67 - v75;
      v84 = (float)(v72 * (float)(v67 - v75)) + (float)(v67 * (float)(v74 - v72));
      v537[4] = v67 - v75;
      v537[5] = v84;
      v85 = v71 - v74;
      v86 = v75 - v66;
      v87 = (float)((float)(v75 - v66) * v74) + (float)(v75 * (float)(v71 - v74));
      v538[4] = v86;
      v538[5] = v87;
      v88 = v70 - v71;
      v89 = v66 - v69;
      v538[0] = v70 - v71;
      v538[1] = v66 - v69;
      v90 = (float)((float)(v66 - v69) * v71) + (float)(v66 * (float)(v70 - v71));
      v538[2] = v90;
      v538[3] = v71 - v74;
      *(double *)v91.i64 = v74 - round(v74);
      v92 = (int)(v76 + v78);
      if (v71 >= v72)
        v93 = v72;
      else
        v93 = v71;
      v94 = (int)(float)(v93 + 1.0);
      if (v71 <= v72)
        v95 = v72;
      else
        v95 = v71;
      if (*(double *)v91.i64 <= 0.0)
        v96 = 0.0;
      else
        v96 = 1.0;
      v97 = (float)v92;
      v98 = v94 - v92;
      if (v94 <= v92)
      {
        v98 = 0;
        v102 = v27;
        v103 = (int)(float)(v95 + 1.0);
        _VF = __OFSUB__(v103, v94);
        v105 = v103 - v94;
        if ((v105 < 0) ^ _VF | (v105 == 0))
          goto LABEL_87;
LABEL_85:
        v106 = &v537[3 * (v71 > v72)];
        v107 = &v538[3 * (v71 <= v72)];
        v108 = v107[1];
        v109 = -v107[2];
        v110 = *v107;
        v111 = v106[1];
        v112 = -v106[2];
        v113 = *v106;
        do
        {
          *(_DWORD *)v102 = vcvtps_s32_f32((float)-(float)(v109 + (float)(v108 * v97)) / v110);
          *((_DWORD *)v102 + 1) = vcvtms_s32_f32((float)-(float)(v112 + (float)(v111 * v97)) / v113);
          v102 += 2;
          v97 = v97 + 1.0;
          ++v98;
          --v105;
        }
        while (v105);
        goto LABEL_87;
      }
      v99 = -v90;
      v100 = -v81;
      v101 = v94 - v92;
      v102 = v27;
      do
      {
        *(_DWORD *)v102 = vcvtps_s32_f32((float)-(float)(v99 + (float)(v89 * v97)) / v88);
        *((_DWORD *)v102 + 1) = vcvtms_s32_f32((float)-(float)(v100 + (float)(v80 * v97)) / v79);
        v102 += 2;
        v97 = v97 + 1.0;
        --v101;
      }
      while (v101);
      v103 = (int)(float)(v95 + 1.0);
      _VF = __OFSUB__(v103, v94);
      v105 = v103 - v94;
      if (!((v105 < 0) ^ _VF | (v105 == 0)))
        goto LABEL_85;
LABEL_87:
      v114 = roundf(v74) + v96;
      v115 = (int)v114 - v103;
      v403 = v10;
      if ((int)v114 > v103)
      {
        v116 = -v84;
        v117 = (int)v114 - v103;
        do
        {
          *(_DWORD *)v102 = vcvtps_s32_f32((float)-(float)((float)(v86 * v97) - v87) / v85);
          *((_DWORD *)v102 + 1) = vcvtms_s32_f32((float)-(float)(v116 + (float)(v83 * v97)) / v82);
          v102 += 2;
          v97 = v97 + 1.0;
          --v117;
        }
        while (v117);
        v98 += v115;
      }
      v118 = v98;
      v404 = v9;
      if (v98 <= 60)
      {
        v120 = 60;
      }
      else
      {
        if (v98 <= 120)
          v119 = 120;
        else
          v119 = v98;
        v28 = (float *)malloc_type_realloc(v27, 8 * v119, 0x28075C5FuLL);
        bzero(v28 + 120, 8 * v118 - 480);
        v120 = v119;
      }
      v121.i64[0] = 0x100000001;
      v121.i64[1] = 0x100000001;
      v122 = v405 + 24 * v17;
      v123 = *(_DWORD *)(v122 + 8);
      v124 = *(int *)(v122 + 12);
      if ((float)(v24 * 1.4142) < v29
        && (float)(v24 * 1.4142) < v30
        && (float)((float)(v123 - 1) + (float)(v24 * -1.4142)) > v29
        && (float)((float)(v124 - 1) + (float)(v24 * -1.4142)) > v30)
      {
        v125 = 1.5;
        v126 = 10.0;
        goto LABEL_140;
      }
      v400 = v17;
      if (v92 > 0)
      {
        v127 = v118;
        v125 = 1.5;
        v126 = 10.0;
        v128 = v92;
        if (v118 + v92 < v124)
          goto LABEL_104;
        goto LABEL_120;
      }
      if ((int)v118 < 1)
      {
        v127 = 0;
        v125 = 1.5;
        v126 = 10.0;
        v134 = -v118;
        if (v118 < 0)
          goto LABEL_118;
      }
      else
      {
        v127 = 0;
        v129 = 0;
        v125 = 1.5;
        v126 = 10.0;
        do
        {
          if (v28 && v129 >= (1 - v92))
            *(_QWORD *)&v28[2 * v127++] = *(_QWORD *)&v28[2 * v129];
          ++v129;
        }
        while (v118 != v129);
        if (v127 > v120)
        {
          if (2 * v120 <= v127)
            v130 = v127;
          else
            v130 = 2 * v120;
          v131 = v28;
          v132 = v123;
          v133 = (float *)malloc_type_realloc(v131, 8 * v130, 0x48BD7F9AuLL);
          v120 = v130;
          v123 = v132;
          v121.i64[0] = 0x100000001;
          v121.i64[1] = 0x100000001;
          v28 = v133;
        }
        v134 = v127 - v118;
        if (v127 > v118)
        {
LABEL_118:
          v135 = (char *)&v28[2 * v118];
          v136 = v123;
          v137 = v120;
          bzero(v135, 8 * v134);
          v120 = v137;
          v123 = v136;
          v121.i64[0] = 0x100000001;
          v121.i64[1] = 0x100000001;
        }
      }
      v92 = 1;
      v128 = 1;
      if (v127 + 1 < v124)
      {
LABEL_104:
        v118 = v127;
        v17 = v400;
        if (v118 < 1)
          goto LABEL_162;
        goto LABEL_129;
      }
LABEL_120:
      if (v127 < 1)
      {
        v118 = 0;
        v140 = -v127;
        if (v127 < 0)
          goto LABEL_161;
      }
      else
      {
        v118 = 0;
        v138 = 0;
        v139 = ~v128 + v124;
        do
        {
          if (v138 < v139 && v28)
            *(_QWORD *)&v28[2 * v118++] = *(_QWORD *)&v28[2 * v138];
          ++v138;
        }
        while (v138 < v127);
        if (v118 > v120)
        {
          v202 = 2 * v120;
          if (2 * v120 <= v118)
            v202 = v118;
          v203 = v123;
          v204 = (float *)malloc_type_realloc(v28, 8 * v202, 0xCA99F1EBuLL);
          v123 = v203;
          v121.i64[0] = 0x100000001;
          v121.i64[1] = 0x100000001;
          v28 = v204;
          v140 = v118 - v127;
          if (v118 > v127)
          {
LABEL_161:
            v205 = (char *)&v28[2 * v127];
            v206 = v123;
            bzero(v205, 8 * v140);
            v123 = v206;
            v121.i64[0] = 0x100000001;
            v121.i64[1] = 0x100000001;
            v17 = v400;
            if (v118 < 1)
            {
LABEL_162:
              free(v28);
              v8 = v406;
              goto LABEL_163;
            }
            goto LABEL_129;
          }
        }
        else
        {
          v140 = v118 - v127;
          if (v118 > v127)
            goto LABEL_161;
        }
      }
      v17 = v400;
      if (v118 < 1)
        goto LABEL_162;
LABEL_129:
      v141 = v123 - 2;
      if ((unint64_t)v118 < 8)
      {
        v142 = 0;
LABEL_134:
        v147 = (signed int *)&v28[2 * v142 + 1];
        do
        {
          v148 = *(v147 - 1);
          if (v148 <= 1)
            v148 = 1;
          *(v147 - 1) = v148;
          v149 = *v147;
          if (*v147 >= v141)
            v149 = v141;
          *v147 = v149;
          v147 += 2;
          ++v142;
        }
        while (v118 != v142);
        goto LABEL_140;
      }
      v142 = v118 & 0x7FFFFFFFFFFFFFF8;
      v77 = vdupq_n_s32(v141);
      v143 = v28 + 8;
      v144 = v118 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v145 = v143 - 8;
        v541 = vld2q_f32(v145);
        v542 = vld2q_f32(v143);
        v146 = vmaxq_s32((int32x4_t)v541.val[0], v121);
        v91 = vminq_s32((int32x4_t)v541.val[1], v77);
        v41 = vmaxq_s32((int32x4_t)v542.val[0], v121);
        v541.val[1] = (float32x4_t)vminq_s32((int32x4_t)v542.val[1], v77);
        vst2q_f32(v145, *(float32x4x2_t *)(&v91 - 1));
        vst2q_f32(v143, *(float32x4x2_t *)v41.i8);
        v143 += 16;
        v144 -= 8;
      }
      while (v144);
      if (v118 != v142)
        goto LABEL_134;
LABEL_140:
      if (v118 < 1)
        goto LABEL_162;
      v150 = 0;
      LODWORD(v151) = 0;
      v152 = (uint64_t *)(v405 + 24 * v17);
      *(float *)v77.i32 = (float)(2.4997 / v24) * v26.__cosval;
      *(float *)v41.i32 = (float)(2.4997 / v24) * v26.__sinval;
      v153 = v152 + 2;
      v154 = vdupq_n_s32((int)v398);
      v155 = v92;
      v156 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.i8, 0);
      v157 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.i8, 0);
      v8 = v406;
      v158.i64[0] = 0x800000008;
      v158.i64[1] = 0x800000008;
      do
      {
        while (1)
        {
          v159 = (signed int *)&v28[2 * v150];
          v160 = *v159;
          v161 = v159[1];
          if (v161 >= v160)
            break;
          ++v155;
          if (++v150 == v118)
            goto LABEL_153;
        }
        v162 = (float)(v155 - (int)v399);
        *(float *)v91.i32 = (float)-*(float *)v41.i32 * v162;
        *(float *)v121.i32 = *(float *)v77.i32 * v162;
        v163 = *v152;
        v164 = *v153 * v155;
        v165 = v155++ - 1;
        v166 = (int)v151;
        v167 = (v161 - v160);
        v168 = 2 * *v153;
        if (v167 < 7)
        {
          v169 = v160;
          v151 = (int)v151;
LABEL_149:
          v191 = 0;
          v192 = v163 + 2 * v169 + v168 * v155;
          v193 = v163 + 2 * v169 + v168 * v165;
          v194 = &v8[v151];
          v195 = v161 - v169 + 1;
          v196 = (unsigned __int16 *)(v163 + 2 * (v169 + v164) + 2);
          do
          {
            v197 = (float)(v169 - (int)v398 + v191);
            v194[1089] = *(float *)v91.i32 + (float)(v197 * *(float *)v77.i32);
            *v194 = *(float *)v121.i32 + (float)(v197 * *(float *)v41.i32);
            v194[2178] = (float)(*v196 - *(v196 - 2));
            v194[3267] = (float)(*(unsigned __int16 *)(v193 + 2 * v191) - *(unsigned __int16 *)(v192 + 2 * v191));
            ++v191;
            ++v194;
            ++v196;
          }
          while (v195 != (_DWORD)v191);
          LODWORD(v151) = v151 + v191;
          goto LABEL_152;
        }
        v170 = v167 + 1;
        v171 = (v167 + 1) & 0x1FFFFFFF8;
        v169 = v171 + v160;
        v151 = v171 + (int)v151;
        v172 = vdupq_n_s32(v160);
        v173 = vaddq_s32(v172, (int32x4_t)xmmword_210BCDE90);
        v174 = vaddq_s32(v172, (int32x4_t)xmmword_210BCABD0);
        v175 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v91.i8, 0);
        v176 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v121.i8, 0);
        v177 = &v8[v166];
        v178 = (uint16x4_t *)(v163 + 2 * (v164 + v160) + 2);
        v179 = 2 * v160;
        v180 = (uint16x8_t *)(v163 + v179 + v168 * v165);
        v181 = (uint16x8_t *)(v163 + v179 + v168 * v155);
        v182 = v171;
        do
        {
          v183 = vcvtq_f32_s32(vsubq_s32(v174, v154));
          v184 = vcvtq_f32_s32(vsubq_s32(v173, v154));
          *(float32x4_t *)(v177 + 1089) = vmlaq_f32(v175, v156, v183);
          *(float32x4_t *)(v177 + 1093) = vmlaq_f32(v175, v156, v184);
          *(float32x4_t *)v177 = vmlaq_f32(v176, v157, v183);
          *((float32x4_t *)v177 + 1) = vmlaq_f32(v176, v157, v184);
          v185 = *(uint16x8_t *)&v178[-1].u8[4];
          v186 = vcvtq_f32_s32((int32x4_t)vsubl_u16(*v178, *(uint16x4_t *)v185.i8));
          v187 = vcvtq_f32_s32((int32x4_t)vsubl_high_u16(*(uint16x8_t *)v178->i8, v185));
          *(float32x4_t *)(v177 + 2178) = v186;
          *(float32x4_t *)(v177 + 2182) = v187;
          v188 = *v180++;
          v189 = v188;
          v190 = *v181++;
          *(float32x4_t *)(v177 + 3267) = vcvtq_f32_s32((int32x4_t)vsubl_u16(*(uint16x4_t *)v189.i8, *(uint16x4_t *)v190.i8));
          *(float32x4_t *)(v177 + 3271) = vcvtq_f32_s32((int32x4_t)vsubl_high_u16(v189, v190));
          v174 = vaddq_s32(v174, v158);
          v173 = vaddq_s32(v173, v158);
          v177 += 8;
          v178 += 2;
          v182 -= 8;
        }
        while (v182);
        v8 = v406;
        if (v170 != v171)
          goto LABEL_149;
LABEL_152:
        ++v150;
      }
      while (v150 != v118);
LABEL_153:
      free(v28);
      if ((int)v151 >= 1)
      {
        v198 = v151;
        if (v151 >= 4)
        {
          v199 = v151 & 0x7FFFFFFC;
          v275 = v151 & 0xFFFFFFFC;
          v276 = v8;
          v201 = *(int32x2_t *)&v397;
          do
          {
            v277 = *(float32x4_t *)(v276 + 3267);
            v278 = *(float32x4_t *)(v276 + 2178);
            v279 = (int8x16_t)vcltzq_f32(v278);
            v280 = (float32x4_t)vbslq_s8(v279, (int8x16_t)vnegq_f32(v278), (int8x16_t)v278);
            v281 = (int8x16_t)vcltzq_f32(v277);
            v282 = (float32x4_t)vbslq_s8(v281, (int8x16_t)vnegq_f32(v277), (int8x16_t)v277);
            v283 = (int8x16_t)vcgtq_f32(v282, v280);
            v284 = vdivq_f32((float32x4_t)vbslq_s8(v283, (int8x16_t)v280, (int8x16_t)v282), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v280, v282), (int8x16_t)v280, (int8x16_t)v282));
            v285 = vmulq_f32(v284, v284);
            v286 = vmlaq_f32(v284, v284, vmulq_f32(v285, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEA7BE2C), v285, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E232344u), (float32x4_t)vdupq_n_s32(0xBD3E7316), v285))));
            v287 = (float32x4_t)vbslq_s8(v283, (int8x16_t)vsubq_f32((float32x4_t)vdupq_n_s32(0x3FC90FDBu), v286), (int8x16_t)v286);
            v288 = (float32x4_t)vbslq_s8(v279, (int8x16_t)vsubq_f32((float32x4_t)vdupq_n_s32(0x40490FDBu), v287), (int8x16_t)v287);
            v289 = (float32x4_t)vbslq_s8(v281, (int8x16_t)vnegq_f32(v288), (int8x16_t)v288);
            *((int8x16_t *)v276 + 1089) = vandq_s8((int8x16_t)v289, vorrq_s8((int8x16_t)vcltzq_f32(v289), (int8x16_t)vcgezq_f32(v289)));
            v276 += 4;
            v275 -= 4;
          }
          while (v275);
          v200.i64[0] = 0x4100000041000000;
          v200.i64[1] = 0x4100000041000000;
          if (v199 != v151)
            goto LABEL_180;
        }
        else
        {
          v199 = 0;
          v200.i64[0] = 0x4100000041000000;
          v200.i64[1] = 0x4100000041000000;
          v201 = *(int32x2_t *)&v397;
LABEL_180:
          v290 = v151 - v199;
          v291 = (float *)&v392[4 * v199];
          do
          {
            v292 = v291[1089];
            v293 = -*v291;
            if (*v291 >= 0.0)
              v293 = *v291;
            v294 = -v292;
            if (v292 >= 0.0)
              v294 = v291[1089];
            v295 = v293 < v294;
            if (v293 >= v294)
              v296 = v294;
            else
              v296 = v293;
            if (v293 <= v294)
              v293 = v294;
            v297 = v296 / v293;
            v298 = v297
                 + (float)((float)((float)(v297 * v297)
                                 * (float)((float)((float)((float)((float)(v297 * v297) * -0.046496) + 0.15931)
                                                 * (float)(v297 * v297))
                                         + -0.32762))
                         * v297);
            if (v295)
              v298 = 1.5708 - v298;
            v299 = 3.1416 - v298;
            if (*v291 >= 0.0)
              v299 = v298;
            _NF = v292 < 0.0;
            v300 = -v299;
            if (!_NF)
              v300 = v299;
            v291[2178] = v300;
            ++v291;
            --v290;
          }
          while (v290);
        }
        if (v151 >= 4)
        {
          v301 = v151 & 0x7FFFFFFC;
          v305 = v151 & 0xFFFFFFFC;
          v306 = v8;
          v304.i64[0] = 0xC1000000C1000000;
          v304.i64[1] = 0xC1000000C1000000;
          v307.i64[0] = 0xBE000000BE000000;
          v307.i64[1] = 0xBE000000BE000000;
          do
          {
            v308 = (float32x4_t *)(v306 + 1089);
            v309 = *(float32x4_t *)(v306 + 2178);
            v310 = vmulq_f32(*(float32x4_t *)(v306 + 3267), *(float32x4_t *)(v306 + 3267));
            v311 = *(float32x4_t *)v306;
            v306 += 4;
            v312 = vmlaq_f32(v310, v309, v309);
            v313 = vmulq_f32(vmlaq_f32(vmulq_f32(*v308, *v308), v311, v311), v307);
            v314 = (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL);
            v315 = vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v313.f32), v314);
            v316 = vmulq_f64(vcvt_hight_f64_f32(v313), v314);
            __asm { FMOV            V4.2D, #1.0 }
            v320 = vaddq_f64(v316, _Q4);
            v321 = vaddq_f64(v315, _Q4);
            __asm { FMOV            V4.4S, #-23.0 }
            v323 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v321), v320);
            v324 = vmulq_f32(v323, v323);
            v325 = vmulq_f32(v324, v324);
            v326 = vmulq_f32(v325, v325);
            v327 = vmulq_f32(v326, v326);
            v328 = vmulq_f32(v327, v327);
            v329 = vmulq_f32(v328, v328);
            v330 = vmulq_f32(v329, v329);
            v308[1089] = vmulq_f32(vsqrtq_f32(v312), (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(v330, v330), (int8x16_t)vcgtq_f32(_Q4, v313)));
            v305 -= 4;
          }
          while (v305);
          v302 = 1.0;
          v303 = -0.125;
          if (v301 != v151)
            goto LABEL_204;
        }
        else
        {
          v301 = 0;
          v302 = 1.0;
          v303 = -0.125;
          v304.i64[0] = 0xC1000000C1000000;
          v304.i64[1] = 0xC1000000C1000000;
LABEL_204:
          v333 = v151 - v301;
          v334 = v301;
          v335 = (float *)&v391[4 * v301];
          v336 = &v8[v334];
          do
          {
            v337 = (float)((float)(v336[1089] * v336[1089]) + (float)(*v336 * *v336)) * v303;
            v338 = 0.0;
            if (v337 >= -23.0)
            {
              v339 = v337 * 0.00390625 + v302;
              v340 = (float)((float)(v339 * v339) * (float)(v339 * v339))
                   * (float)((float)(v339 * v339) * (float)(v339 * v339));
              v341 = (float)((float)(v340 * v340) * (float)(v340 * v340))
                   * (float)((float)(v340 * v340) * (float)(v340 * v340));
              v338 = (float)(v341 * v341) * (float)(v341 * v341);
            }
            v335[2178] = sqrtf((float)(*v335 * *v335) + (float)(v336[2178] * v336[2178])) * v338;
            ++v335;
            ++v336;
            --v333;
          }
          while (v333);
        }
        if (v151 >= 4)
        {
          v331 = v151 & 0x7FFFFFFC;
          v342 = (float32x4_t)vdupq_lane_s32(v201, 0);
          v343 = v151 & 0xFFFFFFFC;
          v344 = v8;
          v332 = (double *)&unk_210BCC000;
          do
          {
            v345 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
            v346 = vmulq_f32(vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)(v344 + 4356)), (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)(v344 + 4356)), v345)), vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)(v344 + 4356)), v345)), *(int8x16_t *)(v344 + 4356)), v342), (float32x4_t)vdupq_n_s32(0x3FA2F983u));
            v347 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(v346), (int8x16_t)vaddq_f32(v346, v200), (int8x16_t)v346);
            v348 = vrndmq_f32(v347);
            v349 = vsubq_f32(v347, v348);
            v350 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(v348), (int8x16_t)vaddq_f32(v348, v200), (int8x16_t)v348);
            *(int8x16_t *)(v344 + 6534) = vbslq_s8((int8x16_t)vcgeq_f32(v350, v200), (int8x16_t)vaddq_f32(v350, v304), (int8x16_t)v350);
            *(float32x4_t *)(v344 + 7623) = v349;
            v344 += 4;
            v343 -= 4;
          }
          while (v343);
          if (v331 != v151)
            goto LABEL_211;
        }
        else
        {
          v331 = 0;
          v332 = (double *)&unk_210BCC000;
LABEL_211:
          v351 = v151 - v331;
          v352 = (float *)&v390[4 * v331];
          do
          {
            v353 = *v352;
            if (*v352 < 0.0)
            {
              v354 = *v352 + v332[5];
              v353 = v354;
            }
            v355 = (float)(v353 - *(float *)v201.i32) * 1.2732;
            if (v355 < 0.0)
              v355 = v355 + 8.0;
            v356 = floorf(v355);
            v357 = v355 - v356;
            if (v356 < 0.0)
              v356 = v356 + 8.0;
            if (v356 >= 8.0)
              v356 = v356 + -8.0;
            v352[2178] = v356;
            v352[3267] = v357;
            ++v352;
            --v351;
          }
          while (v351);
        }
        v358 = v8;
        v359 = v393;
        do
        {
          while (1)
          {
            v371 = *v358 + v125;
            v372 = v358[1089] + v125;
            v373 = floorf(v371);
            v374 = floorf(v372);
            v375 = (int)(float)((float)((float)((float)(v374 * v126) + (float)(v373 * 60.0)) + (float)(int)v359[1089])
                              + 70.0);
            if (v375 >= 0x121)
              break;
            v360 = v359[2178];
            v361 = *v359 * v360;
            v362 = v371 - v373;
            v363 = v372 - v374;
            v364 = v363 * (float)(v362 * v361);
            v365 = (float)(1.0 - v363) * (float)(v362 * v361);
            v366 = 1.0 - v362;
            v367 = (float)(1.0 - v362) * v361;
            v368 = *v359 * (float)(1.0 - v360);
            v369 = v362 * v368;
            v370 = v366 * v368;
            *(float *)&v408[v375] = *(float *)&v408[v375] + (float)((float)(1.0 - v363) * v370);
            *(float *)&v408[v375 + 1] = (float)((float)(1.0 - v363) * v367) + *(float *)&v408[v375 + 1];
            *(float *)&v408[v375 + 10] = (float)(v363 * v370) + *(float *)&v408[v375 + 10];
            *(float *)&v408[v375 + 11] = (float)(v363 * v367) + *(float *)&v408[v375 + 11];
            *(float *)&v408[v375 + 60] = (float)((float)(1.0 - v363) * v369) + *(float *)&v408[v375 + 60];
            *(float *)&v408[v375 + 61] = v365 + *(float *)&v408[v375 + 61];
            *(float *)&v408[v375 + 70] = (float)(v363 * v369) + *(float *)&v408[v375 + 70];
            *(float *)&v408[v375 + 71] = v364 + *(float *)&v408[v375 + 71];
            ++v359;
            ++v358;
            if (!--v198)
              goto LABEL_163;
          }
          printf("%sWarning : ", (const char *)&unk_210BC3C5E);
          printf("Out of range (%d)", v375);
          putchar(10);
          ++v359;
          ++v358;
          --v198;
        }
        while (v198);
      }
LABEL_163:
      v207 = 0;
      v409 = vadd_f32(v416, v409);
      *(float32x2_t *)v6->f32 = v409;
      v6->i32[2] = v410;
      v6->i32[3] = v411;
      v6[1].i32[0] = v412;
      v6[1].i32[1] = v413;
      v6[1].i32[2] = v414;
      v6[1].i32[3] = v415;
      v417 = vadd_f32(v424, v417);
      *(float32x2_t *)v6[2].f32 = v417;
      v6[2].i32[2] = v418;
      v6[2].i32[3] = v419;
      v6[3].i32[0] = v420;
      v6[3].i32[1] = v421;
      v6[3].i32[2] = v422;
      v6[3].i32[3] = v423;
      v425 = vadd_f32(v432, v425);
      *(float32x2_t *)v6[4].f32 = v425;
      v6[4].i32[2] = v426;
      v6[4].i32[3] = v427;
      v6[5].i32[0] = v428;
      v6[5].i32[1] = v429;
      v6[5].i32[2] = v430;
      v6[5].i32[3] = v431;
      v433 = vadd_f32(v440, v433);
      *(float32x2_t *)v6[6].f32 = v433;
      v6[6].i32[2] = v434;
      v6[6].i32[3] = v435;
      v6[7].i32[0] = v436;
      v6[7].i32[1] = v437;
      v6[7].i32[2] = v438;
      v6[7].i32[3] = v439;
      v441 = vadd_f32(v448, v441);
      *(float32x2_t *)v6[8].f32 = v441;
      v6[8].i32[2] = v442;
      v6[8].i32[3] = v443;
      v6[9].i32[0] = v444;
      v6[9].i32[1] = v445;
      v6[9].i32[2] = v446;
      v6[9].i32[3] = v447;
      v449 = vadd_f32(v456, v449);
      *(float32x2_t *)v6[10].f32 = v449;
      v6[10].i32[2] = v450;
      v6[10].i32[3] = v451;
      v6[11].i32[0] = v452;
      v6[11].i32[1] = v453;
      v6[11].i32[2] = v454;
      v6[11].i32[3] = v455;
      v457 = vadd_f32(v464, v457);
      *(float32x2_t *)v6[12].f32 = v457;
      v6[12].i32[2] = v458;
      v6[12].i32[3] = v459;
      v6[13].i32[0] = v460;
      v6[13].i32[1] = v461;
      v6[13].i32[2] = v462;
      v6[13].i32[3] = v463;
      v465 = vadd_f32(v472, v465);
      *(float32x2_t *)v6[14].f32 = v465;
      v6[14].i32[2] = v466;
      v6[14].i32[3] = v467;
      v6[15].i32[0] = v468;
      v6[15].i32[1] = v469;
      v6[15].i32[2] = v470;
      v6[15].i32[3] = v471;
      v473 = vadd_f32(v480, v473);
      *(float32x2_t *)v6[16].f32 = v473;
      v6[16].i32[2] = v474;
      v6[16].i32[3] = v475;
      v6[17].i32[0] = v476;
      v6[17].i32[1] = v477;
      v6[17].i32[2] = v478;
      v6[17].i32[3] = v479;
      *(float32x2_t *)v6[18].f32 = vadd_f32(v488, v481);
      v6[18].i32[2] = v482;
      v6[18].i32[3] = v483;
      v6[19].i32[0] = v484;
      v6[19].i32[1] = v485;
      v6[19].i32[2] = v486;
      v6[19].i32[3] = v487;
      *(float32x2_t *)v6[20].f32 = vadd_f32(v496, v489);
      v6[20].i32[2] = v490;
      v6[20].i32[3] = v491;
      v6[21].i32[0] = v492;
      v6[21].i32[1] = v493;
      v6[21].i32[2] = v494;
      v6[21].i32[3] = v495;
      *(float32x2_t *)v6[22].f32 = vadd_f32(v504, v497);
      v6[22].i32[2] = v498;
      v6[22].i32[3] = v499;
      v6[23].i32[0] = v500;
      v6[23].i32[1] = v501;
      v6[23].i32[2] = v502;
      v6[23].i32[3] = v503;
      *(float32x2_t *)v6[24].f32 = vadd_f32(v512, v505);
      v6[24].i32[2] = v506;
      v6[24].i32[3] = v507;
      v6[25].i32[0] = v508;
      v6[25].i32[1] = v509;
      v6[25].i32[2] = v510;
      v6[25].i32[3] = v511;
      *(float32x2_t *)v6[26].f32 = vadd_f32(v520, v513);
      v6[26].i32[2] = v514;
      v6[26].i32[3] = v515;
      v6[27].i32[0] = v516;
      v6[27].i32[1] = v517;
      v6[27].i32[2] = v518;
      v6[27].i32[3] = v519;
      *(float32x2_t *)v6[28].f32 = vadd_f32(v528, v521);
      v6[28].i32[2] = v522;
      v6[28].i32[3] = v523;
      v6[29].i32[0] = v524;
      v6[29].i32[1] = v525;
      v6[29].i32[2] = v526;
      v6[29].i32[3] = v527;
      v208 = (int32x2_t)vadd_f32(v536, v529);
      *(int32x2_t *)v6[30].f32 = v208;
      v6[30].i32[2] = v530;
      v6[30].i32[3] = v531;
      v6[31].i32[0] = v532;
      v6[31].i32[1] = v533;
      v6[31].i32[2] = v534;
      v6[31].i32[3] = v535;
      v208.i32[0] = 0;
      do
      {
        *(float *)v208.i32 = *(float *)v208.i32 + (float)(v6->f32[v207] * v6->f32[v207]);
        ++v207;
      }
      while (v207 != 128);
      v209 = 0;
      *(float *)v208.i32 = sqrtf(*(float *)v208.i32) * 0.2;
      v210 = (float32x4_t)vdupq_lane_s32(v208, 0);
      v211 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[1]), (int8x16_t)v6[1], (int8x16_t)v210);
      *(int8x16_t *)v6 = vbslq_s8((int8x16_t)vcgtq_f32(v210, *v6), *(int8x16_t *)v6, (int8x16_t)v210);
      v6[1] = (float32x4_t)v211;
      v212 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[3]), (int8x16_t)v6[3], (int8x16_t)v210);
      v6[2] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[2]), (int8x16_t)v6[2], (int8x16_t)v210);
      v6[3] = (float32x4_t)v212;
      v213 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[5]), (int8x16_t)v6[5], (int8x16_t)v210);
      v6[4] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[4]), (int8x16_t)v6[4], (int8x16_t)v210);
      v6[5] = (float32x4_t)v213;
      v214 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[7]), (int8x16_t)v6[7], (int8x16_t)v210);
      v6[6] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[6]), (int8x16_t)v6[6], (int8x16_t)v210);
      v6[7] = (float32x4_t)v214;
      v215 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[9]), (int8x16_t)v6[9], (int8x16_t)v210);
      v6[8] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[8]), (int8x16_t)v6[8], (int8x16_t)v210);
      v6[9] = (float32x4_t)v215;
      v216 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[11]), (int8x16_t)v6[11], (int8x16_t)v210);
      v6[10] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[10]), (int8x16_t)v6[10], (int8x16_t)v210);
      v6[11] = (float32x4_t)v216;
      v217 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[13]), (int8x16_t)v6[13], (int8x16_t)v210);
      v6[12] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[12]), (int8x16_t)v6[12], (int8x16_t)v210);
      v6[13] = (float32x4_t)v217;
      v218 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[15]), (int8x16_t)v6[15], (int8x16_t)v210);
      v6[14] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[14]), (int8x16_t)v6[14], (int8x16_t)v210);
      v6[15] = (float32x4_t)v218;
      v219 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[17]), (int8x16_t)v6[17], (int8x16_t)v210);
      v6[16] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[16]), (int8x16_t)v6[16], (int8x16_t)v210);
      v6[17] = (float32x4_t)v219;
      v220 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[19]), (int8x16_t)v6[19], (int8x16_t)v210);
      v6[18] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[18]), (int8x16_t)v6[18], (int8x16_t)v210);
      v6[19] = (float32x4_t)v220;
      v221 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[21]), (int8x16_t)v6[21], (int8x16_t)v210);
      v6[20] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[20]), (int8x16_t)v6[20], (int8x16_t)v210);
      v6[21] = (float32x4_t)v221;
      v222 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[23]), (int8x16_t)v6[23], (int8x16_t)v210);
      v6[22] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[22]), (int8x16_t)v6[22], (int8x16_t)v210);
      v6[23] = (float32x4_t)v222;
      v223 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[25]), (int8x16_t)v6[25], (int8x16_t)v210);
      v6[24] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[24]), (int8x16_t)v6[24], (int8x16_t)v210);
      v6[25] = (float32x4_t)v223;
      v224 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[27]), (int8x16_t)v6[27], (int8x16_t)v210);
      v6[26] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[26]), (int8x16_t)v6[26], (int8x16_t)v210);
      v6[27] = (float32x4_t)v224;
      v225 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[29]), (int8x16_t)v6[29], (int8x16_t)v210);
      v6[28] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[28]), (int8x16_t)v6[28], (int8x16_t)v210);
      v6[29] = (float32x4_t)v225;
      v226 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[30]), (int8x16_t)v6[30], (int8x16_t)v210);
      v227 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[31]), (int8x16_t)v6[31], (int8x16_t)v210);
      v6[30] = (float32x4_t)v226;
      v6[31] = (float32x4_t)v227;
      v227.i32[0] = 0;
      a2 = v394;
      v228.i64[0] = 0x4400000044000000;
      v228.i64[1] = 0x4400000044000000;
      do
      {
        *(float *)v227.i32 = *(float *)v227.i32 + (float)(v6->f32[v209] * v6->f32[v209]);
        ++v209;
      }
      while (v209 != 128);
      v229 = 0;
      *(float *)v227.i32 = sqrtf(*(float *)v227.i32);
      v230 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v227.i8, 0);
      v231 = vdivq_f32(v6[1], v230);
      *v6 = vdivq_f32(*v6, v230);
      v6[1] = v231;
      v232 = vdivq_f32(v6[3], v230);
      v6[2] = vdivq_f32(v6[2], v230);
      v6[3] = v232;
      v233 = vdivq_f32(v6[5], v230);
      v6[4] = vdivq_f32(v6[4], v230);
      v6[5] = v233;
      v234 = vdivq_f32(v6[7], v230);
      v6[6] = vdivq_f32(v6[6], v230);
      v6[7] = v234;
      v235 = vdivq_f32(v6[9], v230);
      v6[8] = vdivq_f32(v6[8], v230);
      v6[9] = v235;
      v236 = vdivq_f32(v6[11], v230);
      v6[10] = vdivq_f32(v6[10], v230);
      v6[11] = v236;
      v237 = vdivq_f32(v6[13], v230);
      v6[12] = vdivq_f32(v6[12], v230);
      v6[13] = v237;
      v238 = vdivq_f32(v6[15], v230);
      v6[14] = vdivq_f32(v6[14], v230);
      v6[15] = v238;
      v239 = vdivq_f32(v6[17], v230);
      v6[16] = vdivq_f32(v6[16], v230);
      v6[17] = v239;
      v240 = vdivq_f32(v6[19], v230);
      v6[18] = vdivq_f32(v6[18], v230);
      v6[19] = v240;
      v241 = vdivq_f32(v6[21], v230);
      v6[20] = vdivq_f32(v6[20], v230);
      v6[21] = v241;
      v242 = vdivq_f32(v6[23], v230);
      v6[22] = vdivq_f32(v6[22], v230);
      v6[23] = v242;
      v243 = vdivq_f32(v6[25], v230);
      v6[24] = vdivq_f32(v6[24], v230);
      v6[25] = v243;
      v244 = vdivq_f32(v6[27], v230);
      v6[26] = vdivq_f32(v6[26], v230);
      v6[27] = v244;
      v245 = vdivq_f32(v6[29], v230);
      v6[28] = vdivq_f32(v6[28], v230);
      v6[29] = v245;
      v246 = vdivq_f32(v6[30], v230);
      v247 = vdivq_f32(v6[31], v230);
      v6[30] = v246;
      v6[31] = v247;
      do
      {
        v248 = (int8x16_t *)&v6[v229];
        v249 = vmulq_f32(v6[v229], v228);
        v250 = vmulq_f32(v6[v229 + 1], v228);
        v251 = (int8x16_t)vcltzq_f32(v249);
        v252 = (int8x16_t)vcltzq_f32(v250);
        v253 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v254 = (int8x16_t)vcgtq_f32(v249, v253);
        v255 = (int8x16_t)vcgtq_f32(v250, v253);
        *v248 = vbslq_s8(vbicq_s8(v254, v251), (int8x16_t)v253, vandq_s8((int8x16_t)v249, vbicq_s8(vmvnq_s8(v251), v254)));
        v248[1] = vbslq_s8(vbicq_s8(v255, v252), (int8x16_t)v253, vandq_s8((int8x16_t)v250, vbicq_s8(vmvnq_s8(v252), v255)));
        v229 += 2;
      }
      while (v229 != 32);
      v256 = vdivq_f32(v6[1], v253);
      *v6 = vdivq_f32(*v6, v253);
      v6[1] = v256;
      v257 = vdivq_f32(v6[3], v253);
      v6[2] = vdivq_f32(v6[2], v253);
      v6[3] = v257;
      v258 = vdivq_f32(v6[5], v253);
      v6[4] = vdivq_f32(v6[4], v253);
      v6[5] = v258;
      v259 = vdivq_f32(v6[7], v253);
      v6[6] = vdivq_f32(v6[6], v253);
      v6[7] = v259;
      v260 = vdivq_f32(v6[9], v253);
      v6[8] = vdivq_f32(v6[8], v253);
      v6[9] = v260;
      v261 = vdivq_f32(v6[11], v253);
      v6[10] = vdivq_f32(v6[10], v253);
      v6[11] = v261;
      v262 = vdivq_f32(v6[13], v253);
      v6[12] = vdivq_f32(v6[12], v253);
      v6[13] = v262;
      v263 = vdivq_f32(v6[15], v253);
      v6[14] = vdivq_f32(v6[14], v253);
      v6[15] = v263;
      v264 = vdivq_f32(v6[17], v253);
      v6[16] = vdivq_f32(v6[16], v253);
      v6[17] = v264;
      v265 = vdivq_f32(v6[19], v253);
      v6[18] = vdivq_f32(v6[18], v253);
      v6[19] = v265;
      v266 = vdivq_f32(v6[21], v253);
      v6[20] = vdivq_f32(v6[20], v253);
      v6[21] = v266;
      v267 = vdivq_f32(v6[23], v253);
      v6[22] = vdivq_f32(v6[22], v253);
      v6[23] = v267;
      v268 = vdivq_f32(v6[25], v253);
      v6[24] = vdivq_f32(v6[24], v253);
      v6[25] = v268;
      v269 = vdivq_f32(v6[27], v253);
      v6[26] = vdivq_f32(v6[26], v253);
      v6[27] = v269;
      v270 = vdivq_f32(v6[29], v253);
      v6[28] = vdivq_f32(v6[28], v253);
      v6[29] = v270;
      v271 = vdivq_f32(v6[31], v253);
      v6[30] = vdivq_f32(v6[30], v253);
      v6[31] = v271;
      if (v402 + v401 + 32 >= (unint64_t)&v6[32] || (unint64_t)v6 >= v402 + v401 + 160)
      {
        v12 = (int8x16_t *)(v402 + 288 * v404);
        v13.i64[0] = 0xBF000000BF000000;
        v13.i64[1] = 0xBF000000BF000000;
        v14.i64[0] = 0x3F0000003F000000;
        v14.i64[1] = 0x3F0000003F000000;
        v12[2] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(*v6, v253)), v14, v13), v253, *v6)), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[1], v253)), v14, v13), v253, v6[1]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[2], v253)), v14, v13), v253, v6[2])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[3], v253)), v14, v13), v253, v6[3]))));
        v12[3] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[4], v253)), v14, v13), v253, v6[4])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[5], v253)), v14, v13), v253, v6[5]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[6], v253)), v14, v13), v253, v6[6])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[7], v253)), v14, v13), v253, v6[7]))));
        v12[4] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[8], v253)), v14, v13), v253, v6[8])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[9], v253)), v14, v13), v253, v6[9]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[10], v253)), v14, v13), v253, v6[10])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[11], v253)), v14, v13), v253, v6[11]))));
        v12[5] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[12], v253)), v14, v13), v253, v6[12])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[13], v253)), v14, v13), v253, v6[13]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[14], v253)), v14, v13), v253, v6[14])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[15], v253)), v14, v13), v253, v6[15]))));
        v12[6] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[16], v253)), v14, v13), v253, v6[16])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[17], v253)), v14, v13), v253, v6[17]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[18], v253)), v14, v13), v253, v6[18])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[19], v253)), v14, v13), v253, v6[19]))));
        v12[7] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[20], v253)), v14, v13), v253, v6[20])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[21], v253)), v14, v13), v253, v6[21]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[22], v253)), v14, v13), v253, v6[22])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[23], v253)), v14, v13), v253, v6[23]))));
        v12[8] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[24], v253)), v14, v13), v253, v6[24])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[25], v253)), v14, v13), v253, v6[25]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[26], v253)), v14, v13), v253, v6[26])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[27], v253)), v14, v13), v253, v6[27]))));
        v12[9] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[28], v253)), v14, v13), v253, v6[28])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[29], v253)), v14, v13), v253, v6[29]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[30], v253)), v14, v13), v253, v6[30])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[31], v253)), v14, v13), v253, v6[31]))));
        v11 = -0.5;
      }
      else
      {
        v272 = 0;
        v11 = -0.5;
        do
        {
          v273 = v6->f32[v272];
          if ((float)(v273 * 255.0) <= 0.0)
            v274 = -0.5;
          else
            v274 = 0.5;
          *(_BYTE *)(v402 + v403 + v272++) = (int)(float)(v274 + (float)(v273 * 255.0));
        }
        while (v272 != 128);
      }
      v9 = v404 + 1;
      v10 = v403 + 288;
    }
    while (*v394 > v404 + 1);
  }
  free(v8);
  free(v6);
  if (a4)
  {
    if (*(_DWORD *)(a4 + 212))
    {
      *(_QWORD *)(a4 + 120) += mach_absolute_time();
      if (*(_DWORD *)(a4 + 212))
      {
LABEL_231:
        printf("Verbose : ");
        printf("Total time for %40s : %7.3f ms", (const char *)(a4 + 148), (double)*(uint64_t *)(a4 + 120) * 0.000001);
        putchar(10);
        return;
      }
    }
    else
    {
      clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a4 + 64));
      clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a4 + 80));
      clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a4 + 48));
      v383 = *(_QWORD *)(a4 + 56) - *(_QWORD *)(a4 + 8) + 1000000000 * (*(_QWORD *)(a4 + 48) - *(_QWORD *)a4);
      v384 = *(_QWORD *)(a4 + 72) - *(_QWORD *)(a4 + 24) + 1000000000 * (*(_QWORD *)(a4 + 64) - *(_QWORD *)(a4 + 16));
      v385 = *(_QWORD *)(a4 + 88) - *(_QWORD *)(a4 + 40) + 1000000000 * (*(_QWORD *)(a4 + 80) - *(_QWORD *)(a4 + 32));
      v386 = *(_QWORD *)(a4 + 128);
      v387 = v383 + *(_QWORD *)(a4 + 120);
      *(_QWORD *)(a4 + 96) = v383;
      *(_QWORD *)(a4 + 104) = v384;
      v388 = v384 + v386;
      *(_QWORD *)(a4 + 112) = v385;
      *(_QWORD *)(a4 + 120) = v387;
      v389 = v385 + *(_QWORD *)(a4 + 136);
      *(_QWORD *)(a4 + 128) = v388;
      *(_QWORD *)(a4 + 136) = v389;
      ++*(_DWORD *)(a4 + 144);
      if (*(_DWORD *)(a4 + 212))
        goto LABEL_231;
    }
    log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v376, v377, v378, v379, v380, v381, v382, (char)&str_4_1);
  }
}

double vl_par_default@<D0>(char *a1@<X8>)
{
  char *v1;
  double result;
  _BYTE __src[304];
  uint64_t v9;

  v1 = a1;
  v9 = *MEMORY[0x24BDAC8D0];
  bzero(a1, 0x3F0uLL);
  *((_QWORD *)v1 + 1) = 0x300000007;
  *(_QWORD *)(v1 + 20) = 0x412000003D75C28FLL;
  *(_QWORD *)(v1 + 28) = -3232969523;
  *((_DWORD *)v1 + 9) = 1061997773;
  *((_QWORD *)v1 + 5) = 0x700000003;
  *(_QWORD *)(v1 + 52) = 0xA3D75C28FLL;
  *(_QWORD *)(v1 + 60) = 0x53F000000;
  *(_QWORD *)(v1 + 68) = 0x3FC0000040900000;
  *(_QWORD *)(v1 + 76) = 0x3F4CCCCD00000024;
  *((_DWORD *)v1 + 22) = 1000;
  *(_QWORD *)(v1 + 92) = 0;
  *(_QWORD *)(v1 + 100) = 0x40000000000;
  *((_DWORD *)v1 + 28) = 942130604;
  *((_QWORD *)v1 + 19) = 0x6400000002;
  *((_QWORD *)v1 + 21) = 0x1400000000;
  *((_QWORD *)v1 + 30) = 0;
  *((_DWORD *)v1 + 62) = 0;
  *((_QWORD *)v1 + 58) = 0;
  *((_QWORD *)v1 + 59) = 0;
  *((_QWORD *)v1 + 57) = 0;
  *((_QWORD *)v1 + 22) = 0x186A000000002;
  v1 += 176;
  *((_QWORD *)v1 + 1) = 0x3F59999A3BDA740ELL;
  *((_QWORD *)v1 + 2) = 1061158912;
  *((_DWORD *)v1 + 6) = 1065353216;
  *(_OWORD *)(v1 + 28) = xmmword_210BCDF10;
  *(_QWORD *)(v1 + 44) = 0x8000000080000000;
  *((_DWORD *)v1 + 13) = 1065353216;
  *((_QWORD *)v1 + 7) = 0;
  *(_QWORD *)(v1 + 76) = 0x3FC000003F000000;
  *(_QWORD *)(v1 + 84) = 0x13F800000;
  *(_OWORD *)(v1 + 92) = xmmword_210BCDF20;
  *((_DWORD *)v1 + 27) = 0;
  *((_QWORD *)v1 + 14) = 1;
  *((_DWORD *)v1 + 30) = 1070386381;
  *((_DWORD *)v1 + 33) = 0;
  *(_QWORD *)(v1 + 124) = 0;
  *((_QWORD *)v1 + 17) = 0xFFFFFFFFFLL;
  *((_OWORD *)v1 + 9) = 0u;
  *((_OWORD *)v1 + 10) = 0u;
  *((_OWORD *)v1 + 11) = xmmword_210BCDF30;
  *((_QWORD *)v1 + 24) = 0x3C8EFA353F800000;
  *((_QWORD *)v1 + 25) = 0x143DB2B8C2;
  *((_QWORD *)v1 + 26) = 0x240000000;
  *((_QWORD *)v1 + 27) = 0;
  *((_QWORD *)v1 + 28) = 0x3F8000003A0EFA35;
  *((_DWORD *)v1 + 58) = 1061997773;
  *(_OWORD *)(v1 + 236) = xmmword_210BCDF40;
  *(_OWORD *)(v1 + 252) = xmmword_210BCDF50;
  *((_DWORD *)v1 + 67) = 1084227584;
  *((_QWORD *)v1 + 34) = 0x53DB2B8C2;
  *((_QWORD *)v1 + 38) = 0x434800003F7D70A4;
  *((_QWORD *)v1 + 39) = 1135542272;
  *((_QWORD *)v1 + 40) = 0;
  *(_OWORD *)(v1 + 328) = xmmword_210BCDF60;
  *((_DWORD *)v1 + 86) = 0;
  *(_OWORD *)(v1 + 348) = xmmword_210BCDF70;
  *(_QWORD *)(v1 + 364) = 0x3F8CCCCD00000005;
  *(_OWORD *)(v1 + 372) = xmmword_210BCDF80;
  *(_OWORD *)(v1 + 388) = xmmword_210BCDF90;
  *(_QWORD *)(v1 + 404) = 0x40A0000000000000;
  __asm { FMOV            V0.2S, #20.0 }
  *((_QWORD *)v1 - 7) = _D0;
  *((_QWORD *)v1 - 6) = 0;
  *((_QWORD *)v1 - 5) = 0;
  *((_QWORD *)v1 - 4) = 0x100000015;
  *(_OWORD *)(v1 + 412) = xmmword_210BCDFA0;
  *((_DWORD *)v1 + 107) = 1;
  *((_QWORD *)v1 + 54) = 0x600000000;
  *((_QWORD *)v1 + 55) = 1077936128;
  *((_QWORD *)v1 + 56) = 0x3FAACEE9F37BEBD5;
  *(_OWORD *)(v1 + 456) = xmmword_210BCDFB0;
  slam_tracker_vo_par_ver(0, (uint64_t)__src);
  *(_OWORD *)(v1 + 472) = xmmword_210BCDFC0;
  *((_QWORD *)v1 + 61) = 120;
  memcpy(v1 + 496, __src, 0x130uLL);
  *(_QWORD *)&result = 0xA00000000;
  *((_OWORD *)v1 + 50) = xmmword_210BCDFD0;
  return result;
}

void *plq_create_helper(_QWORD *a1, int a2, _DWORD *a3)
{
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  uint64_t v20;
  int v21;
  float v22;
  size_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float *v33;
  int *v34;
  uint64_t v35;
  float v36;
  int v37;
  int v38;
  float v39;
  float v40;
  int v41;
  uint64_t v42;
  int v43;
  int *v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  _DWORD *v52;
  int *v53;
  _DWORD *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  float v75;
  float *v76;
  float *v77;
  float *v78;
  float *v79;
  float v80;
  _QWORD v82[2];

  v82[1] = *MEMORY[0x24BDAC8D0];
  v6 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040C0F52B6EuLL);
  v7 = v6;
  v8 = *a1;
  *v6 = *a1;
  v6[1] = v8;
  v9 = *((float *)&v8 + 1);
  if (a2 <= 1)
  {
    v10 = a2;
    v13 = *((float *)&v8 + 1);
    v14 = *(float *)&v8;
  }
  else
  {
    v10 = a2;
    v11 = a2 - 1;
    v12 = (float *)a1 + 3;
    v13 = *((float *)&v8 + 1);
    v14 = *(float *)&v8;
    do
    {
      if (*(float *)&v8 >= *(v12 - 1))
        *(float *)&v8 = *(v12 - 1);
      if (v9 >= *v12)
        v9 = *v12;
      *(_DWORD *)v6 = v8;
      *((float *)v6 + 1) = v9;
      if (v14 <= *(v12 - 1))
        v14 = *(v12 - 1);
      v15 = *v12;
      v12 += 2;
      v16 = v15;
      if (v13 <= v15)
        v13 = v16;
      *((float *)v6 + 2) = v14;
      *((float *)v6 + 3) = v13;
      --v11;
    }
    while (v11);
  }
  v17 = v14 + 0.000001;
  v18 = v13 + 0.000001;
  *((float *)v6 + 2) = v17;
  *((float *)v6 + 3) = v18;
  v19 = (a2 + 4) / 5;
  v20 = (int)sqrt((double)v19);
  v21 = (v19 + (int)v20 - 1) / (int)v20;
  *((_DWORD *)v6 + 24) = v20;
  *((_DWORD *)v6 + 25) = v21;
  v22 = v17 - *(float *)&v8;
  *((float *)v6 + 28) = v22;
  *((float *)v6 + 26) = v22 / (float)v21;
  *((float *)v6 + 27) = (float)(v18 - v9) / (float)(int)v20;
  v23 = v21 * (int)v20;
  v6[7] = malloc_type_malloc(4 * v23, 0x100004052888210uLL);
  *((_QWORD *)v7 + 6) = malloc_type_malloc(4 * v23, 0x100004052888210uLL);
  *((_QWORD *)v7 + 5) = malloc_type_malloc(4 * (v21 * (int)v20 + 1), 0x100004052888210uLL);
  *((_QWORD *)v7 + 8) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((_QWORD *)v7 + 9) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((_QWORD *)v7 + 10) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((_QWORD *)v7 + 11) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((_QWORD *)v7 + 2) = malloc_type_malloc(8 * a2, 0x100004000313F17uLL);
  *((_QWORD *)v7 + 3) = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  *((_QWORD *)v7 + 4) = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  v24 = malloc_type_calloc(v23, 4uLL, 0x100004052888210uLL);
  v25 = MEMORY[0x24BDAC7A8](v24, v82);
  v28 = (char *)v82 - ((v27 + 15) & 0x7FFFFFFF0);
  if (a2 >= 1)
  {
    v29 = *((float *)v7 + 28);
    v30 = *(float *)v7;
    v31 = *((float *)v7 + 1);
    v32 = *((float *)v7 + 3) - v31;
    v33 = (float *)a1 + 1;
    v34 = (int *)v28;
    v35 = v10;
    do
    {
      v36 = (float)(*(v33 - 1) - v30) / v29;
      if (v36 < 0.0)
        v36 = 0.0;
      if (v36 > 1.0)
        v36 = 1.0;
      v37 = *((_DWORD *)v7 + 25);
      v38 = (int)(float)(v36 * (float)v37);
      v39 = *v33;
      v33 += 2;
      v40 = (float)(v39 - v31) / v32;
      if (v40 < 0.0)
        v40 = 0.0;
      if (v40 > 1.0)
        v40 = 1.0;
      v41 = v38 + v37 * (int)(float)(v40 * (float)*((int *)v7 + 24));
      v42 = 4 * v41;
      v43 = *(_DWORD *)(v25 + v42);
      *v34++ = v41;
      *(_DWORD *)(v25 + v42) = v43 + 1;
      --v35;
    }
    while (v35);
  }
  v44 = (int *)MEMORY[0x24BDAC7A8](v25, v26);
  v48 = (char *)v82 - v47;
  *(_DWORD *)((char *)v82 - v47) = 0;
  v49 = *((_QWORD *)v7 + 5);
  if ((int)v23 >= 1)
  {
    v50 = 0;
    v51 = v23;
    v52 = v48 + 4;
    v53 = v44;
    v54 = (_DWORD *)*((_QWORD *)v7 + 5);
    do
    {
      v55 = *v53++;
      *v54++ = v50;
      v50 += v55;
      *v52++ = v50;
      --v51;
    }
    while (v51);
  }
  *(_DWORD *)(v49 + 4 * v23) = a2;
  if (a2 >= 1)
  {
    do
    {
      v56 = *v46++;
      v57 = *(int *)&v48[4 * v56];
      *(_DWORD *)&v48[4 * v56] = v57 + 1;
      LODWORD(v56) = *a3++;
      v58 = 4 * v57;
      v59 = *((_QWORD *)v7 + 2);
      *(_DWORD *)(*((_QWORD *)v7 + 3) + v58) = v56;
      *(_QWORD *)(v59 + 8 * v57) = *a1;
      LODWORD(v56) = *(_DWORD *)a1++;
      *(float *)(*((_QWORD *)v7 + 4) + v58) = (float)(*(float *)&v56 - *(float *)v7) / *((float *)v7 + 28);
      --v10;
    }
    while (v10);
  }
  if ((int)v45 >= 1)
  {
    v60 = v45;
    if ((int)v20 >= 1)
    {
      v61 = 0;
      v63 = *((_QWORD *)v7 + 6);
      v62 = *((_QWORD *)v7 + 7);
      v64 = *((_QWORD *)v7 + 5);
      v65 = 4 * v45;
      v66 = v45 * (v20 - 1);
      do
      {
        v67 = 0;
        v68 = -1;
        v69 = v61;
        v70 = v20;
        do
        {
          *(_DWORD *)(v62 + v67) = v68;
          if (*(_DWORD *)(v64 + v67) != *(_DWORD *)(v64 + v67 + 4))
            v68 = v69;
          v69 += v45;
          v67 += v65;
          --v70;
        }
        while (v70);
        v71 = -1;
        v72 = 4 * ((int)v20 - 1) * v45;
        v73 = v66;
        v74 = (int)v20 + 1;
        do
        {
          *(_DWORD *)(v63 + v72) = v71;
          if (*(_DWORD *)(v64 + v72) != *(_DWORD *)(v64 + v72 + 4))
            v71 = v73;
          --v74;
          v73 -= v45;
          v72 -= v65;
        }
        while (v74 > 1);
        ++v61;
        v64 += 4;
        v62 += 4;
        ++v66;
        v63 += 4;
      }
      while (v61 != v45);
    }
    v75 = *(float *)v7;
    v76 = (float *)*((_QWORD *)v7 + 8);
    v77 = (float *)*((_QWORD *)v7 + 9);
    v78 = (float *)*((_QWORD *)v7 + 10);
    v79 = (float *)*((_QWORD *)v7 + 11);
    v80 = 0.0;
    do
    {
      *v76++ = v75;
      *v78++ = v80;
      v80 = (float)(1.0 / (float)v21) + v80;
      v75 = v75 + *((float *)v7 + 26);
      *v77++ = v75;
      *v79++ = v80;
      --v60;
    }
    while (v60);
  }
  free(v44);
  return v7;
}

_QWORD *plq_create_ids(_QWORD *a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  int32x4_t *v5;
  int v6;
  uint64_t i;
  _QWORD *helper;
  int32x4_t v9;
  int32x4_t *v10;
  int32x4_t v11;
  int32x4_t v12;
  uint64_t v13;
  uint64_t v14;
  float *v15;
  uint64_t v16;
  float *v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  int32x2_t *v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  float *v25;
  float32x4_t v26;
  float32x4_t v27;
  uint64_t v28;
  int32x2_t *v29;
  _QWORD v31[2];
  float32x4x2_t v32;
  float32x4x2_t v33;
  float32x4x2_t v34;
  float32x4x2_t v35;

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (!(_DWORD)a2)
    return 0;
  v2 = a2;
  MEMORY[0x24BDAC7A8](a1, a2);
  v5 = (int32x4_t *)((char *)v31 - v4);
  if (v6 < 1)
  {
    helper = plq_create_helper(a1, v2, (_QWORD *)((char *)v31 - v4));
    helper[15] = plq_create_helper(a1, v2, v5);
    return helper;
  }
  if (v2 < 8)
  {
    for (i = 0; i != v2; ++i)
LABEL_10:
      v5->i32[i] = i;
    goto LABEL_11;
  }
  i = v2 & 0xFFFFFFF8;
  v9 = (int32x4_t)xmmword_210BCABD0;
  v10 = v5 + 1;
  v11.i64[0] = 0x400000004;
  v11.i64[1] = 0x400000004;
  v12.i64[0] = 0x800000008;
  v12.i64[1] = 0x800000008;
  v13 = i;
  do
  {
    v10[-1] = v9;
    *v10 = vaddq_s32(v9, v11);
    v9 = vaddq_s32(v9, v12);
    v10 += 2;
    v13 -= 8;
  }
  while (v13);
  if (i != v2)
    goto LABEL_10;
LABEL_11:
  helper = plq_create_helper(a1, v2, v5);
  if (v2 < 8)
  {
    v14 = 0;
LABEL_16:
    v20 = v2 - v14;
    v21 = (int32x2_t *)&a1[v14];
    do
    {
      *v21 = vrev64_s32(*v21);
      ++v21;
      --v20;
    }
    while (v20);
    goto LABEL_18;
  }
  v14 = v2 & 0xFFFFFFF8;
  v15 = (float *)(a1 + 4);
  v16 = v14;
  do
  {
    v17 = v15 - 8;
    v32 = vld2q_f32(v17);
    v34 = vld2q_f32(v15);
    v18 = v32.val[0];
    v19 = v34.val[0];
    vst2q_f32(v17, *(float32x4x2_t *)((char *)&v32 + 16));
    vst2q_f32(v15, *(float32x4x2_t *)((char *)&v34 + 16));
    v15 += 16;
    v16 -= 8;
  }
  while (v16);
  if (v14 != v2)
    goto LABEL_16;
LABEL_18:
  helper[15] = plq_create_helper(a1, v2, v5);
  if (v2 < 8)
  {
    v22 = 0;
LABEL_23:
    v28 = v2 - v22;
    v29 = (int32x2_t *)&a1[v22];
    do
    {
      *v29 = vrev64_s32(*v29);
      ++v29;
      --v28;
    }
    while (v28);
    return helper;
  }
  v22 = v2 & 0xFFFFFFF8;
  v23 = (float *)(a1 + 4);
  v24 = v22;
  do
  {
    v25 = v23 - 8;
    v33 = vld2q_f32(v25);
    v35 = vld2q_f32(v23);
    v26 = v33.val[0];
    v27 = v35.val[0];
    vst2q_f32(v25, *(float32x4x2_t *)((char *)&v33 + 16));
    vst2q_f32(v23, *(float32x4x2_t *)((char *)&v35 + 16));
    v23 += 16;
    v24 -= 8;
  }
  while (v24);
  if (v22 != v2)
    goto LABEL_23;
  return helper;
}

void plq_free(uint64_t a1)
{
  if (a1)
  {
    plq_free(*(_QWORD *)(a1 + 120));
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 24));
    free(*(void **)(a1 + 32));
    free(*(void **)(a1 + 40));
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 48));
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    free((void *)a1);
  }
}

uint64_t plq_inside_circle_helper(uint64_t a1, float *a2, float *a3, uint64_t a4, int a5)
{
  float v9;
  float v10;
  int v11;
  int v12;
  float v13;
  _BOOL4 v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  float v34;
  int v35;
  float v36;
  float v37;
  uint64_t v38;
  int *v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  float v59;
  float v60;
  float v61;
  float v63;
  int v64;
  float v65;
  float v66;
  int v67;
  float v68;
  int *v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  float v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _DWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  float v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  BOOL v108;
  float v109;
  int v110;
  float v111;
  float v112;
  uint64_t v113;
  int *v114;
  int v115;
  int v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  float v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  float v134;
  float v135;
  float v136;
  float v138;
  int v139;
  float v140;
  float v141;
  int v142;
  float v143;
  int *v144;
  int v145;
  int v146;
  int v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  float v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  int v164;
  uint64_t v165;
  int v166;
  int v167;
  int v168;
  uint64_t v169;
  uint64_t v170;

  if (*(uint64_t *)a4 >= 0x80000000)
    __assert_rtn("plq_inside_circle_helper", "plq.c", 302, "da_size(ids) <= INT32_MAX");
  v165 = *(_QWORD *)a4;
  v9 = *a2;
  v10 = (float)(*a2 - *(float *)a1) / *(float *)(a1 + 112);
  if (v10 < 0.0)
    v10 = 0.0;
  if (v10 > 1.0)
    v10 = 1.0;
  v11 = *(_DWORD *)(a1 + 100);
  v12 = (int)(float)(v10 * (float)v11);
  v13 = (float)(a2[1] - *(float *)(a1 + 4)) / (float)(*(float *)(a1 + 12) - *(float *)(a1 + 4));
  v14 = v13 < 0.0 || v13 > 1.0;
  if (v13 > 1.0 && v13 >= 0.0)
    v15 = 1.0;
  else
    v15 = 0.0;
  if (v14)
    v13 = v15;
  v166 = v11 * (int)(float)(v13 * (float)*(int *)(a1 + 96));
  v163 = (v166 + v12) / v11 * v11;
  v164 = (v166 + v12) % v11;
  v16 = *(float *)(*(_QWORD *)(a1 + 64) + 4 * v164);
  v167 = v12;
  v168 = v163 + v11;
  if (v166 + v12 != v163 + v11)
  {
    v93 = v16 - v9;
    v94 = v166 + (uint64_t)v12;
    do
    {
      if (v93 >= 0.0 && (float)(v93 * v93) > *a3)
        break;
      add_cell_points_circle((_QWORD *)a1, v94, a2, a3, a4, a5);
      v95 = *(_DWORD *)(a1 + 100);
      LODWORD(v96) = (int)v94 % v95;
      v97 = 4 * ((int)v94 % v95);
      v99 = *(_QWORD *)(a1 + 64);
      v98 = *(_QWORD *)(a1 + 72);
      v100 = *(float *)(v98 + v97);
      v101 = *a2;
      v102 = v100 - *a2;
      v103 = *(float *)(v99 + v97);
      v104 = v103 - *a2;
      v105 = vabds_f32(v100, *a2);
      v106 = vabds_f32(v103, *a2);
      v107 = v105 >= v106 ? v106 : v105;
      v108 = v104 >= 0.0 || v102 <= 0.0;
      v109 = v108 ? v107 : 0.0;
      v170 = v94;
      v110 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v94);
      if (v110 == -1)
      {
        v113 = v94;
      }
      else
      {
        v111 = *a3;
        v112 = *(float *)(a1 + 4) + (float)((float)(v110 / v95) * *(float *)(a1 + 108));
        if ((float)((float)(a2[1] - v112) * (float)(a2[1] - v112)) <= (float)(*a3 + (float)((float)-v109 * v109)))
        {
          do
          {
            v114 = (int *)(*(_QWORD *)(a1 + 40) + 4 * v110);
            v115 = *v114;
            v116 = v114[1];
            if (v116 > v115)
            {
              if (a5)
              {
                v117 = v116 - v115;
                v118 = 4 * v115;
                v119 = 8 * v115;
                do
                {
                  v121 = (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v119 + 4) - a2[1])
                               * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v119 + 4) - a2[1]))
                       + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v119) - *a2)
                               * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v119) - *a2));
                  if (v121 <= v111)
                  {
                    v122 = *(_QWORD *)a4;
                    v123 = *(_QWORD *)(a4 + 16);
                    if (*(_QWORD *)a4 >= v123)
                    {
                      if (v123)
                        v124 = 2 * v123;
                      else
                        v124 = 64;
                      if (v124 <= v122)
                        v125 = v122 + 1;
                      else
                        v125 = v124;
                      if (v125)
                      {
                        *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v125, 0xE9E18EBAuLL);
                        v122 = *(_QWORD *)a4;
                      }
                      *(_QWORD *)(a4 + 16) = v125;
                    }
                    v120 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v118);
                    *(_QWORD *)a4 = v122 + 1;
                    *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v122) = v120;
                    *a3 = v121;
                    v111 = v121;
                  }
                  v118 += 4;
                  v119 += 8;
                  --v117;
                }
                while (v117);
              }
              else
              {
                v126 = v116 - v115;
                v127 = 4 * v115;
                v128 = 8 * v115;
                do
                {
                  if ((float)((float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v128 + 4) - a2[1])
                                     * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v128 + 4) - a2[1]))
                             + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v128) - *a2)
                                     * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v128) - *a2))) <= *a3)
                  {
                    v129 = *(_QWORD *)a4;
                    v130 = *(_QWORD *)(a4 + 16);
                    if (*(_QWORD *)a4 >= v130)
                    {
                      if (v130)
                        v131 = 2 * v130;
                      else
                        v131 = 64;
                      if (v131 <= v129)
                        v132 = v129 + 1;
                      else
                        v132 = v131;
                      if (v132)
                      {
                        *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v132, 0xE9E18EBAuLL);
                        v129 = *(_QWORD *)a4;
                      }
                      *(_QWORD *)(a4 + 16) = v132;
                    }
                    *(_QWORD *)a4 = v129 + 1;
                    *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v129) = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v127);
                  }
                  v127 += 4;
                  v128 += 8;
                  --v126;
                }
                while (v126);
                v111 = *a3;
              }
            }
            v110 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v110);
            v95 = *(_DWORD *)(a1 + 100);
          }
          while (v110 != -1
               && (float)((float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v110 / v95) * *(float *)(a1 + 108))))
                        * (float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v110 / v95) * *(float *)(a1 + 108))))) <= (float)(v111 + (float)((float)-v109 * v109)));
          v101 = *a2;
          v99 = *(_QWORD *)(a1 + 64);
          v98 = *(_QWORD *)(a1 + 72);
          v113 = v170;
          v96 = (int)v170 % v95;
        }
        else
        {
          v96 = (int)v96;
          v113 = v94;
        }
        v133 = 4 * v96;
        v134 = *(float *)(v98 + v133);
        v135 = *(float *)(v99 + v133);
        v102 = v134 - v101;
        v104 = v135 - v101;
        v105 = vabds_f32(v134, v101);
        v106 = vabds_f32(v135, v101);
      }
      if (v105 >= v106)
        v136 = v106;
      else
        v136 = v105;
      if (v104 >= 0.0 || v102 <= 0.0)
        v138 = v136;
      else
        v138 = 0.0;
      v139 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v113);
      if (v139 != -1)
      {
        v140 = *a3;
        v141 = *a3 + (float)((float)-v138 * v138);
        v142 = v139 / v95;
        do
        {
          v143 = *(float *)(a1 + 4) + (float)((float)(v142 + 1) * *(float *)(a1 + 108));
          if ((float)((float)(a2[1] - v143) * (float)(a2[1] - v143)) > v141)
            break;
          v144 = (int *)(*(_QWORD *)(a1 + 40) + 4 * v139);
          v145 = *v144;
          v146 = v144[1];
          if (v146 > v145)
          {
            if (a5)
            {
              v147 = v146 - v145;
              v148 = 4 * v145;
              v149 = 8 * v145;
              do
              {
                v151 = (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v149 + 4) - a2[1])
                             * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v149 + 4) - a2[1]))
                     + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v149) - *a2)
                             * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v149) - *a2));
                if (v151 <= v140)
                {
                  v152 = *(_QWORD *)a4;
                  v153 = *(_QWORD *)(a4 + 16);
                  if (*(_QWORD *)a4 >= v153)
                  {
                    if (v153)
                      v154 = 2 * v153;
                    else
                      v154 = 64;
                    if (v154 <= v152)
                      v155 = v152 + 1;
                    else
                      v155 = v154;
                    if (v155)
                    {
                      *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v155, 0xE9E18EBAuLL);
                      v152 = *(_QWORD *)a4;
                    }
                    *(_QWORD *)(a4 + 16) = v155;
                  }
                  v150 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v148);
                  *(_QWORD *)a4 = v152 + 1;
                  *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v152) = v150;
                  *a3 = v151;
                  v140 = v151;
                }
                v148 += 4;
                v149 += 8;
                --v147;
              }
              while (v147);
            }
            else
            {
              v156 = v146 - v145;
              v157 = 4 * v145;
              v158 = 8 * v145;
              do
              {
                if ((float)((float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v158 + 4) - a2[1])
                                   * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v158 + 4) - a2[1]))
                           + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v158) - *a2)
                                   * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v158) - *a2))) <= *a3)
                {
                  v159 = *(_QWORD *)a4;
                  v160 = *(_QWORD *)(a4 + 16);
                  if (*(_QWORD *)a4 >= v160)
                  {
                    if (v160)
                      v161 = 2 * v160;
                    else
                      v161 = 64;
                    if (v161 <= v159)
                      v162 = v159 + 1;
                    else
                      v162 = v161;
                    if (v162)
                    {
                      *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v162, 0xE9E18EBAuLL);
                      v159 = *(_QWORD *)a4;
                    }
                    *(_QWORD *)(a4 + 16) = v162;
                  }
                  *(_QWORD *)a4 = v159 + 1;
                  *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v159) = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v157);
                }
                v157 += 4;
                v158 += 8;
                --v156;
              }
              while (v156);
              v140 = *a3;
            }
          }
          v141 = v140 + (float)((float)-v138 * v138);
          v139 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v139);
          v142 = v139 / *(_DWORD *)(a1 + 100);
        }
        while (v139 != -1);
      }
      v94 = v170 + 1;
      v93 = v93 + *(float *)(a1 + 104);
    }
    while (v168 != (_DWORD)v170 + 1);
  }
  if (v164 >= 1)
  {
    v17 = v9 - v16;
    v18 = v166 + (uint64_t)v167;
    do
    {
      if ((float)(v17 * v17) > *a3)
        break;
      v19 = v18 - 1;
      add_cell_points_circle((_QWORD *)a1, v19, a2, a3, a4, a5);
      v20 = *(_DWORD *)(a1 + 100);
      LODWORD(v21) = (int)v19 % v20;
      v22 = 4 * ((int)v19 % v20);
      v24 = *(_QWORD *)(a1 + 64);
      v23 = *(_QWORD *)(a1 + 72);
      v25 = *(float *)(v23 + v22);
      v26 = *a2;
      v27 = v25 - *a2;
      v28 = *(float *)(v24 + v22);
      v29 = v28 - *a2;
      v30 = vabds_f32(v25, *a2);
      v31 = vabds_f32(v28, *a2);
      v32 = v30 >= v31 ? v31 : v30;
      v33 = v29 >= 0.0 || v27 <= 0.0;
      v34 = v33 ? v32 : 0.0;
      v169 = v19;
      v35 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v19);
      if (v35 == -1)
      {
        v38 = v19;
      }
      else
      {
        v36 = *a3;
        v37 = *(float *)(a1 + 4) + (float)((float)(v35 / v20) * *(float *)(a1 + 108));
        if ((float)((float)(a2[1] - v37) * (float)(a2[1] - v37)) <= (float)(*a3 + (float)((float)-v34 * v34)))
        {
          do
          {
            v39 = (int *)(*(_QWORD *)(a1 + 40) + 4 * v35);
            v40 = *v39;
            v41 = v39[1];
            if (v41 > v40)
            {
              if (a5)
              {
                v42 = v41 - v40;
                v43 = 4 * v40;
                v44 = 8 * v40;
                do
                {
                  v46 = (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v44 + 4) - a2[1])
                              * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v44 + 4) - a2[1]))
                      + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v44) - *a2)
                              * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v44) - *a2));
                  if (v46 <= v36)
                  {
                    v47 = *(_QWORD *)a4;
                    v48 = *(_QWORD *)(a4 + 16);
                    if (*(_QWORD *)a4 >= v48)
                    {
                      if (v48)
                        v49 = 2 * v48;
                      else
                        v49 = 64;
                      if (v49 <= v47)
                        v50 = v47 + 1;
                      else
                        v50 = v49;
                      if (v50)
                      {
                        *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v50, 0xE9E18EBAuLL);
                        v47 = *(_QWORD *)a4;
                      }
                      *(_QWORD *)(a4 + 16) = v50;
                    }
                    v45 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v43);
                    *(_QWORD *)a4 = v47 + 1;
                    *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v47) = v45;
                    *a3 = v46;
                    v36 = v46;
                  }
                  v43 += 4;
                  v44 += 8;
                  --v42;
                }
                while (v42);
              }
              else
              {
                v51 = v41 - v40;
                v52 = 4 * v40;
                v53 = 8 * v40;
                do
                {
                  if ((float)((float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v53 + 4) - a2[1])
                                     * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v53 + 4) - a2[1]))
                             + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v53) - *a2)
                                     * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v53) - *a2))) <= *a3)
                  {
                    v54 = *(_QWORD *)a4;
                    v55 = *(_QWORD *)(a4 + 16);
                    if (*(_QWORD *)a4 >= v55)
                    {
                      if (v55)
                        v56 = 2 * v55;
                      else
                        v56 = 64;
                      if (v56 <= v54)
                        v57 = v54 + 1;
                      else
                        v57 = v56;
                      if (v57)
                      {
                        *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v57, 0xE9E18EBAuLL);
                        v54 = *(_QWORD *)a4;
                      }
                      *(_QWORD *)(a4 + 16) = v57;
                    }
                    *(_QWORD *)a4 = v54 + 1;
                    *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v54) = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v52);
                  }
                  v52 += 4;
                  v53 += 8;
                  --v51;
                }
                while (v51);
                v36 = *a3;
              }
            }
            v35 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v35);
            v20 = *(_DWORD *)(a1 + 100);
          }
          while (v35 != -1
               && (float)((float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v35 / v20) * *(float *)(a1 + 108))))
                        * (float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v35 / v20) * *(float *)(a1 + 108))))) <= (float)(v36 + (float)((float)-v34 * v34)));
          v26 = *a2;
          v24 = *(_QWORD *)(a1 + 64);
          v23 = *(_QWORD *)(a1 + 72);
          v38 = v169;
          v21 = (int)v169 % v20;
        }
        else
        {
          v21 = (int)v21;
          v38 = v19;
        }
        v58 = 4 * v21;
        v59 = *(float *)(v23 + v58);
        v60 = *(float *)(v24 + v58);
        v27 = v59 - v26;
        v29 = v60 - v26;
        v30 = vabds_f32(v59, v26);
        v31 = vabds_f32(v60, v26);
      }
      if (v30 >= v31)
        v61 = v31;
      else
        v61 = v30;
      if (v29 >= 0.0 || v27 <= 0.0)
        v63 = v61;
      else
        v63 = 0.0;
      v64 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v38);
      if (v64 != -1)
      {
        v65 = *a3;
        v66 = *a3 + (float)((float)-v63 * v63);
        v67 = v64 / v20;
        do
        {
          v68 = *(float *)(a1 + 4) + (float)((float)(v67 + 1) * *(float *)(a1 + 108));
          if ((float)((float)(a2[1] - v68) * (float)(a2[1] - v68)) > v66)
            break;
          v69 = (int *)(*(_QWORD *)(a1 + 40) + 4 * v64);
          v70 = *v69;
          v71 = v69[1];
          if (v71 > v70)
          {
            v72 = 4 * v70;
            v73 = 8 * v70;
            if (a5)
            {
              v74 = v71 - v70;
              do
              {
                v76 = (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v73 + 4) - a2[1])
                            * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v73 + 4) - a2[1]))
                    + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v73) - *a2)
                            * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v73) - *a2));
                if (v76 <= v65)
                {
                  v77 = *(_QWORD *)a4;
                  v78 = *(_QWORD *)(a4 + 16);
                  if (*(_QWORD *)a4 >= v78)
                  {
                    if (v78)
                      v79 = 2 * v78;
                    else
                      v79 = 64;
                    if (v79 <= v77)
                      v80 = v77 + 1;
                    else
                      v80 = v79;
                    if (v80)
                    {
                      *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v80, 0xE9E18EBAuLL);
                      v77 = *(_QWORD *)a4;
                    }
                    *(_QWORD *)(a4 + 16) = v80;
                  }
                  v75 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v72);
                  *(_QWORD *)a4 = v77 + 1;
                  *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v77) = v75;
                  *a3 = v76;
                  v65 = v76;
                }
                v72 += 4;
                v73 += 8;
                --v74;
              }
              while (v74);
            }
            else
            {
              v81 = v71 - v70;
              do
              {
                if ((float)((float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v73 + 4) - a2[1])
                                   * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v73 + 4) - a2[1]))
                           + (float)((float)(*(float *)(*(_QWORD *)(a1 + 16) + v73) - *a2)
                                   * (float)(*(float *)(*(_QWORD *)(a1 + 16) + v73) - *a2))) <= *a3)
                {
                  v82 = *(_QWORD *)a4;
                  v83 = *(_QWORD *)(a4 + 16);
                  if (*(_QWORD *)a4 >= v83)
                  {
                    if (v83)
                      v84 = 2 * v83;
                    else
                      v84 = 64;
                    if (v84 <= v82)
                      v85 = v82 + 1;
                    else
                      v85 = v84;
                    if (v85)
                    {
                      *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v85, 0xE9E18EBAuLL);
                      v82 = *(_QWORD *)a4;
                    }
                    *(_QWORD *)(a4 + 16) = v85;
                  }
                  *(_QWORD *)a4 = v82 + 1;
                  *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v82) = *(_DWORD *)(*(_QWORD *)(a1 + 24) + v72);
                }
                v72 += 4;
                v73 += 8;
                --v81;
              }
              while (v81);
              v65 = *a3;
            }
          }
          v66 = v65 + (float)((float)-v63 * v63);
          v64 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v64);
          v67 = v64 / *(_DWORD *)(a1 + 100);
        }
        while (v64 != -1);
      }
      v17 = v17 + *(float *)(a1 + 104);
      v18 = v169;
    }
    while (v169 > v163);
  }
  v86 = *(_QWORD *)a4;
  if (a5 && v86 > (int)v165)
  {
    v87 = *(_DWORD **)(a4 + 8);
    v88 = *(_QWORD *)(a4 + 16);
    v87[(int)v165] = v87[v86 - 1];
    v89 = ((v165 << 32) + 0x100000000) >> 32;
    if (v89 > v88)
    {
      v90 = 2 * v88;
      if (!v88)
        v90 = 64;
      if (v90 <= v89)
        v91 = ((v165 << 32) + 0x100000000) >> 32;
      else
        v91 = v90;
      if (v91)
      {
        v87 = malloc_type_realloc(v87, 4 * v91, 0x6E177FACuLL);
        *(_QWORD *)(a4 + 8) = v87;
      }
      *(_QWORD *)(a4 + 16) = v91;
    }
    if (v89 > v86)
      bzero(&v87[*(_QWORD *)a4], 4 * (v89 - v86));
    *(_QWORD *)a4 = v89;
    return 1;
  }
  else
  {
    if (v86 >= 0x80000000)
      __assert_rtn("plq_inside_circle_helper", "plq.c", 336, "da_size(ids) <= INT32_MAX");
    return (v86 - v165);
  }
}

uint64_t plq_inside_line(uint64_t result, float *a2, float *a3, uint64_t a4, float a5, double a6, double a7, double a8, double a9)
{
  int32x2_t v9;
  int32x2_t v10;
  int32x4_t v11;
  int32x4_t v12;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  _BOOL4 v37;
  uint64_t v38;
  float v39;
  int v40;
  uint64_t v41;
  float v42;
  int v43;
  int v44;
  int v45;
  int v46;
  BOOL v47;
  int v48;
  int *v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  float v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  float v66;
  uint64_t v67;
  BOOL v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  int v76;
  float v77;
  float v78;
  float v79;
  int v80;
  int v81;
  float v82;
  uint64_t v83;
  float32x2_t v84;
  float32x4_t v85;
  int8x16_t v86;
  float32x4_t v87;
  int8x16_t v88;
  int32x4_t v89;
  int v90;
  float v91;
  float v92;
  _BOOL4 v93;
  float v94;
  float v95;
  float v96;
  _BOOL4 v97;
  float v98;
  int v99;
  int v100;
  uint64_t v101;
  float v102;
  uint64_t v103;
  float v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  int v112;
  float v113;
  float v114;
  float v115;
  _BOOL4 v116;
  float v117;
  float v118;
  int v119;
  int v120;
  float v121;
  _BOOL4 v122;
  float v123;
  int v124;
  int v126;
  int *v128;
  int v129;
  int v130;
  float *v131;
  uint64_t v132;
  int *v133;
  uint64_t v134;
  float v135;
  float v136;
  uint64_t v137;
  float v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  int v144;
  int v145;
  uint64_t v146;
  int v147;
  int v148;

  if (result)
  {
    v14 = result;
    v16 = *a2;
    v15 = a2[1];
    v17 = *a3;
    v18 = a3[1];
    v19 = vabds_f32(*a2, *a3);
    v20 = vabds_f32(v15, v18);
    if (v19 >= v20)
      v21 = v20;
    else
      v21 = v19;
    if (v21 >= 0.001)
    {
      if (v19 < v20)
      {
        v64 = *(_QWORD *)(result + 120);
        if (v64)
          v65 = *a2;
        else
          v65 = a2[1];
        if (v64)
        {
          v16 = a2[1];
          v66 = *a3;
        }
        else
        {
          v66 = a3[1];
        }
        if (v64)
        {
          v17 = a3[1];
          v14 = *(_QWORD *)(result + 120);
        }
        v15 = v65;
        v18 = v66;
      }
      v67 = *(_QWORD *)a4;
      if (*(uint64_t *)a4 >= 0x80000000)
        __assert_rtn("plq_inside_line", "plq.c", 523, "da_size(ids) <= INT32_MAX");
      if (v16 <= v17 && (v16 == v17 ? (v68 = v15 <= v18) : (v68 = 1), v68))
      {
        v69 = v15;
        *(float *)&a9 = v16;
        v15 = v18;
        v16 = v17;
      }
      else
      {
        v69 = v18;
        *(float *)&a9 = v17;
      }
      v70 = v16 - *(float *)&a9;
      v71 = v15 - v69;
      v72 = sqrtf((float)(v71 * v71) + (float)(v70 * v70));
      v73 = 0.0;
      v74 = 0.0;
      if (v72 > 0.0)
      {
        v73 = v70 / v72;
        v74 = v71 / v72;
      }
      v75 = fabsf(v73 * a5) + fabsf(v74 * (float)((float)-(float)(v74 * a5) / v73));
      if (v75 < -0.000001)
      {
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/containers/plq.c", 540, (uint64_t)"plq_inside_line", "y_diff_for_line should not be negative, vec = %f, %f", v73, v74);
        __assert_rtn("plq_inside_line", "plq.c", 540, "0");
      }
      v76 = *(_DWORD *)(v14 + 100);
      v9.i32[0] = *(_DWORD *)v14;
      v77 = vabds_f32(*(float *)&a9, *(float *)v14);
      v78 = *(float *)(v14 + 8);
      v79 = vabds_f32(v16, v78);
      if (v77 <= v79)
        v77 = v79;
      if (v77 >= 0.000001)
      {
        *(float *)v11.i32 = v15 + v75;
        *(float *)v12.i32 = v69 + v75;
        LODWORD(v83) = *(_DWORD *)(v14 + 4);
        v82 = (float)v76;
        v10.i32[0] = *(_DWORD *)(v14 + 112);
        *(float *)&v11.i32[1] = (float)(v15 + v75) + (float)(v75 * -2.0);
        v84.f32[0] = v69 + v75;
        v84.f32[1] = (float)(v69 + v75) + (float)(v75 * -2.0);
        *(float32x2_t *)v11.i8 = vsub_f32(*(float32x2_t *)v11.i8, v84);
        HIDWORD(v83) = *(_DWORD *)(v14 + 12);
        *(float *)&v12.i32[1] = v84.f32[1];
        v85 = vdivq_f32(vsubq_f32(vmlaq_n_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a9, 0), vdivq_f32(vsubq_f32((float32x4_t)vdupq_lane_s64(v83, 0), (float32x4_t)vzip1q_s32(v12, v12)), (float32x4_t)vzip1q_s32(v11, v11)), v70), (float32x4_t)vdupq_lane_s32(v9, 0)), (float32x4_t)vdupq_lane_s32(v10, 0));
        v86 = (int8x16_t)vcltzq_f32(v85);
        v87 = (float32x4_t)vdupq_n_s32(0x3F7FFFEFu);
        v88 = (int8x16_t)vcgtq_f32(v85, v87);
        v89 = vcvtq_s32_f32(vmulq_n_f32((float32x4_t)vbslq_s8(vorrq_s8(v88, v86), vandq_s8((int8x16_t)v87, vbicq_s8(v88, v86)), (int8x16_t)v85), (float)v76));
        v80 = vminvq_s32(v89);
        if (v80 >= v76)
          v80 = *(_DWORD *)(v14 + 100);
        v90 = vmaxvq_s32(v89);
        if (v90 < 0)
          v81 = -1;
        else
          v81 = v90;
      }
      else
      {
        v80 = 0;
        v81 = v76 - 1;
        v10.i32[0] = *(_DWORD *)(v14 + 112);
        v82 = (float)v76;
      }
      v91 = *(float *)&a9 - a5;
      v92 = (float)((float)(*(float *)&a9 - a5) - *(float *)v9.i32) / *(float *)v10.i32;
      v93 = v92 < 0.0 || v92 > 1.0;
      if (v92 > 1.0 && v92 >= 0.0)
        v94 = 1.0;
      else
        v94 = 0.0;
      if (v93)
        v92 = v94;
      v95 = v16 + a5;
      v96 = (float)((float)(v16 + a5) - *(float *)v9.i32) / *(float *)v10.i32;
      v97 = v96 < 0.0 || v96 > 1.0;
      if (v96 > 1.0 && v96 >= 0.0)
        v98 = 1.0;
      else
        v98 = 0.0;
      if (v97)
        v96 = v98;
      if (v80 <= (int)(float)(v82 * v92))
        v99 = (int)(float)(v82 * v92);
      else
        v99 = v80;
      if (v81 >= (int)(float)(v82 * v96))
        v100 = (int)(float)(v82 * v96);
      else
        v100 = v81;
      v101 = *(_QWORD *)a4;
      if (v99 <= v100)
      {
        v102 = v69 + (float)(v74 * (float)((float)(*(float *)v9.i32 - *(float *)&a9) / v73));
        v103 = v99;
        v144 = v100 + 1;
        v104 = (float)(v15 + (float)(v74 * (float)((float)(v78 - v16) / v73))) - v102;
        v142 = *(_QWORD *)a4;
        v101 = *(_QWORD *)a4;
        do
        {
          v105 = *(_QWORD *)(v14 + 80);
          v106 = *(_QWORD *)(v14 + 88);
          v107 = v102 + (float)(v104 * *(float *)(v105 + 4 * v103));
          v108 = v102 + (float)(v104 * *(float *)(v106 + 4 * v103));
          if (v107 >= v108)
            v109 = v102 + (float)(v104 * *(float *)(v106 + 4 * v103));
          else
            v109 = v102 + (float)(v104 * *(float *)(v105 + 4 * v103));
          v110 = (float)(v109 - v75) + -0.000001;
          if (v107 <= v108)
            v107 = v102 + (float)(v104 * *(float *)(v106 + 4 * v103));
          v111 = (float)(v75 + v107) + 0.000001;
          v112 = *(_DWORD *)(v14 + 100);
          v113 = *(float *)(v14 + 4);
          v114 = *(float *)(v14 + 12) - v113;
          v115 = (float)(v110 - v113) / v114;
          v116 = v115 < 0.0 || v115 > 1.0;
          if (v115 > 1.0 && v115 >= 0.0)
            v117 = 1.0;
          else
            v117 = 0.0;
          if (v116)
            v115 = v117;
          v118 = (float)*(int *)(v14 + 96);
          v119 = v112 * (int)(float)(v115 * v118);
          v146 = v103;
          v148 = v99;
          v120 = v119 + v103;
          v121 = (float)(v111 - v113) / v114;
          v122 = v121 < 0.0 || v121 > 1.0;
          if (v121 > 1.0 && v121 >= 0.0)
            v123 = 1.0;
          else
            v123 = 0.0;
          if (v122)
            v121 = v123;
          v124 = v112 * (int)(float)(v121 * v118);
          if (v120 != -1 && v119 <= v124)
          {
            v126 = v124 + v99;
            do
            {
              v128 = (int *)(*(_QWORD *)(v14 + 40) + 4 * v120);
              v129 = *v128;
              v130 = v128[1] - *v128;
              if (v130 >= 1)
              {
                v131 = (float *)(*(_QWORD *)(v14 + 32) + 4 * v129);
                v132 = *(_QWORD *)(v14 + 16) + 8 * v129;
                v133 = (int *)(*(_QWORD *)(v14 + 24) + 4 * v129);
                v134 = *(_QWORD *)(a4 + 16);
                do
                {
                  if (v101 >= v134)
                  {
                    v140 = 2 * v134;
                    if (!v134)
                      v140 = 64;
                    if (v140 <= v101)
                      v134 = v101 + 1;
                    else
                      v134 = v140;
                    if (v134)
                    {
                      *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v134, 0xE793A602uLL);
                      v101 = *(_QWORD *)a4;
                    }
                    *(_QWORD *)(a4 + 16) = v134;
                  }
                  v135 = *(float *)v132;
                  v136 = *(float *)(v132 + 4);
                  v132 += 8;
                  LODWORD(v137) = v135 < v91;
                  if (v135 > v95)
                    LODWORD(v137) = 1;
                  v138 = *v131++;
                  if (vabds_f32(v102 + (float)(v104 * v138), v136) > v75)
                    v137 = 1;
                  else
                    v137 = v137;
                  v139 = *v133++;
                  *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v101) = v139;
                  v101 = v101 - v137 + 1;
                  *(_QWORD *)a4 = v101;
                  --v130;
                }
                while (v130);
              }
              v120 = *(_DWORD *)(*(_QWORD *)(v14 + 48) + 4 * v120);
            }
            while (v120 != -1 && v120 <= v126);
          }
          v103 = v146 + 1;
          v99 = v148 + 1;
        }
        while (v144 != (_DWORD)v146 + 1);
        if (v101 > 0x7FFFFFFF)
          __assert_rtn("plq_inside_line", "plq.c", 577, "da_size(ids) <= INT32_MAX");
        LODWORD(v67) = v142;
      }
      return (v101 - v67);
    }
    else
    {
      if (v16 >= v17)
        v22 = *a3;
      else
        v22 = *a2;
      v23 = v22 - a5;
      if (v16 <= v17)
        v16 = *a3;
      v24 = v16 + a5;
      if (v15 >= v18)
        v25 = a3[1];
      else
        v25 = a2[1];
      v26 = v25 - a5;
      if (v15 <= v18)
        v15 = a3[1];
      v27 = v15 + a5;
      v28 = *(float *)(result + 4);
      v29 = *(float *)(result + 112);
      v30 = (float)(v23 - *(float *)result) / v29;
      v31 = 0.0;
      if (v30 < 0.0)
        v30 = 0.0;
      if (v30 > 1.0)
        v30 = 1.0;
      v32 = (float)(v24 - *(float *)result) / v29;
      if (v32 < 0.0)
        v32 = 0.0;
      if (v32 <= 1.0)
        v33 = v32;
      else
        v33 = 1.0;
      v34 = *(float *)(result + 12) - v28;
      v35 = (float)(v26 - v28) / v34;
      if (v35 < 0.0)
        v35 = 0.0;
      if (v35 > 1.0)
        v35 = 1.0;
      v36 = (float)(v27 - v28) / v34;
      v37 = v36 < 0.0 || v36 > 1.0;
      if (v36 > 1.0 && v36 >= 0.0)
        v31 = 1.0;
      if (v37)
        v36 = v31;
      v38 = *(_QWORD *)a4;
      if (*(uint64_t *)a4 > 0x7FFFFFFF)
        __assert_rtn("plq_inside_rectangle", "plq.c", 463, "da_size(ids) <= INT32_MAX");
      v39 = (float)*(int *)(result + 100);
      v40 = (int)(float)(v30 * v39);
      v41 = *(_QWORD *)a4;
      v147 = (int)(float)(v33 * v39);
      if (v40 <= v147)
      {
        v42 = (float)*(int *)(result + 96);
        v143 = (int)(float)(v36 * v42);
        v145 = (int)(float)(v35 * v42);
        v141 = *(_QWORD *)a4;
        v41 = *(_QWORD *)a4;
        do
        {
          v43 = *(_DWORD *)(v14 + 100);
          v44 = v43 * v145;
          v45 = v43 * v145 + v40;
          v46 = v43 * v143;
          v47 = v44 > v46 || v45 == -1;
          if (!v47)
          {
            v48 = v46 + v40;
            do
            {
              v50 = (int *)(*(_QWORD *)(v14 + 40) + 4 * v45);
              v51 = *v50;
              v52 = v50[1];
              if (v52 > v51)
              {
                v53 = v52 - v51;
                v54 = 4 * v51;
                v55 = 8 * v51;
                do
                {
                  v56 = *(_QWORD *)(v14 + 16);
                  v57 = *(float *)(v56 + v55);
                  if (v57 >= v23 && v57 <= v24)
                  {
                    v59 = *(float *)(v56 + v55 + 4);
                    if (v59 >= v26 && v59 <= v27)
                    {
                      v61 = *(_QWORD *)(a4 + 16);
                      if (v41 >= v61)
                      {
                        if (v61)
                          v62 = 2 * v61;
                        else
                          v62 = 64;
                        if (v62 <= v41)
                          v63 = v41 + 1;
                        else
                          v63 = v62;
                        if (v63)
                        {
                          *(_QWORD *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v63, 0x8F0AF0D1uLL);
                          v41 = *(_QWORD *)a4;
                        }
                        *(_QWORD *)(a4 + 16) = v63;
                      }
                      *(_DWORD *)(*(_QWORD *)(a4 + 8) + 4 * v41++) = *(_DWORD *)(*(_QWORD *)(v14 + 24) + v54);
                      *(_QWORD *)a4 = v41;
                    }
                  }
                  v54 += 4;
                  v55 += 8;
                  --v53;
                }
                while (v53);
              }
              v45 = *(_DWORD *)(*(_QWORD *)(v14 + 48) + 4 * v45);
            }
            while (v45 <= v48 && v45 != -1);
          }
          v47 = v40++ == v147;
        }
        while (!v47);
        LODWORD(v38) = v141;
        if (v41 > 0x7FFFFFFF)
          __assert_rtn("plq_inside_rectangle", "plq.c", 482, "da_size(ids) <= INT32_MAX");
      }
      return (v41 - v38);
    }
  }
  return result;
}

_QWORD *add_cell_points_circle(_QWORD *result, int a2, float *a3, float *a4, uint64_t a5, int a6)
{
  int *v6;
  int v7;
  int v8;
  _QWORD *v12;
  float v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  float v18;
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

  v6 = (int *)(result[5] + 4 * a2);
  v7 = *v6;
  v8 = v6[1];
  if (v8 > v7)
  {
    v12 = result;
    if (a6)
    {
      v13 = *a4;
      v14 = v8 - v7;
      v15 = 4 * v7;
      v16 = 8 * v7;
      do
      {
        v18 = (float)((float)(*(float *)(v12[2] + v16 + 4) - a3[1]) * (float)(*(float *)(v12[2] + v16 + 4) - a3[1]))
            + (float)((float)(*(float *)(v12[2] + v16) - *a3) * (float)(*(float *)(v12[2] + v16) - *a3));
        if (v18 <= v13)
        {
          v19 = *(_QWORD *)a5;
          v20 = *(_QWORD *)(a5 + 16);
          if (*(_QWORD *)a5 >= v20)
          {
            if (v20)
              v21 = 2 * v20;
            else
              v21 = 64;
            if (v21 <= v19)
              v22 = v19 + 1;
            else
              v22 = v21;
            if (v22)
            {
              result = malloc_type_realloc(*(void **)(a5 + 8), 4 * v22, 0xE9E18EBAuLL);
              *(_QWORD *)(a5 + 8) = result;
              v19 = *(_QWORD *)a5;
            }
            *(_QWORD *)(a5 + 16) = v22;
          }
          v17 = *(_DWORD *)(v12[3] + v15);
          *(_QWORD *)a5 = v19 + 1;
          *(_DWORD *)(*(_QWORD *)(a5 + 8) + 4 * v19) = v17;
          *a4 = v18;
          v13 = v18;
        }
        v15 += 4;
        v16 += 8;
        --v14;
      }
      while (v14);
    }
    else
    {
      v23 = v8 - v7;
      v24 = 4 * v7;
      v25 = 8 * v7;
      do
      {
        if ((float)((float)((float)(*(float *)(v12[2] + v25 + 4) - a3[1])
                           * (float)(*(float *)(v12[2] + v25 + 4) - a3[1]))
                   + (float)((float)(*(float *)(v12[2] + v25) - *a3) * (float)(*(float *)(v12[2] + v25) - *a3))) <= *a4)
        {
          v26 = *(_QWORD *)a5;
          v27 = *(_QWORD *)(a5 + 16);
          if (*(_QWORD *)a5 >= v27)
          {
            if (v27)
              v28 = 2 * v27;
            else
              v28 = 64;
            if (v28 <= v26)
              v29 = v26 + 1;
            else
              v29 = v28;
            if (v29)
            {
              result = malloc_type_realloc(*(void **)(a5 + 8), 4 * v29, 0xE9E18EBAuLL);
              *(_QWORD *)(a5 + 8) = result;
              v26 = *(_QWORD *)a5;
            }
            *(_QWORD *)(a5 + 16) = v29;
          }
          *(_QWORD *)a5 = v26 + 1;
          *(_DWORD *)(*(_QWORD *)(a5 + 8) + 4 * v26) = *(_DWORD *)(v12[3] + v24);
        }
        v24 += 4;
        v25 += 8;
        --v23;
      }
      while (v23);
    }
  }
  return result;
}

_DWORD *vl_create(uint64_t a1, uint64_t a2, const char *a3, uint64_t (*a4)(_QWORD, _QWORD, _QWORD), uint64_t a5, _BYTE *a6, uint64_t a7)
{
  _DWORD *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint8_t v19[1024];

  v14 = malloc_type_calloc(1uLL, 0x3978uLL, 0x10B004006F153EEuLL);
  if (vl_os_log_once_token != -1)
    dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
  v15 = vl_os_log_log;
  v16 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, v14);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "vl instance", "vl_create", v19, 2u);
    }
  }
  vl_par_default((char *)v19);
  memcpy(v14, v19, 0x3F0uLL);
  v14[252] = -1;
  vl_context_init((uint64_t)(v14 + 534), a6);
  vl_map_init((uint64_t)(v14 + 1194), (uint64_t)(v14 + 30), (uint64_t)(v14 + 38), a1, a2, a3);
  if (a7)
    __strcpy_chk();
  vl_log_callback = a4;
  vl_log_callback_context = a5;
  return v14;
}

void vl_free(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  vl_dump_stop(a1 + 12080);
  free(*(void **)(a1 + 1944));
  free(*(void **)(a1 + 1968));
  free(*(void **)(a1 + 2040));
  free(*(void **)(a1 + 2016));
  free(*(void **)(a1 + 2064));
  free(*(void **)(a1 + 2088));
  free(*(void **)(a1 + 2112));
  v2 = *(_QWORD *)(a1 + 14424);
  if (v2)
    slam_tracker_vo_free(v2);
  while (!*(_DWORD *)(a1 + 4824))
    usleep(0x186A0u);
  *(_DWORD *)(a1 + 4824) = 0;
  pthread_join(*(pthread_t *)(a1 + 5504), 0);
  vl_context_free(a1 + 2136);
  vl_map_free(*(_QWORD *)(a1 + 1016));
  nftw((const char *)(a1 + 12628), (int (__cdecl *)(const char *, const stat *, int, FTW *))unlink_cb, 64, 5);
  if (vl_os_log_once_token != -1)
    dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
  v3 = vl_os_log_log;
  v4 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, (const void *)a1);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v3, OS_SIGNPOST_INTERVAL_END, v5, "vl instance", "vl_free", v6, 2u);
    }
  }
  free((void *)a1);
}

uint64_t vl_update(uint64_t a1, uint64_t a2)
{
  const float *v3;
  int32x4_t v4;
  float v5;
  uint64_t v6;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4294967293;
  v3 = (const float *)(a2 + 32);
  v4 = (int32x4_t)vld1q_dup_f32(v3);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32((int32x4_t)vl_argo_support_location_type, v4))), 0xFuLL))) & 1) != 0|| (v5 = *(float *)(a2 + 24), v5 < 0.0)|| *(double *)&vl_gps_max_horz_accuracy < v5)
  {
    printf("%sError : ", "");
    printf("VL update got bad location : type (%d) uncertainty(%f)", *(_DWORD *)(a2 + 32), *(float *)(a2 + 24));
    putchar(10);
    return 4294967292;
  }
  else
  {
    v6 = vl_map_update((int *)(a1 + 4776), v5, a1 + 120, (double *)a2, 0);
    vl_dump_update(a1 + 12080, (uint64_t *)a2, v6, *(float *)(a2 + 24));
    if (vl_os_log_once_token != -1)
      dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
    v9 = vl_os_log_log;
    v10 = os_signpost_id_generate((os_log_t)vl_os_log_log);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        v12 = *(double *)a2;
        v13 = *(_QWORD *)(a2 + 8);
        v14 = *(_QWORD *)(a2 + 16);
        v15 = *(float *)(a2 + 24);
        *(_DWORD *)buf = 134218752;
        v17 = v12;
        v18 = 2048;
        v19 = v13;
        v20 = 2048;
        v21 = v14;
        v22 = 2048;
        v23 = v15;
        _os_signpost_emit_with_name_impl(&dword_210B26000, v9, OS_SIGNPOST_EVENT, v11, "vl_update", "vl_update position %f %f %f uncertainty %f", buf, 0x2Au);
      }
    }
  }
  return v6;
}

uint64_t vl_get_altitudes(uint64_t a1, _DWORD *a2, _QWORD *a3, float a4, float a5)
{
  uint64_t v5;
  int v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  _OWORD *v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;

  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 5360);
    if (v5)
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      vl_height_get_for_latlon((int *)(v5 + 608), (uint64_t)&v23, a4, a5);
      v8 = v23;
      if (v23)
      {
        *a2 = v23;
        v9 = (char *)malloc_type_malloc(4 * v8, 0x100004052888210uLL);
        *a3 = v9;
        v11 = v23;
        v10 = (char *)v24;
        if (v23 >= 1)
        {
          v12 = 0;
          if ((unint64_t)v23 < 8)
            goto LABEL_10;
          if ((unint64_t)(v9 - (char *)v24) < 0x20)
            goto LABEL_10;
          v12 = v23 & 0x7FFFFFFFFFFFFFF8;
          v13 = v24 + 1;
          v14 = v9 + 16;
          v15 = v23 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v16 = *v13;
            *(v14 - 1) = *(v13 - 1);
            *v14 = v16;
            v13 += 2;
            v14 += 2;
            v15 -= 8;
          }
          while (v15);
          if (v11 != v12)
          {
LABEL_10:
            v17 = v11 - v12;
            v18 = 4 * v12;
            v19 = &v9[v18];
            v20 = &v10[v18];
            do
            {
              v21 = *(_DWORD *)v20;
              v20 += 4;
              *(_DWORD *)v19 = v21;
              v19 += 4;
              --v17;
            }
            while (v17);
          }
        }
        free(v10);
        return 0;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      printf("%sError : ", "");
      printf("Map tile not loaded");
      putchar(10);
      return 3;
    }
  }
  else
  {
    printf("%sError : ", "");
    printf("VL not initialized");
    putchar(10);
    return 2;
  }
}

uint64_t vl_locate(uint64_t a1, void *ptr, __int128 *a3, uint64_t a4)
{
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  long double v11;
  long double v12;
  long double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  timespec *v21;
  uint64_t v22;
  unsigned int v23;
  __darwin_time_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  timespec *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double v38;
  float v39;
  float v40;
  const float *v41;
  int32x4_t v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_signpost_id_t v56;
  os_signpost_id_t v57;
  unint64_t v59;
  NSObject *v60;
  os_signpost_id_t v61;
  os_signpost_id_t v62;
  NSObject *v63;
  os_signpost_id_t v64;
  os_signpost_id_t v65;
  __darwin_time_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_signpost_id_t v76;
  os_signpost_id_t v77;
  NSObject *v78;
  os_signpost_id_t v79;
  os_signpost_id_t v80;
  __darwin_time_t v81;
  float32x2_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
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
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_signpost_id_t v104;
  os_signpost_id_t v105;
  uint64_t v106;
  float32x2_t *v107;
  uint64_t v108;
  uint64_t v109;
  float32x2_t *v110;
  uint64_t v111;
  NSObject *v112;
  os_signpost_id_t v113;
  os_signpost_id_t v114;
  __darwin_time_t v115;
  double *v116;
  uint64_t v117;
  uint64_t v118;
  float32x2_t v123;
  float32x2_t v125;
  float32x2_t v127;
  float32x2_t v129;
  float32x2_t v130;
  float32x2_t v131;
  float32x2_t v132;
  float32x2_t v134;
  float32x2_t v135;
  float32x2_t v137;
  float v156;
  float v160;
  float v164;
  float v165;
  float v167;
  float v168;
  float v170;
  float v171;
  float v172;
  float32x2_t v173;
  float32x2_t v174;
  float32x2_t v175;
  float v181;
  float v182;
  float v183;
  float v184;
  float v187;
  float v188;
  float v190;
  float v191;
  float v192;
  float *v193;
  char *v194;
  long double v195;
  long double v196;
  long double v197;
  long double v198;
  double v199;
  double v200;
  double v201;
  float v202;
  float v203;
  float v204;
  float v205;
  long double v206;
  long double v207;
  int v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  long double v217;
  float v218;
  __float2 v219;
  __float2 v220;
  __float2 v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  float v228;
  float v229;
  float v230;
  float v231;
  float v232;
  float v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  float v242;
  float v243;
  float v244;
  float v245;
  float v246;
  float v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  float v258;
  float v259;
  float v260;
  float v261;
  float v262;
  float v263;
  float v264;
  float v265;
  float v266;
  float v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  float v279;
  float v280;
  float v281;
  float v282;
  float v283;
  float v284;
  float v285;
  float v286;
  float v287;
  void *v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  float v304;
  float v305;
  float v306;
  float v307;
  float v308;
  float v309;
  float v310;
  float v311;
  float v312;
  double v313;
  float32x2_t v314;
  float32x2_t v315;
  float32x2_t v316;
  float32x2_t v317;
  float32x2_t v318;
  float32x2_t v319;
  float v320;
  float32x2_t v321;
  float32x2_t v322;
  float v323;
  float v324;
  double v325;
  double v326;
  float v327;
  float v328;
  float v329;
  float v330;
  float v331;
  float v332;
  float __b;
  float __ba;
  float v335;
  float v336;
  __darwin_time_t *v337;
  timespec *v338;
  uint64_t v339;
  uint64_t *v340;
  float *v341;
  uint64_t v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  float64x2_t v352;
  timespec buf[6];
  uint64_t v354;

  v354 = *MEMORY[0x24BDAC8D0];
  v350 = 0u;
  v351 = 0u;
  v349 = 0u;
  if (vl_os_log_once_token != -1)
    dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
  v347 = 0u;
  v348 = 0u;
  v345 = 0u;
  v346 = 0u;
  v343 = 0u;
  v344 = 0u;
  v8 = vl_os_log_log;
  v9 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf[0].tv_sec) = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "vl_locate", (const char *)&unk_210BCA1F1, (uint8_t *)buf, 2u);
    }
  }
  printf("Verbose : ");
  printf("------------------------------------------------------------");
  putchar(10);
  printf("Verbose : ");
  printf("Processing image of size:          %d x %d", *((_DWORD *)ptr + 2), *((_DWORD *)ptr + 3));
  putchar(10);
  printf("Verbose : ");
  v11 = atan((float)((float)(*((_DWORD *)ptr + 2) / 2) / *(float *)a3));
  v12 = (v11 + v11) * 180.0 / 3.14159265;
  v13 = atan((float)((float)(*((_DWORD *)ptr + 3) / 2) / *((float *)a3 + 4)));
  printf("FOV:                               %.2f x %.2f degrees", (double)v12, (double)((v13 + v13) * 180.0 / 3.14159265));
  putchar(10);
  printf("Verbose : ");
  printf("GPS Uncertainty:                   %.2f m", *((float *)a3 + 18));
  putchar(10);
  printf("Verbose : ");
  printf("Core Motion heading & uncertainty: %.2f +- %.2f degrees", *((float *)a3 + 24), *((float *)a3 + 25));
  putchar(10);
  log_col_app((uint64_t)"VL ver:                            %d", v14, v15, v16, v17, v18, v19, v20, *(_DWORD *)(a1 + 1008));
  printf("Verbose : ");
  printf("------------------------------------------------------------");
  putchar(10);
  if (!*(_DWORD *)(a1 + 14688))
  {
    buf[0].tv_sec = 0;
    buf[0].tv_nsec = 0;
    clock_gettime(_CLOCK_MONOTONIC, buf);
    *(double *)(a1 + 14680) = (double)buf[0].tv_sec + (double)buf[0].tv_nsec * 0.000000001;
    v21 = (timespec *)(a1 + 11864);
    if (*(_DWORD *)(a1 + 12076))
      goto LABEL_8;
LABEL_10:
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 11896));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 11880));
    clock_gettime(_CLOCK_MONOTONIC, v21);
    goto LABEL_11;
  }
  v21 = (timespec *)(a1 + 11864);
  if (!*(_DWORD *)(a1 + 12076))
    goto LABEL_10;
LABEL_8:
  *(_QWORD *)(a1 + 11984) -= mach_absolute_time();
LABEL_11:
  v342 = a1 + 12080;
  vl_dump_locate(a1 + 12080, (uint64_t)ptr, (uint64_t)a3, a1 + 1424);
  memset(buf, 0, 32);
  if (*(_DWORD *)(a1 + 12080) && (*(_BYTE *)(a1 + 12084) & 8) != 0)
  {
    v22 = 0;
    v23 = 0;
    do
    {
      v23 = (1025 * (v23 + *(char *)(a1 + v22))) ^ ((1025 * (v23 + *(char *)(a1 + v22))) >> 6);
      ++v22;
    }
    while (v22 != 1008);
    v24 = 32769 * ((9 * v23) ^ ((9 * v23) >> 11));
    strcpy((char *)buf, "vl");
    v25 = *(_QWORD *)(a1 + 13744);
    v26 = *(_QWORD *)(a1 + 13760);
    if (v25 >= v26)
    {
      v27 = 2 * v26;
      _ZF = v26 == 0;
      v29 = 4;
      if (!_ZF)
        v29 = v27;
      if (v29 <= v25)
        v30 = v25 + 1;
      else
        v30 = v29;
      if (v30)
      {
        *(_QWORD *)(a1 + 13752) = realloc(*(void **)(a1 + 13752), 56 * v30);
        v25 = *(_QWORD *)(a1 + 13744);
      }
      *(_QWORD *)(a1 + 13760) = v30;
    }
    *(_QWORD *)(a1 + 13744) = v25 + 1;
    v31 = (timespec *)(*(_QWORD *)(a1 + 13752) + 56 * v25);
    *v31 = buf[0];
    v31[1] = buf[1];
    v31[2].tv_sec = 0x20202020726150;
    v31[2].tv_nsec = 0x100000000;
    v31[3].tv_sec = v24;
  }
  v32 = *(_OWORD *)(a1 + 11840);
  *(_OWORD *)(a1 + 11648) = v32;
  v33 = *(_OWORD *)(a1 + 11824);
  *(_OWORD *)(a1 + 11632) = v33;
  v34 = *(_OWORD *)(a1 + 11808);
  *(_OWORD *)(a1 + 11616) = v34;
  v35 = *(_OWORD *)(a1 + 11792);
  *(_OWORD *)(a1 + 11600) = v35;
  v36 = *(_OWORD *)(a1 + 11760);
  *(_OWORD *)(a1 + 11568) = v36;
  v37 = *(_OWORD *)(a1 + 11776);
  *(_OWORD *)(a1 + 11584) = v37;
  *(_OWORD *)(a1 + 9464) = v32;
  *(_OWORD *)(a1 + 9448) = v33;
  *(_OWORD *)(a1 + 9432) = v34;
  *(_OWORD *)(a1 + 9416) = v35;
  *(_OWORD *)(a1 + 9384) = v36;
  *(_OWORD *)(a1 + 9400) = v37;
  v349 = xmmword_210BCAB70;
  v350 = xmmword_210BCAB70;
  LODWORD(v351) = 1065353216;
  *(float *)&v32 = sqrtf((float)((float)(*((float *)a3 + 27) * *((float *)a3 + 27))+ (float)(*((float *)a3 + 26) * *((float *)a3 + 26)))+ (float)(*((float *)a3 + 28) * *((float *)a3 + 28)));
  LODWORD(buf[0].tv_nsec) = 0;
  buf[0].tv_sec = 0;
  v38 = *(float *)&v32;
  if (*(float *)&v32 < 0.95 || v38 > 1.05)
  {
    printf("%sWarning : ", "");
    printf("Gravity does not seem to be correct (len: %f)", v38);
    putchar(10);
  }
  else if (!vl_img_get_gv((uint64_t)a3, *(_DWORD *)(a1 + 500), (float *)buf))
  {
    if (*(_DWORD *)(a1 + 14696) || *(float *)a3 > 0.0 && *(float *)a3 <= 10000.0)
    {
      v39 = *(double *)&vl_camera_min_gravity_angle * 3.14159265 / 180.0;
      v40 = acos((float)((float)((float)(*(float *)&buf[0].tv_sec + (float)(*((float *)&buf[0].tv_sec + 1) * 0.0))
                               + (float)(*(float *)&buf[0].tv_nsec * 0.0))
                       / (float)(sqrtf((float)((float)(*((float *)&buf[0].tv_sec + 1) * *((float *)&buf[0].tv_sec + 1))+ (float)(*(float *)&buf[0].tv_sec * *(float *)&buf[0].tv_sec))+ (float)(*(float *)&buf[0].tv_nsec * *(float *)&buf[0].tv_nsec))+ 1.0e-20)));
      if (v40 < v39)
      {
        v44 = 0x4000;
      }
      else
      {
        v41 = (const float *)(a3 + 5);
        v42 = (int32x4_t)vld1q_dup_f32(v41);
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32((int32x4_t)vl_argo_support_location_type, v42))), 0xFuLL))) & 1) != 0)
        {
          v44 = 16387;
        }
        else
        {
          v43 = *((float *)a3 + 18);
          if (v43 >= 0.0 && *(double *)&vl_gps_max_horz_accuracy >= v43)
            v44 = 1;
          else
            v44 = 16388;
        }
      }
    }
    else
    {
      printf("%sError : ", "");
      printf("Calibration does not seem to be correct (K[0] = %f)", *(float *)a3);
      putchar(10);
      v44 = 16386;
    }
    goto LABEL_38;
  }
  v44 = 16385;
LABEL_38:
  v45 = a1 + 1016;
  vl_map_free(*(_QWORD *)(a1 + 1016));
  *(_QWORD *)(a1 + 1016) = 0;
  v46 = vl_map_get(a1 + 4776, *((float *)a3 + 18), a1 + 120, (double *)a3 + 6, a1 + 1016);
  switch(v46)
  {
    case 0:
      goto LABEL_44;
    case 1:
      v44 = 4;
      if (!*(_DWORD *)(a1 + 560))
        goto LABEL_49;
      goto LABEL_45;
    case 2:
      v44 = 8;
LABEL_44:
      if (*(_DWORD *)(a1 + 560))
        goto LABEL_45;
      goto LABEL_49;
    case 3:
      v44 = 16;
      if (!*(_DWORD *)(a1 + 560))
        goto LABEL_49;
      goto LABEL_45;
    default:
      printf("%sError : ", "");
      printf("Unsupported map status: %d", v46);
      putchar(10);
      if (!*(_DWORD *)(a1 + 560))
        goto LABEL_49;
LABEL_45:
      v47 = (void *)*(unsigned int *)(a1 + 564);
      if (!model_0 || *(_DWORD *)model_0 != (_DWORD)v47 && (vl_hs_model_free(), !model_0))
        vl_hs_model_load(v47, (const char *)(a1 + 9920));
LABEL_49:
      if ((_DWORD)v44 != 1 && *(int *)(a1 + 4748) >= 1 && !*(_DWORD *)(a1 + 656) && !*(_DWORD *)(a1 + 976))
        goto LABEL_54;
      v341 = (float *)a4;
      if (vl_img_init((uint64_t)ptr, (uint64_t)a3, a1 + 176, *(_DWORD *)(a1 + 14696), *(_DWORD *)(a1 + 14700), a1 + 1024))goto LABEL_54;
      if (*(_DWORD *)(a1 + 572))
      {
        v59 = vl_locability_score(a1 + 2136, a1 + 1024, (float *)(a1 + 1256), *(_DWORD *)(a1 + 576));
        printf("Info : ");
        printf("Locability: Score %f, status %d", *(float *)&v59, HIDWORD(v59) == 0);
        putchar(10);
        if (HIDWORD(v59))
        {
          v44 = 0x8000;
          goto LABEL_54;
        }
      }
      v338 = v21;
      if (vl_os_log_once_token != -1)
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      v60 = vl_os_log_log;
      v61 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v62 = v61;
        if (os_signpost_enabled(v60))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v62, "vl_kpts_extract", (const char *)&unk_210BCA1F1, (uint8_t *)buf, 2u);
        }
      }
      v340 = (uint64_t *)(a1 + 1936);
      vl_kpts_extract();
      v339 = a1 + 1024;
      if (vl_os_log_once_token != -1)
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      v63 = vl_os_log_log;
      v64 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v65 = v64;
        if (os_signpost_enabled(v63))
        {
          v66 = *v340;
          LODWORD(buf[0].tv_sec) = 134217984;
          *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v66;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v63, OS_SIGNPOST_INTERVAL_END, v65, "vl_kpts_extract", "%lld", (uint8_t *)buf, 0xCu);
        }
      }
      vl_dump_kpts(v342, v340);
      if ((_DWORD)v44 != 1 && !*(_DWORD *)(a1 + 656) && !*(_DWORD *)(a1 + 976))
      {
        v21 = v338;
        goto LABEL_54;
      }
      v21 = v338;
      if (*(_DWORD *)(a1 + 168) && *(_QWORD *)v45)
        vl_retrieval(a1 + 7368, (uint64_t)v340, (uint64_t *)(*(_QWORD *)v45 + 48), a1 + 168);
      v67 = *(_QWORD *)(a1 + 14416);
      v68 = a1 + 1024;
      if (v67 && *(_DWORD *)(v67 + 576) == 1)
      {
        v69 = *(_QWORD *)(a1 + 1936);
        v70 = **(_QWORD **)(v67 + 560);
        v71 = *(_QWORD *)(a1 + 1952);
        if (v70 > v71)
        {
          v72 = 2 * v71;
          if (v72 <= v70)
            v73 = v70;
          else
            v73 = v72;
          if (v73)
            *(_QWORD *)(a1 + 1944) = malloc_type_realloc(*(void **)(a1 + 1944), 288 * v73, 0xAC89C964uLL);
          *(_QWORD *)(a1 + 1952) = v73;
          v68 = a1 + 1024;
        }
        if (v70 > v69)
          bzero((void *)(*(_QWORD *)(a1 + 1944) + 288 * *(_QWORD *)(a1 + 1936)), 288 * (v70 - v69));
        v74 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 560);
        *(_QWORD *)(a1 + 1936) = *(_QWORD *)v74;
        v21 = v338;
        if (*(uint64_t *)v74 >= 1)
          memcpy(*(void **)(a1 + 1944), *(const void **)(v74 + 8), 288 * *(_QWORD *)v74);
      }
      if ((_DWORD)v44 != 1 && *(_DWORD *)(a1 + 648))
      {
        update_tracker(a1 + 6992, v68, v340, a1, (uint64_t *)(a1 + 14424));
        update_tracker_meta(a1 + 6992, a3, 0, 0, 0, 0, a1);
      }
      if ((_DWORD)v44 != 1 && *(_DWORD *)(a1 + 976))
      {
        update_history(a1 + 11664, v44, (__int128 *)a4, v68, a3, 0, 0, (uint64_t)v340, *(_QWORD *)(a1 + 1016), a1);
        goto LABEL_54;
      }
      if ((_DWORD)v44 != 1)
        goto LABEL_54;
      if (vl_os_log_once_token != -1)
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      v75 = vl_os_log_log;
      v76 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v77 = v76;
        if (os_signpost_enabled(v75))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v75, OS_SIGNPOST_INTERVAL_BEGIN, v77, "vl_match", (const char *)&unk_210BCA1F1, (uint8_t *)buf, 2u);
        }
      }
      vl_match(a1 + 6344, v340, (uint64_t *)(a1 + 1984), *(_QWORD *)(a1 + 1016) + 48, (uint64_t *)(*(_QWORD *)(a1 + 1016) + 752), v68, (_DWORD *)(a1 + 152), a1 + 2008, v342);
      if (vl_os_log_once_token != -1)
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      v78 = vl_os_log_log;
      v79 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v80 = v79;
        if (os_signpost_enabled(v78))
        {
          v81 = *(_QWORD *)(a1 + 2008);
          LODWORD(buf[0].tv_sec) = 134217984;
          *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v81;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v78, OS_SIGNPOST_INTERVAL_END, v80, "vl_match", "Matches: %lld", (uint8_t *)buf, 0xCu);
        }
      }
      if (*(_DWORD *)(a1 + 648))
        update_tracker(a1 + 6992, v68, v340, a1, (uint64_t *)(a1 + 14424));
      if ((int)*(_QWORD *)(a1 + 1936) >= 1)
      {
        v82 = *(float32x2_t **)(a1 + 1944);
        v83 = *(_QWORD *)(a1 + 1936);
        do
        {
          v352 = vcvtq_f64_f32(*v82);
          memset(buf, 0, 24);
          g_improj2_to_xyz(a1 + 1048, &v352, (double *)&buf[0].tv_sec);
          *v82 = vcvt_f32_f64(*(float64x2_t *)&buf[0].tv_nsec);
          v82 += 36;
          --v83;
        }
        while (v83);
      }
      v84 = *(_QWORD *)(a1 + 14416);
      if (!v84 || *(_DWORD *)(v84 + 576) != 2)
        goto LABEL_131;
      v85 = *(_QWORD *)(a1 + 1936);
      v86 = *(_QWORD *)(*(_QWORD *)(v84 + 568) + 80);
      v87 = *(_QWORD *)(a1 + 1952);
      if (v86 > v87)
      {
        v209 = 2 * v87;
        if (v209 <= v86)
          v210 = v86;
        else
          v210 = v209;
        if (v210)
          *(_QWORD *)(a1 + 1944) = malloc_type_realloc(*(void **)(a1 + 1944), 288 * v210, 0xFFC4D0D3uLL);
        *(_QWORD *)(a1 + 1952) = v210;
        v88 = v86 - v85;
        if (v86 <= v85)
        {
LABEL_121:
          v89 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
          v90 = *(_QWORD *)(v89 + 80);
          *(_QWORD *)(a1 + 1936) = v90;
          if (v90 < 1)
            goto LABEL_123;
          goto LABEL_122;
        }
      }
      else
      {
        v88 = v86 - v85;
        if (v86 <= v85)
          goto LABEL_121;
      }
      bzero((void *)(*(_QWORD *)(a1 + 1944) + 288 * *(_QWORD *)(a1 + 1936)), 288 * v88);
      v89 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
      v90 = *(_QWORD *)(v89 + 80);
      *(_QWORD *)(a1 + 1936) = v90;
      if (v90 >= 1)
      {
LABEL_122:
        memcpy(*(void **)(a1 + 1944), *(const void **)(v89 + 88), 288 * v90);
        v89 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
      }
LABEL_123:
      v91 = *(_QWORD *)(a1 + 2032);
      v92 = *(_QWORD *)(v89 + 152);
      v93 = *(_QWORD *)(a1 + 2048);
      if (v92 > v93)
      {
        v211 = 2 * v93;
        _ZF = v93 == 0;
        v212 = 32;
        if (!_ZF)
          v212 = v211;
        if (v212 <= v92)
          v213 = v92;
        else
          v213 = v212;
        if (v213)
          *(_QWORD *)(a1 + 2040) = malloc_type_realloc(*(void **)(a1 + 2040), 8 * v213, 0xAC66EC66uLL);
        *(_QWORD *)(a1 + 2048) = v213;
        v94 = v92 - v91;
        if (v92 <= v91)
        {
LABEL_125:
          v95 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
          v96 = *(_QWORD *)(v95 + 152);
          *(_QWORD *)(a1 + 2032) = v96;
          if (v96 < 1)
            goto LABEL_127;
          goto LABEL_126;
        }
      }
      else
      {
        v94 = v92 - v91;
        if (v92 <= v91)
          goto LABEL_125;
      }
      bzero((void *)(*(_QWORD *)(a1 + 2040) + 8 * *(_QWORD *)(a1 + 2032)), 8 * v94);
      v95 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
      v96 = *(_QWORD *)(v95 + 152);
      *(_QWORD *)(a1 + 2032) = v96;
      if (v96 >= 1)
      {
LABEL_126:
        memcpy(*(void **)(a1 + 2040), *(const void **)(v95 + 160), 8 * v96);
        v95 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
      }
LABEL_127:
      v97 = *(_QWORD *)(a1 + 2008);
      v98 = *(_QWORD *)(v95 + 128);
      v99 = *(_QWORD *)(a1 + 2024);
      if (v98 > v99)
      {
        v214 = 2 * v99;
        _ZF = v99 == 0;
        v215 = 32;
        if (!_ZF)
          v215 = v214;
        if (v215 <= v98)
          v216 = v98;
        else
          v216 = v215;
        if (v216)
          *(_QWORD *)(a1 + 2016) = malloc_type_realloc(*(void **)(a1 + 2016), 8 * v216, 0x731363FDuLL);
        *(_QWORD *)(a1 + 2024) = v216;
        v100 = v98 - v97;
        if (v98 <= v97)
        {
LABEL_129:
          v101 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
          v102 = *(_QWORD *)(v101 + 128);
          *(_QWORD *)(a1 + 2008) = v102;
          if (v102 < 1)
            goto LABEL_131;
          goto LABEL_130;
        }
      }
      else
      {
        v100 = v98 - v97;
        if (v98 <= v97)
          goto LABEL_129;
      }
      bzero((void *)(*(_QWORD *)(a1 + 2016) + 8 * *(_QWORD *)(a1 + 2008)), 8 * v100);
      v101 = *(_QWORD *)(*(_QWORD *)(a1 + 14416) + 568);
      v102 = *(_QWORD *)(v101 + 128);
      *(_QWORD *)(a1 + 2008) = v102;
      if (v102 >= 1)
LABEL_130:
        memcpy(*(void **)(a1 + 2016), *(const void **)(v101 + 136), 8 * v102);
LABEL_131:
      if (vl_os_log_once_token != -1)
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      v103 = vl_os_log_log;
      v104 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v105 = v104;
        if (os_signpost_enabled(v103))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v103, OS_SIGNPOST_INTERVAL_BEGIN, v105, "vl_pose", (const char *)&unk_210BCA1F1, (uint8_t *)buf, 2u);
        }
      }
      v337 = (__darwin_time_t *)(a1 + 2056);
      vl_pose(a1 + 7584, v339, v340, a1 + 1984, *(_QWORD *)(a1 + 1016) + 48, *(_QWORD *)(a1 + 1016) + 608, (uint64_t *)(a1 + 2008), 0, a1 + 176, v342, (uint64_t)&v349, a1 + 2056, (_DWORD *)(a4 + 100), (_DWORD *)(a4 + 96));
      v106 = *(_QWORD *)(a1 + 1936);
      if ((int)v106 >= 1)
      {
        v107 = *(float32x2_t **)(a1 + 1944);
        v108 = *(_QWORD *)(a1 + 1936);
        do
        {
          v352 = 0uLL;
          buf[0].tv_sec = 0x3FF0000000000000;
          *(float64x2_t *)&buf[0].tv_nsec = vcvtq_f64_f32(*v107);
          g_xyz_to_improj2(a1 + 1048, (uint64_t)buf, v352.f64, 0, v106);
          *v107 = vcvt_f32_f64(v352);
          v107 += 36;
          --v108;
        }
        while (v108);
      }
      v109 = *(_QWORD *)(a1 + 2056);
      if ((int)v109 >= 1)
      {
        v110 = *(float32x2_t **)(a1 + 2064);
        v111 = *(_QWORD *)(a1 + 2056);
        do
        {
          v352 = 0uLL;
          buf[0].tv_sec = 0x3FF0000000000000;
          *(float64x2_t *)&buf[0].tv_nsec = vcvtq_f64_f32(*v110);
          g_xyz_to_improj2(a1 + 1048, (uint64_t)buf, v352.f64, 0, v109);
          *v110++ = vcvt_f32_f64(v352);
          --v111;
        }
        while (v111);
      }
      if (vl_os_log_once_token != -1)
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      v112 = vl_os_log_log;
      v113 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v114 = v113;
        if (os_signpost_enabled(v112))
        {
          v115 = *v337;
          LODWORD(buf[0].tv_sec) = 134217984;
          *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v115;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v112, OS_SIGNPOST_INTERVAL_END, v114, "vl_pose", "Inliers: %lld", (uint8_t *)buf, 0xCu);
        }
      }
      v116 = (double *)(*(_QWORD *)(a1 + 1016) + 288);
      buf[0] = (timespec)vcvtq_f64_f32(*(float32x2_t *)&v349);
      buf[1] = (timespec)vcvtq_f64_f32(*(float32x2_t *)((char *)&v349 + 8));
      buf[2] = (timespec)vcvtq_f64_f32(*(float32x2_t *)&v350);
      buf[3] = (timespec)vcvtq_f64_f32(*(float32x2_t *)((char *)&v350 + 8));
      buf[4] = (timespec)vcvtq_f64_f32(*(float32x2_t *)&v351);
      buf[5] = (timespec)vcvtq_f64_f32(*(float32x2_t *)((char *)&v351 + 8));
      g_camera_local_to_global(v116, (double *)&buf[0].tv_sec, (double *)&v343);
      v117 = a1 + 2056;
      v44 = vl_verify_post(v339, *(_QWORD *)(a1 + 1016), (double *)&v343, v337, *(unsigned int *)(a1 + 8056), (float *)a4, a1, v118);
      if ((_DWORD)v44 == 1)
      {
        _D19 = (float32x2_t)vdup_n_s32(0x404F5C28u);
        v328 = *(float *)(a4 + 204) * 3.24;
        v323 = *(float *)(a4 + 180) * 3.24;
        v331 = *(float *)(a4 + 216) * 3.24;
        __b = *(float *)(a4 + 208) * 3.24;
        v335 = *(float *)(a4 + 228) * 3.24;
        _D3 = vadd_f32(vmul_f32(*(float32x2_t *)(a4 + 100), _D19), (float32x2_t)1008981771);
        _S30 = DWORD1(v349);
        _S8 = v349;
        v123 = vadd_f32(vmul_f32(*(float32x2_t *)(a4 + 124), _D19), (float32x2_t)0x3C23D70B00000000);
        _KR00_8 = *((_QWORD *)&v349 + 1);
        v125 = vmla_n_f32(vmla_n_f32(0, _D3, *(float *)&v349), v123, *((float *)&v349 + 3));
        _D6 = v123;
        v127 = vadd_f32(vmul_f32(*(float32x2_t *)(a4 + 148), _D19), 0);
        _S12 = DWORD2(v350);
        v129 = vmla_n_f32(v125, v127, *((float *)&v350 + 2));
        v130 = v127;
        v131 = vmul_f32(*(float32x2_t *)(a4 + 172), _D19);
        v132 = vmla_f32(v129, 0, v131);
        _D28 = v131;
        v134 = vmul_f32(*(float32x2_t *)(a4 + 196), _D19);
        v135 = vmla_f32(v132, 0, v134);
        _D24 = v134;
        v137 = vmul_f32(*(float32x2_t *)(a4 + 220), _D19);
        _D11 = vmla_f32(v135, 0, v137);
        __asm { FMLA            S1, S10, V11.S[1] }
        _S23 = v350;
        __asm { FMLA            S14, S23, V11.S[1] }
        _S22 = DWORD1(v350);
        __asm { FMLA            S29, S22, V11.S[1] }
        v314 = _D3;
        v315 = v130;
        v316 = _D6;
        v317 = _D28;
        _S21 = HIDWORD(v350);
        v318 = _D24;
        v319 = v137;
        _D11 = vmla_f32(vmla_f32(vmla_f32(vmla_n_f32(vmla_n_f32(vmla_n_f32(0, _D3, *((float *)&v349 + 1)), _D6, *(float *)&v350), v130, *((float *)&v350 + 3)), 0, _D28), 0, _D24), 0, v137);
        __asm
        {
          FMLA            S27, S10, V11.S[1]
          FMLA            S26, S23, V11.S[1]
          FMLA            S25, S22, V11.S[1]
        }
        _D5 = vmul_f32(*(float32x2_t *)(a4 + 112), _D19);
        __asm { FMLA            S13, S8, V5.S[1] }
        _S7 = v351;
        _D0 = vmla_f32(vmla_f32(vmla_f32(vmla_n_f32(vmla_n_f32(vmla_n_f32(0, _D3, *((float *)&v349 + 2)), _D6, *((float *)&v350 + 1)), v130, *(float *)&v351), 0, _D28), 0, _D24), 0, v137);
        _D11.i32[0] = 0;
        _D24.f32[0] = (float)(*(float *)(a4 + 108) * 3.24) + 0.0;
        v304 = *(float *)(a4 + 120) * 3.24;
        v305 = *(float *)(a4 + 144) * 3.24;
        v156 = (float)(*(float *)(a4 + 132) * 3.24) + 0.0;
        _D20 = vmul_f32(*(float32x2_t *)(a4 + 136), _D19);
        __asm
        {
          FMLA            S13, S10, V20.S[1]
          FMLA            S17, S10, V0.S[1]
        }
        v160 = (float)(*(float *)(a4 + 156) * 3.24) + 0.01;
        _D4 = vmul_f32(*(float32x2_t *)(a4 + 160), _D19);
        v321 = vmul_f32(*(float32x2_t *)(a4 + 232), _D19);
        v322 = vmul_f32(*(float32x2_t *)(a4 + 188), _D19);
        v313 = (float)(*(float *)(a4 + 212) * 3.24) + 0.00000304617429;
        v325 = (float)(*(float *)(a4 + 240) * 3.24) + 0.00000304617429;
        v326 = (float)(*(float *)(a4 + 184) * 3.24) + 0.00000304617429;
        __asm
        {
          FMLA            S19, S30, V5.S[1]
          FMLA            S19, S23, V20.S[1]
          FMLA            S6, S23, V0.S[1]
          FMLA            S3, S22, V0.S[1]
          FMLA            S23, S9, V5.S[1]
          FMLA            S23, S22, V20.S[1]
        }
        _D28.f32[0] = (float)((float)((float)((float)((float)((float)(_D24.f32[0] * *(float *)&v349) + 0.0)
                                                    + (float)(v156 * *((float *)&v349 + 3)))
                                            + (float)(v160 * *((float *)&v350 + 2)))
                                    + (float)(v323 * 0.0))
                            + (float)(v328 * 0.0))
                    + (float)(v335 * 0.0);
        v306 = _S1 + (float)(*((float *)&v350 + 2) * _D28.f32[0]);
        v307 = _S14 + (float)(*((float *)&v350 + 3) * _D28.f32[0]);
        v308 = _S29 + (float)(*(float *)&v351 * _D28.f32[0]);
        v164 = (float)((float)((float)((float)((float)((float)(_D24.f32[0] * *((float *)&v349 + 1)) + 0.0)
                                             + (float)(v156 * *(float *)&v350))
                                     + (float)(v160 * *((float *)&v350 + 3)))
                             + (float)(v323 * 0.0))
                     + (float)(v328 * 0.0))
             + (float)(v335 * 0.0);
        v309 = _S27 + (float)(*((float *)&v350 + 2) * v164);
        v310 = _S26 + (float)(*((float *)&v350 + 3) * v164);
        v165 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, *(float *)&v349, _D5.f32[0]), *((float *)&v349 + 3), _D20.f32[0]), *((float *)&v350 + 2), _D4.f32[0]);
        __asm { FMLA            S13, S12, V4.S[1] }
        _D0.f32[0] = (float)((float)((float)((float)((float)((float)(_D24.f32[0] * *((float *)&v349 + 2)) + 0.0)
                                                   + (float)(v156 * *((float *)&v350 + 1)))
                                           + (float)(v160 * *(float *)&v351))
                                   + (float)(v323 * 0.0))
                           + (float)(v328 * 0.0))
                   + (float)(v335 * 0.0);
        v320 = _S17 + (float)(*((float *)&v350 + 2) * _D0.f32[0]);
        v167 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, *((float *)&v349 + 1), _D5.f32[0]), *(float *)&v350, _D20.f32[0]), *((float *)&v350 + 3), _D4.f32[0]);
        __asm { FMLA            S19, S21, V4.S[1] }
        v311 = _S25 + (float)(*(float *)&v351 * v164);
        v312 = _D6.f32[0] + (float)(*((float *)&v350 + 3) * _D0.f32[0]);
        v324 = _D3.f32[0] + (float)(*(float *)&v351 * _D0.f32[0]);
        v168 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, *((float *)&v349 + 2), _D5.f32[0]), *((float *)&v350 + 1), _D20.f32[0]), *(float *)&v351, _D4.f32[0]);
        __asm { FMLA            S23, S7, V4.S[1] }
        v170 = *(float *)(a4 + 168) * 3.24;
        *(float32x2_t *)(a4 + 112) = _D5;
        _D0.i32[0] = 0;
        __asm { FMLA            S0, S0, V5.S[1] }
        *(_DWORD *)(a4 + 108) = _D24.i32[0];
        *(float *)(a4 + 132) = v156;
        *(float32x2_t *)(a4 + 136) = _D20;
        __asm { FMLA            S0, S11, V20.S[1] }
        *(float *)(a4 + 120) = v304;
        *(float *)(a4 + 144) = v305;
        *(float *)(a4 + 156) = v160;
        v171 = (float)((float)((float)(_D24.f32[0] * 0.0) + 0.0) + (float)(v156 * 0.0)) + (float)(v160 * 0.0);
        *(float32x2_t *)(a4 + 160) = _D4;
        v172 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, 0.0, _D5.f32[0]), 0.0, _D20.f32[0]), 0.0, _D4.f32[0]);
        __asm { FMLA            S0, S11, V4.S[1] }
        *(float *)(a4 + 168) = v170;
        _D4.f32[0] = (float)((float)((float)(v304 * 0.0) + 0.0) + (float)(v305 * 0.0)) + (float)(v170 * 0.0);
        *(float32x2_t *)(a4 + 100) = v314;
        *(float32x2_t *)(a4 + 124) = v316;
        *(float32x2_t *)(a4 + 148) = v315;
        v173 = vmla_f32(vmla_f32(vmla_f32(0, 0, v314), 0, v316), 0, v315);
        *(float32x2_t *)(a4 + 172) = v317;
        v174 = vadd_f32(v317, v173);
        v175 = vmla_f32(v173, 0, v317);
        *(float32x2_t *)(a4 + 196) = v318;
        _D20 = vadd_f32(v322, 0);
        _D21 = vadd_f32(v321, 0);
        _D18 = vmla_f32(vmla_f32(v174, 0, v318), 0, v319);
        _D5 = vmla_f32(vadd_f32(v318, v175), 0, v319);
        *(float32x2_t *)(a4 + 220) = v319;
        _D29 = vadd_f32(v319, vmla_f32(v175, 0, v318));
        v181 = v313;
        v182 = _D21.f32[1] + (float)(vmlas_n_f32(_D0.f32[0], 0.0, _D20.f32[0]) + (float)(v181 * 0.0));
        v183 = v326;
        _D3.f32[0] = v325;
        __asm { FMLA            S28, S11, V20.S[1] }
        v184 = vmlas_n_f32((float)(v165 + (float)(v183 * 0.0)) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        __asm { FMLA            S13, S11, V21.S[1] }
        _D28.f32[0] = (float)(_D28.f32[0] + (float)((float)(v331 + 0.0) * 0.0)) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 100) = (float)((float)(v306 + (float)(v184 * 0.0)) + (float)(_S13 * 0.0))
                             + (float)(_D28.f32[0] * 0.0);
        *(float *)(a4 + 104) = (float)((float)(v307 + (float)(v184 * 0.0)) + (float)(_S13 * 0.0))
                             + (float)(_D28.f32[0] * 0.0);
        *(float *)(a4 + 108) = (float)((float)(v308 + (float)(v184 * 0.0)) + (float)(_S13 * 0.0))
                             + (float)(_D28.f32[0] * 0.0);
        __asm { FMLA            S27, S11, V20.S[1] }
        v187 = vmlas_n_f32((float)(v167 + (float)(v183 * 0.0)) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        __asm { FMLA            S19, S11, V21.S[1] }
        v188 = (float)(_S27 + (float)((float)(v331 + 0.0) * 0.0)) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 124) = (float)((float)(v309 + (float)(v187 * 0.0)) + (float)(_D19.f32[0] * 0.0))
                             + (float)(v188 * 0.0);
        *(float *)(a4 + 128) = (float)((float)(v310 + (float)(v187 * 0.0)) + (float)(_D19.f32[0] * 0.0))
                             + (float)(v188 * 0.0);
        *(float *)(a4 + 132) = (float)((float)(v311 + (float)(v187 * 0.0)) + (float)(_D19.f32[0] * 0.0))
                             + (float)(v188 * 0.0);
        __asm { FMLA            S6, S11, V20.S[1] }
        _D19.f32[0] = vmlas_n_f32((float)(v168 + (float)(v183 * 0.0)) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        __asm { FMLA            S23, S11, V21.S[1] }
        _D6.f32[0] = (float)(_D6.f32[0] + (float)((float)(v331 + 0.0) * 0.0)) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 148) = (float)((float)(v320 + (float)(_D19.f32[0] * 0.0)) + (float)(_S23 * 0.0))
                             + (float)(_D6.f32[0] * 0.0);
        *(float *)(a4 + 152) = (float)((float)(v312 + (float)(_D19.f32[0] * 0.0)) + (float)(_S23 * 0.0))
                             + (float)(_D6.f32[0] * 0.0);
        *(float *)(a4 + 184) = v183;
        *(float *)(a4 + 156) = (float)((float)(v324 + (float)(_D19.f32[0] * 0.0)) + (float)(_S23 * 0.0))
                             + (float)(_D6.f32[0] * 0.0);
        __asm { FMLA            S6, S11, V18.S[1] }
        _D18.f32[0] = vmlas_n_f32((float)(v172 + v183) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        _D6.f32[0] = _D6.f32[0]
                   + (float)((float)((float)((float)(v323 + v171) + (float)(v328 * 0.0)) + (float)(v335 * 0.0)) * 0.0);
        __asm { FMLA            S24, S11, V21.S[1] }
        v190 = (float)((float)(_D20.f32[1] + _D4.f32[0]) + (float)((float)(v331 + 0.0) * 0.0))
             + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 184) = (float)((float)(_D18.f32[0] + _D6.f32[0]) + (float)(_D24.f32[0] * 0.0))
                             + (float)(v190 * 0.0);
        *(float32x2_t *)(a4 + 188) = _D20;
        _D6.f32[0] = _D6.f32[0] + (float)(_D18.f32[0] * 0.0);
        *(float *)(a4 + 188) = (float)(_D24.f32[0] + _D6.f32[0]) + (float)(v190 * 0.0);
        *(float *)(a4 + 192) = v190 + (float)(_D6.f32[0] + (float)(_D24.f32[0] * 0.0));
        *(float *)(a4 + 180) = v323;
        _D6.f32[0] = v171 + (float)(v323 * 0.0);
        v191 = v172 + (float)(v183 * 0.0);
        *(float *)(a4 + 204) = v328;
        __asm { FMLA            S4, S11, V20.S[1] }
        *(float *)(a4 + 228) = v335;
        *(float *)(a4 + 208) = __b + 0.0;
        *(float *)(a4 + 212) = v181;
        *(float *)(a4 + 216) = v331 + 0.0;
        *(float32x2_t *)(a4 + 232) = _D21;
        v175.f32[0] = _D21.f32[0] + (float)(v191 + (float)((float)(__b + 0.0) * 0.0));
        _D18.f32[0] = vmlas_n_f32((float)(__b + 0.0) + v191, 0.0, _D21.f32[0]);
        __asm { FMLA            S0, S11, V21.S[1] }
        *(_DWORD *)(a4 + 240) = _D3.i32[0];
        v192 = (float)(_D4.f32[0] + (float)((float)(v331 + 0.0) * 0.0)) + _D3.f32[0];
        _D3.f32[0] = (float)((float)(v331 + 0.0) + _D4.f32[0]) + (float)(_D3.f32[0] * 0.0);
        __asm { FMLA            S4, S11, V5.S[1] }
        _D4.f32[0] = _D4.f32[0] + (float)((float)((float)(v328 + _D6.f32[0]) + (float)(v335 * 0.0)) * 0.0);
        *(float *)(a4 + 208) = (float)((float)(_D18.f32[0] + _D4.f32[0]) + (float)(_D0.f32[0] * 0.0))
                             + (float)(_D3.f32[0] * 0.0);
        _D4.f32[0] = _D4.f32[0] + (float)(_D18.f32[0] * 0.0);
        *(float *)(a4 + 212) = (float)(_D0.f32[0] + _D4.f32[0]) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 216) = _D3.f32[0] + (float)(_D4.f32[0] + (float)(_D0.f32[0] * 0.0));
        __asm { FMLA            S0, S11, V29.S[1] }
        _D0.f32[0] = _D0.f32[0] + (float)((float)(v335 + (float)(_D6.f32[0] + (float)(v328 * 0.0))) * 0.0);
        _D3.f32[0] = v175.f32[0] + _D0.f32[0];
        _D0.f32[0] = _D0.f32[0] + (float)(v175.f32[0] * 0.0);
        *(float *)(a4 + 232) = (float)(_D3.f32[0] + (float)(v182 * 0.0)) + (float)(v192 * 0.0);
        *(float *)(a4 + 236) = (float)(v182 + _D0.f32[0]) + (float)(v192 * 0.0);
        *(float *)(a4 + 240) = v192 + (float)(_D0.f32[0] + (float)(v182 * 0.0));
        *(_DWORD *)(a4 + 204) = 0;
        *(_QWORD *)(a4 + 196) = 0;
        *(_QWORD *)(a4 + 220) = 0;
        *(_DWORD *)(a4 + 228) = 0;
        *(_QWORD *)(a4 + 112) = 0;
        *(_DWORD *)(a4 + 120) = 0;
        *(_QWORD *)(a4 + 136) = 0;
        *(_DWORD *)(a4 + 144) = 0;
        *(_QWORD *)(a4 + 176) = 0;
        *(_QWORD *)(a4 + 160) = 0;
        *(_QWORD *)(a4 + 168) = 0;
        v193 = (float *)malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
        v194 = (char *)malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
        if (fabs(*((float *)&v350 + 2)) >= 1.0)
        {
          v206 = *((float *)&v349 + 1);
          v207 = *((float *)&v349 + 2);
          if (*((float *)&v350 + 2) <= -1.0)
          {
            v217 = atan2(v206, v207);
            v204 = 0.0;
            v201 = v217 + 0.0;
            v208 = 1061752795;
          }
          else
          {
            v201 = atan2(-v206, -v207);
            v204 = 0.0;
            v208 = -1085730853;
          }
          v205 = *(float *)&v208;
        }
        else
        {
          v195 = *(float *)&v351;
          v196 = *((float *)&v350 + 3);
          v197 = *((float *)&v349 + 3);
          v198 = *(float *)&v349;
          v199 = asin(-*((float *)&v350 + 2));
          v200 = atan2(v197, v198);
          v201 = atan2(v196, v195);
          v202 = v200;
          v203 = v199;
          v204 = v202 * 0.5;
          v205 = v203 * 0.5;
        }
        v218 = v201;
        v219 = __sincosf_stret(v204);
        v220 = __sincosf_stret(v205);
        v221 = __sincosf_stret(v218 * 0.5);
        v222 = (float)(v220.__cosval * v219.__cosval) * v221.__cosval;
        v223 = (float)(v220.__sinval * v219.__sinval) * v221.__sinval;
        v224 = (float)(v220.__cosval * v219.__cosval) * v221.__sinval;
        v225 = (float)(v220.__sinval * v219.__sinval) * v221.__cosval;
        v226 = (float)(v220.__cosval * v219.__sinval) * v221.__sinval;
        v227 = (float)(v220.__sinval * v219.__cosval) * v221.__cosval;
        v228 = (float)(v220.__cosval * v219.__sinval) * v221.__cosval;
        v229 = (float)(v220.__sinval * v219.__cosval) * v221.__sinval;
        v230 = v229 - v228;
        v231 = v227 + v226;
        v232 = v224 - v225;
        v233 = (float)-v223 - v222;
        v329 = v226 - v227;
        v330 = v229 + v228;
        v332 = v222 - v223;
        __ba = v225 + v224;
        v336 = v225 - v224;
        v327 = v228 - v229;
        v234 = v222 + v223;
        v235 = 1.0 - (float)(v234 * v234);
        v236 = acosf(v222 + v223);
        v237 = (float)(v236 + v236) / sqrtf(v235);
        v238 = -(float)(powf(v235, 1.5) - (float)((float)(v234 * v235) * v236));
        v239 = v238 / powf(v235, 2.5);
        v240 = (float)(v232 + v232) * v239;
        v241 = (float)(v231 + v231) * v239;
        v242 = (float)(v327 + v327) * v239;
        v243 = (float)((float)((float)((float)(v242 * v336) + 0.0) + (float)(v233 * 0.0)) + (float)(v327 * 0.0))
             + (float)(v237 * v231);
        v244 = (float)((float)((float)((float)((float)(v240 * v230) + 0.0) + (float)(v237 * v231)) + (float)(v232 * 0.0))
                     + (float)(v233 * 0.0))
             * 0.5;
        v245 = (float)((float)((float)((float)((float)(v241 * v230) + 0.0) + (float)(v231 * 0.0)) + (float)(v237 * v232))
                     + (float)(v233 * 0.0))
             * 0.5;
        v246 = (float)((float)((float)((float)((float)(v242 * v230) + 0.0) + (float)(v231 * 0.0)) + (float)(v232 * 0.0))
                     + (float)(v237 * v233))
             * 0.5;
        v247 = (float)((float)((float)((float)((float)(v240 * v329) + 0.0) + (float)(v237 * v330)) + (float)(v332 * 0.0))
                     + (float)(__ba * 0.0))
             * 0.5;
        v248 = (float)((float)((float)((float)((float)(v241 * v329) + 0.0) + (float)(v330 * 0.0)) + (float)(v237 * v332))
                     + (float)(__ba * 0.0))
             * 0.5;
        v249 = (float)((float)((float)((float)((float)(v242 * v329) + 0.0) + (float)(v330 * 0.0)) + (float)(v332 * 0.0))
                     + (float)(v237 * __ba))
             * 0.5;
        v250 = (float)((float)((float)((float)((float)(v240 * v336) + 0.0) + (float)(v237 * v233)) + (float)(v327 * 0.0))
                     + (float)(v231 * 0.0))
             * 0.5;
        v251 = (float)((float)((float)((float)((float)(v241 * v336) + 0.0) + (float)(v233 * 0.0)) + (float)(v237 * v327))
                     + (float)(v231 * 0.0))
             * 0.5;
        *v193 = v341[46];
        v193[1] = v341[47];
        v193[2] = v341[48];
        v193[3] = v341[52];
        v193[4] = v341[53];
        v193[5] = v341[54];
        v193[6] = v341[58];
        v193[7] = v341[59];
        v193[8] = v341[60];
        *((_DWORD *)v194 + 2) = 0;
        *(_QWORD *)v194 = 0;
        v252 = (float)(*v193 * v244) + 0.0;
        *(float *)v194 = v252;
        v253 = (float)(v193[1] * v244) + 0.0;
        *((float *)v194 + 1) = v253;
        v254 = (float)(v193[2] * v244) + 0.0;
        *((float *)v194 + 2) = v254;
        v255 = v252 + (float)(v193[3] * v247);
        *(float *)v194 = v255;
        v256 = v253 + (float)(v193[4] * v247);
        *((float *)v194 + 1) = v256;
        v257 = v254 + (float)(v193[5] * v247);
        *((float *)v194 + 2) = v257;
        *(float *)v194 = v255 + (float)(v193[6] * v250);
        *((float *)v194 + 1) = v256 + (float)(v193[7] * v250);
        *((float *)v194 + 2) = v257 + (float)(v193[8] * v250);
        *((_DWORD *)v194 + 5) = 0;
        *(_QWORD *)(v194 + 12) = 0;
        v258 = (float)(*v193 * v245) + 0.0;
        *((float *)v194 + 3) = v258;
        v259 = (float)(v193[1] * v245) + 0.0;
        *((float *)v194 + 4) = v259;
        v260 = (float)(v193[2] * v245) + 0.0;
        *((float *)v194 + 5) = v260;
        v261 = v258 + (float)(v193[3] * v248);
        *((float *)v194 + 3) = v261;
        v262 = v259 + (float)(v193[4] * v248);
        *((float *)v194 + 4) = v262;
        v263 = v260 + (float)(v193[5] * v248);
        *((float *)v194 + 5) = v263;
        *((float *)v194 + 3) = v261 + (float)(v193[6] * v251);
        *((float *)v194 + 4) = v262 + (float)(v193[7] * v251);
        *((float *)v194 + 5) = v263 + (float)(v193[8] * v251);
        *((_DWORD *)v194 + 8) = 0;
        *((_QWORD *)v194 + 3) = 0;
        v264 = (float)(*v193 * v246) + 0.0;
        *((float *)v194 + 6) = v264;
        v265 = (float)(v193[1] * v246) + 0.0;
        *((float *)v194 + 7) = v265;
        v266 = (float)(v193[2] * v246) + 0.0;
        *((float *)v194 + 8) = v266;
        v267 = v264 + (float)(v193[3] * v249);
        *((float *)v194 + 6) = v267;
        v268 = v265 + (float)(v193[4] * v249);
        *((float *)v194 + 7) = v268;
        v269 = v266 + (float)(v193[5] * v249);
        *((float *)v194 + 8) = v269;
        *((float *)v194 + 6) = v267 + (float)(v193[6] * (float)(v243 * 0.5));
        *((float *)v194 + 7) = v268 + (float)(v193[7] * (float)(v243 * 0.5));
        *((float *)v194 + 8) = v269 + (float)(v193[8] * (float)(v243 * 0.5));
        v341[48] = 0.0;
        *((_QWORD *)v341 + 23) = 0;
        v270 = (float)(v244 * *(float *)v194) + 0.0;
        v341[46] = v270;
        v271 = (float)(v245 * *(float *)v194) + 0.0;
        v341[47] = v271;
        v272 = (float)(v246 * *(float *)v194) + 0.0;
        v341[48] = v272;
        v273 = v270 + (float)(v247 * *((float *)v194 + 1));
        v341[46] = v273;
        v274 = v271 + (float)(v248 * *((float *)v194 + 1));
        v341[47] = v274;
        v275 = v272 + (float)(v249 * *((float *)v194 + 1));
        v341[48] = v275;
        v341[46] = v273 + (float)(v250 * *((float *)v194 + 2));
        v341[47] = v274 + (float)(v251 * *((float *)v194 + 2));
        v341[48] = v275 + (float)((float)(v243 * 0.5) * *((float *)v194 + 2));
        v341[54] = 0.0;
        *((_QWORD *)v341 + 26) = 0;
        v276 = (float)(v244 * *((float *)v194 + 3)) + 0.0;
        v341[52] = v276;
        v277 = (float)(v245 * *((float *)v194 + 3)) + 0.0;
        v341[53] = v277;
        v278 = (float)(v246 * *((float *)v194 + 3)) + 0.0;
        v341[54] = v278;
        v279 = v276 + (float)(v247 * *((float *)v194 + 4));
        v341[52] = v279;
        v280 = v277 + (float)(v248 * *((float *)v194 + 4));
        v341[53] = v280;
        v281 = v278 + (float)(v249 * *((float *)v194 + 4));
        v341[54] = v281;
        v341[52] = v279 + (float)(v250 * *((float *)v194 + 5));
        v341[53] = v280 + (float)(v251 * *((float *)v194 + 5));
        v341[54] = v281 + (float)((float)(v243 * 0.5) * *((float *)v194 + 5));
        v341[60] = 0.0;
        *((_QWORD *)v341 + 29) = 0;
        v282 = (float)(v244 * *((float *)v194 + 6)) + 0.0;
        v341[58] = v282;
        v283 = (float)(v245 * *((float *)v194 + 6)) + 0.0;
        v341[59] = v283;
        v284 = (float)(v246 * *((float *)v194 + 6)) + 0.0;
        v341[60] = v284;
        v285 = v282 + (float)(v247 * *((float *)v194 + 7));
        v341[58] = v285;
        v286 = v283 + (float)(v248 * *((float *)v194 + 7));
        v341[59] = v286;
        v287 = v284 + (float)(v249 * *((float *)v194 + 7));
        v341[60] = v287;
        v341[58] = v285 + (float)(v250 * *((float *)v194 + 8));
        v341[59] = v286 + (float)(v251 * *((float *)v194 + 8));
        v341[60] = v287 + (float)((float)(v243 * 0.5) * *((float *)v194 + 8));
        free(v193);
        v288 = v194;
        a4 = (uint64_t)v341;
        free(v288);
        v117 = a1 + 2056;
      }
      else
      {
        *(_DWORD *)(a4 + 96) = 0;
        memset_pattern16((void *)(a4 + 100), &unk_210BCDDC0, 0x90uLL);
      }
      vl_dump_detail(v342, a1, (double *)(*(_QWORD *)(a1 + 1016) + 288));
      v289 = v344;
      *(_OWORD *)a4 = v343;
      *(_OWORD *)(a4 + 16) = v289;
      v290 = v346;
      *(_OWORD *)(a4 + 32) = v345;
      *(_OWORD *)(a4 + 48) = v290;
      v291 = v348;
      *(_OWORD *)(a4 + 64) = v347;
      *(_OWORD *)(a4 + 80) = v291;
      v292 = *(_OWORD *)(a4 + 128);
      v293 = *(_OWORD *)(a4 + 144);
      v294 = *(_OWORD *)(a4 + 160);
      *(_OWORD *)(a1 + 14608) = *(_OWORD *)(a4 + 176);
      *(_OWORD *)(a1 + 14592) = v294;
      *(_OWORD *)(a1 + 14576) = v293;
      *(_OWORD *)(a1 + 14560) = v292;
      v295 = *(_OWORD *)(a4 + 192);
      v296 = *(_OWORD *)(a4 + 208);
      v297 = *(_OWORD *)(a4 + 224);
      *(_QWORD *)(a1 + 14672) = *(_QWORD *)(a4 + 240);
      *(_OWORD *)(a1 + 14656) = v297;
      *(_OWORD *)(a1 + 14640) = v296;
      *(_OWORD *)(a1 + 14624) = v295;
      v299 = *(_OWORD *)(a4 + 32);
      v298 = *(_OWORD *)(a4 + 48);
      v300 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)(a1 + 14432) = *(_OWORD *)a4;
      *(_OWORD *)(a1 + 14448) = v300;
      *(_OWORD *)(a1 + 14464) = v299;
      v301 = *(_OWORD *)(a4 + 96);
      v302 = *(_OWORD *)(a4 + 112);
      v303 = *(_OWORD *)(a4 + 80);
      *(_OWORD *)(a1 + 14496) = *(_OWORD *)(a4 + 64);
      *(_OWORD *)(a1 + 14544) = v302;
      *(_OWORD *)(a1 + 14528) = v301;
      *(_OWORD *)(a1 + 14480) = v298;
      *(_OWORD *)(a1 + 14512) = v303;
      v21 = v338;
      if (*(_DWORD *)(a1 + 976))
        update_history(a1 + 11664, v44, (__int128 *)a4, v339, a3, (__int128 *)(*(_QWORD *)(a1 + 1016) + 288), v117, (uint64_t)v340, *(_QWORD *)(a1 + 1016), a1);
      update_tracker_meta(a1 + 6992, a3, v117, *(_OWORD **)(a1 + 1016), (__int128 *)a4, v44, a1);
      vl_dump_result(v342, a4, (_OWORD *)(*(_QWORD *)(a1 + 1016) + 4), v44);
      vl_dump_stats(v342, a1);
      if (*(_DWORD *)(a1 + 12080)
        && (*(_BYTE *)(a1 + 12084) & 8) != 0
        && *(_DWORD *)(a1 + 12112)
        && *(_BYTE *)(a1 + 12628))
      {
        vl_t_print(a1, v342, 0);
      }
LABEL_54:
      vl_timer_stop((uint64_t)v21);
      if (*(_DWORD *)(a1 + 12076))
      {
        printf("Verbose : ");
        printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 12012), (double)*(uint64_t *)(a1 + 11984) * 0.000001);
        putchar(10);
        if (vl_os_log_once_token == -1)
          goto LABEL_56;
      }
      else
      {
        log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v48, v49, v50, v51, v52, v53, v54, (char)&str_4_1);
        if (vl_os_log_once_token == -1)
          goto LABEL_56;
      }
      dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
LABEL_56:
      v55 = vl_os_log_log;
      v56 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v57 = v56;
        if (os_signpost_enabled(v55))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v55, OS_SIGNPOST_INTERVAL_END, v57, "vl_locate", (const char *)&unk_210BCA1F1, (uint8_t *)buf, 2u);
        }
      }
      return v44;
  }
}

uint64_t update_tracker(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  int v9;
  size_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  __int128 v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  double v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float64x2_t v37;
  __int128 v38;
  __int128 v39;
  int v40[2];
  void *v41;
  void *v42;
  uint64_t v43;
  _OWORD v44[9];
  uint64_t v45;

  v45 = 0;
  memset(v44, 0, sizeof(v44));
  v9 = *(_DWORD *)(a4 + 4);
  if (v9 == 1)
    v10 = 64;
  else
    v10 = 256;
  v38 = 0uLL;
  v39 = 0uLL;
  v37 = 0uLL;
  if (*(_DWORD *)(a1 + 212))
  {
    *(_QWORD *)(a1 + 120) -= mach_absolute_time();
  }
  else
  {
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 32));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 16));
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)a1);
  }
  v11 = *a3;
  v12 = malloc_type_malloc(8 * *a3, 0xF8770C40uLL);
  if (v9 == 1)
    v13 = 6;
  else
    v13 = 8;
  v14 = (char *)malloc_type_malloc(*a3 << v13, 0xC392F6A1uLL);
  v40[0] = v11;
  v40[1] = v10;
  v41 = v12;
  v42 = v14;
  v43 = 0;
  if (*a3 >= 1)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (_QWORD *)(a3[1] + v16);
      *((_QWORD *)v12 + v17) = *v18;
      memcpy(&v15[v17++ << v13], v18 + 4, v10);
      v16 += 288;
    }
    while (*a3 > v17);
  }
  if (!*a5)
  {
    v19 = (char *)malloc_type_calloc(1uLL, 0x3E8uLL, 0x10B004018FDDA7FuLL);
    *((_QWORD *)v19 + 38) = malloc_type_calloc(*(int *)(a4 + 672), 0x370uLL, 0x10B0040F0DEE453uLL);
    *((_DWORD *)v19 + 148) = -1;
    memcpy(v19, (const void *)(a4 + 672), 0x130uLL);
    *(_OWORD *)(v19 + 712) = xmmword_210BCAB70;
    *(_OWORD *)(v19 + 728) = xmmword_210BCAB70;
    *(_OWORD *)(v19 + 744) = xmmword_210BCAB70;
    v20 = *(_OWORD *)(v19 + 728);
    *(_OWORD *)(v19 + 760) = *(_OWORD *)(v19 + 712);
    *(_OWORD *)(v19 + 776) = v20;
    *(_OWORD *)(v19 + 792) = *(_OWORD *)(v19 + 744);
    *a5 = (uint64_t)v19;
  }
  g_proj2_to_g_proj(a2 + 24, (uint64_t)v44, 0, 0);
  v37 = vcvtq_f64_f32(*(float32x2_t *)(a2 + 292));
  *(double *)&v38 = *(float *)(a2 + 300);
  v21 = *(float *)(a2 + 280);
  if (fabsf(v21) >= 1.0)
  {
    v27 = *(float *)(a2 + 260);
    if (v21 <= -1.0)
    {
      v24 = atan2f(v27, *(float *)(a2 + 264)) + 0.0;
      v25 = 0.0;
      v26 = 1.57079637;
    }
    else
    {
      v24 = atan2f(-v27, -*(float *)(a2 + 264));
      v25 = 0.0;
      v26 = -1.57079637;
    }
  }
  else
  {
    v22 = asinf(-v21);
    v23 = atan2f(*(float *)(a2 + 268), *(float *)(a2 + 256));
    v24 = atan2f(*(float *)(a2 + 284), *(float *)(a2 + 288));
    v25 = v23;
    v26 = v22;
  }
  *((double *)&v38 + 1) = v25;
  *(double *)&v39 = v26;
  *((double *)&v39 + 1) = v24;
  slam_tracker_vo_add(*a5, v37.f64, 0, (uint64_t)v44, *(_DWORD *)(a2 + 192), *(_DWORD *)(a2 + 196), v40, 0, 0.0, 0, 0, 0, 0, 0, 0);
  free(v41);
  free(v42);
  printf("Verbose : ");
  printf("Update slam vio tracker: %d track points", *(_QWORD *)(*a5 + 368));
  putchar(10);
  vl_timer_stop(a1);
  if (!*(_DWORD *)(a1 + 212))
    return log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v28, v29, v30, v31, v32, v33, v34, (char)&str_4_1);
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 148), (double)*(uint64_t *)(a1 + 120) * 0.000001);
  return putchar(10);
}

void update_tracker_meta(uint64_t a1, __int128 *a2, uint64_t a3, _OWORD *a4, __int128 *a5, int a6, uint64_t a7)
{
  __int128 v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD *v50;
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
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void **v66;
  uint64_t v67;
  uint64_t v68;
  _OWORD *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
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
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;

  v11 = 0uLL;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v99 = 0;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v84 = 0u;
  if (a4)
  {
    vl_inliers_clone((uint64_t)&v107, a3);
    v11 = *(_OWORD *)((char *)a4 + 4);
    v104 = a4[22];
    v105 = a4[23];
    v106 = a4[24];
    v100 = a4[18];
    v101 = a4[19];
    v102 = a4[20];
    v103 = a4[21];
    v86 = a5[2];
    v87 = a5[3];
    v84 = *a5;
    v85 = a5[1];
    v90 = a5[6];
    v91 = a5[7];
    v88 = a5[4];
    v89 = a5[5];
    v94 = a5[10];
    v95 = a5[11];
    v92 = a5[8];
    v93 = a5[9];
    v99 = *((_QWORD *)a5 + 30);
    v97 = a5[13];
    v98 = a5[14];
    v96 = a5[12];
  }
  if (a6 == 1)
    *(_DWORD *)(a1 + 372) = 1;
  v14 = *(_QWORD *)(a1 + 216);
  v15 = *(_QWORD *)(a1 + 232);
  v83 = v11;
  if (v14 >= v15)
  {
    if (v15)
      v16 = 2 * v15;
    else
      v16 = 1;
    if (v16 <= v14)
      v17 = v14 + 1;
    else
      v17 = v16;
    if (v17)
    {
      v18 = malloc_type_realloc(*(void **)(a1 + 224), 168 * v17, 0xD7E3667EuLL);
      v11 = v83;
      *(_QWORD *)(a1 + 224) = v18;
      v14 = *(_QWORD *)(a1 + 216);
    }
    *(_QWORD *)(a1 + 232) = v17;
  }
  *(_QWORD *)(a1 + 216) = v14 + 1;
  v19 = *(_QWORD *)(a1 + 224) + 168 * v14;
  v20 = a2[2];
  v21 = *a2;
  *(_OWORD *)(v19 + 16) = a2[1];
  *(_OWORD *)(v19 + 32) = v20;
  v22 = a2[3];
  v23 = a2[4];
  v24 = a2[6];
  *(_OWORD *)(v19 + 80) = a2[5];
  *(_OWORD *)(v19 + 96) = v24;
  *(_OWORD *)(v19 + 48) = v22;
  *(_OWORD *)(v19 + 64) = v23;
  v25 = a2[7];
  v26 = a2[8];
  v27 = a2[9];
  *(_QWORD *)(v19 + 160) = *((_QWORD *)a2 + 20);
  *(_OWORD *)(v19 + 128) = v26;
  *(_OWORD *)(v19 + 144) = v27;
  *(_OWORD *)(v19 + 112) = v25;
  *(_OWORD *)v19 = v21;
  v28 = *(_QWORD *)(a1 + 240);
  v29 = *(_QWORD *)(a1 + 256);
  if (v28 >= v29)
  {
    v30 = 2 * v29;
    v31 = v29 == 0;
    v32 = 3;
    if (!v31)
      v32 = v30;
    if (v32 <= v28)
      v33 = v28 + 1;
    else
      v33 = v32;
    if (v33)
    {
      v34 = malloc_type_realloc(*(void **)(a1 + 248), 80 * v33, 0x7F86C945uLL);
      v11 = v83;
      *(_QWORD *)(a1 + 248) = v34;
      v28 = *(_QWORD *)(a1 + 240);
    }
    *(_QWORD *)(a1 + 256) = v33;
  }
  *(_QWORD *)(a1 + 240) = v28 + 1;
  v35 = (_OWORD *)(*(_QWORD *)(a1 + 248) + 80 * v28);
  v36 = v111;
  v37 = v109;
  v35[3] = v110;
  v35[4] = v36;
  v38 = v108;
  *v35 = v107;
  v35[1] = v38;
  v35[2] = v37;
  v39 = *(_QWORD *)(a1 + 264);
  v40 = *(_QWORD *)(a1 + 280);
  if (v39 >= v40)
  {
    v41 = 2 * v40;
    v31 = v40 == 0;
    v42 = 16;
    if (!v31)
      v42 = v41;
    if (v42 <= v39)
      v43 = v39 + 1;
    else
      v43 = v42;
    if (v43)
    {
      v44 = malloc_type_realloc(*(void **)(a1 + 272), 16 * v43, 0x30DC2C38uLL);
      v11 = v83;
      *(_QWORD *)(a1 + 272) = v44;
      v39 = *(_QWORD *)(a1 + 264);
    }
    *(_QWORD *)(a1 + 280) = v43;
  }
  *(_QWORD *)(a1 + 264) = v39 + 1;
  *(_OWORD *)(*(_QWORD *)(a1 + 272) + 16 * v39) = v11;
  v45 = *(_QWORD *)(a1 + 288);
  v46 = *(_QWORD *)(a1 + 304);
  if (v45 >= v46)
  {
    v47 = 2 * v46;
    v31 = v46 == 0;
    v48 = 2;
    if (!v31)
      v48 = v47;
    if (v48 <= v45)
      v49 = v45 + 1;
    else
      v49 = v48;
    if (v49)
    {
      *(_QWORD *)(a1 + 296) = malloc_type_realloc(*(void **)(a1 + 296), 112 * v49, 0x37CD1277uLL);
      v45 = *(_QWORD *)(a1 + 288);
    }
    *(_QWORD *)(a1 + 304) = v49;
  }
  *(_QWORD *)(a1 + 288) = v45 + 1;
  v50 = (_OWORD *)(*(_QWORD *)(a1 + 296) + 112 * v45);
  *v50 = v100;
  v50[1] = v101;
  v50[5] = v105;
  v50[6] = v106;
  v50[2] = v102;
  v50[3] = v103;
  v50[4] = v104;
  v51 = *(_QWORD *)(a1 + 312);
  v52 = *(_QWORD *)(a1 + 328);
  if (v51 >= v52)
  {
    if (v52)
      v53 = 2 * v52;
    else
      v53 = 1;
    if (v53 <= v51)
      v54 = v51 + 1;
    else
      v54 = v53;
    if (v54)
    {
      *(_QWORD *)(a1 + 320) = malloc_type_realloc(*(void **)(a1 + 320), 248 * v54, 0x28A0E52AuLL);
      v51 = *(_QWORD *)(a1 + 312);
    }
    *(_QWORD *)(a1 + 328) = v54;
  }
  *(_QWORD *)(a1 + 312) = v51 + 1;
  v55 = *(_QWORD *)(a1 + 320) + 248 * v51;
  *(_OWORD *)(v55 + 192) = v96;
  *(_OWORD *)(v55 + 208) = v97;
  *(_OWORD *)(v55 + 224) = v98;
  *(_QWORD *)(v55 + 240) = v99;
  *(_OWORD *)(v55 + 128) = v92;
  *(_OWORD *)(v55 + 144) = v93;
  *(_OWORD *)(v55 + 160) = v94;
  *(_OWORD *)(v55 + 176) = v95;
  *(_OWORD *)(v55 + 64) = v88;
  *(_OWORD *)(v55 + 80) = v89;
  *(_OWORD *)(v55 + 96) = v90;
  *(_OWORD *)(v55 + 112) = v91;
  *(_OWORD *)v55 = v84;
  *(_OWORD *)(v55 + 16) = v85;
  *(_OWORD *)(v55 + 32) = v86;
  *(_OWORD *)(v55 + 48) = v87;
  v56 = *(_QWORD *)(a1 + 336);
  v57 = *(_QWORD *)(a1 + 352);
  if (v56 >= v57)
  {
    v58 = 2 * v57;
    v31 = v57 == 0;
    v59 = 64;
    if (!v31)
      v59 = v58;
    if (v59 <= v56)
      v60 = v56 + 1;
    else
      v60 = v59;
    if (v60)
    {
      *(_QWORD *)(a1 + 344) = malloc_type_realloc(*(void **)(a1 + 344), 4 * v60, 0x68464711uLL);
      v56 = *(_QWORD *)(a1 + 336);
    }
    *(_QWORD *)(a1 + 352) = v60;
  }
  *(_QWORD *)(a1 + 336) = v56 + 1;
  *(_DWORD *)(*(_QWORD *)(a1 + 344) + 4 * v56) = a6;
  v61 = *(_DWORD *)(a1 + 364) + 1;
  *(_DWORD *)(a1 + 364) = v61;
  ++*(_DWORD *)(a1 + 360);
  v62 = *(int *)(a7 + 652);
  if (v61 >= (int)v62 && *(_DWORD *)(a1 + 372))
  {
    *(_DWORD *)(a1 + 364) = 0;
    *(_QWORD *)(a1 + 368) = 1;
    v63 = *(_QWORD *)(a1 + 216);
    if (v63 <= v62)
      return;
  }
  else
  {
    *(_DWORD *)(a1 + 368) = 0;
    v63 = *(_QWORD *)(a1 + 216);
    if (v63 <= v62)
      return;
  }
  v64 = v63 - 1;
  if (v63 != 1)
  {
    memmove(*(void **)(a1 + 224), (const void *)(*(_QWORD *)(a1 + 224) + 168), 168 * v64);
    v64 = *(_QWORD *)(a1 + 216) - 1;
  }
  *(_QWORD *)(a1 + 216) = v64;
  v65 = *(_QWORD *)(a1 + 240);
  if (v65 < 1)
  {
    v68 = 0;
    goto LABEL_74;
  }
  v66 = *(void ***)(a1 + 248);
  free(v66[1]);
  free(v66[4]);
  free(v66[7]);
  v65 = *(_QWORD *)(a1 + 240);
  if (v65 >= 2)
  {
    v67 = 0;
    v68 = 0;
    do
    {
      v69 = (_OWORD *)(*(_QWORD *)(a1 + 248) + v67);
      v70 = v69[9];
      v71 = v69[7];
      v69[3] = v69[8];
      v69[4] = v70;
      v72 = v69[6];
      *v69 = v69[5];
      v69[1] = v72;
      v69[2] = v71;
      v73 = v68 + 2;
      ++v68;
      v65 = *(_QWORD *)(a1 + 240);
      v67 += 80;
    }
    while (v73 < v65);
LABEL_74:
    v74 = *(_QWORD *)(a1 + 256);
    if (v68 <= v74)
      goto LABEL_75;
    goto LABEL_87;
  }
  v68 = 0;
  v74 = *(_QWORD *)(a1 + 256);
  if (v74 >= 0)
  {
LABEL_75:
    v75 = v68 - v65;
    if (v68 <= v65)
      goto LABEL_76;
LABEL_95:
    bzero((void *)(*(_QWORD *)(a1 + 248) + 80 * *(_QWORD *)(a1 + 240)), 80 * v75);
    *(_QWORD *)(a1 + 240) = v68;
    v76 = *(_QWORD *)(a1 + 264) - 1;
    if (*(_QWORD *)(a1 + 264) == 1)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_87:
  v80 = 2 * v74;
  v31 = v74 == 0;
  v81 = 3;
  if (!v31)
    v81 = v80;
  if (v81 <= v68)
    v82 = v68;
  else
    v82 = v81;
  if (v82)
    *(_QWORD *)(a1 + 248) = malloc_type_realloc(*(void **)(a1 + 248), 80 * v82, 0x487A3CEuLL);
  *(_QWORD *)(a1 + 256) = v82;
  v75 = v68 - v65;
  if (v68 > v65)
    goto LABEL_95;
LABEL_76:
  *(_QWORD *)(a1 + 240) = v68;
  v76 = *(_QWORD *)(a1 + 264) - 1;
  if (*(_QWORD *)(a1 + 264) != 1)
  {
LABEL_77:
    memmove(*(void **)(a1 + 272), (const void *)(*(_QWORD *)(a1 + 272) + 16), 16 * v76);
    v76 = *(_QWORD *)(a1 + 264) - 1;
  }
LABEL_78:
  *(_QWORD *)(a1 + 264) = v76;
  v77 = *(_QWORD *)(a1 + 288) - 1;
  if (*(_QWORD *)(a1 + 288) != 1)
  {
    memmove(*(void **)(a1 + 296), (const void *)(*(_QWORD *)(a1 + 296) + 112), 112 * v77);
    v77 = *(_QWORD *)(a1 + 288) - 1;
  }
  *(_QWORD *)(a1 + 288) = v77;
  v78 = *(_QWORD *)(a1 + 312) - 1;
  if (*(_QWORD *)(a1 + 312) != 1)
  {
    memmove(*(void **)(a1 + 320), (const void *)(*(_QWORD *)(a1 + 320) + 248), 248 * v78);
    v78 = *(_QWORD *)(a1 + 312) - 1;
  }
  *(_QWORD *)(a1 + 312) = v78;
  v79 = *(_QWORD *)(a1 + 336) - 1;
  if (*(_QWORD *)(a1 + 336) != 1)
  {
    memmove(*(void **)(a1 + 344), (const void *)(*(_QWORD *)(a1 + 344) + 4), 4 * v79);
    v79 = *(_QWORD *)(a1 + 336) - 1;
  }
  *(_QWORD *)(a1 + 336) = v79;
}

uint64_t update_history(uint64_t a1, int a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __int128 v18;
  uint64_t v19;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v46[8];
  int v47;
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
  uint64_t v63;
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
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;

  bzero(v46, 0x360uLL);
  v18 = a3[13];
  v60 = a3[12];
  v61 = v18;
  v62 = a3[14];
  v19 = *((_QWORD *)a3 + 30);
  v20 = a3[9];
  v56 = a3[8];
  v57 = v20;
  v21 = a3[11];
  v58 = a3[10];
  v59 = v21;
  v22 = a3[5];
  v52 = a3[4];
  v53 = v22;
  v23 = a3[7];
  v54 = a3[6];
  v55 = v23;
  v24 = a3[1];
  v48 = *a3;
  v49 = v24;
  v25 = a3[3];
  v50 = a3[2];
  v51 = v25;
  v26 = *(_OWORD *)(a4 + 136);
  v27 = *(_OWORD *)(a4 + 168);
  v72 = *(_OWORD *)(a4 + 152);
  v73 = v27;
  v74 = *(_OWORD *)(a4 + 184);
  v28 = *(_OWORD *)(a4 + 72);
  v29 = *(_OWORD *)(a4 + 104);
  v68 = *(_OWORD *)(a4 + 88);
  v69 = v29;
  v70 = *(_OWORD *)(a4 + 120);
  v71 = v26;
  v30 = *(_OWORD *)(a4 + 40);
  v64 = *(_OWORD *)(a4 + 24);
  v65 = v30;
  v66 = *(_OWORD *)(a4 + 56);
  v67 = v28;
  v47 = a2;
  v31 = a5[9];
  v84 = a5[8];
  v85 = v31;
  v32 = a5[5];
  v80 = a5[4];
  v81 = v32;
  v33 = a5[7];
  v82 = a5[6];
  v83 = v33;
  v34 = a5[1];
  v76 = *a5;
  v77 = v34;
  v35 = a5[3];
  v78 = a5[2];
  v79 = v35;
  v36 = *((_QWORD *)a5 + 20);
  v63 = v19;
  v86 = v36;
  if (a9)
    v75 = *(_OWORD *)(a9 + 4);
  v37 = *(_QWORD *)a8;
  if (*(uint64_t *)a8 <= 0)
  {
    v87 = 0u;
    v88 = v37;
    goto LABEL_8;
  }
  v38 = malloc_type_malloc(288 * v37, 0x5FA3D4E9uLL);
  *((_QWORD *)&v87 + 1) = v38;
  v37 = *(_QWORD *)a8;
  v88 = v37;
  if (v37 <= 0)
  {
LABEL_8:
    v41 = a10;
    *(_QWORD *)&v87 = v37;
    goto LABEL_9;
  }
  v39 = v38;
  bzero(v38, 288 * v37);
  v40 = *(_QWORD *)a8;
  *(_QWORD *)&v87 = v40;
  v41 = a10;
  if (v40 >= 1)
    memcpy(v39, *(const void **)(a8 + 8), 288 * v40);
LABEL_9:
  if (a7)
  {
    v42 = a6[5];
    v93 = a6[4];
    v94 = v42;
    v95 = a6[6];
    v43 = a6[1];
    v89 = *a6;
    v90 = v43;
    v44 = a6[2];
    v92 = a6[3];
    v91 = v44;
    vl_inliers_clone((uint64_t)&v96, a7);
  }
  vl_context_history_add_frame(a1, v46);
  return vl_context_history_trim(a1, *(_DWORD *)(v41 + 980));
}

void vl_inliers_clone(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  if (*(uint64_t *)a2 >= 1)
  {
    v4 = malloc_type_malloc(8 * *(_QWORD *)a2, 0x26162EF0uLL);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = v4;
    v5 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)a2;
    if (v5 < 1)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v5 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)a2;
  if (v5 >= 1)
  {
LABEL_3:
    bzero(v4, 8 * v5);
    v5 = *(_QWORD *)a2;
  }
LABEL_4:
  *(_QWORD *)a1 = v5;
  if (*(uint64_t *)a2 >= 1)
    memcpy(*(void **)(a1 + 8), *(const void **)(a2 + 8), 8 * *(_QWORD *)a2);
  v6 = *(_QWORD *)(a2 + 24);
  if (v6 >= 1)
  {
    v7 = malloc_type_malloc(12 * v6, 0x94AB6477uLL);
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = v7;
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = v8;
    if (v8 < 1)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v8 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v8;
  if (v8 >= 1)
  {
LABEL_8:
    bzero(v7, 12 * v8);
    v8 = *(_QWORD *)(a2 + 24);
  }
LABEL_9:
  *(_QWORD *)(a1 + 24) = v8;
  v9 = *(_QWORD *)(a2 + 24);
  if (v9 >= 1)
    memcpy(*(void **)(a1 + 32), *(const void **)(a2 + 32), 12 * v9);
  v10 = *(_QWORD *)(a2 + 48);
  if (v10 >= 1)
  {
    v11 = malloc_type_malloc(8 * v10, 0x37168EFEuLL);
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = v11;
    v12 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = v12;
    if (v12 < 1)
      goto LABEL_14;
    goto LABEL_13;
  }
  v11 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v12 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = v12;
  if (v12 >= 1)
  {
LABEL_13:
    bzero(v11, 8 * v12);
    v12 = *(_QWORD *)(a2 + 48);
  }
LABEL_14:
  *(_QWORD *)(a1 + 48) = v12;
  v13 = *(_QWORD *)(a2 + 48);
  if (v13 >= 1)
    memcpy(*(void **)(a1 + 56), *(const void **)(a2 + 56), 8 * v13);
}

void log_msg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, ...)
{
  va_list va;

  va_start(va, a6);
  log_msg_internal(a1, a2, a3, a4, a5, 0, 0, a6, va);
}

uint64_t log_console_fmt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  const char **v12;
  const char **v13;
  const char *v14;
  const char *v15;
  const char *v16;
  int v17;
  int v18;
  char *v19;
  char *v20;
  char v21;
  char v22;
  int v23;
  int v24;
  int v25;
  char *v26;
  const char *v27;
  const char *v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  size_t v34;
  int v35;
  size_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char **v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v51;
  const char *v52;
  double v53;
  uint64_t v54;
  tm v55[18];
  timeval v56;
  _OWORD v57[2];
  _OWORD v58[2];
  uint64_t v59;

  v9 = MEMORY[0x24BDAC7A8]();
  v11 = v10;
  v13 = v12;
  v52 = v14;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = v9;
  v59 = *MEMORY[0x24BDAC8D0];
  memset(v58, 0, sizeof(v58));
  memset(v57, 0, sizeof(v57));
  bzero(&v55[0].tm_isdst, 0x400uLL);
  *(_QWORD *)&v55[0].tm_sec = 0;
  *(_QWORD *)&v55[0].tm_hour = 0;
  v53 = 0.0;
  v54 = 0;
  if ((v22 & 2) != 0)
  {
    *(_QWORD *)&v56.tv_usec = 0;
    v56.tv_sec = 0;
    if (gettimeofday(&v56, 0) || (double)(v56.tv_usec + 1000000 * v56.tv_sec) / 1000000.0 <= 1514764800.0)
      __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
    v25 = __sprintf_chk((char *)&v56, 0, 0x2728uLL, "(");
    v26 = strrchr(v20, 47);
    if (v26)
      v27 = v26 + 1;
    else
      v27 = v20;
    if (v25 <= 1)
      v28 = (const char *)&unk_210BC3C5E;
    else
      v28 = " ";
    if (v25 <= 1)
      v29 = 1;
    else
      v29 = 2;
    v30 = v11;
    if (v25 <= 1)
      v31 = v25;
    else
      v31 = v25 + 1;
    memcpy((char *)&v56 + v25, v28, v29);
    v32 = v31 + sprintf((char *)&v56 + v31, "%s:%d", v27, v18);
    v11 = v30;
    if (v32 <= 1)
      v33 = (const char *)&unk_210BC3C5E;
    else
      v33 = " ";
    if (v32 <= 1)
      v34 = 1;
    else
      v34 = 2;
    if (v32 <= 1)
      v35 = v32;
    else
      v35 = v32 + 1;
    memcpy((char *)&v56 + v32, v33, v34);
    v36 = strlen(v16);
    v37 = v36;
    memcpy((char *)&v56 + v35, v16, v36 + 1);
    *(_WORD *)((char *)&v56.tv_sec + v35 + v37) = 41;
    v24 = v35 + v37 + 1;
  }
  else
  {
    v24 = 0;
    LOBYTE(v56.tv_sec) = 0;
  }
  v38 = 31;
  v39 = v23;
  switch(v23)
  {
    case 1:
      goto LABEL_32;
    case 2:
      v39 = 0;
      v38 = 33;
      goto LABEL_32;
    case 3:
      LOBYTE(v58[0]) = 0;
      goto LABEL_33;
    case 4:
      v38 = 35;
      v39 = 1;
      goto LABEL_32;
    case 5:
      v39 = 0;
      v38 = 35;
LABEL_32:
      __sprintf_chk((char *)v58, 0, 0x20uLL, "%c[%d;%dm", 27, v39, v38);
LABEL_33:
      __sprintf_chk((char *)v57, 0, 0x20uLL, "%c[0m", 27);
      v51 = (&off_24CA9BD10)[v23];
      if (v11)
      {
        strcpy((char *)&v55[0].tm_isdst, "  ");
        v40 = snprintf((char *)&v55[0].tm_isdst + 2, 0x3FEuLL, "%s=", *v13);
        v41 = v40 + 2;
        v42 = snprintf_log_field_value((char *)&v55[0].tm_isdst + v41, 1022 - v40, (uint64_t)v13);
        v43 = v11 - 1;
        if (v11 != 1)
        {
          v44 = v41 + v42;
          v45 = (uint64_t)(v13 + 3);
          v46 = v13 + 3;
          do
          {
            v47 = v44 + snprintf((char *)&v55[0].tm_isdst + v44, 1024 - v44, ", ");
            v48 = *v46;
            v46 += 3;
            v49 = v47 + snprintf((char *)&v55[0].tm_isdst + v47, 1024 - v47, "%s=", v48);
            v44 = v49 + (int)snprintf_log_field_value((char *)&v55[0].tm_isdst + v49, 1024 - (int)v49, v45);
            v45 = (uint64_t)v46;
            --v43;
          }
          while (v43);
        }
      }
      if (v24 >= 1024)
        log_msg(2, 0, "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/util/log.c", 697, "log_console_fmt", "Exceeded log field buffer %d >= %d. Next log line will be cut short.", v24, 1024);
      *(_QWORD *)&v55[0].tm_mon = 0;
      *(_QWORD *)&v55[0].tm_wday = 0;
      gettimeofday((timeval *)&v55[0].tm_mon, 0);
      v55[0].tm_sec = *(_QWORD *)&v55[0].tm_mon / 86400;
      *(double *)&v55[0].tm_hour = (double)v55[0].tm_wday / 1000.0 / 1000.0
                                 + (double)(*(_QWORD *)&v55[0].tm_mon - 86400 * v55[0].tm_sec);
      dtime_get(v55, 0, 0, 0, (int *)&v54 + 1, (int *)&v54, &v53, 1000000);
      fprintf(a9, "%02d:%02d:%02d %s%-7s%s: %s%s%s\n", HIDWORD(v54), v54, (int)v53, (const char *)v58, v51, (const char *)&v56, v52, (const char *)&v55[0].tm_isdst, (const char *)v57);
      return fflush(a9);
    default:
      abort();
  }
}

uint64_t log_to_other_targets_lf(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (targets[0])
  {
    v15 = result;
    if (pthread_rwlock_rdlock(&targets_lock))
      __assert_rtn("log_to_other_targets_lf", "log.c", 874, "err == 0 && \"Could not acquire lock of targets variable. Has log been initialized?\"");
    v16 = targets[0];
    if (targets[0])
    {
      v17 = 0;
      do
      {
        if (*(_DWORD *)(v16 + 32) >= v15)
        {
          v18 = *(_DWORD *)(v16 + 8);
          if (v18 == 1)
          {
            (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16)(*(_QWORD *)(v16 + 24), *(unsigned int *)(v16 + 36), v15, a2, a3, a4, a5, a6, a7, a8);
          }
          else if (!v18)
          {
            (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16)(*(_QWORD *)(v16 + 24), *(unsigned int *)(v16 + 36), v15, a2, a3, a4, a5, a6, v20, v21);
          }
        }
        if (v17 > 8)
          break;
        v19 = &targets[v17++];
        v16 = v19[1];
      }
      while (v16);
    }
    result = pthread_rwlock_unlock(&targets_lock);
    if ((_DWORD)result)
      __assert_rtn("log_to_other_targets_lf", "log.c", 888, "err == 0 && \"Could not release log lock\"");
  }
  return result;
}

__darwin_time_t toc_explicit(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, const char *a8, char a9)
{
  __darwin_time_t v17;
  uint64_t v18;
  uint64_t v19;
  FILE *v20;
  FILE *v21;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  FILE *v27;
  FILE *v28;
  uint64_t v30;
  __darwin_time_t result;
  char v32[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36[8];
  uint64_t v37;
  timeval v38;
  char __str[1024];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 3)
  {
    *(_QWORD *)v36 = 0;
    v37 = 0;
    v34 = 0u;
    v35 = 0u;
    *(_OWORD *)v32 = 0u;
    v33 = 0u;
    v38.tv_sec = 0;
    *(_QWORD *)&v38.tv_usec = 0;
    if (gettimeofday(&v38, 0) || (v17 = v38.tv_usec + 1000000 * v38.tv_sec, (double)v17 / 1000000.0 <= 1514764800.0))
LABEL_38:
      __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
    v18 = v17 - a2;
    vsnprintf(__str, 0x400uLL, a8, &a9);
    if (a3)
    {
      if (v18 <= 1)
        v19 = 1;
      else
        v19 = v18;
      snprintf(v36, 0x10uLL, " = %8d Hz", llround(1000000.0 / (double)v19));
    }
    if (a4)
    {
      v20 = fopen("/proc/self/status", "rt");
      if (v20)
      {
        v21 = v20;
        while (fgets((char *)&v38, 512, v21))
        {
          if (LODWORD(v38.tv_sec) == *(_DWORD *)"VmRSS:" && WORD2(v38.tv_sec) == *(unsigned __int16 *)"S:")
          {
            v23 = atol((const char *)&v38.tv_sec + 6);
            goto LABEL_21;
          }
        }
        v23 = -1;
LABEL_21:
        fclose(v21);
      }
      else
      {
        v23 = -1;
      }
      v24 = (double)v23;
      v25 = (double)v23 * 0.000000953674316;
      v26 = ((double)v23 - *(double *)&toc_explicit_last_mem_usage) * 0.000000953674316;
      v27 = fopen("/proc/self/status", "rt");
      if (v27)
      {
        v28 = v27;
        while (fgets((char *)&v38, 512, v28))
        {
          if (LODWORD(v38.tv_sec) == *(_DWORD *)"VmSize:" && *(_DWORD *)((char *)&v38.tv_sec + 3) == *(_DWORD *)"ize:")
          {
            v30 = atol((const char *)&v38.tv_sec + 7);
            goto LABEL_33;
          }
        }
        v30 = -1;
LABEL_33:
        fclose(v28);
      }
      else
      {
        v30 = -1;
      }
      snprintf(v32, 0x40uLL, ", RSS = %6.2f GB (delta: %6.2f GB), VM = %6.2f GB", v25, v26, (double)v30 * 0.000000953674316);
      toc_explicit_last_mem_usage = *(_QWORD *)&v24;
    }
    snprintf((char *)&v38, 0x800uLL, "toc: %12.2f ms%s%s (%s)", (double)v18 * 0.001, v36, v32, __str);
    log_msg(a1, 0, a5, a6, a7, "%s", (const char *)&v38);
  }
  v38.tv_sec = 0;
  *(_QWORD *)&v38.tv_usec = 0;
  if (gettimeofday(&v38, 0))
    goto LABEL_38;
  result = v38.tv_usec + 1000000 * v38.tv_sec;
  if ((double)result / 1000000.0 <= 1514764800.0)
    goto LABEL_38;
  return result;
}

_BYTE *log_args_buf(char *a1, int a2, void **a3, char *__format, va_list a5)
{
  _BYTE *v8;
  int v9;
  size_t v10;
  char *v11;
  uint64_t v12;

  v8 = a1;
  v9 = vsnprintf(a1, a2, __format, a5);
  if (v9 < 0)
    return 0;
  if (v8 && v9 < a2)
    goto LABEL_6;
  v10 = (v9 + 1);
  v11 = (char *)malloc_type_malloc(v10, 0x89E5C99DuLL);
  *a3 = v11;
  if (!v11)
    return 0;
  v9 = vsnprintf(v11, v10, __format, a5);
  v8 = *a3;
  if (v9 < 0)
  {
    free(*a3);
    return 0;
  }
LABEL_6:
  if (v9)
  {
    v12 = (v9 - 1);
    if (v8[v12] == 10)
      v8[v12] = 0;
  }
  return v8;
}

uint64_t snprintf_log_field_value(char *a1, int a2, uint64_t a3)
{
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t *v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;

  switch(*(_DWORD *)(a3 + 16))
  {
    case 0:
      return snprintf(a1, a2, "\"%s\"");
    case 1:
      return snprintf(a1, a2, "%d");
    case 2:
      return snprintf(a1, a2, "%u");
    case 3:
      return snprintf(a1, a2, "%lld");
    case 4:
      return snprintf(a1, a2, "%llu");
    case 5:
    case 6:
      return snprintf(a1, a2, "%f");
    case 7:
      v7 = snprintf(a1, a2 & ~(a2 >> 31), "[");
      v8 = v7;
      v9 = *(_QWORD *)(a3 + 8);
      if (*(uint64_t *)v9 >= 1)
      {
        v10 = **(_QWORD **)(v9 + 8);
        v27 = &unk_210BC3C5E;
        v28 = v10;
        v29 = 0;
        v8 = snprintf_log_field_value(&a1[v7], (a2 - v7) & ~((a2 - v7) >> 31), &v27) + v7;
        if (*(uint64_t *)v9 >= 2)
        {
          v11 = 1;
          do
          {
            v12 = *(_QWORD *)(*(_QWORD *)(v9 + 8) + 8 * v11);
            v27 = &unk_210BC3C5E;
            v28 = v12;
            v29 = 0;
            v13 = v8 + (uint64_t)snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), ",");
            v8 = snprintf_log_field_value(&a1[v13], (a2 - (_DWORD)v13) & ~((a2 - (int)v13) >> 31), &v27)
               + v13;
            ++v11;
          }
          while (v11 < *(_QWORD *)v9);
        }
      }
      goto LABEL_24;
    case 8:
      v14 = snprintf(a1, a2 & ~(a2 >> 31), "[");
      v8 = v14;
      v15 = *(uint64_t **)(a3 + 8);
      if (*v15 >= 1)
      {
        v16 = (_DWORD *)v15[1];
        v28 = 0;
        v29 = 0;
        v27 = &unk_210BC3C5E;
        LODWORD(v28) = *v16;
        LODWORD(v29) = 1;
        v8 = snprintf_log_field_value(&a1[v14], (a2 - v14) & ~((a2 - v14) >> 31), &v27) + v14;
        if (*v15 >= 2)
        {
          v17 = 1;
          do
          {
            v18 = v15[1];
            v28 = 0;
            v29 = 0;
            v27 = &unk_210BC3C5E;
            LODWORD(v28) = *(_DWORD *)(v18 + 4 * v17);
            LODWORD(v29) = 1;
            v19 = v8 + (uint64_t)snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), ",");
            v8 = snprintf_log_field_value(&a1[v19], (a2 - (_DWORD)v19) & ~((a2 - (int)v19) >> 31), &v27)
               + v19;
            ++v17;
          }
          while (v17 < *v15);
        }
      }
      goto LABEL_24;
    case 9:
      v20 = snprintf(a1, a2 & ~(a2 >> 31), "[");
      v8 = v20;
      v21 = *(uint64_t **)(a3 + 8);
      if (*v21 >= 1)
      {
        v22 = (uint64_t *)v21[1];
        v29 = 6;
        v27 = &unk_210BC3C5E;
        v28 = *v22;
        v8 = snprintf_log_field_value(&a1[v20], (a2 - v20) & ~((a2 - v20) >> 31), &v27) + v20;
        if (*v21 >= 2)
        {
          v23 = 1;
          do
          {
            v24 = v21[1];
            v29 = 6;
            v25 = *(_QWORD *)(v24 + 8 * v23);
            v27 = &unk_210BC3C5E;
            v28 = v25;
            v26 = v8 + (uint64_t)snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), ",");
            v8 = snprintf_log_field_value(&a1[v26], (a2 - (_DWORD)v26) & ~((a2 - (int)v26) >> 31), &v27)
               + v26;
            ++v23;
          }
          while (v23 < *v21);
        }
      }
LABEL_24:
      result = (snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), "]") + v8);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void log_msg_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char *__format, va_list a9)
{
  const char *v16;
  const char *v17;
  FILE *v18;
  char *v19;
  size_t v20;
  char *v21;
  void *v22;
  char v23[1024];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  if (a1 <= 3)
  {
    v16 = log_args_buf(v23, 1024, &v22, __format, a9);
    if (!v16)
    {
LABEL_15:
      free(v22);
      return;
    }
    v17 = v16;
    if (running_in_bootstrapped_env_ret == -1)
    {
      v19 = getenv("SCHEDULER_BOOTSTRAP");
      if (v19)
      {
        running_in_bootstrapped_env_ret = *v19 != 0;
        v18 = (FILE *)*MEMORY[0x24BDAC8E8];
        if (running_in_bootstrapped_env_ret)
          goto LABEL_5;
      }
      else
      {
        running_in_bootstrapped_env_ret = 0;
        v18 = (FILE *)*MEMORY[0x24BDAC8E8];
      }
    }
    else
    {
      v18 = (FILE *)*MEMORY[0x24BDAC8E8];
      if (running_in_bootstrapped_env_ret)
      {
LABEL_5:
        log_to_file_handle((uint64_t)v18, 2, a1, a2, a3, a4, a5, (uint64_t)v17, a6, a7);
LABEL_14:
        log_to_other_targets_lf(a1, a2, a3, a4, a5, (uint64_t)v17, a6, a7);
        goto LABEL_15;
      }
    }
    if ((a2 & 2) != 0)
    {
      v20 = strlen(v17);
      v21 = (char *)malloc_type_calloc(v20 + 12, 1uLL, 0x100004077774924uLL);
      sprintf(v21, "CRITICAL - %s", v17);
      log_console_fmt(a1, a2, a3, a4, a5, (uint64_t)v21, a6, a7, v18);
      if (v21)
        free(v21);
    }
    else
    {
      log_console_fmt(a1, a2, a3, a4, a5, (uint64_t)v17, a6, a7, v18);
    }
    goto LABEL_14;
  }
}

void log_to_file_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  FILE *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  double v31;
  size_t v32;
  unint64_t v33;
  size_t v34;
  unsigned int v35;
  size_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  BOOL v41;
  char *v42;
  unsigned int v43;
  uint64_t v45;
  char *v46;
  unsigned int v47;
  int v48;
  char *v49;
  unsigned int v50;
  int v51;
  int v52;
  uint64_t v53;
  int v54;
  const char **v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  tm v59;
  time_t v60;
  char v61[1024];
  char __str[128];
  timeval v63;
  char v64;
  uint64_t v65;

  v10 = MEMORY[0x24BDAC7A8]();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = v11;
  v23 = (FILE *)v10;
  v24 = a9;
  v65 = *MEMORY[0x24BDAC8D0];
  if ((v20 & 2) != 0)
  {
    v28 = v13;
    v29 = v12;
    v30 = strlen(v14);
    v26 = (char *)malloc_type_calloc(v30 + 12, 1uLL, 0x100004077774924uLL);
    sprintf(v26, "CRITICAL - %s", v15);
    v12 = v29;
    v13 = v28;
    v25 = v26;
    v27 = a10;
    if (v22 != 2)
      goto LABEL_3;
LABEL_8:
    bzero(v61, 0x400uLL);
    *(_QWORD *)&v63.tv_usec = 0;
    v63.tv_sec = 0;
    if (gettimeofday(&v63, 0)
      || (v31 = (double)(v63.tv_usec + 1000000 * v63.tv_sec) / 1000000.0, v31 <= 1514764800.0))
    {
      __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
    }
    v32 = strlen(v26);
    v64 = 0;
    if (v32)
    {
      v33 = 0;
      v34 = 0;
      do
      {
        v35 = v26[v34];
        if (v35 > 0x21)
        {
          if (v35 == 92 || v35 == 34)
          {
            if (v33 > 0x27FD)
              break;
            *((_BYTE *)&v63.tv_sec + v33++) = 92;
          }
        }
        else if (v35 == 10 || v35 == 13)
        {
          LOBYTE(v35) = 95;
        }
        *((_BYTE *)&v63.tv_sec + v33++) = v35;
        ++v34;
      }
      while (v34 < v32 && v33 < 0x27FF);
      if (v33 > 0x27FE)
        goto LABEL_30;
    }
    else
    {
      v33 = 0;
    }
    *((_BYTE *)&v63.tv_sec + v33) = 0;
LABEL_30:
    v37 = strlen((const char *)&v63);
    v38 = 0;
    v39 = (char *)&v63 + v37 - 1;
    v40 = MEMORY[0x24BDAC740];
    do
    {
      while (1)
      {
        v42 = (char *)&v63 + v38;
        v43 = *((char *)&v63.tv_sec + v38);
        if ((v43 & 0x80000000) != 0)
          break;
        ++v38;
        if ((*(_DWORD *)(v40 + 4 * v43 + 60) & 0x4000) == 0 || v42 >= v39)
          goto LABEL_41;
      }
      ++v38;
      if (__maskrune(v43, 0x4000uLL))
        v41 = v42 >= v39;
      else
        v41 = 1;
    }
    while (!v41);
LABEL_41:
    v45 = v37 - v38 + 1;
    v46 = (char *)&v63 + v38 - 1;
    do
    {
      v47 = *v39;
      if ((v47 & 0x80000000) != 0)
      {
        v48 = __maskrune(v47, 0x4000uLL);
        v49 = v39 - 1;
        --v45;
        if (v39 <= v46)
          break;
      }
      else
      {
        v48 = *(_DWORD *)(v40 + 4 * v47 + 60) & 0x4000;
        v49 = v39 - 1;
        --v45;
        if (v39 <= v46)
          break;
      }
      v39 = v49;
    }
    while (v48);
    if (v46 <= v49 + 1)
    {
      v50 = *v46;
      if ((v50 & 0x80000000) != 0)
        v51 = __maskrune(v50, 0x4000uLL);
      else
        v51 = *(_DWORD *)(v40 + 4 * v50 + 60) & 0x4000;
      if (v51)
        v52 = v45;
      else
        v52 = v45 + 1;
      v53 = v52;
      __memmove_chk();
      *((_BYTE *)&v63.tv_sec + v53) = 0;
    }
    if (v27)
    {
      v54 = 0;
      v55 = (const char **)a9;
      do
      {
        v56 = *v55;
        v55 += 3;
        v57 = v54 + (uint64_t)snprintf(&v61[v54], (1024 - v54) & ~((1024 - v54) >> 31), ",\"%s\":", v56);
        v54 = v57 + snprintf_log_field_value(&v61[v57], (1024 - v57) & ~((1024 - (int)v57) >> 31), v24);
        v24 = (uint64_t)v55;
        --v27;
      }
      while (v27);
      if (v54 >= 1024)
        log_msg(2, 0, "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/util/log.c", 798, "log_bootstrap_fmt", "Exceeded log field buffer %d >= %d. Next log line will be cut short.", v54, 1024);
    }
    v60 = (uint64_t)v31;
    memset(&v59, 0, sizeof(v59));
    gmtime_r(&v60, &v59);
    if (snprintf(__str, 0x80uLL, "%d-%02d-%02dT%02d:%02d:%02d.%06d", v59.tm_year + 1900, v59.tm_mon + 1, v59.tm_mday, v59.tm_hour, v59.tm_min, v59.tm_sec, (int)((v31 - floor(v31)) * 1000000.0)) >= 0x80)__assert_rtn("timestamp_ISO_8601", "log.c", 735, "len > snprintf(buf, len, \"%d-%02d-%02dT%02d:%02d:%02d.%06d\", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec, (int)((timestamp - floor(timestamp)) * 1000000)) && \"timestamp truncated\"");
    fprintf(v23, "{\"time\":\"%sZ\",\"level\":\"%s\",\"msg\":\"%s\",\"file\":\"%s\",\"function\":\"%s\",\"line\":%d%s}\n", v58, __str);
    goto LABEL_62;
  }
  v25 = 0;
  v26 = (char *)v14;
  v27 = a10;
  if (v11 == 2)
    goto LABEL_8;
LABEL_3:
  if (v22 == 1)
  {
    log_console_fmt(v12, v21, v19, v13, v17, (uint64_t)v26, a9, v27, v23);
    goto LABEL_63;
  }
  if (v22 || !*v15)
    goto LABEL_63;
  fprintf(v23, "%s\n", v12);
LABEL_62:
  fflush(v23);
LABEL_63:
  if (v25)
    free(v25);
}

double g_frustum_corners_from_camera(float64x2_t *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float64_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float64_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float64_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float64_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  double result;
  _BYTE v46[24];
  _BYTE v47[24];
  __int128 v48;
  float64x2_t v49;
  double v50;
  float64x2_t v51[2];
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v46 = 0x3FF0000000000000;
  *(_OWORD *)&v46[8] = 0u;
  *(_OWORD *)v47 = 0u;
  *(_QWORD *)&v47[16] = 0x3FF0000000000000;
  v48 = 0u;
  v49 = 0u;
  v50 = 1.0;
  memset(v51, 0, sizeof(v51));
  v52 = 1.0;
  g_rot_xyz((double *)v46, -a1[2].f64[1], -a1[2].f64[0], -a1[1].f64[1]);
  v8 = a1->f64[0];
  v9 = a1->f64[1];
  v10 = a1[1].f64[0];
  *(double *)v46 = *(double *)v46 + *(double *)v47 * a1->f64[0];
  *(double *)&v46[8] = *(double *)&v46[8] + *(double *)v47 * v9;
  *(double *)&v46[16] = *(double *)&v46[16] + *(double *)v47 * v10;
  *(double *)&v47[8] = *(double *)&v47[8] + *((double *)&v48 + 1) * v8;
  *(double *)&v47[16] = *(double *)&v47[16] + *((double *)&v48 + 1) * v9;
  *(double *)&v48 = *(double *)&v48 + *((double *)&v48 + 1) * v10;
  v49.f64[0] = v49.f64[0] + v51[0].f64[0] * v8;
  v49.f64[1] = v49.f64[1] + v51[0].f64[0] * v9;
  v50 = v50 + v51[0].f64[0] * v10;
  v51[0].f64[1] = v51[0].f64[1] + v52 * v8;
  v51[1].f64[0] = v51[1].f64[0] + v52 * v9;
  v51[1].f64[1] = v51[1].f64[1] + v52 * v10;
  g_improj_to_xyz(a2, 1, 1, (double *)a3, (double *)(a3 + 8), (double *)(a3 + 16), 0.5, 0.5);
  v11 = *(double *)a3;
  v12 = *(double *)(a3 + 8);
  v13 = *(double *)(a3 + 16);
  v14 = a1[1].f64[0];
  v15 = v51[1].f64[1] + v12 * *(double *)&v48 + *(double *)&v46[16] * *(double *)a3 + v50 * v13 - v14;
  *(double *)(a3 + 112) = v14 + v15 * a5;
  v16 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v12), *(float64x2_t *)v46, v11), v49, v13), *(float64x2_t *)((char *)v51 + 8));
  v17 = *a1;
  v18 = vsubq_f64(v16, *a1);
  *(float64x2_t *)(a3 + 96) = vmlaq_n_f64(*a1, v18, a5);
  *(float64x2_t *)a3 = vmlaq_n_f64(v17, v18, a4);
  *(double *)(a3 + 16) = v14 + v15 * a4;
  g_improj_to_xyz(a2, 1, 1, (double *)(a3 + 24), (double *)(a3 + 32), (double *)(a3 + 40), -0.5, 0.5);
  v19 = *(double *)(a3 + 24);
  v20 = *(double *)(a3 + 32);
  v21 = *(double *)(a3 + 40);
  v22 = a1[1].f64[0];
  v23 = v51[1].f64[1] + v20 * *(double *)&v48 + *(double *)&v46[16] * v19 + v50 * v21 - v22;
  *(double *)(a3 + 136) = v22 + v23 * a5;
  v24 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v20), *(float64x2_t *)v46, v19), v49, v21), *(float64x2_t *)((char *)v51 + 8));
  v25 = *a1;
  v26 = vsubq_f64(v24, *a1);
  *(float64x2_t *)(a3 + 120) = vmlaq_n_f64(*a1, v26, a5);
  *(float64x2_t *)(a3 + 24) = vmlaq_n_f64(v25, v26, a4);
  *(double *)(a3 + 40) = v22 + v23 * a4;
  g_improj_to_xyz(a2, 1, 1, (double *)(a3 + 48), (double *)(a3 + 56), (double *)(a3 + 64), 0.5, -0.5);
  v27 = *(double *)(a3 + 48);
  v28 = *(double *)(a3 + 56);
  v29 = *(double *)(a3 + 64);
  v30 = a1[1].f64[0];
  v31 = v51[1].f64[1] + v28 * *(double *)&v48 + *(double *)&v46[16] * v27 + v50 * v29 - v30;
  *(double *)(a3 + 160) = v30 + v31 * a5;
  v32 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v28), *(float64x2_t *)v46, v27), v49, v29), *(float64x2_t *)((char *)v51 + 8));
  v33 = *a1;
  v34 = vsubq_f64(v32, *a1);
  *(float64x2_t *)(a3 + 144) = vmlaq_n_f64(*a1, v34, a5);
  *(float64x2_t *)(a3 + 48) = vmlaq_n_f64(v33, v34, a4);
  *(double *)(a3 + 64) = v30 + v31 * a4;
  g_improj_to_xyz(a2, 1, 1, (double *)(a3 + 72), (double *)(a3 + 80), (double *)(a3 + 88), -0.5, -0.5);
  v35 = *(double *)(a3 + 72);
  v36 = *(double *)(a3 + 80);
  v37 = *(double *)(a3 + 88);
  v38 = a1[1].f64[0];
  v39 = v51[1].f64[1] + v36 * *(double *)&v48 + *(double *)&v46[16] * v35 + v50 * v37 - v38;
  *(double *)(a3 + 184) = v38 + v39 * a5;
  v40 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v36), *(float64x2_t *)v46, v35), v49, v37), *(float64x2_t *)((char *)v51 + 8));
  v41 = *a1;
  v42 = vsubq_f64(v40, *a1);
  *(float64x2_t *)(a3 + 168) = vmlaq_n_f64(*a1, v42, a5);
  *(float64x2_t *)(a3 + 72) = vmlaq_n_f64(v41, v42, a4);
  result = v38 + v39 * a4;
  *(double *)(a3 + 88) = result;
  return result;
}

void g_frustum_from_camera(double *a1, float64x2_t *a2, uint64_t a3, double a4, double a5)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  g_frustum_corners_from_camera(a2, a3, (uint64_t)&v81, a4, a5);
  v6 = v81;
  v7 = v82;
  v9 = v83;
  v8 = v84;
  v10 = v84 - v81;
  v12 = v85;
  v11 = v86;
  v13 = v85 - v82;
  v14 = v86 - v83;
  v15 = v87;
  v16 = v88;
  v17 = v87 - v81;
  v18 = v88 - v82;
  v19 = v89;
  v20 = v89 - v83;
  v21 = (v85 - v82) * (v89 - v83) - (v86 - v83) * (v88 - v82);
  v22 = (v86 - v83) * (v87 - v81) - (v84 - v81) * (v89 - v83);
  v23 = (v84 - v81) * (v88 - v82) - (v85 - v82) * (v87 - v81);
  v24 = sqrt(v22 * v22 + v21 * v21 + v23 * v23);
  v25 = 0.0;
  v26 = 0.0;
  v27 = 0.0;
  v28 = 0.0;
  if (v24 > 0.0)
  {
    v26 = v21 / v24;
    v27 = v22 / v24;
    v28 = v23 / v24;
  }
  *a1 = v26;
  a1[1] = v27;
  a1[2] = v28;
  a1[3] = v7 * v27 + v26 * v6 + v28 * v9;
  v29 = v99;
  v30 = v100;
  v32 = v93;
  v31 = v94;
  v33 = v101;
  v34 = v95;
  v35 = v96;
  v36 = v97;
  v37 = v98;
  v38 = (v100 - v94) * (v98 - v95) - (v101 - v95) * (v97 - v94);
  v39 = (v101 - v95) * (v96 - v93) - (v99 - v93) * (v98 - v95);
  v40 = (v99 - v93) * (v97 - v94) - (v100 - v94) * (v96 - v93);
  v41 = sqrt(v39 * v39 + v38 * v38 + v40 * v40);
  v42 = 0.0;
  v43 = 0.0;
  if (v41 > 0.0)
  {
    v25 = v38 / v41;
    v42 = v39 / v41;
    v43 = v40 / v41;
  }
  a1[4] = v25;
  a1[5] = v42;
  a1[6] = v43;
  a1[7] = v31 * v42 + v25 * v32 + v43 * v34;
  v44 = v32 - v6;
  v45 = v31 - v7;
  v46 = v34 - v9;
  v47 = v45 * v14 - (v34 - v9) * v13;
  v48 = (v34 - v9) * v10 - v44 * v14;
  v49 = v44 * v13 - v45 * v10;
  v50 = sqrt(v48 * v48 + v47 * v47 + v49 * v49);
  v51 = 0.0;
  v52 = 0.0;
  v53 = 0.0;
  v54 = 0.0;
  if (v50 > 0.0)
  {
    v52 = v47 / v50;
    v53 = v48 / v50;
    v54 = v49 / v50;
  }
  a1[8] = v52;
  a1[9] = v53;
  a1[10] = v54;
  a1[11] = v7 * v53 + v52 * v6 + v54 * v9;
  v55 = v90;
  v56 = v91;
  v57 = v92;
  v58 = v29 - v15;
  v59 = v30 - v16;
  v60 = v33 - v19;
  v61 = (v91 - v16) * v60 - (v92 - v19) * (v30 - v16);
  v62 = (v92 - v19) * v58 - (v90 - v15) * v60;
  v63 = (v90 - v15) * v59 - (v91 - v16) * v58;
  v64 = sqrt(v62 * v62 + v61 * v61 + v63 * v63);
  v65 = 0.0;
  v66 = 0.0;
  if (v64 > 0.0)
  {
    v51 = v61 / v64;
    v65 = v62 / v64;
    v66 = v63 / v64;
  }
  a1[12] = v51;
  a1[13] = v65;
  a1[14] = v66;
  a1[15] = v16 * v65 + v51 * v15 + v66 * v19;
  v67 = v18 * v46 - v20 * v45;
  v68 = v20 * v44 - v17 * v46;
  v69 = v17 * v45 - v18 * v44;
  v70 = sqrt(v68 * v68 + v67 * v67 + v69 * v69);
  v71 = 0.0;
  v72 = 0.0;
  v73 = 0.0;
  v74 = 0.0;
  if (v70 > 0.0)
  {
    v72 = v67 / v70;
    v73 = v68 / v70;
    v74 = v69 / v70;
  }
  a1[16] = v72;
  a1[17] = v73;
  a1[18] = v74;
  a1[19] = v7 * v73 + v72 * v6 + v74 * v9;
  v75 = (v36 - v12) * (v57 - v11) - (v37 - v11) * (v56 - v12);
  v76 = (v37 - v11) * (v55 - v8) - (v35 - v8) * (v57 - v11);
  v77 = (v35 - v8) * (v56 - v12) - (v36 - v12) * (v55 - v8);
  v78 = sqrt(v76 * v76 + v75 * v75 + v77 * v77);
  v79 = 0.0;
  v80 = 0.0;
  if (v78 > 0.0)
  {
    v71 = v75 / v78;
    v79 = v76 / v78;
    v80 = v77 / v78;
  }
  a1[20] = v71;
  a1[21] = v79;
  a1[22] = v80;
  a1[23] = v12 * v79 + v71 * v8 + v80 * v11;
}

uint64_t g_frustum_isect_lseg(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v65;
  double v66;

  v5 = *a3;
  v6 = a3[1];
  v7 = *a2;
  v8 = a2[1];
  v9 = a3[2];
  v10 = a2[2];
  v11 = a1[16];
  v12 = a1[17];
  v14 = a1[18];
  v13 = a1[19];
  v15 = v8 * v12 + v11 * *a2 + v14 * v10 - v13;
  v16 = v6 * v12 + v11 * *a3 + v14 * v9 - v13;
  if (v15 < 0.0 && v16 < 0.0)
    return 0;
  v17 = v5 - v7;
  v18 = v6 - v8;
  v19 = v9 - v10;
  v20 = 0.0;
  if (v15 < 0.0 || (v21 = 1.0, v16 < 0.0))
  {
    v22 = v18 * v12 + v17 * v11 + v19 * v14;
    v23 = -v15 / v22;
    if (v22 >= 0.0)
    {
      v25 = 1.0;
      v21 = 1.0;
      if (v23 <= 0.0)
        goto LABEL_10;
    }
    else
    {
      v21 = 1.0;
      v24 = v23 < 1.0;
      v25 = -v15 / v22;
      v23 = 0.0;
      if (!v24)
        goto LABEL_10;
    }
    v21 = v25;
    v20 = v23;
    if (v25 <= v23)
      return 0;
  }
LABEL_10:
  v26 = a1[20];
  v27 = a1[21];
  v28 = a1[22];
  v29 = a1[23];
  v30 = v8 * v27 + v26 * v7 + v28 * v10 - v29;
  v31 = v6 * v27 + v26 * v5 + v28 * v9 - v29;
  if (v30 < 0.0 && v31 < 0.0)
    return 0;
  if (v30 >= 0.0 && v31 >= 0.0)
    goto LABEL_20;
  v32 = v18 * v27 + v17 * v26 + v19 * v28;
  v33 = -v30 / v32;
  if (v32 >= 0.0)
  {
    if (v33 > v20)
      goto LABEL_19;
  }
  else if (v33 < v21)
  {
    v21 = -v30 / v32;
  }
  v33 = v20;
LABEL_19:
  v20 = v33;
  if (v21 <= v33)
    return 0;
LABEL_20:
  v34 = a1[12];
  v35 = a1[13];
  v36 = a1[14];
  v37 = a1[15];
  v38 = v8 * v35 + v34 * v7 + v36 * v10 - v37;
  v39 = v6 * v35 + v34 * v5 + v36 * v9 - v37;
  if (v38 < 0.0 && v39 < 0.0)
    return 0;
  if (v38 >= 0.0 && v39 >= 0.0)
    goto LABEL_30;
  v40 = v18 * v35 + v17 * v34 + v19 * v36;
  v41 = -v38 / v40;
  if (v40 >= 0.0)
  {
    if (v41 > v20)
      goto LABEL_29;
  }
  else if (v41 < v21)
  {
    v21 = -v38 / v40;
  }
  v41 = v20;
LABEL_29:
  v20 = v41;
  if (v21 <= v41)
    return 0;
LABEL_30:
  v42 = a1[8];
  v43 = a1[9];
  v44 = a1[10];
  v45 = a1[11];
  v46 = v8 * v43 + v42 * v7 + v44 * v10 - v45;
  v47 = v6 * v43 + v42 * v5 + v44 * v9 - v45;
  if (v46 < 0.0 && v47 < 0.0)
    return 0;
  if (v46 >= 0.0 && v47 >= 0.0)
    goto LABEL_40;
  v48 = v18 * v43 + v17 * v42 + v19 * v44;
  v49 = -v46 / v48;
  if (v48 >= 0.0)
  {
    if (v49 > v20)
      goto LABEL_39;
  }
  else if (v49 < v21)
  {
    v21 = -v46 / v48;
  }
  v49 = v20;
LABEL_39:
  v20 = v49;
  if (v21 <= v49)
    return 0;
LABEL_40:
  v50 = a1[4];
  v51 = a1[5];
  v52 = a1[6];
  v53 = a1[7];
  v54 = v8 * v51 + v50 * v7 + v52 * v10 - v53;
  v55 = v6 * v51 + v50 * v5 + v52 * v9 - v53;
  if (v54 < 0.0 && v55 < 0.0)
    return 0;
  if (v54 >= 0.0 && v55 >= 0.0)
    goto LABEL_50;
  v56 = v18 * v51 + v17 * v50 + v19 * v52;
  v57 = -v54 / v56;
  if (v56 >= 0.0)
  {
    if (v57 > v20)
      goto LABEL_49;
  }
  else if (v57 < v21)
  {
    v21 = -v54 / v56;
  }
  v57 = v20;
LABEL_49:
  v20 = v57;
  if (v21 <= v57)
    return 0;
LABEL_50:
  v58 = a1[1];
  v59 = v8 * v58 + *a1 * v7;
  v60 = a1[2];
  v61 = a1[3];
  v62 = v59 + v60 * v10 - v61;
  v63 = v6 * v58 + *a1 * v5 + v60 * v9 - v61;
  if (v62 < 0.0 && v63 < 0.0)
    return 0;
  if (v62 < 0.0 || v63 < 0.0)
  {
    v65 = v18 * v58 + v17 * *a1 + v19 * v60;
    v66 = -v62 / v65;
    if (v65 >= 0.0)
    {
      if (v66 > v20)
        goto LABEL_60;
    }
    else if (v66 < v21)
    {
      v21 = -v62 / v65;
    }
    v66 = v20;
LABEL_60:
    v20 = v66;
    if (v21 > v66)
      goto LABEL_61;
    return 0;
  }
LABEL_61:
  if (a4)
    *a4 = v20;
  if (a5)
    *a5 = v21;
  return 1;
}

unint64_t pmem_alloc_ex(uint64_t a1, unint64_t a2, void *(*a3)(size_t a1, uint64_t a2))
{
  char *v6;
  char *v7;
  void *(*v8)(size_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t result;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  FILE **v19;
  char *v20;
  FILE **v21;
  FILE *v22;
  char *v23;

  v6 = (char *)malloc_type_malloc(0x40uLL, 0x10800409FEEBF35uLL);
  if (!a2)
    a2 = 16;
  if (!v6)
  {
    printf("header malloc failed, size: %lu\n", 64);
    v19 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "header malloc failed, size: %lu\n", 64);
    fflush((FILE *)*MEMORY[0x24BDAC8E8]);
    fflush(*v19);
    abort();
  }
  v7 = v6;
  *(_OWORD *)(v6 + 24) = 0u;
  v8 = pmem_default_alloc;
  *((_QWORD *)v6 + 7) = 0;
  if (a3)
    v8 = a3;
  *(_OWORD *)(v6 + 40) = 0uLL;
  *(_OWORD *)(v6 + 8) = 0uLL;
  *(_QWORD *)v6 = a1;
  v9 = a1 + a2 + 8;
  *((_DWORD *)v6 + 6) = 1;
  v10 = (uint64_t)v8(v9, (uint64_t)v6);
  v11 = *((_QWORD *)v7 + 1);
  if (v11 < v9)
    __assert_rtn("pmem_alloc_ex", "pmem.c", 249, "header->size_allocated >= min_size && \"Allocator should allocate at least enough space!\"");
  if (!v10)
  {
    v20 = pmem_type_to_str(*((_DWORD *)v7 + 8));
    printf("Allocation (%s) failed, size: %llu\n", v20, *((_QWORD *)v7 + 1));
    v21 = (FILE **)MEMORY[0x24BDAC8D8];
    v22 = (FILE *)*MEMORY[0x24BDAC8D8];
    v23 = pmem_type_to_str(*((_DWORD *)v7 + 8));
    fprintf(v22, "Allocation (%s) failed, size: %llu\n", v23, *((_QWORD *)v7 + 1));
    fflush((FILE *)*MEMORY[0x24BDAC8E8]);
    fflush(*v21);
    abort();
  }
  result = (v10 + a2 + 7) / a2 * a2;
  *(_QWORD *)(result - 8) = v7;
  do
    v13 = __ldaxr(&qword_254A77330);
  while (__stlxr(v13 + 1, &qword_254A77330));
  do
    v14 = __ldaxr((unint64_t *)&unk_254A77338);
  while (__stlxr(v14 + 1, (unint64_t *)&unk_254A77338));
  do
    v15 = __ldaxr(&global_stats);
  while (__stlxr(v15 + v11, &global_stats));
  do
    v16 = __ldaxr(&pmem_total_refs);
  while (__stlxr(v16 + 1, &pmem_total_refs));
  do
    v17 = __ldaxr(&_pmem_total_blocks);
  while (__stlxr(v17 + 1, &_pmem_total_blocks));
  do
    v18 = __ldaxr(&pmem_bytes_allocated);
  while (__stlxr(v18 + v11, &pmem_bytes_allocated));
  return result;
}

void *pmem_default_alloc(size_t a1, uint64_t a2)
{
  void *result;
  int *v5;
  int *v6;
  FILE *v7;
  int *v8;
  char __strerrbuf[100];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 0x100000)
  {
    *(_QWORD *)(a2 + 8) = a1;
    *(_DWORD *)(a2 + 32) = 1;
    result = malloc_type_malloc(a1, 0x9D8D5591uLL);
    *(_QWORD *)(a2 + 56) = result;
    *(_QWORD *)(a2 + 40) = pmem_malloc_free;
  }
  else
  {
    result = mmap(0, a1, 3, 4098, -1, 0);
    if ((unint64_t)result + 1 > 1)
    {
      *(_QWORD *)(a2 + 8) = a1;
      *(_DWORD *)(a2 + 32) = 2;
      *(_QWORD *)(a2 + 40) = pmem_mmap_free;
      *(_QWORD *)(a2 + 48) = pmem_mmap_write_protect;
      *(_QWORD *)(a2 + 56) = result;
    }
    else
    {
      v5 = __error();
      strerror_r(*v5, __strerrbuf, 0x64uLL);
      v6 = __error();
      printf("Failed to mmap block of size: %zu, error %d: %s\n", a1, *v6, __strerrbuf);
      v7 = (FILE *)*MEMORY[0x24BDAC8D8];
      v8 = __error();
      fprintf(v7, "Failed to mmap block of size: %zu, error %d: %s\n", a1, *v8, __strerrbuf);
      return 0;
    }
  }
  return result;
}

char *pmem_type_to_str(unsigned int a1)
{
  if (a1 >= 6)
    __assert_rtn("pmem_type_to_str", "pmem.c", 500, "0 && \"Unsupported type\"");
  return (&off_24CA9BD40)[a1];
}

uint64_t pmem_mmap_free(uint64_t a1)
{
  munmap(*(void **)(a1 + 56), *(_QWORD *)(a1 + 8));
  return 0;
}

BOOL pmem_mmap_write_protect(uint64_t a1)
{
  return mprotect(*(void **)(a1 + 56), *(_QWORD *)(a1 + 8), 1) != 0;
}

uint64_t pmem_malloc_free(uint64_t a1)
{
  free(*(void **)(a1 + 56));
  return 0;
}

void lbl_feature_extract_kpts_score_map(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, int a10, int a11, int a12, uint64_t a13)
{
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  int v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  int32x2_t v25;
  float v26;
  float v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  int16x8_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int16 *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  float v64;
  uint64_t v65;
  uint64_t v66;
  float *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  float v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  _QWORD *v78;
  void *v79;
  void *v80;
  void *v81;
  float v82;
  float v83;
  float v84;
  int v85;
  float v86;
  int v87;
  int v88;
  int v89;
  int v90;
  size_t v91;
  uint64_t v92;
  int *v93;
  int *v94;
  float v95;
  uint64_t v96;
  float *v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  _DWORD *v109;
  int *v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  float *v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  int v120;
  float v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  _DWORD *v126;
  int *v127;
  int v128;
  int32x4_t *v129;
  size_t v130;
  uint64_t v131;
  uint64_t *v132;
  float *v133;
  uint64_t v134;
  uint64_t v135;
  float *v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  float v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i;
  float v146;
  uint64_t v147;
  float v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  float v154;
  float v155;
  float v156;
  uint64_t v157;
  uint64_t v158;
  float v159;
  uint64_t v160;
  BOOL v161;
  float v162;
  float v163;
  float v164;
  __darwin_time_t tv_sec;
  float v166;
  float v167;
  float v168;
  uint64_t v169;
  float v170;
  float v171;
  float v172;
  uint64_t v173;
  float v174;
  float v175;
  float v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  BOOL v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  float v188;
  float v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  _QWORD *v194;
  uint64_t v195;
  int64_t v196;
  uint64_t v197;
  uint64_t v198;
  size_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  size_t v208;
  uint64_t v209;
  double v210;
  float v211;
  uint64_t v212;
  unint64_t v213;
  float32x4_t v214;
  uint32x4_t v215;
  float *v216;
  float v217;
  int v218;
  int v219;
  int v220;
  int v221;
  float v222;
  double v223;
  float v224;
  int v225;
  int v226;
  int v227;
  int v228;
  uint64_t v229;
  float v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  int v240;
  int v241;
  int v242;
  int v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  timeval *v256;
  uint64_t v257;
  uint64_t v258;
  int8x8_t v259;
  int8x8_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  timeval *v268;
  uint64_t v269;
  unint64_t v270;
  float32x4_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  float32x4_t *v275;
  unint64_t v276;
  float32x4_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  float32x4_t v285;
  uint64_t v286;
  timeval *v287;
  uint64_t v288;
  unint64_t v289;
  int8x16_t v290;
  float32x4_t v291;
  int32x4_t v292;
  float32x4_t v293;
  int8x16_t v294;
  int8x8_t v295;
  float32x4_t v296;
  float32x4_t v297;
  float32x4_t v298;
  float32x4_t v299;
  float32x4_t v300;
  float32x4_t v301;
  float32x4_t v302;
  int8x16_t v303;
  int8x8_t v304;
  float32x4_t v305;
  float32x4_t v306;
  int8x16_t v307;
  float32x4_t *v308;
  unint64_t v309;
  float32x4_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  float32x4_t v315;
  float32x4_t v316;
  float32x4_t v317;
  float32x4_t v318;
  int8x8_t v319;
  int8x8_t v320;
  uint64_t v321;
  uint64_t v322;
  int8x16_t *v323;
  float v324;
  timeval *v325;
  uint64_t v326;
  float v327;
  float v328;
  unint64_t v329;
  unint64_t v330;
  int16x8_t *v331;
  unint64_t v332;
  float32x4_t *v333;
  unint64_t v334;
  uint64_t v335;
  float *v336;
  float *v337;
  float v338;
  unint64_t v339;
  float32x4_t *v340;
  unint64_t v341;
  unsigned __int128 v342;
  uint32x4_t v343;
  unsigned __int128 v344;
  float32x4_t *v345;
  _QWORD *v346;
  unint64_t v347;
  float32x4_t v348;
  float32x4_t v349;
  unsigned __int128 v350;
  unint64_t v351;
  _BYTE *v352;
  float *v353;
  float v354;
  int v355;
  int *v356;
  unint64_t v357;
  int32x4_t v358;
  int32x4_t *v359;
  int32x4_t v360;
  int32x4_t v361;
  uint64_t v362;
  char *v363;
  uint64_t v364;
  char v365;
  uint64_t v366;
  char *v367;
  int *v368;
  int *v369;
  uint64_t v370;
  uint64_t *v371;
  uint64_t v372;
  int v373;
  uint64_t j;
  int v375;
  uint64_t v376;
  uint64_t v377;
  int v378;
  int v379;
  uint64_t v380;
  uint64_t v381;
  int v382;
  __darwin_time_t v383;
  int v384;
  int v385;
  __darwin_time_t v386;
  int v387;
  __darwin_time_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  unint64_t v392;
  uint64_t v393;
  int v394;
  int v395;
  uint64_t v396;
  int v397;
  uint64_t v398;
  uint64_t v399;
  unint64_t v400;
  uint64_t v401;
  uint64_t v402;
  __darwin_time_t v403;
  __darwin_time_t v404;
  int v405;
  __darwin_time_t v406;
  int v407;
  int v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  int v412;
  uint64_t k;
  int v414;
  uint64_t v415;
  uint64_t v416;
  int v417;
  int v418;
  uint64_t v419;
  int v420;
  uint64_t v421;
  uint64_t v422;
  int v423;
  uint64_t v424;
  int v425;
  uint64_t v426;
  char *v427;
  unint64_t v428;
  int *v429;
  uint64_t v430;
  int v431;
  uint64_t v432;
  char *v433;
  uint64_t v434;
  BOOL v435;
  uint64_t v436;
  int *v437;
  int *v438;
  char *v439;
  uint64_t v440;
  uint64_t *v441;
  uint64_t v442;
  int v443;
  uint64_t m;
  int v445;
  uint64_t v446;
  uint64_t v447;
  int v448;
  int v449;
  uint64_t v450;
  uint64_t v451;
  int v452;
  __darwin_time_t v453;
  int v454;
  int v455;
  __darwin_time_t v456;
  int v457;
  __darwin_time_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  unint64_t v462;
  uint64_t v463;
  int v464;
  int v465;
  uint64_t v466;
  int v467;
  uint64_t v468;
  uint64_t v469;
  unint64_t v470;
  uint64_t v471;
  uint64_t v472;
  __darwin_time_t v473;
  __darwin_time_t v474;
  int v475;
  __darwin_time_t v476;
  int v477;
  int v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  int v482;
  uint64_t n;
  int v484;
  uint64_t v485;
  uint64_t v486;
  int v487;
  int v488;
  uint64_t v489;
  int v490;
  uint64_t v491;
  uint64_t v492;
  int v493;
  uint64_t v494;
  int v495;
  uint64_t v496;
  char *v497;
  int *v498;
  char *v499;
  uint64_t v500;
  uint64_t v501;
  _QWORD *v502;
  int v503;
  int v504;
  int v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  _QWORD *v514;
  uint64_t v515;
  uint64_t v516;
  char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  char *v528;
  float *v529;
  uint64_t v530;
  float *v531;
  char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  float v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t ii;
  float v541;
  uint64_t v542;
  float v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  float v549;
  float v550;
  float v551;
  uint64_t v552;
  uint64_t v553;
  float v554;
  uint64_t v555;
  float v556;
  float v557;
  float v558;
  __darwin_time_t v559;
  float v560;
  float v561;
  float v562;
  uint64_t v563;
  float v564;
  float v565;
  float v566;
  uint64_t v567;
  float v568;
  float v569;
  float v570;
  unint64_t v571;
  char *v572;
  _DWORD *v573;
  uint64_t v574;
  uint64_t *v575;
  uint64_t *v576;
  _QWORD *v577;
  uint64_t v578;
  char *v579;
  int32x2_t v580;
  int v581;
  int *v582;
  uint64_t v583;
  int v584;
  int *v585;
  int v586;
  uint64_t v587;
  unsigned int v588;
  timeval v589;
  __darwin_time_t v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;

  v13 = MEMORY[0x24BDAC7A8]();
  v581 = v16;
  v575 = v17;
  v576 = v18;
  v19 = v15;
  v20 = v14;
  v22 = v21;
  v24 = v23;
  v580 = v25;
  v27 = v26;
  v29 = v28;
  v30 = v13;
  v597 = *MEMORY[0x24BDAC8D0];
  if (v14)
    v31 = v14;
  else
    v31 = v15;
  v32 = *((_DWORD *)v31 + 3);
  v586 = *((_DWORD *)v31 + 2);
  v589.tv_sec = 0;
  *(_QWORD *)&v589.tv_usec = 0;
  if (gettimeofday(&v589, 0)
    || (double)(v589.tv_usec + 1000000 * v589.tv_sec) / 1000000.0 <= 1514764800.0
    || (v589.tv_sec = 0, *(_QWORD *)&v589.tv_usec = 0, gettimeofday(&v589, 0))
    || (HIWORD(v46) = 0, (double)(v589.tv_usec + 1000000 * v589.tv_sec) / 1000000.0 <= 1514764800.0))
  {
    __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
  }
  *(_QWORD *)v30 = 0;
  if (v29)
    *v29 = 0;
  v577 = v29;
  *(_QWORD *)v22 = 0;
  v47 = *(_QWORD *)(v30 + 16);
  if (v47 <= 999)
  {
    v48 = 2 * v47;
    if (2 * v47 <= 1000)
      v48 = 1000;
    if (v47)
      v49 = v48;
    else
      v49 = 1000;
    *(_QWORD *)(v30 + 8) = malloc_type_realloc(*(void **)(v30 + 8), 8 * v49, 0x33ED2BBBuLL);
    *(_QWORD *)(v30 + 16) = v49;
  }
  v50 = *(_QWORD *)(v22 + 16);
  if (v50 <= 999)
  {
    v51 = 2 * v50;
    if (2 * v50 <= 1000)
      v51 = 1000;
    if (v50)
      v52 = v51;
    else
      v52 = 1000;
    *(_QWORD *)(v22 + 8) = malloc_type_realloc(*(void **)(v22 + 8), 4 * v52, 0x4C142334uLL);
    *(_QWORD *)(v22 + 16) = v52;
  }
  v587 = v30;
  if (v20)
    v27 = v27 * 65535.0;
  v578 = (v32 - 1);
  v584 = v32;
  if (v20)
  {
    if (v32 >= 3 && v586 >= 3)
    {
      v53 = (v586 - 1);
      v54 = 1;
      do
      {
        v55 = (unsigned __int16 *)(*v20 + 2 * v20[2] * v54 + 2);
        v56 = v54 - 1;
        v57 = v54 + 1;
        v58 = 1;
        do
        {
          while (1)
          {
            v63 = *v55++;
            v64 = (float)v63;
            if (v27 > (float)v63)
              break;
            v59 = v20[2];
            LOWORD(v46) = *(_WORD *)(*v20 + 2 * (v59 * v54 + v58 - 1));
            v60 = v58 + 1;
            LOWORD(v33) = *(_WORD *)(*v20 + 2 * (v59 * v54 + v58 + 1));
            v61 = v59 * v56;
            LOWORD(v34) = *(_WORD *)(*v20 + 2 * (v59 * v56 + v58));
            v62 = v59 * v57;
            LOWORD(v35) = *(_WORD *)(*v20 + 2 * (v62 + v58));
            LOWORD(v36) = *(_WORD *)(*v20 + 2 * (v61 + v58 - 1));
            LOWORD(v37) = *(_WORD *)(*v20 + 2 * (v61 + v58 + 1));
            LOWORD(v38) = *(_WORD *)(*v20 + 2 * (v62 + v58 - 1));
            LOWORD(v39) = *(_WORD *)(*v20 + 2 * (v62 + v58 + 1));
            pick_xy((void *)a9, v58, v54, v586, v584, a13, v587, v22, v64, (float)v46, (float)v33, (float)v34, (float)v35, (float)v36, (float)v37, (float)v38, (float)v39, v27, v581);
            v58 = v60;
            if (v60 == v53)
              goto LABEL_30;
          }
          ++v58;
        }
        while (v58 != v53);
LABEL_30:
        ++v54;
      }
      while (v57 != v578);
    }
  }
  else if (v32 >= 3 && v586 >= 3)
  {
    v65 = (v586 - 1);
    v66 = 1;
    do
    {
      v67 = (float *)(*v19 + 4 * v19[2] * v66 + 4);
      v69 = v66 + 1;
      v70 = 1;
      do
      {
        while (1)
        {
          v73 = *v67++;
          v74 = v73;
          if (v73 < v27)
            break;
          v71 = v19[2];
          v72 = v70 + 1;
          v68 = v66 - 1;
          pick_xy((void *)a9, v70, v66, v586, v584, a13, v587, v22, v74, *(float *)(*v19 + 4 * (v71 * v66 + v70 - 1)), *(float *)(*v19 + 4 * (v71 * v66 + v70 + 1)), *(float *)(*v19 + 4 * (v71 * v68 + v70)), *(float *)(*v19 + 4 * (v71 * v69 + v70)), *(float *)(*v19 + 4 * (v71 * v68 + v70 - 1)), *(float *)(*v19 + 4 * (v71 * v68 + v70 + 1)), *(float *)(*v19 + 4 * (v71 * v69 + v70 - 1)), *(float *)(*v19 + 4 * (v71 * v69 + v70 + 1)), v27, v581);
          v70 = v72;
          if (v72 == v65)
            goto LABEL_39;
        }
        ++v70;
      }
      while (v70 != v65);
LABEL_39:
      ++v66;
    }
    while (v69 != v578);
  }
  v75 = v587;
  v76 = *(_QWORD *)v587;
  v77 = v575;
  v78 = v577;
  if (*(_QWORD *)v587 <= a10)
  {
LABEL_197:
    if (!v577)
      return;
    goto LABEL_198;
  }
  if (a11 < 1)
  {
    v588 = 1337;
    v131 = v22;
    if (!v76)
    {
LABEL_172:
      v177 = *(_QWORD *)v131;
      v178 = *(_QWORD *)(v131 + 16);
      if (v178 < a10)
      {
        v179 = 2 * v178;
        v180 = v178 == 0;
        v181 = 64;
        if (!v180)
          v181 = v179;
        if (v181 <= a10)
          v182 = a10;
        else
          v182 = v181;
        if (v182)
          *(_QWORD *)(v131 + 8) = malloc_type_realloc(*(void **)(v131 + 8), 4 * v182, 0x725F3E93uLL);
        *(_QWORD *)(v131 + 16) = v182;
      }
      if (a10 > v177)
        bzero((void *)(*(_QWORD *)(v131 + 8) + 4 * *(_QWORD *)v131), 4 * (a10 - v177));
      *(_QWORD *)v131 = a10;
      v183 = *(_QWORD *)v587;
      v184 = *(_QWORD *)(v587 + 16);
      v77 = v575;
      v78 = v577;
      if (v184 < a10)
      {
        v185 = 2 * v184;
        v180 = v184 == 0;
        v186 = 32;
        if (!v180)
          v186 = v185;
        if (v186 <= a10)
          v187 = a10;
        else
          v187 = v186;
        if (v187)
          *(_QWORD *)(v587 + 8) = malloc_type_realloc(*(void **)(v587 + 8), 8 * v187, 0xD6854830uLL);
        *(_QWORD *)(v587 + 16) = v187;
      }
      if (a10 > v183)
        bzero((void *)(*(_QWORD *)(v587 + 8) + 8 * *(_QWORD *)v587), 8 * (a10 - v183));
      *(_QWORD *)v587 = a10;
      if (!v577)
        return;
      goto LABEL_198;
    }
    v132 = *(uint64_t **)(v587 + 8);
    v133 = *(float **)(v22 + 8);
    v134 = a10;
LABEL_112:
    if (v76 <= 9999)
    {
      v140 = rand_r(&v588) % v76;
      goto LABEL_114;
    }
    v150 = 0;
    v151 = 0;
    while (1)
    {
      v152 = (v76 - 1 + v150) / 26;
      v153 = (2 * v76 - 2 + v150) / 26;
      v154 = v133[v152];
      v155 = v133[v150 / 26];
      v156 = v133[v153];
      if ((float)(v154 - v155) >= 0.0)
      {
        if ((float)(v156 - v155) < 0.0)
          goto LABEL_128;
        if ((float)(v156 - v154) < 0.0)
        {
LABEL_130:
          *(__darwin_time_t *)((char *)&v589.tv_sec + v151) = v153;
          goto LABEL_122;
        }
      }
      else if ((float)(v156 - v154) >= 0.0)
      {
        if ((float)(v156 - v155) < 0.0)
          goto LABEL_130;
LABEL_128:
        *(__darwin_time_t *)((char *)&v589.tv_sec + v151) = v150 / 26;
        goto LABEL_122;
      }
      *(__darwin_time_t *)((char *)&v589.tv_sec + v151) = v152;
LABEL_122:
      v151 += 8;
      v150 += 3 * v76 - 3;
      if (v151 == 72)
      {
        v162 = v133[*(_QWORD *)&v589.tv_usec];
        v163 = v133[v589.tv_sec];
        v164 = v133[v590];
        if ((float)(v162 - v163) >= 0.0)
        {
          tv_sec = v589.tv_sec;
          if ((float)(v164 - v163) >= 0.0)
          {
            if ((float)(v164 - v162) >= 0.0)
              tv_sec = *(_QWORD *)&v589.tv_usec;
            else
              tv_sec = v590;
          }
        }
        else
        {
          tv_sec = *(_QWORD *)&v589.tv_usec;
          if ((float)(v164 - v162) >= 0.0)
          {
            tv_sec = v589.tv_sec;
            if ((float)(v164 - v163) < 0.0)
              tv_sec = v590;
          }
        }
        v166 = v133[v592];
        v167 = v133[v591];
        v168 = v133[v593];
        if ((float)(v166 - v167) >= 0.0)
        {
          v169 = v591;
          if ((float)(v168 - v167) >= 0.0)
          {
            if ((float)(v168 - v166) >= 0.0)
              v169 = v592;
            else
              v169 = v593;
          }
        }
        else
        {
          v169 = v592;
          if ((float)(v168 - v166) >= 0.0)
          {
            if ((float)(v168 - v167) >= 0.0)
              v169 = v591;
            else
              v169 = v593;
          }
        }
        v170 = v133[v595];
        v171 = v133[v594];
        v172 = v133[v596];
        if ((float)(v170 - v171) >= 0.0)
        {
          v173 = v594;
          if ((float)(v172 - v171) >= 0.0)
          {
            if ((float)(v172 - v170) >= 0.0)
              v173 = v595;
            else
              v173 = v596;
          }
        }
        else
        {
          v173 = v595;
          if ((float)(v172 - v170) >= 0.0)
          {
            if ((float)(v172 - v171) >= 0.0)
              v173 = v594;
            else
              v173 = v596;
          }
        }
        v174 = v133[v169];
        v175 = v133[tv_sec];
        v176 = v133[v173];
        if ((float)(v174 - v175) >= 0.0)
        {
          v140 = tv_sec;
          if ((float)(v176 - v175) >= 0.0)
          {
            if ((float)(v176 - v174) >= 0.0)
              v140 = v169;
            else
              v140 = v173;
          }
        }
        else
        {
          v140 = v169;
          if ((float)(v176 - v174) >= 0.0)
          {
            v140 = tv_sec;
            if ((float)(v176 - v175) < 0.0)
              v140 = v173;
          }
        }
LABEL_114:
        v141 = *v133;
        *v133 = v133[v140];
        v133[v140] = v141;
        v142 = *v132;
        *v132 = v132[v140];
        v132[v140] = v142;
        if (v76 < 2)
        {
          v144 = 0;
          v143 = 0;
        }
        else
        {
          v143 = 0;
          v144 = 0;
          for (i = 1; i != v76; ++i)
          {
            v146 = v133[i];
            if ((float)(*v133 - v146) <= 0.0)
            {
              v133[i] = v133[++v144];
              v133[v144] = v146;
              v147 = v132[i];
              v132[i] = v132[v144];
              v132[v144] = v147;
              if ((float)(*v133 - v133[i]) == 0.0)
              {
                v148 = v133[v144];
                v133[v144] = v133[++v143];
                v133[v143] = v148;
                v149 = v132[v144];
                v132[v144] = v132[v143];
                v132[v143] = v149;
              }
            }
          }
        }
        v157 = v144 - v143;
        v158 = v144 - v143;
        do
        {
          v159 = v133[v158];
          v133[v158] = v133[v143];
          v133[v143] = v159;
          v160 = v132[v158];
          v132[v158] = v132[v143];
          v132[v143] = v160;
          ++v158;
          v161 = v143-- <= 0;
        }
        while (!v161);
        if (v134 <= v144 && v134 >= v157)
          goto LABEL_172;
        v135 = v144 + 1;
        v136 = &v133[v135];
        v137 = &v132[v135];
        v138 = v134 - v135;
        v139 = v76 - v135;
        if (v134 < v157)
        {
          v76 = v157;
        }
        else
        {
          v133 = v136;
          v132 = v137;
          v76 = v139;
        }
        if (v134 >= v157)
          v134 = v138;
        if (!v76)
          goto LABEL_172;
        goto LABEL_112;
      }
    }
  }
  v79 = malloc_type_malloc(8 * (int)v76, 0x100004000313F17uLL);
  v80 = malloc_type_malloc(4 * (int)v76, 0x100004052888210uLL);
  v81 = v80;
  v574 = v22;
  if ((int)v76 <= a10)
  {
    free(v79);
    free(v81);
    goto LABEL_197;
  }
  v573 = v80;
  v572 = (char *)v79;
  v82 = (float)v586 / (float)(((int)v578 + a11) / a11);
  v83 = -0.5;
  if (v82 <= 0.0)
    v84 = -0.5;
  else
    v84 = 0.5;
  v85 = (int)(float)(v82 + v84);
  if (v85 <= 1)
    v85 = 1;
  v86 = (float)v584 / (float)((v586 + a11 - 1) / a11);
  if (v86 > 0.0)
    v83 = 0.5;
  v87 = (int)(float)(v86 + v83);
  if (v87 <= 1)
    v87 = 1;
  if (v586 > v584)
  {
    v88 = (v87 + (int)v578) / v87;
  }
  else
  {
    v87 = a11;
    v88 = ((int)v578 + a11) / a11;
  }
  if (v586 > v584)
    v89 = (v586 + a11 - 1) / a11;
  else
    v89 = (v586 + v85 - 1) / v85;
  if (v586 > v584)
    v90 = a11;
  else
    v90 = v85;
  v91 = v90 * v87;
  v92 = (v90 * v87 + 1);
  v93 = (int *)malloc_type_calloc(v91, 4uLL, 0x100004052888210uLL);
  v94 = (int *)malloc_type_calloc((int)v92, 4uLL, 0x100004052888210uLL);
  v95 = (float)v89;
  if ((int)v76 >= 1)
  {
    v96 = v76;
    v97 = (float *)(*(_QWORD *)(v587 + 8) + 4);
    do
    {
      v98 = *(v97 - 1);
      if (v98 <= (float)(v586 - 1))
        v99 = *(v97 - 1);
      else
        v99 = (float)(v586 - 1);
      if (v98 >= 0.0)
        v100 = v99;
      else
        v100 = 0.0;
      v101 = *v97;
      v97 += 2;
      v102 = v101;
      if (v101 <= (float)(int)v578)
        v103 = v102;
      else
        v103 = (float)(int)v578;
      v104 = v100 / v95;
      if (v102 >= 0.0)
        v105 = v103;
      else
        v105 = 0.0;
      v106 = (int)v104 + v90 * (int)(float)(v105 / (float)v88);
      ++v93[v106];
      --v96;
    }
    while (v96);
  }
  *v94 = 0;
  if ((int)v91 >= 1)
  {
    v107 = 0;
    v108 = v92 - 1;
    v109 = v94 + 1;
    v110 = v93;
    do
    {
      v111 = *v110++;
      v107 += v111;
      *v109++ = v107;
      --v108;
    }
    while (v108);
  }
  if ((int)v76 >= 1)
  {
    v112 = 0;
    v113 = 0;
    do
    {
      v114 = (float *)(*(_QWORD *)(v587 + 8) + v113);
      v115 = v114[1];
      if (*v114 <= (float)(v586 - 1))
        v116 = *v114;
      else
        v116 = (float)(v586 - 1);
      if (*v114 >= 0.0)
        v117 = v116;
      else
        v117 = 0.0;
      v118 = v117 / v95;
      if (v115 <= (float)(int)v578)
        v119 = v114[1];
      else
        v119 = (float)(int)v578;
      v120 = (int)v118;
      if (v115 >= 0.0)
        v121 = v119;
      else
        v121 = 0.0;
      v122 = v120 + v90 * (int)(float)(v121 / (float)v88);
      v123 = v94[v122];
      v94[v122] = v123 + 1;
      *(_QWORD *)&v572[8 * v123] = *(_QWORD *)v114;
      v573[v123] = *(_DWORD *)(*(_QWORD *)(v574 + 8) + v112);
      v113 += 8;
      v112 += 4;
    }
    while (8 * v76 != v113);
  }
  *v94 = 0;
  v585 = v94;
  if ((int)v91 > 0)
  {
    v124 = 0;
    v125 = v92 - 1;
    v126 = v94 + 1;
    v127 = v93;
    do
    {
      v128 = *v127++;
      v124 += v128;
      *v126++ = v124;
      --v125;
    }
    while (v125);
    v129 = (int32x4_t *)malloc_type_malloc(4 * v91, 0x100004052888210uLL);
    if (v91 >= 8)
    {
      v130 = v91 & 0x7FFFFFF8;
      v358 = (int32x4_t)xmmword_210BCABD0;
      v359 = v129 + 1;
      v360.i64[0] = 0x400000004;
      v360.i64[1] = 0x400000004;
      v361.i64[0] = 0x800000008;
      v361.i64[1] = 0x800000008;
      v362 = v91 & 0xFFFFFFF8;
      do
      {
        v359[-1] = v358;
        *v359 = vaddq_s32(v358, v360);
        v358 = vaddq_s32(v358, v361);
        v359 += 2;
        v362 -= 8;
      }
      while (v362);
      if (v130 == v91)
        goto LABEL_307;
    }
    else
    {
      v130 = 0;
    }
    do
    {
      v129->i32[v130] = v130;
      ++v130;
    }
    while (v91 != v130);
LABEL_307:
    v357 = v91;
    v356 = (int *)v129;
    goto LABEL_308;
  }
  v356 = (int *)malloc_type_malloc(4 * v91, 0x100004052888210uLL);
  v357 = v91;
LABEL_308:
  v363 = (char *)malloc_type_malloc(0x200uLL, 0x5AA2E4D5uLL);
  v364 = 0;
  v365 = 1;
  v366 = 32;
  v367 = (char *)v93;
  v368 = v356;
  v571 = v357;
  v579 = (char *)v93;
  v369 = v356;
  v582 = v356;
  do
  {
    v370 = v364;
    while (1)
    {
      if ((v365 & 1) == 0)
      {
        --v370;
        v371 = (uint64_t *)&v363[16 * v370];
        v357 = v371[1];
        v372 = *v371;
        v367 = (char *)&v93[v372];
        v368 = &v369[v372];
      }
      if ((uint64_t)v357 > 15)
        break;
      if ((uint64_t)v357 > 1)
      {
        v373 = 2;
        for (j = 1; j != v357; ++j)
        {
          v375 = v373;
          do
          {
            v376 = (v375 - 1);
            v377 = (v375 - 2);
            v378 = *(_DWORD *)&v367[4 * v376];
            v379 = *(_DWORD *)&v367[4 * v377];
            if (v378 >= v379)
              break;
            v380 = v376;
            *(_DWORD *)&v367[v380 * 4] = v379;
            v381 = v377;
            *(_DWORD *)&v367[v381 * 4] = v378;
            v382 = v368[v376];
            v368[v380] = v368[v381];
            v368[v381] = v382;
            v375 = v376;
          }
          while ((int)v376 > 1);
          ++v373;
        }
      }
      v365 = 0;
      v357 = 0;
      if (v370 < 1)
        goto LABEL_380;
    }
    if (v357 > 0x27)
    {
      v389 = 0;
      v390 = 0;
      if (v357 <= 0x7D0)
        v391 = 8;
      else
        v391 = 26;
      if (v357 <= 0x7D0)
        v392 = 3;
      else
        v392 = 9;
      while (1)
      {
        v393 = (uint64_t)(v357 - 1 + v389) / v391;
        v394 = *(_DWORD *)&v367[4 * (v389 / v391)];
        v395 = *(_DWORD *)&v367[4 * v393];
        v396 = (uint64_t)(2 * v357 - 2 + v389) / v391;
        v397 = *(_DWORD *)&v367[4 * v396];
        if (v394 >= v395)
        {
          if (v394 < v397)
            goto LABEL_346;
          if (v395 < v397)
          {
LABEL_348:
            *(&v589.tv_sec + v390) = v396;
            goto LABEL_340;
          }
        }
        else if (v395 >= v397)
        {
          if (v394 < v397)
            goto LABEL_348;
LABEL_346:
          *(&v589.tv_sec + v390) = v389 / v391;
          goto LABEL_340;
        }
        *(&v589.tv_sec + v390) = v393;
LABEL_340:
        ++v390;
        v389 += 3 * v357 - 3;
        if (v392 == v390)
        {
          while (1)
          {
            v398 = 0;
            v399 = 0;
            v400 = v392;
            v392 /= 3uLL;
            if (v392 <= 1)
              v401 = 1;
            else
              v401 = v392;
            v402 = 8 * v401;
            do
            {
              v403 = *(__darwin_time_t *)((char *)&v589.tv_sec + v398);
              v404 = *(_QWORD *)((char *)&v589.tv_usec + v398);
              v405 = *(_DWORD *)&v367[4 * v403];
              v406 = *(_QWORD *)((char *)&v589 + v398 + 16);
              v407 = *(_DWORD *)&v367[4 * v404];
              v408 = *(_DWORD *)&v367[4 * v406];
              if (v405 >= v407)
              {
                if (v405 < v408)
                  goto LABEL_361;
                if (v407 >= v408)
                {
LABEL_354:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v399) = v404;
                  goto LABEL_355;
                }
              }
              else
              {
                if (v407 < v408)
                  goto LABEL_354;
                if (v405 >= v408)
                {
LABEL_361:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v399) = v403;
                  goto LABEL_355;
                }
              }
              *(__darwin_time_t *)((char *)&v589.tv_sec + v399) = v406;
LABEL_355:
              v399 += 8;
              v398 += 24;
            }
            while (v402 != v399);
            if (v400 < 9)
            {
              v383 = v589.tv_sec;
              v384 = *(_DWORD *)v367;
              goto LABEL_365;
            }
          }
        }
      }
    }
    v383 = v357 >> 1;
    v384 = *(_DWORD *)v367;
    v385 = *(_DWORD *)&v367[4 * (v357 >> 1)];
    v386 = v357 - 1;
    v387 = *(_DWORD *)&v367[4 * v357 - 4];
    if (v385 >= v387)
      v388 = v357 >> 1;
    else
      v388 = v357 - 1;
    if (v384 >= v387)
      v386 = 0;
    else
      v388 = 0;
    if (v385 >= v387)
      v383 = v386;
    if (v384 >= v385)
      v383 = v388;
LABEL_365:
    v409 = 0;
    v410 = 0;
    v411 = v383;
    *(_DWORD *)v367 = *(_DWORD *)&v367[v411 * 4];
    *(_DWORD *)&v367[v411 * 4] = v384;
    v412 = *v368;
    *v368 = v368[v411];
    v368[v411] = v412;
    for (k = 1; k != v357; ++k)
    {
      v414 = *(_DWORD *)&v367[4 * k];
      if (v414 <= *(_DWORD *)v367)
      {
        v415 = ++v409;
        v416 = k;
        *(_DWORD *)&v367[v416 * 4] = *(_DWORD *)&v367[4 * v409];
        *(_DWORD *)&v367[v415 * 4] = v414;
        v417 = v368[k];
        v368[v416] = v368[v409];
        v368[v415] = v417;
        if (*(_DWORD *)&v367[4 * k] == *(_DWORD *)v367)
        {
          ++v410;
          v418 = *(_DWORD *)&v367[4 * v409];
          v419 = v410;
          *(_DWORD *)&v367[4 * v409] = *(_DWORD *)&v367[4 * v410];
          *(_DWORD *)&v367[v419 * 4] = v418;
          v420 = v368[v409];
          v368[v409] = v368[v410];
          v368[v419] = v420;
        }
      }
    }
    v421 = 4 * v409 - 4 * v410;
    v422 = v410;
    do
    {
      v423 = *(_DWORD *)&v367[v421];
      v424 = v422;
      *(_DWORD *)&v367[v421] = *(_DWORD *)&v367[4 * v422];
      *(_DWORD *)&v367[v424 * 4] = v423;
      v425 = *(int *)((char *)v368 + v421);
      *(int *)((char *)v368 + v421) = v368[v422];
      v368[v424] = v425;
      v421 += 4;
      v161 = v422-- <= 0;
    }
    while (!v161);
    v364 = v370 + 1;
    if (v370 + 1 >= v366)
    {
      v426 = 2 * v366;
      v363 = (char *)malloc_type_realloc(v363, 32 * v366, 0x4E0BDDC7uLL);
      v369 = v582;
      v366 = v426;
      v75 = v587;
    }
    v427 = &v363[16 * v370];
    *(_QWORD *)v427 = v409 + ((v367 - v579) >> 2) + 1;
    *((_QWORD *)v427 + 1) = v357 + ~v409;
    v357 = v409 - v410;
    v180 = v409 == v410;
    v93 = (int *)v579;
    v365 = !v180;
    v77 = v575;
  }
  while ((v370 & 0x8000000000000000) == 0 || v357);
LABEL_380:
  free(v363);
  v428 = v571;
  if ((int)v571 >= 1)
  {
    v429 = v93;
    v430 = v571;
    v431 = a10;
    do
    {
      v432 = *v429;
      if (v430 * v432 > v431)
      {
        v432 = v431 / v430;
        *v429 = v432;
      }
      v431 -= v432;
      ++v429;
      --v430;
    }
    while (v430);
  }
  v433 = (char *)malloc_type_malloc(0x200uLL, 0x5AA2E4D5uLL);
  v434 = 0;
  v435 = 1;
  v436 = 32;
  v437 = v93;
  v438 = v582;
  v439 = (char *)v582;
  while (2)
  {
    v440 = v434;
    while (1)
    {
      if (!v435)
      {
        --v440;
        v441 = (uint64_t *)&v433[16 * v440];
        v428 = v441[1];
        v442 = *v441;
        v439 = (char *)&v438[v442];
        v437 = &v93[v442];
      }
      if ((uint64_t)v428 > 15)
        break;
      if ((uint64_t)v428 > 1)
      {
        v443 = 2;
        for (m = 1; m != v428; ++m)
        {
          v445 = v443;
          do
          {
            v446 = (v445 - 1);
            v447 = (v445 - 2);
            v448 = *(_DWORD *)&v439[4 * v446];
            v449 = *(_DWORD *)&v439[4 * v447];
            if (v448 >= v449)
              break;
            v450 = v446;
            *(_DWORD *)&v439[v450 * 4] = v449;
            v451 = v447;
            *(_DWORD *)&v439[v451 * 4] = v448;
            v452 = v437[v446];
            v437[v450] = v437[v451];
            v437[v451] = v452;
            v445 = v446;
          }
          while ((int)v446 > 1);
          ++v443;
        }
      }
      v435 = 0;
      v428 = 0;
      if (v440 < 1)
        goto LABEL_454;
    }
    if (v428 > 0x27)
    {
      v459 = 0;
      v460 = 0;
      if (v428 <= 0x7D0)
        v461 = 8;
      else
        v461 = 26;
      if (v428 <= 0x7D0)
        v462 = 3;
      else
        v462 = 9;
      while (1)
      {
        v463 = (uint64_t)(v428 - 1 + v459) / v461;
        v464 = *(_DWORD *)&v439[4 * (v459 / v461)];
        v465 = *(_DWORD *)&v439[4 * v463];
        v466 = (uint64_t)(2 * v428 - 2 + v459) / v461;
        v467 = *(_DWORD *)&v439[4 * v466];
        if (v464 >= v465)
        {
          if (v464 < v467)
            goto LABEL_423;
          if (v465 < v467)
          {
LABEL_425:
            *(&v589.tv_sec + v460) = v466;
            goto LABEL_417;
          }
        }
        else if (v465 >= v467)
        {
          if (v464 < v467)
            goto LABEL_425;
LABEL_423:
          *(&v589.tv_sec + v460) = v459 / v461;
          goto LABEL_417;
        }
        *(&v589.tv_sec + v460) = v463;
LABEL_417:
        ++v460;
        v459 += 3 * v428 - 3;
        if (v462 == v460)
        {
          while (1)
          {
            v468 = 0;
            v469 = 0;
            v470 = v462;
            v462 /= 3uLL;
            if (v462 <= 1)
              v471 = 1;
            else
              v471 = v462;
            v472 = 8 * v471;
            do
            {
              v473 = *(__darwin_time_t *)((char *)&v589.tv_sec + v468);
              v474 = *(_QWORD *)((char *)&v589.tv_usec + v468);
              v475 = *(_DWORD *)&v439[4 * v473];
              v476 = *(_QWORD *)((char *)&v589 + v468 + 16);
              v477 = *(_DWORD *)&v439[4 * v474];
              v478 = *(_DWORD *)&v439[4 * v476];
              if (v475 >= v477)
              {
                if (v475 < v478)
                  goto LABEL_438;
                if (v477 >= v478)
                {
LABEL_431:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v469) = v474;
                  goto LABEL_432;
                }
              }
              else
              {
                if (v477 < v478)
                  goto LABEL_431;
                if (v475 >= v478)
                {
LABEL_438:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v469) = v473;
                  goto LABEL_432;
                }
              }
              *(__darwin_time_t *)((char *)&v589.tv_sec + v469) = v476;
LABEL_432:
              v469 += 8;
              v468 += 24;
            }
            while (v472 != v469);
            if (v470 < 9)
            {
              v453 = v589.tv_sec;
              v454 = *(_DWORD *)v439;
              goto LABEL_442;
            }
          }
        }
      }
    }
    v453 = v428 >> 1;
    v454 = *(_DWORD *)v439;
    v455 = *(_DWORD *)&v439[4 * (v428 >> 1)];
    v456 = v428 - 1;
    v457 = *(_DWORD *)&v439[4 * v428 - 4];
    if (v455 >= v457)
      v458 = v428 >> 1;
    else
      v458 = v428 - 1;
    if (v454 >= v457)
      v456 = 0;
    else
      v458 = 0;
    if (v455 >= v457)
      v453 = v456;
    if (v454 >= v455)
      v453 = v458;
LABEL_442:
    v479 = 0;
    v480 = 0;
    v481 = v453;
    *(_DWORD *)v439 = *(_DWORD *)&v439[v481 * 4];
    *(_DWORD *)&v439[v481 * 4] = v454;
    v482 = *v437;
    *v437 = v437[v481];
    v437[v481] = v482;
    for (n = 1; n != v428; ++n)
    {
      v484 = *(_DWORD *)&v439[4 * n];
      if (v484 <= *(_DWORD *)v439)
      {
        v485 = ++v480;
        v486 = n;
        *(_DWORD *)&v439[v486 * 4] = *(_DWORD *)&v439[4 * v480];
        *(_DWORD *)&v439[v485 * 4] = v484;
        v487 = v437[n];
        v437[v486] = v437[v480];
        v437[v485] = v487;
        if (*(_DWORD *)&v439[4 * n] == *(_DWORD *)v439)
        {
          ++v479;
          v488 = *(_DWORD *)&v439[4 * v480];
          v489 = v479;
          *(_DWORD *)&v439[4 * v480] = *(_DWORD *)&v439[4 * v479];
          *(_DWORD *)&v439[v489 * 4] = v488;
          v490 = v437[v480];
          v437[v480] = v437[v479];
          v437[v489] = v490;
        }
      }
    }
    v491 = 4 * v480 - 4 * v479;
    v492 = v479;
    do
    {
      v493 = *(_DWORD *)&v439[v491];
      v494 = v492;
      *(_DWORD *)&v439[v491] = *(_DWORD *)&v439[4 * v492];
      *(_DWORD *)&v439[v494 * 4] = v493;
      v495 = *(int *)((char *)v437 + v491);
      *(int *)((char *)v437 + v491) = v437[v492];
      v437[v494] = v495;
      v491 += 4;
      v161 = v492-- <= 0;
    }
    while (!v161);
    v434 = v440 + 1;
    if (v440 + 1 >= v436)
    {
      v496 = 2 * v436;
      v433 = (char *)malloc_type_realloc(v433, 32 * v436, 0x4E0BDDC7uLL);
      v438 = v582;
      v436 = v496;
      v75 = v587;
    }
    v497 = &v433[16 * v440];
    *(_QWORD *)v497 = v480 + ((v439 - (char *)v438) >> 2) + 1;
    *((_QWORD *)v497 + 1) = v428 + ~v480;
    v428 = v480 - v479;
    v435 = v480 != v479;
    v77 = v575;
    v93 = (int *)v579;
    if ((v440 & 0x8000000000000000) == 0 || v428)
      continue;
    break;
  }
LABEL_454:
  v498 = v438;
  free(v433);
  free(v498);
  *(_QWORD *)v75 = 0;
  *(_QWORD *)v574 = 0;
  v499 = v572;
  v78 = v577;
  if ((int)v571 >= 1)
  {
    v500 = 0;
    v501 = v571;
    while (1)
    {
      v583 = v500 + 1;
      v503 = v585[v500 + 1];
      v504 = v585[v500];
      v505 = v93[v500];
      if (v503 - v504 > v505)
        break;
LABEL_462:
      if (v505 >= 1)
      {
        v506 = v585[v500];
        v507 = *(_QWORD *)v75;
        v508 = *(_QWORD *)v75 + v505;
        v509 = *(_QWORD *)(v75 + 16);
        if (v508 > v509)
        {
          v510 = 2 * v509;
          v180 = v509 == 0;
          v511 = 32;
          if (!v180)
            v511 = v510;
          if (v511 <= v508)
            v512 = *(_QWORD *)v75 + v505;
          else
            v512 = v511;
          if (v512)
          {
            *(_QWORD *)(v75 + 8) = malloc_type_realloc(*(void **)(v75 + 8), 8 * v512, 0x815F1FB0uLL);
            v507 = *(_QWORD *)v75;
            v505 = *(_DWORD *)&v579[4 * v500];
          }
          *(_QWORD *)(v75 + 16) = v512;
        }
        memcpy((void *)(*(_QWORD *)(v75 + 8) + 8 * v507), &v499[8 * v506], 8 * v505);
        v93 = (int *)v579;
        v513 = *(int *)&v579[4 * v500];
        *(_QWORD *)v75 += v513;
        if ((int)v513 >= 1)
        {
          v514 = v78;
          v515 = v75;
          v516 = v501;
          v517 = v499;
          v518 = v585[v500];
          v519 = *(_QWORD *)v574;
          v520 = *(_QWORD *)v574 + v513;
          v521 = *(_QWORD *)(v574 + 16);
          if (v520 <= v521)
          {
            v502 = (_QWORD *)v574;
          }
          else
          {
            v522 = 2 * v521;
            v180 = v521 == 0;
            v523 = 64;
            if (!v180)
              v523 = v522;
            if (v523 <= v520)
              v524 = *(_QWORD *)v574 + v513;
            else
              v524 = v523;
            v502 = (_QWORD *)v574;
            if (v524)
            {
              *(_QWORD *)(v574 + 8) = malloc_type_realloc(*(void **)(v574 + 8), 4 * v524, 0x313DB283uLL);
              v519 = *(_QWORD *)v574;
              v513 = *(int *)&v579[4 * v500];
            }
            *(_QWORD *)(v574 + 16) = v524;
          }
          memcpy((void *)(v502[1] + 4 * v519), &v573[v518], 4 * v513);
          v93 = (int *)v579;
          *v502 += *(int *)&v579[4 * v500];
          v499 = v517;
          v501 = v516;
          v75 = v515;
          v78 = v514;
          v77 = v575;
        }
      }
      ++v500;
      if (v583 == v501)
        goto LABEL_549;
    }
    v588 = 1337;
    if (v503 == v504)
    {
LABEL_461:
      v78 = v577;
      v93 = (int *)v579;
      v505 = *(_DWORD *)&v579[4 * v500];
      v77 = v575;
      goto LABEL_462;
    }
    v525 = v505;
    v526 = v503 - v504;
    v527 = v585[v500];
    v528 = &v499[8 * v527];
    v529 = (float *)&v573[v527];
    while (2)
    {
      if (v526 <= 9999)
      {
        v535 = rand_r(&v588) % v526;
        goto LABEL_491;
      }
      v545 = 0;
      v546 = 0;
LABEL_500:
      v547 = (v526 - 1 + v545) / 26;
      v548 = (2 * v526 - 2 + v545) / 26;
      v549 = v529[v547];
      v550 = v529[v545 / 26];
      v551 = v529[v548];
      if ((float)(v549 - v550) >= 0.0)
      {
        if ((float)(v551 - v550) < 0.0)
          goto LABEL_505;
        if ((float)(v551 - v549) < 0.0)
          goto LABEL_507;
      }
      else if ((float)(v551 - v549) >= 0.0)
      {
        if ((float)(v551 - v550) < 0.0)
        {
LABEL_507:
          *(__darwin_time_t *)((char *)&v589.tv_sec + v546) = v548;
LABEL_499:
          v546 += 8;
          v545 += 3 * v526 - 3;
          if (v546 == 72)
          {
            v556 = v529[*(_QWORD *)&v589.tv_usec];
            v557 = v529[v589.tv_sec];
            v558 = v529[v590];
            if ((float)(v556 - v557) >= 0.0)
            {
              v559 = v589.tv_sec;
              if ((float)(v558 - v557) >= 0.0)
              {
                if ((float)(v558 - v556) >= 0.0)
                  v559 = *(_QWORD *)&v589.tv_usec;
                else
                  v559 = v590;
              }
            }
            else
            {
              v559 = *(_QWORD *)&v589.tv_usec;
              if ((float)(v558 - v556) >= 0.0)
              {
                v559 = v589.tv_sec;
                if ((float)(v558 - v557) < 0.0)
                  v559 = v590;
              }
            }
            v560 = v529[v592];
            v561 = v529[v591];
            v562 = v529[v593];
            if ((float)(v560 - v561) >= 0.0)
            {
              v563 = v591;
              if ((float)(v562 - v561) >= 0.0)
              {
                if ((float)(v562 - v560) >= 0.0)
                  v563 = v592;
                else
                  v563 = v593;
              }
            }
            else
            {
              v563 = v592;
              if ((float)(v562 - v560) >= 0.0)
              {
                if ((float)(v562 - v561) >= 0.0)
                  v563 = v591;
                else
                  v563 = v593;
              }
            }
            v564 = v529[v595];
            v565 = v529[v594];
            v566 = v529[v596];
            if ((float)(v564 - v565) >= 0.0)
            {
              v567 = v594;
              if ((float)(v566 - v565) >= 0.0)
              {
                if ((float)(v566 - v564) >= 0.0)
                  v567 = v595;
                else
                  v567 = v596;
              }
            }
            else
            {
              v567 = v595;
              if ((float)(v566 - v564) >= 0.0)
              {
                if ((float)(v566 - v565) >= 0.0)
                  v567 = v594;
                else
                  v567 = v596;
              }
            }
            v568 = v529[v563];
            v569 = v529[v559];
            v570 = v529[v567];
            if ((float)(v568 - v569) >= 0.0)
            {
              v535 = v559;
              if ((float)(v570 - v569) >= 0.0)
              {
                if ((float)(v570 - v568) >= 0.0)
                  v535 = v563;
                else
                  v535 = v567;
              }
            }
            else
            {
              v535 = v563;
              if ((float)(v570 - v568) >= 0.0)
              {
                v535 = v559;
                if ((float)(v570 - v569) < 0.0)
                  v535 = v567;
              }
            }
LABEL_491:
            v536 = *v529;
            *v529 = v529[v535];
            v529[v535] = v536;
            v537 = *(_QWORD *)v528;
            *(_QWORD *)v528 = *(_QWORD *)&v528[8 * v535];
            *(_QWORD *)&v528[8 * v535] = v537;
            if (v526 < 2)
            {
              v539 = 0;
              v538 = 0;
            }
            else
            {
              v538 = 0;
              v539 = 0;
              for (ii = 1; ii != v526; ++ii)
              {
                v541 = v529[ii];
                if ((float)(*v529 - v541) <= 0.0)
                {
                  v529[ii] = v529[++v539];
                  v529[v539] = v541;
                  v542 = *(_QWORD *)&v528[8 * ii];
                  *(_QWORD *)&v528[8 * ii] = *(_QWORD *)&v528[8 * v539];
                  *(_QWORD *)&v528[8 * v539] = v542;
                  if ((float)(*v529 - v529[ii]) == 0.0)
                  {
                    v543 = v529[v539];
                    v529[v539] = v529[++v538];
                    v529[v538] = v543;
                    v544 = *(_QWORD *)&v528[8 * v539];
                    *(_QWORD *)&v528[8 * v539] = *(_QWORD *)&v528[8 * v538];
                    *(_QWORD *)&v528[8 * v538] = v544;
                  }
                }
              }
            }
            v552 = v539 - v538;
            v553 = v539 - v538;
            do
            {
              v554 = v529[v553];
              v529[v553] = v529[v538];
              v529[v538] = v554;
              v555 = *(_QWORD *)&v528[8 * v553];
              *(_QWORD *)&v528[8 * v553] = *(_QWORD *)&v528[8 * v538];
              *(_QWORD *)&v528[8 * v538] = v555;
              ++v553;
              v161 = v538-- <= 0;
            }
            while (!v161);
            if (v525 <= v539 && v525 >= v552)
              goto LABEL_461;
            v530 = v539 + 1;
            v531 = &v529[v530];
            v532 = &v528[8 * v530];
            v533 = v525 - v530;
            v534 = v526 - v530;
            if (v525 < v552)
            {
              v526 = v552;
            }
            else
            {
              v529 = v531;
              v528 = v532;
              v526 = v534;
            }
            if (v525 >= v552)
              v525 = v533;
            if (!v526)
              goto LABEL_461;
            continue;
          }
          goto LABEL_500;
        }
LABEL_505:
        *(__darwin_time_t *)((char *)&v589.tv_sec + v546) = v545 / 26;
        goto LABEL_499;
      }
      break;
    }
    *(__darwin_time_t *)((char *)&v589.tv_sec + v546) = v547;
    goto LABEL_499;
  }
LABEL_549:
  free(v93);
  free(v585);
  free(v499);
  free(v573);
  if (v78)
  {
LABEL_198:
    v188 = fabsf(*(float *)v580.i32);
    v189 = fabsf(v24);
    v190 = v576;
    if (v77)
      v190 = v77;
    v191 = *((int *)v190 + 2);
    v192 = v190[2] / v191;
    v193 = v78[2];
    if (v188 == INFINITY || v189 == INFINITY)
    {
      v203 = *(_QWORD *)v75;
      v204 = *v78;
      v205 = v203 * 4 * (int)v192;
      if (v205 > v193)
      {
        v206 = 2 * v193;
        v180 = v193 == 0;
        v207 = 256;
        if (!v180)
          v207 = v206;
        if (v207 <= v205)
          v208 = v205;
        else
          v208 = v207;
        if (v208)
          v78[1] = malloc_type_realloc((void *)v78[1], v208, 0x9E332015uLL);
        v78[2] = v208;
      }
      if (v205 > v204)
        bzero((void *)(*v78 + v78[1]), v205 - v204);
      v200 = v587;
      v201 = *(_QWORD *)v587;
      v202 = 4;
      *v78 = *(_QWORD *)v587 * 4 * (int)v192;
      if (v201 < 1)
        return;
    }
    else
    {
      v194 = (_QWORD *)v75;
      v195 = *v78;
      v196 = *v194 * (int)v192;
      if (v196 > v193)
      {
        v197 = 2 * v193;
        v180 = v193 == 0;
        v198 = 256;
        if (!v180)
          v198 = v197;
        if (v198 <= v196)
          v199 = v196;
        else
          v199 = v198;
        if (v199)
          v78[1] = malloc_type_realloc((void *)v78[1], v199, 0x166E72E9uLL);
        v78[2] = v199;
      }
      if (v196 > v195)
        bzero((void *)(*v78 + v78[1]), v196 - v195);
      v200 = v587;
      v201 = *(_QWORD *)v587;
      v202 = 1;
      *v78 = *(_QWORD *)v587 * (int)v192;
      if (v201 < 1)
        return;
    }
    v209 = 0;
    v210 = (float)(v586 / (int)v191);
    v211 = 256.0 / (float)(v24 - *(float *)v580.i32);
    v212 = v202 * (v192 << 32);
    v213 = v192 & 0xF;
    v214 = (float32x4_t)vdupq_lane_s32(v580, 0);
    v215.i64[0] = 0xFF000000FFLL;
    v215.i64[1] = 0xFF000000FFLL;
    while (1)
    {
      v216 = (float *)(*(_QWORD *)(v200 + 8) + 8 * v209);
      v223 = (*v216 + 0.5) / v210 + -0.5;
      *(float *)&v223 = v223;
      v217 = (v216[1] + 0.5) / v210 + -0.5;
      v218 = (int)*(float *)&v223;
      v219 = (int)v217;
      v220 = (int)(float)(*(float *)&v223 + 1.0);
      v221 = (int)(float)(v217 + 1.0);
      v222 = *(float *)&v223 - (float)(int)*(float *)&v223;
      v42.f32[0] = v217 - (float)(int)v217;
      *(float *)&v223 = (float)(1.0 - v222) * (float)(1.0 - v42.f32[0]);
      v224 = v222 * (float)(1.0 - v42.f32[0]);
      *(float *)v40.i32 = (float)(1.0 - v222) * v42.f32[0];
      v41.f32[0] = v222 * v42.f32[0];
      if (v77)
        break;
      v241 = *((_DWORD *)v576 + 2);
      v240 = *((_DWORD *)v576 + 3);
      v242 = v241 - 1;
      if (v241 - 1 >= v220)
        v242 = v220;
      if (v240 - 1 >= v221)
        v243 = v221;
      else
        v243 = v240 - 1;
      v244 = *v576;
      v230 = *(float *)v580.i32;
      if (!a12)
      {
        if ((int)v192 < 1)
          goto LABEL_228;
        v261 = v218;
        v262 = v242;
        v263 = v242 + v241 * (uint64_t)v243;
        v264 = 4 * v240 * (uint64_t)v241;
        v265 = v261 + v241 * (uint64_t)v243;
        v266 = v262 + v241 * (uint64_t)v219;
        v267 = v261 + v241 * (uint64_t)v219;
        v268 = &v589;
        v269 = v192;
        do
        {
          v43.i32[0] = *(_DWORD *)(v244 + 4 * v265);
          *(float *)&v268->tv_sec = (float)((float)((float)(v224 * *(float *)(v244 + 4 * v266))
                                                  + (float)(*(float *)(v244 + 4 * v267) * *(float *)&v223))
                                          + (float)(v43.f32[0] * *(float *)v40.i32))
                                  + (float)(*(float *)(v244 + 4 * v263) * v41.f32[0]);
          v268 = (timeval *)((char *)v268 + 4);
          v244 += v264;
          --v269;
        }
        while (v269);
        goto LABEL_272;
      }
      if ((int)v192 < 1)
        goto LABEL_228;
      v245 = v218 * (int)v192;
      v246 = v219;
      v247 = v576[2];
      v248 = v242 * (int)v192;
      if (v192 >= 8uLL)
      {
        v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v223, 0);
        v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 0);
        v271 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
        v272 = 4 * v245;
        v273 = 4 * v248;
        v274 = v244 + 4 * v247 * v243;
        v275 = (float32x4_t *)&v590;
        v276 = v192 - (unint64_t)(v192 & 7);
        do
        {
          v44 = *(float32x4_t *)(v274 + v273);
          v45 = *(float32x4_t *)(v274 + v273 + 16);
          v277 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(*(float32x4_t *)(v244 + 4 * v247 * v246 + 16 + v273), v224), v42, *(float32x4_t *)(v244 + 4 * v247 * v246 + 16 + v272)), v43, *(float32x4_t *)(v274 + v272 + 16)), v271, v45);
          v275[-1] = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(*(float32x4_t *)(v244 + 4 * v247 * v246 + v273), v224), v42, *(float32x4_t *)(v244 + 4 * v247 * v246 + v272)), v43, *(float32x4_t *)(v274 + v272)), v271, v44);
          *v275 = v277;
          v272 += 32;
          v275 += 2;
          v273 += 32;
          v276 -= 8;
        }
        while (v276);
        v249 = v192 - (unint64_t)(v192 & 7);
        v77 = v575;
        v78 = v577;
        if ((v192 & 7) == 0)
          goto LABEL_272;
      }
      else
      {
        v249 = 0;
      }
      v278 = v247 * v246;
      v279 = v244 + 4 * (v247 * v246 + v245);
      v280 = v244 + 4 * (v278 + v248);
      v281 = v244 + 4 * (v247 * v243 + v245);
      v282 = v244 + 4 * (v247 * v243 + v248);
      do
      {
        v43.i32[0] = *(_DWORD *)(v281 + 4 * v249);
        *((float *)&v589.tv_sec + v249) = (float)((float)((float)(v224 * *(float *)(v280 + 4 * v249))
                                                        + (float)(*(float *)(v279 + 4 * v249) * *(float *)&v223))
                                                + (float)(v43.f32[0] * *(float *)v40.i32))
                                        + (float)(*(float *)(v282 + 4 * v249) * v41.f32[0]);
        ++v249;
      }
      while (v192 != v249);
LABEL_272:
      v321 = v78[1];
      v322 = (v212 * v209) >> 32;
      v323 = (int8x16_t *)(v321 + v322);
      v324 = 0.0;
      v325 = &v589;
      v326 = v192;
      do
      {
        v327 = *(float *)&v325->tv_sec;
        v325 = (timeval *)((char *)v325 + 4);
        v324 = v324 + (float)(v327 * v327);
        --v326;
      }
      while (v326);
      v328 = 0.0;
      if (v324 > 1.0e-12)
        v328 = 1.0 / sqrtf(v324);
      if (v188 == INFINITY || v189 == INFINITY)
      {
        if (v192 >= 8uLL)
        {
          v331 = (int16x8_t *)(v321 + v322 + 16);
          v332 = v192 - (unint64_t)(v192 & 7);
          v333 = (float32x4_t *)&v590;
          do
          {
            v40 = (int16x8_t)vmulq_n_f32(*v333, v328);
            v331[-1] = (int16x8_t)vmulq_n_f32(v333[-1], v328);
            *v331 = v40;
            v333 += 2;
            v331 += 2;
            v332 -= 8;
          }
          while (v332);
          v329 = v192 - (unint64_t)(v192 & 7);
          if ((v192 & 7) == 0)
            goto LABEL_228;
        }
        else
        {
          v329 = 0;
        }
        v334 = v192 - v329;
        v335 = 4 * v329;
        v336 = (float *)(v321 + v322 + 4 * v329);
        v337 = (float *)((char *)&v589 + v335);
        do
        {
          v338 = *v337++;
          *v336++ = v328 * v338;
          --v334;
        }
        while (v334);
LABEL_228:
        v200 = v587;
        if (v201 <= ++v209)
          return;
      }
      else
      {
        if (v192 < 8uLL)
        {
          v330 = 0;
LABEL_296:
          v351 = v192 - v330;
          v352 = (_BYTE *)(v321 + v330 + v322);
          v353 = (float *)&v589 + v330;
          do
          {
            v354 = *v353++;
            v355 = (int)(float)(v211 * (float)((float)(v328 * v354) - v230));
            if (v355 >= 255)
              v355 = 255;
            *v352++ = v355 & ~(v355 >> 31);
            --v351;
          }
          while (v351);
          goto LABEL_300;
        }
        if (v192 >= 0x10uLL)
        {
          v340 = (float32x4_t *)&v589;
          v341 = v192 - (unint64_t)(v192 & 0xF);
          do
          {
            v42 = vmulq_n_f32(vsubq_f32(vmulq_n_f32(v340[3], v328), v214), v211);
            v41 = vmulq_n_f32(vsubq_f32(vmulq_n_f32(v340[2], v328), v214), v211);
            v342 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(*v340, v328), v214), v211)), v215), (int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(v340[1], v328), v214), v211)), v215)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL);
            v343 = vmovl_high_u16((uint16x8_t)v342);
            v43 = (float32x4_t)vmovl_u16(*(uint16x4_t *)&v342);
            v40 = (int16x8_t)vminq_u32(vcvtq_u32_f32(v42), v215);
            v344 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vminq_u32(vcvtq_u32_f32(v41), v215), v40) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL);
            v45 = (float32x4_t)vmovl_high_u16((uint16x8_t)v344);
            v44 = (float32x4_t)vmovl_u16(*(uint16x4_t *)&v344);
            *v323++ = vqtbl4q_s8(*(int8x16x4_t *)v43.f32, (int8x16_t)xmmword_210BCB8E0);
            v340 += 4;
            v341 -= 16;
          }
          while (v341);
          if ((v192 & 0xF) == 0)
            goto LABEL_300;
          v339 = v192 - (unint64_t)(v192 & 0xF);
          v330 = v339;
          if (v213 < 8)
            goto LABEL_296;
        }
        else
        {
          v339 = 0;
        }
        v345 = (float32x4_t *)((char *)&v589 + 4 * v339);
        v346 = (_QWORD *)(v321 + v339 + v322);
        v347 = (v192 & 7) - v192 + v339;
        do
        {
          v349 = *v345;
          v348 = v345[1];
          v345 += 2;
          v350 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(v349, v328), v214), v211)), v215), (int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(v348, v328), v214), v211)), v215)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL);
          v41 = (float32x4_t)vmovl_high_u16((uint16x8_t)v350);
          v40 = (int16x8_t)vmovl_u16(*(uint16x4_t *)&v350);
          *v346++ = vqtbl2q_s8(*(int8x16x2_t *)v40.i8, (int8x16_t)xmmword_210BCB8F0).u64[0];
          v347 += 8;
        }
        while (v347);
        v330 = v192 - (unint64_t)(v192 & 7);
        if ((v192 & 7) != 0)
          goto LABEL_296;
LABEL_300:
        v200 = v587;
        v201 = *(_QWORD *)v587;
        if (*(_QWORD *)v587 <= ++v209)
          return;
      }
    }
    v225 = *((_DWORD *)v77 + 2);
    v226 = *((_DWORD *)v77 + 3);
    v227 = v225 - 1;
    if (v225 - 1 >= v220)
      v227 = v220;
    if (v226 - 1 >= v221)
      v228 = v221;
    else
      v228 = v226 - 1;
    v229 = *v77;
    v230 = *(float *)v580.i32;
    if (!a12)
    {
      if ((int)v192 < 1)
        goto LABEL_228;
      v250 = v218;
      v251 = v227;
      v252 = v227 + v225 * (uint64_t)v228;
      v253 = v226 * (uint64_t)v225;
      v254 = v218 + v225 * (uint64_t)v228;
      v255 = v251 + v225 * (uint64_t)v219;
      v256 = &v589;
      v257 = v192;
      v258 = v250 + v225 * (uint64_t)v219;
      v78 = v577;
      do
      {
        v42.i8[0] = *(_BYTE *)(v229 + v258);
        v42.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v42.f32)).u64[0];
        v43.i8[0] = *(_BYTE *)(v229 + v255);
        v259 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v43.f32)).u64[0];
        *(float *)v259.i32 = v224 * (float)v259.i32[0];
        v42.f32[0] = *(float *)v259.i32 + (float)((float)v42.i32[0] * *(float *)&v223);
        v259.i8[0] = *(_BYTE *)(v229 + v254);
        v260 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v259)).u64[0];
        *(float *)v260.i32 = (float)v260.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(*(float *)v260.i32 * *(float *)v40.i32);
        v260.i8[0] = *(_BYTE *)(v229 + v252);
        v43.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v260)).u64[0];
        v43.f32[0] = (float)v43.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(v43.f32[0] * v41.f32[0]);
        LODWORD(v256->tv_sec) = v42.i32[0];
        v256 = (timeval *)((char *)v256 + 4);
        v229 += v253;
        --v257;
      }
      while (v257);
      goto LABEL_272;
    }
    if ((int)v192 < 1)
      goto LABEL_228;
    v231 = v219;
    v232 = v77[2];
    v233 = v232 * v231;
    v234 = v229 + v233 + v218 * (uint64_t)(int)v192;
    v235 = v229 + v233 + v227 * (uint64_t)(int)v192;
    v236 = v232 * v228;
    v237 = v229 + v236 + v218 * (uint64_t)(int)v192;
    v238 = v229 + v236 + v227 * (uint64_t)(int)v192;
    if (v192 < 4uLL)
    {
      v239 = 0;
      do
      {
LABEL_271:
        v42.i8[0] = *(_BYTE *)(v234 + v239);
        v42.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v42.f32)).u64[0];
        v43.i8[0] = *(_BYTE *)(v235 + v239);
        v319 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v43.f32)).u64[0];
        *(float *)v319.i32 = v224 * (float)v319.i32[0];
        v42.f32[0] = *(float *)v319.i32 + (float)((float)v42.i32[0] * *(float *)&v223);
        v319.i8[0] = *(_BYTE *)(v237 + v239);
        v320 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v319)).u64[0];
        *(float *)v320.i32 = (float)v320.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(*(float *)v320.i32 * *(float *)v40.i32);
        v320.i8[0] = *(_BYTE *)(v238 + v239);
        v43.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v320)).u64[0];
        v43.f32[0] = (float)v43.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(v43.f32[0] * v41.f32[0]);
        *((_DWORD *)&v589.tv_sec + v239++) = v42.i32[0];
      }
      while (v192 != v239);
      goto LABEL_272;
    }
    if (v192 >= 0x10uLL)
    {
      v283 = v218 * (uint64_t)(int)v192;
      v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v223, 0);
      v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 0);
      v284 = v229 + v233;
      v285 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
      v286 = v229 + v236;
      v287 = &v589;
      v288 = v227 * (uint64_t)(int)v192;
      v289 = v192 - (unint64_t)(v192 & 0xF);
      do
      {
        v290 = *(int8x16_t *)(v284 + v283);
        v291 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        v292 = vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL));
        v290.i64[0] = vextq_s8(v290, v290, 8uLL).u64[0];
        v293 = vcvtq_f32_s32(v292);
        v294 = *(int8x16_t *)(v284 + v288);
        v295 = (int8x8_t)vextq_s8(v294, v294, 8uLL).u64[0];
        v296 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        v297 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        v298 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v295, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        v299 = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v294.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))), v224);
        v300 = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v294.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))), v224);
        v301 = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v295, *(int8x8_t *)&v210), 8uLL), 8uLL))), v224);
        v302 = vmlaq_f32(v300, v42, v293);
        v303 = *(int8x16_t *)(v286 + v283);
        v304 = (int8x8_t)vextq_s8(v303, v303, 8uLL).u64[0];
        v305 = vmlaq_f32(v299, v42, v291);
        v306 = vmlaq_f32(vmulq_n_f32(v298, v224), v42, v297);
        v307 = *(int8x16_t *)(v286 + v288);
        v291.i64[0] = vextq_s8(v307, v307, 8uLL).u64[0];
        v45 = vmlaq_f32(vmlaq_f32(v302, v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v303.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v307.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        v44 = vmlaq_f32(vmlaq_f32(v305, v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v303.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v307.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        *v287 = (timeval)v45;
        v287[1] = (timeval)v44;
        v287[2] = (timeval)vmlaq_f32(vmlaq_f32(v306, v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v304, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v291.f32, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        v287[3] = (timeval)vmlaq_f32(vmlaq_f32(vmlaq_f32(v301, v42, v296), v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v304, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v291.f32, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        v284 += 16;
        v286 += 16;
        v287 += 4;
        v289 -= 16;
      }
      while (v289);
      v77 = v575;
      v78 = v577;
      if ((v192 & 0xF) == 0)
        goto LABEL_272;
      v270 = v192 - (unint64_t)(v192 & 0xF);
      v239 = v270;
      if (v213 < 4)
        goto LABEL_271;
    }
    else
    {
      v270 = 0;
    }
    v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v223, 0);
    v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 0);
    v308 = (float32x4_t *)((char *)&v589 + 4 * v270);
    v309 = v192 - (unint64_t)(v192 & 3);
    v310 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
    v311 = v238;
    v312 = v237;
    v313 = v235;
    v314 = v234;
    do
    {
      v44.i32[0] = *(_DWORD *)(v314 + v270);
      v315 = vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v44.f32)));
      v45.i32[0] = *(_DWORD *)(v313 + v270);
      v316 = vmlaq_f32(vmulq_n_f32(vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v45.f32))), v224), v42, v315);
      v315.i32[0] = *(_DWORD *)(v312 + v270);
      v317 = vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v315.f32)));
      v318 = vmlaq_f32(v316, v43, v317);
      v317.i32[0] = *(_DWORD *)(v311 + v270);
      v44 = vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v317.f32)));
      v45 = vmlaq_f32(v318, v310, v44);
      *v308++ = v45;
      v314 += 4;
      v313 += 4;
      v312 += 4;
      v311 += 4;
      v309 -= 4;
    }
    while (v270 != v309);
    v239 = v192 - (unint64_t)(v192 & 3);
    v77 = v575;
    v78 = v577;
    if ((v192 & 3) == 0)
      goto LABEL_272;
    goto LABEL_271;
  }
}

void *pick_xy(void *result, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, float a15, float a16, float a17, float a18, int a19)
{
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  float v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  if ((_DWORD)result == 4)
  {
    if (a9 <= a10 || a9 <= a11 || a9 <= a12 || a9 <= a13)
      return result;
  }
  else if ((_DWORD)result == 8)
  {
    v21 = a9 < a13 || a9 <= a10;
    v22 = v21 || a9 < a11;
    v23 = v22 || a9 <= a12;
    v24 = v23 || a9 <= a14;
    v25 = v24 || a9 <= a15;
    v26 = v25 || a9 <= a16;
    if (v26 || a9 <= a17)
      return result;
  }
  v31 = a9;
  if (a6)
  {
    v32 = *(_QWORD *)(a6 + 16) * (int)(((double)a3 + 0.5) * (double)*(int *)(a6 + 12) / (double)a5 + -0.5)
        + (int)(((double)a2 + 0.5) * (double)*(int *)(a6 + 8) / (double)a4 + -0.5);
    v31 = (float)(*(float *)(*(_QWORD *)a6 + 4 * v32) * a9) <= 1.0 ? *(float *)(*(_QWORD *)a6 + 4 * v32) * a9 : 1.0;
    if (v31 < a18)
      return result;
  }
  if (a19)
  {
    v33 = 1.0 / (float)((float)((float)((float)(a9 + a10) + a11) + a12) + a13);
    v34 = (float)(a11 - a10) * v33;
    v35 = -1.0;
    v36 = -1.0;
    if (v34 >= -1.0)
    {
      v36 = 1.0;
      if (v34 <= 1.0)
        v36 = v34;
    }
    v37 = (float)(a13 - a12) * v33;
    if (v37 >= -1.0)
    {
      v35 = 1.0;
      if (v37 <= 1.0)
        v35 = v37;
    }
    v38 = v36 + (float)a2;
    v39 = v35 + (float)a3;
    v40 = *(_QWORD *)a7;
    v41 = *(_QWORD *)(a7 + 16);
    if (*(_QWORD *)a7 < v41)
      goto LABEL_60;
    goto LABEL_52;
  }
  v38 = (float)a2;
  v39 = (float)a3;
  v40 = *(_QWORD *)a7;
  v41 = *(_QWORD *)(a7 + 16);
  if (*(_QWORD *)a7 >= v41)
  {
LABEL_52:
    v42 = 2 * v41;
    v43 = v41 == 0;
    v44 = 32;
    if (!v43)
      v44 = v42;
    if (v44 <= v40)
      v45 = v40 + 1;
    else
      v45 = v44;
    if (v45)
    {
      result = malloc_type_realloc(*(void **)(a7 + 8), 8 * v45, 0xE13CAFE2uLL);
      *(_QWORD *)(a7 + 8) = result;
      v40 = *(_QWORD *)a7;
    }
    *(_QWORD *)(a7 + 16) = v45;
  }
LABEL_60:
  *(_QWORD *)a7 = v40 + 1;
  v46 = (float *)(*(_QWORD *)(a7 + 8) + 8 * v40);
  *v46 = v38;
  v46[1] = v39;
  v47 = *(_QWORD *)a8;
  v48 = *(_QWORD *)(a8 + 16);
  if (*(_QWORD *)a8 >= v48)
  {
    v49 = 2 * v48;
    v43 = v48 == 0;
    v50 = 64;
    if (!v43)
      v50 = v49;
    if (v50 <= v47)
      v51 = v47 + 1;
    else
      v51 = v50;
    if (v51)
    {
      result = malloc_type_realloc(*(void **)(a8 + 8), 4 * v51, 0x13292637uLL);
      *(_QWORD *)(a8 + 8) = result;
      v47 = *(_QWORD *)a8;
    }
    *(_QWORD *)(a8 + 16) = v51;
  }
  *(_QWORD *)a8 = v47 + 1;
  *(float *)(*(_QWORD *)(a8 + 8) + 4 * v47) = v31;
  return result;
}

double g_rot_xyz(double *a1, double a2, double a3, double a4)
{
  __double2 v7;
  __double2 v8;
  __double2 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double result;

  v7 = __sincos_stret(a4);
  v8 = __sincos_stret(a3);
  v9 = __sincos_stret(a2);
  v10 = -(v7.__sinval * v8.__cosval);
  v11 = v9.__sinval * (v8.__sinval * v7.__cosval) + v7.__sinval * v9.__cosval;
  v12 = v7.__cosval * v9.__cosval - v8.__sinval * v7.__sinval * v9.__sinval;
  v13 = -(v8.__cosval * v9.__sinval);
  v14 = v7.__sinval * v9.__sinval - v8.__sinval * v7.__cosval * v9.__cosval;
  v15 = v9.__cosval * (v8.__sinval * v7.__sinval) + v7.__cosval * v9.__sinval;
  v16 = *a1;
  v17 = a1[1];
  v18 = a1[2];
  v19 = v12 * v17 + *a1 * v10 + v18 * v15;
  *a1 = v11 * v17 + *a1 * (v8.__cosval * v7.__cosval) + v18 * v14;
  a1[1] = v19;
  a1[2] = v13 * v17 + v16 * v8.__sinval + v18 * (v9.__cosval * v8.__cosval);
  v20 = a1[4];
  v21 = a1[5];
  v22 = a1[6];
  a1[4] = v11 * v21 + v20 * (v8.__cosval * v7.__cosval) + v22 * v14;
  a1[5] = v12 * v21 + v20 * v10 + v22 * v15;
  a1[6] = v13 * v21 + v20 * v8.__sinval + v22 * (v9.__cosval * v8.__cosval);
  v23 = a1[8];
  v24 = a1[9];
  v25 = a1[10];
  a1[8] = v11 * v24 + v23 * (v8.__cosval * v7.__cosval) + v25 * v14;
  a1[9] = v12 * v24 + v23 * v10 + v25 * v15;
  a1[10] = v13 * v24 + v23 * v8.__sinval + v25 * (v9.__cosval * v8.__cosval);
  v26 = a1[12];
  v27 = a1[13];
  v28 = v11 * v27 + v26 * (v8.__cosval * v7.__cosval);
  v29 = a1[14];
  a1[12] = v28 + v29 * v14;
  a1[13] = v12 * v27 + v26 * v10 + v29 * v15;
  result = v13 * v27 + v26 * v8.__sinval + v29 * (v9.__cosval * v8.__cosval);
  a1[14] = result;
  return result;
}

double g_mul_4x4(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double result;

  v3 = a2[1];
  v4 = a2[2];
  v5 = a2[3];
  v6 = a3[4];
  v7 = a3[5];
  v8 = a3[1];
  v10 = a3[8];
  v9 = a3[9];
  v12 = a3[12];
  v11 = a3[13];
  v13 = v3 * v6 + *a2 * *a3 + v4 * v10 + v5 * v12;
  v14 = v3 * v7 + *a2 * v8 + v4 * v9 + v5 * v11;
  v15 = a3[6];
  v16 = a3[7];
  v17 = a3[2];
  v18 = a3[3];
  v19 = a3[10];
  v20 = a3[11];
  v22 = a3[14];
  v21 = a3[15];
  v23 = v3 * v15 + *a2 * v17 + v4 * v19 + v5 * v22;
  v24 = v3 * v16 + *a2 * v18 + v4 * v20 + v5 * v21;
  v25 = a2[4];
  v26 = a2[5];
  v27 = a2[6];
  v28 = a2[7];
  v29 = v6 * v26 + v25 * *a3 + v27 * v10 + v28 * v12;
  v30 = v7 * v26 + v25 * v8 + v27 * v9 + v28 * v11;
  v31 = v15 * v26 + v25 * v17 + v27 * v19 + v28 * v22;
  v32 = v16 * v26 + v25 * v18 + v27 * v20 + v28 * v21;
  v33 = a2[8];
  v34 = a2[9];
  v36 = a2[10];
  v35 = a2[11];
  v37 = v6 * v34 + v33 * *a3 + v36 * v10 + v35 * v12;
  v38 = v7 * v34 + v33 * v8 + v36 * v9 + v35 * v11;
  v39 = v15 * v34 + v33 * v17 + v36 * v19 + v35 * v22;
  v40 = v16 * v34 + v33 * v18 + v36 * v20 + v35 * v21;
  v41 = a2[12];
  v42 = a2[13];
  v43 = a2[14];
  v44 = a2[15];
  v45 = v6 * v42 + v41 * *a3 + v43 * v10 + v44 * v12;
  *a1 = v13;
  a1[1] = v14;
  a1[2] = v23;
  a1[3] = v24;
  a1[4] = v29;
  a1[5] = v30;
  a1[6] = v31;
  a1[7] = v32;
  a1[8] = v37;
  a1[9] = v38;
  a1[10] = v39;
  a1[11] = v40;
  a1[12] = v45;
  a1[13] = v7 * v42 + v41 * v8 + v43 * v9 + v44 * v11;
  result = v16 * v42 + v41 * v18 + v43 * v20 + v44 * v21;
  a1[14] = v15 * v42 + v41 * v17 + v43 * v19 + v44 * v22;
  a1[15] = result;
  return result;
}

double g_log_so3(double *a1, double *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  double v15;

  v4 = a2[4];
  v5 = a2[8];
  v6 = *a2 + v4 + v5;
  if (v6 == -1.0)
  {
    v7 = sqrt((*a2 + -1.0) * 0.5 + 1.0);
    if (v7 == 0.0)
    {
      v8 = sqrt((v4 + -1.0) * 0.5 + 1.0);
      if (v8 == 0.0)
      {
        v9 = sqrt((v5 + -1.0) * 0.5 + 1.0);
        if (v9 == 0.0)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_matrix.c", 398, (uint64_t)"g_log_so3", "One of b, c, d should be nonzero");
          exit(1);
        }
        v7 = a2[2] * 0.5 / v9;
        v8 = a2[5] * 0.5 / v9;
      }
      else
      {
        v7 = a2[1] * 0.5 / v8;
        v9 = a2[7] * 0.5 / v8;
      }
    }
    else
    {
      v8 = a2[1] * 0.5 / v7;
      v9 = a2[2] * 0.5 / v7;
    }
    *a1 = v7 * 3.14159265;
    a1[1] = v8 * 3.14159265;
    a1[2] = v9 * 3.14159265;
    return 3.14159265;
  }
  else
  {
    v10 = 0.5;
    v11 = (v6 + -1.0) * 0.5;
    v12 = 1.0;
    if (v11 <= 1.0)
      v12 = (v6 + -1.0) * 0.5;
    if (v11 >= -1.0)
      v13 = v12;
    else
      v13 = -1.0;
    v14 = acos(v13);
    v15 = v14;
    if (v14 != 0.0)
      v10 = v14 * 0.5 / sin(v14);
    *a1 = -(v10 * (a2[5] - a2[7]));
    a1[1] = v10 * (a2[2] - a2[6]);
    a1[2] = -(v10 * (a2[1] - a2[3]));
    return v15;
  }
}

void g_exp_so3(double *a1, double *a2)
{
  double v2;
  double v3;
  double v5;
  double v6;
  double v7;
  long double v8;
  long double v9;
  long double v10;
  long double v11;
  long double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  long double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v2 = *a2 * *a2 + 0.0 + a2[1] * a2[1] + a2[2] * a2[2];
  *a1 = 1.0;
  a1[1] = 0.0;
  a1[2] = 0.0;
  a1[3] = 0.0;
  a1[4] = 1.0;
  a1[5] = 0.0;
  a1[6] = 0.0;
  a1[7] = 0.0;
  a1[8] = 1.0;
  v3 = sqrt(v2);
  if (v3 != 0.0)
  {
    v6 = a2[1];
    v5 = a2[2];
    v7 = *a2;
    v8 = sin(v3) / v3;
    v9 = v8 * 0.0;
    v10 = v8 * v6;
    v11 = v8 * v5;
    v12 = v8 * v7;
    v13 = v9 + 1.0;
    v14 = 0.0 - v11;
    v15 = v10 + 0.0;
    v16 = v11 + 0.0;
    v17 = 0.0 - v12;
    v18 = 0.0 - v10;
    v19 = v12 + 0.0;
    v20 = 0.0 - v5 * v5;
    v21 = v20 - v6 * v6;
    v22 = 0.0 - v5 * 0.0 - v5 * 0.0 + v6 * v7;
    v23 = v6 * 0.0 + 0.0 + v5 * v7 + v6 * 0.0;
    v24 = v5 * 0.0 + 0.0 + v5 * 0.0 + v7 * v6;
    v25 = v20 + 0.0 - v7 * v7;
    v26 = v5 * v6 + 0.0;
    v27 = v26 - v7 * 0.0 - v7 * 0.0;
    v28 = 0.0 - v6 * 0.0 + v7 * v5 - v6 * 0.0;
    v29 = v26 + v7 * 0.0 + v7 * 0.0;
    v30 = 0.0 - v6 * v6 - v7 * v7 + 0.0;
    if (fabs(v3) >= 0.001)
    {
      v40 = v19;
      v41 = v25;
      v32 = v18;
      v42 = v15;
      v43 = v17;
      v33 = v16;
      v34 = v14;
      v44 = v22;
      v45 = v21;
      v35 = v27;
      v38 = v29;
      v39 = v28;
      v37 = v30;
      v36 = cos(v3);
      v30 = v37;
      v29 = v38;
      v28 = v39;
      v19 = v40;
      v27 = v35;
      v25 = v41;
      v15 = v42;
      v22 = v44;
      v21 = v45;
      v14 = v34;
      v16 = v33;
      v17 = v43;
      v18 = v32;
      v31 = (1.0 - v36) / v3 / v3;
    }
    else
    {
      v31 = v3 * v3 / -24.0 + 0.5;
    }
    *a1 = v13 + v21 * v31;
    a1[1] = v14 + v22 * v31;
    a1[2] = v15 + v23 * v31;
    a1[3] = v16 + v24 * v31;
    a1[4] = v13 + v25 * v31;
    a1[5] = v17 + v27 * v31;
    a1[6] = v18 + v28 * v31;
    a1[7] = v19 + v29 * v31;
    a1[8] = v13 + v30 * v31;
  }
}

double g_inv_3x3(double *a1, double *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v3 = a2[7];
  v2 = a2[8];
  v4 = a2[4];
  v5 = a2[5];
  v6 = v2 * v4 - v3 * v5;
  v7 = a2[2];
  v8 = a2[1];
  v9 = v2 * v8 - v3 * v7;
  v10 = v5 * v8 - v4 * v7;
  result = *a2 * v6 - v9 * a2[3] + a2[6] * v10;
  *a1 = v6 * (1.0 / result);
  a1[1] = -(v9 * (1.0 / result));
  a1[2] = v10 * (1.0 / result);
  a1[3] = -((a2[8] * a2[3] - a2[6] * a2[5]) * (1.0 / result));
  a1[4] = 1.0 / result * (a2[8] * *a2 - a2[6] * a2[2]);
  a1[5] = -((a2[5] * *a2 - a2[3] * a2[2]) * (1.0 / result));
  a1[6] = 1.0 / result * (a2[7] * a2[3] - a2[6] * a2[4]);
  a1[7] = -((a2[7] * *a2 - a2[6] * a2[1]) * (1.0 / result));
  a1[8] = 1.0 / result * (a2[4] * *a2 - a2[3] * a2[1]);
  return result;
}

uint64_t vl_pose_count_inliers(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, double a7, double a8, double a9, double a10, double a11)
{
  int32x2_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int32x2_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  float v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  float *v61;
  float *v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  const float *v69;
  float32x4_t v70;
  int32x4_t v71;
  float32x4_t v72;
  uint64_t v73;
  float32x4_t v74;
  int32x4_t v75;
  const float *v76;
  const float *v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  int v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  _BOOL4 v96;
  __int32 v98;
  __int32 v99;
  __int32 v100;
  __int32 v101;
  __int32 v102;
  __int32 v103;
  __int32 v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float32x4x3_t v111;
  float32x4x3_t v112;

  v19 = *a2;
  v20 = a2[1];
  v21 = *a2;
  v22 = a6 * a6;
  v23 = *(float **)(a3 + 8);
  v24 = *(float *)(a1 + 40);
  v25 = *(float *)(a1 + 44);
  v11.i32[0] = *(_DWORD *)(a1 + 8);
  v26 = *(float *)(a1 + 12);
  v12.i32[0] = *(_DWORD *)a1;
  v13.i32[0] = *(_DWORD *)(a1 + 4);
  v14.i32[0] = *(_DWORD *)(a1 + 32);
  v27 = *(float *)(a1 + 36);
  v15.i32[0] = *(_DWORD *)(a1 + 24);
  v16.i32[0] = *(_DWORD *)(a1 + 28);
  *(float *)v17.i32 = (float)((float)(v26 * v24) + (float)(*(float *)a1 * v27)) + (float)(*(float *)v15.i32 * v25);
  v28 = *(float *)(a1 + 16);
  v29 = *(float *)(a1 + 20);
  *(float *)&a11 = (float)((float)(v24 * v28) + (float)(*(float *)v13.i32 * v27)) + (float)(*(float *)v16.i32 * v25);
  *(float *)v18.i32 = (float)((float)(v24 * v29) + (float)(*(float *)v11.i32 * v27)) + (float)(*(float *)v14.i32 * v25);
  v110 = v28;
  v108 = *(float *)&a11;
  v109 = v29;
  v107 = *(float *)v18.i32;
  if (a5)
  {
    *(_QWORD *)a5 = 0;
    *(_QWORD *)(a5 + 24) = 0;
    *(_QWORD *)(a5 + 48) = 0;
    if ((int)v19 >= 1)
    {
      v32 = 0;
      v33 = 0;
      v34 = 8 * v21;
      v105 = v26;
      v106 = v22;
      v103 = v12.i32[0];
      v104 = v11.i32[0];
      v101 = v14.i32[0];
      v102 = v13.i32[0];
      v99 = v16.i32[0];
      v100 = v15.i32[0];
      v98 = v17.i32[0];
      do
      {
        v35 = *v23;
        v36 = v23[1];
        v37 = v23[2];
        v38 = (float)((float)((float)(v26 * v36) + (float)(*(float *)v12.i32 * *v23)) + (float)(*(float *)v15.i32 * v37))
            - *(float *)v17.i32;
        if (v38 > 0.0)
        {
          v39 = (float)((float)((float)(v28 * v36) + (float)(*(float *)v13.i32 * v35)) + (float)(*(float *)v16.i32 * v37))
              - *(float *)&a11;
          v40 = (float)((float)((float)(v29 * v36) + (float)(*(float *)v11.i32 * v35)) + (float)(*(float *)v14.i32 * v37))
              - *(float *)v18.i32;
          if ((float)((float)((float)(v40 - (float)(*(float *)(v20 + v32 + 4) * v38))
                             * (float)(v40 - (float)(*(float *)(v20 + v32 + 4) * v38)))
                     + (float)((float)(v39 - (float)(*(float *)(v20 + v32) * v38))
                             * (float)(v39 - (float)(*(float *)(v20 + v32) * v38)))) < (float)(v22 * (float)(v38 * v38)))
          {
            v41 = *(_QWORD *)a5;
            v42 = *(_QWORD *)(a5 + 16);
            if (*(_QWORD *)a5 >= v42)
            {
              if (v42)
                v43 = 2 * v42;
              else
                v43 = 32;
              if (v43 <= v41)
                v44 = v41 + 1;
              else
                v44 = v43;
              if (v44)
              {
                v45 = malloc_type_realloc(*(void **)(a5 + 8), 8 * v44, 0x531BEAACuLL);
                *(float *)v18.i32 = v107;
                *(float *)&a11 = v108;
                v29 = v109;
                v28 = v110;
                v17.i32[0] = v98;
                v16.i32[0] = v99;
                v15.i32[0] = v100;
                v14.i32[0] = v101;
                v13.i32[0] = v102;
                v12.i32[0] = v103;
                v11.i32[0] = v104;
                v26 = v105;
                v22 = v106;
                *(_QWORD *)(a5 + 8) = v45;
                v41 = *(_QWORD *)a5;
              }
              *(_QWORD *)(a5 + 16) = v44;
            }
            *(_QWORD *)a5 = v41 + 1;
            *(_QWORD *)(*(_QWORD *)(a5 + 8) + 8 * v41) = *(_QWORD *)(v20 + v32);
            v46 = *(_QWORD *)(a5 + 24);
            v47 = *(_QWORD *)(a5 + 40);
            if (v46 >= v47)
            {
              v48 = 2 * v47;
              v49 = v47 == 0;
              v50 = 21;
              if (!v49)
                v50 = v48;
              if (v50 <= v46)
                v51 = v46 + 1;
              else
                v51 = v50;
              if (v51)
              {
                v52 = malloc_type_realloc(*(void **)(a5 + 32), 12 * v51, 0xB5DEB5F3uLL);
                *(float *)v18.i32 = v107;
                *(float *)&a11 = v108;
                v29 = v109;
                v28 = v110;
                v17.i32[0] = v98;
                v16.i32[0] = v99;
                v15.i32[0] = v100;
                v14.i32[0] = v101;
                v13.i32[0] = v102;
                v12.i32[0] = v103;
                v11.i32[0] = v104;
                v26 = v105;
                v22 = v106;
                *(_QWORD *)(a5 + 32) = v52;
                v46 = *(_QWORD *)(a5 + 24);
              }
              *(_QWORD *)(a5 + 40) = v51;
            }
            v33 = (v33 + 1);
            *(_QWORD *)(a5 + 24) = v46 + 1;
            v53 = *(_QWORD *)(a5 + 32) + 12 * v46;
            v54 = *(_QWORD *)v23;
            *(float *)(v53 + 8) = v23[2];
            *(_QWORD *)v53 = v54;
            if (a4)
            {
              v55 = *(_QWORD *)(a5 + 48);
              v56 = *(_QWORD *)(a5 + 64);
              if (v55 >= v56)
              {
                if (v56)
                  v57 = 2 * v56;
                else
                  v57 = 32;
                if (v57 <= v55)
                  v58 = v55 + 1;
                else
                  v58 = v57;
                if (v58)
                {
                  v59 = malloc_type_realloc(*(void **)(a5 + 56), 8 * v58, 0x6F8980F0uLL);
                  *(float *)v18.i32 = v107;
                  *(float *)&a11 = v108;
                  v29 = v109;
                  v28 = v110;
                  v17.i32[0] = v98;
                  v16.i32[0] = v99;
                  v15.i32[0] = v100;
                  v14.i32[0] = v101;
                  v13.i32[0] = v102;
                  v12.i32[0] = v103;
                  v11.i32[0] = v104;
                  v26 = v105;
                  v22 = v106;
                  *(_QWORD *)(a5 + 56) = v59;
                  v55 = *(_QWORD *)(a5 + 48);
                }
                *(_QWORD *)(a5 + 64) = v58;
              }
              *(_QWORD *)(a5 + 48) = v55 + 1;
              *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v55) = *(_QWORD *)(*(_QWORD *)(a4 + 8) + v32);
            }
          }
        }
        v23 += 3;
        v32 += 8;
      }
      while (v34 != v32);
      return v33;
    }
    return 0;
  }
  if ((int)v19 < 1)
    return 0;
  if (v21 >= 8)
  {
    v60 = *a2 & 0xFFFFFFF8;
    v61 = (float *)(v20 + 8 * v60);
    v62 = &v23[3 * v60];
    v63 = (float32x4_t)vdupq_lane_s32(v12, 0);
    v64 = (float32x4_t)vdupq_lane_s32(v15, 0);
    v65 = (float32x4_t)vdupq_lane_s32(v17, 0);
    v66 = (float32x4_t)vdupq_lane_s32(v13, 0);
    v67 = (float32x4_t)vdupq_lane_s32(v16, 0);
    v68 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a11, 0);
    v69 = (const float *)(v20 + 32);
    v70 = (float32x4_t)vdupq_lane_s32(v11, 0);
    v71 = 0uLL;
    v72 = (float32x4_t)vdupq_lane_s32(v14, 0);
    v73 = v60;
    v74 = (float32x4_t)vdupq_lane_s32(v18, 0);
    v75 = 0uLL;
    do
    {
      v76 = v23;
      v111 = vld3q_f32(v76);
      v76 += 12;
      v112 = vld3q_f32(v76);
      v77 = v69 - 8;
      v78 = vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v111.val[1], v26), v111.val[0], v63), v111.val[2], v64), v65);
      v79 = vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v111.val[1], v28), v111.val[0], v66), v111.val[2], v67), v68);
      v80 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v111.val[1], v29), v111.val[0], v70), v111.val[2], v72);
      v81 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v112.val[1], v110), v112.val[0], v66), v112.val[2], v67);
      v82 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v112.val[1], v109), v112.val[0], v70), v112.val[2], v72);
      *(float32x4x2_t *)v111.val[0].f32 = vld2q_f32(v77);
      v111.val[2] = vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v112.val[1], v26), v112.val[0], v63), v112.val[2], v64), v65);
      v112.val[0] = vsubq_f32(v80, v74);
      *(float32x4x2_t *)v112.val[1].f32 = vld2q_f32(v69);
      v83 = vsubq_f32(v81, v68);
      v29 = *(float *)(a1 + 20);
      v84 = vmlsq_f32(v79, v78, v111.val[0]);
      v112.val[0] = vmlsq_f32(v112.val[0], v78, v111.val[1]);
      v85 = vmlsq_f32(vsubq_f32(v82, v74), v111.val[2], v112.val[2]);
      v86 = vmlsq_f32(v83, v111.val[2], v112.val[1]);
      v111.val[1] = vmulq_f32(v85, v85);
      v28 = *(float *)(a1 + 16);
      v71 = vsubq_s32(v71, (int32x4_t)vandq_s8((int8x16_t)vcgtzq_f32(v78), (int8x16_t)vcgtq_f32(vmulq_n_f32(vmulq_f32(v78, v78), v22), vmlaq_f32(vmulq_f32(v112.val[0], v112.val[0]), v84, v84))));
      v75 = vsubq_s32(v75, (int32x4_t)vandq_s8((int8x16_t)vcgtzq_f32(v111.val[2]), (int8x16_t)vcgtq_f32(vmulq_n_f32(vmulq_f32(v111.val[2], v111.val[2]), v22), vmlaq_f32(v111.val[1], v86, v86))));
      v23 += 24;
      v69 += 16;
      v73 -= 8;
    }
    while (v73);
    v33 = vaddvq_s32(vaddq_s32(v75, v71));
    *(float *)v18.i32 = v107;
    *(float *)&a11 = v108;
    if ((*a2 & 7) == 0)
      return v33;
  }
  else
  {
    LODWORD(v60) = 0;
    LODWORD(v33) = 0;
    v61 = (float *)a2[1];
    v62 = *(float **)(a3 + 8);
  }
  v87 = v19 - v60;
  do
  {
    v88 = v62[1];
    v89 = v62[2];
    v90 = (float)((float)((float)(v26 * v88) + (float)(*(float *)v12.i32 * *v62)) + (float)(*(float *)v15.i32 * v89))
        - *(float *)v17.i32;
    v91 = (float)(v29 * v88) + (float)(*(float *)v11.i32 * *v62);
    v92 = (float)((float)((float)(v28 * v88) + (float)(*(float *)v13.i32 * *v62)) + (float)(*(float *)v16.i32 * v89))
        - *(float *)&a11;
    v93 = (float)(v91 + (float)(*(float *)v14.i32 * v89)) - *(float *)v18.i32;
    v94 = *v61;
    v95 = v61[1];
    v61 += 2;
    v96 = v90 > 0.0;
    if ((float)((float)((float)(v93 - (float)(v95 * v90)) * (float)(v93 - (float)(v95 * v90)))
               + (float)((float)(v92 - (float)(v94 * v90)) * (float)(v92 - (float)(v94 * v90)))) >= (float)(v22 * (float)(v90 * v90)))
      v96 = 0;
    v33 = (v33 + v96);
    v62 += 3;
    --v87;
  }
  while (v87);
  return v33;
}

uint64_t vl_pose_get_inliers(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, float a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;

  v12 = *a4;
  v50 = 0;
  v51 = 0;
  v47 = 0;
  v48 = 0;
  v44 = 0;
  v45 = 0;
  if ((int)v12 < 1)
  {
    v17 = 0;
    v20 = 0;
  }
  else
  {
    v37 = a1;
    v38 = a5;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = v12;
    v39 = v12;
    do
    {
      v22 = *(_DWORD *)(a4[1] + 8 * v19);
      v23 = *(_QWORD *)(a3 + 8);
      v24 = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 288 * v19);
      v25 = v19 + 1;
      if (v19 >= v18)
      {
        v26 = 2 * v18;
        if (!v18)
          v26 = 32;
        if (v26 <= v19)
          v18 = v19 + 1;
        else
          v18 = v26;
        if (v18)
        {
          v27 = malloc_type_realloc(v17, 8 * v18, 0x94E0E51BuLL);
          v20 = v39;
          v17 = v27;
        }
      }
      *((_QWORD *)v17 + v19) = v24;
      if (v19 >= v16)
      {
        v28 = 2 * v16;
        if (!v16)
          v28 = 21;
        if (v28 <= v19)
          v16 = v19 + 1;
        else
          v16 = v28;
        if (v16)
        {
          v29 = (char *)malloc_type_realloc(v15, 12 * v16, 0xF219AA0DuLL);
          v20 = v39;
          v15 = v29;
        }
      }
      v30 = (uint64_t *)(v23 + 12 * v22);
      v31 = *v30;
      v32 = &v15[12 * v19];
      *((_DWORD *)v32 + 2) = *((_DWORD *)v30 + 2);
      *(_QWORD *)v32 = v31;
      if (v19 >= v14)
      {
        v33 = 2 * v14;
        if (!v14)
          v33 = 32;
        if (v33 <= v19)
          v14 = v19 + 1;
        else
          v14 = v33;
        if (v14)
        {
          v34 = (char *)malloc_type_realloc(v13, 8 * v14, 0x1DE93B76uLL);
          v20 = v39;
          v13 = v34;
        }
      }
      v21 = &v13[8 * v19];
      *(_DWORD *)v21 = v22;
      *((_DWORD *)v21 + 1) = v19++;
    }
    while (v25 != v20);
    v50 = v17;
    v51 = v18;
    v47 = v15;
    v48 = v16;
    v44 = v13;
    v45 = v14;
    a1 = v37;
    a5 = v38;
  }
  v49 = v20;
  v46 = v20;
  v43 = v20;
  v35 = vl_pose_count_inliers(a1, &v49, (uint64_t)&v46, (uint64_t)&v43, a5, a6, a7, a8, a9, a10, a11);
  free(v17);
  free(v47);
  free(v44);
  return v35;
}

uint64_t vl_pose(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14)
{
  timespec *v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  float64x2_t *v30;
  float64x2_t v31;
  float64x2_t v32;
  float32x4_t *v33;
  float32x4_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  float v51;
  float v52;
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
  uint64_t v63;
  float *v64;
  float v65;
  double v66;
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
  char *v79;
  uint64_t v80;
  size_t v81;
  _DWORD *v82;
  uint64_t v83;
  uint64_t v84;
  _DWORD *v85;
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
  char *v98;
  uint64_t v99;
  char *v100;
  int v101;
  int v102;
  float v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  double v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t i;
  void **v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v129;
  uint64_t v130;
  uint64_t v133;
  double *v135;
  void *ptr[2];
  float32x4_t v140;
  float32x4_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  float32x2_t v147;
  float v148;
  int v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;

  v142 = 0;
  v143 = 0;
  v144 = 0;
  v16 = (timespec *)(a1 + 3688);
  v130 = a1 + 3688;
  if (*(_DWORD *)(a1 + 3900))
  {
    *(_QWORD *)(a1 + 3808) -= mach_absolute_time();
  }
  else
  {
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 3720));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 3704));
    clock_gettime(_CLOCK_MONOTONIC, v16);
  }
  vl_dump_detail_add_hash(a10, (uint64_t)"vl_pose input", a3, a7, (_QWORD *)a5);
  vl_dump_detail_pose_input(a10, (uint64_t)a3, (uint64_t)a7);
  v17 = *(float64x2_t *)(a5 + 240);
  v145 = *(_QWORD *)(a2 + 232);
  v146 = *(_DWORD *)(a2 + 240);
  v18 = *(double *)(a2 + 200) - *(double *)(a5 + 312);
  v19 = *(double *)(a2 + 208) - *(double *)(a5 + 320);
  v20 = *(double *)(a2 + 216) - *(double *)(a5 + 328);
  v21 = v19 * *(double *)(a5 + 280) + *(double *)(a5 + 256) * v18 + *(double *)(a5 + 304) * v20;
  v147 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a5 + 264), v19), v17, v18), *(float64x2_t *)(a5 + 288), v20));
  v22 = v21;
  v133 = a1 + 360;
  v135 = (double *)(a5 + 240);
  *(float *)&v18 = (float)(*(float *)(a2 + 224) + 8.0) * 3.0;
  v148 = v22;
  v149 = LODWORD(v18);
  *(_QWORD *)a12 = 0;
  *(_QWORD *)(a12 + 24) = 0;
  *(_QWORD *)(a12 + 48) = 0;
  *(_QWORD *)(a1 + 3928) = 0;
  *(_QWORD *)(a1 + 3952) = 0;
  v23 = 1;
  do
  {
    if ((*(_DWORD *)a9 & v23) != 0)
    {
      ptr[0] = 0;
      ptr[1] = 0;
      v140.i64[0] = 0;
      switch((int)v23)
      {
        case 0:
          printf("Verbose : ");
          printf("Skipping pose estimation (VL_POSE_METHOD_NONE)");
          putchar(10);
          goto LABEL_6;
        case 1:
        case 2:
        case 4:
        case 32:
          v151 = 0u;
          v152 = 0u;
          v150 = 0u;
          if (vl_pose_ransac(a1, v23, a2, (uint64_t)a3, a5, (uint64_t)a7, (uint64_t)&v145, a9 + 4, (uint64_t)&v150) != 1)goto LABEL_29;
          v27 = ptr[0];
          if ((uint64_t)ptr[0] >= v140.i64[0])
          {
            v28 = 5;
            if (v140.i64[0])
              v28 = 2 * v140.i64[0];
            if (v28 <= (uint64_t)ptr[0])
              v29 = (uint64_t)ptr[0] + 1;
            else
              v29 = v28;
            if (v29)
            {
              ptr[1] = malloc_type_realloc(ptr[1], 48 * v29, 0x756B030FuLL);
              v27 = ptr[0];
            }
            v140.i64[0] = v29;
          }
          ptr[0] = (char *)v27 + 1;
          v30 = (float64x2_t *)((char *)ptr[1] + 48 * (_QWORD)v27);
          v31 = v152;
          v32 = v150;
          v30[1] = v151;
          v30[2] = v31;
          *v30 = v32;
          if ((uint64_t)ptr[0] < 1)
            goto LABEL_6;
          goto LABEL_30;
        case 3:
        case 5:
        case 6:
        case 7:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
          goto LABEL_25;
        case 8:
          vl_pose_score(v133, a2, (uint64_t)a3, a4, a5, (uint64_t)a7, a6, a9 + 60, (uint64_t)ptr);
LABEL_29:
          if ((uint64_t)ptr[0] >= 1)
            goto LABEL_30;
          goto LABEL_6;
        case 16:
          vl_pose_g_ps(v133, a2, (uint64_t)a3, a5, a6, (uint64_t)a7, a8, a9, (uint64_t)ptr);
          if ((uint64_t)ptr[0] < 1)
            goto LABEL_6;
          goto LABEL_30;
        case 64:
          printf("%sAborting : ", (const char *)&unk_210BC3C5E);
          printf("Not support running CSL in standalone compilation.");
          putchar(10);
          __assert_rtn("pose_solver", "vl_pose.c", 265, "0");
        default:
          if ((_DWORD)v23 == 128)
          {
            v33 = (float32x4_t *)malloc_type_realloc(0, 0xF0uLL, 0x37F70F79uLL);
            ptr[1] = v33;
            v140.i64[0] = 5;
            ptr[0] = (void *)1;
            v154 = 0u;
            v155 = 0u;
            v152 = 0u;
            v153 = 0u;
            v150 = 0u;
            v151 = 0u;
            g_coords_diff((double *)(a2 + 304), v135, (uint64_t)&v150);
            v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v152), v153);
            *v33 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v150), v151);
            v33[1] = v34;
            v33[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v154), v155);
            if ((uint64_t)ptr[0] < 1)
              goto LABEL_6;
          }
          else
          {
LABEL_25:
            printf("%sError : ", (const char *)&unk_210BC3C5E);
            printf("Unsupported detection method %d", *(_DWORD *)a9);
            putchar(10);
            if ((uint64_t)ptr[0] < 1)
              goto LABEL_6;
          }
LABEL_30:
          v35 = v142;
          if (v142 >= v144)
          {
            if (2 * v144 <= v142)
              v36 = v142 + 1;
            else
              v36 = 2 * v144;
            if (v36)
            {
              v143 = malloc_type_realloc(v143, 280 * v36, 0xF35B09BuLL);
              v35 = v142;
            }
            v144 = v36;
          }
          v142 = v35 + 1;
          v37 = (uint64_t *)v143;
          v38 = (char *)v143 + 280 * v35;
          *((_OWORD *)v38 + 2) = 0u;
          *((_OWORD *)v38 + 3) = 0u;
          *((_OWORD *)v38 + 4) = 0u;
          *((_OWORD *)v38 + 5) = 0u;
          *((_OWORD *)v38 + 6) = 0u;
          *((_OWORD *)v38 + 7) = 0u;
          *((_OWORD *)v38 + 8) = 0u;
          *((_OWORD *)v38 + 9) = 0u;
          *((_OWORD *)v38 + 10) = 0u;
          *((_OWORD *)v38 + 11) = 0u;
          *((_OWORD *)v38 + 12) = 0u;
          *((_OWORD *)v38 + 13) = 0u;
          *((_OWORD *)v38 + 14) = 0u;
          *((_OWORD *)v38 + 15) = 0u;
          *((_OWORD *)v38 + 16) = 0u;
          *((_QWORD *)v38 + 34) = 0;
          *(_OWORD *)v38 = 0u;
          *((_OWORD *)v38 + 1) = 0u;
          v40 = *((_OWORD *)ptr[1] + 1);
          v39 = *((_OWORD *)ptr[1] + 2);
          v41 = *(_OWORD *)ptr[1];
          *((_OWORD *)v38 + 1) = v40;
          *((_OWORD *)v38 + 2) = v39;
          *(_OWORD *)v38 = v41;
          if (*(_DWORD *)(a9 + 344) == 2)
          {
            v42 = *(double *)(a2 + 32);
            vl_pose_irefine((__int128 *)v38, a3, a5, (uint64_t)a7, a9, (float32x2_t *)v38, (uint64_t)&v37[35 * v35 + 16], (uint64_t)&v37[35 * v35 + 6], v42);
          }
          else
          {
            v50 = *(double *)(a2 + 32);
            v51 = *(float *)(a9 + 328) / v50;
            vl_pose_get_inliers((uint64_t)v38, (uint64_t)a3, a5, a7, (uint64_t)&v37[35 * v35 + 6], v51, v50, *(double *)&v40, v24, v25, v26);
            if (*(_DWORD *)(a9 + 344) == 1)
            {
              v52 = *(float *)(a9 + 348) / *(double *)(a2 + 32);
              vl_pose_refine((float32x2_t *)v38, (uint64_t)&v37[35 * v35 + 6], &v37[35 * v35 + 9], *(_DWORD *)(a9 + 364), (float32x2_t *)v38, (uint64_t)&v37[35 * v35 + 16], v52, *(float *)(a9 + 356), *(float *)(a9 + 360));
            }
          }
          if (v23 > 0x20)
            goto LABEL_45;
          if (((1 << v23) & 0x100000016) != 0)
          {
            log_col_app((uint64_t)"RANSAC inlier = %s%d%s", v43, v44, v45, v46, v47, v48, v49, (char)&unk_210BC3C5E);
            goto LABEL_6;
          }
          if (((1 << v23) & 0x10100) != 0)
          {
            log_col_app((uint64_t)"SCORE inlier  = %s%d%s", v43, v44, v45, v46, v47, v48, v49, (char)&unk_210BC3C5E);
          }
          else
          {
LABEL_45:
            if ((_DWORD)v23 == 128)
              log_col_app((uint64_t)"INPUT inlier  = %s%d%s", v43, v44, v45, v46, v47, v48, v49, (char)&unk_210BC3C5E);
          }
LABEL_6:
          free(ptr[1]);
          break;
      }
    }
    v23 = (2 * v23);
  }
  while ((_DWORD)v23 != 256);
  if (!v142)
  {
    *a14 = 0;
    *(_QWORD *)a12 = 0;
    *(_QWORD *)(a12 + 24) = 0;
    *(_QWORD *)(a12 + 48) = 0;
    goto LABEL_111;
  }
  vl_dump_detail_pose_score(a10, &v142);
  if (*(_DWORD *)(a9 + 384))
  {
    vl_hs_compute_hypothesis_scores(a1 + 2120, (unint64_t *)&v142, a2, a3, a5, (uint64_t)a7, (void *)*(unsigned int *)(a9 + 388));
    if (v142 >= 1)
    {
      v60 = 0;
      v61 = 272;
      do
      {
        v129 = *(float *)((char *)v143 + v61);
        log_col_app((uint64_t)"POSE Confidence = %7.5f", v53, v54, v55, v56, v57, v58, v59, SLOBYTE(v129));
        ++v60;
        v61 += 280;
      }
      while (v142 > v60);
    }
  }
  else if (v142 >= 1)
  {
    v62 = 0;
    v63 = 272;
    do
    {
      v64 = (float *)((char *)v143 + v63);
      v65 = (1.0
           - exp(-((double)*(int *)((char *)v143 + v63 - 224)
                 * 0.13
                 * ((double)*(int *)((char *)v143 + v63 - 224)
                  * 0.13))))
          * 0.980000019;
      *v64 = v65;
      v66 = v65;
      log_col_app((uint64_t)"POSE Confidence = %7.5f", v67, v68, v69, v70, v71, v72, v73, SLOBYTE(v66));
      ++v62;
      v63 += 280;
    }
    while (v142 > v62);
  }
  vl_dump_detail_pose_referee(a10, &v142);
  v74 = v142;
  if (v142 >= 1)
  {
    v75 = 0;
    v76 = *(_QWORD *)(a1 + 3928);
    v77 = *(_QWORD *)(a1 + 3944);
    v78 = 272;
    do
    {
      v79 = (char *)v143;
      if (v76 >= v77)
      {
        v80 = 2 * v77;
        if (!v77)
          v80 = 64;
        if (v80 <= v76)
          v77 = v76 + 1;
        else
          v77 = v80;
        if (v77)
        {
          *(_QWORD *)(a1 + 3936) = malloc_type_realloc(*(void **)(a1 + 3936), 4 * v77, 0xB5B411DAuLL);
          v76 = *(_QWORD *)(a1 + 3928);
          v74 = v142;
        }
        *(_QWORD *)(a1 + 3944) = v77;
      }
      *(_QWORD *)(a1 + 3928) = v76 + 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 3936) + 4 * v76) = *(_DWORD *)&v79[v78];
      ++v75;
      v78 += 280;
      ++v76;
    }
    while (v75 < v74);
  }
  if (!*(_DWORD *)(a9 + 376))
  {
LABEL_82:
    vl_dump_detail_pose_fuse(a10, &v142);
    v93 = v142;
    if (v142 > 0)
      goto LABEL_83;
    goto LABEL_101;
  }
  if (*(_DWORD *)(a1 + 3684))
  {
    *(_QWORD *)(a1 + 3592) -= mach_absolute_time();
    if (*(_QWORD *)(a1 + 3976))
      goto LABEL_75;
    goto LABEL_74;
  }
  clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 3504));
  clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 3488));
  clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a1 + 3472));
  if (!*(_QWORD *)(a1 + 3976))
  {
LABEL_74:
    v81 = *(int *)(a9 + 380);
    v82 = malloc_type_calloc(1uLL, 0x50uLL, 0x1020040FF0452BCuLL);
    v82[3] = v81;
    *(_QWORD *)v82 = malloc_type_calloc(v81, 0x2C8uLL, 0x10300403D7DEA7AuLL);
    *((_QWORD *)v82 + 2) = 0x40A0240000000000;
    v82[6] = 8;
    *((_OWORD *)v82 + 2) = xmmword_210BCDC20;
    *((_OWORD *)v82 + 3) = xmmword_210BCDC30;
    *((_OWORD *)v82 + 4) = xmmword_210BCDC40;
    *(_QWORD *)(a1 + 3976) = v82;
  }
LABEL_75:
  if (v142 >= 1)
  {
    v83 = 0;
    v84 = 272;
    do
    {
      v85 = (char *)v143 + v84;
      if (vl_pose_fuse(*(uint64_t **)(a1 + 3976), v135, (float32x2_t *)((char *)v143 + v84 - 272), *(const void **)((char *)v143 + v84 - 216), *(const void **)((char *)v143 + v84 - 192), *(_DWORD *)((char *)v143 + v84 - 200), (float32x2_t *)(a2 + 256), (float *)((char *)v143 + v84), *(float *)((char *)v143 + v84), 0.0, (float32x4_t *)((char *)v143 + v84 - 272), (char *)v143 + v84 - 144, a2, a2 + 24))
      {
        *v85 = 0;
      }
      ++v83;
      v84 += 280;
    }
    while (v142 > v83);
  }
  vl_timer_stop(a1 + 3472);
  if (*(_DWORD *)(a1 + 3684))
  {
    printf("Verbose : ");
    printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 3620), (double)*(uint64_t *)(a1 + 3592) * 0.000001);
    putchar(10);
    goto LABEL_82;
  }
  log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v86, v87, v88, v89, v90, v91, v92, (char)&str_4_1);
  vl_dump_detail_pose_fuse(a10, &v142);
  v93 = v142;
  if (v142 > 0)
  {
LABEL_83:
    v94 = 0;
    v95 = *(_QWORD *)(a1 + 3952);
    v96 = *(_QWORD *)(a1 + 3968);
    v97 = 272;
    do
    {
      v98 = (char *)v143;
      if (v95 >= v96)
      {
        v99 = 2 * v96;
        if (!v96)
          v99 = 64;
        if (v99 <= v95)
          v96 = v95 + 1;
        else
          v96 = v99;
        if (v96)
        {
          *(_QWORD *)(a1 + 3960) = malloc_type_realloc(*(void **)(a1 + 3960), 4 * v96, 0xA03FE08uLL);
          v95 = *(_QWORD *)(a1 + 3952);
          v93 = v142;
        }
        *(_QWORD *)(a1 + 3968) = v96;
      }
      *(_QWORD *)(a1 + 3952) = v95 + 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 3960) + 4 * v95) = *(_DWORD *)&v98[v97];
      ++v94;
      v97 += 280;
      ++v95;
    }
    while (v94 < v93);
    v100 = (char *)v143;
    if (v93 < 1)
    {
      v101 = -1;
    }
    else if (v93 == 1)
    {
      v101 = 0;
    }
    else
    {
      v102 = 0;
      v103 = *((float *)v143 + 68);
      v104 = 1;
      v105 = 552;
      do
      {
        if (*(float *)((char *)v143 + v105) > v103)
        {
          v103 = *(float *)((char *)v143 + v105);
          v102 = v104;
        }
        ++v104;
        v105 += 280;
      }
      while (v93 != v104);
      v101 = v102;
    }
    goto LABEL_107;
  }
LABEL_101:
  v101 = -1;
  v100 = (char *)v143;
LABEL_107:
  v106 = &v100[280 * v101];
  v107 = *(_OWORD *)v106;
  v108 = *((_OWORD *)v106 + 2);
  *(_OWORD *)(a11 + 16) = *((_OWORD *)v106 + 1);
  *(_OWORD *)(a11 + 32) = v108;
  *(_OWORD *)a11 = v107;
  v151 = *((float64x2_t *)v106 + 4);
  v152 = *((float64x2_t *)v106 + 5);
  v153 = *((float64x2_t *)v106 + 6);
  v154 = *((float64x2_t *)v106 + 7);
  v150 = *((float64x2_t *)v106 + 3);
  *((_OWORD *)v106 + 3) = *(_OWORD *)a12;
  v109 = *(_OWORD *)(a12 + 64);
  v111 = *(_OWORD *)(a12 + 16);
  v110 = *(_OWORD *)(a12 + 32);
  *((_OWORD *)v106 + 6) = *(_OWORD *)(a12 + 48);
  *((_OWORD *)v106 + 7) = v109;
  *((_OWORD *)v106 + 4) = v111;
  *((_OWORD *)v106 + 5) = v110;
  v112 = v154;
  v113 = v152;
  *(float64x2_t *)(a12 + 48) = v153;
  *(float64x2_t *)(a12 + 64) = v112;
  v114 = v151;
  *(float64x2_t *)a12 = v150;
  *(float64x2_t *)(a12 + 16) = v114;
  *(float64x2_t *)(a12 + 32) = v113;
  *a13 = *((_DWORD *)v106 + 32);
  a13[1] = *((_DWORD *)v106 + 33);
  a13[2] = *((_DWORD *)v106 + 34);
  a13[3] = *((_DWORD *)v106 + 35);
  a13[4] = *((_DWORD *)v106 + 36);
  a13[5] = *((_DWORD *)v106 + 37);
  a13[6] = *((_DWORD *)v106 + 38);
  a13[7] = *((_DWORD *)v106 + 39);
  a13[8] = *((_DWORD *)v106 + 40);
  a13[9] = *((_DWORD *)v106 + 41);
  a13[10] = *((_DWORD *)v106 + 42);
  a13[11] = *((_DWORD *)v106 + 43);
  a13[12] = *((_DWORD *)v106 + 44);
  a13[13] = *((_DWORD *)v106 + 45);
  a13[14] = *((_DWORD *)v106 + 46);
  a13[15] = *((_DWORD *)v106 + 47);
  a13[16] = *((_DWORD *)v106 + 48);
  a13[17] = *((_DWORD *)v106 + 49);
  a13[18] = *((_DWORD *)v106 + 50);
  a13[19] = *((_DWORD *)v106 + 51);
  a13[20] = *((_DWORD *)v106 + 52);
  a13[21] = *((_DWORD *)v106 + 53);
  a13[22] = *((_DWORD *)v106 + 54);
  a13[23] = *((_DWORD *)v106 + 55);
  a13[24] = *((_DWORD *)v106 + 56);
  a13[25] = *((_DWORD *)v106 + 57);
  a13[26] = *((_DWORD *)v106 + 58);
  a13[27] = *((_DWORD *)v106 + 59);
  a13[28] = *((_DWORD *)v106 + 60);
  a13[29] = *((_DWORD *)v106 + 61);
  a13[30] = *((_DWORD *)v106 + 62);
  a13[31] = *((_DWORD *)v106 + 63);
  a13[32] = *((_DWORD *)v106 + 64);
  a13[33] = *((_DWORD *)v106 + 65);
  a13[34] = *((_DWORD *)v106 + 66);
  a13[35] = *((_DWORD *)v106 + 67);
  LODWORD(v107) = *((_DWORD *)v106 + 68);
  *a14 = v107;
  vl_dump_detail_pose_result(a10, (float32x2_t *)a11, a12, *(float *)&v107);
  if (*(double *)(a1 + 4056) != 0.0 || *(double *)(a1 + 4064) != 0.0 || *(double *)(a1 + 4072) != 0.0)
  {
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    g_camera_global_to_local(v135, (double *)(a1 + 3984), v150.f64);
    *(float32x4_t *)ptr = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v150), v151);
    v140 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v152), v153);
    v141 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v154), v155);
    *(_DWORD *)(a12 + 72) = vl_pose_get_inliers((uint64_t)ptr, (uint64_t)a3, a5, a7, 0, *(float *)(a9 + 8), *(double *)v141.i64, *(double *)v140.i64, v115, v116, v117);
    printf("Verbose : ");
    printf("%s: %d inliers_gt_pose", "vl_pose", *(_DWORD *)(a12 + 72));
    putchar(10);
  }
LABEL_111:
  if (v142 >= 1)
  {
    v118 = 0;
    for (i = 0; i < v142; ++i)
    {
      v120 = (void **)((char *)v143 + v118);
      free(*(void **)((char *)v143 + v118 + 56));
      free(v120[10]);
      free(v120[13]);
      v118 += 280;
    }
  }
  free(v143);
  vl_timer_stop(v130);
  if (!*(_DWORD *)(a1 + 3900))
    return log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v121, v122, v123, v124, v125, v126, v127, (char)&str_4_1);
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 3836), (double)*(uint64_t *)(a1 + 3808) * 0.000001);
  return putchar(10);
}

int32x2_t slam_tracker_vo_par_ver@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int32x4_t v2;
  int32x2_t result;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;

  switch(a1)
  {
    case 0:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_DWORD *)a2 = 10;
      *(_DWORD *)(a2 + 20) = 360000;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_OWORD *)(a2 + 36) = xmmword_210BCE170;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      v2 = vdupq_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a2 + 88) = 12;
      *(int32x4_t *)(a2 + 104) = v2;
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_QWORD *)(a2 + 120) = v2.i64[0];
      *(_QWORD *)(a2 + 128) = 0x100000002;
      *(_QWORD *)(a2 + 140) = 0x500000003;
      *(_DWORD *)(a2 + 148) = 2;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE190;
      *(int32x4_t *)(a2 + 168) = vdupq_n_s32(0x3DCCCCCDu);
      *(_DWORD *)(a2 + 232) = 1043422380;
      *(_OWORD *)(a2 + 184) = xmmword_210BCE1A0;
      *(_QWORD *)(a2 + 200) = 0x3F0000003F000000;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      result = vdup_n_s32(0x7F800000u);
      *(int32x2_t *)(a2 + 264) = result;
      *(_DWORD *)(a2 + 296) = -1;
      break;
    case 32:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      v4 = vdupq_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a2 + 88) = 12;
      *(int32x4_t *)(a2 + 104) = v4;
      *(_QWORD *)(a2 + 120) = v4.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_QWORD *)(a2 + 196) = 0x3F0000003F000000;
      *(_DWORD *)(a2 + 204) = 1056964608;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_QWORD *)(a2 + 260) = 0x3F26666600000002;
      *(_DWORD *)(a2 + 268) = 2139095040;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_QWORD *)(a2 + 208) = 0x3A83126F3A83126FLL;
      *(_QWORD *)(a2 + 216) = 0x3A83126F3A83126FLL;
      *(_QWORD *)(a2 + 224) = 0x3A83126F3A83126FLL;
      *(_DWORD *)a2 = 20;
      *(_QWORD *)(a2 + 140) = 0x20000000ALL;
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 168) = xmmword_210BCE250;
      *(int32x2_t *)(a2 + 184) = vdup_n_s32(0x3C8EFA35u);
      *(_DWORD *)(a2 + 192) = 1016003125;
      *(_QWORD *)(a2 + 128) = 0x100000001;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_QWORD *)(a2 + 36) = 0x3FC0000040A00000;
      result = (int32x2_t)0x412000003C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE200;
      *(_DWORD *)(a2 + 20) = 122500;
      break;
    case 35:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v5 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v5;
      *(_QWORD *)(a2 + 120) = v5.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_QWORD *)(a2 + 164) = 0x3DCCCCCD3DB2B8C2;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(_OWORD *)(a2 + 196) = xmmword_210BCE230;
      *(int32x4_t *)(a2 + 212) = vdupq_n_s32(0x3A83126Fu);
      *(_DWORD *)a2 = 20;
      *(_QWORD *)(a2 + 140) = 0x20000000ALL;
      *(_QWORD *)(a2 + 148) = 0x3C23D70A00000001;
      *(_QWORD *)(a2 + 128) = 0x100000001;
      *(_QWORD *)(a2 + 228) = 0x40A000003A83126FLL;
      *(_OWORD *)(a2 + 36) = xmmword_210BCE240;
      *(_DWORD *)(a2 + 156) = 1092616192;
      *(_DWORD *)(a2 + 160) = 1065353216;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_QWORD *)(a2 + 264) = 0x3DCCCCCD3F266666;
      *(_DWORD *)(a2 + 292) = 1069547520;
      result = (int32x2_t)0xF00000001;
      *(_QWORD *)(a2 + 240) = 0xF00000001;
      *(_QWORD *)(a2 + 172) = 0x3D4CCCCD3DCCCCCDLL;
      *(_QWORD *)(a2 + 180) = 0x3AE4C3883D4CCCCDLL;
      *(_QWORD *)(a2 + 188) = 0x3AE4C3883AE4C388;
      break;
    case 36:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v6 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v6;
      *(_QWORD *)(a2 + 120) = v6.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_QWORD *)(a2 + 260) = 0x3F26666600000002;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)a2 = 20;
      *(_QWORD *)(a2 + 140) = 0x20000000ALL;
      *(_QWORD *)(a2 + 148) = 0x3C23D70A00000001;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 156) = xmmword_210BCE210;
      *(_QWORD *)(a2 + 128) = 0x900000001;
      *(_OWORD *)(a2 + 272) = xmmword_210BCE220;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 268) = 1036831949;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(_QWORD *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(_QWORD *)(a2 + 172) = 0x3D4CCCCD3E19999ALL;
      *(_QWORD *)(a2 + 180) = 0x3AE4C3883D4CCCCDLL;
      *(_QWORD *)(a2 + 188) = 0x3AE4C3883AE4C388;
      *(_OWORD *)(a2 + 208) = xmmword_210BCE1C0;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      result = (int32x2_t)0x3F80000040A00000;
      *(_QWORD *)(a2 + 36) = 0x3F80000040A00000;
      break;
    case 37:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v7 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v7;
      *(_QWORD *)(a2 + 120) = v7.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_QWORD *)(a2 + 264) = 0x3DCCCCCD3F266666;
      *(_QWORD *)(a2 + 148) = 0x3C23D70A00000001;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 156) = xmmword_210BCE210;
      *(_QWORD *)(a2 + 128) = 0x900000001;
      *(_OWORD *)(a2 + 272) = xmmword_210BCE220;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(_QWORD *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(_QWORD *)(a2 + 172) = 0x3D4CCCCD3E19999ALL;
      *(_QWORD *)(a2 + 180) = 0x3AE4C3883D4CCCCDLL;
      *(_OWORD *)(a2 + 208) = xmmword_210BCE1C0;
      *(_QWORD *)(a2 + 188) = 0x3AE4C3883AE4C388;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(_QWORD *)(a2 + 36) = 0x3F80000040A00000;
      *(_DWORD *)a2 = 16;
      result = (int32x2_t)0x20000000FLL;
      *(_QWORD *)(a2 + 140) = 0x20000000FLL;
      *(_DWORD *)(a2 + 296) = 7;
      break;
    case 38:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v8 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v8;
      *(_QWORD *)(a2 + 120) = v8.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)a2 = 20;
      *(_QWORD *)(a2 + 140) = 0x20000000ALL;
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE200;
      *(_OWORD *)(a2 + 264) = xmmword_210BCE1B0;
      *(_OWORD *)(a2 + 208) = xmmword_210BCE1C0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(_QWORD *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(_QWORD *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_QWORD *)(a2 + 36) = 0x3F80000040E00000;
      *(_QWORD *)(a2 + 172) = 0x3DCCCCCD3F000000;
      *(_QWORD *)(a2 + 180) = 0x3D0EFA353DCCCCCDLL;
      *(_QWORD *)(a2 + 188) = 0x3D0EFA353D0EFA35;
      result = (int32x2_t)0x1900000001;
      *(_QWORD *)(a2 + 128) = 0x1900000001;
      break;
    case 39:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v9 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v9;
      *(_QWORD *)(a2 + 120) = v9.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)a2 = 20;
      *(_QWORD *)(a2 + 140) = 0x20000000ALL;
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 264) = xmmword_210BCE1B0;
      *(_OWORD *)(a2 + 208) = xmmword_210BCE1C0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(_QWORD *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(_QWORD *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_QWORD *)(a2 + 36) = 0x3F80000040E00000;
      *(_QWORD *)(a2 + 172) = 0x3DCCCCCD3F000000;
      *(_QWORD *)(a2 + 180) = 0x3D0EFA353DCCCCCDLL;
      *(_QWORD *)(a2 + 188) = 0x3D0EFA353D0EFA35;
      *(_QWORD *)(a2 + 128) = 0x3800000001;
      result = (int32x2_t)0x412000003DCCCCCDLL;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE1D0;
      break;
    case 40:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v10 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v10;
      *(_QWORD *)(a2 + 120) = v10.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_OWORD *)(a2 + 200) = xmmword_210BCE1E0;
      *(_OWORD *)(a2 + 264) = xmmword_210BCE1B0;
      *(_OWORD *)(a2 + 216) = xmmword_210BCE1F0;
      *(_QWORD *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE1D0;
      *(_QWORD *)(a2 + 172) = 0x3F0000003E4CCCCDLL;
      *(_QWORD *)(a2 + 180) = 0x3E32B8C23F000000;
      *(_QWORD *)(a2 + 188) = 0x3DB2B8C23DB2B8C2;
      *(_DWORD *)(a2 + 292) = 1067030938;
      *(_QWORD *)(a2 + 36) = 0x3FC0000040400000;
      *(_QWORD *)(a2 + 128) = 0x3900000001;
      *(_DWORD *)(a2 + 196) = 1056964608;
      *(_DWORD *)a2 = 16;
      result = (int32x2_t)0x200000008;
      *(_QWORD *)(a2 + 140) = 0x200000008;
      break;
    case 41:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v11 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v11;
      *(_QWORD *)(a2 + 120) = v11.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 264) = xmmword_210BCE1B0;
      *(_OWORD *)(a2 + 208) = xmmword_210BCE1C0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_QWORD *)(a2 + 200) = 0x3F8000003F800000;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(_QWORD *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE1D0;
      *(_DWORD *)(a2 + 292) = 1067030938;
      *(_QWORD *)(a2 + 128) = 0x3900000001;
      *(_DWORD *)(a2 + 196) = 1056964608;
      *(_DWORD *)a2 = 16;
      *(_QWORD *)(a2 + 140) = 0x200000008;
      *(_QWORD *)(a2 + 172) = 0x3F8000003E4CCCCDLL;
      *(_QWORD *)(a2 + 180) = 0x3E32B8C23F800000;
      *(_QWORD *)(a2 + 188) = 0x3DB2B8C23DB2B8C2;
      result = (int32x2_t)0x3F80000040400000;
      *(_QWORD *)(a2 + 36) = 0x3F80000040400000;
      break;
    case 42:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v12 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v12;
      *(_QWORD *)(a2 + 120) = v12.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 264) = xmmword_210BCE1B0;
      *(_OWORD *)(a2 + 208) = xmmword_210BCE1C0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_QWORD *)(a2 + 200) = 0x3F8000003F800000;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(_QWORD *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE1D0;
      *(_DWORD *)(a2 + 292) = 1067030938;
      *(_DWORD *)(a2 + 196) = 1056964608;
      *(_QWORD *)(a2 + 172) = 0x3F8000003E4CCCCDLL;
      *(_QWORD *)(a2 + 180) = 0x3E32B8C23F800000;
      *(_QWORD *)(a2 + 188) = 0x3DB2B8C23DB2B8C2;
      *(_QWORD *)(a2 + 36) = 0x3F80000040400000;
      *(_QWORD *)(a2 + 128) = 0x1900000001;
      *(_DWORD *)a2 = 24;
      result = (int32x2_t)0x20000000CLL;
      *(_QWORD *)(a2 + 140) = 0x20000000CLL;
      break;
    case 70:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_DWORD *)(a2 + 20) = 360000;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_OWORD *)(a2 + 36) = xmmword_210BCE170;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      v13 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v13;
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(_DWORD *)(a2 + 52) = 2;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_QWORD *)(a2 + 120) = v13.i64[0];
      *(_QWORD *)(a2 + 128) = 0x100000002;
      *(_QWORD *)(a2 + 140) = 0x500000003;
      *(_DWORD *)(a2 + 148) = 2;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE190;
      *(int32x4_t *)(a2 + 168) = vdupq_n_s32(0x3DCCCCCDu);
      *(_DWORD *)(a2 + 232) = 1043422380;
      *(_OWORD *)(a2 + 184) = xmmword_210BCE1A0;
      *(_QWORD *)(a2 + 200) = 0x3F0000003F000000;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      result = vdup_n_s32(0x7F800000u);
      *(_DWORD *)(a2 + 260) = 2;
      *(int32x2_t *)(a2 + 264) = result;
      *(_DWORD *)(a2 + 296) = -1;
      *(_DWORD *)a2 = 11;
      break;
    case 71:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_DWORD *)(a2 + 20) = 360000;
      *(_QWORD *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_OWORD *)(a2 + 36) = xmmword_210BCE170;
      *(_QWORD *)(a2 + 8) = 0x4024000000000000;
      v14 = vdupq_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a2 + 88) = 12;
      *(int32x4_t *)(a2 + 104) = v14;
      *(_OWORD *)(a2 + 56) = xmmword_210BCE180;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_QWORD *)(a2 + 120) = v14.i64[0];
      *(_QWORD *)(a2 + 128) = 0x100000002;
      *(_QWORD *)(a2 + 140) = 0x500000003;
      *(_OWORD *)(a2 + 152) = xmmword_210BCE190;
      *(int32x4_t *)(a2 + 168) = vdupq_n_s32(0x3DCCCCCDu);
      *(_DWORD *)(a2 + 232) = 1043422380;
      *(_OWORD *)(a2 + 184) = xmmword_210BCE1A0;
      *(_QWORD *)(a2 + 200) = 0x3F0000003F000000;
      *(_DWORD *)(a2 + 52) = 2;
      *(_DWORD *)(a2 + 148) = 2;
      *(_QWORD *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      result = vdup_n_s32(0x7F800000u);
      *(int32x2_t *)(a2 + 264) = result;
      *(_DWORD *)(a2 + 296) = -1;
      *(_DWORD *)a2 = 11;
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 84) = 1;
      break;
    default:
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 378, (uint64_t)"slam_tracker_vo_par_ver", "Unknown version %d", a1);
      abort();
  }
  return result;
}

void slam_tracker_vo_free(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  signed int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  signed int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v1 = a1;
  if (*(int *)(a1 + 588) >= 1)
  {
    for (i = 0; i < *(int *)(v1 + 588); ++i)
    {
      v3 = *(_QWORD *)(v1 + 304);
      v4 = v3 + 880 * i;
      free(*(void **)(v4 + 368));
      free(*(void **)(v4 + 376));
      free(*(void **)(v4 + 384));
      free(*(void **)(v4 + 392));
      free(*(void **)(v4 + 400));
      v5 = *(_QWORD *)(v4 + 408);
      if (v5)
      {
        v6 = (_QWORD *)(v4 + 408);
        v7 = *(_QWORD *)(v5 - 8 * *(_QWORD *)(v4 + 424) - 8);
        v8 = (unsigned int *)(v7 + 24);
        do
        {
          v9 = __ldaxr(v8);
          v10 = v9 - 1;
        }
        while (__stlxr(v10, v8));
        if (v10 < 0)
          goto LABEL_47;
        if (v10)
        {
          do
            v11 = __ldaxr(&qword_254A77330);
          while (__stlxr(v11 - 1, &qword_254A77330));
          v1 = a1;
          do
            v12 = __ldaxr((unint64_t *)&unk_254A77338);
          while (__stlxr(v12, (unint64_t *)&unk_254A77338));
          do
            v13 = __ldaxr(&global_stats);
          while (__stlxr(v13, &global_stats));
          do
            v14 = __ldaxr(&pmem_total_refs);
          while (__stlxr(v14 - 1, &pmem_total_refs));
          do
            v15 = __ldaxr(&_pmem_total_blocks);
          while (__stlxr(v15, &_pmem_total_blocks));
          do
            v16 = __ldaxr(&pmem_bytes_allocated);
          while (__stlxr(v16, &pmem_bytes_allocated));
        }
        else
        {
          v17 = -*(_QWORD *)(v7 + 8);
          do
            v18 = __ldaxr(&qword_254A77330);
          while (__stlxr(v18 - 1, &qword_254A77330));
          do
            v19 = __ldaxr((unint64_t *)&unk_254A77338);
          while (__stlxr(v19 - 1, (unint64_t *)&unk_254A77338));
          do
            v20 = __ldaxr(&global_stats);
          while (__stlxr(v20 + v17, &global_stats));
          do
            v21 = __ldaxr(&pmem_total_refs);
          while (__stlxr(v21 - 1, &pmem_total_refs));
          do
            v22 = __ldaxr(&_pmem_total_blocks);
          while (__stlxr(v22 - 1, &_pmem_total_blocks));
          do
            v23 = __ldaxr(&pmem_bytes_allocated);
          while (__stlxr(v23 + v17, &pmem_bytes_allocated));
          (*(void (**)(uint64_t))(v7 + 40))(v7);
          free((void *)v7);
          v6 = (_QWORD *)(v4 + 408);
          v1 = a1;
        }
        *v6 = 0;
      }
      free(*(void **)(v3 + 880 * i + 768));
      bzero((void *)v4, 0x370uLL);
    }
  }
  free(*(void **)(v1 + 304));
  slam_tracker_vo_map_free(v1 + 312);
  slam_tracker_vo_smap_free(v1 + 440);
  free(*(void **)(v1 + 816));
  free(*(void **)(v1 + 840));
  free(*(void **)(v1 + 864));
  free(*(void **)(v1 + 936));
  free(*(void **)(v1 + 888));
  free(*(void **)(v1 + 912));
  v24 = *(_QWORD *)(v1 + 960);
  if (v24)
  {
    v25 = *(_QWORD *)(v24 - 32 * *(_QWORD *)(v1 + 976) - 8);
    v26 = (unsigned int *)(v25 + 24);
    do
    {
      v27 = __ldaxr(v26);
      v28 = v27 - 1;
    }
    while (__stlxr(v28, v26));
    if (v28 < 0)
LABEL_47:
      __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
    if (v28)
    {
      do
        v29 = __ldaxr(&qword_254A77330);
      while (__stlxr(v29 - 1, &qword_254A77330));
      do
        v30 = __ldaxr((unint64_t *)&unk_254A77338);
      while (__stlxr(v30, (unint64_t *)&unk_254A77338));
      do
        v31 = __ldaxr(&global_stats);
      while (__stlxr(v31, &global_stats));
      do
        v32 = __ldaxr(&pmem_total_refs);
      while (__stlxr(v32 - 1, &pmem_total_refs));
      do
        v33 = __ldaxr(&_pmem_total_blocks);
      while (__stlxr(v33, &_pmem_total_blocks));
      do
        v34 = __ldaxr(&pmem_bytes_allocated);
      while (__stlxr(v34, &pmem_bytes_allocated));
    }
    else
    {
      v35 = -*(_QWORD *)(v25 + 8);
      do
        v36 = __ldaxr(&qword_254A77330);
      while (__stlxr(v36 - 1, &qword_254A77330));
      do
        v37 = __ldaxr((unint64_t *)&unk_254A77338);
      while (__stlxr(v37 - 1, (unint64_t *)&unk_254A77338));
      do
        v38 = __ldaxr(&global_stats);
      while (__stlxr(v38 + v35, &global_stats));
      do
        v39 = __ldaxr(&pmem_total_refs);
      while (__stlxr(v39 - 1, &pmem_total_refs));
      do
        v40 = __ldaxr(&_pmem_total_blocks);
      while (__stlxr(v40 - 1, &_pmem_total_blocks));
      do
        v41 = __ldaxr(&pmem_bytes_allocated);
      while (__stlxr(v41 + v35, &pmem_bytes_allocated));
      (*(void (**)(uint64_t))(v25 + 40))(v25);
      free((void *)v25);
    }
  }
  free((void *)v1);
}

void slam_tracker_vo_map_free(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (*(uint64_t *)a1 >= 1)
  {
    v2 = 0;
    v3 = 8;
    do
    {
      free(*(void **)(*(_QWORD *)(a1 + 8) + v3));
      ++v2;
      v3 += 24;
    }
    while (*(_QWORD *)a1 > v2);
  }
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  free(*(void **)(a1 + 32));
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  free(*(void **)(a1 + 64));
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  free(*(void **)(a1 + 88));
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  free(*(void **)(a1 + 112));
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
}

void slam_tracker_vo_smap_free(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  free(*(void **)(a1 + 32));
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  free(*(void **)(a1 + 56));
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  free(*(void **)(a1 + 80));
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  free(*(void **)(a1 + 104));
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  free(*(void **)(a1 + 128));
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
}

uint64_t slam_tracker_vo_add(uint64_t a1, double *a2, int a3, uint64_t a4, int a5, int a6, int *a7, uint64_t a8, double a9, uint64_t a10, int a11, int a12, const void *a13, int a14, __int128 *a15)
{
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int v37;
  unsigned int v38;
  int v39;
  unsigned __int8 *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int *v45;
  unsigned int v46;
  signed int v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  float64x2_t *v67;
  float64x2_t *v68;
  double v69;
  double v70;
  float v71;
  double v72;
  double v73;
  float64x2_t v74;
  float64x2_t v75;
  double v77;
  double v78;
  double *v79;
  float v80;
  double v81;
  float v82;
  float32x2_t v83;
  float32x2_t v84;
  float v85;
  float v86;
  float64x2_t v87;
  float64x2_t v88;
  float v89;
  float v90;
  double v91;
  double v92;
  float32x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  double v104;
  float64x2_t v105;
  double v106;
  double v107;
  uint64_t v108;
  int v109;
  timeval *v110;
  timeval v111;
  timeval v112;
  timeval v113;
  timeval v114;
  timeval v115;
  timeval v116;
  timeval v117;
  double v118;
  double v119;
  double v120;
  double v121;
  int v122;
  long double v123;
  long double v124;
  float64x2_t v125;
  __double2 v126;
  __double2 v127;
  __double2 v128;
  int v129;
  _QWORD *v130;
  timeval v131;
  timeval v132;
  timeval v133;
  timeval v134;
  uint64_t v135;
  timeval v136;
  timeval v137;
  timeval v138;
  timeval v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  int v144;
  int v145;
  uint64_t v146;
  const void *v147;
  size_t v148;
  void *v149;
  _DWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  float32x2_t **v154;
  int v155;
  uint64_t v156;
  _DWORD *v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unsigned int *v165;
  unsigned int v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;
  double *v171;
  int v172;
  uint64_t v173;
  double v174;
  double v175;
  double v176;
  double v177;
  long double v178;
  long double v179;
  uint64_t v180;
  double v181;
  double v182;
  __double2 v183;
  __double2 v184;
  __double2 v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  int *v189;
  uint64_t v190;
  uint64_t v191;
  int v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  float32x2_t *v200;
  uint64_t v201;
  int v202;
  int v203;
  _DWORD *v204;
  int v205;
  float32x2_t v206;
  int v207;
  uint64_t v208;
  uint64_t v209;
  int v210;
  unint64_t v211;
  float v212;
  int *v213;
  uint64_t v214;
  _QWORD *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  float v220;
  uint64_t v221;
  float *v222;
  int v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  int32x4_t v230;
  uint8x8_t *v231;
  int32x4_t v232;
  uint8x8_t *v233;
  uint64_t v234;
  int32x4_t v235;
  int32x4_t v236;
  int32x4_t v237;
  int32x4_t v238;
  int32x4_t v239;
  int32x4_t v240;
  uint8x16_t v241;
  uint8x16_t v242;
  int16x8_t v243;
  int16x8_t v244;
  int16x8_t v245;
  int16x8_t v246;
  int32x4_t v247;
  int32x4_t v248;
  uint8x8_t *v249;
  uint8x8_t *v250;
  uint64_t v251;
  uint8x8_t v252;
  uint8x8_t v253;
  uint8x8_t v254;
  int16x8_t v255;
  uint64_t v256;
  unsigned __int8 *v257;
  uint64_t v258;
  int v259;
  float v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  float v264;
  float *v265;
  int v266;
  unint64_t v267;
  int v268;
  uint8x16_t v269;
  uint64_t v270;
  uint64_t v271;
  float v272;
  int v273;
  float *v275;
  void *v276;
  float v277;
  uint64_t v278;
  float *v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  float v285;
  __double2 v286;
  __double2 v287;
  __double2 v288;
  double v289;
  float v290;
  _OWORD *v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  uint64_t v296;
  _OWORD *v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  uint64_t v302;
  int v303;
  int v304;
  int v305;
  uint64_t v306;
  float *v307;
  float v308;
  uint64_t v310;
  float v311;
  float v312;
  uint64_t v313;
  uint64_t v314;
  unint64_t v315;
  unint64_t v316;
  _QWORD *v317;
  uint64_t v318;
  _QWORD *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  float v324;
  int v325;
  __int32 v326;
  float32x2_t v327;
  __int32 v328;
  unint64_t v329;
  float v330;
  float v331;
  float v332;
  double v333;
  double v334;
  long double v335;
  long double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  long double v343;
  long double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  int v349;
  __int16 v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  __int32 v354;
  uint64_t v355;
  int *v356;
  uint64_t *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  int v362;
  float *v363;
  float v364;
  float v365;
  float32x2_t v366;
  float32x2_t v367;
  int8x8_t v368;
  float32x2_t v369;
  uint64_t v370;
  float v371;
  float v372;
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  int v378;
  int v379;
  const float *v380;
  float32x2_t v381;
  float32x2_t v382;
  double v383;
  double v384;
  double v385;
  double v386;
  double v387;
  double v388;
  double v389;
  double v390;
  double v391;
  double v392;
  double v393;
  double v394;
  double v395;
  double v396;
  double v397;
  double v398;
  double v399;
  __darwin_time_t v400;
  double v401;
  double v402;
  double v403;
  double v404;
  double v405;
  double v406;
  double v407;
  double v408;
  BOOL v409;
  double v410;
  double v411;
  double v412;
  double v413;
  double v414;
  double v415;
  double v416;
  double v417;
  double v418;
  double v419;
  double v420;
  double v421;
  double v422;
  float v423;
  double v424;
  double v425;
  double v426;
  float v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  double v433;
  double v434;
  double v435;
  double v436;
  float v437;
  double v438;
  double v439;
  double v440;
  int v441;
  uint64_t v442;
  float v443;
  float32x2_t v444;
  float32x2_t v445;
  int8x8_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  int *v450;
  uint64_t v451;
  int v452;
  int v453;
  int v454;
  BOOL v455;
  uint64_t v456;
  uint64_t v457;
  int v458;
  uint64_t v459;
  int32x4_t v460;
  uint8x8_t *v461;
  int32x4_t v462;
  uint64_t v463;
  uint8x8_t *v464;
  int32x4_t v465;
  int32x4_t v466;
  int32x4_t v467;
  int32x4_t v468;
  int32x4_t v469;
  int32x4_t v470;
  uint8x16_t v471;
  uint8x16_t v472;
  int16x8_t v473;
  int16x8_t v474;
  int16x8_t v475;
  int16x8_t v476;
  int32x4_t v477;
  int32x4_t v478;
  uint8x8_t *v479;
  uint8x8_t *v480;
  uint64_t v481;
  uint8x8_t v482;
  uint8x8_t v483;
  uint8x8_t v484;
  int16x8_t v485;
  uint64_t v486;
  unsigned __int8 *v487;
  uint64_t v488;
  int v489;
  uint64_t v490;
  uint64_t v491;
  unint64_t v492;
  int v493;
  uint8x16_t v494;
  BOOL v495;
  int v496;
  int v497;
  BOOL v498;
  int v499;
  int v500;
  BOOL v501;
  int v503;
  int v504;
  uint64_t v505;
  _QWORD *v506;
  int v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  const void *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t *v523;
  uint64_t v524;
  uint64_t v525;
  _DWORD *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  void *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  int v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  int *v548;
  uint64_t v549;
  float v550;
  float *v551;
  float v552;
  double v553;
  double v554;
  double v555;
  float v556;
  float v557;
  float v558;
  int v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  float v564;
  uint64_t v566;
  uint64_t v567;
  float *v568;
  _QWORD *v569;
  uint64_t v570;
  float v571;
  unint64_t v572;
  uint64_t v573;
  double *v574;
  double v575;
  double v576;
  double v577;
  float v578;
  float *v579;
  float v580;
  float v581;
  int v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  int v587;
  int v588;
  float32x2_t v589;
  uint64_t *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  __int128 *v598;
  uint64_t v599;
  unsigned int v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  __int128 v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  __int32 v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  _QWORD *v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  int v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  double *v641;
  int v642;
  int v643;
  uint64_t v644;
  int v645;
  int v646;
  unint64_t v647;
  unsigned int v648;
  uint64_t v649;
  unint64_t v650;
  uint64_t v651;
  uint64_t v652;
  int v653;
  uint64_t v654;
  float *v655;
  uint64_t v656;
  uint64_t v657;
  int v658;
  uint64_t v659;
  float32x2_t v660;
  float v661;
  double v662;
  float32x2_t v663;
  float v664;
  uint64_t v665;
  int v666;
  int v667;
  uint64_t v668;
  double v669;
  double v670;
  double v671;
  long double v672;
  long double v673;
  uint64_t v674;
  uint64_t v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  float32x2_t *v681;
  int v682;
  int v683;
  double v684;
  double v685;
  double *v686;
  double v687;
  long double v688;
  long double v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  float v694;
  float v695;
  uint64_t v696;
  uint64_t v699;
  uint64_t v700;
  int *v701;
  int *v702;
  double v703;
  uint64_t *v704;
  float32x2_t v705;
  float32x2_t v706;
  uint64_t *v707;
  float32x2_t v708;
  timeval *v709;
  uint64_t v710;
  uint64_t v711;
  timeval *v712;
  uint64_t v713;
  float32x2_t v714;
  int v715;
  int v716;
  uint64_t v717;
  unsigned int v718;
  float v719;
  uint64_t v720;
  float v721;
  uint64_t v722;
  float v723;
  unsigned int v724;
  float v725;
  float v726;
  float v727;
  int v728;
  int v729;
  int v730;
  uint64_t v731;
  float v732;
  int v733;
  uint64_t v734;
  float v735;
  uint64_t v736;
  int v737;
  int v738;
  double v739;
  double v740;
  double v741;
  long double v742;
  long double v743;
  uint64_t v744;
  uint64_t v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  int v751;
  float v752;
  int v753;
  BOOL v754;
  int64_t v756;
  uint64_t v757;
  int64_t v758;
  uint64_t v759;
  float *v760;
  int64_t v761;
  uint64_t v762;
  uint64_t *v763;
  float v764;
  uint64_t v765;
  int v766;
  unsigned int *v767;
  uint64_t v768;
  double v769;
  uint64_t v770;
  double v771;
  double v772;
  float v773;
  unsigned int *v774;
  uint64_t v775;
  unsigned int v776;
  unsigned int v777;
  unsigned int v778;
  unint64_t v779;
  double *v780;
  double v781;
  double v782;
  double v783;
  float v784;
  double v785;
  double v786;
  double v787;
  double v788;
  float *v789;
  float v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  uint64_t *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  uint64_t v799;
  int v800;
  int v801;
  unsigned __int8 *v802;
  unsigned __int8 *v803;
  uint64_t v804;
  uint64_t v805;
  int v806;
  BOOL v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  int v813;
  float v814;
  uint64_t v815;
  uint64_t v816;
  uint64_t v817;
  int32x4_t v818;
  uint64_t v819;
  const double *v820;
  int32x4_t v821;
  const double *v822;
  const double *v823;
  unsigned __int128 v824;
  unsigned __int128 v825;
  unsigned __int128 v826;
  const double *v827;
  unsigned __int128 v828;
  uint64_t v829;
  int *v830;
  int v831;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  double v835;
  uint64_t v836;
  uint64_t v837;
  int v838;
  int v839;
  float v840;
  uint64_t v841;
  int v842;
  uint64_t v843;
  int32x4_t *v844;
  uint64_t v845;
  int v846;
  int32x4_t *v847;
  int32x4_t v848;
  int32x4_t v849;
  uint64_t v850;
  int32x4_t v851;
  uint64_t v852;
  __int32 *v853;
  int v854;
  uint64_t v856;
  uint64_t v857;
  float v858;
  int v859;
  float *v861;
  void *v862;
  uint64_t v863;
  int v864;
  int v865;
  uint64_t v866;
  uint64_t v867;
  uint64_t *v868;
  uint64_t v869;
  uint64_t v870;
  const void *v871;
  uint64_t v872;
  uint64_t v873;
  uint64_t *v874;
  int *v875;
  uint64_t *v876;
  uint64_t *v877;
  uint64_t *v878;
  uint64_t *v879;
  int v880;
  int *v881;
  uint64_t v882;
  uint64_t v883;
  _QWORD *v884;
  int v885;
  int v886;
  uint64_t v887;
  int v888;
  int v889;
  int v890;
  uint64_t v891;
  uint64_t v892;
  uint64_t v893;
  _QWORD *v894;
  _QWORD *v895;
  _QWORD *v896;
  float v897;
  _DWORD *v898;
  int v899;
  int v900;
  uint64_t v901;
  uint64_t *v902;
  uint64_t *v903;
  float v904;
  _OWORD *v905;
  _OWORD *v906;
  float *v907;
  _OWORD *v908;
  double *v909;
  float *v910;
  int *v911;
  int *v912;
  int v913;
  _DWORD *v914;
  double *v915;
  uint64_t *v916;
  _QWORD *ids;
  int v918[2];
  uint64_t *v919;
  int *v920;
  int v921;
  float *v922;
  uint64_t v923;
  int v924;
  float *v925;
  float64x2_t v926;
  long double v927;
  int v928;
  float *v929;
  uint64_t v930;
  double v931;
  float64x2_t v932;
  float32x2_t v933;
  int v935;
  int v936;
  double *v937;
  double *v938;
  _QWORD *v939;
  uint64_t v940;
  long double v941;
  float64x2_t v942;
  uint64_t v943;
  float32x2_t v944;
  _QWORD *v945;
  int v946;
  uint64_t *v947;
  int8x8_t v948;
  uint64_t v949;
  float64x2_t v950;
  int v951;
  uint64_t *v952;
  int v953;
  float *v954;
  int v955;
  double v957;
  void *v958[2];
  int v959;
  void *v960;
  float *v961;
  double v962;
  float v963[2];
  float v964[2];
  float v965[2];
  double v966;
  __int128 v967;
  _OWORD v968[10];
  timeval *v969;
  void *v970;
  uint64_t v971;
  double v972;
  float v973;
  float v974;
  float64x2_t v975;
  float64x2_t v976;
  long double v977;
  double v978;
  timeval v979;
  __int128 v980;
  _BYTE v981[72];
  __int128 v982;
  __int128 v983;
  __int128 v984;
  __int128 v985;
  int v986;
  int v987;
  double v988;
  timeval v989;
  _OWORD v990[10];
  uint64_t v991;

  v991 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v979.tv_usec = 0;
  v979.tv_sec = 0;
  if (gettimeofday(&v979, 0) || (double)(v979.tv_usec + 1000000 * v979.tv_sec) / 1000000.0 <= 1514764800.0)
    goto LABEL_724;
  v946 = a6;
  v951 = a5;
  v962 = 0.0;
  v22 = a1;
  ++*(_DWORD *)(a1 + 584);
  v23 = *(unsigned int *)(a1 + 588);
  v24 = *(_DWORD *)(a1 + 140);
  if (v24 >= (int)v23)
    v24 = *(_DWORD *)(a1 + 588);
  if ((int)v23 >= 1)
  {
    v25 = *(_QWORD *)(a1 + 304);
    if ((_DWORD)v23 == 1)
    {
      v26 = 0;
LABEL_11:
      v29 = v23 - v26;
      v30 = (_DWORD *)(v25 + 880 * v26 + 668);
      do
      {
        *v30 = 1;
        v30 += 220;
        --v29;
      }
      while (v29);
      goto LABEL_13;
    }
    v26 = v23 & 0xFFFFFFFE;
    v27 = v26;
    v28 = *(_QWORD *)(a1 + 304);
    do
    {
      *(_DWORD *)(v28 + 668) = 1;
      *(_DWORD *)(v28 + 1548) = 1;
      v28 += 1760;
      v27 -= 2;
    }
    while (v27);
    if (v26 != v23)
      goto LABEL_11;
  }
LABEL_13:
  v31 = v24 - 1;
  if (v24 <= 1)
    goto LABEL_21;
  v32 = *(_QWORD *)(a1 + 304);
  v33 = *(_DWORD *)(a1 + 592) + v23;
  if (v24 == 2)
  {
    v34 = 0;
LABEL_19:
    v37 = v33 - v34;
    v38 = ~v34 + v24;
    do
    {
      *(_DWORD *)(v32 + 880 * (v37 % (int)v23) + 668) = 0;
      --v37;
      --v38;
    }
    while (v38);
    goto LABEL_21;
  }
  v34 = v31 & 0xFFFFFFFE;
  v35 = v31 & 0xFFFFFFFE;
  v36 = *(_DWORD *)(a1 + 592) + v23;
  do
  {
    *(_DWORD *)(v32 + 880 * (v36 % (int)v23) + 668) = 0;
    *(_DWORD *)(v32 + 880 * ((v36 - 1) % (int)v23) + 668) = 0;
    v36 -= 2;
    v35 -= 2;
  }
  while (v35);
  v22 = a1;
  if (v31 != v34)
    goto LABEL_19;
LABEL_21:
  if ((_DWORD)v23 == *(_DWORD *)v22)
  {
    v39 = (*(_DWORD *)(v22 + 592) + 1) % (int)v23;
    v40 = (unsigned __int8 *)malloc_type_calloc(*(_QWORD *)(v22 + 368), 1uLL, 0x49B87F16uLL);
    slam_vo_map_marginalize_cam(v22, v39, (uint64_t)v40);
    remove_map_points(v22, v40);
    free(v40);
    v41 = *(_QWORD *)(v22 + 304);
    v42 = v41 + 880 * v39;
    free(*(void **)(v42 + 368));
    free(*(void **)(v42 + 376));
    free(*(void **)(v42 + 384));
    free(*(void **)(v42 + 392));
    free(*(void **)(v42 + 400));
    v43 = *(_QWORD *)(v42 + 408);
    if (v43)
    {
      v44 = *(_QWORD *)(v43 - 8 * *(_QWORD *)(v42 + 424) - 8);
      v45 = (unsigned int *)(v44 + 24);
      do
      {
        v46 = __ldaxr(v45);
        v47 = v46 - 1;
      }
      while (__stlxr(v47, v45));
      if (v47 < 0)
        __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
      if (v47)
      {
        do
          v48 = __ldaxr(&qword_254A77330);
        while (__stlxr(v48 - 1, &qword_254A77330));
        do
          v49 = __ldaxr((unint64_t *)&unk_254A77338);
        while (__stlxr(v49, (unint64_t *)&unk_254A77338));
        do
          v50 = __ldaxr(&global_stats);
        while (__stlxr(v50, &global_stats));
        do
          v51 = __ldaxr(&pmem_total_refs);
        while (__stlxr(v51 - 1, &pmem_total_refs));
        do
          v52 = __ldaxr(&_pmem_total_blocks);
        while (__stlxr(v52, &_pmem_total_blocks));
        do
          v53 = __ldaxr(&pmem_bytes_allocated);
        while (__stlxr(v53, &pmem_bytes_allocated));
      }
      else
      {
        v59 = -*(_QWORD *)(v44 + 8);
        do
          v60 = __ldaxr(&qword_254A77330);
        while (__stlxr(v60 - 1, &qword_254A77330));
        do
          v61 = __ldaxr((unint64_t *)&unk_254A77338);
        while (__stlxr(v61 - 1, (unint64_t *)&unk_254A77338));
        do
          v62 = __ldaxr(&global_stats);
        while (__stlxr(v62 + v59, &global_stats));
        do
          v63 = __ldaxr(&pmem_total_refs);
        while (__stlxr(v63 - 1, &pmem_total_refs));
        do
          v64 = __ldaxr(&_pmem_total_blocks);
        while (__stlxr(v64 - 1, &_pmem_total_blocks));
        do
          v65 = __ldaxr(&pmem_bytes_allocated);
        while (__stlxr(v65 + v59, &pmem_bytes_allocated));
        (*(void (**)(uint64_t))(v44 + 40))(v44);
        free((void *)v44);
      }
      *(_QWORD *)(v42 + 408) = 0;
    }
    free(*(void **)(v41 + 880 * v39 + 768));
    bzero((void *)(v41 + 880 * v39), 0x370uLL);
    v22 = a1;
    v54 = *(_DWORD *)(a1 + 588);
    v55 = v54 - 1;
    v56 = v54 - 1 + v39;
    v57 = v56 / v54;
    if (*(int *)(a1 + 16) <= 0)
    {
LABEL_47:
      *(_DWORD *)(v22 + 16) = a7[1];
      v58 = v56 - v57 * v54;
      v937 = a2;
      if (!a2)
        goto LABEL_49;
      goto LABEL_48;
    }
  }
  else
  {
    v54 = v23 + 1;
    *(_DWORD *)(v22 + 588) = v23 + 1;
    v39 = v23;
    v55 = v23;
    v56 = 2 * v23;
    v57 = 2 * (int)v23 / ((int)v23 + 1);
    if (*(int *)(v22 + 16) <= 0)
      goto LABEL_47;
  }
  v58 = v56 - v57 * v54;
  v937 = a2;
  if (!a2)
  {
LABEL_49:
    if (v54 < 3)
    {
      v962 = 1.0;
      _Q17 = 0uLL;
      v77 = 1.0;
      v78 = 0.0;
      v942 = 0u;
      v959 = a3;
      if (!a2)
        goto LABEL_87;
      goto LABEL_84;
    }
    v66 = *(_QWORD *)(v22 + 304);
    v67 = (float64x2_t *)(v66 + 880 * v58);
    v68 = (float64x2_t *)(v66 + 880 * ((v58 + v55) % v54));
    v69 = v67[31].f64[1];
    v931 = a9 - v69;
    v70 = (a9 - v69) / (v69 - v68[31].f64[1]);
    if (*(_DWORD *)(v22 + 96))
    {
      memset(v981, 0, 64);
      v979 = (timeval)0;
      v980 = 0u;
      g_coords_diff(v67->f64, v68->f64, (uint64_t)&v979);
      v71 = v70;
      if (v71 != 1.0)
      {
        v957 = v71;
        *(float64x2_t *)&v981[40] = vmulq_n_f64(*(float64x2_t *)&v981[40], v71);
        *(double *)&v981[56] = *(double *)&v981[56] * v71;
        g_log_so3((double *)&v989.tv_sec, (double *)&v979.tv_sec);
        v989 = (timeval)vmulq_n_f64((float64x2_t)v989, v957);
        *(double *)v990 = *(double *)v990 * v957;
        g_exp_so3((double *)&v979.tv_sec, (double *)&v989.tv_sec);
      }
      v72 = *(double *)&v981[40];
      *(_OWORD *)v958 = *(_OWORD *)&v981[48];
      if (fabs(*(double *)&v981[16]) >= 1.0)
      {
        if (*(double *)&v981[16] <= -1.0)
        {
          v73 = atan2(*(long double *)&v979.tv_usec, *(long double *)&v980) + 0.0;
          v75 = (float64x2_t)xmmword_210BCE260;
        }
        else
        {
          v73 = atan2(-*(double *)&v979.tv_usec, -*(double *)&v980);
          v75 = (float64x2_t)xmmword_210BCE270;
        }
        v74 = *(float64x2_t *)v958;
      }
      else
      {
        v941 = asin(-*(double *)&v981[16]);
        v927 = atan2(*((long double *)&v980 + 1), *(long double *)&v979.tv_sec);
        v73 = atan2(*(long double *)&v981[24], *(long double *)&v981[32]);
        v75.f64[0] = v927;
        v74 = *(float64x2_t *)v958;
        v75.f64[1] = v941;
      }
    }
    else
    {
      v80 = v70;
      v81 = v80;
      v72 = (v67[4].f64[1] - v68[4].f64[1]) * v81;
      v74 = vmulq_n_f64(vsubq_f64(v67[5], v68[5]), v81);
      v75 = 0uLL;
      v73 = 0.0;
    }
    v22 = a1;
    v77 = v72 * *(float *)(a1 + 104);
    v962 = v77;
    _Q17 = vmulq_f64(v74, vcvtq_f64_f32(*(float32x2_t *)(a1 + 108)));
    v942 = vmulq_f64(v75, vcvtq_f64_f32(*(float32x2_t *)(a1 + 116)));
    v78 = v73 * *(float *)(a1 + 124);
    v82 = *(float *)(a1 + 60);
    if (fabsf(v82) != INFINITY)
    {
      v83.i32[0] = *(_DWORD *)(a1 + 64);
      if (fabsf(v83.f32[0]) != INFINITY && fabsf(*(float *)(a1 + 68)) != INFINITY)
      {
        v84.i32[0] = *(_DWORD *)(a1 + 72);
        if (fabsf(v84.f32[0]) == INFINITY)
          goto LABEL_83;
        if (fabsf(*(float *)(a1 + 76)) != INFINITY)
        {
          v85 = *(float *)(a1 + 80);
          if (fabsf(v85) != INFINITY && *(int *)(a1 + 588) >= 2)
          {
            v83.i32[1] = *(_DWORD *)(a1 + 68);
            v86 = v931 * v82;
            v87 = vcvtq_f64_f32(v83);
            v84.i32[1] = *(_DWORD *)(a1 + 76);
            v88 = vcvtq_f64_f32(v84);
            v89 = v931 * v85;
            v90 = -v89;
            if (v77 <= (float)-v86)
              v77 = (float)-v86;
            v91 = v90;
            if (v78 > v90)
              v91 = v78;
            v92 = v86;
            if (v77 >= v92)
              v77 = v92;
            v962 = v77;
            v93 = vcvt_f32_f64(vmulq_n_f64(v87, v931));
            v94 = vcvtq_f64_f32(vneg_f32(v93));
            v95 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q17, v94), (int8x16_t)_Q17, (int8x16_t)v94);
            v96 = vcvtq_f64_f32(v93);
            _Q17 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v96, v95), (int8x16_t)v95, (int8x16_t)v96);
            *(float32x2_t *)&v96.f64[0] = vcvt_f32_f64(vmulq_n_f64(v88, v931));
            v97 = vcvtq_f64_f32(vneg_f32(*(float32x2_t *)&v96.f64[0]));
            v98 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v942, v97), (int8x16_t)v942, (int8x16_t)v97);
            v99 = vcvtq_f64_f32(*(float32x2_t *)&v96.f64[0]);
            v942 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v99, v98), (int8x16_t)v98, (int8x16_t)v99);
            if (v91 >= v89)
              v78 = v89;
            else
              v78 = v91;
            v959 = 1;
            if (!a2)
              goto LABEL_87;
LABEL_84:
            if (*(_DWORD *)(v22 + 100))
            {
              _D2 = _Q17.f64[1];
              __asm { FMLA            D0, D2, V17.D[1] }
              v104 = sqrt(_D0);
              if (v104 <= 0.0)
              {
                v105 = 0uLL;
                v106 = 0.0;
              }
              else
              {
                v105 = vdivq_f64(_Q17, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v104, 0));
                v106 = v77 / v104;
              }
              v924 = 0;
              v107 = sqrt(a2[1] * a2[1] + *a2 * *a2 + a2[2] * a2[2]);
              v962 = v106 * v107;
              v932 = vmulq_n_f64(v105, v107);
              goto LABEL_90;
            }
LABEL_87:
            v932 = _Q17;
            v924 = 0;
LABEL_90:
            v79 = &v962;
            v928 = 1;
            goto LABEL_91;
          }
LABEL_83:
          v959 = 1;
          if (!a2)
            goto LABEL_87;
          goto LABEL_84;
        }
      }
    }
    v959 = 1;
    if (!a2)
      goto LABEL_87;
    goto LABEL_84;
  }
LABEL_48:
  if (*(_DWORD *)(v22 + 92))
    goto LABEL_49;
  v959 = a3;
  v928 = 0;
  v932 = 0u;
  v924 = 1;
  v78 = 0.0;
  v79 = a2;
  v942 = 0u;
LABEL_91:
  v921 = *(_DWORD *)(v22 + 16);
  v108 = *(_QWORD *)(v22 + 304);
  v109 = v39;
  v110 = (timeval *)(v108 + 880 * v39);
  bzero(v110, 0x370uLL);
  v111 = *(timeval *)(a4 + 16);
  v110[12] = *(timeval *)a4;
  v110[13] = v111;
  v112 = *(timeval *)(a4 + 32);
  v113 = *(timeval *)(a4 + 48);
  v114 = *(timeval *)(a4 + 80);
  v110[16] = *(timeval *)(a4 + 64);
  v110[17] = v114;
  v110[14] = v112;
  v110[15] = v113;
  v115 = *(timeval *)(a4 + 96);
  v116 = *(timeval *)(a4 + 112);
  v117 = *(timeval *)(a4 + 128);
  v110[21].tv_sec = *(_QWORD *)(a4 + 144);
  v110[19] = v116;
  v110[20] = v117;
  v110[18] = v115;
  if (*a7 && (v951 < 1 || v946 <= 0))
  {
    log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 539, (uint64_t)"init_cam", "Image dimensions must be given");
    __assert_rtn("init_cam", "slam_tracker_vo.c", 539, "0");
  }
  memset(v990, 0, 56);
  v989 = (timeval)0;
  v979.tv_sec = 0;
  LODWORD(v979.tv_sec) = *(_DWORD *)a4;
  v118 = *(double *)(a4 + 8);
  if ((v979.tv_sec & 0xFFFFFFFC) == 0xC)
  {
    v119 = 1.0 / tan(v118 * 0.5);
    v120 = *(double *)(a4 + 16);
    v121 = v120 / v118;
    v122 = v946;
  }
  else
  {
    v123 = tan(v118 * 0.5);
    v122 = v946;
    v120 = *(double *)(a4 + 16);
    v119 = (double)v951 / (v123 + v123);
    v124 = tan(v120 * 0.5);
    v121 = (double)v946 / (v124 + v124);
  }
  *(double *)&v979.tv_usec = v119;
  *(double *)&v980 = v121;
  *((double *)&v980 + 1) = v118;
  *(double *)v981 = v120;
  v982 = *(_OWORD *)(a4 + 88);
  v983 = *(_OWORD *)(a4 + 104);
  v984 = *(_OWORD *)(a4 + 120);
  v985 = *(_OWORD *)(a4 + 136);
  *(_OWORD *)&v981[40] = *(_OWORD *)(a4 + 56);
  *(_OWORD *)&v981[56] = *(_OWORD *)(a4 + 72);
  *(_OWORD *)&v981[8] = *(_OWORD *)(a4 + 24);
  *(_OWORD *)&v981[24] = *(_OWORD *)(a4 + 40);
  v986 = v951;
  v987 = v122;
  v125 = v932;
  if (v120 == 0.0)
    *(_QWORD *)v981 = 0;
  if (v118 == 0.0)
    *((_QWORD *)&v980 + 1) = 0;
  v864 = v109;
  *((double *)&v990[3] + 1) = *v79;
  if (v924)
  {
    v125 = *(float64x2_t *)(v937 + 1);
    v942 = *(float64x2_t *)(v937 + 3);
    v78 = v937[5];
  }
  v990[4] = v125;
  v126 = __sincos_stret(v942.f64[0]);
  v127 = __sincos_stret(v942.f64[1]);
  v128 = __sincos_stret(v78);
  *(double *)&v989.tv_sec = v127.__cosval * v126.__cosval;
  *(double *)&v989.tv_usec = v127.__sinval * v126.__cosval * v128.__sinval - v126.__sinval * v128.__cosval;
  *(double *)v990 = v126.__sinval * v128.__sinval + v127.__sinval * v126.__cosval * v128.__cosval;
  *((double *)v990 + 1) = v127.__cosval * v126.__sinval;
  *(double *)&v990[1] = v126.__cosval * v128.__cosval + v127.__sinval * v126.__sinval * v128.__sinval;
  *((double *)&v990[1] + 1) = v127.__sinval * v126.__sinval * v128.__cosval - v126.__cosval * v128.__sinval;
  *(double *)&v990[2] = -v127.__sinval;
  *((double *)&v990[2] + 1) = v127.__cosval * v128.__sinval;
  *(double *)&v990[3] = v127.__cosval * v128.__cosval;
  if (v959)
  {
    v129 = v109;
    if (v109 == v58)
    {
      v130 = (_QWORD *)(v108 + 880 * v109);
      v130[22] = 0;
      v130[23] = 0;
      v130[12] = 0x3FF0000000000000;
      v130[13] = 0;
      v130[14] = 0;
      v130[15] = 0;
      v130[16] = 0x3FF0000000000000;
      v130[17] = 0;
      v130[18] = 0;
      v130[19] = 0;
      v130[20] = 0x3FF0000000000000;
      v130[21] = 0;
      v131 = (timeval)*((_OWORD *)v130 + 7);
      *v110 = *((timeval *)v130 + 6);
      v110[1] = v131;
      v132 = (timeval)*((_OWORD *)v130 + 8);
      v133 = (timeval)*((_OWORD *)v130 + 9);
      v134 = (timeval)*((_OWORD *)v130 + 11);
      v110[4] = *((timeval *)v130 + 10);
      v110[5] = v134;
      v110[2] = v132;
      v110[3] = v133;
    }
    else
    {
      g_coords_conv((double *)&v989.tv_sec, (double *)(v108 + 880 * v58 + 96), (double *)(v108 + 880 * v109 + 96));
      g_coords_conv((double *)&v989.tv_sec, (double *)(v108 + 880 * v58), (double *)&v110->tv_sec);
    }
    v144 = v921;
  }
  else
  {
    v135 = v108 + 880 * v109;
    v136 = (timeval)v990[0];
    *v110 = v989;
    v110[1] = v136;
    v137 = (timeval)v990[1];
    v138 = (timeval)v990[2];
    v139 = (timeval)v990[4];
    v110[4] = (timeval)v990[3];
    v110[5] = v139;
    v110[2] = v137;
    v110[3] = v138;
    v140 = v990[2];
    v141 = v990[4];
    v142 = v990[1];
    *(_OWORD *)(v135 + 160) = v990[3];
    *(_OWORD *)(v135 + 176) = v141;
    *(_OWORD *)(v135 + 128) = v142;
    *(_OWORD *)(v135 + 144) = v140;
    v143 = v990[0];
    v129 = v109;
    *(timeval *)(v135 + 96) = v989;
    *(_OWORD *)(v135 + 112) = v143;
    v144 = v921;
    if (v109 != v58)
    {
      g_coords_diff((double *)(v135 + 96), (double *)(v108 + 880 * v58 + 96), (uint64_t)&v989);
      g_coords_conv((double *)&v989.tv_sec, (double *)(v108 + 880 * v58), (double *)&v110->tv_sec);
    }
  }
  v145 = v129;
  v146 = v108 + 880 * v129;
  *(_DWORD *)(v146 + 520) = v928;
  *(_DWORD *)(v146 + 480) = v951;
  *(_DWORD *)(v146 + 484) = v946;
  *(_QWORD *)(v146 + 368) = malloc_type_malloc(8 * *a7, 0x100004000313F17uLL);
  *(_QWORD *)(v146 + 376) = malloc_type_malloc(8 * *a7, 0x100004000313F17uLL);
  *(_QWORD *)(v146 + 384) = malloc_type_malloc(*a7 * (uint64_t)v144, 0x86A3BDCuLL);
  memcpy(*(void **)(v146 + 368), *((const void **)a7 + 1), 8 * *a7);
  memcpy(*(void **)(v146 + 376), *((const void **)a7 + 1), 8 * *a7);
  memcpy(*(void **)(v146 + 384), *((const void **)a7 + 2), *a7 * (uint64_t)v144);
  v147 = (const void *)*((_QWORD *)a7 + 3);
  if (v147)
  {
    v148 = 4 * *a7;
    v149 = malloc_type_malloc(v148, 0xD0C59E7EuLL);
    memcpy(v149, v147, v148);
    *(_QWORD *)(v108 + 880 * v145 + 392) = v149;
  }
  v150 = malloc_type_malloc(4 * *a7, 0x100004052888210uLL);
  *(_QWORD *)(v108 + 880 * v145 + 400) = v150;
  LODWORD(v151) = *a7;
  if (*a7 < 1)
  {
    v153 = a8;
  }
  else
  {
    v152 = 0;
    v153 = a8;
    do
    {
      v150[v152++] = -1;
      v151 = *a7;
    }
    while (v152 < v151);
  }
  v154 = (float32x2_t **)(v146 + 368);
  v155 = v109;
  v156 = v108 + 880 * v109;
  *(_DWORD *)(v156 + 488) = v151;
  if (a15 && *(_QWORD *)a15)
  {
    v157 = (_DWORD *)(v156 + 488);
    v158 = *(_QWORD *)(*(_QWORD *)a15 - 8 * *((_QWORD *)a15 + 2) - 8);
    do
      v159 = __ldaxr(&qword_254A77330);
    while (__stlxr(v159 + 1, &qword_254A77330));
    do
      v160 = __ldaxr((unint64_t *)&unk_254A77338);
    while (__stlxr(v160, (unint64_t *)&unk_254A77338));
    do
      v161 = __ldaxr(&global_stats);
    while (__stlxr(v161, &global_stats));
    do
      v162 = __ldaxr(&pmem_total_refs);
    while (__stlxr(v162 + 1, &pmem_total_refs));
    do
      v163 = __ldaxr(&_pmem_total_blocks);
    while (__stlxr(v163, &_pmem_total_blocks));
    do
      v164 = __ldaxr(&pmem_bytes_allocated);
    while (__stlxr(v164, &pmem_bytes_allocated));
    v165 = (unsigned int *)(v158 + 24);
    do
      v166 = __ldaxr(v165);
    while (__stlxr(v166 + 1, v165));
    v167 = *a15;
    *(_QWORD *)(v108 + 880 * v109 + 424) = *((_QWORD *)a15 + 2);
    *(_OWORD *)(v108 + 880 * v109 + 408) = v167;
    v168 = *(__int128 *)((char *)a15 + 24);
    *(_QWORD *)(v108 + 880 * v109 + 448) = *((_QWORD *)a15 + 5);
    *(_OWORD *)(v108 + 880 * v109 + 432) = v168;
    v169 = a15[3];
    *(_QWORD *)(v108 + 880 * v109 + 472) = *((_QWORD *)a15 + 8);
    *(_OWORD *)(v108 + 880 * v109 + 456) = v169;
    LODWORD(v151) = *v157;
  }
  v170 = v108 + 880 * v109;
  rectify_pts((uint64_t)&v979, *v154, v151, (float *)(v170 + 344));
  *(double *)(v170 + 504) = a9;
  *(_DWORD *)(v170 + 492) = a14;
  *(float *)(v170 + 360) = (float)(*(float *)(v170 + 352) - *(float *)(v170 + 344)) / (float)v951;
  *(_QWORD *)(v170 + 744) = 0x7FF8000000000000;
  *(_DWORD *)(v170 + 524) = 2143289344;
  v171 = v937;
  v172 = v959;
  if (v153)
  {
    v173 = *(_QWORD *)(a1 + 304);
    v979.tv_sec = 0;
    LODWORD(v979.tv_sec) = *(_DWORD *)a10;
    v174 = *(double *)(a10 + 8);
    if ((v979.tv_sec & 0xFFFFFFFC) == 0xC)
    {
      v175 = 1.0 / tan(v174 * 0.5);
      v176 = *(double *)(a10 + 16);
      v177 = v176 / v174;
    }
    else
    {
      v178 = tan(v174 * 0.5);
      v176 = *(double *)(a10 + 16);
      v175 = (double)a11 / (v178 + v178);
      v179 = tan(v176 * 0.5);
      v177 = (double)a12 / (v179 + v179);
    }
    *(double *)&v979.tv_usec = v175;
    *(double *)&v980 = v177;
    *((double *)&v980 + 1) = v174;
    *(double *)v981 = v176;
    v982 = *(_OWORD *)(a10 + 88);
    v983 = *(_OWORD *)(a10 + 104);
    v984 = *(_OWORD *)(a10 + 120);
    v985 = *(_OWORD *)(a10 + 136);
    *(_OWORD *)&v981[40] = *(_OWORD *)(a10 + 56);
    *(_OWORD *)&v981[56] = *(_OWORD *)(a10 + 72);
    *(_OWORD *)&v981[8] = *(_OWORD *)(a10 + 24);
    *(_OWORD *)&v981[24] = *(_OWORD *)(a10 + 40);
    v986 = a11;
    v987 = a12;
    if (v176 == 0.0)
      *(_QWORD *)v981 = 0;
    v155 = v109;
    if (v174 == 0.0)
      *((_QWORD *)&v980 + 1) = 0;
    v180 = v173 + 880 * v109;
    *(_QWORD *)(v180 + 848) = *(_QWORD *)v153;
    *(_QWORD *)(v180 + 856) = *(_QWORD *)(v153 + 8);
    *(_QWORD *)(v180 + 864) = *(_QWORD *)(v153 + 16);
    v181 = *(double *)(v153 + 32);
    v182 = *(double *)(v153 + 40);
    v183 = __sincos_stret(*(double *)(v153 + 24));
    v184 = __sincos_stret(v181);
    v185 = __sincos_stret(v182);
    *(double *)(v180 + 776) = v183.__cosval * v184.__cosval;
    *(double *)(v180 + 784) = v183.__cosval * v184.__sinval * v185.__sinval - v183.__sinval * v185.__cosval;
    *(double *)(v180 + 792) = v183.__sinval * v185.__sinval + v183.__cosval * v184.__sinval * v185.__cosval;
    *(double *)(v180 + 800) = v183.__sinval * v184.__cosval;
    *(double *)(v180 + 808) = v183.__cosval * v185.__cosval + v183.__sinval * v184.__sinval * v185.__sinval;
    *(double *)(v180 + 816) = v183.__sinval * v184.__sinval * v185.__cosval - v183.__cosval * v185.__sinval;
    *(double *)(v180 + 824) = -v184.__sinval;
    *(double *)(v180 + 832) = v184.__cosval * v185.__sinval;
    *(double *)(v180 + 840) = v184.__cosval * v185.__cosval;
    v186 = malloc_type_malloc(8 * *(int *)(v180 + 488), 0x100004000313F17uLL);
    *(_QWORD *)(v180 + 768) = v186;
    memcpy(v186, a13, 8 * *(int *)(v180 + 488));
    rectify_pts((uint64_t)&v979, *(float32x2_t **)(v180 + 768), *(_DWORD *)(v180 + 488), (float *)&v989);
    v172 = v959;
  }
  v863 = *(_QWORD *)(a1 + 304);
  *(_DWORD *)(v863 + 880 * v155 + 496) = v109;
  *(_DWORD *)(a1 + 592) = v109;
  if (*(int *)(a1 + 588) >= 2 && (*(_BYTE *)(a1 + 132) & 0x10) != 0)
    __assert_rtn("slam_tracker_vo_add", "slam_tracker_vo.c", 2505, "0");
  if (!v172)
    v171 = 0;
  *(_QWORD *)&v979.tv_usec = 0;
  v979.tv_sec = 0;
  if (gettimeofday(&v979, 0) || (double)(v979.tv_usec + 1000000 * v979.tv_sec) / 1000000.0 <= 1514764800.0)
    goto LABEL_724;
  v187 = *(_QWORD *)(a1 + 304);
  v865 = *(_DWORD *)(a1 + 592);
  v188 = v187 + 880 * v865;
  v967 = 0u;
  memset(v968, 0, 112);
  v189 = (int *)(v188 + 488);
  v898 = malloc_type_malloc(4 * *(int *)(v188 + 488), 0x100004052888210uLL);
  ids = plq_create_ids(*(_QWORD **)(v188 + 368), *(unsigned int *)(v188 + 488));
  v960 = malloc_type_malloc(*(_QWORD *)(a1 + 312), 0xB7634210uLL);
  v190 = *(unsigned int *)(v188 + 488);
  if ((int)v190 <= 0)
  {
    v195 = (int)v190;
    *(_QWORD *)&v967 = (int)v190;
    *((_QWORD *)&v968[2] + 1) = (int)v190;
    v192 = v190;
    *((_QWORD *)&v968[0] + 1) = (int)v190;
    *(_QWORD *)&v968[4] = (int)v190;
    v200 = (float32x2_t *)a1;
    if ((int)v190 < 1)
      goto LABEL_174;
    goto LABEL_170;
  }
  if (*(unsigned int *)(v188 + 488) <= 0xAuLL)
    v191 = 10;
  else
    v191 = *(unsigned int *)(v188 + 488);
  *((_QWORD *)&v967 + 1) = malloc_type_realloc(0, 24 * v191, 0x2142F1D7uLL);
  *(_QWORD *)&v968[0] = v191;
  bzero(*((void **)&v967 + 1), 24 * v190);
  v192 = *v189;
  v193 = *v189;
  *(_QWORD *)&v967 = v193;
  if (v192 <= 0)
  {
    *((_QWORD *)&v968[2] + 1) = v192;
    *((_QWORD *)&v968[0] + 1) = v192;
    goto LABEL_168;
  }
  if (v192 <= 21)
    v194 = 21;
  else
    v194 = v192;
  *(_QWORD *)&v968[3] = malloc_type_realloc(0, 12 * v194, 0x6B88BC02uLL);
  *((_QWORD *)&v968[3] + 1) = v194;
  bzero(*(void **)&v968[3], 12 * v193);
  v192 = *v189;
  v195 = *v189;
  *((_QWORD *)&v968[2] + 1) = v195;
  if (v192 <= 0)
  {
    *((_QWORD *)&v968[0] + 1) = v192;
    *(_QWORD *)&v968[4] = v192;
    v200 = (float32x2_t *)a1;
    if (v192 < 1)
      goto LABEL_174;
    goto LABEL_170;
  }
  if (v192 <= 64)
    v196 = 64;
  else
    v196 = v192;
  *(_QWORD *)&v968[1] = malloc_type_realloc(0, 4 * v196, 0x221EED95uLL);
  *((_QWORD *)&v968[1] + 1) = v196;
  bzero(*(void **)&v968[1], 4 * v195);
  v192 = *v189;
  v193 = *v189;
  *((_QWORD *)&v968[0] + 1) = v193;
  if (v192 <= 0)
  {
LABEL_168:
    *(_QWORD *)&v968[4] = v193;
    v200 = (float32x2_t *)a1;
    goto LABEL_174;
  }
  if (v192 <= 64)
    v197 = 64;
  else
    v197 = v192;
  v198 = malloc_type_realloc(0, 4 * v197, 0xC84F66E0uLL);
  *((_QWORD *)&v968[4] + 1) = v198;
  *(_QWORD *)&v968[5] = v197;
  bzero(v198, 4 * v193);
  v192 = *v189;
  v195 = *v189;
  *(_QWORD *)&v968[4] = v195;
  if (v192 < 1)
  {
    v200 = (float32x2_t *)a1;
    if (v192 < 1)
      goto LABEL_174;
  }
  else
  {
    v199 = 0;
    v200 = (float32x2_t *)a1;
    do
    {
      *((_DWORD *)v198 + v199++) = -1;
      v195 = *v189;
    }
    while (v199 < v195);
    v192 = *v189;
    if (*v189 < 1)
      goto LABEL_174;
  }
LABEL_170:
  if (v195 <= 64)
    v201 = 64;
  else
    v201 = v195;
  *(_QWORD *)&v968[6] = malloc_type_realloc(0, 4 * v201, 0x5F09FB56uLL);
  *((_QWORD *)&v968[6] + 1) = v201;
  bzero(*(void **)&v968[6], 4 * v195);
  v200 = (float32x2_t *)a1;
  v192 = *v189;
LABEL_174:
  *((_QWORD *)&v968[5] + 1) = v192;
  v202 = v200[73].i32[1];
  if (v202 >= 2)
  {
    v203 = v202 - 1;
    v204 = v898;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)&v200[38] + 880 * ((v200[74].i32[0] + v203) % v202) + 488))
      {
        v205 = (v865 + v203) % v202;
        v881 = (int *)(v188 + 488);
        if (v205 == v865)
          goto LABEL_252;
        goto LABEL_183;
      }
      --v203;
    }
    while (v203);
    v205 = 0;
    v881 = (int *)(v188 + 488);
    if (!v865)
      goto LABEL_252;
    goto LABEL_183;
  }
  v205 = 0;
  v204 = v898;
  v881 = (int *)(v188 + 488);
  if (v865)
  {
LABEL_183:
    v206 = v200[38];
    v207 = v205;
    v208 = *(_QWORD *)&v206 + 880 * v205;
    LODWORD(v209) = *(_DWORD *)(v208 + 488);
    if ((int)v209 <= 0)
    {
      if ((int)v209 <= v192)
        LODWORD(v209) = v192;
      v260 = 0.0;
      goto LABEL_248;
    }
    v938 = v171;
    v943 = v187;
    v211 = v200[2].u32[0];
    v210 = v200[2].i32[1];
    v212 = *(float *)(v187 + 880 * v865 + 360) * 0.1;
    v213 = (int *)(v208 + 488);
    v214 = *(_QWORD *)&v206 + 880 * v207;
    v215 = (_QWORD *)(v214 + 368);
    v952 = (uint64_t *)(v214 + 384);
    v947 = (uint64_t *)(v187 + 880 * v865 + 384);
    v935 = v207;
    v933 = v200[38];
    if ((v211 & 0xF) != 0)
    {
      v216 = (uint64_t)ids;
      if ((int)v211 < 1)
      {
        v270 = 0;
        v271 = 0;
        v219 = 0;
        v272 = v212 * v212;
        do
        {
          if (v216)
          {
            v275 = (float *)(*v215 + v270);
            *(_QWORD *)&v979.tv_usec = 0;
            v979.tv_sec = 0;
            *(_QWORD *)&v980 = 0;
            *(float *)&v989.tv_sec = v272;
            plq_inside_circle_helper(v216, v275, (float *)&v989, (uint64_t)&v979, 1);
            if (v979.tv_sec == 1)
            {
              v276 = *(void **)&v979.tv_usec;
              v273 = **(_DWORD **)&v979.tv_usec;
            }
            else
            {
              if (v979.tv_sec)
                goto LABEL_746;
              v273 = -1;
              v276 = *(void **)&v979.tv_usec;
            }
            free(v276);
            LODWORD(v209) = *v213;
            v200 = (float32x2_t *)a1;
            v216 = (uint64_t)ids;
          }
          else
          {
            v273 = -1;
          }
          _ZF = v210 < 0 || v273 == -1;
          if (!_ZF)
            ++v219;
          ++v271;
          v270 += 8;
          v189 = v881;
        }
        while (v271 < (int)v209);
        goto LABEL_243;
      }
      if (ids)
      {
        v217 = 0;
        v218 = 0;
        v219 = 0;
        v220 = v212 * v212;
        v221 = 16;
        while (1)
        {
          v222 = (float *)(*v215 + 8 * v218);
          *(_QWORD *)&v979.tv_usec = 0;
          v979.tv_sec = 0;
          *(_QWORD *)&v980 = 0;
          *(float *)&v989.tv_sec = v220;
          plq_inside_circle_helper(v216, v222, (float *)&v989, (uint64_t)&v979, 1);
          if (v979.tv_sec == 1)
          {
            v223 = **(_DWORD **)&v979.tv_usec;
            free(*(void **)&v979.tv_usec);
            if (v223 != -1)
            {
              v200 = (float32x2_t *)a1;
              v224 = *v952;
              v225 = *v947;
              v226 = v223 * (int)v211;
              if (v211 < 8)
              {
                v227 = 0;
                v228 = 0;
                goto LABEL_205;
              }
              if (v211 >= 0x20)
              {
                v230 = 0uLL;
                v231 = (uint8x8_t *)(v224 + v221);
                v232 = 0uLL;
                v233 = (uint8x8_t *)(v225 + v226 + 16);
                v234 = v211 & 0xFFFFFFE0;
                v235 = 0uLL;
                v236 = 0uLL;
                v237 = 0uLL;
                v238 = 0uLL;
                v239 = 0uLL;
                v240 = 0uLL;
                do
                {
                  v241 = *(uint8x16_t *)v231[-2].i8;
                  v242 = *(uint8x16_t *)v233[-2].i8;
                  v243 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v241.i8, *(uint8x8_t *)v242.i8);
                  v244 = (int16x8_t)vsubl_high_u8(v241, v242);
                  v245 = (int16x8_t)vsubl_u8(*v231, *v233);
                  v246 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v231->i8, *(uint8x16_t *)v233->i8);
                  v236 = vmlal_high_s16(v236, v244, v244);
                  v235 = vmlal_s16(v235, *(int16x4_t *)v244.i8, *(int16x4_t *)v244.i8);
                  v232 = vmlal_high_s16(v232, v243, v243);
                  v230 = vmlal_s16(v230, *(int16x4_t *)v243.i8, *(int16x4_t *)v243.i8);
                  v240 = vmlal_high_s16(v240, v246, v246);
                  v239 = vmlal_s16(v239, *(int16x4_t *)v246.i8, *(int16x4_t *)v246.i8);
                  v238 = vmlal_high_s16(v238, v245, v245);
                  v237 = vmlal_s16(v237, *(int16x4_t *)v245.i8, *(int16x4_t *)v245.i8);
                  v231 += 4;
                  v233 += 4;
                  v234 -= 32;
                }
                while (v234);
                v228 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v237, v230), vaddq_s32(v239, v235)), vaddq_s32(vaddq_s32(v238, v232), vaddq_s32(v240, v236))));
                v227 = v211 & 0xFFFFFFE0;
                if (v227 != v211)
                {
                  v229 = v211 & 0xFFFFFFE0;
                  if ((v211 & 0x18) == 0)
                    goto LABEL_205;
                  goto LABEL_202;
                }
              }
              else
              {
                v228 = 0;
                v229 = 0;
LABEL_202:
                v247 = (int32x4_t)v228;
                v248 = 0uLL;
                v249 = (uint8x8_t *)(v224 + v229 + v217);
                v250 = (uint8x8_t *)(v225 + v229 + v226);
                v251 = v229 - (v211 & 0xFFFFFFF8);
                do
                {
                  v252 = *v249++;
                  v253 = v252;
                  v254 = *v250++;
                  v255 = (int16x8_t)vsubl_u8(v253, v254);
                  v248 = vmlal_high_s16(v248, v255, v255);
                  v247 = vmlal_s16(v247, *(int16x4_t *)v255.i8, *(int16x4_t *)v255.i8);
                  v251 += 8;
                }
                while (v251);
                v228 = vaddvq_s32(vaddq_s32(v247, v248));
                v227 = v211 & 0xFFFFFFF8;
                if (v227 != v211)
                {
LABEL_205:
                  v256 = v211 - v227;
                  v257 = (unsigned __int8 *)(v225 + v227 + v226);
                  v258 = v224 + v227;
                  do
                  {
                    v259 = *v257++;
                    v228 += (*(unsigned __int8 *)(v258 + v217) - v259) * (*(unsigned __int8 *)(v258 + v217) - v259);
                    ++v258;
                    --v256;
                  }
                  while (v256);
                }
              }
              if (v228 <= v210)
                ++v219;
              goto LABEL_191;
            }
          }
          else
          {
            if (v979.tv_sec)
              goto LABEL_746;
            free(*(void **)&v979.tv_usec);
          }
          v200 = (float32x2_t *)a1;
LABEL_191:
          ++v218;
          v209 = *v213;
          v221 += v211;
          v217 += v211;
          v216 = (uint64_t)ids;
          if (v218 >= v209)
          {
            v189 = v881;
            goto LABEL_243;
          }
        }
      }
LABEL_242:
      v219 = 0;
LABEL_243:
      if ((int)v209 <= *v189)
        LODWORD(v209) = *v189;
      v260 = (float)v219;
      if (v219 <= 99)
        v260 = 0.0;
      v204 = v898;
      v171 = v938;
      v187 = v943;
      v207 = v935;
      v206 = v933;
LABEL_248:
      v277 = (float)(*(float *)(*(_QWORD *)&v206 + 880 * v207 + 512) * 0.5)
           + (float)((float)(v260 / (float)(int)v209) * 0.5);
      v278 = v187 + 880 * v865;
      *(float *)(v278 + 512) = v277;
      if (v171)
      {
        v279 = (float *)(v278 + 512);
        v280 = v171[1];
        v282 = v171[2];
        v281 = v171[3];
        v283 = v171[4];
        v284 = v171[5];
        v285 = sqrt(v280 * v280 + *v171 * *v171 + v282 * v282);
        *(double *)&v981[40] = *v171;
        *(double *)&v981[48] = v280;
        *(double *)&v981[56] = v282;
        v286 = __sincos_stret(v281);
        v287 = __sincos_stret(v283);
        v288 = __sincos_stret(v284);
        *(double *)&v979.tv_sec = v286.__cosval * v287.__cosval;
        *(double *)&v979.tv_usec = v286.__cosval * v287.__sinval * v288.__sinval - v286.__sinval * v288.__cosval;
        *(double *)&v980 = v286.__sinval * v288.__sinval + v286.__cosval * v287.__sinval * v288.__cosval;
        *((double *)&v980 + 1) = v286.__sinval * v287.__cosval;
        *(double *)v981 = v286.__cosval * v288.__cosval + v286.__sinval * v287.__sinval * v288.__sinval;
        *(double *)&v981[8] = v286.__sinval * v287.__sinval * v288.__cosval - v286.__cosval * v288.__sinval;
        *(double *)&v981[16] = -v287.__sinval;
        *(double *)&v981[24] = v287.__cosval * v288.__sinval;
        *(double *)&v981[32] = v287.__cosval * v288.__cosval;
        v289 = g_log_so3((double *)&v989.tv_sec, (double *)&v979.tv_sec);
        v200 = (float32x2_t *)a1;
        v290 = v289;
        v277 = *v279;
        v204 = v898;
        if ((float)(*(float *)(a1 + 284)
                   + (float)((float)((float)(*(float *)(a1 + 276) * v290) + (float)(*(float *)(a1 + 272) * v285))
                           + (float)(*(float *)(a1 + 280) * v277))) > 0.0)
          goto LABEL_251;
      }
      if (v277 >= v200[33].f32[0])
      {
LABEL_251:
        v291 = (_OWORD *)(*(_QWORD *)&v200[38] + 880 * v207);
        v292 = v291[1];
        *(_OWORD *)v188 = *v291;
        *(_OWORD *)(v188 + 16) = v292;
        v293 = v291[2];
        v294 = v291[3];
        v295 = v291[5];
        *(_OWORD *)(v188 + 64) = v291[4];
        *(_OWORD *)(v188 + 80) = v295;
        *(_OWORD *)(v188 + 32) = v293;
        *(_OWORD *)(v188 + 48) = v294;
        v296 = v187 + 880 * v865;
        v297 = (_OWORD *)(*(_QWORD *)&v200[38] + 880 * v207);
        v298 = v297[7];
        *(_OWORD *)(v296 + 96) = v297[6];
        *(_OWORD *)(v296 + 112) = v298;
        v299 = v297[8];
        v300 = v297[9];
        v301 = v297[11];
        *(_OWORD *)(v296 + 160) = v297[10];
        *(_OWORD *)(v296 + 176) = v301;
        *(_OWORD *)(v296 + 128) = v299;
        *(_OWORD *)(v296 + 144) = v300;
        *(_DWORD *)(v296 + 516) = 1;
        log_msg(3, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1872, (uint64_t)"spawn", "Stop detected from kpts: %f static points", v277);
        v200 = (float32x2_t *)a1;
      }
      goto LABEL_252;
    }
    v261 = (uint64_t)ids;
    if ((int)v211 < 1)
    {
      v856 = 0;
      v857 = 0;
      v219 = 0;
      v858 = v212 * v212;
      do
      {
        if (v261)
        {
          v861 = (float *)(*v215 + v856);
          *(_QWORD *)&v979.tv_usec = 0;
          v979.tv_sec = 0;
          *(_QWORD *)&v980 = 0;
          *(float *)&v989.tv_sec = v858;
          plq_inside_circle_helper(v261, v861, (float *)&v989, (uint64_t)&v979, 1);
          if (v979.tv_sec == 1)
          {
            v862 = *(void **)&v979.tv_usec;
            v859 = **(_DWORD **)&v979.tv_usec;
          }
          else
          {
            if (v979.tv_sec)
            {
LABEL_746:
              log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/containers/plq.c", 600, (uint64_t)"plq_nn", "The size here should be exactly 1.");
              __assert_rtn("plq_nn", "plq.c", 600, "0");
            }
            v859 = -1;
            v862 = *(void **)&v979.tv_usec;
          }
          free(v862);
          LODWORD(v209) = *v213;
          v200 = (float32x2_t *)a1;
          v261 = (uint64_t)ids;
        }
        else
        {
          v859 = -1;
        }
        if (v210 >= 0 && v859 != -1)
          ++v219;
        ++v857;
        v856 += 8;
        v189 = v881;
      }
      while (v857 < (int)v209);
      goto LABEL_243;
    }
    if (!ids)
      goto LABEL_242;
    v262 = 0;
    v263 = 0;
    v219 = 0;
    v264 = v212 * v212;
    while (1)
    {
      while (1)
      {
        v265 = (float *)(*v215 + 8 * v263);
        *(_QWORD *)&v979.tv_usec = 0;
        v979.tv_sec = 0;
        *(_QWORD *)&v980 = 0;
        *(float *)&v989.tv_sec = v264;
        plq_inside_circle_helper(v261, v265, (float *)&v989, (uint64_t)&v979, 1);
        if (v979.tv_sec == 1)
          break;
        if (v979.tv_sec)
          goto LABEL_746;
        free(*(void **)&v979.tv_usec);
LABEL_218:
        v200 = (float32x2_t *)a1;
        ++v263;
        v209 = *v213;
        v262 += v211;
        v261 = (uint64_t)ids;
        if (v263 >= v209)
          goto LABEL_243;
      }
      v266 = **(_DWORD **)&v979.tv_usec;
      free(*(void **)&v979.tv_usec);
      if (v266 == -1)
        goto LABEL_218;
      v267 = 0;
      v268 = 0;
      v200 = (float32x2_t *)a1;
      do
      {
        v269 = vabdq_u8(*(uint8x16_t *)(*v952 + v262 + v267), *(uint8x16_t *)(*v947 + v266 * (int)v211 + v267));
        v268 += vaddlvq_u16(vqaddq_u16(vmull_u8(*(uint8x8_t *)v269.i8, *(uint8x8_t *)v269.i8), vmull_high_u8(v269, v269)));
        v267 += 16;
      }
      while (v267 < v211);
      if (v268 <= v210)
        ++v219;
      ++v263;
      v209 = *v213;
      v262 += v211;
      v261 = (uint64_t)ids;
      if (v263 >= v209)
        goto LABEL_243;
    }
  }
LABEL_252:
  v302 = v187 + 880 * v865;
  v303 = *(_DWORD *)(v302 + 516);
  if (v303)
    v304 = v200[119].i32[0] + 1;
  else
    v304 = 0;
  v305 = 0;
  v874 = (uint64_t *)&v200[39];
  v875 = (int *)(v302 + 516);
  v200[119].i32[0] = v304;
  v306 = v187 + 880 * v865;
  v910 = (float *)(v306 + 360);
  v919 = (uint64_t *)(v306 + 400);
  v307 = (float *)(v306 + 344);
  v929 = (float *)(v306 + 352);
  v925 = (float *)(v306 + 356);
  v922 = (float *)(v306 + 348);
  v907 = (float *)(v306 + 344);
  v902 = (uint64_t *)(v306 + 384);
  v308 = 1.0;
  __asm { FMOV            V12.2S, #1.0 }
  while (1)
  {
    if (v303)
    {
      if (v305 >= 1)
        goto LABEL_473;
    }
    else if (v305 >= v200[6].i32[1])
    {
      goto LABEL_473;
    }
    _ZF = (v305 | v303) == 0;
    v310 = 10;
    if (_ZF)
      v310 = 9;
    v311 = v200->f32[v310];
    v312 = *v910;
    v313 = v967;
    if ((uint64_t)v967 >= 1)
    {
      v314 = *((_QWORD *)&v967 + 1);
      if ((_QWORD)v967 == 1)
      {
        v315 = 0;
LABEL_269:
        v318 = v313 - v315;
        v319 = (_QWORD *)(v314 + 24 * v315);
        do
        {
          *v319 = 0;
          v319 += 3;
          --v318;
        }
        while (v318);
        goto LABEL_271;
      }
      v315 = v967 & 0xFFFFFFFFFFFFFFFELL;
      v316 = v967 & 0xFFFFFFFFFFFFFFFELL;
      v317 = (_QWORD *)*((_QWORD *)&v967 + 1);
      do
      {
        *v317 = 0;
        v317[3] = 0;
        v317 += 6;
        v316 -= 2;
      }
      while (v316);
      if (v313 != v315)
        goto LABEL_269;
    }
LABEL_271:
    if (*v189 >= 1)
    {
      v320 = 0;
      v321 = *v919;
      do
      {
        *(_DWORD *)(v321 + 4 * v320++) = -1;
        v322 = *v189;
      }
      while (v320 < v322);
      if ((int)v322 >= 1)
      {
        v323 = 0;
        do
          v204[v323++] = v200[2].i32[1];
        while (v323 < *v189);
      }
    }
    v880 = v305;
    v324 = v311 * v312;
    LODWORD(v968[2]) = v200[45].i32[0];
    bzero(v960, *(_QWORD *)&v200[39]);
    v200 = (float32x2_t *)a1;
    v325 = *(_DWORD *)(a1 + 588);
    v904 = v324;
    v897 = v324 * v324;
    if (v325 > 1)
    {
      v953 = 1;
      while (1)
      {
        v326 = v200[74].i32[0];
        v327 = v200[38];
        v329 = v200[2].u32[0];
        v328 = v200[2].i32[1];
        v330 = v200[5].f32[1];
        v944 = v200[3];
        v331 = v200[4].f32[0];
        v332 = v200[7].f32[0];
        v970 = malloc_type_malloc(0x100uLL, 0x100004052888210uLL);
        v969 = 0;
        v971 = 64;
        *(_QWORD *)&v989.tv_usec = 0;
        v989.tv_sec = 0;
        if (gettimeofday(&v989, 0) || (double)(v989.tv_usec + 1000000 * v989.tv_sec) / 1000000.0 <= 1514764800.0)
          goto LABEL_724;
        v976.f64[1] = 0.0;
        v977 = 0.0;
        v978 = 0.0;
        v333 = (float)(v308 / (float)(*v929 - *v307));
        v334 = (float)(v308 / (float)(*v925 - *v922));
        v989 = (timeval)0;
        memset(v990, 0, 136);
        LODWORD(v989.tv_sec) = 4;
        v335 = atan(1.0 / (v333 + v333));
        *(double *)&v989.tv_usec = v335 + v335;
        v336 = atan(1.0 / (v334 + v334));
        *(double *)v990 = v336 + v336;
        v975 = *(float64x2_t *)(v188 + 72);
        v976.f64[0] = *(float64_t *)(v188 + 88);
        v337 = *(double *)(v188 + 48);
        if (fabs(v337) < 1.0)
          break;
        v976.f64[1] = 0.0;
        if (*(double *)(v188 + 48) > -1.0)
        {
          v977 = -1.57079633;
          v338 = -*(double *)(v188 + 8);
          v339 = -*(double *)(v188 + 16);
          goto LABEL_285;
        }
        v977 = 1.57079633;
        v340 = atan2(*(long double *)(v188 + 8), *(long double *)(v188 + 16)) + 0.0;
LABEL_287:
        v978 = v340;
        g_frustum_from_camera((double *)&v979.tv_sec, &v975, (uint64_t)&v989, v944.f32[0], v944.f32[1]);
        if (v944.f32[0] > v331)
          v331 = v944.f32[0];
        v976.f64[1] = 0.0;
        v977 = 0.0;
        v978 = 0.0;
        v341 = (float)(v308 / (float)(*v929 - *v307));
        v342 = (float)(v308 / (float)(*v925 - *v922));
        v989 = (timeval)0;
        memset(v990, 0, 136);
        LODWORD(v989.tv_sec) = 4;
        v343 = atan(1.0 / (v341 + v341));
        *(double *)&v989.tv_usec = v343 + v343;
        v344 = atan(1.0 / (v342 + v342));
        *(double *)v990 = v344 + v344;
        v975 = *(float64x2_t *)(v188 + 72);
        v976.f64[0] = *(float64_t *)(v188 + 88);
        v345 = *(double *)(v188 + 48);
        if (fabs(v345) < 1.0)
        {
          v977 = asin(-v345);
          v976.f64[1] = atan2(*(long double *)(v188 + 24), *(long double *)v188);
          v346 = *(double *)(v188 + 56);
          v347 = *(double *)(v188 + 64);
LABEL_293:
          v348 = atan2(v346, v347);
          goto LABEL_295;
        }
        v976.f64[1] = 0.0;
        if (*(double *)(v188 + 48) > -1.0)
        {
          v977 = -1.57079633;
          v346 = -*(double *)(v188 + 8);
          v347 = -*(double *)(v188 + 16);
          goto LABEL_293;
        }
        v977 = 1.57079633;
        v348 = atan2(*(long double *)(v188 + 8), *(long double *)(v188 + 16)) + 0.0;
LABEL_295:
        v308 = 1.0;
        v349 = (v325 - v953 + v326) % v325;
        v350 = v349;
        v978 = v348;
        g_frustum_from_camera(&v988, &v975, (uint64_t)&v989, v331, v944.f32[1]);
        v351 = *(_QWORD *)&v327 + 880 * v349;
        if (*(int *)(v351 + 488) >= 1)
        {
          v352 = 0;
          v353 = 0;
          v354 = v328;
          v355 = *(_QWORD *)&v327 + 880 * v349;
          v356 = (int *)(v351 + 488);
          v913 = 10 * v354;
          v357 = (uint64_t *)(v355 + 400);
          v948 = (int8x8_t)vdiv_f32(_D12, v944);
          v900 = v350 & 0x7FFF;
          v939 = (_QWORD *)(v355 + 392);
          v358 = 16;
          do
          {
            v359 = *(_QWORD *)(v355 + 368);
            *(_QWORD *)&v989.tv_usec = 0;
            v989.tv_sec = 0;
            *(_QWORD *)&v990[0] = 0;
            v975 = 0uLL;
            v976.f64[0] = 0.0;
            v972 = 0.0;
            v966 = 0.0;
            v360 = *(int *)(*v357 + 4 * v353);
            if ((_DWORD)v360 == -1)
            {
              if (v953 != 1)
                goto LABEL_298;
              if (*v939)
              {
                v443 = 1.0 / *(float *)(*v939 + 4 * v353);
                v444.i32[1] = v948.i32[1];
                v444.f32[0] = v332 + v443;
                v445.i32[0] = v948.i32[0];
                v445.f32[1] = v443 - v332;
                v446 = (int8x8_t)vcgt_f32(v445, v444);
                v445.i32[0] = v444.i32[0];
                v369 = vdiv_f32(_D12, (float32x2_t)vbsl_s8(v446, (int8x8_t)v445, v948));
                v362 = -1;
              }
              else
              {
                v362 = -1;
                v369 = v944;
              }
              v361 = a1;
              v370 = *(_QWORD *)(a1 + 960);
              v371 = *(float *)(v359 + 8 * v353);
              v372 = *(float *)(v359 + 8 * v353 + 4);
              if (v370)
                goto LABEL_302;
            }
            else
            {
              if (*((_BYTE *)v960 + v360))
                goto LABEL_298;
              v361 = a1;
              *((_BYTE *)v960 + v360) = 1;
              v362 = *(_DWORD *)(*v357 + 4 * v353);
              v363 = (float *)(*(_QWORD *)(a1 + 376) + 12 * v362);
              v364 = *(double *)(v355 + 24) * (v363[1] - *(double *)(v355 + 80))
                   + *(double *)v355 * (*v363 - *(double *)(v355 + 72))
                   + *(double *)(v355 + 48) * (v363[2] - *(double *)(v355 + 88));
              v365 = 1.0 / v364;
              v366.i32[1] = v948.i32[1];
              v366.f32[0] = v332 + v365;
              v367.i32[0] = v948.i32[0];
              v367.f32[1] = v365 - v332;
              v368 = (int8x8_t)vcgt_f32(v367, v366);
              v367.i32[0] = v366.i32[0];
              v369 = vdiv_f32(_D12, (float32x2_t)vbsl_s8(v368, (int8x8_t)v367, v948));
              v370 = *(_QWORD *)(a1 + 960);
              v371 = *(float *)(v359 + 8 * v353);
              v372 = *(float *)(v359 + 8 * v353 + 4);
              if (v370)
              {
LABEL_302:
                v373 = *(_DWORD *)(v361 + 992);
                v374 = (int)(float)((float)((float)v373 * 0.5) + (float)(v371 * *(float *)(v361 + 984)));
                v375 = *(_DWORD *)(v361 + 996);
                v376 = (int)(float)((float)((float)v375 * 0.5) + (float)(v372 * *(float *)(v361 + 988)));
                if (v373 <= v374)
                  v377 = v373 - 1;
                else
                  v377 = (int)(float)((float)((float)v373 * 0.5) + (float)(v371 * *(float *)(v361 + 984)));
                v378 = 2 * v377;
                if (v375 <= v376)
                  v379 = v375 - 1;
                else
                  v379 = (int)(float)((float)((float)v375 * 0.5) + (float)(v372 * *(float *)(v361 + 988)));
                if (v376 < 0)
                  v379 = 0;
                if (v374 < 0)
                  v378 = 0;
                v380 = (const float *)(v370 + 4 * (*(_QWORD *)(v361 + 976) * v379 + v378));
                v381 = vld1_dup_f32(v380++);
                v382 = vld1_dup_f32(v380);
                v369 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v381, v369), (int8x8_t)v381, vbsl_s8((int8x8_t)vcgt_f32(v369, v382), (int8x8_t)v382, (int8x8_t)v369));
              }
            }
            v383 = v371;
            v384 = v372;
            v385 = sqrt(v383 * v383 + 1.0 + v384 * v384);
            v386 = v383 / v385;
            v387 = v384 / v385;
            if (v385 > 0.0)
              v388 = 1.0 / v385;
            else
              v388 = 0.0;
            if (v385 > 0.0)
              v389 = v386;
            else
              v389 = 0.0;
            if (v385 > 0.0)
              v390 = v387;
            else
              v390 = 0.0;
            v391 = v388 * v369.f32[0];
            v392 = v389 * v369.f32[0];
            v393 = v390 * v369.f32[0];
            v394 = *(double *)v355;
            v395 = *(double *)(v355 + 8);
            v396 = *(double *)(v355 + 16);
            v397 = *(double *)(v355 + 24);
            v399 = *(double *)(v355 + 64);
            v398 = *(double *)(v355 + 72);
            *(double *)&v400 = v398 + v392 * v395 + *(double *)v355 * v391 + v396 * v393;
            v401 = *(double *)(v355 + 32);
            v402 = *(double *)(v355 + 40);
            v403 = v392 * v401 + v397 * v391 + v402 * v393;
            v404 = *(double *)(v355 + 48);
            v405 = *(double *)(v355 + 56);
            v406 = v392 * v405 + v404 * v391 + v399 * v393;
            v407 = *(double *)(v355 + 80);
            v408 = *(double *)(v355 + 88);
            v989.tv_sec = v400;
            *(double *)&v989.tv_usec = v407 + v403;
            *(double *)v990 = v408 + v406;
            v409 = v385 <= 0.0;
            if (v385 > 0.0)
              v410 = 1.0 / v385;
            else
              v410 = 0.0;
            if (v409)
            {
              v386 = 0.0;
              v387 = 0.0;
            }
            v411 = v369.f32[1];
            v412 = v410 * v411;
            v413 = v386 * v411;
            v414 = v387 * v411;
            v975.f64[0] = v398 + v395 * v413 + v394 * v412 + v396 * v414;
            v975.f64[1] = v407 + v401 * v413 + v397 * v412 + v402 * v414;
            v976.f64[0] = v408 + v405 * v413 + v404 * v412 + v399 * v414;
            if (!g_frustum_isect_lseg((double *)&v979.tv_sec + 24 * (v362 == -1), (double *)&v989.tv_sec, v975.f64, &v972, &v966))goto LABEL_298;
            v415 = *(double *)(v188 + 72);
            v416 = *(double *)(v188 + 80);
            v417 = *(double *)&v989.tv_sec + (v975.f64[0] - *(double *)&v989.tv_sec) * v972 - v415;
            v418 = *(double *)(v188 + 24);
            v419 = *(double *)&v989.tv_usec + (v975.f64[1] - *(double *)&v989.tv_usec) * v972 - v416;
            v420 = *(double *)(v188 + 48);
            v421 = *(double *)(v188 + 88);
            v422 = *(double *)v990 + (v976.f64[0] - *(double *)v990) * v972 - v421;
            v423 = v418 * v419 + *(double *)v188 * v417 + v420 * v422;
            if (v423 <= 0.0)
              goto LABEL_298;
            v424 = *(double *)v990 + (v976.f64[0] - *(double *)v990) * v966 - v421;
            v425 = *(double *)&v989.tv_sec + (v975.f64[0] - *(double *)&v989.tv_sec) * v966 - v415;
            v426 = *(double *)&v989.tv_usec + (v975.f64[1] - *(double *)&v989.tv_usec) * v966 - v416;
            v427 = v418 * v426 + *(double *)v188 * v425 + v420 * v424;
            if (v427 <= 0.0)
              goto LABEL_298;
            v428 = *(double *)(v188 + 32);
            v429 = *(double *)(v188 + 40);
            v430 = *(double *)(v188 + 8);
            v431 = *(double *)(v188 + 16);
            v432 = v419 * v428 + v430 * v417;
            v433 = v419 * v429 + v431 * v417;
            v434 = *(double *)(v188 + 56);
            v435 = *(double *)(v188 + 64);
            v436 = v432 + v434 * v422;
            *(float *)&v436 = v436;
            *(float *)&v433 = v433 + v435 * v422;
            *(float *)&v436 = *(float *)&v436 / v423;
            v437 = *(float *)&v433 / v423;
            v438 = v429 * v426 + v431 * v425 + v435 * v424;
            v440 = v428 * v426 + v430 * v425;
            v439 = v440 + v434 * v424;
            *(float *)&v440 = v438;
            *(float *)&v438 = v439;
            *(float *)&v438 = *(float *)&v438 / v427;
            *(float *)&v439 = *(float *)&v440 / v427;
            *(float *)&v440 = (float)((float)(v437 - *(float *)&v439) * (float)(v437 - *(float *)&v439))
                            + (float)((float)(*(float *)&v436 - *(float *)&v438)
                                    * (float)(*(float *)&v436 - *(float *)&v438));
            if (*(float *)&v440 >= 1.0e-12)
            {
              v964[0] = *(float *)&v436;
              v964[1] = v437;
              v963[0] = *(float *)&v438;
              v963[1] = *(float *)&v439;
              v441 = plq_inside_line((uint64_t)ids, v964, v963, (uint64_t)&v969, v904, v436, v438, v439, v440);
              v442 = v329 & 0xFFFFFFE0;
              if (v441 > 0)
                goto LABEL_341;
              goto LABEL_297;
            }
            v965[0] = *(float *)&v436;
            v965[1] = v437;
            if (ids)
            {
              v974 = v897;
              v441 = plq_inside_circle_helper((uint64_t)ids, v965, &v974, (uint64_t)&v969, 0);
              v442 = v329 & 0xFFFFFFE0;
              if (v441 > 0)
              {
LABEL_341:
                v447 = *(_QWORD *)(v355 + 384);
                v448 = *v902;
                v449 = v441;
                v450 = (int *)v970;
                if ((v329 & 0xF) != 0)
                {
                  if ((int)v329 > 0)
                  {
                    v451 = 0;
                    v452 = -1;
                    v453 = v913;
                    v454 = v913;
                    while (1)
                    {
                      v456 = *((_DWORD *)v970 + v451) * (int)v329;
                      if (v329 >= 8)
                      {
                        if (v329 < 0x20)
                        {
                          v458 = 0;
                          v459 = 0;
LABEL_362:
                          v477 = 0uLL;
                          v478 = (int32x4_t)v458;
                          v479 = (uint8x8_t *)(v447 + v352 + v459);
                          v480 = (uint8x8_t *)(v448 + v459 + v456);
                          v481 = v459 - (v329 & 0xFFFFFFF8);
                          do
                          {
                            v482 = *v479++;
                            v483 = v482;
                            v484 = *v480++;
                            v485 = (int16x8_t)vsubl_u8(v483, v484);
                            v477 = vmlal_high_s16(v477, v485, v485);
                            v478 = vmlal_s16(v478, *(int16x4_t *)v485.i8, *(int16x4_t *)v485.i8);
                            v481 += 8;
                          }
                          while (v481);
                          v458 = vaddvq_s32(vaddq_s32(v478, v477));
                          v457 = v329 & 0xFFFFFFF8;
                          if (v457 == v329)
                            goto LABEL_344;
                          goto LABEL_365;
                        }
                        v460 = 0uLL;
                        v461 = (uint8x8_t *)(v448 + 16 + v456);
                        v462 = 0uLL;
                        v463 = v442;
                        v464 = (uint8x8_t *)(v447 + v358);
                        v465 = 0uLL;
                        v466 = 0uLL;
                        v467 = 0uLL;
                        v468 = 0uLL;
                        v469 = 0uLL;
                        v470 = 0uLL;
                        do
                        {
                          v471 = *(uint8x16_t *)v464[-2].i8;
                          v472 = *(uint8x16_t *)v461[-2].i8;
                          v473 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v471.i8, *(uint8x8_t *)v472.i8);
                          v474 = (int16x8_t)vsubl_high_u8(v471, v472);
                          v475 = (int16x8_t)vsubl_u8(*v464, *v461);
                          v476 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v464->i8, *(uint8x16_t *)v461->i8);
                          v466 = vmlal_high_s16(v466, v474, v474);
                          v465 = vmlal_s16(v465, *(int16x4_t *)v474.i8, *(int16x4_t *)v474.i8);
                          v462 = vmlal_high_s16(v462, v473, v473);
                          v460 = vmlal_s16(v460, *(int16x4_t *)v473.i8, *(int16x4_t *)v473.i8);
                          v470 = vmlal_high_s16(v470, v476, v476);
                          v469 = vmlal_s16(v469, *(int16x4_t *)v476.i8, *(int16x4_t *)v476.i8);
                          v468 = vmlal_high_s16(v468, v475, v475);
                          v467 = vmlal_s16(v467, *(int16x4_t *)v475.i8, *(int16x4_t *)v475.i8);
                          v464 += 4;
                          v461 += 4;
                          v463 -= 32;
                        }
                        while (v463);
                        v458 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v467, v460), vaddq_s32(v469, v465)), vaddq_s32(vaddq_s32(v468, v462), vaddq_s32(v470, v466))));
                        if (v442 == v329)
                          goto LABEL_344;
                        v459 = v442;
                        v457 = v442;
                        if ((v329 & 0x18) != 0)
                          goto LABEL_362;
                      }
                      else
                      {
                        v457 = 0;
                        v458 = 0;
                      }
LABEL_365:
                      v486 = v329 - v457;
                      v487 = (unsigned __int8 *)(v448 + v457 + v456);
                      v488 = v447 + v457;
                      do
                      {
                        v489 = *v487++;
                        v458 += (*(unsigned __int8 *)(v488 + v352) - v489) * (*(unsigned __int8 *)(v488 + v352) - v489);
                        ++v488;
                        --v486;
                      }
                      while (v486);
LABEL_344:
                      if (v458 < v453)
                        v453 = v458;
                      v455 = v458 < v454;
                      if (v458 <= v454)
                        v453 = v454;
                      if (v458 < v454)
                        v454 = v458;
                      if (v455)
                        v452 = *((_DWORD *)v970 + v451);
                      if (++v451 == v441)
                        goto LABEL_396;
                    }
                  }
                  v452 = -1;
                  v453 = v913;
                  v454 = v913;
                  do
                  {
                    v497 = *v450++;
                    v496 = v497;
                    v453 &= v453 >> 31;
                    v498 = v454 < 0;
                    if (v454 >= 0)
                      v453 = v454;
                    v454 &= v454 >> 31;
                    if (!v498)
                      v452 = v496;
                    --v449;
                  }
                  while (v449);
                }
                else if ((int)v329 <= 0)
                {
                  v452 = -1;
                  v453 = v913;
                  v454 = v913;
                  do
                  {
                    v500 = *v450++;
                    v499 = v500;
                    v453 &= v453 >> 31;
                    v501 = v454 < 0;
                    if (v454 >= 0)
                      v453 = v454;
                    v454 &= v454 >> 31;
                    if (!v501)
                      v452 = v499;
                    --v449;
                  }
                  while (v449);
                }
                else
                {
                  v490 = 0;
                  v491 = v447 + v352;
                  v452 = -1;
                  v453 = v913;
                  v454 = v913;
                  do
                  {
                    v492 = 0;
                    v493 = 0;
                    do
                    {
                      v494 = vabdq_u8(*(uint8x16_t *)(v491 + v492), *(uint8x16_t *)(v448 + *((_DWORD *)v970 + v490) * (int)v329 + v492));
                      v493 += vaddlvq_u16(vqaddq_u16(vmull_u8(*(uint8x8_t *)v494.i8, *(uint8x8_t *)v494.i8), vmull_high_u8(v494, v494)));
                      v492 += 16;
                    }
                    while (v492 < v329);
                    if (v493 < v453)
                      v453 = v493;
                    v495 = v493 < v454;
                    if (v493 <= v454)
                      v453 = v454;
                    if (v493 < v454)
                      v454 = v493;
                    if (v495)
                      v452 = *((_DWORD *)v970 + v490);
                    ++v490;
                  }
                  while (v490 != v449);
                }
LABEL_396:
                v969 = 0;
                if (v452 == -1)
                  goto LABEL_298;
                if (v454 > v898[v452] || (float)((float)(v330 * v330) * (float)v453) < (float)v454)
                  goto LABEL_298;
                v503 = v452;
                v898[v452] = v454;
                v504 = *(_DWORD *)(*v357 + 4 * v353);
                v505 = *((_QWORD *)&v967 + 1);
                v506 = (_QWORD *)(*((_QWORD *)&v967 + 1) + 24 * v452);
                v507 = v865 & 0x7FFF | (v452 << 15);
                v508 = 4 * v452;
                if (v504 == -1)
                {
                  *v506 = 0;
                  v521 = v505 + 24 * v452;
                  v524 = *(_QWORD *)(v521 + 16);
                  v523 = (uint64_t *)(v521 + 16);
                  v522 = v524;
                  if (v524 < 1)
                  {
                    v541 = 2 * v522;
                    if (2 * v522 <= 1)
                      v541 = 1;
                    if (!v522)
                      v541 = 64;
                    v870 = v541;
                    v873 = v505 + 24 * v503;
                    v892 = v508;
                    v895 = v506;
                    v889 = v507;
                    v883 = v505;
                    v886 = v503;
                    v878 = v523;
                    v526 = malloc_type_realloc(*(void **)(v873 + 8), 4 * v541, 0xAA23C071uLL);
                    v522 = v870;
                    v523 = v878;
                    v505 = v883;
                    v503 = v886;
                    v508 = v892;
                    v506 = v895;
                    v507 = v889;
                    *(_QWORD *)(v873 + 8) = v526;
                    *v878 = v870;
                    v525 = *v895;
                  }
                  else
                  {
                    v525 = 0;
                    v526 = *(_DWORD **)(v505 + 24 * v452 + 8);
                  }
                  v542 = v525 + 1;
                  *v506 = v525 + 1;
                  v526[v525] = v900 | ((_DWORD)v353 << 15);
                  if (v525 + 1 >= v522)
                  {
                    v543 = v525 + 2;
                    if (2 * v522 > v542)
                      v543 = 2 * v522;
                    if (v543)
                    {
                      v884 = (_QWORD *)(v505 + 24 * v503 + 8);
                      v887 = v543;
                      v893 = v508;
                      v896 = v506;
                      v890 = v507;
                      v879 = v523;
                      v526 = malloc_type_realloc(v526, 4 * v543, 0x374EE50AuLL);
                      v543 = v887;
                      v523 = v879;
                      v508 = v893;
                      v506 = v896;
                      v507 = v890;
                      *v884 = v526;
                      v542 = *v896;
                    }
                    *v523 = v543;
                  }
                  *v506 = v542 + 1;
                  v526[v542] = v507;
                  v544 = LODWORD(v968[2])++;
                  *(_DWORD *)(*(_QWORD *)&v968[1] + v508) = v544;
                  *(_DWORD *)(*v919 + v508) = -1;
                  goto LABEL_298;
                }
                v509 = a1;
                v510 = *(_QWORD *)(a1 + 320);
                *v506 = 0;
                v511 = *(_QWORD *)(v510 + 24 * v504);
                v891 = v508;
                v894 = v506;
                v888 = v507;
                v882 = v505;
                v885 = v503;
                if (v511 < 1)
                {
                  v527 = 0;
                  v528 = v505 + 24 * v503;
                  v531 = *(_QWORD *)(v528 + 16);
                  v529 = (uint64_t *)(v528 + 16);
                  v530 = v531;
                  if (v531 <= 0)
                    goto LABEL_415;
                }
                else
                {
                  v876 = (uint64_t *)(v510 + 24 * v504);
                  v512 = (const void *)v876[1];
                  v513 = v505 + 24 * v503;
                  v516 = *(_QWORD *)(v513 + 16);
                  v515 = (uint64_t *)(v513 + 16);
                  v514 = v516;
                  if (v511 <= v516)
                  {
                    v520 = 0;
                    v519 = *(char **)(v505 + 24 * v503 + 8);
                  }
                  else
                  {
                    v868 = v515;
                    v871 = (const void *)v876[1];
                    v517 = 2 * v514;
                    _ZF = v514 == 0;
                    v518 = 64;
                    if (!_ZF)
                      v518 = v517;
                    if (v518 > v511)
                      v511 = v518;
                    v866 = v511;
                    v867 = v505 + 24 * v503;
                    v519 = (char *)malloc_type_realloc(*(void **)(v867 + 8), 4 * v511, 0xE017DAD8uLL);
                    *(_QWORD *)(v867 + 8) = v519;
                    v512 = v871;
                    *v868 = v866;
                    v520 = *v894;
                    v511 = *v876;
                  }
                  memcpy(&v519[4 * v520], v512, 4 * v511);
                  v508 = v891;
                  v506 = v894;
                  v527 = *v894 + *v876;
                  *v894 = v527;
                  v509 = a1;
                  v507 = v888;
                  v505 = v882;
                  v503 = v885;
                  v532 = v882 + 24 * v885;
                  v533 = *(_QWORD *)(v532 + 16);
                  v529 = (uint64_t *)(v532 + 16);
                  v530 = v533;
                  if (v527 >= v533)
                  {
LABEL_415:
                    v534 = 2 * v530;
                    _ZF = v530 == 0;
                    v535 = 64;
                    if (!_ZF)
                      v535 = v534;
                    if (v535 <= v527)
                      v535 = v527 + 1;
                    if (v535)
                    {
                      v869 = v505 + 24 * v503;
                      v872 = v535;
                      v877 = v529;
                      v536 = malloc_type_realloc(*(void **)(v869 + 8), 4 * v535, 0xF6B6293uLL);
                      v535 = v872;
                      v505 = v882;
                      v503 = v885;
                      v508 = v891;
                      v506 = v894;
                      v507 = v888;
                      *(_QWORD *)(v869 + 8) = v536;
                      v529 = v877;
                      v509 = a1;
                      v527 = *v894;
                    }
                    *v529 = v535;
                  }
                }
                *v506 = v527 + 1;
                *(_DWORD *)(*(_QWORD *)(v505 + 24 * v503 + 8) + 4 * v527) = v507;
                v537 = *v357;
                *(_DWORD *)(*v919 + v508) = *(_DWORD *)(*v357 + 4 * v353);
                v538 = *(_QWORD *)&v968[3] + 12 * v503;
                v539 = *(_QWORD *)(v509 + 376) + 12 * *(int *)(v537 + 4 * v353);
                v540 = *(_QWORD *)v539;
                *(_DWORD *)(v538 + 8) = *(_DWORD *)(v539 + 8);
                *(_QWORD *)v538 = v540;
                *(_DWORD *)(*(_QWORD *)&v968[1] + v508) = *(_DWORD *)(*(_QWORD *)(v509 + 344)
                                                                    + 4 * *(int *)(*v357 + 4 * v353));
                goto LABEL_298;
              }
            }
LABEL_297:
            v969 = 0;
LABEL_298:
            ++v353;
            v358 += (int)v329;
            v352 += (int)v329;
          }
          while (v353 < *v356);
        }
        *(_QWORD *)&v989.tv_usec = 0;
        v989.tv_sec = 0;
        if (gettimeofday(&v989, 0) || (double)(v989.tv_usec + 1000000 * v989.tv_sec) / 1000000.0 <= 1514764800.0)
          goto LABEL_724;
        free(v970);
        v200 = (float32x2_t *)a1;
        v325 = *(_DWORD *)(a1 + 588);
        ++v953;
        v307 = v907;
        if (v953 >= v325)
          goto LABEL_438;
      }
      v977 = asin(-v337);
      v976.f64[1] = atan2(*(long double *)(v188 + 24), *(long double *)v188);
      v338 = *(double *)(v188 + 56);
      v339 = *(double *)(v188 + 64);
LABEL_285:
      v340 = atan2(v338, v339);
      goto LABEL_287;
    }
LABEL_438:
    v189 = v881;
    LODWORD(v545) = *v881;
    if (*v881 < 1)
      break;
    v546 = 0;
    v547 = 0;
    v548 = (int *)*((_QWORD *)&v967 + 1);
    v549 = 4;
    v550 = -1.0;
    do
    {
      if (*(_QWORD *)v548)
      {
        v551 = (float *)(*(_QWORD *)&v968[3] + v546);
        v552 = slam_vo_map_triangulate_track(a1, v548, *(_DWORD *)(*v919 + 4 * v547), *(_QWORD *)&v968[3] + v546);
        v200 = (float32x2_t *)a1;
        if ((float)(v552 * (float)((float)(*v910 * *(float *)(a1 + 160)) * (float)(*v910 * *(float *)(a1 + 160)))) >= v897
          || (v553 = *v551 - *(double *)(v188 + 72),
              v554 = v551[1] - *(double *)(v188 + 80),
              v555 = v551[2] - *(double *)(v188 + 88),
              v556 = *(double *)(v188 + 24) * v554 + *(double *)v188 * v553 + *(double *)(v188 + 48) * v555,
              v556 <= 0.0)
          || (v557 = v554 * *(double *)(v188 + 40) + *(double *)(v188 + 16) * v553 + *(double *)(v188 + 64) * v555,
              v558 = v554 * *(double *)(v188 + 32) + *(double *)(v188 + 8) * v553 + *(double *)(v188 + 56) * v555,
              (float)((float)((float)((float)(v557 / v556) - *(float *)(*(_QWORD *)(v188 + 368) + v549))
                            * (float)((float)(v557 / v556) - *(float *)(*(_QWORD *)(v188 + 368) + v549)))
                    + (float)((float)((float)(v558 / v556) - *(float *)(*(_QWORD *)(v188 + 368) + v549 - 4))
                            * (float)((float)(v558 / v556) - *(float *)(*(_QWORD *)(v188 + 368) + v549 - 4)))) >= v897))
        {
          *(_QWORD *)v548 = 0;
          *(_DWORD *)(*v919 + 4 * v547) = -2;
        }
      }
      ++v547;
      v545 = *v881;
      v549 += 8;
      v548 += 6;
      v546 += 12;
    }
    while (v547 < v545);
    v204 = v898;
    v559 = v880;
    if (v200[73].i32[1] > 1)
      goto LABEL_450;
LABEL_256:
    v305 = v559 + 1;
    v303 = *v875;
  }
  v550 = -1.0;
  v409 = v325 <= 1;
  v204 = v898;
  v559 = v880;
  if (v409)
    goto LABEL_256;
LABEL_450:
  if (v200[119].i32[0] > 3)
    goto LABEL_256;
  if ((int)v545 >= 1 && *(_QWORD *)&v200[49])
  {
    v560 = 0;
    v561 = *v919;
    v562 = *((_QWORD *)&v968[4] + 1);
    do
    {
      v563 = *(unsigned int *)(v561 + 4 * v560);
      if ((v563 & 0x80000000) == 0)
      {
        *(_DWORD *)(v562 + 4 * v560) = *(_DWORD *)(*(_QWORD *)&v200[50] + 4 * v563);
        LODWORD(v545) = *v881;
      }
      ++v560;
    }
    while (v560 < (int)v545);
  }
  v564 = tracker_bundle(a1, &v967, 1);
  v200 = (float32x2_t *)a1;
  if (((LODWORD(v564) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E || (LODWORD(v564) & 0x7FFFFFFFu) - 1 <= 0x7FFFFE)
  {
    v566 = *((_QWORD *)&v968[2] + 1);
    if (*((uint64_t *)&v968[2] + 1) >= (uint64_t)v967)
      v566 = v967;
    if (v566 >= 1)
    {
      v567 = 0;
      v568 = (float *)(*(_QWORD *)&v968[3] + 8);
      v569 = (_QWORD *)(*((_QWORD *)&v967 + 1) + 8);
      do
      {
        v570 = *(v569 - 1);
        if (v570)
        {
          v571 = *(float *)(a1 + 40) * *v910;
          v572 = *(unsigned int *)(*v569 + (((v570 << 32) - 0x100000000) >> 30));
          v573 = *(_QWORD *)(a1 + 304);
          v574 = (double *)(v573 + 880 * (v572 & 0x7FFF));
          if ((int)v570 >= 2)
            v571 = (float)((float)(int)v570 / (float)((float)(int)v570 + v550)) * v571;
          v575 = *(v568 - 2) - v574[9];
          v576 = *(v568 - 1) - v574[10];
          v577 = *v568 - v574[11];
          v578 = v574[3] * v576 + *v574 * v575 + v574[6] * v577;
          if (v578 <= 0.0
            || (v579 = (float *)(*(_QWORD *)(v573 + 880 * (v572 & 0x7FFF) + 368) + 8 * (v572 >> 15)),
                v580 = v576 * v574[5] + v574[2] * v575 + v574[8] * v577,
                v581 = v576 * v574[4] + v574[1] * v575 + v574[7] * v577,
                (float)((float)((float)((float)(v580 / v578) - v579[1]) * (float)((float)(v580 / v578) - v579[1]))
                      + (float)((float)((float)(v581 / v578) - *v579) * (float)((float)(v581 / v578) - *v579))) >= (float)(v571 * v571)))
          {
            *(_DWORD *)(*v919 + 4 * v567) = -2;
          }
        }
        ++v567;
        v568 += 3;
        v569 += 3;
      }
      while (v566 != v567);
    }
    goto LABEL_256;
  }
LABEL_473:
  v582 = v865 & 0x7FFF;
  if (*v189 >= 1)
  {
    v583 = 0;
    v584 = 0;
    v585 = 0;
    do
    {
      v586 = *v919;
      v587 = *(_DWORD *)(*v919 + 4 * v585);
      if (v587 == -1)
      {
        v598 = (__int128 *)(*((_QWORD *)&v967 + 1) + v583);
        if (*(_QWORD *)(*((_QWORD *)&v967 + 1) + v583) == 2)
        {
          v599 = *v874;
          *(_DWORD *)(v586 + 4 * v585) = *v874;
          v600 = **((_DWORD **)v598 + 1) & 0x7FFF;
          if (v600 == v865)
          {
            log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1967, (uint64_t)"spawn", "im(%d) == idx(%d)", v865, v865);
            __assert_rtn("spawn", "slam_tracker_vo.c", 1967, "0");
          }
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v200[38] + 880 * v600 + 400)
                    + (((unint64_t)**((unsigned int **)v598 + 1) >> 13) & 0x7FFFC)) = v599;
          v601 = (uint64_t)v200[41];
          if (v599 >= v601)
          {
            v602 = 2 * v601;
            _ZF = v601 == 0;
            v603 = 10;
            if (!_ZF)
              v603 = v602;
            if (v603 <= v599)
              v604 = v599 + 1;
            else
              v604 = v603;
            if (v604)
            {
              *(_QWORD *)(a1 + 320) = malloc_type_realloc(*(void **)(a1 + 320), 24 * v604, 0x22EB8AF2uLL);
              v200 = (float32x2_t *)a1;
              v599 = *(_QWORD *)(a1 + 312);
            }
            v200[41] = (float32x2_t)v604;
          }
          v200[39] = (float32x2_t)(v599 + 1);
          v605 = *(_QWORD *)&v200[40] + 24 * v599;
          v606 = *v598;
          *(_QWORD *)(v605 + 16) = *((_QWORD *)v598 + 2);
          *(_OWORD *)v605 = v606;
          v607 = (uint64_t)v200[46];
          v608 = (uint64_t)v200[48];
          if (v607 >= v608)
          {
            v609 = 2 * v608;
            _ZF = v608 == 0;
            v610 = 21;
            if (!_ZF)
              v610 = v609;
            if (v610 <= v607)
              v611 = v607 + 1;
            else
              v611 = v610;
            if (v611)
            {
              *(_QWORD *)(a1 + 376) = malloc_type_realloc(*(void **)(a1 + 376), 12 * v611, 0x390EB5DFuLL);
              v200 = (float32x2_t *)a1;
              v607 = *(_QWORD *)(a1 + 368);
            }
            v200[48] = (float32x2_t)v611;
          }
          v200[46] = (float32x2_t)(v607 + 1);
          v612 = *(_QWORD *)&v200[47] + 12 * v607;
          v613 = *(_QWORD *)(*(_QWORD *)&v968[3] + v584);
          *(_DWORD *)(v612 + 8) = *(_DWORD *)(*(_QWORD *)&v968[3] + v584 + 8);
          *(_QWORD *)v612 = v613;
          v614 = (uint64_t)v200[42];
          v615 = (uint64_t)v200[44];
          if (v614 >= v615)
          {
            v616 = 2 * v615;
            _ZF = v615 == 0;
            v617 = 64;
            if (!_ZF)
              v617 = v616;
            if (v617 <= v614)
              v618 = v614 + 1;
            else
              v618 = v617;
            if (v618)
            {
              *(_QWORD *)(a1 + 344) = malloc_type_realloc(*(void **)(a1 + 344), 4 * v618, 0x4D21A1F0uLL);
              v200 = (float32x2_t *)a1;
              v614 = *(_QWORD *)(a1 + 336);
            }
            v200[44] = (float32x2_t)v618;
          }
          v200[42] = (float32x2_t)(v614 + 1);
          v619 = v200[45].i32[0];
          v200[45].i32[0] = v619 + 1;
          *(_DWORD *)(*(_QWORD *)&v200[43] + 4 * v614) = v619;
          v620 = (uint64_t)v200[52];
          v621 = (uint64_t)v200[54];
          if (v620 >= v621)
          {
            v622 = 2 * v621;
            _ZF = v621 == 0;
            v623 = 64;
            if (!_ZF)
              v623 = v622;
            if (v623 <= v620)
              v624 = v620 + 1;
            else
              v624 = v623;
            if (v624)
            {
              *(_QWORD *)(a1 + 424) = malloc_type_realloc(*(void **)(a1 + 424), 4 * v624, 0x28193C7DuLL);
              v200 = (float32x2_t *)a1;
              v620 = *(_QWORD *)(a1 + 416);
            }
            v200[54] = (float32x2_t)v624;
          }
          v200[52] = (float32x2_t)(v620 + 1);
          *(_DWORD *)(*(_QWORD *)&v200[53] + 4 * v620) = v600;
          *((_QWORD *)v598 + 1) = 0;
        }
      }
      else if (v587 == -2)
      {
        *(_DWORD *)(v586 + 4 * v585) = -1;
      }
      else
      {
        v588 = *(_DWORD *)(*v919 + 4 * v585);
        v589 = v200[40];
        v590 = (uint64_t *)(*(_QWORD *)&v589 + 24 * v587);
        v591 = *(_QWORD *)&v200[47] + 12 * v587;
        v592 = *(_QWORD *)(*(_QWORD *)&v968[3] + v584);
        *(_DWORD *)(v591 + 8) = *(_DWORD *)(*(_QWORD *)&v968[3] + v584 + 8);
        *(_QWORD *)v591 = v592;
        v593 = *v590;
        v594 = v590[2];
        if (*v590 >= v594)
        {
          v595 = 2 * v594;
          _ZF = v594 == 0;
          v596 = 64;
          if (!_ZF)
            v596 = v595;
          if (v596 <= v593)
            v597 = v593 + 1;
          else
            v597 = v596;
          if (v597)
          {
            *(_QWORD *)(*(_QWORD *)&v589 + 24 * v588 + 8) = malloc_type_realloc(*(void **)(*(_QWORD *)&v589 + 24 * v588 + 8), 4 * v597, 0x62BA15E6uLL);
            v200 = (float32x2_t *)a1;
            v593 = *v590;
          }
          v590[2] = v597;
        }
        *v590 = v593 + 1;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v589 + 24 * v588 + 8) + 4 * v593) = v582;
      }
      ++v585;
      v584 += 12;
      v583 += 24;
      v582 += 0x8000;
    }
    while (v585 < *v881);
  }
  slam_tracker_vo_map_free((uint64_t)&v967);
  plq_free((uint64_t)ids);
  free(v898);
  free(v960);
  v625 = (_QWORD *)a1;
  v626 = *(_QWORD *)(a1 + 392);
  v627 = *(_QWORD *)(a1 + 368);
  if (v627 == v626)
    goto LABEL_540;
  v628 = *(_QWORD *)(a1 + 408);
  if (v627 <= v628)
  {
    v632 = v627 - v626;
    if (v627 <= v626)
      goto LABEL_538;
  }
  else
  {
    v629 = 2 * v628;
    _ZF = v628 == 0;
    v630 = 64;
    if (!_ZF)
      v630 = v629;
    if (v630 <= v627)
      v631 = *(_QWORD *)(a1 + 368);
    else
      v631 = v630;
    if (v631)
    {
      *(_QWORD *)(a1 + 400) = malloc_type_realloc(*(void **)(a1 + 400), 4 * v631, 0x92CE5E8FuLL);
      v625 = (_QWORD *)a1;
    }
    v625[51] = v631;
    v632 = v627 - v626;
    if (v627 <= v626)
    {
LABEL_538:
      v633 = v625[46];
      v625[49] = v633;
      v634 = (int)v626;
      if (v633 > (int)v626)
        goto LABEL_539;
      goto LABEL_540;
    }
  }
  bzero((void *)(v625[50] + 4 * v625[49]), 4 * v632);
  v625 = (_QWORD *)a1;
  v633 = *(_QWORD *)(a1 + 368);
  *(_QWORD *)(a1 + 392) = v633;
  v634 = (int)v626;
  if (v633 > (int)v626)
LABEL_539:
    memset((void *)(v625[50] + 4 * v634), 255, 4 * v633 - 4 * (int)v626);
LABEL_540:
  *(_QWORD *)&v979.tv_usec = 0;
  v979.tv_sec = 0;
  if (gettimeofday(&v979, 0) || (double)(v979.tv_usec + 1000000 * v979.tv_sec) / 1000000.0 <= 1514764800.0)
    goto LABEL_724;
  v635 = a1;
  if (!*(_DWORD *)(a1 + 84))
    goto LABEL_620;
  v636 = *(_QWORD *)(a1 + 304);
  v637 = *(_DWORD *)(a1 + 592);
  v967 = 0u;
  memset(v968, 0, sizeof(v968));
  *(_QWORD *)v918 = v636 + 880 * v637;
  v920 = (int *)(*(_QWORD *)v918 + 488);
  LODWORD(v638) = *(_DWORD *)(*(_QWORD *)v918 + 488);
  if ((int)v638 <= 0)
  {
    v638 = (int)v638;
  }
  else
  {
    v639 = 0;
    v899 = v637;
    v901 = v636;
    v640 = v636 + 880 * v637;
    v945 = (_QWORD *)(v640 + 400);
    v916 = (uint64_t *)(v640 + 376);
    v912 = (int *)(v640 + 416);
    v914 = (_DWORD *)(v640 + 192);
    v911 = (int *)(v640 + 420);
    v909 = (double *)(v640 + 200);
    v641 = (double *)(v640 + 208);
    v908 = (_OWORD *)(v640 + 248);
    v906 = (_OWORD *)(v640 + 216);
    v903 = (uint64_t *)(v640 + 408);
    v905 = (_OWORD *)(v640 + 232);
    v642 = *v920;
    v915 = v641;
    do
    {
      v643 = *(_DWORD *)(*v945 + 4 * v639);
      if (v643 != -1)
      {
        v644 = *(_QWORD *)(*(_QWORD *)(v635 + 320) + 24 * v643 + 8)
             + 4 * *(_QWORD *)(*(_QWORD *)(v635 + 320) + 24 * v643);
        v645 = *(_DWORD *)(v644 - 4) & 0x7FFF;
        v646 = *(_DWORD *)(v635 + 592);
        if (v645 != v646)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2294, (uint64_t)"_tracker_subpix_refine", "im(%d) != tracker->last_cam(%d)", *(_DWORD *)(v644 - 4) & 0x7FFF, v646);
          __assert_rtn("_tracker_subpix_refine", "slam_tracker_vo.c", 2294, "0");
        }
        v647 = *(unsigned int *)(v644 - 8);
        v648 = v647 & 0x7FFF;
        if (v645 == v648)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2295, (uint64_t)"_tracker_subpix_refine", "im(%d)==in_ref(%d)", v647 & 0x7FFF, v647 & 0x7FFF);
          __assert_rtn("_tracker_subpix_refine", "slam_tracker_vo.c", 2295, "0");
        }
        v649 = *(_QWORD *)(v635 + 376);
        v650 = v647 >> 15;
        v651 = *(_QWORD *)(v635 + 304);
        v652 = v651 + 880 * (v647 & 0x7FFF);
        v653 = *(_DWORD *)(v635 + 88);
        v654 = *v916;
        v655 = (float *)(*v916 + 8 * v639);
        v656 = *(_QWORD *)v655;
        v657 = *(_QWORD *)(v652 + 376);
        LODWORD(v966) = 0;
        v965[0] = 0.0;
        v658 = *(_DWORD *)(*(_QWORD *)(v652 + 400) + 4 * (v647 >> 15));
        if (v658 != v643)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2218, (uint64_t)"_tracker_match_subpix_refine", "track[kpt_ref](%d) != trk(%d)", v658, v643);
          __assert_rtn("_tracker_match_subpix_refine", "slam_tracker_vo.c", 2218, "0");
        }
        if (v653 >= 33)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2219, (uint64_t)"_tracker_match_subpix_refine", "patch_w > max_w");
          __assert_rtn("_tracker_match_subpix_refine", "slam_tracker_vo.c", 2219, "0");
        }
        v659 = v653;
        v969 = &v979;
        v971 = v653;
        HIDWORD(v970) = v653;
        LODWORD(v970) = v653;
        v660 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)(v652 + 72), vcvtq_f64_f32(*(float32x2_t *)(v649 + 12 * v643))));
        v661 = *(double *)(v652 + 88) - *(float *)(v649 + 12 * v643 + 8);
        v662 = sqrt((float)(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v660, v660).i32[1]), v660.f32[0], v660.f32[0])
                          + (float)(v661 * v661)));
        v961 = v655;
        if (v662 <= 0.0)
        {
          *(double *)&v663 = 0.0;
          v664 = 0.0;
        }
        else
        {
          v663 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v660), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v662, 0)));
          v664 = v661 / v662;
        }
        v949 = v657;
        v954 = (float *)(v649 + 12 * v643);
        v936 = v653;
        v940 = v654;
        v923 = v656;
        memset(v990, 0, sizeof(v990));
        v989 = (timeval)0;
        v972 = *(double *)&v663;
        v973 = v664;
        v665 = v651 + 880 * v648;
        v666 = *(_DWORD *)(v665 + 416);
        v667 = *(_DWORD *)(v665 + 420);
        v930 = v665;
        LODWORD(v989.tv_sec) = *(_DWORD *)(v665 + 192);
        v668 = v665;
        if ((v989.tv_sec & 0xFFFFFFFC) == 0xC)
        {
          v669 = *(double *)(v665 + 200);
          v670 = 1.0 / tan(v669 * 0.5);
          v671 = *(double *)(v668 + 208) / v669;
        }
        else
        {
          v672 = tan(*(double *)(v665 + 200) * 0.5);
          v670 = (double)v666 / (v672 + v672);
          v673 = tan(*(double *)(v668 + 208) * 0.5);
          v671 = (double)v667 / (v673 + v673);
        }
        *(double *)&v989.tv_usec = v670;
        *(double *)v990 = v671;
        v674 = v651 + 880 * v648;
        v676 = *(_OWORD *)(v674 + 200);
        v675 = v674 + 200;
        *(_OWORD *)((char *)v990 + 8) = v676;
        v677 = *(_OWORD *)(v675 + 64);
        *(_OWORD *)((char *)&v990[3] + 8) = *(_OWORD *)(v675 + 48);
        *(_OWORD *)((char *)&v990[4] + 8) = v677;
        v678 = *(_OWORD *)(v675 + 80);
        v679 = *(_OWORD *)(v675 + 96);
        v680 = *(_OWORD *)(v675 + 128);
        *(_OWORD *)((char *)&v990[7] + 8) = *(_OWORD *)(v675 + 112);
        *(_OWORD *)((char *)&v990[8] + 8) = v680;
        *(_OWORD *)((char *)&v990[5] + 8) = v678;
        *(_OWORD *)((char *)&v990[6] + 8) = v679;
        *(_OWORD *)((char *)&v990[1] + 8) = *(_OWORD *)(v675 + 16);
        *(_OWORD *)((char *)&v990[2] + 8) = *(_OWORD *)(v675 + 32);
        *((_QWORD *)&v990[9] + 1) = __PAIR64__(v667, v666);
        if (*(double *)(v675 + 8) == 0.0)
          *(_QWORD *)&v990[1] = 0;
        if (*(double *)v675 == 0.0)
          *((_QWORD *)&v990[0] + 1) = 0;
        v681 = (float32x2_t *)(v949 + 8 * v650);
        _jac_patch_to_improj2(v975.f64, v954, (float *)&v972, (double *)v652, (uint64_t)&v989, v681->f32[0], v681->f32[1]);
        v950 = v975;
        v926 = v976;
        v682 = *v912;
        v683 = *v911;
        LODWORD(v989.tv_sec) = *v914;
        if ((v989.tv_sec & 0xFFFFFFFC) == 0xC)
        {
          v684 = *v909;
          v685 = 1.0 / tan(*v909 * 0.5);
          v686 = v915;
          v687 = *v915 / v684;
        }
        else
        {
          v688 = tan(*v909 * 0.5);
          v686 = v915;
          v685 = (double)v682 / (v688 + v688);
          v689 = tan(*v915 * 0.5);
          v687 = (double)v683 / (v689 + v689);
        }
        *(double *)&v989.tv_usec = v685;
        *(double *)v990 = v687;
        *(_OWORD *)((char *)v990 + 8) = *(_OWORD *)v909;
        v690 = v908[1];
        *(_OWORD *)((char *)&v990[3] + 8) = *v908;
        *(_OWORD *)((char *)&v990[4] + 8) = v690;
        v691 = v908[2];
        v692 = v908[3];
        v693 = v908[5];
        *(_OWORD *)((char *)&v990[7] + 8) = v908[4];
        *(_OWORD *)((char *)&v990[8] + 8) = v693;
        *(_OWORD *)((char *)&v990[5] + 8) = v691;
        *(_OWORD *)((char *)&v990[6] + 8) = v692;
        *(_OWORD *)((char *)&v990[1] + 8) = *v906;
        *(_OWORD *)((char *)&v990[2] + 8) = *v905;
        *((_QWORD *)&v990[9] + 1) = __PAIR64__(v683, v682);
        if (*v686 == 0.0)
          *(_QWORD *)&v990[1] = 0;
        if (*v909 == 0.0)
          *((_QWORD *)&v990[0] + 1) = 0;
        _jac_patch_to_improj2(v975.f64, v954, (float *)&v972, *(double **)v918, (uint64_t)&v989, *v961, v961[1]);
        v696 = fabs(v975.f64[0] * v976.f64[1] - v976.f64[0] * v975.f64[1]);
        if (v696 <= 0x7FF0000000000000 && v696 != 0x7FF0000000000000 && v696 != 0)
        {
          if (v936 >= 1)
          {
            v699 = 0;
            v700 = v651 + 880 * v648;
            v701 = (int *)(v930 + 416);
            v702 = (int *)(v930 + 420);
            v703 = 1.0 / (v975.f64[0] * v976.f64[1] - v976.f64[0] * v975.f64[1]);
            v704 = (uint64_t *)(v700 + 408);
            v705 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)0, v950, v976.f64[1] * v703), v926, -(v975.f64[1] * v703)));
            v706 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)0, v950, -(v976.f64[0] * v703)), v926, v975.f64[0] * v703));
            v707 = (uint64_t *)(v700 + 424);
            v708 = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*v681), vcvtq_f64_f32(vadd_f32(v705, v706)), (float)((float)v936 + -1.0) * -0.5));
            v709 = &v979;
            do
            {
              v710 = *v704;
              v711 = *v707;
              v712 = v709;
              v713 = v659;
              v714 = v708;
              do
              {
                v728 = (int)v714.f32[0];
                if ((int)v714.f32[0] < 0)
                {
                  if (v728 != -1)
                  {
                    v730 = 0;
                    v731 = 0;
                    v732 = v714.f32[1];
                    v733 = (int)v714.f32[1];
                    if (((int)v714.f32[1] & 0x80000000) == 0)
                      goto LABEL_580;
                    goto LABEL_599;
                  }
                  v730 = 0;
                  v729 = *v701 - 1;
                }
                else
                {
                  v729 = *v701 - 1;
                  if (*v701 <= v728)
                    v730 = *v701 - 1;
                  else
                    v730 = (int)v714.f32[0];
                }
                if (v729 <= v728)
                  LODWORD(v731) = v729;
                else
                  LODWORD(v731) = v728 + 1;
                v731 = (int)v731;
                v732 = v714.f32[1];
                v733 = (int)v714.f32[1];
                if (((int)v714.f32[1] & 0x80000000) == 0)
                {
LABEL_580:
                  v715 = *v702 - 1;
                  if (*v702 <= v733)
                    v716 = *v702 - 1;
                  else
                    v716 = v733;
                  goto LABEL_583;
                }
LABEL_599:
                if (v733 != -1)
                {
                  v716 = 0;
                  v717 = 0;
                  goto LABEL_587;
                }
                v716 = 0;
                v715 = *v702 - 1;
LABEL_583:
                if (v715 <= v733)
                  LODWORD(v717) = v715;
                else
                  LODWORD(v717) = v733 + 1;
                v717 = (int)v717;
LABEL_587:
                *(float *)&v718 = (float)v716;
                v719 = v732 - (float)v716;
                v720 = v717 * v711;
                LOBYTE(v718) = *(_BYTE *)(v710 + v720 + v730);
                v721 = (float)v718;
                v722 = v711 * v716;
                LOBYTE(v694) = *(_BYTE *)(v710 + v722 + v730);
                v694 = (float)LODWORD(v694);
                v723 = v721 - v694;
                LOBYTE(v695) = *(_BYTE *)(v710 + v720 + v731);
                *(float *)&v724 = v694 + (float)LODWORD(v695);
                v725 = *(float *)&v724 - v721;
                LOBYTE(v724) = *(_BYTE *)(v710 + v722 + v731);
                v726 = (float)v724;
                v727 = v725 - v726;
                v695 = v726 - v694;
                LOBYTE(v712->tv_sec) = (int)(float)((float)((float)((float)((float)(v714.f32[0] - (float)v730) * v695)
                                                                  + (float)((float)((float)(v714.f32[0] - (float)v730)
                                                                                  * v719)
                                                                          * v727))
                                                          + (float)(v719 * v723))
                                                  + v694);
                v712 = (timeval *)((char *)v712 + 1);
                v714 = vadd_f32(v714, v705);
                --v713;
              }
              while (v713);
              v708 = vadd_f32(v708, v706);
              ++v699;
              v709 = (timeval *)((char *)v709 + v659);
            }
            while (v699 != v659);
          }
          v734 = v940 + 8 * v639;
          v735 = p_klt(v903, (uint64_t *)&v969, (float *)&v966, v965, 5, *v961, *(float *)(v734 + 4));
          *v961 = *(float *)&v966;
          *(float *)(v734 + 4) = v965[0];
          if (v735 > 1000000.0)
            *(_QWORD *)v961 = v923;
        }
        v642 = *v920;
        v635 = a1;
      }
      ++v639;
      v638 = v642;
    }
    while (v639 < v642);
    v637 = v899;
    v636 = v901;
  }
  v736 = v636 + 880 * v637;
  memcpy(*(void **)(v736 + 368), *(const void **)(v736 + 376), 8 * v638);
  v737 = *(_DWORD *)(v736 + 480);
  v738 = *(_DWORD *)(v736 + 484);
  LODWORD(v967) = *(_DWORD *)(v736 + 192);
  if ((v967 & 0xFFFFFFFC) == 0xC)
  {
    v739 = *(double *)(v736 + 200);
    v740 = 1.0 / tan(v739 * 0.5);
    v741 = *(double *)(v736 + 208) / v739;
  }
  else
  {
    v742 = tan(*(double *)(v736 + 200) * 0.5);
    v740 = (double)v737 / (v742 + v742);
    v743 = tan(*(double *)(v736 + 208) * 0.5);
    v741 = (double)v738 / (v743 + v743);
  }
  *((double *)&v967 + 1) = v740;
  *(double *)v968 = v741;
  v744 = v636 + 880 * v637;
  v746 = *(_OWORD *)(v744 + 200);
  v745 = v744 + 200;
  *(_OWORD *)((char *)v968 + 8) = v746;
  v747 = *(_OWORD *)(v745 + 48);
  *(_OWORD *)((char *)&v968[4] + 8) = *(_OWORD *)(v745 + 64);
  *(_OWORD *)((char *)&v968[3] + 8) = v747;
  v748 = *(_OWORD *)(v745 + 80);
  v749 = *(_OWORD *)(v745 + 96);
  v750 = *(_OWORD *)(v745 + 112);
  *(_OWORD *)((char *)&v968[8] + 8) = *(_OWORD *)(v745 + 128);
  *(_OWORD *)((char *)&v968[7] + 8) = v750;
  *(_OWORD *)((char *)&v968[6] + 8) = v749;
  *(_OWORD *)((char *)&v968[5] + 8) = v748;
  *(_OWORD *)((char *)&v968[1] + 8) = *(_OWORD *)(v745 + 16);
  *(_OWORD *)((char *)&v968[2] + 8) = *(_OWORD *)(v745 + 32);
  *((_QWORD *)&v968[9] + 1) = __PAIR64__(v738, v737);
  if (*(double *)(v745 + 8) == 0.0)
    *(_QWORD *)&v968[1] = 0;
  if (*(double *)v745 == 0.0)
    *((_QWORD *)&v968[0] + 1) = 0;
  rectify_pts((uint64_t)&v967, *(float32x2_t **)(v736 + 368), *v920, (float *)(v636 + 880 * v637 + 344));
  *(_QWORD *)&v979.tv_usec = 0;
  v979.tv_sec = 0;
  if (gettimeofday(&v979, 0) || (double)(v979.tv_usec + 1000000 * v979.tv_sec) / 1000000.0 <= 1514764800.0)
    goto LABEL_724;
  v635 = a1;
LABEL_620:
  if (*(int *)(v635 + 128) >= 1)
  {
    v751 = 0;
    do
    {
      if (*(int *)(v635 + 588) < 2 || *(int *)(v635 + 952) > 3)
        break;
      v752 = tracker_bundle(a1, v874, *(_DWORD *)(v635 + 140));
      v635 = a1;
      v753 = LODWORD(v752) & 0x7FFFFFFF;
      v754 = (LODWORD(v752) & 0x7FFFFFFFu) > 0x7F800000 || v753 == 2139095040;
      if (v754 || v753 == 0)
        break;
      v756 = *(_QWORD *)(a1 + 368);
      v757 = *(_QWORD *)(a1 + 312);
      if (v756 < v757)
        v757 = *(_QWORD *)(a1 + 368);
      if (v757 >= 1)
      {
        v955 = v751;
        v758 = 0;
        v759 = a1;
        v760 = (float *)(v863 + 880 * v864 + 360);
        do
        {
          v762 = *(_QWORD *)(v759 + 320);
          v763 = (uint64_t *)(v762 + 24 * v758);
          v764 = *(float *)(v759 + 40) * *v760;
          v765 = *v763;
          if ((int)*v763 >= 2)
            v764 = v764 * (float)((float)(int)v765 / (float)((float)(int)v765 + -1.0));
          if (v765 < 1)
          {
            v766 = 0;
          }
          else
          {
            v766 = 0;
            v767 = *(unsigned int **)(v762 + 24 * v758 + 8);
            v768 = *(_QWORD *)(v759 + 304);
            v769 = *(float *)(*(_QWORD *)(v759 + 376) + 12 * v758);
            v770 = *(_QWORD *)(v759 + 376) + 12 * v758;
            v771 = *(float *)(v770 + 4);
            v772 = *(float *)(v770 + 8);
            v773 = v764 * v764;
            v774 = v767;
            v775 = *v763;
            do
            {
              while (1)
              {
                v777 = *v774++;
                v776 = v777;
                v778 = v777 & 0x7FFF;
                v779 = (unint64_t)v777 >> 15;
                v780 = (double *)(v768 + 880 * (v777 & 0x7FFF));
                v781 = v769 - v780[9];
                v782 = v771 - v780[10];
                v783 = v772 - v780[11];
                v784 = v780[3] * v782 + *v780 * v781 + v780[6] * v783;
                if (v784 > 0.0)
                {
                  v785 = v780[4];
                  v786 = v780[1];
                  v787 = v780[7];
                  v788 = v782 * v780[5] + v780[2] * v781 + v780[8] * v783;
                  v789 = (float *)(*(_QWORD *)(v768 + 880 * v778 + 368) + 8 * v779);
                  *(float *)&v788 = v788;
                  v790 = v782 * v785 + v786 * v781 + v787 * v783;
                  if ((float)((float)((float)((float)(*(float *)&v788 / v784) - v789[1])
                                     * (float)((float)(*(float *)&v788 / v784) - v789[1]))
                             + (float)((float)((float)(v790 / v784) - *v789) * (float)((float)(v790 / v784) - *v789))) < v773)
                    break;
                }
                *(_DWORD *)(*(_QWORD *)(v768 + 880 * v778 + 400) + 4 * v779) = -1;
                if (!--v775)
                  goto LABEL_649;
              }
              v767[v766++] = v776;
              --v775;
            }
            while (v775);
          }
LABEL_649:
          v791 = v766;
          v792 = v762 + 24 * v758;
          v795 = *(_QWORD *)(v792 + 16);
          v794 = (uint64_t *)(v792 + 16);
          v793 = v795;
          if (v795 < v791)
          {
            v796 = 2 * v793;
            _ZF = v793 == 0;
            v797 = 64;
            if (!_ZF)
              v797 = v796;
            if (v797 <= v791)
              v798 = v791;
            else
              v798 = v797;
            if (v798)
            {
              *(_QWORD *)(v762 + 24 * v758 + 8) = malloc_type_realloc(*(void **)(v762 + 24 * v758 + 8), 4 * v798, 0xD0B74C21uLL);
              v759 = a1;
              v760 = (float *)(v863 + 880 * v864 + 360);
            }
            *v794 = v798;
          }
          if (v791 > v765)
          {
            bzero((void *)(*(_QWORD *)(v762 + 24 * v758 + 8) + 4 * *v763), 4 * (v791 - v765));
            v759 = a1;
          }
          *v763 = v791;
          ++v758;
          v756 = *(_QWORD *)(v759 + 368);
          v761 = *(_QWORD *)(v759 + 312);
          if (v756 < v761)
            v761 = *(_QWORD *)(v759 + 368);
        }
        while (v758 < v761);
        v751 = v955;
      }
      v799 = *(int *)(a1 + 260);
      v800 = *(_DWORD *)(a1 + 592);
      v801 = *(_DWORD *)a1;
      v802 = (unsigned __int8 *)malloc_type_malloc(v756, 0xD7518E5FuLL);
      v803 = v802;
      if (*(uint64_t *)(a1 + 312) >= 1)
      {
        v804 = 0;
        v805 = 0;
        do
        {
          v809 = *(_QWORD *)(a1 + 320);
          v810 = *(_QWORD *)(v809 + v804);
          if (v810)
            v806 = **(_DWORD **)(v809 + v804 + 8) & 0x7FFF;
          else
            v806 = -1;
          v808 = v810 < v799 && v806 != (v800 + 1) % v801;
          v802[v805++] = v808;
          v804 += 24;
        }
        while (*v874 > v805);
      }
      remove_map_points(a1, v802);
      free(v803);
      v635 = a1;
      ++v751;
    }
    while (v751 < *(_DWORD *)(a1 + 128));
  }
  if (*(_DWORD *)(v635 + 300))
  {
    v811 = *v874;
    if (*v874)
    {
      if (v811 < 1)
      {
        v814 = 0.0;
        v815 = *(_QWORD *)(v635 + 928);
        v816 = *(_QWORD *)(v635 + 944);
        if (v815 >= v816)
          goto LABEL_688;
      }
      else
      {
        if ((unint64_t)v811 >= 9)
        {
          v817 = *v874 & 7;
          if ((v811 & 7) == 0)
            v817 = 8;
          v812 = v811 - v817;
          v818 = 0uLL;
          v819 = v812;
          v820 = *(const double **)(v635 + 320);
          v821 = 0uLL;
          do
          {
            v822 = v820 + 12;
            v823 = v820;
            v824 = (unsigned __int128)vld3q_f64(v823);
            v823 += 6;
            v825 = (unsigned __int128)vld3q_f64(v823);
            v826 = (unsigned __int128)vld3q_f64(v822);
            v827 = v820 + 18;
            v828 = (unsigned __int128)vld3q_f64(v827);
            v818 = vaddq_s32(v818, vuzp1q_s32((int32x4_t)v824, (int32x4_t)v825));
            v821 = vaddq_s32(v821, vuzp1q_s32((int32x4_t)v826, (int32x4_t)v828));
            v820 += 24;
            v819 -= 8;
          }
          while (v819);
          v813 = vaddvq_s32(vaddq_s32(v821, v818));
        }
        else
        {
          v812 = 0;
          v813 = 0;
        }
        v829 = v811 - v812;
        v830 = (int *)(*(_QWORD *)(v635 + 320) + 24 * v812);
        do
        {
          v831 = *v830;
          v830 += 6;
          v813 += v831;
          --v829;
        }
        while (v829);
        v814 = (float)v813;
        v815 = *(_QWORD *)(v635 + 928);
        v816 = *(_QWORD *)(v635 + 944);
        if (v815 >= v816)
        {
LABEL_688:
          v832 = 2 * v816;
          _ZF = v816 == 0;
          v833 = 64;
          if (!_ZF)
            v833 = v832;
          if (v833 <= v815)
            v834 = v815 + 1;
          else
            v834 = v833;
          if (v834)
          {
            *(_QWORD *)(a1 + 936) = malloc_type_realloc(*(void **)(a1 + 936), 4 * v834, 0xCAFCB628uLL);
            v635 = a1;
            v815 = *(_QWORD *)(a1 + 928);
            v811 = *(_QWORD *)(a1 + 312);
          }
          *(_QWORD *)(v635 + 944) = v834;
        }
      }
      *(_QWORD *)(v635 + 928) = v815 + 1;
      *(float *)(*(_QWORD *)(v635 + 936) + 4 * v815) = v814 / (float)v811;
    }
  }
  v835 = *(double *)(*(_QWORD *)(v635 + 304) + 880 * *(int *)(v635 + 592) + 504);
  if (v835 > *(double *)(v635 + 600) + *(double *)(v635 + 8))
  {
    if (*(int *)(v635 + 588) >= 1)
    {
      v836 = 0;
      v837 = 0;
      do
      {
        g_norm_rot3((double *)(*(_QWORD *)(v635 + 304) + v836));
        v635 = a1;
        ++v837;
        v836 += 880;
      }
      while (v837 < *(int *)(a1 + 588));
      v835 = *(double *)(*(_QWORD *)(a1 + 304) + 880 * *(int *)(a1 + 592) + 504);
    }
    *(double *)(v635 + 600) = v835;
  }
  v838 = *(_DWORD *)(v635 + 296);
  if (v838 != -1 && (v838 & 0x80000000) == 0 && *(_DWORD *)(v635 + 588) > *(_DWORD *)(v635 + 140))
  {
    v839 = -1;
    do
      ++v839;
    while (v839 < v838);
  }
  v840 = *(float *)(v635 + 288);
  if (v840 > 0.0)
  {
    v841 = *(_QWORD *)(v635 + 304);
    v842 = *(_DWORD *)(v635 + 592);
    v843 = *(unsigned int *)(v841 + 880 * v842 + 488);
    if ((int)v843 < 1)
    {
      if ((float)(v840 * (float)(int)v843) > 0.0)
        goto LABEL_720;
    }
    else
    {
      v844 = *(int32x4_t **)(v841 + 880 * v842 + 400);
      if (v843 < 8)
      {
        v845 = 0;
        v846 = 0;
        goto LABEL_717;
      }
      v845 = v843 & 0x7FFFFFF8;
      v847 = v844 + 1;
      v848 = 0uLL;
      v849.i64[0] = -1;
      v849.i64[1] = -1;
      v850 = v843 & 0xFFFFFFF8;
      v851 = 0uLL;
      do
      {
        v848 = vsubq_s32(v848, vcgtq_s32(v847[-1], v849));
        v851 = vsubq_s32(v851, vcgtq_s32(*v847, v849));
        v847 += 2;
        v850 -= 8;
      }
      while (v850);
      v846 = vaddvq_s32(vaddq_s32(v851, v848));
      if (v845 != v843)
      {
LABEL_717:
        v852 = v843 - v845;
        v853 = &v844->i32[v845];
        do
        {
          v854 = *v853++;
          v846 += v854 >= 0;
          --v852;
        }
        while (v852);
      }
      if ((float)(v840 * (float)(int)v843) > (float)v846)
LABEL_720:
        *(_DWORD *)(v841 + 880 * v842 + 872) = 1;
    }
  }
  *(_QWORD *)&v979.tv_usec = 0;
  v979.tv_sec = 0;
  if (gettimeofday(&v979, 0) || (double)(v979.tv_usec + 1000000 * v979.tv_sec) / 1000000.0 <= 1514764800.0)
LABEL_724:
    __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
  return *(_QWORD *)(a1 + 304) + 880 * *(int *)(a1 + 592);
}

float tracker_bundle(uint64_t a1, _QWORD *a2, int a3)
{
  size_t v3;
  float v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  int v15;
  int32x2_t *v16;
  void **v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  void **v20;
  uint64_t v21;
  void **v22;
  unsigned __int8 *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  int v27;
  int v28;
  char *v29;
  uint64_t i;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t v35;
  _DWORD *v36;
  uint64_t v38;
  float64x2_t *v39;
  float32x4_t *v40;
  unsigned __int8 *v41;
  float64x2_t v42;
  float64x2_t v43;
  int32x2_t *v44;
  int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  uint64_t v59;
  char *v60;
  char *v61;
  float32x2_t *v62;
  float32_t v63;
  double v64;
  float v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  float v71;
  float v72;
  int v73;
  int v74;
  uint64_t v75;
  int v76;
  __int128 v77;
  float v78;
  float v79;
  float v80;
  unsigned __int8 *v81;
  size_t v82;
  float v83;
  int v84;
  uint64_t v85;
  int v86;
  double v87;
  double v88;
  int v89;
  double v90;
  uint64_t v91;
  char *v92;
  float32x2_t **v93;
  float64x2_t *v94;
  uint64_t v95;
  float v96;
  float v97;
  float v98;
  int v99;
  float32x2_t *v100;
  float32x2_t *v101;
  float32x4_t v102;
  float32x4_t v103;
  float32_t v104;
  int v105;
  float v106;
  float v107;
  int v108;
  float v109;
  int v110;
  char *v111;
  char *v112;
  char *v113;
  float *v114;
  uint64_t v115;
  double v116;
  float v117;
  float v118;
  float v119;
  char *v120;
  int v121;
  int v122;
  int v123;
  int v124;
  _QWORD *v125;
  int v126;
  int v127;
  int v128;
  int32x2_t *v129;
  float v130;
  float v131;
  uint64_t v132;
  unsigned __int8 *v133;
  size_t v134;
  int v135;
  int v136;
  uint64_t v137;
  char *v138;
  float *v139;
  double v140;
  uint64_t v141;
  double v142;
  char *v143;
  __int128 *v144;
  _OWORD *v145;
  __int128 v146;
  __int128 v147;
  int v148;
  _DWORD *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t j;
  int v153;
  int v154;
  uint64_t v155;
  unsigned __int8 *v156;
  size_t v157;
  float v158;
  int v159;
  uint64_t v160;
  int v161;
  double v162;
  double v163;
  int v164;
  double v165;
  char *v166;
  float *v167;
  float **v168;
  float *v169;
  double *v170;
  double v171;
  double v172;
  float v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  uint64_t v183;
  void **v184;
  int v185;
  void **v186;
  uint64_t *v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  uint64_t v198;
  float *v199;
  _QWORD *v200;
  void **v201;
  uint64_t *v202;
  uint64_t *v203;
  void **v204;
  float v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  double *v215;
  float v216;
  void **v217;
  uint64_t v218;
  uint64_t v219;
  unsigned __int8 *v220;
  void **v221;
  int v222;
  BOOL v223;
  void **v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  int v228;
  _QWORD *v229;
  int v230;
  int v231;
  int v232;
  float v233;
  uint64_t v234;
  float v235;
  int v236;
  float v237;
  float v238;
  uint64_t v239;
  uint64_t v240;
  int v241;
  unsigned __int8 *v242;
  float *v244;
  float v245;
  uint64_t v246;
  float *v247;
  float v248;
  float v249;
  float *v250;
  float v251;
  float v252;
  float *v253;
  float v254;
  float v255;
  float v256;
  float64x2_t *v257;
  float64x2_t *v258;
  float32x2_t *v259;
  size_t v260;
  unint64_t v261;
  int v262;
  double *f64;
  float v264;
  float v265;
  float v266;
  float v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float64x2_t *v273;
  float32x4_t *v274;
  float64x2_t *v275;
  char *v276;
  float v277;
  float v278;
  float v279;
  float v280;
  float v281;
  float v282;
  float v283;
  float v284;
  float v285;
  float v286;
  float v287;
  float v288;
  float v289;
  float v290;
  float v291;
  float v292;
  float v293;
  float v294;
  float v295;
  float v296;
  float v297;
  float v298;
  float v299;
  float v300;
  float v301;
  float v302;
  float v303;
  float v304;
  float v305;
  float v306;
  float v307;
  float v308;
  float v309;
  float v310;
  float v311;
  float v312;
  float v313;
  float v314;
  float v315;
  float v316;
  float v317;
  float v318;
  float v319;
  float v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  unint64_t v326;
  float v327;
  float v328;
  float32x4_t v329;
  float32_t v330;
  float32_t v331;
  float v332;
  float32_t v333;
  float32_t v334;
  float32_t v335;
  float32_t v336;
  float32_t v337;
  float v338;
  float32_t v339;
  float32_t v340;
  float32_t v341;
  float32_t v342;
  float32_t v343;
  float v344;
  float32_t v345;
  float32_t v346;
  float32_t v347;
  float32_t v348;
  float32_t v349;
  float v350;
  float32_t v351;
  float32_t v352;
  float32_t v353;
  float32_t v354;
  float32_t v355;
  float v356;
  unsigned int v357;
  void *v358;
  uint64_t v359;
  void **v360;
  void *v361;
  void **v362;
  void *v363;
  _QWORD *v364;
  BOOL v365;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  _QWORD *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  void *v378;
  uint64_t v380;
  uint64_t v381;
  int v382;
  uint64_t v383;
  int v384;
  uint64_t v385;
  int v386;
  char *v387;
  int v388;
  uint64_t v389;
  int32x2_t *v390;
  float v391;
  int v392;
  unsigned __int8 *v393;
  uint64_t v394;
  void **v395;
  float v396;
  size_t v397;
  float v398;
  float v399;
  float *v400;
  float v401;
  char *v402;
  _DWORD *v403;
  float v404;
  uint64_t v405;
  float v406;
  unsigned __int8 *v407;
  float v408;
  float v410;
  int v411;
  int v412;
  int32x2_t *v413;
  float *v414;
  float v415;
  char *v416;
  float *v417;
  float v418;
  char *v419;
  float *v420;
  float32x4_t v421;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  float32x4_t v426;
  float32x4_t v427;
  float32x4_t v428;
  __int128 v429;
  uint64_t v430;
  uint64_t v431;
  int v432;
  int32x2_t v433;
  int v434;
  __int128 v435;
  int v436;
  __int128 v437;
  uint64_t v438;
  int v439;
  _OWORD v440[2];
  float32x4_t v441;
  _DWORD v442[3];
  uint64_t v443;
  _QWORD v444[2];
  int v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  int v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  int v453;
  float32x4_t v454;
  float v455;
  _DWORD v456[33];
  uint64_t v457;

  v457 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned int *)(a1 + 588);
  v4 = 0.0;
  if ((int)v3 < 2)
    return v4;
  v5 = *(_DWORD *)(a1 + 132);
  v434 = 0;
  v6 = a2[7];
  v7 = (v5 << 31 >> 31) & a3;
  v8 = a3 & (v5 << 30 >> 31);
  v9 = a3 & (v5 << 29 >> 31);
  v10 = a3 & (v5 << 28 >> 31);
  v11 = v5 << 26;
  if ((v5 & 0x10) != 0)
    v12 = 2 * v3 + 3;
  else
    v12 = v3;
  v386 = v9;
  v384 = v10;
  v382 = (a3 + 1) & (v11 >> 31);
  v13 = v7 + v8 + v9 + v10 + v382;
  if (v382)
    v14 = v12 + 1;
  else
    v14 = v12;
  v15 = a3;
  v387 = (char *)malloc_type_malloc(48 * v3, 0x1000040EED21634uLL);
  v383 = v14;
  v16 = (int32x2_t *)malloc_type_malloc(32 * (int)v14, 0x1080040D47BEB4BuLL);
  v394 = v6;
  v17 = (void **)malloc_type_calloc((int)v6, 0x50uLL, 0x10B00409D415480uLL);
  v18 = (unsigned __int8 *)malloc_type_malloc(v3, 0x100004077774924uLL);
  v381 = (int)v6;
  v19 = (unsigned __int8 *)malloc_type_calloc((int)v6, 1uLL, 0x100004077774924uLL);
  v385 = v13;
  v20 = (void **)malloc_type_calloc(v13, 0x50uLL, 0x1080040DF7CDACAuLL);
  v429 = 0u;
  v430 = 0;
  v432 = 0;
  *(_QWORD *)((char *)&v429 + 4) = 0x100000005;
  v431 = 0x7F8000003727C5ACLL;
  v433 = vdup_n_s32(0x7F800000u);
  v438 = 0;
  v439 = 0;
  v437 = 0uLL;
  v435 = 0uLL;
  v436 = 0;
  v405 = v6;
  v388 = v15;
  if (!(v13 + (_DWORD)v6))
  {
    v21 = v13;
    v22 = v20;
    v23 = v19;
    v24 = v387;
    if ((int)v6 < 1)
      goto LABEL_194;
LABEL_191:
    v357 = v6;
    v358 = v24;
    v359 = v357;
    v360 = v17 + 4;
    do
    {
      free(*(v360 - 3));
      v361 = *v360;
      v360 += 10;
      free(v361);
      --v359;
    }
    while (v359);
    v24 = v358;
    goto LABEL_194;
  }
  v389 = (uint64_t)v20;
  v25 = (char *)&v20[10 * v7];
  v402 = &v25[80 * v8];
  if (v15 >= (int)v3)
    v15 = v3;
  memset(v18, 1, v3);
  v26 = a1;
  v27 = v8;
  if (v15 >= 1)
  {
    v28 = 0;
    do
      v18[((int)v3 + v28-- + *(_DWORD *)(a1 + 592)) % (int)v3] = 0;
    while (-v15 != v28);
  }
  v419 = &v402[80 * v386];
  v397 = v3;
  v18[(*(_DWORD *)(a1 + 592) + 1) % (int)v3] = 1;
  v23 = v19;
  v29 = v25;
  if ((int)v405 >= 1)
  {
    for (i = 0; i != v394; ++i)
    {
      v31 = a2[1];
      v32 = (uint64_t *)(v31 + 24 * i);
      v33 = *v32;
      if (*v32 > 1 || (v19[i] = 1, v33 = *v32, *v32 >= 1))
      {
        v34 = *(_DWORD **)(v31 + 24 * i + 8);
        if (!v18[*v34 & 0x7FFF])
          continue;
        v35 = 0;
        v36 = v34 + 1;
        while (v33 - 1 != v35)
        {
          if (!v18[v36[v35++] & 0x7FFF])
          {
            if (v33 <= v35)
              break;
            goto LABEL_19;
          }
        }
      }
      v19[i] = 1;
LABEL_19:
      ;
    }
  }
  v38 = 0;
  v416 = &v419[80 * v384];
  v39 = (float64x2_t *)(*(_QWORD *)(a1 + 304) + 64);
  v40 = (float32x4_t *)v387;
  v41 = v18;
  do
  {
    *v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39[-4]), v39[-3]);
    v40[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39[-2]), v39[-1]);
    v43 = *v39;
    v42 = v39[1];
    v39 += 55;
    v40[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v43), v42);
    v44 = &v16[v38];
    *v44 = (int32x2_t)v40;
    v44[1].i32[0] = 48;
    if (*v41++)
      v46 = 0;
    else
      v46 = 6;
    v44[2].i32[0] = v46;
    v44[3] = (int32x2_t)bon_upd_cs;
    v38 += 4;
    v40 += 3;
  }
  while (4 * v397 != v38);
  v407 = v18;
  v393 = v19;
  v390 = v16;
  v395 = v17;
  v380 = v405 << 32;
  if (v27 >= 1)
  {
    v411 = v7;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 1.0 / *(float *)(a1 + 164);
    v51 = 1.0 / *(float *)(a1 + 168);
    do
    {
      if (!v18[v48])
      {
        v59 = *(_QWORD *)(v26 + 304);
        if (!*(_DWORD *)(v26 + 136) || !*(_DWORD *)(v59 + v47 + 520))
        {
          *(_QWORD *)&v29[80 * v49] = bon_eval_fnc_abspose;
          v60 = &v29[80 * v49];
          *((_DWORD *)v60 + 5) = -1;
          *((_DWORD *)v60 + 6) = v48;
          *((_DWORD *)v60 + 16) = 1;
          v61 = (char *)malloc_type_malloc(0x54uLL, 0xD0C59E7EuLL);
          *(float *)v61 = v50;
          *((_DWORD *)v61 + 1) = 0;
          *((float *)v61 + 2) = v50;
          *(_QWORD *)(v61 + 12) = 0;
          *((float *)v61 + 5) = v50;
          *((_QWORD *)v61 + 3) = 0;
          *((_DWORD *)v61 + 8) = 0;
          *((float *)v61 + 9) = v51;
          *((_QWORD *)v61 + 5) = 0;
          *((_QWORD *)v61 + 6) = 0;
          *((float *)v61 + 14) = v51;
          *(_QWORD *)(v61 + 68) = 0;
          *(_QWORD *)(v61 + 60) = 0;
          *((_DWORD *)v61 + 19) = 0;
          *((float *)v61 + 20) = v51;
          *((_QWORD *)v60 + 9) = v61;
          *((_DWORD *)v60 + 4) = 6;
          v62 = (float32x2_t *)malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
          *((_QWORD *)v60 + 1) = v62;
          v63 = *(double *)(v59 + v47 + 184);
          v64 = *(double *)(v59 + v47 + 152);
          v65 = *(double *)(v59 + v47 + 144);
          v66 = *(double *)(v59 + v47 + 96);
          v67 = *(double *)(v59 + v47 + 104);
          v69 = *(double *)(v59 + v47 + 112);
          v68 = *(double *)(v59 + v47 + 120);
          v70 = *(double *)(v59 + v47 + 160);
          *v62 = vcvt_f32_f64(*(float64x2_t *)(v59 + v47 + 168));
          v62[1].f32[0] = v63;
          if (fabsf(v65) < 1.0)
          {
            v52 = v70;
            v53 = v64;
            v54 = v68;
            v55 = v66;
            v56 = asinf(-v65);
            v57 = atan2f(v54, v55);
            v58 = atan2f(v53, v52);
          }
          else
          {
            v71 = v67;
            v72 = v69;
            if (v65 <= -1.0)
            {
              v57 = 0.0;
              v58 = atan2f(v71, v72) + 0.0;
              *(float *)&v73 = 1.5708;
            }
            else
            {
              v58 = atan2f(-v71, -v72);
              v57 = 0.0;
              *(float *)&v73 = -1.5708;
            }
            v56 = *(float *)&v73;
          }
          v62[1].f32[1] = v57;
          v62[2].f32[0] = v56;
          ++v49;
          v62[2].f32[1] = v58;
          v26 = a1;
        }
      }
      ++v48;
      v47 += 880;
    }
    while (v397 != v48);
    v23 = v393;
    v16 = v390;
    v7 = v411;
    if (v49 > v388)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1369, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1369, "0");
    }
  }
  if (v7 >= 1)
  {
    v74 = 0;
    v75 = 0;
    v76 = 0;
    v77 = 0uLL;
    v441 = 0u;
    memset(v440, 0, sizeof(v440));
    v427 = 0u;
    v428 = 0u;
    v426 = 0u;
    v438 = 0;
    v439 = 0;
    v437 = 0uLL;
    v435 = 0uLL;
    v436 = 0;
    v399 = 1.0 / *(float *)(v26 + 192);
    v391 = 1.0 / *(float *)(v26 + 188);
    v78 = 1.0 / *(float *)(v26 + 184);
    v79 = 1.0 / *(float *)(v26 + 172);
    v80 = 1.0 / *(float *)(v26 + 176);
    v81 = v18;
    v82 = v397;
    v83 = 1.0 / *(float *)(v26 + 180);
    do
    {
      v84 = (v74 + *(_DWORD *)(v26 + 588) - 1) % *(_DWORD *)(v26 + 588);
      v85 = *(_QWORD *)(v26 + 304);
      v86 = v84;
      v424 = v77;
      v425 = v77;
      v423 = v77;
      v87 = *(double *)(v85 + v75 + 504);
      v88 = *(double *)(v85 + 880 * v84 + 504);
      v89 = *v81++;
      if ((!v89 || !v407[v84])
        && v84 != *(_DWORD *)(v26 + 592)
        && (!*(_DWORD *)(v26 + 136) || !*(_DWORD *)(v85 + v75 + 520)))
      {
        v90 = v87 - v88;
        if (*(_DWORD *)(v26 + 240) && v90 <= 0.0)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1392, (uint64_t)"tracker_bundle_bon", "Negative time detected, dt: %f", v87 - v88);
          __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1392, "0");
        }
        v412 = v76;
        *(_QWORD *)(v389 + 80 * v76) = bon_eval_fnc_relpose;
        v91 = v389 + 80 * v76;
        *(_DWORD *)(v91 + 20) = -1;
        *(_DWORD *)(v91 + 24) = v84;
        *(_DWORD *)(v91 + 28) = v74;
        *(_DWORD *)(v91 + 64) = 2;
        v92 = (char *)malloc_type_malloc(0x54uLL, 0xD0C59E7EuLL);
        *(float *)v92 = v399;
        *((_DWORD *)v92 + 1) = 0;
        *((float *)v92 + 2) = v391;
        *(_QWORD *)(v92 + 12) = 0;
        *((float *)v92 + 5) = v78;
        *((_QWORD *)v92 + 3) = v438;
        *((_DWORD *)v92 + 8) = v439;
        *((float *)v92 + 9) = v79;
        *(_OWORD *)(v92 + 40) = v437;
        *((float *)v92 + 14) = v80;
        *(_OWORD *)(v92 + 60) = v435;
        *((_DWORD *)v92 + 19) = v436;
        *((float *)v92 + 20) = v83;
        *(_QWORD *)(v91 + 72) = v92;
        v93 = (float32x2_t **)(v91 + 72);
        *((_DWORD *)v93 - 14) = 6;
        *(v93 - 8) = (float32x2_t *)malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
        v94 = (float64x2_t *)(v85 + 880 * v86);
        v440[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v94[6]), v94[7]);
        v440[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v94[8]), v94[9]);
        v441 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v94[10]), v94[11]);
        v426 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v85 + v75 + 96)), *(float64x2_t *)(v85 + v75 + 112));
        v427 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v85 + v75 + 128)), *(float64x2_t *)(v85 + v75 + 144));
        v428 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v85 + v75 + 160)), *(float64x2_t *)(v85 + v75 + 176));
        g_coordsf_diff((uint64_t)&v426, (uint64_t)v440, (uint64_t)&v423);
        v95 = (uint64_t)*(v93 - 8);
        *(_QWORD *)v95 = *(_QWORD *)((char *)&v425 + 4);
        *(_DWORD *)(v95 + 8) = HIDWORD(v425);
        if (fabsf(*((float *)&v424 + 2)) >= 1.0)
        {
          if (*((float *)&v424 + 2) <= -1.0)
          {
            v97 = 0.0;
            v98 = atan2f(*((float *)&v423 + 1), *((float *)&v423 + 2)) + 0.0;
            *(float *)&v99 = 1.5708;
          }
          else
          {
            v98 = atan2f(-*((float *)&v423 + 1), -*((float *)&v423 + 2));
            v97 = 0.0;
            *(float *)&v99 = -1.5708;
          }
          v96 = *(float *)&v99;
        }
        else
        {
          v96 = asinf(-*((float *)&v424 + 2));
          v97 = atan2f(*((float *)&v423 + 3), *(float *)&v423);
          v98 = atan2f(*((float *)&v424 + 3), *(float *)&v425);
        }
        *(float *)(v95 + 12) = v97;
        *(float *)(v95 + 16) = v96;
        *(float *)(v95 + 20) = v98;
        v26 = a1;
        v77 = 0uLL;
        if (*(_DWORD *)(v85 + v75 + 516) && *(float *)(a1 + 208) > 0.0)
        {
          v100 = *v93;
          v100->f32[0] = 1.0 / *(float *)(a1 + 228);
          v100[1].f32[0] = 1.0 / *(float *)(a1 + 224);
          v100[2].f32[1] = 1.0 / *(float *)(a1 + 220);
          v100[4].f32[1] = 1.0 / *(float *)(a1 + 208);
          v100[7].f32[0] = 1.0 / *(float *)(a1 + 212);
          v100[10].f32[0] = 1.0 / *(float *)(a1 + 216);
        }
        if (*(_DWORD *)(a1 + 240))
        {
          v101 = *v93;
          v102 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((*v93)[2]), 1.0 / v90)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)(*v93)[2].f32), 1.0 / v90));
          *(float32x4_t *)v101->f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(**v93), 1.0 / v90)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)(*v93)->f32), 1.0 / v90));
          *(float32x4_t *)v101[2].f32 = v102;
          v103 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v101[6]), 1.0 / v90)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v101[6].f32), 1.0 / v90));
          *(float32x4_t *)v101[4].f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v101[4]), 1.0 / v90)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v101[4].f32), 1.0 / v90));
          *(float32x4_t *)v101[6].f32 = v103;
          *(float32x4_t *)v101[8].f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v101[8]), 1.0 / v90)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v101[8].f32), 1.0 / v90));
          v104 = 1.0 / v90 * v101[10].f32[0];
          v101[10].f32[0] = v104;
        }
        v76 = v412 + 1;
      }
      v75 += 880;
      ++v74;
      --v82;
    }
    while (v82);
    if (v76 > v388)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1418, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1418, "0");
    }
    v18 = v407;
    v16 = v390;
  }
  if ((int)v397 >= 4 && v384)
  {
    v105 = 0;
    v106 = 1.0 / *(float *)(v26 + 196);
    v107 = 1.0 / *(float *)(v26 + 200);
    v108 = 3;
    v109 = 1.0 / *(float *)(v26 + 204);
    v110 = v397;
    v111 = &v402[80 * v386];
    do
    {
      v120 = &v111[80 * v105];
      v121 = (v108 + *(_DWORD *)(v26 + 592) - 2) % v110;
      *((_DWORD *)v120 + 6) = v121;
      v122 = (v121 + 1) % v110;
      *((_DWORD *)v120 + 7) = v122;
      v123 = (v121 + 2) % v110;
      *((_DWORD *)v120 + 8) = v123;
      v124 = (v121 + 3) % v110;
      *((_DWORD *)v120 + 9) = v124;
      if (!v407[v121] || !v407[v122] || !v407[v123] || !v407[v124])
      {
        v112 = &v419[80 * v105];
        *((_DWORD *)v112 + 16) = 4;
        *((_DWORD *)v112 + 5) = -1;
        v113 = (char *)malloc_type_malloc(0x18uLL, 0xD0C59E7EuLL);
        *(float *)v113 = v106;
        *((_DWORD *)v113 + 1) = 0;
        *((float *)v113 + 2) = v107;
        *(_QWORD *)(v113 + 12) = 0;
        *((float *)v113 + 5) = v109;
        *((_QWORD *)v112 + 9) = v113;
        *((_DWORD *)v112 + 4) = 3;
        *(_QWORD *)v120 = bon_eval_acc;
        v114 = (float *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
        v26 = a1;
        *((_QWORD *)v112 + 1) = v114;
        v111 = &v402[80 * v386];
        v110 = v397;
        v115 = *(_QWORD *)(a1 + 304);
        v116 = *(double *)(v115 + 880 * *((int *)v120 + 6) + 504);
        v117 = *(double *)(v115 + 880 * *((int *)v120 + 7) + 504) - v116;
        *v114 = v117;
        v118 = *(double *)(v115 + 880 * *((int *)v120 + 8) + 504) - v116;
        v114[1] = v118;
        v119 = *(double *)(v115 + 880 * *((int *)v120 + 9) + 504) - v116;
        v114[2] = v119;
        ++v105;
      }
      ++v108;
    }
    while (v110 != v108);
    v18 = v407;
    v23 = v393;
    v16 = v390;
    if (v105 > v388)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1455, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1455, "0");
    }
  }
  v125 = a2;
  if (v382)
  {
    v126 = 0;
    v127 = 0;
    v128 = v383 - 1;
    v129 = &v16[4 * (int)v383 - 4];
    *v129 = (int32x2_t)(v26 + 712);
    v129[1].i32[0] = 48;
    v129[3] = (int32x2_t)bon_upd_cs;
    v129[2].i32[0] = 3;
    v413 = v129 + 2;
    v130 = 1.0 / *(float *)(v26 + 252);
    v131 = 1.0 / *(float *)(v26 + 256);
    v132 = 504;
    v133 = v18;
    v134 = v397;
    do
    {
      v135 = (v126 + *(_DWORD *)(v26 + 588) - 1) % *(_DWORD *)(v26 + 588);
      v136 = *v133++;
      if ((!v136 || !v18[v135]) && v135 != *(_DWORD *)(v26 + 592))
      {
        v137 = *(_QWORD *)(v26 + 304);
        *(_QWORD *)&v416[80 * v127] = bon_eval_fnc_fm;
        v138 = &v416[80 * v127];
        *((_DWORD *)v138 + 5) = -1;
        *((_DWORD *)v138 + 6) = v135;
        *((_DWORD *)v138 + 7) = v126;
        *((_DWORD *)v138 + 8) = v128;
        *((_DWORD *)v138 + 16) = 3;
        v139 = (float *)malloc_type_malloc(0xCuLL, 0xD0C59E7EuLL);
        v26 = a1;
        *v139 = v130;
        v139[1] = 0.0;
        v139[2] = v131;
        *((_QWORD *)v138 + 9) = v139;
        *((_DWORD *)v138 + 4) = 2;
        v140 = *(double *)(v137 + v132);
        v141 = v137 + 880 * v135;
        v18 = v407;
        v142 = 1.0 / (v140 - *(double *)(v141 + 504));
        *(float32x2_t *)v139 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)COERCE_UNSIGNED_INT64(v130), v142));
        *(float *)&v142 = v142 * v131;
        v139[2] = *(float *)&v142;
        ++v127;
      }
      v132 += 880;
      ++v126;
      --v134;
    }
    while (v134);
    v143 = &v416[80 * v127];
    *((_DWORD *)v143 + 5) = -1;
    *((_DWORD *)v143 + 6) = v128;
    *((_DWORD *)v143 + 16) = 1;
    *((_DWORD *)v143 + 4) = v413->i32[0];
    *(_QWORD *)v143 = bon_eval_fnc_bs;
    v144 = (__int128 *)(v26 + 760);
    v145 = malloc_type_malloc(0x30uLL, 0xD0C59E7EuLL);
    v146 = *v144;
    v147 = v144[2];
    v145[1] = v144[1];
    v145[2] = v147;
    *v145 = v146;
    *((_QWORD *)v143 + 1) = v145;
    v148 = *((_DWORD *)v143 + 4) + *((_DWORD *)v143 + 4) * *((_DWORD *)v143 + 4);
    v149 = malloc_type_calloc((uint64_t)(v148 + (v148 < 0)) >> 1, 4uLL, 0x100004052888210uLL);
    *((_QWORD *)v143 + 9) = v149;
    v150 = *((unsigned int *)v143 + 4);
    v23 = v393;
    v16 = v390;
    v125 = a2;
    if ((int)v150 >= 1)
    {
      if ((_DWORD)v150 == 3)
      {
        *v149 = 1113927393;
        v149[2] = 1113927393;
        v149[5] = 1113927393;
      }
      else
      {
        *v149 = 1113927393;
        if ((_DWORD)v150 != 1)
        {
          v149[2] = 1113927393;
          if ((_DWORD)v150 != 2)
          {
            v149[5] = 1113927393;
            v151 = 9;
            for (j = 3; j != v150; ++j)
            {
              v149[v151] = 1148846079;
              v151 += (j + 2);
            }
          }
        }
      }
    }
    v26 = a1;
    if (v127 >= v382)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1478, (uint64_t)"tracker_bundle_bon", "term_index > n_fm");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1478, "0");
    }
  }
  if (v386 >= 1)
  {
    v153 = 0;
    v154 = 0;
    v155 = 520;
    v156 = v18;
    v157 = v397;
    v158 = 1.0 / *(float *)(v26 + 232);
    do
    {
      v159 = (v153 + *(_DWORD *)(v26 + 588) - 1) % *(_DWORD *)(v26 + 588);
      v160 = *(_QWORD *)(v26 + 304);
      v161 = v159;
      v162 = *(double *)(v160 + v155 - 16);
      v163 = *(double *)(v160 + 880 * v159 + 504);
      v164 = *v156++;
      if ((!v164 || !v18[v159])
        && v159 != *(_DWORD *)(v26 + 592)
        && (!*(_DWORD *)(v26 + 136) || !*(_DWORD *)(v160 + v155)))
      {
        v165 = v162 - v163;
        if (*(_DWORD *)(v26 + 240) && v165 <= 0.0)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1497, (uint64_t)"tracker_bundle_bon", "Negative time detected, dt: %f", v162 - v163);
          __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1497, "0");
        }
        *(_QWORD *)&v402[80 * v154] = bon_eval_fnc_distance;
        v166 = &v402[80 * v154];
        *((_DWORD *)v166 + 5) = -1;
        *((_DWORD *)v166 + 6) = v159;
        *((_DWORD *)v166 + 7) = v153;
        *((_DWORD *)v166 + 16) = 2;
        v167 = (float *)malloc_type_malloc(4uLL, 0xD0C59E7EuLL);
        *v167 = v158;
        *((_QWORD *)v166 + 9) = v167;
        v168 = (float **)(v166 + 72);
        *((_DWORD *)v168 - 14) = 1;
        v169 = (float *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
        *(v168 - 8) = v169;
        v170 = (double *)(v160 + 880 * v161);
        v171 = v170[21] - *(double *)(v160 + v155 - 352);
        v172 = v170[23] - *(double *)(v160 + v155 - 336);
        *(float *)&v171 = sqrt((v170[22] - *(double *)(v160 + v155 - 344)) * (v170[22] - *(double *)(v160 + v155 - 344))+ v171 * v171+ v172 * v172);
        *v169 = *(float *)&v171;
        v26 = a1;
        if (*(_DWORD *)(a1 + 240))
        {
          v173 = **v168 / v165;
          **v168 = v173;
        }
        ++v154;
        v18 = v407;
      }
      v155 += 880;
      ++v153;
      --v157;
    }
    while (v157);
    v23 = v393;
    v16 = v390;
    v125 = a2;
    if (v154 > v388)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1513, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1513, "0");
    }
  }
  v125[13] = 0;
  v174 = v125[15];
  v175 = v394;
  if (v381 > v174)
  {
    v176 = 2 * v174;
    v223 = v174 == 0;
    v177 = 64;
    if (!v223)
      v177 = v176;
    if (v177 <= v381)
      v178 = v381;
    else
      v178 = v177;
    if (v178)
    {
      v179 = malloc_type_realloc((void *)v125[14], 4 * v178, 0x4398D04AuLL);
      v26 = a1;
      v125[14] = v179;
    }
    v125[15] = v178;
  }
  if (v380 >= 1)
  {
    bzero((void *)(v125[14] + 4 * v125[13]), (4 * v405) & 0x3FFFFFFFFLL);
    v26 = a1;
  }
  v125[13] = v381;
  if ((int)v405 >= 1)
  {
    v180 = 0;
    v181 = ((_DWORD)v383 << 16) - 0x10000;
    do
    {
      if (v23[v180])
        goto LABEL_125;
      v182 = v125[1];
      v183 = v125[8];
      v184 = &v17[10 * v180];
      v185 = -1;
      *((_DWORD *)v184 + 13) = -1;
      v403 = (_DWORD *)v184 + 13;
      if (v125[10] > v180)
        v185 = *(_DWORD *)(v125[11] + 4 * v180);
      v392 = v185;
      v186 = &v17[10 * v180];
      v187 = (uint64_t *)(v182 + 24 * v180);
      v188 = *v186;
      v189 = *v187;
      v190 = (uint64_t)v186[2];
      if (*v187 > v190)
      {
        v193 = 2 * v190;
        v223 = v190 == 0;
        v194 = 32;
        if (!v223)
          v194 = v193;
        if (v194 <= v189)
          v195 = *v187;
        else
          v195 = v194;
        if (v195)
        {
          v196 = malloc_type_realloc(v186[1], 8 * v195, 0x4183AA16uLL);
          v181 = ((_DWORD)v383 << 16) - 0x10000;
          v26 = a1;
          v186[1] = v196;
        }
        v186[2] = (void *)v195;
        v191 = v189 - (_QWORD)v188;
        if (v189 <= (uint64_t)v188)
        {
LABEL_131:
          v192 = *v187;
          *v186 = (void *)*v187;
          if (v192 < 1)
            goto LABEL_159;
          goto LABEL_142;
        }
      }
      else
      {
        v191 = v189 - (_QWORD)v188;
        if (v189 <= (uint64_t)v188)
          goto LABEL_131;
      }
      bzero((char *)v186[1] + 8 * (_QWORD)*v186, 8 * v191);
      v181 = ((_DWORD)v383 << 16) - 0x10000;
      v26 = a1;
      v197 = *v187;
      *v186 = (void *)*v187;
      if (v197 < 1)
        goto LABEL_159;
LABEL_142:
      v198 = 0;
      v199 = (float *)(v183 + 12 * v180);
      v200 = (_QWORD *)(v182 + 24 * v180 + 8);
      v201 = &v395[10 * v180];
      v202 = (uint64_t *)(v201 + 3);
      v203 = (uint64_t *)(v201 + 5);
      v204 = v201 + 4;
      v417 = v199 + 1;
      v420 = v199;
      v414 = v199 + 2;
      v400 = (float *)(v201 + 6);
      v205 = INFINITY;
      do
      {
        v206 = *(unsigned int *)(*v200 + 4 * v198);
        v207 = *v202;
        v208 = *v203;
        if (*v202 >= *v203)
        {
          v209 = 2 * v208;
          v223 = v208 == 0;
          v210 = 64;
          if (!v223)
            v210 = v209;
          if (v210 <= v207)
            v211 = v207 + 1;
          else
            v211 = v210;
          if (v211)
          {
            v212 = malloc_type_realloc(*v204, 4 * v211, 0x34C81B78uLL);
            v181 = ((_DWORD)v383 << 16) - 0x10000;
            v26 = a1;
            *v204 = v212;
            v207 = *v202;
          }
          *v203 = v211;
        }
        *v202 = v207 + 1;
        *((_DWORD *)*v204 + v207) = v206 & 0x7FFF | v181;
        *((_QWORD *)v186[1] + v198) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v26 + 304) + 880 * (v206 & 0x7FFF) + 368)
                                                + 8 * (v206 >> 15));
        v213 = *v187;
        v214 = *v187 - 1;
        if (*v187 <= 1)
          v214 = 1;
        if (v214 > v198)
        {
          v215 = (double *)(*(_QWORD *)(v26 + 304) + 880 * (v206 & 0x7FFF));
          v216 = v215[3] * (*v417 - v215[10]) + *v215 * (*v420 - v215[9]) + v215[6] * (*v414 - v215[11]);
          if (v205 > v216)
          {
            *v400 = 1.0 / v216;
            *v403 = v198;
            *(_DWORD *)(a2[14] + 4 * v180) = v206 & 0x7FFF;
            v205 = v216;
          }
        }
        ++v198;
      }
      while (v213 > v198);
      v18 = v407;
      v16 = v390;
      if (v205 >= *(float *)(v26 + 24))
      {
LABEL_159:
        if (*v403 != -1)
        {
          v23 = v393;
          v175 = v394;
          v17 = v395;
          v125 = a2;
          if (v392 != -1)
          {
            v217 = &v395[10 * v180];
            v217[7] = (void *)(*(_QWORD *)(v26 + 448) + 12 * v392);
            v217[8] = (void *)(*(_QWORD *)(v26 + 472) + 36 * v392);
            v217[9] = (void *)(*(_QWORD *)(v26 + 568) + 48 * v392);
          }
          goto LABEL_125;
        }
      }
      v23 = v393;
      v175 = v394;
      v393[v180] = 1;
      v17 = v395;
      v125 = a2;
LABEL_125:
      ++v180;
    }
    while (v180 != v175);
  }
  if (v380 >= 1)
  {
    v218 = 0;
    if (v381 <= 1)
      v219 = 1;
    else
      v219 = v381;
    v220 = v23;
    v221 = v17;
    do
    {
      while (1)
      {
        v222 = *v220++;
        v223 = v222 || v17 == 0;
        if (!v223)
          break;
        free(v221[1]);
        free(v221[4]);
        v26 = a1;
        v221 += 10;
        if (!--v219)
          goto LABEL_173;
      }
      v224 = &v17[10 * v218];
      *(_OWORD *)v224 = *(_OWORD *)v221;
      v225 = *((_OWORD *)v221 + 1);
      v226 = *((_OWORD *)v221 + 2);
      v227 = *((_OWORD *)v221 + 4);
      *((_OWORD *)v224 + 3) = *((_OWORD *)v221 + 3);
      *((_OWORD *)v224 + 4) = v227;
      *((_OWORD *)v224 + 1) = v225;
      *((_OWORD *)v224 + 2) = v226;
      ++v218;
      v221 += 10;
      --v219;
    }
    while (v219);
LABEL_173:
    LODWORD(v6) = v218;
    v21 = v385;
    v228 = v218 | v385;
    v229 = a2;
    if (!v228)
      goto LABEL_174;
LABEL_176:
    v230 = v397 - 1;
    if ((int)v397 - 1 >= v388)
      v230 = v388;
    v231 = *(_DWORD *)(v26 + 592);
    v232 = ((int)v397 - v230 + v231 + 1) % (int)v397;
    v434 = v232;
    v24 = v387;
    v22 = (void **)v389;
    if (v18[v232])
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1575, (uint64_t)"tracker_bundle_bon", "cam %d locked", v434);
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1575, "0");
    }
    LODWORD(v429) = 0;
    *(_QWORD *)((char *)&v429 + 4) = *(_QWORD *)(v26 + 144);
    v233 = *(float *)(v26 + 156);
    HIDWORD(v429) = *(_DWORD *)(v26 + 152);
    LODWORD(v430) = 0;
    v234 = *(_QWORD *)(v26 + 304);
    v235 = *(float *)(v234 + 880 * v231 + 360);
    *((float *)&v430 + 1) = *(float *)(v26 + 160) * v235;
    *(float *)v433.i32 = v235 * v233;
    v433.i32[1] = 1084227584;
    v236 = *(_DWORD *)(v26 + 236);
    LODWORD(v431) = 925353388;
    v237 = 1.0 / *(float *)(v26 + 24);
    v432 = v236;
    *((float *)&v431 + 1) = v237;
    v238 = bon2(v16, v383, (uint64_t)v17, v6, v389, v21, (int *)&v429, (uint64_t)&v434, 1, v234 + 880 * v232 + 524);
    v239 = v229[7];
    if (v239 >= 1)
    {
      v240 = 0;
      v241 = 0;
      v242 = v23;
      do
      {
        if (!*v242++)
        {
          v244 = (float *)&v17[10 * v241];
          v245 = 1.0 / v244[12];
          v246 = *((int *)v244 + 13);
          v247 = (float *)(*((_QWORD *)v244 + 1) + 8 * v246);
          v248 = v245 * *v247;
          v249 = v245 * v247[1];
          v250 = (float *)&v387[48 * *(unsigned __int16 *)(*((_QWORD *)v244 + 4) + 4 * v246)];
          v251 = v250[9] + (float)((float)((float)(v248 * v250[1]) + (float)(*v250 * v245)) + (float)(v250[2] * v249));
          v252 = (float)((float)(v248 * v250[4]) + (float)(v250[3] * v245)) + (float)(v250[5] * v249);
          v253 = (float *)(v229[8] + v240);
          v254 = (float)(v248 * v250[7]) + (float)(v250[6] * v245);
          v255 = v250[10] + v252;
          v256 = v250[11] + (float)(v254 + (float)(v250[8] * v249));
          *v253 = v251;
          v253[1] = v255;
          v253[2] = v256;
          ++v241;
        }
        v240 += 12;
        --v239;
      }
      while (v239);
    }
    v257 = *(float64x2_t **)(a1 + 304);
    v258 = v257 + 3;
    v259 = (float32x2_t *)(v387 + 24);
    v260 = v397;
    do
    {
      v258[2] = vcvtq_f64_f32(v259[2]);
      v258[-3] = vcvtq_f64_f32(v259[-3]);
      *v258 = vcvtq_f64_f32(*v259);
      v258[-2] = vcvtq_f64_f32(v259[-2]);
      v258[-1] = vcvtq_f64_f32(v259[-1]);
      v258[1] = vcvtq_f64_f32(v259[1]);
      v258 += 55;
      v259 += 6;
      --v260;
    }
    while (v260);
    v396 = v238;
    v261 = 0;
    v262 = (v434 + *(_DWORD *)(a1 + 588) - 1) % *(_DWORD *)(a1 + 588);
    *(_QWORD *)((char *)v440 + 12) = 0;
    *(uint64_t *)((char *)v441.i64 + 4) = 0;
    DWORD1(v440[1]) = 0;
    v441.i32[3] = 0;
    v443 = 0;
    v444[1] = 0;
    v444[0] = 0;
    v445 = 1065353216;
    v448 = 0;
    v446 = 0;
    v447 = 0;
    v450 = 0;
    v452 = 0;
    v451 = 0;
    v449 = 1065353216;
    v453 = 1065353216;
    f64 = v257[55 * v262].f64;
    v264 = *f64;
    *(float *)v440 = v264;
    v265 = f64[1];
    *((float *)v440 + 1) = v265;
    v266 = f64[2];
    *((float *)v440 + 2) = v266;
    v267 = f64[3];
    *((float *)&v440[1] + 2) = v267;
    v268 = f64[4];
    *((float *)&v440[1] + 3) = v268;
    v269 = f64[5];
    v441.f32[0] = v269;
    v270 = f64[6];
    *(float *)v442 = v270;
    v271 = f64[7];
    *(float *)&v442[1] = v271;
    v272 = f64[8];
    *(float *)&v442[2] = v272;
    v273 = &v257[55 * v434];
    v274 = (float32x4_t *)((char *)&v273[32].f64[1] + 4);
    v275 = v273 + 34;
    do
    {
      v276 = (char *)v440 + v261;
      *((_QWORD *)v276 + 19) = 0;
      *((_QWORD *)v276 + 20) = 0;
      *((_QWORD *)v276 + 18) = 0;
      v277 = *(float *)((char *)&v275[-1] + v261 - 4);
      v278 = *(float *)&v275[-1].f64[v261 / 8];
      v279 = (float)(v454.f32[v261 / 4] + (float)(v264 * v277)) + (float)(v267 * v278);
      v280 = (float)(v454.f32[v261 / 4 + 1] + (float)(v265 * v277)) + (float)(v268 * v278);
      v281 = (float)(v454.f32[v261 / 4 + 2] + (float)(v266 * v277)) + (float)(v269 * v278);
      v282 = (float)(v454.f32[v261 / 4 + 3] + (float)(v277 * 0.0)) + (float)(v278 * 0.0);
      v283 = (float)(*(float *)&v456[v261 / 4 - 1] + (float)(v277 * 0.0)) + (float)(v278 * 0.0);
      v284 = (float)(*(float *)&v456[v261 / 4] + (float)(v277 * 0.0)) + (float)(v278 * 0.0);
      v285 = *((float *)&v275->f64[v261 / 8 - 1] - 1);
      v286 = *(float *)&v275->f64[v261 / 8 - 1];
      v287 = v282 + (float)(v285 * 0.0);
      v288 = v283 + (float)(v285 * 0.0);
      v289 = v284 + (float)(v285 * 0.0);
      v290 = (float)(v279 + (float)(v270 * v285)) + (float)(v286 * 0.0);
      v291 = (float)(v280 + (float)(v271 * v285)) + (float)(v286 * 0.0);
      v292 = (float)(v281 + (float)(v272 * v285)) + (float)(v286 * 0.0);
      v293 = v286 + v287;
      v294 = v288 + (float)(v286 * 0.0);
      v295 = *((float *)&v275->f64[v261 / 8 - 1] + 1);
      v296 = v290 + (float)(v295 * 0.0);
      v297 = v291 + (float)(v295 * 0.0);
      v298 = v292 + (float)(v295 * 0.0);
      v299 = v293 + (float)(v295 * 0.0);
      v300 = v295 + v294;
      v301 = (float)(v289 + (float)(v286 * 0.0)) + (float)(v295 * 0.0);
      v302 = *(float *)&v275->f64[v261 / 8];
      *((float *)v276 + 36) = v296 + (float)(v302 * 0.0);
      *((float *)v276 + 37) = v297 + (float)(v302 * 0.0);
      *((float *)v276 + 38) = v298 + (float)(v302 * 0.0);
      *((float *)v276 + 39) = v299 + (float)(v302 * 0.0);
      *((float *)v276 + 40) = v300 + (float)(v302 * 0.0);
      *((float *)v276 + 41) = v302 + v301;
      v261 += 24;
    }
    while (v261 != 144);
    v421 = v454;
    v418 = v455;
    v415 = *(float *)v456;
    v410 = *(float *)&v456[1];
    v408 = *(float *)&v456[2];
    v406 = *(float *)&v456[3];
    v404 = *(float *)&v456[4];
    v401 = *(float *)&v456[5];
    v398 = *(float *)&v456[6];
    v303 = *(float *)&v456[7];
    v304 = *(float *)&v456[8];
    v305 = *(float *)&v456[9];
    v306 = *(float *)&v456[10];
    v307 = *(float *)&v456[11];
    v308 = *(float *)&v456[12];
    v309 = *(float *)&v456[13];
    v310 = *(float *)&v456[14];
    v311 = *(float *)&v456[15];
    v312 = *(float *)&v456[16];
    v313 = *(float *)&v456[17];
    v314 = *(float *)&v456[18];
    v315 = *(float *)&v456[19];
    v316 = *(float *)&v456[20];
    v317 = *(float *)&v456[21];
    v318 = *(float *)&v456[22];
    v319 = *(float *)&v456[23];
    v320 = *(float *)&v456[24];
    v321 = *(float *)&v456[25];
    v322 = *(float *)&v456[26];
    v323 = *(float *)&v456[27];
    v324 = *(float *)&v456[28];
    v325 = *(float *)&v456[29];
    v326 = 48;
    v327 = *(float *)&v456[30];
    do
    {
      v274->i64[1] = 0;
      v274[1].i64[0] = 0;
      v274->i64[0] = 0;
      v328 = *(float *)((char *)&v435 + v326 + 8);
      v329 = vmlaq_n_f32(*v274, v421, v328);
      *v274 = v329;
      v330 = v274[1].f32[0] + (float)(v418 * v328);
      v331 = v274[1].f32[1] + (float)(v415 * v328);
      v274[1].f32[0] = v330;
      v274[1].f32[1] = v331;
      v332 = *(float *)((char *)&v437 + v326 + 8);
      v333 = v329.f32[0] + (float)(v410 * v332);
      v334 = v329.f32[1] + (float)(v408 * v332);
      v274->f32[0] = v333;
      v274->f32[1] = v334;
      v335 = v329.f32[2] + (float)(v406 * v332);
      v329.f32[0] = v329.f32[3] + (float)(v404 * v332);
      v274->f32[2] = v335;
      v274->i32[3] = v329.i32[0];
      v336 = v330 + (float)(v401 * v332);
      v337 = v331 + (float)(v398 * v332);
      v274[1].f32[0] = v336;
      v274[1].f32[1] = v337;
      v338 = *(float *)((char *)v440 + v326);
      v339 = v333 + (float)(v303 * v338);
      v340 = v334 + (float)(v304 * v338);
      v274->f32[0] = v339;
      v274->f32[1] = v340;
      v341 = v335 + (float)(v305 * v338);
      v329.f32[0] = v329.f32[0] + (float)(v306 * v338);
      v274->f32[2] = v341;
      v274->i32[3] = v329.i32[0];
      v342 = v336 + (float)(v307 * v338);
      v343 = v337 + (float)(v308 * v338);
      v274[1].f32[0] = v342;
      v274[1].f32[1] = v343;
      v344 = *(float *)((char *)&v440[1] + v326 + 8);
      v345 = v339 + (float)(v309 * v344);
      v346 = v340 + (float)(v310 * v344);
      v274->f32[0] = v345;
      v274->f32[1] = v346;
      v347 = v341 + (float)(v311 * v344);
      v329.f32[0] = v329.f32[0] + (float)(v312 * v344);
      v274->f32[2] = v347;
      v274->i32[3] = v329.i32[0];
      v348 = v342 + (float)(v313 * v344);
      v349 = v343 + (float)(v314 * v344);
      v274[1].f32[0] = v348;
      v274[1].f32[1] = v349;
      v350 = *(float *)&v442[v326 / 4];
      v351 = v345 + (float)(v315 * v350);
      v352 = v346 + (float)(v316 * v350);
      v274->f32[0] = v351;
      v274->f32[1] = v352;
      v353 = v347 + (float)(v317 * v350);
      v329.f32[0] = v329.f32[0] + (float)(v318 * v350);
      v274->f32[2] = v353;
      v274->i32[3] = v329.i32[0];
      v354 = v348 + (float)(v319 * v350);
      v355 = v349 + (float)(v320 * v350);
      v274[1].f32[0] = v354;
      v274[1].f32[1] = v355;
      v356 = *(float *)((char *)v444 + v326 + 4);
      v274->f32[0] = v351 + (float)(v321 * v356);
      v274->f32[1] = v352 + (float)(v322 * v356);
      v274->f32[2] = v353 + (float)(v323 * v356);
      v274->f32[3] = v329.f32[0] + (float)(v324 * v356);
      v274[1].f32[0] = v354 + (float)(v325 * v356);
      v274[1].f32[1] = v355 + (float)(v327 * v356);
      v326 += 4;
      v274 = (float32x4_t *)((char *)v274 + 24);
    }
    while (v326 != 72);
    v4 = v396;
    if ((int)v6 < 1)
      goto LABEL_194;
    goto LABEL_191;
  }
  LODWORD(v6) = 0;
  v21 = v385;
  v229 = a2;
  if ((_DWORD)v385)
    goto LABEL_176;
LABEL_174:
  log_msg(2, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1568, (uint64_t)"tracker_bundle_bon", "%s: Nothing to optimize, skipping", "tracker_bundle_bon");
  v4 = 0.0;
  v24 = v387;
  v22 = (void **)v389;
LABEL_194:
  free(v17);
  free(v16);
  if ((int)v21 >= 1)
  {
    v362 = v22 + 9;
    do
    {
      free(*(v362 - 8));
      v363 = *v362;
      v362 += 10;
      free(v363);
      --v21;
    }
    while (v21);
  }
  free(v22);
  free(v24);
  free(v18);
  free(v23);
  v364 = (_QWORD *)a1;
  if (*(_DWORD *)(a1 + 300))
  {
    v365 = v4 < 0.0 || ((LODWORD(v4) & 0x7FFFFFFFu) - 0x800000) >> 24 > 0x7E;
    if (!v365 || (LODWORD(v4) - 1) <= 0x7FFFFE)
    {
      if (v388 == 1)
      {
        v367 = *(_QWORD *)(a1 + 880);
        v368 = *(_QWORD *)(a1 + 896);
        if (v367 >= v368)
        {
          v369 = 2 * v368;
          v223 = v368 == 0;
          v370 = 64;
          if (!v223)
            v370 = v369;
          if (v370 <= v367)
            v371 = v367 + 1;
          else
            v371 = v370;
          if (v371)
          {
            v372 = malloc_type_realloc(*(void **)(a1 + 888), 4 * v371, 0xFE8AFB6EuLL);
            v364 = (_QWORD *)a1;
            *(_QWORD *)(a1 + 888) = v372;
            v367 = *(_QWORD *)(a1 + 880);
          }
          v364[112] = v371;
        }
        v364[110] = v367 + 1;
        v373 = v364 + 111;
      }
      else
      {
        v367 = *(_QWORD *)(a1 + 904);
        v374 = *(_QWORD *)(a1 + 920);
        if (v367 >= v374)
        {
          v375 = 2 * v374;
          v223 = v374 == 0;
          v376 = 64;
          if (!v223)
            v376 = v375;
          if (v376 <= v367)
            v377 = v367 + 1;
          else
            v377 = v376;
          if (v377)
          {
            v378 = malloc_type_realloc(*(void **)(a1 + 912), 4 * v377, 0xE4417889uLL);
            v364 = (_QWORD *)a1;
            *(_QWORD *)(a1 + 912) = v378;
            v367 = *(_QWORD *)(a1 + 904);
          }
          v364[115] = v377;
        }
        v364[113] = v367 + 1;
        v373 = v364 + 114;
      }
      *(float *)(*v373 + 4 * v367) = v4;
    }
  }
  return v4;
}

void remove_map_points(uint64_t a1, unsigned __int8 *a2)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;
  int *v9;
  int v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  BOOL v29;
  uint64_t *v30;
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
  unsigned __int8 *v41;
  _DWORD *v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int8 *v53;
  _DWORD *v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _DWORD *v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int *v82;
  uint64_t v83;
  uint64_t v84;

  v4 = malloc_type_malloc(4 * *(_QWORD *)(a1 + 368), 0x9777BE39uLL);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 368);
  if (v6 >= 1)
  {
    v7 = 0;
    v8 = a2;
    v9 = v4;
    do
    {
      v10 = *v8++;
      v11 = v10 == 0;
      if (v10)
        v12 = -1;
      else
        v12 = v7;
      if (v11)
        ++v7;
      *v9++ = v12;
      --v6;
    }
    while (v6);
  }
  v13 = *(_QWORD *)(a1 + 312);
  if (v13 < 1)
  {
    v15 = 0;
    v22 = *(_QWORD *)(a1 + 328);
    if (v22 >= 0)
      goto LABEL_18;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    for (i = 0; i < v13; ++i)
    {
      while (1)
      {
        v17 = *(_QWORD *)(a1 + 320);
        if (!a2[i] && v17 != 0)
          break;
        free(*(void **)(v17 + v14 + 8));
        ++i;
        v13 = *(_QWORD *)(a1 + 312);
        v14 += 24;
        if (i >= v13)
          goto LABEL_17;
      }
      v19 = *(_OWORD *)(v17 + v14);
      v20 = *(_QWORD *)(v17 + v14 + 16);
      v21 = v17 + 24 * v15;
      *(_QWORD *)(v21 + 16) = v20;
      *(_OWORD *)v21 = v19;
      ++v15;
      v13 = *(_QWORD *)(a1 + 312);
      v14 += 24;
    }
LABEL_17:
    v22 = *(_QWORD *)(a1 + 328);
    if (v15 <= v22)
    {
LABEL_18:
      v23 = v15 - v13;
      if (v15 <= v13)
        goto LABEL_19;
      goto LABEL_36;
    }
  }
  v33 = 2 * v22;
  v11 = v22 == 0;
  v34 = 10;
  if (!v11)
    v34 = v33;
  if (v34 <= v15)
    v35 = v15;
  else
    v35 = v34;
  if (v35)
    *(_QWORD *)(a1 + 320) = malloc_type_realloc(*(void **)(a1 + 320), 24 * v35, 0x83A307D0uLL);
  *(_QWORD *)(a1 + 328) = v35;
  v23 = v15 - v13;
  if (v15 <= v13)
  {
LABEL_19:
    *(_QWORD *)(a1 + 312) = v15;
    v24 = *(_QWORD *)(a1 + 368);
    if (v24 >= 1)
      goto LABEL_20;
LABEL_37:
    v26 = 0;
    goto LABEL_38;
  }
LABEL_36:
  bzero((void *)(*(_QWORD *)(a1 + 320) + 24 * *(_QWORD *)(a1 + 312)), 24 * v23);
  *(_QWORD *)(a1 + 312) = v15;
  v24 = *(_QWORD *)(a1 + 368);
  if (v24 < 1)
    goto LABEL_37;
LABEL_20:
  v25 = 0;
  v26 = 0;
  for (j = 0; j < v24; ++j)
  {
    v28 = *(_QWORD *)(a1 + 376);
    if (a2[j])
      v29 = 1;
    else
      v29 = v28 == 0;
    if (!v29)
    {
      v30 = (uint64_t *)(v28 + v25);
      v31 = v28 + 12 * v26;
      v32 = *v30;
      *(_DWORD *)(v31 + 8) = *((_DWORD *)v30 + 2);
      *(_QWORD *)v31 = v32;
      ++v26;
      v24 = *(_QWORD *)(a1 + 368);
    }
    v25 += 12;
  }
LABEL_38:
  v36 = *(_QWORD *)(a1 + 384);
  if (v26 > v36)
  {
    v45 = 2 * v36;
    v11 = v36 == 0;
    v46 = 21;
    if (!v11)
      v46 = v45;
    if (v46 <= v26)
      v47 = v26;
    else
      v47 = v46;
    if (v47)
      *(_QWORD *)(a1 + 376) = malloc_type_realloc(*(void **)(a1 + 376), 12 * v47, 0x4AD6A2C5uLL);
    *(_QWORD *)(a1 + 384) = v47;
    v37 = v26 - v24;
    if (v26 <= v24)
    {
LABEL_40:
      *(_QWORD *)(a1 + 368) = v26;
      v38 = *(_QWORD *)(a1 + 336);
      if (v38 >= 1)
        goto LABEL_41;
LABEL_55:
      v40 = 0;
      goto LABEL_56;
    }
  }
  else
  {
    v37 = v26 - v24;
    if (v26 <= v24)
      goto LABEL_40;
  }
  bzero((void *)(*(_QWORD *)(a1 + 376) + 12 * *(_QWORD *)(a1 + 368)), 12 * v37);
  *(_QWORD *)(a1 + 368) = v26;
  v38 = *(_QWORD *)(a1 + 336);
  if (v38 < 1)
    goto LABEL_55;
LABEL_41:
  v39 = *(_QWORD *)(a1 + 344);
  if (v39)
  {
    v40 = 0;
    v41 = a2;
    v42 = *(_DWORD **)(a1 + 344);
    v43 = v38;
    do
    {
      if (!*v41++)
        *(_DWORD *)(v39 + 4 * v40++) = *v42;
      ++v42;
      --v43;
    }
    while (v43);
LABEL_56:
    v48 = *(_QWORD *)(a1 + 352);
    if (v40 <= v48)
      goto LABEL_57;
    goto LABEL_65;
  }
  v40 = 0;
  v48 = *(_QWORD *)(a1 + 352);
  if (v48 >= 0)
  {
LABEL_57:
    v49 = v40 - v38;
    if (v40 <= v38)
      goto LABEL_58;
    goto LABEL_73;
  }
LABEL_65:
  v57 = 2 * v48;
  v11 = v48 == 0;
  v58 = 64;
  if (!v11)
    v58 = v57;
  if (v58 <= v40)
    v59 = v40;
  else
    v59 = v58;
  if (v59)
    *(_QWORD *)(a1 + 344) = malloc_type_realloc(*(void **)(a1 + 344), 4 * v59, 0x7BE4EF1EuLL);
  *(_QWORD *)(a1 + 352) = v59;
  v49 = v40 - v38;
  if (v40 <= v38)
  {
LABEL_58:
    *(_QWORD *)(a1 + 336) = v40;
    v50 = *(_QWORD *)(a1 + 392);
    if (v50 >= 1)
      goto LABEL_59;
LABEL_74:
    v52 = 0;
    goto LABEL_75;
  }
LABEL_73:
  bzero((void *)(*(_QWORD *)(a1 + 344) + 4 * *(_QWORD *)(a1 + 336)), 4 * v49);
  *(_QWORD *)(a1 + 336) = v40;
  v50 = *(_QWORD *)(a1 + 392);
  if (v50 < 1)
    goto LABEL_74;
LABEL_59:
  v51 = *(_QWORD *)(a1 + 400);
  if (v51)
  {
    v52 = 0;
    v53 = a2;
    v54 = *(_DWORD **)(a1 + 400);
    v55 = v50;
    do
    {
      if (!*v53++)
        *(_DWORD *)(v51 + 4 * v52++) = *v54;
      ++v54;
      --v55;
    }
    while (v55);
LABEL_75:
    v60 = *(_QWORD *)(a1 + 408);
    if (v52 <= v60)
      goto LABEL_76;
    goto LABEL_84;
  }
  v52 = 0;
  v60 = *(_QWORD *)(a1 + 408);
  if (v60 >= 0)
  {
LABEL_76:
    v61 = v52 - v50;
    if (v52 <= v50)
      goto LABEL_77;
    goto LABEL_92;
  }
LABEL_84:
  v68 = 2 * v60;
  v11 = v60 == 0;
  v69 = 64;
  if (!v11)
    v69 = v68;
  if (v69 <= v52)
    v70 = v52;
  else
    v70 = v69;
  if (v70)
    *(_QWORD *)(a1 + 400) = malloc_type_realloc(*(void **)(a1 + 400), 4 * v70, 0xD771EB33uLL);
  *(_QWORD *)(a1 + 408) = v70;
  v61 = v52 - v50;
  if (v52 <= v50)
  {
LABEL_77:
    *(_QWORD *)(a1 + 392) = v52;
    v62 = *(_QWORD *)(a1 + 416);
    if (v62 >= 1)
      goto LABEL_78;
LABEL_93:
    v64 = 0;
    goto LABEL_94;
  }
LABEL_92:
  bzero((void *)(*(_QWORD *)(a1 + 400) + 4 * *(_QWORD *)(a1 + 392)), 4 * v61);
  *(_QWORD *)(a1 + 392) = v52;
  v62 = *(_QWORD *)(a1 + 416);
  if (v62 < 1)
    goto LABEL_93;
LABEL_78:
  v63 = *(_QWORD *)(a1 + 424);
  if (v63)
  {
    v64 = 0;
    v65 = *(_DWORD **)(a1 + 424);
    v66 = v62;
    do
    {
      if (!*a2++)
        *(_DWORD *)(v63 + 4 * v64++) = *v65;
      ++v65;
      --v66;
    }
    while (v66);
LABEL_94:
    v71 = *(_QWORD *)(a1 + 432);
    if (v64 <= v71)
      goto LABEL_95;
    goto LABEL_99;
  }
  v64 = 0;
  v71 = *(_QWORD *)(a1 + 432);
  if (v71 >= 0)
  {
LABEL_95:
    v72 = v64 - v62;
    if (v64 <= v62)
      goto LABEL_96;
LABEL_107:
    bzero((void *)(*(_QWORD *)(a1 + 424) + 4 * *(_QWORD *)(a1 + 416)), 4 * v72);
    *(_QWORD *)(a1 + 416) = v64;
    v73 = *(_DWORD *)(a1 + 588);
    if (v73 < 1)
      goto LABEL_116;
    goto LABEL_108;
  }
LABEL_99:
  v74 = 2 * v71;
  v11 = v71 == 0;
  v75 = 64;
  if (!v11)
    v75 = v74;
  if (v75 <= v64)
    v76 = v64;
  else
    v76 = v75;
  if (v76)
    *(_QWORD *)(a1 + 424) = malloc_type_realloc(*(void **)(a1 + 424), 4 * v76, 0x18E4DAECuLL);
  *(_QWORD *)(a1 + 432) = v76;
  v72 = v64 - v62;
  if (v64 > v62)
    goto LABEL_107;
LABEL_96:
  *(_QWORD *)(a1 + 416) = v64;
  v73 = *(_DWORD *)(a1 + 588);
  if (v73 < 1)
    goto LABEL_116;
LABEL_108:
  v77 = 0;
  v78 = *(_QWORD *)(a1 + 304);
  do
  {
    v79 = v78 + 880 * v77;
    v80 = *(_DWORD *)(v79 + 488);
    if (v80 >= 1)
    {
      v81 = 0;
      v82 = (int *)(v79 + 488);
      v83 = *(_QWORD *)(v78 + 880 * v77 + 400);
      do
      {
        v84 = *(int *)(v83 + 4 * v81);
        if ((_DWORD)v84 != -1)
        {
          *(_DWORD *)(v83 + 4 * v81) = v5[v84];
          v80 = *v82;
        }
        ++v81;
      }
      while (v81 < v80);
      v73 = *(_DWORD *)(a1 + 588);
    }
    ++v77;
  }
  while (v77 < v73);
LABEL_116:
  free(v5);
}

double rectify_pts(uint64_t a1, float32x2_t *a2, int a3, float *a4)
{
  uint64_t v5;
  int v8;
  long double v9;
  float v10;
  double v11;
  long double v12;
  float v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  double result;
  uint64_t v28;
  float64x2_t v29;
  float64x2_t v30;
  uint64_t v31;
  double v32;
  double v33;
  float64x2_t v34;

  LODWORD(v5) = a3;
  v31 = 0;
  v32 = 0.0;
  v33 = 0.0;
  v8 = *(_DWORD *)(a1 + 172) - 1;
  v34.f64[0] = (double)*(int *)(a1 + 168) + -0.5;
  v34.f64[1] = (double)v8 * 0.5;
  g_improj2_to_xyz(a1, &v34, (double *)&v31);
  v9 = v32;
  v10 = v32;
  *a4 = -v10;
  a4[2] = v10;
  v11 = (double)*(int *)(a1 + 172) + -0.5;
  v34.f64[0] = (double)(*(_DWORD *)(a1 + 168) - 1) * 0.5;
  v34.f64[1] = v11;
  g_improj2_to_xyz(a1, &v34, (double *)&v31);
  v12 = v33;
  v13 = v33;
  a4[1] = -v13;
  a4[3] = v13;
  v14 = *(_DWORD *)(a1 + 168);
  v15 = *(_DWORD *)(a1 + 172);
  if ((int)v5 >= 1)
  {
    v5 = v5;
    do
    {
      v30 = vcvtq_f64_f32(*a2);
      v28 = 0;
      v29 = 0uLL;
      g_improj2_to_xyz(a1, &v30, (double *)&v28);
      *a2++ = vcvt_f32_f64(v29);
      --v5;
    }
    while (v5);
  }
  v16 = atan(v9);
  v17 = v16 + v16;
  if (v16 + v16 == 0.0)
    v18 = 0.0;
  else
    v18 = v16 + v16;
  v19 = atan(v12);
  v20 = v19 + v19;
  if (v20 == 0.0)
    v21 = 0.0;
  else
    v21 = v20;
  v22 = tan(v20 * 0.5);
  v23 = v22 + v22;
  v24 = v17 * 0.5;
  v25 = (double)v15 / v23;
  v26 = tan(v24);
  *(_QWORD *)a1 = 4;
  *(long double *)(a1 + 8) = (double)v14 / (v26 + v26);
  *(long double *)(a1 + 16) = v25;
  *(double *)(a1 + 24) = v18;
  *(double *)(a1 + 32) = v21;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_DWORD *)(a1 + 168) = v14;
  *(_DWORD *)(a1 + 172) = v15;
  return result;
}

void _jac_patch_to_improj2(double *a1, float *a2, float *a3, double *a4, uint64_t a5, float a6, float a7)
{
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  float64x2_t v18;
  double v19;
  double v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  float64x2_t v53;
  float64x2_t v54;
  double v55;
  float64x2_t v56;
  double v57;
  _QWORD v58[7];

  v58[6] = *MEMORY[0x24BDAC8D0];
  v11 = a2[1];
  v12 = a4[10];
  v13 = *a2 - a4[9];
  v56 = 0uLL;
  v57 = 0.0;
  v14 = (v11 - v12) * (v11 - v12) + v13 * v13;
  v15 = a2[2] - a4[11];
  v16 = sqrt(v14 + v15 * v15);
  v53.f64[0] = a6;
  v53.f64[1] = a7;
  g_improj2_to_xyz(a5, &v53, v56.f64);
  v17 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v56, v56).f64[1]), v56.f64[0], v56.f64[0]) + v57 * v57);
  if (v17 <= 0.0)
  {
    v18 = 0uLL;
    v19 = 0.0;
  }
  else
  {
    v18 = vdivq_f64(v56, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));
    v19 = v57 / v17;
  }
  v54 = vmulq_n_f64(v18, v16);
  v55 = v19 * v16;
  v20 = *a3;
  v21 = a3[2];
  if (fabs(v20) <= fabsf(v21))
  {
    v25 = (float)-v21;
    v22 = a3[1];
    v24 = v22;
    v23 = 0.0;
  }
  else
  {
    v22 = a3[1];
    v23 = (float)-v22;
    v24 = 0.0;
    v25 = *a3;
  }
  v26 = sqrt(v25 * v25 + v23 * v23 + v24 * v24);
  v27 = 0.0;
  v28 = 0.0;
  v29 = 0.0;
  if (v26 > 0.0)
  {
    v29 = v23 / v26;
    v28 = v25 / v26;
    v27 = v24 / v26;
  }
  v30 = v22;
  v31 = v21;
  v32 = v30 * v27 - v28 * v31;
  v33 = v31 * v29 - v27 * v20;
  v34 = v20 * v28 - v29 * v30;
  v35 = a4[1];
  v37 = a4[2];
  v36 = a4[3];
  v38 = *a4 * v29 + 0.0 + v36 * v28;
  v39 = *a4 * v32 + 0.0 + v36 * v33;
  v40 = a4[6];
  v41 = a4[7];
  v42 = v38 + v40 * v27;
  v43 = v39 + v40 * v34;
  v44 = v35 * v29 + 0.0;
  v45 = v35 * v32 + 0.0;
  v46 = v37 * v29 + 0.0;
  v47 = v37 * v32 + 0.0;
  v48 = a4[4];
  v49 = a4[5];
  *(double *)v58 = v42;
  *(double *)&v58[1] = v44 + v48 * v28 + v41 * v27;
  v50 = v45 + v48 * v33 + v41 * v34;
  v51 = v47 + v49 * v33;
  v52 = a4[8];
  *(double *)&v58[2] = v46 + v49 * v28 + v52 * v27;
  *(double *)&v58[3] = v43;
  *(double *)&v58[4] = v50;
  *(double *)&v58[5] = v51 + v52 * v34;
  g_jac_apply_proj(v54.f64, a5, (uint64_t)v58, a1, 2);
}

uint64_t vl_verify_post(uint64_t a1, uint64_t a2, double *a3, _QWORD *a4, uint64_t a5, float *a6, uint64_t a7, uint64_t a8)
{
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  double v46[3];

  v12 = a3[9];
  v13 = a3[10];
  v46[0] = v12;
  v46[1] = v13;
  v14 = a3[11];
  v46[2] = v14;
  v15 = *(float *)(a7 + 632);
  v16 = *(float *)(a7 + 640);
  if (v16 < 0.0 && *(_DWORD *)(a7 + 560))
  {
    v17 = a6[24];
    if (v17 >= 0.000001)
    {
      if (model_0)
      {
        if (*(float *)(model_0 + 40) > v17)
          return 32;
        return 1;
      }
      printf("%sError : ", (const char *)&str_1_4);
      printf("vl_hs: Model not initiated");
      putchar(10);
      if (*(float *)(model_0 + 40) <= v17)
        return 1;
    }
    return 32;
  }
  if (*(_DWORD *)(a7 + 592) && *a4 < *(int *)(a7 + 612))
  {
    log_col_app((uint64_t)"%sFailed%s due to low inlier number. %d/%d", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
    return 32;
  }
  if (*(_DWORD *)(a7 + 596)
    && ((v19 = vl_height_get_for_global(a2 + 608, v46), v19 < *(float *)(a7 + 620)) || v19 > *(float *)(a7 + 616)))
  {
    if (v19 == 3.4028e38)
      log_col_app((uint64_t)"%sRejected%s: height = %sNone%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
    else
      log_col_app((uint64_t)"%sRejected%s: height = %s%.02f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
    return 128;
  }
  else
  {
    if (*(_DWORD *)(a7 + 600))
    {
      v20 = sqrt(v13 * v13 + v12 * v12 + v14 * v14);
      v21 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      if (v20 > 0.0)
      {
        v21 = v12 / v20;
        v22 = v13 / v20;
        v23 = v14 / v20;
      }
      v24 = *(float *)(a1 + 232);
      v25 = *(float *)(a1 + 236);
      v26 = *(float *)(a1 + 240);
      if (acos(-(v22 * (a3[3] * v24 + 0.0 + a3[4] * v25 + a3[5] * v26))- v21 * (*a3 * v24 + 0.0 + a3[1] * v25 + a3[2] * v26)- v23 * (a3[6] * v24 + 0.0 + a3[7] * v25 + a3[8] * v26)) > *(double *)(a7 + 624))
      {
        log_col_app((uint64_t)"%sRejected%s: gravity = %s%.02f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
        return 256;
      }
    }
    if (!*(_DWORD *)(a7 + 604))
      goto LABEL_24;
    v27 = *(double *)(a1 + 200);
    v28 = *(double *)(a1 + 208);
    v29 = *(double *)(a1 + 216);
    v30 = v12 - v27;
    v31 = v13 - v28;
    v32 = v14 - v29;
    v33 = sqrt(v28 * v28 + v27 * v27 + v29 * v29);
    v34 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
    if (v33 > 0.0)
    {
      v34 = -v27 / v33;
      v35 = -v28 / v33;
      v36 = -v29 / v33;
    }
    v37 = v31 * v35 + v30 * v34 + v32 * v36;
    if (sqrt((v31 - v35 * v37) * (v31 - v35 * v37)+ (v30 - v34 * v37) * (v30 - v34 * v37)+ (v32 - v36 * v37) * (v32 - v36 * v37)) <= v15 * *(float *)(a1 + 224))
    {
LABEL_24:
      if (a6[24] < v16)
      {
        log_col_app((uint64_t)"%sRejected%s: conf = %s%.04f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
        return 4096;
      }
      log_col_app((uint64_t)"%sAccepted%s: conf = %s%.04f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
      v45 = *(float *)(a7 + 644);
      if (v45 >= 0.0 && sqrtf((float)(a6[25] + a6[32]) + a6[39]) > v45)
      {
        log_col_app((uint64_t)"%sRejected%s: sdev = %s%.02f%s.", v38, v39, v40, v41, v42, v43, v44, (char)&unk_210BC3C5E);
        return 64;
      }
      return 1;
    }
    log_col_app((uint64_t)"%sRejected%s: gps = %s%.02f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_210BC3C5E);
    return 512;
  }
}

tm *dtime_get(tm *result, int *a2, int *a3, int *a4, int *a5, int *a6, double *a7, int tm_gmtoff)
{
  int tm_sec;
  tm *v15;
  double v16;
  int v18;
  double v19;
  int v20;
  int v21;
  double v22;
  int v23;
  int v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  BOOL v47;
  int v48;
  tm v49;
  time_t v50;

  tm_sec = result->tm_sec;
  if (result->tm_sec == -16777215)
    __assert_rtn("dtime_get", "arch_dtime.c", 450, "dtime_is_def(t)");
  v15 = result;
  if (tm_gmtoff == 1000000)
  {
    v50 = 0;
    memset(&v49, 0, sizeof(v49));
    time(&v50);
    result = localtime_r(&v50, &v49);
    tm_gmtoff = v49.tm_gmtoff;
    tm_sec = v15->tm_sec;
  }
  v16 = *(double *)&v15->tm_hour + (double)tm_gmtoff;
  if (v16 < 0.0 || v16 >= 86400.0)
  {
    v18 = vcvtmd_s64_f64(v16 / 86400.0);
    tm_sec += v18;
    v16 = v16 - (double)v18 * 86400.0;
  }
  v19 = v16 / 60.0 / 60.0;
  v20 = (int)v19;
  if (a5)
  {
    v21 = 0;
    *a5 = v20;
  }
  else
  {
    v21 = (int)v19;
  }
  v22 = v16 - (double)(3600 * v20);
  v23 = (int)(v22 / 60.0);
  if (a6)
    *a6 = v23;
  if (a7)
    *a7 = v22 - (double)(60 * v23);
  if (a5)
  {
    v24 = *a5;
    if (*a5 >= 24)
    {
      *a5 -= 24;
LABEL_20:
      ++tm_sec;
      goto LABEL_25;
    }
    if (v24 < 0)
    {
      *a5 = v24 + 24;
LABEL_24:
      --tm_sec;
    }
  }
  else
  {
    if (v21 > 23)
      goto LABEL_20;
    if (v21 < 0)
      goto LABEL_24;
  }
LABEL_25:
  if (tm_sec != -1)
  {
    v25 = 0;
    if (a2)
    {
      v26 = 1969;
      do
      {
        v27 = v25;
        if ((++v26 & 3) != 0)
          v28 = 365;
        else
          v28 = 366;
        v25 = v28 + v27;
      }
      while (v25 <= tm_sec);
      v29 = 0;
      *a2 = v26;
    }
    else
    {
      v29 = -79;
      do
      {
        v27 = v25;
        if ((++v29 & 3) != 0)
          v31 = 365;
        else
          v31 = 366;
        v25 = v31 + v27;
      }
      while (v25 <= tm_sec);
    }
    v32 = tm_sec - v27;
    if (!a3)
    {
      if (a2)
      {
        v40 = v32 - 31;
        if ((uint64_t)v32 < 31)
          goto LABEL_110;
        v41 = (*(_BYTE *)a2 & 3) != 0 ? 28 : 29;
        LODWORD(v32) = v32 - 31;
        v47 = v40 >= v41;
        v42 = v40 - v41;
        if (!v47)
          goto LABEL_110;
      }
      else
      {
        v43 = v32 - 31;
        if ((uint64_t)v32 < 31)
          goto LABEL_110;
        v44 = (v29 & 3) != 0 ? 28 : 29;
        LODWORD(v32) = v32 - 31;
        v47 = v43 >= v44;
        v42 = v43 - v44;
        if (!v47)
          goto LABEL_110;
      }
      LODWORD(v32) = v42;
      if ((uint64_t)v42 >= 31)
      {
        LODWORD(v32) = v42 - 31;
        if (v42 >= 0x3D)
        {
          LODWORD(v32) = v42 - 61;
          if (v42 >= 0x5C)
          {
            LODWORD(v32) = v42 - 92;
            if (v42 >= 0x7A)
            {
              LODWORD(v32) = v42 - 122;
              if (v42 >= 0x99)
              {
                LODWORD(v32) = v42 - 153;
                if (v42 >= 0xB8)
                {
                  LODWORD(v32) = v42 - 184;
                  if (v42 >= 0xD6)
                  {
                    LODWORD(v32) = v42 - 214;
                    if (v42 >= 0xF5)
                    {
                      LODWORD(v32) = v42 - 245;
                      if (v42 >= 0x113)
                      {
                        v45 = -306;
                        if (v42 < 0x132)
                          v45 = -275;
                        LODWORD(v32) = v45 + v42;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      goto LABEL_110;
    }
    if (a2)
    {
      v33 = 1;
      v34 = v32 - 31;
      if ((uint64_t)v32 < 31)
        goto LABEL_109;
      *a3 = 1;
      v35 = 28;
      if ((*(_BYTE *)a2 & 3) == 0)
        v35 = 29;
      v47 = v34 >= v35;
      v32 = v34 - v35;
      if (!v47)
      {
LABEL_93:
        v33 = 2;
LABEL_94:
        LODWORD(v32) = v34;
        goto LABEL_109;
      }
      LODWORD(v34) = v32 - 31;
      if ((uint64_t)v32 >= 31)
      {
        v36 = v32 - 61;
        if (v32 >= 0x3D)
        {
          LODWORD(v34) = v32 - 92;
          if (v32 >= 0x5C)
          {
            v37 = v32 - 122;
            if (v32 >= 0x7A)
            {
              LODWORD(v34) = v32 - 153;
              if (v32 >= 0x99)
              {
                v38 = v32 - 184;
                if (v32 >= 0xB8)
                {
                  LODWORD(v34) = v32 - 214;
                  if (v32 >= 0xD6)
                  {
                    v39 = v32 - 245;
                    if (v32 >= 0xF5)
                    {
                      LODWORD(v34) = v32 - 275;
                      if (v32 >= 0x113)
                      {
                        v33 = 12;
                        v47 = v32 >= 0x132;
                        LODWORD(v32) = v32 - 306;
                        if (!v47)
                          goto LABEL_94;
                        *a3 = 12;
                        v33 = 13;
LABEL_109:
                        *a3 = v33;
LABEL_110:
                        v30 = v32 + 1;
                        goto LABEL_111;
                      }
LABEL_118:
                      v33 = 11;
                      LODWORD(v32) = v39;
                      goto LABEL_109;
                    }
                    goto LABEL_116;
                  }
                  goto LABEL_108;
                }
                goto LABEL_106;
              }
              goto LABEL_104;
            }
            goto LABEL_102;
          }
          goto LABEL_100;
        }
        goto LABEL_98;
      }
    }
    else
    {
      v34 = v32 - 31;
      if ((uint64_t)v32 < 31)
      {
        v33 = 1;
        goto LABEL_109;
      }
      v46 = 28;
      if ((v29 & 3) == 0)
        v46 = 29;
      v47 = v34 >= v46;
      v32 = v34 - v46;
      if (!v47)
        goto LABEL_93;
      LODWORD(v34) = v32 - 31;
      if ((uint64_t)v32 >= 31)
      {
        v36 = v32 - 61;
        if (v32 >= 0x3D)
        {
          LODWORD(v34) = v32 - 92;
          if (v32 >= 0x5C)
          {
            v37 = v32 - 122;
            if (v32 >= 0x7A)
            {
              LODWORD(v34) = v32 - 153;
              if (v32 >= 0x99)
              {
                v38 = v32 - 184;
                if (v32 >= 0xB8)
                {
                  LODWORD(v34) = v32 - 214;
                  if (v32 >= 0xD6)
                  {
                    v39 = v32 - 245;
                    if (v32 >= 0xF5)
                    {
                      if (v32 >= 0x113)
                      {
                        v47 = v32 >= 0x132;
                        v48 = -306;
                        if (v32 < 0x132)
                          v48 = -275;
                        LODWORD(v32) = v32 + v48;
                        if (v47)
                          v33 = 13;
                        else
                          v33 = 12;
                        goto LABEL_109;
                      }
                      goto LABEL_118;
                    }
LABEL_116:
                    v33 = 10;
                    goto LABEL_94;
                  }
LABEL_108:
                  v33 = 9;
                  LODWORD(v32) = v38;
                  goto LABEL_109;
                }
LABEL_106:
                v33 = 8;
                goto LABEL_94;
              }
LABEL_104:
              v33 = 7;
              LODWORD(v32) = v37;
              goto LABEL_109;
            }
LABEL_102:
            v33 = 6;
            goto LABEL_94;
          }
LABEL_100:
          v33 = 5;
          LODWORD(v32) = v36;
          goto LABEL_109;
        }
LABEL_98:
        v33 = 4;
        goto LABEL_94;
      }
    }
    v33 = 3;
    goto LABEL_109;
  }
  if (a2)
    *a2 = 1969;
  if (a3)
    *a3 = 12;
  v30 = 31;
LABEL_111:
  if (a4)
    *a4 = v30;
  return result;
}

void _da_sort_indexed(char *a1, int64_t a2, void **a3, int64_t *a4, int64_t *a5, size_t a6, int (__cdecl *a7)(const void *, const void *))
{
  size_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  int64_t *v24;

  v14 = a6 + 8;
  v15 = (char *)malloc_type_malloc((a6 + 8) * a2, 0x38CCE670uLL);
  if (*a5 < a2)
  {
    free(*a3);
    *a3 = malloc_type_malloc(8 * a2, 0xD43CE050uLL);
    *a5 = a2;
  }
  if (a2)
  {
    v24 = a4;
    v16 = 0;
    v17 = a1;
    v18 = v15;
    do
    {
      memcpy(v18, v17, a6);
      v19 = &v18[a6];
      *(_QWORD *)v19 = v16;
      v18 = v19 + 8;
      ++v16;
      v17 += a6;
    }
    while (a2 != v16);
    qsort(v15, a2, v14, a7);
    v20 = 0;
    v21 = v15;
    a4 = v24;
    do
    {
      memcpy(a1, v21, a6);
      v22 = &v21[a6];
      v23 = *(_QWORD *)v22;
      v21 = v22 + 8;
      *((_QWORD *)*a3 + v20++) = v23;
      a1 += a6;
    }
    while (a2 != v20);
  }
  else
  {
    qsort(v15, 0, v14, a7);
  }
  *a4 = a2;
  free(v15);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t GEOAngleDifferenceDegrees()
{
  return MEMORY[0x24BE3C910]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x24BE3C930]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x24BE3C948]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x24BE3C970]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x24BE3C9F8]();
}

uint64_t GEOGetMonotonicTime()
{
  return MEMORY[0x24BE3CA30]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x24BE3CA48]();
}

uint64_t GEOOnce()
{
  return MEMORY[0x24BE3CAA8]();
}

uint64_t GEOTileKeyEquals()
{
  return MEMORY[0x24BE3CAE0]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x24BE3CAE8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CA9AD28(__p);
}

uint64_t operator delete()
{
  return off_24CA9AD30();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA9AD38(__sz);
}

uint64_t operator new()
{
  return off_24CA9AD40();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  return MEMORY[0x24BDAC968](a1, *(_QWORD *)&a2, a3, a4, a5);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x24BEDA398]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x24BEDA3D8]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x24BEDA3E0]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x24BEDA578]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x24BEDA580]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_format_v7tar()
{
  return MEMORY[0x24BEDA658]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x24BDAD260](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

float cbrtf(float a1)
{
  float result;

  MEMORY[0x24BDAD338](a1);
  return result;
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_context_auto()
{
  return MEMORY[0x24BE2FB28]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_get_default_storage_type()
{
  return MEMORY[0x24BE2FB50]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x24BE2FB70]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x24BE2FBE8]();
}

uint64_t espresso_network_change_blob_shape()
{
  return MEMORY[0x24BE2FC00]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x24BE2FC38]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x24BE2FC50]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x24BE2FC88]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x24BE3D190]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x24BE3D1A0]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x24BE3D1A8]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x24BE3D1B0]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAE7B8](a1, a2);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  float result;

  MEMORY[0x24BDAEA38](*(_QWORD *)&a2, a1);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED90](size, type_id);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFC8](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int nftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int, FTW *), int a3, int a4)
{
  return MEMORY[0x24BDAF128](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
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

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x24BDAFA40](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB0](__ptr, __size);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE28](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34C0](__A, __IA, __B, __C, __IC, __N);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x24BDB3630](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39C8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A60](src, dest, tempBuffer, *(_QWORD *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x24BDB3B30](a1, a2, a3);
}

