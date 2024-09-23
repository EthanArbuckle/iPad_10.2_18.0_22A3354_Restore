@implementation TIKeyboardInputManager_mul

- (unsigned)internalIndexToExternal:(unsigned int)a3
{
  uint64_t v3;
  const KB::String *v5;
  void *v6;
  unsigned int v7;
  objc_super v9;
  _BYTE v10[8];
  void *v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (-[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
  {
    TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, v3, (uint64_t)v10);
    KB::ns_string((KB *)v10, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v11 && v10[6] == 1)
      free(v11);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManager_mul;
    return -[TIKeyboardInputManager internalIndexToExternal:](&v9, sel_internalIndexToExternal_, v3);
  }
  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_mul;
    -[TIKeyboardInputManager internalStringToExternal:](&v8, sel_internalStringToExternal_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)enumerateInputModesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "activeInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }
  else
  {
    -[TIKeyboardInputManager primaryInputMode](self, "primaryInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v7);
  }

}

- (BOOL)updateLanguageModelForKeyboardState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  TIKeyboardInputManager_mul *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  char *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  __n128 v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  unint64_t *v53;
  unint64_t v54;
  __n128 *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  __n128 *v62;
  unint64_t *p_shared_owners;
  unint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  char *v67;
  __int128 v68;
  int64x2_t v69;
  char *v70;
  unint64_t *v71;
  unint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  void *v76;
  void *v77;
  BOOL v78;
  NSObject *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t m;
  char *v86;
  char *v87;
  uint64_t v88;
  unint64_t *v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  unint64_t *v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  unint64_t v102;
  _QWORD *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  _QWORD *v110;
  char *v111;
  uint64_t v112;
  std::__shared_weak_count_vtbl *v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  std::__shared_weak_count *on_zero_shared;
  TIKeyboardInputManager_mul *v117;
  unint64_t v118;
  unint64_t *p_shared_weak_owners;
  unint64_t v120;
  unint64_t v121;
  unint64_t *v122;
  unint64_t v123;
  unint64_t v124;
  _QWORD *m_impl;
  unint64_t v126;
  unint64_t v127;
  void *v128;
  int v129;
  void *v130;
  int v131;
  _QWORD *v132;
  unsigned int *v133;
  unsigned int v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  unint64_t v137;
  std::__shared_weak_count *v138;
  _QWORD *v139;
  unint64_t *v140;
  unint64_t v141;
  uint64_t v142;
  char v143;
  std::__shared_weak_count *v144;
  unsigned int *v145;
  unsigned int v146;
  unint64_t *v147;
  unint64_t v148;
  std::__shared_weak_count *v149;
  unint64_t *v150;
  unint64_t v151;
  unint64_t *v152;
  unint64_t v153;
  unint64_t v154;
  id v156;
  void *v157;
  id v158;
  id v159;
  id obj;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  TIKeyboardInputManager_mul *v166;
  uint64_t v167;
  __n128 v168;
  __n128 v169;
  _QWORD *v170;
  std::__shared_weak_count *v171;
  uint64_t v172[2];
  unsigned int *v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _QWORD v178[6];
  void *__p[2];
  char v180;
  _QWORD v181[4];
  id v182;
  id v183;
  void **v184;
  void *v185;
  void **v186;
  uint64_t v187;
  uint64_t (*v188)(uint64_t, uint64_t);
  void (*v189)(uint64_t);
  TIKeyboardInputManager_mul *v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  int64x2_t *v199;
  void ***v200;
  uint64_t v201;
  uint64_t (*v202)(uint64_t, _QWORD *);
  uint64_t (*v203)(uint64_t);
  _BYTE v204[32];
  uint64_t v205;
  int v206;
  int64x2_t v207;
  char *v208;
  _BYTE v209[128];
  uint8_t buf[32];
  __int128 v211;
  int v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _QWORD v215[4];

  v215[1] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usesWordNgramModel");

  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "usesAdaptation"))
  {
    -[TIKeyboardInputManager dynamicResourcePath](self, "dynamicResourcePath");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  -[TIKeyboardInputManager config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "usesCustomNgramModel"))
  {
    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ngramModelPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v215[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v215, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v10;
  if (v10)
  {
    objc_msgSend(v10, "activeInputModes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "count");

  }
  -[TIKeyboardInputManager_mul validEnglishTransformerMultilingualConfig](self, "validEnglishTransformerMultilingualConfig");
  -[TIKeyboardInputManager_mul listOfModelLocalesFromActiveInputModes](self, "listOfModelLocalesFromActiveInputModes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_mul modelLocaleToInputModeMapping](self, "modelLocaleToInputModeMapping");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v9;
  v159 = v5;
  -[TIKeyboardInputManager_mul modelLoaderForModelLocaleMapping:customResourcePaths:dynamicResourcePath:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:](self, "modelLoaderForModelLocaleMapping:customResourcePaths:dynamicResourcePath:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientIdentifier");
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = self;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recipientIdentifier");
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v207 = 0uLL;
  v208 = 0;
  v199 = 0;
  v200 = (void ***)&v199;
  v201 = 0x5812000000;
  v202 = __Block_byref_object_copy__48;
  v203 = __Block_byref_object_dispose__49;
  memset(v204, 0, sizeof(v204));
  v205 = 0;
  v206 = 1065353216;
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  obj = v12;
  v167 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v214, 16);
  if (v167)
  {
    v161 = *(_QWORD *)v196;
    do
    {
      for (i = 0; i != v167; ++i)
      {
        if (*(_QWORD *)v196 != v161)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * i);
        objc_msgSend(v164, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_opt_new();
        v191 = 0u;
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v20 = v18;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v191, v213, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v192;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v192 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * j), "locale");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v25);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v191, v213, 16);
          }
          while (v22);
        }

        v185 = 0;
        v186 = &v185;
        v187 = 0x3032000000;
        v188 = __Block_byref_object_copy__2425;
        v189 = __Block_byref_object_dispose__2426;
        v26 = v166;
        v190 = v26;
        -[TIKeyboardInputManager keyboardState](v26, "keyboardState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "clientIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](v26, "keyboardState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "recipientIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v181[0] = MEMORY[0x1E0C809B0];
        v181[1] = 3221225472;
        v181[2] = __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke;
        v181[3] = &unk_1EA100DA8;
        v182 = v163;
        v184 = &v185;
        v183 = v162;
        if (v17)
        {
          objc_msgSend(v17, "sharedLanguageModelForClient:withRecipient:forLanguageLocales:completion:", v28, v30, v19, v181);
          v168 = *(__n128 *)buf;
        }
        else
        {
          v168 = 0u;
        }
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)buf = 0;

        std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
        v31 = (std::__shared_weak_count *)v168.n128_u64[1];
        if (v168.n128_u64[1])
        {
          v32 = (unint64_t *)(v168.n128_u64[1] + 8);
          do
            v33 = __ldxr(v32);
          while (__stxr(v33 + 1, v32));
        }
        v211 = 0u;
        memset(buf, 0, sizeof(buf));
        v212 = 1065353216;
        std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](buf, v168.n128_i64[0], v168.n128_i64[1]);
        v34 = std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v200 + 6, (uint64_t)__p, (uint64_t)__p);
        std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)(v34 + 40), (__int128 *)buf);
        if (*((_QWORD *)v34 + 10))
        {
          v35 = (_QWORD *)*((_QWORD *)v34 + 9);
          if (v35)
          {
            do
            {
              v36 = (_QWORD *)*v35;
              operator delete(v35);
              v35 = v36;
            }
            while (v36);
          }
          *((_QWORD *)v34 + 9) = 0;
          v37 = *((_QWORD *)v34 + 8);
          if (v37)
          {
            for (k = 0; k != v37; ++k)
              *(_QWORD *)(*((_QWORD *)v34 + 7) + 8 * k) = 0;
          }
          *((_QWORD *)v34 + 10) = 0;
        }
        v39 = *(_QWORD *)&buf[16];
        *(_QWORD *)&buf[16] = 0;
        v40 = (void *)*((_QWORD *)v34 + 7);
        *((_QWORD *)v34 + 7) = v39;
        if (v40)
          operator delete(v40);
        v41 = *(_QWORD *)&buf[24];
        v42 = v211;
        *((_QWORD *)v34 + 9) = v211;
        *((_QWORD *)v34 + 8) = v41;
        *(_QWORD *)&buf[24] = 0;
        v43 = *((_QWORD *)&v211 + 1);
        *((_QWORD *)v34 + 10) = *((_QWORD *)&v211 + 1);
        *((_DWORD *)v34 + 22) = v212;
        if (v43)
        {
          v44 = *(_QWORD *)(v42 + 8);
          if ((v41 & (v41 - 1)) != 0)
          {
            if (v44 >= v41)
              v44 %= v41;
          }
          else
          {
            v44 &= v41 - 1;
          }
          *(_QWORD *)(*((_QWORD *)v34 + 7) + 8 * v44) = v34 + 72;
          v211 = 0uLL;
        }
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&buf[16]);
        v45 = *(std::__shared_weak_count **)&buf[8];
        v46 = v168;
        if (!*(_QWORD *)&buf[8])
          goto LABEL_46;
        v47 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v45->__on_zero_shared)(v45, v168);
          std::__shared_weak_count::__release_weak(v45);
          v46 = v168;
          if (v168.n128_u64[1])
          {
LABEL_47:
            v49 = (unint64_t *)(v168.n128_u64[1] + 8);
            do
              v50 = __ldaxr(v49);
            while (__stlxr(v50 - 1, v49));
            if (!v50)
            {
              (*(void (**)(unint64_t, __n128))(*(_QWORD *)v168.n128_u64[1] + 16))(v168.n128_u64[1], v46);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v168.n128_u64[1]);
              v46 = v168;
            }
            v51 = v207.i64[1];
            v52 = v208;
            if (v207.i64[1] < (unint64_t)v208)
            {
              *(__n128 *)v207.i64[1] = v46;
              v53 = (unint64_t *)(v168.n128_u64[1] + 8);
              do
                v54 = __ldxr(v53);
              while (__stxr(v54 + 1, v53));
              goto LABEL_58;
            }
            goto LABEL_59;
          }
        }
        else
        {
LABEL_46:
          if (v168.n128_u64[1])
            goto LABEL_47;
        }
        v51 = v207.i64[1];
        v52 = v208;
        if (v207.i64[1] < (unint64_t)v208)
        {
          *(__n128 *)v207.i64[1] = v46;
LABEL_58:
          v55 = (__n128 *)(v51 + 16);
          goto LABEL_74;
        }
