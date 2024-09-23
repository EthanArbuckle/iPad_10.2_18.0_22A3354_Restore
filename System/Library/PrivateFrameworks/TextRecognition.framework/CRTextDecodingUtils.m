@implementation CRTextDecodingUtils

+ (id)halfWidthToFullWidthNormalizationForTextString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v3 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  v33 = 0;
  customHalfWidthToFullWidthMapping();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  v27 = 0;
  if ((unint64_t)objc_msgSend(v3, "length") >= 3)
  {
    customRegexToIgnoreHalfWidthToFullWidthMapping();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v23[5];
    v23[5] = v5;

  }
  v7 = objc_msgSend(v3, "length");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __70__CRTextDecodingUtils_halfWidthToFullWidthNormalizationForTextString___block_invoke;
  v17 = &unk_1E98DAAA8;
  v8 = v4;
  v18 = v8;
  v20 = &v22;
  v9 = v3;
  v19 = v9;
  v21 = &v28;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, &v14);
  v10 = (void *)v29[5];
  if (v10)
    v11 = (id)objc_msgSend(v10, "copy", v14, v15, v16, v17, v18);
  else
    v11 = v9;
  v12 = v11;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __70__CRTextDecodingUtils_halfWidthToFullWidthNormalizationForTextString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t i;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v26);

  if (v8)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_20;
    v9 = a3 <= 1 ? 1 : a3;
    v10 = v9 - 1;
    do
    {
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v10, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR(" "));
      if ((unint64_t)(v10 + 1) > 1)
        v14 = v13;
      else
        v14 = 0;

      --v10;
    }
    while ((v14 & 1) != 0);
    v15 = objc_msgSend(*(id *)(a1 + 40), "length");
    v16 = v15 - 1 >= (unint64_t)(objc_msgSend(v26, "length") + a3)
        ? objc_msgSend(v26, "length") + a3
        : objc_msgSend(*(id *)(a1 + 40), "length") - 1;
    for (i = v16 - v10; ; ++i)
    {
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v16, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "isEqualToString:", CFSTR(" ")))
        break;
      v19 = objc_msgSend(*(id *)(a1 + 40), "length") - 1;

      if (v16 >= v19)
        goto LABEL_19;
      ++v16;
    }

LABEL_19:
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "rangeOfFirstMatchInString:options:range:", *(_QWORD *)(a1 + 40), 0, v11, i) == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_20:
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v21 = v26;
      if (!v20)
      {
        v22 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

        v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v21 = v26;
      }
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "replaceCharactersInRange:withString:", a3, a4, v25);

    }
  }

}

