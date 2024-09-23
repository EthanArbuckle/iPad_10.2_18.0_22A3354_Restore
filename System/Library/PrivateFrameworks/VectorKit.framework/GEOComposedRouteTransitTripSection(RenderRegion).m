@implementation GEOComposedRouteTransitTripSection(RenderRegion)

- (uint64_t)_getEndPoints:()RenderRegion rect:result:
{
  id v7;
  uint64_t v8;
  void *v9;
  float *v10;
  float v11;
  unsigned int v12;
  uint64_t v13;
  float v14;
  uint64_t v15;

  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "pointCount"))
      goto LABEL_5;
    v10 = (float *)objc_msgSend(v9, "points");
    v11 = v10[1];
    *a5 = *a4 + (a4[2] - *a4) * *v10;
    a5[1] = a4[1] + (a4[3] - a4[1]) * v11;

    objc_msgSend(v7, "objectAtIndex:", v8 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "pointCount");
    if (v12)
    {
      v13 = objc_msgSend(v9, "points") + 12 * v12;
      v14 = *(float *)(v13 - 8);
      a5[2] = *a4 + (a4[2] - *a4) * *(float *)(v13 - 12);
      a5[3] = a4[1] + (a4[3] - a4[1]) * v14;
      v15 = 1;
    }
    else
    {
LABEL_5:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_validateSnappedPaths:()RenderRegion snappedTileBounds:overlay:
{
  void *v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  _BOOL8 v17;
  uint64_t v18;
  unint64_t v19;
  double **v20;
  uint64_t v21;
  double v22;
  char *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  double **v28;
  uint64_t *v29;
  double **v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t *v36;
  unint64_t v37;
  double **v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _BYTE *v46;
  double **v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  double **v52;
  char *v53;
  int64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t *v60;
  int64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  _OWORD *v70;
  uint64_t *v71;
  uint64_t v72;
  __int128 v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  __int128 v79;
  __int128 v80;
  uint64_t *v81;
  uint64_t v82;
  char *v83;
  double **v84;
  uint64_t v85;
  __int128 v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  double *v90;
  double **v91;
  char *v92;
  double v93;
  unint64_t v94;
  double **v95;
  unint64_t v96;
  unint64_t v97;
  double **v98;
  double **v99;
  double *v100;
  double **v101;
  unint64_t v102;
  double **v103;
  double **v104;
  double *v105;
  double *v106;
  double v107;
  double *v108;
  double *v109;
  double v110;
  BOOL v111;
  double *v112;
  double **v113;
  double **i;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  double v118;
  unint64_t v119;
  double **v120;
  unint64_t v121;
  unint64_t v122;
  double **v123;
  double **v124;
  double *v125;
  double **v126;
  unint64_t v127;
  double **v128;
  double **v129;
  double *v130;
  double *v131;
  double *v132;
  double *v133;
  double v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  id v140;
  id v141;
  id obj;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  double **v146;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  void *__p;
  uint64_t *v153;
  char *v154;
  __int128 v155;
  __int128 *v156;
  __int128 v157;
  __int128 *v158;
  double v159[4];
  _OWORD v160[2];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v141 = a3;
  v140 = a5;
  objc_msgSend(a1, "unsnappedPathsInOverlay:", v140);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double *)&a1[*MEMORY[0x1E0D27760]];
  v9 = v8[1];
  v10 = *(double *)(MEMORY[0x1E0D266E8] + 16);
  v11 = *(double *)(MEMORY[0x1E0D266E8] + 24);
  v12 = 1.0 - (v8[4] + v9) / v11;
  v13 = (v8[3] + *v8) / v10;
  v159[0] = *v8 / v10;
  v159[1] = v12;
  v159[2] = v13;
  v159[3] = 1.0 - v9 / v11;
  if ((objc_msgSend(a1, "_getEndPoints:rect:result:", v7, v159, v160) & 1) == 0)
  {
    v17 = 0;
    goto LABEL_187;
  }
  v155 = v160[0];
  v156 = &v155;
  v157 = v160[1];
  v158 = &v155;
  __p = 0;
  v153 = 0;
  v154 = 0;
  v14 = objc_msgSend(v141, "count");
  v15 = v14;
  if (v14)
  {
    if (v14 >> 61)
      goto LABEL_191;
    v16 = (char *)operator new(8 * v14);
    __p = v16;
    v153 = (uint64_t *)v16;
    v154 = &v16[8 * v15];
  }
  else
  {
    v16 = 0;
  }
  v18 = objc_msgSend(v141, "count");
  v19 = 2 * v18;
  if (!(2 * v18))
  {
    v146 = 0;
    v20 = 0;
    goto LABEL_11;
  }
  if (v19 >> 61)
LABEL_191:
    abort();
  v20 = (double **)operator new(16 * v18);
  v146 = &v20[v19];
LABEL_11:
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  obj = v141;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
  if (!v21)
  {

    v17 = 0;
    if (!v20)
      goto LABEL_181;
    goto LABEL_180;
  }
  v144 = *(_QWORD *)v149;
  v22 = 0.0000001;
  v23 = (char *)v20;
  v145 = v7;
  do
  {
    v24 = 0;
    v143 = v21;
    do
    {
      if (*(_QWORD *)v149 != v144)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v24);
      v26 = objc_msgSend(v25, "pointCount");
      if (v26)
      {
        v27 = operator new();
        *(_OWORD *)(v27 + 16) = 0u;
        *(_OWORD *)(v27 + 32) = 0u;
        *(_OWORD *)v27 = 0u;
        v28 = v146;
        *(float64x2_t *)v27 = vmlaq_f64(*a4, vcvtq_f64_f32(*(float32x2_t *)objc_msgSend(v25, "points")), vsubq_f64(a4[1], *a4));
        *(_QWORD *)(v27 + 16) = v27;
        if (v20 < v146)
        {
          *v20 = (double *)v27;
          v29 = (uint64_t *)(v20 + 1);
          goto LABEL_42;
        }
        v30 = v20;
        v31 = (char *)v20 - v23;
        v32 = ((char *)v20 - v23) >> 3;
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 61)
          goto LABEL_189;
        if (((char *)v146 - v23) >> 2 > v33)
          v33 = ((char *)v146 - v23) >> 2;
        if ((unint64_t)((char *)v146 - v23) >= 0x7FFFFFFFFFFFFFF8)
          v34 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v34 = v33;
        if (v34)
        {
          if (v34 >> 61)
            goto LABEL_188;
          v35 = (char *)operator new(8 * v34);
        }
        else
        {
          v35 = 0;
        }
        v36 = (uint64_t *)&v35[8 * v32];
        *v36 = v27;
        v29 = v36 + 1;
        if (v30 == (double **)v23)
        {
          v23 = &v35[8 * v32];
          v39 = v30;
          v28 = (double **)&v35[8 * v34];
          if (v30)
            goto LABEL_41;
        }
        else
        {
          v37 = (char *)(v30 - 1) - v23;
          if (v37 < 0x168)
          {
            v38 = v30;
            goto LABEL_39;
          }
          if (&v35[v31 - 8 - (v37 & 0xFFFFFFFFFFFFFFF8)] > &v35[v31 - 8]
            || (double **)((char *)v30 - (v37 & 0xFFFFFFFFFFFFFFF8) - 8) > v30 - 1
            || (unint64_t)((char *)v30 - &v35[v31]) < 0x20)
          {
            v38 = v30;
            goto LABEL_39;
          }
          v82 = (v37 >> 3) + 1;
          v38 = &v30[-(v82 & 0x3FFFFFFFFFFFFFFCLL)];
          v83 = &v35[8 * v32 - 16];
          v84 = v30 - 2;
          v85 = v82 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v86 = *(_OWORD *)v84;
            *((_OWORD *)v83 - 1) = *((_OWORD *)v84 - 1);
            *(_OWORD *)v83 = v86;
            v83 -= 32;
            v84 -= 4;
            v85 -= 4;
          }
          while (v85);
          v36 -= v82 & 0x3FFFFFFFFFFFFFFCLL;
          if (v82 != (v82 & 0x3FFFFFFFFFFFFFFCLL))
          {
            do
            {
LABEL_39:
              v40 = (uint64_t)*--v38;
              *--v36 = v40;
            }
            while (v38 != (double **)v23);
          }
          v39 = v23;
          v23 = (char *)v36;
          v28 = (double **)&v35[8 * v34];
          if (v39)
LABEL_41:
            operator delete(v39);
        }
LABEL_42:
        v41 = v27 + 24;
        *(float64x2_t *)(v27 + 24) = vmlaq_f64(*a4, vcvtq_f64_f32(*(float32x2_t *)(objc_msgSend(v25, "points") + 12 * (v26 - 1))), vsubq_f64(a4[1], *a4));
        *(_QWORD *)(v27 + 40) = v27;
        if (v29 < (uint64_t *)v28)
        {
          v146 = v28;
          *v29 = v41;
          v42 = v23;
          v20 = (double **)(v29 + 1);
          v7 = v145;
          goto LABEL_62;
        }
        v43 = ((char *)v29 - v23) >> 3;
        v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 61)
