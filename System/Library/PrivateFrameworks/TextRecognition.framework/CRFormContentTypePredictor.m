@implementation CRFormContentTypePredictor

- (CRFormContentTypePredictor)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int *v9;
  size_t v10;
  void **v11;
  void **v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void **v17;
  uint64_t **v18;
  uint64_t **v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  void **v23;
  uint64_t **v24;
  uint64_t **v25;
  char *v26;
  std::string *v27;
  uint64_t i;
  void *v30[2];
  unsigned __int8 v31;
  objc_super v32;
  char *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  void *__p[2];
  char v38;
  _DWORD v39[2];
  uint64_t v40[3];
  int v41;
  uint64_t v42[3];
  int v43;
  uint64_t v44[3];
  int v45;
  _QWORD v46[3];
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)CRFormContentTypePredictor;
  v2 = -[CRFormContentTypePredictor init](&v32, sel_init);
  if (!v2)
    return (CRFormContentTypePredictor *)v2;
  v3 = operator new();
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)v2 + 1, (void **)v3);
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("cr_form_ct_v2.mlmodelc"), CFSTR("bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v30, (char *)objc_msgSend(v8, "UTF8String"));

  v9 = (int *)*((_QWORD *)v2 + 1);
  if ((v31 & 0x80u) == 0)
    v10 = v31;
  else
    v10 = (size_t)v30[1];
  v11 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v10 + 19);
  if (v38 < 0)
    v11 = (void **)__p[0];
  if (v10)
  {
    if ((v31 & 0x80u) == 0)
      v12 = v30;
    else
      v12 = (void **)v30[0];
    memmove(v11, v12, v10);
  }
  strcpy((char *)v11 + v10, "/model.espresso.net");
  CoreRecognition::EspressoModelWrapper::initialize(v9, (uint64_t)__p, 0, 0);
  if (v38 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "en");
  v39[0] = 1071225242;
  std::string::basic_string[abi:ne180100]<0>(v40, "es");
  v41 = 1071225242;
  std::string::basic_string[abi:ne180100]<0>(v42, "ja");
  v43 = 1069547520;
  std::string::basic_string[abi:ne180100]<0>(v44, "pt");
  v45 = 1067030938;
  std::string::basic_string[abi:ne180100]<0>(v46, "vi");
  v47 = 1077516698;
  if (!*((_QWORD *)v2 + 4))
  {
LABEL_31:
    v20 = 0;
    goto LABEL_34;
  }
  v13 = *((_QWORD *)v2 + 3);
  v14 = (_QWORD *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v2 + 24;
  *(_QWORD *)(v13 + 16) = 0;
  *((_QWORD *)v2 + 3) = 0;
  *((_QWORD *)v2 + 4) = 0;
  if (v14[1])
    v15 = (_QWORD *)v14[1];
  else
    v15 = v14;
  v33 = v2 + 16;
  v34 = v15;
  v35 = v15;
  if (!v15)
  {
    std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v33);
    goto LABEL_31;
  }
  v16 = 0;
  v34 = std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v15);
  v17 = __p;
  while (1)
  {
    v18 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>((uint64_t)(v2 + 16), &v36, (const void **)v17);
    if (!*v18)
      break;
    v15 = v35;
LABEL_24:
    v20 = v16 + 1;
    v17 += 4;
    if (v15)
      v21 = v16 == 4;
    else
      v21 = 1;
    ++v16;
    if (v21)
      goto LABEL_33;
  }
  v19 = v18;
  std::string::operator=((std::string *)(v15 + 4), (const std::string *)v17);
  *((_DWORD *)v15 + 14) = *((_DWORD *)v17 + 6);
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at((uint64_t **)v2 + 2, v36, v19, v15);
  v15 = v34;
  v35 = v34;
  if (v34)
  {
    v34 = std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v34);
    goto LABEL_24;
  }
  v20 = v16 + 1;
LABEL_33:
  std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v33);
  if (v20 != 5)
  {
LABEL_34:
    v22 = 8 * v20;
    do
    {
      v23 = &__p[v22 / 2];
      v24 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>((uint64_t)(v2 + 16), &v33, (const void **)&__p[v22 / 2]);
      if (!*v24)
      {
        v25 = v24;
        v26 = (char *)operator new(0x40uLL);
        v27 = (std::string *)(v26 + 32);
        if (*(&v38 + v22 * 4) < 0)
        {
          std::string::__init_copy_ctor_external(v27, (const std::string::value_type *)__p[v22 / 2], (std::string::size_type)__p[v22 / 2 + 1]);
        }
        else
        {
          *(_OWORD *)&v27->__r_.__value_.__l.__data_ = *(_OWORD *)v23;
          *((_QWORD *)v26 + 6) = v23[2];
        }
        *((_DWORD *)v26 + 14) = v39[v22];
        std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__insert_node_at((uint64_t **)v2 + 2, (uint64_t)v33, v25, (uint64_t *)v26);
      }
      v22 += 8;
    }
    while (v22 != 40);
  }
  for (i = 0; i != -20; i -= 4)
  {
    if (SHIBYTE(v46[i + 2]) < 0)
      operator delete((void *)v46[i]);
  }
  if ((char)v31 < 0)
    operator delete(v30[0]);
  return (CRFormContentTypePredictor *)v2;
}

