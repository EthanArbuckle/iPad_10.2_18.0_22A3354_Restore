@implementation VisionCoreSparseOpticalFlow

+ (void)_gatherKeyPtsFromQuadsForSession:(id)a3 minGridFrequency:(int)a4
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  _WORD *v26;
  _WORD *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t *v31;
  unint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  id v41;
  _WORD *__p;
  _WORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v4 = *(_QWORD *)&a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v5 = (_QWORD *)objc_msgSend(v41, "allSrcPoints");
  v6 = (unint64_t **)objc_msgSend(v41, "quadPointCounts");
  v5[1] = *v5;
  v6[1] = *v6;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v41, "trackedQuads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v49;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v12, "boundingBox");
        v14 = v13;
        objc_msgSend(v12, "boundingBox");
        v10 = v10 + v14 * v15;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v41, "trackedQuads");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v20, "boundingBox");
        v22 = v21;
        objc_msgSend(v20, "boundingBox");
        if (v20)
        {
          *(float *)&v23 = v22;
          v25 = v24;
          *(float *)&v23 = (float)((float)(*(float *)&v23 * 256.0) * v25) / v10;
          objc_msgSend(v20, "generateGridKeypointsWithMaxKeypoints:minGridFrequency:", v4, v23);
          v26 = __p;
          v27 = v43;
        }
        else
        {
          v27 = 0;
          v26 = 0;
          __p = 0;
          v43 = 0;
        }
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v26, v27, (uint64_t)v5);
        v28 = (unint64_t)(v43 - __p) >> 1;
        v30 = v6[1];
        v29 = (unint64_t)v6[2];
        if ((unint64_t)v30 >= v29)
        {
          v32 = *v6;
          v33 = v30 - *v6;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 61)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v35 = v29 - (_QWORD)v32;
          if (v35 >> 2 > v34)
            v34 = v35 >> 2;
          v36 = (unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8;
          v37 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v36)
            v37 = v34;
          if (v37)
          {
            v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v37);
            v32 = *v6;
            v30 = v6[1];
          }
          else
          {
            v38 = 0;
          }
          v39 = (unint64_t *)(v37 + 8 * v33);
          *v39 = v28;
          v31 = v39 + 1;
          while (v30 != v32)
          {
            v40 = *--v30;
            *--v39 = v40;
          }
          *v6 = v39;
          v6[1] = v31;
          v6[2] = (unint64_t *)(v37 + 8 * v38);
          if (v32)
            operator delete(v32);
        }
        else
        {
          *v30 = v28;
          v31 = v30 + 1;
        }
        v6[1] = v31;
        if (__p)
        {
          v43 = __p;
          operator delete(__p);
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v17);
  }

}