LABEL_189:
          abort();
        if (((char *)v28 - v23) >> 2 > v44)
          v44 = ((char *)v28 - v23) >> 2;
        if ((unint64_t)((char *)v28 - v23) >= 0x7FFFFFFFFFFFFFF8)
          v45 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v45 = v44;
        if (v45)
        {
          if (v45 >> 61)
            goto LABEL_188;
          v46 = operator new(8 * v45);
        }
        else
        {
          v46 = 0;
        }
        v42 = &v46[8 * v43];
        *v42 = v41;
        v47 = (double **)(v42 + 1);
        if (v29 == (uint64_t *)v23)
        {
          v7 = v145;
          v20 = (double **)(v42 + 1);
          goto LABEL_60;
        }
        v48 = (char *)(v29 - 1) - v23;
        v7 = v145;
        if (v48 < 0x168
          || &v46[(char *)v29 - v23 - 8 - (v48 & 0xFFFFFFFFFFFFFFF8)] > &v46[(char *)v29 - v23 - 8]
          || (uint64_t *)((char *)v29 - (v48 & 0xFFFFFFFFFFFFFFF8) - 8) > v29 - 1
          || (unint64_t)(v23 - v46) < 0x20)
        {
          v49 = (char *)v29;
          v20 = (double **)(v42 + 1);
        }
        else
        {
          v69 = (v48 >> 3) + 1;
          v49 = (char *)&v29[-(v69 & 0x3FFFFFFFFFFFFFFCLL)];
          v70 = &v46[8 * v43 - 16];
          v71 = v29 - 2;
          v72 = v69 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v73 = *(_OWORD *)v71;
            *(v70 - 1) = *((_OWORD *)v71 - 1);
            *v70 = v73;
            v70 -= 2;
            v71 -= 4;
            v72 -= 4;
          }
          while (v72);
          v42 -= v69 & 0x3FFFFFFFFFFFFFFCLL;
          v20 = v47;
          if (v69 == (v69 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_60:
            v146 = (double **)&v46[8 * v45];
            if (v23)
              operator delete(v23);
LABEL_62:
            v51 = (char *)v153;
            if (v153 < (uint64_t *)v154)
            {
              *v153 = v27;
              v16 = v51 + 8;
LABEL_89:
              v153 = (uint64_t *)v16;
              objc_msgSend(v25, "vertexEqualityTolerance");
              v22 = fmax(v22, v68 + v68);
              v23 = (char *)v42;
              v21 = v143;
              goto LABEL_14;
            }
            v52 = v20;
            v53 = (char *)__p;
            v54 = (char *)v153 - (_BYTE *)__p;
            v55 = ((char *)v153 - (_BYTE *)__p) >> 3;
            v56 = v55 + 1;
            if ((unint64_t)(v55 + 1) >> 61)
              abort();
            v57 = v154 - (_BYTE *)__p;
            if ((v154 - (_BYTE *)__p) >> 2 > v56)
              v56 = v57 >> 2;
            if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
              v58 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v58 = v56;
            if (v58)
            {
              if (v58 >> 61)
                goto LABEL_188;
              v59 = (char *)operator new(8 * v58);
            }
            else
            {
              v59 = 0;
            }
            v60 = (uint64_t *)&v59[8 * v55];
            *v60 = v27;
            v16 = (char *)(v60 + 1);
            v61 = v51 - v53;
            if (v51 == v53)
            {
              __p = v60;
              v154 = &v59[8 * v58];
              v20 = v52;
              v7 = v145;
              if (!v51)
                goto LABEL_89;
            }
            else
            {
              v62 = v61 - 8;
              if ((unint64_t)(v61 - 8) > 0x77
                && ((v63 = v62 >> 3, &v51[-8 * (v62 >> 3) - 8] >= (char *)v60)
                 || &v59[v54 - (v62 & 0xFFFFFFFFFFFFFFF8) - 8] >= v51))
              {
                v74 = 0;
                v75 = v63 + 1;
                v76 = (v63 + 1) & 0x3FFFFFFFFFFFFFFCLL;
                v64 = &v51[-8 * v76];
                v77 = v76;
                do
                {
                  v78 = &v51[v74];
                  v80 = *(_OWORD *)&v51[v74 - 32];
                  v79 = *(_OWORD *)&v51[v74 - 16];
                  v81 = &v60[v74 / 8];
                  *((_OWORD *)v78 - 2) = 0uLL;
                  *((_OWORD *)v78 - 1) = 0uLL;
                  *((_OWORD *)v81 - 2) = v80;
                  *((_OWORD *)v81 - 1) = v79;
                  v74 -= 32;
                  v77 -= 4;
                }
                while (v77);
                v60 -= v76;
                v20 = v52;
                v7 = v145;
                if (v75 != v76)
                  goto LABEL_79;
              }
              else
              {
                v64 = v51;
                v20 = v52;
                v7 = v145;
                do
                {
LABEL_79:
                  v65 = *((_QWORD *)v64 - 1);
                  v64 -= 8;
                  *(_QWORD *)v64 = 0;
                  *--v60 = v65;
                }
                while (v64 != v53);
                v53 = (char *)__p;
                v51 = (char *)v153;
              }
              __p = v60;
              v154 = &v59[8 * v58];
              if (v51 != v53)
              {
                do
                {
                  v67 = *((_QWORD *)v51 - 1);
                  v51 -= 8;
                  v66 = v67;
                  *(_QWORD *)v51 = 0;
                  if (v67)
                    MEMORY[0x1A1AF4E00](v66, 0x1020C4005C7B374);
                }
                while (v51 != v53);
                v51 = v53;
              }
              if (!v51)
                goto LABEL_89;
            }
            operator delete(v51);
            goto LABEL_89;
          }
        }
        do
        {
          v50 = *((_QWORD *)v49 - 1);
          v49 -= 8;
          *--v42 = v50;
        }
        while (v49 != v23);
        goto LABEL_60;
      }
