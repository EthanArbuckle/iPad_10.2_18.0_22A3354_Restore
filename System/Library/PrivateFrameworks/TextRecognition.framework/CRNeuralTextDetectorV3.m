@implementation CRNeuralTextDetectorV3

+ (void)computeScriptCategoryFromSingleTextFeature:(uint64_t *)a3 map:(void *)a4 scriptRatioThresholds:
{
  id v5;
  void *v6;
  int v7;
  _BYTE *v8;
  char *v9;
  _BYTE *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  float v44;
  BOOL v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  void *v49;
  uint64_t v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  _BOOL4 v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CRScriptCategoryResult *v69;
  double v70;
  CRScriptCategoryResult *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  float v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  id obj;
  id obja;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *__p;
  void *v110;
  uint64_t v111;
  void *v112;
  _BYTE *v113;
  void *v114[3];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _QWORD v120[18];

  v120[16] = *MEMORY[0x1E0C80C00];
  v99 = a2;
  v5 = a4;
  objc_opt_self();
  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v120[0] = 0;
  std::vector<double>::vector(v114, v7, v120);
  v120[0] = 0;
  std::vector<long>::vector(&v112, v7, v120);
  objc_msgSend((id)objc_opt_class(), "computeClassCount:classProbabiity:fromSingleTextFeature:map:backgroundClass:", &v112, v114, v99, a3, 0);
  v100 = v5;
  v97 = v5;
  objc_opt_self();
  v8 = v112;
  if (v112 == v113)
  {
    v10 = v112;
  }
  else
  {
    v9 = (char *)v112 + 8;
    v10 = v112;
    if ((char *)v112 + 8 != v113)
    {
      v11 = *(_QWORD *)v112;
      v10 = v112;
      v12 = (char *)v112 + 8;
      do
      {
        v14 = *(_QWORD *)v12;
        v12 += 8;
        v13 = v14;
        v15 = v11 < v14;
        if (v11 <= v14)
          v11 = v13;
        if (v15)
          v10 = v9;
        v9 = v12;
      }
      while (v12 != v113);
    }
  }
  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories", v97);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (v10 - v8) >> 3;
  objc_msgSend(v16, "objectAtIndexedSubscript:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 latinCyrillic]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v18, "indexOfObject:", v19);

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 chinese]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "indexOfObject:", v21);

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 common]();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "indexOfObject:", v24);

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 korean]();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "indexOfObject:", v27);

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 japanese]();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "indexOfObject:", v30);

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 thai]();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "indexOfObject:", v33);

  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 arabic]();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "indexOfObject:", v36);

  if (*((_QWORD *)v112 + v28) <= *((_QWORD *)v112 + v22))
    v38 = v22;
  else
    v38 = v28;
  if (*((_QWORD *)v112 + v38) <= *((_QWORD *)v112 + v31))
    v38 = v31;
  if (*((_QWORD *)v112 + v38) <= *((_QWORD *)v112 + v34))
    v38 = v34;
  if (*((_QWORD *)v112 + v38) <= *((_QWORD *)v112 + v37))
    v39 = v37;
  else
    v39 = v38;
  +[CRScriptCategoryV1 unknown]();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v17 == v40;

  if (!v41)
  {
    v42 = *((_QWORD *)v112 + v25) + *((_QWORD *)v112 + (_QWORD)obj);
    if (v42 < 1
      || (objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("CRScriptThresholdPreferredLatinCJK")),
          v43 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v43, "floatValue"),
          v45 = (float)(v44 * (float)*((uint64_t *)v112 + v39)) < (float)v42,
          v43,
          v101 = (uint64_t)obj,
          !v45))
    {
      +[CRScriptCategoryV1 japanese]();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v46)
      {

        v101 = v31;
        goto LABEL_53;
      }
      v47 = *((_QWORD *)v112 + v31);
      if (v47 < 1)
      {

      }
      else
      {
        v48 = *((_QWORD *)v112 + v39) == v47;

        v101 = v31;
        if (v48)
          goto LABEL_53;
      }
      +[CRScriptCategoryV1 korean]();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v49)
      {

        v101 = v28;
        goto LABEL_53;
      }
      v50 = *((_QWORD *)v112 + v28);
      if (v50 < 1)
      {

      }
      else
      {
        v51 = *((_QWORD *)v112 + v39) == v50;

        v101 = v28;
        if (v51)
          goto LABEL_53;
      }
      +[CRScriptCategoryV1 chinese]();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v52)
      {

        v101 = v22;
        goto LABEL_53;
      }
      v53 = *((_QWORD *)v112 + v22);
      if (v53 < 1)
      {

      }
      else
      {
        v54 = *((_QWORD *)v112 + v39) == v53;

        v101 = v22;
        if (v54)
          goto LABEL_53;
      }
      +[CRScriptCategoryV1 thai]();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v55)
      {

        v101 = v34;
        goto LABEL_53;
      }
      v56 = *((_QWORD *)v112 + v34);
      if (v56 < 1)
      {

      }
      else
      {
        v57 = *((_QWORD *)v112 + v39) == v56;

        v101 = v34;
        if (v57)
          goto LABEL_53;
      }
      +[CRScriptCategoryV1 arabic]();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v58)
      {

        v101 = v37;
      }
      else
      {
        v59 = *((_QWORD *)v112 + v37) > 0;

        v60 = (uint64_t)obj;
        if (v59)
          v60 = v37;
        v101 = v60;
      }
    }
  }
LABEL_53:

  __p = 0;
  v110 = 0;
  v111 = 0;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(&__p, v112, (uint64_t)v113, (v113 - (_BYTE *)v112) >> 3);
  v102 = v99;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_opt_new();
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  obja = v63;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v115, v120, 16);
  if (v64)
  {
    LODWORD(v65) = 0;
    v66 = *(_QWORD *)v116;
    do
    {
      v67 = 0;
      v65 = (int)v65;
      do
      {
        if (*(_QWORD *)v116 != v66)
          objc_enumerationMutation(obja);
        v68 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v67);
        v69 = [CRScriptCategoryResult alloc];
        v70 = *((double *)v114[0] + v65);
        *(float *)&v70 = v70;
        v71 = -[CRScriptCategoryResult initWithScriptCategory:probability:](v69, "initWithScriptCategory:probability:", v68, v70);
        objc_msgSend(v61, "addObject:", v71);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *((_QWORD *)__p + v65));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setObject:forKeyedSubscript:", v72, v68);

        ++v65;
        ++v67;
      }
      while (v64 != v67);
      v63 = obja;
      v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v120, 16);
    }
    while (v64);
  }

  objc_msgSend(v102, "setScriptCategoryResults:", v61);
  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectAtIndexedSubscript:", v101);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setSelectedScriptCategory:", v74);

  objc_msgSend(v102, "setScriptCounts:", v62);
  if (__p)
  {
    v110 = __p;
    operator delete(__p);
  }
  v75 = **a3;
  v77 = *(_QWORD *)(v75 + 8);
  v76 = *(_QWORD *)(v75 + 16);
  v78 = v102;
  objc_opt_self();
  +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 common]();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v79, "indexOfObject:", v80);

  objc_msgSend(v78, "selectedScriptCategory");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 common]();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v82, "isEqual:", v83))
    v84 = *((double *)v114[0] + v81);
  else
    v84 = *((double *)v114[0] + v101) + *((double *)v114[0] + v81);

  objc_msgSend(v78, "sizeForImageSize:", (double)v76, (double)v77);
  v87 = v84;
  if (v87 <= 0.79)
  {
    if (fmin(v86, v85) / fmax(v86, v85) < 0.150000006 || v87 < 0.79)
      goto LABEL_71;
LABEL_70:
    v88 = 0;
    goto LABEL_72;
  }
  if (v87 >= 0.79)
    goto LABEL_70;
LABEL_71:
  v88 = 1;
LABEL_72:
  objc_msgSend(v78, "setUseSequenceScriptLocale:", v88);

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v78, "subFeatures");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
  if (v90)
  {
    v91 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(_QWORD *)v106 != v91)
          objc_enumerationMutation(v89);
        v93 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        objc_msgSend(v78, "scriptCategoryResults");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setScriptCategoryResults:", v94);

        objc_msgSend(v78, "selectedScriptCategory");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setSelectedScriptCategory:", v95);

        objc_msgSend(v78, "scriptCounts");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setScriptCounts:", v96);

        objc_msgSend(v93, "setUseSequenceScriptLocale:", objc_msgSend(v78, "useSequenceScriptLocale"));
      }
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
    }
    while (v90);
  }

  if (v112)
  {
    v113 = v112;
    operator delete(v112);
  }
  if (v114[0])
  {
    v114[1] = v114[0];
    operator delete(v114[0]);
  }

}

+ (uint64_t)numSupportedTextType
{
  void *v0;
  uint64_t v1;

  objc_opt_self();
  +[CRNeuralTextDetectorV3 supportedTextType]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count");

  return v1;
}

+ (id)supportedTextType
{
  objc_opt_self();
  if (_MergedGlobals_34 != -1)
    dispatch_once(&_MergedGlobals_34, &__block_literal_global_35);
  return (id)qword_1ED0B4860;
}

void __63__CRNeuralTextDetectorV3_CRDetectorTextType__supportedTextType__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED0B4860;
  qword_1ED0B4860 = (uint64_t)&unk_1E993F8D8;

}

+ (void)computeTextTypeFromSingleTextFeature:(uint64_t)a3 map:
{
  id v4;
  unint64_t v5;
  char v6;
  char *v7;
  char *v8;
  _BYTE *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  double *v15;
  double *v16;
  double v18;
  double *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *__p;
  char *v35;
  void *v36;
  char *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  objc_opt_class();
  v5 = (int)+[CRNeuralTextDetectorV3 numSupportedTextType]();
  __p = 0;
  std::vector<double>::vector(&v36, v5, &__p);
  v33 = 0;
  std::vector<long>::vector(&__p, v5, &v33);
  v6 = objc_msgSend((id)objc_opt_class(), "computeClassCount:classProbabiity:fromSingleTextFeature:map:backgroundClass:", &__p, &v36, v4, a3, 0);
  v7 = (char *)__p;
  if ((v6 & 1) != 0)
  {
    if (__p == v35)
    {
      v9 = __p;
    }
    else
    {
      v8 = (char *)__p + 8;
      v9 = __p;
      if ((char *)__p + 8 != v35)
      {
        v10 = *(_QWORD *)__p;
        v9 = __p;
        v11 = (char *)__p + 8;
        do
        {
          v13 = *(_QWORD *)v11;
          v11 += 8;
          v12 = v13;
          v14 = v10 < v13;
          if (v10 <= v13)
            v10 = v12;
          if (v14)
            v9 = v8;
          v8 = v11;
        }
        while (v11 != v35);
      }
    }
    v15 = (double *)v36;
    v16 = (double *)((char *)v36 + 8);
    if (v36 != v37 && v16 != (double *)v37)
    {
      v18 = *(double *)v36;
      v19 = (double *)((char *)v36 + 8);
      do
      {
        v20 = *v19++;
        v21 = v20;
        if (v18 < v20)
        {
          v18 = v21;
          v15 = v16;
        }
        v16 = v19;
      }
      while (v19 != (double *)v37);
    }
    if (*v15 > 0.5)
    {
      objc_opt_class();
      +[CRNeuralTextDetectorV3 supportedTextType]();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", (int)((v9 - v7) >> 3));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      objc_msgSend(v4, "setTextType:", v24);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v4, "subFeatures", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v30 != v27)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "setTextType:", objc_msgSend(v4, "textType"));
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v26);
      }

      v7 = (char *)__p;
    }
  }
  if (v7)
  {
    v35 = v7;
    operator delete(v7);
  }
  if (v36)
  {
    v37 = (char *)v36;
    operator delete(v36);
  }

}

- (CRNeuralTextDetectorV3)init
{
  void *v3;
  CRDetectorConfiguration *v4;
  CRNeuralTextDetectorV3 *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("CRImageReaderRevisionKey");
  v8[0] = &unk_1E9926BE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRDetectorConfiguration initWithImageReaderOptions:error:]([CRDetectorConfiguration alloc], "initWithImageReaderOptions:error:", v3, 0);
  v5 = -[CRNeuralTextDetectorV3 initWithConfiguration:error:](self, "initWithConfiguration:error:", v4, 0);

  return v5;
}

- (CRNeuralTextDetectorV3)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  CRNeuralTextDetectorV3 *v7;
  CRTextDetectorModelV3CoreML *v8;
  void *v9;
  CRNeuralTextDetectorV3 *v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRNeuralTextDetectorV3;
  v7 = -[CRNeuralTextDetector init](&v14, sel_init);
  if (!v7)
    goto LABEL_4;
  v8 = -[CRTextDetectorModelV3CoreML initWithConfiguration:error:]([CRTextDetectorModelV3CoreML alloc], "initWithConfiguration:error:", v6, a4);
  -[CRNeuralTextDetectorV3 setModel:](v7, "setModel:", v8);

  -[CRNeuralTextDetectorV3 model](v7, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CRNeuralTextDetector setConfiguration:](v7, "setConfiguration:", v6);
LABEL_4:
    v10 = v7;
    goto LABEL_8;
  }
  CROSLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_ERROR, "Could not initialize V3 detector model", v13, 2u);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)preheatWithError:(id *)a3
{
  uint64_t v5;
  const __CFDictionary *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  CVPixelBufferRef texture;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CA8F70];
  v16[0] = *MEMORY[0x1E0CA8F78];
  v16[1] = v5;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  texture = 0;
  -[CRNeuralTextDetector configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tileSize");
  v9 = v8;
  -[CRNeuralTextDetector configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tileSize");
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v9, (unint64_t)v11, 0x42475241u, v6, &texture);

  -[CRNeuralTextDetectorV3 model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predictionFromImage:error:", texture, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferRelease(texture);
  return v13 != 0;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  float v19;
  double v20;
  float v21;
  double v22;
  double v23;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[CRNeuralTextDetector configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prioritization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CRImageReaderPrioritizationPerformance"));

  v10 = 4032.0;
  if (v9)
    v10 = 2800.0;
  if (width <= height)
    v11 = height;
  else
    v11 = width;
  v12 = v10 / v11;
  if (a3 <= 0.0)
  {
    v19 = 1.0;
    v18 = v12 <= 1.0;
  }
  else
  {
    if (width >= height)
      v13 = height;
    else
      v13 = width;
    v14 = 480.0 / v13;
    v15 = v12;
    if (30.0 / (height * a3) < v15)
      v15 = 30.0 / (height * a3);
    v16 = v14;
    v17 = v15 <= v14;
    if (v15 > v14)
      v16 = v15;
    v12 = v15;
    if (v17)
      v12 = v14;
    v18 = v16 <= 1.0;
    v19 = 1.0;
  }
  if (!v18)
    v12 = v19;
  v20 = v12;
  v21 = width * v12;
  v22 = (double)(int)llroundf(v21);
  *(float *)&v20 = height * v20;
  v23 = (double)(int)llroundf(*(float *)&v20);
  result.height = v23;
  result.width = v22;
  return result;
}

+ (double)scaledImageSizeForMaxSize:(double)a3 minSize:(double)a4 inputLengthLimit:(double)a5 imageSize:(double)a6 scale:(double)a7
{
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  double v23;
  double v24;
  float v25;

  objc_opt_self();
  if (a3 >= a6)
    v17 = a6;
  else
    v17 = a3;
  if (a4 >= a7)
    v18 = a7;
  else
    v18 = a4;
  v19 = v17 / a6;
  v20 = v18 / a7;
  if (v19 <= v20)
    v19 = v20;
  v21 = v19;
  v22 = 0.0;
  if (v21 < 1.0)
  {
    v23 = a6 <= a7 ? a7 : a6;
    v22 = a5 / v23;
    if (v21 < v22)
      v22 = v21;
  }
  v24 = a1 / a6;
  if (a1 / a6 >= a2 / a7)
    v24 = a2 / a7;
  if (v24 > 1.0)
    v24 = 1.0;
  v25 = v24;
  if (v22 < v25)
    v22 = v25;
  *a9 = v22;
  return (double)(int)(a6 * v22 + 0.5);
}

+ (float64x2_t)calculateTargetOutputSize:(double)a3 adjustedInputScale:(double)a4 paddedSize:(double)a5 imageSize:(double)a6 maximumSize:(double)a7 minimumSize:(uint64_t)a8 inputLengthLimit:(float64x2_t *)a9
{
  uint64_t v21;
  float64x2_t v22;
  float64_t v23;
  int32x2_t v24;
  int32x2_t v25;
  int8x16_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t result;

  v21 = objc_opt_self();
  v22.f64[0] = +[CRNeuralTextDetectorV3 scaledImageSizeForMaxSize:minSize:inputLengthLimit:imageSize:scale:](a3, a4, a5, a6, a7, a1, a2, v21, a10);
  v22.f64[1] = v23;
  v24 = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vmulq_f64(v22, (float64x2_t)vdupq_n_s64(0x3FA0000000000000uLL)))));
  v25 = vcgt_s32((int32x2_t)0xF0000000FLL, v24);
  v26.i64[0] = v25.i32[0];
  v26.i64[1] = v25.i32[1];
  v27 = (float64x2_t)vbslq_s8(v26, (int8x16_t)vdupq_n_s64(0x407E000000000000uLL), (int8x16_t)vcvtq_f64_f32(vcvt_f32_s32(vshl_n_s32(v24, 5uLL))));
  *a11 = v27;
  v28 = vaddq_f64(v27, vsubq_f64(v22, v27));
  __asm { FMOV            V1.2D, #0.5 }
  result = vcvtq_f64_f32(vrndp_f32(vcvt_f32_f64(vmulq_f64(v28, _Q1))));
  *a9 = result;
  return result;
}