- (id)_modelInputWithFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  CRFormContentTypeModelInput *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "_nonFieldRegions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") && objc_msgSend(v10, "count"))
  {
    v35 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E993D040, 65568, &v35);
    v12 = v35;
    if (v12)
    {
      v13 = v12;
      CROSLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v13, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_FAULT, "Failed to create a field array: %@", buf, 0xCu);

      }
      v16 = 0;
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke;
      v32[3] = &unk_1E98DA8D8;
      v17 = v7;
      v33 = v17;
      v18 = v8;
      v34 = v18;
      objc_msgSend(v11, "getMutableBytesWithHandler:", v32);
      v19 = objc_alloc(MEMORY[0x1E0C9E970]);
      v36[0] = &unk_1E99268E0;
      v36[1] = &unk_1E99268F8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 7700);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v26 = (void *)objc_msgSend(v19, "initWithShape:dataType:error:", v21, 65568, &v31);
      v13 = v31;

      if (v13)
      {
        CROSLogForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v13, "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v23;
          _os_log_impl(&dword_1D4FB8000, v22, OS_LOG_TYPE_FAULT, "Failed to create a label array: %@", buf, 0xCu);

        }
        v16 = 0;
      }
      else
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_53;
        v27[3] = &unk_1E98DA900;
        v24 = v10;
        v28 = v24;
        v29 = v18;
        v30 = v9;
        objc_msgSend(v26, "getMutableBytesWithHandler:", v27);
        v16 = -[CRFormContentTypeModelInput initWithFieldArray:labelArray:fieldCount:labelCount:useFloatOnly:]([CRFormContentTypeModelInput alloc], "initWithFieldArray:labelArray:fieldCount:labelCount:useFloatOnly:", v11, v26, -[NSObject count](v17, "count"), -[NSObject count](v24, "count"), 1);

        v22 = v28;
      }

      v14 = v33;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke(uint64_t a1, float *a2, int64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  float v19;
  void *v20;
  double v21;
  float v22;
  void *v23;
  double v24;
  float v25;
  id v26;
  uint64_t v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = a4;
  if (a3 >= 1)
    bzero(a2, a3);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v27 = 0;
    v9 = *(_QWORD *)v30;
LABEL_5:
    v10 = 0;
    v11 = v27 + 1;
    v27 += v8;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      v13 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v12);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = *(void **)(a1 + 40);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_2;
        v28[3] = &unk_1E98DA8B0;
        v28[4] = v12;
        v13 = objc_msgSend(v14, "indexOfObjectPassingTest:", v28);
      }
      *a2 = (float)v13;
      objc_msgSend(v12, "boundingQuad");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundingBox");
      *(float *)&v16 = v16;
      a2[1] = *(float *)&v16;

      objc_msgSend(v12, "boundingQuad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "boundingBox");
      v19 = v18;
      a2[2] = v19;

      objc_msgSend(v12, "boundingQuad");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "boundingBox");
      v22 = v21;
      a2[3] = v22;

      objc_msgSend(v12, "boundingQuad");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "boundingBox");
      v25 = v24;
      a2[4] = v25;

      if ((unint64_t)(v11 + v10) >= 0x80)
        break;
      a2 += 5;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

