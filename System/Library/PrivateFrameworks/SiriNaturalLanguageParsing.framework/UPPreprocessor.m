@implementation UPPreprocessor

- (UPPreprocessor)initWithLocale:(id)a3 featurizer:(const AbstractFeaturizer *)a4
{
  id v7;
  UPPreprocessor *v8;
  UPPreprocessor *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UPPreprocessor;
  v8 = -[UPPreprocessor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->__featurizer = a4;
  }

  return v9;
}

- (id)preprocess:(id)a3 error:(id *)a4
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t *v12;
  std::basic_string<char16_t>::size_type v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  const char *p_p;
  std::basic_string<char16_t>::size_type v33;
  uint64_t v34;
  __int128 v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  __int128 *v39;
  __int128 *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UPPreprocessorOutput *v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  const std::basic_string<char16_t>::value_type **v55;
  __int128 v56;
  NSObject *v57;
  void **v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  std::basic_string<char16_t>::size_type v63;
  uint64_t k;
  uint64_t *v65;
  unint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t m;
  void *v77;
  int v78;
  unint64_t *v79;
  unint64_t *v80;
  float *v81;
  unint64_t v82;
  char *v83;
  char *v84;
  _QWORD *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  UPPreprocessorOutput *v89;
  std::runtime_error *exception;
  char *v92;
  char *v93;
  os_signpost_id_t spid;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  std::basic_string<char16_t>::size_type v99;
  id v100;
  void *v101;
  void *obj;
  uint64_t obja;
  void *v104[3];
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  _BYTE *v118;
  uint64_t v119;
  void *v120;
  _BYTE *v121;
  uint64_t v122;
  uint8_t buf[16];
  std::basic_string<char16_t> v124;
  uint64_t v125;
  void *v126;
  char v127;
  uint64_t v128;
  char *v129;
  char *v130;
  __int128 *v131;
  void *v132;
  char *v133;
  void *v134;
  unint64_t *v135;
  __int128 __p;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  __int128 v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[2];
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  void *v152;
  char v153;
  std::basic_string<char16_t> v154;
  uint8_t v155[8];
  _OWORD v156[2];
  __int128 v157;
  uint64_t v158;
  _BYTE v159[128];
  uint64_t v160;
  void *v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v100 = a3;
  SNLPOSLoggerForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  SNLPOSLoggerForCategory(7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = v6;
  v95 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UaaP Preprocessing", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP Preprocessing\", buf, 2u);
  }

  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v152, (char *)objc_msgSend(v10, "UTF8String"));
  objc_msgSend(v100, "utterance");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v11, "UTF8String"));
  if ((v124.__r_.__value_.__r.__words[0] & 0x8000000000000000) == 0)
    v12 = buf;
  else
    v12 = *(uint8_t **)buf;
  if ((v124.__r_.__value_.__r.__words[0] & 0x8000000000000000) == 0)
    v13 = HIBYTE(v124.__r_.__value_.__r.__words[0]);
  else
    v13 = *(_QWORD *)&buf[8];
  toU16String((const char *)v12, v13, &v154);
  if (SHIBYTE(v124.__r_.__value_.__r.__words[0]) < 0)
    operator delete(*(void **)buf);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  objc_msgSend(v100, "tokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v148, v162, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v149;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v149 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
        objc_msgSend(v100, "embeddingsByToken");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v46 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "value");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("No embeddings are associated with token \"%@\"), v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = (void *)MEMORY[0x1E0CB35C8];
          v160 = *MEMORY[0x1E0CB2D50];
          v161 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v50);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v51 = 0;
          goto LABEL_132;
        }
        objc_msgSend(v101, "addObject:", v21);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v148, v162, 16);
      if (v15)
        continue;
      break;
    }
  }

  v146 = 0uLL;
  v147[0] = 0;
  objc_msgSend(v100, "tokens");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  v24 = v146;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v147[0] - v146) >> 4) < v23)
  {
    if (v23 > 0x555555555555555)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v25 = *((_QWORD *)&v146 + 1);
    v124.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)v147;
    *(_QWORD *)buf = std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v23);
    *(_QWORD *)&buf[8] = *(_QWORD *)buf + v25 - v24;
    v124.__r_.__value_.__r.__words[0] = *(_QWORD *)&buf[8];
    v124.__r_.__value_.__l.__size_ = *(_QWORD *)buf + 48 * v26;
    std::vector<nl_featurization::Token>::__swap_out_circular_buffer((uint64_t *)&v146, buf);
    std::__split_buffer<nl_featurization::Token>::~__split_buffer((uint64_t)buf);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend(v100, "tokens");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v143;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v143 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
        *(_QWORD *)buf = (int)objc_msgSend(v30, "begin");
        *(_QWORD *)&buf[8] = (int)objc_msgSend(v30, "end");
        objc_msgSend(v30, "value");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v31, "UTF8String"));
        if (v137 >= 0)
          p_p = (const char *)&__p;
        else
          p_p = (const char *)__p;
        if (v137 >= 0)
          v33 = HIBYTE(v137);
        else
          v33 = *((_QWORD *)&__p + 1);
        toU16String(p_p, v33, &v124);
        LOBYTE(v125) = 0;
        v34 = *((_QWORD *)&v146 + 1);
        if (*((_QWORD *)&v146 + 1) >= v147[0])
        {
          v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v146 + 1) - v146) >> 4);
          v37 = v36 + 1;
          if (v36 + 1 > 0x555555555555555)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v147[0] - v146) >> 4) > v37)
            v37 = 0x5555555555555556 * ((uint64_t)(v147[0] - v146) >> 4);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v147[0] - v146) >> 4) >= 0x2AAAAAAAAAAAAAALL)
            v38 = 0x555555555555555;
          else
            v38 = v37;
          v133 = (char *)v147;
          v39 = (__int128 *)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v38);
          v40 = &v39[3 * v36];
          v129 = (char *)v39;
          v130 = (char *)v40;
          v132 = &v39[3 * v41];
          *v40 = *(_OWORD *)buf;
          v42 = *(_OWORD *)&v124.__r_.__value_.__l.__data_;
          *((_QWORD *)v40 + 4) = *((_QWORD *)&v124.__r_.__value_.__l + 2);
          v40[1] = v42;
          memset(&v124, 0, sizeof(v124));
          *((_BYTE *)v40 + 40) = v125;
          v131 = v40 + 3;
          std::vector<nl_featurization::Token>::__swap_out_circular_buffer((uint64_t *)&v146, &v129);
          v43 = *((_QWORD *)&v146 + 1);
          std::__split_buffer<nl_featurization::Token>::~__split_buffer((uint64_t)&v129);
          *((_QWORD *)&v146 + 1) = v43;
          if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v124.__r_.__value_.__l.__data_);
        }
        else
        {
          **((_OWORD **)&v146 + 1) = *(_OWORD *)buf;
          v35 = *(_OWORD *)&v124.__r_.__value_.__l.__data_;
          *(_QWORD *)(v34 + 32) = *((_QWORD *)&v124.__r_.__value_.__l + 2);
          *(_OWORD *)(v34 + 16) = v35;
          memset(&v124, 0, sizeof(v124));
          *(_BYTE *)(v34 + 40) = v125;
          *((_QWORD *)&v146 + 1) = v34 + 48;
        }
        if (SHIBYTE(v137) < 0)
          operator delete((void *)__p);

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
    }
    while (v27);
  }

  v44 = (void *)objc_opt_class();
  objc_msgSend(v100, "spans");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(v44, "buildMatchedSpanListFromQuerySpans:", v45);
  }
  else
  {
    v140 = 0uLL;
    v141 = 0;
  }

  __p = v146;
  v52 = v147[0];
  v146 = 0uLL;
  v147[0] = 0;
  v138 = v140;
  v137 = v52;
  v139 = v141;
  v140 = 0uLL;
  v141 = 0;
  (*((void (**)(char **__return_ptr, const AbstractFeaturizer *, __int128 *))self->__featurizer->var0 + 2))(&v129, self->__featurizer, &__p);
  v92 = v129;
  v93 = v130;
  v96 = (v130 - v129) / 48;
  if (v130 != v129)
  {
    v53 = 0;
    if (v96 <= 1)
      v54 = 1;
    else
      v54 = (v130 - v129) / 48;
    do
    {
      v55 = (const std::basic_string<char16_t>::value_type **)&v129[v53 + 16];
      if (v129[v53 + 39] < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)buf, *v55, *(_QWORD *)&v129[v53 + 24]);
      }
      else
      {
        v56 = *(_OWORD *)v55;
        v124.__r_.__value_.__r.__words[0] = *(_QWORD *)&v129[v53 + 32];
        *(_OWORD *)buf = v56;
      }
      SNLPOSLoggerForCategory(3);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        morphun::util::StringUtils::to_string();
        v58 = v119 >= 0 ? &v117 : (void **)v117;
        LODWORD(v157) = 136315138;
        *(_QWORD *)((char *)&v157 + 4) = v58;
        _os_log_impl(&dword_1C2196000, v57, OS_LOG_TYPE_DEBUG, "Featurized token with text=%s", (uint8_t *)&v157, 0xCu);
        if (SHIBYTE(v119) < 0)
          operator delete(v117);
      }

      if (SHIBYTE(v124.__r_.__value_.__r.__words[0]) < 0)
        operator delete(*(void **)buf);
      v53 += 48;
      --v54;
    }
    while (v54);
  }
  v157 = 0uLL;
  v158 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v157, v132, (uint64_t)v133, (v133 - (_BYTE *)v132) >> 3);
  if (*((_QWORD *)&v157 + 1) - (_QWORD)v157 != 16 || *(_QWORD *)v157 != v96)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Span label shape incorrect.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (v93 != v92)
  {
    v59 = 0;
    v60 = *(_QWORD *)(v157 + 8);
    v61 = *MEMORY[0x1E0DE4F50];
    obja = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
    v99 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
    v62 = v96;
    if (v96 <= 1)
      v62 = 1;
    v97 = v62;
    v63 = MEMORY[0x1E0DE4FB8] + 16;
    do
    {
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buf);
      LOBYTE(v117) = 91;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)&v117, 1);
      if (v60)
      {
        for (k = 0; k != v60; ++k)
        {
          if (k)
          {
            LOBYTE(v117) = 32;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)&v117, 1);
          }
          v65 = (uint64_t *)operator new(0x10uLL);
          *v65 = v59;
          v65[1] = k;
          v66 = nl_featurization::tensor::Tensor<unsigned long>::computeAddress((uint64_t *)v132, v133, v65, (uint64_t)(v65 + 2));
          if (v66 >= ((char *)v135 - (_BYTE *)v134) >> 3)
            std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
          operator delete(v65);
          std::ostream::operator<<();
        }
      }
      LOBYTE(v117) = 93;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)&v117, 1);
      SNLPOSLoggerForCategory(3);
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        std::stringbuf::str();
        v68 = &v117;
        if (v119 < 0)
          v68 = v117;
        LODWORD(v156[0]) = 136315138;
        *(_QWORD *)((char *)v156 + 4) = v68;
        _os_log_impl(&dword_1C2196000, v67, OS_LOG_TYPE_DEBUG, "Token span labels: %s", (uint8_t *)v156, 0xCu);
        if (SHIBYTE(v119) < 0)
          operator delete(v117);
      }

      *(_QWORD *)buf = v61;
      *(_QWORD *)&buf[*(_QWORD *)(v61 - 24)] = obja;
      v124.__r_.__value_.__r.__words[0] = v99;
      v124.__r_.__value_.__l.__size_ = v63;
      if (v127 < 0)
        operator delete(v126);
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      MEMORY[0x1C3BB9A90](&v128);
      ++v59;
    }
    while (v59 != v97);
  }
  objc_msgSend(v101, "firstObject");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "getDimension");

  *(_DWORD *)buf = 0;
  std::vector<float>::vector(v156, v70 * v96, buf);
  if (v93 != v92)
  {
    v71 = 0;
    v72 = 0;
    if (v96 <= 1)
      v73 = 1;
    else
      v73 = v96;
    do
    {
      objc_msgSend(v101, "objectAtIndexedSubscript:", v72);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "getCoordinates");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
      {
        for (m = 0; m != v70; ++m)
        {
          objc_msgSend(v75, "objectAtIndexedSubscript:", m);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "floatValue");
          *(_DWORD *)(*(_QWORD *)&v156[0] + v71 + 4 * m) = v78;

        }
      }

      ++v72;
      v71 += 4 * v70;
    }
    while (v72 != v73);
  }
  memset(buf, 0, sizeof(buf));
  v124.__r_.__value_.__r.__words[0] = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(buf, v132, (uint64_t)v133, (v133 - (_BYTE *)v132) >> 3);
  v79 = (unint64_t *)v134;
  v80 = v135;
  v125 = 0;
  *(_OWORD *)&v124.__r_.__value_.__r.__words[1] = 0uLL;
  if (v135 != v134)
  {
    std::vector<int>::__vallocate[abi:ne180100](&v124.__r_.__value_.__l.__size_, ((char *)v135 - (_BYTE *)v134) >> 3);
    v81 = (float *)v124.__r_.__value_.__r.__words[2];
    do
    {
      v82 = *v79++;
      *v81++ = (float)v82;
    }
    while (v79 != v80);
    v124.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)v81;
  }
  v83 = v130;
  v84 = v129;
  v85 = operator new(0x18uLL);
  *v85 = 0xAAAAAAAAAAAAAAABLL * ((v83 - v84) >> 4);
  v85[1] = 1;
  v85[2] = v70;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v117, v85, (uint64_t)(v85 + 3), 3uLL);
  v120 = 0;
  v121 = 0;
  v122 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v120, *(const void **)&v156[0], *((uint64_t *)&v156[0] + 1), (uint64_t)(*((_QWORD *)&v156[0] + 1) - *(_QWORD *)&v156[0]) >> 2);
  SNLPOSLoggerForCategory(7);
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = v86;
  if (v95 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
  {
    *(_WORD *)v155 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v87, OS_SIGNPOST_INTERVAL_END, spid, "UaaP Preprocessing", ", v155, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v155 = 0;
    _os_log_impl(&dword_1C2196000, v88, OS_LOG_TYPE_DEFAULT, "END \"UaaP Preprocessing\", v155, 2u);
  }

  v89 = [UPPreprocessorOutput alloc];
  v111 = 0;
  v112 = 0;
  v113 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v111, v117, (uint64_t)v118, (v118 - (_BYTE *)v117) >> 3);
  v114 = 0;
  v115 = 0;
  v116 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v114, v120, (uint64_t)v121, (v121 - (_BYTE *)v120) >> 2);
  v105 = 0;
  v106 = 0;
  v107 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v105, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
  v108 = 0;
  v109 = 0;
  v110 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v108, (const void *)v124.__r_.__value_.__l.__size_, v124.__r_.__value_.__r.__words[2], (uint64_t)(v124.__r_.__value_.__r.__words[2] - v124.__r_.__value_.__l.__size_) >> 2);
  memset(v104, 0, sizeof(v104));
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(v104, (__int128 *)v129, (__int128 *)v130, 0xAAAAAAAAAAAAAAABLL * ((v130 - v129) >> 4));
  v51 = -[UPPreprocessorOutput initWithEmbeddingsTensor:spanLabelsTensor:outputTokens:](v89, "initWithEmbeddingsTensor:spanLabelsTensor:outputTokens:", &v111, &v105, v104);
  *(_QWORD *)v155 = v104;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v155);
  if (v108)
  {
    v109 = v108;
    operator delete(v108);
  }
  if (v105)
  {
    v106 = v105;
    operator delete(v105);
  }
  if (v114)
  {
    v115 = v114;
    operator delete(v114);
  }
  if (v111)
  {
    v112 = v111;
    operator delete(v111);
  }
  if (v120)
  {
    v121 = v120;
    operator delete(v120);
  }
  if (v117)
  {
    v118 = v117;
    operator delete(v117);
  }
  operator delete(v85);
  if (v124.__r_.__value_.__l.__size_)
  {
    v124.__r_.__value_.__r.__words[2] = v124.__r_.__value_.__l.__size_;
    operator delete((void *)v124.__r_.__value_.__l.__size_);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  if (*(_QWORD *)&v156[0])
  {
    *((_QWORD *)&v156[0] + 1) = *(_QWORD *)&v156[0];
    operator delete(*(void **)&v156[0]);
  }
  if ((_QWORD)v157)
  {
    *((_QWORD *)&v157 + 1) = v157;
    operator delete((void *)v157);
  }
  if (v134)
  {
    v135 = (unint64_t *)v134;
    operator delete(v134);
  }
  if (v132)
  {
    v133 = (char *)v132;
    operator delete(v132);
  }
  *(_QWORD *)buf = &v129;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = &v138;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = &__p;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = &v140;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = &v146;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_132:

  if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v154.__r_.__value_.__l.__data_);
  if (v153 < 0)
    operator delete(v152);

  return v51;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (vector<nl_featurization::span_matching::MatchedSpan,)buildMatchedSpanListFromQuerySpans:(id)a2
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  const char *p_buf;
  std::basic_string<char16_t>::size_type v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  MatchedSpan *var1;
  MatchedSpan *var0;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  MatchedSpan *v32;
  int v33;
  vector<nl_featurization::span_matching::MatchedSpan, std::allocator<nl_featurization::span_matching::MatchedSpan>> *result;
  __int128 v35;
  __compressed_pair<nl_featurization::span_matching::MatchedSpan *, std::allocator<nl_featurization::span_matching::MatchedSpan>> *p_var2;
  vector<nl_featurization::span_matching::MatchedSpan, std::allocator<nl_featurization::span_matching::MatchedSpan>> *v37;
  uint64_t v38;
  std::basic_string<char16_t> __p;
  void *v40;
  char v41;
  unsigned __int8 v42;
  std::basic_string<char16_t> v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  __int128 buf;
  void *v50;
  unint64_t v51;
  __compressed_pair<nl_featurization::span_matching::MatchedSpan *, std::allocator<nl_featurization::span_matching::MatchedSpan>> *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v45;
    p_var2 = &retstr->var2;
    *(_QWORD *)&v8 = 138412290;
    v35 = v8;
    v37 = retstr;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v35) == 2)
        {
          objc_msgSend(v11, "category");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v12, "UTF8String"));
          if (SHIBYTE(v50) >= 0)
            p_buf = (const char *)&buf;
          else
            p_buf = (const char *)buf;
          if (SHIBYTE(v50) >= 0)
            v14 = HIBYTE(v50);
          else
            v14 = *((_QWORD *)&buf + 1);
          toU16String(p_buf, v14, &v43);
          if (SHIBYTE(v50) < 0)
            operator delete((void *)buf);

          uaap::UPDataDetector::labelToUaapType((unsigned __int16 *)&v43, (uint64_t)&v40);
          v15 = v42;
          if (v42)
          {
            LODWORD(v38) = objc_msgSend(v11, "range");
            v16 = objc_msgSend(v11, "range");
            objc_msgSend(v11, "range");
            HIDWORD(v38) = v17 + v16;
            if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
              std::basic_string<char16_t>::__init_copy_ctor_external(&__p, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
            else
              __p = v43;
            SNLPOSLoggerForCategory(3);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              +[UPUtilities stdU16ToNSString:](UPUtilities, "stdU16ToNSString:", &__p);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 67109634;
              DWORD1(buf) = v38;
              WORD4(buf) = 1024;
              *(_DWORD *)((char *)&buf + 10) = HIDWORD(v38);
              HIWORD(buf) = 2112;
              v50 = v21;
              _os_log_impl(&dword_1C2196000, v20, OS_LOG_TYPE_DEBUG, "Adding matching span (%u -> %u) with label %@", (uint8_t *)&buf, 0x18u);

              retstr = v37;
            }

            var1 = retstr->var1;
            var0 = retstr->var2.var0;
            if (var1 >= var0)
            {
              v25 = (var1 - retstr->var0) >> 5;
              v26 = v25 + 1;
              if ((unint64_t)(v25 + 1) >> 59)
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              v27 = var0 - retstr->var0;
              if (v27 >> 4 > v26)
                v26 = v27 >> 4;
              if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0)
                v28 = 0x7FFFFFFFFFFFFFFLL;
              else
                v28 = v26;
              v52 = p_var2;
              if (v28)
                v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(v28);
              else
                v29 = 0;
              v30 = v28 + 32 * v25;
              *(_QWORD *)&buf = v28;
              *((_QWORD *)&buf + 1) = v30;
              v51 = v28 + 32 * v29;
              *(_QWORD *)v30 = v38;
              v31 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              *(_QWORD *)(v30 + 24) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
              *(_OWORD *)(v30 + 8) = v31;
              memset(&__p, 0, sizeof(__p));
              v50 = (void *)(v30 + 32);
              std::vector<nl_featurization::span_matching::MatchedSpan>::__swap_out_circular_buffer((uint64_t *)retstr, &buf);
              v32 = v37->var1;
              std::__split_buffer<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::~__split_buffer((uint64_t)&buf);
              v33 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
              v37->var1 = v32;
              retstr = v37;
              if (v33 < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
            else
            {
              *(_QWORD *)var1 = v38;
              v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              *((_QWORD *)var1 + 3) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
              *(_OWORD *)((char *)var1 + 8) = v24;
              memset(&__p, 0, sizeof(__p));
              retstr->var1 = (MatchedSpan *)((char *)var1 + 32);
            }
            if (v15 && v41 < 0)
              operator delete(v40);
          }
          else
          {
            SNLPOSLoggerForCategory(3);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "category");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = v35;
              *(_QWORD *)((char *)&buf + 4) = v19;
              _os_log_impl(&dword_1C2196000, v18, OS_LOG_TYPE_DEBUG, "Warning: discarding data detector matching span with unknown category %@", (uint8_t *)&buf, 0xCu);

            }
          }
          if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v43.__r_.__value_.__l.__data_);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v7);
  }

  return result;
}

@end
