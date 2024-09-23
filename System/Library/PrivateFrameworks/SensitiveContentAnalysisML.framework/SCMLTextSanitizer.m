@implementation SCMLTextSanitizer

- (SCMLTextSanitizer)init
{
  SCMLTextSanitizerConfiguration *v3;
  SCMLTextSanitizer *v4;

  v3 = -[SCMLTextSanitizerConfiguration initWithModelManagerServicesUseCaseID:]([SCMLTextSanitizerConfiguration alloc], "initWithModelManagerServicesUseCaseID:", CFSTR("Safety.unspecified"));
  v4 = -[SCMLTextSanitizer initWithConfiguration:error:](self, "initWithConfiguration:error:", v3, 0);

  return v4;
}

- (SCMLTextSanitizer)initWithConfig:(id)a3 error:(id *)a4
{
  SCMLTextSanitizerConfiguration *v6;
  SCMLTextSanitizer *v7;

  v6 = (SCMLTextSanitizerConfiguration *)a3;
  if (!v6)
    v6 = -[SCMLTextSanitizerConfiguration initWithModelManagerServicesUseCaseID:]([SCMLTextSanitizerConfiguration alloc], "initWithModelManagerServicesUseCaseID:", CFSTR("Safety.unspecified"));
  v7 = -[SCMLTextSanitizer initWithConfiguration:error:](self, "initWithConfiguration:error:", v6, a4);

  return v7;
}

- (SCMLTextSanitizer)initWithConfiguration:(id)a3 error:(id *)a4
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFLocale *v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t v45;
  _QWORD *v46;
  uint64_t v47;
  CFStringTokenizerRef v48;
  NSObject *v49;
  NSObject *v50;
  os_signpost_id_t v51;
  _QWORD *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  os_signpost_id_t v71;
  _QWORD *v72;
  uint64_t v73;
  NSString *v74;
  scml::MultiwordGazetteer *v75;
  NSString *v76;
  scml::MultiwordGazetteer *v77;
  NSString *v78;
  scml::MultiwordGazetteer *v79;
  NSString *v80;
  scml::MultiwordGazetteer *v81;
  NSObject *v82;
  NSObject *v83;
  os_signpost_id_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  os_signpost_id_t v91;
  uint8_t *v92;
  uint64_t v93;
  __CFDictionary *Mutable;
  void *v95;
  const void *v96;
  NSObject *v97;
  NSObject *v98;
  os_signpost_id_t v99;
  uint8_t *v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  os_signpost_id_t v104;
  _QWORD *v105;
  uint64_t v106;
  _TtC26SensitiveContentAnalysisML26SCMLTextModerationLMFromMM *v107;
  int v108;
  void *v109;
  uint64_t v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  NSObject *v116;
  NSObject *v117;
  os_signpost_id_t v118;
  _QWORD *v119;
  uint64_t v120;
  _TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *v121;
  int v122;
  void *v123;
  _TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *v124;
  id v125;
  NSObject *v126;
  void *v128;
  uint8_t *v129;
  size_t v130;
  void *exception;
  scml *v132;
  std::runtime_error *v133;
  void *v134;
  scml *v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  SCMLTextSanitizer *v141;
  SCMLTextSanitizer *v142;
  id v143;
  id v144;
  uint64_t v145;
  objc_super v146;
  void *__p[2];
  char v148;
  const char *v149;
  CFErrorRef err;
  __CFDictionary *v151;
  _QWORD v152[3];
  _QWORD *v153;
  _QWORD v154[3];
  _QWORD *v155;
  _QWORD v156[3];
  _QWORD *v157;
  id v158;
  os_signpost_id_t v159;
  uint64_t v160[4];
  _QWORD v161[3];
  _QWORD *v162;
  id v163;
  os_signpost_id_t v164;
  uint64_t v165[4];
  uint8_t v166[24];
  uint8_t *v167;
  _QWORD v168[3];
  _QWORD *v169;
  _QWORD v170[3];
  _QWORD *v171;
  _QWORD v172[3];
  _QWORD *v173;
  uint8_t v174[8];
  os_signpost_id_t v175;
  _QWORD v176[4];
  uint8_t v177[8];
  _BYTE *v178;
  uint8_t *v179;
  _BYTE buf[22];
  __int16 v181;
  int v182;
  __int16 v183;
  int v184;
  __int16 v185;
  void *v186;
  uint64_t v187;
  CFRange v188;

  v187 = *MEMORY[0x24BDAC8D0];
  v139 = a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v163);
  v4 = v163;
  v5 = v4;
  v6 = v164;
  if (v164 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SCMLTextSanitizer.init", ", buf, 2u);
  }

  v161[0] = &off_2516E3830;
  v161[1] = &v163;
  v162 = v161;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v165, (uint64_t)v161);
  v7 = v162;
  if (v162 == v161)
  {
    v8 = 4;
    v7 = v161;
  }
  else
  {
    if (!v162)
      goto LABEL_9;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_9:
  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v139, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v139, "mode");
    v13 = objc_msgSend(v139, "backends");
    objc_msgSend(v139, "modelManagerServicesUseCaseID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219011;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    v181 = 1024;
    v182 = v12;
    v183 = 1024;
    v184 = v13;
    v185 = 2113;
    v186 = v14;
    _os_log_impl(&dword_245BFA000, v9, OS_LOG_TYPE_DEFAULT, "Begin SCMLTextSanitizer init inst=%p loc=%@ mode=%d backends=0x%x useCase=%{private}@", buf, 0x2Cu);

  }
  v146.receiver = self;
  v146.super_class = (Class)SCMLTextSanitizer;
  v141 = -[SCMLTextSanitizer init](&v146, sel_init);

  if (v141)
  {
    objc_msgSend(v139, "locale");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v141 + 9);
    *((_QWORD *)v141 + 9) = v15;

    *((_DWORD *)v141 + 20) = objc_msgSend(v139, "mode");
    *((_DWORD *)v141 + 21) = objc_msgSend(v139, "granularity");
    v17 = objc_msgSend(v139, "mode");
    v18 = objc_msgSend(v139, "backends");
    if (v17 != 3)
    {
      if (v17 == 2)
      {
        v19 = _os_feature_enabled_impl();
        +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
        if (v19)
        {
          if (v21)
            -[SCMLTextSanitizer initWithConfiguration:error:].cold.2(v20, v22, v23, v24, v25, v26, v27, v28);

          v18 = 37;
        }
        else
        {
          if (v21)
            -[SCMLTextSanitizer initWithConfiguration:error:].cold.3(v20, v22, v23, v24, v25, v26, v27, v28);

          v18 = 35;
        }
      }
      else
      {
        v18 = 3;
      }
    }
    *((_QWORD *)v141 + 11) = v18;
    v29 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    v30 = (void *)*((_QWORD *)v141 + 15);
    *((_QWORD *)v141 + 15) = v29;

    *((_BYTE *)v141 + 96) = objc_msgSend(v139, "throwInModerationLMAsyncHandler");
    *((_BYTE *)v141 + 97) = objc_msgSend(v139, "throwInAdapterAsyncHandler");
    v31 = (void *)*((_QWORD *)v141 + 9);
    if (!v31
      || (objc_msgSend(v31, "languageCode"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v32, "lowercaseString"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("en")),
          v33,
          v32,
          (v34 & 1) == 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      objc_msgSend(*((id *)v141 + 9), "localeIdentifier");
      v132 = (scml *)objc_claimAutoreleasedReturnValue();
      scml::strFromNSString(v132, v174);
      scml::strCat<char const(&)[38],std::string>("Unsupported locale: ", (uint64_t)v174, buf);
      MEMORY[0x249544C64](exception, buf);
      __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v158);
    v35 = v158;
    v36 = v35;
    v37 = v159;
    if (v159 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_245BFA000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "SCMLTextSanitizer.init.rules", ", buf, 2u);
    }

    v156[0] = &off_2516E3888;
    v156[1] = &v158;
    v157 = v156;
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v160, (uint64_t)v156);
    v38 = v157;
    if (v157 == v156)
    {
      v39 = 4;
      v38 = v156;
    }
    else
    {
      if (!v157)
      {
LABEL_32:
        v40 = operator new();
        v41 = *((_QWORD *)v141 + 11);
        v42 = (const __CFLocale *)*((id *)v141 + 9);
        *(_OWORD *)(v40 + 16) = 0u;
        *(_OWORD *)(v40 + 32) = 0u;
        *(_OWORD *)v40 = 0u;
        *(_OWORD *)(v40 + 48) = 0u;
        *(_QWORD *)(v40 + 64) = 0;
        *(_QWORD *)(v40 + 72) = v41;
        scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v174);
        v43 = *(id *)v174;
        v44 = v43;
        v45 = v175;
        if (v175 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_245BFA000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v45, "SCMLTextSanitizer.init.rules.tokenizer", ", buf, 2u);
        }

        v172[0] = &off_2516E3EB8;
        v172[1] = v174;
        v173 = v172;
        std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v176, (uint64_t)v172);
        v46 = v173;
        if (v173 == v172)
        {
          v47 = 4;
          v46 = v172;
        }
        else
        {
          if (!v173)
            goto LABEL_40;
          v47 = 5;
        }
        (*(void (**)(void))(*v46 + 8 * v47))();
