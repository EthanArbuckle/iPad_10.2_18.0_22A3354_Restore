@implementation SIBaseNetworkE5RT

- (int64_t)_setupMetaDataFromLibrary
{
  NSObject *v3;
  NSString *v4;
  NSObject *v5;
  NSString *e5Path;
  const char *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *networkVersion;
  const void *Value;
  NSArray *v16;
  NSArray *opsForLibrary;
  NSObject *v18;
  NSString *v19;
  NSString *v20;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[NSString UTF8String](self->_e5Path, "UTF8String");
  if (e5rt_program_library_create())
  {
    __SceneIntelligenceLogSharedInstance();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 80);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v24 = 1025;
      v25 = 80;
      v26 = 2113;
      v27 = v4;
      _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    e5Path = self->_e5Path;
    *(_DWORD *)buf = 136381187;
    v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v24 = 1025;
    v25 = 80;
    v26 = 2113;
    v27 = e5Path;
    v7 = " %{private}s:%{private}d *** Failed to create e5rt program library with e5Path=%{private}@ ***";
LABEL_16:
    _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x1Cu);
LABEL_17:

    return 7;
  }
  -[SINetworkConfiguration networkFunction](self->_configuration, "networkFunction");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  v9 = e5rt_program_library_get_function_metadata() == 0;

  if (!v9)
  {
    __SceneIntelligenceLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 83);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v24 = 1025;
      v25 = 83;
      v26 = 2113;
      v27 = v11;
      _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v12 = self->_e5Path;
    *(_DWORD *)buf = 136381187;
    v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v24 = 1025;
    v25 = 83;
    v26 = 2113;
    v27 = v12;
    v7 = " %{private}s:%{private}d *** Failed to get e5rt main function metadata with e5Path=%{private}@ ***";
    goto LABEL_16;
  }
  CFDictionaryGetValue(0, CFSTR("UserVersion"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  networkVersion = self->_networkVersion;
  self->_networkVersion = v13;

  CFRelease(CFSTR("UserVersion"));
  Value = CFDictionaryGetValue(0, CFSTR("Ops"));
  CFRetain(Value);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  opsForLibrary = self->_opsForLibrary;
  self->_opsForLibrary = v16;

  if (e5rt_program_library_release())
  {
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 98);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v24 = 1025;
      v25 = 98;
      v26 = 2113;
      v27 = v19;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v20 = self->_e5Path;
    *(_DWORD *)buf = 136381187;
    v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v24 = 1025;
    v25 = 98;
    v26 = 2113;
    v27 = v20;
    v7 = " %{private}s:%{private}d *** Failed to get e5rt main function metadata with e5Path=%{private}@ ***";
    goto LABEL_16;
  }
  return 0;
}

- (SIBaseNetworkE5RT)initWithNetName:(id)a3
{
  SINetworkConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  SIBaseNetworkE5RT *v8;

  v4 = objc_alloc_init(SINetworkConfiguration);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SINetworkConfiguration networkName](v4, "networkName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SIMLModelPath_v2(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SINetworkConfiguration setNetworkPath:](v4, "setNetworkPath:", v7);

  v8 = -[SIBaseNetworkE5RT initWithNetworkConfiguration:](self, "initWithNetworkConfiguration:", v4);
  return v8;
}

- (SIBaseNetworkE5RT)initWithNetPath:(id)a3
{
  id v4;
  SINetworkConfiguration *v5;
  SIBaseNetworkE5RT *v6;

  v4 = a3;
  v5 = objc_alloc_init(SINetworkConfiguration);
  -[SINetworkConfiguration setNetworkPath:](v5, "setNetworkPath:", v4);
  v6 = -[SIBaseNetworkE5RT initWithNetworkConfiguration:](self, "initWithNetworkConfiguration:", v5);

  return v6;
}

- (SIBaseNetworkE5RT)initWithNetworkConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SINetworkConfiguration **p_configuration;
  NSString *v11;
  NSString *networkName;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  SINetworkConfiguration *v16;
  NSObject *v17;
  NSString *v18;
  SINetworkConfiguration *v19;
  void *v20;
  int64_t v21;
  SIBaseNetworkE5RT *v22;
  NSObject *v24;
  NSString *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  NSString *p_isa;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "networkPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "networkPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SIMLModelPath_v2(v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, a3);
  -[SINetworkConfiguration networkName](self->_configuration, "networkName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  networkName = self->_networkName;
  self->_networkName = v11;

  objc_storeStrong((id *)&self->_e5Path, v7);
  self->_isModelCompiledInRuntime = 0;
  if (e5rt_execution_stream_create())
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 136);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v28 = 1025;
      v29 = 136;
      v30 = 2113;
      p_isa = v14;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *p_configuration;
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v28 = 1025;
      v29 = 136;
      v30 = 2113;
      p_isa = (NSString *)&v16->super.isa;
      _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to init the model with networkConfiguration: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);
    }
LABEL_9:

LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }
  if (e5rt_execution_stream_create())
  {
    __SceneIntelligenceLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 138);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v28 = 1025;
      v29 = 138;
      v30 = 2113;
      p_isa = v18;
      _os_log_impl(&dword_21071A000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = *p_configuration;
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v28 = 1025;
      v29 = 138;
      v30 = 2113;
      p_isa = (NSString *)&v19->super.isa;
      _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to init the model with networkConfiguration: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "networkMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SIBaseNetworkE5RT selectComputeOperationByFunctionName:](self, "selectComputeOperationByFunctionName:", v20);

  if (v21)
    goto LABEL_17;
  if (-[SIBaseNetworkE5RT _setupMetaDataFromLibrary](self, "_setupMetaDataFromLibrary"))
  {
    __SceneIntelligenceLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = self->_networkName;
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v28 = 1025;
      v29 = 144;
      v30 = 2112;
      p_isa = v25;
      _os_log_impl(&dword_21071A000, v24, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] Failed to get metadata for E5 Bundle (%@) ***", (uint8_t *)&v26, 0x1Cu);
    }

  }
  v22 = self;
LABEL_18:

  return v22;
}