+ (void)getBoundariesForRanges:(_QWORD *)a3 topPoints:(_QWORD *)a4 bottomPoints:(void *)a5 imageSize:(void *)a6 scale:(int)a7 featureImageSize:(int)a8 rect:(double)a9 rotatedRoi:(double)a10 radians:(float)a11 model:(double)a12 configuration:(double)a13 paddingLeft:(double)a14 paddingRight:(double)a15 rangeOffset:(double)a16
{
  id v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  float v35;
  float v36;
  uint64_t v37;
  float v38;
  float v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double *v49;
  double *v50;
  double *v51;
  double *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  double *v58;
  double *v59;
  double *v60;
  double *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  double *v67;
  double *v68;
  _QWORD *v69;
  _QWORD *v70;
  double v71;
  double *v72;
  double *v73;
  float v74;
  double v75;
  double v76;
  __float2 v77;
  double v78;
  double cosval;
  double sinval;
  double v81;
  double v82;
  double v83;
  double *v84;
  double *v85;
  double *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  double *v92;
  double *v93;
  double v94;
  double v95;
  double *v96;
  double *v97;
  double *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  double *v104;
  double *v105;
  double *v106;
  double *v107;
  double v108;
  double v109;
  double v110;
  double *v111;
  double *v112;
  double *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  double *v119;
  double *v120;
  double *v121;
  double v122;
  double *v123;
  double *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  double *v130;
  double *v131;
  void *v132;
  double *v133;
  double *v134;
  void *v135;
  void *v136;
  double *j;
  void *v138;
  _QWORD *v139;
  _QWORD *v140;
  void *v141;
  id v142;
  id v143;
  double v144;
  double v145;
  double v146;
  id obj;
  double *v150;
  double *v151;
  char *v152;
  void *v153;
  double *v154;
  char *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  void *__p;
  double *v161;
  double *v162;
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v142 = a2;
  v30 = a5;
  v143 = a6;
  v141 = v30;
  objc_opt_self();
  v31 = a24;
  __p = 0;
  v161 = 0;
  v162 = 0;
  v32 = *(double *)&a23 == 0.0;
  if (*(double *)&a24 == 0.0)
    v32 = 1;
  if (v32)
    v33 = a19;
  else
    v33 = a23;
  if (v32)
    v31 = a20;
  v145 = *(double *)&v31;
  objc_msgSend(v30, "outputWidthDownscale");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  v36 = v35;
  v139 = a3;
  v140 = a4;

  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  obj = v142;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
  if (v37)
  {
    v38 = *(double *)&v33;
    v39 = v36 / (a12 * a11 / v38);
    v40 = *(_QWORD *)v157;
    v41 = v39;
    v42 = MEMORY[0x1E0C9D538];
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v157 != v40)
          objc_enumerationMutation(obj);
        v44 = objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * i), "rangeValue", v139, v140, v141);
        v46 = *(_QWORD *)(v42 + 8);
        if (v45 == 0x7FFFFFFFFFFFFFFFLL)
          v47 = (float)(v39 * (float)(unint64_t)v44);
        else
          v47 = *(double *)&a26 + ((double)v44 + a28) * v41;
        if (v45 == 0x7FFFFFFFFFFFFFFFLL)
          v48 = (float)(v39 * (float)(unint64_t)v44);
        else
          v48 = *(double *)&a27 + ((double)(v44 + v45) + a28) * v41;
        v50 = v161;
        v49 = v162;
        if (v161 >= v162)
        {
          v52 = (double *)__p;
          v53 = ((char *)v161 - (_BYTE *)__p) >> 4;
          v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 60)
            goto LABEL_140;
          v55 = (char *)v162 - (_BYTE *)__p;
          if (((char *)v162 - (_BYTE *)__p) >> 3 > v54)
            v54 = v55 >> 3;
          if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
            v56 = 0xFFFFFFFFFFFFFFFLL;
          else
            v56 = v54;
          if (v56)
          {
            v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v162, v56);
            v52 = (double *)__p;
            v50 = v161;
          }
          else
          {
            v57 = 0;
          }
          v58 = (double *)&v57[16 * v53];
          *v58 = v47;
          *((_QWORD *)v58 + 1) = v46;
          v59 = v58;
          if (v50 != v52)
          {
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v50 - 1);
              v59 -= 2;
              v50 -= 2;
            }
            while (v50 != v52);
            v52 = (double *)__p;
          }
          v49 = (double *)&v57[16 * v56];
          v51 = v58 + 2;
          __p = v59;
          v161 = v58 + 2;
          v162 = v49;
          if (v52)
          {
            operator delete(v52);
            v49 = v162;
          }
        }
        else
        {
          *v161 = v47;
          *((_QWORD *)v50 + 1) = v46;
          v51 = v50 + 2;
        }
        v161 = v51;
        if (v51 >= v49)
        {
          v61 = (double *)__p;
          v62 = ((char *)v51 - (_BYTE *)__p) >> 4;
          v63 = v62 + 1;
          if ((unint64_t)(v62 + 1) >> 60)
LABEL_140:
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v64 = (char *)v49 - (_BYTE *)__p;
          if (v64 >> 3 > v63)
            v63 = v64 >> 3;
          if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF0)
            v65 = 0xFFFFFFFFFFFFFFFLL;
          else
            v65 = v63;
          if (v65)
          {
            v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v162, v65);
            v61 = (double *)__p;
            v51 = v161;
          }
          else
          {
            v66 = 0;
          }
          v67 = (double *)&v66[16 * v62];
          *v67 = v48;
          *((_QWORD *)v67 + 1) = v46;
          v68 = v67;
          if (v51 != v61)
          {
            do
            {
              *((_OWORD *)v68 - 1) = *((_OWORD *)v51 - 1);
              v68 -= 2;
              v51 -= 2;
            }
            while (v51 != v61);
            v61 = (double *)__p;
          }
          v60 = v67 + 2;
          __p = v68;
          v161 = v67 + 2;
          v162 = (double *)&v66[16 * v65];
          if (v61)
            operator delete(v61);
        }
        else
        {
          *v51 = v48;
          *((_QWORD *)v51 + 1) = v46;
          v60 = v51 + 2;
        }
        v161 = v60;
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
    }
    while (v37);
  }

  v70 = v139;
  v69 = v140;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  v150 = 0;
  v151 = 0;
  v152 = 0;
  objc_msgSend(v143, "angleThresholdForRotatedCrops");
  if (v71 >= fabsf(*(float *)&a25))
  {
    v106 = (double *)__p;
    v107 = v161;
    if (__p != v161)
    {
      v108 = *(double *)&a18 / a10;
      do
      {
        v109 = v106[1];
        v110 = (*(double *)&a17 + *v106) / a9;
        v111 = v154;
        if (v154 >= (double *)v155)
        {
          v113 = (double *)v153;
          v114 = ((char *)v154 - (_BYTE *)v153) >> 4;
          v115 = v114 + 1;
          if ((unint64_t)(v114 + 1) >> 60)
            goto LABEL_144;
          v116 = v155 - (_BYTE *)v153;
          if ((v155 - (_BYTE *)v153) >> 3 > v115)
            v115 = v116 >> 3;
          if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF0)
            v117 = 0xFFFFFFFFFFFFFFFLL;
          else
            v117 = v115;
          if (v117)
          {
            v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v155, v117);
            v113 = (double *)v153;
            v111 = v154;
          }
          else
          {
            v118 = 0;
          }
          v119 = (double *)&v118[16 * v114];
          *v119 = v110;
          v119[1] = v108;
          v120 = v119;
          if (v111 != v113)
          {
            do
            {
              *((_OWORD *)v120 - 1) = *((_OWORD *)v111 - 1);
              v120 -= 2;
              v111 -= 2;
            }
            while (v111 != v113);
            v113 = (double *)v153;
          }
          v112 = v119 + 2;
          v153 = v120;
          v154 = v119 + 2;
          v155 = &v118[16 * v117];
          if (v113)
            operator delete(v113);
        }
        else
        {
          *v154 = v110;
          v111[1] = v108;
          v112 = v111 + 2;
        }
        v154 = v112;
        v121 = v151;
        v122 = (*(double *)&a18 + *(double *)&a20 + v109) / a10;
        if (v151 >= (double *)v152)
        {
          v124 = v150;
          v125 = ((char *)v151 - (char *)v150) >> 4;
          v126 = v125 + 1;
          if ((unint64_t)(v125 + 1) >> 60)
LABEL_144:
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v127 = v152 - (char *)v150;
          if ((v152 - (char *)v150) >> 3 > v126)
            v126 = v127 >> 3;
          if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFF0)
            v128 = 0xFFFFFFFFFFFFFFFLL;
          else
            v128 = v126;
          if (v128)
          {
            v129 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v152, v128);
            v124 = v150;
            v121 = v151;
          }
          else
          {
            v129 = 0;
          }
          v130 = (double *)&v129[16 * v125];
          *v130 = v110;
          v130[1] = v122;
          v131 = v130;
          if (v121 != v124)
          {
            do
            {
              *((_OWORD *)v131 - 1) = *((_OWORD *)v121 - 1);
              v131 -= 2;
              v121 -= 2;
            }
            while (v121 != v124);
            v124 = v150;
          }
          v123 = v130 + 2;
          v150 = v131;
          v152 = &v129[16 * v128];
          if (v124)
            operator delete(v124);
        }
        else
        {
          *v151 = v110;
          v151[1] = v122;
          v123 = v151 + 2;
        }
        v151 = v123;
        v106 += 2;
      }
      while (v106 != v107);
    }
  }
  else
  {
    v72 = (double *)__p;
    v73 = v161;
    if (__p != v161)
    {
      v74 = v145;
      v75 = *(double *)&a19 * 0.5;
      v76 = *(double *)&a20 * 0.5;
      v77 = __sincosf_stret(*(float *)&a25);
      v78 = *(double *)&a22 + v74 - *(double *)&a20 * 0.5;
      cosval = v77.__cosval;
      sinval = v77.__sinval;
      v144 = v78 * v77.__cosval;
      v146 = -(v78 * v77.__sinval);
      do
      {
        v81 = *(double *)&a21 + *v72 - v75;
        v82 = (*(double *)&a17 + v75 + v81 * cosval - (*(double *)&a22 - *(double *)&a20 * 0.5) * v77.__sinval) / a9;
        v83 = (*(double *)&a18 + v76 + (*(double *)&a22 - *(double *)&a20 * 0.5) * v77.__cosval + v81 * sinval) / a10;
        v84 = v154;
        if (v154 >= (double *)v155)
        {
          v86 = (double *)v153;
          v87 = ((char *)v154 - (_BYTE *)v153) >> 4;
          v88 = v87 + 1;
          if ((unint64_t)(v87 + 1) >> 60)
            goto LABEL_143;
          v89 = v155 - (_BYTE *)v153;
          if ((v155 - (_BYTE *)v153) >> 3 > v88)
            v88 = v89 >> 3;
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0)
            v90 = 0xFFFFFFFFFFFFFFFLL;
          else
            v90 = v88;
          if (v90)
          {
            v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v155, v90);
            v86 = (double *)v153;
            v84 = v154;
          }
          else
          {
            v91 = 0;
          }
          v92 = (double *)&v91[16 * v87];
          *v92 = v82;
          v92[1] = v83;
          v93 = v92;
          if (v84 != v86)
          {
            do
            {
              *((_OWORD *)v93 - 1) = *((_OWORD *)v84 - 1);
              v93 -= 2;
              v84 -= 2;
            }
            while (v84 != v86);
            v86 = (double *)v153;
          }
          v85 = v92 + 2;
          v153 = v93;
          v154 = v92 + 2;
          v155 = &v91[16 * v90];
          if (v86)
            operator delete(v86);
        }
        else
        {
          *v154 = v82;
          v84[1] = v83;
          v85 = v84 + 2;
        }
        v94 = (*(double *)&a17 + v75 + v146 + v81 * cosval) / a9;
        v95 = (*(double *)&a18 + v76 + v144 + v81 * sinval) / a10;
        v154 = v85;
        v96 = v151;
        if (v151 >= (double *)v152)
        {
          v98 = v150;
          v99 = ((char *)v151 - (char *)v150) >> 4;
          v100 = v99 + 1;
          if ((unint64_t)(v99 + 1) >> 60)
LABEL_143:
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v101 = v152 - (char *)v150;
          if ((v152 - (char *)v150) >> 3 > v100)
            v100 = v101 >> 3;
          if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0)
            v102 = 0xFFFFFFFFFFFFFFFLL;
          else
            v102 = v100;
          if (v102)
          {
            v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v152, v102);
            v98 = v150;
            v96 = v151;
          }
          else
          {
            v103 = 0;
          }
          v104 = (double *)&v103[16 * v99];
          *v104 = v94;
          v104[1] = v95;
          v105 = v104;
          if (v96 != v98)
          {
            do
            {
              *((_OWORD *)v105 - 1) = *((_OWORD *)v96 - 1);
              v105 -= 2;
              v96 -= 2;
            }
            while (v96 != v98);
            v98 = v150;
          }
          v97 = v104 + 2;
          v150 = v105;
          v152 = &v103[16 * v102];
          if (v98)
            operator delete(v98);
        }
        else
        {
          *v151 = v94;
          v151[1] = v95;
          v97 = v151 + 2;
        }
        v151 = v97;
        v72 += 2;
      }
      while (v72 != v73);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v139, v140);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (double *)v153;
  v134 = v154;
  if (v153 != v154)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", *v133, v133[1]);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "addObject:", v135);

      v133 += 2;
    }
    while (v133 != v134);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = v150; j != v151; j += 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", *j, j[1]);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "addObject:", v138);

  }
  if (v70)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v132);
    *v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v69)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v136);
    *v69 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v150)
    operator delete(v150);
  if (v153)
  {
    v154 = (double *)v153;
    operator delete(v153);
  }
  if (__p)
  {
    v161 = (double *)__p;
    operator delete(__p);
  }

}