BOOL __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    v8 = 1;
  }
  else
  {
    CRCastAsClass<CRFormField>(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "originalField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == *(void **)(a1 + 32);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

void __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_53(uint64_t a1, float *a2, int64_t a3, void *a4)
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  float v11;
  void *v12;
  double v13;
  float v14;
  void *v15;
  double v16;
  float v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  std::vector<int>::size_type size;
  uint64_t v31;
  float *v32;
  std::vector<int>::pointer begin;
  const char *v34;
  void *v35;
  int64_t v36;
  void **v37;
  int64_t v38;
  std::string *v39;
  char *v40;
  int v41;
  std::string *v42;
  int64_t v43;
  char *v44;
  char *v45;
  int64_t v46;
  size_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  unint64_t i;
  char *v58;
  uint64_t v59;
  float *v60;
  int64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  float *v74;
  float *v75;
  float *v76;
  int v77;
  float *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  int v83;
  char *v84;
  char *v85;
  int v86;
  char *v87;
  void *v88;
  int64_t v89;
  id v90;
  uint64_t v91;
  id obj;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  __CFString *v96;
  uint64_t v97;
  char *__dst;
  uint64_t v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  std::vector<int> v111;
  void *__p;
  float *v113;
  char *v114;
  void *__s1[2];
  unsigned __int8 v116;
  void *v117;
  _BYTE *v118;
  std::string v119;
  _BYTE v120[128];
  std::vector<int>::value_type __x[32];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v90 = a4;
  if (a3 >= 1)
    bzero(a2, a3);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = *(id *)(a1 + 32);
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
  if (!v94)
    goto LABEL_109;
  v93 = *(_QWORD *)v104;
  v91 = 0;
LABEL_5:
  v100 = 0;
  v97 = v91;
  v91 += v94;
  while (2)
  {
    if (*(_QWORD *)v104 != v93)
      objc_enumerationMutation(obj);
    v6 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v100);
    *a2 = (float)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v6);
    objc_msgSend(v6, "boundingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingBox");
    *(float *)&v8 = v8;
    a2[1] = *(float *)&v8;

    objc_msgSend(v6, "boundingQuad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingBox");
    v11 = v10;
    a2[2] = v11;

    objc_msgSend(v6, "boundingQuad");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingBox");
    v14 = v13;
    a2[3] = v14;

    objc_msgSend(v6, "boundingQuad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingBox");
    v17 = v16;
    a2[4] = v17;

    objc_msgSend(v6, "text");
    v18 = objc_claimAutoreleasedReturnValue();
    v95 = (void *)v18;
    v19 = &stru_1E98DC948;
    if (v18)
      v19 = (__CFString *)v18;
    v20 = *(void **)(a1 + 48);
    v21 = v19;
    v101 = v20;
    v96 = v21;
    -[__CFString lowercaseString](v21, "lowercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_crStringByRemovingParenthesizedText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v23, "length") >= 0xB)
    {
      v24 = v23;

      v22 = v24;
    }

    v102 = objc_retainAutorelease(v22);
    std::string::basic_string[abi:ne180100]<0>(&v119, (char *)objc_msgSend(v102, "UTF8String"));
    __x[0] = 0;
    std::vector<float>::vector(&v117, 0x12uLL, __x);
    v25 = 0;
    __dst = (char *)(a2 + 5);
    do
    {
      if (!std::string::compare(&v119, (&CRFormContentTypeModelVocabulary::keywords_full_match)[v25]))
        *((_DWORD *)v117 + v25) = 1065353216;
      ++v25;
    }
    while (v25 != 18);
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v101, "lowercaseString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("<LANG_%@>"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_retainAutorelease(v28);
    std::string::basic_string[abi:ne180100]<0>(__s1, (char *)objc_msgSend(v29, "UTF8String"));

    __x[0] = 0;
    std::vector<float>::vector(&__p, 0x1DFDuLL, __x);
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v119.__r_.__value_.__r.__words[2]);
    else
      size = v119.__r_.__value_.__l.__size_;
    __x[0] = 0;
    std::vector<int>::vector(&v111, size, __x);
    v31 = 0;
    v32 = (float *)__p;
    begin = v111.__begin_;
    do
    {
      v34 = CRFormContentTypeModelVocabulary::keywords[v31];
      v35 = (void *)strlen(v34);
      v36 = (int64_t)v35;
      if ((char)v116 < 0)
      {
        if (v35 != __s1[1])
          goto LABEL_27;
        if (v35 == (void *)-1)
          std::string::__throw_out_of_range[abi:ne180100]();
        v37 = (void **)__s1[0];
      }
      else
      {
        if (v35 != (void *)v116)
          goto LABEL_27;
        v37 = __s1;
      }
      if (!memcmp(v37, v34, v36))
      {
        v32[v31] = v32[v31] + 1.0;
        goto LABEL_44;
      }
LABEL_27:
      v38 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
      if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v39 = &v119;
      else
        v39 = (std::string *)v119.__r_.__value_.__r.__words[0];
      if (v36)
      {
        if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v38 = v119.__r_.__value_.__l.__size_;
        if (v38 >= v36)
        {
          v40 = (char *)v39 + v38;
          v41 = *v34;
          v42 = v39;
          do
          {
            v43 = v38 - v36;
            if (v43 == -1)
              break;
            v44 = (char *)memchr(v42, v41, v43 + 1);
            if (!v44)
              break;
            v45 = v44;
            if (!memcmp(v44, v34, v36))
            {
              if (v45 != v40)
              {
                v46 = v45 - (char *)v39;
                if (v45 - (char *)v39 != -1)
                  goto LABEL_41;
              }
              break;
            }
            v42 = (std::string *)(v45 + 1);
            v38 = v40 - (v45 + 1);
          }
          while (v38 >= v36);
        }
      }
      else
      {
        v46 = 0;
LABEL_41:
        v32[v31] = v32[v31] + 1.0;
        v47 = strlen(v34);
        if (v47)
          memset_pattern16(&begin[v46], &unk_1D513A1E0, 4 * v47);
      }
LABEL_44:
      ++v31;
    }
    while (v31 != 7677);
    objc_msgSend(v102, "componentsSeparatedByString:", CFSTR(" "));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v49 = v48;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v107, __x, 16);
    v51 = v50;
    if (v50)
    {
      v52 = 0;
      v53 = *(_QWORD *)v108;
      do
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v108 != v53)
            objc_enumerationMutation(v49);
          v55 = 0;
          v56 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v54);
          for (i = v52; i < objc_msgSend(v56, "length") + v52; ++i)
            v55 += v111.__begin_[i];
          if (objc_msgSend(v56, "length") > (unint64_t)v55)
            *(v113 - 1) = *(v113 - 1) + 1.0;
          v52 += objc_msgSend(v56, "length") + 1;
          ++v54;
        }
        while (v54 != v51);
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v107, __x, 16);
      }
      while (v51);
    }

    v58 = (char *)v117;
    if (v118 - (_BYTE *)v117 >= 1)
    {
      v59 = (v118 - (_BYTE *)v117) >> 2;
      v60 = v113;
      v61 = (char *)v113 - (_BYTE *)__p;
      v62 = (char *)__p + (((char *)v113 - (_BYTE *)__p) & 0xFFFFFFFFFFFFFFFCLL);
      if (v59 > (v114 - (char *)v113) >> 2)
      {
        v63 = v61 >> 2;
        v64 = (v61 >> 2) + v59;
        if (v64 >> 62)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v65 = v114 - (_BYTE *)__p;
        if ((v114 - (_BYTE *)__p) >> 1 > v64)
          v64 = v65 >> 1;
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL)
          v66 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v66 = v64;
        if (v66)
        {
          v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v114, v66);
          v69 = v68;
        }
        else
        {
          v67 = 0;
          v69 = 0;
        }
        v79 = &v67[4 * v63];
        v80 = &v79[4 * v59];
        v81 = 4 * v59;
        v82 = v79;
        do
        {
          v83 = *(_DWORD *)v58;
          v58 += 4;
          *(_DWORD *)v82 = v83;
          v82 += 4;
          v81 -= 4;
        }
        while (v81);
        v84 = (char *)__p;
        if (__p != v62)
        {
          v85 = v62;
          do
          {
            v86 = *((_DWORD *)v85 - 1);
            v85 -= 4;
            *((_DWORD *)v79 - 1) = v86;
            v79 -= 4;
          }
          while (v85 != v84);
        }
        v87 = (char *)((char *)v113 - v62);
        if (v113 != (float *)v62)
          memmove(v80, v62, (char *)v113 - v62);
        v88 = __p;
        __p = v79;
        v113 = (float *)&v87[(_QWORD)v80];
        v114 = &v67[4 * v69];
        if (v88)
          operator delete(v88);
        goto LABEL_94;
      }
      v70 = (char *)v113 - v62;
      v71 = ((char *)v113 - v62) >> 2;
      if (v71 >= v59)
      {
        v72 = (char *)v117 + 4 * v59;
        v74 = v113;
      }
      else
      {
        v72 = (char *)v117 + 4 * v71;
        v73 = v118 - v72;
        if (v118 != v72)
          memmove(v113, (char *)v117 + 4 * v71, v118 - v72);
        v74 = (float *)((char *)v60 + v73);
        v113 = (float *)((char *)v60 + v73);
        if (v70 < 1)
          goto LABEL_94;
      }
      v75 = &v74[-v59];
      v76 = v74;
      while (v75 < v60)
      {
        v77 = *(_DWORD *)v75++;
        *(_DWORD *)v76++ = v77;
      }
      v78 = (float *)&v62[4 * v59];
      v113 = v76;
      if (v74 != v78)
        memmove(&v74[-(v74 - v78)], v62, (char *)v74 - (char *)v78);
      if (v72 != v58)
        memmove(v62, v58, v72 - v58);
    }