- (int64_t)_loadModel:(id)a3 operation:(e5rt_execution_stream_operation *)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "UTF8String");
  -[NSString UTF8String](self->_e5Path, "UTF8String");
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
    v7 = 7;
  else
    v7 = 0;

  return v7;
}

- (int64_t)selectComputeOperationByFunctionName:(id)a3
{
  __CFString *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  __CFString *v11;
  __CFString *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  int64_t v15;
  NSObject *v16;
  NSString *e5Path;
  NSObject *v18;
  __CFString *v19;
  NSString *v20;
  const char *v21;
  NSObject *v22;
  __CFString *v23;
  NSString *v24;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  NSString *v29;
  NSObject *v30;
  __CFString *v31;
  NSString *v32;
  char v33;
  unint64_t i;
  void *v35;
  SIE5RTPort *v36;
  uint64_t v37;
  unsigned __int8 *v38;
  id v39;
  unsigned __int8 *v40;
  void *v41;
  unint64_t j;
  void *v43;
  SIE5RTPort *v44;
  uint64_t v45;
  unsigned __int8 *v46;
  id v47;
  unsigned __int8 *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id obj;
  void *v53[2];
  char v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void **v64;
  _BYTE __p[12];
  __int16 v66;
  int v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  NSString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = -[__CFString isEqualToString:](v4, "isEqualToString:", &stru_24CA5D420);
  v6 = CFSTR("main");
  if (!v5)
    v6 = v4;
  v7 = v6;

  v8 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v8, "UTF8String"));
  v9 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_e5rt_loaded_operations.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
  v10 = v9;
  if (SBYTE3(v69) < 0)
  {
    operator delete(*(void **)__p);
    if (v10)
      goto LABEL_7;
  }
  else if (v9)
  {
    goto LABEL_7;
  }
  v63 = 0;
  if (-[SIBaseNetworkE5RT _loadModel:operation:](self, "_loadModel:operation:", v8, &v63))
  {
    __SceneIntelligenceLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      e5Path = self->_e5Path;
      *(_DWORD *)__p = 136381443;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 194;
      v68 = 2113;
      v69 = v8;
      v70 = 2113;
      v71 = e5Path;
      _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create compute operation for function name: %{private}@, e5Path: %{private}@ ***", __p, 0x26u);
    }
    goto LABEL_33;
  }
  v61 = 0;
  v62 = 0;
  if (e5rt_execution_stream_operation_get_num_inputs())
  {
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 200);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 200;
      v68 = 2113;
      v69 = v19;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    v20 = self->_e5Path;
    *(_DWORD *)__p = 136381443;
    *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v66 = 1025;
    v67 = 200;
    v68 = 2113;
    v69 = v8;
    v70 = 2113;
    v71 = v20;
    v21 = " %{private}s:%{private}d *** Failed to get #inputs for function name: %{private}@, e5Path: %{private}@ ***";
    goto LABEL_32;
  }
  if (e5rt_execution_stream_operation_get_num_outputs())
  {
    __SceneIntelligenceLogSharedInstance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 203);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 203;
      v68 = 2113;
      v69 = v23;
      _os_log_impl(&dword_21071A000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    v24 = self->_e5Path;
    *(_DWORD *)__p = 136381443;
    *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v66 = 1025;
    v67 = 203;
    v68 = 2113;
    v69 = v8;
    v70 = 2113;
    v71 = v24;
    v21 = " %{private}s:%{private}d *** Failed to get #outputs for function name: %{private}@, e5Path: %{private}@ ***";
LABEL_32:
    _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_ERROR, v21, __p, 0x26u);
LABEL_33:

LABEL_34:
    v15 = 7;
    goto LABEL_35;
  }
  v59 = 0;
  v60 = 0;
  v58 = 0;
  v56 = 0;
  v57 = 0;
  v55 = 0;
  obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (e5rt_execution_stream_operation_get_input_names())
  {
    __SceneIntelligenceLogSharedInstance();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 214);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 214;
      v68 = 2113;
      v69 = v27;
      _os_log_impl(&dword_21071A000, v26, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = self->_e5Path;
      *(_DWORD *)__p = 136381443;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 214;
      v68 = 2113;
      v69 = v8;
      v70 = 2113;
      v71 = v29;
      _os_log_impl(&dword_21071A000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get input blob names for function name: %{private}@, e5Path: %{private}@ ***", __p, 0x26u);
    }
LABEL_47:

    v33 = 0;
    goto LABEL_48;
  }
  if (e5rt_execution_stream_operation_get_output_names())
  {
    __SceneIntelligenceLogSharedInstance();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 217);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 217;
      v68 = 2113;
      v69 = v31;
      _os_log_impl(&dword_21071A000, v30, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = self->_e5Path;
      *(_DWORD *)__p = 136381443;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v66 = 1025;
      v67 = 217;
      v68 = 2113;
      v69 = v8;
      v70 = 2113;
      v71 = v32;
      _os_log_impl(&dword_21071A000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get output blob names for function name: %{private}@, e5Path: %{private}@ ***", __p, 0x26u);
    }
    goto LABEL_47;
  }
  if (v62)
  {
    for (i = 0; i < v62; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v58 + i), v51);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "addObject:", v35);
      v36 = [SIE5RTPort alloc];
      v37 = -[SIE5RTPort initPortWithE5RTStreamOperation:blobName:portType:](v36, "initPortWithE5RTStreamOperation:blobName:portType:", v63, v35, 0);
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String"));
      v53[0] = __p;
      v38 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)v53);
      v39 = objc_retainAutorelease(v35);
      std::string::basic_string[abi:nn180100]<0>(v53, (char *)objc_msgSend(v39, "UTF8String"));
      v64 = v53;
      v40 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v38 + 40), (uint64_t)v53, (uint64_t)&std::piecewise_construct, (__int128 **)&v64);
      v41 = (void *)*((_QWORD *)v40 + 5);
      *((_QWORD *)v40 + 5) = v37;

      if (v54 < 0)
        operator delete(v53[0]);
      if (SBYTE3(v69) < 0)
        operator delete(*(void **)__p);

    }
  }
  if (v61)
  {
    for (j = 0; j < v61; ++j)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v55 + j), v51);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v43);
      v44 = [SIE5RTPort alloc];
      v45 = -[SIE5RTPort initPortWithE5RTStreamOperation:blobName:portType:](v44, "initPortWithE5RTStreamOperation:blobName:portType:", v63, v43, 1);
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String"));
      v53[0] = __p;
      v46 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)v53);
      v47 = objc_retainAutorelease(v43);
      std::string::basic_string[abi:nn180100]<0>(v53, (char *)objc_msgSend(v47, "UTF8String"));
      v64 = v53;
      v48 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v46 + 40), (uint64_t)v53, (uint64_t)&std::piecewise_construct, (__int128 **)&v64);
      v49 = (void *)*((_QWORD *)v48 + 5);
      *((_QWORD *)v48 + 5) = v45;

      if (v54 < 0)
        operator delete(v53[0]);
      if (SBYTE3(v69) < 0)
        operator delete(*(void **)__p);

    }
  }
  objc_storeStrong((id *)&self->_networkInputNames, obj);
  objc_storeStrong((id *)&self->_networkOutputNames, v51);
  v50 = v63;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String"));
  v53[0] = __p;
  *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_e5rt_loaded_operations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)v53)+ 5) = v50;
  if (SBYTE3(v69) < 0)
    operator delete(*(void **)__p);
  v33 = 1;