+ (void)getWordBoundariesForWhiteSpaceRanges:(float)a3 topPoints:(double)a4 bottomPoints:(double)a5 imageSize:(double)a6 scale:(uint64_t)a7 featureImageSize:(uint64_t)a8 rect:(void *)a9 rotatedRoi:(_QWORD *)a10 radians:(_QWORD *)a11 model:(void *)a12 configuration:(void *)a13 paddingLeft:(int)a14 paddingRight:(double)a15 rangeOffset:(double)a16
{
  LODWORD(a6) = a25;
  +[CRTextDecodingUtils getBoundariesForRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:]((int)CRTextDecodingUtils, a9, a10, a11, a12, a13, (int)a13, a14, a1, a2, a3, a4, a5, a6, *(double *)&a26, *(double *)&a24, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

+ (void)getCharacterBoundariesForActivationRanges:(float)a3 topPoints:(double)a4 bottomPoints:(double)a5 imageSize:(double)a6 scale:(uint64_t)a7 featureImageSize:(uint64_t)a8 rect:(void *)a9 rotatedRoi:(_QWORD *)a10 radians:(_QWORD *)a11 model:(void *)a12 configuration:(void *)a13 paddingLeft:(int)a14 paddingRight:(double)a15 rangeOffset:(double)a16
{
  LODWORD(a6) = a25;
  +[CRTextDecodingUtils getBoundariesForRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:]((int)CRTextDecodingUtils, a9, a10, a11, a12, a13, (int)a13, a14, a1, a2, a3, a4, a5, a6, *(double *)&a26, *(double *)&a24, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

+ (BOOL)validateProbability:(id)a3 precisionThreshold:(double)a4 withLM:(BOOL)a5
{
  double v6;

  objc_msgSend(a3, "doubleValue");
  return v6 >= a4 + 0.0;
}

+ (id)tokenSequenceStringForTokens:(id)a3 usingCharacterTokens:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v4
          && (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "fullString"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "isEqualToString:", CFSTR(" ")),
              v12,
              v13))
        {
          objc_msgSend(v6, "appendString:", CFSTR("\uFFFC"));
        }
        else
        {
          objc_msgSend(v11, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v14);

        }
        objc_msgSend(v6, "appendString:", CFSTR(" "));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)tokenDelimiterRangesForTokens:(id)a3 usingCharacterTokens:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v43 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v40, "count") + 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "activationRange");

    objc_msgSend(v40, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activationRange");
    v38 = v8;
    v39 = v7;

    objc_msgSend(v40, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "activationRange");
    v36 = v11;
    v37 = v10;

    if (v5)
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, v5);
    else
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v12);

    if ((unint64_t)objc_msgSend(v40, "count") >= 2)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v14 = v40;
      v42 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v42)
      {
        v15 = 0;
        v41 = *(_QWORD *)v46;
LABEL_9:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v46 != v41)
            objc_enumerationMutation(v14);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
          if (v15 + v16 == objc_msgSend(v14, "count") - 1)
            break;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v15 + v16 + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "activationRange");
          v21 = v20;
          v22 = objc_msgSend(v18, "activationRange");
          v23 = v19 + v21;
          if (v22 - v23 <= (unint64_t)!v43)
            v24 = !v43;
          else
            v24 = v22 - v23;
          if (v43)
          {
            objc_msgSend(v17, "fullString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", CFSTR(" "));

            if (v26)
              v23 = v19 + 1;
            objc_msgSend(v18, "fullString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR(" "));

            if (v28)
              v24 = 1;
          }
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v23, v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v29);

          if (v42 == ++v16)
          {
            v15 += v16;
            v42 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v42)
              goto LABEL_9;
            break;
          }
        }
      }

    }
    if (v39 + v38 == v37 + v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v39 + v38, 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_msgSend(v40, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "activationRange");
      v34 = v33;

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v39 + v38, v34 - (v39 + v38) + v32);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v44);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