LABEL_14:
      ++v24;
    }
    while (v24 != v21);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
  }
  while (v21);
  v87 = (char *)__p;

  if (v87 == v16)
    goto LABEL_179;
  v88 = 126 - 2 * __clz(((char *)v20 - v23) >> 3);
  if (v20 == (double **)v23)
    v89 = 0;
  else
    v89 = v88;
  std::__introsort<std::_ClassicAlgPolicy,PointInfoSorterByX &,PointInfo **,false>((unint64_t)v23, v20, v89, 1);
  v90 = (double *)&v155;
  if (v20 != (double **)v23)
  {
    do
    {
      v93 = *v90;
      v94 = ((char *)v20 - v23) >> 3;
      v95 = (double **)v23;
      v96 = v94;
      do
      {
        v97 = v96 >> 1;
        v98 = &v95[v96 >> 1];
        v100 = *v98;
        v99 = v98 + 1;
        v96 += ~(v96 >> 1);
        if (*v100 < *v90 - v22)
          v95 = v99;
        else
          v96 = v97;
      }
      while (v96);
      v101 = (double **)v23;
      do
      {
        v102 = v94 >> 1;
        v103 = &v101[v94 >> 1];
        v105 = *v103;
        v104 = v103 + 1;
        v94 += ~(v94 >> 1);
        if (*v105 > v93 + v22)
          v94 = v102;
        else
          v101 = v104;
      }
      while (v94);
      if (v95 == v101)
        goto LABEL_179;
      v106 = 0;
      v107 = v22;
      do
      {
        v109 = *v95++;
        v108 = v109;
        v110 = fmax(vabdd_f64(v93, *v109), vabdd_f64(v90[1], v109[1]));
        v111 = v110 < v107;
        v107 = fmin(v110, v107);
        if (v111)
          v106 = v108;
      }
      while (v95 != v101);
      if (!v106)
        goto LABEL_179;
      v112 = (double *)*((_QWORD *)v106 + 2);
      if (v106 == v112)
        v90 = v112 + 3;
      else
        v90 = (double *)*((_QWORD *)v106 + 2);
      v113 = (double **)v23;
      while (*((double **)*v113 + 2) != v112)
      {
        if (++v113 == v20)
          goto LABEL_116;
      }
      if (v113 != v20)
      {
        for (i = v113 + 1; i != v20; ++i)
        {
          if (*((double **)*i + 2) != v112)
            *v113++ = *i;
        }
      }
      if (v113 != v20)
        v20 = v113;
LABEL_116:
      ;
    }
    while (v23 != (char *)v20);
    v20 = (double **)v23;
    if (v23 >= (char *)v146)
      goto LABEL_151;
LABEL_114:
    *v20 = (double *)&v157;
    v91 = v20 + 1;
    if (v91 != (double **)v23)
    {
      v92 = (char *)v91;
      goto LABEL_162;
    }
LABEL_179:
    v17 = 0;
    v20 = (double **)v23;
    if (!v23)
      goto LABEL_181;
LABEL_180:
    operator delete(v20);
    goto LABEL_181;
  }
  if (v20 < v146)
    goto LABEL_114;
