@implementation UPLoadedModelConfiguration

- (UPLoadedModelConfiguration)initWithModelConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  UPLoadedModelConfiguration *v10;
  uint64_t v11;
  NSString *intentVocabPath;
  uint64_t v13;
  NSString *bioLabelsVocabPath;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLocale *locale;
  uint64_t v19;
  NSString *bundleId;
  id v21;
  id v22;
  uint64_t v23;
  unsigned __int16 *v24;
  _BYTE *v25;
  char *v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  std::basic_string<char16_t> *v30;
  std::basic_string<char16_t> *v31;
  int64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  std::basic_string<char16_t> *v36;
  std::basic_string<char16_t> *v37;
  std::basic_string<char16_t> *v38;
  _BYTE *v39;
  char *v40;
  unint64_t v41;
  const std::basic_string<char16_t>::value_type **v42;
  __int128 v43;
  int64x2_t v44;
  std::basic_string<char16_t> *v45;
  uint64_t labelToValueType;
  uint64_t v47;
  std::basic_string<char16_t> *v48;
  std::basic_string<char16_t> *v49;
  int64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  __int128 v56;
  UPLoadedModelConfiguration *v57;
  char *v58;
  UPPreprocessor *v59;
  UPPreprocessor *preprocessor;
  id v61;
  id v62;
  _QWORD *v63;
  NSObject *v64;
  os_signpost_id_t v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t *v71;
  id v72;
  void *v73;
  BOOL v74;
  void *v75;
  void *v76;
  uint64_t *v77;
  id v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  UPLoadedModelConfiguration *v85;
  void *v87;
  void *v88;
  os_signpost_id_t spid;
  unint64_t v90;
  void *v91;
  UPLoadedModelConfiguration *v92;
  std::string v93;
  __int128 v94;
  char *v95;
  std::basic_string<char16_t> v96;
  _BYTE v97[32];
  __int128 v98;
  char *v99;
  std::string v100;
  std::basic_string<char16_t> __dst;
  void *__p;
  char v103;
  std::basic_string<char16_t> v104;
  char v105;
  std::basic_string<char16_t> v106;
  void *v107;
  char v108;
  char *v109;
  char *v110;
  char v111;
  uint8_t buf[8];
  int64x2_t v113;
  void *v114;
  std::basic_string<char16_t> **v115;
  char v116;
  char *v117[17];
  char v118;
  std::basic_string<char16_t> *v119[2];
  std::basic_string<char16_t> *v120;
  _BYTE v121[16];
  unsigned __int16 *v122;
  __int128 *v123[3];
  void *v124[2];
  char v125;
  std::string v126;
  objc_super v127;
  uint8_t v128[8];
  unint64_t v129;
  uint64_t v130;
  char *v131;
  int v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SNLPOSLoggerForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  SNLPOSLoggerForCategory(7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = v6;
  v90 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UPLoadedModelConfigurationInit", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN \"UPLoadedModelConfigurationInit\", buf, 2u);
  }

  v127.receiver = self;
  v127.super_class = (Class)UPLoadedModelConfiguration;
  v10 = -[UPLoadedModelConfiguration init](&v127, sel_init);

  if (v10)
  {
    objc_msgSend(v4, "intentVocabPath");
    v11 = objc_claimAutoreleasedReturnValue();
    intentVocabPath = v10->_intentVocabPath;
    v10->_intentVocabPath = (NSString *)v11;

    objc_msgSend(v4, "bioLabelsVocabPath");
    v13 = objc_claimAutoreleasedReturnValue();
    bioLabelsVocabPath = v10->_bioLabelsVocabPath;
    v10->_bioLabelsVocabPath = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v4, "configPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryWithContentsOfFile:", v16);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("locale"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v87);
    v17 = objc_claimAutoreleasedReturnValue();
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v17;

    objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("app_bundle"));
    v19 = objc_claimAutoreleasedReturnValue();
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v19;

    objc_msgSend(v4, "spanVocabPath");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v126, (char *)objc_msgSend(v21, "UTF8String"));

    objc_msgSend(v4, "grammarPath");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v124, (char *)objc_msgSend(v22, "UTF8String"));

    uaap_orchestration::grammar::UaapGrammar::fromFile((uint64_t)v124);
    uaap_orchestration::grammar::UaapGrammar::getAllLeftLabels(v123, (uint64_t)v121);
    v88 = v4;
    v119[1] = 0;
    v119[0] = 0;
    v120 = 0;
    v23 = operator new();
    *(_OWORD *)v23 = 0u;
    *(_OWORD *)(v23 + 16) = 0u;
    *(_DWORD *)(v23 + 32) = 1065353216;
    v10->_labelToValueType = (void *)v23;
    v24 = v122;
    v92 = v10;
    if (v122)
    {
      v25 = &v97[24];
      v26 = (char *)&v98 + 8;
      do
      {
        uaap_orchestration::grammar::UaapGrammar::getAllSpanValuesForLabel(v123, v24 + 8, (uint64_t)v128);
        if (*((char *)v24 + 39) < 0)
          std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v97, *((const std::basic_string<char16_t>::value_type **)v24 + 2), *((_QWORD *)v24 + 3));
        else
          *(std::basic_string<char16_t> *)v97 = *(std::basic_string<char16_t> *)(v24 + 8);
        v27 = *(_QWORD **)v128;
        v28 = v129;
        *(_QWORD *)v128 = 0;
        v129 = 0;
        *(_QWORD *)&v97[24] = v27;
        *(_QWORD *)&v98 = v28;
        *((_QWORD *)&v98 + 1) = v130;
        v99 = v131;
        LODWORD(v100.__r_.__value_.__l.__data_) = v132;
        if (v131)
        {
          v29 = *(_QWORD *)(v130 + 8);
          if ((v28 & (v28 - 1)) != 0)
          {
            if (v29 >= v28)
              v29 %= v28;
          }
          else
          {
            v29 &= v28 - 1;
          }
          v27[v29] = v26;
          v130 = 0;
          v131 = 0;
        }
        v30 = v119[1];
        if (v119[1] >= v120)
        {
          v32 = ((char *)v119[1] - (char *)v119[0]) >> 6;
          if ((unint64_t)(v32 + 1) >> 58)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          v33 = ((char *)v120 - (char *)v119[0]) >> 5;
          if (v33 <= v32 + 1)
            v33 = v32 + 1;
          if ((unint64_t)((char *)v120 - (char *)v119[0]) >= 0x7FFFFFFFFFFFFFC0)
            v34 = 0x3FFFFFFFFFFFFFFLL;
          else
            v34 = v33;
          v115 = &v120;
          if (v34)
            v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::matcher::SSUCandidateEncoder::EncodedAppCandidates>>(v34);
          else
            v35 = 0;
          *(_QWORD *)buf = v34;
          v113.i64[0] = v34 + (v32 << 6);
          v113.i64[1] = v113.i64[0];
          v114 = (void *)(v34 + (v35 << 6));
          std::allocator<nl_featurization::SpanMatcherPattern>::construct[abi:ne180100]<nl_featurization::SpanMatcherPattern,nl_featurization::SpanMatcherPattern>((std::basic_string<char16_t> *)v113.i64[0], (__int128 *)v97);
          v36 = (std::basic_string<char16_t> *)v113.i64[0];
          v31 = (std::basic_string<char16_t> *)(v113.i64[1] + 64);
          v113.i64[1] += 64;
          v37 = v119[1];
          v38 = v119[0];
          if (v119[1] == v119[0])
          {
            v44 = vdupq_n_s64((unint64_t)v119[1]);
          }
          else
          {
            v39 = v25;
            v40 = v26;
            v41 = 0;
            do
            {
              v42 = (const std::basic_string<char16_t>::value_type **)((char *)&v37[-2] + v41 - 16);
              if (*((char *)&v37[-1] + v41 - 17) < 0)
              {
                std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)((char *)v36 + v41 - 64), *v42, *(_QWORD *)((char *)&v37[-2] + v41 - 8));
              }
              else
              {
                v43 = *(_OWORD *)v42;
                v36[-2].__r_.__value_.__r.__words[v41 / 8] = v37[-2].__r_.__value_.__r.__words[v41 / 8];
                *(_OWORD *)((char *)&v36[-2] + v41 - 16) = v43;
              }
              std::unordered_set<std::basic_string<char16_t>>::unordered_set((uint64_t)&v36[-1] + v41 - 16, (uint64_t)&v37[-1] + v41 - 16);
              v41 -= 64;
            }
            while ((std::basic_string<char16_t> *)((char *)v37 + v41) != v38);
            v36 = (std::basic_string<char16_t> *)((char *)v36 + v41);
            v44 = *(int64x2_t *)v119;
            v31 = (std::basic_string<char16_t> *)v113.i64[1];
            v26 = v40;
            v25 = v39;
          }
          v119[0] = v36;
          v119[1] = v31;
          v113 = v44;
          v45 = v120;
          v120 = (std::basic_string<char16_t> *)v114;
          v114 = v45;
          *(_QWORD *)buf = v44.i64[0];
          std::__split_buffer<nl_featurization::SpanMatcherPattern>::~__split_buffer((uint64_t)buf);
          v10 = v92;
        }
        else
        {
          std::allocator<nl_featurization::SpanMatcherPattern>::construct[abi:ne180100]<nl_featurization::SpanMatcherPattern,nl_featurization::SpanMatcherPattern>(v119[1], (__int128 *)v97);
          v31 = (std::basic_string<char16_t> *)((char *)v30 + 64);
        }
        v119[1] = v31;
        uaap_orchestration::grammar::UaapGrammar::getRuleForLabel(v123, v24 + 8, (uint64_t)buf);
        if (v118)
        {
          std::__optional_copy_base<uaap_orchestration::grammar::ValueConstraints,false>::__optional_copy_base[abi:ne180100](&v106, (uint64_t)v117);
          if (v111)
          {
            std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](&v104, (__int128 *)&v106);
            if (v105)
            {
              labelToValueType = (uint64_t)v10->_labelToValueType;
              std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<true,0>(&__dst, (__int128 *)v24 + 1, (__int128 *)&v104);
              std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>>(labelToValueType, (unsigned __int16 *)&__dst, (uint64_t)&__dst);
              if (v103 < 0)
                operator delete(__p);
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__dst.__r_.__value_.__l.__data_);
              if (v105 && SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v104.__r_.__value_.__l.__data_);
            }
          }
          std::__optional_destruct_base<uaap_orchestration::grammar::ValueConstraints,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v106);
        }
        std::__optional_destruct_base<uaap_orchestration::grammar::Rule,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)buf);
        std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)v25);
        if ((v97[23] & 0x80000000) != 0)
          operator delete(*(void **)v97);
        std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)v128);
        v24 = *(unsigned __int16 **)v24;
      }
      while (v24);
    }
    v47 = operator new();
    v4 = v88;
    uaap_orchestration::resolution::Resolver::buildResolutionTablesFromGrammar((const uaap_orchestration::grammar::UaapGrammar *)v123, v47);
    v10->_resolver = (void *)v47;
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"_");
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      std::basic_string<char16_t>::__init_copy_ctor_external(&v96, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    else
      v96 = __dst;
    v94 = 0uLL;
    v95 = 0;
    v48 = v119[0];
    v49 = v119[1];
    *(_QWORD *)buf = &v94;
    v113.i8[0] = 0;
    v50 = (char *)v119[1] - (char *)v119[0];
    if (v119[1] != v119[0])
    {
      if (v50 < 0)
        std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::matcher::SSUCandidateEncoder::EncodedAppCandidates>>(v50 >> 6);
      v52 = 0;
      *(_QWORD *)&v94 = v51;
      *((_QWORD *)&v94 + 1) = v51;
      v95 = &v51[64 * v53];
      do
      {
        v54 = &v51[v52];
        v55 = (char *)v48 + v52;
        if (SHIBYTE(v48->__r_.__value_.__r.__words[v52 / 8 + 2]) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&v51[v52], *(const std::basic_string<char16_t>::value_type **)v55, *((_QWORD *)v55 + 1));
        }
        else
        {
          v56 = *(_OWORD *)v55;
          *((_QWORD *)v54 + 2) = *((_QWORD *)v55 + 2);
          *(_OWORD *)v54 = v56;
        }
        std::unordered_set<std::basic_string<char16_t>>::unordered_set((uint64_t)&v51[v52 + 24], (uint64_t)&v48[1] + v52);
        v52 += 64;
      }
      while ((std::basic_string<char16_t> *)((char *)v48 + v52) != v49);
      *((_QWORD *)&v94 + 1) = &v51[v52];
    }
    if (SHIBYTE(v126.__r_.__value_.__r.__words[2]) < 0)
    {
      v57 = v92;
      std::string::__init_copy_ctor_external(&v93, v126.__r_.__value_.__l.__data_, v126.__r_.__value_.__l.__size_);
    }
    else
    {
      v93 = v126;
      v57 = v92;
    }
    *(_QWORD *)v97 = 0;
    *(std::basic_string<char16_t> *)&v97[8] = v96;
    memset(&v96, 0, sizeof(v96));
    v98 = v94;
    v58 = v95;
    v94 = 0uLL;
    v95 = 0;
    v100 = v93;
    v99 = v58;
    memset(&v93, 0, sizeof(v93));
    *(_QWORD *)buf = &v94;
    std::vector<nl_featurization::SpanMatcherPattern>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    nl_featurization::buildFeaturizer((nl_featurization *)v97, (uint64_t *)buf);
    v59 = -[UPPreprocessor initWithLocale:featurizer:]([UPPreprocessor alloc], "initWithLocale:featurizer:", v57->_locale, *(_QWORD *)buf);
    preprocessor = v57->_preprocessor;
    v57->_preprocessor = v59;

    objc_msgSend(v88, "intentVocabPath");
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v106, (char *)objc_msgSend(v61, "UTF8String"));
    nl_featurization::vocabulary::Vocabulary::Vocabulary(buf);
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v106.__r_.__value_.__l.__data_);

    objc_msgSend(v88, "bioLabelsVocabPath");
    v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v128, (char *)objc_msgSend(v62, "UTF8String"));
    nl_featurization::vocabulary::Vocabulary::Vocabulary(&v106);
    if (SHIBYTE(v130) < 0)
      operator delete(*(void **)v128);

    v63 = (_QWORD *)operator new();
    uaap_orchestration::beam_input::buildBeamMaskInputs((uaap_orchestration::beam_input *)buf, (const nl_featurization::vocabulary::Vocabulary *)&v106, v123, v63);
    v57->_beamMaskInput = v63;
    SNLPOSLoggerForCategory(7);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = os_signpost_id_generate(v64);

    SNLPOSLoggerForCategory(7);
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      *(_WORD *)v128 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C2196000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "EspressoInitialization", ", v128, 2u);
    }

    SNLPOSLoggerForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v128 = 0;
      _os_log_impl(&dword_1C2196000, v68, OS_LOG_TYPE_DEFAULT, "BEGIN \"EspressoInitialization\", v128, 2u);
    }

    objc_msgSend(v88, "parserEspressoModelPath");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = (uint64_t *)operator new();
    v72 = objc_retainAutorelease(v70);
    std::string::basic_string[abi:ne180100]<0>(v128, (char *)objc_msgSend(v72, "UTF8String"));
    uaap::EspressoModule::deserializeModule(v71);
    v57->_parserEspressoModule = (EspressoModule *)v71;
    if (SHIBYTE(v130) < 0)
      operator delete(*(void **)v128);
    objc_msgSend(v88, "calibrationEspressoModelPath");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73 == 0;

    if (!v74)
    {
      objc_msgSend(v88, "calibrationEspressoModelPath");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = (uint64_t *)operator new();
      v78 = objc_retainAutorelease(v76);
      std::string::basic_string[abi:ne180100]<0>(v128, (char *)objc_msgSend(v78, "UTF8String"));
      uaap::EspressoModule::deserializeModule(v77);
      v57->_calibrationEspressoModule = (EspressoModule *)v77;
      if (SHIBYTE(v130) < 0)
        operator delete(*(void **)v128);

    }
    SNLPOSLoggerForCategory(7);
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)v128 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C2196000, v80, OS_SIGNPOST_INTERVAL_END, v65, "EspressoInitialization", ", v128, 2u);
    }

    SNLPOSLoggerForCategory(0);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v128 = 0;
      _os_log_impl(&dword_1C2196000, v81, OS_LOG_TYPE_DEFAULT, "END \"EspressoInitialization\", v128, 2u);
    }

    std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v110);
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v109);
    if (v108 < 0)
      operator delete(v107);
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v106.__r_.__value_.__l.__data_);
    std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v117[4]);
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v117[1]);
    if (v116 < 0)
      operator delete(v114);
    if (v113.i8[15] < 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v100.__r_.__value_.__l.__data_);
    *(_QWORD *)buf = &v98;
    std::vector<nl_featurization::SpanMatcherPattern>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if ((v97[31] & 0x80000000) != 0)
      operator delete(*(void **)&v97[8]);
    v10 = v92;
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    *(_QWORD *)buf = v119;
    std::vector<nl_featurization::SpanMatcherPattern>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)v121);
    *(_QWORD *)buf = v123;
    std::vector<uaap_orchestration::grammar::Rule const>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (v125 < 0)
      operator delete(v124[0]);
    if (SHIBYTE(v126.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v126.__r_.__value_.__l.__data_);

  }
  SNLPOSLoggerForCategory(7);
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v83, OS_SIGNPOST_INTERVAL_END, spid, "UPLoadedModelConfigurationInit", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v84, OS_LOG_TYPE_DEFAULT, "END \"UPLoadedModelConfigurationInit\", buf, 2u);
  }

  v85 = v10;
  return v85;
}