+ (VisionCoreHomography)_estimateTransformSrcPts:(SEL)a3 DstPts:(void *)a4 ransacReprojErrorThreshold:(void *)a5
{
  uint64_t v10;
  uint64_t v11;
  float *v12;
  char *v13;
  uint64_t v14;
  size_t var2;
  uint64_t v16;
  uint64_t v17;
  float *var0;
  float *var1;
  int v20;
  unint64_t v21;
  float *v22;
  float *v23;
  __int16 *v24;
  __int16 *v25;
  uint64_t v33;
  uint64_t v38;
  _BYTE *v40;
  int v41;
  uint64_t v42;
  _BYTE *v43;
  __CLPK_real *v44;
  uint64_t v45;
  float *v46;
  BOOL *v47;
  int v48;
  float *v49;
  __CLPK_integer v50;
  __CLPK_integer v51;
  BOOL *v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  unsigned int v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  int v63;
  unint64_t v64;
  unsigned int v65;
  uint64_t v66;
  int v67;
  unint64_t v68;
  unint64_t v69;
  float *v70;
  float *v71;
  char *v72;
  char *v73;
  float *v74;
  float *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  float var3;
  float *v82;
  BOOL *v83;
  float v84;
  BOOL v85;
  int v86;
  size_t v88;
  int v89;
  int v90;
  double v91;
  double v92;
  long double v93;
  int v94;
  float *v96;
  __CLPK_real *v97;
  __CLPK_integer v98;
  __CLPK_integer v99;
  float v100;
  float v101;
  float v102;
  float32x2_t v103;
  float v104;
  int v105;
  __int128 v106;
  float v107;
  float v108;
  float v109;
  float32x2_t v110;
  float32x2_t v111;
  float32x2_t v112;
  uint64_t v113;
  _BYTE *v114;
  VisionCoreHomography *result;
  uint64_t v116;
  uint64_t v117;
  float v118;
  __int128 *v119;
  uint64_t i;
  float *v121;
  int v122;
  BOOL *__src;
  float *v124;
  int __n;
  size_t __na;
  __CLPK_integer v127;
  unsigned int v128;
  int v129;
  int v130;
  __CLPK_real *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  int v144;
  __int32 v145;
  float32_t v146;
  int v147;
  uint64_t __C;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  uint64_t v154;
  __CLPK_integer __lwork;
  char __jobvt;
  char __jobu;
  __CLPK_integer v158;
  __CLPK_integer __ldvt;
  __CLPK_integer __lda;
  unint64_t v161;
  unint64_t v162;
  _DWORD v163[4];
  __int128 v164;
  __int128 v165;
  int v166;
  __int128 v167;
  __int128 v168;
  int v169;
  __CLPK_real __s[9];
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)a4;
  v10 = *((_QWORD *)a4 + 1);
  retstr->var0.var0 = 0;
  retstr->var0.var1 = 0;
  retstr->var0.var2 = 0;
  retstr->var1.var0 = 0;
  retstr->var1.var1 = 0;
  retstr->var1.var2 = 0;
  retstr->var2.var0 = 0;
  retstr->var2.var1 = 0;
  retstr->var2.var2.var0 = 0;
  v12 = (float *)operator new(0x24uLL);
  retstr->var2.var0 = v12;
  v12[8] = 1.0;
  *(_OWORD *)v12 = xmmword_21DF02FD0;
  *((_OWORD *)v12 + 1) = unk_21DF02FE0;
  retstr->var2.var1 = v12 + 9;
  retstr->var2.var2.var0 = v12 + 9;
  *(_OWORD *)&retstr->var3.var0 = 0u;
  *(_OWORD *)&retstr->var3.var2.var0 = 0u;
  *(_OWORD *)&retstr->var4.var1 = 0u;
  v13 = (char *)operator new(0x24uLL);
  *((_DWORD *)v13 + 8) = 1065353216;
  *(_OWORD *)v13 = xmmword_21DF02FD0;
  *((_OWORD *)v13 + 1) = unk_21DF02FE0;
  retstr->var4.var0 = (float *)v13;
  retstr->var4.var1 = (float *)(v13 + 36);
  *(_QWORD *)&retstr->var5.var0 = 0;
  *(_QWORD *)&retstr->var5.var2 = 0;
  retstr->var4.var2.var0 = (float *)(v13 + 36);
  Geometry2D_mallocCart2D(&v167, (unint64_t)(v10 - v11) >> 2);
  *(_OWORD *)&retstr->var0.var0 = v167;
  *(_QWORD *)&retstr->var0.var2 = v168;
  Geometry2D_mallocCart2D(&v167, (unint64_t)(v10 - v11) >> 2);
  *(_OWORD *)&retstr->var1.var0 = v167;
  *(_QWORD *)&retstr->var1.var2 = v168;
  retstr->var5.var2 = 1000;
  *(_QWORD *)&retstr->var5.var0 = 0x3BA3D70A00000004;
  retstr->var5.var3 = a6;
  v14 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
  var2 = retstr->var0.var2;
  if ((unint64_t)v14 >= 4)
  {
    v16 = 0;
    v17 = 0;
    var0 = retstr->var0.var0;
    var1 = retstr->var0.var1;
    v20 = retstr->var1.var2;
    v21 = (unint64_t)(v14 >> 1) >> 1;
    v22 = retstr->var1.var0;
    v23 = retstr->var1.var1;
    if (v21 <= 1)
      v21 = 1;
    v24 = (__int16 *)(*(_QWORD *)a5 + 2);
    v25 = (__int16 *)(*(_QWORD *)a4 + 2);
    do
    {
      if ((int)var2 > (int)v17)
      {
        _H0 = *v25;
        __asm { FCVT            S0, H0 }
        _H1 = *(v25 - 1);
        v33 = v16 >> 30;
        __asm { FCVT            S1, H1 }
        *(_DWORD *)((char *)var0 + v33) = _S1;
        *(_DWORD *)((char *)var1 + v33) = _S0;
      }
      if (v20 > (int)v17)
      {
        _H0 = *v24;
        __asm { FCVT            S0, H0 }
        _H1 = *(v24 - 1);
        v38 = v16 >> 30;
        __asm { FCVT            S1, H1 }
        *(_DWORD *)((char *)v22 + v38) = _S1;
        *(_DWORD *)((char *)v23 + v38) = _S0;
      }
      ++v17;
      v16 += 0x100000000;
      v24 += 2;
      v25 += 2;
    }
    while (v21 != v17);
  }
  v40 = malloc_type_calloc(var2, 1uLL, 0x100004077774924uLL);
  std::vector<BOOL>::reserve((uint64_t)&retstr->var3, retstr->var0.var2);
  v41 = retstr->var0.var2;
  if (v41 <= 3)
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&retstr->var2, (char *)retstr->var4.var0, (uint64_t)retstr->var4.var1, retstr->var4.var1 - retstr->var4.var0);
    v42 = retstr->var0.var2;
    if ((_DWORD)v42)
    {
      v43 = v40;
      do
      {
        std::vector<BOOL>::push_back((uint64_t *)&retstr->var3, v43++);
        --v42;
      }
      while (v42);
    }
    goto LABEL_106;
  }
  if (!retstr->var0.var0)
    goto LABEL_99;
  v44 = 0;
  v45 = 1917;
  if (!retstr->var0.var1)
  {
LABEL_100:
    v46 = 0;
    v47 = 0;
    goto LABEL_101;
  }
  v46 = 0;
  v47 = 0;
  if (!retstr->var1.var0)
    goto LABEL_101;
  if (!retstr->var1.var1)
  {
LABEL_99:
    v44 = 0;
    v46 = 0;
    v47 = 0;
    v45 = 1917;
    goto LABEL_101;
  }
  v44 = 0;
  v45 = 1917;
  if (!v40)
    goto LABEL_100;
  v48 = retstr->var1.var2;
  v46 = 0;
  v47 = 0;
  if (v48 >= 1)
  {
    if (v41 != v48)
    {
      v44 = 0;
      v46 = 0;
      v47 = 0;
LABEL_108:
      v45 = 1916;
      goto LABEL_101;
    }
    v49 = retstr->var2.var0;
    v50 = Geometry2D_estimateWorkBufferSize(4);
    if (v50 < 0)
    {
      v44 = 0;
      v46 = 0;
      v47 = 0;
      v45 = 1903;
      goto LABEL_101;
    }
    v51 = v50;
    v44 = (__CLPK_real *)malloc_type_malloc(4 * v50, 0x100004052888210uLL);
    if (v44)
    {
      v141 = 0;
      v142 = 0;
      v143 = 0;
      Geometry2D_mallocCart2D(&v141, 4);
      v46 = 0;
      v45 = 1915;
      if (!v141
        || !v142
        || (int)v143 < 1
        || (v138 = 0, v139 = 0, v140 = 0, Geometry2D_mallocCart2D(&v138, 4), v46 = 0, v45 = 1915, !v138)
        || !v139
        || (int)v140 < 1)
      {
        v47 = 0;
        goto LABEL_101;
      }
      v46 = (float *)malloc_type_malloc(4 * retstr->var0.var2, 0x100004052888210uLL);
      if (v46)
      {
        v127 = v51;
        v52 = (BOOL *)malloc_type_malloc(retstr->var0.var2, 0x100004077774924uLL);
        v47 = v52;
        if (v52)
        {
          if (retstr->var0.var2 >= 4)
          {
            v121 = v49;
            __src = v52;
            v124 = v46;
            v53 = 0;
            v54 = retstr->var5.var2;
            v161 = 0;
            v162 = 0;
            do
            {
              *(_DWORD *)((char *)&v161 + v53) = arc4random();
              v53 += 4;
            }
            while (v53 != 16);
            if ((v54 - 1) >= 0x7FFFFFFE)
              v55 = 0x7FFFFFFF;
            else
              v55 = v54;
            __n = v55;
            if (v55 >= 1)
            {
              v56 = 0;
              v122 = 0;
              v57 = HIDWORD(v161);
              v58 = v161;
              v59 = v162;
              v60 = HIDWORD(v162);
              while (1)
              {
                v61 = 0;
                v62 = retstr->var0.var2;
                v63 = v57;
                do
                {
                  HIDWORD(v64) = 5 * v63;
                  LODWORD(v64) = 5 * v63;
                  v65 = 9 * (v64 >> 25) % v62;
                  if (v61)
                  {
                    while (1)
                    {
                      v66 = 0;
                      while (v163[v66] != v65)
                      {
                        if (v61 == ++v66)
                          goto LABEL_49;
                      }
                      if (v65 + 1 == v62)
                        v65 = 0;
                      else
                        ++v65;
                    }
                  }
LABEL_49:
                  v67 = v59 ^ v58;
                  v57 = v59 ^ v58 ^ v63;
                  v58 ^= v60 ^ v63;
                  HIDWORD(v68) = v60 ^ v63;
                  LODWORD(v68) = v60 ^ v63;
                  v60 = v68 >> 21;
                  v59 = v67 ^ (v63 << 9);
                  v163[v61++] = v65;
                  v63 ^= v67;
                }
                while (v61 != 4);
                v128 = v60;
                v129 = v59;
                v130 = v56;
                v69 = 0;
                v70 = retstr->var0.var0;
                v71 = retstr->var0.var1;
                v72 = (char *)v141;
                v73 = (char *)v142;
                v74 = retstr->var1.var0;
                v75 = retstr->var1.var1;
                v76 = (char *)v138;
                v77 = (char *)v139;
                do
                {
                  v78 = (int)v163[v69 / 4];
                  *(float *)&v72[v69] = v70[v78];
                  *(float *)&v73[v69] = v71[v78];
                  *(float *)&v76[v69] = v74[v78];
                  *(float *)&v77[v69] = v75[v78];
                  v69 += 4;
                }
                while (v69 != 16);
                v169 = 0;
                v167 = 0u;
                v168 = 0u;
                v45 = Geometry2D_estimateHomographyMSS((uint64_t)&v141, (uint64_t)&v138, v44, v127, (uint64_t)&v167);
                if ((v45 & 0x80) == 0)
                  goto LABEL_116;
                LODWORD(v164) = 0;
                v45 = Geometry2D_computeAdjointAndDeterminant((float *)&v167, __s, (float *)&v164);
                if ((v45 & 0x80) == 0)
                  goto LABEL_124;
                if (fabsf(*(float *)&v164) > 0.00000011921)
                {
                  v45 = Geometry2D_symmetricReprojectionErrorHomography((uint64_t)retstr, (float *)&v167, (const float **)&retstr->var1.var0, v124);
                  if ((v45 & 0x80) == 0)
                    goto LABEL_124;
                  v79 = retstr->var0.var2;
                  if ((int)v79 < 1)
                  {
                    v80 = 0;
                  }
                  else
                  {
                    v80 = 0;
                    var3 = retstr->var5.var3;
                    v83 = __src;
                    v82 = v124;
                    do
                    {
                      v84 = *v82++;
                      v85 = v84 <= var3;
                      if (v84 <= var3)
                        ++v80;
                      *v83++ = v85;
                      --v79;
                    }
                    while (v79);
                  }
                  if (v80 > v122)
                  {
                    v86 = retstr->var0.var2;
                    if (v86 < 4 || v80 > v86)
                    {
                      v45 = 1916;
LABEL_124:
                      v47 = __src;
                      v46 = v124;
                      goto LABEL_101;
                    }
                    v88 = v86;
                    if (v80 >= 4)
                    {
                      v90 = 0;
                      v91 = 1.0;
                      do
                      {
                        v91 = v91 * (float)((float)(v80 + v90) / (float)((int)v88 + v90));
                        --v90;
                      }
                      while (v90 != -4);
                      __na = v88;
                      v92 = log(retstr->var5.var1);
                      v93 = log(1.0 - v91);
                      v88 = __na;
                      v89 = (int)fmin(ceil(v92 / v93), 2147483650.0);
                    }
                    else
                    {
                      v89 = 0x7FFFFFFF;
                    }
                    v94 = retstr->var5.var2;
                    if (v94 < v89 && v94 > 0)
                      v89 = retstr->var5.var2;
                    __n = v89;
                    memcpy(v40, __src, v88);
                    v122 = v80;
                  }
                }
                v56 = v130 + 1;
                v60 = v128;
                v59 = v129;
                if (__n <= v130 + 1)
                {
                  v161 = __PAIR64__(v57, v58);
                  v162 = __PAIR64__(v128, v129);
                  break;
                }
              }
            }
            v135 = 0;
            v136 = 0;
            v137 = 0;
            Geometry2D_cloneUsingFlagCart2D(&v135, (uint64_t)retstr, v40);
            v132 = 0;
            v133 = 0;
            v134 = 0;
            Geometry2D_cloneUsingFlagCart2D(&v132, (uint64_t)&retstr->var1, v40);
            v96 = 0;
            v152 = 0;
            v153 = 0;
            v154 = 0;
            v149 = 0;
            v150 = 0;
            v151 = 0;
            v166 = 0;
            v45 = 1917;
            v164 = 0u;
            v165 = 0u;
            if (!v121 || !v135)
              goto LABEL_114;
            v97 = 0;
            if (!v136)
              goto LABEL_115;
            v96 = 0;
            v45 = 1917;
            if ((int)v137 < 1 || !v132 || !v133)
              goto LABEL_114;
            v97 = 0;
            if ((int)v134 < 1)
              goto LABEL_115;
            v96 = 0;
            v45 = 1916;
            if ((int)v137 < 4)
            {
LABEL_114:
              v97 = 0;
              goto LABEL_115;
            }
            v97 = 0;
            if ((_DWORD)v137 != (_DWORD)v134)
              goto LABEL_115;
            v96 = (float *)malloc_type_malloc(4 * v134, 0x100004052888210uLL);
            if (v96)
            {
              v98 = Geometry2D_estimateWorkBufferSize(v137);
              if (v98 < 0)
              {
                v97 = 0;
                v45 = 1903;
                goto LABEL_115;
              }
              v99 = v98;
              v97 = (__CLPK_real *)malloc_type_malloc(4 * v98, 0x100004052888210uLL);
              if (v97)
              {
                __C = 0;
                v146 = 0.0;
                *(float *)&v147 = 1.0;
                *(float *)&v144 = 1.0;
                v145 = 0;
                Geometry2D_mallocCart2D(&v152, v137);
                Geometry2D_mallocCart2D(&v149, v134);
                v45 = Geometry2D_normalizePoints((uint64_t)&v135, v96, (uint64_t)&v152, (float *)&__C + 1, (float *)&__C, (float *)&v147);
                if ((v45 & 0x80) != 0)
                {
                  v45 = Geometry2D_normalizePoints((uint64_t)&v132, v96, (uint64_t)&v149, &v146, (float *)&v145, (float *)&v144);
                  if ((v45 & 0x80) != 0)
                  {
                    if ((_DWORD)v137 == 4)
                    {
                      v45 = Geometry2D_estimateHomographyMSS((uint64_t)&v152, (uint64_t)&v149, v97, v99, (uint64_t)&v164);
                      if ((v45 & 0x80) == 0)
                        goto LABEL_115;
                      goto LABEL_98;
                    }
                    v131 = 0;
                    v45 = 1917;
                    if (v152)
                    {
                      if (v153)
                      {
                        v131 = 0;
                        v45 = 1917;
                        if ((int)v154 >= 1 && v149 && v150)
                        {
                          if ((int)v151 < 1)
                          {
                            v45 = 1917;
                            free(0);
                            goto LABEL_115;
                          }
                          if ((_DWORD)v154 != (_DWORD)v151)
                          {
                            v45 = 1916;
                            free(0);
                            goto LABEL_115;
                          }
                          __lda = 2 * v154;
                          __ldvt = 9;
                          v158 = 0;
                          v131 = (__CLPK_real *)malloc_type_malloc(72 * (_DWORD)v154, 0x100004052888210uLL);
                          if (v131)
                          {
                            Geometry2D_assembleMeasurementMatrix((uint64_t)&v152, (float **)&v149, (uint64_t)v131);
                            __jobu = 78;
                            __jobvt = 65;
                            __lwork = v99;
                            sgesvd_(&__jobu, &__jobvt, &__lda, &__ldvt, v131, &__lda, __s, 0, &__lda, (__CLPK_real *)&v167, &__ldvt, v97, &__lwork, &v158);
                            if (!v158)
                            {
                              v119 = &v164;
                              for (i = 32; i != 356; i += 36)
                              {
                                *(_DWORD *)v119 = *(_DWORD *)((char *)&v167 + i);
                                v119 = (__int128 *)((char *)v119 + 4);
                              }
                              free(v131);
                              v45 = 1920;
LABEL_98:
                              v100 = *((float *)&__C + 1);
                              v102 = *(float *)&v147;
                              v101 = *(float *)&__C;
                              v103.f32[0] = v146;
                              v104 = *(float *)&v144;
                              v105 = v166;
                              v106 = v165;
                              *(_OWORD *)v121 = v164;
                              *((_OWORD *)v121 + 1) = v106;
                              *((_DWORD *)v121 + 8) = v105;
                              *(float *)&v106 = v121[2] * v102;
                              *((_DWORD *)v121 + 2) = v106;
                              v107 = v121[5] * v102;
                              v121[5] = v107;
                              v108 = v121[8] - (float)((float)(v107 * v101) + (float)(v100 * *(float *)&v106));
                              v121[8] = v108;
                              v103.i32[1] = v145;
                              v109 = 1.0 / v104;
                              v110 = vmul_n_f32(*(float32x2_t *)v121, v102);
                              v111 = vmul_n_f32(*(float32x2_t *)(v121 + 3), v102);
                              v112 = vsub_f32(*(float32x2_t *)(v121 + 6), vmla_n_f32(vmul_n_f32(v111, v101), v110, v100));
                              *(float32x2_t *)v121 = vmla_n_f32(vmul_n_f32(v103, *(float *)&v106), v110, v109);
                              *(float32x2_t *)(v121 + 3) = vmla_n_f32(vmul_n_f32(v103, v107), v111, v109);
                              *((float32x2_t *)v121 + 3) = vmla_n_f32(vmul_n_f32(v103, v108), v112, v109);
                              goto LABEL_115;
                            }
                            v45 = 1903;
                          }
                          else
                          {
                            v131 = 0;
                            v45 = 1915;
                          }
                        }
                      }
                    }
                    free(v131);
                  }
                }
LABEL_115:
                free(v152);
                v152 = 0;
                free(v153);
                v153 = 0;
                LODWORD(v154) = 0;
                free(v149);
                v149 = 0;
                free(v150);
                v150 = 0;
                LODWORD(v151) = 0;
                free(v96);
                free(v97);
                if ((v45 & 0x80) != 0)
                {
                  v46 = v124;
                  v45 = Geometry2D_symmetricReprojectionErrorHomography((uint64_t)retstr, v121, (const float **)&retstr->var1.var0, v124);
                  if ((v45 & 0x80) != 0)
                  {
                    v116 = retstr->var0.var2;
                    if ((int)v116 < 1)
                    {
                      v45 = 1920;
                    }
                    else
                    {
                      v117 = 0;
                      v118 = retstr->var5.var3;
                      v45 = 1920;
                      do
                      {
                        v40[v117] = v124[v117] <= v118;
                        ++v117;
                      }
                      while (v116 != v117);
                    }
                  }
                  goto LABEL_123;
                }
LABEL_116:
                v46 = v124;
LABEL_123:
                v47 = __src;
                goto LABEL_101;
              }
            }
            else
            {
              v97 = 0;
            }
            v45 = 1915;
            goto LABEL_115;
          }
          goto LABEL_108;
        }
LABEL_113:
        v45 = 1915;
        goto LABEL_101;
      }
    }
    else
    {
      v46 = 0;
    }
    v47 = 0;
    goto LABEL_113;
  }