LABEL_59:
        v56 = (v51 - v207.i64[0]) >> 4;
        v57 = v56 + 1;
        if ((unint64_t)(v56 + 1) >> 60)
LABEL_198:
          abort();
        v58 = (uint64_t)&v52[-v207.i64[0]];
        if (v58 >> 3 > v57)
          v57 = v58 >> 3;
        if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0)
          v59 = 0xFFFFFFFFFFFFFFFLL;
        else
          v59 = v57;
        *(_QWORD *)&v211 = &v208;
        v169 = v46;
        v60 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::LanguageModel>>>(v59);
        v62 = (__n128 *)&v60[16 * v56];
        *v62 = v169;
        if (v31)
        {
          p_shared_owners = (unint64_t *)&v31->__shared_owners_;
          do
            v64 = __ldxr(p_shared_owners);
          while (__stxr(v64 + 1, p_shared_owners));
        }
        v65 = (_QWORD *)v207.i64[1];
        v66 = (_QWORD *)v207.i64[0];
        if (v207.i64[1] == v207.i64[0])
        {
          v69 = vdupq_n_s64(v207.u64[1]);
          v67 = &v60[16 * v56];
        }
        else
        {
          v67 = &v60[16 * v56];
          do
          {
            v68 = *((_OWORD *)v65 - 1);
            v65 -= 2;
            *((_OWORD *)v67 - 1) = v68;
            v67 -= 16;
            *v65 = 0;
            v65[1] = 0;
          }
          while (v65 != v66);
          v69 = v207;
        }
        v55 = v62 + 1;
        v207.i64[0] = (uint64_t)v67;
        v207.i64[1] = (uint64_t)&v62[1];
        *(int64x2_t *)&buf[8] = v69;
        v70 = v208;
        v208 = &v60[16 * v61];
        *(_QWORD *)&buf[24] = v70;
        *(_QWORD *)buf = v69.i64[0];
        std::__split_buffer<std::shared_ptr<KB::LanguageModel>>::~__split_buffer((uint64_t)buf);