LABEL_94:
    v89 = (char *)v113 - (_BYTE *)__p;
    if (v113 != __p)
      memmove(__dst, __p, (char *)v113 - (_BYTE *)__p);

    if (v111.__begin_)
    {
      v111.__end_ = v111.__begin_;
      operator delete(v111.__begin_);
    }
    if (__p)
    {
      v113 = (float *)__p;
      operator delete(__p);
    }
    if ((char)v116 < 0)
      operator delete(__s1[0]);
    if (v117)
    {
      v118 = v117;
      operator delete(v117);
    }
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);

    if ((unint64_t)++v97 < 0x80)
    {
      a2 = (float *)&__dst[v89];
      if (++v100 != v94)
        continue;
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
      if (!v94)
        break;
      goto LABEL_5;
    }
    break;
  }
LABEL_109:

}

- (void)_decodeCoreMLOutput:(id)a3 forFields:(id)a4 updateExternal:(BOOL)a5
{
  void *v6;
  void *v7;
  id v8;
  _DWORD *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t i;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id obj;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v34 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v31 = a4;
  objc_msgSend(v30, "featureValueForName:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiArrayValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  v9 = (_DWORD *)objc_msgSend(v8, "dataPointer");
  objc_msgSend(v8, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v31;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v14)
  {
    v33 = *(_QWORD *)v38;
    do
    {
      v15 = 0;
      v35 = v14;
      do
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
        v16 = 0;
        v17 = 0;
        if (v13)
        {
          v18 = 0;
          for (i = 0; i != v13; ++i)
          {
            if (v17 >= v18)
            {
              v20 = (uint64_t)(v17 - (_QWORD)v16) >> 4;
              v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 60)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v18 - (_QWORD)v16) >> 3 > v21)
                v21 = (uint64_t)(v18 - (_QWORD)v16) >> 3;
              if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
                v22 = 0xFFFFFFFFFFFFFFFLL;
              else
                v22 = v21;
              if (v22)
                v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTextRecognition::CRCTLD::CTLDObstacle>>(v22);
              else
                v23 = 0;
              v24 = v22 + 16 * v20;
              *(_DWORD *)v24 = *v9;
              *(_QWORD *)(v24 + 8) = i;
              if ((_QWORD *)v17 == v16)
              {
                v26 = (_QWORD *)(v22 + 16 * v20);
              }
              else
              {
                v25 = v22 + 16 * v20;
                do
                {
                  v26 = (_QWORD *)(v25 - 16);
                  *(_OWORD *)(v25 - 16) = *(_OWORD *)(v17 - 16);
                  v17 -= 16;
                  v25 -= 16;
                }
                while ((_QWORD *)v17 != v16);
              }
              v18 = v22 + 16 * v23;
              v17 = v24 + 16;
              if (v16)
                operator delete(v16);
              v16 = v26;
            }
            else
            {
              *(_DWORD *)v17 = *v9;
              *(_QWORD *)(v17 + 8) = i;
              v17 += 16;
            }
            ++v9;
          }
        }
        v8 = v11;
        if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:", v36, v34, 0, 1))
        {
          v27 = 126 - 2 * __clz((uint64_t)(v17 - (_QWORD)v16) >> 4);
          if ((_QWORD *)v17 == v16)
            v28 = 0;
          else
            v28 = v27;
          std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::tuple<float,unsigned long> *,false>((unint64_t)v16, v17, v28, 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&CRFormContentTypeModelVocabulary::classnames)[v16[1]]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setTextContentType:", +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", v29));

        }
        else if (!v16)
        {
          goto LABEL_35;
        }
        operator delete(v16);
