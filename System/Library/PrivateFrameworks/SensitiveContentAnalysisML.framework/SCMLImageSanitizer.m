@implementation SCMLImageSanitizer

- (SCMLImageSanitizer)init
{
  return -[SCMLImageSanitizer initWithConfiguration:error:](self, "initWithConfiguration:error:", 0, 0);
}

- (SCMLImageSanitizer)initWithConfiguration:(id)a3 error:(id *)a4
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  int v12;
  SCMLImageSanitizer *v13;
  SCMLImageSanitizerConfiguration *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  unsigned int v22;
  NSSet *v23;
  NSSet *v24;
  NSSet *excludedSignals;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  std::string *v32;
  __int128 v33;
  __int128 *p_p;
  uint64_t v35;
  unint64_t backends;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t j;
  uint64_t v44;
  float v45;
  VNSession *v46;
  VNSession *vnSession;
  VNSession *v48;
  _anonymous_namespace_ *v49;
  void *v50;
  void *v51;
  std::string *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  _QWORD *v57;
  uint64_t v58;
  void *v59;
  _BOOL4 v60;
  scml *v61;
  unint64_t v62;
  std::vector<std::string>::pointer end;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  std::string *v68;
  std::string *v69;
  __int128 v70;
  std::string *v71;
  std::vector<std::string>::pointer v72;
  __int128 v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  std::string *v77;
  std::string *v78;
  __int128 v79;
  std::string *v80;
  std::vector<std::string>::pointer v81;
  std::vector<std::string>::pointer begin;
  vector<std::unique_ptr<scml::ClipEmbeddingClassifier>, std::allocator<std::unique_ptr<scml::ClipEmbeddingClassifier>>> *p_clipEmbeddingClassifiers;
  std::string *v84;
  NSObject *v85;
  std::__split_buffer<std::string>::pointer v86;
  std::string::size_type v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  std::vector<std::string>::pointer v94;
  std::string::size_type size;
  char *v96;
  char *value;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  uint64_t *v103;
  char *v104;
  _QWORD *v105;
  _QWORD *v106;
  _QWORD *v107;
  uint64_t v108;
  int64x2_t v109;
  scml::ClipEmbeddingClassifier::Impl **v110;
  char *v111;
  uint64_t v112;
  scml::ClipEmbeddingClassifier *v113;
  std::string *v114;
  NSObject *v115;
  std::__split_buffer<std::string>::pointer v116;
  std::string *v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  scml::ClipImageEncoder *v122;
  uint64_t v123;
  NSObject *v124;
  NSObject *v125;
  os_signpost_id_t v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t i;
  uint64_t v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  __int128 v136;
  std::vector<std::string>::pointer value_high;
  std::vector<std::string> *v138;
  std::vector<std::string>::pointer v139;
  uint64_t v140;
  uint64_t v142;
  std::vector<std::string> *v143;
  std::vector<std::string>::pointer v144;
  std::vector<std::string>::pointer v145;
  int v146;
  BOOL v147;
  _QWORD *words;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  void *v154;
  void *v155;
  SCMLHandler *v156;
  id v157;
  SCMLHandler *handler;
  std::__shared_weak_count *v159;
  unint64_t *p_shared_owners;
  unint64_t v161;
  NSObject *v162;
  SCMLImageSanitizer *v163;
  void *v165;
  void *exception;
  void *v167;
  char *v168;
  SCMLImageSanitizerConfiguration *v170;
  id v171[2];
  void *v172;
  std::vector<std::string> v173;
  id v174;
  objc_super v175;
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[3];
  _QWORD *v179;
  __int128 v180;
  _QWORD v181[3];
  _QWORD *v182;
  _QWORD v183[3];
  _QWORD *v184;
  std::__split_buffer<std::string> __str;
  _QWORD v186[3];
  _QWORD *v187;
  void *v188;
  _QWORD v189[3];
  _QWORD *v190;
  __int128 __p;
  _QWORD v192[4];
  uint8_t buf[4];
  SCMLImageSanitizer *v194;
  __int16 v195;
  unsigned int v196;
  __int16 v197;
  int v198;
  std::__shared_weak_count *v199;
  _QWORD v200[3];
  _QWORD *v201;
  id v202;
  os_signpost_id_t v203;
  uint64_t v204[4];
  std::string v205;
  char *v206;
  __compressed_pair<std::unique_ptr<scml::ClipEmbeddingClassifier> *, std::allocator<std::unique_ptr<scml::ClipEmbeddingClassifier>>> *p_end_cap;
  uint64_t v208;

  v208 = *MEMORY[0x24BDAC8D0];
  v170 = (SCMLImageSanitizerConfiguration *)a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v202);
  v5 = v202;
  v6 = v5;
  v7 = v203;
  if (v203 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SCMLImageSanitizer.init", ", buf, 2u);
  }

  v200[0] = &off_2516E3990;
  v200[1] = &v202;
  v201 = v200;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v204, (uint64_t)v200);
  v8 = v201;
  if (v201 == v200)
  {
    v9 = 4;
    v8 = v200;
  }
  else
  {
    if (!v201)
      goto LABEL_9;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_9:
  +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[SCMLImageSanitizerConfiguration mode](v170, "mode");
    v12 = -[SCMLImageSanitizerConfiguration backends](v170, "backends");
    *(_DWORD *)buf = 134218496;
    v194 = self;
    v195 = 1024;
    v196 = v11;
    v197 = 1024;
    v198 = v12;
    _os_log_impl(&dword_245BFA000, v10, OS_LOG_TYPE_DEFAULT, "Begin SCMLImageSanitizer init inst=%p mode=%d backends=0x%x", buf, 0x18u);
  }

  v175.receiver = self;
  v175.super_class = (Class)SCMLImageSanitizer;
  v13 = -[SCMLImageSanitizer init](&v175, sel_init);

  if (v13)
  {
    v14 = v170;
    if (!v170)
      v14 = objc_alloc_init(SCMLImageSanitizerConfiguration);
    v170 = v14;
    v13->_granularity = -[SCMLImageSanitizerConfiguration granularity](v14, "granularity");
    v15 = -[SCMLImageSanitizerConfiguration mode](v170, "mode");
    v16 = -[SCMLImageSanitizerConfiguration backends](v170, "backends");
    if (v15 != 3)
    {
      LODWORD(__p) = v15;
      if (v15 - 3 <= 0xFFFFFFFD)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        scml::strCat<char const(&)[30],SCMLImageSanitizerMode &>("No default backends for mode ", buf);
        MEMORY[0x249544C64](exception, buf);
        __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v17 = _os_feature_enabled_impl();
      +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v17)
      {
        if (v19)
          -[SCMLImageSanitizer initWithConfiguration:error:].cold.4();
        v16 = 7;
      }
      else
      {
        if (v19)
          -[SCMLImageSanitizer initWithConfiguration:error:].cold.5();
        v16 = 3;
      }

      if (v15 == 1 && _os_feature_enabled_impl())
      {
        +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[SCMLImageSanitizer initWithConfiguration:error:].cold.2();

        v16 |= 8uLL;
      }
      else
      {
        +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[SCMLImageSanitizer initWithConfiguration:error:].cold.3();

      }
    }
    v13->_backends = v16;
    v22 = -[SCMLImageSanitizerConfiguration mode](v170, "mode");
    v23 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v24 = v23;
    if (v22 == 2)
      -[NSSet addObject:](v23, "addObject:", CFSTR("btn.ufsspsjtu_ibuf_hspvqt"));
    excludedSignals = v13->_excludedSignals;
    v13->_excludedSignals = v24;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resourceURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "stringByAppendingPathComponent:", CFSTR("Models"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("ImageSanitizer_v1.0.0"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("ImageSanitizer_v1.0.0"));
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v31, "UTF8String"));

    v32 = std::string::append((std::string *)&__str, ".config.json", 0xCuLL);
    v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v192[0] = *((_QWORD *)&v32->__r_.__value_.__l + 2);
    __p = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    if (v192[0] >= 0)
      p_p = &__p;
    else
      p_p = (__int128 *)__p;
    if (v192[0] >= 0)
      v35 = HIBYTE(v192[0]);
    else
      v35 = *((_QWORD *)&__p + 1);
    scml::Config::loadJson(p_p, v35, (uint64_t)buf);
    if (SHIBYTE(v192[0]) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(__str.__end_) < 0)
      operator delete(__str.__first_);
    backends = v13->_backends;
    if ((backends & 2) == 0)
    {
LABEL_65:
      if ((backends & 0xC) == 0)
        goto LABEL_159;
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&__p);
      v54 = (id)__p;
      v55 = v54;
      v56 = *((_QWORD *)&__p + 1);
      if ((unint64_t)(*((_QWORD *)&__p + 1) - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        LOWORD(__str.__first_) = 0;
        _os_signpost_emit_with_name_impl(&dword_245BFA000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v56, "SCMLImageSanitizer.init.clip", ", (uint8_t *)&__str, 2u);
      }

      v186[0] = &off_2516E3A40;
      v186[1] = &__p;
      v187 = v186;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v192, (uint64_t)v186);
      v57 = v187;
      if (v187 == v186)
      {
        v58 = 4;
        v57 = v186;
      }
      else
      {
        if (!v187)
        {
LABEL_74:
          memset(&v173, 0, sizeof(v173));
          -[SCMLImageSanitizerConfiguration clipClassifierConfig](v170, "clipClassifierConfig");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "length") == 0;

          if (v60)
          {
            v62 = v13->_backends;
            if ((v62 & 4) != 0)
            {
              scml::ClipEmbeddingClassifier::defaultASMConfigPath(&v205);
              end = v173.__end_;
              if (v173.__end_ >= v173.__end_cap_.__value_)
              {
                v65 = 0xAAAAAAAAAAAAAAABLL * (((char *)v173.__end_ - (char *)v173.__begin_) >> 3);
                v66 = v65 + 1;
                if (v65 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<std::function<NSArray<NSString *> * ()(scml::TextModerationTokenizer const*,NSArray<NSString *> *)>>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * (((char *)v173.__end_cap_.__value_ - (char *)v173.__begin_) >> 3) > v66)
                  v66 = 0x5555555555555556 * (((char *)v173.__end_cap_.__value_ - (char *)v173.__begin_) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * (((char *)v173.__end_cap_.__value_ - (char *)v173.__begin_) >> 3) >= 0x555555555555555)
                  v67 = 0xAAAAAAAAAAAAAAALL;
                else
                  v67 = v66;
                __str.__end_cap_.__value_ = (std::allocator<std::string> *)&v173.__end_cap_;
                if (v67)
                  v68 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v173.__end_cap_, v67);
                else
                  v68 = 0;
                v69 = v68 + v65;
                __str.__first_ = v68;
                __str.__begin_ = v69;
                __str.__end_cap_.__value_ = &v68[v67];
                v70 = *(_OWORD *)&v205.__r_.__value_.__l.__data_;
                v69->__r_.__value_.__r.__words[2] = v205.__r_.__value_.__r.__words[2];
                *(_OWORD *)&v69->__r_.__value_.__l.__data_ = v70;
                memset(&v205, 0, sizeof(v205));
                __str.__end_ = v69 + 1;
                std::vector<std::string>::__swap_out_circular_buffer(&v173, &__str);
                v71 = v173.__end_;
                std::__split_buffer<std::string>::~__split_buffer(&__str);
                v173.__end_ = v71;
                if (SHIBYTE(v205.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v205.__r_.__value_.__l.__data_);
              }
              else
              {
                v64 = *(_OWORD *)&v205.__r_.__value_.__l.__data_;
                v173.__end_->__r_.__value_.__r.__words[2] = v205.__r_.__value_.__r.__words[2];
                *(_OWORD *)&end->__r_.__value_.__l.__data_ = v64;
                v173.__end_ = end + 1;
              }
              v62 = v13->_backends;
            }
            if ((v62 & 8) != 0)
            {
              scml::ClipEmbeddingClassifier::defaultStructuralIntegrityConfigPath(&v205);
              v72 = v173.__end_;
              if (v173.__end_ >= v173.__end_cap_.__value_)
              {
                v74 = 0xAAAAAAAAAAAAAAABLL * (((char *)v173.__end_ - (char *)v173.__begin_) >> 3);
                v75 = v74 + 1;
                if (v74 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<std::function<NSArray<NSString *> * ()(scml::TextModerationTokenizer const*,NSArray<NSString *> *)>>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * (((char *)v173.__end_cap_.__value_ - (char *)v173.__begin_) >> 3) > v75)
                  v75 = 0x5555555555555556 * (((char *)v173.__end_cap_.__value_ - (char *)v173.__begin_) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * (((char *)v173.__end_cap_.__value_ - (char *)v173.__begin_) >> 3) >= 0x555555555555555)
                  v76 = 0xAAAAAAAAAAAAAAALL;
                else
                  v76 = v75;
                __str.__end_cap_.__value_ = (std::allocator<std::string> *)&v173.__end_cap_;
                if (v76)
                  v77 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v173.__end_cap_, v76);
                else
                  v77 = 0;
                v78 = v77 + v74;
                __str.__first_ = v77;
                __str.__begin_ = v78;
                __str.__end_cap_.__value_ = &v77[v76];
                v79 = *(_OWORD *)&v205.__r_.__value_.__l.__data_;
                v78->__r_.__value_.__r.__words[2] = v205.__r_.__value_.__r.__words[2];
                *(_OWORD *)&v78->__r_.__value_.__l.__data_ = v79;
                memset(&v205, 0, sizeof(v205));
                __str.__end_ = v78 + 1;
                std::vector<std::string>::__swap_out_circular_buffer(&v173, &__str);
                v80 = v173.__end_;
                std::__split_buffer<std::string>::~__split_buffer(&__str);
                v173.__end_ = v80;
                if (SHIBYTE(v205.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v205.__r_.__value_.__l.__data_);
              }
              else
              {
                v73 = *(_OWORD *)&v205.__r_.__value_.__l.__data_;
                v173.__end_->__r_.__value_.__r.__words[2] = v205.__r_.__value_.__r.__words[2];
                *(_OWORD *)&v72->__r_.__value_.__l.__data_ = v73;
                v173.__end_ = v72 + 1;
              }
            }
          }
          else
          {
            -[SCMLImageSanitizerConfiguration clipClassifierConfig](v170, "clipClassifierConfig");
            v61 = (scml *)objc_claimAutoreleasedReturnValue();
            scml::strFromNSString(v61, &__str);
            std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(&v173, (std::string *)&__str, (__int128 *)&__str.__end_cap_, 1uLL);
            if (SHIBYTE(__str.__end_) < 0)
              operator delete(__str.__first_);

          }
          begin = v173.__begin_;
          v81 = v173.__end_;
          if (v173.__begin_ != v173.__end_)
          {
            p_clipEmbeddingClassifiers = &v13->_clipEmbeddingClassifiers;
            v168 = (char *)&v180 + 8;
            do
            {
              scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&__str);
              v84 = __str.__first_;
              v85 = v84;
              v86 = __str.__begin_;
              if ((unint64_t)&__str.__begin_[-1].__r_.__value_.__r.__words[2] + 7 <= 0xFFFFFFFFFFFFFFFDLL
                && os_signpost_enabled((os_log_t)v84))
              {
                v87 = (std::string::size_type)begin;
                if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
                  v87 = begin->__r_.__value_.__r.__words[0];
                LODWORD(v205.__r_.__value_.__l.__data_) = 136315138;
                *(std::string::size_type *)((char *)v205.__r_.__value_.__r.__words + 4) = v87;
                _os_signpost_emit_with_name_impl(&dword_245BFA000, v85, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v86, "SCMLImageSanitizer.init.clip.classify", "config=%s", (uint8_t *)&v205, 0xCu);
              }

              v183[0] = &off_2516E3A98;
              v183[1] = &__str;
              v184 = v183;
              std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&__str.__end_, (uint64_t)v183);
              v89 = v184;
              if (v184 == v183)
              {
                v89 = v183;
                v90 = 4;
              }
              else
              {
                if (!v184)
                  goto LABEL_119;
                v90 = 5;
              }
              (*(void (**)(_QWORD *, uint64_t))(*v89 + 8 * v90))(v89, v88);
LABEL_119:
              v91 = operator new();
              v92 = v91;
              v93 = SHIBYTE(begin->__r_.__value_.__r.__words[2]);
              if (v93 >= 0)
                v94 = begin;
              else
                v94 = (std::vector<std::string>::pointer)begin->__r_.__value_.__r.__words[0];
              if (v93 >= 0)
                size = HIBYTE(begin->__r_.__value_.__r.__words[2]);
              else
                size = begin->__r_.__value_.__l.__size_;
              scml::ClipEmbeddingClassifier::ClipEmbeddingClassifier(v91, v94, size);
              *(_QWORD *)&v180 = v92;
              v96 = (char *)v13->_clipEmbeddingClassifiers.__end_;
              value = (char *)v13->_clipEmbeddingClassifiers.__end_cap_.__value_;
              if (v96 >= value)
              {
                v98 = (v96 - (char *)p_clipEmbeddingClassifiers->__begin_) >> 3;
                v99 = v98 + 1;
                if ((unint64_t)(v98 + 1) >> 61)
                  std::vector<std::function<NSArray<NSString *> * ()(scml::TextModerationTokenizer const*,NSArray<NSString *> *)>>::__throw_length_error[abi:ne180100]();
                v100 = value - (char *)p_clipEmbeddingClassifiers->__begin_;
                if (v100 >> 2 > v99)
                  v99 = v100 >> 2;
                if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF8)
                  v101 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v101 = v99;
                p_end_cap = &v13->_clipEmbeddingClassifiers.__end_cap_;
                if (v101)
                  v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v13->_clipEmbeddingClassifiers.__end_cap_, v101);
                else
                  v102 = 0;
                v103 = (uint64_t *)&v102[8 * v98];
                v104 = &v102[8 * v101];
                v206 = v104;
                *(_QWORD *)&v180 = 0;
                *v103 = v92;
                v105 = v103 + 1;
                v205.__r_.__value_.__r.__words[2] = (std::string::size_type)(v103 + 1);
                v107 = v13->_clipEmbeddingClassifiers.__begin_;
                v106 = v13->_clipEmbeddingClassifiers.__end_;
                if (v106 == v107)
                {
                  v110 = 0;
                  v109 = vdupq_n_s64((unint64_t)v106);
                }
                else
                {
                  do
                  {
                    v108 = *--v106;
                    *v106 = 0;
                    *--v103 = v108;
                  }
                  while (v106 != v107);
                  v109 = *(int64x2_t *)&p_clipEmbeddingClassifiers->__begin_;
                  v105 = (_QWORD *)v205.__r_.__value_.__r.__words[2];
                  v104 = v206;
                  v110 = (scml::ClipEmbeddingClassifier::Impl **)v180;
                }
                v13->_clipEmbeddingClassifiers.__begin_ = v103;
                v13->_clipEmbeddingClassifiers.__end_ = v105;
                *(int64x2_t *)&v205.__r_.__value_.__r.__words[1] = v109;
                v111 = (char *)v13->_clipEmbeddingClassifiers.__end_cap_.__value_;
                v13->_clipEmbeddingClassifiers.__end_cap_.__value_ = v104;
                v206 = v111;
                v205.__r_.__value_.__r.__words[0] = v109.i64[0];
                std::__split_buffer<std::unique_ptr<scml::ClipEmbeddingClassifier>>::~__split_buffer((uint64_t)&v205);
                v13->_clipEmbeddingClassifiers.__end_ = v105;
                if (v110)
                {
                  scml::ClipEmbeddingClassifier::~ClipEmbeddingClassifier(v110);
                  MEMORY[0x249544F58](v112, 0x20C4093837F09);
                }
              }
              else
              {
                *(_QWORD *)&v180 = 0;
                *(_QWORD *)v96 = v92;
                v13->_clipEmbeddingClassifiers.__end_ = v96 + 8;
              }
              scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&__str);
              v113 = (scml::ClipEmbeddingClassifier *)*((_QWORD *)v13->_clipEmbeddingClassifiers.__end_ - 1);
              v172 = 0;
              v172 = (void *)scml::ClipEmbeddingClassifier::embeddingVersion(v113);
              if (std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::find<MADUnifiedEmbeddingVersion>(&v13->_clipImageEncoders.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v172))
              {
                goto LABEL_157;
              }
              scml::ClipImageEncoder::embeddingVersionString(v172, &v205);
              scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&__str);
              v114 = __str.__first_;
              v115 = v114;
              v116 = __str.__begin_;
              if ((unint64_t)&__str.__begin_[-1].__r_.__value_.__r.__words[2] + 7 <= 0xFFFFFFFFFFFFFFFDLL
                && os_signpost_enabled((os_log_t)v114))
              {
                v117 = &v205;
                if ((v205.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v117 = (std::string *)v205.__r_.__value_.__r.__words[0];
                LODWORD(v180) = 136315138;
                *(_QWORD *)((char *)&v180 + 4) = v117;
                _os_signpost_emit_with_name_impl(&dword_245BFA000, v115, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v116, "SCMLImageSanitizer.init.clip.embed", "version=%s", (uint8_t *)&v180, 0xCu);
              }

              v181[0] = &off_2516E3AF0;
              v181[1] = &__str;
              v182 = v181;
              std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&__str.__end_, (uint64_t)v181);
              v119 = v182;
              if (v182 == v181)
              {
                v119 = v181;
                v120 = 4;
                goto LABEL_152;
              }
              if (v182)
              {
                v120 = 5;
LABEL_152:
                (*(void (**)(_QWORD *, uint64_t))(*v119 + 8 * v120))(v119, v118);
              }
              v121 = operator new();
              scml::ClipImageEncoder::ClipImageEncoder(v121, v172);
              v171[1] = 0;
              *(_QWORD *)&v180 = v172;
              *((_QWORD *)&v180 + 1) = v121;
              std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::__emplace_unique_key_args<MADUnifiedEmbeddingVersion,std::pair<MADUnifiedEmbeddingVersion const,std::unique_ptr<scml::ClipImageEncoder>>>((uint64_t)&v13->_clipImageEncoders, (unint64_t *)&v180, (uint64_t *)&v180);
              v122 = (scml::ClipImageEncoder *)*((_QWORD *)&v180 + 1);
              *((_QWORD *)&v180 + 1) = 0;
              if (v122)
              {
                scml::ClipImageEncoder::~ClipImageEncoder(v122);
                MEMORY[0x249544F58](v123, 0x20C4093837F09);
              }
              scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&__str);
              if (SHIBYTE(v205.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v205.__r_.__value_.__l.__data_);
LABEL_157:
              ++begin;
            }
            while (begin != v81);
          }
          __str.__first_ = (std::__split_buffer<std::string>::pointer)&v173;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
          scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&__p);
          backends = v13->_backends;