LABEL_74:
        v207.i64[1] = (uint64_t)v55;
        if (v180 < 0)
          operator delete(__p[0]);

        if (v31)
        {
          v71 = (unint64_t *)&v31->__shared_owners_;
          do
            v72 = __ldaxr(v71);
          while (__stlxr(v72 - 1, v71));
          if (!v72)
          {
            ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
            std::__shared_weak_count::__release_weak(v31);
          }
        }
        _Block_object_dispose(&v185, 8);

      }
      v167 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v214, 16);
    }
    while (v167);
  }

  v73 = -[TIKeyboardInputManager_mul languageModelContainer](v166, "languageModelContainer");
  if (v73)
  {
    KB::LanguageModelContainer::language_models(v73, (char **)buf);
    v74 = (_QWORD *)v207.i64[0];
    v75 = *(_QWORD **)buf;
    if (v207.i64[1] - v207.i64[0] == *(_QWORD *)&buf[8] - *(_QWORD *)buf)
    {
      v77 = v158;
      v76 = v159;
      if (*(_QWORD *)buf == *(_QWORD *)&buf[8])
      {
LABEL_88:
        v185 = buf;
        std::vector<std::shared_ptr<KB::LanguageModel>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v185);
        v78 = 0;
        goto LABEL_197;
      }
      while (*v75 == *v74)
      {
        v75 += 2;
        v74 += 2;
        if (v75 == *(_QWORD **)&buf[8])
          goto LABEL_88;
      }
      v185 = buf;
    }
    else
    {
      v185 = buf;
    }
    std::vector<std::shared_ptr<KB::LanguageModel>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v185);
  }
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading/reloading multilingual language models."), "-[TIKeyboardInputManager_mul updateLanguageModelForKeyboardState]");
      v156 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v156;
      _os_log_debug_impl(&dword_1DA6F2000, v79, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  memset(buf, 0, 24);
  v178[0] = MEMORY[0x1E0C809B0];
  v178[1] = 3221225472;
  v178[2] = __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke_53;
  v178[3] = &unk_1EA0FB7A8;
  v178[4] = v166;
  v178[5] = &v199;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](v166, "enumerateInputModesWithBlock:", v178);
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v80 = obj;
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v174, v209, 16);
  if (v81)
  {
    v82 = v81;
    v83 = 0;
    v84 = *(_QWORD *)v175;
    do
    {
      for (m = 0; m != v82; ++m)
      {
        if (*(_QWORD *)v175 != v84)
          objc_enumerationMutation(v80);
        std::string::basic_string[abi:nn180100]<0>(&v185, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v174 + 1) + 8 * m)), "UTF8String"));
        v86 = std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v200 + 6, (uint64_t)&v185, (uint64_t)&v185);
        v87 = v86;
        if ((unint64_t)v83 >= *(_QWORD *)&buf[16])
        {
          v91 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v83 - *(_QWORD *)buf) >> 3);
          v92 = v91 + 1;
          if ((unint64_t)(v91 + 1) > 0x492492492492492)
            goto LABEL_198;
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 3) > v92)
            v92 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 3)) >= 0x249249249249249)
            v93 = 0x492492492492492;
          else
            v93 = v92;
          if (v93)
            v93 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LanguageModelLexiconGroup>>(v93);
          else
            v94 = 0;
          v95 = (_QWORD *)(v93 + 56 * v91);
          *v95 = *((_QWORD *)v87 + 5);
          v96 = *((_QWORD *)v87 + 6);
          v95[1] = v96;
          if (v96)
          {
            v97 = (unint64_t *)(v96 + 8);
            do
              v98 = __ldxr(v97);
            while (__stxr(v98 + 1, v97));
          }
          v99 = v93 + 56 * v94;
          std::unordered_map<unsigned int,float>::unordered_map(v93 + 56 * v91 + 16, (uint64_t)(v87 + 56));
          v83 = v95 + 7;
          v100 = *(char **)&buf[8];
          v101 = *(char **)buf;
          if (*(_QWORD *)&buf[8] == *(_QWORD *)buf)
          {
            *(_QWORD *)buf = v95;
            *(_QWORD *)&buf[8] = v95 + 7;
            *(_QWORD *)&buf[16] = v99;
LABEL_134:
            if (!v100)
              goto LABEL_136;
LABEL_135:
            operator delete(v100);
            goto LABEL_136;
          }
          v102 = 0;
          do
          {
            v103 = &v95[v102 / 8];
            v104 = &v100[v102];
            *(_OWORD *)(v103 - 7) = *(_OWORD *)&v100[v102 - 56];
            *((_QWORD *)v104 - 7) = 0;
            *((_QWORD *)v104 - 6) = 0;
            v105 = *(_QWORD *)&v100[v102 - 40];
            *((_QWORD *)v104 - 5) = 0;
            *(v103 - 5) = v105;
            *(v103 - 4) = *(_QWORD *)&v100[v102 - 32];
            *((_QWORD *)v104 - 4) = 0;
            v106 = *(_QWORD *)&v100[v102 - 24];
            v95[v102 / 8 - 3] = v106;
            v107 = *(_QWORD *)&v100[v102 - 16];
            *(v103 - 2) = v107;
            *((_DWORD *)v103 - 2) = *(_DWORD *)&v100[v102 - 8];
            if (v107)
            {
              v108 = *(_QWORD *)(v106 + 8);
              v109 = *(v103 - 4);
              if ((v109 & (v109 - 1)) != 0)
              {
                if (v108 >= v109)
                  v108 %= v109;
              }
              else
              {
                v108 &= v109 - 1;
              }
              *(_QWORD *)(v105 + 8 * v108) = &v95[v102 / 8 - 3];
              *(_QWORD *)&v100[v102 - 24] = 0;
              *(_QWORD *)&v100[v102 - 16] = 0;
            }
            v102 -= 56;
          }
          while (&v100[v102] != v101);
          v110 = &v95[v102 / 8];
          v111 = *(char **)buf;
          v100 = *(char **)&buf[8];
          *(_QWORD *)buf = v110;
          *(_QWORD *)&buf[8] = v83;
          *(_QWORD *)&buf[16] = v99;
          if (v100 == v111)
            goto LABEL_134;
          do
          {
            v112 = (uint64_t)(v100 - 56);
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)(v100 - 40));
            v100 = (char *)std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100](v112);
          }
          while ((char *)v112 != v111);
          v100 = v111;
          if (v111)
            goto LABEL_135;
        }
        else
        {
          *v83 = *((_QWORD *)v86 + 5);
          v88 = *((_QWORD *)v86 + 6);
          v83[1] = v88;
          if (v88)
          {
            v89 = (unint64_t *)(v88 + 8);
            do
              v90 = __ldxr(v89);
            while (__stxr(v90 + 1, v89));
          }
          std::unordered_map<unsigned int,float>::unordered_map((uint64_t)(v83 + 2), (uint64_t)(v86 + 56));
          v83 += 7;
        }
LABEL_136:
        *(_QWORD *)&buf[8] = v83;
        if (SHIBYTE(v187) < 0)
          operator delete(v185);
      }
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v174, v209, 16);
    }
    while (v82);
  }

  v113 = (std::__shared_weak_count_vtbl *)operator new();
  KB::LanguageModelContainer::LanguageModelContainer((uint64_t)v113, (uint64_t)buf);
  v114 = (std::__shared_weak_count *)operator new();
  v114->__shared_owners_ = 0;
  v115 = (unint64_t *)&v114->__shared_owners_;
  v114->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA0FB828;
  v114->__shared_weak_owners_ = 0;
  v114[1].__vftable = v113;
  on_zero_shared = (std::__shared_weak_count *)v113->__on_zero_shared;
  if (on_zero_shared)
  {
    v77 = v158;
    v76 = v159;
    v117 = v166;
    if (on_zero_shared->__shared_owners_ != -1)
      goto LABEL_154;
    do
      v118 = __ldxr(v115);
    while (__stxr(v118 + 1, v115));
    p_shared_weak_owners = (unint64_t *)&v114->__shared_weak_owners_;
    do
      v120 = __ldxr(p_shared_weak_owners);
    while (__stxr(v120 + 1, p_shared_weak_owners));
    v113->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v113;
    v113->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v114;
    std::__shared_weak_count::__release_weak(on_zero_shared);
  }
  else
  {
    v77 = v158;
    v76 = v159;
    do
      v121 = __ldxr(v115);
    while (__stxr(v121 + 1, v115));
    v122 = (unint64_t *)&v114->__shared_weak_owners_;
    do
      v123 = __ldxr(v122);
    while (__stxr(v123 + 1, v122));
    v113->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v113;
    v113->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v114;
    v117 = v166;
  }
  do
    v124 = __ldaxr(v115);
  while (__stlxr(v124 - 1, v115));
  if (!v124)
  {
    ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
    std::__shared_weak_count::__release_weak(v114);
  }