LABEL_35:
        ++v15;
      }
      while (v15 != v35);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v14);
  }

}

- (void)_decodeEspressoOutput:(id *)a3 forFields:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  size_t v13;
  size_t v14;
  _BYTE *v15;
  char **v16;
  id v17;
  float v18;
  id v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *p_pair1;
  _BOOL4 v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> **v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *var0;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  float *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  float *v40;
  unint64_t v41;
  uint64_t v42;
  float v43;
  float v44;
  uint64_t v45;
  double v46;
  unint64_t v47;
  unint64_t v48;
  double v49;
  double v50;
  BOOL v51;
  NSObject *v53;
  NSObject *v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  double v73;
  _BYTE __p[22];
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v71 = a4;
  v66 = a5;
  std::string::basic_string[abi:ne180100]<0>(__p, "None");
  v9 = 0;
  v10 = HIBYTE(v75);
  v11 = *(_BYTE **)__p;
  v12 = *(_QWORD *)&__p[8];
  while (1)
  {
    v13 = strlen((&CRFormContentTypeModelVocabulary::classnames)[v9]);
    v14 = v13;
    if ((v10 & 0x80) != 0)
      break;
    if (v13 == v10)
    {
      v15 = __p;
      goto LABEL_7;
    }
LABEL_8:
    if (++v9 == 34)
    {
      v16 = (char **)&OBJC_PROTOCOL___CROutputRegionLayoutContributing;
      if ((v10 & 0x80) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  if (v13 != v12)
    goto LABEL_8;
  v15 = v11;
  if (v12 == -1)
    std::string::__throw_out_of_range[abi:ne180100]();
LABEL_7:
  if (memcmp(v15, (&CRFormContentTypeModelVocabulary::classnames)[v9], v14))
    goto LABEL_8;
  v16 = &(&CRFormContentTypeModelVocabulary::classnames)[v9];
  if ((v10 & 0x80) != 0)
LABEL_10:
    operator delete(v11);
LABEL_11:
  v17 = v66;
  v18 = 0.7;
  v69 = v17;
  if (v17 && (unint64_t)objc_msgSend(v17, "length") >= 2)
  {
    objc_msgSend(v69, "substringToIndex:", 2);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v19, "UTF8String"));

    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *)self->_customNoneBonuses.__tree_.__pair1_.__value_.__left_;
    v18 = 0.7;
    if (left)
    {
      p_pair1 = &self->_customNoneBonuses.__tree_.__pair1_;
      do
      {
        v22 = std::less<std::string>::operator()[abi:ne180100]((uint64_t)&self->_customNoneBonuses.__tree_.__pair3_, (const void **)&left[4].__value_.__left_, (const void **)__p);
        v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> **)&left[1];
        if (!v22)
        {
          v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> **)left;
          p_pair1 = left;
        }
        left = *v23;
      }
      while (*v23);
      if (p_pair1 != &self->_customNoneBonuses.__tree_.__pair1_
        && !std::less<std::string>::operator()[abi:ne180100]((uint64_t)&self->_customNoneBonuses.__tree_.__pair3_, (const void **)__p, (const void **)&p_pair1[4].__value_.__left_))
      {
        v18 = *(float *)&p_pair1[7].__value_.__left_;
      }
    }
    if (SHIBYTE(v75) < 0)
      operator delete(*(void **)__p);
  }

  espresso_buffer_unpack_tensor_shape();
  v73 = 0.0;
  v24 = 0;
  v25 = v88;
  var0 = a3->var0;
  v68 = 4 * (v16 - &CRFormContentTypeModelVocabulary::classnames);
  *(_QWORD *)&v27 = 136315138;
  v65 = v27;
  while (2)
  {
    v28 = objc_msgSend(v71, "count", v65);
    v29 = v87;
    if (v87 >= v28)
      v29 = v28;
    if (*(_QWORD *)&v73 < v29)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      do
      {
        if (v31 >= v32)
        {
          v34 = (uint64_t)(v31 - (_QWORD)v30) >> 4;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v32 - (_QWORD)v30) >> 3 > v35)
            v35 = (uint64_t)(v32 - (_QWORD)v30) >> 3;
          if (v32 - (unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
            v36 = 0xFFFFFFFFFFFFFFFLL;
          else
            v36 = v35;
          if (v36)
            v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTextRecognition::CRCTLD::CTLDObstacle>>(v36);
          else
            v37 = 0;
          v38 = v36 + 16 * v34;
          *(_DWORD *)v38 = *var0;
          *(_QWORD *)(v38 + 8) = v33;
          if ((float *)v31 == v30)
          {
            v40 = (float *)(v36 + 16 * v34);
          }
          else
          {
            v39 = v36 + 16 * v34;
            do
            {
              v40 = (float *)(v39 - 16);
              *(_OWORD *)(v39 - 16) = *(_OWORD *)(v31 - 16);
              v31 -= 16;
              v39 -= 16;
            }
            while ((float *)v31 != v30);
          }
          v32 = v36 + 16 * v37;
          v31 = v38 + 16;
          if (v30)
            operator delete(v30);
          v30 = v40;
        }
        else
        {
          *(_DWORD *)v31 = *var0;
          *(_QWORD *)(v31 + 8) = v33;
          v31 += 16;
        }
        ++var0;
        ++v33;
      }
      while (v33 != v25);
      v30[v68] = v18 + v30[v68];
      objc_msgSend(v71, "objectAtIndexedSubscript:", *(_QWORD *)&v73);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:"))
      {
        v41 = 126 - 2 * __clz((uint64_t)(v31 - (_QWORD)v30) >> 4);
        if ((float *)v31 == v30)
          v42 = 0;
        else
          v42 = v41;
        std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::tuple<float,unsigned long> *,false>((unint64_t)v30, v31, v42, 1);
        v43 = *v30;
        v44 = v30[4];
        v45 = *((_QWORD *)v30 + 3);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&CRFormContentTypeModelVocabulary::classnames)[*((_QWORD *)v30 + 1)]);
        v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&CRFormContentTypeModelVocabulary::classnames)[v45]);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", *(_QWORD *)&v46);
        v48 = +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", v70);
        v49 = COERCE_DOUBLE(v69);
        if (v24 != 39 || v47 != 1 || v48 != 38)
          goto LABEL_63;
        if (!+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", *(_QWORD *)&v49)
          && !+[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", *(_QWORD *)&v49))
        {
          v51 = +[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", *(_QWORD *)&v49);
          *(float *)&v50 = v44 + 3.0;
          if ((float)(v44 + 3.0) <= v43 || !v51)
            goto LABEL_63;
          goto LABEL_68;
        }
        *(float *)&v50 = v44 + 1.5;
        if ((float)(v44 + 1.5) > v43)
          goto LABEL_68;
LABEL_63:
        if (+[CRImageReader languageIsFrench:](CRImageReader, "languageIsFrench:", *(_QWORD *)&v49, v50)
          && (float)(v44 + 2.1) > v43
          && !v24
          && v47 == 6
          && v48 == 2)
        {
LABEL_68:

          CROSLogForCategory(6);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__p = 136316163;
            *(_QWORD *)&__p[4] = "-[CRFormContentTypePredictor _decodeEspressoOutput:forFields:locale:updateExternal:]";
            *(_WORD *)&__p[12] = 2113;
            *(_QWORD *)&__p[14] = v70;
            v75 = 2048;
            v76 = v44;
            v77 = 2113;
            v78 = v46;
            v79 = 2048;
            v80 = v43;
            _os_log_impl(&dword_1D4FB8000, v53, OS_LOG_TYPE_DEBUG, "%s: Adopt second candidate %{private}@ %lf over %{private}@ %lf.", __p, 0x34u);
          }

          v49 = v46;
          v46 = COERCE_DOUBLE(v70);
        }
        else
        {
          v44 = v43;
        }

        if (objc_msgSend(v72, "fieldSource") == 4)
        {
          CROSLogForCategory(6);
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v72, "boundingQuad");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "topLeft");
            v56 = v55;
            objc_msgSend(v72, "boundingQuad");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "topLeft");
            v59 = v58;
            objc_msgSend(v72, "boundingQuad");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "size");
            v62 = v61;
            objc_msgSend(v72, "boundingQuad");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "size");
            *(_DWORD *)__p = 136316931;
            *(_QWORD *)&__p[4] = "-[CRFormContentTypePredictor _decodeEspressoOutput:forFields:locale:updateExternal:]";
            *(_WORD *)&__p[12] = 2113;
            *(double *)&__p[14] = v46;
            v75 = 2048;
            v76 = v73;
            v77 = 2048;
            v78 = v44;
            v79 = 2048;
            v80 = v56;
            v81 = 2048;
            v82 = v59;
            v83 = 2048;
            v84 = v62;
            v85 = 2048;
            v86 = v64;
            _os_log_impl(&dword_1D4FB8000, v54, OS_LOG_TYPE_DEBUG, "%s: Setting content type %{private}@ to PDF widget #%lu (score:%f x:%f y:%f w:%f h:%f).", __p, 0x52u);

          }
        }
        objc_msgSend(v72, "setTextContentType:", +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", *(_QWORD *)&v46));
        v24 = objc_msgSend(v72, "textContentType");

      }
      operator delete(v30);
      ++*(_QWORD *)&v73;
      continue;
    }
    break;
  }

}

