@implementation SNLPITFMClassifier

- (SNLPITFMClassifier)initWithModelBundle:(id)a3 modelInfo:(id)a4 initializationBlock:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  SNLPITFMClassifier *v15;
  SNLPITFMClassifier *v16;
  ITFMOrchestrator *v17;
  ITFMOrchestrator *value;
  uint64_t v19;
  SNLPITFMClassifier *v20;
  ITFMOrchestrator *v21;
  SNLPAssetLogger *v23;
  objc_super v24;
  id v25;
  ITFMOrchestrator *v26;

  v11 = a3;
  v12 = a4;
  v25 = 0;
  (*((void (**)(ITFMOrchestrator **__return_ptr, id, id, id, id *))a5 + 2))(&v26, a5, v11, v12, &v25);
  v13 = v25;
  v14 = v13;
  if (v26)
  {
    v24.receiver = self;
    v24.super_class = (Class)SNLPITFMClassifier;
    v15 = -[SNLPITFMClassifier init](&v24, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_modelBundle, a3);
      objc_storeStrong((id *)&v16->_modelInfo, a4);
      v17 = v26;
      v26 = 0;
      value = v16->_orchestrator.__ptr_.__value_;
      v16->_orchestrator.__ptr_.__value_ = v17;
      if (value)
        (*(void (**)(ITFMOrchestrator *))(*(_QWORD *)value + 16))(value);
      -[SNLPITFMClassifier _setupAssetLogger](v16, "_setupAssetLogger");
      v19 = (uint64_t)v16->_assetLogger.__ptr_.__value_;
      v16->_assetLogger.__ptr_.__value_ = v23;
      if (v19)
        std::default_delete<snlp::common::asset_logger::SNLPAssetLogger>::operator()[abi:ne180100](v19);
    }
    self = v16;
    v20 = self;
  }
  else
  {
    if (!a6)
    {
      v20 = 0;
      goto LABEL_13;
    }
    v20 = 0;
    *a6 = objc_retainAutorelease(v13);
  }
  v21 = v26;
  v26 = 0;
  if (v21)
    (*(void (**)(ITFMOrchestrator *))(*(_QWORD *)v21 + 16))(v21);
LABEL_13:

  return v20;
}