- (id)enumerateTilesForImage:(id)a3 cachedSurface:(__IOSurface *)a4 guidedByScoreMapFullTile:(void *)a5 block:(id)a6
{
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  uint64_t v20;
  float v21;
  double v22;
  void *v23;
  int v24;
  size_t v25;
  unint64_t v26;
  double v27;
  float v28;
  uint64_t v29;
  double x;
  double y;
  double width;
  double height;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  double v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  float *v47;
  float *v48;
  void *v49;
  uint64_t v50;
  int v51;
  int v52;
  char v53;
  char v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  CRNeuralTextDetectorV3 *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  char v72;
  char v73;
  char v74;
  char v75;
  double v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  unint64_t v81;
  uint64_t v82;
  void (**v83)(id, uint64_t, float *, _BYTE *, double, double, double, double);
  float v84;
  double v85;
  uint64_t v86;
  void *v87;
  double rect;
  CRNeuralTextDetectorV3 *v89;
  uint64_t v90;
  BOOL v91;
  vDSP_Length __NHigh;
  vDSP_Length __NLow;
  float __C;
  float __B;
  char v96;
  float v97;
  void *__p[3];
  void *v99[4];
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v9 = a3;
  v83 = (void (**)(id, uint64_t, float *, _BYTE *, double, double, double, double))a6;
  if (!v83)
  {
    v55 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_73;
  }
  v89 = self;
  -[CRNeuralTextDetector configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tileOverlap");
  v12 = v11;

  -[CRNeuralTextDetector configuration](v89, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tileSize");
  rect = v14;
  v16 = v15;

  v17 = objc_msgSend(v9, "width");
  v18 = objc_msgSend(v9, "height");
  v85 = rect - v12;
  v19 = ((double)v17 - v12) / (rect - v12);
  v20 = vcvtps_s32_f32(v19);
  v77 = v16 - v12;
  v21 = ((double)v18 - v12) / (v16 - v12);
  v79 = vcvtps_s32_f32(v21);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v79 * v20);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(__p[0]) = 0;
  std::vector<float>::vector(v99, v79 * v20, __p);
  std::vector<CGRect>::vector(__p, v79 * v20);
  v97 = 0.0;
  v22 = 1.0;
  v80 = v9;
  if (*(_QWORD *)a5
    && (-[CRNeuralTextDetector configuration](v89, "configuration"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "useScaleTraversal"),
        v23,
        v24))
  {
    v91 = 0;
    v25 = (unint64_t)(rect
                           / (double)(unint64_t)objc_msgSend(v9, "width")
                           * (double)*(unint64_t *)(*(_QWORD *)a5 + 16));
    v26 = (unint64_t)(v16
                           / (double)(unint64_t)objc_msgSend(v9, "height")
                           * (double)*(unint64_t *)(*(_QWORD *)a5 + 8));
    v27 = (float)((float)v25 * (float)v26) / rect / v16;
    v22 = v27 + v27 + v27 + v27;
  }
  else
  {
    v26 = 0;
    v25 = 0;
    v91 = 1;
  }
  v90 = v20;
  v28 = v22;
  v84 = v28;
  v96 = 0;
  if (v79 < 1)
  {
    v82 = 0;
  }
  else
  {
    v81 = v26;
    v82 = 0;
    v78 = 0;
    while (v20 < 1)
    {
LABEL_34:
      if (!v96)
      {
        v53 = -[CRNeuralTextDetector shouldCancel](v89, "shouldCancel");
        v54 = ++v78 == v79 ? 1 : v53;
        if ((v54 & 1) == 0)
          continue;
      }
      goto LABEL_42;
    }
    v29 = 0;
    v86 = v78 * v20;
    while (1)
    {
      x = v85 * (double)(int)v29;
      if (x >= 0.0)
      {
        height = v16;
        width = rect;
        y = v77 * (double)(int)v78;
      }
      else
      {
        v100.origin.x = v85 * (double)(int)v29;
        v100.origin.y = v77 * (double)(int)v78;
        v100.size.width = rect;
        v100.size.height = v16;
        v101 = CGRectOffset(v100, -x, 0.0);
        x = v101.origin.x;
        y = v101.origin.y;
        width = v101.size.width;
        height = v101.size.height;
      }
      if (width + x >= (double)(unint64_t)objc_msgSend(v9, "width"))
      {
        v34 = objc_msgSend(v9, "width");
        v102.origin.x = x;
        v102.origin.y = y;
        v102.size.width = width;
        v102.size.height = height;
        v103 = CGRectOffset(v102, (double)v34 - (width + x), 0.0);
        x = v103.origin.x;
        y = v103.origin.y;
        width = v103.size.width;
        height = v103.size.height;
      }
      if (y < 0.0)
      {
        v104.origin.x = x;
        v104.origin.y = y;
        v104.size.width = width;
        v104.size.height = height;
        v105 = CGRectOffset(v104, 0.0, -y);
        x = v105.origin.x;
        y = v105.origin.y;
        width = v105.size.width;
        height = v105.size.height;
      }
      if (height + y >= (double)(unint64_t)objc_msgSend(v9, "height"))
      {
        v35 = objc_msgSend(v9, "height");
        v106.origin.x = x;
        v106.origin.y = y;
        v106.size.width = width;
        v106.size.height = height;
        v107 = CGRectOffset(v106, 0.0, (double)v35 - (height + y));
        x = v107.origin.x;
        y = v107.origin.y;
        width = v107.size.width;
        height = v107.size.height;
      }
      v36 = v29 + v86;
      v37 = (double *)((char *)__p[0] + 32 * v29 + 32 * v86);
      *v37 = x;
      v37[1] = y;
      v37[2] = width;
      v37[3] = height;
      v38 = objc_msgSend(v9, "width");
      v39 = objc_msgSend(v9, "height");
      v40 = objc_msgSend(v9, "width");
      v41 = objc_msgSend(v9, "height");
      v42 = x / (double)v38;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v42, y / (double)v39, width / (double)v40, height / (double)v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addObject:", v43);

      if (v91)
      {
        v91 = 1;
      }
      else
      {
        if (v81)
        {
          v44 = (unint64_t)(y / (double)v39 * (double)*(unint64_t *)(*(_QWORD *)a5 + 8));
          v45 = (unint64_t)(v42 * (double)*(unint64_t *)(*(_QWORD *)a5 + 16));
          v46 = v81;
          do
          {
            __C = 0.2;
            __B = 0.0;
            v47 = (float *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
            __NHigh = 0;
            __NLow = 0;
            vDSP_vclipc((const float *)(**(_QWORD **)a5 + 4 * *(_QWORD *)(*(_QWORD *)a5 + 16) * v44 + 4 * v45), 1, &__B, &__C, v47, 1, v25, &__NLow, &__NHigh);
            free(v47);
            v48 = (float *)v99[0];
            *((float *)v99[0] + v36) = *((float *)v99[0] + v36) + (float)__NHigh;
            ++v44;
            --v46;
          }
          while (v46);
          v9 = v80;
        }
        else
        {
          v48 = (float *)v99[0];
        }
        if (v48[v36] <= 0.0)
        {
          v91 = 0;
        }
        else
        {
          objc_msgSend(v9, "imageByCroppingRectangle:", x, y, width, height);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "pixelBuffer");
          v97 = 0.0;
          v83[2](v83, v50, &v97, &v96, x, y, width, height);
          v91 = (float)(v97 * v84) > *((float *)v99[0] + v36);
          ++v82;

        }
      }
      if (v96)
        break;
      v51 = -[CRNeuralTextDetector shouldCancel](v89, "shouldCancel");
      if (++v29 >= v20)
        v52 = 1;
      else
        v52 = v51;
      if (v52 == 1)
        goto LABEL_34;
    }
  }
LABEL_42:
  if (v91 || v82)
  {
    v60 = v89;
    if (v79 >= 1 && v91)
      goto LABEL_51;
  }
  else
  {
    if (v20 >= 0)
      v56 = v20;
    else
      v56 = v20 + 1;
    v57 = v79 / 2 * v20 + (v56 >> 1);
    objc_msgSend(v9, "imageByCroppingRectangle:", *((double *)__p[0] + 4 * v57), *((double *)__p[0] + 4 * v57 + 1), *((double *)__p[0] + 4 * v57 + 2), *((double *)__p[0] + 4 * v57 + 3));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "pixelBuffer");
    v97 = 0.0;
    v83[2](v83, v59, &v97, &v96, *((double *)__p[0] + 4 * v57), *((double *)__p[0] + 4 * v57 + 1), *((double *)__p[0] + 4 * v57 + 2), *((double *)__p[0] + 4 * v57 + 3));
    if (v97 > 0.0)
    {
      *((float *)v99[0] + v57) = fmaxf(v97 * v84, 1.0);

      v60 = v89;
      if (v79 <= 0)
        goto LABEL_68;
LABEL_51:
      v61 = 0;
      v62 = 0;
      while (v90 < 1)
      {
LABEL_61:
        if (!v96)
        {
          v74 = -[CRNeuralTextDetector shouldCancel](v60, "shouldCancel");
          v75 = ++v62 == v79 ? 1 : v74;
          v61 += 4 * v90;
          if ((v75 & 1) == 0)
            continue;
        }
        goto LABEL_68;
      }
      v63 = v61;
      v64 = 1;
      while (1)
      {
        if (*(float *)((char *)v99[0] + v63) < v84)
        {
          v65 = (double *)((char *)__p[0] + 8 * v63);
          v66 = *v65;
          v67 = v65[1];
          v68 = v65[2];
          v69 = v65[3];
          objc_msgSend(v9, "imageByCroppingRectangle:", *v65, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "pixelBuffer");
          v97 = 1.0;
          v83[2](v83, v71, &v97, &v96, v66, v67, v68, v69);

          v60 = v89;
        }
        if (v96)
          goto LABEL_68;
        v72 = -[CRNeuralTextDetector shouldCancel](v60, "shouldCancel");
        if (v64 >= v90)
          v73 = 1;
        else
          v73 = v72;
        ++v64;
        v63 += 4;
        if ((v73 & 1) != 0)
          goto LABEL_61;
      }
    }

  }
LABEL_68:
  v55 = v87;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v99[0])
  {
    v99[1] = v99[0];
    operator delete(v99[0]);
  }

LABEL_73:
  return v55;
}

+ (void)createImageMap:(double)a3 targetSize:(uint64_t)a4
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  size_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  id v29;

  v8 = a5;
  objc_opt_self();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = (uint64_t *)operator new();
  v13 = (unint64_t)(a2 * a3);
  v12[2] = (unint64_t)a2;
  v12[3] = vcvtd_n_u64_f64(a2, 2uLL);
  *v12 = 0;
  v12[1] = (unint64_t)a3;
  if (v13)
    *v12 = (uint64_t)malloc_type_calloc(v13, 4uLL, 0xF2EF0BD8uLL);
  *a1 = v12;
  objc_msgSend(v8, "strides");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v8, "strides");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  objc_msgSend(v8, "strides");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");

  v23 = *v12;
  v29 = objc_retainAutorelease(v8);
  v24 = objc_msgSend(v29, "dataPointer");
  if (a3 > 0.0)
  {
    v25 = 0;
    v26 = 0;
    v27 = (int)sqrt((double)v11);
    do
    {
      if (a2 > 0.0)
      {
        v28 = 0;
        do
        {
          *(_DWORD *)(v23 + 4 * v26 + 4 * v28) = *(_DWORD *)(v24
                                                             + 4
                                                             * (v19 * (v25 / v27)
                                                              + v22 * ((int)v28 / v27)
                                                              + v16
                                                              * (v25 % v27 * v27 + (int)v28 - v27 * ((int)v28 / v27))));
          ++v28;
        }
        while (a2 > (double)(int)v28);
        v26 += v28;
      }
      ++v25;
    }
    while (a3 > (double)v25);
  }

}

+ (void)createMultiChannelImageMaps:(CGFloat)a3 size:(uint64_t)a4 channels:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  char *v17;
  void ***v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int v23;
  char *v24;
  CGFloat v25;
  id v26;
  CGSize v28;

  v9 = a5;
  objc_opt_self();
  objc_msgSend(v9, "strides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v9, "strides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  v28.width = a2;
  v28.height = a3;
  CRDetectorOutputMaps::createMaps(a6, v28, a1);
  v26 = objc_retainAutorelease(v9);
  v16 = objc_msgSend(v26, "dataPointer");
  if ((uint64_t)a6 >= 1)
  {
    v17 = (char *)v16;
    v18 = 0;
    v19 = vcvtd_n_u64_f64(a2, 2uLL);
    v20 = 4 * v12;
    v21 = 4 * v15;
    do
    {
      if (a3 > 0.0)
      {
        v22 = **(char ***)(*a1 + 8 * (_QWORD)v18);
        v23 = 1;
        v24 = v17;
        do
        {
          memcpy(v22, v24, v19);
          v25 = (double)v23++;
          v24 += v21;
          v22 += 4 * (int)a2;
        }
        while (a3 > v25);
      }
      v18 = (void ***)((char *)v18 + 1);
      v17 += v20;
    }
    while (v18 != a6);
  }

}

- (id)detectInImage:(id)a3 error:(id *)a4
{
  -[CRNeuralTextDetectorV3 detectInImage:trackingSession:error:](self, "detectInImage:trackingSession:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)detectInImage:(id)a3 trackingSession:(id)a4 error:(id *)a5
{
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  CRDetectionResult *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  CRLogger *v32;
  _BYTE *CRLogger;
  void *v34;
  double v35;
  void *v36;
  CRImage *v37;
  void *v38;
  void *v39;
  CRImage *v40;
  void *v41;
  void *v42;
  void *v43;
  void **v44;
  void **v45;
  void **v46;
  void **v47;
  void **v48;
  void **v49;
  void **v50;
  void **v51;
  char v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  id v64;
  uint64_t *v65;
  _QWORD *v66;
  _QWORD *v67;
  void ***v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  void ***v72;
  void ***v73;
  _QWORD *v74;
  uint64_t *v75;
  char v76;
  char v77;
  char v78;
  void **v79;
  void ***v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  __n128 (*v88)(__n128 *, __n128 *);
  void (*v89)(uint64_t);
  void *v90;
  _QWORD v91[3];
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  void **v98[6];
  _OWORD v99[3];
  _QWORD v100[4];
  id v101;
  CRNeuralTextDetectorV3 *v102;
  _QWORD *v103;
  uint64_t *v104;
  _QWORD *v105;
  void ***v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  char v111;
  char v112;
  _QWORD v113[5];
  id v114;
  _QWORD v115[8];
  _QWORD v116[8];
  _QWORD v117[8];
  _QWORD v118[8];
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  void **v125[10];
  __int128 v126;
  _QWORD v127[4];
  __int128 v128;
  uint64_t v129;
  _QWORD v130[10];
  __int128 v131;
  _OWORD v132[2];
  __int128 v133;
  uint64_t v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v57 = a4;
  v130[0] = 0;
  v130[1] = v130;
  v130[2] = 0x9812000000;
  v130[3] = __Block_byref_object_copy__20;
  v130[4] = __Block_byref_object_dispose__20;
  v130[5] = &unk_1D5168E96;
  memset(&v130[6], 0, 32);
  v131 = 0u;
  memset(v132, 0, sizeof(v132));
  v133 = 0u;
  v134 = 0;
  v125[0] = 0;
  v125[1] = (void **)v125;
  v125[2] = (void **)0x9812000000;
  v125[3] = (void **)__Block_byref_object_copy__20;
  v125[4] = (void **)__Block_byref_object_dispose__20;
  memset(&v125[6], 0, 32);
  v126 = 0u;
  memset(v127, 0, sizeof(v127));
  v128 = 0u;
  v125[5] = (void **)&unk_1D5168E96;
  v129 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__8;
  v123 = __Block_byref_object_dispose__9;
  v124 = 0;
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x4012000000;
  v118[3] = __Block_byref_object_copy__10;
  v118[4] = __Block_byref_object_dispose__11;
  v118[5] = &unk_1D5168E96;
  v117[0] = 0;
  v117[1] = v117;
  v117[2] = 0x4012000000;
  v117[3] = __Block_byref_object_copy__10;
  v117[4] = __Block_byref_object_dispose__11;
  v117[5] = &unk_1D5168E96;
  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x4012000000;
  v116[3] = __Block_byref_object_copy__10;
  v116[4] = __Block_byref_object_dispose__11;
  v116[5] = &unk_1D5168E96;
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x4012000000;
  v115[3] = __Block_byref_object_copy__10;
  v115[4] = __Block_byref_object_dispose__11;
  v115[5] = &unk_1D5168E96;
  -[CRNeuralTextDetector configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "disableScriptDetection");

  -[CRNeuralTextDetector configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "disableTextTypeDetection");

  -[CRNeuralTextDetector configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "detectTables");
  if (v57)
    v14 = 0;
  else
    v14 = v13;
  v53 = v14;

  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x3032000000;
  v113[3] = __Block_byref_object_copy__8;
  v113[4] = __Block_byref_object_dispose__9;
  v114 = 0;
  -[CRNeuralTextDetector detectorStats](self, "detectorStats");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11 ^ 1;
  v17 = MEMORY[0x1E0C809B0];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke;
  v100[3] = &unk_1E98DBAD0;
  v103 = v117;
  v56 = v55;
  v101 = v56;
  v102 = self;
  v104 = &v119;
  v105 = v118;
  v106 = v125;
  v107 = v116;
  v108 = v115;
  v109 = v130;
  v111 = v9 ^ 1;
  v112 = v16;
  v110 = v113;
  objc_msgSend(v15, "measureBlock:", v100);

  v18 = (void *)v120[5];
  if (v18)
  {
    v19 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v18);
  }
  else
  {
    v98[0] = 0;
    v98[1] = (void **)v98;
    v98[2] = (void **)0x6012000000;
    v98[3] = (void **)__Block_byref_object_copy__20;
    v98[4] = (void **)__Block_byref_object_dispose__21;
    v98[5] = (void **)&unk_1D5168E96;
    memset(v99, 0, sizeof(v99));
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__8;
    v96 = __Block_byref_object_dispose__9;
    v97 = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x4812000000;
    v88 = __Block_byref_object_copy__23;
    v89 = __Block_byref_object_dispose__24;
    v90 = &unk_1D5168E96;
    memset(v91, 0, sizeof(v91));
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__8;
    v83 = __Block_byref_object_dispose__9;
    v84 = 0;
    -[CRNeuralTextDetector postProcStats](self, "postProcStats");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v17;
    v62[1] = 3221225472;
    v62[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_26;
    v62[3] = &unk_1E98DBAF8;
    v62[4] = self;
    v65 = &v92;
    v66 = v130;
    v67 = v118;
    v68 = v125;
    v69 = v116;
    v70 = v117;
    v71 = v115;
    v72 = &v79;
    v73 = v98;
    v21 = v56;
    v63 = v21;
    v74 = v113;
    v76 = v9 ^ 1;
    v77 = v53;
    v64 = v57;
    v75 = &v85;
    v78 = v16;
    objc_msgSend(v20, "measureBlock:", v62);

    v22 = (void *)objc_opt_new();
    -[CRNeuralTextDetector configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "skipVerticalText");

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v25 = (id)v93[5];
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v135, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v59 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          if (!v24 || (objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "isVerticalLayout") & 1) == 0)
          {
            v30 = (void *)objc_opt_class();
            objc_msgSend(v21, "size");
            objc_msgSend(v30, "_lineRegionFromLineTextFeature:imageSize:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v31);

          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v135, 16);
      }
      while (v26);
    }

    CRLogger = CRLogger::getCRLogger(v32);
    if (*CRLogger && (CRLogger[8] & 1) != 0)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVImageBuffer:", objc_msgSend(v21, "pixelBuffer"));
      +[CRTextFeature overlayFeaturesQuadVertices:onImage:showSubFeatures:](CRTextFeature, "overlayFeaturesQuadVertices:onImage:showSubFeatures:", v93[5], v34, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (float)rand();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/%f_quad.png"), *(_QWORD *)&v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[CRImage initWithCIImage:toColorSpace:]([CRImage alloc], "initWithCIImage:toColorSpace:", v54, 1);
      -[CRImage writeToFile:](v37, "writeToFile:", v36);
      +[CRTextFeature overlayFeaturesPolygonVertices:onImage:showSubFeatures:](CRTextFeature, "overlayFeaturesPolygonVertices:onImage:showSubFeatures:", v93[5], v34, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/%f_polygon.png"), *(_QWORD *)&v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[CRImage initWithCIImage:toColorSpace:]([CRImage alloc], "initWithCIImage:toColorSpace:", v38, 1);
      -[CRImage writeToFile:](v40, "writeToFile:", v39);

    }
    v19 = -[CRDetectionResult initWithLines:]([CRDetectionResult alloc], "initWithLines:", v22);
    objc_msgSend(v80[5], "pyramidPreIntraScaleNMSTextFeatures");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDetectionResult setPyramidPreIntraScaleNMSTextFeatures:](v19, "setPyramidPreIntraScaleNMSTextFeatures:", v41);

    objc_msgSend(v80[5], "pyramidScaleSize");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDetectionResult setPyramidScaleSize:](v19, "setPyramidScaleSize:", v42);

    objc_msgSend(v80[5], "pyramidScaleName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDetectionResult setPyramidScaleName:](v19, "setPyramidScaleName:", v43);

    -[CRDetectionResult setTableRegions:](v19, "setTableRegions:", v86 + 6);
    _Block_object_dispose(&v79, 8);

    _Block_object_dispose(&v85, 8);
    v79 = (void **)v91;
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100](&v79);
    _Block_object_dispose(&v92, 8);

    _Block_object_dispose(v98, 8);
    std::deque<unsigned char>::~deque[abi:ne180100](v99);
  }

  _Block_object_dispose(v113, 8);
  _Block_object_dispose(v115, 8);
  _Block_object_dispose(v116, 8);
  _Block_object_dispose(v117, 8);
  _Block_object_dispose(v118, 8);
  _Block_object_dispose(&v119, 8);

  _Block_object_dispose(v125, 8);
  v98[0] = (void **)&v128;
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v98);
  v98[0] = (void **)&v127[1];
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v98);
  v44 = (void **)v127[0];
  v127[0] = 0;
  if (v44)
  {
    if (*v44)
      free(*v44);
    MEMORY[0x1D826E294](v44, 0x1080C40ABB4582ELL);
  }
  v45 = (void **)*((_QWORD *)&v126 + 1);
  *((_QWORD *)&v126 + 1) = 0;
  if (v45)
  {
    if (*v45)
      free(*v45);
    MEMORY[0x1D826E294](v45, 0x1080C40ABB4582ELL);
  }
  v46 = (void **)v126;
  *(_QWORD *)&v126 = 0;
  if (v46)
  {
    if (*v46)
      free(*v46);
    MEMORY[0x1D826E294](v46, 0x1080C40ABB4582ELL);
  }
  v98[0] = (void **)&v125[7];
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v98);
  v47 = v125[6];
  v125[6] = 0;
  if (v47)
  {
    if (*v47)
      free(*v47);
    MEMORY[0x1D826E294](v47, 0x1080C40ABB4582ELL);
  }
  _Block_object_dispose(v130, 8);
  v125[0] = (void **)&v133;
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v125);
  v125[0] = (void **)v132 + 1;
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v125);
  v48 = *(void ***)&v132[0];
  *(_QWORD *)&v132[0] = 0;
  if (v48)
  {
    if (*v48)
      free(*v48);
    MEMORY[0x1D826E294](v48, 0x1080C40ABB4582ELL);
  }
  v49 = (void **)*((_QWORD *)&v131 + 1);
  *((_QWORD *)&v131 + 1) = 0;
  if (v49)
  {
    if (*v49)
      free(*v49);
    MEMORY[0x1D826E294](v49, 0x1080C40ABB4582ELL);
  }
  v50 = (void **)v131;
  *(_QWORD *)&v131 = 0;
  if (v50)
  {
    if (*v50)
      free(*v50);
    MEMORY[0x1D826E294](v50, 0x1080C40ABB4582ELL);
  }
  v125[0] = (void **)&v130[7];
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v125);
  v51 = (void **)v130[6];
  v130[6] = 0;
  if (v51)
  {
    if (*v51)
      free(*v51);
    MEMORY[0x1D826E294](v51, 0x1080C40ABB4582ELL);
  }

  return v19;
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke(uint64_t a1)
{
  __objc2_class *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  float64x2_t *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  unint64_t v32;
  void *v33;
  double v34;
  BOOL v35;
  unint64_t v36;
  void *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  void *v53;
  _QWORD v54[5];
  int8x16_t v55;
  uint64_t v56;
  id obj;
  CFTypeRef cf;
  float64x2_t buf;
  double v60[2];

  v2 = CRDocumentOutputRegionMetadata;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v3 = (id)CRSignpostLog_signPostOSLog;
  v4 = os_signpost_id_generate(v3);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v5 = (id)CRSignpostLog_signPostOSLog;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.f64[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "OCRDetectorTime", ", (uint8_t *)&buf, 2u);
  }

  v60[0] = 0.0;
  v7 = *(float64x2_t **)(*(_QWORD *)(a1 + 48) + 8);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maximumInputSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tileSize");
  v19 = v18;
  v21 = v20;
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "inputLengthLimit");
  +[CRNeuralTextDetectorV3 calculateTargetOutputSize:adjustedInputScale:paddedSize:imageSize:maximumSize:minimumSize:inputLengthLimit:](v9, v11, v14, v16, v19, v21, v23, (uint64_t)CRNeuralTextDetectorV3, v7 + 3, v60, &buf);

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(double *)(v24 + 48) > 4.0 && *(double *)(v24 + 56) > 4.0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      return;
    }
    cf = 0;
    objc_msgSend(*(id *)(a1 + 32), "imageByScaling:paddingToSize:adjustedToSize:paddingMode:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48, 1, v60[0], *(_OWORD *)&buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "useScaleTraversal") & 1) != 0)
    {
      v52 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v22, "runFullTile");

    }
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "useScaleTraversal");
    if ((v31 & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "configuration"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v22, "runFineScale")))
    {
      v53 = v28;
      v32 = objc_msgSend(*(id *)(a1 + 32), "width");
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "tileSize");
      if (v34 >= (double)v32)
      {
        v36 = objc_msgSend(*(id *)(a1 + 32), "height");
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "tileSize");
        v35 = v38 < (double)v36;

      }
      else
      {
        v35 = 1;
      }

      v28 = v53;
      v2 = CRDocumentOutputRegionMetadata;
      if ((v31 & 1) != 0)
      {
LABEL_24:

        if (objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
          v39 = objc_claimAutoreleasedReturnValue();
LABEL_26:
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v41 = *(void **)(v40 + 40);
          *(_QWORD *)(v40 + 40) = v39;

LABEL_50:
          return;
        }
        if (v52)
        {
          obj = 0;
          objc_msgSend(*(id *)(a1 + 40), "runFullTileInferenceOnImage:cachedSurface:outputMaps:inputSize:outputSize:modelContext:error:", *(_QWORD *)(a1 + 32), &cf, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48, *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48, 0, &obj);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
LABEL_31:

            goto LABEL_50;
          }
          if (objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
          {
            +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v44 = *(void **)(v43 + 40);
            *(_QWORD *)(v43 + 40) = v42;

            goto LABEL_31;
          }

          if (!v35 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48))
          {
LABEL_42:
            if (cf)
              CFRelease(cf);
            if (v2[62].info != (__objc2_class_ro *)-1)
              dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
            v50 = (id)CRSignpostLog_signPostOSLog;
            v51 = v50;
            if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
            {
              LOWORD(obj) = 0;
              _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v51, OS_SIGNPOST_INTERVAL_END, v4, "OCRDetectorTime", ", (uint8_t *)&obj, 2u);
            }

            goto LABEL_50;
          }
        }
        else if (!v35)
        {
          goto LABEL_42;
        }
        CRDetectorOutputMaps::init((CRDetectorOutputMaps *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48), (unint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), (unint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56), *(_BYTE *)(a1 + 112), *(unsigned __int8 *)(a1 + 113));
        v45 = *(void **)(a1 + 40);
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48;
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_17;
        v54[3] = &unk_1E98DBAA8;
        v54[4] = v45;
        v55 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
        v56 = *(_QWORD *)(a1 + 96);
        objc_msgSend(v45, "enumerateTilesForImage:cachedSurface:guidedByScoreMapFullTile:block:", v28, &cf, v46, v54);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
        v49 = *(void **)(v48 + 40);
        *(_QWORD *)(v48 + 40) = v47;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          goto LABEL_50;
        if (objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
            || !objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
          {
            goto LABEL_50;
          }
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
          v39 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
        CRDetectorOutputMaps::scaleMaps((CRDetectorOutputMaps *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48), 1);
        goto LABEL_42;
      }
    }
    else
    {
      v35 = 0;
    }

    goto LABEL_24;
  }
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_17(uint64_t a1, uint64_t a2, float *a3, _BYTE *a4, double a5, double a6, double a7, double a8)
{
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  CRTextDetectorModelV3Output *v26;
  size_t v27;
  float *v28;
  id v29;
  vDSP_Length __NHigh;
  float __C;
  float __B;
  CGSize v33;
  _QWORD v34[8];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  CGPoint buf;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1D826E7B0]();
  if (objc_msgSend(*(id *)(a1 + 32), "shouldCancel"))
  {
    *a4 = 1;
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__8;
    v39 = __Block_byref_object_dispose__9;
    v40 = 0;
    objc_msgSend(*(id *)(a1 + 32), "inferenceStats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_2;
    v34[3] = &unk_1E98DBA80;
    v18 = *(_QWORD *)(a1 + 40);
    v34[4] = *(_QWORD *)(a1 + 32);
    v34[5] = &v35;
    v34[6] = v18;
    v34[7] = a2;
    objc_msgSend(v17, "measureBlock:", v34);

    v33 = (CGSize)vdupq_n_s64(0x406E000000000000uLL);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(double *)(v19 + 56);
    if ((a6 + a8) * 0.5 <= v20)
    {
      v21 = 240.0;
    }
    else
    {
      v21 = 240.0 - -(v20 - (a6 + a8) * 0.5);
      v33.height = v21;
    }
    v22 = *(double *)(v19 + 48);
    if ((a5 + a7) * 0.5 <= v22)
    {
      v23 = 240.0;
    }
    else
    {
      v23 = 240.0 - -(v22 - (a5 + a7) * 0.5);
      v33.width = v23;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
      || (v26 = (CRTextDetectorModelV3Output *)v36[5]) == 0)
    {
      CROSLogForCategory(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.x) = 138412290;
        *(_QWORD *)((char *)&buf.x + 4) = v25;
        _os_log_impl(&dword_1D4FB8000, v24, OS_LOG_TYPE_FAULT, "Model prediction error: %@", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      if (*a3 < 1.0)
      {
        __C = 0.2;
        __B = 0.0;
        v27 = (unint64_t)(v21 * v23);
        v28 = (float *)malloc_type_calloc(v27, 4uLL, 0x100004052888210uLL);
        buf.x = 0.0;
        __NHigh = 0;
        objc_msgSend((id)v36[5], "region_score");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        vDSP_vclipc((const float *)objc_msgSend(v29, "dataPointer"), 1, &__B, &__C, v28, 1, v27, (vDSP_Length *)&buf, &__NHigh);

        free(v28);
        *a3 = (float)__NHigh;
        v26 = (CRTextDetectorModelV3Output *)v36[5];
      }
      buf.x = a5 * 0.5;
      buf.y = a6 * 0.5;
      CRDetectorOutputMaps::aggregateMaps((CRDetectorOutputMaps *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), v26, &v33, &buf);
    }
    _Block_object_dispose(&v35, 8);

  }
  objc_autoreleasePoolPop(v16);
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[8];
  id obj;
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRDetectorInferenceTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "predictionFromImage:error:", v7, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRDetectorInferenceTime", ", v14, 2u);
  }

}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  float64_t v17;
  float64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  id *v22;
  void *v23;
  CRIntermediateDetectorResult **p_obj;
  int64x2_t *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  id *v36;
  id *v37;
  void *v38;
  id v39;
  _QWORD *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t spid;
  uint8_t buf[16];
  uint64_t v47;
  id obj;
  uint8_t *v49;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  spid = v3;
  v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRPostProcessingTime", ", buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(double *)(v9 + 48);
  v11 = *(double *)(v9 + 56);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v14 = *(double *)(v13 + 48);
  v15 = *(double *)(v13 + 56);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v17 = *(double *)(v16 + 48);
  v18 = *(double *)(v16 + 56);
  objc_msgSend(v7, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "logIntermediateResults");
  if (v20)
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v23 = *(void **)(v21 + 40);
    v22 = (id *)(v21 + 40);
    obj = v23;
    p_obj = (CRIntermediateDetectorResult **)&obj;
  }
  else
  {
    p_obj = 0;
    v22 = 0;
  }
  v25 = *(int64x2_t **)(*(_QWORD *)(a1 + 120) + 8);
  objc_msgSend(*(id *)(a1 + 40), "size");
  -[CRNeuralTextDetectorV3 processFineScaleMaps:adjustedSize:fullTileMaps:adjustedFullTileSize:targetSize:targetSizeFullTile:intermediateResults:withScaleIds:sourceImageSize:tileRects:trackingSession:](v7, (uint64_t *)(v8 + 48), (uint64_t *)(v12 + 48), p_obj, v25 + 3, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), *(void **)(a1 + 48), v10, v11, v14, v15, v17, v18, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_storeStrong(v22, obj);
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

  -[CRNeuralTextDetectorV3 computeClassificationType:fromTextFeatures:fineScaleMap:fullTileMap:withScaleIds:](*(void **)(a1 + 32), 1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 104), (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 104), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 48));
  if (*(_BYTE *)(a1 + 144))
    -[CRNeuralTextDetectorV3 computeClassificationType:fromTextFeatures:fineScaleMap:fullTileMap:withScaleIds:](*(void **)(a1 + 32), 0, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56), (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 56), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 48));
  if (*(_BYTE *)(a1 + 145))
  {
    v31 = *(void **)(a1 + 32);
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    objc_msgSend(v31, "configuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "logIntermediateResults");
    if (v34)
    {
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
      v37 = *(id **)(v35 + 40);
      v36 = (id *)(v35 + 40);
      v22 = v37;
    }
    else
    {
      v36 = 0;
    }
    v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "size");
    v39 = v38;
    if (v31)
    {
      v40 = *(_QWORD **)(v32 + 96);
      objc_msgSend(v31, "configuration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      CRDetectorPostProcessV3::extractTableBoxes(v40, objc_msgSend(v41, "tableMinDetectableArea"), v39, (uint64_t)buf);

    }
    else
    {
      memset(buf, 0, sizeof(buf));
      v47 = 0;
    }

    if (v34)
      objc_storeStrong(v36, v22);
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    std::vector<CRNormalizedQuad * {__strong}>::__vdeallocate((void **)(v42 + 48));
    *(_OWORD *)(v42 + 48) = *(_OWORD *)buf;
    *(_QWORD *)(v42 + 64) = v47;
    v47 = 0;
    memset(buf, 0, sizeof(buf));
    v49 = buf;
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);

  }
  if (*(_BYTE *)(a1 + 146))
    -[CRNeuralTextDetectorV3 computeClassificationType:fromTextFeatures:fineScaleMap:fullTileMap:withScaleIds:](*(void **)(a1 + 32), 2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 128), (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 128), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 48));
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v43 = (id)CRSignpostLog_signPostOSLog;
  v44 = v43;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v44, OS_SIGNPOST_INTERVAL_END, spid, "OCRPostProcessingTime", ", buf, 2u);
  }

}