LABEL_154:
  m_impl = v117->super.m_impl;
  do
    v126 = __ldxr(v115);
  while (__stxr(v126 + 1, v115));
  std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](m_impl + 29, (uint64_t)v113, (uint64_t)v114);
  do
    v127 = __ldaxr(v115);
  while (__stlxr(v127 - 1, v115));
  if (!v127)
  {
    ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
    std::__shared_weak_count::__release_weak(v114);
  }
  if ((*((unsigned int (**)(std::__shared_weak_count_vtbl *))v113->~__shared_weak_count + 4))(v113))
  {
    -[TIKeyboardInputManager config](v117, "config");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "isTesting");

    -[TIKeyboardInputManager config](v117, "config");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v130, "maxWordsPerPrediction");

    v132 = v117->super.m_impl;
    v133 = (unsigned int *)v132[28];
    v173 = v133;
    if (v133)
    {
      do
        v134 = __ldaxr(v133);
      while (__stlxr(v134 + 1, v133));
      v132 = v117->super.m_impl;
    }
    v135 = (std::__shared_weak_count *)v132[30];
    v172[0] = v132[29];
    v172[1] = (uint64_t)v135;
    if (v135)
    {
      v136 = (unint64_t *)&v135->__shared_owners_;
      do
        v137 = __ldxr(v136);
      while (__stxr(v137 + 1, v136));
    }
    KB::NgramCandidateRefinery::create(&v173, v172, v131, v129, (std::__shared_weak_count **)&v185);
    v139 = v185;
    v138 = (std::__shared_weak_count *)v186;
    v185 = 0;
    v186 = 0;
    if (v135)
    {
      v140 = (unint64_t *)&v135->__shared_owners_;
      do
        v141 = __ldaxr(v140);
      while (__stlxr(v141 - 1, v140));
      if (!v141)
      {
        ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
        std::__shared_weak_count::__release_weak(v135);
      }
    }
    if (v173)
      WTF::RefCounted<KB::DictionaryContainer>::deref(v173);
    v142 = (uint64_t)v117->super.m_impl;
    v170 = v139;
    v171 = v138;
    if (!v138)
    {
      v143 = 1;
      goto LABEL_183;
    }
  }
  else
  {
    v142 = (uint64_t)v117->super.m_impl;
    v144 = (std::__shared_weak_count *)operator new(0x28uLL);
    v138 = v144;
    v144->__shared_owners_ = 0;
    v144->__shared_weak_owners_ = 0;
    v144->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA1021C8;
    v144[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1EA106698;
    v145 = *(unsigned int **)(v142 + 224);
    v144[1].__shared_owners_ = (uint64_t)v145;
    if (v145)
    {
      do
        v146 = __ldaxr(v145);
      while (__stlxr(v146 + 1, v145));
      v142 = (uint64_t)v117->super.m_impl;
    }
    v170 = &v144[1].__vftable;
    v171 = v144;
  }
  v147 = (unint64_t *)&v138->__shared_owners_;
  do
    v148 = __ldxr(v147);
  while (__stxr(v148 + 1, v147));
  v143 = 0;
LABEL_183:
  TIInputManager::set_candidate_refinery(v142, (uint64_t *)&v170);
  v149 = v171;
  if (!v171)
    goto LABEL_187;
  v150 = (unint64_t *)&v171->__shared_owners_;
  do
    v151 = __ldaxr(v150);
  while (__stlxr(v151 - 1, v150));
  if (!v151)
  {
    ((void (*)(std::__shared_weak_count *))v149->__on_zero_shared)(v149);
    std::__shared_weak_count::__release_weak(v149);
    if ((v143 & 1) == 0)
      goto LABEL_188;
  }
  else
  {
LABEL_187:
    if ((v143 & 1) == 0)
    {
LABEL_188:
      v152 = (unint64_t *)&v138->__shared_owners_;
      do
        v153 = __ldaxr(v152);
      while (__stlxr(v153 - 1, v152));
      if (!v153)
      {
        ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
        std::__shared_weak_count::__release_weak(v138);
      }
      goto LABEL_193;
    }
  }
  do
LABEL_193:
    v154 = __ldaxr(v115);
  while (__stlxr(v154 - 1, v115));
  if (!v154)
  {
    ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
    std::__shared_weak_count::__release_weak(v114);
  }
  v185 = buf;
  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)&v185);
  v78 = 1;
LABEL_197:
  _Block_object_dispose(&v199, 8);
  std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::~__hash_table((uint64_t)&v204[8]);
  v199 = &v207;
  std::vector<std::shared_ptr<KB::LanguageModel>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v199);

  return v78;
}

- (void)languageModelContainer
{
  return (void *)*((_QWORD *)self->super.m_impl + 29);
}

- (id)resourceInputModes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__TIKeyboardInputManager_mul_resourceInputModes__block_invoke;
  v6[3] = &unk_1EA0FB628;
  v4 = v3;
  v7 = v4;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v6);

  return v4;
}

- (BOOL)shouldUpdateDictionary
{
  _BOOL4 v3;
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;
  _QWORD v8[7];
  objc_super v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned __int8 v13;

  if (!self->super.m_impl)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_mul;
  v13 = -[TIKeyboardInputManager shouldUpdateDictionary](&v9, sel_shouldUpdateDictionary);
  v3 = -[TIKeyboardInputManager usesFavonius](self, "usesFavonius");
  v4 = v11;
  if (v3 && !*((_BYTE *)v11 + 24))
  {
    v5 = *(_QWORD *)(*((_QWORD *)self->super.m_impl + 28) + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__TIKeyboardInputManager_mul_shouldUpdateDictionary__block_invoke;
    v8[3] = &unk_1EA0FB7D0;
    v8[4] = self;
    v8[5] = &v10;
    v8[6] = v5;
    -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v8);
    v4 = v11;
  }
  v6 = *((_BYTE *)v4 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)keyboardConfiguration
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_mul;
  -[TIKeyboardInputManager keyboardConfiguration](&v9, sel_keyboardConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__TIKeyboardInputManager_mul_keyboardConfiguration__block_invoke;
  v7[3] = &unk_1EA0FB628;
  v8 = v4;
  v5 = v4;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v7);
  objc_msgSend(v3, "setMultilingualLanguages:", v5);

  return v3;
}

- (void)resume
{
  objc_super v3;

  self->_isSuspended = 0;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_mul;
  -[TIKeyboardInputManager resume](&v3, sel_resume);
  if (!-[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
    -[TIKeyboardInputManager_mul updateLanguagePriors](self, "updateLanguagePriors");
}

- (void)clearInput
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_mul;
  -[TIKeyboardInputManager clearInput](&v3, sel_clearInput);
  self->_choseSecondaryPrev = 0;
  -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", 0);
  -[TIKeyboardInputManager_mul setIndexOfLastDynamicSwitch:](self, "setIndexOfLastDynamicSwitch:", -1);
}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_mul;
    -[TIKeyboardInputManager externalStringToInternal:](&v8, sel_externalStringToInternal_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (unsigned)lexiconIDForInputMode:(id)a3
{
  void *v3;
  id v4;
  unsigned int v5;

  objc_msgSend(a3, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v4, "UTF8String"));

  return v5;
}

- (BOOL)validEnglishTransformerMultilingualConfig
{
  int v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    return 0;
  if (isH13ANEPresentOnIOS())
    v3 = _os_feature_enabled_impl() ^ 1;
  else
    LOBYTE(v3) = 1;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "languageWithRegion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("hi_Latn")) & v3;

        if ((v13 & 1) == 0)
        {
          objc_msgSend(v11, "languageWithRegion");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("vi_VN"));

          if ((v15 & 1) == 0)
            continue;
        }
        v4 = 0;
        goto LABEL_18;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v4 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v4 = 1;
  }
LABEL_18:

  return v4;
}

- (void)suspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_mul;
  -[TIKeyboardInputManager suspend](&v3, sel_suspend);
  self->_isSuspended = 1;
}

- (BOOL)isUsingMultilingual
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (BOOL)shouldDynamicallySwitchBetweenPrimaryAndSecondary
{
  return 0;
}

- (BOOL)forceAutomaticMultiLanguageSwitch
{
  return 0;
}

- (TIKeyboardInputManager_mul)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManager_mul *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_mul;
  result = -[TIKeyboardInputManager initWithConfig:keyboardState:](&v5, sel_initWithConfig_keyboardState_, a3, a4);
  if (result)
  {
    result->_indexOfLastDynamicSwitch = -1;
    result->_choseSecondaryPrev = 0;
  }
  return result;
}

