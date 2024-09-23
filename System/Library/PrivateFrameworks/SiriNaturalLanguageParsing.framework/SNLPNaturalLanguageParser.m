@implementation SNLPNaturalLanguageParser

- (id)_initWithCppOrchestrator:()unique_ptr<nlv4_inference_orchestrator:(std::default_delete<nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator>>)a3 :orchestration::NLv4InferenceOrchestrator
{
  id v4;
  void *v5;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SNLPNaturalLanguageParser;
  v4 = -[SNLPNaturalLanguageParser init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator>::reset[abi:ne180100]((nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator **)v4 + 1, v6);
  }
  return v5;
}

- (id)inferenceResponseForRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NLv4InferenceOrchestrator *value;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v28[8];
  uint64_t v29;
  uint8_t buf[8];
  _QWORD v31[2];
  _QWORD v32[7];

  v32[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SNLPOSLoggerForCategory(7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  SNLPOSLoggerForCategory(7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SNLPNaturalLanguageParser inferenceResponseForRequest", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN \"SNLPNaturalLanguageParser inferenceResponseForRequest\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D9FAD8], "convertNLv4ParserRequestToCpp:", v6);
  value = self->_cppOrchestrator.__ptr_.__value_;
  v13 = *(_QWORD *)buf;
  *(_QWORD *)buf = 0;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator::pbhandle((uint64_t)value);
  v29 = *(_QWORD *)v28;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  if (*(_QWORD *)v28)
  {
    objc_msgSend(MEMORY[0x1E0D9FAD8], "convertNLv4ParserResponseFromCppToObjC:", &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SNLPOSLoggerForCategory(7);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C2196000, v16, OS_SIGNPOST_INTERVAL_END, v8, "SNLPNaturalLanguageParser inferenceResponseForRequest", ", v28, 2u);
    }

    SNLPOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1C2196000, v17, OS_LOG_TYPE_DEFAULT, "END \"SNLPNaturalLanguageParser inferenceResponseForRequest\", v28, 2u);
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "requestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "highInt");
    objc_msgSend(v6, "requestId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("NLv4InferenceOrchestrator::pbhandle returned nullptrfor request (high=%llu, low=%llu)"), v20, objc_msgSend(v21, "lowInt"));
    v17 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D68];
    v31[0] = *MEMORY[0x1E0CB2D50];
    v31[1] = v23;
    v32[0] = v17;
    v32[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("SNLPNaturalLanguageParserErrorDomain"), 2, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }

  v25 = v29;
  v29 = 0;
  if (v25)
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  v26 = *(_QWORD *)buf;
  *(_QWORD *)buf = 0;
  if (v26)
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);

  return v14;
}

- (void).cxx_destruct
{
  std::unique_ptr<nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator>::reset[abi:ne180100]((nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator **)&self->_cppOrchestrator, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

+ (id)parserFromAssetDirectory:(id)a3 error:(id *)a4
{
  objc_msgSend(a1, "parserFromAssetDirectory:metadata:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)parserFromAssetDirectory:(id)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v21;
  id v22;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v23;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v24;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v26;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *v27[2];
  std::string v28;
  std::string v29;
  std::string __p;
  int v31;
  std::string v32;
  std::string buf;
  std::string v34;
  std::string v35;
  int v36;
  char v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  SNLPOSLoggerForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C2196000, v10, OS_LOG_TYPE_DEBUG, "Calling parser setup", (uint8_t *)&buf, 2u);
  }

  if (v8)
  {
    v11 = objc_retainAutorelease(v8);
    v28.__r_.__value_.__r.__words[0] = objc_msgSend(v11, "fileSystemRepresentation");
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v28.__r_.__value_.__l.__data_);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    buf.__r_.__value_.__r.__words[0] = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v32, &buf.__r_.__value_.__l.__data_);
    if (v9)
    {
      SNLPOSLoggerForCategory(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1C2196000, v12, OS_LOG_TYPE_DEBUG, "Attempt to convert metadata", (uint8_t *)&buf, 2u);
      }

      snlp::common::espresso_inference::e5ml::selflogging::convertMetadata(v9, (uint64_t)&v28);
      SNLPOSLoggerForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1C2196000, v13, OS_LOG_TYPE_DEBUG, "Converted metadata", (uint8_t *)&buf, 2u);
      }

      v14 = (nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *)operator new();
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&buf, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
      else
        buf = v28;
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v34, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
      else
        v34 = v29;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v35, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v35 = __p;
      v36 = v31;
      v37 = 1;
      nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator::NLv4InferenceOrchestrator((uint64_t)v14, (uint64_t)&v32, (__int128 *)&buf);
      std::__optional_destruct_base<snlp::common::selflogging::NLXSchemaNLXClientEventMetadata,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
      v27[0] = v14;
      v27[1] = 0;
      v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCppOrchestrator:", v27);
      v24 = v27[0];
      v27[0] = 0;
      if (v24)
      {
        nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator::~NLv4InferenceOrchestrator(v24);
        MEMORY[0x1C3BB9B44]();
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28.__r_.__value_.__l.__data_);
    }
    else
    {
      v21 = (nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator *)operator new();
      buf.__r_.__value_.__s.__data_[0] = 0;
      v37 = 0;
      nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator::NLv4InferenceOrchestrator((uint64_t)v21, (uint64_t)&v32, (__int128 *)&buf);
      v28.__r_.__value_.__r.__words[0] = (std::string::size_type)v21;
      std::__optional_destruct_base<snlp::common::selflogging::NLXSchemaNLXClientEventMetadata,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
      v22 = objc_alloc((Class)a1);
      v28.__r_.__value_.__r.__words[0] = 0;
      v26 = v21;
      v20 = (void *)objc_msgSend(v22, "_initWithCppOrchestrator:", &v26);
      v23 = v26;
      v26 = 0;
      if (v23)
      {
        nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator::~NLv4InferenceOrchestrator(v23);
        MEMORY[0x1C3BB9B44]();
      }
    }
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v32.__r_.__value_.__l.__data_);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NLv4 was provided with a nil asset path.  As a result, the NLv4 model could not be set up.  Please provide a non-nil NLv4 model asset path instead."));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D68];
      v38[0] = *MEMORY[0x1E0CB2D50];
      v38[1] = v18;
      v39[0] = v15;
      v39[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("SNLPNaturalLanguageParserErrorDomain"), 2, v19);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0;
  }

  return v20;
}

@end