- (id)processFineScaleMaps:(uint64_t *)a3 adjustedSize:(CRIntermediateDetectorResult *)a4 fullTileMaps:(int64x2_t *)a5 adjustedFullTileSize:(void *)a6 targetSize:(void *)a7 targetSizeFullTile:(double)a8 intermediateResults:(double)a9 withScaleIds:(double)a10 sourceImageSize:(double)a11 tileRects:(float64_t)a12 trackingSession:(float64_t)a13
{
  int v23;
  char v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  const vImage_Buffer *v28;
  const vImage_Buffer *v29;
  uint64_t v30;
  void ***v31;
  unint64_t v32;
  uint64_t height;
  uint64_t width;
  uint64_t v35;
  float v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float *data;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  float v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  uint64_t *v51;
  char *v52;
  char *v53;
  char *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  char *v60;
  uint64_t *v61;
  uint64_t v62;
  _QWORD *v63;
  vImagePixelCount v64;
  uint64_t v65;
  uint64_t *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  vImagePixelCount v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  _BYTE *v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  char v99;
  char *v100;
  _BYTE *v101;
  id v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  void *v106;
  int v107;
  id v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  void *v114;
  id v115;
  id v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  _BOOL4 v121;
  id v122;
  id v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
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
  unsigned int v148;
  double v149;
  uint64_t *v150;
  double v151;
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
  float v171;
  float v172;
  float v173;
  float v174;
  double v175;
  double v176;
  float v177;
  float v178;
  _BOOL4 v179;
  float v180;
  float v181;
  _BOOL4 v182;
  float64_t v183;
  unint64_t j;
  int *v185;
  int *v186;
  uint64_t v187;
  unint64_t v188;
  float v189;
  float v190;
  unint64_t v191;
  unint64_t v192;
  char *v193;
  char *v194;
  unint64_t v195;
  unint64_t v196;
  BOOL v198;
  id v199;
  id v200;
  id v201;
  uint64_t v202;
  int v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  id v208;
  uint64_t v209;
  int v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  id v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t v218;
  __int128 *v219;
  uint64_t v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t v224;
  void *v225;
  __int128 *v226;
  void ***v227;
  void ***v228;
  void ***v229;
  void ***v230;
  void ***v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  void **v237;
  unint64_t v238;
  void ***v239;
  unint64_t v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  double v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  uint64_t v254;
  _QWORD *v255;
  __int128 *v256;
  __int128 *v257;
  unint64_t v258;
  _QWORD *v259;
  unint64_t v260;
  unint64_t v261;
  uint64_t v262;
  __int128 *v263;
  uint64_t v264;
  uint64_t n;
  void *v266;
  vImagePixelCount v267;
  uint64_t v268;
  vImagePixelCount v269;
  double *v270;
  vImagePixelCount v271;
  vImagePixelCount v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  uint64_t v278;
  double *v279;
  size_t v280;
  uint64_t v281;
  unint64_t v282;
  unint64_t v283;
  unint64_t v284;
  uint64_t v285;
  uint64_t v286;
  char *v287;
  unint64_t v288;
  unint64_t v289;
  double v290;
  uint64_t v291;
  double v292;
  unint64_t v293;
  char *v294;
  uint64_t v295;
  unint64_t v296;
  double v297;
  unint64_t v298;
  uint64_t v299;
  uint64_t v300;
  unint64_t v301;
  unint64_t v302;
  unint64_t v303;
  unint64_t v304;
  uint64_t v305;
  _BOOL8 v306;
  unint64_t v307;
  unint64_t v308;
  void *v309;
  uint64_t v310;
  unint64_t v311;
  _QWORD *v312;
  char *v313;
  double v314;
  uint64_t v315;
  uint64_t v316;
  double v317;
  char *v318;
  _QWORD *v319;
  uint64_t *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t *v323;
  uint64_t v324;
  uint64_t v325;
  unint64_t v326;
  unint64_t v327;
  double v328;
  double v329;
  uint64_t *v330;
  char *v331;
  _BYTE *v332;
  uint64_t v333;
  double v334;
  char *v335;
  unint64_t v336;
  double v337;
  char *v338;
  uint64_t *v339;
  char *v340;
  char *v341;
  double v342;
  _BYTE *v343;
  uint64_t v344;
  double v345;
  char *v346;
  double v347;
  double v348;
  unint64_t v349;
  _BYTE *v350;
  BOOL v351;
  size_t v352;
  _BYTE *v353;
  _BYTE *v354;
  _QWORD *m;
  double v356;
  _BYTE *v357;
  char *v358;
  size_t v359;
  _BYTE *v360;
  _BYTE *v361;
  char *v362;
  uint64_t v363;
  char *v364;
  size_t v365;
  uint64_t v366;
  size_t v367;
  _BYTE *v368;
  char *v369;
  uint64_t v370;
  uint64_t v371;
  char *v372;
  size_t v373;
  uint64_t v374;
  char *v375;
  _QWORD *v376;
  _BYTE *v377;
  _BYTE *v378;
  char *v379;
  char *v380;
  size_t v381;
  _BYTE *v382;
  _BYTE *v383;
  char *v384;
  uint64_t v385;
  uint64_t *v386;
  uint64_t v387;
  char *v388;
  size_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t *v392;
  _BYTE *v393;
  char *v394;
  size_t v395;
  double v396;
  uint64_t v397;
  unint64_t v398;
  vImagePixelCount v399;
  char *k;
  int64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  vImagePixelCount v405;
  char *v406;
  vImagePixelCount v407;
  unint64_t v408;
  char *v409;
  uint64_t v410;
  uint64_t *v411;
  int64_t v412;
  uint64_t v413;
  char *v414;
  uint64_t v415;
  void *v416;
  uint64_t *v417;
  int64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  vImagePixelCount v422;
  char *v423;
  vImagePixelCount v424;
  unint64_t v425;
  char *v426;
  uint64_t v427;
  uint64_t *v428;
  int64_t v429;
  uint64_t v430;
  char *v431;
  uint64_t v432;
  void *v433;
  uint64_t v434;
  uint64_t *v435;
  uint64_t *v436;
  uint64_t v437;
  size_t v438;
  size_t v439;
  uint64_t v440;
  void *v441;
  _QWORD *v442;
  double v443;
  vImagePixelCount v444;
  uint64_t v445;
  uint64_t v446;
  vImagePixelCount v447;
  _QWORD *v448;
  uint64_t v449;
  unint64_t v450;
  unint64_t v451;
  _QWORD *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  char v456;
  uint64_t v457;
  _QWORD *v458;
  _BYTE *v459;
  unint64_t v460;
  _QWORD *v461;
  _BYTE *v462;
  uint64_t v463;
  uint64_t v464;
  char v465;
  uint64_t v466;
  double v467;
  double v468;
  double v469;
  unint64_t v470;
  uint64_t *v471;
  uint64_t v472;
  void **v473;
  char *v474;
  uint64_t v475;
  uint64_t v476;
  char *v477;
  char *v478;
  uint64_t v479;
  size_t v480;
  char *v481;
  uint64_t *v482;
  uint64_t v483;
  double *v484;
  void **v485;
  char *v486;
  uint64_t v487;
  uint64_t v488;
  char *v489;
  char *v490;
  uint64_t v491;
  size_t v492;
  char *v493;
  double v494;
  int v495;
  unint64_t v496;
  uint64_t v497;
  void *v498;
  uint64_t v499;
  unint64_t v500;
  uint64_t v501;
  uint64_t v502;
  int v503;
  uint64_t v504;
  int v505;
  uint64_t v506;
  _QWORD *v507;
  CRNormalizedPolyline *v508;
  CRNormalizedPolyline *v509;
  uint64_t v510;
  uint64_t v511;
  void *v512;
  uint64_t v513;
  unint64_t v514;
  uint64_t v515;
  uint64_t v516;
  int v517;
  uint64_t v518;
  int v519;
  uint64_t v520;
  _QWORD *v521;
  CRNormalizedPolyline *v522;
  CRNormalizedPolyline *v523;
  uint64_t v524;
  double *v525;
  CRIntermediateDetectorResult *v526;
  uint64_t v528;
  id v529;
  id v530;
  CRIntermediateDetectorResult **v531;
  uint64_t *v532;
  id v533;
  int v534;
  id v535;
  id v536;
  CRIntermediateDetectorResult *v537;
  uint64_t *v538;
  id v539;
  uint64_t v540;
  uint64_t v541;
  id v542;
  int64x2_t *v543;
  uint64_t v544;
  uint64_t v545;
  double v546;
  double v547;
  int v548;
  id v549;
  id v550;
  uint64_t v551;
  double v552;
  double v553;
  double v554;
  float64_t v555;
  float64_t v556;
  double v557;
  double v558;
  double v559;
  double v560;
  double v561;
  double v562;
  uint64_t *v563;
  double v564;
  double v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  id v574;
  double v575;
  __int128 *v576;
  uint64_t v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  id v581;
  uint64_t v582;
  double *v583;
  void ***v584;
  size_t rowBytes;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  float64x2_t v589;
  uint64_t v590;
  uint64_t v591;
  char *v592;
  char *v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  vImage_Buffer v598;
  __int128 v599;
  __int128 v600;
  uint64_t v601;
  uint64_t v602;
  float64x2_t v603;
  float64x2_t v604;
  float64x2_t v605;
  _BYTE v606[128];
  _BYTE v607[128];
  void ***v608[16];
  vImage_Buffer v609;
  size_t *v610;
  uint64_t v611;

  v543 = a5;
  v538 = a3;
  v546 = a14;
  v547 = a15;
  v555 = a12;
  v556 = a13;
  v611 = *MEMORY[0x1E0C80C00];
  v536 = a6;
  v529 = a7;
  if (!a1)
    goto LABEL_565;
  v531 = a4;
  if (a4)
    v537 = -[CRIntermediateDetectorResult initWithNumberOfScales:]([CRIntermediateDetectorResult alloc], "initWithNumberOfScales:", 4);
  else
    v537 = 0;
  v23 = 0;
  v587 = 0u;
  v588 = 0u;
  v586 = 0u;
  v584 = 0;
  v583 = 0;
  rowBytes = 0;
  v582 = 0;
  v24 = 1;
  if (*v538 && *a2)
  {
    v25 = a2;
    v27 = (uint64_t *)a2[4];
    v26 = (uint64_t *)a2[5];
    v29 = (const vImage_Buffer *)v538[4];
    v28 = (const vImage_Buffer *)v538[5];
    memset(&v609, 0, sizeof(v609));
    CRDetectorUtils::erodeImageMap(v29, (uint64_t)&v609);
    memset(v608, 0, 32);
    CRDetectorUtils::dilateImageMap(&v609, (uint64_t)v608);
    free(v609.data);
    memset(&v598, 0, sizeof(v598));
    CRDetectorUtils::erodeImageMap(v28, (uint64_t)&v598);
    v594 = 0u;
    v595 = 0u;
    CRDetectorUtils::dilateImageMap(&v598, (uint64_t)&v594);
    free(v598.data);
    v30 = v27[1];
    v31 = v608[0];
    v24 = 0;
    if (v30)
    {
      v32 = 0;
      height = v29->height;
      width = v29->width;
      v35 = v27[2];
      v36 = (float)v30 / (float)height;
      v37 = (float)width;
      v38 = *v27;
      v39 = *v26;
      v40 = v594;
      data = (float *)v28->data;
      v23 = 0;
      v42 = width * height;
      v43 = 4 * v35;
      a2 = v25;
      do
      {
        if (v35)
        {
          v44 = 0;
          v45 = roundf((float)v32 / v36);
          do
          {
            v46 = (uint64_t)(float)(roundf((float)v44 / (float)((float)v35 / v37)) + (float)(v45 * v37));
            if (v42 > v46)
            {
              if (data[v46] >= 0.3)
                v24 = 1;
              if (*(float *)(v39 + 4 * v44) >= 0.3)
                v23 = 1;
              v47 = *((float *)v31 + v46);
              if (v47 > 0.7)
              {
                v48 = fmin((float)(v47 + *(float *)(v38 + 4 * v44)), 1.0);
                *(float *)(v38 + 4 * v44) = v48;
              }
              v49 = *(float *)(v40 + 4 * v46);
              if (v49 > 0.7)
              {
                v50 = fmin((float)(v49 + *(float *)(v39 + 4 * v44)), 1.0);
                *(float *)(v39 + 4 * v44) = v50;
              }
            }
            ++v44;
          }
          while (v35 != v44);
        }
        ++v32;
        v38 += v43;
        v39 += v43;
      }
      while (v32 != v30);
    }
    else
    {
      v23 = 0;
      a2 = v25;
    }
    free(v31);
    free((void *)v594);
  }
  v581 = 0;
  v534 = v23;
  v532 = a2;
  -[CRNeuralTextDetectorV3 runNMSForDirection:adjustedSize:fullTileMaps:adjustedFullTileSize:targetSize:targetSizeFullTile:intermediateResults:withScaleIds:sourceImageSize:tileRects:isHorizontal:resultTextFeatures:quadFeatures:isFineScaleVerticalLinkActive:isFullTileVerticalLinkActive:idxLog:](a1, a2, v538, v537, &v586, v536, 1, &v581, a8, a9, a10, a11, (uint64_t *)&v583, v23 != 0, v24 != 0, &v582);
  v535 = v581;
  if (&v586 != (__int128 *)v543)
  {
    v51 = (uint64_t *)(*((_QWORD *)&v586 + 1) + 8 * ((unint64_t)v588 >> 12));
    if ((_QWORD)v587 == *((_QWORD *)&v586 + 1))
    {
      v52 = 0;
      v54 = 0;
      v53 = (char *)(*((_QWORD *)&v586 + 1) + 8 * ((*((_QWORD *)&v588 + 1) + (_QWORD)v588) >> 12));
    }
    else
    {
      v52 = (char *)(*v51 + (v588 & 0xFFF));
      v53 = (char *)(*((_QWORD *)&v586 + 1) + 8 * ((*((_QWORD *)&v588 + 1) + (_QWORD)v588) >> 12));
      v54 = (char *)(*(_QWORD *)v53 + ((WORD4(v588) + (_WORD)v588) & 0xFFF));
    }
    if (v54 == v52)
    {
      v55 = 0;
      v61 = (uint64_t *)v543;
      v57 = &v543[2].i64[1];
    }
    else
    {
      v55 = &v54[512 * (v53 - (char *)v51)] - &v52[*(_QWORD *)v53] + *v51;
      v57 = &v543[2].i64[1];
      v56 = v543[2].u64[1];
      if (v56 < v55)
      {
        if (v56)
        {
          v58 = (uint64_t)&v52[v56 - *v51];
          if (v58 < 1)
          {
            v81 = 4095 - v58;
            v59 = &v51[-(v81 >> 12)];
            v60 = (char *)(*v59 + (~(_WORD)v81 & 0xFFF));
          }
          else
          {
            v59 = &v51[(unint64_t)v58 >> 12];
            v60 = (char *)(*v59 + (v58 & 0xFFF));
          }
        }
        else
        {
          v60 = v52;
          v59 = (uint64_t *)(*((_QWORD *)&v586 + 1) + 8 * ((unint64_t)v588 >> 12));
        }
        v82 = v543->i64[1];
        if (v543[1].i64[0] == v82)
          v83 = 0;
        else
          v83 = *(_QWORD *)(v82 + 8 * ((unint64_t)v543[2].i64[0] >> 12)) + (v543[2].i64[0] & 0xFFF);
        v609.data = (void *)(v82 + 8 * ((unint64_t)v543[2].i64[0] >> 12));
        v609.height = v83;
        std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(v51, v52, v59, v60, (uint64_t)&v609);
        v84 = v543->i64[1];
        v85 = v543[1].i64[0];
        v86 = ((v85 - v84) << 9) - 1;
        if (v85 == v84)
          v86 = 0;
        v87 = v543[2].i64[1];
        v88 = v543[2].i64[0] + v87;
        v89 = v86 - v88;
        if (v55 - v87 <= v89)
        {
          v90 = v543[2].i64[1];
        }
        else
        {
          std::deque<unsigned char>::__add_back_capacity(v543, v55 - v87 - v89);
          v90 = v543[2].i64[1];
          v84 = v543->i64[1];
          v85 = v543[1].i64[0];
          v88 = v543[2].i64[0] + v90;
        }
        v91 = (_QWORD *)(v84 + 8 * (v88 >> 12));
        if (v85 == v84)
          v92 = 0;
        else
          v92 = (_BYTE *)(*v91 + (v88 & 0xFFF));
        v93 = (uint64_t)v92;
        v94 = v91;
        if (v55 != v87)
        {
          v95 = (uint64_t)&v92[v55 - v87 - *v91];
          if (v95 < 1)
          {
            v96 = 4095 - v95;
            LOWORD(v95) = ~(4095 - v95);
            v94 = &v91[-(v96 >> 12)];
          }
          else
          {
            v94 = &v91[(unint64_t)v95 >> 12];
          }
          v93 = *v94 + (v95 & 0xFFF);
        }
        while (v92 != (_BYTE *)v93)
        {
          v97 = v93;
          if (v91 != v94)
            v97 = *v91 + 4096;
          if (v92 == (_BYTE *)v97)
          {
            v97 = (uint64_t)v92;
          }
          else
          {
            v98 = v92;
            do
            {
              v99 = *v60++;
              *v98++ = v99;
              if (&v60[-*v59] == (char *)4096)
              {
                v100 = (char *)v59[1];
                ++v59;
                v60 = v100;
              }
            }
            while (v98 != (_BYTE *)v97);
            v90 = *v57;
          }
          v90 += v97 - (_QWORD)v92;
          *v57 = v90;
          if (v91 == v94)
            break;
          v101 = (_BYTE *)v91[1];
          ++v91;
          v92 = v101;
        }
        goto LABEL_87;
      }
      v61 = (uint64_t *)v543;
    }
    v62 = v61[1];
    v63 = (_QWORD *)(v62 + 8 * ((unint64_t)v61[4] >> 12));
    if (v61[2] == v62)
    {
      v64 = 0;
      if (v55)
      {
LABEL_38:
        v65 = (uint64_t)&v52[v55 - *v51];
        if (v65 < 1)
        {
          v68 = 4095 - v65;
          v66 = &v51[-(v68 >> 12)];
          v67 = (char *)(*v66 + (~(_WORD)v68 & 0xFFF));
        }
        else
        {
          v66 = &v51[(unint64_t)v65 >> 12];
          v67 = (char *)(*v66 + (v65 & 0xFFF));
        }
        goto LABEL_43;
      }
    }
    else
    {
      v64 = *v63 + (v61[4] & 0xFFF);
      if (v55)
        goto LABEL_38;
    }
    v67 = v52;
    v66 = (uint64_t *)(*((_QWORD *)&v586 + 1) + 8 * ((unint64_t)v588 >> 12));
LABEL_43:
    v609.data = v63;
    v609.height = v64;
    std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(v51, v52, v66, v67, (uint64_t)&v609);
    v69 = v543[2].i64[0];
    v70 = v543[2].i64[1];
    v72 = v543->i64[1];
    v71 = v543[1].i64[0];
    v73 = (char *)(v72 + 8 * ((unint64_t)(v69 + v70) >> 12));
    if (v71 == v72)
      v74 = 0;
    else
      v74 = *(_QWORD *)v73 + (((_WORD)v69 + (_WORD)v70) & 0xFFF);
    if (v74 != v609.height)
    {
      v75 = v74 + ((v73 - (char *)v609.data) << 9) - v609.height - *(_QWORD *)v73 + *(_QWORD *)v609.data;
      if (v75 >= 1)
      {
        v76 = v71 == v72 ? 0 : ((v71 - v72) << 9) - 1;
        v77 = v70 - v75;
        *v57 = v77;
        if ((unint64_t)(v76 - v69 - v77) >= 0x2000)
        {
          do
          {
            operator delete(*(void **)(v71 - 8));
            v78 = (uint64_t *)v543;
            v79 = v543->i64[1];
            v71 = v543[1].i64[0] - 8;
            v543[1].i64[0] = v71;
            if (v71 == v79)
              v80 = 0;
            else
              v80 = ((v71 - v79) << 9) - 1;
          }
          while ((unint64_t)(v80 - (v78[5] + v78[4])) >> 13);
        }
      }
    }
  }
LABEL_87:
  if (v534 | v24)
  {
    v579 = 0u;
    v580 = 0u;
    v578 = 0u;
    v575 = 0.0;
    v576 = 0;
    v577 = 0;
    v574 = 0;
    -[CRNeuralTextDetectorV3 runNMSForDirection:adjustedSize:fullTileMaps:adjustedFullTileSize:targetSize:targetSizeFullTile:intermediateResults:withScaleIds:sourceImageSize:tileRects:isHorizontal:resultTextFeatures:quadFeatures:isFineScaleVerticalLinkActive:isFullTileVerticalLinkActive:idxLog:](a1, v532, v538, v537, &v578, v536, 0, &v574, a8, a9, a10, a11, (uint64_t *)&v575, v534 != 0, v24 != 0, &v582);
    v102 = v574;
    v533 = v535;
    v539 = v102;
    v103 = *(_QWORD *)&v575;
    if (v576 != *(__int128 **)&v575)
    {
      v104 = 0;
      v105 = 140;
      do
      {
        *(_DWORD *)(v103 + v105) += 1022611261 * ((unint64_t)((char *)v584 - (char *)v583) >> 3);
        objc_msgSend(v539, "objectAtIndexedSubscript:", v104);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setFeatureID:", objc_msgSend(v106, "featureID")+ 1022611261 * ((unint64_t)((char *)v584 - (char *)v583) >> 3));

        ++v104;
        v103 = *(_QWORD *)&v575;
        v105 += 168;
      }
      while (v104 < 0xCF3CF3CF3CF3CF3DLL * (((uint64_t)v576 - *(_QWORD *)&v575) >> 3));
    }
    v545 = objc_msgSend(v533, "count");
    v107 = objc_msgSend(v539, "count");
    LOBYTE(v609.data) = 1;
    std::vector<BOOL>::vector(&v593, (int)v545, (unsigned __int8 *)&v609);
    LOBYTE(v609.data) = 1;
    std::vector<BOOL>::vector(&v592, v107, (unsigned __int8 *)&v609);
    v108 = v533;
    v542 = v539;
    v530 = v108;
    CRDetectorPostProcessV3::Graph::Graph((CRDetectorPostProcessV3::Graph *)&v590, objc_msgSend(v542, "count") + objc_msgSend(v108, "count"));
    v599 = 0u;
    v600 = 0u;
    memset(&v598, 0, sizeof(v598));
    v549 = v108;
    v109 = objc_msgSend(v549, "countByEnumeratingWithState:objects:count:", &v598, &v609, 16);
    if (v109)
    {
      v548 = 0;
      v540 = *(_QWORD *)v598.width;
      v554 = 3.40282347e38;
      v553 = 0.349999994;
      v552 = 0.100000001;
      do
      {
        v544 = 0;
        v541 = v109;
        do
        {
          if (*(_QWORD *)v598.width != v540)
            objc_enumerationMutation(v549);
          v110 = *(void **)(v598.height + 8 * v544);
          v594 = 0u;
          v595 = 0u;
          v596 = 0u;
          v597 = 0u;
          v550 = v542;
          v111 = objc_msgSend(v550, "countByEnumeratingWithState:objects:count:", &v594, v608, 16);
          if (v111)
          {
            v551 = 0;
            v112 = *(_QWORD *)v595;
            do
            {
              for (i = 0; i != v111; ++i)
              {
                if (*(_QWORD *)v595 != v112)
                  objc_enumerationMutation(v550);
                v114 = *(void **)(*((_QWORD *)&v594 + 1) + 8 * i);
                v115 = v110;
                v116 = v114;
                -[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:](v115, &v589, &v605, 1u, v555, v556);
                -[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:](v116, &v604, &v603, 0, v555, v556);
                v117 = v589;
                v118 = v605;
                v119 = v604;
                v120 = v603;
                v121 = +[CRGeometryUtilities checkIntersectionForLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:](CRGeometryUtilities, "checkIntersectionForLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:", &v602, *(_OWORD *)&v589, *(_OWORD *)&v605, *(_OWORD *)&v604, *(_OWORD *)&v603);
                LODWORD(v114) = +[CRGeometryUtilities checkIntersectionForLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:](CRGeometryUtilities, "checkIntersectionForLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:", &v601, *(_OWORD *)&v119, *(_OWORD *)&v120, *(_OWORD *)&v117, *(_OWORD *)&v118);

                v122 = v115;
                v123 = v116;
                objc_msgSend(v122, "topLeft");
                v565 = v124;
                objc_msgSend(v122, "bottomLeft");
                v564 = v125;
                objc_msgSend(v122, "topLeft");
                *(double *)&v563 = v126;
                objc_msgSend(v122, "bottomLeft");
                v562 = v127;
                objc_msgSend(v122, "topRight");
                v561 = v128;
                objc_msgSend(v122, "bottomRight");
                v560 = v129;
                objc_msgSend(v122, "topRight");
                v559 = v130;
                objc_msgSend(v122, "bottomRight");
                v132 = v131;
                objc_msgSend(v123, "topLeft");
                v134 = v133;
                objc_msgSend(v123, "bottomLeft");
                v136 = v135;
                objc_msgSend(v123, "topLeft");
                v138 = v137;
                objc_msgSend(v123, "bottomLeft");
                v140 = v139;
                objc_msgSend(v123, "topRight");
                v142 = v141;
                objc_msgSend(v123, "bottomRight");
                v144 = v143;
                objc_msgSend(v123, "topRight");
                v146 = v145;
                objc_msgSend(v123, "bottomRight");
                v148 = v121 & v114;
                v149 = (v565 + v564) * 0.5;
                *(double *)&v150 = (*(double *)&v563 + v562) * 0.5;
                v151 = (v561 + v560) * 0.5;
                v152 = (v134 + v136) * 0.5;
                v153 = (v142 + v144) * 0.5;
                v564 = v151;
                v565 = (v559 + v132) * 0.5;
                v562 = v149;
                v563 = v150;
                v154 = (v565 - *(double *)&v150) / (v151 - v149);
                if (v149 == v151)
                  v154 = v554;
                v557 = v154;
                v558 = (v134 + v136) * 0.5;
                v560 = (v142 + v144) * 0.5;
                v561 = (v146 + v147) * 0.5;
                v559 = (v138 + v140) * 0.5;
                if (v152 == v153)
                  v155 = v554;
                else
                  v155 = ((v146 + v147) * 0.5 - (v138 + v140) * 0.5) / (v153 - v152);
                objc_msgSend(v122, "topLeft");
                v157 = v156;
                objc_msgSend(v122, "bottomLeft");
                v159 = v158;
                objc_msgSend(v122, "topLeft");
                v161 = v160;
                objc_msgSend(v122, "bottomLeft");
                v163 = v162;
                objc_msgSend(v123, "topLeft");
                v165 = v164;
                objc_msgSend(v123, "bottomLeft");
                v167 = v166;
                objc_msgSend(v123, "topLeft");
                v169 = v168;
                objc_msgSend(v123, "bottomLeft");
                v170 = vabdd_f64(v557, v155);
                v171 = v157 - v159;
                v172 = v161 - v163;
                v173 = (float)(v171 * v171) + (float)(v172 * v172);
                v174 = v165 - v167;
                *(float *)&v175 = v169 - v175;
                v176 = fminf(v173, (float)(v174 * v174) + (float)(*(float *)&v175 * *(float *)&v175)) * v553 * v553;
                v177 = v562 - v558;
                v178 = *(double *)&v563 - v559;
                v179 = v176 >= (float)((float)(v177 * v177) + (float)(v178 * v178));
                v180 = v564 - v560;
                v181 = v565 - v561;
                if (v176 < (float)((float)(v180 * v180) + (float)(v181 * v181)))
                  v179 = 0;
                v182 = v170 < v552 && v179;

                if ((v148 | v182) == 1)
                  CRDetectorPostProcessV3::Graph::addEdge((CRDetectorPostProcessV3::Graph *)&v590, v548, v551 + i + objc_msgSend(v549, "count"));
              }
              v111 = objc_msgSend(v550, "countByEnumeratingWithState:objects:count:", &v594, v608, 16);
              v551 = (v551 + i);
            }
            while (v111);
          }

          ++v548;
          ++v544;
        }
        while (v544 != v541);
        v109 = objc_msgSend(v549, "countByEnumeratingWithState:objects:count:", &v598, &v609, 16);
      }
      while (v109);
    }

    CRDetectorPostProcessV3::Graph::connectedComponents((CRDetectorPostProcessV3::Graph *)&v590, (uint64_t *)&v589);
    v183 = v589.f64[0];
    if (*(_QWORD *)&v589.f64[1] != *(_QWORD *)&v589.f64[0])
    {
      for (j = 0; 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v589.f64[1] - *(_QWORD *)&v183) >> 3) > j; ++j)
      {
        v186 = *(int **)(*(_QWORD *)&v183 + 24 * j);
        v185 = *(int **)(*(_QWORD *)&v183 + 24 * j + 8);
        v187 = (char *)v185 - (char *)v186;
        if (v185 == v186)
        {
          v192 = v187 >> 2;
          v190 = 0.0;
          v189 = 0.0;
          if (v187 >> 2)
            goto LABEL_128;
        }
        else
        {
          v188 = 0;
          v189 = 0.0;
          v185 = *(int **)(*(_QWORD *)&v183 + 24 * j);
          v190 = 0.0;
          do
          {
            v191 = v185[v188];
            if (objc_msgSend(v549, "count") <= v191)
              v189 = v189
                   + *(double *)(*(_QWORD *)&v575 + 168 * ((int)v191 - (int)v545) + 112)
                   * *(double *)(*(_QWORD *)&v575 + 168 * ((int)v191 - (int)v545) + 120)
                   * *(double *)(*(_QWORD *)&v575 + 168 * ((int)v191 - (int)v545) + 128);
            else
              v190 = v190 + v583[21 * (int)v191 + 14] * v583[21 * (int)v191 + 15] * v583[21 * (int)v191 + 16];
            ++v188;
            v183 = v589.f64[0];
            v185 = *(int **)(*(_QWORD *)&v589.f64[0] + 24 * j);
            v192 = (uint64_t)(*(_QWORD *)(*(_QWORD *)&v589.f64[0] + 24 * j + 8) - (_QWORD)v185) >> 2;
          }
          while (v192 > v188);
          if (v192)
          {
LABEL_128:
            v193 = v593;
            v194 = v592;
            do
            {
              v196 = *v185++;
              v195 = v196;
              if ((int)v196 < (int)v545 && v190 < v189)
                *(_QWORD *)&v193[(v195 >> 3) & 0x1FFFFFFFFFFFFFF8] &= ~(1 << v195);
              v198 = (int)v195 < (int)v545 || v189 > v190;
              if (!v198)
                *(_QWORD *)&v194[((unint64_t)((int)v195 - (int)v545) >> 3) & 0x1FFFFFFFFFFFFFF8] &= ~(1 << (v195 - v545));
              --v192;
            }
            while (v192);
          }
        }
      }
    }
    v199 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v200 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v599 = 0u;
    v600 = 0u;
    memset(&v598, 0, sizeof(v598));
    v201 = v549;
    v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v598, &v609, 16);
    if (v202)
    {
      v203 = 0;
      v204 = *(_QWORD *)v598.width;
      do
      {
        v205 = 0;
        v206 = v203;
        v203 += v202;
        do
        {
          if (*(_QWORD *)v598.width != v204)
            objc_enumerationMutation(v201);
          if (((*(_QWORD *)&v593[((unint64_t)(v206 + v205) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v206 + v205)) & 1) != 0)
            v207 = v199;
          else
            v207 = v200;
          objc_msgSend(v207, "addObject:", *(_QWORD *)(v598.height + 8 * v205++));
        }
        while (v202 != v205);
        v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v598, &v609, 16);
      }
      while (v202);
    }

    v596 = 0u;
    v597 = 0u;
    v594 = 0u;
    v595 = 0u;
    v208 = v542;
    v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v594, v608, 16);
    if (v209)
    {
      v210 = 0;
      v211 = *(_QWORD *)v595;
      do
      {
        v212 = 0;
        v213 = v210;
        v210 += v209;
        do
        {
          if (*(_QWORD *)v595 != v211)
            objc_enumerationMutation(v208);
          if (((*(_QWORD *)&v592[((unint64_t)(v213 + v212) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v213 + v212)) & 1) != 0)
            v214 = v199;
          else
            v214 = v200;
          objc_msgSend(v214, "addObject:", *(_QWORD *)(*((_QWORD *)&v594 + 1) + 8 * v212++));
        }
        while (v209 != v212);
        v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v594, v608, 16);
      }
      while (v209);
    }

    if (objc_msgSend(v200, "count"))
    {
      v215 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v216 = v538;
      if ((_BYTE)v534)
        v216 = v532;
      CRDetectorPostProcessV3::getSplitComponents(v199, v200, (const CRImageBuffer *)*v216, v215);
      objc_msgSend(v199, "arrayByAddingObjectsFromArray:", v215);
      v217 = objc_claimAutoreleasedReturnValue();

      v199 = (id)v217;
    }

    *(_QWORD *)&v605.f64[0] = &v589;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v605);
    *(_QWORD *)&v589.f64[0] = &v591;
    std::vector<std::list<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v589);
    if (v592)
      operator delete(v592);
    if (v593)
      operator delete(v593);

    v218 = *(_QWORD *)&v575;
    v219 = v576;
    if ((uint64_t)v576 - *(_QWORD *)&v575 < 1)
      goto LABEL_222;
    v220 = ((uint64_t)v576 - *(_QWORD *)&v575) / 168;
    v221 = (unint64_t)v584;
    if ((uint64_t)(0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(rowBytes - (_QWORD)v584) >> 3)) < v220)
    {
      v222 = 0xCF3CF3CF3CF3CF3DLL * (((char *)v584 - (char *)v583) >> 3);
      v223 = v222 + v220;
      if (v222 + v220 > 0x186186186186186)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      if (0x9E79E79E79E79E7ALL * ((uint64_t)(rowBytes - (_QWORD)v583) >> 3) > v223)
        v223 = 0x9E79E79E79E79E7ALL * ((uint64_t)(rowBytes - (_QWORD)v583) >> 3);
      if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(rowBytes - (_QWORD)v583) >> 3) >= 0xC30C30C30C30C3)
        v224 = 0x186186186186186;
      else
        v224 = v223;
      v610 = &rowBytes;
      if (v224)
        v225 = std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>((uint64_t)&rowBytes, v224);
      else
        v225 = 0;
      v267 = (vImagePixelCount)v225 + 168 * v222;
      v609.data = v225;
      v609.height = v267;
      v609.width = v267;
      v609.rowBytes = (size_t)v225 + 168 * v224;
      v268 = 168 * v220;
      v269 = v267 + 168 * v220;
      do
      {
        std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::construct[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuadFeature,CRDetectorUtils::CRTextDetectorQuadFeature&>(v267, (__int128 *)v218);
        v267 += 168;
        v218 += 168;
        v268 -= 168;
      }
      while (v268);
      v609.width = v269;
      std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>,std::reverse_iterator<CRDetectorUtils::CRTextDetectorQuadFeature*>,std::reverse_iterator<CRDetectorUtils::CRTextDetectorQuadFeature*>,std::reverse_iterator<CRDetectorUtils::CRTextDetectorQuadFeature*>>((uint64_t)&rowBytes, v221, v221, (uint64_t)v583, (uint64_t)v583, v609.height, v609.height);
      v271 = (vImagePixelCount)v584;
      v272 = v609.width;
      if (v584 == (void ***)v221)
      {
        v271 = v221;
      }
      else
      {
        do
        {
          v273 = *(_OWORD *)v221;
          v274 = *(_OWORD *)(v221 + 16);
          v275 = *(_OWORD *)(v221 + 48);
          *(_OWORD *)(v272 + 32) = *(_OWORD *)(v221 + 32);
          *(_OWORD *)(v272 + 48) = v275;
          *(_OWORD *)v272 = v273;
          *(_OWORD *)(v272 + 16) = v274;
          *(_QWORD *)(v272 + 72) = 0;
          *(_QWORD *)(v272 + 80) = 0;
          *(_QWORD *)(v272 + 64) = 0;
          *(_OWORD *)(v272 + 64) = *(_OWORD *)(v221 + 64);
          *(_QWORD *)(v272 + 80) = *(_QWORD *)(v221 + 80);
          *(_QWORD *)(v221 + 64) = 0;
          *(_QWORD *)(v221 + 72) = 0;
          *(_QWORD *)(v221 + 80) = 0;
          v276 = *(_OWORD *)(v221 + 88);
          v277 = *(_OWORD *)(v221 + 104);
          v278 = *(_QWORD *)(v221 + 136);
          *(_OWORD *)(v272 + 120) = *(_OWORD *)(v221 + 120);
          *(_OWORD *)(v272 + 104) = v277;
          *(_OWORD *)(v272 + 88) = v276;
          *(_QWORD *)(v272 + 136) = v278;
          *(_QWORD *)(v272 + 144) = 0;
          *(_QWORD *)(v272 + 152) = 0;
          *(_QWORD *)(v272 + 160) = 0;
          *(_OWORD *)(v272 + 144) = *(_OWORD *)(v221 + 144);
          *(_QWORD *)(v272 + 160) = *(_QWORD *)(v221 + 160);
          *(_QWORD *)(v221 + 144) = 0;
          *(_QWORD *)(v221 + 152) = 0;
          *(_QWORD *)(v221 + 160) = 0;
          v272 += 168;
          v221 += 168;
        }
        while (v221 != v271);
      }
      v279 = v583;
      v280 = rowBytes;
      v583 = v270;
      v584 = (void ***)v272;
      rowBytes = v609.rowBytes;
      v609.width = v271;
      v609.rowBytes = v280;
      v609.height = (vImagePixelCount)v279;
      v609.data = v279;
      std::__split_buffer<CRDetectorUtils::CRTextDetectorQuadFeature>::~__split_buffer(&v609.data);
      goto LABEL_222;
    }
    if (v220 > 0)
    {
      v608[0] = v584;
      v598.data = v584;
      v226 = *(__int128 **)&v575;
      v609.data = &rowBytes;
      v609.height = (vImagePixelCount)&v598;
      v609.width = (vImagePixelCount)v608;
      LOBYTE(v609.rowBytes) = 0;
      v227 = v584;
      if (*(__int128 **)&v575 != v576)
      {
        v564 = v575;
        do
        {
          std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::construct[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuadFeature,CRDetectorUtils::CRTextDetectorQuadFeature&>((uint64_t)v227, v226);
          v226 = (__int128 *)((char *)v226 + 168);
          v227 = v608[0] + 21;
          v608[0] += 21;
        }
        while (v226 != v219);
      }
      v584 = v227;
      goto LABEL_222;
    }
    *(_QWORD *)&v564 = *(_QWORD *)&v575 + 168 * v220;
    v228 = &v584[21 * v220];
    v229 = &v584[-21 * v220];
    v230 = v584;
    if (v229 < v584)
    {
      v231 = &v584[-21 * v220];
      v230 = v584;
      do
      {
        v232 = *(_OWORD *)v231;
        v233 = *((_OWORD *)v231 + 1);
        v234 = *((_OWORD *)v231 + 3);
        *((_OWORD *)v230 + 2) = *((_OWORD *)v231 + 2);
        *((_OWORD *)v230 + 3) = v234;
        *(_OWORD *)v230 = v232;
        *((_OWORD *)v230 + 1) = v233;
        v230[9] = 0;
        v230[10] = 0;
        v230[8] = 0;
        *((_OWORD *)v230 + 4) = *((_OWORD *)v231 + 4);
        v230[10] = v231[10];
        v231[8] = 0;
        v231[9] = 0;
        v231[10] = 0;
        v235 = *(_OWORD *)(v231 + 11);
        v236 = *(_OWORD *)(v231 + 13);
        v237 = v231[17];
        *(_OWORD *)(v230 + 15) = *(_OWORD *)(v231 + 15);
        *(_OWORD *)(v230 + 13) = v236;
        *(_OWORD *)(v230 + 11) = v235;
        v230[17] = v237;
        v230[18] = 0;
        v230[19] = 0;
        v230[20] = 0;
        *((_OWORD *)v230 + 9) = *((_OWORD *)v231 + 9);
        v230[20] = v231[20];
        v231[18] = 0;
        v231[19] = 0;
        v231[20] = 0;
        v230 += 21;
        v231 += 21;
      }
      while ((unint64_t)v231 < v221);
    }
    v584 = v230;
    if ((void ***)v221 != v228)
    {
      v238 = 0;
      *(_QWORD *)&v565 = -8 * ((uint64_t)(v221 - (_QWORD)v228) >> 3);
      do
      {
        v239 = &v229[v238 / 8];
        v240 = v221 + v238;
        v241 = *(_OWORD *)&v229[v238 / 8 - 21];
        v242 = *(_OWORD *)&v229[v238 / 8 - 19];
        v243 = *(_OWORD *)&v229[v238 / 8 - 17];
        *(_OWORD *)(v240 - 120) = *(_OWORD *)&v229[v238 / 8 - 15];
        *(_OWORD *)(v240 - 136) = v243;
        *(_OWORD *)(v240 - 152) = v242;
        *(_OWORD *)(v240 - 168) = v241;
        std::vector<int>::__move_assign(v221 + v238 - 104, (__n128 *)&v229[v238 / 8 - 13]);
        v244 = *(_OWORD *)&v229[v238 / 8 - 10];
        v245 = *(_OWORD *)&v229[v238 / 8 - 8];
        v246 = *(_OWORD *)&v229[v238 / 8 - 6];
        *(_QWORD *)(v240 - 32) = v229[v238 / 8 - 4];
        *(_OWORD *)(v240 - 64) = v245;
        *(_OWORD *)(v240 - 48) = v246;
        *(_OWORD *)(v240 - 80) = v244;
        std::vector<CRDetectorUtils::CRTextDetectorQuad>::__vdeallocate((uint64_t *)(v221 + v238 - 24));
        *(_OWORD *)(v240 - 24) = *(_OWORD *)&v229[v238 / 8 - 3];
        *(_QWORD *)(v240 - 8) = v229[v238 / 8 - 1];
        *(v239 - 3) = 0;
        *(v239 - 2) = 0;
        *(v239 - 1) = 0;
        v238 -= 168;
      }
      while (*(_QWORD *)&v565 != v238);
    }
    v247 = v564;
    if (*(_QWORD *)&v564 == v218)
    {
LABEL_222:
      v282 = v543[2].u64[0];
      v281 = v543[2].i64[1];
      v283 = v282 + v281;
      v284 = (v282 + v281) >> 12;
      v285 = v543->i64[1];
      v286 = v543[1].i64[0];
      v287 = (char *)(v285 + 8 * v284);
      if (v286 == v285)
        v288 = 0;
      else
        v288 = *(_QWORD *)v287 + (v283 & 0xFFF);
      v289 = *((_QWORD *)&v578 + 1) + 8 * ((unint64_t)v580 >> 12);
      if ((_QWORD)v579 == *((_QWORD *)&v578 + 1))
      {
        v290 = 0.0;
        *(double *)&v291 = 0.0;
        *(_QWORD *)&v564 = *((_QWORD *)&v578 + 1) + 8 * ((*((_QWORD *)&v580 + 1) + (_QWORD)v580) >> 12);
      }
      else
      {
        *(_QWORD *)&v290 = *(_QWORD *)v289 + (v580 & 0xFFF);
        *(_QWORD *)&v564 = *((_QWORD *)&v578 + 1) + 8 * ((*((_QWORD *)&v580 + 1) + (_QWORD)v580) >> 12);
        v291 = **(_QWORD **)&v564 + ((*((_QWORD *)&v580 + 1) + v580) & 0xFFF);
      }
      v565 = *(double *)&v291;
      if (v291 == *(_QWORD *)&v290)
        v292 = 0.0;
      else
        *(_QWORD *)&v292 = v291
                         + ((*(_QWORD *)&v564 - v289) << 9)
                         - (*(_QWORD *)&v290
                          + **(_QWORD **)&v564)
                         + *(_QWORD *)v289;
      v293 = v282 >> 12;
      v294 = (char *)(v285 + 8 * (v282 >> 12));
      v295 = v286 - v285;
      if (v286 == v285)
        v296 = 0;
      else
        v296 = *(_QWORD *)v294 + (v282 & 0xFFF);
      if (v288 == v296)
        v297 = 0.0;
      else
        *(_QWORD *)&v297 = v288 + ((v287 - v294) << 9) - v296 - *(_QWORD *)v287 + *(_QWORD *)v294;
      *(double *)&v563 = v297;
      if (*(_QWORD *)&v297 < (unint64_t)(v281 - *(_QWORD *)&v297))
      {
        v298 = *(_QWORD *)&v292 - v282;
        if (*(_QWORD *)&v292 > v282)
        {
          v299 = (v295 << 9) - 1;
          v300 = v286 - v285;
          if (v286 == v285)
          {
            v299 = 0;
            ++v298;
          }
          if ((v298 & 0xFFF) != 0)
            v301 = (v298 >> 12) + 1;
          else
            v301 = v298 >> 12;
          v302 = v299 - v283;
          if (v301 >= v302 >> 12)
            v303 = v302 >> 12;
          else
            v303 = v301;
          if (v301 <= v302 >> 12)
          {
            for (v543[2].i64[0] = v282 + (v303 << 12); v303; --v303)
            {
              v320 = (uint64_t *)v543;
              v321 = v543[1].i64[0];
              v609.data = *(void **)(v321 - 8);
              v543[1].i64[0] = v321 - 8;
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)v320, &v609);
            }
          }
          else
          {
            v304 = v301 - v303;
            v305 = v543[1].i64[1] - v543->i64[0];
            if (v301 - v303 <= (v305 >> 3) - (v300 >> 3))
            {
              if (v304)
              {
                if (v285 == v543->i64[0])
                {
LABEL_281:
                  v326 = v304;
                  do
                  {
                    v609.data = operator new(0x1000uLL);
                    std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_back(v543, &v609);
                    --v326;
                  }
                  while (v326);
                  v303 += v304;
                  v323 = (uint64_t *)v543;
                  v282 = v543[2].u64[0];
                }
                else
                {
                  v323 = (uint64_t *)v543;
                  while (1)
                  {
                    v609.data = operator new(0x1000uLL);
                    std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)v323, &v609);
                    v324 = v323[1];
                    v325 = v323[2] - v324 == 8 ? 4095 : 4096;
                    v282 = v325 + v323[4];
                    v323[4] = v282;
                    if (!--v304)
                      break;
                    if (v324 == *v323)
                      goto LABEL_281;
                  }
                }
              }
              else
              {
                v323 = (uint64_t *)v543;
              }
              for (v323[4] = v282 + (v303 << 12); v303; --v303)
              {
                v436 = (uint64_t *)v543;
                v437 = v543[1].i64[0];
                v609.data = *(void **)(v437 - 8);
                v543[1].i64[0] = v437 - 8;
                std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)v436, &v609);
              }
            }
            else
            {
              v306 = v286 == v285;
              v307 = v304 + (v300 >> 3);
              if (v305 >> 2 <= v307)
                v308 = v307;
              else
                v308 = v305 >> 2;
              v610 = &v543[1].u64[1];
              if (v308)
                v309 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v543[1].i64[1], v308);
              else
                v309 = 0;
              *(_QWORD *)&v560 = (v301 << 12) - v306;
              v609.data = v309;
              v609.height = (vImagePixelCount)v309;
              v609.width = (vImagePixelCount)v309;
              v609.rowBytes = (size_t)v309 + 8 * v308;
              do
              {
                v608[0] = (void ***)operator new(0x1000uLL);
                std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *> &>::push_back(&v609, v608);
                --v304;
              }
              while (v304);
              v562 = *(double *)&v289;
              v399 = v543[1].u64[0];
              for (k = (char *)v609.width; v303; --v303)
              {
                if (k == (char *)v609.rowBytes)
                {
                  v401 = v609.height - (unint64_t)v609.data;
                  if ((void *)v609.height <= v609.data)
                  {
                    if (k == v609.data)
                      v408 = 1;
                    else
                      v408 = (k - (char *)v609.data) >> 2;
                    v409 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v610, v408);
                    v411 = (uint64_t *)v609.height;
                    k = &v409[8 * (v408 >> 2)];
                    v412 = v609.width - v609.height;
                    if (v609.width != v609.height)
                    {
                      k = &v409[8 * (v408 >> 2) + (v412 & 0xFFFFFFFFFFFFFFF8)];
                      v413 = 8 * (v412 >> 3);
                      v414 = &v409[8 * (v408 >> 2)];
                      do
                      {
                        v415 = *v411++;
                        *(_QWORD *)v414 = v415;
                        v414 += 8;
                        v413 -= 8;
                      }
                      while (v413);
                    }
                    v416 = v609.data;
                    v609.data = v409;
                    v609.height = (vImagePixelCount)&v409[8 * (v408 >> 2)];
                    v609.width = (vImagePixelCount)k;
                    v609.rowBytes = (size_t)&v409[8 * v410];
                    if (v416)
                    {
                      operator delete(v416);
                      k = (char *)v609.width;
                    }
                  }
                  else
                  {
                    v402 = v401 >> 3;
                    v198 = v401 >> 3 < -1;
                    v403 = (v401 >> 3) + 2;
                    if (v198)
                      v404 = v403;
                    else
                      v404 = v402 + 1;
                    v405 = v609.height - 8 * (v404 >> 1);
                    v406 = &k[-v609.height];
                    if (k != (char *)v609.height)
                    {
                      memmove((void *)(v609.height - 8 * (v404 >> 1)), (const void *)v609.height, (size_t)&k[-v609.height]);
                      k = (char *)v609.height;
                    }
                    v407 = (vImagePixelCount)&k[-8 * (v404 >> 1)];
                    k = &v406[v405];
                    v609.width = (vImagePixelCount)&v406[v405];
                    v609.height = v407;
                  }
                }
                *(_QWORD *)k = *(_QWORD *)(v399 - 8);
                k = (char *)(v609.width + 8);
                v609.width += 8;
                v399 = v543[1].i64[0] - 8;
                v543[1].i64[0] = v399;
              }
              v417 = (uint64_t *)v543->i64[1];
              if (v417 == (uint64_t *)v399)
              {
                v417 = (uint64_t *)v399;
                v435 = (uint64_t *)v543;
              }
              else
              {
                do
                {
                  if (k == (char *)v609.rowBytes)
                  {
                    v418 = v609.height - (unint64_t)v609.data;
                    if ((void *)v609.height <= v609.data)
                    {
                      if (k == v609.data)
                        v425 = 1;
                      else
                        v425 = (k - (char *)v609.data) >> 2;
                      v426 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v610, v425);
                      v428 = (uint64_t *)v609.height;
                      k = &v426[8 * (v425 >> 2)];
                      v429 = v609.width - v609.height;
                      if (v609.width != v609.height)
                      {
                        k = &v426[8 * (v425 >> 2) + (v429 & 0xFFFFFFFFFFFFFFF8)];
                        v430 = 8 * (v429 >> 3);
                        v431 = &v426[8 * (v425 >> 2)];
                        do
                        {
                          v432 = *v428++;
                          *(_QWORD *)v431 = v432;
                          v431 += 8;
                          v430 -= 8;
                        }
                        while (v430);
                      }
                      v433 = v609.data;
                      v609.data = v426;
                      v609.height = (vImagePixelCount)&v426[8 * (v425 >> 2)];
                      v609.width = (vImagePixelCount)k;
                      v609.rowBytes = (size_t)&v426[8 * v427];
                      if (v433)
                      {
                        operator delete(v433);
                        k = (char *)v609.width;
                      }
                    }
                    else
                    {
                      v419 = v418 >> 3;
                      v198 = v418 >> 3 < -1;
                      v420 = (v418 >> 3) + 2;
                      if (v198)
                        v421 = v420;
                      else
                        v421 = v419 + 1;
                      v422 = v609.height - 8 * (v421 >> 1);
                      v423 = &k[-v609.height];
                      if (k != (char *)v609.height)
                      {
                        memmove((void *)(v609.height - 8 * (v421 >> 1)), (const void *)v609.height, (size_t)&k[-v609.height]);
                        k = (char *)v609.height;
                      }
                      v424 = (vImagePixelCount)&k[-8 * (v421 >> 1)];
                      k = &v423[v422];
                      v609.width = (vImagePixelCount)&v423[v422];
                      v609.height = v424;
                    }
                  }
                  v434 = *v417++;
                  *(_QWORD *)k = v434;
                  k = (char *)(v609.width + 8);
                  v609.width += 8;
                }
                while (v417 != (uint64_t *)v543[1].i64[0]);
                v435 = (uint64_t *)v543;
                v399 = v543->u64[1];
              }
              v438 = v609.rowBytes;
              v439 = v435[3];
              v440 = v435[4];
              v435[2] = (uint64_t)k;
              v435[3] = v438;
              v441 = (void *)*v435;
              *(_OWORD *)v435 = *(_OWORD *)&v609.data;
              v609.data = v441;
              v609.height = v399;
              v609.width = (vImagePixelCount)v417;
              v609.rowBytes = v439;
              v435[4] = *(_QWORD *)&v560 + v440;
              if (v417 != (uint64_t *)v399)
                v609.width = (vImagePixelCount)v417 + ((v399 - (_QWORD)v417 + 7) & 0xFFFFFFFFFFFFFFF8);
              if (v441)
                operator delete(v441);
              *(double *)&v289 = v562;
            }
          }
          v282 = v543[2].u64[0];
          v285 = v543->i64[1];
          v286 = v543[1].i64[0];
          v293 = v282 >> 12;
        }
        v442 = (_QWORD *)(v285 + 8 * v293);
        v443 = *(double *)&v563;
        if (v286 == v285)
          v444 = 0;
        else
          v444 = *v442 + (v282 & 0xFFF);
        if (*(_QWORD *)&v292 > (unint64_t)v563)
        {
          if ((unint64_t)v563 >= *(_QWORD *)&v292 >> 1)
          {
            v449 = *(_QWORD *)&v290 - *(_QWORD *)v289 + *(_QWORD *)&v292 - (_QWORD)v563;
            if (v449 < 1)
            {
              v450 = 4095 - v449;
              v289 -= 8 * (v450 >> 12);
              v445 = *(_QWORD *)v289 + (~(_WORD)v450 & 0xFFF);
            }
            else
            {
              v289 += 8 * ((unint64_t)v449 >> 12);
              v445 = *(_QWORD *)v289 + (v449 & 0xFFF);
            }
          }
          else
          {
            *(double *)&v445 = v565;
            if (*(double *)&v563 == 0.0)
            {
              *(double *)&v289 = v564;
            }
            else
            {
              v446 = *(_QWORD *)&v565 - (_QWORD)v563 - **(_QWORD **)&v564;
              if (v446 < 1)
              {
                v451 = 4095 - v446;
                v289 = *(_QWORD *)&v564 - 8 * (v451 >> 12);
                v445 = *(_QWORD *)v289 + (~(_WORD)v451 & 0xFFF);
              }
              else
              {
                v289 = *(_QWORD *)&v564 + 8 * ((unint64_t)v446 >> 12);
                v445 = *(_QWORD *)v289 + (v446 & 0xFFF);
              }
              v443 = *(double *)&v563;
            }
          }
          if (v445 == *(_QWORD *)&v290)
          {
            v447 = v444;
            v448 = v442;
            v292 = v443;
          }
          else
          {
            v452 = (_QWORD *)v289;
            v453 = v445;
            v448 = v442;
            v447 = v444;
            do
            {
              if (v447 == *v448)
              {
                v454 = *--v448;
                v447 = v454 + 4096;
              }
              if (v453 == *v452)
              {
                v455 = *--v452;
                v453 = v455 + 4096;
              }
              v456 = *(_BYTE *)--v453;
              *(_BYTE *)--v447 = v456;
              v543[2] = vaddq_s64(v543[2], (int64x2_t)xmmword_1D513B290);
            }
            while (v453 != *(_QWORD *)&v290);
            v292 = *(double *)&v563;
          }
          v290 = *(double *)&v445;
          if (v292 == 0.0)
            goto LABEL_529;
          goto LABEL_480;
        }
        v447 = v444;
        v448 = v442;
        if (v292 != 0.0)
        {
LABEL_480:
          v457 = v444 - *v442 + *(_QWORD *)&v292;
          if (v457 < 1)
          {
            v460 = 4095 - v457;
            v458 = &v442[-(v460 >> 12)];
            v459 = (_BYTE *)(*v458 + (~(_WORD)v460 & 0xFFF));
          }
          else
          {
            v458 = &v442[(unint64_t)v457 >> 12];
            v459 = (_BYTE *)(*v458 + (v457 & 0xFFF));
          }
          if (v459 != (_BYTE *)v444)
          {
            v461 = v458;
            v462 = v459;
            do
            {
              if (v447 == *v448)
              {
                v463 = *--v448;
                v447 = v463 + 4096;
              }
              if (v462 == (_BYTE *)*v461)
              {
                v464 = *--v461;
                v462 = (_BYTE *)(v464 + 4096);
              }
              v465 = *--v462;
              *(_BYTE *)--v447 = v465;
              v543[2] = vaddq_s64(v543[2], (int64x2_t)xmmword_1D513B290);
            }
            while (v462 != (_BYTE *)v444);
          }
          if (*(_QWORD *)&v292 >= (unint64_t)v563)
          {
            v467 = v565;
          }
          else
          {
            v466 = (uint64_t)v563 + v444 - *v442;
            v467 = v565;
            v561 = v290;
            v562 = *(double *)&v289;
            if (v466 < 1)
            {
              v470 = 4095 - v466;
              *(_QWORD *)&v468 = &v442[-(v470 >> 12)];
              *(_QWORD *)&v469 = **(_QWORD **)&v468 + (~(_WORD)v470 & 0xFFF);
            }
            else
            {
              *(_QWORD *)&v468 = &v442[(unint64_t)v466 >> 12];
              *(_QWORD *)&v469 = **(_QWORD **)&v468 + (v466 & 0xFFF);
            }
            v609.data = v442;
            v609.height = v444;
            v608[0] = (void ***)&v609;
            if (v458 != *(_QWORD **)&v468)
            {
              v560 = v469;
              v472 = *v458;
              v471 = v458 + 1;
              std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v608, v459, (_BYTE *)(v472 + 4096));
              if (v471 != *(uint64_t **)&v468)
              {
                v473 = (void **)v609.data;
                v474 = (char *)v609.height;
                *(double *)&v563 = v468;
                do
                {
                  v475 = 0;
                  v476 = *v471;
                  v478 = (char *)*v473++;
                  v477 = v478;
                  while (1)
                  {
                    v479 = v477 - v474 + 4096;
                    if (4096 - v475 >= v479)
                      v480 = v479;
                    else
                      v480 = 4096 - v475;
                    if (v480)
                      memmove(v474, (const void *)(v476 + v475), v480);
                    v475 += v480;
                    if (v475 == 4096)
                      break;
                    v481 = (char *)*v473++;
                    v477 = v481;
                    v474 = v481;
                  }
                  v474 += v480;
                  if ((char *)*(v473 - 1) + 4096 == v474)
                    v474 = (char *)*v473;
                  else
                    --v473;
                  v467 = v565;
                  v468 = *(double *)&v563;
                  v609.data = v473;
                  v609.height = (vImagePixelCount)v474;
                  ++v471;
                }
                while (v471 != v563);
              }
              v459 = **(_BYTE ***)&v468;
              v469 = v560;
            }
            std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v608, v459, *(_BYTE **)&v469);
            v442 = v609.data;
            v444 = v609.height;
            v290 = v561;
            *(double *)&v289 = v562;
          }
          v609.data = v442;
          v609.height = v444;
          v608[0] = (void ***)&v609;
          if (*(_QWORD *)&v564 != v289)
          {
            v483 = *(_QWORD *)v289;
            v482 = (uint64_t *)(v289 + 8);
            std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v608, *(_BYTE **)&v290, (_BYTE *)(v483 + 4096));
            v484 = *(double **)&v564;
            if (v482 != *(uint64_t **)&v564)
            {
              v485 = (void **)v609.data;
              v486 = (char *)v609.height;
              do
              {
                v487 = 0;
                v488 = *v482;
                v490 = (char *)*v485++;
                v489 = v490;
                while (1)
                {
                  v491 = v489 - v486 + 4096;
                  if (4096 - v487 >= v491)
                    v492 = v491;
                  else
                    v492 = 4096 - v487;
                  if (v492)
                    memmove(v486, (const void *)(v488 + v487), v492);
                  v487 += v492;
                  if (v487 == 4096)
                    break;
                  v493 = (char *)*v485++;
                  v489 = v493;
                  v486 = v493;
                }
                v486 += v492;
                if ((char *)*(v485 - 1) + 4096 == v486)
                  v486 = (char *)*v485;
                else
                  --v485;
                v484 = *(double **)&v564;
                v609.data = v485;
                v609.height = (vImagePixelCount)v486;
                ++v482;
              }
              while (v482 != *(uint64_t **)&v564);
            }
            v290 = *v484;
            v467 = v565;
          }
          std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v608, *(_BYTE **)&v290, *(_BYTE **)&v467);
        }