LABEL_159:
          if ((backends & 1) == 0)
          {
LABEL_233:
            v159 = v199;
            if (v199)
            {
              p_shared_owners = (unint64_t *)&v199->__shared_owners_;
              do
                v161 = __ldaxr(p_shared_owners);
              while (__stlxr(v161 - 1, p_shared_owners));
              if (!v161)
              {
                ((void (*)(std::__shared_weak_count *))v159->__on_zero_shared)(v159);
                std::__shared_weak_count::__release_weak(v159);
              }
            }
            std::__variant_detail::__dtor<std::__variant_detail::__traits<decltype(nullptr),long long,double,std::string,std::vector<scml::Config>,std::unordered_map<std::string,scml::Config>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
            goto LABEL_239;
          }
          scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&__p);
          v124 = (id)__p;
          v125 = v124;
          v126 = *((_QWORD *)&__p + 1);
          if ((unint64_t)(*((_QWORD *)&__p + 1) - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
          {
            LOWORD(__str.__first_) = 0;
            _os_signpost_emit_with_name_impl(&dword_245BFA000, v125, OS_SIGNPOST_INTERVAL_BEGIN, v126, "SCMLImageSanitizer.init.ivs", ", (uint8_t *)&__str, 2u);
          }

          v178[0] = &off_2516E3B48;
          v178[1] = &__p;
          v179 = v178;
          std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v192, (uint64_t)v178);
          v128 = v179;
          if (v179 == v178)
          {
            v129 = 4;
            v128 = v178;
          }
          else
          {
            if (!v179)
            {
LABEL_168:
              LOBYTE(__str.__first_) = 0;
              LOBYTE(__str.__end_cap_.__value_) = 0;
              v130 = (uint64_t *)scml::Config::get<std::vector<scml::Config>>((uint64_t)buf, "ivs_thresholds", 0xEuLL, (uint64_t)&__str);
              if (LOBYTE(__str.__end_cap_.__value_))
              {
                v205.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
                std::vector<scml::Config>::__destroy_vector::operator()[abi:ne180100]((void ***)&v205);
              }
              v132 = *v130;
              for (i = v130[1]; v132 != i; v132 += 64)
              {
                LOWORD(__str.__first_) = 257;
                if (scml::Config::get<BOOL>(v132, "enabled", 7uLL, &__str))
                {
                  LOBYTE(__str.__first_) = 0;
                  LOBYTE(__str.__end_cap_.__value_) = 0;
                  v133 = scml::Config::get<std::string>(v132, "class", 5uLL, (uint64_t)&__str);
                  if (*(char *)(v133 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(&v205, *(const std::string::value_type **)v133, *(_QWORD *)(v133 + 8));
                  }
                  else
                  {
                    v134 = *(_OWORD *)v133;
                    v205.__r_.__value_.__r.__words[2] = *(_QWORD *)(v133 + 16);
                    *(_OWORD *)&v205.__r_.__value_.__l.__data_ = v134;
                  }
                  if (LOBYTE(__str.__end_cap_.__value_) && SHIBYTE(__str.__end_) < 0)
                    operator delete(__str.__first_);
                  LOBYTE(__str.__first_) = 0;
                  LOBYTE(__str.__end_cap_.__value_) = 0;
                  v135 = scml::Config::get<std::string>(v132, "classification_mode", 0x13uLL, (uint64_t)&__str);
                  if (*(char *)(v135 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)&v173, *(const std::string::value_type **)v135, *(_QWORD *)(v135 + 8));
                  }
                  else
                  {
                    v136 = *(_OWORD *)v135;
                    v173.__end_cap_.__value_ = *(std::string **)(v135 + 16);
                    *(_OWORD *)&v173.__begin_ = v136;
                  }
                  if (LOBYTE(__str.__end_cap_.__value_) && SHIBYTE(__str.__end_) < 0)
                    operator delete(__str.__first_);
                  value_high = (std::vector<std::string>::pointer)HIBYTE(v173.__end_cap_.__value_);
                  if (SHIBYTE(v173.__end_cap_.__value_) < 0)
                    value_high = v173.__end_;
                  if ((uint64_t)value_high > 13)
                  {
                    if (value_high == (std::vector<std::string>::pointer)14)
                    {
                      if (SHIBYTE(v173.__end_cap_.__value_) >= 0)
                        v150 = (uint64_t *)&v173;
                      else
                        v150 = (uint64_t *)v173.__begin_;
                      v151 = *v150;
                      v152 = *(uint64_t *)((char *)v150 + 6);
                      if (v151 != 0x6572705F68676968 || v152 != 0x6E6F697369636572)
                      {
LABEL_242:
                        v165 = __cxa_allocate_exception(0x10uLL);
                        std::operator+<char>();
                        MEMORY[0x249544C64](v165, &__str);
                        __cxa_throw(v165, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
                      }
                      v142 = 1;
                    }
                    else
                    {
                      if (value_high != (std::vector<std::string>::pointer)20)
                        goto LABEL_242;
                      v143 = SHIBYTE(v173.__end_cap_.__value_) >= 0 ? &v173 : (std::vector<std::string> *)v173.__begin_;
                      v144 = v143->__begin_;
                      v145 = v143->__end_;
                      v146 = (int)v143->__end_cap_.__value_;
                      v147 = v144 == (std::vector<std::string>::pointer)0x69685F7265707573
                          && v145 == (std::vector<std::string>::pointer)0x69636572705F6867;
                      if (!v147 || v146 != 1852795251)
                        goto LABEL_242;
                      v142 = 0;
                    }
                  }
                  else if (value_high == (std::vector<std::string>::pointer)8)
                  {
                    if (SHIBYTE(v173.__end_cap_.__value_) >= 0)
                      words = &v173;
                    else
                      words = v173.__begin_->__r_.__value_.__r.__words;
                    if (*words != 0x6465636E616C6162)
                      goto LABEL_242;
                    v142 = 2;
                  }
                  else
                  {
                    if (value_high != (std::vector<std::string>::pointer)11)
                      goto LABEL_242;
                    v138 = SHIBYTE(v173.__end_cap_.__value_) >= 0 ? &v173 : (std::vector<std::string> *)v173.__begin_;
                    v139 = v138->__begin_;
                    v140 = *(uint64_t *)((char *)&v138->__begin_ + 3);
                    if (v139 != (std::vector<std::string>::pointer)0x6365725F68676968 || v140 != 0x6C6C616365725F68)
                      goto LABEL_242;
                    v142 = 3;
                  }
                  __str.__first_ = &v205;
                  *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,SCMLClassificationMode>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SCMLClassificationMode>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SCMLClassificationMode>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SCMLClassificationMode>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v13->_ivsThresholds, (unsigned __int8 *)&v205, (uint64_t)&std::piecewise_construct, (__int128 **)&__str)+ 5) = v142;
                  if (SHIBYTE(v173.__end_cap_.__value_) < 0)
                    operator delete(v173.__begin_);
                  if (SHIBYTE(v205.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v205.__r_.__value_.__l.__data_);
                }
              }
              v176[0] = SCMLUseAnyAvailableDevice[0];
              v176[1] = SCMLTrackPerformance[0];
              v177[0] = MEMORY[0x24BDBD1C8];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SCMLImageSanitizerConfiguration trackPerformance](v170, "trackPerformance", v168, a4));
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              v177[1] = v154;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
              v155 = (void *)objc_claimAutoreleasedReturnValue();

              v171[0] = 0;
              v156 = -[SCMLHandler initWithOptions:error:]([SCMLHandler alloc], "initWithOptions:error:", v155, v171);
              v157 = v171[0];
              handler = v13->_handler;
              v13->_handler = v156;

              if (!v13->_handler)
              {
                v167 = __cxa_allocate_exception(0x10uLL);
                scml::makeException("make SCMLHandler failed", 0x17uLL, v157, (uint64_t)v167);
                __cxa_throw(v167, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
              }

              scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&__p);
              goto LABEL_233;
            }
            v129 = 5;
          }
          (*(void (**)(_QWORD *, uint64_t))(*v128 + 8 * v129))(v128, v127);
          goto LABEL_168;
        }
        v58 = 5;
      }
      (*(void (**)(void))(*v57 + 8 * v58))();
      goto LABEL_74;
    }
    scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&__p);
    v37 = (id)__p;
    v38 = v37;
    v39 = *((_QWORD *)&__p + 1);
    if ((unint64_t)(*((_QWORD *)&__p + 1) - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      LOWORD(__str.__first_) = 0;
      _os_signpost_emit_with_name_impl(&dword_245BFA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v39, "SCMLImageSanitizer.init.taboo", ", (uint8_t *)&__str, 2u);
    }

    v189[0] = &off_2516E39E8;
    v189[1] = &__p;
    v190 = v189;
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v192, (uint64_t)v189);
    v40 = v190;
    if (v190 == v189)
    {
      v41 = 4;
      v40 = v189;
    }
    else
    {
      if (!v190)
      {
LABEL_52:
        LOBYTE(__str.__first_) = 0;
        LOBYTE(__str.__end_cap_.__value_) = 0;
        v42 = (uint64_t *)scml::Config::get<std::vector<scml::Config>>((uint64_t)buf, "taboo_thresholds", 0x10uLL, (uint64_t)&__str);
        if (LOBYTE(__str.__end_cap_.__value_))
        {
          v205.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
          std::vector<scml::Config>::__destroy_vector::operator()[abi:ne180100]((void ***)&v205);
        }
        v44 = *v42;
        for (j = v42[1]; v44 != j; v44 += 64)
        {
          LOWORD(__str.__first_) = 257;
          if (scml::Config::get<BOOL>(v44, "enabled", 7uLL, &__str))
          {
            LOBYTE(v173.__begin_) = 0;
            BYTE4(v173.__begin_) = 0;
            v45 = scml::Config::get<float>(v44, "threshold", 9uLL, &v173);
            LOBYTE(__str.__first_) = 0;
            LOBYTE(__str.__end_cap_.__value_) = 0;
            v205.__r_.__value_.__r.__words[0] = scml::Config::get<std::string>(v44, "class", 5uLL, (uint64_t)&__str);
            *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v13->_tabooThresholds, (unsigned __int8 *)v205.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)&v205)+ 10) = v45;
            if (LOBYTE(__str.__end_cap_.__value_))
            {
              if (SHIBYTE(__str.__end_) < 0)
                operator delete(__str.__first_);
            }
          }
        }
        v46 = (VNSession *)objc_alloc_init(MEMORY[0x24BDF9CE8]);
        vnSession = v13->_vnSession;
        v13->_vnSession = v46;

        v48 = v13->_vnSession;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = v50;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v188, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = 0;
        LOBYTE(v48) = -[VNSession prepareForPerformingRequests:error:](v48, "prepareForPerformingRequests:error:", v51, &v174);
        v52 = (std::string *)v174;

        if ((v48 & 1) == 0)
        {
          +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(__str.__first_) = 138412290;
            *(std::__split_buffer<std::string>::pointer *)((char *)&__str.__first_ + 4) = v52;
            _os_log_impl(&dword_245BFA000, v53, OS_LOG_TYPE_DEFAULT, "VNSession warmup failed: %@", (uint8_t *)&__str, 0xCu);
          }

        }
        scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&__p);
        backends = v13->_backends;
        goto LABEL_65;
      }
      v41 = 5;
    }
    (*(void (**)(void))(*v40 + 8 * v41))();
    goto LABEL_52;
  }