LABEL_40:
        v188.location = 0;
        v188.length = 0;
        v48 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v188, 0, v42);
        nlp::CFScopedPtr<__CFStringTokenizer *>::reset((const void **)v40, v48);
        if (!*(_QWORD *)v40)
        {
          v133 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v133, "failed to init tokenizer");
          __cxa_throw(v133, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
        }
        v49 = *(id *)v174;
        v50 = v49;
        v51 = v175;
        if (v175 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_245BFA000, v50, OS_SIGNPOST_INTERVAL_END, v51, "SCMLTextSanitizer.init.rules.tokenizer", ", buf, 2u);
        }

        v170[0] = &off_2516E3D58;
        v171 = v170;
        std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v176, (uint64_t)v170);
        v52 = v171;
        if (v171 == v170)
        {
          v53 = 4;
          v52 = v170;
        }
        else
        {
          if (!v171)
          {
LABEL_49:
            scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
            v54 = *(id *)buf;
            v55 = v54;
            v56 = *(_QWORD *)&buf[8];
            if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
            {
              *(_WORD *)v177 = 0;
              _os_signpost_emit_with_name_impl(&dword_245BFA000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v56, "SCMLTextSanitizer.init.rules.full_allow", ", v177, 2u);
            }

            *(_QWORD *)v177 = &off_2516E4228;
            v178 = buf;
            v179 = v177;
            std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v177);
            v57 = v179;
            if (v179 == v177)
            {
              v58 = 4;
              v57 = v177;
            }
            else
            {
              if (!v179)
              {
LABEL_57:
                v59 = objc_claimAutoreleasedReturnValue();
                scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
                v60 = *(void **)(v40 + 56);
                *(_QWORD *)(v40 + 56) = v59;

                scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
                v61 = *(id *)buf;
                v62 = v61;
                v63 = *(_QWORD *)&buf[8];
                if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
                {
                  *(_WORD *)v177 = 0;
                  _os_signpost_emit_with_name_impl(&dword_245BFA000, v62, OS_SIGNPOST_INTERVAL_BEGIN, v63, "SCMLTextSanitizer.init.rules.full_disallow", ", v177, 2u);
                }

                *(_QWORD *)v177 = &off_2516E4280;
                v178 = buf;
                v179 = v177;
                std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v177);
                v64 = v179;
                if (v179 == v177)
                {
                  v65 = 4;
                  v64 = v177;
                }
                else
                {
                  if (!v179)
                    goto LABEL_65;
                  v65 = 5;
                }
                (*(void (**)(void))(*(_QWORD *)v64 + 8 * v65))();
LABEL_65:
                v66 = objc_claimAutoreleasedReturnValue();
                scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
                v67 = *(void **)(v40 + 64);
                *(_QWORD *)(v40 + 64) = v66;

                v68 = *(_QWORD *)(v40 + 72);
                if ((v68 & 0x20) == 0)
                  goto LABEL_75;
                scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
                v69 = *(id *)buf;
                v70 = v69;
                v71 = *(_QWORD *)&buf[8];
                if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
                {
                  *(_WORD *)v177 = 0;
                  _os_signpost_emit_with_name_impl(&dword_245BFA000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v71, "SCMLTextSanitizer.init.rules.visual_generation_blocklist", ", v177, 2u);
                }

                v168[0] = &off_2516E3DB0;
                v168[1] = buf;
                v169 = v168;
                std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v168);
                v72 = v169;
                if (v169 == v168)
                {
                  v73 = 4;
                  v72 = v168;
                }
                else
                {
                  if (!v169)
                  {
LABEL_74:
                    v74 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v75 = (scml::MultiwordGazetteer *)operator new();
                    scml::MultiwordGazetteer::MultiwordGazetteer(v75, (NSLocale *)v42, v74, 5uLL);
                    std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)(v40 + 16), v75);

                    v76 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v77 = (scml::MultiwordGazetteer *)operator new();
                    scml::MultiwordGazetteer::MultiwordGazetteer(v77, (NSLocale *)v42, v76, 5uLL);
                    std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)(v40 + 24), v77);

                    v78 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v79 = (scml::MultiwordGazetteer *)operator new();
                    scml::MultiwordGazetteer::MultiwordGazetteer(v79, (NSLocale *)v42, v78, 5uLL);
                    std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)(v40 + 32), v79);

                    v80 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v81 = (scml::MultiwordGazetteer *)operator new();
                    scml::MultiwordGazetteer::MultiwordGazetteer(v81, (NSLocale *)v42, v80, 5uLL);
                    std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)(v40 + 40), v81);

                    scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
                    v68 = *(_QWORD *)(v40 + 72);