LABEL_529:
        v609.data = &v575;
        std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)&v609);
        std::deque<unsigned char>::~deque[abi:ne180100](&v578);

        goto LABEL_530;
      }
      v310 = (v295 << 9) - 1;
      if (v286 == v285)
        v310 = 0;
      v311 = v310 - v283;
      if (*(_QWORD *)&v292 > v311)
      {
        std::deque<unsigned char>::__add_back_capacity(v543, *(_QWORD *)&v292 - v311);
        v281 = v543[2].i64[1];
        v285 = v543->i64[1];
        v286 = v543[1].i64[0];
        v283 = v543[2].i64[0] + v281;
        v284 = v283 >> 12;
      }
      v312 = (_QWORD *)(v285 + 8 * v284);
      if (v286 == v285)
        v313 = 0;
      else
        v313 = (char *)(*v312 + (v283 & 0xFFF));
      *(_QWORD *)&v314 = v281 - (_QWORD)v563;
      if (*(_QWORD *)&v314 >= *(_QWORD *)&v292)
      {
        v318 = v313;
        v319 = (_QWORD *)(v285 + 8 * v284);
        if (v292 == 0.0)
          goto LABEL_529;
LABEL_297:
        v333 = (uint64_t)&v313[-*(_QWORD *)&v292 - *v312];
        if (v333 < 1)
        {
          v336 = 4095 - v333;
          *(_QWORD *)&v334 = &v312[-(v336 >> 12)];
          v335 = (char *)(**(_QWORD **)&v334 + (~(_WORD)v336 & 0xFFF));
        }
        else
        {
          *(_QWORD *)&v334 = &v312[(unint64_t)v333 >> 12];
          v335 = (char *)(**(_QWORD **)&v334 + (v333 & 0xFFF));
        }
        if (v335 != v313)
        {
          v337 = v334;
          v338 = v335;
          v339 = (uint64_t *)v543;
          do
          {
            *v318++ = *v338;
            if (&v318[-*v319] == (char *)4096)
            {
              v340 = (char *)v319[1];
              ++v319;
              v318 = v340;
            }
            if (&(++v338)[-**(_QWORD **)&v337] == (char *)4096)
            {
              v341 = *(char **)(*(_QWORD *)&v337 + 8);
              *(_QWORD *)&v337 += 8;
              v338 = v341;
            }
            ++v339[5];
          }
          while (v338 != v313);
        }
        if (*(_QWORD *)&v292 >= *(_QWORD *)&v314)
        {
          v347 = v564;
          v348 = v565;
          goto LABEL_358;
        }
        v342 = v290;
        v343 = (_BYTE *)*v312;
        v344 = (uint64_t)&v313[-*(_QWORD *)&v314 - *v312];
        if (v344 < 1)
        {
          v349 = 4095 - v344;
          *(_QWORD *)&v345 = &v312[-(v349 >> 12)];
          v346 = (char *)(**(_QWORD **)&v345 + (~(_WORD)v349 & 0xFFF));
        }
        else
        {
          *(_QWORD *)&v345 = &v312[(unint64_t)v344 >> 12];
          v346 = (char *)(**(_QWORD **)&v345 + (v344 & 0xFFF));
        }
        if (*(_QWORD *)&v345 == *(_QWORD *)&v334)
        {
          if (v346 == v335)
          {
LABEL_357:
            v347 = v564;
            v348 = v565;
            v290 = v342;
LABEL_358:
            if (v289 == *(_QWORD *)&v347)
            {
              if (*(_QWORD *)&v290 != *(_QWORD *)&v348)
              {
                v393 = (_BYTE *)*v312;
                v392 = v312 - 1;
                v391 = (uint64_t)v393;
                while (1)
                {
                  v394 = &v313[-v391];
                  if (*(_QWORD *)&v565 - *(_QWORD *)&v290 >= (uint64_t)v394)
                    v395 = (size_t)v394;
                  else
                    v395 = *(_QWORD *)&v565 - *(_QWORD *)&v290;
                  *(_QWORD *)&v396 = *(_QWORD *)&v565 - v395;
                  if (v395)
                    memmove(&v313[-v395], (const void *)(*(_QWORD *)&v565 - v395), v395);
                  v565 = v396;
                  if (*(_QWORD *)&v396 == *(_QWORD *)&v290)
                    break;
                  v397 = *v392--;
                  v391 = v397;
                  v313 = (char *)(v397 + 4096);
                }
              }
            }
            else
            {
              v370 = **(_QWORD **)&v347;
              if (**(_QWORD **)&v347 != *(_QWORD *)&v348)
              {
                v371 = *v312;
                while (1)
                {
                  v372 = &v313[-v371];
                  if (*(_QWORD *)&v348 - v370 >= (uint64_t)v372)
                    v373 = (size_t)v372;
                  else
                    v373 = *(_QWORD *)&v348 - v370;
                  *(_QWORD *)&v348 -= v373;
                  v313 -= v373;
                  if (v373)
                    memmove(v313, *(const void **)&v348, v373);
                  if (*(_QWORD *)&v348 == v370)
                    break;
                  v374 = *--v312;
                  v371 = v374;
                  v313 = (char *)(v374 + 4096);
                }
                if ((char *)(*v312 + 4096) == v313)
                {
                  v375 = (char *)v312[1];
                  ++v312;
                  v313 = v375;
                }
                v347 = v564;
              }
              v376 = (_QWORD *)(*(_QWORD *)&v347 - 8);
              if (*(_QWORD *)&v347 - 8 != v289)
              {
                v377 = (_BYTE *)*v312;
                do
                {
                  v378 = (_BYTE *)*v376;
                  v379 = (char *)(*v376 + 4096);
                  while (1)
                  {
                    v380 = (char *)(v313 - v377);
                    if (v379 - v378 >= (uint64_t)v380)
                      v381 = (size_t)v380;
                    else
                      v381 = v379 - v378;
                    v379 -= v381;
                    v313 -= v381;
                    if (v381)
                      memmove(v313, v379, v381);
                    if (v379 == v378)
                      break;
                    v382 = (_BYTE *)*--v312;
                    v377 = v382;
                    v313 = v382 + 4096;
                  }
                  v377 = (_BYTE *)*v312;
                  if ((char *)(*v312 + 4096) == v313)
                  {
                    v383 = (_BYTE *)v312[1];
                    ++v312;
                    v377 = v383;
                    v313 = v383;
                  }
                  --v376;
                }
                while (v376 != (_QWORD *)v289);
              }
              v384 = (char *)(*(_QWORD *)v289 + 4096);
              if (v384 != *(char **)&v290)
              {
                v387 = *v312;
                v386 = v312 - 1;
                v385 = v387;
                while (1)
                {
                  v388 = &v313[-v385];
                  if ((uint64_t)&v384[-*(_QWORD *)&v290] >= (uint64_t)v388)
                    v389 = (size_t)v388;
                  else
                    v389 = (size_t)&v384[-*(_QWORD *)&v290];
                  v384 -= v389;
                  if (v389)
                    memmove(&v313[-v389], v384, v389);
                  if (v384 == *(char **)&v290)
                    break;
                  v390 = *v386--;
                  v385 = v390;
                  v313 = (char *)(v390 + 4096);
                }
              }
            }
            goto LABEL_529;
          }
          while (1)
          {
            if (v335 - v346 >= v313 - v343)
              v367 = v313 - v343;
            else
              v367 = v335 - v346;
            v335 -= v367;
            v313 -= v367;
            if (v367)
              memmove(v313, v335, v367);
            if (v335 == v346)
              break;
            v368 = (_BYTE *)*--v312;
            v343 = v368;
            v313 = v368 + 4096;
          }
        }
        else
        {
          v350 = **(_BYTE ***)&v334;
          v351 = **(_QWORD **)&v334 == (_QWORD)v335;
          v561 = v342;
          v562 = *(double *)&v289;
          if (!v351)
          {
            v560 = v334;
            *(double *)&v563 = v345;
            while (1)
            {
              if (v335 - v350 >= v313 - v343)
                v352 = v313 - v343;
              else
                v352 = v335 - v350;
              v335 -= v352;
              v313 -= v352;
              if (v352)
                memmove(v313, v335, v352);
              if (v335 == v350)
                break;
              v353 = (_BYTE *)*--v312;
              v343 = v353;
              v313 = v353 + 4096;
            }
            v343 = (_BYTE *)*v312;
            if ((char *)(*v312 + 4096) == v313)
            {
              v354 = (_BYTE *)v312[1];
              ++v312;
              v343 = v354;
              v313 = v354;
            }
            v345 = *(double *)&v563;
            v334 = v560;
          }
          for (m = (_QWORD *)(*(_QWORD *)&v334 - 8); m != *(_QWORD **)&v345; --m)
          {
            v356 = v345;
            v357 = (_BYTE *)*m;
            v358 = (char *)(*m + 4096);
            while (1)
            {
              if (v358 - v357 >= v313 - v343)
                v359 = v313 - v343;
              else
                v359 = v358 - v357;
              v358 -= v359;
              v313 -= v359;
              if (v359)
                memmove(v313, v358, v359);
              if (v358 == v357)
                break;
              v360 = (_BYTE *)*--v312;
              v343 = v360;
              v313 = v360 + 4096;
            }
            v343 = (_BYTE *)*v312;
            if ((char *)(*v312 + 4096) == v313)
            {
              v361 = (_BYTE *)v312[1];
              ++v312;
              v343 = v361;
              v313 = v361;
            }
            v345 = v356;
          }
          v362 = (char *)(**(_QWORD **)&v345 + 4096);
          v342 = v561;
          *(double *)&v289 = v562;
          if (v362 == v346)
            goto LABEL_357;
          v363 = *v312;
          while (1)
          {
            v364 = &v313[-v363];
            if (v362 - v346 >= (uint64_t)v364)
              v365 = (size_t)v364;
            else
              v365 = v362 - v346;
            v362 -= v365;
            v313 -= v365;
            if (v365)
              memmove(v313, v362, v365);
            if (v362 == v346)
              break;
            v366 = *--v312;
            v363 = v366;
            v313 = (char *)(v366 + 4096);
          }
        }
        if ((char *)(*v312 + 4096) == v313)
        {
          v369 = (char *)v312[1];
          ++v312;
          v313 = v369;
        }
        goto LABEL_357;
      }
      if (*(_QWORD *)&v314 >= *(_QWORD *)&v292 >> 1)
      {
        v322 = *(_QWORD *)&v565 + *(_QWORD *)&v314 - (*(_QWORD *)&v292 + **(_QWORD **)&v564);
        if (v322 < 1)
        {
          v327 = 4095 - v322;
          *(_QWORD *)&v564 -= 8 * (v327 >> 12);
          *(_QWORD *)&v317 = **(_QWORD **)&v564 + (~(_WORD)v327 & 0xFFF);
        }
        else
        {
          *(_QWORD *)&v564 += 8 * ((unint64_t)v322 >> 12);
          *(_QWORD *)&v317 = **(_QWORD **)&v564 + (v322 & 0xFFF);
        }
      }
      else
      {
        if (v314 != 0.0)
        {
          v315 = *(_QWORD *)&v290 - *(_QWORD *)v289 + *(_QWORD *)&v314;
          v316 = *(_QWORD *)&v565;
          if (v315 < 1)
          {
            v398 = 4095 - v315;
            *(_QWORD *)&v564 = v289 - 8 * (v398 >> 12);
            *(_QWORD *)&v317 = **(_QWORD **)&v564 + (~(_WORD)v398 & 0xFFF);
          }
          else
          {
            *(_QWORD *)&v564 = v289 + 8 * ((unint64_t)v315 >> 12);
            *(_QWORD *)&v317 = **(_QWORD **)&v564 + (v315 & 0xFFF);
          }
LABEL_287:
          if (*(_QWORD *)&v317 == v316)
          {
            v318 = v313;
            v319 = v312;
          }
          else
          {
            v328 = v564;
            v329 = v317;
            v319 = v312;
            v318 = v313;
            v330 = (uint64_t *)v543;
            do
            {
              *v318++ = **(_BYTE **)&v329;
              if (&v318[-*v319] == (char *)4096)
              {
                v331 = (char *)v319[1];
                ++v319;
                v318 = v331;
              }
              if (++*(_QWORD *)&v329 - **(_QWORD **)&v328 == 4096)
              {
                v332 = *(_BYTE **)(*(_QWORD *)&v328 + 8);
                *(_QWORD *)&v328 += 8;
                v329 = *(double *)&v332;
              }
              ++v330[5];
            }
            while (*(_QWORD *)&v329 != v316);
          }
          v292 = v314;
          v565 = v317;
          if (v314 == 0.0)
            goto LABEL_529;
          goto LABEL_297;
        }
        v564 = *(double *)&v289;
        v317 = v290;
      }
      v316 = *(_QWORD *)&v565;
      goto LABEL_287;
    }
    while (1)
    {
      v248 = *(_OWORD *)v218;
      v249 = *(_OWORD *)(v218 + 16);
      v250 = *(_OWORD *)(v218 + 48);
      *(_OWORD *)(v221 + 32) = *(_OWORD *)(v218 + 32);
      *(_OWORD *)(v221 + 48) = v250;
      *(_OWORD *)v221 = v248;
      *(_OWORD *)(v221 + 16) = v249;
      if (v221 != v218)
        break;
LABEL_212:
      v218 += 168;
      v221 += 168;
      if (v218 == *(_QWORD *)&v247)
        goto LABEL_222;
    }
    std::vector<_NSRange>::__assign_with_size[abi:ne180100]<_NSRange*,_NSRange*>((char *)(v221 + 64), *(char **)(v218 + 64), *(_QWORD *)(v218 + 72), (uint64_t)(*(_QWORD *)(v218 + 72) - *(_QWORD *)(v218 + 64)) >> 4);
    v251 = *(_OWORD *)(v218 + 88);
    v252 = *(_OWORD *)(v218 + 104);
    v253 = *(_OWORD *)(v218 + 120);
    v255 = (_QWORD *)(v221 + 144);
    v254 = *(_QWORD *)(v221 + 144);
    *(_QWORD *)(v221 + 136) = *(_QWORD *)(v218 + 136);
    *(_OWORD *)(v221 + 120) = v253;
    *(_OWORD *)(v221 + 104) = v252;
    *(_OWORD *)(v221 + 88) = v251;
    v257 = *(__int128 **)(v218 + 144);
    v256 = *(__int128 **)(v218 + 152);
    v258 = 0x8E38E38E38E38E39 * (v256 - v257);
    v259 = (_QWORD *)(v221 + 160);
    if (0x8E38E38E38E38E39 * ((*(_QWORD *)(v221 + 160) - v254) >> 4) >= v258)
    {
      if (0x8E38E38E38E38E39 * ((*(_QWORD *)(v221 + 152) - v254) >> 4) >= v258)
      {
        v264 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *>(*(_QWORD *)(v218 + 144), *(_QWORD *)(v218 + 152), v254);
        for (n = *(_QWORD *)(v221 + 152); n != v264; n -= 144)
        {
          v266 = *(void **)(n - 80);
          if (v266)
          {
            *(_QWORD *)(n - 72) = v266;
            operator delete(v266);
          }
        }
        *(_QWORD *)(v221 + 152) = v264;
        goto LABEL_211;
      }
      v263 = &v257[(*(_QWORD *)(v221 + 152) - v254) >> 4];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *>(*(_QWORD *)(v218 + 144), (uint64_t)v263, v254);
      v262 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CRDetectorUtils::CRTextDetectorQuad>,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*>(v221 + 160, v263, v256, *(_QWORD *)(v221 + 152));
    }
    else
    {
      std::vector<CRDetectorUtils::CRTextDetectorQuad>::__vdeallocate((uint64_t *)(v221 + 144));
      if (v258 > 0x1C71C71C71C71C7)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v260 = 0x1C71C71C71C71C72 * ((uint64_t)(*v259 - *v255) >> 4);
      if (v260 <= v258)
        v260 = 0x8E38E38E38E38E39 * (v256 - v257);
      if (0x8E38E38E38E38E39 * ((uint64_t)(*v259 - *v255) >> 4) >= 0xE38E38E38E38E3)
        v261 = 0x1C71C71C71C71C7;
      else
        v261 = v260;
      std::vector<CRDetectorUtils::CRTextDetectorQuad>::__vallocate[abi:ne180100]((_QWORD *)(v221 + 144), v261);
      v262 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CRDetectorUtils::CRTextDetectorQuad>,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*>(v221 + 160, v257, v256, *(_QWORD *)(v221 + 152));
    }
    *(_QWORD *)(v221 + 152) = v262;