LABEL_151:
  v115 = ((char *)v20 - v23) >> 3;
  v116 = v115 + 1;
  if ((unint64_t)(v115 + 1) >> 61)
    abort();
  if (((char *)v146 - v23) >> 2 > v116)
    v116 = ((char *)v146 - v23) >> 2;
  if ((unint64_t)((char *)v146 - v23) >= 0x7FFFFFFFFFFFFFF8)
    v116 = 0x1FFFFFFFFFFFFFFFLL;
  if (v116)
  {
    if (v116 >> 61)
LABEL_188:
      std::__throw_bad_array_new_length[abi:nn180100]();
    v117 = (char *)operator new(8 * v116);
  }
  else
  {
    v117 = 0;
  }
  v23 = &v117[8 * v115];
  *(_QWORD *)v23 = &v157;
  v92 = v23 + 8;
  if (v20)
    operator delete(v20);
LABEL_162:
  v118 = *v90;
  v119 = (v92 - v23) >> 3;
  v120 = (double **)v23;
  v121 = v119;
  do
  {
    v122 = v121 >> 1;
    v123 = &v120[v121 >> 1];
    v125 = *v123;
    v124 = v123 + 1;
    v121 += ~(v121 >> 1);
    if (*v125 < *v90 - v22)
      v120 = v124;
    else
      v121 = v122;
  }
  while (v121);
  v126 = (double **)v23;
  do
  {
    v127 = v119 >> 1;
    v128 = &v126[v119 >> 1];
    v130 = *v128;
    v129 = v128 + 1;
    v119 += ~(v119 >> 1);
    if (*v130 > v118 + v22)
      v119 = v127;
    else
      v126 = v129;
  }
  while (v119);
  if (v120 == v126)
    goto LABEL_179;
  v131 = 0;
  do
  {
    v133 = *v120++;
    v132 = v133;
    v134 = fmax(vabdd_f64(v118, *v133), vabdd_f64(v90[1], v133[1]));
    v111 = v134 < v22;
    v22 = fmin(v134, v22);
    if (v111)
      v131 = v132;
  }
  while (v120 != v126);
  v17 = v131 != 0;
  v20 = (double **)v23;
  if (v23)
    goto LABEL_180;
LABEL_181:
  v135 = (uint64_t *)__p;
  if (__p)
  {
    v136 = v153;
    while (v136 != v135)
    {
      v138 = *--v136;
      v137 = v138;
      *v136 = 0;
      if (v138)
        MEMORY[0x1A1AF4E00](v137, 0x1020C4005C7B374);
    }
    v153 = v135;
    operator delete(v135);
  }
LABEL_187:

  return v17;
}