- (unique_ptr<snlp::common::asset_logger::SNLPAssetLogger,)_setupAssetLogger
{
  snlp::common::asset_logger::SNLPAssetLogger **v2;
  snlp::common::asset_logger::SNLPAssetLogger **v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  char *v12;
  NSObject *v13;
  std::string *v14;
  __int128 v15;
  NSObject *v16;
  void **v17;
  std::string *p_buf;
  char *v19;
  NSObject *v20;
  __int128 v21;
  unsigned __int8 v22;
  uint64_t v23;
  __int128 v24;
  _BYTE *v25;
  int data;
  _BYTE *v27;
  int v28;
  uint64_t *v29;
  int v30;
  unsigned __int8 *v31;
  std::string::value_type v32;
  const std::string **v33;
  void *v34;
  std::string *v35;
  __int128 v36;
  NSObject *v37;
  void **v38;
  std::string *v39;
  std::string *v40;
  __int128 v41;
  void **v42;
  std::string *v43;
  int v44;
  id v45;
  char *v46;
  snlp::common::asset_logger::SNLPAssetLogger *v47;
  NSObject *v48;
  unsigned int v49;
  signed int v50;
  const char *v51;
  NSObject *v52;
  void *v53;
  std::string *v54;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  int v60;
  void *v61;
  char v62;
  _BYTE v63[32];
  unsigned __int8 v64[8];
  std::string::size_type *v65;
  void *v66[2];
  char v67;
  std::string v68;
  void *v69[2];
  char v70;
  std::string __p;
  std::string *v72;
  _BYTE v73[392];
  uint64_t v74;
  std::string v75;
  std::string buf;
  _QWORD v77[3];
  int v78;
  std::string v79;
  unint64_t v80;
  uint64_t v81;

  v4 = v2;
  v81 = *MEMORY[0x1E0C80C00];
  -[SNLPITFMModelBundle versionURL](self->_modelBundle, "versionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  buf.__r_.__value_.__r.__words[0] = objc_msgSend(v6, "UTF8String");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, &buf.__r_.__value_.__l.__data_);
  getAssetDirectoryNCV((const std::__fs::filesystem::path *)&__p, (uint64_t)v63);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  -[SNLPITFMModelBundle configURL](self->_modelBundle, "configURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v61, (char *)objc_msgSend(v8, "UTF8String"));

  -[SNLPITFMModelBundle configURL](self->_modelBundle, "configURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingLastPathComponent");
  v57 = (id)objc_claimAutoreleasedReturnValue();

  v11 = -[SNLPITFMModelInfo loggingComponent](self->_modelInfo, "loggingComponent");
  std::ifstream::basic_ifstream(&__p);
  if (v11 >= 8)
  {
    SNLPOSLoggerForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"<UNDEFINED_COMPONENT>";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v11;
      _os_log_impl(&dword_1C2196000, v13, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", (uint8_t *)&buf, 0x16u);
    }

    v12 = "<UNDEFINED_COMPONENT>";
  }
  else
  {
    v12 = off_1E7BED840[v11];
  }
  std::string::basic_string[abi:ne180100]<0>(v66, v12);
  if ((v73[*(_QWORD *)(__p.__r_.__value_.__r.__words[0] - 24)] & 5) != 0)
  {
    std::operator+<char>();
    v14 = std::string::append(&v79, ".");
    v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    buf.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v79.__r_.__value_.__l.__data_);
    SNLPOSLoggerForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v66;
      if (v67 < 0)
        v17 = (void **)v66[0];
      p_buf = &buf;
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
      LODWORD(v79.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)v79.__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
      WORD2(v79.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&v79.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_buf;
      _os_log_impl(&dword_1C2196000, v16, OS_LOG_TYPE_ERROR, "[%s] %s", (uint8_t *)&v79, 0x16u);
    }

    v58 = 0u;
    v59 = 0u;
    v60 = 1065353216;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    goto LABEL_97;
  }
  v64[0] = 0;
  v65 = 0;
  nlohmann::operator>>(&__p, v64);
  v58 = 0u;
  v59 = 0u;
  v60 = 1065353216;
  if (v11 >= 8)
  {
    SNLPOSLoggerForCategory(4);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"<UNDEFINED_COMPONENT>";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v11;
      _os_log_impl(&dword_1C2196000, v20, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", (uint8_t *)&buf, 0x16u);
    }

    v19 = "<UNDEFINED_COMPONENT>";
  }
  else
  {
    v19 = off_1E7BED840[v11];
  }
  std::string::basic_string[abi:ne180100]<0>(v69, v19);
  v79.__r_.__value_.__r.__words[0] = (std::string::size_type)v64;
  *(_OWORD *)&v79.__r_.__value_.__r.__words[1] = 0uLL;
  v80 = 0x8000000000000000;
  v22 = v64[0];
  if (v64[0])
  {
    if (v64[0] == 2)
    {
      v79.__r_.__value_.__r.__words[2] = *v65;
    }
    else if (v64[0] == 1)
    {
      v79.__r_.__value_.__l.__size_ = *v65;
    }
    else
    {
      v80 = 0;
    }
  }
  else
  {
    v80 = 1;
  }
  *(_QWORD *)&v21 = 136315394;
  v56 = v21;
  while (1)
  {
    *(_OWORD *)&buf.__r_.__value_.__r.__words[1] = 0uLL;
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v64;
    v77[0] = 0x8000000000000000;
    if (v22 == 2)
    {
      buf.__r_.__value_.__r.__words[2] = v65[1];
    }
    else if (v22 == 1)
    {
      buf.__r_.__value_.__l.__size_ = (std::string::size_type)(v65 + 1);
    }
    else
    {
      v77[0] = 1;
    }
    if (nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>,(decltype(nullptr))0>((unsigned __int8 **)&v79, (unsigned __int8 **)&buf))
    {
      break;
    }
    v23 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key(*v79.__r_.__value_.__l.__data_, v79.__r_.__value_.__l.__size_);
    if (*(char *)(v23 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v68, *(const std::string::value_type **)v23, *(_QWORD *)(v23 + 8));
    }
    else
    {
      v24 = *(_OWORD *)v23;
      v68.__r_.__value_.__r.__words[2] = *(_QWORD *)(v23 + 16);
      *(_OWORD *)&v68.__r_.__value_.__l.__data_ = v24;
    }
    if (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79) == 5)
    {
      v25 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79);
      LODWORD(buf.__r_.__value_.__l.__data_) = 0;
      nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,int,0>(v25, (int *)&buf);
      data = (int)buf.__r_.__value_.__l.__data_;
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&buf, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
      else
        buf = v68;
      LODWORD(v77[0]) = data;
      v78 = 0;
      std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<int,unsigned int,float,BOOL,std::string>>>((uint64_t)&v58, (unsigned __int8 *)&buf, (uint64_t)&buf);
      goto LABEL_76;
    }
    if (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79) == 6)
    {
      v27 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79);
      LODWORD(buf.__r_.__value_.__l.__data_) = 0;
      nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,unsigned int,0>(v27, (unsigned int *)&buf);
      v28 = (int)buf.__r_.__value_.__l.__data_;
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&buf, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
      else
        buf = v68;
      LODWORD(v77[0]) = v28;
      v78 = 1;
      std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<int,unsigned int,float,BOOL,std::string>>>((uint64_t)&v58, (unsigned __int8 *)&buf, (uint64_t)&buf);
      goto LABEL_76;
    }
    if (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79) == 7)
    {
      v29 = (uint64_t *)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79);
      LODWORD(buf.__r_.__value_.__l.__data_) = 0;
      nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,float,0>(v29, (float *)&buf);
      v30 = (int)buf.__r_.__value_.__l.__data_;
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&buf, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
      else
        buf = v68;
      LODWORD(v77[0]) = v30;
      v78 = 2;
      std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<int,unsigned int,float,BOOL,std::string>>>((uint64_t)&v58, (unsigned __int8 *)&buf, (uint64_t)&buf);
      goto LABEL_76;
    }
    if (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79) == 4)
    {
      v31 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79);
      buf.__r_.__value_.__s.__data_[0] = 0;
      nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v31, &buf);
      v32 = buf.__r_.__value_.__s.__data_[0];
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&buf, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
      else
        buf = v68;
      LOBYTE(v77[0]) = v32;
      v78 = 3;
      std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<int,unsigned int,float,BOOL,std::string>>>((uint64_t)&v58, (unsigned __int8 *)&buf, (uint64_t)&buf);