LABEL_48:

  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if ((v33 & 1) == 0)
    goto LABEL_34;
LABEL_7:
  v11 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v11, "UTF8String"));
  v58 = __p;
  self->_enabled_e5rt_operation = (e5rt_execution_stream_operation *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_e5rt_loaded_operations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v58)+ 5);
  if (SBYTE3(v69) < 0)
    operator delete(*(void **)__p);
  objc_storeStrong((id *)&self->_enabled_e5rt_function_name, v11);
  v12 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v12, "UTF8String"));
  v58 = __p;
  v13 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v58);
  if (&self->_inputs != (unordered_map<std::string, SIE5RTPort *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, SIE5RTPort *>>> *)(v13 + 40))
  {
    self->_inputs.__table_.__p3_.__value_ = *((float *)v13 + 18);
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *> *>>(&self->_inputs.__table_.__bucket_list_.__ptr_.__value_, *((uint64_t **)v13 + 7), 0);
  }
  if (SBYTE3(v69) < 0)
    operator delete(*(void **)__p);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String"));
  v58 = __p;
  v14 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v58);
  if (&self->_outputs != (unordered_map<std::string, SIE5RTPort *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, SIE5RTPort *>>> *)(v14 + 40))
  {
    self->_outputs.__table_.__p3_.__value_ = *((float *)v14 + 18);
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *> *>>(&self->_outputs.__table_.__bucket_list_.__ptr_.__value_, *((uint64_t **)v14 + 7), 0);
  }
  if (SBYTE3(v69) < 0)
    operator delete(*(void **)__p);
  v15 = 0;
LABEL_35:

  return v15;
}

- (void)dealloc
{
  NSArray *opsForLibrary;
  void *v4;
  objc_super v5;

  -[SIBaseNetworkE5RT reset](self, "reset");
  opsForLibrary = self->_opsForLibrary;
  if (opsForLibrary)
    CFRelease(opsForLibrary);
  if (self->_isModelCompiledInRuntime)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", self->_e5Path, 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)SIBaseNetworkE5RT;
  -[SIBaseNetworkE5RT dealloc](&v5, sel_dealloc);
}

- (int64_t)reset
{
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *p_p1;
  NSObject *v4;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *v5;
  NSObject *v6;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *next;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *v12;
  NSObject *v13;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[SIBaseNetworkE5RT unwirePrewiringBuffers](self, "unwirePrewiringBuffers");
  p_p1 = &self->_e5rt_loaded_operations.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    if (e5rt_execution_stream_operation_release())
    {
      __SceneIntelligenceLogSharedInstance();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 265);
        v5 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)objc_claimAutoreleasedReturnValue();
        v16 = 136381187;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        v18 = 1025;
        v19 = 265;
        v20 = 2113;
        v21 = v5;
        _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v16, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        next = p_p1 + 2;
        if (SHIBYTE(p_p1[4].__value_.__next_) < 0)
          next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)next->__value_.__next_;
        v16 = 136381187;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        v18 = 1025;
        v19 = 265;
        v20 = 2081;
        v21 = next;
        v8 = " %{private}s:%{private}d *** Failed to release loaded operation: %{private}s ***";
        v9 = v6;
        v10 = 28;
LABEL_23:
        _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v16, v10);
      }
LABEL_24:

      return 7;
    }
  }
  if (self->_stream && e5rt_execution_stream_release())
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 270);
      v12 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)objc_claimAutoreleasedReturnValue();
      v16 = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v18 = 1025;
      v19 = 270;
      v20 = 2113;
      v21 = v12;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v16, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v16 = 136380931;
    v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v18 = 1025;
    v19 = 270;
    v8 = " %{private}s:%{private}d *** Failed to release E5RT inference stream ***";
LABEL_22:
    v9 = v6;
    v10 = 18;
    goto LABEL_23;
  }
  if (self->_initPrewiringStream && e5rt_execution_stream_release())
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 276);
      v14 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)objc_claimAutoreleasedReturnValue();
      v16 = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v18 = 1025;
      v19 = 276;
      v20 = 2113;
      v21 = v14;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v16, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v16 = 136380931;
    v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v18 = 1025;
    v19 = 276;
    v8 = " %{private}s:%{private}d *** Failed to release E5RT ANEP stream ***";
    goto LABEL_22;
  }
  return 0;
}

