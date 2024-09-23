@implementation CRWrappingClassifierFeatureExtractor

+ (void)_extractBagOfTokensFeaturesTo:(void *)a3 vocabulary:(id)a4 tokens:(id)a5 beginIndex:(int64_t)a6 endIndex:(int64_t)a7
{
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t i;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  unsigned int v44;
  double *v45;
  char *v46;
  unsigned int v47;
  double *v48;
  double v49;
  double *v50;
  double *v51;
  double *v52;
  uint64_t v53;
  int v54;
  double v55;
  int v56;
  double *v57;
  double *v58;
  uint64_t v59;
  double *v60;
  double v61;
  double *v62;
  double *v63;
  uint64_t v64;
  char *v65;
  double *v66;
  int64_t v67;
  void *v68;
  _QWORD *v69;
  int64_t v70;
  void *__p;
  uint64_t v72;

  v11 = a4;
  v12 = a5;
  std::vector<BOOL>::vector(&__p, objc_msgSend(v11, "count"));
  v69 = a3;
  v13 = objc_msgSend(v12, "count");
  v14 = a6 & ~(a6 >> 63);
  if (v13 >= a7)
    v15 = a7;
  else
    v15 = v13;
  v70 = v15;
  if (v14 < v15)
  {
    do
    {
      for (i = 0; i < objc_msgSend(v11, "count"); ++i)
      {
        v17 = i >> 6;
        v18 = 1 << i;
        v19 = *((_QWORD *)__p + (i >> 6));
        if ((v19 & (1 << i)) != 0)
        {
          *((_QWORD *)__p + v17) = v19 | v18;
        }
        else
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", i);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lowercaseString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", v22) & 1) != 0)
            v23 = *((_QWORD *)__p + v17) | v18;
          else
            v23 = *((_QWORD *)__p + v17) & ~v18;
          *((_QWORD *)__p + v17) = v23;

        }
      }
      ++v14;
    }
    while (v14 != v70);
  }
  v24 = v72;
  if (v72 >= 1)
  {
    v25 = (char *)__p;
    v26 = v69;
    v27 = v69[1];
    v28 = v27 - *v69;
    v29 = (double *)(*v69 + (v28 & 0xFFFFFFFFFFFFFFF8));
    v30 = v69[2];
    if (v72 > (uint64_t)(v30 - v27) >> 3)
    {
      v31 = v28 >> 3;
      v32 = (v28 >> 3) + v72;
      if (v32 >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v33 = v30 - *v69;
      if (v33 >> 2 > v32)
        v32 = v33 >> 2;
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
        v34 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v34 = v32;
      if (v34)
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v69 + 2), v34);
      else
        v35 = 0;
      v56 = 0;
      v57 = (double *)&v35[8 * v31];
      v58 = &v57[v24];
      v59 = 8 * v24;
      v60 = v57;
      do
      {
        if (((*(_QWORD *)v25 >> v56) & 1) != 0)
          v61 = 1.0;
        else
          v61 = 0.0;
        *v60++ = v61;
        v25 += 8 * (v56 == 63);
        if (v56 == 63)
          v56 = 0;
        else
          ++v56;
        v59 -= 8;
      }
      while (v59);
      v62 = (double *)*v69;
      if ((double *)*v69 != v29)
      {
        v63 = v29;
        do
        {
          v64 = *((_QWORD *)v63-- - 1);
          *((_QWORD *)v57-- - 1) = v64;
        }
        while (v63 != v62);
      }
      v65 = &v35[8 * v34];
      v66 = (double *)v69[1];
      v67 = (char *)v66 - (char *)v29;
      if (v66 != v29)
        memmove(v58, v29, (char *)v66 - (char *)v29);
      v68 = (void *)*v69;
      *v69 = v57;
      v69[1] = (char *)v58 + v67;
      v69[2] = v65;
      if (v68)
        operator delete(v68);
      goto LABEL_77;
    }
    v36 = (char *)__p + 8 * ((unint64_t)v72 >> 6);
    v37 = v72 & 0x3F;
    v38 = v27 - (_QWORD)v29;
    v39 = (uint64_t)(v27 - (_QWORD)v29) >> 3;
    if (v39 >= v72)
    {
      v45 = (double *)v69[1];
      v44 = v72 & 0x3F;
      v43 = (char *)__p + 8 * ((unint64_t)v72 >> 6);
      goto LABEL_44;
    }
    v40 = v39 - 63;
    if (v39 < 63)
      v40 = (uint64_t)(v27 - (_QWORD)v29) >> 3;
    v41 = v40 >> 6;
    v42 = (unint64_t)v39 >> 6;
    if (v38 >= -7)
      v41 = v42;
    v43 = (char *)__p + 8 * v41;
    v44 = (v38 >> 3) & 0x3F;
    if (v44 != v37 || (v45 = (double *)v69[1], v41 != (unint64_t)v72 >> 6))
    {
      v45 = (double *)v69[1];
      v46 = (char *)__p + 8 * v41;
      v47 = (v38 >> 3) & 0x3F;
      v48 = v45;
      do
      {
        if (((*(_QWORD *)v46 >> v47) & 1) != 0)
          v49 = 1.0;
        else
          v49 = 0.0;
        *v48++ = v49;
        v46 += 8 * (v47 == 63);
        if (v47 == 63)
          v47 = 0;
        else
          ++v47;
        ++v45;
      }
      while (v47 != v37 || v46 != v36);
    }
    v69[1] = v45;
    if (v38 >= 1)
    {
      v26 = v69;
LABEL_44:
      v50 = &v29[v24];
      v51 = &v45[-v24];
      v52 = v45;
      if ((unint64_t)v51 < v27)
      {
        v52 = v45;
        do
        {
          v53 = *(_QWORD *)v51++;
          *(_QWORD *)v52++ = v53;
        }
        while ((unint64_t)v51 < v27);
      }
      v26[1] = v52;
      if (v45 != v50)
        memmove(&v45[-(v45 - v50)], v29, (char *)v45 - (char *)v50);
      if (v44 || v25 != v43)
      {
        v54 = 0;
        do
        {
          if (((*(_QWORD *)v25 >> v54) & 1) != 0)
            v55 = 1.0;
          else
            v55 = 0.0;
          *v29++ = v55;
          v25 += 8 * (v54 == 63);
          if (v54 == 63)
            v54 = 0;
          else
            ++v54;
        }
        while (v54 != v44 || v25 != v43);
      }
    }
  }
LABEL_77:
  if (__p)
    operator delete(__p);

}

+ (id)_tokenizeString:(id)a3 usingWordUnits:(BOOL)a4 excludeWhitespace:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_crStringByReplacingCharactersInSet:withString:", v10, &stru_1E98DC948);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v11;
    }
    objc_msgSend(v7, "_crArrayOfComposedCharacters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (void)_extractLanguageModelFeaturesTo:(void *)a3 evaluation:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char *v13;
  char **v14;
  double *v15;
  double *v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  double *v23;
  uint64_t v24;
  double *v25;
  double *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  double *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double *v36;
  double *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  double *v43;
  uint64_t v44;
  double v45;
  double *v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  double *v53;
  uint64_t v54;
  double v55;
  double *v56;
  double *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  double *v63;
  char *v64;
  uint64_t v65;
  id v66;

  v66 = a4;
  objc_msgSend(v66, "lmScore");
  if (v5 <= 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  if (v5 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  objc_msgSend(v66, "eosLMScore");
  if (v8 <= 1.0)
    v9 = v8;
  else
    v9 = 1.0;
  if (v8 >= 0.0)
    v10 = v9;
  else
    v10 = 0.0;
  v11 = log(v7);
  v12 = log(v10);
  v14 = (char **)((char *)a3 + 16);
  v13 = (char *)*((_QWORD *)a3 + 2);
  v15 = (double *)*((_QWORD *)a3 + 1);
  if (v15 >= (double *)v13)
  {
    v17 = *(double **)a3;
    v18 = ((uint64_t)v15 - *(_QWORD *)a3) >> 3;
    v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 61)
      goto LABEL_97;
    v20 = v13 - (char *)v17;
    if (v20 >> 2 > v19)
      v19 = v20 >> 2;
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
      v21 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v21 = v19;
    if (v21)
    {
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v21);
      v17 = *(double **)a3;
      v15 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v22 = 0;
    }
    v23 = (double *)&v22[8 * v18];
    v13 = &v22[8 * v21];
    *v23 = v7;
    v16 = v23 + 1;
    while (v15 != v17)
    {
      v24 = *((_QWORD *)v15-- - 1);
      *((_QWORD *)v23-- - 1) = v24;
    }
    *(_QWORD *)a3 = v23;
    *((_QWORD *)a3 + 1) = v16;
    *((_QWORD *)a3 + 2) = v13;
    if (v17)
    {
      operator delete(v17);
      v13 = *v14;
    }
  }
  else
  {
    *v15 = v7;
    v16 = v15 + 1;
  }
  *((_QWORD *)a3 + 1) = v16;
  if (v16 >= (double *)v13)
  {
    v26 = *(double **)a3;
    v27 = ((uint64_t)v16 - *(_QWORD *)a3) >> 3;
    v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 61)
      goto LABEL_97;
    v29 = v13 - (char *)v26;
    if (v29 >> 2 > v28)
      v28 = v29 >> 2;
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
      v30 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v30 = v28;
    if (v30)
    {
      v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v30);
      v26 = *(double **)a3;
      v16 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v31 = 0;
    }
    v32 = (double *)&v31[8 * v27];
    v13 = &v31[8 * v30];
    *v32 = v10;
    v25 = v32 + 1;
    while (v16 != v26)
    {
      v33 = *((_QWORD *)v16-- - 1);
      *((_QWORD *)v32-- - 1) = v33;
    }
    *(_QWORD *)a3 = v32;
    *((_QWORD *)a3 + 1) = v25;
    *((_QWORD *)a3 + 2) = v13;
    if (v26)
    {
      operator delete(v26);
      v13 = *v14;
    }
  }
  else
  {
    *v16 = v10;
    v25 = v16 + 1;
  }
  v34 = v66;
  v35 = fmax(v11 * 0.25, -10.0);
  *((_QWORD *)a3 + 1) = v25;
  if (v25 >= (double *)v13)
  {
    v37 = *(double **)a3;
    v38 = ((uint64_t)v25 - *(_QWORD *)a3) >> 3;
    v39 = v38 + 1;
    if ((unint64_t)(v38 + 1) >> 61)
      goto LABEL_97;
    v40 = v13 - (char *)v37;
    if (v40 >> 2 > v39)
      v39 = v40 >> 2;
    if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
      v41 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v41 = v39;
    if (v41)
    {
      v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v41);
      v37 = *(double **)a3;
      v25 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v42 = 0;
    }
    v43 = (double *)&v42[8 * v38];
    v13 = &v42[8 * v41];
    *v43 = v35;
    v36 = v43 + 1;
    while (v25 != v37)
    {
      v44 = *((_QWORD *)v25-- - 1);
      *((_QWORD *)v43-- - 1) = v44;
    }
    *(_QWORD *)a3 = v43;
    *((_QWORD *)a3 + 1) = v36;
    *((_QWORD *)a3 + 2) = v13;
    if (v37)
    {
      operator delete(v37);
      v13 = *v14;
    }
    v34 = v66;
  }
  else
  {
    *v25 = v35;
    v36 = v25 + 1;
  }
  v45 = fmax(v12 * 0.25, -10.0);
  *((_QWORD *)a3 + 1) = v36;
  if (v36 < (double *)v13)
  {
    *v36 = v45;
    v46 = v36 + 1;
    goto LABEL_79;
  }
  v47 = *(double **)a3;
  v48 = ((uint64_t)v36 - *(_QWORD *)a3) >> 3;
  v49 = v48 + 1;
  if ((unint64_t)(v48 + 1) >> 61)
LABEL_97:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  v50 = v13 - (char *)v47;
  if (v50 >> 2 > v49)
    v49 = v50 >> 2;
  if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
    v51 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v51 = v49;
  if (v51)
  {
    v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v51);
    v47 = *(double **)a3;
    v36 = (double *)*((_QWORD *)a3 + 1);
  }
  else
  {
    v52 = 0;
  }
  v53 = (double *)&v52[8 * v48];
  v13 = &v52[8 * v51];
  *v53 = v45;
  v46 = v53 + 1;
  while (v36 != v47)
  {
    v54 = *((_QWORD *)v36-- - 1);
    *((_QWORD *)v53-- - 1) = v54;
  }
  *(_QWORD *)a3 = v53;
  *((_QWORD *)a3 + 1) = v46;
  *((_QWORD *)a3 + 2) = v13;
  if (v47)
  {
    operator delete(v47);
    v13 = *v14;
  }
  v34 = v66;
LABEL_79:
  *((_QWORD *)a3 + 1) = v46;
  v55 = v35 - v45;
  if (v46 >= (double *)v13)
  {
    v57 = *(double **)a3;
    v58 = ((uint64_t)v46 - *(_QWORD *)a3) >> 3;
    v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v60 = v13 - (char *)v57;
    if (v60 >> 2 > v59)
      v59 = v60 >> 2;
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
      v61 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v61 = v59;
    if (v61)
    {
      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v61);
      v57 = *(double **)a3;
      v46 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v62 = 0;
    }
    v63 = (double *)&v62[8 * v58];
    v64 = &v62[8 * v61];
    *v63 = v55;
    v56 = v63 + 1;
    while (v46 != v57)
    {
      v65 = *((_QWORD *)v46-- - 1);
      *((_QWORD *)v63-- - 1) = v65;
    }
    *(_QWORD *)a3 = v63;
    *((_QWORD *)a3 + 1) = v56;
    *((_QWORD *)a3 + 2) = v64;
    if (v57)
      operator delete(v57);
    v34 = v66;
  }
  else
  {
    *v46 = v55;
    v56 = v46 + 1;
  }
  *((_QWORD *)a3 + 1) = v56;

}