LABEL_75:
                    if ((v68 & 1) == 0)
                      goto LABEL_104;
                    scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
                    v82 = *(id *)buf;
                    v83 = v82;
                    v84 = *(_QWORD *)&buf[8];
                    if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                      && os_signpost_enabled(v82))
                    {
                      *(_WORD *)v177 = 0;
                      _os_signpost_emit_with_name_impl(&dword_245BFA000, v83, OS_SIGNPOST_INTERVAL_BEGIN, v84, "SCMLTextSanitizer.init.rules.ovs_overrides", ", v177, 2u);
                    }

                    *(_QWORD *)v177 = &off_2516E42D8;
                    v178 = buf;
                    v179 = v177;
                    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v177);
                    v85 = v179;
                    if (v179 == v177)
                    {
                      v86 = 4;
                      v85 = v177;
                    }
                    else
                    {
                      if (!v179)
                      {
LABEL_84:
                        v87 = objc_claimAutoreleasedReturnValue();
                        scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
                        v88 = *(void **)(v40 + 48);
                        *(_QWORD *)(v40 + 48) = v87;

                        scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
                        v89 = *(id *)buf;
                        v90 = v89;
                        v91 = *(_QWORD *)&buf[8];
                        if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                          && os_signpost_enabled(v89))
                        {
                          *(_WORD *)v177 = 0;
                          _os_signpost_emit_with_name_impl(&dword_245BFA000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v91, "SCMLTextSanitizer.init.rules.lexicon", ", v177, 2u);
                        }

                        *(_QWORD *)v177 = &off_2516E3E08;
                        v178 = buf;
                        v179 = v177;
                        std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v177);
                        v92 = v179;
                        if (v179 == v177)
                        {
                          v93 = 4;
                          v92 = v177;
                        }
                        else
                        {
                          if (!v179)
                            goto LABEL_92;
                          v93 = 5;
                        }
                        (*(void (**)(void))(*(_QWORD *)v92 + 8 * v93))();
LABEL_92:
                        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                        v151 = Mutable;
                        -[__CFLocale localeIdentifier](v42, "localeIdentifier");
                        v95 = (void *)objc_claimAutoreleasedReturnValue();
                        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE5F198], v95);

                        err = 0;
                        v96 = (const void *)LXLexiconCreate();
                        nlp::CFScopedPtr<_LXLexicon const*>::reset((const void **)(v40 + 8), v96);
                        if (!*(_QWORD *)(v40 + 8))
                        {
                          v134 = err;
                          if (err)
                            v134 = (void *)CFErrorCopyDescription(err);
                          v135 = v134;
                          -[__CFLocale localeIdentifier](v42, "localeIdentifier");
                          v136 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                          v149 = (const char *)objc_msgSend(v136, "UTF8String");
                          scml::strFromNSString(v135, __p);
                          scml::strCat<char const(&)[37],char const*,char const(&)[3],std::string>("Failed to create lexicon for locale ", &v149, ": ", (uint64_t)__p, v166);
                          if (v148 < 0)
                            operator delete(__p[0]);

                          v137 = __cxa_allocate_exception(0x10uLL);
                          MEMORY[0x249544C64](v137, v166);
                          __cxa_throw(v137, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
                        }
                        v97 = *(id *)buf;
                        v98 = v97;
                        v99 = *(_QWORD *)&buf[8];
                        if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                          && os_signpost_enabled(v97))
                        {
                          *(_WORD *)v166 = 0;
                          _os_signpost_emit_with_name_impl(&dword_245BFA000, v98, OS_SIGNPOST_INTERVAL_END, v99, "SCMLTextSanitizer.init.rules.lexicon", ", v166, 2u);
                        }

                        *(_QWORD *)v166 = &off_2516E3E60;
                        v167 = v166;
                        std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v166);
                        v100 = v167;
                        if (v167 == v166)
                        {
                          v101 = 4;
                          v100 = v166;
                        }
                        else
                        {
                          if (!v167)
                          {
LABEL_101:
                            if (Mutable)
                              CFRelease(Mutable);
                            scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
LABEL_104:
                            scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v174);

                            v145 = 0;
                            scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v158);
                            if ((*((_BYTE *)v141 + 88) & 2) == 0)
                            {
LABEL_115:
                              v113 = 0;
                              while (1)
                              {
                                v158 = (id)v114;
                                if ((*((_QWORD *)v141 + 11) & v114) != 0)
                                  break;
LABEL_127:
                                if (++v113 == 2)
                                  goto LABEL_128;
                              }
                              v115 = objc_msgSend(v139, "mode");
                              scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
                              v116 = *(id *)buf;
                              v117 = v116;
                              v118 = *(_QWORD *)&buf[8];
                              if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                                && os_signpost_enabled(v116))
                              {
                                *(_WORD *)v174 = 0;
                                _os_signpost_emit_with_name_impl(&dword_245BFA000, v117, OS_SIGNPOST_INTERVAL_BEGIN, v118, "SCMLTextSanitizer.init.llm_backend", ", v174, 2u);
                              }

                              v152[0] = &off_2516E3938;
                              v152[1] = buf;
                              v153 = v152;
                              std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v152);
                              v119 = v153;
                              if (v153 == v152)
                              {
                                v119 = v152;
                                v120 = 4;
                              }
                              else
                              {
                                if (!v153)
                                {
LABEL_125:
                                  v121 = [_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail alloc];
                                  v122 = objc_msgSend(v139, "onBehalfOfProcessID");
                                  objc_msgSend(v139, "modelManagerServicesUseCaseID");
                                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                                  v143 = 0;
                                  v124 = -[SCMLSafetyGuardrail initWithBackend:onBehalfOf:modelManagerServicesUseCaseID:lowerCasePrompt:error:](v121, "initWithBackend:onBehalfOf:modelManagerServicesUseCaseID:lowerCasePrompt:error:", v114, v122, v123, (v115 - 1) < 2, &v143);
                                  v125 = v143;

                                  if (!v124)
                                  {
                                    v128 = __cxa_allocate_exception(0x10uLL);
                                    scml::strCat<char const(&)[32],MADUnifiedEmbeddingVersion &>("Failed to init LLM backend ", v174);
                                    if (v176[0] >= 0)
                                      v129 = v174;
                                    else
                                      v129 = *(uint8_t **)v174;
                                    if (v176[0] >= 0)
                                      v130 = HIBYTE(v176[0]);
                                    else
                                      v130 = v175;
                                    scml::makeException(v129, v130, v125, (uint64_t)v128);
                                    __cxa_throw(v128, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
                                  }
                                  objc_msgSend(*((id *)v141 + 15), "addObject:", v124);

                                  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
                                  goto LABEL_127;
                                }
                                v120 = 5;
                              }
                              (*(void (**)(void))(*v119 + 8 * v120))();
                              goto LABEL_125;
                            }
                            scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
                            v102 = *(id *)buf;
                            v103 = v102;
                            v104 = *(_QWORD *)&buf[8];
                            if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                              && os_signpost_enabled(v102))
                            {
                              *(_WORD *)v174 = 0;
                              _os_signpost_emit_with_name_impl(&dword_245BFA000, v103, OS_SIGNPOST_INTERVAL_BEGIN, v104, "SCMLTextSanitizer.init.moderation_lm", ", v174, 2u);
                            }

                            v154[0] = &off_2516E38E0;
                            v154[1] = buf;
                            v155 = v154;
                            std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v154);
                            v105 = v155;
                            if (v155 == v154)
                            {
                              v106 = 4;
                              v105 = v154;
                            }
                            else
                            {
                              if (!v155)
                              {
LABEL_113:
                                v107 = [_TtC26SensitiveContentAnalysisML26SCMLTextModerationLMFromMM alloc];
                                v108 = objc_msgSend(v139, "onBehalfOfProcessID");
                                objc_msgSend(v139, "modelManagerServicesUseCaseID");
                                v109 = (void *)objc_claimAutoreleasedReturnValue();
                                v144 = 0;
                                v110 = -[SCMLTextModerationLMFromMM initOnBehalfOf:modelManagerServicesUseCaseID:error:](v107, "initOnBehalfOf:modelManagerServicesUseCaseID:error:", v108, v109, &v144);
                                v111 = v144;
                                v112 = (void *)*((_QWORD *)v141 + 14);
                                *((_QWORD *)v141 + 14) = v110;

                                if (!*((_QWORD *)v141 + 14))
                                {
                                  v138 = __cxa_allocate_exception(0x10uLL);
                                  scml::makeException("Failed to init safety guardrail lm", 0x22uLL, v111, (uint64_t)v138);
                                  __cxa_throw(v138, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
                                }

                                scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
                                goto LABEL_115;
                              }
                              v106 = 5;
                            }
                            (*(void (**)(void))(*v105 + 8 * v106))();
                            goto LABEL_113;
                          }
                          v101 = 5;
                        }
                        (*(void (**)(void))(*(_QWORD *)v100 + 8 * v101))();
                        goto LABEL_101;
                      }
                      v86 = 5;
                    }
                    (*(void (**)(void))(*(_QWORD *)v85 + 8 * v86))();
                    goto LABEL_84;
                  }
                  v73 = 5;
                }
                (*(void (**)(void))(*v72 + 8 * v73))();
                goto LABEL_74;
              }
              v58 = 5;
            }
            (*(void (**)(void))(*(_QWORD *)v57 + 8 * v58))();
            goto LABEL_57;
          }
          v53 = 5;
        }
        (*(void (**)(void))(*v52 + 8 * v53))();
        goto LABEL_49;
      }
      v39 = 5;
    }
    (*(void (**)(void))(*v38 + 8 * v39))();
    goto LABEL_32;
  }
