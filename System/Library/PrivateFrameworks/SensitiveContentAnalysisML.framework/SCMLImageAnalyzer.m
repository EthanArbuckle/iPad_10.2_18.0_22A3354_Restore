@implementation SCMLImageAnalyzer

- (SCMLImageAnalyzer)initWithModelURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SCMLImageAnalyzer *v11;
  SCMLImageAnalyzer *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  int v43;
  void *v44;
  char v45;
  void *v46;
  _BOOL4 v47;
  uint64_t v48;
  char v49;
  char v50;
  SCMLImageAnalyzer *v51;
  int v53;
  int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[16];
  objc_super v66;

  v9 = a3;
  v10 = a4;
  v66.receiver = self;
  v66.super_class = (Class)SCMLImageAnalyzer;
  v11 = -[SCMLModelBase initWithOptions:](&v66, sel_initWithOptions_, v10);
  v12 = v11;
  if (!v11)
    goto LABEL_80;
  objc_storeStrong((id *)&v11->_modelUrl, a3);
  objc_msgSend(v10, "objectForKeyedSubscript:", SCMLEnableAllClasses[0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", SCMLEnableAllClasses[0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v12->_otgxRetrieveAllClasses = objc_msgSend(v15, "BOOLValue");
  if ((isKindOfClass & 1) != 0)

  objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseMTLDevice[0]);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = +[SCMLHandler supportsANE](SCMLHandler, "supportsANE");
  v60 = (void *)v16;
  if (v16)
    v18 = 0;
  else
    v18 = v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self ENDSWITH '%@_quantized.espresso.net'"), CFSTR("1.7.6"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self ENDSWITH '%@_quantized_sqdev.espresso.net'"), CFSTR("1.7.6"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v60;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "contentsOfDirectoryAtPath:error:", v20, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v58);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v62 = v21;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v59);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v61, "filteredArrayUsingPredicate:", v21);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "filteredArrayUsingPredicate:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "count"))
  {
    objc_msgSend(v63, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SCMLImageAnalyzer initWithModelURL:options:error:].cold.1(v24);

    if (!objc_msgSend(v64, "count"))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SCMLErrorDomain[0], 1, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_81;
    }
    v23 = 0;
  }
  if (objc_msgSend(v64, "count"))
  {
    objc_msgSend(v64, "firstObject");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v25);
    v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = v23;
    +[SCMLLog imageAnalyzer](SCMLLog, "imageAnalyzer");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245BFA000, v25, OS_LOG_TYPE_DEFAULT, "ANE-specific ivs model files not found. Falling back to the default model.", buf, 2u);
    }
  }

  +[SCMLImageAnalyzer _readOperatingThresholdsDataUsingModelURL:error:](SCMLImageAnalyzer, "_readOperatingThresholdsDataUsingModelURL:error:", v9, a5);
  v26 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v26;
  if (a5 && *a5)
    goto LABEL_24;
  -[SCMLImageAnalyzer _extractThresholdForOTGXMain:](v12, "_extractThresholdForOTGXMain:", v26);
  objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseAnyAvailableDevice[0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v29 = objc_opt_isKindOfClass();
  if ((v29 & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseAnyAvailableDevice[0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v31 = objc_msgSend(v30, "BOOLValue");
  if ((v29 & 1) != 0)

  if (v31 && +[SCMLHandler supportsANE](SCMLHandler, "supportsANE"))
  {
    v19 = v60;
    if (!v60)
    {
      v32 = 1;
      v33 = 1;
      goto LABEL_61;
    }
LABEL_41:
    v37 = -[SCMLImageAnalyzer loadNetworkForURL:espressoEngine:storageType:deviceId:](v12, "loadNetworkForURL:espressoEngine:storageType:deviceId:", v23, 5, 65552, espresso_device_id_for_metal_device());
    v27 = v37;
    if (a5)
      v38 = v37;
    else
      v38 = 1;
    if ((v38 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SCMLErrorDomain[0], 5, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_78:
      v27 = 0;
      *a5 = v39;
      goto LABEL_79;
    }
    goto LABEL_79;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseANE[0]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v35 = objc_opt_isKindOfClass();
  if ((v35 & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseANE[0]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v54 = objc_msgSend(v36, "BOOLValue");
  if ((v35 & 1) != 0)

  if ((v31 & 1) != 0)
  {
    v32 = 1;
    v33 = 1;
    v19 = v60;
    if (v60)
      goto LABEL_41;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseGPU[0]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = objc_opt_isKindOfClass();
    if ((v41 & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseGPU[0]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    v43 = objc_msgSend(v42, "BOOLValue");
    if ((v41 & 1) != 0)

    v53 = v43;
    objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseCPU[0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = objc_opt_isKindOfClass();
    if ((v45 & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", SCMLUseCPU[0]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
    }
    v33 = objc_msgSend(v46, "BOOLValue");
    if ((v45 & 1) != 0)

    v19 = v60;
    v32 = v53;
    if (v60)
      goto LABEL_41;
  }
  if (v54)
  {
LABEL_61:
    v47 = -[SCMLImageAnalyzer loadNetworkForURL:espressoEngine:storageType:deviceId:](v12, "loadNetworkForURL:espressoEngine:storageType:deviceId:", v56, 10007, 65552, 0xFFFFFFFFLL);
    if (((v47 | v32 | v33) & 1) == 0)
    {
      if (a5)
      {
        v48 = 2;
LABEL_77:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SCMLErrorDomain[0], v48, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_78;
      }
LABEL_24:
      v27 = 0;
      goto LABEL_79;
    }
    goto LABEL_65;
  }
  LOBYTE(v47) = 0;
LABEL_65:
  if (!v47)
  {
    if (v32)
    {
      v47 = -[SCMLImageAnalyzer loadNetworkForURL:espressoEngine:storageType:deviceId:](v12, "loadNetworkForURL:espressoEngine:storageType:deviceId:", v23, 5, 65552, 0xFFFFFFFFLL);
      if (((v47 | v33) & 1) == 0)
      {
        if (a5)
        {
          v48 = 3;
          goto LABEL_77;
        }
        goto LABEL_24;
      }
    }
  }
  v27 = 1;
  if (!v47 && ((v33 ^ 1) & 1) == 0)
  {
    v49 = -[SCMLImageAnalyzer loadNetworkForURL:espressoEngine:storageType:deviceId:](v12, "loadNetworkForURL:espressoEngine:storageType:deviceId:", v23, 0, 65568, 0xFFFFFFFFLL);
    v27 = v49;
    v50 = a5 ? v49 : 1;
    if ((v50 & 1) == 0)
    {
      v48 = 4;
      goto LABEL_77;
    }
  }
LABEL_79:

  if ((v27 & 1) == 0)
  {
LABEL_81:
    v51 = 0;
    goto LABEL_82;
  }
LABEL_80:
  v51 = v12;
LABEL_82:

  return v51;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SCMLImageAnalyzer;
  -[SCMLImageAnalyzer dealloc](&v3, sel_dealloc);
}

- (BOOL)loadNetworkForURL:(id)a3 espressoEngine:(int)a4 storageType:(int)a5 deviceId:(int)a6
{
  id v10;
  void *context;
  id v12;
  int v13;
  void *exception;
  std::string *v16;
  std::string::size_type size;
  std::string *v18;
  __int128 v19;
  std::runtime_error *v20;
  const char *v21;
  std::runtime_error *v22;
  const char *v23;
  std::runtime_error *v24;
  const char *v25;
  std::runtime_error *v26;
  const char *v27;
  std::runtime_error *v28;
  const char *v29;
  std::runtime_error *v30;
  const char *v31;
  std::runtime_error *v32;
  const char *v33;
  std::string v34;
  std::string v35;
  std::string v36;
  std::string v37;
  __int128 v38;
  std::string::size_type v39;

  v10 = a3;
  context = (void *)espresso_create_context();
  self->encoderCtx = context;
  if (!context)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::to_string(&v35, a4);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Could not create espresso context for engine: ", &v35, &v36);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(" and device id: ", &v36, &v37);
    std::to_string(&v34, a6);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = &v34;
    else
      v16 = (std::string *)v34.__r_.__value_.__r.__words[0];
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      size = v34.__r_.__value_.__l.__size_;
    v18 = std::string::append(&v37, (const std::string::value_type *)v16, size);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v39 = v18->__r_.__value_.__r.__words[2];
    v38 = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x249544C64](exception, &v38);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  self->encoderPlan = (void *)espresso_create_plan();
  objc_msgSend(v10, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = espresso_plan_add_network();

  if (v13)
  {
    v20 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v20, v21);
    __cxa_throw(v20, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (espresso_plan_build())
  {
    v22 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v22, v23);
    __cxa_throw(v22, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v38 = 0uLL;
  v39 = 0;
  memset(&v37, 0, sizeof(v37));
  if (c_network_get_input_names())
  {
    v24 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v24, v25);
    __cxa_throw(v24, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (espresso_network_query_blob_dimensions())
  {
    v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v26, v27);
    __cxa_throw(v26, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (espresso_network_bind_buffer())
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v28, v29);
    __cxa_throw(v28, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections"))
  {
    if (espresso_network_bind_buffer())
    {
      v30 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v30, v31);
      __cxa_throw(v30, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    if (espresso_network_bind_buffer())
    {
      v32 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v32, v33);
      __cxa_throw(v32, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
  }
  self->__espressoEngine = a4;
  self->__espressoDeviceId = a6;
  self->__espressoStorageType = a5;
  v36.__r_.__value_.__r.__words[0] = (std::string::size_type)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
  v37.__r_.__value_.__r.__words[0] = (std::string::size_type)&v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);

  return 1;
}

+ (id)_readOperatingThresholdsDataUsingModelURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  scml *v18;
  void **v19;
  uint64_t v20;
  void *__p[2];
  char v23;
  void *v24[2];
  unsigned __int8 v25;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && *a4)
  {
    a4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH 'operating_thresholds.json'"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataWithContentsOfFile:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a4 && *a4)
        a4 = 0;
      else
        a4 = v16;

    }
    else if (a4)
    {
      objc_msgSend(v12, "path");
      v18 = (scml *)objc_claimAutoreleasedReturnValue();
      scml::strFromNSString(v18, __p);
      scml::strCat<char const(&)[38],std::string>("unable to read operating thresholds: ", (uint64_t)__p, v24);
      if (v23 < 0)
        operator delete(__p[0]);

      if ((v25 & 0x80u) == 0)
        v19 = v24;
      else
        v19 = (void **)v24[0];
      if ((v25 & 0x80u) == 0)
        v20 = v25;
      else
        v20 = (uint64_t)v24[1];
      scml::error(9u, (uint64_t)v19, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if ((char)v25 < 0)
        operator delete(v24[0]);
      a4 = 0;
    }

  }
  return a4;
}

+ (id)_encodeName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *exception;
  __n128 v8;
  std::string v9;
  std::string v10;

  v3 = a3;
  +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToHex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v8 = std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Name could not be encoded: ", &v9, &v10);
    MEMORY[0x249544C64](exception, &v10, v8);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }

  return v5;
}

+ (id)_decodeName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *exception;
  __n128 v8;
  std::string v9;
  std::string v10;

  v3 = a3;
  +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFromHex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v8 = std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Name could not be encoded: ", &v9, &v10);
    MEMORY[0x249544C64](exception, &v10, v8);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }

  return v5;
}

- (void)_extractThresholdForOTGXMain:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *acceptedOutputIndices;
  void *v25;
  NSDictionary *v26;
  NSDictionary *v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  NSDictionary *v45;
  NSDictionary *acceptedDetectionOutputIndices;
  NSDictionary *v47;
  NSDictionary *detectionThresholdByOutputIndex;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id obj;
  id v55;
  NSDictionary *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("class_thresholds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("class_thresholds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v7)
  {
    v57 = *(_QWORD *)v67;
    do
    {
      v59 = v7;
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v67 != v57)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("class"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("class"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("index"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("index"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("default"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("default"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v16;
        }
        else
        {
          v16 = 0;
        }
        v4 = objc_msgSend(v16, "BOOLValue");
        if ((isKindOfClass & 1) != 0)

        if (objc_msgSend(v11, "isEqualToString:", CFSTR("60dc96fd80c33771139d6cf90639a776")))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("thresholds"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("balanced"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();
          if ((v19 & 1) != 0)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("thresholds"));
            v55 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("balanced"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v6;
          }
          else
          {
            v20 = 0;
          }
          objc_storeStrong((id *)&self->_otgxMainThreshold, v20);
          if ((v19 & 1) != 0)
          {

          }
        }
        if (v13)
        {
          v21 = self->_otgxRetrieveAllClasses ? 1 : v4;
          if (v21 == 1)
          {
            +[SCMLImageAnalyzer _decodeName:](SCMLImageAnalyzer, "_decodeName:", v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setObject:forKeyedSubscript:", v22, v13);

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v7);
  }

  v23 = (NSDictionary *)objc_msgSend(v53, "copy");
  acceptedOutputIndices = self->_acceptedOutputIndices;
  self->_acceptedOutputIndices = v23;

  if (-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections"))
  {
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("detection_thresholds"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("detection_thresholds"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v56 = v49;
    v28 = -[NSDictionary countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v28)
    {
      v58 = *(_QWORD *)v63;
      do
      {
        v60 = v28;
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v63 != v58)
            objc_enumerationMutation(v56);
          v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("class"), v49);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("class"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = 0;
          }

          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("index"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("index"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }

          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("default"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v36 = objc_opt_isKindOfClass();
          if ((v36 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("default"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = (uint64_t)v37;
          }
          else
          {
            v37 = 0;
          }
          v38 = objc_msgSend(v37, "BOOLValue");
          if ((v36 & 1) != 0)

          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("thresholds"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("balanced"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v42 = 0;
            if (!v34)
              goto LABEL_67;
LABEL_62:
            if (self->_otgxRetrieveAllClasses)
              v43 = 1;
            else
              v43 = v38;
            if (v43 == 1)
            {
              +[SCMLImageAnalyzer _decodeName:](SCMLImageAnalyzer, "_decodeName:", v32);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v44, v34);

            }
            goto LABEL_67;
          }
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("thresholds"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("balanced"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v42, v34);
          if (v34)
            goto LABEL_62;
LABEL_67:

        }
        v28 = -[NSDictionary countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v28);
    }

    v45 = (NSDictionary *)objc_msgSend(v51, "copy");
    acceptedDetectionOutputIndices = self->_acceptedDetectionOutputIndices;
    self->_acceptedDetectionOutputIndices = v45;

    v47 = (NSDictionary *)objc_msgSend(v52, "copy");
    detectionThresholdByOutputIndex = self->_detectionThresholdByOutputIndex;
    self->_detectionThresholdByOutputIndex = v47;

    v27 = v56;
  }
  else
  {
    v26 = self->_acceptedDetectionOutputIndices;
    self->_acceptedDetectionOutputIndices = 0;

    v27 = self->_detectionThresholdByOutputIndex;
    self->_detectionThresholdByOutputIndex = 0;
  }

}

- (BOOL)isSensitive:(id)a3 sensitivityScore:(id *)a4
{
  return -[SCMLImageAnalyzer isSensitive:sensitivityScore:classificationMode:](self, "isSensitive:sensitivityScore:classificationMode:", a3, a4, 2);
}

- (BOOL)isSensitive:(id)a3 sensitivityScore:(id *)a4 classificationMode:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  float v16;
  id v17;
  id v19;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", SCMLHandlerImageClassificationScores[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCMLImageAnalyzer _decodeName:](SCMLImageAnalyzer, "_decodeName:", CFSTR("60dc96fd80c33771139d6cf90639a776"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SCMLImageModelThresholds instance](SCMLImageModelThresholds, "instance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCMLHandler currentModelVersion](SCMLHandler, "currentModelVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v11, "thresholdForLabel:classificationMode:modelVersion:error:", CFSTR("otgx_fyqmjdju"), a5, v12, &v19);
  v14 = v13;
  v15 = v19;

  objc_msgSend(v10, "floatValue");
  LOBYTE(a5) = v14 <= v16;
  v17 = objc_retainAutorelease(v10);
  *a4 = v17;

  return a5;
}

- (id)analyzeImage:(CGImage *)a3 error:(id *)a4
{
  void *v5;
  _BOOL8 v6;
  id v7;
  SCMLImageAnalysisResult *v8;
  void *v9;
  SCMLImageAnalysisResult *v10;
  SCMLImageDetectionResult *v11;
  void *v12;
  SCMLImageDetectionResult *v13;
  id v15;

  -[SCMLImageAnalyzer generateClassificationScoresForImage:error:](self, "generateClassificationScoresForImage:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = &unk_2516EB7A8;
    v6 = -[SCMLImageAnalyzer isSensitive:sensitivityScore:](self, "isSensitive:sensitivityScore:", v5, &v15);
    v7 = v15;
    v8 = [SCMLImageAnalysisResult alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", SCMLHandlerImageClassificationScores[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SCMLAnalysisResult initWithSensitive:sensitivityScore:scoresForLabels:](v8, "initWithSensitive:sensitivityScore:scoresForLabels:", v6, v7, v9);

    if (-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections"))
    {
      v11 = [SCMLImageDetectionResult alloc];
      objc_msgSend(v5, "objectForKeyedSubscript:", SCMLHandlerImageDetections[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SCMLImageDetectionResult initWithDetections:](v11, "initWithDetections:", v12);
      -[SCMLImageAnalysisResult setDetectionResult:](v10, "setDetectionResult:", v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)classifyImage:(CGImage *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCMLImageAnalyzer generateClassificationScoresForImage:error:](self, "generateClassificationScoresForImage:error:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = &unk_2516EB7A8;
    v9 = -[SCMLImageAnalyzer isSensitive:sensitivityScore:](self, "isSensitive:sensitivityScore:", v8, &v14);
    v10 = v14;
    if (v9)
      v11 = &unk_2516EB7C0;
    else
      v11 = &unk_2516EB7D8;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, SCMLImageSensitivity[0]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, SCMLImageSensitivityScore[0]);
    v12 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)scaleMethod
{
  void *v2;
  __CFString *v3;
  BOOL v4;
  __CFString *v5;
  __CFString *v6;

  -[SCMLModelBase options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", SCMLImageScaleMethod[0]);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v4 = v3 == SCMLImageScaleMethodvImage[0] || v3 == 0;
  v5 = SCMLImageScaleMethodCGInterpolationMedium[0];
  if (!v4)
    v5 = v3;
  v6 = v5;

  return v6;
}

- (id)generateClassificationScoresForImage:(CGImage *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];
  id v29;
  SCMLImageAnalyzer *v30;
  uint64_t *v31;
  CGImage *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  -[SCMLImageAnalyzer scaleMethod](self, "scaleMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCMLModelBase perfResults](self, "perfResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke;
  v28[3] = &unk_2516E4818;
  v10 = v7;
  v31 = &v33;
  v32 = a3;
  v29 = v10;
  v30 = self;
  objc_msgSend(v8, "run:block:", CFSTR("Scale"), v28);

  if (v34[3])
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    v27 = (id)MEMORY[0x24BDBD1B8];
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    v21 = 0;
    -[SCMLModelBase perfResults](self, "perfResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke_61;
    v15[3] = &unk_2516E4840;
    v15[4] = self;
    v15[5] = &v33;
    v15[6] = &v16;
    v15[7] = &v22;
    objc_msgSend(v11, "run:block:", CFSTR("Inference"), v15);

    CFRelease((CFTypeRef)v34[3]);
    v12 = (void *)v17[5];
    if (v12)
    {
      v13 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      v13 = (id)v23[5];
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else if (a4)
  {
    scml::error(7u, (uint64_t)"Failed to convert to pixel buffer", 33);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v13;
}

CVPixelBufferRef __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke(uint64_t a1)
{
  CVPixelBufferRef result;
  CGInterpolationQuality v3;

  v3 = kCGInterpolationNone;
  interpolationForScaleMethod(*(void **)(a1 + 32), (int *)&v3);
  result = scaledPixelBuffer32BGRAFromCGImage(*(CGImage **)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

double __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke_61(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  double result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _OWORD v13[4];
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v4 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v4 + 40);
  v6 = (id *)(v4 + 40);
  v5 = v7;
  obj = v7;
  if (v2)
  {
    objc_msgSend(v2, "_computeOutputForPixelBuffer:error:", v3, &obj);
    objc_storeStrong(v6, obj);
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      return result;
    goto LABEL_3;
  }
  result = 0.0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (!v5)
  {
LABEL_3:
    v9 = (void *)a1[4];
    v13[0] = v15;
    v13[1] = v16;
    v13[2] = v17;
    v13[3] = v18;
    objc_msgSend(v9, "_processNetworkOutput:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  return result;
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v5;
  _BOOL8 v6;
  id v7;
  SCMLImageAnalysisResult *v8;
  void *v9;
  SCMLImageAnalysisResult *v10;
  SCMLImageDetectionResult *v11;
  void *v12;
  SCMLImageDetectionResult *v13;
  id v15;

  -[SCMLImageAnalyzer generateClassificationScoresForPixelBuffer:error:](self, "generateClassificationScoresForPixelBuffer:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = &unk_2516EB7A8;
    v6 = -[SCMLImageAnalyzer isSensitive:sensitivityScore:](self, "isSensitive:sensitivityScore:", v5, &v15);
    v7 = v15;
    v8 = [SCMLImageAnalysisResult alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", SCMLHandlerImageClassificationScores[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SCMLAnalysisResult initWithSensitive:sensitivityScore:scoresForLabels:](v8, "initWithSensitive:sensitivityScore:scoresForLabels:", v6, v7, v9);

    if (-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections"))
    {
      v11 = [SCMLImageDetectionResult alloc];
      objc_msgSend(v5, "objectForKeyedSubscript:", SCMLHandlerImageDetections[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SCMLImageDetectionResult initWithDetections:](v11, "initWithDetections:", v12);
      -[SCMLImageAnalysisResult setDetectionResult:](v10, "setDetectionResult:", v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)classifyPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCMLImageAnalyzer generateClassificationScoresForPixelBuffer:error:](self, "generateClassificationScoresForPixelBuffer:error:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", SCMLHandlerImageClassificationScores[0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCMLImageAnalyzer _decodeName:](SCMLImageAnalyzer, "_decodeName:", CFSTR("60dc96fd80c33771139d6cf90639a776"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "floatValue");
    v14 = v13;
    -[SCMLImageAnalyzer otgxMainThreshold](self, "otgxMainThreshold");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    if (v14 >= v17)
      v18 = &unk_2516EB7C0;
    else
      v18 = &unk_2516EB7D8;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, SCMLImageSensitivity[0]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, SCMLImageSensitivityScore[0]);
    v19 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)generateClassificationScoresForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  __CVBuffer *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  _OWORD v16[4];
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __n128 (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)();
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  _QWORD v38[7];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  -[SCMLModelBase perfResults](self, "perfResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke;
  v38[3] = &unk_2516E4868;
  v38[5] = &v39;
  v38[6] = a3;
  v38[4] = self;
  objc_msgSend(v7, "run:block:", CFSTR("Scale"), v38);

  if (v40[3])
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x7012000000;
    v27 = __Block_byref_object_copy__62;
    v28 = __Block_byref_object_dispose__63;
    v29 = &unk_245CACDB5;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__0;
    v22 = __Block_byref_object_dispose__0;
    v23 = 0;
    -[SCMLModelBase perfResults](self, "perfResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke_64;
    v17[3] = &unk_2516E4890;
    v17[4] = self;
    v17[5] = &v24;
    v17[6] = &v39;
    v17[7] = &v18;
    objc_msgSend(v9, "run:block:", CFSTR("Inference"), v17);

    v10 = (__CVBuffer *)v40[3];
    if (v10 != a3)
    {
      CVPixelBufferUnlockBaseAddress(v10, 0);
      CFRelease((CFTypeRef)v40[3]);
    }
    v11 = (void *)v19[5];
    if (v11)
    {
      v12 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      v13 = *((_OWORD *)v25 + 4);
      v16[0] = *((_OWORD *)v25 + 3);
      v16[1] = v13;
      v14 = *((_OWORD *)v25 + 6);
      v16[2] = *((_OWORD *)v25 + 5);
      v16[3] = v14;
      -[SCMLImageAnalyzer _processNetworkOutput:](self, "_processNetworkOutput:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SCMLErrorDomain[0], 7, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v39, 8);
  return v12;
}

__CVBuffer *__70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke(uint64_t a1)
{
  __CVBuffer *result;

  result = scaleCVPixelBuffer(*(CVPixelBufferRef *)(a1 + 48), (size_t *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke_64(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  _OWORD *v7;
  double result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v4 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  obj = v6;
  if (v2)
  {
    objc_msgSend(v2, "_computeOutputForPixelBuffer:error:", v3, &obj);
    objc_storeStrong(v5, obj);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
  }
  v7 = *(_OWORD **)(a1[5] + 8);
  result = *(double *)&v13;
  v9 = v14;
  v11 = v15;
  v10 = v16;
  v7[3] = v13;
  v7[4] = v9;
  v7[5] = v11;
  v7[6] = v10;
  return result;
}

- (NetworkOutputs)_computeOutputForPixelBuffer:(SEL)a3 error:(__CVBuffer *)a4
{
  NetworkOutputs *result;
  uint64_t channels_low;
  const char *v9;
  int v10;
  std::runtime_error *exception;
  const char *v12;
  std::runtime_error *v13;
  const char *v14;
  __int128 v15;
  int v16;
  __int128 v17;
  int v18;

  if (espresso_network_bind_cvpixelbuffer())
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v12);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (espresso_plan_execute_sync())
  {
    v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v13, v14);
    __cxa_throw(v13, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  if (-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections"))
  {
  }
  else
  {
    v17 = 0uLL;
    v18 = 0;
  }
  result = (NetworkOutputs *)-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections");
  if ((_DWORD)result)
  {
  }
  else
  {
    v15 = 0uLL;
    v16 = 0;
  }
  if (self->leafProbabilities.sequence_length != 1)
  {
    v9 = "buf->sequence_length == 1";
    v10 = 488;
    goto LABEL_18;
  }
  if (self->leafProbabilities.batch_number != 1)
  {
    v9 = "buf->batch_number == 1";
    v10 = 489;
    goto LABEL_18;
  }
  if (self->leafProbabilities.height != 1)
  {
    v9 = "buf->height == 1";
    v10 = 490;
    goto LABEL_18;
  }
  if (self->leafProbabilities.width != 1)
  {
    v9 = "buf->width == 1";
    v10 = 491;
LABEL_18:
    __assert_rtn("tensorViewC", "SCMLImageAnalyzer.mm", v10, v9);
  }
  channels_low = LODWORD(self->leafProbabilities.channels);
  retstr->var0.var0 = (float *)self->leafProbabilities.data;
  *(_QWORD *)retstr->var0.var1.var0 = channels_low;
  *(_OWORD *)&retstr->var1.var0 = v17;
  retstr->var1.var1.var0[2] = v18;
  *(_OWORD *)&retstr->var2.var0 = v15;
  retstr->var2.var1.var0[2] = v16;
  return result;
}

- (vector<SCML::BoxInfo,)_processDetectionOutput:(SCMLImageAnalyzer *)self
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  vector<SCML::BoxInfo, std::allocator<SCML::BoxInfo>> *result;
  _QWORD v11[2];
  int v12;
  _QWORD v13[2];
  int v14;
  uint64_t v15[2];
  int v16;
  void *v17[3];

  v6 = *(_QWORD *)a4->var1.var1.var0;
  v7 = a4->var1.var1.var0[2];
  v15[0] = (uint64_t)a4->var1.var0;
  v15[1] = v6;
  v16 = v7;
  SCML::extractLocalPeaks(v15, 3, v17);
  v13[0] = v17[0];
  v13[1] = v6;
  v14 = v7;
  v8 = *(_QWORD *)a4->var2.var1.var0;
  v9 = a4->var2.var1.var0[2];
  v11[0] = a4->var2.var0;
  v11[1] = v8;
  v12 = v9;
  SCML::topDetections((uint64_t)v13, (uint64_t)v11, 100, retstr);
  result = (vector<SCML::BoxInfo, std::allocator<SCML::BoxInfo>> *)v17[0];
  if (v17[0])
  {
    v17[1] = v17[0];
    operator delete(v17[0]);
  }
  return result;
}

- (BOOL)shouldProcessDetections
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;

  v2 = self;
  -[SCMLModelBase options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", SCMLEnableImageDetection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "options");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", SCMLEnableImageDetection);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v6, "BOOLValue");
  if ((isKindOfClass & 1) != 0)
  {

  }
  return v7;
}

- (id)_processNetworkOutput:(NetworkOutputs *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  id v19;
  float *v20;
  float *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  BOOL v30;
  void *v31;
  void *v32;
  SCMLDetectionBox *v33;
  double v34;
  SCMLDetectionBox *v35;
  id v37;
  void *v38;
  _OWORD v39[4];
  void *__p;
  float *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[SCMLImageAnalyzer acceptedOutputIndices](self, "acceptedOutputIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BDD16E0];
        *(float *)&v12 = a3->var0.var0[(int)objc_msgSend(v10, "intValue")];
        objc_msgSend(v11, "numberWithFloat:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCMLImageAnalyzer acceptedOutputIndices](self, "acceptedOutputIndices");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v13, v15);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v7);
  }

  v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = (void *)objc_msgSend(v38, "copy");
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v16, SCMLHandlerImageClassificationScores[0]);

  if (-[SCMLImageAnalyzer shouldProcessDetections](self, "shouldProcessDetections"))
  {
    v17 = *(_OWORD *)&a3->var1.var0;
    v39[0] = a3->var0;
    v39[1] = v17;
    v18 = *(_OWORD *)a3->var2.var1.var0;
    v39[2] = *(_OWORD *)&a3->var1.var1.var0[2];
    v39[3] = v18;
    -[SCMLImageAnalyzer _processDetectionOutput:](self, "_processDetectionOutput:", v39);
    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = (float *)__p;
    v21 = v41;
    if (__p != v41)
    {
      do
      {
        -[SCMLImageAnalyzer acceptedDetectionOutputIndices](self, "acceptedDetectionOutputIndices");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v20 + 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = *v20;
          -[SCMLImageAnalyzer detectionThresholdByOutputIndex](self, "detectionThresholdByOutputIndex");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v20 + 1));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "floatValue");
          v30 = v25 < v29;

          if (!v30)
          {
            +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "encodeToP1:", v24);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = [SCMLDetectionBox alloc];
            *(float *)&v34 = *v20;
            v35 = -[SCMLDetectionBox initWithScore:label:rect:](v33, "initWithScore:label:rect:", v32, v34, *((double *)v20 + 1), *((double *)v20 + 2), *((double *)v20 + 3), *((double *)v20 + 4));
            objc_msgSend(v19, "addObject:", v35);

          }
        }

        v20 += 10;
      }
      while (v20 != v21);
    }
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v19, SCMLHandlerImageDetections[0]);

    if (__p)
    {
      v41 = (float *)__p;
      operator delete(__p);
    }
  }

  return v37;
}

+ (id)getOperatingPointDataForClassName:(id)a3 modelURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_readOperatingThresholdsDataUsingModelURL:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5 && *a5)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("precision_recall_data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_encodeName:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (NSDictionary)acceptedOutputIndices
{
  return (NSDictionary *)objc_getProperty(self, a2, 608, 1);
}

- (NSDictionary)acceptedDetectionOutputIndices
{
  return (NSDictionary *)objc_getProperty(self, a2, 616, 1);
}

- (NSDictionary)detectionThresholdByOutputIndex
{
  return (NSDictionary *)objc_getProperty(self, a2, 624, 1);
}

- (NSNumber)otgxMainThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 632, 1);
}

- (unint64_t)otgxMainIndex
{
  return self->_otgxMainIndex;
}

- (BOOL)otgxRetrieveAllClasses
{
  return self->_otgxRetrieveAllClasses;
}

- (NSURL)modelUrl
{
  return (NSURL *)objc_getProperty(self, a2, 648, 1);
}

- (int)_espressoEngine
{
  return self->__espressoEngine;
}

- (int)_espressoDeviceId
{
  return self->__espressoDeviceId;
}

- (int)_espressoStorageType
{
  return self->__espressoStorageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelUrl, 0);
  objc_storeStrong((id *)&self->_otgxMainThreshold, 0);
  objc_storeStrong((id *)&self->_detectionThresholdByOutputIndex, 0);
  objc_storeStrong((id *)&self->_acceptedDetectionOutputIndices, 0);
  objc_storeStrong((id *)&self->_acceptedOutputIndices, 0);
}

- (void)initWithModelURL:(os_log_t)log options:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_245BFA000, log, OS_LOG_TYPE_ERROR, "Default ivs model files not found.", v1, 2u);
}

- (void)loadNetworkForURL:(NSObject *)a3 espressoEngine:storageType:deviceId:.cold.1(const std::runtime_error *a1, int a2, NSObject *a3)
{
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2080;
  v6 = OUTLINED_FUNCTION_2(a1);
  _os_log_error_impl(&dword_245BFA000, a3, OS_LOG_TYPE_ERROR, "Failed to load encoder network for engine: %d, espresso error: %s", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)_computeOutputForPixelBuffer:(const std::runtime_error *)a1 error:.cold.1(const std::runtime_error *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_1(&dword_245BFA000, v1, v2, "Error during espresso execution: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)getOperatingPointDataForClassName:(const std::runtime_error *)a1 modelURL:error:.cold.1(const std::runtime_error *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_1(&dword_245BFA000, v1, v2, "Error during operating point retrieval: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_0();
}

@end