- (BOOL)_predictAndAssignContentTypesForFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  CRFormContentTypePredictor *v14;
  void *v15;
  void *v16;
  uint64_t value;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int64x2_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64x2_t *v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  _OWORD *v36;
  int v37;
  int v38;
  BOOL v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  const char *v43;
  id v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *__p;
  void *v55;
  __int128 buf;
  int64x2_t *v57;
  __int128 v58;
  int64x2_t *v59;
  uint64_t v60;

  v6 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51 = v11;
  v52 = v10;
  -[CRFormContentTypePredictor _modelInputWithFields:fieldsAndRegions:locale:](self, "_modelInputWithFields:fieldsAndRegions:locale:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v48 = v6;
    v14 = self;
    objc_sync_enter(v14);
    objc_msgSend(v13, "fields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shape");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "labels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    value = (uint64_t)v14->_espressoModel.__ptr_.__value_;
    objc_msgSend(v13, "fields");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "dataPointer");
    objc_msgSend(v53, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");
    objc_msgSend(v53, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntegerValue");
    v24 = (int64x2_t *)operator new(0x20uLL);
    *((_QWORD *)&buf + 1) = v24 + 2;
    v57 = v24 + 2;
    *v24 = vdupq_n_s64(1uLL);
    v24[1].i64[0] = v21;
    v24[1].i64[1] = v23;
    *(_QWORD *)&buf = v24;
    if (CoreRecognition::EspressoModelWrapper::bindInput(value, v19))
    {
      v25 = (uint64_t)v14->_espressoModel.__ptr_.__value_;
      objc_msgSend(v13, "labels");
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v49, "dataPointer");
      objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v47, "unsignedIntegerValue");
      objc_msgSend(v50, "objectAtIndexedSubscript:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v46, "unsignedIntegerValue");
      v29 = (int64x2_t *)operator new(0x20uLL);
      *((_QWORD *)&v58 + 1) = v29 + 2;
      v59 = v29 + 2;
      *v29 = vdupq_n_s64(1uLL);
      v29[1].i64[0] = v27;
      v29[1].i64[1] = v28;
      *(_QWORD *)&v58 = v29;
      if (CoreRecognition::EspressoModelWrapper::bindInput(v25, v26))
      {
        v30 = (uint64_t)v14->_espressoModel.__ptr_.__value_;
        objc_msgSend(v13, "length");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v31 = objc_msgSend(v45, "dataPointer");
        v32 = operator new(0x20uLL);
        *v32 = xmmword_1D513ABB8;
        v32[1] = unk_1D513ABC8;
        v55 = v32;
        if (CoreRecognition::EspressoModelWrapper::bindInput(v30, v31))
        {
          v33 = (uint64_t)v14->_espressoModel.__ptr_.__value_;
          objc_msgSend(v13, "num_labels");
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v35 = objc_msgSend(v34, "dataPointer");
          v36 = operator new(0x20uLL);
          *v36 = xmmword_1D513ABB8;
          v36[1] = unk_1D513ABC8;
          __p = v36;
          v37 = CoreRecognition::EspressoModelWrapper::bindInput(v33, v35);
          if (__p)
            operator delete(__p);

          v38 = v37 ^ 1;
        }
        else
        {
          v38 = 1;
        }
        if (v55)
          operator delete(v55);

      }
      else
      {
        v38 = 1;
      }
      if ((_QWORD)v58)
      {
        *((_QWORD *)&v58 + 1) = v58;
        operator delete((void *)v58);
      }

    }
    else
    {
      v38 = 1;
    }
    if ((_QWORD)buf)
    {
      *((_QWORD *)&buf + 1) = buf;
      operator delete((void *)buf);
    }

    if (v38)
    {
      CROSLogForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndReg"
                                        "ions:locale:updateExternal:]";
        _os_log_impl(&dword_1D4FB8000, v40, OS_LOG_TYPE_FAULT, "%s: Input binding failed for Espresso model", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_33;
    }
    if ((CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)v14->_espressoModel.__ptr_.__value_, (uint64_t)&buf, (uint64_t)"score", 1) & 1) != 0)
    {
      if (CoreRecognition::EspressoModelWrapper::execute((CoreRecognition::EspressoModelWrapper *)v14->_espressoModel.__ptr_.__value_))
      {
        -[CRFormContentTypePredictor _decodeEspressoOutput:forFields:locale:updateExternal:](v14, "_decodeEspressoOutput:forFields:locale:updateExternal:", &buf, v52, v12, v48);
        v41 = 0;
LABEL_34:

        v39 = v41 == 0;
        objc_sync_exit(v14);

        goto LABEL_35;
      }
      CROSLogForCategory(0);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        goto LABEL_32;
      LODWORD(v58) = 136315138;
      *(_QWORD *)((char *)&v58 + 4) = "-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndRegio"
                                      "ns:locale:updateExternal:]";
      v43 = "%s: Inference failed for Espresso model";
    }
    else
    {
      CROSLogForCategory(0);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
LABEL_32:

LABEL_33:
        v41 = 1;
        goto LABEL_34;
      }
      LODWORD(v58) = 136315138;
      *(_QWORD *)((char *)&v58 + 4) = "-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndRegio"
                                      "ns:locale:updateExternal:]";
      v43 = "%s: Output binding failed for Espresso model";
    }
    _os_log_impl(&dword_1D4FB8000, v42, OS_LOG_TYPE_FAULT, v43, (uint8_t *)&v58, 0xCu);
    goto LABEL_32;
  }
  v39 = 0;