- (int64_t)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4
{
  id v6;
  __IOSurface *IOSurface;
  uint64_t ID;
  unsigned __int8 *v9;
  int64_t v10;
  NSObject *v11;
  _BYTE __p[12];
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  IOSurface = CVPixelBufferGetIOSurface(a4);
  ID = IOSurfaceGetID(IOSurface);
  if (-[SIBaseNetworkE5RT IsPrewiringEnabled](self, "IsPrewiringEnabled")
    && !-[SIBaseNetworkE5RT IsSurfacePrewiredForCurrentFunctionForBlob:surfaceID:](self, "IsSurfacePrewiredForCurrentFunctionForBlob:surfaceID:", v6, ID))
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136381443;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v14 = 1025;
      v15 = 286;
      v16 = 1024;
      v17 = ID;
      v18 = 2113;
      v19 = v6;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to bind the buffer (id= %d) for blob (%{private}@) that was not ANEP ready ***", __p, 0x22u);
    }

    v10 = 3;
  }
  else
  {
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v9 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_inputs.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
    if (!v9)
      abort();
    if (SHIBYTE(v17) < 0)
      operator delete(*(void **)__p);
    v10 = objc_msgSend(*((id *)v9 + 5), "bindPixelBuffer:", a4);
  }

  return v10;
}

- (int64_t)setInput:(id)a3 fromRawPointer:(const void *)a4
{
  id v6;
  unsigned __int8 *v7;
  int64_t v8;
  void *__p[2];
  char v11;
  void **v12;

  v6 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v12 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v12);
  if (v11 < 0)
    operator delete(__p[0]);
  v8 = objc_msgSend(*((id *)v7 + 5), "bindRawPointer:", a4);

  return v8;
}

- (void)getInputPtr:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = (void *)objc_msgSend(*((id *)v5 + 5), "getDataPtr");

  return v6;
}

- (unint64_t)getInputWidth:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getWidth");

  return v6;
}

- (unint64_t)getInputHeight:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getHeight");

  return v6;
}

- (unint64_t)getInputChannels:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getChannels");

  return v6;
}

- (unint64_t)getInputLength:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getNumberOfElements");

  return v6;
}

- (int64_t)setOutputBlob:(id)a3 forOutputSurface:(__IOSurface *)a4
{
  id v6;
  uint64_t ID;
  unsigned __int8 *v8;
  int64_t v9;
  NSObject *v10;
  _BYTE __p[12];
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ID = IOSurfaceGetID(a4);
  if (-[SIBaseNetworkE5RT IsPrewiringEnabled](self, "IsPrewiringEnabled")
    && !-[SIBaseNetworkE5RT IsSurfacePrewiredForCurrentFunctionForBlob:surfaceID:](self, "IsSurfacePrewiredForCurrentFunctionForBlob:surfaceID:", v6, ID))
  {
    __SceneIntelligenceLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136381443;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v13 = 1025;
      v14 = 333;
      v15 = 1024;
      v16 = ID;
      v17 = 2113;
      v18 = v6;
      _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to bind the buffer (id= %d) for blob (%{private}@) that was not ANEP ready ***", __p, 0x22u);
    }

    v9 = 3;
  }
  else
  {
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v8 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_outputs.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
    if (!v8)
      abort();
    if (SHIBYTE(v16) < 0)
      operator delete(*(void **)__p);
    v9 = objc_msgSend(*((id *)v8 + 5), "bindIOSurface:", a4);
  }

  return v9;
}

- (void)getRawOutput:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = (void *)objc_msgSend(*((id *)v5 + 5), "getDataPtr");

  return v6;
}

- (__IOSurface)getOutputSurface:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  __IOSurface *v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = (__IOSurface *)objc_msgSend(*((id *)v5 + 5), "getIOSurface");

  return v6;
}

- (__n128)getOutputShape:(void *)a3
{
  id v4;
  unsigned __int8 *v5;
  int32x4_t *v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v10;
  void *__p[2];
  char v12;
  void **v13;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v13 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a1 + 248, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v13);
  if (v12 < 0)
    operator delete(__p[0]);
  v6 = (int32x4_t *)objc_msgSend(*((id *)v5 + 5), "getShape");
  v7 = vuzp1q_s32(*v6, v6[1]);
  v8 = vrev64q_s32(v7);
  v8.i64[0] = v7.i64[0];
  v10 = v8;

  return (__n128)v10;
}

- (unint64_t)getOutputWidth:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getWidth");

  return v6;
}

- (unint64_t)getOutputHeight:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getHeight");

  return v6;
}

- (unint64_t)getOutputChannels:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getChannels");

  return v6;
}

- (unint64_t)getOutputBatchNum:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getBatchnum");

  return v6;
}

- (unint64_t)getOutputLength:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getNumberOfElements");

  return v6;
}

- (unint64_t)getOutputRowElements:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getRowElements");

  return v6;
}

- (unint64_t)getOutputBytePerRow:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getBytePerRow");

  return v6;
}

- (unint64_t)getOutputComponentSize:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v10 = __p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  if (v9 < 0)
    operator delete(__p[0]);
  v6 = objc_msgSend(*((id *)v5 + 5), "getComponentSize");

  return v6;
}

- (id)getOpsForLibrary
{
  return self->_opsForLibrary;
}

- (BOOL)outputExists:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *__p[2];
  char v8;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::find<std::string>(&self->_outputs.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
  if (v8 < 0)
    operator delete(__p[0]);

  return v5 != 0;
}

- (int64_t)runNetwork
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (e5rt_execution_stream_encode_operation())
  {
    __SceneIntelligenceLogSharedInstance();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 430);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136381187;
      v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v13 = 1025;
      v14 = 430;
      v15 = 2113;
      v16 = v3;
      _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v11, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v11 = 136380931;
    v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v13 = 1025;
    v14 = 430;
    v5 = " %{private}s:%{private}d *** Failed to encode E5RT opeation into execution stream. ***";
    goto LABEL_16;
  }
  if (e5rt_execution_stream_execute_sync())
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 433);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136381187;
      v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v13 = 1025;
      v14 = 433;
      v15 = 2113;
      v16 = v7;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v11, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v11 = 136380931;
    v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v13 = 1025;
    v14 = 433;
    v5 = " %{private}s:%{private}d *** Failed to run execution stream. ***";
    goto LABEL_16;
  }
  if (!e5rt_execution_stream_reset())
    return 0;
  __SceneIntelligenceLogSharedInstance();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 436);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136381187;
    v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v13 = 1025;
    v14 = 436;
    v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v11, 0x1Cu);

  }
  __SceneIntelligenceLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v11 = 136380931;
    v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v13 = 1025;
    v14 = 436;
    v5 = " %{private}s:%{private}d *** Failed to reset execution stream. ***";