LABEL_239:
  +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer", v168);
  v162 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245BFA000, v162, OS_LOG_TYPE_DEFAULT, "End SCMLImageSanitizer init", buf, 2u);
  }

  v163 = v13;
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v202);

  return v163;
}

- (void)updateSanitization:(id)a3 withObservations:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unordered_map<std::string, float, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, float>>> *p_tabooThresholds;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  float v21;
  _BOOL8 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[10];
  void *v42[2];
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v37;
    v34 = *MEMORY[0x24BDF9D40];
    v32 = *MEMORY[0x24BDF9D60];
    v33 = *MEMORY[0x24BDF9F80];
    v30 = *MEMORY[0x24BDF9D78];
    v31 = *MEMORY[0x24BDF9D48];
    v28 = *MEMORY[0x24BDF9D30];
    v29 = *MEMORY[0x24BDF9F88];
    v26 = *MEMORY[0x24BDF9D38];
    v27 = *MEMORY[0x24BDF9F90];
    v25 = *MEMORY[0x24BDF9D68];
    p_tabooThresholds = &self->_tabooThresholds;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 & 1) == 0
        {
          v41[0] = v34;
          v41[1] = v33;
          v42[0] = kSCMLImageSanitizationSignalSignificantEventBlood[0];
          v42[1] = kSCMLImageSanitizationSignalSignificantEventDemonstration[0];
          v41[2] = v32;
          v41[3] = v31;
          v43 = kSCMLImageSanitizationSignalSignificantEventDestruction[0];
          v44 = kSCMLImageSanitizationSignalSignificantEventFireDevastation[0];
          v41[4] = v30;
          v41[5] = v29;
          v45 = kSCMLImageSanitizationSignalSignificantEventFloodDevastation[0];
          v46 = kSCMLImageSanitizationSignalSignificantEventFuneral[0];
          v41[6] = v28;
          v41[7] = v27;
          v47 = kSCMLImageSanitizationSignalSignificantEventHospital[0];
          v48 = kSCMLImageSanitizationSignalSignificantEventReligiousSetting[0];
          v41[8] = v26;
          v41[9] = v25;
          v49 = kSCMLImageSanitizationSignalSignificantEventVehicleCrash[0];
          v50 = kSCMLImageSanitizationSignalSignificantEventWar[0];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 10);
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          v16 = v15;
        else
          v16 = v12;
        v17 = v16;

        v18 = objc_retainAutorelease(v12);
        std::string::basic_string[abi:ne180100]<0>(v42, (char *)objc_msgSend(v18, "UTF8String"));
        v19 = std::__hash_table<std::__hash_value_type<std::string,ik::E5BufferTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::E5BufferTensor>>>::find<std::string>(p_tabooThresholds, (unsigned __int8 *)v42);
        v20 = v19;
        if (SHIBYTE(v43) < 0)
        {
          operator delete(v42[0]);
          if (v20)
          {
LABEL_12:
            objc_msgSend(v11, "confidence");
            v22 = v21 < *((float *)v20 + 10);
            goto LABEL_15;
          }
        }
        else if (v19)
        {
          goto LABEL_12;
        }
        v22 = 1;