LABEL_101:
  free(v141);
  v141 = 0;
  free(v142);
  v142 = 0;
  LODWORD(v143) = 0;
  free(v138);
  v138 = 0;
  free(v139);
  v139 = 0;
  LODWORD(v140) = 0;
  free(v135);
  v135 = 0;
  free(v136);
  v136 = 0;
  LODWORD(v137) = 0;
  free(v132);
  v132 = 0;
  free(v133);
  v133 = 0;
  LODWORD(v134) = 0;
  free(v44);
  free(v46);
  free(v47);
  if (v45 != 1920)
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&retstr->var2, (char *)retstr->var4.var0, (uint64_t)retstr->var4.var1, retstr->var4.var1 - retstr->var4.var0);
  v113 = retstr->var0.var2;
  if ((_DWORD)v113)
  {
    v114 = v40;
    do
    {
      std::vector<BOOL>::push_back((uint64_t *)&retstr->var3, v114++);
      --v113;
    }
    while (v113);
  }
LABEL_106:
  free(v40);
  return result;
}

+ (id)quadsConformHomographySrcQuads:(id)a3 destQuads:(id)a4 reprojError:(float)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  _WORD *v57;
  _WORD *v58;
  uint64_t v64;
  uint64_t v67;
  double v69;
  double v70;
  id v71;
  void *v72;
  float *var1;
  unint64_t v74;
  void *v75;
  std::vector<int>::value_type __x;
  VisionCoreHomography v78;
  VisionCoreHomography *v79[3];
  void *v80;
  void *v81;
  _QWORD *v82;
  void *v83[3];
  void *v84[3];
  void *v85[3];
  char *v86;
  char *v87;

  v8 = a3;
  v9 = a4;
  std::vector<CGPoint>::vector(&v86, 4 * objc_msgSend(v8, "count"));
  std::vector<CGPoint>::vector(v85, 4 * objc_msgSend(v9, "count"));
  std::vector<half>::vector(v84, 8 * objc_msgSend(v8, "count"));
  std::vector<half>::vector(v83, 8 * objc_msgSend(v9, "count"));
  v10 = objc_msgSend(v8, "count");
  v11 = v10;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  if (v10)
  {
    if (v10 >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v10);
    v80 = v12;
    v82 = &v12[v13];
    v14 = &v12[v11];
    v15 = 8 * v11;
    do
    {
      *v12++ = 4;
      v15 -= 8;
    }
    while (v15);
    v81 = v14;
  }
  v16 = objc_msgSend(v8, "count");
  VisionCoreHomography::VisionCoreHomography(&v78);
  std::vector<VisionCoreHomography>::vector(v79, v16, &v78);
  VisionCoreHomography::~VisionCoreHomography(&v78);
  __x = 0;
  std::vector<int>::vector((std::vector<int> *)&v78, objc_msgSend(v8, "count"), &__x);
  v17 = 0;
  v18 = 3;
  while (objc_msgSend(v8, "count") > v17)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topLeft");
    v20 = v18 - 3;
    v21 = &v86[16 * v20];
    *(_QWORD *)v21 = v22;
    *((_QWORD *)v21 + 1) = v23;

    objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topRight");
    v25 = v18 - 2;
    v26 = &v86[16 * v25];
    *(_QWORD *)v26 = v27;
    *((_QWORD *)v26 + 1) = v28;

    objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomLeft");
    v30 = v18 - 1;
    v31 = &v86[16 * v30];
    *(_QWORD *)v31 = v32;
    *((_QWORD *)v31 + 1) = v33;

    objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomRight");
    v35 = &v86[16 * v18];
    *(_QWORD *)v35 = v36;
    *((_QWORD *)v35 + 1) = v37;

    objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topLeft");
    v39 = (char *)v85[0] + 16 * v20;
    *v39 = v40;
    v39[1] = v41;

    objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topRight");
    v43 = (char *)v85[0] + 16 * v25;
    *v43 = v44;
    v43[1] = v45;

    objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomLeft");
    v47 = (char *)v85[0] + 16 * v30;
    *v47 = v48;
    v47[1] = v49;

    objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomRight");
    v51 = (char *)v85[0] + 16 * v18;
    *v51 = v52;
    v51[1] = v53;

    ++v17;
    v18 += 4;
  }
  if (v87 != v86)
  {
    v54 = (v87 - v86) >> 4;
    if (v54 <= 1)
      v54 = 1;
    v55 = (uint64_t *)((char *)v85[0] + 8);
    v56 = (uint64_t *)(v86 + 8);
    v57 = (char *)v83[0] + 2;
    v58 = (char *)v84[0] + 2;
    do
    {
      _D0 = *(v56 - 1);
      __asm { FCVT            H0, D0 }
      *(v58 - 1) = _D0;
      v64 = *v56;
      v56 += 2;
      _D0 = v64;
      __asm { FCVT            H0, D0 }
      *v58 = _D0;
      _D0 = *(v55 - 1);
      __asm { FCVT            H0, D0 }
      *(v57 - 1) = _D0;
      v67 = *v55;
      v55 += 2;
      _D0 = v67;
      __asm { FCVT            H0, D0 }
      *v57 = _D0;
      v57 += 2;
      v58 += 2;
      --v54;
    }
    while (v54);
  }
  if (objc_msgSend(v8, "count"))
  {
    LODWORD(v69) = 1.0;
    *(float *)&v70 = a5;
    objc_msgSend(a1, "recursiveRansacSrcPts:DstPts:QuadsMatchingKptsCount:resultingHomographies:groups:inlierRatio:ransacReprojErrorThreshold:", v84, v83, &v80, v79, &v78, v69, v70);
  }
  v71 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v72 = (void *)objc_msgSend(v71, "initWithCapacity:", v78.var0.var1 - v78.var0.var0);
  var1 = v78.var0.var1;
  if (v78.var0.var1 != v78.var0.var0)
  {
    v74 = 0;
    var1 = v78.var0.var0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", LODWORD(var1[v74]));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "addObject:", v75);

      ++v74;
      var1 = v78.var0.var0;
    }
    while (v74 < v78.var0.var1 - v78.var0.var0);
  }
  if (var1)
  {
    v78.var0.var1 = var1;
    operator delete(var1);
  }
  v78.var0.var0 = (float *)v79;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  if (v80)
  {
    v81 = v80;
    operator delete(v80);
  }
  if (v83[0])
  {
    v83[1] = v83[0];
    operator delete(v83[0]);
  }
  if (v84[0])
  {
    v84[1] = v84[0];
    operator delete(v84[0]);
  }
  if (v85[0])
  {
    v85[1] = v85[0];
    operator delete(v85[0]);
  }
  if (v86)
  {
    v87 = v86;
    operator delete(v86);
  }

  return v72;
}