+ (void)_extractGeometricFeaturesTo:(void *)a3 evaluation:(id)a4
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
  char *v20;
  char **v21;
  double *v22;
  double *v23;
  double *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  double *v30;
  uint64_t v31;
  double v32;
  double *v33;
  double *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  double *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double *v44;
  double *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  double *v51;
  uint64_t v52;
  double v53;
  double *v54;
  double *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  double *v61;
  char *v62;
  uint64_t v63;
  float v64;
  long double v65;
  unint64_t v66;
  double *v67;
  double v68;
  double *v69;
  double *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  double *v76;
  char *v77;
  uint64_t v78;
  float v79;
  double v80;
  unint64_t v81;
  long double v82;
  unint64_t v83;
  double *v84;
  double v85;
  double *v86;
  double *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  double *v93;
  char *v94;
  uint64_t v95;
  float v96;
  long double v97;
  unint64_t v98;
  double *v99;
  double v100;
  double *v101;
  double *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char *v107;
  double *v108;
  char *v109;
  uint64_t v110;
  float v111;
  double v112;
  unint64_t v113;
  long double v114;
  unint64_t v115;
  double *v116;
  double v117;
  double *v118;
  double *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  double *v125;
  char *v126;
  uint64_t v127;
  float v128;
  double v129;
  unint64_t v130;
  double *v131;
  double *v132;
  double *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  double *v139;
  char *v140;
  uint64_t v141;
  float v142;
  double v143;
  double v144;
  double v145;
  double v146;
  float v147;
  double v148;
  float v149;
  double v150;
  double v151;
  double v152;
  double v153;
  float v154;
  double v155;
  double *v156;
  char *v157;
  double *v158;
  double *v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  char *v163;
  double *v164;
  uint64_t v165;
  double *v166;
  double *v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  char *v171;
  double *v172;
  uint64_t v173;
  double v174;
  double *v175;
  double *v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  char *v180;
  double *v181;
  uint64_t v182;
  double v183;
  double *v184;
  double v185;
  double v186;
  double *v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  char *v191;
  double *v192;
  uint64_t v193;
  double v194;
  double *v195;
  double *v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  char *v200;
  double *v201;
  uint64_t v202;
  double v203;
  double v204;
  double *v205;
  double *v206;
  uint64_t v207;
  unint64_t v208;
  unint64_t v209;
  char *v210;
  double *v211;
  char *v212;
  uint64_t v213;
  double v214;
  double v215;
  double v216;
  unint64_t v217;
  double *v218;
  double *v219;
  double *v220;
  uint64_t v221;
  unint64_t v222;
  uint64_t v223;
  unint64_t v224;
  char *v225;
  double *v226;
  char *v227;
  uint64_t v228;
  float v229;
  double v230;
  double v231;
  double v232;
  unint64_t v233;
  double *v234;
  double *v235;
  double *v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  unint64_t v240;
  char *v241;
  double *v242;
  char *v243;
  uint64_t v244;
  float v245;
  double v246;
  double v247;
  unint64_t v248;
  double *v249;
  double *v250;
  double *v251;
  uint64_t v252;
  unint64_t v253;
  uint64_t v254;
  unint64_t v255;
  char *v256;
  double *v257;
  char *v258;
  uint64_t v259;
  float v260;
  double v261;
  double v262;
  unint64_t v263;
  double *v264;
  double *v265;
  double *v266;
  uint64_t v267;
  unint64_t v268;
  uint64_t v269;
  unint64_t v270;
  char *v271;
  double *v272;
  char *v273;
  uint64_t v274;
  float v275;
  double v276;
  long double v277;
  unint64_t v278;
  double *v279;
  double v280;
  double *v281;
  double *v282;
  uint64_t v283;
  unint64_t v284;
  uint64_t v285;
  unint64_t v286;
  char *v287;
  double *v288;
  char *v289;
  uint64_t v290;
  float v291;
  double v292;
  long double v293;
  unint64_t v294;
  double *v295;
  double v296;
  double *v297;
  double *v298;
  uint64_t v299;
  unint64_t v300;
  uint64_t v301;
  unint64_t v302;
  char *v303;
  double *v304;
  char *v305;
  uint64_t v306;
  double v307;
  double v308;
  double v309;
  id v310;

  v310 = a4;
  objc_msgSend(v310, "lastFeatureSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v310, "featureInTestSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v310, "imageSize");
  v14 = v13;
  v16 = v15;
  v17 = fabs(v13);
  v18 = v6 / v13;
  if (v17 <= 2.22044605e-16)
    v19 = 0.0;
  else
    v19 = v18;
  v21 = (char **)((char *)a3 + 16);
  v20 = (char *)*((_QWORD *)a3 + 2);
  v22 = (double *)*((_QWORD *)a3 + 1);
  if (v22 >= (double *)v20)
  {
    v24 = *(double **)a3;
    v25 = ((uint64_t)v22 - *(_QWORD *)a3) >> 3;
    v26 = v25 + 1;
    if ((unint64_t)(v25 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v27 = v20 - (char *)v24;
    if (v27 >> 2 > v26)
      v26 = v27 >> 2;
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
      v28 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v28 = v26;
    if (v28)
    {
      v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v28);
      v24 = *(double **)a3;
      v22 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v29 = 0;
    }
    v30 = (double *)&v29[8 * v25];
    v20 = &v29[8 * v28];
    *v30 = v19;
    v23 = v30 + 1;
    while (v22 != v24)
    {
      v31 = *((_QWORD *)v22-- - 1);
      *((_QWORD *)v30-- - 1) = v31;
    }
    *(_QWORD *)a3 = v30;
    *((_QWORD *)a3 + 1) = v23;
    *((_QWORD *)a3 + 2) = v20;
    if (v24)
    {
      operator delete(v24);
      v20 = *v21;
    }
  }
  else
  {
    *v22 = v19;
    v23 = v22 + 1;
  }
  *((_QWORD *)a3 + 1) = v23;
  v309 = fabs(v16);
  if (v309 <= 2.22044605e-16)
    v32 = 0.0;
  else
    v32 = v8 / v16;
  if (v23 >= (double *)v20)
  {
    v34 = *(double **)a3;
    v35 = ((uint64_t)v23 - *(_QWORD *)a3) >> 3;
    v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v37 = v20 - (char *)v34;
    if (v37 >> 2 > v36)
      v36 = v37 >> 2;
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
      v38 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v38 = v36;
    if (v38)
    {
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v38);
      v34 = *(double **)a3;
      v23 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v39 = 0;
    }
    v40 = (double *)&v39[8 * v35];
    v20 = &v39[8 * v38];
    *v40 = v32;
    v33 = v40 + 1;
    while (v23 != v34)
    {
      v41 = *((_QWORD *)v23-- - 1);
      *((_QWORD *)v40-- - 1) = v41;
    }
    *(_QWORD *)a3 = v40;
    *((_QWORD *)a3 + 1) = v33;
    *((_QWORD *)a3 + 2) = v20;
    if (v34)
    {
      operator delete(v34);
      v20 = *v21;
    }
  }
  else
  {
    *v23 = v32;
    v33 = v23 + 1;
  }
  v42 = v310;
  *((_QWORD *)a3 + 1) = v33;
  if (v17 <= 2.22044605e-16)
    v43 = 0.0;
  else
    v43 = v10 / v14;
  if (v33 >= (double *)v20)
  {
    v45 = *(double **)a3;
    v46 = ((uint64_t)v33 - *(_QWORD *)a3) >> 3;
    v47 = v46 + 1;
    if ((unint64_t)(v46 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v48 = v20 - (char *)v45;
    if (v48 >> 2 > v47)
      v47 = v48 >> 2;
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
      v49 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v49 = v47;
    if (v49)
    {
      v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v49);
      v45 = *(double **)a3;
      v33 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v50 = 0;
    }
    v51 = (double *)&v50[8 * v46];
    v20 = &v50[8 * v49];
    *v51 = v43;
    v44 = v51 + 1;
    while (v33 != v45)
    {
      v52 = *((_QWORD *)v33-- - 1);
      *((_QWORD *)v51-- - 1) = v52;
    }
    *(_QWORD *)a3 = v51;
    *((_QWORD *)a3 + 1) = v44;
    *((_QWORD *)a3 + 2) = v20;
    if (v45)
    {
      operator delete(v45);
      v20 = *v21;
    }
    v42 = v310;
  }
  else
  {
    *v33 = v43;
    v44 = v33 + 1;
  }
  *((_QWORD *)a3 + 1) = v44;
  if (v309 <= 2.22044605e-16)
    v53 = 0.0;
  else
    v53 = v12 / v16;
  if (v44 >= (double *)v20)
  {
    v55 = *(double **)a3;
    v56 = ((uint64_t)v44 - *(_QWORD *)a3) >> 3;
    v57 = v56 + 1;
    if ((unint64_t)(v56 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v58 = v20 - (char *)v55;
    if (v58 >> 2 > v57)
      v57 = v58 >> 2;
    if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
      v59 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v59 = v57;
    if (v59)
    {
      v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v59);
      v55 = *(double **)a3;
      v44 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v60 = 0;
    }
    v61 = (double *)&v60[8 * v56];
    v62 = &v60[8 * v59];
    *v61 = v53;
    v54 = v61 + 1;
    while (v44 != v55)
    {
      v63 = *((_QWORD *)v44-- - 1);
      *((_QWORD *)v61-- - 1) = v63;
    }
    *(_QWORD *)a3 = v61;
    *((_QWORD *)a3 + 1) = v54;
    *((_QWORD *)a3 + 2) = v62;
    if (v55)
      operator delete(v55);
    v42 = v310;
  }
  else
  {
    *v44 = v53;
    v54 = v44 + 1;
  }
  *((_QWORD *)a3 + 1) = v54;
  objc_msgSend(v42, "textHeightRatio");
  v65 = exp(-v64);
  v67 = (double *)*((_QWORD *)a3 + 1);
  v66 = *((_QWORD *)a3 + 2);
  v68 = 1.0 / (v65 + 1.0);
  if ((unint64_t)v67 >= v66)
  {
    v70 = *(double **)a3;
    v71 = ((uint64_t)v67 - *(_QWORD *)a3) >> 3;
    v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v73 = v66 - (_QWORD)v70;
    if (v73 >> 2 > v72)
      v72 = v73 >> 2;
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8)
      v74 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v74 = v72;
    if (v74)
    {
      v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v74);
      v70 = *(double **)a3;
      v67 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v75 = 0;
    }
    v76 = (double *)&v75[8 * v71];
    v77 = &v75[8 * v74];
    *v76 = v68;
    v69 = v76 + 1;
    while (v67 != v70)
    {
      v78 = *((_QWORD *)v67-- - 1);
      *((_QWORD *)v76-- - 1) = v78;
    }
    *(_QWORD *)a3 = v76;
    *((_QWORD *)a3 + 1) = v69;
    *((_QWORD *)a3 + 2) = v77;
    if (v70)
      operator delete(v70);
  }
  else
  {
    *v67 = v68;
    v69 = v67 + 1;
  }
  *((_QWORD *)a3 + 1) = v69;
  objc_msgSend(v310, "textHeightRatio");
  if (fabs(v79) <= 2.22044605e-16)
  {
    if (v79 >= 0.0)
      *(double *)&v81 = 1.79769313e308;
    else
      *(double *)&v81 = -1.79769313e308;
    v80 = *(double *)&v81;
  }
  else
  {
    v80 = 1.0 / v79;
  }
  v82 = exp(-v80);
  v84 = (double *)*((_QWORD *)a3 + 1);
  v83 = *((_QWORD *)a3 + 2);
  v85 = 1.0 / (v82 + 1.0);
  if ((unint64_t)v84 >= v83)
  {
    v87 = *(double **)a3;
    v88 = ((uint64_t)v84 - *(_QWORD *)a3) >> 3;
    v89 = v88 + 1;
    if ((unint64_t)(v88 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v90 = v83 - (_QWORD)v87;
    if (v90 >> 2 > v89)
      v89 = v90 >> 2;
    if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8)
      v91 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v91 = v89;
    if (v91)
    {
      v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v91);
      v87 = *(double **)a3;
      v84 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v92 = 0;
    }
    v93 = (double *)&v92[8 * v88];
    v94 = &v92[8 * v91];
    *v93 = v85;
    v86 = v93 + 1;
    while (v84 != v87)
    {
      v95 = *((_QWORD *)v84-- - 1);
      *((_QWORD *)v93-- - 1) = v95;
    }
    *(_QWORD *)a3 = v93;
    *((_QWORD *)a3 + 1) = v86;
    *((_QWORD *)a3 + 2) = v94;
    if (v87)
      operator delete(v87);
  }
  else
  {
    *v84 = v85;
    v86 = v84 + 1;
  }
  *((_QWORD *)a3 + 1) = v86;
  objc_msgSend(v310, "textWidthRatio");
  v97 = exp(-v96);
  v99 = (double *)*((_QWORD *)a3 + 1);
  v98 = *((_QWORD *)a3 + 2);
  v100 = 1.0 / (v97 + 1.0);
  if ((unint64_t)v99 >= v98)
  {
    v102 = *(double **)a3;
    v103 = ((uint64_t)v99 - *(_QWORD *)a3) >> 3;
    v104 = v103 + 1;
    if ((unint64_t)(v103 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v105 = v98 - (_QWORD)v102;
    if (v105 >> 2 > v104)
      v104 = v105 >> 2;
    if ((unint64_t)v105 >= 0x7FFFFFFFFFFFFFF8)
      v106 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v106 = v104;
    if (v106)
    {
      v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v106);
      v102 = *(double **)a3;
      v99 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v107 = 0;
    }
    v108 = (double *)&v107[8 * v103];
    v109 = &v107[8 * v106];
    *v108 = v100;
    v101 = v108 + 1;
    while (v99 != v102)
    {
      v110 = *((_QWORD *)v99-- - 1);
      *((_QWORD *)v108-- - 1) = v110;
    }
    *(_QWORD *)a3 = v108;
    *((_QWORD *)a3 + 1) = v101;
    *((_QWORD *)a3 + 2) = v109;
    if (v102)
      operator delete(v102);
  }
  else
  {
    *v99 = v100;
    v101 = v99 + 1;
  }
  *((_QWORD *)a3 + 1) = v101;
  objc_msgSend(v310, "textWidthRatio");
  if (fabs(v111) <= 2.22044605e-16)
  {
    if (v111 >= 0.0)
      *(double *)&v113 = 1.79769313e308;
    else
      *(double *)&v113 = -1.79769313e308;
    v112 = *(double *)&v113;
  }
  else
  {
    v112 = 1.0 / v111;
  }
  v114 = exp(-v112);
  v116 = (double *)*((_QWORD *)a3 + 1);
  v115 = *((_QWORD *)a3 + 2);
  v117 = 1.0 / (v114 + 1.0);
  if ((unint64_t)v116 >= v115)
  {
    v119 = *(double **)a3;
    v120 = ((uint64_t)v116 - *(_QWORD *)a3) >> 3;
    v121 = v120 + 1;
    if ((unint64_t)(v120 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v122 = v115 - (_QWORD)v119;
    if (v122 >> 2 > v121)
      v121 = v122 >> 2;
    if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF8)
      v123 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v123 = v121;
    if (v123)
    {
      v124 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v123);
      v119 = *(double **)a3;
      v116 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v124 = 0;
    }
    v125 = (double *)&v124[8 * v120];
    v126 = &v124[8 * v123];
    *v125 = v117;
    v118 = v125 + 1;
    while (v116 != v119)
    {
      v127 = *((_QWORD *)v116-- - 1);
      *((_QWORD *)v125-- - 1) = v127;
    }
    *(_QWORD *)a3 = v125;
    *((_QWORD *)a3 + 1) = v118;
    *((_QWORD *)a3 + 2) = v126;
    if (v119)
      operator delete(v119);
  }
  else
  {
    *v116 = v117;
    v118 = v116 + 1;
  }
  *((_QWORD *)a3 + 1) = v118;
  objc_msgSend(v310, "angleDiff");
  v129 = v128;
  v131 = (double *)*((_QWORD *)a3 + 1);
  v130 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v131 >= v130)
  {
    v133 = *(double **)a3;
    v134 = ((uint64_t)v131 - *(_QWORD *)a3) >> 3;
    v135 = v134 + 1;
    if ((unint64_t)(v134 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v136 = v130 - (_QWORD)v133;
    if (v136 >> 2 > v135)
      v135 = v136 >> 2;
    if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFF8)
      v137 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v137 = v135;
    if (v137)
    {
      v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v137);
      v133 = *(double **)a3;
      v131 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v138 = 0;
    }
    v139 = (double *)&v138[8 * v134];
    v140 = &v138[8 * v137];
    *v139 = v129;
    v132 = v139 + 1;
    while (v131 != v133)
    {
      v141 = *((_QWORD *)v131-- - 1);
      *((_QWORD *)v139-- - 1) = v141;
    }
    *(_QWORD *)a3 = v139;
    *((_QWORD *)a3 + 1) = v132;
    *((_QWORD *)a3 + 2) = v140;
    if (v133)
      operator delete(v133);
  }
  else
  {
    *v131 = v129;
    v132 = v131 + 1;
  }
  *((_QWORD *)a3 + 1) = v132;
  objc_msgSend(v310, "topDistanceLeft");
  v308 = v6;
  v143 = v142 / v14;
  v144 = 0.0;
  if (v17 <= 2.22044605e-16)
    v145 = 0.0;
  else
    v145 = v143;
  objc_msgSend(v310, "topDistanceRight", *(_QWORD *)&v16);
  v146 = v12;
  v148 = v147 / v14;
  if (v17 > 2.22044605e-16)
    v144 = v148;
  objc_msgSend(v310, "leftDistance");
  v150 = fabs(v8);
  v151 = v149 / v8;
  v152 = 0.0;
  if (v150 <= 2.22044605e-16)
    v153 = 0.0;
  else
    v153 = v149 / v8;
  objc_msgSend(v310, "rightDistance");
  v155 = v154 / v8;
  if (v150 > 2.22044605e-16)
    v152 = v155;
  v156 = (double *)*((_QWORD *)a3 + 1);
  v157 = (char *)*((_QWORD *)a3 + 2);
  if (v156 >= (double *)v157)
  {
    v159 = *(double **)a3;
    v160 = ((uint64_t)v156 - *(_QWORD *)a3) >> 3;
    v161 = v160 + 1;
    if ((unint64_t)(v160 + 1) >> 61)
      goto LABEL_392;
    if ((v157 - (char *)v159) >> 2 > v161)
      v161 = (v157 - (char *)v159) >> 2;
    if ((unint64_t)(v157 - (char *)v159) >= 0x7FFFFFFFFFFFFFF8)
      v162 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v162 = v161;
    if (v162)
    {
      v163 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v162);
      v159 = *(double **)a3;
      v156 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v163 = 0;
    }
    v164 = (double *)&v163[8 * v160];
    v157 = &v163[8 * v162];
    *v164 = v145;
    v158 = v164 + 1;
    while (v156 != v159)
    {
      v165 = *((_QWORD *)v156-- - 1);
      *((_QWORD *)v164-- - 1) = v165;
    }
    *(_QWORD *)a3 = v164;
    *((_QWORD *)a3 + 1) = v158;
    *((_QWORD *)a3 + 2) = v157;
    if (v159)
    {
      operator delete(v159);
      v157 = *v21;
    }
  }
  else
  {
    *v156 = v145;
    v158 = v156 + 1;
  }
  *((_QWORD *)a3 + 1) = v158;
  if (v158 < (double *)v157)
  {
    *v158 = v144;
    v166 = v158 + 1;
    goto LABEL_213;
  }
  v167 = *(double **)a3;
  v168 = ((uint64_t)v158 - *(_QWORD *)a3) >> 3;
  v169 = v168 + 1;
  if ((unint64_t)(v168 + 1) >> 61)
LABEL_392:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  if ((v157 - (char *)v167) >> 2 > v169)
    v169 = (v157 - (char *)v167) >> 2;
  if ((unint64_t)(v157 - (char *)v167) >= 0x7FFFFFFFFFFFFFF8)
    v170 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v170 = v169;
  if (v170)
  {
    v171 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v170);
    v167 = *(double **)a3;
    v158 = (double *)*((_QWORD *)a3 + 1);
  }
  else
  {
    v171 = 0;
  }
  v172 = (double *)&v171[8 * v168];
  v157 = &v171[8 * v170];
  *v172 = v144;
  v166 = v172 + 1;
  while (v158 != v167)
  {
    v173 = *((_QWORD *)v158-- - 1);
    *((_QWORD *)v172-- - 1) = v173;
  }
  *(_QWORD *)a3 = v172;
  *((_QWORD *)a3 + 1) = v166;
  *((_QWORD *)a3 + 2) = v157;
  if (v167)
  {
    operator delete(v167);
    v157 = *v21;
  }