LABEL_128:
  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v126 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245BFA000, v126, OS_LOG_TYPE_DEFAULT, "End SCMLTextSanitizer init", buf, 2u);
  }

  v142 = v141;
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v163);

  return v142;
}

- (void)sanitizeTextAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v6;
  SCMLTextSanitizerRequest *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SCMLTextSanitizerRequest);
  -[SCMLTextSanitizerRequest setText:](v7, "setText:", v8);
  -[SCMLTextSanitizer sanitizeRequestAsynchronously:completionHandler:](self, "sanitizeRequestAsynchronously:completionHandler:", v7, v6);

}

- (void)doModeration:(id)a3 withResponder:(void *)a4
{
  id v6;
  NSObject *v7;
  scml::SignpostInterval *v8;
  scml::SignpostInterval *Async;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  _QWORD v14[7];
  uint8_t buf[16];

  v6 = a3;
  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245BFA000, v7, OS_LOG_TYPE_DEFAULT, "Begin TextModerationLM request", buf, 2u);
  }

  Async = scml::SignpostInterval::createAsync(v8);
  v10 = *(id *)Async;
  v11 = v10;
  v12 = *((_QWORD *)Async + 1);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SCMLTextSanitizer.sanitizeText.moderation_lm", ", buf, 2u);
  }

  v13 = (void *)*((_QWORD *)self + 14);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__SCMLTextSanitizer_doModeration_withResponder___block_invoke;
  v14[3] = &unk_2516E4B90;
  v14[5] = a4;
  v14[6] = Async;
  v14[4] = self;
  objc_msgSend(v13, "predictWithText:completionHandler:", v6, v14);

}

void __48__SCMLTextSanitizer_doModeration_withResponder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  scml::SignpostInterval *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  std::runtime_error *exception;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  _QWORD v39[3];
  _QWORD *v40;
  _QWORD v41[3];
  _QWORD *v42;
  _BYTE v43[32];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v31 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v41[0] = &off_2516E4018;
  v41[1] = v6;
  v42 = v41;
  scml::Deferred::Deferred(v43, v41);
  v7 = v42;
  if (v42 == v41)
  {
    v8 = 4;
    v7 = v41;
    goto LABEL_5;
  }
  if (v42)
  {
    v8 = 5;
LABEL_5:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  v9 = **(id **)(a1 + 48);
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SCMLTextSanitizer.sanitizeText.moderation_lm", ", buf, 2u);
  }

  v12 = *(_QWORD *)(a1 + 48);
  v39[0] = &off_2516E4070;
  v40 = v39;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((_QWORD *)(v12 + 16), (uint64_t)v39);
  v13 = v40;
  if (v40 == v39)
  {
    v14 = 4;
    v13 = v39;
  }
  else
  {
    if (!v40)
      goto LABEL_14;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_14:
  v15 = *(scml::SignpostInterval **)(a1 + 48);
  if (v15)
  {
    scml::SignpostInterval::~SignpostInterval(v15);
    MEMORY[0x249544F58]();
  }
  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245BFA000, v16, OS_LOG_TYPE_DEFAULT, "End TextModerationLM request", buf, 2u);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Forced failure");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (v5)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v5, "predictions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v20, "nameP1");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("npefsbujpo_mn"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
          v25 = objc_msgSend(v20, "safe");
          objc_msgSend(v20, "probability");
          v26 = (id)objc_msgSend(v24, "updateSignal:withSafe:withScore:", v23, v25);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v17);
    }
    v27 = obj;
  }
  else
  {
    v28 = *(_QWORD *)(a1 + 40);
    scml::error(0xFu, (uint64_t)"Failed to query TextModerationLM", 32, v31);
    v29 = objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(v28 + 24);
    *(_QWORD *)(v28 + 24) = v29;
  }

  scml::Deferred::~Deferred((scml::Deferred *)v43);
}