+ (void)recursiveRansacSrcPts:(void *)a3 DstPts:(void *)a4 QuadsMatchingKptsCount:(void *)a5 resultingHomographies:(void *)a6 groups:(void *)a7 inlierRatio:(float)a8 ransacReprojErrorThreshold:(float)a9
{
  uint64_t v12;
  unint64_t v13;
  double v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  int *v32;
  int *v33;
  int *v34;
  int v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  char *v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  double v54;
  double v55;
  int *v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  _WORD *v62;
  _WORD *v63;
  VisionCoreHomography *v64;
  int *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  BOOL v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  int *v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  VisionCoreHomography *v81;
  VisionCoreHomography *v82;
  VisionCoreHomography *v83;
  VisionCoreHomography *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  const VisionCoreHomography *v88;
  id v89;
  void *__p;
  char *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  std::vector<int>::value_type __x[2];
  void *v104;
  uint64_t v105;
  VisionCoreHomography *v106;
  VisionCoreHomography *v107;
  VisionCoreHomography v108;
  void *v109;
  unint64_t v110;
  uint64_t v111;
  void *v112;
  int *v113;
  VisionCoreHomography v114;

  if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 < 8uLL || *((_QWORD *)a7 + 1) == *(_QWORD *)a7 || **(int **)a7 >= 2)
  {
    if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
    {
      v12 = 0;
      v13 = 0;
      do
      {
        VisionCoreHomography::VisionCoreHomography(&v114);
        VisionCoreHomography::operator=(*(_QWORD *)a6 + v12, (__int128 *)&v114);
        VisionCoreHomography::~VisionCoreHomography(&v114);
        *(_DWORD *)(*(_QWORD *)a7 + 4 * v13++) = 0x7FFFFFFF;
        v12 += 136;
      }
      while (v13 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
    }
    return;
  }
  *(float *)&v18 = a9;
  objc_msgSend(a1, "_estimateTransformSrcPts:DstPts:ransacReprojErrorThreshold:", v18);
  objc_msgSend(a1, "getInlierCountsPerQuad:inliers:", a5, &v114.var3);
  v20 = *(int **)a5;
  v19 = *((_QWORD *)a5 + 1);
  v110 = 0;
  v111 = 0;
  v109 = 0;
  v21 = v19 - (_QWORD)v20;
  v89 = a1;
  if (v21)
  {
    v22 = v21 >> 3;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v109, v21 >> 3);
    v23 = v110;
    v24 = v110 + v22;
    v110 += v22;
    if (v23)
    {
      v25 = v24 - 1;
      if (((v24 - 1) ^ (v23 - 1)) <= 0x3F)
      {
        v26 = v109;
LABEL_18:
        v29 = &v26[v23 >> 6];
        if ((v23 & 0x3F) != 0)
        {
          if (64 - (v23 & 0x3F) >= v22)
            v30 = v22;
          else
            v30 = 64 - (v23 & 0x3F);
          *v29++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - (v23 & 0x3Fu) - v30)) & (-1 << v23));
          v22 -= v30;
        }
        v31 = v22 >> 6;
        if (v22 >= 0x40)
          bzero(v29, 8 * v31);
        if ((v22 & 0x3F) != 0)
          v29[v31] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v22 & 0x3F));
        goto LABEL_27;
      }
    }
    else
    {
      v25 = v24 - 1;
    }
    v26 = v109;
    v27 = v25 >> 6;
    if (v24 >= 0x41)
      v28 = v27;
    else
      v28 = 0;
    *((_QWORD *)v109 + v28) = 0;
    goto LABEL_18;
  }
  v26 = 0;
LABEL_27:
  v32 = (int *)v112;
  v33 = v113;
  v34 = *(int **)a5;
  if (v112 != v113)
  {
    v35 = 0;
    v36 = *(int **)a5;
    do
    {
      v37 = 1 << v35;
      if ((float)((float)*v32 / (float)*v36) >= a8)
        v38 = *v26 & ~v37;
      else
        v38 = *v26 | v37;
      *v26 = v38;
      ++v32;
      v36 += 2;
      v26 += v35 == 63;
      if (v35 == 63)
        v35 = 0;
      else
        ++v35;
    }
    while (v32 != v33);
  }
  v39 = (int *)*((_QWORD *)a5 + 1);
  v40 = 0;
  v41 = 0;
  if (v39 == v34)
  {
    v51 = ((char *)v39 - (char *)v34) >> 3;
    v39 = v34;
  }
  else
  {
    v42 = 0;
    v43 = 0;
    do
    {
      if (((*(_QWORD *)((char *)v109 + ((v43 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v43) & 1) != 0)
      {
        if ((unint64_t)v41 >= v42)
        {
          v45 = (v41 - v40) >> 2;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v42 - (_QWORD)v40) >> 1 > v46)
            v46 = (uint64_t)(v42 - (_QWORD)v40) >> 1;
          if (v42 - (unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL)
            v47 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v47 = v46;
          if (v47)
            v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v47);
          else
            v48 = 0;
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v43;
          v44 = v49 + 4;
          while (v41 != v40)
          {
            v50 = *((_DWORD *)v41 - 1);
            v41 -= 4;
            *((_DWORD *)v49 - 1) = v50;
            v49 -= 4;
          }
          v42 = v47 + 4 * v48;
          if (v40)
            operator delete(v40);
          v40 = v49;
        }
        else
        {
          *(_DWORD *)v41 = v43;
          v44 = v41 + 4;
        }
        v34 = *(int **)a5;
        v39 = (int *)*((_QWORD *)a5 + 1);
        v41 = v44;
      }
      ++v43;
      v51 = ((char *)v39 - (char *)v34) >> 3;
    }
    while (v51 > v43);
  }
  if (v51 == (v41 - v40) >> 2)
  {
    if (v39 != v34)
    {
      v52 = 0;
      v53 = 0;
      do
      {
        VisionCoreHomography::VisionCoreHomography(&v108);
        VisionCoreHomography::operator=(*(_QWORD *)a6 + v52, (__int128 *)&v108);
        VisionCoreHomography::~VisionCoreHomography(&v108);
        *(_DWORD *)(*(_QWORD *)a7 + 4 * v53++) = 0x7FFFFFFF;
        v52 += 136;
      }
      while (v53 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
    }
  }
  else
  {
    VisionCoreHomography::VisionCoreHomography(&v108);
    std::vector<VisionCoreHomography>::vector(&v106, (v41 - v40) >> 2, &v108);
    VisionCoreHomography::~VisionCoreHomography(&v108);
    __x[0] = **(_DWORD **)a7 + 1;
    std::vector<int>::vector((std::vector<int> *)&v108, (v41 - v40) >> 2, __x);
    *(_QWORD *)__x = 0;
    v104 = 0;
    v105 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    __p = 0;
    v92 = 0;
    v93 = 0;
    v56 = *(int **)a5;
    if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
    {
      v57 = 0;
      v58 = 0;
      v59 = (char *)v109;
      do
      {
        v60 = v58 << 32;
        v61 = (int)v58;
        v58 = 2 * *(_QWORD *)&v56[2 * v57] + (int)v58;
        v62 = (_WORD *)(*(_QWORD *)a3 + (v60 >> 31));
        v63 = (_WORD *)(*(_QWORD *)a3 + 2 * (int)v58);
        if (((*(_QWORD *)&v59[(v57 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v57) & 1) != 0)
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v62, v63, (uint64_t)__x);
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(_QWORD *)a4 + 2 * v61), (_WORD *)(*(_QWORD *)a4 + 2 * (int)v58), (uint64_t)&v100);
          v65 = *(int **)a5;
          v66 = v92;
          if ((unint64_t)v92 >= v93)
          {
            v68 = (char *)__p;
            v69 = (v92 - (_BYTE *)__p) >> 3;
            v70 = v69 + 1;
            if ((unint64_t)(v69 + 1) >> 61)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v71 = v93 - (_QWORD)__p;
            if ((uint64_t)(v93 - (_QWORD)__p) >> 2 > v70)
              v70 = v71 >> 2;
            v72 = (unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8;
            v73 = 0x1FFFFFFFFFFFFFFFLL;
            if (!v72)
              v73 = v70;
            if (v73)
            {
              v73 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v73);
              v68 = (char *)__p;
              v66 = v92;
            }
            else
            {
              v74 = 0;
            }
            v75 = (char *)(v73 + 8 * v69);
            *(_QWORD *)v75 = *(_QWORD *)&v65[2 * v57];
            v67 = v75 + 8;
            while (v66 != v68)
            {
              v76 = *((_QWORD *)v66 - 1);
              v66 -= 8;
              *((_QWORD *)v75 - 1) = v76;
              v75 -= 8;
            }
            __p = v75;
            v92 = v67;
            v93 = v73 + 8 * v74;
            if (v68)
              operator delete(v68);
          }
          else
          {
            *(_QWORD *)v92 = *(_QWORD *)&v65[2 * v57];
            v67 = v66 + 8;
          }
          v92 = v67;
        }
        else
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v62, v63, (uint64_t)&v97);
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(_QWORD *)a4 + 2 * v61), (_WORD *)(*(_QWORD *)a4 + 2 * (int)v58), (uint64_t)&v94);
        }
        ++v57;
        v56 = *(int **)a5;
        v77 = (int *)*((_QWORD *)a5 + 1);
      }
      while (v57 < ((uint64_t)v77 - *(_QWORD *)a5) >> 3);
      if (v77 != v56)
      {
        v78 = 0;
        v79 = 0;
        v80 = (char *)v109;
        do
        {
          if (((*(_QWORD *)&v80[(v79 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v79) & 1) == 0)
          {
            v81 = (VisionCoreHomography *)(*(_QWORD *)a6 + v78);
            if (v81 != &v114)
            {
              VisionCoreHomography::copyHomography(&v114, v81, v64);
              v56 = *(int **)a5;
              v77 = (int *)*((_QWORD *)a5 + 1);
            }
          }
          ++v79;
          v78 += 136;
        }
        while (v79 < ((char *)v77 - (char *)v56) >> 3);
      }
    }
    *(float *)&v55 = a9 + a9;
    *(float *)&v54 = a8;
    objc_msgSend(v89, "recursiveRansacSrcPts:DstPts:QuadsMatchingKptsCount:resultingHomographies:groups:inlierRatio:ransacReprojErrorThreshold:", __x, &v100, &__p, &v106, &v108, v54, v55);
    v84 = v106;
    v83 = v107;
    if (v107 != v106)
    {
      v85 = 0;
      v86 = 0;
      do
      {
        v87 = *(int *)&v40[4 * v86];
        v88 = (const VisionCoreHomography *)(*(_QWORD *)a6 + 136 * (int)v87);
        if (&v84[v85] != v88)
        {
          VisionCoreHomography::copyHomography(&v84[v85], v88, v82);
          v87 = *(int *)&v40[4 * v86];
          v84 = v106;
          v83 = v107;
        }
        *(float *)(*(_QWORD *)a7 + 4 * v87) = v108.var0.var0[v86++];
        ++v85;
      }
      while (0xF0F0F0F0F0F0F0F1 * (((char *)v83 - (char *)v84) >> 3) > v86);
    }
    if (__p)
    {
      v92 = (char *)__p;
      operator delete(__p);
    }
    if (v94)
    {
      v95 = v94;
      operator delete(v94);
    }
    if (v97)
    {
      v98 = v97;
      operator delete(v97);
    }
    if (v100)
    {
      v101 = v100;
      operator delete(v100);
    }
    if (*(_QWORD *)__x)
    {
      v104 = *(void **)__x;
      operator delete(*(void **)__x);
    }
    if (v108.var0.var0)
    {
      v108.var0.var1 = v108.var0.var0;
      operator delete(v108.var0.var0);
    }
    v108.var0.var0 = (float *)&v106;
    std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&v108);
  }
  if (v40)
    operator delete(v40);
  if (v109)
    operator delete(v109);
  if (v112)
  {
    v113 = (int *)v112;
    operator delete(v112);
  }
  VisionCoreHomography::~VisionCoreHomography(&v114);
}

