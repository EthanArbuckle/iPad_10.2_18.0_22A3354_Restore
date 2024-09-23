@implementation SNLPEmbedder

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)warmup
{
  NSObject *v3;
  uint64_t v4;
  std::string::size_type v5;
  __int128 v6;
  std::string::size_type v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  void *v20[2];
  char v21;
  void *v22;
  char v23;
  _QWORD v24[3];
  char *v25;
  _BYTE *v26;
  char *v27;
  std::string v28;
  _BYTE v29[27];
  __int128 *v30[7];
  std::string __sz;
  _BYTE v32[27];
  __int128 *v33[7];
  std::string buf;
  _BYTE v35[40];
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  std::string v40;
  _BYTE v41[27];
  std::string v42;
  __int128 v43;
  __int128 v44;
  char v45[8];
  __int128 v46;
  _QWORD v47[4];
  void *v48[3];
  _QWORD v49[6];

  v49[5] = *MEMORY[0x1E0C80C00];
  SNLPOSLoggerForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C2196000, v3, OS_LOG_TYPE_DEBUG, "Warming up SNLPEmbedder", (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&__sz, "hello");
  *(_QWORD *)&v32[8] = 0;
  *(_QWORD *)v32 = 0;
  *(_QWORD *)&v32[16] = 5;
  *(_WORD *)&v32[24] = 0;
  v32[26] = 0;
  memset(v33, 0, sizeof(v33));
  std::string::basic_string[abi:ne180100]<0>(&v28, "world");
  *(_OWORD *)v29 = xmmword_1C230B520;
  *(_QWORD *)&v29[16] = 11;
  *(_WORD *)&v29[24] = 0;
  v29[26] = 0;
  memset(v30, 0, sizeof(v30));
  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&buf, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
  else
    buf = __sz;
  *(_OWORD *)v35 = *(_OWORD *)v32;
  *(_OWORD *)&v35[11] = *(_OWORD *)&v32[11];
  v37 = 0;
  *(_QWORD *)&v35[32] = 0;
  v36 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v35[32], v33[0], v33[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v33[1] - (char *)v33[0]) >> 3));
  v38 = *(_OWORD *)&v33[3];
  v39 = *(_OWORD *)&v33[5];
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v40, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  else
    v40 = v28;
  *(_OWORD *)v41 = *(_OWORD *)v29;
  *(_OWORD *)&v41[11] = *(_OWORD *)&v29[11];
  memset(&v42, 0, sizeof(v42));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v42, v30[0], v30[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v30[1] - (char *)v30[0]) >> 3));
  v43 = *(_OWORD *)&v30[3];
  v44 = *(_OWORD *)&v30[5];
  v26 = 0;
  v27 = 0;
  v25 = 0;
  *(_QWORD *)&v6 = &v25;
  BYTE8(v6) = 0;
  v25 = (char *)operator new(0xE0uLL);
  v26 = v25;
  v27 = v25 + 224;
  v4 = 0;
  v26 = (_BYTE *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlv4_inference_orchestrator::orchestration::Token>,nlv4_inference_orchestrator::orchestration::Token const*,nlv4_inference_orchestrator::orchestration::Token const*,nlv4_inference_orchestrator::orchestration::Token*>((uint64_t)&v27, (uint64_t)&buf, (uint64_t)v45, (uint64_t)v25);
  do
  {
    *(_QWORD *)&v6 = (char *)&v42 + v4 * 8;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
    if (SHIBYTE(v40.__r_.__value_.__r.__words[v4 + 2]) < 0)
      operator delete(*(void **)((char *)&v40.__r_.__value_.__l.__data_ + v4 * 8));
    v4 -= 14;
  }
  while (v4 != -28);
  std::string::basic_string[abi:ne180100]<0>(v20, "hello world");
  std::string::basic_string[abi:ne180100]<0>(&v22, "hello world");
  memset(v24, 0, sizeof(v24));
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__init_with_size[abi:ne180100]<nlv4_inference_orchestrator::orchestration::Token*,nlv4_inference_orchestrator::orchestration::Token*>(v24, (uint64_t)v25, (uint64_t)v26, 0x6DB6DB6DB6DB6DB7 * ((v26 - v25) >> 4));
  memset(&buf, 0, sizeof(buf));
  v41[8] = 0;
  v41[16] = 0;
  v45[0] = 0;
  memset(v48, 0, sizeof(v48));
  v46 = 0u;
  memset(v47, 0, sizeof(v47));
  *(_QWORD *)&v35[24] = 0;
  v36 = 0;
  *(_QWORD *)&v35[32] = 0;
  LOBYTE(v37) = 0;
  sirinluinternal::SubwordTokenChain::SubwordTokenChain((sirinluinternal::SubwordTokenChain *)v49);
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::getEmbeddings((nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)self->_cppOrchestrator.__ptr_.__value_, (const nlv4_inference_orchestrator::orchestration::EmbedderRequest *)v20, (uint64_t)&v6);
  if (buf.__r_.__value_.__r.__words[0])
  {
    buf.__r_.__value_.__l.__size_ = buf.__r_.__value_.__r.__words[0];
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v6;
  v5 = v7;
  v7 = 0;
  v6 = 0uLL;
  *(_OWORD *)v35 = v8;
  buf.__r_.__value_.__r.__words[2] = v5;
  *(_QWORD *)&v35[16] = v9;
  if (SHIBYTE(v36) < 0)
    operator delete(*(void **)&v35[24]);
  *(_OWORD *)&v35[24] = v10;
  v36 = v11;
  HIBYTE(v11) = 0;
  LOBYTE(v10) = 0;
  std::__optional_storage_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>>((uint64_t)&v37, (uint64_t)&v12);
  std::__optional_storage_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>>((uint64_t)&v41[16], (uint64_t)&v13);
  if (SHIBYTE(v47[0]) < 0)
    operator delete((void *)v46);
  v46 = v14;
  v47[0] = v15;
  HIBYTE(v15) = 0;
  LOBYTE(v14) = 0;
  if (SHIBYTE(v47[3]) < 0)
    operator delete((void *)v47[1]);
  *(_OWORD *)&v47[1] = v16;
  v47[3] = v17;
  HIBYTE(v17) = 0;
  LOBYTE(v16) = 0;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__vdeallocate(v48);
  v48[0] = v18;
  *(_OWORD *)&v48[1] = v19;
  v19 = 0uLL;
  v18 = 0;
  sirinluinternal::SubwordTokenChain::operator=();
  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse((void **)&v6);
  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse((void **)&buf.__r_.__value_.__l.__data_);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v24;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v23 < 0)
    operator delete(v22);
  if (v21 < 0)
    operator delete(v20[0]);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v25;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__sz.__r_.__value_.__l.__data_);
}