- (void)doLLMBackend:(id)a3 withText:(id)a4 withResponder:(void *)a5
{
  id v8;
  id v9;
  scml *v10;
  NSObject *v11;
  std::string *v12;
  scml::SignpostInterval *v13;
  scml::SignpostInterval *Async;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  void *v18;
  _QWORD v19[7];
  std::string __p;
  std::string v21;
  _BYTE buf[12];
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "bundleID");
  v10 = (scml *)objc_claimAutoreleasedReturnValue();
  scml::strFromNSString(v10, buf);
  scml::strCat<char const(&)[38],std::string>("model manager query for model ", (uint64_t)buf, &v21);
  if (v23 < 0)
    operator delete(*(void **)buf);

  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = &v21;
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v12 = (std::string *)v21.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_245BFA000, v11, OS_LOG_TYPE_DEFAULT, "Begin %s", buf, 0xCu);
  }

  Async = scml::SignpostInterval::createAsync(v13);
  v15 = *(id *)Async;
  v16 = v15;
  v17 = *((_QWORD *)Async + 1);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    objc_msgSend(v8, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v18;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SCMLTextSanitizer.sanitizeText.llm_backend", "model=%@", buf, 0xCu);

  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3321888768;
  v19[2] = __57__SCMLTextSanitizer_doLLMBackend_withText_withResponder___block_invoke;
  v19[3] = &unk_2516E4548;
  v19[5] = a5;
  v19[6] = Async;
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v21.__r_.__value_.__l.__data_, v21.__r_.__value_.__l.__size_);
  else
    __p = v21;
  v19[4] = self;
  objc_msgSend(v8, "predictWithText:completionHandler:", v9, v19);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);

}

void __57__SCMLTextSanitizer_doLLMBackend_withText_withResponder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  scml::SignpostInterval *v16;
  NSObject *v17;
  _QWORD *v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  __int128 *p_p;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  std::runtime_error *exception;
  __int128 __p;
  unsigned __int8 v35;
  _QWORD v36[3];
  _QWORD *v37;
  _QWORD v38[3];
  _QWORD *v39;
  _BYTE v40[32];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  v38[0] = &off_2516E40C8;
  v38[1] = v7;
  v39 = v38;
  scml::Deferred::Deferred(v40, v38);
  v8 = v39;
  if (v39 == v38)
  {
    v9 = 4;
    v8 = v38;
    goto LABEL_5;
  }
  if (v39)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
  v10 = **(id **)(a1 + 48);
  v11 = v10;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(__p) = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SCMLTextSanitizer.sanitizeText.llm_backend", ", (uint8_t *)&__p, 2u);
  }

  v13 = *(_QWORD *)(a1 + 48);
  v36[0] = &off_2516E4120;
  v37 = v36;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((_QWORD *)(v13 + 16), (uint64_t)v36);
  v14 = v37;
  if (v37 == v36)
  {
    v15 = 4;
    v14 = v36;
  }
  else
  {
    if (!v37)
      goto LABEL_14;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_14:
  v16 = *(scml::SignpostInterval **)(a1 + 48);
  if (v16)
  {
    scml::SignpostInterval::~SignpostInterval(v16);
    MEMORY[0x249544F58]();
  }
  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (_QWORD *)(a1 + 56);
    if (*(char *)(a1 + 79) < 0)
      v18 = (_QWORD *)*v18;
    LODWORD(__p) = 136315138;
    *(_QWORD *)((char *)&__p + 4) = v18;
    _os_log_impl(&dword_245BFA000, v17, OS_LOG_TYPE_DEFAULT, "End %s", (uint8_t *)&__p, 0xCu);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 97))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Forced failure");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (v5)
  {
    v19 = objc_msgSend(v5, "safe");
    if ((v19 & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v5, "labels");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count") == 0;

      if (v27)
      {
        v20 = &stru_2516E5A08;
      }
      else
      {
        +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "labels");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "encodeToP1:", v30);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    v31 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "updateSignal:withSafe:withLabel:", kSCMLTextSanitizationSignalSafetyAdapter[0], v19, v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setViolationCategory:", v20);
    if (v20)
      v32 = +[SCMLTextSanitizer violationCategoryForAdapterLabel:](SCMLTextSanitizer, "violationCategoryForAdapterLabel:", v20);
    else
      v32 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setAdapterViolationCategory:", v32);

  }
  else
  {
    scml::strCat<char const(&)[38],std::string>("Failed ", a1 + 56, &__p);
    v21 = *(_QWORD *)(a1 + 40);
    if ((v35 & 0x80u) == 0)
      p_p = &__p;
    else
      p_p = (__int128 *)__p;
    if ((v35 & 0x80u) == 0)
      v23 = v35;
    else
      v23 = *((_QWORD *)&__p + 1);
    scml::error(0xFu, (uint64_t)p_p, v23, v6);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(v21 + 24);
    *(_QWORD *)(v21 + 24) = v24;

    if ((char)v35 < 0)
      operator delete((void *)__p);
  }
  scml::Deferred::~Deferred((scml::Deferred *)v40);

}

- (void)sanitizeRequestAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v6;
  scml::SignpostInterval *v7;
  scml::SignpostInterval *Async;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  scml *v13;
  NSString *v14;
  void *v15;
  id v16;
  scml::SignpostInterval *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  scml::SignpostInterval *v21;
  scml::SignpostInterval *v22;
  uint8_t buf[4];
  SCMLTextSanitizer *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (scml::SignpostInterval *)a4;
  Async = scml::SignpostInterval::createAsync(v7);
  v9 = *(id *)Async;
  v10 = v9;
  v11 = *((_QWORD *)Async + 1);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SCMLTextSanitizer.sanitizeText", ", buf, 2u);
  }

  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "text");
    v13 = (scml *)objc_claimAutoreleasedReturnValue();
    scml::strEscape(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v24 = self;
    v25 = 2117;
    v26 = v15;
    _os_log_impl(&dword_245BFA000, v12, OS_LOG_TYPE_DEFAULT, "Begin sanitizeText: inst=%p %{sensitive}@", buf, 0x16u);

  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke;
  aBlock[3] = &unk_2516E4BB8;
  v16 = v6;
  v20 = v16;
  v22 = Async;
  v17 = v7;
  v21 = v17;
  v18 = _Block_copy(aBlock);
  -[SCMLTextSanitizer _sanitizeRequestAsynchronously:completionHandler:](self, "_sanitizeRequestAsynchronously:completionHandler:", v16, v18);

}