LABEL_16:
    _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v11, 0x12u);
  }
LABEL_17:

  return 7;
}

- (BOOL)supportFloat16IO
{
  return 1;
}

- (BOOL)supportZeroCopyOutput
{
  return 1;
}

- (id)networkVersion
{
  return self->_networkVersion;
}

- (id)networkName
{
  return self->_networkName;
}

- (int64_t)addPrewiringBuffersToStreamForFunctionName:(id)a3 inputPools:(id)a4 outputPools:(id)a5 clearWiredBuffer:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  unint64_t v22;
  unsigned __int8 *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSString *e5Path;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  id v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  SIE5RTPort *v40;
  id v41;
  unint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  int64x2_t v56;
  uint64_t v57;
  id v58;
  unsigned __int8 *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  id v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  SIE5RTPort *v70;
  id v71;
  unint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  _QWORD *v83;
  _QWORD *v84;
  uint64_t v85;
  int64x2_t v86;
  uint64_t v87;
  id v88;
  unsigned __int8 *v89;
  unint64_t v90;
  uint64_t *v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  NSObject *v103;
  void *v104;
  const char *v105;
  char v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  const char *v110;
  e5rt_execution_stream *initPrewiringStream;
  NSObject *v112;
  NSString *networkName;
  __int128 *n;
  id v115;
  _BYTE *v116;
  void *v117;
  uint64_t *ii;
  int v119;
  NSObject *v120;
  id v122;
  int64_t v123;
  id v124;
  id v125;
  void *context;
  NSArray *v128;
  NSArray *v129;
  uint64_t v130;
  uint64_t v131;
  id obj;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE buf[12];
  __int16 v152;
  int v153;
  __int16 v154;
  void *v155;
  __int16 v156;
  int v157;
  _BYTE __p[40];
  uint64_t *v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v6 = a6;
  v164 = *MEMORY[0x24BDAC8D0];
  v124 = a3;
  v9 = a4;
  v122 = a5;
  if (v6)
    -[SIBaseNetworkE5RT unwirePrewiringBuffersForFunctionName:](self, "unwirePrewiringBuffersForFunctionName:", v124);
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  obj = v9;
  v10 = 0;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v163, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v148;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v148 != v12)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v147 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        if (v10 <= v16)
          v10 = v16;

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v163, 16);
    }
    while (v11);
  }

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v133 = v122;
  v17 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v143, v162, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v144;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v144 != v18)
          objc_enumerationMutation(v133);
        v20 = *(id *)(*((_QWORD *)&v143 + 1) + 8 * j);
        objc_msgSend(v133, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");
        if (v10 <= v22)
          v10 = v22;

      }
      v17 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v143, v162, 16);
    }
    while (v17);
  }

  v125 = objc_retainAutorelease(v124);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v125, "UTF8String"));
  *(_QWORD *)buf = __p;
  v23 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
  if ((__p[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__p);
    if (!v10)
      goto LABEL_114;
    goto LABEL_25;
  }
  if (v10)
  {
LABEL_25:
    v24 = 0;
    v130 = (uint64_t)(v23 + 120);
    v131 = (uint64_t)(v23 + 64);
    v123 = 7;
    while (1)
    {
      context = (void *)MEMORY[0x212BCA840]();
      v142 = 0;
      -[NSString UTF8String](self->_e5Path, "UTF8String");
      -[NSString UTF8String](self->_e5Path, "UTF8String");
      objc_msgSend(objc_retainAutorelease(v125), "UTF8String");
      if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
        break;
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v128 = self->_networkInputNames;
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v138, v161, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v139;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v139 != v33)
              objc_enumerationMutation(v128);
            v35 = *(id *)(*((_QWORD *)&v138 + 1) + 8 * k);
            objc_msgSend(obj, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "count");

            objc_msgSend(obj, "objectForKeyedSubscript:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectAtIndexedSubscript:", v24 % v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = [SIE5RTPort alloc];
            v41 = -[SIE5RTPort initPortWithE5RTStreamOperation:blobName:portType:](v40, "initPortWithE5RTStreamOperation:blobName:portType:", v142, v35, 0);
            objc_msgSend(v41, "bindIOSurface:", v39);
            v43 = (_QWORD *)*((_QWORD *)v23 + 14);
            v42 = *((_QWORD *)v23 + 15);
            if ((unint64_t)v43 >= v42)
            {
              v45 = *((_QWORD *)v23 + 13);
              v46 = ((uint64_t)v43 - v45) >> 3;
              if ((unint64_t)(v46 + 1) >> 61)
                abort();
              v47 = v42 - v45;
              v48 = v47 >> 2;
              if (v47 >> 2 <= (unint64_t)(v46 + 1))
                v48 = v46 + 1;
              if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
                v49 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v49 = v48;
              *(_QWORD *)&__p[32] = v23 + 120;
              if (v49)
                v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>(v130, v49);
              else
                v50 = 0;
              v51 = &v50[8 * v46];
              v52 = &v50[8 * v49];
              *(_QWORD *)&__p[24] = v52;
              *(_QWORD *)v51 = v41;
              v44 = v51 + 8;
              *(_QWORD *)&__p[16] = v51 + 8;
              v54 = (_QWORD *)*((_QWORD *)v23 + 13);
              v53 = (_QWORD *)*((_QWORD *)v23 + 14);
              if (v53 == v54)
              {
                v56 = vdupq_n_s64((unint64_t)v53);
              }
              else
              {
                do
                {
                  v55 = *--v53;
                  *v53 = 0;
                  *((_QWORD *)v51 - 1) = v55;
                  v51 -= 8;
                }
                while (v53 != v54);
                v56 = *(int64x2_t *)(v23 + 104);
                v44 = *(_QWORD **)&__p[16];
                v52 = *(char **)&__p[24];
              }
              *((_QWORD *)v23 + 13) = v51;
              *((_QWORD *)v23 + 14) = v44;
              *(int64x2_t *)&__p[8] = v56;
              v57 = *((_QWORD *)v23 + 15);
              *((_QWORD *)v23 + 15) = v52;
              *(_QWORD *)&__p[24] = v57;
              *(_QWORD *)__p = v56.i64[0];
              std::__split_buffer<SIE5RTPort * {__strong}>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              *v43 = v41;
              v44 = v43 + 1;
            }
            *((_QWORD *)v23 + 14) = v44;
            v58 = objc_retainAutorelease(v35);
            std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v58, "UTF8String"));
            *(_QWORD *)buf = __p;
            v59 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v131, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
            *(_DWORD *)buf = IOSurfaceGetID((IOSurfaceRef)v39);
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(v59 + 40), (int *)buf, buf);
            if ((__p[23] & 0x80000000) != 0)
              operator delete(*(void **)__p);

          }
          v32 = -[NSArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v138, v161, 16);
        }
        while (v32);
      }

      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v129 = self->_networkOutputNames;
      v60 = -[NSArray countByEnumeratingWithState:objects:count:](v129, "countByEnumeratingWithState:objects:count:", &v134, v160, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v135;
        do
        {
          for (m = 0; m != v60; ++m)
          {
            if (*(_QWORD *)v135 != v61)
              objc_enumerationMutation(v129);
            v63 = *(id *)(*((_QWORD *)&v134 + 1) + 8 * m);
            objc_msgSend(v133, "objectForKey:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v64 == 0;

            if (v65)
            {
              std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v63), "UTF8String"));
              *(_QWORD *)buf = __p;
              v69 = (void *)objc_msgSend(*((id *)std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 5), "getIOSurface");
              if ((__p[23] & 0x80000000) != 0)
                operator delete(*(void **)__p);
            }
            else
            {
              objc_msgSend(v133, "objectForKeyedSubscript:", v63);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend(v66, "count");

              objc_msgSend(v133, "objectForKeyedSubscript:", v63);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "objectAtIndexedSubscript:", v24 % v67);
              v69 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v70 = [SIE5RTPort alloc];
            v71 = -[SIE5RTPort initPortWithE5RTStreamOperation:blobName:portType:](v70, "initPortWithE5RTStreamOperation:blobName:portType:", v142, v63, 1);
            objc_msgSend(v71, "bindIOSurface:", v69);
            v73 = (_QWORD *)*((_QWORD *)v23 + 14);
            v72 = *((_QWORD *)v23 + 15);
            if ((unint64_t)v73 >= v72)
            {
              v75 = *((_QWORD *)v23 + 13);
              v76 = ((uint64_t)v73 - v75) >> 3;
              if ((unint64_t)(v76 + 1) >> 61)
                abort();
              v77 = v72 - v75;
              v78 = v77 >> 2;
              if (v77 >> 2 <= (unint64_t)(v76 + 1))
                v78 = v76 + 1;
              if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
                v79 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v79 = v78;
              *(_QWORD *)&__p[32] = v23 + 120;
              if (v79)
                v80 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>(v130, v79);
              else
                v80 = 0;
              v81 = &v80[8 * v76];
              v82 = &v80[8 * v79];
              *(_QWORD *)&__p[24] = v82;
              *(_QWORD *)v81 = v71;
              v74 = v81 + 8;
              *(_QWORD *)&__p[16] = v81 + 8;
              v84 = (_QWORD *)*((_QWORD *)v23 + 13);
              v83 = (_QWORD *)*((_QWORD *)v23 + 14);
              if (v83 == v84)
              {
                v86 = vdupq_n_s64((unint64_t)v83);
              }
              else
              {
                do
                {
                  v85 = *--v83;
                  *v83 = 0;
                  *((_QWORD *)v81 - 1) = v85;
                  v81 -= 8;
                }
                while (v83 != v84);
                v86 = *(int64x2_t *)(v23 + 104);
                v74 = *(_QWORD **)&__p[16];
                v82 = *(char **)&__p[24];
              }
              *((_QWORD *)v23 + 13) = v81;
              *((_QWORD *)v23 + 14) = v74;
              *(int64x2_t *)&__p[8] = v86;
              v87 = *((_QWORD *)v23 + 15);
              *((_QWORD *)v23 + 15) = v82;
              *(_QWORD *)&__p[24] = v87;
              *(_QWORD *)__p = v86.i64[0];
              std::__split_buffer<SIE5RTPort * {__strong}>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              *v73 = v71;
              v74 = v73 + 1;
            }
            *((_QWORD *)v23 + 14) = v74;
            v88 = objc_retainAutorelease(v63);
            std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v88, "UTF8String"));
            *(_QWORD *)buf = __p;
            v89 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v131, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
            *(_DWORD *)buf = IOSurfaceGetID((IOSurfaceRef)v69);
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(v89 + 40), (int *)buf, buf);
            if ((__p[23] & 0x80000000) != 0)
              operator delete(*(void **)__p);

          }
          v60 = -[NSArray countByEnumeratingWithState:objects:count:](v129, "countByEnumeratingWithState:objects:count:", &v134, v160, 16);
        }
        while (v60);
      }

      v91 = (uint64_t *)*((_QWORD *)v23 + 6);
      v90 = *((_QWORD *)v23 + 7);
      if ((unint64_t)v91 >= v90)
      {
        v93 = *((_QWORD *)v23 + 5);
        v94 = ((uint64_t)v91 - v93) >> 3;
        if ((unint64_t)(v94 + 1) >> 61)
          abort();
        v95 = v90 - v93;
        v96 = v95 >> 2;
        if (v95 >> 2 <= (unint64_t)(v94 + 1))
          v96 = v94 + 1;
        if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFF8)
          v97 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v97 = v96;
        if (v97)
          v98 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>((uint64_t)(v23 + 56), v97);
        else
          v98 = 0;
        v99 = &v98[8 * v94];
        *(_QWORD *)v99 = v142;
        v92 = v99 + 8;
        v101 = (char *)*((_QWORD *)v23 + 5);
        v100 = (char *)*((_QWORD *)v23 + 6);
        if (v100 != v101)
        {
          do
          {
            v102 = *((_QWORD *)v100 - 1);
            v100 -= 8;
            *((_QWORD *)v99 - 1) = v102;
            v99 -= 8;
          }
          while (v100 != v101);
          v100 = (char *)*((_QWORD *)v23 + 5);
        }
        *((_QWORD *)v23 + 5) = v99;
        *((_QWORD *)v23 + 6) = v92;
        *((_QWORD *)v23 + 7) = &v98[8 * v97];
        if (v100)
          operator delete(v100);
      }
      else
      {
        *v91 = v142;
        v92 = v91 + 1;
      }
      *((_QWORD *)v23 + 6) = v92;
      if (!e5rt_execution_stream_encode_operation())
      {
        v106 = 1;
        goto LABEL_110;
      }
      __SceneIntelligenceLogSharedInstance();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 566);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__p = 136381187;
        *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        *(_WORD *)&__p[12] = 1025;
        *(_DWORD *)&__p[14] = 566;
        *(_WORD *)&__p[18] = 2113;
        *(_QWORD *)&__p[20] = v104;
        _os_log_impl(&dword_21071A000, v103, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v105 = "YES";
        if (!self->_initPrewiringStream)
          v105 = "NO";
        *(_DWORD *)__p = 136381187;
        *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        *(_WORD *)&__p[12] = 1025;
        *(_DWORD *)&__p[14] = 566;
        *(_WORD *)&__p[18] = 2081;
        *(_QWORD *)&__p[20] = v105;
        v29 = v27;
        v30 = " %{private}s:%{private}d *** Failed to encode operation into execution stream for ANEP. Has ANEP Stream in"
              "it: %{private}s ***";
        v31 = 28;
LABEL_108:
        _os_log_impl(&dword_21071A000, v29, OS_LOG_TYPE_ERROR, v30, __p, v31);
      }