LABEL_15:
        objc_msgSend(v11, "confidence");
        v23 = (id)objc_msgSend(v6, "updateSignal:withSafe:withScore:", v17, v22);

        ++v10;
      }
      while (v7 != v10);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v7 = v24;
    }
    while (v24);
  }

}

- (void)updateSanitization:(id)a3 withAnalysisResult:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  void *v21;
  double v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *__p[2];
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = a4;
  objc_msgSend(v26, "scoresForLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
  {
    v10 = 1;
    goto LABEL_17;
  }
  v9 = *(_QWORD *)v30;
  LODWORD(v10) = 1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v26, "scoresForLabels");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "doubleValue");
      v16 = v15;
      v17 = objc_retainAutorelease(v12);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
      v18 = std::__hash_table<std::__hash_value_type<std::string,ik::E5BufferTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::E5BufferTensor>>>::find<std::string>(&self->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
      v19 = v18;
      if (v28 < 0)
      {
        operator delete(__p[0]);
        if (v19)
        {
LABEL_8:
          v20 = +[SCMLHandler isImageSensitiveForLabel:confidenceScore:classificationMode:](SCMLHandler, "isImageSensitiveForLabel:confidenceScore:classificationMode:", v17, *((_QWORD *)v19 + 5), v16) ^ 1;
          goto LABEL_11;
        }
      }
      else if (v18)
      {
        goto LABEL_8;
      }
      v20 = 1;
LABEL_11:
      if (self->_granularity != 1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("jwt"), v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v22 = v16;
        v23 = (id)objc_msgSend(v25, "updateSignal:withSafe:withScore:", v21, v20, v22);

      }
      v10 = v10 & v20;
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v8);
LABEL_17:

  if (self->_granularity == 1)
    v24 = (id)objc_msgSend(v25, "updateSignal:withSafe:", kSCMLImageSanitizationSignalNSFWExplicit[0], v10);

}