void __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  scml *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  scml::SignpostInterval *v19;
  _QWORD v20[3];
  _QWORD *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "unsafeReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "text");
      v9 = (scml *)objc_claimAutoreleasedReturnValue();
      scml::strEscape(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v23 = v5;
      v24 = 2117;
      v25 = v8;
      v26 = 2117;
      v27 = v11;
      _os_log_impl(&dword_245BFA000, v7, OS_LOG_TYPE_DEFAULT, "End sanitizeText %{private}@ (%{sensitive}@): %{sensitive}@", buf, 0x20u);

    }
  }
  else
  {
    +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke_cold_1((uint64_t)v6, v7, v12);
  }

  v13 = **(id **)(a1 + 48);
  v14 = v13;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v14, OS_SIGNPOST_INTERVAL_END, v15, "SCMLTextSanitizer.sanitizeText", ", buf, 2u);
  }

  v16 = *(_QWORD *)(a1 + 48);
  v20[0] = &off_2516E41D0;
  v21 = v20;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((_QWORD *)(v16 + 16), (uint64_t)v20);
  v17 = v21;
  if (v21 == v20)
  {
    v18 = 4;
    v17 = v20;
  }
  else
  {
    if (!v21)
      goto LABEL_14;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_14:
  v19 = *(scml::SignpostInterval **)(a1 + 48);
  if (v19)
  {
    scml::SignpostInterval::~SignpostInterval(v19);
    MEMORY[0x249544F58]();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_sanitizeRequestAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  SCMLTextSanitization *v25;
  id v26;
  void *v27;
  const __CFAllocator *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _BOOL8 v34;
  id v35;
  int hasGazetteerMatch;
  int v37;
  __CFString *v38;
  void *v39;
  _BOOL4 v40;
  SCMLTextSanitization *v41;
  void *v42;
  id v43;
  id v44;
  SCMLTextSanitization *v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  char v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  os_signpost_id_t v65;
  _QWORD *v66;
  uint64_t v67;
  SCMLTextSanitization *v68;
  id v69;
  uint64_t v70;
  SCMLTextSanitizer *v71;
  SCMLTextSanitizer *v72;
  __CFString *v73;
  _QWORD *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  SCMLTextSanitizer *v81;
  id v82;
  __CFString *v83;
  _QWORD *v84;
  id v85;
  SCMLTextSanitizer *v86;
  _QWORD *v87;
  uint64_t v88;
  void *exception;
  std::mutex *v90;
  std::mutex *v91;
  SCMLTextSanitization *v92;
  int v93;
  id v94;
  void *v95;
  SCMLTextSanitization *v96;
  SCMLTextSanitizer *v97;
  __CFString *str;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __CFString *v103;
  char v104[8];
  std::string buf;
  void *v106;
  std::string *p_p;
  uint64_t *v108;
  _QWORD *v109;
  __CFString *v110;
  char v111;
  _QWORD v112[3];
  char v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  char v117;
  std::string __p;
  char v119;
  _QWORD v120[3];
  _QWORD *v121;
  _BYTE v122[128];
  _QWORD v123[3];
  _QWORD *v124;
  _QWORD v125[3];
  _QWORD *v126;
  _QWORD v127[3];
  _QWORD *v128;
  id v129;
  os_signpost_id_t v130;
  _QWORD v131[6];
  CFRange v132;
  CFRange CurrentTokenRange;
  CFRange v134;
  CFRange v135;

  v131[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v94 = a4;
  v95 = v6;
  v97 = self;
  v90 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCMLTextSanitizer locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  buf.__r_.__value_.__r.__words[0] = 0;
  +[SCMLSafetyGuardrail normalizeText:locale:error:](_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail, "normalizeText:locale:error:", v9, v10, &buf);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = buf.__r_.__value_.__l.__data_;
  v13 = v12;
  if (!v11)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    scml::makeException("failed to normalize text", 0x18uLL, v13, (uint64_t)exception);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }

  v14 = objc_msgSend(v95, "keepGoing");
  v92 = -[SCMLTextSanitization initWithGranularOutput:]([SCMLTextSanitization alloc], "initWithGranularOutput:", *((_DWORD *)v97 + 21) != 0);
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v129);
  v15 = v129;
  v16 = v15;
  v17 = v130;
  if (v130 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SCMLTextSanitizer.sanitizeText.rules", ", (uint8_t *)&buf, 2u);
  }

  v127[0] = &off_2516E3BF8;
  v127[1] = &v129;
  v128 = v127;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v131, (uint64_t)v127);
  v20 = v128;
  if (v128 == v127)
  {
    v22 = 4;
    v20 = v127;
    v21 = (void *)v11;
    goto LABEL_9;
  }
  v21 = (void *)v11;
  if (v128)
  {
    v22 = 5;
LABEL_9:
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*v20 + 8 * v22))(v20, v18, v19);
  }
  v23 = *((_QWORD *)v97 + 13);
  v93 = objc_msgSend(v95, "isPersonalized", v90);
  v24 = v21;
  v25 = v92;
  v26 = v24;
  v96 = v25;
  str = (__CFString *)v26;
  v132.length = CFStringGetLength(str);
  v132.location = 0;
  CFStringTokenizerSetString(*(CFStringTokenizerRef *)v23, str, v132);
  v27 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v28 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)v23))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(_QWORD *)v23);
    v29 = (__CFString *)CFStringCreateWithSubstring(v28, str, CurrentTokenRange);
    objc_msgSend(v27, "addObject:", v29);

  }
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR(" "));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v23 + 56), "labelForString:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = -[SCMLTextSanitization updateSignal:withSafe:](v96, "updateSignal:withSafe:", kSCMLTextSanitizationSignalFullAllow[0], 1);

    goto LABEL_56;
  }
  objc_msgSend(*(id *)(v23 + 64), "labelForString:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 == 0;

  v35 = -[SCMLTextSanitization updateSignal:withSafe:](v96, "updateSignal:withSafe:", kSCMLTextSanitizationSignalFullDisallow[0], v34);
  if (((v14 & 1) != 0 || -[SCMLTextSanitization safe](v96, "safe")) && (*(_BYTE *)(v23 + 72) & 0x21) != 0)
  {
    v134.length = CFStringGetLength(str);
    v134.location = 0;
    CFStringTokenizerSetString(*(CFStringTokenizerRef *)v23, str, v134);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v104);
    std::string::basic_string[abi:ne180100]<0>(&buf, "");
    LODWORD(v106) = 1;
    MEMORY[0x249544A0C](v104, &buf);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    hasGazetteerMatch = 0;
    v37 = 0;
    while (1)
    {
      if (!CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)v23))
      {
        if ((hasGazetteerMatch & v37 & 1) == 0)
          v62 = -[SCMLTextSanitization updateSignal:withSafe:](v96, "updateSignal:withSafe:", kSCMLTextSanitizationSignalDesecration, 1);
LABEL_55:
        language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v104);
        break;
      }
      v135 = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(_QWORD *)v23);
      v103 = (__CFString *)CFStringCreateWithSubstring(v28, str, v135);
      v38 = v103;
      if ((*(_BYTE *)(v23 + 72) & 1) != 0)
      {
        objc_msgSend(*(id *)(v23 + 48), "labelForString:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39 == 0;

        if (v40)
        {
          v41 = v96;
          __p.__r_.__value_.__r.__words[0] = 0;
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)&__p;
          __p.__r_.__value_.__r.__words[2] = 0x2020000000;
          v119 = 1;
          v114 = 0;
          v115 = &v114;
          v116 = 0x2020000000;
          v117 = 1;
          v112[0] = 0;
          v112[1] = v112;
          v112[2] = 0x2020000000;
          v113 = 1;
          buf.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
          buf.__r_.__value_.__l.__size_ = 3221225472;
          buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN4scml12_GLOBAL__N_122RuleBasedTextSanitizer20updateWithOvsMatchesEPK10__CFStringjbP20SCMLTextSanitization_block_invoke;
          v106 = &unk_2516E4C08;
          p_p = &__p;
          v108 = &v114;
          v109 = v112;
          v110 = v38;
          v111 = v14;
          v42 = _Block_copy(&buf);
          LXLexiconEnumerateEntriesForString();
          v43 = -[SCMLTextSanitization updateSignal:withSafe:](v41, "updateSignal:withSafe:", kSCMLTextSanitizationSignalOVSOffensive[0], *(unsigned __int8 *)(__p.__r_.__value_.__l.__size_ + 24));
          v44 = -[SCMLTextSanitization updateSignal:withSafe:](v41, "updateSignal:withSafe:", kSCMLTextSanitizationSignalOVSVulgar[0], *((unsigned __int8 *)v115 + 24));

          _Block_object_dispose(v112, 8);
          _Block_object_dispose(&v114, 8);
          _Block_object_dispose(&__p, 8);

          if ((v14 & 1) == 0 && !-[SCMLTextSanitization safe](v41, "safe"))
            goto LABEL_51;
        }
      }
      if ((*(_BYTE *)(v23 + 72) & 0x20) == 0)
        goto LABEL_39;
      v45 = v96;
      v46 = *(uint64_t **)(v23 + 16);
      v47 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v104);
      v49 = -[SCMLTextSanitization updateSignal:withSafe:](v45, "updateSignal:withSafe:", kSCMLTextSanitizationSignalCustomWords[0], scml::MultiwordGazetteer::hasGazetteerMatch(v46, v38, v47, v48) ^ 1);
      if (v93)
      {
        v50 = *(uint64_t **)(v23 + 40);
        v51 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v104);
        v53 = -[SCMLTextSanitization updateSignal:withSafe:](v45, "updateSignal:withSafe:", kSCMLTextSanitizationSignalPersonalizationBlocklist[0], scml::MultiwordGazetteer::hasGazetteerMatch(v50, v38, v51, v52) ^ 1);
      }

      if ((v14 & 1) == 0 && !-[SCMLTextSanitization safe](v45, "safe"))
      {
LABEL_51:
        v61 = 0;
        goto LABEL_47;
      }
      if ((hasGazetteerMatch & 1) != 0)
      {
        hasGazetteerMatch = 1;
        if ((v37 & 1) == 0)
          goto LABEL_35;
      }
      else
      {
        v54 = *(uint64_t **)(v23 + 24);
        v55 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v104);
        hasGazetteerMatch = scml::MultiwordGazetteer::hasGazetteerMatch(v54, v38, v55, v56);
        if ((v37 & 1) == 0)
        {
LABEL_35:
          v57 = *(uint64_t **)(v23 + 32);
          v58 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)v104);
          v37 = scml::MultiwordGazetteer::hasGazetteerMatch(v57, v38, v58, v59);
          goto LABEL_36;
        }
      }
      v37 = 1;