+ (id)wordTokensFromCharacterTokens:(id)a3
{
  void *v3;
  void *v4;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger length;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  NSUInteger v15;
  NSRange v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  NSRange v44;
  NSRange v45;

  v43 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    location = objc_msgSend(v4, "activationRange");
    length = v6;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v35;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v8)
    {
      v9 = 0;
      v10 = *(_QWORD *)v39;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v45.location = objc_msgSend(v14, "activationRange");
          v45.length = v15;
          v44.location = location;
          v44.length = length;
          v16 = NSUnionRange(v44, v45);
          location = v16.location;
          length = v16.length;
          objc_msgSend(v14, "fullString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR(" "));

          if ((v18 & 1) != 0)
            goto LABEL_9;
          objc_msgSend(v14, "string");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v19);

          objc_msgSend(v14, "alignmentScore");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          objc_msgSend(v14, "score");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;

          objc_msgSend(obj, "lastObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v23) = v14 == v26;

          ++v9;
          v12 = v12 + v22;
          v11 = v11 + v25;
          if ((_DWORD)v23)
          {
LABEL_9:
            if (v9)
              v27 = v11 / (double)v9;
            else
              v27 = 0.0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
              v29 = v12 / (double)v9;
            else
              v29 = 0.0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_alloc(MEMORY[0x1E0D09B08]);
            v32 = (void *)objc_msgSend(v3, "copy");
            v33 = (void *)objc_msgSend(v31, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v32, v28, v30, v16.location, v16.length, &stru_1E98DC948);

            objc_msgSend(v36, "addObject:", v33);
            objc_msgSend(v3, "setString:", &stru_1E98DC948);

            v9 = 0;
            location = v16.location + v16.length;
            v11 = 0.0;
            v12 = 0.0;
            length = 0;
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v8);
    }

  }
  else
  {
    v36 = (id)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

+ (id)graphemeClusterTokensFromTokens:(id)a3
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  char v15;
  NSString *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  double v20;
  NSString *v21;
  uint64_t v22;
  void *v23;
  NSUInteger v24;
  NSRange v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSUInteger v39;
  NSRange v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v53;
  id obj;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSUInteger length;
  NSUInteger location;
  NSString *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  NSRange v67;
  NSRange v68;
  NSRange v69;
  NSRange v70;

  v66 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  if (!objc_msgSend(v53, "count"))
  {
    v55 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v60 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activationRange");
  length = v5;
  location = v4;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v53;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  v7 = 0;
  if (!v6)
  {
    v8 = 0.0;
    v9 = 0.0;
    goto LABEL_29;
  }
  v56 = *(_QWORD *)v62;
  v8 = 0.0;
  v9 = 0.0;
  do
  {
    v57 = v6;
    for (i = 0; i != v57; ++i)
    {
      if (*(_QWORD *)v62 != v56)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      objc_msgSend(v11, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingString:](v60, "stringByAppendingString:", v12);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "fullString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR(" "));

      objc_msgSend(v11, "string");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = characterCount(v16);

      if (-[NSString length](v60, "length"))
      {
        v18 = characterCount(v13);
        if (v18 >= characterCount(v60) + v17)
          v19 = 1;
        else
          v19 = v15;
        if ((v19 & 1) == 0)
        {
LABEL_15:
          objc_msgSend(v11, "string");
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          v22 = characterCount(v21);

          objc_msgSend(v11, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString appendString:](v60, "appendString:", v23);

          v69.location = objc_msgSend(v11, "activationRange");
          v69.length = v24;
          v67.length = length;
          v67.location = location;
          v25 = NSUnionRange(v67, v69);
          length = v25.length;
          location = v25.location;
          objc_msgSend(v11, "alignmentScore");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;

          objc_msgSend(v11, "score");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          v7 += v22;
          v9 = v9 + v28;
          v8 = v8 + v30;
          goto LABEL_24;
        }
      }
      else if ((v15 & 1) == 0)
      {
        goto LABEL_15;
      }
      if (v7)
        v20 = v8 / (double)v7;
      else
        v20 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v31 = v9 / (double)v7;
      else
        v31 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc(MEMORY[0x1E0D09B08]);
      v34 = (void *)-[NSString copy](v60, "copy");
      v35 = (void *)objc_msgSend(v33, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v34, v29, v32, location, length, &stru_1E98DC948);

      objc_msgSend(v55, "addObject:", v35);
      if ((v15 & 1) != 0)
      {
        objc_msgSend(v55, "addObject:", v11);
        -[NSString setString:](v60, "setString:", &stru_1E98DC948);
        v36 = objc_msgSend(v11, "activationRange");
        v7 = 0;
        length = 0;
        location = v36 + v37;
        v8 = 0.0;
        v9 = 0.0;
      }
      else
      {
        objc_msgSend(v11, "string");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString setString:](v60, "setString:", v38);

        v70.location = objc_msgSend(v11, "activationRange");
        v70.length = v39;
        v68.location = location + length;
        v68.length = 0;
        v40 = NSUnionRange(v68, v70);
        length = v40.length;
        location = v40.location;
        objc_msgSend(v11, "alignmentScore");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "doubleValue");
        v9 = v42;

        objc_msgSend(v11, "score");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "doubleValue");
        v8 = v44;

        v7 = v17;
      }

LABEL_24:
    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  }
  while (v6);