- (id)sanitizePixelBuffer:(__CVBuffer *)a3 keepGoing:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  SCMLImageSanitizerRequest *v8;
  void *v9;

  v6 = a4;
  v8 = -[SCMLImageSanitizerRequest initWithPixelBuffer:]([SCMLImageSanitizerRequest alloc], "initWithPixelBuffer:", a3);
  -[SCMLImageSanitizerRequest setKeepGoing:](v8, "setKeepGoing:", v6);
  -[SCMLImageSanitizer sanitizeRequest:error:](self, "sanitizeRequest:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sanitizeRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  size_t Width;
  size_t Height;
  SCMLImageSanitizer *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  SCMLImageSanitizer *v23;
  __int16 v24;
  size_t v25;
  __int16 v26;
  size_t v27;
  _QWORD v28[3];
  _QWORD *v29;
  id v30;
  os_signpost_id_t v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v30);
  v7 = v30;
  v8 = v7;
  v9 = v31;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SCMLImageSanitizer.sanitizePixelBuffer", ", buf, 2u);
  }

  v28[0] = &off_2516E3678;
  v28[1] = &v30;
  v29 = v28;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v32, (uint64_t)v28);
  v10 = v29;
  if (v29 == v28)
  {
    v11 = 4;
    v10 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_9;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_9:
  +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "pixelBuffer"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "pixelBuffer"));
    *(_DWORD *)buf = 134218496;
    v23 = self;
    v24 = 2048;
    v25 = Width;
    v26 = 2048;
    v27 = Height;
    _os_log_impl(&dword_245BFA000, v12, OS_LOG_TYPE_DEFAULT, "Begin sanitizePixelBuffer inst=%p width=%zu height=%zu", buf, 0x20u);
  }

  v21 = 0;
  -[SCMLImageSanitizer _sanitizeRequest:error:](self, "_sanitizeRequest:error:", v6, &v21);
  v15 = (SCMLImageSanitizer *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (v15)
  {
    +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v23 = v15;
      _os_log_impl(&dword_245BFA000, v17, OS_LOG_TYPE_DEFAULT, "End sanitizePixelBuffer %{private}@", buf, 0xCu);
    }

  }
  else
  {
    +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SCMLImageSanitizer sanitizeRequest:error:].cold.1((uint64_t)v16, v18, v19);

    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v30);
  return v15;
}