- (BOOL)hasCalibrationModel
{
  return self->_calibrationEspressoModule != 0;
}

- (void)dealloc
{
  void *labelToValueType;
  uint64_t v4;
  void *resolver;
  uint64_t v6;
  char *beamMaskInput;
  void *v8;
  EspressoModule *parserEspressoModule;
  EspressoModule *calibrationEspressoModule;
  objc_super v11;
  void **v12;

  labelToValueType = self->_labelToValueType;
  if (labelToValueType)
  {
    v4 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::~__hash_table((uint64_t)labelToValueType);
    MEMORY[0x1C3BB9B44](v4, 0x10A0C408EF24B1CLL);
  }
  resolver = self->_resolver;
  if (resolver)
  {
    v6 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>>>::~__hash_table((uint64_t)resolver);
    MEMORY[0x1C3BB9B44](v6, 0x10A0C408EF24B1CLL);
  }
  beamMaskInput = (char *)self->_beamMaskInput;
  if (beamMaskInput)
  {
    std::__hash_table<std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::set<unsigned long>>>>::~__hash_table((uint64_t)(beamMaskInput + 112));
    std::__hash_table<std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::set<unsigned long>>>>::~__hash_table((uint64_t)(beamMaskInput + 72));
    v12 = (void **)(beamMaskInput + 48);
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v12);
    v8 = (void *)*((_QWORD *)beamMaskInput + 3);
    if (v8)
    {
      *((_QWORD *)beamMaskInput + 4) = v8;
      operator delete(v8);
    }
    v12 = (void **)beamMaskInput;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v12);
    MEMORY[0x1C3BB9B44](beamMaskInput, 0x10A0C401A1B986CLL);
  }
  parserEspressoModule = self->_parserEspressoModule;
  if (parserEspressoModule)
  {
    uaap::EspressoModule::~EspressoModule((uaap::EspressoModule *)parserEspressoModule);
    MEMORY[0x1C3BB9B44]();
  }
  calibrationEspressoModule = self->_calibrationEspressoModule;
  if (calibrationEspressoModule)
  {
    uaap::EspressoModule::~EspressoModule((uaap::EspressoModule *)calibrationEspressoModule);
    MEMORY[0x1C3BB9B44]();
  }
  v11.receiver = self;
  v11.super_class = (Class)UPLoadedModelConfiguration;
  -[UPLoadedModelConfiguration dealloc](&v11, sel_dealloc);
}

- (UPPreprocessor)preprocessor
{
  return self->_preprocessor;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)bioLabelsVocabPath
{
  return self->_bioLabelsVocabPath;
}

- (NSString)intentVocabPath
{
  return self->_intentVocabPath;
}

- (void)labelToValueType
{
  return self->_labelToValueType;
}

- (void)resolver
{
  return self->_resolver;
}

- (void)beamMaskInput
{
  return self->_beamMaskInput;
}

- (EspressoModule)parserEspressoModule
{
  return self->_parserEspressoModule;
}

- (EspressoModule)calibrationEspressoModule
{
  return self->_calibrationEspressoModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentVocabPath, 0);
  objc_storeStrong((id *)&self->_bioLabelsVocabPath, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
}

@end