LABEL_29:

  if (-[NSString length](v60, "length"))
  {
    if (v7)
      v45 = v8 / (double)v7;
    else
      v45 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v47 = v9 / (double)v7;
    else
      v47 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_alloc(MEMORY[0x1E0D09B08]);
    v50 = (void *)-[NSString copy](v60, "copy");
    v51 = (void *)objc_msgSend(v49, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v50, v46, v48, location, length, &stru_1E98DC948);

    objc_msgSend(v55, "addObject:", v51);
  }

LABEL_38:
  return v55;
}

+ (id)characterRangesForTokens:(id)a3 fromActivation:(id)a4 usingCharacterTokens:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  BOOL v22;
  void *v23;
  double v24;
  __CFString *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  unint64_t i;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSString *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8 && v9)
  {
    v11 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characterObservations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "blankIndex"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0;
    v40 = !v5;
    v42 = v7;
    v49 = v8;
    while (v45 < objc_msgSend(v7, "count", v40))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "activationRange");
      v16 = v15;

      objc_msgSend(v7, "objectAtIndexedSubscript:", v45);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fullString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v46);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", &stru_1E98DC948);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();

      v43 = characterCount(v20);
      v44 = v20;
      objc_msgSend(*(id *)(v11 + 3560), "array");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v11 + 3560), "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 < v14 + v16)
      {
        v22 = 0;
        v23 = 0;
        v47 = -1;
        v24 = -1.79769313e308;
        v25 = &stru_1E98DC948;
        while (1)
        {
          v26 = v23;
          v51 = 0.0;
          objc_msgSend(v49, "topCandidateForTimestep:outputLogProbability:", v14, &v51);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (objc_msgSend(v23, "isEqualToString:", v48) & 1) != 0
             || objc_msgSend(v23, "rangeOfCharacterFromSet:", v46) != 0x7FFFFFFFFFFFFFFFLL;
          if (((v27 | objc_msgSend(v23, "isEqualToString:", v26)) & 1) == 0)
          {
            v28 = -[__CFString length](v25, "length");
            -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", v23);
            v29 = objc_claimAutoreleasedReturnValue();
            v22 = v28 == 0;

            v25 = (__CFString *)v29;
          }
          if (characterCount(&v25->isa) != 1)
            break;
          if (!v27)
          {
            if (!v22)
            {
              v22 = 0;
              goto LABEL_23;
            }
            v22 = 1;
            if (v51 > v24)
            {
              v24 = v51;
LABEL_21:
              v47 = v14;
            }
          }
LABEL_23:

          ++v14;
          if (!--v16)
            goto LABEL_26;
        }
        if (-[__CFString length](v25, "length"))
        {

          v25 = &stru_1E98DC948;
        }
        if (v27)
          goto LABEL_23;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v30);

        v24 = v51;
        v31 = v23;

        v22 = 1;
        v25 = v31;
        goto LABEL_21;
      }
      v23 = 0;
      v47 = -1;
      v25 = &stru_1E98DC948;