LABEL_211:
    v247 = v564;
    goto LABEL_212;
  }
  v199 = v535;
LABEL_530:
  v572 = 0u;
  v573 = 0u;
  v570 = 0u;
  v571 = 0u;
  v557 = COERCE_DOUBLE(v199);
  v494 = COERCE_DOUBLE(objc_msgSend(*(id *)&v557, "countByEnumeratingWithState:objects:count:", &v570, v607, 16));
  if (v494 != 0.0)
  {
    v495 = 0;
    v558 = *(double *)v571;
    do
    {
      *(_QWORD *)&v560 = v495;
      v561 = 0.0;
      v559 = v494;
      *(_QWORD *)&v556 = *(_QWORD *)&v494 + v495;
      do
      {
        if (*(_QWORD *)v571 != *(_QWORD *)&v558)
          objc_enumerationMutation(*(id *)&v557);
        v496 = v543[2].u64[1];
        if (v496
          && (v496 <= *(_QWORD *)&v560
           || !*(_BYTE *)(*(_QWORD *)(v543->i64[1]
                                    + (((unint64_t)(v543[2].i64[0] + *(_QWORD *)&v560) >> 9) & 0x7FFFFFFFFFFFF8))
                        + ((v543[2].i64[0] + *(_QWORD *)&v560) & 0xFFF))))
        {
          v497 = 1;
        }
        else
        {
          v497 = 2;
        }
        v498 = *(void **)(*((_QWORD *)&v570 + 1) + 8 * *(_QWORD *)&v561);
        v564 = *(double *)&v497;
        objc_msgSend(v498, "setNmsOutputScale:");
        v499 = objc_msgSend(v498, "featureID");
        v500 = *(_QWORD *)&v583[21 * (int)v499 + 9] - *(_QWORD *)&v583[21 * (int)v499 + 8];
        if ((int)(v500 >> 4) < 1)
        {
          objc_msgSend(v498, "setPolygon:", 0);
        }
        else
        {
          v501 = (v500 >> 4);
          MEMORY[0x1E0C80A78](v499);
          v502 = 0;
          do
          {
            v503 = objc_msgSend(v498, "featureID");
            v504 = *(_QWORD *)(*(_QWORD *)&v583[21 * v503 + 8] + v502);
            v505 = objc_msgSend(v498, "featureID");
            v506 = *(_QWORD *)(*(_QWORD *)&v583[21 * v505 + 8] + v502 + 8);
            v507 = (uint64_t *)((char *)&v528 + v502 + -16 * v501);
            *v507 = v504;
            v507[1] = v506;
            v502 += 16;
          }
          while (16 * v501 != v502);
          v508 = [CRNormalizedPolyline alloc];
          v509 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v508, "initWithNormalizedPoints:count:size:", &v528 - 2 * v501, v501, v546, v547);
          objc_msgSend(v498, "setPolygon:", v509);

        }
        v568 = 0u;
        v569 = 0u;
        v566 = 0u;
        v567 = 0u;
        objc_msgSend(v498, "subFeatures");
        v562 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(double *)&v510 = COERCE_DOUBLE(objc_msgSend(*(id *)&v562, "countByEnumeratingWithState:objects:count:", &v566, v606, 16));
        if (*(double *)&v510 != 0.0)
        {
          v563 = *(uint64_t **)v567;
          do
          {
            v565 = *(double *)&v510;
            v511 = 0;
            do
            {
              if (*(uint64_t **)v567 != v563)
                objc_enumerationMutation(*(id *)&v562);
              v512 = *(void **)(*((_QWORD *)&v566 + 1) + 8 * v511);
              v513 = objc_msgSend(v498, "featureID");
              v514 = *(_QWORD *)&v583[21 * (int)v513 + 9] - *(_QWORD *)&v583[21 * (int)v513 + 8];
              if ((int)(v514 >> 4) < 1)
              {
                objc_msgSend(v512, "setPolygon:", 0);
              }
              else
              {
                v515 = (v514 >> 4);
                MEMORY[0x1E0C80A78](v513);
                v516 = 0;
                do
                {
                  v517 = objc_msgSend(v498, "featureID");
                  v518 = *(_QWORD *)(*(_QWORD *)&v583[21 * v517 + 8] + v516);
                  v519 = objc_msgSend(v498, "featureID");
                  v520 = *(_QWORD *)(*(_QWORD *)&v583[21 * v519 + 8] + v516 + 8);
                  v521 = (uint64_t *)((char *)&v528 + v516 + -16 * v515);
                  *v521 = v518;
                  v521[1] = v520;
                  v516 += 16;
                }
                while (16 * v515 != v516);
                v522 = [CRNormalizedPolyline alloc];
                v523 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v522, "initWithNormalizedPoints:count:size:", &v528 - 2 * v515, v515, v546, v547);
                objc_msgSend(v512, "setPolygon:", v523);

              }
              objc_msgSend(v512, "setNmsOutputScale:", *(_QWORD *)&v564);
              ++v511;
            }
            while (v511 != *(_QWORD *)&v565);
            *(double *)&v510 = COERCE_DOUBLE(objc_msgSend(*(id *)&v562, "countByEnumeratingWithState:objects:count:", &v566, v606, 16));
          }
          while (*(double *)&v510 != 0.0);
        }

        ++*(_QWORD *)&v560;
        ++*(_QWORD *)&v561;
      }
      while (*(_QWORD *)&v561 != *(_QWORD *)&v559);
      v494 = COERCE_DOUBLE(objc_msgSend(*(id *)&v557, "countByEnumeratingWithState:objects:count:", &v570, v607, 16));
      v495 = LODWORD(v556);
    }
    while (v494 != 0.0);
  }

  v524 = (uint64_t)v584;
  v525 = v583;
  while ((double *)v524 != v525)
  {
    v524 -= 168;
    std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::destroy[abi:ne180100]((uint64_t)&rowBytes, v524);
  }
  v584 = (void ***)v525;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::shrink_to_fit((void **)&v583);
  if (v531 && v537)
  {
    v526 = objc_retainAutorelease(v537);
    *v531 = v526;
  }
  v609.data = &v583;
  a1 = *(id *)&v557;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)&v609);
  std::deque<unsigned char>::~deque[abi:ne180100](&v586);