LABEL_213:
  *((_QWORD *)a3 + 1) = v166;
  v174 = v145 - v144;
  if (v166 >= (double *)v157)
  {
    v176 = *(double **)a3;
    v177 = ((uint64_t)v166 - *(_QWORD *)a3) >> 3;
    v178 = v177 + 1;
    if ((unint64_t)(v177 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v157 - (char *)v176) >> 2 > v178)
      v178 = (v157 - (char *)v176) >> 2;
    if ((unint64_t)(v157 - (char *)v176) >= 0x7FFFFFFFFFFFFFF8)
      v179 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v179 = v178;
    if (v179)
    {
      v180 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v179);
      v176 = *(double **)a3;
      v166 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v180 = 0;
    }
    v181 = (double *)&v180[8 * v177];
    v157 = &v180[8 * v179];
    *v181 = v174;
    v175 = v181 + 1;
    while (v166 != v176)
    {
      v182 = *((_QWORD *)v166-- - 1);
      *((_QWORD *)v181-- - 1) = v182;
    }
    *(_QWORD *)a3 = v181;
    *((_QWORD *)a3 + 1) = v175;
    *((_QWORD *)a3 + 2) = v157;
    if (v176)
    {
      operator delete(v176);
      v157 = *v21;
    }
  }
  else
  {
    *v166 = v174;
    v175 = v166 + 1;
  }
  *((_QWORD *)a3 + 1) = v175;
  v183 = 1.0 / (exp(-v153) + 1.0);
  if (v175 >= (double *)v157)
  {
    v187 = *(double **)a3;
    v188 = ((uint64_t)v175 - *(_QWORD *)a3) >> 3;
    v189 = v188 + 1;
    if ((unint64_t)(v188 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v185 = v146;
    if ((v157 - (char *)v187) >> 2 > v189)
      v189 = (v157 - (char *)v187) >> 2;
    if ((unint64_t)(v157 - (char *)v187) >= 0x7FFFFFFFFFFFFFF8)
      v190 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v190 = v189;
    v186 = v308;
    if (v190)
    {
      v191 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v190);
      v187 = *(double **)a3;
      v175 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v191 = 0;
    }
    v192 = (double *)&v191[8 * v188];
    v157 = &v191[8 * v190];
    *v192 = v183;
    v184 = v192 + 1;
    while (v175 != v187)
    {
      v193 = *((_QWORD *)v175-- - 1);
      *((_QWORD *)v192-- - 1) = v193;
    }
    *(_QWORD *)a3 = v192;
    *((_QWORD *)a3 + 1) = v184;
    *((_QWORD *)a3 + 2) = v157;
    if (v187)
    {
      operator delete(v187);
      v157 = *v21;
    }
  }
  else
  {
    *v175 = v183;
    v184 = v175 + 1;
    v185 = v146;
    v186 = v308;
  }
  *((_QWORD *)a3 + 1) = v184;
  v194 = 1.0 / (exp(-v152) + 1.0);
  if (v184 >= (double *)v157)
  {
    v196 = *(double **)a3;
    v197 = ((uint64_t)v184 - *(_QWORD *)a3) >> 3;
    v198 = v197 + 1;
    if ((unint64_t)(v197 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v157 - (char *)v196) >> 2 > v198)
      v198 = (v157 - (char *)v196) >> 2;
    if ((unint64_t)(v157 - (char *)v196) >= 0x7FFFFFFFFFFFFFF8)
      v199 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v199 = v198;
    if (v199)
    {
      v200 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v199);
      v196 = *(double **)a3;
      v184 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v200 = 0;
    }
    v201 = (double *)&v200[8 * v197];
    v157 = &v200[8 * v199];
    *v201 = v194;
    v195 = v201 + 1;
    while (v184 != v196)
    {
      v202 = *((_QWORD *)v184-- - 1);
      *((_QWORD *)v201-- - 1) = v202;
    }
    *(_QWORD *)a3 = v201;
    *((_QWORD *)a3 + 1) = v195;
    *((_QWORD *)a3 + 2) = v157;
    if (v196)
    {
      operator delete(v196);
      v157 = *v21;
    }
  }
  else
  {
    *v184 = v194;
    v195 = v184 + 1;
  }
  *((_QWORD *)a3 + 1) = v195;
  v203 = v151 / v8;
  if (v150 <= 2.22044605e-16)
    v203 = 0.0;
  v204 = 1.0 / (exp(-v203) + 1.0);
  if (v195 >= (double *)v157)
  {
    v206 = *(double **)a3;
    v207 = ((uint64_t)v195 - *(_QWORD *)a3) >> 3;
    v208 = v207 + 1;
    if ((unint64_t)(v207 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v157 - (char *)v206) >> 2 > v208)
      v208 = (v157 - (char *)v206) >> 2;
    if ((unint64_t)(v157 - (char *)v206) >= 0x7FFFFFFFFFFFFFF8)
      v209 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v209 = v208;
    if (v209)
    {
      v210 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v209);
      v206 = *(double **)a3;
      v195 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v210 = 0;
    }
    v211 = (double *)&v210[8 * v207];
    v212 = &v210[8 * v209];
    *v211 = v204;
    v205 = v211 + 1;
    while (v195 != v206)
    {
      v213 = *((_QWORD *)v195-- - 1);
      *((_QWORD *)v211-- - 1) = v213;
    }
    *(_QWORD *)a3 = v211;
    *((_QWORD *)a3 + 1) = v205;
    *((_QWORD *)a3 + 2) = v212;
    if (v206)
      operator delete(v206);
  }
  else
  {
    *v195 = v204;
    v205 = v195 + 1;
  }
  *((_QWORD *)a3 + 1) = v205;
  objc_msgSend(v310, "verticalSpacing");
  v215 = v214 / v8;
  if (v150 <= 2.22044605e-16)
    v216 = 0.0;
  else
    v216 = v215;
  v218 = (double *)*((_QWORD *)a3 + 1);
  v217 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v218 >= v217)
  {
    v220 = *(double **)a3;
    v221 = ((uint64_t)v218 - *(_QWORD *)a3) >> 3;
    v222 = v221 + 1;
    if ((unint64_t)(v221 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v223 = v217 - (_QWORD)v220;
    if (v223 >> 2 > v222)
      v222 = v223 >> 2;
    if ((unint64_t)v223 >= 0x7FFFFFFFFFFFFFF8)
      v224 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v224 = v222;
    if (v224)
    {
      v225 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v224);
      v220 = *(double **)a3;
      v218 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v225 = 0;
    }
    v226 = (double *)&v225[8 * v221];
    v227 = &v225[8 * v224];
    *v226 = v216;
    v219 = v226 + 1;
    while (v218 != v220)
    {
      v228 = *((_QWORD *)v218-- - 1);
      *((_QWORD *)v226-- - 1) = v228;
    }
    *(_QWORD *)a3 = v226;
    *((_QWORD *)a3 + 1) = v219;
    *((_QWORD *)a3 + 2) = v227;
    if (v220)
      operator delete(v220);
  }
  else
  {
    *v218 = v216;
    v219 = v218 + 1;
  }
  *((_QWORD *)a3 + 1) = v219;
  objc_msgSend(v310, "horizontalOverlap");
  v230 = fabs(v186);
  v231 = v229 / v186;
  if (v230 <= 2.22044605e-16)
    v232 = 0.0;
  else
    v232 = v231;
  v234 = (double *)*((_QWORD *)a3 + 1);
  v233 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v234 >= v233)
  {
    v236 = *(double **)a3;
    v237 = ((uint64_t)v234 - *(_QWORD *)a3) >> 3;
    v238 = v237 + 1;
    if ((unint64_t)(v237 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v239 = v233 - (_QWORD)v236;
    if (v239 >> 2 > v238)
      v238 = v239 >> 2;
    if ((unint64_t)v239 >= 0x7FFFFFFFFFFFFFF8)
      v240 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v240 = v238;
    if (v240)
    {
      v241 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v240);
      v236 = *(double **)a3;
      v234 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v241 = 0;
    }
    v242 = (double *)&v241[8 * v237];
    v243 = &v241[8 * v240];
    *v242 = v232;
    v235 = v242 + 1;
    while (v234 != v236)
    {
      v244 = *((_QWORD *)v234-- - 1);
      *((_QWORD *)v242-- - 1) = v244;
    }
    *(_QWORD *)a3 = v242;
    *((_QWORD *)a3 + 1) = v235;
    *((_QWORD *)a3 + 2) = v243;
    if (v236)
      operator delete(v236);
  }
  else
  {
    *v234 = v232;
    v235 = v234 + 1;
  }
  *((_QWORD *)a3 + 1) = v235;
  objc_msgSend(v310, "verticalOverlap");
  v246 = v245 / v8;
  if (v150 <= 2.22044605e-16)
    v247 = 0.0;
  else
    v247 = v246;
  v249 = (double *)*((_QWORD *)a3 + 1);
  v248 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v249 >= v248)
  {
    v251 = *(double **)a3;
    v252 = ((uint64_t)v249 - *(_QWORD *)a3) >> 3;
    v253 = v252 + 1;
    if ((unint64_t)(v252 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v254 = v248 - (_QWORD)v251;
    if (v254 >> 2 > v253)
      v253 = v254 >> 2;
    if ((unint64_t)v254 >= 0x7FFFFFFFFFFFFFF8)
      v255 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v255 = v253;
    if (v255)
    {
      v256 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v255);
      v251 = *(double **)a3;
      v249 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v256 = 0;
    }
    v257 = (double *)&v256[8 * v252];
    v258 = &v256[8 * v255];
    *v257 = v247;
    v250 = v257 + 1;
    while (v249 != v251)
    {
      v259 = *((_QWORD *)v249-- - 1);
      *((_QWORD *)v257-- - 1) = v259;
    }
    *(_QWORD *)a3 = v257;
    *((_QWORD *)a3 + 1) = v250;
    *((_QWORD *)a3 + 2) = v258;
    if (v251)
      operator delete(v251);
  }
  else
  {
    *v249 = v247;
    v250 = v249 + 1;
  }
  *((_QWORD *)a3 + 1) = v250;
  objc_msgSend(v310, "midDistance");
  v261 = (v8 + v185 - v260) / v307;
  if (v309 <= 2.22044605e-16)
    v262 = 0.0;
  else
    v262 = v261;
  v264 = (double *)*((_QWORD *)a3 + 1);
  v263 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v264 >= v263)
  {
    v266 = *(double **)a3;
    v267 = ((uint64_t)v264 - *(_QWORD *)a3) >> 3;
    v268 = v267 + 1;
    if ((unint64_t)(v267 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v269 = v263 - (_QWORD)v266;
    if (v269 >> 2 > v268)
      v268 = v269 >> 2;
    if ((unint64_t)v269 >= 0x7FFFFFFFFFFFFFF8)
      v270 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v270 = v268;
    if (v270)
    {
      v271 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v270);
      v266 = *(double **)a3;
      v264 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v271 = 0;
    }
    v272 = (double *)&v271[8 * v267];
    v273 = &v271[8 * v270];
    *v272 = v262;
    v265 = v272 + 1;
    while (v264 != v266)
    {
      v274 = *((_QWORD *)v264-- - 1);
      *((_QWORD *)v272-- - 1) = v274;
    }
    *(_QWORD *)a3 = v272;
    *((_QWORD *)a3 + 1) = v265;
    *((_QWORD *)a3 + 2) = v273;
    if (v266)
      operator delete(v266);
  }
  else
  {
    *v264 = v262;
    v265 = v264 + 1;
  }
  *((_QWORD *)a3 + 1) = v265;
  objc_msgSend(v310, "xSpace");
  v276 = v275 / v186;
  if (v230 <= 2.22044605e-16)
    v276 = 0.0;
  v277 = exp(-v276);
  v279 = (double *)*((_QWORD *)a3 + 1);
  v278 = *((_QWORD *)a3 + 2);
  v280 = 1.0 / (v277 + 1.0);
  if ((unint64_t)v279 >= v278)
  {
    v282 = *(double **)a3;
    v283 = ((uint64_t)v279 - *(_QWORD *)a3) >> 3;
    v284 = v283 + 1;
    if ((unint64_t)(v283 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v285 = v278 - (_QWORD)v282;
    if (v285 >> 2 > v284)
      v284 = v285 >> 2;
    if ((unint64_t)v285 >= 0x7FFFFFFFFFFFFFF8)
      v286 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v286 = v284;
    if (v286)
    {
      v287 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v286);
      v282 = *(double **)a3;
      v279 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v287 = 0;
    }
    v288 = (double *)&v287[8 * v283];
    v289 = &v287[8 * v286];
    *v288 = v280;
    v281 = v288 + 1;
    while (v279 != v282)
    {
      v290 = *((_QWORD *)v279-- - 1);
      *((_QWORD *)v288-- - 1) = v290;
    }
    *(_QWORD *)a3 = v288;
    *((_QWORD *)a3 + 1) = v281;
    *((_QWORD *)a3 + 2) = v289;
    if (v282)
      operator delete(v282);
  }
  else
  {
    *v279 = v280;
    v281 = v279 + 1;
  }
  *((_QWORD *)a3 + 1) = v281;
  objc_msgSend(v310, "ySpace");
  v292 = v291 / v185;
  if (fabs(v185) <= 2.22044605e-16)
    v292 = 0.0;
  v293 = exp(-v292);
  v295 = (double *)*((_QWORD *)a3 + 1);
  v294 = *((_QWORD *)a3 + 2);
  v296 = 1.0 / (v293 + 1.0);
  if ((unint64_t)v295 >= v294)
  {
    v298 = *(double **)a3;
    v299 = ((uint64_t)v295 - *(_QWORD *)a3) >> 3;
    v300 = v299 + 1;
    if ((unint64_t)(v299 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v301 = v294 - (_QWORD)v298;
    if (v301 >> 2 > v300)
      v300 = v301 >> 2;
    if ((unint64_t)v301 >= 0x7FFFFFFFFFFFFFF8)
      v302 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v302 = v300;
    if (v302)
    {
      v303 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v302);
      v298 = *(double **)a3;
      v295 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v303 = 0;
    }
    v304 = (double *)&v303[8 * v299];
    v305 = &v303[8 * v302];
    *v304 = v296;
    v297 = v304 + 1;
    while (v295 != v298)
    {
      v306 = *((_QWORD *)v295-- - 1);
      *((_QWORD *)v304-- - 1) = v306;
    }
    *(_QWORD *)a3 = v304;
    *((_QWORD *)a3 + 1) = v297;
    *((_QWORD *)a3 + 2) = v305;
    if (v298)
      operator delete(v298);
  }
  else
  {
    *v295 = v296;
    v297 = v295 + 1;
  }
  *((_QWORD *)a3 + 1) = v297;

}

+ (void)_extractEvaluatedFeaturesTo:(void *)a3 evaluation:(id)a4
{
  double v5;
  unint64_t v6;
  double *v7;
  double *v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  double *v15;
  char *v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  double *v20;
  double *v21;
  double *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  double *v28;
  char *v29;
  uint64_t v30;
  double v31;
  unint64_t v32;
  double *v33;
  double *v34;
  double *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  double *v41;
  char *v42;
  uint64_t v43;
  double v44;
  unint64_t v45;
  double *v46;
  double *v47;
  double *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  double *v54;
  char *v55;
  uint64_t v56;
  double v57;
  unint64_t v58;
  double *v59;
  double *v60;
  double *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  double *v67;
  char *v68;
  uint64_t v69;
  double v70;
  unint64_t v71;
  double *v72;
  double *v73;
  double *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  double *v80;
  char *v81;
  uint64_t v82;
  double v83;
  unint64_t v84;
  double *v85;
  double *v86;
  double *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  double *v93;
  char *v94;
  uint64_t v95;
  double v96;
  unint64_t v97;
  double *v98;
  double *v99;
  double *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  double *v106;
  char *v107;
  uint64_t v108;
  double v109;
  unint64_t v110;
  double *v111;
  double *v112;
  double *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  double *v119;
  char *v120;
  uint64_t v121;
  double v122;
  unint64_t v123;
  double *v124;
  double *v125;
  double *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  double *v132;
  char *v133;
  uint64_t v134;
  double v135;
  unint64_t v136;
  double *v137;
  double *v138;
  double *v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  char *v144;
  double *v145;
  char *v146;
  uint64_t v147;
  double v148;
  unint64_t v149;
  double *v150;
  double *v151;
  double *v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char *v157;
  double *v158;
  char *v159;
  uint64_t v160;
  double v161;
  unint64_t v162;
  double *v163;
  double *v164;
  double *v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  double *v171;
  char *v172;
  uint64_t v173;
  id v174;

  v174 = a4;
  v5 = (double)objc_msgSend(v174, "isOversegmented");
  v6 = *((_QWORD *)a3 + 2);
  v7 = (double *)*((_QWORD *)a3 + 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = *(double **)a3;
    v10 = ((uint64_t)v7 - *(_QWORD *)a3) >> 3;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = v6 - (_QWORD)v9;
    if (v12 >> 2 > v11)
      v11 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v13);
      v9 = *(double **)a3;
      v7 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v14 = 0;
    }
    v15 = (double *)&v14[8 * v10];
    v16 = &v14[8 * v13];
    *v15 = v5;
    v8 = v15 + 1;
    while (v7 != v9)
    {
      v17 = *((_QWORD *)v7-- - 1);
      *((_QWORD *)v15-- - 1) = v17;
    }
    *(_QWORD *)a3 = v15;
    *((_QWORD *)a3 + 1) = v8;
    *((_QWORD *)a3 + 2) = v16;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *v7 = v5;
    v8 = v7 + 1;
  }
  *((_QWORD *)a3 + 1) = v8;
  v18 = (double)objc_msgSend(v174, "caseWrappingScoreUsingCustomConfiguration:", 0) / 10.0;
  v20 = (double *)*((_QWORD *)a3 + 1);
  v19 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v20 >= v19)
  {
    v22 = *(double **)a3;
    v23 = ((uint64_t)v20 - *(_QWORD *)a3) >> 3;
    v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v25 = v19 - (_QWORD)v22;
    if (v25 >> 2 > v24)
      v24 = v25 >> 2;
    if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
      v26 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v26 = v24;
    if (v26)
    {
      v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v26);
      v22 = *(double **)a3;
      v20 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v27 = 0;
    }
    v28 = (double *)&v27[8 * v23];
    v29 = &v27[8 * v26];
    *v28 = v18;
    v21 = v28 + 1;
    while (v20 != v22)
    {
      v30 = *((_QWORD *)v20-- - 1);
      *((_QWORD *)v28-- - 1) = v30;
    }
    *(_QWORD *)a3 = v28;
    *((_QWORD *)a3 + 1) = v21;
    *((_QWORD *)a3 + 2) = v29;
    if (v22)
      operator delete(v22);
  }
  else
  {
    *v20 = v18;
    v21 = v20 + 1;
  }
  *((_QWORD *)a3 + 1) = v21;
  v31 = (double)objc_msgSend(v174, "wordCountWrappingScore") / 10.0;
  v33 = (double *)*((_QWORD *)a3 + 1);
  v32 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v33 >= v32)
  {
    v35 = *(double **)a3;
    v36 = ((uint64_t)v33 - *(_QWORD *)a3) >> 3;
    v37 = v36 + 1;
    if ((unint64_t)(v36 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v38 = v32 - (_QWORD)v35;
    if (v38 >> 2 > v37)
      v37 = v38 >> 2;
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
      v39 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v39 = v37;
    if (v39)
    {
      v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v39);
      v35 = *(double **)a3;
      v33 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v40 = 0;
    }
    v41 = (double *)&v40[8 * v36];
    v42 = &v40[8 * v39];
    *v41 = v31;
    v34 = v41 + 1;
    while (v33 != v35)
    {
      v43 = *((_QWORD *)v33-- - 1);
      *((_QWORD *)v41-- - 1) = v43;
    }
    *(_QWORD *)a3 = v41;
    *((_QWORD *)a3 + 1) = v34;
    *((_QWORD *)a3 + 2) = v42;
    if (v35)
      operator delete(v35);
  }
  else
  {
    *v33 = v31;
    v34 = v33 + 1;
  }
  *((_QWORD *)a3 + 1) = v34;
  v44 = (double)objc_msgSend(v174, "punctuationWrappingScoreUsingCustomConfiguration:", 0) / 10.0;
  v46 = (double *)*((_QWORD *)a3 + 1);
  v45 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v46 >= v45)
  {
    v48 = *(double **)a3;
    v49 = ((uint64_t)v46 - *(_QWORD *)a3) >> 3;
    v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v51 = v45 - (_QWORD)v48;
    if (v51 >> 2 > v50)
      v50 = v51 >> 2;
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8)
      v52 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v52 = v50;
    if (v52)
    {
      v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v52);
      v48 = *(double **)a3;
      v46 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v53 = 0;
    }
    v54 = (double *)&v53[8 * v49];
    v55 = &v53[8 * v52];
    *v54 = v44;
    v47 = v54 + 1;
    while (v46 != v48)
    {
      v56 = *((_QWORD *)v46-- - 1);
      *((_QWORD *)v54-- - 1) = v56;
    }
    *(_QWORD *)a3 = v54;
    *((_QWORD *)a3 + 1) = v47;
    *((_QWORD *)a3 + 2) = v55;
    if (v48)
      operator delete(v48);
  }
  else
  {
    *v46 = v44;
    v47 = v46 + 1;
  }
  *((_QWORD *)a3 + 1) = v47;
  v57 = (double)objc_msgSend(v174, "textContentWrappingScore") / 10.0;
  v59 = (double *)*((_QWORD *)a3 + 1);
  v58 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v59 >= v58)
  {
    v61 = *(double **)a3;
    v62 = ((uint64_t)v59 - *(_QWORD *)a3) >> 3;
    v63 = v62 + 1;
    if ((unint64_t)(v62 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v64 = v58 - (_QWORD)v61;
    if (v64 >> 2 > v63)
      v63 = v64 >> 2;
    if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8)
      v65 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v65 = v63;
    if (v65)
    {
      v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v65);
      v61 = *(double **)a3;
      v59 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v66 = 0;
    }
    v67 = (double *)&v66[8 * v62];
    v68 = &v66[8 * v65];
    *v67 = v57;
    v60 = v67 + 1;
    while (v59 != v61)
    {
      v69 = *((_QWORD *)v59-- - 1);
      *((_QWORD *)v67-- - 1) = v69;
    }
    *(_QWORD *)a3 = v67;
    *((_QWORD *)a3 + 1) = v60;
    *((_QWORD *)a3 + 2) = v68;
    if (v61)
      operator delete(v61);
  }
  else
  {
    *v59 = v57;
    v60 = v59 + 1;
  }
  *((_QWORD *)a3 + 1) = v60;
  v70 = (double)objc_msgSend(v174, "midSentencePunctuated");
  v72 = (double *)*((_QWORD *)a3 + 1);
  v71 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v72 >= v71)
  {
    v74 = *(double **)a3;
    v75 = ((uint64_t)v72 - *(_QWORD *)a3) >> 3;
    v76 = v75 + 1;
    if ((unint64_t)(v75 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v77 = v71 - (_QWORD)v74;
    if (v77 >> 2 > v76)
      v76 = v77 >> 2;
    if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
      v78 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v78 = v76;
    if (v78)
    {
      v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v78);
      v74 = *(double **)a3;
      v72 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v79 = 0;
    }
    v80 = (double *)&v79[8 * v75];
    v81 = &v79[8 * v78];
    *v80 = v70;
    v73 = v80 + 1;
    while (v72 != v74)
    {
      v82 = *((_QWORD *)v72-- - 1);
      *((_QWORD *)v80-- - 1) = v82;
    }
    *(_QWORD *)a3 = v80;
    *((_QWORD *)a3 + 1) = v73;
    *((_QWORD *)a3 + 2) = v81;
    if (v74)
      operator delete(v74);
  }
  else
  {
    *v72 = v70;
    v73 = v72 + 1;
  }
  *((_QWORD *)a3 + 1) = v73;
  v83 = (double)objc_msgSend(v174, "bothBeginWithDigits");
  v85 = (double *)*((_QWORD *)a3 + 1);
  v84 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v85 >= v84)
  {
    v87 = *(double **)a3;
    v88 = ((uint64_t)v85 - *(_QWORD *)a3) >> 3;
    v89 = v88 + 1;
    if ((unint64_t)(v88 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v90 = v84 - (_QWORD)v87;
    if (v90 >> 2 > v89)
      v89 = v90 >> 2;
    if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8)
      v91 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v91 = v89;
    if (v91)
    {
      v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v91);
      v87 = *(double **)a3;
      v85 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v92 = 0;
    }
    v93 = (double *)&v92[8 * v88];
    v94 = &v92[8 * v91];
    *v93 = v83;
    v86 = v93 + 1;
    while (v85 != v87)
    {
      v95 = *((_QWORD *)v85-- - 1);
      *((_QWORD *)v93-- - 1) = v95;
    }
    *(_QWORD *)a3 = v93;
    *((_QWORD *)a3 + 1) = v86;
    *((_QWORD *)a3 + 2) = v94;
    if (v87)
      operator delete(v87);
  }
  else
  {
    *v85 = v83;
    v86 = v85 + 1;
  }
  *((_QWORD *)a3 + 1) = v86;
  v96 = (double)objc_msgSend(v174, "f2StartOfSentence");
  v98 = (double *)*((_QWORD *)a3 + 1);
  v97 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v98 >= v97)
  {
    v100 = *(double **)a3;
    v101 = ((uint64_t)v98 - *(_QWORD *)a3) >> 3;
    v102 = v101 + 1;
    if ((unint64_t)(v101 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v103 = v97 - (_QWORD)v100;
    if (v103 >> 2 > v102)
      v102 = v103 >> 2;
    if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFF8)
      v104 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v104 = v102;
    if (v104)
    {
      v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v104);
      v100 = *(double **)a3;
      v98 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v105 = 0;
    }
    v106 = (double *)&v105[8 * v101];
    v107 = &v105[8 * v104];
    *v106 = v96;
    v99 = v106 + 1;
    while (v98 != v100)
    {
      v108 = *((_QWORD *)v98-- - 1);
      *((_QWORD *)v106-- - 1) = v108;
    }
    *(_QWORD *)a3 = v106;
    *((_QWORD *)a3 + 1) = v99;
    *((_QWORD *)a3 + 2) = v107;
    if (v100)
      operator delete(v100);
  }
  else
  {
    *v98 = v96;
    v99 = v98 + 1;
  }
  *((_QWORD *)a3 + 1) = v99;
  v109 = (double)objc_msgSend(v174, "oversegmentedListItem");
  v111 = (double *)*((_QWORD *)a3 + 1);
  v110 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v111 >= v110)
  {
    v113 = *(double **)a3;
    v114 = ((uint64_t)v111 - *(_QWORD *)a3) >> 3;
    v115 = v114 + 1;
    if ((unint64_t)(v114 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v116 = v110 - (_QWORD)v113;
    if (v116 >> 2 > v115)
      v115 = v116 >> 2;
    if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8)
      v117 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v117 = v115;
    if (v117)
    {
      v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v117);
      v113 = *(double **)a3;
      v111 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v118 = 0;
    }
    v119 = (double *)&v118[8 * v114];
    v120 = &v118[8 * v117];
    *v119 = v109;
    v112 = v119 + 1;
    while (v111 != v113)
    {
      v121 = *((_QWORD *)v111-- - 1);
      *((_QWORD *)v119-- - 1) = v121;
    }
    *(_QWORD *)a3 = v119;
    *((_QWORD *)a3 + 1) = v112;
    *((_QWORD *)a3 + 2) = v120;
    if (v113)
      operator delete(v113);
  }
  else
  {
    *v111 = v109;
    v112 = v111 + 1;
  }
  *((_QWORD *)a3 + 1) = v112;
  v122 = (double)objc_msgSend(v174, "f2BeginsWithDD");
  v124 = (double *)*((_QWORD *)a3 + 1);
  v123 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v124 >= v123)
  {
    v126 = *(double **)a3;
    v127 = ((uint64_t)v124 - *(_QWORD *)a3) >> 3;
    v128 = v127 + 1;
    if ((unint64_t)(v127 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v129 = v123 - (_QWORD)v126;
    if (v129 >> 2 > v128)
      v128 = v129 >> 2;
    if ((unint64_t)v129 >= 0x7FFFFFFFFFFFFFF8)
      v130 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v130 = v128;
    if (v130)
    {
      v131 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v130);
      v126 = *(double **)a3;
      v124 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v131 = 0;
    }
    v132 = (double *)&v131[8 * v127];
    v133 = &v131[8 * v130];
    *v132 = v122;
    v125 = v132 + 1;
    while (v124 != v126)
    {
      v134 = *((_QWORD *)v124-- - 1);
      *((_QWORD *)v132-- - 1) = v134;
    }
    *(_QWORD *)a3 = v132;
    *((_QWORD *)a3 + 1) = v125;
    *((_QWORD *)a3 + 2) = v133;
    if (v126)
      operator delete(v126);
  }
  else
  {
    *v124 = v122;
    v125 = v124 + 1;
  }
  *((_QWORD *)a3 + 1) = v125;
  v135 = (double)objc_msgSend(v174, "f1EndsWithDD");
  v137 = (double *)*((_QWORD *)a3 + 1);
  v136 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v137 >= v136)
  {
    v139 = *(double **)a3;
    v140 = ((uint64_t)v137 - *(_QWORD *)a3) >> 3;
    v141 = v140 + 1;
    if ((unint64_t)(v140 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v142 = v136 - (_QWORD)v139;
    if (v142 >> 2 > v141)
      v141 = v142 >> 2;
    if ((unint64_t)v142 >= 0x7FFFFFFFFFFFFFF8)
      v143 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v143 = v141;
    if (v143)
    {
      v144 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v143);
      v139 = *(double **)a3;
      v137 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v144 = 0;
    }
    v145 = (double *)&v144[8 * v140];
    v146 = &v144[8 * v143];
    *v145 = v135;
    v138 = v145 + 1;
    while (v137 != v139)
    {
      v147 = *((_QWORD *)v137-- - 1);
      *((_QWORD *)v145-- - 1) = v147;
    }
    *(_QWORD *)a3 = v145;
    *((_QWORD *)a3 + 1) = v138;
    *((_QWORD *)a3 + 2) = v146;
    if (v139)
      operator delete(v139);
  }
  else
  {
    *v137 = v135;
    v138 = v137 + 1;
  }
  *((_QWORD *)a3 + 1) = v138;
  v148 = (double)objc_msgSend(v174, "f2FullyDD");
  v150 = (double *)*((_QWORD *)a3 + 1);
  v149 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v150 >= v149)
  {
    v152 = *(double **)a3;
    v153 = ((uint64_t)v150 - *(_QWORD *)a3) >> 3;
    v154 = v153 + 1;
    if ((unint64_t)(v153 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v155 = v149 - (_QWORD)v152;
    if (v155 >> 2 > v154)
      v154 = v155 >> 2;
    if ((unint64_t)v155 >= 0x7FFFFFFFFFFFFFF8)
      v156 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v156 = v154;
    if (v156)
    {
      v157 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v156);
      v152 = *(double **)a3;
      v150 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v157 = 0;
    }
    v158 = (double *)&v157[8 * v153];
    v159 = &v157[8 * v156];
    *v158 = v148;
    v151 = v158 + 1;
    while (v150 != v152)
    {
      v160 = *((_QWORD *)v150-- - 1);
      *((_QWORD *)v158-- - 1) = v160;
    }
    *(_QWORD *)a3 = v158;
    *((_QWORD *)a3 + 1) = v151;
    *((_QWORD *)a3 + 2) = v159;
    if (v152)
      operator delete(v152);
  }
  else
  {
    *v150 = v148;
    v151 = v150 + 1;
  }
  *((_QWORD *)a3 + 1) = v151;
  v161 = (double)objc_msgSend(v174, "multilineDD");
  v163 = (double *)*((_QWORD *)a3 + 1);
  v162 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v163 >= v162)
  {
    v165 = *(double **)a3;
    v166 = ((uint64_t)v163 - *(_QWORD *)a3) >> 3;
    v167 = v166 + 1;
    if ((unint64_t)(v166 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v168 = v162 - (_QWORD)v165;
    if (v168 >> 2 > v167)
      v167 = v168 >> 2;
    if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFFF8)
      v169 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v169 = v167;
    if (v169)
    {
      v170 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v169);
      v165 = *(double **)a3;
      v163 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v170 = 0;
    }
    v171 = (double *)&v170[8 * v166];
    v172 = &v170[8 * v169];
    *v171 = v161;
    v164 = v171 + 1;
    while (v163 != v165)
    {
      v173 = *((_QWORD *)v163-- - 1);
      *((_QWORD *)v171-- - 1) = v173;
    }
    *(_QWORD *)a3 = v171;
    *((_QWORD *)a3 + 1) = v164;
    *((_QWORD *)a3 + 2) = v172;
    if (v165)
      operator delete(v165);
  }
  else
  {
    *v163 = v161;
    v164 = v163 + 1;
  }
  *((_QWORD *)a3 + 1) = v164;

}