- (BOOL)isHighMemoryManager
{
  uint64_t v3;
  _QWORD *m_impl;

  if (-[TIKeyboardInputManager_mul isUsingMultilingual](self, "isUsingMultilingual"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    m_impl = self->super.m_impl;
    v3 = m_impl[29];
    if (v3)
    {
      LODWORD(v3) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
      if ((_DWORD)v3)
        LOBYTE(v3) = (*(uint64_t (**)(_QWORD))(*(_QWORD *)m_impl[29] + 136))(m_impl[29]) != 0;
    }
  }
  return v3;
}

- (id)lexiconLocaleOfString:(id)a3 inputMode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  KB *v9;
  unint64_t v10;
  void *v11;
  unsigned __int16 v13[2];
  __int16 v14;
  int v15;
  _BYTE v16[8];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (KB *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[TIKeyboardInputManager_mul lexiconIDForInputMode:](self, "lexiconIDForInputMode:", v6);
  KB::utf8_string(v9, (uint64_t)v16);
  KB::StaticDictionary::word_with_string(*(KB::StaticDictionary **)(*((_QWORD *)self->super.m_impl + 28) + 8), (const KB::String *)v16, (int)v7, (KB::Word *)v13);
  if ((v14 || (KB::String::compute_length(v13), v14)) && (v10 = TILocaleIdentifierForLexiconID(v15)) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  KB::Word::~Word((KB::Word *)v13);
  if (v17 && v16[6] == 1)
    free(v17);

  return v11;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 *m_impl;
  unint64_t v14;
  const KB::String *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unsigned __int16 *v36;
  unint64_t v37;
  const KB::String *v38;
  void *v39;
  unint64_t v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _BOOL4 choseSecondaryPrev;
  int64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSMutableString *v61;
  NSMutableString *v62;
  NSMutableString *m_composedText;
  NSMutableString *v64;
  NSMutableString *v65;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  NSMutableString *v72;
  void *v73;
  objc_super v74;
  _BYTE v75[6];
  char v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardInputManager setPregeneratedTypingAutocorrections:](self, "setPregeneratedTypingAutocorrections:", 0);
  v5 = -[NSMutableString length](self->super.m_composedText, "length");
  v74.receiver = self;
  v74.super_class = (Class)TIKeyboardInputManager_mul;
  -[TIKeyboardInputManager handleKeyboardInput:](&v74, sel_handleKeyboardInput_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autocorrectionEnabled");

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE388]);

  if (-[TIKeyboardInputManager_mul shouldDynamicallySwitchBetweenPrimaryAndSecondary](self, "shouldDynamicallySwitchBetweenPrimaryAndSecondary")&& (-[TIKeyboardInputManager_mul forceAutomaticMultiLanguageSwitch](self, "forceAutomaticMultiLanguageSwitch")|| (v8 & v10) != 0)&& -[NSMutableString length](self->super.m_composedText, "length"))
  {
    objc_msgSend(v4, "acceptedCandidate");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
LABEL_53:

      goto LABEL_54;
    }
    objc_msgSend(v4, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TIKeyboardInputManager stringEndsWord:](self, "stringEndsWord:", v12))
      goto LABEL_53;
    m_impl = (unsigned __int16 *)self->super.m_impl;
    v14 = *((unsigned int *)m_impl + 24);
    TIInputManager::input_substring(m_impl + 4, 0, -858993459 * ((*((_QWORD *)m_impl + 2) - *((_QWORD *)m_impl + 1)) >> 3), (uint64_t)v75);
    KB::ns_string((KB *)v75, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v77 && v76 == 1)
      free(v77);

    if (v17 <= v14)
    {
      -[TIKeyboardInputManager generateTypingAutocorrectionsWithCandidateRange:](self, "generateTypingAutocorrectionsWithCandidateRange:", 0, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "corrections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "autocorrection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "predictions");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isBackspace"))
      {
        if (v19)
        {
          objc_msgSend(v19, "candidate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", self->super.m_composedText);

          if ((v21 & 1) == 0)
          {
            objc_msgSend(v19, "lexiconLocale");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              -[TIKeyboardInputManager_mul candidateArray:withCandidateUniquelyInsertedToFront:](self, "candidateArray:withCandidateUniquelyInsertedToFront:", v73, v19);
              v23 = objc_claimAutoreleasedReturnValue();

              v73 = (void *)v23;
            }
            objc_msgSend(v19, "candidateByReplacingWithCandidate:", self->super.m_composedText);
            v24 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v24;
          }
        }
      }
      objc_msgSend(v12, "corrections");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "autocorrection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v19;
      if (v19 == v26)
      {
        objc_msgSend(v12, "predictions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73 == v27)
        {
LABEL_22:
          -[TIKeyboardInputManager setPregeneratedTypingAutocorrections:](self, "setPregeneratedTypingAutocorrections:", v12);
          v72 = self->super.m_composedText;
          v36 = (unsigned __int16 *)self->super.m_impl;
          v37 = *((int *)v36 + 24);
          TIInputManager::input_substring(v36 + 4, 0, -858993459 * ((*((_QWORD *)v36 + 2) - *((_QWORD *)v36 + 1)) >> 3), (uint64_t)v75);
          KB::ns_string((KB *)v75, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77 && v76 == 1)
            free(v77);
          v40 = objc_msgSend(v39, "length");
          v70 = v39;
          if ((objc_msgSend(v4, "isBackspace") & 1) != 0 || v40 > v37)
          {
            -[TIKeyboardInputManager internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", v39, 1);
            v41 = (id)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", objc_msgSend(v41, "isEqualToString:", self->super.m_composedText) ^ 1);
            -[TIKeyboardInputManager_mul setIndexOfLastDynamicSwitch:](self, "setIndexOfLastDynamicSwitch:", -1);
LABEL_36:

            -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "corrections");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "autocorrection");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v49;
            if (v49)
            {
              v51 = v49;
            }
            else
            {
              -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "predictions");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "firstObject");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v52;
              if (v52)
              {
                v54 = v52;
              }
              else
              {
                -[TIKeyboardInputManager_mul getPlainCandidate](self, "getPlainCandidate");
                v54 = (id)objc_claimAutoreleasedReturnValue();
              }
              v51 = v54;

            }
            -[TIKeyboardInputManager_mul getCurrentExternalStringGiven:](self, "getCurrentExternalStringGiven:", -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary") ^ 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager_mul handleAlternativeInput:givenCandidate:](self, "handleAlternativeInput:givenCandidate:", v55, v51);
            objc_msgSend(v51, "input");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "rangeOfString:options:", v55, 4);
            v69 = v58;

            LODWORD(v56) = self->_choseSecondaryPrev;
            if ((_DWORD)v56 != -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary")
              || (objc_msgSend(v51, "lexiconLocale"),
                  v59 = (void *)objc_claimAutoreleasedReturnValue(),
                  v59,
                  !v59)
              || v57 != 0x7FFFFFFFFFFFFFFFLL)
            {
              self->_choseSecondaryPrev = -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary");
              objc_msgSend(v51, "input");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v60, "length"))
              {
                objc_msgSend(v51, "input");
                v61 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v61 = v72;
              }
              v62 = v61;

              m_composedText = self->super.m_composedText;
              if (v57 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v64 = m_composedText;
              }
              else
              {
                -[NSMutableString stringByReplacingCharactersInRange:withString:](v62, "stringByReplacingCharactersInRange:withString:", v57, v69, m_composedText);
                v64 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
              }
              v65 = v64;
              -[TIKeyboardInputManager_mul updateAutocorrectionListGivenOutdatedInput:andUpdatedInput:](self, "updateAutocorrectionListGivenOutdatedInput:andUpdatedInput:", v62, v64);

            }
            goto LABEL_53;
          }
          -[TIKeyboardInputManager_mul chooseBetterInputMethod](self, "chooseBetterInputMethod");
          v41 = -[TIKeyboardInputManager newKeyboardContext](self, "newKeyboardContext");
          objc_msgSend(v41, "deleteBackward:", -[NSMutableString length](self->super.m_composedText, "length"));
          -[TIKeyboardInputManager updateComposedText](self, "updateComposedText");
          objc_msgSend(v41, "insertText:", self->super.m_composedText);
          objc_msgSend(v6, "shortcutConversion");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_opt_new();

          objc_msgSend(v43, "setShortcutConversion:", v42);
          objc_msgSend(v43, "deleteBackward:", v5);
          objc_msgSend(v43, "insertText:", self->super.m_composedText);
          v44 = *((unsigned int *)self->super.m_impl + 24);
          if (v44 >= 5)
          {
            choseSecondaryPrev = self->_choseSecondaryPrev;
            if (choseSecondaryPrev != -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
              goto LABEL_34;
            v46 = -[TIKeyboardInputManager_mul indexOfLastDynamicSwitch](self, "indexOfLastDynamicSwitch");
            if (v46 == -1 || v44 - v46 < 4)
              goto LABEL_35;
          }
          v44 = -1;
LABEL_34:
          -[TIKeyboardInputManager_mul setIndexOfLastDynamicSwitch:](self, "setIndexOfLastDynamicSwitch:", v44);
LABEL_35:

          v6 = v43;
          goto LABEL_36;
        }
      }
      else
      {

      }
      v28 = objc_alloc(MEMORY[0x1E0DBDB70]);
      objc_msgSend(v12, "corrections");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "alternateCorrections");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v28, "initWithAutocorrection:alternateCorrections:", v19, v30);

      v32 = (void *)MEMORY[0x1E0DBDB48];
      objc_msgSend(v12, "emojiList");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "proactiveTriggers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "listWithCorrections:predictions:emojiList:proactiveTriggers:", v31, v73, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v35;
      goto LABEL_22;
    }
  }