- (id)initFromAssetDirectoryURL:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v8[8];
  id v9;

  v9 = 0;
  v3 = -[SNLPEmbedder initFromAssetDirectoryURLWithError:error:](self, "initFromAssetDirectoryURLWithError:error:", a3, &v9);
  v4 = v9;
  v5 = v3;
  if (v4)
  {
    SNLPOSLoggerForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C2196000, v6, OS_LOG_TYPE_ERROR, "OWL error in : initFromAssetDirectoryURL", v8, 2u);
    }

  }
  return v5;
}

- (id)initFromAssetDirectoryURLWithError:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[8];
  std::string __p;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SNLPEmbedder;
  v6 = -[SNLPEmbedder init](&v21, sel_init);
  v7 = objc_retainAutorelease(v5);
  *(_QWORD *)buf = objc_msgSend(v7, "fileSystemRepresentation");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, (char **)buf);
  SNLPOSLoggerForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  SNLPOSLoggerForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "OWL Embedder Orchestrator Init", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN \"OWL Embedder Orchestrator Init\", buf, 2u);
  }

  v13 = (nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)operator new();
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::EmbedderOrchestrator(v13, (const std::__fs::filesystem::path *)&__p);
  std::unique_ptr<nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator>::reset[abi:ne180100]((uint64_t *)v6 + 1, (uint64_t)v13);
  SNLPOSLoggerForCategory(7);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v15, OS_SIGNPOST_INTERVAL_END, v9, "OWL Embedder Orchestrator Init", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v16, OS_LOG_TYPE_DEFAULT, "END \"OWL Embedder Orchestrator Init\", buf, 2u);
  }

  v17 = v6;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v17;
}