- (id)_sanitizeRequest:(id)a3 error:(id *)a4
{
  unint64_t backends;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  _QWORD *v8;
  uint64_t v9;
  SCMLHandler *handler;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  _QWORD *v24;
  void *v25;
  scml::ClipEmbeddingClassifier **begin;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  uint8_t *v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  NSSet *excludedSignals;
  std::mutex **v41;
  SCMLImageSanitization *v42;
  NSSet *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  os_signpost_id_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  void *v54;
  double v55;
  uint64_t v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  _QWORD *v61;
  uint64_t v62;
  VNSession *v63;
  id v64;
  _anonymous_namespace_ *v65;
  void *v66;
  void *v67;
  char v68;
  id v69;
  void *v70;
  SCMLImageSanitization *v71;
  SCMLImageSanitization *v72;
  SCMLImageSanitization *v73;
  SCMLImageSanitization *v74;
  uint8_t *v75;
  SCMLImageSanitization *v76;
  void *exception;
  void *v79;
  id v80;
  __CVBuffer *v81;
  scml::ClipEmbeddingClassifier **end;
  char v83;
  SCMLImageSanitization *v84;
  std::mutex ***v86;
  _OWORD v87[2];
  int v88;
  id v89;
  unint64_t v90;
  unint64_t *v91;
  void *__p[2];
  uint64_t v93;
  _QWORD v94[3];
  _QWORD *v95;
  _QWORD v96[3];
  _QWORD *v97;
  _QWORD v98[3];
  _QWORD *v99;
  id v100;
  os_signpost_id_t v101;
  uint64_t v102[4];
  _QWORD v103[3];
  _QWORD *v104;
  uint8_t v105[8];
  os_signpost_id_t v106;
  _QWORD v107[2];
  void *v108;
  void *v109;
  void *v110;
  uint8_t buf[16];
  _OWORD v112[3];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  v81 = (__CVBuffer *)objc_msgSend(v80, "pixelBuffer");
  v83 = objc_msgSend(v80, "keepGoing");
  v84 = -[SCMLImageSanitization initWithGranularOutput:]([SCMLImageSanitization alloc], "initWithGranularOutput:", self->_granularity != 0);
  backends = self->_backends;
  if ((backends & 1) == 0)
    goto LABEL_14;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v105);
  v5 = *(id *)v105;
  v6 = v5;
  v7 = v106;
  if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SCMLImageSanitizer.sanitizePixelBuffer.ivs", ", buf, 2u);
  }

  v103[0] = &off_2516E36D0;
  v103[1] = v105;
  v104 = v103;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v107, (uint64_t)v103);
  v8 = v104;
  if (v104 == v103)
  {
    v9 = 4;
    v8 = v103;
    goto LABEL_9;
  }
  if (v104)
  {
    v9 = 5;
LABEL_9:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
  handler = self->_handler;
  v89 = 0;
  -[SCMLHandler analyzePixelBuffer:error:](handler, "analyzePixelBuffer:error:", v81, &v89);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v89;
  if (v12)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    scml::makeException("Failed to compute IVS", 0x15uLL, v12, (uint64_t)exception);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  -[SCMLImageSanitizer updateSanitization:withAnalysisResult:](self, "updateSanitization:withAnalysisResult:", v84, v11);
  if ((v83 & 1) == 0 && !-[SCMLImageSanitization safe](v84, "safe"))
  {
    v73 = v84;

    goto LABEL_89;
  }

  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v105);
  backends = self->_backends;