LABEL_54:

  return v6;
}

- (void)chooseBetterInputMethod
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TIKeyboardInputManager_mul *v13;
  _BOOL8 choseSecondaryPrev;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "corrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  -[TIKeyboardInputManager_mul getBetterLexiconLocale:](self, "getBetterLexiconLocale:", &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    choseSecondaryPrev = self->_choseSecondaryPrev;
    v13 = self;
    goto LABEL_5;
  }
  -[TIKeyboardInputManager primaryInputMode](self, "primaryInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "normalizedIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "caseInsensitiveCompare:", v11);

  if (v12)
  {
    v13 = self;
    choseSecondaryPrev = 1;
LABEL_5:
    -[TIKeyboardInputManager_mul setChoseSecondary:](v13, "setChoseSecondary:", choseSecondaryPrev);
    goto LABEL_10;
  }
  -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", 0);
  if (v18)
    v15 = v5;
  else
    v15 = v8;
  objc_msgSend(v15, "candidate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_mul internalStringToExternal:](self, "internalStringToExternal:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", objc_msgSend(v17, "compare:options:", v16, 129) != 0);

LABEL_10:
}

- (id)getBetterLexiconLocale:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "corrections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autocorrection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2425;
  v25 = __Block_byref_object_dispose__2426;
  v26 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
  }
  objc_msgSend(v7, "lexiconLocale");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v22[5];
  v22[5] = v11;

  if (!v22[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __53__TIKeyboardInputManager_mul_getBetterLexiconLocale___block_invoke;
      v18[3] = &unk_1EA0FB650;
      v20 = &v21;
      v18[4] = self;
      v19 = v7;
      -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v18);

    }
  }
  if (!v22[5]
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v10, "lexiconLocale");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v22[5];
    v22[5] = v14;

    v13 = 0;
  }
  else
  {
LABEL_7:
    v13 = 1;
  }
  *a3 = v13;
  v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

- (void)updateAutocorrectionListGivenOutdatedInput:(id)a3 andUpdatedInput:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(void *, void *, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void *, void *, uint64_t);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void (**v29)(void *, void *, uint64_t);
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  TIKeyboardInputManager_mul *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  void (**v46)(void *, void *, uint64_t);
  _QWORD v47[4];
  id v48;
  void (**v49)(void *, void *, uint64_t);
  _QWORD aBlock[4];
  id v51;

  v5 = a4;
  v41 = self;
  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "corrections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autocorrection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  v10 = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke;
  aBlock[3] = &unk_1EA0FB678;
  v11 = v5;
  v51 = v11;
  v12 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  v12[2](v12, v8, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "corrections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alternateCorrections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "corrections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "alternateCorrections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v10;
  v47[1] = 3221225472;
  v47[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_22;
  v47[3] = &unk_1EA0FB6A0;
  v19 = v12;
  v48 = v16;
  v49 = v19;
  v39 = v16;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v47);

  v20 = objc_alloc(MEMORY[0x1E0DBDB70]);
  v21 = (void *)objc_msgSend(v39, "copy");
  v22 = (void *)objc_msgSend(v20, "initWithAutocorrection:alternateCorrections:", v40, v21);

  v23 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "predictions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "predictions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_2;
  v44[3] = &unk_1EA0FB6A0;
  v45 = v25;
  v46 = v19;
  v28 = v25;
  v29 = v19;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v44);

  v30 = (void *)objc_msgSend(v28, "copy");
  v31 = (void *)MEMORY[0x1E0CB3880];
  v42[0] = v27;
  v42[1] = 3221225472;
  v42[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_3;
  v42[3] = &unk_1EA0FB6C8;
  v43 = v11;
  v32 = v11;
  objc_msgSend(v31, "predicateWithBlock:", v42);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "filteredArrayUsingPredicate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0DBDB48];
  objc_msgSend(v9, "emojiList");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "proactiveTriggers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "listWithCorrections:predictions:emojiList:proactiveTriggers:", v22, v34, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager setPregeneratedTypingAutocorrections:](v41, "setPregeneratedTypingAutocorrections:", v38);
}

- (id)getPlainCandidate
{
  const KB::String *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[8];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->super.m_impl + 2) - *((_QWORD *)self->super.m_impl + 1)) >> 3), (uint64_t)v10);
  KB::ns_string((KB *)v10, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v5 = v10[6] == 1;
  else
    v5 = 0;
  if (v5)
    free(v11);
  -[TIKeyboardInputManager_mul internalStringToExternal:](self, "internalStringToExternal:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager usesFavonius](self, "usesFavonius"))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBE8]), "initWithCandidate:forInput:rawInput:", v6, v6, v4);
  else
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC88]), "initWithSurface:input:mecabraCandidatePointerValue:", v6, v6, 0);
  v8 = v7;
  objc_msgSend(v7, "setLexiconLocale:", 0);

  return v8;
}