LABEL_26:
      if (-[__CFString length](v25, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v32);

      }
      v33 = objc_msgSend(v21, "count");
      if (v33 == v43)
      {
        for (i = v40; i < objc_msgSend(v21, "count"); ++i)
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", i);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "integerValue");

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v36, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v37);

        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v50);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v38);

      }
      ++v45;
      v7 = v42;
      v8 = v49;
      v11 = 0x1E0C99000;
      if (v33 != v43)
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_36;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v41);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

  }
  return v10;
}

+ (id)reversedTokens:(id)a3 numTimeSteps:(unint64_t)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v25, "count") - 1;
  if (v4 >= 0)
  {
    do
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "activationRange");
      v8 = v7;

      v9 = objc_alloc(MEMORY[0x1E0D09B08]);
      objc_msgSend(v25, "objectAtIndexedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "score");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alignmentScore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v4 - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "terminatingCharacter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v23;
      }
      else
      {
        v16 = 0;
      }
      v17 = (void *)objc_msgSend(v9, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v11, v13, v15, a4 - (v6 + v8), v8, v16);
      if (v4)
      {

      }
      objc_msgSend(v22, "addObject:", v17);

    }
    while (v4-- > 0);
  }
  v19 = (void *)objc_msgSend(v22, "copy");

  return v19;
}

+ (id)getTokenPermutationByApplyingReorderingPermutation:(id)a3 toRanges:(id)a4
{
  id v5;
  id v6;
  unint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *__p;
  uint64_t *v25;
  void *v26;
  _BYTE *v27;
  void **v28;

  v5 = a3;
  v6 = a4;
  std::vector<unsigned long>::vector(&v26, objc_msgSend(v6, "count"));
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeValue");

    objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    *((_QWORD *)v26 + i) = v11;
  }
  std::vector<unsigned long>::vector(&__p, (v27 - (_BYTE *)v26) >> 3);
  v12 = (uint64_t *)__p;
  v13 = v25;
  if (__p != v25)
  {
    v14 = 0;
    v15 = (uint64_t *)__p;
    do
      *v15++ = v14++;
    while (v15 != v13);
  }
  v16 = 126 - 2 * __clz(v13 - v12);
  v28 = &v26;
  if (v13 == v12)
    v17 = 0;
  else
    v17 = v16;
  std::__introsort<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *,false>(v12, v13, (uint64_t **)&v28, v17, 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t *)__p;
  v20 = v25;
  if (__p != v25)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v21);

      ++v19;
    }
    while (v19 != v20);
  }
  v22 = (void *)objc_msgSend(v18, "copy");

  if (__p)
  {
    v25 = (uint64_t *)__p;
    operator delete(__p);
  }
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }

  return v22;
}

+ (id)invertedPermutation:(id)a3
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v3, "count"); ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j < objc_msgSend(v3, "count"); ++j)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", j);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