LABEL_109:

      v106 = 0;
LABEL_110:
      objc_autoreleasePoolPop(context);
      if ((v106 & 1) == 0)
        goto LABEL_136;
      if (++v24 == v10)
        goto LABEL_114;
    }
    __SceneIntelligenceLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 533);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_WORD *)&__p[12] = 1025;
      *(_DWORD *)&__p[14] = 533;
      *(_WORD *)&__p[18] = 2113;
      *(_QWORD *)&__p[20] = v26;
      _os_log_impl(&dword_21071A000, v25, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_109;
    e5Path = self->_e5Path;
    *(_DWORD *)__p = 136381443;
    *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    *(_WORD *)&__p[12] = 1025;
    *(_DWORD *)&__p[14] = 533;
    *(_WORD *)&__p[18] = 2113;
    *(_QWORD *)&__p[20] = v125;
    *(_WORD *)&__p[28] = 2113;
    *(_QWORD *)&__p[30] = e5Path;
    v29 = v27;
    v30 = " %{private}s:%{private}d *** Failed to create compute operation for function name: %{private}@, e5Path: %{private}@ ***";
    v31 = 38;
    goto LABEL_108;
  }
LABEL_114:
  if (e5rt_execution_stream_prewire_in_use_allocations())
  {
    __SceneIntelligenceLogSharedInstance();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 571);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_WORD *)&__p[12] = 1025;
      *(_DWORD *)&__p[14] = 571;
      *(_WORD *)&__p[18] = 2113;
      *(_QWORD *)&__p[20] = v108;
      _os_log_impl(&dword_21071A000, v107, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v110 = "YES";
      initPrewiringStream = self->_initPrewiringStream;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_DWORD *)__p = 136381187;
      if (!initPrewiringStream)
        v110 = "NO";
      *(_WORD *)&__p[12] = 1025;
      *(_DWORD *)&__p[14] = 571;
      *(_WORD *)&__p[18] = 2081;
      *(_QWORD *)&__p[20] = v110;
      _os_log_impl(&dword_21071A000, v109, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to prewire collected buffers. Has ANEP Stream init: %{private}s ***", __p, 0x1Cu);
    }

    v123 = 7;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
    {
      networkName = self->_networkName;
      *(_DWORD *)__p = 136381443;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_WORD *)&__p[12] = 1025;
      *(_DWORD *)&__p[14] = 574;
      *(_WORD *)&__p[18] = 2113;
      *(_QWORD *)&__p[20] = networkName;
      *(_WORD *)&__p[28] = 2113;
      *(_QWORD *)&__p[30] = v125;
      _os_log_impl(&dword_21071A000, v112, OS_LOG_TYPE_DEBUG, " %{private}s:%{private}d *** ANEP info for %{private}@, function:%{private}@ ***", __p, 0x26u);
    }

    for (n = (__int128 *)*((_QWORD *)v23 + 10); n; n = *(__int128 **)n)
    {
      std::pair<std::string const,std::unordered_set<int>>::pair[abi:nn180100]((std::string *)__p, n + 1);
      v115 = objc_alloc(MEMORY[0x24BDD17C8]);
      if (__p[23] >= 0)
        v116 = __p;
      else
        v116 = *(_BYTE **)__p;
      v117 = (void *)objc_msgSend(v115, "initWithUTF8String:", v116);
      for (ii = v159; ii; ii = (uint64_t *)*ii)
      {
        v119 = *((_DWORD *)ii + 4);
        __SceneIntelligenceLogSharedInstance();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136381443;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
          v152 = 1025;
          v153 = 578;
          v154 = 2113;
          v155 = v117;
          v156 = 1024;
          v157 = v119;
          _os_log_impl(&dword_21071A000, v120, OS_LOG_TYPE_DEBUG, " %{private}s:%{private}d *** %{private}@ - %d ***", buf, 0x22u);
        }

      }
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&__p[24]);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
    }
    v123 = 0;
  }