+ (void)_extractLexicalFeaturesTo:(void *)a3 string1:(id)a4 string2:(id)a5 configuration:(id)a6 forCJK:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  double v14;
  unint64_t v15;
  double *v16;
  double *v17;
  double *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  double *v24;
  char *v25;
  uint64_t v26;
  double v27;
  unint64_t v28;
  double *v29;
  double *v30;
  double *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  double *v37;
  char *v38;
  uint64_t v39;
  double v40;
  unint64_t v41;
  double *v42;
  double *v43;
  double *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  double *v50;
  char *v51;
  uint64_t v52;
  double v53;
  unint64_t v54;
  double *v55;
  double *v56;
  double *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  double *v63;
  char *v64;
  uint64_t v65;
  double v66;
  unint64_t v67;
  double *v68;
  double *v69;
  double *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  double *v76;
  char *v77;
  uint64_t v78;
  double v79;
  unint64_t v80;
  double *v81;
  double *v82;
  double *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  double *v89;
  char *v90;
  uint64_t v91;
  double v92;
  unint64_t v93;
  double *v94;
  double *v95;
  double *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  double *v102;
  char *v103;
  uint64_t v104;
  double v105;
  unint64_t v106;
  double *v107;
  double *v108;
  double *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  double *v115;
  char *v116;
  uint64_t v117;
  double v118;
  unint64_t v119;
  double *v120;
  double *v121;
  double *v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  double *v128;
  char *v129;
  uint64_t v130;
  double v131;
  unint64_t v132;
  double *v133;
  double *v134;
  double *v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char *v140;
  double *v141;
  char *v142;
  uint64_t v143;
  double v144;
  unint64_t v145;
  double *v146;
  double *v147;
  double *v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char *v153;
  double *v154;
  char *v155;
  uint64_t v156;
  double v157;
  unint64_t v158;
  double *v159;
  double *v160;
  double *v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  double *v167;
  char *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  unsigned int v175;
  unsigned int v176;
  double v177;
  char *v178;
  double *v179;
  double *v180;
  double *v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  char *v186;
  double *v187;
  uint64_t v188;
  double v189;
  double *v190;
  double *v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  char *v196;
  double *v197;
  uint64_t v198;
  double v199;
  double *v200;
  double *v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  unint64_t v205;
  char *v206;
  double *v207;
  char *v208;
  uint64_t v209;
  void *v210;
  double v211;
  unint64_t v212;
  double *v213;
  double *v214;
  double *v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  char *v220;
  double *v221;
  char *v222;
  uint64_t v223;
  void *v224;
  double v225;
  unint64_t v226;
  double *v227;
  double *v228;
  double *v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  unint64_t v233;
  char *v234;
  double *v235;
  char *v236;
  uint64_t v237;
  unsigned int v238;
  int v239;
  double v240;
  char *v241;
  double *v242;
  double *v243;
  double *v244;
  uint64_t v245;
  unint64_t v246;
  uint64_t v247;
  unint64_t v248;
  char *v249;
  double *v250;
  uint64_t v251;
  double v252;
  double *v253;
  double *v254;
  uint64_t v255;
  unint64_t v256;
  uint64_t v257;
  unint64_t v258;
  char *v259;
  double *v260;
  uint64_t v261;
  double v262;
  double *v263;
  double *v264;
  uint64_t v265;
  unint64_t v266;
  uint64_t v267;
  unint64_t v268;
  char *v269;
  double *v270;
  char *v271;
  uint64_t v272;
  double v273;
  unint64_t v274;
  double *v275;
  double *v276;
  double *v277;
  uint64_t v278;
  unint64_t v279;
  uint64_t v280;
  unint64_t v281;
  char *v282;
  double *v283;
  char *v284;
  uint64_t v285;
  double v286;
  unint64_t v287;
  double *v288;
  double *v289;
  double *v290;
  uint64_t v291;
  unint64_t v292;
  uint64_t v293;
  unint64_t v294;
  char *v295;
  double *v296;
  char *v297;
  uint64_t v298;
  unint64_t v299;
  unint64_t v300;
  double v301;
  double *v302;
  char *v303;
  double *v304;
  double *v305;
  uint64_t v306;
  unint64_t v307;
  unint64_t v308;
  char *v309;
  double *v310;
  uint64_t v311;
  double v312;
  double *v313;
  double *v314;
  uint64_t v315;
  unint64_t v316;
  unint64_t v317;
  char *v318;
  double *v319;
  uint64_t v320;
  double v321;
  double *v322;
  double *v323;
  uint64_t v324;
  unint64_t v325;
  unint64_t v326;
  char *v327;
  double *v328;
  uint64_t v329;
  double v330;
  double *v331;
  double *v332;
  uint64_t v333;
  unint64_t v334;
  unint64_t v335;
  char *v336;
  double *v337;
  uint64_t v338;
  double v339;
  double v340;
  double *v341;
  double *v342;
  uint64_t v343;
  unint64_t v344;
  unint64_t v345;
  char *v346;
  double *v347;
  uint64_t v348;
  double v349;
  double v350;
  double *v351;
  double *v352;
  uint64_t v353;
  unint64_t v354;
  unint64_t v355;
  char *v356;
  double *v357;
  char *v358;
  uint64_t v359;
  uint64_t i;
  double v361;
  unint64_t v362;
  double *v363;
  double *v364;
  double *v365;
  uint64_t v366;
  unint64_t v367;
  uint64_t v368;
  unint64_t v369;
  char *v370;
  double *v371;
  uint64_t v372;
  double v373;
  unint64_t v374;
  double *v375;
  double *v376;
  double *v377;
  uint64_t v378;
  unint64_t v379;
  uint64_t v380;
  unint64_t v381;
  char *v382;
  double *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  _anonymous_namespace_ *v387;
  int v388;
  int v389;
  int v390;
  int v391;
  double *v392;
  double v393;
  double *v394;
  double *v395;
  double *v396;
  uint64_t v397;
  unint64_t v398;
  uint64_t v399;
  unint64_t v400;
  char *v401;
  double *v402;
  uint64_t v403;
  double v404;
  double *v405;
  uint64_t v406;
  unint64_t v407;
  uint64_t v408;
  unint64_t v409;
  char *v410;
  double *v411;
  uint64_t v412;
  int j;
  int k;
  _BOOL4 v416;
  double v417;
  double *v418;
  uint64_t v419;
  unint64_t v420;
  uint64_t v421;
  unint64_t v422;
  char *v423;
  double *v424;
  double *v425;
  uint64_t v426;
  void *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t m;
  void *v431;
  int v432;
  int v433;
  int v434;
  double v435;
  unint64_t v436;
  double *v437;
  double *v438;
  double *v439;
  uint64_t v440;
  unint64_t v441;
  uint64_t v442;
  unint64_t v443;
  char *v444;
  double *v445;
  uint64_t v446;
  void *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t n;
  void *v451;
  int v452;
  int v453;
  int v454;
  double v455;
  unint64_t v456;
  double *v457;
  double *v458;
  double *v459;
  uint64_t v460;
  unint64_t v461;
  uint64_t v462;
  unint64_t v463;
  char *v464;
  double *v465;
  uint64_t v466;
  void *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t ii;
  void *v471;
  void *v472;
  double v473;
  unint64_t v474;
  double *v475;
  double *v476;
  double *v477;
  uint64_t v478;
  unint64_t v479;
  uint64_t v480;
  unint64_t v481;
  char *v482;
  double *v483;
  uint64_t v484;
  void *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t jj;
  void *v489;
  void *v490;
  double v491;
  unint64_t v492;
  double *v493;
  double *v494;
  double *v495;
  uint64_t v496;
  unint64_t v497;
  uint64_t v498;
  unint64_t v499;
  char *v500;
  double *v501;
  uint64_t v502;
  id v503;
  void *v504;
  id v505;
  void *v506;
  void *v507;
  uint64_t v508;
  int v509;
  int v510;
  int v511;
  id v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  id v517;
  void *v518;
  void *v519;
  __CFString *v520;
  __CFString *v521;
  unsigned int c;
  char **v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  _BYTE v540[128];
  _BYTE v541[128];
  _BYTE v542[128];
  _BYTE v543[128];
  uint64_t v544;

  v7 = a7;
  v544 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v517 = a5;
  v13 = a6;
  v516 = v12;
  v514 = v13;
  v14 = (double)objc_msgSend(v12, "_crStartsWithListItemIndicator");
  v15 = *((_QWORD *)a3 + 2);
  v523 = (char **)((char *)a3 + 16);
  v16 = (double *)*((_QWORD *)a3 + 1);
  if ((unint64_t)v16 >= v15)
  {
    v18 = *(double **)a3;
    v19 = ((uint64_t)v16 - *(_QWORD *)a3) >> 3;
    v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v21 = v15 - (_QWORD)v18;
    if (v21 >> 2 > v20)
      v20 = v21 >> 2;
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
      v22 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v22 = v20;
    if (v22)
    {
      v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v22);
      v18 = *(double **)a3;
      v16 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v23 = 0;
    }
    v24 = (double *)&v23[8 * v19];
    v25 = &v23[8 * v22];
    *v24 = v14;
    v17 = v24 + 1;
    while (v16 != v18)
    {
      v26 = *((_QWORD *)v16-- - 1);
      *((_QWORD *)v24-- - 1) = v26;
    }
    *(_QWORD *)a3 = v24;
    *((_QWORD *)a3 + 1) = v17;
    *((_QWORD *)a3 + 2) = v25;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v16 = v14;
    v17 = v16 + 1;
  }
  *((_QWORD *)a3 + 1) = v17;
  v27 = (double)objc_msgSend(v12, "_crStartsWithDigit");
  v29 = (double *)*((_QWORD *)a3 + 1);
  v28 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v29 >= v28)
  {
    v31 = *(double **)a3;
    v32 = ((uint64_t)v29 - *(_QWORD *)a3) >> 3;
    v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v34 = v28 - (_QWORD)v31;
    if (v34 >> 2 > v33)
      v33 = v34 >> 2;
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v33;
    if (v35)
    {
      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v35);
      v31 = *(double **)a3;
      v29 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v36 = 0;
    }
    v37 = (double *)&v36[8 * v32];
    v38 = &v36[8 * v35];
    *v37 = v27;
    v30 = v37 + 1;
    while (v29 != v31)
    {
      v39 = *((_QWORD *)v29-- - 1);
      *((_QWORD *)v37-- - 1) = v39;
    }
    *(_QWORD *)a3 = v37;
    *((_QWORD *)a3 + 1) = v30;
    *((_QWORD *)a3 + 2) = v38;
    if (v31)
      operator delete(v31);
  }
  else
  {
    *v29 = v27;
    v30 = v29 + 1;
  }
  *((_QWORD *)a3 + 1) = v30;
  v40 = (double)objc_msgSend(v12, "_crEndsWithClosingPunctuation");
  v42 = (double *)*((_QWORD *)a3 + 1);
  v41 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v42 >= v41)
  {
    v44 = *(double **)a3;
    v45 = ((uint64_t)v42 - *(_QWORD *)a3) >> 3;
    v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v47 = v41 - (_QWORD)v44;
    if (v47 >> 2 > v46)
      v46 = v47 >> 2;
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
      v48 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v48 = v46;
    if (v48)
    {
      v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v48);
      v44 = *(double **)a3;
      v42 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v49 = 0;
    }
    v50 = (double *)&v49[8 * v45];
    v51 = &v49[8 * v48];
    *v50 = v40;
    v43 = v50 + 1;
    while (v42 != v44)
    {
      v52 = *((_QWORD *)v42-- - 1);
      *((_QWORD *)v50-- - 1) = v52;
    }
    *(_QWORD *)a3 = v50;
    *((_QWORD *)a3 + 1) = v43;
    *((_QWORD *)a3 + 2) = v51;
    if (v44)
      operator delete(v44);
  }
  else
  {
    *v42 = v40;
    v43 = v42 + 1;
  }
  *((_QWORD *)a3 + 1) = v43;
  v53 = (double)objc_msgSend(v12, "_crEndsWithHyphen");
  v55 = (double *)*((_QWORD *)a3 + 1);
  v54 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v55 >= v54)
  {
    v57 = *(double **)a3;
    v58 = ((uint64_t)v55 - *(_QWORD *)a3) >> 3;
    v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v60 = v54 - (_QWORD)v57;
    if (v60 >> 2 > v59)
      v59 = v60 >> 2;
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
      v61 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v61 = v59;
    if (v61)
    {
      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v61);
      v57 = *(double **)a3;
      v55 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v62 = 0;
    }
    v63 = (double *)&v62[8 * v58];
    v64 = &v62[8 * v61];
    *v63 = v53;
    v56 = v63 + 1;
    while (v55 != v57)
    {
      v65 = *((_QWORD *)v55-- - 1);
      *((_QWORD *)v63-- - 1) = v65;
    }
    *(_QWORD *)a3 = v63;
    *((_QWORD *)a3 + 1) = v56;
    *((_QWORD *)a3 + 2) = v64;
    if (v57)
      operator delete(v57);
  }
  else
  {
    *v55 = v53;
    v56 = v55 + 1;
  }
  *((_QWORD *)a3 + 1) = v56;
  v66 = (double)objc_msgSend(v12, "_crEndsWithDigit");
  v68 = (double *)*((_QWORD *)a3 + 1);
  v67 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v68 >= v67)
  {
    v70 = *(double **)a3;
    v71 = ((uint64_t)v68 - *(_QWORD *)a3) >> 3;
    v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v73 = v67 - (_QWORD)v70;
    if (v73 >> 2 > v72)
      v72 = v73 >> 2;
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8)
      v74 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v74 = v72;
    if (v74)
    {
      v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v74);
      v70 = *(double **)a3;
      v68 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v75 = 0;
    }
    v76 = (double *)&v75[8 * v71];
    v77 = &v75[8 * v74];
    *v76 = v66;
    v69 = v76 + 1;
    while (v68 != v70)
    {
      v78 = *((_QWORD *)v68-- - 1);
      *((_QWORD *)v76-- - 1) = v78;
    }
    *(_QWORD *)a3 = v76;
    *((_QWORD *)a3 + 1) = v69;
    *((_QWORD *)a3 + 2) = v77;
    if (v70)
      operator delete(v70);
  }
  else
  {
    *v68 = v66;
    v69 = v68 + 1;
  }
  *((_QWORD *)a3 + 1) = v69;
  v79 = (double)objc_msgSend(v12, "_crIsSentencePunctuatedIncludingWhitespace:", 1);
  v81 = (double *)*((_QWORD *)a3 + 1);
  v80 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v81 >= v80)
  {
    v83 = *(double **)a3;
    v84 = ((uint64_t)v81 - *(_QWORD *)a3) >> 3;
    v85 = v84 + 1;
    if ((unint64_t)(v84 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v86 = v80 - (_QWORD)v83;
    if (v86 >> 2 > v85)
      v85 = v86 >> 2;
    if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8)
      v87 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v87 = v85;
    if (v87)
    {
      v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v87);
      v83 = *(double **)a3;
      v81 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v88 = 0;
    }
    v89 = (double *)&v88[8 * v84];
    v90 = &v88[8 * v87];
    *v89 = v79;
    v82 = v89 + 1;
    while (v81 != v83)
    {
      v91 = *((_QWORD *)v81-- - 1);
      *((_QWORD *)v89-- - 1) = v91;
    }
    *(_QWORD *)a3 = v89;
    *((_QWORD *)a3 + 1) = v82;
    *((_QWORD *)a3 + 2) = v90;
    if (v83)
      operator delete(v83);
  }
  else
  {
    *v81 = v79;
    v82 = v81 + 1;
  }
  *((_QWORD *)a3 + 1) = v82;
  v92 = (double)objc_msgSend(v517, "_crStartsWithListItemIndicator");
  v94 = (double *)*((_QWORD *)a3 + 1);
  v93 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v94 >= v93)
  {
    v96 = *(double **)a3;
    v97 = ((uint64_t)v94 - *(_QWORD *)a3) >> 3;
    v98 = v97 + 1;
    if ((unint64_t)(v97 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v99 = v93 - (_QWORD)v96;
    if (v99 >> 2 > v98)
      v98 = v99 >> 2;
    if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFF8)
      v100 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v100 = v98;
    if (v100)
    {
      v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v100);
      v96 = *(double **)a3;
      v94 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v101 = 0;
    }
    v102 = (double *)&v101[8 * v97];
    v103 = &v101[8 * v100];
    *v102 = v92;
    v95 = v102 + 1;
    while (v94 != v96)
    {
      v104 = *((_QWORD *)v94-- - 1);
      *((_QWORD *)v102-- - 1) = v104;
    }
    *(_QWORD *)a3 = v102;
    *((_QWORD *)a3 + 1) = v95;
    *((_QWORD *)a3 + 2) = v103;
    if (v96)
      operator delete(v96);
  }
  else
  {
    *v94 = v92;
    v95 = v94 + 1;
  }
  *((_QWORD *)a3 + 1) = v95;
  v105 = (double)objc_msgSend(v517, "_crStartsWithDigit");
  v107 = (double *)*((_QWORD *)a3 + 1);
  v106 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v107 >= v106)
  {
    v109 = *(double **)a3;
    v110 = ((uint64_t)v107 - *(_QWORD *)a3) >> 3;
    v111 = v110 + 1;
    if ((unint64_t)(v110 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v112 = v106 - (_QWORD)v109;
    if (v112 >> 2 > v111)
      v111 = v112 >> 2;
    if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFF8)
      v113 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v113 = v111;
    if (v113)
    {
      v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v113);
      v109 = *(double **)a3;
      v107 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v114 = 0;
    }
    v115 = (double *)&v114[8 * v110];
    v116 = &v114[8 * v113];
    *v115 = v105;
    v108 = v115 + 1;
    while (v107 != v109)
    {
      v117 = *((_QWORD *)v107-- - 1);
      *((_QWORD *)v115-- - 1) = v117;
    }
    *(_QWORD *)a3 = v115;
    *((_QWORD *)a3 + 1) = v108;
    *((_QWORD *)a3 + 2) = v116;
    if (v109)
      operator delete(v109);
  }
  else
  {
    *v107 = v105;
    v108 = v107 + 1;
  }
  *((_QWORD *)a3 + 1) = v108;
  v118 = (double)objc_msgSend(v517, "_crEndsWithClosingPunctuation");
  v120 = (double *)*((_QWORD *)a3 + 1);
  v119 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v120 >= v119)
  {
    v122 = *(double **)a3;
    v123 = ((uint64_t)v120 - *(_QWORD *)a3) >> 3;
    v124 = v123 + 1;
    if ((unint64_t)(v123 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v125 = v119 - (_QWORD)v122;
    if (v125 >> 2 > v124)
      v124 = v125 >> 2;
    if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFF8)
      v126 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v126 = v124;
    if (v126)
    {
      v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v126);
      v122 = *(double **)a3;
      v120 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v127 = 0;
    }
    v128 = (double *)&v127[8 * v123];
    v129 = &v127[8 * v126];
    *v128 = v118;
    v121 = v128 + 1;
    while (v120 != v122)
    {
      v130 = *((_QWORD *)v120-- - 1);
      *((_QWORD *)v128-- - 1) = v130;
    }
    *(_QWORD *)a3 = v128;
    *((_QWORD *)a3 + 1) = v121;
    *((_QWORD *)a3 + 2) = v129;
    if (v122)
      operator delete(v122);
  }
  else
  {
    *v120 = v118;
    v121 = v120 + 1;
  }
  *((_QWORD *)a3 + 1) = v121;
  v131 = (double)objc_msgSend(v517, "_crEndsWithHyphen");
  v133 = (double *)*((_QWORD *)a3 + 1);
  v132 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v133 >= v132)
  {
    v135 = *(double **)a3;
    v136 = ((uint64_t)v133 - *(_QWORD *)a3) >> 3;
    v137 = v136 + 1;
    if ((unint64_t)(v136 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v138 = v132 - (_QWORD)v135;
    if (v138 >> 2 > v137)
      v137 = v138 >> 2;
    if ((unint64_t)v138 >= 0x7FFFFFFFFFFFFFF8)
      v139 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v139 = v137;
    if (v139)
    {
      v140 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v139);
      v135 = *(double **)a3;
      v133 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v140 = 0;
    }
    v141 = (double *)&v140[8 * v136];
    v142 = &v140[8 * v139];
    *v141 = v131;
    v134 = v141 + 1;
    while (v133 != v135)
    {
      v143 = *((_QWORD *)v133-- - 1);
      *((_QWORD *)v141-- - 1) = v143;
    }
    *(_QWORD *)a3 = v141;
    *((_QWORD *)a3 + 1) = v134;
    *((_QWORD *)a3 + 2) = v142;
    if (v135)
      operator delete(v135);
  }
  else
  {
    *v133 = v131;
    v134 = v133 + 1;
  }
  *((_QWORD *)a3 + 1) = v134;
  v144 = (double)objc_msgSend(v517, "_crEndsWithDigit");
  v146 = (double *)*((_QWORD *)a3 + 1);
  v145 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v146 >= v145)
  {
    v148 = *(double **)a3;
    v149 = ((uint64_t)v146 - *(_QWORD *)a3) >> 3;
    v150 = v149 + 1;
    if ((unint64_t)(v149 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v151 = v145 - (_QWORD)v148;
    if (v151 >> 2 > v150)
      v150 = v151 >> 2;
    if ((unint64_t)v151 >= 0x7FFFFFFFFFFFFFF8)
      v152 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v152 = v150;
    if (v152)
    {
      v153 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v152);
      v148 = *(double **)a3;
      v146 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v153 = 0;
    }
    v154 = (double *)&v153[8 * v149];
    v155 = &v153[8 * v152];
    *v154 = v144;
    v147 = v154 + 1;
    while (v146 != v148)
    {
      v156 = *((_QWORD *)v146-- - 1);
      *((_QWORD *)v154-- - 1) = v156;
    }
    *(_QWORD *)a3 = v154;
    *((_QWORD *)a3 + 1) = v147;
    *((_QWORD *)a3 + 2) = v155;
    if (v148)
      operator delete(v148);
  }
  else
  {
    *v146 = v144;
    v147 = v146 + 1;
  }
  *((_QWORD *)a3 + 1) = v147;
  v157 = (double)objc_msgSend(v517, "_crIsSentencePunctuatedIncludingWhitespace:", 1);
  v159 = (double *)*((_QWORD *)a3 + 1);
  v158 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v159 >= v158)
  {
    v161 = *(double **)a3;
    v162 = ((uint64_t)v159 - *(_QWORD *)a3) >> 3;
    v163 = v162 + 1;
    if ((unint64_t)(v162 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v164 = v158 - (_QWORD)v161;
    if (v164 >> 2 > v163)
      v163 = v164 >> 2;
    if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFF8)
      v165 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v165 = v163;
    if (v165)
    {
      v166 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v165);
      v161 = *(double **)a3;
      v159 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v166 = 0;
    }
    v167 = (double *)&v166[8 * v162];
    v168 = &v166[8 * v165];
    *v167 = v157;
    v160 = v167 + 1;
    while (v159 != v161)
    {
      v169 = *((_QWORD *)v159-- - 1);
      *((_QWORD *)v167-- - 1) = v169;
    }
    *(_QWORD *)a3 = v167;
    *((_QWORD *)a3 + 1) = v160;
    *((_QWORD *)a3 + 2) = v168;
    if (v161)
      operator delete(v161);
  }
  else
  {
    *v159 = v157;
    v160 = v159 + 1;
  }
  *((_QWORD *)a3 + 1) = v160;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("useWordTokens"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = objc_msgSend(v170, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("excludeWhitespace"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("features"));
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_tokenizeString:usingWordUnits:excludeWhitespace:", v12, v171, v173);
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_tokenizeString:usingWordUnits:excludeWhitespace:", v517, v171, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v513 = v174;
  if (objc_msgSend(v519, "count"))
  {
    objc_msgSend(v519, "lastObject");
    v521 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v521 = &stru_1E98DC948;
  }
  if (objc_msgSend(v174, "count"))
  {
    objc_msgSend(v174, "firstObject");
    v520 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    if (!(_DWORD)v171)
      goto LABEL_361;
  }
  else
  {
    v520 = &stru_1E98DC948;
    if (!(_DWORD)v171)
      goto LABEL_361;
  }
  v175 = objc_msgSend(v12, "_crStartsWithUppercase");
  v176 = objc_msgSend(v517, "_crStartsWithUppercase");
  v177 = (double)v175;
  v179 = (double *)*((_QWORD *)a3 + 1);
  v178 = (char *)*((_QWORD *)a3 + 2);
  if (v179 >= (double *)v178)
  {
    v181 = *(double **)a3;
    v182 = ((uint64_t)v179 - *(_QWORD *)a3) >> 3;
    v183 = v182 + 1;
    if ((unint64_t)(v182 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v184 = v178 - (char *)v181;
    if (v184 >> 2 > v183)
      v183 = v184 >> 2;
    if ((unint64_t)v184 >= 0x7FFFFFFFFFFFFFF8)
      v185 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v185 = v183;
    if (v185)
    {
      v186 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v185);
      v181 = *(double **)a3;
      v179 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v186 = 0;
    }
    v187 = (double *)&v186[8 * v182];
    v178 = &v186[8 * v185];
    *v187 = v177;
    v180 = v187 + 1;
    while (v179 != v181)
    {
      v188 = *((_QWORD *)v179-- - 1);
      *((_QWORD *)v187-- - 1) = v188;
    }
    *(_QWORD *)a3 = v187;
    *((_QWORD *)a3 + 1) = v180;
    *((_QWORD *)a3 + 2) = v178;
    if (v181)
    {
      operator delete(v181);
      v178 = *v523;
    }
  }
  else
  {
    *v179 = v177;
    v180 = v179 + 1;
  }
  *((_QWORD *)a3 + 1) = v180;
  v189 = (double)v176;
  if (v180 >= (double *)v178)
  {
    v191 = *(double **)a3;
    v192 = ((uint64_t)v180 - *(_QWORD *)a3) >> 3;
    v193 = v192 + 1;
    if ((unint64_t)(v192 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v194 = v178 - (char *)v191;
    if (v194 >> 2 > v193)
      v193 = v194 >> 2;
    if ((unint64_t)v194 >= 0x7FFFFFFFFFFFFFF8)
      v195 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v195 = v193;
    if (v195)
    {
      v196 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v195);
      v191 = *(double **)a3;
      v180 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v196 = 0;
    }
    v197 = (double *)&v196[8 * v192];
    v178 = &v196[8 * v195];
    *v197 = v189;
    v190 = v197 + 1;
    while (v180 != v191)
    {
      v198 = *((_QWORD *)v180-- - 1);
      *((_QWORD *)v197-- - 1) = v198;
    }
    *(_QWORD *)a3 = v197;
    *((_QWORD *)a3 + 1) = v190;
    *((_QWORD *)a3 + 2) = v178;
    if (v191)
    {
      operator delete(v191);
      v178 = *v523;
    }
  }
  else
  {
    *v180 = v189;
    v190 = v180 + 1;
  }
  *((_QWORD *)a3 + 1) = v190;
  v199 = (double)(v175 & v176);
  if (v190 >= (double *)v178)
  {
    v201 = *(double **)a3;
    v202 = ((uint64_t)v190 - *(_QWORD *)a3) >> 3;
    v203 = v202 + 1;
    if ((unint64_t)(v202 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v204 = v178 - (char *)v201;
    if (v204 >> 2 > v203)
      v203 = v204 >> 2;
    if ((unint64_t)v204 >= 0x7FFFFFFFFFFFFFF8)
      v205 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v205 = v203;
    if (v205)
    {
      v206 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v205);
      v201 = *(double **)a3;
      v190 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v206 = 0;
    }
    v207 = (double *)&v206[8 * v202];
    v208 = &v206[8 * v205];
    *v207 = v199;
    v200 = v207 + 1;
    while (v190 != v201)
    {
      v209 = *((_QWORD *)v190-- - 1);
      *((_QWORD *)v207-- - 1) = v209;
    }
    *(_QWORD *)a3 = v207;
    *((_QWORD *)a3 + 1) = v200;
    *((_QWORD *)a3 + 2) = v208;
    if (v201)
      operator delete(v201);
  }
  else
  {
    *v190 = v199;
    v200 = v190 + 1;
  }
  *((_QWORD *)a3 + 1) = v200;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = (double)objc_msgSend(v516, "_crStartsWithCharacterInSet:", v210);
  v213 = (double *)*((_QWORD *)a3 + 1);
  v212 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v213 >= v212)
  {
    v215 = *(double **)a3;
    v216 = ((uint64_t)v213 - *(_QWORD *)a3) >> 3;
    v217 = v216 + 1;
    if ((unint64_t)(v216 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v218 = v212 - (_QWORD)v215;
    if (v218 >> 2 > v217)
      v217 = v218 >> 2;
    if ((unint64_t)v218 >= 0x7FFFFFFFFFFFFFF8)
      v219 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v219 = v217;
    if (v219)
    {
      v220 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v219);
      v215 = *(double **)a3;
      v213 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v220 = 0;
    }
    v221 = (double *)&v220[8 * v216];
    v222 = &v220[8 * v219];
    *v221 = v211;
    v214 = v221 + 1;
    while (v213 != v215)
    {
      v223 = *((_QWORD *)v213-- - 1);
      *((_QWORD *)v221-- - 1) = v223;
    }
    *(_QWORD *)a3 = v221;
    *((_QWORD *)a3 + 1) = v214;
    *((_QWORD *)a3 + 2) = v222;
    if (v215)
      operator delete(v215);
  }
  else
  {
    *v213 = v211;
    v214 = v213 + 1;
  }
  *((_QWORD *)a3 + 1) = v214;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = (double)objc_msgSend(v517, "_crStartsWithCharacterInSet:", v224);
  v227 = (double *)*((_QWORD *)a3 + 1);
  v226 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v227 >= v226)
  {
    v229 = *(double **)a3;
    v230 = ((uint64_t)v227 - *(_QWORD *)a3) >> 3;
    v231 = v230 + 1;
    if ((unint64_t)(v230 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v232 = v226 - (_QWORD)v229;
    if (v232 >> 2 > v231)
      v231 = v232 >> 2;
    if ((unint64_t)v232 >= 0x7FFFFFFFFFFFFFF8)
      v233 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v233 = v231;
    if (v233)
    {
      v234 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v233);
      v229 = *(double **)a3;
      v227 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v234 = 0;
    }
    v235 = (double *)&v234[8 * v230];
    v236 = &v234[8 * v233];
    *v235 = v225;
    v228 = v235 + 1;
    while (v227 != v229)
    {
      v237 = *((_QWORD *)v227-- - 1);
      *((_QWORD *)v235-- - 1) = v237;
    }
    *(_QWORD *)a3 = v235;
    *((_QWORD *)a3 + 1) = v228;
    *((_QWORD *)a3 + 2) = v236;
    if (v229)
      operator delete(v229);
  }
  else
  {
    *v227 = v225;
    v228 = v227 + 1;
  }
  *((_QWORD *)a3 + 1) = v228;

  v238 = -[__CFString _crStartsWithUppercase](v521, "_crStartsWithUppercase");
  v239 = -[__CFString _crStartsWithUppercase](v520, "_crStartsWithUppercase");
  v240 = (double)v238;
  v242 = (double *)*((_QWORD *)a3 + 1);
  v241 = (char *)*((_QWORD *)a3 + 2);
  if (v242 >= (double *)v241)
  {
    v244 = *(double **)a3;
    v245 = ((uint64_t)v242 - *(_QWORD *)a3) >> 3;
    v246 = v245 + 1;
    if ((unint64_t)(v245 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v247 = v241 - (char *)v244;
    if (v247 >> 2 > v246)
      v246 = v247 >> 2;
    if ((unint64_t)v247 >= 0x7FFFFFFFFFFFFFF8)
      v248 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v248 = v246;
    if (v248)
    {
      v249 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v248);
      v244 = *(double **)a3;
      v242 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v249 = 0;
    }
    v250 = (double *)&v249[8 * v245];
    v241 = &v249[8 * v248];
    *v250 = v240;
    v243 = v250 + 1;
    while (v242 != v244)
    {
      v251 = *((_QWORD *)v242-- - 1);
      *((_QWORD *)v250-- - 1) = v251;
    }
    *(_QWORD *)a3 = v250;
    *((_QWORD *)a3 + 1) = v243;
    *((_QWORD *)a3 + 2) = v241;
    if (v244)
    {
      operator delete(v244);
      v241 = *v523;
    }
  }
  else
  {
    *v242 = v240;
    v243 = v242 + 1;
  }
  *((_QWORD *)a3 + 1) = v243;
  v252 = (double)(v238 & (v239 ^ 1));
  if (v243 >= (double *)v241)
  {
    v254 = *(double **)a3;
    v255 = ((uint64_t)v243 - *(_QWORD *)a3) >> 3;
    v256 = v255 + 1;
    if ((unint64_t)(v255 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v257 = v241 - (char *)v254;
    if (v257 >> 2 > v256)
      v256 = v257 >> 2;
    if ((unint64_t)v257 >= 0x7FFFFFFFFFFFFFF8)
      v258 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v258 = v256;
    if (v258)
    {
      v259 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v258);
      v254 = *(double **)a3;
      v243 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v259 = 0;
    }
    v260 = (double *)&v259[8 * v255];
    v241 = &v259[8 * v258];
    *v260 = v252;
    v253 = v260 + 1;
    while (v243 != v254)
    {
      v261 = *((_QWORD *)v243-- - 1);
      *((_QWORD *)v260-- - 1) = v261;
    }
    *(_QWORD *)a3 = v260;
    *((_QWORD *)a3 + 1) = v253;
    *((_QWORD *)a3 + 2) = v241;
    if (v254)
    {
      operator delete(v254);
      v241 = *v523;
    }
  }
  else
  {
    *v243 = v252;
    v253 = v243 + 1;
  }
  *((_QWORD *)a3 + 1) = v253;
  v262 = (double)(v238 & v239);
  if (v253 >= (double *)v241)
  {
    v264 = *(double **)a3;
    v265 = ((uint64_t)v253 - *(_QWORD *)a3) >> 3;
    v266 = v265 + 1;
    if ((unint64_t)(v265 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v267 = v241 - (char *)v264;
    if (v267 >> 2 > v266)
      v266 = v267 >> 2;
    if ((unint64_t)v267 >= 0x7FFFFFFFFFFFFFF8)
      v268 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v268 = v266;
    if (v268)
    {
      v269 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v268);
      v264 = *(double **)a3;
      v253 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v269 = 0;
    }
    v270 = (double *)&v269[8 * v265];
    v271 = &v269[8 * v268];
    *v270 = v262;
    v263 = v270 + 1;
    while (v253 != v264)
    {
      v272 = *((_QWORD *)v253-- - 1);
      *((_QWORD *)v270-- - 1) = v272;
    }
    *(_QWORD *)a3 = v270;
    *((_QWORD *)a3 + 1) = v263;
    *((_QWORD *)a3 + 2) = v271;
    if (v264)
      operator delete(v264);
  }
  else
  {
    *v253 = v262;
    v263 = v253 + 1;
  }
  v13 = v514;
  *((_QWORD *)a3 + 1) = v263;
  v273 = (double)-[__CFString _crIsAllCaps](v521, "_crIsAllCaps");
  v275 = (double *)*((_QWORD *)a3 + 1);
  v274 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v275 >= v274)
  {
    v277 = *(double **)a3;
    v278 = ((uint64_t)v275 - *(_QWORD *)a3) >> 3;
    v279 = v278 + 1;
    if ((unint64_t)(v278 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v280 = v274 - (_QWORD)v277;
    if (v280 >> 2 > v279)
      v279 = v280 >> 2;
    if ((unint64_t)v280 >= 0x7FFFFFFFFFFFFFF8)
      v281 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v281 = v279;
    if (v281)
    {
      v282 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v281);
      v277 = *(double **)a3;
      v275 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v282 = 0;
    }
    v283 = (double *)&v282[8 * v278];
    v284 = &v282[8 * v281];
    *v283 = v273;
    v276 = v283 + 1;
    while (v275 != v277)
    {
      v285 = *((_QWORD *)v275-- - 1);
      *((_QWORD *)v283-- - 1) = v285;
    }
    *(_QWORD *)a3 = v283;
    *((_QWORD *)a3 + 1) = v276;
    *((_QWORD *)a3 + 2) = v284;
    if (v277)
      operator delete(v277);
  }
  else
  {
    *v275 = v273;
    v276 = v275 + 1;
  }
  *((_QWORD *)a3 + 1) = v276;
  v286 = (double)-[__CFString _crIsAllCaps](v520, "_crIsAllCaps");
  v288 = (double *)*((_QWORD *)a3 + 1);
  v287 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v288 >= v287)
  {
    v290 = *(double **)a3;
    v291 = ((uint64_t)v288 - *(_QWORD *)a3) >> 3;
    v292 = v291 + 1;
    if ((unint64_t)(v291 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v293 = v287 - (_QWORD)v290;
    if (v293 >> 2 > v292)
      v292 = v293 >> 2;
    if ((unint64_t)v293 >= 0x7FFFFFFFFFFFFFF8)
      v294 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v294 = v292;
    if (v294)
    {
      v295 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v294);
      v290 = *(double **)a3;
      v288 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v295 = 0;
    }
    v296 = (double *)&v295[8 * v291];
    v297 = &v295[8 * v294];
    *v296 = v286;
    v289 = v296 + 1;
    while (v288 != v290)
    {
      v298 = *((_QWORD *)v288-- - 1);
      *((_QWORD *)v296-- - 1) = v298;
    }
    *(_QWORD *)a3 = v296;
    *((_QWORD *)a3 + 1) = v289;
    *((_QWORD *)a3 + 2) = v297;
    if (v290)
      operator delete(v290);
  }
  else
  {
    *v288 = v286;
    v289 = v288 + 1;
  }
  *((_QWORD *)a3 + 1) = v289;
LABEL_361:
  v299 = objc_msgSend(v519, "count");
  v300 = objc_msgSend(v174, "count");
  v301 = (double)v299 / 20.0;
  v302 = (double *)*((_QWORD *)a3 + 1);
  v303 = (char *)*((_QWORD *)a3 + 2);
  if (v302 >= (double *)v303)
  {
    v305 = *(double **)a3;
    v306 = ((uint64_t)v302 - *(_QWORD *)a3) >> 3;
    v307 = v306 + 1;
    if ((unint64_t)(v306 + 1) >> 61)
      goto LABEL_694;
    if ((v303 - (char *)v305) >> 2 > v307)
      v307 = (v303 - (char *)v305) >> 2;
    if ((unint64_t)(v303 - (char *)v305) >= 0x7FFFFFFFFFFFFFF8)
      v308 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v308 = v307;
    if (v308)
    {
      v309 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v308);
      v305 = *(double **)a3;
      v302 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v309 = 0;
    }
    v310 = (double *)&v309[8 * v306];
    v303 = &v309[8 * v308];
    *v310 = v301;
    v304 = v310 + 1;
    while (v302 != v305)
    {
      v311 = *((_QWORD *)v302-- - 1);
      *((_QWORD *)v310-- - 1) = v311;
    }
    *(_QWORD *)a3 = v310;
    *((_QWORD *)a3 + 1) = v304;
    *((_QWORD *)a3 + 2) = v303;
    if (v305)
    {
      operator delete(v305);
      v303 = *v523;
    }
  }
  else
  {
    *v302 = v301;
    v304 = v302 + 1;
  }
  v312 = (double)v300 / 20.0;
  *((_QWORD *)a3 + 1) = v304;
  if (v304 < (double *)v303)
  {
    *v304 = v312;
    v313 = v304 + 1;
    goto LABEL_393;
  }
  v314 = *(double **)a3;
  v315 = ((uint64_t)v304 - *(_QWORD *)a3) >> 3;
  v316 = v315 + 1;
  if ((unint64_t)(v315 + 1) >> 61)
LABEL_694:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  if ((v303 - (char *)v314) >> 2 > v316)
    v316 = (v303 - (char *)v314) >> 2;
  if ((unint64_t)(v303 - (char *)v314) >= 0x7FFFFFFFFFFFFFF8)
    v317 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v317 = v316;
  if (v317)
  {
    v318 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v317);
    v314 = *(double **)a3;
    v304 = (double *)*((_QWORD *)a3 + 1);
  }
  else
  {
    v318 = 0;
  }
  v319 = (double *)&v318[8 * v315];
  v303 = &v318[8 * v317];
  *v319 = v312;
  v313 = v319 + 1;
  while (v304 != v314)
  {
    v320 = *((_QWORD *)v304-- - 1);
    *((_QWORD *)v319-- - 1) = v320;
  }
  *(_QWORD *)a3 = v319;
  *((_QWORD *)a3 + 1) = v313;
  *((_QWORD *)a3 + 2) = v303;
  if (v314)
  {
    operator delete(v314);
    v303 = *v523;
  }
LABEL_393:
  *((_QWORD *)a3 + 1) = v313;
  v321 = v301 + v312;
  if (v313 >= (double *)v303)
  {
    v323 = *(double **)a3;
    v324 = ((uint64_t)v313 - *(_QWORD *)a3) >> 3;
    v325 = v324 + 1;
    if ((unint64_t)(v324 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v303 - (char *)v323) >> 2 > v325)
      v325 = (v303 - (char *)v323) >> 2;
    if ((unint64_t)(v303 - (char *)v323) >= 0x7FFFFFFFFFFFFFF8)
      v326 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v326 = v325;
    if (v326)
    {
      v327 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v326);
      v323 = *(double **)a3;
      v313 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v327 = 0;
    }
    v328 = (double *)&v327[8 * v324];
    v303 = &v327[8 * v326];
    *v328 = v321;
    v322 = v328 + 1;
    while (v313 != v323)
    {
      v329 = *((_QWORD *)v313-- - 1);
      *((_QWORD *)v328-- - 1) = v329;
    }
    *(_QWORD *)a3 = v328;
    *((_QWORD *)a3 + 1) = v322;
    *((_QWORD *)a3 + 2) = v303;
    if (v323)
    {
      operator delete(v323);
      v303 = *v523;
    }
  }
  else
  {
    *v313 = v321;
    v322 = v313 + 1;
  }
  *((_QWORD *)a3 + 1) = v322;
  v330 = v312 - v301;
  if (v322 >= (double *)v303)
  {
    v332 = *(double **)a3;
    v333 = ((uint64_t)v322 - *(_QWORD *)a3) >> 3;
    v334 = v333 + 1;
    if ((unint64_t)(v333 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v303 - (char *)v332) >> 2 > v334)
      v334 = (v303 - (char *)v332) >> 2;
    if ((unint64_t)(v303 - (char *)v332) >= 0x7FFFFFFFFFFFFFF8)
      v335 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v335 = v334;
    if (v335)
    {
      v336 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v335);
      v332 = *(double **)a3;
      v322 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v336 = 0;
    }
    v337 = (double *)&v336[8 * v333];
    v303 = &v336[8 * v335];
    *v337 = v330;
    v331 = v337 + 1;
    while (v322 != v332)
    {
      v338 = *((_QWORD *)v322-- - 1);
      *((_QWORD *)v337-- - 1) = v338;
    }
    *(_QWORD *)a3 = v337;
    *((_QWORD *)a3 + 1) = v331;
    *((_QWORD *)a3 + 2) = v303;
    if (v332)
    {
      operator delete(v332);
      v303 = *v523;
    }
  }
  else
  {
    *v322 = v330;
    v331 = v322 + 1;
  }
  *((_QWORD *)a3 + 1) = v331;
  v339 = v301 / v312;
  if (v312 <= 2.22044605e-16)
    v339 = 0.0;
  v340 = 1.0 / (exp(-v339) + 1.0);
  if (v331 >= (double *)v303)
  {
    v342 = *(double **)a3;
    v343 = ((uint64_t)v331 - *(_QWORD *)a3) >> 3;
    v344 = v343 + 1;
    if ((unint64_t)(v343 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v303 - (char *)v342) >> 2 > v344)
      v344 = (v303 - (char *)v342) >> 2;
    if ((unint64_t)(v303 - (char *)v342) >= 0x7FFFFFFFFFFFFFF8)
      v345 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v345 = v344;
    if (v345)
    {
      v346 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v345);
      v342 = *(double **)a3;
      v331 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v346 = 0;
    }
    v347 = (double *)&v346[8 * v343];
    v303 = &v346[8 * v345];
    *v347 = v340;
    v341 = v347 + 1;
    while (v331 != v342)
    {
      v348 = *((_QWORD *)v331-- - 1);
      *((_QWORD *)v347-- - 1) = v348;
    }
    *(_QWORD *)a3 = v347;
    *((_QWORD *)a3 + 1) = v341;
    *((_QWORD *)a3 + 2) = v303;
    if (v342)
    {
      operator delete(v342);
      v303 = *v523;
    }
  }
  else
  {
    *v331 = v340;
    v341 = v331 + 1;
  }
  *((_QWORD *)a3 + 1) = v341;
  v349 = v312 / v301;
  if (v301 <= 2.22044605e-16)
    v349 = 0.0;
  v350 = 1.0 / (exp(-v349) + 1.0);
  if (v341 >= (double *)v303)
  {
    v352 = *(double **)a3;
    v353 = ((uint64_t)v341 - *(_QWORD *)a3) >> 3;
    v354 = v353 + 1;
    if ((unint64_t)(v353 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if ((v303 - (char *)v352) >> 2 > v354)
      v354 = (v303 - (char *)v352) >> 2;
    if ((unint64_t)(v303 - (char *)v352) >= 0x7FFFFFFFFFFFFFF8)
      v355 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v355 = v354;
    if (v355)
    {
      v356 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v355);
      v352 = *(double **)a3;
      v341 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v356 = 0;
    }
    v357 = (double *)&v356[8 * v353];
    v358 = &v356[8 * v355];
    *v357 = v350;
    v351 = v357 + 1;
    while (v341 != v352)
    {
      v359 = *((_QWORD *)v341-- - 1);
      *((_QWORD *)v357-- - 1) = v359;
    }
    *(_QWORD *)a3 = v357;
    *((_QWORD *)a3 + 1) = v351;
    *((_QWORD *)a3 + 2) = v358;
    if (v352)
      operator delete(v352);
  }
  else
  {
    *v341 = v350;
    v351 = v341 + 1;
  }
  *((_QWORD *)a3 + 1) = v351;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("maxTokenCountForLengthFeatures"));
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i <= (int)objc_msgSend(v518, "intValue"); ++i)
  {
    if (objc_msgSend(v519, "count") == i)
      v361 = 1.0;
    else
      v361 = 0.0;
    v363 = (double *)*((_QWORD *)a3 + 1);
    v362 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v363 >= v362)
    {
      v365 = *(double **)a3;
      v366 = ((uint64_t)v363 - *(_QWORD *)a3) >> 3;
      v367 = v366 + 1;
      if ((unint64_t)(v366 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v368 = v362 - (_QWORD)v365;
      if (v368 >> 2 > v367)
        v367 = v368 >> 2;
      if ((unint64_t)v368 >= 0x7FFFFFFFFFFFFFF8)
        v369 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v369 = v367;
      if (v369)
      {
        v370 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v369);
        v365 = *(double **)a3;
        v363 = (double *)*((_QWORD *)a3 + 1);
      }
      else
      {
        v370 = 0;
      }
      v371 = (double *)&v370[8 * v366];
      *v371 = v361;
      v364 = v371 + 1;
      while (v363 != v365)
      {
        v372 = *((_QWORD *)v363-- - 1);
        *((_QWORD *)v371-- - 1) = v372;
      }
      *(_QWORD *)a3 = v371;
      *((_QWORD *)a3 + 1) = v364;
      *((_QWORD *)a3 + 2) = &v370[8 * v369];
      if (v365)
        operator delete(v365);
    }
    else
    {
      *v363 = v361;
      v364 = v363 + 1;
    }
    *((_QWORD *)a3 + 1) = v364;
    if (objc_msgSend(v174, "count") == i)
      v373 = 1.0;
    else
      v373 = 0.0;
    v375 = (double *)*((_QWORD *)a3 + 1);
    v374 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v375 >= v374)
    {
      v377 = *(double **)a3;
      v378 = ((uint64_t)v375 - *(_QWORD *)a3) >> 3;
      v379 = v378 + 1;
      if ((unint64_t)(v378 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v380 = v374 - (_QWORD)v377;
      if (v380 >> 2 > v379)
        v379 = v380 >> 2;
      if ((unint64_t)v380 >= 0x7FFFFFFFFFFFFFF8)
        v381 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v381 = v379;
      if (v381)
      {
        v382 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v381);
        v377 = *(double **)a3;
        v375 = (double *)*((_QWORD *)a3 + 1);
      }
      else
      {
        v382 = 0;
      }
      v383 = (double *)&v382[8 * v378];
      *v383 = v373;
      v376 = v383 + 1;
      while (v375 != v377)
      {
        v384 = *((_QWORD *)v375-- - 1);
        *((_QWORD *)v383-- - 1) = v384;
      }
      *(_QWORD *)a3 = v383;
      *((_QWORD *)a3 + 1) = v376;
      *((_QWORD *)a3 + 2) = &v382[8 * v381];
      if (v377)
        operator delete(v377);
    }
    else
    {
      *v375 = v373;
      v376 = v375 + 1;
    }
    *((_QWORD *)a3 + 1) = v376;
  }
  v385 = objc_msgSend(v516, "length");
  v386 = objc_msgSend(v517, "length");
  if (v385 < 1)
    v387 = 0;
  else
    v387 = (_anonymous_namespace_ *)objc_msgSend(v516, "characterAtIndex:", v385 - 1);
  if (v386 < 1)
    c = 0;
  else
    c = objc_msgSend(v517, "characterAtIndex:", 0);
  v512 = a1;
  v390 = 0;
  v511 = v171;
  if ((_DWORD)v171)
    v391 = 6;
  else
    v391 = 12;
  v392 = (double *)*((_QWORD *)a3 + 1);
  do
  {
    if (v388 == v390)
      v393 = 1.0;
    else
      v393 = 0.0;
    v394 = (double *)*v523;
    if (v392 >= (double *)*v523)
    {
      v396 = *(double **)a3;
      v397 = ((uint64_t)v392 - *(_QWORD *)a3) >> 3;
      v398 = v397 + 1;
      if ((unint64_t)(v397 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v399 = (char *)v394 - (char *)v396;
      if (v399 >> 2 > v398)
        v398 = v399 >> 2;
      if ((unint64_t)v399 >= 0x7FFFFFFFFFFFFFF8)
        v400 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v400 = v398;
      if (v400)
      {
        v401 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v400);
        v396 = *(double **)a3;
        v392 = (double *)*((_QWORD *)a3 + 1);
      }
      else
      {
        v401 = 0;
      }
      v402 = (double *)&v401[8 * v397];
      *v402 = v393;
      v395 = v402 + 1;
      while (v392 != v396)
      {
        v403 = *((_QWORD *)v392-- - 1);
        *((_QWORD *)v402-- - 1) = v403;
      }
      v394 = (double *)&v401[8 * v400];
      *(_QWORD *)a3 = v402;
      *((_QWORD *)a3 + 1) = v395;
      *((_QWORD *)a3 + 2) = v394;
      if (v396)
      {
        operator delete(v396);
        v394 = (double *)*v523;
      }
    }
    else
    {
      *v392 = v393;
      v395 = v392 + 1;
    }
    *((_QWORD *)a3 + 1) = v395;
    if (v389 == v390)
      v404 = 1.0;
    else
      v404 = 0.0;
    if (v395 >= v394)
    {
      v405 = *(double **)a3;
      v406 = ((uint64_t)v395 - *(_QWORD *)a3) >> 3;
      v407 = v406 + 1;
      if ((unint64_t)(v406 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v408 = (char *)v394 - (char *)v405;
      if (v408 >> 2 > v407)
        v407 = v408 >> 2;
      if ((unint64_t)v408 >= 0x7FFFFFFFFFFFFFF8)
        v409 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v409 = v407;
      if (v409)
      {
        v410 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v409);
        v405 = *(double **)a3;
        v395 = (double *)*((_QWORD *)a3 + 1);
      }
      else
      {
        v410 = 0;
      }
      v411 = (double *)&v410[8 * v406];
      *v411 = v404;
      v392 = v411 + 1;
      while (v395 != v405)
      {
        v412 = *((_QWORD *)v395-- - 1);
        *((_QWORD *)v411-- - 1) = v412;
      }
      *(_QWORD *)a3 = v411;
      *((_QWORD *)a3 + 1) = v392;
      *((_QWORD *)a3 + 2) = &v410[8 * v409];
      if (v405)
        operator delete(v405);
    }
    else
    {
      *v395 = v404;
      v392 = v395 + 1;
    }
    *((_QWORD *)a3 + 1) = v392;
    ++v390;
  }
  while (v390 != v391);
  for (j = 0; j != v391; ++j)
  {
    for (k = 0; k != v391; ++k)
    {
      v416 = v388 == j && v389 == k;
      v417 = (double)v416;
      if (v392 >= (double *)*v523)
      {
        v418 = *(double **)a3;
        v419 = ((uint64_t)v392 - *(_QWORD *)a3) >> 3;
        v420 = v419 + 1;
        if ((unint64_t)(v419 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v421 = *v523 - (char *)v418;
        if (v421 >> 2 > v420)
          v420 = v421 >> 2;
        if ((unint64_t)v421 >= 0x7FFFFFFFFFFFFFF8)
          v422 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v422 = v420;
        if (v422)
        {
          v423 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v422);
          v418 = *(double **)a3;
          v392 = (double *)*((_QWORD *)a3 + 1);
        }
        else
        {
          v423 = 0;
        }
        v424 = (double *)&v423[8 * v419];
        *v424 = v417;
        v425 = v424 + 1;
        while (v392 != v418)
        {
          v426 = *((_QWORD *)v392-- - 1);
          *((_QWORD *)v424-- - 1) = v426;
        }
        *(_QWORD *)a3 = v424;
        *((_QWORD *)a3 + 1) = v425;
        *((_QWORD *)a3 + 2) = &v423[8 * v422];
        if (v418)
          operator delete(v418);
        v392 = v425;
      }
      else
      {
        *v392++ = v417;
      }
      *((_QWORD *)a3 + 1) = v392;
    }
  }
  v538 = 0u;
  v539 = 0u;
  v536 = 0u;
  v537 = 0u;
  objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("L1C"));
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v428 = objc_msgSend(v427, "countByEnumeratingWithState:objects:count:", &v536, v543, 16);
  if (v428)
  {
    v429 = *(_QWORD *)v537;
    do
    {
      for (m = 0; m != v428; ++m)
      {
        if (*(_QWORD *)v537 != v429)
          objc_enumerationMutation(v427);
        v431 = *(void **)(*((_QWORD *)&v536 + 1) + 8 * m);
        v432 = u_isdigit((UChar32)v387);
        v433 = objc_msgSend(v431, "characterAtIndex:", 0);
        if (v432)
          v434 = 49;
        else
          v434 = (int)v387;
        if (v434 == v433)
          v435 = 1.0;
        else
          v435 = 0.0;
        v437 = (double *)*((_QWORD *)a3 + 1);
        v436 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v437 >= v436)
        {
          v439 = *(double **)a3;
          v440 = ((uint64_t)v437 - *(_QWORD *)a3) >> 3;
          v441 = v440 + 1;
          if ((unint64_t)(v440 + 1) >> 61)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v442 = v436 - (_QWORD)v439;
          if (v442 >> 2 > v441)
            v441 = v442 >> 2;
          if ((unint64_t)v442 >= 0x7FFFFFFFFFFFFFF8)
            v443 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v443 = v441;
          if (v443)
          {
            v444 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v443);
            v439 = *(double **)a3;
            v437 = (double *)*((_QWORD *)a3 + 1);
          }
          else
          {
            v444 = 0;
          }
          v445 = (double *)&v444[8 * v440];
          *v445 = v435;
          v438 = v445 + 1;
          while (v437 != v439)
          {
            v446 = *((_QWORD *)v437-- - 1);
            *((_QWORD *)v445-- - 1) = v446;
          }
          *(_QWORD *)a3 = v445;
          *((_QWORD *)a3 + 1) = v438;
          *((_QWORD *)a3 + 2) = &v444[8 * v443];
          if (v439)
            operator delete(v439);
        }
        else
        {
          *v437 = v435;
          v438 = v437 + 1;
        }
        *((_QWORD *)a3 + 1) = v438;
      }
      v428 = objc_msgSend(v427, "countByEnumeratingWithState:objects:count:", &v536, v543, 16);
    }
    while (v428);
  }

  v534 = 0u;
  v535 = 0u;
  v532 = 0u;
  v533 = 0u;
  objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("R1C"));
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  v448 = objc_msgSend(v447, "countByEnumeratingWithState:objects:count:", &v532, v542, 16);
  if (v448)
  {
    v449 = *(_QWORD *)v533;
    do
    {
      for (n = 0; n != v448; ++n)
      {
        if (*(_QWORD *)v533 != v449)
          objc_enumerationMutation(v447);
        v451 = *(void **)(*((_QWORD *)&v532 + 1) + 8 * n);
        v452 = u_isdigit(c);
        v453 = objc_msgSend(v451, "characterAtIndex:", 0);
        v454 = c;
        if (v452)
          v454 = 49;
        if (v454 == v453)
          v455 = 1.0;
        else
          v455 = 0.0;
        v457 = (double *)*((_QWORD *)a3 + 1);
        v456 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v457 >= v456)
        {
          v459 = *(double **)a3;
          v460 = ((uint64_t)v457 - *(_QWORD *)a3) >> 3;
          v461 = v460 + 1;
          if ((unint64_t)(v460 + 1) >> 61)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v462 = v456 - (_QWORD)v459;
          if (v462 >> 2 > v461)
            v461 = v462 >> 2;
          if ((unint64_t)v462 >= 0x7FFFFFFFFFFFFFF8)
            v463 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v463 = v461;
          if (v463)
          {
            v464 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v463);
            v459 = *(double **)a3;
            v457 = (double *)*((_QWORD *)a3 + 1);
          }
          else
          {
            v464 = 0;
          }
          v465 = (double *)&v464[8 * v460];
          *v465 = v455;
          v458 = v465 + 1;
          while (v457 != v459)
          {
            v466 = *((_QWORD *)v457-- - 1);
            *((_QWORD *)v465-- - 1) = v466;
          }
          *(_QWORD *)a3 = v465;
          *((_QWORD *)a3 + 1) = v458;
          *((_QWORD *)a3 + 2) = &v464[8 * v463];
          if (v459)
            operator delete(v459);
        }
        else
        {
          *v457 = v455;
          v458 = v457 + 1;
        }
        *((_QWORD *)a3 + 1) = v458;
      }
      v448 = objc_msgSend(v447, "countByEnumeratingWithState:objects:count:", &v532, v542, 16);
    }
    while (v448);
  }

  if (v511)
  {
    v530 = 0u;
    v531 = 0u;
    v528 = 0u;
    v529 = 0u;
    objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("L1W"));
    v467 = (void *)objc_claimAutoreleasedReturnValue();
    v468 = objc_msgSend(v467, "countByEnumeratingWithState:objects:count:", &v528, v541, 16);
    if (v468)
    {
      v469 = *(_QWORD *)v529;
      do
      {
        for (ii = 0; ii != v468; ++ii)
        {
          if (*(_QWORD *)v529 != v469)
            objc_enumerationMutation(v467);
          v471 = *(void **)(*((_QWORD *)&v528 + 1) + 8 * ii);
          -[__CFString lowercaseString](v521, "lowercaseString");
          v472 = (void *)objc_claimAutoreleasedReturnValue();
          v473 = (double)objc_msgSend(v471, "isEqualToString:", v472);
          v475 = (double *)*((_QWORD *)a3 + 1);
          v474 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v475 >= v474)
          {
            v477 = *(double **)a3;
            v478 = ((uint64_t)v475 - *(_QWORD *)a3) >> 3;
            v479 = v478 + 1;
            if ((unint64_t)(v478 + 1) >> 61)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v480 = v474 - (_QWORD)v477;
            if (v480 >> 2 > v479)
              v479 = v480 >> 2;
            if ((unint64_t)v480 >= 0x7FFFFFFFFFFFFFF8)
              v481 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v481 = v479;
            if (v481)
            {
              v482 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v481);
              v477 = *(double **)a3;
              v475 = (double *)*((_QWORD *)a3 + 1);
            }
            else
            {
              v482 = 0;
            }
            v483 = (double *)&v482[8 * v478];
            *v483 = v473;
            v476 = v483 + 1;
            while (v475 != v477)
            {
              v484 = *((_QWORD *)v475-- - 1);
              *((_QWORD *)v483-- - 1) = v484;
            }
            *(_QWORD *)a3 = v483;
            *((_QWORD *)a3 + 1) = v476;
            *((_QWORD *)a3 + 2) = &v482[8 * v481];
            if (v477)
              operator delete(v477);
          }
          else
          {
            *v475 = v473;
            v476 = v475 + 1;
          }
          *((_QWORD *)a3 + 1) = v476;

        }
        v468 = objc_msgSend(v467, "countByEnumeratingWithState:objects:count:", &v528, v541, 16);
      }
      while (v468);
    }

    v526 = 0u;
    v527 = 0u;
    v524 = 0u;
    v525 = 0u;
    objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("R1W"));
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    v486 = objc_msgSend(v485, "countByEnumeratingWithState:objects:count:", &v524, v540, 16);
    if (v486)
    {
      v487 = *(_QWORD *)v525;
      do
      {
        for (jj = 0; jj != v486; ++jj)
        {
          if (*(_QWORD *)v525 != v487)
            objc_enumerationMutation(v485);
          v489 = *(void **)(*((_QWORD *)&v524 + 1) + 8 * jj);
          -[__CFString lowercaseString](v520, "lowercaseString");
          v490 = (void *)objc_claimAutoreleasedReturnValue();
          v491 = (double)objc_msgSend(v489, "isEqualToString:", v490);
          v493 = (double *)*((_QWORD *)a3 + 1);
          v492 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v493 >= v492)
          {
            v495 = *(double **)a3;
            v496 = ((uint64_t)v493 - *(_QWORD *)a3) >> 3;
            v497 = v496 + 1;
            if ((unint64_t)(v496 + 1) >> 61)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v498 = v492 - (_QWORD)v495;
            if (v498 >> 2 > v497)
              v497 = v498 >> 2;
            if ((unint64_t)v498 >= 0x7FFFFFFFFFFFFFF8)
              v499 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v499 = v497;
            if (v499)
            {
              v500 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v499);
              v495 = *(double **)a3;
              v493 = (double *)*((_QWORD *)a3 + 1);
            }
            else
            {
              v500 = 0;
            }
            v501 = (double *)&v500[8 * v496];
            *v501 = v491;
            v494 = v501 + 1;
            while (v493 != v495)
            {
              v502 = *((_QWORD *)v493-- - 1);
              *((_QWORD *)v501-- - 1) = v502;
            }
            *(_QWORD *)a3 = v501;
            *((_QWORD *)a3 + 1) = v494;
            *((_QWORD *)a3 + 2) = &v500[8 * v499];
            if (v495)
              operator delete(v495);
          }
          else
          {
            *v493 = v491;
            v494 = v493 + 1;
          }
          *((_QWORD *)a3 + 1) = v494;

        }
        v486 = objc_msgSend(v485, "countByEnumeratingWithState:objects:count:", &v524, v540, 16);
      }
      while (v486);
    }

    objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("LnW"));
    v503 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("RnW"));
    v504 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("LnC"));
    v503 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("RnC"));
    v504 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v505 = v504;

  objc_msgSend(v514, "objectForKeyedSubscript:", CFSTR("leftBagOfTokensContextSize"));
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v514, "objectForKeyedSubscript:", CFSTR("rightBagOfTokensContextSize"));
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v508 = objc_msgSend(v519, "count");
  v509 = objc_msgSend(v506, "intValue");
  v510 = objc_msgSend(v507, "intValue");
  objc_msgSend(v512, "_extractBagOfTokensFeaturesTo:vocabulary:tokens:beginIndex:endIndex:", a3, v503, v519, v508 - v509, objc_msgSend(v519, "count"));
  objc_msgSend(v512, "_extractBagOfTokensFeaturesTo:vocabulary:tokens:beginIndex:endIndex:", a3, v505, v513, 0, v510);

}