LABEL_76:
      std::__variant_detail::__dtor<std::__variant_detail::__traits<int,unsigned int,float,BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v77);
LABEL_77:
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_80;
      v34 = (void *)buf.__r_.__value_.__r.__words[0];
      goto LABEL_79;
    }
    if (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79) != 3)
    {
      if (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79))
      {
        std::operator+<char>();
        v35 = std::string::append(&v75, ".");
        v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
        buf.__r_.__value_.__r.__words[2] = v35->__r_.__value_.__r.__words[2];
        *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v36;
        v35->__r_.__value_.__l.__size_ = 0;
        v35->__r_.__value_.__r.__words[2] = 0;
        v35->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v75.__r_.__value_.__l.__data_);
        SNLPOSLoggerForCategory(4);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = v69;
          if (v70 < 0)
            v38 = (void **)v69[0];
          v39 = &buf;
          if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v39 = (std::string *)buf.__r_.__value_.__r.__words[0];
          LODWORD(v75.__r_.__value_.__l.__data_) = v56;
          *(std::string::size_type *)((char *)v75.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          WORD2(v75.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v75.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v39;
          _os_log_impl(&dword_1C2196000, v37, OS_LOG_TYPE_DEBUG, "[%s] %s", (uint8_t *)&v75, 0x16u);
        }
      }
      else
      {
        std::operator+<char>();
        v40 = std::string::append(&v75, " is null.  This is currently expected behaviour.");
        v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
        buf.__r_.__value_.__r.__words[2] = v40->__r_.__value_.__r.__words[2];
        *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v41;
        v40->__r_.__value_.__l.__size_ = 0;
        v40->__r_.__value_.__r.__words[2] = 0;
        v40->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v75.__r_.__value_.__l.__data_);
        SNLPOSLoggerForCategory(4);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v42 = v69;
          if (v70 < 0)
            v42 = (void **)v69[0];
          v43 = &buf;
          if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v43 = (std::string *)buf.__r_.__value_.__r.__words[0];
          LODWORD(v75.__r_.__value_.__l.__data_) = v56;
          *(std::string::size_type *)((char *)v75.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
          WORD2(v75.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v75.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v43;
          _os_log_impl(&dword_1C2196000, v37, OS_LOG_TYPE_DEBUG, "[%s] %s", (uint8_t *)&v75, 0x16u);
        }
      }

      goto LABEL_77;
    }
    v33 = (const std::string **)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((uint64_t)&v79);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get_impl<std::string,0>(&v75, v33);
    std::pair<std::string const,std::variant<int,unsigned int,float,BOOL,std::string>>::pair[abi:ne180100]<std::string&,std::string const&,0>(&buf, (__int128 *)&v68, (__int128 *)&v75);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<int,unsigned int,float,BOOL,std::string>>>((uint64_t)&v58, (unsigned __int8 *)&buf, (uint64_t)&buf);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<int,unsigned int,float,BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v77);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    {
      v34 = (void *)v75.__r_.__value_.__r.__words[0];
LABEL_79:
      operator delete(v34);
    }