LABEL_36:
      if ((hasGazetteerMatch & v37) != 1)
        goto LABEL_39;
      v60 = -[SCMLTextSanitization updateSignal:withSafe:](v45, "updateSignal:withSafe:", kSCMLTextSanitizationSignalDesecration, 0);
      hasGazetteerMatch = 1;
      if (v14)
      {
        v37 = 1;
LABEL_39:
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[__CFString UTF8String](objc_retainAutorelease(v38), "UTF8String"));
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        else
          buf = __p;
        LODWORD(v106) = 0;
        MEMORY[0x249544A0C](v104, &buf);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v61 = 1;
        goto LABEL_47;
      }
      v61 = 0;
      v37 = 1;
LABEL_47:

      if (v38)
        CFRelease(v38);
      if ((v61 & 1) == 0)
        goto LABEL_55;
    }
  }
LABEL_56:

  v63 = v129;
  v64 = v63;
  v65 = v130;
  if (v130 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v64, OS_SIGNPOST_INTERVAL_END, v65, "SCMLTextSanitizer.sanitizeText.rules", ", (uint8_t *)&buf, 2u);
  }

  v125[0] = &off_2516E3C50;
  v126 = v125;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v131, (uint64_t)v125);
  v66 = v126;
  if (v126 == v125)
  {
    v67 = 4;
    v66 = v125;
    goto LABEL_63;
  }
  if (v126)
  {
    v67 = 5;
LABEL_63:
    (*(void (**)(void))(*v66 + 8 * v67))();
  }
  if (!v31 && ((v14 & 1) != 0 || -[SCMLTextSanitization safe](v96, "safe")))
  {
    v68 = v96;
    v69 = v94;
    v70 = operator new();
    *(_QWORD *)v70 = _Block_copy(v69);
    *(_BYTE *)(v70 + 8) = v14;
    *(_QWORD *)(v70 + 16) = v68;
    *(_QWORD *)(v70 + 24) = 0;
    *(_BYTE *)(v70 + 32) = 0;
    *(_QWORD *)(v70 + 48) = 0;
    *(_QWORD *)(v70 + 56) = 0;
    *(_QWORD *)(v70 + 40) = 0;
    *(_DWORD *)(v70 + 64) = -1;

    v71 = v97;
    if ((*((_BYTE *)v97 + 88) & 2) == 0 || !*((_QWORD *)v97 + 14))
      goto LABEL_75;
    v72 = v97;
    v73 = str;
    v123[0] = &off_2516E3CA8;
    v123[1] = v72;
    v123[2] = v73;
    v124 = v123;
    v74 = v124;
    if (v124 == v123)
    {
      v75 = 4;
      v74 = v123;
    }
    else
    {
      v71 = v97;
      if (!v124)
      {
LABEL_75:
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v76 = *((id *)v71 + 15);
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
        if (!v77)
          goto LABEL_87;
        v78 = *(_QWORD *)v100;
        while (1)
        {
          for (i = 0; i != v77; ++i)
          {
            if (*(_QWORD *)v100 != v78)
              objc_enumerationMutation(v76);
            v80 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
            v81 = v97;
            v82 = v80;
            v83 = str;
            v121 = 0;
            v84 = operator new(0x20uLL);
            *v84 = &off_2516E3D00;
            v84[1] = v81;
            v85 = v82;
            v84[2] = v85;
            v84[3] = v83;
            v121 = v84;
            v86 = v81;

            v87 = v121;
            if (v121 == v120)
            {
              v87 = v120;
              v88 = 4;
            }
            else
            {
              if (!v121)
                continue;
              v88 = 5;
            }
            (*(void (**)(void))(*v87 + 8 * v88))();
          }
          v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
          if (!v77)
          {
LABEL_87:

            goto LABEL_88;
          }
        }
      }
      v75 = 5;
    }
    (*(void (**)(void))(*v74 + 8 * v75))();
    v71 = v97;
    goto LABEL_75;
  }
  (*((void (**)(id, SCMLTextSanitization *, _QWORD))v94 + 2))(v94, v96, 0);
LABEL_88:
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v129);

  std::mutex::unlock(v91);
}