LABEL_14:
  if ((backends & 0xC) == 0)
    goto LABEL_72;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v100);
  v13 = v100;
  v14 = v13;
  v15 = v101;
  if (v101 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v105 = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SCMLImageSanitizer.sanitizePixelBuffer.clip", ", v105, 2u);
  }

  v98[0] = &off_2516E3728;
  v98[1] = &v100;
  v99 = v98;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v102, (uint64_t)v98);
  v16 = v99;
  if (v99 == v98)
  {
    v17 = 4;
    v16 = v98;
    goto LABEL_22;
  }
  if (v99)
  {
    v17 = 5;
LABEL_22:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }
  objc_msgSend(v80, "embeddings");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  memset(v87, 0, sizeof(v87));
  v88 = 1065353216;
  *(_OWORD *)buf = 0u;
  memset(v112, 0, sizeof(v112));
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", buf, v105, 16);
  if (v20)
  {
    v21 = **(_QWORD **)&v112[0];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (**(_QWORD **)&v112[0] != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*(_QWORD *)&buf[8] + 8 * i);
        scml::ClipImageEncoder::toEmbeddingVec(v23, (uint64_t)__p);
        v90 = 0;
        v90 = objc_msgSend(v23, "version");
        v91 = &v90;
        v24 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::__emplace_unique_key_args<MADUnifiedEmbeddingVersion,std::piecewise_construct_t const&,std::tuple<MADUnifiedEmbeddingVersion const&>,std::tuple<>>((uint64_t)v87, &v90, (uint64_t)&std::piecewise_construct, (uint64_t **)&v91);
        v25 = (void *)v24[3];
        if (v25)
        {
          v24[4] = v25;
          operator delete(v25);
          v24[3] = 0;
          v24[4] = 0;
          v24[5] = 0;
        }
        *(_OWORD *)(v24 + 3) = *(_OWORD *)__p;
        v24[5] = v93;
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", buf, v105, 16);
    }
    while (v20);
  }

  begin = (scml::ClipEmbeddingClassifier **)self->_clipEmbeddingClassifiers.__begin_;
  end = (scml::ClipEmbeddingClassifier **)self->_clipEmbeddingClassifiers.__end_;
  if (begin != end)
  {
    while (1)
    {
      v91 = 0;
      v86 = (std::mutex ***)begin;
      v91 = (unint64_t *)scml::ClipEmbeddingClassifier::embeddingVersion(*begin);
      v27 = (char *)std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::find<MADUnifiedEmbeddingVersion>(v87, (unint64_t *)&v91);
      if (v27)
        goto LABEL_45;
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v105);
      v28 = *(id *)v105;
      v29 = v28;
      v30 = v106;
      if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_245BFA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SCMLImageSanitizer.sanitizePixelBuffer.clip.embed", ", buf, 2u);
      }

      *(_QWORD *)buf = &off_2516E3FC0;
      *(_QWORD *)&buf[8] = v105;
      *((_QWORD *)&v112[0] + 1) = buf;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v107, (uint64_t)buf);
      v31 = (uint8_t *)*((_QWORD *)&v112[0] + 1);
      if (*((uint8_t **)&v112[0] + 1) == buf)
        break;
      if (*((_QWORD *)&v112[0] + 1))
      {
        v32 = 5;
LABEL_41:
        (*(void (**)(void))(*(_QWORD *)v31 + 8 * v32))();
      }
      v33 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::find<MADUnifiedEmbeddingVersion>(&self->_clipImageEncoders.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v91);
      if (!v33)
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      scml::ClipImageEncoder::getEmbedding((scml::ClipImageEncoder *)v33[3], v81, (uint64_t)__p);
      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v105);
      v27 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::__emplace_unique_key_args<MADUnifiedEmbeddingVersion,MADUnifiedEmbeddingVersion const&,std::vector<float>>((uint64_t)v87, (unint64_t *)&v91, &v91, (uint64_t)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
LABEL_45:
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
      v34 = *(id *)buf;
      v35 = v34;
      v36 = *(_QWORD *)&buf[8];
      if ((unint64_t)(*(_QWORD *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v105 = 0;
        _os_signpost_emit_with_name_impl(&dword_245BFA000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v36, "SCMLImageSanitizer.sanitizePixelBuffer.clip.classify", ", v105, 2u);
      }

      v96[0] = &off_2516E3780;
      v96[1] = buf;
      v97 = v96;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v112, (uint64_t)v96);
      v37 = v97;
      if (v97 == v96)
      {
        v37 = v96;
        v38 = 4;
      }
      else
      {
        if (!v97)
          goto LABEL_53;
        v38 = 5;
      }
      (*(void (**)(void))(*v37 + 8 * v38))();
LABEL_53:
      v39 = v27 + 24;
      excludedSignals = self->_excludedSignals;
      v41 = *v86;
      v42 = v84;
      v43 = excludedSignals;
      scml::ClipEmbeddingClassifier::predict(v41, v39, (uint64_t)v105);
      v44 = scml::ClipEmbeddingClassifier::name((scml::ClipEmbeddingClassifier *)v41);
      v45 = *(_QWORD *)(v44 + 8);
      if (*(char *)(v44 + 23) >= 0)
      {
        v46 = *(unsigned __int8 *)(v44 + 23);
      }
      else
      {
        v44 = *(_QWORD *)v44;
        v46 = v45;
      }
      scml::strToNSString(v44, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "encodeToP1:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v106;
      if (v107[0] != v106)
      {
        v51 = 0;
        v52 = 0;
        do
        {
          v53 = (uint64_t *)(v50 + v51);
          if (*((char *)v53 + 23) < 0)
            v53 = (uint64_t *)*v53;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%s"), v49, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSSet containsObject:](v43, "containsObject:", v54))
            v56 = 1;
          else
            v56 = (*(_QWORD *)((char *)v108 + ((v52 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v52) & 1;
          LODWORD(v55) = *((_DWORD *)v109 + v52);
          v57 = -[SCMLImageSanitization updateSignal:withSafe:withScore:](v42, "updateSignal:withSafe:withScore:", v54, v56, v55);

          ++v52;
          v50 = v106;
          v51 += 24;
        }
        while (v52 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v107[0] - v106) >> 3));
      }

      if (v109)
      {
        v110 = v109;
        operator delete(v109);
      }
      if (v108)
        operator delete(v108);
      __p[0] = &v106;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

      if ((v83 & 1) == 0 && !-[SCMLImageSanitization safe](v42, "safe"))
      {
        v74 = v42;
        scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
        std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::~__hash_table((uint64_t)v87);
        v75 = (uint8_t *)&v100;
        goto LABEL_90;
      }
      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
      begin = (scml::ClipEmbeddingClassifier **)(v86 + 1);
      if (v86 + 1 == (std::mutex ***)end)
        goto LABEL_71;
    }
    v31 = buf;
    v32 = 4;
    goto LABEL_41;
  }
LABEL_71:
  std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::~__hash_table((uint64_t)v87);
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v100);
  backends = self->_backends;
LABEL_72:
  if ((backends & 2) == 0)
  {
LABEL_85:
    v71 = v84;
    v72 = v84;
    goto LABEL_91;
  }
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v105);
  v58 = *(id *)v105;
  v59 = v58;
  v60 = v106;
  if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v59, OS_SIGNPOST_INTERVAL_BEGIN, v60, "SCMLImageSanitizer.sanitizePixelBuffer.taboo", ", buf, 2u);
  }

  v94[0] = &off_2516E37D8;
  v94[1] = v105;
  v95 = v94;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v107, (uint64_t)v94);
  v61 = v95;
  if (v95 == v94)
  {
    v62 = 4;
    v61 = v94;
    goto LABEL_80;
  }
  if (v95)
  {
    v62 = 5;
LABEL_80:
    (*(void (**)(void))(*v61 + 8 * v62))();
  }
  v63 = self->_vnSession;
  v64 = objc_alloc(MEMORY[0x24BDF9C28]);
  v65 = (_anonymous_namespace_ *)(id)objc_msgSend(v64, "initWithCVPixelBuffer:options:session:", v81, MEMORY[0x24BDBD1B8], v63);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  v68 = -[_anonymous_namespace_ performRequests:error:](v65, "performRequests:error:", v67, &v100);
  v69 = v100;

  if ((v68 & 1) == 0)
  {
    v79 = __cxa_allocate_exception(0x10uLL);
    scml::makeException("Failed vision request", 0x15uLL, v69, (uint64_t)v79);
    __cxa_throw(v79, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  objc_msgSend(v66, "results");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCMLImageSanitizer updateSanitization:withObservations:](self, "updateSanitization:withObservations:", v84, v70);
  if ((v83 & 1) != 0 || -[SCMLImageSanitization safe](v84, "safe"))
  {

    scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v105);
    goto LABEL_85;
  }
  v76 = v84;