LABEL_80:
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v68.__r_.__value_.__l.__data_);
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator++((unsigned __int8 **)&v79);
    v22 = v64[0];
  }
  std::string::basic_string[abi:ne180100]<0>(&buf, "component_name");
  v79.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf;
  v68.__r_.__value_.__r.__words[0] = (std::string::size_type)v69;
  std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<std::string const&>>((uint64_t)&v58, (unsigned __int8 *)&buf, (__int128 **)&v79, &v68);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  if (v70 < 0)
    operator delete(v69[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v65, v64[0]);
LABEL_97:
  if (v67 < 0)
    operator delete(v66[0]);
  __p.__r_.__value_.__r.__words[0] = *MEMORY[0x1E0DE4F40];
  *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + *(_QWORD *)(__p.__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1C3BB970C](&__p.__r_.__value_.__r.__words[2]);
  std::istream::~istream();
  MEMORY[0x1C3BB9A90](&v74);
  v44 = -[SNLPITFMModelInfo loggingComponent](self->_modelInfo, "loggingComponent");
  v45 = objc_retainAutorelease(v57);
  v46 = (char *)objc_msgSend(v45, "UTF8String");
  v47 = (snlp::common::asset_logger::SNLPAssetLogger *)operator new();
  std::string::basic_string[abi:ne180100]<0>(&__p, v46);
  LODWORD(buf.__r_.__value_.__l.__data_) = v44;
  bundleInfoForAssetsDirectory((int *)&buf, (char *)&__p, &v58, (uint64_t)v63, (uint64_t)v47);
  *v4 = v47;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  SNLPOSLoggerForCategory(2);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    v49 = -[SNLPITFMModelInfo loggingComponent](self->_modelInfo, "loggingComponent");
    v50 = v49;
    if (v49 >= 8)
    {
      SNLPOSLoggerForCategory(4);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"<UNDEFINED_COMPONENT>";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v50;
        _os_log_impl(&dword_1C2196000, v52, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", (uint8_t *)&buf, 0x16u);
      }

      v51 = "<UNDEFINED_COMPONENT>";
    }
    else
    {
      v51 = off_1E7BED840[v49];
    }
    -[SNLPITFMModelInfo loggingComponentString](self->_modelInfo, "loggingComponentString", v56);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    snlp::common::asset_logger::SNLPAssetLogger::toString((uint64_t *)&buf, v47);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v54 = &buf;
    else
      v54 = (std::string *)buf.__r_.__value_.__r.__words[0];
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315650;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v51;
    WORD2(__p.__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v53;
    HIWORD(__p.__r_.__value_.__r.__words[2]) = 2080;
    v72 = v54;
    _os_log_impl(&dword_1C2196000, v48, OS_LOG_TYPE_DEBUG, "[%s] [%@ Assets] %s", (uint8_t *)&__p, 0x20u);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  std::__hash_table<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<int,unsigned int,float,BOOL,std::string>>>>::~__hash_table((uint64_t)&v58);

  if (v62 < 0)
    operator delete(v61);
  return (unique_ptr<snlp::common::asset_logger::SNLPAssetLogger, std::default_delete<snlp::common::asset_logger::SNLPAssetLogger>>)MEMORY[0x1C3BB8674](v63);
}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int v12;
  signed int v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  uint64_t v19;
  ITFMOrchestrator *value;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  _BYTE v30[56];
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[12];
  __int16 v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BYTE *v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SNLPOSLoggerForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  SNLPOSLoggerForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SNLPITFMClassifier responseForRequest", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN \"SNLPITFMClassifier responseForRequest\", buf, 2u);
  }

  SNLPOSLoggerForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = -[SNLPITFMModelInfo loggingComponent](self->_modelInfo, "loggingComponent");
    v13 = v12;
    if (v12 >= 8)
    {
      SNLPOSLoggerForCategory(4);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v33 = 136315394;
        *(_QWORD *)&v33[4] = "<UNDEFINED_COMPONENT>";
        v34 = 2048;
        v35 = v13;
        _os_log_impl(&dword_1C2196000, v15, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", v33, 0x16u);
      }

      v14 = "<UNDEFINED_COMPONENT>";
    }
    else
    {
      v14 = off_1E7BED840[v12];
    }
    -[SNLPITFMModelInfo loggingComponentString](self->_modelInfo, "loggingComponentString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    snlp::common::asset_logger::SNLPAssetLogger::toString((uint64_t *)v33, (snlp::common::asset_logger::SNLPAssetLogger *)self->_assetLogger.__ptr_.__value_);
    if (v36 >= 0)
      v17 = v33;
    else
      v17 = *(_BYTE **)v33;
    *(_DWORD *)buf = 136315650;
    v38 = v14;
    v39 = 2112;
    v40 = v16;
    v41 = 2080;
    v42 = v17;
    _os_log_impl(&dword_1C2196000, v11, OS_LOG_TYPE_DEBUG, "[%s] [%@ Assets] %s", buf, 0x20u);
    if (v36 < 0)
      operator delete(*(void **)v33);

  }
  v18 = (void *)objc_opt_class();
  if (v18)
  {
    objc_msgSend(v18, "_convertRequest:", v5);
    v19 = v32;
  }
  else
  {
    v19 = 0;
  }
  buf[0] = 0;
  v43 = 0;
  value = self->_orchestrator.__ptr_.__value_;
  v31 = v19;
  v32 = 0;
  (**(void (***)(_BYTE *__return_ptr, ITFMOrchestrator *, uint64_t *))value)(v33, value, &v31);
  std::optional<sirinluinternalitfm::ITFMParserResponse>::operator=[abi:ne180100]<sirinluinternalitfm::ITFMParserResponse,void>((uint64_t)buf);
  MEMORY[0x1C3BB85C0](v33);
  v21 = v31;
  v31 = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  v22 = objc_opt_class();
  if (!v43)
    std::__throw_bad_optional_access[abi:ne180100]();
  v23 = (void *)v22;
  MEMORY[0x1C3BB85A8](v30, buf);
  objc_msgSend(v23, "_convertResponse:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1C3BB85C0](v30);
  SNLPOSLoggerForCategory(7);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v33 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v26, OS_SIGNPOST_INTERVAL_END, v7, "SNLPITFMClassifier responseForRequest", ", v33, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C2196000, v27, OS_LOG_TYPE_DEFAULT, "END \"SNLPITFMClassifier responseForRequest\", v33, 2u);
  }

  if (v43)
    MEMORY[0x1C3BB85C0](buf);
  v28 = v32;
  v32 = 0;
  if (v28)
    (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);

  return v24;
}