- (id)initFromSourceVocabPathWithError:(id)a3 bertModelPath:(id)a4 bertConfigPath:(id)a5 reformulatorPath:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v30;
  uint8_t buf[16];
  void *__p;
  char v33;
  void *v34[2];
  char v35;
  void *v36[2];
  char v37;
  void *v38[2];
  char v39;
  objc_super v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v30 = a4;
  v12 = a5;
  v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)SNLPEmbedder;
  v14 = -[SNLPEmbedder init](&v40, sel_init);
  v15 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:ne180100]<0>(v38, (char *)objc_msgSend(v15, "UTF8String"));
  v16 = objc_retainAutorelease(v30);
  std::string::basic_string[abi:ne180100]<0>(v36, (char *)objc_msgSend(v16, "UTF8String"));
  v17 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100]<0>(v34, (char *)objc_msgSend(v17, "UTF8String"));
  v18 = objc_retainAutorelease(v13);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String"));
  SNLPOSLoggerForCategory(7);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  SNLPOSLoggerForCategory(7);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "OWL Embedder Orchestrator Init", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN \"OWL Embedder Orchestrator Init\", buf, 2u);
  }

  v24 = operator new();
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::EmbedderOrchestrator(v24, (uint64_t)v38, (char *)v36, (uint64_t)v34);
  std::unique_ptr<nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator>::reset[abi:ne180100]((uint64_t *)v14 + 1, v24);
  SNLPOSLoggerForCategory(7);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v26, OS_SIGNPOST_INTERVAL_END, v20, "OWL Embedder Orchestrator Init", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v27, OS_LOG_TYPE_DEFAULT, "END \"OWL Embedder Orchestrator Init\", buf, 2u);
  }

  v28 = v14;
  if (v33 < 0)
    operator delete(__p);
  if (v35 < 0)
    operator delete(v34[0]);
  if (v37 < 0)
    operator delete(v36[0]);
  if (v39 < 0)
    operator delete(v38[0]);

  return v28;
}

- (id)initFromSourceVocabPath:(id)a3 bertModelPath:(id)a4 bertConfigPath:(id)a5 reformulatorPath:(id)a6
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  v6 = -[SNLPEmbedder initFromSourceVocabPathWithError:bertModelPath:bertConfigPath:reformulatorPath:error:](self, "initFromSourceVocabPathWithError:bertModelPath:bertConfigPath:reformulatorPath:error:", a3, a4, a5, a6, &v12);
  v7 = v12;
  v8 = v6;
  if (v7)
  {
    SNLPOSLoggerForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C2196000, v9, OS_LOG_TYPE_ERROR, "OWL error in : initFromSourceVocabPath", v11, 2u);
    }

  }
  return v8;
}