LABEL_565:
  return a1;
}

- (void)computeClassificationType:(void *)a3 fromTextFeatures:(uint64_t *)a4 fineScaleMap:(uint64_t *)a5 fullTileMap:(_QWORD *)a6 withScaleIds:
{
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  _BOOL4 v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t **v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v25 = a1;
  if (a1)
  {
    v26 = a6;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v11;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = 0;
      v29 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        v28 = v13;
        do
        {
          if (*(_QWORD *)v31 != v29)
            objc_enumerationMutation(obj);
          v15 = a5[1];
          v16 = v15 != *a5;
          v17 = a4[1];
          if (v17 != *a4)
            v16 = 0;
          if (v15 != *a5 && !v16 && v17 != *a4)
            v16 = v26[5] > (unint64_t)(v28 + v14)
               && *(unsigned __int8 *)(*(_QWORD *)(v26[1]
                                                 + (((unint64_t)(v28 + v14 + v26[4]) >> 9) & 0x7FFFFFFFFFFFF8))
                                     + ((v28 + v14 + v26[4]) & 0xFFF)) != 0;
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
          if (a2)
          {
            if (a2 == 1)
            {
              if (v16)
                v20 = (uint64_t)a5;
              else
                v20 = (uint64_t)a4;
              +[CRNeuralTextDetectorV3 computeOrientationFromSingleTextFeature:map:]((uint64_t)CRNeuralTextDetectorV3, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14), v20);
            }
            else if (a2 == 2)
            {
              if (v16)
                v19 = (uint64_t)a5;
              else
                v19 = (uint64_t)a4;
              +[CRNeuralTextDetectorV3 computeTextTypeFromSingleTextFeature:map:]((uint64_t)CRNeuralTextDetectorV3, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14), v19);
            }
          }
          else
          {
            if (v16)
              v21 = a5;
            else
              v21 = a4;
            objc_msgSend(v25, "configuration", v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "scriptRatioThresholds");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[CRNeuralTextDetectorV3 computeScriptCategoryFromSingleTextFeature:map:scriptRatioThresholds:]((uint64_t)CRNeuralTextDetectorV3, v18, v21, v23);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        v13 = v28 + v14;
      }
      while (v12);
    }

    v11 = v24;
  }

}