+ (vector<int,)getInlierCountsPerQuad:()vector<int inliers:(std:(SEL)a3 :(void *)a4 allocator<int>> *)result
{
  uint64_t v6;
  int *v8;
  int *v9;
  int *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int8x8_t *v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8x8_t v25;
  int v26;
  int8x8_t v27;
  uint8x8_t v28;
  uint8x8_t v29;
  int *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  int *v34;
  int v35;
  void *v36;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v6 = *(_QWORD *)a4;
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v36 = a5;
    do
    {
      v13 = (int)v12;
      v14 = v12 << 32 >= (uint64_t)0xFFFFFFFF00000001;
      v15 = v12 & 0x3F;
      v12 = *(_QWORD *)(v6 + 8 * v11) + (int)v12;
      v16 = *(_QWORD *)a5;
      if (v14)
        v17 = v13 >> 6;
      else
        v17 = -(uint64_t)((63 - v13) >> 6);
      v18 = (int8x8_t *)(v16 + 8 * v17);
      if ((int)v12 < 0)
        v19 = -(uint64_t)((63 - v12) >> 6);
      else
        v19 = v12 >> 6;
      v20 = (v12 & 0x3F) - v15 + 8 * (v16 + 8 * v19 - (_QWORD)v18);
      v21 = v13 & 0x3F;
      if (v21)
      {
        v22 = (64 - v21);
        if (v22 >= v20)
          v23 = v20;
        else
          v23 = v22;
        v24 = (uint64_t)*v18++;
        v25 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (v22 - v23)) & (-1 << v15) & v24));
        v25.i16[0] = vaddlv_u8(v25);
        v26 = v25.i32[0];
        v20 -= v23;
      }
      else
      {
        v26 = 0;
      }
      if (v20 >= 0x40)
      {
        do
        {
          v27 = *v18++;
          v28 = (uint8x8_t)vcnt_s8(v27);
          v28.i16[0] = vaddlv_u8(v28);
          v26 += v28.i32[0];
          v20 -= 64;
        }
        while (v20 > 0x3F);
      }
      if (v20)
      {
        v29 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)v18 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v20)));
        v29.i16[0] = vaddlv_u8(v29);
        v26 += v29.i32[0];
      }
      if (v8 >= v10)
      {
        v31 = v8 - v9;
        v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if (((char *)v10 - (char *)v9) >> 1 > v32)
          v32 = ((char *)v10 - (char *)v9) >> 1;
        if ((unint64_t)((char *)v10 - (char *)v9) >= 0x7FFFFFFFFFFFFFFCLL)
          result = (vector<int, std::allocator<int>> *)0x3FFFFFFFFFFFFFFFLL;
        else
          result = (vector<int, std::allocator<int>> *)v32;
        if (result)
          result = (vector<int, std::allocator<int>> *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((unint64_t)result);
        else
          v33 = 0;
        v34 = (int *)((char *)result + 4 * v31);
        *v34 = v26;
        v30 = v34 + 1;
        while (v8 != v9)
        {
          v35 = *--v8;
          *--v34 = v35;
        }
        v10 = (int *)((char *)result + 4 * v33);
        retstr->var0 = v34;
        retstr->var1 = v30;
        retstr->var2.var0 = v10;
        if (v9)
          operator delete(v9);
        v9 = v34;
        a5 = v36;
      }
      else
      {
        *v8 = v26;
        v30 = v8 + 1;
      }
      retstr->var1 = v30;
      ++v11;
      v6 = *(_QWORD *)a4;
      v8 = v30;
    }
    while (v11 < (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  }
  return result;
}

+ (void)updateGroupingWithQuadsOnMemory:(id)a3 groups:(void *)a4
{
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  std::vector<int>::size_type v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  char *v16;
  char *v17;
  unint64_t i;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  int v35;
  unint64_t j;
  void *v37;
  unint64_t v38;
  int v39;
  int v40;
  unint64_t v41;
  void *__p;
  void *v44;
  uint64_t v45;
  std::vector<int>::value_type __x;
  VisionCoreHomography v47;
  VisionCoreHomography *v48[4];

  v5 = a3;
  v6 = (uint64_t *)objc_msgSend(v5, "groupingMemoryQuadPointsCounts");
  v8 = *v6;
  v7 = v6[1];
  VisionCoreHomography::VisionCoreHomography(&v47);
  std::vector<VisionCoreHomography>::vector(v48, (v7 - v8) >> 3, &v47);
  VisionCoreHomography::~VisionCoreHomography(&v47);
  v9 = (_QWORD *)objc_msgSend(v5, "groupingMemoryQuadPointsCounts");
  v10 = (uint64_t)(v9[1] - *v9) >> 3;
  __x = 0;
  std::vector<int>::vector((std::vector<int> *)&v47, v10, &__x);
  v11 = objc_msgSend(v5, "groupingMemorySrcPoints");
  v12 = objc_msgSend(v5, "groupingMemoryDstPoints");
  v13 = objc_msgSend(v5, "groupingMemoryQuadPointsCounts");
  LODWORD(v14) = 1036831949;
  LODWORD(v15) = 1042983595;
  objc_msgSend(a1, "recursiveRansacSrcPts:DstPts:QuadsMatchingKptsCount:resultingHomographies:groups:inlierRatio:ransacReprojErrorThreshold:", v11, v12, v13, v48, &v47, v14, v15);
  v16 = 0;
  v17 = 0;
  v41 = 0;
  for (i = 0; ; ++i)
  {
    objc_msgSend(v5, "trackedQuads");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 <= i)
      break;
    v21 = -1;
    do
    {
      objc_msgSend(v5, "groupingMemoryQuadIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 <= v21 + 1)
      {
        *(_DWORD *)(*(_QWORD *)a4 + 4 * i) = 0x7FFFFFFF;
        goto LABEL_24;
      }
      objc_msgSend(v5, "groupingMemoryQuadIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v21 + 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackedQuads");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      ++v21;
    }
    while (v25 != v28);
    *(float *)(*(_QWORD *)a4 + 4 * i) = v47.var0.var0[v21];
    if ((unint64_t)v17 >= v41)
    {
      v29 = (v17 - v16) >> 2;
      v30 = v29 + 1;
      if ((unint64_t)(v29 + 1) >> 62)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      if ((uint64_t)(v41 - (_QWORD)v16) >> 1 > v30)
        v30 = (uint64_t)(v41 - (_QWORD)v16) >> 1;
      if (v41 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
        v31 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v31 = v30;
      if (v31)
        v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v31);
      else
        v32 = 0;
      v33 = (char *)(v31 + 4 * v29);
      *(_DWORD *)v33 = i;
      v34 = v33 + 4;
      while (v17 != v16)
      {
        v35 = *((_DWORD *)v17 - 1);
        v17 -= 4;
        *((_DWORD *)v33 - 1) = v35;
        v33 -= 4;
      }
      v41 = v31 + 4 * v32;
      if (v16)
        operator delete(v16);
      v16 = v33;
      v17 = v34;
    }
    else
    {
      *(_DWORD *)v17 = i;
      v17 += 4;
    }
LABEL_24:
    ;
  }
  for (j = 0; ; ++j)
  {
    objc_msgSend(v5, "trackedQuads");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38 <= j)
      break;
    if (*(_DWORD *)(*(_QWORD *)a4 + 4 * j) == 0x7FFFFFFF)
    {
      __p = 0;
      v44 = 0;
      v45 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v16, (uint64_t)v17, (v17 - v16) >> 2);
      v39 = objc_msgSend(v5, "findClosestQuadIndex:candidateIndices:", j, &__p);
      if (__p)
      {
        v44 = __p;
        operator delete(__p);
      }
      if (v39 == -1)
        v40 = 0x7FFFFFFF;
      else
        v40 = *(_DWORD *)(*(_QWORD *)a4 + 4 * v39);
      *(_DWORD *)(*(_QWORD *)a4 + 4 * j) = v40;
    }
  }
  if (v16)
    operator delete(v16);
  if (v47.var0.var0)
  {
    v47.var0.var1 = v47.var0.var0;
    operator delete(v47.var0.var0);
  }
  v47.var0.var0 = (float *)v48;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);

}

+ (BOOL)_updateSession:(id)a3 referenceFrame:(__CVBuffer *)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "mtlContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindPixelBufferToMTL2DTexture:pixelFormat:plane:", a4, objc_msgSend((id)objc_opt_class(), "_mtlPixelFormatForBuffer:", a4), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateReferenceTexture:frame:", v8, a4);

  return 1;
}