LABEL_89:
  v75 = v105;
LABEL_90:
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v75);
  v71 = v84;
LABEL_91:

  return v84;
}

- (id)sanitizePixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  SCMLImageSanitizerRequest *v6;
  void *v7;

  v6 = -[SCMLImageSanitizerRequest initWithPixelBuffer:]([SCMLImageSanitizerRequest alloc], "initWithPixelBuffer:", a3);
  -[SCMLImageSanitizer sanitizeRequest:error:](self, "sanitizeRequest:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  vector<std::unique_ptr<scml::ClipEmbeddingClassifier>, std::allocator<std::unique_ptr<scml::ClipEmbeddingClassifier>>> *p_clipEmbeddingClassifiers;

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_ivsThresholds);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_tabooThresholds);
  std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::~__hash_table((uint64_t)&self->_clipImageEncoders);
  p_clipEmbeddingClassifiers = &self->_clipEmbeddingClassifiers;
  std::vector<std::unique_ptr<scml::ClipEmbeddingClassifier>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_clipEmbeddingClassifiers);
  objc_storeStrong((id *)&self->_vnSession, 0);
  objc_storeStrong((id *)&self->_excludedSignals, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 46) = 1065353216;
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
  *result = &off_2516E3B48;
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

- (void)sanitizeRequest:error:
{
}

- (_QWORD)sanitizeRequest:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2516E3678;
  result[1] = v3;
  return result;
}

- (uint64_t)sanitizeRequest:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_sanitizeRequest:error:
{
}

- (_QWORD)_sanitizeRequest:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2516E37D8;
  result[1] = v3;
  return result;
}

- (uint64_t)_sanitizeRequest:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
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
  OUTLINED_FUNCTION_0_0(&dword_245BFA000, a2, v4, "End SCMLImageSanitizer init with error: %s", (uint8_t *)&v5);
}

- (void)initWithConfiguration:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_245BFA000, v0, v1, "ImageSanitizerStructuralIntegrity on", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithConfiguration:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_245BFA000, v0, v1, "ImageSanitizerStructuralIntegrity off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithConfiguration:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_245BFA000, v0, v1, "ImageSanitizerASM on", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithConfiguration:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_245BFA000, v0, v1, "ImageSanitizerASM off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sanitizeRequest:(uint64_t)a3 error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_245BFA000, a2, a3, "End sanitizePixelBuffer with error: %@", (uint8_t *)&v3);
}

@end