+ (vector<double,)extractFeatureVectorForLocale:(id)a2 string1:(SEL)a3 string2:(id)a4 evaluation:(id)a5 imageSize:(id)a6
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  NSObject *v22;
  vector<double, std::allocator<double>> *result;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<double>::reserve((void **)&retstr->__begin_, 0x12CuLL);
  +[CRLineWrappingClassifier modelLocaleForLocale:](CRLineWrappingClassifier, "modelLocaleForLocale:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  lineWrappingConfig();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("classifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = +[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v13)
       || +[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v13)
       || +[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v13);
    objc_msgSend(a2, "_extractLanguageModelFeaturesTo:evaluation:", retstr, v16);
    objc_msgSend(a2, "_extractGeometricFeaturesTo:evaluation:", retstr, v16);
    objc_msgSend(a2, "_extractEvaluatedFeaturesTo:evaluation:", retstr, v16);
    objc_msgSend(a2, "_extractLexicalFeaturesTo:string1:string2:configuration:forCJK:", retstr, v14, v15, v20, v21);
  }
  else
  {
    CROSLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v24 = 138412290;
      v25 = v13;
      _os_log_impl(&dword_1D4FB8000, v22, OS_LOG_TYPE_FAULT, "Failed to load classifier config for locale %@", (uint8_t *)&v24, 0xCu);
    }

  }
  return result;
}