- (void)runFullTileInferenceOnImage:(id)a3 cachedSurface:(__IOSurface *)a4 outputMaps:(void *)a5 inputSize:(CGSize *)a6 outputSize:(CGSize *)a7 modelContext:(id)a8 error:(id *)a9
{
  id v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  __CVBuffer *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float64x2_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  void ***v45;
  float64x2_t v46;
  void *v47;
  BOOL v48;
  void *v49;
  int v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  CGSize v54;
  CGSize v55;
  char v56;
  CGSize v57;
  void *context;
  _QWORD v59[8];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  float64x2_t v66;
  double v67;
  uint8_t *v68;
  uint8_t buf[16];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  context = (void *)MEMORY[0x1D826E7B0]();
  -[CRNeuralTextDetector configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "disableScriptDetection");

  -[CRNeuralTextDetector configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v16, "disableTextTypeDetection");

  v67 = 0.0;
  objc_msgSend(v13, "size");
  v18 = v17;
  v20 = v19;
  -[CRNeuralTextDetector configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tileSize");
  +[CRNeuralTextDetectorV3 calculateTargetOutputSize:adjustedInputScale:paddedSize:imageSize:maximumSize:minimumSize:inputLengthLimit:](v18, v20, v22, v23, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0, (uint64_t)CRNeuralTextDetectorV3, (float64x2_t *)a7, &v67, &v66);

  v24 = (__CVBuffer *)objc_msgSend(v13, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", a6, 1, v67, v66.f64[0], v66.f64[1]);
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__8;
  v64 = __Block_byref_object_dispose__9;
  v65 = 0;
  -[CRNeuralTextDetector inferenceStats](self, "inferenceStats");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __119__CRNeuralTextDetectorV3_runFullTileInferenceOnImage_cachedSurface_outputMaps_inputSize_outputSize_modelContext_error___block_invoke;
  v59[3] = &unk_1E98DBB20;
  v59[4] = self;
  v59[5] = &v60;
  v59[6] = v24;
  v59[7] = a9;
  objc_msgSend(v25, "measureBlock:", v59);

  CVPixelBufferRelease(v24);
  if (a9)
  {
    if (*a9 || !v61[5])
    {
      CROSLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*a9, "localizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v27;
        _os_log_impl(&dword_1D4FB8000, v26, OS_LOG_TYPE_FAULT, "Model prediction error for full tile: %@", buf, 0xCu);

      }
      goto LABEL_12;
    }
  }
  else if (!v61[5])
  {
    CROSLogForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v26, OS_LOG_TYPE_FAULT, "Model prediction error for full tile with error == nullptr.", buf, 2u);
    }
    goto LABEL_12;
  }
  if (-[CRNeuralTextDetector shouldCancel](self, "shouldCancel"))
  {
    if (a9)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *a9;
      *a9 = v28;
LABEL_12:

    }
  }
  else
  {
    objc_msgSend((id)v61[5], "region_score");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRNeuralTextDetectorV3 createImageMap:targetSize:]((uint64_t **)buf, a7->width, a7->height, (uint64_t)CRNeuralTextDetectorV3, v29);
    std::unique_ptr<CRImageBuffer>::reset[abi:ne180100]((void ***)a5, *(void ***)buf);

    if (objc_msgSend((id)v61[5], "isLazy"))
      objc_msgSend((id)v61[5], "setRegion_score:", 0);
    objc_msgSend((id)v61[5], "link_score_horizontal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRNeuralTextDetectorV3 createImageMap:targetSize:]((uint64_t **)buf, a7->width, a7->height, (uint64_t)CRNeuralTextDetectorV3, v30);
    std::unique_ptr<CRImageBuffer>::reset[abi:ne180100]((void ***)a5 + 4, *(void ***)buf);

    if (objc_msgSend((id)v61[5], "isLazy"))
      objc_msgSend((id)v61[5], "setLink_score_horizontal:", 0);
    objc_msgSend((id)v61[5], "link_score_vertical");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRNeuralTextDetectorV3 createImageMap:targetSize:]((uint64_t **)buf, a7->width, a7->height, (uint64_t)CRNeuralTextDetectorV3, v31);
    std::unique_ptr<CRImageBuffer>::reset[abi:ne180100]((void ***)a5 + 5, *(void ***)buf);

    if (objc_msgSend((id)v61[5], "isLazy"))
      objc_msgSend((id)v61[5], "setLink_score_vertical:", 0);
    v54 = *a7;
    objc_msgSend((id)v61[5], "orientation_score");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_self();
    __asm { FMOV            V0.2D, #0.5 }
    v52 = _Q0;
    v38 = vcvtq_f64_u64(vcvtq_u64_f64(vmulq_f64((float64x2_t)v54, _Q0)));
    +[CRNeuralTextDetectorV3 createMultiChannelImageMaps:size:channels:](buf, v38.f64[0], v38.f64[1], (uint64_t)CRNeuralTextDetectorV3, v32, (void ***)9);
    std::vector<std::unique_ptr<CRImageBuffer>>::__vdeallocate((void ****)a5 + 7);
    *(_OWORD *)((char *)a5 + 56) = *(_OWORD *)buf;
    *((_QWORD *)a5 + 9) = v70;
    v70 = 0;
    v68 = buf;
    memset(buf, 0, sizeof(buf));
    std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v68);

    if (objc_msgSend((id)v61[5], "isLazy"))
      objc_msgSend((id)v61[5], "setOrientation_score:", 0, *(_OWORD *)&v52);
    -[CRNeuralTextDetector configuration](self, "configuration", *(_OWORD *)&v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v39, "detectTables") & 1) != 0)
    {
      objc_msgSend((id)v61[5], "table_score");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40 == 0;

      if (!v41)
      {
        objc_msgSend((id)v61[5], "table_score");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRNeuralTextDetectorV3 createImageMap:targetSize:]((uint64_t **)buf, a7->width, a7->height, (uint64_t)CRNeuralTextDetectorV3, v42);
        std::unique_ptr<CRImageBuffer>::reset[abi:ne180100]((void ***)a5 + 6, *(void ***)buf);

        if (objc_msgSend((id)v61[5], "isLazy"))
          objc_msgSend((id)v61[5], "setTable_score:", 0);
      }
    }
    else
    {

    }
    if ((v15 & 1) == 0)
    {
      v55 = *a7;
      objc_msgSend((id)v61[5], "script_feature");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void ***)objc_msgSend(v44, "count");
      v46 = vcvtq_f64_u64(vcvtq_u64_f64(vmulq_f64((float64x2_t)v55, v53)));
      +[CRNeuralTextDetectorV3 createMultiChannelImageMaps:size:channels:](buf, v46.f64[0], v46.f64[1], (uint64_t)CRNeuralTextDetectorV3, v43, v45);
      std::vector<std::unique_ptr<CRImageBuffer>>::__vdeallocate((void ****)a5 + 1);
      *(_OWORD *)((char *)a5 + 8) = *(_OWORD *)buf;
      *((_QWORD *)a5 + 3) = v70;
      v70 = 0;
      v68 = buf;
      memset(buf, 0, sizeof(buf));
      std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v68);

      if (objc_msgSend((id)v61[5], "isLazy"))
        objc_msgSend((id)v61[5], "setScript_feature:", 0);

    }
    if ((v56 & 1) == 0)
    {
      objc_msgSend((id)v61[5], "text_type_score");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47 == 0;

      if (!v48)
      {
        v57 = *a7;
        objc_msgSend((id)v61[5], "text_type_score");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v50 = +[CRNeuralTextDetectorV3 numSupportedTextType]();
        v51 = vcvtq_f64_u64(vcvtq_u64_f64(vmulq_f64((float64x2_t)v57, v53)));
        +[CRNeuralTextDetectorV3 createMultiChannelImageMaps:size:channels:](buf, v51.f64[0], v51.f64[1], (uint64_t)CRNeuralTextDetectorV3, v49, (void ***)v50);
        std::vector<std::unique_ptr<CRImageBuffer>>::__vdeallocate((void ****)a5 + 10);
        *((_OWORD *)a5 + 5) = *(_OWORD *)buf;
        *((_QWORD *)a5 + 12) = v70;
        v70 = 0;
        v68 = buf;
        memset(buf, 0, sizeof(buf));
        std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v68);

        if (objc_msgSend((id)v61[5], "isLazy"))
          objc_msgSend((id)v61[5], "setText_type_score:", 0);
      }
    }
    CRDetectorOutputMaps::scaleMaps((CRDetectorOutputMaps *)a5, 1);
  }
  _Block_object_dispose(&v60, 8);

  objc_autoreleasePoolPop(context);
}

void __119__CRNeuralTextDetectorV3_runFullTileInferenceOnImage_cachedSurface_outputMaps_inputSize_outputSize_modelContext_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[8];
  id v17;
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRDetectorInferenceTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v17 = 0;
  objc_msgSend(v6, "predictionFromImage:error:", v7, &v17);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v17;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

  if (v10)
  {
    v13 = *(id **)(a1 + 56);
    if (v13)
      objc_storeStrong(v13, v9);
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v14 = (id)CRSignpostLog_signPostOSLog;
  v15 = v14;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v15, OS_SIGNPOST_INTERVAL_END, v3, "OCRDetectorInferenceTime", ", v16, 2u);
  }

}

- (void)addIntermediateResults:(uint64_t)a3 idxLog:(void *)a4 adjustedSize:(uint64_t)a5 quadFeatures:(uint64_t)a6 nmsOutputScale:(uint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  objc_msgSend(v12, "pyramidScaleSize", 0x3F8000003F800000, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", a1, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertObject:atIndex:", v14, a5);

  objc_msgSend(v12, "pyramidScaleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertObject:atIndex:", v16, a5);

  objc_msgSend(v12, "pyramidPreIntraScaleNMSTextFeatures");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "textFeaturesFromPolygons:withScale:withNMSOutputScale:", a6, &v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

}

- (void)updateNMS:(uint64_t *)a3 andQuadFeatures:(uint64_t *)a4 inMaps:(void *)a5 tileRects:(int)a6 intermediateResult:(int)a7 isFullTile:(float)a8 isHorizontal:adjustedSize:randomPrefix:
{
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v33;
  id v34;
  uint8_t buf[16];
  void *v36[4];

  v34 = a2;
  v31 = a5;
  v14 = *a4;
  if (a7)
    v15 = (uint64_t *)a4[4];
  else
    v15 = (uint64_t *)a4[5];
  if (a7)
    v16 = (uint64_t *)a4[5];
  else
    v16 = (uint64_t *)a4[4];
  objc_msgSend(a1, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scoreMapScaleFactor");
  v19 = v18;

  v20 = malloc_type_calloc(*(_QWORD *)(v14 + 8) * *(_QWORD *)(v14 + 16), 4uLL, 0x100004052888210uLL);
  v21 = *(void **)(v14 + 8);
  v22 = *(void **)(v14 + 16);
  v36[0] = v20;
  v36[1] = v21;
  v36[2] = v22;
  v36[3] = (void *)(4 * (_QWORD)v22);
  if (a7)
    v23 = CFSTR("hor");
  else
    v23 = CFSTR("ver");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f_%@"), a8, v23);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v24 = (id)CRSignpostLog_signPostOSLog;
  v25 = os_signpost_id_generate(v24);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v26 = (id)CRSignpostLog_signPostOSLog;
  v27 = v26;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "OCRDetectorPostprocessingExtractTextBoxes", ", buf, 2u);
  }

  objc_msgSend(a1, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CRDetectorPostProcessV3::extractTextBoxes(v14, v15, v16, a3, (CRDetectorUtils **)v36, a6, objc_msgSend(v28, "extractPolygons"), v33, a7);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v29 = (id)CRSignpostLog_signPostOSLog;
  v30 = v29;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v30, OS_SIGNPOST_INTERVAL_END, v25, "OCRDetectorPostprocessingExtractTextBoxes", ", buf, 2u);
  }

  if (v34)
  {
    if (v31)
      objc_msgSend(v34, "addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, v36, v31, MEMORY[0x1E0C9AA70], 1.0, 1.0, v19);
    else
      objc_msgSend(v34, "addTextDetectorQuadFeatures:withInputSize:scoreMap:andScoreMapScaleFactor:options:", a3, v36, MEMORY[0x1E0C9AA70], 1.0, 1.0, v19);
  }
  free(v36[0]);

}

- (void)runNMSForDirection:(void *)a1 adjustedSize:(uint64_t *)a2 fullTileMaps:(uint64_t *)a3 adjustedFullTileSize:(void *)a4 targetSize:(_QWORD *)a5 targetSizeFullTile:(void *)a6 intermediateResults:(int)a7 withScaleIds:(id *)a8 sourceImageSize:(double)a9 tileRects:(double)a10 isHorizontal:(double)a11 resultTextFeatures:(double)a12 quadFeatures:(uint64_t *)a13 isFineScaleVerticalLinkActive:(unsigned __int8)a14 isFullTileVerticalLinkActive:(unsigned __int8)a15 idxLog:(uint64_t *)a16
{
  id v26;
  _BOOL4 v27;
  int v28;
  int v29;
  _BOOL4 v30;
  _BYTE *CRLogger;
  int v32;
  float v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  void *v43;
  int v44;
  char *v45;
  char *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t i;
  char *v57;
  uint64_t j;
  void *v59;
  id v60;
  void *v61;
  int v62;
  int v63;
  id obj;
  uint64_t v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  void **v78;
  __int128 v79[4];
  void *__p;
  void *v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  _QWORD v87[4];
  _BYTE v88[128];
  const __CFString *v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v60 = a4;
  v26 = a6;
  v59 = v26;
  v61 = 0;
  v27 = *a3 != 0;
  if (*a2)
    v28 = a14;
  else
    v28 = 0;
  if (*a3)
    v29 = a15;
  else
    v29 = 0;
  if ((a7 & 1) != 0)
    v30 = *a2 != 0;
  else
    v30 = v28;
  v75 = 0;
  v76 = 0;
  if ((a7 & 1) != 0)
    v29 = v27;
  v77 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v63 = v29;
  v67 = v29 & v30;
  if ((v29 & v30) == 1)
  {
    v26 = -[CRNMS initForRevision:]([CRNMS alloc], "initForRevision:", 3, v26);
    v61 = v26;
  }
  CRLogger = CRLogger::getCRLogger((CRLogger *)v26);
  if (*CRLogger && (CRLogger[8] & 1) != 0)
    v32 = rand();
  else
    v32 = 0;
  v33 = (float)v32;
  if (v30)
  {
    -[CRNeuralTextDetectorV3 updateNMS:andQuadFeatures:inMaps:tileRects:intermediateResult:isFullTile:isHorizontal:adjustedSize:randomPrefix:](a1, v61, (uint64_t *)&v72, a2, 0, 0, a7, v33);
    if ((v63 & 1) == 0)
    {
      *(_QWORD *)&v79[0] = 0x3F8000003F800000;
      +[CRNeuralTextDetector textFeaturesFromPolygons:withScale:withNMSOutputScale:](CRNeuralTextDetector, "textFeaturesFromPolygons:withScale:withNMSOutputScale:", &v72, v79, 1);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v60)
    {
      -[CRNeuralTextDetectorV3 addIntermediateResults:idxLog:adjustedSize:quadFeatures:nmsOutputScale:](a9, a10, (uint64_t)a1, v60, *a16, (uint64_t)&v72, 1);
      ++*a16;
    }
  }
  if (v63)
  {
    -[CRNeuralTextDetectorV3 updateNMS:andQuadFeatures:inMaps:tileRects:intermediateResult:isFullTile:isHorizontal:adjustedSize:randomPrefix:](a1, v61, (uint64_t *)&v75, a3, v59, 1, a7, v33);
    if (!v30)
    {
      *(_QWORD *)&v79[0] = 0x3F8000003F800000;
      +[CRNeuralTextDetector textFeaturesFromPolygons:withScale:withNMSOutputScale:](CRNeuralTextDetector, "textFeaturesFromPolygons:withScale:withNMSOutputScale:", &v75, v79, 2);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v60)
    {
      -[CRNeuralTextDetectorV3 addIntermediateResults:idxLog:adjustedSize:quadFeatures:nmsOutputScale:](a11, a12, (uint64_t)a1, v60, *a16, (uint64_t)&v75, 2);
      ++*a16;
    }
    if (v30)
    {
      v89 = CFSTR("CRImageReaderTextDetector");
      v90[0] = CFSTR("CRImageReaderTextDetectorCR");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "generateConsolidatedTextFeatures:withScaleIds:", v34, a5);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = *a8;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
  if (v35)
  {
    v36 = 0;
    v62 = 0;
    v66 = *(_QWORD *)v69;
    do
    {
      v37 = 0;
      v38 = v62;
      v62 += v35;
      v39 = v38;
      do
      {
        if (*(_QWORD *)v69 != v66)
          objc_enumerationMutation(obj);
        if (v67)
        {
          v40 = a5[5];
          if (!v40
            || v40 > v38 + v37
            && *(_BYTE *)(*(_QWORD *)(a5[1] + (((unint64_t)(v38 + v37 + a5[4]) >> 9) & 0x7FFFFFFFFFFFF8))
                        + ((v38 + v37 + a5[4]) & 0xFFF)))
          {
LABEL_39:
            v41 = 1;
            v42 = 2;
            goto LABEL_42;
          }
        }
        else if (v63)
        {
          goto LABEL_39;
        }
        v41 = 0;
        v42 = 1;
LABEL_42:
        v43 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v37);
        objc_msgSend(v43, "setNmsOutputScale:", v42, v59);
        v44 = objc_msgSend(v43, "featureID");
        if (v41)
          v45 = v75;
        else
          v45 = v72;
        v46 = &v45[168 * v44];
        v47 = *(_OWORD *)v46;
        v48 = *((_OWORD *)v46 + 1);
        v49 = *((_OWORD *)v46 + 3);
        v79[2] = *((_OWORD *)v46 + 2);
        v79[3] = v49;
        v79[0] = v47;
        v79[1] = v48;
        v81 = 0;
        v82 = 0;
        __p = 0;
        std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&__p, *((const void **)v46 + 8), *((_QWORD *)v46 + 9), (uint64_t)(*((_QWORD *)v46 + 9) - *((_QWORD *)v46 + 8)) >> 4);
        v50 = *(_OWORD *)(v46 + 88);
        v51 = *(_OWORD *)(v46 + 104);
        v52 = *(_OWORD *)(v46 + 120);
        v86 = *((_QWORD *)v46 + 17);
        v84 = v51;
        v85 = v52;
        v83 = v50;
        memset(v87, 0, 24);
        std::vector<CRDetectorUtils::CRTextDetectorQuad>::__init_with_size[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*>(v87, *((__int128 **)v46 + 18), *((__int128 **)v46 + 19), 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)v46 + 19) - *((_QWORD *)v46 + 18)) >> 4));
        objc_msgSend(v43, "setFeatureID:", v36 + v37);
        HIDWORD(v86) = v36 + v37;
        v53 = a13[1];
        if (v53 >= a13[2])
        {
          v54 = std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__push_back_slow_path<CRDetectorUtils::CRTextDetectorQuadFeature const&>(a13, v79);
          v38 = v39;
        }
        else
        {
          std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::construct[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuadFeature,CRDetectorUtils::CRTextDetectorQuadFeature const&>((uint64_t)(a13 + 2), a13[1], v79);
          v38 = v39;
          v54 = v53 + 168;
          a13[1] = v53 + 168;
        }
        a13[1] = v54;
        v78 = (void **)v87;
        std::vector<CRDetectorUtils::CRTextDetectorQuad>::__destroy_vector::operator()[abi:ne180100](&v78);
        if (__p)
        {
          v81 = __p;
          operator delete(__p);
        }
        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
      v36 = (v36 + v37);
    }
    while (v35);
  }

  v55 = v75;
  for (i = v76;
        (char *)i != v55;
        std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::destroy[abi:ne180100]((uint64_t)&v77, i))
  {
    i -= 168;
  }
  v76 = (uint64_t)v55;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::shrink_to_fit((void **)&v75);
  v57 = v72;
  for (j = v73;
        (char *)j != v57;
        std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::destroy[abi:ne180100]((uint64_t)&v74, j))
  {
    j -= 168;
  }
  v73 = (uint64_t)v57;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::shrink_to_fit((void **)&v72);

  *(_QWORD *)&v79[0] = &v72;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)v79);
  *(_QWORD *)&v79[0] = &v75;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)v79);

}