- (id)getEmbeddingsBySentenceWithError:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  std::string::size_type v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  _BYTE *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v41;
  id obj;
  void *__p[2];
  uint64_t v44;
  _BYTE v45[32];
  _OWORD v46[12];
  std::string v47;
  std::string v48;
  _QWORD v49[3];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  std::string v55;
  std::string __s;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v57 = 0;
  v59 = 0;
  v41 = a3;
  objc_msgSend(v41, "tokenChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::reserve(&v57, objc_msgSend(v5, "tokensCount"));

  std::string::basic_string[abi:ne180100]<0>(&__s, "");
  std::string::basic_string[abi:ne180100]<0>(&v55, "");
  objc_msgSend(v41, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (!v7)
  {
    objc_msgSend(v41, "text");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1C3BB9634](&__s, objc_msgSend(v8, "UTF8String"));

    objc_msgSend(v41, "text");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1C3BB9634](&v55, objc_msgSend(v9, "UTF8String"));

  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v41, "tokenChain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tokens");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v15 = (void *)objc_opt_class();
        v50 = 0;
        v16 = (char *)objc_msgSend(v15, "getTokenCleanValueString:error:", v14, &v50);
        v17 = v50;
        v18 = v17;
        if (!v16)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v17);

          v32 = 0;
          goto LABEL_41;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, v16);
        *(_QWORD *)v45 = 0;
        *(_QWORD *)&v45[8] = objc_msgSend(v14, "begin");
        *(_QWORD *)&v45[16] = objc_msgSend(v14, "end");
        *(_WORD *)&v45[24] = 0;
        v45[26] = 0;
        memset(v46, 0, 56);
        v19 = v58;
        if (v58 >= v59)
        {
          v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v58 - v57) >> 4);
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) > 0x249249249249249)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v59 - v57) >> 4) > v25)
            v25 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v59 - v57) >> 4);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v59 - v57) >> 4)) >= 0x124924924924924)
            v26 = 0x249249249249249;
          else
            v26 = v25;
          v48.__r_.__value_.__l.__size_ = (std::string::size_type)&v59;
          if (v26)
            v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nlv4_inference_orchestrator::orchestration::Token>>(v26);
          else
            v27 = 0;
          v28 = v26 + 112 * v24;
          v47.__r_.__value_.__r.__words[0] = v26;
          v47.__r_.__value_.__l.__size_ = v28;
          v48.__r_.__value_.__r.__words[0] = v26 + 112 * v27;
          v29 = *(_OWORD *)__p;
          *(_QWORD *)(v28 + 16) = v44;
          *(_OWORD *)v28 = v29;
          __p[1] = 0;
          v44 = 0;
          __p[0] = 0;
          v30 = *(_OWORD *)v45;
          *(_OWORD *)(v28 + 35) = *(_OWORD *)&v45[11];
          *(_OWORD *)(v28 + 24) = v30;
          *(_QWORD *)(v28 + 64) = 0;
          *(_QWORD *)(v28 + 72) = 0;
          *(_QWORD *)(v28 + 56) = 0;
          *(_OWORD *)(v28 + 56) = v46[0];
          *(_QWORD *)(v28 + 72) = *(_QWORD *)&v46[1];
          memset(v46, 0, 24);
          v31 = *(_OWORD *)((char *)&v46[2] + 8);
          *(_OWORD *)(v28 + 80) = *(_OWORD *)((char *)&v46[1] + 8);
          *(_OWORD *)(v28 + 96) = v31;
          v47.__r_.__value_.__r.__words[2] = v28 + 112;
          std::vector<nlv4_inference_orchestrator::orchestration::Token>::__swap_out_circular_buffer(&v57, &v47);
          v23 = v58;
          std::__split_buffer<nlv4_inference_orchestrator::orchestration::Token>::~__split_buffer((uint64_t)&v47);
        }
        else
        {
          v20 = *(_OWORD *)__p;
          *(_QWORD *)(v58 + 16) = v44;
          *(_OWORD *)v19 = v20;
          __p[1] = 0;
          v44 = 0;
          __p[0] = 0;
          v21 = *(_OWORD *)&v45[11];
          *(_OWORD *)(v19 + 24) = *(_OWORD *)v45;
          *(_OWORD *)(v19 + 35) = v21;
          *(_QWORD *)(v19 + 64) = 0;
          *(_QWORD *)(v19 + 72) = 0;
          *(_QWORD *)(v19 + 56) = 0;
          *(_OWORD *)(v19 + 56) = v46[0];
          *(_QWORD *)(v19 + 72) = *(_QWORD *)&v46[1];
          memset(v46, 0, 24);
          v22 = *(_OWORD *)((char *)&v46[2] + 8);
          *(_OWORD *)(v19 + 80) = *(_OWORD *)((char *)&v46[1] + 8);
          *(_OWORD *)(v19 + 96) = v22;
          v23 = v19 + 112;
        }
        v58 = v23;
        v47.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
        if (SHIBYTE(v44) < 0)
          operator delete(__p[0]);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v47, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  else
    v47 = __s;
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v48, v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
  else
    v48 = v55;
  memset(v49, 0, sizeof(v49));
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__init_with_size[abi:ne180100]<nlv4_inference_orchestrator::orchestration::Token*,nlv4_inference_orchestrator::orchestration::Token*>(v49, v57, v58, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v58 - v57) >> 4));
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::getEmbeddingsBySentence((nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)self->_cppOrchestrator.__ptr_.__value_, (const nlv4_inference_orchestrator::orchestration::EmbedderRequest *)&v47, (uint64_t)__p);
  v33 = objc_alloc_init(MEMORY[0x1E0D9FA08]);
  objc_msgSend(v33, "setValues:count:");
  objc_msgSend(v33, "setNumToken:", *(_QWORD *)v45);
  objc_msgSend(v33, "setNumLayer:", *(_QWORD *)&v45[8]);
  objc_msgSend(v33, "setEmbeddingDim:", *(_QWORD *)&v45[16]);
  if (v46[0] >= 0)
    v34 = &v45[24];
  else
    v34 = *(_BYTE **)&v45[24];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setEmbedderId:", v35);

  v32 = objc_alloc_init(MEMORY[0x1E0D9F9C0]);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v37 = objc_alloc_init(MEMORY[0x1E0D9F9C8]);
  objc_msgSend(v37, "setEmbeddingTensor:", v33);
  objc_msgSend(v37, "setEmbeddingDim:", *(_QWORD *)&v45[16]);
  objc_msgSend(v36, "addObject:", v37);
  objc_msgSend(v32, "setEmbeddingTensorOutputs:", v36);
  objc_msgSend(v32, "setEmbeddingTensor:", v33);
  objc_msgSend(v41, "tokenChain");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTokenChain:", v38);

  objc_msgSend(v32, "setNumToken:", *(_QWORD *)v45);
  objc_msgSend(v32, "setNumLayer:", *(_QWORD *)&v45[8]);
  objc_msgSend(v32, "setEmbeddingDim:", *(_QWORD *)&v45[16]);

  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse(__p);
  __p[0] = v49;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