+ (vector<VisionCoreHomography,)_runSparseOpticalFlowOnFrame:(id)a2 shouldRunCorr:(SEL)a3 forSession:(__CVBuffer *)a4 error:(BOOL)a5 groups:(id)a6 options:(id *)a7
{
  _BOOL4 v11;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  NSObject *v40;
  NSObject *v41;
  _QWORD *v42;
  float *v43;
  void *v44;
  _BOOL4 v45;
  VisionCoreLKTSparseGPU *v46;
  void *v47;
  size_t Width;
  VisionCoreLKTSparseGPU *v49;
  void *v50;
  void *v51;
  _DWORD *v52;
  double v53;
  void *v54;
  NSObject *v55;
  _QWORD *v56;
  float *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float *var0;
  int64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  int *v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  NSObject *v84;
  vector<VisionCoreHomography, std::allocator<VisionCoreHomography>> *result;
  int i;
  unint64_t *v87;
  unint64_t *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  unint64_t *v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  BOOL v108;
  unint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char *v113;
  _BYTE *v114;
  double v115;
  double v116;
  VisionCoreHomography *v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t *v120;
  uint64_t v121;
  VisionCoreHomography *v122;
  _DWORD *v123;
  _BYTE *v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  char *v128;
  unint64_t v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  char *v134;
  int v135;
  uint64_t v136;
  unint64_t v137;
  VisionCoreHomography *v138;
  int v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  id v148;
  void *v149;
  id v150;
  void *v153;
  void *v154;
  uint64_t v155;
  std::vector<int>::value_type __x;
  VisionCoreHomography *v157[3];
  void *v158;
  char *v159;
  unint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *__p;
  char *v168;
  char *v169;
  VisionCoreHomography buf;
  uint64_t v171;

  v11 = a5;
  v171 = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  v14 = a9;
  v15 = (uint64_t *)objc_msgSend(v13, "quadPointCounts");
  v17 = *v15;
  v16 = v15[1];
  VisionCoreHomography::VisionCoreHomography(&buf);
  std::vector<VisionCoreHomography>::vector(&retstr->var0, (v16 - v17) >> 3, &buf);
  VisionCoreHomography::~VisionCoreHomography(&buf);
  objc_msgSend(v13, "texture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = v11;
  else
    v19 = 0;

  if (v19)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VisionCore_RansacMaxReprojError"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v20;
    if (v20)
    {
      objc_msgSend(v20, "floatValue");
      v22 = v21;
    }
    else
    {
      v22 = 0.5;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VisionCore_MultiHomographyInlierRatio"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v23;
    if (v23)
    {
      objc_msgSend(v23, "floatValue");
      v25 = v24;
    }
    else
    {
      v25 = 1036831949;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VisionCoreOption_OpticalFlowPyramidScales"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v26;
    if (v26)
      v27 = objc_msgSend(v26, "intValue");
    else
      v27 = 0xFFFFFFFFLL;
    _VisionCoreSignpostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowTexturePreparation", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v13, "mtlContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bindPixelBufferToMTL2DTexture:pixelFormat:plane:", a4, objc_msgSend((id)objc_opt_class(), "_mtlPixelFormatForBuffer:", a4), 0);
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v13, "frameCountSinceLastGrouping");
    objc_msgSend(v13, "setDebuggingMemoryResult:", 0);
    objc_msgSend(v13, "setDebuggingResult:", 0);
    v31 = v30 % 3;
    if (v30 % 3)
    {
      objc_msgSend(v13, "moveMemoryKeypointsToSessionKpts");
    }
    else
    {
      v32 = (_QWORD *)objc_msgSend(v13, "groupingMemoryDstPoints");
      if (v32[1] != *v32)
      {
        v33 = (uint64_t *)objc_msgSend(v13, "groupingMemorySrcPoints");
        v35 = *v33;
        v34 = v33[1];
        v36 = (_QWORD *)objc_msgSend(v13, "groupingMemorySrcPoints");
        if (v34 - v35 == v36[1] - *v36)
        {
          v37 = *((_QWORD *)a8 + 1) - *(_QWORD *)a8;
          if (v37 >= 1)
            bzero(*(void **)a8, 4 * (((unint64_t)v37 >> 2) - ((unint64_t)v37 > 3)) + 4);
          objc_msgSend(a2, "updateGroupingWithQuadsOnMemory:groups:", v13, a8);
        }
      }
      objc_msgSend(v13, "resetGroupingMemory");
    }
    objc_msgSend(v13, "mtlContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (_QWORD *)objc_msgSend(v13, "allSrcPoints");
    v150 = (id)objc_msgSend(v38, "newBufferWithPixelFormat:width:data:", 65, (v39[1] - *v39) >> 2, *(_QWORD *)objc_msgSend(v13, "allSrcPoints"));

    _VisionCoreSignpostLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v40))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowTexturePreparation", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
    }

    _VisionCoreSignpostLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v41))
    {
      v42 = (_QWORD *)objc_msgSend(v13, "allSrcPoints");
      v43 = (float *)((unint64_t)((uint64_t)(v42[1] - *v42) >> 1) >> 1);
      LODWORD(buf.var0.var0) = 134217984;
      *(float **)((char *)&buf.var0.var0 + 4) = v43;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v41, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowRunBidirectional", "num keypoints: %lu", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v13, "lktSparseGPUContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44 == 0;

    if (v45)
    {
      v46 = [VisionCoreLKTSparseGPU alloc];
      objc_msgSend(v13, "mtlContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      Width = CVPixelBufferGetWidth(a4);
      v49 = -[VisionCoreLKTSparseGPU initWithMetalContext:width:height:nscales:](v46, "initWithMetalContext:width:height:nscales:", v47, Width, CVPixelBufferGetHeight(a4), v27);
      objc_msgSend(v13, "setLktSparseGPUContext:", v49);

    }
    objc_msgSend(v13, "lktSparseGPUContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "texture");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (_DWORD *)objc_msgSend(v13, "allSrcPoints");
    LODWORD(v53) = 0.5;
    objc_msgSend(v50, "computeMatchingBidirectionalFromReferenceTexture:targetTexture:kptsBuffer:bidirectionalError:numKeypoints:", v51, v149, v150, (unsigned __int16)((v52[2] - *v52) >> 2), v53);

    objc_msgSend(v13, "lktSparseGPUContext");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "waitUntilCompleted");

    _VisionCoreSignpostLog();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v55))
    {
      v56 = (_QWORD *)objc_msgSend(v13, "allSrcPoints");
      v57 = (float *)((unint64_t)((uint64_t)(v56[1] - *v56) >> 1) >> 1);
      LODWORD(buf.var0.var0) = 134217984;
      *(float **)((char *)&buf.var0.var0 + 4) = v57;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowRunBidirectional", "num keypoints: %lu", (uint8_t *)&buf, 0xCu);
    }

    _VisionCoreSignpostLog();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v58))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v58, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointToQuadAllocation", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v13, "lktSparseGPUContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "keypointsTarget");
    v145 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lktSparseGPUContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "keypointsStatus");
    v146 = (id)objc_claimAutoreleasedReturnValue();

    v61 = objc_retainAutorelease(v150);
    v62 = objc_msgSend(v61, "contents");
    v148 = objc_retainAutorelease(v145);
    v63 = objc_msgSend(v148, "contents");
    v147 = objc_retainAutorelease(v146);
    v64 = objc_msgSend(v147, "contents");
    if (v31)
    {
      memset(&buf, 0, 24);
      objc_msgSend(v13, "updateMemoryKeypointsWithOpticalFlowResultsSourceBuffer:destBuffer:matchBuffer:start:", v62, v63, v64, objc_msgSend(v13, "updateKeypointsWithOpticalFlowResultsSourceBuffer:destBuffer:matchBuffer:matchCount:", v62, v63, v64, &buf));
    }
    else
    {
      memset(&buf, 0, 24);
      objc_msgSend(v13, "updateKeypointsWithOpticalFlowResultsSourceBuffer:destBuffer:matchBuffer:matchCount:", v62, v63, v64, &buf);
      __p = 0;
      v168 = 0;
      v169 = 0;
      var0 = buf.var0.var0;
      v66 = (char *)buf.var0.var1 - (char *)buf.var0.var0;
      if (buf.var0.var1 != buf.var0.var0)
      {
        if (v66 < 0)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        __p = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v66 >> 3);
        v169 = (char *)__p + 8 * v67;
        memmove(__p, var0, v66);
        v168 = (char *)__p + 8 * (v66 >> 3);
      }
      objc_msgSend(v13, "saveCurrentMatchingToMemoryMatchCounts:", &__p);
      if (__p)
      {
        v168 = (char *)__p;
        operator delete(__p);
      }
    }
    if (buf.var0.var0)
    {
      buf.var0.var1 = buf.var0.var0;
      operator delete(buf.var0.var0);
    }
    _VisionCoreSignpostLog();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v68))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v68, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointToQuadAllocation", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
    }

    v69 = (uint64_t *)objc_msgSend(v13, "allSrcPoints");
    v71 = *v69;
    v70 = v69[1];
    v72 = (_QWORD *)objc_msgSend(v13, "allDstPoints");
    if (v70 - v71 == v72[1] - *v72)
    {
      v73 = (_QWORD *)objc_msgSend(v13, "allSrcPoints");
      if (v73[1] != *v73)
      {
        _VisionCoreSignpostLog();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v74))
        {
          LOWORD(buf.var0.var0) = 0;
          _os_signpost_emit_with_name_impl(&dword_21DED3000, v74, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEstimateSceneHG", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
        }

        v75 = *((_QWORD *)a8 + 1) - *(_QWORD *)a8;
        if (v75)
        {
          v76 = v75 >> 2;
          if ((unint64_t)(v75 >> 2) <= 1)
            v76 = 1;
          v77 = *(int **)a8;
          while (1)
          {
            v78 = *v77++;
            if ((v78 | 0x80000000) != 0xFFFFFFFF)
              break;
            if (!--v76)
              goto LABEL_55;
          }
          v140 = v61;
          v141 = v14;
          for (i = 0; i != 3; ++i)
          {
            v87 = 0;
            v88 = 0;
            v89 = 0;
            v90 = 0;
            LODWORD(v91) = 0;
            v164 = 0;
            v165 = 0;
            v166 = 0;
            v161 = 0;
            v162 = 0;
            v163 = 0;
            v158 = 0;
            v159 = 0;
            v160 = 0;
            while (1)
            {
              v92 = (_QWORD *)objc_msgSend(v13, "quadPointCounts", v140);
              if (v90 >= (uint64_t)(v92[1] - *v92) >> 3)
                break;
              v93 = (int)v91;
              v91 = (int)v91 + 2 * *(_QWORD *)(*(_QWORD *)objc_msgSend(v13, "quadPointCounts") + 8 * v90);
              if (*(_DWORD *)(*(_QWORD *)a8 + 4 * v90) == i)
              {
                std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(_QWORD *)objc_msgSend(v13, "allSrcPoints") + 2 * v93), (_WORD *)(*(_QWORD *)objc_msgSend(v13, "allSrcPoints") + 2 * (int)v91), (uint64_t)&v164);
                std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(_QWORD *)objc_msgSend(v13, "allDstPoints") + 2 * v93), (_WORD *)(*(_QWORD *)objc_msgSend(v13, "allDstPoints") + 2 * (int)v91), (uint64_t)&v161);
                if ((unint64_t)v88 >= v89)
                {
                  v95 = v88 - v87;
                  v96 = v95 + 1;
                  if ((unint64_t)(v95 + 1) >> 61)
                    goto LABEL_155;
                  if ((uint64_t)(v89 - (_QWORD)v87) >> 2 > v96)
                    v96 = (uint64_t)(v89 - (_QWORD)v87) >> 2;
                  if (v89 - (unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8)
                    v97 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v97 = v96;
                  if (v97)
                    v97 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v97);
                  else
                    v98 = 0;
                  v99 = (unint64_t *)(v97 + 8 * v95);
                  *v99 = v90;
                  v94 = v99 + 1;
                  while (v88 != v87)
                  {
                    v100 = *--v88;
                    *--v99 = v100;
                  }
                  v89 = v97 + 8 * v98;
                  if (v87)
                    operator delete(v87);
                  v87 = v99;
                }
                else
                {
                  *v88 = v90;
                  v94 = v88 + 1;
                }
                v101 = *(_QWORD *)objc_msgSend(v13, "quadPointCounts");
                v102 = v159;
                if ((unint64_t)v159 >= v160)
                {
                  v104 = (char *)v158;
                  v105 = (v159 - (_BYTE *)v158) >> 3;
                  v106 = v105 + 1;
                  if ((unint64_t)(v105 + 1) >> 61)
LABEL_155:
                    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                  v107 = v160 - (_QWORD)v158;
                  if ((uint64_t)(v160 - (_QWORD)v158) >> 2 > v106)
                    v106 = v107 >> 2;
                  v108 = (unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8;
                  v109 = 0x1FFFFFFFFFFFFFFFLL;
                  if (!v108)
                    v109 = v106;
                  if (v109)
                  {
                    v109 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v109);
                    v104 = (char *)v158;
                    v102 = v159;
                  }
                  else
                  {
                    v110 = 0;
                  }
                  v111 = (char *)(v109 + 8 * v105);
                  *(_QWORD *)v111 = *(_QWORD *)(v101 + 8 * v90);
                  v103 = v111 + 8;
                  while (v102 != v104)
                  {
                    v112 = *((_QWORD *)v102 - 1);
                    v102 -= 8;
                    *((_QWORD *)v111 - 1) = v112;
                    v111 -= 8;
                  }
                  v158 = v111;
                  v159 = v103;
                  v160 = v109 + 8 * v110;
                  if (v104)
                    operator delete(v104);
                }
                else
                {
                  *(_QWORD *)v159 = *(_QWORD *)(v101 + 8 * v90);
                  v103 = v102 + 8;
                }
                v159 = v103;
                v88 = v94;
              }
              ++v90;
            }
            if (v165 != v164)
            {
              v114 = v158;
              v113 = v159;
              VisionCoreHomography::VisionCoreHomography(&buf);
              std::vector<VisionCoreHomography>::vector(v157, (v113 - v114) >> 3, &buf);
              VisionCoreHomography::~VisionCoreHomography(&buf);
              __x = 0;
              std::vector<int>::vector((std::vector<int> *)&buf, (v159 - (_BYTE *)v158) >> 3, &__x);
              LODWORD(v115) = 0.5;
              LODWORD(v116) = 1028443341;
              objc_msgSend(a2, "recursiveRansacSrcPts:DstPts:QuadsMatchingKptsCount:resultingHomographies:groups:inlierRatio:ransacReprojErrorThreshold:", &v164, &v161, &v158, v157, &buf, v116, v115);
              if (v88 != v87)
              {
                v118 = 0;
                if ((unint64_t)(v88 - v87) <= 1)
                  v119 = 1;
                else
                  v119 = v88 - v87;
                v120 = v87;
                do
                {
                  v121 = *v120++;
                  v122 = &retstr->var0[v121];
                  if (&v157[0][v118] != v122)
                    VisionCoreHomography::copyHomography(&v157[0][v118], v122, v117);
                  ++v118;
                  --v119;
                }
                while (v119);
              }
              if (buf.var0.var0)
              {
                buf.var0.var1 = buf.var0.var0;
                operator delete(buf.var0.var0);
              }
              buf.var0.var0 = (float *)v157;
              std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            }
            if (v158)
            {
              v159 = (char *)v158;
              operator delete(v158);
            }
            if (v87)
              operator delete(v87);
            if (v161)
            {
              v162 = v161;
              operator delete(v161);
            }
            if (v164)
            {
              v165 = v164;
              operator delete(v164);
            }
          }
          v123 = *(_DWORD **)a8;
          v124 = (_BYTE *)*((_QWORD *)a8 + 1);
          v61 = v140;
          v14 = v141;
          if (v124 != *(_BYTE **)a8)
          {
            v125 = 0;
            v126 = 0;
            v127 = 0;
            v128 = 0;
            v129 = 0;
            do
            {
              if (v123[v129] <= 0x7FFFFFFEu)
              {
                if ((unint64_t)v128 >= v127)
                {
                  v130 = (v128 - v125) >> 2;
                  v131 = v130 + 1;
                  if ((unint64_t)(v130 + 1) >> 62)
                    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                  if ((uint64_t)(v127 - (_QWORD)v125) >> 1 > v131)
                    v131 = (uint64_t)(v127 - (_QWORD)v125) >> 1;
                  if (v127 - (unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL)
                    v132 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v132 = v131;
                  if (v132)
                  {
                    v132 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v132);
                    v128 = (char *)v126;
                  }
                  else
                  {
                    v133 = 0;
                  }
                  v134 = (char *)(v132 + 4 * v130);
                  *(_DWORD *)v134 = v129;
                  v126 = (uint64_t)(v134 + 4);
                  while (v128 != v125)
                  {
                    v135 = *((_DWORD *)v128 - 1);
                    v128 -= 4;
                    *((_DWORD *)v134 - 1) = v135;
                    v134 -= 4;
                  }
                  v127 = v132 + 4 * v133;
                  if (v125)
                    operator delete(v125);
                  v125 = v134;
                }
                else
                {
                  *(_DWORD *)v128 = v129;
                  v126 = (uint64_t)(v128 + 4);
                }
                v123 = *(_DWORD **)a8;
                v124 = (_BYTE *)*((_QWORD *)a8 + 1);
                v128 = (char *)v126;
              }
              ++v129;
            }
            while (v129 < (v124 - (_BYTE *)v123) >> 2);
            v61 = v140;
            if (v124 != (_BYTE *)v123)
            {
              v136 = 0;
              v137 = 0;
              do
              {
                if ((v123[v137] | 0x80000000) == 0xFFFFFFFF)
                {
                  v153 = 0;
                  v154 = 0;
                  v155 = 0;
                  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v153, v125, v126, (v126 - (uint64_t)v125) >> 2);
                  v139 = objc_msgSend(v13, "findClosestQuadIndex:candidateIndices:", v137, &v153);
                  if (v153)
                  {
                    v154 = v153;
                    operator delete(v153);
                  }
                  if (v139 != -1 && v137 != v139)
                    VisionCoreHomography::copyHomography(&retstr->var0[v139], &retstr->var0[v136], v138);
                }
                ++v137;
                v123 = *(_DWORD **)a8;
                ++v136;
              }
              while (v137 < (uint64_t)(*((_QWORD *)a8 + 1) - *(_QWORD *)a8) >> 2);
            }
            v14 = v141;
            if (v125)
              operator delete(v125);
          }
        }
        else
        {
LABEL_55:
          if (v75 >= 1)
            bzero(*(void **)a8, 4 * (((unint64_t)v75 >> 2) - ((unint64_t)v75 > 3)) + 4);
          v79 = objc_msgSend(v13, "allSrcPoints");
          v80 = objc_msgSend(v13, "allDstPoints");
          v81 = objc_msgSend(v13, "quadPointCounts");
          LODWORD(v82) = v25;
          *(float *)&v83 = v22;
          objc_msgSend(a2, "recursiveRansacSrcPts:DstPts:QuadsMatchingKptsCount:resultingHomographies:groups:inlierRatio:ransacReprojErrorThreshold:", v79, v80, v81, retstr, a8, v82, v83);
        }
        _VisionCoreSignpostLog();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v84))
        {
          LOWORD(buf.var0.var0) = 0;
          _os_signpost_emit_with_name_impl(&dword_21DED3000, v84, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEstimateSceneHG", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
        }

      }
    }

  }
  return result;
}