- (id)sanitizeText:(id)a3 error:(id *)a4
{
  id v6;
  SCMLTextSanitizerRequest *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(SCMLTextSanitizerRequest);
  -[SCMLTextSanitizerRequest setText:](v7, "setText:", v6);
  -[SCMLTextSanitizer _sanitizeRequest:error:](self, "_sanitizeRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_sanitizeRequest:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__SCMLTextSanitizer__sanitizeRequest_error___block_invoke;
  v11[3] = &unk_2516E4BE0;
  v13 = &v21;
  v14 = &v15;
  v12 = v7;
  v8 = v7;
  -[SCMLTextSanitizer sanitizeRequestAsynchronously:completionHandler:](self, "sanitizeRequestAsynchronously:completionHandler:", v6, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __44__SCMLTextSanitizer__sanitizeRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)sanitizeText:(id)a3 keepGoing:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  SCMLTextSanitizerRequest *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(SCMLTextSanitizerRequest);
  -[SCMLTextSanitizerRequest setText:](v9, "setText:", v8);
  -[SCMLTextSanitizerRequest setKeepGoing:](v9, "setKeepGoing:", v6);
  -[SCMLTextSanitizer _sanitizeRequest:error:](self, "_sanitizeRequest:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (unsigned)violationCategoryForAdapterLabel:(id)a3
{
  scml *v3;
  unsigned __int8 v4;
  _QWORD *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  std::string __p;
  std::string v13;
  int v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  int v18;
  _QWORD v19[3];
  int v20;
  _QWORD v21[3];
  int v22;
  _QWORD v23[3];
  int v24;
  _QWORD v25[3];
  int v26;
  _QWORD v27[3];
  int v28;
  _QWORD v29[3];
  int v30;
  _QWORD v31[3];
  int v32;
  _QWORD v33[3];
  int v34;
  _QWORD v35[3];
  int v36;
  _QWORD v37[3];
  int v38;
  _QWORD v39[3];
  int v40;
  _QWORD v41[3];
  int v42;
  _QWORD v43[3];
  int v44;
  _QWORD v45[3];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = (scml *)a3;
  scml::strFromNSString(v3, &__p);
  if ((v4 & 1) == 0
  {
    v10 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&v13, "Dsvht");
    v14 = 2;
    std::string::basic_string[abi:ne180100]<0>(v15, "Hbuf");
    v16 = 3;
    std::string::basic_string[abi:ne180100]<0>(v17, "Cpotqjsbdjft");
    v18 = 4;
    std::string::basic_string[abi:ne180100]<0>(v19, "Vjpmfodf");
    v20 = 5;
    std::string::basic_string[abi:ne180100]<0>(v21, "Pspqfsuz dsjnf");
    v22 = 6;
    std::string::basic_string[abi:ne180100]<0>(v23, "Tfsspsjtn ps fyusfnjtn");
    v24 = 7;
    std::string::basic_string[abi:ne180100]<0>(v25, "Gpsf");
    v26 = 8;
    std::string::basic_string[abi:ne180100]<0>(v27, "Bpejmz gmvjet");
    v28 = 9;
    std::string::basic_string[abi:ne180100]<0>(v29, "Octdfof hftuvsft");
    v30 = 10;
    std::string::basic_string[abi:ne180100]<0>(v31, "Nvejuz ps tfyvbm");
    v32 = 11;
    std::string::basic_string[abi:ne180100]<0>(v33, "Wfbqpot");
    v34 = 12;
    std::string::basic_string[abi:ne180100]<0>(v35, "Mbtt mptt pg mjgf");
    v36 = 13;
    std::string::basic_string[abi:ne180100]<0>(v37, "Oggfotjwf xpset");
    v38 = 14;
    std::string::basic_string[abi:ne180100]<0>(v39, "CSEAI");
    v40 = 15;
    std::string::basic_string[abi:ne180100]<0>(v41, "Sfmg-ibsn");
    v42 = 16;
    std::string::basic_string[abi:ne180100]<0>(v43, "Tpyjd");
    v44 = 17;
    std::string::basic_string[abi:ne180100]<0>(v45, "Hbsbttnfou");
    v46 = 18;
    std::unordered_map<std::string,SCMLAdapterViolationCategory>::unordered_map(v10, (unsigned __int8 *)&v13, 17);
    v11 = 68;
    do
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[v11 + 1]) < 0)
        operator delete(*(void **)((char *)&v13.__r_.__value_.__l + v11 * 8 - 32));
      v11 -= 4;
    }
    while (v11 * 8);
    +[SCMLTextSanitizer violationCategoryForAdapterLabel:]::violationMap = v10;
  }
  v5 = (_QWORD *)+[SCMLTextSanitizer violationCategoryForAdapterLabel:]::violationMap;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v13, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v13 = __p;
  v6 = std::__hash_table<std::__hash_value_type<std::string,scml::Config>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,scml::Config>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,scml::Config>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,scml::Config>>>::find<std::string>(v5, (unsigned __int8 *)&v13);
  v7 = v6;
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v13.__r_.__value_.__l.__data_);
    if (v7)
      goto LABEL_7;
  }
  else if (v6)
  {
LABEL_7:
    v8 = *((_DWORD *)v7 + 10);
    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v8;
}

- (NSLocale)locale
{
  return (NSLocale *)*((_QWORD *)self + 9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 9, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (void)initWithConfiguration:error:
{
}

- (_QWORD)initWithConfiguration:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2516E3938;
  result[1] = v3;
  return result;
}

- (uint64_t)initWithConfiguration:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_sanitizeRequestAsynchronously:completionHandler:
{

}

- (_QWORD)_sanitizeRequestAsynchronously:completionHandler:
{
  *a2 = &off_2516E3D00;
  return std::__compressed_pair_elem<-[SCMLTextSanitizer _sanitizeRequestAsynchronously:completionHandler:]::$_12,0,false>::__compressed_pair_elem[abi:ne180100]<-[SCMLTextSanitizer _sanitizeRequestAsynchronously:completionHandler:]::$_12 const&,0ul>(a2 + 1, (id *)(a1 + 8));
}

- (uint64_t)_sanitizeRequestAsynchronously:completionHandler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)_sanitizeRequestAsynchronously:completionHandler:
{

  return a1;
}

- (_QWORD)_sanitizeRequestAsynchronously:(_QWORD *)a1 completionHandler:(id *)a2
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_245BFA000, a2, v4, "End SCMLTextSanitizer init with error: %s", (uint8_t *)&v5);
}

- (void)initWithConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_245BFA000, a1, a3, "VisualGeneration adapter on", a5, a6, a7, a8, 0);
}

- (void)initWithConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_245BFA000, a1, a3, "VisualGeneration adapter off", a5, a6, a7, a8, 0);
}

void __69__SCMLTextSanitizer_sanitizeRequestAsynchronously_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_245BFA000, a2, a3, "End sanitizeText with error: %@", (uint8_t *)&v3);
}

@end