- (id)pathsForRenderRegion:()RenderRegion inOverlay:shouldSnapToTransit:verifySnapping:
{
  id v9;
  char *v10;
  char *v11;
  __int128 v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  geo::codec::VectorTile *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t LineCount;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  unsigned int LineDirection;
  unsigned int v30;
  _BOOL4 v31;
  _BOOL4 v32;
  BOOL v34;
  BOOL v35;
  BOOL v36;
  char v37;
  _BOOL4 v38;
  _BOOL4 v39;
  std::__shared_weak_count *v44;
  geo::codec::VectorTile *v45;
  unint64_t v46;
  _BOOL4 v49;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  BOOL v56;
  BOOL v58;
  int v60;
  std::__shared_weak_count *v61;
  uint64_t v62;
  _BOOL4 v65;
  BOOL v68;
  _QWORD *v69;
  BOOL v70;
  BOOL v71;
  BOOL v73;
  unint64_t v75;
  _BOOL4 v78;
  BOOL v82;
  uint64_t v83;
  _QWORD *v84;
  BOOL v85;
  BOOL v87;
  BOOL v88;
  uint64_t v90;
  _BOOL4 v93;
  BOOL v97;
  _QWORD *v98;
  BOOL v99;
  BOOL v101;
  BOOL v102;
  unint64_t *p_shared_owners;
  unint64_t v105;
  uint64_t v106;
  int v107;
  double v108;
  double v109;
  double v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  id v114;
  _QWORD *v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  geo::codec::VectorTile *v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  _QWORD *v132;
  _QWORD *v133;
  _QWORD *v134;
  unsigned int v135;
  unsigned int v136;
  _BOOL4 v137;
  _BOOL4 v138;
  char v143;
  _BOOL4 v144;
  _BOOL4 v145;
  std::__shared_weak_count *v150;
  geo::codec::VectorTile *v151;
  unint64_t v152;
  _BOOL4 v155;
  BOOL v158;
  uint64_t v159;
  _QWORD *v160;
  BOOL v161;
  BOOL v162;
  BOOL v164;
  int v166;
  int v167;
  uint64_t v168;
  _BOOL4 v171;
  BOOL v174;
  _QWORD *v175;
  BOOL v176;
  BOOL v177;
  BOOL v179;
  int v181;
  unint64_t v182;
  _BOOL4 v185;
  BOOL v189;
  uint64_t v190;
  _QWORD *v191;
  BOOL v192;
  BOOL v194;
  BOOL v195;
  uint64_t v197;
  _BOOL4 v200;
  BOOL v204;
  _QWORD *v205;
  BOOL v206;
  BOOL v208;
  BOOL v209;
  std::__shared_weak_count *v211;
  int v212;
  unint64_t *v213;
  unint64_t v214;
  int v215;
  int v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  int v220;
  int64x2_t v221;
  VKTransitPolylinePath *v222;
  unint64_t v223;
  unsigned int v224;
  unsigned int v225;
  uint64_t v226;
  uint64_t v227;
  VKTransitPolylinePath *v228;
  _QWORD *v229;
  _QWORD *v230;
  float64x2_t v231;
  uint64_t v233;
  float64x2_t v236;
  uint64_t v237;
  char *v238;
  _QWORD *v240;
  void *v241;
  void *v242;
  id v243;
  uint64_t v244;
  _QWORD *v245;
  char *v246;
  char *v247;
  _QWORD *v248;
  char *v249;
  char *v250;
  uint64_t v251;
  char *v252;
  _QWORD *v253;
  uint64_t v254;
  uint64_t v255;
  _QWORD *v256;
  uint64_t v257;
  unint64_t v258;
  unint64_t v259;
  uint64_t v260;
  uint64_t v261;
  std::__shared_weak_count *v262;
  std::__shared_weak_count *v263;
  geo::codec::VectorTile **v264;
  geo::codec::VectorTile **v265;
  _QWORD *v266;
  _QWORD *v267;
  _QWORD *v268;
  _QWORD *v269;
  _QWORD *v270;
  unint64_t *v271;
  unint64_t *v272;
  _QWORD *v273;
  _QWORD *v274;
  _QWORD *v275;
  _QWORD *v276;
  _QWORD *v277;
  _QWORD *v278;
  _QWORD *v279;
  unint64_t *v280;
  unint64_t *v281;
  _QWORD *v282;
  _QWORD *v283;
  _QWORD *v284;
  _QWORD *v285;
  _QWORD *v286;
  _QWORD *v287;
  _QWORD *v288;
  _QWORD *v289;
  _QWORD *v290;
  _QWORD *v291;
  _QWORD *v292;
  float32x2_t v293[2];
  unint64_t v294;
  float64x2_t v295;
  float64x2_t v296;

  v9 = a3;
  v243 = a4;
  v10 = &a1[*MEMORY[0x1E0D27760]];
  v247 = a1;
  v11 = &a1[*MEMORY[0x1E0D27768]];
  v12 = *(_OWORD *)(v10 + 24);
  *(_OWORD *)v11 = *(_OWORD *)v10;
  *((_OWORD *)v11 + 1) = v12;
  v238 = v11;
  v241 = v9;
  if (!a5)
    goto LABEL_256;
  v295 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v296 = (float64x2_t)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v13 = (_QWORD *)objc_msgSend(v9, "routeLineDatas");
  v16 = (_QWORD *)*v13;
  v14 = v13 + 1;
  v15 = v16;
  if (v16 == v14)
    goto LABEL_256;
  v245 = v14;
  while (2)
  {
    v248 = v15;
    v17 = v15[4];
    v18 = *(geo::codec::VectorTile **)(v17 + 768);
    if (!v18)
      goto LABEL_248;
    v255 = geo::codec::VectorTile::transitLinks(v18);
    v19 = geo::codec::VectorTile::transitLinkCount(*(geo::codec::VectorTile **)(v17 + 768));
    v20 = v19;
    if (!v19)
      goto LABEL_248;
    v21 = 0;
    v252 = &v247[*MEMORY[0x1E0D27788]];
    v250 = &v247[*MEMORY[0x1E0D27790]];
    v259 = v19;
    while (1)
    {
      v257 = v21;
      v22 = v255 + 184 * v21;
      if (*(_DWORD *)(v22 + 20))
      {
        v23 = *(_QWORD **)v252;
        v283 = (_QWORD *)*((_QWORD *)v252 + 2);
        v285 = (_QWORD *)*((_QWORD *)v252 + 1);
        v289 = (_QWORD *)*((_QWORD *)v250 + 1);
        v291 = *(_QWORD **)v250;
        v287 = (_QWORD *)*((_QWORD *)v250 + 2);
        LineCount = geo::codec::transitLinkGetLineCount(v22);
        if (LineCount)
        {
          v25 = 0;
          v26 = (_QWORD *)(v255 + 184 * v257);
          v279 = v26 + 15;
          v281 = v26 + 16;
          v275 = v26 + 19;
          v277 = v26 + 20;
          v269 = v26 + 17;
          v271 = v26 + 18;
          v253 = v26 + 21;
          v265 = (geo::codec::VectorTile **)v22;
          v267 = v26 + 22;
          v273 = v23;
          v261 = LineCount;
          while (1)
          {
            v27 = geo::codec::transitLinkGetFromNodeID(v22, v25);
            v28 = geo::codec::transitLinkGetToNodeID(v22, v25);
            LineDirection = geo::codec::transitLinkGetLineDirection((_QWORD *)v22, v25);
            v30 = LineDirection;
            if (LineDirection > 1)
            {
              v31 = 0;
              v32 = 0;
              goto LABEL_36;
            }
            _ZF = v23 == v27 || v285 == v27;
            v34 = _ZF || v283 == v27;
            v31 = v34;
            v35 = v291 == v28 || v289 == v28;
            v36 = v35 || v287 == v28;
            v32 = v36;
            if (v31 && v32)
              break;
LABEL_36:
            v37 = LineDirection & 0xFD;
            if ((LineDirection & 0xFFFFFFFD) != 0)
            {
              LOBYTE(v38) = 0;
              v39 = 0;
            }
            else
            {
              v38 = v23 == v28 || v285 == v28 || v283 == v28;
              v39 = v291 == v27 || v289 == v27 || v287 == v27;
              if (v38 && v39)
                break;
            }
            if (v31 || v32 || v38 || v39)
            {
              v44 = (std::__shared_weak_count *)v265[1];
              if (v44 && (v263 = std::__shared_weak_count::lock(v44)) != 0)
              {
                v45 = *v265;
              }
              else
              {
                v263 = 0;
                v45 = 0;
              }
              if (*v281)
              {
                v46 = 0;
                v49 = v291 != v28 && v289 != v28 && v287 != v28;
                v52 = v273 != v28 && v285 != v28 && v283 != v28 || v37 != 0;
                v53 = 40;
                while (1)
                {
                  v54 = *(_QWORD **)(geo::codec::VectorTile::transitNodes(v45) + 344 * *v279 + v53);
                  if (v30 <= 1)
                  {
                    v55 = v273 == v54 || v285 == v54;
                    v56 = v55 || v283 == v54;
                    if (v56 && !v49)
                      break;
                  }
                  if (!v52)
                  {
                    v58 = v291 == v54 || v289 == v54;
                    if (v58 || v287 == v54)
                      break;
                  }
                  ++v46;
                  v53 += 344;
                  if (v46 >= *v281)
                    goto LABEL_108;
                }
                v60 = 0;
                v23 = v273;
                v61 = v263;
                if (!v263)
                {
LABEL_12:
                  if (!v60)
                    break;
                  goto LABEL_13;
                }
LABEL_242:
                p_shared_owners = (unint64_t *)&v61->__shared_owners_;
                do
                  v105 = __ldaxr(p_shared_owners);
                while (__stlxr(v105 - 1, p_shared_owners));
                if (!v105)
                {
                  ((void (*)(std::__shared_weak_count *))v263->__on_zero_shared)(v263);
                  std::__shared_weak_count::__release_weak(v263);
                }
                goto LABEL_12;
              }
LABEL_108:
              v23 = v273;
              if (*v277)
              {
                v62 = 0;
                v65 = v291 != v28 && v289 != v28 && v287 != v28;
                v68 = v273 != v28 && v285 != v28 && v283 != v28 || v37 != 0;
                while (1)
                {
                  v69 = *(_QWORD **)(geo::codec::VectorTile::transitNodeCollapseIDs(v45) + 8 * (v62 + *v275));
                  if (v30 <= 1)
                  {
                    v70 = v273 == v69 || v285 == v69;
                    v71 = v70 || v283 == v69;
                    if (v71 && !v65)
                      break;
                  }
                  if (!v68)
                  {
                    v73 = v291 == v69 || v289 == v69;
                    if (v73 || v287 == v69)
                      break;
                  }
                  if ((unint64_t)++v62 >= *v277)
                    goto LABEL_149;
                }
              }
              else
              {
LABEL_149:
                if (*v271)
                {
                  v75 = 0;
                  v78 = v291 != v27 && v289 != v27 && v287 != v27;
                  v82 = v273 != v27 && v285 != v27 && v283 != v27 || v30 > 1;
                  v83 = 40;
                  while (1)
                  {
                    v84 = *(_QWORD **)(geo::codec::VectorTile::transitNodes(v45) + 344 * *v269 + v83);
                    if (!v82)
                    {
                      v85 = v291 == v84 || v289 == v84;
                      if (v85 || v287 == v84)
                        break;
                    }
                    if (!v37)
                    {
                      v87 = v273 == v84 || v285 == v84;
                      v88 = v87 || v283 == v84;
                      if (v88 && !v78)
                        break;
                    }
                    ++v75;
                    v83 += 344;
                    if (v75 >= *v271)
                      goto LABEL_195;
                  }
                }
                else
                {
LABEL_195:
                  if (!*v267)
                  {
LABEL_241:
                    v60 = 1;
                    v61 = v263;
                    if (!v263)
                      goto LABEL_12;
                    goto LABEL_242;
                  }
                  v90 = 0;
                  v93 = v291 != v27 && v289 != v27 && v287 != v27;
                  v97 = v273 != v27 && v285 != v27 && v283 != v27 || v30 > 1;
                  while (1)
                  {
                    v98 = *(_QWORD **)(geo::codec::VectorTile::transitNodeCollapseIDs(v45) + 8 * (v90 + *v253));
                    if (!v97)
                    {
                      v99 = v291 == v98 || v289 == v98;
                      if (v99 || v287 == v98)
                        break;
                    }
                    if (!v37)
                    {
                      v101 = v273 == v98 || v285 == v98;
                      v102 = v101 || v283 == v98;
                      if (v102 && !v93)
                        break;
                    }
                    if ((unint64_t)++v90 >= *v267)
                      goto LABEL_241;
                  }
                }
              }
              v60 = 0;
              v61 = v263;
              if (!v263)
                goto LABEL_12;
              goto LABEL_242;
            }
LABEL_13:
            ++v25;
            v20 = v259;
            v22 = (uint64_t)v265;
            if (v25 == v261)
              goto LABEL_8;
          }
          v293[0] = 0;
          geo::codec::transitLinkPoints((uint64_t)v265, 0, v293);
          v20 = v259;
          if (*(_QWORD *)v293 > 1uLL)
            break;
        }
      }
LABEL_8:
      v21 = v257 + 1;
      if (v257 + 1 == v20)
        goto LABEL_248;
    }
    v106 = v248[4];
    v107 = 1 << *(_BYTE *)(v106 + 169);
    v108 = 1.0 / (double)v107;
    v109 = v108 * (double)*(int *)(v106 + 176);
    v110 = v108 * (double)(v107 + ~*(_DWORD *)(v106 + 172));
    v295.f64[0] = fmin(v109, v295.f64[0]);
    v295.f64[1] = fmin(v110, v295.f64[1]);
    v296.f64[0] = fmax(v296.f64[0], v109 + v108);
    v296.f64[1] = fmax(v296.f64[1], v110 + v108);
LABEL_248:
    v111 = v248;
    v112 = (_QWORD *)v248[1];
    if (v112)
    {
      do
      {
        v113 = v112;
        v112 = (_QWORD *)*v112;
      }
      while (v112);
    }
    else
    {
      do
      {
        v113 = (_QWORD *)v111[2];
        _ZF = *v113 == (_QWORD)v111;
        v111 = v113;
      }
      while (!_ZF);
    }
    v15 = v113;
    if (v113 != v245)
      continue;
    break;
  }
  if (v296.f64[0] < v295.f64[0] || v296.f64[1] < v295.f64[1])
  {
LABEL_256:
    v114 = 0;
    goto LABEL_257;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v296.f64[1]);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (_QWORD *)objc_msgSend(v241, "routeLineDatas");
  v119 = (_QWORD *)*v116;
  v117 = v116 + 1;
  v118 = v119;
  if (v119 == v117)
    goto LABEL_524;
  __asm { FMOV            V9.2S, #1.0 }
  v240 = v117;
  while (2)
  {
    v244 = v118[4];
    v124 = *(geo::codec::VectorTile **)(v244 + 768);
    if (!v124)
      goto LABEL_518;
    v251 = geo::codec::VectorTile::transitLinks(v124);
    v125 = geo::codec::VectorTile::transitLinkCount(*(geo::codec::VectorTile **)(v244 + 768));
    v126 = v125;
    if (!v125)
      goto LABEL_518;
    v127 = 0;
    v249 = &v247[*MEMORY[0x1E0D27788]];
    v246 = &v247[*MEMORY[0x1E0D27790]];
    v256 = v118;
    v258 = v125;
    while (2)
    {
      v254 = v127;
      v128 = v251 + 184 * v127;
      if (!*(_DWORD *)(v128 + 20))
        goto LABEL_264;
      v284 = (_QWORD *)*((_QWORD *)v249 + 1);
      v286 = *(_QWORD **)v249;
      v282 = (_QWORD *)*((_QWORD *)v249 + 2);
      v290 = (_QWORD *)*((_QWORD *)v246 + 1);
      v292 = *(_QWORD **)v246;
      v288 = (_QWORD *)*((_QWORD *)v246 + 2);
      v129 = geo::codec::transitLinkGetLineCount(v128);
      v130 = v129;
      if (!v129)
        goto LABEL_264;
      v131 = 0;
      v132 = (_QWORD *)(v251 + 184 * v254);
      v278 = v132 + 15;
      v280 = v132 + 16;
      v274 = v132 + 19;
      v276 = v132 + 20;
      v270 = v132 + 17;
      v272 = v132 + 18;
      v266 = v132 + 21;
      v268 = v132 + 22;
      v260 = v129;
      v264 = (geo::codec::VectorTile **)v128;
      while (2)
      {
        v133 = geo::codec::transitLinkGetFromNodeID(v128, v131);
        v134 = geo::codec::transitLinkGetToNodeID(v128, v131);
        v135 = geo::codec::transitLinkGetLineDirection((_QWORD *)v128, v131);
        v136 = v135;
        if (v135 <= 1)
        {
          v137 = v286 == v133 || v284 == v133 || v282 == v133;
          v138 = v292 == v134 || v290 == v134 || v288 == v134;
          if (v137 && v138)
          {
            v216 = 1;
            goto LABEL_515;
          }
        }
        else
        {
          v137 = 0;
          v138 = 0;
        }
        v143 = v135 & 0xFD;
        if ((v135 & 0xFFFFFFFD) != 0)
        {
          LOBYTE(v144) = 0;
          v145 = 0;
          goto LABEL_314;
        }
        v144 = v286 == v134 || v284 == v134 || v282 == v134;
        v145 = v292 == v133 || v290 == v133 || v288 == v133;
        if (!v144 || !v145)
        {
LABEL_314:
          if (v137 || v138 || v144 || v145)
          {
            v150 = (std::__shared_weak_count *)v264[1];
            if (v150 && (v262 = std::__shared_weak_count::lock(v150)) != 0)
            {
              v151 = *v264;
            }
            else
            {
              v262 = 0;
              v151 = 0;
            }
            if (*v280)
            {
              v152 = 0;
              v155 = v292 != v134 && v290 != v134 && v288 != v134;
              v158 = v286 != v134 && v284 != v134 && v282 != v134 || v143 != 0;
              v159 = 40;
              while (1)
              {
                v160 = *(_QWORD **)(geo::codec::VectorTile::transitNodes(v151) + 344 * *v278 + v159);
                if (v136 <= 1)
                {
                  v161 = v286 == v160 || v284 == v160;
                  v162 = v161 || v282 == v160;
                  if (v162 && !v155)
                    break;
                }
                if (!v158)
                {
                  v164 = v292 == v160 || v290 == v160;
                  if (v164 || v288 == v160)
                  {
                    v166 = 0;
                    v167 = 2;
                    goto LABEL_497;
                  }
                }
                ++v152;
                v159 += 344;
                if (v152 >= *v280)
                  goto LABEL_363;
              }
              v166 = 0;
              v167 = 1;
LABEL_497:
              LODWORD(v252) = v167;
              v118 = v256;
              v126 = v258;
LABEL_506:
              v130 = v260;
              v211 = v262;
              if (v262)
              {
LABEL_507:
                v213 = (unint64_t *)&v211->__shared_owners_;
                do
                  v214 = __ldaxr(v213);
                while (__stlxr(v214 - 1, v213));
                if (!v214)
                {
                  ((void (*)(std::__shared_weak_count *))v262->__on_zero_shared)(v262);
                  std::__shared_weak_count::__release_weak(v262);
                }
              }
            }
            else
            {
LABEL_363:
              v126 = v258;
              v130 = v260;
              if (!*v276)
              {
LABEL_404:
                if (*v272)
                {
                  v182 = 0;
                  v185 = v292 != v133 && v290 != v133 && v288 != v133;
                  v189 = v286 != v133 && v284 != v133 && v282 != v133 || v136 > 1;
                  v190 = 40;
                  while (1)
                  {
                    v191 = *(_QWORD **)(geo::codec::VectorTile::transitNodes(v151) + 344 * *v270 + v190);
                    if (!v189)
                    {
                      v192 = v292 == v191 || v290 == v191;
                      if (v192 || v288 == v191)
                      {
                        v166 = 0;
                        v212 = 1;
                        goto LABEL_504;
                      }
                    }
                    if (!v143)
                    {
                      v194 = v286 == v191 || v284 == v191;
                      v195 = v194 || v282 == v191;
                      if (v195 && !v185)
                        break;
                    }
                    ++v182;
                    v190 += 344;
                    if (v182 >= *v272)
                      goto LABEL_450;
                  }
                  v166 = 0;
                  v212 = 2;
LABEL_504:
                  LODWORD(v252) = v212;
                }
                else
                {
LABEL_450:
                  if (*v268)
                  {
                    v197 = 0;
                    v200 = v292 != v133 && v290 != v133 && v288 != v133;
                    v204 = v286 != v133 && v284 != v133 && v282 != v133 || v136 > 1;
                    v118 = v256;
                    v130 = v260;
                    while (1)
                    {
                      v205 = *(_QWORD **)(geo::codec::VectorTile::transitNodeCollapseIDs(v151) + 8 * (v197 + *v266));
                      if (!v204)
                      {
                        v206 = v292 == v205 || v290 == v205;
                        if (v206 || v288 == v205)
                        {
                          v166 = 0;
                          v215 = 1;
                          goto LABEL_511;
                        }
                      }
                      if (!v143)
                      {
                        v208 = v286 == v205 || v284 == v205;
                        v209 = v208 || v282 == v205;
                        if (v209 && !v200)
                          break;
                      }
                      if ((unint64_t)++v197 >= *v268)
                      {
                        v166 = 1;
                        v211 = v262;
                        if (v262)
                          goto LABEL_507;
                        goto LABEL_268;
                      }
                    }
                    v166 = 0;
                    v215 = 2;
LABEL_511:
                    LODWORD(v252) = v215;
                    v211 = v262;
                    if (v262)
                      goto LABEL_507;
                    goto LABEL_268;
                  }
                  v166 = 1;
                }
                v118 = v256;
                goto LABEL_506;
              }
              v168 = 0;
              v171 = v292 != v134 && v290 != v134 && v288 != v134;
              v174 = v286 != v134 && v284 != v134 && v282 != v134 || v143 != 0;
              while (1)
              {
                v175 = *(_QWORD **)(geo::codec::VectorTile::transitNodeCollapseIDs(v151) + 8 * (v168 + *v274));
                if (v136 <= 1)
                {
                  v176 = v286 == v175 || v284 == v175;
                  v177 = v176 || v282 == v175;
                  if (v177 && !v171)
                    break;
                }
                if (!v174)
                {
                  v179 = v292 == v175 || v290 == v175;
                  if (v179 || v288 == v175)
                  {
                    v166 = 0;
                    v181 = 2;
                    goto LABEL_500;
                  }
                }
                if ((unint64_t)++v168 >= *v276)
                  goto LABEL_404;
              }
              v166 = 0;
              v181 = 1;
LABEL_500:
              LODWORD(v252) = v181;
              v118 = v256;
              v211 = v262;
              if (v262)
                goto LABEL_507;
            }
LABEL_268:
            if (!v166)
              goto LABEL_516;
          }
          ++v131;
          v128 = (uint64_t)v264;
          if (v131 == v130)
            goto LABEL_264;
          continue;
        }
        break;
      }
      v216 = 2;
LABEL_515:
      LODWORD(v252) = v216;
LABEL_516:
      v294 = 0;
      v217 = geo::codec::transitLinkPoints((uint64_t)v264, 0, &v294);
      if (v294 >= 2)
      {
        v218 = v217;
        v219 = v118[4];
        v220 = 1 << *(_BYTE *)(v219 + 169);
        v221.i64[0] = *(int *)(v219 + 176);
        v221.i64[1] = v220 + ~*(_DWORD *)(v219 + 172);
        v293[0] = vdiv_f32(_D9, vcvt_f32_f64(vmulq_n_f64(vsubq_f64(v296, v295), (double)v220)));
        v293[1] = vmul_f32(v293[0], vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vnegq_f64(v295), vcvtq_f64_s64(v221), 1.0 / (double)v220), (double)v220)));
        v222 = [VKTransitPolylinePath alloc];
        v223 = v294;
        v224 = objc_msgSend(v247, "startPointIndex");
        v225 = objc_msgSend(v247, "endPointIndex");
        v226 = objc_msgSend(v247, "lineID");
        v227 = *(_QWORD *)geo::codec::VectorTile::key(*(geo::codec::VectorTile **)(v244 + 768));
        BYTE4(v237) = *(_BYTE *)geo::codec::VectorTile::transitVertices(*(geo::codec::VectorTile **)(v244 + 768));
        LODWORD(v237) = (v227 >> 8) & 0x3F;
        v228 = -[VKTransitPolylinePath initWithOverlay:section:points:pointCount:reversePoints:transform:routeStartIndex:routeEndIndex:lineID:tileZ:vertexPrecision:](v222, "initWithOverlay:section:points:pointCount:reversePoints:transform:routeStartIndex:routeEndIndex:lineID:tileZ:vertexPrecision:", v243, v247, v218, v223, (_DWORD)v252 == 2, v293, __PAIR64__(v225, v224), v226, v237);
        objc_msgSend(v242, "addObject:", v228);

      }
LABEL_264:
      v127 = v254 + 1;
      if (v254 + 1 != v126)
        continue;
      break;
    }