+ (id)reversedPermutation:(id)a3 numTimeSteps:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 - 1 >= 0)
  {
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", --v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = ~objc_msgSend(v8, "unsignedIntegerValue") + a4;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

    }
    while (v7 > 0);
  }
  objc_msgSend(v6, "reverseObjectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __87__CRTextDecodingUtils__tokenFilterPredicateFalsePositiveFiltering_keepWhitespaceToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 48)
    && (objc_msgSend(v5, "fullString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR(" ")),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "fullString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "length");
    v13 = v12;
    if (*(_BYTE *)(a1 + 49))
    {
      if (v12)
      {
        objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", &stru_1E98DC948);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        v9 = (double)v16 / (double)v13 > 0.5;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = v12 != 0;
    }

  }
  return v9;
}

+ (id)filteredTokensFromTokens:(id)a3 falsePositiveFiltering:(BOOL)a4 keepWhitespaceToken:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v7 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "_crUnknownScriptCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3880];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__CRTextDecodingUtils__tokenFilterPredicateFalsePositiveFiltering_keepWhitespaceToken___block_invoke;
  v16[3] = &unk_1E98DAAD0;
  v19 = a5;
  v11 = v8;
  v20 = a4;
  v17 = v11;
  v18 = v9;
  v12 = v9;
  objc_msgSend(v10, "predicateWithBlock:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)getTokenPermutationByApplyingReorderingPermutation:(uint64_t *)a3 toRanges:(uint64_t)a4
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  int64_t v65;
  uint64_t *v66;
  int64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v9 = result;
LABEL_2:
  v10 = v9;
  while (2)
  {
    v9 = v10;
    v11 = (char *)a2 - (char *)v10;
    v12 = a2 - v10;
    switch(v12)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v44 = *(a2 - 1);
        v45 = *v10;
        if (*(_QWORD *)(**a3 + 8 * v44) < *(_QWORD *)(**a3 + 8 * *v10))
        {
          *v10 = v44;
          *(a2 - 1) = v45;
        }
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v10, v10 + 1, a2 - 1, **a3);
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v10, v10 + 1, v10 + 2, a2 - 1, a3);
      case 5:
        v46 = v10 + 1;
        v47 = v10 + 2;
        v48 = v10 + 3;
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v10, v10 + 1, v10 + 2, v10 + 3, a3);
        v49 = *(a2 - 1);
        v50 = v10[3];
        v51 = **a3;
        if (*(_QWORD *)(v51 + 8 * v49) < *(_QWORD *)(v51 + 8 * v50))
        {
          *v48 = v49;
          *(a2 - 1) = v50;
          v52 = *v48;
          v53 = *v47;
          if (*(_QWORD *)(v51 + 8 * *v48) < *(_QWORD *)(v51 + 8 * *v47))
          {
            *v47 = v52;
            *v48 = v53;
            v54 = *v46;
            if (*(_QWORD *)(v51 + 8 * v52) < *(_QWORD *)(v51 + 8 * *v46))
            {
              v10[1] = v52;
              v10[2] = v54;
              v55 = *v10;
              if (*(_QWORD *)(v51 + 8 * v52) < *(_QWORD *)(v51 + 8 * *v10))
              {
                *v10 = v52;
                v10[1] = v55;
              }
            }
          }
        }
        return result;
      default:
        if (v11 <= 191)
        {
          if ((a5 & 1) != 0)
          {
            if (v10 != a2)
            {
              v56 = v10 + 1;
              if (v10 + 1 != a2)
              {
                v57 = **a3;
                v58 = 8;
                v59 = v10;
                do
                {
                  v61 = *v59;
                  v60 = v59[1];
                  v59 = v56;
                  if (*(_QWORD *)(v57 + 8 * v60) < *(_QWORD *)(v57 + 8 * v61))
                  {
                    v62 = v58;
                    while (1)
                    {
                      *(uint64_t *)((char *)v10 + v62) = v61;
                      v63 = v62 - 8;
                      if (v62 == 8)
                        break;
                      v61 = *(uint64_t *)((char *)v10 + v62 - 16);
                      v62 -= 8;
                      if (*(_QWORD *)(v57 + 8 * v60) >= *(_QWORD *)(v57 + 8 * v61))
                      {
                        v64 = (uint64_t *)((char *)v10 + v63);
                        goto LABEL_75;
                      }
                    }
                    v64 = v10;
LABEL_75:
                    *v64 = v60;
                  }
                  v56 = v59 + 1;
                  v58 += 8;
                }
                while (v59 + 1 != a2);
              }
            }
          }
          else if (v10 != a2)
          {
            v96 = v10 + 1;
            if (v10 + 1 != a2)
            {
              v97 = **a3;
              do
              {
                v99 = *v9;
                v98 = v9[1];
                v9 = v96;
                if (*(_QWORD *)(v97 + 8 * v98) < *(_QWORD *)(v97 + 8 * v99))
                {
                  do
                  {
                    *v96 = v99;
                    v99 = *(v96 - 2);
                    --v96;
                  }
                  while (*(_QWORD *)(v97 + 8 * v98) < *(_QWORD *)(v97 + 8 * v99));
                  *v96 = v98;
                }
                v96 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
          }
          return result;
        }
        if (!a4)
        {
          if (v10 != a2)
          {
            v65 = (unint64_t)(v12 - 2) >> 1;
            v66 = *a3;
            v67 = v65;
            do
            {
              v68 = v67;
              if (v65 >= v67)
              {
                v69 = (2 * v67) | 1;
                v70 = &v10[v69];
                v71 = *v70;
                if (2 * v68 + 2 >= v12)
                {
                  v72 = *v66;
                }
                else
                {
                  v72 = *v66;
                  if (*(_QWORD *)(*v66 + 8 * v71) < *(_QWORD *)(*v66 + 8 * v70[1]))
                  {
                    v71 = v70[1];
                    ++v70;
                    v69 = 2 * v68 + 2;
                  }
                }
                v73 = &v10[v68];
                v74 = *v73;
                result = *(uint64_t **)(v72 + 8 * v71);
                if ((unint64_t)result >= *(_QWORD *)(v72 + 8 * *v73))
                {
                  do
                  {
                    result = v70;
                    *v73 = v71;
                    if (v65 < v69)
                      break;
                    v75 = (2 * v69) | 1;
                    v70 = &v10[v75];
                    v76 = 2 * v69 + 2;
                    v71 = *v70;
                    if (v76 < v12 && *(_QWORD *)(v72 + 8 * v71) < *(_QWORD *)(v72 + 8 * v70[1]))
                    {
                      v71 = v70[1];
                      ++v70;
                      v75 = v76;
                    }
                    v73 = result;
                    v69 = v75;
                  }
                  while (*(_QWORD *)(v72 + 8 * v71) >= *(_QWORD *)(v72 + 8 * v74));
                  *result = v74;
                }
              }
              v67 = v68 - 1;
            }
            while (v68);
            v77 = (unint64_t)v11 >> 3;
            do
            {
              v78 = 0;
              v79 = *v10;
              v80 = *a3;
              v81 = v10;
              do
              {
                v82 = &v81[v78];
                v85 = v82[1];
                v83 = v82 + 1;
                v84 = v85;
                v86 = (2 * v78) | 1;
                v87 = 2 * v78 + 2;
                if (v87 < v77)
                {
                  result = (uint64_t *)v83[1];
                  if (*(_QWORD *)(*v80 + 8 * v84) < *(_QWORD *)(*v80 + 8 * (_QWORD)result))
                  {
                    v84 = v83[1];
                    ++v83;
                    v86 = v87;
                  }
                }
                *v81 = v84;
                v81 = v83;
                v78 = v86;
              }
              while (v86 <= (uint64_t)((unint64_t)(v77 - 2) >> 1));
              if (v83 == --a2)
              {
                *v83 = v79;
              }
              else
              {
                *v83 = *a2;
                *a2 = v79;
                v88 = (char *)v83 - (char *)v10 + 8;
                if (v88 >= 9)
                {
                  v89 = (((unint64_t)v88 >> 3) - 2) >> 1;
                  v90 = &v10[v89];
                  v91 = *v90;
                  v92 = *v83;
                  v93 = *v80;
                  if (*(_QWORD *)(v93 + 8 * *v90) < *(_QWORD *)(v93 + 8 * *v83))
                  {
                    do
                    {
                      v94 = v90;
                      *v83 = v91;
                      if (!v89)
                        break;
                      v89 = (v89 - 1) >> 1;
                      v90 = &v10[v89];
                      v91 = *v90;
                      v83 = v94;
                    }
                    while (*(_QWORD *)(v93 + 8 * *v90) < *(_QWORD *)(v93 + 8 * v92));
                    *v94 = v92;
                  }
                }
              }
            }
            while (v77-- > 2);
          }
          return result;
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = &v10[(unint64_t)v12 >> 1];
        v15 = **a3;
        if ((unint64_t)v11 < 0x401)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v14, v9, a2 - 1, v15);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v9, v14, a2 - 1, v15);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v9 + 1, v14 - 1, a2 - 2, **a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v9 + 2, &v9[v13 + 1], a2 - 3, **a3);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v14 - 1, v14, &v9[v13 + 1], **a3);
          v16 = *v9;
          *v9 = *v14;
          *v14 = v16;
        }
        --a4;
        v17 = *v9;
        v18 = **a3;
        if ((a5 & 1) == 0)
        {
          v19 = *(_QWORD *)(v18 + 8 * v17);
          if (*(_QWORD *)(v18 + 8 * *(v9 - 1)) < v19)
            goto LABEL_12;
          if (v19 >= *(_QWORD *)(v18 + 8 * *(a2 - 1)))
          {
            v35 = v9 + 1;
            do
            {
              v10 = v35;
              if (v35 >= a2)
                break;
              ++v35;
            }
            while (v19 >= *(_QWORD *)(v18 + 8 * *v10));
          }
          else
          {
            v10 = v9;
            do
            {
              v34 = v10[1];
              ++v10;
            }
            while (v19 >= *(_QWORD *)(v18 + 8 * v34));
          }
          v36 = a2;
          if (v10 < a2)
          {
            v36 = a2;
            do
              v37 = *--v36;
            while (v19 < *(_QWORD *)(v18 + 8 * v37));
          }
          if (v10 < v36)
          {
            v38 = *v10;
            v39 = *v36;
            do
            {
              *v10 = v39;
              *v36 = v38;
              v40 = *(_QWORD *)(v18 + 8 * v17);
              do
              {
                v41 = v10[1];
                ++v10;
                v38 = v41;
              }
              while (v40 >= *(_QWORD *)(v18 + 8 * v41));
              do
              {
                v42 = *--v36;
                v39 = v42;
              }
              while (v40 < *(_QWORD *)(v18 + 8 * v42));
            }
            while (v10 < v36);
          }
          v43 = v10 - 1;
          if (v10 - 1 != v9)
            *v9 = *v43;
          a5 = 0;
          *v43 = v17;
          continue;
        }
        v19 = *(_QWORD *)(v18 + 8 * v17);