- (void)getBorderPoints:(float64x2_t *)a3 sourceImageSize:(unsigned __int8)a4 outP1:(float64_t)a5 outP2:(float64_t)a6 isHorizontal:
{
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  float64x2_t v26;
  id v34;
  unsigned __int8 v35;

  v34 = a1;
  objc_msgSend(v34, "topLeft");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v34, "topRight");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v34, "bottomRight");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v34, "bottomLeft");
  v22 = v21;
  v24 = v23;
  v25 = operator new(0x40uLL);
  *(_QWORD *)v25 = v10;
  *((_QWORD *)v25 + 1) = v12;
  *((_QWORD *)v25 + 2) = v14;
  *((_QWORD *)v25 + 3) = v16;
  *((_QWORD *)v25 + 4) = v18;
  *((_QWORD *)v25 + 5) = v20;
  *((_QWORD *)v25 + 6) = v22;
  *((_QWORD *)v25 + 7) = v24;
  v35 = a4;
  std::__introsort<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *,false>((double *)v25, (double *)v25 + 8, &v35, 4, 1);
  v26.f64[0] = a5;
  v26.f64[1] = a6;
  __asm { FMOV            V1.2D, #0.5 }
  *a2 = vmulq_f64(vmulq_f64(v26, vaddq_f64(*(float64x2_t *)v25, *((float64x2_t *)v25 + 1))), _Q1);
  *a3 = vmulq_f64(vmulq_f64(v26, vaddq_f64(*((float64x2_t *)v25 + 2), *((float64x2_t *)v25 + 3))), _Q1);
  operator delete(v25);

}

+ (CGSize)scaledImageSizeForConfiguration:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
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
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "maximumInputSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "tileSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "inputLengthLimit");
  v17 = +[CRNeuralTextDetectorV3 scaledImageSizeForMaxSize:minSize:inputLengthLimit:imageSize:scale:](v9, v11, v13, v15, v16, width, height, (uint64_t)a1, &v22);
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (BOOL)computeClassCount:(void *)a3 classProbabiity:(void *)a4 fromSingleTextFeature:(id)a5 map:(const void *)a6 backgroundClass:(int)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
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
  CGPoint *v29;
  double CenterPoint;
  double v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  CGPoint *v35;
  const CGPoint *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  size_t v49;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  int v54;
  double v55;
  int v56;
  double v57;
  double v58;
  double v59;
  unint64_t v60;
  double v61;
  double v62;
  int v63;
  float v64;
  __float2 v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  unint64_t v73;
  double *v74;
  double *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t *v78;
  double *v79;
  uint64_t v80;
  double *v81;
  BOOL v82;
  double *v83;
  double v84;
  double *v85;
  double v86;
  double v87;
  int64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  double *v92;
  double *v93;
  BOOL v94;
  _QWORD v96[2];
  int v97;
  double v98;
  double v99;
  _QWORD *v100;
  double v101;
  double *v102;
  double *v103;
  CGPoint v104;
  CGPoint v105;
  double v106[10];

  v106[8] = *(double *)MEMORY[0x1E0C80C00];
  v10 = a5;
  v100 = a3;
  v13 = a3;
  v12 = *(_QWORD *)a3;
  v11 = v13[1];
  v14 = **(_QWORD **)a6;
  v16 = *(_QWORD *)(v14 + 8);
  v15 = *(_QWORD *)(v14 + 16);
  objc_msgSend(v10, "topLeft");
  v18 = v17;
  objc_msgSend(v10, "topLeft");
  v106[0] = v18 * (double)v15;
  v106[1] = v19 * (double)v16;
  objc_msgSend(v10, "topRight");
  v21 = v20;
  objc_msgSend(v10, "topRight");
  v106[2] = v21 * (double)v15;
  v106[3] = v22 * (double)v16;
  objc_msgSend(v10, "bottomRight");
  v24 = v23;
  objc_msgSend(v10, "bottomRight");
  v106[4] = v24 * (double)v15;
  v106[5] = v25 * (double)v16;
  objc_msgSend(v10, "bottomLeft");
  v27 = v26;
  objc_msgSend(v10, "bottomLeft");
  v106[6] = v27 * (double)v15;
  v106[7] = v28 * (double)v16;
  CenterPoint = CRDetectorUtils::makeCenterPoint((CRDetectorUtils *)v106, v29);
  v104.x = CenterPoint;
  v101 = v31;
  v104.y = v31;
  objc_msgSend(v10, "baselineAngle");
  v98 = *(double *)&v16;
  v32 = v11 - v12;
  v33 = v32 >> 3;
  CRDetectorUtils::rotatePolygon((CRDetectorUtils *)v106, &v104, &v105, v34, v35);
  v37 = CRDetectorUtils::convertPointToRect((uint64_t)&v105, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = (v32 >> 3);
  MEMORY[0x1E0C80A78](v37);
  v48 = (char *)v96 - ((v47 + 15) & 0xFFFFFFFF0);
  if (v47 >= 0x200)
    v49 = 512;
  else
    v49 = v47;
  bzero((char *)v96 - ((v47 + 15) & 0xFFFFFFFF0), v49);
  if ((int)v33 >= 1)
  {
    v50 = *(uint64_t **)a6;
    v51 = v48;
    v52 = (v32 >> 3);
    do
    {
      v53 = (_QWORD *)*v50++;
      *v51++ = *v53;
      --v52;
    }
    while (v52);
  }
  v54 = (int)v41;
  v55 = (double)(int)v41;
  v99 = v41 + v45;
  if (v41 + v45 <= v55)
  {
    v94 = 0;
  }
  else
  {
    v96[1] = v96;
    v56 = 0;
    v97 = (int)v39;
    v57 = (double)(int)v39;
    v58 = v39 + v43;
    v59 = (double)(unint64_t)(*(_QWORD *)&v98 - 1);
    v60 = (int)((uint64_t)v32 >> 3);
    v98 = v57;
    do
    {
      if (v58 > v57)
      {
        v61 = v55 - v101;
        v62 = -(v55 - v101);
        v63 = v97;
        do
        {
          objc_msgSend(v10, "baselineAngle");
          v65 = __sincosf_stret(v64);
          v66 = (float)-v65.__sinval;
          v67 = CenterPoint + v62 * v66 + (v57 - CenterPoint) * v65.__cosval;
          v68 = v101 + v61 * v65.__cosval + (v57 - CenterPoint) * v66;
          v69 = fmax(v67, 0.0);
          if (v69 >= (double)(v15 - 1))
            v70 = (double)(v15 - 1);
          else
            v70 = v69;
          v71 = fmax(v68, 0.0);
          if (v71 >= v59)
            v72 = v59;
          else
            v72 = v71;
          std::vector<double>::vector(&v102, v60);
          v73 = v15 * (int)v72 + (int)v70;
          v74 = *(double **)a4;
          v75 = v102;
          v76 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
          if (v76)
          {
            v77 = v76 >> 3;
            if (v77 <= 1)
              v77 = 1;
            v78 = (uint64_t *)v48;
            v79 = v102;
            do
            {
              v80 = *v78++;
              *v79++ = *(float *)(v80 + 4 * v73);
              --v77;
            }
            while (v77);
          }
          v81 = v75 + 1;
          v82 = v75 == v103 || v81 == v103;
          v83 = v75;
          if (!v82)
          {
            v84 = *v75;
            v83 = v75;
            v85 = v75 + 1;
            do
            {
              v86 = *v85++;
              v87 = v86;
              if (v84 < v86)
              {
                v84 = v87;
                v83 = v81;
              }
              v81 = v85;
            }
            while (v85 != v103);
          }
          v88 = (char *)v83 - (char *)v75;
          if ((((char *)v83 - (char *)v75) & 0x7FFFFFFF8) != 0)
          {
            v89 = (uint64_t *)v48;
            v90 = v46;
            if ((int)v33 >= 1)
            {
              do
              {
                v91 = *v89++;
                *v74 = *v74 + *(float *)(v91 + 4 * v73);
                ++v74;
                --v90;
              }
              while (v90);
            }
            ++*(_QWORD *)(*v100 + (v88 << 29 >> 29));
            ++v56;
          }
          if (v75)
          {
            v103 = v75;
            operator delete(v75);
          }
          v57 = (double)++v63;
        }
        while (v58 > (double)v63);
      }
      v55 = (double)++v54;
      v57 = v98;
    }
    while (v99 > (double)v54);
    if (v56 <= 0)
    {
      v94 = 0;
    }
    else
    {
      v92 = *(double **)a4;
      v93 = (double *)*((_QWORD *)a4 + 1);
      if (*(double **)a4 != v93)
      {
        do
        {
          *v92 = *v92 / (double)v56;
          ++v92;
        }
        while (v92 != v93);
      }
      v94 = 1;
    }
  }

  return v94;
}

- (CRTextDetectorModelV3CoreML)model
{
  return (CRTextDetectorModelV3CoreML *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)getBorderPoints:(double *)a1 sourceImageSize:(double *)a2 outP1:(unsigned __int8 *)a3 outP2:(uint64_t)a4 isHorizontal:(char)a5
{
  double *v10;
  double *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double *v15;
  double v16;
  double v17;
  int v18;
  double *v19;
  double v20;
  uint64_t v21;
  double v22;
  double *v23;
  double *v24;
  double *v25;
  double *v26;
  double *v27;
  BOOL v28;
  double *v29;
  double *v30;
  double *v31;
  double v32;
  double *v33;
  double *v34;
  BOOL v35;
  double *v36;
  double *v37;
  double *v38;
  double *v39;
  double *v40;
  double v41;
  double *v42;
  double *v43;
  double *v44;
  double v45;
  double *v46;
  double *v47;
  double *v48;
  double v49;
  double *v50;
  __int128 *v51;
  __int128 *v52;
  __int128 *v53;
  double *v54;
  double *v55;
  double v56;
  double *v57;
  __int128 v58;
  double *v59;
  double v60;
  double *v61;
  __int128 v62;
  double *v63;
  double v64;
  double *v65;
  __int128 v66;
  double v67;
  double *v68;
  double *v69;
  BOOL v71;
  uint64_t v72;
  double *v73;
  double v74;
  double v75;
  double *v76;
  double v77;
  uint64_t v78;
  char *v79;
  double *v80;
  double *v81;
  double v82;
  double *v83;
  int64_t v84;
  int64_t v85;
  int64_t v86;
  uint64_t v87;
  double *v88;
  double *v89;
  double v90;
  double *v91;
  double *v92;
  double *v93;
  __int128 v94;
  double v95;
  double v96;
  double *v97;
  uint64_t v98;
  double *v99;
  double v100;
  double *v101;
  double *v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  double *v106;
  double *v107;
  uint64_t v108;
  uint64_t v109;
  double *v110;
  double v111;
  double *v112;
  uint64_t v113;
  unint64_t v114;
  double *v115;
  double *v116;
  double v117;
  double v118;
  double v119;
  double *v120;
  double *v121;
  double v122;
  int v124;
  double *v125;
  double v126;
  double v127;
  double v128;
  double *v129;
  double *v130;
  double v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;

+ (void)computeOrientationFromSingleTextFeature:(uint64_t)a3 map:
{
  id v4;
  id v5;
  _BYTE *v6;
  char *v7;
  _BYTE *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  double *v18;
  double *v19;
  double v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  float v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  _BOOL4 v44;
  _BOOL4 v45;
  double v46;
  BOOL v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *__p;
  char *v59;
  void *v60;
  char *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[17];

  v67[16] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  objc_opt_class();
  objc_opt_self();
  v67[0] = 0;
  std::vector<double>::vector(&v60, 9uLL, v67);
  v67[0] = 0;
  std::vector<long>::vector(&__p, 9uLL, v67);
  if ((objc_msgSend((id)objc_opt_class(), "computeClassCount:classProbabiity:fromSingleTextFeature:map:backgroundClass:", &__p, &v60, v4, a3, 0) & 1) != 0)
  {
    v5 = v4;
    objc_opt_self();
    v6 = __p;
    if (__p == v59)
    {
      v8 = __p;
    }
    else
    {
      v7 = (char *)__p + 8;
      v8 = __p;
      if ((char *)__p + 8 != v59)
      {
        v9 = *(_QWORD *)__p;
        v8 = __p;
        v10 = (char *)__p + 8;
        do
        {
          v12 = *(_QWORD *)v10;
          v10 += 8;
          v11 = v12;
          v13 = v9 < v12;
          if (v9 <= v12)
            v9 = v11;
          if (v13)
            v8 = v7;
          v7 = v10;
        }
        while (v10 != v59);
      }
    }
    v18 = (double *)v60;
    v19 = (double *)((char *)v60 + 8);
    if (v60 != v61 && v19 != (double *)v61)
    {
      v21 = *(double *)v60;
      v22 = (double *)((char *)v60 + 8);
      do
      {
        v23 = *v22++;
        v24 = v23;
        if (v21 < v23)
        {
          v21 = v24;
          v18 = v19;
        }
        v19 = v22;
      }
      while (v22 != (double *)v61);
    }
    v25 = *v18;
    objc_msgSend(v5, "baselineAngle");
    v27 = v26;
    objc_opt_self();
    objc_opt_class();
    objc_opt_self();
    objc_opt_class();
    objc_opt_self();
    v28 = (float)((float)(int)(((unint64_t)(v8 - v6) >> 3) - 1) * 0.7854) + -0.3926991;
    if (v28 <= 3.14159265)
    {
      if (v28 > -3.14159265)
        goto LABEL_33;
      v29 = 6.28318531;
    }
    else
    {
      v29 = -6.28318531;
    }
    v28 = v28 + v29;
LABEL_33:
    v30 = v28;
    v31 = (float)(v30 + 0.7854);
    if (v31 <= 3.14159265)
    {
      if (v31 > -3.14159265)
        goto LABEL_38;
      v32 = 6.28318531;
    }
    else
    {
      v32 = -6.28318531;
    }
    v31 = v31 + v32;
LABEL_38:
    v33 = v31;
    v34 = (float)(v27 - v30);
    if (v34 <= 3.14159265)
    {
      if (v34 > -3.14159265)
        goto LABEL_43;
      v35 = 6.28318531;
    }
    else
    {
      v35 = -6.28318531;
    }
    v34 = v34 + v35;
LABEL_43:
    v36 = (float)(v27 - v33);
    if (v36 <= 3.14159265)
    {
      if (v36 > -3.14159265)
      {
LABEL_48:
        v38 = v34;
        v39 = v36;
        v40 = fabsf(v38);
        v41 = fabsf(v39);
        v42 = fminf(v40, v41);
        v43 = fmaxf(v40, v41);
        v44 = v43 > 1.5708 && v42 < 1.5708;
        if (v44 && v27 < 0.0)
          v45 = 1;
        else
          v45 = (v43 <= 0.7854 || v42 >= 2.3562) && v27 < 1.57079633 && v27 > -1.57079633;
        objc_msgSend(v5, "setUseSequenceOrientation:", 1);
        if (v44)
        {
          objc_msgSend(v5, "setIsVerticalLayout:", 1);
          if (v45)
            v46 = 0.75;
          else
            v46 = 0.55;
          v44 = v41 < v40;
        }
        else if (v45)
        {
          v46 = 0.75;
        }
        else
        {
          v46 = 0.55;
        }
        if (v42 >= 2.3562 && v25 > v46)
        {
          objc_msgSend(v5, "setShouldRotate180:", 1);
          if (v25 > 0.9)
            objc_msgSend(v5, "setUseSequenceOrientation:", 0);
        }
        if (v44 && v25 > v46)
        {
          objc_msgSend(v5, "setShouldRotate180:", 1);
          if (v25 > 0.9)
            objc_msgSend(v5, "setUseSequenceOrientation:", 0);
        }
        objc_msgSend(v5, "setShouldRotate180DetectorOrientationFallBack:", 0);
        v48 = !v44;
        if (v42 >= 2.3562)
          v48 = 0;
        if (!v48)
          objc_msgSend(v5, "setShouldRotate180DetectorOrientationFallBack:", objc_msgSend(v5, "shouldRotate180") ^ 1);
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        objc_msgSend(v5, "subFeatures");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        if (v50)
        {
          v51 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v63 != v51)
                objc_enumerationMutation(v49);
              v53 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_msgSend(v53, "setShouldRotate180:", objc_msgSend(v5, "shouldRotate180"));
              objc_msgSend(v53, "setShouldRotate180DetectorOrientationFallBack:", objc_msgSend(v5, "shouldRotate180DetectorOrientationFallBack"));
              objc_msgSend(v53, "setIsVerticalLayout:", objc_msgSend(v5, "isVerticalLayout"));
              objc_msgSend(v53, "setUseSequenceOrientation:", objc_msgSend(v5, "useSequenceOrientation"));
            }
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
          }
          while (v50);
        }

        goto LABEL_89;
      }
      v37 = 6.28318531;
    }
    else
    {
      v37 = -6.28318531;
    }
    v36 = v36 + v37;
    goto LABEL_48;
  }
  objc_msgSend(v4, "setUseSequenceOrientation:", 1);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v4, "subFeatures", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "setUseSequenceOrientation:", objc_msgSend(v4, "useSequenceOrientation"));
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v15);
  }

LABEL_89:
  if (__p)
  {
    v59 = (char *)__p;
    operator delete(__p);
  }
  if (v60)
  {
    v61 = (char *)v60;
    operator delete(v60);
  }

}

@end