- (id)candidateArray:(id)a3 withCandidateUniquelyInsertedToFront:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__TIKeyboardInputManager_mul_candidateArray_withCandidateUniquelyInsertedToFront___block_invoke;
  v14[3] = &unk_1EA0FB6C8;
  v15 = v5;
  v7 = v5;
  v8 = a3;
  objc_msgSend(v6, "predicateWithBlock:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)emphasizesAlternativeInput
{
  return 1;
}

- (void)handleAlternativeInput:(id)a3 givenCandidate:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  if ((objc_msgSend(v27, "isEqualToString:", self->super.m_composedText) & 1) != 0)
    goto LABEL_15;
  v7 = -[TIKeyboardInputManager_mul stringIsRecognizedByAlternativeIM:](self, "stringIsRecognizedByAlternativeIM:", v27);
  if (-[TIKeyboardInputManager_mul emphasizesAlternativeInput](self, "emphasizesAlternativeInput"))
    v8 = -[TIKeyboardInputManager_mul indexOfLastDynamicSwitch](self, "indexOfLastDynamicSwitch") != -1 || v7;
  else
    v8 = 0;
  objc_msgSend(v6, "setShouldHintAtAlternativeInput:", v8);
  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidateByReplacingWithCandidate:", v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsAlternativeInput:", -[TIKeyboardInputManager_mul emphasizesAlternativeInput](self, "emphasizesAlternativeInput"));
  objc_msgSend(v9, "corrections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alternateCorrections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_mul candidateArray:withCandidateUniquelyInsertedToFront:](self, "candidateArray:withCandidateUniquelyInsertedToFront:", v12, v10);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0DBDB70]);
  objc_msgSend(v9, "corrections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "autocorrection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v13;
  v26 = (void *)objc_msgSend(v14, "initWithAutocorrection:alternateCorrections:", v16, v13);

  if (!-[TIKeyboardInputManager_mul shouldPassAlternativeInputAsPrediction:isRecognized:](self, "shouldPassAlternativeInputAsPrediction:isRecognized:", v27, v7))
  {
    v19 = (void *)MEMORY[0x1E0DBDB48];
    goto LABEL_11;
  }
  objc_msgSend(v9, "predictions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_mul candidateArray:withCandidateUniquelyInsertedToFront:](self, "candidateArray:withCandidateUniquelyInsertedToFront:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DBDB48];
  if (!v18)
  {
LABEL_11:
    objc_msgSend(v9, "predictions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v20 = 1;
    goto LABEL_12;
  }
  v20 = 0;
  v21 = v18;
LABEL_12:
  objc_msgSend(v9, "emojiList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "proactiveTriggers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "listWithCorrections:predictions:emojiList:proactiveTriggers:", v26, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  -[TIKeyboardInputManager setPregeneratedTypingAutocorrections:](self, "setPregeneratedTypingAutocorrections:", v24);

LABEL_15:
}

- (BOOL)shouldPassAlternativeInputAsPrediction:(id)a3 isRecognized:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", self->super.m_composedText);

  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "-[TIKeyboardInputManager_mul shouldPassAlternativeInputAsPrediction:isRecognized:]";
    v18 = 2080;
    v19 = "-[TIKeyboardInputManager_mul shouldPassAlternativeInputAsPrediction:isRecognized:]";
    _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  %s should not be entered if alternative input == composed text", (uint8_t *)&v16, 0x16u);
    if (a4)
      goto LABEL_6;
LABEL_4:
    if (-[TIKeyboardInputManager_mul emphasizesAlternativeInput](self, "emphasizesAlternativeInput"))
    {
      if (-858993459 * ((*((_QWORD *)self->super.m_impl + 2) - *((_QWORD *)self->super.m_impl + 1)) >> 3) < 6)
        goto LABEL_6;
      objc_msgSend(v7, "corrections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "autocorrection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lexiconLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else
      {
        objc_msgSend(v7, "predictions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", &__block_literal_global_2443);

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_6;
      }
    }
    v9 = 0;
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_4;
LABEL_6:
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)stringIsRecognizedByAlternativeIM:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager usesFavonius](self, "usesFavonius"))
  {
    -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager_mul lexiconLocaleOfString:inputMode:](self, "lexiconLocaleOfString:inputMode:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    objc_msgSend(v5, "predictions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__TIKeyboardInputManager_mul_stringIsRecognizedByAlternativeIM___block_invoke;
    v13[3] = &unk_1EA102730;
    v14 = v4;
    v10 = objc_msgSend(v11, "indexOfObjectPassingTest:", v13) != 0x7FFFFFFFFFFFFFFFLL;

    v8 = v14;
  }

  return v10;
}

- (unsigned)externalIndexToInternal:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if (!-[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_mul;
    LODWORD(v3) = -[TIKeyboardInputManager externalIndexToInternal:](&v6, sel_externalIndexToInternal_, v3);
  }
  return v3;
}

- (id)getCurrentExternalStringGiven:(BOOL)a3
{
  _BOOL8 v3;
  const KB::String *v5;
  void *v6;
  BOOL v7;
  _BOOL8 v8;
  void *v9;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->super.m_impl + 2) - *((_QWORD *)self->super.m_impl + 1)) >> 3), (uint64_t)v11);
  KB::ns_string((KB *)v11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v7 = v11[6] == 1;
  else
    v7 = 0;
  if (v7)
    free(v12);
  v8 = -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary");
  -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", v3);
  -[TIKeyboardInputManager_mul internalStringToExternal:](self, "internalStringToExternal:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", v8);

  return v9;
}

- (void)keyLayoutDidChangeTo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  TIKeyboardInputManager_mul *v9;

  v4 = a3;
  -[TIKeyboardInputManager_mul keyLayoutMap](self, "keyLayoutMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager_mul isUsingMultilingual](self, "isUsingMultilingual") && v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__TIKeyboardInputManager_mul_keyLayoutDidChangeTo___block_invoke;
    v6[3] = &unk_1EA0FB730;
    v7 = v5;
    v8 = v4;
    v9 = self;
    objc_msgSend(v8, "enumerateKeysUsingBlock:", v6);

  }
}

- (id)keyLayoutMap
{
  return 0;
}

- (float)weightForInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "priorProbabilityForInputMode:", v4);
    v8 = v7;
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (BOOL)usesRetrocorrection
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManager_mul;
  v3 = -[TIKeyboardInputManager usesRetrocorrection](&v17, sel_usesRetrocorrection);
  if (-[TIKeyboardInputManager_mul isUsingMultilingual](self, "isUsingMultilingual"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeInputModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "languageWithRegion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("vi_VN"));

          if ((v11 & 1) != 0)
          {
            v3 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v3;
}

- (vector<KB::LexiconInfo,)lexiconInformationVector
{
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  vector<KB::LexiconInfo, std::allocator<KB::LexiconInfo>> *result;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  __n128 (*v26)(__n128 *, __n128 *);
  void (*v27)(uint64_t);
  const char *v28;
  _QWORD v29[3];
  _QWORD v30[5];
  void **v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x4812000000;
  v26 = __Block_byref_object_copy__41;
  v27 = __Block_byref_object_dispose__42;
  v28 = "";
  memset(v29, 0, sizeof(v29));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__TIKeyboardInputManager_mul_lexiconInformationVector__block_invoke;
  v18[3] = &unk_1EA0FB758;
  v18[4] = self;
  v18[5] = &v23;
  v18[6] = &v19;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v18);
  if (*((_BYTE *)v20 + 24))
  {
    v5 = v24;
    -[TIKeyboardInputManager lexiconInfoForMultilingualDynamic](self, "lexiconInfoForMultilingualDynamic");
    v6 = v5[7];
    v7 = v5[8];
    if (v6 >= v7)
    {
      v9 = v5[6];
      v10 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v6 - v9) >> 4);
      if ((unint64_t)(v10 + 1) > 0x1745D1745D1745DLL)
        abort();
      v11 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v7 - v9) >> 4);
      v12 = 2 * v11;
      if (2 * v11 <= v10 + 1)
        v12 = v10 + 1;
      if (v11 >= 0xBA2E8BA2E8BA2ELL)
        v13 = 0x1745D1745D1745DLL;
      else
        v13 = v12;
      v30[4] = v5 + 8;
      if (v13)
        v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v13);
      else
        v14 = 0;
      v15 = v13 + 176 * v10;
      v30[0] = v13;
      v30[1] = v15;
      v30[3] = v13 + 176 * v14;
      std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v15, (uint64_t)&v31);
      v30[2] = v15 + 176;
      std::vector<KB::LexiconInfo>::__swap_out_circular_buffer(v5 + 6, v30);
      v8 = v5[7];
      std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)v30);
    }
    else
    {
      v8 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v6, (uint64_t)&v31) + 176;
    }
    v5[7] = v8;
    if (v40 && v39 == 1)
      free(v40);
    if (v38 && v37 == 1)
      free(v38);
    if (v36 && v35 == 1)
      free(v36);
    if (v34 && v33 == 1)
      free(v34);
    if (v32 && BYTE6(v31) == 1)
      free(v32);
  }
  v16 = v24;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(retstr, v16[6], v16[7], 0x2E8BA2E8BA2E8BA3 * ((v16[7] - v16[6]) >> 4));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  v31 = (void **)v29;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v31);
  return result;
}