LABEL_12:
        v20 = 0;
        do
          v21 = v9[++v20];
        while (*(_QWORD *)(v18 + 8 * v21) < v19);
        v22 = &v9[v20];
        v23 = a2;
        if (v20 == 1)
        {
          v23 = a2;
          do
          {
            if (v22 >= v23)
              break;
            v25 = *--v23;
          }
          while (*(_QWORD *)(v18 + 8 * v25) >= v19);
        }
        else
        {
          do
            v24 = *--v23;
          while (*(_QWORD *)(v18 + 8 * v24) >= v19);
        }
        if (v22 >= v23)
        {
          v32 = v22 - 1;
        }
        else
        {
          v26 = *v23;
          v27 = &v9[v20];
          v28 = v23;
          do
          {
            *v27 = v26;
            *v28 = v21;
            v29 = *(_QWORD *)(v18 + 8 * v17);
            do
            {
              v30 = v27[1];
              ++v27;
              v21 = v30;
            }
            while (*(_QWORD *)(v18 + 8 * v30) < v29);
            do
            {
              v31 = *--v28;
              v26 = v31;
            }
            while (*(_QWORD *)(v18 + 8 * v31) >= v29);
          }
          while (v27 < v28);
          v32 = v27 - 1;
        }
        if (v32 != v9)
          *v9 = *v32;
        *v32 = v17;
        if (v22 < v23)
        {
LABEL_33:
          result = (uint64_t *)std::__introsort<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *,false>(v9, v32, a3, a4, a5 & 1);
          a5 = 0;
          v10 = v32 + 1;
          continue;
        }
        v33 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v9, v32, a3);
        v10 = v32 + 1;
        result = (uint64_t *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v32 + 1, a2, a3);
        if (!(_DWORD)result)
        {
          if (v33)
            continue;
          goto LABEL_33;
        }
        a2 = v32;
        if (!v33)
          goto LABEL_2;
        return result;
    }
  }
}

@end