+ (double)_convertToSIMDHomography:(uint64_t)a3
{
  return **(double **)(a3 + 48);
}

+ (BOOL)_point:(CGPoint)a3 inQuad:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "boundingBox");
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

+ (BOOL)_validateBuffer:(__CVBuffer *)a3
{
  char Width;
  char Height;
  OSType PixelFormatType;
  IOSurfaceRef IOSurface;
  BOOL v9;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (PixelFormatType != 1111970369 && PixelFormatType != 1380401729 && PixelFormatType != 1278226488)
    return 0;
  v9 = (Width & 1) == 0 && IOSurface != 0;
  return (Height & 1) == 0 && v9;
}

+ (unint64_t)_mtlPixelFormatForBuffer:(__CVBuffer *)a3
{
  if (CVPixelBufferGetPixelFormatType(a3) == 1278226488)
    return 10;
  else
    return 70;
}

+ (id)computeHomographiesForQuadrilaterals:(id)a3 inFrame:(__CVBuffer *)a4 session:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  VisionCoreSparseOpticalFlowQuad *v24;
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
  void *v41;
  VisionCoreSparseOpticalFlowQuad *v42;
  VisionCoreSparseOpticalFlowQuad *v43;
  void *v44;
  VisionCoreSparseOpticalFlowQuad *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  BOOL v49;
  size_t v50;
  size_t v51;
  double v52;
  _QWORD *v53;
  std::vector<int>::size_type v54;
  unint64_t j;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  int v60;
  NSObject *v61;
  _QWORD *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  unint64_t v66;
  double v67;
  double v68;
  double v69;
  NSObject *v70;
  uint64_t v71;
  unint64_t v72;
  _OWORD *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  VisionCoreWarpTransform *v78;
  __int128 v79;
  void *v80;
  double v81;
  VisionCoreWarpTransform *v82;
  NSObject *v83;
  NSObject *v84;
  id v86;
  void *v87;
  __CVBuffer *v88;
  id v89;
  id v91;
  void *v92;
  id v93;
  size_t Height;
  double v95;
  double v96;
  unsigned int v97;
  double v98;
  double v99;
  size_t Width;
  double v101;
  double v102;
  _OWORD v103[3];
  VisionCoreHomography v104;
  VisionCoreHomography v105;
  std::vector<int>::value_type __x[8];
  std::vector<int> buf;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t v112[8];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v91 = a3;
  v11 = a5;
  v89 = a6;
  v93 = a1;
  if ((objc_msgSend(a1, "_validateBuffer:", a4) & 1) != 0)
  {
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("VisionCoreOption_MinKptsFreqForQuads"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v12;
    if (v12)
      v13 = objc_msgSend(v12, "intValue");
    else
      v13 = 4;
    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v91, "count"));
    Width = CVPixelBufferGetWidth(a4);
    v88 = a4;
    Height = CVPixelBufferGetHeight(a4);
    v15 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v16 = objc_msgSend(v91, "count");
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    v18 = (void *)objc_msgSend(v15, "initWithCapacity:", v17);
    v97 = v13;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v19 = v91;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v109;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v109 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          v24 = [VisionCoreSparseOpticalFlowQuad alloc];
          objc_msgSend(v23, "topLeft");
          v26 = v25;
          v28 = v27;
          objc_msgSend(v23, "topRight");
          v30 = v29;
          v32 = v31;
          objc_msgSend(v23, "bottomRight");
          v34 = v33;
          v36 = v35;
          objc_msgSend(v23, "bottomLeft");
          v38 = v37;
          v40 = v39;
          objc_msgSend(v23, "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[VisionCoreSparseOpticalFlowQuad initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:](v24, "initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:", v41, objc_msgSend(v23, "homographyGroupID"), v26, v28, v30, v32, v34, v36, v38, v40);

          objc_msgSend(v18, "addObject:", v42);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
      }
      while (v20);
    }

    if (!objc_msgSend(v19, "count"))
    {
      v43 = [VisionCoreSparseOpticalFlowQuad alloc];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[VisionCoreSparseOpticalFlowQuad initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:](v43, "initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:", v44, (float)((float)Width * 0.25), (float)((float)Height * 0.75), (float)((float)Width * 0.75), (float)((float)Height * 0.75), (float)((float)Width * 0.75), (float)((float)Height * 0.25), (float)((float)Width * 0.25), (float)((float)Height * 0.25));

      objc_msgSend(v18, "addObject:", v45);
    }
    objc_msgSend(v11, "setTrackedQuads:", v18);
    _VisionCoreSignpostLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v46))
    {
      LOWORD(buf.__begin_) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v46, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointsEvent", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v93, "_gatherKeyPtsFromQuadsForSession:minGridFrequency:", v11, v97);
    _VisionCoreSignpostLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v47))
    {
      LOWORD(buf.__begin_) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointsEvent", (const char *)&unk_21DF063BD, (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v11, "texture");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48 == 0;

    if (v49
      || (v50 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v11, "prevFrame")),
          v51 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v11, "prevFrame")),
          v52 = (double)Width,
          (double)Width == (double)v50)
      && (v52 = (double)Height, (double)Height == (double)v51))
    {
      v53 = (_QWORD *)objc_msgSend(v11, "quadPointCounts");
      v54 = (uint64_t)(v53[1] - *v53) >> 3;
      __x[0] = -1;
      std::vector<int>::vector(&buf, v54, __x);
      for (j = 0; ; ++j)
      {
        objc_msgSend(v11, "trackedQuads");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count") > j;

        if (!v57)
          break;
        objc_msgSend(v11, "trackedQuads");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", j);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = objc_msgSend(v59, "homographyGroupID");
        buf.__begin_[j] = v60;

      }
      _VisionCoreSignpostLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v61))
      {
        LOWORD(__x[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_21DED3000, v61, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEvent", (const char *)&unk_21DF063BD, (uint8_t *)__x, 2u);
      }

      v62 = (_QWORD *)objc_msgSend(v11, "allSrcPoints");
      objc_msgSend(v93, "_runSparseOpticalFlowOnFrame:shouldRunCorr:forSession:error:groups:options:", v88, v62[1] - *v62 > 8uLL, v11, a7, &buf, v89);
      _VisionCoreSignpostLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v63))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_21DED3000, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEvent", (const char *)&unk_21DF063BD, v112, 2u);
      }

      objc_msgSend(v11, "setFrameCountSinceLastGrouping:", objc_msgSend(v11, "frameCountSinceLastGrouping") + 1);
      _VisionCoreSignpostLog();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v64))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_21DED3000, v64, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareResults", (const char *)&unk_21DF063BD, v112, 2u);
      }

      v86 = *a7;
      if (!*a7)
      {
        if (buf.__end_ == buf.__begin_)
        {
LABEL_42:
          LODWORD(v65) = 0;
        }
        else
        {
          v65 = 0;
          v66 = buf.__end_ - buf.__begin_;
          if (v66 <= 1)
            v66 = 1;
          while (buf.__begin_[v65])
          {
            if (v66 == ++v65)
              goto LABEL_42;
          }
        }
        VisionCoreHomography::VisionCoreHomography(&v105, (VisionCoreHomography *)(*(_QWORD *)__x + 136 * v65));
        objc_msgSend(v93, "_convertToSIMDHomography:", &v105);
        v98 = v68;
        v101 = v67;
        v95 = v69;
        VisionCoreHomography::~VisionCoreHomography(&v105);
        objc_msgSend(v11, "setSceneHomography:", v101, v98, v95);
        _VisionCoreSignpostLog();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v70))
        {
          *(_WORD *)v112 = 0;
          _os_signpost_emit_with_name_impl(&dword_21DED3000, v70, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareDebuggingResults", (const char *)&unk_21DF063BD, v112, 2u);
        }

        v71 = 0;
        v72 = 0;
        v73 = (_OWORD *)MEMORY[0x24BDBD8B8];
        while (v72 < objc_msgSend(v19, "count", v86, v87))
        {
          objc_msgSend(v19, "objectAtIndex:", v72);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          VisionCoreHomography::VisionCoreHomography(&v104, (VisionCoreHomography *)(*(_QWORD *)__x + v71));
          objc_msgSend(v93, "_convertToSIMDHomography:", &v104);
          v99 = v76;
          v102 = v75;
          v96 = v77;
          VisionCoreHomography::~VisionCoreHomography(&v104);
          v78 = [VisionCoreWarpTransform alloc];
          v79 = v73[1];
          v103[0] = *v73;
          v103[1] = v79;
          v103[2] = v73[2];
          objc_msgSend(v74, "UUID");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v81) = 0;
          v82 = -[VisionCoreWarpTransform initWithWarpTransform:affineTransform:UUID:reprojectionError:groupID:](v78, "initWithWarpTransform:affineTransform:UUID:reprojectionError:groupID:", v103, v80, buf.__begin_[v72], v102, v99, v96, v81);

          objc_msgSend(v92, "setObject:forKey:", v82, v74);
          ++v72;
          v71 += 136;
        }
        _VisionCoreSignpostLog();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v83))
        {
          *(_WORD *)v112 = 0;
          _os_signpost_emit_with_name_impl(&dword_21DED3000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareDebuggingResults", (const char *)&unk_21DF063BD, v112, 2u);
        }

      }
      _VisionCoreSignpostLog();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v84))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_21DED3000, v84, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareResults", (const char *)&unk_21DF063BD, v112, 2u);
      }

      if ((objc_msgSend(v93, "_updateSession:referenceFrame:error:", v11, v88, a7) & 1) != 0)
      {
        if (v86)
        {
          objc_msgSend(v11, "setSceneHomography:", *MEMORY[0x24BDAEDF8], *(double *)(MEMORY[0x24BDAEDF8] + 16), *(double *)(MEMORY[0x24BDAEDF8] + 32));
          v14 = (id)MEMORY[0x24BDBD1B8];
        }
        else
        {
          v14 = v92;
        }
      }
      else
      {
        objc_msgSend(v11, "setSceneHomography:", *MEMORY[0x24BDAEDF8], *(double *)(MEMORY[0x24BDAEDF8] + 16), *(double *)(MEMORY[0x24BDAEDF8] + 32));
        v14 = 0;
      }
      *(_QWORD *)v112 = __x;
      std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)v112);
      if (buf.__begin_)
      {
        buf.__end_ = buf.__begin_;
        operator delete(buf.__begin_);
      }
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", CFSTR("Frame buffer and reference frame dimensions do not match"), v52);
      v14 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", CFSTR("Invalid buffer - ensure IO surface backed, format is BGRA / RGBA / Luma, and even dimensions"));
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)sourceKptsForTransform:(VisionCoreHomography *)a3
{
  id v4;
  _DWORD *v5;
  unint64_t v6;
  VisionCoreSparseOpticalFlowResultPoint *v7;
  double v8;
  unint64_t v9;
  VisionCoreSparseOpticalFlowResultPoint *v10;
  _DWORD *v12;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  VisionCoreHomography::CalculateReprojectionError((VisionCoreHomography *)&v12, (uint64_t)a3);
  v5 = v12;
  if (a3->var0.var2 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = [VisionCoreSparseOpticalFlowResultPoint alloc];
      if (a3->var3.var1 <= v6)
        v9 = 0;
      else
        v9 = (*(unint64_t *)((char *)a3->var3.var0 + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1;
      LODWORD(v8) = v5[v6];
      v10 = -[VisionCoreSparseOpticalFlowResultPoint initWithX:Y:inlier:reprojError:](v7, "initWithX:Y:inlier:reprojError:", v9, a3->var0.var0[v6], a3->var0.var1[v6], v8);
      objc_msgSend(v4, "addObject:", v10);

      ++v6;
    }
    while ((uint64_t)v6 < a3->var0.var2);
    goto LABEL_9;
  }
  if (v12)
LABEL_9:
    operator delete(v5);
  return v4;
}

+ (id)destinationKptsForTransform:(VisionCoreHomography *)a3
{
  id v4;
  _DWORD *v5;
  unint64_t v6;
  VisionCoreSparseOpticalFlowResultPoint *v7;
  double v8;
  unint64_t v9;
  VisionCoreSparseOpticalFlowResultPoint *v10;
  _DWORD *v12;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  VisionCoreHomography::CalculateReprojectionError((VisionCoreHomography *)&v12, (uint64_t)a3);
  v5 = v12;
  if (a3->var1.var2 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = [VisionCoreSparseOpticalFlowResultPoint alloc];
      if (a3->var3.var1 <= v6)
        v9 = 0;
      else
        v9 = (*(unint64_t *)((char *)a3->var3.var0 + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1;
      LODWORD(v8) = v5[v6];
      v10 = -[VisionCoreSparseOpticalFlowResultPoint initWithX:Y:inlier:reprojError:](v7, "initWithX:Y:inlier:reprojError:", v9, a3->var1.var0[v6], a3->var1.var1[v6], v8);
      objc_msgSend(v4, "addObject:", v10);

      ++v6;
    }
    while ((uint64_t)v6 < a3->var1.var2);
    goto LABEL_9;
  }
  if (v12)
LABEL_9:
    operator delete(v5);
  return v4;
}

+ (id)updateSparseOpticalFlowResults:(id)a3 homography:(VisionCoreHomography *)a4
{
  id v5;
  VisionCoreSparseOpticalFlowResult *v6;
  void *v7;
  void *v8;
  void *v9;
  VisionCoreSparseOpticalFlowResult *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VisionCoreSparseOpticalFlowResult *v17;
  void *v18;
  VisionCoreSparseOpticalFlowResult *v19;
  VisionCoreHomography v21;
  VisionCoreHomography v22;

  v5 = a3;
  v6 = [VisionCoreSparseOpticalFlowResult alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreHomography::VisionCoreHomography(&v22, a4);
  +[VisionCoreSparseOpticalFlow sourceKptsForTransform:](VisionCoreSparseOpticalFlow, "sourceKptsForTransform:", &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreHomography::VisionCoreHomography(&v21, a4);
  +[VisionCoreSparseOpticalFlow destinationKptsForTransform:](VisionCoreSparseOpticalFlow, "destinationKptsForTransform:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VisionCoreSparseOpticalFlowResult initWithQuadUUID:srcKeypoints:dstKeypoints:](v6, "initWithQuadUUID:srcKeypoints:dstKeypoints:", v7, v8, v9);

  VisionCoreHomography::~VisionCoreHomography(&v21);
  VisionCoreHomography::~VisionCoreHomography(&v22);

  if (v5)
  {
    objc_msgSend(v5, "dstPts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreSparseOpticalFlowResult dstPts](v10, "dstPts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "srcPts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreSparseOpticalFlowResult srcPts](v10, "srcPts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = [VisionCoreSparseOpticalFlowResult alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[VisionCoreSparseOpticalFlowResult initWithQuadUUID:srcKeypoints:dstKeypoints:](v17, "initWithQuadUUID:srcKeypoints:dstKeypoints:", v18, v16, v13);

  }
  else
  {
    v19 = v10;
  }

  return v19;
}

+ (id)sparseOpticalFlowResultsFromHomography:(VisionCoreHomography *)a3
{
  VisionCoreSparseOpticalFlowResult *v4;
  void *v5;
  void *v6;
  void *v7;
  VisionCoreSparseOpticalFlowResult *v8;
  VisionCoreHomography v10;
  VisionCoreHomography v11;

  v4 = [VisionCoreSparseOpticalFlowResult alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreHomography::VisionCoreHomography(&v11, a3);
  +[VisionCoreSparseOpticalFlow sourceKptsForTransform:](VisionCoreSparseOpticalFlow, "sourceKptsForTransform:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreHomography::VisionCoreHomography(&v10, a3);
  +[VisionCoreSparseOpticalFlow destinationKptsForTransform:](VisionCoreSparseOpticalFlow, "destinationKptsForTransform:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VisionCoreSparseOpticalFlowResult initWithQuadUUID:srcKeypoints:dstKeypoints:](v4, "initWithQuadUUID:srcKeypoints:dstKeypoints:", v5, v6, v7);

  VisionCoreHomography::~VisionCoreHomography(&v10);
  VisionCoreHomography::~VisionCoreHomography(&v11);

  return v8;
}

@end