LABEL_41:
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v55.__r_.__value_.__l.__data_);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  __p[0] = &v57;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v32;
}

- (id)getEmbeddingsBySentence:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  -[SNLPEmbedder getEmbeddingsBySentenceWithError:error:](self, "getEmbeddingsBySentenceWithError:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    SNLPOSLoggerForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_ERROR, "OWL error in : getEmbeddingsBySentence", v7, 2u);
    }

  }
  return v3;
}

- (id)getEmbeddingsWithError:(id)a3 error:(id *)a4
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  char *v24;
  id v25;
  void *v26;
  void *v27;
  BOOL v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  std::string::size_type v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint64_t v43;
  id v44;
  _BYTE *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  std::string *p_p;
  void *v51;
  void *v52;
  id v53;
  id v54;
  std::string *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t spid;
  unint64_t v65;
  id v67;
  id obj;
  void *v70;
  uint8_t v71[17];
  uint8_t v72[8];
  void *v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  std::string __p;
  std::string v78;
  std::string v79;
  _QWORD v80[3];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  std::string v86;
  std::string v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  __int128 buf;
  uint64_t v92;
  _BYTE v93[32];
  _BYTE v94[56];
  uint64_t v95;
  std::string v96;
  char v97;
  const void *v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  std::string __s;
  char v103;
  uint64_t v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  SNLPOSLoggerForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  SNLPOSLoggerForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  spid = v5;
  v65 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "OWL Embeddings Overall", ", (uint8_t *)&buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C2196000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN \"OWL Embeddings Overall\", (uint8_t *)&buf, 2u);
  }

  v88 = 0;
  v89 = 0;
  v90 = 0;
  objc_msgSend(v67, "tokenChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::reserve(&v88, objc_msgSend(v9, "tokensCount"));

  std::string::basic_string[abi:ne180100]<0>(&v87, "");
  std::string::basic_string[abi:ne180100]<0>(&v86, "");
  objc_msgSend(v67, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    SNLPOSLoggerForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v67, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1C2196000, v12, OS_LOG_TYPE_DEBUG, "Incoming request.text: %@", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(v67, "text");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");

    if (!v15)
    {
      SNLPOSLoggerForCategory(5);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v67, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1C2196000, v16, OS_LOG_TYPE_ERROR, "Bad request.text: %@", (uint8_t *)&buf, 0xCu);

      }
    }
    MEMORY[0x1C3BB9634](&v87, v15);
    MEMORY[0x1C3BB9634](&v86, v15);
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(v67, "tokenChain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tokens");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v83;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v83 != v20)
          objc_enumerationMutation(obj);
        v22 = *(id *)(*((_QWORD *)&v82 + 1) + 8 * i);
        v23 = (void *)objc_opt_class();
        v81 = 0;
        v24 = (char *)objc_msgSend(v23, "getTokenCleanValueString:error:", v22, &v81);
        v25 = v81;
        v26 = v25;
        if (!v24)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v25);

          v42 = 0;
          goto LABEL_85;
        }
        if ((objc_msgSend(v22, "isWhitespace") & 1) == 0)
        {
          objc_msgSend(v22, "cleanValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length") == 0;

          if (!v28)
          {
            std::string::basic_string[abi:ne180100]<0>(&buf, v24);
            *(_QWORD *)v93 = 0;
            *(_QWORD *)&v93[8] = objc_msgSend(v22, "begin");
            *(_QWORD *)&v93[16] = objc_msgSend(v22, "end");
            *(_WORD *)&v93[24] = 0;
            v93[26] = 0;
            memset(v94, 0, sizeof(v94));
            v29 = v89;
            if (v89 >= v90)
            {
              v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v89 - v88) >> 4);
              v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) > 0x249249249249249)
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v90 - v88) >> 4) > v35)
                v35 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v90 - v88) >> 4);
              if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v90 - v88) >> 4)) >= 0x124924924924924)
                v36 = 0x249249249249249;
              else
                v36 = v35;
              v79.__r_.__value_.__l.__size_ = (std::string::size_type)&v90;
              if (v36)
                v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nlv4_inference_orchestrator::orchestration::Token>>(v36);
              else
                v37 = 0;
              v38 = v36 + 112 * v34;
              v78.__r_.__value_.__r.__words[0] = v36;
              v78.__r_.__value_.__l.__size_ = v38;
              v79.__r_.__value_.__r.__words[0] = v36 + 112 * v37;
              v39 = buf;
              *(_QWORD *)(v38 + 16) = v92;
              *(_OWORD *)v38 = v39;
              v92 = 0;
              buf = 0uLL;
              v40 = *(_OWORD *)v93;
              *(_OWORD *)(v38 + 35) = *(_OWORD *)&v93[11];
              *(_OWORD *)(v38 + 24) = v40;
              *(_QWORD *)(v38 + 64) = 0;
              *(_QWORD *)(v38 + 72) = 0;
              *(_QWORD *)(v38 + 56) = 0;
              *(_OWORD *)(v38 + 56) = *(_OWORD *)v94;
              *(_QWORD *)(v38 + 72) = *(_QWORD *)&v94[16];
              memset(v94, 0, 24);
              v41 = *(_OWORD *)&v94[40];
              *(_OWORD *)(v38 + 80) = *(_OWORD *)&v94[24];
              *(_OWORD *)(v38 + 96) = v41;
              v78.__r_.__value_.__r.__words[2] = v38 + 112;
              std::vector<nlv4_inference_orchestrator::orchestration::Token>::__swap_out_circular_buffer(&v88, &v78);
              v33 = v89;
              std::__split_buffer<nlv4_inference_orchestrator::orchestration::Token>::~__split_buffer((uint64_t)&v78);
            }
            else
            {
              v30 = buf;
              *(_QWORD *)(v89 + 16) = v92;
              *(_OWORD *)v29 = v30;
              v92 = 0;
              buf = 0uLL;
              v31 = *(_OWORD *)&v93[11];
              *(_OWORD *)(v29 + 24) = *(_OWORD *)v93;
              *(_OWORD *)(v29 + 35) = v31;
              *(_QWORD *)(v29 + 64) = 0;
              *(_QWORD *)(v29 + 72) = 0;
              *(_QWORD *)(v29 + 56) = 0;
              *(_OWORD *)(v29 + 56) = *(_OWORD *)v94;
              *(_QWORD *)(v29 + 72) = *(_QWORD *)&v94[16];
              memset(v94, 0, 24);
              v32 = *(_OWORD *)&v94[40];
              *(_OWORD *)(v29 + 80) = *(_OWORD *)&v94[24];
              *(_OWORD *)(v29 + 96) = v32;
              v33 = v29 + 112;
            }
            v89 = v33;
            v78.__r_.__value_.__r.__words[0] = (std::string::size_type)v94;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
            if (SHIBYTE(v92) < 0)
              operator delete((void *)buf);
          }
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
      if (v19)
        continue;
      break;
    }
  }

  if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v78, v87.__r_.__value_.__l.__data_, v87.__r_.__value_.__l.__size_);
  else
    v78 = v87;
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v79, v86.__r_.__value_.__l.__data_, v86.__r_.__value_.__l.__size_);
  else
    v79 = v86;
  memset(v80, 0, sizeof(v80));
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__init_with_size[abi:ne180100]<nlv4_inference_orchestrator::orchestration::Token*,nlv4_inference_orchestrator::orchestration::Token*>(v80, v88, v89, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v89 - v88) >> 4));
  v43 = *(_QWORD *)(*((_QWORD *)self->_cppOrchestrator.__ptr_.__value_ + 23) + 8);
  (*(void (**)(uint64_t))(*(_QWORD *)v43 + 56))(v43);
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::getEmbeddings((nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)self->_cppOrchestrator.__ptr_.__value_, (const nlv4_inference_orchestrator::orchestration::EmbedderRequest *)&v78, (uint64_t)&buf);
  v44 = objc_alloc_init(MEMORY[0x1E0D9FA08]);
  objc_msgSend(v44, "setValues:count:");
  objc_msgSend(v44, "setNumToken:", *(_QWORD *)v93);
  objc_msgSend(v44, "setNumLayer:", *(_QWORD *)&v93[8]);
  objc_msgSend(v44, "setEmbeddingDim:", *(_QWORD *)&v93[16]);
  if (v94[15] >= 0)
    v45 = &v93[24];
  else
    v45 = *(_BYTE **)&v93[24];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setEmbedderId:", v46);

  v42 = objc_alloc_init(MEMORY[0x1E0D9F9C0]);
  objc_msgSend(v42, "setEmbeddingTensor:", v44);
  objc_msgSend(v67, "tokenChain");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTokenChain:", v47);

  objc_msgSend(v42, "setNumToken:", *(_QWORD *)v93);
  objc_msgSend(v42, "setNumLayer:", *(_QWORD *)&v93[8]);
  objc_msgSend(v42, "setEmbeddingDim:", *(_QWORD *)&v93[16]);
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v48 = objc_alloc_init(MEMORY[0x1E0D9F9C8]);
  objc_msgSend(v48, "setEmbeddingTensor:", v44);
  objc_msgSend(v48, "setEmbeddingDim:", *(_QWORD *)&v93[16]);
  if (v103)
  {
    v49 = objc_alloc_init(MEMORY[0x1E0D9FA08]);
    if (!v103)
      std::__throw_bad_optional_access[abi:ne180100]();
    *(_QWORD *)v72 = 0;
    v73 = 0;
    v74 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v72, v98, v99, (v99 - (uint64_t)v98) >> 2);
    v75 = v100;
    v76 = v101;
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    else
      __p = __s;
    objc_msgSend(v49, "setValues:count:");
    objc_msgSend(v49, "setNumToken:", (_QWORD)v75);
    objc_msgSend(v49, "setNumLayer:", *((_QWORD *)&v75 + 1));
    objc_msgSend(v49, "setEmbeddingDim:", v76);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setEmbedderId:", v51);

    objc_msgSend(v48, "setSentenceEmbeddingTensor:", v49);
    objc_msgSend(v42, "setSentenceEmbeddingTensor:", v49);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (*(_QWORD *)v72)
    {
      v73 = *(void **)v72;
      operator delete(*(void **)v72);
    }

  }
  objc_msgSend(v70, "addObject:", v48);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v53 = objc_alloc_init(MEMORY[0x1E0D9F9C8]);
  if (v97)
  {
    v54 = objc_alloc_init(MEMORY[0x1E0D9FA08]);
    if (!v97)
      std::__throw_bad_optional_access[abi:ne180100]();
    *(_QWORD *)v72 = 0;
    v73 = 0;
    v74 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v72, *(const void **)&v94[16], *(uint64_t *)&v94[24], (uint64_t)(*(_QWORD *)&v94[24] - *(_QWORD *)&v94[16]) >> 2);
    v75 = *(_OWORD *)&v94[40];
    v76 = v95;
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v96.__r_.__value_.__l.__data_, v96.__r_.__value_.__l.__size_);
    else
      __p = v96;
    objc_msgSend(v54, "setValues:count:");
    objc_msgSend(v54, "setNumToken:", (_QWORD)v75);
    objc_msgSend(v54, "setNumLayer:", *((_QWORD *)&v75 + 1));
    objc_msgSend(v54, "setEmbeddingDim:", v76);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v55 = &__p;
    else
      v55 = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setEmbedderId:", v56);

    objc_msgSend(v53, "setEmbeddingTensor:", v54);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (*(_QWORD *)v72)
    {
      v73 = *(void **)v72;
      operator delete(*(void **)v72);
    }

  }
  objc_msgSend(v52, "addObject:", v53);
  objc_msgSend(v42, "setSubwordEmbeddingTensorOutputs:", v52);
  objc_msgSend(v42, "setEmbeddingTensorOutputs:", v70);
  MEMORY[0x1C3BB84DC](v71, &v104);
  +[SNLPEmbedder convertCppSubwordTokenChainToObjC:](SNLPEmbedder, "convertCppSubwordTokenChainToObjC:", v71);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1C3BB84F4](v71);
  objc_msgSend(v67, "tokenChain");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "locale");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setLocale:", v59);

  objc_msgSend(v42, "setSubwordTokenChain:", v57);
  SNLPOSLoggerForCategory(7);
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)v72 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v61, OS_SIGNPOST_INTERVAL_END, spid, "OWL Embeddings Overall", ", v72, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v72 = 0;
    _os_log_impl(&dword_1C2196000, v62, OS_LOG_TYPE_DEFAULT, "END \"OWL Embeddings Overall\", v72, 2u);
  }

  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse((void **)&buf);
  *(_QWORD *)&buf = v80;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v79.__r_.__value_.__l.__data_);
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v78.__r_.__value_.__l.__data_);
LABEL_85:
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v86.__r_.__value_.__l.__data_);
  if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v87.__r_.__value_.__l.__data_);
  *(_QWORD *)&buf = &v88;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);

  return v42;
}