- (SNLPITFMModelBundle)modelBundle
{
  return self->_modelBundle;
}

- (SNLPITFMModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void).cxx_destruct
{
  SNLPAssetLogger *value;
  ITFMOrchestrator *v4;

  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_modelBundle, 0);
  value = self->_assetLogger.__ptr_.__value_;
  self->_assetLogger.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<snlp::common::asset_logger::SNLPAssetLogger>::operator()[abi:ne180100]((uint64_t)value);
  v4 = self->_orchestrator.__ptr_.__value_;
  self->_orchestrator.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(ITFMOrchestrator *))(*(_QWORD *)v4 + 16))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)classifierWithModelBundle:(id)a3 modelInfo:(id)a4 initializationBlock:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelBundle:modelInfo:initializationBlock:error:", v10, v11, v12, a6);

  return v13;
}

+ (id)classifierWithModelBundle:(id)a3 modelInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "_initializationBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelBundle:modelInfo:initializationBlock:error:", v8, v9, v10, a5);
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else if (a5)
  {
    *a5 = 0;
  }

  return v12;
}

+ (id)_initializationBlock
{
  return &__block_literal_global;
}

+ (unique_ptr<const)_convertRequest:(id)a3
{
  sirinluinternalitfm::ITFMParserRequest **v3;
  sirinluinternalitfm::ITFMParserRequest **v4;
  id v5;
  id v6;
  const unsigned __int8 *v7;
  void *v8;
  sirinluinternalitfm::ITFMParserRequest *v9;
  uint64_t v10;
  unique_ptr<const sirinluinternalitfm::ITFMParserRequest, std::default_delete<const sirinluinternalitfm::ITFMParserRequest>> v11;
  _BYTE v12[32];

  v4 = v3;
  v5 = a3;
  objc_msgSend(v5, "data");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const unsigned __int8 *)objc_msgSend(v6, "bytes");

  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "length");
  PB::Reader::Reader((PB::Reader *)v12, v7);

  v9 = (sirinluinternalitfm::ITFMParserRequest *)operator new();
  v10 = sirinluinternalitfm::ITFMParserRequest::ITFMParserRequest(v9);
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v10 + 16))(v10, v12);
  *v4 = v9;

  return v11;
}