- (id)listOfModelLocalesFromActiveInputModes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__TIKeyboardInputManager_mul_listOfModelLocalesFromActiveInputModes__block_invoke;
  v6[3] = &unk_1EA0FB628;
  v4 = v3;
  v7 = v4;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v6);

  return v4;
}

- (id)modelLocaleToInputModeMapping
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__TIKeyboardInputManager_mul_modelLocaleToInputModeMapping__block_invoke;
  v6[3] = &unk_1EA0FB628;
  v4 = v3;
  v7 = v4;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v6);

  return v4;
}

- (id)modelLoaderForModelLocaleMapping:(id)a3 customResourcePaths:(id)a4 dynamicResourcePath:(id)a5 usesLinguisticContext:(BOOL)a6 isMultiLingualModeEnabled:(BOOL)a7 validEnglishTransformerMultilingualConfig:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  TIKeyboardInputManager_mul *v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __193__TIKeyboardInputManager_mul_modelLoaderForModelLocaleMapping_customResourcePaths_dynamicResourcePath_usesLinguisticContext_isMultiLingualModeEnabled_validEnglishTransformerMultilingualConfig___block_invoke;
  v25[3] = &unk_1EA0FB780;
  v18 = v17;
  v26 = v18;
  v27 = v14;
  v28 = self;
  v29 = v15;
  v30 = v16;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v25);
  v22 = v30;
  v23 = v18;

  return v23;
}

- (BOOL)containsActiveLanguage:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "locale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "languageCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 |= objc_msgSend(v13, "hasPrefix:", v6);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (void)loadDictionaries
{
  NSObject *v3;
  TIInputManager *m_impl;
  void *v5;
  KB *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  KB::DictionaryContainer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint64_t v30[3];
  _BYTE buf[12];
  _OWORD v32[2];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->super.m_impl)
  {
    if (!-[TIKeyboardInputManager usesFavonius](self, "usesFavonius"))
    {
      v29.receiver = self;
      v29.super_class = (Class)TIKeyboardInputManager_mul;
      -[TIKeyboardInputManager loadDictionaries](&v29, sel_loadDictionaries);
      return;
    }
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading/reloading multilingual dictionaries."), "-[TIKeyboardInputManager_mul loadDictionaries]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32[0]) = 138412290;
        *(_QWORD *)((char *)v32 + 4) = v28;
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)v32, 0xCu);

      }
    }
    m_impl = (TIInputManager *)self->super.m_impl;
    -[TIKeyboardInputManager primaryInputMode](self, "primaryInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageWithRegion");
    v6 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v6, (uint64_t)v32);
    TIInputManager::set_locale_identifier(m_impl, (const KB::String *)v32);
    if (*((_QWORD *)&v32[0] + 1) && BYTE6(v32[0]) == 1)
      free(*((void **)&v32[0] + 1));

    -[TIKeyboardInputManager_mul lexiconInformationVector](self, "lexiconInformationVector");
    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isTesting");

    -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeInputModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 < 2)
    {
      v16 = 0;
    }
    else
    {
      -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeInputModes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[TIKeyboardInputManagerConfig configurationForInputMode:](TIKeyboardInputManagerConfig, "configurationForInputMode:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "usesContinuousPath");

    }
    v17 = self->super.m_impl;
    memset(v30, 0, sizeof(v30));
    std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(v30, *(uint64_t *)&v32[0], *((uint64_t *)&v32[0] + 1), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((_QWORD *)&v32[0] + 1) - *(_QWORD *)&v32[0]) >> 4));
    TIInputManager::load_dictionaries((uint64_t)v17, v30, 1, v8, v16);
    *(_QWORD *)buf = v30;
    std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
    v18 = *((_QWORD *)self->super.m_impl + 28);
    if (!v18 || **(_QWORD **)(v18 + 8) == *(_QWORD *)(*(_QWORD *)(v18 + 8) + 8))
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardInputManager primaryInputMode](self, "primaryInputMode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "languageWithRegion");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%s WARNING: Input manager failed to load static dictionary for: %@\n"), "-[TIKeyboardInputManager_mul loadDictionaries]", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v27;
        _os_log_debug_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    else
    {
      -[TIKeyboardInputManager loadFavoniusTypingModel](self, "loadFavoniusTypingModel");
    }
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "secureTextEntry") & 1) == 0)
    {
      v21 = TI_DEVICE_UNLOCKED_SINCE_BOOT();

      if (!v21)
        goto LABEL_30;
      v22 = self->super.m_impl;
      if (!v22)
        goto LABEL_30;
      v23 = (KB::DictionaryContainer *)*((_QWORD *)v22 + 28);
      if (!v23)
        goto LABEL_30;
      -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      KB::DictionaryContainer::load_dynamic_dict(v23, objc_msgSend(v20, "isSiriMode"));
    }

LABEL_30:
    *(_QWORD *)buf = v32;
    std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }
}

- (void)didUpdateInputModes:(id)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_mul;
  -[TIKeyboardInputManager didUpdateInputModes:](&v6, sel_didUpdateInputModes_, a3);
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel)
  {
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scheduling active input mode update."), "-[TIKeyboardInputManager_mul didUpdateInputModes:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  -[TIKeyboardInputManager scheduleLinguisticResourceUpdateWithReason:](self, "scheduleLinguisticResourceUpdateWithReason:", CFSTR("Multilingual input modes changed"));
}

- (void)didUpdateInputModeProbabilities:(id)a3
{
  if (!self->_isSuspended)
    -[TIKeyboardInputManager_mul updateLanguagePriors](self, "updateLanguagePriors", a3);
}

- (void)updateLanguagePriors
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[TIKeyboardInputManager usesFavonius](self, "usesFavonius")
    && !-[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Updating input mode probabilities."), "-[TIKeyboardInputManager_mul updateLanguagePriors]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v9 = v6;
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v4 = -[TIKeyboardInputManager_mul languageModelContainer](self, "languageModelContainer");
    if (v4)
    {
      v5 = *(_QWORD *)(*((_QWORD *)self->super.m_impl + 28) + 8);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__TIKeyboardInputManager_mul_updateLanguagePriors__block_invoke;
      v7[3] = &unk_1EA0FB7F8;
      v7[4] = self;
      v7[5] = v5;
      v7[6] = v4;
      -[TIKeyboardInputManager_mul enumerateInputModesWithBlock:](self, "enumerateInputModesWithBlock:", v7);
    }
  }
}

- (BOOL)choseSecondary
{
  return self->_choseSecondary;
}

- (void)setChoseSecondary:(BOOL)a3
{
  self->_choseSecondary = a3;
}

- (int64_t)indexOfLastDynamicSwitch
{
  return self->_indexOfLastDynamicSwitch;
}

- (void)setIndexOfLastDynamicSwitch:(int64_t)a3
{
  self->_indexOfLastDynamicSwitch = a3;
}

@end