LABEL_136:

  return v123;
}

- (int64_t)unwirePrewiringBuffersForFunctionName:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  __int128 **v6;
  __int128 **v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __int128 *v16;
  _BYTE __p[12];
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v16 = (__int128 *)__p;
  v5 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v16);
  if (SBYTE3(v21) < 0)
    operator delete(*(void **)__p);
  v6 = (__int128 **)*((_QWORD *)v5 + 5);
  v7 = (__int128 **)*((_QWORD *)v5 + 6);
  if (v6 == v7)
  {
LABEL_7:
    *((_QWORD *)v5 + 6) = v6;
    v8 = *((_QWORD *)v5 + 13);
    for (i = *((_QWORD *)v5 + 14); i != v8; i -= 8)
    {
      v10 = *(void **)(i - 8);

    }
    *((_QWORD *)v5 + 14) = v8;
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::clear((uint64_t)(v5 + 64));
    v11 = 0;
  }
  else
  {
    while (1)
    {
      v16 = *v6;
      if (e5rt_execution_stream_operation_release())
        break;
      if (++v6 == v7)
      {
        v6 = (__int128 **)*((_QWORD *)v5 + 5);
        goto LABEL_7;
      }
    }
    __SceneIntelligenceLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 590);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v18 = 1025;
      v19 = 590;
      v20 = 2113;
      v21 = v13;
      _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136381187;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v18 = 1025;
      v19 = 590;
      v20 = 2113;
      v21 = v4;
      _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to release ANEP for function: %{private}@ ***", __p, 0x1Cu);
    }

    v11 = 7;
  }

  return v11;
}