+ (id)nsArrayFromVector:(const void *)a3
{
  void *v4;
  double *v5;
  double *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double **)a3;
  v6 = (double *)*((_QWORD *)a3 + 1);
  if (*(double **)a3 != v6)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
    }
    while (v5 != v6);
  }
  return v4;
}

+ (id)multiArrayFromVector:(const void *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C9E970]);
  v10[0] = &unk_1E9926A60;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithShape:dataType:error:", v6, 65600, 0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CRWrappingClassifierFeatureExtractor_multiArrayFromVector___block_invoke;
  v9[3] = &__block_descriptor_40_e24_v32__0_v8q16__NSArray_24l;
  v9[4] = a3;
  objc_msgSend(v7, "getMutableBytesWithHandler:", v9);
  return v7;
}

_QWORD *__61__CRWrappingClassifierFeatureExtractor_multiArrayFromVector___block_invoke(_QWORD *result, void *__dst)
{
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;

  v2 = result[4];
  v3 = *(_BYTE **)v2;
  v4 = *(_BYTE **)(v2 + 8);
  if (v4 != v3)
    return memmove(__dst, v3, v4 - v3);
  return result;
}

+ (id)extractFeaturesForLocale:(id)a3 textFeature:(id)a4 lastFeature:(id)a5 imageSize:(CGSize)a6 revision:(unint64_t)a7
{
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  CRLineWrappingParameters *v15;
  void *v16;
  void *v17;
  CRLineWrappingParameters *v18;
  CRLineWrappingContext *v19;
  void *v20;
  void *v21;
  CRLineWrappingContext *v22;
  CRWrappingEvaluationResult *v23;
  CRWrappingEvaluationResult *v24;
  void *v25;
  void *v26;
  void *v27;
  void *__p[3];

  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = [CRLineWrappingParameters alloc];
  objc_msgSend(v13, "locale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "languageIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CRLineWrappingParameters initWithLocale:](v15, "initWithLocale:", v17);

  v19 = [CRLineWrappingContext alloc];
  objc_msgSend(v14, "locale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "languageIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CRLineWrappingContext initWithLocale:](v19, "initWithLocale:", v21);

  v23 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:]([CRWrappingEvaluationResult alloc], "initWithTextFeature:context:imageSize:parameters:", v14, v22, v18, width, height);
  -[CRLineWrappingContext startWithResult:contextSize:](v22, "startWithResult:contextSize:", v23, -[CRLineWrappingParameters lmContextSize](v18, "lmContextSize"));
  v24 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:]([CRWrappingEvaluationResult alloc], "initWithTextFeature:context:imageSize:parameters:", v13, v22, v18, width, height);
  objc_msgSend(v14, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extractFeatureVectorForLocale:string1:string2:evaluation:imageSize:", v12, v25, v26, v24, width, height);

  objc_msgSend(a1, "nsArrayFromVector:", __p);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v27;
}

+ (id)extractFeatureMultiArrayForLocale:(id)a3 textFeature:(id)a4 lastFeature:(id)a5 evaluation:(id)a6 imageSize:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *__p;
  void *v22;

  height = a7.height;
  width = a7.width;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(a5, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extractFeatureVectorForLocale:string1:string2:evaluation:imageSize:", v13, v16, v17, v15, width, height);

  v18 = v22;
  if (v22 == __p)
  {
    v19 = 0;
    if (!v22)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(a1, "multiArrayFromVector:", &__p);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = __p;
  if (__p)
  {
LABEL_3:
    v22 = v18;
    operator delete(v18);
  }
LABEL_4:

  return v19;
}

@end