+ (id)_convertResponse:(ITFMParserResponse *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (PB::Writer *)operator new();
  PB::Writer::Writer(v4);
  sirinluinternalitfm::ITFMParserResponse::writeTo((sirinluinternalitfm::ITFMParserResponse *)a3, v4);
  v5 = *((_QWORD *)v4 + 1);
  v6 = objc_alloc(MEMORY[0x1E0D9F9D8]);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

  PB::Writer::~Writer(v4);
  MEMORY[0x1C3BB9B44]();
  return v8;
}

void __42__SNLPITFMClassifier__initializationBlock__block_invoke(void *a1@<X1>, void *a2@<X2>, uint64_t *a3@<X8>)
{
  id v5;
  void *v6;
  id v7;
  const std::__fs::filesystem::path *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t *v31;
  id v32;
  void *__p[2];
  char v34;
  _BYTE v35[40];
  char *v36[5];
  void *v37[2];
  char v38;
  void *v39[2];
  char v40;
  void *v41[2];
  char v42;
  void *v43[2];
  char v44;
  _BYTE v45[64];
  _BYTE v46[32];
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v31 = a3;
  v32 = a2;
  *a3 = 0;
  objc_msgSend(v5, "versionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36[0] = (char *)objc_msgSend(v7, "UTF8String");
  v8 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)v46, v36);
  getAssetDirectoryNCV(v8, (uint64_t)v45);
  if ((v46[23] & 0x80000000) != 0)
    operator delete(*(void **)v46);

  objc_msgSend(v5, "targetVocabularyURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    objc_msgSend(v5, "espressoModelURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "path");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v43, (char *)objc_msgSend(v20, "UTF8String"));
    objc_msgSend(v5, "configURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v41, (char *)objc_msgSend(v22, "UTF8String"));
    objc_msgSend(v5, "spanVocabularyURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v39, (char *)objc_msgSend(v24, "UTF8String"));
    objc_msgSend(v5, "contextVocabularyURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v37, (char *)objc_msgSend(v26, "UTF8String"));
    SNLPAssetVersionChecks::getITFMSupportedGenerationNumbers(objc_msgSend(v32, "type"));
    v47 = xmmword_1C230EF28;
    v48 = unk_1C230EF38;
    v49[0] = xmmword_1C230EF48;
    *(_OWORD *)((char *)v49 + 12) = *(__int128 *)((char *)&xmmword_1C230EF48 + 12);
    *(_OWORD *)v46 = xmmword_1C230EF08;
    *(_OWORD *)&v46[16] = unk_1C230EF18;
    std::unordered_set<unsigned int>::unordered_set((uint64_t)v35, (unsigned int *)v46, 23);
    *(_DWORD *)v46 = objc_msgSend(v32, "loggingComponent");
    v27 = operator new();
    itfm_inference_orchestrator::orchestration::ITFMOrchestrator::ITFMOrchestrator(v27, (char *)v43, (char *)v41, (uint64_t)v39, (uint64_t)v37, (const sirinluinternalsnlp_intermediate::SNLPAssetVersion *)v45, (uint64_t)v36, (uint64_t)v35, (int *)v46);
    *v31 = v27;
    if (v38 < 0)
      operator delete(v37[0]);

    if (v40 < 0)
      operator delete(v39[0]);

    if (v42 < 0)
      operator delete(v41[0]);

    if (v44 < 0)
      operator delete(v43[0]);

  }
  else
  {
    objc_msgSend(v5, "espressoModelURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v43, (char *)objc_msgSend(v29, "UTF8String"));
    objc_msgSend(v5, "configURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v41, (char *)objc_msgSend(v12, "UTF8String"));
    objc_msgSend(v5, "spanVocabularyURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v39, (char *)objc_msgSend(v14, "UTF8String"));
    objc_msgSend(v5, "contextVocabularyURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v37, (char *)objc_msgSend(v16, "UTF8String"));
    objc_msgSend(v5, "targetVocabularyURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "UTF8String"));
    SNLPAssetVersionChecks::getITFMSupportedGenerationNumbers(objc_msgSend(v32, "type"));
    v47 = xmmword_1C230EF28;
    v48 = unk_1C230EF38;
    v49[0] = xmmword_1C230EF48;
    *(_OWORD *)((char *)v49 + 12) = *(__int128 *)((char *)&xmmword_1C230EF48 + 12);
    *(_OWORD *)v46 = xmmword_1C230EF08;
    *(_OWORD *)&v46[16] = unk_1C230EF18;
    std::unordered_set<unsigned int>::unordered_set((uint64_t)v35, (unsigned int *)v46, 23);
    *(_DWORD *)v46 = objc_msgSend(v32, "loggingComponent");
    v19 = operator new();
    itfm_inference_orchestrator::orchestration::ITFMOrchestrator::ITFMOrchestrator(v19, (char *)v43, (char *)v41, (uint64_t)v39, (uint64_t)v37, (uint64_t)__p, (const sirinluinternalsnlp_intermediate::SNLPAssetVersion *)v45, (uint64_t)v36, (uint64_t)v35, (int *)v46);
    *v31 = v19;
    if (v34 < 0)
      operator delete(__p[0]);

    if (v38 < 0)
      operator delete(v37[0]);

    if (v40 < 0)
      operator delete(v39[0]);

    if (v42 < 0)
      operator delete(v41[0]);

    if (v44 < 0)
      operator delete(v43[0]);

  }
  MEMORY[0x1C3BB8674](v45);

}

@end