- (BOOL)IsPrewiringEnabled
{
  unordered_map<std::string, PrewiredFunctionInfo, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, PrewiredFunctionInfo>>> *p_prewiredFunctionTable;
  unsigned __int8 *v3;
  void *__p[2];
  char v6;
  void **v7;

  p_prewiredFunctionTable = &self->_prewiredFunctionTable;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[NSString UTF8String](self->_enabled_e5rt_function_name, "UTF8String"));
  v7 = __p;
  v3 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
  return *((_QWORD *)v3 + 11) != 0;
}

- (BOOL)IsSurfacePrewiredForCurrentFunctionForBlob:(id)a3 surfaceID:(int)a4
{
  id v6;
  unsigned __int8 *v7;
  id v8;
  _QWORD *v9;
  id v10;
  unsigned __int8 *v11;
  uint64_t *v12;
  BOOL v13;
  void *v15[2];
  char v16;
  void *v17[2];
  char v18;
  void *__p[2];
  char v20;
  int v21;
  void **v22;

  v6 = a3;
  v21 = a4;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[NSString UTF8String](self->_enabled_e5rt_function_name, "UTF8String"));
  v17[0] = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)v17);
  if (v20 < 0)
    operator delete(__p[0]);
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
  v9 = v7 + 64;
  if (std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(v9, (uint64_t)__p))
  {
    v10 = objc_retainAutorelease(v8);
    std::string::basic_string[abi:nn180100]<0>(v17, (char *)objc_msgSend(v10, "UTF8String"));
    v15[0] = v17;
    v11 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v9, (uint64_t)v17, (uint64_t)&std::piecewise_construct, (__int128 **)v15);
    v12 = std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>((_QWORD *)v11 + 5, &v21);
    std::string::basic_string[abi:nn180100]<0>(v15, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    v22 = v15;
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v9, (uint64_t)v15, (uint64_t)&std::piecewise_construct, (__int128 **)&v22);
    v13 = v12 != 0;
    if (v16 < 0)
      operator delete(v15[0]);
    if (v18 < 0)
      operator delete(v17[0]);
  }
  else
  {
    v13 = 0;
  }
  if (v20 < 0)
    operator delete(__p[0]);

  return v13;
}

- (int64_t)unwirePrewiringBuffers
{
  char *i;
  _QWORD *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  for (i = (char *)self->_prewiredFunctionTable.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    v4 = i + 16;
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (i[39] < 0)
      v4 = (_QWORD *)*v4;
    v6 = (void *)objc_msgSend(v5, "initWithUTF8String:", v4);
    -[SIBaseNetworkE5RT unwirePrewiringBuffersForFunctionName:](self, "unwirePrewiringBuffersForFunctionName:", v6);

  }
  std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::clear((uint64_t)&self->_prewiredFunctionTable);
  if (e5rt_execution_stream_release())
  {
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 622);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136381187;
      v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      v16 = 1025;
      v17 = 622;
      v18 = 2113;
      v19 = v8;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v14, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v14 = 136380931;
    v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v16 = 1025;
    v17 = 622;
    v10 = " %{private}s:%{private}d *** Failed to release E5RT ANEP stream ***";
    goto LABEL_15;
  }
  if (!e5rt_execution_stream_create())
    return 0;
  __SceneIntelligenceLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 625);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136381187;
    v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v16 = 1025;
    v17 = 625;
    v18 = 2113;
    v19 = v12;
    _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v14, 0x1Cu);

  }
  __SceneIntelligenceLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v14 = 136380931;
    v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    v16 = 1025;
    v17 = 625;
    v10 = " %{private}s:%{private}d *** Failed to create E5RT ANEP stream ***";
LABEL_15:
    _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, 0x12u);
  }
LABEL_16:

  return 7;
}

- (BOOL)prepare
{
  return 1;
}

- (id)networkInputNames
{
  return self->_networkInputNames;
}

- (id)networkOutputNames
{
  return self->_networkOutputNames;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::~__hash_table((uint64_t)&self->_prewiredFunctionTable);
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table((uint64_t)&self->_outputs);
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table((uint64_t)&self->_inputs);
  objc_storeStrong((id *)&self->_enabled_e5rt_function_name, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::~__hash_table((uint64_t)&self->_outputsForOperations);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::~__hash_table((uint64_t)&self->_inputsForOperations);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_e5rt_loaded_operations);
  objc_storeStrong((id *)&self->_networkOutputNames, 0);
  objc_storeStrong((id *)&self->_networkInputNames, 0);
  objc_storeStrong((id *)&self->_opsForLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_networkVersion, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_e5Path, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 46) = 1065353216;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  *((_DWORD *)self + 70) = 1065353216;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_DWORD *)self + 80) = 1065353216;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  return self;
}

@end