- (id)getEmbeddings:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  -[SNLPEmbedder getEmbeddingsWithError:error:](self, "getEmbeddingsWithError:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    SNLPOSLoggerForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_ERROR, "OWL error in : getEmbeddings", v7, 2u);
    }

  }
  return v3;
}

- (void).cxx_destruct
{
  std::unique_ptr<nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator>::reset[abi:ne180100]((uint64_t *)&self->_cppOrchestrator, 0);
}

+ (id)convertCppSubwordTokenChainToObjC:(SubwordTokenChain *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (PB::Writer *)operator new();
  PB::Writer::Writer(v4);
  sirinluinternal::SubwordTokenChain::writeTo((sirinluinternal::SubwordTokenChain *)a3, v4);
  v5 = *((_QWORD *)v4 + 1);
  v6 = objc_alloc(MEMORY[0x1E0D9FA90]);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

  PB::Writer::~Writer(v4);
  MEMORY[0x1C3BB9B44]();
  return v8;
}

+ (const)getTokenCleanValueString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  unint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "hasCleanValue")
    || (objc_msgSend(v5, "cleanValue"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    if (a4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D68];
      v27[0] = *MEMORY[0x1E0CB2D50];
      v27[1] = v17;
      v28[0] = CFSTR("Encountered a token without a clean value");
      v28[1] = CFSTR("Encountered a token without a clean value");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("SNLPNaturalLanguageParserErrorDomain"), 2, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "cleanValue");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  if (!v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        objc_msgSend(v5, "cleanValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (i >= v12)
          break;
        objc_msgSend(v5, "cleanValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "characterAtIndex:", i);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%x]"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v15);

      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_retainAutorelease(v9);
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Hit invalid token clean value: %s"), objc_msgSend(v18, "UTF8String"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D68];
      v25[0] = *MEMORY[0x1E0CB2D50];
      v25[1] = v23;
      v26[0] = v21;
      v26[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("SNLPNaturalLanguageParserErrorDomain"), 2, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

@end