LABEL_518:
    v229 = (_QWORD *)v118[1];
    if (v229)
    {
      do
      {
        v230 = v229;
        v229 = (_QWORD *)*v229;
      }
      while (v229);
    }
    else
    {
      do
      {
        v230 = (_QWORD *)v118[2];
        _ZF = *v230 == (_QWORD)v118;
        v118 = v230;
      }
      while (!_ZF);
    }
    v118 = v230;
    if (v230 != v240)
      continue;
    break;
  }
LABEL_524:
  if ((a6 & 1) != 0
    && (objc_msgSend(v247, "_validateSnappedPaths:snappedTileBounds:overlay:", v242, &v295, v243) & 1) == 0)
  {
    v114 = 0;

  }
  else
  {
    v231 = *(float64x2_t *)(MEMORY[0x1E0D266E8] + 16);
    _V2.D[1] = v296.f64[1];
    v233 = *(_OWORD *)&vmulq_f64(v231, v295);
    _D4 = *(_QWORD *)(MEMORY[0x1E0D266E8] + 24);
    __asm { FMLS            D4, D4, V2.D[1] }
    v236 = vmulq_f64(vsubq_f64(v296, v295), v231);
    *(_QWORD *)v238 = v233;
    *((_QWORD *)v238 + 1) = _D4;
    *((float64x2_t *)v238 + 1) = v236;
    v114 = v242;

  }
LABEL_257:

  return v114;
}

- (id)unsnappedPathsInOverlay:()RenderRegion
{
  id v4;
  void *v5;

  v4 = a3;
  _unsnappedPaths(*(const float **)&a1[*MEMORY[0x1E0D27778]], *(_DWORD *)&a1[*MEMORY[0x1E0D27770]], v4, a1, objc_msgSend(a1, "lineID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