LABEL_35:

  return v39;
}

- (BOOL)predictAndAssignContentTypesForFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v32;
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v6 = a6;
  v52 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v35 = a4;
  v34 = a5;
  v36 = (void *)objc_opt_new();
  v9 = 0;
  for (i = 1; ; ++i)
  {
    v11 = objc_msgSend(v35, "count");
    v12 = i - 1;
    if (i - 1 >= v11)
      break;
    objc_msgSend(v35, "objectAtIndexedSubscript:", i - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1EFF19038;
    v15 = v13;
    if (objc_msgSend(v15, "conformsToProtocol:", v14))
      v16 = v15;
    else
      v16 = 0;

    if (v16)
    {
      CRCastAsClass<CRFormField>(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17
        || (objc_msgSend(v17, "originalField"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = v19 == 0,
            v19,
            v20))
      {
        objc_msgSend(v36, "addObject:", v16);
      }
      else
      {
        objc_msgSend(v18, "originalField");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v21);

      }
    }
    if (i - v9 - objc_msgSend(v36, "count") == 128
      || objc_msgSend(v36, "count") == 128
      || i == objc_msgSend(v35, "count"))
    {
      objc_msgSend(v35, "subarrayWithRange:", v9, i - v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CROSLogForCategory(6);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = objc_msgSend(v35, "count");
        v25 = objc_msgSend(v36, "count");
        *(_DWORD *)buf = 136316162;
        v43 = "-[CRFormContentTypePredictor predictAndAssignContentTypesForFields:fieldsAndRegions:locale:updateExternal:]";
        v44 = 2048;
        v45 = v9;
        v46 = 2048;
        v47 = i - 1;
        v48 = 2048;
        v49 = v24;
        v50 = 2048;
        v51 = v25;
        _os_log_impl(&dword_1D4FB8000, v23, OS_LOG_TYPE_DEBUG, "%s: Predicting content types for range #%lu–%lu/%lu (including %lu fields)", buf, 0x34u);
      }

      if (objc_msgSend(v36, "count")
        && !-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndRegions:locale:updateExternal:](self, "_predictAndAssignContentTypesForFields:fieldsAndRegions:locale:updateExternal:", v36, v22, v34, v6))
      {

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v26 = v32;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v38 != v28)
                objc_enumerationMutation(v26);
              v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:", v30, v6, 1, 1))
              {
                objc_msgSend(v30, "setTextContentType:", 1);
              }
            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v27);
        }

        break;
      }
      objc_msgSend(v36, "removeAllObjects");
      if (v9 + 1 > i - 25)
        ++v9;
      else
        v9 = i - 25;

    }
  }

  return v12 >= v11;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::destroy((char *)self->_customNoneBonuses.__tree_.__pair1_.__value_.__left_);
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_espressoModel, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  return self;
}

@end
